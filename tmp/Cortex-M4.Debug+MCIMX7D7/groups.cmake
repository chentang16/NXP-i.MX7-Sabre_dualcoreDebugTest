# groups.cmake

# group Sources
add_library(Group_Sources OBJECT
  "${SOLUTION_ROOT}/Cortex-M4/main.c"
)
target_include_directories(Group_Sources PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_INCLUDE_DIRECTORIES>
)
target_compile_definitions(Group_Sources PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_DEFINITIONS>
)
add_library(Group_Sources_ABSTRACTIONS INTERFACE)
target_link_libraries(Group_Sources_ABSTRACTIONS INTERFACE
  ${CONTEXT}_ABSTRACTIONS
)
target_compile_options(Group_Sources PUBLIC
  $<TARGET_PROPERTY:${CONTEXT},INTERFACE_COMPILE_OPTIONS>
)
target_link_libraries(Group_Sources PUBLIC
  Group_Sources_ABSTRACTIONS
)
