
org $818000


SaveToSRAM:
    PHP 
    REP #$30 
    PHB 
    PHX 
    PHY 
    PEA.W $7E00 
    PLB 
    PLB 
    STZ.B $14 
    AND.W #$0003 
    ASL A 
    STA.B $12 
    LDY.W #$005E 

.loopSamus:
    LDA.W $09A2,Y : STA.W $D7C0,Y 
    DEY #2
    BPL .loopSamus 
    LDX.W #$0000 
    LDA.W $079F 
    XBA 
    TAX 
    LDY.W #$0000 

.loopMap:
    LDA.W $07F7,Y : STA.W $CD52,X 
    INY #2
    INX #2
    CPY.W #$0100 
    BMI .loopMap 
    JSR.W SaveMap 
    LDA.W $078B : STA.W $D916 
    LDA.W $079F : STA.W $D918 
    LDX.B $12 
    LDA.L SaveSlotOffsets,X 
    TAX 
    LDY.W #$D7C0 ; $7E

.loopToSRAM:
    LDA.W $0000,Y : STA.L $700000,X 
    CLC : ADC.B $14 : STA.B $14 
    INX #2
    INY #2
    CPY.W #$DE1C ; $7E
    BNE .loopToSRAM 
    LDX.B $12 
    LDA.B $14 : STA.L $700000,X 
    STA.L $701FF0,X 
    EOR.W #$FFFF 
    STA.L $700008,X 
    STA.L $701FF8,X 
    PLY 
    PLX 
    CLC 
    PLB 
    PLP 
    RTL 


LoadFromSRAM:
    REP #$30 
    PHB 
    PHX 
    PHY 
    PEA.W $7E00 
    PLB 
    PLB 
    STZ.B $14 
    AND.W #$0003 
    ASL A 
    STA.B $12 
    TAX 
    LDA.L SaveSlotOffsets,X 
    TAX 
    LDY.W #$D7C0 ; $7E

.loop:
    LDA.L $700000,X : STA.W $0000,Y 
    CLC : ADC.B $14 : STA.B $14 
    INX #2
    INY #2
    CPY.W #$DE1C ; $7E
    BNE .loop 
    LDX.B $12 
    LDA.B $14 
    CMP.L $700000,X 
    BNE .doubleCheck 
    EOR.W #$FFFF 
    CMP.L $700008,X 
    BNE .doubleCheck 
    BRA .success 


.doubleCheck:
    LDA.B $14 
    CMP.L $701FF0,X 
    BNE .corrupt 
    EOR.W #$FFFF 
    CMP.L $701FF8,X 
    BNE .corrupt 

.success:
    LDY.W #$005E 

.loopSuccess:
    LDA.W $D7C0,Y : STA.W $09A2,Y 
    DEY #2
    BPL .loopSuccess 
    JSR.W LoadMap 
    LDA.W $D916 : STA.W $078B 
    LDA.W $D918 : STA.W $079F 
    PLY 
    PLX 
    CLC 
    PLB 
    RTL 


.corrupt:
    STZ.B $14 
    LDX.B $12 
    LDA.L SaveSlotOffsets,X 
    TAX 
    LDY.W #$D7C0 ; $7E
    LDA.W #$0000 

.loopCorrupt:
    STA.L $700000,X 
    CLC : ADC.B $14 : STA.B $14 
    INX #2
    INY #2
    CPY.W #$DE1C ; $7E
    BNE .loopCorrupt 
    LDA.W #$0000 : STA.W $078B 
    STA.W $079F 
    PLY 
    PLX 
    SEC 
    PLB 
    RTL 


SaveSlotOffsets:
    dw $0010,$066C,$0CC8 

; Lists of offsets into explored map data ($7E:CD52 + (area index) * 100h) whose bytes are saved to SRAM
; Map data offsets of 80h+ are specifying the right half of the map (7Fh- are specifying the left half)
; Each byte is 8 map tiles, and the first row (offsets 0..3 and 80h..83h) is meaningless padding
SRAMMapData_size:
    db $4A,$48,$4C,$12,$42,$15,$08 

SRAMMapData_offset:
    db $00,$00,$4A,$00,$92,$00,$DE,$00,$F0,$00,$32,$01,$47,$01 

SRAMMapData_crateria:
    db         $07 
    db         $0B
    db $0D,$0E,$0F
    db $11,    $13
    db $15,$16,$17
    db $19,$1A
    db $1D,$1E,$1F
    db $21,$22
    db $24,$25,$26
    db $28,    $2A,$2B
    db $2C,    $2E,$2F
    db $30,    $32,$33
    db         $36,$37
    db         $3A,$3B
    db         $3E,$3F
    db         $42,$43
    db         $46,$47
    db         $4A
    db         $4E
    db         $52
    db         $56
    db                 $84,$85
    db                 $88,$89
    db                 $8C,$8D
    db                 $90,$91
    db                 $94,$95,$96,$97
    db                 $98,$99,$9A,$9B
    db                 $9C,        $9F
    db                 $A0,        $A3
    db                 $A4,    $A6,$A7
    db                 $A8,    $AA,$AB
    db                 $AC,    $AE
    db                         $B2
    db                         $B6
    db                         $BA
    db $00,$00,$00,$00,$00,$00

SRAMMapData_brinstar:
    db     $05 
    db     $09,$0A,$0B
    db     $0D,$0E,$0F
    db     $11,$12,$13
    db $14,$15,$16,$17
    db     $19,$1A,$1B
    db $1C,$1D,$1E,$1F
    db $20,$21,$22,$23
    db     $25,$26,$27
    db     $29,$2A,$2B
    db $2C,$2D,$2E,$2F
    db $30,$31,$32,$33
    db     $35,$36,$37
    db     $39,$3A,$3B
    db         $42,$43
    db             $47
    db                 $90
    db                 $94
    db                 $98
    db                 $9C
    db                 $A0
    db                 $A4
    db                 $A8
    db                 $AC
    db                 $B0
    db                 $B4
    db                 $B8
    db                 $BC
    db                 $C0
    db                 $C4
    db                 $C8
    db                 $CC,$CD,$CE,$CF
    db                     $D1,$D2,$D3
    db                     $D5,$D9
    db $00,$00,$00,$00,$00,$00,$00,$00

SRAMMapData_norfair:
    db     $05 
    db $08,$09,    $0B
    db $0C,$0D,$0E,$0F
    db $10,$11,$12,$13
    db $14,$15,$16,$17
    db $18,$19,$1A,$1B
    db $1C,$1D,$1E,$1F
    db $20,$21,$22,$23
    db $24,$25,$26,$27
    db     $29,$2A,$2B
    db     $2D,$2E,$2F
    db     $31,$32,$33
    db $34,$35,$36,$37
    db $38,$39,$3A,$3B
    db $3C,$3D,$3E,$3F
    db $40,$41,$42
    db $44,$45,$46,$47
    db $48,$49,$4A
    db                 $8C


    db                 $98
    db                 $9C
    db                 $A0
    db                 $A4
    db                 $A8
    db                 $AC
    db                 $B0
    db                 $B4
    db                 $B8
    db                 $BC
    db                 $C0
    db                 $C4
    db $00,$00,$00,$00

SRAMMapData_wreckedShip:
    db     $2D,$2E 
    db     $31,$32
    db     $35,$36
    db     $39,$3A
    db     $3D,$3E
    db         $42
    db     $45,$46
    db     $49,$4A
    db         $4E
    db     $51,$52
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

SRAMMapData_maridia:
    db             $07 
    db             $0B
    db         $0E,$0F
    db         $12,$13
    db     $15,$16,$17
    db     $19,$1A,$1B
    db     $1D,$1E,$1F
    db     $21,$22,$23
    db     $25,$26,$27
    db     $29,$2A,$2B
    db     $2D,$2E,$2F
    db     $31,$32,$33
    db     $35,$36
    db     $39,$3A,$3B
    db     $3D,$3E,$3F
    db     $41,$42,$43
    db     $45,$46,$47
    db     $49,$4A
    db     $4D
    db     $51
    db                 $84
    db                 $88
    db                 $8C
    db                 $90
    db                 $94
    db                 $98
    db                 $9C,$9D
    db                 $A0,$A1
    db                 $A4,$A5
    db                 $A8,$A9
    db                 $AC,$AD
    db                 $C0
    db                 $C4
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

SRAMMapData_tourian:
    db         $26 
    db         $2A
    db         $2E
    db         $32
    db     $35,$36
    db     $39,$3A
    db         $3E
    db     $41,$42
    db     $45,$46
    db         $4A
    db     $4D,$4E
    db     $51,$52
    db     $55,$56
    db         $5A
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00

SRAMMapData_ceres:
    db     $2D 
    db     $31
    db     $35
    db     $39
    db     $3D
    db     $41
    db     $45,$46
    db $00,$00,$00,$00,$00,$00,$00,$00

MapRoomPointers:
    dw SRAMMapData_crateria 
    dw SRAMMapData_brinstar 
    dw SRAMMapData_norfair 
    dw SRAMMapData_wreckedShip 
    dw SRAMMapData_maridia 
    dw SRAMMapData_tourian 
    dw SRAMMapData_ceres 

LoadMap:
    PHB 
    PHP 
    PHK 
    PLB 
    REP #$30 
    LDX.W #$0700 
    LDA.W #$0000 

.loopTilesExplored:
    STA.L $7ECD52,X 
    DEX #2
    BPL .loopTilesExplored 
    STZ.B $16 

.loopArea:
    LDA.B $16 
    XBA 
    STA.B $14 
    LDX.B $16 
    LDA.W SRAMMapData_size,X 
    AND.W #$00FF 
    STA.B $12 
    LDA.B $16 
    ASL A 
    TAX 
    LDA.W MapRoomPointers,X : STA.B $00 
    LDA.W #$0081 : STA.B $02 
    LDA.W SRAMMapData_offset,X 
    TAX 
    LDA.W #$CD52 ; $7E
    STA.B $03 
    LDA.W #$007E : STA.B $05 

.loopRoom:
    LDA.B ($00) 
    AND.W #$00FF 
    CLC : ADC.B $14 : TAY 
    SEP #$20 
    LDA.L $7ED91C,X : STA.B [$03],Y 
    REP #$20 
    INC.B $00 
    INX 
    DEC.B $12 
    BNE .loopRoom 
    INC.B $16 
    LDA.B $16 
    CMP.W #$0006 
    BMI .loopArea 
    PLP 
    PLB 
    RTS 


SaveMap:
    PHB 
    PHP 
    PHK 
    PLB 
    REP #$30 
    STZ.B $1A 

.loopAreas:
    LDX.B $1A 
    LDA.W SRAMMapData_size,X 
    AND.W #$00FF 
    STA.B $16 
    LDA.B $1A 
    ASL A 
    TAX 
    LDA.W MapRoomPointers,X : STA.B $00 
    LDA.W SRAMMapData_offset,X 
    TAX 
    LDA.B $1A 
    XBA 
    STA.B $18 
    LDA.W #$CD52 ; $7E
    STA.B $03 
    LDA.W #$007E : STA.B $05 

.loopRooms:
    LDA.B ($00) 
    AND.W #$00FF 
    CLC : ADC.B $18 : TAY 
    SEP #$20 
    LDA.B [$03],Y : STA.L $7ED91C,X 
    REP #$20 
    INC.B $00 
    INX 
    DEC.B $16 
    BNE .loopRooms 
    INC.B $1A 
    LDA.B $1A 
    CMP.W #$0006 
    BMI .loopAreas 
    PLP 
    PLB 
    RTS 


MapOfOAMIndex:
  .highXPosBit
    dw $0001 
  .sizeBit
    dw       $0002 
    dw              $0004,$0008, $0010,$0020, $0040,$0080
    dw $0100,$0200, $0400,$0800, $1000,$2000, $4000,$8000
    dw $0001,$0002, $0004,$0008, $0010,$0020, $0040,$0080
    dw $0100,$0200, $0400,$0800, $1000,$2000, $4000,$8000
    dw $0001,$0002, $0004,$0008, $0010,$0020, $0040,$0080
    dw $0100,$0200, $0400,$0800, $1000,$2000, $4000,$8000
    dw $0001,$0002, $0004,$0008, $0010,$0020, $0040,$0080
    dw $0100,$0200, $0400,$0800, $1000,$2000, $4000,$8000
    dw $0001,$0002, $0004,$0008, $0010,$0020, $0040,$0080
    dw $0100,$0200, $0400,$0800, $1000,$2000, $4000,$8000
    dw $0001,$0002, $0004,$0008, $0010,$0020, $0040,$0080
    dw $0100,$0200, $0400,$0800, $1000,$2000, $4000,$8000
    dw $0001,$0002, $0004,$0008, $0010,$0020, $0040,$0080
    dw $0100,$0200, $0400,$0800, $1000,$2000, $4000,$8000
    dw $0001,$0002, $0004,$0008, $0010,$0020, $0040,$0080
    dw $0100,$0200, $0400,$0800, $1000,$2000, $4000,$8000
    dw $0001,$0002, $0004,$0008, $0010,$0020, $0040,$0080
    dw $0100,$0200, $0400,$0800, $1000,$2000, $4000,$8000
    dw $0001,$0002, $0004,$0008, $0010,$0020, $0040,$0080
    dw $0100,$0200, $0400,$0800, $1000,$2000, $4000,$8000
    dw $0001,$0002, $0004,$0008, $0010,$0020, $0040,$0080
    dw $0100,$0200, $0400,$0800, $1000,$2000, $4000,$8000
    dw $0001,$0002, $0004,$0008, $0010,$0020, $0040,$0080
    dw $0100,$0200, $0400,$0800, $1000,$2000, $4000,$8000
    dw $0001,$0002, $0004,$0008, $0010,$0020, $0040,$0080
    dw $0100,$0200, $0400,$0800, $1000,$2000, $4000,$8000
    dw $0001,$0002, $0004,$0008, $0010,$0020, $0040,$0080
    dw $0100,$0200, $0400,$0800, $1000,$2000, $4000,$8000
    dw $0001,$0002, $0004,$0008, $0010,$0020, $0040,$0080
    dw $0100,$0200, $0400,$0800, $1000,$2000, $4000,$8000
    dw $0001,$0002, $0004,$0008, $0010,$0020, $0040,$0080
    dw $0100,$0200, $0400,$0800, $1000,$2000, $4000,$8000

MapOfOAMIndexToHighOAM:
  .address
    dw $0570 
  .bitmask
    dw       $0003 
    dw              $0570,$000C, $0570,$0030, $0570,$00C0
    dw $0570,$0300, $0570,$0C00, $0570,$3000, $0570,$C000
    dw $0572,$0003, $0572,$000C, $0572,$0030, $0572,$00C0
    dw $0572,$0300, $0572,$0C00, $0572,$3000, $0572,$C000
    dw $0574,$0003, $0574,$000C, $0574,$0030, $0574,$00C0
    dw $0574,$0300, $0574,$0C00, $0574,$3000, $0574,$C000
    dw $0576,$0003, $0576,$000C, $0576,$0030, $0576,$00C0
    dw $0576,$0300, $0576,$0C00, $0576,$3000, $0576,$C000
    dw $0578,$0003, $0578,$000C, $0578,$0030, $0578,$00C0
    dw $0578,$0300, $0578,$0C00, $0578,$3000, $0578,$C000
    dw $057A,$0003, $057A,$000C, $057A,$0030, $057A,$00C0
    dw $057A,$0300, $057A,$0C00, $057A,$3000, $057A,$C000
    dw $057C,$0003, $057C,$000C, $057C,$0030, $057C,$00C0
    dw $057C,$0300, $057C,$0C00, $057C,$3000, $057C,$C000
    dw $057E,$0003, $057E,$000C, $057E,$0030, $057E,$00C0
    dw $057E,$0300, $057E,$0C00, $057E,$3000, $057E,$C000
    dw $0580,$0003, $0580,$000C, $0580,$0030, $0580,$00C0
    dw $0580,$0300, $0580,$0C00, $0580,$3000, $0580,$C000
    dw $0582,$0003, $0582,$000C, $0582,$0030, $0582,$00C0
    dw $0582,$0300, $0582,$0C00, $0582,$3000, $0582,$C000
    dw $0584,$0003, $0584,$000C, $0584,$0030, $0584,$00C0
    dw $0584,$0300, $0584,$0C00, $0584,$3000, $0584,$C000
    dw $0586,$0003, $0586,$000C, $0586,$0030, $0586,$00C0
    dw $0586,$0300, $0586,$0C00, $0586,$3000, $0586,$C000
    dw $0588,$0003, $0588,$000C, $0588,$0030, $0588,$00C0
    dw $0588,$0300, $0588,$0C00, $0588,$3000, $0588,$C000
    dw $058A,$0003, $058A,$000C, $058A,$0030, $058A,$00C0
    dw $058A,$0300, $058A,$0C00, $058A,$3000, $058A,$C000
    dw $058C,$0003, $058C,$000C, $058C,$0030, $058C,$00C0
    dw $058C,$0300, $058C,$0C00, $058C,$3000, $058C,$C000
    dw $058E,$0003, $058E,$000C, $058E,$0030, $058E,$00C0
    dw $058E,$0300, $058E,$0C00, $058E,$3000, $058E,$C000      

AddSpritemapToOAM:
    PHX 
    LDA.W $0000,Y 
    BNE + 
    PLX 
    RTL 


.gotoReturn:
    JMP.W .return 


  + STA.B $18 
    INY #2
    LDA.W $0590 
    BIT.W #$FE00 
    BNE .gotoReturn 
    TAX 
    CLC 

.loop:
    LDA.W $0000,Y 
    ADC.B $14 : STA.W $0370,X 
    AND.W #$0100 
    BEQ .xHighClear 
    LDA.W $0000,Y 
    BPL + 
    LDA.L MapOfOAMIndexToHighOAM_address,X : STA.B $1C 
    LDA.B ($1C) 
    ORA.L MapOfOAMIndexToHighOAM_bitmask,X 
    STA.B ($1C) 
    JMP.W .merge 


  + LDA.L MapOfOAMIndexToHighOAM_address,X : STA.B $1C 
    LDA.B ($1C) 
    ORA.L MapOfOAMIndex_highXPosBit,X 
    STA.B ($1C) 
    BRA .merge 


.xHighClear:
    LDA.W $0000,Y 
    BPL .merge 
    LDA.L MapOfOAMIndexToHighOAM_address,X : STA.B $1C 
    LDA.B ($1C) 
    ORA.L MapOfOAMIndex_sizeBit,X 
    STA.B ($1C) 

.merge:
    SEP #$20 
    LDA.W $0002,Y 
    CLC 
    BMI + 
    ADC.B $12 : BCS .setOAMPos180h 
    CMP.B #$E0 
    BCC .onScreen 
    BRA .setOAMPos180h 


  + ADC.B $12 : BCS .lessThanE0h 
    CMP.B #$E0 
    BCS .onScreen 
    BRA .setOAMPos180h 


.lessThanE0h:
    CMP.B #$E0 
    BCC .onScreen 

.setOAMPos180h:
    JSR.W OAMEntry_XPosition_180h 
    LDA.B #$E0 

.onScreen:
    STA.W $0371,X 
    REP #$21 
    LDA.W $0003,Y 
    AND.W #$F1FF 
    ORA.B $16 
    STA.W $0372,X 
    TXA 
    ADC.W #$0004 : BIT.W #$FE00 
    BNE .return 
    TAX 
    TYA 
    ADC.W #$0005 : TAY 
    DEC.B $18 
    BEQ + 
    JMP.W .loop 


  + STX.W $0590 
    PLX 
    RTL 


.return:
    STA.W $0590 
    PLX 
    RTL 


AddSpritemapToOAM_Offscreen:
    PHX 
    LDA.W $0000,Y 
    BNE + 
    PLX 
    RTL 


.goto_return:
    JMP.W .return 


  + STA.B $18 
    INY #2
    LDA.W $0590 
    BIT.W #$FE00 
    BNE .goto_return 
    TAX 
    CLC 

.loop:
    LDA.W $0000,Y 
    ADC.B $14 : STA.W $0370,X 
    AND.W #$0100 
    BEQ .xHighClear 
    LDA.W $0000,Y 
    BPL + 
    LDA.L MapOfOAMIndexToHighOAM_address,X : STA.B $1C 
    LDA.B ($1C) 
    ORA.L MapOfOAMIndexToHighOAM_bitmask,X 
    STA.B ($1C) 
    JMP.W .merge 


  + LDA.L MapOfOAMIndexToHighOAM_address,X : STA.B $1C 
    LDA.B ($1C) 
    ORA.L MapOfOAMIndex_highXPosBit,X 
    STA.B ($1C) 
    BRA .merge 


.xHighClear:
    LDA.W $0000,Y 
    BPL .merge 
    LDA.L MapOfOAMIndexToHighOAM_address,X : STA.B $1C 
    LDA.B ($1C) 
    ORA.L MapOfOAMIndex_sizeBit,X 
    STA.B ($1C) 

.merge:
    SEP #$20 
    LDA.W $0002,Y 
    CLC 
    BMI + 
    ADC.B $12 : BCS .onScreen 
    CMP.B #$E0 
    BCS .onScreen 
    BRA .setOAMPos180h 


  + ADC.B $12 : BCS .lessThanE0h 
    CMP.B #$E0 
    BCC .onScreen 
    BRA .setOAMPos180h 


.lessThanE0h:
    CMP.B #$E0 
    BCS .onScreen 

.setOAMPos180h:
    JSR.W OAMEntry_XPosition_180h 
    LDA.B #$E0 

.onScreen:
    STA.W $0371,X 
    REP #$21 
    LDA.W $0003,Y 
    AND.W #$F1FF 
    ORA.B $16 
    STA.W $0372,X 
    TXA 
    ADC.W #$0004 : BIT.W #$FE00 
    BNE .return 
    TAX 
    TYA 
    ADC.W #$0005 : TAY 
    DEC.B $18 
    BEQ + 
    JMP.W .loop 


  + STX.W $0590 
    PLX 
    RTL 


.return:
    STA.W $0590 
    PLX 
    RTL 


OAMEntry_XPosition_180h:
    LDA.B #$80 : STA.W $0370,X 
    REP #$20 
    LDA.L MapOfOAMIndexToHighOAM_address,X : STA.B $1C 
    LDA.B ($1C) 
    ORA.L MapOfOAMIndex_highXPosBit,X 
    STA.B ($1C) 
    SEP #$20 
    RTS 


AddSpritemapFrom_82C569_TableToOAM:
    PHB 
    PEA.W $8200 
    PLB 
    PLB 
    STY.B $12 
    STX.B $14 
    ASL A 
    TAX 
    LDY.W MenuSpritemap_Pointers,X 
    LDA.W $0000,Y 
    BEQ .return 
    STA.B $18 
    INY #2
    LDX.W $0590 
    CLC 

.loop:
    LDA.W $0000,Y 
    ADC.B $14 : STA.W $0370,X 
    AND.W #$0100 
    BEQ .xHighClear 
    LDA.W $0000,Y 
    BPL .preMerge 
    LDA.L MapOfOAMIndexToHighOAM_address,X : STA.B $16 
    LDA.B ($16) 
    ORA.L MapOfOAMIndexToHighOAM_bitmask,X 
    STA.B ($16) 
    JMP.W .merge 


.preMerge:
    LDA.L MapOfOAMIndexToHighOAM_address,X : STA.B $16 
    LDA.B ($16) 
    ORA.L MapOfOAMIndex_highXPosBit,X 
    STA.B ($16) 
    JMP.W .merge 


.xHighClear:
    LDA.W $0000,Y 
    BPL .merge 
    LDA.L MapOfOAMIndexToHighOAM_address,X : STA.B $16 
    LDA.B ($16) 
    ORA.L MapOfOAMIndex_sizeBit,X 
    STA.B ($16) 

