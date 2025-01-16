.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO,dwExitCode:dword
.data
	source DWORD 10h,20h,30h,40h,50h,60h,70h,80h,90h,100h
	target DWORD SIZEOF source DUP(0)
.code
	main PROC

	mov esi,0
	mov ecx,LENGTHOF source
L1:
	mov eax,source[esi*TYPE source]
	mov target[esi*TYPE source],eax
	inc esi
	loop L1

	INVOKE ExitProcess,0

	main ENDP
END main
