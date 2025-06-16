
org $878000


;;; $8000: Enable animated tiles objects ;;;
Enable_AnimatedTilesObjects:
    PHP
    REP #$20
    LDA.W #$8000 : TSB.W AnimatedTilesObject_Enable
    PLP
    RTL


;;; $800B: Disable animated tiles objects ;;;
Disable_AnimatedTilesObjects:
    PHP
    REP #$20
    LDA.W #$8000 : TRB.W AnimatedTilesObject_Enable
    PLP
    RTL


;;; $8016: Clear animated tiles objects ;;;
Clear_AnimatedTilesObjects:
    PHP
    REP #$30
    PHX
    LDX.W #$000A

  .loop:
    STZ.W AnimatedTilesObject_IDs,X
    DEX #2 : BPL .loop
    PLX : PLP
    RTL


;;; $8027: Spawn animated tiles object ;;;
Spawn_AnimatedTilesObject:
;; Parameter:
;;     Y: Animated tiles object ID
    PHP : PHB : PHX
    PHK : PLB
    LDX.W #$000A

  .loop:
    LDA.W AnimatedTilesObject_IDs,X : BEQ .found
    DEX #2 : BPL .loop
    PLX : PLB : PLP
    SEC
    RTL

  .found:
    TYA : STA.W AnimatedTilesObject_IDs,X
    STZ.W AnimatedTilesObject_Timers,X
    LDA.W $0000,Y : STA.W AnimatedTilesObject_InstListPointers,X
    STZ.W AnimatedTilesObject_SrcAddr,X
    LDA.W $0002,Y : STA.W AnimatedTilesObject_Sizes,X
    LDA.W $0004,Y : STA.W AnimatedTilesObject_VRAMAddr,X
    LDA.W #$0001 : STA.W AnimatedTilesObject_InstructionTimers,X
    PLX : PLB : PLP
    CLC
    RTL


;;; $8064: Animated tiles objects handler ;;;
AnimatedTilesObject_Handler:
    PHP : PHB
    PHK : PLB
    BIT.W AnimatedTilesObject_Enable : BPL .return
    LDX.W #$000A

  .loop:
    STX.W AnimatedTilesObject_Index
    LDA.W AnimatedTilesObject_IDs,X : BEQ .next
    JSR Process_AnimatedTilesObject
    LDX.W AnimatedTilesObject_Index

  .next:
    DEX #2 : BPL .loop

  .return:
    PLB : PLP
    RTL


;;; $8085: Process animated tiles object ;;;
Process_AnimatedTilesObject:
; Some instructions (e.g. delete) pop the return address pushed to the stack by $809A to return out of *this* routine
; (marked "terminate processing animated tiles object")
    LDX.W AnimatedTilesObject_Index
    DEC.W AnimatedTilesObject_InstructionTimers,X : BNE .return
    LDY.W AnimatedTilesObject_InstListPointers,X

  .loop:
    LDA.W $0000,Y : BPL .notInstruction
    STA.W AnimatedTilesObject_Instruction
    INY #2
    PEA .loop-1
    JMP.W (AnimatedTilesObject_Instruction)

  .notInstruction:
    STA.W AnimatedTilesObject_InstructionTimers,X
    LDA.W $0002,Y : STA.W AnimatedTilesObject_SrcAddr,X
    TYA : CLC : ADC.W #$0004 : STA.W AnimatedTilesObject_InstListPointers,X

  .return:
    RTS


;;; $80B2: Instruction - delete ;;;
Instruction_AnimatedTilesObject_Delete:
;; Parameters:
;;     X: Animated tiles object index
    STZ.W AnimatedTilesObject_IDs,X
    PLA
    RTS


;;; $80B7: Instruction - go to [[Y]] ;;;
Instruction_AnimatedTilesObject_GotoY:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W $0000,Y : TAY
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $80BC: Unused. Instruction - go to [Y] + ±[[Y]] ;;;
UNUSED_Instruction_AnimatedTilesObject_GotoYPlusY_8780BC:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    STY.W AnimatedTilesObject_Instruction
    DEY
    LDA.W $0000,Y : XBA : BMI .highByte
    AND.W #$00FF
    BRA +

  .highByte:
    ORA.W #$FF00

+   CLC : ADC.W AnimatedTilesObject_Instruction : TAY
    RTS


;;; $80D4: Unused. Instruction - decrement timer and go to [[Y]] if non-zero ;;;
UNUSED_Inst_AnimTilesObject_DecTimer_GotoYIfNonZero_8780D4:
;; Parameters:
;;     X: Animated tiles object index
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    DEC.W AnimatedTilesObject_Timers,X : BNE Instruction_AnimatedTilesObject_GotoY
    INY #2
    RTS


;;; $80DC: Unused. Instruction - decrement timer and go to [Y] + ±[[Y]] if non-zero ;;;
UNUSED_Inst_AnimTilesObject_DecTimer_GotoYPlusYIfNon0_8780DC:
;; Parameters:
;;     X: Animated tiles object index
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    DEC.W AnimatedTilesObject_Timers,X : BNE UNUSED_Instruction_AnimatedTilesObject_GotoYPlusY_8780BC
    INY
    RTS


;;; $80E3: Unused. Instruction - timer = [[Y]] ;;;
UNUSED_Instruction_AnimatedTilesObject_TimerInY_8780E3:
;; Parameters:
;;     X: Animated tiles object index
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    SEP #$20
    LDA.W $0000,Y : STA.W AnimatedTilesObject_Timers,X
    REP #$20
    INY
    RTS


;;; $80EF: Unused. RTS ;;;
UNUSED_RTS_8780EF:
    RTS


;;; $80F0: Unused. Instruction - queue music track [[Y]] ;;;
UNUSED_Instruction_AnimatedTilesObject_QueueMusicTrackInY:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W $0000,Y : AND.W #$00FF
    JSL QueueMusicDataOrTrack_8FrameDelay
    INY
    RTS


;;; $80FC: Unused. Instruction - queue sound [[Y]], sound library 1, max queued sounds allowed = 6 ;;;
UNUSED_Inst_AnimTilesObject_QueueSoundInY_Lib1_Max6_8780FC:
    LDA.W $0000,Y : AND.W #$00FF
    JSL QueueSound_Lib1_Max6
    INY
    RTS


