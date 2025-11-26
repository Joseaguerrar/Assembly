# Executable name
TARGET = main

# Source files
ASM_SRC = random_number.asm
CPP_SRC = main.cpp

# Intermediate files
ASM_OBJ = $(ASM_SRC:.asm=.o)
CPP_OBJ = $(CPP_SRC:.cpp=.o)

# Compilers
NASM = nasm
CXX = g++

# Compilation options
NASMFLAGS = -f elf64
CXXFLAGS = -Wall -O2

# Rules
all: $(TARGET)

$(TARGET): $(ASM_OBJ) $(CPP_OBJ)
	$(CXX) $(CXXFLAGS) -o $@ $^

%.o: %.asm
	$(NASM) $(NASMFLAGS) -o $@ $<

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c -o $@ $<

clean:
	rm -f $(TARGET) $(ASM_OBJ) $(CPP_OBJ)