.merge:
    LDA.W $0002,Y : CLC : ADC.B $12 : STA.W $0371,X 
    LDA.W $0003,Y 
    AND.W #$F1FF 
    ORA.B $03 
    STA.W $0372,X 
    TYA 
    CLC : ADC.W #$0005 : TAY 
    TXA 
    CLC : ADC.W #$0004 : AND.W #$01FF 
    TAX 
    DEC.B $18 
    BNE .loop 
    STX.W $0590 

.return:
    PLB 
    RTL 


AddSamusSpritemapToOAM:
    PHB 
    PEA.W $9200 
    PLB 
    PLB 
    STY.B $12 
    STX.B $14 
    ASL A 
    TAX 
    LDY.W SamusSpritemapTable,X 
    LDA.W $0000,Y 
    BEQ .return 
    STA.B $18 
    INY #2
    LDX.W $0590 
    CLC 

.loop:
    LDA.W $0000,Y 
    ADC.B $14 : STA.W $0370,X 
    AND.W #$0100 
    BEQ .xHighClear 
    LDA.W $0000,Y 
    BPL .preMerge 
    LDA.L MapOfOAMIndexToHighOAM_address,X : STA.B $16 
    LDA.B ($16) 
    ORA.L MapOfOAMIndexToHighOAM_bitmask,X 
    STA.B ($16) 
    JMP.W .merge 


.preMerge:
    LDA.L MapOfOAMIndexToHighOAM_address,X : STA.B $16 
    LDA.B ($16) 
    ORA.L MapOfOAMIndex_highXPosBit,X 
    STA.B ($16) 
    JMP.W .merge 


.xHighClear:
    LDA.W $0000,Y 
    BPL .merge 
    LDA.L MapOfOAMIndexToHighOAM_address,X : STA.B $16 
    LDA.B ($16) 
    ORA.L MapOfOAMIndex_sizeBit,X 
    STA.B ($16) 

.merge:
    LDA.W $0002,Y : CLC : ADC.B $12 : STA.W $0371,X 
    LDA.W $0003,Y : STA.W $0372,X 
    TYA 
    CLC : ADC.W #$0005 : TAY 
    TXA 
    ADC.W #$0004 : AND.W #$01FF 
    TAX 
    DEC.B $18 
    BNE .loop 
    STX.W $0590 

.return:
    PLB 
    RTL 


AddSpritemapFrom_93A1A1_TableToOAM:
    PHB 
    PEA.W $9300 
    PLB 
    PLB 
    ASL A 
    TAX 
    LDY.W FlareSpritemapPointers,X 
    LDA.W $0000,Y : STA.B $18 
    INY #2
    BRA AddSpritemapToOAM_Common 


AddProjectileSpritemapToOAM:
    PHB 
    PEA.W $9300 
    PLB 
    PLB 
    LDY.W $0CB8,X 
    LDA.W $0000,Y 
    BNE + 
    PLB 
    RTL 


  + STA.B $18 
    INY #2
    ; fallthrough to AddSpritemapToOAM_Common

AddSpritemapToOAM_Common:
    LDX.W $0590 
    CLC 

.loop:
    LDA.W $0000,Y 
    ADC.B $14 : STA.W $0370,X 
    AND.W #$0100 
    BEQ + 
    LDA.L MapOfOAMIndexToHighOAM_address,X : STA.B $16 
    LDA.B ($16) 
    ORA.L MapOfOAMIndex_highXPosBit,X 
    STA.B ($16) 

  + LDA.W $0000,Y 
    BPL + 
    LDA.L MapOfOAMIndexToHighOAM_address,X : STA.B $16 
    LDA.B ($16) 
    ORA.L MapOfOAMIndex_sizeBit,X 
    STA.B ($16) 

  + LDA.W $0002,Y : CLC : ADC.B $12 : STA.W $0371,X 
    LDA.W $0003,Y : STA.W $0372,X 
    TYA 
    CLC : ADC.W #$0005 : TAY 
    TXA 
    ADC.W #$0004 : AND.W #$01FF 
    TAX 
    DEC.B $18 
    BNE .loop 
    STX.W $0590 
    PLB 
    RTL 


RTL_818AB7:
    RTL 


AddSpritemapToOAM_WithBaseTileNumber_8AB8:
    PHY 
    LDA.W $0000,Y 
    BEQ .return 
    INY #2
    STA.B $18 
    LDX.W $0590 
    CLC 

.loop:
    LDA.W $0000,Y 
    ADC.B $14 : STA.W $0370,X 
    AND.W #$0100 
    BEQ + 
    LDA.L MapOfOAMIndexToHighOAM_address,X : STA.B $16 
    LDA.B ($16) 
    ORA.L MapOfOAMIndex_highXPosBit,X 
    STA.B ($16) 

  + LDA.W $0000,Y 
    BPL + 
    LDA.L MapOfOAMIndexToHighOAM_address,X : STA.B $16 
    LDA.B ($16) 
    ORA.L MapOfOAMIndex_sizeBit,X 
    STA.B ($16) 

  + SEP #$20 
    LDA.W $0002,Y : CLC : ADC.B $12 : STA.W $0371,X 
    REP #$21 
    LDA.W $0003,Y 
    ADC.B $00 : ORA.B $03 
    STA.W $0372,X 
    TYA 
    ADC.W #$0005 : TAY 
    TXA 
    ADC.W #$0004 : AND.W #$01FF 
    TAX 
    DEC.B $18 
    BNE .loop 
    STX.W $0590 

.return:
    PLY 
    RTL 


RTL_818B21:
    RTL 


AddSpritemapToOAM_WithBaseTileNumber_8B22:
    PHY 
    LDA.W $0000,Y 
    BEQ .return 
    INY #2
    STA.B $18 
    LDX.W $0590 
    CLC 

.loop:
    LDA.W $0000,Y 
    ADC.B $14 : STA.W $0370,X 
    AND.W #$0100 
    BEQ + 
    LDA.L MapOfOAMIndexToHighOAM_address,X : STA.B $16 
    LDA.B ($16) 
    ORA.L MapOfOAMIndex_highXPosBit,X 
    STA.B ($16) 

  + LDA.W $0000,Y 
    BPL + 
    LDA.L MapOfOAMIndexToHighOAM_address,X : STA.B $16 
    LDA.B ($16) 
    ORA.L MapOfOAMIndex_sizeBit,X 
    STA.B ($16) 

  + SEP #$20 
    LDA.W $0002,Y 
    BMI + 
    ADC.B $12 : BCC .onScreen 
    BCS .yPosF0h 

  + ADC.B $12 : BCS .onScreen 

.yPosF0h:
    LDA.B #$F0 

.onScreen:
    STA.W $0371,X 
    REP #$21 
    LDA.W $0003,Y 
    ADC.B $00 : ORA.B $03 
    STA.W $0372,X 
    TYA 
    ADC.W #$0005 : TAY 
    TXA 
    ADC.W #$0004 : AND.W #$01FF 
    TAX 
    DEC.B $18 
    BNE .loop 
    STX.W $0590 

.return:
    PLY 
    RTL 


AddSpritemapToOAM_WithBaseTileNumber_Offscreen_8B96:
    PHY 
    LDA.W $0000,Y 
    BEQ .return 
    INY #2
    STA.B $18 
    LDX.W $0590 
    CLC 

.loop:
    LDA.W $0000,Y 
    ADC.B $14 : STA.W $0370,X 
    AND.W #$0100 
    BEQ + 
    LDA.L MapOfOAMIndexToHighOAM_address,X : STA.B $16 
    LDA.B ($16) 
    ORA.L MapOfOAMIndex_highXPosBit,X 
    STA.B ($16) 

  + LDA.W $0000,Y 
    BPL + 
    LDA.L MapOfOAMIndexToHighOAM_address,X : STA.B $16 
    LDA.B ($16) 
    ORA.L MapOfOAMIndex_sizeBit,X 
    STA.B ($16) 

  + SEP #$20 
    LDA.W $0002,Y 
    BMI + 
    ADC.B $12 : BCS .onScreen 
    BCC .yPosF0h 

  + ADC.B $12 : BCC .onScreen 

.yPosF0h:
    LDA.B #$F0 

.onScreen:
    STA.W $0371,X 
    REP #$21 
    LDA.W $0003,Y 
    ADC.B $00 : ORA.B $03 
    STA.W $0372,X 
    TYA 
    ADC.W #$0005 : TAY 
    TXA 
    ADC.W #$0004 : AND.W #$01FF 
    TAX 
    DEC.B $18 
    BNE .loop 
    STX.W $0590 

.return:
    PLY 
    RTL 


AddSpritemapToOAM_WithBaseTileNumber_8C0A:
    LDA.W $0000,Y 
    BNE + 
    RTL 


  + STA.B $18 
    INY #2
    LDX.W $0590 
    CLC 

.loop:
    LDA.W $0000,Y : CLC : ADC.B $14 : STA.W $0370,X 
    BIT.W #$0100 
    BEQ + 
    LDA.L MapOfOAMIndexToHighOAM_address,X : STA.B $16 
    LDA.B ($16) 
    ORA.L MapOfOAMIndex_highXPosBit,X 
    STA.B ($16) 

  + SEP #$20 
    CLC 
    LDA.W $0002,Y 
    BMI + 
    ADC.B $12 : BCC .onScreen 
    BCS .yPosF0h 

  + ADC.B $12 : BCS .onScreen 

.yPosF0h:
    LDA.B #$F0 

.onScreen:
    STA.W $0371,X 
    REP #$21 
    LDA.W $0000,Y 
    BPL + 
    LDA.L MapOfOAMIndexToHighOAM_address,X : STA.B $16 
    LDA.B ($16) 
    ORA.L MapOfOAMIndex_sizeBit,X 
    STA.B ($16) 

  + LDA.W $0003,Y 
    ADC.B $1A : ORA.B $1C 
    STA.W $0372,X 
    TXA 
    ADC.W #$0004 : AND.W #$01FF 
    TAX 
    TYA 
    ADC.W #$0005 : TAY 
    DEC.B $18 
    BNE .loop 
    STX.W $0590 
    RTL 


AddSpritemapToOAM_WithBaseTileNumber_Offscreen_8C7F:
    LDA.W $0000,Y 
    BNE + 
    RTL 


  + STA.B $18 
    INY #2
    LDX.W $0590 
    CLC 

.loop:
    LDA.W $0000,Y : CLC : ADC.B $14 : STA.W $0370,X 
    BIT.W #$0100 
    BEQ + 
    LDA.L MapOfOAMIndexToHighOAM_address,X : STA.B $16 
    LDA.B ($16) 
    ORA.L MapOfOAMIndex_highXPosBit,X 
    STA.B ($16) 

  + SEP #$20 
    CLC 
    LDA.W $0002,Y 
    BMI + 
    ADC.B $12 : BCS .onScreen 
    BCC .yPosF0h 

  + ADC.B $12 : BCC .onScreen 

.yPosF0h:
    LDA.B #$F0 

.onScreen:
    STA.W $0371,X 
    REP #$21 
    LDA.W $0000,Y 
    BPL + 
    LDA.L MapOfOAMIndexToHighOAM_address,X : STA.B $16 
    LDA.B ($16) 
    ORA.L MapOfOAMIndex_sizeBit,X 
    STA.B ($16) 

  + LDA.W $0003,Y 
    ADC.B $1A : ORA.B $1C 
    STA.W $0372,X 
    TXA 
    ADC.W #$0004 : AND.W #$01FF 
    TAX 
    TYA 
    ADC.W #$0005 : TAY 
    DEC.B $18 
    BNE .loop 
    STX.W $0590 
    RTL 


Debug_GameOverMenu:
    REP #$30 
    PHB 
    PHK 
    PLB 
    LDA.W $0727 
    ASL A 
    TAX 
    JSR.W (.pointers,X) 
    PLB 
    RTL 


.pointers:
    dw Debug_GameOverMenu_Index0_FadeOut_ConfigureGraphicsForMenu 
    dw Debug_GameOverMenu_Index1_Initialise 
    dw Debug_GameOverMenu_Index24_FadeIn 
    dw DebugGameOverMenu_Index3_Main 
    dw Debug_GameOverMenu_Index24_FadeIn 
    dw DebugGameOverMenu_Index5_Continue 

Debug_GameOverMenu_Index0_FadeOut_ConfigureGraphicsForMenu:
    REP #$30 
    JSL.L HandleFadingOut 
    LDA.B $51 
    AND.W #$000F 
    BEQ + 
    RTS 


  + JSL.L SetForceBlankAndWaitForNMI 
    LDA.W #$0001 
    JSL.L QueueSound_Lib3_Max6 
    JSL.L Disable_HDMAObjects 
    JSL.L Wait_End_VBlank_Clear_HDMA 
    LDX.W #$0000 

.loopPalettes:
    LDA.L $7EC000,X : STA.L $7E3300,X 
    INX #2
    CPX.W #$0200 
    BMI .loopPalettes 
    LDX.W #$0000 

.loopIORegisterMirrors:
    LDA.B $51,X : STA.L $7E3500,X 
    INX #2
    CPX.W #$0036 
    BMI .loopIORegisterMirrors 
    JSR.W MapVRAMForMenu 
    JSR.W LoadInitialMenuTiles 
    REP #$30 
    STZ.B $B1 
    STZ.B $B5 
    STZ.B $B9 
    STZ.B $B3 
    STZ.B $B7 
    STZ.B $BB 
    JSR.W LoadMenuPalettes 
    INC.W $0727 
    RTS 


Debug_GameOverMenu_Index1_Initialise:
    REP #$30 
    LDA.W #$0000 
    JSL.L QueueMusicDataOrTrack_8FrameDelay 
    LDA.W #$FF03 
    JSL.L QueueMusicDataOrTrack_8FrameDelay 
    SEP #$20 
    LDA.B #$11 : STA.B $69 
    REP #$30 
    LDA.W #Debug_GameOverMenu_VRAMTransferDefinitions : STA.B $00 
    LDA.W #$0081 : STA.B $02 
    JSL.L LoadDebugGameOverMenuTilemap 
    JSL.L ClearForceBlankAndWaitForNMI 
    INC.W $0727 
    STZ.W $0723 
    STZ.W $0725 
    STZ.W $0950 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_818DA4:
    dw $000F 
endif ; !FEATURE_KEEP_UNREFERENCED

Debug_GameOverMenu_Index24_FadeIn:
    REP #$30 
    JSL.L HandleFadingIn 
    LDA.B $51 
    AND.W #$000F 
    CMP.W #$000F 
    BNE .return 
    INC.W $0727 

.return:
    RTS 


MapVRAMForMenu:
    SEP #$20 
    STZ.B $6B 
    LDA.B #$03 : STA.B $52 
    LDA.B #$51 : STA.B $58 
    LDA.B #$58 : STA.B $59 
    LDA.B #$5C : STA.B $5A 
    LDA.B #$00 : STA.B $5D 
    LDA.B #$04 : STA.B $5E 
    LDA.B #$13 : STA.B $69 
    RTS 


LoadInitialMenuTiles:
    PHP 
    SEP #$30 
    LDA.B #$00 : STA.W $2116 
    LDA.B #$00 : STA.W $2117 
    LDA.B #$80 : STA.W $2115 
    JSL.L SetupHDMATransfer 
    db $01,$01,$18 
    dl Tiles_Menu_BG1_BG2 
    dw $5600 
    LDA.B #$02 : STA.W $420B 
    LDA.B #$00 : STA.W $2116 
    LDA.B #$30 : STA.W $2117 
    LDA.B #$80 : STA.W $2115 
    JSL.L SetupHDMATransfer 
    db $01,$01,$18 
    dl Tiles_PauseScreen_BG1_BG2 
    dw $2000 
    LDA.B #$02 : STA.W $420B 
    LDA.B #$00 : STA.W $2116 
    LDA.B #$60 : STA.W $2117 
    LDA.B #$80 : STA.W $2115 
    JSL.L SetupHDMATransfer 
    db $01,$01,$18 
    dl Tiles_Menu_PauseScreen_Sprites 
    dw $2000 
    LDA.B #$02 : STA.W $420B 
    LDA.B #$00 : STA.W $2116 
    LDA.B #$40 : STA.W $2117 
    LDA.B #$80 : STA.W $2115 
    JSL.L SetupHDMATransfer 
    db $01,$01,$18 
    dl Tiles_Beta_Minimap_Area_Select_BG3 
    dw $0600 
    LDA.B #$02 : STA.W $420B 
    PLP 
    RTS 


LoadMenuPalettes:
    REP #$30 
    LDX.W #$0000 

.loop:
    LDA.L Menu_Palettes,X : STA.L $7EC000,X 
    LDA.L Menu_Palettes+2,X : STA.L $7EC002,X 
    INX #4
    CPX.W #$0200 
    BMI .loop 
    RTS 


LoadDebugGameOverMenuTilemap:
    LDX.W #$0000 
    LDA.W #$000F 

.loopClear:
    STA.L $7E3800,X 
    INX #2
    CPX.W #$0800 
    BMI .loopClear 
    LDX.W $0330 
    LDA.W #$0800 : STA.B $D0,X 
    LDA.W #$3800 : STA.B $D2,X 
    LDA.W #$007E : STA.B $D4,X 
    LDA.B $58 
    AND.W #$00FC 
    XBA 
    STA.B $D5,X 
    TXA 
    CLC : ADC.W #$0007 : STA.W $0330 
    LDX.W $0330 
    LDY.W #$0000 

.loop:
    LDA.B [$00],Y 
    CMP.W #$FFFF 
    BEQ .return 
    STA.B $D0,X 
    INY #2
    LDA.B [$00],Y : STA.B $D2,X 
    INY #2
    LDA.B [$00],Y : STA.B $D4,X 
    INY #2
    LDA.B [$00],Y : STA.B $D5,X 
    TXA 
    CLC : ADC.W #$0007 : TAX 
    INY #2
    BRA .loop 


.return:
    STX.W $0330 
    RTL 


Debug_GameOverMenu_VRAMTransferDefinitions:
    dw $0040 ; '            GAME QUIT           '
    dl Tilemap_DebugGameOverMenu_gameQuit 
    db $00 
    dw $5140,$0040 

    dl Tilemap_DebugGameOverMenu_wouldYouPlay ; '        WOULD YOU PLAY ?        '
    db $00 
    dw $5180,$0040 

    dl Tilemap_DebugGameOverMenu_end ; '            END                 '
    db $00 
    dw $51E0,$0040 

    dl Tilemap_DebugGameOverMenu_continue ; '            CONTINUE            '
    db $00 
    dw $5220 
    dw $FFFF

Tilemap_DebugGameOverMenu:
  .gameQuit
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$0070,$006A,$0076,$006E 
    dw $000F,$007A,$007E,$0072,$007D,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 

  .wouldYouPlay
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $0080,$0078,$007E,$0075,$006D,$000F,$0082,$0078 
    dw $007E,$000F,$0079,$0075,$006A,$0082,$000F,$0085 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 

  .end
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$006E,$0077,$006D,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 

  .continue
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$006C,$0078,$0077,$007D 
    dw $0072,$0077,$007E,$006E,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 

DebugGameOverMenu_Index3_Main:
    REP #$30 
    LDA.B $8F 
    BIT.W #$2000 
    BNE .toggleSelection 
    BIT.W #$0800 
    BNE .toggleSelection 
    BIT.W #$0400 
    BNE .toggleSelection 
    BIT.W #$9080 
    BEQ .noChange 
    LDA.W $0950 
    BNE + 
    LDA.W $0952 
    JSL.L SaveToSRAM 
    JML.L SoftReset 


  + INC.W $0727 
    RTS 


.toggleSelection:
    LDA.W $0950 
    EOR.W #$0001 
    STA.W $0950 

.noChange:
    LDX.W #$7800 
    LDA.W $0950 
    BEQ + 
    LDX.W #$8800 

  + TXA 
    ORA.W #$0028 
    LDX.W $0590 
    STA.W $0370,X 
    LDA.W #$00B6 : STA.W $0372,X 
    INX #4
    STX.W $0590 
    RTS 


RestorePalettesAndIORegistersFromDebugGameOverMenu:
    LDX.W #$0000 

.loopPalettes:
    LDA.L $7E3300,X : STA.L $7EC000,X 
    INX #2
    CPX.W #$0200 
    BMI .loopPalettes 
    LDX.W #$0000 

.loopIORegisters:
    LDA.L $7E3500,X : STA.B $51,X 
    INX #2
    CPX.W #$0036 
    BMI .loopIORegisters 
    RTS 


DebugGameOverMenu_Index5_Continue:
    SEP #$30 
    LDA.B #$00 : STA.W $2116 
    LDA.B #$40 : STA.W $2117 
    LDA.B #$80 : STA.W $2115 
    JSL.L SetupHDMATransfer 
    db $01,$01,$18 
    dl Tiles_Standard_BG3 
    dw $2000 
    LDA.B #$02 : STA.W $420B 
    REP #$30 
    LDA.W #$0010 : STA.W $0998 
    STZ.W $0950 
    JMP.W RestorePalettesAndIORegistersFromDebugGameOverMenu 


GameOverMenu:
    REP #$30 
    PHB 
    PHK 
    PLB 
    LDA.W $0727 
    ASL A 
    TAX 
    JSR.W (.pointers,X) 
    PLB 
    RTL 


.pointers:
    dw Debug_GameOverMenu_Index0_FadeOut_ConfigureGraphicsForMenu 
    dw GameOverMenu_Index1_Initialise 
    dw GameOverMenu_Index2_PlayMusicTrack 
    dw GameOverMenu_Index3_FadeIn 
    dw GameOverMenu_Index4_Main 
    dw GameOverMenu_Index5_FadeOutIntoGameMapView 
    dw GameOverMenu_Index6_LoadGameMapView 
    dw GameOverMenu_Index7_FadeOutIntoGameMapView 

GameOverMenu_Index3_FadeIn:
    JSL.L Handle_GameOver_BabyMetroid 
    JSL.L Draw_Menu_Selection_Missile 
    JSL.L HandleFadingIn 
    LDA.B $51 
    AND.W #$000F 
    CMP.W #$000F 
    BNE .return 
    INC.W $0727 

.return:
    RTS 


GameOverMenu_Index5_FadeOutIntoGameMapView:
    JSL.L Handle_GameOver_BabyMetroid 
    JSL.L Draw_Menu_Selection_Missile 
    JSL.L HandleFadingOut 
    LDA.B $51 
    AND.W #$000F 
    BNE .return 
    INC.W $0727 

.return:
    RTS 


GameOverMenu_Index7_FadeOutIntoGameMapView:
    JSL.L Draw_Menu_Selection_Missile 
    JSL.L Handle_GameOver_BabyMetroid 
    JSL.L HandleFadingOut 
    LDA.B $51 
    AND.W #$000F 
    BEQ .softReset 
    RTS 


.softReset:
    JML.L SoftReset 


GameOverMenu_Index6_LoadGameMapView:
    JSL.L Disable_HDMAObjects 
    JSL.L Wait_End_VBlank_Clear_HDMA 
    LDA.W #$0005 : STA.W $0998 
    LDA.W #$0000 : STA.W $0727 
    RTS 


GameOverMenu_Index4_Main:
    REP #$30 
    JSL.L Handle_GameOver_BabyMetroid 
    JSL.L Draw_Menu_Selection_Missile 
    LDA.B $8F 
    BIT.W #$2000 
    BNE .toggleSelection 
    BIT.W #$0800 
    BNE .toggleSelection 
    BIT.W #$0400 
    BNE .toggleSelection 
    BIT.W #$0080 
    BEQ .noChange 
    LDA.W #$00B4 : STA.W $0F94 
    LDA.W $0950 
    BEQ + 
    LDA.W #$0007 : STA.W $0727 
    RTS 


  + LDA.L $7ED914 
    CMP.W #$001F 
    BEQ + 
    INC.W $0727 
    LDA.W $0952 
    JSL.L LoadFromSRAM 
    RTS 


  + STA.W $0998 
    LDA.W $0952 
    JSL.L LoadFromSRAM 
    RTS 


