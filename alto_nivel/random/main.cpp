#include <iostream>

extern "C" int random_number(); // Declaration of the assembly function

int main(int argc, char *argv[]) {
    std::cout << "Generating random number..." << std::endl;
    int result = random_number(); // Call the function
    std::cout << "Generated number: " << result << std::endl;
    return 0;
}
