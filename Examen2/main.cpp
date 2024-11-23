#include <iostream>

// Prototipo de la función ensambladora
extern "C" int generateTimestamp(int timeOfDay, int dayOfWeek, int month);

int main() {
    int timeOfDay, dayOfWeek, month;

    // Solicitar el momento del día
    std::cout << "Introduzca el momento del día (0 = antes del mediodía, 1 = después del mediodía): ";
    std::cin >> timeOfDay;
    if (timeOfDay < 0 || timeOfDay > 1) {
        std::cerr << "Entrada no válida. Debe ser 0 o 1.\n";
        return 1;
    }

    // Solicitar el día de la semana
    std::cout << "Introduzca el día de la semana (0 = Lunes, ..., 6 = Domingo): ";
    std::cin >> dayOfWeek;
    if (dayOfWeek < 0 || dayOfWeek > 6) {
        std::cerr << "Entrada no válida. Debe estar entre 0 y 6.\n";
        return 1;
    }

    // Solicitar el mes del año
    std::cout << "Introduzca el mes del año (1 = Enero, ..., 12 = Diciembre): ";
    std::cin >> month;
    if (month < 1 || month > 12) {
        std::cerr << "Entrada no válida. Debe estar entre 1 y 12.\n";
        return 1;
    }

    // Llamar a la función en ensamblador
    int timestamp = generateTimestamp(timeOfDay, dayOfWeek, month);

    // Mostrar el resultado
    std::cout << "Timestamp generado: 0x" << std::hex << std::uppercase << timestamp << "\n";

    return 0;
}
