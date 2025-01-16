.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
	wArray word 0,1,2,3,4
.code
main PROC
	neg wArray
	neg wArray+2
	neg wArray+4
	neg wArray+6
	neg wArray+8

	INVOKE ExitProcess,0
main ENDP
END main