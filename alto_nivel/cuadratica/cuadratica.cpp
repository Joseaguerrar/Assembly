#include <iostream>

using namespace std;

extern "C" float cuadratica (float a, float b, float c);

int main () {
    float a = -3;
    float b = 6;
    float c = 1;

    float resultado = cuadratica(a, b, c);
    cout << "La solución de la ecuación: " << resultado << std::endl;

    return 0;
}