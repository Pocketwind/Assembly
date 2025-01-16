.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
INCLUDE irvine32.inc

.data
	Array DWORD 256 DUP(?)
	CheckSum DWORD 0
	filename BYTE "checksum.dat",0
.code
FillArray PROC uses esi ecx
	call GetMSeconds
	call Randomize
	L1:
		call Random32
		mov [esi],eax
		add esi,TYPE Array
		loop L1
	ret
FillArray ENDP

SumArray PROC USES esi ecx
	mov eax,0
	L1:
		add eax,[esi]
		add esi, TYPE Array
		loop L1
	ret
SumArray ENDP

main PROC
	mov ecx,LENGTHOF Array
	mov esi,OFFSET Array
	call FillArray

	mov ecx,LENGTHOF Array
	mov esi,OFFSET Array
	call SumArray

	mov CheckSum,eax

	mov edx,OFFSET filename
	call CreateOutputFile

	mov edx,OFFSET Array
	mov ecx,SIZEOF Array + SIZEOF CheckSum
	call WriteToFile

	call CloseFile

	INVOKE ExitProcess,0
main ENDP
END main

