
org $AD8000


Tiles_Crocomire:
incbin "../data/Tiles_Crocomire.bin" ; $2600 bytes

Tiles_CrocomireSkeleton_0:
incbin "../data/Tiles_CrocomireSkeleton_0.bin" ; $200 bytes

Tiles_CrocomireSkeleton_1:
incbin "../data/Tiles_CrocomireSkeleton_1.bin" ; $200 bytes

Tiles_CrocomireSkeleton_2:
incbin "../data/Tiles_CrocomireSkeleton_2.bin" ; $200 bytes

Tiles_CrocomireSkeleton_3:
incbin "../data/Tiles_CrocomireSkeleton_3.bin" ; $200 bytes

Tiles_CrocomireSkeleton_4:
incbin "../data/Tiles_CrocomireSkeleton_4.bin" ; $200 bytes

Tiles_CrocomireSkeleton_5:
incbin "../data/Tiles_CrocomireSkeleton_5.bin" ; $200 bytes

Tiles_BombTorizosCrumblingChozo:
incbin "../data/Tiles_BombTorizosCrumblingChozo.bin" ; $400 bytes

Tiles_Ship:
incbin "../data/Tiles_Ship.bin" ; $1000 bytes

Tiles_SpacePirate:
incbin "../data/Tiles_SpacePirate.bin" ; $1800 bytes

CalculateMotherBrainRainbowBeamHDMATables:
    LDA.L $7E8027 : AND.W #$00FF 
    LSR A 
    STA.B $12 
    LDA.L $7E8022 : SEC : SBC.B $12 : STA.L $7E8034 
    LDA.L $7E8022 : CLC : ADC.B $12 : STA.L $7E8036 
    LDA.W $0FB9 : CLC : ADC.W #$0E00 : AND.W #$FF00 
    STA.L $7E8038 
    STA.L $7E803C 
    LDA.W $0FBE : CLC : ADC.W #$0005 : STA.L $7E803A 
    STA.L $7E803E 
    LDA.L $7E8034 : AND.W #$00C0 
    ASL #2
    STA.B $12 
    LDA.L $7E8036 : AND.W #$00C0 
    ORA.B $12 
    ASL #3
    XBA 
    TAX 
    JSR.W (CalculateMotherBrainRainbowBeamHDMATables_pointers,X) 
    RTL 


RTS_ADDE5E:
    RTS 


CalculateMotherBrainRainbowBeamHDMATables_pointers:
    dw CalculateMotherBrainRainbowBeamHDMADataTable_AimedDownwards 
    dw CalculateMotherBrainRainbowBeamHDMATable_AimedRight 
    dw $0000 
    dw $0000 
    dw $0000 
    dw CalculateMotherBrainRainbowBeamHDMADataTable_AimedUpwards 
    dw CalculateMotherBrainRainbowBeamHDMADataTable_AimedUpwards 
    dw $0000 
    dw $0000 
    dw $0000 
    dw CalculateMotherBrainRainbowBeamHDMADataTable_AimedUpwards 
    dw RTS_ADDE5E 
    dw CalculateMotherBrainRainbowBeamHDMADataTable_AimedDownwards 
    dw $0000 
    dw $0000 
    dw CalculateMotherBrainRainbowBeamHDMADataTable_AimedDownwards 

CalculateMotherBrainRainbowBeamHDMATable_AimedRight:
    LDA.L $7E8038 : STA.B $16 
    LDA.L $7E803C : STA.B $18 
    JSR.W CalculateMotherBrainRainbowBeamHDMADataTable_AimedRight 
    LDA.W #$0010 : STA.L $7E9C00 
    LDA.W #$9C00 : STA.L $7E9C01 
    LDA.W #$0010 : STA.L $7E9C03 
    LDA.W #$9C03 : STA.L $7E9C04 
    LDA.W #$00F0 : STA.L $7E9C06 
    LDA.W #$9D04 : STA.L $7E9C07 
    LDA.W #$00F4 : STA.L $7E9C09 
    LDA.W #$9DEC : STA.L $7E9C0A 
    LDA.W #$0000 : STA.L $7E9C0C 
    RTS 


CalculateMotherBrainRainbowBeamHDMADataTable_AimedRight:
    PHB : PEA.W $7E7E 
    PLB : PLB 
    LDA.W #$00FF : STA.W $9D00 
    STA.W $9D02 
    LDA.W $8034 : AND.W #$00FF 
    ASL A 
    TAX 
    LDA.L AbsoluteTangentTable,X : STA.B $12 
    LDA.W $8036 : AND.W #$00FF 
    ASL A 
    TAX 
    LDA.L AbsoluteTangentTable,X : STA.B $14 
    LDA.W $803E 
    TAY 
    SEC : SBC.W #$0020 : ASL A 
    CLC : ADC.W #$9D02 : TAX 
    LDA.W #$00FF : STA.W $0002,X 
    STA.W $0004,X 
    PHX 

.loopLeftEdge:
    LDA.B $18 : CLC : ADC.B $14 : BCS ..done 
    STA.B $18 
    XBA 
    AND.W #$00FF 
    ORA.W #$FF00 
    STA.W $0000,X 
    DEX #2
    DEY 
    CPY.W #$0020 : BNE .loopLeftEdge 

..done:
    LDA.W #$00FF 

.loopLeftSidePadding:
    STA.W $0000,X 
    DEX #2
    DEY 
    CPY.W #$0020 : BNE .loopLeftSidePadding 
    PLX 
    INX #2
    LDA.W $803E 
    TAY 

.loopRightEdge:
    LDA.B $16 : CLC : ADC.B $12 : BCS ..done 
    STA.B $16 
    XBA 
    AND.W #$00FF 
    ORA.W #$FF00 
    STA.W $0000,X 
    INX #2
    INY 
    CPY.W #$00E8 : BNE .loopRightEdge 
    PLB 
    RTS 


..done:
    LDA.W #$00FF 

.loopRightSidePadding:
    STA.W $0000,X 
    INX #2
    INY 
    CPY.W #$00E8 : BNE .loopRightSidePadding 
    PLB 
    RTS 


CalculateMotherBrainRainbowBeamHDMADataTable_AimedUpwards:
    LDA.L $7E8038 : STA.B $16 
    LDA.L $7E803C : STA.B $18 
    SEP #$20 
    LDA.L $7E8034 
    ASL A 
    ROL.B $12 
    LDA.L $7E8036 
    ASL A 
    ROL.B $12 
    LDA.B $12 
    REP #$20 
    AND.W #$0003 
    ASL A 
    TAX 
    JSR.W (.pointers,X) 
    LDA.W #$0010 : STA.L $7E9C00 
    LDA.W #$9D00 : STA.L $7E9C01 
    LDA.W #$0010 : STA.L $7E9C03 
    LDA.W #$9D02 : STA.L $7E9C04 
    LDA.L $7E803A : SEC : SBC.W #$0020 : CMP.W #$0080 : BCS .greaterThanEqualTo80 
    PHA 
    ORA.W #$0080 
    STA.L $7E9C06 
    LDA.W #$9D04 : STA.L $7E9C07 
    LDA.W #$007F : STA.L $7E9C09 
    PLA 
    ASL A 
    CLC : ADC.W #$9D04 : STA.L $7E9C0A 
    LDA.W #$0000 : STA.L $7E9C0C 
    RTS 


