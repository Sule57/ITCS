	CLO
	JMP START
	DB 0		; [03] stores the value of variable a
START:
	MOV AL,5
	MOV [03],AL

IFCONDITION:
	MOV AL,[03]
	CMP AL,3
	JNZ ELSEBLOCK
IFBLOCK:

	ADD AL,1
	MOV [03],AL
	JMP DISPLAY

ELSEBLOCK:

	ADD AL,2
	MOV [03],AL

DISPLAY:

	MOV AL,[03]
	ADD AL,30
	MOV [C0],AL
	END