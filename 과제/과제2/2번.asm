;32��Ʈ ��ɾ��̱� ������ �������� ����
ExitProcess PROTO

;64��Ʈ �������Ϳ� �����ϱ� ������ dword��� qword�� ����
.data
	val1 qword 78h
	val2 qword 5600h
	val3 qword 340000h
	val4 qword 12000000h
	val5 qword ?
.code
main PROC
	;64��Ʈ ���������� rax �����
	mov rax,val1
	add rax,val2
	add rax,val3
	add rax,val4
	mov val5,rax

	call ExitProcess
main ENDP
END
