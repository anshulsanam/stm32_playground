# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.26

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/Cellar/cmake/3.26.4/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake/3.26.4/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/anshulsanam/stm32/Start

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/anshulsanam/stm32/Start/build

# Include any dependencies generated for this target.
include CMakeFiles/stm32-playground.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/stm32-playground.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/stm32-playground.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/stm32-playground.dir/flags.make

CMakeFiles/stm32-playground.dir/src/main.c.obj: CMakeFiles/stm32-playground.dir/flags.make
CMakeFiles/stm32-playground.dir/src/main.c.obj: /Users/anshulsanam/stm32/Start/src/main.c
CMakeFiles/stm32-playground.dir/src/main.c.obj: CMakeFiles/stm32-playground.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/anshulsanam/stm32/Start/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/stm32-playground.dir/src/main.c.obj"
	/usr/local/bin/arm-none-eabi-gcc -fdata-sections -ffunction-sections -Wl,--gc-sections $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/stm32-playground.dir/src/main.c.obj -MF CMakeFiles/stm32-playground.dir/src/main.c.obj.d -o CMakeFiles/stm32-playground.dir/src/main.c.obj -c /Users/anshulsanam/stm32/Start/src/main.c

CMakeFiles/stm32-playground.dir/src/main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/stm32-playground.dir/src/main.c.i"
	/usr/local/bin/arm-none-eabi-gcc -fdata-sections -ffunction-sections -Wl,--gc-sections $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/anshulsanam/stm32/Start/src/main.c > CMakeFiles/stm32-playground.dir/src/main.c.i

CMakeFiles/stm32-playground.dir/src/main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/stm32-playground.dir/src/main.c.s"
	/usr/local/bin/arm-none-eabi-gcc -fdata-sections -ffunction-sections -Wl,--gc-sections $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/anshulsanam/stm32/Start/src/main.c -o CMakeFiles/stm32-playground.dir/src/main.c.s

CMakeFiles/stm32-playground.dir/src/startup.c.obj: CMakeFiles/stm32-playground.dir/flags.make
CMakeFiles/stm32-playground.dir/src/startup.c.obj: /Users/anshulsanam/stm32/Start/src/startup.c
CMakeFiles/stm32-playground.dir/src/startup.c.obj: CMakeFiles/stm32-playground.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/anshulsanam/stm32/Start/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/stm32-playground.dir/src/startup.c.obj"
	/usr/local/bin/arm-none-eabi-gcc -fdata-sections -ffunction-sections -Wl,--gc-sections $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/stm32-playground.dir/src/startup.c.obj -MF CMakeFiles/stm32-playground.dir/src/startup.c.obj.d -o CMakeFiles/stm32-playground.dir/src/startup.c.obj -c /Users/anshulsanam/stm32/Start/src/startup.c

CMakeFiles/stm32-playground.dir/src/startup.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/stm32-playground.dir/src/startup.c.i"
	/usr/local/bin/arm-none-eabi-gcc -fdata-sections -ffunction-sections -Wl,--gc-sections $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/anshulsanam/stm32/Start/src/startup.c > CMakeFiles/stm32-playground.dir/src/startup.c.i

CMakeFiles/stm32-playground.dir/src/startup.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/stm32-playground.dir/src/startup.c.s"
	/usr/local/bin/arm-none-eabi-gcc -fdata-sections -ffunction-sections -Wl,--gc-sections $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/anshulsanam/stm32/Start/src/startup.c -o CMakeFiles/stm32-playground.dir/src/startup.c.s

CMakeFiles/stm32-playground.dir/src/syscalls.c.obj: CMakeFiles/stm32-playground.dir/flags.make
CMakeFiles/stm32-playground.dir/src/syscalls.c.obj: /Users/anshulsanam/stm32/Start/src/syscalls.c
CMakeFiles/stm32-playground.dir/src/syscalls.c.obj: CMakeFiles/stm32-playground.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/anshulsanam/stm32/Start/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object CMakeFiles/stm32-playground.dir/src/syscalls.c.obj"
	/usr/local/bin/arm-none-eabi-gcc -fdata-sections -ffunction-sections -Wl,--gc-sections $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/stm32-playground.dir/src/syscalls.c.obj -MF CMakeFiles/stm32-playground.dir/src/syscalls.c.obj.d -o CMakeFiles/stm32-playground.dir/src/syscalls.c.obj -c /Users/anshulsanam/stm32/Start/src/syscalls.c

