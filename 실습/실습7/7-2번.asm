.586
.model flat,C

fibonacci PROTO C, n:DWORD

.code
	fibonacci PROC C, n:DWORD
		sub esp,4
		temp EQU DWORD PTR [ebp-4]
		mov temp,0

		cmp n,1
		jbe procEnd

		mov ebx,n
		sub ebx,1
		push ebx
		call fibonacci
		add temp,eax
		mov edx,temp

		mov ebx,n
		sub ebx,2
		push ebx
		call fibonacci
		add temp,eax
		mov edx,temp

		mov eax,temp
		ret

		procEnd:
		mov eax,n
		ret
	fibonacci ENDP
END