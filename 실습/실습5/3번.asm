INCLUDE irvine32.inc
.code
main PROC
	push 5
	call Factorial
	call WriteDec
	call crlf
	exit
main ENDP
Factorial PROC
	push ebp
	mov ebp,esp
	mov eax,[ebp+8]
	cmp eax,0
	ja L1
	mov eax,1
	jmp L2
	L1:
	dec eax
	push eax
	call Factorial
	ReturnFact:
	mov ebx,[ebp+8]
	mul ebx
	L2:
	pop ebp
	ret 4
Factorial ENDP
END main