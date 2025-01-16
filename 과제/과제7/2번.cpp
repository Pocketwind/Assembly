#pragma warning (disable:4996)
#include<stdio.h>

int fibonacci(int n);

int main()
{
	int count, i;

	printf("Enter a decimal number : ");
	scanf("%d", &count);

	printf("Fibonacci sequence : ");
	for (i = 0; i < count; ++i)
		printf("%d ", fibonacci(i));

	return 0;
}

int fibonacci(int n)
{
	__asm
	{
		sub esp, 4
		mov DWORD PTR[ebp - 4], 0

		cmp n, 1
		jbe procEnd

		mov ebx, n
		sub ebx, 1
		push ebx
		call fibonacci
		add[ebp - 4], eax
		mov edx, [ebp - 4]

		mov ebx, n
		sub ebx, 2
		push ebx
		call fibonacci
		add[ebp - 4], eax
		mov edx, [ebp - 4]

		mov eax, [ebp - 4]

		leave
		ret

		procEnd :
		mov eax, n
		leave
		ret
	}
}