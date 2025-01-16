.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
include irvine32.inc

.data
	arr DWORD 1,2,3,4,5,6,7,8,9,10
	msg1 BYTE "arr¿« «’∞Ë : ",0
.code
Sum PROC
	push ebp
	mov ebp,esp

	mov ecx,[ebp+12]
	mov esi,[ebp+8]

	sub esp,8
	var_sum EQU DWORD PTR [ebp-4]
	var_i EQU DWORD PTR [ebp-8]
	mov var_sum,0

	mov var_i,0
	L1:
		cmp var_i,ecx
		jge exit_L1
		mov eax,var_i
		imul eax,4
		mov eax,[esi+eax]
		add var_sum,eax
		inc var_i
		jmp L1
	exit_L1:

	mov eax,var_sum

	mov esp,ebp
	pop ebp

	ret 8
Sum ENDP
main PROC
	mov edx,OFFSET msg1
	call WriteString

	push 10
	push OFFSET arr
	call Sum

	call WriteDec

	call crlf

	ret
main ENDP
END main