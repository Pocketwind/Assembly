.386
.model flat, stdcall
.stack 4096
ExitProcess PROTO, dwExitCode:DWORD
INCLUDE irvine32.inc

KEY=239
BUFMAX=128

.data
	sPrompt BYTE "Enter the plain text : ",0
	sEncrypt BYTE "Cipher text : ",0
	sDecrypt BYTE "Decrypted : ",0
	buffer BYTE BUFMAX+1 DUP(0)
	bufSize DWORD ?
.code
InputTheString PROC
	pushad
	mov edx,OFFSET sPrompt
	call WriteString
	mov ecx,BUFMAX
	mov edx,OFFSET buffer
	call ReadString
	mov bufSize,eax
	call crlf
	popad
	ret
InputTheString ENDP
DisplayMessage PROC
	pushad
	call WriteString
	mov edx,OFFSET buffer
	call WriteString
	call crlf
	call crlf
	popad
	ret
DisplayMessage ENDP
TranslateBuffer PROC
	pushad
	mov ecx,bufSize
	mov esi,0
	L1:
		xor buffer[esi],KEY
		inc esi
		loop L1
	popad
	ret
TranslateBuffer ENDP
main PROC
	call InputTheString
	call TranslateBuffer
	mov edx,OFFSET sEncrypt
	call DisplayMessage
	call TranslateBuffer
	mov edx,OFFSET sDecrypt
	call DisplayMessage

	INVOKE ExitProcess,0
main ENDP
END main

