INCLUDE irvine32.inc

.code
	Strlen PROC C uses esi, s:PTR BYTE
		sub esp,4
		i EQU DWORD PTR [ebp-4]
		mov i,0
		mov esi,s
		mov eax,0
		L1:
			cmp BYTE PTR [esi],0
			je L1_out
			inc esi
			inc eax
			jmp L1
		L1_out:
		ret
	Strlen ENDP
	Reverse PROC C uses esi edi ebx ecx, d:PTR BYTE, s:PTR BYTE
		sub esp,8
		i EQU DWORD PTR [ebp-4]
		size_asm EQU DWORD PTR [ebp-8]

		mov esi,s
		mov edi,d

		push esi
		call Strlen

		mov size_asm,eax

		mov i,0
		mov ecx,0
		L1:
			mov edi,d
			mov esi,s
			add esi,ecx
			mov bl,BYTE PTR [esi]
			add edi,eax
			sub edi,1
			sub edi,ecx
			mov BYTE PTR [edi],bl
			cmp ecx,eax
			jae L1_out
			inc i
			mov ecx,i
			jmp L1
		L1_out:
		mov edi,d
		mov esi,s
		add esi,ecx
		add edi,ecx
		mov bl,BYTE PTR [esi]
		mov BYTE PTR [edi],bl
		mov eax,d
		ret
	Reverse ENDP
END