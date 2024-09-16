#Copyright 2024 Camilo Montero Moya

EXECUTABLE = ejecutable

SRC = $(wildcard *.nasm)

OBJ = $(SRC:.nasm=.o)

NASM = nasm
LD = ld

NASM_FLAGS = -f elf64

.PHONY: all build run clean

all: build

build: $(EXECUTABLE)

$(EXECUTABLE): $(OBJ)
	$(LD) -o $(EXECUTABLE) $(OBJ)

$(OBJ): $(SRC)
	$(NASM) $(NASM_FLAGS) -o $(OBJ) $(SRC)

run: build
	./$(EXECUTABLE)

clean:
	rm -f $(OBJ) $(EXECUTABLE)
