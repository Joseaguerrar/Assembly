#include <iostream>
using namespace std;

extern "C" int Add0 (int, int);
extern "C" int Add1 (*int, *int);
extern "C" *int Add2 (*int, *int);


int main () {

    int number1 = 5;
    int number2 = 10;

    int result =  Add0 (number1, 5);
    cout << "result" << result;

    result =  Add1 (&number1, &number2);
    cout << "result" << result;

    return 0
}