.greaterThanEqualTo80:
    SEC : SBC.W #$007F : STA.B $12 
    ORA.W #$0080 
    STA.L $7E9C06 
    LDA.W #$9D04 : STA.L $7E9C07 
    LDA.W #$00FF : STA.L $7E9C09 
    LDA.B $12 
    ASL A 
    ADC.W #$9D04 : STA.L $7E9C0A 
    PHA 
    LDA.W #$007F : STA.L $7E9C0C 
    PLA 
    ADC.W #$00FE : STA.L $7E9C0D 
    LDA.W #$0000 : STA.L $7E9C0F 
    RTS 


.pointers:
    dw CalculateMotherBrainRainbowBeamHDMADataTable_AimedUpRight 
    dw CalculateMotherBrainRainbowBeamHDMADataTable_AimedUp 
    dw $0000 
    dw CalculateMotherBrainRainbowBeamHDMADataTable_AimedUpLeft 

CalculateMotherBrainRainbowBeamHDMADataTable_AimedUpRight:
    PHB : PEA.W $7E7E 
    PLB : PLB 
    LDA.W #$00FF : STA.W $9D00 
    STA.W $9D02 
    LDA.W $8036 : AND.W #$00FF 
    ASL A 
    TAX 
    LDA.L AbsoluteTangentTable,X : STA.B $12 
    LDA.W $8034 : AND.W #$00FF 
    ASL A 
    TAX 
    LDA.L AbsoluteTangentTable,X : STA.B $14 
    LDA.W $803A 
    TAY 
    SEC : SBC.W #$0020 : ASL A 
    CLC : ADC.W #$9D02 : TAX 
    LDA.W #$00FF : STA.W $0002,X 
    STA.W $0004,X 

.loop:
    LDA.B $16 : CLC : ADC.B $12 : BCC + 
    LDA.W #$FFFF 

  + STA.B $16 
    AND.W #$FF00 
    XBA 
    STA.B $24 
    LDA.B $18 : CLC : ADC.B $14 : BCC + 
    LDA.W #$FFFF 

  + STA.B $18 
    AND.W #$FF00 
    ORA.B $24 
    CMP.W #$FFFF : BNE .next 
    LDA.W #$00FF 

.next:
    STA.W $0000,X 
    DEX #2
    DEY 
    CPY.W #$0020 : BNE .loop 
    PLB 
    RTS 


CalculateMotherBrainRainbowBeamHDMADataTable_AimedUp:
    PHB : PEA.W $7E7E 
    PLB : PLB 
    LDA.W #$00FF : STA.W $9D00 
    STA.W $9D02 
    LDA.W $8036 
    EOR.W #$FFFF 
    INC A 
    AND.W #$00FF 
    ASL A 
    TAX 
    LDA.L AbsoluteTangentTable,X : STA.B $12 
    LDA.W $8034 : AND.W #$00FF 
    ASL A 
    TAX 
    LDA.L AbsoluteTangentTable,X : STA.B $14 
    LDA.W $803A 
    TAY 
    SEC : SBC.W #$0020 : ASL A 
    CLC : ADC.W #$9D02 : TAX 
    LDA.W #$00FF : STA.W $0002,X 
    STA.W $0004,X 

.loop:
    LDA.B $16 : SEC : SBC.B $12 : BCS + 
    LDA.W #$0000 

  + STA.B $16 
    AND.W #$FF00 
    XBA 
    STA.B $1A 
    LDA.B $18 : CLC : ADC.B $14 : BCC + 
    LDA.W #$FFFF 

  + STA.B $18 
    AND.W #$FF00 
    ORA.B $1A 
    CMP.W #$FFFF : BNE .next 
    LDA.W #$00FF 

.next:
    STA.W $0000,X 
    DEX #2
    DEY 
    CPY.W #$0020 : BNE .loop 
    PLB 
    RTS 


CalculateMotherBrainRainbowBeamHDMADataTable_AimedUpLeft:
    PHB : PEA.W $7E7E 
    PLB : PLB 
    LDA.W #$00FF : STA.W $9D00 
    STA.W $9D02 
    LDA.W $8036 
    EOR.W #$FFFF 
    INC A 
    AND.W #$00FF 
    ASL A 
    TAX 
    LDA.L AbsoluteTangentTable,X : STA.B $12 
    LDA.W $8034 
    EOR.W #$FFFF 
    INC A 
    AND.W #$00FF 
    ASL A 
    TAX 
    LDA.L AbsoluteTangentTable,X : STA.B $14 
    LDA.W $803A 
    TAY 
    SEC : SBC.W #$0020 : ASL A 
    CLC : ADC.W #$9D02 : TAX 
    LDA.W #$00FF : STA.W $0002,X 
    STA.W $0004,X 

.loop:
    LDA.B $16 : SEC : SBC.B $12 : BCS + 
    LDA.W #$0000 

  + STA.B $16 
    AND.W #$FF00 
    XBA 
    STA.B $24 
    LDA.B $18 : SEC : SBC.B $14 : BCS + 
    LDA.W #$0000 

  + STA.B $18 
    AND.W #$FF00 
    ORA.B $24 
    CMP.W #$FFFF : BNE .next 
    LDA.W #$00FF 

.next:
    STA.W $0000,X 
    DEX #2
    DEY 
    CPY.W #$0020 : BNE .loop 
    PLB 
    RTS 


CalculateMotherBrainRainbowBeamHDMADataTable_AimedDownwards:
    LDA.L $7E8038 : STA.B $16 
    LDA.L $7E803C : STA.B $18 
    SEP #$20 
    LDA.L $7E8034 
    ASL A 
    ROL.B $12 
    LDA.L $7E8036 
    ASL A 
    ROL.B $12 
    LDA.B $12 
    REP #$20 
    AND.W #$0003 
    ASL A 
    TAX 
    JSR.W (.pointers,X) 
    LDA.W #$0010 : STA.L $7E9C00 
    LDA.W #$9C00 : STA.L $7E9C01 
    LDA.W #$0010 : STA.L $7E9C03 
    LDA.W #$9C03 : STA.L $7E9C04 
    LDA.W #$00F0 : STA.L $7E9C06 
    LDA.W #$9D04 : STA.L $7E9C07 
    LDA.W #$00F4 : STA.L $7E9C09 
    LDA.W #$9DE6 : STA.L $7E9C0A 
    LDA.W #$0000 : STA.L $7E9C0C 
    RTS 


.pointers:
    dw CalculateMotherBrainRainbowBeamHDMADataTable_AimedDownRight 
    dw $0000 
    dw CalculateMotherBrainRainbowBeamHDMADataTable_AimedDown 
    dw CalculateMotherBrainRainbowBeamHDMADataTable_AimedDownLeft 

CalculateMotherBrainRainbowBeamHDMADataTable_AimedDownRight:
    PHB : PEA.W $7E7E 
    PLB : PLB 
    LDA.W #$00FF : STA.W $9D00 
    STA.W $9D02 
    LDA.W $8034 : AND.W #$00FF 
    ASL A 
    TAX 
    LDA.L AbsoluteTangentTable,X : STA.B $12 
    LDA.W $8036 : AND.W #$00FF 
    ASL A 
    TAX 
    LDA.L AbsoluteTangentTable,X : STA.B $14 
    LDA.W $803A : SEC : SBC.W #$0020 : TAY 
    LDX.W #$9D04 
    LDA.W #$00FF 

