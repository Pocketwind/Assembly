.586
.model flat,C

system PROTO, pCommand:PTR BYTE
printf PROTO, pString:PTR BYTE, args:VARARG
scanf PROTO, pFormat:PTR BYTE, args:VARARG
fopen PROTO, filename:PTR BYTE, mode:PTR BYTE
fclose PROTO, pFile:DWORD

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
		INVOKE system,ADDR str1
		INVOKE system,ADDR str2
		INVOKE printf,ADDR str3
		INVOKE scanf,ADDR str4,ADDR filename

		INVOKE fopen,ADDR filename,ADDR modeStr
		mov pFile,eax
		cmp eax,0
		jne L1
		INVOKE printf,ADDR str5
		jmp quit
	L1:
		INVOKE printf,ADDR str6
		INVOKE fclose,pFile
	quit:
		ret
	asm_main ENDP
END