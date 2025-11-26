#include <iostream>

using namespace std;

extern "C" float cuadratic (float a, float b, float c);

int main () {
    float a = -3;
    float b = 6;
    float c = 1;

    float result = cuadratic(a, b, c);
    cout << "The solution to the ecuation is: " << result << std::endl;

    return 0;

}
