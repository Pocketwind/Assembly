.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
include irvine32.inc

.data
	str_src BYTE 100 DUP(?)
	str_dest BYTE 100 DUP(?)
	str_src_len DWORD ?
	str_dest_len DWORD ?
	msg1 BYTE "Input Source : ",0
	msg2 BYTE "Input Destination : ",0
	msg3	BYTE "Source : ",0
	msg4 BYTE "Destination : ",0
.code
strlen PROC uses esi
	mov eax,0
	cmp BYTE PTR [esi],0
	je length0
	L1:
		inc esi
		inc eax
		cmp BYTE PTR [esi],0
		jne L1
	length0:
	ret
strlen ENDP
strcat PROC uses esi edi ebx ecx
	mov ecx,esi
	mov esi,edi
	call strlen
	mov esi,ecx
	mov ecx,eax

	add edi,ecx
	L1:
		mov bl,BYTE PTR [esi]
		mov BYTE PTR [edi],bl
		dec ecx
		inc edi
		inc esi
		cmp BYTE PTR [esi],0
		jne L1
	ret
strcat ENDP
main PROC
	mov edx,OFFSET msg1
	call WriteString

	mov edx,OFFSET str_src
	mov ecx,SIZEOF str_src
	call ReadString

	mov edx,OFFSET msg2
	call WriteString

	mov edx,OFFSET str_dest
	mov ecx,SIZEOF str_dest
	call ReadString

	call crlf

	;ÀÔ·Â³¡

	mov esi,OFFSET str_src
	mov edi,OFFSET str_dest
	call strcat

	mov edx,OFFSET msg3
	call WriteString
	mov edx,OFFSET str_src
	call WriteString
	call crlf
	mov edx,OFFSET msg4
	call WriteString
	mov edx,OFFSET str_dest
	call WriteString

	INVOKE ExitProcess,0
main ENDP
END main