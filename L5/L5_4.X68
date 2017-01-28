	ORG	$8000
START   MOVE.W  num1,D0
        CMP     num2,D0
        BLT     else
        
        CMP     num3,D0
        BLT     else2
        MOVE.W  num1,biggest
        BRA     end
else2   MOVE.W  num3,biggest
        BRA     end

else    MOVE.W  num2,D0
        CMP     num3,D0
        BLT     else3
        MOVE.W  num2,biggest
        BRA     end
else3   MOVE.W  num3,biggest
end     TRAP    #14
            
        ORG     $9000
num1    DC.W    0
num2    DC.W    10
num3    DC.W    5
biggest DS.W    1

	END	START