# Nombre del ejecutable
EXECUTABLE = productoCruz
PACKED_EXECUTABLE = productoCruzPacked

# Archivos fuente
ASM_SRC = producto_cruz.asm
CPP_SRC = producto_cruz.cpp

PACKED_ASM_SRC = pcruz_packed.asm
PACKED_CPP_SRC = pcruz_packed.cpp

# Archivos objeto
ASM_OBJ = $(OUTPUT_DIR)/pcruz_asm.o
CPP_OBJ = $(OUTPUT_DIR)/pcruz_cpp.o

PACKED_ASM_OBJ = $(OUTPUT_DIR)/pcruz_packed_asm.o
PACKED_CPP_OBJ = $(OUTPUT_DIR)/pcruz_packed_cpp.o

# Compilador y ensamblador
NASM = nasm
GXX = g++

# Opciones de compilación
NASM_FLAGS = -g -f elf64
GXX_FLAGS = -g -c -no-pie
LINK_FLAGS = -g -no-pie

# Directorio de archivos generados
OUTPUT_DIR = code_generated

# Crear el directorio si no existe
$(OUTPUT_DIR):
	mkdir -p $(OUTPUT_DIR)

# Regla por defecto (cruz)
cruz: $(OUTPUT_DIR) $(EXECUTABLE)

# Regla para generar el ejecutable (cruz)
$(EXECUTABLE): $(ASM_OBJ) $(CPP_OBJ)
	$(GXX) $(LINK_FLAGS) -o $(OUTPUT_DIR)/$(EXECUTABLE) $(CPP_OBJ) $(ASM_OBJ)

# Regla para compilar el ensamblador (cruz)
$(ASM_OBJ): $(ASM_SRC) | $(OUTPUT_DIR)
	$(NASM) $(NASM_FLAGS) -o $(ASM_OBJ) $(ASM_SRC)

# Regla para compilar el código C++ (cruz)
$(CPP_OBJ): $(CPP_SRC) | $(OUTPUT_DIR)
	$(GXX) $(GXX_FLAGS) -o $(CPP_OBJ) $(CPP_SRC)

# Regla para el producto cruz empaquetado (packed)
packed: $(OUTPUT_DIR) $(PACKED_EXECUTABLE)

# Regla para generar el ejecutable (packed)
$(PACKED_EXECUTABLE): $(PACKED_ASM_OBJ) $(PACKED_CPP_OBJ)
	$(GXX) $(LINK_FLAGS) -o $(OUTPUT_DIR)/$(PACKED_EXECUTABLE) $(PACKED_CPP_OBJ) $(PACKED_ASM_OBJ)

# Regla para compilar el ensamblador (packed)
$(PACKED_ASM_OBJ): $(PACKED_ASM_SRC) | $(OUTPUT_DIR)
	$(NASM) $(NASM_FLAGS) -o $(PACKED_ASM_OBJ) $(PACKED_ASM_SRC)

# Regla para compilar el código C++ (packed)
$(PACKED_CPP_OBJ): $(PACKED_CPP_SRC) | $(OUTPUT_DIR)
	$(GXX) $(GXX_FLAGS) -o $(PACKED_CPP_OBJ) $(PACKED_CPP_SRC)

# Limpieza de archivos objeto y ejecutables
clean:
	rm -f $(ASM_OBJ) $(CPP_OBJ) $(PACKED_ASM_OBJ) $(PACKED_CPP_OBJ)
	rm -f $(OUTPUT_DIR)/$(EXECUTABLE) $(OUTPUT_DIR)/$(PACKED_EXECUTABLE)

# Compilar, limpiar y ejecutar (cruz)
run_cruz: clean cruz
	./$(OUTPUT_DIR)/$(EXECUTABLE)

# Compilar, limpiar y ejecutar (packed)
run_packed: clean packed
	./$(OUTPUT_DIR)/$(PACKED_EXECUTABLE)
