INCLUDE irvine32.inc

extern mystrcmp:PROC

.data 
	p1 BYTE "Enter two words : ",0
.code
	main PROC
		ENTER 200,0
		str1 EQU [ebp-100]
		str2 EQU [ebp-200]

		mov edx,OFFSET p1
		call WriteString

		lea edx,str1
		mov ecx,100
		call ReadString
		lea edx,str2
		call ReadString

		lea eax,str2
		push eax
		lea eax,str1
		push eax
		call mystrcmp
		cmp eax,0
		jl case2
	case1:
		lea edx,str2
		call WriteString
		mov al,' '
		call WriteChar
		lea edx,str1
		call WriteString
		jmp case_out
	case2:
		lea edx,str1
		call WriteString
		mov al,' '
		call WriteChar
		lea edx,str2
		call WriteString
	case_out:

		LEAVE
		INVOKE ExitProcess,0
	main ENDP
END