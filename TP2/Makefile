CC = g++
ASM = nasm
CFLAGS = -Wall -g
ASMFLAGS = -f elf64

all: filtros

filtros: main.o sepia_filter.o
	$(CC) $(CFLAGS) -no-pie -o filtros main.o sepia_filter.o

main.o: main.cpp
	$(CC) $(CFLAGS) -c main.cpp

sepia_filter.o: sepia_filter.asm
	$(ASM) $(ASMFLAGS) sepia_filter.asm -o sepia_filter.o

clean:
	rm -f *.o filtros
