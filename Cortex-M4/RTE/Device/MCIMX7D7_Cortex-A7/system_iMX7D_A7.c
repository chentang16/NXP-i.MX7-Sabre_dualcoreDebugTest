/******************************************************************************
 * @file     system_iMX7D_A7.c
 * @brief    CMSIS Device System Source File for ARM Cortex-A7 Device Series
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

#include "RTE_Components.h"
#include CMSIS_device_header
#include "irq_ctrl.h"

#define  SYSTEM_CLOCK  240000000UL

/*----------------------------------------------------------------------------
  System Core Clock Variable
 *----------------------------------------------------------------------------*/
uint32_t SystemCoreClock = SYSTEM_CLOCK;

/*----------------------------------------------------------------------------
  System Core Clock update function
 *----------------------------------------------------------------------------*/
void SystemCoreClockUpdate (void)
{
  SystemCoreClock = SYSTEM_CLOCK;
}

/*----------------------------------------------------------------------------
  System Initialization
 *----------------------------------------------------------------------------*/
void SystemInit (void)
{
/*       do not use global variables because this function is called before
         reaching pre-main. RW section may be overwritten afterwards.          */

  // Invalidate entire Unified TLB
  __set_TLBIALL(0);

  // Invalidate entire branch predictor array
  __set_BPIALL(0);
  __DSB();
  __ISB();

  //  Invalidate instruction cache and flush branch target cache
  __set_ICIALLU(0);
  __DSB();
  __ISB();

  //  Invalidate data cache
  L1C_InvalidateDCacheAll();

  // Create Translation Table
  MMU_CreateTranslationTable();

  // Enable MMU
  MMU_Enable();

  // Enable Caches
  L1C_EnableCaches();
  L1C_EnableBTAC();

#if (__L2C_PRESENT == 1) 
  // Enable L2C
  L2C_Enable();
#endif

#if ((__FPU_PRESENT == 1) && (__FPU_USED == 1))
  // Enable FPU
  __FPU_Enable();
#endif

  // IRQ initialize
  IRQ_Initialize();
}
