INCLUDE irvine32.inc
.code
PromptForIntegers PROC
	arraySize EQU [ebp+16]
	ptrArray EQU [ebp+12]
	ptrPrompt EQU [ebp+8]

	enter 0,0
	pushad
	
	mov ecx,arraySize
	cmp ecx,0
	jle L2
	mov edx,ptrPrompt
	mov esi,ptrArray
L1:
	call WriteString
	call ReadInt
	call crlf
	mov [esi],eax
	add esi,4
	loop L1
L2:
	popad
	leave
	ret 12
PromptForIntegers ENDP
END