;;; $8108: Unused. Instruction - queue sound [[Y]], sound library 2, max queued sounds allowed = 6 ;;;
UNUSED_Inst_AnimTilesObject_QueueSoundInY_Lib2_Max6_878108:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W $0000,Y : AND.W #$00FF
    JSL QueueSound_Lib2_Max6
    INY
    RTS


;;; $8114: Unused. Instruction - queue sound [[Y]], sound library 3, max queued sounds allowed = 6 ;;;
UNUSED_Inst_AnimTilesObject_QueueSoundInY_Lib3_Max6_878114:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W $0000,Y : AND.W #$00FF
    JSL QueueSound_Lib3_Max6
    INY
    RTS


;;; $8120: Unused. Instruction - go to [[Y] + 1] if any of the boss bits [[Y]] are set ;;;
UNUSED_Inst_AnimTilesObject_GotoYIfBossBitsInYSet_878120:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W $0000,Y
    INY
    AND.W #$00FF
    JSL CheckIfBossBitsForCurrentAreaMatchAnyBitsInA
    BCC .notSet
    JMP Instruction_AnimatedTilesObject_GotoY

  .notSet:
    INY #2
    RTS


;;; $8133: Unused. Instruction - set the boss bits [[Y]] ;;;
UNUSED_Instruction_AnimatedTilesObject_SetBossBitsY_878133:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W $0000,Y : AND.W #$00FF
    JSL SetBossBitsInAForCurrentArea
    INY
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $813F: Instruction - go to [[Y] + 2] if the event [[Y]] is set ;;;
Instruction_AnimatedTilesObject_GotoYIfEventYSet:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W $0000,Y
    INY #2
    JSL CheckIfEvent_inA_HasHappened
    BCC .notSet
    JMP Instruction_AnimatedTilesObject_GotoY

  .notSet:
    INY #2
    RTS


;;; $8150: Instruction - set event [[Y]] ;;;
Instruction_AnimatedTilesObject_SetEventY:
    LDA.W $0000,Y
    JSL MarkEvent_inA
    INY #2
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $815A: Unused. Instruction - lock Samus ;;;
UNUSED_Instruction_AnimatedTilesObject_LockSamus_87815A:
    LDA.W #$0000
    JSL Run_Samus_Command
    RTS


UNUSED_Instruction_AnimatedTilesObject_UnlockSamus_878162:
;;; $8162: Unused. Instruction - unlock Samus ;;;
    LDA.W #$0001
    JSL Run_Samus_Command
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $816A: Instruction list - animated tiles object $8251 (all areas 1 - vertical spikes) ;;;
InstList_AnimatedTilesObject_VerticalSpikes:
    dw $0008,AnimatedTiles_VerticalSpikes_0
    dw $0008,AnimatedTiles_VerticalSpikes_1
    dw $0008,AnimatedTiles_VerticalSpikes_2
    dw $0008,AnimatedTiles_VerticalSpikes_1
    dw Instruction_AnimatedTilesObject_GotoY
    dw InstList_AnimatedTilesObject_VerticalSpikes


;;; $817E: Instruction list - animated tiles object $8257 (all areas 2 - horizontal spikes) ;;;
InstList_AnimatedTilesObject_HorizontalSpikes:
    dw $0008,AnimatedTiles_HorizontalSpikes_0
    dw $0008,AnimatedTiles_HorizontalSpikes_1
    dw $0008,AnimatedTiles_HorizontalSpikes_2
    dw $0008,AnimatedTiles_HorizontalSpikes_1
    dw Instruction_AnimatedTilesObject_GotoY
    dw InstList_AnimatedTilesObject_HorizontalSpikes


;;; $8192: Instruction list - animated tiles object $825D (Crateria 4 - Crateria lake) ;;;
InstList_AnimatedTilesObject_CrateriaLake:
    dw $000A,AnimatedTiles_CrateriaLake_0
    dw $000A,AnimatedTiles_CrateriaLake_1
    dw $000A,AnimatedTiles_CrateriaLake_2
    dw $000A,AnimatedTiles_CrateriaLake_1
    dw Instruction_AnimatedTilesObject_GotoY
    dw InstList_AnimatedTilesObject_CrateriaLake


;;; $81A6: Instruction list - animated tiles object $8263/$8269 (Crateria 8 - unused Crateria lava) ;;;
UNUSED_InstList_AnimatedTilesObject_CrateriaLava_8781A6:
    dw $000A,UNUSED_AnimatedTiles_CrateriaLava_0_878B64
    dw $000A,UNUSED_AnimatedTiles_CrateriaLava_1_878C24
    dw $000A,UNUSED_AnimatedTiles_CrateriaLava_2_878CE4
    dw $000A,UNUSED_AnimatedTiles_CrateriaLava_3_878DA4
    dw Instruction_AnimatedTilesObject_GotoY
    dw UNUSED_InstList_AnimatedTilesObject_CrateriaLava_8781A6


;;; $81BA: Instruction - wait until area boss is dead ;;;
Instruction_AnimatedTilesObject_WaitUntilAreaBossIsDead:
;; Parameters:
;;     X: Animated tiles object index
    LDA.W #$0001
    JSL CheckIfBossBitsForCurrentAreaMatchAnyBitsInA
    BCS .return
    PLA
    LDA.W #$0001 : STA.W AnimatedTilesObject_InstructionTimers,X

  .return:
    RTS


;;; $81CB: Instruction list - animated tiles object $826F (Wrecked Ship 10h - Wrecked Ship screen) ;;;
InstList_AnimatedTilesObject_WreckedShipScreen_0:
    dw Instruction_AnimatedTilesObject_WaitUntilAreaBossIsDead

InstList_AnimatedTilesObject_WreckedShipScreen_1:
    dw $000A,AnimatedTiles_WreckedShipScreen_0
    dw $000A,AnimatedTiles_WreckedShipScreen_1
    dw $000A,AnimatedTiles_WreckedShipScreen_2
    dw $000A,AnimatedTiles_WreckedShipScreen_1
    dw Instruction_AnimatedTilesObject_GotoY
    dw InstList_AnimatedTilesObject_WreckedShipScreen_1


