.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
	array dword 64,-48,32,98,-12,65,-64,12
	sum dword 0
.code
main PROC
	mov eax,array
	add sum,eax

	mov eax,array+4
	add sum,eax

	mov eax,array+8
	add sum,eax

	mov eax,array+12
	add sum,eax

	mov eax,array+16
	add sum,eax

	mov eax,array+20
	add sum,eax

	mov eax,array+24
	add sum,eax

	mov eax,array+28
	add sum,eax

	INVOKE ExitProcess,0
main ENDP
END main