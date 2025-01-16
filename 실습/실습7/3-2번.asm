.386
.model flat,STDCALL
.code
	mystrcmp PROC uses edi esi, s1:PTR BYTE, s2:PTR BYTE
		mov esi,s1
		mov edi,s2
		mov eax,0

		L1:
			mov al, BYTE PTR [esi]
			cmp BYTE PTR [edi],al
			jne L1_out

			cmp al,0
			je L1_out

			inc esi
			inc edi
			
			jmp L1

	L1_out:
		mov eax,0
		mov al,BYTE PTR [esi]
		sub al,BYTE PTR [edi]

		movsx eax,al

		ret 8
	strcmp ENDP
END