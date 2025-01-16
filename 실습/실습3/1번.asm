.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
INCLUDE irvine32.inc

.data
	intArray SWORD 0,0,0,0,1,20,35,-12,66,4,0
	;intArray SWORD 1,0,0,0
	;intArray SWORD 0,0,0,0
	;intArray SWORD 0,0,0,1

	noneMsg BYTE "A non-zero value was not found",0
.code
main PROC
	mov ebx,OFFSET intArray
	mov ecx,LENGTHOF intArray
	L1:
		cmp WORD PTR [ebx],0
		jnz found
		add ebx,2
		loop L1
		jmp notFound
	found:
		movsx eax,WORD PTR [ebx]
		call WriteInt
		jmp quit
	notFound:
		mov edx,OFFSET noneMsg
		call WriteString
	quit:
		call crlf
		exit

	INVOKE ExitProcess,0
main ENDP
END main

