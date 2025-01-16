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
strlen PROC
	push ebp
	mov ebp,esp

	push esi

	mov esi,[ebp+8]

	mov eax,0
	L1:
		cmp BYTE PTR [esi],0
		je exit_L1
		inc esi
		inc eax
		jmp L1
	exit_L1:

	pop esi

	pop ebp
	ret 4
strlen ENDP
strcat PROC
	push ebp
	mov ebp,esp

	push esi
	push edi

	mov edi,[ebp+8]
	mov esi,[ebp+12]

	push edi
	call strlen
	;eax, dest ±Ê¿Ã

	add edi,eax
	push esi
	push edi
	call strcpy

	pop edi
	pop esi

	mov eax,[ebp+8]

	pop ebp
	ret
strcat ENDP
main PROC
	push ebp
	mov ebp,esp
	sub esp,200
	s EQU BYTE PTR [ebp-100]
	d EQU BYTE PTR [ebp-200]

	mov edx,OFFSET msg1
	call WriteString

	lea edx,d
	mov ecx,100
	call ReadString

	mov edx,OFFSET msg2
	call WriteString

	lea edx,s
	mov ecx,100
	call ReadString

	lea eax,s
	push eax
	lea eax,d
	push eax
	call strcat

	call crlf

	mov edx,OFFSET msg1
	call WriteString

	mov edx,eax
	call WriteString

	call crlf

	mov edx,OFFSET msg2
	call WriteString

	lea edx,s
	call WriteString

	mov esp,ebp
	pop ebp
	ret
main ENDP
END main