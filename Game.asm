
DISPLAY:
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

mov A, P2
mov B, P3
jmp DISPLAY

ONE:
JMP DISPLAY
TWO:
JMP DISPLAY
THREE:
JMP DISPLAY
FOUR:
JMP DISPLAY
FIVE:
JMP DISPLAY
SIX:
JMP DISPLAY
SEVEN:
JMP DISPLAY
EIGHT:
JMP DISPLAY
NINE:
JMP DISPLAY
