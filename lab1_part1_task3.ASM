	CLO
	JMP START
	DB 0			; reserves register 03 for a variable
	DB 0			; reserves register 04 for a variable
START:
	MOV AL, [03]		; withdraws the value of register 03 to AL
	CMP AL, 3		; compares AL to number 3
	JS MORE			; if the value of AL is less then 3, then program jumps to block "MORE"
NEXT:
	ADD AL, 1		; increments AL by 1
	MOV [03], AL		; saves the value of AL to register 03
	CMP AL, 3		; compares AL to number 3
	JZ DISPLAYandEND	; if the value of AL = 3, program jumps to block "DISPLAYandEND
	CMP AL, 3		; compares AL to number 3
	JS START		; if the value of AL is less then 3, program jumps back to block "START"
		
MORE:
	MOV BL, [04]		; withdraws the value of register 04 to BL
	ADD BL, 3		; increments BL by 3
	MOV [04], BL		; saves the balue of BL to register 04
	JMP NEXT		; program jumps to block "NEXT"

DISPLAYandEND:
	MOV BL, [04]		; withdraws the value of register 04 to BL
	ADD BL,30		; increments BL by 30 to get hexadecimal value for the VDU (Visual Display Unit)
	MOV [C0], BL		; moves the value of BL to the first register of VDU (C0)
	END			; ends program
