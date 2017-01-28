*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $8000
START:                  ; first instruction of program

    MOVE.W #$20,D0
    MOVE.W #$5,D1
    
LOOP ROR.W #1,D1
     
     BCC SKIP
     ADD.W D0,D2
SKIP ROL.W #1,D1


    ASL.W #1,D0
     ASR.W #1,D1
    
    
     CMPI.W #1,D1
     BNE     LOOP
     
     ROR.W #1,D1
     
     BCC SKIP2
     ADD.W D0,D2
SKIP2 ROL.W #1,D1
    TRAP #14

    ORG     $9000
sum DS.L    0

* Put program code here

    SIMHALT             ; halt simulator

* Put variables and constants here

    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
