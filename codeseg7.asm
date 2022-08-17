proc CheckIfFinalyWonColumn
	push bp
	mov bp, sp
	
FinalBCc1:
	
	mov bl, [CubesThatWon + 1]
	mov bh, [CubesThatWon + 2]
	mov cl, [CubesThatWon + 3]
	
	cmp bl, 3
	je noFinalyWinC1
	
	cmp bl, 0
	jne FinalyOKc1
	jmp noFinalyWinC1
FinalyOKc1:
	cmp bl, bh
	je FinalyE12
	jne noFinalyWinC1
FinalyE12:
	cmp bl, cl
	je FinalyWinC1
	jne noFinalyWinC1
FinalyWinC1:
	mov [CubesThatWon], bl
	jmp dunzo
	
noFinalyWinC1:
	
	mov bl, [CubesThatWon + 4]
	mov bh, [CubesThatWon + 5]
	mov cl, [CubesThatWon + 6]
	
	cmp bl, 3
	je noFinalyWinC2
	
	cmp bl, 0
	jne FinalyOKc2
	jmp noFinalyWinC2
FinalyOKc2:
	cmp bl, bh
	je FinalyE34
	jne noFinalyWinC2
FinalyE34:
	cmp bl, cl
	je FinalyWinC2
	jne noFinalyWinC2
FinalyWinC2:
	mov [CubesThatWon], bl
	jmp dunzo
	
noFinalyWinC2:
	
	mov bl, [CubesThatWon + 7]
	mov bh, [CubesThatWon + 8]
	mov cl, [CubesThatWon + 9]
	
	cmp bl, 3
	je noFinalyWinC3
	
	cmp bl, 0
	jne FinalyOKc3
	jmp noFinalyWinC3
FinalyOKc3:
	cmp bl, bh
	je FinalyE78
	jne noFinalyWinC3
FinalyE78:
	cmp bl, cl
	je FinalyWinC3
	jne noFinalyWinC3
FinalyWinC3:
	mov [CubesThatWon], bl
	jmp dunzo
	
noFinalyWinC3:
	xor si, si
	pop bp
	ret
endp CheckIfFinalyWonColumn
;----------------------------------------------------------------------------------------------------------------------------------------;
proc CheckIfFinalyWonRow
	push bp
	mov bp, sp
	
FinalBCr1:
	
	mov bl, [CubesThatWon + 1]
	mov bh, [CubesThatWon + 4]
	mov cl, [CubesThatWon + 7]
	
	cmp bl, 3
	je noFinalyWinR1
	
	cmp bl, 0
	jne FinalyOKr1
	jmp noFinalyWinr1
FinalyOKr1:
	cmp bl, bh
	je FinalyE14
	jne noFinalyWinR1
FinalyE14:
	cmp bl, cl
	je FinalyWinR1
	jne noFinalyWinR1
FinalyWinR1:
	mov [CubesThatWon], bl
	jmp dunzo
	
noFinalyWinR1:
	
	mov bl, [CubesThatWon + 2]
	mov bh, [CubesThatWon + 5]
	mov cl, [CubesThatWon + 8]
	
	cmp bl, 3
	je noFinalyWinR2
	
	cmp bl, 0
	jne FinalyOKr2
	jmp noFinalyWinR2
FinalyOKr2:
	cmp bl, bh
	je FinalyE25
	jne noFinalyWinR2
FinalyE25:
	cmp bl, cl
	je FinalyWinR2
	jne noFinalyWinR2
FinalyWinR2:
	mov [CubesThatWon], bl
	jmp dunzo
	
noFinalyWinR2:
	
	mov bl, [CubesThatWon + 3]
	mov bh, [CubesThatWon + 6]
	mov cl, [CubesThatWon + 9]
	
	cmp bl, 3
	je noFinalyWinR3
	
	cmp bl, 0
	jne FinalyOKr3
	jmp noFinalyWinr3
FinalyOKr3:
	cmp bl, bh
	je FinalyE36
	jne noFinalyWinR3
FinalyE36:
	cmp bl, cl
	je FinalyWinR3
	jne noFinalyWinR3
FinalyWinR3:
	mov [CubesThatWon], bl
	jmp dunzo
	
noFinalyWinR3:
	xor si, si
	pop bp
	ret
endp CheckIfFinalyWonRow
;----------------------------------------------------------------------------------------------------------------------------------------;
proc CheckIfFinalyWonDiagnal
	push bp
	mov bp, sp
	
