	CLO
	JMP START
	DB 0
	DB 0
	DB 0
	DB 0
START:
	MOV AL, A
	MOV [03],AL
	MOV BL, 4
	MOV [04],BL
	CALL 60
	JMP DISPLAY
FUNCTION:
	ORG 60
	PUSH AL
	PUSH CL
	PUSH DL
	PUSHF

	MOV CL, [03]
	MOV DL, [04]
	DIV CL,DL
	MUL CL,DL
	SUB AL,CL
	MOV [05],AL
	
	POPF
	POP DL
	POP CL
	POP AL
	RET
DISPLAY:
	MOV AL, [05]
	ADD AL,30
	MOV [C0], AL
	END