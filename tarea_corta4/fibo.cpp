#include <iostream>

extern "C" long _fibonacci(long num);

int main() {
    /* The number you enter will be the index of the sequence -1 since it starts at 0 */
    long num = 0;
    long resultado = _fibonacci(num);
    std::cout << "The Fibonacci number of " << num << " is: " << resultado << std::endl;

    num = 1;
    resultado = _fibonacci(num);
    std::cout << "The Fibonacci number of " << num << " is: " << resultado << std::endl;

    num = 2;
    resultado = _fibonacci(num);
    std::cout << "The Fibonacci number of " << num << " is: " << resultado << std::endl;

    num = 3;
    resultado = _fibonacci(num);
    std::cout << "The Fibonacci number of " << num << " is: " << resultado << std::endl;

    num = 4;
    resultado = _fibonacci(num);
    std::cout << "The Fibonacci number of " << num << " is: " << resultado << std::endl;

    num = 5;
    resultado = _fibonacci(num);
    std::cout << "The Fibonacci number of " << num << " is: " << resultado << std::endl;

    num = 6;
    resultado = _fibonacci(num);
    std::cout << "The Fibonacci number of " << num << " is: " << resultado << std::endl;

    num = 7;
    resultado = _fibonacci(num);
    std::cout << "The Fibonacci number of " << num << " is: " << resultado << std::endl;

    num = 8;
    resultado = _fibonacci(num);
    std::cout << "The Fibonacci number of " << num << " is: " << resultado << std::endl;

    num = 9;
    resultado = _fibonacci(num);
    std::cout << "The Fibonacci number of " << num << " is: " << resultado << std::endl;

    num = 10;
    resultado = _fibonacci(num);
    std::cout << "The Fibonacci number of " << num << " is: " << resultado << std::endl;
    return 0;
}
