# Install script for directory: C:/Chime/amazon-chime-sdk-cpp/chime-sdk-signaling-cpp/build/_deps/libwebsockets-src/lib

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

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xcorex" OR NOT CMAKE_INSTALL_COMPONENT)
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Chime/amazon-chime-sdk-cpp/chime-sdk-signaling-cpp/build/_deps/libwebsockets-build/lib/Debug/websockets_static.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Chime/amazon-chime-sdk-cpp/chime-sdk-signaling-cpp/build/_deps/libwebsockets-build/lib/Release/websockets_static.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Chime/amazon-chime-sdk-cpp/chime-sdk-signaling-cpp/build/_deps/libwebsockets-build/lib/MinSizeRel/websockets_static.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY FILES "C:/Chime/amazon-chime-sdk-cpp/chime-sdk-signaling-cpp/build/_deps/libwebsockets-build/lib/RelWithDebInfo/websockets_static.lib")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xcorex" OR NOT CMAKE_INSTALL_COMPONENT)
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "C:/Chime/amazon-chime-sdk-cpp/chime-sdk-signaling-cpp/build/_deps/libwebsockets-build/lib/Debug/websockets.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "C:/Chime/amazon-chime-sdk-cpp/chime-sdk-signaling-cpp/build/_deps/libwebsockets-build/lib/Release/websockets.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "C:/Chime/amazon-chime-sdk-cpp/chime-sdk-signaling-cpp/build/_deps/libwebsockets-build/lib/MinSizeRel/websockets.lib")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib" TYPE STATIC_LIBRARY OPTIONAL FILES "C:/Chime/amazon-chime-sdk-cpp/chime-sdk-signaling-cpp/build/_deps/libwebsockets-build/lib/RelWithDebInfo/websockets.lib")
  endif()
endif()

if("x${CMAKE_INSTALL_COMPONENT}x" STREQUAL "xcorex" OR NOT CMAKE_INSTALL_COMPONENT)
  if("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Dd][Ee][Bb][Uu][Gg])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "C:/Chime/amazon-chime-sdk-cpp/chime-sdk-signaling-cpp/build/_deps/libwebsockets-build/bin/Debug/websockets.dll")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ee][Aa][Ss][Ee])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "C:/Chime/amazon-chime-sdk-cpp/chime-sdk-signaling-cpp/build/_deps/libwebsockets-build/bin/Release/websockets.dll")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Mm][Ii][Nn][Ss][Ii][Zz][Ee][Rr][Ee][Ll])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "C:/Chime/amazon-chime-sdk-cpp/chime-sdk-signaling-cpp/build/_deps/libwebsockets-build/bin/MinSizeRel/websockets.dll")
  elseif("${CMAKE_INSTALL_CONFIG_NAME}" MATCHES "^([Rr][Ee][Ll][Ww][Ii][Tt][Hh][Dd][Ee][Bb][Ii][Nn][Ff][Oo])$")
    file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/bin" TYPE SHARED_LIBRARY FILES "C:/Chime/amazon-chime-sdk-cpp/chime-sdk-signaling-cpp/build/_deps/libwebsockets-build/bin/RelWithDebInfo/websockets.dll")
  endif()
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("C:/Chime/amazon-chime-sdk-cpp/chime-sdk-signaling-cpp/build/_deps/libwebsockets-build/lib/plat/windows/cmake_install.cmake")
  include("C:/Chime/amazon-chime-sdk-cpp/chime-sdk-signaling-cpp/build/_deps/libwebsockets-build/lib/tls/cmake_install.cmake")
  include("C:/Chime/amazon-chime-sdk-cpp/chime-sdk-signaling-cpp/build/_deps/libwebsockets-build/lib/core/cmake_install.cmake")
  include("C:/Chime/amazon-chime-sdk-cpp/chime-sdk-signaling-cpp/build/_deps/libwebsockets-build/lib/misc/cmake_install.cmake")
  include("C:/Chime/amazon-chime-sdk-cpp/chime-sdk-signaling-cpp/build/_deps/libwebsockets-build/lib/system/cmake_install.cmake")
  include("C:/Chime/amazon-chime-sdk-cpp/chime-sdk-signaling-cpp/build/_deps/libwebsockets-build/lib/core-net/cmake_install.cmake")
  include("C:/Chime/amazon-chime-sdk-cpp/chime-sdk-signaling-cpp/build/_deps/libwebsockets-build/lib/roles/cmake_install.cmake")
  include("C:/Chime/amazon-chime-sdk-cpp/chime-sdk-signaling-cpp/build/_deps/libwebsockets-build/lib/event-libs/cmake_install.cmake")

endif()

