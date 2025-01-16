.586
.model flat,C

printf PROTO C, pString:PTR BYTE, args:VARARG
scanf PROTO C, pFormat:PTR BYTE, args:VARARG
strcmp PROTO C, s1:PTR BYTE, s2:PTR BYTE

.data
	p1 BYTE "Enter two words : ",0
	p2 BYTE "%s %s",0

.code
	asm_main PROC
		ENTER 200,0
		str1 EQU [ebp-100]
		str2 EQU [ebp-200]

		INVOKE printf,ADDR p1

		lea eax,str2
		push eax
		lea eax,str1
		push eax
		push OFFSET p2
		call scanf
		add esp,12

		lea eax, str2
		push eax
		lea eax,str1
		push eax
		call strcmp
		add esp,8

		cmp eax,0
		jl case2
	case1:
		lea eax, str1
		push eax
		lea eax,str2
		push eax
		push OFFSET p2
		call printf
		add esp,12
		jmp case_out
	case2:
		lea eax, str2
		push eax
		lea eax,str1
		push eax
		push OFFSET p2
		call printf
		add esp,12
	case_out:

		LEAVE
		ret
	asm_main ENDP
END