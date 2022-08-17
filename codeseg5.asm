proc CheckIfWonColumn
	push bp
	mov bp, sp
	mov si, 1
	
	xor bx, bx
	mov bl, [SmallCubeN]
	cmp [CubesThatWon + bx], 0
	je BCc1
	mov [SmallCubeN], 0
	
BCc1:
	cmp si, 9
	ja BCc2start
	mov ax, 10
	mul si
	mov si, ax
	sub si, 10
	cmp [TableXO + si], 0
	jne noWinC1
	
	mov bl, [TableXO + si + 1]
	mov bh, [TableXO + si + 2]
	mov cl, [TableXO + si + 3]
	
	cmp bl, 0
	jne OKc1
	jmp noWinC1
OKc1:
	cmp bl, bh
	je E12
	jne noWinC1
E12:
	cmp bl, cl
	je WinC1
	jne noWinC1
WinC1:
	mov [TableXO + si], bl
	add si, 10
	mov ax, si
	mov si, 10
	div si
	mov si, ax
	mov [CubesThatWon + si], bl
	inc si
	jmp BCc1
	
noWinC1:
	add si, 10
	mov ax, si
	mov si, 10
	div si
	mov si, ax
	inc si
	jmp BCc1
	
BCc2start:
	mov si, 1
	
BCc2:
	cmp si, 9
	ja BCc3start
	mov ax, 10
	mul si
	mov si, ax
	sub si, 10
	cmp [TableXO + si], 0
	jne noWinC2
	
	mov bl, [TableXO + si + 4]
	mov bh, [TableXO + si + 5]
	mov cl, [TableXO + si + 6]
	
	cmp bl, 0
	jne OKc2
	jmp noWinC2
OKc2:
	cmp bl, bh
	je E34
	jne noWinC2
E34:
	cmp bl, cl
	je WinC2
	jne noWinC2
WinC2:
	mov [TableXO + si], bl
	add si, 10
	mov ax, si
	mov si, 10
	div si
	mov si, ax
	mov [CubesThatWon + si], bl
	inc si
	jmp BCc2
	
noWinC2:
	add si, 10
	mov ax, si
	mov si, 10
	div si
	mov si, ax
	inc si
	jmp BCc2
	
BCc3start:
	mov si, 1
	
BCc3:
	cmp si, 9
	ja DoneColumn
	
	mov ax, 10
	mul si
	mov si, ax
	sub si, 10
	cmp [TableXO + si], 0
	jne noWinC3
	
	mov bl, [TableXO + si + 7]
	mov bh, [TableXO + si + 8]
	mov cl, [TableXO + si + 9]
	
	cmp bl, 0
	jne OKc3
	jmp noWinC3
OKc3:
	cmp bl, bh
	je E78
	jne noWinC3
E78:
	cmp bl, cl
	je WinC3
	jne noWinC3
WinC3:
	mov [TableXO + si], bl
	add si, 10
	mov ax, si
	mov si, 10
	div si
	mov si, ax
	mov [CubesThatWon + si], bl
	inc si
	jmp BCc3
	
noWinC3:
	add si, 10
	mov ax, si
	mov si, 10
	div si
	mov si, ax
	inc si
	jmp BCc3
	
DoneColumn:
	xor si, si
	pop bp
	ret
endp CheckIfWonColumn
;----------------------------------------------------------------------------------------------------------------------------------------;
proc CheckIfWonRow
	push bp
	mov bp, sp
	mov si, 1
	
BCr1:
	cmp si, 9
	ja BCr2start
	mov ax, 10
	mul si
	mov si, ax
	sub si, 10
	cmp [TableXO + si], 0
	jne noWinR1
	
	mov bl, [TableXO + si + 1]
	mov bh, [TableXO + si + 4]
	mov cl, [TableXO + si + 7]
	
	cmp bl, 0
	jne OKr1
	jmp noWinr1
