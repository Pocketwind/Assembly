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
	n_param EQU DWORD PTR [ebp+8]
	push ebp
	mov ebp,esp
	cmp n_param,0
	ja L1
	mov eax,1
	jmp L2
	L1:
	push n_param
	dec DWORD PTR [esp]
	call Factorial
	ReturnFact:
	mul n_param
	L2:
	pop ebp
	ret 4
Factorial ENDP
END main