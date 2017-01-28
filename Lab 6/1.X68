*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $8000
START:                  ; first instruction of program

* Put program code here

        MOVEA.L #ARRAY,A0

        MOVE.B #0,D0
    
LOOP1   CMPI.B #2,D0
        BGT    EXIT
    
        MOVE.B #1,D1
        ADD.B  D0,D1
LOOP2   CMPI   #3,D1
        BGT    LEND
    
        MOVE.W D0,D2
        MULU.W #4,D2
        ADD.W  D1,D2 ;stores location of matrix[i][j]
        
        MOVE.B (A0,D2),TEMP ;stores matrix[i][j] in temp
        
        MOVE.W D1,D3
        MULU.W #4,D3
        ADD.W  D0,D3 ;stores location of matrix[j][i]
        
        MOVE.B (A0,D3),(A0,D2) ;puts value at matrix[j][i] int matrix[i][j]
        MOVE.B TEMP,(A0,D3) ;puts temp into matrix[j][i]
    
        ADD.B #1,D1
        BRA LOOP2
LEND    ADD.B #1,D0
        BRA LOOP1
        
EXIT    TRAP #14

    ORG $9000
ARRAY DC.B 1,2,3,4
    DC.B 5,6,7,8
    DC.B 9,10,11,12
    DC.B 13,14,15,16
TEMP DS.B 1

    SIMHALT             ; halt simulator

* Put variables and constants here

    END    START        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