.loopPadAbove:
    STA.W $0000,X 
    INX #2
    DEY 
    BNE .loopPadAbove 
    LDA.W $803A 
    TAY 

.loopBeam:
    LDA.B $16 : CLC : ADC.B $12 : BCC + 
    LDA.W #$FFFF 

  + STA.B $16 
    AND.W #$FF00 
    XBA 
    STA.B $1A 
    LDA.B $18 : CLC : ADC.B $14 : BCC + 
    LDA.W #$FFFF 

  + STA.B $18 
    AND.W #$FF00 
    ORA.B $1A 
    CMP.W #$FFFF : BNE + 
    LDA.W #$00FF 

  + STA.W $0000,X 
    INX #2
    INY 
    CPY.W #$00E8 : BNE .loopBeam 
    PLB 
    RTS 


CalculateMotherBrainRainbowBeamHDMADataTable_AimedDown:
    PHB : PEA.W $7E7E 
    PLB : PLB 
    LDA.W #$00FF : STA.W $9D00 
    STA.W $9D02 
    LDA.W $8034 
    EOR.W #$FFFF 
    INC A 
    AND.W #$00FF 
    ASL A 
    TAX 
    LDA.L AbsoluteTangentTable,X : STA.B $12 
    LDA.W $8036 : AND.W #$00FF 
    ASL A 
    TAX 
    LDA.L AbsoluteTangentTable,X : STA.B $14 
    LDA.W $803A : SEC : SBC.W #$0020 : TAY 
    LDX.W #$9D04 
    LDA.W #$00FF 

.loopPadAbove:
    STA.W $0000,X 
    INX #2
    DEY 
    BNE .loopPadAbove 
    LDA.W $803A 
    TAY 

.loopBeam:
    LDA.B $16 : SEC : SBC.B $12 : BCS + 
    LDA.W #$0000 

  + STA.B $16 
    AND.W #$FF00 
    XBA 
    STA.B $1A 
    LDA.B $18 : CLC : ADC.B $14 : BCC + 
    LDA.W #$FFFF 

  + STA.B $18 
    AND.W #$FF00 
    ORA.B $1A 
    CMP.W #$FFFF : BNE + 
    LDA.W #$00FF 

  + STA.W $0000,X 
    INX #2
    INY 
    CPY.W #$00E8 : BNE .loopBeam 
    PLB 
    RTS 


CalculateMotherBrainRainbowBeamHDMADataTable_AimedDownLeft:
    PHB : PEA.W $7E7E 
    PLB : PLB 
    LDA.W #$00FF : STA.W $9D00 
    STA.W $9D02 
    LDA.W $8034 
    EOR.W #$FFFF 
    INC A 
    AND.W #$00FF 
    ASL A 
    TAX 
    LDA.L AbsoluteTangentTable,X : STA.B $12 
    LDA.W $8036 
    EOR.W #$FFFF 
    INC A 
    AND.W #$00FF 
    ASL A 
    TAX 
    LDA.L AbsoluteTangentTable,X : STA.B $14 
    LDA.W $803A : SEC : SBC.W #$0020 : TAY 
    LDX.W #$9D04 
    LDA.W #$00FF 

.loopPadAbove:
    STA.W $0000,X 
    INX #2
    DEY 
    BNE .loopPadAbove 
    LDA.W $803A 
    TAY 

.loopBeam:
    LDA.B $16 : SEC : SBC.B $12 : BCS + 
    LDA.W #$0000 

  + STA.B $16 
    AND.W #$FF00 
    XBA 
    STA.B $1A 
    LDA.B $18 : SEC : SBC.B $14 : BCS + 
    LDA.W #$0000 

  + STA.B $18 
    AND.W #$FF00 
    ORA.B $1A 
    BNE + 
    LDA.W #$00FF 

  + STA.W $0000,X 
    INX #2
    INY 
    CPY.W #$00E8 : BNE .loopBeam 
    PLB 
    RTS 


SealMotherBrainsWallFunction_FakeDeath_Descent:
    LDA.W #$00F8 : STA.B $12 
    LDA.W #$0048 : STA.B $14 
    LDA.W #$0009 
    LDY.W #EnemyProjectile_MiscDust 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    LDA.W #$00F8 : STA.B $12 
    LDA.W #$0098 : STA.B $14 
    LDA.W #$0009 
    LDY.W #EnemyProjectile_MiscDust 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    JSL.L Spawn_Hardcoded_PLM 
    db $0F,$04 
    dw PLMEntries_fillMotherBrainsWall 
    JSL.L Spawn_Hardcoded_PLM 
    db $0F,$09 
    dw PLMEntries_fillMotherBrainsWall 
    LDA.W #Function_MotherBrainBody_FakeDeath_Descent_InitialPause : STA.W $0FA8 
    RTL 


MotherBrainHealthBasedPaletteHandling:
    LDA.L $7E783E : CMP.W #$0002 : BCS .recovered 
    RTL 


.recovered:
    PHB : PEA.W $AD00 
    PLB : PLB 
    LDY.W #$0000 
    LDA.W $0FCC : CMP.W #$2328 : BCS .writePalette 
    LDY.W #$0002 : CMP.W #$1518 : BCS .writePalette 
    LDY.W #$0004 : CMP.W #$0708 : BCS .writePalette 
    LDY.W #$0006 

.writePalette:
    PHY 
    LDA.W MotherBrainHealthBasedPalettes_BrainBody,Y 
    TAY 
    LDX.W #$0082 
    LDA.W #$000F : JSL.L WriteAColorsFromYtoColorIndexX 
    LDA.B $01,S 
    TAY 
    LDA.W MotherBrainHealthBasedPalettes_BrainBody,Y 
    TAY 
    LDX.W #$0122 
    LDA.W #$000F : JSL.L WriteAColorsFromYtoColorIndexX 
    PLY 
    LDA.W MotherBrainHealthBasedPalettes_BackLeg,Y 
    TAY 
    LDX.W #$0162 
    LDA.W #$000F : JSL.L WriteAColorsFromYtoColorIndexX 
    PLB 
    RTL 


MotherBrainBodyRainbowBeamPalette_Pointers:
    dw MotherBrainBodyRainbowBeamPalette_0 
    dw MotherBrainBodyRainbowBeamPalette_1 
    dw MotherBrainBodyRainbowBeamPalette_2 
    dw MotherBrainBodyRainbowBeamPalette_3 
    dw MotherBrainBodyRainbowBeamPalette_4 
    dw MotherBrainBodyRainbowBeamPalette_5 

MotherBrainPhase2DeathBeforeGreyPalette_Pointers:
    dw MotherBrainBodyRainbowBeamPalette_6 ; shared with MotherBrainBodyRainbowBeamPalette_Pointers
    dw MotherBrainBodyRainbowBeamPalette_7 
    dw MotherBrainBodyRainbowBeamPalette_8 
    dw MotherBrainBodyRainbowBeamPalette_9 
    dw $0000 

