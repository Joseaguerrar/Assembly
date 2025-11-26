# Executable name
TARGET = ejercicio1

# Source and object files
ASM_SRC = ejercicio1.asm
OBJ = ejercicio1.o

# Assembler and linker
ASM = nasm
LD = ld

# Flags for NASM and LD
ASM_FLAGS = -f elf64
LD_FLAGS =

# Preprocessed file
PREPROCESSED = preprocessed.asm

# Main rule
all: $(TARGET)

# Rule to create the executable
$(TARGET): $(OBJ)
	$(LD) $(LD_FLAGS) $(OBJ) -o $(TARGET)

# Rule to assemble the source file
$(OBJ): $(ASM_SRC)
	$(ASM) $(ASM_FLAGS) $(ASM_SRC) -o $(OBJ)
	$(ASM) -f elf64 -E $(ASM_SRC) > $(PREPROCESSED)

# Clean generated files
clean:
	rm -f $(OBJ) $(TARGET) $(PREPROCESSED)
