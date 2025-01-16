#include<iostream>

using namespace std;

extern "C" bool isPrime(int n);

int main()
{
	int n;
	cout << "숫자 입력 : ";
	cin >> n;
	
	cout << "isPrime : " << isPrime(n) << endl;

	return 0;
}