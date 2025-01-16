.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
INCLUDE irvine32.inc

.data
	arr DWORD 1,2,3,4,5,6,7,8,9,10
	sum DWORD 0
.code

PrintArray PROC USES esi ecx
	L1:
		mov eax,[esi]
		add sum,eax
		add esi, TYPE arr

		call WriteDec
		mov al,' '
		call WriteChar

		loop L1
	call crlf
	mov eax,sum
	call WriteDec
	ret
PrintArray ENDP

main PROC
	mov esi,OFFSET arr
	mov ecx,10

	call PrintArray

	INVOKE ExitProcess,0
main ENDP
END main

