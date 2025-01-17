
org $948000


PostGrappleCollisionDetection_Horizontal_Slope_NonSquare:
    LDA.W $0B02 
    LSR A 
    BCC .left 
    JMP.W .right 


.left:
    LDA.W $0DC4 : STA.W $4204 
    SEP #$20 
    LDA.W $07A5 : STA.W $4206 
    REP #$20 
    LDA.W $0AF6 
    LSR #4
    CMP.W $4216 
    BEQ ..centerInBlock 
    CLC 
    RTS 


..centerInBlock:
    LDA.B $20 : AND.W #$000F : STA.W $0DD4 
    LDA.L $7F6402,X : AND.W #$001F 
    ASL #4
    STA.W $0DD6 
    LDA.L $7F6401,X 
    ASL A 
    BPL ..gotoSolid 
    LDA.L $7F6401,X : BMI ..blockBTSMSB 
    LDA.W $0AFA : BRA + 


..blockBTSMSB:
    LDA.W $0AFA 
    EOR.W #$000F 

  + AND.W #$000F 
    CLC : ADC.W $0DD6 : TAX 
    LDA.W SlopeDefinitions_SlopeLeftXOffsetByYPixel,X : AND.W #$001F 
    SEC : SBC.W $0DD4 : DEC A 
    BEQ ..returnCarrySet 
    BMI ..returnCarryClear 

..returnCarrySet:
    SEC 
    RTS 


..returnCarryClear:
    CLC 
    RTS 


..gotoSolid:
    JMP.W PostGrappleCollisionDetection_Horizontal_Solid 


.right:
    LDA.W $0DC4 : STA.W $4204 
    SEP #$20 
    LDA.W $07A5 : STA.W $4206 
    REP #$20 
    LDA.W $0AF6 
    LSR #4
    CMP.W $4216 
    BEQ ..centerInBlock 
    CLC 
    RTS 


..centerInBlock:
    LDA.B $20 : AND.W #$000F : STA.W $0DD4 
    LDA.L $7F6402,X : AND.W #$001F 
    ASL #4
    STA.W $0DD6 
    LDA.L $7F6401,X 
    ASL A 
    BMI ..gotoSolid 
    LDA.L $7F6401,X : BMI ..blockBTSMSB 
    LDA.W $0AFA : BRA + 


..blockBTSMSB:
    LDA.W $0AFA 
    EOR.W #$000F 

  + AND.W #$000F 
    CLC : ADC.W $0DD6 : TAX 
    LDA.W SlopeDefinitions_SlopeLeftXOffsetByYPixel,X : AND.W #$001F 
    SEC : SBC.W $0DD4 : DEC A 
    BEQ + 
    BPL ..returnCarryClear 

  + EOR.W #$FFFF 
    SEC 
    RTS 


..returnCarryClear:
    CLC 
    RTS 


..gotoSolid:
    JMP.W PostGrappleCollisionDetection_Horizontal_Solid 


PostGrappleCollisionDetection_Vertical_Slope_NonSquare:
    LDA.W $0B02 
    LSR A 
    BCC .up 
    JMP.W .down 


.up:
    LDA.W $0DC4 : STA.W $4204 
    SEP #$20 
    LDA.W $07A5 : STA.W $4206 
    REP #$20 
    LDA.W $0AF6 
    LSR #4
    CMP.W $4216 
    BEQ ..centerInBlock 
    CLC 
    RTS 


..centerInBlock:
    LDA.B $20 : AND.W #$000F : STA.W $0DD4 
    LDA.L $7F6402,X : AND.W #$001F 
    ASL #4
    STA.W $0DD6 
    LDA.L $7F6401,X : BPL ..gotoSolid 
    ASL A 
    BMI ..blockBTS40 
    LDA.W $0AF6 : BRA + 


..blockBTS40:
    LDA.W $0AF6 
    EOR.W #$000F 

  + AND.W #$000F 
    CLC : ADC.W $0DD6 : TAX 
    LDA.W SlopeDefinitions_SlopeTopXOffsetByYPixel,X : AND.W #$001F 
    SEC : SBC.W $0DD4 : DEC A 
    BEQ ..returnCarrySet 
    BMI ..returnCarryClear 

..returnCarrySet:
    SEC 
    RTS 


..returnCarryClear:
    CLC 
    RTS 


..gotoSolid:
    JMP.W PostGrappleCollisionDetection_Vertical_Solid 


.down:
    LDA.W $0DC4 : STA.W $4204 
    SEP #$20 
    LDA.W $07A5 : STA.W $4206 
    REP #$20 
    LDA.W $0AF6 
    LSR #4
    CMP.W $4216 
    BEQ ..centerInBlock 
    CLC 
    RTS 


..centerInBlock:
    LDA.B $20 : AND.W #$000F : STA.W $0DD4 
    LDA.L $7F6402,X : AND.W #$001F 
    ASL #4
    STA.W $0DD6 
    LDA.L $7F6401,X : BMI ..gotoSolid 
    ASL A 
    BMI ..blockBTS40 
    LDA.W $0AF6 : BRA + 


..blockBTS40:
    LDA.W $0AF6 
    EOR.W #$000F 

  + AND.W #$000F 
    CLC : ADC.W $0DD6 : TAX 
    LDA.W SlopeDefinitions_SlopeTopXOffsetByYPixel,X : AND.W #$001F 
    SEC : SBC.W $0DD4 : DEC A 
    BEQ + 
    BPL ..returnCarryClear 

  + EOR.W #$FFFF 
    SEC 
    RTS 


..returnCarryClear:
    CLC 
    RTS 


..gotoSolid:
    JMP.W PostGrappleCollisionDetection_Vertical_Solid 


PostGrappleCollisionDetection_Horizontal_Slope_Square:
    LDA.L $7F6402,X : AND.W #$001F 
    ASL #2
    STA.W $0DD4 
    LDA.L $7F6401,X 
    ROL A 
    ROL A 
    ROL A 
    AND.W #$0003 
    STA.W $0DD6 
    LDA.B $20 : AND.W #$0008 
    LSR #3
    EOR.W $0DD6 
    ADC.W $0DD4 : TAX 
    LDA.B $1A : BNE .top 
    LDA.W $0AFA : CLC : ADC.W $0B00 : DEC A 
    AND.W #$0008 
    BNE .checkBothHalves 
    LDA.W SquareSlopeDefinitions_Bank94-1,X : BMI .solid 
    BRA .noCollision 


.top:
    CMP.B $1C 
    BNE .checkBothHalves 
    LDA.W $0AFA : SEC : SBC.W $0B00 : AND.W #$0008 
    BNE .checkBottomHalf 

.checkBothHalves:
    LDA.W SquareSlopeDefinitions_Bank94-1,X : BMI .solid 

.checkBottomHalf:
    TXA 
    EOR.W #$0002 
    TAX 
    LDA.W SquareSlopeDefinitions_Bank94-1,X : BMI .solid 

.noCollision:
    CLC 
    RTS 


.solid:
    LDA.W $0B02 
    LSR A 
    BCC .left 
    LDA.B $20 : AND.W #$0007 
    SEC 
    RTS 


.left:
    LDA.B $20 : AND.W #$0007 
    EOR.W #$0007 
    SEC 
    RTS 


PostGrappleCollisionDetection_Vertical_Slope_Square:
    LDA.L $7F6402,X : AND.W #$001F 
    ASL #2
    STA.W $0DD4 
    LDA.L $7F6401,X 
    ROL A 
    ROL A 
    ROL A 
    AND.W #$0003 
    STA.W $0DD6 
    LDA.B $20 : AND.W #$0008 
    LSR #2
    EOR.W $0DD6 
    ADC.W $0DD4 : TAX 
    LDA.B $1A : BNE .leftmostBlock 
    LDA.W $0AF6 : CLC : ADC.W $0AFE : DEC A 
    AND.W #$0008 
    BNE .checkBothHalves 
    LDA.W SquareSlopeDefinitions_Bank94-1,X : BMI .solid 
    BRA .returnNoCollision 


.leftmostBlock:
    CMP.B $1C 
    BNE .checkBothHalves 
    LDA.W $0AF6 : SEC : SBC.W $0AFE : AND.W #$0008 
    BNE .right 

.checkBothHalves:
    LDA.W SquareSlopeDefinitions_Bank94-1,X : BMI .solid 

.right:
    TXA 
    EOR.W #$0001 
    TAX 
    LDA.W SquareSlopeDefinitions_Bank94-1,X : BMI .solid 

.returnNoCollision:
    CLC 
    RTS 


.solid:
    LDA.W $0B02 
    LSR A 
    BCC .up 
    LDA.B $20 : AND.W #$0007 
    SEC 
    RTS 


.up:
    LDA.B $20 : AND.W #$0007 
    EOR.W #$0007 
    SEC 
    RTS 


CLCRTS_9482A7:
    CLC 
    RTS 


PostGrappleCollisionDetection_Horizontal_Slope:
    LDX.W $0DC4 
    LDA.L $7F6402,X : AND.W #$001F 
    CMP.W #$0005 
    BCC .gotoSquare 
    JMP.W PostGrappleCollisionDetection_Horizontal_Slope_NonSquare 


.gotoSquare:
    JMP.W PostGrappleCollisionDetection_Horizontal_Slope_Square 


PostGrappleCollisionDetection_Horizontal_Solid:
    LDA.B $20 : AND.W #$000F 
    SEC 
    RTS 


PostGrappleCollisionDetection_Vertical_Slope:
    LDX.W $0DC4 
    LDA.L $7F6402,X : AND.W #$001F 
    CMP.W #$0005 
    BCC .gotoSquare 
    JMP.W PostGrappleCollisionDetection_Vertical_Slope_NonSquare 


.gotoSquare:
    JMP.W PostGrappleCollisionDetection_Vertical_Slope_Square 


PostGrappleCollisionDetection_Vertical_Solid:
    LDA.B $20 : AND.W #$000F 
    SEC 
    RTS 


PostGrappleCollisionDetection_Horizontal_JumpTable:
    dw CLCRTS_9482A7 
    dw PostGrappleCollisionDetection_Horizontal_Slope 
    dw CLCRTS_9482A7 
    dw CLCRTS_9482A7 
    dw CLCRTS_9482A7 
    dw CLCRTS_9482A7 
    dw CLCRTS_9482A7 
    dw CLCRTS_9482A7 
    dw PostGrappleCollisionDetection_Horizontal_Solid 
    dw PostGrappleCollisionDetection_Horizontal_Solid 
    dw PostGrappleCollisionDetection_Horizontal_Solid 
    dw PostGrappleCollisionDetection_Horizontal_Solid 
    dw PostGrappleCollisionDetection_Horizontal_Solid 
    dw PostGrappleCollisionDetection_Horizontal_Solid 
    dw PostGrappleCollisionDetection_Horizontal_Solid 
    dw PostGrappleCollisionDetection_Horizontal_Solid 

PostGrappleCollisionDetection_Vertical_JumpTable:
    dw CLCRTS_9482A7 
    dw PostGrappleCollisionDetection_Vertical_Slope 
    dw CLCRTS_9482A7 
    dw CLCRTS_9482A7 
    dw CLCRTS_9482A7 
    dw CLCRTS_9482A7 
    dw CLCRTS_9482A7 
    dw CLCRTS_9482A7 
    dw PostGrappleCollisionDetection_Vertical_Solid 
    dw PostGrappleCollisionDetection_Vertical_Solid 
    dw PostGrappleCollisionDetection_Vertical_Solid 
    dw PostGrappleCollisionDetection_Vertical_Solid 
    dw PostGrappleCollisionDetection_Vertical_Solid 
    dw PostGrappleCollisionDetection_Vertical_Solid 
    dw PostGrappleCollisionDetection_Vertical_Solid 
    dw PostGrappleCollisionDetection_Vertical_Solid 

PostGrappleCollisionDetection_Horizontal_SingleBlock:
    PHX 
    TXA 
    LSR A 
    STA.W $0DC4 
    LDA.L $7F0002,X : AND.W #$F000 
    XBA 
    LSR #3
    TAX 
    JSR.W (PostGrappleCollisionDetection_Horizontal_JumpTable,X) 
    PLX 
    RTS 


PostGrappleCollisionDetection_Vertical_SingleBlock:
    PHX 
    TXA 
    LSR A 
    STA.W $0DC4 
    LDA.L $7F0002,X : AND.W #$F000 
    XBA 
    LSR #3
    TAX 
    JSR.W (PostGrappleCollisionDetection_Vertical_JumpTable,X) 
    PLX 
    RTS 


PostGrappleCollisionDetection_Rightwards:
    PHB : PHK : PLB 
    LDA.W #$0001 : STA.W $0B02 
    STZ.W $0E04 
    JSR.W CalculateSamusYBlockSpan 
    LDA.W $0AFA : SEC : SBC.W $0B00 : LSR #4
    SEP #$20 
    STA.W $4202 
    LDA.W $07A5 : STA.W $4203 
    REP #$20 
    LDA.W $0AF8 : STA.B $16 
    LDA.W $0AF6 : STA.B $18 
    CLC : ADC.W $0AFE : DEC A 
    STA.B $20 
    LSR #4
    CLC : ADC.W $4216 : STA.W $0DC4 
    ASL A 
    TAX 

.loop:
    JSR.W PostGrappleCollisionDetection_Horizontal_SingleBlock 
    BCC .noCollision 
    INC A 
    CMP.W $0E04 
    BCC .noCollision 
    STA.W $0E04 

.noCollision:
    TXA 
    CLC : ADC.W $07A5 : ADC.W $07A5 : TAX 
    DEC.B $1A 
    BPL .loop 
    PLB 
    RTS 


PostGrappleCollisionDetection_Leftwards:
    PHB : PHK : PLB 
    STZ.W $0B02 
    STZ.W $0E06 
    JSR.W CalculateSamusYBlockSpan 
    LDA.W $0AFA : SEC : SBC.W $0B00 : LSR #4
    SEP #$20 
    STA.W $4202 
    LDA.W $07A5 : STA.W $4203 
    REP #$20 
    LDA.W $0AF8 : STA.B $16 
    LDA.W $0AF6 : STA.B $18 
    SEC : SBC.W $0AFE : STA.B $20 
    LSR #4
    CLC : ADC.W $4216 : STA.W $0DC4 
    ASL A 
    TAX 

.loop:
    JSR.W PostGrappleCollisionDetection_Horizontal_SingleBlock 
    BCC .noCollision 
    INC A 
    CMP.W $0E06 
    BCC .noCollision 
    STA.W $0E06 

.noCollision:
    TXA 
    CLC : ADC.W $07A5 : ADC.W $07A5 : TAX 
    DEC.B $1A 
    BPL .loop 
    PLB 
    RTS 


PostGrappleCollisionDetection_Downwards:
    PHB : PHK : PLB 
    LDA.W #$0003 : STA.W $0B02 
    STZ.W $0E08 
    JSR.W CalculateSamusXBlockSpan 
    LDA.W $0AFC : STA.B $16 
    LDA.W $0AFA : STA.B $18 
    CLC : ADC.W $0B00 : DEC A 
    STA.B $20 
    LSR #4
    SEP #$20 
    STA.W $4202 
    LDA.W $07A5 : STA.W $4203 
    REP #$20 
    LDA.W $0AF6 : SEC : SBC.W $0AFE : LSR #4
    CLC : ADC.W $4216 : STA.W $0DC4 
    ASL A 
    TAX 

.loop:
    JSR.W PostGrappleCollisionDetection_Vertical_SingleBlock 
    BCC .nocollision 
    INC A 
    CMP.W $0E08 
    BCC .nocollision 
    STA.W $0E08 

.nocollision:
    INX #2
    DEC.B $1A 
    BPL .loop 
    PLB 
    RTS 


PostGrappleCollisionDetection_Upwards:
    PHB : PHK : PLB 
    LDA.W #$0002 : STA.W $0B02 
    STZ.W $0E0A 
    JSR.W CalculateSamusXBlockSpan 
    LDA.W $0AFC : STA.B $16 
    LDA.W $0AFA : STA.B $18 
    SEC : SBC.W $0B00 : STA.B $20 
    LSR #4
    SEP #$20 
    STA.W $4202 
    LDA.W $07A5 : STA.W $4203 
    REP #$20 
    LDA.W $0AF6 : SEC : SBC.W $0AFE : LSR #4
    CLC : ADC.W $4216 : STA.W $0DC4 
    ASL A 
    TAX 

.loop:
    JSR.W PostGrappleCollisionDetection_Vertical_SingleBlock 
    BCC .noCollision 
    INC A 
    CMP.W $0E0A 
    BCC .noCollision 
    STA.W $0E0A 

.noCollision:
    INX #2
    DEC.B $1A 
    BPL .loop 
    PLB 
    RTS 


PostGrappleCollisionDetection_Horizontal:
    PHP 
    JSR.W PostGrappleCollisionDetection_Rightwards 
    JSR.W PostGrappleCollisionDetection_Leftwards 
    PLP 
    RTL 


PostGrappleCollisionDetection_Vertical:
    PHP 
    JSR.W PostGrappleCollisionDetection_Downwards 
    JSR.W PostGrappleCollisionDetection_Upwards 
    PLP 
    RTL 


SamusBlockCollisionDetection_Horizontal_Slope_NonSquare:
    LDA.W $1E77 : BIT.W #$0080 
    BNE .returnNoCollision 
    LDA.W $0B2C 
    ORA.W $0B2E 
    BEQ .SamusOnSlopeSurface 

.returnNoCollision:
    CLC 
    RTS 


.SamusOnSlopeSurface:
    LDA.W $1E77 : AND.W #$001F 
    ASL #2
    TAX 
    LDA.B $12 : BPL .right 
    LDA.W $0B48 
    ORA.W $0B46 
    BEQ .backToReality 
    LDA.W $1E77 : BIT.W #$0040 
    BNE + 
    LDA.W $0B48 : CLC : ADC.W .speedModifiers,X : BCC .backToReality 
    BRA .backToReality 


  + LDA.W $0B48 : SEC : SBC.W .speedModifiers,X : BCS .backToReality ; >.<

.backToReality:
    SEP #$20 
    LDA.B $12 
    XBA 
    LDA.B $15 
    REP #$20 
    EOR.W #$FFFF 
    INC A 
    LDY.W .adjustedDistanceMultiplier,X 
    JSL.L A_Y_16bit_UnsignedMultiplication 
    LDA.W $05F1 
    EOR.W #$FFFF 
    CLC : ADC.W #$0001 : STA.B $14 
    LDA.W $05F3 
    EOR.W #$FFFF 
    ADC.W #$0000 : STA.B $12 
    CLC 
    RTS 


.right:
    LDA.W $0B48 
    ORA.W $0B46 
    BEQ ..backToReality 
    LDA.W $1E77 : BIT.W #$0040 
    BEQ + 
    LDA.W $0B48 : CLC : ADC.W .speedModifiers,X : BCC ..backToReality 
    BRA ..backToReality 


  + LDA.W $0B48 : SEC : SBC.W .speedModifiers,X : BCS ..backToReality 

..backToReality:
    SEP #$20 
    LDA.B $12 
    XBA 
    LDA.B $15 
    REP #$20 
    LDY.W .adjustedDistanceMultiplier,X 
    JSL.L A_Y_16bit_UnsignedMultiplication 
    LDA.W $05F1 : STA.B $14 
    LDA.W $05F3 : STA.B $12 
    CLC 
    RTS 

;        _________ Unused. Seem to be speed modifiers, added to or subtracted from Samus X base subspeed when moving down or up the slope respectively
;       |      ___ Adjusted distance multiplier * 100h
;       |     |
.speedModifiers:
    dw $0000 
.adjustedDistanceMultiplier:
    dw       $0100 
    dw $0000,$0100
    dw $0000,$0100
    dw $0000,$0100
    dw $0000,$0100
    dw $0000,$0100 ; 5: Unused. Half height isosceles triangle
    dw $0000,$0100 ; 6: Unused. Isosceles triangle
    dw $0000,$0100 ; 7: Half height rectangle
    dw $0000,$0100 ; 8: Unused. Rectangle
    dw $0000,$0100 ; 9: Unused. Rectangle
    dw $0000,$0100 ; Ah: Unused. Rectangle
    dw $0000,$0100 ; Bh: Unused. Rectangle
    dw $0000,$0100 ; Ch: Unused. Rectangle
    dw $0000,$0100 ; Dh: Unused. Rectangle
    dw $1000,$00B0 ; Eh: Unused. Very bumpy triangle
    dw $1000,$00B0 ; Fh: Bumpy triangle
    dw $0000,$0100 ; 10h: Unused
    dw $0000,$0100 ; 11h: Unused
    dw $1000,$00C0 ; 12h: Triangle
    dw $0000,$0100 ; 13h: Rectangle
    dw $1000,$00C0 ; 14h: Quarter triangle
    dw $1000,$00C0 ; 15h: Three quarter triangle
    dw $0800,$00D8 ; 16h: Lower half-height triangle
    dw $0800,$00D8 ; 17h: Upper half-height triangle
    dw $0600,$00F0 ; 18h: Unused. Lower third-height triangle
    dw $0600,$00F0 ; 19h: Unused. Middle third-height triangle
    dw $0600,$00F0 ; 1Ah: Unused. Upper third-height triangle
    dw $4000,$0080 ; 1Bh: Upper half-width triangle
    dw $4000,$0080 ; 1Ch: Lower half-width triangle
    dw $6000,$0050 ; 1Dh: Unused. Upper third-width triangle
    dw $6000,$0050 ; 1Eh: Unused. Middle third-width triangle
    dw $6000,$0050 ; 1Fh: Unused. Lower third-width triangle


