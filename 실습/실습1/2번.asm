.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO,dwExitCode:dword
.data
	intarray DWORD 10000h,20000h,30000h,40000h
.code
	main PROC

	mov esi,0
	mov ecx,LENGTHOF intarray
	mov eax,0
L1:
	add eax,intarray[esi]
	add esi,TYPE intarray
	loop L1
	
	
	INVOKE ExitProcess,0
	main ENDP
END main