.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
	str1 byte "Korea"
.code
main PROC
	mov ah,str1
	xchg ah,str1+4
	mov str1,ah

	mov ah,str1+1
	xchg ah,str1+3
	mov str1+1,ah

	INVOKE ExitProcess,0
main ENDP
END main