// Names: Jose Guerra (C33510) and Jerson Bonilla (C31225)

#include <iostream>
#include <cstring>

using namespace std;

extern "C" long convertir_a_leet (char*);

int main () {
    // Reserve space for the input
    char input[100];
    
    // Ask for the string
    cout << "Enter a phrase: ";
    cin.getline(input, 100);

    // Translate
    convertir_a_leet(input);

    // Show translation
    cout << "Translation to l337: " << input << std::endl;

    return 0;
}