if !FEATURE_KEEP_UNREFERENCED
UNUSED_948606:
    LDA.W $0DC4 : STA.W $4204 
    SEP #$20 
    LDA.W $07A5 : STA.W $4206 
    REP #$20 
    LDA.W $0AF6 
    LSR #4
    CMP.W $4216 
    BEQ .centerInBlock 
    CLC 
    RTS 


.centerInBlock:
    LDA.B $18 : SEC : SBC.W $0AFE : AND.W #$000F 
    EOR.W #$000F 
    STA.W $0DD4 
    LDA.L $7F6402,X : AND.W #$001F 
    ASL #4
    STA.W $0DD6 
    LDA.L $7F6401,X 
    ASL A 
    BPL .gotoSolidShootableGrapple 
    LDA.L $7F6401,X : BMI .blockBTSMSB 
    LDA.W $0AFA : BRA + 


.blockBTSMSB:
    LDA.W $0AFA 
    EOR.W #$000F 

  + AND.W #$000F 
    CLC : ADC.W $0DD6 : TAX 
    LDA.W SlopeDefinitions_SlopeLeftXOffsetByYPixel,X : AND.W #$001F 
    SEC : SBC.W $0DD4 : DEC A 
    BEQ + 
    BPL ..returnNoCollision 

  + CLC : ADC.B $12 : BPL + 
    LDA.W #$0000 

  + STA.B $12 
    STZ.B $14 
    SEC 
    RTS 


..returnNoCollision:
    CLC 
    RTS 


.gotoSolidShootableGrapple:
    JMP.W SamusBlockCollisionReaction_Horizontal_SolidShootableGrapple 


.right:
    LDA.W $0DC4 : STA.W $4204 
    SEP #$20 
    LDA.W $07A5 : STA.W $4206 
    REP #$20 
    LDA.W $0AF6 
    LSR #4
    CMP.W $4216 
    BEQ ..centerInBlock 
    CLC 
    RTS 


..centerInBlock:
    LDA.B $18 : CLC : ADC.W $0AFE : DEC A 
    AND.W #$000F 
    STA.W $0DD4 
    LDA.L $7F6402,X : AND.W #$001F 
    ASL #4
    STA.W $0DD6 
    LDA.L $7F6401,X 
    ASL A 
    BMI ..gotoSolidShootableGrapple 
    LDA.L $7F6401,X : BMI ..blockBTSMSB 
    LDA.W $0AFA : BRA + 


..blockBTSMSB:
    LDA.W $0AFA 
    EOR.W #$000F 

  + AND.W #$000F 
    CLC : ADC.W $0DD6 : TAX 
    LDA.W SlopeDefinitions_SlopeLeftXOffsetByYPixel,X : AND.W #$001F 
    SEC : SBC.W $0DD4 : DEC A 
    BEQ + 
    BPL ..returnNoCollision 

  + CLC : ADC.B $12 : BPL + 
    LDA.W #$0000 

  + STA.B $12 
    STZ.B $14 
    SEC 
    RTS 


..returnNoCollision:
    CLC 
    RTS 


..gotoSolidShootableGrapple:
    JMP.W SamusBlockCollisionReaction_Horizontal_SolidShootableGrapple 
endif ; !FEATURE_KEEP_UNREFERENCED


SamusBlockCollisionReaction_Vertical_Slope_NonSquare:
    LDA.W $0B02 
    LSR A 
    BCC .up 
    JMP.W .down 


.up:
    LDA.W $0DC4 : STA.W $4204 
    SEP #$20 
    LDA.W $07A5 : STA.W $4206 
    REP #$20 
    LDA.W $0AF6 
    LSR #4
    CMP.W $4216 
    BEQ ..centerInBlock 
    CLC 
    RTS 


..centerInBlock:
    LDA.B $18 : SEC : SBC.W $0B00 : AND.W #$000F 
    EOR.W #$000F 
    STA.W $0DD4 
    LDA.L $7F6402,X : AND.W #$001F 
    ASL #4
    STA.W $0DD6 
    LDA.L $7F6401,X : BPL ..gotoReturnNoCollision 
    ASL A 
    BMI ..blockBTS40 
    LDA.W $0AF6 : BRA + 


..blockBTS40:
    LDA.W $0AF6 
    EOR.W #$000F 

  + AND.W #$000F 
    CLC : ADC.W $0DD6 : TAX 
    LDA.W SlopeDefinitions_SlopeTopXOffsetByYPixel,X : AND.W #$001F 
    SEC : SBC.W $0DD4 : DEC A 
    BEQ + 
    BPL ..returnNoCollision 

  + CLC : ADC.B $12 : BPL + 
    LDA.W #$0000 

  + STA.B $12 
    STZ.B $14 
    SEC 
    RTS 


..returnNoCollision:
    CLC 
    RTS 


..gotoReturnNoCollision:
    JMP.W ..returnNoCollision ; >.<


.down:
    LDA.W $0DC4 : STA.W $4204 
    SEP #$20 
    LDA.W $07A5 : STA.W $4206 
    REP #$20 
    LDA.W $0AF6 
    LSR #4
    CMP.W $4216 
    BEQ ..centerInBlock 
    CLC 
    RTS 


..centerInBlock:
    LDA.B $18 : CLC : ADC.W $0B00 : DEC A 
    AND.W #$000F 
    STA.W $0DD4 
    LDA.L $7F6402,X : AND.W #$001F 
    ASL #4
    STA.W $0DD6 
    LDA.L $7F6401,X : BMI ..returnNoCollision 
    ASL A 
    BMI ..blockBTS40 
    LDA.W $0AF6 : BRA + 


..blockBTS40:
    LDA.W $0AF6 
    EOR.W #$000F 

  + AND.W #$000F 
    CLC : ADC.W $0DD6 : TAX 
    LDA.W SlopeDefinitions_SlopeTopXOffsetByYPixel,X : AND.W #$001F 
    SEC : SBC.W $0DD4 : DEC A 
    BEQ + 
    BPL ..returnNoCollision 

  + CLC : ADC.B $12 : BPL + 
    LDA.W #$0000 

  + STA.B $12 
    STZ.B $14 
    SEC 
    RTS 


..returnNoCollision:
    CLC 
    RTS 


Align_SamusYPosition_WithNonSquareSlope:
    PHB : PHK : PLB 
    LDA.W $0A46 : BIT.W #$0002 
    BNE .bottom 
    JMP.W .return 


.bottom:
    LDA.W $0AF6 : STA.B $1A 
    LDA.W $0AFA : CLC : ADC.W $0B00 : DEC A 
    STA.B $1C 
    STZ.B $1E 
    STZ.B $20 
    JSR.W CalculateBlockAt_12_1E_1C_20 
    LDA.W $0DC4 
    ASL A 
    TAX 
    LDA.L $7F0002,X : AND.W #$F000 
    CMP.W #$1000 
    BNE .SamusTopCheck 
    LDX.W $0DC4 
    LDA.L $7F6402,X : AND.W #$001F 
    CMP.W #$0005 
    BCC .SamusTopCheck 
    LDA.W $0AFA : CLC : ADC.W $0B00 : DEC A 
    AND.W #$000F 
    STA.W $0DD4 
    LDA.L $7F6402,X : AND.W #$001F 
    ASL #4
    STA.W $0DD6 
    LDA.L $7F6401,X : BMI .SamusTopCheck 
    ASL A 
    BMI ..blockBTS40 
    LDA.W $0AF6 : BRA + 


..blockBTS40:
    LDA.W $0AF6 
    EOR.W #$000F 

  + AND.W #$000F 
    CLC : ADC.W $0DD6 : TAX 
    LDA.W SlopeDefinitions_SlopeTopXOffsetByYPixel,X : AND.W #$001F 
    SEC : SBC.W $0DD4 : DEC A 
    BPL .SamusTopCheck 
    CLC : ADC.W $0AFA : STA.W $0AFA 
    LDA.W #$0001 : STA.W $0DBA 

.SamusTopCheck:
    LDA.W $0AF6 : STA.B $1A 
    LDA.W $0AFA : SEC : SBC.W $0B00 : STA.B $1C 
    STZ.B $1E 
    STZ.B $20 
    JSR.W CalculateBlockAt_12_1E_1C_20 
    LDA.W $0DC4 
    ASL A 
    TAX 
    LDA.L $7F0002,X : AND.W #$F000 
    CMP.W #$1000 
    BNE .return 
    LDX.W $0DC4 
    LDA.L $7F6402,X : AND.W #$001F 
    CMP.W #$0005 
    BCC .return 
    LDA.W $0AFA : SEC : SBC.W $0B00 : AND.W #$000F 
    EOR.W #$000F 
    STA.W $0DD4 
    LDA.L $7F6402,X : AND.W #$001F 
    ASL #4
    STA.W $0DD6 
    LDA.L $7F6401,X : BPL .return 
    ASL A 
    BMI ..blockBTS40 
    LDA.W $0AF6 : BRA + 


..blockBTS40:
    LDA.W $0AF6 
    EOR.W #$000F 

  + AND.W #$000F 
    CLC : ADC.W $0DD6 : TAX 
    LDA.W SlopeDefinitions_SlopeTopXOffsetByYPixel,X : AND.W #$001F 
    SEC : SBC.W $0DD4 : DEC A 
    BEQ + 
    BPL .return 

  + EOR.W #$FFFF 
    INC A 
    CLC : ADC.W $0AFA : STA.W $0AFA 
    LDA.W #$0001 : STA.W $0DBA 

.return:
    PLB 
    RTL 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_SlopeDefinitions_94891B:
    db $0F,$0E,$0D,$0C,$0B,$0A,$09,$08,$07,$06,$05,$04,$03,$02,$01,$00 
endif ; !FEATURE_KEEP_UNREFERENCED

SlopeDefinitions_SlopeLeftXOffsetByYPixel:
; ALMOST unused, used only by post-grapple collision detection (which has no effect), but referenced by some unused code too
; Data here looks incorrect, many of the rows here are identical to $8B2B
; Indexed by ([block BTS] & 1Fh) * 10h + [Samus Y position] % 10h
    db $10,$10,$10,$10,$10,$10,$10,$10,$00,$00,$00,$00,$00,$00,$00,$00 
    db $08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08 
    db $10,$10,$10,$10,$10,$10,$10,$10,$08,$08,$08,$08,$08,$08,$08,$08 
    db $08,$08,$08,$08,$08,$08,$08,$08,$00,$00,$00,$00,$00,$00,$00,$00 
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $10,$0F,$0E,$0D,$0C,$0B,$0A,$09,$09,$0A,$0B,$0C,$0D,$0E,$0F,$10 ; 5: Unused. Half height isosceles triangl
    db $10,$0E,$0C,$0A,$08,$06,$04,$02,$02,$04,$06,$08,$0A,$0C,$0E,$10 ; 6: Unused. Isosceles triangle
    db $10,$10,$10,$10,$10,$10,$10,$10,$00,$00,$00,$00,$00,$00,$00,$00 ; 7: Half height rectangle
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; 8: Unused. Rectangle
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; 9: Unused. Rectangle
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; Ah: Unused. Rectangle
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; Bh: Unused. Rectangle
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; Ch: Unused. Rectangle
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; Dh: Unused. Rectangle
    db $0C,$0C,$0C,$0C,$08,$08,$08,$08,$04,$04,$04,$04,$00,$00,$00,$00 ; Eh: Unused. Very bumpy triangle
    db $0E,$0E,$0C,$0C,$0A,$0A,$08,$08,$06,$06,$04,$04,$02,$02,$00,$00 ; Fh: Bumpy triangle
    db $10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10 ; 10h: Unused
    db $14,$14,$14,$14,$14,$14,$14,$14,$14,$14,$14,$14,$14,$10,$10,$10 ; 11h: Unused
    db $10,$0F,$0E,$0D,$0C,$0B,$0A,$09,$08,$07,$06,$05,$04,$03,$02,$01 ; 12h: Triangle
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; 13h: Rectangle
    db $10,$10,$10,$10,$10,$10,$10,$10,$10,$0F,$0E,$0D,$0C,$0B,$0A,$09 ; 14h: Quarter triangle
    db $08,$07,$06,$05,$04,$03,$02,$01,$00,$00,$00,$00,$00,$00,$00,$00 ; 15h: Three quarter triangle
    db $10,$10,$10,$10,$10,$10,$10,$10,$10,$0E,$0C,$0A,$08,$06,$04,$02 ; 16h: Lower half-height triangle
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$02,$04,$06,$08,$0A,$0C,$0E ; 17h: Upper half-height triangle
    db $10,$10,$10,$0F,$0F,$0F,$0E,$0E,$0E,$0D,$0D,$0D,$0C,$0C,$0C,$0B ; 18h: Unused. Lower third-height triangle
    db $0B,$0B,$0A,$0A,$0A,$09,$09,$09,$08,$08,$08,$07,$07,$07,$06,$06 ; 19h: Unused. Middle third-height triangl
    db $06,$05,$05,$05,$04,$04,$04,$03,$03,$03,$02,$02,$02,$01,$01,$01 ; 1Ah: Unused. Upper third-height triangle
    db $14,$14,$14,$14,$14,$14,$14,$14,$10,$0E,$0C,$0A,$08,$06,$04,$02 ; 1Bh: Upper half-width triangle
    db $10,$0E,$0C,$0A,$08,$06,$04,$02,$00,$00,$00,$00,$00,$00,$00,$00 ; 1Ch: Lower half-width triangle
    db $14,$14,$14,$14,$14,$14,$14,$14,$14,$14,$14,$0F,$0C,$09,$06,$03 ; 1Dh: Unused. Upper third-width triangle
    db $14,$14,$14,$14,$14,$14,$0E,$0B,$08,$05,$02,$00,$00,$00,$00,$00 ; 1Eh: Unused. Middle third-width triangle
    db $10,$0D,$0A,$07,$04,$01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; 1Fh: Unused. Lower third-width triangle

SlopeDefinitions_SlopeTopXOffsetByYPixel:
; Indexed by ([block BTS] & 1Fh) * 10h + [Samus X position] % 10h
    db $08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08 
    db $10,$10,$10,$10,$10,$10,$10,$10,$00,$00,$00,$00,$00,$00,$00,$00 
    db $10,$10,$10,$10,$10,$10,$10,$10,$08,$08,$08,$08,$08,$08,$08,$08 
    db $08,$08,$08,$08,$08,$08,$08,$08,$00,$00,$00,$00,$00,$00,$00,$00 
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $10,$0F,$0E,$0D,$0C,$0B,$0A,$09,$09,$0A,$0B,$0C,$0D,$0E,$0F,$10 ; 5: Unused. Half height isosceles triangle
    db $10,$0E,$0C,$0A,$08,$06,$04,$02,$02,$04,$06,$08,$0A,$0C,$0E,$10 ; 6: Unused. Isosceles triangle
    db $08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08 ; 7: Half height rectangle
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; 8: Unused. Rectangle
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; 9: Unused. Rectangle
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; Ah: Unused. Rectangle
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; Bh: Unused. Rectangle
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; Ch: Unused. Rectangle
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; Dh: Unused. Rectangle
    db $0C,$0C,$0C,$0C,$08,$08,$08,$08,$04,$04,$04,$04,$00,$00,$00,$00 ; Eh: Unused. Very bumpy triangle
    db $0E,$0E,$0C,$0C,$0A,$0A,$08,$08,$06,$06,$04,$04,$02,$02,$00,$00 ; Fh: Bumpy triangle
    db $10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10 ; 10h: Unused
    db $14,$14,$14,$14,$14,$14,$14,$14,$14,$14,$14,$14,$14,$10,$10,$10 ; 11h: Unused
    db $10,$0F,$0E,$0D,$0C,$0B,$0A,$09,$08,$07,$06,$05,$04,$03,$02,$01 ; 12h: Triangle
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; 13h: Rectangle
    db $10,$10,$10,$10,$10,$10,$10,$10,$10,$0F,$0E,$0D,$0C,$0B,$0A,$09 ; 14h: Quarter triangle
    db $08,$07,$06,$05,$04,$03,$02,$01,$00,$00,$00,$00,$00,$00,$00,$00 ; 15h: Three quarter triangle
    db $10,$10,$0F,$0F,$0E,$0E,$0D,$0D,$0C,$0C,$0B,$0B,$0A,$0A,$09,$09 ; 16h: Lower half-height triangle
    db $08,$08,$07,$07,$06,$06,$05,$05,$04,$04,$03,$03,$02,$02,$01,$01 ; 17h: Upper half-height triangle
    db $10,$10,$10,$0F,$0F,$0F,$0E,$0E,$0E,$0D,$0D,$0D,$0C,$0C,$0C,$0B ; 18h: Unused. Lower third-height triangle
    db $0B,$0B,$0A,$0A,$0A,$09,$09,$09,$08,$08,$08,$07,$07,$07,$06,$06 ; 19h: Unused. Middle third-height triangle
    db $06,$05,$05,$05,$04,$04,$04,$03,$03,$03,$02,$02,$02,$01,$01,$01 ; 1Ah: Unused. Upper third-height triangle
    db $14,$14,$14,$14,$14,$14,$14,$14,$10,$0E,$0C,$0A,$08,$06,$04,$02 ; 1Bh: Upper half-width triangle
    db $10,$0E,$0C,$0A,$08,$06,$04,$02,$00,$00,$00,$00,$00,$00,$00,$00 ; 1Ch: Lower half-width triangle
    db $14,$14,$14,$14,$14,$14,$14,$14,$14,$14,$14,$0F,$0C,$09,$06,$03 ; 1Dh: Unused. Upper third-width triangle
    db $14,$14,$14,$14,$14,$14,$0E,$0B,$08,$05,$02,$00,$00,$00,$00,$00 ; 1Eh: Unused. Middle third-width triangle
    db $10,$0D,$0A,$07,$04,$01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 ; 1Fh: Unused. Lower third-width triangle

SamusBlockCollisionReaction_Horizontal_Slope_Square:
    ASL #2
    STA.W $0DD4 
    LDA.L $7F6401,X 
    ROL A 
    ROL A 
    ROL A 
    AND.W #$0003 
    STA.W $0DD6 
    LDA.B $20 : AND.W #$0008 
    LSR #3
    EOR.W $0DD6 
    ADC.W $0DD4 : TAX 
    LDA.B $1A : BNE .top 
    LDA.W $0AFA : CLC : ADC.W $0B00 : DEC A 
    AND.W #$0008 
    BNE .checkBothHalves 
    LDA.W SquareSlopeDefinitions_Bank94-1,X : BMI .solid 
    BRA .returnNoCollision 


.top:
    CMP.B $1C 
    BNE .checkBothHalves 
    LDA.W $0AFA : SEC : SBC.W $0B00 : AND.W #$0008 
    BNE .checkBottomHalf 

.checkBothHalves:
    LDA.W SquareSlopeDefinitions_Bank94-1,X : BMI .solid 

.checkBottomHalf:
    TXA 
    EOR.W #$0002 
    TAX 
    LDA.W SquareSlopeDefinitions_Bank94-1,X : BMI .solid 

.returnNoCollision:
    CLC 
    RTS 


.solid:
    STZ.B $14 
    LDA.B $20 : BIT.B $12 
    BMI .negative12 
    AND.W #$FFF8 
    SEC : SBC.W $0AFE : SBC.W $0AF6 : BPL .notMinimum 
    LDA.W #$0000 

.notMinimum:
    STA.B $12 
    LDA.W #$FFFF : STA.W $0AF8 
    SEC 
    RTS 


.negative12:
    ORA.W #$0007 
    SEC 
    ADC.W $0AFE : SEC : SBC.W $0AF6 : BMI .notMin 
    LDA.W #$0000 

.notMin:
    STA.B $12 
    STZ.W $0AF8 
    SEC 
    RTS 


SamusBlockCollisionReaction_Vertical_Slope_Square:
    ASL #2
    STA.W $0DD4 
    LDA.L $7F6401,X 
    ROL A 
    ROL A 
    ROL A 
    AND.W #$0003 
    STA.W $0DD6 
    LDA.B $20 : AND.W #$0008 
    LSR #2
    EOR.W $0DD6 
    ADC.W $0DD4 : TAX 
    LDA.B $1A : BNE .checkLeft 
    LDA.W $0AF6 : CLC : ADC.W $0AFE : DEC A 
    AND.W #$0008 
    BNE .checkBothHalves 
    LDA.W SquareSlopeDefinitions_Bank94-1,X : BMI .solid 
    BRA .returnNoCollision 