;;; $81E1: Instruction list - animated tiles object $8275 (Wrecked Ship 4 - Wrecked Ship treadmill - rightwards) ;;;
InstList_AnimTilesObject_WreckedShipTreadmill_Rightwards_0:
    dw Instruction_AnimatedTilesObject_WaitUntilAreaBossIsDead

InstList_AnimTilesObject_WreckedShipTreadmill_Rightwards_1:
    dw $0001,AnimatedTiles_WreckedShipTreadmill_0
    dw $0001,AnimatedTiles_WreckedShipTreadmill_1
    dw $0001,AnimatedTiles_WreckedShipTreadmill_2
    dw $0001,AnimatedTiles_WreckedShipTreadmill_3
    dw Instruction_AnimatedTilesObject_GotoY
    dw InstList_AnimTilesObject_WreckedShipTreadmill_Rightwards_1


;;; $81F7: Instruction list - animated tiles object $827B (Wrecked Ship 8 - Wrecked Ship treadmill - leftwards) ;;;
InstList_AnimTilesObject_WreckedShipTreadmill_Leftwards_0:
    dw Instruction_AnimatedTilesObject_WaitUntilAreaBossIsDead

InstList_AnimTilesObject_WreckedShipTreadmill_Leftwards_1:
    dw $0001,AnimatedTiles_WreckedShipTreadmill_3
    dw $0001,AnimatedTiles_WreckedShipTreadmill_2
    dw $0001,AnimatedTiles_WreckedShipTreadmill_1
    dw $0001,AnimatedTiles_WreckedShipTreadmill_0
    dw Instruction_AnimatedTilesObject_GotoY
    dw InstList_AnimTilesObject_WreckedShipTreadmill_Leftwards_1


;;; $820D: Instruction list - animated tiles object $8281 (Brinstar 4 - Brinstar plant) ;;;
InstList_AnimatedTilesObject_BrinstarPlant:
    dw $0010,AnimatedTiles_BrinstarMouth_0
    dw $0010,AnimatedTiles_BrinstarMouth_1
    dw $0010,AnimatedTiles_BrinstarMouth_2
    dw $0010,AnimatedTiles_BrinstarMouth_1
    dw Instruction_AnimatedTilesObject_GotoY
    dw InstList_AnimatedTilesObject_BrinstarPlant


;;; $8221: Instruction list - animated tiles object $8287 (Maridia 4 - Maridia sand ceiling) ;;;
InstList_AnimatedTilesObject_MaridiaSandCeiling:
    dw $000A,AnimatedTiles_MaridiaSandCeiling_0
    dw $000A,AnimatedTiles_MaridiaSandCeiling_1
    dw $000A,AnimatedTiles_MaridiaSandCeiling_2
    dw $000A,AnimatedTiles_MaridiaSandCeiling_3
    dw Instruction_AnimatedTilesObject_GotoY
    dw InstList_AnimatedTilesObject_MaridiaSandCeiling


;;; $8235: Instruction list - animated tiles object $828D (Maridia 8 - Maridia sand falling) ;;;
InstList_AnimatedTilesObject_MaridiaSandFalling:
    dw $000A,AnimatedTiles_MaridiaSandFalling_0
    dw $000A,AnimatedTiles_MaridiaSandFalling_1
    dw $000A,AnimatedTiles_MaridiaSandFalling_2
    dw $000A,AnimatedTiles_MaridiaSandFalling_3
    dw Instruction_AnimatedTilesObject_GotoY
    dw InstList_AnimatedTilesObject_MaridiaSandFalling


;;; $8249: Instruction list - animated tiles object $824B (nothing) ;;;
InstList_AnimatedTilesObject_Nothing:
    dw Instruction_AnimatedTilesObject_Delete


;;; $824B: Animated tiles objects - FX ;;;
; Instruction list, size, VRAM address
AnimatedTilesObjects_FX_nothing:
    dw InstList_AnimatedTilesObject_Nothing
    dw $0000,$0000

AnimatedTilesObjects_FX_verticalSpikes:
; All areas 1 - vertical spikes
    dw InstList_AnimatedTilesObject_VerticalSpikes
    dw $0080,$3880

AnimatedTilesObjects_FX_horizontalSpikes:
; All areas 2 - horizontal spikes
    dw InstList_AnimatedTilesObject_HorizontalSpikes
    dw $0080,$3D60

AnimatedTilesObjects_FX_crateriaLake:
; Crateria 4 - Crateria lake
    dw InstList_AnimatedTilesObject_CrateriaLake
    dw $0200,$1B00

UNUSED_AnimatedTilesObjects_FX_unusedCrateriaLava_0_878263:
; Crateria 8 - unused Crateria lava
    dw UNUSED_InstList_AnimatedTilesObject_CrateriaLava_8781A6
    dw $00C0,$0A00

if !FEATURE_KEEP_UNREFERENCED
UNUSED_AnimatedTilesObjects_FX_unusedCrateriaLava_1_878269:
; Unused. Crateria lava
    dw UNUSED_InstList_AnimatedTilesObject_CrateriaLava_8781A6
    dw $00C0,$0640
endif ; !FEATURE_KEEP_UNREFERENCED

AnimatedTilesObjects_FX_wreckedShipScreen:
; Wrecked Ship 10h - Wrecked Ship screen
    dw InstList_AnimatedTilesObject_WreckedShipScreen_0
    dw $0080,$19C0

AnimatedTilesObjects_FX_wreckedShipTreadmillRightwards:
; Wrecked Ship 4 - Wrecked Ship treadmill - rightwards
    dw InstList_AnimTilesObject_WreckedShipTreadmill_Rightwards_0
    dw $0020,$00E0

AnimatedTilesObjects_FX_wreckedShipTreadmillLeftwards:
; Wrecked Ship 8 - Wrecked Ship treadmill - leftwards
    dw InstList_AnimTilesObject_WreckedShipTreadmill_Leftwards_0
    dw $0020,$00E0

AnimatedTilesObjects_FX_brinstarMouth:
; Brinstar 4 - Brinstar plant
    dw InstList_AnimatedTilesObject_BrinstarPlant
    dw $00E0,$0410

AnimatedTilesObjects_FX_maridiaSandCeiling:
; Maridia 4 - Maridia sand ceiling
    dw InstList_AnimatedTilesObject_MaridiaSandCeiling
    dw $0040,$1000

