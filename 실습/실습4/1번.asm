.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
include irvine32.inc

.data
	s BYTE 100 DUP(?)
	d BYTE 100 DUP(?)
	msg1 BYTE "Enter a string : ",0
	msg2 BYTE "Result string : ",0
.code
Strcat PROC
	push ebp
	mov ebp,esp

	mov edi,[ebp+8]
	mov esi,[ebp+12]

	sub esp,8

	i EQU DWORD PTR [ebp-4]
	j EQU DWORD PTR [ebp-8]

	mov eax,edi
	mov i,0
	mov ecx,0
	cmp BYTE PTR [eax],0
	je L1_length0
	L1:
		inc eax
		inc i
		cmp BYTE PTR [eax],0
		jne L1
	L1_length0:

	mov j,0
	L2:
		mov ecx,j
		mov dl,BYTE PTR [esi+ecx]
		add ecx,i
		mov BYTE PTR [edi+ecx],dl
		inc j
		mov ecx,j
		cmp BYTE PTR [esi+ecx],0
		jne L2
	inc j


	mov eax,i
	add eax,j
	mov BYTE PTR [edi+eax],0

	mov eax,edi

	mov esp,ebp

	pop ebp
	ret 8
Strcat ENDP
main PROC
	mov edx,OFFSET msg1
	call WriteString

	mov edx,OFFSET d
	mov ecx,SIZEOF d
	call ReadString

	mov edx,OFFSET msg1
	call WriteString

	mov edx,OFFSET s
	mov ecx,SIZEOF s
	call ReadString

	push OFFSET s
	push OFFSET d
	call Strcat

	mov edx,OFFSET msg2
	call WriteString

	mov edx,OFFSET d
	call WriteString

	INVOKE ExitProcess,0
main ENDP
END main