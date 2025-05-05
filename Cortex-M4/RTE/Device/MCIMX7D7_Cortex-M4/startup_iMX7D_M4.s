;/**************************************************************************//**
; * @file     startup_iMX7D_M4.s
; * @brief    CMSIS Core Device Startup File for
; *           iMX7D_M4 Device
; * @version  V1.00
; * @date     05. February 2016
; ******************************************************************************/
;/* Copyright (c) 2016 ARM LIMITED
;
;   All rights reserved.
;   Redistribution and use in source and binary forms, with or without
;   modification, are permitted provided that the following conditions are met:
;   - Redistributions of source code must retain the above copyright
;     notice, this list of conditions and the following disclaimer.
;   - Redistributions in binary form must reproduce the above copyright
;     notice, this list of conditions and the following disclaimer in the
;     documentation and/or other materials provided with the distribution.
;   - Neither the name of ARM nor the names of its contributors may be used
;     to endorse or promote products derived from this software without
;     specific prior written permission.
;   *
;   THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
;   AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
;   IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
;   ARE DISCLAIMED. IN NO EVENT SHALL COPYRIGHT HOLDERS AND CONTRIBUTORS BE
;   LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
;   CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
;   SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
;   INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
;   CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
;   ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
;   POSSIBILITY OF SUCH DAMAGE.
;   ---------------------------------------------------------------------------*/
;/*
;//-------- <<< Use Configuration Wizard in Context Menu >>> ------------------
;*/


; <h> Stack Configuration
;   <o> Stack Size (in Bytes) <0x0-0xFFFFFFFF:8>
; </h>

Stack_Size      EQU     0x00000400

                AREA    STACK, NOINIT, READWRITE, ALIGN=3
Stack_Mem       SPACE   Stack_Size
__initial_sp


; <h> Heap Configuration
;   <o>  Heap Size (in Bytes) <0x0-0xFFFFFFFF:8>
; </h>

Heap_Size       EQU     0x00000200

                AREA    HEAP, NOINIT, READWRITE, ALIGN=3
__heap_base
Heap_Mem        SPACE   Heap_Size
__heap_limit


                PRESERVE8
                THUMB


; Vector Table Mapped to Address 0 at Reset

                AREA    RESET, DATA, READONLY
                EXPORT  __Vectors
                EXPORT  __Vectors_End
                EXPORT  __Vectors_Size

