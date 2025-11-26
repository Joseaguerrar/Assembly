# Executable name
EXECUTABLE = cuadratic

# Source files
ASM_SRC = cuadratic.asm
CPP_SRC = cuadratic.cpp

# Object files
ASM_OBJ = cuadratic_asm.o
CPP_OBJ = cuadratic_cpp.o

# Compiler and assembler
NASM = nasm
GXX = g++

# Compiling options
NASM_FLAGS = -g -f elf64
GXX_FLAGS = -g -c -no-pie
LINK_FLAGS = -g -no-pie

# Default Rule
compile: $(EXECUTABLE)

# Rule to generate executable
$(EXECUTABLE): $(ASM_OBJ) $(CPP_OBJ)
	$(GXX) $(LINK_FLAGS) -o $(EXECUTABLE) $(CPP_OBJ) $(ASM_OBJ)

# Rule to compile assembler
$(ASM_OBJ): $(ASM_SRC)
	$(NASM) $(NASM_FLAGS) -o $(ASM_OBJ) $(ASM_SRC)

# Rule to compile the C++ code
$(CPP_OBJ): $(CPP_SRC)
	$(GXX) $(GXX_FLAGS) -o $(CPP_OBJ) $(CPP_SRC)

# Cleaning of object files and executable
clean:
	rm -f $(ASM_OBJ) $(CPP_OBJ) $(EXECUTABLE)

# Compile, clean and execute
run: clean compile
	./$(EXECUTABLE)
