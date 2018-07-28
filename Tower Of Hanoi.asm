include irvine32.inc
.data
	; Tower Of Hanoi Solver Using Recurssion (x86-32bit MASM Kip-Irvine Library)
	; Equivalent C Code:
	; #include<stdio.h>
	; void moveTower(disk,fromPole, toPole, withPole)
	; {
	;  	 if(disk >= 1)
	;	 {
	;         moveTower(disk-1,fromPole,withPole,toPole);
	;         printf("moving disk %d from %c to %c\n",disk,fromPole,toPole);
	;         moveTower(disk-1,withPole,toPole,fromPole);
	;     }
	; }
	; void main()
	; {
	; 	 moveTower(3,'A','C','B');
	; }

	Title1 BYTE "  _______  ____ __          __ ______  _____             ____   ______           _    _            _   _   ____  _____ ",0Ah,0Dh
	       BYTE " |__   __|/ __ \\ \        / /|  ____||  __ \           / __ \ |  ____|         | |  | |    /\    | \ | | / __ \|_   _|",0Ah,0Dh
	       BYTE "    | |  | |  | |\ \  /\  / / | |__   | |__) |         | |  | || |__            | |__| |   /  \   |  \| || |  | | | |  ",0Ah,0Dh
	       BYTE "    | |  | |  | | \ \/  \/ /  |  __|  |  _  /          | |  | ||  __|           |  __  |  / /\ \  | . ` || |  | | | |  ",0Ah,0Dh
	       BYTE "    | |  | |__| |  \  /\  /   | |____ | | \ \          | |__| || |              | |  | | / ____ \ | |\  || |__| |_| |_ ",0Ah,0Dh
	       BYTE "    |_|   \____/    \/  \/    |______||_|  \_\          \____/ |_|              |_|  |_|/_/    \_\|_| \_| \____/|_____|",0Ah,0Dh
	       BYTE "                                                                                                          ~ Danial Ahmed",0Ah,0Dh,0
	msg1 BYTE "Disk ",0
	msg2 BYTE " moved from ",0
	msg3 BYTE " to ",0
	inputNum BYTE "Enter number of disks: ",0
	msg4 BYTE "Enter name of tower 1: ",0
	msg5 BYTE "Enter name of tower 2: ",0
	msg6 BYTE "Enter name of tower 3: ",0
	char1 BYTE 10 DUP(0)
	char2 BYTE 10 DUP(0)
	char3 BYTE 10 DUP(0)
	num DWORD ?
	tmp BYTE 10 DUP(0)
.code
main proc
	mov edx, offset Title1
	call writestring
	mov edx, offset inputNum
	call writestring
	call readint
	mov num,eax
	mov edx, offset msg4
	call writestring
	mov edx, offset char1
	mov ecx, sizeof char1
	call readstring
	mov edx, offset msg5
	call writestring
	mov edx, offset char2
	mov ecx, sizeof char2
	call readstring
	mov edx, offset msg6
	call writestring
	mov edx, offset char3
	mov ecx, sizeof char3
	call readstring
	push DWORD PTR char2
	push DWORD PTR char3
	push DWORD PTR char1
	push num
	call TOH
	exit
main endp
TOH PROC
	push ebp
	mov ebp,esp
	mov esi,[ebp+8]
	mov edi,[ebp+12]
	mov ecx,[ebp+16]
	mov ebx,[ebp+20]
	cmp esi,1
	jge L2
	jl L1
	L2:
		dec esi
		push ecx
		push ebx
		push edi
		push esi
		call TOH
		mov esi,[ebp+8]
		mov edi,[ebp+12]
		mov ecx,[ebp+16]
		mov ebx,[ebp+20]
		mov edx, offset msg1
		call writestring
		mov eax,esi
		call writeint
		mov edx,offset msg2
		call writestring
		mov DWORD PTR tmp,edi
		mov edx,offset tmp
		call writestring
		mov edx,offset msg3
		call writestring
		mov DWORD PTR tmp,ecx
		mov edx,offset tmp
		call writestring
		call crlf
		dec esi
		push edi
		push ecx
		push ebx
		push esi
		call TOH
	L1:
		mov esp,ebp
		pop ebp
		ret
TOH endp
end main
