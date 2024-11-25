#include <iostream>
#include <iomanip>
#include <string>
#include <vector>
#include <limits>

using namespace std;

// Prototipos de las funciones ensambladoras
extern "C" int generateTimestamp(int timeOfDay, int dayOfWeek, int month);
extern "C" int decodeTimestamp(int timestamp, int* timeOfDay, int* dayOfWeek, int* month);

// Vectores de días de la semana y meses
const vector<string> daysOfWeek = {"Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado", "Domingo"};
const vector<string> monthsOfYear = {"Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"};

void generateTimestampOption();
void decodeTimestampOption();

int main() {
    string option;

    // Bucle para la selección de una opción válida
    while (true) {
        cout << "Seleccione una opción:\n"
             << "1. Generar timestamp\n"
             << "2. Decodificar timestamp\n"
             << "Opción: ";
        cin >> option;

        if (option == "1") {
            generateTimestampOption();
            break;
        } else if (option == "2") {
            decodeTimestampOption();
            break;
        } else {
            cerr << "Opción no válida. Por favor, seleccione '1' o '2'.\n";
            cin.clear(); // Limpiar el estado de cin
            cin.ignore(numeric_limits<streamsize>::max(), '\n'); // Ignorar entrada inválida
        }
    }

    return 0;
}

// Función para generar el timestamp
void generateTimestampOption() {
    int timeOfDay, dayOfWeek, month;

    // Momento del día
    while (true) {
        cout << "Introduzca el momento del día (0 = antes del mediodía, 1 = después del mediodía): ";
        cin >> timeOfDay;
        if (cin.fail() || timeOfDay < 0 || timeOfDay > 1) {
            cerr << "Momento del día inválido. Debe ser 0 o 1.\n";
            cin.clear();
            cin.ignore(numeric_limits<streamsize>::max(), '\n');
        } else {
            break;
        }
    }

    // Día de la semana
    while (true) {
        cout << "Seleccione un día de la semana:\n";
        for (size_t i = 0; i < daysOfWeek.size(); ++i) {
            cout << i << " = " << daysOfWeek[i] << "\n";
        }
        cout << "Día: ";
        cin >> dayOfWeek;
        if (cin.fail() || dayOfWeek < 0 || dayOfWeek > 6) {
            cerr << "Día de la semana inválido. Debe ser un número entre 0 y 6.\n";
            cin.clear();
            cin.ignore(numeric_limits<streamsize>::max(), '\n');
        } else {
            break;
        }
    }

    // Mes del año
    while (true) {
        cout << "Seleccione un mes del año:\n";
        for (size_t i = 0; i < monthsOfYear.size(); ++i) {
            cout << i + 1 << " = " << monthsOfYear[i] << "\n";
        }
        cout << "Mes: ";
        cin >> month;
        if (cin.fail() || month < 1 || month > 12) {
            cerr << "Mes inválido. Por favor, seleccione un número entre 1 y 12.\n";
            cin.clear();
            cin.ignore(numeric_limits<streamsize>::max(), '\n');
        } else {
            break;
        }
    }

    int timestamp = generateTimestamp(timeOfDay, dayOfWeek, month);
    cout << "Timestamp generado: 0x" << hex << uppercase << timestamp << "\n";
}

// Función para decodificar el timestamp
void decodeTimestampOption() {
    string hexInput;
    int timestamp;

    while (true) {
        cout << "Introduzca el timestamp en formato hexadecimal: ";
        cin >> hexInput;
        try {
            timestamp = stoi(hexInput, nullptr, 16);
            break;
        } catch (invalid_argument&) {
            cerr << "Entrada no válida para el timestamp. Por favor, introduzca un valor hexadecimal válido.\n";
        }
    }

    int timeOfDay, dayOfWeek, month;
    int valid = decodeTimestamp(timestamp, &timeOfDay, &dayOfWeek, &month);

    if (valid == 0) {
        cerr << "Ese no es un timestamp válido.\n";
        cerr << "Por favor, genere un timestamp válido y vuelva a intentarlo.\n";
        return;
    }

    cout << "Resultado: "
         << (timeOfDay == 0 ? "antes del mediodía" : "después del mediodía") << ", "
         << "Día de la semana: " << daysOfWeek[dayOfWeek] << ", "
         << "Mes: " << monthsOfYear[month - 1] << "\n";
}
