#include <stdlib.h>
#include <stdio.h>
#include <string.h>

// Función que valida un número de serie
int esNumeroDeSerieValido(char *numeroDeSerie) {
    size_t longitud = strlen(numeroDeSerie);  // Obtiene la longitud del número de serie
    unsigned sumaAscii = 0;                   // Acumulador para la suma de los valores ASCII de los caracteres
    size_t i;

    // El número de serie debe tener al menos 10 caracteres
    if (longitud < 10)
        return 0;  // Retorna 0 si la longitud es menor a 10

    // Recorre cada carácter del número de serie
    for (i = 0; i < longitud; i++) {
        // El número de serie solo puede contener caracteres entre '0' y 'z'
        if ((numeroDeSerie[i] < '0') || (numeroDeSerie[i] > 'z'))
            return 0;  // Retorna 0 si encuentra un carácter fuera del rango permitido

        // Suma el valor ASCII del carácter al total
        sumaAscii += numeroDeSerie[i];
    }

    // Verifica si la suma de los valores ASCII es divisible por 853 y el residuo es 83
    if (sumaAscii % 853 == 83)
        return 1;  // Retorna 1 si el número de serie es válido

    return 0;  // Si no cumple las condiciones, retorna 0
}

// Función que valida el número de serie ingresado por el usuario
int validarNumeroDeSerie() {
    char numeroDeSerie[24];  // Arreglo para almacenar el número de serie ingresado

    // Lee el número de serie desde la entrada estándar
    fscanf(stdin, "%s", numeroDeSerie);

    // Llama a la función de validación
    if (esNumeroDeSerieValido(numeroDeSerie))
        return 1;  // Retorna 1 si el número de serie es válido
    else
        return 0;  // Retorna 0 si el número de serie es inválido
}

// Función que realiza una acción cuando el número de serie es válido
void realizarAccionesValidas() {
    printf("¡El número de serie es válido!\n");
    // Aquí se podrían realizar más acciones restringidas a números de serie válidos
    exit(0);  // Termina el programa con un código de salida 0 (éxito)
}

// Función que realiza una acción cuando el número de serie es inválido
void realizarAccionesInvalidas() {
    printf("¡Número de serie inválido!\nSaliendo del programa...\n");
    exit(1);  // Termina el programa con un código de salida 1 (error)
}

int main(int argc, char *argv[]) {
    // Valida el número de serie
    if (validarNumeroDeSerie())
        realizarAccionesValidas();  // Si es válido, realiza las acciones válidas
    else
        realizarAccionesInvalidas();  // Si es inválido, realiza las acciones inválidas

    return 0;
}
