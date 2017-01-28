	ORG	$8000
START	LEA	$7500,A6
	JSR 	main
	TRAP	#14 

    ORG $9000
solvequad LINK A6,#0
    MULS.W  12(A6),D0
    MULS.W  #5,D0
    
    MULS.W  12(A6),D1
    MULS.W  #2,D1
    
    SUB.W   D1,D0
    
    MULS.W  8(A6),D2
    
    ADD.W   D2,D0
    
    MOVE.W  D0,D1
    
    UNLK   A6
    RTS
    
main LINK A6,#0
    MOVE.W  #4,D0
    MOVE.W  #5,D1
    MOVE.W  #10,D2
    
    MOVE.W  D0,-(A7)
    MOVE.W  D1,-(A7)
    MOVE.W  D2,-(A7)
    JSR     solvequad
    UNLK    A6
    TRAP    #14

    END    main