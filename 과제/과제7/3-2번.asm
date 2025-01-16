INCLUDE irvine32.inc

isPrime PROTO C, n:DWORD

.code
	isPrime PROC C uses ebx edx, n:DWORD
		cmp n,1
		je found
		
		mov bx,2
		L1:
			mov edx,0
			mov ax,WORD PTR n
			div bx
			cmp dx,0
			je notFound
			add bx,1
			cmp bx,WORD PTR n
			je found
			jmp L1
			

		found:
		mov al,1
		ret 

		 notFound:
		 mov al,0
		 ret
	isPrime ENDP
END