.toggleSelection:
    LDA.W #$0037 
    JSL.L QueueSound_Lib1_Max6 
    LDA.W $0950 
    EOR.W #$0001 
    STA.W $0950 

.noChange:
    LDX.W #$0028 
    LDY.W #$00A0 
    LDA.W $0950 
    BEQ + 
    LDX.W #$0028 
    LDY.W #$00C0 

  + STX.W $19A1 
    STY.W $19AB 
    RTS 


GameOverMenu_Index1_Initialise:
    SEP #$20 
    LDA.B #$11 : STA.B $69 
    LDA.B #$20 : STA.B $74 
    LDA.B #$40 : STA.B $75 
    LDA.B #$80 : STA.B $76 
    REP #$30 
    LDA.W #$0000 
    JSL.L QueueMusicDataOrTrack_8FrameDelay 
    LDA.W #$FF03 
    JSL.L QueueMusicDataOrTrack_8FrameDelay 
    LDA.W #$0001 : STA.W $198D 
    DEC A 
    STA.W $1997 
    LDX.W #$0000 
    LDA.W #$000F 

.loop:
    STA.L $7E3600,X 
    INX #2
    CPX.W #$0800 
    BMI .loop 
    LDX.W $0330 
    LDA.W #$0800 : STA.B $D0,X 
    LDA.W #$3600 : STA.B $D2,X 
    LDA.W #$007E : STA.B $D4,X 
    LDA.B $58 
    AND.W #$00FC 
    XBA 
    STA.B $D5,X 
    TXA 
    CLC : ADC.W #$0007 : STA.W $0330 
    STZ.W $0F96 
    LDY.W #Tilemap_GameOver_gameOver 
    LDX.W #($B<<1)|($5<<6) ; $0156
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates 
    LDY.W #Tilemap_GameOver_findTheMetroidLarva 
    LDX.W #($5<<1)|($E<<6) ; $038A
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates 
    LDY.W #Tilemap_GameOver_tryAgain 
    LDX.W #($A<<1)|($10<<6) ; $0414
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates 
    LDY.W #Tilemap_GameOver_yesReturnToGame 
    LDX.W #($7<<1)|($13<<6) ; $04CE
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates 
    LDY.W #Tilemap_GameOver_noGoToTitle 
    LDX.W #($7<<1)|($17<<6) ; $05CE
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates 
    STZ.W $0F92 
    STZ.W $0F94 
    JSL.L Handle_GameOver_BabyMetroid 
    LDA.B $6F 
    AND.W #$FF00 
    STA.B $6F 
    JSL.L Disable_HDMAObjects 
    JSL.L Wait_End_VBlank_Clear_HDMA 
    JSL.L Enable_HDMAObjects 
    JSL.L Spawn_HDMAObject 
    db $00,$32 
    dw HDMAObjInstList_ColorMathSubscnBackdrop_GameOverMenuGradient 
    JSL.L Spawn_HDMAObject 
    db $00,$31 
    dw HDMAObjInstList_ColorMathCtrlRegB_GameOverMenuGradient 
    JSL.L ClearForceBlankAndWaitForNMI 
    INC.W $0727 
    STZ.W $0723 
    STZ.W $0725 
    STZ.W $0950 
    LDA.W #$0028 : STA.W $19A1 
    LDA.W #$00A0 : STA.W $19AB 
    RTS 


HDMAObjInstList_ColorMathSubscnBackdrop_GameOverMenuGradient:
    dw Instruction_HDMAObject_HDMATableBank : db $81 
    dw Instruction_HDMAObject_PreInstructionInY : dl RTL_8192DB 
    dw $0001, HDMATable_ColorMathSubscnBackdrop_GameOverMenuGradient 
    dw Instruction_HDMAObject_Sleep 
    dw Instruction_HDMAObject_Delete 

HDMAObjInstList_ColorMathCtrlRegB_GameOverMenuGradient:
    dw Instruction_HDMAObject_HDMATableBank : db $81 
    dw Instruction_HDMAObject_PreInstructionInY : dl RTL_8192DB 
    dw $0001, HDMATable_ColorMathCtrlRegB_GameOverMenuGradient 
    dw Instruction_HDMAObject_Sleep 
    dw Instruction_HDMAObject_Delete 

HDMATable_ColorMathCtrlRegB_GameOverMenuGradient:
    db $40,$A1 
    db $3A,$A1
    db $40,$21
    db $40,$21
    db $00,$00

HDMATable_ColorMathSubscnBackdrop_GameOverMenuGradient:
    db $05,$E8 
    db $05,$E7
    db $05,$E6
    db $07,$E5
    db $08,$E4
    db $0A,$E3
    db $0C,$E2
    db $0C,$E1 
    db $40,$E0
    db $05,$C0
    db $0E,$C1
    db $0C,$C2
    db $0C,$C3
    db $08,$C4
    db $07,$C5
    db $06,$C6
    db $06,$C7
    db $06,$C8
    db $06,$C9
    db $07,$CA
    db $06,$CB
    db $06,$CC
    db $06,$CD
    db $06,$CE
    db $02,$CF
    db $00,$00

RTL_8192DB:
    RTL 


Tilemap_GameOver_gameOver:
    dw $000C,$000A,$0026,$000E,$000F,$0000,$002D,$000E 
    dw $000D,$FFFE,$0030,$001A,$0036,$001E,$000F,$0010 
    dw $003E,$001E,$003A,$FFFF 

Tilemap_GameOver_findTheMetroidLarva:
    dw $006F,$0072,$0077,$006D,$000F,$007D,$0071,$006E 
    dw $000F,$0076,$006E,$007D,$007B,$0078,$0072,$006D 
    dw $000F,$0075,$006A,$007B,$007F,$006A,$0084,$FFFF 

Tilemap_GameOver_tryAgain:
    dw $007D,$007B,$0082,$000F,$006A,$0070,$006A,$0072 
    dw $0077,$000F,$0085,$FFFF 

Tilemap_GameOver_yesReturnToGame:
    dw $0041,$000E,$002B,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$FFFE,$0017,$001E,$003B 
    dw $000F,$008A,$007B,$006E,$007D,$007E,$007B,$0077 
    dw $000F,$007D,$0078,$000F,$0070,$006A,$0076,$006E 
    dw $008B,$FFFF 

Tilemap_GameOver_noGoToTitle:
    dw $0027,$000F,$0000,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$FFFE,$0037,$000F,$0010,$000F,$008A,$0070 
    dw $0078,$000F,$007D,$0078,$000F,$007D,$0072,$007D 
    dw $0075,$006E,$008B,$FFFF 

GameOverMenu_Index2_PlayMusicTrack:
    REP #$30 
    JSL.L CheckIfMusicIsQueued 
    BCS .return 
    INC.W $0727 
    LDA.W #$0004 
    JSL.L QueueMusicDataOrTrack_8FrameDelay 

.return:
    RTS 


FileSelectMenu:
    REP #$30 
    PHB 
    PHK 
    PLB 
    LDA.W $0727 
    ASL A 
    TAX 
    JSR.W (.pointers,X) 
    PLB 
    RTL 


.pointers:
    dw FileSelectMenu_Index0_TitleSequenceToMain_FadeOutConfigGfx 
    dw FileSelectMenu_Index1_TitleSequenceToMain_LoadBG2 
    dw FileSelectMenu_Index2_TitleSequenceToMain 
    dw FileSelectMenu_Index3_TitleSequenceToMain_FadeIn 
    dw FileSelectMenu_Index4_Main 
    dw FileSelectMenu_Index5_13_FadeOutFromMain 
    dw FileSelectMenu_Index6_MainToFileCopy_Initialise 
    dw FileSelectMenu_Index7_15_FadeInFromMain 
    dw FileSelectMenu_Index8_FileCopy_SelectSource 
    dw FileSelectMenu_Index9_FileCopy_InitialiseSelectDestination 
    dw FileSelectMenu_IndexA_FileCopy_SelectDestination 
    dw FileSelectMenu_IndexB_FileCopy_InitialiseConfirmation 
    dw FileSelectMenu_IndexC_FileCopy_Confirmation 
    dw FileSelectMenu_Index0_FileCopy_DoFileCopy 
    dw FileSelectMenu_IndexE_FileCopy_CopyCompleted 
    dw FileSelectMenu_IndexF_1B_FadeOutToMain 
    dw FileSelectMenu_Index10_1C_ReloadMain 
    dw FileSelectMenu_Index11_10_FadeInToMain 
    dw FileSelectMenu_Index12_FileCopyToMain_MenuIndex_Main 
    dw FileSelectMenu_Index5_13_FadeOutFromMain 
    dw FileSelectMenu_Index14_MainToFileClear_Initialise 
    dw FileSelectMenu_Index7_15_FadeInFromMain 
    dw FileSelectMenu_Index16_FileClear_SelectSlot 
    dw FileSelectMenu_Index17_FileClear_InitialiseConfirmation 
    dw FileSelectMenu_Index18_FileClear_Confirmation 
    dw FileSelectMenu_Index19_FileClear_DoFileClear 
    dw FileSelectMenu_Index1A_FileClear_ClearCompleted 
    dw FileSelectMenu_IndexF_1B_FadeOutToMain 
    dw FileSelectMenu_Index10_1C_ReloadMain 
    dw FileSelectMenu_Index11_10_FadeInToMain 
    dw FileSelectMenu_Index1E_FileClearToMain_MenuIndex_Main 
    dw FileSelectMenu_Index1F_MainToOptionsMenu_TurnSamusHelmet 
    dw FileSelectMenu_Index20_MainToOptionsMenu_FadeOut 
    dw FileSelectMenu_Index21_MainToTitleSequence 

FileSelectMenu_Index0_TitleSequenceToMain_FadeOutConfigGfx:
    REP #$30 
    JSL.L HandleFadingOut 
    LDA.B $51 
    AND.W #$000F 
    BEQ + 
    RTS 


  + JSL.L SetForceBlankAndWaitForNMI 
    LDA.W #$0001 
    JSL.L QueueSound_Lib3_Max6 
    JSL.L Disable_HDMAObjects 
    JSL.L Wait_End_VBlank_Clear_HDMA 
    INC.W $0727 
    JSR.W MapVRAMForMenu 
    JSR.W LoadInitialMenuTiles 
    REP #$30 
    STZ.B $B1 
    STZ.B $B5 
    STZ.B $B9 
    STZ.B $B3 
    STZ.B $B7 
    STZ.B $BB 

LoadFileSelectPalettes:
    LDX.W #$0000 

.loop:
    LDA.L Menu_Palettes,X : STA.L $7EC000,X 
    LDA.L Menu_Palettes+2,X : STA.L $7EC002,X 
    INX #4
    CPX.W #$0200 
    BMI .loop 
    RTS 


FileSelectMenu_Index20_MainToOptionsMenu_FadeOut:
    REP #$30 
    JSL.L Draw_Menu_Selection_Missile 
    JSL.L Draw_Border_Around_SAMUS_DATA 
    JSR.W Draw_FileSelect_SamusHelmets 
    JSL.L HandleFadingOut 
    LDA.B $51 
    AND.W #$000F 
    BNE .return 
    LDA.W #$0002 : STA.W $0998 
    STZ.W $0727 
    LDY.W #$0000 
    LDA.W #$0000 

.loop:
    STA.W $198D,Y 
    INY #2
    CPY.W #$0030 
    BMI .loop 

.return:
    RTS 


FileSelectMenu_Index21_MainToTitleSequence:
    REP #$30 
    JSL.L Draw_Border_Around_SAMUS_DATA 
    JSR.W Draw_FileSelect_SamusHelmets 
    JSL.L HandleFadingOut 
    LDA.B $51 
    AND.W #$000F 
    BNE .return 
    JML.L SoftReset 


.return:
    RTS 


FileSelectMenu_Index5_13_FadeOutFromMain:
    REP #$30 
    JSL.L Draw_Menu_Selection_Missile 

FileSelectMenu_IndexF_1B_FadeOutToMain:
    JSL.L HandleFadingOut 
    LDA.B $57 
    AND.W #$FF0F 
    STA.B $12 
    LDA.B $51 
    AND.W #$000F 
    ASL #4
    EOR.W #$00F0 
    ORA.B $12 
    STA.B $57 
    LDA.B $51 
    AND.W #$000F 
    BNE .return 
    JSL.L SetForceBlankAndWaitForNMI 
    INC.W $0727 

.return:
    RTS 


FileSelectMenu_Index11_10_FadeInToMain:
    REP #$30 
    LDA.W $0952 
    ASL #2
    TAX 
    LDA.W FileSelectMenu_SelectionMissile_Coordinates_Yposition,X : STA.W $19AB 
    LDA.W FileSelectMenu_SelectionMissile_Coordinates_Xposition,X : STA.W $19A1 

FileSelectMenu_Index7_15_FadeInFromMain:
    REP #$30 
    JSL.L Draw_Menu_Selection_Missile 
    JSL.L HandleFadingIn 
    LDA.B $57 
    AND.W #$FF0F 
    STA.B $12 
    LDA.B $51 
    AND.W #$000F 
    ASL #4
    EOR.W #$00F0 
    ORA.B $12 
    STA.B $57 
    LDA.B $51 
    AND.W #$000F 
    CMP.W #$000F 
    BNE .return 
    INC.W $0727 

.return:
    RTS 


FileSelectMenu_Index6_MainToFileCopy_Initialise:
    REP #$30 
    INC.W $0727 

Initialise_FileSelectMenu_FileCopy:
    JSR.W ClearMenuTilemap 
    LDY.W #Tilemap_FileSelect_dataCopyMode 
    LDX.W #($9<<1)|($1<<6) ; $0052
    STZ.W $0F96 
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates 
    LDY.W #Tilemap_FileSelect_copyWhichData 
    LDX.W #($8<<1)|($5<<6) ; $0150
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates 
    JSR.W LoadMenuExitTilemap 
    JSR.W Draw_FileCopyClear_SaveFileInfo 
    JSR.W SetInitial_FileCopyClear_MenuSelection 
    JSR.W Set_FileCopyMenu_SelectionMissile_Position 
    STZ.W $19B7 
    STZ.W $19B9 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_REP30_819591:
    REP #$30 
endif ; !FEATURE_KEEP_UNREFERENCED

SetInitial_FileCopyClear_MenuSelection:
    LDA.W $0954 
    LDY.W #$0000 

.loop:
    LSR A 
    BCS .return 
    INY 
    CPY.W #$0003 
    BMI .loop 

.return:
    STY.W $19B5 
    RTS 


ClearMenuTilemap:
    LDX.W #$07FE 
    LDA.W #$000F 

.loop:
    STA.L $7E3600,X 
    DEX #2
    BPL .loop 
    RTS 


LoadMenuExitTilemap:
    LDY.W #Tilemap_FileSelect_exit 
    LDX.W #($4<<1)|($1A<<6) ; $0688
    JMP.W Load_Tilemap_in_Y_to_X_Coordinates 


Draw_FileCopyClear_SaveFileInfo:
    LDA.W #$0000 
    JSR.W LoadFromSRAM_external 
    STZ.W $0F96 
    LDA.W $0954 
    BIT.W #$0001 
    BNE + 
    LDA.W #$0400 : STA.W $0F96 

  + JSR.W Draw_FileCopyClear_SaveSlotAInfo 
    LDA.W #$0001 
    JSR.W LoadFromSRAM_external 
    STZ.W $0F96 
    LDA.W $0954 
    BIT.W #$0002 
    BNE + 
    LDA.W #$0400 : STA.W $0F96 

  + JSR.W Draw_FileCopyClear_SaveSlotBInfo 
    LDA.W #$0002 
    JSR.W LoadFromSRAM_external 
    STZ.W $0F96 
    LDA.W $0954 
    BIT.W #$0004 
    BNE + 
    LDA.W #$0400 : STA.W $0F96 

  + JSR.W Draw_FileCopyClear_SaveSlotCInfo 
    JMP.W QueueTransfer_MenuTilemap_ToVRAMBG1 


Draw_FileCopyClear_SaveSlotAInfo:
    LDX.W #$0218 
    LDA.W $0954 
    EOR.W #$FFFF 
    AND.W #$0001 
    JSR.W Draw_FileSelection_Health 
    LDX.W #$0272 
    LDA.W $0954 
    EOR.W #$FFFF 
    AND.W #$0001 
    JSR.W Draw_FileSelection_Time 
    LDY.W #Tilemap_FileSelect_time 
    LDX.W #($1A<<1)|($8<<6) ; $0234
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates 
    LDY.W #Tilemap_FileSelect_SamusA 
    LDX.W #($4<<1)|($8<<6) ; $0208
    JMP.W Load_Tilemap_in_Y_to_X_Coordinates 


Draw_FileCopyClear_SaveSlotBInfo:
    LDX.W #$0318 
    LDA.W $0954 
    EOR.W #$FFFF 
    AND.W #$0002 
    JSR.W Draw_FileSelection_Health 
    LDX.W #$0372 
    LDA.W $0954 
    EOR.W #$FFFF 
    AND.W #$0002 
    JSR.W Draw_FileSelection_Time 
    LDY.W #Tilemap_FileSelect_time 
    LDX.W #($1A<<1)|($C<<6) ; $0334
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates 
    LDY.W #Tilemap_FileSelect_SamusB 
    LDX.W #($4<<1)|($C<<6) ; $0308
    JMP.W Load_Tilemap_in_Y_to_X_Coordinates 


Draw_FileCopyClear_SaveSlotCInfo:
    LDX.W #$0418 
    LDA.W $0954 
    EOR.W #$FFFF 
    AND.W #$0004 
    JSR.W Draw_FileSelection_Health 
    LDX.W #$0472 
    LDA.W $0954 
    EOR.W #$FFFF 
    AND.W #$0004 
    JSR.W Draw_FileSelection_Time 
    LDY.W #Tilemap_FileSelect_time 
    LDX.W #($1A<<1)|($10<<6) ; $0434
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates 
    LDY.W #Tilemap_FileSelect_SamusC 
    LDX.W #($4<<1)|($10<<6) ; $0408
    JMP.W Load_Tilemap_in_Y_to_X_Coordinates 


QueueTransfer_MenuTilemap_ToVRAMBG1:
    LDX.W $0330 
    LDA.W #$0800 : STA.B $D0,X 
    LDA.W #$3600 : STA.B $D2,X 
    LDA.W #$007E : STA.B $D4,X 
    LDA.B $58 
    AND.W #$00FC 
    XBA 
    STA.B $D5,X 
    TXA 
    CLC : ADC.W #$0007 : STA.W $0330 
    RTS 


FileSelectMenu_Index8_FileCopy_SelectSource:
    REP #$30 
    JSL.L Draw_Border_Around_DATA_COPY_MODE 
    JSL.L Draw_Menu_Selection_Missile 
    LDA.B $8F 
    BIT.W #$1080 
    BNE .select 
    BIT.W #$8000 
    BNE .B 
    BIT.W #$0800 
    BNE .up 
    BIT.W #$0400 
    BEQ Set_FileCopyMenu_SelectionMissile_Position 
    SEP #$30 
    LDA.W $0954 
    LDX.W $19B5 

.loopDown:
    INX 
    CPX.B #$04 
    BPL Set_FileCopyMenu_SelectionMissile_Position 
    CPX.B #$03 
    BEQ + 
    BIT.W .bitmasks,X 
    BEQ .loopDown 

  + STX.W $19B5 
    REP #$30 
    LDA.W #$0037 
    JSL.L QueueSound_Lib1_Max6 
    BRA Set_FileCopyMenu_SelectionMissile_Position 

    REP #$30 

.B:
    LDA.W $0727 : CLC : ADC.W #$0007 : STA.W $0727 
    LDA.W #$0037 
    JSL.L QueueSound_Lib1_Max6 
    RTS 


.up:
    SEP #$30 
    LDA.W $0954 
    LDX.W $19B5 

.loopUp:
    DEX 
    BMI Set_FileCopyMenu_SelectionMissile_Position 
    BIT.W .bitmasks,X 
    BEQ .loopUp 
    STX.W $19B5 
    REP #$30 
    LDA.W #$0037 
    JSL.L QueueSound_Lib1_Max6 
    BRA Set_FileCopyMenu_SelectionMissile_Position 


.select:
    REP #$30 
    LDA.W #$0037 
    JSL.L QueueSound_Lib1_Max6 
    LDA.W $19B5 
    CMP.W #$0003 
    BEQ + 
    STA.W $19B7 
    INC.W $0727 
    RTS 


  + LDA.W $0727 : CLC : ADC.W #$0007 : STA.W $0727 
    RTS 


.bitmasks:
    db $01,$02,$04 

Set_FileCopyMenu_SelectionMissile_Position:
    REP #$30 
    LDA.W $19B5 
    ASL A 
    TAX 
    LDA.W .position,X : STA.W $19AB 
    LDA.W #$0016 : STA.W $19A1 
    RTS 


.position:
    dw $0048,$0068,$0088,$00D3 

FileSelectMenu_Index9_FileCopy_InitialiseSelectDestination:
    REP #$30 
    JSL.L Draw_Border_Around_DATA_COPY_MODE 
    JSR.W Draw_FileCopy_SelectDestination_SaveFileInfo 
    INC.W $0727 
    LDA.W #$0000 

.loop:
    CMP.W $19B7 
    BNE + 
    INC A 
    CMP.W #$0003 
    BMI .loop 

  + STA.W $19B5 
    BRA Set_FileCopyMenu_SelectionMissile_Position 


Draw_FileCopy_SelectDestination_SaveFileInfo:
    JSR.W ClearMenuTilemap 
    LDY.W #Tilemap_FileSelect_dataCopyMode 
    LDX.W #($9<<1)|($1<<6) ; $0052
    STZ.W $0F96 
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates 
    LDY.W #Tilemap_FileSelect_copySamusToWhere 
    LDX.W #($4<<1)|($5<<6) ; $0148
    STZ.W $0F96 
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates 
    LDA.W $19B7 : CLC : ADC.W #$206A : STA.L $7E3760 
    JSR.W LoadMenuExitTilemap 
    LDA.W #$0000 
    JSR.W LoadFromSRAM_external 
    LDX.W #$0400 
    LDA.W $19B7 
    BEQ + 
    LDX.W #$0000 

  + TXA 
    STA.W $0F96 
    JSR.W Draw_FileCopyClear_SaveSlotAInfo 
    LDA.W #$0001 
    JSR.W LoadFromSRAM_external 
    LDX.W #$0400 
    LDA.W $19B7 
    CMP.W #$0001 
    BEQ + 
    LDX.W #$0000 

  + TXA 
    STA.W $0F96 
    JSR.W Draw_FileCopyClear_SaveSlotBInfo 
    LDA.W #$0002 
    JSR.W LoadFromSRAM_external 
    LDX.W #$0400 
    LDA.W $19B7 
    CMP.W #$0002 
    BEQ + 
    LDX.W #$0000 

  + TXA 
    STA.W $0F96 
    JSR.W Draw_FileCopyClear_SaveSlotCInfo 
    JMP.W QueueTransfer_MenuTilemap_ToVRAMBG1 


