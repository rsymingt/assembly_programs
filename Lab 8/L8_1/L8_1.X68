*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------

    ORG $9000
solvequad LINK A6,#0
    MOVE.W 8(A6),D0
    MOVE.W D0,D1
    MULS.W D0,D1
    MULS.W #5,D1
    
    ASL.W  #1,D0
    SUB.W  D0,D1
    ASR.W  #1,D0
    ADD.W  #6,D1
    
    UNLK   A6
    RTS
    
main LINK A6,#-2
    MOVE.W  #4,-2(A6)

    MOVE.W  -2(A6),-(A7)
    JSR     solvequad
    MOVE.W  D1,-2(A6)
    UNLK    A6
    RTS


    ORG    $8000
START:      
    JSR main
            ; first instruction of program

* Put program code here

    SIMHALT             ; halt simulator

* Put variables and constants here

    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
