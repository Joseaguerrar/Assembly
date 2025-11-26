## Assembly Program to Compute the Dot Product of Two Vectors

### Program Description

1. **Dot Product Calculation**:
   - Consider the computation of the dot product of two vectors in three-dimensional space, A and B, represented as:
   - A = (a₁, a₂, a₃) and B = (b₁, b₂, b₃).
   - The assembly program (x86-64) will compute the dot product (scalar product) of vectors A and B using the corresponding formula.
   - The result must be stored in a memory location pointed to by a label called `respuesta`.

2. **Formula for the Dot Product**:
   - The dot product of two vectors A and B in three-dimensional space is computed as:
   - A · B = a₁ * b₁ + a₂ * b₂ + a₃ * b₃.

### Important Considerations:

- You must have the `.data` and `.text` sections.
- The `.text` section must include the code to return control to the operating system.
- Assume that the values aᵢ and bᵢ are in the range from -15000 to +15000. Therefore, use data types that do not “waste” bytes.
- The appropriate use of registers, addressing modes, etc. will be graded (for example, you may not use the registers assigned to the stack – rbp, rsp).
- Please present code that is neatly formatted and properly indented.
