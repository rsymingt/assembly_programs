*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG     $8000
X   DC.W    2
Y   DC.W    2
Z   DS.W    1

    ORG    $9000
START    MOVE.W  X,-(SP)
    MOVE.W  Y,-(SP)
    PEA Z
    JSR QUAD
    TRAP    #14

QUAD    LINK    A6,#0
    MOVEM.W D0-D3/A0,-(SP)
    
    MOVEA.L 8(A6),A0
    
    MOVE.W  12(A6),D0
    MOVE.W  14(A6),D1
    MOVE.W  12(A6),D2
    
    MULS.W  12(A6),D0
    MULS.W  14(A6),D1
    
    MULS.W  14(A6),D2
    MULS.W  #2,D2
    
    MOVE.W  D0,D3
    ADD.W   D1,D3
    ADD.W   D2,D3

    MOVE.W  D3,(A0)    
    
    MOVEM.W (SP)+,D0-D3/A0
    UNLK    A6
    RTS

* Put variables and constants here

    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
