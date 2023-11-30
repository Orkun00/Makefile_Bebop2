Bebop 2 Drone Project

This project is designed for developing and deploying C programs to the Bebop 2 drone. It includes a Makefile that automates the process of compiling C source files, uploading compiled programs to the drone, and cleaning up binaries.
Project Structure

    src/: Directory containing C source files.
    bin/: Directory where compiled executables are stored.
    Makefile: Script used for compiling and managing executables.

Prerequisites
    You need src and bin directories.
    
    You must install this repository next to src and bin directories.

    Ensure you have the ARM cross-compiler installed: arm-linux-gnueabi-gcc.
    The drone should be connected to the same network as your computer and reachable via its IP address.

Makefile Usage

Run these commands from the root directory of the project.
Compile a Specific Program

To compile a specific program (e.g., myprogram.c), run:

bash

make myprogram

This compiles src/myprogram.c into an executable and places it in the bin directory.
Compile All Programs

To compile all .c files in the src directory, run:

bash

make all

This will create executables for each source file in the bin directory.
Upload a Specific Program

To upload a specific program (e.g., myprogram) to the drone, run:

bash

make upload-myprogram

Ensure the executable myprogram exists in the bin directory.
Upload All Programs

To upload all compiled programs in the bin directory to the drone, run:

bash

make upload-all

Clean Up

To remove all compiled binaries from the bin directory, run:

bash

make clean

Note

    Modify the DRONE_IP in the Makefile to match your drone's IP address.
    The default upload path in the Makefile should be adjusted to the correct directory on your drone.
