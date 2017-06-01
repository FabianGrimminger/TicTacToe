mov B, #03h ; id for Player 1, Player 2 would be 4
JMP DISPLAY

RESET: ; reset storage for selected fields
mov 0x18, #00h
mov 0x19, #00h
mov 0x1A, #00h
mov 0x20, #00h
mov 0x21, #00h
mov 0x22, #00h
mov 0x28, #00h
mov 0x29, #00h
mov 0x2A, #00h
mov B, #03h
JMP DISPLAY

PLAYER1: ; Player 1 wins, stay in this loop until "reset" is klicked
CLR P2.3
JNB P3.3, RESET
JMP PLAYER1

PLAYER2: ; Player 2 wins, stay in this loop until "reset" is klicked
CLR P2.3
JNB P3.3, RESET
JMP PLAYER2

DISPLAY:
CALL SHOW
; check first row
mov A,	0x18
ADD A,	0x19
ADD A, 	0x1A
SUBB A,	#09h
JZ PLAYER1
SUBB A, #03h
JZ PLAYER2

; check second row
mov A,	0x20
ADD A,	0x21
ADD A, 	0x22
SUBB A,	#09h
JZ PLAYER1
SUBB A, #03h
JZ PLAYER2

; check third row
mov A,	0x28
ADD A,	0x29
ADD A, 	0x2A
SUBB A,	#09h
JZ PLAYER1
SUBB A, #03h
JZ PLAYER2

; check first column
mov A,	0x18
ADD A,	0x20
ADD A, 	0x28
SUBB A,	#09h
JZ PLAYER1
SUBB A, #03h
JZ PLAYER2

; check second column
mov A,	0x19
ADD A,	0x21
ADD A, 	0x29
SUBB A,	#09h
JZ PLAYER1
SUBB A, #03h
JZ PLAYER2

; check third column
mov A,	0x1A
ADD A,	0x22
ADD A, 	0x2A
SUBB A,	#09h
JZ PLAYER1
SUBB A, #03h
JZ PLAYER2

; check left-to-right diagonal
mov A,	0x18
ADD A,	0x21
ADD A, 	0x2A
SUBB A,	#09h
JZ PLAYER1
SUBB A, #03h
JZ PLAYER2

; check right-to-left diagonal
mov A,	0x1A
ADD A,	0x21
ADD A, 	0x28
SUBB A,	#09h
JZ PLAYER1
SUBB A, #03h
JZ PLAYER2

mov P0, #11011011b ;set column 2 and 5 to 0
mov P1, #00h ; set all rows to 0 -> now column 2 and 5 light up
mov P1, #11011011b ; set row C and F to 0
mov P0, #00h ; set all columns to 0 -> now row C and F light up

mov P2, #0FFh ; P2 as input set all to 1
mov P3, #0FFh ; P3 as input set all to 1
;check all buttons
;buttons as radio buttons, only one can be set
clr P2.0 ;check row A
jnb P3.0,ONE ; check 0
jnb P3.1,TWO ; check 1
jnb P3.2,THREE; check 2
mov P2, #0FFh ; set all rows to 1

clr P2.1 ;check row B
jnb P3.0,FOUR ; check 0
jnb P3.1,FIVE ; check 1
jnb P3.2,SIX; check 2
mov P2, #0FFh ; set all rows to 1

clr P2.2 ;check row C
jnb P3.0,SEVEN ; check 0
jnb P3.1,EIGHT ; check 1
jnb P3.2,NINE; check 2
mov P2, #0FFh ; set all rows to 1

jmp DISPLAY

BACK: ;because a jump to display is too long...
jmp DISPLAY

