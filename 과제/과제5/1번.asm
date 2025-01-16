.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
include irvine32.inc

.data
	string BYTE 100 DUP(?)
	msg1 BYTE "Input : ",0
.code
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
main PROC
	mov edx,OFFSET msg1
	call WriteString

	mov edx,OFFSET string
	mov ecx,SIZEOF string
	call ReadString

	mov esi,OFFSET string
	call strlen
	call WriteDec

	INVOKE ExitProcess,0
main ENDP
END main