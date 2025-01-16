.586
.model flat,C
.code
	strcmp PROC C uses edi esi, s1:PTR BYTE, s2:PTR BYTE
		mov esi,s1
		mov edi,s2

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


		ret
	strcmp ENDP
END