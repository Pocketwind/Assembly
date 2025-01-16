#include<stdio.h>

extern "C" int printf(const char*, ...);
extern "C" int scanf(const char*, ...);
extern "C" void asm_main();

int main()
{
	asm_main();

	return 0;
}