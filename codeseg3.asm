Xcor equ [bp-2];this is a bit complecated. it will be hard to explain everything, but basically what it does, it converts the place where you click to the edge of where the cross/circle should be drawn, and then tells you where it draw it in order for you to know where the next player can lace the circle/cross;
Ycor equ [bp-4]
OriginSmall equ [bp-6]
proc DrawInSmallCube
	push bp
	mov bp, sp
	sub sp, 6
	mov ax, 2
	int 33h
	xor cx, cx
	xor dx, dx
	mov ax, 1
	int 33h
beginCheck:
	call CheckButton
	mov ax, 3
	int 33h
	shr cx, 1
	cmp bx, 1
	jne beginCheck
	mov si, 1
	mov di, 1
	sub cx, 69
	sub dx, 6

CheckX:
	cmp cx, 15
	jbe CheckY
	sub cx, 17
	inc si
	cmp si, 3
	jne CheckX
	cmp cx, 15
	jbe CheckY
	sub cx, 32
	inc si
CheckX2:
	cmp cx, 15
	jbe CheckY
	sub cx, 17
	inc si
	cmp si, 6
	jne CheckX2
	cmp cx, 15
	jbe CheckY
	sub cx, 32
	inc si
CheckX3:
	cmp cx, 15
	jbe CheckY
	sub cx, 17
	inc si
	cmp si, 10
	jne CheckX3
	jmp beginCheck

CheckY:
	cmp dx, 15
	jbe SItoCX
	sub dx, 17
	inc di
	cmp di, 3
	jne CheckY
	cmp dx, 15
	jbe SItoCX
	sub dx, 32
	inc di
CheckY2:
	cmp dx, 15
	jbe SItoCX
	sub dx, 17
	inc di
	cmp di, 6
	jne CheckY2
	cmp dx, 15
	jbe SItoCX
	sub dx, 32
	inc di
CheckY3:
	cmp dx, 15
	jbe SItoCX
	sub dx, 17
	inc di
	cmp di, 10
	jne CheckY3
	jmp beginCheck

SItoCX:
	cmp si, 1
	je Si1
	cmp si, 2
	je Si2
	cmp si, 3
	je Si3
	cmp si, 4
	je Si4
	cmp si, 5
	je Si5
	cmp si, 6
	je Si6
	cmp si, 7
	je Si7
	cmp si, 8
	je Si8
	cmp si, 9
	je Si9
Si1:
	mov cx, 70
	mov [CubeX], 1
	jmp DItoDX
Si2:
	mov cx, 87
	mov [CubeX], 1
	jmp DItoDX
Si3:
	mov cx, 104
	mov [CubeX], 1
	jmp DItoDX
Si4:
	mov cx, 136
	mov [CubeX], 2
	jmp DItoDX
Si5:
	mov cx, 153
	mov [CubeX], 2
	jmp DItoDX
Si6:
	mov cx, 170
	mov [CubeX], 2
	jmp DItoDX
Si7:
	mov cx, 202
	mov [CubeX], 3
	jmp DItoDX
Si8:
	mov cx, 219
	mov [CubeX], 3
	jmp DItoDX
Si9:
	mov cx, 236
	mov [CubeX], 3
	jmp DItoDX

DItoDX:
	cmp di, 1
	je Di1
	cmp di, 2
	je Di2
	cmp di, 3
	je Di3
	cmp di, 4
	je Di4
	cmp di, 5
	je Di5
	cmp di, 6
	je Di6
	cmp di, 7
	je Di7
	cmp di, 8
	je Di8
	cmp di, 9
	je Di9
Di1:
	mov dx, 9
	mov [CubeY], 1
	jmp endCheck
Di2:
	mov dx, 26
	mov [CubeY], 1
	jmp endCheck
Di3:
	mov dx, 43
	mov [CubeY], 1
	jmp endCheck
Di4:
	mov dx, 77
	mov [CubeY], 2
	jmp endCheck
Di5:
	mov dx, 94
	mov [CubeY], 2
	jmp endCheck
Di6:
	mov dx, 112
	mov [CubeY], 2
	jmp endCheck
Di7:
	mov dx, 142
	mov [CubeY], 3
	jmp endCheck
Di8:
	mov dx, 159
	mov [CubeY], 3
	jmp endCheck
Di9:
	mov dx, 176
	mov [CubeY], 3
	jmp endCheck

endCheck:
	mov Xcor, cx
	mov Ycor, dx
	
	mov bh, [CubeY]
	mov bl, [CubeX]
	mov al, 3
	mul bh
	mov bh, al
	sub bh, 3
	add bl, bh
	mov [BigCubeN], bl
	
	xor bh, bh
	cmp [CubesThatWon + bx], 0
	je NothingWonCube
	jmp beginCheck
	
NothingWonCube:
	cmp [SmallCubeN], 0
	je PlaceSomething
	
	mov al, [SmallCubeN]
	mov OriginSmall, al
	cmp [BigCubeN], al
	je PlaceSomething
	jmp beginCheck

PlaceSomething:
	mov dl, [CubeY]
	dec dl
	mov dh, [CubeX]
	dec dh
	mov al, 3
	mul dl
	mov dl, al
	mov al, 3
	mul dh
	mov dh, al
	
	mov cx, dx
	xor ch, ch
	mov bl, dh
	xor bh, bh
	
	sub di, cx
	mov ax, 3
	mul di
	mov di, ax
	sub di, 3
	sub si, bx
	
	add di, si
	mov ax, di
	mov [SmallCubeN], al
	
	xor bx, bx
	mov bl, [BigCubeN]
	mov ax, 10
	dec bl
	mul bl
	add al, [SmallCubeN]
	mov bx, ax
	mov al, [turn]
	xor ah, ah
	cmp [TableXO + bx], 0
	je FinishPlacing
	mov al, OriginSmall
	mov [SmallCubeN], al
	jmp beginCheck
	
FinishPlacing:
	mov [TableXO + bx], al
	mov cx, Xcor
	mov dx, Ycor
	add sp, 6
	pop bp
	ret 3
endp DrawInSmallCube