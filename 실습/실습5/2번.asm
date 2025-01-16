INCLUDE irvine32.inc


.code
main PROC
	push 5
	call CalcSum
	L1:
	call WriteDec
	call crlf
	exit
main ENDP

_n$ EQU DWORD PTR [ebp+8]
CalcSum PROC
	enter 0,0
	cmp _n$,1
	jne L1
	mov eax,_n$
	leave
	ret 4
	L1:
	push _n$
	dec DWORD PTR [esp]
	call CalcSum
	add eax,_n$
	leave
	ret 4
CalcSum ENDP
END main