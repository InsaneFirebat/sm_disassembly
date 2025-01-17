
org $878000


Enable_AnimatedTilesObjects:
    PHP 
    REP #$20 
    LDA.W #$8000 
    TSB.W $1EF1 
    PLP 
    RTL 


Disable_AnimatedTilesObjects:
    PHP 
    REP #$20 
    LDA.W #$8000 
    TRB.W $1EF1 
    PLP 
    RTL 


Clear_AnimatedTilesObjects:
    PHP 
    REP #$30 
    PHX 
    LDX.W #$000A 

.loop:
    STZ.W $1EF5,X 
    DEX #2
    BPL .loop 
    PLX : PLP 
    RTL 


Spawn_AnimatedTilesObject:
    PHP : PHB : PHX : PHK : PLB 
    LDX.W #$000A 

.loop:
    LDA.W $1EF5,X : BEQ .found 
    DEX #2
    BPL .loop 
    PLX : PLB : PLP 
    SEC 
    RTL 


.found:
    TYA 
    STA.W $1EF5,X 
    STZ.W $1F01,X 
    LDA.W $0000,Y : STA.W $1F0D,X 
    STZ.W $1F25,X 
    LDA.W $0002,Y : STA.W $1F31,X 
    LDA.W $0004,Y : STA.W $1F3D,X 
    LDA.W #$0001 : STA.W $1F19,X 
    PLX : PLB : PLP 
    CLC 
    RTL 


AnimatedTilesObject_Handler:
    PHP : PHB : PHK : PLB 
    BIT.W $1EF1 
    BPL .return 
    LDX.W #$000A 

.loop:
    STX.W $1EF3 
    LDA.W $1EF5,X : BEQ .next 
    JSR.W Process_AnimatedTilesObject 
    LDX.W $1EF3 

.next:
    DEX #2
    BPL .loop 

.return:
    PLB : PLP 
    RTL 


Process_AnimatedTilesObject:
    LDX.W $1EF3 
    DEC.W $1F19,X 
    BNE .return 
    LDY.W $1F0D,X 

.loop:
    LDA.W $0000,Y : BPL .notInstruction 
    STA.W $1F49 
    INY #2
    PEA.W .loop-1 
    JMP.W ($1F49) 


.notInstruction:
    STA.W $1F19,X 
    LDA.W $0002,Y : STA.W $1F25,X 
    TYA 
    CLC : ADC.W #$0004 : STA.W $1F0D,X 

.return:
    RTS 


Instruction_AnimatedTilesObject_Delete:
    STZ.W $1EF5,X 
    PLA 
    RTS 


Instruction_AnimatedTilesObject_GotoY:
    LDA.W $0000,Y 
    TAY 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Instruction_AnimatedTilesObject_GotoYPlusY_8780BC:
    STY.W $1F49 
    DEY 
    LDA.W $0000,Y 
    XBA 
    BMI .highByte 
    AND.W #$00FF 
    BRA + 


.highByte:
    ORA.W #$FF00 

  + CLC : ADC.W $1F49 : TAY 
    RTS 


UNUSED_Inst_AnimTilesObject_DecTimer_GotoYIfNonZero_8780D4:
    DEC.W $1F01,X 
    BNE Instruction_AnimatedTilesObject_GotoY 
    INY #2
    RTS 


UNUSED_Inst_AnimTilesObject_DecTimer_GotoYPlusYIfNon0_8780DC:
    DEC.W $1F01,X 
    BNE UNUSED_Instruction_AnimatedTilesObject_GotoYPlusY_8780BC 
    INY 
    RTS 


UNUSED_Instruction_AnimatedTilesObject_TimerInY_8780E3:
    SEP #$20 
    LDA.W $0000,Y : STA.W $1F01,X 
    REP #$20 
    INY 
    RTS 


UNUSED_RTS_8780EF:
    RTS 


UNUSED_Instruction_AnimatedTilesObject_QueueMusicTrackInY:
    LDA.W $0000,Y : AND.W #$00FF 
    JSL.L QueueMusicDataOrTrack_8FrameDelay 
    INY 
    RTS 