.checkLeft:
    CMP.B $1C 
    BNE .checkBothHalves 
    LDA.W $0AF6 : SEC : SBC.W $0AFE : AND.W #$0008 
    BNE .checkRightHalf 

.checkBothHalves:
    LDA.W SquareSlopeDefinitions_Bank94-1,X : BMI .solid 

.checkRightHalf:
    TXA 
    EOR.W #$0001 
    TAX 
    LDA.W SquareSlopeDefinitions_Bank94-1,X : BMI .solid 

.returnNoCollision:
    CLC 
    RTS 


.solid:
    STZ.B $14 
    LDA.B $20 : BIT.B $12 
    BMI .negative12 
    AND.W #$FFF8 
    SEC : SBC.W $0B00 : SBC.W $0AFA : BPL .notMin 
    LDA.W #$0000 

.notMin:
    STA.B $12 
    LDA.W #$FFFF : STA.W $0AFC 
    LDA.W #$0001 : STA.W $0DBA 
    SEC 
    RTS 


.negative12:
    ORA.W #$0007 
    SEC 
    ADC.W $0B00 : SEC : SBC.W $0AFA : BMI .notMinimum 
    LDA.W #$0000 

.notMinimum:
    STA.B $12 
    STZ.W $0AFC 
    SEC 
    RTS 


SquareSlopeDefinitions_Bank94: 
; Enemies use $A0:C435, enemy projectiles use $86:8729
; 0 = air, 80h = solid
;        _____________ Top-left
;       |    _________ Top-right
;       |   |    _____ Bottom-left
;       |   |   |    _ Bottom-right
;       |   |   |   |
    db $00,$00,$80,$80 ; 0: Half height
    db $00,$80,$00,$80 ; 1: Half width
    db $00,$00,$00,$80 ; 2: Quarter
    db $00,$80,$80,$80 ; 3: Three-quarters
    db $80,$80,$80,$80 ; 4: Whole

if !FEATURE_KEEP_UNREFERENCED
UNUSED_DetermineSamusSuitPaletteIndex_948E68:
    LDY.W #$0004 
    LDA.W $09A2 : BIT.W #$0020 
    BNE .return 
    DEY #2
    BIT.W #$0001 
    BNE .return 
    DEY #2
    .return:
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


CLCRTS_948E7D:
    CLC 
    RTS 


CLCRTS_948E7F:
    CLC 
    RTS 


CLCRTS_948E81:
    CLC 
    RTS 


SamusBlockCollisionReaction_SpikeBlock_BTS0_GenericSpike:
    LDA.W $079F 
    CMP.W #$0003 
    BNE .notWreckedShip 
    LDA.W #$0001 
    JSL.L CheckIfBossBitsForCurrentAreaMatchAnyBitsInA 
    BCC .return 

.notWreckedShip:
    LDA.W $18A8 : BNE .return 
    LDA.W #$003C : STA.W $18A8 
    LDA.W #$000A : STA.W $18AA 
    LDA.W $0A4E : CLC : ADC.W #$0000 : STA.W $0A4E 
    LDA.W $0A50 : ADC.W #$003C : STA.W $0A50 
    LDA.W $0A1E 
    EOR.W #$000C 
    BIT.W #$0008 
    BEQ .left 
    LDA.W #$0001 : STA.W $0A54 
    BRA .return 


.left:
    STZ.W $0A54 

.return:
    RTS 


SamusBlockCollisionReaction_SpikeBlock_BTS1_KraidsLairSpike:
    LDA.W $18A8 : BNE .return 
    LDA.W #$003C : STA.W $18A8 
    LDA.W #$000A : STA.W $18AA 
    LDA.W $0A4E : CLC : ADC.W #$0000 : STA.W $0A4E 
    LDA.W $0A50 : ADC.W #$0010 : STA.W $0A50 
    LDA.W $0A1E 
    EOR.W #$000C 
    BIT.W #$0008 
    BEQ .left 
    LDA.W #$0001 : STA.W $0A54 
    BRA .return 


.left:
    STZ.W $0A54 

.return:
    RTS 


SamusBlockCollisionReact_SpikeBlock_BTS3_DraygonBrokenTurret:
    LDA.W $18A8 : BNE .return 
    LDA.W #$003C : STA.W $18A8 
    LDA.W #$000A : STA.W $18AA 
    LDA.W $0A4E : CLC : ADC.W #$0000 : STA.W $0A4E 
    LDA.W $0A50 : ADC.W #$0010 : STA.W $0A50 
    LDA.W $0A1E 
    EOR.W #$000C 
    BIT.W #$0008 
    BEQ .left 
    LDA.W #$0001 : STA.W $0A54 
    BRA .return 


.left:
    STZ.W $0A54 

.return:
    RTS 


SECRTS_948F45:
    SEC 
    RTS 


CLCRTS_948F47:
    CLC 
    RTS 


SamusBlockCollisionReaction_Horizontal_SolidShootableGrapple:
    STZ.B $14 
    LDA.B $20 : BIT.B $12 
    BMI .negative12 
    AND.W #$FFF0 
    SEC : SBC.W $0AFE : SEC : SBC.W $0AF6 : BPL .leftNotMin 
    LDA.W #$0000 

.leftNotMin:
    STA.B $12 
    LDA.W #$FFFF : STA.W $0AF8 
    SEC 
    RTS 


.negative12:
    ORA.W #$000F 
    SEC 
    ADC.W $0AFE : SEC : SBC.W $0AF6 : BMI .rightNotMin 
    LDA.W #$0000 

.rightNotMin:
    STA.B $12 
    STZ.W $0AF8 
    SEC 
    RTS 


SamusBlockCollisionReaction_Vertical_SolidShootableGrapple:
    STZ.B $14 
    LDA.B $20 : BIT.B $12 
    BMI .negative12 
    AND.W #$FFF0 
    SEC : SBC.W $0B00 : SEC : SBC.W $0AFA : BPL .bottomNotMin 
    LDA.W #$0000 

.bottomNotMin:
    STA.B $12 
    LDA.W #$FFFF : STA.W $0AFC 
    SEC 
    RTS 


.negative12:
    ORA.W #$000F 
    SEC 
    ADC.W $0B00 : SEC : SBC.W $0AFA : BMI .topNotMin 
    LDA.W #$0000 

.topNotMin:
    STA.B $12 
    STZ.W $0AFC 
    SEC 
    RTS 


SamusBlockCollisionReaction_Horizontal_Slope:
    LDX.W $0DC4 
    LDA.L $7F6402,X : AND.W #$001F 
    CMP.W #$0005 
    BCC .gotoSquare 
    LDA.L $7F6402,X : AND.W #$00FF : STA.W $1E77 
    JMP.W SamusBlockCollisionDetection_Horizontal_Slope_NonSquare 


.gotoSquare:
    JMP.W SamusBlockCollisionReaction_Horizontal_Slope_Square 


SamusBlockCollisionReaction_Vertical_Slope:
    LDX.W $0DC4 
    LDA.L $7F6402,X : AND.W #$001F 
    CMP.W #$0005 
    BCC .gotoSquare 
    LDA.L $7F6402,X : STA.W $1E77 
    JMP.W SamusBlockCollisionReaction_Vertical_Slope_NonSquare 


.gotoSquare:
    JMP.W SamusBlockCollisionReaction_Vertical_Slope_Square 


SamusBlockCollisionReaction_Vertical_SpikeAir_JumpTable:
    dw CLCRTS_948E81 
    dw CLCRTS_948E81 
    dw CLCRTS_948E81 
    dw CLCRTS_948E81 
    dw CLCRTS_948E81 
    dw CLCRTS_948E81 
    dw CLCRTS_948E81 
    dw CLCRTS_948E81 
    dw CLCRTS_948E81 
    dw CLCRTS_948E81 
    dw CLCRTS_948E81 
    dw CLCRTS_948E81 
    dw CLCRTS_948E81 
    dw CLCRTS_948E81 
    dw CLCRTS_948E81 
    dw CLCRTS_948E81 
    dw CLCRTS_948E81 

CLCRTS_949018:
    CLC 
    RTS 


SamusBlockCollisionReaction_Vertical_SpikeAir:
    LDX.W $0DC4 
    LDA.L $7F6402,X : AND.W #$00FF 
    ASL A 
    TAX 
    JSR.W (SamusBlockCollisionReaction_Vertical_SpikeAir_JumpTable,X) 
    CLC 
    RTS 


SamusBlockCollisionReaction_Vertical_SpikeBlock_JumpTable:
    dw SamusBlockCollisionReaction_SpikeBlock_BTS0_GenericSpike 
    dw SamusBlockCollisionReaction_SpikeBlock_BTS1_KraidsLairSpike 
    dw SECRTS_948F45 
    dw SamusBlockCollisionReact_SpikeBlock_BTS3_DraygonBrokenTurret 
    dw SECRTS_948F45 
    dw SECRTS_948F45 
    dw SECRTS_948F45 
    dw SECRTS_948F45 
    dw SECRTS_948F45 
    dw SECRTS_948F45 
    dw SECRTS_948F45 
    dw SECRTS_948F45 
    dw SECRTS_948F45 
    dw SECRTS_948F45 
    dw SECRTS_948F45 
    dw SECRTS_948F45 

SamusBlockCollisionReaction_Horizontal_SpikeBlock:
    LDX.W $0DC4 
    LDA.L $7F6402,X 
    ASL A 
    AND.W #$01FF 
    TAX 
    JSR.W (SamusBlockCollisionReaction_Vertical_SpikeBlock_JumpTable,X) 
    JMP.W SamusBlockCollisionReaction_Horizontal_SolidShootableGrapple 


SamusBlockCollisionReaction_Vertical_SpikeBlock:
    LDX.W $0DC4 
    LDA.L $7F6402,X 
    ASL A 
    AND.W #$01FF 
    TAX 
    JSR.W (SamusBlockCollisionReaction_Vertical_SpikeBlock_JumpTable,X) 
    JMP.W SamusBlockCollisionReaction_Vertical_SolidShootableGrapple 


SamusBlockCollisionReaction_Horizontal_SpecialAir:
    LDX.W $0DC4 
    LDA.L $7F6401,X : AND.W #$FF00 
    XBA 
    BMI .blockBTSMSB 
    ASL A 
    TAX 
    LDA.W SamusBlockCollisionReaction_Special_PLMTable_areaIndependent,X 
    JSL.L Spawn_PLM_to_CurrentBlockIndex 
    CLC 
    RTS 


.blockBTSMSB:
    AND.W #$007F 
    ASL A 
    TAY 
    LDA.W $079F 
    ASL A 
    TAX 
    LDA.W SamusBlockCollisionReaction_Special_PLMTable_AirPointers,X : STA.B $22 
    LDA.B ($22),Y 
    JSL.L Spawn_PLM_to_CurrentBlockIndex 
    RTS 


SamusBlockCollisionReaction_Vertical_SpecialAir:
    LDX.W $0DC4 
    LDA.L $7F6401,X : AND.W #$FF00 
    XBA 
    BMI .blockBTSMSB 
    ASL A 
    TAX 
    LDA.W SamusBlockCollisionReaction_Special_PLMTable_areaIndependent,X 
    JSL.L Spawn_PLM_to_CurrentBlockIndex 
    CLC 
    RTS 


.blockBTSMSB:
    AND.W #$007F 
    ASL A 
    TAY 
    LDA.W $079F 
    ASL A 
    TAX 
    LDA.W SamusBlockCollisionReaction_Special_PLMTable_AirPointers,X : STA.B $22 
    LDA.B ($22),Y 
    JSL.L Spawn_PLM_to_CurrentBlockIndex 
    RTS 


SamusBlockCollisionReaction_Horizontal_SpecialBlock:
    LDX.W $0DC4 
    LDA.L $7F6401,X : AND.W #$FF00 
    XBA 
    BMI .areaDependent 
    ASL A 
    TAX 
    LDA.W SamusBlockCollisionReaction_Special_PLMTable_areaIndependent,X 
    JSL.L Spawn_PLM_to_CurrentBlockIndex 
    BCC .return 
    JMP.W SamusBlockCollisionReaction_Horizontal_SolidShootableGrapple 


.return:
    RTS 


.areaDependent:
    AND.W #$007F 
    ASL A 
    TAY 
    LDA.W $079F 
    ASL A 
    TAX 
    LDA.W SamusBlockCollisionReaction_Special_PLMTable_BlockPointers,X : STA.B $22 
    LDA.B ($22),Y 
    JSL.L Spawn_PLM_to_CurrentBlockIndex 
    BCC ..return 
    JMP.W SamusBlockCollisionReaction_Horizontal_SolidShootableGrapple 


..return:
    RTS 


SamusBlockCollisionReaction_Vertical_SpecialBlock:
    LDX.W $0DC4 
    LDA.L $7F6401,X : AND.W #$FF00 
    XBA 
    BMI .areaDependent 
    ASL A 
    TAX 
    LDA.W SamusBlockCollisionReaction_Special_PLMTable_areaIndependent,X 
    JSL.L Spawn_PLM_to_CurrentBlockIndex 
    BCC .return 
    JMP.W SamusBlockCollisionReaction_Vertical_SolidShootableGrapple 


.return:
    RTS 


.areaDependent:
    AND.W #$007F 
    ASL A 
    TAY 
    LDA.W $079F 
    ASL A 
    TAX 
    LDA.W SamusBlockCollisionReaction_Special_PLMTable_BlockPointers,X : STA.B $22 
    LDA.B ($22),Y 
    JSL.L Spawn_PLM_to_CurrentBlockIndex 
    BCC ..return 
    JMP.W SamusBlockCollisionReaction_Vertical_SolidShootableGrapple 


..return:
    RTS 


SamusBlockCollisionReaction_Special_PLMTable_areaIndependent:
    dw PLMEntries_Collision_1x1RespawningCrumbleBlock 
    dw PLMEntries_Collision_2x1RespawningCrumbleBlock 
    dw PLMEntries_Collision_1x2RespawningCrumbleBlock 
    dw PLMEntries_Collision_2x2RespawningCrumbleBlock 
    dw PLMEntries_Collision_1x1CrumbleBlock 
    dw PLMEntries_Collision_2x1CrumbleBlock 
    dw PLMEntries_Collision_1x2CrumbleBlock 
    dw PLMEntries_Collision_2x2CrumbleBlock 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_Collision_RespawningSpeedBoostBlock 
    dw PLMEntries_Collision_SpeedBoostBlock 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_genericShotTriggerForAPLM 
    dw PLMEntries_ItemCollisionDetection 
    dw PLMEntries_scrollPLMTrigger 
    dw PLMEntries_mapStationRightAccess 
    dw PLMEntries_mapStationLeftAccess 
    dw PLMEntries_energyStationRightAccess 
    dw PLMEntries_energyStationLeftAccess 
    dw PLMEntries_missileStationRightAccess 
    dw PLMEntries_missileStationLeftAccess 
    dw PLMEntries_saveStationTrigger 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 

SamusBlockCollisionReaction_Special_PLMTable_crateria:
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 

SamusBlockCollisionReaction_Special_PLMTable_brinstar:
    dw PLMEntries_collisionReactionClearCarry 
    dw PLMEntries_collisionReactionClearCarry 
    dw PLMEntries_Collision_BTS82 
    dw PLMEntries_Collision_BTS83 
    dw PLMEntries_Collision_DachoraRespawningSpeedBoostBlock 
    dw PLMEntries_Collision_SpeedBoostBlock 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 

SamusBlockCollisionReaction_Special_PLMTable_norfair:
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_Collision_LowerNorfairChozoHandCheck 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 

SamusBlockCollisionReaction_Special_PLMTable_wreckedShip:
    dw PLMEntries_Collision_WreckedShipChozoHandCheck 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 

SamusBlockCollisionReaction_Special_PLMTable_maridia:
    dw PLMEntries_collisionReactionQuicksandSurface 
    dw PLMEntries_collisionReactionQuicksandSurface 
    dw PLMEntries_collisionReactionQuicksandSurface 
    dw PLMEntries_collisionReactionSubmergingQuicksand 
    dw PLMEntries_collisionReactionSandFallsSlow 
    dw PLMEntries_collisionReactionSandFallsFast 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 

SamusBlockCollisionReaction_Special_PLMTable_tourian:
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 

SamusBlockCollisionReaction_Special_PLMTable_ceres:
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 

SamusBlockCollisionReaction_Special_PLMTable_debug:
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 

SamusBlockCollisionReaction_Special_PLMTable_AirPointers:
    dw SamusBlockCollisionReaction_Special_PLMTable_crateria 
    dw SamusBlockCollisionReaction_Special_PLMTable_brinstar 
    dw SamusBlockCollisionReaction_Special_PLMTable_norfair 
    dw SamusBlockCollisionReaction_Special_PLMTable_wreckedShip 
    dw SamusBlockCollisionReaction_Special_PLMTable_maridia 
    dw SamusBlockCollisionReaction_Special_PLMTable_tourian 
    dw SamusBlockCollisionReaction_Special_PLMTable_ceres 
    dw SamusBlockCollisionReaction_Special_PLMTable_debug 

SamusBlockCollisionReaction_Special_PLMTable_BlockPointers:
    dw SamusBlockCollisionReaction_Special_PLMTable_crateria 
    dw SamusBlockCollisionReaction_Special_PLMTable_brinstar 
    dw SamusBlockCollisionReaction_Special_PLMTable_norfair 
    dw SamusBlockCollisionReaction_Special_PLMTable_wreckedShip 
    dw SamusBlockCollisionReaction_Special_PLMTable_maridia 
    dw SamusBlockCollisionReaction_Special_PLMTable_tourian 
    dw SamusBlockCollisionReaction_Special_PLMTable_ceres 
    dw SamusBlockCollisionReaction_Special_PLMTable_debug 

SamusBlockCollisionReaction_Horizontal_BombableAir:
    LDX.W $0DC4 
    LDA.L $7F6401,X : AND.W #$FF00 
    XBA 
    BMI .returnNoCollision 
    ASL A 
    TAX 
    LDA.W SamusBlockCollisionReaction_Bombable_PLMTable,X 
    JSL.L Spawn_PLM_to_CurrentBlockIndex 
    CLC 
    RTS 


.returnNoCollision:
    CLC 
    RTS 


SamusBlockCollisionReaction_Vertical_BombableAir:
    LDX.W $0DC4 
    LDA.L $7F6401,X : AND.W #$FF00 
    XBA 
    BMI .returnNoCollision 
    ASL A 
    TAX 
    LDA.W SamusBlockCollisionReaction_Bombable_PLMTable,X 
    JSL.L Spawn_PLM_to_CurrentBlockIndex 
    CLC 
    RTS 


.returnNoCollision:
    CLC 
    RTS 


SamusBlockCollisionReaction_Horizontal_BombBlock:
    LDX.W $0DC4 
    LDA.L $7F6401,X : AND.W #$FF00 
    XBA 
    BMI .gotoSolidShootableGrapple 
    ASL A 
    TAX 
    LDA.W SamusBlockCollisionReaction_Bombable_PLMTable,X 
    JSL.L Spawn_PLM_to_CurrentBlockIndex 
    BCC .return 
    JMP.W SamusBlockCollisionReaction_Horizontal_SolidShootableGrapple 


.gotoSolidShootableGrapple:
    JMP.W SamusBlockCollisionReaction_Horizontal_SolidShootableGrapple 


.return:
    RTS 


SamusBlockCollisionReaction_Vertical_BombBlock:
    LDX.W $0DC4 
    LDA.L $7F6401,X : AND.W #$FF00 
    XBA 
    BMI .gotoSolidShootableGrapple 
    ASL A 
    TAX 
    LDA.W SamusBlockCollisionReaction_Bombable_PLMTable,X 
    JSL.L Spawn_PLM_to_CurrentBlockIndex 
    BCC .return 
    JMP.W SamusBlockCollisionReaction_Vertical_SolidShootableGrapple 


.gotoSolidShootableGrapple:
    JMP.W SamusBlockCollisionReaction_Vertical_SolidShootableGrapple 


.return:
    RTS 


SamusBlockCollisionReaction_Bombable_PLMTable:
    dw PLMEntries_Collision_1x1RespawningBombBlock 
    dw PLMEntries_Collision_2x1RespawningBombBlock 
    dw PLMEntries_Collision_1x2RespawningBombBlock 
    dw PLMEntries_Collision_2x2RespawningBombBlock 
    dw PLMEntries_Collision_1x1BombBlock 
    dw PLMEntries_Collision_2x1BombBlock 
    dw PLMEntries_Collision_1x2BombBlock 
    dw PLMEntries_Collision_2x2BombBlock 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 

SamusBlockCollisionReaction_Horizontal_Door:
    LDA.W #DoorTransitionFunction_HandleElevator : STA.W $099C 
    LDX.W $0DC4 
    LDA.L $7F6401,X : AND.W #$FF00 
    XBA 
    STA.W $078F 
    AND.W #$007F 
    ASL A 
    ADC.W $07B5 : TAX 
    LDA.L $8F0000,X 
    TAX 
    LDA.L $830000,X : BPL .notAPointer 
    STX.W $078D 
    LDA.W #$0009 : STA.W $0998 
    CLC 
    RTS 


