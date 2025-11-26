# Assembly Optimization Exercise: Quadrant Swapping in a Matrix
## Description
This project implements an assembly program that performs quadrant swapping in a 4x4 matrix. The matrix is represented in memory with initial values, and the program uses assembly instructions to reorganize the elements according to the following operation:

- Swap the upper-left quadrant with the lower-right quadrant.  
- Swap the upper-right quadrant with the lower-left quadrant.

The program applies several performance optimizations based on Agner Fog’s recommendations from his assembly optimization manual. These optimizations aim to improve efficiency in terms of execution time and cache memory usage.

## Compilation and Execution
To compile and run this code, it is recommended to use the NASM assembler and a Linux environment compatible with 64-bit system calls.

### Compile the assembly file
nasm -f elf64 -o ejercicio_3_optimized_asm.o ejercicio_3_optimized.asm

### Link the object file
ld -o ejercicio_3_optimized ejercicio_3_optimized_asm.o

### Run the program
./ejercicio_3_optimized


## Applied Optimizations
The code includes three key optimizations to improve performance, all based on chapters 9 and 10 of Agner Fog’s assembly optimization manual.

### Optimization 1: Avoiding False Dependencies
**Description:** In the original code, partial registers (ax, bx) were used, which can cause false dependencies that limit out-of-order execution.  
**Applied Change:** Partial registers (ax, bx) were replaced with full registers (rax, rbx).  
**Benefit:** This allows the processor to handle instructions more efficiently by avoiding unnecessary stalls caused by partial register dependencies.

### Optimization 2: Minimizing Constant and Address Sizes
**Description:** To reduce code size and make more efficient use of cache, it is important to minimize the use of large constants and long addresses.  
**Applied Change:** The base address of the matrix was stored in the rdx register, and relative offsets were used instead of recalculating the base address in every instruction.  
**Benefit:** This reduces the code size, allowing it to fit better in the cache and improving overall efficiency.

### Optimization 3: Breaking Dependency Chains
**Description:** Long dependency chains can limit out-of-order execution, since each instruction depends on the results of the previous one.  
**Applied Change:** Additional registers (rcx, rdi) were introduced as intermediate accumulators, allowing swaps to be performed without relying on earlier results for pipelining.  
**Benefit:** By reducing dependency chain length, the processor can execute instructions in parallel, improving performance.

## Conclusion
This project demonstrates how assembly optimization can improve performance in low-level applications. By following specific recommendations, the code achieves faster execution and efficient memory usage, especially on modern architectures that rely on out-of-order execution and cache efficiency.
