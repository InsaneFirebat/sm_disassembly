
org $948000


;;; $8000: Post grapple collision detection - horizontal - slope - non-square ;;;
PostGrappleCollisionDetection_Horizontal_Slope_NonSquare:
;; Parameters:
;;     X: Block index
;;     $20: Samus left/right boundary
;; Returns:
;;     Carry: Set if Samus collides with slope, clear otherwise
;;     A: If carry set, X depth into slope in pixels
    LDA.W CollisionMovementDirection : LSR : BCC .left
    JMP .right

  .left:
    LDA.W CurrentBlockIndex : STA.W $4204
    SEP #$20
    LDA.W RoomWidthBlocks : STA.W $4206
    REP #$20
    LDA.W SamusXPosition : LSR #4 : CMP.W $4216 : BEQ ..centerInBlock
    CLC
    RTS

  ..centerInBlock:
    LDA.B DP_Temp20 : AND.W #$000F : STA.W SamusLeftRightXOffset
    LDA.L BTS,X : AND.W #$001F : ASL #4 : STA.W SlopeCollisionDefinitionTableBaseIndex
    LDA.L BTS-1,X : ASL : BPL ..gotoSolid
    LDA.L BTS-1,X : BMI ..blockBTSMSB
    LDA.W SamusYPosition
    BRA +

  ..blockBTSMSB:
    LDA.W SamusYPosition : EOR.W #$000F

+   AND.W #$000F : CLC : ADC.W SlopeCollisionDefinitionTableBaseIndex : TAX
    LDA.W SlopeDefinitions_SlopeLeftXOffsetByYPixel,X : AND.W #$001F
    SEC : SBC.W SamusLeftRightXOffset : DEC : BEQ ..returnCarrySet
    BMI ..returnCarryClear

  ..returnCarrySet:
    SEC
    RTS

  ..returnCarryClear:
    CLC
    RTS

  ..gotoSolid:
    JMP PostGrappleCollisionDetection_Horizontal_Solid

  .right:
    LDA.W CurrentBlockIndex : STA.W $4204
    SEP #$20
    LDA.W RoomWidthBlocks : STA.W $4206
    REP #$20
    LDA.W SamusXPosition : LSR #4 : CMP.W $4216 : BEQ ..centerInBlock
    CLC
    RTS

  ..centerInBlock:
    LDA.B DP_Temp20 : AND.W #$000F : STA.W SamusLeftRightXOffset
    LDA.L BTS,X : AND.W #$001F : ASL #4 : STA.W SlopeCollisionDefinitionTableBaseIndex
    LDA.L BTS-1,X : ASL : BMI ..gotoSolid
    LDA.L BTS-1,X : BMI ..blockBTSMSB
    LDA.W SamusYPosition
    BRA +

  ..blockBTSMSB:
    LDA.W SamusYPosition : EOR.W #$000F

+   AND.W #$000F : CLC : ADC.W SlopeCollisionDefinitionTableBaseIndex : TAX
    LDA.W SlopeDefinitions_SlopeLeftXOffsetByYPixel,X : AND.W #$001F
    SEC : SBC.W SamusLeftRightXOffset : DEC : BEQ +
    BPL ..returnCarryClear

+   EOR.W #$FFFF
    SEC
    RTS

  ..returnCarryClear:
    CLC
    RTS

  ..gotoSolid:
    JMP PostGrappleCollisionDetection_Horizontal_Solid


;;; $80E0: Post grapple collision detection - vertical - slope - non-square ;;;
PostGrappleCollisionDetection_Vertical_Slope_NonSquare:
;; Parameters:
;;     X: Block index
;;     $20: Samus bottom/top boundary
;; Returns:
;;     Carry: Set if Samus collides with slope, clear otherwise
;;     A: If carry set, Y depth into slope in pixels
    LDA.W CollisionMovementDirection : LSR : BCC .up
    JMP .down

  .up:
    LDA.W CurrentBlockIndex : STA.W $4204
    SEP #$20
    LDA.W RoomWidthBlocks : STA.W $4206
    REP #$20
    LDA.W SamusXPosition
    LSR #4
    CMP.W $4216
    BEQ ..centerInBlock
    CLC
    RTS

  ..centerInBlock:
    LDA.B $20
    AND.W #$000F
    STA.W SamusBottomTopYOffset
    LDA.L BTS,X
    AND.W #$001F
    ASL #4
    STA.W SlopeCollisionDefinitionTableBaseIndex
    LDA.L BTS-1,X
    BPL ..gotoSolid
    ASL
    BMI ..blockBTS40
    LDA.W SamusXPosition
    BRA +

  ..blockBTS40:
    LDA.W SamusXPosition
    EOR.W #$000F

+   AND.W #$000F
    CLC
    ADC.W SlopeCollisionDefinitionTableBaseIndex
    TAX
    LDA.W SlopeDefinitions_SlopeTopXOffsetByYPixel,X
    AND.W #$001F
    SEC
    SBC.W SamusBottomTopYOffset
    DEC
    BEQ ..returnCarrySet
    BMI ..returnCarryClear

  ..returnCarrySet:
    SEC
    RTS

  ..returnCarryClear:
    CLC
    RTS

  ..gotoSolid:
    JMP PostGrappleCollisionDetection_Vertical_Solid

  .down:
    LDA.W CurrentBlockIndex
    STA.W $4204
    SEP #$20
    LDA.W RoomWidthBlocks
    STA.W $4206
    REP #$20
    LDA.W SamusXPosition
    LSR #4
    CMP.W $4216
    BEQ ..centerInBlock
    CLC
    RTS

  ..centerInBlock:
    LDA.B $20
    AND.W #$000F
    STA.W SamusBottomTopYOffset
    LDA.L BTS,X : AND.W #$001F : ASL #4 : STA.W SlopeCollisionDefinitionTableBaseIndex
    LDA.L BTS-1,X : BMI ..gotoSolid
    ASL : BMI ..blockBTS40
    LDA.W SamusXPosition
    BRA +

  ..blockBTS40:
    LDA.W SamusXPosition : EOR.W #$000F

+   AND.W #$000F : CLC : ADC.W SlopeCollisionDefinitionTableBaseIndex : TAX
    LDA.W SlopeDefinitions_SlopeTopXOffsetByYPixel,X : AND.W #$001F
    SEC : SBC.W SamusBottomTopYOffset : DEC : BEQ +
    BPL ..returnCarryClear

+   EOR.W #$FFFF
    SEC
    RTS

  ..returnCarryClear:
    CLC
    RTS

  ..gotoSolid:
    JMP PostGrappleCollisionDetection_Vertical_Solid


;;; $81B8: Post grapple collision detection - horizontal - slope - square ;;;
PostGrappleCollisionDetection_Horizontal_Slope_Square:
;; Parameters:
;;     X: Block index
;;     $1A: Number of blocks left to check (0 if final (bottom) block)
;;     $1C: Samus' Y block span
;;     $20: Samus left/right boundary
;; Returns:
;;     Carry: Set if Samus collides with solid slope, clear otherwise
;;     A: If carry set, X depth into slope in pixels
    LDA.L BTS,X
    AND.W #$001F
    ASL #2
    STA.W SolidSlopeDefinitionTableBaseIndex
    LDA.L BTS-1,X : ROL #3 : AND.W #$0003 : STA.W SlopeCollisionFlipFlags
    LDA.B DP_Temp20 : AND.W #$0008 : LSR #3 : EOR.W SlopeCollisionFlipFlags
    ADC.W SolidSlopeDefinitionTableBaseIndex : TAX
    LDA.B DP_Temp1A : BNE .top
    LDA.W SamusYPosition : CLC : ADC.W SamusYRadius
    DEC : AND.W #$0008 : BNE .checkBothHalves
    LDA.W SquareSlopeDefinitions_Bank94-1,X : BMI .solid
    BRA .noCollision

  .top:
    CMP.B DP_Temp1C : BNE .checkBothHalves
    LDA.W SamusYPosition : SEC : SBC.W SamusYRadius : AND.W #$0008 : BNE .checkBottomHalf

  .checkBothHalves:
    LDA.W SquareSlopeDefinitions_Bank94-1,X : BMI .solid

  .checkBottomHalf:
    TXA : EOR.W #$0002 : TAX
    LDA.W SquareSlopeDefinitions_Bank94-1,X : BMI .solid

  .noCollision:
    CLC
    RTS

  .solid:
    LDA.W CollisionMovementDirection : LSR : BCC .left
    LDA.B DP_Temp20 : AND.W #$0007
    SEC
    RTS

  .left:
    LDA.B DP_Temp20 : AND.W #$0007 : EOR.W #$0007
    SEC
    RTS


;;; $8230: Post grapple collision detection - vertical - slope - square ;;;
PostGrappleCollisionDetection_Vertical_Slope_Square:
;; Parameters:
;;     X: Block index
;;     $1A: Number of blocks left to check (0 if final (rightmost) block)
;;     $1C: Samus' X block span
;;     $20: Samus bottom/top boundary
;; Returns:
;;     Carry: Set if Samus collides with solid slope, clear otherwise
;;     A: If carry set, Y depth into slope in pixels
    LDA.L BTS,X : AND.W #$001F : ASL #2 : STA.W SolidSlopeDefinitionTableBaseIndex
    LDA.L BTS-1,X : ROL #3 : AND.W #$0003 : STA.W SlopeCollisionFlipFlags
    LDA.B DP_Temp20 : AND.W #$0008 : LSR #2
    EOR.W SlopeCollisionFlipFlags : ADC.W SolidSlopeDefinitionTableBaseIndex : TAX
    LDA.B DP_Temp1A : BNE .leftmostBlock
    LDA.W SamusXPosition : CLC : ADC.W SamusXRadius
    DEC : AND.W #$0008 : BNE .checkBothHalves
    LDA.W SquareSlopeDefinitions_Bank94-1,X : BMI .solid
    BRA .returnNoCollision

  .leftmostBlock:
    CMP.B DP_Temp1C : BNE .checkBothHalves
    LDA.W SamusXPosition : SEC : SBC.W SamusXRadius : AND.W #$0008
    BNE .right

  .checkBothHalves:
    LDA.W SquareSlopeDefinitions_Bank94-1,X : BMI .solid

  .right:
    TXA : EOR.W #$0001 : TAX
    LDA.W SquareSlopeDefinitions_Bank94-1,X : BMI .solid

  .returnNoCollision:
    CLC
    RTS

  .solid:
    LDA.W CollisionMovementDirection : LSR : BCC .up
    LDA.B DP_Temp20 : AND.W #$0007
    SEC
    RTS

  .up:
    LDA.B DP_Temp20 : AND.W #$0007 : EOR.W #$0007 : SEC
    RTS


;;; $82A7: Clear carry ;;;
CLCRTS_9482A7:
    CLC
    RTS


;;; $82A9: Post grapple collision detection - horizontal - slope ;;;
PostGrappleCollisionDetection_Horizontal_Slope:
;; Parameters:
;;     $1A: Number of blocks left to check (0 if final (bottom) block)
;;     $1C: Samus' Y block span
;;     $20: Samus left/right boundary
;; Returns:
;;     Carry: Set if Samus collides with slope, clear otherwise
;;     A: If carry set, X depth into slope in pixels
    LDX.W CurrentBlockIndex
    LDA.L BTS,X : AND.W #$001F : CMP.W #$0005 : BCC .gotoSquare
    JMP PostGrappleCollisionDetection_Horizontal_Slope_NonSquare

  .gotoSquare:
    JMP PostGrappleCollisionDetection_Horizontal_Slope_Square


;;; $82BE: Post grapple collision detection - horizontal - solid ;;;
PostGrappleCollisionDetection_Horizontal_Solid:
;; Parameters:
;;     $20: Samus left/right boundary
;; Returns:
;;     Carry: Set (Samus collides with block)
;;     A: X depth into block in pixels
    LDA.B $20 : AND.W #$000F
    SEC
    RTS


;;; $82C5: Post grapple collision detection - vertical - slope ;;;
PostGrappleCollisionDetection_Vertical_Slope:
;; Parameters:
;;     $1A: Number of blocks left to check (0 if final (rightmost) block)
;;     $1C: Samus' X block span
;;     $20: Samus bottom/top boundary
;; Returns:
;;     Carry: Set if Samus collides with slope, clear otherwise
;;     A: If carry set, Y depth into slope in pixels
    LDX.W CurrentBlockIndex
    LDA.L BTS,X : AND.W #$001F : CMP.W #$0005 : BCC .gotoSquare
    JMP PostGrappleCollisionDetection_Vertical_Slope_NonSquare

  .gotoSquare:
    JMP PostGrappleCollisionDetection_Vertical_Slope_Square


;;; $82DA: Post grapple collision detection - vertical - solid ;;;
PostGrappleCollisionDetection_Vertical_Solid:
;; Parameters:
;;     $20: Samus bottom/top boundary
;; Returns:
;;     Carry: Set (Samus collides with block)
;;     A: Y depth into block in pixels
    LDA.B $20 : AND.W #$000F
    SEC
    RTS


;;; $82E1: Post grapple collision detection - horizontal - jump table ;;;
PostGrappleCollisionDetection_Horizontal_JumpTable:
    dw CLCRTS_9482A7                                                     ;  0: Air
    dw PostGrappleCollisionDetection_Horizontal_Slope                    ; *1: Slope
    dw CLCRTS_9482A7                                                     ;  2: Spike air
    dw CLCRTS_9482A7                                                     ;  3: Special air
    dw CLCRTS_9482A7                                                     ;  4: Shootable air
    dw CLCRTS_9482A7                                                     ;  5: Horizontal extension
    dw CLCRTS_9482A7                                                     ;  6: Unused air
    dw CLCRTS_9482A7                                                     ;  7: Bombable air
    dw PostGrappleCollisionDetection_Horizontal_Solid                    ;  8: Solid block
    dw PostGrappleCollisionDetection_Horizontal_Solid                    ;  9: Door block
    dw PostGrappleCollisionDetection_Horizontal_Solid                    ;  Ah: Spike block
    dw PostGrappleCollisionDetection_Horizontal_Solid                    ;  Bh: Special block
    dw PostGrappleCollisionDetection_Horizontal_Solid                    ;  Ch: Shootable block
    dw PostGrappleCollisionDetection_Horizontal_Solid                    ;  Dh: Vertical extension
    dw PostGrappleCollisionDetection_Horizontal_Solid                    ;  Eh: Grapple block
    dw PostGrappleCollisionDetection_Horizontal_Solid                    ;  Fh: Bombable block


;;; $8301: Post grapple collision detection - vertical - jump table ;;;
PostGrappleCollisionDetection_Vertical_JumpTable:
    dw CLCRTS_9482A7                                                     ;  0: Air
    dw PostGrappleCollisionDetection_Vertical_Slope                      ; *1: Slope
    dw CLCRTS_9482A7                                                     ;  2: Spike air
    dw CLCRTS_9482A7                                                     ;  3: Special air
    dw CLCRTS_9482A7                                                     ;  4: Shootable air
    dw CLCRTS_9482A7                                                     ;  5: Horizontal extension
    dw CLCRTS_9482A7                                                     ;  6: Unused air
    dw CLCRTS_9482A7                                                     ;  7: Bombable air
    dw PostGrappleCollisionDetection_Vertical_Solid                      ;  8: Solid block
    dw PostGrappleCollisionDetection_Vertical_Solid                      ;  9: Door block
    dw PostGrappleCollisionDetection_Vertical_Solid                      ;  Ah: Spike block
    dw PostGrappleCollisionDetection_Vertical_Solid                      ;  Bh: Special block
    dw PostGrappleCollisionDetection_Vertical_Solid                      ;  Ch: Shootable block
    dw PostGrappleCollisionDetection_Vertical_Solid                      ;  Dh: Vertical extension
    dw PostGrappleCollisionDetection_Vertical_Solid                      ;  Eh: Grapple block
    dw PostGrappleCollisionDetection_Vertical_Solid                      ;  Fh: Bombable block


;;; $8321: Post grapple collision detection - horizontal - single block ;;;
PostGrappleCollisionDetection_Horizontal_SingleBlock:
;; Parameters:
;;     X: Block index
;;     $1A: Number of blocks left to check (0 if final (bottom) block)
;;     $1C: Samus Y block span
;;     $20: Samus left/right boundary
;; Returns:
;;     Carry: Set if Samus collides with block, clear otherwise
;;     A: If carry set, X depth into block in pixels
    PHX
    TXA : LSR : STA.W CurrentBlockIndex
    LDA.L LevelData,X : AND.W #$F000 : XBA : LSR #3 : TAX
    JSR.W (PostGrappleCollisionDetection_Horizontal_JumpTable,X)
    PLX
    RTS


;;; $8338: Post grapple collision detection - vertical - single block ;;;
PostGrappleCollisionDetection_Vertical_SingleBlock:
;; Parameters:
;;     X: Block index
;;     $1A: Number of blocks left to check (0 if final (rightmost) block)
;;     $1C: Samus' X block span
;;     $20: Samus bottom/top boundary
;; Returns:
;;     Carry: Set if Samus collides with block, clear otherwise
;;     A: If carry set, Y depth into block in pixels
    PHX
    TXA : LSR : STA.W CurrentBlockIndex
    LDA.L LevelData,X : AND.W #$F000 : XBA : LSR #3 : TAX
    JSR.W (PostGrappleCollisionDetection_Vertical_JumpTable,X)
    PLX
    RTS


;;; $834F: Post grapple collision detection - rightwards ;;;
PostGrappleCollisionDetection_Rightwards:
    PHB
    PHK : PLB
    LDA.W #$0001 : STA.W CollisionMovementDirection
    STZ.W DistanceToEjectSamusLeftDueToPostGrappleCollision
    JSR CalculateSamusYBlockSpan
    LDA.W SamusYPosition : SEC : SBC.W SamusYRadius : LSR #4
    SEP #$20
    STA.W $4202
    LDA.W RoomWidthBlocks : STA.W $4203
    REP #$20
    LDA.W SamusXSubPosition : STA.B DP_Temp16
    LDA.W SamusXPosition : STA.B DP_Temp18
    CLC : ADC.W SamusXRadius : DEC : STA.B DP_Temp20
    LSR #4 : CLC : ADC.W $4216 : STA.W CurrentBlockIndex
    ASL : TAX

  .loop:
    JSR PostGrappleCollisionDetection_Horizontal_SingleBlock
    BCC .noCollision
    INC : CMP.W DistanceToEjectSamusLeftDueToPostGrappleCollision : BCC .noCollision
    STA.W DistanceToEjectSamusLeftDueToPostGrappleCollision

  .noCollision:
    TXA : CLC : ADC.W RoomWidthBlocks : ADC.W RoomWidthBlocks : TAX
    DEC.B DP_Temp1A : BPL .loop
    PLB
    RTS


;;; $83B1: Post grapple collision detection - leftwards ;;;
PostGrappleCollisionDetection_Leftwards:
    PHB
    PHK : PLB
    STZ.W CollisionMovementDirection : STZ.W DistanceToEjectSamusRightDueToPostGrappleCollision
    JSR CalculateSamusYBlockSpan
    LDA.W SamusYPosition : SEC : SBC.W SamusYRadius : LSR #4
    SEP #$20
    STA.W $4202
    LDA.W RoomWidthBlocks : STA.W $4203
    REP #$20
    LDA.W SamusXSubPosition : STA.B DP_Temp16
    LDA.W SamusXPosition : STA.B DP_Temp18
    SEC : SBC.W SamusXRadius : STA.B DP_Temp20
    LSR #4 : CLC : ADC.W $4216 : STA.W CurrentBlockIndex
    ASL : TAX

  .loop:
    JSR PostGrappleCollisionDetection_Horizontal_SingleBlock
    BCC .noCollision
    INC : CMP.W DistanceToEjectSamusRightDueToPostGrappleCollision : BCC .noCollision
    STA.W DistanceToEjectSamusRightDueToPostGrappleCollision

  .noCollision:
    TXA : CLC : ADC.W RoomWidthBlocks : ADC.W RoomWidthBlocks : TAX
    DEC.B DP_Temp1A : BPL .loop
    PLB
    RTS


;;; $840F: Post grapple collision detection - downwards ;;;
PostGrappleCollisionDetection_Downwards:
    PHB
    PHK : PLB
    LDA.W #$0003 : STA.W CollisionMovementDirection
    STZ.W DistanceToEjectSamusUpDueToPostGrappleCollision
    JSR CalculateSamusXBlockSpan
    LDA.W SamusYSubPosition : STA.B DP_Temp16
    LDA.W SamusYPosition : STA.B DP_Temp18
    CLC : ADC.W SamusYRadius : DEC : STA.B DP_Temp20
    LSR #4
    SEP #$20
    STA.W $4202
    LDA.W RoomWidthBlocks : STA.W $4203
    REP #$20
    LDA.W SamusXPosition : SEC : SBC.W SamusXRadius
    LSR #4 : CLC : ADC.W $4216 : STA.W CurrentBlockIndex
    ASL : TAX

  .loop:
    JSR PostGrappleCollisionDetection_Vertical_SingleBlock
    BCC .nocollision
    INC : CMP.W DistanceToEjectSamusUpDueToPostGrappleCollision : BCC .nocollision
    STA.W DistanceToEjectSamusUpDueToPostGrappleCollision

  .nocollision:
    INX #2
    DEC.B DP_Temp1A : BPL .loop
    PLB
    RTS


;;; $846A: Post grapple collision detection - upwards ;;;
PostGrappleCollisionDetection_Upwards:
    PHB
    PHK : PLB
    LDA.W #$0002 : STA.W CollisionMovementDirection
    STZ.W DistanceToEjectSamusDownDueToPostGrappleCollision
    JSR CalculateSamusXBlockSpan
    LDA.W SamusYSubPosition : STA.B DP_Temp16
    LDA.W SamusYPosition : STA.B DP_Temp18
    SEC : SBC.W SamusYRadius : STA.B DP_Temp20
    LSR #4
    SEP #$20
    STA.W $4202
    LDA.W RoomWidthBlocks : STA.W $4203
    REP #$20
    LDA.W SamusXPosition : SEC : SBC.W SamusXRadius : LSR #4
    CLC : ADC.W $4216 : STA.W CurrentBlockIndex
    ASL : TAX

  .loop:
    JSR PostGrappleCollisionDetection_Vertical_SingleBlock
    BCC .noCollision
    INC : CMP.W DistanceToEjectSamusDownDueToPostGrappleCollision : BCC .noCollision
    STA.W DistanceToEjectSamusDownDueToPostGrappleCollision

  .noCollision:
    INX #2
    DEC.B DP_Temp1A : BPL .loop
    PLB
    RTS


;;; $84C4: Post grapple collision detection - horizontal ;;;
PostGrappleCollisionDetection_Horizontal:
; Called by PostGrappleCollisionDetection
; This routine is used to calculate $0E04/06 (distance to eject Samus left/right), which is never read,
; making this routine and all its subroutines entirely pointless
    PHP
    JSR PostGrappleCollisionDetection_Rightwards
    JSR PostGrappleCollisionDetection_Leftwards
    PLP
    RTL


;;; $84CD: Post grapple collision detection - vertical ;;;
PostGrappleCollisionDetection_Vertical:
; Called by PostGrappleCollisionDetection, sometimes twice (if Samus was ejected up and her hitbox is >= 10h pixels tall)
    PHP
    JSR PostGrappleCollisionDetection_Downwards
    JSR PostGrappleCollisionDetection_Upwards
    PLP
    RTL


;;; $84D6: Samus block collision reaction - horizontal - slope - non-square ;;;
SamusBlockCollisionDetection_Horizontal_Slope_NonSquare:
;; Parameters:
;;     $12.$14: Distance to check for collision
;; Returns:
;;     Carry: Clear (no collision)
;;     $12.$14: Adjusted distance to move Samus
    LDA.W CurrentSlopeBTS : BIT.W #$0080 : BNE .returnNoCollision
    LDA.W SamusYSubSpeed : ORA.W SamusYSpeed : BEQ .SamusOnSlopeSurface

  .returnNoCollision:
    CLC
    RTS

  .SamusOnSlopeSurface:
    LDA.W CurrentSlopeBTS : AND.W #$001F : ASL #2 : TAX
    LDA.B DP_Temp12 : BPL .right
    LDA.W SamusXBaseSubSpeed : ORA.W SamusXBaseSpeed : BEQ .backToReality
    LDA.W CurrentSlopeBTS : BIT.W #$0040 : BNE +
    LDA.W SamusXBaseSubSpeed : CLC : ADC.W .speedModifiers,X : BCC .backToReality
    BRA .backToReality

+   LDA.W SamusXBaseSubSpeed : SEC : SBC.W .speedModifiers,X : BCS .backToReality ; >.<

  .backToReality:
    SEP #$20
    LDA.B DP_Temp12 : XBA : LDA.B DP_Temp15
    REP #$20
    EOR.W #$FFFF : INC
    LDY.W .adjustedDistanceMultiplier,X
    JSL A_Y_16bit_UnsignedMultiplication
    LDA.W MultiplicationResult : EOR.W #$FFFF : CLC : ADC.W #$0001 : STA.B DP_Temp14
    LDA.W MultiplicationResult+2 : EOR.W #$FFFF : ADC.W #$0000 : STA.B DP_Temp12
    CLC
    RTS

  .right:
    LDA.W SamusXBaseSubSpeed : ORA.W SamusXBaseSpeed : BEQ ..backToReality
    LDA.W CurrentSlopeBTS : BIT.W #$0040 : BEQ +
    LDA.W SamusXBaseSubSpeed : CLC : ADC.W .speedModifiers,X : BCC ..backToReality
    BRA ..backToReality

