#include <iostream>
#include <iomanip>
#include <string>
#include <vector>
#include <limits>

using namespace std;

// Prototypes of the assembly functions
extern "C" int generateTimestamp(int timeOfDay, int dayOfWeek, int month);
extern "C" int decodeTimestamp(int timestamp, int* timeOfDay, int* dayOfWeek, int* month);

// Vectors of days of the week and months
const vector<string> daysOfWeek = {"Lunes", "Martes", "Miércoles", "Jueves", "Viernes", "Sábado", "Domingo"};
const vector<string> monthsOfYear = {"Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"};

void generateTimestampOption();
void decodeTimestampOption();

int main() {
    string option;

    // Loop for selecting an initial option
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
            cin.clear(); // Clear cin state
            cin.ignore(numeric_limits<streamsize>::max(), '\n'); // Ignore invalid input
        }
    }

    return 0;
}

// Function to generate the timestamp
void generateTimestampOption() {
    int timeOfDay, dayOfWeek, month;

    // Time of day
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

    // Day of the week
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

    // Month of the year
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

// Function to decode the timestamp
void decodeTimestampOption() {
    string hexInput;
    int timestamp;

    // Loop to request a valid input in hexadecimal format.
    while (true) {
        cout << "Introduzca el timestamp en formato hexadecimal: ";
        cin >> hexInput;
        try {
            // Convert the hexadecimal string input to an integer.
            // stoi throws an exception if the input is not valid.
            timestamp = stoi(hexInput, nullptr, 16);
            break;
        } catch (invalid_argument&) {
            // Error message if the input is not a valid hexadecimal value.
            cerr << "Entrada no válida para el timestamp. Por favor, introduzca un valor hexadecimal válido.\n";
        }
    }

    int timeOfDay, dayOfWeek, month; // Variables to store the decoded components of the timestamp.

    // Call to the assembly function to decode the timestamp.
    // This function is expected to store the decoded values in the referenced variables.
    int valid = decodeTimestamp(timestamp, &timeOfDay, &dayOfWeek, &month);

    // Verify if the provided timestamp is valid according to the logic of the assembly function.
    if (valid == 0) {
        // If it is not valid, show an error message to the user.
        cerr << "Ese no es un timestamp válido.\n";
        cerr << "Por favor, genere un timestamp válido y vuelva a intentarlo.\n";
        return;
    }

    // Display the decoded results to the user in a readable format.
    cout << "Resultado: "
         << (timeOfDay == 0 ? "antes del mediodía" : "después del mediodía") << ", " // Time of day.
         << "Día de la semana: " << daysOfWeek[dayOfWeek] << ", " // Day of the week.
         << "Mes: " << monthsOfYear[month - 1] << "\n"; // Month of the year (adjusted to zero-based index).
}
