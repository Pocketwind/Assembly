.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
include irvine32.inc

.data
	msg1 BYTE "d : ",0
	msg2 BYTE "s : ",0
.code
strcpy PROC
	push ebp
	mov ebp,esp

	push esi
	push edi

	mov edi,[ebp+8]
	mov esi,[ebp+12]
	

	L1:
		cmp BYTE PTR [esi],0
		je exit_L1
		mov al,BYTE PTR [esi]
		mov BYTE PTR [edi],al
		inc edi
		inc esi
		jmp L1
	exit_L1:
	mov BYTE PTR [edi],0

	pop edi
	pop esi

	mov eax,[ebp+8]

	pop ebp
	ret 8
strcpy ENDP
main PROC
	push ebp
	mov ebp,esp
	sub esp,200
	s EQU BYTE PTR [ebp-100]
	d EQU BYTE PTR [ebp-200]

	mov edx,OFFSET msg2
	call WriteString

	lea edx,s
	mov ecx,100
	call ReadString

	lea eax,s
	push eax
	lea eax,d
	push eax
	call strcpy

	call crlf

	mov edx,OFFSET msg1
	call WriteString

	mov edx,eax
	call WriteString

	call crlf

	mov edx,OFFSET msg2
	call WriteString

	lea edx,d
	call WriteString

	mov esp,ebp
	pop ebp
	ret
main ENDP
END main