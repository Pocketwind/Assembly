;32��Ʈ ��ɾ��̱� ������ �������� ����
ExitProcess PROTO

;64��Ʈ �������Ϳ� �����ϱ� ������ dword��� qword�� ����
.data
	firstval qword 20002000h
	secondval qword 11111111h
	thirdval qword 22222222h
	sum qword 0
.code
main PROC
	;64��Ʈ ���������� rax �����
	mov rax,firstval
	add rax,secondval
	add rax,thirdval
	mov sum,rax

	call ExitProcess
main ENDP
END
