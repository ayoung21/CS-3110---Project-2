; do not delete this code; it is required to run the program.
; 10 SYS (2064)

*=$0801

        BYTE    $0E, $08, $0A, $00, $9E, $20, $28,  $32, $30, $36, $34, $29, $00, $00, $00



; program entrance
*=$0810
PROGRAM_START
; start your code here        

; copy sprite data
        LDX #64
sprite_loop
        LDA ANT_DATA,X
        STA $2E80,X
        DEX
        BNE sprite_loop

; set sprite pointers
        LDX #8
        LDA #$2E80/64
sprite_pointer_loop
        STA $07F8,X
        DEX
        BNE sprite_pointer_loop

; set sprite colors
        LDX #8
        LDY #0
sprite_colors
        TXA
        STA $D027,Y
        INY
        DEX
        BNE sprite_colors

; set sprite x locations
        LDX #16
        LDA #100
x_locations
        STA $D000,X-2
        DEX
        BNE x_locations

; set sprite y locations
        LDX #8
        LDY #0
        LDA #50
y_locations
        STA $D001,Y
        ADC #25
        INY
        INY
        DEX
        BNE y_locations

; show sprites
        LDA #$00FF
        STA $D015

; do not write code past this line
; the following rts instruction is required to exit the program
        rts

; pixel data for the ant data
ANT_DATA
        BYTE $00,$00,$00
        BYTE $00,$00,$00
        BYTE $00,$00,$00
        BYTE $00,$00,$01
        BYTE $00,$00,$61
        BYTE $00,$00,$11
        BYTE $00,$00,$0E
        BYTE $00,$00,$1F
        BYTE $00,$00,$1F
        BYTE $0F,$1F,$B5
        BYTE $10,$A0,$7F
        BYTE $2F,$CF,$DF
        BYTE $5F,$DF,$BF
        BYTE $5F,$DF,$BA
        BYTE $BF,$DF,$A9
        BYTE $BF,$BF,$C4
        BYTE $FA,$1F,$A0
        BYTE $92,$12,$90
        BYTE $21,$24,$88
        BYTE $21,$24,$48
        BYTE $21,$24,$44
        BYTE $00

