.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
INCLUDE irvine32.inc

.data
	 array DWORD 128 DUP(?)
.code
FillArray PROC USES ecx esi
	call Randomize
	L1:
		call Random32
		mov [esi],eax
		add esi,TYPE array
		loop L1
	ret
FillArray ENDP
main PROC
	mov ecx,LENGTHOF array
	mov esi,OFFSET array
	call FillArray

	mov esi,OFFSET array
	mov ebx,TYPE array
	mov ecx,LENGTHOF array
	call DumpMem

	INVOKE ExitProcess,0
main ENDP
END main

