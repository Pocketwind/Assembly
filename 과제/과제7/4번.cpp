#include<iostream>

using namespace std;

bool isPrime(int n);

int main()
{
	int n;
	cout << "숫자 입력 : ";
	cin >> n;

	cout << "isPrime : " << isPrime(n) << endl;

	return 0;
}

bool isPrime(int n)
{
	__asm
	{
		cmp n, 1
		je found

		mov bx, 2
		L1:
		mov edx, 0
		mov ax, WORD PTR n
		div bx
		cmp dx, 0
		je notFound
		add bx, 1
		cmp bx, WORD PTR n
		je found
		jmp L1


		found :
		mov al, 1
		leave
		ret

		notFound :
		mov al, 0
		leave
		ret
	}
}