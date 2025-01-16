.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
INCLUDE irvine32.inc

.data
	 array1 BYTE 25 DUP("test "),"!!",0
	 array2 BYTE 128 DUP(?)
	 fileName BYTE "string.txt",0
	 file DWORD ?
.code
CopyBArray PROC USES edi esi ecx
	mov ecx,LENGTHOF array1
	L1:
		mov bl,[esi]
		mov [edi],bl
		add esi,TYPE array1
		add edi,TYPE array2
		loop L1
	ret
CopyBArray ENDP
main PROC
	mov esi,OFFSET array1
	mov edi,OFFSET array2
	call CopyBArray

	mov edx,OFFSET array1
	call WriteString

	call crlf
	call crlf

	mov edx,OFFSET array2
	call WriteString

	mov edx,OFFSET fileName
	call CreateOutputFile
	mov file,eax

	mov edx,OFFSET array1
	mov ecx,LENGTHOF array1*2
	call WriteToFile

	mov eax,file
	call CloseFile

	INVOKE ExitProcess,0
main ENDP
END main