AnimatedTilesObjects_FX_maridiaSandFalling:
; Maridia 8 - Maridia sand falling
    dw InstList_AnimatedTilesObject_MaridiaSandFalling
    dw $0020,$1020


;;; $8293: Instruction list - animated tiles object $82AB (lava) ;;;
InstList_AnimatedTilesObject_Lava:
    dw $000D,AnimatedTiles_Lava_0
    dw $000D,AnimatedTiles_Lava_1
    dw $000D,AnimatedTiles_Lava_2
    dw $000D,AnimatedTiles_Lava_3
    dw $000D,AnimatedTiles_Lava_4
    dw Instruction_AnimatedTilesObject_GotoY
    dw InstList_AnimatedTilesObject_Lava


;;; $82AB: Animated tiles object - lava ;;;
AnimatedTilesObject_Lava:
    dw InstList_AnimatedTilesObject_Lava
    dw $0040,$4280


;;; $82B1: Instruction list - animated tiles object $82C9 (acid) ;;;
InstList_AnimatedTilesObject_Acid:
    dw $000A,AnimatedTiles_Acid_0
    dw $000A,AnimatedTiles_Acid_1
    dw $000A,AnimatedTiles_Acid_2
    dw $000A,AnimatedTiles_Acid_3
    dw $000A,AnimatedTiles_Acid_4
    dw Instruction_AnimatedTilesObject_GotoY
    dw InstList_AnimatedTilesObject_Acid


;;; $82C9: Animated tiles object - acid ;;;
AnimatedTilesObject_Acid:
    dw InstList_AnimatedTilesObject_Acid
    dw $0040,$4280


;;; $82CF: Instruction list - animated tiles object $82E7 (rain) ;;;
InstList_AnimatedTilesObject_Rain:
    dw $000A,AnimatedTiles_Rain_0
    dw $000A,AnimatedTiles_Rain_1
    dw $000A,AnimatedTiles_Rain_2
    dw $000A,AnimatedTiles_Rain_3
    dw $000A,AnimatedTiles_Rain_4
    dw Instruction_AnimatedTilesObject_GotoY
    dw InstList_AnimatedTilesObject_Rain


;;; $82E7: Animated tiles object - rain ;;;
AnimatedTilesObject_Rain:
    dw InstList_AnimatedTilesObject_Rain
    dw $0050,$4280


;;; $82ED: Instruction list - animated tiles object $82FD (spores) ;;;
InstList_AnimatedTilesObject_Spores:
    dw $000A,AnimatedTiles_Spores_0
    dw $000A,AnimatedTiles_Spores_1
    dw $000A,AnimatedTiles_Spores_2
    dw Instruction_AnimatedTilesObject_GotoY
    dw InstList_AnimatedTilesObject_Spores


;;; $82FD: Animated tiles object - spores ;;;
AnimatedTilesObject_Spores:
    dw InstList_AnimatedTilesObject_Spores
    dw $0030,$4280


;;; $8303: Instruction - go to [[Y] + 2] if any of the boss bits [[Y]] for area [[Y] + 1] are set ;;;
Instruction_AnimTilesObject_GotoYIfAnyBossBitsYSetForAreaY:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    PHX
    LDA.W $0001,Y : AND.W #$00FF : TAX
    LDA.L SRAMMirror_Boss,X
    PLX
    AND.W $0000,Y
    INY #2
    AND.W #$00FF : BEQ .notSet
    JMP Instruction_AnimatedTilesObject_GotoY

  .notSet:
    INY #2
    RTS


;;; $8320: Instruction - spawn Tourian entrance statue eye glow enemy projectile with parameter [[Y]] ;;;
Instruction_AnimTilesObject_SpawnTourianStatueEyeGlowParamY:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    PHY
    LDA.W $0000,Y
    LDY.W #EnemyProjectile_TourianStatueEyeGlow
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    PLY : INY #2
    RTS


;;; $832F: Instruction - spawn Tourian entrance statue's soul enemy projectile with parameter [[Y]] ;;;
Instruction_AnimTilesObject_SpawnTourianStatuesSoulParamY:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    PHY
    LDA.W $0000,Y
    LDY.W #EnemyProjectile_TourianStatueSoul
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    PLY
    INY #2
    RTS


;;; $833E: Instruction - go to [[Y]] if Tourian entrance statue is busy releasing lock ;;;
Instruction_AnimatedTilesObject_GotoYIfTourianStatueBusy:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W TourianStatueAnimationState : BPL .notBusy
    JMP Instruction_AnimatedTilesObject_GotoY

  .notBusy:
    INY #2
    RTS


;;; $8349: Instruction - Tourian entrance statue animation state |= [[Y]] ;;;
Instruction_AnimatedTilesObject_TourianStatueSetAnimStateY:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W $0000,Y : TSB.W TourianStatueAnimationState
    INY #2
    RTS


;;; $8352: Instruction - Tourian entrance statue animation state &= ~[[Y]] ;;;
Instruction_AnimatedTilesObject_TourianStatueResetAnimStateY:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    LDA.W $0000,Y : TRB.W TourianStatueAnimationState
    INY #2
    RTS


;;; $835B: Instruction - clear 3 colours of palette data at $7E:C000 + [[Y]] ;;;
Instruction_AnimatedTilesObject_Clear3ColorsOfPaletteData:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    PHX
    LDX.W $0000,Y
    LDA.W #$0000 : STA.L Palettes_MainBackdrop,X
    STA.L Palettes_BG3P0AcidHighlight,X : STA.L Palettes_BG3P0AcidBubbles,X
    PLX
    INY #2
    RTS


;;; $8372: Instruction - spawn palette FX object [[Y]] ;;;
Instruction_AnimatedTilesObject_SpawnPaletteFXObjectInY:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    PHY
    LDA.W $0000,Y : TAY
    JSL Spawn_PaletteFXObject
    PLY : INY #2
    RTS


