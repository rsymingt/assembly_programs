*L3_3: Sample program 3
	

	ORG	$8000

START   
    MOVE.W	W,D0
	MOVE.B	W+4,D1
	MULS	D1,D0
	
	MOVE.W	W+2,D1
	DIVS	#3,D1

	ADD.L	D0,D1
	MOVE.L	D1,W+6
	TRAP	#14		

	ORG	$9000
W	DC.W	3	
	DC.W	5
	DC.B	12
	DS.L	1
		
	END	START

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