+   LDA.W SamusXBaseSubSpeed : SEC : SBC.W .speedModifiers,X : BCS ..backToReality

  ..backToReality:
    SEP #$20
    LDA.B DP_Temp12 : XBA : LDA.B DP_Temp15
    REP #$20
    LDY.W .adjustedDistanceMultiplier,X
    JSL A_Y_16bit_UnsignedMultiplication
    LDA.W MultiplicationResult : STA.B DP_Temp14
    LDA.W MultiplicationResult+2 : STA.B DP_Temp12
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
;;; $8606: Unused ;;;
UNUSED_948606:
;; Parameters:
;;     X: Block index
;;     $12: Distance to check for collision
;;     $18: Target X position
;; Returns:
;;     Carry: Set if Samus collides with solid slope, clear otherwise
;;     $12.$14: Adjusted distance to move Samus or distance to collision

; This resembles $8000 adapted for block collision, or $86FE adapted for horizontal collision
; I guess this was written before it was decided that non-square slopes shouldn't have solid horizontal collision
; Looking at $86FE, I assume there's supposed to be a collision direction check here to branch to BRANCH_RIGHT
    LDA.W CurrentBlockIndex : STA.W $4204
    SEP #$20
    LDA.W RoomWidthBlocks : STA.W $4206
    REP #$20
    LDA.W SamusXPosition : LSR #4 : CMP.W $4216 : BEQ .centerInBlock
    CLC
    RTS

  .centerInBlock:
    LDA.B DP_Temp18 : SEC : SBC.W SamusXRadius
    AND.W #$000F : EOR.W #$000F : STA.W TargetLeftRightYOffset
    LDA.L BTS,X : AND.W #$001F : ASL #4 : STA.W SlopeCollisionDefinitionTableBaseIndex
    LDA.L BTS-1,X : ASL : BPL .gotoSolidShootableGrapple
    LDA.L BTS-1,X : BMI .blockBTSMSB
    LDA.W SamusYPosition
    BRA +

  .blockBTSMSB:
    LDA.W SamusYPosition : EOR.W #$000F

+   AND.W #$000F : CLC : ADC.W SlopeCollisionDefinitionTableBaseIndex : TAX
    LDA.W SlopeDefinitions_SlopeLeftXOffsetByYPixel,X : AND.W #$001F
    SEC : SBC.W TargetLeftRightYOffset : DEC : BEQ +
    BPL ..returnNoCollision

+   CLC : ADC.B DP_Temp12 : BPL +
    LDA.W #$0000

+   STA.B DP_Temp12
    STZ.B DP_Temp14
    SEC
    RTS

  ..returnNoCollision:
    CLC
    RTS

  .gotoSolidShootableGrapple:
    JMP SamusBlockCollisionReaction_Horizontal_SolidShootableGrapple

  .right:
    LDA.W CurrentBlockIndex : STA.W $4204
    SEP #$20
    LDA.W RoomWidthBlocks : STA.W $4206
    REP #$20
    LDA.W SamusXPosition : LSR #4 : CMP.W $4216 : BEQ ..centerInBlock
    CLC
    RTS

  ..centerInBlock:
    LDA.B DP_Temp18 : CLC : ADC.W SamusXRadius
    DEC : AND.W #$000F : STA.W TargetLeftRightYOffset
    LDA.L BTS,X : AND.W #$001F : ASL #4 : STA.W SlopeCollisionDefinitionTableBaseIndex
    LDA.L BTS-1,X : ASL : BMI ..gotoSolidShootableGrapple
    LDA.L BTS-1,X : BMI ..blockBTSMSB
    LDA.W SamusYPosition
    BRA +

  ..blockBTSMSB:
    LDA.W SamusYPosition : EOR.W #$000F

+   AND.W #$000F : CLC : ADC.W SlopeCollisionDefinitionTableBaseIndex : TAX
    LDA.W SlopeDefinitions_SlopeLeftXOffsetByYPixel,X : AND.W #$001F
    SEC : SBC.W TargetLeftRightYOffset : DEC : BEQ +
    BPL ..returnNoCollision

+   CLC : ADC.B DP_Temp12 : BPL +
    LDA.W #$0000

+   STA.B DP_Temp12
    STZ.B DP_Temp14
    SEC
    RTS

  ..returnNoCollision:
    CLC
    RTS

  ..gotoSolidShootableGrapple:
    JMP SamusBlockCollisionReaction_Horizontal_SolidShootableGrapple
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $86FE: Samus block collision reaction - vertical - slope - non-square ;;;
SamusBlockCollisionReaction_Vertical_Slope_NonSquare:
;; Parameters:
;;     X: Block index
;;     $12: Distance to check for collision
;;     $18: Target Y position
;; Returns:
;;     Carry: Set if Samus collides with solid slope, clear otherwise
;;     $12.$14: Adjusted distance to move Samus or distance to collision
    LDA.W CollisionMovementDirection : LSR : BCC .up
    JMP .down

  .up:
    LDA.W CurrentBlockIndex : STA.W $4204
    SEP #$20
    LDA.W RoomWidthBlocks : STA.W $4206
    REP #$20
    LDA.W SamusXPosition : LSR #4 : CMP.W $4216 : BEQ ..centerInBlock
    CLC
    RTS

  ..centerInBlock:
    LDA.B DP_Temp18 : SEC : SBC.W SamusYRadius
    AND.W #$000F : EOR.W #$000F : STA.W TargetBottomTopYOffset
    LDA.L BTS,X : AND.W #$001F : ASL #4 : STA.W SlopeCollisionDefinitionTableBaseIndex
    LDA.L BTS-1,X : BPL ..gotoReturnNoCollision
    ASL : BMI ..blockBTS40
    LDA.W SamusXPosition
    BRA +

  ..blockBTS40:
    LDA.W SamusXPosition : EOR.W #$000F

+   AND.W #$000F : CLC : ADC.W SlopeCollisionDefinitionTableBaseIndex : TAX
    LDA.W SlopeDefinitions_SlopeTopXOffsetByYPixel,X : AND.W #$001F
    SEC : SBC.W TargetBottomTopYOffset : DEC : BEQ +
    BPL ..returnNoCollision

+   CLC : ADC.B DP_Temp12 : BPL +
    LDA.W #$0000

+   STA.B DP_Temp12
    STZ.B DP_Temp14
    SEC
    RTS

  ..returnNoCollision:
    CLC
    RTS

  ..gotoReturnNoCollision:
    JMP ..returnNoCollision ; >.<

  .down:
    LDA.W CurrentBlockIndex : STA.W $4204
    SEP #$20
    LDA.W RoomWidthBlocks : STA.W $4206
    REP #$20
    LDA.W SamusXPosition : LSR #4 : CMP.W $4216 : BEQ ..centerInBlock
    CLC
    RTS

  ..centerInBlock:
    LDA.B DP_Temp18 : CLC : ADC.W SamusYRadius
    DEC : AND.W #$000F : STA.W TargetBottomTopYOffset
    LDA.L BTS,X : AND.W #$001F : ASL #4 : STA.W SlopeCollisionDefinitionTableBaseIndex
    LDA.L BTS-1,X : BMI ..returnNoCollision
    ASL : BMI ..blockBTS40
    LDA.W SamusXPosition
    BRA +

  ..blockBTS40:
    LDA.W SamusXPosition : EOR.W #$000F

+   AND.W #$000F : CLC : ADC.W SlopeCollisionDefinitionTableBaseIndex : TAX
    LDA.W SlopeDefinitions_SlopeTopXOffsetByYPixel,X : AND.W #$001F
    SEC : SBC.W TargetBottomTopYOffset : DEC : BEQ +
    BPL ..returnNoCollision

+   CLC : ADC.B DP_Temp12 : BPL +
    LDA.W #$0000

+   STA.B DP_Temp12
    STZ.B DP_Temp14
    SEC
    RTS

  ..returnNoCollision:
    CLC
    RTS


;;; $87F4: Align Samus Y position with non-square slope ;;;
Align_SamusYPosition_WithNonSquareSlope:
    PHB
    PHK : PLB
    LDA.W HorizontalSlopeCollision : BIT.W #$0002 : BNE .bottom
    JMP .return

  .bottom:
    LDA.W SamusXPosition : STA.B DP_Temp1A
    LDA.W SamusYPosition : CLC : ADC.W SamusYRadius : DEC : STA.B DP_Temp1C
    STZ.B DP_Temp1E : STZ.B DP_Temp20
    JSR CalculateBlockAt_12_1E_1C_20
    LDA.W CurrentBlockIndex : ASL : TAX
    LDA.L LevelData,X : AND.W #$F000 : CMP.W #$1000 : BNE .SamusTopCheck
    LDX.W CurrentBlockIndex
    LDA.L BTS,X : AND.W #$001F : CMP.W #$0005 : BCC .SamusTopCheck
    LDA.W SamusYPosition : CLC : ADC.W SamusYRadius
    DEC : AND.W #$000F : STA.W TargetBottomTopYOffset
    LDA.L BTS,X : AND.W #$001F : ASL #4 : STA.W SlopeCollisionDefinitionTableBaseIndex
    LDA.L BTS-1,X : BMI .SamusTopCheck
    ASL : BMI ..blockBTS40
    LDA.W SamusXPosition
    BRA +

  ..blockBTS40:
    LDA.W SamusXPosition : EOR.W #$000F

+   AND.W #$000F : CLC : ADC.W SlopeCollisionDefinitionTableBaseIndex : TAX
    LDA.W SlopeDefinitions_SlopeTopXOffsetByYPixel,X : AND.W #$001F
    SEC : SBC.W YDistanceIntoSlope : DEC : BPL .SamusTopCheck
    CLC : ADC.W SamusYPosition : STA.W SamusYPosition
    LDA.W #$0001 : STA.W SamusPositionAdjustedBySlopeFlag

  .SamusTopCheck:
    LDA.W SamusXPosition : STA.B DP_Temp1A
    LDA.W SamusYPosition : SEC : SBC.W SamusYRadius : STA.B DP_Temp1C
    STZ.B DP_Temp1E : STZ.B DP_Temp20
    JSR CalculateBlockAt_12_1E_1C_20
    LDA.W CurrentBlockIndex : ASL : TAX
    LDA.L LevelData,X : AND.W #$F000 : CMP.W #$1000 : BNE .return
    LDX.W CurrentBlockIndex
    LDA.L BTS,X : AND.W #$001F : CMP.W #$0005 : BCC .return
    LDA.W SamusYPosition : SEC : SBC.W SamusYRadius
    AND.W #$000F : EOR.W #$000F : STA.W YDistanceIntoSlope
    LDA.L BTS,X : AND.W #$001F : ASL #4 : STA.W SlopeCollisionDefinitionTableBaseIndex
    LDA.L BTS-1,X : BPL .return
    ASL : BMI ..blockBTS40
    LDA.W SamusXPosition
    BRA +

  ..blockBTS40:
    LDA.W SamusXPosition : EOR.W #$000F

+   AND.W #$000F : CLC : ADC.W SlopeCollisionDefinitionTableBaseIndex : TAX
    LDA.W SlopeDefinitions_SlopeTopXOffsetByYPixel,X : AND.W #$001F
    SEC : SBC.W YDistanceIntoSlope : DEC : BEQ +
    BPL .return

+   EOR.W #$FFFF : INC
    CLC : ADC.W SamusYPosition : STA.W SamusYPosition
    LDA.W #$0001 : STA.W SamusPositionAdjustedBySlopeFlag

  .return:
    PLB
    RTL


if !FEATURE_KEEP_UNREFERENCED
;;; $891B: Unused slope definition ;;;
UNUSED_SlopeDefinitions_94891B:
    db $0F,$0E,$0D,$0C,$0B,$0A,$09,$08,$07,$06,$05,$04,$03,$02,$01,$00
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $892B: Slope definitions (slope left X offset by Y pixel) ;;;
SlopeDefinitions_SlopeLeftXOffsetByYPixel:
; ALMOST unused, used only by post-grapple collision detection (which has no effect), but referenced by some unused code too
; Data here looks incorrect, many of the rows here are identical to SlopeDefinitions_SlopeTopXOffsetByYPixel
; Indexed by ([block BTS] & 1Fh) * 10h + [Samus Y position] % 10h
    db $10,$10,$10,$10,$10,$10,$10,$10,$00,$00,$00,$00,$00,$00,$00,$00
    db $08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08
    db $10,$10,$10,$10,$10,$10,$10,$10,$08,$08,$08,$08,$08,$08,$08,$08
    db $08,$08,$08,$08,$08,$08,$08,$08,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $10,$0F,$0E,$0D,$0C,$0B,$0A,$09,$09,$0A,$0B,$0C,$0D,$0E,$0F,$10   ; 5: Unused. Half height isosceles triangl
    db $10,$0E,$0C,$0A,$08,$06,$04,$02,$02,$04,$06,$08,$0A,$0C,$0E,$10   ; 6: Unused. Isosceles triangle
    db $10,$10,$10,$10,$10,$10,$10,$10,$00,$00,$00,$00,$00,$00,$00,$00   ; 7: Half height rectangle
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ; 8: Unused. Rectangle
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ; 9: Unused. Rectangle
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ; Ah: Unused. Rectangle
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ; Bh: Unused. Rectangle
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ; Ch: Unused. Rectangle
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ; Dh: Unused. Rectangle
    db $0C,$0C,$0C,$0C,$08,$08,$08,$08,$04,$04,$04,$04,$00,$00,$00,$00   ; Eh: Unused. Very bumpy triangle
    db $0E,$0E,$0C,$0C,$0A,$0A,$08,$08,$06,$06,$04,$04,$02,$02,$00,$00   ; Fh: Bumpy triangle
    db $10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10   ; 10h: Unused
    db $14,$14,$14,$14,$14,$14,$14,$14,$14,$14,$14,$14,$14,$10,$10,$10   ; 11h: Unused
    db $10,$0F,$0E,$0D,$0C,$0B,$0A,$09,$08,$07,$06,$05,$04,$03,$02,$01   ; 12h: Triangle
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ; 13h: Rectangle
    db $10,$10,$10,$10,$10,$10,$10,$10,$10,$0F,$0E,$0D,$0C,$0B,$0A,$09   ; 14h: Quarter triangle
    db $08,$07,$06,$05,$04,$03,$02,$01,$00,$00,$00,$00,$00,$00,$00,$00   ; 15h: Three quarter triangle
    db $10,$10,$10,$10,$10,$10,$10,$10,$10,$0E,$0C,$0A,$08,$06,$04,$02   ; 16h: Lower half-height triangle
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$02,$04,$06,$08,$0A,$0C,$0E   ; 17h: Upper half-height triangle
    db $10,$10,$10,$0F,$0F,$0F,$0E,$0E,$0E,$0D,$0D,$0D,$0C,$0C,$0C,$0B   ; 18h: Unused. Lower third-height triangle
    db $0B,$0B,$0A,$0A,$0A,$09,$09,$09,$08,$08,$08,$07,$07,$07,$06,$06   ; 19h: Unused. Middle third-height triangl
    db $06,$05,$05,$05,$04,$04,$04,$03,$03,$03,$02,$02,$02,$01,$01,$01   ; 1Ah: Unused. Upper third-height triangle
    db $14,$14,$14,$14,$14,$14,$14,$14,$10,$0E,$0C,$0A,$08,$06,$04,$02   ; 1Bh: Upper half-width triangle
    db $10,$0E,$0C,$0A,$08,$06,$04,$02,$00,$00,$00,$00,$00,$00,$00,$00   ; 1Ch: Lower half-width triangle
    db $14,$14,$14,$14,$14,$14,$14,$14,$14,$14,$14,$0F,$0C,$09,$06,$03   ; 1Dh: Unused. Upper third-width triangle
    db $14,$14,$14,$14,$14,$14,$0E,$0B,$08,$05,$02,$00,$00,$00,$00,$00   ; 1Eh: Unused. Middle third-width triangle
    db $10,$0D,$0A,$07,$04,$01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ; 1Fh: Unused. Lower third-width triangle


;;; $8B2B: Slope definitions (slope top Y offset by X pixel) ;;;
SlopeDefinitions_SlopeTopXOffsetByYPixel:
; Indexed by ([block BTS] & 1Fh) * 10h + [Samus X position] % 10h
    db $08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08
    db $10,$10,$10,$10,$10,$10,$10,$10,$00,$00,$00,$00,$00,$00,$00,$00
    db $10,$10,$10,$10,$10,$10,$10,$10,$08,$08,$08,$08,$08,$08,$08,$08
    db $08,$08,$08,$08,$08,$08,$08,$08,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $10,$0F,$0E,$0D,$0C,$0B,$0A,$09,$09,$0A,$0B,$0C,$0D,$0E,$0F,$10   ; 5: Unused. Half height isosceles triangle
    db $10,$0E,$0C,$0A,$08,$06,$04,$02,$02,$04,$06,$08,$0A,$0C,$0E,$10   ; 6: Unused. Isosceles triangle
    db $08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08,$08   ; 7: Half height rectangle
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ; 8: Unused. Rectangle
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ; 9: Unused. Rectangle
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ; Ah: Unused. Rectangle
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ; Bh: Unused. Rectangle
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ; Ch: Unused. Rectangle
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ; Dh: Unused. Rectangle
    db $0C,$0C,$0C,$0C,$08,$08,$08,$08,$04,$04,$04,$04,$00,$00,$00,$00   ; Eh: Unused. Very bumpy triangle
    db $0E,$0E,$0C,$0C,$0A,$0A,$08,$08,$06,$06,$04,$04,$02,$02,$00,$00   ; Fh: Bumpy triangle
    db $10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10,$10   ; 10h: Unused
    db $14,$14,$14,$14,$14,$14,$14,$14,$14,$14,$14,$14,$14,$10,$10,$10   ; 11h: Unused
    db $10,$0F,$0E,$0D,$0C,$0B,$0A,$09,$08,$07,$06,$05,$04,$03,$02,$01   ; 12h: Triangle
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ; 13h: Rectangle
    db $10,$10,$10,$10,$10,$10,$10,$10,$10,$0F,$0E,$0D,$0C,$0B,$0A,$09   ; 14h: Quarter triangle
    db $08,$07,$06,$05,$04,$03,$02,$01,$00,$00,$00,$00,$00,$00,$00,$00   ; 15h: Three quarter triangle
    db $10,$10,$0F,$0F,$0E,$0E,$0D,$0D,$0C,$0C,$0B,$0B,$0A,$0A,$09,$09   ; 16h: Lower half-height triangle
    db $08,$08,$07,$07,$06,$06,$05,$05,$04,$04,$03,$03,$02,$02,$01,$01   ; 17h: Upper half-height triangle
    db $10,$10,$10,$0F,$0F,$0F,$0E,$0E,$0E,$0D,$0D,$0D,$0C,$0C,$0C,$0B   ; 18h: Unused. Lower third-height triangle
    db $0B,$0B,$0A,$0A,$0A,$09,$09,$09,$08,$08,$08,$07,$07,$07,$06,$06   ; 19h: Unused. Middle third-height triangle
    db $06,$05,$05,$05,$04,$04,$04,$03,$03,$03,$02,$02,$02,$01,$01,$01   ; 1Ah: Unused. Upper third-height triangle
    db $14,$14,$14,$14,$14,$14,$14,$14,$10,$0E,$0C,$0A,$08,$06,$04,$02   ; 1Bh: Upper half-width triangle
    db $10,$0E,$0C,$0A,$08,$06,$04,$02,$00,$00,$00,$00,$00,$00,$00,$00   ; 1Ch: Lower half-width triangle
    db $14,$14,$14,$14,$14,$14,$14,$14,$14,$14,$14,$0F,$0C,$09,$06,$03   ; 1Dh: Unused. Upper third-width triangle
    db $14,$14,$14,$14,$14,$14,$0E,$0B,$08,$05,$02,$00,$00,$00,$00,$00   ; 1Eh: Unused. Middle third-width triangle
    db $10,$0D,$0A,$07,$04,$01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00   ; 1Fh: Unused. Lower third-width triangle


;;; $8D2B: Samus block collision reaction - horizontal - slope - square ;;;
SamusBlockCollisionReaction_Horizontal_Slope_Square:
;; Parameters:
;;     A: [Block BTS] & 1Fh
;;     X: Block index
;;     $12.$14: Distance to check for collision
;;     $1A: Number of blocks left to check (0 if final (bottom) block)
;;     $1C: Samus' Y block span
;;     $20: Target boundary position (left/right depending on sign of [$12])
;; Returns:
;;     Carry: Set if collision, clear otherwise
;;     $12.$14: Adjusted distance to move Samus or distance to collision
    ASL #2 : STA.W SolidSlopeDefinitionTableBaseIndex
    LDA.L BTS-1,X : ROL #3 : AND.W #$0003 : STA.W SlopeCollisionFlipFlags
    LDA.B DP_Temp20 : AND.W #$0008 : LSR #3
    EOR.W SlopeCollisionFlipFlags : ADC.W SolidSlopeDefinitionTableBaseIndex : TAX
    LDA.B DP_Temp1A : BNE .top
    LDA.W SamusYPosition : CLC : ADC.W SamusYRadius : DEC : AND.W #$0008 : BNE .checkBothHalves
    LDA.W SquareSlopeDefinitions_Bank94-1,X : BMI .solid
    BRA .returnNoCollision

  .top:
    CMP.B DP_Temp1C : BNE .checkBothHalves
    LDA.W SamusYPosition : SEC : SBC.W SamusYRadius : AND.W #$0008 : BNE .checkBottomHalf

  .checkBothHalves:
    LDA.W SquareSlopeDefinitions_Bank94-1,X : BMI .solid

  .checkBottomHalf:
    TXA : EOR.W #$0002 : TAX
    LDA.W SquareSlopeDefinitions_Bank94-1,X : BMI .solid

  .returnNoCollision:
    CLC
    RTS

  .solid:
    STZ.B DP_Temp14
    LDA.B DP_Temp20 : BIT.B DP_Temp12 : BMI .negative12
    AND.W #$FFF8 : SEC : SBC.W SamusXRadius : SBC.W SamusXPosition : BPL .notMinimum
    LDA.W #$0000

  .notMinimum:
    STA.B DP_Temp12
    LDA.W #$FFFF : STA.W SamusXSubPosition
    SEC
    RTS

  .negative12:
    ORA.W #$0007 : SEC : ADC.W SamusXRadius : SEC : SBC.W SamusXPosition : BMI .notMin
    LDA.W #$0000

  .notMin:
    STA.B DP_Temp12
    STZ.W SamusXSubPosition
    SEC
    RTS


;;; $8DBD: Samus block collision reaction - vertical - slope - square ;;;
SamusBlockCollisionReaction_Vertical_Slope_Square:
;; Parameters:
;;     A: [Block BTS] & 1Fh
;;     X: Block index
;;     $12: Distance to check for collision
;;     $1A: Number of blocks left to check (0 if final (rightmost) block)
;;     $1C: Samus' X block span
;;     $20: Target boundary position (top/bottom depending on sign of [$12])
;; Returns:
;;     Carry: Set if Samus collides with solid slope, clear otherwise
;;     $12.$14: Adjusted distance to move Samus or distance to collision
    ASL #2 : STA.W SolidSlopeDefinitionTableBaseIndex
    LDA.L BTS-1,X : ROL #3 : AND.W #$0003 : STA.W SlopeCollisionFlipFlags
    LDA.B DP_Temp20 : AND.W #$0008 : LSR #2
    EOR.W SlopeCollisionFlipFlags : ADC.W SolidSlopeDefinitionTableBaseIndex : TAX
    LDA.B DP_Temp1A : BNE .checkLeft
    LDA.W SamusXPosition : CLC : ADC.W SamusXRadius
    DEC : AND.W #$0008 : BNE .checkBothHalves
    LDA.W SquareSlopeDefinitions_Bank94-1,X : BMI .solid
    BRA .returnNoCollision

  .checkLeft:
    CMP.B DP_Temp1C : BNE .checkBothHalves
    LDA.W SamusXPosition : SEC : SBC.W SamusXRadius : AND.W #$0008 : BNE .checkRightHalf

  .checkBothHalves:
    LDA.W SquareSlopeDefinitions_Bank94-1,X : BMI .solid

  .checkRightHalf:
    TXA : EOR.W #$0001 : TAX
    LDA.W SquareSlopeDefinitions_Bank94-1,X : BMI .solid

  .returnNoCollision:
    CLC
    RTS

  .solid:
    STZ.B DP_Temp14
    LDA.B DP_Temp20 : BIT.B DP_Temp12 : BMI .negative12
    AND.W #$FFF8 : SEC : SBC.W SamusYRadius : SBC.W SamusYPosition : BPL .notMin
    LDA.W #$0000

  .notMin:
    STA.B DP_Temp12
    LDA.W #$FFFF : STA.W SamusYSubPosition
    LDA.W #$0001 : STA.W SamusPositionAdjustedBySlopeFlag
    SEC
    RTS

  .negative12:
    ORA.W #$0007 : SEC : ADC.W SamusYRadius : SEC : SBC.W SamusYPosition : BMI .notMinimum
    LDA.W #$0000

  .notMinimum:
    STA.B DP_Temp12
    STZ.W SamusYSubPosition
    SEC
    RTS