UNUSED_Inst_AnimTilesObject_QueueSoundInY_Lib1_Max6_8780FC:
    LDA.W $0000,Y : AND.W #$00FF 
    JSL.L QueueSound_Lib1_Max6 
    INY 
    RTS 


UNUSED_Inst_AnimTilesObject_QueueSoundInY_Lib2_Max6_878108:
    LDA.W $0000,Y : AND.W #$00FF 
    JSL.L QueueSound_Lib2_Max6 
    INY 
    RTS 


UNUSED_Inst_AnimTilesObject_QueueSoundInY_Lib3_Max6_878114:
    LDA.W $0000,Y : AND.W #$00FF 
    JSL.L QueueSound_Lib3_Max6 
    INY 
    RTS 


UNUSED_Inst_AnimTilesObject_GotoYIfBossBitsInYSet_878120:
    LDA.W $0000,Y 
    INY 
    AND.W #$00FF 
    JSL.L CheckIfBossBitsForCurrentAreaMatchAnyBitsInA 
    BCC .notSet 
    JMP.W Instruction_AnimatedTilesObject_GotoY 


.notSet:
    INY #2
    RTS 


UNUSED_Instruction_AnimatedTilesObject_SetBossBitsY_878133:
    LDA.W $0000,Y : AND.W #$00FF 
    JSL.L SetBossBitsInAForCurrentArea 
    INY 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


Instruction_AnimatedTilesObject_GotoYIfEventYSet:
    LDA.W $0000,Y 
    INY #2
    JSL.L CheckIfEvent_inA_HasHappened 
    BCC .notSet 
    JMP.W Instruction_AnimatedTilesObject_GotoY 


.notSet:
    INY #2
    RTS 


Instruction_AnimatedTilesObject_SetEventY:
    LDA.W $0000,Y 
    JSL.L MarkEvent_inA 
    INY #2
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Instruction_AnimatedTilesObject_LockSamus_87815A:
    LDA.W #$0000 
    JSL.L Run_Samus_Command 
    RTS 


UNUSED_Instruction_AnimatedTilesObject_UnlockSamus_878162:
    LDA.W #$0001 
    JSL.L Run_Samus_Command 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


InstList_AnimatedTilesObject_VerticalSpikes:
    dw $0008,AnimatedTiles_VerticalSpikes_0 
    dw $0008,AnimatedTiles_VerticalSpikes_1 
    dw $0008,AnimatedTiles_VerticalSpikes_2 
    dw $0008,AnimatedTiles_VerticalSpikes_1 
    dw Instruction_AnimatedTilesObject_GotoY 
    dw InstList_AnimatedTilesObject_VerticalSpikes 

InstList_AnimatedTilesObject_HorizontalSpikes:
    dw $0008,AnimatedTiles_HorizontalSpikes_0 
    dw $0008,AnimatedTiles_HorizontalSpikes_1 
    dw $0008,AnimatedTiles_HorizontalSpikes_2 
    dw $0008,AnimatedTiles_HorizontalSpikes_1 
    dw Instruction_AnimatedTilesObject_GotoY 
    dw InstList_AnimatedTilesObject_HorizontalSpikes 

InstList_AnimatedTilesObject_CrateriaLake:
    dw $000A,AnimatedTiles_CrateriaLake_0 
    dw $000A,AnimatedTiles_CrateriaLake_1 
    dw $000A,AnimatedTiles_CrateriaLake_2 
    dw $000A,AnimatedTiles_CrateriaLake_1 
    dw Instruction_AnimatedTilesObject_GotoY 
    dw InstList_AnimatedTilesObject_CrateriaLake 

UNUSED_InstList_AnimatedTilesObject_CrateriaLava_8781A6:
    dw $000A,UNUSED_AnimatedTiles_CrateriaLava_0_878B64 
    dw $000A,UNUSED_AnimatedTiles_CrateriaLava_1_878C24 
    dw $000A,UNUSED_AnimatedTiles_CrateriaLava_2_878CE4 
    dw $000A,UNUSED_AnimatedTiles_CrateriaLava_3_878DA4 
    dw Instruction_AnimatedTilesObject_GotoY 
    dw UNUSED_InstList_AnimatedTilesObject_CrateriaLava_8781A6 

