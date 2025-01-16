.386
.model flat,stdcall
.stack 4096
ExitProcess PROTO,dwExitCode:dword
.data
	array	BYTE	"aaaaaaaaaaaaaaaaaaaa"
			BYTE	"bbbbbbbbbbbbbbbbbbbb"
			BYTE	"cccccccccccccccccccc"
			BYTE	"dddddddddddddddddddd"
			BYTE	"eeeeeeeeeeeeeeeeeeee"
	checksum DWORD 0,0,0,0,0
	counter DWORD 0
.code
	main PROC
	mov ebx,0
	mov esi,0
	mov edi,0
	mov ecx,5
L1:
	mov counter,ecx
	mov ecx,20
	mov ebx,0
L2:
	movzx eax,array[esi]
	add esi,TYPE array
	add ebx,eax
	loop L2
	mov checksum[edi],ebx
	add edi,TYPE checksum
	mov ecx,counter
	loop L1


	INVOKE ExitProcess,0

	main ENDP
END main
