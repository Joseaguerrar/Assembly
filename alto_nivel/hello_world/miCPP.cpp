#include <iostream>
using namespace std;

extern "C" int sumar0 (int, int);
extern "C" int sumar1 (*int, *int);
extern "C" *int sumar2 (*int, *int);


int main () {

    int numero1 = 5;
    int numero2 = 10;

    int resultado =  sumar0 (numero1, 5);
    cout << "resultado" << resultado;

    resultado =  sumar1 (&numero1, &numero2);
    cout << "resultado" << resultado;

    return 0
}