.notAPointer:
    LDA.W $0A1C 
    CMP.W #$0009 
    BCS .gotoSolidShootableGrapple 
    LDA.W #$0001 : STA.W $0E16 

.gotoSolidShootableGrapple:
    JMP.W SamusBlockCollisionReaction_Horizontal_SolidShootableGrapple 


SamusBlockCollisionReaction_Vertical_Door:
    LDA.W #DoorTransitionFunction_HandleElevator : STA.W $099C 
    LDX.W $0DC4 
    LDA.L $7F6401,X : AND.W #$FF00 
    XBA 
    STA.W $078F 
    AND.W #$007F 
    ASL A 
    ADC.W $07B5 : TAX 
    LDA.L $8F0000,X 
    TAX 
    LDA.L $830000,X : BPL .notAPointer 
    STX.W $078D 
    LDA.W #$0009 : STA.W $0998 
    CLC 
    RTS 


.notAPointer:
    LDA.W $0A1C 
    CMP.W #$0009 
    BCS .gotoSolidShootableGrapple 
    LDA.W #$0001 : STA.W $0E16 

.gotoSolidShootableGrapple:
    JMP.W SamusBlockCollisionReaction_Vertical_SolidShootableGrapple 


BlockShotBombedGrappledCollisionInsideReaction_HorizontalExt:
    LDX.W $0DC4 
    LDA.L $7F6402,X : AND.W #$00FF 
    BEQ .returnNoCollision 
    BIT.W #$0080 
    BNE .highByte 
    AND.W #$00FF 
    BRA + 


.highByte:
    ORA.W #$FF00 

  + CLC : ADC.W $0DC4 : STA.W $0DC4 
    ASL A 
    TAX 
    LDA.L $7F0002,X : AND.W #$F000 
    XBA 
    LSR #3
    TAX 
    PLA 
    SEC : SBC.W #$0003 : PHA 

.returnNoCollision:
    CLC 
    RTS 


BlockShotBombedGrappledCollisionInsideReaction_VerticalExt:
    LDX.W $0DC4 
    LDA.L $7F6402,X : AND.W #$00FF 
    BEQ .returnNoCollision 
    BIT.W #$0080 
    BNE .highByte 
    STA.W $0DD4 
    LDA.W $0DC4 

.loopUpper:
    CLC : ADC.W $07A5 : DEC.W $0DD4 
    BNE .loopUpper 
    JMP.W + 


.highByte:
    ORA.W #$FF00 
    STA.W $0DD4 
    LDA.W $0DC4 

.loopLower:
    SEC : SBC.W $07A5 : INC.W $0DD4 
    BNE .loopLower 

  + STA.W $0DC4 
    ASL A 
    TAX 
    LDA.L $7F0002,X : AND.W #$F000 
    XBA 
    LSR #3
    TAX 
    PLA 
    SEC : SBC.W #$0003 : PHA 

.returnNoCollision:
    CLC 
    RTS 


CalculateSamusYBlockSpan:
    LDA.W $0AFA : SEC : SBC.W $0B00 : AND.W #$FFF0 
    STA.B $1A 
    LDA.W $0AFA : CLC : ADC.W $0B00 : DEC A 
    SEC : SBC.B $1A : LSR #4
    STA.B $1A 
    STA.B $1C 
    RTS 


CalculateSamusXBlockSpan:
    LDA.W $0AF6 : SEC : SBC.W $0AFE : AND.W #$FFF0 
    STA.B $1A 
    LDA.W $0AF6 : CLC : ADC.W $0AFE : DEC A 
    SEC : SBC.B $1A : LSR #4
    STA.B $1A 
    STA.B $1C 
    RTS 


SamusBlockCollisionReactionPointers_Horizontal:
    dw CLCRTS_948F47 
    dw SamusBlockCollisionReaction_Horizontal_Slope 
    dw CLCRTS_949018 
    dw SamusBlockCollisionReaction_Horizontal_SpecialAir 
    dw CLCRTS_948F47 
    dw BlockShotBombedGrappledCollisionInsideReaction_HorizontalExt 
    dw CLCRTS_948F47 
    dw SamusBlockCollisionReaction_Horizontal_BombableAir 
    dw SamusBlockCollisionReaction_Horizontal_SolidShootableGrapple 
    dw SamusBlockCollisionReaction_Horizontal_Door 
    dw SamusBlockCollisionReaction_Horizontal_SpikeBlock 
    dw SamusBlockCollisionReaction_Horizontal_SpecialBlock 
    dw SamusBlockCollisionReaction_Horizontal_SolidShootableGrapple 
    dw BlockShotBombedGrappledCollisionInsideReaction_VerticalExt 
    dw SamusBlockCollisionReaction_Horizontal_SolidShootableGrapple 
    dw SamusBlockCollisionReaction_Horizontal_BombBlock 

SamusBlockCollisionReactionPointers_Vertical:
    dw CLCRTS_948F47 
    dw SamusBlockCollisionReaction_Vertical_Slope 
    dw SamusBlockCollisionReaction_Vertical_SpikeAir 
    dw SamusBlockCollisionReaction_Vertical_SpecialAir 
    dw CLCRTS_948F47 
    dw BlockShotBombedGrappledCollisionInsideReaction_HorizontalExt 
    dw CLCRTS_948F47 
    dw SamusBlockCollisionReaction_Vertical_BombableAir 
    dw SamusBlockCollisionReaction_Vertical_SolidShootableGrapple 
    dw SamusBlockCollisionReaction_Vertical_Door 
    dw SamusBlockCollisionReaction_Vertical_SpikeBlock 
    dw SamusBlockCollisionReaction_Vertical_SpecialBlock 
    dw SamusBlockCollisionReaction_Vertical_SolidShootableGrapple 
    dw BlockShotBombedGrappledCollisionInsideReaction_VerticalExt 
    dw SamusBlockCollisionReaction_Vertical_SolidShootableGrapple 
    dw SamusBlockCollisionReaction_Vertical_BombBlock 

SamusBlockCollisionReaction_Horizontal:
    PHX 
    TXA 
    LSR A 
    STA.W $0DC4 
    LDA.L $7F0002,X : AND.W #$F000 
    XBA 
    LSR #3
    TAX 
    JSR.W (SamusBlockCollisionReactionPointers_Horizontal,X) 
    PLX 
    RTS 


SamusBlockCollisionReaction_Vertical:
    PHX 
    TXA 
    LSR A 
    STA.W $0DC4 
    LDA.L $7F0002,X : AND.W #$F000 
    XBA 
    LSR #3
    TAX 
    JSR.W (SamusBlockCollisionReactionPointers_Vertical,X) 
    PLX 
    RTS 


SamusBlockCollisionDetection_Horizontal:
    JSR.W CalculateSamusYBlockSpan 
    LDA.W $0AFA : SEC : SBC.W $0B00 : LSR #4
    SEP #$20 
    STA.W $4202 
    LDA.W $07A5 : STA.W $4203 
    REP #$20 
    LDA.W $0AF8 : CLC : ADC.B $14 : STA.B $16 
    LDA.W $0AF6 : ADC.B $12 : STA.B $18 
    BIT.B $12 
    BPL .movingRight 
    SEC : SBC.W $0AFE : BRA + 


.movingRight:
    CLC : ADC.W $0AFE : DEC A 

  + STA.B $20 
    LSR #4
    CLC : ADC.W $4216 : ASL A 
    TAX 

.loop:
    JSR.W SamusBlockCollisionReaction_Horizontal 
    BCS .returnCollision 
    TXA 
    CLC : ADC.W $07A5 : ADC.W $07A5 : TAX 
    DEC.B $1A 
    BPL .loop 
    CLC 
    RTS 


.returnCollision:
    SEC 
    RTS 


SamusBlockCollisionDetection_Vertical_LeftToRight:
    JSR.W CalculateSamusXBlockSpan 
    LDA.W $0AFC : CLC : ADC.B $14 : STA.B $16 
    LDA.W $0AFA : ADC.B $12 : STA.B $18 
    BIT.B $12 
    BPL .movingDown 
    SEC : SBC.W $0B00 : BRA + 


.movingDown:
    CLC : ADC.W $0B00 : DEC A 

  + STA.B $20 
    LSR #4
    SEP #$20 
    STA.W $4202 
    LDA.W $07A5 : STA.W $4203 
    REP #$20 
    LDA.W $0AF6 : SEC : SBC.W $0AFE : LSR #4
    CLC : ADC.W $4216 : STA.W $0DC4 
    ASL A 
    TAX 

.loop:
    JSR.W SamusBlockCollisionReaction_Vertical 
    BCS .returnCollision 
    INX #2
    DEC.B $1A 
    BPL .loop 
    CLC 
    RTS 


.returnCollision:
    SEC 
    RTS 


SamusBlockCollisionDetection_Vertical_RightToLeft:
    JSR.W CalculateSamusXBlockSpan 
    STZ.B $1A 
    LDA.W $0AFC : CLC : ADC.B $14 : STA.B $16 
    LDA.W $0AFA : ADC.B $12 : STA.B $18 
    BIT.B $12 
    BPL .movingDown 
    SEC : SBC.W $0B00 : BRA + 


.movingDown:
    CLC : ADC.W $0B00 : DEC A 

  + STA.B $20 
    LSR #4
    SEP #$20 
    STA.W $4202 
    LDA.W $07A5 : STA.W $4203 
    REP #$20 
    LDA.W $0AF6 : CLC : ADC.W $0AFE : DEC A 
    LSR #4
    CLC : ADC.W $4216 : STA.W $0DC4 
    ASL A 
    TAX 

.loop:
    JSR.W SamusBlockCollisionReaction_Vertical 
    BCS .returnCollision 
    DEX #2
    INC.B $1A 
    LDA.B $1C 
    CMP.B $1A 
    BCS .loop 
    CLC 
    RTS 


.returnCollision:
    SEC 
    RTS 


Get_12_14_949653:
    LDA.B $12 : BPL .return 
    EOR.W #$FFFF 
    STA.B $12 
    LDA.B $14 
    EOR.W #$FFFF 
    INC A 
    STA.B $14 
    BNE .return 
    INC.B $12 

.return:
    RTS 


Get_12_14_949669:
    LDA.B $12 : BPL .return 
    EOR.W #$FFFF 
    STA.B $12 
    LDA.B $14 
    EOR.W #$FFFF 
    INC A 
    STA.B $14 
    BNE .return 
    INC.B $12 

.return:
    RTS 


WallJumpBlockCollisionDetection:
    PHP : PHB : PHK : PLB 
    LDA.W $0B02 : ORA.W #$000F : STA.W $0B02 
    STZ.W $1E71 
    JSR.W SamusBlockCollisionDetection_Horizontal 
    BCC .noCollision 
    JSR.W Get_12_14_949653 
    PLB : PLP 
    SEC 
    LDA.W #$0001 : STA.W $0DD0 
    RTL 


.noCollision:
    JSR.W Get_12_14_949653 
    PLB : PLP 
    CLC 
    STZ.W $0DD0 
    RTL 


BlockCollisionDetectionDueToChangeOfPose:
    LDA.B $12 : BPL .positive 
    EOR.W #$FFFF 
    INC A 

.positive:
    AND.W #$FFF8 
    BNE + 
    JSL.L BlockCollisionDetectionDueToChangeOfPose_SingleBlock 
    RTL 


  + LDA.B $12 
    PHA 
    LDA.B $14 
    PHA 
    LDA.B $12 : AND.W #$FFF8 
    ORA.W #$0008 
    STA.B $12 
    STZ.B $14 
    JSL.L BlockCollisionDetectionDueToChangeOfPose_SingleBlock 
    BCC .noCollision 
    PLA : PLA 
    RTL 


.noCollision:
    PLA 
    STA.B $14 
    PLA 
    STA.B $12 
    JSL.L BlockCollisionDetectionDueToChangeOfPose_SingleBlock 
    RTL 


BlockCollisionDetectionDueToChangeOfPose_SingleBlock:
    PHP : PHB 
    REP #$30 
    PHK : PLB 
    LDA.W $0B02 : ORA.W #$000F : STA.W $0B02 
    STZ.W $1E71 
    LDA.W $05B6 
    LSR A 
    BCS .nonZeroFrameCounter 
    JSR.W SamusBlockCollisionDetection_Vertical_LeftToRight 
    BCC .noCollision 
    BCS .collision 

.nonZeroFrameCounter:
    JSR.W SamusBlockCollisionDetection_Vertical_RightToLeft 
    BCC .noCollision 

.collision:
    JSR.W Get_12_14_949669 
    PLB : PLP 
    SEC 
    LDA.W #$0001 : STA.W $0DD0 
    RTL 


.noCollision:
    JSR.W Get_12_14_949669 
    PLB : PLP 
    CLC 
    STZ.W $0DD0 
    RTL 


MoveSamusRight_NoSolidEnemyCollision:
    PHP : PHB : PHK : PLB 
    LDA.B $14 
    ORA.B $12 
    BEQ .noCollision 
    STZ.W $1E71 
    JSR.W SamusBlockCollisionDetection_Horizontal 
    BCC .noCollision 
    LDA.W $0AF8 : CLC : ADC.B $14 : STA.W $0AF8 
    LDA.W $0AF6 : ADC.B $12 : STA.W $0AF6 
    PLB : PLP 
    SEC 
    LDA.W #$0001 : STA.W $0DD0 
    RTL 


.noCollision:
    LDA.W $0AF8 : CLC : ADC.B $14 : STA.W $0AF8 
    LDA.W $0AF6 : ADC.B $12 : STA.W $0AF6 
    PLB : PLP 
    CLC 
    STZ.W $0DD0 
    RTL 


MoveSamusDown_NoSolidEnemyCollision:
    PHP : PHB 
    REP #$30 
    PHK : PLB 
    LDA.B $14 
    ORA.B $12 
    BEQ .noCollision 
    STZ.W $0DBA 
    STZ.W $1E71 
    LDA.W $05B6 
    LSR A 
    BCS .nonZeroFrameCounter 
    JSR.W SamusBlockCollisionDetection_Vertical_LeftToRight 
    BCC .noCollision 
    BCS .moveVertically 

.nonZeroFrameCounter:
    JSR.W SamusBlockCollisionDetection_Vertical_RightToLeft 
    BCC .noCollision 

.moveVertically:
    LDA.W $0AFC : CLC : ADC.B $14 : STA.W $0AFC 
    LDA.W $0AFA : ADC.B $12 : STA.W $0AFA 

.collision:
    PLB : PLP 
    SEC 
    LDA.W #$0001 : STA.W $0DD0 
    RTL 


.noCollision:
    LDA.W $0AFC : CLC : ADC.B $14 : STA.W $0AFC 
    LDA.W $0AFA : ADC.B $12 : STA.W $0AFA 
    LDA.W $1E71 : BNE .collision 
    PLB : PLP 
    CLC 
    STZ.W $0DD0 
    RTL 


BlockInsideReaction_Slope:
    LDX.W $0DC4 
    LDA.L $7F6402,X : AND.W #$001F 
    CMP.W #$0005 
    BCS .returnDuplicate ; >.<
    RTS 


.returnDuplicate:
    RTS 


BlockInsideReaction_Air_ShootableAir_BombableAir:
    LDA.W #SamusXSpeedTable_Normal : STA.W $0A6C 
    RTS 


RTS_9497D7:
    RTS 


CLCRTS_9497D8:
    CLC 
    RTS 

    LDA.W $0A4E 
    CLC 
    STA.W $0A4E 
    LDA.W $0A50 : ADC.W #$0001 : STA.W $0A50 
    STZ.W $0B42 
    STZ.W $0B46 
    CLC 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_SomeKindOfUpwardsBoost_9497F2:
    LDA.W $0B36 
    CMP.W #$0001 
    BNE .down 
    LDA.W #$0000 : STA.W $0B32 
    LDA.W #$0002 : STA.W $0B34 
    CLC 
    RTS 


.down:
    STZ.W $0B2E 
    STZ.W $0B2C 
    CLC 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


CLCRTS_949810:
    CLC 
    RTS 


CLCRTS_949812:
    CLC 
    RTS 

    LDY.W #$0000 
    LDA.W $0A4E 
    CLC 
    STA.W $0A4E 
    LDA.W $0A50 : ADC.W #$0001 : STA.W $0A50 
    LDA.W #SamusXSpeedTable_InLavaAcid : STA.W $0A6C 
    STZ.W $0B32 
    STZ.W $0B34 
    LDA.W $0B36 
    CMP.W #$0001 
    BNE .down 
    LDA.W .data1,Y : STA.W $0B32 
    LDA.W .data2,Y : STA.W $0B34 
    CLC 
    RTS 


.down:
    STZ.W $0B2E 
    STZ.W $0B2C 
    LDA.W .data3,Y : STA.W $0B5A 
    LDA.W .data4,Y : STA.W $0B5C 
    CLC 
    RTS 

.data1:
    dw $0000 
.data2:
    dw       $0005 
.data3:
    dw $0000 
.data4:
    dw       $0002 


RTS_949865:
    RTS 


BlockInsideReaction_SpikeAir_BTS2_AirSpike:
    LDA.W $0A6E : BNE .return 
    LDA.W $18A8 : BNE .return 
    LDA.W #$003C : STA.W $18A8 
    LDA.W #$000A : STA.W $18AA 
    LDA.W $0A4E : CLC : ADC.W #$0000 : STA.W $0A4E 
    LDA.W $0A50 : ADC.W #$0010 : STA.W $0A50 
    LDA.W $0A1E 
    EOR.W #$000C 
    BIT.W #$0008 
    BEQ .facingRight 
    LDA.W #$0001 : STA.W $0A54 
    BRA .return 


.facingRight:
    STZ.W $0A54 

.return:
    LDA.W #SamusXSpeedTable_Normal : STA.W $0A6C 
    RTS 


BlockInsideReaction_SpikeAir_JumpTable:
    dw CLCRTS_9497D8 
    dw CLCRTS_949812 
    dw BlockInsideReaction_SpikeAir_BTS2_AirSpike 
    dw RTS_9497D7 
    dw RTS_9497D7 
    dw RTS_9497D7 
    dw RTS_9497D7 
    dw RTS_9497D7 
    dw RTS_9497D7 
    dw RTS_9497D7 
    dw RTS_9497D7 
    dw RTS_9497D7 
    dw RTS_9497D7 
    dw RTS_9497D7 
    dw RTS_9497D7 
    dw RTS_9497D7 

BlockInsideReaction_SpikeAir:
    LDX.W $0DC4 
    LDA.L $7F6402,X : AND.W #$00FF 
    ASL A 
    TAX 
    JSR.W (BlockInsideReaction_SpikeAir_JumpTable,X) 
    RTS 


BlockInsideReaction_SolidDoorSpikeSpecialShotGrappleBomb:
    LDA.W #SamusXSpeedTable_Normal : STA.W $0A6C 
    RTS 


BlockInsideReaction_SpecialAir_Default:
    LDA.W #SamusXSpeedTable_Normal : STA.W $0A6C 
    RTS 


BlockInsideReaction_SpecialAir_BTS8_WSTreadmill_Right:
    LDA.W $079F 
    CMP.W #$0003 
    BNE .notWreckedShip 
    LDA.W #$0001 
    JSL.L CheckIfBossBitsForCurrentAreaMatchAnyBitsInA 
    BCC .return 

.notWreckedShip:
    LDA.W $0B2E : BNE .return 
    STZ.W $0B56 
    LDA.W #$0002 : STA.W $0B58 

.return:
    LDA.W #SamusXSpeedTable_Normal : STA.W $0A6C 
    RTS 


BlockInsideReaction_SpecialAir_BTS9_WSTreadmill_Left:
    LDA.W $079F 
    CMP.W #$0003 
    BNE .notWreckedShip 
    LDA.W #$0001 
    JSL.L CheckIfBossBitsForCurrentAreaMatchAnyBitsInA 
    BCC .return 

.notWreckedShip:
    LDA.W $0B2E : BNE .return 
    STZ.W $0B56 
    LDA.W #$FFFE : STA.W $0B58 

.return:
    LDA.W #SamusXSpeedTable_Normal : STA.W $0A6C 
    RTS 


BlockInsideReaction_SpecialAir_BTSA_RightwardsTreadmill:
    STZ.W $0B56 
    LDA.W #$0002 : STA.W $0B58 
    LDA.W #SamusXSpeedTable_Normal : STA.W $0A6C 
    RTS 


BlockInsideReaction_SpecialAir_BTSB_LeftwardsTreadmill:
    STZ.W $0B56 
    LDA.W #$FFFE : STA.W $0B58 
    LDA.W #SamusXSpeedTable_Normal : STA.W $0A6C 
    RTS 


BlockInsideReaction_SpecialAir_BTS46_ScrollPLMTrigger:
    LDA.W $1E73 
    CMP.W #$0001 
    BNE .return 
    LDA.W #PLMEntries_scrollPLMTrigger 
    JSL.L Spawn_PLM_to_CurrentBlockIndex 

