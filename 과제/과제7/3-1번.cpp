#include<iostream>

using namespace std;

extern "C" bool isPrime(int n);

int main()
{
	int n;
	cout << "���� �Է� : ";
	cin >> n;
	
	cout << "isPrime : " << isPrime(n) << endl;

	return 0;
}