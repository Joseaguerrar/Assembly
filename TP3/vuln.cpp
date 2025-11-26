#include <stdio.h>
#include <unistd.h>
#include <cstdio>

// Secret function not invoked
void secretFunction() {
    printf("Congratulations!\n");
    printf("You have entered the secret function!\n");
    return;
}

// Vulnerable function
int vuln() {
    // Define variables
    char array[400];

    // Read user input
    printf("Ingrese texto:\n");
    fgets(array, sizeof(array), stdin);

    // Print user input
    printf("You entered: %s\n", array);

    // Return success
    return 0;
}

int main(int argc, char *argv[]) {
    // Call the vulnerable function
    vuln();

    // Return success
    return 0;
}


// To compile without stack protection:
// gcc -fno-stack-protector -z execstack -mpreferred-stack-boundary=4 -o vuln -ggdb vuln.cpp
