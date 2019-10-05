# Generated by CMake

if("${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION}" LESS 2.5)
   message(FATAL_ERROR "CMake >= 2.6.0 required")
endif()
cmake_policy(PUSH)
cmake_policy(VERSION 2.6)
#----------------------------------------------------------------
# Generated CMake target import file.
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Protect against multiple inclusion, which would fail when already imported targets are added once more.
set(_targetsDefined)
set(_targetsNotDefined)
set(_expectedTargets)
foreach(_expectedTarget gRPC::address_sorting gRPC::gpr gRPC::grpc gRPC::grpc_cronet gRPC::grpc_unsecure gRPC::grpc++ gRPC::grpc++_cronet gRPC::grpc++_error_details gRPC::grpc++_reflection gRPC::grpc++_unsecure gRPC::grpc_plugin_support gRPC::grpcpp_channelz gRPC::grpc_cpp_plugin gRPC::grpc_csharp_plugin gRPC::grpc_node_plugin gRPC::grpc_objective_c_plugin gRPC::grpc_php_plugin gRPC::grpc_python_plugin gRPC::grpc_ruby_plugin)
  list(APPEND _expectedTargets ${_expectedTarget})
  if(NOT TARGET ${_expectedTarget})
    list(APPEND _targetsNotDefined ${_expectedTarget})
  endif()
  if(TARGET ${_expectedTarget})
    list(APPEND _targetsDefined ${_expectedTarget})
  endif()
endforeach()
if("${_targetsDefined}" STREQUAL "${_expectedTargets}")
  unset(_targetsDefined)
  unset(_targetsNotDefined)
  unset(_expectedTargets)
  set(CMAKE_IMPORT_FILE_VERSION)
  cmake_policy(POP)
  return()
endif()
if(NOT "${_targetsDefined}" STREQUAL "")
  message(FATAL_ERROR "Some (but not all) targets in this export set were already defined.\nTargets Defined: ${_targetsDefined}\nTargets not yet defined: ${_targetsNotDefined}\n")
endif()
unset(_targetsDefined)
unset(_targetsNotDefined)
unset(_expectedTargets)


# Compute the installation prefix relative to this file.
get_filename_component(_IMPORT_PREFIX "${CMAKE_CURRENT_LIST_FILE}" PATH)
get_filename_component(_IMPORT_PREFIX "${_IMPORT_PREFIX}" PATH)
get_filename_component(_IMPORT_PREFIX "${_IMPORT_PREFIX}" PATH)
get_filename_component(_IMPORT_PREFIX "${_IMPORT_PREFIX}" PATH)
if(_IMPORT_PREFIX STREQUAL "/")
  set(_IMPORT_PREFIX "")
endif()

# Create imported target gRPC::address_sorting
add_library(gRPC::address_sorting STATIC IMPORTED)

set_target_properties(gRPC::address_sorting PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
)

# Create imported target gRPC::gpr
add_library(gRPC::gpr STATIC IMPORTED)

set_target_properties(gRPC::gpr PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
)

# Create imported target gRPC::grpc
add_library(gRPC::grpc STATIC IMPORTED)

set_target_properties(gRPC::grpc PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
)

# Create imported target gRPC::grpc_cronet
add_library(gRPC::grpc_cronet STATIC IMPORTED)

set_target_properties(gRPC::grpc_cronet PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
)

# Create imported target gRPC::grpc_unsecure
add_library(gRPC::grpc_unsecure STATIC IMPORTED)

set_target_properties(gRPC::grpc_unsecure PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
)

# Create imported target gRPC::grpc++
add_library(gRPC::grpc++ STATIC IMPORTED)

set_target_properties(gRPC::grpc++ PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
)

# Create imported target gRPC::grpc++_cronet
add_library(gRPC::grpc++_cronet STATIC IMPORTED)

set_target_properties(gRPC::grpc++_cronet PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
)

# Create imported target gRPC::grpc++_error_details
add_library(gRPC::grpc++_error_details STATIC IMPORTED)

set_target_properties(gRPC::grpc++_error_details PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
)

# Create imported target gRPC::grpc++_reflection
add_library(gRPC::grpc++_reflection STATIC IMPORTED)

set_target_properties(gRPC::grpc++_reflection PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
)

# Create imported target gRPC::grpc++_unsecure
add_library(gRPC::grpc++_unsecure STATIC IMPORTED)

set_target_properties(gRPC::grpc++_unsecure PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
)

# Create imported target gRPC::grpc_plugin_support
add_library(gRPC::grpc_plugin_support STATIC IMPORTED)

set_target_properties(gRPC::grpc_plugin_support PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
)

# Create imported target gRPC::grpcpp_channelz
add_library(gRPC::grpcpp_channelz STATIC IMPORTED)

set_target_properties(gRPC::grpcpp_channelz PROPERTIES
  INTERFACE_INCLUDE_DIRECTORIES "${_IMPORT_PREFIX}/include"
)

# Create imported target gRPC::grpc_cpp_plugin
add_executable(gRPC::grpc_cpp_plugin IMPORTED)

# Create imported target gRPC::grpc_csharp_plugin
add_executable(gRPC::grpc_csharp_plugin IMPORTED)

# Create imported target gRPC::grpc_node_plugin
add_executable(gRPC::grpc_node_plugin IMPORTED)

# Create imported target gRPC::grpc_objective_c_plugin
add_executable(gRPC::grpc_objective_c_plugin IMPORTED)

# Create imported target gRPC::grpc_php_plugin
add_executable(gRPC::grpc_php_plugin IMPORTED)

# Create imported target gRPC::grpc_python_plugin
add_executable(gRPC::grpc_python_plugin IMPORTED)

# Create imported target gRPC::grpc_ruby_plugin
add_executable(gRPC::grpc_ruby_plugin IMPORTED)

# Load information for each installed configuration.
get_filename_component(_DIR "${CMAKE_CURRENT_LIST_FILE}" PATH)
file(GLOB CONFIG_FILES "${_DIR}/gRPCTargets-*.cmake")
foreach(f ${CONFIG_FILES})
  include(${f})
endforeach()

# Cleanup temporary variables.
set(_IMPORT_PREFIX)

# Loop over all imported files and verify that they actually exist
foreach(target ${_IMPORT_CHECK_TARGETS} )
  foreach(file ${_IMPORT_CHECK_FILES_FOR_${target}} )
    if(NOT EXISTS "${file}" )
      message(FATAL_ERROR "The imported target \"${target}\" references the file
   \"${file}\"
but this file does not exist.  Possible reasons include:
* The file was deleted, renamed, or moved to another location.
* An install or uninstall procedure did not complete successfully.
* The installation package was faulty and contained
   \"${CMAKE_CURRENT_LIST_FILE}\"
but not all the files it references.
")
    endif()
  endforeach()
  unset(_IMPORT_CHECK_FILES_FOR_${target})
endforeach()
unset(_IMPORT_CHECK_TARGETS)

# This file does not depend on other imported targets which have
# been exported from the same project but in a separate export set.

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
cmake_policy(POP)