Instruction_AnimatedTilesObject_WaitUntilAreaBossIsDead:
    LDA.W #$0001 
    JSL.L CheckIfBossBitsForCurrentAreaMatchAnyBitsInA 
    BCS .return 
    PLA 
    LDA.W #$0001 : STA.W $1F19,X 

.return:
    RTS 


InstList_AnimatedTilesObject_WreckedShipScreen_0:
    dw Instruction_AnimatedTilesObject_WaitUntilAreaBossIsDead 

InstList_AnimatedTilesObject_WreckedShipScreen_1:
    dw $000A,AnimatedTiles_WreckedShipScreen_0 
    dw $000A,AnimatedTiles_WreckedShipScreen_1 
    dw $000A,AnimatedTiles_WreckedShipScreen_2 
    dw $000A,AnimatedTiles_WreckedShipScreen_1 
    dw Instruction_AnimatedTilesObject_GotoY 
    dw InstList_AnimatedTilesObject_WreckedShipScreen_1 

InstList_AnimTilesObject_WreckedShipTreadmill_Rightwards_0:
    dw Instruction_AnimatedTilesObject_WaitUntilAreaBossIsDead 

InstList_AnimTilesObject_WreckedShipTreadmill_Rightwards_1:
    dw $0001,AnimatedTiles_WreckedShipTreadmill_0 
    dw $0001,AnimatedTiles_WreckedShipTreadmill_1 
    dw $0001,AnimatedTiles_WreckedShipTreadmill_2 
    dw $0001,AnimatedTiles_WreckedShipTreadmill_3 
    dw Instruction_AnimatedTilesObject_GotoY 
    dw InstList_AnimTilesObject_WreckedShipTreadmill_Rightwards_1 

InstList_AnimTilesObject_WreckedShipTreadmill_Leftwards_0:
    dw Instruction_AnimatedTilesObject_WaitUntilAreaBossIsDead 

InstList_AnimTilesObject_WreckedShipTreadmill_Leftwards_1:
    dw $0001,AnimatedTiles_WreckedShipTreadmill_3 
    dw $0001,AnimatedTiles_WreckedShipTreadmill_2 
    dw $0001,AnimatedTiles_WreckedShipTreadmill_1 
    dw $0001,AnimatedTiles_WreckedShipTreadmill_0 
    dw Instruction_AnimatedTilesObject_GotoY 
    dw InstList_AnimTilesObject_WreckedShipTreadmill_Leftwards_1 

InstList_AnimatedTilesObject_BrinstarMouth:
    dw $0010,AnimatedTiles_BrinstarMouth_0 
    dw $0010,AnimatedTiles_BrinstarMouth_1 
    dw $0010,AnimatedTiles_BrinstarMouth_2 
    dw $0010,AnimatedTiles_BrinstarMouth_1 
    dw Instruction_AnimatedTilesObject_GotoY 
    dw InstList_AnimatedTilesObject_BrinstarMouth 

InstList_AnimatedTilesObject_MaridiaSandCeiling:
    dw $000A,AnimatedTiles_MaridiaSandCeiling_0 
    dw $000A,AnimatedTiles_MaridiaSandCeiling_1 
    dw $000A,AnimatedTiles_MaridiaSandCeiling_2 
    dw $000A,AnimatedTiles_MaridiaSandCeiling_3 
    dw Instruction_AnimatedTilesObject_GotoY 
    dw InstList_AnimatedTilesObject_MaridiaSandCeiling 

InstList_AnimatedTilesObject_MaridiaSandFalling:
    dw $000A,AnimatedTiles_MaridiaSandFalling_0 
    dw $000A,AnimatedTiles_MaridiaSandFalling_1 
    dw $000A,AnimatedTiles_MaridiaSandFalling_2 
    dw $000A,AnimatedTiles_MaridiaSandFalling_3 
    dw Instruction_AnimatedTilesObject_GotoY 
    dw InstList_AnimatedTilesObject_MaridiaSandFalling 

