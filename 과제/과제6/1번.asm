include irvine32.inc

.data
	arr1 SDWORD 1,-5,10,2,-100,123
	arr2 SDWORD -1,-500,-300,-200
	arr3 SDWORD -9999,-999,-99,-9
	prompt1 BYTE "Largest number is ",0
.code
FindLargest PROTO,inputArray:DWORD,arrayLength:DWORD
main PROC
	mov edx,OFFSET prompt1
	push LENGTHOF arr1
	push OFFSET arr1
	call FindLargest
	call WriteInt

	call crlf

	mov edx,OFFSET prompt1
	push LENGTHOF arr2
	push OFFSET arr2
	call FindLargest
	call WriteInt

	call crlf

	mov edx,OFFSET prompt1
	push LENGTHOF arr3
	push OFFSET arr3
	call FindLargest
	call WriteInt
	

	INVOKE ExitProcess,0
main ENDP
FindLargest PROC, inputArray:DWORD, arrayLength:DWORD
	push ecx
	push esi
	mov ecx,arrayLength
	mov esi,inputArray
	mov eax,-2147483648
	L1:
		cmp eax,[esi]
		jg noUpdate
		mov eax,[esi]
	noUpdate:
		add esi,4
		loop L1
	pop esi
	pop ecx
	ret 8
FindLargest ENDP
END main