;;; $837F: Instruction - write 8 colours of target palette data to $7E:C200 + [[Y]] ;;;
Instruction_AnimatedTilesObject_Write8ColorsOfTargetPaletteD:
;; Parameters:
;;     Y: Pointer to instruction arguments
;; Returns:
;;     Y: Pointer to next instruction
    PHX : PHY
    LDX.W $0000,Y
    LDY.W #$0000

  .loop:
    LDA.W .palleteData,Y : STA.L TargetPalettes_BGP0,X
    INX #2
    INY #2 : CPY.W #$0010 : BNE .loop
    PLY : PLX
    INY #2
    RTS

  .palleteData:
    dw $3800,$7F58,$6ED5,$5A71,$49EE,$356A,$24E7,$1083


;;; $83AC: Instruction list - animated tiles object $854C (Tourian entrance statue - Phantoon) ;;;
InstList_AnimatedTilesObject_TourianStatuePhantoon:
    dw Instruction_AnimatedTilesObject_TourianStatueSetAnimStateY,$0001
    dw Instruction_AnimatedTilesObject_GotoYIfEventYSet,$0006
    dw InstList_AnimatedTilesObject_TourianStatuePhantoon_grey
    dw $0006,AnimatedTiles_PhantoonStatue_0

InstList_AnimatedTilesObject_TourianStatuePhantoon_loop:
    dw $000C,AnimatedTiles_PhantoonStatue_1
    dw $000C,AnimatedTiles_PhantoonStatue_2
    dw $000C,AnimatedTiles_PhantoonStatue_1
    dw $0010,AnimatedTiles_PhantoonStatue_0
    dw Instruction_AnimTilesObject_GotoYIfAnyBossBitsYSetForAreaY
    db $01,$03
    dw InstList_AnimatedTilesObject_TourianStatuePhantoon_dead
    dw Instruction_AnimatedTilesObject_TourianStatueResetAnimStateY,$0001
    dw Instruction_AnimatedTilesObject_GotoY
    dw InstList_AnimatedTilesObject_TourianStatuePhantoon_loop

InstList_AnimatedTilesObject_TourianStatuePhantoon_dead:
    dw Instruction_AnimatedTilesObject_GotoYIfTourianStatueBusy
    dw InstList_AnimatedTilesObject_TourianStatuePhantoon_loop
    dw Instruction_AnimatedTilesObject_TourianStatueSetAnimStateY,$8000
    dw Instruction_AnimatedTilesObject_Clear3ColorsOfPaletteData,$0158
    dw $0010,AnimatedTiles_PhantoonStatue_1
    dw $0010,AnimatedTiles_PhantoonStatue_2
    dw Instruction_AnimTilesObject_SpawnTourianStatueEyeGlowParamY,$0000
    dw $00C0,AnimatedTiles_PhantoonStatue_Other
    dw Instruction_AnimTilesObject_SpawnTourianStatuesSoulParamY,$0000
    dw Instruction_AnimatedTilesObject_SpawnPaletteFXObjectInY
    dw PaletteFXObjects_GreyOutTourianStatue_Phantoon
    dw $0080,AnimatedTiles_PhantoonStatue_Other
    dw Instruction_AnimatedTilesObject_SetEventY,$0006
    dw Instruction_AnimatedTilesObject_TourianStatueResetAnimStateY,$8001
    dw Instruction_AnimatedTilesObject_Delete

InstList_AnimatedTilesObject_TourianStatuePhantoon_grey:
    dw Instruction_AnimatedTilesObject_TourianStatueResetAnimStateY,$8001
    dw Instruction_AnimatedTilesObject_Write8ColorsOfTargetPaletteD,$0140
    dw Instruction_AnimatedTilesObject_Delete


;;; $8414: Instruction list - animated tiles object $8552 (Tourian entrance statue - Ridley) ;;;
InstList_AnimatedTilesObject_TourianStatueRidley:
    dw Instruction_AnimatedTilesObject_TourianStatueSetAnimStateY,$0002
    dw Instruction_AnimatedTilesObject_GotoYIfEventYSet,$0007
    dw InstList_AnimatedTilesObject_TourianStatueRidley_grey
    dw $000A,AnimatedTiles_RidleyStatue_0

InstList_AnimatedTilesObject_TourianStatueRidley_loopWait:
    dw $000C,AnimatedTiles_RidleyStatue_1
    dw $000C,AnimatedTiles_RidleyStatue_2
    dw $000C,AnimatedTiles_RidleyStatue_1
    dw $0010,AnimatedTiles_RidleyStatue_0
    dw Instruction_AnimTilesObject_GotoYIfAnyBossBitsYSetForAreaY
    db $01,$02
    dw InstList_AnimatedTilesObject_TourianStatueRidley_dead
    dw Instruction_AnimatedTilesObject_TourianStatueResetAnimStateY,$0002
    dw Instruction_AnimatedTilesObject_GotoY
    dw InstList_AnimatedTilesObject_TourianStatueRidley_loopWait

InstList_AnimatedTilesObject_TourianStatueRidley_dead:
    dw Instruction_AnimatedTilesObject_GotoYIfTourianStatueBusy
    dw InstList_AnimatedTilesObject_TourianStatueRidley_loopWait
    dw Instruction_AnimatedTilesObject_TourianStatueSetAnimStateY,$8000
    dw Instruction_AnimatedTilesObject_Clear3ColorsOfPaletteData,$0132
    dw $0010,AnimatedTiles_RidleyStatue_1
    dw $0010,AnimatedTiles_RidleyStatue_2
    dw Instruction_AnimTilesObject_SpawnTourianStatueEyeGlowParamY,$0002
    dw $00C0,AnimatedTiles_RidleyStatue_Other
    dw Instruction_AnimTilesObject_SpawnTourianStatuesSoulParamY,$0002
    dw Instruction_AnimatedTilesObject_SpawnPaletteFXObjectInY
    dw PaletteFXObjects_GreyOutTourianStatue_Ridley
    dw $0080,AnimatedTiles_RidleyStatue_Other
    dw Instruction_AnimatedTilesObject_SetEventY,$0007
    dw Instruction_AnimatedTilesObject_TourianStatueResetAnimStateY,$8002
    dw Instruction_AnimatedTilesObject_Delete

InstList_AnimatedTilesObject_TourianStatueRidley_grey:
    dw Instruction_AnimatedTilesObject_TourianStatueResetAnimStateY,$8002
    dw Instruction_AnimatedTilesObject_Write8ColorsOfTargetPaletteD,$0120
    dw Instruction_AnimatedTilesObject_Delete


