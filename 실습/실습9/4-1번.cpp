#include<stdio.h>
#pragma warning(disable:4996)

extern "C" int asmMain(int argc, char* argv[]);
extern "C" int printf(const char*, ...);
extern "C" int sscanf(const char*, const char*, ...);
extern "C"
{
	int addi(int, int);
	int subt(int, int);
	int mult(int, int);
	int divi(int, int);
	int modu(int, int);
}

int main(int argc, char* argv[])
{
	return asmMain(argc, argv);
}
int addi(int a, int b)
{
	return a + b;
}
int subt(int a, int b)
{
	return a - b;
}
int mult(int a, int b)
{
	return a * b;
}
int divi(int a, int b)
{
	return a / b;
}
int modu(int a, int b)
{
	return a % b;
}