MotherBrainBodyRainbowBeamPalette_0:
    dw $047F,$0479,$0033,$002D,$3A3B,$2DB7,$1D33,$0C8E 
    dw $25BF,$1D5B,$14F7,$0CB2,$086E,$56BF,$000A,$0450 
    dw $044D,$002A,$0027,$1D2E,$18EC,$10AA,$0847,$14F0 
    dw $10AE,$0C8C,$0869,$0447,$2D70,$0005 

MotherBrainBodyRainbowBeamPalette_1:
    dw $051F,$04F9,$00D3,$00AD,$3ABB,$2E37,$1DB3,$0D2E 
    dw $263F,$1DFB,$1597,$0D52,$08EE,$573F,$00AA,$0490 
    dw $048D,$006A,$0067,$1D6E,$192C,$10EA,$08A7,$1530 
    dw $110E,$0CCC,$08A9,$0487,$2DB0,$0065 

MotherBrainBodyRainbowBeamPalette_2:
    dw $05DF,$05B9,$0193,$016D,$3B7B,$2EF7,$1E73,$0DCE 
    dw $26FF,$1E9B,$1657,$0E12,$09AE,$57FF,$014A,$04F0 
    dw $04ED,$00CA,$00C7,$1DCE,$198C,$114A,$08E7,$1590 
    dw $114E,$0D2C,$0909,$04E7,$2E10,$00A5 

MotherBrainBodyRainbowBeamPalette_3:
    dw $05D5,$05AF,$0189,$0163,$3B71,$2EED,$1E69,$0DC4 
    dw $26F5,$1E91,$164D,$0E08,$09A4,$57F5,$0140,$04EB 
    dw $04E8,$00C5,$00C2,$1DC9,$1987,$1145,$08E2,$158B 
    dw $1149,$0D27,$0904,$04E2,$2E0B,$00A0 

MotherBrainBodyRainbowBeamPalette_4:
    dw $0D95,$0D6F,$0949,$0923,$4331,$36AD,$2629,$1584 
    dw $2EB5,$2651,$1E0D,$15C8,$1164,$5FB5,$0900,$08CB 
    dw $08C8,$04A5,$04A2,$21A9,$1D67,$1525,$0CC2,$196B 
    dw $1529,$1107,$0CE4,$08C2,$31EB,$0480 

MotherBrainBodyRainbowBeamPalette_5:
    dw $1915,$190F,$18C9,$18C3,$52D1,$424D,$35C9,$2524 
    dw $3A55,$31F1,$2D8D,$2548,$2104,$6B55,$18A0,$0C8B 
    dw $0C88,$0C65,$0C62,$2969,$2127,$1CE5,$14A2,$1D2B 
    dw $1909,$18C7,$14A4,$1082,$35AB,$0C60 

MotherBrainBodyRainbowBeamPalette_6:
    dw $2C75,$2C6F,$2829,$2823,$6231,$55AD,$4929,$3884 
    dw $4DB5,$4551,$40ED,$38A8,$3064,$7EB5,$2800,$184B 
    dw $1848,$1425,$1422,$3129,$2CE7,$24A5,$1C42,$28EB 
    dw $24A9,$2087,$1C64,$1842,$416B,$1400 

MotherBrainBodyRainbowBeamPalette_7:
    dw $2C9A,$2C74,$284E,$2828,$6236,$55B2,$492E,$3889 
    dw $4DBA,$4556,$4112,$38CD,$3069,$7EBA,$2805,$184D 
    dw $184A,$1427,$1424,$312B,$2CE9,$24A7,$1C45,$28ED 
    dw $24AB,$2089,$1C67,$1845,$416D,$1403 

MotherBrainBodyRainbowBeamPalette_8:
    dw $2C7F,$2C79,$2833,$282D,$623B,$55B7,$4933,$388E 
    dw $4DBF,$455B,$40F7,$38B2,$306E,$7EBF,$280A,$1850 
    dw $184D,$142A,$1427,$312E,$2CEC,$24AA,$1C47,$28F0 
    dw $24AE,$208C,$1C69,$1847,$4170,$1405 

MotherBrainBodyRainbowBeamPalette_9:
    dw $187F,$1879,$1433,$142D,$4E3B,$41B7,$3133,$208E 
    dw $39BF,$315B,$28F7,$20B2,$1C6E,$6ABF,$140A,$0C50 
    dw $0C4D,$0C2A,$0C27,$292E,$20EC,$18AA,$1047,$1CF0 
    dw $18AE,$148C,$1069,$1047,$3570,$0C05 

MotherBrainHealthBasedPalettes_BrainBody:
    dw MotherBrainHealthBasedPalettes_BrainBody_0 
    dw MotherBrainHealthBasedPalettes_BrainBody_1 
    dw MotherBrainHealthBasedPalettes_BrainBody_2 
    dw MotherBrainHealthBasedPalettes_BrainBody_3 
    dw UNUSED_MotherBrainHealthBasedPalettes_BrainBody_4_ADE724 

MotherBrainHealthBasedPalettes_BrainBody_0:
    dw $269F,$0159,$004C,$0004,$5739,$4273,$2DAD,$14C6 
    dw $367F,$29F9,$2173,$150C,$0C86,$7FFF,$0000 

MotherBrainHealthBasedPalettes_BrainBody_1:
    dw $225F,$0139,$002D,$0005,$4EF9,$3E33,$298E,$10A7 
    dw $323F,$25D9,$1D53,$10ED,$0867,$77BF,$0002 

MotherBrainHealthBasedPalettes_BrainBody_2:
    dw $1E1F,$011A,$002F,$0009,$429A,$31F5,$2150,$108B 
    dw $29FF,$219A,$1915,$10CF,$086B,$631F,$0006 

MotherBrainHealthBasedPalettes_BrainBody_3:
    dw $159F,$00DB,$0033,$000E,$31FB,$2577,$18F4,$0C70 
    dw $1D7F,$193B,$10D7,$0C93,$0450,$4A5F,$000C 

UNUSED_MotherBrainHealthBasedPalettes_BrainBody_4_ADE724:
    dw $159F,$00DB,$0033,$000E,$31FB,$2577,$18F4,$0C70 
    dw $1D7F,$193B,$10D7,$0C93,$0450,$4A5F,$000C 

MotherBrainHealthBasedPalettes_BackLeg:
    dw MotherBrainHealthBasedPalettes_BackLeg_0 
    dw MotherBrainHealthBasedPalettes_BackLeg_1 
    dw MotherBrainHealthBasedPalettes_BackLeg_2 
    dw MotherBrainHealthBasedPalettes_BackLeg_3 
    dw UNUSED_MotherBrainHealthBasedPalettes_BackLeg_4_ADE7C4 

MotherBrainHealthBasedPalettes_BackLeg_0:
    dw $0000,$0000,$0000,$0024,$29AD,$214A,$14E7,$0C63 
    dw $0000,$0000,$0000,$0000,$0000,$29AD,$0000 

MotherBrainHealthBasedPalettes_BackLeg_1:
    dw $0004,$0004,$0004,$0007,$216F,$1D0C,$10CA,$0846 
    dw $0004,$0004,$0004,$0004,$0004,$216F,$0004 

