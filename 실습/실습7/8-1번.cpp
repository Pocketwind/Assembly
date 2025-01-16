#pragma warning (disable:4996)
#include<stdio.h>
extern "C" void asm_main();
extern "C" int printf(const char*, ...);
extern "C" int scanf(const char*, ...);

extern "C" 
int main()
{
	asm_main();
	return 0;
}