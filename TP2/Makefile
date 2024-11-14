# Compilador C++
CC = g++

# Ensamblador
ASM = nasm

# Opciones de compilación
CFLAGS = -Wall -g
ASMFLAGS = -f elf64

# Objetivo final
all: filtros

# Crear el ejecutable `filtros` a partir de los archivos objeto
filtros: main.o sepia_filter.o
	$(CC) $(CFLAGS) -no-pie -o filtros main.o sepia_filter.o

# Compilar el archivo fuente en C++
main.o: main.cpp
	$(CC) $(CFLAGS) -c main.cpp -o main.o

# Ensamblar el archivo de filtro sepia en ensamblador
sepia_filter.o: sepia_filter.asm
	$(ASM) $(ASMFLAGS) sepia_filter.asm -o sepia_filter.o

# Eliminar archivos intermedios y ejecutables para limpieza
clean:
	rm -f *.o filtros
