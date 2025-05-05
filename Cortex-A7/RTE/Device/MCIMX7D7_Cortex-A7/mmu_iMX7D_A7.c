/**************************************************************************//**
 * @file     mmu_iMX7D_A7.c
 * @brief    MMU Configuration for ARM Cortex-A7 Device Series
 * @version  V1.00
 * @date     26 Apr 2017
 *
 * @note
 *
 ******************************************************************************/
/*
 * Copyright (c) 2009-2017 ARM Limited. All rights reserved.
 *
 * SPDX-License-Identifier: Apache-2.0
 *
 * Licensed under the Apache License, Version 2.0 (the License); you may
 * not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an AS IS BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// L1 Cache info and restrictions about architecture of the caches (CCSIR register):
// Write-Through support *not* available
// Write-Back support available.
// Read allocation support available.
// Write allocation support available.

//Note: You should use the Shareable attribute carefully.
//For cores without coherency logic (such as SCU) marking a region as shareable forces the processor to not cache that region regardless of the inner cache settings.
//Cortex-A versions of RTX use LDREX/STREX instructions relying on Local monitors. Local monitors will be used only when the region gets cached, regions that are not cached will use the Global Monitor.
//Some Cortex-A implementations do not include Global Monitors, so wrongly setting the attribute Shareable may cause STREX to fail.

//Recall: When the Shareable attribute is applied to a memory region that is not Write-Back, Normal memory, data held in this region is treated as Non-cacheable.
//When SMP bit = 0, Inner WB/WA Cacheable Shareable attributes are treated as Non-cacheable.
//When SMP bit = 1, Inner WB/WA Cacheable Shareable attributes are treated as Cacheable.

//Following MMU configuration is expected
//SCTLR.AFE == 1 (Simplified access permissions model - AP[2:1] define access permissions, AP[0] is an access flag)
//SCTLR.TRE == 0 (TEX remap disabled, so memory type and attributes are described directly by bits in the descriptor)
//Domain 0 is always the Client domain
//Descriptors should place all memory in domain 0

#include "RTE_Components.h"
#include CMSIS_device_header

//Import symbols from linker
extern uint32_t Image$$VECTORS$$Base;
extern uint32_t Image$$RW_DATA$$Base;
extern uint32_t Image$$ZI_DATA$$Base;
extern uint32_t Image$$TTB$$ZI$$Base;

static uint32_t Sect_Normal;     //outer & inner wb/wa, non-shareable, executable, rw, domain 0, base addr 0
static uint32_t Sect_Normal_Cod; //outer & inner wb/wa, non-shareable, executable, ro, domain 0, base addr 0
static uint32_t Sect_Normal_RO;  //as Sect_Normal_Cod, but not executable
static uint32_t Sect_Normal_RW;  //as Sect_Normal_Cod, but writeable and not executable
static uint32_t Sect_Device_RO;  //device, non-shareable, non-executable, ro, domain 0, base addr 0
static uint32_t Sect_Device_RW;  //as Sect_Device_RO, but writeable

/* Define global descriptors */
static uint32_t Page_L1_4k  = 0x0;  //generic
static uint32_t Page_L1_64k = 0x0;  //generic
static uint32_t Page_4k_Device_RW;  //Shared device, not executable, rw, domain 0
static uint32_t Page_64k_Device_RW; //Shared device, not executable, rw, domain 0

void MMU_CreateTranslationTable(void)
{
  mmu_region_attributes_Type region;

  //Create 4GB of faulting entries
  MMU_TTSection (&Image$$TTB$$ZI$$Base, 0, 4096, DESCRIPTOR_FAULT);

  /*
   * Generate descriptors. Refer to core_ca.h to get information about attributes
   *
   */
  //Create descriptors for Vectors, RO, RW, ZI sections
  section_normal(Sect_Normal, region);
  section_normal_cod(Sect_Normal_Cod, region);
  section_normal_ro(Sect_Normal_RO, region);
  section_normal_rw(Sect_Normal_RW, region);
  //Create descriptors for peripherals
  section_device_ro(Sect_Device_RO, region);
  section_device_rw(Sect_Device_RW, region);
  //Create descriptors for 64k pages
  page64k_device_rw(Page_L1_64k, Page_64k_Device_RW, region);
  //Create descriptors for 4k pages
  page4k_device_rw(Page_L1_4k, Page_4k_Device_RW, region);


  /*
   *  Define MMU flat-map regions and attributes
   *
   */

  //Define Image
  MMU_TTSection (&Image$$TTB$$ZI$$Base, (uint32_t)&Image$$VECTORS$$Base, 1, Sect_Normal_Cod);
  MMU_TTSection (&Image$$TTB$$ZI$$Base, (uint32_t)&Image$$RW_DATA$$Base, 1, Sect_Normal_RW);
  MMU_TTSection (&Image$$TTB$$ZI$$Base, (uint32_t)&Image$$ZI_DATA$$Base, 1, Sect_Normal_RW);

  //all DRAM executable, rw, cacheable - applications may choose to divide memory into ro executable
  MMU_TTSection (&Image$$TTB$$ZI$$Base, (uint32_t)&Image$$TTB$$ZI$$Base, 2043, Sect_Normal);

  //--------------------- PERIPHERALS -------------------
  //TBD
  MMU_TTSection (&Image$$TTB$$ZI$$Base, 0x31000000U,    1, Sect_Device_RW);  /* GIC */
  MMU_TTSection (&Image$$TTB$$ZI$$Base, 0x30000000U,    4, Sect_Device_RW);  /* AIPS-1 */
  MMU_TTSection (&Image$$TTB$$ZI$$Base, 0x30400000U,    4, Sect_Device_RW);  /* AIPS-2 */
  MMU_TTSection (&Image$$TTB$$ZI$$Base, 0x30800000U,    4, Sect_Device_RW);  /* AIPS-3 */

  /* Set location of level 1 page table
  ; 31:14 - Translation table base addr (31:14-TTBCR.N, TTBCR.N is 0 out of reset)
  ; 13:7  - 0x0
  ; 6     - IRGN[0] 0x1  (Inner WB WA)
  ; 5     - NOS     0x0  (Non-shared)
  ; 4:3   - RGN     0x01 (Outer WB WA)
  ; 2     - IMP     0x0  (Implementation Defined)
  ; 1     - S       0x0  (Non-shared)
  ; 0     - IRGN[1] 0x0  (Inner WB WA) */
  __set_TTBR0(((uint32_t)&Image$$TTB$$ZI$$Base) | 0x48);
  __ISB();

  /* Set up domain access control register
  ; We set domain 0 to Client and all other domains to No Access.
  ; All translation table entries specify domain 0 */
  __set_DACR(1);
  __ISB();
}
