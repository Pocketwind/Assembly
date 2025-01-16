.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
include irvine32.inc

.data
	string BYTE 100 DUP(?)
	str_len DWORD ?
	msg1 BYTE "Input : ",0
	msg2 BYTE "string : ",0
	msg3 BYTE "Length of string : "
.code
strlen PROC uses esi
	mov edx,OFFSET msg2
	call WriteString
	mov edx,esi
	call WriteString
	mov eax,0
	cmp BYTE PTR [esi],0
	je length0
	L1:
		add esi,TYPE string
		inc eax
		cmp BYTE PTR [esi],0
		jne L1
	length0:
	ret
strlen ENDP
main PROC
	mov edx,OFFSET msg1
	call WriteString

	mov edx,OFFSET string
	mov ecx,SIZEOF string
	call ReadString

	call crlf

	mov esi,OFFSET string
	call strlen

	call crlf

	mov edx,OFFSET msg3
	call WriteString
	call WriteDec

	INVOKE ExitProcess,0
main ENDP
END main