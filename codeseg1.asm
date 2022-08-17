proc OpenFile;This CODESEG1 file is just a copy of the bmp opener from the book;
	mov ah, 3Dh
	xor al, al
	mov dx, offset filename
	int 21h
	jc openerror
	mov [filehandle], ax 
	ret
openerror:
	mov dx, offset ErrorMsg
	mov ah, 9h
	int 21h
	ret
endp OpenFile
proc OpenFile2
	mov ah, 3Dh
	xor al, al
	mov dx, offset filename2
	int 21h
	jc openerror2
	mov [filehandle], ax 
	ret
openerror2:
	mov dx, offset ErrorMsg
	mov ah, 9h
	int 21h
	ret
endp OpenFile2
proc OpenFile3
	mov ah, 3Dh
	xor al, al
	mov dx, offset filename3
	int 21h
	jc openerror3
	mov [filehandle], ax 
	ret
openerror3:
	mov dx, offset ErrorMsg
	mov ah, 9h
	int 21h
	ret
endp OpenFile3
proc ReadHeader
	mov ah,3fh
	mov bx, [filehandle]
	mov cx,54
	mov dx,offset Header
	int 21h
	ret
endp ReadHeader
proc ReadPalette
	mov ah,3fh
	mov cx,400h
	mov dx,offset Palette
	int 21h
	ret
endp ReadPalette 
proc CopyPal
	mov si,offset Palette
	mov cx,256
	mov dx,3C8h
	mov al,0
	out dx,al
	inc dx
PalLoop:
	mov al,[si+2]
	shr al,2
	out dx,al
	mov al,[si+1]
	shr al,2
	out dx,al
	mov al,[si]
	shr al,2
	out dx,al
	add si,4
	loop PalLoop
	ret
endp CopyPal
proc CopyBitmap
	mov ax, 0A000h
	mov es, ax
	mov cx,200
PrintBMPLoop:
	push cx
	mov di,cx
	shl cx,6
	shl di,8
	add di,cx
	mov ah,3fh
	mov cx,320
	mov dx,offset ScrLine
	int 21h
	cld
	mov cx,320
	mov si,offset ScrLine 
	rep movsb
	pop cx
	loop PrintBMPLoop
	ret
endp CopyBitmap
