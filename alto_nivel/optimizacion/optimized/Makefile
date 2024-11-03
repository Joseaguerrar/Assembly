# Nombre del ejecutable
EXECUTABLE = ejercicio3

# Archivos fuente
ASM_SRC = ejercicio_3_optimized.asm

# Archivos objeto
ASM_OBJ = ejercicio_3_optimized_asm.o

# Compilador y ensamblador
NASM = nasm

# Opciones de compilación
NASM_FLAGS = -g -f elf64

# Regla por defecto
compile: $(EXECUTABLE)

# Regla para generar el ejecutable
$(EXECUTABLE): $(ASM_OBJ)
	ld -o $(EXECUTABLE) $(ASM_OBJ)

# Regla para compilar el ensamblador
$(ASM_OBJ): $(ASM_SRC)
	$(NASM) $(NASM_FLAGS) -o $(ASM_OBJ) $(ASM_SRC)

# Limpieza de archivos objeto y ejecutable
clean:
	rm -f $(ASM_OBJ) $(EXECUTABLE)

# Compilar, limpiar y ejecutar
run: clean compile
	./$(EXECUTABLE)