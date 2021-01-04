	CLO
	JMP START
	DB 0		; [03] stores the value of variable a
	
START:
	MOV AL,5	; gives AL the value 5
	MOV [03],AL	; saves the value of AL to register 03

IFCONDITION:
	MOV AL,[03]	; withdraws the value of register 03 to AL
	CMP AL,3	; compares AL to number 3
	JNZ ELSEBLOCK	; If AL = 3, program jumps to block "ELSEBLOCK"
	
IFBLOCK:
	ADD AL,1	; increments AL by 1
	MOV [03],AL	; saves the value of AL to register 03
	JMP DISPLAY	; program jumpes to block "DISPLAY"

ELSEBLOCK:
	ADD AL,2	; increments AL by 2
	MOV [03],AL	; saves the value of AL into register 03

DISPLAY:
	MOV AL,[03]	; withdraws the value of register 03 to AL
	ADD AL,30	; increments AL by 30 to get the hex value of the AL (the display uses hex values)
	MOV [C0],AL	; moves the value of AL to the first VDU (visual display unit) register
	END		; ends program
