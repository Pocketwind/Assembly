.586
.model flat,C

addi PROTO,n1:DWORD,n2:DWORD
subt PROTO,n1:DWORD,n2:DWORD
mult PROTO,n1:DWORD,n2:DWORD
divi PROTO,n1:DWORD,n2:DWORD
modu PROTO,n1:DWORD,n2:DWORD

.code
addi PROC,n1:DWORD,n2:DWORD
	mov eax,n1
	add eax,n2
	ret
addi ENDP
subt PROC,n1:DWORD,n2:DWORD
	mov eax,n1
	sub eax,n2
	ret
subt ENDP
mult PROC,n1:DWORD,n2:DWORD
	push ebx
	mov eax,n1
	mov ebx,n2
	mul ebx
	pop ebx
	ret
mult ENDP
divi PROC,n1:DWORD,n2:DWORD
	push ebx
	push edx
	mov edx,0
	mov eax,n1
	mov ebx,n2
	div ebx
	pop edx
	pop ebx
	ret
divi ENDP
modu PROC,n1:DWORD,n2:DWORD
	push ebx
	push edx
	mov edx,0
	mov eax,n1
	mov ebx,n2
	div ebx
	mov eax,edx
	pop edx
	pop ebx
	ret
modu ENDP

END