FileSelectMenu_IndexA_FileCopy_SelectDestination:
    REP #$30 
    JSL.L Draw_Border_Around_DATA_COPY_MODE 
    JSL.L Draw_Menu_Selection_Missile 
    LDA.B $8F 
    BIT.W #$1080 
    BNE .select 
    BIT.W #$8000 
    BNE .B 
    BIT.W #$0800 
    BNE .up 
    BIT.W #$0400 
    BEQ .setMissilePosition 
    LDA.W #$0037 
    JSL.L QueueSound_Lib1_Max6 
    LDX.W $19B5 

.loopDown:
    INX 
    CPX.W #$0004 
    BEQ .setMissilePosition 
    CPX.W $19B7 
    BNE .setMenuSelection 
    BRA .loopDown 


.setMenuSelection:
    STX.W $19B5 

.setMissilePosition:
    LDA.W $19B5 
    ASL A 
    TAX 
    LDA.W .positions,X : STA.W $19AB 
    LDA.W #$0016 : STA.W $19A1 
    RTS 


.B:
    LDA.W $0727 : SEC : SBC.W #$0002 : STA.W $0727 
    LDA.W $19B7 : STA.W $19B5 
    LDA.W #$0037 
    JSL.L QueueSound_Lib1_Max6 
    JMP.W Initialise_FileSelectMenu_FileCopy 


.select:
    LDA.W #$0037 
    JSL.L QueueSound_Lib1_Max6 
    LDA.W $19B5 
    CMP.W #$0003 
    BEQ + 
    STA.W $19B9 
    INC.W $0727 
    BRA .setMissilePosition 


  + LDA.W $0727 : CLC : ADC.W #$0005 : STA.W $0727 
    RTS 


.up:
    LDA.W #$0037 
    JSL.L QueueSound_Lib1_Max6 
    LDX.W $19B5 

.loopUp:
    DEX 
    BMI .setMissilePosition 
    CPX.W $19B7 
    BNE .setMenuSelection 
    BRA .loopUp 


.positions:
    dw $0048,$0068,$0088,$00D4 

FileSelectMenu_IndexB_FileCopy_InitialiseConfirmation:
    JSL.L Draw_Border_Around_DATA_COPY_MODE 
    LDY.W #Tilemap_FileSelect_copySamusToSamus 
    LDX.W #($2<<1)|($5<<6) ; $0144
    STZ.W $0F96 
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates 
    LDA.W $19B7 : CLC : ADC.W #$206A : STA.L $7E375C 
    LDA.W $19B9 : CLC : ADC.W #$206A : STA.L $7E3776 
    JSR.W Draw_FileCopyClear_Confirmation 
    INC.W $0727 
    STZ.W $19B5 
    LDA.W #$0008 : STA.W $198F 
    RTS 


Draw_FileCopyClear_Confirmation:
    LDY.W #Tilemap_FileSelect_isThisOK 
    LDX.W #($A<<1)|($14<<6) ; $0514
    STZ.W $0F96 
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates 
    LDY.W #Tilemap_FileSelect_yes 
    LDX.W #($E<<1)|($16<<6) ; $059C
    STZ.W $0F96 
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates 
    LDX.W #$0680 
    LDA.W #$000F 

.loop:
    STA.L $7E3600,X 
    INX #2
    CPX.W #$06C0 
    BMI .loop 
    LDY.W #Tilemap_FileSelect_no 
    LDX.W #($E<<1)|($19<<6) ; $065C
    STZ.W $0F96 
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates 

Draw_FileCopyClear_Confirmation_SaveFileInfo:
    LDA.W #$0000 
    JSR.W LoadFromSRAM_external 
    LDX.W #$0000 
    LDA.W $19B7 
    BEQ + 
    LDA.W $19B9 
    BEQ + 
    LDX.W #$0400 

  + TXA 
    STA.W $0F96 
    JSR.W Draw_FileCopyClear_SaveSlotAInfo 
    LDA.W #$0001 
    JSR.W LoadFromSRAM_external 
    LDX.W #$0000 
    LDA.W $19B7 
    DEC A 
    BEQ + 
    LDA.W $19B9 
    DEC A 
    BEQ + 
    LDX.W #$0400 

  + TXA 
    STA.W $0F96 
    JSR.W Draw_FileCopyClear_SaveSlotBInfo 
    LDA.W #$0002 
    JSR.W LoadFromSRAM_external 
    LDX.W #$0000 
    LDA.W $19B7 
    CMP.W #$0002 
    BEQ + 
    LDA.W $19B9 
    CMP.W #$0002 
    BEQ + 
    LDX.W #$0400 

  + TXA 
    STA.W $0F96 
    JSR.W Draw_FileCopyClear_SaveSlotCInfo 
    JMP.W QueueTransfer_MenuTilemap_ToVRAMBG1 


FileSelectMenu_IndexC_FileCopy_Confirmation:
    JSL.L Draw_Border_Around_DATA_COPY_MODE 
    JSL.L Draw_Menu_Selection_Missile 
    JSR.W HandleFileCopyArrowPalette 
    JSL.L Draw_FileCopy_Arrow 
    LDA.B $8F 
    BIT.W #$0C00 
    BNE .toggle 
    BIT.W #$8000 
    BNE .B 
    BIT.W #$1080 
    BEQ .setMissilePosition 
    LDA.W #$0038 
    JSL.L QueueSound_Lib1_Max6 
    LDA.W $19B5 
    BEQ .yes 
    LDA.W $0727 : SEC : SBC.W #$0004 : STA.W $0727 
    JMP.W Initialise_FileSelectMenu_FileCopy 


.B:
    LDA.W $0727 : SEC : SBC.W #$0003 : STA.W $0727 
    LDA.W $19B9 : STA.W $19B5 
    LDA.W #$0037 
    JSL.L QueueSound_Lib1_Max6 
    RTS 


.yes:
    INC.W $0727 
    RTS 


.toggle:
    LDA.W $19B5 
    EOR.W #$0001 
    STA.W $19B5 
    LDA.W #$0037 
    JSL.L QueueSound_Lib1_Max6 

.setMissilePosition:
    LDY.W #$00B8 
    LDA.W $19B5 
    BEQ + 
    LDY.W #$00D0 

  + STY.W $19AB 
    LDA.W #$005E : STA.W $19A1 
    RTS 


HandleFileCopyArrowPalette:
    LDA.W $198F 
    BEQ .return 
    DEC A 
    STA.W $198F 
    BNE .return 
    LDA.W #$0004 : STA.W $198F 
    LDA.L $7EC122 
    TAY 
    LDX.W #$0000 

.loop:
    LDA.L $7EC124,X : STA.L $7EC122,X 
    INX #2
    CPX.W #$000C 
    BMI .loop 
    TYA 
    STA.L $7EC12E 

.return:
    RTS 


FileSelectMenu_Index0_FileCopy_DoFileCopy:
    JSL.L Draw_Border_Around_DATA_COPY_MODE 
    JSL.L Draw_Menu_Selection_Missile 
    JSR.W HandleFileCopyArrowPalette 
    JSL.L Draw_FileCopy_Arrow 
    LDA.W #$0070 : STA.B $02 
    STA.B $05 
    LDA.W $19B7 
    ASL A 
    TAX 
    LDA.L SaveSlotOffsets,X : STA.B $00 
    LDA.W $19B9 
    ASL A 
    TAX 
    LDA.L SaveSlotOffsets,X : STA.B $03 
    LDY.W #$0000 

.loop:
    LDA.B [$00],Y : STA.B [$03],Y 
    INY #2
    CPY.W #$065C 
    BMI .loop 
    LDA.W $19B7 
    ASL A 
    TAX 
    LDA.L $701FF0,X 
    PHA 
    LDA.L $701FF8,X 
    PHA 
    LDA.L $700000,X 
    PHA 
    LDA.L $700008,X 
    PHA 
    LDA.W $19B9 
    ASL A 
    TAX 
    PLA 
    STA.L $700008,X 
    PLA 
    STA.L $700000,X 
    PLA 
    STA.L $701FF8,X 
    PLA 
    STA.L $701FF0,X 
    INC.W $0727 
    LDX.W #$0500 
    LDA.W #$000F 

.loopRows:
    STA.L $7E3600,X 
    INX #2
    CPX.W #$0740 
    BMI .loopRows 
    LDA.W $19B9 
    ASL A 
    TAX 
    LDA.W $0954 
    ORA.W .list,X 
    STA.W $0954 
    LDA.W $19B9 
    ASL #2
    CLC : ADC.W #$0009 : ASL #6
    CLC : ADC.W #$0018 : TAX 
    LDY.W #$0000 
    LDA.W #$000F 

.loopColumns:
    STA.L $7E3600,X 
    STA.L $7E35C0,X 
    INX #2
    INY #2
    CPY.W #$0016 
    BMI .loopColumns 
    LDY.W #Tilemap_FileSelect_copyCompleted 
    LDX.W #($8<<1)|($14<<6) ; $0510
    STZ.W $0F96 
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates 
    JMP.W Draw_FileCopyClear_Confirmation_SaveFileInfo 


.list:
    dw $0001,$0002,$0004 

FileSelectMenu_IndexE_FileCopy_CopyCompleted:
    JSL.L Draw_Border_Around_DATA_COPY_MODE 
    LDA.B $8F 
    BEQ .return 
    LDA.W #$0037 
    JSL.L QueueSound_Lib1_Max6 
    INC.W $0727 
    LDA.L $701FEC 
    CMP.W #$0000 
    BMI .zero 
    CMP.W #$0003 
    BPL .zero 
    TAX 
    AND.L $701FEE 
    BEQ .validSaveSlot 

.zero:
    LDX.W #$0000 

.validSaveSlot:
    STX.W $0952 

.return:
    RTS 


FileSelectMenu_Index12_FileCopyToMain_MenuIndex_Main:
    LDA.W $0727 : SEC : SBC.W #$000E : STA.W $0727 
    RTS 


FileSelectMenu_Index14_MainToFileClear_Initialise:
    REP #$30 
    JSL.L Draw_Border_Around_DATA_CLEAR_MODE 
    INC.W $0727 

Initialise_FileSelectMenu_FileClear:
    JSR.W ClearMenuTilemap 
    LDY.W #Tilemap_FileSelect_dataClearMode 
    LDX.W #($8<<1)|($1<<6) ; $0050
    STZ.W $0F96 
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates 
    LDY.W #Tilemap_FileSelect_clearWhichData 
    LDX.W #($0<<1)|($5<<6) ; $0140
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates 
    JSR.W LoadMenuExitTilemap 
    JSR.W Draw_FileCopyClear_SaveFileInfo 
    STZ.W $19B7 
    JSR.W SetInitial_FileCopyClear_MenuSelection 
    JSR.W Set_FileClearMenuSelection_MissilePosition 
    RTS 


FileSelectMenu_Index16_FileClear_SelectSlot:
    REP #$30 
    JSL.L Draw_Border_Around_DATA_CLEAR_MODE 
    JSL.L Draw_Menu_Selection_Missile 
    LDA.B $8F 
    BIT.W #$1080 
    BNE .select 
    BIT.W #$8000 
    BNE .exit 
    BIT.W #$0800 
    BNE .up 
    BIT.W #$0400 
    BEQ Set_FileClearMenuSelection_MissilePosition 
    SEP #$30 
    LDA.W $0954 
    LDX.W $19B5 

.loopDown:
    INX 
    CPX.B #$04 
    BPL Set_FileClearMenuSelection_MissilePosition 
    CPX.B #$03 
    BEQ + 
    BIT.W .data,X 
    BEQ .loopDown 

  + STX.W $19B5 
    LDA.B #$37 
    JSL.L QueueSound_Lib1_Max6 
    BRA Set_FileClearMenuSelection_MissilePosition 


.exit:
    REP #$30 
    LDA.W #$0037 
    JSL.L QueueSound_Lib1_Max6 
    LDA.W $0727 : CLC : ADC.W #$0005 : STA.W $0727 
    RTS 


.up:
    SEP #$30 
    LDA.W $0954 
    LDX.W $19B5 

.loopUp:
    DEX 
    BMI Set_FileClearMenuSelection_MissilePosition 
    BIT.W .data,X 
    BEQ .loopUp 
    STX.W $19B5 
    LDA.B #$37 
    JSL.L QueueSound_Lib1_Max6 
    BRA Set_FileClearMenuSelection_MissilePosition 


.select:
    REP #$30 
    LDA.W #$0037 
    JSL.L QueueSound_Lib1_Max6 
    LDA.W $19B5 
    CMP.W #$0003 
    BEQ .exit 
    STA.W $19B7 
    INC.W $0727 
    RTS 


.data:
    db $01,$02,$04 

Set_FileClearMenuSelection_MissilePosition:
    REP #$30 
    LDA.W $19B5 
    ASL A 
    TAX 
    LDA.W .positions,X : STA.W $19AB 
    LDA.W #$0016 : STA.W $19A1 
    RTS 


.positions:
    dw $0048,$0068,$0088,$00D3 

FileSelectMenu_Index17_FileClear_InitialiseConfirmation:
    JSL.L Draw_Border_Around_DATA_CLEAR_MODE 
    LDY.W #Tilemap_FileSelect_clearSamusA 
    LDX.W #($0<<1)|($5<<6) ; $0140
    STZ.W $0F96 
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates 
    LDA.W $19B7 : CLC : ADC.W #$206A : STA.L $7E376A 
    LDA.W #$0003 : STA.W $19B9 
    JSR.W Draw_FileCopyClear_Confirmation 
    INC.W $0727 
    STZ.W $19B5 
    RTS 


FileSelectMenu_Index18_FileClear_Confirmation:
    JSL.L Draw_Border_Around_DATA_CLEAR_MODE 
    JSL.L Draw_Menu_Selection_Missile 
    LDA.B $8F 
    BIT.W #$0C00 
    BNE .toggle 
    BIT.W #$8000 
    BNE .B 
    BIT.W #$1080 
    BEQ .setMissilePosition 
    LDA.W #$0038 
    JSL.L QueueSound_Lib1_Max6 
    LDA.W $19B5 
    BEQ .yes 

.B:
    LDA.W $0727 : SEC : SBC.W #$0002 : STA.W $0727 
    LDA.W $19B7 : STA.W $19B5 
    LDA.W #$0037 
    JSL.L QueueSound_Lib1_Max6 
    JMP.W Initialise_FileSelectMenu_FileClear 


.yes:
    INC.W $0727 
    RTS 


.toggle:
    LDA.W $19B5 
    EOR.W #$0001 
    STA.W $19B5 
    LDA.W #$0037 
    JSL.L QueueSound_Lib1_Max6 

.setMissilePosition:
    LDY.W #$00B8 
    LDA.W $19B5 
    BEQ + 
    LDY.W #$00D0 

  + STY.W $19AB 
    LDA.W #$005E : STA.W $19A1 
    RTS 


FileSelectMenu_Index19_FileClear_DoFileClear:
    REP #$30 
    JSL.L Draw_Border_Around_DATA_CLEAR_MODE 
    LDA.W #$0070 : STA.B $02 
    LDA.W $19B7 
    ASL A 
    TAX 
    LDA.L SaveSlotOffsets,X : STA.B $00 
    LDY.W #$0000 
    LDA.W #$0000 

.loopClear:
    STA.B [$00],Y 
    INY #2
    CPY.W #$065C 
    BMI .loopClear 
    LDA.W $19B7 
    ASL A 
    TAX 
    LDA.W #$0000 : STA.L $700000,X 
    STA.L $700008,X 
    STA.L $701FF0,X 
    STA.L $701FF8,X 
    INC.W $0727 
    JSR.W NewSaveFile 
    LDA.W $19B7 
    JSL.L LoadFromSRAM 
    LDA.W $19B7 : STA.W $079F 
    JSL.L LoadMirrorOfCurrentAreasMapExplored 
    LDX.W #$0500 
    LDA.W #$000F 

.loopRows:
    STA.L $7E3600,X 
    INX #2
    CPX.W #$0740 
    BMI .loopRows 
    LDA.W $19B7 
    ASL A 
    TAX 
    LDA.W $0954 
    AND.W .data,X 
    STA.W $0954 
    LDY.W #Tilemap_FileSelect_dataCleared 
    LDX.W #($0<<1)|($14<<6) ; $0500
    STZ.W $0F96 
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates 
    JMP.W Draw_FileCopyClear_Confirmation_SaveFileInfo 


.data:
    dw $FFFE,$FFFD,$FFFB 

FileSelectMenu_Index1A_FileClear_ClearCompleted:
    JSL.L Draw_Border_Around_DATA_CLEAR_MODE 
    LDA.B $8F 
    BEQ .return 
    LDA.W #$0037 
    JSL.L QueueSound_Lib1_Max6 
    INC.W $0727 
    LDA.W #$0000 
    JSL.L LoadFromSRAM 
    BCS .slotACorrupt 

.selectSlotA:
    LDA.W #$0000 : STA.W $0952 
    RTS 


.slotACorrupt:
    LDA.W #$0001 
    JSL.L LoadFromSRAM 
    BCS + 
    LDA.W #$0001 : STA.W $0952 
    RTS 


  + LDA.W #$0002 
    JSL.L LoadFromSRAM 
    BCS .selectSlotA 
    LDA.W #$0002 : STA.W $0952 

.return:
    RTS 


FileSelectMenu_Index1E_FileClearToMain_MenuIndex_Main:
    JSL.L Draw_Border_Around_SAMUS_DATA 
    LDA.W $0727 : SEC : SBC.W #$001A : STA.W $0727 
    RTS 


FileSelectMenu_Index1F_MainToOptionsMenu_TurnSamusHelmet:
    JSL.L Draw_Menu_Selection_Missile 
    JSL.L Draw_Border_Around_SAMUS_DATA 
    LDX.W #$0004 
    JSR.W Draw_FileSelect_Slot_SamusHelmet 
    LDX.W #$0006 
    JSR.W Draw_FileSelect_Slot_SamusHelmet 
    LDX.W #$0008 
    JSR.W Draw_FileSelect_Slot_SamusHelmet 
    LDA.B $8F 
    BIT.W #$1080 
    BNE .advance 
    LDA.W $199B 
    CMP.W #$0007 
    BNE + 
    LDA.W $1991 
    BEQ .advance 

  + LDA.W $199D 
    CMP.W #$0007 
    BNE + 
    LDA.W $1993 
    BEQ .advance 

  + LDA.W $199F 
    CMP.W #$0007 
    BNE .return 
    LDA.W $1995 
    BNE .return 

.advance:
    INC.W $0727 

.return:
    RTS 


Draw_FileSelect_SamusHelmets:
    LDX.W #$0004 
    LDA.W #$0000 : STA.W $198D,X 
    JSR.W Draw_FileSelect_Slot_SamusHelmet 
    LDX.W #$0006 
    LDA.W #$0000 : STA.W $198D,X 
    JSR.W Draw_FileSelect_Slot_SamusHelmet 
    LDX.W #$0008 
    LDA.W #$0000 : STA.W $198D,X 

Draw_FileSelect_Slot_SamusHelmet:
    PHX 
    PHB 
    PHK 
    PLB 
    LDA.W $198D,X 
    BEQ timerHandled 
    DEC A 
    STA.W $198D,X 
    BNE timerHandled 
    LDA.W #$0008 : STA.W $198D,X 
    LDA.W $1997,X 
    INC A 
    CMP.W #$0008 
    BMI + 
    LDA.W #$0000 : STA.W $198D,X 
    LDA.W #$0007 

  + STA.W $1997,X 

timerHandled:
    LDA.W $1997,X 
    ASL A 
    TAY 
    LDA.W #$0E00 : STA.B $03 
    LDA.W .data,Y 
    PHA 
    LDA.W $19AB,X 
    TAY 
    LDA.W $19A1,X 
    TAX 
    PLA 
    JSL.L AddSpritemapFrom_82C569_TableToOAM 
    PLB 
    PLX 
    RTS 


.data:
    dw $002C,$002D,$002E,$002F,$0030,$0031,$0032,$0033,$0033 

FileSelectMap:
    REP #$30 
    PHB 
    PHK 
    PLB 
    LDA.W $0727 
    ASL A 
    TAX 
    JSR.W (.pointers,X) 
    PLB 
    RTL 


.pointers:
    dw FileSelectMap_Index0_GameOptionsToAreaSelectMap_ClearBG2 
    dw FileSelectMap_Index1_GameOptionsToAreaSelectMap_FadeOut 
    dw FileSelectMap_Index2_11_Load_AreaSelect_ForegroundTilemap 
    dw FileSelectMap_Index3_GameOptionsToAreaSelectMap 
    dw FileSelectMap_Index4_13_PrepareTransitionToAreaSelectMap 
    dw FileSelectMap_Index5_GameOptionsToAreaSelectMap_ExpSqrTrans 
    dw FineSelectMap_Index6_AreaSelectMap 
    dw FileSelectMap_Index7_AreaSelectMapToRoomSelectMap 
    dw FileSelectMap_Index8_AreaSelectMapToRoomSelectMap 
    dw FileSelectMap_Index9_AreaSelectMapToRoomSelectMap_Init 
    dw FileSelectMap_IndexA_RoomSelectMap 
    dw FileSelectMap_IndexB_C_RoomSelectMapToLoadingGameData 
    dw FileSelectMap_IndexB_C_RoomSelectMapToLoadingGameData 
    dw FileSelectMap_IndexD_RoomSelectMapToAreaSelectMap_FadeOut 
    dw FileSelectMap_IndexE_RoomSelectMapToLoadingGameData_Wait 
    dw FileSelectMap_IndexF_RoomSelectMapToAreaSelectMap_ClearBG1 
    dw FileSelectMap_Index10_RoomSelectMapToAreaSelectMap_LoadPal 
    dw FileSelectMap_Index2_11_Load_AreaSelect_ForegroundTilemap 
    dw FileSelectMap_Index12_RoomSelectMapToAreaSelectMap 
    dw FileSelectMap_Index4_13_PrepareTransitionToAreaSelectMap 
    dw FileSelectMap_Index14_PrepContractSquareTransToAreaSelect 
    dw FileSelectMap_Index15_RoomSelectMapToAreaSelectMap 
    dw FileSelectMap_Index16_FileClear_AreaSelectMapToGameOptions 

FileSelectMap_Index16_FileClear_AreaSelectMapToGameOptions:
    JSR.W DrawAreaSelectMapLabels 
    JSL.L HandleFadingOut 
    LDA.B $51 
    AND.W #$000F 
    BNE .return 
    LDA.W #$0002 : STA.W $0998 
    STZ.W $0727 

.return:
    RTS 


FileSelectMenu_Index1_TitleSequenceToMain_LoadBG2:
    REP #$30 
    LDX.W #$07FE 
    LDA.W #$000F 

.loop:
    LDA.L Zebes_and_Stars_Tilemap,X : STA.L $7E3600,X 
    DEX #2
    BPL .loop 
    LDX.W $0330 
    LDA.W #$0800 : STA.B $D0,X 
    LDA.W #$3600 : STA.B $D2,X 
    LDA.W #$007E : STA.B $D4,X 
    LDA.B $59 
    AND.W #$00FC 
    XBA 
    STA.B $D5,X 
    TXA 
    CLC : ADC.W #$0007 : STA.W $0330 
    INC.W $0727 
    LDA.W #$0001 : STA.W $198D 
    STZ.W $1997 
    RTS 


FileSelectMenu_Index2_TitleSequenceToMain:
    REP #$30 
    LDA.L $701FEC 
    CMP.W #$0000 
    BMI + 
    CMP.W #$0003 
    BPL + 
    TAX 
    AND.L $701FEE 
    BEQ .validSaveSlot 

  + LDX.W #$0000 

.validSaveSlot:
    STX.W $0952 

FileSelectMenu_Index10_1C_ReloadMain:
    LDX.W #$07FE 
    LDA.W #$000F 

