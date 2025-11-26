# Name of the executable 
TARGET = bin/program

# Directories
BUILD_DIR = build
BIN_DIR = bin

# Source files
CPP_SRC = main.cpp
ASM_SRC = timestamp.asm 

# Object files
CPP_OBJ = $(BUILD_DIR)/main.o
ASM_OBJ = $(BUILD_DIR)/timestamp.o 

# Compilers
CXX = g++
ASM = nasm

# Compilation options
CXXFLAGS = -std=c++17 -Wall -O2
ASMFLAGS = -f elf64

# Default rule
all: $(BIN_DIR) $(BUILD_DIR) $(TARGET)

# Rule to create the executable
$(TARGET): $(CPP_OBJ) $(ASM_OBJ)
	$(CXX) -no-pie -o $(TARGET) $(CPP_OBJ) $(ASM_OBJ)

# Rule to compile the C++ file
$(CPP_OBJ): $(CPP_SRC) | $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) -c $(CPP_SRC) -o $(CPP_OBJ)

# Rule to compile each ASM file
$(BUILD_DIR)/%.o: %.asm | $(BUILD_DIR)
	$(ASM) $(ASMFLAGS) $< -o $@

# Rule to create the object directory
$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

# Rule to create the binary directory
$(BIN_DIR):
	mkdir -p $(BIN_DIR)

# Cleanup rule for object files, executable, and directories
clean:
	rm -rf $(BUILD_DIR) $(BIN_DIR)

# Rule to compile and run the program
run: all
	./$(TARGET)
