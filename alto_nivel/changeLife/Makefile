# Nombre del ejecutable
EXEC = main

# Archivos fuente
ASM_SRC = subtract_life.asm
CPP_SRC = main.cpp

# Archivos objeto
ASM_OBJ = $(ASM_SRC:.asm=.o)
CPP_OBJ = $(CPP_SRC:.cpp=.o)

# Compiladores y opciones
NASM = nasm
NASM_FLAGS = -f elf64

CXX = g++
CXX_FLAGS = -std=c++17 -Wall -Wextra

# Regla por defecto
all: $(EXEC)

# Enlaza los objetos y genera el ejecutable
$(EXEC): $(ASM_OBJ) $(CPP_OBJ)
	$(CXX) -o $@ $^

# Compila el archivo ASM a objeto
%.o: %.asm
	$(NASM) $(NASM_FLAGS) -o $@ $<

# Compila el archivo C++ a objeto
%.o: %.cpp
	$(CXX) $(CXX_FLAGS) -c $< -o $@

# Limpieza
clean:
	rm -f $(EXEC) $(ASM_OBJ) $(CPP_OBJ)

# Phony targets
.PHONY: all clean