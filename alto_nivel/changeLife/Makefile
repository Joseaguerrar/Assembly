# Name of executable
EXEC = main

# Source files
ASM_SRC = subtract_life.asm
CPP_SRC = main.cpp

# Object files
ASM_OBJ = $(ASM_SRC:.asm=.o)
CPP_OBJ = $(CPP_SRC:.cpp=.o)

# Compilers and options
NASM = nasm
NASM_FLAGS = -f elf64

CXX = g++
CXX_FLAGS = -std=c++17 -Wall -Wextra

# Default Rule
all: $(EXEC)

# Links the objects and generates executable
$(EXEC): $(ASM_OBJ) $(CPP_OBJ)
	$(CXX) -o $@ $^

# Compiles ASM file to object file
%.o: %.asm
	$(NASM) $(NASM_FLAGS) -o $@ $<

# Compiles C++ file to object file
%.o: %.cpp
	$(CXX) $(CXX_FLAGS) -c $< -o $@

# Cleaning
clean:
	rm -f $(EXEC) $(ASM_OBJ) $(CPP_OBJ)

# Phony targets
.PHONY: all clean