.loopTilemap:
    STA.L $7E3600,X 
    DEX #2
    BPL .loopTilemap 
    LDA.W #$FFFF : STA.W $0954 
    LDY.W #Tilemap_FileSelect_SamusData 
    LDX.W #($B<<1)|($1<<6) ; $0056
    STZ.W $0F96 
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates 
    LDY.W #Tilemap_FileSelect_SamusA 
    LDX.W #($3<<1)|($5<<6) ; $0146
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates 
    LDA.W #$0000 
    JSR.W LoadFromSRAM_external 
    ROR.W $0954 
    LDX.W #$015C 
    LDA.W $0954 
    BIT.W #$8000 
    JSR.W Draw_FileSelection_Health 
    LDX.W #$01B4 
    LDA.W $0954 
    BIT.W #$8000 
    JSR.W Draw_FileSelection_Time 
    LDY.W #Tilemap_FileSelect_time 
    LDX.W #($1B<<1)|($5<<6) ; $0176
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates 
    LDY.W #Tilemap_FileSelect_SamusB 
    LDX.W #($3<<1)|($A<<6) ; $0286
    STZ.W $0F96 
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates 
    LDA.W #$0001 
    JSR.W LoadFromSRAM_external 
    ROR.W $0954 
    LDX.W #$029C 
    LDA.W $0954 
    BIT.W #$8000 
    JSR.W Draw_FileSelection_Health 
    LDX.W #$02F4 
    LDA.W $0954 
    BIT.W #$8000 
    JSR.W Draw_FileSelection_Time 
    LDY.W #Tilemap_FileSelect_time 
    LDX.W #($1B<<1)|($A<<6) ; $02B6
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates 
    LDY.W #Tilemap_FileSelect_SamusC 
    LDX.W #($3<<1)|($F<<6) ; $03C6
    STZ.W $0F96 
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates 
    LDA.W #$0002 
    JSR.W LoadFromSRAM_external 
    ROR.W $0954 
    LDX.W #$03DC 
    LDA.W $0954 
    BIT.W #$8000 
    JSR.W Draw_FileSelection_Health 
    LDX.W #$0434 
    LDA.W $0954 
    BIT.W #$8000 
    JSR.W Draw_FileSelection_Time 
    LDY.W #Tilemap_FileSelect_time 
    LDX.W #($1B<<1)|($F<<6) ; $03F6
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates 
    LDA.W $0954 
    EOR.W #$FFFF 
    XBA 
    LSR #5
    STA.W $0954 
    CMP.W #$0000 
    BEQ .loadTilemap 
    LDY.W #Tilemap_FileSelect_dataCopy 
    LDX.W #($4<<1)|($14<<6) ; $0508
    STZ.W $0F96 
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates 
    LDY.W #Tilemap_FileSelect_dataClear 
    LDX.W #($4<<1)|($17<<6) ; $05C8
    STZ.W $0F96 
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates 

.loadTilemap:
    LDY.W #Tilemap_FileSelect_exit 
    LDX.W #($4<<1)|($1A<<6) ; $0688
    STZ.W $0F96 
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates 
    JSR.W QueueTransfer_MenuTilemap_ToVRAMBG1 
    LDA.W #$0001 : STA.W $198D 
    DEC A 
    STA.W $198F 
    STA.W $1991 
    STA.W $1993 
    STA.W $1995 
    STA.W $1997 
    STA.W $1999 
    STA.W $199B 
    STA.W $199D 
    STA.W $199F 
    STA.W $19A1 
    STA.W $19AB 
    STA.W $19A3 
    STA.W $19AD 
    LDA.W #$0064 : STA.W $19A5 
    STA.W $19A7 
    STA.W $19A9 
    LDA.W #$002F : STA.W $19AF 
    LDA.W #$0057 : STA.W $19B1 
    LDA.W #$007F : STA.W $19B3 
    LDA.W #$0001 : STA.W $0723 
    STA.W $0725 
    JSL.L ClearForceBlankAndWaitForNMI 
    INC.W $0727 
    STZ.W $19B5 
    STZ.W $19B7 
    STZ.W $19B9 
    RTS 


LoadFromSRAM_external:
    JSL.L LoadFromSRAM 
    RTS 


FileSelectMenu_Index3_TitleSequenceToMain_FadeIn:
    JSR.W Draw_FileSelect_SamusHelmets 
    LDA.W $0952 
    ASL #2
    TAX 
    LDA.W FileSelectMenu_SelectionMissile_Coordinates_Yposition,X : STA.W $19AB 
    LDA.W FileSelectMenu_SelectionMissile_Coordinates_Xposition,X : STA.W $19A1 
    JSL.L Draw_Menu_Selection_Missile 
    JSL.L Draw_Border_Around_SAMUS_DATA 
    JSL.L HandleFadingIn 
    LDA.B $51 
    AND.W #$000F 
    CMP.W #$000F 
    BNE .return 
    INC.W $0727 

.return:
    RTS 


Draw_FileSelection_Health:
    BEQ .zero 
    PHX 
    JSR.W ClearResetOfMenuTilemapRow 
    PLA 
    CLC : ADC.W #$0040 : TAX 
    LDY.W #Tilemap_FileSelect_noData 
    JMP.W Load_Tilemap_in_Y_to_X_Coordinates 


.zero:
    STX.B $1A 
    LDY.W #Tilemap_FileSelect_energy 
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates 
    LDA.B $1A : CLC : ADC.W #$0008 : TAX 
    LDA.W $09C2 : STA.W $4204 
    SEP #$20 
    LDA.B #$64 : STA.W $4206 
    PHA 
    PLA 
    PHA 
    PLA 
    REP #$20 
    LDA.W $4214 : STA.B $14 
    LDA.W $4216 : STA.B $12 
    LDA.W $09C4 : STA.W $4204 
    SEP #$20 
    LDA.B #$64 : STA.W $4206 
    PHA 
    PLA 
    PHA 
    PLA 
    REP #$20 
    LDA.W $4214 : STA.B $16 
    LDA.W #$0007 : STA.B $18 
    TXA 
    CLC : ADC.W #$0040 : TAX 

.loop:
    DEC.B $16 
    BMI .etanksDrawn 
    LDY.W #$0099 
    LDA.B $14 
    BEQ + 
    DEC.B $14 
    LDY.W #$0098 

  + TYA 
    ORA.W $0F96 
    STA.L $7E3600,X 
    INX #2
    DEC.B $18 
    BNE .loop 
    TXA 
    SEC : SBC.W #$004E : TAX 
    LDA.W #$0008 : STA.B $18 
    BRA .loop 


.etanksDrawn:
    LDX.B $1A 
    LDA.B $12 : STA.W $4204 
    SEP #$20 
    LDA.B #$0A : STA.W $4206 
    PHA 
    PLA 
    PHA 
    PLA 
    REP #$20 
    LDA.W $4214 : STA.B $14 
    LDA.W $4216 : STA.B $12 
    LDX.B $1A 
    LDA.B $12 : CLC : ADC.W #$2060 : ORA.W $0F96 
    STA.L $7E3644,X 
    LDA.B $14 : CLC : ADC.W #$2060 : ORA.W $0F96 
    STA.L $7E3642,X 
    RTS 


Draw_FileSelection_Time:
    BNE .return 
    STX.B $1A 
    LDA.W $09E0 : STA.W $4204 
    SEP #$20 
    LDA.B #$0A : STA.W $4206 
    PHA 
    PLA 
    PHA 
    PLA 
    REP #$20 
    LDX.B $1A 
    LDA.W $4216 : CLC : ADC.W #$2060 : ORA.W $0F96 
    STA.L $7E3602,X 
    LDA.W $4214 : CLC : ADC.W #$2060 : ORA.W $0F96 
    STA.L $7E3600,X 
    LDA.B $1A : CLC : ADC.W #$0004 : TAX 
    LDY.W #Tilemap_FileSelect_colon 
    JSR.W Load_Tilemap_in_Y_to_X_Coordinates 
    LDA.W $09DE : STA.W $4204 
    SEP #$20 
    LDA.B #$0A : STA.W $4206 
    PHA 
    PLA 
    PHA 
    PLA 
    REP #$20 
    LDX.B $1A 
    LDA.W $4216 : CLC : ADC.W #$2060 : ORA.W $0F96 
    STA.L $7E3608,X 
    LDA.W $4214 : CLC : ADC.W #$2060 : ORA.W $0F96 
    STA.L $7E3606,X 

.return:
    RTS 


FileSelectMenu_Index4_Main:
    REP #$30 
    JSL.L Draw_Border_Around_SAMUS_DATA 
    JSL.L Draw_Menu_Selection_Missile 
    LDX.W #$0004 
    JSR.W Draw_FileSelect_Slot_SamusHelmet 
    LDX.W #$0006 
    JSR.W Draw_FileSelect_Slot_SamusHelmet 
    LDX.W #$0008 
    JSR.W Draw_FileSelect_Slot_SamusHelmet 
    LDA.B $8F 
    BIT.W #$1080 
    BNE .select 
    BIT.W #$0800 
    BNE .up 
    BIT.W #$0400 
    BEQ + 
    JMP.W .down 


  + BIT.W #$8000 
    BEQ .goto_done 
    LDA.W #$0037 
    JSL.L QueueSound_Lib1_Max6 
    LDA.W #$0021 : STA.W $0727 
    LDA.W #$0037 
    JSL.L QueueSound_Lib1_Max6 

.goto_done:
    JMP.W .done 


.select:
    LDA.W $0952 
    CMP.W #$0003 
    BMI + 
    JMP.W .fileOperation 


  + LDA.W #$002A 
    JSL.L QueueSound_Lib1_Max6 
    LDA.W $0727 : CLC : ADC.W #$001B : STA.W $0727 
    LDA.W $0952 : CLC : ADC.W #$0002 : ASL A 
    TAX 
    LDA.W #$0001 : STA.W $198D,X 
    LDA.W $0952 : STA.L $701FEC 
    EOR.W #$FFFF 
    STA.L $701FEE 
    LDA.W $0952 
    JSL.L LoadFromSRAM 
    BCS + 
    JSL.L LoadMirrorOfCurrentAreasMapExplored 
    BRA .done 


  + JSR.W NewSaveFile 
    STZ.W $0789 
    BRA .done 


.up:
    LDA.W $0954 
    BEQ + 
    LDA.W $0952 
    DEC A 
    BPL .storeSelection 
    LDA.W #$0005 
    BRA .storeSelection 


  + LDA.W $0952 
    DEC A 
    BPL + 
    LDA.W #$0005 
    BRA .storeSelection 


  + CMP.W #$0004 
    BMI .storeSelection 
    LDA.W #$0002 

.storeSelection:
    STA.W $0952 
    BRA .cursorSound 


.down:
    LDA.W $0954 
    BEQ + 
    LDA.W $0952 
    INC A 
    CMP.W #$0006 
    BMI .storeSelection2 
    LDA.W #$0000 
    BRA .storeSelection2 


  + LDA.W $0952 
    INC A 
    CMP.W #$0003 
    BMI .storeSelection2 
    CMP.W #$0006 
    BPL .zero 
    LDA.W #$0005 
    BRA .storeSelection2 


.zero:
    LDA.W #$0000 

.storeSelection2:
    STA.W $0952 

.cursorSound:
    LDA.W #$0037 
    JSL.L QueueSound_Lib1_Max6 

.done:
    LDA.W $0952 
    ASL #2
    TAX 
    LDA.W FileSelectMenu_SelectionMissile_Coordinates_Yposition,X : STA.W $19AB 
    LDA.W FileSelectMenu_SelectionMissile_Coordinates_Xposition,X : STA.W $19A1 
    RTS 


.fileOperation:
    CMP.W #$0003 
    BNE + 
    LDA.W #$0037 
    JSL.L QueueSound_Lib1_Max6 
    INC.W $0727 
    LDA.B $57 
    AND.W #$FF0F 
    ORA.W #$0003 
    STA.B $57 
    RTS 


  + CMP.W #$0004 
    BNE .checkFive 
    LDA.W #$0037 
    JSL.L QueueSound_Lib1_Max6 
    LDA.W $0727 : CLC : ADC.W #$000F : STA.W $0727 
    LDA.B $57 
    AND.W #$FF0F 
    ORA.W #$0003 
    STA.B $57 

.checkFive:
    CMP.W #$0005 
    BNE .return 
    LDA.W #$0021 : STA.W $0727 

.return:
    RTS 


FileSelectMenu_SelectionMissile_Coordinates:
  .Yposition
    dw $0030 
  .Xposition:
    dw       $000E ; Slot A
    dw $0058,$000E ; Slot B
    dw $0080,$000E ; Slot C
    dw $00A3,$000E ; File copy
    dw $00BB,$000E ; File clear
    dw $00D3,$000E ; Exit

FileSelectMap_Index0_GameOptionsToAreaSelectMap_ClearBG2:
    REP #$30 
    JSR.W ClearMenuTilemap 
    LDX.W $0330 
    LDA.W #$0800 : STA.B $D0,X 
    LDA.W #$3600 : STA.B $D2,X 
    LDA.W #$007E : STA.B $D4,X 
    LDA.B $59 
    AND.W #$00FC 
    XBA 
    STA.B $D5,X 
    TXA 
    CLC : ADC.W #$0007 : STA.W $0330 
    LDA.W #$0000 : STA.L $7EC400 
    JSR.W LoadFileSelectPalettes 
    LDX.W #$0000 

.loop:
    LDA.L $7EC000,X : STA.L $7EC200,X 
    INX #2
    CPX.W #$0040 
    BMI .loop 
    LDA.W #$0000 : STA.L $7EC21C 
    STA.L $7EC23C 
    INC.W $0727 
    RTS 


FileSelectMap_Index1_GameOptionsToAreaSelectMap_FadeOut:
    REP #$30 
    LDX.W #$0000 
    LDY.W #$0040 
    JSL.L Advance_GradualColorChange_ofPaletteRAM 
    BCC .return 
    STZ.B $B3 
    STZ.B $B1 
    STZ.B $B7 
    STZ.B $B5 
    LDX.W #$0000 
    LDA.W $079F 

.loopMapAreaIndex:
    CMP.W FileSelectMapArea_IndexTable,X 
    BEQ + 
    INX #2
    CPX.W #$000C 
    BMI .loopMapAreaIndex 
    LDX.W #$0000 

  + TXA 
    LSR A 
    STA.W $0950 
    LDX.W #$0000 

.loopAreaColors:
    PHX 
    CPX.W $079F 
    BEQ .loadForegroundColors 
    JSR.W LoadInactiveAreaMapForegroundColors 
    BRA + 


.loadForegroundColors:
    JSR.W LoadActiveAreaMapForegroundColors 

  + PLX 
    INX 
    CPX.W #$0006 
    BMI .loopAreaColors 
    INC.W $0727 
    STZ.W $0787 
    SEP #$20 
    LDA.B #$02 : STA.B $69 

.return:
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_REP30_81A3D1:
    REP #$30 
endif ; !FEATURE_KEEP_UNREFERENCED

LoadActiveAreaMapForegroundColors:
    TXA 
    ASL A 
    TAX 
    LDA.W AreaSelectMap_ForegroundPaletteTable_indices_active,X 
    TAY 
    BRA LoadAreaMapForegroundColors 


LoadInactiveAreaMapForegroundColors:
    TXA 
    ASL A 
    TAX 
    LDA.W AreaSelectMap_ForegroundPaletteTable_indices_inactive,X 
    TAY 

LoadAreaMapForegroundColors:
    LDA.W AreaSelectMap_ForegroundPaletteTable_data,Y 
    CMP.W #$FFFF 
    BEQ .return 
    PHY 
    PHA 
    LDA.W AreaSelectMap_ForegroundPaletteTable_RAM,Y 
    TAX 
    PLY 
    LDA.W #$0005 : STA.B $12 

.loopColors:
    LDA.W AreaSelectMap_ForgegroundPaletteTable,Y : STA.L $7EC000,X 
    INX #2
    INY #2
    DEC.B $12 
    BNE .loopColors 
    PLY 
    INY #4
    BRA LoadAreaMapForegroundColors 


.return:
    RTS  
AreaSelectMap_ForgegroundPaletteTable:
;              2                              Ch                             16h
    dw $0000, $7FE0,$7EA0,$7D40,$7C00,$4000, $01DB,$0196,$0150,$00EB,$00A5, $033B,$0296,$01F0,$014B,$00A5 ; 0.   Active.   WS-Crateria,  Crateria, Crateria
    dw $0400, $6400,$4C00,$3400,$1C00,$0400, $0013,$000F,$000A,$0006,$0001, $0BB1,$0B0D,$0669,$05A4,$0100 ; 20h. Active.   Maridia,      Norfair,  Brinstar
    dw $0000, $7FE0,$7EA0,$7D40,$7C00,$4000, $6417,$4C12,$380D,$2007,$0802, $5280,$4620,$39C0,$2940,$14A5 ; 40h. Active.   Wrecked Ship, Tourian,  Wrecked Ship
    dw $0000, $35AD,$2D6B,$2529,$18C6,$1084, $4A52,$3DEF,$318C,$2108,$14A5, $56B5,$4A52,$39CE,$2D6B,$1CE7 ; 60h. Inactive. WS-Crateria,  Crateria, Crateria
    dw $0000, $18C6,$14A5,$1084,$0842,$0421, $1084,$0C63,$0842,$0421,$0000, $2108,$1CE7,$14A5,$1084,$0842 ; 80h. Inactive. Maridia,      Norfair,  Brinstar
    dw $0000, $35AD,$2D6B,$2529,$18C6,$1084, $294A,$2108,$1CE7,$14A5,$0C63, $4A52,$3DEF,$318C,$2108,$14A5 ; A0h. Inactive. Wrecked Ship, Tourian,  Wrecked Ship 
AreaSelectMap_ForegroundPaletteTable:
; Area select map foreground palette table indices (relative to $A4E6)
  .indices
  ..active
    dw $0000,$000A,$0010,$0016,$0024,$002A 

  ..inactive
    dw $0030,$003A,$0040,$0046,$0054,$005A 

;        _________ Palette data index (relative to $A40E)
;       |      ___ Palette RAM index (relative to $7E:C000)
;       |     |
  .data
    dw $000C 
  .RAM
    dw       $00AC ; Active - Crateria - orange
    dw $0016,$00B6 ; Active - Crateria - yellow
    dw $FFFF

    dw $0036,$00D6 ; Active - Brinstar
    dw $FFFF

    dw $002C,$00CC ; Active - Norfair
    dw $FFFF

    dw $0002,$00A2 ; Active - Wrecked Ship - part that overlaps with Crateria
    dw $0042,$00E2 ; Active - Wrecked Ship - dark blue
    dw $0056,$00F6 ; Active - Wrecked Ship - light blue
    dw $FFFF

    dw $0022,$00C2 ; Active - Maridia
    dw $FFFF

    dw $004C,$00EC ; Active - Tourian
    dw $FFFF

    dw $006C,$00AC ; Inactive - Crateria - dark greys
    dw $0076,$00B6 ; Inactive - Crateria - light greys
    dw $FFFF

    dw $0096,$00D6 ; Inactive - Brinstar
    dw $FFFF

    dw $008C,$00CC ; Inactive - Norfair
    dw $FFFF

    dw $0062,$00A2 ; Inactive - Wrecked Ship - part that overlaps with Crateria
    dw $00A2,$00E2 ; Inactive - Wrecked Ship - dark greys
    dw $00B6,$00F6 ; Inactive - Wrecked Ship - light greys
    dw $FFFF

    dw $0082,$00C2 ; Inactive - Maridia
    dw $FFFF

    dw $00AC,$00EC ; Inactive - Tourian
    dw $FFFF

FileSelectMap_Index2_11_Load_AreaSelect_ForegroundTilemap:
    REP #$30 
    LDX.W $0330 
    LDA.W #$0800 : STA.B $D0,X 
    LDA.W #Tilemap_AreaSelect_Foreground : STA.B $D2,X 
    LDA.W #$0081 : STA.B $D4,X 
    LDA.B $58 
    AND.W #$00FC 
    XBA 
    STA.B $D5,X 
    TXA 
    CLC : ADC.W #$0007 : STA.W $0330 
    LDA.B $51 
    AND.W #$FF00 
    ORA.W #$000F 
    STA.B $51 
    INC.W $0727 
    RTS 


FileSelectMap_Index12_RoomSelectMapToAreaSelectMap:
    REP #$30 
    INC.W $0727 
    LDY.W $079F 
    BRA Load_AreaSelect_BackgroundTilemap 


FileSelectMap_Index3_GameOptionsToAreaSelectMap:
    REP #$30 
    INC.W $0727 
    LDY.W $079F 

Load_AreaSelect_BackgroundTilemap:
    LDX.W $0330 
    LDA.W #$0800 : STA.B $D0,X 
    TYA 
    XBA 
    ASL #3
    CLC : ADC.W #Tilemap_AreaSelect_Background_Crateria : STA.B $D2,X 
    LDA.W #Tilemap_AreaSelect_Background_Crateria>>16 : STA.B $D4,X 
    LDA.B $5A 
    AND.W #$00FC 
    XBA 
    STA.B $D5,X 
    TXA 
    CLC : ADC.W #$0007 : STA.W $0330 
    RTS 


FileSelectMap_Index4_13_PrepareTransitionToAreaSelectMap:
    SEP #$20 
    LDA.B #$04 : STA.B $6B 
    STA.W $212D 
    LDA.B #$04 : STA.B $6D 
    STA.W $212F 
    LDA.B #$02 : STA.B $6F 
    STA.W $2130 
    LDA.B #$25 : STA.B $72 
    STA.W $2131 
    LDA.B #$80 : STA.B $76 
    LDA.B #$40 : STA.B $75 
    LDA.B #$20 : STA.B $74 
    JSR.W Setup_Initial_ExpandingSquareTransition_HDMA 
    LDA.B #$0C : STA.B $85 
    STA.W $420C 
    JSR.W Config_Window1_ExpandingSquareTransition 
    STZ.W $18B0 
    STZ.W $18B1 
    INC.W $0727 
    REP #$30 
    RTS 


Config_Window1_ExpandingSquareTransition:
    SEP #$20 
    LDA.B #$13 : STA.B $69 
    STA.W $212C 
    LDA.B #$13 : STA.B $6C 
    STA.W $212E 
    LDA.B #$23 : STA.B $60 
    STA.W $2123 
    LDA.B #$03 : STA.B $61 
    STA.W $2124 
    LDA.B #$23 : STA.B $62 
    STA.W $2125 
    RTS 


