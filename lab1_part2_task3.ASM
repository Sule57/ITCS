	CLO			
	JMP START
	DB 0			; reserves register 03 for variable
	DB 0			; reserves register 04 for variable
	DB 0			; reserves register 05 for variable

START:
	MOV AL, 7A		; gives AL the value of 7A (122)
	MOV [03],AL		; saves the value of AL to register 03
	MOV BL, 11		; gives BL the value of 11 (17)
	MOV [04],BL		; saves the value of BL to register 04

BODY:
	CMP BL, 0		; compares variable BL to value 0 (stops bugs where BL is 0 at the start)
	JZ DISPLAY		; if BL = 0, program jumps to block "DISPLAY"
	CALL 60			; calls the function on register 60
	MOV DL, [05]		; withdraws the value of register 05 to variable DL
	MOV AL, [04]		; withdraws the value of register 04 to variable AL
	MOV BL, [05]		; withdraws the value of register 05 to variable BL
	CMP BL, 0		; compares variable BL to value 0
	JZ DISPLAY		; program jumps to block "DISPLAY"
	MOV [03], AL		; saves the value of AL to register 03
	MOV [04], BL		; saves the value of BL to register 04
	JMP BODY		; program jumps to block "BODY"

FUNCTION:
	ORG 60			; function starts on register 60
	PUSH AL			; pushes AL
	PUSH CL			; pushes CL
	PUSH DL			; pushes DL
	PUSHF

	MOV CL, [03]		; moves the value of register 03 to CL
	MOV DL, [04]		; moves the value of register 04 to DL
	DIV CL,DL		; divides CL by DL
	MUL CL,DL		; multiplies the integer division product by DL
	SUB AL,CL		; subtracts CL from AL
	MOV [05],AL		; saves the new value of AL to register 05
	
	POPF
	POP DL			; returns the program to proper register, so it...
	POP CL			; ...can continue running normally 
	POP AL
	RET
DISPLAY:
	MOV AL, [04]		; moves the value of register 04 to AL
	ADD AL,30		; increments AL by 30
	MOV [C0], AL		; moves the value of AL to the first VDU register (C0)
	END			; ends program