OKr1:
	cmp bl, bh
	je E14
	jne noWinR1
E14:
	cmp bl, cl
	je WinR1
	jne noWinR1
WinR1:
	mov [TableXO + si], bl
	add si, 10
	mov ax, si
	mov si, 10
	div si
	mov si, ax
	mov [CubesThatWon + si], bl
	inc si
	jmp BCr1
	
noWinR1:
	add si, 10
	mov ax, si
	mov si, 10
	div si
	mov si, ax
	inc si
	jmp BCr1
	
BCr2start:
	mov si, 1
	
BCr2:
	cmp si, 9
	ja BCr3start
	mov ax, 10
	mul si
	mov si, ax
	sub si, 10
	cmp [TableXO + si], 0
	jne noWinR2
	
	mov bl, [TableXO + si + 2]
	mov bh, [TableXO + si + 5]
	mov cl, [TableXO + si + 8]
	
	cmp bl, 0
	jne OKr2
	jmp noWinR2
OKr2:
	cmp bl, bh
	je E25
	jne noWinR2
E25:
	cmp bl, cl
	je WinR2
	jne noWinR2
WinR2:
	mov [TableXO + si], bl
	add si, 10
	mov ax, si
	mov si, 10
	div si
	mov si, ax
	mov [CubesThatWon + si], bl
	inc si
	jmp BCr2
	
noWinR2:
	add si, 10
	mov ax, si
	mov si, 10
	div si
	mov si, ax
	inc si
	jmp BCr2
	
BCr3start:
	mov si, 1
	
BCr3:
	cmp si, 9
	ja DoneRow
	
	mov ax, 10
	mul si
	mov si, ax
	sub si, 10
	cmp [TableXO + si], 0
	jne noWinR3
	
	mov bl, [TableXO + si + 3]
	mov bh, [TableXO + si + 6]
	mov cl, [TableXO + si + 9]
	
	cmp bl, 0
	jne OKr3
	jmp noWinr3
OKr3:
	cmp bl, bh
	je E36
	jne noWinR3
E36:
	cmp bl, cl
	je WinR3
	jne noWinR3
WinR3:
	mov [TableXO + si], bl
	add si, 10
	mov ax, si
	mov si, 10
	div si
	mov si, ax
	mov [CubesThatWon + si], bl
	inc si
	jmp BCr3
	
noWinR3:
	add si, 10
	mov ax, si
	mov si, 10
	div si
	mov si, ax
	inc si
	jmp BCr3
	
DoneRow:
	xor si, si
	pop bp
	ret
endp CheckIfWonRow
;----------------------------------------------------------------------------------------------------------------------------------------;
proc CheckIfWonDiagnal
	push bp
	mov bp, sp
	mov si, 1
	
BCd1:
	cmp si, 9
	ja BCd2start
	mov ax, 10
	mul si
	mov si, ax
	sub si, 10
	cmp [TableXO + si], 0
	jne noWinD1
	
	mov bl, [TableXO + si + 1]
	mov bh, [TableXO + si + 5]
	mov cl, [TableXO + si + 9]
	
	cmp bl, 0
	jne OKd1
	jmp noWind1
OKd1:
	cmp bl, bh
	je E15
	jne noWinD1
E15:
	cmp bl, cl
	je WinD1
	jne noWinD1
WinD1:
	mov [TableXO + si], bl
	add si, 10
	mov ax, si
	mov si, 10
	div si
	mov si, ax
	mov [CubesThatWon + si], bl
	inc si
	jmp BCd1
	
noWinD1:
	add si, 10
	mov ax, si
	mov si, 10
	div si
	mov si, ax
	inc si
	jmp BCd1
	
BCd2start:
	mov si, 1
	
BCd2:
	cmp si, 9
	ja DoneDiagnal
	mov ax, 10
	mul si
	mov si, ax
	sub si, 10
	cmp [TableXO + si], 0
	jne noWinD2
	
	mov bl, [TableXO + si + 3]
	mov bh, [TableXO + si + 5]
	mov cl, [TableXO + si + 7]
	
	cmp bl, 0
	jne OKd2
	jmp noWinD2
