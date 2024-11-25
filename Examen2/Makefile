# Nombre del ejecutable 
TARGET = bin/program

# Directorios
BUILD_DIR = build
BIN_DIR = bin

# Archivos fuente
CPP_SRC = main.cpp
ASM_SRC = timestamp.asm 

# Archivos objeto
CPP_OBJ = $(BUILD_DIR)/main.o
ASM_OBJ = $(BUILD_DIR)/timestamp.o 

# Compiladores
CXX = g++
ASM = nasm

# Opciones de compilación
CXXFLAGS = -std=c++17 -Wall -O2
ASMFLAGS = -f elf64

# Regla por defecto
all: $(BIN_DIR) $(BUILD_DIR) $(TARGET)

# Regla para crear el ejecutable
$(TARGET): $(CPP_OBJ) $(ASM_OBJ)
	$(CXX) -no-pie -o $(TARGET) $(CPP_OBJ) $(ASM_OBJ)

# Regla para compilar el archivo C++
$(CPP_OBJ): $(CPP_SRC) | $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) -c $(CPP_SRC) -o $(CPP_OBJ)

# Regla para compilar cada archivo ASM
$(BUILD_DIR)/%.o: %.asm | $(BUILD_DIR)
	$(ASM) $(ASMFLAGS) $< -o $@

# Regla para crear el directorio de objetos
$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

# Regla para crear el directorio del ejecutable
$(BIN_DIR):
	mkdir -p $(BIN_DIR)

# Limpieza de archivos objeto, ejecutable y directorios
clean:
	rm -rf $(BUILD_DIR) $(BIN_DIR)

# Regla para compilar y ejecutar el programa
run: all
	./$(TARGET)