__Vectors       DCD     __initial_sp                        ; 0   Top of Stack
                DCD     Reset_Handler                       ; 1   Reset Handler
                DCD     NMI_Handler                         ; 2   NMI Handler
                DCD     HardFault_Handler                   ; 3   Hard Fault Handler
                DCD     MemManage_Handler                   ; 4   MPU Fault Handler
                DCD     BusFault_Handler                    ; 5   Bus Fault Handler
                DCD     UsageFault_Handler                  ; 6   Usage Fault Handler
                DCD     0                                   ; 7   Reserved
                DCD     0                                   ; 8   Reserved
                DCD     0                                   ; 9   Reserved
                DCD     0                                   ; 10  Reserved
                DCD     SVC_Handler                         ; 11  SVCall Handler
                DCD     DebugMon_Handler                    ; 12  Debug Monitor Handler
                DCD     0                                   ; 13  Reserved
                DCD     PendSV_Handler                      ; 14  PendSV Handler
                DCD     SysTick_Handler                     ; 15  SysTick Handler

                                                            ;External Interrupts
                DCD     GPR_IRQ_IRQHandler                  ; 16+  0  GPR Interrupt. Used to notify cores on exception condition while boot.
                DCD     DAP_IRQHandler                      ; 16+  1  DAP Interrupt
                DCD     SDMA_IRQHandler                     ; 16+  2  AND of all 48 SDMA interrupts (events) from all the channels
                DCD     DBGMON_IRQHandler                   ; 16+  3  DBGMON Sync Interrupt
                DCD     SNVS_WRAPPER_IRQHandler             ; 16+  4  ON-OFF button press shorter than 5 seconds (pulse event)
                DCD     LCDIF_IRQHandler                    ; 16+  5  LCDIF Sync Interrupt
                DCD     SIM2_IRQHandler                     ; 16+  6  SIM2 Interrupt
                DCD     CSI_IRQHandler                      ; 16+  7  CSI Interrupt
                DCD     PXP_IRQ0_IRQHandler                 ; 16+  8  PXP Interrupt 0
                DCD     0                                   ; 16+  9  Reserved
                DCD     WDOG3_IRQHandler                    ; 16+ 10  Watchdog Timer reset
                DCD     HS_IRQ1_IRQHandler                  ; 16+ 11  HS Interrupt Request 1
                DCD     APBHDMA_IRQHandler                  ; 16+ 12  GPMI operation channel 0 description complete interrupt
                DCD     EIM_IRQHandler                      ; 16+ 13  EIM Interrupt
                DCD     BCH_IRQHandler                      ; 16+ 14  BCH operation complete interrupt
                DCD     GPMII_IRQHandler                    ; 16+ 15  GPMI operation TIMEOUT ERROR interrupt
                DCD     UART6_IRQHandler                    ; 16+ 16  UART-6 ORed interrupt
                DCD     FTM1_IRQHandler                     ; 16+ 17  Flex Timer1 Fault / Counter / Channel interrupt
                DCD     FTM2_IRQHandler                     ; 16+ 18  Flex Timer2 Fault / Counter / Channel interrupt
                DCD     SNVS_HP_WRAPPER1_IRQHandler         ; 16+ 19  SRTC Consolidated Interrupt. Non TZ.
                DCD     SNVS_HP_WRAPPER2_IRQHandler         ; 16+ 20  SRTC Security Interrupt. TZ.
                DCD     CSU_IRQHandler                      ; 16+ 21  CSU Interrupt Request. Indicates to the processor that one or more alarm inputs were asserted.
                DCD     USDHC1_IRQHandler                   ; 16+ 22  uSDHC1 Enhanced SDHC Interrupt Request
                DCD     USDHC2_IRQHandler                   ; 16+ 23  uSDHC2 Enhanced SDHC Interrupt Request
                DCD     USDHC3_IRQHandler                   ; 16+ 24  uSDHC3 Enhanced SDHC Interrupt Request
                DCD     MIPI_CSI_IRQHandler                 ; 16+ 25  MIPI CSI interrupt
                DCD     UART1_IRQHandler                    ; 16+ 26  UART-1 ORed interrupt
                DCD     UART2_IRQHandler                    ; 16+ 27  UART-2 ORed interrupt
                DCD     UART3_IRQHandler                    ; 16+ 28  UART-3 ORed interrupt
                DCD     UART4_IRQHandler                    ; 16+ 29  UART-4 ORed interrupt
                DCD     UART5_IRQHandler                    ; 16+ 30  UART-5 ORed interrupt
                DCD     eCSPI1_IRQHandler                   ; 16+ 31  eCSPI1 interrupt request line to the core.
                DCD     eCSPI2_IRQHandler                   ; 16+ 32  eCSPI2 interrupt request line to the core.
                DCD     eCSPI3_IRQHandler                   ; 16+ 33  eCSPI3 interrupt request line to the core.
                DCD     eCSPI4_IRQHandler                   ; 16+ 34  eCSPI4 interrupt request line to the core.
                DCD     I2C1_IRQHandler                     ; 16+ 35  I2C-1 Interrupt
                DCD     I2C2_IRQHandler                     ; 16+ 36  I2C-2 Interrupt
                DCD     I2C3_IRQHandler                     ; 16+ 37  I2C-3 Interrupt
                DCD     I2C4_IRQHandler                     ; 16+ 38  I2C-4 Interrupt
                DCD     RDC_IRQHandler                      ; 16+ 39  RDC interrupt
                DCD     USB_OH3_HOST_IRQHandler             ; 16+ 40  USB OH3 HOST
                DCD     MIPI_DSI_IRQHandler                 ; 16+ 41  DSI Interrupt
                DCD     USB_OH3_OTG_IRQHandler              ; 16+ 42  USB OH3 OTG
                DCD     USB_OH2_OTG_IRQHandler              ; 16+ 43  USB OH2 OTG
                DCD     USB_OTG1_IRQHandler                 ; 16+ 44  USB OTG1 Interrupt
                DCD     USB_OTG2_IRQHandler                 ; 16+ 45  USB OTG2 Interrupt
                DCD     PXP_IRQ1_IRQHandler                 ; 16+ 46  PXP Interrupt 1
                DCD     SCTR_IRQ0_IRQHandler                ; 16+ 47  ISO7816IP Interrupt 0
                DCD     SCTR_IRQ1_IRQHandler                ; 16+ 48  ISO7816IP Interrupt 1
                DCD     AnalogTempSensor_IRQHandler         ; 16+ 49  TempSensor (Temperature low alarm).
                DCD     SAI3_IRQHandler                     ; 16+ 50  SAI3 Receive / Transmit Interrupt
                DCD     AnalogBrownOut_IRQHandler           ; 16+ 51  Brown-out event on either analog regulators.
                DCD     GPT4_IRQHandler                     ; 16+ 52  OR of GPT Rollover interrupt line, Input Capture 1 and 2 lines, Output Compare 1, 2, and 3 Interrupt lines
                DCD     GPT3_IRQHandler                     ; 16+ 53  OR of GPT Rollover interrupt line, Input Capture 1 and 2 lines, Output Compare 1, 2, and 3 Interrupt lines
                DCD     GPT2_IRQHandler                     ; 16+ 54  OR of GPT Rollover interrupt line, Input Capture 1 and 2 lines, Output Compare 1, 2, and 3 Interrupt lines
                DCD     GPT1_IRQHandler                     ; 16+ 55  OR of GPT Rollover interrupt line, Input Capture 1 and 2 lines, Output Compare 1, 2, and 3 Interrupt lines
                DCD     GPIO1_INT7_IRQHandler               ; 16+ 56  Active HIGH Interrupt from INT7 from GPIO
                DCD     GPIO1_INT6_IRQHandler               ; 16+ 57  Active HIGH Interrupt from INT6 from GPIO
                DCD     GPIO1_INT5_IRQHandler               ; 16+ 58  Active HIGH Interrupt from INT5 from GPIO
                DCD     GPIO1_INT4_IRQHandler               ; 16+ 59  Active HIGH Interrupt from INT4 from GPIO
                DCD     GPIO1_INT3_IRQHandler               ; 16+ 60  Active HIGH Interrupt from INT3 from GPIO
                DCD     GPIO1_INT2_IRQHandler               ; 16+ 61  Active HIGH Interrupt from INT2 from GPIO
                DCD     GPIO1_INT1_IRQHandler               ; 16+ 62  Active HIGH Interrupt from INT1 from GPIO
                DCD     GPIO1_INT0_IRQHandler               ; 16+ 63  Active HIGH Interrupt from INT0 from GPIO
                DCD     GPIO1_Combined_0_15_IRQHandler      ; 16+ 64  Combined interrupt indication for GPIO1 signal 0 throughout 15
                DCD     GPIO1_Combined_16_31_IRQHandler     ; 16+ 65  Combined interrupt indication for GPIO1 signal 16 throughout 31
                DCD     GPIO2_Combined_0_15_IRQHandler      ; 16+ 66  Combined interrupt indication for GPIO2 signal 0 throughout 15
                DCD     GPIO2_Combined_16_31_IRQHandler     ; 16+ 67  Combined interrupt indication for GPIO2 signal 16 throughout 31
                DCD     GPIO3_Combined_0_15_IRQHandler      ; 16+ 68  Combined interrupt indication for GPIO3 signal 0 throughout 15
                DCD     GPIO3_Combined_16_31_IRQHandler     ; 16+ 69  Combined interrupt indication for GPIO3 signal 16 throughout 31
                DCD     GPIO4_Combined_0_15_IRQHandler      ; 16+ 70  Combined interrupt indication for GPIO4 signal 0 throughout 15
                DCD     GPIO4_Combined_16_31_IRQHandler     ; 16+ 71  Combined interrupt indication for GPIO4 signal 16 throughout 31
                DCD     GPIO5_Combined_0_15_IRQHandler      ; 16+ 72  Combined interrupt indication for GPIO5 signal 0 throughout 15
                DCD     GPIO5_Combined_16_31_IRQHandler     ; 16+ 73  Combined interrupt indication for GPIO5 signal 16 throughout 31
                DCD     GPIO6_Combined_0_15_IRQHandler      ; 16+ 74  Combined interrupt indication for GPIO6 signal 0 throughout 15
                DCD     GPIO6_Combined_16_31_IRQHandler     ; 16+ 75  Combined interrupt indication for GPIO6 signal 16 throughout 31
                DCD     GPIO7_Combined_0_15_IRQHandler      ; 16+ 76  Combined interrupt indication for GPIO7 signal 0 throughout 15
                DCD     GPIO7_Combined_16_31_IRQHandler     ; 16+ 77  Combined interrupt indication for GPIO7 signal 16 throughout 31
                DCD     WDOG1_IRQHandler                    ; 16+ 78  Watchdog Timer reset
                DCD     WDOG2_IRQHandler                    ; 16+ 79  Watchdog Timer reset
                DCD     KPP_IRQHandler                      ; 16+ 80  Keypad Interrupt
                DCD     PWM1_IRQHandler                     ; 16+ 81  Cumulative interrupt line. OR of Rollover Interrupt line, Compare Interrupt line and FIFO Waterlevel crossing interrupt line.
                DCD     PWM2_IRQHandler                     ; 16+ 82  Cumulative interrupt line. OR of Rollover Interrupt line, Compare Interrupt line and FIFO Waterlevel crossing interrupt line.
                DCD     PWM3_IRQHandler                     ; 16+ 83  Cumulative interrupt line. OR of Rollover Interrupt line, Compare Interrupt line and FIFO Waterlevel crossing interrupt line.
                DCD     PWM4_IRQHandler                     ; 16+ 84  Cumulative interrupt line. OR of Rollover Interrupt line, Compare Interrupt line and FIFO Waterlevel crossing interrupt line.
                DCD     CCM1_IRQHandler                     ; 16+ 85  CCM, Interrupt Request 1
                DCD     CCM2_IRQHandler                     ; 16+ 86  CCM, Interrupt Request 2
                DCD     GPC_IRQHandler                      ; 16+ 87  GPC Interrupt Request 1
                DCD     MU_A7_IRQHandler                    ; 16+ 88  Interrupt to A7
                DCD     SRC_IRQHandler                      ; 16+ 89  SRC interrupt request
                DCD     SIM1_IRQHandler                     ; 16+ 90  SIM1 Interrupt
                DCD     RTIC_IRQHandler                     ; 16+ 91  RTIC Interrupt
                DCD     CPU_PMUIRQn_IRQHandler              ; 16+ 92  Performance Unit Interrupts from Cheetah (interrnally: PMUIRQ[n]
                DCD     CPU_CTIIRQn_IRQHandler              ; 16+ 93  CTI trigger outputs (internal: nCTIIRQ[n]
                DCD     CCM_SRC_GPC_IRQHandler              ; 16+ 94  Combined CPU wdog interrupts (4x) out of SRC.
                DCD     SAI1_IRQHandler                     ; 16+ 95  SAI1 Receive / Transmit Interrupt
                DCD     SAI2_IRQHandler                     ; 16+ 96  SAI2 Receive / Transmit Interrupt
                DCD     MU_M4_IRQHandler                    ; 16+ 97  Interrupt to M4
                DCD     ADC1_IRQHandler                     ; 16+ 98  ADC-1 Interrupt
                DCD     ADC2_IRQHandler                     ; 16+ 99  ADC-2 Interrupt
                DCD     ENET2_MAC0_Rx_Tx_Done1_IRQHandler   ; 16+100  MAC 0 Receive / Transmit Frame / Buffer Done
                DCD     ENET2_MAC0_Rx_Tx_Done2_IRQHandler   ; 16+101  MAC 0 Receive / Transmit Frame / Buffer Done
                DCD     ENET2_MAC0_IRQ_IRQHandler           ; 16+102  MAC 0 IRQ
                DCD     ENET2_MAC0_TimerInt_IRQHandler      ; 16+103  MAC 0 1588 Timer Interrupt - synchronous
                DCD     TPR_IRQ_IRQHandler                  ; 16+104  TPR IRQ
                DCD     CAAM_WRAPPER0_IRQHandler            ; 16+105  CAAM interrupt queue for JQ
                DCD     CAAM_WRAPPER1_IRQHandler            ; 16+106  CAAM interrupt queue for JQ
                DCD     QSPI_IRQHandler                     ; 16+107  QSPI Interrupt
                DCD     TZASC1_IRQHandler                   ; 16+108  TZASC (PL380) interrupt
                DCD     WDOG4_IRQHandler                    ; 16+109  Watchdog Timer reset
                DCD     FLEXCAN1_IRQHandler                 ; 16+110  FlexCAN1 Interrupt
                DCD     FLEXCAN2_IRQHandler                 ; 16+111  FlexCAN2 Interrupt
                DCD     PERFMON1_IRQHandler                 ; 16+112  General Interrupt
                DCD     PERFMON2_IRQHandler                 ; 16+113  General Interrupt
                DCD     CAAM_WRAPPER2_IRQHandler            ; 16+114  CAAM interrupt queue for JQ
                DCD     CAAM_WRAPPER3_IRQHandler            ; 16+115  Recoverable error interrupt
                DCD     HS_IRQ0_IRQHandler                  ; 16+116  HS Interrupt Request 0
                DCD     EPDC_IRQHandler                     ; 16+117  EPDC Interrupt
                DCD     ENET1_MAC0_Rx_Tx_Done1_IRQHandler   ; 16+118  MAC 0 Receive / Trasmit Frame / Buffer Done
                DCD     ENET1_MAC0_Rx_Tx_Done2_IRQHandler   ; 16+119  MAC 0 Receive / Trasmit Frame / Buffer Done
                DCD     ENET1_MAC0_IRQ_IRQHandler           ; 16+120  MAC 0 IRQ
                DCD     ENET1_MAC0_TimerInt_IRQHandler      ; 16+121  MAC 0 1588 Timer Interrupt â€Â“ synchronous
                DCD     PCIE_CTRL_IRQ0_IRQHandler           ; 16+122  Coming from GLUE logic, of set / reset FF, driven by PCIE signals.
                DCD     PCIE_CTRL_IRQ1_IRQHandler           ; 16+123  Coming from GLUE logic, of set / reset FF, driven by PCIE signals.
                DCD     PCIE_CTRL_IRQ2_IRQHandler           ; 16+124  Coming from GLUE logic, of set / reset FF, driven by PCIE signals.
                DCD     PCIE_CTRL_IRQ3_IRQHandler           ; 16+125  Coming from GLUE logic, of set / reset FF, driven by PCIE signals.
                DCD     UART7_IRQHandler                    ; 16+126  UART-7 ORed interrupt
                DCD     PCIE_CTRL_IRQHandler                ; 16+127  Channels [63:32] interrupts requests
__Vectors_End

__Vectors_Size 	EQU     __Vectors_End - __Vectors

                AREA    |.text|, CODE, READONLY

; Reset Handler

Reset_Handler   PROC
                EXPORT  Reset_Handler                       [WEAK]
                IMPORT  SystemInit
                IMPORT  __main

                CPSID   I               ; Mask interrupts
                LDR     R0, =SystemInit
                BLX     R0
                CPSIE   i               ; Unmask interrupts
                LDR     R0, =__main
                BX      R0
                ENDP


; Dummy Exception Handlers (infinite loops which can be modified)

NMI_Handler     PROC
                EXPORT  NMI_Handler                         [WEAK]
                B       .
                ENDP
HardFault_Handler\
                PROC
                EXPORT  HardFault_Handler                   [WEAK]
                B       .
                ENDP
MemManage_Handler\
                PROC
                EXPORT  MemManage_Handler                   [WEAK]
                B       .
                ENDP
BusFault_Handler\
                PROC
                EXPORT  BusFault_Handler                    [WEAK]
                B       .
                ENDP
UsageFault_Handler\
                PROC
                EXPORT  UsageFault_Handler                  [WEAK]
                B       .
                ENDP
SVC_Handler     PROC
                EXPORT  SVC_Handler                         [WEAK]
                B       .
                ENDP
DebugMon_Handler\
                PROC
                EXPORT  DebugMon_Handler                    [WEAK]
                B       .
                ENDP
PendSV_Handler  PROC
                EXPORT  PendSV_Handler                      [WEAK]
                B       .
                ENDP
SysTick_Handler PROC
                EXPORT  SysTick_Handler                     [WEAK]
                B       .
                ENDP

Default_Handler PROC
                EXPORT  GPR_IRQ_IRQHandler                  [WEAK]
                EXPORT  DAP_IRQHandler                      [WEAK]
                EXPORT  SDMA_IRQHandler                     [WEAK]
                EXPORT  DBGMON_IRQHandler                   [WEAK]
                EXPORT  SNVS_WRAPPER_IRQHandler             [WEAK]
                EXPORT  LCDIF_IRQHandler                    [WEAK]
                EXPORT  SIM2_IRQHandler                     [WEAK]
                EXPORT  CSI_IRQHandler                      [WEAK]
                EXPORT  PXP_IRQ0_IRQHandler                 [WEAK]
                EXPORT  WDOG3_IRQHandler                    [WEAK]
                EXPORT  HS_IRQ1_IRQHandler                  [WEAK]
                EXPORT  APBHDMA_IRQHandler                  [WEAK]
                EXPORT  EIM_IRQHandler                      [WEAK]
                EXPORT  BCH_IRQHandler                      [WEAK]
                EXPORT  GPMII_IRQHandler                    [WEAK]
                EXPORT  UART6_IRQHandler                    [WEAK]
                EXPORT  FTM1_IRQHandler                     [WEAK]
                EXPORT  FTM2_IRQHandler                     [WEAK]
                EXPORT  SNVS_HP_WRAPPER1_IRQHandler         [WEAK]
                EXPORT  SNVS_HP_WRAPPER2_IRQHandler         [WEAK]
                EXPORT  CSU_IRQHandler                      [WEAK]
                EXPORT  USDHC1_IRQHandler                   [WEAK]
                EXPORT  USDHC2_IRQHandler                   [WEAK]
                EXPORT  USDHC3_IRQHandler                   [WEAK]
                EXPORT  MIPI_CSI_IRQHandler                 [WEAK]
                EXPORT  UART1_IRQHandler                    [WEAK]
                EXPORT  UART2_IRQHandler                    [WEAK]
                EXPORT  UART3_IRQHandler                    [WEAK]
                EXPORT  UART4_IRQHandler                    [WEAK]
                EXPORT  UART5_IRQHandler                    [WEAK]
                EXPORT  eCSPI1_IRQHandler                   [WEAK]
                EXPORT  eCSPI2_IRQHandler                   [WEAK]
                EXPORT  eCSPI3_IRQHandler                   [WEAK]
                EXPORT  eCSPI4_IRQHandler                   [WEAK]
                EXPORT  I2C1_IRQHandler                     [WEAK]
                EXPORT  I2C2_IRQHandler                     [WEAK]
                EXPORT  I2C3_IRQHandler                     [WEAK]
                EXPORT  I2C4_IRQHandler                     [WEAK]
                EXPORT  RDC_IRQHandler                      [WEAK]
                EXPORT  USB_OH3_HOST_IRQHandler             [WEAK]
                EXPORT  MIPI_DSI_IRQHandler                 [WEAK]
                EXPORT  USB_OH3_OTG_IRQHandler              [WEAK]
                EXPORT  USB_OH2_OTG_IRQHandler              [WEAK]
                EXPORT  USB_OTG1_IRQHandler                 [WEAK]
                EXPORT  USB_OTG2_IRQHandler                 [WEAK]
                EXPORT  PXP_IRQ1_IRQHandler                 [WEAK]
                EXPORT  SCTR_IRQ0_IRQHandler                [WEAK]
                EXPORT  SCTR_IRQ1_IRQHandler                [WEAK]
                EXPORT  AnalogTempSensor_IRQHandler         [WEAK]
                EXPORT  SAI3_IRQHandler                     [WEAK]
                EXPORT  AnalogBrownOut_IRQHandler           [WEAK]
                EXPORT  GPT4_IRQHandler                     [WEAK]
                EXPORT  GPT3_IRQHandler                     [WEAK]
                EXPORT  GPT2_IRQHandler                     [WEAK]
                EXPORT  GPT1_IRQHandler                     [WEAK]
                EXPORT  GPIO1_INT7_IRQHandler               [WEAK]
                EXPORT  GPIO1_INT6_IRQHandler               [WEAK]
                EXPORT  GPIO1_INT5_IRQHandler               [WEAK]
                EXPORT  GPIO1_INT4_IRQHandler               [WEAK]
                EXPORT  GPIO1_INT3_IRQHandler               [WEAK]
                EXPORT  GPIO1_INT2_IRQHandler               [WEAK]
                EXPORT  GPIO1_INT1_IRQHandler               [WEAK]
                EXPORT  GPIO1_INT0_IRQHandler               [WEAK]
                EXPORT  GPIO1_Combined_0_15_IRQHandler      [WEAK]
                EXPORT  GPIO1_Combined_16_31_IRQHandler     [WEAK]
                EXPORT  GPIO2_Combined_0_15_IRQHandler      [WEAK]
                EXPORT  GPIO2_Combined_16_31_IRQHandler     [WEAK]
                EXPORT  GPIO3_Combined_0_15_IRQHandler      [WEAK]
                EXPORT  GPIO3_Combined_16_31_IRQHandler     [WEAK]
                EXPORT  GPIO4_Combined_0_15_IRQHandler      [WEAK]
                EXPORT  GPIO4_Combined_16_31_IRQHandler     [WEAK]
                EXPORT  GPIO5_Combined_0_15_IRQHandler      [WEAK]
                EXPORT  GPIO5_Combined_16_31_IRQHandler     [WEAK]
                EXPORT  GPIO6_Combined_0_15_IRQHandler      [WEAK]
                EXPORT  GPIO6_Combined_16_31_IRQHandler     [WEAK]
                EXPORT  GPIO7_Combined_0_15_IRQHandler      [WEAK]
                EXPORT  GPIO7_Combined_16_31_IRQHandler     [WEAK]
                EXPORT  WDOG1_IRQHandler                    [WEAK]
                EXPORT  WDOG2_IRQHandler                    [WEAK]
                EXPORT  KPP_IRQHandler                      [WEAK]
                EXPORT  PWM1_IRQHandler                     [WEAK]
                EXPORT  PWM2_IRQHandler                     [WEAK]
                EXPORT  PWM3_IRQHandler                     [WEAK]
                EXPORT  PWM4_IRQHandler                     [WEAK]
                EXPORT  CCM1_IRQHandler                     [WEAK]
                EXPORT  CCM2_IRQHandler                     [WEAK]
                EXPORT  GPC_IRQHandler                      [WEAK]
                EXPORT  MU_A7_IRQHandler                    [WEAK]
                EXPORT  SRC_IRQHandler                      [WEAK]
                EXPORT  SIM1_IRQHandler                     [WEAK]
                EXPORT  RTIC_IRQHandler                     [WEAK]
                EXPORT  CPU_PMUIRQn_IRQHandler              [WEAK]
                EXPORT  CPU_CTIIRQn_IRQHandler              [WEAK]
                EXPORT  CCM_SRC_GPC_IRQHandler              [WEAK]
                EXPORT  SAI1_IRQHandler                     [WEAK]
                EXPORT  SAI2_IRQHandler                     [WEAK]
                EXPORT  MU_M4_IRQHandler                    [WEAK]
                EXPORT  ADC1_IRQHandler                     [WEAK]
                EXPORT  ADC2_IRQHandler                     [WEAK]
                EXPORT  ENET2_MAC0_Rx_Tx_Done1_IRQHandler   [WEAK]
                EXPORT  ENET2_MAC0_Rx_Tx_Done2_IRQHandler   [WEAK]
                EXPORT  ENET2_MAC0_IRQ_IRQHandler           [WEAK]
                EXPORT  ENET2_MAC0_TimerInt_IRQHandler      [WEAK]
                EXPORT  TPR_IRQ_IRQHandler                  [WEAK]
                EXPORT  CAAM_WRAPPER0_IRQHandler            [WEAK]
                EXPORT  CAAM_WRAPPER1_IRQHandler            [WEAK]
                EXPORT  QSPI_IRQHandler                     [WEAK]
                EXPORT  TZASC1_IRQHandler                   [WEAK]
                EXPORT  WDOG4_IRQHandler                    [WEAK]
                EXPORT  FLEXCAN1_IRQHandler                 [WEAK]
                EXPORT  FLEXCAN2_IRQHandler                 [WEAK]
                EXPORT  PERFMON1_IRQHandler                 [WEAK]
                EXPORT  PERFMON2_IRQHandler                 [WEAK]
                EXPORT  CAAM_WRAPPER2_IRQHandler            [WEAK]
                EXPORT  CAAM_WRAPPER3_IRQHandler            [WEAK]
                EXPORT  HS_IRQ0_IRQHandler                  [WEAK]
                EXPORT  EPDC_IRQHandler                     [WEAK]
                EXPORT  ENET1_MAC0_Rx_Tx_Done1_IRQHandler   [WEAK]
                EXPORT  ENET1_MAC0_Rx_Tx_Done2_IRQHandler   [WEAK]
                EXPORT  ENET1_MAC0_IRQ_IRQHandler           [WEAK]
                EXPORT  ENET1_MAC0_TimerInt_IRQHandler      [WEAK]
                EXPORT  PCIE_CTRL_IRQ0_IRQHandler           [WEAK]
                EXPORT  PCIE_CTRL_IRQ1_IRQHandler           [WEAK]
                EXPORT  PCIE_CTRL_IRQ2_IRQHandler           [WEAK]
                EXPORT  PCIE_CTRL_IRQ3_IRQHandler           [WEAK]
                EXPORT  UART7_IRQHandler                    [WEAK]
                EXPORT  PCIE_CTRL_IRQHandler                [WEAK]

GPR_IRQ_IRQHandler
DAP_IRQHandler
SDMA_IRQHandler
DBGMON_IRQHandler
SNVS_WRAPPER_IRQHandler
LCDIF_IRQHandler
SIM2_IRQHandler
CSI_IRQHandler
PXP_IRQ0_IRQHandler
WDOG3_IRQHandler
HS_IRQ1_IRQHandler
APBHDMA_IRQHandler
EIM_IRQHandler
BCH_IRQHandler
GPMII_IRQHandler
UART6_IRQHandler
FTM1_IRQHandler
FTM2_IRQHandler
SNVS_HP_WRAPPER1_IRQHandler
SNVS_HP_WRAPPER2_IRQHandler
CSU_IRQHandler
USDHC1_IRQHandler
USDHC2_IRQHandler
USDHC3_IRQHandler
MIPI_CSI_IRQHandler
UART1_IRQHandler
UART2_IRQHandler
UART3_IRQHandler
UART4_IRQHandler
UART5_IRQHandler
eCSPI1_IRQHandler
eCSPI2_IRQHandler
eCSPI3_IRQHandler
eCSPI4_IRQHandler
I2C1_IRQHandler
I2C2_IRQHandler
I2C3_IRQHandler
I2C4_IRQHandler
RDC_IRQHandler
USB_OH3_HOST_IRQHandler
MIPI_DSI_IRQHandler
USB_OH3_OTG_IRQHandler
USB_OH2_OTG_IRQHandler
USB_OTG1_IRQHandler
USB_OTG2_IRQHandler
PXP_IRQ1_IRQHandler
SCTR_IRQ0_IRQHandler
SCTR_IRQ1_IRQHandler
AnalogTempSensor_IRQHandler
SAI3_IRQHandler
AnalogBrownOut_IRQHandler
GPT4_IRQHandler
GPT3_IRQHandler
GPT2_IRQHandler
GPT1_IRQHandler
GPIO1_INT7_IRQHandler
GPIO1_INT6_IRQHandler
GPIO1_INT5_IRQHandler
GPIO1_INT4_IRQHandler
GPIO1_INT3_IRQHandler
GPIO1_INT2_IRQHandler
GPIO1_INT1_IRQHandler
GPIO1_INT0_IRQHandler
GPIO1_Combined_0_15_IRQHandler
GPIO1_Combined_16_31_IRQHandler
GPIO2_Combined_0_15_IRQHandler
GPIO2_Combined_16_31_IRQHandler
GPIO3_Combined_0_15_IRQHandler
GPIO3_Combined_16_31_IRQHandler
GPIO4_Combined_0_15_IRQHandler
GPIO4_Combined_16_31_IRQHandler
GPIO5_Combined_0_15_IRQHandler
GPIO5_Combined_16_31_IRQHandler
GPIO6_Combined_0_15_IRQHandler
GPIO6_Combined_16_31_IRQHandler
GPIO7_Combined_0_15_IRQHandler
GPIO7_Combined_16_31_IRQHandler
WDOG1_IRQHandler
WDOG2_IRQHandler
KPP_IRQHandler
PWM1_IRQHandler
PWM2_IRQHandler
PWM3_IRQHandler
PWM4_IRQHandler
CCM1_IRQHandler
CCM2_IRQHandler
GPC_IRQHandler
MU_A7_IRQHandler
SRC_IRQHandler
SIM1_IRQHandler
RTIC_IRQHandler
CPU_PMUIRQn_IRQHandler
CPU_CTIIRQn_IRQHandler
CCM_SRC_GPC_IRQHandler
SAI1_IRQHandler
SAI2_IRQHandler
MU_M4_IRQHandler
ADC1_IRQHandler
ADC2_IRQHandler
ENET2_MAC0_Rx_Tx_Done1_IRQHandler
ENET2_MAC0_Rx_Tx_Done2_IRQHandler
ENET2_MAC0_IRQ_IRQHandler
ENET2_MAC0_TimerInt_IRQHandler
TPR_IRQ_IRQHandler
CAAM_WRAPPER0_IRQHandler
CAAM_WRAPPER1_IRQHandler
QSPI_IRQHandler
TZASC1_IRQHandler
WDOG4_IRQHandler
FLEXCAN1_IRQHandler
FLEXCAN2_IRQHandler
PERFMON1_IRQHandler
PERFMON2_IRQHandler
CAAM_WRAPPER2_IRQHandler
CAAM_WRAPPER3_IRQHandler
HS_IRQ0_IRQHandler
EPDC_IRQHandler
ENET1_MAC0_Rx_Tx_Done1_IRQHandler
ENET1_MAC0_Rx_Tx_Done2_IRQHandler
ENET1_MAC0_IRQ_IRQHandler
ENET1_MAC0_TimerInt_IRQHandler
PCIE_CTRL_IRQ0_IRQHandler
PCIE_CTRL_IRQ1_IRQHandler
PCIE_CTRL_IRQ2_IRQHandler
PCIE_CTRL_IRQ3_IRQHandler
UART7_IRQHandler
PCIE_CTRL_IRQHandler
                B       .
                ENDP

                ALIGN


; User Initial Stack & Heap

                IF      :DEF:__MICROLIB

                EXPORT  __initial_sp
                EXPORT  __heap_base
                EXPORT  __heap_limit

                ELSE

                IMPORT  __use_two_region_memory
                EXPORT  __user_initial_stackheap
__user_initial_stackheap

                LDR     R0, =  Heap_Mem
                LDR     R1, =(Stack_Mem + Stack_Size)
                LDR     R2, = (Heap_Mem +  Heap_Size)
                LDR     R3, = Stack_Mem
                BX      LR

                ALIGN

                ENDIF


                END
