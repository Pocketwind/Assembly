.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
INCLUDE irvine32.inc

.data
	arr DWORD 1,2,3,4,5,6,7,8,9,10
.code

SumArray PROC USES esi ecx
	mov eax,0
	L1:
		add eax,[esi]
		add esi, TYPE arr
		loop L1
	ret
SumArray ENDP

main PROC
	mov esi,OFFSET arr
	mov ecx,10
	call SumArray

	mov ebx, TYPE arr
	mov esi, OFFSET arr
	mov ecx, LENGTHOF arr
	call DumpMem

	call crlf

	call WriteDec

	INVOKE ExitProcess,0
main ENDP
END main

