if(EXISTS "C:/Chime/amazon-chime-sdk-cpp/chime-sdk-signaling-cpp/build/test/unit_test[1]_tests.cmake")
  include("C:/Chime/amazon-chime-sdk-cpp/chime-sdk-signaling-cpp/build/test/unit_test[1]_tests.cmake")
else()
  add_test(unit_test_NOT_BUILT unit_test_NOT_BUILT)
endif()
