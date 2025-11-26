# Exam 2
This folder contains the programmed portion of Exam 2.

## Instructions
For a very particular IoT system, it is necessary to store sensor measurement timestamps in the most efficient way possible (i.e., using the smallest number of bits). The complete date and detailed time are not required—only the following data:

* Whether the data was taken before noon or after noon.
* The day of the week (Monday to Sunday).
* The month of the year.

Do the following:
1. Propose a way to store these data using the smallest possible number of bits (considering that you must manipulate the bits of a data type already used in C/C++). Add at least 3 examples of how a specific scenario would look (e.g., Monday in January at 9 AM would look like this...). Put your proposal and examples in the README file you must submit.

2. Write a program using C/C++ and assembly language that asks the user for a number, letter, or whatever you consider appropriate to represent a timestamp (according to your proposal), and then print which day of the week, time of day, and month correspond to the data read.

## Additional Notes
It must also be possible to provide your program with the time of day, day of the week, and month of the year so it can generate a timestamp.

The generation or interpretation of the timestamp must print the result on screen. Both generation and interpretation must be done in assembly language. Input and output can be done in high-level code.

Your code must be original, well-organized (proper indentation), variable names and labels must be meaningful, and internal documentation is required.

## Efficient Timestamp Storage Proposal

Since we need to store the data using the fewest bits possible, we distribute the information as follows:

1. Time of day (AM/PM):

There are only two possible values: before noon (AM) or after noon (PM).  
We need 1 bit to represent this information.  
0 = AM  
1 = PM

2. Day of the week:

There are 7 days (Monday to Sunday).  
To represent 7 values, we need 3 bits.  
Example: 000 = Monday, 001 = Tuesday, ..., 110 = Sunday.

3. Month of the year:

There are 12 months (January to December).  
To represent 12 values, we need 4 bits.  
Example: 0001 = January, 0010 = February, ..., 1100 = December.

### Total bits needed:
1 (Time of day) + 3 (Day of the week) + 4 (Month) = 8 bits.

This means a full timestamp can be stored in just one byte (8 bits).

## Timestamp Examples
Let’s suppose the following scenarios:

1. Monday in January before noon:

AM = 0  
Monday = 000  
January = 0001  
Binary timestamp: **00000001**  
Hex representation: **0x01**

2. Friday in June after noon:

PM = 1  
Friday = 100  
June = 0110  
Binary timestamp: **11000110**  
Hex representation: **0xC6**

3. Sunday in December before noon:

AM = 0  
Sunday = 110  
December = 1100  
Binary timestamp: **01101100**  
Hex representation: **0x6C**

## Program Flow Explanation
### Timestamp Generation
#### Input:
The program asks the user for three values:
* Time of day (AM/PM).
* Day of the week (Monday to Sunday).
* Month of the year (January to December).

#### Validation:
The program ensures inputs are valid:
* Time of day: 0 or 1.
* Day of the week: 0 to 6.
* Month: 1 to 12.

#### Constructing the Timestamp:
User input is converted into a single byte using bitwise operations.  
The time of day is stored in the most significant bit (MSB).  
The remaining bits store the day of the week and month.

#### Result:
The generated timestamp is printed in hexadecimal.

### Timestamp Decoding
#### Timestamp Input:
The program asks the user for a hexadecimal number representing the timestamp.

#### Decoding:
Using bitwise operations, the program extracts:
* Time of day (most significant bit).
* Day of the week (3 middle bits).
* Month (4 least significant bits).

#### Result:
The program prints the meaning in natural language:
* Time of day: “before noon” or “after noon”.
* Day of the week: “Monday”, “Tuesday”, ..., “Sunday”.
* Month: “January”, “February”, ..., “December”.

## User Manual
This manual describes how to compile, run, and test the program using the provided Makefile.

### Requirements
1. Necessary tools:
* g++: To compile the C++ code.
* nasm: To assemble the assembly code.
* A compatible operating system (Linux recommended).

2. Project structure:
Project files:
* main.cpp: Main C++ file that handles input and output.
* timestamp.asm: Assembly file implementing timestamp generation and decoding.
* Makefile: Compilation automation file.

### Available Makefile Commands
### Compile the program:

Terminal command:

1. `make`

This command compiles the program, generating the executable in the **bin/** directory under the name **program**.

### Run the program:

Terminal command:

2. `make run`

This command compiles the program (if not already compiled) and executes it directly. Useful for quick tests.

### Clean generated files:

Terminal command:

3. `make clean`

This command removes the **build/** directory (object files) and **bin/** (executable), returning the project to its initial state.
