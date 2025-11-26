# Executable name
EXECUTABLE = productoCruz
PACKED_EXECUTABLE = productoCruzPacked

# Source files
ASM_SRC = producto_cruz.asm
CPP_SRC = producto_cruz.cpp

PACKED_ASM_SRC = pcruz_packed.asm
PACKED_CPP_SRC = pcruz_packed.cpp

# Object files
ASM_OBJ = $(OUTPUT_DIR)/pcruz_asm.o
CPP_OBJ = $(OUTPUT_DIR)/pcruz_cpp.o

PACKED_ASM_OBJ = $(OUTPUT_DIR)/pcruz_packed_asm.o
PACKED_CPP_OBJ = $(OUTPUT_DIR)/pcruz_packed_cpp.o

# Compiler and assembler
NASM = nasm
GXX = g++

# Compilation options
NASM_FLAGS = -g -f elf64
GXX_FLAGS = -g -c -no-pie
LINK_FLAGS = -g -no-pie

# Directory for generated files
OUTPUT_DIR = code_generated

# Create the directory if it does not exist
$(OUTPUT_DIR):
	mkdir -p $(OUTPUT_DIR)

# Default rule (cross)
cruz: $(OUTPUT_DIR) $(EXECUTABLE)

# Rule to generate the executable (cross)
$(EXECUTABLE): $(ASM_OBJ) $(CPP_OBJ)
	$(GXX) $(LINK_FLAGS) -o $(OUTPUT_DIR)/$(EXECUTABLE) $(CPP_OBJ) $(ASM_OBJ)

# Rule to compile the assembly file (cross)
$(ASM_OBJ): $(ASM_SRC) | $(OUTPUT_DIR)
	$(NASM) $(NASM_FLAGS) -o $(ASM_OBJ) $(ASM_SRC)

# Rule to compile the C++ code (cross)
$(CPP_OBJ): $(CPP_SRC) | $(OUTPUT_DIR)
	$(GXX) $(GXX_FLAGS) -o $(CPP_OBJ) $(CPP_SRC)

# Rule for the packed cross product
packed: $(OUTPUT_DIR) $(PACKED_EXECUTABLE)

# Rule to generate the executable (packed)
$(PACKED_EXECUTABLE): $(PACKED_ASM_OBJ) $(PACKED_CPP_OBJ)
	$(GXX) $(LINK_FLAGS) -o $(OUTPUT_DIR)/$(PACKED_EXECUTABLE) $(PACKED_CPP_OBJ) $(PACKED_ASM_OBJ)

# Rule to compile the assembly file (packed)
$(PACKED_ASM_OBJ): $(PACKED_ASM_SRC) | $(OUTPUT_DIR)
	$(NASM) $(NASM_FLAGS) -o $(PACKED_ASM_OBJ) $(PACKED_ASM_SRC)

# Rule to compile the C++ code (packed)
$(PACKED_CPP_OBJ): $(PACKED_CPP_SRC) | $(OUTPUT_DIR)
	$(GXX) $(GXX_FLAGS) -o $(PACKED_CPP_OBJ) $(PACKED_CPP_SRC)

# Clean object files and executables
clean:
	rm -f $(ASM_OBJ) $(CPP_OBJ) $(PACKED_ASM_OBJ) $(PACKED_CPP_OBJ)
	rm -f $(OUTPUT_DIR)/$(EXECUTABLE) $(OUTPUT_DIR)/$(PACKED_EXECUTABLE)

# Compile, clean, and run (cross)
run_cruz: clean cruz
	./$(OUTPUT_DIR)/$(EXECUTABLE)

# Compile, clean, and run (packed)
run_packed: clean packed
	./$(OUTPUT_DIR)/$(PACKED_EXECUTABLE)