InstList_AnimatedTilesObject_Nothing:
    dw Instruction_AnimatedTilesObject_Delete 

AnimatedTilesObjects_FX_nothing:
    dw InstList_AnimatedTilesObject_Nothing 
    dw $0000,$0000 

AnimatedTilesObjects_FX_verticalSpikes:
    dw InstList_AnimatedTilesObject_VerticalSpikes 
    dw $0080,$3880 

AnimatedTilesObjects_FX_horizontalSpikes:
    dw InstList_AnimatedTilesObject_HorizontalSpikes 
    dw $0080,$3D60 

AnimatedTilesObjects_FX_crateriaLake:
    dw InstList_AnimatedTilesObject_CrateriaLake 
    dw $0200,$1B00 

UNUSED_AnimatedTilesObjects_FX_unusedCrateriaLava_0_878263:
    dw UNUSED_InstList_AnimatedTilesObject_CrateriaLava_8781A6 
    dw $00C0,$0A00 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_AnimatedTilesObjects_FX_unusedCrateriaLava_1_878269:
    dw UNUSED_InstList_AnimatedTilesObject_CrateriaLava_8781A6 
    dw $00C0,$0640 
endif ; !FEATURE_KEEP_UNREFERENCED

AnimatedTilesObjects_FX_wreckedShipScreen:
    dw InstList_AnimatedTilesObject_WreckedShipScreen_0 
    dw $0080,$19C0 

AnimatedTilesObjects_FX_wreckedShipTreadmillRightwards:
    dw InstList_AnimTilesObject_WreckedShipTreadmill_Rightwards_0 
    dw $0020,$00E0 

AnimatedTilesObjects_FX_wreckedShipTreadmillLeftwards:
    dw InstList_AnimTilesObject_WreckedShipTreadmill_Leftwards_0 
    dw $0020,$00E0 

AnimatedTilesObjects_FX_brinstarMouth:
    dw InstList_AnimatedTilesObject_BrinstarMouth 
    dw $00E0,$0410 

AnimatedTilesObjects_FX_maridiaSandCeiling:
    dw InstList_AnimatedTilesObject_MaridiaSandCeiling 
    dw $0040,$1000 

AnimatedTilesObjects_FX_maridiaSandFalling:
    dw InstList_AnimatedTilesObject_MaridiaSandFalling 
    dw $0020,$1020 

InstList_AnimatedTilesObject_Lava:
    dw $000D,AnimatedTiles_Lava_0 
    dw $000D,AnimatedTiles_Lava_1 
    dw $000D,AnimatedTiles_Lava_2 
    dw $000D,AnimatedTiles_Lava_3 
    dw $000D,AnimatedTiles_Lava_4 
    dw Instruction_AnimatedTilesObject_GotoY 
    dw InstList_AnimatedTilesObject_Lava 

AnimatedTilesObject_Lava:
    dw InstList_AnimatedTilesObject_Lava 
    dw $0040,$4280 

InstList_AnimatedTilesObject_Acid:
    dw $000A,AnimatedTiles_Acid_0 
    dw $000A,AnimatedTiles_Acid_1 
    dw $000A,AnimatedTiles_Acid_2 
    dw $000A,AnimatedTiles_Acid_3 
    dw $000A,AnimatedTiles_Acid_4 
    dw Instruction_AnimatedTilesObject_GotoY 
    dw InstList_AnimatedTilesObject_Acid 

AnimatedTilesObject_Acid:
    dw InstList_AnimatedTilesObject_Acid 
    dw $0040,$4280 

InstList_AnimatedTilesObject_Rain:
    dw $000A,AnimatedTiles_Rain_0 
    dw $000A,AnimatedTiles_Rain_1 
    dw $000A,AnimatedTiles_Rain_2 
    dw $000A,AnimatedTiles_Rain_3 
    dw $000A,AnimatedTiles_Rain_4 
    dw Instruction_AnimatedTilesObject_GotoY 
    dw InstList_AnimatedTilesObject_Rain 

