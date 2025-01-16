.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
INCLUDE irvine32.inc

.data
	 TAB=9
.code
Rand1 PROC
	mov ecx,10
	L1:
		call Random32
		call WriteDec
		mov al,TAB
		call WriteChar
		loop L1
		call crlf
		ret
Rand1 ENDP
Rand2 PROC
	mov ecx,10
	L1:
		mov eax,100
		call RandomRange
		sub eax,50
		call WriteInt
		mov al,TAB
		call WriteChar
		loop L1
	call crlf
	ret
Rand2 ENDP
main PROC
	call Randomize
	call Rand1
	call Rand2

	INVOKE ExitProcess,0
main ENDP
END main