MotherBrainHealthBasedPalettes_BackLeg_2:
    dw $0008,$0008,$0008,$000B,$1D31,$14EF,$0CAD,$084A 
    dw $0008,$0008,$0008,$0008,$0008,$1D31,$0008 

MotherBrainHealthBasedPalettes_BackLeg_3:
    dw $000E,$000E,$000E,$0010,$14F5,$10B3,$0872,$0430 
    dw $000E,$000E,$000E,$000E,$000E,$14F5,$000E 

UNUSED_MotherBrainHealthBasedPalettes_BackLeg_4_ADE7C4:
    dw $000E,$000E,$000E,$0010,$14F5,$10B3,$0872,$0430 
    dw $000E,$000E,$000E,$000E,$000E,$14F5,$000E 

BabyMetroidHealthBasedPalette_Shell:
    dw UNUSED_BabyMetroidHealthBasedPalette_Shell_0_ADE7F2 
    dw BabyMetroidHealthBasedPalette_Shell_1 
    dw BabyMetroidHealthBasedPalette_Shell_2 
    dw BabyMetroidHealthBasedPalette_Shell_3 
    dw BabyMetroidHealthBasedPalette_Shell_4 
    dw BabyMetroidHealthBasedPalette_Shell_5 
    dw BabyMetroidHealthBasedPalette_Shell_6 
    dw BabyMetroidHealthBasedPalette_Shell_7 

UNUSED_BabyMetroidHealthBasedPalette_Shell_0_ADE7F2:
    dw $57B8,$0B11,$1646,$00E3,$4F9F,$3ED8,$2E12,$08CD 
    dw $7FFF 

BabyMetroidHealthBasedPalette_Shell_1:
    dw $4FB8,$0B12,$1227,$00E4,$4B7E,$3AB7,$29F1,$08CD 
    dw $7BFF 

BabyMetroidHealthBasedPalette_Shell_2:
    dw $47B9,$0AF2,$1228,$00E4,$473C,$3A96,$29F1,$08AC 
    dw $73FF 

BabyMetroidHealthBasedPalette_Shell_3:
    dw $3FB9,$0AF3,$0E09,$00E5,$431B,$3675,$25D0,$08AC 
    dw $6FFF 

BabyMetroidHealthBasedPalette_Shell_4:
    dw $3399,$06F3,$0E09,$00E5,$42FA,$3254,$25AF,$04AB 
    dw $67DE 

BabyMetroidHealthBasedPalette_Shell_5:
    dw $2B99,$06F4,$09EA,$00E6,$3ED9,$2E33,$218E,$04AB 
    dw $63DE 

BabyMetroidHealthBasedPalette_Shell_6:
    dw $239A,$06D4,$09EB,$00E6,$3A97,$2E12,$218E,$048A 
    dw $5BDE 

BabyMetroidHealthBasedPalette_Shell_7:
    dw $1B9A,$06D5,$05CC,$00E7,$3676,$29F1,$1D6D,$048A 
    dw $57DE 

BabyMetroidHealthBasedPalette_Innards:
    dw UNUSED_BabyMetroidHealthBasedPalette_Innards_0_ADE892 
    dw BabyMetroidHealthBasedPalette_Innards_1 
    dw BabyMetroidHealthBasedPalette_Innards_2 
    dw BabyMetroidHealthBasedPalette_Innards_3 
    dw BabyMetroidHealthBasedPalette_Innards_4 
    dw BabyMetroidHealthBasedPalette_Innards_5 
    dw BabyMetroidHealthBasedPalette_Innards_6 
    dw BabyMetroidHealthBasedPalette_Innards_7 

UNUSED_BabyMetroidHealthBasedPalette_Innards_0_ADE892:
    dw $72FF,$2CDF,$24B9,$1CAF,$18A9 

BabyMetroidHealthBasedPalette_Innards_1:
    dw $6EBD,$2CDD,$28B7,$20AE,$18A8 

BabyMetroidHealthBasedPalette_Innards_2:
    dw $6A9B,$30BB,$2896,$208D,$1488 

BabyMetroidHealthBasedPalette_Innards_3:
    dw $6659,$30B9,$2C94,$248C,$1487 

BabyMetroidHealthBasedPalette_Innards_4:
    dw $6636,$3496,$2C92,$288B,$1066 

BabyMetroidHealthBasedPalette_Innards_5:
    dw $61F4,$3494,$3090,$2C8A,$1065 

BabyMetroidHealthBasedPalette_Innards_6:
    dw $5DD2,$3872,$306F,$2C69,$0C45 

BabyMetroidHealthBasedPalette_Innards_7:
    dw $5990,$3870,$346D,$3068,$0C44 

BabyMetroidFadingToBlackPalettes:
    dw UNUSED_BabyMetroidFadingToBlackPalettes_0_ADE8F0 
    dw BabyMetroidFadingToBlackPalettes_1 
    dw BabyMetroidFadingToBlackPalettes_2 
    dw BabyMetroidFadingToBlackPalettes_3 
    dw BabyMetroidFadingToBlackPalettes_4 
    dw BabyMetroidFadingToBlackPalettes_5 
    dw BabyMetroidFadingToBlackPalettes_6 

UNUSED_BabyMetroidFadingToBlackPalettes_0_ADE8F0:
    dw $1716,$0252,$018A,$00C6,$494D,$304D,$2C4B,$2846 
    dw $0823,$2E12,$218E,$192B,$0068,$4B39 

BabyMetroidFadingToBlackPalettes_1:
    dw $1292,$01EF,$0148,$00A5,$3D0B,$284B,$2449,$2045 
    dw $0822,$25AF,$1D4C,$14E9,$0047,$3EB5 

BabyMetroidFadingToBlackPalettes_2:
    dw $0E0E,$018C,$0106,$0084,$30C9,$2029,$1C27,$1824 
    dw $0422,$1D4C,$1509,$10C7,$0045,$3231 

BabyMetroidFadingToBlackPalettes_3:
    dw $098B,$0129,$00C5,$0063,$24A6,$1826,$1425,$1423 
    dw $0401,$1509,$10C7,$0C85,$0024,$258C 

BabyMetroidFadingToBlackPalettes_4:
    dw $0507,$00C6,$0083,$0042,$1864,$1004,$0C03,$0C02 
    dw $0001,$0CA6,$0884,$0863,$0022,$1908 

BabyMetroidFadingToBlackPalettes_5:
    dw $0083,$0063,$0041,$0021,$0C22,$0802,$0401,$0401 
    dw $0000,$0443,$0442,$0421,$0001,$0C84 

BabyMetroidFadingToBlackPalettes_6:
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000 
    dw $0000,$0000,$0000,$0000,$0000,$0000 

FadeMotherBrainPaletteToBlack:
    ASL A 
    TAX 
    LDA.L .pointers,X : BNE .notZero 
    SEC 
    RTL 


.notZero:
    PHB : PEA.W $AD00 
    PLB : PLB 
    TAY 
    PHY 
    LDX.W #$0082 
    LDA.W #$000E : JSL.L WriteAColorsFromYtoColorIndexX 
    PLY 
    LDX.W #$0122 
    LDA.W #$000E : JSL.L WriteAColorsFromYtoColorIndexX 
    LDX.W #$0162 
    LDA.W #$000E : JSL.L WriteAColorsFromYtoColorIndexX 
    PLB 
    CLC 
    RTL 


