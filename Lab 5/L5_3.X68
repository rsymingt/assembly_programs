*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $8000
START:                  ; first instruction of program

* Put program code here
    
            MOVE.B  hexval,D0
            ADD.B   #$30,D0
            MOVE.B  D0,charcode
            
            MOVE.B  charcode,D0
            CMPI    #$39,D0
            
            BLS     end
            ADD.B   #$7,charcode
           
            MOVE.B  charcode,D0
end         TRAP    #14

            ORG     $9000
hexval      DC.B    $0A
charcode    DS.B    1 

    SIMHALT             ; halt simulator

* Put variables and constants here

    END    START        ; last line of source


*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
