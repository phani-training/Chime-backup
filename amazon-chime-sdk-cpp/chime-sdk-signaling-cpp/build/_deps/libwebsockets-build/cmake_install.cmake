# Install script for directory: C:/Chime/amazon-chime-sdk-cpp/chime-sdk-signaling-cpp/build/_deps/libwebsockets-src

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "C:/Program Files/AmazonChimeSignalingSdkCpp")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "FALSE")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "C:/Chime/amazon-chime-sdk-cpp/chime-sdk-signaling-cpp/build/_deps/libwebsockets-src/include/libwebsockets")
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE FILE FILES
    "C:/Chime/amazon-chime-sdk-cpp/chime-sdk-signaling-cpp/build/_deps/libwebsockets-build/include/libwebsockets.h"
    "C:/Chime/amazon-chime-sdk-cpp/chime-sdk-signaling-cpp/build/_deps/libwebsockets-build/include/lws_config.h"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/cmake" TYPE FILE FILES
    "C:/Chime/amazon-chime-sdk-cpp/chime-sdk-signaling-cpp/build/_deps/libwebsockets-build/CMakeFiles/libwebsockets-config.cmake"
    "C:/Chime/amazon-chime-sdk-cpp/chime-sdk-signaling-cpp/build/_deps/libwebsockets-build/libwebsockets-config-version.cmake"
    "C:/Chime/amazon-chime-sdk-cpp/chime-sdk-signaling-cpp/build/_deps/libwebsockets-build/CMakeFiles/LwsCheckRequirements.cmake"
    )
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xdevx" OR NOT CMAKE_INSTALL_COMPONENT)
  if(EXISTS "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/cmake/LibwebsocketsTargets.cmake")
    file(DIFFERENT EXPORT_FILE_CHANGED FILES
         "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/cmake/LibwebsocketsTargets.cmake"
         "C:/Chime/amazon-chime-sdk-cpp/chime-sdk-signaling-cpp/build/_deps/libwebsockets-build/CMakeFiles/Export/cmake/LibwebsocketsTargets.cmake")
    if(EXPORT_FILE_CHANGED)
      file(GLOB OLD_CONFIG_FILES "$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/cmake/LibwebsocketsTargets-*.cmake")
      if(OLD_CONFIG_FILES)
        message(STATUS "Old export file \"$ENV{DESTDIR}${CMAKE_INSTALL_PREFIX}/cmake/LibwebsocketsTargets.cmake\" will be replaced.  Removing files [${OLD_CONFIG_FILES}].")
        file(REMOVE ${OLD_CONFIG_FILES})
      endif()
    endif()
  endif()
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/cmake" TYPE FILE FILES "C:/Chime/amazon-chime-sdk-cpp/chime-sdk-signaling-cpp/build/_deps/libwebsockets-build/CMakeFiles/Export/cmake/LibwebsocketsTargets.cmake")
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/cmake" TYPE FILE FILES "C:/Chime/amazon-chime-sdk-cpp/chime-sdk-signaling-cpp/build/_deps/libwebsockets-build/CMakeFiles/Export/cmake/LibwebsocketsTargets-debug.cmake")
  endif()
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/cmake" TYPE FILE FILES "C:/Chime/amazon-chime-sdk-cpp/chime-sdk-signaling-cpp/build/_deps/libwebsockets-build/CMakeFiles/Export/cmake/LibwebsocketsTargets-minsizerel.cmake")
  endif()
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/cmake" TYPE FILE FILES "C:/Chime/amazon-chime-sdk-cpp/chime-sdk-signaling-cpp/build/_deps/libwebsockets-build/CMakeFiles/Export/cmake/LibwebsocketsTargets-relwithdebinfo.cmake")
  endif()
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/cmake" TYPE FILE FILES "C:/Chime/amazon-chime-sdk-cpp/chime-sdk-signaling-cpp/build/_deps/libwebsockets-build/CMakeFiles/Export/cmake/LibwebsocketsTargets-release.cmake")
  endif()
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("C:/Chime/amazon-chime-sdk-cpp/chime-sdk-signaling-cpp/build/_deps/libwebsockets-build/lib/cmake_install.cmake")
  include("C:/Chime/amazon-chime-sdk-cpp/chime-sdk-signaling-cpp/build/_deps/libwebsockets-build/plugins/cmake_install.cmake")
  include("C:/Chime/amazon-chime-sdk-cpp/chime-sdk-signaling-cpp/build/_deps/libwebsockets-build/lwsws/cmake_install.cmake")

endif()
