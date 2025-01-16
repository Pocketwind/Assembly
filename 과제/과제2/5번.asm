.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
	wArray word 0,1,2,3,4
	dArray dword 5 dup(?)
.code
main PROC
	neg wArray
	neg wArray+2
	neg wArray+4
	neg wArray+6
	neg wArray+8

	movsx eax,wArray
	mov dArray,eax
	movsx eax,wArray+2
	mov dArray+4,eax
	movsx eax,wArray+4
	mov dArray+8,eax
	movsx eax,wArray+6
	mov dArray+12,eax
	movsx eax,wArray+8
	mov dArray+16,eax

	INVOKE ExitProcess,0
main ENDP
END main