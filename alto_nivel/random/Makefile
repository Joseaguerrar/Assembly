# Nombre del ejecutable
TARGET = main

# Archivos fuente
ASM_SRC = random_number.asm
CPP_SRC = main.cpp

# Archivos intermedios
ASM_OBJ = $(ASM_SRC:.asm=.o)
CPP_OBJ = $(CPP_SRC:.cpp=.o)

# Compiladores
NASM = nasm
CXX = g++

# Opciones de compilación
NASMFLAGS = -f elf64
CXXFLAGS = -Wall -O2

# Reglas
all: $(TARGET)

$(TARGET): $(ASM_OBJ) $(CPP_OBJ)
	$(CXX) $(CXXFLAGS) -o $@ $^

%.o: %.asm
	$(NASM) $(NASMFLAGS) -o $@ $<

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c -o $@ $<

clean:
	rm -f $(TARGET) $(ASM_OBJ) $(CPP_OBJ)