;;; $847C: Instruction list - animated tiles object $8558 (Tourian entrance statue - Kraid) ;;;
InstList_AnimatedTilesObject_TourianStatueKraid:
    dw Instruction_AnimatedTilesObject_TourianStatueSetAnimStateY,$0004
    dw Instruction_AnimatedTilesObject_GotoYIfEventYSet,$0009
    dw InstList_AnimatedTilesObject_TourianStatueKraid_grey
    dw $0004,AnimatedTiles_KraidStatue_0

InstList_AnimatedTilesObject_TourianStatueKraid_loopWait:
    dw $000C,AnimatedTiles_KraidStatue_1
    dw $000C,AnimatedTiles_KraidStatue_2
    dw $000C,AnimatedTiles_KraidStatue_1
    dw $0010,AnimatedTiles_KraidStatue_0
    dw Instruction_AnimTilesObject_GotoYIfAnyBossBitsYSetForAreaY
    db $01,$01
    dw InstList_AnimatedTilesObject_TourianStatueKraid_dead
    dw Instruction_AnimatedTilesObject_TourianStatueResetAnimStateY,$0004
    dw Instruction_AnimatedTilesObject_GotoY
    dw InstList_AnimatedTilesObject_TourianStatueKraid_loopWait

InstList_AnimatedTilesObject_TourianStatueKraid_dead:
    dw Instruction_AnimatedTilesObject_GotoYIfTourianStatueBusy
    dw InstList_AnimatedTilesObject_TourianStatueKraid_loopWait
    dw Instruction_AnimatedTilesObject_TourianStatueSetAnimStateY,$8000
    dw Instruction_AnimatedTilesObject_Clear3ColorsOfPaletteData,$00F8
    dw $0010,AnimatedTiles_KraidStatue_1
    dw $0010,AnimatedTiles_KraidStatue_2
    dw Instruction_AnimTilesObject_SpawnTourianStatueEyeGlowParamY,$0006
    dw $00C0,AnimatedTiles_DraygonStatue_Other
    dw Instruction_AnimTilesObject_SpawnTourianStatuesSoulParamY,$0006
    dw Instruction_AnimatedTilesObject_SpawnPaletteFXObjectInY
    dw PaletteFXObjects_GreyOutTourianStatue_Kraid
    dw $0080,AnimatedTiles_DraygonStatue_Other
    dw Instruction_AnimatedTilesObject_SetEventY,$0009
    dw Instruction_AnimatedTilesObject_TourianStatueResetAnimStateY,$8004
    dw Instruction_AnimatedTilesObject_Delete

InstList_AnimatedTilesObject_TourianStatueKraid_grey:
    dw Instruction_AnimatedTilesObject_TourianStatueResetAnimStateY,$8004
    dw Instruction_AnimatedTilesObject_Write8ColorsOfTargetPaletteD,$00E0
    dw Instruction_AnimatedTilesObject_Delete


;;; $84E4: Instruction list - animated tiles object $855E (Tourian entrance statue - Draygon) ;;;
InstList_AnimatedTilesObject_TourianStatueDraygon:
    dw Instruction_AnimatedTilesObject_TourianStatueSetAnimStateY,$0008
    dw Instruction_AnimatedTilesObject_GotoYIfEventYSet,$0008
    dw InstList_AnimatedTilesObject_TourianStatueDraygon_grey
    dw $0008,AnimatedTiles_DraygonStatue_0

InstList_AnimatedTilesObject_TourianStatueDraygon_loopWait:
    dw $000C,AnimatedTiles_DraygonStatue_1
    dw $000C,AnimatedTiles_DraygonStatue_2
    dw $000C,AnimatedTiles_DraygonStatue_1
    dw $0010,AnimatedTiles_DraygonStatue_0
    dw Instruction_AnimTilesObject_GotoYIfAnyBossBitsYSetForAreaY
    db $01,$04
    dw InstList_AnimatedTilesObject_TourianStatueDraygon_dead
    dw Instruction_AnimatedTilesObject_TourianStatueResetAnimStateY,$0008
    dw Instruction_AnimatedTilesObject_GotoY
    dw InstList_AnimatedTilesObject_TourianStatueDraygon_loopWait

InstList_AnimatedTilesObject_TourianStatueDraygon_dead:
    dw Instruction_AnimatedTilesObject_GotoYIfTourianStatueBusy
    dw InstList_AnimatedTilesObject_TourianStatueDraygon_loopWait
    dw Instruction_AnimatedTilesObject_TourianStatueSetAnimStateY,$8000
    dw Instruction_AnimatedTilesObject_Clear3ColorsOfPaletteData,$00D2
    dw $0010,AnimatedTiles_DraygonStatue_1
    dw $0010,AnimatedTiles_DraygonStatue_2
    dw Instruction_AnimTilesObject_SpawnTourianStatueEyeGlowParamY,$0004
    dw $00C0,AnimatedTiles_KraidStatue_Other
    dw Instruction_AnimTilesObject_SpawnTourianStatuesSoulParamY,$0004
    dw Instruction_AnimatedTilesObject_SpawnPaletteFXObjectInY
    dw PaletteFXObjects_GreyOutTourianStatue_Draygon
    dw $0080,AnimatedTiles_KraidStatue_Other
    dw Instruction_AnimatedTilesObject_SetEventY,$0008
    dw Instruction_AnimatedTilesObject_TourianStatueResetAnimStateY,$8008
    dw Instruction_AnimatedTilesObject_Delete

InstList_AnimatedTilesObject_TourianStatueDraygon_grey:
    dw Instruction_AnimatedTilesObject_TourianStatueResetAnimStateY,$8008
    dw Instruction_AnimatedTilesObject_Write8ColorsOfTargetPaletteD,$00C0
    dw Instruction_AnimatedTilesObject_Delete


;;; $854C: Animated tiles objects - Tourian entrance statue ;;;
AnimatedTilesObject_TourianStatuePhantoon:
    dw InstList_AnimatedTilesObject_TourianStatuePhantoon
    dw $0080,$7800

AnimatedTilesObject_TourianStatueRidley:
    dw InstList_AnimatedTilesObject_TourianStatueRidley
    dw $0040,$7220

