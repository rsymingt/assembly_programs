*L3_3: Sample program 3
	
	ORG	$8000

START   MOVE.W	W,D0
	MOVE.B	Y,D1
	MULS	D1,D0
	
	MOVE.W	X,D1
	DIVS	#3,D1

	ADD.L	D0,D1
	MOVE.L	D1,Z
	TRAP	#14		

	ORG	$9000
W	DC.W	10	
X	DC.W	6
Y	DC.B	15
Z	DS.L	1
		
	END	START