AnimatedTilesObject_Rain:
    dw InstList_AnimatedTilesObject_Rain 
    dw $0050,$4280 

InstList_AnimatedTilesObject_Spores:
    dw $000A,AnimatedTiles_Spores_0 
    dw $000A,AnimatedTiles_Spores_1 
    dw $000A,AnimatedTiles_Spores_2 
    dw Instruction_AnimatedTilesObject_GotoY 
    dw InstList_AnimatedTilesObject_Spores 

AnimatedTilesObject_Spores:
    dw InstList_AnimatedTilesObject_Spores 
    dw $0030,$4280 

Instruction_AnimTilesObject_GotoYIfAnyBossBitsYSetForAreaY:
    PHX 
    LDA.W $0001,Y : AND.W #$00FF 
    TAX 
    LDA.L $7ED828,X 
    PLX 
    AND.W $0000,Y 
    INY #2
    AND.W #$00FF 
    BEQ .notSet 
    JMP.W Instruction_AnimatedTilesObject_GotoY 


.notSet:
    INY #2
    RTS 


Instruction_AnimTilesObject_SpawnTourianStatueEyeGlowParamY:
    PHY 
    LDA.W $0000,Y 
    LDY.W #EnemyProjectile_TourianStatueEyeGlow 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    PLY 
    INY #2
    RTS 


Instruction_AnimTilesObject_SpawnTourianStatuesSoulParamY:
    PHY 
    LDA.W $0000,Y 
    LDY.W #EnemyProjectile_TourianStatueSoul 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    PLY 
    INY #2
    RTS 


Instruction_AnimatedTilesObject_GotoYIfTourianStatueBusy:
    LDA.W $1E6F : BPL .notBusy 
    JMP.W Instruction_AnimatedTilesObject_GotoY 


.notBusy:
    INY #2
    RTS 


Instruction_AnimatedTilesObject_TourianStatueSetAnimStateY:
    LDA.W $0000,Y 
    TSB.W $1E6F 
    INY #2
    RTS 


Instruction_AnimatedTilesObject_TourianStatueResetAnimStateY:
    LDA.W $0000,Y 
    TRB.W $1E6F 
    INY #2
    RTS 


Instruction_AnimatedTilesObject_Clear3ColorsOfPaletteData:
    PHX 
    LDX.W $0000,Y 
    LDA.W #$0000 : STA.L $7EC000,X 
    STA.L $7EC002,X 
    STA.L $7EC004,X 
    PLX 
    INY #2
    RTS 


Instruction_AnimatedTilesObject_SpawnPaletteFXObjectInY:
    PHY 
    LDA.W $0000,Y 
    TAY 
    JSL.L Spawn_PaletteFXObject 
    PLY 
    INY #2
    RTS 


Instruction_AnimatedTilesObject_Write8ColorsOfTargetPaletteD:
    PHX : PHY 
    LDX.W $0000,Y 
    LDY.W #$0000 

.loop:
    LDA.W .palleteData,Y : STA.L $7EC200,X 
    INX #2
    INY #2
    CPY.W #$0010 
    BNE .loop 
    PLY : PLX 
    INY #2
    RTS 


.palleteData:
    dw $3800,$7F58,$6ED5,$5A71,$49EE,$356A,$24E7,$1083 

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

AnimatedTiles_CrateriaLake_0:
incbin "../data/AnimatedTiles_CrateriaLake_0.bin" ; $200 bytes

AnimatedTiles_CrateriaLake_1:
incbin "../data/AnimatedTiles_CrateriaLake_1.bin" ; $200 bytes

AnimatedTiles_CrateriaLake_2:
incbin "../data/AnimatedTiles_CrateriaLake_2.bin" ; $200 bytes

UNUSED_AnimatedTiles_CrateriaLava_0_878B64:
incbin "../data/UNUSED_AnimatedTiles_CrateriaLava_0.bin" ; $C0 bytes

UNUSED_AnimatedTiles_CrateriaLava_1_878C24:
incbin "../data/UNUSED_AnimatedTiles_CrateriaLava_1.bin" ; $C0 bytes

