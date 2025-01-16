.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
INCLUDE irvine32.inc

.data
	arr DWORD 7,11,13,17,19,23
	msg1 BYTE "The sum of arr is ",0
.code
Sum Proc
	push esi
	push ecx
	mov eax,0
	L1:
		add eax,[esi]
		add esi,TYPE arr
		dec ecx
		cmp ecx,0
		jne L1

	pop ecx
	pop esi
	ret
Sum ENDP
main PROC
	mov edx,OFFSET msg1
	call WriteString

	mov esi,OFFSET arr
	mov ecx,LENGTHOF arr
	call Sum

	call WriteDec

	call crlf

	INVOKE ExitProcess,0
main ENDP
END main

