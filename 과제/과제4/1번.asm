.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
include irvine32.inc

.data
	Array DWORD -1,-2,-3,4,5,6
.code
SumDWORD PROC uses esi ecx
	mov eax,0
	L1:
		add eax,[esi]
		add esi,TYPE Array
		dec ecx
		jnz L1
	ret
SumDWORD ENDP
main PROC
	mov ecx,LENGTHOF Array
	mov esi,OFFSET Array
	call SumDWORD

	call WriteDec

	call crlf
	call crlf

	mov esi,OFFSET Array
	mov ecx,LENGTHOF Array
	L1:
		mov eax,[esi]
		call WriteInt
		add esi,TYPE Array
		mov al,' '
		call WriteChar
		dec ecx
		jnz L1

	call crlf

	INVOKE ExitProcess,0
main ENDP
END main