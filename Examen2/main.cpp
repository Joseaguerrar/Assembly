#include <iostream>

// Prototipo de la función ensambladora
extern "C" int generateDayTimestamp(int timeOfDay, int dayOfWeek);

int main() {
    int timeOfDay, dayOfWeek;

    // Solicitar al usuario si el evento ocurrió antes o después del mediodía
    std::cout << "Introduzca el momento del día (0 = antes del mediodía, 1 = después del mediodía): ";
    std::cin >> timeOfDay;

    if (timeOfDay < 0 || timeOfDay > 1) {
        std::cerr << "Entrada no válida. Debe ser 0 o 1.\n";
        return 1;
    }

    // Solicitar al usuario el día de la semana
    std::cout << "Introduzca el día de la semana (0 = Lunes, ..., 6 = Domingo): ";
    std::cin >> dayOfWeek;

    if (dayOfWeek < 0 || dayOfWeek > 6) {
        std::cerr << "Entrada no válida. Debe estar entre 0 y 6.\n";
        return 1;
    }

    // Llamar a la función en ensamblador
    int timestamp = generateDayTimestamp(timeOfDay, dayOfWeek);

    // Mostrar el resultado
    std::cout << "Timestamp generado: 0x" << std::hex << std::uppercase << timestamp << "\n";

    return 0;
}