.pointers:
    dw .pallete0 
    dw .pallete1 
    dw .pallete2 
    dw .pallete3 
    dw .pallete4 
    dw .pallete5 
    dw .pallete6 
    dw .pallete7 
    dw .pallete8 
    dw .pallete9 
    dw .palleteA 
    dw .palleteB 
    dw .palleteC 
    dw .palleteD 
    dw .palleteE 
    dw .palleteF 
    dw $0000 

.pallete0:
    dw $159F,$00DB,$0033,$000E,$31FB,$2577,$18F4,$0C70 
    dw $1D7F,$193B,$10D7,$0C93,$0450,$4A5F,$000E,$000E 
    dw $000E,$0010,$14F5,$10B3,$0872,$0430,$000E,$000E 
    dw $000E,$000E,$000E,$14F5 

.pallete1:
    dw $117D,$00B9,$0031,$000D,$2DD9,$2155,$14D2,$084F 
    dw $195D,$1519,$0CB5,$0871,$042F,$421D,$000D,$000D 
    dw $000D,$000F,$10D3,$0C91,$0450,$042F,$000D,$000D 
    dw $000D,$000D,$000D,$10D3 

.pallete2:
    dw $115A,$00B7,$0010,$000C,$29B7,$1D34,$14D1,$084D 
    dw $193A,$14F7,$0CB4,$0870,$002D,$3DFA,$000C,$000C 
    dw $000C,$000D,$10D2,$0C90,$044F,$000D,$000C,$000C 
    dw $000C,$000C,$000C,$10D2 

.pallete3:
    dw $1138,$0095,$000F,$000B,$2595,$1D12,$10B0,$084C 
    dw $1518,$10F5,$0C92,$086F,$002C,$39D8,$000B,$000B 
    dw $000B,$000C,$10B0,$0C8F,$044E,$000C,$000B,$000B 
    dw $000B,$000B,$000B,$10B0 

.pallete4:
    dw $0D16,$0093,$000E,$000A,$2173,$1910,$10AE,$084B 
    dw $1516,$10D3,$0C90,$086E,$002B,$35B6,$000A,$000A 
    dw $000A,$000B,$0CAF,$0C6E,$044D,$000B,$000A,$000A 
    dw $000A,$000A,$000A,$0CAF 

.pallete5:
    dw $0D14,$0092,$000C,$0009,$2152,$18EF,$108D,$084A 
    dw $10F4,$10D2,$088F,$084C,$002A,$3194,$0009,$0009 
    dw $0009,$000A,$0C8E,$086C,$044C,$000A,$0009,$0009 
    dw $0009,$0009,$0009,$0C8E 

.pallete6:
    dw $0CF2,$0070,$000B,$0008,$1D30,$14CD,$0C8C,$0429 
    dw $10D2,$0CB0,$086D,$044B,$0029,$2952,$0008,$0008 
    dw $0008,$0009,$0C8C,$086B,$042A,$0009,$0008,$0008 
    dw $0008,$0008,$0008,$0C8C 

.pallete7:
    dw $08D0,$006E,$000A,$0007,$190E,$10AC,$0C6A,$0428 
    dw $0CB0,$0C8E,$086C,$044A,$0028,$2530,$0007,$0007 
    dw $0007,$0008,$086B,$084A,$0429,$0008,$0007,$0007 
    dw $0007,$0007,$0007,$086B 

.pallete8:
    dw $08AE,$004C,$0008,$0006,$14EC,$10AA,$0869,$0427 
    dw $0CAE,$088C,$044A,$0428,$0027,$210E,$0006,$0006 
    dw $0006,$0007,$0869,$0448,$0428,$0007,$0006,$0006 
    dw $0006,$0006,$0006,$0869 

.pallete9:
    dw $088C,$004A,$0007,$0005,$10CA,$0C89,$0848,$0426 
    dw $088C,$086A,$0449,$0427,$0006,$1CEC,$0005,$0005 
    dw $0005,$0006,$0848,$0447,$0027,$0006,$0005,$0005 
    dw $0005,$0005,$0005,$0848 

.palleteA:
    dw $048A,$0049,$0006,$0004,$10A9,$0C67,$0846,$0425 
    dw $086A,$0869,$0447,$0426,$0005,$18CA,$0004,$0004 
    dw $0004,$0005,$0447,$0426,$0026,$0005,$0004,$0004 
    dw $0004,$0004,$0004,$0447 

.palleteB:
    dw $0468,$0027,$0005,$0003,$0C87,$0866,$0425,$0004 
    dw $0468,$0447,$0426,$0025,$0004,$1088,$0003,$0003 
    dw $0003,$0004,$0425,$0425,$0004,$0004,$0003,$0003 
    dw $0003,$0003,$0003,$0425 

.palleteC:
    dw $0446,$0025,$0003,$0002,$0865,$0444,$0424,$0003 
    dw $0446,$0425,$0024,$0003,$0003,$0C66,$0002,$0002 
    dw $0002,$0003,$0424,$0023,$0003,$0003,$0002,$0002 
    dw $0002,$0002,$0002,$0424 

.palleteD:
    dw $0024,$0003,$0002,$0001,$0443,$0423,$0022,$0002 
    dw $0424,$0023,$0003,$0002,$0002,$0844,$0001,$0001 
    dw $0001,$0002,$0022,$0002,$0002,$0002,$0001,$0001 
    dw $0001,$0001,$0001,$0022 

.palleteE:
    dw $0002,$0001,$0001,$0001,$0021,$0001,$0001,$0001 
    dw $0002,$0001,$0001,$0001,$0001,$0422,$0001,$0001 
    dw $0001,$0001,$0001,$0001,$0001,$0001,$0001,$0001 
    dw $0001,$0001,$0001,$0001 

.palleteF:
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000 
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000 
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000 
    dw $0000,$0000,$0000,$0000 

MotherBrainPalettes_TransitionToGrey:
    dw MotherBrainPalettes_TransitionToFromGrey_0 
    dw MotherBrainPalettes_TransitionToFromGrey_1 
    dw MotherBrainPalettes_TransitionToFromGrey_2 
    dw MotherBrainPalettes_TransitionToFromGrey_3 
    dw MotherBrainPalettes_TransitionToFromGrey_4 
    dw MotherBrainPalettes_TransitionToFromGrey_5 
    dw MotherBrainPalettes_TransitionToFromGrey_6 
    dw MotherBrainPalettes_TransitionToFromGrey_7 
    dw $0000 

MotherBrainPalettes_TransitionFromGrey:
    dw MotherBrainPalettes_TransitionToFromGrey_7 
    dw MotherBrainPalettes_TransitionToFromGrey_6 
    dw MotherBrainPalettes_TransitionToFromGrey_5 
    dw MotherBrainPalettes_TransitionToFromGrey_4 
    dw MotherBrainPalettes_TransitionToFromGrey_3 
    dw MotherBrainPalettes_TransitionToFromGrey_2 
    dw MotherBrainPalettes_TransitionToFromGrey_1 
    dw MotherBrainPalettes_TransitionToFromGrey_0 
    dw $0000 

