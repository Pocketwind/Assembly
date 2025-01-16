include irvine32.inc

.data
	arr1 SDWORD 1,2,3,12,45,32,45
	arr2 SDWORD 324,23,234,324,4,5,6,243,235
	arr3 SDWORD 32,354,432,124,235,325,124
	prompt1 BYTE "FindThrees Result : ",0
.code
FindThrees PROTO,inputArray:DWORD,arrayLength:DWORD
main PROC
	mov edx,OFFSET prompt1

	push LENGTHOF arr1
	push OFFSET arr1
	call FindThrees
	call WriteString
	call WriteDec

	call crlf

	push LENGTHOF arr2
	push OFFSET arr2
	call FindThrees
	call WriteString
	call WriteDec

	call crlf

	push LENGTHOF arr3
	push OFFSET arr3
	call FindThrees
	call WriteString
	call WriteDec

	call crlf
	

	INVOKE ExitProcess,0
main ENDP
FindThrees PROC, inputArray:DWORD, arrayLength:DWORD
	push ecx
	push esi
	push ebx
	mov ecx,arrayLength
	mov esi,inputArray
	mov eax,0
	;배열 3개 미만이면 바로 ret
	cmp ecx,3
	jl procEnd

	;window 칸수 만큼 빼기
	sub ecx,2
	;check 시작
	L1:
		mov ebx,[esi+4]
		sub ebx,[esi]
		cmp ebx,1
		jne L1_end
		mov ebx,[esi+8]
		sub ebx,[esi+4]
		cmp ebx,1
		jne L1_end
		mov eax,1
		jmp procEnd
	L1_end:
		add esi,4
		loop L1
	procEnd:
	pop ebx
	pop esi
	pop ecx
	ret 8
FindThrees ENDP
END main