UNUSED_AnimatedTiles_CrateriaLava_2_878CE4:
incbin "../data/UNUSED_AnimatedTiles_CrateriaLava_2.bin" ; $C0 bytes

UNUSED_AnimatedTiles_CrateriaLava_3_878DA4:
incbin "../data/UNUSED_AnimatedTiles_CrateriaLava_3.bin" ; $C0 bytes

AnimatedTiles_WreckedShipTreadmill_0:
incbin "../data/AnimatedTiles_WreckedShipTreadmill_0.bin" ; $20 bytes

AnimatedTiles_WreckedShipTreadmill_1:
incbin "../data/AnimatedTiles_WreckedShipTreadmill_1.bin" ; $20 bytes

AnimatedTiles_WreckedShipTreadmill_2:
incbin "../data/AnimatedTiles_WreckedShipTreadmill_2.bin" ; $20 bytes

AnimatedTiles_WreckedShipTreadmill_3:
incbin "../data/AnimatedTiles_WreckedShipTreadmill_3.bin" ; $20 bytes

AnimatedTiles_WreckedShipScreen_0:
incbin "../data/AnimatedTiles_WreckedShipScreen_0.bin" ; $80 bytes

AnimatedTiles_WreckedShipScreen_1:
incbin "../data/AnimatedTiles_WreckedShipScreen_1.bin" ; $80 bytes

AnimatedTiles_WreckedShipScreen_2:
incbin "../data/AnimatedTiles_WreckedShipScreen_2.bin" ; $80 bytes

if !FEATURE_KEEP_UNREFERENCED
UNUSED_AnimatedTiles_X_879064:
incbin "../data/AnimatedTiles_X_879064.bin" ; $100 bytes
endif ; !FEATURE_KEEP_UNREFERENCED

AnimatedTiles_MaridiaSandFalling_0:
incbin "../data/AnimatedTiles_MaridiaSandFalling_0.bin" ; $20 bytes

AnimatedTiles_MaridiaSandFalling_1:
incbin "../data/AnimatedTiles_MaridiaSandFalling_1.bin" ; $20 bytes

AnimatedTiles_MaridiaSandFalling_2:
incbin "../data/AnimatedTiles_MaridiaSandFalling_2.bin" ; $20 bytes

AnimatedTiles_MaridiaSandFalling_3:
incbin "../data/AnimatedTiles_MaridiaSandFalling_3.bin" ; $20 bytes

AnimatedTiles_MaridiaSandCeiling_0:
incbin "../data/AnimatedTiles_MaridiaSandCeiling_0.bin" ; $40 bytes

AnimatedTiles_MaridiaSandCeiling_1:
incbin "../data/AnimatedTiles_MaridiaSandCeiling_1.bin" ; $40 bytes

AnimatedTiles_MaridiaSandCeiling_2:
incbin "../data/AnimatedTiles_MaridiaSandCeiling_2.bin" ; $40 bytes

AnimatedTiles_MaridiaSandCeiling_3:
incbin "../data/AnimatedTiles_MaridiaSandCeiling_3.bin" ; $40 bytes

if !FEATURE_KEEP_UNREFERENCED
UNUSED_AnimatedTiles_X_8792E4:
incbin "../data/AnimatedTiles_X_8792E4.bin" ; $80 bytes
endif ; !FEATURE_KEEP_UNREFERENCED

AnimatedTiles_PhantoonStatue_0:
incbin "../data/AnimatedTiles_PhantoonStatue_0.bin" ; $80 bytes

AnimatedTiles_PhantoonStatue_1:
incbin "../data/AnimatedTiles_PhantoonStatue_1.bin" ; $80 bytes

AnimatedTiles_PhantoonStatue_2:
incbin "../data/AnimatedTiles_PhantoonStatue_2.bin" ; $80 bytes

AnimatedTiles_RidleyStatue_0:
incbin "../data/AnimatedTiles_RidleyStatue_0.bin" ; $40 bytes

