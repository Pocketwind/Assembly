.586
.model flat,C

extern system:PROC
extern printf:PROC
extern scanf:PROC
extern fopen:PROC
extern fclose:PROC

BUFFER_SIZE=5000

.data
	str1 BYTE "cls",0
	str2 BYTE "dir/w",0
	str3 BYTE "Enter the name of a file : ",0
	str4 BYTE "%s",0
	str5 BYTE "cannot open file",0dh,0ah,0
	str6 BYTE "The file has been opened",0ah,0dh,0
	modeStr BYTE "r",0
	filename BYTE 60 DUP(0)
	pBuf DWORD ?
	pFile DWORD ?
.code
	asm_main PROC
		push OFFSET str1
		call system
		add esp,4

		push OFFSET str2
		call system
		add esp,4

		push OFFSET str3
		call printf
		add esp,4

		push OFFSET filename
		push OFFSET str4
		call scanf
		add esp,8

		push OFFSET modeStr
		push OFFSET filename
		call fopen
		add esp,8

		mov pFile,eax
		cmp eax,0
		jne L1
		push OFFSET str5
		call printf
		add esp,4
		jmp quit
	L1:
		push OFFSET str6
		call printf
		add esp,4
		push pFile
		call fclose
		add esp,4
	quit:
		ret
	asm_main ENDP
END