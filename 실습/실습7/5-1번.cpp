#include<stdio.h>
#include<string.h>
#pragma warning (disable:4996)

extern "C" int strcmp(const char*, const char*);
extern "C" void asm_main();
extern "C" int printf(const char*, ...);
extern "C" int scanf(const char*, ...);
int main()
{
	asm_main();

	return 0;
}