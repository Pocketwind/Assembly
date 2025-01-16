#pragma warning (disable:4996)
#include<stdio.h>

extern int fibonacci(int n);

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