;;; $8E54: Square slope definitions ;;;
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
;;; $8E68: Unused. Determine Samus suit palette index ;;;
UNUSED_DetermineSamusSuitPaletteIndex_948E68:
;; Returns:
;;     Y: 4 if gravity suit equipped, 2 if varia suit equipped, 0 otherwise

; Basing this routine name on Determine_SamusSuitPalette_Index
    LDY.W #$0004
    LDA.W EquippedItems : BIT.W #$0020 : BNE .return
    DEY #2 : BIT.W #$0001 : BNE .return
    DEY #2

  .return:
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $8E7D: Unused. Clear carry ;;;
CLCRTS_948E7D:
    CLC
    RTS


;;; $8E7F: Unused. Clear carry ;;;
CLCRTS_948E7F:
    CLC
    RTS


;;; $8E81: Clear carry ;;;
CLCRTS_948E81:
    CLC
    RTS


;;; $8E83: Samus block collision reaction - spike block - BTS 0 (generic spike) ;;;
SamusBlockCollisionReaction_SpikeBlock_BTS0_GenericSpike:
    LDA.W AreaIndex : CMP.W #$0003 : BNE .notWreckedShip
    LDA.W #$0001
    JSL CheckIfBossBitsForCurrentAreaMatchAnyBitsInA
    BCC .return

  .notWreckedShip:
    LDA.W SamusInvincibilityTimer : BNE .return
    LDA.W #$003C : STA.W SamusInvincibilityTimer
    LDA.W #$000A : STA.W SamusKnockbackTimer
    LDA.W PeriodicSubDamage : CLC : ADC.W #$0000 : STA.W PeriodicSubDamage ; >.<
    LDA.W PeriodicDamage : ADC.W #$003C : STA.W PeriodicDamage
    LDA.W PoseXDirection : EOR.W #$000C : BIT.W #$0008 : BEQ .facingRight
    LDA.W #$0001 : STA.W KnockbackXDirection
    BRA .return

  .facingRight:
    STZ.W KnockbackXDirection

  .return:
    RTS


