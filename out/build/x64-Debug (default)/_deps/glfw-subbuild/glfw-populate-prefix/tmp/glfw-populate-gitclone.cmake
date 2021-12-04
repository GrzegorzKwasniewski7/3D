
if(NOT "E:/Edu/UJ/Programowanie_3d/3d-main/out/build/x64-Debug (default)/_deps/glfw-subbuild/glfw-populate-prefix/src/glfw-populate-stamp/glfw-populate-gitinfo.txt" IS_NEWER_THAN "E:/Edu/UJ/Programowanie_3d/3d-main/out/build/x64-Debug (default)/_deps/glfw-subbuild/glfw-populate-prefix/src/glfw-populate-stamp/glfw-populate-gitclone-lastrun.txt")
  message(STATUS "Avoiding repeated git clone, stamp file is up to date: 'E:/Edu/UJ/Programowanie_3d/3d-main/out/build/x64-Debug (default)/_deps/glfw-subbuild/glfw-populate-prefix/src/glfw-populate-stamp/glfw-populate-gitclone-lastrun.txt'")
  return()
endif()

execute_process(
  COMMAND ${CMAKE_COMMAND} -E rm -rf "E:/Edu/UJ/Programowanie_3d/3d-main/out/build/x64-Debug (default)/_deps/glfw-src"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to remove directory: 'E:/Edu/UJ/Programowanie_3d/3d-main/out/build/x64-Debug (default)/_deps/glfw-src'")
endif()

# try the clone 3 times in case there is an odd git clone issue
set(error_code 1)
set(number_of_tries 0)
while(error_code AND number_of_tries LESS 3)
  execute_process(
    COMMAND "C:/Program Files/Git/cmd/git.exe"  clone --no-checkout "https://github.com/glfw/glfw.git" "glfw-src"
    WORKING_DIRECTORY "E:/Edu/UJ/Programowanie_3d/3d-main/out/build/x64-Debug (default)/_deps"
    RESULT_VARIABLE error_code
    )
  math(EXPR number_of_tries "${number_of_tries} + 1")
endwhile()
if(number_of_tries GREATER 1)
  message(STATUS "Had to git clone more than once:
          ${number_of_tries} times.")
endif()
if(error_code)
  message(FATAL_ERROR "Failed to clone repository: 'https://github.com/glfw/glfw.git'")
endif()

execute_process(
  COMMAND "C:/Program Files/Git/cmd/git.exe"  checkout master --
  WORKING_DIRECTORY "E:/Edu/UJ/Programowanie_3d/3d-main/out/build/x64-Debug (default)/_deps/glfw-src"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to checkout tag: 'master'")
endif()

set(init_submodules TRUE)
if(init_submodules)
  execute_process(
    COMMAND "C:/Program Files/Git/cmd/git.exe"  submodule update --recursive --init 
    WORKING_DIRECTORY "E:/Edu/UJ/Programowanie_3d/3d-main/out/build/x64-Debug (default)/_deps/glfw-src"
    RESULT_VARIABLE error_code
    )
endif()
if(error_code)
  message(FATAL_ERROR "Failed to update submodules in: 'E:/Edu/UJ/Programowanie_3d/3d-main/out/build/x64-Debug (default)/_deps/glfw-src'")
endif()

# Complete success, update the script-last-run stamp file:
#
execute_process(
  COMMAND ${CMAKE_COMMAND} -E copy
    "E:/Edu/UJ/Programowanie_3d/3d-main/out/build/x64-Debug (default)/_deps/glfw-subbuild/glfw-populate-prefix/src/glfw-populate-stamp/glfw-populate-gitinfo.txt"
    "E:/Edu/UJ/Programowanie_3d/3d-main/out/build/x64-Debug (default)/_deps/glfw-subbuild/glfw-populate-prefix/src/glfw-populate-stamp/glfw-populate-gitclone-lastrun.txt"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to copy script-last-run stamp file: 'E:/Edu/UJ/Programowanie_3d/3d-main/out/build/x64-Debug (default)/_deps/glfw-subbuild/glfw-populate-prefix/src/glfw-populate-stamp/glfw-populate-gitclone-lastrun.txt'")
endif()

