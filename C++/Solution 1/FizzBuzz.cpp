#include <iostream>

using namespace std;

void fizzBuzz(int range)
{
    for (int i = 1; i <= range; i++)
    {
        cout << i << ": ";
        if (i % 3 == 0 && i % 5 == 0)
        {
            cout << "Fizz Buzz" << endl;
        }
        else if (i % 3 == 0)
        {
            cout << "Fizz" << endl;
        }
        else if (i % 5 == 0)
        {
            cout << "Buzz" << endl;
        }
        else
        {
            cout << endl;
        }
    }
}
