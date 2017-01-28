*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    
    ORG $9000
adder LINK  A6,#0
    MOVE.W  8(A6),D0
    ADD.W   10(A6),D0
    UNLK    A6
    RTS
    
main LINK   A6,#-6
    MOVE.W  #1,-2(A6)
    MOVE.W  #2,-4(A6)
    
    MOVE.W  -4(A6),-(A7)
    MOVE.W  -2(A6),-(A7)
    JSR     adder
    MOVE.W  D0,-6(A6)
    LEA 4(A7),A7
    UNLK    A6
    RTS
    
    ORG $8000
START:
    JSR main


    SIMHALT             ; halt simulator

* Put variables and constants here

    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
