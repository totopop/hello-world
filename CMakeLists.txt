cmake_minimum_required(VERSION 3.10)

project(MyCppProject)

set(CMAKE_CXX_STANDARD 11)

include_directories(include)

# Add executable for the host
add_executable(hello-world src/helloworld.cpp)

# Specify the output directory for the build
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

# Linker script
set(LINKER_SCRIPT ${CMAKE_SOURCE_DIR}/scripts/raspberrypi.ld)

# Apply linker script to host executable
target_link_libraries(hello-world PRIVATE "-T${LINKER_SCRIPT}")

# Define Raspberry Pi toolchain
set(RPI_TOOLCHAIN_FILE ${CMAKE_SOURCE_DIR}/toolchains/raspberrypi.cmake)

# Add executable for Raspberry Pi
add_executable(rpi-hello-world src/helloworld.cpp)
set_target_properties(rpi-hello-world PROPERTIES COMPILE_FLAGS "-DRPI")
target_link_libraries(rpi-hello-world PRIVATE "-T${LINKER_SCRIPT}")

# Specify the output directory for the Raspberry Pi build
set_target_properties(rpi-hello-world PROPERTIES RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin/rpi)