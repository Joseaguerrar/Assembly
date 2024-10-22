// Nombres: Jose Guerra (C33510) y Jerson Bonilla (C31225)

#include <iostream>
#include <cstring>

using namespace std;

extern "C" long convertir_a_leet (char*);

int main () {
    // Reservar espacio para el input
    char input[100];
    
    // Pedir cadena
    cout << "Introduce una frase: ";
    cin.getline(input, 100);

    // Traducir
    convertir_a_leet(input);

    // Mostrar traducción
    cout << "Traducción a l337: " << input << std::endl;

    return 0;
}