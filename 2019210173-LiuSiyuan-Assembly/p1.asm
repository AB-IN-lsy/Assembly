;Author: NEFU AB_IN
;CSDN: https://blog.csdn.net/qq_45859188

.ORIG	X3000
START	LD	R0,Newline	; prepare
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
	OUT
	BRnzp	L1

L2 	LD	R0,Newline	; OUT \n
	OUT
	HALT

Newline .FILL 	x000A 
StuNumber	.STRINGZ	"2019210173 LiuSiyuan"
Prompt 		.STRINGZ	"AB_IN Please enter a string:"
	.END