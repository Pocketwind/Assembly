.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO,dwExitCode:dword
.data
	array	DWORD	1h,10h,100h,1000h,10000h
			DWORD	2h,20h,200h,2000h,20000h
			DWORD	3h,30h,300h,3000h,30000h
			DWORD	4h,40h,400h,4000h,40000h
	counter DWORD 0
	sum DWORD 0
.code
	main PROC
	
	mov esi,0
	mov ecx,4
L1:
	mov counter,ecx
	mov ecx,5
L2:
	mov eax,array[esi]
	add esi,TYPE array
	add sum,eax
	loop L2
	mov ecx,counter
	loop L1


	INVOKE ExitProcess,0

	main ENDP
END main
