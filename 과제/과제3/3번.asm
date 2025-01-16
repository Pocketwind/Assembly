.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
INCLUDE irvine32.inc

.data
	arr DWORD 10 DUP(?)
	sum DWORD 0
	string1 BYTE "Enter Integer : ",0
	string2 BYTE "Array : ",0
	string3 BYTE "Sum : ",0
.code

SumArray PROC USES esi ecx
	mov eax,0
	L1:
		add eax,[esi]
		add esi, TYPE arr
		loop L1
	ret
SumArray ENDP

ReadArray PROC USES esi exc
	mov eax,0
	mov edx,OFFSET string1
	L1:
		call WriteString
		call ReadInt
		mov [esi],eax
		add esi,TYPE arr
		loop L1
	ret
ReadArray ENDP

PrintArray PROC USES esi ecx
	mov edx,OFFSET string2
	call WriteString
	L1:
		mov eax,[esi]
		add sum,eax
		add esi, TYPE arr

		call WriteDec
		mov al,' '
		call WriteChar

		loop L1
	call crlf

	mov edx,OFFSET string3
	call WriteString

	mov eax,sum
	call WriteDec
	ret
PrintArray ENDP

main PROC
	mov esi,OFFSET arr
	mov ecx,10
	call ReadArray

	mov esi,OFFSET arr
	mov ecx,10
	call PrintArray



	INVOKE ExitProcess,0
main ENDP
END main

