
if(NOT "C:/Chime/amazon-chime-sdk-cpp/chime-sdk-signaling-cpp/build/_deps/protobuf-subbuild/protobuf-populate-prefix/src/protobuf-populate-stamp/protobuf-populate-gitinfo.txt" IS_NEWER_THAN "C:/Chime/amazon-chime-sdk-cpp/chime-sdk-signaling-cpp/build/_deps/protobuf-subbuild/protobuf-populate-prefix/src/protobuf-populate-stamp/protobuf-populate-gitclone-lastrun.txt")
  message(STATUS "Avoiding repeated git clone, stamp file is up to date: 'C:/Chime/amazon-chime-sdk-cpp/chime-sdk-signaling-cpp/build/_deps/protobuf-subbuild/protobuf-populate-prefix/src/protobuf-populate-stamp/protobuf-populate-gitclone-lastrun.txt'")
  return()
endif()

execute_process(
  COMMAND ${CMAKE_COMMAND} -E rm -rf "C:/Chime/amazon-chime-sdk-cpp/chime-sdk-signaling-cpp/build/_deps/protobuf-src"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to remove directory: 'C:/Chime/amazon-chime-sdk-cpp/chime-sdk-signaling-cpp/build/_deps/protobuf-src'")
endif()

# try the clone 3 times in case there is an odd git clone issue
set(error_code 1)
set(number_of_tries 0)
while(error_code AND number_of_tries LESS 3)
  execute_process(
    COMMAND "C:/Program Files/Git/cmd/git.exe"  clone --no-checkout --config "advice.detachedHead=false" "https://github.com/protocolbuffers/protobuf.git" "protobuf-src"
    WORKING_DIRECTORY "C:/Chime/amazon-chime-sdk-cpp/chime-sdk-signaling-cpp/build/_deps"
    RESULT_VARIABLE error_code
    )
  math(EXPR number_of_tries "${number_of_tries} + 1")
endwhile()
if(number_of_tries GREATER 1)
  message(STATUS "Had to git clone more than once:
          ${number_of_tries} times.")
endif()
if(error_code)
  message(FATAL_ERROR "Failed to clone repository: 'https://github.com/protocolbuffers/protobuf.git'")
endif()

execute_process(
  COMMAND "C:/Program Files/Git/cmd/git.exe"  checkout fde7cf7358ec7cd69e8db9be4f1fa6a5c431386a --
  WORKING_DIRECTORY "C:/Chime/amazon-chime-sdk-cpp/chime-sdk-signaling-cpp/build/_deps/protobuf-src"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to checkout tag: 'fde7cf7358ec7cd69e8db9be4f1fa6a5c431386a'")
endif()

set(init_submodules TRUE)
if(init_submodules)
  execute_process(
    COMMAND "C:/Program Files/Git/cmd/git.exe"  submodule update --recursive --init 
    WORKING_DIRECTORY "C:/Chime/amazon-chime-sdk-cpp/chime-sdk-signaling-cpp/build/_deps/protobuf-src"
    RESULT_VARIABLE error_code
    )
endif()
if(error_code)
  message(FATAL_ERROR "Failed to update submodules in: 'C:/Chime/amazon-chime-sdk-cpp/chime-sdk-signaling-cpp/build/_deps/protobuf-src'")
endif()

# Complete success, update the script-last-run stamp file:
#
execute_process(
  COMMAND ${CMAKE_COMMAND} -E copy
    "C:/Chime/amazon-chime-sdk-cpp/chime-sdk-signaling-cpp/build/_deps/protobuf-subbuild/protobuf-populate-prefix/src/protobuf-populate-stamp/protobuf-populate-gitinfo.txt"
    "C:/Chime/amazon-chime-sdk-cpp/chime-sdk-signaling-cpp/build/_deps/protobuf-subbuild/protobuf-populate-prefix/src/protobuf-populate-stamp/protobuf-populate-gitclone-lastrun.txt"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to copy script-last-run stamp file: 'C:/Chime/amazon-chime-sdk-cpp/chime-sdk-signaling-cpp/build/_deps/protobuf-subbuild/protobuf-populate-prefix/src/protobuf-populate-stamp/protobuf-populate-gitclone-lastrun.txt'")
endif()

