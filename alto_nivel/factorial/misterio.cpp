#include <iostream>

using namespace std;

extern "C" long misterio (long a);

int main () {
    
    long resultado = misterio(4);
    cout << "El resultado misterioso es " << resultado << std::endl;

    return 0;
}