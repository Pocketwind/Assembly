void TranslateBuffer(char* buf, unsigned int count, unsigned char eChar)
{
	__asm
	{
		mov esi,buf
		mov ecx,count
		mov al,eChar
		L1:
			xor [esi],al
			inc esi
			loop L1
	}
}