# components.cmake

# component ARM::CMSIS-Compiler:CORE@1.1.0
add_library(ARM_CMSIS-Compiler_CORE_1_1_0 OBJECT
  "${CMSIS_PACK_ROOT}/ARM/CMSIS-Compiler/2.1.0/source/armcc/retarget_io.c"
)
target_include_directories(ARM_CMSIS-Compiler_CORE_1_1_0 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
)
target_compile_definitions(ARM_CMSIS-Compiler_CORE_1_1_0 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
target_compile_options(ARM_CMSIS-Compiler_CORE_1_1_0 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_OPTIONS>
)
target_link_libraries(ARM_CMSIS-Compiler_CORE_1_1_0 PUBLIC
  ${CONTEXT}_ABSTRACTIONS
)

# component ARM::CMSIS-Compiler:STDERR:Custom@1.1.0
add_library(ARM_CMSIS-Compiler_STDERR_Custom_1_1_0 INTERFACE)
target_include_directories(ARM_CMSIS-Compiler_STDERR_Custom_1_1_0 INTERFACE
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
  ${CMSIS_PACK_ROOT}/ARM/CMSIS-Compiler/2.1.0/include
)
target_compile_definitions(ARM_CMSIS-Compiler_STDERR_Custom_1_1_0 INTERFACE
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
target_link_libraries(ARM_CMSIS-Compiler_STDERR_Custom_1_1_0 INTERFACE
  ${CONTEXT}_ABSTRACTIONS
)

# component ARM::CMSIS-Compiler:STDIN:Custom@1.1.0
add_library(ARM_CMSIS-Compiler_STDIN_Custom_1_1_0 INTERFACE)
target_include_directories(ARM_CMSIS-Compiler_STDIN_Custom_1_1_0 INTERFACE
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
  ${CMSIS_PACK_ROOT}/ARM/CMSIS-Compiler/2.1.0/include
)
target_compile_definitions(ARM_CMSIS-Compiler_STDIN_Custom_1_1_0 INTERFACE
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
target_link_libraries(ARM_CMSIS-Compiler_STDIN_Custom_1_1_0 INTERFACE
  ${CONTEXT}_ABSTRACTIONS
)

# component ARM::CMSIS-Compiler:STDOUT:Custom@1.1.0
add_library(ARM_CMSIS-Compiler_STDOUT_Custom_1_1_0 INTERFACE)
target_include_directories(ARM_CMSIS-Compiler_STDOUT_Custom_1_1_0 INTERFACE
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
  ${CMSIS_PACK_ROOT}/ARM/CMSIS-Compiler/2.1.0/include
)
target_compile_definitions(ARM_CMSIS-Compiler_STDOUT_Custom_1_1_0 INTERFACE
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
target_link_libraries(ARM_CMSIS-Compiler_STDOUT_Custom_1_1_0 INTERFACE
  ${CONTEXT}_ABSTRACTIONS
)

# component ARM::CMSIS:CORE@6.1.0
add_library(ARM_CMSIS_CORE_6_1_0 INTERFACE)
target_include_directories(ARM_CMSIS_CORE_6_1_0 INTERFACE
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
  ${CMSIS_PACK_ROOT}/ARM/CMSIS/6.1.0/CMSIS/Core/Include
)
target_compile_definitions(ARM_CMSIS_CORE_6_1_0 INTERFACE
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
target_link_libraries(ARM_CMSIS_CORE_6_1_0 INTERFACE
  ${CONTEXT}_ABSTRACTIONS
)

# component ARM::CMSIS:OS Tick:SysTick@1.0.5
add_library(ARM_CMSIS_OS_Tick_SysTick_1_0_5 OBJECT
  "${CMSIS_PACK_ROOT}/ARM/CMSIS/6.1.0/CMSIS/RTOS2/Source/os_systick.c"
)
target_include_directories(ARM_CMSIS_OS_Tick_SysTick_1_0_5 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
  ${CMSIS_PACK_ROOT}/ARM/CMSIS/6.1.0/CMSIS/RTOS2/Include
)
target_compile_definitions(ARM_CMSIS_OS_Tick_SysTick_1_0_5 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
target_compile_options(ARM_CMSIS_OS_Tick_SysTick_1_0_5 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_OPTIONS>
)
target_link_libraries(ARM_CMSIS_OS_Tick_SysTick_1_0_5 PUBLIC
  ${CONTEXT}_ABSTRACTIONS
)

# component ARM::CMSIS:RTOS2:Keil RTX5&Source@5.9.0
add_library(ARM_CMSIS_RTOS2_Keil_RTX5_Source_5_9_0 OBJECT
  "${CMSIS_PACK_ROOT}/ARM/CMSIS-RTX/5.9.0/Source/GCC/irq_armv7m.S"
  "${CMSIS_PACK_ROOT}/ARM/CMSIS-RTX/5.9.0/Source/rtx_delay.c"
  "${CMSIS_PACK_ROOT}/ARM/CMSIS-RTX/5.9.0/Source/rtx_evflags.c"
  "${CMSIS_PACK_ROOT}/ARM/CMSIS-RTX/5.9.0/Source/rtx_evr.c"
  "${CMSIS_PACK_ROOT}/ARM/CMSIS-RTX/5.9.0/Source/rtx_kernel.c"
  "${CMSIS_PACK_ROOT}/ARM/CMSIS-RTX/5.9.0/Source/rtx_lib.c"
  "${CMSIS_PACK_ROOT}/ARM/CMSIS-RTX/5.9.0/Source/rtx_memory.c"
  "${CMSIS_PACK_ROOT}/ARM/CMSIS-RTX/5.9.0/Source/rtx_mempool.c"
  "${CMSIS_PACK_ROOT}/ARM/CMSIS-RTX/5.9.0/Source/rtx_msgqueue.c"
  "${CMSIS_PACK_ROOT}/ARM/CMSIS-RTX/5.9.0/Source/rtx_mutex.c"
  "${CMSIS_PACK_ROOT}/ARM/CMSIS-RTX/5.9.0/Source/rtx_semaphore.c"
  "${CMSIS_PACK_ROOT}/ARM/CMSIS-RTX/5.9.0/Source/rtx_system.c"
  "${CMSIS_PACK_ROOT}/ARM/CMSIS-RTX/5.9.0/Source/rtx_thread.c"
  "${CMSIS_PACK_ROOT}/ARM/CMSIS-RTX/5.9.0/Source/rtx_timer.c"
  "${SOLUTION_ROOT}/Cortex-M4/RTE/CMSIS/RTX_Config.c"
)
target_include_directories(ARM_CMSIS_RTOS2_Keil_RTX5_Source_5_9_0 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
  ${SOLUTION_ROOT}/Cortex-M4/RTE/CMSIS
  ${CMSIS_PACK_ROOT}/ARM/CMSIS-RTX/5.9.0/Include
  ${CMSIS_PACK_ROOT}/ARM/CMSIS/6.1.0/CMSIS/RTOS2/Include
)
target_compile_definitions(ARM_CMSIS_RTOS2_Keil_RTX5_Source_5_9_0 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
target_compile_options(ARM_CMSIS_RTOS2_Keil_RTX5_Source_5_9_0 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_OPTIONS>
)
target_link_libraries(ARM_CMSIS_RTOS2_Keil_RTX5_Source_5_9_0 PUBLIC
  ${CONTEXT}_ABSTRACTIONS
)
set_source_files_properties("${CMSIS_PACK_ROOT}/ARM/CMSIS-RTX/5.9.0/Source/GCC/irq_armv7m.S" PROPERTIES
  COMPILE_DEFINITIONS "__MICROLIB;_RTE_;iMX7D_M4"
)

# component Keil::Board Support&MCIMX7D-SABRE:HW INIT@1.0.0
add_library(Keil_Board_Support_MCIMX7D-SABRE_HW_INIT_1_0_0 OBJECT
  "${CMSIS_PACK_ROOT}/Keil/iMX7D_DFP/1.7.8/SDK/examples/imx7d_sdb_m4/board.c"
  "${CMSIS_PACK_ROOT}/Keil/iMX7D_DFP/1.7.8/SDK/examples/imx7d_sdb_m4/clock_freq.c"
  "${CMSIS_PACK_ROOT}/Keil/iMX7D_DFP/1.7.8/SDK/examples/imx7d_sdb_m4/pin_mux.c"
)
target_include_directories(Keil_Board_Support_MCIMX7D-SABRE_HW_INIT_1_0_0 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
  ${CMSIS_PACK_ROOT}/Keil/iMX7D_DFP/1.7.8/SDK/examples/imx7d_sdb_m4
)
target_compile_definitions(Keil_Board_Support_MCIMX7D-SABRE_HW_INIT_1_0_0 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
target_compile_options(Keil_Board_Support_MCIMX7D-SABRE_HW_INIT_1_0_0 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_OPTIONS>
)
target_link_libraries(Keil_Board_Support_MCIMX7D-SABRE_HW_INIT_1_0_0 PUBLIC
  ${CONTEXT}_ABSTRACTIONS
)

# component Keil::Board Support&MCIMX7D-SABRE:User I/O Redirect@1.0.0
add_library(Keil_Board_Support_MCIMX7D-SABRE_User_I_O_Redirect_1_0_0 OBJECT
  "${CMSIS_PACK_ROOT}/Keil/iMX7D_DFP/1.7.8/Common/retarget_io_user.c"
)
target_include_directories(Keil_Board_Support_MCIMX7D-SABRE_User_I_O_Redirect_1_0_0 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
  ${CMSIS_PACK_ROOT}/Keil/iMX7D_DFP/1.7.8/Common
)
target_compile_definitions(Keil_Board_Support_MCIMX7D-SABRE_User_I_O_Redirect_1_0_0 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
target_compile_options(Keil_Board_Support_MCIMX7D-SABRE_User_I_O_Redirect_1_0_0 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_OPTIONS>
)
target_link_libraries(Keil_Board_Support_MCIMX7D-SABRE_User_I_O_Redirect_1_0_0 PUBLIC
  ${CONTEXT}_ABSTRACTIONS
)

# component Keil::Device:Startup@1.0.0
add_library(Keil_Device_Startup_1_0_0 OBJECT
  "${SOLUTION_ROOT}/Cortex-M4/RTE/Device/MCIMX7D7_Cortex-M4/startup_iMX7D_M4.s"
  "${SOLUTION_ROOT}/Cortex-M4/RTE/Device/MCIMX7D7_Cortex-M4/system_iMX7D_M4.c"
)
target_include_directories(Keil_Device_Startup_1_0_0 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
  ${SOLUTION_ROOT}/Cortex-M4/RTE/Device/MCIMX7D7_Cortex-M4
)
target_compile_definitions(Keil_Device_Startup_1_0_0 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
target_compile_options(Keil_Device_Startup_1_0_0 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_OPTIONS>
  $<$<COMPILE_LANGUAGE:ASM>:
    "SHELL:-masm=auto"
  >
)
target_link_libraries(Keil_Device_Startup_1_0_0 PUBLIC
  ${CONTEXT}_ABSTRACTIONS
)
set(COMPILE_DEFINITIONS
  __MICROLIB
  _RTE_
  iMX7D_M4
)
cbuild_set_defines(AS_ARM COMPILE_DEFINITIONS)
set_source_files_properties("${SOLUTION_ROOT}/Cortex-M4/RTE/Device/MCIMX7D7_Cortex-M4/startup_iMX7D_M4.s" PROPERTIES
  COMPILE_FLAGS "${COMPILE_DEFINITIONS}"
)

# component Keil::Device:iMX7D HAL:CCM@1.0.0
add_library(Keil_Device_iMX7D_HAL_CCM_1_0_0 OBJECT
  "${CMSIS_PACK_ROOT}/Keil/iMX7D_DFP/1.7.8/SDK/platform/drivers/src/ccm_analog_imx7d.c"
  "${CMSIS_PACK_ROOT}/Keil/iMX7D_DFP/1.7.8/SDK/platform/drivers/src/ccm_imx7d.c"
)
target_include_directories(Keil_Device_iMX7D_HAL_CCM_1_0_0 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
  ${CMSIS_PACK_ROOT}/Keil/iMX7D_DFP/1.7.8/SDK/platform/drivers/inc
)
target_compile_definitions(Keil_Device_iMX7D_HAL_CCM_1_0_0 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
target_compile_options(Keil_Device_iMX7D_HAL_CCM_1_0_0 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_OPTIONS>
)
target_link_libraries(Keil_Device_iMX7D_HAL_CCM_1_0_0 PUBLIC
  ${CONTEXT}_ABSTRACTIONS
)

# component Keil::Device:iMX7D HAL:RDC@1.0.0
add_library(Keil_Device_iMX7D_HAL_RDC_1_0_0 OBJECT
  "${CMSIS_PACK_ROOT}/Keil/iMX7D_DFP/1.7.8/SDK/platform/drivers/src/rdc.c"
  "${CMSIS_PACK_ROOT}/Keil/iMX7D_DFP/1.7.8/SDK/platform/drivers/src/rdc_semaphore.c"
)
target_include_directories(Keil_Device_iMX7D_HAL_RDC_1_0_0 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
  ${CMSIS_PACK_ROOT}/Keil/iMX7D_DFP/1.7.8/SDK/platform/drivers/inc
)
target_compile_definitions(Keil_Device_iMX7D_HAL_RDC_1_0_0 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
target_compile_options(Keil_Device_iMX7D_HAL_RDC_1_0_0 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_OPTIONS>
)
target_link_libraries(Keil_Device_iMX7D_HAL_RDC_1_0_0 PUBLIC
  ${CONTEXT}_ABSTRACTIONS
)

# component Keil::Device:iMX7D HAL:UART@1.0.0
add_library(Keil_Device_iMX7D_HAL_UART_1_0_0 OBJECT
  "${CMSIS_PACK_ROOT}/Keil/iMX7D_DFP/1.7.8/SDK/platform/drivers/src/uart_imx.c"
)
target_include_directories(Keil_Device_iMX7D_HAL_UART_1_0_0 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
  ${CMSIS_PACK_ROOT}/Keil/iMX7D_DFP/1.7.8/SDK/platform/drivers/inc
)
target_compile_definitions(Keil_Device_iMX7D_HAL_UART_1_0_0 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
target_compile_options(Keil_Device_iMX7D_HAL_UART_1_0_0 PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_OPTIONS>
)
target_link_libraries(Keil_Device_iMX7D_HAL_UART_1_0_0 PUBLIC
  ${CONTEXT}_ABSTRACTIONS
)