CMakeFiles/stm32-playground.dir/src/syscalls.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/stm32-playground.dir/src/syscalls.c.i"
	/usr/local/bin/arm-none-eabi-gcc -fdata-sections -ffunction-sections -Wl,--gc-sections $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/anshulsanam/stm32/Start/src/syscalls.c > CMakeFiles/stm32-playground.dir/src/syscalls.c.i

CMakeFiles/stm32-playground.dir/src/syscalls.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/stm32-playground.dir/src/syscalls.c.s"
	/usr/local/bin/arm-none-eabi-gcc -fdata-sections -ffunction-sections -Wl,--gc-sections $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/anshulsanam/stm32/Start/src/syscalls.c -o CMakeFiles/stm32-playground.dir/src/syscalls.c.s

CMakeFiles/stm32-playground.dir/src/systick.c.obj: CMakeFiles/stm32-playground.dir/flags.make
CMakeFiles/stm32-playground.dir/src/systick.c.obj: /Users/anshulsanam/stm32/Start/src/systick.c
CMakeFiles/stm32-playground.dir/src/systick.c.obj: CMakeFiles/stm32-playground.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/anshulsanam/stm32/Start/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object CMakeFiles/stm32-playground.dir/src/systick.c.obj"
	/usr/local/bin/arm-none-eabi-gcc -fdata-sections -ffunction-sections -Wl,--gc-sections $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -MD -MT CMakeFiles/stm32-playground.dir/src/systick.c.obj -MF CMakeFiles/stm32-playground.dir/src/systick.c.obj.d -o CMakeFiles/stm32-playground.dir/src/systick.c.obj -c /Users/anshulsanam/stm32/Start/src/systick.c

CMakeFiles/stm32-playground.dir/src/systick.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/stm32-playground.dir/src/systick.c.i"
	/usr/local/bin/arm-none-eabi-gcc -fdata-sections -ffunction-sections -Wl,--gc-sections $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /Users/anshulsanam/stm32/Start/src/systick.c > CMakeFiles/stm32-playground.dir/src/systick.c.i

CMakeFiles/stm32-playground.dir/src/systick.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/stm32-playground.dir/src/systick.c.s"
	/usr/local/bin/arm-none-eabi-gcc -fdata-sections -ffunction-sections -Wl,--gc-sections $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /Users/anshulsanam/stm32/Start/src/systick.c -o CMakeFiles/stm32-playground.dir/src/systick.c.s

# Object files for target stm32-playground
stm32__playground_OBJECTS = \
"CMakeFiles/stm32-playground.dir/src/main.c.obj" \
"CMakeFiles/stm32-playground.dir/src/startup.c.obj" \
"CMakeFiles/stm32-playground.dir/src/syscalls.c.obj" \
"CMakeFiles/stm32-playground.dir/src/systick.c.obj"

# External object files for target stm32-playground
stm32__playground_EXTERNAL_OBJECTS =

stm32-playground.elf: CMakeFiles/stm32-playground.dir/src/main.c.obj
stm32-playground.elf: CMakeFiles/stm32-playground.dir/src/startup.c.obj
stm32-playground.elf: CMakeFiles/stm32-playground.dir/src/syscalls.c.obj
stm32-playground.elf: CMakeFiles/stm32-playground.dir/src/systick.c.obj
stm32-playground.elf: CMakeFiles/stm32-playground.dir/build.make
stm32-playground.elf: CMakeFiles/stm32-playground.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/anshulsanam/stm32/Start/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Linking C executable stm32-playground.elf"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/stm32-playground.dir/link.txt --verbose=$(VERBOSE)
	arm-none-eabi-size /Users/anshulsanam/stm32/Start/build/stm32-playground.elf
	arm-none-eabi-objcopy -O ihex /Users/anshulsanam/stm32/Start/build/stm32-playground.elf stm32-playground.hex
	arm-none-eabi-objcopy -O binary /Users/anshulsanam/stm32/Start/build/stm32-playground.elf stm32-playground.bin

# Rule to build all files generated by this target.
CMakeFiles/stm32-playground.dir/build: stm32-playground.elf
.PHONY : CMakeFiles/stm32-playground.dir/build

CMakeFiles/stm32-playground.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/stm32-playground.dir/cmake_clean.cmake
.PHONY : CMakeFiles/stm32-playground.dir/clean

CMakeFiles/stm32-playground.dir/depend:
	cd /Users/anshulsanam/stm32/Start/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/anshulsanam/stm32/Start /Users/anshulsanam/stm32/Start /Users/anshulsanam/stm32/Start/build /Users/anshulsanam/stm32/Start/build /Users/anshulsanam/stm32/Start/build/CMakeFiles/stm32-playground.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/stm32-playground.dir/depend
