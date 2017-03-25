#include <iostream>

using namespace std;

void fizzBuzz(int range)
{
    for (int i = 1; i <= range; i++)
    {
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
    }
}

int main()
{
    int range;
    cin >> range;
    fizzBuzz(range);
    return 0;
}
