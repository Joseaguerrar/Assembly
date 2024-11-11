#include <iostream>

extern "C" int random_number(); // Declaración de la función ensamblador

int main(int argc, char *argv[]) {
    std::cout << "Generando número aleatorio..." << std::endl;
    int result = random_number(); // Llamar a la función
    std::cout << "Número generado: " << result << std::endl;
    return 0;
}
