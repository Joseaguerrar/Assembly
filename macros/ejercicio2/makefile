# Nombre del ejecutable
TARGET = ejercicio2

# Archivos fuente y objeto
ASM_SRC = ejercicio2.asm
OBJ = ejercicio2.o

# Compilador y enlazador
ASM = nasm
LD = ld

# Flags para NASM y LD
ASM_FLAGS = -f elf64
LD_FLAGS =

# Archivo preprocesado
PREPROCESSED = preprocesado.asm

# Regla principal
all: $(TARGET)

# Regla para crear el ejecutable
$(TARGET): $(OBJ)
	$(LD) $(LD_FLAGS) $(OBJ) -o $(TARGET)

# Regla para compilar el archivo de ensamblador
$(OBJ): $(ASM_SRC)
	$(ASM) $(ASM_FLAGS) $(ASM_SRC) -o $(OBJ)
	$(ASM) -f elf64 -E $(ASM_SRC) > $(PREPROCESSED)

# Limpieza de archivos generados
clean:
	rm -f $(OBJ) $(TARGET) $(PREPROCESSED)
