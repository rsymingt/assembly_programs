******************************************************
* TWOHZ.x68                                          *
*                                                    *
* This program uses the 68681 timer to create a 2 Hz *
* square wave on OP3.  If the 68681 X1 input is      *
* driven at 3.6864 MHz, then the frequency on OP3    *
* equals                                             *
*                                                    *
*       3686400 / 2 / 16 / COUNT                     *
*                                                    *
* where COUNT is the 16-bit integer in the timer     *
* registers CTUR and CTLR.  CTUR holds the upper     *
* byte, CTLR holds the lower byte.                   *
******************************************************
DUART    EQU      $00C001  ;68681 base address
ACR      EQU      4*2      ;auxiliary control reg.
CTUR     EQU      6*2      ;counter/timer upper reg.
CTLR     EQU      7*2      ;counter/timer lower reg.
OPCR     EQU      13*2     ;output port config. reg.
COUNT    EQU      14400	;2 Hz count (see above)
OPRS	EQU	$1C
OPRC	EQU	$1E
ISR	EQU	$A
STOP	EQU	$1E

         ORG      $8000
TWOHZ    MOVEA.L  #DUART,A0
         MOVE.L   #COUNT,D0
         MOVEP.W  D0,CTUR(A0)
         MOVE.B   #$70,ACR(A0)   ;crystal clock / 1
         

	MOVE.B	ISR(A0),D7
	ANDI.B	#8,D7
	BEQ	TWOHZ
	TST.B	STOP(A0)
	
	CMPI.B	#1,D1
	BEQ	OFF
	CMPI.B	#0,D1
	BEQ	ON

OFF	MOVE.B	#$FF,OPRC(A0)
	MOVE.B	#0,D1
	BRA	TWOHZ
ON	MOVE.B	#$FF,OPRS(A0)
	MOVE.B	#1,D1
         BRA      TWOHZ              ;now relax a bit
         END      TWOHZ