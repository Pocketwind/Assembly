.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
include irvine32.inc

.data
	msg1 BYTE "Input : ",0
.code
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
main PROC
	;지역변수
	push ebp
	mov ebp,esp
	sub esp,200
	string EQU BYTE PTR [ebp-100]

	mov edx,OFFSET msg1
	call WriteString

	lea edx,string
	mov ecx,100
	call ReadString

	lea eax,string
	push eax
	call strlen
	call WriteDec

	mov esp,ebp
	pop ebp
	ret
main ENDP
END main