.return:
    RTS 


BlockInsideReaction_SpecialAir_JumpTable:
    dw BlockInsideReaction_SpecialAir_Default 
    dw BlockInsideReaction_SpecialAir_Default 
    dw BlockInsideReaction_SpecialAir_Default 
    dw BlockInsideReaction_SpecialAir_Default 
    dw BlockInsideReaction_SpecialAir_Default 
    dw BlockInsideReaction_SpecialAir_Default 
    dw BlockInsideReaction_SpecialAir_Default 
    dw BlockInsideReaction_SpecialAir_Default 
    dw BlockInsideReaction_SpecialAir_BTS8_WSTreadmill_Right 
    dw BlockInsideReaction_SpecialAir_BTS9_WSTreadmill_Left 
    dw BlockInsideReaction_SpecialAir_BTSA_RightwardsTreadmill 
    dw BlockInsideReaction_SpecialAir_BTSB_LeftwardsTreadmill 
    dw BlockInsideReaction_SpecialAir_Default 
    dw BlockInsideReaction_SpecialAir_Default 
    dw BlockInsideReaction_SpecialAir_Default 
    dw BlockInsideReaction_SpecialAir_Default 
    dw BlockInsideReaction_SpecialAir_Default 
    dw BlockInsideReaction_SpecialAir_Default 
    dw BlockInsideReaction_SpecialAir_Default 
    dw BlockInsideReaction_SpecialAir_Default 
    dw BlockInsideReaction_SpecialAir_Default 
    dw BlockInsideReaction_SpecialAir_Default 
    dw BlockInsideReaction_SpecialAir_Default 
    dw BlockInsideReaction_SpecialAir_Default 
    dw BlockInsideReaction_SpecialAir_Default 
    dw BlockInsideReaction_SpecialAir_Default 
    dw BlockInsideReaction_SpecialAir_Default 
    dw BlockInsideReaction_SpecialAir_Default 
    dw BlockInsideReaction_SpecialAir_Default 
    dw BlockInsideReaction_SpecialAir_Default 
    dw BlockInsideReaction_SpecialAir_Default 
    dw BlockInsideReaction_SpecialAir_Default 
    dw BlockInsideReaction_SpecialAir_Default 
    dw BlockInsideReaction_SpecialAir_Default 
    dw BlockInsideReaction_SpecialAir_Default 
    dw BlockInsideReaction_SpecialAir_Default 
    dw BlockInsideReaction_SpecialAir_Default 
    dw BlockInsideReaction_SpecialAir_Default 
    dw BlockInsideReaction_SpecialAir_Default 
    dw BlockInsideReaction_SpecialAir_Default 
    dw BlockInsideReaction_SpecialAir_Default 
    dw BlockInsideReaction_SpecialAir_Default 
    dw BlockInsideReaction_SpecialAir_Default 
    dw BlockInsideReaction_SpecialAir_Default 
    dw BlockInsideReaction_SpecialAir_Default 
    dw BlockInsideReaction_SpecialAir_Default 
    dw BlockInsideReaction_SpecialAir_Default 
    dw BlockInsideReaction_SpecialAir_Default 
    dw BlockInsideReaction_SpecialAir_Default 
    dw BlockInsideReaction_SpecialAir_Default 
    dw BlockInsideReaction_SpecialAir_Default 
    dw BlockInsideReaction_SpecialAir_Default 
    dw BlockInsideReaction_SpecialAir_Default 
    dw BlockInsideReaction_SpecialAir_Default 
    dw BlockInsideReaction_SpecialAir_Default 
    dw BlockInsideReaction_SpecialAir_Default 
    dw BlockInsideReaction_SpecialAir_Default 
    dw BlockInsideReaction_SpecialAir_Default 
    dw BlockInsideReaction_SpecialAir_Default 
    dw BlockInsideReaction_SpecialAir_Default 
    dw BlockInsideReaction_SpecialAir_Default 
    dw BlockInsideReaction_SpecialAir_Default 
    dw BlockInsideReaction_SpecialAir_Default 
    dw BlockInsideReaction_SpecialAir_Default 
    dw BlockInsideReaction_SpecialAir_Default 
    dw BlockInsideReaction_SpecialAir_Default 
    dw BlockInsideReaction_SpecialAir_Default 
    dw BlockInsideReaction_SpecialAir_Default 
    dw BlockInsideReaction_SpecialAir_Default 
    dw BlockInsideReaction_SpecialAir_Default 
    dw BlockInsideReaction_SpecialAir_BTS46_ScrollPLMTrigger 
    dw BlockInsideReaction_SpecialAir_Default 
    dw BlockInsideReaction_SpecialAir_Default 
    dw BlockInsideReaction_SpecialAir_Default 
    dw BlockInsideReaction_SpecialAir_Default 
    dw BlockInsideReaction_SpecialAir_Default 
    dw BlockInsideReaction_SpecialAir_Default 
    dw BlockInsideReaction_SpecialAir_Default 
    dw BlockInsideReaction_SpecialAir_Default 
    dw BlockInsideReaction_SpecialAir_Default 

BlockInsideReaction_SpecialAir_PLMTable_crateria:
    dw PLMEntries_insideReactionCrateria80 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 

BlockInsideReaction_SpecialAir_PLMTable_brinstar:
    dw PLMEntries_insideReactionBrinstarFloorPlant 
    dw PLMEntries_insideReactionBrinstarCeilingPlant 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 

BlockInsideReaction_SpecialAir_PLMTable_norfair:
    dw PLMEntries_insideReactionNothing_B653 
    dw PLMEntries_insideReactionNothing_B657 
    dw PLMEntries_insideReactionNothing_B65B 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 

BlockInsideReaction_SpecialAir_PLMTable_wreckedShip:
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 

BlockInsideReaction_SpecialAir_PLMTable_maridia:
    dw PLMEntries_insideReactionQuicksandSurface 
    dw PLMEntries_insideReactionQuicksandSurface 
    dw PLMEntries_insideReactionQuicksandSurface 
    dw PLMEntries_insideReactionSubmergingQuicksand 
    dw PLMEntries_insideReactionSandFallsSlow 
    dw PLMEntries_insideReactionSandFallsFast 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 

BlockInsideReaction_SpecialAir_PLMTable_tourian:
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 

BlockInsideReaction_SpecialAir_PLMTable_ceres:
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 

BlockInsideReaction_SpecialAir_PLMTable_debug:
    dw PLMEntries_insideReactionCrateria80 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 

BlockInsideReaction_SpecialAir_PLMTable_Pointers:
    dw BlockInsideReaction_SpecialAir_PLMTable_crateria 
    dw BlockInsideReaction_SpecialAir_PLMTable_brinstar 
    dw BlockInsideReaction_SpecialAir_PLMTable_norfair 
    dw BlockInsideReaction_SpecialAir_PLMTable_wreckedShip 
    dw BlockInsideReaction_SpecialAir_PLMTable_maridia 
    dw BlockInsideReaction_SpecialAir_PLMTable_tourian 
    dw BlockInsideReaction_SpecialAir_PLMTable_ceres 
    dw BlockInsideReaction_SpecialAir_PLMTable_debug 

BlockInsideReaction_SpecialAir:
    LDX.W $0DC4 
    LDA.L $7F6401,X : BMI .negativeBTS 
    AND.W #$FF00 
    XBA 
    ASL A 
    TAX 
    JSR.W (BlockInsideReaction_SpecialAir_JumpTable,X) 
    RTS 


.negativeBTS:
    XBA 
    AND.W #$007F 
    ASL A 
    TAY 
    LDA.W $079F 
    ASL A 
    TAX 
    LDA.W BlockInsideReaction_SpecialAir_PLMTable_Pointers,X : STA.B $22 
    LDA.B ($22),Y 
    JSL.L Spawn_PLM_to_CurrentBlockIndex 
    RTS 


BlockInsideReactionPointers:
    dw BlockInsideReaction_Air_ShootableAir_BombableAir 
    dw BlockInsideReaction_Slope 
    dw BlockInsideReaction_SpikeAir 
    dw BlockInsideReaction_SpecialAir 
    dw BlockInsideReaction_Air_ShootableAir_BombableAir 
    dw BlockShotBombedGrappledCollisionInsideReaction_HorizontalExt 
    dw BlockInsideReaction_Air_ShootableAir_BombableAir 
    dw BlockInsideReaction_Air_ShootableAir_BombableAir 
    dw BlockInsideReaction_SolidDoorSpikeSpecialShotGrappleBomb 
    dw BlockInsideReaction_SolidDoorSpikeSpecialShotGrappleBomb 
    dw BlockInsideReaction_SolidDoorSpikeSpecialShotGrappleBomb 
    dw BlockInsideReaction_SolidDoorSpikeSpecialShotGrappleBomb 
    dw BlockInsideReaction_SolidDoorSpikeSpecialShotGrappleBomb 
    dw BlockShotBombedGrappledCollisionInsideReaction_VerticalExt 
    dw BlockInsideReaction_SolidDoorSpikeSpecialShotGrappleBomb 
    dw BlockInsideReaction_SolidDoorSpikeSpecialShotGrappleBomb 

SamusBlockInsideHandling:
    PHB : PHK : PLB 
    STZ.W $0B4C 
    STZ.W $0B56 
    STZ.W $0B58 
    STZ.W $0B5A 
    STZ.W $0B5C 
    STZ.W $1E73 
    LDA.W $0AF6 : STA.B $1A 
    LDA.W $0AFA : CLC : ADC.W $0B00 : DEC A 
    STA.W $0E02 
    STA.B $1C 
    STZ.B $1E 
    STZ.B $20 
    JSR.W CalculateBlockAt_12_1E_1C_20 
    LDA.W $0DC4 
    ASL A 
    TAX 
    LDA.L $7F0003,X : AND.W #$00F0 
    LSR #3
    TAX 
    JSR.W (BlockInsideReactionPointers,X) 
    LDA.W #$0001 : STA.W $1E73 
    LDA.W $0AFA 
    EOR.W $0E02 
    AND.W #$FFF0 
    BEQ .top 
    LDA.W $0AF6 : STA.B $1A 
    LDA.W $0AFA : STA.B $1C 
    STZ.B $1E 
    STZ.B $20 
    JSR.W CalculateBlockAt_12_1E_1C_20 
    LDA.W $0DC4 
    ASL A 
    TAX 
    LDA.L $7F0003,X : AND.W #$00F0 
    LSR #3
    TAX 
    JSR.W (BlockInsideReactionPointers,X) 

.top:
    LDA.W #$0002 : STA.W $1E73 
    LDA.W $0AFA : SEC : SBC.W $0B00 : EOR.W $0E02 
    AND.W #$FFF0 
    BEQ .return 
    EOR.W $0AFA 
    AND.W #$FFF0 
    BEQ .return 
    LDA.W $0AF6 : STA.B $1A 
    LDA.W $0AFA : SEC : SBC.W $0B00 : STA.B $1C 
    STZ.B $1E 
    STZ.B $20 
    JSR.W CalculateBlockAt_12_1E_1C_20 
    LDA.W $0DC4 
    ASL A 
    TAX 
    LDA.L $7F0003,X : AND.W #$00F0 
    LSR #3
    TAX 
    JSR.W (BlockInsideReactionPointers,X) 

.return:
    PLB 
    RTL 


CalculateBlockAt_12_1E_1C_20:
    PHP 
    REP #$30 
    LDA.B $1A : CLC : ADC.B $1E : BMI .giveUp 
    CMP.W #$1000 
    BPL .giveUp 
    AND.W #$FFF0 
    LSR #4
    STA.W $0DD4 
    LDA.B $1C : CLC : ADC.B $20 : BMI .giveUp 
    CMP.W #$1000 
    BPL .giveUp 
    AND.W #$FFF0 
    LSR #4
    TAY 
    BEQ .zeroIndex 
    LDX.W #$0000 
    SEP #$20 
    LDA.W $07A5 : STA.W $4202 
    STY.W $4203 
    NOP #3
    REP #$20 
    LDA.W $4216 

.zeroIndex:
    CLC : ADC.W $0DD4 : STA.W $0DC4 
    BRA .return 


.giveUp:
    LDA.W #$FFFF : STA.W $0DC4 

.return:
    PLP 
    RTS 


DetermineProjectile_Prototype:
    PHP : PHB : PHX : PEA.W $9000 
    PLB : PLB 
    LDA.W $0C19,X : AND.W #$000F 
    BNE .notBeam 
    LDA.W $0C18,X : AND.W #$000F : STA.B $12 
    ASL A 
    ADC.B $12 : INC #2
    TAX 
    LDA.W ProtoWeaponConstants_Beams,X : AND.W #$00FF : STA.W $0DD2 
    BRA .return 


.notBeam:
    ASL A 
    INC A 
    TAX 
    LDA.W ProtoWeaponConstants_NonBeams,X : AND.W #$00FF : STA.W $0DD2 

.return:
    PLX : PLB : PLP 
    RTS 


BombAndPowerBombExplosionBlockCollisionHandling:
    PHP : PHB : PHK : PLB 
    REP #$30 
    JSR.W DetermineProjectile_Prototype 
    LDA.W $0B64,X : BMI .return 
    STA.B $1A 
    XBA 
    AND.W #$00FF 
    CMP.W $07A9 
    BPL .return 
    LDA.W $0B78,X : BMI .return 
    STA.B $1C 
    XBA 
    AND.W #$00FF 
    CMP.W $07AB 
    BPL .return 
    STZ.B $1E 
    STZ.B $20 
    STZ.W $0DC4 
    PHX 
    JSR.W CalculateBlockAt_12_1E_1C_20 
    PLX 
    LDA.W $0DD2 
    CMP.W #$0002 
    BEQ .bomb 
    JSR.W PowerBombExplosionBlockCollisionHandling 
    BRA .return 


.bomb:
    JSR.W BombExplosionBlockCollisionHandling 

.return:
    PLB : PLP 
    RTL 


BombExplosionBlockCollisionHandling:
    LDA.W $0C7C,X : BNE .return 
    LDA.W $0C18,X : BIT.W #$0001 
    BNE .return 
    ORA.W #$0001 
    STA.W $0C18,X 
    LDA.W $0DC4 
    CMP.W #$FFFF 
    BEQ .return 
    LDY.W #$0000 
    LDA.W $0DC4 
    ASL A 
    TAX 
    JSR.W BlockBombedReaction 
    JSR.W MoveBlockIndexX_OneBlockUp 
    JSR.W BlockBombedReaction 
    JSR.W MoveBlockIndexX_OneRowDown_OneColumnRight 
    JSR.W BlockBombedReaction 
    JSR.W MoveBlockIndexX_TwoColumnsLeft 
    JSR.W BlockBombedReaction 
    JSR.W MoveBlockIndexX_OneRowDown_OneColumRight_duplicate 
    JSR.W BlockBombedReaction 

.return:
    RTS 


RTS_949D33:
    RTS 


MoveBlockIndexX_OneBlockUp:
    TXA 
    SEC : SBC.W $07A5 : SBC.W $07A5 : TAX 
    RTS 


MoveBlockIndexX_OneRowDown_OneColumnRight:
    TXA 
    SEC 
    ADC.W $07A5 : ADC.W $07A5 : INC A 
    TAX 
    RTS 


MoveBlockIndexX_TwoColumnsLeft:
    DEX #4
    RTS 


MoveBlockIndexX_OneRowDown_OneColumRight_duplicate:
    TXA 
    SEC 
    ADC.W $07A5 : ADC.W $07A5 : INC A 
    TAX 
    RTS 


CLCRTS_949D59:
    CLC 
    RTS 


SECRTS_949D5B:
    SEC 
    RTS 


BombSpreadBlockReaction_Slope:
    LDX.W $0DC4 
    LDA.L $7F6402,X : AND.W #$001F 
    CMP.W #$0005 
    BCC .returnCollision 
    JMP.W BlockShotReaction_Horizontal_Slope_NonSquare 


.returnCollision:
    SEC 
    RTS 


BlockBombedReaction_SpecialBlock:
    LDX.W $0DC4 
    LDA.L $7F6401,X : AND.W #$FF00 
    XBA 
    BMI .areaDependent 
    ASL A 
    TAX 
    LDA.W BlockBombedReaction_SpecialBlock_PLMTable_areaIndependent,X 
    JSL.L Spawn_PLM_to_CurrentBlockIndex 
    REP #$40 
    SEC 
    RTS 


.areaDependent:
    AND.W #$007F 
    ASL A 
    TAY 
    LDA.W $079F 
    ASL A 
    TAX 
    LDA.W BlockBombedReaction_SpecialBlock_PLMTable_areaPointers,X : STA.B $12 
    LDA.B ($12),Y 
    JSL.L Spawn_PLM_to_CurrentBlockIndex 
    REP #$40 
    SEC 
    RTS 


BlockBombedReaction_SpecialBlock_PLMTable_areaIndependent:
    dw PLMEntries_1x1RespawningCrumbleBlock 
    dw PLMEntries_2x1RespawningCrumbleBlock 
    dw PLMEntries_1x2RespawningCrumbleBlock 
    dw PLMEntries_2x2RespawningCrumbleBlock 
    dw PLMEntries_1x1RespawningCrumbleBlock 
    dw PLMEntries_2x1RespawningCrumbleBlock 
    dw PLMEntries_1x2RespawningCrumbleBlock 
    dw PLMEntries_2x2RespawningCrumbleBlock 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_BombReaction_SpeedBoostBlock 
    dw PLMEntries_BombReaction_SpeedBoostBlock 

BlockBombedReaction_SpecialBlock_PLMTable_crateria:
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 

BlockBombedReaction_SpecialBlock_PLMTable_brinstar:
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_BombReaction_SpeedBoostBlock 
    dw PLMEntries_BombReaction_SpeedBoostBlock 
    dw PLMEntries_BombReaction_SpeedBoostBlock 
    dw PLMEntries_BombReaction_SpeedBoostBlock 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 

BlockBombedReaction_SpecialBlock_PLMTable_norfair:
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 

BlockBombedReaction_SpecialBlock_PLMTable_wreckedShip:
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 

BlockBombedReaction_SpecialBlock_PLMTable_maridia:
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 

BlockBombedReaction_SpecialBlock_PLMTable_tourian:
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 

BlockBombedReaction_SpecialBlock_PLMTable_ceres:
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 

BlockBombedReaction_SpecialBlock_PLMTable_debug:
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 

BlockBombedReaction_SpecialBlock_PLMTable_areaPointers:
    dw BlockBombedReaction_SpecialBlock_PLMTable_crateria 
    dw BlockBombedReaction_SpecialBlock_PLMTable_brinstar 
    dw BlockBombedReaction_SpecialBlock_PLMTable_norfair 
    dw BlockBombedReaction_SpecialBlock_PLMTable_wreckedShip 
    dw BlockBombedReaction_SpecialBlock_PLMTable_maridia 
    dw BlockBombedReaction_SpecialBlock_PLMTable_tourian 
    dw BlockBombedReaction_SpecialBlock_PLMTable_ceres 
    dw BlockBombedReaction_SpecialBlock_PLMTable_debug 

RTS_949E54:
    RTS 


BlockBombShotGrappledReaction_ShootableAir:
    LDX.W $0DC4 
    LDA.L $7F6401,X : AND.W #$FF00 
    XBA 
    BMI .returnDuplicate 
    ASL A 
    TAX 
    LDA.W BlockBombShotGrappledReaction_Shootable_PLMTable_noArea,X 
    JSL.L Spawn_PLM_to_CurrentBlockIndex 
    REP #$40 
    CLC ; >.<
    RTS 


.returnDuplicate:
    REP #$40 
    CLC ; >.<
    RTS 


BlockBombShotGrappledReaction_ShootableBlock:
    LDX.W $0DC4 
    LDA.L $7F6401,X : AND.W #$FF00 
    XBA 
    BMI .areaDependent 
    ASL A 
    TAX 
    LDA.W BlockBombShotGrappledReaction_Shootable_PLMTable_noArea,X 
    JSL.L Spawn_PLM_to_CurrentBlockIndex 
    REP #$40 
    SEC 
    RTS 


.areaDependent:
    AND.W #$007F 
    ASL A 
    TAY 
    LDA.W $079F 
    ASL A 
    TAX 
    LDA.W BlockBombShotGrappledReaction_Shootable_PLMTable_areaPointer,X : STA.B $12 
    LDA.B ($12),Y 
    JSL.L Spawn_PLM_to_CurrentBlockIndex 
    REP #$40 
    SEC 
    RTS 