FinalBCd1:
	
	mov bl, [CubesThatWon + 1]
	mov bh, [CubesThatWon + 5]
	mov cl, [CubesThatWon + 9]
	
	cmp bl, 3
	je noFinalyWinD1
	
	cmp bl, 0
	jne FinalyOKd1
	jmp noFinalyWind1
FinalyOKd1:
	cmp bl, bh
	je FinalyE15
	jne noFinalyWinD1
FinalyE15:
	cmp bl, cl
	je FinalyWinD1
	jne noFinalyWinD1
FinalyWinD1:
	mov [CubesThatWon], bl
	jmp dunzo
	
noFinalyWinD1:
	
	mov bl, [CubesThatWon + 3]
	mov bh, [CubesThatWon + 5]
	mov cl, [CubesThatWon + 7]
	
	cmp bl, 3
	je noFinalyWinD2
	
	cmp bl, 0
	jne FinalyOKd2
	jmp noFinalyWinD2
FinalyOKd2:
	cmp bl, bh
	je FinalyE35
	jne noFinalyWinD2
FinalyE35:
	cmp bl, cl
	je FinalyWinD2
	jne noFinalyWinD2
FinalyWinD2:
	mov [CubesThatWon], bl
	jmp dunzo
	
noFinalyWinD2:
	xor si, si
	pop bp
	ret
endp CheckIfFinalyWonDiagnal
;----------------------------------------------------------------------------------------------------------------------------------------;
proc MidFinalCheck
	push bp
	mov bp, sp
	cmp bl, 0
	jne OKFinalCheck
	jmp noThingThereFinalCheck
OKFinalCheck:
	cmp bh, 0
	je noThingThereFinalCheck
	cmp bl, bh
	je EFinalCheck
	jne noWinFinalCheck
EFinalCheck:
	cmp bl, cl
	je WinFinalCheck
	jne noWinFinalCheck
WinFinalCheck:
	mov ax, 2
	jmp EndFinalCheckThing
	
noWinFinalCheck:
	cmp bl, 0
	je noThingThereFinalCheck
	cmp bh, 0
	je noThingThereFinalCheck
	cmp cl, 0
	je noThingThereFinalCheck
	mov ax, 1
	jmp EndFinalCheckThing
	
noThingThereFinalCheck:
	xor ax, ax
EndFinalCheckThing:
	pop bp
	ret
endp MidFinalCheck
;------------------------------------;
proc CheckIfFinalyDraw
	push bp
	mov bp, sp
	
	mov bl, [CubesThatWon+1]
	mov bh, [CubesThatWon+2]
	mov cl, [CubesThatWon+3]
	
	call MidFinalCheck
	cmp ax, 1
	jne EndThisFinalThing
	
	mov bl, [CubesThatWon+4]
	mov bh, [CubesThatWon+5]
	mov cl, [CubesThatWon+6]
	
	call MidFinalCheck
	cmp ax, 1
	jne EndThisFinalThing
	
	mov bl, [CubesThatWon+7]
	mov bh, [CubesThatWon+8]
	mov cl, [CubesThatWon+9]
	
	call MidFinalCheck
	cmp ax, 1
	jne EndThisFinalThing
	
	mov bl, [CubesThatWon+1]
	mov bh, [CubesThatWon+4]
	mov cl, [CubesThatWon+7]
	
	call MidFinalCheck
	cmp ax, 1
	jne EndThisFinalThing
	
	mov bl, [CubesThatWon+2]
	mov bh, [CubesThatWon+5]
	mov cl, [CubesThatWon+8]
	
	call MidFinalCheck
	cmp ax, 1
	jne EndThisFinalThing
	
	mov bl, [CubesThatWon+3]
	mov bh, [CubesThatWon+6]
	mov cl, [CubesThatWon+9]
	
	call MidFinalCheck
	cmp ax, 1
	jne EndThisFinalThing
	
	mov bl, [CubesThatWon+1]
	mov bh, [CubesThatWon+5]
	mov cl, [CubesThatWon+9]
	
	call MidFinalCheck
	cmp ax, 1
	jne EndThisFinalThing
	
	mov bl, [CubesThatWon+3]
	mov bh, [CubesThatWon+5]
	mov cl, [CubesThatWon+7]
	
	call MidFinalCheck
	cmp ax, 1
	jne EndThisFinalThing
	
	
	mov [CubesThatWon], 3
	jmp dunzo
	
EndThisFinalThing:
	xor ax, ax
	pop bp
	ret
endp CheckIfFinalyDraw