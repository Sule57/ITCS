	CLO
	JMP START
	DB 0		; stores the value of a [03]
START:
	MOV AL,5	; gives AL the value of 5
	MOV [03],AL	; saves the value of AL to register 03
IF:
	MOV AL,[03]	; withdraws the value of register 03 to AL
	CMP AL,3	; compares AL to number 3
	JZ ELSEBLOCK	; if the AL is less then 3, program jumps to block "ELSEBLOCK"
IFBLOCK:
	ADD AL,2	; increments AL by 2
	MOV [03],AL	; saves the value of AL to register 03
	JMP DISPLAY	; program jumps to block "DISPLAY"
ELSEBLOCK:
	ADD AL,1	; increments AL by 1
	MOV [03],AL	; saves the value of AL to register 03
DISPLAY:
	MOV AL,[03]	; withdraws the value of register 03 to AL
	ADD AL,30	; increments AL by 30 to get the hexadecimal value for the VDU (Visual Display Unit)
	MOV [C0],AL	; moves the value of AL to the first display register (C0)
	END		; ends program
