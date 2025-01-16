INCLUDE irvine32.inc
EXTERN fibonacci@4:PROC
.data
	p1 BYTE "Enter a decimal number : ",0
	p2 BYTE "Fibonacci sequence : ",0
.code
	main PROC
		ENTER 8,0
		count EQU DWORD PTR [ebp-4]
		i EQU DWORD PTR [ebp-8]

		mov edx,OFFSET p1
		call WriteString
		call ReadDec
		mov count,eax

		mov edx,OFFSET p2
		call WriteString
		mov i,0
		L1:
			push i
			call fibonacci@4
			call WriteDec
			mov al,' '
			call WriteChar
			mov eax,count
			cmp i,eax
			jae L1_out
			inc i
			jmp L1
		L1_out:

		LEAVE
		INVOKE ExitProcess,0
	main ENDP
END