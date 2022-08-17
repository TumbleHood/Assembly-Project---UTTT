proc SmallCubeFixProc
	push bp
	mov bp, sp
	sub sp, 2
	mov ax, 2
	int 33h
	mov cx, 63
	mov dx, 5
	
SmallCubeFixColumn:
	cmp cx, 254
	je SmallCubeFixRow
	mov ah, 0dh
	inc cx
	int 10h
	cmp al, 10h
	jne SmallCubeFixColumn
	mov ah, 0ch
	mov al, 0
	int 10h
	jmp SmallCubeFixColumn
SmallCubeFixRow:
	cmp dx, 193
	ja FinishSmallCubeFix
	inc dx
	mov cx, 63
	jmp SmallCubeFixColumn
	
FinishSmallCubeFix:
	mov ax, 1
	int 33h
	add sp, 2
	pop bp
	ret 1
endp SmallCubeFixProc

OriginX equ [bp-2]

proc SmallCubeProc
	push bp
	mov bp, sp
	sub sp, 2
	mov ax, 2
	int 33h
	
	xor bx ,bx
	mov bl, [SmallCubeN]
	cmp [CubesThatWon + bx], 0
	je SmallCubeProcCheckStart
	mov [SmallCubeN], 0
	
SmallCubeProcCheckStart:
	mov cx, 63
	mov dx, 5
	cmp [SmallCubeN], 0
	je SmallCube0Column
	jmp SmallCubeSet
	
SmallCube0Column:
	cmp cx, 254
	je SmallCube0Row
	mov ah, 0dh
	inc cx
	int 10h
	cmp al, 0
	jne SmallCube0Column
	mov ah, 0ch
	mov al, 10h
	int 10h
	jmp SmallCube0Column
SmallCube0Row:
	cmp dx, 193
	ja FinishSmallCube
	inc dx
	mov cx, 63
	jmp SmallCube0Column
;this is the procedure that colors the spot where you can place your cross/circle in;
SmallCubeSet:
	mov cx, 63
	mov dx, 5
	mov al, [SmallCubeN]
	dec al
	xor ah, ah
	mov bl, 3
	div bl
		CubeXSet:
			cmp ah, 0
			jbe CubeYSet
			add cx, 65
			dec ah
			jmp CubeXSet
		CubeYSet:
			cmp al, 0
			jbe SmallCubeContinue
			add dx, 63
			dec al
			jmp CubeYSet
	SmallCubeContinue:
		mov OriginX, cx
		mov bl, 1
		mov bh, 1
	SmallCubeColumn:
		cmp bl, 62
		je SmallCubeRow
		mov ah, 0dh
		inc cx
		inc bl
		int 10h
		cmp al, 0
		jne SmallCubeColumn
		mov ah, 0ch
		mov al, 10h
		int 10h
		jmp SmallCubeColumn
	SmallCubeRow:
		cmp bh, 63
		ja FinishSmallCube
		inc dx
		inc bh
		mov cx,OriginX
		mov bl, 1
		jmp SmallCubeColumn
FinishSmallCube:
	mov ax, 1
	int 33h
	add sp, 2
	pop bp
	ret 1
endp SmallCubeProc