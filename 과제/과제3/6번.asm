.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
INCLUDE irvine32.inc

.data
	Array DWORD 256 DUP(?)
	CheckSum DWORD 0
	filename BYTE "checksum.dat",0
	file DWORD ?
	string1 BYTE "CheckSum.dat DATA : ",0
	string2 BYTE "CheckSum.dat CHECKSUM : ",0
	string3 BYTE "Sum of Array : ",0
.code
SumArray PROC USES esi ecx
	mov eax,0
	L1:
		add eax,[esi]
		add esi, TYPE Array
		loop L1
	ret
SumArray ENDP

main PROC
	mov edx,OFFSET filename
	call OpenInputFile
	mov file,eax

	mov edx,OFFSET Array
	mov ecx,SIZEOF Array + SIZEOF CheckSum
	call ReadFromFile

	mov eax,file
	call CloseFile
	
	mov edx,OFFSET string1
	call WriteString

	mov ecx,LENGTHOF Array
	mov esi,OFFSET Array
	L1:
		mov eax,[esi]
		call WriteDec
		mov al,' '
		call WriteChar
		add esi,TYPE Array
		loop L1
	call crlf

	mov edx,OFFSET string2
	call WriteString
	mov eax,CheckSum
	call WriteDec

	call crlf
	call crlf

	mov ecx,LENGTHOF Array
	mov esi,OFFSET Array
	call SumArray

	mov edx,OFFSET string3
	call WriteString
	call WriteDec

	INVOKE ExitProcess,0
main ENDP
END main

