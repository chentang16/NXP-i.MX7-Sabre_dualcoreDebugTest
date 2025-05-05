cmake_minimum_required(VERSION 3.27)

# Roots
include("../roots.cmake")

set(CONTEXT Cortex-M4.Debug+MCIMX7D7)
set(TARGET ${CONTEXT})
set(OUT_DIR "${SOLUTION_ROOT}/out/Cortex-M4/MCIMX7D7/Debug")
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(HEX_FILE "Cortex-M4.hex")
set(LD_SCRIPT "${SOLUTION_ROOT}/Cortex-M4/Blinky_M4_CMSIS_RTOS_Blinky.sct")
set(LD_SCRIPT_PP ${LD_SCRIPT})

# Processor Options
set(CPU Cortex-M4)
set(FPU SP_FPU)

# Toolchain config map
include("toolchain.cmake")

# Setup project
project(${CONTEXT} LANGUAGES C ASM)

# Compilation database
add_custom_target(database
  COMMAND ${CMAKE_COMMAND} -E make_directory "${OUT_DIR}"
  COMMAND ${CMAKE_COMMAND} -E copy_if_different "${CMAKE_CURRENT_BINARY_DIR}/compile_commands.json" "${OUT_DIR}"
)
set(CMAKE_C_STANDARD_INCLUDE_DIRECTORIES ${CMAKE_C_IMPLICIT_INCLUDE_DIRECTORIES})

# Setup context
add_executable(${CONTEXT})
set_target_properties(${CONTEXT} PROPERTIES PREFIX "" SUFFIX ".axf" OUTPUT_NAME "Cortex-M4")
set_target_properties(${CONTEXT} PROPERTIES RUNTIME_OUTPUT_DIRECTORY ${OUT_DIR})
add_library(${CONTEXT}_GLOBAL INTERFACE)

# Includes
target_include_directories(${CONTEXT} PUBLIC
  ${SOLUTION_ROOT}/Cortex-M4/RTE/_Debug_MCIMX7D7
  ${SOLUTION_ROOT}/Cortex-M4/RTE/CMSIS
  ${SOLUTION_ROOT}/Cortex-M4/RTE/Device/MCIMX7D7_Cortex-M4
  ${CMSIS_PACK_ROOT}/ARM/CMSIS-Compiler/2.1.0/include
  ${CMSIS_PACK_ROOT}/ARM/CMSIS-RTX/5.9.0/Include
  ${CMSIS_PACK_ROOT}/ARM/CMSIS/6.1.0/CMSIS/Core/Include
  ${CMSIS_PACK_ROOT}/ARM/CMSIS/6.1.0/CMSIS/RTOS2/Include
  ${CMSIS_PACK_ROOT}/Keil/iMX7D_DFP/1.7.8/Common
  ${CMSIS_PACK_ROOT}/Keil/iMX7D_DFP/1.7.8/Device/Include
  ${CMSIS_PACK_ROOT}/Keil/iMX7D_DFP/1.7.8/SDK/examples/imx7d_sdb_m4
  ${CMSIS_PACK_ROOT}/Keil/iMX7D_DFP/1.7.8/SDK/platform/drivers/inc
)

# Defines
target_compile_definitions(${CONTEXT} PUBLIC
  $<$<COMPILE_LANGUAGE:C,CXX>:
    __MICROLIB
    _RTE_
    iMX7D_M4
  >
)

