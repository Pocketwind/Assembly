.586
.model flat,C
.data
p1 BYTE "Usage %s 5 + 4",0ah,0dh,0
p2 BYTE "Can't calculate : %d %c %d",0ah,0dh,0
p3 BYTE "%d %c %d = %d",0ah,0dh,0
f_int BYTE "%d",0
f_char BYTE "%c",0

extern printf:PROC
extern sscanf:PROC
extern addi:PROC
extern mult:PROC
extern subt:PROC
extern divi:PROC
extern modu:PROC

.code
asmMain PROC,argc:DWORD,argv:PTR BYTE
	sub esp,13

	a EQU [ebp-4]
	b EQU [ebp-8]
	result EQU [ebp-12]
	op EQU [ebp-13]

	cmp argc,4
	je PROC_OK
	mov eax,argv
	push [eax]
	push OFFSET p1
	call printf
	add esp,8
	ret
PROC_OK:

	lea eax,a
	push eax
	push OFFSET f_int
	mov eax,argv
	push [eax+4]
	call sscanf
	add esp,12

	lea eax,op
	push eax
	push OFFSET f_char
	mov eax,argv
	push [eax+8]
	call sscanf
	add esp,12

	lea eax,b
	push eax
	push OFFSET f_int
	mov eax,argv
	push [eax+12]
	call sscanf
	add esp,12

	mov al,op
	cmp al,'+'
	je case1
	cmp al,'-'
	je case2
	cmp al,'*'
	je case3
	cmp al,'/'
	je case4
	cmp al,'%'
	je case5

	push b
	push op
	push a
	push OFFSET p2
	call printf
	add esp,16
	ret

case1:
	push b
	push a
	call addi
	add esp,8
	mov result,eax
	jmp PROC_END
case2:
	push b
	push a
	call subt
	add esp,8
	mov result,eax
	jmp PROC_END
case3:
	push b
	push a
	call mult
	add esp,8
	mov result,eax
	jmp PROC_END
case4:
	push b
	push a
	call divi
	add esp,8
	mov result,eax
	jmp PROC_END
case5:
	push b
	push a
	call modu
	add esp,8
	mov result,eax
	jmp PROC_END


PROC_END:
	push result
	push b
	push op
	push a
	push OFFSET p3
	call printf
	add esp,20

	ret
asmMain ENDP
END