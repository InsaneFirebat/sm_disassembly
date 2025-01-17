
org $908000


AnimateSamus:
    PHP 
    REP #$30 
    JSL.L Get_Samus_BottomTop_Boundary 
    LDA.W $196E 
    AND.W #$000F 
    TAX 
    JSR.W (.pointers,X) 
    LDA.W $0A1C 
    CMP.W #$004D 
    BEQ .neutralJump 
    CMP.W #$004E 
    BEQ .neutralJump 
    LDA.W $0A94 
    DEC A 
    STA.W $0A94 
    BEQ + 
    BPL .return 

  + LDA.W $0A96 
    INC A 
    STA.W $0A96 
    BRA .handleDelay 


.neutralJump:
    LDA.W $0B36 
    CMP.W #$0002 
    BEQ + 
    LDA.W $0A96 
    CMP.W #$0001 
    BNE + 
    LDA.W $0A94 
    CMP.W #$0001 
    BNE + 
    LDA.W #$0004 : STA.W $0A94 

  + LDA.W $0A94 
    DEC A 
    STA.W $0A94 
    BEQ .incAnimFrame 
    BPL .return 

.incAnimFrame:
    LDA.W $0A96 
    INC A 
    STA.W $0A96 

.handleDelay:
    JSR.W Handle_Samus_AnimationDelay 

.return:
    PLP 
    RTS 


.pointers:
    dw AnimateSamus_FX_None 
    dw AnimateSamus_FX_Lava 
    dw AnimateSamus_FX_Acid 
    dw AnimateSamus_FX_Water 
    dw RTS_908077 
    dw RTS_908077 
    dw RTS_908077 
    dw RTS_908077 

RTS_908077:
    RTS 


AnimateSamus_FX_None:
    LDA.W $0A66 : STA.W $0A9C 
    LDA.W $0AD2 
    BEQ .return 
    BIT.W #$0001 
    BNE + 
    STZ.W $0AD2 
    RTS 


  + STZ.W $0AD2 
    LDA.W #$000E 
    JSL.L QueueSound_Lib2_Max6 
    LDA.W $0A74 
    BIT.W #$0004 
    BNE .goto_Spawn_WaterSplash_AirBubbles 
    LDA.W $0A1F 
    AND.W #$00FF 
    CMP.W #$0003 
    BEQ + 
    CMP.W #$0014 
    BNE .goto_Spawn_WaterSplash_AirBubbles 

  + LDA.W #$0030 
    JSL.L QueueSound_Lib1_Max6 

.goto_Spawn_WaterSplash_AirBubbles:
    BRA Spawn_WaterSplash_AirBubbles 


.return:
    RTS 


AnimateSamus_FX_Water:
    LDA.W $195E 
    BMI AnimateSamus_FX_None 
    CMP.B $12 
    BMI + 
    BRA AnimateSamus_FX_None 


  + LDA.W $197E 
    BIT.W #$0004 
    BNE AnimateSamus_FX_None 
    LDA.W SamusPhysicsConstants_AnimationDelayInWater : STA.W $0A9C 
    LDA.W $0AD2 
    CMP.W #$0001 
    BEQ Spawn_AirBubbles 
    LDA.W #$0001 : STA.W $0AD2 
    LDA.W #$000D 
    JSL.L QueueSound_Lib2_Max6 

Spawn_WaterSplash_AirBubbles:
    LDA.W $0A1F 
    AND.W #$00FF 
    TAX 
    LDA.W WaterSplash_TypeTable,X 
    AND.W #$00FF 
    BNE .grounded 
    LDA.W #$0300 : STA.W $0AEC 
    LDA.W #$0002 : STA.W $0AD4 
    LDA.W $0AF6 : STA.W $0ADC 
    LDA.W $195E : STA.W $0AE4 
    BRA Spawn_AirBubbles 


.grounded:
    LDA.W #$0100 : STA.W $0AEC 
    STA.W $0AEE 
    LDA.W #$0003 : STA.W $0AD4 
    STA.W $0AD6 
    LDA.W $0AF6 : CLC : ADC.W #$0004 : STA.W $0ADC 
    SEC : SBC.W #$0007 : STA.W $0ADE 
    LDA.B $12 : SEC : SBC.W #$0004 : STA.W $0AE4 
    STA.W $0AE6 

Spawn_AirBubbles:
    LDA.B $14 : SEC : SBC.W #$0018 : CMP.W $195E 
    BMI .noBubbles 
    LDA.W $05B6 
    BIT.W #$007F 
    BNE .noBubbles 
    LDA.W $0AF0 
    BNE .noBubbles 
    LDA.W #$0500 : STA.W $0AF0 
    LDA.W #$0003 : STA.W $0AD8 
    LDA.W $0AF6 : STA.W $0AE0 
    LDA.W $0AFA : SEC : SBC.W $0B00 : CLC : ADC.W #$0006 : STA.W $0AE8 
    JSL.L GenerateRandomNumber 
    BIT.W #$0001 
    BEQ .bubblesSFX 
    LDA.W #$000F 
    BRA .queueSFX 


.bubblesSFX:
    LDA.W #$0011 

.queueSFX:
    JSL.L QueueSound_Lib2_Max6 

.noBubbles:
    LDA.W $0A1C 
    CMP.W #$0000 
    BEQ .zeroFrameBuffer 
    CMP.W #$009B 
    BEQ .zeroFrameBuffer 
    LDA.W $09A2 
    BIT.W #$0020 
    BEQ .return 

.zeroFrameBuffer:
    STZ.W $0A9C 

.return:
    RTS 


WaterSplash_TypeTable:
    db $01,$00,$00,$00,$01,$01,$00,$00,$00,$00,$00,$00,$00,$00,$01,$01 
    db $01,$01,$00,$00,$00,$01,$00,$00,$00,$00,$00,$00 

AnimateSamus_FX_Lava:
    LDA.W $1962 
    BMI .goto_AnimateSamus_FX_None 
    CMP.B $12 
    BPL .goto_AnimateSamus_FX_None 
    LDA.W $0B3E 
    BEQ .zeroSpeedTimer 
    JSL.L Cancel_SpeedBoosting 
    STZ.W $0B42 
    STZ.W $0B44 

.zeroSpeedTimer:
    LDA.W $09A2 
    BIT.W #$0020 
    BNE .gravityEquipped 
    LDA.W $09DA 
    BIT.W #$0007 
    BNE .periodicDamage 
    LDA.W $09C2 
    CMP.W #$0047 
    BMI .periodicDamage 
    LDA.W #$002D 
    JSL.L QueueSound_Lib3_Max3 

.periodicDamage:
    LDA.W $0A4E : CLC : ADC.W SamusPhysicsConstants_LavaSubDamagePerFrame : STA.W $0A4E 
    LDA.W $0A50 : ADC.W SamusPhysicsConstants_LavaDamagePerFrame : STA.W $0A50 
    BRA AnimateSamus_SubmergedInLavaAcid 


  .goto_AnimateSamus_FX_None:
    JMP.W AnimateSamus_FX_None 


  .gravityEquipped:
    STZ.W $0A9C 
    LDA.W #$0002 : STA.W $0AD2 
    RTS 


AnimateSamus_FX_Acid:
    LDA.W $1962 
    BMI AnimateSamus_FX_Lava_goto_AnimateSamus_FX_None 
    CMP.B $12 
    BPL AnimateSamus_FX_Lava_goto_AnimateSamus_FX_None 
    LDA.W $09DA 
    BIT.W #$0007 
    BNE + 
    LDA.W $09C2 
    CMP.W #$0047 
    BMI + 
    LDA.W #$002D 
    JSL.L QueueSound_Lib3_Max3 

  + LDA.W $0A4E : CLC : ADC.W SamusPhysicsConstants_AcidSubDamagePerFrame : STA.W $0A4E 
    LDA.W $0A50 : ADC.W SamusPhysicsConstants_AcidDamagePerFrame : STA.W $0A50 

AnimateSamus_SubmergedInLavaAcid:
    LDA.W SamusPhysicsConstants_AnimationDelayInLavaAcid : STA.W $0A9C 
    LDA.W #$0002 : STA.W $0AD2 
    LDA.B $14 
    CMP.W $1962 
    BPL .fullySubmerged 
    LDA.W $0AEC 
    BIT.W #$0400 
    BNE .fullySubmerged 
    LDA.W #$0400 : STA.W $0AEC 
    STA.W $0AEE 
    STA.W $0AF0 
    STA.W $0AF2 
    LDA.W #$0003 : STA.W $0AD4 
    STA.W $0ADA 
    LDA.W #$8002 : STA.W $0AD6 
    STA.W $0AD8 
    LDA.W $1962 : STA.W $0AE4 
    STA.W $0AE6 
    STA.W $0AE8 
    STA.W $0AEA 
    LDA.W $0AF6 : CLC : ADC.W #$0006 : STA.W $0ADC 
    SEC : SBC.W #$0006 : STA.W $0ADE 
    SBC.W #$0000 : STA.W $0AE0 
    SBC.W #$0006 : STA.W $0AE2 
    LDA.W $09DA 
    BIT.W #$0001 
    BNE .fullySubmerged 
    LDA.W #$0010 
    JSL.L QueueSound_Lib2_Max6 

.fullySubmerged:
    LDA.W $0A1C 
    CMP.W #$0000 
    BEQ .zeroBuffer 
    CMP.W #$009B 
    BEQ .zeroBuffer 
    LDA.W $09A2 
    BIT.W #$0020 
    BEQ .return 

.zeroBuffer:
    STZ.W $0A9C 

.return:
    RTS 


Handle_Samus_AnimationDelay:
    PHP 
    SEP #$20 
    PHB 
    LDA.B #$91 : STA.B $02 
    PHA 
    PLB 
    REP #$30 
    LDY.W $0A96 
    LDA.W $0A1C 
    ASL A 
    TAX 
    LDA.L AnimationDelayTable,X : STA.B $00 
    LDA.B [$00],Y 
    AND.W #$00FF 
    BIT.W #$0080 
    BNE + 
    JSR.W Handle_NormalAnimationDelay 
    BRA .return 


  + JSR.W Handle_SpeedBooster_AnimationDelay 
    TAX 
    BEQ .return 
    AND.W #$000F 
    ASL A 
    TAX 
    JSR.W (.pointers,X) 
    BCC .return 
    LDA.B [$00],Y 
    AND.W #$00FF 
    CLC : ADC.W $0A9C : STA.W $0A94 

.return:
    PLB 
    PLP 
    RTS 


.pointers:
    dw CLCRTS_908344 
    dw CLCRTS_908344 
    dw CLCRTS_908344 
    dw CLCRTS_908344 
    dw CLCRTS_908344 
    dw CLCRTS_908344 
    dw AnimDelay_6_GotoBeginningIfSamusNotLowEnergy 
    dw AnimDelay_7_SetDrainedSamusMovementHandler 
    dw AnimDelay_8_EnableAutoJumpHack_TransitionToPoseIfNotJumping 
    dw AnimDelay_9_TransitionToPoseDependingOnItemEquippedAndYSpeed 
    dw UNUSED_AnimDelay_A_TransitionToPoseDependingOnYSpeed_9083F6 
    dw AnimDelay_B_SelectAnimDelaySequenceForWallJump 
    dw UNUSED_AnimDelay_C_TransToPoseDependingOnItemEquipped_90848B 
    dw AnimDelay_D_TransitionToPose 
    dw AnimDelay_E_GotoY 
    dw AnimDelay_F_GotoBeginning 

CLCRTS_908344:
    CLC 
    RTS 


AnimDelay_6_GotoBeginningIfSamusNotLowEnergy:
    LDA.W $09C2 
    CMP.W #$001E 
    BMI .lowEnergy 
    LDY.W #$0000 
    STY.W $0A96 
    SEC 
    RTS 


.lowEnergy:
    LDA.W $0A96 
    INC A 
    STA.W $0A96 
    TAY 
    SEC 
    RTS 


AnimDelay_7_SetDrainedSamusMovementHandler:
    LDA.W #SamusMovementHandler_SamusDrained_Falling : STA.W $0A58 
    LDA.W $0A96 
    INC A 
    STA.W $0A96 
    TAY 
    SEC 
    RTS 


AnimDelay_8_EnableAutoJumpHack_TransitionToPoseIfNotJumping:
    LDA.W $0A60 
    CMP.W #SamusPoseInputHandler_Demo 
    BEQ .goto_TransitionToPose 
    LDA.W $0A28 
    CMP.W #$004B 
    BEQ .return 
    CMP.W #$004C 
    BEQ .return 
    CMP.W #$0019 
    BEQ .return 
    CMP.W #$001A 
    BEQ .return 
    LDA.W #SamusPoseInputHandler_AutoJumpHack : STA.W $0A60 

.goto_TransitionToPose:
    JMP.W AnimDelay_D_TransitionToPose 


.return:
    CLC 
    RTS 


AnimDelay_9_TransitionToPoseDependingOnItemEquippedAndYSpeed:
    INY 
    LDA.B [$00],Y : STA.B $12 
    LDA.W $09A2 
    BIT.B $12 
    BNE .equippedItems 
    LDA.W $0B2E 
    BNE + 
    LDA.W $0B2C 
    BNE + 
    INY #2
    LDA.B [$00],Y : AND.W #$00FF : STA.W $0A2C 
    BRA .return 


  + INY #3
    LDA.B [$00],Y : AND.W #$00FF : STA.W $0A2C 
    BRA .return 


.equippedItems:
    LDA.W $0B2E 
    BNE + 
    LDA.W $0B2C 
    BNE + 
    INY #4
    LDA.B [$00],Y : AND.W #$00FF : STA.W $0A2C 
    BRA .return 


  + INY #5
    LDA.B [$00],Y : AND.W #$00FF : STA.W $0A2C 

.return:
    LDA.W #$0003 : STA.W $0A32 
    CLC 
    RTS 


UNUSED_AnimDelay_A_TransitionToPoseDependingOnYSpeed_9083F6:
    LDA.W $0B2E 
    BNE .nonZeroYSpeed 
    LDA.W $0B2C 
    BNE .nonZeroYSpeed 
    INY 
    LDA.B [$00],Y : AND.W #$00FF : STA.W $0A2C 
    BRA + 


.nonZeroYSpeed:
    INY #2
    LDA.B [$00],Y : AND.W #$00FF : STA.W $0A2C 

  + LDA.W #$0003 : STA.W $0A32 
    CLC 
    RTS 


AnimDelay_B_SelectAnimDelaySequenceForWallJump:
    LDA.W $09A2 
    BIT.W #$0020 
    BNE .notSubmerged 
    JSL.L Get_Samus_BottomTop_Boundary 
    LDA.W $195E 
    BMI .lessThanZero 
    CMP.B $14 
    BPL .notSubmerged 
    LDA.W $197E 
    BIT.W #$0004 
    BNE .notSubmerged 
    BRA .submerged 


.lessThanZero:
    LDA.W $1962 
    BMI .notSubmerged 
    CMP.B $14 
    BMI .submerged 

.notSubmerged:
    LDA.W $09A2 
    BIT.W #$0008 
    BNE .screwAttack 
    BIT.W #$0200 
    BNE .spaceJump 

.submerged:
    LDA.W #$0031 
    JSL.L QueueSound_Lib1_Max6 
    LDA.W $0A96 
    INC A 
    STA.W $0A96 
    TAY 
    SEC 
    RTS 


.spaceJump:
    LDA.W #$003E 
    JSL.L QueueSound_Lib1_Max6 
    LDA.W $0A96 : CLC : ADC.W #$000B : STA.W $0A96 
    TAY 
    SEC 
    RTS 


.screwAttack:
    LDA.W #$0033 
    JSL.L QueueSound_Lib1_Max6 
    LDA.W $0A96 : CLC : ADC.W #$0015 : STA.W $0A96 
    TAY 
    SEC 
    RTS 


UNUSED_AnimDelay_C_TransToPoseDependingOnItemEquipped_90848B:
    INY 
    LDA.B [$00],Y : STA.B $12 
    LDA.W $09A2 
    BIT.B $12 
    BNE .equippedItems 
    INY #2
    LDA.B [$00],Y : AND.W #$00FF : STA.W $0A2C 
    BRA .return 


.equippedItems:
    INY #3
    LDA.B [$00],Y : AND.W #$00FF : STA.W $0A2C 

.return:
    LDA.W #$0003 : STA.W $0A32 
    CLC 
    RTS 


AnimDelay_D_TransitionToPose:
    INY 
    LDA.B [$00],Y : AND.W #$00FF : STA.W $0A2C 
    LDA.W #$0003 : STA.W $0A32 
    CLC 
    RTS 


AnimDelay_E_GotoY:
    INY 
    LDA.B [$00],Y : AND.W #$00FF : STA.B $12 
    LDA.W $0A96 : SEC : SBC.B $12 : STA.W $0A96 
    TAY 
    SEC 
    RTS 


AnimDelay_F_GotoBeginning:
    LDY.W #$0000 
    STY.W $0A96 
    SEC 
    RTS 


Handle_NormalAnimationDelay:
    PHP 
    SEP #$20 
    PHB 
    LDA.B #$91 : STA.B $02 
    PHA 
    PLB 
    REP #$30 
    LDA.W $0B3C 
    BEQ .return 
    LDA.W $0A1F 
    AND.W #$00FF 
    CMP.W #$0001 
    BNE .return 
    LDA.W $09A2 
    BIT.W #$2000 
    BEQ .noSpeedBooster 
    LDA.W $0B3F 
    AND.W #$00FF 
    ASL A 
    TAX 
    LDA.L AnimationDelayTable_Running_SpeedBooster_pointers,X : STA.B $00 
    BRA .return 


.noSpeedBooster:
    LDA.L AnimationDelayTable_Running_NoSpeedBooster_pointer : STA.B $00 

.return:
    LDA.B [$00],Y 
    AND.W #$00FF 
    CLC : ADC.W $0A9C : STA.W $0A94 
    PLB 
    PLP 
    RTS 


Handle_SpeedBooster_AnimationDelay:
    PHP 
    SEP #$20 
    PHB 
    LDA.B #$91 : STA.B $02 
    PHA 
    PLB 
    REP #$30 
    LDA.W $0B3C 
    BNE .checkPressingRun 
    JMP.W .finish 


.checkPressingRun:
    LDA.B $8B 
    BIT.W $09B6 
    BNE .checkMovementType 
    JMP.W .finish 


.checkMovementType:
    LDA.W $0A1F 
    AND.W #$00FF 
    CMP.W #$0001 
    BEQ .speedBoosterEquipped 
    JMP.W .finish 


.speedBoosterEquipped:
    LDA.W $09A2 
    BIT.W #$2000 
    BNE .speedBoostTimer 
    LDY.W #$0000 
    STY.W $0A96 
    LDA.L AnimationDelayTable_Running_NoSpeedBooster_pointer : STA.B $00 
    LDA.B [$00],Y 
    AND.W #$00FF 
    CLC : ADC.W $0A9C : STA.W $0A94 
    LDA.W #$0000 
    BRA .return 


.speedBoostTimer:
    LDA.W $0B3E 
    DEC A 
    STA.W $0B3E 
    BIT.W #$00FF 
    BNE .finish 
    LDA.W $0B3E 
    BIT.W #$0400 
    BNE + 
    CLC : ADC.W #$0100 : STA.W $0B3E 
    BIT.W #$0400 
    BEQ + 
    LDA.W #$0001 : STA.W $0B40 
    LDA.W #$0003 
    JSL.L QueueSound_Lib3_Max6 

  + XBA 
    AND.W #$00FF 
    ASL A 
    TAX 
    LDA.W $0B3E 
    AND.W #$FF00 
    ORA.L SpeedBoostTimerResetValues,X 
    STA.W $0B3E 
    LDY.W #$0000 
    STY.W $0A96 
    LDA.L AnimationDelayTable_Running_SpeedBooster_pointers,X : STA.B $00 
    LDA.B [$00],Y 
    AND.W #$00FF 
    CLC : ADC.W $0A9C : STA.W $0A94 
    LDA.W #$0000 
    BRA .return 


.finish:
    LDA.B [$00],Y 
    AND.W #$00FF 

.return:
    PLB 
    PLP 
    RTS 


Draw_Samus:
    PHP 
    PHB 
    SEP #$20 
    LDA.B #$92 
    PHA 
    PLB 
    REP #$30 
    LDA.W $18AA 
    BNE + 
    LDA.W $18A8 
    BEQ + 
    LDA.W $0A68 
    BNE + 
    LDA.W $05B6 
    BIT.W #$0001 
    BEQ + 
    JMP.W .invisible 


  + LDA.W $0A1C 
    ASL A 
    TAX 
    PHX 
    LDA.L SamusSpritemapTableIndices_TopHalf,X : CLC : ADC.W $0A96 : STA.W $0AC8 
    PHA 
    JSR.W Calculate_SamusSpritemapPosition 
    PLA 
    JSL.L AddSamusSpritemapToOAM 
    PLX 
    STX.B $24 
    LDA.W $0A1F 
    AND.W #$00FF 
    ASL A 
    TAX 
    JSR.W (Draw_Samus_pointers,X) 
    BCC .invisible 
    LDX.B $24 
    LDA.L SamusSpritemapTableIndices_BottomHalf,X : CLC : ADC.W $0A96 : STA.W $0ACA 
    LDX.W $0B04 
    LDY.W $0B06 
    JSL.L AddSamusSpritemapToOAM 

.invisible:
    JSL.L Set_SamusTilesDefinitions_ForCurrentAnimation 
    PLB 
    PLP 
    RTS 


Draw_Samus_pointers:
    dw DetermineIf_SamusBottomHalf_IsDrawn_Standing 
    dw Flag_SamusBottomHalfIsDrawn 
    dw Flag_SamusBottomHalfIsDrawn 
    dw DetermineIf_SamusBottomHalf_IsDrawn_SpinJumping 
    dw Flag_SamusBottomHalfIsNotDrawn 
    dw Flag_SamusBottomHalfIsDrawn 
    dw Flag_SamusBottomHalfIsDrawn 
    dw Flag_SamusBottomHalfIsNotDrawn 
    dw Flag_SamusBottomHalfIsNotDrawn 
    dw Flag_SamusBottomHalfIsNotDrawn 
    dw DetermineIf_SamusBottomHalf_IsDrawn_Knockback_CFEnding 
    dw Flag_SamusBottomHalfIsDrawn 
    dw Flag_SamusBottomHalfIsDrawn 
    dw DetermineIf_SamusBottomHalf_IsDrawn_UnusedMovementTypeD 
    dw Flag_SamusBottomHalfIsDrawn 
    dw DetermineIf_SamusBottomHalf_IsDrawn_TransitionPoses 
    dw Flag_SamusBottomHalfIsDrawn 
    dw Flag_SamusBottomHalfIsNotDrawn 
    dw Flag_SamusBottomHalfIsNotDrawn 
    dw Flag_SamusBottomHalfIsNotDrawn 
    dw DetermineIf_SamusBottomHalf_IsDrawn_WallJumping 
    dw Flag_SamusBottomHalfIsDrawn 
    dw Flag_SamusBottomHalfIsDrawn 
    dw Flag_SamusBottomHalfIsDrawn 
    dw Flag_SamusBottomHalfIsDrawn 
    dw DetermineIf_SamusBottomHalf_IsDrawn_DamageBoost 
    dw Flag_SamusBottomHalfIsDrawn 
    dw DetermineIf_SamusBottomHalf_IsDrawn_Shinespark_CF_Drained 

Flag_SamusBottomHalfIsDrawn:
    SEC 
    RTS 


Flag_SamusBottomHalfIsNotDrawn:
    STZ.W $0ACA 
    CLC 
    RTS 


DetermineIf_SamusBottomHalf_IsDrawn_Standing:
    LDA.W $0A1C 
    CMP.W #$0000 
    BEQ .facingForward 

.return:
    SEC 
    RTS 


.facingForward:
    LDX.W $0590 
    LDA.W $0AF6 : SEC : SBC.W #$0007 : SEC : SBC.W $0911 : STA.W $0370,X 
    LDA.W $0AFA : SEC : SBC.W #$0011 : SEC : SBC.W $0915 : STA.W $0371,X 
    LDA.W #$3821 : STA.W $0372,X 
    TXA 
    CLC : ADC.W #$0004 : STA.W $0590 
    BRA .return 


DetermineIf_SamusBottomHalf_IsDrawn_SpinJumping:
    LDA.W $0A1C 
    CMP.W #$0081 
    BEQ .returnCarrySet 
    CMP.W #$0082 
    BEQ .returnCarrySet 
    CMP.W #$001B 
    BEQ .returnCarrySet 
    CMP.W #$001C 
    BEQ .returnCarrySet 
    LDA.W $0A96 
    BNE .spinning 

.returnCarrySet:
    SEC 
    RTS 


.spinning:
    CMP.W #$000B 
    BPL .returnCarrySet 
    STZ.W $0ACA 
    CLC 
    RTS 


DetermineIf_SamusBottomHalf_IsDrawn_Knockback_CFEnding:
    LDA.W $0A1C 
    CMP.W #$00D7 
    BEQ .crystalFlashEnding 
    CMP.W #$00D8 
    BEQ .crystalFlashEnding 
    BRA .returnCarrySet 


.crystalFlashEnding:
    LDA.W $0A96 
    CMP.W #$0003 
    BMI .noBottom 

.returnCarrySet:
    SEC 
    RTS 


.noBottom:
    STZ.W $0ACA 
    CLC 
    RTS 


DetermineIf_SamusBottomHalf_IsDrawn_TransitionPoses:
    LDA.W $0A1C 
    CMP.W #$00F1 
    BPL .returnCarrySet 
    CMP.W #$00DB 
    BPL .unused 
    CMP.W #$0035 
    BEQ .returnCarrySet 
    CMP.W #$0036 
    BEQ .returnCarrySet 
    CMP.W #$003B 
    BEQ .returnCarrySet 
    CMP.W #$003C 
    BEQ .returnCarrySet 
    BRA .noBottom 


.returnCarrySet:
    SEC 
    RTS 


.noBottom:
    STZ.W $0ACA 
    CLC 
    RTS 


.unused:
    CMP.W #$00DD 
    BPL .greaterThanDD 
    LDA.W $0A96 
    BEQ .returnCarrySet 
    BRA .noBottom 


.greaterThanDD:
    LDA.W $0A96 
    CMP.W #$0002 
    BEQ .returnCarrySet 
    BRA .noBottom 


DetermineIf_SamusBottomHalf_IsDrawn_UnusedMovementTypeD:
    LDA.W $0A1C 
    CMP.W #$0065 
    BEQ + 
    CMP.W #$0066 
    BNE .returnCarrySet 

  + LDA.W $0A96 
    CMP.W #$0001 
    BPL .noBottom 

.returnCarrySet:
    SEC 
    RTS 


.noBottom:
    STZ.W $0ACA 
    CLC 
    RTS 


DetermineIf_SamusBottomHalf_IsDrawn_WallJumping:
    LDA.W $0A96 
    CMP.W #$0003 
    BPL .spinning 

.returnCarrySet:
    SEC 
    RTS 


.spinning:
    CMP.W #$000D 
    BPL .returnCarrySet 
    STZ.W $0ACA 
    CLC 
    RTS 


DetermineIf_SamusBottomHalf_IsDrawn_DamageBoost:
    LDA.W $0A96 
    CMP.W #$0002 
    BPL .spinning 

.returnCarrySet:
    SEC 
    RTS 


.spinning:
    CMP.W #$0009 
    BPL .returnCarrySet 
    STZ.W $0ACA 
    CLC 
    RTS 


DetermineIf_SamusBottomHalf_IsDrawn_Shinespark_CF_Drained:
    LDA.W $0A1C 
    CMP.W #$00CF 
    BPL .notShinespark 
    CMP.W #$00CB 
    BEQ .noBottom 
    CMP.W #$00CC 
    BEQ .noBottom 
    BRA .returnCarrySet 


.notShinespark:
    CMP.W #$00E8 
    BEQ + 
    CMP.W #$00E9 
    BNE .returnCarrySet 

  + LDA.W $0A96 
    CMP.W #$0002 
    BMI .noBottom 

.returnCarrySet:
    SEC 
    RTS 


.noBottom:
    STZ.W $0ACA 
    CLC 
    RTS 


DrawSamusEchoes:
    PHP 
    REP #$30 
    LDA.W $0AAE 
    BMI .mergingEchoes 
    LDA.W $0B3E 
    AND.W #$FF00 
    CMP.W #$0400 
    BEQ + 
    PLP 
    RTS 


  + LDA.W $0AB2 
    BEQ + 
    LDY.W #$0002 
    JSR.W DrawSamusEcho 

  + LDA.W $0AB0 
    BEQ .returnUpper 
    LDY.W #$0000 
    JSR.W DrawSamusEcho 

.returnUpper:
    PLP 
    RTS 


.mergingEchoes:
    LDY.W #$0002 

.loop:
    LDA.W $0AB0,Y 
    BEQ .next 
    LDA.W $0AB8,Y 
    CMP.W $0AFA 
    BEQ .noYAdjustment 
    BMI + 
    SEC : SBC.W #$0002 : STA.W $0AB8,Y 
    BRA .noYAdjustment 


  + CLC : ADC.W #$0002 : STA.W $0AB8,Y 

.noYAdjustment:
    LDA.W $0AC0,Y 
    BMI .positive 
    LDA.W $0AB0,Y : CLC : ADC.W $0AC0,Y : STA.W $0AB0,Y 
    CMP.W $0AF6 
    BMI .drawEcho 
    LDA.W #$0000 : STA.W $0AB0,Y 
    BRA .next 


.positive:
    LDA.W $0AB0,Y : CLC : ADC.W $0AC0,Y : STA.W $0AB0,Y 
    CMP.W $0AF6 
    BPL .drawEcho 
    LDA.W #$0000 : STA.W $0AB0,Y 
    BRA .next 


.drawEcho:
    JSR.W DrawSamusEcho 

.next:
    DEY #2
    BPL .loop 
    LDA.W $0AB2 
    BNE .returnLower 
    LDA.W $0AB0 
    BNE .returnLower 
    STZ.W $0AAE 

.returnLower:
    PLP 
    RTS 


DrawSamusEcho:
    PHY 
    LDA.W $0A1C 
    ASL #3
    TAX 
    LDA.L PoseDefinitions_YOffset,X : AND.W #$00FF : STA.B $12 
    LDA.W $0AB0,Y : SEC : SBC.W $0911 : TAX 
    LDA.W $0AB8,Y : SEC : SBC.B $12 : SBC.W $0915 : BMI + 
    CMP.W #$00F8 
    BMI .addSpritemap 

  + PLY 
    RTS 


.addSpritemap:
    TAY 
    LDA.W $0AC8 
    JSL.L AddSamusSpritemapToOAM 
    PLY 
    LDA.W $0ACA 
    BEQ .return 
    LDA.W $0A1C 
    ASL #3
    TAX 
    LDA.L PoseDefinitions_YOffset,X : AND.W #$00FF : STA.B $12 
    PHY 
    LDA.W $0AB0,Y : SEC : SBC.W $0911 : TAX 
    LDA.W $0AB8,Y : SEC : SBC.B $12 : SBC.W $0915 : TAY 
    LDA.W $0ACA 
    JSL.L AddSamusSpritemapToOAM 
    PLY 

.return:
    RTS 


DrawShinesparkCrashEchoCircle:
    PHP 
    PHB 
    SEP #$20 
    LDA.B #$92 
    PHA 
    PLB 
    REP #$30 
    TXY 
    LDA.W $05B6 
    BIT.W #$0001 
    BNE + 
    JMP.W .return 


  + LDA.W $0A1C 
    ASL A 
    TAX 
    PHX 
    PHY 
    LDA.L SamusSpritemapTableIndices_TopHalf,X : CLC : ADC.W $0A96 : PHA 
    TXA 
    ASL #2
    TAX 
    LDA.L PoseDefinitions_YOffset,X : AND.W #$00FF : STA.B $12 
    LDA.W $0AB0,Y : SEC : SBC.W $0911 : TAX 
    LDA.W $0AB8,Y : SEC : SBC.B $12 : SBC.W $0915 : BMI .pullReturn 
    CMP.W #$00F8 
    BMI + 

.pullReturn:
    PLA 
    PLY 
    PLX 
    BRA .return 


  + TAY 
    PLA 
    JSL.L AddSamusSpritemapToOAM 
    PLY 
    PLX 
    STX.B $24 
    LDA.W $0A1F 
    AND.W #$00FF 
    ASL A 
    TAX 
    JSR.W (Draw_Samus_pointers,X) 
    BCC .return 
    LDX.B $24 
    LDA.L SamusSpritemapTableIndices_BottomHalf,X : CLC : ADC.W $0A96 : PHA 
    TXA 
    ASL #2
    TAX 
    LDA.L PoseDefinitions_YOffset,X : AND.W #$00FF : STA.B $12 
    LDA.W $0AB0,Y : SEC : SBC.W $0911 : TAX 
    LDA.W $0AB8,Y : SEC : SBC.B $12 : SBC.W $0915 : TAY 
    PLA 
    JSL.L AddSamusSpritemapToOAM 

.return:
    PLB 
    PLP 
    RTS 


DrawShinesparkCrashEchoProjectiles:
    PHP 
    REP #$30 
    LDA.W $05B6 
    BIT.W #$0001 
    BEQ .return 
    LDA.W $0AC6 
    BEQ + 
    LDY.W #$0006 
    JSR.W DrawSamusEcho 

  + LDA.W $0AC4 
    BEQ .return 
    LDY.W #$0004 
    JSR.W DrawSamusEcho 

.return:
    PLP 
    RTL 


Draw_Samus_Starting_Death_Animation:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    LDA.W $0A94 
    DEC A 
    STA.W $0A94 
    BEQ + 
    BPL .drawDeath 

  + LDA.W $0A96 
    INC A 
    STA.W $0A96 
    JSR.W Handle_Samus_AnimationDelay 

.drawDeath:
    JSL.L Draw_Samus_During_Death_Animation 
    PLB 
    PLP 
    RTL 


Draw_Samus_During_Death_Animation:
    PHP 
    PHB 
    SEP #$20 
    LDA.B #$92 
    PHA 
    PLB 
    REP #$30 
    LDA.W $0A1C 
    ASL A 
    TAX 
    PHX 
    LDA.L SamusSpritemapTableIndices_TopHalf,X : CLC : ADC.W $0A96 : PHA 
    JSR.W Calculate_SamusSpritemapPosition 
    LDA.W $0B04 : CLC : ADC.W $0911 : TAX 
    LDA.W $0B06 : CLC : ADC.W $0915 : TAY 
    PLA 
    JSL.L AddSamusSpritemapToOAM 
    PLX 
    STX.B $24 
    LDA.W $0A1F 
    AND.W #$00FF 
    ASL A 
    TAX 
    JSR.W (Draw_Samus_pointers,X) 
    BCC .setDefinitions 
    LDX.B $24 
    LDA.L SamusSpritemapTableIndices_BottomHalf,X : CLC : ADC.W $0A96 : PHA 
    LDA.W $0B04 : CLC : ADC.W $0911 : TAX 
    LDA.W $0B06 : CLC : ADC.W $0915 : TAY 
    PLA 
    JSL.L AddSamusSpritemapToOAM 

.setDefinitions:
    JSL.L Set_SamusTilesDefinitions_ForCurrentAnimation 
    PLB 
    PLP 
    RTL 


Draw_Inanimate_Samus:
    PHP 
    PHB 
    SEP #$20 
    LDA.B #$92 
    PHA 
    PLB 
    REP #$30 
    LDA.W $0A1C 
    ASL A 
    TAX 
    PHX 
    LDA.L SamusSpritemapTableIndices_TopHalf,X : CLC : ADC.W $0A96 : PHA 
    JSR.W Calculate_SamusSpritemapPosition 
    PLA 
    JSL.L AddSamusSpritemapToOAM 
    PLX 
    STX.B $24 
    LDA.W $0A1F 
    AND.W #$00FF 
    ASL A 
    TAX 
    JSR.W (Draw_Samus_pointers,X) 
    BCC .setDefinitions 
    LDX.B $24 
    LDA.L SamusSpritemapTableIndices_BottomHalf,X : CLC : ADC.W $0A96 : LDX.W $0B04 
    LDY.W $0B06 
    JSL.L AddSamusSpritemapToOAM 

.setDefinitions:
    JSL.L Set_SamusTilesDefinitions_ForCurrentAnimation 
    PLB 
    PLP 
    RTL 


Handle_AtmosphericEffects:
    PHP 
    REP #$30 
    LDY.W #$0006 

.loop:
    LDA.W $0AEC,Y 
    BEQ .next 
    PHA 
    AND.W #$00FF 
    ASL A 
    STA.B $12 
    PLA 
    XBA 
    AND.W #$00FF 
    ASL A 
    TAX 
    LDA.W $0AD4,Y 
    DEC A 
    STA.W $0AD4,Y 
    BEQ + 
    BPL .execute 
    CMP.W #$8000 
    BNE .next 
    PHX 
    LDA.W AtmosphericGraphics_AnimationTimers,X : CLC : ADC.B $12 : TAX 
    LDA.W $0000,X : STA.W $0AD4,Y 
    PLX 
    BRA .execute 


  + PHX 
    LDA.W AtmosphericGraphics_AnimationTimers,X : CLC : ADC.B $12 : TAX 
    LDA.W $0000,X : STA.W $0AD4,Y 
    PLX 
    LDA.W $0AEC,Y 
    INC A 
    STA.W $0AEC,Y 
    AND.W #$00FF 
    CMP.W AtmosphericGraphics_NumberOfAnimationFrames,X 
    BMI .execute 
    LDA.W #$0000 : STA.W $0AEC,Y 
    BRA .next 


.execute:
    JSR.W (.pointers,X) 

.next:
    DEY #2
    BPL .loop 
    PLP 
    RTS 


.pointers:
    dw $0000 
    dw AtmosphericEffects_1_2_FootstepSplashes 
    dw AtmosphericEffects_1_2_FootstepSplashes 
    dw AtmosphericEffects_3_DivingSplash 
    dw AtmosphericEffects_4_LavaSurfaceDamage 
    dw AtmosphericEffects_5_Bubbles 
    dw AtmosphericEffects_6_7_Dust 
    dw AtmosphericEffects_6_7_Dust 

AtmosphericEffects_1_2_FootstepSplashes:
    PHY 
    LDA.W $0AEC,Y 
    AND.W #$00FF 
    ASL A 
    STA.B $12 
    PHX 
    LDX.W $0590 
    LDA.W $0ADC,Y : SEC : SBC.W $0911 : SBC.W #$0004 : BMI .return 
    CMP.W #$0100 
    BPL .return 
    STA.W $0370,X 
    LDA.W $0AE4,Y : SEC : SBC.W $0915 : SBC.W #$0004 : BMI .return 
    CMP.W #$0100 
    BPL .return 
    STA.W $0371,X 
    PLY 
    LDA.W AtmosphericGraphics_SpriteTileNumberAttributes,Y : CLC : ADC.B $12 : TAY 
    LDA.W $0000,Y : STA.W $0372,X 
    TXA 
    CLC : ADC.W #$0004 : STA.W $0590 
    PLY 
    RTS 


.return:
    PLY 
    PLY 
    RTS 


AtmosphericEffects_3_DivingSplash:
    PHY 
    LDA.W $0AEC,Y : AND.W #$00FF : STA.B $12 
    LDA.W $195E : STA.W $0AE4,Y 
    LDA.W #$018F : CLC : ADC.B $12 : PHA 
    BRA AddAtmosphericSpritemapToOAM 


AtmosphericEffects_4_LavaSurfaceDamage:
    TYA 
    BIT.W #$0004 
    BNE .greaterThanEqualTo4 
    LDA.W $0ADC,Y : CLC : ADC.W #$0001 : STA.W $0ADC,Y 
    BRA + 


.greaterThanEqualTo4:
    LDA.W $0ADC,Y : SEC : SBC.W #$0001 : STA.W $0ADC,Y 

  + LDA.W $0AE4,Y : SEC : SBC.W #$0001 : STA.W $0AE4,Y 
    JMP.W AtmosphericEffects_1_2_FootstepSplashes 


AtmosphericEffects_6_7_Dust:
    LDA.W $0AE4,Y : SEC : SBC.W #$0001 : STA.W $0AE4,Y 
    JMP.W AtmosphericEffects_1_2_FootstepSplashes 


AtmosphericEffects_5_Bubbles:
    PHY 
    LDA.W $0AEC,Y : AND.W #$00FF : STA.B $12 
    LDA.W #$0186 : CLC : ADC.B $12 : PHA 

AddAtmosphericSpritemapToOAM:
    LDA.W $0ADC,Y : SEC : SBC.W $0911 : TAX 
    LDA.W $0AE4,Y : SEC : SBC.W $0915 : BIT.W #$FF00 
    BNE .return 
    TAY 
    PLA 
    JSL.L AddSamusSpritemapToOAM 
    PLY 
    RTS 


.return:
    PLA 
    PLY 
    RTS 


AtmosphericGraphics_AnimationTimers:
    dw $0000 
    dw AtmosphericGraphics_1_FootstepSplashes 
    dw AtmosphericGraphics_2_FootstepSplashes 
    dw AtmosphericGraphics_3_DivingSplash 
    dw AtmosphericGraphics_4_LavaSurfaceDamage 
    dw AtmosphericGraphics_5_Bubbles 
    dw AtmosphericGraphics_6_Dust 
    dw AtmosphericGraphics_7_Dust 
    dw $0000 

AtmosphericGraphics_1_FootstepSplashes:
    dw $0003,$0003,$0003,$0003 

AtmosphericGraphics_2_FootstepSplashes:
    dw $0003,$0003,$0003,$0003 

AtmosphericGraphics_3_DivingSplash:
    dw $0002,$0002,$0003,$0003,$0003,$0005,$0005,$0006 
    dw $0007 

AtmosphericGraphics_4_LavaSurfaceDamage:
    dw $0002,$0002,$0002,$0002 

AtmosphericGraphics_5_Bubbles:
    dw $0005,$0005,$0005,$0005,$0005,$0005,$0005,$0005 

AtmosphericGraphics_6_Dust:
    dw $0003,$0004,$0005,$0006 

AtmosphericGraphics_7_Dust:
    dw $0003,$0004,$0005,$0006 

AtmosphericGraphics_NumberOfAnimationFrames:
    dw $0000,$0004,$0004,$0009,$0004,$0008,$0004,$0004 

AtmosphericGraphics_SpriteTileNumberAttributes:
    dw $0000 
    dw AtmosphericGraphics_SpriteTileNumberAttributes_1_Footstep 
    dw $0000 
    dw $0000 
    dw AtmosphericGraphics_SpriteTileNumberAttribute_4_6_7_LavaDust 
    dw $0000 
    dw AtmosphericGraphics_SpriteTileNumberAttribute_4_6_7_LavaDust 
    dw AtmosphericGraphics_SpriteTileNumberAttribute_4_6_7_LavaDust 

AtmosphericGraphics_SpriteTileNumberAttributes_1_Footstep:
    dw $2A2C,$2A2D,$2A2E,$2A2F 

AtmosphericGraphics_SpriteTileNumberAttribute_4_6_7_LavaDust:
    dw $2A48,$2A49,$2A4A,$2A4B 

Calculate_SamusSpritemapPosition:
    LDA.W $093F 
    BPL .notCeres 
    LDA.W $0AF6 : STA.W $0D82 
    LDA.W $0AFA : STA.W $0D84 
    PHX 
    JSL.L Calculate_SamusPosition_InRotatingElevatorRoom 
    PLX 
    TXY 
    LDA.W $0A1F 
    AND.W #$00FF 
    ASL A 
    TAX 
    JSR.W (.pointers,X) 
    LDA.W $0D84 : STA.W $0AFA 
    LDA.W $0D82 : STA.W $0AF6 
    RTS 


.notCeres:
    TXY 
    LDA.W $0A1F 
    AND.W #$00FF 
    ASL A 
    TAX 
    JSR.W (.pointers,X) 
    RTS 


.pointers:
    dw CalculateSamusSpritemapPosition_Standing 
    dw CalculateUsualSamusSpritemapPosition 
    dw CalculateUsualSamusSpritemapPosition 
    dw CalculateUsualSamusSpritemapPosition 
    dw CalculateUsualSamusSpritemapPosition 
    dw CalculateUsualSamusSpritemapPosition 
    dw CalculateUsualSamusSpritemapPosition 
    dw CalculateUsualSamusSpritemapPosition 
    dw CalculateUsualSamusSpritemapPosition 
    dw CalculateUsualSamusSpritemapPosition 
    dw CalculateUsualSamusSpritemapPosition 
    dw CalculateUsualSamusSpritemapPosition 
    dw CalculateUsualSamusSpritemapPosition 
    dw CalculateUsualSamusSpritemapPosition 
    dw CalculateUsualSamusSpritemapPosition 
    dw CalculateSamusSpritemapPosition_TransitionPoses 
    dw CalculateUsualSamusSpritemapPosition 
    dw CalculateUsualSamusSpritemapPosition 
    dw CalculateUsualSamusSpritemapPosition 
    dw CalculateUsualSamusSpritemapPosition 
    dw CalculateUsualSamusSpritemapPosition 
    dw CalculateUsualSamusSpritemapPosition 
    dw CalculateUsualSamusSpritemapPosition 
    dw CalculateUsualSamusSpritemapPosition 
    dw CalculateUsualSamusSpritemapPosition 
    dw CalculateUsualSamusSpritemapPosition 
    dw CalculateUsualSamusSpritemapPosition 
    dw CalculateSamusSpritemapPosition_Shinespark_CF_Drained 

CalculateUsualSamusSpritemapPosition:
    TYA 
    ASL #2
    TAX 
    LDA.L PoseDefinitions_YOffset,X 
    AND.W #$00FF 
    BIT.W #$0080 
    BEQ + 
    ORA.W #$FF00 

  + STA.B $12 
    LDA.W $0AFA : SEC : SBC.B $12 : SEC : SBC.W $0915 : STA.W $0B06 
    TAY 
    LDA.W $0AF6 : SEC : SBC.W $0911 : STA.W $0B04 
    TAX 
    RTS 


CalculateSamusSpritemapPosition_Standing:
    PHB 
    PHK 
    PLB 
    TYA 
    LSR A 
    CMP.W #$0000 
    BEQ .facingForward 
    CMP.W #$009B 
    BEQ .facingForward 
    CMP.W #$00A4 
    BMI Goto_CalculateUsualSamusSpritemapPosition 
    CMP.W #$00A8 
    BPL Goto_CalculateUsualSamusSpritemapPosition 
    SEC : SBC.W #$00A4 : ASL #2
    CLC : ADC.W $0A96 : TAX 
    LDA.W .data,X : STA.B $12 
    LDA.W $0AFA : SEC : SBC.B $12 : SEC : SBC.W $0915 : STA.W $0B06 
    TAY 
    LDA.W $0AF6 : SEC : SBC.W $0911 : STA.W $0B04 
    TAX 
    PLB 
    RTS 


.facingForward:
    LDA.W $0A96 
    CMP.W #$0002 
    BMI Goto_CalculateUsualSamusSpritemapPosition 
    LDA.W $0AFA 
    DEC A 
    SEC : SBC.W $0915 : STA.W $0B06 
    TAY 
    LDA.W $0AF6 : SEC : SBC.W $0911 : STA.W $0B04 
    TAX 
    PLB 
    RTS 


.data:
    db $03,$06,$00,$00,$03,$06,$00,$00,$03,$03,$06,$00,$03,$03,$06,$00 

Goto_CalculateUsualSamusSpritemapPosition:
    PLB 
    JMP.W CalculateUsualSamusSpritemapPosition 


CalculateSamusSpritemapPosition_TransitionPoses:
    PHB 
    PHK 
    PLB 
    TYA 
    LSR A 
    CMP.W #$0035 
    BMI Goto_CalculateUsualSamusSpritemapPosition 
    CMP.W #$0041 
    BPL Goto_CalculateUsualSamusSpritemapPosition 
    SEC : SBC.W #$0035 : ASL A 
    CLC : ADC.W $0A96 : TAX 
    LDA.W .data,X 
    AND.W #$00FF 
    BIT.W #$0080 
    BEQ + 
    ORA.W #$FF00 

  + STA.B $12 
    LDA.W $0AFA : CLC : ADC.B $12 : SEC : SBC.W $0915 : STA.W $0B06 
    TAY 
    LDA.W $0AF6 : SEC : SBC.W $0911 : STA.W $0B04 
    TAX 
    PLB 
    RTS 


.data:
    db $F8,$00,$F8,$00,$FC,$FE,$FC,$FE,$00,$00,$00,$00,$FC,$00,$FC,$00 
    db $05,$04,$05,$04,$00,$00,$00,$00 

CalculateSamusSpritemapPosition_Shinespark_CF_Drained:
    PHB 
    PHK 
    PLB 
    TYA 
    LSR A 
    CMP.W #$00E8 
    BEQ .drainedNotStanding 
    CMP.W #$00E9 
    BEQ .drainedNotStanding 
    CMP.W #$00EA 
    BEQ + 
    CMP.W #$00EB 
    BNE .goto_CalculateUsualSamusSpritemapPosition 

  + LDX.W $0A96 
    CPX.W #$0005 
    BMI .goto_CalculateUsualSamusSpritemapPosition 
    LDA.W #$FFFD 
    BRA .merge 


.goto_CalculateUsualSamusSpritemapPosition:
    JMP.W Goto_CalculateUsualSamusSpritemapPosition 


.drainedNotStanding:
    LDX.W $0A96 
    LDA.W .data,X 
    AND.W #$00FF 
    BIT.W #$0080 
    BEQ .merge 
    ORA.W #$FF00 

.merge:
    STA.B $12 
    LDA.W $0AFA : CLC : ADC.B $12 : SEC : SBC.W $0915 : STA.W $0B06 
    TAY 
    LDA.W $0AF6 : SEC : SBC.W $0911 : STA.W $0B04 
    TAX 
    PLB 
    RTS 


.data:
    db $07,$05,$F8,$F8,$F8,$F8,$F8,$FB,$04,$04,$04,$04,$00,$00,$04,$FD 
    db $FB,$00,$00,$04,$FD,$FB,$FD,$04,$00,$00,$04,$00,$00,$04,$00,$00 

SetLiquidPhysicsType:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    JSL.L Get_Samus_BottomTop_Boundary 
    LDA.W $196E 
    AND.W #$000F 
    TAX 
    JSR.W (.pointers,X) 
    PLB 
    PLP 
    RTL 


.pointers:
    dw SetLiquidPhysicsType_Air 
    dw SetLiquidPhysicsType_LavaAcid 
    dw SetLiquidPhysicsType_LavaAcid 
    dw SetLiquidPhysicsType_Water 
    dw SetLiquidPhysicsType_Air 
    dw SetLiquidPhysicsType_Air 
    dw SetLiquidPhysicsType_Air 
    dw SetLiquidPhysicsType_Air 

SetLiquidPhysicsType_Air:
    STZ.W $0AD2 
    RTS 


SetLiquidPhysicsType_LavaAcid:
    LDA.W $1962 
    BMI SetLiquidPhysicsType_Air 
    CMP.B $12 
    BPL SetLiquidPhysicsType_Air 
    LDA.W #$0002 : STA.W $0AD2 
    RTS 


SetLiquidPhysicsType_Water:
    LDA.W $195E 
    BMI SetLiquidPhysicsType_Air 
    CMP.B $12 
    BMI + 
    BRA SetLiquidPhysicsType_Air 


  + LDA.W $197E 
    BIT.W #$0004 
    BNE SetLiquidPhysicsType_Air 
    LDA.W #$0001 : STA.W $0AD2 
    RTS 


Samus_X_Movement:
    PHP 
    REP #$30 
    JSR.W Handle_Samus_XExtraRunSpeed 
    JSR.W Determine_SamusXSpeedTable_EntryPointer 
    JSR.W CalculateSamusXBaseSpeed_DecelerationAllowed 
    JSR.W MoveSamus_Horizontally 
    PLP 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_SamusMovement_908E75:
    PHP 
    REP #$30 
    JSR.W Determine_SamusXSpeedTable_EntryPointer 
    JSR.W CalculateSamusXBaseSpeed_DecelerationDisallowed 
    LDA.W $0B4A 
    BNE .decelerating 
    LDA.B $8B 
    BIT.W #$0100 
    BNE + 
    BIT.W #$0200 
    BNE + 
    STZ.B $12 
    STZ.B $14 
    STZ.W $0B46 
    STZ.W $0B48 
    STZ.W $0DD0 
    BRA .return 


  + LDA.W #$0002 : STA.W $0B4A 

.decelerating:
    JSR.W MoveSamus_Horizontally 

.return:
    PLP 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


MoveSamus_Horizontally:
    LDA.W $0B4A 
    BEQ .notTurning 
    CMP.W #$0002 
    BEQ .notTurning 
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0008 
    BEQ .leftwards 
    BRA .rightwards 


.notTurning:
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0004 
    BEQ .leftwards 

.rightwards:
    JSR.W CalculateSamusXDisplacement_ForMovingRight 
    BRA .merge 


.leftwards:
    JSR.W CalculateSamusXDisplacement_ForMovingLeft 

.merge:
    LDA.B $12 
    BMI .left 
    JSR.W MoveSamus_Right 
    RTS 


.left:
    JSR.W MoveSamus_Left 
    RTS 


MoveSamus_Horizontally_KnockbackBombJump:
    PHP 
    REP #$30 
    LDA.W $0A52 
    BEQ + 
    JSR.W Determine_SamusXSpeedTable_EntryPointer 
    JSR.W CalculateSamusXBaseSpeed_DecelerationAllowed 
    LDA.W $0A54 
    BNE .rightwards 
    BRA .leftwards 


  + LDX.W #SamusPhysicsConstants_XAccelSpeeds_DiagonalBombJump 
    JSR.W CalculateSamusXBaseSpeed_DecelerationAllowed 
    LDA.W $0A56 
    AND.W #$00FF 
    CMP.W #$0001 
    BEQ .leftwards 

.rightwards:
    JSR.W CalculateSamusXDisplacement_ForMovingRight 
    BRA .merge 


.leftwards:
    JSR.W CalculateSamusXDisplacement_ForMovingLeft 

.merge:
    LDA.B $12 
    BMI .left 
    JSR.W MoveSamus_Right 
    BRA .return 


.left:
    JSR.W MoveSamus_Left 

.return:
    PLP 
    RTS 


Handle_EndOfBombJump:
    PHP 
    REP #$30 
    LDA.W $0B36 
    CMP.W #$0001 
    BNE .return 
    LDA.W $0B2E 
    BMI + 
    CMP.W #$0001 
    BPL .return 
    LDA.W $0A60 
    CMP.W #SamusPoseInputHandler_Demo 
    BEQ .return 
    LDA.W #SamusPoseInputHandler_Normal : STA.W $0A60 
    BRA .return 


  + STZ.W $0B2C 
    STZ.W $0B2E 
    LDA.W #$0002 : STA.W $0B36 
    LDA.W $0A56 
    AND.W #$00FF 
    CMP.W #$0002 
    BEQ .return 
    LDA.W #$0002 : STA.W $0B4A 

.return:
    PLP 
    RTS 


MoveSamus_Horizontally_PushedByCeresRidley:
    PHP 
    REP #$30 
    JSR.W Determine_SamusXSpeedTable_EntryPointer 
    JSR.W CalculateSamusXBaseSpeed_DecelerationAllowed 
    LDA.W $0A62 
    CMP.W #$0001 
    BEQ .left 
    JSR.W CalculateSamusXDisplacement_ForMovingRight 
    BRA + 


.left:
    JSR.W CalculateSamusXDisplacement_ForMovingLeft 

  + LDA.B $12 
    BMI .moveLeft 
    JSR.W MoveSamus_Right 
    BRA .return 


.moveLeft:
    JSR.W MoveSamus_Left 

.return:
    PLP 
    RTS 


MoveSamus_Vertically_PushedByCeresRidley:
    PHP 
    REP #$30 
    LDA.W $0B2E 
    CMP.W #$0005 
    BPL + 
    LDA.W $0B2C : CLC : ADC.W $0B32 : STA.W $0B2C 
    LDA.W $0B2E : ADC.W $0B34 : STA.W $0B2E 

  + LDA.W $0B2C : STA.B $14 
    LDA.W $0B2E : STA.B $12 
    JSR.W MoveSamus_Down 
    PLP 
    RTS 


Samus_Jumping_Movement:
    PHP 
    REP #$30 
    JSR.W Handle_Samus_XExtraRunSpeed 
    LDA.W $0A1C 
    CMP.W #$004B 
    BEQ + 
    CMP.W #$004C 
    BEQ + 
    CMP.W #$0055 
    BMI .jumping 
    CMP.W #$005B 
    BPL .jumping 

  + STZ.W $0B4A 
    JSR.W MoveSamus_HorizontallyWithZeroBaseXSpeed 
    JSR.W MoveSamus_ByExtraYDisplacement 
    JMP.W .return ; >.<


.jumping:
    LDA.W $0B36 
    CMP.W #$0001 
    BNE .setFallingEnd 
    LDA.B $8B 
    AND.W $09B4 
    BEQ + 
    LDA.W $0B2E 
    BPL .setFallingEnd 

  + STZ.W $0B2C 
    STZ.W $0B2E 
    LDA.W #$0002 : STA.W $0B36 

.setFallingEnd:
    JSR.W Determine_SamusXSpeedTable_EntryPointer 
    JSR.W CalculateSamusXBaseSpeed_DecelerationDisallowed 
    LDA.W $0A1F 
    AND.W #$00FF 
    CMP.W #$0014 
    BEQ .wallJumping 
    LDA.W $0B4A 
    BNE .XMovement 
    LDA.B $8B 
    BIT.W #$0100 
    BNE .XMovement 
    BIT.W #$0200 
    BNE .XMovement 
    STZ.B $12 
    STZ.B $14 
    STZ.W $0B46 
    STZ.W $0B48 
    STZ.W $0DD0 
    BRA .noXMovement 


.wallJumping:
    LDA.W $0B4A 
    BNE .XMovement 
    LDA.W #$0002 : STA.W $0B4A 

.XMovement:
    JSR.W MoveSamus_Horizontally 

.noXMovement:
    JSR.W Samus_Y_Movement_WithSpeedCalculations 

.return:
    PLP 
    RTS 


Samus_SpinJumping_Movement:
    PHP 
    REP #$30 
    JSR.W Handle_Samus_XExtraRunSpeed 
    LDA.W $0B36 
    CMP.W #$0001 
    BNE .setFallingEnd 
    LDA.B $8B 
    AND.W $09B4 
    BEQ + 
    LDA.W $0B2E 
    BPL .setFallingEnd 

  + STZ.W $0B2C 
    STZ.W $0B2E 
    LDA.W #$0002 : STA.W $0B36 

.setFallingEnd:
    JSR.W Determine_SamusXSpeedTable_EntryPointer 
    JSR.W CalculateSamusXBaseSpeed_DecelerationDisallowed 
    BCS .allowXMovement 
    LDA.W $0B4A 
    CMP.W #$0001 
    BEQ .allowXMovement 
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0004 
    BEQ .leftwards 
    LDA.B $8B 
    BIT.W #$0100 
    BEQ + 
    BRA .allowXMovement 


.leftwards:
    LDA.B $8B 
    BIT.W #$0200 
    BEQ + 
    BRA .allowXMovement 


  + STZ.B $12 
    STZ.B $14 
    STZ.W $0B46 
    STZ.W $0B48 
    STZ.W $0DD0 
    STZ.W $0B4A 
    BRA .merge 


.allowXMovement:
    LDA.W $0B4A 
    BNE .merge 
    LDA.W #$0002 : STA.W $0B4A 

.merge:
    JSR.W MoveSamus_Horizontally 
    LDA.W SamusPhysicsConstants_MaximumDistanceFromWallForWallJump : STA.B $12 
    STZ.B $14 
    JSR.W WallJump_Check 
    BCS .return 
    JSR.W Samus_Y_Movement_WithSpeedCalculations 

.return:
    PLP 
    RTS 


CheckIfSamusHasStartedFalling:
    PHP 
    REP #$30 
    LDA.W $0B36 
    CMP.W #$0001 
    BNE .return 
    LDA.W $0B2E 
    BPL .return 
    STZ.W $0B2C 
    STZ.W $0B2E 
    LDA.W #$0002 : STA.W $0B36 

.return:
    PLP 
    RTS 


Samus_Y_Movement_WithSpeedCalculations:
    PHP 
    REP #$30 
    LDA.W $0B2C : STA.B $14 
    LDA.W $0B2E : STA.B $12 
    LDA.W $0B36 
    CMP.W #$0002 
    BEQ .down 
    LDA.W $0B2C : SEC : SBC.W $0B32 : STA.W $0B2C 
    LDA.W $0B2E : SBC.W $0B34 : STA.W $0B2E 
    BRA + 


.down:
    LDA.W $0B2E 
    CMP.W #$0005 
    BEQ + 
    LDA.W $0B2C : CLC : ADC.W $0B32 : STA.W $0B2C 
    LDA.W $0B2E : ADC.W $0B34 : STA.W $0B2E 

  + LDA.W $0B5C 
    BEQ .checkDirection 
    LDA.W $0B5A 
    BEQ .checkDirection 
    NOP 

.checkDirection:
    LDA.W $0B36 
    CMP.W #$0002 
    BEQ .notDown 
    LDA.B $12 : EOR.W #$FFFF : STA.B $12 
    LDA.B $14 
    EOR.W #$FFFF 
    INC A 
    STA.B $14 
    BNE .notDown 
    INC.B $12 

.notDown:
    LDA.W $0B5A : CLC : ADC.B $14 : STA.B $14 
    LDA.W $0B5C : ADC.B $12 : STA.B $12 
    BMI .moveUp 
    JSR.W MoveSamus_Down 
    BRA .return 


.moveUp:
    JSR.W MoveSamus_Up 

.return:
    PLP 
    RTS 


Samus_Falling_Movement:
    PHP 
    REP #$30 
    JSR.W Handle_Samus_XExtraRunSpeed 
    JSR.W Determine_SamusXSpeedTable_EntryPointer 
    JSR.W CalculateSamusXBaseSpeed_DecelerationDisallowed 
    LDA.W $0B4A 
    BNE .pressingLeftRight 
    LDA.B $8B 
    BIT.W #$0100 
    BNE .pressingLeftRight 
    BIT.W #$0200 
    BNE .pressingLeftRight 
    STZ.B $12 
    STZ.B $14 
    STZ.W $0B46 
    STZ.W $0B48 
    STZ.W $0DD0 
    BRA + 


.pressingLeftRight:
    JSR.W MoveSamus_Horizontally 

  + JSR.W CheckIfSamusHasStartedFalling 
    JSR.W Samus_Y_Movement_WithSpeedCalculations 
    PLP 
    RTS 


Samus_Morphed_Falling_Movement:
    PHP 
    REP #$30 
    JSR.W Determine_SamusXSpeedTable_EntryPointer 
    JSR.W CalculateSamusXBaseSpeed_DecelerationDisallowed 
    LDA.W $0B4A 
    BNE .moveHorizontally 
    LDA.B $8B 
    BIT.W #$0100 
    BNE .moveHorizontally 
    BIT.W #$0200 
    BNE .moveHorizontally 
    STZ.B $12 
    STZ.B $14 
    STZ.W $0B46 
    STZ.W $0B48 
    STZ.W $0DD0 

.moveHorizontally:
    JSR.W MoveSamus_Horizontally 
    JSR.W CheckIfSamusHasStartedFalling 
    JSR.W Samus_Y_Movement_WithSpeedCalculations 
    PLP 
    RTS 


Samus_Morphed_Bouncing_Movement:
    PHP 
    REP #$30 
    JSR.W Determine_SamusXSpeedTable_EntryPointer 
    JSR.W CalculateSamusXBaseSpeed_DecelerationDisallowed 
    LDA.W $0B4A 
    BNE .pressingLeftRight 
    LDA.B $8B 
    BIT.W #$0100 
    BNE .pressingLeftRight 
    BIT.W #$0200 
    BNE .pressingLeftRight 
    STZ.B $12 
    STZ.B $14 
    STZ.W $0B46 
    STZ.W $0B48 
    STZ.W $0DD0 

.pressingLeftRight:
    JSR.W MoveSamus_Horizontally 
    LDA.W $0A52 
    BNE .return 
    LDA.W $0B5C 
    BNE .extraYDisplacement 
    LDA.W $0B5A 
    BEQ .noExtraDisplacement 

.extraYDisplacement:
    LDA.W #$0002 : STA.W $0B36 
    STZ.W $0B2C 
    STZ.W $0B2E 
    STZ.B $14 
    STZ.B $12 
    LDA.W $0B5A : CLC : ADC.B $14 : STA.B $14 
    LDA.W $0B5C : ADC.B $12 : STA.B $12 
    BMI .moveUp 
    INC.B $12 
    JSR.W MoveSamus_Down 
    BRA .return 


.moveUp:
    JSR.W MoveSamus_Up 
    BRA .return 


.noExtraDisplacement:
    JSR.W CheckIfSamusHasStartedFalling 
    JSR.W Samus_Y_Movement_WithSpeedCalculations 

.return:
    PLP 
    RTS 


Samus_Y_Movement_NoSpeedCalculations:
    PHP 
    REP #$30 
    LDA.W $0B5C 
    BNE .useExtraDisplacement 
    LDA.W $0B5A 
    BNE .useExtraDisplacement 
    LDA.W $0DBA 
    BNE .adjustedBySlope 
    LDA.W $0DBE : STA.B $14 
    LDA.W $0DBC 
    INC A 
    STA.B $12 
    BRA .gotoMoveDown 


.adjustedBySlope:
    STZ.B $14 
    LDA.W #$0001 : STA.B $12 

.gotoMoveDown:
    BRA .moveDown 


.useExtraDisplacement:
    STZ.B $14 
    STZ.B $12 
    LDA.W $0B5A : CLC : ADC.B $14 : STA.B $14 
    LDA.W $0B5C : ADC.B $12 : STA.B $12 
    BMI .moveUp 
    INC.B $12 

.moveDown:
    JSR.W MoveSamus_Down 
    BRA .return 


.moveUp:
    JSR.W MoveSamus_Up 

.return:
    PLP 
    RTS 


MoveSamus_ByExtraYDisplacement:
    PHP 
    REP #$30 
    LDA.W $0B5C 
    BNE .move 
    LDA.W $0B5A 
    BNE .move 
    PLP 
    RTS 


.move:
    STZ.B $14 
    STZ.B $12 
    LDA.W $0B5A : CLC : ADC.B $14 : STA.B $14 
    LDA.W $0B5C : ADC.B $12 : STA.B $12 
    BMI .moveUp 
    INC.B $12 
    JSR.W MoveSamus_Down 
    BRA .return 


.moveUp:
    JSR.W MoveSamus_Up 

.return:
    PLP 
    RTS 


Simple_Samus_Y_Movement:
    LDA.W $0B36 
    BNE .movingUpDown 
    CLC 
    RTS 


.movingUpDown:
    JSR.W CheckIfSamusHasStartedFalling 
    JSR.W Samus_Y_Movement_WithSpeedCalculations 
    SEC 
    RTS 


Simple_Samus_Y_Movement_duplicate:
    LDA.W $0B36 
    BNE .movingUpDown 
    CLC 
    RTS 


.movingUpDown:
    JSR.W CheckIfSamusHasStartedFalling 
    JSR.W Samus_Y_Movement_WithSpeedCalculations 
    SEC 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_MoveSamus_9092D6:
    PHP 
    REP #$30 
    BRA .uselessBranch ; >.<


.uselessBranch:
    LDA.W $0AFA : CLC : ADC.B $12 : STA.W $0AFA 
    STA.W $0B14 
    PLP 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


RTS_9092E9:
    RTS 

    PHP 
    REP #$30 
    LDA.W #$0001 : STA.B $12 
    STZ.B $14 
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0004 
    BEQ .facingLeft 
    LDA.B $8B 
    BIT.W #$0100 
    BNE .rightwards 
    BRA .return 


.facingLeft:
    LDA.B $8B 
    BIT.W #$0200 
    BNE .leftwards 
    BRA .return 


.rightwards:
    JSR.W CalculateSamusXDisplacement_ForMovingRight 
    BRA .merge 


.leftwards:
    JSR.W CalculateSamusXDisplacement_ForMovingLeft 

.merge:
    LDA.B $12 
    BMI .moveLeft 
    JSR.W MoveSamus_Right 
    BRA + 


.moveLeft:
    JSR.W MoveSamus_Left 

  + LDA.W $0DD0 
    BNE .return 
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0004 
    BEQ .leftFacing 
    LDA.W #$0009 : STA.W $0A28 
    BRA + 


.leftFacing:
    LDA.W #$000A : STA.W $0A28 

  + STZ.W $0DC6 

.return:
    PLP 
    RTS 


MoveSamus_HorizontallyWithZeroBaseXSpeed:
    STZ.B $12 
    STZ.B $14 
    JSR.W MoveSamus_Horizontally 
    RTS 


MoveSamus_Left:
    PHP 
    REP #$30 
    LDA.B $12 : EOR.W #$FFFF : STA.B $12 
    LDA.B $14 
    EOR.W #$FFFF 
    INC A 
    STA.B $14 
    BNE .checkSolidEnemyCollision 
    INC.B $12 

.checkSolidEnemyCollision:
    JSL.L Samus_vs_SolidEnemy_CollisionDetection 
    STA.W $0DD0 
    TAX 
    BEQ .noSolidEnemyCollision 
    JSR.W Kill_SamusXSpeed_IfCollisionDetected 
    JSR.W MoveSamus_Left_NoCollisionDetection 
    JSL.L Align_SamusYPosition_WithNonSquareSlope 
    PLP 
    RTS 


.noSolidEnemyCollision:
    LDA.B $12 : EOR.W #$FFFF : STA.B $12 
    LDA.B $14 
    EOR.W #$FFFF 
    INC A 
    STA.B $14 
    BNE .moveRight 
    INC.B $12 

.moveRight:
    JSL.L MoveSamusRight_NoSolidEnemyCollision 
    LDA.B $14 : STA.W $0DAC 
    LDA.B $12 : STA.W $0DAA 
    LDA.W $0B02 
    BIT.W #$0001 
    BEQ + 
    STZ.W $0DD0 

  + JSR.W Kill_SamusXSpeed_IfCollisionDetected 
    JSL.L Align_SamusYPosition_WithNonSquareSlope 
    PLP 
    RTS 


MoveSamus_Right:
    PHP 
    REP #$30 
    JSL.L Samus_vs_SolidEnemy_CollisionDetection 
    STA.W $0DD0 
    TAX 
    BEQ + 
    JSR.W Kill_SamusXSpeed_IfCollisionDetected 
    JSR.W MoveSamus_Right_NoCollisionDetection 
    JSL.L Align_SamusYPosition_WithNonSquareSlope 
    PLP 
    RTS 


  + JSL.L MoveSamusRight_NoSolidEnemyCollision 
    LDA.B $14 : STA.W $0DB0 
    LDA.B $12 : STA.W $0DAE 
    LDA.W $0B02 
    BIT.W #$0001 
    BNE + 
    STZ.W $0DD0 

  + JSR.W Kill_SamusXSpeed_IfCollisionDetected 
    JSL.L Align_SamusYPosition_WithNonSquareSlope 
    PLP 
    RTS 


MoveSamus_Up:
    PHP 
    REP #$30 
    LDA.W #$0002 : STA.W $0B02 
    LDA.B $12 : EOR.W #$FFFF : STA.B $12 
    LDA.B $14 
    EOR.W #$FFFF 
    INC A 
    STA.B $14 
    BNE + 
    INC.B $12 

  + JSL.L Samus_vs_SolidEnemy_CollisionDetection 
    STA.W $0DD0 
    TAX 
    BEQ + 
    JSR.W SetSamusSolidVerticalCollisionResult_UpwardsMovement 
    JSR.W MoveSamus_Up_NoCollisionDetection 
    PLP 
    RTS 


  + LDA.B $12 : EOR.W #$FFFF : STA.B $12 
    LDA.B $14 
    EOR.W #$FFFF 
    INC A 
    STA.B $14 
    BNE + 
    INC.B $12 

  + JSL.L MoveSamusDown_NoSolidEnemyCollision 
    LDA.B $14 : STA.W $0DB4 
    LDA.B $12 : STA.W $0DB2 
    JSR.W SetSamusSolidVerticalCollisionResult_UpwardsMovement 
    PLP 
    RTS 


MoveSamus_Down:
    PHP 
    REP #$30 
    LDA.W #$0003 : STA.W $0B02 
    JSL.L Samus_vs_SolidEnemy_CollisionDetection 
    STA.W $0DD0 
    TAX 
    BEQ .move 
    JSR.W SetSamusSolidVerticalCollisionResult_DownwardsMovement 
    JSR.W MoveSamus_Down_NoCollisionDetection 
    PLP 
    RTS 


.move:
    JSL.L MoveSamusDown_NoSolidEnemyCollision 
    LDA.B $14 : STA.W $0DB8 
    LDA.B $12 : STA.W $0DB6 
    JSR.W SetSamusSolidVerticalCollisionResult_DownwardsMovement 
    PLP 
    RTS 


SamusMovementHandler_ReleasedFromGrappleSwing:
    LDA.W $0B36 
    CMP.W #$0001 
    BNE .up 
    LDA.W $0B2E 
    BPL .up 
    STZ.W $0B2C 
    STZ.W $0B2E 
    LDA.W #$0002 : STA.W $0B36 
    LDA.W #SamusMovementHandler_Normal : STA.W $0A58 

.up:
    LDA.W #$0002 : STA.W $0B4A 
    JSR.W DetermineGrappleSwing_SamusXSpeedTable_EntryPointer 
    JSR.W CalculateSamusXBaseSpeed_DecelerationAllowed 
    LDA.W $0B4A 
    BNE .pressingLeftRight 
    LDA.B $8B 
    BIT.W #$0100 
    BNE .pressingLeftRight 
    BIT.W #$0200 
    BNE .pressingLeftRight 
    STZ.B $12 
    STZ.B $14 
    STZ.W $0B46 
    STZ.W $0B48 
    STZ.W $0DD0 
    BRA .YMovement 


.pressingLeftRight:
    JSR.W MoveSamus_Horizontally 

.YMovement:
    JSR.W Samus_Y_Movement_WithSpeedCalculations 
    LDA.W $0DC6 
    BEQ .return 
    LDA.W #SamusMovementHandler_Normal : STA.W $0A58 

.return:
    RTS 


SamusMovementHandler_SamusDrained_Falling:
    JSR.W Samus_Y_Movement_WithSpeedCalculations 
    LDA.W $0DD0 
    BEQ .return 
    LDA.W #SamusMovementHandler_Normal : STA.W $0A58 
    LDA.W #$0008 : STA.W $0A94 
    LDA.W #$0007 : STA.W $0A96 
    STZ.W $0B2C 
    STZ.W $0B2E 

.return:
    RTS 


Main_Scrolling_Routine:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    LDA.W $0CF8 
    BEQ .normalScrolling 
    LDA.W $0AF6 
    BMI .grappleScrollVerticalEnd 
    SEC : SBC.W $0911 : BCC .grappleScrollLeft 
    CMP.W #$00A0 
    BCC + 
    LDA.W $0911 : CLC : ADC.W #$0003 : STA.W $0911 
    BRA .grappleScrollHorizontalEnd 


  + CMP.W #$0060 
    BCS .grappleScrollHorizontalEnd 

.grappleScrollLeft:
    LDA.W $0911 : SEC : SBC.W #$0003 : STA.W $0911 

.grappleScrollHorizontalEnd:
    LDA.W $0AFA 
    BMI .grappleScrollVerticalEnd 
    SEC : SBC.W $0915 : BCC .grappleScrollUp 
    CMP.W #$0090 
    BCC + 
    LDA.W $0915 : CLC : ADC.W #$0003 : STA.W $0915 
    BRA .grappleScrollVerticalEnd 


  + CMP.W #$0070 
    BCS .grappleScrollVerticalEnd 

.grappleScrollUp:
    LDA.W $0915 : SEC : SBC.W #$0003 : STA.W $0915 

.grappleScrollVerticalEnd:
    JSL.L HandleScrollZones_HorizontalAutoscrolling 
    JSL.L HandleScrollZones_VerticalAutoscrolling 
    BRA .finishedScrolling 


.normalScrolling:
    JSR.W Calculate_CameraXSpeed 
    JSR.W Handle_Horizontal_Scrolling 
    JSR.W CalculateVerticalDistanceSamusMovedLastFrame 
    JSR.W Handle_Vertical_Scrolling 

.finishedScrolling:
    LDX.W $07E9 
    BEQ + 
    LDX.W #$0000 
    JSR.W ($07E9,X) 

  + LDA.W $0AF6 : STA.W $0B10 
    LDA.W $0AF8 : STA.W $0B12 
    LDA.W $0AFA : STA.W $0B14 
    LDA.W $0AFC : STA.W $0B16 
    PLB 
    PLP 
    RTL 


ScrollingFinishedHook_SporeSpawnFight:
    LDA.W #$01D0 
    CMP.W $0915 
    BCC .return 
    STA.W $0915 

.return:
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_CameraXSpeed_0_909595:
    PHP 
    REP #$30 
    STZ.W $0DA4 
    STZ.W $0DA2 
    PLP 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


Handle_Horizontal_Scrolling:
    PHP 
    REP #$30 
    LDA.W $0B10 
    CMP.W $0AF6 
    BNE + 
    JSL.L HandleScrollZones_HorizontalAutoscrolling 
    JMP.W .return 


  + LDA.W $0911 : STA.B $12 
    LDA.W $0A52 
    BNE .backwards 
    LDA.W $0A1F 
    AND.W #$00FF 
    CMP.W #$0010 
    BNE .forwards 

.backwards:
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0004 
    BEQ .right 
    BRA .left 


.forwards:
    LDA.W $0B4A 
    CMP.W #$0001 
    BEQ .backwards 
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0004 
    BEQ .left 

.right:
    LDX.W $0941 
    LDA.W $0AF6 : SEC : SBC.W .facingRight,X : STA.W $0B0A 
    BRA .merge 


.left:
    LDX.W $0941 
    LDA.W $0AF6 : SEC : SBC.W .facingLeft,X : STA.W $0B0A 

.merge:
    LDA.W $0B0A 
    CMP.W $0911 
    BEQ .return 
    BMI + 
    LDA.W $090F : CLC : ADC.W $0DA4 : STA.W $090F 
    LDA.W $0911 : ADC.W $0DA2 : STA.W $0911 
    JSL.L HandleScrollZones_ScrollingRight 
    BRA .return 


  + LDA.W $090F : SEC : SBC.W $0DA4 : STA.W $090F 
    LDA.W $0911 : SBC.W $0DA2 : STA.W $0911 
    JSL.L HandleScrollZones_ScrollingLeft 

.return:
    PLP 
    RTS 


.facingRight:
    dw $0060,$0040,$0020,$00E0 

.facingLeft:
    dw $00A0,$0050,$0020,$00E0 

Handle_Vertical_Scrolling:
    PHP 
    REP #$30 
    LDA.W $0B14 
    CMP.W $0AFA 
    BNE + 
    JSL.L HandleScrollZones_VerticalAutoscrolling 
    JMP.W .return 


  + LDA.W $0915 : STA.B $12 
    LDA.W $0B36 
    CMP.W #$0001 
    BEQ .up 
    LDA.W $0AFA : SEC : SBC.W $07AD : STA.W $0B0E 
    BRA + 


.up:
    LDA.W $0AFA : SEC : SBC.W $07AF : STA.W $0B0E 

  + LDA.W $0B0E 
    CMP.W $0915 
    BEQ .return 
    BMI .idealLessThanActual 
    LDA.W $0913 : CLC : ADC.W $0DA8 : STA.W $0913 
    LDA.W $0915 : ADC.W $0DA6 : STA.W $0915 
    JSL.L HandleScrollZones_ScrollingDown 
    BRA .return 


.idealLessThanActual:
    LDA.W $0913 : SEC : SBC.W $0DA8 : STA.W $0913 
    LDA.W $0915 : SBC.W $0DA6 : STA.W $0915 
    JSL.L HandleScrollZones_ScrollingUp 

.return:
    PLP 
    RTS 


Calculate_CameraXSpeed:
    PHP 
    REP #$30 
    LDA.W $0AF6 
    CMP.W $0B10 
    BMI + 
    BRA .right 


  + LDA.W $0B12 : SEC : SBC.W $0AF8 : STA.W $0DA4 
    LDA.W $0B10 : SBC.W $0AF6 : CLC : ADC.W SamusPhysicsConstants_CameraXOffsetFromSamusWhenTurning : STA.W $0DA2 
    BRA .return 


.right:
    LDA.W $0AF8 : SEC : SBC.W $0B12 : STA.W $0DA4 
    LDA.W $0AF6 : SBC.W $0B10 : CLC : ADC.W SamusPhysicsConstants_CameraXOffsetFromSamusWhenTurning : STA.W $0DA2 

.return:
    PLP 
    RTS 


CalculateVerticalDistanceSamusMovedLastFrame:
    PHP 
    REP #$30 
    LDA.W $0AFA 
    CMP.W $0B14 
    BMI + 
    BRA .down 


  + LDA.W $0B16 : SEC : SBC.W $0AFC : STA.W $0DA8 
    LDA.W $0B14 : SBC.W $0AFA : CLC : ADC.W SamusPhysicsConstants_CameraXOffsetFromSamusWhenTurning : STA.W $0DA6 
    BRA .return 


.down:
    LDA.W $0AFC : SEC : SBC.W $0B16 : STA.W $0DA8 
    LDA.W $0AFA : SBC.W $0B14 : CLC : ADC.W SamusPhysicsConstants_CameraXOffsetFromSamusWhenTurning : STA.W $0DA6 

.return:
    PLP 
    RTS 


Handle_Samus_XExtraRunSpeed:
    PHP 
    REP #$30 
    LDA.W $09A2 
    BIT.W #$0020 
    BNE .gravity 
    JSL.L Get_Samus_Bottom_Boundary 
    LDA.W $195E 
    BMI .negativeYPosition 
    CMP.B $12 
    BMI .submerged 
    BRA .gravity 


.negativeYPosition:
    LDA.W $1962 
    BMI .gravity 
    CMP.B $12 
    BMI .gotoNotRunning 

.gravity:
    LDX.W #$0000 
    BRA .gravityContinued 


.submerged:
    LDA.W $197E 
    BIT.W #$0004 
    BNE .gravity 

.gotoNotRunning:
    JMP.W .notRunning 


.gravityContinued:
    LDA.W $0A1F 
    AND.W #$00FF 
    CMP.W #$0001 
    BEQ .checkDash 
    JMP.W .notRunning 


.checkDash:
    LDA.B $8B 
    AND.W $09B6 
    BNE .running 
    JMP.W .notRunning 


.running:
    LDA.W $09A2 
    BIT.W #$2000 
    BEQ .noSpeedBooster 
    LDA.W $0B3C 
    BNE .hasMomentum 
    LDA.W #$0001 : STA.W $0B3C 
    STA.W $0AD0 
    STZ.W $0ACE 
    LDA.L SpeedBoostTimerResetValues : STA.W $0B3E 

.hasMomentum:
    LDA.W $0B42 
    CMP.W SamusPhysicsConstants_MaxXExtraRunSpeeds_SpeedBooster,X 
    BMI .accelerating 
    LDA.W $0B44 
    CMP.W SamusPhysicsConstants_MaxXExtraRunSubSpeeds_SpeedBooster,X 
    BMI .accelerating 
    LDA.W SamusPhysicsConstants_MaxXExtraRunSpeeds_SpeedBooster,X : STA.W $0B42 
    LDA.W SamusPhysicsConstants_MaxXExtraRunSubSpeeds_SpeedBooster,X : STA.W $0B44 
    BRA .done 


.noSpeedBooster:
    LDA.W $0B3C 
    BNE + 
    LDA.W #$0001 : STA.W $0B3C 
    STZ.W $0B3E 

  + LDA.W $0B42 
    CMP.W SamusPhysicsConstants_MaxXExtraRunSpeeds_NoSpeedBooster_0,X 
    BMI .accelerating 
    LDA.W $0B44 
    CMP.W SamusPhysicsConstants_MaxXExtraRunSpeeds_NoSpeedBooster_1,X 
    BMI .accelerating 
    LDA.W SamusPhysicsConstants_MaxXExtraRunSpeeds_NoSpeedBooster_0,X : STA.W $0B42 
    LDA.W SamusPhysicsConstants_MaxXExtraRunSpeeds_NoSpeedBooster_1,X : STA.W $0B44 
    BRA .done 


.accelerating:
    LDA.W $0B44 : CLC : ADC.W SamusPhysicsConstants_XSubAccelerations_DashHeld,X : STA.W $0B44 
    LDA.W $0B42 : ADC.W SamusPhysicsConstants_XAccelerations_DashHeld,X : STA.W $0B42 
    BRA .done 


.notRunning:
    LDA.W $0B3C 
    BNE .done 
    STZ.W $0B42 
    STZ.W $0B44 

.done:
    LDA.W $0B3E 
    AND.W #$FF00 
    CMP.W #$0400 
    BNE .return 
    LDA.W #$0001 : STA.W $0A6E 

.return:
    PLP 
    RTS 


MoveSamus_Right_NoCollisionDetection:
    LDA.W $0AF8 : CLC : ADC.B $14 : STA.W $0AF8 
    LDA.W $0AF6 : ADC.B $12 : STA.W $0AF6 
    LDA.B $14 : STA.W $0DB0 
    LDA.B $12 : STA.W $0DAE 
    RTS 


MoveSamus_Left_NoCollisionDetection:
    LDA.W $0AF8 : SEC : SBC.B $14 : STA.W $0AF8 
    LDA.W $0AF6 : SBC.B $12 : STA.W $0AF6 
    LDA.B $12 : EOR.W #$FFFF : STA.B $12 
    LDA.B $14 
    EOR.W #$FFFF 
    INC A 
    STA.B $14 
    BNE + 
    INC.B $12 

  + LDA.B $14 : STA.W $0DAC 
    LDA.B $12 : STA.W $0DAA 
    RTS 


MoveSamus_Down_NoCollisionDetection:
    LDA.W $0AFC : CLC : ADC.B $14 : STA.W $0AFC 
    LDA.W $0AFA : ADC.B $12 : STA.W $0AFA 
    LDA.B $14 : STA.W $0DB8 
    LDA.B $12 : STA.W $0DB6 
    RTS 


MoveSamus_Up_NoCollisionDetection:
    LDA.W $0AFC : SEC : SBC.B $14 : STA.W $0AFC 
    LDA.W $0AFA : SBC.B $12 : STA.W $0AFA 
    LDA.B $12 : EOR.W #$FFFF : STA.B $12 
    LDA.B $14 
    EOR.W #$FFFF 
    INC A 
    STA.B $14 
    BNE + 
    INC.B $12 

  + LDA.B $14 : STA.W $0DB4 
    LDA.B $12 : STA.W $0DB2 
    RTS 


Make_Samus_Jump:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    LDA.W $09A2 
    BIT.W #$0020 
    BNE .normalGravity 
    JSL.L Get_Samus_Bottom_Boundary 
    LDA.W $195E 
    BMI .negativeYPosition 
    CMP.B $12 
    BMI .submergedInWater 
    BRA .normalGravity 


.negativeYPosition:
    LDA.W $1962 
    BMI .normalGravity 
    CMP.B $12 
    BMI .submergedInAcidLava 

.normalGravity:
    LDX.W #$0000 
    BRA .merge 


.submergedInWater:
    LDA.W $197E 
    BIT.W #$0004 
    BNE .normalGravity 
    LDX.W #$0002 
    BRA .merge 


.submergedInAcidLava:
    LDX.W #$0004 

.merge:
    LDA.W $09A2 
    BIT.W #$0100 
    BNE .hiJumpEquipped 
    LDA.W SamusPhysicsConstants_InitialYSubSpeeds_Jumping,X : STA.W $0B2C 
    LDA.W SamusPhysicsConstants_InitialYSpeeds_Jumping,X : STA.W $0B2E 
    BRA + 


.hiJumpEquipped:
    LDA.W SamusPhysicsConstants_InitialYSubSpeeds_HiJumpJumping,X : STA.W $0B2C 
    LDA.W SamusPhysicsConstants_InitialYSpeeds_HiJumpJumping,X : STA.W $0B2E 

  + LDA.W $09A2 
    BIT.W #$2000 
    BEQ + 
    LDA.W $0B42 
    LSR A 
    STA.B $12 
    LDA.W $0B2C : CLC : ADC.W $0B44 : STA.W $0B2C 
    LDA.W $0B2E : CLC : ADC.B $12 : STA.W $0B2E 

  + STZ.W $0A9E 
    STZ.W $0AA0 
    LDA.W #$0001 : STA.W $0B36 
    PLB 
    PLP 
    RTL 


Make_Samus_WallJump:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    LDA.W $09A2 
    BIT.W #$0020 
    BNE .normalGravity 
    JSL.L Get_Samus_Bottom_Boundary 
    LDA.W $195E 
    BMI .negativeYPosition 
    CMP.B $12 
    BMI .submergedInWater 
    BRA .normalGravity 


.negativeYPosition:
    LDA.W $1962 
    BMI .normalGravity 
    CMP.B $12 
    BMI .submergedInAcidLava 

.normalGravity:
    LDX.W #$0000 
    BRA .merge 


.submergedInWater:
    LDA.W $197E 
    BIT.W #$0004 
    BNE .normalGravity 
    LDX.W #$0002 
    BRA .merge 


.submergedInAcidLava:
    LDX.W #$0004 

.merge:
    LDA.W $09A2 
    BIT.W #$0100 
    BNE .hiJumpEquipped 
    LDA.W SamusPhysicsConstants_InitialYSubSpeeds_WallJumping,X : STA.W $0B2C 
    LDA.W SamusPhysicsConstants_InitialYSpeeds_WallJumping,X : STA.W $0B2E 
    BRA + 


.hiJumpEquipped:
    LDA.W SamusPhysicsConstants_InitialYSubSpeeds_HiJumpWallJumping,X : STA.W $0B2C 
    LDA.W SamusPhysicsConstants_InitialYSpeeds_HiJumpWallJumping,X : STA.W $0B2E 

  + LDA.W $09A2 
    BIT.W #$2000 
    BEQ + 
    LDA.W $0B42 
    LSR A 
    STA.B $12 
    LDA.W $0B2C : CLC : ADC.W $0B44 : STA.W $0B2C 
    LDA.W $0B2E : CLC : ADC.B $12 : STA.W $0B2E 

  + STZ.W $0A9E 
    STZ.W $0AA0 
    LDA.W #$0001 : STA.W $0B36 
    PLB 
    PLP 
    RTL 


SetSamusYSpeedForKnockback:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    LDA.W $09A2 
    BIT.W #$0020 
    BNE .inAir 
    JSL.L Get_Samus_Bottom_Boundary 
    LDA.W $195E 
    BMI .negativeYPosition 
    CMP.B $12 
    BMI .inWater 
    BRA .inAir 


.negativeYPosition:
    LDA.W $1962 
    BMI .inAir 
    CMP.B $12 
    BMI .inAcidLava 

.inAir:
    LDX.W #$0000 
    BRA .merge 


.inWater:
    LDA.W $197E 
    BIT.W #$0004 
    BNE .inAir 
    LDX.W #$0002 
    BRA .merge 


.inAcidLava:
    LDX.W #$0004 

.merge:
    LDA.W SamusPhysicsConstants_InitialYSubSpeeds_Knockback,X : STA.W $0B2C 
    LDA.W SamusPhysicsConstants_InitialYSpeeds_Knockback,X : STA.W $0B2E 
    STZ.W $0A9E 
    STZ.W $0AA0 
    LDA.W #$0001 : STA.W $0B36 
    PLB 
    PLP 
    RTL 


Make_Samus_BombJump:
    PHP 
    REP #$30 
    LDA.W $09A2 
    BIT.W #$0020 
    BNE .normalGravity 
    JSL.L Get_Samus_Bottom_Boundary 
    LDA.W $195E 
    BMI .negativeYPosition 
    CMP.B $12 
    BMI .submergedInWater 
    BRA .normalGravity 


.negativeYPosition:
    LDA.W $1962 
    BMI .normalGravity 
    CMP.B $12 
    BMI .submergedInAcidLava 

.normalGravity:
    LDX.W #$0000 
    BRA .merge 


.submergedInWater:
    LDA.W $197E 
    BIT.W #$0004 
    BNE .normalGravity 
    LDX.W #$0002 
    BRA .merge 


.submergedInAcidLava:
    LDX.W #$0004 

.merge:
    LDA.W SamusPhysicsConstants_InitialYSubSpeeds_BombJump,X : STA.W $0B2C 
    LDA.W SamusPhysicsConstants_InitialYSpeeds_BombJump,X : STA.W $0B2E 
    STZ.W $0A9E 
    STZ.W $0AA0 
    LDA.W #$0001 : STA.W $0B36 
    PLP 
    RTS 


CalculateSamusXBaseSpeed_DecelerationAllowed:
    PHP 
    REP #$30 
    LDA.W $0B4A 
    BNE .decelerating 
    LDA.W $0B48 : CLC : ADC.W $0002,X : STA.W $0B48 
    LDA.W $0B46 : ADC.W $0000,X : STA.W $0B46 
    CMP.W $0004,X 
    BMI .return 
    BEQ .checkMaxSubSpeed 

.capXSpeed:
    LDA.W $0004,X : STA.W $0B46 
    LDA.W $0006,X : STA.W $0B48 
    BRA .return 


.checkMaxSubSpeed:
    LDA.W $0B48 
    CMP.W $0006,X 
    BMI .return 
    BEQ .return 
    BRA .capXSpeed 


.decelerating:
    SEP #$20 
    LDA.W $0B4C 
    BEQ .zeroMultiplier 
    STA.W $4202 
    LDA.W $000B,X : STA.W $4203 
    NOP #3
    REP #$20 
    LDA.W $4216 : STA.B $14 
    SEP #$20 
    LDA.W $0008,X : STA.W $4203 
    NOP #3
    REP #$20 
    LDA.W $4217 : AND.W #$00FF : STA.B $12 
    BRA + 


.zeroMultiplier:
    REP #$20 
    LDA.W $000A,X : STA.B $14 
    LDA.W $0008,X : STA.B $12 

  + LDA.W $0B48 : SEC : SBC.B $14 : STA.W $0B48 
    LDA.W $0B46 : SBC.B $12 : STA.W $0B46 
    BPL .return 
    STZ.W $0B46 
    STZ.W $0B48 
    STZ.W $0B4A 

.return:
    LDA.W $0B46 : STA.B $12 
    LDA.W $0B48 : STA.B $14 
    PLP 
    RTS 


CalculateSamusXBaseSpeed_DecelerationDisallowed:
    PHP 
    REP #$30 
    LDA.W $0B4A 
    BIT.W #$0001 
    BNE .turningAround 
    LDA.W $0B48 : CLC : ADC.W $0002,X : STA.W $0B48 
    LDA.W $0B46 : ADC.W $0000,X : STA.W $0B46 
    CMP.W $0004,X 
    BMI .returnClear 
    BEQ .checkMaxSubSpeed 

.capXSpeed:
    LDA.W $0004,X : STA.W $0B46 
    LDA.W $0006,X : STA.W $0B48 
    BRA .returnSet 


.checkMaxSubSpeed:
    LDA.W $0B48 
    CMP.W $0006,X 
    BMI .returnClear 
    BEQ .returnClear 
    BRA .capXSpeed 


.turningAround:
    SEP #$20 
    LDA.W $0B4C 
    BEQ .zeroMultiplier 
    STA.W $4202 
    LDA.W $000B,X : STA.W $4203 
    NOP #3
    REP #$20 
    LDA.W $4216 : STA.B $14 
    SEP #$20 
    LDA.W $0008,X : STA.W $4203 
    NOP #3
    REP #$20 
    LDA.W $4217 : AND.W #$00FF : STA.B $12 
    BRA + 


.zeroMultiplier:
    REP #$20 
    LDA.W $000A,X : STA.B $14 
    LDA.W $0008,X : STA.B $12 

  + LDA.W $0B48 : SEC : SBC.B $14 : STA.W $0B48 
    LDA.W $0B46 : SBC.B $12 : STA.W $0B46 
    BPL .returnClear 
    STZ.W $0B46 
    STZ.W $0B48 
    STZ.W $0B4A 

.returnClear:
    LDA.W $0B46 : STA.B $12 
    LDA.W $0B48 : STA.B $14 
    PLP 
    CLC 
    RTS 


.returnSet:
    LDA.W $0B46 : STA.B $12 
    LDA.W $0B48 : STA.B $14 
    PLP 
    SEC 
    RTS 


Determine_SamusXSpeedTable_EntryPointer:
    PHP 
    REP #$30 
    LDA.W $09A2 
    BIT.W #$0020 
    BNE .gotoSpeedTableSet 
    JSL.L Get_Samus_Bottom_Boundary 
    LDA.W $195E 
    BMI .negativeYPosition 
    CMP.B $12 
    BMI .submergedInWater 
    BRA .gotoSpeedTableSet 


.negativeYPosition:
    LDA.W $1962 
    BMI .gotoSpeedTableSet 
    CMP.B $12 
    BMI .submergedInAcidLava 

.gotoSpeedTableSet:
    BRA .speedTableSet 


.submergedInWater:
    LDA.W $197E 
    BIT.W #$0004 
    BNE .gotoSpeedTableSet 
    LDA.W #SamusXSpeedTable_InWater : STA.W $0A6C 
    BRA .speedTableSet 


.submergedInAcidLava:
    LDA.W #SamusXSpeedTable_InLavaAcid : STA.W $0A6C 

.speedTableSet:
    LDA.W $0A1F : AND.W #$00FF : STA.B $14 
    ASL A 
    CLC : ADC.B $14 : ASL #2
    CLC : ADC.W $0A6C : TAX 
    PLP 
    RTS 


DetermineGrappleSwing_SamusXSpeedTable_EntryPointer:
    PHP 
    REP #$30 
    LDA.W $09A2 
    BIT.W #$0020 
    BNE .normalGravity 
    JSL.L Get_Samus_Bottom_Boundary 
    LDA.W $195E 
    BMI .negativeYPosition 
    CMP.B $12 
    BMI .submergedInWater 
    BRA .normalGravity 


.negativeYPosition:
    LDA.W $1962 
    BMI .normalGravity 
    CMP.B $12 
    BMI .submergedInAcidLava 

.normalGravity:
    LDX.W #SamusPhysicsConstants_XAccelSpeeds_DisconnectGrappleInAir 
    BRA .return 


.submergedInWater:
    LDA.W $197E 
    BIT.W #$0004 
    BNE .normalGravity 
    LDX.W #SamusPhysicsConstants_XAccelSpeeds_DisconnectGrappleInWater 
    BRA .return 


.submergedInAcidLava:
    LDX.W #SamusPhysicsConst_XAccelSpeeds_DisconnectGrappleInLavaAcid 

.return:
    PLP 
    RTS 


Determine_Samus_YAcceleration:
    LDA.W $09A2 
    BIT.W #$0020 
    BNE .notSubmerged 
    JSL.L Get_Samus_Bottom_Boundary 
    LDA.W $195E 
    BMI .negativeYPosition 
    CMP.B $12 
    BMI .submergedInWater 
    BRA .notSubmerged 


.negativeYPosition:
    LDA.W $1962 
    BMI .notSubmerged 
    CMP.B $12 
    BMI .submergedInAcidLava 

.notSubmerged:
    LDA.W SamusPhysicsConstants_YSubAccelerationInAir : STA.W $0B32 
    LDA.W SamusPhysicsConstants_YAccelerationInAir : STA.W $0B34 
    BRA .return 


.submergedInWater:
    LDA.W $197E 
    BIT.W #$0004 
    BNE .notSubmerged 
    LDA.W SamusPhysicsConstants_YSubAccelerationInWater : STA.W $0B32 
    LDA.W SamusPhysicsConstants_YAccelerationInWater : STA.W $0B34 
    BRA .return 


.submergedInAcidLava:
    LDA.W SamusPhysicsConstants_YSubAccelerationInAcidLava : STA.W $0B32 
    LDA.W SamusPhysicsConstants_YAccelerationInAcidLava : STA.W $0B34 

.return:
    RTS 


Grapple_WallJump_Check:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    LDA.W #$FFFF : STA.W $0E1C 
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0004 
    BEQ .facingLeft 
    CMP.W #$0008 
    BEQ .facingRight 

.gotoReturnCarryClear:
    JMP.W .returnCarryClear 


.facingRight:
    LDA.W #$0001 : STA.W $0B02 
    JSL.L Samus_vs_SolidEnemy_CollisionDetection 
    TAX 
    BNE .checkJump 
    JSL.L WallJumpBlockCollisionDetection 
    BCC .gotoReturnCarryClear 
    LDA.B $8F 
    BIT.W $09B4 
    BNE .returnCarrySet 
    JMP.W .returnCarryClear 


.checkJump:
    LDA.B $8F 
    BIT.W $09B4 
    BNE .wallJumpEnemy 
    BRA .returnCarryClear 


.facingLeft:
    STZ.W $0B02 
    JSL.L Samus_vs_SolidEnemy_CollisionDetection 
    TAX 
    BNE .collisionDetected 
    LDA.B $12 : EOR.W #$FFFF : STA.B $12 
    LDA.B $14 
    EOR.W #$FFFF 
    INC A 
    STA.B $14 
    BNE .wallJumpCollision 
    INC.B $12 

.wallJumpCollision:
    JSL.L WallJumpBlockCollisionDetection 
    BCC .returnCarryClear 
    LDA.B $8F 
    BIT.W $09B4 
    BNE .returnCarrySet 
    BRA .returnCarryClear 


.collisionDetected:
    LDA.B $8F 
    BIT.W $09B4 
    BEQ .returnCarryClear 

.wallJumpEnemy:
    LDA.B $16 : STA.W $0E1C 
    PLB 
    PLP 
    SEC 
    RTL 


.returnCarrySet:
    PLB 
    PLP 
    SEC 
    RTL 


.returnCarryClear:
    PLB 
    PLP 
    CLC 
    RTL 


WallJump_Check:
    PHP 
    REP #$30 
    LDA.W $0A27 
    AND.W #$00FF 
    CMP.W #$0003 
    BEQ .spinJumping 
    CMP.W #$0014 
    BNE .carryClearReturn 

.spinJumping:
    LDA.W $0A1C 
    CMP.W #$0081 
    BEQ .screwAttack 
    CMP.W #$0082 
    BEQ .screwAttack 
    LDA.W $0A96 
    CMP.W #$000B 
    BMI .spinningAnimation 
    JMP.W .wallJumpEligibleAnimation 


.screwAttack:
    LDA.W $0A96 
    CMP.W #$001B 
    BMI .spinningAnimation 
    JMP.W .wallJumpEligibleAnimation 


.spinningAnimation:
    LDA.B $8B 
    BIT.W #$0200 
    BNE .spinningPressingLeft 
    BIT.W #$0100 
    BNE .spinningPressingRight 

.carryClearReturn:
    PLP 
    CLC 
    RTS 


.spinningPressingLeft:
    LDA.W #$0001 : STA.W $0B02 
    JSL.L Samus_vs_SolidEnemy_CollisionDetection 
    TAX 
    BNE .collisionDetected 
    JSL.L WallJumpBlockCollisionDetection 
    BCC .carryClearReturn 
    BRA .collisionDetected 


.spinningPressingRight:
    STZ.W $0B02 
    JSL.L Samus_vs_SolidEnemy_CollisionDetection 
    TAX 
    BNE .collisionDetected 
    LDA.B $12 : EOR.W #$FFFF : STA.B $12 
    LDA.B $14 
    EOR.W #$FFFF 
    INC A 
    STA.B $14 
    BNE .wallJumpCollisionDetection 
    INC.B $12 

.wallJumpCollisionDetection:
    JSL.L WallJumpBlockCollisionDetection 
    BCC .carryClearReturn 

.collisionDetected:
    LDA.W $0A1C 
    CMP.W #$0081 
    BEQ .screwAttackPose 
    CMP.W #$0082 
    BEQ .screwAttackPose 
    LDA.W #$0001 : STA.W $0A94 
    LDA.W #$000A : STA.W $0A96 
    JMP.W .carryClearReturn 


.screwAttackPose:
    LDA.W #$0001 : STA.W $0A94 
    LDA.W #$001A : STA.W $0A96 
    JMP.W .carryClearReturn 


.wallJumpEligibleAnimation:
    LDA.W #$FFFF : STA.W $0E1C 
    LDA.B $8B 
    BIT.W #$0200 
    BNE .wallJumpEligiblePressingLeft 
    BIT.W #$0100 
    BNE .wallJumpEligiblePressingRight 

.gotoReturnCarryClear:
    JMP.W .returnCarryClear 


.wallJumpEligiblePressingLeft:
    LDA.W #$0001 : STA.W $0B02 
    JSL.L Samus_vs_SolidEnemy_CollisionDetection 
    TAX 
    BNE .collision 
    JSL.L WallJumpBlockCollisionDetection 
    BCC .gotoReturnCarryClear 
    LDA.B $8F 
    BIT.W $09B4 
    BNE .wallJumpBlock 
    JMP.W .returnCarryClear 


.collision:
    LDA.B $8F 
    BIT.W $09B4 
    BNE .wallJumpEnemy 
    BRA .returnCarryClear 


.wallJumpEligiblePressingRight:
    STZ.W $0B02 
    JSL.L Samus_vs_SolidEnemy_CollisionDetection 
    TAX 
    BNE .leftCollisionDetected 
    LDA.B $12 : EOR.W #$FFFF : STA.B $12 
    LDA.B $14 
    EOR.W #$FFFF 
    INC A 
    STA.B $14 
    BNE .wallJumpBlockCollisionDetection 
    INC.B $12 

.wallJumpBlockCollisionDetection:
    JSL.L WallJumpBlockCollisionDetection 
    BCC .returnCarryClear 
    LDA.B $8F 
    BIT.W $09B4 
    BNE .wallJumpBlock 
    BRA .returnCarryClear 


.leftCollisionDetected:
    LDA.B $8F 
    BIT.W $09B4 
    BEQ .returnCarryClear 

.wallJumpEnemy:
    LDA.W #$0000 
    BEQ .checkDistanceEnemy 
    LDA.B $12 
    CMP.W #$0005 
    BMI .returnCarryClear 

.checkDistanceEnemy:
    LDA.B $12 
    CMP.W #$0008 
    BPL .returnCarryClear 
    LDA.W #$0005 : STA.W $0DC6 
    LDA.B $16 : STA.W $0E1C 
    PLP 
    SEC 
    RTS 


.wallJumpBlock:
    LDA.W #$0000 
    BEQ .checkDistanceBlock 
    LDA.B $12 
    CMP.W #$0005 
    BMI .returnCarryClear 

.checkDistanceBlock:
    LDA.B $12 
    CMP.W #$0008 
    BPL .returnCarryClear 
    LDA.W #$0005 : STA.W $0DC6 
    PLP 
    SEC 
    RTS 


.returnCarryClear:
    PLP 
    CLC 
    RTS 


SamusPhysicsConstants_LavaSubDamagePerFrame:
    dw $8000 

SamusPhysicsConstants_LavaDamagePerFrame:
    dw $0000 

SamusPhysicsConstants_AcidSubDamagePerFrame:
    dw $8000 

SamusPhysicsConstants_AcidDamagePerFrame:
    dw $0001 

SamusPhysicsConstants_AnimationDelayInWater:
    dw $0003 

SamusPhysicsConstants_AnimationDelayInLavaAcid:
    dw $0002 

SamusPhysicsConstants_SpaceJumpMinimumYVelocityInAir:
    dw $0280 

SamusPhysicsConstants_SpaceJumpMaximumYVelocityInAir:
    dw $0500 

SamusPhysicsConstants_SpaceJumpMinimumYVelocityInWater:
    dw $0080 

SamusPhysicsConstants_SpaceJumpMaximumYVelocityInWater:
    dw $0500 

SamusPhysicsConstants_MaximumDistanceFromWallForWallJump:
    dw $0008 

SamusPhysicsConstants_YSubAccelerationInAir:
    dw $1C00 

SamusPhysicsConstants_YSubAccelerationInWater:
    dw $0800 

SamusPhysicsConstants_YSubAccelerationInAcidLava:
    dw $0900 

SamusPhysicsConstants_YAccelerationInAir:
    dw $0000 

SamusPhysicsConstants_YAccelerationInWater:
    dw $0000 

SamusPhysicsConstants_YAccelerationInAcidLava:
    dw $0000 

SamusPhysicsConstants_CameraXOffsetFromSamusWhenTurning:
    dw $0001 

SamusPhysicsConstants_CameraXSubOffsetFromSamusWhenTurning:
    dw $0000 

SamusPhysicsConstants_CameraYOffsetFromSamusWhenTurning:
    dw $0001 

SamusPhysicsConstants_CameraYSubOffsetFromSamusWhenTurning:
    dw $0000 

SamusPhysicsConstants_YSpeedWhenBouncingInMorphBall:
    dw $0001 

SamusPhysicsConstants_YSubSpeedWhenBouncingInMorphBall:
    dw $0000 

SamusPhysicsConstants_InitialYSpeeds_Jumping:
    dw $0004,$0001,$0002 

SamusPhysicsConstants_InitialYSubSpeeds_Jumping:
    dw $E000,$C000,$C000 

SamusPhysicsConstants_InitialYSpeeds_HiJumpJumping:
    dw $0006,$0002,$0003 

SamusPhysicsConstants_InitialYSubSpeeds_HiJumpJumping:
    dw $0000,$8000,$8000 

SamusPhysicsConstants_InitialYSpeeds_WallJumping:
    dw $0004,$0000,$0002 

SamusPhysicsConstants_InitialYSubSpeeds_WallJumping:
    dw $A000,$4000,$A000 

SamusPhysicsConstants_InitialYSpeeds_HiJumpWallJumping:
    dw $0005,$0000,$0003 

SamusPhysicsConstants_InitialYSubSpeeds_HiJumpWallJumping:
    dw $8000,$8000,$8000 

SamusPhysicsConstants_InitialYSpeeds_Knockback:
    dw $0005,$0002,$0002 

SamusPhysicsConstants_InitialYSubSpeeds_Knockback:
    dw $0000,$0000,$0000 

SamusPhysicsConstants_InitialYSpeeds_BombJump:
    dw $0002,$0000,$0000 

SamusPhysicsConstants_InitialYSubSpeeds_BombJump:
    dw $C000,$1000,$1000 

SamusPhysicsConstants_XAccelerations_DashHeld:
    dw $0000,$0000,$0000 

SamusPhysicsConstants_XSubAccelerations_DashHeld:
    dw $1000,$0400,$0400 

SamusPhysicsConstants_MaxXExtraRunSpeeds_SpeedBooster:
    dw $0007,$0004,$0004 

SamusPhysicsConstants_MaxXExtraRunSubSpeeds_SpeedBooster:
    dw $0000,$0000,$0000 

SamusPhysicsConstants_MaxXExtraRunSpeeds_NoSpeedBooster_0:
    dw $0002,$0001,$0000 

SamusPhysicsConstants_MaxXExtraRunSpeeds_NoSpeedBooster_1:
    dw $0000,$0000,$0000 

SamusPhysicsConstants_XAccelSpeeds_DiagonalBombJump:
    dw $0000,$3000,$0003,$0000,$0000,$0800 

SamusPhysicsConstants_XAccelSpeeds_DisconnectGrappleInAir:
    dw $0000,$3000,$000F,$0000,$0000,$1000 

SamusPhysicsConstants_XAccelSpeeds_DisconnectGrappleInWater:
    dw $0000,$3000,$000F,$0000,$0000,$1000 

SamusPhysicsConst_XAccelSpeeds_DisconnectGrappleInLavaAcid:
    dw $0000,$3000,$000F,$0000,$0000,$1000 

SamusXSpeedTable_Normal:
    dw $0000,$C000,$0000,$0000,$0000,$8000,$0000,$3000 
    dw $0002,$C000,$0000,$8000,$0000,$C000,$0001,$4000 
    dw $0000,$8000,$0000,$C000,$0001,$6000,$0000,$8000 
    dw $0000,$C000,$0003,$4000,$0000,$8000,$0000,$C000 
    dw $0000,$0000,$0000,$8000,$0000,$C000,$0001,$0000 
    dw $0000,$8000,$0002,$0000,$0001,$0000,$0000,$8000 
    dw $0000,$C000,$0001,$0000,$0000,$8000,$0002,$0000 
    dw $0002,$0000,$0000,$8000,$0001,$8000,$0005,$0000 
    dw $0000,$8000,$0000,$C000,$0000,$0000,$0000,$8000 
    dw $0000,$C000,$0000,$0000,$0000,$8000,$0000,$C000 
    dw $0002,$0000,$0000,$8000,$0000,$C000,$0000,$0000 
    dw $0000,$8000,$0000,$C000,$0001,$4000,$0000,$8000 
    dw $0000,$C000,$0000,$8000,$0000,$8000,$0000,$C000 
    dw $0003,$4000,$0000,$8000,$0000,$C000,$0001,$4000 
    dw $0000,$8000,$0000,$C000,$0001,$0000,$0000,$8000 
    dw $0000,$C000,$0001,$6000,$0000,$8000,$0000,$C000 
    dw $0000,$0000,$0000,$8000,$0000,$C000,$0001,$4000 
    dw $0000,$8000,$0000,$C000,$0000,$0000,$0000,$8000 
    dw $0000,$C000,$0000,$0000,$0000,$8000,$0000,$C000 
    dw $0005,$0000,$0000,$8000 

SamusXSpeedTable_InWater:
    dw $0000,$C000,$0000,$0000,$0000,$0800,$0000,$0400 
    dw $0002,$C000,$0000,$0800,$0000,$C000,$0001,$4000 
    dw $0000,$0800,$0000,$C000,$0001,$6000,$0000,$0800 
    dw $0000,$0400,$0002,$C000,$0000,$0800,$0000,$C000 
    dw $0000,$0000,$0000,$0800,$0000,$C000,$0001,$0000 
    dw $0000,$0800,$0002,$0000,$0001,$0000,$0000,$0800 
    dw $0000,$0400,$0001,$8000,$0000,$0800,$0002,$0000 
    dw $0002,$0000,$0000,$0800,$0001,$8000,$0005,$0000 
    dw $0000,$0800,$0000,$C000,$0000,$0000,$0000,$0800 
    dw $0000,$C000,$0000,$0000,$0000,$0800,$0000,$C000 
    dw $0002,$0000,$0000,$0800,$0000,$C000,$0000,$0000 
    dw $0000,$0800,$0000,$C000,$0001,$4000,$0000,$0800 
    dw $0000,$C000,$0000,$8000,$0000,$0800,$0000,$0400 
    dw $0002,$C000,$0000,$0800,$0000,$0400,$0001,$4000 
    dw $0000,$0800,$0000,$0400,$0001,$8000,$0000,$0800 
    dw $0000,$C000,$0001,$6000,$0000,$0800,$0000,$C000 
    dw $0000,$0000,$0000,$0800,$0000,$C000,$0001,$4000 
    dw $0000,$0800,$0000,$C000,$0000,$0000,$0000,$0800 
    dw $0000,$C000,$0000,$0000,$0000,$0800,$0000,$C000 
    dw $0000,$8000,$0000,$0800,$0000,$C000,$0005,$0000 
    dw $0000,$0800,$0000,$C000,$0005,$0000,$0000,$0800 

SamusXSpeedTable_InLavaAcid:
    dw $0000,$C000,$0000,$0000,$0000,$4000,$0000,$0400 
    dw $0001,$C000,$0000,$4000,$0000,$C000,$0001,$4000 
    dw $0000,$4000,$0000,$C000,$0001,$6000,$0000,$4000 
    dw $0000,$0400,$0002,$C000,$0000,$4000,$0000,$C000 
    dw $0000,$0000,$0000,$4000,$0000,$C000,$0001,$0000 
    dw $0000,$4000,$0002,$0000,$0001,$0000,$0000,$4000 
    dw $0000,$0400,$0001,$6000,$0000,$4000,$0002,$0000 
    dw $0002,$0000,$0000,$4000,$0001,$8000,$0005,$0000 
    dw $0000,$4000,$0000,$C000,$0000,$0000,$0000,$4000 
    dw $0000,$C000,$0000,$0000,$0000,$4000,$0000,$C000 
    dw $0002,$0000,$0000,$4000,$0000,$C000,$0000,$0000 
    dw $0000,$4000,$0000,$C000,$0001,$4000,$0000,$4000 
    dw $0000,$C000,$0000,$8000,$0000,$4000,$0000,$0400 
    dw $0002,$C000,$0000,$4000,$0000,$0400,$0001,$4000 
    dw $0000,$4000,$0000,$0400,$0001,$6000,$0000,$4000 
    dw $0000,$C000,$0001,$6000,$0000,$4000,$0000,$C000 
    dw $0000,$0000,$0000,$4000,$0000,$C000,$0001,$4000 
    dw $0000,$4000,$0000,$C000,$0000,$0000,$0000,$4000 
    dw $0000,$C000,$0000,$0000,$0000,$4000,$0000,$C000 
    dw $0000,$8000,$0000,$4000,$0000,$C000,$0005,$0000 
    dw $0000,$4000,$0000,$C000,$0005,$0000,$0000,$4000 

UNUSED_SamusMovement_7_90A32D:
    PHP 
    REP #$30 
    STZ.W $0DC6 
    PLP 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_90A335:
    dw $001E 
endif ; !FEATURE_KEEP_UNREFERENCED

SamusMovementHandler_Normal:
    LDA.W $0A78 
    BNE .return 
    LDA.W $0A1F 
    AND.W #$00FF 
    ASL A 
    TAX 
    JSR.W (.pointers,X) 
    JSR.W UpdateSamusEchoPosition 

.return:
    RTS 


.pointers:
    dw SamusMovement_Standing 
    dw SamusMovement_Running 
    dw SamusMovement_Jumping 
    dw SamusMovement_SpinJumping 
    dw SamusMovement_MorphBall_OnGround 
    dw SamusMovement_Crouching 
    dw SamusMovement_Falling 
    dw UNUSED_SamusMovement_7_90A32D 
    dw SamusMovement_MorphBall_Falling 
    dw UNUSED_RTS_90A5FB 
    dw SamusMovement_Knockback_CrystalFlashEnding 
    dw UNUSED_SamusMovement_B_90A607 
    dw UNUSED_SamusMovement_C_90A60F 
    dw UNUSED_SamusMovement_D_90A617 
    dw SamusMovement_TurningAround_OnGround 
    dw SamusMovement_TransitionPoses 
    dw SamusMovement_Moonwalking 
    dw SamusMovement_SpringBall_OnGround 
    dw SamusMovement_SpringBall_InAir 
    dw SamusMovement_SpringBall_Falling 
    dw SamusMovement_WallJumping 
    dw SamusMovement_RanIntoAWall 
    dw SamusMovement_Grappling 
    dw SamusMovement_TurningAround_Jumping 
    dw SamusMovement_TurningAround_Falling 
    dw SamusMovement_DamageBoost 
    dw SamusMovement_GrabbedByDraygon 
    dw SamusMovement_Shinespark_CF_Drained_DamagedByMotherBrain 

SamusMovement_Standing:
    PHP 
    REP #$30 
    LDA.W $0A1C 
    BEQ .facingForward 
    CMP.W #$009B 
    BEQ .facingForward 
    BRA .notFacingForward 


.facingForward:
    LDA.W $0E18 
    BEQ .noChange 
    LDA.W #$0002 : STA.W $0B02 
    LDA.W #$0001 : STA.B $12 
    STZ.B $14 
    JSL.L MoveSamusDown_NoSolidEnemyCollision 

.noChange:
    STZ.W $0DC6 
    BRA .return 


.notFacingForward:
    LDA.W $0A1C 
    CMP.W #$0001 
    BEQ .checkPressingShot 
    CMP.W #$0002 
    BNE .moveSamus 

.checkPressingShot:
    LDA.B $8B 
    BIT.W $09B2 
    BEQ .moveSamus 
    LDA.W #$0010 : STA.W $0A94 
    STZ.W $0A96 

.moveSamus:
    JSR.W MoveSamus_HorizontallyWithZeroBaseXSpeed 
    JSR.W Samus_Y_Movement_NoSpeedCalculations 
    JSL.L Cancel_SpeedBoosting 
    STZ.W $0B42 
    STZ.W $0B44 
    STZ.W $0B46 
    STZ.W $0B48 
    STZ.W $0B4A 

.return:
    PLP 
    RTS 


SamusMovement_Running:
    PHP 
    REP #$30 
    JSR.W Samus_X_Movement 
    JSR.W Samus_Y_Movement_NoSpeedCalculations 
    LDX.W $0A96 
    LDA.W $0A94 
    CMP.W #$0001 
    BNE .return 
    LDA.W .frames,X 
    AND.W #$00FF 
    BEQ .return 
    JSR.W FootstepGraphics 
    LDA.W $1F51 
    BNE .return 
    LDA.W $179C 
    BNE .return 
    LDA.W $0A68 
    BNE .return 
    LDA.W $0B3E 
    BIT.W #$0400 
    BNE .return 
    LDA.W #$0006 
    JSL.L QueueSound_Lib3_Max6 

.return:
    PLP 
    RTS 


.frames:
    db $00,$00,$01,$00,$00,$00,$00,$01,$00,$00 

SamusMovement_Jumping:
    PHP 
    REP #$30 
    JSR.W Samus_Jumping_Movement 
    PLP 
    RTS 


SamusMovement_SpinJumping:
    PHP 
    REP #$30 
    LDA.W $0A74 
    BIT.W #$0004 
    BNE .nonLiquidPhysics 
    JSL.L Get_Samus_BottomTop_Boundary 
    LDA.W $195E 
    BMI .negativeYPosition 
    CMP.B $14 
    BPL .nonLiquidPhysics 
    LDA.W $197E 
    BIT.W #$0004 
    BNE .nonLiquidPhysics 
    BRA + 


.negativeYPosition:
    LDA.W $1962 
    BMI .nonLiquidPhysics 
    CMP.B $14 
    BPL .nonLiquidPhysics 

  + LDA.W #$0001 : STA.B $12 
    BRA .determinedLiquidPhysics 


.nonLiquidPhysics:
    STZ.B $12 

.determinedLiquidPhysics:
    LDA.B $12 
    BNE .liquidPhysics 
    LDA.W $09A2 
    BIT.W #$0200 
    BNE .spaceJumpEligible 
    LDA.W $0A1C 
    CMP.W #$0081 
    BEQ .gotoScrewAttack 
    CMP.W #$0082 
    BEQ .gotoScrewAttack 
    BRA .liquidPhysics 


.gotoScrewAttack:
    JMP.W .screwAttack 


.spaceJumpEligible:
    LDA.W $0B36 
    CMP.W #$0002 
    BNE .screwAttackEligible 
    LDA.W $0AD2 
    BEQ .airPhysics 
    LDA.W $0B2D 
    CMP.W SamusPhysicsConstants_SpaceJumpMinimumYVelocityInWater 
    BMI .screwAttackEligible 
    CMP.W SamusPhysicsConstants_SpaceJumpMaximumYVelocityInWater 
    BPL .screwAttackEligible 
    BRA + 


.airPhysics:
    LDA.W $0B2D 
    CMP.W SamusPhysicsConstants_SpaceJumpMinimumYVelocityInAir 
    BMI .screwAttackEligible 
    CMP.W SamusPhysicsConstants_SpaceJumpMaximumYVelocityInAir 
    BPL .screwAttackEligible 

  + LDA.W $0DFA 
    AND.W #$FF00 
    ORA.W #$0001 
    STA.W $0DFA 
    LDA.B $8F 
    AND.W $09B4 
    BEQ .screwAttackEligible 
    JSL.L Make_Samus_Jump 

.screwAttackEligible:
    LDA.W $0A1C 
    CMP.W #$0081 
    BEQ .screwAttack 
    CMP.W #$0082 
    BEQ .screwAttack 
    BRA .liquidPhysics ; >.<


.liquidPhysics:
    LDA.B $12 
    BEQ + 
    LDX.W $0A96 
    LDA.W $0A94 
    CMP.W #$0001 
    BNE + 
    LDA.W .framesSFX,X 
    AND.W #$00FF 
    BEQ + 
    LDA.W #$002F 
    JSL.L QueueSound_Lib1_Max6 

  + LDA.W $0CD0 
    CMP.W #$003C 
    BMI .return 
    LDA.B $12 
    BNE .return 
    LDA.W #$0004 : STA.W $0A6E 
    BRA .return 


.screwAttack:
    LDA.W #$0003 : STA.W $0A6E 

.return:
    JSR.W Samus_SpinJumping_Movement 
    PLP 
    RTS 


.framesSFX:
    db $01,$00,$00,$00,$00,$00,$00,$00,$01,$00,$00,$00,$00 

SamusMovement_MorphBall_OnGround:
    PHP 
    REP #$30 
    LDA.W $0B4A 
    BNE .decelerating 
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0004 
    BEQ .facingLeft 
    LDA.W $0A1C 
    CMP.W #$001D 
    BNE .decelerating 
    BRA .moveSamus 


.facingLeft:
    LDA.W $0A1C 
    CMP.W #$0041 
    BNE .decelerating 

.moveSamus:
    JSR.W MoveSamus_HorizontallyWithZeroBaseXSpeed 
    JSR.W Simple_Samus_Y_Movement 
    BCS .return 
    JSR.W Samus_Y_Movement_NoSpeedCalculations 
    JSL.L Cancel_SpeedBoosting 
    STZ.W $0B42 
    STZ.W $0B44 
    STZ.W $0B46 
    STZ.W $0B48 
    STZ.W $0B4A 
    BRA .return 


.decelerating:
    JSR.W Samus_X_Movement 
    JSR.W Simple_Samus_Y_Movement 
    BCS .return 
    JSR.W Samus_Y_Movement_NoSpeedCalculations 

.return:
    PLP 
    RTS 


SamusMovement_Crouching:
    PHP 
    REP #$30 
    JSR.W MoveSamus_HorizontallyWithZeroBaseXSpeed 
    JSR.W Samus_Y_Movement_NoSpeedCalculations 
    STZ.W $0B42 
    STZ.W $0B44 
    STZ.W $0B46 
    STZ.W $0B48 
    STZ.W $0B4A 
    PLP 
    RTS 


SamusMovement_Falling:
    PHP 
    REP #$30 
    JSR.W Samus_Falling_Movement 
    LDA.W $0A1C 
    CMP.W #$0029 
    BEQ .falling 
    CMP.W #$002A 
    BEQ .falling 
    CMP.W #$0067 
    BEQ .falling 
    CMP.W #$0068 
    BEQ .falling 
    BRA .return 


.falling:
    LDA.W $0B2E 
    CMP.W #$0005 
    BMI .return 
    LDA.W $0A96 
    CMP.W #$0005 
    BPL .return 
    LDA.W #$0008 : STA.W $0A94 
    LDA.W #$0005 : STA.W $0A96 

.return:
    PLP 
    RTS 


SamusMovement_MorphBall_Falling:
    PHP 
    REP #$30 
    LDA.B $8B 
    BIT.W #$0300 
    BNE .pressingLeftRight 
    LDA.W $0B4A 
    BNE .pressingLeftRight 
    JSL.L Cancel_SpeedBoosting 
    STZ.W $0B42 
    STZ.W $0B44 
    STZ.W $0B46 
    STZ.W $0B48 
    STZ.W $0B4A 

.pressingLeftRight:
    LDA.W $0B20 
    BNE .morphBounce 
    JSR.W Samus_Morphed_Falling_Movement 
    BRA .return 


.morphBounce:
    JSR.W Samus_Morphed_Bouncing_Movement 

.return:
    PLP 
    RTS 


UNUSED_RTS_90A5FB:
    RTS 


SamusMovement_Knockback_CrystalFlashEnding:
    PHP 
    REP #$30 
    STZ.W $0DC6 
    JSR.W Samus_Y_Movement_NoSpeedCalculations 
    PLP 
    RTS 


UNUSED_SamusMovement_B_90A607:
    PHP 
    REP #$30 
    STZ.W $0DC6 
    PLP 
    RTS 


UNUSED_SamusMovement_C_90A60F:
    PHP 
    REP #$30 
    STZ.W $0DC6 
    PLP 
    RTS 


UNUSED_SamusMovement_D_90A617:
    PHP 
    REP #$30 
    PLP 
    RTS 


SamusMovement_TransitionPoses:
    PHP 
    REP #$30 
    LDA.W $0A1C 
    CMP.W #$00F1 
    BPL .moveSamus 
    CMP.W #$00DB 
    BPL .noYMovement 
    SEC : SBC.W #$0035 : ASL A 
    TAX 
    JSR.W (.pointers,X) 

.moveSamus:
    JSR.W MoveSamus_HorizontallyWithZeroBaseXSpeed 
    JSR.W Simple_Samus_Y_Movement_duplicate 
    BCS .noYMovement 
    JSR.W Samus_Y_Movement_NoSpeedCalculations 

.noYMovement:
    LDA.W $0DC6 
    CMP.W #$0401 
    BNE .noChange 
    STZ.W $0B2C 
    STZ.W $0B2E 
    STZ.W $0B36 
    STZ.W $0B20 

.noChange:
    STZ.W $0DC6 
    PLP 
    RTS 


.pointers:
    dw RTS_90A671 
    dw RTS_90A671 
    dw RTS_90A671 
    dw RTS_90A671 
    dw Enable_Horizontal_Slope_Detection 
    dw Enable_Horizontal_Slope_Detection 
    dw RTS_90A671 
    dw RTS_90A671 
    dw RTS_90A671 
    dw RTS_90A671 
    dw Enable_Horizontal_Slope_Detection 
    dw Enable_Horizontal_Slope_Detection 

RTS_90A671:
    RTS 


Enable_Horizontal_Slope_Detection:
    LDA.W #$0003 : STA.W $0A46 
    STZ.W $0AA4 
    RTS 


SamusMovement_TurningAround_OnGround:
    PHP 
    REP #$30 
    JSR.W Samus_X_Movement 
    JSR.W Samus_Y_Movement_NoSpeedCalculations 
    JSL.L Cancel_SpeedBoosting 
    STZ.W $0B42 
    STZ.W $0B44 
    STZ.W $0DC6 
    PLP 
    RTS 


SamusMovement_Moonwalking:
    PHP 
    REP #$30 
    JSR.W Samus_X_Movement 
    JSR.W Samus_Y_Movement_NoSpeedCalculations 
    PLP 
    RTS 


SamusMovement_SpringBall_OnGround:
    PHP 
    REP #$30 
    LDA.W $0B4A 
    BNE .decelerating 
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0004 
    BEQ .facingLeft 
    LDA.W $0A1C 
    CMP.W #$0079 
    BNE .decelerating 
    BRA + 


.facingLeft:
    LDA.W $0A1C 
    CMP.W #$007A 
    BNE .decelerating 

  + JSR.W MoveSamus_HorizontallyWithZeroBaseXSpeed 
    JSR.W Simple_Samus_Y_Movement 
    BCS .return 
    JSR.W Samus_Y_Movement_NoSpeedCalculations 
    JSL.L Cancel_SpeedBoosting 
    STZ.W $0B42 
    STZ.W $0B44 
    STZ.W $0B46 
    STZ.W $0B48 
    STZ.W $0B4A 
    BRA .return 


.decelerating:
    JSR.W Samus_X_Movement 
    JSR.W Simple_Samus_Y_Movement 
    BCS .return 
    JSR.W Samus_Y_Movement_NoSpeedCalculations 

.return:
    PLP 
    RTS 


SamusMovement_SpringBall_InAir:
    PHP 
    REP #$30 
    LDA.W $0B20 
    BNE .bouncing 
    JSR.W Samus_Jumping_Movement 
    BRA .return 


.bouncing:
    JSR.W Samus_Morphed_Bouncing_Movement 

.return:
    PLP 
    RTS 


SamusMovement_SpringBall_Falling:
    PHP 
    REP #$30 
    LDA.B $8B 
    BIT.W #$0300 
    BNE .checkBounce 
    LDA.W $0B4A 
    BNE .checkBounce 
    JSL.L Cancel_SpeedBoosting 
    STZ.W $0B42 
    STZ.W $0B44 
    STZ.W $0B46 
    STZ.W $0B48 
    STZ.W $0B4A 

.checkBounce:
    LDA.W $0B20 
    BNE .bouncing 
    JSR.W Samus_Morphed_Falling_Movement 
    BRA .return 


.bouncing:
    JSR.W Samus_Morphed_Bouncing_Movement 

.return:
    PLP 
    RTS 


SamusMovement_WallJumping:
    PHP 
    REP #$30 
    LDA.W $0A96 
    CMP.W #$0017 
    BPL .greaterThan16 
    CMP.W #$0003 
    BMI .jumpingMovement 
    LDA.W $0CD0 
    CMP.W #$003C 
    BMI .jumpingMovement 
    LDA.W #$0004 : STA.W $0A6E 
    BRA .jumpingMovement 


.greaterThan16:
    LDA.W #$0003 : STA.W $0A6E 

.jumpingMovement:
    JSR.W Samus_Jumping_Movement 
    PLP 
    RTS 


SamusMovement_RanIntoAWall:
    PHP 
    REP #$30 
    JSR.W MoveSamus_HorizontallyWithZeroBaseXSpeed 
    JSR.W Samus_Y_Movement_NoSpeedCalculations 
    JSL.L Cancel_SpeedBoosting 
    STZ.W $0B42 
    STZ.W $0B44 
    STZ.W $0B46 
    STZ.W $0B48 
    STZ.W $0B4A 
    JSR.W RTS_9092E9 
    PLP 
    RTS 


SamusMovement_Grappling:
    PHP 
    REP #$30 
    LDA.W $0DC6 
    CMP.W #$0005 
    BEQ .return 
    STZ.W $0DC6 

.return:
    PLP 
    RTS 


SamusMovement_TurningAround_Jumping:
    PHP 
    REP #$30 
    JSR.W Samus_X_Movement 
    JSR.W Simple_Samus_Y_Movement 
    BCS + 
    JSR.W Samus_Y_Movement_NoSpeedCalculations 

  + JSL.L Cancel_SpeedBoosting 
    STZ.W $0B42 
    STZ.W $0B44 
    STZ.W $0DC6 
    PLP 
    RTS 


SamusMovement_TurningAround_Falling:
    PHP 
    REP #$30 
    JSR.W Samus_X_Movement 
    JSR.W Simple_Samus_Y_Movement 
    BCS + 
    JSR.W Samus_Y_Movement_NoSpeedCalculations 

  + JSL.L Cancel_SpeedBoosting 
    STZ.W $0B42 
    STZ.W $0B44 
    STZ.W $0DC6 
    PLP 
    RTS 


SamusMovement_DamageBoost:
    PHP 
    REP #$30 
    JSR.W Samus_Jumping_Movement 
    PLP 
    RTS 


SamusMovement_GrabbedByDraygon:
    PHP 
    REP #$30 
    STZ.W $0DC6 
    PLP 
    RTS 


SamusMovement_Shinespark_CF_Drained_DamagedByMotherBrain:
    PHP 
    REP #$30 
    STZ.W $0DC6 
    PLP 
    RTS 


DisableMinimap_MarkBossRoomTilesExplored:
    PHP 
    PHB 
    REP #$30 
    PHK 
    PLB 
    LDA.W #$0001 : STA.W $05F7 
    LDA.W #$001F 
    ORA.W #$2C00 
    LDX.W #$0000 

.loop:
    STA.L $7EC63C,X 
    STA.L $7EC67C,X 
    STA.L $7EC6BC,X 
    INX #2
    CPX.W #$000A 
    BMI .loop 
    LDA.W $179C 
    LDX.W #$0014 

.loopBossID:
    CMP.W .bossID,X 
    BEQ + 
    DEX #4
    BPL .loopBossID 
    PLB 
    PLP 
    RTL 


  + LDA.W .pointer,X 
    TAX 

.loopMapTiles:
    LDA.W $0000,X 
    BMI .return 
    STA.B $12 
    LDA.W $0002,X : STA.B $18 
    JSR.W MarkMapTilesExplored 
    INX #4
    BRA .loopMapTiles 


.return:
    PLB 
    PLP 
    RTL 


.bossID:
    dw $0003 

.pointer:
    dw .kraid 
    dw $0006 
    dw .crocomire 
    dw $0007 
    dw .phantoon 
    dw $0008 
    dw .draygon 
    dw $000A 
    dw .motherBrain 
    dw $0005 
    dw .ridley 

.kraid:
    dw $0000,$0000,$0100,$0000,$0000,$0100,$0100,$0100 
    dw $FFFF 

.crocomire:
    dw $0300,$0000,$0400,$0000,$0500,$0000,$FFFF 

.phantoon:
    dw $0000,$0000,$FFFF 

.draygon:
    dw $0000,$0000,$0100,$0000,$0000,$0100,$0100,$0100 
    dw $FFFF 

.motherBrain:
    dw $0000,$0000,$0100,$0000,$0200,$0000,$0300,$0000 
    dw $FFFF 

.ridley:
    dw $0000,$0000,$0000,$0100,$FFFF 

MarkMapTilesExplored:
    PHP 
    PHX 
    PHY 
    LDA.B $12 
    AND.W #$FF00 
    XBA 
    CLC : ADC.W $07A1 : PHA 
    AND.W #$0020 
    STA.B $22 
    PLA 
    AND.W #$001F 
    STA.B $12 
    AND.W #$0007 
    TAY 
    LDA.B $12 
    LSR #3
    STA.B $14 
    LDA.B $18 
    AND.W #$FF00 
    XBA 
    CLC : ADC.W $07A3 : INC A 
    STA.B $16 
    CLC : ADC.B $22 : ASL #2
    CLC : ADC.B $14 : TAX 
    SEP #$20 
    LDA.W $07F7,X : ORA.W Bitmasks_1bit_90AC04,Y : STA.W $07F7,X 
    PLY 
    PLX 
    PLP 
    RTS 


Initialise_Minimap_broken:
    PHP 
    REP #$30 
    LDA.W $0AF6 
    AND.W #$FF00 
    XBA 
    CLC : ADC.W $07A1 : TAX 
    STA.B $12 
    AND.W #$0007 
    TAY 
    TXA 
    LSR #3
    STA.B $14 
    LDA.W $0AFA 
    AND.W #$FF00 
    XBA 
    CLC : ADC.W $07A3 : INC A 
    STA.B $16 
    JMP.W Update_HUD_Minimap_Tilemap 


Update_Minimap:
    PHP 
    REP #$30 
    LDA.W $05F7 
    BEQ + 
    PLP 
    RTL 


  + LDA.W $0AF6 
    LSR #4
    CMP.W $07A5 
    BCC + 
    PLP 
    RTL 


  + LDA.W $0AFA 
    LSR #4
    CMP.W $07A7 
    BCC + 
    PLP 
    RTL 


  + STZ.B $2E 
    LDA.W $0AF6 
    AND.W #$FF00 
    XBA 
    CLC : ADC.W $07A1 : PHA 
    AND.W #$0020 
    STA.B $22 
    PLA 
    AND.W #$001F 
    STA.B $12 
    AND.W #$0007 
    TAY 
    LDA.B $12 
    LSR #3
    STA.B $14 
    LDA.W $0AFA 
    AND.W #$FF00 
    XBA 
    CLC : ADC.W $07A3 : INC A 
    STA.B $16 
    CLC : ADC.B $22 : ASL #2
    CLC : ADC.B $14 : TAX 
    SEP #$20 
    LDA.W $07F7,X : ORA.W Bitmasks_1bit_90AC04,Y : STA.W $07F7,X 
    STY.B $20 
    STX.B $1E 
    REP #$30 
    DEX #4
    TYA 
    DEC #2
    BPL + 
    AND.W #$0007 
    DEX 
    INC.B $2E 

  + ASL A 
    TAY 
    STX.B $32 
    STY.B $34 
    LDA.W $07F7,X 
    XBA 
    AND.W Bitmasks_6bit_90AC0C,Y 
    STA.B $18 
    LDA.W $07FB,X 
    XBA 
    AND.W Bitmasks_6bit_90AC0C,Y 
    STA.B $1A 
    LDA.W $07FF,X 
    XBA 
    AND.W Bitmasks_6bit_90AC0C,Y 
    STA.B $1C 
    PHX 
    LDA.W $079F 
    ASL A 
    TAX 
    LDA.W #$0082 : STA.B $0B 
    LDA.L MapData_pointers,X : STA.B $09 
    STA.B $0F 
    PLA 
    CLC : ADC.B $09 : STA.B $09 
    LDA.B [$09] 
    XBA 
    STA.B $26 
    LDA.B $09 : CLC : ADC.W #$0004 : STA.B $09 
    LDA.B [$09] 
    XBA 
    STA.B $28 
    LDA.B $09 : CLC : ADC.W #$0004 : STA.B $09 
    LDA.B [$09] 
    XBA 
    STA.B $2A 
    LDX.B $32 
    LDY.B $34 
    TXA 
    AND.W #$0003 
    CMP.W #$0003 
    BNE .singlePage 
    LDA.B $2E 
    BEQ .SamusAtOrigin 
    TYA 
    LSR A 
    BRA + 


.SamusAtOrigin:
    LDA.B $20 

  + CMP.W #$0006 
    BMI .singlePage 
    LDA.B $22 
    BNE .nonZero 
    SEP #$20 
    TXA 
    CLC : ADC.B #$7D : STA.B $30 
    BRA .adjustMapBits 


.nonZero:
    SEP #$20 
    TXA 
    SEC : SBC.B #$7C : STA.B $30 

.adjustMapBits:
    REP #$30 
    JSR.W AdjustMapBitsForMapPageSpill 

.singlePage:
    LDA.B $34 
    LSR A 
    CMP.W #$0000 

.loop:
    BEQ Update_HUD_Minimap_Tilemap 
    ASL.B $18 
    ASL.B $26 
    ASL.B $1A 
    ASL.B $28 
    ASL.B $1C 
    ASL.B $2A 
    DEC A 
    BRA .loop 


Update_HUD_Minimap_Tilemap:
    LDA.B $16 : CLC : ADC.B $22 : XBA 
    LSR #3
    CLC : ADC.B $12 : STA.W $060B 
    LDA.B $22 
    BEQ .notLeftMapPage 
    LDA.W $060B 
    AND.W #$001F 
    CMP.W #$0002 
    BPL .notLeftMapPage 
    LDA.W $060B : SEC : SBC.W #$0402 : BRA + 


.notLeftMapPage:
    LDA.W $060B : SEC : SBC.W #$0022 

  + ASL A 
    TAY 
    LDA.W $079F 
    ASL A 
    CLC : ADC.W $079F : TAX 
    LDA.L AreaMapPointers+2,X : STA.B $02 
    STA.B $05 
    STA.B $08 
    LDA.L AreaMapPointers,X : STA.B $00 
    CLC : ADC.W #$0040 : STA.B $03 
    CLC : ADC.W #$0040 : STA.B $06 
    LDA.W #$0005 : STA.B $12 
    LDX.W #$0000 
    LDA.W $0789 
    PHP 

.loop:
    ASL.B $26 
    BCC .row0BlankTile 
    LDA.B [$00],Y 
    PLP 
    PHP 
    BNE .row0NotBlank 

.row0BlankTile:
    LDA.W #$001F 

.row0NotBlank:
    AND.W #$E3FF 
    ORA.W #$2C00 
    STA.L $7EC63C,X 
    ASL.B $18 
    BCC + 
    LDA.B [$00],Y 
    AND.W #$E3FF 
    ORA.W #$2800 
    STA.L $7EC63C,X 

  + ASL.B $28 
    BCC .row1BlankTile 
    LDA.B [$03],Y 
    PLP 
    PHP 
    BNE .row1NotBlank 

.row1BlankTile:
    LDA.W #$001F 

.row1NotBlank:
    AND.W #$E3FF 
    ORA.W #$2C00 
    STA.L $7EC67C,X 
    ASL.B $1A 
    BCC + 
    LDA.B [$03],Y 
    AND.W #$E3FF 
    ORA.W #$2800 
    STA.L $7EC67C,X 
    LDA.B $12 
    CMP.W #$0003 
    BNE + 
    LDA.L $7EC67C,X 
    AND.W #$01FF 
    CMP.W #$0028 
    BNE + 
    JSR.W MarkMapTileAboveSamusExplored 

  + ASL.B $2A 
    BCC .row2BlankTile 
    LDA.B [$06],Y 
    PLP 
    PHP 
    BNE .row2NotBlank 

.row2BlankTile:
    LDA.W #$001F 

.row2NotBlank:
    AND.W #$E3FF 
    ORA.W #$2C00 
    STA.L $7EC6BC,X 
    ASL.B $1C 
    BCC .next 
    LDA.B [$06],Y 
    AND.W #$E3FF 
    ORA.W #$2800 
    STA.L $7EC6BC,X 

.next:
    INX #2
    INY #2
    TYA 
    AND.W #$003F 
    CMP.W #$0000 
    BNE + 
    TYA 
    CLC : ADC.W #$07C0 : TAY 

  + DEC.B $12 
    BEQ .handleFlashing 
    JMP.W .loop 


.handleFlashing:
    PLP 
    LDA.W $05B5 
    AND.W #$0008 
    BNE .return 
    LDA.L $7EC680 : ORA.W #$1C00 : STA.L $7EC680 

.return:
    PLP 
    RTL 


MarkMapTileAboveSamusExplored:
    PHX 
    PHY 
    LDX.B $1E 
    SEP #$20 
    LDY.B $20 
    LDA.W $07F3,X : ORA.W Bitmasks_1bit_90AC04,Y : STA.W $07F3,X 
    REP #$20 
    PLY 
    PLX 
    RTS 


AdjustMapBitsForMapPageSpill:
    PHP 
    REP #$30 
    LDA.B $30 
    AND.W #$00FF 
    TAX 
    CLC : ADC.B $0F : STA.B $09 
    SEP #$20 
    LDA.W $07F7,X : STA.B $2C 
    LDA.B [$09] : STA.B $2D 
    LDA.B #$20 
    CMP.B $22 
    BNE .leftMapPage1 
    LDA.B $2C : STA.B $19 
    LDA.B $2D : STA.B $27 
    BRA + 


.leftMapPage1:
    LDA.B $2C : STA.B $18 
    LDA.B $2D : STA.B $26 

  + LDA.W $07FB,X : STA.B $2C 
    REP #$20 
    LDA.B $09 : CLC : ADC.W #$0004 : STA.B $09 
    SEP #$20 
    LDA.B [$09] : STA.B $2D 
    LDA.B #$20 
    CMP.B $22 
    BNE .leftMapPage2 
    LDA.B $2C : STA.B $1B 
    LDA.B $2D : STA.B $29 
    BRA + 


.leftMapPage2:
    LDA.B $2C : STA.B $1A 
    LDA.B $2D : STA.B $28 

  + LDA.W $07FF,X : STA.B $2C 
    REP #$20 
    LDA.B $09 : CLC : ADC.W #$0004 : STA.B $09 
    SEP #$20 
    LDA.B [$09] : STA.B $2D 
    LDA.B #$20 
    CMP.B $22 
    BNE .leftMapPage3 
    LDA.B $2C : STA.B $1D 
    LDA.B $2D : STA.B $2B 
    BRA .return 


.leftMapPage3:
    LDA.B $2C : STA.B $1C 
    LDA.B $2D : STA.B $2A 

.return:
    REP #$30 
    PLP 
    RTS 


Bitmasks_1bit_90AC04:
    db $80,$40,$20,$10,$08,$04,$02,$01 

Bitmasks_6bit_90AC0C:
    dw $FC00,$7E00,$3F00,$1F80,$0FC0,$07E0,$03F0,$01F8 

Handle_Samus_Cooldown:
    LDA.W $0A78 
    BNE .timeFrozen 
    LDA.W $0CCC 
    BEQ .return 
    BMI .resetCooldown 
    DEC A 
    STA.W $0CCC 
    BPL .return 

.resetCooldown:
    STZ.W $0CCC 

.return:
    RTS 


.timeFrozen:
    LDA.W #$0020 : STA.W $0CCC 
    RTS 


Check_if_Samus_Can_Fire_Beam:
    LDA.W $0CCE 
    CMP.W #$0005 
    BPL .noFire 
    LDA.W $0CCC 
    AND.W #$00FF 
    BNE .noFire 
    LDA.W #$0001 : STA.W $0CCC 
    LDA.W $0CCE 
    INC A 
    STA.W $0CCE 
    SEC 
    RTS 


.noFire:
    CLC 
    RTS 


Check_if_Samus_Can_Fire_Missile:
    LDA.W $09D2 
    CMP.W #$0002 
    BEQ .superMissile 
    LDA.W $0CCE 
    CMP.W #$0005 
    BPL .noFire 

.freeSlot:
    LDA.W $0CCC 
    AND.W #$00FF 
    BNE .noFire 
    LDA.W #$0001 : STA.W $0CCC 
    LDA.W $0CCE 
    INC A 
    STA.W $0CCE 
    SEC 
    RTS 


.noFire:
    CLC 
    RTS 


.superMissile:
    LDA.W $0CCE 
    CMP.W #$0004 
    BMI .freeSlot 
    CLC 
    RTS 


Update_Beam_Tiles_and_Palette:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    LDA.W $09A6 
    AND.W #$0FFF 
    ASL A 
    TAY 
    LDX.W $0330 
    LDA.W #$0100 : STA.B $D0,X 
    INX #2
    LDA.W BeamTilesPointers,Y : STA.B $D0,X 
    INX #2
    SEP #$20 
    LDA.B #$9A : STA.B $D0,X 
    REP #$20 
    INX 
    LDA.W #$6300 : STA.B $D0,X 
    INX #2
    STX.W $0330 
    JMP.W Load_Beam_Palette_withStackPrepped 


Load_Beam_Palette_Setup:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    AND.W #$0FFF 
    ASL A 
    TAY ; fallthrough to Load_Beam_Palette

Load_Beam_Palette_withStackPrepped:
    LDA.W #$0090 
    XBA 
    STA.B $01 
    LDA.W BeamPalettePointers,Y : STA.B $00 
    LDY.W #$0000 
    LDX.W #$0000 

.loop:
    LDA.B [$00],Y : STA.L $7EC1C0,X 
    INX #2
    INY #2
    CPY.W #$0020 
    BMI .loop 
    PLB 
    PLP 
    RTL 


Load_Beam_Palette_External:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    JSR.W Load_Beam_Palette 
    PLB 
    PLP 
    RTL 


Load_Beam_Palette:
    AND.W #$0FFF 
    ASL A 
    TAY 
    LDA.W #$0090 
    XBA 
    STA.B $01 
    LDA.W BeamPalettePointers,Y : STA.B $00 
    LDY.W #$0000 
    LDX.W #$0000 

.loop:
    LDA.B [$00],Y : STA.L $7EC1C0,X 
    INX #2
    INY #2
    CPY.W #$0020 
    BMI .loop 
    RTS 


Reset_Projectile_Data:
    PHP 
    REP #$30 
    LDX.W #$0000 

.loop:
    STZ.W $0C90,X 
    STZ.W $0B64,X 
    STZ.W $0B78,X 
    STZ.W $0C04,X 
    STZ.W $0BDC,X 
    STZ.W $0BF0,X 
    STZ.W $0BB4,X 
    STZ.W $0BC8,X 
    STZ.W $0C18,X 
    STZ.W $0C2C,X 
    STZ.W $0C40,X 
    STZ.W $0C54,X 
    STZ.W $0C7C,X 
    STZ.W $0CB8,X 
    LDA.W #RTS_90B169 : STA.W $0C68,X 
    INX #2
    CPX.W #$0014 
    BMI .loop 
    STZ.W $0CD2 
    STZ.W $0CCC 
    STZ.W $0CCE 
    STZ.W $0CEE 
    LDA.W $09EA 
    BEQ + 
    STZ.W $09D2 
    STZ.W $0A04 

  + STZ.W $0AB0 
    STZ.W $0AB2 
    STZ.W $0AB4 
    STZ.W $0AB6 
    STZ.W $0AB8 
    STZ.W $0ABA 
    STZ.W $0ABC 
    STZ.W $0ABE 
    STZ.W $0AC0 
    STZ.W $0AC2 
    STZ.W $0AC4 
    STZ.W $0AC6 
    STZ.W $0AAE 
    LDA.W $0A4A 
    BEQ .checkHyper 
    STZ.W $0A4A 
    JSL.L LoadSamusSuitTargetPalette 

.checkHyper:
    LDA.W $0A76 
    BEQ .return 
    LDY.W #PaletteFXObjects_HyperBeam 
    JSL.L Spawn_PaletteFXObject 

.return:
    PLP 
    RTL 


Clear_Projectile:
    PHP 
    REP #$30 
    STZ.W $0B64,X 
    STZ.W $0B78,X 
    STZ.W $0B8C,X 
    STZ.W $0BA0,X 
    STZ.W $0C04,X 
    STZ.W $0BDC,X 
    STZ.W $0BF0,X 
    STZ.W $0BB4,X 
    STZ.W $0BC8,X 
    STZ.W $0C18,X 
    STZ.W $0C2C,X 
    STZ.W $0C40,X 
    STZ.W $0C54,X 
    STZ.W $0C7C,X 
    STZ.W $0CB8,X 
    LDA.W #RTS_90B169 : STA.W $0C68,X 
    CPX.W #$000A 
    BPL + 
    DEC.W $0CCE 
    BPL .return 
    STZ.W $0CCE 
    BRA .return 


  + DEC.W $0CD2 
    BPL .return 
    STZ.W $0CD2 

.return:
    PLP 
    RTL 


Kill_Projectile:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    LDA.W $0C19,X 
    AND.W #$000F 
    BEQ .beam 
    CMP.W #$0003 
    BMI .missile 
    JSL.L Clear_Projectile 
    PLB 
    PLP 
    RTL 


.beam:
    TXY 
    LDA.W $0C04,X 
    AND.W #$000F 
    ASL A 
    TAX 
    JSR.W (.pointers,X) 
    TYX 

.missile:
    JSL.L PartOfKillProjectile_QueueSFX_SetInstruction 
    LDA.W #RTS_90B169 : STA.W $0C68,X 
    PLB 
    PLP 
    RTL 


.pointers:
    dw KillBeam_Up 
    dw KillBeam_UpRight 
    dw KillBeam_Right 
    dw KillBeam_DownRight 
    dw KillBeam_Down 
    dw KillBeam_Down 
    dw KillBeam_DownLeft 
    dw KillBeam_Left 
    dw KillBeam_UpLeft 
    dw KillBeam_Up 

KillBeam_Up:
    LDA.W $0B78,Y : SEC : SBC.W $0BC8,Y : STA.W $0B78,Y 
    RTS 


KillBeam_UpRight:
    LDA.W $0B64,Y : CLC : ADC.W $0BB4,Y : STA.W $0B64,Y 
    LDA.W $0B78,Y : SEC : SBC.W $0BC8,Y : STA.W $0B78,Y 
    RTS 


KillBeam_Right:
    LDA.W $0B64,Y : CLC : ADC.W $0BB4,Y : STA.W $0B64,Y 
    RTS 


KillBeam_DownRight:
    LDA.W $0B64,Y : CLC : ADC.W $0BB4,Y : STA.W $0B64,Y 
    LDA.W $0B78,Y : CLC : ADC.W $0BC8,Y : STA.W $0B78,Y 
    RTS 


KillBeam_Down:
    LDA.W $0B78,Y : CLC : ADC.W $0BC8,Y : STA.W $0B78,Y 
    RTS 


KillBeam_DownLeft:
    LDA.W $0B64,Y : SEC : SBC.W $0BB4,Y : STA.W $0B64,Y 
    LDA.W $0B78,Y : CLC : ADC.W $0BC8,Y : STA.W $0B78,Y 
    RTS 


KillBeam_Left:
    LDA.W $0B64,Y : SEC : SBC.W $0BB4,Y : STA.W $0B64,Y 
    RTS 


KillBeam_UpLeft:
    LDA.W $0B64,Y : SEC : SBC.W $0BB4,Y : STA.W $0B64,Y 
    LDA.W $0B78,Y : SEC : SBC.W $0BC8,Y : STA.W $0B78,Y 
    RTS 


Handle_Projectiles:
    PHP 
    REP #$30 
    LDA.W #$0012 : STA.W $0DDE 
    TAX 

.loop:
    LDA.W $0C40,X 
    BEQ .next 
    JSR.W ($0C68,X) 
    JSL.L ProjectileInstructionHandler 
    LDX.W $0DDE 

.next:
    DEX #2
    STX.W $0DDE 
    BPL .loop 
    STZ.W $0DD2 
    PLP 
    RTS 


Beam_NoWaveBeam:
    LDA.W $0C04,X 
    AND.W #$00F0 
    BEQ .trail 
    JSL.L Clear_Projectile 
    RTS 


.trail:
    DEC.W $0C90,X 
    BNE + 
    LDA.W #$0004 : STA.W $0C90,X 
    JSL.L Spawn_ProjectileTrail 
    LDX.W $0DDE 

  + LDA.W $0C04,X 
    AND.W #$000F 
    ASL A 
    TAY 
    LDA.W $0BDC,X : CLC : ADC.W ProjectileAccelerations_X,Y : STA.W $0BDC,X 
    LDA.W $0BF0,X : CLC : ADC.W ProjectileAccelerations_Y,Y : STA.W $0BF0,X 
    TYX 
    JSR.W (.pointers,X) 
    JSR.W DeleteProjectileIfTooFarOffScreen 
    RTS 


.pointers:
    dw BeamBlockCollision_NoWaveBeam_Vertical 
    dw BeamBlockCollision_NoWaveBeam_Diagonal 
    dw BeamBlockCollision_NoWaveBeam_Horizontal 
    dw BeamBlockCollision_NoWaveBeam_Diagonal 
    dw BeamBlockCollision_NoWaveBeam_Vertical 
    dw BeamBlockCollision_NoWaveBeam_Vertical 
    dw BeamBlockCollision_NoWaveBeam_Diagonal 
    dw BeamBlockCollision_NoWaveBeam_Horizontal 
    dw BeamBlockCollision_NoWaveBeam_Diagonal 
    dw BeamBlockCollision_NoWaveBeam_Vertical 

BeamBlockCollision_NoWaveBeam_Vertical:
    LDX.W $0DDE 
    JSL.L MoveBeamVertically_NoWaveBeam 
    RTS 


BeamBlockCollision_NoWaveBeam_Diagonal:
    LDX.W $0DDE 
    JSL.L MoveBeamHorizontally_NoWaveBeam 
    BCS .return 
    JSL.L MoveBeamVertically_NoWaveBeam 

.return:
    RTS 


BeamBlockCollision_NoWaveBeam_Horizontal:
    LDX.W $0DDE 
    JSL.L MoveBeamHorizontally_NoWaveBeam 
    RTS 


ProjectilePreInstruction_Missile:
    LDA.W $0C04,X 
    AND.W #$00F0 
    BEQ .notDeleted 
    JSL.L Clear_Projectile 
    RTS 


.notDeleted:
    DEC.W $0C90,X 
    BNE + 
    LDA.W #$0004 : STA.W $0C90,X 
    JSL.L Spawn_ProjectileTrail 
    LDX.W $0DDE 

  + LDA.W $0C04,X 
    AND.W #$000F 
    ASL A 
    TAY 
    LDA.W $0BDC,X : CLC : ADC.W ProjectileAccelerations_X,Y : STA.W $0BDC,X 
    LDA.W $0BF0,X : CLC : ADC.W ProjectileAccelerations_Y,Y : STA.W $0BF0,X 
    TYA 
    LSR A 
    TAY 
    JSR.W AccelerateMissile 
    TYA 
    ASL A 
    TAX 
    JSR.W (.pointers,X) 
    JSR.W DeleteProjectileIfTooFarOffScreen 
    RTS 


.pointers:
    dw MissileBlockCollision_Vertical 
    dw MissileBlockCollision_Diagonal 
    dw MissileBlockCollision_Horizontal 
    dw MissileBlockCollision_Diagonal 
    dw MissileBlockCollision_Vertical 
    dw MissileBlockCollision_Vertical 
    dw MissileBlockCollision_Diagonal 
    dw MissileBlockCollision_Horizontal 
    dw MissileBlockCollision_Diagonal 
    dw MissileBlockCollision_Vertical 

MissileBlockCollision_Vertical:
    LDX.W $0DDE 
    JSL.L MoveMissileVertically 
    RTS 


MissileBlockCollision_Diagonal:
    LDX.W $0DDE 
    JSL.L MoveMissileHorizontally 
    BCS .return 
    JSL.L MoveMissileVertically 

.return:
    RTS 


MissileBlockCollision_Horizontal:
    LDX.W $0DDE 
    JSL.L MoveMissileHorizontally 
    RTS 


ProjectilePreInstruction_SuperMissile:
    LDA.W $0C04,X 
    AND.W #$00F0 
    BEQ .notDeleted 
    JSL.L Clear_Projectile 
    BRA .delete 


.notDeleted:
    DEC.W $0C90,X 
    BNE + 
    LDA.W #$0002 : STA.W $0C90,X 
    JSL.L Spawn_ProjectileTrail 
    LDX.W $0DDE 

  + LDA.W $0C04,X 
    AND.W #$000F 
    TAY 
    JSR.W AccelerateMissile 
    TYA 
    ASL A 
    TAX 
    JSR.W (.pointers,X) 
    JSR.W DeleteProjectileIfTooFarOffScreen 
    BCS .delete 
    RTS 


.delete:
    LDY.W #$0008 

.loop:
    LDA.W $0C18,Y 
    AND.W #$0FFF 
    CMP.W #$0200 
    BNE .next 
    TYX 
    JSL.L Clear_Projectile 

.next:
    DEY #2
    BPL .loop 
    RTS 


.pointers:
    dw SuperMissileBlockCollision_Vertical 
    dw SuperMissileBlockCollision_Diagonal 
    dw SuperMissileBlockCollision_Horizontal 
    dw SuperMissileBlockCollision_Diagonal 
    dw SuperMissileBlockCollision_Vertical 
    dw SuperMissileBlockCollision_Vertical 
    dw SuperMissileBlockCollision_Diagonal 
    dw SuperMissileBlockCollision_Horizontal 
    dw SuperMissileBlockCollision_Diagonal 
    dw SuperMissileBlockCollision_Vertical 

SuperMissileBlockCollision_Vertical:
    LDX.W $0DDE 
    JSL.L MoveMissileVertically 
    JSR.W SuperMissileLink 
    RTS 


SuperMissileBlockCollision_Diagonal:
    LDX.W $0DDE 
    JSL.L MoveMissileHorizontally 
    BCS .collision 
    JSR.W SuperMissileLink_HorizontalBlockCollisionDetection 
    JSL.L MoveMissileVertically 
    JSR.W SuperMissileLink 
    RTS 


.collision:
    JSR.W SuperMissileLink_HorizontalBlockCollisionDetection 
    RTS 


SuperMissileBlockCollision_Horizontal:
    LDX.W $0DDE 
    JSL.L MoveMissileHorizontally 
    JSR.W SuperMissileLink_HorizontalBlockCollisionDetection 
    RTS 


ProjectilePreInstruction_SuperMissileLink:
    LDA.W $0C04,X 
    AND.W #$00F0 
    BEQ .return 
    JSL.L Clear_Projectile 
    LDY.W #$0008 

.loop:
    LDA.W $0C18,Y 
    AND.W #$0FFF 
    CMP.W #$0200 
    BNE .next 
    TYX 
    JSL.L Clear_Projectile 

.next:
    DEY #2
    BPL .loop 

.return:
    RTS 


ProjectilePreInstruction_Bomb:
    LDA.W $0C04,X 
    AND.W #$00F0 
    BEQ .notDeleted 
    JSL.L Clear_Projectile 
    RTS 


.notDeleted:
    JSR.W HandleBomb 
    JSL.L BombAndPowerBombExplosionBlockCollisionHandling 
    RTS 


ProjectilePreInstruction_PowerBomb:
    LDA.W $0C04,X 
    AND.W #$00F0 
    BEQ .notDeleted 
    JSL.L Clear_Projectile 
    RTS 


.notDeleted:
    JSR.W HandlePowerBomb 
    JSL.L BombAndPowerBombExplosionBlockCollisionHandling 
    RTS 


ProjectilePreInstruction_Beam_WavePlasmaSpazer_ChargeIceWave:
    LDA.W $0C04,X 
    AND.W #$00F0 
    BEQ .notDeleted 
    JSL.L Clear_Projectile 
    RTS 


.notDeleted:
    DEC.W $0C90,X 
    BNE WaveBeamSharedPreInstruction 
    LDA.W #$0004 : STA.W $0C90,X 
    JSL.L Spawn_ProjectileTrail 
    LDX.W $0DDE 
    BRA WaveBeamSharedPreInstruction 


ProjectilePreInstruction_Beam_UnchargedIceWave:
    LDA.W $0C04,X 
    AND.W #$00F0 
    BEQ .notDeleted 
    JSL.L Clear_Projectile 
    RTS 


.notDeleted:
    DEC.W $0C90,X 
    BNE WaveBeamSharedPreInstruction 
    LDA.W #$0003 : STA.W $0C90,X 
    JSL.L Spawn_ProjectileTrail 
    LDX.W $0DDE 

WaveBeamSharedPreInstruction:
    LDA.W $0C04,X 
    AND.W #$000F 
    ASL A 
    TAY 
    LDA.W $0BDC,X : CLC : ADC.W ProjectileAccelerations_X,Y : STA.W $0BDC,X 
    LDA.W $0BF0,X : CLC : ADC.W ProjectileAccelerations_Y,Y : STA.W $0BF0,X 
    TYX 
    JSR.W (.pointers,X) 
    JSR.W DeleteProjectileIfTooFarOffScreen 
    RTS 


.pointers:
    dw WaveBeamBlockCollision_Vertical 
    dw WaveBeamBlockCollision_Diagonal 
    dw WaveBeamBlockCollision_Horizontal 
    dw WaveBeamBlockCollision_Diagonal 
    dw WaveBeamBlockCollision_Vertical 
    dw WaveBeamBlockCollision_Vertical 
    dw WaveBeamBlockCollision_Diagonal 
    dw WaveBeamBlockCollision_Horizontal 
    dw WaveBeamBlockCollision_Diagonal 
    dw WaveBeamBlockCollision_Vertical 

WaveBeamBlockCollision_Vertical:
    LDX.W $0DDE 
    JSL.L MoveBeamVertically_WaveBeam 
    RTS 


WaveBeamBlockCollision_Diagonal:
    LDX.W $0DDE 
    JSL.L MoveBeamHorizontally_WaveBeam 
    BCS .return 
    JSL.L MoveBeamVertically_WaveBeam 

.return:
    RTS 


WaveBeamBlockCollision_Horizontal:
    LDX.W $0DDE 
    JSL.L MoveBeamHorizontally_WaveBeam 
    RTS 


ProjectilePreInstruction_HyperBeam:
    LDA.W $0C04,X 
    AND.W #$00F0 
    BEQ .gotoShared 
    JSL.L Clear_Projectile 
    RTS 


.gotoShared:
    JMP.W WaveBeamSharedPreInstruction 

RTS_90B169:
    RTS 


DeleteProjectileIfTooFarOffScreen:
    LDX.W $0DDE 
    LDA.W $0B64,X : SEC : SBC.W $0911 : CMP.W #$FFC0 
    BMI .delete 
    CMP.W #$0140 
    BMI .verticalCheck 

.delete:
    JSL.L Clear_Projectile 
    SEC 
    RTS 


.verticalCheck:
    LDA.W $0B78,X : SEC : SBC.W $0915 : CMP.W #$FFC0 
    BMI .delete 
    CMP.W #$0140 
    BPL .delete 
    CLC 
    RTS 


InitializeBeamVelocities:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    LDX.B $14 
    LDA.W $0C18,X 
    AND.W #$000F 
    ASL #2
    TAY 
    LDA.W $0C04,X 
    AND.W #$000F 
    ASL A 
    TAX 
    JMP.W (.pointers,X) 


.notDiagonal:
    LDA.W BeamSpeeds_Horizontal_Vertical,Y : STA.B $16 
    BRA .merge 


.diagonal:
    LDA.W BeamSpeeds_Diagonal,Y : STA.B $16 

.merge:
    LDX.B $14 
    STX.B $12 
    JSR.W InitializeProjectileVelocities 
    PLB 
    PLP 
    RTL 


.pointers:
    dw .notDiagonal 
    dw .diagonal 
    dw .notDiagonal 
    dw .diagonal 
    dw .notDiagonal 
    dw .notDiagonal 
    dw .diagonal 
    dw .notDiagonal 
    dw .diagonal 
    dw .notDiagonal 

InitializeMissileVelocities:
    PHP 
    REP #$30 
    LDX.B $14 
    LDA.W $0C18,X 
    AND.W #$000F 
    ASL A 
    TAY 
    STZ.B $16 
    STX.B $12 
    JSR.W InitializeProjectileVelocities 
    PLP 
    RTS 


InitializeProjectileVelocities:
    STZ.W $0B8C,X 
    STZ.W $0BA0,X 
    LDA.W $0C04,X 
    AND.W #$000F 
    ASL A 
    TAX 
    JMP.W (.pointers,X) 


.pointers:
    dw InitializeProjectileVelocities_Up 
    dw InitializeProjectileVelocities_UpRight 
    dw InitializeProjectileVelocities_Right 
    dw InitializeProjectileVelocities_DownRight 
    dw InitializeProjectileVelocities_Down 
    dw InitializeProjectileVelocities_Down 
    dw InitializeProjectileVelocities_DownLeft 
    dw InitializeProjectileVelocities_Left 
    dw InitializeProjectileVelocities_UpLeft 
    dw InitializeProjectileVelocities_Up 

InitializeProjectileVelocities_Up:
    LDX.B $12 
    LDA.W $0DB1 
    BIT.W #$FF00 
    BNE .left 
    STZ.B $12 
    BRA + 


.left:
    LSR #2
    ORA.W #$C000 
    STA.B $12 

  + LDA.B $16 
    EOR.W #$FFFF 
    INC A 
    CLC : ADC.B $12 : STA.W $0BF0,X 
    STZ.W $0BDC,X 
    RTS 


InitializeProjectileVelocities_UpRight:
    LDX.B $12 
    LDA.W $0DB1 
    BIT.W #$FF00 
    BNE .left 
    STZ.B $12 
    BRA + 


.left:
    LSR #2
    ORA.W #$C000 
    STA.B $12 

  + LDA.B $16 
    EOR.W #$FFFF 
    INC A 
    CLC : ADC.B $12 : STA.W $0BF0,X 
    LDA.B $16 : CLC : ADC.W $0DAD : STA.W $0BDC,X 
    RTS 


InitializeProjectileVelocities_Right:
    LDX.B $12 
    STZ.W $0BF0,X 
    LDA.B $16 : CLC : ADC.W $0DAD : STA.W $0BDC,X 
    RTS 


InitializeProjectileVelocities_DownRight:
    LDX.B $12 
    LDA.B $16 : CLC : ADC.W $0DB5 : STA.W $0BF0,X 
    LDA.B $16 : CLC : ADC.W $0DAD : STA.W $0BDC,X 
    RTS 


InitializeProjectileVelocities_Down:
    LDX.B $12 
    LDA.B $16 : CLC : ADC.W $0DB5 : STA.W $0BF0,X 
    STZ.W $0BDC,X 
    RTS 


InitializeProjectileVelocities_DownLeft:
    LDX.B $12 
    LDA.B $16 : CLC : ADC.W $0DB5 : STA.W $0BF0,X 
    LDA.B $16 
    EOR.W #$FFFF 
    INC A 
    CLC : ADC.W $0DA9 : STA.W $0BDC,X 
    RTS 


InitializeProjectileVelocities_Left:
    LDX.B $12 
    STZ.W $0BF0,X 
    LDA.B $16 
    EOR.W #$FFFF 
    INC A 
    CLC : ADC.W $0DA9 : STA.W $0BDC,X 
    RTS 


InitializeProjectileVelocities_UpLeft:
    LDX.B $12 
    LDA.W $0DB1 
    BIT.W #$FF00 
    BNE .left 
    STZ.B $12 
    BRA + 


.left:
    LSR #2
    ORA.W #$C000 
    STA.B $12 

  + LDA.B $16 
    EOR.W #$FFFF 
    INC A 
    CLC : ADC.B $12 : STA.W $0BF0,X 
    LDA.B $16 
    EOR.W #$FFFF 
    INC A 
    CLC : ADC.W $0DA9 : STA.W $0BDC,X 
    RTS 


AccelerateMissile:
    PHP 
    REP #$30 
    PHX 
    PHY 
    LDA.W $0C7C,X 
    AND.W #$FF00 
    BNE .initialized 
    LDA.W $0C7C,X : CLC : ADC.W MissileInitializedBitset : STA.W $0C7C,X 
    AND.W #$FF00 
    BEQ .return 
    LDA.W $0C7C,X : STA.B $16 
    STX.B $12 
    JSR.W InitializeProjectileVelocities 
    LDA.W $0C18,X 
    BIT.W #$0200 
    BEQ .return 
    JSR.W Spawn_SuperMissileLink 
    BRA .return 


.initialized:
    LDA.W $0C04,X 
    AND.W #$000F 
    ASL #2
    STA.B $12 
    LDA.W $0C19,X 
    AND.W #$000F 
    BIT.W #$0002 
    BNE .superMissile 
    LDA.W #MissileAccelerations : CLC : ADC.B $12 : TAY 
    BRA + 


.superMissile:
    LDA.W #SuperMissileAccelerations : CLC : ADC.B $12 : TAY 

  + LDA.W $0BDC,X : CLC : ADC.W $0000,Y : STA.W $0BDC,X 
    LDA.W $0BF0,X : CLC : ADC.W $0002,Y : STA.W $0BF0,X 

.return:
    PLY 
    PLX 
    PLP 
    RTS 


SuperMissileLink:
    LDX.W $0DDE 
    LDA.W $0C18,X 
    AND.W #$0F00 
    CMP.W #$0200 
    BEQ .superMissile 
    CMP.W #$0800 
    BEQ .superMissile 
    RTS 


.superMissile:
    LDA.W $0C7C,X 
    BIT.W #$FF00 
    BNE .initialized 
    RTS 


.initialized:
    AND.W #$00FF 
    TAY 
    LDA.W $0BF0,X 
    BPL + 
    EOR.W #$FFFF 
    INC A 

  + AND.W #$FF00 
    CMP.W #$0B00 
    BMI .slow 
    XBA 
    SEC : SBC.W #$000A : STA.B $12 
    LDA.W $0BF0,X 
    BMI .upwards 
    PHX 
    LDA.W $0B78,X : SEC : SBC.B $12 : STA.W $0B78,Y 
    TYX 
    STY.W $0DDE 
    JSL.L MoveMissileVertically 
    TXY 
    PLX 
    STX.W $0DDE 
    LDA.W $0C18,X 
    AND.W #$0F00 
    CMP.W #$0800 
    BNE .return 
    TYX 
    JSL.L Clear_Projectile 

.return:
    RTS 


.upwards:
    PHX 
    LDA.W $0B78,X : CLC : ADC.B $12 : STA.W $0B78,Y 
    TYX 
    STY.W $0DDE 
    JSL.L MoveMissileVertically 
    TXY 
    PLX 
    STX.W $0DDE 
    LDA.W $0C18,X 
    AND.W #$0F00 
    CMP.W #$0800 
    BNE .return 

.explosion:
    TYX 
    JSL.L Clear_Projectile 
    RTS 


.slow:
    LDA.W $0C18,X 
    AND.W #$0F00 
    CMP.W #$0800 
    BEQ .explosion 
    LDA.W $0B78,X : STA.W $0B78,Y 
    RTS 


SuperMissileLink_HorizontalBlockCollisionDetection:
    LDX.W $0DDE 
    LDA.W $0C18,X 
    AND.W #$0F00 
    CMP.W #$0200 
    BEQ .superMissile 
    CMP.W #$0800 
    BEQ .superMissile 
    RTS 


.superMissile:
    LDA.W $0C7C,X 
    BIT.W #$FF00 
    BNE .initialized 
    RTS 


.initialized:
    AND.W #$00FF 
    TAY 
    LDA.W $0BDC,X 
    BPL + 
    EOR.W #$FFFF 
    INC A 

  + AND.W #$FF00 
    CMP.W #$0B00 
    BMI .slow 
    XBA 
    SEC : SBC.W #$000A : STA.B $12 
    LDA.W $0BDC,X 
    BMI .leftwards 
    PHX 
    LDA.W $0B64,X : SEC : SBC.B $12 : STA.W $0B64,Y 
    TYX 
    STY.W $0DDE 
    JSL.L MoveMissileHorizontally 
    TXY 
    PLX 
    STX.W $0DDE 
    LDA.W $0C18,X 
    AND.W #$0F00 
    CMP.W #$0800 
    BNE .return 
    TYX 
    JSL.L Clear_Projectile 

.return:
    RTS 


.leftwards:
    PHX 
    LDA.W $0B64,X : CLC : ADC.B $12 : STA.W $0B64,Y 
    TYX 
    STY.W $0DDE 
    JSL.L MoveMissileHorizontally 
    TXY 
    PLX 
    STX.W $0DDE 
    LDA.W $0C18,X 
    AND.W #$0F00 
    CMP.W #$0800 
    BNE .return 

.explosion:
    TYX 
    JSL.L Clear_Projectile 
    RTS 


.slow:
    LDA.W $0C18,X 
    AND.W #$0F00 
    CMP.W #$0800 
    BEQ .explosion 
    LDA.W $0B64,X : STA.W $0B64,Y 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_ClearLinkedSuperMissileIfSuperMissileExplosion_90B4A6:
    PHP 
    REP #$30 
    LDA.W $0C7C,X 
    BIT.W #$FF00 
    BNE .initialized 
    PLP 
    RTL 


.initialized:
    AND.W #$00FF 
    TAY 
    LDA.W $0C18,X 
    AND.W #$0F00 
    CMP.W #$0800 
    BNE .return 
    TYX 
    JSL.L Clear_Projectile 

.return:
    PLP 
    RTL 
endif ; !FEATURE_KEEP_UNREFERENCED


InstList_BeamTrail_Empty:
    dw $0000 

InstList_LeftBeamTrail_IceBeams_ChargedPowerBeam:
    dw $0001,$2C38,$0001,$2C38,$0001,$2C38,$0001,$2C38 
    dw $0001,$2C39,$0001,$2C39 
    dw Instruction_MoveLeftProjectileTrailDownOnePixel 
    dw $0001,$2C39,$0001,$2C39 
    dw Instruction_MoveLeftProjectileTrailDownOnePixel 
    dw $0001,$2C3A 
    dw Instruction_MoveLeftProjectileTrailDownOnePixel 
    dw $0001,$2C3A 
    dw Instruction_MoveLeftProjectileTrailDownOnePixel 
    dw $0001,$2C3A 
    dw Instruction_MoveLeftProjectileTrailDownOnePixel 
    dw $0001,$2C3A 
    dw Instruction_MoveLeftProjectileTrailDownOnePixel 
    dw $0001,$2C3A 
    dw Instruction_MoveLeftProjectileTrailDownOnePixel 
    dw $0001,$2C3A 
    dw Instruction_MoveLeftProjectileTrailDownOnePixel 
    dw $0001,$2C3A 
    dw Instruction_MoveLeftProjectileTrailDownOnePixel 
    dw $0001,$2C3A 
    dw Instruction_MoveLeftProjectileTrailDownOnePixel 
    dw $0004,$2C3B,$0000 

Instruction_MoveLeftProjectileTrailDownOnePixel:
    LDA.W $D778,Y 
    INC A 
    STA.W $D778,Y 
    RTS 


InstList_RightBeamTrail_SomeIceBeams:
    dw $0001,$2C38,$0001,$2C38,$0001,$2C38,$0001,$2C38 
    dw $0001,$2C39,$0001,$2C39 
    dw Instruction_MoveRightProjectileTrailDownOnePixel 
    dw $0001,$2C39,$0001,$2C39 
    dw Instruction_MoveRightProjectileTrailDownOnePixel 
    dw $0001,$2C3A 
    dw Instruction_MoveRightProjectileTrailDownOnePixel 
    dw $0001,$2C3A 
    dw Instruction_MoveRightProjectileTrailDownOnePixel 
    dw $0001,$2C3A 
    dw Instruction_MoveRightProjectileTrailDownOnePixel 
    dw $0001,$2C3A 
    dw Instruction_MoveRightProjectileTrailDownOnePixel 
    dw $0001,$2C3A 
    dw Instruction_MoveRightProjectileTrailDownOnePixel 
    dw $0001,$2C3A 
    dw Instruction_MoveRightProjectileTrailDownOnePixel 
    dw $0001,$2C3A 
    dw Instruction_MoveRightProjectileTrailDownOnePixel 
    dw $0001,$2C3A 
    dw Instruction_MoveRightProjectileTrailDownOnePixel 
    dw $0004,$2C3B,$0000 

Instruction_MoveRightProjectileTrailDownOnePixel:
    LDA.W $D79C,Y 
    INC A 
    STA.W $D79C,Y 
    RTS 


InstList_BeamTrail_WaveBeam:
    dw $0004,$2A3C,$0004,$2A3D,$0004,$2A3E,$0004,$2A3F 
    dw $0000 

InstList_BeamTrail_SuperMissile:
    dw $0004,$2A48,$0004,$2A49,$0004,$2A4A,$0004,$2A4B 
    dw $0000 

Instruction_MoveLeftProjectileTrailUpOnePixel:
    LDA.W $D778,Y 
    DEC A 
    STA.W $D778,Y 
    RTS 


ProjectileTrail_InstListPointers_Left:
    dw InstList_BeamTrail_Empty 
    dw InstList_BeamTrail_WaveBeam 
    dw InstList_LeftBeamTrail_IceBeams_ChargedPowerBeam 
    dw InstList_LeftBeamTrail_IceBeams_ChargedPowerBeam 
    dw InstList_BeamTrail_Empty 
    dw InstList_BeamTrail_Empty 
    dw InstList_LeftBeamTrail_IceBeams_ChargedPowerBeam 
    dw InstList_LeftBeamTrail_IceBeams_ChargedPowerBeam 
    dw InstList_BeamTrail_Empty 
    dw InstList_BeamTrail_Empty 
    dw InstList_LeftBeamTrail_IceBeams_ChargedPowerBeam 
    dw InstList_LeftBeamTrail_IceBeams_ChargedPowerBeam 
    dw InstList_BeamTrail_Empty 
    dw InstList_BeamTrail_Empty 
    dw InstList_BeamTrail_Empty 
    dw InstList_BeamTrail_Empty 
    dw InstList_LeftBeamTrail_IceBeams_ChargedPowerBeam 
    dw InstList_BeamTrail_WaveBeam 
    dw InstList_LeftBeamTrail_IceBeams_ChargedPowerBeam 
    dw InstList_LeftBeamTrail_IceBeams_ChargedPowerBeam 
    dw InstList_BeamTrail_Empty 
    dw InstList_BeamTrail_Empty 
    dw InstList_LeftBeamTrail_IceBeams_ChargedPowerBeam 
    dw InstList_LeftBeamTrail_IceBeams_ChargedPowerBeam 
    dw InstList_BeamTrail_Empty 
    dw InstList_BeamTrail_Empty 
    dw InstList_LeftBeamTrail_IceBeams_ChargedPowerBeam 
    dw InstList_LeftBeamTrail_IceBeams_ChargedPowerBeam 
    dw InstList_BeamTrail_Empty 
    dw InstList_BeamTrail_Empty 
    dw InstList_BeamTrail_Empty 
    dw InstList_BeamTrail_Empty 
    dw InstList_BeamTrail_SuperMissile 
    dw InstList_BeamTrail_SuperMissile 
    dw InstList_BeamTrail_Empty 
    dw InstList_BeamTrail_Empty 
    dw InstList_LeftBeamTrail_IceBeams_ChargedPowerBeam 
    dw InstList_LeftBeamTrail_IceBeams_ChargedPowerBeam 
    dw InstList_LeftBeamTrail_IceBeams_ChargedPowerBeam 

ProjectileTrail_InstListPointers_Right:
    dw InstList_BeamTrail_Empty 
    dw InstList_BeamTrail_Empty 
    dw InstList_BeamTrail_Empty 
    dw InstList_BeamTrail_Empty 
    dw InstList_BeamTrail_Empty 
    dw InstList_BeamTrail_Empty 
    dw InstList_RightBeamTrail_SomeIceBeams 
    dw InstList_RightBeamTrail_SomeIceBeams 
    dw InstList_BeamTrail_Empty 
    dw InstList_BeamTrail_Empty 
    dw InstList_BeamTrail_Empty 
    dw InstList_RightBeamTrail_SomeIceBeams 
    dw InstList_BeamTrail_Empty 
    dw InstList_BeamTrail_Empty 
    dw InstList_BeamTrail_Empty 
    dw InstList_BeamTrail_Empty 
    dw InstList_BeamTrail_Empty 
    dw InstList_BeamTrail_WaveBeam 
    dw InstList_BeamTrail_Empty 
    dw InstList_RightBeamTrail_SomeIceBeams 
    dw InstList_BeamTrail_Empty 
    dw InstList_BeamTrail_Empty 
    dw InstList_RightBeamTrail_SomeIceBeams 
    dw InstList_RightBeamTrail_SomeIceBeams 
    dw InstList_BeamTrail_Empty 
    dw InstList_BeamTrail_Empty 
    dw InstList_BeamTrail_Empty 
    dw InstList_RightBeamTrail_SomeIceBeams 
    dw InstList_BeamTrail_Empty 
    dw InstList_BeamTrail_Empty 
    dw InstList_BeamTrail_Empty 
    dw InstList_BeamTrail_Empty 
    dw InstList_BeamTrail_Empty 
    dw InstList_BeamTrail_Empty 
    dw InstList_BeamTrail_Empty 
    dw InstList_BeamTrail_Empty 
    dw InstList_LeftBeamTrail_IceBeams_ChargedPowerBeam 
    dw InstList_RightBeamTrail_SomeIceBeams 
    dw InstList_LeftBeamTrail_IceBeams_ChargedPowerBeam 

Spawn_ProjectileTrail:
    PHB 
    LDA.W $0C18,X 
    BIT.W #$0F00 
    BNE .notBeam 
    AND.W #$003F 
    BRA + 


.notBeam:
    XBA 
    AND.W #$000F 
    CMP.W #$0003 
    BCS .returnCarrySet 
    CLC : ADC.W #$001F 

  + ASL A 
    TAX 
    PEA.W $7E7E 
    PLB 
    PLB 
    LDY.W #$0022 

.loop:
    LDA.W $D658,Y 
    BEQ .found 
    DEY #2
    BPL .loop 

.returnCarrySet:
    PLB 
    SEC 
    RTL 


.found:
    LDA.W #$0001 : STA.W $D658,Y 
    STA.W $D67C,Y 
    LDA.L ProjectileTrail_InstListPointers_Left,X : STA.W $D6A0,Y 
    LDA.L ProjectileTrail_InstListPointers_Right,X : STA.W $D6C4,Y 
    LDX.W $0DDE 
    JSL.L SetProjectileTrailPosition 
    PLB 
    CLC 
    RTL 


HandleProjectileTrails:
    PHB 
    PEA.W $7E7E 
    PLB 
    PLB 
    LDA.W $0A78 
    BEQ .notFrozen 
    JMP.W .timeIsFrozen 


.notFrozen:
    LDY.W #$0022 

.main:
    LDA.W $D658,Y 
    BEQ .leftTrailEnd 
    DEC A 
    STA.W $D658,Y 
    BNE .leftInstructionsEnd 
    LDX.W $D6A0,Y 

.loopLeft:
    LDA.L $900000,X 
    BPL .notAPointer 
    INX #2
    PEA.W .loopLeft-1 
    STA.B $12 
    JMP.W ($0012) 


.notAPointer:
    STA.W $D658,Y 
    BEQ .leftTrailEnd 
    LDA.L $900002,X : STA.W $D6E8,Y 
    TXA 
    CLC : ADC.W #$0004 : STA.W $D6A0,Y 

.leftInstructionsEnd:
    LDX.W $0590 
    CPX.W #$0200 
    BPL .leftTrailEnd 
    LDA.W $D730,Y : SEC : SBC.W $0911 : BIT.W #$FF00 
    BNE .leftTrailEnd 
    STA.W $0370,X 
    LDA.W $D778,Y : SEC : SBC.W $0915 : BIT.W #$FF00 
    BNE .leftTrailEnd 
    STA.W $0371,X 
    LDA.W $D6E8,Y : STA.W $0372,X 
    TXA 
    CLC : ADC.W #$0004 : STA.W $0590 

.leftTrailEnd:
    LDA.W $D67C,Y 
    BEQ .rightTrailEnd 
    DEC A 
    STA.W $D67C,Y 
    BNE .rightInstructionsEnd 
    LDX.W $D6C4,Y 

.loop:
    LDA.L $900000,X 
    BPL .notPointer 
    INX #2
    PEA.W .loop-1 
    STA.B $12 
    JMP.W ($0012) 


.notPointer:
    STA.W $D67C,Y 
    BEQ .rightTrailEnd 
    LDA.L $900002,X : STA.W $D70C,Y 
    TXA 
    CLC : ADC.W #$0004 : STA.W $D6C4,Y 

.rightInstructionsEnd:
    LDX.W $0590 
    CPX.W #$0200 
    BPL .rightTrailEnd 
    LDA.W $D754,Y : SEC : SBC.W $0911 : BIT.W #$FF00 
    BNE .rightTrailEnd 
    STA.W $0370,X 
    LDA.W $D79C,Y : SEC : SBC.W $0915 : BIT.W #$FF00 
    BNE .rightTrailEnd 
    STA.W $0371,X 
    LDA.W $D70C,Y : STA.W $0372,X 
    TXA 
    CLC : ADC.W #$0004 : STA.W $0590 

.rightTrailEnd:
    DEY #2
    BMI .return 
    JMP.W .main 


.return:
    PLB 
    RTL 


.timeIsFrozen:
    LDY.W #$0022 

.loopTimeIsFrozen:
    LDX.W $0590 
    CPX.W #$0200 
    BPL + 
    LDA.W $D658,Y 
    BEQ + 
    LDA.W $D730,Y : SEC : SBC.W $0911 : BIT.W #$FF00 
    BNE + 
    STA.W $0370,X 
    LDA.W $D778,Y : SEC : SBC.W $0915 : BIT.W #$FF00 
    BNE + 
    STA.W $0371,X 
    LDA.W $D6E8,Y : STA.W $0372,X 
    TXA 
    CLC : ADC.W #$0004 : STA.W $0590 

  + LDX.W $0590 
    CPX.W #$0200 
    BPL .next 
    LDA.W $D67C,Y 
    BEQ .next 
    LDA.W $D754,Y : SEC : SBC.W $0911 : BIT.W #$FF00 
    BNE .next 
    STA.W $0370,X 
    LDA.W $D79C,Y : SEC : SBC.W $0915 : BIT.W #$FF00 
    BNE .next 
    STA.W $0371,X 
    LDA.W $D70C,Y : STA.W $0372,X 
    TXA 
    CLC : ADC.W #$0004 : STA.W $0590 

.next:
    DEY #2
    BMI .returnFrozen 
    JMP.W .loopTimeIsFrozen 


.returnFrozen:
    PLB 
    RTL 


HUDSelectionHandler_Nothing_PowerBombs:
    PHP 
    REP #$30 
    LDA.W $0CD0 : STA.W $0DC2 
    LDA.W $0A76 
    BNE + 
    LDA.W $09A6 
    BIT.W #$1000 
    BNE .charge 

  + LDA.B $8B 
    AND.W $09B2 
    BEQ .return 
    JMP.W Fire_Uncharge_Beam 


.charge:
    LDA.W $0B5E 
    BEQ + 
    LDA.W $0CD0 
    CMP.W #$003C 
    BPL .releaseChargedBeam 
    BRA .releaseUnchargedBeam 


  + LDA.B $8B 
    AND.W $09B2 
    BEQ + 
    LDA.W $0CD0 
    CMP.W #$0078 
    BPL .SBA 
    INC A 
    STA.W $0CD0 
    CMP.W #$0001 
    BNE .return 
    JSR.W ClearFlareAnimationState 
    JMP.W Fire_Uncharge_Beam 


  + LDA.W $0CD0 
    BEQ .return 
    CMP.W #$003C 
    BPL .releaseChargedBeam 

.releaseUnchargedBeam:
    STZ.W $0CD0 
    JSR.W ClearFlareAnimationState 
    JMP.W Fire_Uncharge_Beam 


.releaseChargedBeam:
    STZ.W $0CD0 
    JSR.W ClearFlareAnimationState 
    JMP.W FireChargeBeam 


.SBA:
    JSR.W FireSBA 
    BCC .return 
    STZ.W $0CD0 
    JSR.W ClearFlareAnimationState 
    JSL.L LoadSamusSuitPalette 

.return:
    PLP 
    RTS 


Fire_Uncharge_Beam:
    LDA.W $0A76 
    BEQ .notHyper 
    JMP.W FireHyperBeam 


.notHyper:
    JSR.W Check_if_Samus_Can_Fire_Beam 
    BCS .fire 

.cannotFire:
    LDA.W $0DC2 
    CMP.W #$0010 
    BPL + 
    PLP 
    RTS 


  + STZ.W $0DC0 
    LDA.W #$0002 
    JSL.L QueueSound 
    PLP 
    RTS 


.fire:
    LDX.W #$0000 

.loop:
    LDA.W $0C2C,X 
    BEQ .zeroDamage 
    INX #2
    CPX.W #$000A 
    BMI .loop 
    DEX #2
    .zeroDamage:
    STX.B $14 
    JSR.W InitializeProjectilePositionDirection 
    BCS .cannotFire 
    LDA.W #$000A : STA.W $18AC 
    LDX.B $14 
    LDA.W #$0004 : STA.W $0C90,X 
    LDA.W $09A6 : ORA.W #$8000 : STA.W $0C18,X 
    AND.W #$000F 
    ASL A 
    TAY 
    LDA.W ProjectileSFX_Uncharged,Y 
    JSL.L QueueSound 
    STZ.W $0DC0 
    JSL.L InitializeProjectile 
    LDA.W $09A6 
    BIT.W #$1000 
    BNE .chargeEquippedOrPreviouslyPressedShot 
    LDA.B $8F 
    BIT.W $09B2 
    BNE .chargeEquippedOrPreviouslyPressedShot 
    LDA.W $0E00 
    BIT.W $09B2 
    BNE .chargeEquippedOrPreviouslyPressedShot 
    LDA.W $0C18,X 
    PHA 
    AND.W #$003F 
    TAY 
    LDA.W BeamAutoFireCooldowns,Y : AND.W #$00FF : STA.W $0CCC 
    PLA 
    BIT.W #$0001 
    BNE .waveBeam 
    BRA + 


.chargeEquippedOrPreviouslyPressedShot:
    LDA.W $0C18,X 
    PHA 
    AND.W #$003F 
    TAY 
    LDA.W ProjectileCooldowns_Uncharged,Y : AND.W #$00FF : STA.W $0CCC 
    PLA 
    BIT.W #$0001 
    BNE .waveBeam 

  + STZ.W $0BDC,X 
    STZ.W $0BF0,X 
    STX.W $0DDE 
    JSR.W InitialBeamBlockCollision_NoWaveBeam 
    LDX.W $0DDE 
    LDA.W $0C18,X 
    BIT.W #$0F00 
    BNE .return 
    BRA .merge 


.waveBeam:
    STZ.W $0BDC,X 
    STZ.W $0BF0,X 
    STX.W $0DDE 
    JSR.W InitialWaveBeamBlockCollision 

.merge:
    STX.B $14 
    LDA.W $0C18,X 
    AND.W #$000F 
    ASL A 
    TAY 
    LDA.W .pointers,Y : STA.W $0C68,X 
    JSL.L InitializeBeamVelocities 

.return:
    PLP 
    RTS 


.pointers:
    dw Beam_NoWaveBeam 
    dw ProjectilePreInstruction_Beam_UnchargedIceWave 
    dw Beam_NoWaveBeam 
    dw ProjectilePreInstruction_Beam_UnchargedIceWave 
    dw Beam_NoWaveBeam 
    dw ProjectilePreInstruction_Beam_WavePlasmaSpazer_ChargeIceWave 
    dw Beam_NoWaveBeam 
    dw ProjectilePreInstruction_Beam_WavePlasmaSpazer_ChargeIceWave 
    dw Beam_NoWaveBeam 
    dw ProjectilePreInstruction_Beam_WavePlasmaSpazer_ChargeIceWave 
    dw Beam_NoWaveBeam 
    dw ProjectilePreInstruction_Beam_WavePlasmaSpazer_ChargeIceWave 

FireChargeBeam:
    JSR.W Check_if_Samus_Can_Fire_Beam 
    BCS .fire 

.cannotFire:
    LDA.W $0DC2 
    CMP.W #$0010 
    BPL + 
    PLP 
    RTS 


  + STZ.W $0DC0 
    LDA.W #$0002 
    JSL.L QueueSound 
    PLP 
    RTS 


.fire:
    LDX.W #$0000 

.loop:
    LDA.W $0C2C,X 
    BEQ .zeroDamage 
    INX #2
    CPX.W #$000A 
    BMI .loop 
    DEX #2
    .zeroDamage:
    STX.B $14 
    JSR.W InitializeProjectilePositionDirection 
    BCS .cannotFire 
    LDA.W #$000A : STA.W $18AC 
    LDX.B $14 
    LDA.W #$0004 : STA.W $0C90,X 
    LDA.W $09A6 
    AND.W #$100F 
    ORA.W #$8010 
    STA.W $0C18,X 
    AND.W #$000F 
    ASL A 
    TAY 
    LDA.W ProjectileSFX_Charged,Y 
    JSL.L QueueSound 
    STZ.W $0DC0 
    JSL.L InitializeProjectile 
    LDA.W $0C18,X 
    PHA 
    AND.W #$003F 
    TAY 
    LDA.W ProjectileCooldowns_Uncharged,Y : AND.W #$00FF : STA.W $0CCC 
    PLA 
    BIT.W #$0001 
    BNE .waveBeam 
    STZ.W $0BDC,X 
    STZ.W $0BF0,X 
    STX.W $0DDE 
    JSR.W InitialBeamBlockCollision_NoWaveBeam 
    LDX.W $0DDE 
    LDA.W $0C18,X 
    BIT.W #$0F00 
    BNE .return 
    BRA + 


.waveBeam:
    STZ.W $0BDC,X 
    STZ.W $0BF0,X 
    STX.W $0DDE 
    JSR.W InitialWaveBeamBlockCollision 

  + STX.B $14 
    LDA.W $0C18,X 
    AND.W #$000F 
    ASL A 
    TAY 
    LDA.W SamusBeamPreInstructionPointers,Y : STA.W $0C68,X 
    JSL.L InitializeBeamVelocities 

.return:
    LDA.W #$0004 : STA.W $0B18 
    PLP 
    RTS 


SamusBeamPreInstructionPointers:
    dw Beam_NoWaveBeam 
    dw ProjectilePreInstruction_Beam_WavePlasmaSpazer_ChargeIceWave 
    dw Beam_NoWaveBeam 
    dw ProjectilePreInstruction_Beam_WavePlasmaSpazer_ChargeIceWave 
    dw Beam_NoWaveBeam 
    dw ProjectilePreInstruction_Beam_WavePlasmaSpazer_ChargeIceWave 
    dw Beam_NoWaveBeam 
    dw ProjectilePreInstruction_Beam_WavePlasmaSpazer_ChargeIceWave 
    dw Beam_NoWaveBeam 
    dw ProjectilePreInstruction_Beam_WavePlasmaSpazer_ChargeIceWave 
    dw Beam_NoWaveBeam 
    dw ProjectilePreInstruction_Beam_WavePlasmaSpazer_ChargeIceWave 

InitializeProjectilePositionDirection:
    LDA.W $0A1C 
    ASL #3
    TAX 
    LDY.B $14 
    LDA.W $0B5E 
    BEQ .zero 
    AND.W #$00FF 
    STZ.W $0B5E 
    BRA .initialize 


.zero:
    LDA.L PoseDefinitions_directionShotsFired,X 
    AND.W #$00FF 
    BIT.W #$00F0 
    BEQ .initialize 
    CMP.W #$0010 
    BEQ .unused 
    JMP.W .returnNoFire 


.initialize:
    STA.W $0C04,Y 
    LDA.L PoseDefinitions_YOffset,X : AND.W #$00FF : STA.B $16 
    LDA.W $0C04,Y 
    AND.W #$000F 
    ASL A 
    TAX 
    LDA.W $0A1C 
    CMP.W #$0075 
    BEQ .notMoonwalk 
    CMP.W #$0076 
    BEQ .notMoonwalk 
    LDA.W $0A1F 
    AND.W #$00FF 
    CMP.W #$0001 
    BEQ .notMoonwalk 
    LDA.W ProjectileOriginOffsetsByDirection_ProjectileX_Default,X : CLC : ADC.W $0AF6 : STA.W $0B64,Y 
    LDA.W ProjectileOriginOffsetsByDirection_ProjectileY_Default,X : CLC : ADC.W $0AFA : SEC : SBC.B $16 : STA.W $0B78,Y 
    CLC 
    RTS 


.notMoonwalk:
    LDA.W ProjectileOriginOffsetsByDirection_ProjX_Moonwalk_Running,X : CLC : ADC.W $0AF6 : STA.W $0B64,Y 
    LDA.W ProjectileOriginOffsetsByDirection_ProjY_Moonwalk_Running,X : CLC : ADC.W $0AFA : SEC : SBC.B $16 : STA.W $0B78,Y 
    CLC 
    RTS 


.unused:
    PHX 
    LDA.W $0A24 
    ASL #3
    TAX 
    LDA.L PoseDefinitions_directionShotsFired,X 
    BIT.W #$00F0 
    BNE + 
    AND.W #$00FF 
    PLX 
    JMP.W .initialize 


  + PLX 

.returnNoFire:
    DEC.W $0CCE 
    SEC 
    RTS 


HandleChargingBeamGraphicsAudio:
    PHP 
    REP #$30 
    LDA.W $0A76 
    BNE .gotoHyperBeam 
    LDA.W $0CD0 
    BEQ .returnUpper 
    BPL .chargeBeam 

.returnUpper:
    PLP 
    RTS 


.gotoHyperBeam:
    JMP.W .hyperBeam 


.chargeBeam:
    CMP.W #$0001 
    BNE .notOne 
    STZ.W $0CD6 
    STZ.W $0CD8 
    STZ.W $0CDA 
    LDA.W #$0003 : STA.W $0CDC 
    LDA.W #$0005 : STA.W $0CDE 
    LDA.W #$0004 : STA.W $0CE0 

.notOne:
    LDA.W $0CD0 
    CMP.W #$000F 
    BPL + 
    JMP.W .returnMiddle 


  + CMP.W #$0010 
    BNE .zeroIndex 
    LDA.W #$0008 
    JSL.L QueueSound_Lib1_Max9 

.zeroIndex:
    LDX.W #$0000 

.loopChargeBeam:
    SEP #$20 
    LDA.B #$90 : STA.B $02 
    REP #$20 
    LDA.W $0CDC,X 
    DEC A 
    STA.W $0CDC,X 
    BPL .chargeBeamAnimationUpdateEnd 
    LDA.W $0CD6,X 
    INC A 
    STA.W $0CD6,X 
    TAY 
    LDA.W FlareAnimationDelays_Pointers,X : STA.B $00 
    LDA.B [$00],Y 
    AND.W #$00FF 
    CMP.W #$00FF 
    BEQ .restart 
    CMP.W #$00FE 
    BEQ .goBack 
    BRA .merge 


.restart:
    LDA.W #$0000 : STA.W $0CD6,X 
    TAY 
    BRA .merge 


.goBack:
    INY 
    LDA.B [$00],Y : AND.W #$00FF : STA.B $12 
    LDA.W $0CD6,X : SEC : SBC.B $12 : STA.W $0CD6,X 
    TAY 

.merge:
    LDA.B [$00],Y : AND.W #$00FF : STA.W $0CDC,X 

.chargeBeamAnimationUpdateEnd:
    PHX 
    JSR.W DrawFlareAnimationComponent 
    PLX 
    LDA.W $0CD0 
    CMP.W #$001E 
    BMI .returnMiddle 
    INX #2
    CPX.W #$0006 
    BMI .loopChargeBeam 

.returnMiddle:
    PLP 
    RTS 


.hyperBeam:
    LDA.W $0CD0 
    BEQ .returnLower 
    LDX.W #$0004 

.loopHyperBeam:
    DEC.W $0CDC,X 
    BEQ .timerExpired 
    BPL .hyperBeamAnimationUpdateEnd 

.timerExpired:
    DEC.W $0CD6,X 
    BNE .nonZeroAnimationFrame 
    CPX.W #$0004 
    BNE .hyperBeamAnimationUpdateEnd 
    STZ.W $0CD0 
    BRA .hyperBeamAnimationUpdateEnd 


.nonZeroAnimationFrame:
    LDA.W #$0003 : STA.W $0CDC,X 

.hyperBeamAnimationUpdateEnd:
    PHX 
    JSR.W DrawFlareAnimationComponent 
    PLX 
    DEX #2
    BPL .loopHyperBeam 

.returnLower:
    PLP 
    RTS 


DrawFlareAnimationComponent:
    PHP 
    SEP #$20 
    LDA.B #$93 : STA.B $02 
    REP #$30 
    LDA.W $0CD6,X : AND.W #$00FF : STA.B $12 
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0004 
    BEQ .facingLeft 
    LDA.L FlareSpritemapTable_IndexOffsets_facingRight,X : CLC : ADC.B $12 : STA.B $16 
    BRA + 


.facingLeft:
    LDA.L FlareSpritemapTable_IndexOffsets_facingLeft,X : CLC : ADC.B $12 : STA.B $16 

  + LDA.W $0A1C 
    ASL #3
    TAX 
    LDA.L PoseDefinitions_YOffset,X : AND.W #$00FF : STA.B $18 
    LDA.L PoseDefinitions_directionShotsFired,X 
    AND.W #$00FF 
    CMP.W #$00FF 
    BEQ .returnUpper 
    CMP.W #$0010 
    BEQ .returnUpper 
    CMP.W #$0010 
    BNE .continue 

.returnUpper:
    PLP 
    RTS 


.continue:
    AND.W #$000F 
    ASL A 
    TAX 
    LDA.W $093F 
    BPL .notRotating 
    LDA.W $0AF6 : STA.W $0D82 
    LDA.W $0AFA : STA.W $0D84 
    JSL.L Calculate_SamusPosition_InRotatingElevatorRoom 

.notRotating:
    LDA.W $0A1F 
    AND.W #$00FF 
    CMP.W #$0001 
    BEQ .running 
    LDA.W ProjectileOriginOffsetsByDirection_FlareX_Default,X : CLC : ADC.W $0AF6 : SEC : SBC.W $0911 : STA.B $14 
    LDA.W ProjectileOriginOffsetsByDirection_FlareY_Default,X : CLC : ADC.W $0AFA : SEC : SBC.B $18 : SBC.W $0915 : STA.B $12 
    BRA + 


.running:
    LDA.W ProjectileOriginOffsetsByDirection_FlareX_Running,X : CLC : ADC.W $0AF6 : SEC : SBC.W $0911 : STA.B $14 
    LDA.W ProjectileOriginOffsetsByDirection_FlareY_Running,X : CLC : ADC.W $0AFA : SEC : SBC.B $18 : SBC.W $0915 : STA.B $12 

  + AND.W #$FF00 
    BNE .greaterThanEqualTo100 
    LDA.B $16 
    JSL.L AddSpritemapFrom_93A1A1_TableToOAM 
    BRA + 


.greaterThanEqualTo100:
    LDA.B $16 
    JSL.L RTL_818AB7 

  + LDA.W $093F 
    BPL .returnLower 
    LDA.W $0D84 : STA.W $0AFA 
    LDA.W $0D82 : STA.W $0AF6 

.returnLower:
    PLP 
    RTS 


ClearFlareAnimationState:
    STZ.W $0CD6 
    STZ.W $0CD8 
    STZ.W $0CDA 
    STZ.W $0CDC 
    STZ.W $0CDE 
    STZ.W $0CE0 
    RTS 


FireHyperBeam:
    JSR.W Check_if_Samus_Can_Fire_Beam 
    BCS .canFire 
    PLP 
    RTS 


.canFire:
    LDX.W #$0000 

.loop:
    LDA.W $0C2C,X 
    BEQ .zeroDamage 
    INX #2
    CPX.W #$000A 
    BMI .loop 
    DEX #2
    .zeroDamage:
    STX.B $14 
    JSR.W InitializeProjectilePositionDirection 
    BCS .return 
    LDA.W #$000A : STA.W $18AC 
    LDX.B $14 
    PHX 
    LDA.W #$9018 ; Projectile type = live charged plasma beam | 1000h
    STA.W $0C18,X 
    AND.W #$000F 
    ASL A 
    TAX 
    LDA.W ProjectileSFX_Charged,X 
    JSL.L QueueSound 
    STZ.W $0DC0 
    PLX 
    JSL.L InitializeProjectile 
    STZ.W $0BDC,X 
    STZ.W $0BF0,X 
    STX.W $0DDE 
    JSR.W InitialWaveBeamBlockCollision 
    LDX.W $0DDE 
    LDA.L HyperBeamDamageValue : STA.W $0C2C,X 
    LDA.W #ProjectilePreInstruction_HyperBeam : STA.W $0C68,X 
    STX.B $14 
    JSL.L InitializeBeamVelocities 
    LDA.W #$0015 : STA.W $0CCC 
    LDA.W #$8014 ; Charged shot glow timer = 20
    STA.W $0B18 
    LDA.W #$001D : STA.W $0CD6 
    LDA.W #$0005 : STA.W $0CD8 
    STA.W $0CDA 
    LDA.W #$0003 : STA.W $0CDC 
    STA.W $0CDE 
    STA.W $0CE0 
    LDA.W #$8000 : STA.W $0CD0 

.return:
    PLP 
    RTS 


InitialBeamBlockCollision_NoWaveBeam:
    PHX 
    LDA.W $0C04,X 
    AND.W #$000F 
    ASL A 
    TAX 
    JSR.W (.pointers,X) 
    PLX 
    RTS 


.pointers:
    dw InitialBeamBlockCollision_NoWaveBeam_Vertical 
    dw InitialBeamBlockCollision_NoWaveBeam_Diagonal 
    dw InitialBeamBlockCollision_NoWaveBeam_Right 
    dw InitialBeamBlockCollision_NoWaveBeam_Diagonal 
    dw InitialBeamBlockCollision_NoWaveBeam_Vertical 
    dw InitialBeamBlockCollision_NoWaveBeam_Vertical 
    dw InitialBeamBlockCollision_NoWaveBeam_Diagonal 
    dw InitialBeamBlockCollision_NoWaveBeam_Left 
    dw InitialBeamBlockCollision_NoWaveBeam_Diagonal 
    dw InitialBeamBlockCollision_NoWaveBeam_Vertical 

InitialBeamBlockCollision_NoWaveBeam_Vertical:
    LDX.W $0DDE 
    JSL.L MoveBeamVertically_NoWaveBeam 
    RTS 


InitialBeamBlockCollision_NoWaveBeam_Diagonal:
    LDX.W $0DDE 
    JSL.L MoveBeamHorizontally_NoWaveBeam 
    BCS .return 
    JSL.L MoveBeamVertically_NoWaveBeam 

.return:
    RTS 


InitialBeamBlockCollision_NoWaveBeam_Right:
    LDX.W $0DDE 
    JSL.L MoveBeamHorizontally_NoWaveBeam 
    RTS 


InitialBeamBlockCollision_NoWaveBeam_Left:
    LDX.W $0DDE 
    LDA.W #$FFFF : STA.W $0BDC,X 
    JSL.L MoveBeamHorizontally_NoWaveBeam 
    RTS 


InitialWaveBeamBlockCollision:
    PHX 
    LDA.W $0C04,X 
    AND.W #$000F 
    ASL A 
    TAX 
    JSR.W (.pointers,X) 
    PLX 
    RTS 


.pointers:
    dw InitialWaveBeamBlockCollision_Vertical 
    dw InitialWaveBeamBlockCollision_Diagonal 
    dw InitialWaveBeamBlockCollision_Right 
    dw InitialWaveBeamBlockCollision_Diagonal 
    dw InitialWaveBeamBlockCollision_Vertical 
    dw InitialWaveBeamBlockCollision_Vertical 
    dw InitialWaveBeamBlockCollision_Diagonal 
    dw InitialWaveBeamBlockCollision_Left 
    dw InitialWaveBeamBlockCollision_Diagonal 
    dw InitialWaveBeamBlockCollision_Vertical 

InitialWaveBeamBlockCollision_Vertical:
    LDX.W $0DDE 
    JSL.L MoveBeamVertically_WaveBeam 
    RTS 


InitialWaveBeamBlockCollision_Diagonal:
    LDX.W $0DDE 
    JSL.L MoveBeamHorizontally_WaveBeam 
    BCS .return 
    JSL.L MoveBeamVertically_WaveBeam 

.return:
    RTS 


InitialWaveBeamBlockCollision_Right:
    LDX.W $0DDE 
    JSL.L MoveBeamHorizontally_WaveBeam 
    RTS 


InitialWaveBeamBlockCollision_Left:
    LDX.W $0DDE 
    LDA.W #$FFFF : STA.W $0BDC,X 
    JSL.L MoveBeamHorizontally_WaveBeam 
    RTS 


ProjectileReflection:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    PHX 
    LDX.B $14 
    LDA.W $0C18,X 
    BIT.W #$0100 
    BNE .missile 
    BIT.W #$0200 
    BNE .super 
    JSL.L InitializeBeamVelocities 
    JSL.L InitializeProjectile 
    LDA.W $0C18,X 
    AND.W #$000F 
    ASL A 
    TAY 
    LDA.W SamusBeamPreInstructionPointers,Y : STA.W $0C68,X 
    TXY 
    BRA .return 


.missile:
    JSL.L InitializeProjectile 
    LDA.W #ProjectilePreInstruction_Missile : STA.W $0C68,X 
    LDA.W #$00F0 : STA.W $0C7C,X 
    BRA .return 


.super:
    PHX 
    LDA.W $0C7C,X 
    AND.W #$00FF 
    TAX 
    JSL.L Clear_Projectile 
    PLX 
    JSL.L InitializeProjectile 
    LDA.W #ProjectilePreInstruction_SuperMissile : STA.W $0C68,X 
    LDA.W #$00F0 : STA.W $0C7C,X 

.return:
    PLX 
    PLB 
    PLP 
    RTL 


HUDSelectionHandler_Missiles_SuperMissiles:
    PHP 
    REP #$30 
    LDA.B $8F 
    BIT.W $09B2 
    BNE .checkIfCanFire 
    LDA.W $0E00 
    BIT.W $09B2 
    BNE .checkIfCanFire 
    PLP 
    RTS 


.checkIfCanFire:
    JSR.W Check_if_Samus_Can_Fire_Missile 
    BCS .fire 

.returnUpper:
    PLP 
    RTS 


.cannotFire:
    DEC.W $0CCE 
    PLP 
    RTS 


.fire:
    LDA.W $09D2 
    CMP.W #$0002 
    BEQ .selectedSupers 
    LDA.W $09C6 
    BEQ .cannotFire 
    BRA .zeroIndex 


.selectedSupers:
    LDA.W $09CA 
    BEQ .cannotFire 

.zeroIndex:
    LDX.W #$0000 

.loop:
    LDA.W $0C2C,X 
    BEQ + 
    INX #2
    CPX.W #$000A 
    BMI .loop 
    BRA .cannotFire 


  + STX.B $14 
    JSR.W InitializeProjectilePositionDirection 
    BCC + 
    JMP.W .returnUpper 


  + LDA.W #$0014 : STA.W $18AC 
    LDA.W $09D2 
    CMP.W #$0002 
    BEQ .decSuperCount 
    DEC.W $09C6 
    BRA + 


.decSuperCount:
    DEC.W $09CA 

  + LDX.B $14 
    LDA.W #$0004 : STA.W $0C90,X 
    LDA.W $09D2 
    PHA 
    XBA 
    STA.B $12 
    LDA.W $0C18,X 
    ORA.B $12 
    ORA.W #$8000 
    STA.W $0C18,X 
    PLA 
    AND.W #$000F 
    ASL A 
    TAX 
    LDA.W $1F51 
    BNE .init 
    LDA.W ProjectileSFX_NonBeamProjectiles,X 
    JSL.L QueueSound_Lib1_Max6 

.init:
    JSR.W InitializeMissileVelocities 
    JSL.L InitializeProjectile 
    LDA.W $0C18,X 
    PHA 
    BIT.W #$0200 
    BNE .superMissile 
    LDA.W #ProjectilePreInstruction_Missile : STA.W $0C68,X 
    BRA + 


.superMissile:
    LDA.W #ProjectilePreInstruction_SuperMissile : STA.W $0C68,X 

  + PLA 
    XBA 
    AND.W #$000F 
    TAY 
    LDA.W ProjectileCooldowns_NonBeamProjectiles,Y : AND.W #$00FF : STA.W $0CCC 
    LDA.W $0A04 
    BEQ + 
    STZ.W $09D2 
    STZ.W $0A04 
    BRA .returnLower 


  + LDA.W $09D2 
    CMP.W #$0002 
    BEQ .supersSelected 
    LDA.W $09C6 
    BNE .returnLower 
    BRA .clearHUDSelection 


.supersSelected:
    LDA.W $09CA 
    BNE .returnLower 

.clearHUDSelection:
    STZ.W $09D2 

.returnLower:
    PLP 
    RTS 


Spawn_SuperMissileLink:
    LDX.W #$0000 

.loop:
    LDA.W $0C2C,X 
    BEQ .zeroDamage 
    INX #2
    CPX.W #$000A 
    BMI .loop 
    BRA .return 


.zeroDamage:
    STX.B $14 
    TXY 
    LDA.W $0C18,Y : ORA.W #$8200 : STA.W $0C18,Y 
    LDX.W $0DDE 
    LDA.W $0B64,X : STA.W $0B64,Y 
    LDA.W $0B78,X : STA.W $0B78,Y 
    LDA.W $0C04,X : STA.W $0C04,Y 
    JSR.W InitializeProjectilePositionDirection 
    TYX 
    JSL.L InitializeSuperMissileLink 
    LDA.W #ProjectilePreInstruction_SuperMissileLink : STA.W $0C68,X 
    STX.B $12 
    LDX.W $0DDE 
    LDA.W $0C7C,X 
    AND.W #$FF00 
    CLC : ADC.B $12 : STA.W $0C7C,X 
    INC.W $0CCE 

.return:
    RTS 


BombTimerResetValue:
    dw $003C 

HUDSelectionHandler_MorphBall:
    PHP 
    REP #$30 
    LDA.B $8B 
    AND.W $09B2 
    BEQ .notPressingShot 
    LDA.W $09D2 
    CMP.W #$0003 
    BNE .bomb 
    JMP.W .powerBomb 


.notPressingShot:
    LDA.W $0CD0 
    BEQ .return 
    LDA.W #$0002 
    JSL.L QueueSound_Lib1_Max9 
    STZ.W $0CD0 
    JSR.W ClearFlareAnimationState 
    JSL.L LoadSamusSuitPalette 

.return:
    PLP 
    RTS 


.bomb:
    JSR.W FireBombOrBombSpread 
    BCC .returnBomb 
    LDX.W #$000A 

.loopBomb:
    LDA.W $0C18,X 
    BEQ .noProjectileType 
    INX #2
    CPX.W #$0014 
    BMI .loopBomb 
    DEX #2
    .noProjectileType:
    STX.B $14 
    LDA.W #$0500 : STA.W $0C18,X 
    PHA 
    LDA.W #$0000 : STA.W $0C04,X 
    LDA.W $0AF6 : STA.W $0B64,X 
    LDA.W $0AFA : STA.W $0B78,X 
    LDA.W BombTimerResetValue : STA.W $0C7C,X 
    JSL.L InitializeBomb 
    LDA.W #ProjectilePreInstruction_Bomb : STA.W $0C68,X 
    PLA 
    XBA 
    AND.W #$000F 
    TAY 
    LDA.W ProjectileCooldowns_NonBeamProjectiles,Y : AND.W #$00FF : STA.W $0CCC 

.returnBomb:
    PLP 
    RTS 


.powerBomb:
    LDA.W $0CEE 
    BPL .inactive 

.returnPowerBomb:
    PLP 
    RTS 


.inactive:
    JSR.W FireBomb 
    BCC .returnPowerBomb 
    LDA.W $09CE 
    BEQ .returnFinal 
    DEC A 
    STA.W $09CE 
    BMI .returnFinal 
    LDA.W #$FFFF : STA.W $0CEE 
    LDX.W #$000A 

.loopPowerBomb:
    LDA.W $0C18,X 
    BEQ + 
    INX #2
    CPX.W #$0014 
    BMI .loopPowerBomb 
    DEX #2
    + STX.B $14 
    LDA.W $09D2 
    XBA 
    STA.B $12 
    LDA.W $0C18,X : ORA.B $12 : STA.W $0C18,X 
    PHA 
    LDA.W #$0000 : STA.W $0C04,X 
    LDA.W $0AF6 : STA.W $0B64,X 
    LDA.W $0AFA : STA.W $0B78,X 
    LDA.W BombTimerResetValue : STA.W $0C7C,X 
    JSL.L InitializeBomb 
    LDA.W #ProjectilePreInstruction_PowerBomb : STA.W $0C68,X 
    PLA 
    XBA 
    AND.W #$000F 
    TAY 
    LDA.W ProjectileCooldowns_NonBeamProjectiles,Y : AND.W #$00FF : STA.W $0CCC 
    LDA.W $0A04 
    BEQ + 
    STZ.W $09D2 
    STZ.W $0A04 
    BRA .returnFinal 


  + LDA.W $09D2 
    CMP.W #$0003 
    BNE .returnFinal 
    LDA.W $09CE 
    BNE .returnFinal 
    STZ.W $09D2 

.returnFinal:
    PLP 
    RTS 


FireBombOrBombSpread:
    LDA.W $09A2 
    BIT.W #$1000 
    BEQ .return 
    LDA.W $0CD0 
    CMP.W #$003C 
    BMI FireBomb 
    LDA.W $0CD2 
    BNE FireBomb 
    LDA.B $8B 
    BIT.W #$0400 
    BEQ .bombSpread 
    LDA.W $0CD4 
    AND.W #$00C0 
    CMP.W #$00C0 
    BPL .bombSpread 
    INC.W $0CD4 
    BRA .return 


.bombSpread:
    JSR.W BombSpread 
    JSL.L LoadSamusSuitPalette 
    LDA.W #$0002 
    JSL.L QueueSound_Lib1_Max9 

.return:
    CLC 
    RTS 


FireBomb:
    LDA.B $8F 
    BIT.W $09B2 
    BEQ .noFire 
    LDA.W $0CD2 
    BEQ + 
    CMP.W #$0005 
    BPL .noFire 
    LDA.W $0CCC 
    AND.W #$00FF 
    BNE .noFire 

  + LDA.W $0CCC 
    INC A 
    STA.W $0CCC 
    LDA.W $0CD2 
    INC A 
    STA.W $0CD2 
    SEC 
    RTS 


.noFire:
    LDA.W $0CD0 
    BEQ .returnCarryClear 
    LDA.W #$0002 
    JSL.L QueueSound_Lib1_Max9 
    STZ.W $0CD0 
    JSR.W ClearFlareAnimationState 
    JSL.L LoadSamusSuitPalette 

.returnCarryClear:
    CLC 
    RTS 


HandleBomb:
    PHP 
    REP #$30 
    LDX.W $0DDE 
    LDA.W $0C7C,X 
    BEQ .return 
    DEC A 
    STA.W $0C7C,X 
    BEQ .explosion 
    CMP.W #$000F 
    BNE .return 
    LDA.W $0C40,X : CLC : ADC.W #$001C : STA.W $0C40,X 
    BRA .return 


.explosion:
    LDA.W #$0008 
    JSL.L QueueSound_Lib2_Max6 
    JSL.L Initialize_Bomb_Explosion 

.return:
    PLP 
    RTS 


HandlePowerBomb:
    PHP 
    REP #$30 
    LDX.W $0DDE 
    LDA.W $0C7C,X 
    BEQ .zero 
    DEC A 
    STA.W $0C7C,X 
    BEQ .explosion 
    CMP.W #$000F 
    BNE .return 
    LDA.W $0C40,X : CLC : ADC.W #$001C : STA.W $0C40,X 
    BRA .return 


.explosion:
    LDA.W $0B64,X : STA.W $0CE2 
    LDA.W $0B78,X : STA.W $0CE4 
    PHX 
    PHY 
    PHP 
    PHB 
    JSL.L Enable_HDMAObjects 
    JSL.L Spawn_PowerBombExplosion 
    PLB 
    PLP 
    PLY 
    PLX 
    LDA.W #$FFFF : STA.W $0C7C,X 
    BRA .return 


.zero:
    LDA.W $0CEE 
    BNE .return 
    JSL.L Clear_Projectile 

.return:
    PLP 
    RTS 


ProjectileOriginOffsetsByDirection_FlareX_Default:
    dw $0002,$0012,$000F,$0011,$0003,$FFFC,$FFEF,$FFF1 
    dw $FFEE,$FFFE,$FFFC,$FFFC,$FFFC 

ProjectileOriginOffsetsByDirection_FlareY_Default:
    dw $FFE4,$FFED,$0001,$0006,$0011,$0011,$0006,$0001 
    dw $FFEC,$FFE4,$FFEC,$FFFE,$0008 

ProjectileOriginOffsetsByDirection_FlareX_Running:
    dw $0002,$0013,$0014,$0012,$0003,$FFFC,$FFEE,$FFEC 
    dw $FFED,$FFFE 

ProjectileOriginOffsetsByDirection_FlareY_Running:
    dw $FFE0,$FFEA,$FFFD,$0006,$0019,$0019,$0006,$FFFD 
    dw $FFEC,$FFE0 

ProjectileOriginOffsetsByDirection_ProjectileX_Default:
    dw $0002,$000D,$000B,$000D,$0002,$FFFB,$FFF2,$FFF5 
    dw $FFED,$FFFE 

ProjectileOriginOffsetsByDirection_ProjectileY_Default:
    dw $FFF8,$FFF3,$0001,$0004,$000D,$000D,$0004,$0001 
    dw $FFED,$FFF8 

ProjectileOriginOffsetsByDirection_ProjX_Moonwalk_Running:
    dw $0002,$000F,$000F,$000D,$0002,$FFFB,$FFF3,$FFF3 
    dw $FFF1,$FFFE 

ProjectileOriginOffsetsByDirection_ProjY_Moonwalk_Running:
    dw $FFF8,$FFF0,$FFFE,$0001,$000D,$000D,$0001,$FFFE 
    dw $FFF0,$FFF8 

ProjectileCooldowns_Uncharged:
    db $0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0F,$0C,$0F,$00,$00,$00,$00 

ProjectileCooldowns_Charged:
    db $1E,$1E,$1E,$1E,$1E,$1E,$1E,$1E,$1E,$1E,$1E,$1E,$00,$00,$00,$00 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Padding_90C274:
    db $00,$00,$00,$00,$00,$00 
endif ; !FEATURE_KEEP_UNREFERENCED

ProjectileCooldowns_NonBeamProjectiles:
    db $00,$0A,$14,$28,$00,$10,$00,$00,$00 

BeamAutoFireCooldowns:
    db $19,$19,$19,$19,$19,$19,$19,$19,$19,$19,$19,$19 

ProjectileSFX_Uncharged:
    dw $000B,$000D,$000C,$000E,$000F,$0012,$0010,$0011 
    dw $0013,$0016,$0014,$0015 

ProjectileSFX_Charged:
    dw $0017,$0019,$0018,$001A,$001B,$001E,$001C,$001D 
    dw $001F,$0022,$0020,$0021 

ProjectileSFX_NonBeamProjectiles:
    dw $0000,$0003,$0004,$0000,$0000,$0000,$0000,$0000 
    dw $0000 

BeamSpeeds_Horizontal_Vertical:
    dw $0400 

BeamSpeeds_Diagonal:
    dw $02AB,$0400,$02AB,$0400,$02AB,$0400,$02AB,$0400 
    dw $02AB,$0400,$02AB,$0400,$02AB,$0400,$02AB,$0400 
    dw $02AB,$0400,$02AB,$0400,$02AB,$0400,$02AB 

MissileInitializedBitset:
    dw $0100 

MissileAccelerations:
    dw $0000,$FFC0,$0036,$FFCA,$0040,$0000,$0036,$0036 
    dw $0000,$0040,$0000,$0040,$FFCA,$0036,$FFC0,$0000 
    dw $FFCA,$FFCA,$0000,$FFC0 

SuperMissileAccelerations:
    dw $0000,$FF00,$00B6,$FF4A,$0100,$0000,$00B6,$00B6 
    dw $0000,$0100,$0000,$0100,$FF4A,$00B6,$FF00,$0000 
    dw $FF4A,$FF4A,$0000,$FF00 

ProjectileAccelerations_X:
    dw $0000,$0010,$0010,$0010,$0000,$0000,$FFF0,$FFF0 
    dw $FFF0,$0000 

ProjectileAccelerations_Y:
    dw $FFF0,$FFF0,$0000,$0010,$0010,$0010,$0010,$0000 
    dw $FFF0,$FFF0 

ProtoWeaponConstants_Beams:
    db $03,$14,$00,$0A,$28,$01,$05,$1E,$00,$0A,$28,$01,$14,$50,$00,$14 
    db $50,$01,$14,$50,$00,$14,$50,$01,$1E,$64,$00,$1E,$64,$01,$1E,$64 
    db $00,$1E,$64,$01 

ProtoWeaponConstants_NonBeams:
    db $00,$00,$0A,$00,$32,$00,$32,$03,$00,$FF,$0A,$02,$00,$FF,$00,$FF 
    db $00,$FF 

BeamTilesPointers:
    dw Tiles_PowerBeam 
    dw Tiles_WaveBeam 
    dw Tiles_IceBeam 
    dw Tiles_WaveBeam 
    dw Tiles_Spazer 
    dw Tiles_Spazer 
    dw Tiles_Spazer 
    dw Tiles_Spazer 
    dw Tiles_PlasmaBeam 
    dw Tiles_PlasmaBeam 
    dw Tiles_PlasmaBeam 
    dw Tiles_PlasmaBeam 

BeamPalettePointers:
    dw BeamPalettes_Power 
    dw BeamPalettes_Wave 
    dw BeamPalettes_Ice 
    dw BeamPalettes_Ice 
    dw BeamPalettes_Spazer 
    dw BeamPalettes_Wave 
    dw BeamPalettes_Ice 
    dw BeamPalettes_Ice 
    dw BeamPalettes_Plasma 
    dw BeamPalettes_Plasma 
    dw BeamPalettes_Ice 
    dw BeamPalettes_Ice 

BeamPalettes_Power:
    dw $3800,$7FFF,$19FF,$1D55,$10AD,$53FF,$039E,$295F 
    dw $18DF,$0000,$0000,$0000,$0000,$0000,$0000,$104A 

BeamPalettes_Ice:
    dw $3800,$7FFF,$7EC0,$6DE0,$54E0,$7F6E,$730A,$6665 
    dw $5E22,$7FA0,$7B60,$7720,$72A0,$6E60,$7F91,$20C0 

BeamPalettes_Wave:
    dw $3800,$7FFF,$7C1F,$5816,$300C,$7EDF,$7DDF,$7CDF 
    dw $681A,$0000,$0000,$0000,$0000,$0000,$0000,$2409 

BeamPalettes_Plasma:
    dw $3800,$7FFF,$3BE0,$2680,$1580,$6BFA,$4BF2,$2BEA 
    dw $03E0,$0000,$0000,$0000,$0000,$0000,$0000,$0920 

BeamPalettes_Spazer:
    dw $3800,$7FFF,$03FF,$0216,$00EE,$6BFF,$4BFF,$2BFF 
    dw $037B,$0000,$0000,$0000,$0000,$0000,$0000,$00AD 

FlareAnimationDelays_Pointers:
    dw FlareAnimationDelays_MainFlare 
    dw FlareAnimationDelays_FlareSlowSparks 
    dw FlareAnimationDelays_FlareFastSparks 

FlareAnimationDelays_MainFlare:
    db $03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03 
    db $03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$03,$FE,$0E 

FlareAnimationDelays_FlareSlowSparks:
    db $05,$04,$03,$03,$03,$03,$FF 

FlareAnimationDelays_FlareFastSparks:
    db $04,$03,$02,$02,$02,$02,$FF 

HandleSwitchingHUDSelection:
    PHP 
    REP #$30 
    LDA.W $09D2 : STA.B $12 
    LDA.B $8F 
    BIT.W $09B8 
    BEQ .notItemCancel 
    STZ.W $0A04 
    BRA .itemCancel 


.notItemCancel:
    LDA.B $8B 
    BIT.W $09B8 
    BNE + 
    STZ.B $16 
    BRA .checkItemSelect 


  + LDA.W #$0001 : STA.B $16 

.checkItemSelect:
    LDA.B $8F 
    BIT.W $09BA 
    BEQ .itemSelectEnd 
    LDA.W $09D2 
    INC A 
    CMP.W #$0006 
    BMI .itemCancelEnd 

.itemCancel:
    LDA.W #$0000 

.itemCancelEnd:
    STA.W $09D2 

.loop:
    ASL A 
    TAX 
    JSR.W (.pointers,X) 
    BCC .checkHoldingItemCancel 
    LDA.W $09D2 
    INC A 
    STA.W $09D2 
    CMP.W #$0006 
    BMI .loop 
    LDA.W #$0000 : STA.W $09D2 
    BRA .loop 


.checkHoldingItemCancel:
    LDA.B $16 
    BEQ .resetAutoCancel 
    LDA.W $09D2 : STA.W $0A04 
    BRA .itemSelectEnd 


.resetAutoCancel:
    STZ.W $0A04 

.itemSelectEnd:
    LDA.W $09D2 
    CMP.B $12 
    BNE .itemChanged 
    LDA.W $0AAA 
    INC A 
    CMP.W #$0003 
    BMI .toggleArmCannon 
    LDA.W #$0002 

.toggleArmCannon:
    STA.W $0AAA 
    BRA .return 


.itemChanged:
    LDA.W #$0001 : STA.W $0AAA 

.return:
    PLP 
    RTS 


.pointers:
    dw SwitchedToHUDItemHandler_Nothing 
    dw SwitchedToHUDItemHandler_Missiles 
    dw SwitchedToHUDItemHandler_SuperMissiles 
    dw SwitchedToHUDItemHandler_PowerBombs 
    dw SwitchedToHUDItemHandler_GrappleBeam 
    dw SwitchedToHUDItemHandler_XrayScope 

SwitchedToHUDItemHandler_Nothing:
    STZ.W $0CD0 
    JSR.W ClearFlareAnimationState 
    JSL.L LoadSamusSuitPalette 
    CLC 
    RTS 


SwitchedToHUDItemHandler_Missiles:
    LDA.W $09C6 
    BNE .hasMissiles 
    SEC 
    RTS 


.hasMissiles:
    STZ.W $0CD0 
    JSR.W ClearFlareAnimationState 
    JSL.L LoadSamusSuitPalette 
    CLC 
    RTS 


SwitchedToHUDItemHandler_SuperMissiles:
    LDA.W $09CA 
    BNE .hasSupers 
    SEC 
    RTS 


.hasSupers:
    STZ.W $0CD0 
    JSR.W ClearFlareAnimationState 
    JSL.L LoadSamusSuitPalette 
    CLC 
    RTS 


SwitchedToHUDItemHandler_PowerBombs:
    LDA.W $09CE 
    BNE .hasPowerBombs 
    SEC 
    RTS 


.hasPowerBombs:
    STZ.W $0CD0 
    JSR.W ClearFlareAnimationState 
    JSL.L LoadSamusSuitPalette 
    CLC 
    RTS 


SwitchedToHUDItemHandler_GrappleBeam:
    LDA.W $09A2 
    BIT.W #$4000 
    BNE .hasGrappleBeam 
    SEC 
    RTS 


.hasGrappleBeam:
    LDA.W $0D32 
    CMP.W #GrappleBeamFunction_Inactive 
    BNE .returnCarryClear 
    JSL.L LoadSamusSuitPalette 
    STZ.W $0CD0 
    JSR.W ClearFlareAnimationState 
    LDA.W #GrappleBeamFunction_Inactive : STA.W $0D32 

.returnCarryClear:
    CLC 
    RTS 


SwitchedToHUDItemHandler_XrayScope:
    LDA.W $09A2 
    BIT.W #$8000 
    BNE .hasXrayScope 
    SEC 
    RTS 


.hasXrayScope:
    STZ.W $0CD0 
    JSR.W ClearFlareAnimationState 
    JSL.L LoadSamusSuitPalette 
    CLC 
    RTS 


HandleArmCannonOpenState:
    PHP 
    REP #$30 
    LDA.W $0AA7 
    AND.W #$00FF 
    BNE .advanceArmCannonFrame 
    JSR.W UpdateArmCannonIsOpenState 
    BCC .noChange 

.advanceArmCannonFrame:
    JSR.W AdvanceArmCannonFrame 

.noChange:
    LDA.W $0A1C 
    ASL A 
    TAX 
    LDA.W ArmCannonDrawingData,X 
    TAY 
    LDA.W $0001,Y : AND.W #$00FF : STA.W $0AAC 
    PLP 
    RTS 


UpdateArmCannonIsOpenState:
    LDA.W $0AAA 
    CMP.W #$0002 
    BMI .returnCarryClear 
    LDA.W $09D2 
    TAX 
    LDA.W ArmCannonOpenFlags,X : AND.W #$00FF : STA.B $12 
    LDA.W $0AA6 
    AND.W #$00FF 
    CMP.B $12 
    BEQ .returnCarryClear 
    LDA.B $12 
    BEQ .closed 
    LDA.W #$0000 : STA.W $0AA8 
    BRA .toggleArmCannon 


.closed:
    LDA.W #$0004 : STA.W $0AA8 

.toggleArmCannon:
    LDA.B $12 : ORA.W #$0100 : STA.W $0AA6 
    SEC 
    RTS 


.returnCarryClear:
    CLC 
    RTS 


AdvanceArmCannonFrame:
    PHP 
    REP #$30 
    LDA.W $0AA6 
    AND.W #$00FF 
    BNE .open 
    LDA.W $0AA8 
    DEC A 
    BEQ .fullyClosed 
    BMI .fullyClosed 
    STA.W $0AA8 
    BRA .return 


.open:
    LDA.W $0AA8 
    INC A 
    CMP.W #$0003 
    BPL .fullyOpen 
    STA.W $0AA8 
    BRA .return 


.fullyClosed:
    STZ.W $0AA8 
    BRA .fullyTransitioned 


.fullyOpen:
    LDA.W #$0003 : STA.W $0AA8 

.fullyTransitioned:
    LDA.W $0AA6 : AND.W #$00FF : STA.W $0AA6 

.return:
    PLP 
    RTS 


DrawArmCannon:
    PHP 
    REP #$30 
    LDA.W $0AA8 
    BEQ .return 
    LDA.W $18A8 
    BEQ .draw 
    LDA.W $05B6 
    AND.W #$0001 
    BEQ .draw 

.return:
    PLP 
    RTS 


.draw:
    LDA.W $0A1C 
    ASL A 
    TAX 
    LDA.W ArmCannonDrawingData,X 
    TAY 
    LDA.W $0000,Y 
    AND.W #$00FF 
    BIT.W #$0080 
    BEQ .spritePositive 
    LDA.W $0A96 
    BNE + 
    LDA.W $0000,Y 
    AND.W #$007F 
    ASL A 
    TAX 
    TYA 
    CLC : ADC.W #$0004 : STA.B $16 
    BRA .merge 


  + LDA.W $0002,Y 
    AND.W #$007F 
    ASL A 
    TAX 
    TYA 
    CLC : ADC.W #$0004 : STA.B $16 
    BRA .merge 


.spritePositive:
    ASL A 
    TAX 
    TYA 
    INC #2
    STA.B $16 

.merge:
    LDA.W .spriteValues,X : STA.B $18 
    LDA.W $0A96 
    ASL A 
    CLC : ADC.B $16 : TAY 
    LDA.W $0000,Y 
    AND.W #$00FF 
    BIT.W #$0080 
    BEQ + 
    ORA.W #$FF00 

  + STA.B $12 
    LDA.W $0001,Y 
    AND.W #$00FF 
    BIT.W #$0080 
    BEQ + 
    ORA.W #$FF00 

  + STA.B $14 
    LDA.W $0A1C 
    ASL #3
    TAX 
    LDA.L PoseDefinitions_YOffset,X : AND.W #$00FF : STA.B $16 
    LDX.W $0590 
    LDA.W $0AF6 : CLC : ADC.B $12 : SEC : SBC.W $0911 : BMI + 
    CMP.W #$0100 
    BPL + 
    STA.W $0370,X 
    LDA.W $0AFA : CLC : ADC.B $14 : SEC : SBC.B $16 : SBC.W $0915 : BMI + 
    CMP.W #$0100 
    BPL + 
    STA.W $0371,X 
    LDA.B $18 : STA.W $0372,X 
    TXA 
    CLC : ADC.W #$0004 : STA.W $0590 

  + LDA.W $0A1C 
    ASL A 
    TAX 
    LDA.W ArmCannonDrawingData,X 
    TAY 
    LDA.W $0000,Y 
    AND.W #$00FF 
    BIT.W #$0080 
    BEQ .tilesPositive 
    LDA.W $0A96 
    BNE .nonZeroAnimFrame 
    LDA.W $0000,Y 
    AND.W #$007F 
    BRA .tilesPositive 


.nonZeroAnimFrame:
    INY #2
    LDA.W $0000,Y 
    AND.W #$007F 

.tilesPositive:
    ASL A 
    TAX 
    LDA.W .pointers,X : STA.B $16 
    LDA.W $0AA8 
    ASL A 
    CLC : ADC.B $16 : TAY 
    LDX.W $0330 
    LDA.W #$0020 : STA.B $D0,X 
    INX #2
    LDA.W $0000,Y : STA.B $D0,X 
    INX #2
    SEP #$20 
    LDA.B #$9A : STA.B $D0,X 
    REP #$20 
    INX 
    LDA.W #$61F0 : STA.B $D0,X 
    INX #2
    STX.W $0330 
    PLP 
    RTS 


.spriteValues:
    dw $281F,$281F,$281F,$681F,$A81F,$E81F,$281F,$681F 
    dw $681F,$681F 

.pointers:
    dw .armCannonTiles_0 
    dw .armCannonTiles_3 
    dw .armCannonTiles_1 
    dw .armCannonTiles_2 
    dw .armCannonTiles_0 
    dw .armCannonTiles_0 
    dw .armCannonTiles_2 
    dw .armCannonTiles_1 
    dw .armCannonTiles_3 
    dw .armCannonTiles_0 

.armCannonTiles_0:
    dw $0000 
    dw Tiles_NonClosed_ArmCannon_Vertical_0 
    dw Tiles_NonClosed_ArmCannon_Vertical_1 
    dw Tiles_NonClosed_ArmCannon_Vertical_2 

.armCannonTiles_1:
    dw $0000 
    dw Tiles_NonClosed_ArmCannon_Horizontal_0 
    dw Tiles_NonClosed_ArmCannon_Horizontal_1 
    dw Tiles_NonClosed_ArmCannon_Horizontal_2 

.armCannonTiles_2:
    dw $0000 
    dw Tiles_NonClosed_ArmCannon_DownwardsDiagonal_0 
    dw Tiles_NonClosed_ArmCannon_DownwardsDiagonal_1 
    dw Tiles_NonClosed_ArmCannon_DownwardsDiagonal_2 

.armCannonTiles_3:
    dw $0000 
    dw Tiles_NonClosed_ArmCannon_UpwardsDiagonal_0 
    dw Tiles_NonClosed_ArmCannon_UpwardsDiagonal_1 
    dw Tiles_NonClosed_ArmCannon_UpwardsDiagonal_2 

ArmCannonOpenFlags:
    db $00,$01,$01,$00,$01,$00 

ArmCannonDrawingData:
    dw ArmCannonDrawingData_FacingForward 
    dw ArmCannonDrawingData_FacingRight 
    dw ArmCannonDrawingData_FacingLeft 
    dw ArmCannonDrawingData_FacingRight_AimingUp 
    dw ArmCannonDrawingData_FacingLeft_AimingUp 
    dw ArmCannonDrawingData_FacingRight_AimingUpRight 
    dw ArmCannonDrawingData_FacingLeft_AimingUpLeft 
    dw ArmCannonDrawingData_FacingRight_AimingDownRight 
    dw ArmCannonDrawingData_FacingLeft_AimingDownLeft 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_MovingRight_GunExtended 
    dw ArmCannonDrawingData_MovingLeft_GunExtended 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_MovingRight_AimingUpRight 
    dw ArmCannonDrawingData_MovingLeft_AimingUpLeft 
    dw ArmCannonDrawingData_MovingRight_AimingDownRight 
    dw ArmCannonDrawingData_MovingLeft_AimingDownLeft 
    dw ArmCannonDrawingData_FacingRight_NormalJump_NotMoving_GunExt 
    dw ArmCannonDrawingData_FacingLeft_NormalJump_NotMoving_GunExt 
    dw ArmCannonDrawingData_FacingRight_NormalJump_AimingUp 
    dw ArmCannonDrawingData_FacingLeft_NormalJump_AimingUp 
    dw ArmCannonDrawingData_FacingRight_NormalJump_AimingDown 
    dw ArmCannonDrawingData_FacingLeft_NormalJump_AimingDown 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_FacingRight_Crouching 
    dw ArmCannonDrawingData_FacingLeft_Crouching 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_FacingRight_Falling_AimingUp 
    dw ArmCannonDrawingData_FacingLeft_Falling_AimingUp 
    dw ArmCannonDrawingData_FacingRight_Falling_AimingDown 
    dw ArmCannonDrawingData_FacingLeft_Falling_AimingDown 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_FacingRight 
    dw ArmCannonDrawingData_FacingLeft 
    dw ArmCannonDrawingData_FacingLeft_Moonwalk 
    dw ArmCannonDrawingData_FacingRight_Moonwalk 
    dw ArmCannonDrawingData_FacingRight_NormalJumpTransition 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_FacingRight_NormalJump_MovingForward 
    dw ArmCannonDrawingData_FacingLeft_NormalJump_MovingForward 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_FacingRight_Transition_AimingUp 
    dw ArmCannonDrawingData_FacingLeft_Transition_AimingUp 
    dw ArmCannonDrawingData_FacingRight_AimingUpRight 
    dw ArmCannonDrawingData_FacingLeft_AimingUpLeft 
    dw ArmCannonDrawingData_FacingRight_AimingDownRight 
    dw ArmCannonDrawingData_FacingLeft_AimingDownLeft 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_FacingRight_Falling_GunExtended 
    dw ArmCannonDrawingData_FacingLeft_Falling_GunExtended 
    dw ArmCannonDrawingData_FacingRight_NormalJump_AimingUpRight 
    dw ArmCannonDrawingData_FacingLeft_NormalJump_AimingUpLeft 
    dw ArmCannonDrawingData_FacingRight_NormalJump_AimingDownRight 
    dw ArmCannonDrawingData_FacingLeft_NormalJump_AimingDownLeft 
    dw ArmCannonDrawingData_FacingRight_Falling_AimingUpRight 
    dw ArmCannonDrawingData_FacingLeft_Falling_AimingUpLeft 
    dw ArmCannonDrawingData_FacingRight_Falling_AimingDownRight 
    dw ArmCannonDrawingData_FacingLeft_Falling_AimingDownLeft 
    dw ArmCannonDrawingData_FacingRight_Crouching_AimingUpRight 
    dw ArmCannonDrawingData_FacingLeft_Crouching_AimingUpLeft 
    dw ArmCannonDrawingData_FacingRight_Crouching_AimingDownRight 
    dw ArmCannonDrawingData_FacingLeft_Crouching_AimingDownLeft 
    dw ArmCannonDrawingData_FacingLeft_Moonwalk_AimingUpLeft 
    dw ArmCannonDrawingData_FacingRight_Moonwalk_AimingUpRight 
    dw ArmCannonDrawingData_FacingLeft_Moonwalk_AimingDownLeft 
    dw ArmCannonDrawingData_FacingRight_Moonwalk_AimingDownRight 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_FacingRight_Crouching_AimingUp 
    dw ArmCannonDrawingData_FacingLeft_Crouching_AimingUp 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_FacingRight 
    dw ArmCannonDrawingData_FacingLeft 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_FacingForward 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_FacingRight_LandingFromNormalJump 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_FacingRight_LandingFromSpinJump 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_FacingRight 
    dw ArmCannonDrawingData_FacingLeft 
    dw ArmCannonDrawingData_FacingRight_AimingDownRight 
    dw ArmCannonDrawingData_FacingLeft_AimingDownLeft 
    dw ArmCannonDrawingData_FacingRight_NormalJump_NotMoving_GunExt 
    dw ArmCannonDrawingData_FacingLeft_NormalJump_NotMoving_GunExt 
    dw ArmCannonDrawingData_FacingRight_NormalJump_AimingDown 
    dw ArmCannonDrawingData_FacingLeft_NormalJump_AimingDown 
    dw ArmCannonDrawingData_FacingRight_NormalJump_AimingDownRight 
    dw ArmCannonDrawingData_FacingLeft_NormalJump_AimingDownLeft 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_FacingRight_Crouching 
    dw ArmCannonDrawingData_FacingLeft_Crouching 
    dw ArmCannonDrawingData_FacingRight_Crouching_AimingDownRight 
    dw ArmCannonDrawingData_FacingLeft_Crouching_AimingDownLeft 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_FacingLeft_AimingUpLeft 
    dw ArmCannonDrawingData_FacingLeft 
    dw ArmCannonDrawingData_FacingLeft_AimingDownLeft 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_FacingRight_AimingUpRight 
    dw ArmCannonDrawingData_FacingLeft_AimingUpLeft 
    dw ArmCannonDrawingData_FacingRight_AimingDownRight 
    dw ArmCannonDrawingData_FacingLeft_AimingDownLeft 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_FacingRight_Transition_AimingUp 
    dw ArmCannonDrawingData_FacingLeft_Transition_AimingUp 
    dw ArmCannonDrawingData_FacingRight_AimingUpRight 
    dw ArmCannonDrawingData_FacingLeft_AimingUpLeft 
    dw ArmCannonDrawingData_FacingRight_AimingDownRight 
    dw ArmCannonDrawingData_FacingLeft_AimingDownLeft 
    dw ArmCannonDrawingData_FacingRight 
    dw ArmCannonDrawingData_FacingLeft 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_FacingRight_AimingUpRight 
    dw ArmCannonDrawingData_FacingRight 
    dw ArmCannonDrawingData_FacingRight_AimingDownRight 
    dw ArmCannonDrawingData_Default 
    dw ArmCannonDrawingData_FacingRight_Transition_AimingUp 
    dw ArmCannonDrawingData_FacingLeft_Transition_AimingUp 
    dw ArmCannonDrawingData_FacingRight_AimingUpRight 
    dw ArmCannonDrawingData_FacingLeft_AimingUpLeft 
    dw ArmCannonDrawingData_FacingRight_AimingDownRight 
    dw ArmCannonDrawingData_FacingLeft_AimingDownLeft 
    dw ArmCannonDrawingData_FacingRight_Transition_AimingUp 
    dw ArmCannonDrawingData_FacingLeft_Transition_AimingUp 
    dw ArmCannonDrawingData_FacingRight_AimingUpRight 
    dw ArmCannonDrawingData_FacingLeft_AimingUpLeft 
    dw ArmCannonDrawingData_FacingRight_AimingDownRight 
    dw ArmCannonDrawingData_FacingLeft_AimingDownLeft 

ArmCannonDrawingData_Default:
    db $00,$00 

ArmCannonDrawingData_FacingForward:
    db $00,$02 

ArmCannonDrawingData_FacingRight:
    db $02,$01,$0B,$FD,$0B,$FD,$0B,$FD,$0B,$FD,$0B,$FD,$0B,$FD,$0B,$FD 
    db $0B,$FD,$0B,$FD 

ArmCannonDrawingData_FacingLeft:
    db $07,$01,$ED,$FD,$ED,$FD,$ED,$FD,$ED,$FD,$ED,$FD,$ED,$FD,$ED,$FD 
    db $ED,$FD,$ED,$FD 

ArmCannonDrawingData_FacingRight_AimingUp:
    db $81,$01,$80,$01,$0E,$EA,$FE,$E1 

ArmCannonDrawingData_FacingLeft_AimingUp:
    db $88,$01,$89,$01,$EA,$E9,$FA,$E1 

ArmCannonDrawingData_FacingRight_AimingUpRight:
    db $01,$01,$0D,$EA 

ArmCannonDrawingData_FacingLeft_AimingUpLeft:
    db $08,$01,$EB,$E9 

ArmCannonDrawingData_FacingRight_AimingDownRight:
    db $03,$01,$0D,$02 

ArmCannonDrawingData_FacingLeft_AimingDownLeft:
    db $06,$01,$EB,$02 

ArmCannonDrawingData_MovingRight_GunExtended:
    db $02,$01,$11,$FA,$11,$FA,$11,$F9,$11,$F8,$11,$F9,$11,$FA,$11,$F9 
    db $11,$F9,$11,$F8,$11,$F9 

ArmCannonDrawingData_MovingLeft_GunExtended:
    db $07,$01,$E7,$FA,$E7,$FA,$E7,$F8,$E7,$F9,$E7,$F9,$E7,$FA,$E7,$F9 
    db $E7,$F8,$E7,$F9,$E7,$F9 

ArmCannonDrawingData_MovingRight_AimingUpRight:
    db $01,$01,$0C,$EA,$0C,$EA,$0C,$E9,$0C,$E8,$0C,$E9,$0C,$EA,$0C,$EA 
    db $0C,$E9,$0C,$E8,$0C,$E9 

ArmCannonDrawingData_MovingLeft_AimingUpLeft:
    db $08,$01,$EC,$EA,$EC,$EA,$EC,$E9,$EC,$E8,$EC,$E9,$EC,$EA,$EC,$EA 
    db $EC,$E9,$EC,$E8,$EC,$E9 

ArmCannonDrawingData_MovingRight_AimingDownRight:
    db $03,$01,$0B,$01,$0B,$01,$0B,$00,$0B,$FF,$0B,$00,$0B,$01,$0B,$01 
    db $0B,$00,$0B,$FF,$0B,$00 

ArmCannonDrawingData_MovingLeft_AimingDownLeft:
    db $06,$01,$ED,$01,$ED,$01,$ED,$00,$ED,$FF,$ED,$00,$ED,$01,$ED,$01 
    db $ED,$00,$ED,$FF,$ED,$00 

ArmCannonDrawingData_FacingRight_NormalJump_NotMoving_GunExt:
    db $02,$01,$0B,$FD,$0B,$FD 

ArmCannonDrawingData_FacingLeft_NormalJump_NotMoving_GunExt:
    db $07,$01,$ED,$FD,$ED,$FD 

ArmCannonDrawingData_FacingRight_NormalJump_AimingUp:
    db $81,$01,$80,$01,$0E,$E9,$FE,$E0 

ArmCannonDrawingData_FacingLeft_NormalJump_AimingUp:
    db $88,$01,$89,$01,$EA,$E8,$FA,$E0 

ArmCannonDrawingData_FacingRight_NormalJump_AimingDown:
    db $04,$01,$00,$0D,$00,$0D 

ArmCannonDrawingData_FacingLeft_NormalJump_AimingDown:
    db $05,$01,$F7,$0D,$F7,$0D 

ArmCannonDrawingData_FacingRight_NormalJumpTransition:
    db $03,$01,$FB,$00,$06,$02,$ED,$FE 

ArmCannonDrawingData_FacingRight_NormalJump_MovingForward:
    db $02,$01,$0B,$FD,$0B,$FD 

ArmCannonDrawingData_FacingLeft_NormalJump_MovingForward:
    db $07,$01,$ED,$FD,$ED,$FD 

ArmCannonDrawingData_FacingRight_NormalJump_AimingUpRight:
    db $01,$01,$0C,$EA,$0C,$EA 

ArmCannonDrawingData_FacingLeft_NormalJump_AimingUpLeft:
    db $08,$01,$EC,$EA,$EC,$EA 

ArmCannonDrawingData_FacingRight_NormalJump_AimingDownRight:
    db $03,$01,$0B,$01,$0B,$01 

ArmCannonDrawingData_FacingLeft_NormalJump_AimingDownLeft:
    db $06,$01,$ED,$01,$ED,$01 

ArmCannonDrawingData_FacingRight_Falling_GunExtended:
    db $02,$01,$0B,$FD,$0B,$FD,$0B,$FD,$0B,$FD,$0B,$FD,$0B,$FD,$0B,$FD 

ArmCannonDrawingData_FacingLeft_Falling_GunExtended:
    db $07,$01,$ED,$FD,$ED,$FD,$ED,$FD,$ED,$FD,$ED,$FD,$ED,$FD,$ED,$FD 

ArmCannonDrawingData_FacingRight_Falling_AimingUp:
    db $81,$01,$80,$01,$0E,$E9,$FE,$E0,$FE,$E0 

ArmCannonDrawingData_FacingLeft_Falling_AimingUp:
    db $88,$01,$89,$01,$EA,$E8,$FA,$E4,$FA,$E4 

ArmCannonDrawingData_FacingRight_Falling_AimingDown:
    db $04,$01,$00,$09,$00,$09 

ArmCannonDrawingData_FacingLeft_Falling_AimingDown:
    db $05,$01,$F7,$09,$F7,$09 

ArmCannonDrawingData_FacingRight_Falling_AimingUpRight:
    db $01,$01,$0C,$EA,$0C,$EA,$0C,$EA 

ArmCannonDrawingData_FacingLeft_Falling_AimingUpLeft:
    db $08,$01,$EC,$EA,$EC,$EA,$EC,$EA 

ArmCannonDrawingData_FacingRight_Falling_AimingDownRight:
    db $03,$01,$0B,$01,$0B,$01,$0B,$01 

ArmCannonDrawingData_FacingLeft_Falling_AimingDownLeft:
    db $06,$01,$ED,$01,$ED,$01,$ED,$01 

ArmCannonDrawingData_FacingRight_Crouching:
    db $02,$01,$0B,$FD,$0B,$FD,$0B,$FD,$0B,$FD,$0B,$FD,$0B,$FD,$0B,$FD 
    db $0B,$FD,$0B,$FD 

ArmCannonDrawingData_FacingLeft_Crouching:
    db $07,$01,$ED,$FD,$ED,$FD,$ED,$FD,$ED,$FD,$ED,$FD,$ED,$FD,$ED,$FD 
    db $ED,$FD,$ED,$FD 

ArmCannonDrawingData_FacingRight_Crouching_AimingUpRight:
    db $01,$01,$0E,$E9 

ArmCannonDrawingData_FacingLeft_Crouching_AimingUpLeft:
    db $08,$01,$EA,$E8 

ArmCannonDrawingData_FacingRight_Crouching_AimingDownRight:
    db $03,$01,$0D,$02 

ArmCannonDrawingData_FacingLeft_Crouching_AimingDownLeft:
    db $06,$01,$EB,$02 

ArmCannonDrawingData_FacingRight_Crouching_AimingUp:
    db $81,$01,$80,$01,$0E,$E9,$FE,$E0 

ArmCannonDrawingData_FacingLeft_Crouching_AimingUp:
    db $88,$01,$89,$01,$EA,$E8,$FA,$E0 

ArmCannonDrawingData_FacingLeft_Moonwalk:
    db $02,$01,$F1,$FD,$F1,$FC,$F1,$FC,$F1,$FD,$F1,$FC,$F1,$FC 

ArmCannonDrawingData_FacingRight_Moonwalk:
    db $07,$01,$07,$FD,$07,$FC,$07,$FC,$07,$FD,$07,$FC,$07,$FC 

ArmCannonDrawingData_FacingLeft_Moonwalk_AimingUpLeft:
    db $08,$01,$EC,$EA,$EC,$E9,$EC,$E9,$EC,$EA,$EC,$E9,$EC,$E9 

ArmCannonDrawingData_FacingRight_Moonwalk_AimingUpRight:
    db $01,$01,$0C,$EA,$0C,$E9,$0C,$E9,$0C,$EA,$0C,$E9,$0C,$E9 

ArmCannonDrawingData_FacingLeft_Moonwalk_AimingDownLeft:
    db $06,$01,$ED,$01,$ED,$00,$ED,$00,$ED,$01,$ED,$00,$ED,$00 

ArmCannonDrawingData_FacingRight_Moonwalk_AimingDownRight:
    db $03,$01,$0B,$01,$0B,$00,$0B,$00,$0B,$01,$0B,$00,$0B,$00 

ArmCannonDrawingData_FacingRight_LandingFromNormalJump:
    db $03,$01,$FB,$00,$FB,$00,$06,$02,$ED,$FE,$ED,$FE 

ArmCannonDrawingData_FacingRight_LandingFromSpinJump:
    db $03,$01,$FB,$00,$FB,$00,$FB,$00,$06,$02,$ED,$FE,$ED,$FE,$ED,$FE 

ArmCannonDrawingData_FacingRight_Transition_AimingUp:
    db $00,$01,$FE,$E1,$FE,$E1 

ArmCannonDrawingData_FacingLeft_Transition_AimingUp:
    db $09,$01,$FA,$E1,$FA,$E1 

CostOfSBAsInPowerBombs:
    dw $0000,$0001,$0001,$0000,$0001,$0000,$0000,$0000 
    dw $0001,$0000,$0000,$0000 

Math_90CC39:
    PHP 
    REP #$30 
    PHX 
    STA.B $18 
    TYA 
    STA.B $1A 
    CMP.W #$0080 
    BPL .greaterThanEqualTo80 
    ASL A 
    TAX 
    JSR.W Math_90CC8A 
    BRA + 


.greaterThanEqualTo80:
    SEC : SBC.W #$0080 : AND.W #$00FF 
    ASL A 
    TAX 
    JSR.W Math_90CC8A 
    EOR.W #$FFFF 
    INC A 

  + STA.B $14 
    LDA.B $1A : SEC : SBC.W #$0040 : AND.W #$00FF 
    CMP.W #$0080 
    BPL .AGreaterThanEqualTo80 
    ASL A 
    TAX 
    JSR.W Math_90CC8A 
    BRA + 


.AGreaterThanEqualTo80:
    SEC : SBC.W #$0080 : AND.W #$00FF 
    ASL A 
    TAX 
    JSR.W Math_90CC8A 
    EOR.W #$FFFF 
    INC A 

  + STA.B $16 
    PLX 
    PLP 
    RTS 


Math_90CC8A:
    SEP #$20 
    LDA.L SineCosineTables_8bitSine_SignExtended,X : STA.W $4202 
    LDA.B $18 : STA.W $4203 
    NOP #3
    REP #$20 
    LDA.W $4216 
    XBA 
    AND.W #$00FF 
    STA.B $12 
    SEP #$20 
    LDA.L SineCosineTables_8bitSine_SignExtended+1,X : STA.W $4202 
    LDA.B $18 : STA.W $4203 
    NOP #3
    REP #$20 
    LDA.W $4216 : CLC : ADC.B $12 : RTS 


FireSBA:
    LDA.W $09D2 
    CMP.W #$0003 
    BEQ .powerBombsSelected 
    CLC 
    RTS 


.powerBombsSelected:
    LDA.W $09A6 
    AND.W #$000F 
    ASL A 
    TAX 
    LDA.W $09CE : SEC : SBC.W CostOfSBAsInPowerBombs,X : BPL + 
    LDA.W #$0000 

  + STA.W $09CE 
    JSR.W (.pointers,X) 
    LDA.W $09CE 
    BNE .return 
    STZ.W $09D2 
    STZ.W $0A04 

.return:
    RTS 


.pointers:
    dw CLCRTS_90CD18 
    dw FireWaveSBA 
    dw FireIceSBA 
    dw CLCRTS_90CD18 
    dw FireSpazerSBA 
    dw CLCRTS_90CD18 
    dw CLCRTS_90CD18 
    dw CLCRTS_90CD18 
    dw FirePlasmaSBA 
    dw CLCRTS_90CD18 
    dw CLCRTS_90CD18 
    dw CLCRTS_90CD18 

IcePlasmaSBAProjectileOriginAngles:
    dw $0000,$0040,$0080,$00C0,$0020,$0060,$00A0,$00E0 

CLCRTS_90CD18:
    CLC 
    RTS 


FireWaveSBA:
    LDX.W #$0006 

.loop:
    LDA.W #$0004 : STA.W $0C90,X 
    LDA.W $09A6 
    AND.W #$100F 
    ORA.W #$8010 
    STA.W $0C18,X 
    STZ.W $0C04,X 
    LDA.W #ProjectilePreInstruction_WaveSBA : STA.W $0C68,X 
    LDA.W #$0258 : STA.W $0BF0,X 
    STZ.W $0BDC,X 
    STZ.W $0C7C,X 
    STZ.W $0B8C,X 
    STZ.W $0BA0,X 
    LDA.W $0AF6 : CLC : ADC.W .XOffsets,X : STA.W $0B64,X 
    LDA.W $0AFA : CLC : ADC.W .YOffsets,X : STA.W $0B78,X 
    JSL.L InitializeSBAProjectile 
    DEX #2
    BPL .loop 
    LDA.W #$0004 : STA.W $0CCE 
    LDA.W $0C18 
    AND.W #$003F 
    TAY 
    LDA.W ProjectileCooldowns_Uncharged,Y : AND.W #$00FF : STA.W $0CCC 
    LDA.W #$0004 : STA.W $0B60 
    LDA.W #$0028 
    JSL.L QueueSound_Lib1_Max6 
    SEC 
    RTS 


.XOffsets:
    dw $0080,$0080,$FF80,$FF80 

.YOffsets:
    dw $0080,$FF80,$FF80,$0080 

FireIceSBA:
    LDA.W $0C68 
    CMP.W #ProjectilePreInstruction_IceSBA_End 
    BEQ .returnCarryClear 
    CMP.W #ProjectilePreInstruction_IceSBA_Main 
    BNE .fire 

.returnCarryClear:
    CLC 
    RTS 


.fire:
    LDX.W #$0006 

.loop:
    LDA.W #$0004 : STA.W $0C90,X 
    LDA.W $09A6 
    AND.W #$100F 
    ORA.W #$8010 
    STA.W $0C18,X 
    STZ.W $0C04,X 
    LDA.W #ProjectilePreInstruction_IceSBA_Main : STA.W $0C68,X 
    LDA.W IcePlasmaSBAProjectileOriginAngles,X : STA.W $0C7C,X 
    LDA.W #$0258 : STA.W $0BF0,X 
    JSL.L InitializeProjectile 
    DEX #2
    BPL .loop 
    LDA.W #$0004 : STA.W $0CCE 
    LDA.W $0C18 
    AND.W #$003F 
    TAY 
    LDA.W ProjectileCooldowns_Uncharged,Y : AND.W #$00FF : STA.W $0CCC 
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0004 
    BEQ .facingLeft 
    LDA.W #$0004 : STA.W $0B60 
    BRA .finish 


.facingLeft:
    LDA.W #$FFFC : STA.W $0B60 

.finish:
    LDA.W #$0023 
    JSL.L QueueSound_Lib1_Max6 
    SEC 
    RTS 


FireSpazerSBA:
    LDX.W #$0006 

.loop:
    LDA.W .initialTrailTimers,X : STA.W $0C90,X 
    LDA.W #$0005 : STA.W $0C04,X 
    LDA.W #ProjectilePreInstruction_SpazerSBA : STA.W $0C68,X 
    LDA.W #$0028 : STA.W $0BDC,X 
    LDA.W .angleDeltas,X : STA.W $0BF0,X 
    STZ.W $0C7C,X 
    STZ.W $0CA4,X 
    STZ.W $0B8C,X 
    STZ.W $0BA0,X 
    CPX.W #$0004 
    BPL .greaterThanEqualTo4 
    LDA.W $09A6 
    AND.W #$100F 
    ORA.W #$8010 
    STA.W $0C18,X 
    JSL.L InitializeSBAProjectile 
    BRA .next 


.greaterThanEqualTo4:
    LDA.W #$8024 : STA.W $0C18,X 
    JSL.L Initialize_ShinesparkEcho_or_SpazerSBATrailProjectile 

.next:
    DEX #2
    BPL .loop 
    LDA.W #$0004 : STA.W $0CCE 
    LDA.W $0C18 
    AND.W #$003F 
    TAY 
    LDA.W ProjectileCooldowns_Uncharged,Y : AND.W #$00FF : STA.W $0CCC 
    STZ.W $0B60 
    LDA.W #$0025 
    JSL.L QueueSound_Lib1_Max6 
    SEC 
    RTS 


.initialTrailTimers:
    dw $0000,$0000,$0004,$0004 

.angleDeltas:
    dw $0004,$FFFC,$0004,$FFFC 

FirePlasmaSBA:
    LDA.W $0C68 
    CMP.W #ProjectilePreInstruction_PlasmaSBA 
    BNE + 
    CLC 
    RTS 


  + LDX.W #$0006 

.loop:
    LDA.W $09A6 
    AND.W #$100F 
    ORA.W #$8010 
    STA.W $0C18,X 
    STZ.W $0C04,X 
    LDA.W #ProjectilePreInstruction_PlasmaSBA : STA.W $0C68,X 
    LDA.W IcePlasmaSBAProjectileOriginAngles,X : STA.W $0C7C,X 
    LDA.W #$0028 : STA.W $0BDC,X 
    STZ.W $0BF0,X 
    JSL.L InitializeSBAProjectile 
    DEX #2
    BPL .loop 
    LDA.W #$0004 : STA.W $0CCE 
    LDA.W $0C18 
    AND.W #$003F 
    TAY 
    LDA.W ProjectileCooldowns_Uncharged,Y : AND.W #$00FF : STA.W $0CCC 
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0004 
    BEQ .facingLeft 
    LDA.W #$0004 : STA.W $0B60 
    BRA .playSFX 


.facingLeft:
    LDA.W #$FFFC : STA.W $0B60 

.playSFX:
    LDA.W #$0027 
    JSL.L QueueSound_Lib1_Max6 
    SEC 
    RTS 


ProjectilePreInstruction_IceSBA_Main:
    LDA.W $0C04,X 
    AND.W #$00F0 
    BEQ .trail 
    LDA.W #$0024 
    JSL.L QueueSound_Lib1_Max6 
    JSL.L Clear_Projectile 
    RTS 


.trail:
    DEC.W $0C90,X 
    BNE + 
    LDA.W #$0004 : STA.W $0C90,X 
    JSL.L Spawn_ProjectileTrail 
    LDX.W $0DDE 

  + LDA.W $0C7C,X 
    TAY 
    LDA.W #$0020 
    JSR.W Math_90CC39 
    LDA.W $0AF6 : CLC : ADC.B $14 : STA.W $0B64,X 
    LDA.W $0AFA : CLC : ADC.B $16 : STA.W $0B78,X 
    LDA.W $0C7C,X : CLC : ADC.W $0B60 : AND.W #$00FF 
    STA.W $0C7C,X 
    DEC.W $0BF0,X 
    BNE .done 
    LDA.W #ProjectilePreInstruction_IceSBA_End : STA.W $0C68,X 
    LDA.W #$0028 : STA.W $0BDC,X 
    LDA.W #$0024 
    JSL.L QueueSound_Lib1_Max6 

.done:
    LDA.W #$0002 : STA.W $0CCC 
    STZ.W $0CD0 
    RTS 


ProjectilePreInstruction_IceSBA_End:
    LDA.W $0C04,X 
    AND.W #$00F0 
    BEQ .notDeleted 
    JSL.L Clear_Projectile 
    RTS 


.notDeleted:
    DEC.W $0C90,X 
    BNE + 
    LDA.W #$0004 : STA.W $0C90,X 
    JSL.L Spawn_ProjectileTrail 
    LDX.W $0DDE 

  + LDA.W $0C7C,X 
    TAY 
    LDA.W $0BDC,X 
    JSR.W Math_90CC39 
    LDA.W $0AF6 : CLC : ADC.B $14 : STA.W $0B64,X 
    SEC : SBC.W $0911 : CMP.W #$FFE0 
    BMI .clearProjectile 
    CMP.W #$0120 
    BPL .clearProjectile 
    LDA.W $0AFA : CLC : ADC.B $16 : STA.W $0B78,X 
    SEC : SBC.W $0915 : CMP.W #$0010 
    BMI .clearProjectile 
    CMP.W #$0100 
    BPL .clearProjectile 
    LDA.W $0C7C,X : CLC : ADC.W $0B60 : AND.W #$00FF 
    STA.W $0C7C,X 
    LDA.W $0BDC,X : CLC : ADC.W #$0008 : AND.W #$00FF 
    STA.W $0BDC,X 
    LDA.W #$0002 : STA.W $0CCC 
    STZ.W $0CD0 
    RTS 


.clearProjectile:
    JSL.L Clear_Projectile 
    RTS 


TriggerShinesparkWindup:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    LDA.W #SamusMovementHandler_ShinesparkWindup : STA.W $0A58 
    LDA.W #$0001 : STA.W $0B36 
    LDA.W #$0400 : STA.W $0B3E 
    STZ.W $0B2C 
    STZ.W $0B2E 
    STZ.W $0A52 
    LDA.W #$0008 : STA.W $0B42 
    STZ.W $0B44 
    STZ.W $0B46 
    STZ.W $0B48 
    LDA.W #$0007 : STA.W $0DEC 
    STZ.W $0DEE 
    STZ.W $0CCC 
    LDA.W #$001E : STA.W $0AA2 
    LDA.W #$003C : STA.W $0A68 
    LDA.W #$0006 : STA.W $0ACC 
    STZ.W $0ACE 
    STZ.W $0A56 
    LDA.W $0CD0 
    BEQ .return 
    CMP.W #$0010 
    BMI .resetFlare 
    LDA.W #$0002 
    JSL.L QueueSound_Lib1_Max9 

.resetFlare:
    STZ.W $0CD0 
    JSR.W ClearFlareAnimationState 

.return:
    PLB 
    PLP 
    RTL 


SamusMovementHandler_ShinesparkWindup:
    DEC.W $0AA2 
    BEQ .timerExpired 
    BPL .return 

.timerExpired:
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0004 
    BEQ .facingLeft 
    LDA.W #$00CB : STA.W $0A2A 
    BRA + 


.facingLeft:
    LDA.W #$00CC : STA.W $0A2A 

  + LDA.W #SamusMovementHandler_VerticalShinespark : STA.W $0A58 
    LDA.W #RTS_90E90E : STA.W $0A60 
    STZ.W $0AAE 
    STZ.W $0AC0 
    STZ.W $0AC2 
    STZ.W $0AB0 
    STZ.W $0AB2 
    LDA.W #$000F 
    JSL.L QueueSound_Lib3_Max9 

.return:
    RTS 


SamusMovementHandler_VerticalShinespark:
    LDA.W #$0002 : STA.W $0A6E 
    LDA.W #$0008 : STA.W $0A48 
    LDX.W #$0004 
    LDY.W Unknown_ShinesparkMovementHandler_Unused_90EF20 ; >_<
    JSR.W UpdateSamusEchoPosition 
    JSR.W Shinespark_Vertical_Movement 
    JSR.W EndShinesparkIfCollisionDetectedOrLowEnergy 
    LDA.W $09C2 
    CMP.W #$001E 
    BMI .return 
    DEC.W $09C2 
    BPL .return 
    STZ.W $09C2 ; >_<

.return:
    RTS 


SamusMovementHandler_DiagonalShinespark:
    LDA.W #$0002 : STA.W $0A6E 
    LDA.W #$0008 : STA.W $0A48 
    LDX.W #$0004 
    LDY.W Unknown_ShinesparkMovementHandler_Unused_90EF20 
    JSR.W UpdateSamusEchoPosition ; >_<
    JSR.W Shinespark_Horizontal_Movement 
    JSR.W Shinespark_Vertical_Movement 
    JSR.W EndShinesparkIfCollisionDetectedOrLowEnergy 
    LDA.W $09C2 
    CMP.W #$001E 
    BMI .return 
    DEC.W $09C2 
    BPL .return 
    STZ.W $09C2 ; >_<

.return:
    RTS 


SamusMovementHandler_HorizontalShinespark:
    LDA.W #$0002 : STA.W $0A6E 
    LDA.W #$0008 : STA.W $0A48 
    LDX.W #$0008 
    LDY.W Unknown_ShinesparkMovementHandler_Unused_90EF20 ; >_<
    JSR.W UpdateSamusEchoPosition 
    JSR.W Shinespark_Horizontal_Movement 
    JSR.W EndShinesparkIfCollisionDetectedOrLowEnergy 
    LDA.W $09C2 
    CMP.W #$001E 
    BMI .return 
    DEC.W $09C2 
    BPL .return 
    STZ.W $09C2 ; >_<

.return:
    RTS 


Shinespark_Horizontal_Movement:
    LDA.W #$000F : STA.W $0A68 
    LDA.W $0B44 : CLC : ADC.W $0B32 : STA.W $0B44 
    LDA.W $0B42 : ADC.W $0B34 : STA.W $0B42 
    CMP.W #$000F 
    BMI + 
    LDA.W #$000F : STA.W $0B42 
    STZ.W $0B44 

  + STZ.B $12 
    STZ.B $14 
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0004 
    BEQ .left 
    JSR.W CalculateSamusXDisplacement_ForMovingRight 
    LDA.B $12 
    CMP.W #$000F 
    BMI .rightCollision 
    LDA.W #$000F : STA.B $12 

.rightCollision:
    JSL.L Samus_vs_SolidEnemy_CollisionDetection 
    TAX 
    BEQ .moveRight 
    STA.W $0DD0 
    BRA .merge 


.moveRight:
    JSL.L MoveSamusRight_NoSolidEnemyCollision 
    JSL.L Align_SamusYPosition_WithNonSquareSlope 
    BRA .merge 


.left:
    JSR.W CalculateSamusXDisplacement_ForMovingLeft 
    LDA.B $12 : EOR.W #$FFFF : STA.B $12 
    LDA.B $14 
    EOR.W #$FFFF 
    INC A 
    STA.B $14 
    BNE + 
    INC.B $12 

  + LDA.B $12 
    CMP.W #$000F 
    BMI .leftCollision 
    LDA.W #$000F : STA.B $12 

.leftCollision:
    JSL.L Samus_vs_SolidEnemy_CollisionDetection 
    TAX 
    BEQ .flipDirection 
    STA.W $0DD0 
    BRA .merge 


.flipDirection:
    LDA.B $12 : EOR.W #$FFFF : STA.B $12 
    LDA.B $14 
    EOR.W #$FFFF 
    INC A 
    STA.B $14 
    BNE .moveLeft 
    INC.B $12 

.moveLeft:
    JSL.L MoveSamusRight_NoSolidEnemyCollision 
    JSL.L Align_SamusYPosition_WithNonSquareSlope 

.merge:
    LDA.W $0AF6 : SEC : SBC.W $0B10 : BMI + 
    CMP.W #$0010 
    BMI .return 
    LDA.W $0AF6 : SEC : SBC.W #$000F : STA.W $0B10 
    RTS 


  + CMP.W #$FFF1 
    BPL .return 
    LDA.W $0AF6 : CLC : ADC.W #$000F : STA.W $0B10 

.return:
    RTS 


Shinespark_Vertical_Movement:
    LDA.W #$000F : STA.W $0A68 
    LDA.W $0DEE : CLC : ADC.W $0B32 : STA.W $0DEE 
    LDA.W $0DEC : ADC.W $0B34 : STA.W $0DEC 
    LDA.W $0B2C : CLC : ADC.W $0DEE : STA.W $0B2C 
    STA.B $14 
    LDA.W $0B2E : ADC.W $0DEC : STA.W $0B2E 
    STA.B $12 
    CMP.W #$000E 
    BMI .flipDirection 
    LDA.W #$000E : STA.B $12 

.flipDirection:
    LDA.B $12 : EOR.W #$FFFF : STA.B $12 
    LDA.B $14 
    EOR.W #$FFFF 
    INC A 
    STA.B $14 
    BNE + 
    INC.B $12 

  + LDA.W $0B5A : CLC : ADC.B $14 : STA.B $14 
    LDA.W $0B5C : ADC.B $12 : STA.B $12 
    LDA.W #$0002 : STA.W $0B02 
    LDA.B $12 : EOR.W #$FFFF : STA.B $12 
    LDA.B $14 
    EOR.W #$FFFF 
    INC A 
    STA.B $14 
    BNE + 
    INC.B $12 

  + LDA.B $12 
    CMP.W #$000F 
    BMI .collisionDetection 
    LDA.W #$000F : STA.B $12 

.collisionDetection:
    JSL.L Samus_vs_SolidEnemy_CollisionDetection 
    TAX 
    BEQ + 
    STA.W $0DD0 
    BRA .noMovement 


  + LDA.B $12 : EOR.W #$FFFF : STA.B $12 
    LDA.B $14 
    EOR.W #$FFFF 
    INC A 
    STA.B $14 
    BNE .moveSamus 
    INC.B $12 

.moveSamus:
    JSL.L MoveSamusDown_NoSolidEnemyCollision 

.noMovement:
    LDA.W $0AFA : SEC : SBC.W $0B14 : CMP.W #$FFF2 
    BPL .return 
    LDA.W $0AFA : CLC : ADC.W #$000E : STA.W $0B14 

.return:
    RTS 


EndShinesparkIfCollisionDetectedOrLowEnergy:
    LDA.W $09C2 
    CMP.W #$001E 
    BMI .endShinespark 
    LDA.W $0DD0 
    BNE .endShinespark 
    CLC 
    RTS 


.endShinespark:
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0004 
    BEQ .facingLeft 
    LDA.W #$00E0 : STA.W $0AC0 
    LDA.W #$0060 : STA.W $0AC2 
    LDA.W #$FFFC : STA.W $0AB4 
    BRA + 


.facingLeft:
    LDA.W #$0020 : STA.W $0AC0 
    LDA.W #$00A0 : STA.W $0AC2 
    LDA.W #$0004 : STA.W $0AB4 

  + STZ.W $0B2C 
    STZ.W $0B2E 
    STZ.W $0B42 
    STZ.W $0B44 
    STZ.W $0B3E 
    STZ.W $0B1A 
    STZ.W $0B36 
    LDA.W #SamusMovementHandler_ShinesparkCrash_EchoesCircleSamus : STA.W $0A58 
    LDA.W #SamusDisplayHandler_ShinesparkCrashCircle : STA.W $0A5C 
    STZ.W $0AAE 
    LDA.W $0AF6 : STA.W $0AB0 
    STA.W $0AB2 
    LDA.W $0AFA : STA.W $0AB8 
    STA.W $0ABA 
    STZ.W $0AC4 
    STZ.W $0A48 
    LDA.W #$0035 
    JSL.L QueueSound_Lib1_Max6 
    LDA.W #$0010 
    JSL.L QueueSound_Lib3_Max6 
    SEC 
    RTS 


SamusMovementHandler_ShinesparkCrash_EchoesCircleSamus:
    LDA.W #$000F : STA.W $0A68 
    LDA.W $0AAF 
    AND.W #$00FF 
    ASL A 
    TAX 
    JSR.W (.pointers,X) 
    LDX.W #$0002 

.loop:
    LDY.W $0AC0,X 
    LDA.W $0AAE 
    AND.W #$00FF 
    JSR.W Math_90CC39 
    LDA.W $0AF6 : CLC : ADC.B $14 : STA.W $0AB0,X 
    LDA.W $0AFA : CLC : ADC.B $16 : STA.W $0AB8,X 
    DEX #2
    BPL .loop 
    RTS 


.pointers:
    dw ShinesparkCrash_EchoesCircleSamus_Phase0 
    dw ShinesparkCrash_EchoesCircleSamus_Phase1 
    dw ShinesparkCrash_EchoesCircleSamus_Phase2 

ShinesparkCrash_EchoesCircleSamus_Phase0:
    LDA.W $0AAE : CLC : ADC.W #$0004 : CMP.W #$0010 
    BMI + 
    ORA.W #$0100 

  + STA.W $0AAE 
    RTS 


ShinesparkCrash_EchoesCircleSamus_Phase1:
    LDA.W $0AC0 : CLC : ADC.W $0AB4 : AND.W #$00FF 
    STA.W $0AC0 
    LDA.W $0AC2 : CLC : ADC.W $0AB4 : AND.W #$00FF 
    STA.W $0AC2 
    LDA.W $0ABC : CLC : ADC.W #$0004 : STA.W $0ABC 
    CMP.W #$0080 
    BMI .return 
    LDA.W $0AAE 
    AND.W #$00FF 
    ORA.W #$0200 
    STA.W $0AAE 

.return:
    RTS 


ShinesparkCrash_EchoesCircleSamus_Phase2:
    LDA.W $0AAE : SEC : SBC.W #$0004 : STA.W $0AAE 
    AND.W #$00FF 
    BEQ .zeroDistance 
    BPL .return 

.zeroDistance:
    LDA.W #ShinesparkCrash_EchoesFinishedCirclingSamus : STA.W $0A58 
    LDA.W #$001E : STA.W $0AA2 
    STZ.W $0AAE 
    STZ.W $0AC0 
    STZ.W $0AC2 

.return:
    RTS 


ShinesparkCrash_EchoesFinishedCirclingSamus:
    LDA.W #$000F : STA.W $0A68 
    DEC.W $0AA2 
    BEQ .timerExpired 
    BPL .return 

.timerExpired:
    LDA.W #ShinesparkCrash_Finish : STA.W $0A58 
    LDA.W #SamusDrawingHandler_Default : STA.W $0A5C 

.return:
    RTS 


ShinesparkCrash_Finish:
    STZ.W $0AAE 
    LDA.W $0CCE 
    CMP.W #$0005 
    BPL .dontFire 
    CMP.W #$0004 
    BPL .extraEcho 
    INC.W $0CCE 
    LDA.W #$0040 : STA.W $0AC4 
    LDA.W $0AF6 : STA.W $0AB4 
    LDA.W $0AFA : STA.W $0ABC 
    LDA.W #$8029 : STA.W $0C1E 
    LDX.W #$0006 
    JSL.L Initialize_ShinesparkEcho_or_SpazerSBATrailProjectile 
    LDA.W #ProjectilePreInstruction_SpeedEcho : STA.W $0C6E 
    LDA.W $0A1C : SEC : SBC.W #$00C9 : ASL A 
    TAX 
    LDA.W .data0,X : AND.W #$00FF : STA.W $0C82 
    STZ.W $0BE2 

.extraEcho:
    INC.W $0CCE 
    LDA.W #$0040 : STA.W $0AC6 
    LDA.W $0AF6 : STA.W $0AB6 
    LDA.W $0AFA : STA.W $0ABE 
    LDA.W #$8029 : STA.W $0C20 
    LDX.W #$0008 
    JSL.L Initialize_ShinesparkEcho_or_SpazerSBATrailProjectile 
    LDA.W #ProjectilePreInstruction_SpeedEcho : STA.W $0C70 
    LDA.W $0A1C : SEC : SBC.W #$00C9 : ASL A 
    TAX 
    LDA.W .data1,X : AND.W #$00FF : STA.W $0C84 
    STZ.W $0BE4 

.dontFire:
    STZ.W $0CCC 
    LDA.W #$0001 : STA.W $0A68 
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0004 
    BEQ .facingLeft 
    LDA.W #$0001 : STA.W $0A2C 
    BRA .finish 


.facingLeft:
    LDA.W #$0002 : STA.W $0A2C 

.finish:
    LDA.W #$0002 : STA.W $0A32 
    STZ.W $0DEC 
    STZ.W $0DEE 
    RTS 


.data0:
    db $00 

.data1:
    db $80,$00,$80,$40,$C0,$40,$C0,$E0,$60,$20,$A0 

ProjectilePreInstruction_SpeedEcho:
    LDA.W $0BDC,X : CLC : ADC.W #$0008 : STA.W $0BDC,X 
    LDY.W $0C7C,X 
    LDA.W $0BDC,X 
    AND.W #$00FF 
    JSR.W Math_90CC39 
    LDA.W $0AF6 : CLC : ADC.B $14 : STA.W $0AAE,X 
    STA.W $0B64,X 
    SEC : SBC.W $0911 : BMI .done 
    CMP.W #$0100 
    BPL .done 
    LDA.W $0AFA : CLC : ADC.B $16 : STA.W $0AB6,X 
    STA.W $0B78,X 
    SEC : SBC.W $0915 : BMI .done 
    CMP.W #$0100 
    BPL .done 
    RTS 


.done:
    STZ.W $0ABE,X 
    STZ.W $0AAE,X 
    STZ.W $0AB6,X 
    JSL.L Clear_Projectile 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_GrappleBeam_90D525:
    LDA.B $8B 
    BIT.W $09B2 
    BNE .holdingShot 

.cancel:
    LDA.W #GrappleBeamFunction_HitNothing_Cancel : STA.W $0D32 
    RTS 


.holdingShot:
    LDA.W $0A9E 
    DEC A 
    STA.W $0A9E 
    BEQ .cancel 
    BMI .cancel 
    LDA.W $0D00 
    BMI .continue 
    LDA.W $0CFE : CLC : ADC.W $0D00 : STA.W $0CFE 
    CMP.W #$0060 
    BMI .continue 
    LDA.W #$0010 
    EOR.W #$FFFF 
    INC A 
    STA.W $0D00 
    BRA .continue 

    LDA.W $0CFE ; dead code
    CLC : ADC.W $0D00 : STA.W $0CFE 
    BPL .continue 
    STZ.W $0CFE 
    LDA.W #$0010 : STA.W $0D00 

.continue:
    LDA.W $0CFA 
    XBA 
    AND.W #$00FF 
    TAY 
    LDA.W $0CFE 
    JSR.W Math_90CC39 
    LDA.W $0D16 : CLC : ADC.B $14 : STA.W $0D08 
    LDA.W $0D18 : CLC : ADC.B $16 : STA.W $0D0C 
    LDA.W $0CFA : CLC : ADC.W #$0800 : STA.W $0CFA 
    JSL.L UpdateGrappleBeamStartPositionDuringGrappleFire 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


CrystalFlash:
    PHP 
    REP #$30 
    LDA.W $0998 
    CMP.W #$0028 
    BPL .skipInputCheck 
    LDA.W #$0430 : ORA.W $09B2 : STA.B $12 
    LDA.B $8B 
    CMP.B $12 
    BNE .returnCarrySet 

.skipInputCheck:
    LDA.W $0B2E 
    BNE .returnCarrySet 
    LDA.W $0B2C 
    BNE .returnCarrySet 
    LDA.W $09C2 
    CMP.W #$0033 
    BPL .returnCarrySet 
    LDA.W $09D6 
    BNE .returnCarrySet 
    LDA.W $09C6 
    CMP.W #$000A 
    BMI .returnCarrySet 
    LDA.W $09CA 
    CMP.W #$000A 
    BMI .returnCarrySet 
    LDA.W $09CE 
    CMP.W #$000A 
    BPL .activate 

.returnCarrySet:
    PLP 
    SEC 
    RTL 


.activate:
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0004 
    BEQ .facingLeft 
    LDA.W #$00D3 
    BRA .storePose 


.facingLeft:
    LDA.W #$00D4 

.storePose:
    STA.W $0A1C 
    JSL.L InitializeSamusPose_1 
    JSL.L Set_Samus_AnimationFrame_if_PoseChanged 
    LDA.W $0A1F 
    AND.W #$00FF 
    CMP.W #$001B 
    BNE .returnCarrySet 
    LDA.W $0A20 : STA.W $0A24 
    LDA.W $0A22 : STA.W $0A26 
    LDA.W $0A1C : STA.W $0A20 
    LDA.W $0A1E : STA.W $0A22 
    LDA.W #SamusMovementHandler_CrystalFlash_RaiseSamus_GenerateBubble : STA.W $0A58 
    LDA.W $0A60 
    CMP.W #SamusPoseInputHandler_Demo 
    BEQ .skipInputHandler 
    LDA.W #RTS_90E90E : STA.W $0A60 

.skipInputHandler:
    LDA.W #$0009 : STA.W $0AA2 
    STZ.W $0DEA 
    LDA.W #$000A : STA.W $0DEC 
    STZ.W $0DEE 
    STZ.W $0DF0 
    STZ.W $0DF2 
    LDA.W #$0007 : STA.W $0ACC 
    STZ.W $0ACE 
    LDA.W #$0001 : STA.W $0A68 
    STA.W $0DF2 
    STZ.W $18A8 
    STZ.W $18AA 
    STZ.W $0A52 
    PLP 
    CLC 
    RTL 


SamusMovementHandler_CrystalFlash_RaiseSamus_GenerateBubble:
    LDA.W $0AFA 
    DEC #2
    STA.W $0AFA 
    LDA.W $0AA2 
    DEC A 
    STA.W $0AA2 
    BPL .return 
    LDA.W #$0003 : STA.W $0A94 
    LDA.W #$0006 : STA.W $0A96 
    LDA.W $0AFA : STA.W $0DF0 
    LDA.W #SamusMovementHandler_CrystalFlash_DecrementAmmo : STA.W $0A58 
    STZ.W $18A8 
    STZ.W $18AA 
    LDA.W #$0001 
    JSL.L QueueSound_Lib3_Max15 
    STZ.W $0CEE 
    LDA.W $0AF6 : STA.W $0CE2 
    LDA.W $0AFA : STA.W $0CE4 
    PHX 
    PHY 
    PHP 
    PHB 
    JSL.L Enable_HDMAObjects 
    JSL.L Spawn_CrystalFlash_HDMAObjects 
    PLB 
    PLP 
    PLY 
    PLX 

.return:
    RTS 


SamusMovementHandler_CrystalFlash_DecrementAmmo:
    LDA.W $0DEA 
    ASL A 
    TAX 
    JSR.W (.pointers,X) 
    STZ.W $18A8 
    STZ.W $18AA 
    RTS 


.pointers:
    dw CrystalFlash_DecrementMissiles 
    dw CrystalFlash_DecrementSuperMissiles 
    dw CrystalFlash_DecrementPowerBombs 

CrystalFlash_DecrementMissiles:
    LDA.W $05B6 
    BIT.W #$0007 
    BNE .return 
    DEC.W $09C6 
    LDA.W #$0032 
    JSL.L Restore_A_Energy_ToSamus 
    DEC.W $0DEC 
    BEQ .timerExpired 
    BPL .return 

.timerExpired:
    LDA.W #$000A : STA.W $0DEC 
    INC.W $0DEA 

.return:
    RTS 


CrystalFlash_DecrementSuperMissiles:
    LDA.W $05B6 
    BIT.W #$0007 
    BNE .return 
    DEC.W $09CA 
    LDA.W #$0032 
    JSL.L Restore_A_Energy_ToSamus 
    DEC.W $0DEC 
    BEQ .timerExpired 
    BPL .return 

.timerExpired:
    LDA.W #$000A : STA.W $0DEC 
    INC.W $0DEA 

.return:
    RTS 


CrystalFlash_DecrementPowerBombs:
    LDA.W $05B6 
    BIT.W #$0007 
    BNE .return 
    DEC.W $09CE 
    LDA.W #$0032 
    JSL.L Restore_A_Energy_ToSamus 
    DEC.W $0DEC 
    BEQ .timerExpired 
    BPL .return 

.timerExpired:
    LDA.W #SamusMovementHandler_CrystalFlash_Finish : STA.W $0A58 
    LDA.W #SamusDrawingHandler_Default : STA.W $0A5C 
    LDA.W #$0003 : STA.W $0A94 
    LDA.W #$000C : STA.W $0A96 

.return:
    RTS 


SamusMovementHandler_CrystalFlash_Finish:
    LDA.W $0AFA 
    CMP.W $0DF0 
    BEQ + 
    INC A 
    STA.W $0AFA 

  + LDA.W $0A1F 
    AND.W #$00FF 
    BNE .return 
    STZ.W $0CEE 
    LDA.W #$FFFF : STA.W $0A68 
    LDA.W #SamusMovementHandler_Normal : STA.W $0A58 
    LDA.W $0A60 
    CMP.W #SamusPoseInputHandler_Demo 
    BEQ .return 
    LDA.W #SamusPoseInputHandler_Normal : STA.W $0A60 
    STZ.W $18A8 
    STZ.W $18AA 

.return:
    RTS 


ProjectilePreInstruction_PlasmaSBA:
    LDA.W $0C04,X 
    AND.W #$00F0 
    BEQ .notDeleted 
    JSL.L Clear_Projectile 
    RTS 


.notDeleted:
    LDA.W #$0002 : STA.W $0CCC 
    STZ.W $0CD0 
    LDA.W $0C7C,X 
    TAY 
    LDA.W $0BDC,X 
    JSR.W Math_90CC39 
    LDA.W $0AF6 : CLC : ADC.B $14 : STA.W $0B64,X 
    LDA.W $0AFA : CLC : ADC.B $16 : STA.W $0B78,X 
    LDA.W $0C7C,X : CLC : ADC.W $0B60 : AND.W #$00FF 
    STA.W $0C7C,X 
    TXY 
    LDA.W $0BF0,X 
    ASL A 
    TAX 
    JMP.W (.pointers,X) 


.pointers:
    dw PlasmaSBA_Phase0_Expanding 
    dw PlasmaSBA_Phase1_Contracting 
    dw PlasmaSBA_Phase2_Dispersing 

PlasmaSBA_Phase0_Expanding:
    LDA.W $0BDC,Y : CLC : ADC.W #$0004 : AND.W #$00FF 
    STA.W $0BDC,Y 
    CMP.W #$00C0 
    BMI .return 
    LDA.W #$0001 : STA.W $0BF0,Y 

.return:
    RTS 


PlasmaSBA_Phase1_Contracting:
    LDA.W $0BDC,Y : SEC : SBC.W #$0004 : AND.W #$00FF 
    STA.W $0BDC,Y 
    CMP.W #$002D 
    BPL .return 
    LDA.W #$0002 : STA.W $0BF0,Y 

.return:
    RTS 


PlasmaSBA_Phase2_Dispersing:
    LDA.W $0B64,Y : SEC : SBC.W $0911 : CMP.W #$FFE0 
    BMI .clear 
    CMP.W #$0120 
    BPL .clear 
    LDA.W $0B78,Y : SEC : SBC.W $0915 : CMP.W #$0010 
    BMI .clear 
    CMP.W #$0100 
    BPL .clear 
    LDA.W $0BDC,Y : CLC : ADC.W #$0004 : AND.W #$00FF 
    STA.W $0BDC,Y 
    RTS 


.clear:
    TYX 
    JSL.L Clear_Projectile 
    RTS 


BombSpread:
    LDA.W $0C72 
    CMP.W #ProjectilePreInstruction_BombSpread 
    BNE .notYetBombSpread 
    CLC 
    RTS 


.notYetBombSpread:
    LDX.W #$000A 

.loop:
    LDA.W #$8500 : STA.W $0C18,X 
    STZ.W $0C04,X 
    LDA.W #ProjectilePreInstruction_BombSpread : STA.W $0C68,X 
    JSL.L InitializeBomb 
    LDA.W $0AF6 : STA.W $0B64,X 
    STZ.W $0B8C,X 
    LDA.W $0AFA : STA.W $0B78,X 
    STZ.W $0BA0,X 
    TXA 
    SEC : SBC.W #$000A : TAY 
    LDA.W BombSpreadData_XVelocities,Y : STA.W $0BDC,X 
    LDA.W BombSpreadData_YSubSpeeds,Y : STA.W $0C90,X 
    LDA.W $0CD4 
    ASL #2
    XBA 
    AND.W #$0003 
    CLC : ADC.W BombSpreadData_YSpeeds,Y : EOR.W #$FFFF 
    INC A 
    STA.W $0BF0,X 
    STA.W $0CA4,X 
    LDA.W BombSpreadData_timers,Y : STA.W $0C7C,X 
    INX #2
    CPX.W #$0014 
    BMI .loop 
    LDA.W #$0005 : STA.W $0CD2 
    LDA.W $0C22 
    XBA 
    AND.W #$000F 
    TAY 
    LDA.W ProjectileCooldowns_NonBeamProjectiles,Y : AND.W #$00FF : STA.W $0CCC 
    STZ.W $0CD4 
    STZ.W $0CD0 
    RTS 


BombSpreadData_timers:
    db $78,$00,$6E,$00,$64,$00,$6E,$00,$78,$00 

BombSpreadData_XVelocities:
    db $00,$81,$80,$80,$00,$00,$80,$00,$00,$01 

BombSpreadData_YSpeeds:
    db $00,$00,$01,$00,$02,$00,$01,$00,$00,$00 

BombSpreadData_YSubSpeeds:
    db $00,$00,$00,$00,$00,$80,$00,$00,$00,$00 

ProjectilePreInstruction_BombSpread:
    LDA.W $0C04,X 
    AND.W #$00F0 
    BEQ .notDeleted 
    JSL.L Clear_Projectile 
    RTS 


.notDeleted:
    JSR.W HandleBomb 
    LDA.W $0C7C,X 
    BNE .timerNotExpired 
    JMP.W .movementDone 


.timerNotExpired:
    LDA.W $0C90,X : CLC : ADC.W $0B32 : STA.W $0C90,X 
    LDA.W $0BF0,X : ADC.W $0B34 : STA.W $0BF0,X 
    LDA.W $0BA0,X : CLC : ADC.W $0C90,X : STA.W $0BA0,X 
    LDA.W $0B78,X : ADC.W $0BF0,X : STA.W $0B78,X 
    JSL.L BombSpreadBlockCollisionDetection 
    BCC .falling 
    LDX.W $0DDE 
    TXA 
    SEC : SBC.W #$000A : TAY 
    LDA.W $0BA0,X : SEC : SBC.W $0C90,X : STA.W $0BA0,X 
    LDA.W $0B78,X : SBC.W $0BF0,X : STA.W $0B78,X 
    LDA.W $0BF0,X 
    BMI .negativeYVelocity 
    LDA.W BombSpreadData_YSubSpeeds,Y : STA.W $0C90,X 
    LDA.W $0CA4,X : STA.W $0BF0,X 
    JMP.W .return 


.negativeYVelocity:
    STZ.W $0BF0,X 
    STZ.W $0BC8,X 
    JMP.W .return 


.falling:
    LDX.W $0DDE 
    LDA.W $0BDC,X 
    XBA 
    PHA 
    AND.W #$FF00 
    STA.B $14 
    PLA 
    AND.W #$00FF 
    STA.B $12 
    BIT.W #$0080 
    BEQ .right 
    AND.W #$FF7F 
    STA.B $12 
    BRA .left 


.right:
    LDA.W $0B8C,X : CLC : ADC.B $14 : STA.W $0B8C,X 
    LDA.W $0B64,X : ADC.B $12 : STA.W $0B64,X 
    BRA .movementDone 


.left:
    LDA.W $0B8C,X : SEC : SBC.B $14 : STA.W $0B8C,X 
    LDA.W $0B64,X : SBC.B $12 : STA.W $0B64,X 

.movementDone:
    JSL.L BombSpreadBlockCollisionDetection 
    BCC .return 
    LDX.W $0DDE 
    LDA.W $0BDC,X 
    PHA 
    XBA 
    PHA 
    AND.W #$FF00 
    STA.B $14 
    PLA 
    AND.W #$007F 
    STA.B $12 
    PLA 
    BIT.W #$8000 
    BEQ .bounceLeft 
    AND.W #$7FFF 
    STA.W $0BDC,X 
    LDA.W $0B8C,X : CLC : ADC.B $14 : STA.W $0B8C,X 
    LDA.W $0B64,X : ADC.B $12 : STA.W $0B64,X 
    BRA .return 


.bounceLeft:
    ORA.W #$8000 
    STA.W $0BDC,X 
    LDA.W $0B8C,X : SEC : SBC.B $14 : STA.W $0B8C,X 
    LDA.W $0B64,X : SBC.B $12 : STA.W $0B64,X 

.return:
    RTS 


ProjectilePreInstruction_WaveSBA:
    LDA.W $0C04,X 
    BIT.W #$00F0 
    BNE .deleted 
    DEC.W $0BF0,X 
    BEQ .deleted 
    BPL .alive 

.deleted:
    LDA.W #$0029 
    JSL.L QueueSound_Lib1_Max6 
    JSL.L Clear_Projectile 
    RTS 


.alive:
    LDA.W $0BDC,X : STA.B $22 
    LDA.W $0C7C,X : STA.B $24 
    DEC.W $0C90,X 
    BNE .checkCrossingRightToLeft 
    LDA.W #$0004 : STA.W $0C90,X 
    JSL.L Spawn_ProjectileTrail 
    LDX.W $0DDE 

.checkCrossingRightToLeft:
    LDA.W $0AF6 
    CMP.W $0B64,X 
    BMI .checkCrossingLeftToRight 
    LDA.W $0BDC,X 
    CMP.W #$0800 
    BPL + 
    CLC : ADC.W #$0040 : STA.W $0BDC,X 
    BRA + 


.checkCrossingLeftToRight:
    LDA.W $0BDC,X 
    CMP.W #$F801 
    BMI + 
    SEC : SBC.W #$0040 : STA.W $0BDC,X 

  + LDA.W $0BDC,X 
    XBA 
    PHA 
    AND.W #$FF00 
    STA.B $14 
    PLA 
    AND.W #$00FF 
    BIT.W #$0080 
    BEQ + 
    ORA.W #$FF00 

  + STA.B $12 
    LDA.W $0B8C,X : CLC : ADC.B $14 : STA.W $0B8C,X 
    LDA.W $0B64,X : ADC.B $12 : STA.W $0B64,X 
    LDA.W $0AFA 
    CMP.W $0B78,X 
    BMI .checkYVelocity 
    LDA.W $0C7C,X 
    CMP.W #$0800 
    BPL .notMaxYVelocity 
    CLC : ADC.W #$0040 : STA.W $0C7C,X 
    BRA .notMaxYVelocity 


.checkYVelocity:
    LDA.W $0C7C,X 
    CMP.W #$F801 
    BMI .notMaxYVelocity 
    SEC : SBC.W #$0040 : STA.W $0C7C,X 

.notMaxYVelocity:
    LDA.W $0C7C,X 
    XBA 
    PHA 
    AND.W #$FF00 
    STA.B $14 
    PLA 
    AND.W #$00FF 
    BIT.W #$0080 
    BEQ + 
    ORA.W #$FF00 

  + STA.B $12 
    LDA.W $0BA0,X : CLC : ADC.B $14 : STA.W $0BA0,X 
    LDA.W $0B78,X : ADC.B $12 : STA.W $0B78,X 
    CPX.W #$0006 
    BNE .return 
    LDA.W $0BDC,X 
    BMI .negativeXVelocity 
    LDA.B $22 
    BPL .return 
    BRA .playSFX 


.negativeXVelocity:
    LDA.B $22 
    BMI .return 

.playSFX:
    LDA.W #$0028 
    JSL.L QueueSound_Lib1_Max6 

.return:
    LDA.W #$0002 : STA.W $0CCC 
    STZ.W $0CD0 
    RTS 


ProjectilePreInstruction_SpazerSBA:
    LDA.W $0C04,X 
    AND.W #$00F0 
    BEQ .notDeleted 
    JSR.W (.clearing,X) 
    RTS 


.notDeleted:
    DEC.W $0C90,X 
    BNE .timerNotExpired 
    LDA.W #$0004 : STA.W $0C90,X 
    JSL.L Spawn_ProjectileTrail 
    LDX.W $0DDE 

.timerNotExpired:
    LDA.W $0C7C,X 
    TAY 
    LDA.W $0BDC,X 
    JSR.W Math_90CC39 
    LDA.W $0AF6 : CLC : ADC.B $14 : STA.W $0B64,X 
    TXY 
    LDA.W $0CA4,X 
    TAX 
    JSR.W (.phases,X) 
    LDA.W #$0002 : STA.W $0CCC 
    STZ.W $0CD0 
    RTS 


.phases:
    dw SpazerSBA_Phase0_Circling 
    dw SpazerSBA_Phase2_FlyingUpTowardsPoint 
    dw SpazerSBA_Phase4_FlyingUpAwayFromPoint 

.clearing:
    dw ClearSpazerSBAPair_0 
    dw ClearSpazerSBAPair_2 
    dw ClearSpazerSBAPair_4 
    dw ClearSpazerSBAPair_6 

ClearSpazerSBAPair_0:
    JSL.L Clear_Projectile 
    LDX.W #$0004 
    JSL.L Clear_Projectile 
    LDX.W #$0000 
    RTS 


ClearSpazerSBAPair_2:
    JSL.L Clear_Projectile 
    LDX.W #$0006 
    JSL.L Clear_Projectile 
    LDX.W #$0002 
    RTS 


ClearSpazerSBAPair_4:
    JSL.L Clear_Projectile 
    LDX.W #$0000 
    JSL.L Clear_Projectile 
    LDX.W #$0004 
    RTS 


ClearSpazerSBAPair_6:
    JSL.L Clear_Projectile 
    LDX.W #$0002 
    JSL.L Clear_Projectile 
    LDX.W #$0006 
    RTS 


SpazerSBA_Phase0_Circling:
    LDA.W $0AFA : CLC : ADC.B $16 : STA.W $0B78,Y 
    LDA.W $0C7C,Y : CLC : ADC.W $0BF0,Y : AND.W #$00FF 
    STA.W $0C7C,Y 
    CMP.W #$0080 
    BNE .return 
    LDA.W #$00A0 : STA.W $0BDC,Y 
    LDA.W .angleDeltas,Y : STA.W $0BF0,Y 
    LDA.W #$0000 : STA.W $0C04,Y 
    LDA.W #$0002 : STA.W $0CA4,Y 

.return:
    RTS 


.angleDeltas:
    dw $0002,$FFFE,$0002,$FFFE 

SpazerSBA_Phase2_FlyingUpTowardsPoint:
    LDA.W $0AFA : SEC : SBC.W #$0072 : CLC : ADC.B $16 : STA.W $0B78,Y 
    SEC : SBC.W $0915 : CMP.W #$0010 
    BPL + 
    JSR.W FireEndOfSpazerSBA 
    RTS 


  + LDA.W $0C7C,Y : CLC : ADC.W $0BF0,Y : AND.W #$00FF 
    STA.W $0C7C,Y 
    LDA.W $0BDC,Y : SEC : SBC.W #$0005 : STA.W $0BDC,Y 
    BNE .return 
    LDA.W .angleDeltas,Y : STA.W $0BF0,Y 
    LDA.W $0C7C,Y : CLC : ADC.W #$0080 : AND.W #$00FF 
    STA.W $0C7C,Y 
    LDA.W #$0004 : STA.W $0CA4,Y 
    CPY.W #$0000 
    BNE .return 
    LDA.W #$0026 
    JSL.L QueueSound_Lib1_Max6 

.return:
    RTS 


.angleDeltas:
    dw $FFFE,$0002,$FFFE,$0002 

SpazerSBA_Phase4_FlyingUpAwayFromPoint:
    LDA.W $0AFA : SEC : SBC.W #$0072 : CLC : ADC.B $16 : STA.W $0B78,Y 
    SEC : SBC.W $0915 : CMP.W #$0010 
    BPL .onScreen 

.fireSBAEnd:
    JSR.W FireEndOfSpazerSBA 
    RTS 


.onScreen:
    LDA.W $0C7C,Y : CLC : ADC.W $0BF0,Y : AND.W #$00FF 
    STA.W $0C7C,Y 
    LDA.W $0BDC,Y : CLC : ADC.W #$0005 : STA.W $0BDC,Y 
    CMP.W #$0060 
    BPL .fireSBAEnd 
    RTS 


FireEndOfSpazerSBA:
    LDA.W $0B64,Y : CLC : ADC.W .data,Y : STA.W $0B64,Y 
    LDA.W #$0005 : STA.W $0C04,Y 
    LDA.W #$0004 : STA.W $0C90,Y 
    LDA.W #ProjectilePreInstruction_EndOfSpazerSBA : STA.W $0C68,Y 
    CPY.W #$0004 
    BPL .return 
    LDA.W #$8024 : STA.W $0C18,Y 
    TYX 
    JSL.L Initialize_ShinesparkEcho_or_SpazerSBATrailProjectile 

.return:
    RTS 


.data:
    dw $0010,$0010,$FFF0,$FFF0 

ProjectilePreInstruction_EndOfSpazerSBA:
    LDA.W $0C04,X 
    AND.W #$00F0 
    BEQ .notDeleted 
    JSL.L Clear_Projectile 
    RTS 


.notDeleted:
    DEC.W $0C90,X 
    BNE .timerNotExpired 
    LDA.W #$0004 : STA.W $0C90,X 
    JSL.L Spawn_ProjectileTrail 
    LDX.W $0DDE 

.timerNotExpired:
    LDA.W $0B78,X : CLC : ADC.W #$0008 : STA.W $0B78,X 
    SEC : SBC.W $0915 : CMP.W #$00F8 
    BMI + 
    JSL.L Clear_Projectile 
    RTS 


  + LDA.W #$0002 : STA.W $0CCC 
    STZ.W $0CD0 
    RTS 


HandleHUDSpecificBehaviorAndProjectiles:
    PHP 
    REP #$30 
    LDA.W $0A1C 
    BEQ .facingForward 
    CMP.W #$009B 
    BEQ .facingForward 
    JSR.W Handle_Samus_Cooldown 
    JSR.W HandleSwitchingHUDSelection 
    LDA.W $0A1F 
    AND.W #$00FF 
    ASL A 
    TAX 
    JSR.W (.pointers,X) 
    LDA.W $0A78 
    BNE .return 

.facingForward:
    JSR.W Handle_Projectiles 

.return:
    PLP 
    RTS 


.pointers:
    dw HUDSelectionHandler_Standard 
    dw HUDSelectionHandler_Standard 
    dw HUDSelectionHandler_Standard 
    dw HUDSelectionHandler_SpinWallJump_Knockback_Shinespark_CF_etc 
    dw HUDSelectionHandler_MorphBall 
    dw HUDSelectionHandler_Standard 
    dw HUDSelectionHandler_Standard 
    dw HUDSelectionHandler_MorphBall 
    dw HUDSelectionHandler_MorphBall 
    dw HUDSelectionHandler_MorphBall 
    dw HUDSelectionHandler_SpinWallJump_Knockback_Shinespark_CF_etc 
    dw HUDSelectionHandler_Grappling 
    dw HUDSelectionHandler_Grappling 
    dw HUDSelectionHandler_SpinWallJump_Knockback_Shinespark_CF_etc 
    dw HUDSelectionHandler_TurningAround 
    dw HUDSelectionHandler_TransitionPoses 
    dw HUDSelectionHandler_Standard 
    dw HUDSelectionHandler_MorphBall 
    dw HUDSelectionHandler_MorphBall 
    dw HUDSelectionHandler_MorphBall 
    dw HUDSelectionHandler_SpinWallJump_Knockback_Shinespark_CF_etc 
    dw HUDSelectionHandler_Standard 
    dw HUDSelectionHandler_Grappling 
    dw HUDSelectionHandler_TurningAround 
    dw HUDSelectionHandler_TurningAround 
    dw HUDSelectionHandler_SpinWallJump_Knockback_Shinespark_CF_etc 
    dw HUDSelectionHandler_GrabbedByDraygon 
    dw HUDSelectionHandler_SpinWallJump_Knockback_Shinespark_CF_etc 

HUDSelectionHandler_Standard:
    PHP 
    REP #$30 
    LDA.W $0D32 
    CMP.W #GrappleBeamFunction_Inactive 
    BEQ .notFiringGrapple 
    LDX.W #$0008 
    BRA .execute 


.notFiringGrapple:
    LDA.W $0A78 
    BEQ .Xray 
    LDX.W #$000A 
    BRA .execute 


.Xray:
    LDA.W $09D2 
    ASL A 
    TAX 

.execute:
    JSR.W (.pointers,X) 
    PLP 
    RTS 


.pointers:
    dw HUDSelectionHandler_Nothing_PowerBombs 
    dw HUDSelectionHandler_Missiles_SuperMissiles 
    dw HUDSelectionHandler_Missiles_SuperMissiles 
    dw HUDSelectionHandler_Nothing_PowerBombs 
    dw HUDSelectionHandler_Grappling 
    dw HUDSelectionHandler_Xray 
    dw HUDSelectionHandler_TurningAround 

HUDSelectionHandler_Grappling:
    JSL.L GrappleBeamHandler 
    RTS 


HUDSelectionHandler_TurningAround:
    LDA.W $0B5E 
    BEQ .notShooting 
    JSR.W HUDSelectionHandler_Standard 
    RTS 


.notShooting:
    LDA.W $0D32 
    CMP.W #GrappleBeamFunction_Inactive 
    BEQ .return 
    LDA.W #GrappleBeamFunction_HitNothing_Cancel : STA.W $0D32 

.return:
    RTS 


HUDSelectionHandler_TransitionPoses:
    LDA.W $0A1C 
    CMP.W #$00F1 
    BPL .standard 
    CMP.W #$00DB 
    BPL .return 
    SEC : SBC.W #$0035 : TAX 
    LDA.W .flags,X 
    AND.W #$00FF 
    BNE HUDSelectionHandler_SpinWallJump_Knockback_Shinespark_CF_etc 

.standard:
    JSR.W HUDSelectionHandler_Standard 

.return:
    RTS 


.flags:
    db $00,$00,$01,$01,$01,$01,$00,$00,$01,$01,$01,$01 

HUDSelectionHandler_SpinWallJump_Knockback_Shinespark_CF_etc:
    LDA.W $0D32 
    CMP.W #GrappleBeamFunction_Inactive 
    BEQ .return 
    LDA.W #GrappleBeamFunction_HitNothing_Cancel : STA.W $0D32 
    JSR.W HUDSelectionHandler_Standard 

.return:
    RTS 


HUDSelectionHandler_Xray:
    LDA.B $8B 
    BIT.W $09B6 
    BNE .Xray 
    JSR.W HUDSelectionHandler_Nothing_PowerBombs 
    RTS 


.Xray:
    JSL.L XrayHandler 
    RTS 


HUDSelectionHandler_GrabbedByDraygon:
    LDA.W $0A1C 
    CMP.W #$00DF 
    BEQ .morphBall 
    JSR.W HUDSelectionHandler_Standard 
    BRA .return 


.morphBall:
    JSR.W HUDSelectionHandler_MorphBall 

.return:
    RTS 


SamusIsHit_Interruption:
    PHP 
    REP #$30 
    LDA.W $18AA 
    BEQ .knockbackTimerZero 
    LDA.W $0DE0 
    CMP.W #$0007 
    BMI .notInvincible 
    STZ.W $18A8 
    STZ.W $18AA 
    BRA .returnUpper 


.notInvincible:
    LDA.W $0A78 
    BNE .returnUpper 
    LDA.W $0A52 
    BNE .returnUpper 
    LDA.W $0A1F 
    AND.W #$00FF 
    ASL A 
    TAX 
    JSR.W (.pointers,X) 
    BCC .returnUpper 
    LDA.W #$0001 : STA.W $0A30 

.returnUpper:
    PLP 
    RTS 


.knockbackTimerZero:
    LDA.W $0A52 
    BEQ .noKnockback 
    LDA.W $0A1F 
    AND.W #$00FF 
    CMP.W #$000A 
    BEQ .knockbackMovement 
    LDA.W $0A32 
    CMP.W #$0003 
    BNE .superSpecialProspectivePose 
    LDA.W #$0008 : STA.W $0A32 
    PLP 
    RTS 


.superSpecialProspectivePose:
    LDA.W $0A1C : STA.W $0A2C 
    BRA .knockbackFinished 


.knockbackMovement:
    LDA.W $0CD0 
    CMP.W #$0010 
    BMI .lessThan10 
    LDA.W #$0041 
    JSL.L QueueSound_Lib1_Max6 

.lessThan10:
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0004 
    BEQ .facingLeft 
    LDA.W #$0029 : STA.W $0A2C 
    BRA .knockbackFinished 


.facingLeft:
    LDA.W #$002A : STA.W $0A2C 

.knockbackFinished:
    LDA.W #$0001 : STA.W $0A32 
    PLP 
    RTS 


.noKnockback:
    LDA.W $0A56 
    BEQ .returnLower 
    JSR.W SerupBombJump 

.returnLower:
    PLP 
    RTS 


.pointers:
    dw KnockbackTransition_Normal 
    dw KnockbackTransition_Normal 
    dw KnockbackTransition_Normal 
    dw KnockbackTransition_Normal 
    dw KnockbackTransition_Morphed 
    dw KnockbackTransition_Normal 
    dw KnockbackTransition_Normal_Falling 
    dw UNUSED_KnockbackTransition_Movement7_90DF1D 
    dw KnockbackTransition_Morphed 
    dw KnockbackTransition_Morphed 
    dw KnockbackTransition_Ignore 
    dw KnockbackTransition_Ignore_ClearDirection 
    dw KnockbackTransition_Ignore_ClearDirection 
    dw KnockbackTransition_Normal 
    dw KnockbackTransition_Ignore_ClearDirection 
    dw KnockbackTransition_Ignore_ClearDirection 
    dw KnockbackTransition_Normal 
    dw KnockbackTransition_Morphed 
    dw KnockbackTransition_Morphed 
    dw KnockbackTransition_Morphed 
    dw KnockbackTransition_Normal 
    dw KnockbackTransition_Normal 
    dw KnockbackTransition_Ignore 
    dw KnockbackTransition_Ignore_ClearDirection 
    dw KnockbackTransition_Ignore_ClearDirection 
    dw KnockbackTransition_Ignore_ClearDirection 
    dw KnockbackTransition_Ignore_ClearDirection 
    dw KnockbackTransition_SetSamusDrainedHurtAnimation_OrIgnore 

KnockbackTransition_SetSamusDrainedHurtAnimation_OrIgnore:
    LDA.W $0A1C 
    CMP.W #$00E8 
    BEQ .drainedCrouchingFalling 
    CMP.W #$00E9 
    BEQ .drainedCrouchingFalling 
    BRA .return 


.drainedCrouchingFalling:
    LDA.W #$0011 : STA.W $0A94 
    LDA.W #$001A : STA.W $0A96 

.return:
    STZ.W $0A30 
    STZ.W $0A52 
    CLC 
    RTS 


KnockbackTransition_Ignore:
    STZ.W $0A30 
    CLC 
    RTS 


KnockbackTransition_Ignore_ClearDirection:
    STZ.W $0A30 
    STZ.W $0A52 
    CLC 
    RTS 


KnockbackTransition_Normal_Falling:
    LDA.W $0A5A 
    CMP.W #UNUSED_SamusTimerHackHandler_SpecialFalling_90E41B 
    BNE KnockbackTransition_Normal 
    STZ.W $0A30 
    STZ.W $0A52 
    CLC 
    RTS 


KnockbackTransition_Normal:
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0004 
    BEQ .facingLeft 
    LDA.W #$0053 : STA.W $0A2A 
    BRA .return 


.facingLeft:
    LDA.W #$0054 : STA.W $0A2A 

.return:
    SEC 
    RTS 


KnockbackTransition_Morphed:
    LDA.W $0A1C : STA.W $0A2A 
    SEC 
    RTS 


UNUSED_KnockbackTransition_Movement7_90DF1D:
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0004 
    BEQ .facingLeft 
    LDA.W #$0033 : STA.W $0A2A 
    BRA .return 


.facingLeft:
    LDA.W #$0034 : STA.W $0A2A 

.return:
    SEC 
    RTS 


SamusMovementHandler_Knockback:
    LDA.W $0A52 
    ASL A 
    TAX 
    JSR.W (.pointers,X) 
    STZ.W $0DC6 
    RTS 


.pointers:
    dw ZeroIndex_Crash 
    dw KnockbackMoement_Up 
    dw KnockbackMoement_Up 
    dw UNUSED_KnockbackMoement_StraightUp_90DF5D 
    dw KnockbackMoement_Down 
    dw KnockbackMoement_Down 

ZeroIndex_Crash:
    BRA ZeroIndex_Crash 

    RTS ; >.<


KnockbackMoement_Up:
    JSR.W MoveSamus_Horizontally_KnockbackBombJump 
    JSR.W Samus_Y_Movement_WithSpeedCalculations 
    JSR.W HandleKnockbackVerticalCollision 
    RTS 


UNUSED_KnockbackMoement_StraightUp_90DF5D:
    JSR.W Samus_Y_Movement_WithSpeedCalculations 
    JSR.W HandleKnockbackVerticalCollision 
    RTS 


KnockbackMoement_Down:
    JSR.W MoveSamus_Horizontally_KnockbackBombJump 
    JSR.W Samus_Y_Movement_NoSpeedCalculations 
    JSR.W HandleKnockbackVerticalCollision 
    RTS 


HandleKnockbackVerticalCollision:
    LDA.W $0DD0 
    BEQ .return 
    STZ.W $0B4A 
    STZ.W $0DCE 
    STZ.W $0B22 
    STZ.W $0B1A 
    STZ.W $0B2A 
    STZ.W $0B2C 
    STZ.W $0B2E 
    STZ.W $0B36 
    STZ.W $0B38 
    STZ.W $0B46 
    STZ.W $0B48 
    JSL.L AlignSamusBottomPositionWithPreviousPose 

.return:
    RTS 


SerupBombJump:
    LDA.W $0A56 
    BIT.W #$FF00 
    BNE .return 
    LDA.W $0A1F 
    AND.W #$00FF 
    ASL A 
    TAX 
    JSR.W (.pointers,X) 
    BCC .return 
    LDA.W #$0003 : STA.W $0A30 

.return:
    RTS 


.pointers:
    dw SetupBombJump_Standing_Crouching 
    dw SetupBombJump_Run_Fall_Moonwalk_WallJump_RanIntoWall_Grapple 
    dw SetupBombJump_Jumping_Turning_DamageBoost_TransitionPoses 
    dw SetupBombJump_Jumping_Turning_DamageBoost_TransitionPoses 
    dw SetupBombJump_Morphed_Knockback_CrystalFlashEnding 
    dw SetupBombJump_Standing_Crouching 
    dw SetupBombJump_Run_Fall_Moonwalk_WallJump_RanIntoWall_Grapple 
    dw SetupBombJump_Morphed_Knockback_CrystalFlashEnding 
    dw SetupBombJump_Morphed_Knockback_CrystalFlashEnding 
    dw SetupBombJump_Morphed_Knockback_CrystalFlashEnding 
    dw SetupBombJump_Morphed_Knockback_CrystalFlashEnding 
    dw SetupBombJump_Run_Fall_Moonwalk_WallJump_RanIntoWall_Grapple 
    dw SetupBombJump_Run_Fall_Moonwalk_WallJump_RanIntoWall_Grapple 
    dw SetupBombJump_Run_Fall_Moonwalk_WallJump_RanIntoWall_Grapple 
    dw SetupBombJump_Jumping_Turning_DamageBoost_TransitionPoses 
    dw SetupBombJump_Jumping_Turning_DamageBoost_TransitionPoses 
    dw SetupBombJump_Run_Fall_Moonwalk_WallJump_RanIntoWall_Grapple 
    dw SetupBombJump_Morphed_Knockback_CrystalFlashEnding 
    dw SetupBombJump_Morphed_Knockback_CrystalFlashEnding 
    dw SetupBombJump_Morphed_Knockback_CrystalFlashEnding 
    dw SetupBombJump_Run_Fall_Moonwalk_WallJump_RanIntoWall_Grapple 
    dw SetupBombJump_Run_Fall_Moonwalk_WallJump_RanIntoWall_Grapple 
    dw SetupBombJump_Run_Fall_Moonwalk_WallJump_RanIntoWall_Grapple 
    dw SetupBombJump_Jumping_Turning_DamageBoost_TransitionPoses 
    dw SetupBombJump_Jumping_Turning_DamageBoost_TransitionPoses 
    dw SetupBombJump_Jumping_Turning_DamageBoost_TransitionPoses 
    dw SetupBombJump_DraygonGrab_Shinespark_CF_Drained_DamagedMB 
    dw SetupBombJump_DraygonGrab_Shinespark_CF_Drained_DamagedMB 

SetupBombJump_Standing_Crouching:
    LDA.W $0A78 
    BEQ SetupBombJump_Run_Fall_Moonwalk_WallJump_RanIntoWall_Grapple 
    STZ.W $0A56 
    CLC 
    RTS 


SetupBombJump_Run_Fall_Moonwalk_WallJump_RanIntoWall_Grapple:
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0004 
    BEQ .facingLeft 
    LDA.W #$0051 : STA.W $0A2A 
    BRA .returnCarrySet 


.facingLeft:
    LDA.W #$0052 : STA.W $0A2A 

.returnCarrySet:
    SEC 
    RTS 


SetupBombJump_Morphed_Knockback_CrystalFlashEnding:
    LDA.W $0A1C : STA.W $0A2A 
    SEC 
    RTS 


SetupBombJump_Jumping_Turning_DamageBoost_TransitionPoses:
    LDA.W #SamusPoseInputHandler_Normal : STA.W $0A60 ; fallthrough to SetupBombJump_DraygonGrab_Shinespark_CF_Drained_DamagedMB

SetupBombJump_DraygonGrab_Shinespark_CF_Drained_DamagedMB:
    STZ.W $0A56 
    CLC 
    RTS 


SamusMovementHandler_BombJump_Start:
    JSR.W Make_Samus_BombJump 
    LDA.W #SamusMovementHandler_BombJump_Main : STA.W $0A58 
    STZ.W $0DC6 
    RTS 


SamusMovementHandler_BombJump_Main:
    LDA.W $0A56 
    BNE .directionAssigned 
    JSR.W EndBombJump 
    RTS 


.directionAssigned:
    AND.W #$00FF 
    ASL A 
    TAX 
    JSR.W (.pointers,X) 
    RTS 


.pointers:
    dw ZeroIndex_Crash 
    dw SamusMovementHandler_BombJump_Main_Horizontal 
    dw SamusMovementHandler_BombJump_Main_Straight 
    dw SamusMovementHandler_BombJump_Main_Horizontal 

SamusMovementHandler_BombJump_Main_Horizontal:
    JSR.W MoveSamus_Horizontally_KnockbackBombJump 
    JSR.W Handle_EndOfBombJump 
    LDA.W $0B36 
    CMP.W #$0002 
    BEQ .end 
    JSR.W Samus_Y_Movement_WithSpeedCalculations 
    LDA.W $0DD0 
    BEQ .return 

.end:
    JSR.W EndBombJump 

.return:
    RTS 


SamusMovementHandler_BombJump_Main_Straight:
    JSR.W Handle_EndOfBombJump 
    LDA.W $0B36 
    CMP.W #$0002 
    BEQ .end 
    JSR.W Samus_Y_Movement_WithSpeedCalculations 
    LDA.W $0DD0 
    BEQ .return 

.end:
    JSR.W EndBombJump 

.return:
    RTS 


EndBombJump:
    LDA.W #SamusMovementHandler_Normal : STA.W $0A58 
    LDA.W $0A60 
    CMP.W #SamusPoseInputHandler_Demo 
    BEQ .notDemo 
    LDA.W #SamusPoseInputHandler_Normal : STA.W $0A60 

.notDemo:
    STZ.W $0A56 
    RTS 


DraygonEscapeButtonCounterTarget:
    dw $003C 

SamusTimerHackHandler:
    JMP.W ($0A5A) 


RTS_90E09A:
    RTS 


SamusTimerHackHandler_HandleLettingSamusUpFromBeingDrained:
    LDA.W $0A1C 
    CMP.W #$00E9 
    BNE .return 
    LDA.W $0A96 
    CMP.W #$0008 
    BMI .return 
    LDA.B $8F 
    BIT.W #$0800 
    BEQ .return 
    LDA.W #$0001 : STA.W $0A94 
    LDA.W #$000D : STA.W $0A96 
    LDA.W #RTS_90E90E : STA.W $0A5A 

.return:
    RTS 


SamusTimerHackHandler_LetSamusFailToStandUpFromBeingDrained:
    LDA.W $0A96 
    CMP.W #$0008 
    BMI .return 
    CMP.W #$000C 
    BPL .return 
    LDA.B $8F 
    BIT.W #$0800 
    BEQ .return 
    LDA.W #$0001 : STA.W $0A94 
    LDA.W #$0012 : STA.W $0A96 

.return:
    RTS 


SamusTimerHackHandler_HandleTimer:
    JSL.L ProcessTimer 
    BCC .timerNotExpired 
    LDA.W #$0023 : STA.W $0998 
    LDX.W #$01FE 
    LDA.W #$7FFF 

.loop:
    STA.L $7EC200,X 
    DEX #2
    BPL .loop 
    LDA.W #SamusTimerHackHandler_DrawTimer : STA.W $0A5A 
    JSL.L Disable_PaletteFXObjects 

.timerNotExpired:
    LDA.W $0943 
    BEQ .return 
    JSL.L DrawTimer 

.return:
    RTS 


SamusTimerHackHandler_DrawTimer:
    JSL.L DrawTimer 
    RTS 


SetSamusToBePushedOutOfCeresRidleysWay:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    LDA.W #RTS_90E90E : STA.W $0A58 
    LDA.W #SamusTimerHackHandler_PushSamusOutOfCeresRidleysWay : STA.W $0A5A 
    PLB 
    PLP 
    RTL 


SamusTimerHackHandler_PushSamusOutOfCeresRidleysWay:
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0004 
    BEQ .facingLeft 
    LDA.W #$0053 : STA.W $0A1C 
    BRA + 


.facingLeft:
    LDA.W #$0054 : STA.W $0A1C 

  + JSL.L InitializeSamusPose_1 
    JSL.L Set_Samus_AnimationFrame_if_PoseChanged 
    LDA.W $0A20 : STA.W $0A24 
    LDA.W $0A22 : STA.W $0A26 
    LDA.W $0A1C : STA.W $0A20 
    LDA.W $0A1E : STA.W $0A22 
    LDA.W #$0015 : SEC : SBC.W $0B00 : STA.B $12 
    LDA.W $0AFA : SEC : SBC.B $12 : STA.W $0AFA 
    LDA.W $0AF6 : SEC : SBC.W $0911 : CMP.W #$0080 
    BMI .pushLeft 
    LDA.W #$0002 : STA.W $0A62 
    BRA + 


.pushLeft:
    LDA.W #$0001 : STA.W $0A62 

  + LDA.W #$0005 : STA.W $0B2E 
    STZ.W $0B2C 
    STZ.W $0A56 
    LDA.W #SamusTimerHackHandler_PushingSmausOutOfCeresRidleysWay : STA.W $0A5A 
    LDA.W #$FFFF : STA.W $0A28 
    STA.W $0A2A 
    STA.W $0A2C 
    STZ.W $0A2E 
    STZ.W $0A30 
    STZ.W $0A32 
    JSL.L ProcessTimer 
    LDA.W $0943 
    BEQ .return 
    JSL.L DrawTimer 

.return:
    RTS 


SamusTimerHackHandler_PushingSmausOutOfCeresRidleysWay:
    LDA.W $0A28 
    CMP.W #$004F 
    BEQ .damageBoost 
    CMP.W #$0050 
    BNE .notDamageBoost 

.damageBoost:
    LDA.W #$FFFF : STA.W $0A28 
    STZ.W $0A2E 

.notDamageBoost:
    LDA.W $0A62 
    ASL A 
    TAX 
    JSR.W (.pointers,X) 
    STZ.W $0DC6 
    JSL.L ProcessTimer 
    LDA.W $0943 
    BEQ .return 
    JSL.L DrawTimer 

.return:
    RTS 


.pointers:
    dw $0000 
    dw PushingSamusOutOfCeresRidleysWay_Leftwards 
    dw PushingSamusOutOfCeresRidleysWay_Rightwards 

PushingSamusOutOfCeresRidleysWay_Leftwards:
    JSR.W MoveSamus_Horizontally_PushedByCeresRidley 
    LDA.W $0DD0 
    BEQ .vertical 
    LDA.W #SamusMovementHandler_Normal : STA.W $0A58 
    LDA.W #SamusTimerHackHandler_HandleTimer : STA.W $0A5A 
    STZ.W $0A62 
    JSR.W HandleKnockbackVerticalCollision 
    RTS 


.vertical:
    JSR.W MoveSamus_Vertically_PushedByCeresRidley 
    RTS 


PushingSamusOutOfCeresRidleysWay_Rightwards:
    JSR.W MoveSamus_Horizontally_PushedByCeresRidley 
    LDA.W $0DD0 
    BEQ .vertical 
    LDA.W #SamusMovementHandler_Normal : STA.W $0A58 
    LDA.W #SamusTimerHackHandler_HandleTimer : STA.W $0A5A 
    STZ.W $0A62 
    JSR.W HandleKnockbackVerticalCollision 
    RTS 


.vertical:
    JSR.W MoveSamus_Vertically_PushedByCeresRidley 
    RTS 


SetSamusIntoTheGrabbedByDraygonPose:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    BIT.W #$0001 
    BEQ .facingLeft 
    LDA.W #$00EC : STA.W $0A1C 
    BRA .merge 


.facingLeft:
    LDA.W #$00BA : STA.W $0A1C 

.merge:
    JSL.L InitializeSamusPose_1 
    JSL.L Set_Samus_AnimationFrame_if_PoseChanged 
    LDA.W #SamusTimerHackHandler_GrabbedByDraygon : STA.W $0A5A 
    LDA.W #RTS_90E90E : STA.W $0A58 
    STZ.W $0DEC 
    STZ.W $0DEE 
    STZ.W $0DF0 
    LDA.W $0A20 : STA.W $0A24 
    LDA.W $0A22 : STA.W $0A26 
    LDA.W $0A1C : STA.W $0A20 
    LDA.W $0A1E : STA.W $0A22 
    LDA.W #$FFFF : STA.W $0A28 
    STA.W $0A2A 
    STA.W $0A2C 
    STZ.W $0A2E 
    STZ.W $0A30 
    STZ.W $0A32 
    PLB 
    PLP 
    RTL 


SamusTimerHackHandler_GrabbedByDraygon:
    LDA.W $0D32 
    CMP.W #GrappleBeamFunction_Connected_LockedInPlace 
    BNE .escape 
    LDA.W #$FFFF : STA.W $0A28 
    STZ.W $0A2E 
    BRA .escape 


.return:
    RTS 


.escape:
    LDA.B $8F 
    AND.W #$0F00 
    BEQ .return 
    CMP.W $0DEE 
    BEQ .return 
    STA.W $0DEE 
    LDA.W $0DEC 
    INC A 
    STA.W $0DEC 
    CMP.W DraygonEscapeButtonCounterTarget 
    BMI .return 
    JSR.W ReleaseSamusFromDraygon 
    RTS 


ReleaseSamusFromDraygon_external:
    PHP 
    PHB 
    PHK 
    PLB 
    JSR.W ReleaseSamusFromDraygon 
    PLB 
    PLP 
    RTL 


ReleaseSamusFromDraygon:
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0004 
    BEQ .facingLeft 
    LDA.W #$0001 : STA.W $0A1C 
    BRA Merge 


.facingLeft:
    LDA.W #$0002 : STA.W $0A1C 

Merge:
    JSL.L InitializeSamusPose_1 
    JSL.L Set_Samus_AnimationFrame_if_PoseChanged 
    LDA.W #SamusMovementHandler_Normal : STA.W $0A58 
    LDA.W #RTS_90E90E : STA.W $0A5A 
    LDA.W $0A20 : STA.W $0A24 
    LDA.W $0A22 : STA.W $0A26 
    LDA.W $0A1C : STA.W $0A20 
    LDA.W $0A1E : STA.W $0A22 
    STZ.W $0B46 
    STZ.W $0B48 
    LDA.W #$FFFF : STA.W $0A28 
    STA.W $0A2A 
    STA.W $0A2C 
    STZ.W $0A2E 
    STZ.W $0A30 
    STZ.W $0A32 
    STZ.W $0B2E 
    STZ.W $0B2C 
    STZ.W $0B36 
    STZ.W $0B20 
    STZ.W $0B4A 
    LDA.W $0A64 
    AND.W #$FFFD 
    ORA.W #$0002 
    STA.W $0A64 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_90E35A:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    LDA.W #$00C5 : STA.W $0A2A 
    STZ.W $0A30 
    LDA.W #RTS_90E90E : STA.W $0A58 
    LDA.W #RTS_90E37E : STA.W $0A5A 
    LDA.W #RTS_90EBF2 : STA.W $0A5C 
    PLB 
    PLP 
    RTL 


RTS_90E37E:
    RTS 


UNUSED_PushMorphBallSamusOutOfCeresRidleysWay_90E37F:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    LDA.W #$0003 : STA.W $0B2E 
    STZ.W $0B2C 
    LDA.W #$0001 : STA.W $0A62 
    LDA.W #UNUSED_SamusTimerHackHandler_PushMorphBallCeresRidley_90E3A3 : STA.W $0A5A 
    LDA.W #SamusDrawingHandler_Default : STA.W $0A5C 
    PLB 
    PLP 
    RTL 


UNUSED_SamusTimerHackHandler_PushMorphBallCeresRidley_90E3A3:
    JSR.W MoveSamus_Horizontally_PushedByCeresRidley 
    LDA.W $0DD0 
    BNE .disable 
    JSR.W MoveSamus_Vertically_PushedByCeresRidley 
    LDA.W $0DD0 
    BEQ .return 

.disable:
    LDA.W #SamusMovementHandler_Normal : STA.W $0A58 
    LDA.W #RTS_90E90E : STA.W $0A5A 
    STZ.W $0A62 
    JSR.W HandleKnockbackVerticalCollision 
    LDA.W #$0041 : STA.W $0A2A 
    STZ.W $0A30 

.return:
    RTS 


UNUSED_SetSamusSpecialFalling_90E3CF:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0004 
    BEQ .facingLeft 
    LDA.W #$0029 : STA.W $0A2A 
    BRA + 


.facingLeft:
    LDA.W #$002A : STA.W $0A2A 

  + STZ.W $0A30 
    LDA.W #RTS_90E90E : STA.W $0A58 
    LDA.W #UNUSED_SamusTimerHackHandler_SpecialFalling_90E41B : STA.W $0A5A 
    PLB 
    PLP 
    RTL 


UNUSED_ClearSamusSpecialFalling_90E400:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    STZ.W $0B2C 
    STZ.W $0B2E 
    LDA.W #SamusMovementHandler_Normal : STA.W $0A58 
    LDA.W #RTS_90E90E : STA.W $0A5A 
    PLB 
    PLP 
    RTL 
endif ; !FEATURE_KEEP_UNREFERENCED


UNUSED_SamusTimerHackHandler_SpecialFalling_90E41B:
; Looks like a cut-down version of $A58D (Samus movement - falling)
; In particular, this version doesn't do any horizontal movement
; Perhaps it was used for the Maridia elevatube at one point
    LDA.W $0B2E 
    CMP.W #$0005 
    BPL .GreaterThan4 
    LDA.W $0B2C : CLC : ADC.W $0B32 : STA.W $0B2C 
    LDA.W $0B2E : ADC.W $0B34 : STA.W $0B2E 

.GreaterThan4:
    LDA.W $0A1C 
    CMP.W #$0029 
    BEQ .checkPose 
    CMP.W #$002A 
    BEQ .checkPose 
    CMP.W #$0067 
    BEQ .checkPose 
    CMP.W #$0068 
    BEQ .checkPose 
    BRA .return 


.checkPose:
    LDA.W $0B2E 
    CMP.W #$0005 
    BMI .return 
    LDA.W #$0010 : STA.W $0A94 
    LDA.W #$0004 : STA.W $0A96 

.return:
    RTS 


CalculateSamusXDisplacement_ForMovingLeft:
    PHP 
    REP #$30 
    JSR.W CalculateSamusXSpeed 
    STZ.W $0B02 
    LDA.B $12 : EOR.W #$FFFF : STA.B $12 
    LDA.B $14 
    EOR.W #$FFFF 
    INC A 
    STA.B $14 
    BNE + 
    INC.B $12 

  + LDA.W $0B56 : CLC : ADC.B $14 : STA.B $14 
    LDA.W $0B58 : ADC.B $12 : STA.B $12 
    BMI .clamp 
    CMP.W #$0010 
    BPL .maxClamp 
    PLP 
    RTS 


.maxClamp:
    LDA.W #$000F : STA.B $12 
    PLP 
    RTS 


.clamp:
    CMP.W #$FFF1 
    BMI .minClamp 
    PLP 
    RTS 


.minClamp:
    LDA.W #$FFF1 : STA.B $12 
    PLP 
    RTS 


CalculateSamusXDisplacement_ForMovingRight:
    PHP 
    REP #$30 
    JSR.W CalculateSamusXSpeed 
    LDA.W #$0001 : STA.W $0B02 
    LDA.W $0B56 : CLC : ADC.B $14 : STA.B $14 
    LDA.W $0B58 : ADC.B $12 : STA.B $12 
    BMI .clamp 
    CMP.W #$0010 
    BPL .maxClamp 
    PLP 
    RTS 


.maxClamp:
    LDA.W #$000F : STA.B $12 
    PLP 
    RTS 


.clamp:
    CMP.W #$FFF1 
    BMI .minClamp 
    PLP 
    RTS 


.minClamp:
    LDA.W #$FFF1 : STA.B $12 
    PLP 
    RTS 


CalculateSamusXSpeed:
    LDA.W $0A66 
    CMP.W #$0005 
    BMI + 
    LDA.W #$0004 

  + ASL A 
    TAX 
    JMP.W (.pointers,X) 


.pointers:
    dw CalculateSamusXSpeed_Divisor0 
    dw CalculateSamusXSpeed_Divisor1 
    dw CalculateSamusXSpeed_Divisor2 
    dw CalculateSamusXSpeed_Divisor3 
    dw CalculateSamusXSpeed_Divisor4 

CalculateSamusXSpeed_Divisor0:
    LDA.B $14 : CLC : ADC.W $0B44 : STA.B $14 
    STA.W $0DBE 
    LDA.B $12 : ADC.W $0B42 : STA.B $12 
    STA.W $0DBC 
    RTS 


CalculateSamusXSpeed_Divisor1:
    LDA.B $14 : CLC : ADC.W $0B44 : STA.B $14 
    LDA.B $12 : ADC.W $0B42 : XBA 
    LSR A 
    XBA 
    PHA 
    AND.W #$00FF 
    STA.B $12 
    STA.W $0DBC 
    PLA 
    AND.W #$FF00 
    STA.B $16 
    LDA.B $14 
    LSR A 
    CLC : ADC.B $16 : STA.B $14 
    STA.W $0DBE 
    RTS 


CalculateSamusXSpeed_Divisor2:
    LDA.B $14 : CLC : ADC.W $0B44 : STA.B $14 
    LDA.B $12 : ADC.W $0B42 : XBA 
    LSR #2
    XBA 
    PHA 
    AND.W #$00FF 
    STA.B $12 
    STA.W $0DBC 
    PLA 
    AND.W #$FF00 
    STA.B $16 
    LDA.B $14 
    LSR #2
    CLC : ADC.B $16 : STA.B $14 
    STA.W $0DBE 
    RTS 


CalculateSamusXSpeed_Divisor3:
    LDA.B $14 : CLC : ADC.W $0B44 : STA.B $14 
    LDA.B $12 : ADC.W $0B42 : XBA 
    LSR #3
    XBA 
    PHA 
    AND.W #$00FF 
    STA.B $12 
    STA.W $0DBC 
    PLA 
    AND.W #$FF00 
    STA.B $16 
    LDA.B $14 
    LSR #3
    CLC : ADC.B $16 : STA.B $14 
    STA.W $0DBE 
    RTS 


CalculateSamusXSpeed_Divisor4:
    LDA.B $14 : CLC : ADC.W $0B44 : STA.B $14 
    LDA.B $12 : ADC.W $0B42 : XBA 
    LSR #4
    XBA 
    PHA 
    AND.W #$00FF 
    STA.B $12 
    STA.W $0DBC 
    PLA 
    AND.W #$FF00 
    STA.B $16 
    LDA.B $14 
    LSR #4
    CLC : ADC.B $16 : STA.B $14 
    STA.W $0DBE 
    RTS 


Kill_SamusXSpeed_IfCollisionDetected:
    PHP 
    REP #$30 
    LDA.W $0DD0 
    BEQ .noCollision 
    LDA.W $0B02 
    BEQ .left 
    LDA.W #$0008 : STA.W $0DCE 
    BRA .killSpeed 


.left:
    LDA.W #$0004 : STA.W $0DCE 

.killSpeed:
    JSL.L Cancel_SpeedBoosting 
    STZ.W $0B42 
    STZ.W $0B44 
    STZ.W $0B46 
    STZ.W $0B48 
    STZ.W $0B4A 
    BRA .return 


.noCollision:
    STZ.W $0DC6 
    STZ.W $0DCE 

.return:
    PLP 
    RTS 


SetSamusSolidVerticalCollisionResult_UpwardsMovement:
    PHP 
    REP #$30 
    LDA.W $0DD0 
    BEQ .noChange 
    LDA.W #$0004 : STA.W $0DC6 
    BRA .return 


.noChange:
    STZ.W $0DC6 

.return:
    PLP 
    RTS 


SetSamusSolidVerticalCollisionResult_DownwardsMovement:
    PHP 
    REP #$30 
    LDA.W $0DD0 
    BEQ .noCollision 
    LDA.W #$0001 : STA.W $0DC6 
    SEP #$30 
    LDA.W $0A1F 
    TAX 
    LDA.W .data1,X : STA.W $0DC7 
    REP #$30 
    BRA .return 


.noCollision:
    LDA.W $0DC6 
    AND.W #$00FF 
    CMP.W #$0005 
    BEQ .return 
    LDA.W #$0002 : STA.W $0DC6 
    SEP #$30 
    LDA.W $0A1F 
    TAX 
    LDA.W .data0,X : STA.W $0DC7 
    REP #$30 

.return:
    PLP 
    RTS 


.data0:
    db $00,$00,$04,$04,$01,$00,$04,$02,$04,$04,$00,$00,$00,$00,$04,$04 
    db $00,$03,$04,$04,$04,$00,$04,$04,$04,$04,$04,$04 

.data1:
    db $04,$04,$00,$00,$04,$04,$00,$04,$01,$02,$00,$04,$04,$00,$04,$04 
    db $04,$04,$03,$03,$00,$04,$04,$04,$04,$00,$04,$04 

SamusCurrentStateHandler:
    JMP.W ($0A42) 


SamusCurrentStateHandler_Normal:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    LDA.W #$FFFF : STA.W $0A28 
    STA.W $0A2A 
    STA.W $0A2C 
    STZ.W $0A2E 
    STZ.W $0A30 
    STZ.W $0A32 
    JSR.W SetSamusRadius 
    JSR.W SamusPoseInputHandler 
    JSR.W Determine_SamusSuitPalette_Index 
    JSR.W Determine_Samus_YAcceleration 
    JSL.L SamusBlockInsideHandling 
    JSR.W HandleHUDSpecificBehaviorAndProjectiles 
    JSR.W ResetMovementAndPoseChangeVariables 
    PLB 
    PLP 
    RTL 


SamusCurrentStateHandler_Demo:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    LDA.W #$FFFF : STA.W $0A28 
    STA.W $0A2A 
    STA.W $0A2C 
    STZ.W $0A2E 
    STZ.W $0A30 
    STZ.W $0A32 
    LDA.B $8B : STA.W $0A14 
    LDA.B $8F : STA.W $0A16 
    LDA.W $0DFE : STA.W $0A90 
    LDA.W $0E00 : STA.W $0A92 
    JSR.W SetSamusRadius 
    JSR.W Determine_SamusSuitPalette_Index 
    JSR.W SamusPoseInputHandler 
    JSR.W Determine_Samus_YAcceleration 
    JSL.L SamusBlockInsideHandling 
    JSR.W HandleHUDSpecificBehaviorAndProjectiles 
    JSR.W ResetMovementAndPoseChangeVariables 
    PLB 
    PLP 
    RTL 


SamusCurrentStateHandler_SamusIsLocked:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    JSR.W Handle_Projectiles 
    JSR.W ResetMovementAndPoseChangeVariables 
    PLB 
    PLP 
    RTL 


SamusNewStateHandler:
    JMP.W ($0A44) 


SamusNewStateHandler_Normal:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    JSR.W DebugCommandHandler 
    STZ.W $0A6E 
    JSR.W Execute_SamusMovementHandler 
    JSL.L Update_Minimap 
    JSR.W SamusTimerHackHandler 
    JSR.W AnimateSamus 
    JSR.W SamusIsHit_Interruption 
    JSL.L SetProspectiveSamusPoseAccordingToSolidVerticalCollision_PSP 
    JSL.L UpdateSamusPose 
    JSL.L HandleSamusPalette 
    JSR.W HandlePeriodicDamageToSamus 
    JSR.W PauseCheck 
    JSR.W LowEnergyCheck 
    PLB 
    PLP 
    RTL 

    LDA.W $09E6 ; Demo recorder. Remove the three instructions above and set DebugConst_DemoRecorder at $808002 to enable
    BNE + 
    LDA.W $0A78 
    BNE + 
    JSR.W DemoRecorder_MoveSamusWithControlPad 

  + LDA.L DebugConst_DemoRecorder 
    BEQ .debugMode 
    JSL.L RecordDemoInputFrame 
    JSL.L Pause_Terminate_Reset_DemoRecorder 

.debugMode:
    JSL.L Debug_HandleSelectL_B 
    BIT.W $05CF 
    BPL .togglePlacementMode 
    JSR.W DemoRecorder_DisplaySamusPositionAsAmmoIfMorphed 

.togglePlacementMode:
    JSR.W HandleSamusPlacementModeToggles 
    PLB 
    PLP 
    RTL 


HandleSamusPlacementModeToggles:
    PHP 
    REP #$30 
    LDA.B $91 
    BIT.W #$8000 
    BEQ .pressedB 
    LDA.W $09E6 
    BEQ .enabled 
    LDA.W #RTS_90E90E : STA.W $0A5C 
    STZ.W $09E6 
    BRA .return 


.enabled:
    LDA.W #$0001 : STA.W $09E6 
    LDA.W #SamusDrawingHandler_Default : STA.W $0A5C 
    BRA .return 


.pressedB:
    LDA.W $09E6 
    BNE .return 
    LDA.B $91 
    BIT.W #$0080 
    BEQ .return 
    JSL.L Disable_Enemy_Projectiles 
    LDA.W #$0001 : STA.W $0A78 
    LDA.W #RTL_90E8CD : STA.W $0A42 
    LDA.W #SamusNewStateHandler_Debug : STA.W $0A44 

.return:
    PLP 
    RTS 


SamusNewStateHandler_Debug:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    LDA.B $91 
    BIT.W #$0080 
    BEQ .return 
    LDA.W #SamusCurrentStateHandler_Normal : STA.W $0A42 
    LDA.W #SamusNewStateHandler_Normal : STA.W $0A44 
    JSL.L Enable_Enemy_Projectiles 
    STZ.W $0A78 

.return:
    PLB 
    PLP 
    RTL 


SamusNewStateHandler_TitleDemo:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    STZ.W $0A6E 
    JSR.W Execute_SamusMovementHandler 
    JSL.L Update_Minimap 
    JSR.W AnimateSamus 
    JSR.W SamusIsHit_Interruption 
    JSL.L SetProspectiveSamusPoseAccordingToSolidVerticalCollision_PSP 
    JSL.L UpdateSamusPose 
    JSL.L HandleSamusPalette 
    JSR.W DebugCommandHandler 
    LDA.W $0A14 : STA.B $8B 
    LDA.W $0A16 : STA.B $8F 
    LDA.W $0A90 : STA.W $0DFE 
    LDA.W $0A92 : STA.W $0E00 
    PLB 
    PLP 
    RTL 


SamusNewStateHandler_IntroDemo:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    STZ.W $0A6E 
    JSR.W Execute_SamusMovementHandler 
    JSR.W AnimateSamus 
    JSR.W SamusIsHit_Interruption 
    JSL.L SetProspectiveSamusPoseAccordingToSolidVerticalCollision_PSP 
    JSL.L UpdateSamusPose 
    JSL.L HandleSamusPalette 
    LDA.W $0A14 : STA.B $8B 
    LDA.W $0A16 : STA.B $8F 
    LDA.W $0A90 : STA.W $0DFE 
    LDA.W $0A92 : STA.W $0E00 
    PLB 
    PLP 
    RTL 


SamusNewStateHandler_SamusAppearance:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    JSR.W SetSamusRadius 
    JSL.L Update_Minimap 
    JSR.W AnimateSamus 
    STZ.W $0E18 
    LDA.W $0AFA : STA.W $0B14 
    JSL.L PlaySamusFanfare 
    BCC .return 
    LDA.W $0DE0 
    CMP.W #$0007 
    BMI .disableInvincibility 
    LDA.B $8D 
    BIT.W #$8000 
    BNE .keepInvincibility 

.disableInvincibility:
    STZ.W $0DE0 

.keepInvincibility:
    LDA.W #SamusCurrentStateHandler_Normal : STA.W $0A42 
    LDA.W #SamusNewStateHandler_Normal : STA.W $0A44 

.return:
    PLB 
    PLP 
    RTL 


SamusNewStateHandler_Ceres:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    JSL.L SamusNewStateHandler_Normal 
    LDA.W $0A5A 
    CMP.W #SamusTimerHackHandler_DrawTimer 
    BNE .return 
    LDA.W $0998 
    CMP.W #$0023 
    BEQ .return 
    LDA.W #$0023 : STA.W $0998 

.return:
    PLB 
    PLP 
    RTL 


RTL_90E8CD:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    PLB 
    PLP 
    RTL 


RTL_90E8D6:
    JMP.W RTL_90E8CD 


RTL_90E8D9:
    JMP.W RTL_90E8CD 


SamusNewStateHandler_SamusIsLocked:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    STZ.W $0A6E 
    JSL.L Update_Minimap 
    PLB 
    PLP 
    RTL 


SamusNewStateHandler_RidingElevator:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    STZ.W $0A6E 
    JSR.W Execute_SamusMovementHandler 
    JSL.L Update_Minimap 
    JSR.W AnimateSamus 
    PLB 
    PLP 
    RTL 


SamusNewStateHandler_EnteringExitingGunship:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    JSR.W LowEnergyCheck 
    PLB 
    PLP 
    RTL 


RTS_90E90E:
    RTS 


SamusPoseInputHandler:
    JMP.W ($0A60) 


RTS_90E912:
    RTS 


SamusPoseInputHandler_Normal:
    JSL.L NormalSamusPoseInputHandler 
    RTS 


SamusPoseInputHandler_Xray:
    JSL.L XraySamusPoseInputHandler 
    RTS 


SamusPoseInputHandler_Demo:
    JSL.L DemoInputObjectHandler 
    JSL.L NormalSamusPoseInputHandler 
    RTS 


SamusPoseInputHandler_AutoJumpHack:
    LDA.B $8F 
    PHA 
    LDA.W $0AF4 
    BEQ .not1Through9 
    CMP.W #$0009 
    BPL .not1Through9 
    LDA.B $8F : ORA.W $09B4 : STA.B $8F 
    STZ.W $0AF4 

.not1Through9:
    JSL.L NormalSamusPoseInputHandler 
    PLA 
    STA.B $8F 
    LDA.W #SamusPoseInputHandler_Normal : STA.W $0A60 
    RTS 


Execute_SamusMovementHandler:
    JMP.W ($0A58) 


RTS_90E94E:
    RTS 


SamusMovementHandler_Xray:
    LDA.W $0A1F 
    AND.W #$00FF 
    CMP.W #$000E 
    BNE .turning 
    RTS 


.turning:
    LDA.W #$000F : STA.W $0A94 
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0004 
    BEQ .facingLeft 
    LDA.W $0A82 
    CMP.W #$0019 
    BPL + 
    LDA.W #$0000 
    BRA .storeAnimFrame 


  + CMP.W #$0032 
    BPL + 
    LDA.W #$0001 
    BRA .storeAnimFrame 


  + CMP.W #$004B 
    BPL + 
    LDA.W #$0002 
    BRA .storeAnimFrame 


  + CMP.W #$0064 
    BPL + 
    LDA.W #$0003 
    BRA .storeAnimFrame 


  + LDA.W #$0004 
    BRA .storeAnimFrame 


.facingLeft:
    LDA.W $0A82 
    CMP.W #$0099 
    BPL + 
    LDA.W #$0004 
    BRA .storeAnimFrame 


  + CMP.W #$00B2 
    BPL + 
    LDA.W #$0003 
    BRA .storeAnimFrame 


  + CMP.W #$00CB 
    BPL + 
    LDA.W #$0002 
    BRA .storeAnimFrame 


  + CMP.W #$00E4 
    BPL .lookingUp 
    LDA.W #$0001 
    BRA .storeAnimFrame 


.lookingUp:
    LDA.W #$0000 

.storeAnimFrame:
    STA.W $0A96 
    RTS 


HandlePeriodicDamageToSamus:
    PHP 
    REP #$30 
    LDA.W $0A78 
    BEQ .timeIsNotFrozen 
    JMP.W .timeIsFrozen 


.timeIsNotFrozen:
    LDA.W $09A2 
    BIT.W #$0020 
    BNE .gravitySuit 
    BIT.W #$0001 
    BEQ .crashIfNegative 
    LDA.W $0A4F 
    LSR A 
    PHA 
    XBA 
    AND.W #$FF00 
    STA.W $0A4E 
    PLA 
    XBA 
    AND.W #$00FF 
    STA.W $0A50 
    BRA .crashIfNegative 


.gravitySuit:
    LDA.W $0A4F 
    LSR #2
    PHA 
    XBA 
    AND.W #$FF00 
    STA.W $0A4E 
    PLA 
    XBA 
    AND.W #$00FF 
    STA.W $0A50 

.crashIfNegative:
    LDA.W $0A50 
    BPL .dontCrash 
    JML.L Crash_Handler 


.dontCrash:
    LDA.W $0A4C : SEC : SBC.W $0A4E : STA.W $0A4C 
    LDA.W $09C2 : SBC.W $0A50 : STA.W $09C2 
    BPL .timeIsFrozen 
    STZ.W $0A4C 
    STZ.W $09C2 
    STZ.W $0A4E 
    STZ.W $0A50 
    PLP 
    RTS 


.timeIsFrozen:
    STZ.W $0A4E 
    STZ.W $0A50 
    PLP 
    RTS 


PauseCheck:
    PHP 
    REP #$30 
    LDA.W $0CEE 
    BNE .return 
    LDA.W $0A78 
    BNE .return 
    LDA.W $0797 
    BNE .return 
    LDA.W $079F 
    CMP.W #$0006 
    BEQ .return 
    LDA.W $0998 
    CMP.W #$0008 
    BNE .return 
    LDA.B $8F 
    BIT.W #$1000 
    BEQ .return 
    LDA.W #$0001 : STA.W $0723 
    STA.W $0725 
    LDA.W #$000C : STA.W $0998 

.return:
    PLP 
    RTS 


LowEnergyCheck:
    LDA.W $09C2 
    CMP.W #$001F 
    BMI .lowEnergy 
    LDA.W $0A6A 
    BEQ .return 
    STZ.W $0A6A 
    LDA.W #$0001 
    JSL.L QueueSound_Lib3_Max6 
    BRA .return 


.lowEnergy:
    LDA.W $0A6A 
    BNE .return 
    LDA.W #$0002 
    JSL.L QueueSound_Lib3_Max6 
    LDA.W #$0001 : STA.W $0A6A 

.return:
    RTS 


Low_Health_Check_external:
    PHP 
    REP #$30 
    JSR.W LowEnergyCheck 
    PLP 
    RTL 


HandleSamus_AutoJumpTimer_HurtFlashCounter_PrevInputEnergy:
    PHP 
    REP #$30 
    LDA.B $8B 
    BIT.W $09B4 
    BEQ .noJump 
    LDA.W $0DFE 
    BIT.W $09B4 
    BEQ .noJump 
    INC.W $0AF4 
    BRA .previousInput 


.noJump:
    STZ.W $0AF4 

.previousInput:
    LDA.B $8B : STA.W $0DFE 
    LDA.B $8F : STA.W $0E00 
    LDA.W $09C2 
    CMP.W $0A12 
    BPL .setPreviousEnergy 
    LDA.W $0A48 
    BNE .debugInvincibility 
    LDA.W #$0001 : STA.W $0A48 

.debugInvincibility:
    LDA.W $0DE0 
    CMP.W #$0007 
    BMI .setPreviousEnergy 
    LDA.W $0A12 : STA.W $09C2 
    BRA .return 


.setPreviousEnergy:
    LDA.W $09C2 : STA.W $0A12 

.return:
    PLP 
    RTS 


ResetMovementAndPoseChangeVariables:
    PHP 
    REP #$30 
    STZ.W $0DAA 
    STZ.W $0DAC 
    STZ.W $0DAE 
    STZ.W $0DB0 
    STZ.W $0DB2 
    STZ.W $0DB4 
    STZ.W $0DB6 
    STZ.W $0DB8 
    STZ.W $0A9A 
    STZ.W $0B5E 
    LDA.W $0DFA 
    XBA 
    AND.W #$FF00 
    STA.W $0DFA 
    LDA.W $0A1E : STA.W $0A10 
    PLP 
    RTS 


DrawSamusAndProjectiles:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    JSR.W DrawSamusSprites 
    JSL.L DrawProjectiles 
    JSR.W HandleSamus_AutoJumpTimer_HurtFlashCounter_PrevInputEnergy 
    JSR.W Handle_UnspinSFX_CancellingEchoSound_SettingTimeUpGameState 
    PLB 
    PLP 
    RTL 


DrawSamusSprites:
    JSR.W HandleArmCannonOpenState 
    JMP.W ($0A5C) 


RTS_90EB51:
    RTS 


SamusDrawingHandler_Default:
    JSR.W HandleChargingBeamGraphicsAudio 

DrawSamus_NoCharge_NoGrapple:
    LDA.W $0AAC 
    AND.W #$000F 
    BEQ .noArmCannon 
    CMP.W #$0002 
    BNE .facingForward 
    JSR.W Handle_AtmosphericEffects 
    JSR.W Draw_Samus 
    JSR.W DrawArmCannon 
    JSR.W DrawSamusEchoes 
    RTS 


.facingForward:
    JSR.W Handle_AtmosphericEffects 
    JSR.W DrawArmCannon 
    JSR.W Draw_Samus 
    JSR.W DrawSamusEchoes 
    RTS 


.noArmCannon:
    JSR.W Handle_AtmosphericEffects 
    JSR.W Draw_Samus 
    JSR.W DrawSamusEchoes 
    RTS 


SamusDrawingHandler_FiringGrappleBeam:
    LDA.W $0D32 
    CMP.W #GrappleBeamFunction_HitNothing_Cancel 
    BPL DrawSamus_NoCharge_NoGrapple 
    LDA.W $0D32 
    CMP.W #GrappleBeamFunction_Firing 
    BEQ .firing 
    CMP.W #UNUSED_GrappleBeamFunction_Unfiring_9BC759 
    BNE .startPositionCalculated 

.firing:
    JSL.L UpdateGrappleBeamStartPositionDuringGrappleFire 

.startPositionCalculated:
    JSL.L HandleGrappleBeamFlare 
    LDA.W $0AAC 
    AND.W #$000F 
    BEQ .noArmCannon 
    CMP.W #$0002 
    BNE .notFacingForward 
    JSR.W Handle_AtmosphericEffects 
    JSR.W Draw_Samus 
    JSR.W DrawArmCannon 
    JSL.L UpdateGrappleBeamTiles_IncrementFlareCounter 
    LDA.W $0CFE 
    BEQ .return 
    JSL.L DrawGrappleBeam 
    RTS 


.notFacingForward:
    JSR.W Handle_AtmosphericEffects 
    JSR.W DrawArmCannon 
    JSR.W Draw_Samus 
    JSL.L UpdateGrappleBeamTiles_IncrementFlareCounter 
    LDA.W $0CFE 
    BEQ .return 
    JSL.L DrawGrappleBeam 
    RTS 


.noArmCannon:
    JSR.W Handle_AtmosphericEffects 
    JSR.W Draw_Samus 
    JSL.L UpdateGrappleBeamTiles_IncrementFlareCounter 
    LDA.W $0CFE 
    BEQ .return 
    JSL.L DrawGrappleBeam 

.return:
    RTS 


RTS_90EBF2:
    RTS 


SamusDisplayHandler_ShinesparkCrashCircle:
    JSR.W Draw_Samus 
    LDX.W #$0002 

.loop:
    PHX 
    JSR.W DrawShinesparkCrashEchoCircle 
    PLX 
    DEX #2
    BPL .loop 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_SamusDisplayHandler_DrawSamusEchoes_90EC03:
    JSR.W SamusDrawingHandler_Default 
    LDX.W #$0002 

.loop:
    PHX 
    JSR.W DrawSamusEchoes 
    PLX 
    DEX #2
    BPL .loop 
    RTS 


RTS_90EC13:
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


SamusDisplayHandler_UsingElevator:
    LDA.W $05B6 
    BIT.W #$0001 
    BEQ SamusDisplayHandler_InanimateSamus 
    RTS 


SamusDisplayHandler_InanimateSamus:
    JSL.L Draw_Inanimate_Samus 
    RTS 


SetSamusRadius:
    PHP 
    REP #$30 
    LDA.W $0A1C 
    ASL #3
    TAX 
    LDA.L PoseDefinitions_YRadius,X : AND.W #$00FF : STA.W $0B00 
    LDA.W #$0005 : STA.W $0AFE 
    PLP 
    RTS 


Get_Samus_Bottom_Boundary:
    PHP 
    REP #$30 
    LDA.W $0A1C 
    ASL #3
    TAX 
    LDA.L PoseDefinitions_YRadius,X 
    AND.W #$00FF 
    CLC : ADC.W $0AFA : DEC A 
    STA.B $12 
    PLP 
    RTL 


Get_Samus_BottomTop_Boundary:
    PHP 
    REP #$30 
    LDA.W $0A1C 
    ASL #3
    TAX 
    LDA.L PoseDefinitions_YRadius,X 
    AND.W #$00FF 
    PHA 
    CLC : ADC.W $0AFA : DEC A 
    STA.B $12 
    PLA 
    STA.B $14 
    LDA.W $0AFA : SEC : SBC.B $14 : STA.B $14 
    PLP 
    RTL 


AlignSamusBottomPositionWithPreviousPose:
    PHP 
    REP #$30 
    LDA.W $0A1C 
    ASL #3
    TAX 
    LDA.L PoseDefinitions_YRadius,X : AND.W #$00FF : STA.B $12 
    LDA.W $0A20 
    ASL #3
    TAX 
    LDA.L PoseDefinitions_YRadius,X 
    AND.W #$00FF 
    SEC : SBC.B $12 : STA.B $12 
    CLC : ADC.W $0AFA : STA.W $0AFA 
    LDA.B $12 : CLC : ADC.W $0B14 : STA.W $0B14 
    PLP 
    RTL 


Determine_SamusSuitPalette_Index:
    LDA.W $09A2 
    BIT.W #$0020 
    BNE .gravity 
    BIT.W #$0001 
    BNE .varia 
    STZ.W $0A74 
    RTS 


.varia:
    LDA.W #$0002 : STA.W $0A74 
    RTS 


.gravity:
    LDA.W #$0004 : STA.W $0A74 
    RTS 


DemoRecorder_MoveSamusWithControlPad:
    PHP 
    REP #$30 
    LDA.B $8B 
    BIT.W #$0800 
    BEQ .checkDown 
    LDA.W #$FFFC : STA.B $12 
    STZ.B $14 
    JSR.W MoveSamus_Up 

.checkDown:
    LDA.B $8B 
    BIT.W #$0400 
    BEQ .checkLeft 
    LDA.W #$0004 : STA.B $12 
    STZ.B $14 
    JSR.W MoveSamus_Down 

.checkLeft:
    LDA.B $8B 
    BIT.W #$0200 
    BEQ .checkRight 
    LDA.W #$FFFC : STA.B $12 
    STZ.B $14 
    JSR.W MoveSamus_Left 

.checkRight:
    LDA.B $8B 
    BIT.W #$0100 
    BEQ .return 
    LDA.W #$0004 : STA.B $12 
    STZ.B $14 
    JSR.W MoveSamus_Right 

.return:
    PLP 
    RTS 


RTS_90ED1E:
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_WasteTime_90ED1F:
    LDX.W #$00C8 

.loop:
    DEX 
    BPL .loop 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


DemoRecorder_DisplaySamusPositionAsAmmoIfMorphed:
    LDA.W $0A1F 
    AND.W #$00FF 
    TAX 
    LDA.W .poses,X 
    AND.W #$00FF 
    BEQ .return 
    LDA.W $0AF6 
    LSR #4
    STA.W $09C6 
    STA.W $09C8 
    LDA.W $0AFA 
    LSR #4
    STA.W $09CA 
    STA.W $09CC 

.return:
    RTS 


.poses:
    db $00,$00,$00,$00,$01,$00,$00,$01,$01,$01,$00,$00,$00,$00,$00,$00 
    db $00,$01,$01,$01,$00,$00,$00,$00,$00,$00,$00,$00 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_DisplayInGameTimeAsAmmo_90ED6C:
    LDA.W $09E0 : STA.W $09C6 
    STA.W $09C8 
    LDA.W $09DE : STA.W $09CA 
    STA.W $09CC 
    LDA.W $09DC : STA.W $09CE 
    STA.W $09D0 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


FootstepGraphics:
    LDA.W $079F 
    ASL A 
    TAX 
    JSR.W (.pointers,X) 
    RTS 


.pointers:
    dw FootstepGraphics_Crateria 
    dw FootstepGraphics_Common 
    dw FootstepGraphics_Common 
    dw FootstepGraphics_Common 
    dw FootstepGraphics_Maridia 
    dw FootstepGraphics_Common 
    dw FootstepGraphics_Common 
    dw FootstepGraphics_Common 

FootstepGraphics_Crateria:
    LDA.W $1F51 
    BEQ .notCinematic 
    JMP.W FootstepGraphics_Common 


.notCinematic:
    LDX.W $079D 
    CPX.W #$0010 
    BPL .gotoCommon 
    LDA.W .footstepTypes,X 
    AND.W #$00FF 
    BIT.W #$0001 
    BNE .landingSite 
    BIT.W #$0002 
    BNE .wreckedShipEntrance 
    BIT.W #$0004 
    BNE FootstepGraphics_Maridia 

.gotoCommon:
    JMP.W FootstepGraphics_Common 


.footstepTypes:
    db $01,$00,$00,$00,$00,$02,$00,$04,$00,$04,$04,$04,$04,$00,$04,$00 

.wreckedShipEntrance:
    LDA.W $0AFA 
    CMP.W #$03B0 
    BPL FootstepGraphics_Maridia 
    JMP.W FootstepGraphics_Common 


.landingSite:
    LDA.W $196E 
    CMP.W #$000A 
    BNE FootstepGraphics_Common ; fallthrough to FootstepGraphics_Maridia

FootstepGraphics_Maridia:
    JSL.L Get_Samus_Bottom_Boundary 
    LDA.W $195E 
    BMI .negativeYPosition 
    CMP.B $12 
    BPL .nonLiquidPhysics 
    LDA.W $197E 
    BIT.W #$0004 
    BNE .nonLiquidPhysics 
    BRA .return 


.negativeYPosition:
    LDA.W $1962 
    BMI .nonLiquidPhysics 
    CMP.B $12 
    BMI .return 

.nonLiquidPhysics:
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0004 
    BEQ .facingRight 
    LDA.W $0AF6 : CLC : ADC.W #$000C : STA.W $0ADC 
    LDA.W $0AF6 : SEC : SBC.W #$0008 : STA.W $0ADE 
    BRA .merge 


.facingRight:
    LDA.W $0AF6 : SEC : SBC.W #$000C : STA.W $0ADC 
    LDA.W $0AF6 : CLC : ADC.W #$0008 : STA.W $0ADE 

.merge:
    LDA.W $0AFA : CLC : ADC.W #$0010 : STA.W $0AE4 
    STA.W $0AE6 
    LDA.W #$0100 : STA.W $0AEC 
    STA.W $0AEE 
    LDA.W #$8002 : STA.W $0AD4 
    LDA.W #$0003 : STA.W $0AD6 

.return:
    RTS 


FootstepGraphics_Common:
    LDA.W $0B3E 
    AND.W #$FF00 
    CMP.W #$0400 
    BNE .return 
    JSL.L Get_Samus_Bottom_Boundary 
    LDA.W $195E 
    BMI .negativeYPosition 
    CMP.B $12 
    BPL .nonLiquidPhysics 
    LDA.W $197E 
    BIT.W #$0004 
    BNE .nonLiquidPhysics 
    BRA .return 


.negativeYPosition:
    LDA.W $1962 
    BMI .nonLiquidPhysics 
    CMP.B $12 
    BMI .return 

.nonLiquidPhysics:
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0004 
    BEQ .facingLeft 
    LDA.W $0AF6 : CLC : ADC.W #$000C : STA.W $0ADC 
    LDA.W $0AF6 : SEC : SBC.W #$0008 : STA.W $0ADE 
    BRA .merge 


.facingLeft:
    LDA.W $0AF6 : SEC : SBC.W #$000C : STA.W $0ADC 
    LDA.W $0AF6 : CLC : ADC.W #$0008 : STA.W $0ADE 

.merge:
    LDA.W $0AFA : CLC : ADC.W #$0010 : STA.W $0AE4 
    STA.W $0AE6 
    LDA.W #$0700 : STA.W $0AEC 
    STA.W $0AEE 
    LDA.W #$8002 : STA.W $0AD4 
    LDA.W #$0003 : STA.W $0AD6 

.return:
    RTS 


UpdateSamusEchoPosition:
    LDA.W $0B3E 
    AND.W #$FF00 
    CMP.W #$0400 
    BNE .return 
    LDA.W $0AAE 
    BMI .return 
    LDA.W $09DA 
    BIT.W #$0003 
    BNE .return 
    LDX.W $0AAE 
    LDA.W $0AF6 : STA.W $0AB0,X 
    LDA.W $0AFA : STA.W $0AB8,X 
    INX #2
    CPX.W #$0004 
    BMI .storeDistance 
    LDX.W #$0000 

.storeDistance:
    STX.W $0AAE 

.return:
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_PossiblyFootStepGraphicOffsets_90EF1C:
    dw $000C,$0010 
endif ; !FEATURE_KEEP_UNREFERENCED

Unknown_ShinesparkMovementHandler_Unused_90EF20:
    dw $0010 

PostGrappleCollisionDetection:
    PHP 
    REP #$30 
    JSL.L PostGrappleCollisionDetection_Horizontal 
    JSL.L PostGrappleCollisionDetection_Vertical 
    LDA.W $0E0A 
    BEQ .noEject 
    LDA.W $0E08 
    BNE .return 

.noEject:
    LDA.W $0E08 
    BEQ .return 
    LDA.W $0AFA : SEC : SBC.W $0E08 : STA.W $0AFA 
    LDA.W $0B00 
    CMP.W #$0010 
    BMI .return 
    JSL.L PostGrappleCollisionDetection_Vertical 
    LDA.W $0AFA : SEC : SBC.W $0E08 : STA.W $0AFA 

.return:
    PLP 
    RTL 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_FireUnknownProjectile27_90EF5E:
    LDA.W #RTS_90E90E : STA.W $0A58 
    LDA.W #SamusCurrentStateHandler_SamusIsLocked : STA.W $0A42 
    LDA.W #$FFFF : STA.W $0A28 
    STA.W $0A2A 
    STA.W $0A2C 
    STZ.W $0A2E 
    STZ.W $0A30 
    STZ.W $0A32 
    LDX.W #$0006 

.loop:
    LDA.W #$8027 : STA.W $0C18,X 
    STZ.W $0C04,X 
    LDA.W #UNUSED_ProjectilePreInstruction_UnknownProjectile27_90EFD3 : STA.W $0C68,X 
    STZ.W $0BF0,X 
    STZ.W $0BDC,X 
    STZ.W $0C7C,X 
    STZ.W $0B8C,X 
    STZ.W $0BA0,X 
    LDA.W $0AF6 : CLC : ADC.W .XOffsets,X : STA.W $0B64,X 
    LDA.W $0AFA : CLC : ADC.W .YOffsets,X : STA.W $0B78,X 
    JSL.L Initialize_ShinesparkEcho_or_SpazerSBATrailProjectile 
    DEX #2
    BPL .loop 
    LDA.W #$0004 : STA.W $0CCE 
    RTS 


.XOffsets:
    dw $0080,$0080,$FF80,$FF80 

.YOffsets:
    dw $FF80,$0080,$0080,$FF80 

UNUSED_ProjectilePreInstruction_UnknownProjectile27_90EFD3:
    LDA.W $0B64,X : CLC : ADC.W .XVelocities,X : STA.W $0B64,X 
    LDA.W $0B78,X : CLC : ADC.W .YVelocities,X : STA.W $0B78,X 
    CMP.W $0AFA 
    BNE .return 
    LDA.W $0C7C,X 
    CMP.W #$0001 
    BNE .not1 
    CPX.W #$0006 
    BNE .clear 
    LDA.W #UNUSED_SamusMovementHandler_90F04B : STA.W $0A58 

.clear:
    JSL.L Clear_Projectile 
    RTS 


.not1:
    INC.W $0C7C,X 
    LDA.W #$00B4 : STA.W $0A68 
    LDA.W #$0001 : STA.W $0ACC 
    STZ.W $0ACE 
    LDA.W $0AF6 : CLC : ADC.W .XOffsets,X : STA.W $0B64,X 
    LDA.W $0AFA : CLC : ADC.W .YOffsets,X : STA.W $0B78,X 

.return:
    RTS 


.XVelocities:
    dw $FFFC,$FFFC,$0004,$0004 

.YVelocities:
    dw $0004,$FFFC,$FFFC,$0004 

.XOffsets:
    dw $0080,$0080,$FF80,$FF80 

.YOffsets:
    dw $FF80,$0080,$0080,$FF80 

UNUSED_SamusMovementHandler_90F04B:
    LDA.W $0A68 
    BNE .return 
    LDA.W #$0006 : STA.W $0ACE 
    LDA.W #$0001 : STA.W $0AD0 
    STA.W $0A80 
    LDA.W #$000A : STA.W $0ACC 
    LDA.W #$0078 : STA.W $0A68 
    LDA.W #UNUSED_SamusMovementHandler_90F072 : STA.W $0A58 

.return:
    RTS 


UNUSED_SamusMovementHandler_90F072:
    LDA.W $0A68 
    BNE .return 
    LDA.W #SamusCurrentStateHandler_Normal : STA.W $0A42 
    LDA.W #SamusMovementHandler_Normal : STA.W $0A58 

.return:
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


Run_Samus_Command:
    PHP 
    PHB 
    PHK 
    PLB 
    REP #$30 
    PHX 
    AND.W #$001F 
    ASL A 
    TAX 
    JSR.W (.pointers,X) 
    BCC .return 
    LDA.W #$FFFF : STA.W $0A28 
    STA.W $0A2A 
    STA.W $0A2C 
    STZ.W $0A2E 
    STZ.W $0A30 
    STZ.W $0A32 

.return:
    PLX 
    PLB 
    PLP 
    RTL 


.pointers:
    dw SamusCommand_0_LockSamus 
    dw SamusCommand_1_UnlockSamus 
    dw SamusCommand_2_SamusReachedCeresElevator 
    dw SamusCommand_3_UnspinSamus 
    dw SamusCommand_4_EndChargeBeam 
    dw SamusCommand_5_SetupSamusForBeingDrained_AbleToStand 
    dw SamusCommand_6_LockSamusIntoRefillStation 
    dw SamusCommand_7_SetupSamusForElevator 
    dw SamusCommand_8_SetupSamusForCeresStart 
    dw SamusCommand_9_SetupSamusForZebesStart 
    dw SamusCommand_A_StopDrawingSamus 
    dw SamusCommand_B_UnlockSamusFromFacingForward 
    dw SamusCommand_C_UpdateSamusDueToUnpause 
    dw SamusCommand_D_CheckIfGrappleBeamIsActive 
    dw SamusCommand_E_UnlockSamusFromCeresElevator 
    dw SamusCommand_F_EnableTimerHandling 
    dw SamusCommand_10_UnlockSamusFromReserveTank 
    dw SamusCommand_11_SetupSamusForDeathSequence 
    dw SamusCommand_12_EnableSamusBlueFlashing 
    dw SamusCommand_13_DisableSamusBlueFlashing 
    dw SamusCommand_14_QueueLowEnergyAndGrappleSFX 
    dw SamusCommand_15_LockSamusIntoSuitPickup 
    dw SamusCommand_16_EnableRainbowSamus 
    dw SamusCommand_17_DisableRainbowSamus_StandHerUp 
    dw SamusCommand_18_SetupSamusForBeingDrained_UnableToStand 
    dw SamusCommand_19_FreezeDrainedSamusAnimation 
    dw SamusCommand_1A_SamusEntersGunship 
    dw SamusCommand_1B_LockSamusForReserveTank 
    dw SamusCommand_1C_PlaySpinJumpSoundIfSpinJumping 
    dw SamusCommand_1D_ClearSoundsWhenGoingThroughDoor 
    dw SamusCommand_1E_ResumeSoundsAfterPowerBombExplosion 
    dw SamusCommand_1F_KillGrappleBeam 

Update_Samus_PreviousPose:
    LDA.W $0A20 : STA.W $0A24 
    LDA.W $0A22 : STA.W $0A26 
    LDA.W $0A1C : STA.W $0A20 
    LDA.W $0A1E : STA.W $0A22 
    RTS 


CLCRTS_90F107:
    CLC 
    RTS 


SamusCommand_0_LockSamus:
    LDA.W #SamusCurrentStateHandler_SamusIsLocked : STA.W $0A42 
    LDA.W #SamusNewStateHandler_SamusIsLocked : STA.W $0A44 
    SEC 
    RTS 


SamusCommand_1_UnlockSamus:
    LDA.W #SamusCurrentStateHandler_Normal : STA.W $0A42 
    LDA.W #SamusNewStateHandler_Normal : STA.W $0A44 
    SEC 
    RTS 


SamusCommand_2_SamusReachedCeresElevator:
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0004 
    BEQ .facingLeft 
    LDA.W #$0001 : STA.W $0A1C 
    BRA + 


.facingLeft:
    LDA.W #$0002 : STA.W $0A1C 

  + STZ.W $0A9A 
    JSL.L InitializeSamusPose_1 
    JSL.L Set_Samus_AnimationFrame_if_PoseChanged 
    LDA.W #$003C : STA.W $0AA0 
    JMP.W SamusCommand_0_LockSamus 


SamusCommand_3_UnspinSamus:
    LDA.W $0D32 
    CMP.W #GrappleBeamFunction_Inactive 
    BEQ .grappleInactive 
    LDA.W #GrappleBeamFunction_Dropped : STA.W $0D32 

.returnCarryClear:
    CLC 
    RTS 


.grappleInactive:
    LDA.W $0A1F 
    AND.W #$00FF 
    CMP.W #$0003 
    BEQ .checkDirection 
    CMP.W #$0014 
    BNE .returnCarryClear 

.checkDirection:
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0004 
    BEQ .facingLeft 
    LDA.W #$0001 : STA.W $0A1C 
    BRA + 


.facingLeft:
    LDA.W #$0002 : STA.W $0A1C 

  + STZ.W $0A9A 
    JSL.L InitializeSamusPose_1 
    JSL.L Set_Samus_AnimationFrame_if_PoseChanged 
    JSR.W Update_Samus_PreviousPose 
    SEC 
    RTS 


SamusCommand_4_EndChargeBeam:
    STZ.W $0B62 ; fallthrough to EndChargeBeam

EndChargeBeam:
    STZ.W $0CD0 
    JSR.W ClearFlareAnimationState 
    JSL.L LoadSamusSuitPalette 
    CLC 
    RTS 


SamusCommand_6_LockSamusIntoRefillStation:
    LDA.W #SamusCurrentStateHandler_SamusIsLocked : STA.W $0A42 
    LDA.W #RTL_90E8D6 : STA.W $0A44 
    LDA.W $0CD0 
    CMP.W #$000F 
    BMI .gotoEndChargeBeam 
    LDA.W #$0002 
    JSL.L QueueSound 

.gotoEndChargeBeam:
    JMP.W EndChargeBeam 


SamusCommand_7_SetupSamusForElevator:
    JSL.L MakeSamusFaceForward 
    LDA.W #SamusNewStateHandler_RidingElevator : STA.W $0A44 
    LDA.W #SamusMovementHandler_Normal : STA.W $0A58 
    LDA.W #SamusDisplayHandler_UsingElevator : STA.W $0A5C 
    LDA.W #SamusPoseInputHandler_Normal : STA.W $0A60 
    STZ.W $0A56 
    SEC 
    RTS 


SamusCommand_8_SetupSamusForCeresStart:
    LDA.W #RTL_90E8CD : STA.W $0A42 
    LDA.W #SamusNewStateHandler_SamusIsLocked : STA.W $0A44 
    LDA.W #$0000 : STA.W $0A1C 
    STZ.W $0A9A 
    JSL.L InitializeSamusPose_1 
    JSL.L Set_Samus_AnimationFrame_if_PoseChanged 
    JSL.L LoadSamusSuitPalette 
    LDA.W #SamusDrawingHandler_Default : STA.W $0A5C 
    LDA.W $0A1C : STA.W $0A20 
    STA.W $0A24 
    LDA.W $0A1E : STA.W $0A22 
    STA.W $0A26 
    STZ.W $0AFA 
    LDY.W #EnemyProjectile_CeresElevatorPad 
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    LDY.W #EnemyProjectile_CeresElevatorPadLevelDataConcealer 
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    STZ.W $05F7 
    JSL.L Play_Room_Music_Track_After_A_Frames 
    SEC 
    RTS 


SamusCommand_9_SetupSamusForZebesStart:
    LDA.W $09A2 
    BIT.W #$0020 
    BNE .gravity 
    BIT.W #$0001 
    BNE .varia 
    LDY.W #PaletteFXObjects_SamusLoading_PowerSuit 
    JSL.L Spawn_PaletteFXObject 
    LDA.W #$0000 : STA.W $0A1C 
    BRA .merge 


.varia:
    LDY.W #PaletteFXObjects_SamusLoading_VariaSuit 
    JSL.L Spawn_PaletteFXObject 
    LDA.W #$009B : STA.W $0A1C 
    BRA .merge 


.gravity:
    LDY.W #PaletteFXObjects_SamusLoading_GravitySuit 
    JSL.L Spawn_PaletteFXObject 
    LDA.W #$009B : STA.W $0A1C 

.merge:
    JSL.L LoadSamusSuitPalette 
    JSL.L InitializeSamusPose_1 
    LDA.W #$0003 : STA.W $0A94 
    LDA.W #$0002 : STA.W $0A96 
    STZ.W $0DEC 
    SEC 
    RTS 


SamusCommand_A_StopDrawingSamus:
    LDA.W #RTS_90E90E : STA.W $0A5C 
    CLC 
    RTS 


SamusCommand_B_UnlockSamusFromFacingForward:
    LDA.W #SamusDrawingHandler_Default : STA.W $0A5C 
    JMP.W SamusCommand_1_UnlockSamus 


SamusCommand_C_UpdateSamusDueToUnpause:
    JSL.L UpdateSamusPoseDueToChangeOfEquipment 
    LDA.W $0A44 
    CMP.W #RTL_90E8D6 
    BNE .return 
    LDA.W #SamusCurrentStateHandler_Normal : STA.W $0A42 
    LDA.W #SamusNewStateHandler_Normal : STA.W $0A44 

.return:
    SEC 
    RTS 


SamusCommand_D_CheckIfGrappleBeamIsActive:
    LDA.W $0D32 
    CMP.W #GrappleBeamFunction_Inactive 
    BNE .active 
    LDA.W #$0000 
    CLC 
    RTS 


.active:
    LDA.W #$0001 
    CLC 
    RTS 


SamusCommand_E_UnlockSamusFromCeresElevator:
    LDA.W #SamusCurrentStateHandler_Normal : STA.W $0A42 
    LDA.W #SamusNewStateHandler_Ceres : STA.W $0A44 
    SEC 
    RTS 


SamusCommand_F_EnableTimerHandling:
    LDA.W #SamusTimerHackHandler_HandleTimer : STA.W $0A5A 
    CLC 
    RTS 


SamusCommand_10_UnlockSamusFromReserveTank:
    LDA.W $0A44 
    CMP.W #RTL_90E8D9 
    BNE .noRainbowBeam 
    SEC 
    RTS 


.noRainbowBeam:
    LDA.W #SamusCurrentStateHandler_Normal : STA.W $0A42 
    LDA.W #SamusNewStateHandler_Normal : STA.W $0A44 
    SEC 
    RTS 


SamusCommand_11_SetupSamusForDeathSequence:
    JSL.L Disable_PaletteFXObjects ; fallthrough to LockSamus_SetInanimateSamusDrawingHandler

LockSamus_SetInanimateSamusDrawingHandler:
    LDA.W #SamusCurrentStateHandler_SamusIsLocked : STA.W $0A42 
    LDA.W #RTL_90E8CD : STA.W $0A44 
    LDA.W #SamusDisplayHandler_InanimateSamus : STA.W $0A5C 
    SEC 
    RTS 


SamusCommand_15_LockSamusIntoSuitPickup:
    JSR.W Update_Samus_PreviousPose 
    STZ.W $0CD0 
    JSR.W ClearFlareAnimationState 
    JSL.L LoadSamusSuitPalette 
    JMP.W LockSamus_SetInanimateSamusDrawingHandler 


SamusCommand_12_EnableSamusBlueFlashing:
    LDA.W #$0001 : STA.W $0A4A 
    CLC 
    RTS 


SamusCommand_13_DisableSamusBlueFlashing:
    STZ.W $0A4A 
    JSL.L LoadSamusSuitPalette 
    CLC 
    RTS 


SamusCommand_14_QueueLowEnergyAndGrappleSFX:
    LDA.W $09C2 
    CMP.W #$001F 
    BPL .notLowEnergy 
    LDA.W #$0002 
    JSL.L QueueSound_Lib3_Max6 

.notLowEnergy:
    JSR.W SamusCommand_D_CheckIfGrappleBeamIsActive 
    TAY 
    BEQ .grappleInactive 
    LDA.W #$0006 
    JSL.L QueueSound_Lib1_Max6 
    CLC 
    RTS 


.grappleInactive:
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0003 
    BEQ + 
    CLC 
    RTS 


  + LDA.W $0A1C 
    CMP.W #$0081 
    BEQ .screwAttack 
    CMP.W #$0082 
    BEQ .screwAttack 
    CMP.W #$001B 
    BEQ .spaceJump 
    CMP.W #$001C 
    BEQ .spaceJump 
    LDA.W #$0031 
    JSL.L QueueSound_Lib1_Max6 
    CLC 
    RTS 


.spaceJump:
    LDA.W #$003E 
    JSL.L QueueSound_Lib1_Max6 
    CLC 
    RTS 


.screwAttack:
    LDA.W #$0033 
    JSL.L QueueSound_Lib1_Max6 
    CLC 
    RTS 


SamusCommand_5_SetupSamusForBeingDrained_AbleToStand:
    LDA.W #SamusTimerHackHandler_HandleLettingSamusUpFromBeingDrained ; fallthrough to SetupSamusForBeingDrained
    STA.W $0A5A 

SetupSamusForBeingDrained:
    LDA.W #$0054 : STA.W $0A1C 
    STZ.W $0A9A 
    JSL.L InitializeSamusPose_1 
    JSL.L Set_Samus_AnimationFrame_if_PoseChanged 
    JSR.W Update_Samus_PreviousPose 
    STZ.W $0CD0 
    JSR.W ClearFlareAnimationState 
    JSL.L LoadSamusSuitPalette 
    LDA.W #SamusCurrentStateHandler_SamusIsLocked : STA.W $0A42 
    LDA.W #RTL_90E8D9 : STA.W $0A44 
    SEC 
    RTS 


SamusCommand_18_SetupSamusForBeingDrained_UnableToStand:
    LDA.W #SamusTimerHackHandler_LetSamusFailToStandUpFromBeingDrained : STA.W $0A5A 
    JMP.W SetupSamusForBeingDrained 


SamusCommand_16_EnableRainbowSamus:
    LDA.W #$8000 : STA.W $0A4A 
    LDA.W #$0001 : STA.W $0ACE 
    STA.W $0AD0 
    STZ.W $0B62 
    CLC 
    RTS 


SamusCommand_17_DisableRainbowSamus_StandHerUp:
    STZ.W $0A4A 
    STZ.W $0ACE 
    STZ.W $0AD0 
    STZ.W $0B62 
    JSL.L LoadSamusSuitPalette 
    LDA.W #$0001 : STA.W $0A94 
    LDA.W #$000D : STA.W $0A96 
    CLC 
    RTS 


SamusCommand_19_FreezeDrainedSamusAnimation:
    LDA.W #$0001 : STA.W $0A94 
    LDA.W #$001C : STA.W $0A96 
    SEC 
    RTS 


SamusCommand_1A_SamusEntersGunship:
    LDA.W #SamusNewStateHandler_EnteringExitingGunship : STA.W $0A44 
    CLC 
    RTS 


SamusCommand_1B_LockSamusForReserveTank:
    LDA.W $0A44 
    CMP.W #RTL_90E8D9 
    BEQ .rainbowBeam 
    JMP.W SamusCommand_0_LockSamus 


.rainbowBeam:
    SEC 
    RTS 


SamusCommand_1C_PlaySpinJumpSoundIfSpinJumping:
    LDA.W $0A1F 
    AND.W #$00FF 
    CMP.W #$0014 
    BEQ .wallJump 
    CMP.W #$0003 
    BEQ .spinJumping 
    CLC 
    RTS 


.spinJumping:
    LDA.W $0A1C 
    CMP.W #$0081 
    BEQ .screwAttack 
    CMP.W #$0082 
    BEQ .screwAttack 
    CMP.W #$001B 
    BEQ .spaceJump 
    CMP.W #$001C 
    BEQ .spaceJump 
    BRA .spinJump 


.wallJump:
    LDA.W $0A96 
    CMP.W #$0017 
    BPL .screwAttack 
    CMP.W #$000D 
    BPL .spaceJump 

.spinJump:
    LDA.W #$0031 
    JSL.L QueueSound_Lib1_Max9 
    CLC 
    RTS 


.spaceJump:
    LDA.W #$003E 
    JSL.L QueueSound_Lib1_Max9 
    CLC 
    RTS 


.screwAttack:
    LDA.W #$0033 
    JSL.L QueueSound_Lib1_Max9 
    CLC 
    RTS 


SamusCommand_1D_ClearSoundsWhenGoingThroughDoor:
    LDA.W $0A1F 
    AND.W #$00FF 
    CMP.W #$0003 
    BEQ .endSpaceJumpSFX 
    CMP.W #$0014 
    BNE .notSpinning 

.endSpaceJumpSFX:
    LDA.W #$0032 
    JSL.L QueueSound 
    CLC 
    RTS 


.notSpinning:
    LDA.B $8B 
    BIT.W $09B2 
    BNE .returnCarryClear 
    LDA.W $0CD0 
    CMP.W #$0010 
    BPL .returnCarryClear 
    LDA.W #$0002 
    JSL.L QueueSound 

.returnCarryClear:
    CLC 
    RTS 


SamusCommand_1E_ResumeSoundsAfterPowerBombExplosion:
    LDA.W $0998 
    CMP.W #$0008 
    BNE .returnCarryClear 
    LDA.W $0A1F 
    AND.W #$00FF 
    CMP.W #$0003 
    BEQ .spinJumpSFX 
    CMP.W #$0014 
    BNE .notSpinning 

.spinJumpSFX:
    JSR.W SamusCommand_1C_PlaySpinJumpSoundIfSpinJumping 
    CLC 
    RTS 


.notSpinning:
    LDA.W $0CD0 
    CMP.W #$0010 
    BMI .returnCarryClear 
    LDA.W #$0041 
    JSL.L QueueSound_Lib1_Max9 

.returnCarryClear:
    CLC 
    RTS 


SamusCommand_1F_KillGrappleBeam:
    LDA.W $0D32 
    CMP.W #GrappleBeamFunction_Inactive 
    BNE .grappleActive 
    CLC 
    RTS 


.grappleActive:
    STZ.W $0D1E 
    STZ.W $0D20 
    STZ.W $0D34 
    STZ.W $0D36 
    STZ.W $0A9E 
    STZ.W $0CF8 
    STZ.W $0CF6 
    STZ.W $0CF4 
    LDA.W $09A6 
    JSL.L Load_Beam_Palette_External 
    LDA.W #GrappleBeamFunction_Inactive : STA.W $0D32 
    LDA.W #SamusDrawingHandler_Default : STA.W $0A5C 
    CLC 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_ResumeSounds_90F507:
    LDA.W $0A1F 
    AND.W #$00FF 
    CMP.W #$0003 
    BEQ .return 
    CMP.W #$0014 
    BEQ .return 
    LDA.B $8B 
    BIT.W $09B2 
    BEQ .return 
    LDA.W $0CD0 
    CMP.W #$0010 
    BMI .return 
    LDA.W #$0041 
    JSL.L QueueSound_Lib1_Max9 

.return:
    CLC 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


DebugCommandHandler:
    RTS 

    JMP.W ($0A5E) 


RTS_90F533:
    RTS 


RTS_90F534:
    RTS 


DebugCommandHandler_GiveSamusAShinesparkIfYNewlyPressed:
    LDA.B $8F 
    BIT.W #$4000 
    BEQ .return 
    LDA.W #$00B4 : STA.W $0A68 
    LDA.W #$0001 : STA.W $0ACC 
    STZ.W $0ACE 

.return:
    RTS 


DebugCommandHandler_DisableRainbowSamus_StandHerUp:
    LDA.B $91 
    BIT.W #$4000 
    BEQ .return 
    LDA.W #$0017 
    JSL.L Run_Samus_Command 
    LDA.W #RTS_90F534 : STA.W $0A5E 

.return:
    RTS 


DebugCommandHandler_ReleaseSamusFromDrainedPoseIfYNewlyPress:
    LDA.B $8F 
    BIT.W #$4000 
    BEQ .return 
    LDA.W #RTS_90F534 : STA.W $0A5E 
    LDA.W #$0002 
    JSL.L DrainedSamusController 

.return:
    RTS 


Handle_UnspinSFX_CancellingEchoSound_SettingTimeUpGameState:
    PHP 
    REP #$30 
    LDA.W $0DC0 
    BMI .negative 
    BEQ .notSet 
    LDA.B $8B 
    BIT.W $09B2 
    BEQ .pressingShot 
    LDA.W #$0041 
    JSL.L QueueSound_Lib1_Max9 

.pressingShot:
    STZ.W $0DC0 

.notSet:
    LDA.W $0B40 
    BEQ .echoes 
    LDA.W $0B3E 
    BIT.W #$0400 
    BNE .echoes 
    STZ.W $0B40 
    LDA.W #$0025 
    JSL.L QueueSound_Lib3_Max15 

.echoes:
    LDA.W $0A11 
    AND.W #$00FF 
    CMP.W #$0003 
    BEQ .spinJumping 
    CMP.W #$0014 
    BNE .checkDebug 

.spinJumping:
    LDA.W $0A1F 
    AND.W #$00FF 
    CMP.W #$0003 
    BEQ .checkDebug 
    CMP.W #$0014 
    BEQ .checkDebug 
    LDA.W #$0032 
    JSL.L QueueSound 
    LDA.W $0CD0 
    CMP.W #$0010 
    BMI .checkDebug 
    LDA.B $8B 
    BIT.W $09B2 
    BEQ .checkDebug 

.negative:
    LDA.W #$0001 : STA.W $0DC0 

.checkDebug:
    LDA.W $05D1 
    BEQ .debugEnd 
    LDA.W $0A1C 
    BEQ .checkInputs 
    CMP.W #$009B 
    BEQ .checkInputs 
    LDA.W $0DE0 
    CMP.W #$0007 
    BMI .resetInvincibility 
    PLP 
    RTS 


.checkInputs:
    LDA.B $8D 
    AND.W #$0030 
    CMP.W #$0030 
    BNE .debugEnd 
    LDA.B $91 
    BIT.W #$0080 
    BEQ .debugEnd 
    LDA.W #$0007 : STA.W $0DE0 
    BRA .debugEnd 


.resetInvincibility:
    STZ.W $0DE0 

.debugEnd:
    LDA.W #$000E 
    JSL.L CheckIfEvent_inA_HasHappened 
    BCC .return 
    LDA.W $0A5A 
    CMP.W #SamusTimerHackHandler_DrawTimer 
    BNE .return 
    LDA.W $0998 
    CMP.W #$0023 
    BEQ .return 
    LDA.W #$0023 : STA.W $0998 

.return:
    PLP 
    RTS 


Freespace_Bank90_F63A: 
; $9C6 bytes
