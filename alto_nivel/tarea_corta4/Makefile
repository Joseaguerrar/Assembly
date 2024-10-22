# Nombre del ejecutable
EXECUTABLE = fibo

# Archivos fuente
ASM_SRC = fibo.asm
CPP_SRC = fibo.cpp

# Archivos objeto
ASM_OBJ = fibo_asm.o
CPP_OBJ = fibo_cpp.o

# Compilador y ensamblador
NASM = nasm
GXX = g++

# Opciones de compilación
NASM_FLAGS = -g -f elf64
GXX_FLAGS = -g -c -no-pie
LINK_FLAGS = -g -no-pie

# Regla por defecto
compile: $(EXECUTABLE)

# Regla para generar el ejecutable
$(EXECUTABLE): $(ASM_OBJ) $(CPP_OBJ)
	$(GXX) $(LINK_FLAGS) -o $(EXECUTABLE) $(CPP_OBJ) $(ASM_OBJ)

# Regla para compilar el ensamblador
$(ASM_OBJ): $(ASM_SRC)
	$(NASM) $(NASM_FLAGS) -o $(ASM_OBJ) $(ASM_SRC)

# Regla para compilar el código C++
$(CPP_OBJ): $(CPP_SRC)
	$(GXX) $(GXX_FLAGS) -o $(CPP_OBJ) $(CPP_SRC)

# Limpieza de archivos objeto y ejecutable
clean:
	rm -f $(ASM_OBJ) $(CPP_OBJ) $(EXECUTABLE)

# Compilar, limpiar y ejecutar
run: clean compile
	./$(EXECUTABLE)
