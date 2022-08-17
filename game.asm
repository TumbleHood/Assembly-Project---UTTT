JUMPS
IDEAL ; this GAME.ASM file is just all the "Includes" and the basic loop of placing X then placing O;
MODEL small
STACK 100h
;---------------------;
DATASEG
include "dataseg1.asm"
include "dataseg2.asm"
include "dataseg3.asm"
include "dataseg4.asm"
;----------------------------------;
CODESEG
include "codeseg1.asm"
include "codeseg2.asm"
include "codeseg3.asm"
include "codeseg4.asm"
include "codeseg5.asm"
include "codeseg6.asm"
include "codeseg7.asm"
include "codeseg8.asm"
;-----------------------;
proc CheckIfWonAll
	push bp
	mov bp, sp
	call CheckIfWonColumn
	call CheckIfWonRow
	call CheckIfWonDiagnal
	call CheckIfDraw
	pop bp
	ret
endp CheckIfWonAll
proc CheckIfFinalyWonAll
	push bp
	mov bp, sp
	call CheckIfFinalyWonColumn
	call CheckIfFinalyWonRow
	call CheckIfFinalyWonDiagnal
	call CheckIfFinalyDraw
	pop bp
	ret
endp CheckIfFinalyWonAll
proc WriteTurn
	push bp
	mov bp, sp
	mov ah, 2
	xor bh, bh
	mov dh, 9
	mov dl, 1
	int 10h
	mov bl, 15
	xor bh, bh
	mov ah, 10
	cmp [turn], 1
	je StopWriting
	mov bl, 6
StopWriting:
	mov al, 'n'
	mov cx, 4
	int 10h
	mov al, 'r'
	mov cx, 3
	int 10h
	mov al, 'u'
	mov cx, 2
	int 10h
	mov al, 'T'
	mov cx, 1
	int 10h
	mov ah, 2
	xor bh, bh
	mov dh, 11
	mov dl, 3
	int 10h
	mov bl, 6
	mov ah, 10
	cmp [turn], 2
	je WriteCircle
	mov bl, 15
WriteCross:
	mov al, 'X'
	mov cx, 1
	int 10h
	jmp StopWritingIt
WriteCircle:
	mov al, 'O'
	mov cx, 1
	int 10h
StopWritingIt:
	xor bx, bx
	xor cx, cx
	xor dx, dx
	pop bp
	ret
endp WriteTurn
proc WriteWon
	push bp
	mov bp, sp
	mov ah, 2
	xor bh, bh
	mov dh, 9
	mov dl, 1
	int 10h
	mov ah, 10
	mov bl, 15
	cmp [CubesThatWon], 1
	je WriteCrossWon
	mov bl, 6
	cmp [CubesThatWon], 2
	je WriteCircleWon
	jmp WriteDraw
WriteCrossWon:
	mov al, ' '
	mov cx, 4
	int 10h
	mov al, 'X'
	mov cx, 3
	int 10h
	mov al, ' '
	mov cx, 2
	int 10h
	mov ah, 2
	xor bh, bh
	mov dh, 11
	mov dl, 1
	int 10h
	mov bl, 15
	mov bh, 10
	mov ah, 10
	mov al, ' '
	mov cx, 4
	int 10h
	mov bl, 15
	jmp StopWritingWon
WriteCircleWon:
	mov al, ' '
	mov cx, 4
	int 10h
	mov al, 'O'
	mov cx, 3
	int 10h
	mov al, ' '
	mov cx, 2
	int 10h
	mov ah, 2
	xor bh, bh
	mov dh, 11
	mov dl, 1
	int 10h
	mov bl, 15
	mov bh, 10
	mov ah, 10
	mov al, ' '
	mov cx, 4
	int 10h
	mov bl, 6
	jmp StopWritingWon
WriteDraw:
	mov ah, 2
	xor bh, bh
	mov dh, 9
	mov dl, 1
	int 10h
	mov ah, 10
	mov al, ' '
	mov cx, 4
	int 10h
	mov ah, 2
	xor bh, bh
	mov dh, 11
	mov dl, 1
	int 10h
	mov ah, 10
	mov al, ' '
	mov cx, 4
	int 10h
	mov ah, 2
	xor bh, bh
	mov dh, 10
	mov dl, 1
	int 10h
	mov ah, 10
	mov bl, 7
	mov al, '!'
	mov cx, 4
	int 10h
	mov al, 'e'
	mov cx, 3
	int 10h
	mov al, 'i'
	mov cx, 2
	int 10h
	mov al, 'T'
	mov cx, 1
	int 10h
	jmp StopWritingNow