BlockBombShotGrappledReaction_Shootable_PLMTable_noArea:
    dw PLMEntries_Reaction_1x1RespawningShotBlock 
    dw PLMEntries_Reaction_2x1RespawningShotBlock 
    dw PLMEntries_Reaction_1x2RespawningShotBlock 
    dw PLMEntries_Reaction_2x2RespawningShotBlock 
    dw PLMEntries_Reaction_1x1ShotBlock 
    dw PLMEntries_Reaction_2x1ShotBlock 
    dw PLMEntries_Reaction_1x2ShotBlock 
    dw PLMEntries_Reaction_2x2ShotBlock 
    dw PLMEntries_Reaction_RespawningPowerBombBlock 
    dw PLMEntries_Reaction_PowerBombBlock 
    dw PLMEntries_Reaction_RespawningSuperMissileBlock 
    dw PLMEntries_Reaction_SuperMissileBlock 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_gateBlock 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_blueDoorFacingLeft 
    dw PLMEntries_blueDoorFacingRight 
    dw PLMEntries_blueDoorFacingUp 
    dw PLMEntries_blueDoorFacingDown 
    dw PLMEntries_genericShotTriggerForAPLM 
    dw PLMEntries_ItemCollisionDetection 
    dw PLMEntries_leftBlueGateTrigger 
    dw PLMEntries_rightBlueGateTrigger 
    dw PLMEntries_leftRedGateTrigger 
    dw PLMEntries_rightRedGateTrigger 
    dw PLMEntries_leftGreenGateTrigger 
    dw PLMEntries_rightGreenGateTrigger 
    dw PLMEntries_leftYellowGateTrigger 
    dw PLMEntries_rightYellowGateTrigger 
    dw PLMEntries_nothing 
    dw PLMEntries_Reaction_CrittersEscapeBlock 

BlockBombShotGrappledReaction_Shootable_PLMTable_crateria:
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 

BlockBombShotGrappledReaction_Shootable_PLMTable_brinstar:
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 

BlockBombShotGrappledReaction_Shootable_PLMTable_norfair:
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 

BlockBombShotGrappledReaction_Shootable_PLMTable_wreckedShip:
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 

BlockBombShotGrappledReaction_Shootable_PLMTable_maridia:
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 

BlockBombShotGrappledReaction_Shootable_PLMTable_tourian:
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 

BlockBombShotGrappledReaction_Shootable_PLMTable_ceres:
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 

BlockBombShotGrappledReaction_Shootable_PLMTable_debug:
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 

BlockBombShotGrappledReaction_Shootable_PLMTable_areaPointer:
    dw BlockBombShotGrappledReaction_Shootable_PLMTable_crateria 
    dw BlockBombShotGrappledReaction_Shootable_PLMTable_brinstar 
    dw BlockBombShotGrappledReaction_Shootable_PLMTable_norfair 
    dw BlockBombShotGrappledReaction_Shootable_PLMTable_wreckedShip 
    dw BlockBombShotGrappledReaction_Shootable_PLMTable_maridia 
    dw BlockBombShotGrappledReaction_Shootable_PLMTable_tourian 
    dw BlockBombShotGrappledReaction_Shootable_PLMTable_ceres 
    dw BlockBombShotGrappledReaction_Shootable_PLMTable_debug 

BlockShotBombedGrappledReaction_BombableAir:
    LDX.W $0DC4 
    LDA.L $7F6401,X : AND.W #$FF00 
    XBA 
    BMI .returnDuplicate 
    ASL A 
    TAX 
    LDA.W BlockShotBombedGrappledReaction_Bombable_PLMTable,X 
    JSL.L Spawn_PLM_to_CurrentBlockIndex 
    REP #$40 
    CLC ; >.<
    RTS 


.returnDuplicate:
    REP #$40 
    CLC ; >.<
    RTS 


BlockShotBombedGrappledReaction_BombableBlock:
    LDX.W $0DC4 
    LDA.L $7F6401,X : AND.W #$FF00 
    XBA 
    BMI .returnDuplicate 
    ASL A 
    TAX 
    LDA.W BlockShotBombedGrappledReaction_Bombable_PLMTable,X 
    JSL.L Spawn_PLM_to_CurrentBlockIndex 
    REP #$40 
    SEC 
    RTS 


.returnDuplicate:
    REP #$40 
    SEC 
    RTS 


BlockShotBombedGrappledReaction_Bombable_PLMTable:
    dw PLMEntries_Reaction_1x1RespawningBombBlock 
    dw PLMEntries_Reaction_2x1RespawningBombBlock 
    dw PLMEntries_Reaction_1x2RespawningBombBlock 
    dw PLMEntries_Reaction_2x2RespawningBombBlock 
    dw PLMEntries_Reaction_1x1BombBlock 
    dw PLMEntries_Reaction_2x1BombBlock 
    dw PLMEntries_Reaction_1x2BombBlock 
    dw PLMEntries_Reaction_2x2BombBlock 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 
    dw PLMEntries_nothing 

BlockBombedReactionPointers:
    dw CLCRTS_949D59 
    dw CLCRTS_949D59 
    dw CLCRTS_949D59 
    dw CLCRTS_949D59 
    dw BlockBombShotGrappledReaction_ShootableAir 
    dw BlockShotBombedGrappledCollisionInsideReaction_HorizontalExt 
    dw CLCRTS_949D59 
    dw BlockShotBombedGrappledReaction_BombableAir 
    dw SECRTS_949D5B 
    dw SECRTS_949D5B 
    dw SECRTS_949D5B 
    dw BlockBombedReaction_SpecialBlock 
    dw BlockBombShotGrappledReaction_ShootableBlock 
    dw BlockShotBombedGrappledCollisionInsideReaction_VerticalExt 
    dw SECRTS_949D5B 
    dw BlockShotBombedGrappledReaction_BombableBlock 

BlockBombedReaction:
    PHX 
    STX.W $0DC4 
    LSR.W $0DC4 
    LDA.L $7F0002,X : AND.W #$F000 
    XBA 
    LSR #3
    TAX 
    JSR.W (BlockBombedReactionPointers,X) 
    PLX 
    RTS 


PowerBombExplosionBlockCollisionHandling:
    LDA.W $0C7C,X : BEQ .zero 
    BPL .return 
    STZ.W $0C7C,X 

.return:
    RTS 


.zero:
    LDA.W $0CEB : AND.W #$00FF : STA.B $12 
    ASL A 
    ADC.B $12 : LSR #2
    STA.B $14 
    LDA.W $0CE2 : SEC : SBC.B $12 : BPL .set16 
    LDA.W #$0000 

.set16:
    LSR #4
    STA.B $16 
    LDA.W $0CE2 : CLC : ADC.B $12 : LSR #4
    CMP.W $07A5 
    BCC .set18 
    LDA.W $07A5 
    DEC A 

.set18:
    STA.B $18 
    LDA.W $0CE4 : SEC : SBC.B $14 : BPL .set1A 
    LDA.W #$0000 

.set1A:
    LSR #4
    STA.B $1A 
    LDA.W $0CE4 : CLC : ADC.B $14 : LSR #4
    CMP.W $07A7 
    BCC .set1C 
    LDA.W $07A7 
    DEC A 

.set1C:
    STA.B $1C 
    LDA.B $15 : AND.W #$FF00 
    ORA.B $1A 
    PHA 
    JSR.W PowerBombExplosionBlockCollisionHandling_Row 
    PLA 
    JSR.W PowerBombExplosionBlockCollisionHandling_Column 
    LDA.B $15 : AND.W #$FF00 
    ORA.B $1C 
    JSR.W PowerBombExplosionBlockCollisionHandling_Row 
    LDA.B $17 : AND.W #$FF00 
    ORA.B $1A 
    JSR.W PowerBombExplosionBlockCollisionHandling_Column 
    RTS 


PowerBombExplosionBlockCollisionHandling_Row:
    SEP #$20 
    STA.W $4202 
    LDA.W $07A5 : STA.W $4203 
    LDA.B #$00 
    XBA 
    REP #$31 
    ADC.W $4216 : ASL A 
    TAX 
    LDA.B $18 : SEC : SBC.B $16 : TAY 

.loop:
    PHY 
    JSR.W BlockBombedReaction 
    PLY 
    INX #2
    DEY 
    BPL .loop 
    RTS 


PowerBombExplosionBlockCollisionHandling_Column:
    SEP #$20 
    STA.W $4202 
    LDA.W $07A5 : STA.W $4203 
    LDA.B #$00 
    XBA 
    REP #$31 
    ADC.W $4216 : ASL A 
    TAX 
    LDA.B $1C : SEC : SBC.B $1A : TAY 

.loop:
    PHY 
    JSR.W BlockBombedReaction 
    PLY 
    TXA 
    CLC : ADC.W $07A5 : ADC.W $07A5 : TAX 
    DEY 
    BPL .loop 
    RTS 


BlockShotReaction_Horizontal_Slope:
    LDX.W $0DC4 
    LDA.L $7F6402,X : AND.W #$001F 
    CMP.W #$0005 
    BCC .gotoSquare 
    JMP.W BlockShotReaction_Horizontal_Slope_NonSquare 


.gotoSquare:
    JMP.W BlockShotReaction_Horizontal_Slope_Square 


SECRTS_94A15C:
    SEC 
    RTS 


BlockShotReaction_Vertical_Slope:
    LDX.W $0DC4 
    LDA.L $7F6402,X : AND.W #$001F 
    CMP.W #$0005 
    BCC .gotoSquare 
    JMP.W BlockShotReaction_Vertical_Slope_NonSquare 


.gotoSquare:
    JMP.W BlockShotReaction_Vertical_Slope_Square 


SECRTS_94A173:
    SEC 
    RTS 


BlockShotReactionPointers_Horizontal:
    dw CLCRTS_949D59 
    dw BlockShotReaction_Horizontal_Slope 
    dw CLCRTS_949D59 
    dw CLCRTS_949D59 
    dw BlockBombShotGrappledReaction_ShootableAir 
    dw BlockShotBombedGrappledCollisionInsideReaction_HorizontalExt 
    dw CLCRTS_949D59 
    dw BlockShotBombedGrappledReaction_BombableAir 
    dw SECRTS_949D5B 
    dw SECRTS_949D5B 
    dw SECRTS_949D5B 
    dw SECRTS_949D5B 
    dw BlockBombShotGrappledReaction_ShootableBlock 
    dw BlockShotBombedGrappledCollisionInsideReaction_VerticalExt 
    dw SECRTS_949D5B 
    dw BlockShotBombedGrappledReaction_BombableBlock 

BlockShotReactionPointers_Vertical:
    dw CLCRTS_949D59 
    dw BlockShotReaction_Vertical_Slope 
    dw CLCRTS_949D59 
    dw CLCRTS_949D59 
    dw BlockBombShotGrappledReaction_ShootableAir 
    dw BlockShotBombedGrappledCollisionInsideReaction_HorizontalExt 
    dw CLCRTS_949D59 
    dw BlockShotBombedGrappledReaction_BombableAir 
    dw SECRTS_949D5B 
    dw SECRTS_949D5B 
    dw SECRTS_949D5B 
    dw SECRTS_949D5B 
    dw BlockBombShotGrappledReaction_ShootableBlock 
    dw BlockShotBombedGrappledCollisionInsideReaction_VerticalExt 
    dw SECRTS_949D5B 
    dw BlockShotBombedGrappledReaction_BombableBlock 

BlockShotReaction_Horizontal:
    CPX.W $07B9 
    BCS .return 
    PHX 
    STX.W $0DC4 
    LSR.W $0DC4 
    LDA.L $7F0002,X : AND.W #$F000 
    XBA 
    LSR #3
    TAX 
    JSR.W (BlockShotReactionPointers_Horizontal,X) 
    BCC .blockCollision 
    DEC.B $28 

.blockCollision:
    PLX 

.return:
    RTS 


BlockShotReaction_Vertical:
    CPX.W $07B9 
    BCS .return 
    PHX 
    STX.W $0DC4 
    LSR.W $0DC4 
    LDA.L $7F0002,X : AND.W #$F000 
    XBA 
    LSR #3
    TAX 
    JSR.W (BlockShotReactionPointers_Vertical,X) 
    BCC .blockCollision 
    DEC.B $28 

.blockCollision:
    PLX 

.return:
    RTS 


CalculateProjectileYBlockSpan:
    LDA.W $0B78,X : SEC : SBC.W $0BC8,X : AND.W #$FFF0 
    STA.B $26 
    LDA.W $0B78,X : CLC : ADC.W $0BC8,X : DEC A 
    SEC : SBC.B $26 : LSR #4
    STA.B $26 
    STA.B $1A 
    STA.B $28 
    RTS 


CalculateProjectileXBlockSpan:
    LDA.W $0B64,X : SEC : SBC.W $0BB4,X : AND.W #$FFF0 
    STA.B $26 
    LDA.W $0B64,X : CLC : ADC.W $0BB4,X : DEC A 
    SEC : SBC.B $26 : LSR #4
    STA.B $26 
    STA.B $1A 
    STA.B $28 
    RTS 


MoveBeamHorizontally_NoWaveBeam:
    PHB : PHX : PHK : PLB 
    STZ.B $1E 
    STZ.B $12 
    STZ.B $14 
    LDA.W $0BDC,X : BPL + 
    DEC.B $14 

  + STA.B $13 
    JSR.W CalculateProjectileYBlockSpan 
    LDA.W $0B78,X : SEC : SBC.W $0BC8,X : LSR #4
    SEP #$20 
    STA.W $4202 
    LDA.W $07A5 : STA.W $4203 
    REP #$20 
    LDA.W $0B8C,X : CLC : ADC.B $12 : STA.W $0B8C,X 
    STA.B $16 
    LDA.W $0B64,X : ADC.B $14 : STA.W $0B64,X 
    STA.B $18 
    BIT.B $14 
    BMI .negative14 
    CLC : ADC.W $0BB4,X : DEC A 
    BRA + 


.negative14:
    SEC : SBC.W $0BB4,X 

  + STA.B $1C 
    LSR #4
    CLC : ADC.W $4216 : ASL A 
    TAX 
    LDA.B $26 
    CMP.W #$0010 
    BPL .noCollision 
    LDA.B $1D : AND.W #$00FF 
    CMP.W $07A9 
    BPL .noCollision 

.loop:
    JSR.W BlockShotReaction_Horizontal 
    TXA 
    CLC : ADC.W $07A5 : ADC.W $07A5 : TAX 
    DEC.B $26 
    BPL .loop 
    LDA.B $28 : BMI .completeCollision 

.noCollision:
    PLX : PLB 
    CLC 
    RTL 


.completeCollision:
    PLX 
    JSL.L Kill_Projectile 
    PLB 
    SEC 
    RTL 


MoveBeamVertically_NoWaveBeam:
    PHB : PHX : PHK : PLB 
    STZ.B $1E 
    STZ.B $12 
    STZ.B $14 
    LDA.W $0BF0,X : BPL + 
    DEC.B $14 

  + STA.B $13 
    JSR.W CalculateProjectileXBlockSpan 
    LDA.W $0BA0,X : CLC : ADC.B $12 : STA.W $0BA0,X 
    STA.B $16 
    LDA.W $0B78,X : ADC.B $14 : STA.W $0B78,X 
    STA.B $18 
    BIT.B $14 
    BMI .negative14 
    CLC : ADC.W $0BC8,X : DEC A 
    BRA + 


.negative14:
    SEC : SBC.W $0BC8,X 

  + STA.B $1C 
    LSR #4
    SEP #$20 
    STA.W $4202 
    LDA.W $07A5 : STA.W $4203 
    REP #$20 
    LDA.W $0B64,X : SEC : SBC.W $0BB4,X : LSR #4
    CLC : ADC.W $4216 : ASL A 
    TAX 
    LDA.B $26 
    CMP.W #$0010 
    BPL .noCollision 
    LDA.B $1D : AND.W #$00FF 
    CMP.W $07AB 
    BPL .noCollision 

.loop:
    JSR.W BlockShotReaction_Vertical 
    INX #2
    DEC.B $26 
    BPL .loop 
    LDA.B $28 : BMI .completeCollision 

.noCollision:
    PLX : PLB 
    CLC 
    RTL 


.completeCollision:
    PLX 
    JSL.L Kill_Projectile 
    PLB 
    SEC 
    RTL 


MoveBeamHorizontally_WaveBeam:
    PHB : PHX : PHK : PLB 
    STZ.B $1E 
    STZ.B $12 
    STZ.B $14 
    LDA.W $0BDC,X : BPL + 
    DEC.B $14 

  + STA.B $13 
    JSR.W CalculateProjectileYBlockSpan 
    LDA.W $0B78,X : SEC : SBC.W $0BC8,X : LSR #4
    SEP #$20 
    STA.W $4202 
    LDA.W $07A5 : STA.W $4203 
    REP #$20 
    LDA.W $0B8C,X : CLC : ADC.B $12 : STA.W $0B8C,X 
    STA.B $16 
    LDA.W $0B64,X : ADC.B $14 : STA.W $0B64,X 
    STA.B $18 
    BIT.B $14 
    BMI .leftBoundary 
    CLC : ADC.W $0BB4,X : DEC A 
    BRA + 


.leftBoundary:
    SEC : SBC.W $0BB4,X 

  + STA.B $1C 
    LSR #4
    CLC : ADC.W $4216 : ASL A 
    TAY 
    LDA.B $26 
    CMP.W #$0010 
    BPL .returnNoCollision 
    LDA.W $0B78,X 
    XBA 
    BMI .returnNoCollision 
    AND.W #$00FF 
    CMP.W $07AB 
    BPL .returnNoCollision 
    LDA.B $1D : AND.W #$00FF 
    CMP.W $07A9 
    BPL .returnNoCollision 
    TYX 

.loop:
    JSR.W BlockShotReaction_Horizontal 
    TXA 
    CLC : ADC.W $07A5 : ADC.W $07A5 : TAX 
    DEC.B $26 
    BPL .loop 

.returnNoCollision:
    PLX : PLB 
    CLC 
    RTL 


MoveBeamVertically_WaveBeam:
    PHB : PHX : PHK : PLB 
    STZ.B $1E 
    STZ.B $12 
    STZ.B $14 
    LDA.W $0BF0,X : BPL + 
    DEC.B $14 

  + STA.B $13 
    JSR.W CalculateProjectileXBlockSpan 
    LDA.W $0BA0,X : CLC : ADC.B $12 : STA.W $0BA0,X 
    STA.B $16 
    LDA.W $0B78,X : ADC.B $14 : STA.W $0B78,X 
    STA.B $18 
    BIT.B $14 
    BMI .negative14 
    CLC : ADC.W $0BC8,X : DEC A 
    BRA + 


.negative14:
    SEC : SBC.W $0BC8,X 

  + STA.B $1C 
    LSR #4
    SEP #$20 
    STA.W $4202 
    LDA.W $07A5 : STA.W $4203 
    REP #$20 
    LDA.W $0B64,X : SEC : SBC.W $0BB4,X : LSR #4
    CLC : ADC.W $4216 : ASL A 
    TAY 
    LDA.B $26 
    CMP.W #$0010 
    BPL .returnNoCollision 
    LDA.W $0B64,X 
    XBA 
    BMI .returnNoCollision 
    AND.W #$00FF 
    CMP.W $07A9 
    BPL .returnNoCollision 
    LDA.B $1D : AND.W #$00FF 
    CMP.W $07AB 
    BPL .returnNoCollision 
    TYX 

.loop:
    JSR.W BlockShotReaction_Vertical 
    INX #2
    DEC.B $26 
    BPL .loop 

.returnNoCollision:
    PLX : PLB 
    CLC 
    RTL 


MoveMissileHorizontally:
    PHB : PHX : PHK : PLB 
    LDA.W #$0001 : STA.B $1E 
    STZ.B $26 
    STZ.B $1A 
    STZ.B $12 
    STZ.B $14 
    LDA.W $0BDC,X : BPL + 
    DEC.B $14 

  + STA.B $13 
    LDA.W $0B78,X 
    LSR #4
    SEP #$20 
    STA.W $4202 
    LDA.W $07A5 : STA.W $4203 
    REP #$20 
    LDA.W $0B8C,X : CLC : ADC.B $12 : STA.W $0B8C,X 
    STA.B $16 
    LDA.W $0B64,X : ADC.B $14 : STA.W $0B64,X 
    STA.B $18 
    STA.B $1C 
    LSR #4
    CLC : ADC.W $4216 : ASL A 
    TAX 
    LDA.B $19 : AND.W #$00FF 
    CMP.W $07A9 
    BPL .noCollision 
    JSR.W BlockShotReaction_Horizontal 
    BCS .collision 

.noCollision:
    PLX : PLB 
    CLC 
    RTL 


.collision:
    PLX 
    JSL.L Kill_Projectile 
    PLB 
    SEC 
    RTL 


MoveMissileVertically:
    PHB : PHX : PHK : PLB 
    LDA.W #$0001 : STA.B $1E 
    STZ.B $26 
    STZ.B $1A 
    STZ.B $12 
    STZ.B $14 
    LDA.W $0BF0,X : BPL + 
    DEC.B $14 

  + STA.B $13 
    LDA.W $0BA0,X : CLC : ADC.B $12 : STA.W $0BA0,X 
    STA.B $16 
    LDA.W $0B78,X : ADC.B $14 : STA.W $0B78,X 
    STA.B $18 
    STA.B $1C 
    LSR #4
    SEP #$20 
    STA.W $4202 
    LDA.W $07A5 : STA.W $4203 
    REP #$20 
    LDA.W $0B64,X 
    LSR #4
    CLC : ADC.W $4216 : ASL A 
    TAX 
    LDA.B $19 : AND.W #$00FF 
    CMP.W $07AB 
    BPL .noCollision 
    JSR.W BlockShotReaction_Vertical 
    BCS .collision 

