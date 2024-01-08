# This file will be configured to contain variables for CPack. These variables
# should be set in the CMake list file of the project before CPack module is
# included. The list of available CPACK_xxx variables and their associated
# documentation may be obtained using
#  cpack --help-variable-list
#
# Some variables are common to all generators (e.g. CPACK_PACKAGE_NAME)
# and some are specific to a generator
# (e.g. CPACK_NSIS_EXTRA_INSTALL_COMMANDS). The generator specific variables
# usually begin with CPACK_<GENNAME>_xxxx.


set(CPACK_BUILD_SOURCE_DIRS "C:/Chime/amazon-chime-sdk-cpp/chime-sdk-signaling-cpp;C:/Chime/amazon-chime-sdk-cpp/chime-sdk-signaling-cpp/build")
set(CPACK_CMAKE_GENERATOR "Visual Studio 16 2019")
set(CPACK_COMPONENTS_ALL "core;dev")
set(CPACK_COMPONENT_DEV_DISPLAY_NAME "Development files")
set(CPACK_COMPONENT_UNSPECIFIED_HIDDEN "TRUE")
set(CPACK_COMPONENT_UNSPECIFIED_REQUIRED "TRUE")
set(CPACK_DEBIAN_COMPONENT_INSTALL "ON")
set(CPACK_DEBIAN_DEBUGINFO_PACKAGE "ON")
set(CPACK_DEBIAN_FILE_NAME "DEB-DEFAULT")
set(CPACK_DEBIAN_PACKAGE_SHLIBDEPS "ON")
set(CPACK_DEBIAN_PACKAGE_SOURCE "ON")
set(CPACK_DEFAULT_PACKAGE_DESCRIPTION_FILE "C:/Program Files (x86)/Microsoft Visual Studio/2019/Community/Common7/IDE/CommonExtensions/Microsoft/CMake/CMake/share/cmake-3.20/Templates/CPack.GenericDescription.txt")
set(CPACK_DEFAULT_PACKAGE_DESCRIPTION_SUMMARY "AmazonChimeSignalingSdkCpp built using CMake")
set(CPACK_GENERATOR "ZIP")
set(CPACK_INSTALL_CMAKE_PROJECTS "C:/Chime/amazon-chime-sdk-cpp/chime-sdk-signaling-cpp/build;AmazonChimeSignalingSdkCpp;ALL;/")
set(CPACK_INSTALL_PREFIX "C:/Program Files/AmazonChimeSignalingSdkCpp")
set(CPACK_MODULE_PATH "C:/Chime/amazon-chime-sdk-cpp/chime-sdk-signaling-cpp/build/_deps/libwebsockets-src/cmake")
set(CPACK_NSIS_DISPLAY_NAME "libwebsockets 4.3.0-v4.3.0-79-g141ebf37")
set(CPACK_NSIS_INSTALLER_ICON_CODE "")
set(CPACK_NSIS_INSTALLER_MUI_ICON_CODE "")
set(CPACK_NSIS_INSTALL_ROOT "$PROGRAMFILES64")
set(CPACK_NSIS_PACKAGE_NAME "libwebsockets 4.3.0-v4.3.0-79-g141ebf37")
set(CPACK_NSIS_UNINSTALL_NAME "Uninstall")
set(CPACK_OUTPUT_CONFIG_FILE "C:/Chime/amazon-chime-sdk-cpp/chime-sdk-signaling-cpp/build/CPackConfig.cmake")
set(CPACK_PACKAGE_CONTACT "andy@warmcat.com")
set(CPACK_PACKAGE_DEFAULT_LOCATION "/")
set(CPACK_PACKAGE_DESCRIPTION_FILE "C:/Program Files (x86)/Microsoft Visual Studio/2019/Community/Common7/IDE/CommonExtensions/Microsoft/CMake/CMake/share/cmake-3.20/Templates/CPack.GenericDescription.txt")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "libwebsockets 4.3.0-v4.3.0-79-g141ebf37")
set(CPACK_PACKAGE_FILE_NAME "libwebsockets-4.3.0-v4.3.0-79-g141ebf37-win64")
set(CPACK_PACKAGE_INSTALL_DIRECTORY "libwebsockets 4.3.0-v4.3.0-79-g141ebf37")
set(CPACK_PACKAGE_INSTALL_REGISTRY_KEY "libwebsockets 4.3.0-v4.3.0-79-g141ebf37")
set(CPACK_PACKAGE_NAME "libwebsockets")
set(CPACK_PACKAGE_RELEASE "1")
set(CPACK_PACKAGE_RELOCATABLE "true")
set(CPACK_PACKAGE_VENDOR "andy@warmcat.com")
set(CPACK_PACKAGE_VERSION "4.3.0-v4.3.0-79-g141ebf37")
set(CPACK_PACKAGE_VERSION_MAJOR "4")
set(CPACK_PACKAGE_VERSION_MINOR "3")
set(CPACK_PACKAGE_VERSION_PATCH "0-v4.3.0-79-g141ebf37")
set(CPACK_PACKAGE_VERSION_PATCH_NUMBER "0")
set(CPACK_RESOURCE_FILE_LICENSE "C:/Program Files (x86)/Microsoft Visual Studio/2019/Community/Common7/IDE/CommonExtensions/Microsoft/CMake/CMake/share/cmake-3.20/Templates/CPack.GenericLicense.txt")
set(CPACK_RESOURCE_FILE_README "C:/Program Files (x86)/Microsoft Visual Studio/2019/Community/Common7/IDE/CommonExtensions/Microsoft/CMake/CMake/share/cmake-3.20/Templates/CPack.GenericDescription.txt")
set(CPACK_RESOURCE_FILE_WELCOME "C:/Program Files (x86)/Microsoft Visual Studio/2019/Community/Common7/IDE/CommonExtensions/Microsoft/CMake/CMake/share/cmake-3.20/Templates/CPack.GenericWelcome.txt")
set(CPACK_RPM_COMPONENT_INSTALL "ON")
set(CPACK_RPM_DEBUGINFO_PACKAGE "OFF")
set(CPACK_RPM_FILE_NAME "RPM-DEFAULT")
set(CPACK_RPM_INSTALL_WITH_EXEC "ON")
set(CPACK_RPM_PACKAGE_LICENSE "MIT")
set(CPACK_RPM_PACKAGE_RELEASE_DIST "ON")
set(CPACK_RPM_PACKAGE_SOURCES "OFF")
set(CPACK_SET_DESTDIR "OFF")
set(CPACK_SOURCE_GENERATOR "TGZ")
set(CPACK_SOURCE_IGNORE_FILES "$(CPACK_SOURCE_IGNORE_FILES);/.git/;/build/;\\.tgz$;\\.tar\\.gz$")
set(CPACK_SOURCE_OUTPUT_CONFIG_FILE "C:/Chime/amazon-chime-sdk-cpp/chime-sdk-signaling-cpp/build/CPackSourceConfig.cmake")
set(CPACK_SOURCE_PACKAGE_FILE_NAME "libwebsockets-4.3.0-v4.3.0-79-g141ebf37")
set(CPACK_SYSTEM_NAME "win64")
set(CPACK_THREADS "1")
set(CPACK_TOPLEVEL_TAG "win64")
set(CPACK_WIX_SIZEOF_VOID_P "8")

if(NOT CPACK_PROPERTIES_FILE)
  set(CPACK_PROPERTIES_FILE "C:/Chime/amazon-chime-sdk-cpp/chime-sdk-signaling-cpp/build/CPackProperties.cmake")
endif()

if(EXISTS ${CPACK_PROPERTIES_FILE})
  include(${CPACK_PROPERTIES_FILE})
endif()