OKd2:
	cmp bl, bh
	je E35
	jne noWinD2
E35:
	cmp bl, cl
	je WinD2
	jne noWinD2
WinD2:
	mov [TableXO + si], bl
	add si, 10
	mov ax, si
	mov si, 10
	div si
	mov si, ax
	mov [CubesThatWon + si], bl
	inc si
	jmp BCd2
	
noWinD2:
	add si, 10
	mov ax, si
	mov si, 10
	div si
	mov si, ax
	inc si
	jmp BCd2
	
DoneDiagnal:
	xor si, si
	pop bp
	ret
endp CheckIfWonDiagnal
;----------------------------------------------------------------------------------------------------------------------------------------;
proc MidCheck
	push bp
	mov bp, sp
	cmp bl, 0
	jne OKcheck
	jmp noThingTherecheck
OKcheck:
	cmp bl, bh
	je Echeck
	jne noWincheck
Echeck:
	cmp bl, cl
	je Wincheck
	jne noWincheck
Wincheck:
	mov ax, 0
	jmp EndCheckThing
	
noWincheck:
	cmp bl, 0
	je noThingTherecheck
	cmp bh, 0
	je noThingTherecheck
	cmp cl, 0
	je noThingTherecheck
	mov ax, 1
	jmp EndCheckThing
	
noThingTherecheck:
	mov ax, 0
EndCheckThing:
	pop bp
	ret
endp MidCheck
;----------------------------------------------;
proc CheckIfDraw
	push bp
	mov bp, sp
	mov si, -10
StartCheckThing:
	add si, 10
	cmp si, 90
	je EndThisThing
	
	mov bl, [TableXO+si+1]
	mov bh, [TableXO+si+2]
	mov cl, [TableXO+si+3]
	
	call MidCheck
	cmp ax, 0
	je EndThisThing
	
	mov bl, [TableXO+si+3]
	mov bh, [TableXO+si+4]
	mov cl, [TableXO+si+5]
	
	call MidCheck
	cmp ax, 0
	je EndThisThing
	
	mov bl, [TableXO+si+7]
	mov bh, [TableXO+si+8]
	mov cl, [TableXO+si+9]
	
	call MidCheck
	cmp ax, 0
	je EndThisThing
	
	mov bl, [TableXO+si+1]
	mov bh, [TableXO+si+4]
	mov cl, [TableXO+si+7]
	
	call MidCheck
	cmp ax, 0
	je EndThisThing
	
	mov bl, [TableXO+si+2]
	mov bh, [TableXO+si+5]
	mov cl, [TableXO+si+8]
	
	call MidCheck
	cmp ax, 0
	je EndThisThing
	
	mov bl, [TableXO+si+3]
	mov bh, [TableXO+si+6]
	mov cl, [TableXO+si+9]
	
	call MidCheck
	cmp ax, 0
	je EndThisThing
	
	mov bl, [TableXO+si+1]
	mov bh, [TableXO+si+5]
	mov cl, [TableXO+si+9]
	
	call MidCheck
	cmp ax, 0
	je EndThisThing
	
	mov bl, [TableXO+si+3]
	mov bh, [TableXO+si+5]
	mov cl, [TableXO+si+7]
	
	call MidCheck
	cmp ax, 0
	je EndThisThing
	
	mov [TableXO+si], 3
	add si, 10
	mov ax, si
	mov si, 10
	div si
	mov si, ax
	mov [CubesThatWon+si], 3
	mov ax, 10
	mul si
	mov si, ax
	sub si, 10
	
	
EndThisThing:
	cmp si, 90
	je STAHP
	jmp StartCheckThing
	
STAHP:
	xor si, si
	pop bp
	ret
endp CheckIfDraw
