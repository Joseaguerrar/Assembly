#include <iostream>
#include <cstdint>

// Declaración de la función en ensamblador
extern "C" int64_t subtract_life(int64_t life, int64_t damage);

int main() {
    int64_t player_life = 100;  // Vida inicial del jugador
    int64_t damage = 25;       // Puntos de vida que pierde

    // Llama a la función en ensamblador
    int64_t new_life = subtract_life(player_life, damage);

    // Muestra el resultado
    std::cout << "Vida inicial: " << player_life << std::endl;
    std::cout << "Daño recibido: " << damage << std::endl;
    std::cout << "Nueva vida: " << new_life << std::endl;

    return 0;
}