MotherBrainPalettes_TransitionToFromGrey_0:
    dw $269F,$0159,$004C,$0004,$5739,$4273,$2DAD,$14C6 
    dw $367F,$29F9,$2173,$150C,$0C86,$0024,$29AD,$214A 
    dw $14E7,$0C63,$29AD 

MotherBrainPalettes_TransitionToFromGrey_1:
    dw $2ABE,$0978,$046C,$0024,$5739,$4273,$2DAD,$14C6 
    dw $3A9E,$2E18,$2593,$192C,$0CA6,$0024,$258C,$1D29 
    dw $14E7,$0C63,$258C 

MotherBrainPalettes_TransitionToFromGrey_2:
    dw $32BD,$1197,$08AC,$0424,$5739,$4273,$2DAD,$14C6 
    dw $3EBD,$3238,$25B2,$194C,$10C7,$0023,$256B,$1D29 
    dw $10C6,$0C63,$256B 

MotherBrainPalettes_TransitionToFromGrey_3:
    dw $36DC,$19B6,$0CCC,$0444,$5739,$4273,$2DAD,$14C6 
    dw $42DC,$3657,$29D2,$1D6C,$10E7,$0023,$214A,$1908 
    dw $10C6,$0C63,$214A 

MotherBrainPalettes_TransitionToFromGrey_4:
    dw $3EFB,$21F5,$150B,$0865,$5739,$4273,$2DAD,$14C6 
    dw $42DB,$3656,$2DD2,$216D,$14E8,$0023,$1D4A,$18E7 
    dw $10A5,$0842,$1D4A 

MotherBrainPalettes_TransitionToFromGrey_5:
    dw $431A,$2A14,$192B,$0885,$5739,$4273,$2DAD,$14C6 
    dw $46FA,$3A75,$3211,$258D,$1508,$0023,$1929,$14C6 
    dw $10A5,$0842,$1929 

MotherBrainPalettes_TransitionToFromGrey_6:
    dw $4B19,$3233,$1D6B,$0C85,$5739,$4273,$2DAD,$14C6 
    dw $4B19,$3E95,$3211,$25AD,$1929,$0022,$1908,$14C6 
    dw $0C84,$0842,$1908 

MotherBrainPalettes_TransitionToFromGrey_7:
    dw $4F38,$3A52,$218B,$0CA5,$5739,$4273,$2DAD,$14C6 
    dw $4F38,$42B4,$3631,$29CD,$1949,$0022,$14E7,$10A5 
    dw $0C84,$0842,$14E7 

TransitionMotherBrainPaletteToGrey_FakeDeath:
    PHX 
    ASL A 
    TAX 
    LDA.L MotherBrainPalettes_TransitionToGrey,X : BNE TransitionMotherBrainPaletteToFromGrey_FakeDeath 
    PLX 
    SEC 
    RTL 


TransitionMotherBrainPaletteFromGrey_FakeDeath:
    PHX 
    ASL A 
    TAX 
    LDA.L MotherBrainPalettes_TransitionFromGrey,X : BNE TransitionMotherBrainPaletteToFromGrey_FakeDeath 
    PLX 
    SEC 
    RTL 


TransitionMotherBrainPaletteToFromGrey_FakeDeath:
    PHY : PHB : PEA.W $AD00 
    PLB : PLB 
    TAY 
    LDX.W #$0122 
    LDA.W #$0003 : JSL.L WriteAColorsFromYtoColorIndexX 
    PLB : PLY : PLX 
    CLC 
    RTL 


TransitionMotherBrainPaletteFromGrey_DrainedByBabyMetroid:
    ASL A 
    TAX 
    LDA.L MotherBrainPalettes_TransitionFromGrey,X : BNE .notZero 
    SEC 
    RTL 


.notZero:
    PHB : PEA.W $AD00 
    PLB : PLB 
    TAY 
    PHY 
    LDX.W #$0082 
    LDA.W #$000D : JSL.L WriteAColorsFromYtoColorIndexX 
    PLY 
    LDX.W #$0122 
    LDA.W #$000D : JSL.L WriteAColorsFromYtoColorIndexX 
    LDX.W #$0168 
    LDA.W #$0005 : JSL.L WriteAColorsFromYtoColorIndexX 
    LDX.W #$017C 
    LDA.W $0000,Y : STA.W $0000,X 
    PLB 
    CLC 
    RTL 


TransitionMotherBrainPaletteToGrey_DrainedByBabyMetroid:
    ASL A 
    TAX 
    LDA.L .pointers,X : BNE .notZero 
    SEC 
    RTL 


.notZero:
    PHB : PEA.W $AD00 
    PLB : PLB 
    TAY 
    PHY 
    LDX.W #$0082 
    LDA.W #$000F : JSL.L WriteAColorsFromYtoColorIndexX 
    PLY 
    LDX.W #$0122 
    LDA.W #$000F : JSL.L WriteAColorsFromYtoColorIndexX 
    LDX.W #$0168 
    LDA.W #$0005 : JSL.L WriteAColorsFromYtoColorIndexX 
    LDX.W #$017C 
    LDA.W $0000,Y : STA.W $0000,X 
    PLB 
    CLC 
    RTL 


.pointers:
    dw .palette0 
    dw .palette1 
    dw .palette2 
    dw .palette3 
    dw .palette4 
    dw .palette5 
    dw .palette6 
    dw .palette7 
    dw $0000 

.palette0:
    dw $2C75,$2C6F,$2829,$2823,$6231,$55AD,$4929,$3884 
    dw $4DB5,$4551,$40ED,$38A8,$3064,$7EB5,$2800,$1422 
    dw $3129,$2CE7,$24A5,$1C42,$416B 

.palette1:
    dw $30D5,$2CAF,$2869,$2443,$6252,$51CE,$454A,$3484 
    dw $4DF5,$4591,$410E,$34C9,$2C85,$7ED6,$2400,$1022 
    dw $2D29,$28E7,$20A5,$1842,$394A 

.palette2:
    dw $3536,$30F0,$248A,$2044,$5E73,$51EF,$414A,$2CA5 
    dw $4E16,$45B2,$3D4E,$3509,$28A5,$7F18,$1C00,$1022 
    dw $2908,$24C6,$1CA5,$1842,$354A 

.palette3:
    dw $3996,$3130,$24CA,$1C64,$5E94,$4E10,$3D6B,$28A5 
    dw $4E56,$45F2,$3D6F,$312A,$24C6,$7F39,$1800,$0C22 
    dw $2508,$20C6,$18A5,$1442,$2D29 

.palette4:
    dw $4217,$3591,$24EA,$1864,$5AD6,$4A10,$396B,$24A5 
    dw $4E97,$4213,$39AF,$314B,$24E7,$7F7B,$1000,$0822 
    dw $2108,$1CC6,$1884,$1042,$2929 

.palette5:
    dw $4677,$35D1,$252A,$1484,$5AF7,$4631,$358C,$20A5 
    dw $4ED7,$4253,$39D0,$2D6C,$2108,$7F9C,$0C00,$0422 
    dw $1D08,$18C6,$1484,$0C42,$2108 

.palette6:
    dw $4AD8,$3A12,$214B,$1085,$5718,$4652,$318C,$18C6 
    dw $4EF8,$4274,$3610,$2DAC,$1D28,$7FDE,$0400,$0422 
    dw $18E7,$14A5,$1084,$0C42,$1D08 

