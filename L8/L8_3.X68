*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG     $9000
X   DC.W    2
Y   DC.W    2
Z   DC.W    2
W   DS.W    1

    ORG    $8000
START: 
    PEA X
    PEA Y
    PEA Z
    PEA W
    JSR QUAD
    TRAP    #14

QUAD    LINK    A6,#0
    MOVEM.W D0-D3/A0-A3,-(SP)
    
    MOVE.L  20(A6),A0
    MOVE.L  16(A6),A1
    MOVE.L  12(A6),A2
    MOVE.L  8(A6),A3
    
    MOVE.W  (A0),d0
    MOVE.W  (A1),d1
    MOVE.W  (A2),d2
    
    MULS.W  (A0),D0
    MULS.W  #5,D0
    
    MULS.W  (A1),D1
    MULS.W  #4,D1
    
    MOVE.W  D0,D3
    
    SUB.W   D1,D3
    
    MULS.W  (A2),D2
    
    ADD.W   D2,D3
    
    MOVE.W  D3,A3
    
    MOVEM.W (SP)+,D0-D3/A0-A3
    UNLK    A6
    RTS
    
    SIMHALT             ; halt simulator

* Put variables and constants here

    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
