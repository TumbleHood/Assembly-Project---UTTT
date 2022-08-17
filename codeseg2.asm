xDraw equ [word ptr bp+4] ;there are the procedures that draw the circle and the cross;
yDraw equ [word ptr bp+6]
proc drawCircle
	push bp
	mov bp, sp
	mov ax, 2
	int 33h
	mov bx, -13
	xor di, di
	sub yDraw, 1
DrawRowCircle:
	add bx, 13
	xor si, si
	inc yDraw
	inc di
	cmp di, 14
	je endDrawCircle
DrawColumnCircle:
	add bx, si
	mov ah, 0ch
	mov al, [circle + bx]
	mov cx, xDraw
	mov dx, yDraw
	int 10h
	sub bx, si
	inc xDraw
	inc si
	cmp si, 13
	jne DrawColumnCircle
	sub xDraw, 13
	jmp DrawRowCircle
endDrawCircle:
	mov ax, 1
	int 33h
	pop bp
	ret
endp drawCircle

proc drawCross
	push bp
	mov bp, sp
	mov ax, 2
	int 33h
	mov bx, -13
	xor di, di
	sub yDraw, 1
DrawRowCross:
	add bx, 13
	xor si, si
	inc yDraw
	inc di
	cmp di, 14
	je endDrawCross
DrawColumnCross:
	add bx, si
	mov ah, 0ch
	mov al, [cross + bx]
	mov cx, xDraw
	mov dx, yDraw
	int 10h
	sub bx, si
	inc xDraw
	inc si
	cmp si, 13
	jne DrawColumnCross
	sub xDraw, 13
	jmp DrawRowCross
endDrawCross:
	mov ax, 1
	int 33h
	pop bp
	ret 2
endp drawCross