AnimatedTilesObject_TourianStatueKraid:
    dw InstList_AnimatedTilesObject_TourianStatueKraid
    dw $0040,$0B40

AnimatedTilesObject_TourianStatueDraygon:
    dw InstList_AnimatedTilesObject_TourianStatueDraygon
    dw $0080,$0CA0


;;; $8564: Crateria 4 - Crateria lake ;;;
AnimatedTiles_CrateriaLake_0:
incbin "../data/AnimatedTiles_CrateriaLake_0.bin" ; $200 bytes

AnimatedTiles_CrateriaLake_1:
incbin "../data/AnimatedTiles_CrateriaLake_1.bin" ; $200 bytes

AnimatedTiles_CrateriaLake_2:
incbin "../data/AnimatedTiles_CrateriaLake_2.bin" ; $200 bytes


;;; $8B64: Crateria 8 - unused Crateria lava ;;;
UNUSED_AnimatedTiles_CrateriaLava_0_878B64:
incbin "../data/UNUSED_AnimatedTiles_CrateriaLava_0.bin" ; $C0 bytes

UNUSED_AnimatedTiles_CrateriaLava_1_878C24:
incbin "../data/UNUSED_AnimatedTiles_CrateriaLava_1.bin" ; $C0 bytes

UNUSED_AnimatedTiles_CrateriaLava_2_878CE4:
incbin "../data/UNUSED_AnimatedTiles_CrateriaLava_2.bin" ; $C0 bytes

UNUSED_AnimatedTiles_CrateriaLava_3_878DA4:
incbin "../data/UNUSED_AnimatedTiles_CrateriaLava_3.bin" ; $C0 bytes


;;; $8E64: Wrecked Ship 4/8 - Wrecked Ship treadmill ;;;
AnimatedTiles_WreckedShipTreadmill_0:
incbin "../data/AnimatedTiles_WreckedShipTreadmill_0.bin" ; $20 bytes

AnimatedTiles_WreckedShipTreadmill_1:
incbin "../data/AnimatedTiles_WreckedShipTreadmill_1.bin" ; $20 bytes

AnimatedTiles_WreckedShipTreadmill_2:
incbin "../data/AnimatedTiles_WreckedShipTreadmill_2.bin" ; $20 bytes

AnimatedTiles_WreckedShipTreadmill_3:
incbin "../data/AnimatedTiles_WreckedShipTreadmill_3.bin" ; $20 bytes


;;; $8EE4: Wrecked Ship 10h - Wrecked Ship screen ;;;
AnimatedTiles_WreckedShipScreen_0:
incbin "../data/AnimatedTiles_WreckedShipScreen_0.bin" ; $80 bytes

AnimatedTiles_WreckedShipScreen_1:
incbin "../data/AnimatedTiles_WreckedShipScreen_1.bin" ; $80 bytes

AnimatedTiles_WreckedShipScreen_2:
incbin "../data/AnimatedTiles_WreckedShipScreen_2.bin" ; $80 bytes


if !FEATURE_KEEP_UNREFERENCED
;;; $9064: Unused. "X" ;;;
UNUSED_AnimatedTiles_X_879064:
incbin "../data/AnimatedTiles_X_879064.bin" ; $100 bytes
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $9164: Maridia 8 - Maridia sand falling ;;;
AnimatedTiles_MaridiaSandFalling_0:
incbin "../data/AnimatedTiles_MaridiaSandFalling_0.bin" ; $20 bytes

AnimatedTiles_MaridiaSandFalling_1:
incbin "../data/AnimatedTiles_MaridiaSandFalling_1.bin" ; $20 bytes

AnimatedTiles_MaridiaSandFalling_2:
incbin "../data/AnimatedTiles_MaridiaSandFalling_2.bin" ; $20 bytes

AnimatedTiles_MaridiaSandFalling_3:
incbin "../data/AnimatedTiles_MaridiaSandFalling_3.bin" ; $20 bytes


;;; $91E4: Maridia 4 - Maridia sand ceiling ;;;
AnimatedTiles_MaridiaSandCeiling_0:
incbin "../data/AnimatedTiles_MaridiaSandCeiling_0.bin" ; $40 bytes

AnimatedTiles_MaridiaSandCeiling_1:
incbin "../data/AnimatedTiles_MaridiaSandCeiling_1.bin" ; $40 bytes

AnimatedTiles_MaridiaSandCeiling_2:
incbin "../data/AnimatedTiles_MaridiaSandCeiling_2.bin" ; $40 bytes

AnimatedTiles_MaridiaSandCeiling_3:
incbin "../data/AnimatedTiles_MaridiaSandCeiling_3.bin" ; $40 bytes


if !FEATURE_KEEP_UNREFERENCED
;;; $92E4: Unused. "X" ;;;
UNUSED_AnimatedTiles_X_8792E4:
incbin "../data/AnimatedTiles_X_8792E4.bin" ; $80 bytes
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $9364: Phantoon statue ;;;
AnimatedTiles_PhantoonStatue_0:
incbin "../data/AnimatedTiles_PhantoonStatue_0.bin" ; $80 bytes

AnimatedTiles_PhantoonStatue_1:
incbin "../data/AnimatedTiles_PhantoonStatue_1.bin" ; $80 bytes

AnimatedTiles_PhantoonStatue_2:
incbin "../data/AnimatedTiles_PhantoonStatue_2.bin" ; $80 bytes


;;; $94E4: Ridley statue ;;;
AnimatedTiles_RidleyStatue_0:
incbin "../data/AnimatedTiles_RidleyStatue_0.bin" ; $40 bytes

AnimatedTiles_RidleyStatue_1:
incbin "../data/AnimatedTiles_RidleyStatue_1.bin" ; $40 bytes

AnimatedTiles_RidleyStatue_2:
incbin "../data/AnimatedTiles_RidleyStatue_2.bin" ; $40 bytes


;;; $95A4: Draygon statue ;;;
AnimatedTiles_DraygonStatue_0:
incbin "../data/AnimatedTiles_DraygonStatue_0.bin" ; $80 bytes

AnimatedTiles_DraygonStatue_1:
incbin "../data/AnimatedTiles_DraygonStatue_1.bin" ; $80 bytes

