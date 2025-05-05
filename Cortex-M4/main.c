/*----------------------------------------------------------------------------
 *      main Template for CMSIS RTE C/C++ Project
 *----------------------------------------------------------------------------
 *      Name:    main.c
 *      Purpose: Generic main program body including main() function
 *      Rev.:    1.0.0
 *----------------------------------------------------------------------------*/
/*******************************************************************************
* Copyright (c) 2015 ARM Ltd. and others
* All rights reserved. This program and the accompanying materials
* are made available under the terms of the Eclipse Public License v1.0
* which accompanies this distribution, and is available at
* http://www.eclipse.org/legal/epl-v10.html
*
* Contributors:
* ARM Ltd and ARM Germany GmbH - file template
*******************************************************************************/

#include "RTE_Components.h"             // Component selection
#include "cmsis_os2.h"                  // CMSIS RTOS header file
#include "system_iMX7D_M4.h"
#include "retarget_io_user.h"
#include "board.h"
#include <stdio.h>

/*----------------------------------------------------------------------------
 *      Thread A
 *---------------------------------------------------------------------------*/
void threadA (void *argument) {
  volatile int a = 0;
  for (;;) {
	  osDelay(1000);
	  printf("Blinky   threadA: Hello World!\n");
  }
}

/* main function */
int main(void)
{
  /* Board specific RDC settings */
  BOARD_RdcInit();

  /* Board specific clock settings */
  BOARD_ClockInit();

  SystemCoreClockUpdate();

  InitRetargetIOUSART();

  /* Initialize CMSIS-RTOS */
  osKernelInitialize(); 
  
  /* Create new thread */
  osThreadNew(threadA, NULL, NULL);
  
  /* Start thread execution */ 
  osKernelStart();
  
  /* Infinite loop */
  while (1);
}