Setup_Initial_ExpandingSquareTransition_HDMA:
    SEP #$20 
    LDA.B #$00 : STA.L $7E9E20 
    STA.L $7E9E21 
    DEC A 
    STA.L $7E9E22 
    STA.L $7E9E23 
    LDA.B #$7F : STA.L $7E9E32 
    LDA.B #$81 : STA.L $7E9E36 
    LDA.B #$6F : STA.L $7E9E00 
    LDA.B #$22 : STA.L $7E9E01 
    LDA.B #$9E : STA.L $7E9E02 
    LDA.B #$01 : STA.L $7E9E03 
    LDA.B #$32 : STA.L $7E9E04 
    LDA.B #$9E : STA.L $7E9E05 
    LDA.B #$01 : STA.L $7E9E06 
    LDA.B #$32 : STA.L $7E9E07 
    LDA.B #$9E : STA.L $7E9E08 
    LDA.B #$6F : STA.L $7E9E09 
    LDA.B #$20 : STA.L $7E9E0A 
    LDA.B #$9E : STA.L $7E9E0B 
    LDA.B #$40 : STA.W $4320 
    LDA.B #$26 : STA.W $4321 
    LDA.B #$00 : STA.W $4322 
    LDA.B #$9E : STA.W $4323 
    LDA.B #$7E : STA.W $4324 
    STA.W $4327 
    STZ.W $4325 
    STZ.W $4326 
    STZ.W $4328 
    STZ.W $4329 
    STZ.W $432A 
    LDA.B #$6F : STA.L $7E9E10 
    LDA.B #$20 : STA.L $7E9E11 
    LDA.B #$9E : STA.L $7E9E12 
    LDA.B #$01 : STA.L $7E9E13 
    LDA.B #$36 : STA.L $7E9E14 
    LDA.B #$9E : STA.L $7E9E15 
    LDA.B #$01 : STA.L $7E9E16 
    LDA.B #$36 : STA.L $7E9E17 
    LDA.B #$9E : STA.L $7E9E18 
    LDA.B #$6F : STA.L $7E9E19 
    LDA.B #$20 : STA.L $7E9E1A 
    LDA.B #$9E : STA.L $7E9E1B 
    LDA.B #$40 : STA.W $4330 
    LDA.B #$27 : STA.W $4331 
    LDA.B #$10 : STA.W $4332 
    LDA.B #$9E : STA.W $4333 
    LDA.B #$7E : STA.W $4334 
    STA.W $4337 
    STZ.W $4335 
    STZ.W $4336 
    STZ.W $4338 
    STZ.W $4339 
    STZ.W $433A 
    RTS 


ExpandingSquareTransitionSpeed:
    db $04 

FileSelectMap_Index5_GameOptionsToAreaSelectMap_ExpSqrTrans:
    REP #$30 
    JSR.W DrawAreaSelectMapLabels 
    SEP #$20 
    LDA.L $7E9E00 : SEC : SBC.W ExpandingSquareTransitionSpeed : BMI + 
    STA.L $7E9E00 
    STA.L $7E9E09 
    STA.L $7E9E10 
    STA.L $7E9E19 
    LDA.L $7E9E03 : CLC : ADC.W ExpandingSquareTransitionSpeed : STA.L $7E9E03 
    STA.L $7E9E06 
    STA.L $7E9E13 
    STA.L $7E9E16 
    LDA.L $7E9E32 : SEC : SBC.W ExpandingSquareTransitionSpeed : STA.L $7E9E32 
    LDA.L $7E9E36 : CLC : ADC.W ExpandingSquareTransitionSpeed : STA.L $7E9E36 
    RTS 


  + INC.W $0727 
    LDA.B $69 
    AND.B #$FD 
    STA.B $69 
    LDA.B $6C 
    AND.B #$00 
    STA.B $6C 
    LDA.B $6D 
    AND.B #$00 
    STA.B $6D 
    LDA.B #$18 : STA.B $B7 
    LDA.B #$00 : STA.B $B8 
    REP #$30 
    LDA.W #$0001 : STA.W $073B 
    LDX.W #$0000 

.copyTilemap:
    LDA.L Tilemap_BG2PauseScreen_BG2RoomSelectMap_0,X : STA.L $7E4000,X 
    INX #2
    CPX.W #$0640 
    BMI .copyTilemap 
    LDA.W #$2801 

.loopTilemap:
    STA.L $7E4000,X 
    INX #2
    CPX.W #$0800 
    BMI .loopTilemap 
    LDA.W #$4154 : STA.B $00 
    LDA.W #$007E : STA.B $02 
    JSL.L DrawRoomSelectMap_AreaLabel 
    LDY.W #$0140 
    LDX.W #$077E 

.loopMapControls:
    LDA.W Tilemap_RoomSelectMap_Controls,Y : STA.L $7E4000,X 
    DEX #2
    DEY #2
    BNE .loopMapControls 
    LDX.W $0330 
    LDA.W #$0800 : STA.B $D0,X 
    LDA.W #$4000 : STA.B $D2,X 
    LDA.W #$007E : STA.B $D4,X 
    LDA.B $59 
    AND.W #$00FC 
    XBA 
    STA.B $D5,X 
    TXA 
    CLC : ADC.W #$0007 : STA.W $0330 
    RTS 


FineSelectMap_Index6_AreaSelectMap:
    REP #$30 
    LDA.B $8F 
    BIT.W #$0A00 
    BEQ + 
    LDA.W $05D1 
    BEQ .checkB 
    JMP.W FineSelectMap_Index6_AreaSelectMap_Debug 


  + BIT.W #$2500 
    BEQ .checkB 
    LDA.W $05D1 
    BEQ .checkB 
    JMP.W FineSelectMap_Index6_AreaSelectMap_Debug_debugNext 


.checkB:
    BIT.W #$8000 
    BEQ + 
    LDA.W #$0016 : STA.W $0727 
    JMP.W DrawAreaSelectMapLabels 


  + BIT.W #$1080 
    BEQ JMP_DrawAreaSelectMapLabels 
    LDA.W #$0038 
    JSL.L QueueSound_Lib1_Max6 
    JMP.W Select_FileSelectMap_Area 


JMP_DrawAreaSelectMapLabels:
    JMP.W DrawAreaSelectMapLabels 


FineSelectMap_Index6_AreaSelectMap_Debug:
    STZ.B $18 
    LDA.B $16 : STA.B $18 
    LDA.W $0950 
    JSR.W A_equals_A_Minus_1_Mod_6 
    JSR.W Debug_Check_FileSelectMapArea_CanBeSelected 
    BNE .selected 
    LDA.B $1C 
    JSR.W A_equals_A_Minus_1_Mod_6 
    JSR.W Debug_Check_FileSelectMapArea_CanBeSelected 
    BNE .selected 
    LDA.B $1C 
    JSR.W A_equals_A_Minus_1_Mod_6 
    JSR.W Debug_Check_FileSelectMapArea_CanBeSelected 
    BEQ JMP_DrawAreaSelectMapLabels 

.selected:
    LDA.W #$0037 
    JSL.L QueueSound_Lib1_Max6 
    JSR.W Switch_Active_FileSelectMapArea 
    JMP.W DrawAreaSelectMapLabels 


FineSelectMap_Index6_AreaSelectMap_Debug_debugNext:
    LDA.W #$0006 : STA.B $16 
    LDA.W $0950 : STA.B $1C 

.loop:
    LDA.B $1C 
    JSR.W A_equals_A_Plus_1_Mod_6 
    JSR.W Debug_Check_FileSelectMapArea_CanBeSelected 
    BNE .switch 
    DEC.B $16 
    BNE .loop 
    JMP.W DrawAreaSelectMapLabels 


.switch:
    JSR.W Switch_Active_FileSelectMapArea 
    LDA.W #$0037 
    JSL.L QueueSound_Lib1_Max6 
    JMP.W DrawAreaSelectMapLabels 


A_equals_A_Minus_1_Mod_6:
    DEC A 
    BPL .return 
    LDA.W #$0005 

.return:
    RTS 


A_equals_A_Plus_1_Mod_6:
    INC A 
    CMP.W #$0006 
    BMI .return 
    LDA.W #$0000 

.return:
    RTS 


Select_FileSelectMap_Area:
    INC.W $0727 
    LDA.W $05D1 
    BNE .debugEnabled 
    LDA.L $7ED918 : STA.W $079F 
    LDA.L $7ED916 : STA.W $078B 
    JMP.W JMP_DrawAreaSelectMapLabels 


.debugEnabled:
    LDA.W $0950 
    ASL A 
    TAX 
    LDA.W FileSelectMapArea_IndexTable,X : STA.W $079F 
    ASL A 
    TAX 
    LDA.L $7ED8F8,X : STA.B $12 
    LDX.W #$0000 
    LDA.W #$0082 : STA.B $02 
    LDA.W #MapIcon_PositionTablePointers_savePoints : STA.B $00 
    LDA.W $079F 
    ASL A 
    TAY 
    LDA.B [$00],Y 

.crash:
    BEQ .crash 
    STA.B $00 
    LDA.W #$0010 : STA.B $14 

.loopSavesElevators:
    LSR.B $12 
    BCC + 
    TXA 
    ASL #2
    TAY 
    LDA.B [$00],Y 
    CMP.W #$FFFE 
    BEQ + 
    CMP.W #$FFFF 
    BNE .found 
    LDX.W #$FFFF 

  + INX 
    DEC.B $14 
    BNE .loopSavesElevators 
    LDA.W #$0008 

.loopDebugSavePoints:
    TXA 
    ASL #2
    TAY 
    LDA.B [$00],Y 
    CMP.W #$FFFE 
    BEQ + 
    CMP.W #$FFFF 
    BNE .found 
    LDX.W #$FFFF 

  + INX 
    DEC.B $14 
    BNE .loopDebugSavePoints 

.crash2:
    BRA .crash2 


.found:
    STX.W $078B 
    JMP.W JMP_DrawAreaSelectMapLabels 


Debug_Check_FileSelectMapArea_CanBeSelected:
    STA.B $1C 
    ASL A 
    TAX 
    LDA.W FileSelectMapArea_IndexTable,X 
    ASL A 
    TAX 
    LDA.L $7ED8F8,X 
    BNE .return 
    PHB 
    LDA.W #$8200 
    PHA 
    PLB 
    PLB 
    LDA.L MapIcon_PositionTablePointers_savePoints,X : CLC : ADC.W #$0040 : TAX 
    LDA.W $0000,X 
    PLB 
    CMP.W #$FFFF 

.return:
    RTS 


Switch_Active_FileSelectMapArea:
    LDA.W $0950 
    ASL A 
    TAX 
    LDA.W FileSelectMapArea_IndexTable,X 
    TAX 
    JSR.W LoadInactiveAreaMapForegroundColors 
    LDA.B $1C : STA.W $0950 
    ASL A 
    TAX 
    LDA.W FileSelectMapArea_IndexTable,X 
    TAX 
    JSR.W LoadActiveAreaMapForegroundColors 
    LDA.W $0950 
    ASL A 
    TAX 
    LDA.W FileSelectMapArea_IndexTable,X 
    TAY 
    JMP.W Load_AreaSelect_BackgroundTilemap 


DrawAreaSelectMapLabels:
    STZ.B $03 
    LDX.W #$0080 
    LDY.W #$0010 
    LDA.L AreaSelect_SpritemapBaseIndex 
    JSL.L AddSpritemapFrom_82C569_TableToOAM 
    STZ.B $1C 

.loopAreas:
    LDX.W #$0200 
    LDA.B $1C 
    CMP.W $0950 
    BNE + 
    LDX.W #$0000 

  + STX.B $03 
    LDA.B $1C 
    ASL A 
    TAX 
    LDA.W FileSelectMapArea_IndexTable,X 
    ASL A 
    TAX 
    PHB 
    LDA.W #$8200 
    PHA 
    PLB 
    PLB 
    LDA.L $7ED8F8,X : STA.B $24 
    LDA.L MapIcon_PositionTablePointers_savePoints,X 
    TAX 
    LDA.W #$0010 : STA.B $1E 

.loopSavePoints:
    LDA.W $0000,X 
    CMP.W #$FFFF 
    BEQ .PLBNext 
    LSR.B $24 
    BCC + 
    CMP.W #$FFFE 
    BNE .foundUsedSavePoint 

  + TXA 
    CLC : ADC.W #$0004 : TAX 
    DEC.B $1E 
    BNE .loopSavePoints 
    LDA.W $05D1 
    BEQ .PLBNext 
    LDA.W $0000,X 
    CMP.W #$FFFF 
    BEQ .PLBNext 

.foundUsedSavePoint:
    PLB 
    LDA.B $1C 
    ASL A 
    TAX 
    LDA.W FileSelectMapArea_IndexTable,X 
    ASL #2
    TAX 
    LDA.W FileSelectMap_Labels_Positions_Y,X 
    TAY 
    LDA.W FileSelectMap_Labels_Positions_X,X 
    PHA 
    LDA.B $1C 
    ASL A 
    TAX 
    LDA.W FileSelectMapArea_IndexTable,X : CLC : ADC.L AreaSelect_SpritemapBaseIndex : INC A 
    PLX 
    JSL.L AddSpritemapFrom_82C569_TableToOAM 

.next:
    INC.B $1C 
    LDA.B $1C 
    CMP.W #$0006 
    BPL .return 
    JMP.W .loopAreas 


.return:
    RTS 


.PLBNext:
    PLB 
    BRA .next 


FileSelectMap_Labels_Positions:
  .X
    dw $005B 

  .Y
    dw $0032       ; Crateria
    dw $002A,$007F ; Brinstar
    dw $005E,$00B5 ; Norfair
    dw $00CE,$0050 ; Wrecked Ship
    dw $00CE,$009F ; Maridia
    dw $0087,$008B ; Tourian

RoomSelectMap_ExpandingSquare_Velocities:
  .leftSub
    dw $3C00 ; Crateria
  .left
    dw $FFFE 
  .rightSub
    dw $3400 
  .right
    dw $0003 
  .topSub
    dw $0800 
  .top
    dw $FFFF 
  .bottomSub
    dw $0000 
  .bottom
    dw $0004 

    dw $3800,$FFFF,$0000,$0004,$A400,$FFFD,$6800,$0002 ; Brinstar
    dw $F000,$FFFD,$9400,$0003,$0000,$FFFC,$A800,$0001 ; Norfair
    dw $0000,$FFFC,$F800,$0000,$7400,$FFFE,$6800,$0003 ; Wrecked Ship
    dw $0000,$FFFC,$F800,$0000,$EC00,$FFFC,$E000,$0001 ; Maridia
    dw $2000,$FFFC,$7800,$0003,$0000,$FFFC,$5C00,$0003 ; Tourian

RoomSelectMap_ExpandingSquare_Timers:
    dw $0033 
    dw $0035 ; Brinstar
    dw $002D ; Norfair
    dw $0033 ; Wrecked Ship
    dw $0033 ; Maridia
    dw $0022 ; Tourian

FileSelectMapArea_IndexTable:
; Maps file select map area index ($0950) to area index ($079F)
    dw $0000 
    dw $0003 ; Wrecked Ship
    dw $0005 ; Tourian
    dw $0001 ; Brinstar
    dw $0004 ; Maridia
    dw $0002 ; Norfair

FileSelectMap_Index7_AreaSelectMapToRoomSelectMap:
    REP #$30 
    JSR.W DrawAreaSelectMapLabels 
    SEP #$20 
    JSR.W Setup_Initial_ExpandingSquareTransition_HDMA 
    LDA.B #$13 : STA.B $69 
    LDA.B #$13 : STA.B $6C 
    LDA.B #$32 : STA.B $60 
    STA.W $2123 
    LDA.B #$02 : STA.B $61 
    STA.W $2124 
    LDA.B #$05 : STA.B $72 
    STA.W $2131 
    LDA.B #$22 : STA.B $62 
    STA.W $2125 
    LDA.B #$30 : STA.B $5D 
    LDA.B #$00 : STA.L $7E9E09 
    STA.L $7E9E19 
    REP #$30 
    LDA.W #$4154 : STA.B $00 
    LDA.W #$007E : STA.B $02 
    JSL.L DrawRoomSelectMap_AreaLabel 
    LDX.W $0330 
    LDA.W #$0200 : STA.B $D0,X 
    LDA.W #$4000 : STA.B $D2,X 
    LDA.W #$007E : STA.B $D4,X 
    LDA.B $59 
    AND.W #$00FC 
    XBA 
    STA.B $D5,X 
    TXA 
    CLC : ADC.W #$0007 : STA.W $0330 
    LDA.W $079F 
    ASL A 
    TAX 
    LDA.W RoomSelectMap_ExpandingSquare_Timers,X : STA.L $7E9E50 
    TXA 
    ASL A 
    TAX 
    LDA.W FileSelectMap_Labels_Positions_X,X : STA.L $7E9E32 
    STA.L $7E9E36 
    LDA.W FileSelectMap_Labels_Positions_Y,X : STA.L $7E9E3A 
    STA.L $7E9E3E 
    LDA.W #$0000 : STA.L $7E9E30 
    STA.L $7E9E34 
    STA.L $7E9E38 
    STA.L $7E9E3C 
    TXA 
    ASL #2
    TAX 
    LDA.W RoomSelectMap_ExpandingSquare_Velocities_leftSub,X : STA.L $7E9E40 
    LDA.W RoomSelectMap_ExpandingSquare_Velocities_left,X : STA.L $7E9E42 
    LDA.W RoomSelectMap_ExpandingSquare_Velocities_rightSub,X : STA.L $7E9E44 
    LDA.W RoomSelectMap_ExpandingSquare_Velocities_right,X : STA.L $7E9E46 
    LDA.W RoomSelectMap_ExpandingSquare_Velocities_topSub,X : STA.L $7E9E48 
    LDA.W RoomSelectMap_ExpandingSquare_Velocities_top,X : STA.L $7E9E4A 
    LDA.W RoomSelectMap_ExpandingSquare_Velocities_bottomSub,X : STA.L $7E9E4C 
    LDA.W RoomSelectMap_ExpandingSquare_Velocities_bottom,X : STA.L $7E9E4E 
    SEP #$20 
    JSR.W Setup_FileSelectMap_ExpandingSquareTransition_HDMA 
    LDA.B #$0C : STA.B $85 
    STA.W $420C 
    REP #$20 
    INC.W $0727 
    LDA.W #$003B 
    JSL.L QueueSound_Lib1_Max6 
    RTS 


Setup_FileSelectMap_ExpandingSquareTransition_HDMA:
    SEP #$20 
    LDX.W #$0000 
    LDA.L $7E9E3A 
    LDY.W #$9E22 ; $7E
    JSR.W AddExpandingSquareTransition_LeftPos_IndirectHDMATable 
    LDY.W #$9E20 ; $7E
    JSR.W AddExpandingSquareTransition_RightPos_IndirectHDMATable 
    LDA.L $7E9E3E : SEC : SBC.L $7E9E3A : BNE + 
    LDA.B #$01 

  + LDY.W #$9E32 ; $7E
    JSR.W AddExpandingSquareTransition_LeftPos_IndirectHDMATable 
    LDY.W #$9E36 ; $7E
    JSR.W AddExpandingSquareTransition_RightPos_IndirectHDMATable 
    LDA.B #$E0 : SEC : SBC.L $7E9E3E : BNE + 
    LDA.B #$01 

  + LDY.W #$9E22 ; $7E
    JSR.W AddExpandingSquareTransition_LeftPos_IndirectHDMATable 
    LDY.W #$9E20 ; $7E
    JSR.W AddExpandingSquareTransition_RightPos_IndirectHDMATable 
    LDA.B #$00 : STA.L $7E9E00,X 
    STA.L $7E9E10,X 
    RTS 


AddExpandingSquareTransition_LeftPos_IndirectHDMATable:
    PHA 
    PHY 
    PHP 
    SEP #$20 
    BIT.B #$80 
    BNE + 
    STA.L $7E9E00,X 
    REP #$20 
    TYA 
    STA.L $7E9E01,X 
    PLP 
    PLY 
    PLA 
    RTS 

    SEP #$20 

  + SEC : SBC.B #$7F : STA.L $7E9E00,X 
    LDA.B #$7F : STA.L $7E9E03,X 
    REP #$20 
    TYA 
    STA.L $7E9E01,X 
    STA.L $7E9E04,X 
    PLP 
    PLY 
    PLA 
    RTS 


AddExpandingSquareTransition_RightPos_IndirectHDMATable:
    PHP 
    SEP #$20 
    BIT.B #$80 
    BNE + 
    STA.L $7E9E10,X 
    REP #$20 
    TYA 
    STA.L $7E9E11,X 
    INX #3
    PLP 
    RTS 

    SEP #$20 

  + SEC : SBC.B #$7F : STA.L $7E9E10,X 
    LDA.B #$7F : STA.L $7E9E13,X 
    REP #$20 
    TYA 
    STA.L $7E9E11,X 
    STA.L $7E9E14,X 
    TXA 
    CLC : ADC.W #$0006 : TAX 
    PLP 
    RTS 


FileSelectMap_Index8_AreaSelectMapToRoomSelectMap:
    REP #$30 
    JSR.W HandleRoomSelectMap_ExpandingSquareTransition 
    BPL + 
    INC.W $0727 
    SEP #$20 
    LDA.B #$02 : STA.B $69 
    LDA.B #$00 : STA.B $6C 
    STA.B $6D 
    STA.B $6B 

  + REP #$30 
    JSR.W DrawAreaSelectMapLabels 
    RTS 


HandleRoomSelectMap_ExpandingSquareTransition:
    LDA.L $7E9E30 : CLC : ADC.L $7E9E40 : STA.L $7E9E30 
    LDA.L $7E9E32 
    ADC.L $7E9E42 : CMP.W #$0001 
    BPL + 
    LDA.W #$0001 

  + STA.L $7E9E32 
    LDA.L $7E9E34 : CLC : ADC.L $7E9E44 : STA.L $7E9E34 
    LDA.L $7E9E36 
    ADC.L $7E9E46 : CMP.W #$0100 
    BMI + 
    LDA.W #$00FF 

  + STA.L $7E9E36 
    LDA.L $7E9E38 : CLC : ADC.L $7E9E48 : STA.L $7E9E38 
    LDA.L $7E9E3A 
    ADC.L $7E9E4A : CMP.W #$0001 
    BPL + 
    LDA.W #$0001 

  + STA.L $7E9E3A 
    LDA.L $7E9E3C : CLC : ADC.L $7E9E4C : STA.L $7E9E3C 
    LDA.L $7E9E3E 
    ADC.L $7E9E4E : CMP.W #$00E0 
    BMI + 
    LDA.W #$00E0 

  + STA.L $7E9E3E 
    JSR.W Setup_FileSelectMap_ExpandingSquareTransition_HDMA 
    REP #$20 
    LDA.L $7E9E50 
    DEC A 
    STA.L $7E9E50 
    RTS 


FileSelectMap_Index9_AreaSelectMapToRoomSelectMap_Init:
    REP #$30 
    JSL.L LoadMirrorOfCurrentAreasMapExplored 
    JSL.L DrawRoomSelectMap 
    JSL.L LoadFromLoadStation 
    JSL.L Disable_HDMAObjects 
    JSL.L Wait_End_VBlank_Clear_HDMA 
    PHB 
    SEP #$20 
    LDA.B #$8F 
    PHA 
    PLB 
    LDX.W $079B 
    LDA.W $0001,X 
    AND.B #$FF 
    STA.W $079F 
    LDA.W $0002,X 
    AND.B #$FF 
    STA.W $07A1 
    LDA.W $0003,X 
    AND.B #$FF 
    STA.W $07A3 
    PLB 
    REP #$20 
    JSL.L Setup_MapScrolling_for_FileSelectMap 
    LDA.W $05B0 : CLC : ADC.W #$0018 : STA.W $05B0 
    LDA.W #$0018 : STA.B $B7 
    LDA.B $69 
    AND.W #$FFFB 
    STA.B $69 
    INC.W $0727 
    STZ.W $05FD 
    STZ.W $05FF 
    STZ.W $0776 
    STZ.W $0778 
    STZ.W $077A 
    RTS 


FileSelectMap_IndexA_RoomSelectMap:
    REP #$30 
    JSL.L Draw_FileSelectMap_Icons 
    JSR.W Handle_FileSelectMap_ScrollArrows 
    JSL.L MapScrolling 
    JSL.L Display_Map_Elevator_Destinations 
    LDA.W $05D1 
    BEQ + 
    LDA.B $91 
    BIT.W #$2000 
    BNE .debug 

  + LDA.B $8F 
    BIT.W #$8000 
    BNE .exit 
    BIT.W #$1080 
    BEQ .earlyReturn 
    INC.W $0727 
    LDA.W #$0038 
    JSL.L QueueSound_Lib1_Max6 

