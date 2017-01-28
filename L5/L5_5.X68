	ORG	$8000
START   MOVE.W  num1,D0
        
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
end     MOVE.W	biggest,D1
	TRAP    #14


        ORG     $9000
num1    DC.W    -5
num2    DC.W    -10
num3    DC.W    5
biggest DS.W    1

	END	START