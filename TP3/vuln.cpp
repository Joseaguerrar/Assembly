#include <stdio.h>
#include <unistd.h>
#include <cstdio>

// Función secreta no invocada
void secretFunction() {
    printf("Congratulations!\n");
    printf("You have entered the secret function!\n");
    return;
}

// Función vulnerable
int vuln() {
    // Definir variables
    char array[400];

    // Leer el input del usuario
    printf("Ingrese texto:\n");
    fgets(array, sizeof(array), stdin);

    // Imprimier el input del usuario
    printf("You entered: %s\n", array);

    // Return success
    return 0;
}

int main(int argc, char *argv[]) {
    // Llamar a la funcion vulnerable
    vuln();

    // Return success
    return 0;
}


// Para compilar sin proteccion de la pila:
// gcc -fno-stack-protector -z execstack -mpreferred-stack-boundary=4 -o vuln -ggdb vuln.cpp