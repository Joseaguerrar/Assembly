#include <stdlib.h>
#include <stdio.h>
#include <string.h>

// Function that validates a serial number
int esNumeroDeSerieValido(char *numeroDeSerie) {
    size_t longitud = strlen(numeroDeSerie);  // Gets the length of the serial number
    unsigned sumaAscii = 0;                   // Accumulator for the sum of ASCII values of the characters
    size_t i;

    // The serial number must have at least 10 characters
    if (longitud < 10)
        return 0;  // Returns 0 if the length is less than 10

    // Iterates through each character of the serial number
    for (i = 0; i < longitud; i++) {
        // The serial number may only contain characters between '0' and 'z'
        if ((numeroDeSerie[i] < '0') || (numeroDeSerie[i] > 'z'))
            return 0;  // Returns 0 if it finds a character outside the allowed range

        // Adds the ASCII value of the character to the total
        sumaAscii += numeroDeSerie[i];
    }

    // Checks whether the sum of ASCII values is divisible by 853 and the remainder is 83
    if (sumaAscii % 853 == 83)
        return 1;  // Returns 1 if the serial number is valid

    return 0;  // If it does not meet the conditions, returns 0
}

// Function that validates the serial number entered by the user
int validarNumeroDeSerie() {
    char numeroDeSerie[24];  // Array to store the entered serial number

    // Reads the serial number from standard input
    fscanf(stdin, "%s", numeroDeSerie);

    // Calls the validation function
    if (esNumeroDeSerieValido(numeroDeSerie))
        return 1;  // Returns 1 if the serial number is valid
    else
        return 0;  // Returns 0 if the serial number is invalid
}

// Function executed when the serial number is valid
void realizarAccionesValidas() {
    printf("¡El número de serie es válido!\n");
    // More restricted actions for valid serial numbers could be performed here
    exit(0);  // Ends the program with exit code 0 (success)
}

// Function executed when the serial number is invalid
void realizarAccionesInvalidas() {
    printf("¡Número de serie inválido!\nSaliendo del programa...\n");
    exit(1);  // Ends the program with exit code 1 (error)
}

int main(int argc, char *argv[]) {
    // Validates the serial number
    if (validarNumeroDeSerie())
        realizarAccionesValidas();  // If valid, performs the valid actions
    else
        realizarAccionesInvalidas();  // If invalid, performs the invalid actions

    return 0;
}