.earlyReturn:
    RTS 


.exit:
    LDA.W $0727 : CLC : ADC.W #$0005 : STA.W $0727 
    LDX.W #$0000 
    LDA.W $079F 

.loopMapAreaIndex:
    CMP.W FileSelectMapArea_IndexTable,X 
    BEQ + 
    INX #2
    CPX.W #$000C 
    BMI .loopMapAreaIndex 
    STZ.W $0950 
    RTS 


  + TXA 
    LSR A 
    STA.W $0950 
    LDA.W #$003C 
    JSL.L QueueSound_Lib1_Max6 
    RTS 


.debug:
    LDA.W #$0038 
    JSL.L QueueSound_Lib1_Max6 
    PHB 
    SEP #$20 
    LDA.B #$82 : STA.B $02 
    PHA 
    PLB 
    REP #$20 
    LDA.W $079F 
    ASL A 
    TAX 
    LDA.L $7ED8F8,X : STA.B $18 
    LDA.W $078B 

.loopIndex:
    LSR.B $18 
    DEC A 
    BPL .loopIndex 
    LDA.W $079F 
    ASL A 
    CLC : ADC.W #MapIcon_PositionTablePointers_savePoints : TAX 
    LDA.W $0000,X 

.crash:
    BEQ .crash 
    STA.B $00 
    LDA.W $078B 
    ASL #2
    TAY 
    LDA.B [$00],Y : STA.B $12 
    INY #2
    LDA.B [$00],Y : STA.B $14 
    LDA.W $078B 
    CMP.W #$0010 
    BPL .debugSavePoints 
    BRA .savesElevators 


.loopSavesElevators:
    LSR.B $18 
    BCC .savesElevators 
    LDA.W $078B 
    ASL #2
    TAY 
    LDA.B [$00],Y 
    CMP.W #$FFFE 
    BEQ .savesElevators 
    CMP.W #$FFFF 
    BNE .found 

.savesElevators:
    INC.W $078B 
    LDA.W $078B 
    CMP.W #$0010 
    BMI .loopSavesElevators 

.loopDebugSavePoints:
    LDA.W $078B 
    ASL #2
    TAY 
    LDA.B [$00],Y 
    CMP.W #$FFFF 
    BEQ .finishedDebugSavePoints 
    CMP.W #$FFFE 
    BNE .found 

.debugSavePoints:
    INC.W $078B 
    BRA .loopDebugSavePoints 


.finishedDebugSavePoints:
    STZ.W $078B 
    LDA.W $079F 
    ASL A 
    TAX 
    LDA.L $7ED8F8,X : STA.B $18 
    BRA .loopSavesElevators 


.found:
    LDA.W $078B 
    ASL #2
    TAY 
    LDA.B [$00],Y 
    CMP.B $B1 
    BMI + 
    SEC : SBC.W #$0100 : CMP.B $B1 
    BMI .noXScroll 

  + LDA.B [$00],Y : SEC : SBC.B $12 : CLC : ADC.B $B1 : BPL + 
    LDA.W #$0000 
    BRA .storeXScroll 


  + CMP.W $05AC 
    BMI .storeXScroll 
    LDA.W $05AC 

.storeXScroll:
    STA.B $B1 

.noXScroll:
    INY #2
    LDA.B [$00],Y 
    CMP.B $B3 
    BMI + 
    SEC : SBC.W #$00A1 : CMP.B $B3 
    BMI .return 

  + LDA.B [$00],Y : SEC : SBC.B $14 : CLC : ADC.B $B3 : CMP.W $05B0 
    BMI + 
    LDA.W $05B0 

  + STA.B $B3 

.return:
    PLB 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_REP30_81AEC8:
    REP #$30 
endif ; !FEATURE_KEEP_UNREFERENCED

Handle_FileSelectMap_ScrollArrows:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$20 
    LDA.W $05AC : SEC : SBC.W #$0018 : CMP.B $B1 
    BPL + 
    LDX.W #MapScroll_ArrowData_mapScrollDirection_left 
    JSL.L Draw_MapScrollArrow_and_Check_Scroll_in_that_Direction 

  + LDA.W $05AE : CLC : ADC.W #$0018 : SEC : SBC.W #$0100 : CMP.B $B1 
    BMI + 
    LDX.W #MapScroll_ArrowData_mapScrollDirection_right 
    JSL.L Draw_MapScrollArrow_and_Check_Scroll_in_that_Direction 

  + LDA.W $05B0 : SEC : SBC.W #$0040 : CMP.B $B3 
    BPL + 
    LDX.W #MapScroll_ArrowData_mapScrollDirection_up 
    JSL.L Draw_MapScrollArrow_and_Check_Scroll_in_that_Direction 

  + LDA.W $05B2 : SEC : SBC.W #$0091 : CMP.B $B3 
    BMI .cancelScrollDown 
    LDX.W #MapScroll_ArrowData_mapScrollDirection_down 
    JSL.L Draw_MapScrollArrow_and_Check_Scroll_in_that_Direction 

.return:
    PLB 
    PLP 
    RTS 


.cancelScrollDown:
    LDA.W $05FD 
    CMP.W MapScroll_ArrowData_mapScrollDirection_end 
    BNE .return 
    STZ.W $05FB 
    STZ.W $05FD 
    STZ.W $05FF 
    BRA .return 


MapScroll_ArrowData_mapScrollDirection:
;        ___________________________ X position
;       |      _____________________ Y position
;       |     |      _______________ Pause screen animation ID
;       |     |     |      _________ Necessary input
;       |     |     |     |      ___ Map scrolling direction
;       |     |     |     |     |
  .left
    dw $0010,$0060,$0009,$0200,$0001 

  .right
    dw $00F0,$0060,$0008,$0100,$0002 

  .up
    dw $0080,$0020,$0006,$0800,$0003 

  .down
    dw $0080,$00A0,$0007,$0400 

  .end
    dw $0004 

FileSelectMap_IndexB_C_RoomSelectMapToLoadingGameData:
    JSL.L Draw_FileSelectMap_Icons 
    JSL.L Display_Map_Elevator_Destinations 
    INC.W $0727 
    RTS 


FileSelectMap_IndexD_RoomSelectMapToAreaSelectMap_FadeOut:
    JSL.L Draw_FileSelectMap_Icons 
    JSL.L Display_Map_Elevator_Destinations 
    JSL.L HandleFadingOut 
    LDA.B $51 
    AND.W #$000F 
    BNE .return 
    INC.W $0727 
    LDA.W #$0020 : STA.W $0F7A 

.return:
    RTS 


FileSelectMap_IndexE_RoomSelectMapToLoadingGameData_Wait:
    LDA.W $0F7A 
    DEC A 
    STA.W $0F7A 
    BNE .return 
    JSL.L SetForceBlankAndWaitForNMI 
    INC.W $0998 
    STZ.W $0727 

.return:
    RTS 


FileSelectMap_IndexF_RoomSelectMapToAreaSelectMap_ClearBG1:
    SEP #$20 
    LDA.B #$12 : STA.B $69 
    REP #$30 
    LDA.W #$000F 
    LDX.W #$07FE 

.loop:
    STA.L $7E3000,X 
    DEX #2
    BPL .loop 
    LDX.W $0330 
    LDA.W #$0800 : STA.B $D0,X 
    LDA.W #$3000 : STA.B $D2,X 
    LDA.W #$007E : STA.B $D4,X 
    LDA.B $58 
    AND.W #$00FC 
    XBA 
    STA.B $D5,X 
    TXA 
    CLC : ADC.W #$0007 : STA.W $0330 
    INC.W $0727 
    RTS 


FileSelectMap_Index10_RoomSelectMapToAreaSelectMap_LoadPal:
    REP #$30 
    JSR.W LoadMenuPalettes 
    LDX.W #$0000 

.loop:
    PHX 
    JSR.W LoadInactiveAreaMapForegroundColors 
    PLX 
    INX 
    CPX.W #$0006 
    BMI .loop 
    LDX.W $079F 
    JSR.W LoadActiveAreaMapForegroundColors 
    LDY.W $079F 
    JSR.W Load_AreaSelect_BackgroundTilemap 
    INC.W $0727 
    RTS 


FileSelectMap_Index14_PrepContractSquareTransToAreaSelect:
    SEP #$20 
    LDA.B #$00 : STA.B $85 
    REP #$30 
    LDA.W #$003C 
    JSL.L QueueSound_Lib1_Max6 
    LDA.W $079F 
    ASL A 
    TAX 
    LDA.W RoomSelectMap_ExpandingSquare_Timers,X : SEC : SBC.W #$000C : STA.L $7E9E50 
    TXA 
    ASL #3
    TAX 
    LDA.W RoomSelectMap_ExpandingSquare_Velocities_leftSub,X : STA.L $7E9E40 
    LDA.W RoomSelectMap_ExpandingSquare_Velocities_left,X : STA.L $7E9E42 
    LDA.W RoomSelectMap_ExpandingSquare_Velocities_rightSub,X : STA.L $7E9E44 
    LDA.W RoomSelectMap_ExpandingSquare_Velocities_right,X : STA.L $7E9E46 
    LDA.W RoomSelectMap_ExpandingSquare_Velocities_topSub,X : STA.L $7E9E48 
    LDA.W RoomSelectMap_ExpandingSquare_Velocities_top,X : STA.L $7E9E4A 
    LDA.W RoomSelectMap_ExpandingSquare_Velocities_bottomSub,X : STA.L $7E9E4C 
    LDA.W RoomSelectMap_ExpandingSquare_Velocities_bottom,X : STA.L $7E9E4E 
    LDA.W #$0008 : STA.L $7E9E32 
    LDA.W #$00F8 : STA.L $7E9E36 
    LDA.W #$0008 : STA.L $7E9E3A 
    LDA.W #$00D8 : STA.L $7E9E3E 
    LDA.W #$0000 : STA.L $7E9E30 
    STA.L $7E9E34 
    STA.L $7E9E38 
    STA.L $7E9E3C 
    JSR.W Setup_FileSelectMap_ExpandingSquareTransition_HDMA 
    INC.W $0727 
    SEP #$20 
    LDA.B #$0C : STA.B $85 
    STA.W $420C 
    LDA.B #$32 : STA.B $60 
    STA.W $2123 
    LDA.B #$02 : STA.B $61 
    STA.W $2124 
    LDA.B #$30 : STA.B $5D 
    LDA.B #$22 : STA.B $62 
    LDA.B #$00 : STA.L $7E9E09 
    STA.L $7E9E19 
    LDA.B #$00 : STA.B $B3 
    STA.B $B4 
    STA.B $B1 
    STA.B $B2 
    RTS 


FileSelectMap_Index15_RoomSelectMapToAreaSelectMap:
    REP #$30 
    LDA.L $7E9E30 : SEC : SBC.L $7E9E40 : STA.L $7E9E30 
    LDA.L $7E9E32 
    SBC.L $7E9E42 : STA.L $7E9E32 
    LDA.L $7E9E34 : SEC : SBC.L $7E9E44 : STA.L $7E9E34 
    LDA.L $7E9E36 
    SBC.L $7E9E46 : STA.L $7E9E36 
    LDA.L $7E9E38 : SEC : SBC.L $7E9E48 : STA.L $7E9E38 
    LDA.L $7E9E3A 
    SBC.L $7E9E4A : STA.L $7E9E3A 
    LDA.L $7E9E3C : SEC : SBC.L $7E9E4C : STA.L $7E9E3C 
    LDA.L $7E9E3E 
    SBC.L $7E9E4E : STA.L $7E9E3E 
    JSR.W Setup_FileSelectMap_ExpandingSquareTransition_HDMA 
    REP #$20 
    JSR.W DrawAreaSelectMapLabels 
    LDA.L $7E9E50 
    DEC A 
    STA.L $7E9E50 
    BPL .return 
    LDA.W $0727 : SEC : SBC.W #$000F : STA.W $0727 
    SEP #$20 
    LDA.B #$11 : STA.B $69 
    LDA.B #$00 : STA.B $6C 
    STA.B $6D 

.return:
    RTS 


Tilemap_RoomSelectMap_Controls:
    dw $2801,$2801,$2801,$2801,$2801,$2801,$2801,$2801 
    dw $2801,$2801,$2801,$2801,$2801,$2801,$2801,$2801 
    dw $2801,$2801,$2801,$2801,$2801,$2801,$2801,$2801 
    dw $2801,$2801,$2801,$2801,$2801,$2801,$2801,$2801 
    dw $2801,$2801,$2801,$2801,$2801,$2801,$2801,$2801 
    dw $2801,$2801,$2801,$2801,$2801,$2801,$2801,$2801 
    dw $2801,$2801,$2801,$2801,$2801,$2801,$2801,$2801 
    dw $2801,$2801,$2801,$2801,$2801,$2801,$2801,$2801 
    dw $2801,$2801,$2801,$28B6,$28B7,$283C,$2830,$283F 
    dw $2801,$2801,$2801,$2801,$2801,$2850,$6850,$2801 
    dw $2801,$2801,$2801,$2801,$2801,$2801,$2851,$2852 
    dw $2801,$2801,$2801,$2801,$2801,$2801,$2801,$2801 
    dw $2801,$2801,$2801,$28C6,$28C7,$2842,$2832,$2841 
    dw $283E,$283B,$283B,$2801,$2801,$2860,$6860,$2842 
    dw $2843,$2830,$2841,$2843,$2801,$2801,$2861,$2862 
    dw $2832,$2830,$283D,$2832,$2834,$283B,$2801,$2801 
    dw $2801,$2801,$2801,$2801,$2801,$2801,$2801,$2801 
    dw $2801,$2801,$2801,$2801,$2801,$2801,$2801,$2801 
    dw $2801,$2801,$2801,$2801,$2801,$2801,$2801,$2801 
    dw $2801,$2801,$2801,$2801,$2801,$2801,$2801,$2801 
    dw $2801,$2801,$2801,$2801,$2801,$2801,$2801,$2801 
    dw $2801,$2801,$2801,$2801,$2801,$2801,$2801,$2801 
    dw $2801,$2801,$2801,$2801,$2801,$2801,$2801,$2801 
    dw $2801,$2801,$2801,$2801,$2801,$2801,$2801,$2801 

NewSaveFile:
    REP #$30 
    LDA.W #$0063 : STA.W $09C4 
    STA.W $09C2 
    LDA.W #$0000 : STA.W $09C8 
    STA.W $09C6 
    LDA.W #$0000 : STA.W $09CC 
    STA.W $09CA 
    LDA.W #$0000 : STA.W $09D0 
    STA.W $09CE 
    STZ.W $09D2 
    STZ.W $09A8 
    STZ.W $09A6 
    STZ.W $09A4 
    STZ.W $09A2 
    STZ.W $09C0 
    STZ.W $09D4 
    STZ.W $09D6 
    STZ.W $09D8 
    LDA.W #$0800 : STA.W $09AA 
    LDA.W #$0400 : STA.W $09AC 
    LDA.W #$0200 : STA.W $09AE 
    LDA.W #$0100 : STA.W $09B0 
    LDA.W #$0080 : STA.W $09B4 
    LDA.W #$8000 : STA.W $09B6 
    LDA.W #$0040 : STA.W $09B2 
    LDA.W #$4000 : STA.W $09B8 
    LDA.W #$2000 : STA.W $09BA 
    LDA.W #$0010 : STA.W $09BE 
    LDA.W #$0020 : STA.W $09BC 
    STZ.W $09DA 
    STZ.W $09DC 
    STZ.W $09DE 
    STZ.W $09E0 
    STZ.W $09E2 
    STZ.W $09E4 
    STZ.W $09EA 
    LDA.W #$0001 : STA.W $09E6 
    STA.W $09E8 
    LDX.W #$0000 
    LDA.W #$0000 

.loopClearEvents:
    STA.L $7ED830,X 
    STA.L $7ED870,X 
    STA.L $7ED870,X 
    STA.L $7ED8B0,X 
    STA.L $7ED8F0,X 
    STA.L $7ED908,X 
    STA.L $7ED8F8,X 
    STA.L $7ED900,X 
    INX #2
    CPX.W #$0008 
    BMI .loopClearEvents 
    LDA.W #$0000 

.loopClearEventsAgain:
    STA.L $7ED830,X 
    STA.L $7ED870,X 
    STA.L $7ED870,X 
    STA.L $7ED8B0,X 
    INX #2
    CPX.W #$0040 
    BMI .loopClearEventsAgain 
    LDX.W #$0000 
    LDA.W #$0000 

.loopClearMapData:
    STA.L $7ECD52,X 
    INX #2
    CPX.W #$0700 
    BMI .loopClearMapData 
    RTS 


ClearResetOfMenuTilemapRow:
    TXA 
    AND.W #$003F 
    LSR A 
    SEC : SBC.W #$0020 : EOR.W #$FFFF 
    INC A 
    STA.B $12 
    LDA.W #$000F 

.loop:
    STA.L $7E3600,X 
    INX #2
    DEC.B $12 
    BNE .loop 
    RTS 


Load_Tilemap_in_Y_to_X_Coordinates:
    PHX 

.loop:
    LDA.W $0000,Y 
    CMP.W #$FFFE 
    BEQ + 
    CMP.W #$FFFF 
    BEQ .return 
    ORA.W $0F96 
    STA.L $7E3600,X 
    INX #2
    INY #2
    BRA .loop 


  + INY #2
    PLA 
    CLC : ADC.W #$0040 : TAX 
    PHA 
    BRA .loop 


.return:
    PLX 
    RTS 


Tilemap_FileSelect_SamusData:
    dw $202B,$200A,$2026,$202D,$202B,$200F,$200D,$200A,$202C,$200A,$FFFE 
    dw $203B,$201A,$2036,$2010,$203B,$200F,$201D,$201A,$2011,$201A,$FFFF 

Tilemap_FileSelect_SamusA:
    dw $202B,$200A,$2026,$202D,$202B,$200F,$200A,$FFFE 
    dw $203B,$201A,$2036,$2010,$203B,$200F,$201A,$FFFF 

Tilemap_FileSelect_SamusB:
    dw $202B,$200A,$2026,$202D,$202B,$200F,$200B,$FFFE 
    dw $203B,$201A,$2036,$2010,$203B,$200F,$201B,$FFFF 

Tilemap_FileSelect_SamusC:
    dw $202B,$200A,$2026,$202D,$202B,$200F,$200C,$FFFE 
    dw $203B,$201A,$2036,$2010,$203B,$200F,$201C,$FFFF 

Tilemap_FileSelect_energy:
    dw $209D,$209E,$209F,$20CC,$FFFF 

Tilemap_FileSelect_time:
    dw $20AD,$20AE,$20AF,$FFFF 

Tilemap_FileSelect_colon:
    dw $208C,$FFFF 

Tilemap_FileSelect_noData:
    dw $000F,$2077,$2078,$200F,$206D,$206A,$207D,$206A 
    dw $200F,$200F,$200F,$FFFF 

Tilemap_FileSelect_dataCopy:
    dw $206D,$206A,$207D,$206A,$200F,$206C,$2078,$2079 
    dw $2082,$FFFF 

Tilemap_FileSelect_dataClear:
    dw $206D,$206A,$207D,$206A,$200F,$206C,$2075,$206E 
    dw $206A,$207B,$FFFF 

Tilemap_FileSelect_exit:
    dw $206E,$2081,$2072,$207D,$FFFF 

Tilemap_FileSelect_dataCopyMode:
    dw $000D,$200A,$202C,$200A,$200F,$200C,$2000,$200D 
    dw $2041,$200F,$2026,$2000,$200D,$200E,$FFFE,$201D 
    dw $201A,$2011,$201A,$200F,$201C,$2010,$2038,$2017 
    dw $200F,$2036,$2010,$201D,$201E,$FFFF 

Tilemap_FileSelect_dataClearMode:
    dw $000D,$000A,$002C,$000A,$000F,$000C,$0025,$000E 
    dw $000A,$000D,$000F,$0026,$0000,$000D,$000E,$FFFE 
    dw $001D,$001A,$0011,$001A,$000F,$001C,$0035,$001E 
    dw $001A,$003A,$000F,$0036,$0010,$001D,$001E,$FFFF 

Tilemap_FileSelect_copyWhichData:
    dw $206C,$2078,$2079,$2082,$200F,$2080,$2071,$2072 
    dw $206C,$2071,$200F,$206D,$206A,$207D,$206A,$2085 
    dw $FFFF 

Tilemap_FileSelect_copySamusToWhere:
    dw $206C,$2078,$2079,$2082,$200F,$208A,$207C,$206A 
    dw $2076,$207E,$207C,$200F,$200F,$208B,$200F,$207D 
    dw $2078,$200F,$2080,$2071,$206E,$207B,$206E,$2085 
    dw $FFFF 

Tilemap_FileSelect_copySamusToSamus:
    dw $206C,$2078,$2079,$2082,$200F,$208A,$207C,$206A 
    dw $2076,$207E,$207C,$200F,$200F,$208B,$200F,$207D 
    dw $2078,$200F,$208A,$207C,$206A,$2076,$207E,$207C 
    dw $200F,$200F,$208B,$2088,$FFFF 

Tilemap_FileSelect_isThisOK:
    dw $2072,$207C,$200F,$207D,$2071,$2072,$207C,$200F 
    dw $2078,$2074,$2085,$FFFF 

Tilemap_FileSelect_yes:
    dw $2041,$200E,$202B,$FFFE 
    dw $2017,$201E,$203B,$FFFF

Tilemap_FileSelect_no:
    dw $2027,$200F,$2000,$FFFE 
    dw $2037,$200F,$2010,$FFFF

Tilemap_FileSelect_copyCompleted:
    dw $206C,$2078,$2079,$2082,$200F,$206C,$2078,$2076 
    dw $2079,$2075,$206E,$207D,$206E,$206D,$2088,$FFFF 

Tilemap_FileSelect_clearWhichData:
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$006C 
    dw $0075,$006E,$006A,$007B,$000F,$0080,$0071,$0072 
    dw $006C,$0071,$000F,$006D,$006A,$007D,$006A,$0085 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$FFFF 

Tilemap_FileSelect_clearSamusA:
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $006C,$0075,$006E,$006A,$007B,$000F,$008A,$007C 
    dw $006A,$0076,$007E,$007C,$000F,$006A,$008B,$0088 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$FFFF 

Tilemap_FileSelect_dataCleared:
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $006D,$006A,$007D,$006A,$000F,$006C,$0075,$006E 
    dw $006A,$007B,$006E,$006D,$0088,$0088,$0088,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$FFFF 

