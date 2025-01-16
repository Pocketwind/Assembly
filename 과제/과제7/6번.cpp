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
int Strlen(char* s)
{
	__asm
	{
		push esi
		sub esp, 4
		//i EQU DWORD PTR[ebp - 4]
		mov [ebp-4], 0
		mov esi, s
		mov eax, 0
		L1 :
		cmp BYTE PTR[esi], 0
			je L1_out
			inc esi
			inc eax
			jmp L1
			L1_out :
		pop esi
		LEAVE
		ret
	}
}
char* Reverse(char* d, char* s)
{
	__asm
	{
		push esi
		push edi
		push ecx
		sub esp, 8
		//i EQU DWORD PTR[ebp - 4]
		//[ebp-8] EQU DWORD PTR[ebp - 8]

		mov esi, s
		mov edi, d

		push esi
		call Strlen

		mov [ebp-8], eax

		mov DWORD PTR [ebp-4], 0
		mov ecx, 0
	L1:
		mov edi, d
		mov esi, s
		add esi, ecx
		mov bl, BYTE PTR[esi]
		add edi, eax
		sub edi, 1
		sub edi, ecx
		mov BYTE PTR[edi], bl
		cmp ecx, eax
		jae L1_out
		inc [ebp-4]
		mov ecx, DWORD PTR [ebp-4]
		jmp L1
	L1_out :
		mov edi, d
		mov esi, s
		add esi, ecx
		add edi, ecx
		mov bl, BYTE PTR[esi]
		mov BYTE PTR[edi], bl
		mov eax, d
		pop ecx
		pop edi
		pop esi
		LEAVE
		ret
	}
}