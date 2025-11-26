#include <iostream>

extern "C" int64_t subtract_life(int64_t life, int64_t amount, int64_t operation);

int main() {
    int64_t life = 100;
    int64_t damage = 30;
    int64_t operation = 1; // 1 for subtraction, 2 for addition

    int64_t new_life = subtract_life(life, damage, operation);
    std::cout << "New life: " << new_life << std::endl;

    operation = 2; // Change to addition
    new_life = subtract_life(new_life, damage, operation);
    std::cout << "New life after healing: " << new_life << std::endl;

    return 0;
}
