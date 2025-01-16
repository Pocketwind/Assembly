INCLUDE irvine32.inc

.data
prompt1 BYTE "Enter a decimal number : ",0
prompt2 BYTE "Fibonacci sequence : ",0
.code
Fibonacci PROTO, n:DWORD
main PROC
	enter 8,0
	count EQU DWORD PTR [ebp-4]
	i EQU DWORD PTR [ebp-8]

	mov edx, OFFSET prompt1
	call WriteString

	call ReadInt
	mov count,eax

	mov edx,OFFSET prompt2
	call WriteString

	mov i,0
L1:
	mov eax,i
	cmp eax,count
	jae L1_out
	push i
	call Fibonacci
	call WriteDec
	mov al,' '
	call WriteChar
	inc i
	jmp L1
L1_out:
	
	leave
	INVOKE ExitProcess,0
main ENDP
Fibonacci PROC, n:DWORD
	push ebx
	push ecx
	cmp n,1
	jbe procEnd

	mov ecx,0
	mov ebx,n
	sub ebx,1
	push ebx
	call Fibonacci
	add ecx,eax

	mov ebx,n
	sub ebx,2
	push ebx
	call Fibonacci
	add ecx,eax

	mov eax,ecx

	pop ecx
	pop ebx
	ret 4

procEnd:
	mov eax,n
	pop ecx
	pop ebx
	ret 4
Fibonacci ENDP
END main