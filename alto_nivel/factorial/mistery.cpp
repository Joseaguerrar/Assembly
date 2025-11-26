#include <iostream>

using namespace std;

extern "C" long mistery (long a);

int main () {
    
    long result = mistery(4);
    cout << "The mistery result is: " << result << std::endl;

    return 0;

}