.noCollision:
    PLX : PLB 
    CLC 
    RTL 


.collision:
    PLX 
    JSL.L Kill_Projectile 
    PLB 
    SEC 
    RTL 


BlockShotReaction_Horizontal_Slope_NonSquare:
    REP #$20 
    LDX.W $0DC4 
    LDY.W $0DDE 
    LDA.W $0DC4 : STA.W $4204 
    SEP #$20 
    LDA.W $07A5 : STA.W $4206 
    REP #$20 
    LDA.W $0B78,Y 
    LSR #4
    CMP.W $4214 
    BEQ BlockShotReaction_Slope_NonSquare 
    CLC 
    RTS 


BlockShotReaction_Vertical_Slope_NonSquare:
    REP #$20 
    LDX.W $0DC4 
    LDY.W $0DDE 
    LDA.W $0DC4 : STA.W $4204 
    SEP #$20 
    LDA.W $07A5 : STA.W $4206 
    REP #$20 
    LDA.W $0B64,Y 
    LSR #4
    CMP.W $4216 
    BEQ BlockShotReaction_Slope_NonSquare 
    CLC 
    RTS 


BlockShotReaction_Slope_NonSquare:
    LDA.L $7F6402,X : AND.W #$001F 
    ASL #4
    STA.W $0DD6 
    LDA.L $7F6401,X 
    ASL A 
    BMI .blockBTS40 
    LDA.W $0B64,Y : BRA + 


.blockBTS40:
    LDA.W $0B64,Y 
    EOR.W #$000F 

  + AND.W #$000F 
    CLC : ADC.W $0DD6 : PHA 
    LDA.L $7F6401,X : BMI .blockBTSMSB 
    JMP.W .YFlip 


.blockBTSMSB:
    PLX 
    LDA.W $0B78,Y : AND.W #$000F 
    EOR.W #$000F 
    STA.W $0DD4 
    LDA.W SlopeDefinitions_SlopeTopXOffsetByYPixel,X : AND.W #$001F 
    CMP.W $0DD4 
    BMI .collision 
    BEQ .collision 
    CLC 
    RTS 


.collision:
    STZ.B $26 
    STZ.B $28 
    SEC 
    RTS 


.YFlip:
    PLX 
    LDA.W $0B78,Y : AND.W #$000F : STA.W $0DD4 
    LDA.W SlopeDefinitions_SlopeTopXOffsetByYPixel,X : AND.W #$001F 
    CMP.W $0DD4 
    BMI ..collision 
    BEQ ..collision 
    CLC 
    RTS 


..collision:
    STZ.B $26 
    STZ.B $28 
    SEC 
    RTS 


BombSpreadBlockReaction_Pointers:
    dw CLCRTS_949D59 
    dw BombSpreadBlockReaction_Slope 
    dw CLCRTS_949D59 
    dw CLCRTS_949D59 
    dw SECRTS_949D5B 
    dw BlockShotBombedGrappledCollisionInsideReaction_HorizontalExt 
    dw CLCRTS_949D59 
    dw CLCRTS_949D59 
    dw SECRTS_949D5B 
    dw SECRTS_949D5B 
    dw SECRTS_949D5B 
    dw SECRTS_949D5B 
    dw SECRTS_949D5B 
    dw BlockShotBombedGrappledCollisionInsideReaction_VerticalExt 
    dw SECRTS_949D5B 
    dw SECRTS_949D5B 

BombSpreadBlockCollisionDetection:
    PHP : PHB : PHK : PLB 
    REP #$30 
    LDA.W $0B64,X : STA.B $1A 
    LDA.W $0B78,X : STA.B $1C 
    STZ.B $1E 
    STZ.B $20 
    STZ.W $0DC4 
    PHX 
    JSR.W CalculateBlockAt_12_1E_1C_20 
    PLX 
    LDA.W $0C7C,X : BNE .nonZeroTimer 
    JSR.W BombExplosionBlockCollisionHandling 
    BRA .returnNoCollision 


.nonZeroTimer:
    LDA.W $0DC4 
    CMP.W #$FFFF 
    BEQ .returnCollision 
    ASL A 
    TAX 
    LDA.L $7F0002,X : AND.W #$F000 
    XBA 
    LSR #3
    TAX 
    JSR.W (BombSpreadBlockReaction_Pointers,X) 
    BCS .returnCollision 

.returnNoCollision:
    PLB : PLP 
    CLC 
    RTL 


.returnCollision:
    PLB : PLP 
    SEC 
    RTL 


BlockShotReaction_Horizontal_Slope_Square:
    ASL #2
    STA.W $0DD4 
    LDA.L $7F6401,X 
    ROL A 
    ROL A 
    ROL A 
    AND.W #$0003 
    STA.W $0DD6 
    LDA.B $1C : AND.W #$0008 
    LSR #3
    EOR.W $0DD6 
    ADC.W $0DD4 : TAX 
    LDY.W $0DDE 
    LDA.B $1E : BNE .missile 
    LDA.B $1A : BNE .multiBlock 
    LDA.W $0B78,Y : SEC : SBC.W $0BC8,Y : AND.W #$0008 
    BNE .bottomHalf 
    LDA.W SquareSlopeDefinitions_Bank94-1,X : BMI .gotoReturnCollision 

.bottomHalf:
    TXA 
    EOR.W #$0002 
    TAX 
    LDA.W $0B78,Y : CLC : ADC.W $0BC8,Y : DEC A 
    AND.W #$0008 
    BEQ .returnNoCollision 
    LDA.W SquareSlopeDefinitions_Bank94-1,X : BMI .gotoReturnCollision 

.returnNoCollision:
    CLC 
    RTS 


.gotoReturnCollision:
    JMP.W .returnCollision ; >.<


.multiBlock:
    LDA.B $26 : BNE .topBlockCheck 
    LDA.W $0B78,Y : CLC : ADC.W $0BC8,Y : DEC A 
    AND.W #$0008 
    BNE .checkBothHalves 
    LDA.W SquareSlopeDefinitions_Bank94-1,X : BMI .completeWaste 
    BRA .returnNoCollisionDuplicate 


.topBlockCheck:
    CMP.B $1A 
    BNE .checkBothHalves 
    LDA.W $0B78,Y : SEC : SBC.W $0BC8,Y : AND.W #$0008 
    BNE .checkBottomHalf 

.checkBothHalves:
    LDA.W SquareSlopeDefinitions_Bank94-1,X : BMI .completeWaste 

.checkBottomHalf:
    TXA 
    EOR.W #$0002 
    TAX 
    LDA.W SquareSlopeDefinitions_Bank94-1,X : BMI .completeWaste 

.returnNoCollisionDuplicate:
    CLC 
    RTS 


.completeWaste:
    JMP.W .returnCollision 


.returnCollision:
    SEC 
    RTS 


.missile:
    LDY.W $0DDE 
    LDA.W $0B78,Y : AND.W #$0008 
    BEQ + 
    TXA 
    EOR.W #$0002 
    TAX 

  + LDA.W SquareSlopeDefinitions_Bank94-1,X : BMI .returnCollisionDuplicate 
    CLC 
    RTS 


.returnCollisionDuplicate:
    SEC 
    RTS 


BlockShotReaction_Vertical_Slope_Square:
    ASL #2
    STA.W $0DD4 
    LDA.L $7F6401,X 
    ROL A 
    ROL A 
    ROL A 
    AND.W #$0003 
    STA.W $0DD6 
    LDA.B $1C : AND.W #$0008 
    LSR #2
    EOR.W $0DD6 
    ADC.W $0DD4 : TAX 
    LDY.W $0DDE 
    LDA.B $1E : BNE .missile 
    LDA.B $1A : BNE .multiBlock 
    LDA.W $0B64,Y : SEC : SBC.W $0BB4,Y : AND.W #$0008 
    BNE .right 
    LDA.W SquareSlopeDefinitions_Bank94-1,X : BMI .gotoReturnCollision 

.right:
    TXA 
    EOR.W #$0001 
    TAX 
    LDA.W $0B64,Y : CLC : ADC.W $0BB4,Y : DEC A 
    AND.W #$0008 
    BEQ .returnNoCollision 
    LDA.W SquareSlopeDefinitions_Bank94-1,X : BMI .gotoReturnCollision 

.returnNoCollision:
    CLC 
    RTS 


.gotoReturnCollision:
    JMP.W .returnCollision 


.multiBlock:
    LDA.B $26 : BNE .leftmostBlockCheck 
    LDA.W $0B64,Y : CLC : ADC.W $0BB4,Y : DEC A 
    AND.W #$0008 
    BNE .checkBothHalves 
    LDA.W SquareSlopeDefinitions_Bank94-1,X : BMI .gotoNowhere 
    BRA .returnNoCollisionDuplicate 


.leftmostBlockCheck:
    CMP.B $1A 
    BNE .checkBothHalves 
    LDA.W $0B64,Y : SEC : SBC.W $0BB4,Y : AND.W #$0008 
    BNE .checkLeftHalf 

.checkBothHalves:
    LDA.W SquareSlopeDefinitions_Bank94-1,X : BMI .gotoNowhere 

.checkLeftHalf:
    TXA 
    EOR.W #$0001 
    TAX 
    LDA.W SquareSlopeDefinitions_Bank94-1,X : BMI .gotoNowhere 

.returnNoCollisionDuplicate:
    CLC 
    RTS 


.gotoNowhere:
    JMP.W .returnCollision ; >.<


.returnCollision:
    SEC 
    RTS 


.missile:
    LDY.W $0DDE 
    LDA.W $0B64,Y : AND.W #$0008 
    BEQ .leftHalf 
    TXA 
    EOR.W #$0001 
    TAX 

.leftHalf:
    LDA.W SquareSlopeDefinitions_Bank94-1,X : BMI .returnCollisionDuplicate 
    CLC 
    RTS 


.returnCollisionDuplicate:
    SEC 
    RTS 


BlockGrappleReaction_Air_SpikeAir_SpecialAir:
    REP #$40 
    CLC ; >.<
    RTS 


BlockGrappleReaction_Slope_SolidBlock_DoorBlock_SpecialBlock:
    REP #$40 
    SEC 
    RTS 


BlockGrappleReaction_GrappleBlock:
    LDA.W #$8000 
    TRB.W $0CF4 
    LDX.W $0DC4 
    LDA.L $7F6401,X 
    XBA 
    BMI + 
    AND.W #$007F 
    ASL A 
    TAX 
    LDA.W .PLMs,X 
    JSL.L Spawn_PLM_to_CurrentBlockIndex 
    RTS 


  + AND.W #$007F ; >_<
    REP #$40 
    CLC 
    RTS 


.PLMs:
    dw PLMEntries_Grappled_GrappleBlock 
    dw PLMEntries_Grappled_RespawningBreakableGrappleBlock 
    dw PLMEntries_Grappled_BreakableGrappleBlock 
    dw PLMEntries_Grappled_GrappleBlock 

BlockGrappleReaction_SpikeBlock:
    LDX.W $0DC4 
    LDA.L $7F6401,X 
    XBA 
    BMI + 
    AND.W #$007F 
    ASL A 
    TAX 
    LDA.W .PLMs,X 
    JSL.L Spawn_PLM_to_CurrentBlockIndex 
    RTS 


  + AND.W #$007F ; >_<
    REP #$40 
    CLC 
    RTS 


.PLMs:
    dw PLMEntries_Grappled_GenericSpikeBlock 
    dw PLMEntries_Grappled_GenericSpikeBlock 
    dw PLMEntries_Grappled_GenericSpikeBlock 
    dw PLMEntries_Grappled_DraygonsBrokenTurret 
    dw PLMEntries_Grappled_GenericSpikeBlock 
    dw PLMEntries_Grappled_GenericSpikeBlock 
    dw PLMEntries_Grappled_GenericSpikeBlock 
    dw PLMEntries_Grappled_GenericSpikeBlock 
    dw PLMEntries_Grappled_GenericSpikeBlock 
    dw PLMEntries_Grappled_GenericSpikeBlock 
    dw PLMEntries_Grappled_GenericSpikeBlock 
    dw PLMEntries_Grappled_GenericSpikeBlock 
    dw PLMEntries_Grappled_GenericSpikeBlock 
    dw PLMEntries_Grappled_GenericSpikeBlock 
    dw PLMEntries_Grappled_GenericSpikeBlock 
    dw PLMEntries_Grappled_GenericSpikeBlock 

BlockGrappleReaction_Pointers:
    dw BlockGrappleReaction_Air_SpikeAir_SpecialAir 
    dw BlockGrappleReaction_Slope_SolidBlock_DoorBlock_SpecialBlock 
    dw BlockGrappleReaction_Air_SpikeAir_SpecialAir 
    dw BlockGrappleReaction_Air_SpikeAir_SpecialAir 
    dw BlockBombShotGrappledReaction_ShootableAir 
    dw BlockShotBombedGrappledCollisionInsideReaction_HorizontalExt 
    dw BlockGrappleReaction_Air_SpikeAir_SpecialAir 
    dw BlockShotBombedGrappledReaction_BombableAir 
    dw BlockGrappleReaction_Slope_SolidBlock_DoorBlock_SpecialBlock 
    dw BlockGrappleReaction_Slope_SolidBlock_DoorBlock_SpecialBlock 
    dw BlockGrappleReaction_SpikeBlock 
    dw BlockGrappleReaction_Slope_SolidBlock_DoorBlock_SpecialBlock 
    dw BlockBombShotGrappledReaction_ShootableBlock 
    dw BlockShotBombedGrappledCollisionInsideReaction_VerticalExt 
    dw BlockGrappleReaction_GrappleBlock 
    dw BlockShotBombedGrappledReaction_BombableBlock 

GrappleBeamBlockCollisionDetection:
    PHB : PHK : PLB 
    LDA.W $0D22 : STA.W $0D83 
    CLC 
    ROR.W $0D84 
    ROR.W $0D82 
    ROR.W $0D84 
    ROR.W $0D82 
    LDA.W $0D22 : BPL .YQuarterVelocity 
    LDA.W #$FFC0 
    TSB.W $0D84 

.YQuarterVelocity:
    LDA.W $0D24 : STA.W $0D87 
    CLC 
    ROR.W $0D88 
    ROR.W $0D86 
    ROR.W $0D88 
    ROR.W $0D86 
    LDA.W $0D24 : BPL .loopSetup 
    LDA.W #$FFC0 
    TSB.W $0D88 

.loopSetup:
    LDA.W #$0004 : STA.W $0D8A 

.loop:
    LDA.W $0D0E : CLC : ADC.W $0D82 : STA.W $0D0E 
    LDA.W $0D10 : ADC.W $0D84 : STA.W $0D10 
    LDA.W $0D12 : CLC : ADC.W $0D86 : STA.W $0D12 
    LDA.W $0D14 : ADC.W $0D88 : STA.W $0D14 
    LDA.W $0AF8 : CLC : ADC.W $0D0E : STA.W $0D06 
    LDA.W $0AF6 : ADC.W $0D10 : CLC : ADC.W $0D02 : STA.W $0D08 
    LDA.W $0AFC : CLC : ADC.W $0D12 : STA.W $0D0A 
    LDA.W $0AFA : ADC.W $0D14 : CLC : ADC.W $0D04 : STA.W $0D0C 
    JSL.L BlockGrappleReaction 
    BVC .notConnected 
    BCC .notConnected 
    PHP 
    LDA.W $0D08 : AND.W #$FFF0 
    ORA.W #$0008 
    STA.W $0D08 
    LDA.W $0D0C : AND.W #$FFF0 
    ORA.W #$0008 
    STA.W $0D0C 
    PLP : PLB 
    RTL 


.notConnected:
    DEC.W $0D8A 
    BNE .loop 
    PLB 
    RTL 


BlockGrappleReaction:
    PHB : PHK : PLB 
    LDA.W $0D0C 
    LSR #4
    SEP #$20 
    STA.W $4202 
    LDA.W $07A5 : STA.W $4203 
    REP #$20 
    LDA.W $0D08 
    LSR #4
    CLC : ADC.W $4216 : STA.W $0DC4 
    ASL A 
    TAX 
    LDA.L $7F0002,X : AND.W #$F000 
    XBA 
    LSR #3
    TAX 
    JSR.W (BlockGrappleReaction_Pointers,X) 
    PLB 
    RTL 


CalculatePositionFromGrappleBeamEndWithDistanceAndAngle:
    LDX.W $0D82 
    LDA.W $0CF4 : BMI .grapplingEnemy 
    LDA.L SineCosineTables_8bitSine_SignExtended,X : BMI .angleLessThan80 
    LDA.W $0D08 : AND.W #$FFF0 
    ORA.W #$0008 
    BRA + 


.angleLessThan80:
    LDA.W $0D08 : AND.W #$FFF0 
    ORA.W #$0007 

  + STA.W $0D08 
    LDA.L SineCosineTables_NegativeCosine_SignExtended,X : BMI .notBetween40_C0 
    LDA.W $0D0C : AND.W #$FFF0 
    ORA.W #$0008 
    BRA .setEndPosition 


.notBetween40_C0:
    LDA.W $0D0C : AND.W #$FFF0 
    ORA.W #$0007 

.setEndPosition:
    STA.W $0D0C 

.grapplingEnemy:
    SEP #$20 
    LDA.W $0D84 : STA.W $4202 
    REP #$20 
    LDA.L SineCosineTables_8bitSine_SignExtended,X : BMI .negative 
    CMP.W #$0100 
    BNE .not100 
    LDA.W $0D08 : CLC : ADC.W $0D84 : BRA + 


.not100:
    SEP #$20 
    STA.W $4203 
    REP #$20 
    NOP #2
    LDA.W $4216 : AND.W #$FF00 
    XBA 
    CLC : ADC.W $0D08 : BRA + 


.negative:
    CMP.W #$FF00 
    BNE .notFF00 
    LDA.W $0D08 : SEC : SBC.W $0D84 : BRA + 


.notFF00:
    SEP #$20 
    EOR.B #$FF 
    INC A 
    STA.W $4203 
    REP #$20 
    NOP #2
    LDA.W $4216 : AND.W #$FF00 
    XBA 
    EOR.W #$FFFF 
    INC A 
    CLC : ADC.W $0D08 

  + STA.W $0D90 
    LSR #4
    AND.W #$00FF 
    STA.W $0D94 
    LDA.L SineCosineTables_NegativeCosine_SignExtended,X : BMI .negativeAgain 
    CMP.W #$0100 
    BNE .not100again 
    LDA.W $0D0C : CLC : ADC.W $0D84 : BRA + 


.not100again:
    SEP #$20 
    STA.W $4203 
    REP #$20 
    NOP #2
    LDA.W $4216 : AND.W #$FF00 
    XBA 
    CLC : ADC.W $0D0C : BRA + 


.negativeAgain:
    CMP.W #$FF00 
    BNE .notFF00again 
    LDA.W $0D0C : SEC : SBC.W $0D84 : BRA + 


.notFF00again:
    SEP #$20 
    EOR.B #$FF 
    INC A 
    STA.W $4203 
    REP #$20 
    NOP #2
    LDA.W $4216 : AND.W #$FF00 
    XBA 
    EOR.W #$FFFF 
    INC A 
    CLC : ADC.W $0D0C 

  + STA.W $0D92 
    LSR #4
    AND.W #$00FF 
    STA.W $0D96 
    RTS 


GrappleSwingCollisionReaction:
    SEP #$20 
    LDA.W $0D96 : STA.W $4202 
    LDA.W $07A5 : STA.W $4203 
    REP #$21 
    LDA.W $0D94 : ADC.W $4216 : STA.W $0DC4 
    ASL A 
    TAX 
    LDA.L $7F0002,X : AND.W #$F000 
    PHA : PHX 
    XBA 
    LSR #3
    TAX 
    JSR.W (GrappleSwingCollisionReaction_Pointers,X) 
    BCS .returnCollision 
    PLX : PLA 
    CLC 
    RTS 


.returnCollision:
    PLX : PLA 
    SEC 
    RTS 


CLCRTS_94AA9A:
    CLC 
    RTS 


SECRTS_94AA9C:
    SEC 
    RTS 


GrappleSwingCollisionReaction_SpikeAir:
    LDA.W $18A8 : BNE .return 
    LDX.W $0DC4 
    LDA.L $7F6402,X : BMI .return 
    ASL A 
    TAX 
    LDA.W .zeroes0,X 
    ORA.W .zeroes1,X 
    BEQ .return 
    LDA.W $0A4E : CLC : ADC.W .zeroes0,X : STA.W $0A4E 
    LDA.W $0A50 : ADC.W .zeroes1,X : STA.W $0A50 
    LDA.W #$003C : STA.W $18A8 
    LDA.W #$000A : STA.W $18AA 

.return:
    CLC 
    RTS 


.zeroes0:
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000 
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000 

.zeroes1:
    dw $0000,$0000,$0010,$0000,$0000,$0000,$0000,$0000 
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000 

