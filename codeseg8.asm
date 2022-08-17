proc CheckButton
	push bp
	mov bp, sp
	call CheckRestartButton
	call CheckQuitButton
	pop bp
	ret
endp CheckButton
proc CheckRestartButton
	push bp
	mov bp, sp
	mov ax, 3
	int 33h
	shr cx, 1
	cmp bx, 1
	jne Nope
	cmp cx, 271
	jb Nope
	cmp cx, 305
	ja Nope
	cmp dx, 146
	jb Nope
	cmp dx, 179
	ja Nope
	jmp restart
Nope:
	pop bp
	ret
endp CheckRestartButton
proc CheckQuitButton
	push bp
	mov bp, sp
	mov ax, 3
	int 33h
	shr cx, 1
	cmp bx, 1
	jne Nope1
	cmp cx, 14
	jb Nope1
	cmp cx, 48
	ja Nope1
	cmp dx, 146
	jb Nope1
	cmp dx, 179
	ja Nope1
	jmp quit
Nope1:
	pop bp
	ret
endp CheckQuitButton
proc CheckStartButton
	push bp
	mov bp, sp
	mov ax, 3
	int 33h
	shr cx, 1
	cmp bx, 1
	jne Nope2
	cmp cx, 251
	jb Nope2
	cmp cx, 287
	ja Nope2
	cmp dx, 120
	jb Nope2
	cmp dx, 156
	ja Nope2
	jmp StartAfterRestart
Nope2:
	pop bp
	ret
endp CheckStartButton
proc CheckRulesButton
	push bp
	mov bp, sp
	mov ax, 3
	int 33h
	shr cx, 1
	cmp bx, 1
	jne Nope4
	cmp cx, 33
	jb Nope4
	cmp cx, 69
	ja Nope4
	cmp dx, 120
	jb Nope4
	cmp dx, 156
	ja Nope4
	jmp Rules
Nope4:
	pop bp
	ret
endp CheckRulesButton
proc CheckExitButton
	push bp
	mov bp, sp
	mov ax, 3
	int 33h
	shr cx, 1
	cmp bx, 1
	jne Nope3
	cmp cx, 6
	jb Nope3
	cmp cx, 24
	ja Nope3
	cmp dx, 9
	jb Nope3
	cmp dx, 26
	ja Nope3
	jmp exit
Nope3:
	pop bp
	ret
endp CheckExitButton
proc CheckMenuButtons
	push bp
	mov bp, sp
	call CheckExitButton
	call CheckStartButton
	call CheckRulesButton
	pop bp
	ret
endp CheckMenuButtons
proc CheckBacktoMenuButton
	push bp
	mov bp, sp
	mov ax, 3
	int 33h
	shr cx, 1
	cmp bx, 1
	jne Nope5
	cmp cx, 6
	jb Nope5
	cmp cx, 24
	ja Nope5
	cmp dx, 9
	jb Nope5
	cmp dx, 26
	ja Nope5
	jmp StartAfterQuit
Nope5:
	pop bp
	ret
endp CheckBacktoMenuButton