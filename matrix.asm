test	START	0

main
	LDX	#0
	LDT	#50	.the length of the string
	JSUB	print	.print enter the first matrix
	JSUB	nl

	LDX	#0
	LDT	#10
	JSUB	clrns	.clear the data in ns

	LDX	#0
	JSUB	inputns	.read the number as string and store in ns
	LDT	#0
	LDX	#0
	LDA	#48
	JSUB	stn	.convert ns to int
	STT	n1

	LDX	#0
	LDT	#10
	JSUB	clrns

	LDX	#0
	JSUB	inputns
	LDT	#0
	LDX	#0
	LDA	#48
	JSUB	stn
	STT 	n2

	LDX	#0
	LDT	#10
	JSUB	clrns

	LDX	#0
	JSUB	inputns
	LDT	#0
	LDX	#0
	LDA	#48
	JSUB	stn
	STT	n3

	LDX	#0
	LDT	#10
	JSUB	clrns

	LDX	#0
	JSUB	inputns
	LDT	#0
	LDX	#0
	LDA	#48
	JSUB	stn
	STT 	n4

	LDX	#0
	LDT	#10
	JSUB	clrns

	LDA	n1
	LDT	#0
	COMPR	A, T
	JEQ	c1

	LDX	#0
	LDT	#51	.the length of the string
	JSUB	print2	.print enter the second matrix
	JSUB	nl

	LDX	#0
	LDT	#10
	JSUB	clrns	.clear the data in ns

	LDX	#0
	JSUB	inputns	.read the number and store in ns
	LDT	#0
	LDX	#0
	LDA	#48
	JSUB	stn	.convert ns to int
	STT	n5

	LDX	#0
	LDT	#10
	JSUB	clrns

	LDX	#0
	JSUB	inputns
	LDT	#0
	LDX	#0
	LDA	#48
	JSUB	stn
	STT	n6

	LDX	#0
	LDT	#10
	JSUB	clrns

	LDX	#0
	JSUB	inputns
	LDT	#0
	LDX	#0
	LDA	#48
	JSUB	stn
	STT 	n7

	LDX	#0
	LDT	#10
	JSUB	clrns

	LDX	#0
	JSUB	inputns
	LDT	#0
	LDX	#0
	LDA	#48
	JSUB	stn
	STT	n8

	LDA	n5
	LDT	#0
	COMPR	A, T
	JEQ	c4

	LDX	#0
	LDT	#10
	JSUB	clrns

	JSUB	matrixMUL
c1
	LDA	n1
	LDT	n2
	COMPR	A,T
	JEQ	c2
c2
	LDA	n2
	LDT	n3
	COMPR	A,T
	JEQ	c3
c3
	LDA	n3
	LDT	n4
	COMPR	A,T
	JEQ	exit
c4
	LDA	n5
	LDT	n6
	COMPR	A,T
	JEQ	c5
c5
	LDA	n6
	LDT	n7
	COMPR	A,T
	JEQ	c6
c6
	LDA	n7
	LDT	n8
	COMPR	A,T
	JEQ	exit
exit
	LDX	#0
	LDT	#28
	JSUB	print4
	J	halt

f1
	LDA	a1
	STA	tmp

	JSUB	nl

	LDX	#0
	LDT	#21	.the length of the string
	JSUB	print3
	JSUB	nl

	LDX	#0
	LDT	#10
	JSUB	clrns
	
	LDX	#0
	LDA	tmp
	JSUB	nts
f2
	JSUB	printns
f3
	LDA	a2
	STA	tmp
	JSUB	nl
	LDX	#0
	LDT	#7	.the length of the string

	LDX	#0
	LDA	a2
	JSUB	nts2
f4
	JSUB	printns2
f5
	LDA	a3
	STA	tmp
	JSUB	nl
	LDX	#0
	LDT	#7	.the length of the string

	LDX	#0
	LDA	a3
	JSUB	nts3
f6
	JSUB	printns3
f7
	LDA	a4
	STA	tmp
	JSUB	nl
	LDX	#0
	LDT	#7	.the length of the string

	LDX	#0
	LDA	a4
	JSUB	nts4
f8
	JSUB	printns4
f9
	JSUB	nl
	JSUB	nl
	J	main


nl			.print new line
	TD	strout
	JEQ	nl
	LDCH	newline
	WD	strout
	RSUB

print
	TD	strout
	JEQ	print
	LDCH	str1, X
	WD	strout
	TIXR	T
	JLT	print

	RSUB

print2
	TD	strout
	JEQ	print2
	LDCH	str2, X
	WD	strout
	TIXR	T
	JLT	print2

	RSUB

