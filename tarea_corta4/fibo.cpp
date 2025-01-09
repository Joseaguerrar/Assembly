#include <iostream>

extern "C" long _fibonacci(long num);

int main() {
    /*El número que digite va a ser el índice de la secuencia -1 ya que empieza en 0*/
    long num = 0;
    long resultado = _fibonacci(num);
    std::cout << "El número Fibonacci de " << num << " es: " << resultado << std::endl;

    num = 1;
    resultado = _fibonacci(num);
    std::cout << "El número Fibonacci de " << num << " es: " << resultado << std::endl;

    num = 2;
    resultado = _fibonacci(num);
    std::cout << "El número Fibonacci de " << num << " es: " << resultado << std::endl;

    num = 3;
    resultado = _fibonacci(num);
    std::cout << "El número Fibonacci de " << num << " es: " << resultado << std::endl;

    num = 4;
    resultado = _fibonacci(num);
    std::cout << "El número Fibonacci de " << num << " es: " << resultado << std::endl;

    num = 5;
    resultado = _fibonacci(num);
    std::cout << "El número Fibonacci de " << num << " es: " << resultado << std::endl;

    num = 6;
    resultado = _fibonacci(num);
    std::cout << "El número Fibonacci de " << num << " es: " << resultado << std::endl;

    num = 7;
    resultado = _fibonacci(num);
    std::cout << "El número Fibonacci de " << num << " es: " << resultado << std::endl;

    num = 8;
    resultado = _fibonacci(num);
    std::cout << "El número Fibonacci de " << num << " es: " << resultado << std::endl;

    num = 9;
    resultado = _fibonacci(num);
    std::cout << "El número Fibonacci de " << num << " es: " << resultado << std::endl;

    num = 10;
    resultado = _fibonacci(num);
    std::cout << "El número Fibonacci de " << num << " es: " << resultado << std::endl;
    return 0;
}
