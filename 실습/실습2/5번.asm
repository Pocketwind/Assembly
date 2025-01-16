.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
INCLUDE irvine32.inc

.data
	 array DWORD 128 DUP(?)
	 array_bak DWORD 128 DUP(?)
	 fileName BYTE "array.dat",0
	 file DWORD ?
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

	mov edx,OFFSET fileName
	call CreateOutputFile
	mov file,eax

	mov edx,OFFSET array
	mov ecx,SIZEOF array
	call WriteToFile

	mov eax,file
	call CloseFile

	INVOKE ExitProcess,0
main ENDP
END main