GrappleSwingCollisionReaction_SpikeBlock:
    LDA.W $18A8 : BNE .return 
    LDX.W $0DC4 
    LDA.L $7F6402,X : BMI .return 
    ASL A 
    TAX 
    LDA.W .zeroes,X 
    ORA.W .damage,X 
    BEQ .return 
    LDA.W $0A4E : CLC : ADC.W .zeroes,X : STA.W $0A4E 
    LDA.W $0A50 : ADC.W .damage,X : STA.W $0A50 
    LDA.W #$003C : STA.W $18A8 
    LDA.W #$000A : STA.W $18AA 

.return:
    SEC 
    RTS 


.zeroes:
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000 
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000 

.damage:
    dw $003C,$0010,$0000,$0000,$0000,$0000,$0000,$0000 
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000 

GrappleSwingCollisionReaction_Pointers:
    dw CLCRTS_94AA9A 
    dw SECRTS_94AA9C 
    dw GrappleSwingCollisionReaction_SpikeAir 
    dw CLCRTS_94AA9A 
    dw CLCRTS_94AA9A 
    dw BlockShotBombedGrappledCollisionInsideReaction_HorizontalExt 
    dw CLCRTS_94AA9A 
    dw CLCRTS_94AA9A 
    dw SECRTS_94AA9C 
    dw SECRTS_94AA9C 
    dw GrappleSwingCollisionReaction_SpikeBlock 
    dw SECRTS_94AA9C 
    dw SECRTS_94AA9C 
    dw BlockShotBombedGrappledCollisionInsideReaction_VerticalExt 
    dw SECRTS_94AA9C 
    dw SECRTS_94AA9C 

GrappleSwingCollisionReaction_duplicate:
    SEP #$20 
    LDA.W $0D96 : STA.W $4202 
    LDA.W $07A5 : STA.W $4203 
    REP #$21 
    LDA.W $0D94 : ADC.W $4216 : STA.W $0DC4 
    ASL A 
    TAX 
    LDA.L $7F0002,X : AND.W #$F000 
    PHA : PHX 
    XBA 
    LSR #3
    TAX 
    JSR.W (GrappleSwingCollisionReaction_Pointers,X) 
    BCS .returnCollision 
    PLX : PLA 
    CLC 
    RTS 


.returnCollision:
    PLX : PLA 
    SEC 
    RTS 


GrappleSwingCollisionDetectionDueToSwinging:
    LDA.W #$0006 : STA.W $0D98 
    LDA.W #$0008 : CLC : ADC.W $0CFE : STA.W $0D84 

.loop:
    JSR.W CalculatePositionFromGrappleBeamEndWithDistanceAndAngle 
    JSR.W GrappleSwingCollisionReaction_duplicate 
    BCS .return 
    LDA.W $0D84 : CLC : ADC.W #$0008 : STA.W $0D84 
    DEC.W $0D98 
    BNE .loop 
    CLC 
    RTS 


.return:
    NOP ; >_<
    RTS 


UpdateGrappleBeamStartPositionDuringGrappleSwinging:
    LDA.W $0CFB : AND.W #$00FF 
    ASL A 
    STA.W $0D82 
    LDA.W $0CFE : STA.W $0D84 
    JSR.W CalculatePositionFromGrappleBeamEndWithDistanceAndAngle 
    LDA.W $0D90 : STA.W $0D16 
    LDA.W $0D92 : STA.W $0D18 
    RTL 


HandleGrappleBeamLengthChange:
    PHB : PHK : PLB 
    LDA.W $0D00 : BNE .nonZeroLengthDelta 
    JMP.W .returnCarryClear 


.nonZeroLengthDelta:
    BMI .positiveGrappleBeamLengthDelta 
    JMP.W .increaseLength 


.positiveGrappleBeamLengthDelta:
    LDA.W $0CFE : CLC : ADC.W $0D00 : CMP.W #$0008 
    BCS .greaterThanEqualTo8 
    STZ.W $0D00 
    LDA.W #$0008 

.greaterThanEqualTo8:
    STA.W $0D8C 
    LDA.W #$0008 : STA.W $0D8E 
    LDA.W $0CFB : AND.W #$00FF 
    ASL A 
    STA.W $0D82 
    LDA.W $0CFE 
    CMP.W $0D8C 
    BEQ .decreasedToTargetLength 

.decreaseLength:
    STA.W $0D8A 
    DEC A 
    CLC : ADC.W $0D8E : STA.W $0D84 
    JSR.W CalculatePositionFromGrappleBeamEndWithDistanceAndAngle 
    JSR.W GrappleSwingCollisionReaction 
    BCS .collision 
    DEC.W $0D8A 
    LDA.W $0D8A 
    CMP.W $0D8C 
    BNE .decreaseLength 

.decreasedToTargetLength:
    LDA.W $0D8C : STA.W $0CFE 
    PLB 
    CLC 
    RTL 


.collision:
    LDA.W $0D8A : STA.W $0CFE 
    PLB 
    SEC 
    RTL 


.increaseLength:
    LDA.W $0CFE : CLC : ADC.W $0D00 : CMP.W #$003F 
    BCC .lessThan3F 
    STZ.W $0D00 
    LDA.W #$003F 

.lessThan3F:
    STA.W $0D8C 
    LDA.W #$0038 : STA.W $0D8E 
    LDA.W $0CFB : AND.W #$00FF 
    ASL A 
    STA.W $0D82 
    LDA.W $0CFE 
    CMP.W $0D8C 
    BEQ .increasedToTargetLength 

.loopIncreaseLength:
    STA.W $0D8A 
    INC A 
    CLC : ADC.W $0D8E : STA.W $0D84 
    JSR.W CalculatePositionFromGrappleBeamEndWithDistanceAndAngle 
    JSR.W GrappleSwingCollisionReaction 
    BCS .collision 
    INC.W $0D8A 
    LDA.W $0D8A 
    CMP.W $0D8C 
    BNE .loopIncreaseLength 

.increasedToTargetLength:
    LDA.W $0D8C : STA.W $0CFE 
    PLB 
    CLC 
    RTL 

    LDA.W $0D8A ; dead code
    STA.W $0CFE 
    PLB 
    SEC 
    RTL 


.returnCarryClear:
    PLB 
    CLC 
    RTL 


HandleGrappleBeamSwingingMovement:
    PHB : PHK : PLB 
    LDY.W #$0100 
    LDA.W $0CF4 : BIT.W #$0001 
    BEQ .nonLiquidPhysics 
    LDY.W #$00A0 

.nonLiquidPhysics:
    LDA.W $0D26 : CLC : ADC.W $0D2E : BPL .preClockwise 
    EOR.W #$FFFF 
    INC A 
    JSL.L A_Y_16bit_UnsignedMultiplication 
    LDA.W $05F2 
    EOR.W #$FFFF 
    INC A 
    BEQ .gotoFailedMovement 
    STA.W $0D9C 
    JMP.W .anticlockwise 


.preClockwise:
    JSL.L A_Y_16bit_UnsignedMultiplication 
    LDA.W $05F2 : BEQ .gotoFailedMovement 
    STA.W $0D9C 
    BRA .clockwise 


.gotoFailedMovement:
    JMP.W .failedMovement 


.clockwise:
    CLC : ADC.W $0CFA : XBA 
    AND.W #$00FF 
    ASL A 
    STA.W $0D88 
    LDA.W $0CFE : STA.W $0D84 
    LDA.W $0CFB : AND.W #$00FF 
    ASL A 
    CMP.W $0D88 
    BEQ ..reachedTarget 

..loop:
    STA.W $0D86 
    INC #2
    AND.W #$01FF 
    STA.W $0D82 
    JSR.W GrappleSwingCollisionDetectionDueToSwinging 
    BCS ..collision 
    LDA.W $0D86 
    INC #2
    AND.W #$01FF 
    CMP.W $0D88 
    BNE ..loop 

..reachedTarget:
    LDA.W $0CFA : CLC : ADC.W $0D9C : STA.W $0CFA 
    STA.W $0CFC 
    LDA.W #$8000 
    TRB.W $0D36 
    DEC.W $0D30 
    BPL + 
    STZ.W $0D30 

  + LDA.W $0D2E : BPL + 
    CLC : ADC.W #$0006 : BPL ..zero 
    BRA ..returnCarryClear 


  + SEC : SBC.W #$0006 : BMI ..zero 
    BRA ..returnCarryClear 


..zero:
    LDA.W #$0000 

..returnCarryClear:
    STA.W $0D2E 
    PLB 
    CLC 
    RTL 


..collision:
    LDA.W $0D86 
    LSR A 
    AND.W #$00FF 
    XBA 
    ORA.W #$0080 
    STA.W $0CFA 
    STA.W $0CFC 
    LDA.W $0D98 
    CMP.W #$0006 
    BEQ ..noBounce 
    CMP.W #$0005 
    BNE ..bounce 

..noBounce:
    LDA.W $0CFE 
    CMP.W #$0008 
    BNE ..bounce 
    LDA.W #$8000 
    TSB.W $0D36 
    STZ.W $0D26 
    STZ.W $0D2E 
    PLB 
    SEC 
    RTL 


..bounce:
    LDA.W #$0010 : STA.W $0D30 
    LDA.W $0D26 
    ASL A 
    LDA.W $0D26 
    ROR A 
    EOR.W #$FFFF 
    INC A 
    STA.W $0D26 
    LDA.W $0D2E 
    ASL A 
    LDA.W $0D2E 
    ROR A 
    EOR.W #$FFFF 
    INC A 
    STA.W $0D2E 
    PLB 
    SEC 
    RTL 


.anticlockwise:
    CLC : ADC.W $0CFA : XBA 
    AND.W #$00FF 
    ASL A 
    STA.W $0D88 
    LDA.W $0CFE : STA.W $0D84 
    LDA.W $0CFB : AND.W #$00FF 
    ASL A 
    CMP.W $0D88 
    BEQ ..reachedTarget 

..loop:
    STA.W $0D86 
    DEC #2
    AND.W #$01FF 
    STA.W $0D82 
    JSR.W GrappleSwingCollisionDetectionDueToSwinging 
    BCS ..collision 
    LDA.W $0D86 
    DEC #2
    AND.W #$01FF 
    CMP.W $0D88 
    BNE ..loop 

..reachedTarget:
    LDA.W $0CFA : CLC : ADC.W $0D9C : STA.W $0CFA 
    STA.W $0CFC 
    LDA.W #$8000 
    TRB.W $0D36 
    DEC.W $0D30 
    BPL + 
    STZ.W $0D30 

  + LDA.W $0D2E : BPL + 
    CLC : ADC.W #$0006 : BPL ..zero 
    BRA ..returnCarryClear 


  + SEC : SBC.W #$0006 : BMI ..zero 
    BRA ..returnCarryClear 


..zero:
    LDA.W #$0000 

..returnCarryClear:
    STA.W $0D2E 
    PLB 
    CLC 
    RTL 


..collision:
    LDA.W $0D86 
    LSR A 
    AND.W #$00FF 
    XBA 
    ORA.W #$0080 
    STA.W $0CFA 
    STA.W $0CFC 
    LDA.W $0D98 
    CMP.W #$0006 
    BEQ + 
    CMP.W #$0005 
    BNE ..bounce 

  + LDA.W $0CFE 
    CMP.W #$0008 
    BNE ..bounce 
    LDA.W #$8000 
    TSB.W $0D36 
    STZ.W $0D26 
    STZ.W $0D2E 
    PLB 
    SEC 
    RTL 


..bounce:
    LDA.W #$0010 : STA.W $0D30 
    LDA.W $0D26 
    ASL A 
    LDA.W $0D26 
    ROR A 
    EOR.W #$FFFF 
    INC A 
    STA.W $0D26 
    LDA.W $0D2E 
    ASL A 
    LDA.W $0D2E 
    ROR A 
    EOR.W #$FFFF 
    INC A 
    STA.W $0D2E 
    PLB 
    SEC 
    RTL 


.failedMovement:
    PLB 
    CLC 
    RTL 

    LDA.W $0CFA ; dead code
    EOR.W $0D26 
    BMI ..rising 
    INC.W $0D38 
    LDA.W $0D38 
    CMP.W #$0020 
    BNE ..lessThan20 
    LDA.W #GrappleBeamFunction_Dropped : STA.W $0D32 

..lessThan20:
    STZ.W $0D26 
    STZ.W $0D2E 
    PLB 
    SEC 
    RTL 


..rising:
    STZ.W $0D38 
    PLB 
    SEC 
    RTL 


CLCRTL_94AF0B:
    CLC 
    RTL 

    PHB ; dead code
    PHK : PLB 
    LDA.W $0D08 
    LSR #4
    AND.W #$00FF 
    XBA 
    STA.W $0D94 
    LDA.W $0D0C 
    LSR #4
    AND.W #$00FF 
    XBA 
    STA.W $0D96 
    LDA.W $0CFE 
    LSR #4
    STA.W $0D98 

.loop:
    LDA.L SineCosineTables_NegativeCosine_SignExtended,X : CLC : ADC.W $0D96 : STA.W $0D96 
    XBA 
    SEP #$20 
    STA.W $4202 
    LDA.W $07A5 : STA.W $4203 
    REP #$21 
    LDA.L SineCosineTables_8bitSine_SignExtended,X : ADC.W $0D94 : STA.W $0D94 
    AND.W #$FF00 
    XBA 
    ADC.W $4216 : STA.W $0DC4 
    ASL A 
    TAX 
    LDA.L $7F0002,X : AND.W #$F000 
    XBA 
    LSR #3
    TAX 
    JSR.W (GrappleSwingCollisionReaction_Pointers,X) 
    BCS + 
    DEC.W $0D98 
    BPL .loop 
    PLB 
    CLC 
    RTL 


  + LDA.W #GrappleBeamFunction_Dropped : STA.W $0D32 
    PLB 
    SEC 
    RTL 


InitializeGrappleSegmentAnimations:
    LDX.W #$001E 

.loop:
    LDA.W #InstList_DrawGrappleBeam_GrappleSegmentAnimations_3 : STA.W $0D62,X 
    LDA.W #InstList_DrawGrappleBeam_GrappleSegmentAnimations_2 : STA.W $0D60,X 
    LDA.W #InstList_DrawGrappleBeam_GrappleSegmentAnimations_1 : STA.W $0D5E,X 
    LDA.W #InstList_DrawGrappleBeam_GrappleSegmentAnimations_0 : STA.W $0D5C,X 
    LDA.W #$0001 : STA.W $0D42,X 
    STA.W $0D40,X 
    STA.W $0D3E,X 
    STA.W $0D3C,X 
    TXA 
    SEC : SBC.W #$0008 : TAX 
    BPL .loop 
    RTL 


DrawGrappleBeam:
    PHB : PHK : PLB 
    LDA.W $0D08 : SEC : SBC.W $0D1A : STA.B $12 
    LDA.W $0D0C : SEC : SBC.W $0D1C : STA.B $14 
    JSL.L CalculateAngleOf_12_14_Offset 
    ASL A 
    TAX 
    STZ.B $1A 
    STZ.B $1C 
    LDA.L SineCosineTables_8bitSine_SignExtended,X 
    ASL #3
    BPL + 
    DEC.B $1C 

  + STA.B $1B 
    STZ.B $1E 
    STZ.B $20 
    LDA.L SineCosineTables_NegativeCosine_SignExtended,X 
    ASL #3
    BPL + 
    DEC.B $20 

  + STA.B $1F 
    LDA.W $0CFA : AND.W #$8000 
    LSR A 
    STA.B $26 
    EOR.W $0CFA 
    AND.W #$4000 
    EOR.W #$4000 
    ASL A 
    ORA.B $26 
    STA.B $26 
    LDA.W $0D1A : SEC : SBC.W $0911 : SEC : SBC.W #$0004 : STA.B $14 
    STZ.B $12 
    LDA.W $0D1C : SEC : SBC.W $0915 : SEC : SBC.W #$0004 : STA.B $18 
    STZ.B $16 
    LDA.W $0CFE : BMI .return 
    STA.W $4204 
    SEP #$20 
    LDA.B #$08 : STA.W $4206 
    REP #$20 
    NOP #6
    LDA.W $4214 : BMI .return 
    AND.W #$000F 
    SEC : SBC.W #$0001 : STA.B $28 
    LDX.W #$001E 

.loopAnimations:
    DEC.W $0D42,X 
    BNE .processedInstructions 
    LDY.W $0D62,X 

.loopInstructions:
    LDA.W $0000,Y : BPL .notInstruction 
    STA.B $24 
    PEA.W .loopInstructions-1 
    INY #2
    JMP.W ($0024) 


.notInstruction:
    STA.W $0D42,X 
    TYA 
    CLC : ADC.W #$0004 : STA.W $0D62,X 

.processedInstructions:
    LDA.B $14 
    ORA.B $18 
    AND.W #$FF00 
    BNE + 
    PHX 
    LDY.W $0D62,X 
    DEY #2
    LDA.W $0000,Y 
    TAY 
    JSR.W DrawGrappleSegment 
    PLX 
    DEX #2
    DEC.B $28 
    BPL .loopAnimations 

  + LDA.W $0A1C 
    CMP.W #$00B2 
    BEQ .connectedEnd 
    CMP.W #$00B3 
    BEQ .connectedEnd 
    JSR.W DrawGrappleBeamEnd_NotConnected 
    BRA .return 


.connectedEnd:
    JSR.W DrawGrappleBeamEnd_Connected 

.return:
    PLB 
    RTL 


DrawGrappleSegment:
    LDX.W $0590 
    CLC 
    LDA.B $14 : STA.W $0370,X 
    LDA.B $12 : CLC : ADC.B $1A : STA.B $12 
    LDA.B $14 : ADC.B $1C : STA.B $14 
    AND.W #$0100 
    BRA + 

    LDA.L MapOfOAMIndexToHighOAM_address,X ; dead code
    STA.B $22 
    LDA.B ($22) : ORA.L MapOfOAMIndex_highXPosBit,X : STA.B ($22) 

  + LDA.B $18 : STA.W $0371,X 
    LDA.B $16 : CLC : ADC.B $1E : STA.B $16 
    LDA.B $18 : ADC.B $20 : STA.B $18 
    TYA 
    ORA.B $26 
    STA.W $0372,X 
    TXA 
    CLC : ADC.W #$0004 : STA.W $0590 
    RTS 


Instruction_DrawGrappleBeam_GotoY:
    LDA.W $0000,Y 
    TAY 
    RTS 


DrawGrappleBeamEnd_NotConnected:
    LDA.W $0D0C : SEC : SBC.W $0915 : BIT.W #$FF00 
    BNE .return 
    LDX.W $0590 
    CLC 
    LDA.B $14 
    LDA.W $0D08 : SEC : SBC.W $0911 : SEC : SBC.W #$0004 : STA.W $0370,X 
    AND.W #$0100 
    BEQ + 
    LDA.L MapOfOAMIndexToHighOAM_address,X : STA.B $22 
    LDA.B ($22) : ORA.L MapOfOAMIndex_highXPosBit,X : STA.B ($22) 

  + LDA.B $18 ; >_<
    LDA.W $0D0C : SEC : SBC.W $0915 : SEC : SBC.W #$0004 : STA.W $0371,X 
    LDA.W #$3A20 : STA.W $0372,X 
    TXA 
    CLC : ADC.W #$0004 : STA.W $0590 

.return:
    RTS 


DrawGrappleBeamEnd_Connected:
    LDX.W $0590 
    CLC 
    LDA.W $0D08 : SEC : SBC.W $0911 : SBC.W #$0004 : STA.W $0370,X 
    AND.W #$0100 
    BEQ + 
    LDA.L MapOfOAMIndexToHighOAM_address,X : STA.B $22 
    LDA.B ($22) : ORA.L MapOfOAMIndex_highXPosBit,X : STA.B ($22) 

  + LDA.W $0D0C : SEC : SBC.W $0915 : SBC.W #$0004 : STA.W $0371,X 
    LDA.W #$3A20 : STA.W $0372,X 
    TXA 
    CLC : ADC.W #$0004 : STA.W $0590 
    RTS 


InstList_DrawGrappleBeam_GrappleSegmentAnimations_0:
    dw $0005,$3A21 

InstList_DrawGrappleBeam_GrappleSegmentAnimations_1:
    dw $0005,$3A22 

InstList_DrawGrappleBeam_GrappleSegmentAnimations_2:
    dw $0005,$3A23 

InstList_DrawGrappleBeam_GrappleSegmentAnimations_3:
    dw $0005,$3A24 
    dw Instruction_DrawGrappleBeam_GotoY 
    dw InstList_DrawGrappleBeam_GrappleSegmentAnimations_0 


Freespace_Bank94_B19F: 
; $1661 bytes


warnpc $94C800
org $94C800

Tiles_GunshipLiftoffDustClouds:
incbin "../data/Tiles_GunshipLiftoffDustClouds.bin" ; $1400 bytes

Freespace_Bank94_DC00: 
; $1400 bytes


warnpc $94E000
; see bank_94..99.asm