AnimatedTiles_DraygonStatue_2:
incbin "../data/AnimatedTiles_DraygonStatue_2.bin" ; $80 bytes


;;; $9724: Kraid statue ;;;
AnimatedTiles_KraidStatue_0:
incbin "../data/AnimatedTiles_KraidStatue_0.bin" ; $40 bytes

AnimatedTiles_KraidStatue_1:
incbin "../data/AnimatedTiles_KraidStatue_1.bin" ; $40 bytes

AnimatedTiles_KraidStatue_2:
incbin "../data/AnimatedTiles_KraidStatue_2.bin" ; $40 bytes


;;; $97E4: Phantoon statue - other ;;;
AnimatedTiles_PhantoonStatue_Other:
incbin "../data/AnimatedTiles_PhantoonStatue_Other.bin" ; $80 bytes


;;; $9864: Ridley statue - other ;;;
AnimatedTiles_RidleyStatue_Other:
incbin "../data/AnimatedTiles_RidleyStatue_Other.bin" ; $40 bytes


;;; $98A4: Draygon statue - other ;;;
AnimatedTiles_DraygonStatue_Other:
incbin "../data/AnimatedTiles_DraygonStatue_Other.bin" ; $40 bytes


;;; $98E4: Kraid statue - other ;;;
AnimatedTiles_KraidStatue_Other:
incbin "../data/AnimatedTiles_KraidStatue_Other.bin" ; $80 bytes


;;; $9964: Brinstar 4 - Brinstar plant ;;;
AnimatedTiles_BrinstarMouth_0:
incbin "../data/AnimatedTiles_BrinstarMouth_0.bin" ; $E0 bytes

AnimatedTiles_BrinstarMouth_1:
incbin "../data/AnimatedTiles_BrinstarMouth_1.bin" ; $E0 bytes

AnimatedTiles_BrinstarMouth_2:
incbin "../data/AnimatedTiles_BrinstarMouth_2.bin" ; $E0 bytes


;;; $9C04: All areas 1 - vertical spikes ;;;
AnimatedTiles_VerticalSpikes_0:
incbin "../data/AnimatedTiles_VerticalSpikes_0.bin" ; $80 bytes

AnimatedTiles_VerticalSpikes_1:
incbin "../data/AnimatedTiles_VerticalSpikes_1.bin" ; $80 bytes

AnimatedTiles_VerticalSpikes_2:
incbin "../data/AnimatedTiles_VerticalSpikes_2.bin" ; $80 bytes


;;; $9D84: All areas 2 - horizontal spikes ;;;
AnimatedTiles_HorizontalSpikes_0:
incbin "../data/AnimatedTiles_HorizontalSpikes_0.bin" ; $80 bytes

AnimatedTiles_HorizontalSpikes_1:
incbin "../data/AnimatedTiles_HorizontalSpikes_1.bin" ; $80 bytes

AnimatedTiles_HorizontalSpikes_2:
incbin "../data/AnimatedTiles_HorizontalSpikes_2.bin" ; $80 bytes


if !FEATURE_KEEP_UNREFERENCED
;;; $9F04: Unused. "X" ;;;
UNUSED_AnimatedTiles_X_879F04:
incbin "../data/AnimatedTiles_X_879F04.bin" ; $660 bytes
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $A564: Lava ;;;
AnimatedTiles_Lava_0:
incbin "../data/AnimatedTiles_Lava_0.bin" ; $40 bytes

AnimatedTiles_Lava_1:
incbin "../data/AnimatedTiles_Lava_1.bin" ; $40 bytes

AnimatedTiles_Lava_2:
incbin "../data/AnimatedTiles_Lava_2.bin" ; $40 bytes

AnimatedTiles_Lava_3:
incbin "../data/AnimatedTiles_Lava_3.bin" ; $40 bytes

AnimatedTiles_Lava_4:
incbin "../data/AnimatedTiles_Lava_4.bin" ; $40 bytes


;;; $A6A4: Acid ;;;
AnimatedTiles_Acid_0:
incbin "../data/AnimatedTiles_Acid_0.bin" ; $40 bytes

AnimatedTiles_Acid_1:
incbin "../data/AnimatedTiles_Acid_1.bin" ; $40 bytes

AnimatedTiles_Acid_2:
incbin "../data/AnimatedTiles_Acid_2.bin" ; $40 bytes

AnimatedTiles_Acid_3:
incbin "../data/AnimatedTiles_Acid_3.bin" ; $40 bytes

AnimatedTiles_Acid_4:
incbin "../data/AnimatedTiles_Acid_4.bin" ; $40 bytes


;;; $A7E4: Spores ;;;
AnimatedTiles_Spores_0:
incbin "../data/AnimatedTiles_Spores_0.bin" ; $30 bytes

AnimatedTiles_Spores_1:
incbin "../data/AnimatedTiles_Spores_1.bin" ; $30 bytes

AnimatedTiles_Spores_2:
incbin "../data/AnimatedTiles_Spores_2.bin" ; $30 bytes


;;; $A874: Rain ;;;
AnimatedTiles_Rain_0:
incbin "../data/AnimatedTiles_Rain_0.bin" ; $50 bytes

AnimatedTiles_Rain_1:
incbin "../data/AnimatedTiles_Rain_1.bin" ; $50 bytes

AnimatedTiles_Rain_2:
incbin "../data/AnimatedTiles_Rain_2.bin" ; $50 bytes

AnimatedTiles_Rain_3:
incbin "../data/AnimatedTiles_Rain_3.bin" ; $50 bytes

AnimatedTiles_Rain_4:
incbin "../data/AnimatedTiles_Rain_4.bin" ; $50 bytes


if !FEATURE_KEEP_UNREFERENCED
;;; $AA04: Zeros ;;;
Freespace_Bank87_AA04:
; $360 zero bytes
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $AD64: Tiles - enemy $F03F (Tourian entrance statue ghost) ;;;
Tiles_TourianStatuesSoul:
incbin "../data/Tiles_TourianEntranceStatueGhost.bin" ; $600 bytes


;;; $B364: Tiles - enemy $EFFF (Tourian entrance statue) ;;;
Tiles_TourianStatue:
incbin "../data/Tiles_TourianEntranceStatue.bin" ; $1600 bytes


Freespace_Bank87_C964:
; $369C bytes
