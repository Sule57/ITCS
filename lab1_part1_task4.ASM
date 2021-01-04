	CLO
	JMP START
	DB 0			; reserves register 03 for a variable
	DB 0			; reserves register 03 for a variable
START:
	MOV AL, [03]		; withdraws the value of register 03 to AL
	CMP AL, 6		; compares the value of AL to number 6
	JS MORE			; if the value of AL is less then 6, program jumps to block "MORE"
	JMP DISPLAY		; program jumps to block "DISPLAY"
TRUE:
	MOV BL, [04]		; withdraws the value of register 04 to BL
	ADD BL, 3		; increments BL by 3
	MOV [04], BL		; saves the value of BL to register 04
NEXT:
	ADD AL, 1		; increments AL by 1
	MOV [03],AL		; saves the value of AL to register 03
	JMP START		; program jumps to block "START"
MORE:
	CMP AL, 3		; compares AL to number 3
	JZ TRUE			; if AL = 3, program jumps to block "TRUE"
	JMP NEXT		; program jumps to block "NEXT"
DISPLAY:
	MOV AL,[03]		; withdraws the value of register 03 to AL
	ADD AL, 30		; increments AL by 30 (to get hex value)
	MOV BL,[04]		; withdraws the value of register 04 to BL
	ADD BL, 30		; increments BL by 30 (to get hex value)
	MOV [C0],AL		; moves the value of AL to the first VDU register
	MOV [D1],BL		; moves the value of BL to the first VDU register in 2nd row to display the value in 2nd line
	END			; ends program
	
