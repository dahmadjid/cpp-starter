cmake_minimum_required(VERSION 3.20)

project(main VERSION 1.0.0 LANGUAGES CXX)

find_package(fmt REQUIRED)

add_executable(main src/main.cpp)

target_compile_options(main PRIVATE -Wall -Wextra -Wpedantic -Wunused -Wconversion -O3 -std=c++20)
target_include_directories(main PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/src) 
target_link_libraries(main fmt::fmt)