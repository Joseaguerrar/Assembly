## Assembly Program to Compute Prime Numbers Using the Sieve of Eratosthenes

### 2. Program Description

Write an assembly program (x86-64) that computes all prime numbers less than or equal to 101 using the Sieve of Eratosthenes algorithm. Follow the instructions below:

1. **Data Section**:
   - Reserve space to store a 10x10 matrix of integers. Each number must be represented using 4 bytes.
   - Directly initialize all the numbers required by the sieve (from 2 to 101 in this case) inside the matrix.
   - Also define a zero-initialized vector large enough to store the resulting prime numbers. This vector must be named `resultado`.
   - Any other data (variables) you need may also be defined; you must document their purpose.

2. **`_start` Method**:
   - Inside your `_start` method, you may only include: method calls, method parameter assignments (when applicable), and the code required to return control to the operating system.
   - You must at least invoke the method described in the next section.

3. **Method to Extract Prime Numbers**:
   - Write a method that can be invoked from `_start` which extracts the prime numbers from the 10x10 matrix using the Sieve of Eratosthenes algorithm.
   - You may implement multiple helper methods to solve this problem. However, only *one* method may be invoked directly from `_start` (the one that includes all other method calls).
