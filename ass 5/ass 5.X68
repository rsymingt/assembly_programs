*-----------------------------------------------------------
* Title      :
* Written by :
* Date       :
* Description:
*-----------------------------------------------------------
    ORG    $7000
txt dc.w   1234

    ORG    $8000
    
main    link    a6,#0

    move.w  txt,-(sp)
    jsr     dis
    
    unlk    a6
    trap    #14
    
dis link    a6,#-4
    clr.l   d0
    move.w  8(a6),d0
    
    cmpi.w   #0,d0
    beq     end
    
    divs    #10,d0
    
    move.w  d0,-2(a6)
    clr.w   d0
    swap    d0
    move.w  d0,-4(a6)
    
    move.w  -2(a6),-(sp)
    jsr     dis
    
    move.w  -4(a6),d0
    add.b   #48,d0
    move.l  d0,d1   ;not needed on 68k
    move.l  #6,d0   ;not needed on 68k
    trap    #15     ;trap #1 prints whats in d0
    
    
end unlk    a6
    rts
    
    
; first instruction of program

* Put program code here

    SIMHALT             ; halt simulator

* Put variables and constants here

    END    main        ; last line of source

*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
