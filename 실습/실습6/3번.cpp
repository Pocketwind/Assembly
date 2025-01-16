#include<stdio.h>
#pragma warning (disable:4996)

int strcmp(const char* s1, const char* s2)
{
	__asm
	{
		push esi
		push edi

		mov esi, s1
		mov edi, s2
		L1 :
			movzx eax, BYTE PTR [esi]
			movzx ebx, BYTE PTR [edi]
			cmp eax, ebx
			jne L1_out
			cmp eax, 0
			je L1_out
			inc esi
			inc edi
			jmp L1

			L1_out :
		sub eax, ebx
		pop edi
		pop esi
	}
}

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