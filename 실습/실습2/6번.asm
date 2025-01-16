.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
INCLUDE irvine32.inc

.data
	 array DWORD 128 DUP(?)
	 fileName BYTE "array.dat",0
	 file DWORD ?
.code
main PROC
	mov edx,OFFSET fileName
	call OpenInputFile
	mov file,eax

	mov edx,OFFSET array
	mov ecx,SIZEOF array
	call ReadFromFile

	mov eax,file
	call CloseFile

	mov esi,OFFSET array
	mov ebx,TYPE array
	mov ecx,LENGTHOF array
	call DumpMem

	INVOKE ExitProcess,0
main ENDP
END main

