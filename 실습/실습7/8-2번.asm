.586
.model flat,C

fibonacci PROTO C, n:DWORD
printf PROTO C, p1:PTR BYTE,args:VARARG
scanf PROTO C, p1:PTR BYTE,args:VARARG
asm_main PROTO C

.data
	p1 BYTE "Enter a decimal number : ",0
	p2 BYTE "Fibonacci sequence : ",0
	f1 BYTE "%d",0
	f2 BYTE "%d ",0
.code
	asm_main PROC
		ENTER 8,0
		count EQU DWORD PTR [ebp-4]
		i EQU DWORD PTR [ebp-8]

		INVOKE printf,ADDR p1
		INVOKE scanf,ADDR f1,ADDR count

		mov eax,count

		INVOKE printf,ADDR p2
		mov i,0
		L1:
			INVOKE fibonacci,i
			INVOKE printf,ADDR f2,eax
			mov eax,count
			cmp i,eax
			jae L1_out
			inc i
			jmp L1
		L1_out:


		LEAVE
		ret
	asm_main ENDP
	fibonacci PROC C, n:DWORD
		sub esp,4
		temp EQU DWORD PTR [ebp-4]
		mov temp,0

		cmp n,1
		jbe procEnd

		mov ebx,n
		sub ebx,1
		push ebx
		call fibonacci
		add temp,eax
		mov edx,temp

		mov ebx,n
		sub ebx,2
		push ebx
		call fibonacci
		add temp,eax
		mov edx,temp

		mov eax,temp
		ret

		procEnd:
		mov eax,n
		ret
	fibonacci ENDP
END