print3			.print new matrix
	TD	strout
	JEQ	print3
	LDCH	str3, X
	WD	strout
	TIXR	T
	JLT	print3
	RSUB

print4			.exit
	TD	strout
	JEQ	print4
	LDCH	str4, X
	WD	strout
	TIXR	T
	JLT	print4
	RSUB

inputns			.read the number and store in ns
	TD	strin
	JEQ	inputns
	RD	strin
	STCH	ns, X
	LDT	#1
	ADDR	T, X
	LDT	#10
	COMPR	T, A
	JLT	inputns
	RSUB

clrns			.clear the data in ns
	LDCH	space
	STCH	ns, X
	TIXR	T
	JLT	clrns
	RSUB

stn			.convert ns to int and store in n
	SUB	#48
	LDS	#10
	MULR	S, T
	ADDR	A, T
	LDCH	ns, X
	LDS	#1
	ADDR	S, X
	COMP	#32
	JGT	stn
	RSUB

matrixMUL
	LDA	n1
	LDB	n2
	LDT	n5
	LDS	n7
	MULR	T, A
	MULR	S, B
	ADDR	B, A
	STA	a1

	LDA	n1
	LDB	n2
	LDT	n6
	LDS	n8
	MULR	T, A
	MULR	S, B
	ADDR	B, A
	STA	a2

	LDA	n3
	LDB	n4
	LDT	n5
	LDS	n7
	MULR	T, A
	MULR	S, B
	ADDR	B, A
	STA	a3

	LDA	n3
	LDB	n4
	LDT	n6
	LDS	n8
	MULR	T, A
	MULR	S, B
	ADDR	B, A
	STA	a4

	J	f1
mod10
	SUB	#10
	COMP	#10
	JGT	mod10
	JEQ	mod10
	COMP	#0
	JLT	p10
	RSUB

p10			.plus 10
	ADD	#10
	RSUB

nts			.convert number to string
	STA	tmp
	JSUB	mod10
	ADD	#48
	STCH	ns, X
	LDT	#1
	ADDR	T, X
	LDA	tmp
	DIV	#10
	COMP	#0
	JGT	nts
	J	f2

nts2			.convert number to string
	STA	tmp
	JSUB	mod10
	ADD	#48
	STCH	ns, X
	LDT	#1
	ADDR	T, X
	LDA	tmp
	DIV	#10
	COMP	#0
	JGT	nts2
	J	f4
nts3			.convert number to string
	STA	tmp
	JSUB	mod10
	ADD	#48
	STCH	ns, X
	LDT	#1
	ADDR	T, X
	LDA	tmp
	DIV	#10
	COMP	#0
	JGT	nts3
	J	f6
nts4			.convert number to string
	STA	tmp
	JSUB	mod10
	ADD	#48
	STCH	ns, X
	LDT	#1
	ADDR	T, X
	LDA	tmp
	DIV	#10
	COMP	#0
	JGT	nts4
	J	f8

printns			.print ns
	TD	strout
	JEQ	printns
	LDCH	ns, X
	WD	strout
	LDT	#1
	SUBR	T, X
	LDT	#0
	COMPR	T, X
	JLT	printns
	JEQ	printns
	J	f3

printns2			.print ns
	TD	strout
	JEQ	printns2
	LDCH	ns, X
	WD	strout
	LDT	#1
	SUBR	T, X
	LDT	#0
	COMPR	T, X
	JLT	printns2
	JEQ	printns2
	J	f5
printns3			.print ns
	TD	strout
	JEQ	printns3
	LDCH	ns, X
	WD	strout
	LDT	#1
	SUBR	T, X
	LDT	#0
	COMPR	T, X
	JLT	printns3
	JEQ	printns3
	J	f7
printns4			.print ns
	TD	strout
	JEQ	printns4
	LDCH	ns, X
	WD	strout
	LDT	#1
	SUBR	T, X
	LDT	#0
	COMPR	T, X
	JLT	printns4
	JEQ	printns4
	J	f9

halt	J	halt

str1	BYTE	C'input the first matrix(input Zero Matrix to exit):'
str2	BYTE	C'input the second matrix(input Zero Matrix to exit):'
str3	BYTE	C'The final matrix is :'
str4	BYTE	C'Leaving requirement approved'

ns	RESB	10	.store the first number as string

tmp	WORD	0

n1	WORD	0
n2	WORD	0
n3	WORD	0
n4	WORD	0
n5	WORD	0
n6	WORD	0
n7	WORD	0
n8	WORD	0

a1	WORD    0
a2	WORD    0
a3	WORD    0
a4	WORD    0

newline	BYTE	10
space	BYTE	32
strin	BYTE	0
strout	BYTE	1
