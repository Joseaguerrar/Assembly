# What Is a Buffer Overflow Vulnerability?
A buffer overflow occurs when more information is written than a buffer can store, causing the data to exceed the allocated space. This can overwrite adjacent memory areas, including return addresses or important variables.

## Implications

1. Arbitrary code execution: an attacker can modify the return address to execute unauthorized functions (such as secretFunction in the first example).

2. Corruption of sensitive data: overwriting important variables on the stack.

3. Unexpected program crashes: the program may crash when accessing invalid memory.

## Examples and Analysis

### Example 1: Code With a Vulnerable Function

This program has a vulnerable function called *vuln*, which uses a fixed-size buffer (array[400]) to store the text entered by the user. If compiled without stack protections, an attacker can exploit this vulnerability to overwrite the function’s return address and execute unauthorized code, such as the *secretFunction*. The program demonstrates how malicious input can trigger unwanted actions.

1. Vulnerability:

>Although *fgets* controls the maximum input size, the *vuln* function uses a buffer (array[400]) on the stack, which could be overflowed if compiled without protections like stack-protector or NX-bit. This may allow an attacker to modify the return address and execute *secretFunction*.

2. Implications:

>If an attacker provides carefully crafted data, they could control execution and trigger *secretFunction*.

### Example 2: Serial Number Validation Code

This program validates a serial number entered by the user. It contains a vulnerability in the *validarNumeroDeSerie* function, since it uses a fixed-size buffer (numeroDeSerie[24]) without verifying that the input does not exceed this size. If the user enters more than 24 characters, adjacent memory areas are overwritten. This overflow could be exploited to alter data or even program flow.

1. Vulnerability:

>The function `fscanf(stdin, "%s", numeroDeSerie)` in *validarNumeroDeSerie* does not check whether the number of characters entered exceeds the buffer size numeroDeSerie[24].

>This allows overwriting adjacent memory if the user enters more than 24 characters.

2. Implications:

>An attacker can inject data to alter variables or control program flow.

### Preventing Buffer Overflow Vulnerabilities

1. Code improvements:
>Use safe functions such as *fgets* with proper limits.

>Manually check input length before processing it.

>Implement error handling in every memory-related operation.

2. Use of analysis tools:
>Use tools like Valgrind or ASan (Address Sanitizer) to detect potential buffer overflow issues.

## Assembly and Architecture Context

In the context of this course:

1. Early detection

>With assembly knowledge, it is possible to analyze the stack layout and detect potential areas where data may exceed allocated space or boundaries.

2. Low-level prevention

>Use stack control structures in assembly to ensure data does not overwrite critical areas.

>Implement manual checks in routines that manipulate buffers.

3. Activity monitoring

>Monitor registers such as the stack pointer (RSP) to detect anomalies at runtime.
