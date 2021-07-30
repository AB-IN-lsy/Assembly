;Author: NEFU AB_IN
;CSDN: https://blog.csdn.net/qq_45859188

.ORIG	X3000
START	LD	R0,Newline	; prepare
	LD	R4,TMP		; init R4 value
	LEA	R1,STRING	; init R1 address
	OUT			; OUT \n
	
L0	LEA	R0,StuNumber 	; PUT StuNumber
	PUTS
	LD	R0,Newline	; OUT \n
	OUT
	LEA	R0,Prompt	; PUT Prompt
	PUTS

L1	GETC			; GET STRING
	LD	R2,Newline
	NOT	R2,R2
	ADD	R2,R2,#1
	ADD	R2,R0,R2
	BRz	L2
	STR 	R2,R1,#0	; Store STRING
	ADD	R1,R1,#1	; Address += 1
	ADD	R4,R4,#1	; cnt += 1

	LD	R3,TMP
	NOT	R3,R3
	ADD	R3,R3,#1	; R3 = -TMP
	ADD	R3,R3,R4	; R3 = R4 - TMP
	NOT	R3,R3
	ADD	R3,R3,#1
	ADD	R3,R3,#10
	BRp	LL

CHANGE	ADD	R4,R4,#-10
	AND	R5,R5,#0
	ADD	R5,R5,#1

LL	OUT
	BRnzp	L1


L2 	LD	R0,Newline	; OUT \n
	OUT

L3	LEA	R0,Prompt1	; PUT Prompt1
	PUTS
	
L4	AND	R0,R0,#0	; OUT R5
	ADD	R0,R0,R5	
	NOT	R5,R5
	ADD	R5,R5,#1
	ADD	R5,R5,#1
	BRnp	LOUT
	LD	R0,TMP
	ADD	R0,R0,#1
	OUT
LOUT	AND	R0,R0,#0	; OUT R4
	ADD	R0,R0,R4
	OUT	
	ADD	R5,R5,#0
	BRnp	ADDR4
	ADD	R4,R4,#10
ADDR4	LD	R0,Newline	; OUT \n
	OUT

L5	LD	R3,TMP
	NOT	R3,R3
	ADD	R3,R3,#1
	ADD	R4,R4,R3	; R4 = R4 - 0X30
	LEA	R1,STRING	; init R1 address
	ADD	R2,R1,R4
	ADD	R2,R2,#-1	; init R2 address

L6	LDR	R5,R1,#0	; R5=MEM[R1]
	LDR	R6,R2,#0	; R6=MEM[R2]
	NOT	R5,R5
	ADD	R5,R5,#1
	ADD	R5,R5,R6
	BRnp	F
	ADD	R1,R1,#1	; Address += 1
	ADD	R2,R2,#-1	; Address -= 1
	ADD	R5,R2,#0	; init R5 = R2
	NOT	R5,R5
	ADD	R5,R5,#1
	ADD	R5,R5,R2
	BRzp	T
	BRnzp 	L6

T	LEA	R0,TRUE		; PUT TRUE
	PUTS
	BRnzp	FINAL

F	LEA	R0,FALSE	; PUT FALSE
	PUTS
	BRnzp	FINAL
	

FINAL 	LD	R0,Newline	; OUT \n
	OUT
	HALT

STRING	.BLKW	19
TMP	.FILL	x0030
Newline .FILL 	x000A 
StuNumber	.STRINGZ	"2019210173 LiuSiyuan"
Prompt 		.STRINGZ	"AB_IN Please enter a string:"
Prompt1 	.STRINGZ	"The number of characters in thr AB_IN's input is:"
TRUE 		.STRINGZ	"AB_IN says The input string is a palindrome."
FALSE		.STRINGZ	"AB_IN says The input string is not a palindrome."
	.END