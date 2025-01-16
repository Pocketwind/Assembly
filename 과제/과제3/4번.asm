.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
INCLUDE irvine32.inc

.data
	string BYTE 24 DUP("asdf"),"asd",0
	filename BYTE "test.txt",0
	file DWORD ?
.code
main PROC
	mov edx,OFFSET filename
	call CreateOutputFile
	mov file,eax

	mov edx,OFFSET string
	mov ecx,100
	call WriteToFile

	mov eax,file
	call CloseFile

	mov edx,OFFSET filename
	call OpenInputFile
	mov file,eax

	mov edx,OFFSET string
	mov ecx,LENGTHOF string
	call ReadFromFile

	mov eax,file
	call CloseFile

	INVOKE ExitProcess,0
main ENDP
END main

