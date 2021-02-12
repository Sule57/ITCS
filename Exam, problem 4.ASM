	CLO
	JMP START
	DB 1
	DB 1
	DB 1			;reserving registers
	DB 1

START:
	MOV AL,2		;A is 2
	MOV BL,1		;B is 1
	MOV CL,1		;C is 1
	MOV [03],BL		;Saves the values to registers
	MOV [04],CL

START2:
	MOV BL,[03]
	MOV CL,[04]
	CMP AL,0A		;checks if counter reached 10
	JZ FINISH		;if it did program jumps to finish
	ADD BL,CL		;adds bl and cl and stores it in bl
	PUSH BL			;moves bl to dl
	POP DL			
	PUSH CL			;moves cl to bl
	POP BL
	PUSH DL			;moves dl to cl
	POP CL
	MOV [03],BL		;saves values to registers
	MOV [04],CL
	ADD AL,1		;increment counter
	JMP START2		;run again

FINISH:
	MOV AL,[04]
	MOV [C0],AL		;visual register
	END