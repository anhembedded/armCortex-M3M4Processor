# THIS FILE IS AUTO GENERATED FROM THE TEMPLATE! DO NOT CHANGE!
set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_VERSION 1)
cmake_minimum_required(VERSION 3.24)


enable_language(C ASM)
set(CMAKE_C_STANDARD 99)
set(CMAKE_C_STANDARD_REQUIRED ON)
set(CMAKE_C_EXTENSIONS OFF)

set(CMAKE_C_COMPILER "C:/gnuArm/bin/arm-none-eabi-gcc.exe")
set(CMAKE_CXX_COMPILER "C:/gnuArm/bin/arm-none-eabi-cpp.exe")


project(learnArmComplier)


add_compile_options(-mcpu=cortex-m4 -mthumb -mthumb-interwork -nostdlib)
add_compile_options(-ffunction-sections -fdata-sections -fno-common -fmessage-length=0)
add_definitions(-DDEBUG -DUSE_HAL_DRIVER -DSTM32F407xx)

include_directories(Core/Inc Drivers/STM32F4xx_HAL_Driver/Inc Drivers/STM32F4xx_HAL_Driver/Inc/Legacy Drivers/CMSIS/Device/ST/STM32F4xx/Include Drivers/CMSIS/Include)
file(GLOB_RECURSE SOURCES "Core/*.*" "Drivers/*.*")

add_compile_options(-nostdlib -Wall -C -mcpu=cortex-m4 -mthumb -mthumb-interwork)




set(EXECUTABLE ${PROJECT_NAME}.out)

add_executable(${EXECUTABLE} ${SOURCES})

target_compile_definitions(${EXECUTABLE} PRIVATE
    -DUSE_HAL_DRIVER
    -DSTM32F407xx
    -DDEBUG
)

target_compile_options(${EXECUTABLE} PRIVATE
    -mcpu=cortex-m4
    -mthumb
    -mfpu=fpv4-sp-d16
    -mfloat-abi=hard
    -fdata-sections
    -ffunction-sections
    -Wall
    $<$<CONFIG:Debug>:-Og>
)
target_link_options(${EXECUTABLE} PRIVATE
    -T${CMAKE_SOURCE_DIR}/stm32_linkerscrip.ld
    -mcpu=cortex-m4
    -mthumb
    -mfpu=fpv4-sp-d16
    -mfloat-abi=hard
    -specs=nano.specs
    -lc
    -lm
    -lnosys
    -Wl,-Map=${PROJECT_NAME}.map,--cref
    -Wl,--gc-sections
)

# Print executable size
add_custom_command(TARGET ${EXECUTABLE}
    POST_BUILD
    COMMAND arm-none-eabi-size ${EXECUTABLE})

# Create hex file
add_custom_command(TARGET ${EXECUTABLE}
    POST_BUILD
    COMMAND arm-none-eabi-objcopy -O ihex ${EXECUTABLE} ${PROJECT_NAME}.hex
    COMMAND arm-none-eabi-objcopy -O binary ${EXECUTABLE} ${PROJECT_NAME}.bin)

message(STATUS ___________CmakeCompiler___________)
message(" CMAKE_PROJECT_NAME: " ${CMAKE_PROJECT_NAME})
message(" CMAKE_HOST_SYSTEM_PROCESSOR: " ${CMAKE_HOST_SYSTEM_PROCESSOR})
message(" LINKER_LANGUAGE : " ${LINKER_LANGUAGE})
message(" CMAKE_CXX_COMPILER_ID: " ${CMAKE_CXX_COMPILER_ID})
message(" CMAKE_C_COMPILER_ID: " ${CMAKE_C_COMPILER_ID})
message(" CMAKE_BUILD_TYPE: " ${CMAKE_BUILD_TYPE})
message(" PROJECT_BINARY_DIR: " ${PROJECT_BINARY_DIR})

