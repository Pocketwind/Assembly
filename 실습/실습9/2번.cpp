#include<stdio.h>
#pragma warning(disable:4996)

int addi(int, int);
int subt(int, int);
int mult(int, int);
int divi(int, int);
int modu(int, int);

int main(int argc, char* argv[])
{
	int a, b, result;
	char op;
	if (argc != 4)
	{
		printf("Usage : %s 5 + 4\n", argv[0]);
		return 0;
	}
	sscanf(argv[1], "%d", &a);
	sscanf(argv[2], "%c", &op);
	sscanf(argv[3], "%d", &b);

	switch (op)
	{
	case '+':
		result = addi(a, b);
		break;
	case '-':
		result = subt(a, b);
		break;
	case '*':
		result = mult(a, b);
		break;
	case '/':
		result = divi(a, b);
		break;
	case '%':
		result = modu(a, b);
		break;
	default:
		printf("Can't calculate : %d %c %d", a, op, b);
		return 0;
	}
	printf("%d %c %d = %d\n", a, op, b, result);
	return 0;
}

int addi(int a, int b)
{
	__asm
	{
		mov eax,a
		add eax,b
	}
}
int subt(int a, int b)
{
	__asm
	{
		mov eax,a
		sub eax,b
	}
}
int mult(int a, int b)
{
	__asm
	{
		mov eax,a
		mov ebx,b
		mul ebx
	}
}
int divi(int a, int b)
{
	__asm
	{
		mov edx,0
		mov eax,a
		mov ecx,b
		div ecx
	}
}
int modu(int a, int b)
{
	__asm
	{
		mov edx,0
		mov eax,a
		mov ecx,b
		div ecx
		mov eax,edx
	}
}