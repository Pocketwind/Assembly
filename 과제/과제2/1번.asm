;32비트 명령어이기 때문에 다음으로 변경
ExitProcess PROTO

;64비트 레지스터와 연산하기 때문에 dword대신 qword로 선언
.data
	firstval qword 20002000h
	secondval qword 11111111h
	thirdval qword 22222222h
	sum qword 0
.code
main PROC
	;64비트 레지스터인 rax 사용함
	mov rax,firstval
	add rax,secondval
	add rax,thirdval
	mov sum,rax

	call ExitProcess
main ENDP
END
