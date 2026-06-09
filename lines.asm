        icl 'equates.asm'
        icl 'routines.asm'

        org $2000

        .proc main
    
        ;=============================================================
        ; print a string example
        ;
        ;mva #1 csrhinh                  ; hide the cursor
        ;mva #6 rowcrs                   ; set output row
        ;mva #10 colcrs                  ; set output column
        
        ;mva #<string1 strptr_lo         ; low byte of string1 address
        ;mva #>string1 strptr_hi         ; high byte o f string1 address
        ;jsr print_string                ; print the string

        ;jmp stop                        ; stop is inside routines.asm
        ;=============================================================

;======================================================
; draw pixels example
;======================================================

        jsr openGR8

        jsr clearScreen

        ; set up parameters
        mva #0    x1        ; start X low byte
        mva #0    x1_hi     ; start X high byte
        mva #96   y1        ; start Y
        mva #$3F  x2        ; end X low byte
        mva #$01  x2_hi     ; end X high byte
        mva #96   y2        ; end Y
    
        jsr drawLine


halt:
        jsr fightAttract
        jmp halt


        .endp

;===================================================================
; Data section
;===================================================================
        ;.local string1
        ;.byte 'HELLO FROM STRING ONE!',0
        ;.endl


        run main