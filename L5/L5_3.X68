	    ORG	    $8000
    
START       MOVE.B  hexval,D0
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

            END     START