# Executable name
EXECUTABLE = fibo

# Source files
ASM_SRC = fibo.asm
CPP_SRC = fibo.cpp

# Object files
ASM_OBJ = fibo_asm.o
CPP_OBJ = fibo_cpp.o

# Compiler and assembler
NASM = nasm
GXX = g++

# Compilation options
NASM_FLAGS = -g -f elf64
GXX_FLAGS = -g -c -no-pie
LINK_FLAGS = -g -no-pie

# Default rule
compile: $(EXECUTABLE)

# Rule to generate the executable
$(EXECUTABLE): $(ASM_OBJ) $(CPP_OBJ)
	$(GXX) $(LINK_FLAGS) -o $(EXECUTABLE) $(CPP_OBJ) $(ASM_OBJ)

# Rule to compile the assembly file
$(ASM_OBJ): $(ASM_SRC)
	$(NASM) $(NASM_FLAGS) -o $(ASM_OBJ) $(ASM_SRC)

# Rule to compile the C++ code
$(CPP_OBJ): $(CPP_SRC)
	$(GXX) $(GXX_FLAGS) -o $(CPP_OBJ) $(CPP_SRC)

# Clean object files and executable
clean:
	rm -f $(ASM_OBJ) $(CPP_OBJ) $(EXECUTABLE)

# Compile, clean, and run
run: clean compile
	./$(EXECUTABLE)