ONE:
MOV A, 0x18 ;get actual stored value
JNZ BACK ; if value != 0 jump
mov 0x18,B ; store B (Player value)
;change player value with xor
mov A,#07h ; load 7 to acc
xrl A,B ; xor A B -> 7 xor 3 = 4, 7 xor 4 = 3
mov B,A ; store new player value in B
JMP BACK ; jump 
TWO:
MOV A, 0x19 ;get actual stored value
JNZ BACK ; if value != 0 jump
mov 0x19,B ; store B (Player value)
;change player value with xor
mov A,#07h ; load 7 to acc
xrl A,B ; xor A B -> 7 xor 3 = 4, 7 xor 4 = 3
mov B,A ; store new player value in B
JMP BACK ; jump 
THREE:
MOV A, 0x1A ;get actual stored value
JNZ BACK ; if value != 0 jump
mov 0x1A,B ; store B (Player value)
;change player value with xor
mov A,#07h ; load 7 to acc
xrl A,B ; xor A B -> 7 xor 3 = 4, 7 xor 4 = 3
mov B,A ; store new player value in B
JMP BACK ; jump 
FOUR:
MOV A, 0x20 ;get actual stored value
JNZ BACK ; if value != 0 jump
mov 0x20,B ; store B (Player value)
;change player value with xor
mov A,#07h ; load 7 to acc
xrl A,B ; xor A B -> 7 xor 3 = 4, 7 xor 4 = 3
mov B,A ; store new player value in B
JMP BACK ; jump 
FIVE:
MOV A, 0x21 ;get actual stored value
JNZ BACK ; if value != 0 jump
mov 0x21,B ; store B (Player value)
;change player value with xor
mov A,#07h ; load 7 to acc
xrl A,B ; xor A B -> 7 xor 3 = 4, 7 xor 4 = 3
mov B,A ; store new player value in B
JMP BACK ; jump 
SIX:
MOV A, 0x22 ;get actual stored value
JNZ BACK ; if value != 0 jump
mov 0x22,B ; store B (Player value)
;change player value with xor
mov A,#07h ; load 7 to acc
xrl A,B ; xor A B -> 7 xor 3 = 4, 7 xor 4 = 3
mov B,A ; store new player value in B
JMP BACK ; jump 
SEVEN:
MOV A, 0x28 ;get actual stored value
JNZ BACK ; if value != 0 jump
mov 0x28,B ; store B (Player value)
;change player value with xor
mov A,#07h ; load 7 to acc
xrl A,B ; xor A B -> 7 xor 3 = 4, 7 xor 4 = 3
mov B,A ; store new player value in B
JMP BACK ; jump 
EIGHT:
MOV A, 0x29 ;get actual stored value
JNZ BACK ; if value != 0 jump
mov 0x29,B ; store B (Player value)
;change player value with xor
mov A,#07h ; load 7 to acc
xrl A,B ; xor A B -> 7 xor 3 = 4, 7 xor 4 = 3
mov B,A ; store new player value in B
JMP BACK ; jump 
NINE:
MOV A, 0x2A ;get actual stored value
JNZ BACK ; if value != 0 jump
mov 0x2A,B ; store B (Player value)
;change player value with xor
mov A,#07h ; load 7 to acc
xrl A,B ; xor A B -> 7 xor 3 = 4, 7 xor 4 = 3
mov B,A ; store new player value in B
JMP BACK ; jump

SHOW:
;check if storage is selected and display player icon
mov A, 0x18	
SUBB A, #03h
JNZ $+10		;if !=0 jump over next 3 lines
mov P0, #00111111b	;else display player1 icon
mov P1, #01111111b
jmp $+12		; jump over next 4 lines
SUBB A, #01h
JNZ $+8			;if != 0 jump over next 2 lines
mov P0, #01111111b	; else display player2 icon
mov P1, #00111111b
;reset view
mov P0, #0FFh
mov P1, #0FFh

;next 8 blocks have the same logic just for the other parts of the storage
mov A, 0x19
SUBB A, #03h
JNZ $+10
mov P0, #11100111b
mov P1, #01111111b
jmp $+12
SUBB A, #01h
JNZ $+8
mov P0, #11101111b
mov P1, #00111111b
;reset view
mov P0, #0FFh
mov P1, #0FFh

mov A, 0x1A
SUBB A, #03h
JNZ $+10
mov P0, #11111100b
mov P1, #01111111b
jmp $+12
SUBB A, #01h
JNZ $+8
mov P0, #11111101b
mov P1, #00111111b
;reset view
mov P0, #0FFh
mov P1, #0FFh

mov A, 0x20
SUBB A, #03h
JNZ $+10
mov P0, #00111111b
mov P1, #11101111b
jmp $+12
SUBB A, #01h
JNZ $+8
mov P0, #01111111b
mov P1, #11100111b
;reset view
mov P0, #0FFh
mov P1, #0FFh

mov A, 0x21
SUBB A, #03h
JNZ $+10
mov P0, #11100111b
mov P1, #11101111b
jmp $+12
SUBB A, #01h
JNZ $+8
mov P0, #11101111b
mov P1, #11100111b
;reset view
mov P0, #0FFh
mov P1, #0FFh

mov A, 0x22
SUBB A, #03h
JNZ $+10
mov P0, #11111100b
mov P1, #11101111b
jmp $+12
SUBB A, #01h
JNZ $+8
mov P0, #11111101b
mov P1, #11100111b
;reset view
mov P0, #0FFh
mov P1, #0FFh

mov A, 0x28
SUBB A, #03h
JNZ $+10
mov P0, #00111111b
mov P1, #11111101b
jmp $+12
SUBB A, #01h
JNZ $+8
mov P0, #01111111b
mov P1, #11111100b
;reset view
mov P0, #0FFh
mov P1, #0FFh

mov A, 0x29
SUBB A, #03h
JNZ $+10
mov P0, #11100111b
mov P1, #11111101b
jmp $+12
SUBB A, #01h
JNZ $+8
mov P0, #11101111b
mov P1, #11111100b
;reset view
mov P0, #0FFh
mov P1, #0FFh

mov A, 0x2A
SUBB A, #03h
JNZ $+10
mov P0, #11111100b
mov P1, #11111101b
jmp $+12
SUBB A, #01h
JNZ $+8
mov P0, #11111101b
mov P1, #11111100b
;reset view
mov P0, #0FFh
mov P1, #0FFh

RET