StopWritingWon:
	mov ah, 10
	mov al, '!'
	mov cx, 4
	int 10h
	mov al, 'n'
	mov cx, 3
	int 10h
	mov al, 'o'
	mov cx, 2
	int 10h
	mov al, 'W'
	mov cx, 1
	int 10h
StopWritingNow:
	xor bx, bx
	xor cx, cx
	xor dx, dx
	pop bp
	ret
endp WriteWon
proc Reboot
	push bp
	mov bp, sp
	mov si, -1
restartLoop:
	inc si
	mov [TableXO+si], 0
	cmp si, 89
	jne restartLoop
	mov si, -1
restartLoop2:
	inc si
	mov [CubesThatWon+si], 0
	cmp si, 9
	jne restartLoop2
	
	mov [SmallCubeN], 0
	mov [BigCubeN], 0
	mov [CubeX], 0
	mov [CubeY], 0
	mov [checker], 0
	mov [turn], 0
	
	mov bl, 0
	mov bh, 1
	mov ah, 10
	mov al, ' '
	mov cx, 10
	int 10h
	
CheckNotPressed:
	mov ax, 3
	int 33h
	shr cx, 1
	cmp bx, 0
	jne CheckNotPressed
	pop bp
	ret
endp Reboot
;---------------------------------------------------------------------------------------------;
start:
	mov ax, @data
	mov ds, ax
	mov ax, 13h
	int 10h
	mov ax, 0
	int 33h
	mov ax, 1
	int 33h
StartAfterQuit:
	call Reboot
	mov ax, 2
	int 33h
	call OpenFile2
	call ReadHeader
	call ReadPalette
	call CopyPal
	call CopyBitmap
	mov ax, 1
	int 33h
	MOV  AX,0009H
	PUSH DS
	POP ES
    xor bx, bx            ; HORZ HOT SPOT
    xor cx, cx           ; VERT HOT SPOT
	mov  dx,offset MyCursur         ; es:dx points to mask
	int  33h
CheckMenu:
	call CheckMenuButtons
	jmp CheckMenu
StartAfterRestart:
	mov ax, 2
	int 33h
	call OpenFile
	call ReadHeader
	call ReadPalette
	call CopyPal
	call CopyBitmap
	mov ax, 1
	int 33h
	MOV  AX,0009H
	PUSH DS
	POP ES
    xor bx, bx            ; HORZ HOT SPOT
    mov cx, 13          ; VERT HOT SPOT
	mov  dx,offset MyCursur2         ; es:dx points to mask
	int  33h
	jmp CreateCross
	
Rules:
	mov ax, 2
	int 33h
	call openFile3
	call ReadHeader
	call ReadPalette
	call CopyPal
	call CopyBitmap
	mov ax, 1
	int 33h
	CheckRules:
	call CheckBacktoMenuButton
	jmp CheckRules
CreateCross:
	mov [turn], 1
	call WriteTurn
	xor ax, ax
	call CheckIfWonAll
	call DrawBigCircle
	call DrawBigCube
	call SmallCubeFixProc
	call SmallCubeProc
	call CheckIfFinalyWonAll
	call CheckButton
	call DrawInSmallCube
	push dx
	push cx
	call drawCross
checkPress1:
	call CheckButton
	mov ax, 3
	int 33h
	shr cx, 1
	cmp bx, 0
	je CreateCircle
	jmp checkPress1
	
CreateCircle:
	mov [turn], 2
	call WriteTurn
	xor ax, ax
	call CheckIfWonAll
	call DrawBigCircle
	call DrawBigCube
	call SmallCubeFixProc
	call SmallCubeProc
	call CheckIfFinalyWonAll
	call CheckButton
	call DrawInSmallCube
	push dx
	push cx
	call drawCircle
checkPress2:
	call CheckButton
	mov ax, 3
	int 33h
	shr cx, 1
	cmp bx, 0
	je CreateCross
	jmp checkPress2
	
dunzo:
	call SmallCubeFixProc
	call WriteWon
	dunzo2:
	call CheckButton
	jmp dunzo2
restart:
	call Reboot
	jmp StartAfterRestart
quit:
	jmp StartAfterQuit
	
;--------------------;
exit:
	mov ah, 0
	mov al, 2
	int 10h
	mov ax, 4c00h
	int 21h
END start