# Compilador C++
CC = g++

# Ensamblador
ASM = nasm

# Opciones de compilación
CFLAGS = -Wall -g
ASMFLAGS = -f elf64

# Carpetas
BIN_DIR = bin
BUILD_DIR = build

# Nombre del ejecutable
EXECUTABLE = filtros

# Objetivo final
all: sepia

# Crear carpetas si no existen
$(BIN_DIR) $(BUILD_DIR):
	mkdir -p $@

# Crear el ejecutable en la carpeta bin
sepia: $(BIN_DIR) $(BUILD_DIR) $(BUILD_DIR)/main.o $(BUILD_DIR)/sepia_filter.o
	$(CC) $(CFLAGS) -no-pie -o $(BIN_DIR)/$(EXECUTABLE) $(BUILD_DIR)/main.o $(BUILD_DIR)/sepia_filter.o

# Compilar el archivo fuente en C++
$(BUILD_DIR)/main.o: main.cpp | $(BUILD_DIR)
	$(CC) $(CFLAGS) -c main.cpp -o $(BUILD_DIR)/main.o

# Ensamblar el archivo de filtro sepia en ensamblador
$(BUILD_DIR)/sepia_filter.o: sepia_filter.asm | $(BUILD_DIR)
	$(ASM) $(ASMFLAGS) sepia_filter.asm -o $(BUILD_DIR)/sepia_filter.o

# Eliminar archivos intermedios y ejecutables para limpieza
clean:
	rm -rf $(BUILD_DIR) $(BIN_DIR)

.PHONY: all sepia clean
