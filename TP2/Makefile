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
all: $(BIN_DIR) $(BUILD_DIR) $(BIN_DIR)/$(EXECUTABLE)

# Crear carpetas si no existen
$(BIN_DIR) $(BUILD_DIR):
	mkdir -p $@

# Crear el ejecutable en la carpeta bin
$(BIN_DIR)/$(EXECUTABLE): $(BUILD_DIR)/main.o $(BUILD_DIR)/sepia_filter.o $(BUILD_DIR)/grayscale_filter.o $(BUILD_DIR)/invert_filter.o $(BUILD_DIR)/binarize_filter.o
	$(CC) $(CFLAGS) -no-pie -o $@ $^

# Compilar el archivo fuente en C++
$(BUILD_DIR)/main.o: main.cpp | $(BUILD_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

# Ensamblar el archivo de filtro sepia
$(BUILD_DIR)/sepia_filter.o: sepia_filter.asm | $(BUILD_DIR)
	$(ASM) $(ASMFLAGS) $< -o $@

# Ensamblar el archivo de filtro escala de grises
$(BUILD_DIR)/grayscale_filter.o: grayscale_filter.asm | $(BUILD_DIR)
	$(ASM) $(ASMFLAGS) $< -o $@

# Ensamblar el archivo de filtro de inversión
$(BUILD_DIR)/invert_filter.o: invert_filter.asm | $(BUILD_DIR)
	$(ASM) $(ASMFLAGS) $< -o $@

# Ensamblar el archivo de filtro binarizador
$(BUILD_DIR)/binarize_filter.o: binarize_filter.asm | $(BUILD_DIR)
	$(ASM) $(ASMFLAGS) $< -o $@

# Eliminar archivos intermedios y ejecutables para limpieza
clean:
	rm -rf $(BUILD_DIR) $(BIN_DIR)

.PHONY: all clean
