.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
include irvine32.inc

.data
	s BYTE 100 DUP(?)
	d BYTE 100 DUP(?)
	msg1 BYTE "d : ",0
	msg2 BYTE "s : ",0
.code
strcpy PROC
	push esi
	push edi

	L1:
		cmp BYTE PTR [esi],0
		mov BYTE PTR [edi],0
		je exit_L1
		mov al,BYTE PTR [esi]
		mov BYTE PTR [edi],al
		inc edi
		inc esi
		jmp L1
	exit_L1:

	pop edi
	pop esi
	mov eax,edi
	ret
strcpy ENDP
strlen PROC
	push esi
	mov eax,0
	L1:
		cmp BYTE PTR [esi],0
		je exit_L1
		inc esi
		inc eax
		jmp L1
	exit_L1:
	pop esi
	ret
strlen ENDP
strcat PROC
	push esi
	push edi

	xchg esi,edi
	call strlen
	xchg esi,edi
	;eax, dest ±Ê¿Ã

	add edi,eax
	call strcpy

	pop edi
	pop esi
	mov eax,edi
	ret
strcat ENDP
main PROC
	mov edx,OFFSET msg1
	call WriteString

	mov edx,OFFSET d
	mov ecx,LENGTHOF d
	call ReadString

	mov edx,OFFSET msg2
	call WriteString

	mov edx,OFFSET s
	mov ecx,LENGTHOF s
	call ReadString

	mov edi,OFFSET d
	mov esi,OFFSET s
	call strcat

	call crlf

	mov edx,OFFSET msg1
	call WriteString

	mov edx,eax
	call WriteString

	call crlf

	mov edx,OFFSET msg2
	call WriteString

	mov edx,OFFSET s
	call WriteString

	INVOKE ExitProcess,0
main ENDP
END main