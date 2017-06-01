mov B, #03h ; id for Player 1, Player 2 would be 4
JMP DISPLAY

RESET: ; reset storage for selected fields
mov 0x00, #00h
mov 0x01, #00h
mov 0x02, #00h
mov 0x08, #00h
mov 0x09, #00h
mov 0x0A, #00h
mov 0x10, #00h
mov 0x11, #00h
mov 0x12, #00h
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
mov A,	0x00
ADD A,	0x01
ADD A, 	0x02
SUBB A,	#09h
JZ PLAYER1
SUBB A, #03h
JZ PLAYER2

; check second row
mov A,	0x08
ADD A,	0x09
ADD A, 	0x0A
SUBB A,	#09h
JZ PLAYER1
SUBB A, #03h
JZ PLAYER2

; check third row
mov A,	0x10
ADD A,	0x11
ADD A, 	0x12
SUBB A,	#09h
JZ PLAYER1
SUBB A, #03h
JZ PLAYER2

; check first column
mov A,	0x00
ADD A,	0x08
ADD A, 	0x10
SUBB A,	#09h
JZ PLAYER1
SUBB A, #03h
JZ PLAYER2

; check second column
mov A,	0x01
ADD A,	0x09
ADD A, 	0x11
SUBB A,	#09h
JZ PLAYER1
SUBB A, #03h
JZ PLAYER2

; check third column
mov A,	0x02
ADD A,	0x0A
ADD A, 	0x12
SUBB A,	#09h
JZ PLAYER1
SUBB A, #03h
JZ PLAYER2

; check left-to-right diagonal
mov A,	0x00
ADD A,	0x09
ADD A, 	0x12
SUBB A,	#09h
JZ PLAYER1
SUBB A, #03h
JZ PLAYER2

; check right-to-left diagonal
mov A,	0x02
ADD A,	0x09
ADD A, 	0x10
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
MOV A, 0x00 ;get actual stored value
JNZ BACK ; if value != 0 jump
mov 0x00,B ; store B (Player value)
;change player value with xor
mov A,#07h ; load 7 to acc
xrl A,B ; xor A B -> 7 xor 3 = 4, 7 xor 4 = 3
mov B,A ; store new player value in B
JMP BACK ; jump 
TWO:
MOV A, 0x01 ;get actual stored value
JNZ BACK ; if value != 0 jump
mov 0x01,B ; store B (Player value)
;change player value with xor
mov A,#07h ; load 7 to acc
xrl A,B ; xor A B -> 7 xor 3 = 4, 7 xor 4 = 3
mov B,A ; store new player value in B
JMP BACK ; jump 
THREE:
MOV A, 0x02 ;get actual stored value
JNZ BACK ; if value != 0 jump
mov 0x02,B ; store B (Player value)
;change player value with xor
mov A,#07h ; load 7 to acc
xrl A,B ; xor A B -> 7 xor 3 = 4, 7 xor 4 = 3
mov B,A ; store new player value in B
JMP BACK ; jump 
FOUR:
MOV A, 0x08 ;get actual stored value
JNZ BACK ; if value != 0 jump
mov 0x08,B ; store B (Player value)
;change player value with xor
mov A,#07h ; load 7 to acc
xrl A,B ; xor A B -> 7 xor 3 = 4, 7 xor 4 = 3
mov B,A ; store new player value in B
JMP BACK ; jump 
FIVE:
MOV A, 0x09 ;get actual stored value
JNZ BACK ; if value != 0 jump
mov 0x09,B ; store B (Player value)
;change player value with xor
mov A,#07h ; load 7 to acc
xrl A,B ; xor A B -> 7 xor 3 = 4, 7 xor 4 = 3
mov B,A ; store new player value in B
JMP BACK ; jump 
SIX:
MOV A, 0x0A ;get actual stored value
JNZ BACK ; if value != 0 jump
mov 0x0A,B ; store B (Player value)
;change player value with xor
mov A,#07h ; load 7 to acc
xrl A,B ; xor A B -> 7 xor 3 = 4, 7 xor 4 = 3
mov B,A ; store new player value in B
JMP BACK ; jump 
SEVEN:
MOV A, 0x10 ;get actual stored value
JNZ BACK ; if value != 0 jump
mov 0x10,B ; store B (Player value)
;change player value with xor
mov A,#07h ; load 7 to acc
xrl A,B ; xor A B -> 7 xor 3 = 4, 7 xor 4 = 3
mov B,A ; store new player value in B
JMP BACK ; jump 
EIGHT:
MOV A, 0x11 ;get actual stored value
JNZ BACK ; if value != 0 jump
mov 0x11,B ; store B (Player value)
;change player value with xor
mov A,#07h ; load 7 to acc
xrl A,B ; xor A B -> 7 xor 3 = 4, 7 xor 4 = 3
mov B,A ; store new player value in B
JMP BACK ; jump 
NINE:
MOV A, 0x12 ;get actual stored value
JNZ BACK ; if value != 0 jump
mov 0x12,B ; store B (Player value)
;change player value with xor
mov A,#07h ; load 7 to acc
xrl A,B ; xor A B -> 7 xor 3 = 4, 7 xor 4 = 3
mov B,A ; store new player value in B
JMP BACK ; jump

SHOW:
mov A, 0x00
SUBB A, #03h
JNZ $+8
mov P0, #00111111b
mov P1, #01111111b
SUBB A, #01h
JNZ $+8
mov P0, #01111111b
mov P1, #00111111b
RET