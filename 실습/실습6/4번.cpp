#pragma warning (disable:4996)
#include<stdio.h>
int fibonacci(int n)
{
	__asm
	{
		cmp n,1
		jg procContinue
		mov eax,n
		leave
		ret
		procContinue:
	}
	return fibonacci(n - 1) + fibonacci(n - 2);
}
int main()
{
	int count, i;
	printf("Enter a decimal number : ");
	scanf("%d", &count);
	printf("Fibonacci sequence : ");
	for (i = 0; i < count; ++i)
	{
		printf("%d ", fibonacci(i));
	}
	return 0;
}