.586
.model flat,C
selection_sort PROTO, arr:PTR DWORD,len:DWORD
.code
	exchange MACRO arrPtr,index1,index2
		push eax
		push ebx
		push ecx
		push edx
		mov eax,index1
		mov ebx,index2
		shl eax,2
		shl ebx,2
		mov ecx,[arrPtr+eax]
		mov edx,[arrPtr+ebx]
		mov [arrPtr+eax],edx
		mov [arrPtr+ebx],ecx
		pop edx
		pop ecx
		pop ebx
		pop eax
	ENDM
	compare MACRO arrPtr,index1,index2
		LOCAL true
		LOCAL false
		push ebx
		mov eax,index1
		mov ebx,index2
		shl eax,2
		shl ebx,2
		mov eax,[arrPtr+eax]
		mov ebx,[arrPtr+ebx]
		cmp eax,ebx
		jle false
		mov eax,1
		jmp true
	false:
		mov eax,0
	true:
	pop ebx
	ENDM
	selection_sort PROC, arr:PTR DWORD,len:DWORD
		sub esp,16
		i EQU DWORD PTR [ebp-4]
		j EQU DWORD PTR [ebp-8]
		min EQU DWORD PTR [ebp-12]
		tmp EQU DWORD PTR [ebp-16]

		mov esi,arr
			;i=0 Ω√¿€ 
		mov i,0
		L1:
				;min=i
			mov eax,i
			mov min,eax
				;j=i+1
			mov eax,i
			inc eax
			mov j,eax
			L2:
				compare esi,min,j
				cmp eax,1
				jne cmp_out
				mov eax,j
				mov min,eax
			cmp_out:
				inc j
				mov eax,j
				cmp eax,len
				jae L2_out
				jmp L2
			L2_out:
			exchange esi,i,min
			inc i
			mov eax,len
			dec eax
			cmp i, eax
			jae L1_out
			jmp L1
			L1_out:
		ret
	selection_sort ENDP
END