;;; $8ECF: Samus block collision reaction - spike block - BTS 1 (Kraid's lair spike) ;;;
SamusBlockCollisionReaction_SpikeBlock_BTS1_KraidsLairSpike:
    LDA.W SamusInvincibilityTimer : BNE .return
    LDA.W #$003C : STA.W SamusInvincibilityTimer
    LDA.W #$000A : STA.W SamusKnockbackTimer
    LDA.W PeriodicSubDamage : CLC : ADC.W #$0000 : STA.W PeriodicSubDamage ; >.<
    LDA.W PeriodicDamage : ADC.W #$0010 : STA.W PeriodicDamage
    LDA.W PoseXDirection : EOR.W #$000C : BIT.W #$0008 : BEQ .facingRight
    LDA.W #$0001 : STA.W KnockbackXDirection
    BRA .return


  .facingRight:
    STZ.W KnockbackXDirection

  .return:
    RTS


;;; $8F0A: Samus block collision reaction - spike block - BTS 3 (Draygon's broken turret) ;;;
SamusBlockCollisionReact_SpikeBlock_BTS3_DraygonBrokenTurret:
; Clone of SamusBlockCollisionReaction_SpikeBlock_BTS1_KraidsLairSpike
    LDA.W SamusInvincibilityTimer : BNE .return
    LDA.W #$003C : STA.W SamusInvincibilityTimer
    LDA.W #$000A : STA.W SamusKnockbackTimer
    LDA.W PeriodicSubDamage : CLC : ADC.W #$0000 : STA.W PeriodicSubDamage ; >.<
    LDA.W PeriodicDamage : ADC.W #$0010 : STA.W PeriodicDamage
    LDA.W PoseXDirection : EOR.W #$000C : BIT.W #$0008 : BEQ .left
    LDA.W #$0001 : STA.W KnockbackXDirection
    BRA .return

  .left:
    STZ.W KnockbackXDirection

  .return:
    RTS


;;; $8F45: Set carry ;;;
SECRTS_948F45:
    SEC
    RTS


;;; $8F47: Clear carry ;;;
CLCRTS_948F47:
    CLC
    RTS


;;; $8F49: Samus block collision reaction - horizontal - solid/shootable/grapple block ;;;
SamusBlockCollisionReaction_Horizontal_SolidShootableGrapple:
;; Parameters:
;;     $12: Distance to check for collision
;;     $20: Target boundary position (left/right depending on sign of [$12])
;; Returns:
;;     Carry: Set. Unconditional collision
;;     $12.$14: Distance to collision

; RTS this routine to enable walk through walls, works surprisingly effectively
    STZ.B DP_Temp14
    LDA.B DP_Temp20 : BIT.B DP_Temp12 : BMI .negative12
    AND.W #$FFF0 : SEC : SBC.W SamusXRadius
    SEC : SBC.W SamusXPosition : BPL .leftNotMin
    LDA.W #$0000

  .leftNotMin:
    STA.B DP_Temp12
    LDA.W #$FFFF : STA.W SamusXSubPosition
    SEC
    RTS

  .negative12:
    ORA.W #$000F : SEC : ADC.W SamusXRadius
    SEC : SBC.W SamusXPosition : BMI .rightNotMin
    LDA.W #$0000

  .rightNotMin:
    STA.B DP_Temp12
    STZ.W SamusXSubPosition
    SEC
    RTS


;;; $8F82: Samus block collision reaction - vertical - solid/shootable/grapple block ;;;
SamusBlockCollisionReaction_Vertical_SolidShootableGrapple:
;; Parameters:
;;     $12: Distance to check for collision
;;     $20: Target boundary position (top/bottom depending on sign of [$12])
;; Returns:
;;     Carry: Set. Unconditional collision
;;     $12.$14: Distance to collision
    STZ.B DP_Temp14
    LDA.B DP_Temp20 : BIT.B DP_Temp12 : BMI .negative12
    AND.W #$FFF0 : SEC : SBC.W SamusYRadius
    SEC : SBC.W SamusYPosition : BPL .bottomNotMin
    LDA.W #$0000

  .bottomNotMin:
    STA.B DP_Temp12
    LDA.W #$FFFF : STA.W SamusYSubPosition
    SEC
    RTS

  .negative12:
    ORA.W #$000F : SEC : ADC.W SamusYRadius
    SEC : SBC.W SamusYPosition : BMI .topNotMin
    LDA.W #$0000

  .topNotMin:
    STA.B DP_Temp12
    STZ.W SamusYSubPosition
    SEC
    RTS


;;; $8FBB: Samus block collision reaction - horizontal - slope ;;;
SamusBlockCollisionReaction_Horizontal_Slope:
;; Parameters:
;;     $12.$14: Distance to check for collision
;;     $1A: Number of blocks left to check (0 if final (bottom) block)
;;     $1C: Samus' Y block span
;;     $20: Target boundary position (left/right depending on sign of [$12])
;; Returns:
;;     Carry: Set if collision, clear otherwise
;;     $12.$14: Adjusted distance to move Samus or distance to collision
    LDX.W CurrentBlockIndex
    LDA.L BTS,X : AND.W #$001F : CMP.W #$0005 : BCC .gotoSquare
    LDA.L BTS,X : AND.W #$00FF : STA.W CurrentSlopeBTS
    JMP SamusBlockCollisionDetection_Horizontal_Slope_NonSquare

  .gotoSquare:
    JMP SamusBlockCollisionReaction_Horizontal_Slope_Square


;;; $8FDA: Samus block collision reaction - vertical - slope ;;;
SamusBlockCollisionReaction_Vertical_Slope:
;; Parameters:
;;     $12.$14: Distance to check for collision
;;     $18: Target Y position
;;     $1A: Number of blocks left to check (0 if final (rightmost) block)
;;     $1C: Samus' X block span
;;     $20: Target boundary position (top/bottom depending on sign of [$12])
;; Returns:
;;     Carry: Set if collision, clear otherwise
;;     $12.$14: Adjusted distance to move Samus or distance to collision
    LDX.W CurrentBlockIndex
    LDA.L BTS,X : AND.W #$001F : CMP.W #$0005 : BCC .gotoSquare
    LDA.L BTS,X : STA.W CurrentSlopeBTS
    JMP SamusBlockCollisionReaction_Vertical_Slope_NonSquare

  .gotoSquare:
    JMP SamusBlockCollisionReaction_Vertical_Slope_Square


;;; $8FF6: Samus block collision reaction - vertical - spike air - jump table ;;;
SamusBlockCollisionReaction_Vertical_SpikeAir_JumpTable:
; Yeah, great table
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


;;; $9018: Clear carry ;;;
CLCRTS_949018:
    CLC
    RTS


;;; $901A: Samus block collision reaction - vertical - spike air ;;;
SamusBlockCollisionReaction_Vertical_SpikeAir:
; Does nothing
    LDX.W CurrentBlockIndex
    LDA.L BTS,X : AND.W #$00FF : ASL : TAX
    JSR.W (SamusBlockCollisionReaction_Vertical_SpikeAir_JumpTable,X)
    CLC
    RTS


;;; $902B: Samus block collision reaction - spike block - jump table ;;;
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


;;; $904B: Samus block collision reaction - horizontal - spike block ;;;
SamusBlockCollisionReaction_Horizontal_SpikeBlock:
;; Parameters:
;;     $12: Distance to check for collision
;;     $20: Target boundary position (left/right depending on sign of [$12])
;; Returns:
;;     Carry: Set. Unconditional collision
;;     $12.$14: Distance to collision
    LDX.W CurrentBlockIndex
    LDA.L BTS,X : ASL : AND.W #$01FF : TAX
    JSR.W (SamusBlockCollisionReaction_Vertical_SpikeBlock_JumpTable,X)
    JMP SamusBlockCollisionReaction_Horizontal_SolidShootableGrapple


;;; $905D: Samus block collision reaction - vertical - spike block ;;;
SamusBlockCollisionReaction_Vertical_SpikeBlock:
;; Parameters:
;;     $12: Distance to check for collision
;;     $20: Target boundary position (top/bottom depending on sign of [$12])
;; Returns:
;;     Carry: Set. Unconditional collision
;;     $12.$14: Distance to collision
    LDX.W CurrentBlockIndex
    LDA.L BTS,X : ASL : AND.W #$01FF : TAX
    JSR.W (SamusBlockCollisionReaction_Vertical_SpikeBlock_JumpTable,X)
    JMP SamusBlockCollisionReaction_Vertical_SolidShootableGrapple


;;; $906F: Samus block collision reaction - horizontal - special air ;;;
SamusBlockCollisionReaction_Horizontal_SpecialAir:
;; Parameters:
;;     $12.$14: Distance to check for collision
;; Returns:
;;     Carry: Set if collision, clear otherwise
;;     $12.$14: Adjusted distance to move Samus or distance to collision

; Area independent BTS can never cause a collision, but area dependent BTS can (according to the carry returned by their PLM setup)
    LDX.W CurrentBlockIndex
    LDA.L BTS-1,X : AND.W #$FF00 : XBA : BMI .blockBTSMSB
    ASL : TAX
    LDA.W SamusBlockCollisionReaction_Special_PLMTable_areaIndependent,X
    JSL Spawn_PLM_to_CurrentBlockIndex
    CLC
    RTS

  .blockBTSMSB:
    AND.W #$007F : ASL : TAY
    LDA.W AreaIndex : ASL : TAX
    LDA.W SamusBlockCollisionReaction_Special_PLMTable_AirPointers,X : STA.B DP_Temp22
    LDA.B (DP_Temp22),Y
    JSL Spawn_PLM_to_CurrentBlockIndex
    RTS


;;; $909D: Samus block collision reaction - vertical - special air ;;;
SamusBlockCollisionReaction_Vertical_SpecialAir:
;; Parameters:
;;     $12.$14: Distance to check for collision
;; Returns:
;;     Carry: Set if collision, clear otherwise
;;     $12.$14: Adjusted distance to move Samus or distance to collision

; Clone of SamusBlockCollisionReaction_Horizontal_SpecialAir
    LDX.W CurrentBlockIndex
    LDA.L BTS-1,X : AND.W #$FF00 : XBA : BMI .blockBTSMSB
    ASL : TAX
    LDA.W SamusBlockCollisionReaction_Special_PLMTable_areaIndependent,X
    JSL Spawn_PLM_to_CurrentBlockIndex
    CLC
    RTS

  .blockBTSMSB:
    AND.W #$007F : ASL : TAY
    LDA.W AreaIndex : ASL : TAX
    LDA.W SamusBlockCollisionReaction_Special_PLMTable_AirPointers,X : STA.B DP_Temp22
    LDA.B (DP_Temp22),Y
    JSL Spawn_PLM_to_CurrentBlockIndex
    RTS


;;; $90CB: Samus block collision reaction - horizontal - special block ;;;
SamusBlockCollisionReaction_Horizontal_SpecialBlock:
;; Parameters:
;;     $12.$14: Distance to check for collision
;;     $20: Target boundary position (left/right depending on sign of [$12])
;; Returns:
;;     Carry: Set if collision, clear otherwise
;;     $12.$14: Adjusted distance to move Samus or distance to collision
    LDX.W CurrentBlockIndex
    LDA.L BTS-1,X : AND.W #$FF00 : XBA : BMI .areaDependent
    ASL : TAX
    LDA.W SamusBlockCollisionReaction_Special_PLMTable_areaIndependent,X
    JSL Spawn_PLM_to_CurrentBlockIndex
    BCC .return
    JMP SamusBlockCollisionReaction_Horizontal_SolidShootableGrapple

  .return:
    RTS

  .areaDependent:
    AND.W #$007F : ASL : TAY
    LDA.W AreaIndex : ASL : TAX
    LDA.W SamusBlockCollisionReaction_Special_PLMTable_BlockPointers,X : STA.B DP_Temp22
    LDA.B (DP_Temp22),Y
    JSL Spawn_PLM_to_CurrentBlockIndex
    BCC ..return
    JMP SamusBlockCollisionReaction_Horizontal_SolidShootableGrapple

  ..return:
    RTS


;;; $9102: Samus block collision reaction - vertical - special block ;;;
SamusBlockCollisionReaction_Vertical_SpecialBlock:
;; Parameters:
;;     $12.$14: Distance to check for collision
;;     $20: Target boundary position (left/right depending on sign of [$12])
;; Returns:
;;     Carry: Set if collision, clear otherwise
;;     $12.$14: Adjusted distance to move Samus or distance to collision
    LDX.W CurrentBlockIndex
    LDA.L BTS-1,X : AND.W #$FF00 : XBA : BMI .areaDependent
    ASL : TAX
    LDA.W SamusBlockCollisionReaction_Special_PLMTable_areaIndependent,X
    JSL Spawn_PLM_to_CurrentBlockIndex
    BCC .return
    JMP SamusBlockCollisionReaction_Vertical_SolidShootableGrapple

  .return:
    RTS

  .areaDependent:
    AND.W #$007F : ASL : TAY
    LDA.W AreaIndex : ASL : TAX
    LDA.W SamusBlockCollisionReaction_Special_PLMTable_BlockPointers,X : STA.B DP_Temp22
    LDA.B (DP_Temp22),Y
    JSL Spawn_PLM_to_CurrentBlockIndex
    BCC ..return
    JMP SamusBlockCollisionReaction_Vertical_SolidShootableGrapple

  ..return:
    RTS


;;; $9139: Samus block collision reaction - special - PLM table ;;;
SamusBlockCollisionReaction_Special_PLMTable:
  .areaIndependent:
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

  .crateria:
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

  .brinstar:
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

  .norfair:
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

  .wreckedShip:
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

  .maridia:
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

  .tourian:
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

  .ceres:
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

  .debug:
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

  .AirPointers:
; Special air pointers to the above
    dw SamusBlockCollisionReaction_Special_PLMTable_crateria
    dw SamusBlockCollisionReaction_Special_PLMTable_brinstar
    dw SamusBlockCollisionReaction_Special_PLMTable_norfair
    dw SamusBlockCollisionReaction_Special_PLMTable_wreckedShip
    dw SamusBlockCollisionReaction_Special_PLMTable_maridia
    dw SamusBlockCollisionReaction_Special_PLMTable_tourian
    dw SamusBlockCollisionReaction_Special_PLMTable_ceres
    dw SamusBlockCollisionReaction_Special_PLMTable_debug

  .BlockPointers:
; Special block pointers to the above
    dw SamusBlockCollisionReaction_Special_PLMTable_crateria
    dw SamusBlockCollisionReaction_Special_PLMTable_brinstar
    dw SamusBlockCollisionReaction_Special_PLMTable_norfair
    dw SamusBlockCollisionReaction_Special_PLMTable_wreckedShip
    dw SamusBlockCollisionReaction_Special_PLMTable_maridia
    dw SamusBlockCollisionReaction_Special_PLMTable_tourian
    dw SamusBlockCollisionReaction_Special_PLMTable_ceres
    dw SamusBlockCollisionReaction_Special_PLMTable_debug


;;; $92F9: Samus block collision reaction - horizontal - bombable air ;;;
SamusBlockCollisionReaction_Horizontal_BombableAir:
;; Returns:
;;     Carry: Clear. No collision
    LDX.W CurrentBlockIndex
    LDA.L BTS-1,X : AND.W #$FF00 : XBA : BMI .returnNoCollision
    ASL : TAX
    LDA.W SamusBlockCollisionReaction_Bombable_PLMTable,X
    JSL Spawn_PLM_to_CurrentBlockIndex
    CLC
    RTS

  .returnNoCollision:
    CLC
    RTS


;;; $9313: Samus block collision reaction - vertical - bombable air ;;;
SamusBlockCollisionReaction_Vertical_BombableAir:
;; Returns:
;;     Carry: Clear. No collision

; Clone of SamusBlockCollisionReaction_Horizontal_BombableAir
    LDX.W CurrentBlockIndex
    LDA.L BTS-1,X : AND.W #$FF00 : XBA : BMI .returnNoCollision
    ASL : TAX
    LDA.W SamusBlockCollisionReaction_Bombable_PLMTable,X
    JSL Spawn_PLM_to_CurrentBlockIndex
    CLC
    RTS

  .returnNoCollision:
    CLC
    RTS


;;; $932D: Samus block collision reaction - horizontal - bomb block ;;;
SamusBlockCollisionReaction_Horizontal_BombBlock:
;; Parameters:
;;     $12: Distance to check for collision
;;     $20: Target boundary position (left/right depending on sign of [$12])
;; Returns:
;;     Carry: Set if collision, clear otherwise
;;     $12.$14: If carry set, distance to collision
    LDX.W CurrentBlockIndex
    LDA.L BTS-1,X : AND.W #$FF00 : XBA : BMI .gotoSolidShootableGrapple
    ASL : TAX
    LDA.W SamusBlockCollisionReaction_Bombable_PLMTable,X
    JSL Spawn_PLM_to_CurrentBlockIndex
    BCC .return
    JMP SamusBlockCollisionReaction_Horizontal_SolidShootableGrapple

  .gotoSolidShootableGrapple:
    JMP SamusBlockCollisionReaction_Horizontal_SolidShootableGrapple

  .return:
    RTS


;;; $934C: Samus block collision reaction - vertical - bomb block ;;;
SamusBlockCollisionReaction_Vertical_BombBlock:
;; Parameters:
;;     $12: Distance to check for collision
;;     $20: Target boundary position (top/bottom depending on sign of [$12])
;; Returns:
;;     Carry: Set if collision, clear otherwise
;;     $12.$14: If carry set, distance to collision
    LDX.W CurrentBlockIndex
    LDA.L BTS-1,X : AND.W #$FF00 : XBA : BMI .gotoSolidShootableGrapple
    ASL : TAX
    LDA.W SamusBlockCollisionReaction_Bombable_PLMTable,X
    JSL Spawn_PLM_to_CurrentBlockIndex
    BCC .return
    JMP SamusBlockCollisionReaction_Vertical_SolidShootableGrapple

  .gotoSolidShootableGrapple:
    JMP SamusBlockCollisionReaction_Vertical_SolidShootableGrapple

  .return:
    RTS


;;; $936B: Samus block collision reaction - bombable - PLM table ;;;
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


;;; $938B: Samus block collision reaction - horizontal - door ;;;
SamusBlockCollisionReaction_Horizontal_Door:
;; Parameters:
;;     $12: Distance to check for collision
;;     $20: Target boundary position (left/right depending on sign of [$12])
;; Returns:
;;     Carry: Set if collision, clear otherwise
;;     $12.$14: If carry set, distance to collision
    LDA.W #DoorTransitionFunction_HandleElevator : STA.W DoorTransitionFunction
    LDX.W CurrentBlockIndex
    LDA.L BTS-1,X : AND.W #$FF00 : XBA : STA.W DoorBTS
    AND.W #$007F : ASL : ADC.W DoorListPointer : TAX
    LDA.L RoomDoors,X : TAX
    LDA.L DoorHeaders_destRoomHeader,X : BPL .notAPointer
    STX.W DoorPointer
    LDA.W #$0009 : STA.W GameState
    CLC
    RTS

  .notAPointer:
    LDA.W Pose : CMP.W #$0009 : BCS .gotoSolidShootableGrapple
    LDA.W #$0001 : STA.W ElevatorProperties

  .gotoSolidShootableGrapple:
    JMP SamusBlockCollisionReaction_Horizontal_SolidShootableGrapple


;;; $93CE: Samus block collision reaction - vertical - door ;;;
SamusBlockCollisionReaction_Vertical_Door:
;; Parameters:
;;     $12: Distance to check for collision
;;     $20: Target boundary position (top/bottom depending on sign of [$12])
;; Returns:
;;     Carry: Set if collision, clear otherwise
;;     $12.$14: If carry set, distance to collision
    LDA.W #DoorTransitionFunction_HandleElevator : STA.W DoorTransitionFunction
    LDX.W CurrentBlockIndex
    LDA.L BTS-1,X : AND.W #$FF00 : XBA : STA.W DoorBTS
    AND.W #$007F : ASL : ADC.W DoorListPointer : TAX
    LDA.L RoomDoors,X : TAX
    LDA.L DoorHeaders_destRoomHeader,X : BPL .notAPointer
    STX.W DoorPointer
    LDA.W #$0009 : STA.W GameState
    CLC
    RTS

  .notAPointer:
    LDA.W Pose : CMP.W #$0009 : BCS .gotoSolidShootableGrapple
    LDA.W #$0001 : STA.W ElevatorProperties

  .gotoSolidShootableGrapple:
    JMP SamusBlockCollisionReaction_Vertical_SolidShootableGrapple


;;; $9411: Block shot/bombed/grappled/collision/inside reaction - horizontal extension ;;;
BlockShotBombedGrappledCollisionInsideReaction_HorizontalExt:
;; Returns:
;;     Carry: Clear. No collision

; If BTS is 0, acts like air
; Otherwise, offsets block index by block BTS, updates X, and loops back to the `JSR (xxxx, X)` instruction that jumped to here
    LDX.W CurrentBlockIndex
    LDA.L BTS,X : AND.W #$00FF : BEQ .returnNoCollision
    BIT.W #$0080 : BNE .highByte
    AND.W #$00FF
    BRA +

  .highByte:
    ORA.W #$FF00

+   CLC : ADC.W CurrentBlockIndex : STA.W CurrentBlockIndex
    ASL : TAX
    LDA.L LevelData,X : AND.W #$F000 : XBA : LSR #3 : TAX
    PLA : SEC : SBC.W #$0003 : PHA

  .returnNoCollision:
    CLC
    RTS


;;; $9447: Block shot/bombed/grappled/collision/inside reaction - vertical extension ;;;
BlockShotBombedGrappledCollisionInsideReaction_VerticalExt:
;; Returns:
;;     Carry: Clear. No collision

; If BTS is 0, acts like air
; Otherwise, offsets block index by block BTS, updates X, and loops back to the `JSR (xxxx, X)` instruction that jumped to here
; Uses an addition/subtraction loop for multiplication, which is probably faster for an offset of 1 or maybe 2
    LDX.W CurrentBlockIndex
    LDA.L BTS,X : AND.W #$00FF : BEQ .returnNoCollision
    BIT.W #$0080 : BNE .highByte
    STA.W CollisionVariable
    LDA.W CurrentBlockIndex

  .loopUpper:
    CLC : ADC.W RoomWidthBlocks
    DEC.W CollisionVariable : BNE .loopUpper
    JMP +

  .highByte:
    ORA.W #$FF00 : STA.W CollisionVariable
    LDA.W CurrentBlockIndex

  .loopLower:
    SEC : SBC.W RoomWidthBlocks
    INC.W CollisionVariable
    BNE .loopLower

+   STA.W CurrentBlockIndex
    ASL : TAX
    LDA.L LevelData,X : AND.W #$F000 : XBA : LSR #3 : TAX
    PLA : SEC : SBC.W #$0003 : PHA

  .returnNoCollision:
    CLC
    RTS


;;; $9495: Calculate Samus Y block span ;;;
CalculateSamusYBlockSpan:
; A = $1A = $1C = ([Samus Y position] + [Samus Y radius] - 1) / 10h
;               - ([Samus Y position] - [Samus Y radius]) / 10h
    LDA.W SamusYPosition : SEC : SBC.W SamusYRadius : AND.W #$FFF0 : STA.B DP_Temp1A
    LDA.W SamusYPosition : CLC : ADC.W SamusYRadius
    DEC : SEC : SBC.B DP_Temp1A
    LSR #4 : STA.B DP_Temp1A : STA.B DP_Temp1C
    RTS


;;; $94B5: Calculate Samus X block span ;;;
CalculateSamusXBlockSpan:
; A = $1A = $1C = ([Samus X position] + [Samus X radius] - 1) / 10h
;               - ([Samus X position] - [Samus X radius]) / 10h
    LDA.W SamusXPosition : SEC : SBC.W SamusXRadius : AND.W #$FFF0 : STA.B DP_Temp1A
    LDA.W SamusXPosition : CLC : ADC.W SamusXRadius
    DEC : SEC : SBC.B DP_Temp1A
    LSR #4 : STA.B DP_Temp1A : STA.B DP_Temp1C
    RTS


;;; $94D5: Samus block collision reaction pointers - horizontal ;;;
SamusBlockCollisionReactionPointers_Horizontal:
    dw CLCRTS_948F47                                                     ; *0: Air
    dw SamusBlockCollisionReaction_Horizontal_Slope                      ;  1: Slope
    dw CLCRTS_949018                                                     ; *2: Spike air
    dw SamusBlockCollisionReaction_Horizontal_SpecialAir                 ;  3: Special air
    dw CLCRTS_948F47                                                     ; *4: Shootable air
    dw BlockShotBombedGrappledCollisionInsideReaction_HorizontalExt      ;  5: Horizontal extension
    dw CLCRTS_948F47                                                     ; *6: Unused air
    dw SamusBlockCollisionReaction_Horizontal_BombableAir                ;  7: Bombable air
    dw SamusBlockCollisionReaction_Horizontal_SolidShootableGrapple      ;  8: Solid block
    dw SamusBlockCollisionReaction_Horizontal_Door                       ;  9: Door block
    dw SamusBlockCollisionReaction_Horizontal_SpikeBlock                 ;  Ah: Spike block
    dw SamusBlockCollisionReaction_Horizontal_SpecialBlock               ;  Bh: Special block
    dw SamusBlockCollisionReaction_Horizontal_SolidShootableGrapple      ;  Ch: Shootable block
    dw BlockShotBombedGrappledCollisionInsideReaction_VerticalExt        ;  Dh: Vertical extension
    dw SamusBlockCollisionReaction_Horizontal_SolidShootableGrapple      ;  Eh: Grapple block
    dw SamusBlockCollisionReaction_Horizontal_BombBlock                  ;  Fh: Bombable block


;;; $94F5: Samus block collision reaction pointers - vertical ;;;
SamusBlockCollisionReactionPointers_Vertical:
    dw CLCRTS_948F47                                                     ; 0: Air
    dw SamusBlockCollisionReaction_Vertical_Slope                        ; 1: Slope
    dw SamusBlockCollisionReaction_Vertical_SpikeAir                     ; 2: Spike air
    dw SamusBlockCollisionReaction_Vertical_SpecialAir                   ; 3: Special air
    dw CLCRTS_948F47                                                     ; 4: Shootable air
    dw BlockShotBombedGrappledCollisionInsideReaction_HorizontalExt      ; 5: Horizontal extension
    dw CLCRTS_948F47                                                     ; 6: Unused air
    dw SamusBlockCollisionReaction_Vertical_BombableAir                  ; 7: Bombable air
    dw SamusBlockCollisionReaction_Vertical_SolidShootableGrapple        ; 8: Solid block
    dw SamusBlockCollisionReaction_Vertical_Door                         ; 9: Door block
    dw SamusBlockCollisionReaction_Vertical_SpikeBlock                   ; Ah: Spike block
    dw SamusBlockCollisionReaction_Vertical_SpecialBlock                 ; Bh: Special block
    dw SamusBlockCollisionReaction_Vertical_SolidShootableGrapple        ; Ch: Shootable block
    dw BlockShotBombedGrappledCollisionInsideReaction_VerticalExt        ; Dh: Vertical extension
    dw SamusBlockCollisionReaction_Vertical_SolidShootableGrapple        ; Eh: Grapple block
    dw SamusBlockCollisionReaction_Vertical_BombBlock                    ; Fh: Bombable block


;;; $9515: Samus block collision reaction - horizontal ;;;
SamusBlockCollisionReaction_Horizontal:
;; Parameters:
;;     X: Block index (multiple of 2)
;;     $12.$14: Distance to check for collision
;;     $1A: Number of blocks left to check (0 if final (bottom) block)
;;     $1C: Samus' Y block span
;;     $20: Target boundary position (left/right depending on sign of [$12])
;; Returns:
;;     Carry: Set if collision, clear otherwise
;;     $12.$14: Adjusted distance to move Samus or distance to collision
    PHX
    TXA : LSR : STA.W CurrentBlockIndex
    LDA.L LevelData,X : AND.W #$F000 : XBA : LSR #3 : TAX
    JSR.W (SamusBlockCollisionReactionPointers_Horizontal,X)
    PLX
    RTS


;;; $952C: Samus block collision reaction - vertical ;;;
SamusBlockCollisionReaction_Vertical:
;; Parameters:
;;     X: Block index (multiple of 2)
;;     $12.$14: Distance to check for collision
;;     $18: Target Y position
;;     $20: Target boundary position (top/bottom depending on sign of [$12])
;; Returns:
;;     Carry: Set if collision, clear otherwise
;;     $12.$14: Adjusted distance to move Samus or distance to collision
    PHX
    TXA : LSR : STA.W CurrentBlockIndex
    LDA.L LevelData,X : AND.W #$F000 : XBA : LSR #3 : TAX
    JSR.W (SamusBlockCollisionReactionPointers_Vertical,X)
    PLX
    RTS


;;; $9543: Samus block collision detection - horizontal ;;;
SamusBlockCollisionDetection_Horizontal:
;; Parameters:
;;     $12.$14: Distance to move Samus
;; Returns:
;;     Carry: Set if collision, clear otherwise
;;     $12.$14: Adjusted distance to move Samus or distance to collision
    JSR CalculateSamusYBlockSpan
    LDA.W SamusYPosition : SEC : SBC.W SamusYRadius : LSR #4
    SEP #$20
    STA.W $4202
    LDA.W RoomWidthBlocks : STA.W $4203
    REP #$20
    LDA.W SamusXSubPosition : CLC : ADC.B DP_Temp14 : STA.B DP_Temp16
    LDA.W SamusXPosition : ADC.B DP_Temp12 : STA.B DP_Temp18
    BIT.B DP_Temp12 : BPL .movingRight
    SEC : SBC.W SamusXRadius
    BRA +

  .movingRight:
    CLC : ADC.W SamusXRadius
    DEC

+   STA.B DP_Temp20
    LSR #4 : CLC : ADC.W $4216 : ASL : TAX

  .loop:
    JSR SamusBlockCollisionReaction_Horizontal
    BCS .returnCollision
    TXA : CLC : ADC.W RoomWidthBlocks : ADC.W RoomWidthBlocks : TAX
    DEC.B DP_Temp1A : BPL .loop
    CLC
    RTS

  .returnCollision:
    SEC
    RTS


;;; $959E: Samus block collision detection - vertical - left to right ;;;
SamusBlockCollisionDetection_Vertical_LeftToRight:
;; Parameters:
;;     $12.$14: Distance to move Samus
;; Returns:
;;     Carry: Set if collision, clear otherwise
;;     $12.$14: Adjusted distance to move Samus or distance to collision
    JSR CalculateSamusXBlockSpan
    LDA.W SamusYSubPosition : CLC : ADC.B DP_Temp14 : STA.B DP_Temp16
    LDA.W SamusYPosition : ADC.B DP_Temp12 : STA.B DP_Temp18
    BIT.B DP_Temp12 : BPL .movingDown
    SEC : SBC.W SamusYRadius
    BRA +

  .movingDown:
    CLC : ADC.W SamusYRadius
    DEC

+   STA.B DP_Temp20
    LSR #4
    SEP #$20
    STA.W $4202
    LDA.W RoomWidthBlocks : STA.W $4203
    REP #$20
    LDA.W SamusXPosition : SEC : SBC.W SamusXRadius
    LSR #4 : CLC : ADC.W $4216 : STA.W CurrentBlockIndex
    ASL : TAX

  .loop:
    JSR SamusBlockCollisionReaction_Vertical
    BCS .returnCollision
    INX #2
    DEC.B DP_Temp1A : BPL .loop
    CLC
    RTS

  .returnCollision:
    SEC
    RTS


;;; $95F5: Samus block collision detection - vertical - right to left ;;;
SamusBlockCollisionDetection_Vertical_RightToLeft:
;; Parameters:
;;     $12.$14: Distance to check for collision
;; Returns:
;;     Carry: Set if collision, clear otherwise
;;     $12.$14: Adjusted distance to move Samus or distance to collision
    JSR CalculateSamusXBlockSpan
    STZ.B DP_Temp1A
    LDA.W SamusYSubPosition : CLC : ADC.B DP_Temp14 : STA.B DP_Temp16
    LDA.W SamusYPosition : ADC.B DP_Temp12 : STA.B DP_Temp18 : BIT.B DP_Temp12
    BPL .movingDown
    SEC : SBC.W SamusYRadius
    BRA +

  .movingDown:
    CLC : ADC.W SamusYRadius
    DEC

+   STA.B DP_Temp20
    LSR #4
    SEP #$20
    STA.W $4202
    LDA.W RoomWidthBlocks : STA.W $4203
    REP #$20
    LDA.W SamusXPosition : CLC : ADC.W SamusXRadius
    DEC : LSR #4
    CLC : ADC.W $4216 : STA.W CurrentBlockIndex
    ASL : TAX

  .loop:
    JSR SamusBlockCollisionReaction_Vertical
    BCS .returnCollision
    DEX #2
    INC.B DP_Temp1A
    LDA.B DP_Temp1C : CMP.B DP_Temp1A : BCS .loop
    CLC
    RTS

  .returnCollision:
    SEC
    RTS


;;; $9653: $12.$14 = |[$12].[$14]| ;;;
Get_12_14_949653:
    LDA.B DP_Temp12 : BPL .return
    EOR.W #$FFFF : STA.B DP_Temp12
    LDA.B DP_Temp14 : EOR.W #$FFFF : INC : STA.B DP_Temp14 : BNE .return
    INC.B DP_Temp12

  .return:
    RTS


;;; $9669: $12.$14 = |[$12].[$14]| ;;;
Get_12_14_949669:
; So good they coded it twice
    LDA.B DP_Temp12 : BPL .return
    EOR.W #$FFFF : STA.B DP_Temp12
    LDA.B DP_Temp14 : EOR.W #$FFFF : INC : STA.B DP_Temp14 : BNE .return
    INC.B DP_Temp12

  .return:
    RTS


;;; $967F: Wall jump block collision detection ;;;
WallJumpBlockCollisionDetection:
;; Parameters:
;;     $12.$14: Distance to check for collision
;; Returns:
;;     Carry: Set if collision, clear otherwise
;;     $12: If carry set: collision distance

; Wrapper function of SamusBlockCollisionDetection_Horizontal for wall-jump check ($90:9D35/ BombAndPowerBombExplosionBlockCollisionHandling) that ignores special air/block collisions
; The result stored to SamusSolidCollisionFlag is unused

; By setting CollisionMovementDirection to Fh, all of the collision direction checks in special air/block collision PLM setup routines
; (map/energy/missile station left/right access, quicksand surface, save station / chozo hand trigger, crumble block)
; result in no effect (no other subroutine of SamusBlockCollisionDetection_Horizontal checks collision direction)
    PHP : PHB
    PHK : PLB
    LDA.W CollisionMovementDirection : ORA.W #$000F : STA.W CollisionMovementDirection
    STZ.W SamusInQuicksand
    JSR SamusBlockCollisionDetection_Horizontal
    BCC .noCollision
    JSR Get_12_14_949653
    PLB : PLP
    SEC
    LDA.W #$0001 : STA.W SamusSolidCollisionFlag
    RTL

  .noCollision:
    JSR Get_12_14_949653
    PLB : PLP
    CLC
    STZ.W SamusSolidCollisionFlag
    RTL


;;; $96AB: Block collision detection due to change of pose ;;;
BlockCollisionDetectionDueToChangeOfPose:
;; Parameters:
;;     $12: Distance to check for collision (assume less than 10h)
;;     $14: 0. Subdistance to check for collision
;; Returns:
;;     Carry: Set if collision, clear otherwise
;;     $12: Adjusted distance to move Samus or distance to collision

; Check for collision with the one or two blocks (depending on the distance to check) above or below Samus (depending on the sign of $12),
; ignoring special air/block collisions
    LDA.B DP_Temp12 : BPL .positive
    EOR.W #$FFFF : INC

  .positive:
    AND.W #$FFF8 : BNE +
    JSL BlockCollisionDetectionDueToChangeOfPose_SingleBlock
    RTL

+   LDA.B DP_Temp12 : PHA
    LDA.B DP_Temp14 : PHA
    LDA.B DP_Temp12 : AND.W #$FFF8 : ORA.W #$0008 : STA.B DP_Temp12
    STZ.B DP_Temp14
    JSL BlockCollisionDetectionDueToChangeOfPose_SingleBlock
    BCC .noCollision
    PLA : PLA
    RTL

  .noCollision:
    PLA : STA.B DP_Temp14
    PLA : STA.B DP_Temp12
    JSL BlockCollisionDetectionDueToChangeOfPose_SingleBlock
    RTL


;;; $96E3: Block collision detection due to change of pose - single block ;;;
BlockCollisionDetectionDueToChangeOfPose_SingleBlock:
;; Parameters:
;;     $12: Distance to check for collision (assume less than 8)
;;     $14: 0. Subdistance to check for collision
;; Returns:
;;     Carry: Set if collision, clear otherwise
;;     $12: Adjusted distance to move Samus or distance to collision

; The result stored to SamusSolidCollisionFlag is unused

; By setting CollisionMovementDirection to Fh, all of the collision direction checks in special air/block collision PLM setup routines *except for quicksand surface*
; (map/energy/missile station left/right access, save station / chozo hand trigger, crumble block)
; result in no effect (no other subroutine of SamusBlockCollisionDetection_Vertical_LeftToRight / SamusBlockCollisionDetection_Vertical_RightToLeft checks collision direction)
; Quicksand surface collision is partially disabled, but can still set the Samus is in quicksand flag
; Not really sure if it makes sense to disable these interactions...
    PHP : PHB
    REP #$30
    PHK : PLB
    LDA.W CollisionMovementDirection : ORA.W #$000F : STA.W CollisionMovementDirection
    STZ.W SamusInQuicksand
    LDA.W NMI_FrameCounter : LSR : BCS .nonZeroFrameCounter
    JSR SamusBlockCollisionDetection_Vertical_LeftToRight
    BCC .noCollision
    BCS .collision

  .nonZeroFrameCounter:
    JSR SamusBlockCollisionDetection_Vertical_RightToLeft
    BCC .noCollision

  .collision:
    JSR Get_12_14_949669
    PLB : PLP
    SEC
    LDA.W #$0001 : STA.W SamusSolidCollisionFlag
    RTL

  .noCollision:
    JSR Get_12_14_949669
    PLB : PLP
    CLC
    STZ.W SamusSolidCollisionFlag
    RTL


;;; $971E: Move Samus right by [$12].[$14], no solid enemy collision ;;;
MoveSamusRight_NoSolidEnemyCollision:
;; Parameters:
;;     $12.$14: Distance to move Samus
;; Returns:
;;     Carry: Set if collision, clear otherwise
;;     $12.$14: Adjusted distance Samus was moved
    PHP : PHB
    PHK : PLB
    LDA.B DP_Temp14 : ORA.B DP_Temp12 : BEQ .noCollision
    STZ.W SamusInQuicksand
    JSR SamusBlockCollisionDetection_Horizontal
    BCC .noCollision
    LDA.W SamusXSubPosition : CLC : ADC.B DP_Temp14 : STA.W SamusXSubPosition
    LDA.W SamusXPosition : ADC.B DP_Temp12 : STA.W SamusXPosition
    PLB : PLP
    SEC
    LDA.W #$0001 : STA.W SamusSolidCollisionFlag
    RTL

  .noCollision:
    LDA.W SamusXSubPosition : CLC : ADC.B DP_Temp14 : STA.W SamusXSubPosition
    LDA.W SamusXPosition : ADC.B DP_Temp12 : STA.W SamusXPosition
    PLB : PLP
    CLC
    STZ.W SamusSolidCollisionFlag
    RTL


;;; $9763: Move Samus down by [$12].[$14], no solid enemy collision ;;;
MoveSamusDown_NoSolidEnemyCollision:
;; Parameters:
;;     $12.$14: Distance to move Samus
;; Returns:
;;     Carry: Set if collision, clear otherwise
;;     $12.$14: Adjusted distance Samus was moved
    PHP : PHB
    REP #$30
    PHK : PLB
    LDA.B DP_Temp14 : ORA.B DP_Temp12 : BEQ .noCollision
    STZ.W SamusPositionAdjustedBySlopeFlag : STZ.W SamusInQuicksand
    LDA.W NMI_FrameCounter : LSR : BCS .nonZeroFrameCounter
    JSR SamusBlockCollisionDetection_Vertical_LeftToRight
    BCC .noCollision
    BCS .moveVertically

  .nonZeroFrameCounter:
    JSR SamusBlockCollisionDetection_Vertical_RightToLeft
    BCC .noCollision

  .moveVertically:
    LDA.W SamusYSubPosition : CLC : ADC.B DP_Temp14 : STA.W SamusYSubPosition
    LDA.W SamusYPosition : ADC.B DP_Temp12 : STA.W SamusYPosition

  .collision:
    PLB : PLP
    SEC
    LDA.W #$0001 : STA.W SamusSolidCollisionFlag
    RTL

  .noCollision:
    LDA.W SamusYSubPosition : CLC : ADC.B DP_Temp14 : STA.W SamusYSubPosition
    LDA.W SamusYPosition : ADC.B DP_Temp12 : STA.W SamusYPosition
    LDA.W SamusInQuicksand : BNE .collision
    PLB : PLP
    CLC
    STZ.W SamusSolidCollisionFlag
    RTL


;;; $97BF: Block inside reaction - slope ;;;
BlockInsideReaction_Slope:
; Check if the slope is a square slope (BTS 0..5) or not. Then do nothing
; Maybe they cared about the carry flag at one point, but probably not
    LDX.W CurrentBlockIndex
    LDA.L BTS,X : AND.W #$001F : CMP.W #$0005 : BCS .returnDuplicate ; >.<
    RTS

  .returnDuplicate:
    RTS


;;; $97D0: Block inside reaction - air/shootable air/unused air/bombable air ;;;
BlockInsideReaction_Air_ShootableAir_BombableAir:
    LDA.W #SamusXSpeedTable_Normal : STA.W XSpeedTablePointer
    RTS


;;; $97D7: RTS ;;;
RTS_9497D7:
    RTS


;;; $97D8: Clear carry. Block inside reaction - spike air - BTS 0 (unused) ;;;
CLCRTS_9497D8:
; Looks like this block's effect was NOP'd out, although this block is never used anyway
    CLC
    RTS

    LDA.W PeriodicSubDamage : CLC : STA.W PeriodicSubDamage ; >.<
    LDA.W PeriodicDamage : ADC.W #$0001 : STA.W PeriodicDamage
    STZ.W SamusXExtraRunSpeed : STZ.W SamusXBaseSpeed
    CLC
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $97F2: Unused. Some kind of upwards boost ;;;
UNUSED_SomeKindOfUpwardsBoost_9497F2:
    LDA.W SamusYDirection : CMP.W #$0001 : BNE .down
    LDA.W #$0000 : STA.W SamusYSubAcceleration
    LDA.W #$0002 : STA.W SamusYAcceleration
    CLC
    RTS

  .down:
    STZ.W SamusYSpeed : STZ.W SamusYSubSpeed
    CLC
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $9810: Unused. Clear carry ;;;
CLCRTS_949810:
    CLC
    RTS


;;; $9812: Clear carry. Block inside reaction - spike air - BTS 1 (unused) ;;;
CLCRTS_949812:
; Looks like this block's effect was NOP'd out, although this block is never used anyway
    CLC
    RTS

; Damages Samus, kills her jump height, gives her lava X speed physics
    LDY.W #$0000
    LDA.W PeriodicSubDamage : CLC : STA.W PeriodicSubDamage ; >.<
    LDA.W PeriodicDamage : ADC.W #$0001 : STA.W PeriodicDamage
    LDA.W #SamusXSpeedTable_InLavaAcid : STA.W XSpeedTablePointer
    STZ.W SamusYSubAcceleration : STZ.W SamusYAcceleration
    LDA.W SamusYDirection : CMP.W #$0001 : BNE .down
    LDA.W .data1,Y : STA.W SamusYSubAcceleration
    LDA.W .data2,Y : STA.W SamusYAcceleration
    CLC
    RTS

  .down:
    STZ.W SamusYSpeed : STZ.W SamusYSubSpeed
    LDA.W .data3,Y : STA.W ExtraSamusYSubDisplacement
    LDA.W .data4,Y : STA.W ExtraSamusYDisplacement
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


;;; $9865: RTS ;;;
RTS_949865:
    RTS


;;; $9866: Block inside reaction - spike air - BTS 2 (air spike) ;;;
BlockInsideReaction_SpikeAir_BTS2_AirSpike:
    LDA.W ContactDamageIndex : BNE .return
    LDA.W SamusInvincibilityTimer : BNE .return
    LDA.W #$003C : STA.W SamusInvincibilityTimer
    LDA.W #$000A : STA.W SamusKnockbackTimer
    LDA.W PeriodicSubDamage : CLC : ADC.W #$0000 : STA.W PeriodicSubDamage ; >.<
    LDA.W PeriodicDamage : ADC.W #$0010 : STA.W PeriodicDamage
    LDA.W PoseXDirection : EOR.W #$000C : BIT.W #$0008 : BEQ .facingRight
    LDA.W #$0001 : STA.W KnockbackXDirection
    BRA .return

  .facingRight:
    STZ.W KnockbackXDirection

  .return:
    LDA.W #SamusXSpeedTable_Normal : STA.W XSpeedTablePointer
    RTS


;;; $98AC: Block inside reaction - spike air - jump table ;;;
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


;;; $98CC: Block inside reaction - spike air ;;;
BlockInsideReaction_SpikeAir:
    LDX.W CurrentBlockIndex
    LDA.L BTS,X : AND.W #$00FF : ASL : TAX
    JSR.W (BlockInsideReaction_SpikeAir_JumpTable,X)
    RTS


;;; $98DC: Block inside reaction - solid/door/spike/special/shootable/grapple/bombable block ;;;
BlockInsideReaction_SolidDoorSpikeSpecialShotGrappleBomb:
    LDA.W #SamusXSpeedTable_Normal : STA.W XSpeedTablePointer
    RTS


;;; $98E3: Block inside reaction - special air - default ;;;
BlockInsideReaction_SpecialAir_Default:
    LDA.W #SamusXSpeedTable_Normal : STA.W XSpeedTablePointer
    RTS


;;; $98EA: Block inside reaction - special air - BTS 8 (Wrecked Ship treadmill - rightwards) ;;;
BlockInsideReaction_SpecialAir_BTS8_WSTreadmill_Right:
    LDA.W AreaIndex : CMP.W #$0003 : BNE .notWreckedShip
    LDA.W #$0001
    JSL CheckIfBossBitsForCurrentAreaMatchAnyBitsInA
    BCC .return

  .notWreckedShip:
    LDA.W SamusYSpeed : BNE .return
    STZ.W ExtraSamusXSubDisplacement
    LDA.W #$0002 : STA.W ExtraSamusXDisplacement

  .return:
    LDA.W #SamusXSpeedTable_Normal : STA.W XSpeedTablePointer
    RTS


;;; $9910: Block inside reaction - special air - BTS 9 (Wrecked Ship treadmill - leftwards) ;;;
BlockInsideReaction_SpecialAir_BTS9_WSTreadmill_Left:
    LDA.W AreaIndex : CMP.W #$0003 : BNE .notWreckedShip
    LDA.W #$0001
    JSL CheckIfBossBitsForCurrentAreaMatchAnyBitsInA
    BCC .return

  .notWreckedShip:
    LDA.W SamusYSpeed : BNE .return
    STZ.W ExtraSamusXSubDisplacement
    LDA.W #$FFFE : STA.W ExtraSamusXDisplacement

  .return:
    LDA.W #SamusXSpeedTable_Normal : STA.W XSpeedTablePointer
    RTS


;;; $9936: Block inside reaction - special air - BTS Ah (rightwards treadmill) ;;;
BlockInsideReaction_SpecialAir_BTSA_RightwardsTreadmill:
    STZ.W ExtraSamusXSubDisplacement
    LDA.W #$0002 : STA.W ExtraSamusXDisplacement
    LDA.W #SamusXSpeedTable_Normal : STA.W XSpeedTablePointer
    RTS


;;; $9946: Block inside reaction - special air - BTS Bh (leftwards treadmill) ;;;
BlockInsideReaction_SpecialAir_BTSB_LeftwardsTreadmill:
    STZ.W ExtraSamusXSubDisplacement
    LDA.W #$FFFE : STA.W ExtraSamusXDisplacement
    LDA.W #SamusXSpeedTable_Normal : STA.W XSpeedTablePointer
    RTS


;;; $9956: Block inside reaction - special air - BTS 46h (scroll PLM trigger) ;;;
BlockInsideReaction_SpecialAir_BTS46_ScrollPLMTrigger:
; This routine is weird, block collision should have already spawned the scroll PLM trigger PLM,
; and the check here means the PLM is only spawned here if Samus' bottom boundary is in a different block than her center,
; which seems a bit random. As far as I can tell, this reaction can just be replaced with the default BlockInsideReaction_SpecialAir_Default

; Note that this routine doesn't set the Samus X speed table pointer,
; so spawning Samus in a scroll PLM will cause calculations to be done with a garbage pointer,
; which can cause Samus to get flung horizontally (notably in quickmet, this never happens in vanilla)
    LDA.W InsideBlockReactionSamusPoint : CMP.W #$0001 : BNE .return
    LDA.W #PLMEntries_scrollPLMTrigger
    JSL Spawn_PLM_to_CurrentBlockIndex

  .return:
    RTS


;;; $9966: Block inside reaction - special air - jump table ;;;
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


;;; $9A06: Block inside reaction - special air - PLM table ;;;
BlockInsideReaction_SpecialAir_PLMTable:
; Region dependent
  .crateria:
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

  .brinstar:
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

  .norfair:
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

  .wreckedShip:
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

  .maridia:
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

  .tourian:
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

  .ceres:
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

  .debug:
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

  .Pointers:
    dw BlockInsideReaction_SpecialAir_PLMTable_crateria
    dw BlockInsideReaction_SpecialAir_PLMTable_brinstar
    dw BlockInsideReaction_SpecialAir_PLMTable_norfair
    dw BlockInsideReaction_SpecialAir_PLMTable_wreckedShip
    dw BlockInsideReaction_SpecialAir_PLMTable_maridia
    dw BlockInsideReaction_SpecialAir_PLMTable_tourian
    dw BlockInsideReaction_SpecialAir_PLMTable_ceres
    dw BlockInsideReaction_SpecialAir_PLMTable_debug


;;; $9B16: Block inside reaction - special air ;;;
BlockInsideReaction_SpecialAir:
    LDX.W CurrentBlockIndex
    LDA.L BTS-1,X : BMI .negativeBTS
    AND.W #$FF00 : XBA : ASL : TAX
    JSR.W (BlockInsideReaction_SpecialAir_JumpTable,X)
    RTS

  .negativeBTS:
    XBA : AND.W #$007F : ASL : TAY
    LDA.W AreaIndex : ASL : TAX
    LDA.W BlockInsideReaction_SpecialAir_PLMTable_Pointers,X : STA.B DP_Temp22
    LDA.B (DP_Temp22),Y
    JSL Spawn_PLM_to_CurrentBlockIndex
    RTS


;;; $9B40: Block inside reaction pointers ;;;
BlockInsideReactionPointers:
    dw BlockInsideReaction_Air_ShootableAir_BombableAir                  ; *0: Air
    dw BlockInsideReaction_Slope                                         ;  1: Slope
    dw BlockInsideReaction_SpikeAir                                      ;  2: Spike air
    dw BlockInsideReaction_SpecialAir                                    ;  3: Special air
    dw BlockInsideReaction_Air_ShootableAir_BombableAir                  ; *4: Shootable air
    dw BlockShotBombedGrappledCollisionInsideReaction_HorizontalExt      ;  5: Horizontal extension
    dw BlockInsideReaction_Air_ShootableAir_BombableAir                  ; *6: Unused air
    dw BlockInsideReaction_Air_ShootableAir_BombableAir                  ; *7: Bombable air
    dw BlockInsideReaction_SolidDoorSpikeSpecialShotGrappleBomb          ; *8: Solid block
    dw BlockInsideReaction_SolidDoorSpikeSpecialShotGrappleBomb          ; *9: Door block
    dw BlockInsideReaction_SolidDoorSpikeSpecialShotGrappleBomb          ; *Ah: Spike block
    dw BlockInsideReaction_SolidDoorSpikeSpecialShotGrappleBomb          ; *Bh: Special block
    dw BlockInsideReaction_SolidDoorSpikeSpecialShotGrappleBomb          ; *Ch: Shootable block
    dw BlockShotBombedGrappledCollisionInsideReaction_VerticalExt        ;  Dh: Vertical extension
    dw BlockInsideReaction_SolidDoorSpikeSpecialShotGrappleBomb          ; *Eh: Grapple block
    dw BlockInsideReaction_SolidDoorSpikeSpecialShotGrappleBomb          ; *Fh: Bombable block


;;; $9B60: Samus block inside handling ;;;
SamusBlockInsideHandling:
; This routine uses XOR to test if two values are different, which is fine,
; but chaining it a second time ($94:9BEB) doesn't work at all,
; so that branch is very unlikely to be taken >_<;
; Result is that if Samus' top and center are in the same block (and her bottom is in a different block),
; that block's inside reaction will usually be executed twice
; I guess the reaction of the block her top is inside *won't* be executed under some circumstances too
    PHB
    PHK : PLB
    STZ.W SamusXDecelerationMultiplier
    STZ.W ExtraSamusXSubDisplacement : STZ.W ExtraSamusXDisplacement
    STZ.W ExtraSamusYSubDisplacement : STZ.W ExtraSamusYDisplacement
    STZ.W InsideBlockReactionSamusPoint
    LDA.W SamusXPosition : STA.B DP_Temp1A
    LDA.W SamusYPosition : CLC : ADC.W SamusYRadius
    DEC : STA.W SamusBottomBoundaryPosition : STA.B DP_Temp1C
    STZ.B DP_Temp1E : STZ.B DP_Temp20
    JSR CalculateBlockAt_12_1E_1C_20
    LDA.W CurrentBlockIndex : ASL : TAX
    LDA.L LevelData+1,X : AND.W #$00F0 : LSR #3 : TAX
    JSR.W (BlockInsideReactionPointers,X)
    LDA.W #$0001 : STA.W InsideBlockReactionSamusPoint
    LDA.W SamusYPosition : EOR.W SamusBottomBoundaryPosition : AND.W #$FFF0 : BEQ .top
    LDA.W SamusXPosition : STA.B DP_Temp1A
    LDA.W SamusYPosition : STA.B DP_Temp1C
    STZ.B DP_Temp1E : STZ.B DP_Temp20
    JSR CalculateBlockAt_12_1E_1C_20
    LDA.W CurrentBlockIndex : ASL : TAX
    LDA.L LevelData+1,X : AND.W #$00F0 : LSR #3 : TAX
    JSR.W (BlockInsideReactionPointers,X)

  .top:
    LDA.W #$0002 : STA.W InsideBlockReactionSamusPoint
    LDA.W SamusYPosition : SEC : SBC.W SamusYRadius
    EOR.W SamusBottomBoundaryPosition : AND.W #$FFF0 : BEQ .return
    EOR.W SamusYPosition : AND.W #$FFF0 : BEQ .return
    LDA.W SamusXPosition : STA.B DP_Temp1A
    LDA.W SamusYPosition : SEC : SBC.W SamusYRadius : STA.B DP_Temp1C
    STZ.B DP_Temp1E : STZ.B DP_Temp20
    JSR CalculateBlockAt_12_1E_1C_20
    LDA.W CurrentBlockIndex : ASL : TAX
    LDA.L LevelData+1,X : AND.W #$00F0 : LSR #3 : TAX
    JSR.W (BlockInsideReactionPointers,X)

  .return:
    PLB
    RTL


;;; $9C1D: Calculate block at ([$1A] + [$1E], [$1C] + [$20]) ;;;
CalculateBlockAt_12_1E_1C_20:
; Every call site sets $1E and $20 to zero
; Sets X to zero if block index is calculated successfully (for no reason)
    PHP
    REP #$30
    LDA.B DP_Temp1A : CLC : ADC.B DP_Temp1E : BMI .giveUp
    CMP.W #$1000 : BPL .giveUp
    AND.W #$FFF0 : LSR #4 : STA.W CollisionVariable
    LDA.B DP_Temp1C : CLC : ADC.B DP_Temp20 : BMI .giveUp
    CMP.W #$1000 : BPL .giveUp
    AND.W #$FFF0 : LSR #4 : TAY : BEQ .zeroIndex
    LDX.W #$0000
    SEP #$20
    LDA.W RoomWidthBlocks : STA.W $4202
    STY.W $4203
    NOP #3
    REP #$20
    LDA.W $4216

  .zeroIndex:
    CLC : ADC.W CollisionVariable : STA.W CurrentBlockIndex
    BRA .return

  .giveUp:
    LDA.W #$FFFF : STA.W CurrentBlockIndex

  .return:
    PLP
    RTS


;;; $9C73: Determine projectile proto type ;;;
DetermineProjectile_Prototype:
;; Parameters:
;;     X: Projectile index

; Called only as part of BombAndPowerBombExplosionBlockCollisionHandling for determining if a (power) bomb is a normal bomb or not
; Highly likely that this is based on an old model of the projectile system and was supposed to have been entirely abandoned,
; but here we are

; The is a frame after the end of a power bomb explosion where this subroutine is called where the projectile type is 0,
; cause the code at $9C83 to be executed. I doubt this is intentional
    PHP
    PHB : PHX
    PEA.W ProtoWeaponConstants>>8&$FF00 : PLB : PLB
    LDA.W SamusProjectile_Types+1,X : AND.W #$000F : BNE .notBeam
    LDA.W SamusProjectile_Types,X : AND.W #$000F : STA.B DP_Temp12
    ASL : ADC.B DP_Temp12 : INC #2 : TAX
    LDA.W ProtoWeaponConstants_Beams,X : AND.W #$00FF : STA.W ProjectileProtoType
    BRA .return

  .notBeam:
    ASL : INC : TAX
    LDA.W ProtoWeaponConstants_NonBeams,X : AND.W #$00FF : STA.W ProjectileProtoType

  .return:
    PLX : PLB : PLP
    RTS


;;; $9CAC: (Power) bomb explosion block collision handling ;;;
BombAndPowerBombExplosionBlockCollisionHandling:
;; Parameters:
;;     X: Projectile index

; Executed for bombs on every frame, not just the frame(s) an explosion is active o_O
    PHP : PHB
    PHK : PLB
    REP #$30
    JSR DetermineProjectile_Prototype
    LDA.W SamusProjectile_XPositions,X : BMI .return
    STA.B DP_Temp1A
    XBA : AND.W #$00FF : CMP.W RoomWidthScrolls : BPL .return
    LDA.W SamusProjectile_YPositions,X : BMI .return
    STA.B DP_Temp1C
    XBA : AND.W #$00FF : CMP.W RoomHeightScrolls : BPL .return
    STZ.B DP_Temp1E : STZ.B DP_Temp20
    STZ.W CurrentBlockIndex
    PHX
    JSR CalculateBlockAt_12_1E_1C_20
    PLX
    LDA.W ProjectileProtoType : CMP.W #$0002 : BEQ .bomb
    JSR PowerBombExplosionBlockCollisionHandling
    BRA .return

  .bomb:
    JSR BombExplosionBlockCollisionHandling

  .return:
    PLB : PLP
    RTL


;;; $9CF4: Bomb explosion block collision handling ;;;
BombExplosionBlockCollisionHandling:
;; Parameters:
;;     X: Projectile index
    LDA.W SamusProjectile_Variables,X : BNE .return
    LDA.W SamusProjectile_Types,X : BIT.W #$0001 : BNE .return
    ORA.W #$0001 : STA.W SamusProjectile_Types,X
    LDA.W CurrentBlockIndex : CMP.W #$FFFF : BEQ .return
    LDY.W #$0000
    LDA.W CurrentBlockIndex : ASL : TAX
    JSR BlockBombedReaction
    JSR MoveBlockIndexX_OneBlockUp
    JSR BlockBombedReaction
    JSR MoveBlockIndexX_OneRowDown_OneColumnRight
    JSR BlockBombedReaction
    JSR MoveBlockIndexX_TwoColumnsLeft
    JSR BlockBombedReaction
    JSR MoveBlockIndexX_OneRowDown_OneColumRight_duplicate
    JSR BlockBombedReaction

  .return:
    RTS


;;; $9D33: RTS ;;;
RTS_949D33:
    RTS


;;; $9D34: Move block index X one row up ;;;
MoveBlockIndexX_OneBlockUp:
    TXA : SEC : SBC.W RoomWidthBlocks : SBC.W RoomWidthBlocks : TAX
    RTS


;;; $9D3E: Move block index X one row down, one column right ;;;
MoveBlockIndexX_OneRowDown_OneColumnRight:
    TXA : SEC : ADC.W RoomWidthBlocks : ADC.W RoomWidthBlocks : INC : TAX
    RTS


;;; $9D49: Move block index X two columns left ;;;
MoveBlockIndexX_TwoColumnsLeft:
    DEX #4
    RTS


;;; $9D4E: Move block index X one row down, one column right ;;;
MoveBlockIndexX_OneRowDown_OneColumRight_duplicate:
; Clone of MoveBlockIndexX_OneRowDown_OneColumnRight
    TXA : SEC : ADC.W RoomWidthBlocks : ADC.W RoomWidthBlocks : INC : TAX
    RTS


;;; $9D59: Clear carry ;;;
CLCRTS_949D59:
    CLC
    RTS


;;; $9D5B: Set carry ;;;
SECRTS_949D5B:
    SEC
    RTS


;;; $9D5D: Spread bomb block reaction - slope ;;;
BombSpreadBlockReaction_Slope:
;; Returns:
;;     Carry: Set if collision detected, clear otherwise
    LDX.W CurrentBlockIndex
    LDA.L BTS,X : AND.W #$001F : CMP.W #$0005 : BCC .returnCollision
    JMP BlockShotReaction_Horizontal_Slope_NonSquare

  .returnCollision:
    SEC
    RTS


;;; $9D71: Block bombed reaction - special block ;;;
BlockBombedReaction_SpecialBlock:
    LDX.W CurrentBlockIndex
    LDA.L BTS-1,X : AND.W #$FF00 : XBA : BMI .areaDependent
    ASL : TAX
    LDA.W BlockBombedReaction_SpecialBlock_PLMTable_areaIndependent,X
    JSL Spawn_PLM_to_CurrentBlockIndex
    REP #$40
    SEC
    RTS

  .areaDependent:
    AND.W #$007F : ASL : TAY
    LDA.W AreaIndex : ASL : TAX
    LDA.W BlockBombedReaction_SpecialBlock_PLMTable_areaPointers,X : STA.B DP_Temp12
    LDA.B (DP_Temp12),Y
    JSL Spawn_PLM_to_CurrentBlockIndex
    REP #$40 ; reset interrupt
    SEC
    RTS


;;; $9DA4: Block bombed reaction - special block - PLM table ;;;
BlockBombedReaction_SpecialBlock_PLMTable:
  .areaIndependent:
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

  .crateria:
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing

  .brinstar:
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_BombReaction_SpeedBoostBlock
    dw PLMEntries_BombReaction_SpeedBoostBlock
    dw PLMEntries_BombReaction_SpeedBoostBlock
    dw PLMEntries_BombReaction_SpeedBoostBlock
    dw PLMEntries_nothing
    dw PLMEntries_nothing

  .norfair:
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing

  .wreckedShip:
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing

  .maridia:
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing

  .tourian:
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing

  .ceres:
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing

  .debug:
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing

  .areaPointers:
    dw BlockBombedReaction_SpecialBlock_PLMTable_crateria
    dw BlockBombedReaction_SpecialBlock_PLMTable_brinstar
    dw BlockBombedReaction_SpecialBlock_PLMTable_norfair
    dw BlockBombedReaction_SpecialBlock_PLMTable_wreckedShip
    dw BlockBombedReaction_SpecialBlock_PLMTable_maridia
    dw BlockBombedReaction_SpecialBlock_PLMTable_tourian
    dw BlockBombedReaction_SpecialBlock_PLMTable_ceres
    dw BlockBombedReaction_SpecialBlock_PLMTable_debug


;;; $9E54: RTS ;;;
RTS_949E54:
    RTS


;;; $9E55: Block shot/bombed/grappled reaction - shootable air ;;;
BlockBombShotGrappledReaction_ShootableAir:
;; Returns:
;;     Carry: Clear. No collision
;;     Overflow: Clear (no effect)
    LDX.W CurrentBlockIndex
    LDA.L BTS-1,X : AND.W #$FF00 : XBA : BMI .returnDuplicate
    ASL : TAX
    LDA.W BlockBombShotGrappledReaction_Shootable_PLMTable_noArea,X
    JSL Spawn_PLM_to_CurrentBlockIndex
    REP #$40 ; reset overflow
    CLC ; >.< REP #$41
    RTS

  .returnDuplicate:
    REP #$40 ; reset overflow
    CLC ; >.< REP #$41
    RTS


;;; $9E73: Block shot/bombed/grappled reaction - shootable block ;;;
BlockBombShotGrappledReaction_ShootableBlock:
;; Returns:
;;     Carry: Set. Unconditional collision
;;     Overflow: Clear. Cancel grapple beam
    LDX.W CurrentBlockIndex
    LDA.L BTS-1,X : AND.W #$FF00 : XBA : BMI .areaDependent
    ASL : TAX
    LDA.W BlockBombShotGrappledReaction_Shootable_PLMTable_noArea,X
    JSL Spawn_PLM_to_CurrentBlockIndex
    REP #$40 ; reset overflow
    SEC
    RTS

  .areaDependent:
    AND.W #$007F : ASL : TAY
    LDA.W AreaIndex : ASL : TAX
    LDA.W BlockBombShotGrappledReaction_Shootable_PLMTable_areaPointer,X : STA.B DP_Temp12
    LDA.B (DP_Temp12),Y
    JSL Spawn_PLM_to_CurrentBlockIndex
    REP #$40 ; reset overflow
    SEC
    RTS


;;; $9EA6: Block shot/bombed/grappled reaction - shootable - PLM table ;;;
BlockBombShotGrappledReaction_Shootable_PLMTable:
  .noArea:
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

  .crateria:
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing

  .brinstar:
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing

  .norfair:
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing

  .wreckedShip:
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing

  .maridia:
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing

  .tourian:
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing

  .ceres:
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing

  .debug:
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing
    dw PLMEntries_nothing

  .areaPointer:
    dw BlockBombShotGrappledReaction_Shootable_PLMTable_crateria
    dw BlockBombShotGrappledReaction_Shootable_PLMTable_brinstar
    dw BlockBombShotGrappledReaction_Shootable_PLMTable_norfair
    dw BlockBombShotGrappledReaction_Shootable_PLMTable_wreckedShip
    dw BlockBombShotGrappledReaction_Shootable_PLMTable_maridia
    dw BlockBombShotGrappledReaction_Shootable_PLMTable_tourian
    dw BlockBombShotGrappledReaction_Shootable_PLMTable_ceres
    dw BlockBombShotGrappledReaction_Shootable_PLMTable_debug


;;; $9FD6: Block shot/bombed/grappled reaction - bombable air ;;;
BlockShotBombedGrappledReaction_BombableAir:
;; Returns:
;;     Carry: Clear. No collision
;;     Overflow: Clear (no effect)
    LDX.W CurrentBlockIndex
    LDA.L BTS-1,X
    AND.W #$FF00
    XBA
    BMI .returnDuplicate
    ASL
    TAX
    LDA.W BlockShotBombedGrappledReaction_Bombable_PLMTable,X
    JSL Spawn_PLM_to_CurrentBlockIndex
    REP #$40 ; reset overflow
    CLC ; >.< REP #$41
    RTS

  .returnDuplicate:
    REP #$40 ; reset overflow
    CLC ; >.< REP #$41
    RTS


;;; $9FF4: Block shot/bombed/grappled reaction - bombable block ;;;
BlockShotBombedGrappledReaction_BombableBlock:
;; Returns:
;;     Carry: Set. Unconditional collision
;;     Overflow: Clear. Cancel grapple beam
    LDX.W CurrentBlockIndex
    LDA.L BTS-1,X : AND.W #$FF00 : XBA : BMI .returnDuplicate
    ASL : TAX
    LDA.W BlockShotBombedGrappledReaction_Bombable_PLMTable,X
    JSL Spawn_PLM_to_CurrentBlockIndex
    REP #$40 ; reset overflow
    SEC
    RTS

  .returnDuplicate:
    REP #$40 ; reset overflow
    SEC
    RTS


;;; $A012: Block shot/bombed/grappled reaction - bombable - PLM table ;;;
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


;;; $A032: Block bombed reaction pointers ;;;
BlockBombedReactionPointers:
    dw CLCRTS_949D59                                                     ;  0: Air
    dw CLCRTS_949D59                                                     ;  1: Slope
    dw CLCRTS_949D59                                                     ;  2: Spike air
    dw CLCRTS_949D59                                                     ;  3: Special air
    dw BlockBombShotGrappledReaction_ShootableAir                        ; *4: Shootable air
    dw BlockShotBombedGrappledCollisionInsideReaction_HorizontalExt      ; *5: Horizontal extension
    dw CLCRTS_949D59                                                     ;  6: Unused air
    dw BlockShotBombedGrappledReaction_BombableAir                       ; *7: Bombable air
    dw SECRTS_949D5B                                                     ;  8: Solid block
    dw SECRTS_949D5B                                                     ;  9: Door block
    dw SECRTS_949D5B                                                     ;  Ah: Spike block
    dw BlockBombedReaction_SpecialBlock                                  ; *Bh: Special block
    dw BlockBombShotGrappledReaction_ShootableBlock                      ; *Ch: Shootable block
    dw BlockShotBombedGrappledCollisionInsideReaction_VerticalExt        ; *Dh: Vertical extension
    dw SECRTS_949D5B                                                     ;  Eh: Grapple block
    dw BlockShotBombedGrappledReaction_BombableBlock                     ; *Fh: Bombable block


;;; $A052: Block bombed reaction ;;;
BlockBombedReaction:
;; Parameters:
;;     X: Block index
    PHX
    STX.W CurrentBlockIndex
    LSR.W CurrentBlockIndex
    LDA.L LevelData,X : AND.W #$F000 : XBA : LSR #3 : TAX
    JSR.W (BlockBombedReactionPointers,X)
    PLX
    RTS


;;; $A06A: Power bomb explosion block collision handling ;;;
PowerBombExplosionBlockCollisionHandling:
;; Parameters:
;;     X: Projectile index
    LDA.W SamusProjectile_Variables,X : BEQ .zero
    BPL .return
    STZ.W SamusProjectile_Variables,X

  .return:
    RTS

  .zero:
    LDA.W SamusProjectile_PowerBombExplosionRadius+1 : AND.W #$00FF : STA.B DP_Temp12
    ASL : ADC.B DP_Temp12 : LSR #2 : STA.B DP_Temp14
    LDA.W SamusProjectile_PowerBombExplosionXPosition : SEC : SBC.B DP_Temp12 : BPL .set16
    LDA.W #$0000

  .set16:
    LSR #4 : STA.B DP_Temp16
    LDA.W SamusProjectile_PowerBombExplosionXPosition : CLC : ADC.B DP_Temp12
    LSR #4 : CMP.W RoomWidthBlocks : BCC .set18
    LDA.W RoomWidthBlocks : DEC

  .set18:
    STA.B DP_Temp18
    LDA.W SamusProjectile_PowerBombExplosionYPosition : SEC : SBC.B DP_Temp14 : BPL .set1A
    LDA.W #$0000

  .set1A:
    LSR #4 : STA.B DP_Temp1A
    LDA.W SamusProjectile_PowerBombExplosionYPosition : CLC : ADC.B DP_Temp14
    LSR #4 : CMP.W RoomHeightBlocks : BCC .set1C
    LDA.W RoomHeightBlocks : DEC

  .set1C:
    STA.B DP_Temp1C
    LDA.B DP_Temp15 : AND.W #$FF00 : ORA.B DP_Temp1A : PHA
    JSR PowerBombExplosionBlockCollisionHandling_Row
    PLA
    JSR PowerBombExplosionBlockCollisionHandling_Column
    LDA.B DP_Temp15 : AND.W #$FF00 : ORA.B DP_Temp1C
    JSR PowerBombExplosionBlockCollisionHandling_Row
    LDA.B DP_Temp17 : AND.W #$FF00 : ORA.B DP_Temp1A
    JSR PowerBombExplosionBlockCollisionHandling_Column
    RTS


;;; $A0F4: Power bomb explosion block collision handling - row ;;;
PowerBombExplosionBlockCollisionHandling_Row:
;; Parameters:
;;     A low: Origin Y block
;;     A high: Origin X block
;;     $16: Power bomb left boundary
;;     $18: Power bomb right boundary
    SEP #$20
    STA.W $4202
    LDA.W RoomWidthBlocks : STA.W $4203
    LDA.B #$00 : XBA
    REP #$31 ; clear carry
    ADC.W $4216 : ASL : TAX
    LDA.B DP_Temp18 : SEC : SBC.B DP_Temp16 : TAY

  .loop:
    PHY
    JSR BlockBombedReaction
    PLY
    INX #2
    DEY : BPL .loop
    RTS


;;; $A11A: Power bomb explosion block collision handling - column ;;;
PowerBombExplosionBlockCollisionHandling_Column:
;; Parameters:
;;     A low: Origin Y block
;;     A high: Origin X block
;;     $1A: Power bomb top boundary
;;     $1C: Power bomb bottom boundary
    SEP #$20
    STA.W $4202
    LDA.W RoomWidthBlocks : STA.W $4203
    LDA.B #$00 : XBA
    REP #$31 ; clear carry
    ADC.W $4216 : ASL : TAX
    LDA.B DP_Temp1C : SEC : SBC.B DP_Temp1A : TAY

  .loop:
    PHY
    JSR BlockBombedReaction
    PLY
    TXA : CLC : ADC.W RoomWidthBlocks : ADC.W RoomWidthBlocks : TAX
    DEY : BPL .loop
    RTS


;;; $A147: Block shot reaction - horizontal - slope ;;;
BlockShotReaction_Horizontal_Slope:
;; Parameters:
;;     $1A: Projectile Y span - 1
;;     $1C: Target boundary (left/right depending on sign of projectile velocity)
;;     $1E: (Super) missile flag
;;     $26: Number of blocks left to check - 1
;;     $28: Target number of collisions - 1
;; Returns:
;;     Carry: Set if collision, clear otherwise
;;     $26: Remaining number of blocks left to check - 1
;;     $28: Remaining target number of collisions - 1
    LDX.W CurrentBlockIndex
    LDA.L BTS,X : AND.W #$001F : CMP.W #$0005 : BCC .gotoSquare
    JMP BlockShotReaction_Horizontal_Slope_NonSquare

  .gotoSquare:
    JMP BlockShotReaction_Horizontal_Slope_Square


;;; $A15C: Unused. Set carry ;;;
SECRTS_94A15C:
    SEC
    RTS


;;; $A15E: Block shot reaction - vertical - slope ;;;
BlockShotReaction_Vertical_Slope:
;; Parameters:
;;     $1A: Projectile Y span - 1
;;     $1C: Target boundary (left/right depending on sign of projectile velocity)
;;     $1E: (Super) missile flag
;;     $26: Number of blocks left to check - 1
;;     $28: Target number of collisions - 1
;; Returns:
;;     Carry: Set if collision, clear otherwise
;;     $26: Remaining number of blocks left to check - 1
;;     $28: Remaining target number of collisions - 1
    LDX.W CurrentBlockIndex
    LDA.L BTS,X : AND.W #$001F : CMP.W #$0005 : BCC .gotoSquare
    JMP BlockShotReaction_Vertical_Slope_NonSquare

  .gotoSquare:
    JMP BlockShotReaction_Vertical_Slope_Square


;;; $A173: Unused. Set carry ;;;
SECRTS_94A173:
    SEC
    RTS


;;; $A175: Block shot reaction pointers - horizontal ;;;
BlockShotReactionPointers_Horizontal:
    dw CLCRTS_949D59                                                     ;  0: Air
    dw BlockShotReaction_Horizontal_Slope                                ; *1: Slope
    dw CLCRTS_949D59                                                     ;  2: Spike air
    dw CLCRTS_949D59                                                     ;  3: Special air
    dw BlockBombShotGrappledReaction_ShootableAir                        ; *4: Shootable air
    dw BlockShotBombedGrappledCollisionInsideReaction_HorizontalExt      ; *5: Horizontal extension
    dw CLCRTS_949D59                                                     ;  6: Unused air
    dw BlockShotBombedGrappledReaction_BombableAir                       ; *7: Bombable air
    dw SECRTS_949D5B                                                     ;  8: Solid block
    dw SECRTS_949D5B                                                     ;  9: Door block
    dw SECRTS_949D5B                                                     ;  Ah: Spike block
    dw SECRTS_949D5B                                                     ;  Bh: Special block
    dw BlockBombShotGrappledReaction_ShootableBlock                      ; *Ch: Shootable block
    dw BlockShotBombedGrappledCollisionInsideReaction_VerticalExt        ; *Dh: Vertical extension
    dw SECRTS_949D5B                                                     ;  Eh: Grapple block
    dw BlockShotBombedGrappledReaction_BombableBlock                     ; *Fh: Bombable block


;;; $A195: Block shot reaction pointers - vertical ;;;
BlockShotReactionPointers_Vertical:
; Same as horizontal pointers except for slope
    dw CLCRTS_949D59                                                     ;  0: Air
    dw BlockShotReaction_Vertical_Slope                                  ; *1: Slope
    dw CLCRTS_949D59                                                     ;  2: Spike air
    dw CLCRTS_949D59                                                     ;  3: Special air
    dw BlockBombShotGrappledReaction_ShootableAir                        ; *4: Shootable air
    dw BlockShotBombedGrappledCollisionInsideReaction_HorizontalExt      ; *5: Horizontal extension
    dw CLCRTS_949D59                                                     ;  6: Unused air
    dw BlockShotBombedGrappledReaction_BombableAir                       ; *7: Bombable air
    dw SECRTS_949D5B                                                     ;  8: Solid block
    dw SECRTS_949D5B                                                     ;  9: Door block
    dw SECRTS_949D5B                                                     ;  Ah: Spike block
    dw SECRTS_949D5B                                                     ;  Bh: Special block
    dw BlockBombShotGrappledReaction_ShootableBlock                      ; *Ch: Shootable block
    dw BlockShotBombedGrappledCollisionInsideReaction_VerticalExt        ; *Dh: Vertical extension
    dw SECRTS_949D5B                                                     ;  Eh: Grapple block
    dw BlockShotBombedGrappledReaction_BombableBlock                     ; *Fh: Bombable block


;;; $A1B5: Block shot reaction - horizontal ;;;
BlockShotReaction_Horizontal:
;; Parameters:
;;     X: Block index
;;     $1A: Projectile Y span - 1
;;     $1C: Target boundary (left/right depending on sign of projectile velocity)
;;     $1E: (Super) missile flag
;;     $26: Number of blocks left to check - 1
;;     $28: Target number of collisions - 1
;; Returns:
;;     Carry: set if collided with block, clear otherwise
;;     $26: Remaining number of blocks left to check - 1
;;     $28: Remaining target number of collisions - 1
    CPX.W LevelDataSize
    BCS .return
    PHX
    STX.W CurrentBlockIndex
    LSR.W CurrentBlockIndex
    LDA.L LevelData,X : AND.W #$F000 : XBA : LSR #3 : TAX
    JSR.W (BlockShotReactionPointers_Horizontal,X)
    BCC .blockCollision
    DEC.B DP_Temp28

  .blockCollision:
    PLX

  .return:
    RTS


;;; $A1D6: Block shot reaction - vertical ;;;
BlockShotReaction_Vertical:
;; Parameters:
;;     X: Block index
;;     $1A: Projectile X span - 1
;;     $1C: Target boundary (top/bottom depending on sign of projectile velocity)
;;     $1E: (Super) missile flag
;;     $26: Number of blocks left to check - 1
;;     $28: Target number of collisions - 1
;; Returns:
;;     Carry: set if collided with block, clear otherwise
;;     $26: Remaining number of blocks left to check - 1
;;     $28: Remaining target number of collisions - 1
    CPX.W LevelDataSize : BCS .return
    PHX
    STX.W CurrentBlockIndex
    LSR.W CurrentBlockIndex
    LDA.L LevelData,X : AND.W #$F000 : XBA : LSR #3 : TAX
    JSR.W (BlockShotReactionPointers_Vertical,X)
    BCC .blockCollision
    DEC.B DP_Temp28

  .blockCollision:
    PLX

  .return:
    RTS


;;; $A1F7: Calculate projectile Y block span ;;;
CalculateProjectileYBlockSpan:
;; Returns:
;;     $1A: Projectile Y span - 1
;;     $26: Number of blocks left to check - 1
;;     $28: Target number of collisions - 1

; $1A = $26 = $28 = (projectile bottom boundary) / 10h - (projectile top boundary) / 10h
    LDA.W SamusProjectile_YPositions,X : SEC : SBC.W SamusProjectile_YRadii,X : AND.W #$FFF0 : STA.B DP_Temp26
    LDA.W SamusProjectile_YPositions,X : CLC : ADC.W SamusProjectile_YRadii,X
    DEC : SEC : SBC.B DP_Temp26
    LSR #4 : STA.B DP_Temp26 : STA.B DP_Temp1A : STA.B DP_Temp28
    RTS


;;; $A219: Calculate projectile X block span ;;;
CalculateProjectileXBlockSpan:
;; Returns:
;;     $1A: Projectile X span - 1
;;     $26: Number of blocks left to check - 1
;;     $28: Target number of collisions - 1

; $1A = $26 = $28 = (projectile right boundary) / 10h - (projectile left boundary) / 10h
    LDA.W SamusProjectile_XPositions,X : SEC : SBC.W SamusProjectile_XRadii,X
    AND.W #$FFF0 : STA.B DP_Temp26
    LDA.W SamusProjectile_XPositions,X : CLC : ADC.W SamusProjectile_XRadii,X
    DEC : SEC : SBC.B DP_Temp26
    LSR #4 : STA.B DP_Temp26 : STA.B DP_Temp1A : STA.B DP_Temp28
    RTS


;;; $A23B: Move beam horizontally - no wave beam ;;;
MoveBeamHorizontally_NoWaveBeam:
;; Parameters:
;;     X: Projectile index
;; Returns:
;;     Carry: set if collided with block, clear otherwise
    PHB : PHX
    PHK : PLB
    STZ.B DP_Temp1E : STZ.B DP_Temp12 : STZ.B DP_Temp14
    LDA.W SamusProjectile_XVelocities,X : BPL +
    DEC.B DP_Temp14

+   STA.B DP_Temp13
    JSR CalculateProjectileYBlockSpan
    LDA.W SamusProjectile_YPositions,X : SEC : SBC.W SamusProjectile_YRadii,X : LSR #4
    SEP #$20
    STA.W $4202
    LDA.W RoomWidthBlocks : STA.W $4203
    REP #$20
    LDA.W SamusProjectile_XSubPositions,X : CLC : ADC.B DP_Temp12 : STA.W SamusProjectile_XSubPositions,X : STA.B DP_Temp16
    LDA.W SamusProjectile_XPositions,X : ADC.B DP_Temp14 : STA.W SamusProjectile_XPositions,X : STA.B DP_Temp18
    BIT.B DP_Temp14 : BMI .negative14
    CLC : ADC.W SamusProjectile_XRadii,X
    DEC
    BRA +

  .negative14:
    SEC : SBC.W SamusProjectile_XRadii,X

+   STA.B DP_Temp1C
    LSR #4 : CLC : ADC.W $4216 : ASL : TAX
    LDA.B DP_Temp26 : CMP.W #$0010 : BPL .noCollision
    LDA.B DP_Temp1D : AND.W #$00FF : CMP.W RoomWidthScrolls : BPL .noCollision

  .loop:
    JSR BlockShotReaction_Horizontal
    TXA : CLC : ADC.W RoomWidthBlocks : ADC.W RoomWidthBlocks : TAX
    DEC.B DP_Temp26 : BPL .loop
    LDA.B DP_Temp28 : BMI .completeCollision

  .noCollision:
    PLX : PLB
    CLC
    RTL

  .completeCollision:
    PLX
    JSL Kill_Projectile
    PLB
    SEC
    RTL


;;; $A2CA: Move beam vertically - no wave beam ;;;
MoveBeamVertically_NoWaveBeam:
;; Parameters:
;;     X: Projectile index
;; Returns:
;;     Carry: set if collided with block, clear otherwise
    PHB : PHX
    PHK : PLB
    STZ.B DP_Temp1E : STZ.B DP_Temp12 : STZ.B DP_Temp14
    LDA.W SamusProjectile_YVelocities,X : BPL +
    DEC.B DP_Temp14

+   STA.B DP_Temp13
    JSR CalculateProjectileXBlockSpan
    LDA.W SamusProjectile_YSubPositions,X : CLC : ADC.B DP_Temp12 : STA.W SamusProjectile_YSubPositions,X : STA.B DP_Temp16
    LDA.W SamusProjectile_YPositions,X : ADC.B DP_Temp14 : STA.W SamusProjectile_YPositions,X : STA.B DP_Temp18
    BIT.B DP_Temp14 : BMI .negative14
    CLC : ADC.W SamusProjectile_YRadii,X
    DEC
    BRA +

  .negative14:
    SEC : SBC.W SamusProjectile_YRadii,X

+   STA.B DP_Temp1C
    LSR #4
    SEP #$20
    STA.W $4202
    LDA.W RoomWidthBlocks : STA.W $4203
    REP #$20
    LDA.W SamusProjectile_XPositions,X : SEC : SBC.W SamusProjectile_XRadii,X
    LSR #4 : CLC : ADC.W $4216 : ASL : TAX
    LDA.B DP_Temp26 : CMP.W #$0010 : BPL .noCollision
    LDA.B DP_Temp1D : AND.W #$00FF : CMP.W RoomHeightScrolls : BPL .noCollision

  .loop:
    JSR BlockShotReaction_Vertical
    INX #2
    DEC.B DP_Temp26 : BPL .loop
    LDA.B DP_Temp28 : BMI .completeCollision

  .noCollision:
    PLX : PLB
    CLC
    RTL

  .completeCollision:
    PLX
    JSL Kill_Projectile
    PLB
    SEC
    RTL


;;; $A352: Move beam horizontally - wave beam ;;;
MoveBeamHorizontally_WaveBeam:
;; Parameters:
;;     X: Projectile index
;; Returns:
;;     Carry: Clear. No collision
    PHB : PHX
    PHK : PLB
    STZ.B DP_Temp1E : STZ.B DP_Temp12 : STZ.B DP_Temp14
    LDA.W SamusProjectile_XVelocities,X : BPL +
    DEC.B DP_Temp14

+   STA.B DP_Temp13
    JSR CalculateProjectileYBlockSpan
    LDA.W SamusProjectile_YPositions,X : SEC : SBC.W SamusProjectile_YRadii,X : LSR #4
    SEP #$20
    STA.W $4202
    LDA.W RoomWidthBlocks : STA.W $4203
    REP #$20
    LDA.W SamusProjectile_XSubPositions,X : CLC : ADC.B DP_Temp12 : STA.W SamusProjectile_XSubPositions,X : STA.B DP_Temp16
    LDA.W SamusProjectile_XPositions,X : ADC.B DP_Temp14 : STA.W SamusProjectile_XPositions,X : STA.B DP_Temp18
    BIT.B DP_Temp14 : BMI .leftBoundary
    CLC : ADC.W SamusProjectile_XRadii,X
    DEC
    BRA +

  .leftBoundary:
    SEC : SBC.W SamusProjectile_XRadii,X

+   STA.B DP_Temp1C
    LSR #4 : CLC : ADC.W $4216 : ASL : TAY
    LDA.B DP_Temp26 : CMP.W #$0010 : BPL .returnNoCollision
    LDA.W SamusProjectile_YPositions,X : XBA : BMI .returnNoCollision
    AND.W #$00FF : CMP.W RoomHeightScrolls : BPL .returnNoCollision
    LDA.B DP_Temp1D : AND.W #$00FF : CMP.W RoomWidthScrolls : BPL .returnNoCollision
    TYX

  .loop:
    JSR BlockShotReaction_Horizontal
    TXA : CLC : ADC.W RoomWidthBlocks : ADC.W RoomWidthBlocks : TAX
    DEC.B DP_Temp26 : BPL .loop

  .returnNoCollision:
    PLX : PLB
    CLC
    RTL


;;; $A3E4: Move beam vertically - wave beam ;;;
MoveBeamVertically_WaveBeam:
;; Parameters:
;;     X: Projectile index
;; Returns:
;;     Carry: Clear. No collision
    PHB : PHX
    PHK : PLB
    STZ.B DP_Temp1E : STZ.B DP_Temp12 : STZ.B DP_Temp14
    LDA.W SamusProjectile_YVelocities,X : BPL +
    DEC.B DP_Temp14

+   STA.B DP_Temp13
    JSR CalculateProjectileXBlockSpan
    LDA.W SamusProjectile_YSubPositions,X : CLC : ADC.B DP_Temp12 : STA.W SamusProjectile_YSubPositions,X : STA.B DP_Temp16
    LDA.W SamusProjectile_YPositions,X : ADC.B DP_Temp14 : STA.W SamusProjectile_YPositions,X : STA.B DP_Temp18
    BIT.B DP_Temp14 : BMI .negative14
    CLC : ADC.W SamusProjectile_YRadii,X
    DEC
    BRA +

  .negative14:
    SEC : SBC.W SamusProjectile_YRadii,X

+   STA.B DP_Temp1C
    LSR #4
    SEP #$20
    STA.W $4202
    LDA.W RoomWidthBlocks : STA.W $4203
    REP #$20
    LDA.W SamusProjectile_XPositions,X : SEC : SBC.W SamusProjectile_XRadii,X
    LSR #4 : CLC : ADC.W $4216 : ASL : TAY
    LDA.B DP_Temp26 : CMP.W #$0010 : BPL .returnNoCollision
    LDA.W SamusProjectile_XPositions,X : XBA : BMI .returnNoCollision
    AND.W #$00FF : CMP.W RoomWidthScrolls : BPL .returnNoCollision
    LDA.B DP_Temp1D : AND.W #$00FF : CMP.W RoomHeightScrolls : BPL .returnNoCollision
    TYX

  .loop:
    JSR BlockShotReaction_Vertical
    INX #2
    DEC.B DP_Temp26 : BPL .loop

  .returnNoCollision:
    PLX : PLB
    CLC
    RTL


;;; $A46F: Move (super) missile horizontally ;;;
MoveMissileHorizontally:
;; Parameters:
;;     X: Projectile index
;; Returns:
;;     Carry: set if collided with block, clear otherwise
    PHB : PHX
    PHK : PLB
    LDA.W #$0001 : STA.B DP_Temp1E
    STZ.B DP_Temp26 : STZ.B DP_Temp1A
    STZ.B DP_Temp12 : STZ.B DP_Temp14
    LDA.W SamusProjectile_XVelocities,X : BPL +
    DEC.B DP_Temp14

+   STA.B DP_Temp13
    LDA.W SamusProjectile_YPositions,X
    LSR #4
    SEP #$20
    STA.W $4202
    LDA.W RoomWidthBlocks : STA.W $4203
    REP #$20
    LDA.W SamusProjectile_XSubPositions,X : CLC : ADC.B DP_Temp12 : STA.W SamusProjectile_XSubPositions,X : STA.B DP_Temp16
    LDA.W SamusProjectile_XPositions,X : ADC.B DP_Temp14 : STA.W SamusProjectile_XPositions,X : STA.B DP_Temp18 : STA.B DP_Temp1C
    LSR #4 : CLC : ADC.W $4216 : ASL : TAX
    LDA.B DP_Temp19 : AND.W #$00FF : CMP.W RoomWidthScrolls : BPL .noCollision
    JSR BlockShotReaction_Horizontal
    BCS .collision

  .noCollision:
    PLX : PLB
    CLC
    RTL

  .collision:
    PLX
    JSL Kill_Projectile
    PLB
    SEC
    RTL


;;; $A4D9: Move (super) missile vertically ;;;
MoveMissileVertically:
;; Parameters:
;;     X: Projectile index
;; Returns:
;;     Carry: set if collided with block, clear otherwise
    PHB : PHX
    PHK : PLB
    LDA.W #$0001 : STA.B DP_Temp1E
    STZ.B DP_Temp26 : STZ.B DP_Temp1A
    STZ.B DP_Temp12 : STZ.B DP_Temp14
    LDA.W SamusProjectile_YVelocities,X : BPL +
    DEC.B DP_Temp14

+   STA.B DP_Temp13
    LDA.W SamusProjectile_YSubPositions,X : CLC : ADC.B DP_Temp12 : STA.W SamusProjectile_YSubPositions,X : STA.B DP_Temp16
    LDA.W SamusProjectile_YPositions,X : ADC.B DP_Temp14 : STA.W SamusProjectile_YPositions,X : STA.B DP_Temp18 : STA.B DP_Temp1C
    LSR #4
    SEP #$20
    STA.W $4202
    LDA.W RoomWidthBlocks : STA.W $4203
    REP #$20
    LDA.W SamusProjectile_XPositions,X : LSR #4 : CLC : ADC.W $4216 : ASL : TAX
    LDA.B DP_Temp19 : AND.W #$00FF : CMP.W RoomHeightScrolls : BPL .noCollision
    JSR BlockShotReaction_Vertical
    BCS .collision

  .noCollision:
    PLX : PLB
    CLC
    RTL

  .collision:
    PLX
    JSL Kill_Projectile
    PLB
    SEC
    RTL


;;; $A543: Block shot reaction - horizontal - slope - non-square ;;;
BlockShotReaction_Horizontal_Slope_NonSquare:
;; Parameters:
;;     $26: Number of blocks left to check - 1
;;     $28: Target number of collisions - 1
;; Returns:
;;     Carry: Set if collision, clear otherwise
;;     $26: Remaining number of blocks left to check - 1
;;     $28: Remaining target number of collisions - 1

; Used for spread bomb collision also
    REP #$20
    LDX.W CurrentBlockIndex
    LDY.W ProjectileIndex
    LDA.W CurrentBlockIndex : STA.W $4204
    SEP #$20
    LDA.W RoomWidthBlocks : STA.W $4206
    REP #$20
    LDA.W SamusProjectile_YPositions,Y : LSR #4 : CMP.W $4214 : BEQ BlockShotReaction_Slope_NonSquare
    CLC
    RTS


;;; $A569: Block shot reaction - vertical - slope - non-square ;;;
BlockShotReaction_Vertical_Slope_NonSquare:
;; Parameters:
;;     $26: Number of blocks left to check - 1
;;     $28: Target number of collisions - 1
;; Returns:
;;     Carry: Set if collision, clear otherwise
;;     $26: Remaining number of blocks left to check - 1
;;     $28: Remaining target number of collisions - 1
    REP #$20
    LDX.W CurrentBlockIndex
    LDY.W ProjectileIndex
    LDA.W CurrentBlockIndex : STA.W $4204
    SEP #$20
    LDA.W RoomWidthBlocks : STA.W $4206
    REP #$20
    LDA.W SamusProjectile_XPositions,Y : LSR #4 : CMP.W $4216 : BEQ BlockShotReaction_Slope_NonSquare
    CLC
    RTS


;;; $A58F: Block shot reaction - slope - non-square ;;;
BlockShotReaction_Slope_NonSquare:
;; Parameters:
;;     X: Block index
;;     $26: Number of blocks left to check - 1
;;     $28: Target number of collisions - 1
;; Returns:
;;     Carry: Set if collision, clear otherwise
;;     $26: Remaining number of blocks left to check - 1
;;     $28: Remaining target number of collisions - 1

; Used for spread bomb collision also ($26/$28 don't matter in that case)
    LDA.L BTS,X : AND.W #$001F : ASL #4 : STA.W SlopeCollisionDefinitionTableBaseIndex
    LDA.L BTS-1,X : ASL : BMI .blockBTS40
    LDA.W SamusProjectile_XPositions,Y
    BRA +

  .blockBTS40:
    LDA.W SamusProjectile_XPositions,Y : EOR.W #$000F

+   AND.W #$000F : CLC : ADC.W SlopeCollisionDefinitionTableBaseIndex : PHA
    LDA.L BTS-1,X : BMI .blockBTSMSB
    JMP .YFlip

  .blockBTSMSB:
    PLX
    LDA.W SamusProjectile_YPositions,Y : AND.W #$000F : EOR.W #$000F : STA.W CollisionVariable
    LDA.W SlopeDefinitions_SlopeTopXOffsetByYPixel,X : AND.W #$001F : CMP.W CollisionVariable : BMI .collision
    BEQ .collision
    CLC
    RTS

  .collision:
    STZ.B DP_Temp26 : STZ.B DP_Temp28
    SEC
    RTS

  .YFlip:
    PLX
    LDA.W SamusProjectile_YPositions,Y : AND.W #$000F : STA.W CollisionVariable
    LDA.W SlopeDefinitions_SlopeTopXOffsetByYPixel,X : AND.W #$001F : CMP.W CollisionVariable : BMI ..collision
    BEQ ..collision
    CLC
    RTS

  ..collision:
    STZ.B DP_Temp26 : STZ.B DP_Temp28
    SEC
    RTS


;;; $A601: Spread bomb block reaction pointers ;;;
BombSpreadBlockReaction_Pointers:
    dw CLCRTS_949D59                                                     ;  0: Air
    dw BombSpreadBlockReaction_Slope                                     ; *1: Slope
    dw CLCRTS_949D59                                                     ;  2: Spike air
    dw CLCRTS_949D59                                                     ;  3: Special air
    dw SECRTS_949D5B                                                     ;  4: Shootable air
    dw BlockShotBombedGrappledCollisionInsideReaction_HorizontalExt      ; *5: Horizontal extension
    dw CLCRTS_949D59                                                     ;  6: Unused air
    dw CLCRTS_949D59                                                     ;  7: Bombable air
    dw SECRTS_949D5B                                                     ;  8: Solid block
    dw SECRTS_949D5B                                                     ;  9: Door block
    dw SECRTS_949D5B                                                     ;  Ah: Spike block
    dw SECRTS_949D5B                                                     ;  Bh: Special block
    dw SECRTS_949D5B                                                     ;  Ch: Shootable block
    dw BlockShotBombedGrappledCollisionInsideReaction_VerticalExt        ; *Dh: Vertical extension
    dw SECRTS_949D5B                                                     ;  Eh: Grapple block
    dw SECRTS_949D5B                                                     ;  Fh: Bombable block


;;; $A621: Spread bomb block collision detection ;;;
BombSpreadBlockCollisionDetection:
;; Parameters:
;;     X: Projectile index
;; Returns:
;;     Carry: Set if collision detected, clear otherwise
    PHP : PHB
    PHK : PLB
    REP #$30
    LDA.W SamusProjectile_XPositions,X : STA.B DP_Temp1A
    LDA.W SamusProjectile_YPositions,X : STA.B DP_Temp1C
    STZ.B DP_Temp1E : STZ.B DP_Temp20
    STZ.W CurrentBlockIndex
    PHX
    JSR CalculateBlockAt_12_1E_1C_20
    PLX
    LDA.W SamusProjectile_Variables,X : BNE .nonZeroTimer
    JSR BombExplosionBlockCollisionHandling
    BRA .returnNoCollision

  .nonZeroTimer:
    LDA.W CurrentBlockIndex : CMP.W #$FFFF : BEQ .returnCollision
    ASL : TAX
    LDA.L LevelData,X : AND.W #$F000 : XBA : LSR #3 : TAX
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


;;; $A66A: Block shot reaction - horizontal - slope - square ;;;
BlockShotReaction_Horizontal_Slope_Square:
;; Parameters:
;;     A: [Block BTS] & 1Fh
;;     X: Block index
;;     $1A: Projectile Y span - 1
;;     $1C: Target boundary (left/right depending on sign of projectile velocity)
;;     $1E: (Super) missile flag
;;     $26: Number of blocks left to check - 1
;; Returns:
;;     Carry: Set if collision, clear otherwise
    ASL #2 : STA.W SolidSlopeDefinitionTableBaseIndex
    LDA.L BTS-1,X : ROL #3 : AND.W #$0003 : STA.W SlopeCollisionDefinitionTableBaseIndex
    LDA.B DP_Temp1C : AND.W #$0008 : LSR #3
    EOR.W SlopeCollisionDefinitionTableBaseIndex : ADC.W SolidSlopeDefinitionTableBaseIndex : TAX
    LDY.W ProjectileIndex
    LDA.B DP_Temp1E : BNE .missile
    LDA.B DP_Temp1A : BNE .multiBlock
    LDA.W SamusProjectile_YPositions,Y : SEC : SBC.W SamusProjectile_YRadii,Y : AND.W #$0008 : BNE .bottomHalf
    LDA.W SquareSlopeDefinitions_Bank94-1,X : BMI .gotoReturnCollision

  .bottomHalf:
    TXA : EOR.W #$0002 : TAX
    LDA.W SamusProjectile_YPositions,Y : CLC : ADC.W SamusProjectile_YRadii,Y
    DEC : AND.W #$0008 : BEQ .returnNoCollision
    LDA.W SquareSlopeDefinitions_Bank94-1,X : BMI .gotoReturnCollision

  .returnNoCollision:
    CLC
    RTS

  .gotoReturnCollision:
    JMP .returnCollision ; >.<

  .multiBlock:
    LDA.B DP_Temp26 : BNE .topBlockCheck
    LDA.W SamusProjectile_YPositions,Y : CLC : ADC.W SamusProjectile_YRadii,Y
    DEC : AND.W #$0008 : BNE .checkBothHalves
    LDA.W SquareSlopeDefinitions_Bank94-1,X : BMI .completeWaste
    BRA .returnNoCollisionDuplicate

  .topBlockCheck:
    CMP.B DP_Temp1A : BNE .checkBothHalves
    LDA.W SamusProjectile_YPositions,Y : SEC : SBC.W SamusProjectile_YRadii,Y : AND.W #$0008 : BNE .checkBottomHalf

  .checkBothHalves:
    LDA.W SquareSlopeDefinitions_Bank94-1,X : BMI .completeWaste

  .checkBottomHalf:
    TXA : EOR.W #$0002 : TAX
    LDA.W SquareSlopeDefinitions_Bank94-1,X : BMI .completeWaste

  .returnNoCollisionDuplicate:
    CLC
    RTS

  .completeWaste:
    JMP .returnCollision

  .returnCollision:
    SEC
    RTS

  .missile:
    LDY.W ProjectileIndex
    LDA.W SamusProjectile_YPositions,Y : AND.W #$0008 : BEQ +
    TXA : EOR.W #$0002 : TAX

+   LDA.W SquareSlopeDefinitions_Bank94-1,X : BMI .returnCollisionDuplicate
    CLC
    RTS

  .returnCollisionDuplicate:
    SEC
    RTS


;;; $A71A: Block shot reaction - vertical - slope - square ;;;
BlockShotReaction_Vertical_Slope_Square:
;; Parameters:
;;     A: [Block BTS] & 1Fh
;;     X: Block index
;;     $1A: Projectile X span - 1
;;     $1C: Target boundary (top/bottom depending on sign of projectile velocity)
;;     $1E: (Super) missile flag
;;     $26: Number of blocks left to check - 1
;; Returns:
;;     Carry: Set if collision, clear otherwise
    ASL #2 : STA.W SolidSlopeDefinitionTableBaseIndex
    LDA.L BTS-1,X : ROL #3 : AND.W #$0003 : STA.W SlopeCollisionDefinitionTableBaseIndex
    LDA.B DP_Temp1C : AND.W #$0008 : LSR #2
    EOR.W SlopeCollisionDefinitionTableBaseIndex : ADC.W SolidSlopeDefinitionTableBaseIndex : TAX
    LDY.W ProjectileIndex
    LDA.B DP_Temp1E : BNE .missile
    LDA.B DP_Temp1A : BNE .multiBlock
    LDA.W SamusProjectile_XPositions,Y : SEC : SBC.W SamusProjectile_XRadii,Y : AND.W #$0008 : BNE .right
    LDA.W SquareSlopeDefinitions_Bank94-1,X : BMI .gotoReturnCollision

  .right:
    TXA : EOR.W #$0001 : TAX
    LDA.W SamusProjectile_XPositions,Y : CLC : ADC.W SamusProjectile_XRadii,Y
    DEC : AND.W #$0008 : BEQ .returnNoCollision
    LDA.W SquareSlopeDefinitions_Bank94-1,X : BMI .gotoReturnCollision

  .returnNoCollision:
    CLC
    RTS

  .gotoReturnCollision:
    JMP .returnCollision

  .multiBlock:
    LDA.B DP_Temp26 : BNE .leftmostBlockCheck
    LDA.W SamusProjectile_XPositions,Y : CLC : ADC.W SamusProjectile_XRadii,Y
    DEC : AND.W #$0008 : BNE .checkBothHalves
    LDA.W SquareSlopeDefinitions_Bank94-1,X : BMI .gotoNowhere
    BRA .returnNoCollisionDuplicate

  .leftmostBlockCheck:
    CMP.B DP_Temp1A : BNE .checkBothHalves
    LDA.W SamusProjectile_XPositions,Y : SEC : SBC.W SamusProjectile_XRadii,Y : AND.W #$0008 : BNE .checkLeftHalf

  .checkBothHalves:
    LDA.W SquareSlopeDefinitions_Bank94-1,X : BMI .gotoNowhere

  .checkLeftHalf:
    TXA : EOR.W #$0001 : TAX
    LDA.W SquareSlopeDefinitions_Bank94-1,X : BMI .gotoNowhere

  .returnNoCollisionDuplicate:
    CLC
    RTS

  .gotoNowhere:
    JMP .returnCollision ; >.<

  .returnCollision:
    SEC
    RTS

  .missile:
    LDY.W ProjectileIndex
    LDA.W SamusProjectile_XPositions,Y : AND.W #$0008 : BEQ .leftHalf
    TXA : EOR.W #$0001 : TAX

  .leftHalf:
    LDA.W SquareSlopeDefinitions_Bank94-1,X : BMI .returnCollisionDuplicate
    CLC
    RTS

  .returnCollisionDuplicate:
    SEC
    RTS


;;; $A7C9: Block grapple reaction - air / spike air / special air / unused air ;;;
BlockGrappleReaction_Air_SpikeAir_SpecialAir:
;; Returns:
;;     Carry: Clear. No collision
;;     Overflow: Clear (no effect)
    REP #$40 ; reset overflow
    CLC ; >.< REP #$41
    RTS


;;; $A7CD: Block grapple reaction - slope / solid block / door block / special block ;;;
BlockGrappleReaction_Slope_SolidBlock_DoorBlock_SpecialBlock:
;; Returns:
;;     Carry: Set. Unconditional collision
;;     Overflow: Clear. Cancel grapple beam
    REP #$40 ; reset overflow
    SEC
    RTS


;;; $A7D1: Block grapple reaction - grapple block ;;;
BlockGrappleReaction_GrappleBlock:
;; Returns:
;;     Carry/overflow: Clear if BTS >= 80h, otherwise set according to PLM initialisation (always set)
    LDA.W #$8000 : TRB.W GrappleBeam_Flags
    LDX.W CurrentBlockIndex
    LDA.L BTS-1,X : XBA : BMI +
    AND.W #$007F : ASL : TAX
    LDA.W .PLMs,X
    JSL Spawn_PLM_to_CurrentBlockIndex
    RTS

+   AND.W #$007F ; >_<
    REP #$40 ; reset overflow
    CLC ; >.< REP #$41
    RTS

  .PLMs:
    dw PLMEntries_Grappled_GrappleBlock
    dw PLMEntries_Grappled_RespawningBreakableGrappleBlock
    dw PLMEntries_Grappled_BreakableGrappleBlock
    dw PLMEntries_Grappled_GrappleBlock


;;; $A7FD: Block grapple reaction - spike block ;;;
BlockGrappleReaction_SpikeBlock:
;; Returns:
;;     Carry/overflow: Clear if BTS >= 80h, otherwise set according to PLM initialisation
;;         BTS 3h (Draygon's broken turret): Set carry and overflow
;;         Otherwise: Clear carry and overflow

; Spawn PLM for spike block
    LDX.W CurrentBlockIndex
    LDA.L BTS-1,X : XBA : BMI +
    AND.W #$007F : ASL : TAX
    LDA.W .PLMs,X
    JSL Spawn_PLM_to_CurrentBlockIndex
    RTS

+   AND.W #$007F ; >_<
    REP #$40 ; reset overflow
    CLC ; >.< REP #$41
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


;;; $A83B: Block grapple reaction pointers ;;;
BlockGrappleReaction_Pointers:
    dw BlockGrappleReaction_Air_SpikeAir_SpecialAir                      ;  0: Air
    dw BlockGrappleReaction_Slope_SolidBlock_DoorBlock_SpecialBlock      ;  1: Slope
    dw BlockGrappleReaction_Air_SpikeAir_SpecialAir                      ;  2: Spike air
    dw BlockGrappleReaction_Air_SpikeAir_SpecialAir                      ;  3: Special air
    dw BlockBombShotGrappledReaction_ShootableAir                        ; *4: Shootable air
    dw BlockShotBombedGrappledCollisionInsideReaction_HorizontalExt      ; *5: Horizontal extension
    dw BlockGrappleReaction_Air_SpikeAir_SpecialAir                      ;  6: Unused air
    dw BlockShotBombedGrappledReaction_BombableAir                       ; *7: Bombable air
    dw BlockGrappleReaction_Slope_SolidBlock_DoorBlock_SpecialBlock      ;  8: Solid block
    dw BlockGrappleReaction_Slope_SolidBlock_DoorBlock_SpecialBlock      ;  9: Door block
    dw BlockGrappleReaction_SpikeBlock                                   ; *Ah: Spike block
    dw BlockGrappleReaction_Slope_SolidBlock_DoorBlock_SpecialBlock      ;  Bh: Special block
    dw BlockBombShotGrappledReaction_ShootableBlock                      ; *Ch: Shootable block
    dw BlockShotBombedGrappledCollisionInsideReaction_VerticalExt        ; *Dh: Vertical extension
    dw BlockGrappleReaction_GrappleBlock                                 ; *Eh: Grapple block
    dw BlockShotBombedGrappledReaction_BombableBlock                     ; *Fh: Bombable block


;;; $A85B: Grapple beam block collision detection ;;;
GrappleBeamBlockCollisionDetection:
;; Returns:
;;     Carry: Set if collision, otherwise clear
;;     Overflow: If carry set; set if connecting to block, clear if grapple beam cancelled

; Checks the four points given by quarter increments of grapple velocity for block collision
; Grapple is connected if *any* point results in a connection, otherwise grapple cancel is determined by the *last* point
    PHB
    PHK : PLB
    LDA.W GrappleBeam_ExtensionXSubVelocity : STA.W GrappleCollision_EndAngleParam+1
    CLC
    ROR.W GrappleCollision_XQuarterVelocity : ROR.W GrappleCollision_EndAngleParam
    ROR.W GrappleCollision_XQuarterVelocity : ROR.W GrappleCollision_EndAngleParam
    LDA.W GrappleBeam_ExtensionXSubVelocity : BPL .YQuarterVelocity
    LDA.W #$FFC0 : TSB.W GrappleCollision_XQuarterVelocity

  .YQuarterVelocity:
    LDA.W GrappleBeam_ExtensionYSubVelocity : STA.W GrappleCollision_YQuarterSubVelocity+1
    CLC
    ROR.W GrappleCollision_YQuarterVelocity : ROR.W GrappleCollision_YQuarterSubVelocity
    ROR.W GrappleCollision_YQuarterVelocity : ROR.W GrappleCollision_YQuarterSubVelocity
    LDA.W GrappleBeam_ExtensionYSubVelocity : BPL .loopSetup
    LDA.W #$FFC0 : TSB.W GrappleCollision_YQuarterVelocity

  .loopSetup:
    LDA.W #$0004 : STA.W GrappleCollision_LoopCounter

  .loop:
    LDA.W GrappleBeam_EndXSubOffset : CLC : ADC.W GrappleCollision_EndAngleParam : STA.W GrappleBeam_EndXSubOffset
    LDA.W GrappleBeam_EndXOffset : ADC.W GrappleCollision_XQuarterVelocity : STA.W GrappleBeam_EndXOffset
    LDA.W GrappleBeam_EndYSubOffset : CLC : ADC.W GrappleCollision_YQuarterSubVelocity : STA.W GrappleBeam_EndYSubOffset
    LDA.W GrappleBeam_EndYOffset : ADC.W GrappleCollision_YQuarterVelocity : STA.W GrappleBeam_EndYOffset
    LDA.W SamusXSubPosition : CLC : ADC.W GrappleBeam_EndXSubOffset : STA.W GrappleBeam_EndXSubPosition
    LDA.W SamusXPosition : ADC.W GrappleBeam_EndXOffset : CLC : ADC.W GrappleBeam_OriginXOffset : STA.W GrappleBeam_EndXPosition
    LDA.W SamusYSubPosition : CLC : ADC.W GrappleBeam_EndYSubOffset : STA.W GrappleBeam_EndYSubPosition
    LDA.W SamusYPosition : ADC.W GrappleBeam_EndYOffset : CLC : ADC.W GrappleBeam_OriginYOffset : STA.W GrappleBeam_EndYPosition
    JSL BlockGrappleReaction
    BVC .notConnected
    BCC .notConnected
    PHP
    LDA.W GrappleBeam_EndXPosition : AND.W #$FFF0 : ORA.W #$0008 : STA.W GrappleBeam_EndXPosition
    LDA.W GrappleBeam_EndYPosition : AND.W #$FFF0 : ORA.W #$0008 : STA.W GrappleBeam_EndYPosition
    PLP : PLB
    RTL

  .notConnected:
    DEC.W GrappleCollision_LoopCounter : BNE .loop
    PLB
    RTL


;;; $A91F: Block grapple reaction ;;;
BlockGrappleReaction:
;; Returns:
;;     Carry: Set if collision, otherwise clear
;;     Overflow: If carry set; set if connecting to block, clear if grapple beam cancelled
    PHB
    PHK : PLB
    LDA.W GrappleBeam_EndYPosition
    LSR #4
    SEP #$20
    STA.W $4202
    LDA.W RoomWidthBlocks : STA.W $4203
    REP #$20
    LDA.W GrappleBeam_EndXPosition : LSR #4 : CLC : ADC.W $4216 : STA.W CurrentBlockIndex
    ASL : TAX
    LDA.L LevelData,X : AND.W #$F000 : XBA : LSR #3 : TAX
    JSR.W (BlockGrappleReaction_Pointers,X)
    PLB
    RTL


;;; $A957: Calculate position from grapple beam end with distance and angle ;;;
CalculatePositionFromGrappleBeamEndWithDistanceAndAngle:
;; Parameters:
;;     GrappleCollision_EndAngleParam: Grapple beam end angle * 2
;;     GrappleCollision_XQuarterVelocity: Distance from grapple beam end
;; Returns:
;;     GrappleCollision_XPosition: X position
;;     GrappleCollision_YPosition: Y position
;;     GrappleCollision_XBlock: X block
;;     GrappleCollision_YBlock: Y block
    LDX.W GrappleCollision_EndAngleParam
    LDA.W GrappleBeam_Flags : BMI .grapplingEnemy
    LDA.L SineCosineTables_8bitSine_SignExtended,X : BMI .angleLessThan80
    LDA.W GrappleBeam_EndXPosition : AND.W #$FFF0 : ORA.W #$0008
    BRA +

  .angleLessThan80:
    LDA.W GrappleBeam_EndXPosition : AND.W #$FFF0 : ORA.W #$0007

+   STA.W GrappleBeam_EndXPosition
    LDA.L SineCosineTables_NegativeCosine_SignExtended,X : BMI .notBetween40_C0
    LDA.W GrappleBeam_EndYPosition : AND.W #$FFF0 : ORA.W #$0008
    BRA .setEndPosition

  .notBetween40_C0:
    LDA.W GrappleBeam_EndYPosition : AND.W #$FFF0 : ORA.W #$0007

  .setEndPosition:
    STA.W GrappleBeam_EndYPosition

  .grapplingEnemy:
    SEP #$20
    LDA.W GrappleCollision_XQuarterVelocity : STA.W $4202
    REP #$20
    LDA.L SineCosineTables_8bitSine_SignExtended,X : BMI .negative
    CMP.W #$0100 : BNE .not100
    LDA.W GrappleBeam_EndXPosition : CLC : ADC.W GrappleCollision_XQuarterVelocity
    BRA +

  .not100:
    SEP #$20
    STA.W $4203
    REP #$20
    NOP #2
    LDA.W $4216 : AND.W #$FF00 : XBA : CLC : ADC.W GrappleBeam_EndXPosition
    BRA +

  .negative:
    CMP.W #$FF00 : BNE .notFF00
    LDA.W GrappleBeam_EndXPosition : SEC : SBC.W GrappleCollision_XQuarterVelocity
    BRA +

  .notFF00:
    SEP #$20
    EOR.B #$FF : INC : STA.W $4203
    REP #$20
    NOP #2
    LDA.W $4216 : AND.W #$FF00 : XBA
    EOR.W #$FFFF : INC
    CLC : ADC.W GrappleBeam_EndXPosition

+   STA.W GrappleCollision_XPosition
    LSR #4 : AND.W #$00FF : STA.W GrappleCollision_XBlock
    LDA.L SineCosineTables_NegativeCosine_SignExtended,X : BMI .negativeAgain
    CMP.W #$0100 : BNE .not100again
    LDA.W GrappleBeam_EndYPosition : CLC : ADC.W GrappleCollision_XQuarterVelocity
    BRA +

  .not100again:
    SEP #$20
    STA.W $4203
    REP #$20
    NOP #2
    LDA.W $4216 : AND.W #$FF00 : XBA : CLC : ADC.W GrappleBeam_EndYPosition
    BRA +

  .negativeAgain:
    CMP.W #$FF00 : BNE .notFF00again
    LDA.W GrappleBeam_EndYPosition : SEC : SBC.W GrappleCollision_XQuarterVelocity
    BRA +

  .notFF00again:
    SEP #$20
    EOR.B #$FF : INC : STA.W $4203
    REP #$20
    NOP #2
    LDA.W $4216 : AND.W #$FF00 : XBA
    EOR.W #$FFFF : INC
    CLC : ADC.W GrappleBeam_EndYPosition

+   STA.W GrappleCollision_YPosition
    LSR #4 : AND.W #$00FF : STA.W GrappleCollision_YBlock
    RTS


;;; $AA64: Grapple swing collision reaction ;;;
GrappleSwingCollisionReaction:
;; Parameters:
;;     GrappleCollision_XBlock: X block
;;     GrappleCollision_YBlock: Y block
;; Returns:
;;     Carry: set if collision, clear otherwise
    SEP #$20
    LDA.W GrappleCollision_YBlock : STA.W $4202
    LDA.W RoomWidthBlocks : STA.W $4203
    REP #$21 ; clear carry
    LDA.W GrappleCollision_XBlock : ADC.W $4216 : STA.W CurrentBlockIndex
    ASL : TAX
    LDA.L LevelData,X : AND.W #$F000 : PHA
    PHX
    XBA : LSR #3 : TAX
    JSR.W (GrappleSwingCollisionReaction_Pointers,X)
    BCS .returnCollision
    PLX : PLA
    CLC
    RTS

  .returnCollision:
    PLX : PLA
    SEC
    RTS


;;; $AA9A: Clear carry ;;;
CLCRTS_94AA9A:
    CLC
    RTS


;;; $AA9C: Set carry ;;;
SECRTS_94AA9C:
    SEC
    RTS


;;; $AA9E: Grapple swing collision reaction - spike air ;;;
GrappleSwingCollisionReaction_SpikeAir:
;; Returns:
;;     Carry: Clear. No collision

; There's really no reason to have this reaction, the spike air inside reaction does this damage anyway
; Although you can set grapple swing specific damage here if you want...
    LDA.W SamusInvincibilityTimer : BNE .return
    LDX.W CurrentBlockIndex
    LDA.L BTS,X : BMI .return
    ASL : TAX
    LDA.W .zeroes0,X : ORA.W .zeroes1,X : BEQ .return
    LDA.W PeriodicSubDamage : CLC : ADC.W .zeroes0,X : STA.W PeriodicSubDamage ; >.<
    LDA.W PeriodicDamage : ADC.W .zeroes1,X : STA.W PeriodicDamage
    LDA.W #$003C : STA.W SamusInvincibilityTimer
    LDA.W #$000A : STA.W SamusKnockbackTimer

  .return:
    CLC
    RTS

  .zeroes0:
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000

  .zeroes1:
    dw $0000,$0000,$0010,$0000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000


;;; $AB17: Grapple swing collision reaction - spike block ;;;
GrappleSwingCollisionReaction_SpikeBlock:
;; Returns:
;;     Carry: Set. Unconditional collision
    LDA.W SamusInvincibilityTimer : BNE .return
    LDX.W CurrentBlockIndex
    LDA.L BTS,X : BMI .return
    ASL : TAX
    LDA.W .zeroes,X : ORA.W .damage,X : BEQ .return
    LDA.W PeriodicSubDamage : CLC : ADC.W .zeroes,X : STA.W PeriodicSubDamage ; >.<
    LDA.W PeriodicDamage : ADC.W .damage,X : STA.W PeriodicDamage
    LDA.W #$003C : STA.W SamusInvincibilityTimer
    LDA.W #$000A : STA.W SamusKnockbackTimer

  .return:
    SEC
    RTS

  .zeroes:
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000

  .damage:
    dw $003C,$0010,$0000,$0000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000


;;; $AB90: Grapple swing collision reaction pointers ;;;
GrappleSwingCollisionReaction_Pointers:
    dw CLCRTS_94AA9A                                                     ;  0: Air
    dw SECRTS_94AA9C                                                     ;  1: Slope
    dw GrappleSwingCollisionReaction_SpikeAir                            ; *2: Spike air
    dw CLCRTS_94AA9A                                                     ;  3: Special air
    dw CLCRTS_94AA9A                                                     ;  4: Shootable air
    dw BlockShotBombedGrappledCollisionInsideReaction_HorizontalExt      ; *5: Horizontal extension
    dw CLCRTS_94AA9A                                                     ;  6: Unused air
    dw CLCRTS_94AA9A                                                     ;  7: Bombable air
    dw SECRTS_94AA9C                                                     ;  8: Solid block
    dw SECRTS_94AA9C                                                     ;  9: Door block
    dw GrappleSwingCollisionReaction_SpikeBlock                          ; *Ah: Spike block
    dw SECRTS_94AA9C                                                     ;  Bh: Special block
    dw SECRTS_94AA9C                                                     ;  Ch: Shootable block
    dw BlockShotBombedGrappledCollisionInsideReaction_VerticalExt        ; *Dh: Vertical extension
    dw SECRTS_94AA9C                                                     ;  Eh: Grapple block
    dw SECRTS_94AA9C                                                     ;  Fh: Bombable block


;;; $ABB0: Grapple swing collision reaction ;;;
GrappleSwingCollisionReaction_duplicate:
; Clone of GrappleSwingCollisionReaction
    SEP #$20
    LDA.W GrappleCollision_YBlock : STA.W $4202
    LDA.W RoomWidthBlocks : STA.W $4203
    REP #$21 ; clear carry
    LDA.W GrappleCollision_XBlock : ADC.W $4216 : STA.W CurrentBlockIndex
    ASL : TAX
    LDA.L LevelData,X : AND.W #$F000 : PHA
    PHX
    XBA : LSR #3 : TAX
    JSR.W (GrappleSwingCollisionReaction_Pointers,X)
    BCS .returnCollision
    PLX : PLA
    CLC
    RTS

  .returnCollision:
    PLX : PLA
    SEC
    RTS


;;; $ABE6: Grapple swing collision detection due to swinging ;;;
GrappleSwingCollisionDetectionDueToSwinging:
;; Returns:
;;     Carry: set if collision, clear otherwise
;;     GrappleCollision_DistanceFromSamusFeet: Distance of grapple swing collision from Samus' feet. Unit 8px

; Checks 6(!) points along the 48px line projecting 8px beyond the grapple beam start position
    LDA.W #$0006 : STA.W GrappleCollision_DistanceFromSamusFeet
    LDA.W #$0008 : CLC : ADC.W GrappleBeam_Length : STA.W GrappleCollision_XQuarterVelocity

  .loop:
    JSR CalculatePositionFromGrappleBeamEndWithDistanceAndAngle
    JSR GrappleSwingCollisionReaction_duplicate
    BCS .return
    LDA.W GrappleCollision_XQuarterVelocity : CLC : ADC.W #$0008 : STA.W GrappleCollision_XQuarterVelocity
    DEC.W GrappleCollision_DistanceFromSamusFeet : BNE .loop
    CLC
    RTS

  .return:
    NOP ; >_<
    RTS


;;; $AC11: Update grapple beam start position during grapple swinging ;;;
UpdateGrappleBeamStartPositionDuringGrappleSwinging:
    LDA.W GrappleBeam_EndAngle+1 : AND.W #$00FF : ASL : STA.W GrappleCollision_EndAngleParam
    LDA.W GrappleBeam_Length : STA.W GrappleCollision_XQuarterVelocity
    JSR CalculatePositionFromGrappleBeamEndWithDistanceAndAngle
    LDA.W GrappleCollision_XPosition : STA.W GrappleBeam_StartXPosition
    LDA.W GrappleCollision_YPosition : STA.W GrappleBeam_StartYPosition
    RTL


;;; $AC31: Handle grapple beam length change ;;;
HandleGrappleBeamLengthChange:
    PHB
    PHK : PLB
    LDA.W GrappleBeam_LengthDelta : BNE .nonZeroLengthDelta
    JMP .returnCarryClear

  .nonZeroLengthDelta:
    BMI .positiveGrappleBeamLengthDelta
    JMP .increaseLength

  .positiveGrappleBeamLengthDelta:
    LDA.W GrappleBeam_Length : CLC : ADC.W GrappleBeam_LengthDelta : CMP.W #$0008 : BCS .greaterThanEqualTo8
    STZ.W GrappleBeam_LengthDelta
    LDA.W #$0008

  .greaterThanEqualTo8:
    STA.W GrappleCollision_TargetLength
    LDA.W #$0008 : STA.W GrappleCollision_SamusFrontBoundaryOffset
    LDA.W GrappleBeam_EndAngle+1 : AND.W #$00FF : ASL : STA.W GrappleCollision_EndAngleParam
    LDA.W GrappleBeam_Length : CMP.W GrappleCollision_TargetLength : BEQ .decreasedToTargetLength

  .decreaseLength:
    STA.W GrappleCollision_NewBeamLength
    DEC : CLC : ADC.W GrappleCollision_SamusFrontBoundaryOffset : STA.W GrappleCollision_XQuarterVelocity
    JSR CalculatePositionFromGrappleBeamEndWithDistanceAndAngle
    JSR GrappleSwingCollisionReaction
    BCS .collision
    DEC.W GrappleCollision_NewBeamLength
    LDA.W GrappleCollision_NewBeamLength : CMP.W GrappleCollision_TargetLength : BNE .decreaseLength

  .decreasedToTargetLength:
    LDA.W GrappleCollision_TargetLength : STA.W GrappleBeam_Length
    PLB
    CLC
    RTL

  .collision:
    LDA.W GrappleCollision_NewBeamLength : STA.W GrappleBeam_Length
    PLB
    SEC
    RTL

  .increaseLength:
    LDA.W GrappleBeam_Length : CLC : ADC.W GrappleBeam_LengthDelta : CMP.W #$003F : BCC .lessThan3F
    STZ.W GrappleBeam_LengthDelta
    LDA.W #$003F

  .lessThan3F:
    STA.W GrappleCollision_TargetLength
    LDA.W #$0038 : STA.W GrappleCollision_SamusFrontBoundaryOffset
    LDA.W GrappleBeam_EndAngle+1 : AND.W #$00FF : ASL : STA.W GrappleCollision_EndAngleParam
    LDA.W GrappleBeam_Length : CMP.W GrappleCollision_TargetLength : BEQ .increasedToTargetLength

  .loopIncreaseLength:
    STA.W GrappleCollision_NewBeamLength
    INC : CLC : ADC.W GrappleCollision_SamusFrontBoundaryOffset : STA.W GrappleCollision_XQuarterVelocity
    JSR CalculatePositionFromGrappleBeamEndWithDistanceAndAngle
    JSR GrappleSwingCollisionReaction
    BCS .collision
    INC.W GrappleCollision_NewBeamLength
    LDA.W GrappleCollision_NewBeamLength : CMP.W GrappleCollision_TargetLength : BNE .loopIncreaseLength

  .increasedToTargetLength:
    LDA.W GrappleCollision_TargetLength : STA.W GrappleBeam_Length
    PLB
    CLC
    RTL

; Unused copy+paste of .collision
    LDA.W GrappleCollision_NewBeamLength : STA.W GrappleBeam_Length ; dead code
    PLB
    SEC
    RTL

  .returnCarryClear:
    PLB
    CLC
    RTL


;;; $ACFE: Handle grapple beam swinging movement ;;;
HandleGrappleBeamSwingingMovement:
; The clockwise and anticlockwise branches are identical except for the INC/DEC in the loop >_>;
    PHB
    PHK : PLB
    LDY.W #$0100
    LDA.W GrappleBeam_Flags : BIT.W #$0001 : BEQ .nonLiquidPhysics
    LDY.W #$00A0

  .nonLiquidPhysics:
    LDA.W GrappleBeam_SwingAngularVelocity : CLC : ADC.W GrappleBeam_ExtraSwingAngularVelocity : BPL .preClockwise
    EOR.W #$FFFF : INC
    JSL A_Y_16bit_UnsignedMultiplication
    LDA.W MultiplicationResult+1 : EOR.W #$FFFF : INC : BEQ .gotoFailedMovement
    STA.W GrappleCollision_TotalSwingAngularVelocity
    JMP .anticlockwise

  .preClockwise:
    JSL A_Y_16bit_UnsignedMultiplication
    LDA.W MultiplicationResult+1 : BEQ .gotoFailedMovement
    STA.W GrappleCollision_TotalSwingAngularVelocity
    BRA .clockwise

  .gotoFailedMovement:
    JMP .failedMovement

  .clockwise:
    CLC : ADC.W GrappleBeam_EndAngle
    XBA : AND.W #$00FF : ASL : STA.W GrappleCollision_YQuarterVelocity
    LDA.W GrappleBeam_Length : STA.W GrappleCollision_XQuarterVelocity
    LDA.W GrappleBeam_EndAngle+1 : AND.W #$00FF : ASL : CMP.W GrappleCollision_YQuarterVelocity : BEQ ..reachedTarget

  ..loop:
    STA.W GrappleCollision_NewEndAngle
    INC #2 : AND.W #$01FF : STA.W GrappleCollision_EndAngleParam
    JSR GrappleSwingCollisionDetectionDueToSwinging
    BCS ..collision
    LDA.W GrappleCollision_NewEndAngle : INC #2 : AND.W #$01FF : CMP.W GrappleCollision_TargetEndAngle : BNE ..loop

  ..reachedTarget:
    LDA.W GrappleBeam_EndAngle : CLC : ADC.W GrappleCollision_TotalSwingAngularVelocity : STA.W GrappleBeam_EndAngle : STA.W GrappleBeam_EndAngleMirror
    LDA.W #$8000 : TRB.W GrappleBeam_SpecialAngleHandlingFlag
    DEC.W GrappleBeam_KickCooldownTimer : BPL +
    STZ.W GrappleBeam_KickCooldownTimer

+   LDA.W GrappleBeam_ExtraSwingAngularVelocity : BPL +
    CLC : ADC.W #$0006 : BPL ..zero
    BRA ..returnCarryClear

+   SEC : SBC.W #$0006 : BMI ..zero
    BRA ..returnCarryClear

  ..zero:
    LDA.W #$0000

  ..returnCarryClear:
    STA.W GrappleBeam_ExtraSwingAngularVelocity
    PLB
    CLC
    RTL

  ..collision:
    LDA.W GrappleCollision_NewEndAngle : LSR : AND.W #$00FF : XBA
    ORA.W #$0080 : STA.W GrappleBeam_EndAngle : STA.W GrappleBeam_EndAngleMirror
    LDA.W GrappleCollision_DistanceFromSamusFeet : CMP.W #$0006 : BEQ ..noBounce
    CMP.W #$0005 : BNE ..bounce

  ..noBounce:
    LDA.W GrappleBeam_Length : CMP.W #$0008 : BNE ..bounce
    LDA.W #$8000 : TSB.W GrappleBeam_SpecialAngleHandlingFlag
    STZ.W GrappleBeam_SwingAngularVelocity : STZ.W GrappleBeam_ExtraSwingAngularVelocity
    PLB
    SEC
    RTL

  ..bounce:
    LDA.W #$0010 : STA.W GrappleBeam_KickCooldownTimer
    LDA.W GrappleBeam_SwingAngularVelocity : ASL
    LDA.W GrappleBeam_SwingAngularVelocity : ROR
    EOR.W #$FFFF : INC : STA.W GrappleBeam_SwingAngularVelocity
    LDA.W GrappleBeam_ExtraSwingAngularVelocity : ASL
    LDA.W GrappleBeam_ExtraSwingAngularVelocity : ROR
    EOR.W #$FFFF : INC : STA.W GrappleBeam_ExtraSwingAngularVelocity
    PLB
    SEC
    RTL

  .anticlockwise:
    CLC : ADC.W GrappleBeam_EndAngle : XBA : AND.W #$00FF
    ASL : STA.W GrappleCollision_YQuarterVelocity
    LDA.W GrappleBeam_Length : STA.W GrappleCollision_XQuarterVelocity
    LDA.W GrappleBeam_EndAngle+1 : AND.W #$00FF : ASL : CMP.W GrappleCollision_YQuarterVelocity : BEQ ..reachedTarget

  ..loop:
    STA.W GrappleCollision_NewEndAngle
    DEC #2 : AND.W #$01FF : STA.W GrappleCollision_EndAngleParam
    JSR GrappleSwingCollisionDetectionDueToSwinging
    BCS ..collision
    LDA.W GrappleCollision_NewEndAngle : DEC #2 : AND.W #$01FF : CMP.W GrappleCollision_YQuarterVelocity : BNE ..loop

  ..reachedTarget:
    LDA.W GrappleBeam_EndAngle : CLC : ADC.W GrappleCollision_TotalSwingAngularVelocity : STA.W GrappleBeam_EndAngle : STA.W GrappleBeam_EndAngleMirror
    LDA.W #$8000 : TRB.W GrappleBeam_SpecialAngleHandlingFlag
    DEC.W GrappleBeam_KickCooldownTimer : BPL +
    STZ.W GrappleBeam_KickCooldownTimer

+   LDA.W GrappleBeam_ExtraSwingAngularVelocity : BPL +
    CLC : ADC.W #$0006 : BPL ..zero
    BRA ..returnCarryClear

+   SEC : SBC.W #$0006 : BMI ..zero
    BRA ..returnCarryClear

  ..zero:
    LDA.W #$0000

  ..returnCarryClear:
    STA.W GrappleBeam_ExtraSwingAngularVelocity
    PLB
    CLC
    RTL

  ..collision:
    LDA.W GrappleCollision_NewEndAngle : LSR : AND.W #$00FF : XBA
    ORA.W #$0080 : STA.W GrappleBeam_EndAngle : STA.W GrappleBeam_EndAngleMirror
    LDA.W GrappleCollision_DistanceFromSamusFeet : CMP.W #$0006 : BEQ +
    CMP.W #$0005 : BNE ..bounce

+   LDA.W GrappleBeam_Length : CMP.W #$0008 : BNE ..bounce
    LDA.W #$8000 : TSB.W GrappleBeam_SpecialAngleHandlingFlag
    STZ.W GrappleBeam_SwingAngularVelocity : STZ.W GrappleBeam_ExtraSwingAngularVelocity
    PLB
    SEC
    RTL

  ..bounce:
    LDA.W #$0010 : STA.W GrappleBeam_KickCooldownTimer
    LDA.W GrappleBeam_SwingAngularVelocity : ASL
    LDA.W GrappleBeam_SwingAngularVelocity : ROR
    EOR.W #$FFFF : INC : STA.W GrappleBeam_SwingAngularVelocity
    LDA.W GrappleBeam_ExtraSwingAngularVelocity : ASL
    LDA.W GrappleBeam_ExtraSwingAngularVelocity : ROR
    EOR.W #$FFFF : INC : STA.W GrappleBeam_ExtraSwingAngularVelocity
    PLB
    SEC
    RTL

  .failedMovement:
; Looks like RTL'd out code
    PLB
    CLC
    RTL

; This code would make Samus drop if she failed too many failed movements in a row (such as holding right from rest)
    LDA.W GrappleBeam_EndAngle : EOR.W GrappleBeam_SwingAngularVelocity : BMI ..rising ; dead code
    INC.W GrappleBeam_FailedSwingMovementCounter
    LDA.W GrappleBeam_FailedSwingMovementCounter : CMP.W #$0020 : BNE ..lessThan20
    LDA.W #GrappleBeamFunction_Dropped : STA.W GrappleBeam_Function

  ..lessThan20:
    STZ.W GrappleBeam_SwingAngularVelocity : STZ.W GrappleBeam_ExtraSwingAngularVelocity
    PLB
    SEC
    RTL

  ..rising:
    STZ.W GrappleBeam_FailedSwingMovementCounter
    PLB
    SEC
    RTL


;;; $AF0B: Clear carry ;;;
CLCRTL_94AF0B:
; Looks like RTL'd out code
; Either required a parameter X and the loop fixed, or there was supposed to be code to set X in the loop
; Appears to (try to) check for block collisions of the entire grapple beam, and drop grapple beam if so
    CLC
    RTL

    PHB ; dead code
    PHK : PLB
    LDA.W GrappleBeam_EndXPosition : LSR #4 : AND.W #$00FF : XBA : STA.W GrappleCollision_XBlock
    LDA.W GrappleBeam_EndYPosition : LSR #4 : AND.W #$00FF : XBA : STA.W GrappleCollision_YBlock
    LDA.W GrappleBeam_Length : LSR #4 : STA.W GrappleCollision_DistanceFromSamusFeet

  .loop:
    LDA.L SineCosineTables_NegativeCosine_SignExtended,X : CLC : ADC.W GrappleCollision_YBlock : STA.W GrappleCollision_YBlock
    XBA
    SEP #$20
    STA.W $4202
    LDA.W RoomWidthBlocks : STA.W $4203
    REP #$21 ; clear carry
    LDA.L SineCosineTables_8bitSine_SignExtended,X : ADC.W GrappleCollision_XBlock : STA.W GrappleCollision_XBlock
    AND.W #$FF00 : XBA : ADC.W $4216 : STA.W CurrentBlockIndex
    ASL : TAX
    LDA.L LevelData,X : AND.W #$F000 : XBA
    LSR #3 : TAX
    JSR.W (GrappleSwingCollisionReaction_Pointers,X)
    BCS +
    DEC.W GrappleCollision_DistanceFromSamusFeet : BPL .loop
    PLB
    CLC
    RTL

+   LDA.W #GrappleBeamFunction_Dropped : STA.W GrappleBeam_Function
    PLB
    SEC
    RTL


;;; $AF87: Initialise grapple segment animations ;;;
InitializeGrappleSegmentAnimations:
    LDX.W #$001E

  .loop:
    LDA.W #InstList_DrawGrappleBeam_GrappleSegmentAnimations_3 : STA.W GrappleBeam_SegmentAnimationInstructionListPointers,X
    LDA.W #InstList_DrawGrappleBeam_GrappleSegmentAnimations_2 : STA.W GrappleBeam_SegmentAnimationInstructionListPointers-2,X
    LDA.W #InstList_DrawGrappleBeam_GrappleSegmentAnimations_1 : STA.W GrappleBeam_SegmentAnimationInstructionListPointers-4,X
    LDA.W #InstList_DrawGrappleBeam_GrappleSegmentAnimations_0 : STA.W GrappleBeam_SegmentAnimationInstructionListPointers-6,X
    LDA.W #$0001 : STA.W GrappleBeam_SegmentAnimationInstructionTimers,X : STA.W GrappleBeam_SegmentAnimationInstructionTimers-2,X
    STA.W GrappleBeam_SegmentAnimationInstructionTimers-4,X : STA.W GrappleBeam_SegmentAnimationInstructionTimers-6,X
    TXA : SEC : SBC.W #$0008 : TAX : BPL .loop
    RTL


;;; $AFBA: Draw grapple beam ;;;
DrawGrappleBeam:
; Uses:
;     GrappleBeam_Length: Grapple beam length
;     GrappleBeam_EndXPosition: Grapple beam end X position
;     GrappleBeam_EndYPosition: Grapple beam end Y position
;     GrappleBeam_FlareXPosition: Grapple beam flare X position
;     GrappleBeam_FlareYPosition: Grapple beam flare Y position
;     GrappleBeam_SegmentAnimationInstructionTimers: Grapple segment animation instruction timers
;     GrappleBeam_SegmentAnimationInstructionListPointers: Grapple segment animation instruction list pointers

; Doesn't use [grapple beam end angle] except for unused calculation at $AFF7
    PHB
    PHK : PLB
    LDA.W GrappleBeam_EndXPosition : SEC : SBC.W GrappleBeam_FlareXPosition : STA.B DP_Temp12
    LDA.W GrappleBeam_EndYPosition : SEC : SBC.W GrappleBeam_FlareYPosition : STA.B DP_Temp14
    JSL CalculateAngleOf_12_14_Offset
    ASL : TAX
    STZ.B DP_Temp1A : STZ.B DP_Temp1C
    LDA.L SineCosineTables_8bitSine_SignExtended,X : ASL #3 : BPL +
    DEC.B DP_Temp1C

+   STA.B DP_Temp1B
    STZ.B DP_Temp1E : STZ.B DP_Temp20
    LDA.L SineCosineTables_NegativeCosine_SignExtended,X : ASL #3 : BPL +
    DEC.B DP_Temp20

+   STA.B DP_Temp1F
    LDA.W GrappleBeam_EndAngle : AND.W #$8000 : LSR : STA.B DP_Temp26
    EOR.W GrappleBeam_EndAngle : AND.W #$4000
    EOR.W #$4000 : ASL : ORA.B DP_Temp26 : STA.B DP_Temp26
    LDA.W GrappleBeam_FlareXPosition : SEC : SBC.W Layer1XPosition
    SEC : SBC.W #$0004 : STA.B DP_Temp14
    STZ.B DP_Temp12
    LDA.W GrappleBeam_FlareYPosition : SEC : SBC.W Layer1YPosition
    SEC : SBC.W #$0004 : STA.B DP_Temp18
    STZ.B DP_Temp16
    LDA.W GrappleBeam_Length : BMI .return
    STA.W $4204
    SEP #$20
    LDA.B #$08 : STA.W $4206
    REP #$20
    NOP #6
    LDA.W $4214 : BMI .return
    AND.W #$000F : SEC : SBC.W #$0001 : STA.B DP_Temp28
    LDX.W #$001E

  .loopAnimations:
    DEC.W GrappleBeam_SegmentAnimationInstructionTimers,X : BNE .processedInstructions
    LDY.W GrappleBeam_SegmentAnimationInstructionListPointers,X

  .loopInstructions:
    LDA.W $0000,Y : BPL .notInstruction
    STA.B DP_Temp24
    PEA .loopInstructions-1
    INY #2
    JMP.W (DP_Temp24)

  .notInstruction:
    STA.W GrappleBeam_SegmentAnimationInstructionTimers,X
    TYA : CLC : ADC.W #$0004 : STA.W GrappleBeam_SegmentAnimationInstructionListPointers,X

  .processedInstructions:
    LDA.B DP_Temp14 : ORA.B DP_Temp18 : AND.W #$FF00 : BNE +
    PHX
    LDY.W GrappleBeam_SegmentAnimationInstructionListPointers,X
    DEY #2
    LDA.W $0000,Y : TAY
    JSR DrawGrappleSegment
    PLX
    DEX #2
    DEC.B DP_Temp28 : BPL .loopAnimations

+   LDA.W Pose : CMP.W #$00B2 : BEQ .connectedEnd
    CMP.W #$00B3 : BEQ .connectedEnd
    JSR DrawGrappleBeamEnd_NotConnected
    BRA .return

  .connectedEnd:
    JSR DrawGrappleBeamEnd_Connected

  .return:
    PLB
    RTL


;;; $B0AA: Draw grapple segment ;;;
DrawGrappleSegment:
;; Parameters:
;;     Y: Tile number and attributes
;;     $14.$12: X position
;;     $18.$16: Y position
;;     $1C.$1A: Width
;;     $20.$1E: Height

; The branch at $B0C3 seems like it was supposed to be BEQ to set the high X position bit if X position >= 100h,
; but it checks $14 after the width is added, so that would need to be fixed too to make the dead code useful
; The X position is checked to be < 100h by callers, so there is no point in doing this check anyway
; Tldr, $B0C0..D2 can be eliminated entirely
    LDX.W OAMStack
    CLC ; >.<
    LDA.B DP_Temp14 : STA.W OAMLow,X
    LDA.B DP_Temp12 : CLC : ADC.B DP_Temp1A : STA.B DP_Temp12
    LDA.B DP_Temp14 : ADC.B DP_Temp1C : STA.B DP_Temp14
    AND.W #$0100
    BRA +

; Nothing points to this
    LDA.L MapOfOAMIndexToHighOAM_address,X : STA.B DP_Temp22 ; dead code
    LDA.B (DP_Temp22) : ORA.L MapOfOAMIndex_highXPosBit,X : STA.B (DP_Temp22)

+   LDA.B DP_Temp18 : STA.W OAMLow+1,X
    LDA.B DP_Temp16 : CLC : ADC.B DP_Temp1E : STA.B DP_Temp16
    LDA.B DP_Temp18 : ADC.B DP_Temp20 : STA.B DP_Temp18
    TYA : ORA.B DP_Temp26 : STA.W OAMLow+2,X
    TXA : CLC : ADC.W #$0004 : STA.W OAMStack
    RTS


;;; $B0F4: Instruction - go to [[Y]] ;;;
Instruction_DrawGrappleBeam_GotoY:
    LDA.W $0000,Y : TAY
    RTS


;;; $B0F9: Draw grapple beam end - not connected ;;;
DrawGrappleBeamEnd_NotConnected:
    LDA.W GrappleBeam_EndYPosition : SEC : SBC.W Layer1YPosition : BIT.W #$FF00 : BNE .return
    LDX.W OAMStack
    CLC ; >.<
    LDA.B DP_Temp14 ; >.<
    LDA.W GrappleBeam_EndXPosition : SEC : SBC.W Layer1XPosition
    SEC : SBC.W #$0004 : STA.W OAMLow,X
    AND.W #$0100 : BEQ +
    LDA.L MapOfOAMIndexToHighOAM_address,X : STA.B DP_Temp22
    LDA.B (DP_Temp22) : ORA.L MapOfOAMIndex_highXPosBit,X : STA.B (DP_Temp22)

+   LDA.B DP_Temp18 ; >_<
    LDA.W GrappleBeam_EndYPosition : SEC : SBC.W Layer1YPosition
    SEC : SBC.W #$0004 : STA.W OAMLow+1,X
    LDA.W #$3A20 : STA.W OAMLow+2,X
    TXA : CLC : ADC.W #$0004 : STA.W OAMStack

  .return:
    RTS


;;; $B14B: Draw grapple beam end - connected ;;;
DrawGrappleBeamEnd_Connected:
; Equivalent to DrawGrappleBeamEnd_NotConnected
    LDX.W OAMStack
    CLC ; >.<
    LDA.W GrappleBeam_EndXPosition : SEC : SBC.W Layer1XPosition : SBC.W #$0004 : STA.W OAMLow,X
    AND.W #$0100 : BEQ +
    LDA.L MapOfOAMIndexToHighOAM_address,X : STA.B DP_Temp22
    LDA.B (DP_Temp22) : ORA.L MapOfOAMIndex_highXPosBit,X : STA.B (DP_Temp22)

+   LDA.W GrappleBeam_EndYPosition : SEC : SBC.W Layer1YPosition : SBC.W #$0004 : STA.W OAMLow+1,X
    LDA.W #$3A20 : STA.W OAMLow+2,X
    TXA : CLC : ADC.W #$0004 : STA.W OAMStack
    RTS


;;; $B18B: Instruction lists - grapple segment animations ;;;
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


;;; $C800: Tiles - gunship liftoff dust clouds ;;;
Tiles_GunshipLiftoffDustClouds:
incbin "../data/Tiles_GunshipLiftoffDustClouds.bin" ; $1400 bytes


Freespace_Bank94_DC00:
; $1400 bytes

warnpc $94E000
; see bank_94..99.asm
