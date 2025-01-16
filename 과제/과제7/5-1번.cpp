#include<stdio.h>
#pragma warning (disable:4996)
using namespace std;

char dest[100], src[100];

extern "C"
{
	char* Reverse(char* d, char* s);
	int Strlen(char* s);
}
int main()
{
	printf("Enter a string : ");
	scanf("%s", src);

	printf("Original string : %s\n", src);
	printf("Reverse string : %s\n", Reverse(dest, src));

	return 0;
}