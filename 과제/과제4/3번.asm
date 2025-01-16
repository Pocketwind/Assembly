.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
include irvine32.inc

.data
	str_src BYTE 100 DUP(?)
	str_dest BYTE 100 DUP(?)
	msg1 BYTE "Input Source : ",0
	msg2 BYTE "Source : ",0
	msg3 BYTE "Destination : ",0
.code
strcpy PROC uses esi edi
	cmp BYTE PTR [esi],0
	je length0
	L1:
		mov al,BYTE PTR [esi]
		mov BYTE PTR [edi],al
		add esi,TYPE str_src
		add edi,TYPE str_dest
		cmp BYTE PTR [esi],0
		jne L1
	length0:
	ret
strcpy ENDP
main PROC
	mov edx,OFFSET msg1
	call WriteString

	mov edx,OFFSET str_src
	mov ecx,SIZEOF str_src
	call ReadString

	call crlf

	mov esi,OFFSET str_src
	mov edi,OFFSET str_dest
	call strcpy

	mov edx,OFFSET msg2
	call WriteString
	mov edx,OFFSET str_src
	call WriteString

	call crlf

	mov edx,OFFSET msg3
	call WriteString
	mov edx,OFFSET str_dest
	call WriteString

	INVOKE ExitProcess,0
main ENDP
END main