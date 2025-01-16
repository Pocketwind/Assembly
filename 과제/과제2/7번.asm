.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD

.data
	bigEndian byte 12h,34h,56h,78h
	littleEndian dword ?
.code
main PROC
	mov al,bigEndian+3
	mov ah,bigEndian+2
	mov word ptr littleEndian,ax

	mov al,bigEndian+1
	mov ah,bigEndian
	mov word ptr littleEndian+2,ax

	INVOKE ExitProcess,0
main ENDP
END main