.palette7:
    dw $4F38,$3A52,$218B,$0CA5,$5739,$4273,$2DAD,$14C6 
    dw $4F38,$42B4,$3631,$29CD,$1949,$7FFF,$0000,$0022 
    dw $14E7,$10A5,$0C84,$0842,$14E7 

TransitionMotherBrainPaletteToGrey_RealDeath:
    ASL A 
    TAX 
    LDA.L .pointers,X : BNE .notZero 
    SEC 
    RTL 


.notZero:
    PHB : PEA.W $AD00 
    PLB : PLB 
    TAY 
    LDX.W #$01E2 
    LDA.W #$000F : JSL.L WriteAColorsFromYtoColorIndexX 
    PLB 
    CLC 
    RTL 


.pointers:
    dw .palette0 
    dw .palette1 
    dw .palette2 
    dw .palette3 
    dw .palette4 
    dw .palette5 
    dw .palette6 
    dw .palette7 
    dw $0000 

.palette0:
    dw $159F,$00DB,$0033,$000E,$31FB,$2577,$18F4,$0C70 
    dw $1D7F,$193B,$10D7,$0C93,$0450,$4A5F,$000C 

.palette1:
    dw $1DDE,$091A,$0472,$002D,$361B,$2996,$1D13,$0C6F 
    dw $25BE,$1D7A,$1516,$10B2,$086F,$529F,$000A 

.palette2:
    dw $261D,$1138,$0891,$042B,$3E5A,$2DB6,$1D32,$108D 
    dw $29FD,$2599,$1D35,$14F1,$088E,$5ADF,$0009 

.palette3:
    dw $2E5C,$1977,$0CD0,$044A,$427A,$31D5,$2151,$108C 
    dw $323C,$29D8,$2174,$1910,$0CAD,$631F,$0007 

.palette4:
    dw $367B,$21B6,$14EE,$0869,$46BA,$3615,$2550,$10AA 
    dw $3A7B,$3217,$2594,$1D50,$10EC,$673F,$0005 

.palette5:
    dw $3EBA,$29F5,$192D,$0888,$4ADA,$3A34,$296F,$10A9 
    dw $42BA,$3656,$29D3,$216F,$150B,$6F7F,$0003 

.palette6:
    dw $46F9,$3213,$1D4C,$0C86,$5319,$3E54,$298E,$14C7 
    dw $46F9,$3E75,$31F2,$25AE,$152A,$77BF,$0002 

.palette7:
    dw $4F38,$3A52,$218B,$0CA5,$5739,$4273,$2DAD,$14C6 
    dw $4F38,$42B4,$3631,$29CD,$1949,$7FFF,$0000 

FadeOutBackgroundForBabyMetroidDeathSequence:
    PHB : PEA.W $AD00 
    PLB : PLB : PHX : PHY 
    LDY.W #.justZeroes 
    LDX.W #$0062 
    LDA.W #$000E : JSL.L WriteAColorsFromYtoColorIndexX 
    LDY.W #.justZeroes 
    LDX.W #$00A2 
    LDA.W #$000E : JSL.L WriteAColorsFromYtoColorIndexX 
    PLY : PLX : PLB 
    RTL 


.justZeroes:
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000 
    dw $0000,$0000,$0000,$0000,$0000,$0000 

FadeInBackgroundForMotherBrainPhase3:
    ASL A 
    TAX 
    LDA.L .pointers,X : BNE .notZero 
    SEC 
    RTL 


.notZero:
    PHB : PEA.W $AD00 
    PLB : PLB 
    TAY 
    LDX.W #$0062 
    LDA.W #$000E : JSL.L WriteAColorsFromYtoColorIndexX 
    LDX.W #$00A2 
    LDA.W #$000E : JSL.L WriteAColorsFromYtoColorIndexX 
    PLB 
    CLC 
    RTL 


.pointers:
    dw .palette6 
    dw .palette5 
    dw .palette4 
    dw .palette3 
    dw .palette2 
    dw .palette1 
    dw .palette0 
    dw $0000 

.palette0:
    dw $72B2,$71C7,$4463,$4A16,$3991,$2D2C,$1CA7,$20E5 
    dw $18A4,$1083,$0841,$0000,$0000,$02DF,$6318,$6318 
    dw $0802,$5294,$39CE,$2108,$1084,$0019,$0012,$5C00 
    dw $4000,$1084,$197F,$7FFF 

.palette1:
    dw $624F,$6186,$3842,$3DB2,$314E,$24EA,$1886,$18C4 
    dw $1483,$0C62,$0420,$0000,$0000,$025A,$5294,$5294 
    dw $0401,$4631,$318C,$18C6,$0C63,$0015,$000F,$4C00 
    dw $3400,$0C63,$153A,$6B5A 

.palette2:
    dw $51EC,$5145,$3042,$316F,$290C,$1CC8,$1465,$14A3 
    dw $1062,$0842,$0420,$0000,$0000,$01F6,$4631,$4631 
    dw $0401,$39CE,$294A,$14A5,$0842,$0011,$000C,$4000 
    dw $2C00,$0842,$10F6,$5AD6 

.palette3:
    dw $418A,$4104,$2421,$292C,$20C9,$18A6,$1044,$1082 
    dw $0C42,$0841,$0420,$0000,$0000,$0191,$35AD,$35AD 
    dw $0401,$2D6B,$2108,$1084,$0842,$000E,$000A,$3400 
    dw $2400,$0842,$0CD1,$4631 

.palette4:
    dw $3127,$30C3,$1C21,$1CC9,$18A7,$1065,$0C43,$0C62 
    dw $0841,$0421,$0000,$0000,$0000,$012D,$294A,$294A 
    dw $0000,$2108,$18C6,$0C63,$0421,$000A,$0007,$2400 
    dw $1800,$0421,$088D,$35AD 

.palette5:
    dw $20C5,$2082,$1000,$1486,$1064,$0C43,$0822,$0841 
    dw $0421,$0420,$0000,$0000,$0000,$00C8,$18C6,$18C6 
    dw $0000,$14A5,$1084,$0842,$0421,$0007,$0005,$1800 
    dw $1000,$0421,$0468,$2108 

.palette6:
    dw $1062,$1041,$0800,$0843,$0822,$0421,$0401,$0420 
    dw $0000,$0000,$0000,$0000,$0000,$0064,$0C63,$0C63 
    dw $0000,$0842,$0842,$0421,$0000,$0003,$0002,$0C00 
    dw $0800,$0000,$0024,$1084 

EnableEarthquakeTypeInAFor20Frames:
    STA.W $183E 
    LDA.W #$0014 : STA.W $1840 
    LDA.W #$0025 : JSL.L QueueSound_Lib2_Max6 
    RTL 


HandleMotherBrainBodyFlickering:
    LDA.W $0FA4 
    LSR A 
    BCC .invisible 
    LDA.B $69 : ORA.W #$0002 : STA.B $69 
    LDA.W $0F86 : AND.W #$FEFF : STA.W $0F86 
    RTL 


.invisible:
    LDA.B $69 : AND.W #$FFFD : STA.B $69 
    LDA.W $0F86 : ORA.W #$0100 : STA.W $0F86 
    RTL 


Freespace_BankAD_F444: 
; $BBC bytes
