	ORG $8000

START MOVE.W  #4,D0
    JSR     solvequad
    TRAP    #14

solvequad LINK A6,#0
    MOVE.W D0,D1
    MULS.W D0,D1
    MULS.W #5,D1
    
    ASL.W  #1,D0
    SUB.W  D0,D1
    ASR.W  #1,D0
    ADD.W  #6,D1
    
    UNLK   A6
    RTS

    END    	START
*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
