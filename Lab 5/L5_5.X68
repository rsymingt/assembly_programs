*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $8000
START:                  ; first instruction of program

* Put program code here

        MOVE.W  num1,D0
        
        CMP.W   num2,D0
        BLT     check2
        CMP.W   num3,D0
        BLT     check2
        MOVE.W  num1,biggest
        BRA     end
        
check2  MOVE.W  num2,D0
        CMP.W   num3,D0
        BLT     else
        MOVE.W  num2,biggest
        BRA     end
        
else    MOVE.W  num3,biggest
end     TRAP    #14


        ORG     $9000
num1    DC.W    $156
num2    DC.W    $200
num3    DC.W    -$100
biggest DS.W    1

    SIMHALT             ; halt simulator

* Put variables and constants here

    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
