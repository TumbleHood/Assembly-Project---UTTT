xBigDraw equ [word ptr bp-2]
yBigDraw equ [word ptr bp-4]
;------------------------------------------------------------------------------------;
proc DrawBigCircle
	push bp
	mov bp, sp
	sub sp, 4
	mov ax, 2
	int 33h
	xor ax, ax
	xor cx, cx
	xor dx, dx
	xor si, si
	mov xBigDraw, 69
	mov yBigDraw, 8
	mov [checker], 0
	
	
StartBigDrawingBigCircle:
	mov xBigDraw, 69
	mov yBigDraw, 8
	inc [checker]
	cmp [checker], 9
	jna BeginBigDrawingBigCircle
	jmp DunzoCircle
	
BeginBigDrawingBigCircle:
	xor bh, bh
	mov bl, [checker]
	cmp [CubesThatWon + bx], 2
	jne StartBigDrawingBigCircle
	
	mov al, bl
	dec al
	xor ah, ah
	mov bx, 3
	div bl
		BigCircleXSet:
			cmp ah, 0
			jbe BigCircleYSet
			add xBigDraw, 66
			dec ah
			jmp BigCircleXSet
		BigCircleYSet:
			cmp al, 0
			jbe BigCircleContinue
			add yBigDraw, 66
			dec al
			jmp BigCircleYSet
	
BigCircleContinue:
	xor cx, cx
	xor dx, dx
	mov bx, -49
	xor di, di
	sub yBigDraw, 1
BigDrawRowCircle:
	add bx, 49
	xor si, si
	inc yBigDraw
	inc di
	cmp di, 52
	je endBigDrawCircle
BigDrawColumnCircle:
	add bx, si
	mov ah, 0ch
	mov al, [BigCircle + bx]
	mov cx, xBigDraw
	mov dx, yBigDraw
	int 10h
	sub bx, si
	inc xBigDraw
	inc si
	cmp si, 49
	jne BigDrawColumnCircle
	sub xBigDraw, 49
	jmp BigDrawRowCircle
	
endBigDrawCircle:
	jmp StartBigDrawingBigCircle
DunzoCircle:
	mov ax, 1
	int 33h
	add sp, 4
	pop bp
	ret 2
endp DrawBigCircle
;--------------------------------------------------------;
proc DrawBigCube
	push bp
	mov bp, sp
	sub sp, 4
	mov ax, 2
	int 33h
	xor ax, ax
	xor cx, cx
	xor dx, dx
	xor si, si
	mov xBigDraw, 69
	mov yBigDraw, 8
	mov [checker], 0
	
	
StartBigDrawingBigCube:
	mov xBigDraw, 69
	mov yBigDraw, 8
	inc [checker]
	cmp [checker], 9
	jna BeginBigDrawingBigCube
	jmp DunzoCube
	
BeginBigDrawingBigCube:
	xor bh, bh
	mov bl, [checker]
	cmp [CubesThatWon + bx], 1
	jne StartBigDrawingBigCube
	
	mov al, bl
	dec al
	xor ah, ah
	mov bx, 3
	div bl
		BigCubeXSet:
			cmp ah, 0
			jbe BigCubeYSet
			add xBigDraw, 66
			dec ah
			jmp BigCubeXSet
		BigCubeYSet:
			cmp al, 0
			jbe BigCubeContinue
			add yBigDraw, 66
			dec al
			jmp BigCubeYSet
	
BigCubeContinue:
	xor cx, cx
	xor dx, dx
	mov bx, -49
	xor di, di
	sub yBigDraw, 1
BigDrawRowCube:
	add bx, 49
	xor si, si
	inc yBigDraw
	inc di
	cmp di, 52
	je endBigDrawCube
BigDrawColumnCube:
	add bx, si
	mov ah, 0ch
	mov al, [BigCube + bx]
	mov cx, xBigDraw
	mov dx, yBigDraw
	int 10h
	sub bx, si
	inc xBigDraw
	inc si
	cmp si, 49
	jne BigDrawColumnCube
	sub xBigDraw, 49
	jmp BigDrawRowCube
	
endBigDrawCube:
	jmp StartBigDrawingBigCube
DunzoCube:
	mov ax, 1
	int 33h
	add sp, 4
	pop bp
	ret 2
endp DrawBigCube
;--------------------------------------------------------------;