Tilemap_AreaSelect_Foreground:
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$15AD,$15AE 
    dw $55AD,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$15AD,$15AE,$95CC,$15BC 
    dw $15D5,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $15AD,$15AE,$15DA,$15A8,$55A7,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$15BB,$15BC,$15D5,$15C8 
    dw $15DB,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $15BB,$15BC,$15D5,$15B6,$15B7,$000F,$1DA1,$1DA2 
    dw $5DA1,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$15DC,$15C8,$15CF,$15A8 
    dw $55A7,$000F,$15A7,$15A8,$55A7,$000F,$15A7,$15A8 
    dw $55CB,$15AE,$55CA,$15A8,$55AA,$1DA2,$9DA6,$1DB0 
    dw $1DD4,$1DAE,$5DAD,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$55D0,$55A8,$95AC,$15B6 
    dw $15AC,$15A8,$15D3,$15BC,$55D3,$15A8,$15D3,$15AE 
    dw $95CC,$15BC,$15D5,$15B6,$15B7,$1DB0,$1DA6,$1DA2 
    dw $1DBB,$1DBC,$1DD5,$1DA2,$5DA1,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$15B5,$15B6,$15AC,$15A8 
    dw $15D3,$15AE,$15CC,$15AE,$95CC,$15AE,$95CC,$15BC 
    dw $15D5,$15C8,$15CF,$15A8,$55AA,$1DA2,$9DA6,$1DB0 
    dw $1DDC,$1DC8,$1DDD,$1DB0,$DDA4,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$15C2,$15C3,$15B5,$15B6 
    dw $15BB,$15BC,$15BB,$15BC,$15D5,$15BC,$15D5,$15C8 
    dw $15CF,$15A8,$55AC,$15B6,$15B7,$1DB0,$1DA6,$1DA2 
    dw $1DE6,$1DC8,$1DB4,$1DA2,$5DA4,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$15C2,$15C3 
    dw $15DC,$15C8,$15DC,$15C8,$15DD,$15C8,$15CF,$15A8 
    dw $55AC,$15B6,$15AC,$15A8,$55AA,$1DA2,$9DA6,$1DB0 
    dw $1DA6,$1DA2,$9DA6,$1DA2,$DDA4,$000F,$000F,$000F 
    dw $000F,$000F,$19AD,$19AE,$59AD,$000F,$000F,$000F 
    dw $15C7,$15C8,$15DC,$15C8,$15CF,$15A8,$55AC,$15B6 
    dw $15B7,$15C3,$15B5,$15B6,$15B7,$1DB0,$1DA6,$1DA2 
    dw $9DA6,$1DA2,$DDA4,$1DBE,$1DBF,$000F,$000F,$000F 
    dw $000F,$000F,$19BB,$19BC,$19CC,$19AE,$59AD,$000F 
    dw $000F,$000F,$15C7,$15C8,$15B5,$15B6,$15B7,$15C3 
    dw $15C4,$000F,$15C2,$15C3,$15CD,$1DA2,$9DA6,$1DA2 
    dw $DDA4,$1DBE,$1DBF,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$19C7,$19C8,$19BB,$19BC,$19D5,$000F 
    dw $000F,$000F,$000F,$000F,$15C2,$15C3,$15C4,$000F 
    dw $000F,$000F,$000F,$000F,$15AF,$1DB0,$DDA4,$1DBE 
    dw $1DBF,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$59D7,$19AE,$59D8,$000F 
    dw $19AD,$19AE,$59AD,$000F,$000F,$000F,$000F,$1DA7 
    dw $1DA8,$5DA7,$000F,$000F,$15BD,$1DBE,$1DBF,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$19BB,$19BC,$19CC,$19AE 
    dw $99CC,$19BC,$19CC,$19AE,$59AD,$000F,$000F,$1DB5 
    dw $1DB6,$1DB7,$000F,$000F,$000F,$000F,$000F,$19A1 
    dw $19A2,$59A1,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$59D7,$19AE,$99CC,$19AE 
    dw $19CC,$19AE,$99CC,$19BC,$19D5,$000F,$000F,$1DC2 
    dw $1DC3,$1DC4,$000F,$000F,$000F,$19A1,$19A2,$99A6 
    dw $19B0,$19A6,$19A2,$59A1,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$19BB,$19BC,$19D5,$19C8 
    dw $19BB,$19BC,$19D5,$19C8,$D9D5,$19AE,$59AD,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$19AF,$19B0,$19A6 
    dw $19A2,$99A6,$19B0,$D9A4,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$19C7,$19C8,$19DB,$000F 
    dw $19DC,$19C8,$19DD,$19C8,$19BB,$19BC,$19D5,$000F 
    dw $000F,$19A1,$19A2,$59A1,$000F,$59B2,$19A2,$99A6 
    dw $19B0,$19A6,$19A2,$59A4,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $19C7,$19C8,$19DB,$000F,$19C7,$19C8,$19DB,$000F 
    dw $000F,$19AF,$19B0,$19A6,$19A2,$99A6,$19B0,$19A6 
    dw $19A2,$99A6,$19A2,$D9A4,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$19A7,$19A8,$59A7,$000F,$19A7,$19A8 
    dw $59A7,$19BD,$19BE,$19AF,$19B0,$19A6,$19A2,$99A6 
    dw $19A2,$D9A4,$19BE,$19C1,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $19A7,$19A8,$99AC,$19B6,$19AC,$19A8,$99AC,$19B6 
    dw $19B7,$000F,$000F,$59B2,$19A2,$99A6,$19A2,$D9A4 
    dw $19BE,$19A3,$19BE,$19C1,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$19A7,$19A8 
    dw $99AC,$19B6,$19AC,$19A8,$99AC,$19B6,$19AC,$19A8 
    dw $59BA,$000F,$000F,$19AF,$19B0,$D9A4,$19BE,$19C1 
    dw $000F,$19BD,$19BE,$19BF,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$19B5,$19B6 
    dw $19AC,$19A8,$59AC,$19B6,$19AC,$19A8,$99AC,$19B6 
    dw $19AC,$19A8,$59A7,$19C0,$19BE,$19C1,$19BE,$19BF 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$19C2,$19C3 
    dw $19B5,$19B6,$19B7,$19C3,$19B5,$19A8,$19B7,$19C3 
    dw $19B5,$19A8,$19B7,$19BD,$19BE,$19BF,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $19C2,$19C3,$19C4,$000F,$19C2,$19C3,$19C4,$000F 
    dw $19C2,$19C3,$19C4,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 

Tilemap_AreaSelect_Background_Crateria:
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$1C51,$1C4E,$5C4D,$1C53,$1C4D,$1C4E 
    dw $5C51,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $1C51,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53 
    dw $1C4D,$1C4E,$5C51,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$1C51,$1C4E 
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E 
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C51,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$1C51,$1C4E,$5C50,$000F 
    dw $1C50,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53 
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C51,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$1C51,$1C4E,$5C50,$000F,$000F,$000F 
    dw $000F,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E 
    dw $5C50,$000F,$1C54,$000F,$9C51,$1C53,$1C4D,$1C4E 
    dw $5C51,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $1C51,$1C4E,$5C4D,$1C53,$000F,$000F,$000F,$000F 
    dw $1C51,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53 
    dw $000F,$000F,$000F,$000F,$1C51,$1C4E,$5C4D,$1C53 
    dw $1C4D,$1C4E,$5C51,$000F,$000F,$000F,$000F,$000F 
    dw $9C4D,$1C53,$1C4D,$1C4E,$000F,$000F,$000F,$000F 
    dw $9C51,$1C53,$DC51,$000F,$9C51,$1C53,$DC51,$000F 
    dw $000F,$000F,$000F,$000F,$9C51,$1C53,$1C4D,$1C4E 
    dw $5C50,$000F,$1C50,$1C4E,$5C51,$000F,$000F,$000F 
    dw $1C4D,$1C4E,$5C4D,$1C53,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$1C51,$1C4E,$5C4D,$1C53 
    dw $000F,$000F,$000F,$1C53,$1C4D,$1C4E,$5C51,$000F 
    dw $9C4D,$1C53,$1C4D,$1C4E,$5C51,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$9C51,$1C53,$1C4D,$1C4E 
    dw $5C51,$000F,$1C51,$1C4E,$5C4D,$1C53,$1C4D,$1C4E 
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C51,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$1C51,$1C4E,$5C4D,$1C53 
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53 
    dw $9C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E 
    dw $5C51,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$9C51,$1C53,$1C4D,$1C4E 
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E 
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53 
    dw $1C4D,$1C4E,$5C51,$000F,$000F,$000F,$000F,$000F 
    dw $1C51,$1C4E,$5C51,$000F,$1C51,$1C4E,$5C4D,$1C53 
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53 
    dw $9C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E 
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C51,$000F,$1C51,$1C4E 
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E 
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E 
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53 
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53 
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53 
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53 
    dw $9C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E 
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E 
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E 
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E 
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53 
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53 
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53 
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53 
    dw $9C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E 
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E 
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E 
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$DC51,$000F 
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53 
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53 
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53 
    dw $1C4D,$1C4E,$5C4D,$1C53,$DC51,$000F,$000F,$000F 
    dw $9C51,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E 
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E 
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E 
    dw $5C4D,$1C53,$DC51,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$9C51,$1C53,$1C4D,$1C4E,$5C4D,$1C53 
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53 
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53 
    dw $DC51,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$9C51,$1C53,$1C4D,$1C4E 
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E 
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$DC51,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$9C51,$1C53 
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53 
    dw $1C4D,$1C4E,$5C4D,$1C53,$DC51,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $9C51,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E 
    dw $5C4D,$1C53,$DC51,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$9C51,$1C53,$1C4D,$1C4E,$5C4D,$1C53 
    dw $DC51,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$9C51,$1C53,$DC51,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 

Tilemap_AreaSelect_Background_Brinstar:
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$1C51,$1C4E,$5C51,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$9C51,$1C53,$DC51,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$9C54,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$1C51,$1C4E,$5C4D,$1C53,$DC50,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $1C51,$1C4E,$5C50,$000F,$1C50,$1C4E,$5C4D,$1C53 
    dw $DC50,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $9C4D,$1C53,$000F,$000F,$000F,$000F,$1C50,$1C4E 
    dw $5C4D,$1C53,$DC50,$000F,$000F,$000F,$000F,$000F 
    dw $9C50,$1C53,$DC50,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$1C51,$1C4E,$5C51,$000F,$000F,$000F 
    dw $1C4D,$1C4E,$5C51,$000F,$000F,$000F,$000F,$1C53 
    dw $1C4D,$1C4E,$5C4D,$1C53,$DC50,$000F,$9C50,$1C53 
    dw $1C4D,$1C4E,$5C4D,$1C53,$000F,$000F,$000F,$000F 
    dw $1C51,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C51,$000F 
    dw $9C4D,$1C53,$1C4D,$1C4E,$5C52,$000F,$1C52,$1C4E 
    dw $5C50,$000F,$1C50,$1C4E,$5C4D,$1C53,$1C4D,$5C55 
    dw $000F,$9C51,$1C4D,$1C4E,$5C51,$000F,$1C51,$1C4E 
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E 
    dw $1C4D,$1C4E,$5C4D,$1C53,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$1C50,$1C4E,$5C4D,$000F 
    dw $000F,$000F,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53 
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53 
    dw $9C4D,$1C53,$1C4D,$1C4E,$5C52,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$1C53,$1C4D,$5C51 
    dw $000F,$1C51,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E 
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E 
    dw $1C4D,$1C4E,$5C4D,$1C53,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$9C51,$1C53 
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53 
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53 
    dw $9C4D,$1C53,$1C4D,$1C4E,$5C51,$000F,$1C51,$1C4E 
    dw $5C51,$000F,$1C51,$1C4E,$5C51,$000F,$1C51,$1C4E 
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E 
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E 
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53 
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53 
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53 
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53 
    dw $9C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E 
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E 
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E 
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E 
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53 
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53 
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53 
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53 
    dw $9C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E 
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E 
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E 
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$DC51,$000F 
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53 
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53 
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53 
    dw $1C4D,$1C4E,$5C4D,$1C53,$DC51,$000F,$000F,$000F 
    dw $9C51,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E 
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E 
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E 
    dw $5C4D,$1C53,$DC51,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$9C51,$1C53,$1C4D,$1C4E,$5C4D,$1C53 
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53 
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53 
    dw $DC51,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$9C51,$1C53,$1C4D,$1C4E 
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E 
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$DC51,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$9C51,$1C53 
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53 
    dw $1C4D,$1C4E,$5C4D,$1C53,$DC51,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $9C51,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E 
    dw $5C4D,$1C53,$DC51,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$9C51,$1C53,$1C4D,$1C4E,$5C4D,$1C53 
    dw $DC51,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$9C51,$1C53,$DC51,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 

Tilemap_AreaSelect_Background_Norfair:
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$9C54,$000F,$000F,$000F,$000F,$000F 
    dw $9C54,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $1C51,$1C4E,$5C4D,$1C53,$DC50,$000F,$9C50,$1C53 
    dw $1C4D,$1C4E,$5C51,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$9C57,$1C4E 
    dw $5C50,$000F,$1C50,$1C4E,$5C4D,$1C53,$1C4D,$5C55 
    dw $000F,$9C51,$1C4D,$1C4E,$5C51,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$1C50,$1C4E,$5C4D,$000F 
    dw $000F,$000F,$5C4D,$1C53,$1C4D,$1C4E,$5C51,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$1C51,$1C4E,$5C52,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$1C53,$1C4D,$5C51 
    dw $000F,$1C56,$1C4D,$1C4E,$5C4D,$DC51,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $1C51,$1C4E,$5C4D,$1C53,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$9C51,$1C53 
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $9C4D,$1C53,$1C4D,$1C4E,$5C51,$000F,$1C51,$1C4E 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$1C4E 
    dw $5C4D,$DC51,$000F,$1C55,$5C4D,$5C52,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$5C51,$000F,$000F,$000F 
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53 
    dw $DC50,$000F,$9C58,$1C53,$DC50,$000F,$9C58,$1C53 
    dw $1C4D,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$1C4D,$1C4E,$5C51,$000F 
    dw $9C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E 
    dw $5C4D,$1C53,$DC51,$000F,$9C51,$1C53,$DC51,$000F 
    dw $9C51,$5C51,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$5C4D,$1C53,$1C4D,$1C4E 
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53 
    dw $DC51,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $1C51,$1C4E,$5C4D,$5C52,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$1C4D,$1C4E,$5C4D,$1C53 
    dw $9C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$DC51,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $9C51,$1C53,$1C4D,$000F,$000F,$000F,$000F,$000F 
    dw $5C4D,$5C51,$000F,$1C56,$5C4D,$1C53,$1C4D,$1C4E 
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C51,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$9C51,$000F,$000F,$000F,$000F,$1C56 
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53 
    dw $9C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E 
    dw $5C51,$000F,$1C51,$1C4E,$5C51,$000F,$1C51,$1C4E 
    dw $5C51,$000F,$1C51,$5C51,$000F,$1C56,$1C4D,$1C4E 
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E 
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53 
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53 
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53 
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53 
    dw $9C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E 
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E 
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E 
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E 
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53 
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53 
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53 
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53 
    dw $9C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E 
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E 
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E 
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$DC51,$000F 
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53 
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53 
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53 
    dw $1C4D,$1C4E,$5C4D,$1C53,$DC51,$000F,$000F,$000F 
    dw $9C51,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E 
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E 
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E 
    dw $5C4D,$1C53,$DC51,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$9C51,$1C53,$1C4D,$1C4E,$5C4D,$1C53 
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53 
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53 
    dw $DC51,$000F,$000F,$000F,$000F,$000F,$000F,$000F 

Tilemap_AreaSelect_Background_WreckedShip:
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$1C51,$1C4E,$5C51,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$1C51,$1C4E,$5C4D,$1C53,$1C4D,$1C4E 
    dw $5C51,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $1C51,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53 
    dw $1C4D,$1C4E,$5C51,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $9C51,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E 
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C51,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53 
    dw $DC51,$000F,$1C54,$000F,$1C50,$1C4E,$5C51,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$1C51,$1C4E,$000F,$000F,$000F,$000F 
    dw $9C50,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E 
    dw $000F,$000F,$000F,$000F,$000F,$1C53,$DC51,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $1C51,$1C4E,$5C4D,$1C53,$000F,$000F,$000F,$000F 
    dw $1C50,$1C4E,$5C50,$000F,$1C50,$1C4E,$5C50,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $9C4D,$1C53,$1C4D,$1C4E,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $1C4D,$1C4E,$5C4D,$1C53,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$1C51,$1C4E,$5C51,$000F 
    dw $9C4D,$1C53,$1C4D,$1C4E,$5C51,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$9C51,$1C53,$1C4D,$1C4E 
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C51,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$1C51,$1C4E,$5C4D,$1C53 
    dw $9C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E 
    dw $5C51,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$1C51,$1C4E,$5C4D,$1C53,$1C4D,$1C4E 
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53 
    dw $1C4D,$1C4E,$5C51,$000F,$000F,$000F,$000F,$000F 
    dw $1C51,$1C4E,$5C51,$000F,$000F,$000F,$000F,$000F 
    dw $1C51,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53 
    dw $9C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E 
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C51,$000F,$1C51,$1C4E 
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C51,$000F,$1C51,$1C4E 
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E 
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53 
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53 
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53 
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53 
    dw $9C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E 
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E 
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E 
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E 
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53 
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53 
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53 
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53 
    dw $9C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E 
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E 
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E 
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$DC51,$000F 
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53 
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53 
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53 
    dw $1C4D,$1C4E,$5C4D,$1C53,$DC51,$000F,$000F,$000F 
    dw $9C51,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E 
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E 
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E 
    dw $5C4D,$1C53,$DC51,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$9C51,$1C53,$1C4D,$1C4E,$5C4D,$1C53 
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53 
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53 
    dw $DC51,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$9C51,$1C53,$1C4D,$1C4E 
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E 
    dw $5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$DC51,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$9C51,$1C53 
    dw $1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53 
    dw $1C4D,$1C4E,$5C4D,$1C53,$DC51,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $9C51,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E 
    dw $5C4D,$1C53,$DC51,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$9C51,$1C53,$1C4D,$1C4E,$5C4D,$1C53 
    dw $DC51,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$9C51,$1C53,$DC51,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 

Tilemap_AreaSelect_Background_Maridia:
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$1C51,$5C51,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$9C51,$5C4D,$1C53,$1C4D 
    dw $5C51,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$1C51,$000F,$000F,$000F,$000F,$1C55,$5C4D 
    dw $1C53,$1C4D,$5C51,$000F,$000F,$000F,$000F,$000F 
    dw $1C51,$1C4D,$5C51,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $1C4E,$5C4D,$5C51,$000F,$000F,$000F,$000F,$1C4D 
    dw $1C4E,$5C4D,$1C53,$1C4D,$5C51,$000F,$1C51,$1C4D 
    dw $1C4E,$5C4D,$1C53,$1C4D,$000F,$000F,$000F,$000F 
    dw $1C51,$5C51,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $1C53,$1C4D,$1C4E,$5C4D,$5C57,$000F,$1C52,$5C4D 
    dw $DC51,$000F,$1C55,$5C4D,$1C53,$1C4D,$1C4E,$5C50 
    dw $000F,$1C50,$1C4E,$5C4D,$5C51,$000F,$1C51,$5C4D 
    dw $1C53,$1C4D,$1C4E,$5C51,$000F,$000F,$000F,$000F 
    dw $1C4E,$5C4D,$1C53,$1C4D,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$1C55,$5C4D,$1C53,$000F 
    dw $000F,$000F,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$DC51 
    dw $000F,$9C51,$1C53,$1C4D,$1C4E,$5C51,$000F,$000F 
    dw $1C53,$1C4D,$1C4E,$5C4D,$5C57,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$1C4D,$1C4E,$5C51 
    dw $000F,$1C51,$1C4E,$5C4D,$1C53,$DC51,$000F,$000F 
    dw $000F,$000F,$000F,$9C51,$1C53,$1C4D,$1C4E,$5C51 
    dw $1C4E,$5C4D,$1C53,$1C4D,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$9C51,$1C4D 
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C51,$000F,$000F 
    dw $000F,$000F,$000F,$1C51,$1C4E,$5C4D,$1C53,$1C4D 
    dw $1C53,$1C4D,$1C4E,$5C4D,$5C51,$000F,$1C56,$5C4D 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$5C4D 
    dw $1C53,$DC51,$000F,$9C51,$1C53,$DC51,$000F,$000F 
    dw $000F,$000F,$000F,$9C51,$1C53,$1C4D,$1C4E,$5C4D 
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D 
    dw $5C51,$000F,$1C56,$1C4D,$5C51,$000F,$1C56,$1C4D 
    dw $1C4E,$5C51,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$1C51,$1C4E,$5C4D,$1C53,$1C4D 
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D 
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D 
    dw $1C53,$1C4D,$1C4E,$5C51,$000F,$000F,$000F,$000F 
    dw $000F,$1C51,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D 
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D 
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D 
    dw $1C4E,$5C4D,$1C53,$DC51,$000F,$000F,$000F,$1C51 
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D 
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D 
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D 
    dw $1C53,$1C4D,$1C4E,$5C51,$000F,$1C51,$1C4E,$5C4D 
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D 
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D 
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D 
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D 
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$DC51 
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D 
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D 
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D 
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$DC51,$000F,$000F 
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D 
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D 
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D 
    dw $1C4E,$5C4D,$1C53,$DC51,$000F,$000F,$000F,$000F 
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D 
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D 
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D 
    dw $1C53,$DC51,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$9C51,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D 
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D 
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$DC51 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$9C51,$1C53,$1C4D,$1C4E,$5C4D 
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D 
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$DC51,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$9C51,$1C53,$1C4D 
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D 
    dw $1C4E,$5C4D,$1C53,$DC51,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$9C51 
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D 
    dw $1C53,$DC51,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$9C51,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$DC51 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 

Tilemap_AreaSelect_Background_Tourian:
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$1C51,$1C4E,$5C51,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$1C51,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C51 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D 
    dw $DC51,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $1C51,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$1C51,$000F,$000F,$000F,$000F 
    dw $1C55,$5C4D,$DC51,$000F,$1C55,$5C4D,$DC51,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$1C51,$1C4E,$5C4D,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $1C4E,$5C4D,$1C53,$1C4D,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $1C53,$1C4D,$1C4E,$5C4D,$5C51,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$5C51,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$5C51,$000F,$000F 
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D 
    dw $5C51,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$1C51,$1C4D,$1C4E,$5C51 
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D 
    dw $1C4E,$5C4D,$5C51,$000F,$000F,$000F,$000F,$000F 
    dw $1C51,$5C4D,$5C51,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$1C51,$1C4D,$1C4E,$5C4D,$1C53,$1C4D 
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D 
    dw $1C53,$1C4D,$1C4E,$5C4D,$5C51,$000F,$1C51,$5C4D 
    dw $1C53,$1C4D,$1C4E,$5C4D,$000F,$000F,$000F,$000F 
    dw $1C51,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D 
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D 
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$DC51 
    dw $000F,$9C51,$1C53,$1C4D,$5C51,$000F,$1C51,$1C4D 
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D 
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D 
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C51 
    dw $000F,$1C51,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D 
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D 
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D 
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D 
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D 
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D 
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D 
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D 
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D 
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D 
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D 
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D 
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D 
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$DC51 
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D 
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D 
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D 
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$DC51,$000F,$000F 
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D 
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D 
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D 
    dw $1C4E,$5C4D,$1C53,$DC51,$000F,$000F,$000F,$000F 
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D 
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D 
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D 
    dw $1C53,$DC51,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$9C51,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D 
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D 
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$DC51 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$9C51,$1C53,$1C4D,$1C4E,$5C4D 
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D 
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$DC51,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$9C51,$1C53,$1C4D 
    dw $1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D 
    dw $1C4E,$5C4D,$1C53,$DC51,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$9C51 
    dw $1C53,$1C4D,$1C4E,$5C4D,$1C53,$1C4D,$1C4E,$5C4D 
    dw $1C53,$DC51,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$9C51,$1C53,$1C4D,$1C4E,$5C4D,$1C53,$DC51 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$9C51,$1C53,$DC51,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 
    dw $000F,$000F,$000F,$000F,$000F,$000F,$000F,$000F 

Freespace_Bank81_EF1A: 
; $FE6 bytes


ORG $81FF00
    db " Special thanks      " ; Special thanks 2 Genji Kubota & all debug staff
    db "  2          Genji Ku" 
    db "bota         &       " 
    db " all debug staff.    " 
    db "            " 

; Thanks to P.JBoy for the bank logs at https://patrickjohnston.org/bank/index.html
; This disassembly relied heavily on his work
; Created with https://github.com/IsoFrieze/DiztinGUIsh

Freespace_Bank81_FF60:
; $A0 bytes
