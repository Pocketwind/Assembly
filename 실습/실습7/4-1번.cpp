#include<stdio.h>
#pragma warning (disable:4996)

extern "C" char strcmp(const char*, const char*);

int main()
{
	char str1[100], str2[100];

	printf("Enter two words : ");
	scanf("%s %s", str1, str2);

	if (strcmp(str1, str2) >= 0)
		printf("%s %s", str2, str1);
	else
		printf("%s %s", str1, str2);

	return 0;
}