AnimatedTiles_RidleyStatue_1:
incbin "../data/AnimatedTiles_RidleyStatue_1.bin" ; $40 bytes

AnimatedTiles_RidleyStatue_2:
incbin "../data/AnimatedTiles_RidleyStatue_2.bin" ; $40 bytes

AnimatedTiles_DraygonStatue_0:
incbin "../data/AnimatedTiles_DraygonStatue_0.bin" ; $80 bytes

AnimatedTiles_DraygonStatue_1:
incbin "../data/AnimatedTiles_DraygonStatue_1.bin" ; $80 bytes

AnimatedTiles_DraygonStatue_2:
incbin "../data/AnimatedTiles_DraygonStatue_2.bin" ; $80 bytes

AnimatedTiles_KraidStatue_0:
incbin "../data/AnimatedTiles_KraidStatue_0.bin" ; $40 bytes

AnimatedTiles_KraidStatue_1:
incbin "../data/AnimatedTiles_KraidStatue_1.bin" ; $40 bytes

AnimatedTiles_KraidStatue_2:
incbin "../data/AnimatedTiles_KraidStatue_2.bin" ; $40 bytes

AnimatedTiles_PhantoonStatue_Other:
incbin "../data/AnimatedTiles_PhantoonStatue_Other.bin" ; $80 bytes

AnimatedTiles_RidleyStatue_Other:
incbin "../data/AnimatedTiles_RidleyStatue_Other.bin" ; $40 bytes

AnimatedTiles_DraygonStatue_Other:
incbin "../data/AnimatedTiles_DraygonStatue_Other.bin" ; $40 bytes

AnimatedTiles_KraidStatue_Other:
incbin "../data/AnimatedTiles_KraidStatue_Other.bin" ; $80 bytes

AnimatedTiles_BrinstarMouth_0:
incbin "../data/AnimatedTiles_BrinstarMouth_0.bin" ; $E0 bytes

AnimatedTiles_BrinstarMouth_1:
incbin "../data/AnimatedTiles_BrinstarMouth_1.bin" ; $E0 bytes

AnimatedTiles_BrinstarMouth_2:
incbin "../data/AnimatedTiles_BrinstarMouth_2.bin" ; $E0 bytes

AnimatedTiles_VerticalSpikes_0:
incbin "../data/AnimatedTiles_VerticalSpikes_0.bin" ; $80 bytes

AnimatedTiles_VerticalSpikes_1:
incbin "../data/AnimatedTiles_VerticalSpikes_1.bin" ; $80 bytes

AnimatedTiles_VerticalSpikes_2:
incbin "../data/AnimatedTiles_VerticalSpikes_2.bin" ; $80 bytes

AnimatedTiles_HorizontalSpikes_0:
incbin "../data/AnimatedTiles_HorizontalSpikes_0.bin" ; $80 bytes

AnimatedTiles_HorizontalSpikes_1:
incbin "../data/AnimatedTiles_HorizontalSpikes_1.bin" ; $80 bytes

AnimatedTiles_HorizontalSpikes_2:
incbin "../data/AnimatedTiles_HorizontalSpikes_2.bin" ; $80 bytes

if !FEATURE_KEEP_UNREFERENCED
UNUSED_AnimatedTiles_X_879F04:
incbin "../data/AnimatedTiles_X_879F04.bin" ; $660 bytes
endif ; !FEATURE_KEEP_UNREFERENCED

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

AnimatedTiles_Spores_0:
incbin "../data/AnimatedTiles_Spores_0.bin" ; $30 bytes

AnimatedTiles_Spores_1:
incbin "../data/AnimatedTiles_Spores_1.bin" ; $30 bytes

AnimatedTiles_Spores_2:
incbin "../data/AnimatedTiles_Spores_2.bin" ; $30 bytes

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

Tiles_TourianStatuesSoul:
incbin "../data/Tiles_TourianEntranceStatueGhost.bin" ; $600 bytes

Tiles_TourianStatue:
incbin "../data/Tiles_TourianEntranceStatue.bin" ; $1600 bytes

Freespace_Bank87_C964: 
; $369C bytes
