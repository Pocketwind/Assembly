;32비트 명령어이기 때문에 다음으로 변경
ExitProcess PROTO

;64비트 레지스터와 연산하기 때문에 dword대신 qword로 선언
.data
	val1 qword 78h
	val2 qword 5600h
	val3 qword 340000h
	val4 qword 12000000h
	val5 qword ?
.code
main PROC
	;64비트 레지스터인 rax 사용함
	mov rax,val1
	add rax,val2
	add rax,val3
	add rax,val4
	mov val5,rax

	call ExitProcess
main ENDP
END