# Compile options
target_compile_options(${CONTEXT} PUBLIC
  $<$<COMPILE_LANGUAGE:ASM>:
    "SHELL:${ASM_CPU}"
    "SHELL:${ASM_FLAGS}"
    "SHELL:-masm=auto"
  >
  $<$<COMPILE_LANGUAGE:C>:
    "SHELL:${CC_CPU}"
    "SHELL:${CC_FLAGS}"
    "SHELL:-std=gnu11"
    "SHELL:-Wno-macro-redefined"
    "SHELL:-Wno-pragma-pack"
    "SHELL:-Wno-parentheses-equality"
    "SHELL:-Wno-license-management"
    "SHELL:-std=c99"
    "SHELL:-fno-rtti"
    "SHELL:-funsigned-char"
    "SHELL:-fshort-enums"
    "SHELL:-fshort-wchar"
    "SHELL:-ffunction-sections"
    "SHELL:-Wno-packed"
    "SHELL:-Wno-missing-variable-declarations"
    "SHELL:-Wno-missing-prototypes"
    "SHELL:-Wno-missing-noreturn"
    "SHELL:-Wno-sign-conversion"
    "SHELL:-Wno-nonportable-include-path"
    "SHELL:-Wno-reserved-id-macro"
    "SHELL:-Wno-unused-macros"
    "SHELL:-Wno-documentation-unknown-command"
    "SHELL:-Wno-documentation"
  >
)

# Compile Options Abstractions
add_library(${CONTEXT}_ABSTRACTIONS INTERFACE)
cbuild_set_options_flags(CC "debug" "on" "" "" CC_OPTIONS_FLAGS_${CONTEXT})
cbuild_set_options_flags(ASM "debug" "on" "" "" ASM_OPTIONS_FLAGS_${CONTEXT})
target_compile_options(${CONTEXT}_ABSTRACTIONS INTERFACE
  $<$<COMPILE_LANGUAGE:C>:
    "SHELL:${CC_OPTIONS_FLAGS_${CONTEXT}}"
  >
  $<$<COMPILE_LANGUAGE:ASM>:
    "SHELL:${ASM_OPTIONS_FLAGS_${CONTEXT}}"
  >
)

# Add groups and components
include("groups.cmake")
include("components.cmake")

target_link_libraries(${CONTEXT} PUBLIC
  Group_Sources
  ARM_CMSIS-Compiler_CORE_1_1_0
  ARM_CMSIS-Compiler_STDERR_Custom_1_1_0
  ARM_CMSIS-Compiler_STDIN_Custom_1_1_0
  ARM_CMSIS-Compiler_STDOUT_Custom_1_1_0
  ARM_CMSIS_CORE_6_1_0
  ARM_CMSIS_OS_Tick_SysTick_1_0_5
  ARM_CMSIS_RTOS2_Keil_RTX5_Source_5_9_0
  Keil_Board_Support_MCIMX7D-SABRE_HW_INIT_1_0_0
  Keil_Board_Support_MCIMX7D-SABRE_User_I_O_Redirect_1_0_0
  Keil_Device_Startup_1_0_0
  Keil_Device_iMX7D_HAL_CCM_1_0_0
  Keil_Device_iMX7D_HAL_RDC_1_0_0
  Keil_Device_iMX7D_HAL_UART_1_0_0
)

# Linker options
target_link_options(${CONTEXT} PUBLIC
  "SHELL:${LD_CPU}"
  "SHELL:${_LS}\"${LD_SCRIPT_PP}\""
  "SHELL:--entry=Reset_Handler"
  "SHELL:--info summarysizes"
  "SHELL:--summary_stderr"
  "SHELL:--diag_suppress=L6314W"
  "SHELL:--library_type=microlib"
  "SHELL:--map"
  "SHELL:--load_addr_map_info"
  "SHELL:--xref"
  "SHELL:--callgraph"
  "SHELL:--symbols"
  "SHELL:--info sizes"
  "SHELL:--info totals"
  "SHELL:--info unused"
  "SHELL:--info veneers"
  "SHELL:--strict"
)
set_target_properties(${CONTEXT} PROPERTIES LINK_DEPENDS ${LD_SCRIPT})

# Hex Conversion
 add_custom_command(TARGET ${CONTEXT} POST_BUILD COMMAND ${CMAKE_OBJCOPY} ${ELF2HEX})
