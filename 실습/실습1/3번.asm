.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO,dwExitCode:dword
.data
	source BYTE "This is the source string",0
	target BYTE SIZEOF source DUP(0)
.code
	main PROC

	mov esi,0
	mov ecx,LENGTHOF source
L1:
	mov al,source[esi]
	mov target[esi],al
	inc esi
	loop L1


	INVOKE ExitProcess,0

	main ENDP
END main
