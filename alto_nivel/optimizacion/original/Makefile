# Executable name
EXECUTABLE = ejercicio3

# Source files
ASM_SRC = ejercicio_3.asm

# Object files
ASM_OBJ = ejercicio_3_asm.o

# Compiler and assembler
NASM = nasm

# Compilation options
NASM_FLAGS = -g -f elf64

# Default rule
compile: $(EXECUTABLE)

# Rule to generate the executable
$(EXECUTABLE): $(ASM_OBJ)
	ld -o $(EXECUTABLE) $(ASM_OBJ)

# Rule to compile the assembly file
$(ASM_OBJ): $(ASM_SRC)
	$(NASM) $(NASM_FLAGS) -o $(ASM_OBJ) $(ASM_SRC)

# Clean object files and executable
clean:
	rm -f $(ASM_OBJ) $(EXECUTABLE)

# Compile, clean, and run
run: clean compile
	./$(EXECUTABLE)
