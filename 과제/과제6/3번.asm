include irvine32.inc

.data
.code
DifferentInputs PROTO, input1:DWORD, input2:DWORD, input3:DWORD
main PROC
	push 1
	push 2
	push 3
	call DifferentInputs
	call WriteDec
	call crlf
	
	push 1
	push 1
	push 2
	call DifferentInputs
	call WriteDec
	call crlf
	
	push 1
	push 2
	push 2
	call DifferentInputs
	call WriteDec
	call crlf
	
	push 1
	push 1
	push 1
	call DifferentInputs
	call WriteDec
	call crlf

	INVOKE ExitProcess,0
main ENDP
DifferentInputs PROC, input1:DWORD, input2:DWORD, input3:DWORD
	mov eax,input2
	cmp input1,eax
	je same
	cmp input3,eax
	je same

	mov eax,1
	ret 12

same:
	mov eax,0
	ret 12
DifferentInputs ENDP
END main