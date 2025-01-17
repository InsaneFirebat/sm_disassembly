
org $A48000


CommonA4_GrappleAI_NoInteraction:
    JSL.L GrappleAI_SwitchEnemyAIToMainAI 
    RTL 


CommonA4_GrappleAI_SamusLatchesOn:
    JSL.L GrappleAI_SamusLatchesOnWithGrapple 
    RTL 


CommonA4_GrappleAI_KillEnemy:
    JSL.L GrappleAI_EnemyGrappleDeath 
    RTL 


CommonA4_GrappleAI_CancelGrappleBeam:
    JSL.L GrappleAI_SwitchToFrozenAI 
    RTL 


CommonA4_GrappleAI_SamusLatchesOn_NoInvincibility:
    JSL.L GrappleAI_SamusLatchesOnWithGrapple_NoInvincibility 
    RTL 


UNUSED_CommonA4_GrappleAI_SamusLatchesOn_ParalyzeEnemy_A48019:
    JSL.L GrappleAI_SamusLatchesOnWithGrapple_ParalyzeEnemy 
    RTL 


CommonA4_GrappleAI_HurtSamus:
    JSL.L GrappleAI_SwitchToFrozenAI_duplicate 
    RTL 


CommonA4_NormalEnemyTouchAI:
    JSL.L NormalEnemyTouchAI 
    RTL 


CommonA4_NormalTouchAI_NoDeathCheck:
    JSL.L NormalEnemyTouchAI_NoDeathCheck_External 
    RTL 


CommonA4_NormalEnemyShotAI:
    JSL.L NormalEnemyShotAI 
    RTL 


CommonA4_NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic:
    JSL.L NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External 
    RTL 


CommonA4_NormalEnemyPowerBombAI:
    JSL.L NormalEnemyPowerBombAI 
    RTL 


CommonA4_NormalEnemyPowerBombAI_NoDeathCheck:
    JSL.L NormalEnemyPowerBombAI_NoDeathCheck_External 
    RTL 


CommonA4_NormalEnemyFrozenAI:
    JSL.L NormalEnemyFrozenAI 
    RTL 


CommonA4_CreateADudShot:
    JSL.L CreateADudShot 
    RTL 


RTS_A4804B:
    RTS 


RTL_A4804C:
    RTL 


Spritemap_CommonA4_Nothing:
    dw $0000 

ExtendedSpritemap_CommonA4_Nothing:
    dw $0001,$0000,$0000 
    dw Spritemap_CommonA4_Nothing 
    dw Hitbox_CommonA4_Nothing 

Hitbox_CommonA4_Nothing:
    dw $0001,$0000,$0000,$0000,$0000 
    dw CommonA4_NormalEnemyTouchAI 
    dw CommonA4_NormalEnemyShotAI 

InstList_CommonA4_DeleteEnemy:
    dw Instruction_CommonA4_DeleteEnemy 

NOPNOP_A48069:
    NOP #2
    Instruction_CommonA4_Enemy0FB2_InY:
    LDA.W $0000,Y : STA.W $0FB2,X 
    INY #2
    RTL 


Instruction_CommonA4_SetEnemy0FB2ToRTS:
    LDA.W #RTS_A4807B : STA.W $0FB2,X 
    RTL 


RTS_A4807B:
    RTS 


Instruction_CommonA4_DeleteEnemy:
    LDA.W $0F86,X 
    ORA.W #$0200 
    STA.W $0F86,X 
    PLA 
    PEA.W ProcessEnemyInstructions_return-1 
    RTL 


Instruction_CommonA4_CallFunctionInY:
    LDA.W $0000,Y : STA.B $12 
    PHY 
    PHX 
    PEA.W .manualReturn-1 
    JMP.W ($0012) 


.manualReturn:
    PLX 
    PLY 
    INY #2
    RTL 


Instruction_CommonA4_CallFunctionInY_WithA:
    LDA.W $0000,Y : STA.B $12 
    LDA.W $0002,Y 
    PHY 
    PHX 
    PEA.W .manualReturn-1 
    JMP.W ($0012) 


.manualReturn:
    PLX 
    PLY 
    TYA 
    CLC : ADC.W #$0004 : TAY 
    RTL 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Instruction_CommonA4_CallExternalFunctionInY_A480B5:
    LDA.W $0000,Y : STA.B $12 
    LDA.W $0001,Y : STA.B $13 
    PHX 
    PHY 
    JSL.L .externalFunction 
    PLY 
    PLX 
    INY #3
    RTL 


.externalFunction:
    JML.W [$0012] 


UNUSED_Inst_CommonA4_CallExternalFunctionInY_WithA_A480CE:
    LDA.W $0000,Y : STA.B $12 
    LDA.W $0001,Y : STA.B $13 
    LDA.W $0003,Y 
    PHX 
    PHY 
    JSL.L .externalFunction 
    PLY 
    PLX 
    TYA 
    CLC : ADC.W #$0005 : TAY 
    RTL 


.externalFunction:
    JML.W [$0012] 
endif ; !FEATURE_KEEP_UNREFERENCED


Instruction_CommonA4_GotoY:
    LDA.W $0000,Y 
    TAY 
    RTL 


Instruction_CommonA4_GotoY_PlusY:
    STY.B $12 
    DEY 
    LDA.W $0000,Y 
    XBA 
    BMI .highByte 
    AND.W #$00FF 
    BRA + 


.highByte:
    ORA.W #$FF00 

  + CLC : ADC.B $12 : TAY 
    RTL 


Instruction_CommonA4_DecrementTimer_GotoYIfNonZero:
    DEC.W $0F90,X 
    BNE Instruction_CommonA4_GotoY 
    INY #2
    RTL 


Instruction_CommonA4_DecrementTimer_GotoYIfNonZero_duplicate:
    DEC.W $0F90,X 
    BNE Instruction_CommonA4_GotoY 
    INY #2
    RTL 


Instruction_CommonA4_DecrementTimer_GotoY_PlusY_IfNonZero:
    SEP #$20 
    DEC.W $0F90,X 
    REP #$20 
    BNE Instruction_CommonA4_GotoY_PlusY 
    INY 
    RTL 


Instruction_CommonA4_TimerInY:
    LDA.W $0000,Y : STA.W $0F90,X 
    INY #2
    RTL 


Instruction_CommonA4_SkipNextInstruction:
    INY #2
    RTL 


Instruction_CommonA4_Sleep:
    DEY #2
    TYA 
    STA.W $0F92,X 
    PLA 
    PEA.W ProcessEnemyInstructions_return-1 
    RTL 


Instruction_CommonA4_WaitYFrames:
    LDA.W $0000,Y : STA.W $0F94,X 
    INY #2
    TYA 
    STA.W $0F92,X 
    PLA 
    PEA.W ProcessEnemyInstructions_return-1 
    RTL 


Instruction_CommonA4_TransferYBytesInYToVRAM:
    PHX 
    LDX.W $0330 
    LDA.W $0000,Y : STA.B $D0,X 
    LDA.W $0002,Y : STA.B $D2,X 
    LDA.W $0003,Y : STA.B $D3,X 
    LDA.W $0005,Y : STA.B $D5,X 
    TXA 
    CLC : ADC.W #$0007 : STA.W $0330 
    TYA 
    CLC : ADC.W #$0007 : TAY 
    PLX 
    RTL 


Instruction_CommonA4_EnableOffScreenProcessing:
    LDA.W $0F86,X 
    ORA.W #$0800 
    STA.W $0F86,X 
    RTL 


Instruction_CommonA4_DisableOffScreenProcessing:
    LDA.W $0F86,X 
    AND.W #$F7FF 
    STA.W $0F86,X 
    RTL 


CommonA4EnemySpeeds_LinearlyIncreasing:
    dw $0000,$0000,$0000,$0000,$0000,$1000,$FFFF,$F000 
    dw $0000,$2000,$FFFF,$E000,$0000,$3000,$FFFF,$D000 
    dw $0000,$4000,$FFFF,$C000,$0000,$5000,$FFFF,$B000 
    dw $0000,$6000,$FFFF,$A000,$0000,$7000,$FFFF,$9000 
    dw $0000,$8000,$FFFF,$8000,$0000,$9000,$FFFF,$7000 
    dw $0000,$A000,$FFFF,$6000,$0000,$B000,$FFFF,$5000 
    dw $0000,$C000,$FFFF,$4000,$0000,$D000,$FFFF,$3000 
    dw $0000,$E000,$FFFF,$2000,$0000,$F000,$FFFF,$1000 
    dw $0001,$0000,$FFFF,$0000,$0001,$1000,$FFFE,$F000 
    dw $0001,$2000,$FFFE,$E000,$0001,$3000,$FFFE,$D000 
    dw $0001,$4000,$FFFE,$C000,$0001,$5000,$FFFE,$B000 
    dw $0001,$6000,$FFFE,$A000,$0001,$7000,$FFFE,$9000 
    dw $0001,$8000,$FFFE,$8000,$0001,$9000,$FFFE,$7000 
    dw $0001,$A000,$FFFE,$6000,$0001,$B000,$FFFE,$5000 
    dw $0001,$C000,$FFFE,$4000,$0001,$D000,$FFFE,$3000 
    dw $0001,$E000,$FFFE,$2000,$0001,$F000,$FFFE,$1000 
    dw $0002,$0000,$FFFE,$0000,$0002,$1000,$FFFD,$F000 
    dw $0002,$2000,$FFFD,$E000,$0002,$3000,$FFFD,$D000 
    dw $0002,$4000,$FFFD,$C000,$0002,$5000,$FFFD,$B000 
    dw $0002,$6000,$FFFD,$A000,$0002,$7000,$FFFD,$9000 
    dw $0002,$8000,$FFFD,$8000,$0002,$9000,$FFFD,$7000 
    dw $0002,$A000,$FFFD,$6000,$0002,$B000,$FFFD,$5000 
    dw $0002,$C000,$FFFD,$4000,$0002,$D000,$FFFD,$3000 
    dw $0002,$E000,$FFFD,$2000,$0002,$F000,$FFFD,$1000 
    dw $0003,$0000,$FFFD,$0000,$0003,$1000,$FFFC,$F000 
    dw $0003,$2000,$FFFC,$E000,$0003,$3000,$FFFC,$D000 
    dw $0003,$4000,$FFFC,$C000,$0003,$5000,$FFFC,$B000 
    dw $0003,$6000,$FFFC,$A000,$0003,$7000,$FFFC,$9000 
    dw $0003,$8000,$FFFC,$8000,$0003,$9000,$FFFC,$7000 
    dw $0003,$A000,$FFFC,$6000,$0003,$B000,$FFFC,$5000 
    dw $0003,$C000,$FFFC,$4000,$0003,$D000,$FFFC,$3000 
    dw $0003,$E000,$FFFC,$2000,$0003,$F000,$FFFC,$1000 
    dw $0004,$0000,$FFFC,$0000 

CommonA4EnemySpeeds_QuadraticallyIncreasing:
    dw $0000,$0000,$0000,$0000,$0109,$0000,$FEF7,$FFFF 
    dw $031B,$0000,$FCE5,$FFFF,$0636,$0000,$F9CA,$FFFF 
    dw $0A5A,$0000,$F5A6,$FFFF,$0F87,$0000,$F079,$FFFF 
    dw $15BD,$0000,$EA43,$FFFF,$1CFC,$0000,$E304,$FFFF 
    dw $2544,$0000,$DABC,$FFFF,$2E95,$0000,$D16B,$FFFF 
    dw $38EF,$0000,$C711,$FFFF,$4452,$0000,$BBAE,$FFFF 
    dw $50BE,$0000,$AF42,$FFFF,$5E33,$0000,$A1CD,$FFFF 
    dw $6CB1,$0000,$934F,$FFFF,$7C38,$0000,$83C8,$FFFF 
    dw $8CC8,$0000,$7338,$FFFF,$9E61,$0000,$619F,$FFFF 
    dw $B103,$0000,$4EFD,$FFFF,$C4AE,$0000,$3B52,$FFFF 
    dw $D962,$0000,$269E,$FFFF,$EF1F,$0000,$10E1,$FFFF 
    dw $05E5,$0000,$FA1B,$FFFF,$14B4,$0001,$EB4C,$FFFE 
    dw $2D8C,$0001,$D274,$FFFE,$476D,$0001,$B893,$FFFE 
    dw $6257,$0001,$9DA9,$FFFE,$7E4A,$0001,$81B6,$FFFE 
    dw $9B46,$0001,$64BA,$FFFE,$B94B,$0001,$46B5,$FFFE 
    dw $D859,$0001,$27A7,$FFFE,$F870,$0001,$0790,$FFFE 
    dw $1090,$0002,$EF70,$FFFD,$32B9,$0002,$CD47,$FFFD 
    dw $55EB,$0002,$AA15,$FFFD,$7A26,$0002,$85DA,$FFFD 
    dw $9F6A,$0002,$6096,$FFFD,$C5B7,$0002,$3A49,$FFFD 
    dw $ED0D,$0002,$12F3,$FFFD,$0C6C,$0003,$F394,$FFFC 
    dw $35D4,$0003,$CA2C,$FFFC,$6045,$0003,$9FBB,$FFFC 
    dw $8BBF,$0003,$7441,$FFFC,$B842,$0003,$47BE,$FFFC 
    dw $E5CE,$0003,$1A32,$FFFC,$0B63,$0004,$F49D,$FFFB 
    dw $3B01,$0004,$C4FF,$FFFB,$6BA8,$0004,$9458,$FFFB 
    dw $9D58,$0004,$62A8,$FFFB,$D011,$0004,$2FEF,$FFFB 
    dw $03D3,$0004,$FC2D,$FFFB,$2F9E,$0005,$D062,$FFFA 
    dw $6572,$0005,$9A8E,$FFFA,$9C4F,$0005,$63B1,$FFFA 
    dw $D435,$0005,$2BCB,$FFFA,$0424,$0006,$FBDC,$FFF9 
    dw $3E1C,$0006,$C1E4,$FFF9,$791D,$0006,$86E3,$FFF9 
    dw $B527,$0006,$4AD9,$FFF9,$F23A,$0006,$0DC6,$FFF9 
    dw $2756,$0007,$D8AA,$FFF8,$667B,$0007,$9985,$FFF8 
    dw $A6A9,$0007,$5957,$FFF8,$E7E0,$0007,$1820,$FFF8 
    dw $2120,$0008,$DEE0,$FFF7,$6469,$0008,$9B97,$FFF7 
    dw $A8BB,$0008,$5745,$FFF7,$EE16,$0008,$11EA,$FFF7 
    dw $2B7A,$0009,$D486,$FFF6,$72E7,$0009,$8D19,$FFF6 
    dw $BB5D,$0009,$44A3,$FFF6,$04DC,$0009,$FB24,$FFF6 
    dw $4664,$000A,$B99C,$FFF5,$91F5,$000A,$6E0B,$FFF5 
    dw $DE8F,$000A,$2171,$FFF5,$2332,$000B,$DCCE,$FFF4 
    dw $71DE,$000B,$8E22,$FFF4,$C193,$000B,$3E6D,$FFF4 
    dw $0951,$000C,$F6AF,$FFF3,$5B18,$000C,$A4E8,$FFF3 
    dw $ADE8,$000C,$5218,$FFF3,$01C1,$000C,$FE3F,$FFF3 
    dw $4DA3,$000D,$B25D,$FFF2,$A38E,$000D,$5C72,$FFF2 
    dw $FA82,$000D,$057E,$FFF2,$497F,$000E,$B681,$FFF1 
    dw $A285,$000E,$5D7B,$FFF1,$FC94,$000E,$036C,$FFF1 
    dw $4EAC,$000F,$B154,$FFF0,$AACD,$000F,$5533,$FFF0 
    dw $07F7,$000F,$F809,$FFF0,$5D2A,$0010,$A2D6,$FFEF 
    dw $BC66,$0010,$439A,$FFEF,$13AB,$0011,$EC55,$FFEE 
    dw $74F9,$0011,$8B07,$FFEE 

HurtAI_Crocomire:
    LDX.W $0E54 
    JSL.L UpdateCrocomireBG2Scroll 
    JSR.W CrocomireHurtFlashHandling 
    RTL 


CrocomireConstants_mouthCloseDelayWhenDamaged_NotProjAttack:
    dw $0008 

CrocomireConstants_mouthCloseDelayWhenDamaged_ProjAttack:
    dw $0008 

CrocomireConstants_index:
    dw $0000 

CrocomireConstants_stepsWhenDamagedByChargeBeam:
    dw $0002 

CrocomireConstants_stepsWhenDamagedByMissile:
    dw $0001 

CrocomireConstants_stepsWhenDamagedBySuperMissile:
    dw $0003 

CrocomireConstants_powerBombReactionEnableFlag:
    dw $0003 

CrocomireConstants_mouthOpenInstructionTimer:
    dw $0008 

CrocomireConstants_XThresholdSpikeWall:
    dw $0300 

CrocomireConstants_XThresholdBridge:
    dw $0640 

Instruction_Crocomire_FightAI:
    PHX 
    LDX.W $0E54 
    LDA.W $0FAC,X 
    TAX 
    JSR.W (.pointers,X) 
    PLX 
    RTL 


.pointers:
    dw FightAI_Crocomire_0_LockUp_SetInitialInstList 
    dw FightAI_Crocomire_2_StepForwardUntilOnScreen_StepForward 
    dw FightAI_Crocomire_4_Asleep 
    dw FightAI_Crocomire_6_SteppingForward 
    dw FightAI_Crocomire_8_ProjectileAttack 
    dw FightAI_Crocomire_A_NearSpikeWallCharge 
    dw FightAI_Crocomire_C_SteppingBack 
    dw FightAI_Crocomire_E_BackOffFromSpikeWall 
    dw UNUSED_FightAI_Crocomire_10_RoarAndStepForwards_A487FB 
    dw FightAI_Crocomire_12_WaitForFirstDamage 
    dw FightAI_Crocomire_14_WaitForSecondDamage 
    dw UNUSED_FightAI_Crocomire_16_WaitForSecondDamage_A4885A 
    dw FightAI_Crocomire_18_PowerBombedCharge 
    dw UNUSED_FightAI_Crocomire_1A_DoNearSpikeWallCharge_A4889A 
    dw FightAI_Crocomire_1C_UnusedSequence_SetInitialInstList 
    dw UNUSED_FightAI_Crocomire_1E_ChooseForwardMovingAttack_A4891B 
    dw UNUSED_FightAI_Crocomire_20_DoNothingAndStepForward_A48940 
    dw UNUSED_FightAI_Crocomire_22_MoveForwardUntilHitSamus_A4895E 
    dw UNUSED_FightAI_Crocomire_24_MoveClaws_StepForward_A489A8 
    dw UNUSED_FightAI_Crocomire_26_StepForward_A489DE 
    dw UNUSED_FightAI_Crocomire_28_MovingClaws_A489F9 

RTS_A486DD:
    RTS 


FightAI_Crocomire_0_LockUp_SetInitialInstList:
    LDY.W #InstList_Crocomire_Initial 
    LDA.W #$0001 : STA.W $0F94,X 
    RTS 


FightAI_Crocomire_2_StepForwardUntilOnScreen_StepForward:
    LDA.W #$0004 : STA.W $0FAC 
    LDY.W #InstList_Crocomire_StepForward 
    RTS 


FightAI_Crocomire_4_Asleep:
    LDA.W $0F7A : SEC : SBC.W $0AF6 : BPL + 
    EOR.W #$FFFF 
    INC A 

  + CMP.W #$00E0 
    BPL .return 
    LDA.W $0FAA 
    ORA.W #$8000 
    STA.W $0FAA 
    LDY.W #InstList_Crocomire_WaitForFirstSecondDamage 
    LDA.W #$0012 : STA.W $0FAC 

.return:
    RTS 


FightAI_Crocomire_6_SteppingForward:
    LDA.W $0FAA 
    BIT.W #$0800 
    BEQ .step 
    LDA.W $0FAA 
    AND.W #$F7FF 
    STA.W $0FAA 
    LDA.W $0FAE 
    BEQ .step 
    LDY.W #InstList_Crocomire_StepBack 
    LDA.W #$000C : STA.W $0FAC 
    RTS 


.step:
    LDA.W $0F7A 
    CMP.W CrocomireConstants_XThresholdSpikeWall 
    BMI .nearSpikeWall 
    CPY.W #InstList_Crocomire_SteppingBack 
    BMI .return 
    LDY.W #InstList_Crocomire_StepForward 

.return:
    RTS 


.nearSpikeWall:
    LDY.W #InstList_CrocomireTongue_NearSpikeWallCharge_0 
    LDA.W #$000A : STA.W $0FAC 
    RTS 


Instruction_Crocomire_MaybeStartProjectileAttack:
    PHX 
    LDA.W $05E5 
    AND.W #$0FFF 
    CMP.W #$0400 
    BPL .return 
    LDA.W #$0008 : STA.W $0FAC 
    STZ.W $0FB2 
    LDY.W #InstList_Crocomire_ProjectileAttack_0 

.return:
    PLX 
    RTL 


FightAI_Crocomire_8_ProjectileAttack:
    LDA.W $0FAA 
    BIT.W #$0800 
    BEQ .notDamaged 
    AND.W #$F7FF 
    STA.W $0FAA 
    LDY.W #InstList_Crocomire_StepBack 
    LDA.W #$000C : STA.W $0FAC 
    RTS 


.notDamaged:
    LDA.W $0FB2 
    CMP.W #$0012 
    BPL .stepForward 
    INC.W $0FB2 
    INC.W $0FB2 
    PHX 
    PHY 
    LDX.W $0E54 
    LDY.W #EnemyProjectile_CrocomiresProjectile 
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    LDA.W #$001C 
    JSL.L QueueSound_Lib3_Max6 
    PLY 
    PLX 
    RTS 


.stepForward:
    LDY.W #InstList_Crocomire_StepForwardAfterDelay 
    LDA.W #$0006 : STA.W $0FAC 
    RTS 


FightAI_Crocomire_A_NearSpikeWallCharge:
    LDA.W $0FAA 
    BIT.W #$0800 
    BEQ .return 
    AND.W #$F7FF 
    STA.W $0FAA 
    LDY.W #InstList_Crocomire_StepBack 
    LDA.W #$000C : STA.W $0FAC 

.return:
    RTS 


FightAI_Crocomire_C_SteppingBack:
    LDA.W $0FAE 
    BEQ .stepForward 
    DEC A 
    STA.W $0FAE 
    BEQ .stepForward 
    LDY.W #InstList_Crocomire_SteppingBack 
    LDA.W #$000C : STA.W $0FAC 
    RTS 


.stepForward:
    LDA.W #$0006 : STA.W $0FAC 
    LDY.W #InstList_Crocomire_StepForward 
    RTS 


FightAI_Crocomire_E_BackOffFromSpikeWall:
    LDA.W $0F7A 
    CMP.W CrocomireConstants_XThresholdSpikeWall 
    BMI .return 
    LDA.W #$0006 : STA.W $0FAC 
    LDY.W #InstList_Crocomire_StepForward 

.return:
    RTS 


UNUSED_FightAI_Crocomire_10_RoarAndStepForwards_A487FB:
    LDA.W #$0006 : STA.W $0FAC 
    LDY.W #InstList_Crocomire_WaitForFirstSecondDamage_Roar 
    RTS 


UNUSED_SetFightIntroMovingClawsInstList_A48805:
    LDY.W #InstList_Crocomire_WaitForFirstSecondDamage_MovingClaws 
    LDA.W $0FAA 
    AND.W #$FBFF 
    STA.W $0FAA 
    RTS 


FightAI_Crocomire_12_WaitForFirstDamage:
    LDA.W $0FAA 
    BIT.W #$0800 
    BEQ .notDamaged 
    LDA.W $0FAA 
    AND.W #$F7FF 
    STA.W $0FAA 
    LDY.W #InstList_Crocomire_StepBack 
    LDA.W #$0014 : STA.W $0FAC 
    RTS 


.notDamaged:
    CPY.W #InstList_Crocomire_WaitForFirstSecondDamage_RoarCloseMouth_1 
    BMI .return 
    LDY.W #InstList_Crocomire_WaitForFirstSecondDamage_Roar 

.return:
    RTS 


FightAI_Crocomire_14_WaitForSecondDamage:
    LDA.W $0FAA 
    BIT.W #$0800 
    BEQ .notDamaged 
    LDA.W $0FAA 
    AND.W #$F7FF 
    STA.W $0FAA 
    LDY.W #InstList_Crocomire_StepBack 
    LDA.W #$000C : STA.W $0FAC 
    RTS 


.notDamaged:
    CPY.W #InstList_Crocomire_WaitForFirstSecondDamage_RoarCloseMouth_1 
    BMI .return 
    LDY.W #InstList_Crocomire_WaitForFirstSecondDamage_Roar 

.return:
    RTS 


UNUSED_FightAI_Crocomire_16_WaitForSecondDamage_A4885A:
    LDA.W $0FAA 
    BIT.W #$0800 
    BEQ .notDamaged 
    LDA.W $0FAA 
    AND.W #$F7FF 
    STA.W $0FAA 
    LDY.W #InstList_Crocomire_StepBack 
    LDA.W #$000C : STA.W $0FAC 
    RTS 


.notDamaged:
    CPY.W #InstList_Crocomire_WaitForFirstSecondDamage_RoarCloseMouth_1 
    BMI .return 
    LDY.W #InstList_Crocomire_WaitForFirstSecondDamage_Roar 

.return:
    RTS 


FightAI_Crocomire_18_PowerBombedCharge:
    LDX.W $0E54 
    LDA.W $0FAE 
    DEC A 
    STA.W $0FAE 
    CMP.W #$0002 
    BPL .return 
    STZ.W $0FAE 
    LDA.W #$0006 : STA.W $0FAC 
    LDY.W #InstList_Crocomire_StepForward 

.return:
    RTS 


UNUSED_FightAI_Crocomire_1A_DoNearSpikeWallCharge_A4889A:
    LDX.W $0E54 
    LDA.W $0FAA 
    BIT.W #$0800 
    BNE .SamusNotHitByClaw 
    LDA.W #$000A : STA.W $0FAC,X 
    LDY.W #InstList_Crocomire_WaitForFirstSecondDamage_RoarCloseMouth_0 
    RTS 


.SamusNotHitByClaw:
    AND.W #$BF00 
    ORA.W #$A000 
    STA.W $0FAA 
    LDA.W #$0001 : STA.W $0FAE 
    LDA.W #$000A : STA.W $0FB0 
    LDA.W #$000C : STA.W $0FAC 
    LDA.W #$0054 
    JSL.L QueueSound_Lib2_Max6 
    RTS 


FightAI_Crocomire_1C_UnusedSequence_SetInitialInstList:
    LDX.W $0E54 
    JSR.W FightAI_Crocomire_0_LockUp_SetInitialInstList 
    LDA.W $0FAA 
    ORA.W #$0200 
    STA.W $0FAA 
    LDA.W #$0020 : STA.W $0FAE 
    LDA.W #$001E : STA.W $0FAC 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_ChargeCrocomireForwardOneStepAfterDelay_A488EE:
    LDX.W $0E54 
    JSR.W FightAI_Crocomire_0_LockUp_SetInitialInstList 
    LDA.W $0FAE 
    BEQ .timerExpired 
    DEC.W $0FAE 
    BNE .return 

.timerExpired:
    LDX.W $0E54 
    JSR.W ChargeCrocomireForwardOneStep 
    LDA.W #$0020 : STA.W $0FAC 

.return:
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


ChargeCrocomireForwardOneStep:
    LDA.W #$0014 : STA.W $0FAC,X 
    LDA.W $0FAA : STA.W $0FAA 
    LDY.W #UNUSED_InstList_Crocomire_ChargeForwardOneStep_A4BAEA 
    RTS 


UNUSED_FightAI_Crocomire_1E_ChooseForwardMovingAttack_A4891B:
    LDX.W $0E54 
    LDA.W $0FAA 
    BIT.W #$0100 
    BNE .setInstList 
    JSR.W ChargeCrocomireForwardOneStep 
    LDA.W #$0020 : STA.W $0FAC 
    RTS 


.setInstList:
    JSR.W FightAI_Crocomire_0_LockUp_SetInitialInstList 
    LDA.W #$0010 : STA.W $0FAE 
    LDA.W #$0022 : STA.W $0FAC 
    RTS 


UNUSED_FightAI_Crocomire_20_DoNothingAndStepForward_A48940:
    LDX.W $0E54 
    JSR.W FightAI_Crocomire_0_LockUp_SetInitialInstList 
    LDA.W $0FAE 
    BNE .return 
    LDA.W $0FAA 
    ORA.W #$2000 
    STA.W $0FAA 
    JSR.W FightAI_Crocomire_2_StepForwardUntilOnScreen_StepForward 
    LDA.W #$0024 : STA.W $0FAC 

.return:
    RTS 


UNUSED_FightAI_Crocomire_22_MoveForwardUntilHitSamus_A4895E:
    LDA.W $0F7A 
    CMP.W #$02A0 
    BPL .notAgainstSpikes 
    LDX.W $0E54 
    JSR.W FightAI_Crocomire_2_StepForwardUntilOnScreen_StepForward 
    LDA.W #$0024 : STA.W $0FAC 
    LDA.W #$0003 : STA.W $0FAE 
    RTS 


.notAgainstSpikes:
    LDA.W $0FAA 
    BIT.W #$4000 
    BNE .SamusHitByClaw 
    LDA.W #$0026 : STA.W $0FAC 
    JSR.W UNUSED_SetFightIntroMovingClawsInstList_A48805 

.SamusHitByClaw:
    LDA.W $0FAA 
    BIT.W #$4000 
    BEQ .return 
    LDA.W #$0005 : STA.W $0FAE 
    LDY.W #InstList_Crocomire_WaitForFirstSecondDamage_MovingClaws 
    LDA.W $0FAC : STA.W $0FB2 
    LDA.W #$002A : STA.W $0FAC 

.return:
    RTS 


UNUSED_FightAI_Crocomire_24_MoveClaws_StepForward_A489A8:
    LDX.W $0E54 
    LDA.W $0FAE 
    BEQ .timerExpired 
    DEC.W $0FAE 
    BEQ .timerExpired 
    LDA.W #$0024 : STA.W $0FAC 
    STZ.W $0FEE 
    LDA.W $0FAA 
    ORA.W #$0400 
    STA.W $0FAA 
    LDY.W #InstList_Crocomire_WaitForFirstSecondDamage_MovingClaws 
    RTS 


.timerExpired:
    JSR.W FightAI_Crocomire_2_StepForwardUntilOnScreen_StepForward 
    LDA.W #$0028 : STA.W $0FAC 
    LDA.W $0FAA 
    AND.W #$FBFF 
    STA.W $0FAA 
    RTS 


UNUSED_FightAI_Crocomire_26_StepForward_A489DE:
    LDA.W $0FAA 
    BIT.W #$2000 
    BNE .stepForward 
    AND.W #$FCFF 
    STA.W $0FAA 

.stepForward:
    LDX.W $0E54 
    JSR.W FightAI_Crocomire_2_StepForwardUntilOnScreen_StepForward 
    LDA.W #$0028 : STA.W $0FAC 
    RTS 


UNUSED_FightAI_Crocomire_28_MovingClaws_A489F9:
    LDA.W $0FAE 
    BNE .timerNotExpired 
    LDA.W $0FAA 
    AND.W #$BFFF 
    STA.W $0FAA 
    LDA.W #$0001 : STA.W $0F94 
    LDA.W $0FB2 : STA.W $0FAC 
    LDY.W #InstList_Crocomire_WaitForFirstSecondDamage_MovingClaws 
    RTS 


.timerNotExpired:
    LDA.W $0FAA 
    BIT.W #$4000 
    BEQ .steppingBack 
    DEC.W $0FAE 
    LDA.W #$003B 
    JSL.L QueueSound_Lib2_Max6 
    LDY.W #InstList_Crocomire_WaitForFirstSecondDamage_MovingClaws 
    RTS 


.steppingBack:
    AND.W #$BFFF 
    STA.W $0FAA 
    LDA.W #$000C : STA.W $0FAC 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Palette_Crocomire_A48A3A:
    dw $3800,$7FFF,$6B40,$6A80,$6980,$68E0,$6800,$5294 
    dw $39CE,$2108,$08BF,$0895,$039F,$023A,$0176,$0000 
endif ; !FEATURE_KEEP_UNREFERENCED

InitAI_Crocomire:
    REP #$30 
    LDA.W #$0006 : STA.W $179C 
    LDX.W #$0000 
    LDA.W #$0338 

.loopBG2Tilemap:
    STA.L $7E2000,X 
    INX #2
    CPX.W #$1000 
    BMI .loopBG2Tilemap 
    LDX.W $079F 
    LDA.L $7ED828,X 
    BIT.W #$0002 
    BNE .dead 
    JSL.L DisableMinimap_MarkBossRoomTilesExplored 
    STZ.W $069A 
    LDX.W $0E54 
    STZ.W $0FA8,X 
    STZ.W $0FB0,X 
    LDA.W #$0000 : STA.L $7ECD20 
    LDX.W #$0020 

.loopTargetPalette:
    LDA.W Palette_Crocomire_Sprite2,X : STA.L $7EC340,X 
    LDA.W Palette_Crocomire_Sprite5,X : STA.L $7EC3A0,X 
    DEX #2
    BPL .loopTargetPalette 
    LDX.W $0E54 
    LDA.W #$0004 : STA.W $0FAC,X 
    LDA.W #$0010 : STA.W $179E 
    LDA.W #$0002 : STA.W $0941 
    LDA.W #$0400 : STA.W $179A 
    LDA.W #InstList_Crocomire_Initial : STA.W $0F92,X 
    LDA.W $0F88,X 
    ORA.W #$0004 
    STA.W $0F88,X 
    LDA.W #$0001 : STA.W $0F94,X 
    RTL 


.dead:
    LDA.W #$0101 : STA.L $7ECD20 
    STA.L $7ECD22 
    STZ.W $0688 
    LDA.W $0F86 
    ORA.W #$0400 
    AND.W #$7FFF 
    STA.W $0F86 
    JSL.L Spawn_Hardcoded_PLM 
    db $20,$03 
    dw PLMEntries_clearCrocomireInvisibleWall 
    JSL.L Spawn_Hardcoded_PLM 
    db $1E,$03 
    dw PLMEntries_clearCrocomireInvisibleWall 
    JSL.L Spawn_Hardcoded_PLM 
    db $61,$0B 
    dw PLMEntries_clearCrocomiresBridge 
    LDA.W #$0054 : STA.W $0FA8 
    LDA.W #InstList_CrocomireCorpse_Skeleton_Dead : STA.W $0F92 
    LDA.W #$0001 : STA.W $0F94 
    LDA.W #$0240 : STA.W $0F7A 
    LDA.W #$0090 : STA.W $0F7E 
    LDA.W #$001C : STA.W $0F84 
    LDA.W #$0028 : STA.W $0F82 
    LDX.W $0330 
    LDA.W #$0800 : STA.B $D0,X 
    LDA.W #$2000 : STA.B $D2,X 
    LDA.W #$007E : STA.B $D4,X 
    LDA.B $59 
    AND.W #$00FC 
    XBA 
    STA.B $D5,X 
    TXA 
    CLC : ADC.W #$0007 : STA.W $0330 
    RTL 


UpdateCrocomireBG2Scroll:
    LDA.W $0F7E,X : SEC : SBC.W #$0043 : EOR.W #$FFFF 
    INC A 
    STA.B $B7 
    LDX.W #$0020 

.loop:
    LDA.W $0F8E 
    CMP.W .pointers,X 
    BEQ .found 
    DEX #2
    BPL .loop 
    BRA UpdateCrocomireBG2XScroll 


.pointers:
    dw ExtendedSpritemap_Crocomire_ChargeForward_StepBack_0 
    dw ExtendedSpritemap_Crocomire_ChargeForward_StepBack_1 
    dw ExtendedSpritemap_Crocomire_ChargeForward_StepBack_2 
    dw ExtendedSpritemap_Crocomire_ChargeForward_StepBack_3 
    dw ExtendedSpritemap_Crocomire_ChargeForward_StepBack_4 
    dw ExtendedSpritemap_Crocomire_ChargeForward_StepBack_5 
    dw ExtendedSpritemap_Crocomire_ChargeForward_StepBack_6 
    dw ExtendedSpritemap_Crocomire_ChargeForward_StepBack_7 
    dw ExtendedSpritemap_Crocomire_ChargeForward_StepBack_8 
    dw ExtendedSpritemap_Crocomire_ChargeForward_StepBack_9 
    dw ExtendedSpritemap_Crocomire_ChargeForward_StepBack_A 
    dw ExtendedSpritemap_Crocomire_ChargeForward_StepBack_B 
    dw ExtendedSpritemap_Crocomire_MovingClaws_0 
    dw ExtendedSpritemap_Crocomire_MovingClaws_1 
    dw ExtendedSpritemap_Crocomire_MovingClaws_2 
    dw ExtendedSpritemap_Crocomire_MovingClaws_3 
    dw ExtendedSpritemap_Crocomire_MovingClaws_4 

.found:
    TAY 
    LDA.W $001C,Y : CLC : ADC.B $B7 : STA.B $B7 ; fallthrough to UpdateCrocomireBG2XScroll

UpdateCrocomireBG2XScroll:
    LDX.W $0E54 
    LDA.W $0F7A,X : CLC : ADC.W $0FE8,X : STA.W $0FBA,X 
    LDA.W $0F7E,X : STA.W $0FBE,X 
    LDA.W $0F7A,X 
    CMP.W $0911 
    BPL .rightOffScreenCheck 
    CLC : ADC.W #$0080 : CMP.W $0911 
    BMI .offScreen 

.onScreen:
    LDA.W $0911 : SEC : SBC.W $0F7A,X : CLC : ADC.W #$0033 : PHA 
    BPL + 
    EOR.W #$FFFF 
    INC A 

  + CMP.W #$011C 
    BMI + 
    PLA 
    LDA.W #$0100 
    PHA 

  + PLA 
    STA.B $B5 
    RTL 


.offScreen:
    LDA.W #$0100 : STA.B $B5 
    RTL 


.rightOffScreenCheck:
    LDA.W $0911 : CLC : ADC.W #$0100 : STA.B $12 
    LDA.W $0F7A,X : SEC : SBC.W #$0080 : CMP.B $12 
    BPL .offScreen 
    BRA .onScreen 


MainAI_Crocomire:
    PHB 
    LDA.W $0FA8 
    TAX 
    JSR.W (.pointers,X) 
    JSR.W Crocomire_vs_Samus_CollisionHandling 
    JSR.W CrocomireHurtFlashHandling 
    PLB 
    RTL 


.pointers:
    dw MainAI_Crocomire_DeathSequence_0_NotStarted 
    dw MainAI_Crocomire_DeathSequence_2_Falling 
    dw MainAI_Crocomire_DeathSequence_4_A_Hop_1_2_Resting 
    dw MainAI_Crocomire_DeathSequence_6_C_Hop_1_2_Rising 
    dw MainAI_Crocomire_DeathSequence_8_E_Hop_1_2_Sinking 
    dw MainAI_Crocomire_DeathSequence_4_A_Hop_1_2_Resting 
    dw MainAI_Crocomire_DeathSequence_6_C_Hop_1_2_Rising 
    dw MainAI_Crocomire_DeathSequence_8_E_Hop_1_2_Sinking 
    dw MainAI_Crocomire_DeathSequence_10_Hop_3_LoadMeltingTilemap 
    dw MainAI_Crocomire_DeathSequence_12_2E_Hop_3_4_LoadMeltTiles 
    dw MainAI_Crocomire_DeathSequence_14_30_Hop_3_6_UploadingToVRAM 
    dw MainAI_Crocomire_DeathSequence_16_22_28_Hop_3_4_5_Rising 
    dw MainAI_Crocomire_DeathSequence_18_Hop_3_QueueCry_HDMAObject 
    dw MainAI_Crocomire_DeathSequence_1A_38_Hop_3_6_Melting 
    dw MainAI_Crocomire_DeathSequence_1C_3A_Hop_3_6_ClearTilemap 
    dw MainAI_Crocomire_DeathSequence_1E_24_2A_Hop_3_4_5_Sinking 
    dw MainAI_Crocomire_DeathSequence_20_26_Hop_4_5_Resting 
    dw MainAI_Crocomire_DeathSequence_16_22_28_Hop_3_4_5_Rising 
    dw MainAI_Crocomire_DeathSequence_1E_24_2A_Hop_3_4_5_Sinking 
    dw MainAI_Crocomire_DeathSequence_20_26_Hop_4_5_Resting 
    dw MainAI_Crocomire_DeathSequence_16_22_28_Hop_3_4_5_Rising 
    dw MainAI_Crocomire_DeathSequence_1E_24_2A_Hop_3_4_5_Sinking 
    dw MainAI_Crocomire_DeathSequence_2C_Hop_6_LoadMeltingTilemap 
    dw MainAI_Crocomire_DeathSequence_12_2E_Hop_3_4_LoadMeltTiles 
    dw MainAI_Crocomire_DeathSequence_14_30_Hop_3_6_UploadingToVRAM 
    dw MainAI_Crocomire_DeathSequence_32_SetIndex34 
    dw MainAI_Crocomire_DeathSequence_34_Hop_6_Rising 
    dw MainAI_Crocomire_DeathSequence_36_Hop_6_QueueCry_HDMAObject 
    dw MainAI_Crocomire_DeathSequence_1A_38_Hop_3_6_Melting 
    dw MainAI_Crocomire_DeathSequence_1C_3A_Hop_3_6_ClearTilemap 
    dw MainAI_Crocomire_DeathSequence_3C_Hop_6_Sinking 
    dw MainAI_Crocomire_DeathSequence_3E_BehindWall_WaitForSamus 
    dw MainAI_Crocomire_DeathSequence_40_BehindWall_Rumbling 
    dw MainAI_Crocomire_DeathSequence_42_BehindWall_NoMoreRumbling 
    dw MainAI_Crocomire_DeathSequence_44_BreaksDownWall 
    dw MainAI_Crocomire_DeathSequence_46_SkeletonFalls 
    dw MainAI_Crocomire_DeathSequence_48_SkeletonFallsApart 
    dw MainAI_Crocomire_DeathSequence_4A_UnlockCamera 
    dw MainAI_Crocomire_DeathSequence_4C_SetIndex4E 
    dw MainAI_Crocomire_DeathSequence_4E_SetIndex50 
    dw MainAI_Crocomire_DeathSequence_50_MarkEvent_PostDeathMusic 
    dw RTS_A48C8F 
    dw MainAI_Crocomire_DeathSequence_54_SetIndex56 
    dw MainAI_Crocomire_DeathSequence_56_DeadDueToRoomEntry 
    dw MainAI_Crocomire_DeathSequence_58_FlowingDownTheRiver 

MainAI_Crocomire_DeathSequence_0_NotStarted:
    JSL.L HandleCrocomiresBridge 
    LDA.W #$0101 : STA.L $7ECD24 
    LDA.W $0AF6 
    CMP.W #$0520 
    BMI .bridgeNotInSight 
    LDA.W #$0100 : STA.L $7ECD24 

.bridgeNotInSight:
    LDX.W $0E54 
    JSL.L UpdateCrocomireBG2Scroll ; fallthrough to RTS_A48C8F

RTS_A48C8F:
    RTS 


MainAI_Crocomire_DeathSequence_56_DeadDueToRoomEntry:
    STZ.B $B5 
    STZ.B $B7 
    RTS 


Crocomire_vs_Samus_CollisionHandling:
    LDA.W $0FA8 
    BNE .return 
    LDA.W $0F7A : SEC : SBC.W $0F82 : SBC.W $0AFE : SBC.W $0AF6 : BPL .return 
    JSL.L NormalEnemyTouchAI 
    LDA.W $0F7A : SEC : SBC.W $0F82 : SEC : SBC.W $0AFE : STA.W $0AF6 
    STA.W $0B10 
    LDA.W #$FFFC : STA.W $0B58 
    LDA.W #$FFFF : STA.W $0B5C 

.return:
    RTS 


CrocomireHurtFlashHandling:
    LDA.W $0797 
    BNE .return 
    LDA.W $0F9C 
    BEQ .palette 
    LDA.W $0E44 
    BIT.W #$0002 
    BEQ .palette 
    LDA.W #$7FFF 
    LDX.W #$000E 

.loopWhite:
    STA.L $7EC0E0,X 
    DEX #2
    BPL .loopWhite 
    RTS 


.palette:
    LDX.W #$000E 

.loopPalette:
    LDA.W Palette_Crocomire_BG12,X : STA.L $7EC0E0,X 
    DEX #2
    BPL .loopPalette 

.return:
    RTS 


Instruction_Crocomire_QueueCrySFX:
    PHX 
    PHY 
    LDA.W #$0074 
    JSL.L QueueSound_Lib2_Max6 
    PLY 
    PLX 
    RTL 


Instruction_Crocomire_QueueBigExplosionSFX:
    PHX 
    PHY 
    LDA.W #$0025 
    JSL.L QueueSound_Lib2_Max6 
    PLY 
    PLX 
    RTL 


Instruction_Crocomire_QueueSkeletonCollapseSFX:
    PHX 
    PHY 
    LDA.W #$0075 
    JSL.L QueueSound_Lib2_Max6 
    PLY 
    PLX 
    RTL 


HandlePlayingCrocomireAcidDamageSFX:
    PHX 
    PHY 
    LDA.L $7E8000 
    BEQ .return 
    DEC A 
    STA.L $7E8000 
    BNE .return 
    LDA.W #$0020 : STA.L $7E8000 
    LDA.W #$0022 
    JSL.L QueueSound_Lib3_Max6 

.return:
    PLY 
    PLX 
    RTL 


MainAI_Crocomire_DeathSequence_4_A_Hop_1_2_Resting:
    JSL.L HandlePlayingCrocomireAcidDamageSFX 
    JSL.L UpdateCrocomireBG2XScroll 

MainAI_Crocomire_DeathSequence_20_26_Hop_4_5_Resting:
    LDA.W $0FAE 
    BEQ .timerExpired 
    DEC A 
    STA.W $0FAE 
    RTS 


.timerExpired:
    INC.W $0FA8 
    INC.W $0FA8 
    LDA.W #$0300 : STA.W $0FB0 
    RTS 


HandleCrocomiresBridge:
    PHY 
    LDA.W $0F7A 
    CMP.W #$0600 
    BMI .notOnBridge 
    CMP.W #$0610 
    BPL .oneBlockDeep 
    LDA.L $7E9000 
    BNE .returnUpper 
    LDA.W #$0001 : STA.L $7E9000 
    LDA.W #$0600 : STA.B $12 
    LDA.W #$00B0 : STA.B $14 
    LDA.W #$0015 
    LDY.W #EnemyProjectile_MiscDust 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 

.returnUpper:
    PLY 
    RTL 


.notOnBridge:
    LDA.W #$0000 : STA.L $7E9000 
    STA.L $7E9002 
    STA.L $7E9006 
    STA.L $7E900A 
    PLY 
    RTL 


.oneBlockDeep:
    LDA.W $0F7A 
    CMP.W #$0610 
    BMI .deadCode 
    CMP.W #$0620 
    BPL .twoBlocksDeep 
    LDA.L $7E9002 
    BNE .returnMiddle 
    LDA.W #$0001 : STA.L $7E9002 
    JSL.L Spawn_Hardcoded_PLM 
    db $61,$0B 
    dw PLMEntries_crumbleABlockOfCrocomiresBridge 
    LDA.W #$0620 : STA.B $12 
    LDA.W #$00B0 : STA.B $14 
    LDA.W #$0015 
    LDY.W #EnemyProjectile_MiscDust 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 

.returnMiddle:
    PLY 
    RTL 


.deadCode:
    LDA.W #$0000 : STA.L $7E9002 
    STA.L $7E9006 
    STA.L $7E900A 
    PLY 
    RTL 


.twoBlocksDeep:
    LDA.W $0F7A 
    CMP.W #$0620 
    BMI .deadCode2 
    CMP.W #$0630 
    BPL .threeBlocksDeep 
    LDA.L $7E9006 
    BNE .returnLower 
    LDA.W #$0001 : STA.L $7E9006 
    JSL.L Spawn_Hardcoded_PLM 
    db $62,$0B 
    dw PLMEntries_crumbleABlockOfCrocomiresBridge 
    JSL.L Spawn_Hardcoded_PLM 
    db $63,$0B 
    dw PLMEntries_crumbleABlockOfCrocomiresBridge 
    LDA.W #$0630 : STA.B $12 
    LDA.W #$00B0 : STA.B $14 
    LDA.W #$0015 
    LDY.W #EnemyProjectile_MiscDust 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 

.returnLower:
    PLY 
    RTL 


.deadCode2:
    LDA.W #$0000 : STA.L $7E9006 
    STA.L $7E900A 
    PLY 
    RTL 


.threeBlocksDeep:
    CMP.W CrocomireConstants_XThresholdBridge 
    BPL .collapseBridge 
    PLY 
    RTL 


.collapseBridge:
    JSR.W CollapseCrocomiresBridge 
    LDA.W #$0001 : STA.L $7E8000 
    LDA.W #$0001 : STA.L $7E9018 
    LDX.W $0E54 
    INC.W $0FA8,X 
    INC.W $0FA8,X 
    LDA.W #$0002 : STA.L $7E7800 
    STA.L $7E7840 
    STA.L $7E7880 
    STA.L $7E78C0 
    STA.L $7E7900 
    STA.L $7E7940 
    LDA.W #$0000 : STA.L $7E7802 
    STA.L $7E7842 
    STA.L $7E7882 
    STA.L $7E78C2 
    STA.L $7E7902 
    STA.L $7E7942 
    LDA.W #$003B 
    JSL.L QueueSound_Lib2_Max6 
    LDA.W #$0000 : STA.L $7E9016 
    JSL.L Spawn_Hardcoded_PLM 
    db $4E,$03 
    dw PLMEntries_createCrocomireInvisibleWall 
    LDA.W #InstList_CrocomireTongue_BridgeCollapsed : STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    LDA.W $0F86,X 
    ORA.W #$0400 
    STA.W $0F86,X 
    LDA.W #$7FFF : STA.W $0FD4,X 
    LDA.W #InstList_Crocomire_Sleep : STA.W $0FD2,X 
    LDA.W $0FC6 
    ORA.W #$0100 
    STA.W $0FC6 
    STZ.W $0FB0,X 
    STZ.W $0FB2,X 
    LDA.W #$0800 : STA.W $0FAE,X 
    LDA.W #$0010 : STA.W $0F84 
    PLY 
    RTL 


CollapseCrocomiresBridge:
    JSL.L Spawn_Hardcoded_PLM 
    db $61,$0B 
    dw PLMEntries_clearABlockOfCrocomiresBridge 
    JSL.L Spawn_Hardcoded_PLM 
    db $62,$0B 
    dw PLMEntries_clearABlockOfCrocomiresBridge 
    JSL.L Spawn_Hardcoded_PLM 
    db $63,$0B 
    dw PLMEntries_clearABlockOfCrocomiresBridge 
    JSL.L Spawn_Hardcoded_PLM 
    db $64,$0B 
    dw PLMEntries_clearABlockOfCrocomiresBridge 
    JSL.L Spawn_Hardcoded_PLM 
    db $65,$0B 
    dw PLMEntries_clearABlockOfCrocomiresBridge 
    JSL.L Spawn_Hardcoded_PLM 
    db $66,$0B 
    dw PLMEntries_clearABlockOfCrocomiresBridge 
    JSL.L Spawn_Hardcoded_PLM 
    db $67,$0B 
    dw PLMEntries_clearABlockOfCrocomiresBridge 
    JSL.L Spawn_Hardcoded_PLM 
    db $68,$0B 
    dw PLMEntries_clearABlockOfCrocomiresBridge 
    JSL.L Spawn_Hardcoded_PLM 
    db $69,$0B 
    dw PLMEntries_clearABlockOfCrocomiresBridge 
    JSL.L Spawn_Hardcoded_PLM 
    db $6A,$0B 
    dw PLMEntries_clearABlockOfCrocomiresBridge 
    LDA.W #$0600 : STA.B $12 
    LDA.W #$00B0 : STA.B $14 
    LDA.W #$0015 
    LDY.W #EnemyProjectile_MiscDust 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    LDA.W #$0610 : STA.B $12 
    LDA.W #$00C0 : STA.B $14 
    LDA.W #$0015 
    LDY.W #EnemyProjectile_MiscDust 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    LDA.W #$0620 : STA.B $12 
    LDA.W #$00B0 : STA.B $14 
    LDA.W #$0015 
    LDY.W #EnemyProjectile_MiscDust 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    LDA.W #$0630 : STA.B $12 
    LDA.W #$00C0 : STA.B $14 
    LDA.W #$0015 
    LDY.W #EnemyProjectile_MiscDust 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    LDA.W #$0640 : STA.B $12 
    LDA.W #$00C0 : STA.B $14 
    LDA.W #$0015 
    LDY.W #EnemyProjectile_MiscDust 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    LDA.W #$0650 : STA.B $12 
    LDA.W #$00C0 : STA.B $14 
    LDA.W #$0015 
    LDY.W #EnemyProjectile_MiscDust 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    LDA.W #$0660 : STA.B $12 
    LDA.W #$00C0 : STA.B $14 
    LDA.W #$0015 
    LDY.W #EnemyProjectile_MiscDust 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_MoveEnemyDownBy14_12_A48FC2:
    JSL.L MoveEnemyDownBy_14_12 
    RTL 
endif ; !FEATURE_KEEP_UNREFERENCED


Instruction_Crocomire_ShakeScreen:
    PHX 
    PHY 
    LDA.W #$0004 : STA.W $183E 
    LDA.W #$0005 : STA.W $1840 
    LDA.W #$0076 
    JSL.L QueueSound_Lib2_Max6 
    PLY 
    PLX 
    RTL 


Instruction_Crocomire_MoveLeft4Pixels:
    PHX 
    PHY 
    LDX.W $0E54 
    LDA.W $0FAA 
    BIT.W #$0800 
    BNE .return 
    STZ.B $12 
    LDA.W #$FFFC : STA.B $14 
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes 

.return:
    PLY 
    PLX 
    RTL 


Instruction_Crocomire_MoveLeft4Pixels_SpawnBigDustCloud:
    JSR.W SpawnBigDustCloudProjectileWithRandomXOffset 
    BRA Instruction_Crocomire_MoveLeft4Pixels 


Instruction_Crocomire_MoveLeft4Pixels_SpawnBigDustCloud_dup:
    JSR.W SpawnBigDustCloudProjectileWithRandomXOffset 
    BRA Instruction_Crocomire_MoveLeft4Pixels 


SpawnBigDustCloudProjectileWithRandomXOffset:
    PHX 
    LDA.W $05E5 
    AND.W #$001F 
    LDX.W $05E5 
    CPX.W #$1000 
    BMI .spawn 
    EOR.W #$FFFF 
    INC A 

.spawn:
    JSL.L SpawnBigDustCloudProjectile 
    PLX 
    RTS 


Instruction_Crocomire_MoveLeft_SpawnCloud_HandleSpikeWall:
    PHX 
    PHY 
    LDX.W $0E54 
    STZ.B $12 
    LDA.W #$FFFC : STA.B $14 
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes 
    BCS .hitWall 
    LDX.W #$0020 
    LDA.W $05E5 
    CMP.W #$0800 
    BMI .spawnDustCloud 
    LDX.W #$FFE0 

.spawnDustCloud:
    LDA.W $05E5 
    AND.W #$000F 
    STX.B $12 
    CLC : ADC.B $12 : JSL.L SpawnBigDustCloudProjectile 
    PLY 
    PLX 
    RTL 


.hitWall:
    PLY 
    LDY.W #InstList_Crocomire_BackOffFromSpikeWall 
    LDA.W #$000E : STA.W $0FAC 
    PLX 
    RTL 


Instruction_Crocomire_MoveRight4PixelsIfOnScreen:
    PHX 
    PHY 
    LDX.W $0E54 
    STZ.B $12 
    LDA.W #$0004 : STA.B $14 
    LDA.W $0F7A : SEC : SBC.W $0F82 : SBC.W #$0100 : SBC.B $14 : CMP.W $0911 
    BPL .return 
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes 

.return:
    PLY 
    PLX 
    RTL 


Instruction_Crocomire_MoveRight4Pixels:
    PHX 
    PHY 
    STZ.B $12 
    LDA.W #$0004 : STA.B $14 
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes 
    PLY 
    PLX 
    RTL 


Instruction_Crocomire_MoveRight4PixelsIfOnScreen_SpawnCloud:
    JSR.W SpawnBigDustCloudProjectileWithRandomXOffset 
    BRA Instruction_Crocomire_MoveRight4PixelsIfOnScreen 


Instruction_Crocomire_MoveRight4Pixels_SpawnBigDustCloud:
    JSR.W SpawnBigDustCloudProjectileWithRandomXOffset 
    BRA Instruction_Crocomire_MoveRight4Pixels 


MainAI_Crocomire_DeathSequence_3C_Hop_6_Sinking:
    JSR.W SetMelting2InstListPointer 
    JSR.W HandleCrocomireAcidDamageSmoke 
    JSR.W SinkCrocomireDown 
    LDA.W $0FA8 
    CMP.W #$003E 
    BNE .return 
    LDA.W #$0006 
    JSL.L QueueMusicDataOrTrack_8FrameDelay 
    LDA.W #$0058 : STA.W $0FA8 
    LDA.W #InstList_CrocomireCorpse_Skeleton_FlowingDownTheRiver : STA.W $0F92 
    LDA.W #$0101 : STA.L $7ECD24 
    STZ.W $05F7 
    LDA.W $0FC6 
    ORA.W #$0200 
    STA.W $0FC6 
    JSL.L Spawn_Hardcoded_PLM 
    db $4E,$03 
    dw PLMEntries_clearCrocomireInvisibleWall 
    STZ.W $0941 
    STZ.W $0688 

.return:
    RTS 


SetMelting2InstListPointer:
    LDA.W $0F7E 
    LDY.W #InstList_Crocomire_Melting2_TopRow 
    CMP.W #$0118 
    BPL .setInstList 
    LDY.W #InstList_Crocomire_Melting2_Top2Rows 
    CMP.W #$0108 
    BPL .setInstList 
    LDY.W #InstList_Crocomire_Melting2_Top3Rows 
    CMP.W #$00F8 
    BPL .setInstList 
    LDY.W #InstList_Crocomire_Melting2_Top4Rows 

.setInstList:
    TYA 
    STA.W $0F92 
    LDA.W #$0001 : STA.W $0F94 
    RTS 


MainAI_Crocomire_DeathSequence_1E_24_2A_Hop_3_4_5_Sinking:
    JSR.W HandleCrocomireAcidDamageSmoke 
    LDA.W $0F7E 
    LDY.W #InstList_Crocomire_Melting1_TopRow 
    CMP.W #$0118 
    BPL .setInstList 
    LDY.W #InstList_Crocomire_Melting1_Top2Rows 
    CMP.W #$0108 
    BPL .setInstList 
    LDY.W #InstList_Crocomire_Melting1_Top3Rows 
    CMP.W #$00F8 
    BPL .setInstList 
    LDY.W #InstList_Crocomire_Melting1_Top4Rows 

.setInstList:
    TYA 
    STA.W $0F92 
    LDA.W #$0001 : STA.W $0F94 
    JMP.W SinkCrocomireDown 


MainAI_Crocomire_DeathSequence_2_Falling:
    LDA.L $7E9016 
    CMP.W #$0016 
    BMI .indexLessThan16 
    JMP.W MainAI_Crocomire_DeathSequence_8_E_Hop_1_2_Sinking 


.indexLessThan16:
    TAX 
    INC #2
    STA.L $7E9016 
    LDA.W .XPositions,X 
    LDY.W #EnemyProjectile_CrocomireBridgeCrumbling 
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    JMP.W MainAI_Crocomire_DeathSequence_8_E_Hop_1_2_Sinking 


.XPositions:
    dw $0780,$0730,$0790,$0740,$07B0,$0760,$07A0,$0770 
    dw $0710,$0750,$0720 

HandleCrocomireAcidDamageSmoke:
    LDA.L $7E9018 
    DEC A 
    STA.L $7E9018 
    BNE .return 
    LDA.W #$0006 : STA.L $7E9018 
    LDA.W $05E5 
    AND.W #$003F 
    TAX 
    LDA.W $05E5 
    BIT.W #$0002 
    BNE + 
    TXA 
    EOR.W #$FFFF 
    TAX 

  + TXA 
    CLC : ADC.W $0F7A : STA.B $12 
    LDA.W $05E5 
    AND.W #$1F00 
    XBA 
    STA.B $14 
    LDA.W $1962 : CLC : ADC.W #$0010 : SEC : SBC.B $14 : STA.B $14 
    LDA.W #$0015 : STA.B $16 
    STZ.B $18 
    JSL.L Create_Sprite_Object 

.return:
    RTS 


MainAI_Crocomire_DeathSequence_8_E_Hop_1_2_Sinking:
    JSL.L HandlePlayingCrocomireAcidDamageSFX 
    JSR.W HandleCrocomireAcidDamageSmoke ; fallthrough to SinkCrocomireDown

SinkCrocomireDown:
    JSR.W ResetCrocomireBG2YScrollHDMADataTable 
    LDA.W $0FAA 
    AND.W #$F7FF 
    STA.W $0FAA 
    LDX.W $0E54 
    JSL.L UpdateCrocomireBG2Scroll 
    LDA.W $0F7E,X 
    CMP.W #$0118 
    BMI .reachedLeftLedge 
    INC.W $0FA8,X 
    INC.W $0FA8,X 
    LDA.W #$0030 : STA.W $0FAE 
    RTS 


.reachedLeftLedge:
    LDA.B $B7 
    EOR.W #$FFFF 
    INC A 
    STA.B $12 
    LDA.W #$0120 : SEC : SBC.B $12 : AND.W #$FFF8 
    ASL #3
    TAX 
    LDA.W #$0020 : STA.B $12 
    LDA.W #$0338 

.loopTilemap:
    STA.L $7E2000,X 
    INX #2
    DEC.B $12 
    BNE .loopTilemap 
    LDA.W #$0001 : STA.W $0E1E 
    LDA.W $0F88 
    AND.W #$7FFF 
    STA.W $0F88 
    LDX.W $0E54 
    SEP #$20 
    LDA.W $0FAE,X : CLC : ADC.B #$80 : STA.W $0FAE,X 
    LDA.W $0FAF,X : ADC.B #$03 : CMP.B #$30 
    BMI + 
    LDA.B #$30 

  + STA.W $0FAF,X 
    CLC : ADC.W $0FB0,X : STA.W $0FB0,X 
    LDA.W $0FB1,X : ADC.B #$00 : CMP.B #$03 
    BMI + 
    LDA.B #$03 

  + STA.W $0FB1,X 
    LDA.W $0FB0,X : CLC : ADC.W $0FB3,X : STA.W $0FB3,X 
    LDA.W $0FB1,X : ADC.W $0F7E,X : STA.W $0F7E,X 
    LDA.W $0F7F,X : ADC.B #$00 : STA.W $0F7F,X 
    REP #$20 
    RTS 


MainAI_Crocomire_DeathSequence_34_Hop_6_Rising:
    LDX.W $0E54 
    LDA.W $0F7E,X 
    LDY.W #InstList_Crocomire_Melting2_TopRow 
    CMP.W #$0118 
    BPL .setInstListPointer 
    LDY.W #InstList_Crocomire_Melting2_Top2Rows 
    CMP.W #$0108 
    BPL .setInstListPointer 
    LDY.W #InstList_Crocomire_Melting2_Top3Rows 
    CMP.W #$00F8 
    BPL .setInstListPointer 
    LDY.W #InstList_Crocomire_Melting2_Top4Rows 

.setInstListPointer:
    TYA 
    STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    JSR.W HandleCrocomireAcidDamageSmoke 
    BRA RaiseCrocomireUp 


MainAI_Crocomire_DeathSequence_16_22_28_Hop_3_4_5_Rising:
    JSR.W HandleCrocomireAcidDamageSmoke 
    LDX.W $0E54 
    LDA.W $0F7E,X 
    LDY.W #InstList_Crocomire_Melting1_TopRow 
    CMP.W #$0118 
    BPL .setInstListPointer 
    LDY.W #InstList_Crocomire_Melting1_Top2Rows 
    CMP.W #$0108 
    BPL .setInstListPointer 
    LDY.W #InstList_Crocomire_Melting1_Top3Rows 
    CMP.W #$00F8 
    BPL .setInstListPointer 
    LDY.W #InstList_Crocomire_Melting1_Top4Rows 

.setInstListPointer:
    TYA 
    STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    BRA RaiseCrocomireUp 


MainAI_Crocomire_DeathSequence_6_C_Hop_1_2_Rising:
    JSL.L HandlePlayingCrocomireAcidDamageSFX 
    JSR.W HandleCrocomireAcidDamageSmoke 
    LDX.W $0E54 ; fallthrough to RaiseCrocomireUp

RaiseCrocomireUp:
    JSR.W ResetCrocomireBG2YScrollHDMADataTable 
    LDX.W $0E54 
    LDA.W $0F7E,X 
    CMP.W #$00DA 
    BPL .raised 
    LDX.W $0E54 
    INC.W $0FA8,X 
    INC.W $0FA8,X 
    RTS 


.raised:
    JSL.L UpdateCrocomireBG2Scroll 
    LDA.W $0FAE : CLC : ADC.W #$0100 : CMP.W #$1F00 
    BMI + 
    LDA.W #$1F00 

  + STA.W $0FAE 
    SEP #$20 
    LDA.W $0FB0 : SEC : SBC.W $0FAF : STA.W $0FB0 
    LDA.W $0FB1 : SBC.B #$00 : BPL .positiveYVelocity 
    LDA.B #$FF : STA.W $0FB0 
    LDA.B #$00 

.positiveYVelocity:
    STA.W $0FB1 
    LDA.W $0FB3 : SEC : SBC.W $0FB0 : STA.W $0FB3 
    LDA.W $0F7E : SBC.W $0FB1 : STA.W $0F7E 
    LDA.W $0F7F : SBC.B #$00 : STA.W $0F7F 
    REP #$20 
    RTS 


MainAI_Crocomire_DeathSequence_10_Hop_3_LoadMeltingTilemap:
    LDA.W #$0030 : STA.W $068C 
    STA.W $0688 
    LDX.W $0E54 
    INC.W $0FA8,X 
    INC.W $0FA8,X 
    LDA.W #InstList_Crocomire_Melting1_TopRow : STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    LDA.W #$0001 : STA.W $0E1E 
    LDA.W #InstList_CrocomireTongue_Melting : STA.W $0FD2,X 
    LDA.W #$0001 : STA.W $0FD4,X 
    LDA.W $0FC6,X 
    ORA.W #$2C00 
    AND.W #$FEFF 
    STA.W $0FC6,X 
    LDA.W $0F7A,X : STA.W $0FBA,X 
    LDA.W $0F7E,X : CLC : ADC.W #$0010 : STA.W $0FBE,X 
    LDX.W #$0000 
    LDA.W #$0338 

.loopClearTilemap:
    STA.L $7E2000,X 
    STA.L $7E2002,X 
    INX #4
    CPX.W #$0400 
    BMI .loopClearTilemap 
    LDX.W #$0000 

.loopMeltingTilemap:
    LDA.L MeltingCrocomireTilesLoadingTable_Tilemap_Melting1,X 
    CMP.W #$FFFF 
    BEQ .done 
    STA.L $7E2040,X 
    INX #2
    BRA .loopMeltingTilemap 


.done:
    TXA 
    CLC : ADC.W #$0400 ; fallthrough to WriteCrocomireBG2Tilemap
    TAX 

WriteCrocomireBG2Tilemap:
    TXY 
    LDX.W $0330 
    STY.B $D0,X 
    LDA.W #$2000 : STA.B $D2,X 
    LDA.W #$007E : STA.B $D4,X 
    LDA.B $59 
    AND.W #$00FC 
    XBA 
    STA.B $D5,X 
    TXA 
    CLC : ADC.W #$0007 : STA.W $0330 
    RTS 


ResetCrocomireBG2YScrollHDMADataTable:
    LDA.B $B7 
    LDX.W #$01FE 

.loop:
    STA.L $7ECAF0,X 
    DEX #2
    BPL .loop 
    RTS 


MainAI_Crocomire_DeathSequence_2C_Hop_6_LoadMeltingTilemap:
    JSR.W ResetCrocomireBG2YScrollHDMADataTable 
    LDX.W $0E54 
    INC.W $0FA8,X 
    INC.W $0FA8,X 
    LDA.W #$0001 : STA.W $0F94,X 
    LDA.W #$0030 : STA.W $068C 
    STA.W $0688 
    LDA.W #InstList_Crocomire_Melting2_TopRow : STA.W $0F92,X 
    LDX.W #$0000 
    LDA.W #$0338 

.loopClearTilemap:
    STA.L $7E2000,X 
    INX #2
    CPX.W #$0800 
    BMI .loopClearTilemap 
    LDX.W #$0000 

.loopMeltingTilemap:
    LDA.L MeltingCrocomireTilesLoadingTable_Tilemap_Melting2,X 
    CMP.W #$FFFF 
    BEQ .done 
    STA.L $7E2040,X 
    INX #2
    BRA .loopMeltingTilemap 


.done:
    TXA 
    CLC : ADC.W #$0400 : TAX 
    JMP.W WriteCrocomireBG2Tilemap 


RTL_A4943C:
    RTL 


MainAI_Crocomire_DeathSequence_12_2E_Hop_3_4_LoadMeltTiles:
    REP #$30 
    PHB 
    LDX.W $0E54 
    INC.W $0FA8,X 
    INC.W $0FA8,X 
    LDA.W #$0100 : STA.W $0692 
    STZ.W $0690 
    LDX.W $069A 
    LDA.W MeltingCrocomireTilesLoadingTable_Melting1_0,X : STA.W $0698 
    STA.W $0694 
    LDA.W MeltingCrocomireTilesLoadingTable_Melting1_0+2,X : STA.W $0696 
    LDA.W MeltingCrocomireTilesLoadingTable_Melting1_0+4,X : STA.W $068E 
    STZ.B $00 
    LDA.W MeltingCrocomireTilesLoadingTable_Melting1_0+6,X : STA.B $02 
    TXA 
    CLC : ADC.W #$0008 : TAX 

.loop:
    LDY.W MeltingCrocomireTilesLoadingTable_Melting1_0,X 
    CPY.W #$FFFF 
    BEQ .done 
    PHX 
    LDA.W MeltingCrocomireTilesLoadingTable_Melting1_0+2,X 
    TAX 
    LDA.W $068E : STA.B $12 

.loopInner:
    LDA.B [$00],Y : STA.L $7E0000,X 
    INX #2
    INY #2
    DEC.B $12 
    BPL .loopInner 
    PLX 
    INX #4
    BRA .loop 


.done:
    INX #2
    STX.W $069A 
    STX.W $068A 
    LDX.W #$0080 

.loopYOffsets:
    STZ.W $069C,X 
    DEX #2
    BPL .loopYOffsets 
    PLB 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_UploadCrocomireMeltingTilesToVRAM_A494B2:
    JSR.W MainAI_Crocomire_DeathSequence_14_30_Hop_3_6_UploadingToVRAM 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


MainAI_Crocomire_DeathSequence_14_30_Hop_3_6_UploadingToVRAM:
    LDX.W $068A 
    LDY.W $0330 
    LDA.W MeltingCrocomireTilesLoadingTable_Melting1_0,X 
    CMP.W #$FFFF 
    BEQ .terminator 
    STA.W $00D0,Y 
    LDA.W MeltingCrocomireTilesLoadingTable_Melting1_0+6,X : STA.W $00D2,Y 
    LDA.W MeltingCrocomireTilesLoadingTable_Melting1_0+4,X : STA.W $00D4,Y 
    LDA.W MeltingCrocomireTilesLoadingTable_Melting1_0+2,X : STA.W $00D5,Y 
    TYA 
    CLC : ADC.W #$0007 : TAY 
    TXA 
    CLC : ADC.W #$0008 : STA.W $068A 
    STY.W $0330 
    RTS 


.terminator:
    STY.W $0330 
    LDX.W $0E54 
    INC.W $0FA8,X 
    INC.W $0FA8,X 
    STZ.W $068A 
    RTS 


MainAI_Crocomire_DeathSequence_18_Hop_3_QueueCry_HDMAObject:
    REP #$30 
    LDA.W #$0077 
    JSL.L QueueSound_Lib2_Max6 
    BRA CreateCrocomireMeltingHDMAObject 


MainAI_Crocomire_DeathSequence_36_Hop_6_QueueCry_HDMAObject:
    REP #$30 
    LDA.W #$002D 
    JSL.L QueueSound_Lib2_Max6 

CreateCrocomireMeltingHDMAObject:
    LDA.W $0FBE : SEC : SBC.W #$0048 : ASL A 
    TAX 
    LDA.B $B7 

.loop:
    STA.L $7ECAF0,X 
    DEX #2
    BPL .loop 
    LDX.W $0E54 
    INC.W $0FA8,X 
    INC.W $0FA8,X 
    LDA.W $0F7A : STA.W $102E 
    PHP 
    LDA.W #$00FF : STA.L $7ECAE0 
    LDA.W #$CAF0 ; $7E
    STA.L $7ECAE1 
    LDA.W #$00E1 : STA.L $7ECAE3 
    LDA.W #$CBEE : STA.L $7ECAE4 
    LDA.W #$0000 : STA.L $7ECAE6 
    JSL.L Spawn_HDMAObject 
    db $42,$10 
    dw InstList_HDMAObject_CrocomireMelting_0 
    STA.L $7E783E 
    PLP 
    RTS 


InstList_HDMAObject_CrocomireMelting_0:
    dw Instruction_HDMAObject_HDMATableBank 
    db $7E 
    dw Instruction_HDMAObject_IndirectHDMATableBank 
    db $7E 
    dw Instruction_HDMAObject_PreInstructionInY 
    dl RTL_A4943C 

InstList_HDMAObject_CrocomireMelting_1:
    dw $7777 
    dw $CAE0 
    dw Instruction_HDMAObject_GotoY 
    dw InstList_HDMAObject_CrocomireMelting_1 

MainAI_Crocomire_DeathSequence_32_SetIndex34:
    LDX.W $0E54 
    INC.W $0FA8,X 
    INC.W $0FA8,X 
    RTS 


MainAI_Crocomire_DeathSequence_1A_38_Hop_3_6_Melting:
    REP #$30 
    JSR.W HandleCrocomireAcidDamageSmoke 
    LDX.W $102E 
    DEC.W $0FEE 
    LDA.W $0FEE 
    AND.W #$0002 
    BEQ + 
    TXA 
    CLC : ADC.W #$0004 : TAX 

  + STX.W $0F7A 
    JSL.L EraseMeltingCrocomirePixelColumn 
    CMP.W #$0000 
    BNE .noError 

.finished:
    LDX.W $0E54 
    INC.W $0FA8,X 
    INC.W $0FA8,X 
    LDX.W $069A 

.loopFindTerminator:
    LDA.W MeltingCrocomireTilesLoadingTable_Melting1_0,X 
    CMP.W #$FFFF 
    BEQ .terminator 
    TXA 
    CLC : ADC.W #$0008 : TAX 
    BRA .loopFindTerminator 


.terminator:
    INX #2
    STX.W $069A 
    LDA.L $7E783E 
    TAX 
    LDA.W #$0000 : STA.W $18B4,X 
    RTS 


.noError:
    LDX.W $0E54 
    JSL.L UpdateCrocomireBG2Scroll 
    LDA.W $0692 
    TAX 
    AND.W #$FF00 
    XBA 
    STA.B $12 
    LDA.W $0694 : SEC : SBC.W #$0003 : CMP.W #$0010 
    BPL + 
    CPX.W #$5000 
    BPL .finished 
    LDA.W #$0010 

  + STA.W $0694 
    LDA.W $0692 : CLC : ADC.W #$0180 : CMP.W #$5000 
    BMI + 
    LDA.W #$5000 

  + STA.W $0692 
    STZ.B $12 
    LDA.W $0FBE : SEC : SBC.W #$0048 : ASL A 
    TAX 
    LDA.W $0694 
    TAY 
    STA.W $05A6 
    ASL A 

.loopMeltingRows:
    TYA 
    SEC : SBC.W $05A6 : CLC : ADC.B $B7 : STA.L $7ECAF0,X 
    LDA.B $12 : CLC : ADC.W $0692 : STA.B $12 
    BCS .carrySet 
    INY 

.carrySet:
    INC.W $05A6 
    INX #2
    CPY.W $0698 
    BMI .loopMeltingRows 
    CPX.W #$0200 
    BPL .return 
    LDA.B $B7 

.loopTablePadding:
    STA.L $7ECAF0,X 
    INX #2
    CPX.W #$0200 
    BMI .loopTablePadding 

.return:
    RTS 


MainAI_Crocomire_DeathSequence_1C_3A_Hop_3_6_ClearTilemap:
    REP #$30 
    LDX.W $0E54 
    STZ.W $0FB0,X 
    STZ.W $0FB2,X 
    LDA.W #$0800 : STA.W $0FAE,X 
    LDA.W #$0338 
    LDX.W #$0FFE 

.loop:
    STA.L $7E2000,X 
    DEX #2
    BPL .loop 
    LDX.W $0330 
    LDA.W #$0800 : STA.B $D0,X 
    LDA.W #$2000 : STA.B $D2,X 
    LDA.W #$007E : STA.B $D4,X 
    LDA.B $59 
    AND.W #$00FE 
    XBA 
    STA.B $D5,X 
    TXA 
    CLC : ADC.W #$0007 : STA.W $0330 
    JMP.W NextCrocomireDeathSequenceIndex 


CrocomireMeltingXOffsetTable:
    db $2B,$28,$21,$1F,$2C,$10,$16,$17,$0F,$00,$06,$07,$0B,$08,$01,$2A 
    db $0C,$24,$2E,$2D,$1A,$14,$1D,$23,$1E,$29,$25,$22,$13,$19,$15,$12 
    db $30,$03,$09,$02,$1B,$05,$18,$1C,$11,$0A,$04,$0D,$2F,$0E,$20,$26 
    db $27 

EraseMeltingCrocomirePixelColumn:
    PHP 
    SEP #$20 
    REP #$10 
    XBA 
    LDA.W $068C : STA.B $12 
    STZ.B $13 
    STZ.B $14 
    STZ.B $15 
    STZ.B $16 
    STZ.B $17 
    LDX.W $0690 

.loopFindColumnToErase:
    LDA.W CrocomireMeltingXOffsetTable,X 
    TAY 
    LDA.W $069C,Y 
    CMP.W $0688 
    BMI + 
    INX 
    CPX.W #$0080 
    BMI .loopFindColumnToErase 
    STZ.W $0690 
    LDA.B #$00 
    PLP 
    RTL 


  + STX.W $0690 
    TXA 
    AND.B #$07 
    TAY 
    REP #$20 

.loopEraseColumn:
    LDX.W $0690 
    LDA.W CrocomireMeltingXOffsetTable,X 
    AND.W #$00FF 
    TAX 
    AND.W #$FFF8 
    ASL #2
    STA.B $14 
    LDA.W $069C,X 
    AND.W #$0007 
    ASL A 
    CLC : ADC.B $14 : STA.B $14 
    LDA.W $069C,X 
    AND.W #$FFF8 
    ASL #6
    CLC : ADC.B $14 : TAX 
    SEP #$20 
    LDA.L $7E4000,X 
    AND.W TilePixelColumnBitmasks,Y 
    STA.L $7E4000,X 
    LDA.L $7E4001,X 
    AND.W TilePixelColumnBitmasks,Y 
    STA.L $7E4001,X 
    LDA.L $7E4010,X 
    AND.W TilePixelColumnBitmasks,Y 
    STA.L $7E4010,X 
    LDA.L $7E4011,X 
    AND.W TilePixelColumnBitmasks,Y 
    STA.L $7E4011,X 
    LDA.B #$00 
    XBA 
    LDX.W $0690 
    LDA.W CrocomireMeltingXOffsetTable,X 
    TAX 
    LDA.W $069C,X 
    CMP.B #$30 
    BEQ + 
    REP #$20 
    INC.W $069C,X 
    LDA.W $069C,X 
    AND.W #$00FF 
    STA.B $16 
    DEC.B $12 
    BNE .loopEraseColumn 

  + REP #$30 

.cycled:
    LDA.W $069A : CLC : ADC.W $068A : TAX 
    LDY.W $0330 
    LDA.W MeltingCrocomireTilesLoadingTable_Melting1_0,X 
    CMP.W #$FFFF 
    BNE + 
    STZ.W $068A 
    BRA .cycled 


  + STA.W $00D0,Y 
    LDA.W MeltingCrocomireTilesLoadingTable_Melting1_0+6,X : STA.W $00D2,Y 
    LDA.W MeltingCrocomireTilesLoadingTable_Melting1_0+4,X : STA.W $00D4,Y 
    LDA.W MeltingCrocomireTilesLoadingTable_Melting1_0+2,X : STA.W $00D5,Y 
    TYA 
    CLC : ADC.W #$0007 : STA.W $0330 
    LDA.W $068A : CLC : ADC.W #$0008 : STA.W $068A 
    LDA.W $0690 
    CMP.W #$0080 
    BMI + 
    STZ.W $0690 

  + STA.W $0690 
    LDA.W #$0001 
    PLP 
    RTL 


MainAI_Crocomire_DeathSequence_3E_BehindWall_WaitForSamus:
    REP #$20 
    LDA.W $0AF6 
    CMP.W #$0280 
    BPL .return 
    LDA.W #$0005 
    JSL.L QueueMusicDataOrTrack_8FrameDelay 
    LDA.W #$0100 : STA.L $7ECD23 
    JSL.L Spawn_Hardcoded_PLM 
    db $30,$03 
    dw PLMEntries_createCrocomireInvisibleWall 
    LDA.W #$0006 : STA.W $0941 
    LDA.W $0F86 
    AND.W #$7FFF 
    ORA.W #$0400 
    STA.W $0F86 
    LDA.W $0FC6 
    ORA.W #$0500 
    STA.W $0FC6 
    LDA.W #$0004 : STA.W $0FAE 
    STZ.W $0FEE 
    LDA.W #$000A : STA.W $102E 
    LDA.W #$0001 : STA.W $106E 
    STZ.W $0FAA 
    LDA.W #$0038 : STA.W $0F84 
    JMP.W NextCrocomireDeathSequenceIndex 


.return:
    RTS 


MainAI_Crocomire_DeathSequence_58_FlowingDownTheRiver:
    LDA.W $0F7A : SEC : SBC.W #$0002 : STA.W $0F7A 
    CMP.W #$01E0 
    BMI .leftOfFightArea 
    LDA.W #$00DC : STA.W $0F7E 
    RTS 


.leftOfFightArea:
    LDA.W #$01E0 : STA.W $0F7A 
    LDA.W #$0036 : STA.W $0F7E 
    LDA.W #$003E : STA.W $0FA8 
    RTS 


MainAI_Crocomire_DeathSequence_40_BehindWall_Rumbling:
    LDX.W $0FAE 
    LDA.W .targetYOffset,X 
    CMP.W #$8080 
    BNE + 
    STA.W $0FEE 
    LDA.W #$0080 : STA.W $0FAE 
    LDX.W #$001E 

.loopSpritePalette:
    LDA.W Palette_Crocomire_Sprite3,X : STA.L $7EC160,X 
    DEX #2
    BPL .loopSpritePalette 
    JMP.W NextCrocomireDeathSequenceIndex 


  + LDX.W $0FAE 
    LDA.W $0FEE 
    CMP.W .targetYOffset,X 
    BEQ .equal 
    BPL + 
    CLC : ADC.W $106E 

.return:
    STA.W $0FEE 
    RTS 


  + SEC : SBC.W $106E : BRA .return 


.equal:
    LDA.W .targetYOffset,X 
    BPL .positive 
    LDA.W $102E 
    BEQ .rumbleTimerExpired 
    DEC A 
    STA.W $102E 
    DEX #2
    STX.W $0FAE 
    LDA.W #$002B 
    JSL.L QueueSound_Lib2_Max6 
    RTS 


.rumbleTimerExpired:
    INX #2
    LDA.W .targetYOffset,X : STA.W $102E 
    INX #2
    LDA.W .targetYOffset,X : STA.W $106E 

.positive:
    INX #2
    STX.W $0FAE 
    RTS 


.targetYOffset:
    dw $0004,$0001,$0000,$FFFF,$0008,$0001,$0001,$FFFF 
    dw $000C,$0001,$0001,$FFFE,$0010,$0002,$0002,$FFFE 
    dw $0010,$0002,$0002,$FFFC,$0008,$0001,$0001,$FFFE 
    dw $0003,$0001,$0001,$FFFF,$8080,$8080,$8080,$8080 

MainAI_Crocomire_DeathSequence_42_BehindWall_NoMoreRumbling:
    LDA.W $0FAE 
    BEQ .zero 
    DEC A 
    STA.W $0FAE 
    LDY.W $0688 
    LDA.W .VRAMSpriteTilesOffset,Y 
    CMP.W #$FFFF 
    BNE + 
    RTS 


  + LDX.W $0330 
    LDA.W #$0200 : STA.B $D0,X 
    LDA.W .skeletonSpriteTilesSourceAddress,Y : STA.B $D2,X 
    LDA.W #$00AD : STA.B $D4,X 
    LDA.B $52 
    AND.W #$0007 
    XBA 
    ASL #5
    STA.B $12 
    CLC : ADC.W .VRAMSpriteTilesOffset,Y : STA.B $D5,X 
    TXA 
    CLC : ADC.W #$0007 : STA.W $0330 
    INY #2
    STY.W $0688 
    RTS 


.zero:
    LDA.W #$01E0 : STA.W $0F7A 
    LDA.W #$0036 : STA.W $0F7E 
    LDA.W #$0050 : STA.W $102E 
    STZ.W $0FB0 
    STZ.W $0FB2 
    JSL.L Spawn_Hardcoded_PLM 
    db $20,$03 
    dw PLMEntries_clearCrocomireInvisibleWall 
    JSL.L Spawn_Hardcoded_PLM 
    db $1E,$03 
    dw PLMEntries_createCrocomireInvisibleWall 
    JSL.L Spawn_Hardcoded_PLM 
    db $70,$0B 
    dw PLMEntries_clearCrocomiresBridge 
    LDA.W #$0029 
    JSL.L QueueSound_Lib2_Max6 
    LDA.W #InstList_CrocomireCorpse_Skeleton_FallsApart_0 : STA.W $0F92 
    LDA.W #$0001 : STA.W $0F94 
    LDA.W #$0000 : STA.W $0F96 
    LDX.W #$001E 

.loopSpritePalette:
    LDA.W Palette_Crocomire_Sprite1,X : STA.L $7EC120,X 
    DEX #2
    BPL .loopSpritePalette 
    JSL.L Clear_Enemy_Projectiles 
    LDA.W #$0008 : STA.B $12 

.loop:
    LDX.W $0E54 
    LDY.W #EnemyProjectile_CrocomireSpikeWallPieces 
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    DEC.B $12 
    BNE .loop 
    LDA.W #$0030 
    JSL.L QueueSound_Lib2_Max6 
    JMP.W NextCrocomireDeathSequenceIndex 


.deadReturn:
    RTS 


.VRAMSpriteTilesOffset:
    dw $1600,$1700,$1800,$1900,$1E00,$1F00,$FFFF 

.skeletonSpriteTilesSourceAddress:
    dw Tiles_CrocomireSkeleton_0 
    dw Tiles_CrocomireSkeleton_1 
    dw Tiles_CrocomireSkeleton_2 
    dw Tiles_CrocomireSkeleton_3 
    dw Tiles_CrocomireSkeleton_4 
    dw Tiles_CrocomireSkeleton_5 

MainAI_Crocomire_DeathSequence_44_BreaksDownWall:
    LDA.W $0F7A 
    CMP.W #$00E0 
    BPL .timer 
    LDA.W $0FB0 : CLC : ADC.W #$8000 : STA.W $0FB0 
    LDA.W $0FB2 : ADC.W #$0000 : CMP.W #$0002 
    BMI + 
    LDA.W #$0002 

  + STA.W $0FB2 
    LDA.W $0F7C : CLC : ADC.W $0FB0 : STA.W $0F7C 
    LDA.W $0F7A : ADC.W $0FB2 : STA.W $0F7A 

.timer:
    LDA.W $102E 
    BEQ .return 
    DEC.W $102E 
    BNE .return 
    STZ.W $0FB0 
    LDA.W #InstList_CrocomireCorpse_Skeleton_Falling : STA.W $0F92 
    LDA.W #$0001 : STA.W $0F94 
    JMP.W NextCrocomireDeathSequenceIndex 


.return:
    RTS 


MainAI_Crocomire_DeathSequence_46_SkeletonFalls:
    LDA.W $0FB0 : CLC : ADC.W #$0800 : STA.W $0FB0 
    LDA.W $0FB2 : ADC.W #$0000 : CMP.W #$0005 
    BMI + 
    LDA.W #$0005 

  + STA.W $0FB2 
    LDA.W #$E000 : CLC : ADC.W $0F80 : STA.W $0F80 
    LDA.W $0F7E : ADC.W #$0000 : STA.W $0F7E 
    LDA.W $0F7C : CLC : ADC.W $0FB0 : STA.W $0F7C 
    LDA.W $0F7A : ADC.W $0FB2 : STA.W $0F7A 
    CMP.W #$0240 
    BMI .return 
    LDA.W #$0025 
    JSL.L QueueSound_Lib2_Max6 
    LDA.W $0F96 : STA.W $0FD6 
    LDA.W #InstList_CrocomireCorpse_Skeleton_FallsApart_0 : STA.W $0F92 
    LDA.W #$0001 : STA.W $0F94 
    JMP.W NextCrocomireDeathSequenceIndex 


.return:
    RTS 


Instruction_Crocomire_SpawnBigDustCloudProjectile_Negative20:
    LDA.W #$FFE0 
    BRA SpawnBigDustCloudProjectile 


Instruction_Crocomire_SpawnBigDustCloudProjectile_0:
    LDA.W #$0000 
    BRA SpawnBigDustCloudProjectile 


Instruction_Crocomire_SpawnBigDustCloudProjectile_Negative10:
    LDA.W #$FFF0 
    BRA SpawnBigDustCloudProjectile 


Instruction_Crocomire_SpawnBigDustCloudProjectile_10:
    LDA.W #$0010 
    BRA SpawnBigDustCloudProjectile 


Instruction_Crocomire_SpawnBigDustCloudProjectile_0_dup:
    LDA.W #$0000 
    BRA SpawnBigDustCloudProjectile 


Instruction_Crocomire_SpawnBigDustCloudProjectile_8:
    LDA.W #$0008 
    BRA SpawnBigDustCloudProjectile 


Instruction_Crocomire_SpawnBigDustCloudProjectile_10_dup:
    LDA.W #$0010 
    BRA SpawnBigDustCloudProjectile 


Instruction_Crocomire_SpawnBigDustCloudProjectile_18:
    LDA.W #$0018 
    BRA SpawnBigDustCloudProjectile 


Instruction_Crocomire_SpawnBigDustCloudProjectile_20:
    LDA.W #$0020 
    BRA SpawnBigDustCloudProjectile 


Instruction_Crocomire_SpawnBigDustCloudProjectile_28:
    LDA.W #$0028 
    BRA SpawnBigDustCloudProjectile 


Instruction_Crocomire_SpawnBigDustCloudProjectile_30:
    LDA.W #$0030 
    BRA SpawnBigDustCloudProjectile 


Instruction_Crocomire_SpawnBigDustCloudProjectile_38:
    LDA.W #$0038 
    BRA SpawnBigDustCloudProjectile 


Instruction_Crocomire_SpawnBigDustCloudProjectile_40:
    LDA.W #$0040 

SpawnBigDustCloudProjectile:
    PHX 
    PHY 
    STA.B $12 
    LDA.W $05E5 
    AND.W #$0007 
    CLC : ADC.W $0F7A : ADC.B $12 : STA.B $12 
    LDA.W $0F7E : CLC : ADC.W $0F84 : SEC : SBC.W #$0010 : STA.B $14 
    LDA.W #$0015 
    LDY.W #EnemyProjectile_MiscDust 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    PLY 
    PLX 
    RTL 


MainAI_Crocomire_DeathSequence_48_SkeletonFallsApart:
    LDA.W $0F92 
    CMP.W #InstList_CrocomireCorpse_Skeleton_1 
    BMI .notFallenApartYet 
    LDA.W #InstList_CrocomireCorpse_Skeleton_Dead : STA.W $0F92 
    LDA.W #$0001 : STA.W $0F94 
    LDA.W $0F7A : CLC : ADC.W #$0040 : STA.W $0F7A 
    LDA.W $0F7E : CLC : ADC.W #$0015 : STA.W $0F7E 
    LDA.W #$001C : STA.W $0F84 
    LDA.W #$0028 : STA.W $0F82 
    JSL.L Spawn_Hardcoded_PLM 
    db $30,$03 
    dw PLMEntries_clearCrocomireInvisibleWall 
    JSL.L CrocomireDeathItemDropRoutine 
    JMP.W NextCrocomireDeathSequenceIndex 


.notFallenApartYet:
    LDA.W $0FB0 : CLC : ADC.W #$1000 : STA.W $0FB0 
    LDA.W $0FB2 : ADC.W #$0000 : CMP.W #$0006 
    BMI + 
    LDA.W #$0006 

  + STA.W $0FB2 
    RTS 


MainAI_Crocomire_DeathSequence_4A_UnlockCamera:
    LDA.W #$0101 : STA.L $7ECD20 
    STA.L $7ECD22 
    JSL.L Spawn_Hardcoded_PLM 
    db $1E,$03 
    dw PLMEntries_clearCrocomireInvisibleWall 
    JMP.W NextCrocomireDeathSequenceIndex 


MainAI_Crocomire_DeathSequence_4E_SetIndex50:
    BRA NextCrocomireDeathSequenceIndex 


MainAI_Crocomire_DeathSequence_4C_SetIndex4E:
    LDA.W $0F92 
    CMP.W #InstList_CrocomireCorpse_Skeleton_1 
    BPL NextCrocomireDeathSequenceIndex 
    RTS 


MainAI_Crocomire_DeathSequence_50_MarkEvent_PostDeathMusic:
    LDA.W #$0006 
    JSL.L QueueMusicDataOrTrack_8FrameDelay 
    STZ.W $0941 
    LDX.W $079F 
    LDA.L $7ED828,X 
    ORA.W #$0002 
    STA.L $7ED828,X 
    LDA.W #$0006 
    JSL.L QueueMusicDataOrTrack_8FrameDelay 
    LDA.W #$FFF0 
    JSL.L SpawnBigDustCloudProjectile 
    LDA.W #$0010 
    JSL.L SpawnBigDustCloudProjectile 

NextCrocomireDeathSequenceIndex:
    INC.W $0FA8 
    INC.W $0FA8 
    RTS 


MainAI_Crocomire_DeathSequence_54_SetIndex56:
    JMP.W NextCrocomireDeathSequenceIndex 


TilePixelColumnBitmasks:
    db $7F,$BF,$DF,$EF,$F7,$FB,$FD,$FE 

MeltingCrocomireTilesLoadingTable_Melting1_0:
    dw $0058,$0030,$0200,$00A4 
    dw Tiles_Crocomire_Melting1_0 
    dw $4000 
    dw Tiles_Crocomire_Melting1_1 
    dw $4200 
    dw Tiles_Crocomire_Melting1_2 
    dw $4400 
    dw Tiles_Crocomire_Melting1_3 
    dw $4600 
    dw Tiles_Crocomire_Melting1_4 
    dw $4800 
    dw Tiles_Crocomire_Melting1_5 
    dw $4A00,$FFFF 

MeltingCrocomireTilesLoadingTable_Melting1_1:
    dw $0160,$0000,$007E,$4000,$0160,$0100,$007E,$4200 
    dw $0160,$0200,$007E,$4400,$0160,$0300,$007E,$4600 
    dw $0160,$0400,$007E,$4800,$0160,$0500,$007E,$4A00 
    dw $FFFF 

MeltingCrocomireTilesLoadingTable_Melting2_0:
    dw $0058,$0030,$0200,$00A4 
    dw Tiles_Crocomire_Melting2_0 
    dw $4000 
    dw Tiles_Crocomire_Melting2_1 
    dw $4200 
    dw Tiles_Crocomire_Melting2_2 
    dw $4400 
    dw Tiles_Crocomire_Melting2_3 
    dw $4600 
    dw Tiles_Crocomire_Melting2_4 
    dw $4800 
    dw Tiles_Crocomire_Melting2_5 
    dw $4A00 
    dw Palette_Crocomire 
    dw $4C00,$FFFF 

MeltingCrocomireTilesLoadingTable_Melting2_1:
    dw $0160,$0000,$007E,$4000,$0160,$0100,$007E,$4200 
    dw $0160,$0200,$007E,$4400,$0160,$0300,$007E,$4600 
    dw $0160,$0400,$007E,$4800,$0160,$0500,$007E,$4A00 
    dw $0160,$0600,$007E,$4C00,$FFFF 

MeltingCrocomireTilesLoadingTable_Tilemap_Melting1:
    dw $3C00,$3C20,$3C30,$3C40,$3C50,$3C01,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $3C10,$3C11,$3C04,$3C33,$3C43,$3C23,$3C41,$3C51 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$3C02,$3C14,$3C05,$3C44,$3C54,$3C24,$3C34 
    dw $3C12,$3C22,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$3C53,$3C15,$3C06,$3C16,$3C26,$3C36 
    dw $3C46,$3C13,$3C52,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$3C25,$3C56,$3C07,$3C17,$3C27 
    dw $3C37,$3C47,$3C03,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$3C57,$3C08,$3C18,$3C28 
    dw $3C38,$3C48,$3C35,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$3C32,$3C21,$3C45,$3C58,$3C09,$3C19,$3C29 
    dw $3C29,$3C49,$3C59,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$3C42,$3C31,$3C55,$3C0A,$3C1A,$3C2A,$3C3A 
    dw $3C4A,$3C5A,$3C0B,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $FFFF 

MeltingCrocomireTilesLoadingTable_Tilemap_Melting2:
    dw $3C00,$3C10,$3C20,$3C30,$0338,$0338,$0338,$0338 
    dw $0338,$3C00,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $3C40,$3C11,$3C21,$3C50,$3C23,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$3C32,$3C42,$3C04,$3C54,$3C03,$0338,$0338 
    dw $3C33,$3C01,$3C53,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$3C34,$3C44,$3C05,$3C24,$3C14 
    dw $3C02,$3C12,$3C22,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$3C35,$3C45,$3C55,$3C06 
    dw $3C16,$3C26,$3C36,$3C3A,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$3C46,$3C56,$3C07 
    dw $3C17,$3C27,$3C37,$3C47,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$3C31,$3C41,$3C51,$3C57,$3C08,$3C18,$3C28 
    dw $3C38,$3C48,$3C58,$3C09,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$3C43,$3C52,$3C19,$3C13,$3C39,$3C49,$3C59 
    dw $3C0A,$3C1A,$3C2A,$3C3A,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $FFFF 

Tiles_Crocomire_Melting1_0:
    db $00,$03,$00,$07,$02,$0D,$19,$1E,$32,$3C,$26,$38,$36,$39,$6F,$71 
    db $03,$00,$07,$00,$0F,$00,$1F,$18,$3F,$30,$3F,$20,$3F,$30,$7F,$61 
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$40,$C0,$1C,$FC 
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$C0,$40,$FC,$1C 
    db $05,$07,$03,$03,$01,$01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $07,$05,$03,$03,$01,$01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $C0,$40,$40,$40,$E0,$20,$78,$18,$B4,$8C,$FC,$D8,$FC,$C4,$BE,$86 
    db $C0,$40,$C0,$40,$E0,$20,$F8,$18,$74,$04,$24,$00,$3C,$04,$7E,$06 
    db $A0,$1F,$DF,$3F,$F7,$F9,$DD,$F0,$E7,$F9,$77,$F8,$BD,$FF,$7F,$FF 
    db $FF,$00,$E1,$1F,$C0,$FB,$E0,$DF,$E0,$FF,$C0,$7F,$E0,$BF,$FF,$7F 
    db $FA,$F2,$78,$F2,$E5,$F8,$F1,$3E,$FE,$1F,$47,$87,$07,$81,$03,$C0 
    db $C2,$FD,$C0,$7F,$E0,$FF,$E0,$3F,$F0,$1F,$FD,$07,$FF,$01,$FF,$00 
    db $1A,$FC,$F8,$0F,$1E,$03,$F3,$F0,$D9,$D8,$8F,$0F,$01,$05,$E1,$03 
    db $F0,$1F,$F8,$0F,$FE,$03,$0F,$00,$27,$00,$F0,$00,$FA,$00,$FC,$00 
    db $03,$80,$34,$44,$97,$07,$C3,$03,$C1,$01,$4E,$8E,$EF,$0F,$EF,$0F 
    db $7F,$00,$BB,$00,$F8,$00,$FC,$00,$FE,$00,$F1,$00,$F0,$00,$F0,$00 
    db $D9,$1F,$59,$9F,$51,$9F,$51,$9F,$1C,$9F,$9C,$1F,$DE,$1F,$DE,$1F 
    db $E0,$00,$E0,$00,$E0,$00,$E0,$00,$E0,$00,$E0,$00,$E0,$00,$E0,$00 
    db $CF,$0F,$8F,$0F,$0F,$0F,$2F,$2F,$2F,$2F,$A7,$A7,$31,$31,$21,$31 
    db $F0,$00,$F0,$00,$F0,$00,$D0,$00,$D0,$00,$58,$00,$CE,$00,$CE,$00 
    db $F1,$04,$19,$E4,$0F,$F6,$74,$85,$F0,$01,$91,$0E,$9F,$80,$41,$40 
    db $FB,$00,$FB,$00,$F9,$00,$FB,$00,$FF,$00,$FF,$00,$7F,$00,$BF,$00 
    db $E8,$90,$B8,$10,$78,$40,$FC,$A4,$CC,$80,$46,$02,$E6,$02,$EE,$02 
    db $E8,$80,$E8,$00,$B8,$00,$5C,$04,$7C,$00,$FE,$02,$FE,$02,$FE,$02 
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 

Tiles_Crocomire_Melting1_1:
    db $1C,$63,$4C,$73,$49,$76,$42,$7C,$50,$6E,$50,$6F,$5F,$7F,$79,$79 
    db $7F,$00,$7F,$40,$7F,$40,$7F,$40,$7F,$40,$7F,$40,$7F,$5F,$79,$79 
    db $FF,$00,$00,$FF,$05,$FF,$C5,$1F,$0C,$D3,$02,$FD,$21,$FE,$F0,$FF 
    db $FF,$00,$FF,$00,$FF,$05,$FF,$05,$FF,$00,$FF,$00,$FF,$20,$FF,$F0 
    db $BC,$A0,$16,$DA,$9B,$5B,$00,$61,$87,$F8,$C7,$C0,$32,$F0,$13,$F1 
    db $BC,$A0,$E6,$02,$E7,$03,$FF,$00,$7F,$00,$3F,$00,$0F,$00,$0E,$00 
    db $C8,$C6,$1B,$1B,$1D,$1B,$17,$11,$14,$11,$1E,$1D,$19,$18,$39,$38 
    db $3E,$00,$E7,$03,$E7,$01,$EF,$01,$EF,$00,$E3,$00,$E7,$00,$C7,$00 
    db $2F,$FF,$AF,$D7,$C7,$F8,$73,$7C,$38,$3F,$1D,$1E,$0E,$0F,$06,$07 
    db $FF,$2F,$FF,$87,$FF,$C0,$7F,$70,$3F,$38,$1F,$1C,$0F,$0E,$07,$06 
    db $41,$80,$23,$C0,$1B,$E2,$98,$E0,$4C,$70,$26,$38,$13,$1C,$10,$1F 
    db $FF,$00,$FF,$00,$FD,$00,$FF,$80,$7F,$40,$3F,$20,$1F,$10,$1F,$10 
    db $7F,$8F,$4E,$2F,$65,$BF,$B8,$FF,$F9,$7F,$73,$1F,$B3,$9F,$3F,$03 
    db $01,$FF,$03,$FE,$03,$FD,$87,$F8,$DF,$79,$FE,$13,$7F,$13,$FF,$03 
    db $FF,$E0,$D4,$28,$6F,$19,$FF,$89,$DD,$C7,$EF,$63,$64,$23,$67,$20 
    db $00,$FF,$C0,$3F,$E0,$1F,$70,$0F,$38,$07,$9C,$03,$DF,$00,$DF,$00 
    db $90,$80,$D2,$D2,$F8,$E1,$CC,$C3,$CE,$C1,$C7,$D0,$8B,$88,$9B,$80 
    db $7F,$00,$2D,$00,$1F,$00,$3F,$00,$3F,$00,$2F,$00,$77,$00,$7F,$00 
    db $9C,$83,$A0,$9F,$A1,$9F,$27,$1E,$2F,$18,$3C,$10,$61,$03,$E8,$0E 
    db $7F,$00,$7F,$00,$7F,$01,$FF,$06,$FF,$08,$FF,$10,$FC,$00,$F1,$00 
    db $28,$30,$99,$10,$99,$10,$9B,$10,$CF,$00,$DF,$10,$C7,$00,$EF,$00 
    db $CF,$00,$EF,$00,$EF,$00,$EF,$00,$FF,$00,$EF,$00,$FF,$00,$FF,$00 
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

Tiles_Crocomire_Melting1_2:
    db $00,$FF,$00,$C1,$05,$00,$FF,$00,$A8,$70,$F1,$C1,$80,$80,$B6,$00 
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$20,$FE,$C0,$FF,$80,$FF,$00 
    db $00,$00,$00,$00,$00,$00,$E4,$E4,$59,$FF,$37,$C8,$7F,$80,$1F,$E0 
    db $00,$00,$00,$00,$00,$00,$E4,$E4,$FF,$59,$FF,$00,$FF,$00,$FF,$00 
    db $00,$00,$00,$00,$00,$00,$C0,$40,$A0,$60,$90,$70,$98,$28,$FC,$04 
    db $00,$00,$00,$00,$00,$00,$C0,$40,$E0,$20,$F0,$10,$F8,$08,$FC,$04 
    db $4F,$1F,$41,$8E,$E8,$EB,$1C,$1C,$1F,$3F,$F0,$FF,$BC,$BF,$13,$03 
    db $FF,$0F,$7F,$00,$17,$00,$E3,$00,$C0,$00,$00,$00,$40,$00,$FC,$00 
    db $B2,$B0,$22,$20,$85,$01,$81,$01,$9F,$07,$73,$80,$79,$86,$04,$FF 
    db $4F,$00,$DF,$00,$FE,$00,$FE,$00,$F8,$00,$FF,$00,$FF,$00,$FF,$04 
    db $0C,$0F,$06,$07,$03,$03,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $0F,$0C,$07,$06,$03,$03,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $4F,$FF,$FB,$FF,$E4,$FB,$8F,$F0,$D7,$E8,$A1,$C0,$E0,$F0,$B8,$C0 
    db $F4,$4F,$C0,$FF,$80,$FB,$00,$F0,$00,$F9,$00,$FF,$00,$FF,$00,$FF 
    db $C9,$3E,$FB,$5C,$FB,$3C,$BF,$7E,$FF,$FF,$37,$E0,$C0,$C0,$01,$01 
    db $07,$F8,$0F,$F8,$1F,$F8,$3F,$FE,$7F,$FF,$FF,$20,$FF,$C0,$FE,$00 
    db $72,$72,$00,$00,$20,$00,$71,$80,$3F,$C0,$7C,$83,$F8,$06,$FC,$00 
    db $8D,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00 
    db $31,$E0,$70,$E0,$E1,$81,$A3,$03,$26,$07,$B6,$87,$65,$07,$D6,$02 
    db $FF,$20,$FF,$60,$FE,$80,$FC,$00,$F8,$00,$78,$00,$F8,$00,$FD,$00 
    db $83,$0E,$CD,$0C,$C3,$00,$F6,$01,$FC,$03,$D8,$07,$B8,$07,$F0,$0F 
    db $F1,$00,$F3,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00 
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

Tiles_Crocomire_Melting1_3:
    db $20,$E0,$0C,$BC,$A0,$0F,$B0,$30,$BB,$FF,$01,$FF,$6A,$60,$52,$0D 
    db $E0,$20,$FC,$0C,$FF,$00,$CF,$00,$00,$00,$00,$00,$9F,$00,$FF,$00 
    db $81,$FE,$D0,$FF,$ED,$FF,$FF,$FF,$7F,$FF,$13,$FF,$F1,$0F,$9F,$01 
    db $FF,$80,$FF,$D0,$FF,$ED,$7F,$FF,$01,$FF,$00,$FF,$00,$FF,$00,$FF 
    db $00,$00,$00,$00,$00,$00,$7F,$7F,$81,$FF,$09,$FE,$E6,$FD,$FD,$FE 
    db $00,$00,$00,$00,$00,$00,$7F,$7F,$FF,$81,$FF,$08,$FF,$E4,$FF,$FC 
    db $FC,$A7,$FC,$C7,$81,$E0,$FC,$C3,$C2,$FF,$8C,$FB,$D7,$F8,$3C,$FB 
    db $D8,$80,$F8,$C0,$7F,$80,$7F,$C0,$7D,$C2,$F0,$8F,$E0,$DC,$E0,$3F 
    db $6C,$18,$0C,$0C,$EE,$EE,$F3,$FF,$F9,$FF,$5E,$5F,$57,$87,$1B,$E3 
    db $E7,$00,$F3,$00,$11,$00,$00,$00,$00,$00,$A0,$00,$F8,$00,$FC,$00 
    db $BB,$F1,$A5,$E3,$33,$F1,$79,$F9,$7B,$F9,$FB,$F9,$E3,$E1,$9F,$03 
    db $0F,$01,$1D,$01,$0F,$01,$07,$01,$07,$01,$07,$01,$1F,$01,$FF,$03 
    db $ED,$F1,$F7,$F9,$FA,$7C,$1A,$FC,$E9,$1E,$39,$0E,$EC,$1E,$2D,$5E 
    db $FE,$E0,$3E,$F0,$1F,$F8,$07,$F8,$0F,$F8,$07,$F8,$07,$FC,$07,$FC 
    db $02,$02,$00,$00,$80,$00,$C8,$00,$FD,$81,$F3,$03,$0A,$0A,$A0,$A0 
    db $FD,$00,$FF,$00,$FF,$00,$FF,$00,$FE,$80,$FC,$00,$F5,$00,$5F,$00 
    db $00,$00,$05,$00,$7E,$00,$E8,$14,$C0,$30,$09,$81,$76,$77,$AC,$E7 
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FE,$00,$88,$00,$18,$00 
    db $00,$00,$05,$00,$7E,$00,$E8,$14,$C0,$30,$09,$81,$76,$77,$AC,$E7 
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FE,$00,$88,$00,$18,$00 
    db $D7,$00,$67,$85,$67,$87,$63,$83,$F3,$03,$F9,$01,$FC,$00,$FE,$00 
    db $FF,$00,$FA,$00,$F8,$00,$FC,$00,$FC,$00,$FE,$00,$FF,$00,$FF,$00 
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

Tiles_Crocomire_Melting1_4:
    db $00,$00,$00,$00,$60,$60,$0E,$EE,$3E,$9A,$24,$E0,$F1,$55,$BA,$07 
    db $00,$00,$00,$00,$60,$60,$FE,$0E,$67,$02,$1F,$00,$AA,$00,$F8,$00 
    db $E0,$E0,$1C,$FC,$85,$7F,$D0,$87,$D8,$C7,$6E,$E0,$26,$E0,$24,$E0 
    db $E0,$E0,$FC,$1C,$FF,$05,$7F,$00,$3F,$00,$1F,$00,$1F,$00,$1F,$00 
    db $FE,$FF,$6F,$7F,$67,$7F,$31,$3F,$14,$1B,$12,$1D,$10,$1D,$31,$38 
    db $C7,$FE,$43,$7F,$40,$7F,$00,$3F,$00,$1F,$00,$1F,$00,$1F,$00,$3F 
    db $06,$F6,$21,$38,$E7,$0D,$15,$E4,$CC,$F4,$E5,$F9,$F4,$78,$70,$38 
    db $09,$00,$C7,$00,$F2,$00,$FB,$00,$7B,$C0,$3E,$E0,$1F,$F0,$3F,$F0 
    db $55,$38,$10,$3F,$32,$7F,$36,$FF,$EC,$FE,$FE,$FD,$F8,$FE,$BA,$FC 
    db $1F,$F0,$1F,$F0,$1D,$F2,$18,$F7,$38,$EF,$F8,$FF,$F0,$FF,$F0,$BF 
    db $00,$00,$00,$00,$03,$03,$07,$05,$FD,$FC,$82,$7A,$72,$C2,$D1,$83 
    db $00,$00,$00,$00,$03,$03,$07,$05,$FF,$FC,$FD,$00,$3D,$00,$7C,$00 
    db $98,$FC,$CE,$FE,$CE,$FE,$4C,$7C,$AC,$BC,$BC,$BC,$39,$39,$38,$38 
    db $03,$00,$01,$00,$01,$00,$83,$00,$43,$00,$43,$00,$C6,$00,$C7,$00 
    db $7B,$78,$74,$74,$FD,$7C,$B6,$AE,$B2,$8E,$79,$1D,$F3,$CF,$BC,$BC 
    db $87,$00,$8B,$00,$83,$00,$51,$00,$71,$00,$E2,$00,$30,$00,$43,$00 
    db $07,$07,$0E,$0F,$18,$18,$1A,$1B,$8F,$8F,$A1,$81,$71,$B8,$89,$98 
    db $F8,$00,$F0,$00,$E7,$00,$E4,$00,$70,$00,$7E,$00,$47,$00,$67,$00 
    db $F7,$87,$14,$E0,$7F,$80,$60,$87,$58,$98,$4D,$8F,$67,$87,$72,$82 
    db $78,$00,$FF,$00,$FF,$00,$FF,$00,$E7,$00,$F0,$00,$F8,$00,$FD,$00 
    db $EF,$E4,$CF,$C0,$EE,$EB,$E2,$E1,$A6,$A1,$0C,$03,$09,$06,$7B,$04 
    db $1B,$00,$3F,$00,$15,$00,$1F,$00,$5F,$00,$FF,$00,$FF,$00,$FF,$00 
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

Tiles_Crocomire_Melting1_5:
    db $00,$00,$00,$00,$00,$00,$00,$00,$B0,$B0,$07,$7F,$C0,$C7,$54,$F5 
    db $00,$00,$00,$00,$00,$00,$00,$00,$B0,$B0,$FF,$07,$3F,$00,$0B,$00 
    db $00,$00,$00,$00,$00,$00,$E0,$E0,$20,$F0,$04,$3C,$00,$FE,$38,$01 
    db $00,$00,$00,$00,$00,$00,$E0,$E0,$F0,$20,$FC,$04,$FE,$00,$FF,$00 
    db $00,$00,$00,$00,$80,$80,$80,$80,$80,$80,$00,$80,$C0,$C0,$40,$C0 
    db $00,$00,$00,$00,$80,$80,$80,$80,$80,$80,$80,$00,$C0,$C0,$C0,$40 
    db $03,$03,$01,$01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $03,$03,$01,$01,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $4F,$B1,$03,$FC,$BD,$FE,$AE,$5F,$4F,$0F,$AA,$17,$0E,$13,$93,$07 
    db $FE,$00,$FF,$00,$1F,$FC,$07,$FE,$03,$BF,$03,$5E,$03,$FE,$01,$FF 
    db $FA,$02,$7A,$82,$3C,$C0,$00,$FF,$FD,$C2,$EF,$E0,$F0,$E0,$FC,$D8 
    db $FD,$00,$FD,$00,$FF,$00,$FF,$00,$FF,$C0,$7F,$E0,$7F,$E0,$67,$C0 
    db $78,$80,$16,$E8,$01,$FE,$A0,$FF,$78,$7F,$1C,$1F,$0E,$0F,$02,$03 
    db $FF,$00,$FF,$00,$FF,$00,$FF,$A0,$7F,$78,$1F,$1C,$0F,$0E,$03,$02 
    db $02,$03,$02,$03,$03,$03,$01,$01,$01,$01,$02,$03,$02,$03,$02,$03 
    db $03,$02,$03,$02,$03,$03,$01,$01,$01,$01,$03,$02,$03,$02,$03,$02 
    db $07,$06,$CF,$F9,$F9,$F0,$EF,$0E,$26,$3E,$E4,$FC,$9C,$1C,$81,$04 
    db $07,$06,$FF,$C9,$FF,$F0,$F1,$00,$C1,$00,$03,$00,$E3,$00,$FB,$00 
    db $7E,$1E,$BE,$86,$F8,$38,$F8,$F8,$1C,$04,$EE,$E6,$DC,$C4,$E8,$68 
    db $FE,$1E,$7E,$06,$F8,$38,$F8,$F8,$FC,$04,$1E,$06,$3C,$04,$F8,$68 
    db $49,$B0,$53,$AF,$1E,$E0,$1F,$E0,$BE,$40,$BF,$41,$EC,$00,$49,$00 
    db $FF,$00,$FF,$03,$FF,$00,$FF,$00,$FF,$00,$FE,$00,$FF,$00,$FF,$00 
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

Tiles_Crocomire_Melting2_0:
    db $00,$00,$00,$00,$00,$01,$03,$03,$06,$07,$04,$07,$06,$07,$0D,$0E 
    db $00,$00,$00,$00,$01,$00,$03,$03,$07,$06,$07,$04,$07,$06,$0F,$0C 
    db $00,$00,$E0,$20,$98,$28,$F4,$0C,$F2,$6E,$D3,$05,$7F,$60,$29,$28 
    db $00,$00,$E0,$20,$F8,$08,$FC,$04,$9E,$02,$FF,$01,$9F,$00,$D7,$00 
    db $03,$03,$F9,$3F,$59,$9F,$49,$8F,$35,$D7,$37,$D7,$87,$C7,$A7,$C7 
    db $00,$00,$C4,$00,$E0,$00,$F0,$00,$E8,$00,$E8,$00,$F8,$80,$F8,$80 
    db $00,$00,$00,$00,$00,$00,$80,$80,$80,$80,$80,$80,$00,$80,$C0,$40 
    db $00,$00,$00,$00,$00,$00,$00,$80,$00,$80,$00,$80,$00,$80,$00,$C0 
    db $7F,$7F,$ED,$7E,$FC,$1F,$7E,$87,$1F,$E3,$A8,$D0,$C0,$F0,$C0,$F8 
    db $38,$FF,$38,$EF,$7C,$9F,$7C,$87,$7E,$83,$FF,$80,$FF,$C0,$FF,$C0 
    db $70,$70,$A7,$5F,$5C,$E7,$55,$B3,$13,$27,$CA,$E7,$3A,$B7,$2B,$60 
    db $00,$F0,$00,$FF,$40,$FF,$50,$BF,$D3,$2F,$13,$2E,$43,$0E,$93,$0C 
    db $1B,$1D,$EF,$F3,$FF,$27,$77,$2F,$3F,$7F,$66,$7C,$98,$78,$60,$80 
    db $00,$1F,$01,$FF,$03,$FF,$07,$FF,$0F,$FF,$1F,$E4,$7F,$98,$7F,$80 
    db $0F,$8E,$41,$40,$05,$20,$8C,$70,$C0,$38,$28,$10,$30,$00,$20,$00 
    db $71,$80,$BF,$00,$FF,$00,$FC,$00,$F8,$00,$38,$00,$30,$00,$20,$00 
    db $F9,$C0,$F0,$20,$21,$00,$E1,$C0,$C1,$C1,$94,$94,$86,$86,$24,$86 
    db $FF,$C0,$FE,$20,$F9,$00,$39,$00,$32,$00,$63,$00,$71,$00,$71,$00 
    db $C0,$C0,$C0,$C0,$00,$00,$00,$00,$80,$80,$C0,$C0,$80,$80,$00,$00 
    db $C0,$C0,$C0,$C0,$00,$00,$00,$00,$80,$80,$C0,$C0,$80,$80,$00,$00 
    db $7D,$1C,$79,$38,$BD,$BD,$7C,$7C,$74,$74,$21,$20,$81,$00,$CF,$00 
    db $63,$00,$47,$00,$02,$00,$83,$00,$8B,$00,$DF,$00,$FF,$00,$FF,$00 
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

Tiles_Crocomire_Melting2_1:
    db $00,$7F,$00,$F8,$40,$A0,$3F,$C0,$55,$8E,$DE,$18,$D0,$30,$F6,$20 
    db $7F,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$04,$FF,$18,$FF,$10,$FF,$20 
    db $9F,$60,$80,$7F,$20,$DF,$58,$83,$01,$DA,$00,$FF,$E4,$FF,$3F,$3E 
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$E4,$3F,$3E 
    db $19,$98,$C3,$C3,$C7,$C3,$8A,$82,$88,$80,$89,$81,$21,$01,$41,$01 
    db $67,$00,$3C,$00,$3C,$00,$79,$00,$79,$00,$78,$00,$F8,$00,$D8,$00 
    db $5E,$40,$43,$5C,$81,$1E,$0E,$F0,$BE,$40,$F2,$01,$13,$10,$88,$08 
    db $BF,$00,$BF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$EF,$00,$F7,$00 
    db $00,$00,$00,$00,$01,$01,$07,$07,$01,$03,$03,$01,$05,$07,$0D,$0F 
    db $00,$00,$00,$00,$01,$01,$00,$07,$01,$03,$00,$03,$00,$07,$00,$0F 
    db $3F,$C0,$0F,$F0,$A7,$F8,$E0,$FF,$FF,$F8,$7D,$FC,$3E,$FC,$FF,$3B 
    db $FF,$00,$FF,$00,$FF,$A0,$FF,$E0,$3F,$F8,$0F,$FC,$0F,$FC,$0C,$F8 
    db $20,$C0,$60,$80,$70,$80,$F9,$C0,$FF,$F0,$FE,$00,$01,$00,$34,$34 
    db $FF,$00,$FF,$00,$FF,$00,$FF,$C0,$FF,$F0,$FF,$00,$FF,$00,$CA,$00 
    db $E0,$00,$10,$00,$0E,$00,$05,$02,$00,$06,$01,$00,$0E,$0E,$15,$1C 
    db $FE,$00,$1E,$00,$0E,$00,$07,$00,$07,$00,$0F,$00,$11,$00,$23,$00 
    db $00,$00,$00,$01,$00,$03,$00,$03,$05,$03,$86,$82,$0C,$00,$0D,$01 
    db $00,$00,$01,$00,$03,$00,$03,$00,$07,$01,$0E,$02,$8F,$00,$CE,$00 
    db $3F,$C0,$0F,$F0,$A7,$F8,$E0,$FF,$FF,$F8,$7D,$FC,$3E,$FC,$FF,$3B 
    db $FF,$00,$FF,$00,$FF,$A0,$FF,$E0,$3F,$F8,$0F,$FC,$0F,$FC,$0C,$F8 
    db $E9,$96,$EA,$15,$C3,$7C,$43,$3C,$D7,$28,$97,$68,$3D,$C0,$69,$80 
    db $7F,$00,$FF,$00,$BF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00 
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

Tiles_Crocomire_Melting2_2:
    db $04,$FC,$00,$34,$B0,$00,$F0,$00,$10,$18,$20,$3F,$0D,$0C,$CA,$01 
    db $FC,$04,$FC,$00,$F8,$00,$F8,$00,$E0,$00,$C0,$00,$F3,$00,$FF,$00 
    db $F4,$03,$1B,$E7,$BE,$FF,$BB,$FE,$9C,$7F,$4E,$BF,$35,$DF,$0D,$FF 
    db $FF,$00,$FC,$03,$F8,$BF,$FC,$BB,$FC,$1F,$F8,$0F,$FC,$17,$FC,$0F 
    db $00,$C0,$60,$60,$B0,$70,$F0,$30,$90,$30,$C0,$B0,$38,$18,$28,$18 
    db $C0,$00,$E0,$60,$F0,$30,$F0,$30,$F0,$10,$70,$00,$F8,$18,$F8,$08 
    db $00,$00,$90,$C0,$20,$00,$80,$40,$00,$80,$00,$00,$00,$00,$00,$00 
    db $00,$00,$30,$00,$E0,$00,$C0,$00,$80,$00,$00,$00,$00,$00,$00,$00 
    db $E0,$E0,$C0,$E0,$B0,$F0,$10,$F8,$38,$F8,$70,$F8,$78,$F8,$F6,$6E 
    db $20,$E0,$60,$C0,$70,$B0,$E0,$18,$E0,$38,$C0,$78,$E0,$78,$E0,$7E 
    db $00,$00,$00,$00,$00,$00,$00,$00,$80,$80,$80,$00,$80,$80,$C0,$C0 
    db $00,$00,$00,$00,$00,$00,$00,$00,$80,$80,$80,$00,$80,$80,$C0,$C0 
    db $5D,$0D,$4C,$0C,$4D,$0D,$44,$05,$84,$01,$87,$03,$86,$01,$07,$07 
    db $D0,$00,$C1,$00,$C0,$00,$C8,$00,$84,$00,$84,$00,$86,$00,$00,$00 
    db $00,$00,$01,$01,$03,$03,$23,$83,$25,$01,$24,$00,$E2,$C3,$A1,$C3 
    db $07,$00,$06,$00,$04,$00,$EC,$00,$E6,$00,$E7,$00,$20,$00,$24,$00 
    db $00,$28,$08,$78,$38,$70,$70,$40,$60,$00,$90,$10,$20,$60,$18,$C0 
    db $28,$00,$78,$08,$78,$30,$78,$40,$78,$00,$E0,$00,$90,$00,$3C,$00 
    db $5E,$40,$43,$5C,$81,$1E,$0E,$F0,$BE,$40,$F2,$01,$13,$10,$88,$08 
    db $BF,$00,$BF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$EF,$00,$F7,$00 
    db $3D,$12,$77,$E2,$CF,$08,$FF,$14,$D9,$10,$E8,$20,$9C,$00,$3D,$00 
    db $FD,$10,$FD,$60,$F7,$00,$EB,$00,$EF,$00,$DF,$00,$FF,$00,$FF,$00 
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

Tiles_Crocomire_Melting2_3:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$C0,$00,$00,$02,$00 
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$80,$00,$02,$00 
    db $00,$00,$00,$00,$00,$00,$0F,$0F,$10,$1F,$01,$1F,$1C,$1F,$1F,$1F 
    db $00,$00,$00,$00,$00,$00,$0F,$0F,$1F,$10,$1F,$01,$1F,$1C,$1F,$1F 
    db $07,$06,$06,$07,$02,$03,$01,$03,$03,$03,$02,$02,$00,$00,$00,$00 
    db $07,$06,$07,$06,$03,$02,$03,$01,$03,$03,$02,$02,$00,$00,$00,$00 
    db $00,$00,$00,$00,$03,$00,$05,$02,$01,$04,$03,$06,$03,$02,$03,$03 
    db $00,$00,$00,$00,$03,$00,$07,$00,$07,$00,$05,$00,$01,$00,$00,$00 
    db $E8,$F0,$64,$78,$63,$7C,$53,$5C,$49,$4E,$0C,$0F,$0E,$0F,$0A,$0B 
    db $FF,$E0,$7F,$60,$7F,$60,$5F,$50,$4F,$48,$0F,$0C,$0F,$0E,$0B,$0A 
    db $8F,$F0,$C2,$FD,$60,$7F,$74,$7F,$3F,$3F,$23,$23,$03,$03,$00,$00 
    db $BF,$C0,$FF,$C0,$7F,$60,$7F,$74,$3F,$3F,$23,$23,$03,$03,$00,$00 
    db $78,$08,$88,$88,$BC,$84,$CF,$C3,$56,$D1,$3F,$BB,$7F,$F8,$97,$90 
    db $F8,$08,$78,$08,$7C,$04,$3F,$03,$2E,$00,$44,$00,$07,$00,$6F,$00 
    db $F7,$FE,$D4,$FC,$06,$1E,$4F,$7F,$EF,$FF,$3F,$3F,$3C,$1C,$33,$00 
    db $01,$00,$03,$00,$E1,$00,$80,$00,$00,$00,$C0,$00,$E3,$00,$FF,$00 
    db $3D,$1C,$1D,$09,$2A,$22,$36,$36,$0C,$2C,$0C,$2C,$2C,$2C,$5D,$5C 
    db $23,$00,$36,$00,$1D,$00,$09,$00,$13,$00,$13,$00,$13,$00,$23,$00 
    db $25,$86,$33,$82,$F3,$C2,$93,$A2,$19,$20,$3B,$C2,$F8,$00,$3D,$00 
    db $71,$00,$75,$00,$3D,$00,$7D,$00,$FF,$00,$FD,$00,$FF,$00,$FF,$00 
    db $00,$00,$00,$00,$00,$00,$80,$80,$80,$00,$C0,$40,$C0,$40,$C0,$40 
    db $00,$00,$00,$00,$00,$00,$80,$80,$80,$00,$C0,$40,$C0,$40,$C0,$40 
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

Tiles_Crocomire_Melting2_4:
    db $03,$0C,$09,$0E,$09,$0E,$08,$0F,$0A,$0D,$0A,$0D,$0B,$0F,$0F,$0F 
    db $0F,$00,$0F,$08,$0F,$08,$0F,$08,$0F,$08,$0F,$08,$0F,$0B,$0F,$0F 
    db $00,$00,$00,$00,$00,$00,$FC,$FC,$2B,$FF,$26,$D9,$CF,$B0,$A3,$DC 
    db $00,$00,$00,$00,$00,$00,$FC,$FC,$FF,$2B,$FF,$00,$FF,$80,$FF,$80 
    db $A5,$FF,$F5,$FA,$B8,$BF,$0E,$0F,$07,$07,$03,$03,$03,$03,$01,$01 
    db $FC,$A7,$FD,$F2,$BF,$B8,$0F,$0E,$07,$07,$03,$03,$03,$03,$01,$01 
    db $1F,$1F,$0D,$0F,$0C,$0F,$06,$07,$02,$03,$02,$03,$02,$03,$06,$07 
    db $18,$1F,$08,$0F,$08,$0F,$00,$07,$00,$03,$00,$03,$00,$03,$00,$07 
    db $23,$5F,$1F,$41,$03,$40,$2E,$1E,$8B,$1B,$F1,$01,$00,$E0,$1C,$E0 
    db $9E,$63,$9F,$61,$9F,$60,$C1,$30,$C4,$30,$DE,$20,$9F,$60,$9F,$60 
    db $06,$11,$C4,$09,$32,$C1,$1A,$E1,$1D,$E2,$8D,$F1,$D1,$ED,$55,$68 
    db $E8,$07,$F4,$03,$FC,$03,$FC,$03,$F8,$07,$FA,$84,$F2,$CC,$77,$48 
    db $5B,$62,$4B,$72,$6B,$72,$2A,$33,$23,$33,$53,$62,$5B,$62,$5B,$62 
    db $7D,$40,$7D,$40,$7D,$60,$3C,$20,$3C,$20,$7D,$40,$7D,$40,$7D,$40 
    db $60,$20,$A0,$60,$60,$20,$20,$20,$60,$20,$60,$20,$60,$20,$E0,$60 
    db $E0,$20,$A0,$20,$E0,$20,$E0,$20,$E0,$20,$E0,$20,$E0,$20,$E0,$60 
    db $EE,$C0,$E2,$7C,$CF,$30,$4C,$30,$6B,$13,$69,$11,$2C,$10,$6E,$D0 
    db $2F,$00,$9F,$00,$FF,$00,$FF,$00,$FC,$00,$FE,$00,$FF,$00,$3F,$00 
    db $00,$01,$09,$01,$08,$00,$6E,$00,$EF,$00,$FB,$00,$F7,$00,$FE,$01 
    db $CE,$00,$CE,$00,$CF,$00,$EF,$00,$EF,$00,$FF,$00,$FF,$00,$FF,$00 
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

Tiles_Crocomire_Melting2_5:
    db $0E,$04,$0F,$08,$F0,$FC,$BF,$18,$F8,$3F,$70,$1E,$3A,$7E,$66,$7E 
    db $0A,$00,$0F,$08,$0F,$F0,$0F,$F8,$0F,$F8,$1E,$F0,$1C,$FA,$3C,$E6 
    db $00,$00,$00,$00,$00,$00,$80,$80,$3F,$FF,$F0,$0F,$EE,$18,$FA,$10 
    db $00,$00,$00,$00,$00,$00,$80,$80,$FF,$3F,$FF,$00,$E7,$00,$EF,$00 
    db $D0,$FF,$FA,$FF,$FD,$FF,$3F,$FF,$8F,$7F,$42,$BF,$1E,$A1,$33,$00 
    db $FF,$D0,$7F,$FA,$1F,$FD,$0F,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF 
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$80,$80,$40,$C0 
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$80,$80,$C0,$40 
    db $82,$87,$82,$47,$A6,$0F,$46,$9F,$DD,$8F,$BF,$9F,$DF,$3F,$57,$3F 
    db $03,$86,$03,$CE,$03,$FE,$03,$FE,$07,$FD,$8F,$FF,$8E,$7F,$9E,$77 
    db $5A,$3D,$FB,$84,$AD,$23,$FF,$70,$BB,$B8,$5C,$4D,$6C,$25,$2D,$24 
    db $C0,$3F,$18,$E7,$1C,$E3,$0E,$E1,$46,$81,$32,$01,$5A,$01,$1A,$01 
    db $33,$30,$32,$33,$34,$35,$31,$10,$11,$10,$00,$02,$00,$00,$10,$00 
    db $06,$01,$04,$01,$00,$01,$25,$00,$07,$00,$14,$00,$14,$00,$10,$00 
    db $00,$00,$19,$1F,$7F,$7E,$FD,$A1,$A4,$87,$5C,$5F,$53,$43,$30,$60 
    db $00,$00,$1F,$19,$7F,$7E,$FE,$A0,$F8,$80,$A0,$00,$BC,$00,$9F,$00 
    db $EF,$E3,$97,$10,$FF,$07,$1F,$FF,$03,$00,$BD,$FC,$FB,$F8,$5D,$4D 
    db $1F,$03,$EF,$00,$FF,$07,$FF,$1F,$FF,$00,$03,$00,$07,$00,$BF,$0D 
    db $78,$C0,$AC,$90,$6C,$10,$CC,$30,$9C,$60,$1C,$E0,$1F,$E0,$1F,$E0 
    db $3C,$00,$7C,$00,$FC,$00,$FC,$00,$FC,$00,$FC,$00,$FF,$00,$FF,$00 
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

Palette_Crocomire:
    dw $3800,$7FFF,$0DFF,$08BF,$0895,$086C,$0447,$6B7E 
    dw $571E,$3A58,$2171,$0CCB,$039F,$023A,$0176,$0000 

Palette_Crocomire_BG12:
    dw $0000,$7FFF,$0DFF,$08BF,$0895,$086C,$0447,$6B7E 
    dw $571E,$3A58,$2171,$0CCB,$039F,$023A,$0176,$0000 

Palette_Crocomire_Sprite2:
    dw $3800,$571E,$6318,$6318,$6318,$6318,$6318,$4A7B 
    dw $1C90,$1469,$1424,$0008,$24BF,$2495,$1C6C,$1045 

Palette_Crocomire_Sprite5:
    dw $3800,$7F5A,$033B,$0216,$0113,$7C1D,$5814,$300A 
    dw $3BE0,$2680,$1580,$5294,$39CE,$2108,$2484,$03E0 

Palette_Crocomire_Sprite1:
    dw $3800,$7FFF,$6B7E,$571E,$3A58,$2171,$0CCB,$6B7E 
    dw $571E,$3A58,$2171,$0CCB,$039F,$023A,$0176,$0000 

Palette_Crocomire_Sprite3:
    dw $3800,$02DF,$01D7,$00AC,$5A73,$41AD,$2D08,$1863 
    dw $0BB1,$48FB,$7FFF,$0000,$7FFF,$44E5,$7FFF,$0000 

EnemyTouch_Crocomire_Claws:
    JSL.L NormalEnemyTouchAI 
    LDA.W $0FAA 
    ORA.W #$4000 
    STA.W $0FAA 
    LDA.W #$FFFC : STA.W $0B58 ; fallthrough to RTL_A4B950

RTL_A4B950:
    RTL 


EnemyShot_Crocomire_Nothing:
    LDA.W $0FAA 
    AND.W #$000F 
    CMP.W #$000F 
    BPL + 
    INC A 

  + STA.B $12 
    LDA.W $0FAA 
    ORA.B $12 
    STA.W $0FAA 
    RTL 


EnemyShot_Crocomire_SpawnShotExplosion:
    PHX 
    PHY 
    LDA.W $18A6 
    ASL A 
    TAX 
    LDA.W $0B64,X : STA.B $12 
    LDA.W $0B78,X : STA.B $14 
    LDA.W $0C18,X 
    LDY.W #$001D 
    BIT.W #$0200 
    BNE .notBeamMissileBomb 
    LDY.W #$0006 

.notBeamMissileBomb:
    TYA 
    LDY.W #EnemyProjectile_MiscDust 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    PLY 
    PLX 
    RTL 


PowerBombReaction_Crocomire:
    LDA.W $0FA8 
    BNE .return 
    LDA.W CrocomireConstants_powerBombReactionEnableFlag 
    BEQ .return 
    STA.W $0FAE 
    LDA.W $0FAC 
    CMP.W #$0018 
    BEQ .return 
    LDA.W $0FAA 
    AND.W #$BFF0 
    ORA.W #$8000 
    STA.W $0FAA 
    LDA.W #$000A : STA.W $0FB0 
    LDA.W $0F9C : CLC : ADC.W #$0004 : STA.W $0F9C 
    LDA.W $0F8A 
    ORA.W #$0002 
    STA.W $0F8A 
    LDA.W #$0018 : STA.W $0FAC 
    LDX.W $0F8E 
    LDA.W $0000,X : STA.B $12 

.loop:
    LDA.W $0006,X 
    LDY.W #InstList_Crocomire_PowerBombReaction_MouthFullyOpen 
    CMP.W #ExtendedTilemap_Crocomire_1 
    BEQ .mouthNotOpen 
    LDY.W #InstList_Crocomire_PowerBombReaction_MouthPartiallyOpen 
    CMP.W #ExtendedTilemap_Crocomire_0 
    BEQ .mouthNotOpen 
    TXA 
    CLC : ADC.W #$0008 : TAX 
    DEC.B $12 
    BNE .loop 
    LDY.W #InstList_Crocomire_PowerBombReaction_MouthNotOpen_0 

.mouthNotOpen:
    TYA 
    STA.W $0F92 
    LDA.W #$0001 : STA.W $0F94 

.return:
    RTL 


EnemyShot_Crocomire_OpenMouth:
    LDA.W #$0000 : STA.W $0FA0 
    LDA.W $0F7A : SEC : SBC.W $0F82 : SEC : SBC.W #$0100 : SEC : SBC.W $0911 : BPL .offScreen 
    LDA.W $18A6 
    ASL A 
    TAX 
    LDA.W $0C18,X 
    BIT.W #$0F00 
    BNE .notBeam 
    LDX.W CrocomireConstants_stepsWhenDamagedByChargeBeam 
    BIT.W #$0010 
    BNE .damage 
    LDA.W CrocomireConstants_mouthOpenInstructionTimer : STA.W $0F94 
    LDX.W CrocomireConstants_index 
    JMP.W EnemyShot_Crocomire_SpawnShotExplosion_duplicate 


.notBeam:
    AND.W #$0F00 
    LDX.W CrocomireConstants_stepsWhenDamagedByMissile 
    CMP.W #$0100 
    BEQ .damage 
    LDX.W CrocomireConstants_stepsWhenDamagedBySuperMissile 
    CMP.W #$0200 
    BEQ .damage 
    LDX.W #$0000 

.damage:
    TXA 
    CMP.W #$0000 
    BEQ .flash 
    CLC : ADC.W $0FAE : STA.W $0FAE 

.offScreen:
    LDA.W $0FAA 
    AND.W #$000F 
    CMP.W #$000F 
    BPL + 
    INC A 

  + STA.B $12 
    LDA.W $0FAA 
    BIT.W #$0800 
    BNE .damaged 
    LDX.W CrocomireConstants_mouthCloseDelayWhenDamaged_NotProjAttack 
    LDA.W $0FAC 
    CMP.W #$0008 
    BNE + 
    LDX.W CrocomireConstants_mouthCloseDelayWhenDamaged_ProjAttack 

  + TXA 
    CLC : ADC.W $0F94 : STA.W $0F94 

.damaged:
    LDA.W $0FAA 
    AND.W #$BFF0 
    ORA.W #$0800 
    ORA.B $12 
    STA.W $0FAA 
    LDA.W #$000A : STA.W $0FB0 

.flash:
    LDA.W $0F9C : CLC : ADC.W #$000E : STA.W $0F9C 
    LDA.W $0F8A 
    ORA.W #$0002 
    STA.W $0F8A 
    RTL 


EnemyShot_Crocomire_SpawnShotExplosion_duplicate:
    PHX 
    PHY 
    LDA.W $18A6 
    ASL A 
    TAX 
    LDA.W $0B64,X : STA.B $12 
    LDA.W $0B78,X : STA.B $14 
    LDA.W $0C18,X 
    LDY.W #$001D 
    BIT.W #$0200 
    BNE .notBeamMissileBomb 
    LDY.W #$0006 

.notBeamMissileBomb:
    TYA 
    LDY.W #EnemyProjectile_MiscDust 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    PLY 
    PLX 
    RTL 


InstList_Crocomire_Initial:
    dw $0001 
    dw ExtendedSpritemap_Crocomire_0 
    dw Instruction_Crocomire_FightAI 
    dw Instruction_Common_GotoY 
    dw InstList_Crocomire_Initial 
    dw Instruction_Common_Sleep 

UNUSED_InstList_Crocomire_ChargeForwardOneStep_A4BAEA:
    dw $0008 
    dw ExtendedSpritemap_Crocomire_ChargeForward_StepBack_0 
    dw Instruction_Crocomire_ShakeScreen 
    dw Instruction_Crocomire_MoveLeft4Pixels_SpawnBigDustCloud 
    dw $0008 
    dw ExtendedSpritemap_Crocomire_ChargeForward_StepBack_1 
    dw Instruction_Crocomire_MoveLeft4Pixels 
    dw $0008 
    dw ExtendedSpritemap_Crocomire_ChargeForward_StepBack_2 
    dw Instruction_Crocomire_MoveLeft4Pixels 
    dw $0008 
    dw ExtendedSpritemap_Crocomire_ChargeForward_StepBack_3 
    dw Instruction_Crocomire_MoveLeft4Pixels_SpawnBigDustCloud 
    dw $0008 
    dw ExtendedSpritemap_Crocomire_ChargeForward_StepBack_4 
    dw Instruction_Crocomire_MoveLeft4Pixels 
    dw $0008 
    dw ExtendedSpritemap_Crocomire_ChargeForward_StepBack_5 
    dw Instruction_Crocomire_MoveLeft4Pixels 
    dw $0008 
    dw ExtendedSpritemap_Crocomire_ChargeForward_StepBack_6 
    dw Instruction_Crocomire_ShakeScreen 
    dw Instruction_Crocomire_MoveLeft4Pixels_SpawnBigDustCloud 
    dw $0008 
    dw ExtendedSpritemap_Crocomire_ChargeForward_StepBack_7 
    dw Instruction_Crocomire_MoveLeft4Pixels 
    dw $0008 
    dw ExtendedSpritemap_Crocomire_ChargeForward_StepBack_8 
    dw Instruction_Crocomire_MoveLeft4Pixels 
    dw $0008 
    dw ExtendedSpritemap_Crocomire_ChargeForward_StepBack_9 
    dw Instruction_Crocomire_MoveLeft4Pixels_SpawnBigDustCloud 
    dw $0008 
    dw ExtendedSpritemap_Crocomire_ChargeForward_StepBack_A 
    dw Instruction_Crocomire_MoveLeft4Pixels 
    dw $0008 
    dw ExtendedSpritemap_Crocomire_ChargeForward_StepBack_B 
    dw Instruction_Crocomire_FightAI 

InstList_Crocomire_ProjectileAttack_0:
    dw Instruction_Crocomire_SpawnBigDustCloudProjectile_10 
    dw $0005 
    dw ExtendedSpritemap_Crocomire_MovingClaws_0 
    dw $0005 
    dw $C4AC 
    dw Instruction_Crocomire_SpawnBigDustCloudProjectile_0 
    dw $0005 
    dw ExtendedSpritemap_Crocomire_MovingClaws_2 
    dw $0005 
    dw ExtendedSpritemap_Crocomire_MovingClaws_3 
    dw $0005 
    dw ExtendedSpritemap_Crocomire_MovingClaws_4 
    dw $8D07 
    dw Instruction_Crocomire_SpawnBigDustCloudProjectile_Negative20 
    dw $0005 
    dw ExtendedSpritemap_Crocomire_MovingClaws_0 
    dw $0005 
    dw $C4AC 
    dw Instruction_Crocomire_SpawnBigDustCloudProjectile_Negative10 
    dw $0005 
    dw ExtendedSpritemap_Crocomire_MovingClaws_2 
    dw $0005 
    dw ExtendedSpritemap_Crocomire_MovingClaws_3 
    dw $0005 
    dw ExtendedSpritemap_Crocomire_MovingClaws_4 
    dw $8D07 
    dw Instruction_Crocomire_SpawnBigDustCloudProjectile_0 
    dw $0005 
    dw ExtendedSpritemap_Crocomire_MovingClaws_0 
    dw $0005 
    dw $C4AC 
    dw Instruction_Crocomire_SpawnBigDustCloudProjectile_28 
    dw $0005 
    dw ExtendedSpritemap_Crocomire_MovingClaws_2 
    dw $0005 
    dw ExtendedSpritemap_Crocomire_MovingClaws_3 
    dw $0005 
    dw ExtendedSpritemap_Crocomire_MovingClaws_4 
    dw $8D07 
    dw Instruction_Crocomire_SpawnBigDustCloudProjectile_Negative10 
    dw $0005 
    dw $C574 
    dw Instruction_Crocomire_QueueCrySFX 
    dw $0005 
    dw ExtendedSpritemap_Crocomire_8 
    dw $0005 
    dw $C5E8 

InstList_Crocomire_ProjectileAttack_1:
    dw Instruction_Crocomire_FightAI 
    dw $0008 
    dw ExtendedSpritemap_Crocomire_20 
    dw $0007 
    dw ExtendedSpritemap_Crocomire_21 
    dw $0007 
    dw ExtendedSpritemap_Crocomire_22 
    dw $0007 
    dw ExtendedSpritemap_Crocomire_23 
    dw $0007 
    dw ExtendedSpritemap_Crocomire_24 
    dw Instruction_Common_GotoY 
    dw InstList_Crocomire_ProjectileAttack_1 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_Crocomire_A4BBAE:
    dw $0004 
    dw ExtendedSpritemap_Crocomire_14 
    dw Instruction_Crocomire_ShakeScreen 
    dw Instruction_Crocomire_MoveLeft4Pixels_SpawnBigDustCloud 
    dw Instruction_Crocomire_FightAI 
    dw Instruction_Crocomire_MaybeStartProjectileAttack 
    dw $0004 
    dw ExtendedSpritemap_Crocomire_15 
    dw Instruction_Crocomire_MoveLeft4Pixels 
    dw Instruction_Crocomire_FightAI 
    dw $0004 
    dw ExtendedSpritemap_Crocomire_16 
    dw Instruction_Crocomire_MoveLeft4Pixels_SpawnBigDustCloud 
    dw Instruction_Crocomire_FightAI 
endif ; !FEATURE_KEEP_UNREFERENCED

InstList_Crocomire_StepForwardAfterDelay:
    dw $00B4 
    dw ExtendedSpritemap_Crocomire_14 

InstList_Crocomire_StepForward:
    dw Instruction_Crocomire_MaybeStartProjectileAttack 
    dw $0005 
    dw ExtendedSpritemap_Crocomire_7 
    dw Instruction_Crocomire_FightAI 
    dw $0005 
    dw ExtendedSpritemap_Crocomire_8 
    dw Instruction_Crocomire_QueueCrySFX 
    dw Instruction_Crocomire_FightAI 
    dw $0005 
    dw ExtendedSpritemap_Crocomire_9 
    dw Instruction_Crocomire_FightAI 
    dw $0010 
    dw ExtendedSpritemap_Crocomire_17 
    dw Instruction_Crocomire_MoveLeft4Pixels_SpawnBigDustCloud 
    dw Instruction_Crocomire_FightAI 
    dw $0004 
    dw ExtendedSpritemap_Crocomire_18 
    dw Instruction_Crocomire_MoveLeft4Pixels 
    dw Instruction_Crocomire_FightAI 
    dw $0004 
    dw ExtendedSpritemap_Crocomire_19 
    dw Instruction_Crocomire_MoveLeft4Pixels 
    dw Instruction_Crocomire_FightAI 
    dw $0004 
    dw ExtendedSpritemap_Crocomire_1A 
    dw Instruction_Crocomire_ShakeScreen 
    dw Instruction_Crocomire_MoveLeft4Pixels_SpawnBigDustCloud 
    dw Instruction_Crocomire_FightAI 
    dw $0004 
    dw ExtendedSpritemap_Crocomire_1B 
    dw Instruction_Crocomire_MoveLeft4Pixels 
    dw Instruction_Crocomire_FightAI 
    dw $0004 
    dw ExtendedSpritemap_Crocomire_1C 
    dw Instruction_Crocomire_MoveLeft4Pixels 
    dw Instruction_Crocomire_FightAI 
    dw $0004 
    dw ExtendedSpritemap_Crocomire_1D 
    dw Instruction_Crocomire_MoveLeft4Pixels_SpawnBigDustCloud 
    dw Instruction_Crocomire_FightAI 
    dw $0004 
    dw ExtendedSpritemap_Crocomire_1E 
    dw Instruction_Crocomire_MoveLeft4Pixels 
    dw Instruction_Crocomire_FightAI 
    dw $0004 
    dw ExtendedSpritemap_Crocomire_1F 
    dw Instruction_Crocomire_FightAI 
    dw Instruction_Common_GotoY 
    dw InstList_Crocomire_StepForward 

InstList_Crocomire_StepBack:
    dw $0002 
    dw ExtendedSpritemap_Crocomire_8 

InstList_Crocomire_SteppingBack:
    dw $0008 
    dw ExtendedSpritemap_Crocomire_ChargeForward_StepBack_B 
    dw Instruction_Crocomire_MoveRight4PixelsIfOnScreen_SpawnCloud 
    dw $0008 
    dw ExtendedSpritemap_Crocomire_ChargeForward_StepBack_A 
    dw Instruction_Crocomire_MoveRight4PixelsIfOnScreen 
    dw $0008 
    dw ExtendedSpritemap_Crocomire_ChargeForward_StepBack_9 
    dw Instruction_Crocomire_MoveRight4PixelsIfOnScreen 
    dw $0008 
    dw ExtendedSpritemap_Crocomire_ChargeForward_StepBack_8 
    dw Instruction_Crocomire_MoveRight4PixelsIfOnScreen_SpawnCloud 
    dw $0008 
    dw ExtendedSpritemap_Crocomire_ChargeForward_StepBack_7 
    dw Instruction_Crocomire_ShakeScreen 
    dw Instruction_Crocomire_MoveRight4PixelsIfOnScreen 
    dw Instruction_Crocomire_FightAI 

InstList_Crocomire_WaitForFirstSecondDamage:
    dw $0022 
    dw ExtendedSpritemap_Crocomire_6 
    dw $0002 
    dw ExtendedSpritemap_Crocomire_5 
    dw $0002 
    dw ExtendedSpritemap_Crocomire_4 
    dw $0002 
    dw ExtendedSpritemap_Crocomire_3 
    dw $0002 
    dw ExtendedSpritemap_Crocomire_2 
    dw $0002 
    dw ExtendedSpritemap_Crocomire_1 
    dw $0002 
    dw ExtendedSpritemap_Crocomire_0 
    dw $0010 
    dw ExtendedSpritemap_Crocomire_0 
    dw $0001 
    dw ExtendedSpritemap_Crocomire_1 
    dw $0001 
    dw ExtendedSpritemap_Crocomire_2 
    dw $0001 
    dw ExtendedSpritemap_Crocomire_3 
    dw $0001 
    dw ExtendedSpritemap_Crocomire_4 
    dw $0001 
    dw ExtendedSpritemap_Crocomire_5 
    dw $0010 
    dw ExtendedSpritemap_Crocomire_6 
    dw $0001 
    dw ExtendedSpritemap_Crocomire_5 
    dw $0001 
    dw ExtendedSpritemap_Crocomire_4 
    dw $0001 
    dw ExtendedSpritemap_Crocomire_3 
    dw $0001 
    dw ExtendedSpritemap_Crocomire_2 
    dw $0001 
    dw ExtendedSpritemap_Crocomire_1 
    dw $0001 
    dw ExtendedSpritemap_Crocomire_0 
    dw $0001 
    dw ExtendedSpritemap_Crocomire_1 
    dw $0001 
    dw ExtendedSpritemap_Crocomire_2 
    dw $0001 
    dw ExtendedSpritemap_Crocomire_3 
    dw $0001 
    dw ExtendedSpritemap_Crocomire_4 
    dw $0001 
    dw ExtendedSpritemap_Crocomire_5 
    dw $0001 
    dw ExtendedSpritemap_Crocomire_6 
    dw $0001 
    dw ExtendedSpritemap_Crocomire_5 
    dw $0001 
    dw ExtendedSpritemap_Crocomire_4 
    dw $0001 
    dw ExtendedSpritemap_Crocomire_3 
    dw $0001 
    dw ExtendedSpritemap_Crocomire_2 
    dw $0001 
    dw ExtendedSpritemap_Crocomire_1 
    dw $0001 
    dw ExtendedSpritemap_Crocomire_0 
    dw Instruction_Crocomire_FightAI 

InstList_Crocomire_WaitForFirstSecondDamage_MovingClaws:
    dw Instruction_Crocomire_SpawnBigDustCloudProjectile_10 
    dw $0005 
    dw ExtendedSpritemap_Crocomire_MovingClaws_0 
    dw $0005 
    dw ExtendedSpritemap_Crocomire_MovingClaws_1 
    dw Instruction_Crocomire_SpawnBigDustCloudProjectile_0 
    dw $0005 
    dw ExtendedSpritemap_Crocomire_MovingClaws_2 
    dw $0005 
    dw ExtendedSpritemap_Crocomire_MovingClaws_3 
    dw $0005 
    dw ExtendedSpritemap_Crocomire_MovingClaws_4 
    dw Instruction_Crocomire_QueueBigExplosionSFX 
    dw Instruction_Crocomire_SpawnBigDustCloudProjectile_Negative20 
    dw $0005 
    dw ExtendedSpritemap_Crocomire_MovingClaws_0 
    dw $0005 
    dw ExtendedSpritemap_Crocomire_MovingClaws_1 
    dw Instruction_Crocomire_SpawnBigDustCloudProjectile_Negative10 
    dw $0005 
    dw ExtendedSpritemap_Crocomire_MovingClaws_2 
    dw $0005 
    dw ExtendedSpritemap_Crocomire_MovingClaws_3 
    dw $0005 
    dw ExtendedSpritemap_Crocomire_MovingClaws_4 
    dw Instruction_Crocomire_QueueBigExplosionSFX 
    dw Instruction_Crocomire_SpawnBigDustCloudProjectile_0 
    dw $0005 
    dw ExtendedSpritemap_Crocomire_MovingClaws_0 
    dw $0005 
    dw ExtendedSpritemap_Crocomire_MovingClaws_1 
    dw Instruction_Crocomire_SpawnBigDustCloudProjectile_28 
    dw $0005 
    dw ExtendedSpritemap_Crocomire_MovingClaws_2 
    dw $0005 
    dw ExtendedSpritemap_Crocomire_MovingClaws_3 
    dw $0005 
    dw ExtendedSpritemap_Crocomire_MovingClaws_4 
    dw Instruction_Crocomire_QueueBigExplosionSFX 
    dw Instruction_Crocomire_SpawnBigDustCloudProjectile_Negative10 
    dw Instruction_Crocomire_FightAI 

InstList_Crocomire_WaitForFirstSecondDamage_Roar:
    dw $0030 
    dw ExtendedSpritemap_Crocomire_7 
    dw Instruction_Crocomire_QueueCrySFX 
    dw $0005 
    dw ExtendedSpritemap_Crocomire_8 
    dw $0002 
    dw ExtendedSpritemap_Crocomire_9 
    dw Instruction_Crocomire_FightAI 
    dw $0002 
    dw ExtendedSpritemap_Crocomire_9 
    dw Instruction_Crocomire_FightAI 
    dw $0002 
    dw ExtendedSpritemap_Crocomire_9 
    dw Instruction_Crocomire_FightAI 
    dw $0002 
    dw ExtendedSpritemap_Crocomire_9 
    dw Instruction_Crocomire_FightAI 
    dw $0002 
    dw ExtendedSpritemap_Crocomire_9 
    dw Instruction_Crocomire_FightAI 
    dw $0002 
    dw ExtendedSpritemap_Crocomire_9 
    dw Instruction_Crocomire_FightAI 
    dw $0002 
    dw ExtendedSpritemap_Crocomire_9 
    dw Instruction_Crocomire_FightAI 
    dw $0002 
    dw ExtendedSpritemap_Crocomire_9 
    dw Instruction_Crocomire_FightAI 
    dw $0002 
    dw ExtendedSpritemap_Crocomire_9 
    dw Instruction_Crocomire_FightAI 
    dw $0002 
    dw ExtendedSpritemap_Crocomire_9 
    dw Instruction_Crocomire_FightAI 
    dw $0002 
    dw ExtendedSpritemap_Crocomire_9 
    dw Instruction_Crocomire_FightAI 
    dw $0002 
    dw ExtendedSpritemap_Crocomire_9 
    dw Instruction_Crocomire_FightAI 
    dw $0002 
    dw ExtendedSpritemap_Crocomire_9 
    dw Instruction_Crocomire_FightAI 
    dw $0020 
    dw ExtendedSpritemap_Crocomire_9 
    dw Instruction_Crocomire_FightAI 
    dw $0001 
    dw ExtendedSpritemap_Crocomire_9 
    dw Instruction_Crocomire_FightAI 

InstList_Crocomire_WaitForFirstSecondDamage_RoarCloseMouth_0:
    dw $0020 
    dw ExtendedSpritemap_Crocomire_9 
    dw Instruction_Crocomire_FightAI 
    dw $0005 
    dw ExtendedSpritemap_Crocomire_8 
    dw Instruction_Crocomire_FightAI 
    dw $0008 
    dw ExtendedSpritemap_Crocomire_8 
    dw $0002 
    dw ExtendedSpritemap_Crocomire_7 

InstList_Crocomire_WaitForFirstSecondDamage_RoarCloseMouth_1:
    dw $0001 
    dw ExtendedSpritemap_Crocomire_7 
    dw Instruction_Crocomire_FightAI 
    dw $0001 
    dw ExtendedSpritemap_Crocomire_7 
    dw Instruction_Crocomire_FightAI 

InstList_Crocomire_PowerBombReaction_MouthFullyOpen:
    dw $0002 
    dw ExtendedSpritemap_Crocomire_8 

InstList_Crocomire_PowerBombReaction_MouthPartiallyOpen:
    dw $0002 
    dw ExtendedSpritemap_Crocomire_7 

InstList_Crocomire_PowerBombReaction_MouthNotOpen_0:
    dw Instruction_Crocomire_SpawnBigDustCloudProjectile_10 
    dw $0005 
    dw ExtendedSpritemap_Crocomire_MovingClaws_0 
    dw $0005 
    dw ExtendedSpritemap_Crocomire_MovingClaws_1 
    dw Instruction_Crocomire_SpawnBigDustCloudProjectile_0 
    dw $0005 
    dw ExtendedSpritemap_Crocomire_MovingClaws_2 
    dw $0005 
    dw ExtendedSpritemap_Crocomire_MovingClaws_3 
    dw $0005 
    dw ExtendedSpritemap_Crocomire_MovingClaws_4 
    dw Instruction_Crocomire_QueueBigExplosionSFX 
    dw Instruction_Crocomire_SpawnBigDustCloudProjectile_Negative20 
    dw $0005 
    dw ExtendedSpritemap_Crocomire_MovingClaws_0 
    dw $0005 
    dw ExtendedSpritemap_Crocomire_MovingClaws_1 
    dw Instruction_Crocomire_SpawnBigDustCloudProjectile_Negative10 
    dw $0005 
    dw ExtendedSpritemap_Crocomire_MovingClaws_2 
    dw $0005 
    dw ExtendedSpritemap_Crocomire_MovingClaws_3 
    dw $0005 
    dw ExtendedSpritemap_Crocomire_MovingClaws_4 
    dw Instruction_Crocomire_QueueBigExplosionSFX 
    dw Instruction_Crocomire_SpawnBigDustCloudProjectile_0 
    dw $0005 
    dw ExtendedSpritemap_Crocomire_MovingClaws_0 
    dw $0005 
    dw ExtendedSpritemap_Crocomire_MovingClaws_1 
    dw Instruction_Crocomire_SpawnBigDustCloudProjectile_28 
    dw $0005 
    dw ExtendedSpritemap_Crocomire_MovingClaws_2 
    dw $0005 
    dw ExtendedSpritemap_Crocomire_MovingClaws_3 
    dw $0005 
    dw ExtendedSpritemap_Crocomire_MovingClaws_4 
    dw Instruction_Crocomire_QueueBigExplosionSFX 
    dw Instruction_Crocomire_SpawnBigDustCloudProjectile_Negative10 

InstList_Crocomire_PowerBombReaction_MouthNotOpen_1:
    dw $0004 
    dw ExtendedSpritemap_Crocomire_ChargeForward_StepBack_0 
    dw Instruction_Crocomire_ShakeScreen 
    dw Instruction_Crocomire_MoveLeft4Pixels_SpawnBigDustCloud 
    dw $0004 
    dw ExtendedSpritemap_Crocomire_ChargeForward_StepBack_1 
    dw Instruction_Crocomire_MoveLeft4Pixels 
    dw $0004 
    dw ExtendedSpritemap_Crocomire_ChargeForward_StepBack_2 
    dw Instruction_Crocomire_MoveLeft4Pixels 
    dw $0004 
    dw ExtendedSpritemap_Crocomire_ChargeForward_StepBack_3 
    dw Instruction_Crocomire_MoveLeft4Pixels_SpawnBigDustCloud 
    dw $0004 
    dw ExtendedSpritemap_Crocomire_ChargeForward_StepBack_4 
    dw Instruction_Crocomire_MoveLeft4Pixels 
    dw $0004 
    dw ExtendedSpritemap_Crocomire_ChargeForward_StepBack_5 
    dw Instruction_Crocomire_MoveLeft4Pixels 
    dw $0004 
    dw ExtendedSpritemap_Crocomire_ChargeForward_StepBack_6 
    dw Instruction_Crocomire_ShakeScreen 
    dw Instruction_Crocomire_MoveLeft4Pixels_SpawnBigDustCloud 
    dw $0004 
    dw ExtendedSpritemap_Crocomire_ChargeForward_StepBack_7 
    dw Instruction_Crocomire_MoveLeft4Pixels 
    dw $0004 
    dw ExtendedSpritemap_Crocomire_ChargeForward_StepBack_8 
    dw Instruction_Crocomire_MoveLeft4Pixels 
    dw $0004 
    dw ExtendedSpritemap_Crocomire_ChargeForward_StepBack_9 
    dw Instruction_Crocomire_MoveLeft4Pixels_SpawnBigDustCloud 
    dw $0004 
    dw ExtendedSpritemap_Crocomire_ChargeForward_StepBack_A 
    dw Instruction_Crocomire_MoveLeft4Pixels 
    dw $0004 
    dw ExtendedSpritemap_Crocomire_ChargeForward_StepBack_B 
    dw Instruction_Crocomire_FightAI 
    dw Instruction_Common_GotoY 
    dw InstList_Crocomire_PowerBombReaction_MouthNotOpen_1 

InstList_CrocomireTongue_Fight:
    dw $0005 
    dw ExtendedSpritemap_Crocomire_10 
    dw $0005 
    dw ExtendedSpritemap_Crocomire_11 
    dw $0005 
    dw ExtendedSpritemap_Crocomire_12 
    dw $0005 
    dw ExtendedSpritemap_Crocomire_13 
    dw Instruction_Common_GotoY 
    dw InstList_CrocomireTongue_Fight 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_CrocomireTongue_ReverseVersionOfFight_A4BE6A:
    dw $0005 
    dw ExtendedSpritemap_Crocomire_13 
    dw $0005 
    dw ExtendedSpritemap_Crocomire_12 
    dw $0005 
    dw ExtendedSpritemap_Crocomire_11 
    dw $0005 
    dw ExtendedSpritemap_Crocomire_10 
    dw Instruction_Common_GotoY 
    dw InstList_CrocomireTongue_Fight 
endif ; !FEATURE_KEEP_UNREFERENCED

InstList_CrocomireTongue_NearSpikeWallCharge_0:
    dw $0005 
    dw ExtendedSpritemap_Crocomire_7 
    dw Instruction_Crocomire_QueueCrySFX 
    dw Instruction_Crocomire_FightAI 
    dw $0005 
    dw ExtendedSpritemap_Crocomire_8 
    dw Instruction_Crocomire_FightAI 
    dw $0002 
    dw ExtendedSpritemap_Crocomire_9 
    dw Instruction_Crocomire_FightAI 
    dw $0002 
    dw ExtendedSpritemap_Crocomire_9 
    dw Instruction_Crocomire_FightAI 
    dw $0002 
    dw ExtendedSpritemap_Crocomire_9 
    dw Instruction_Crocomire_FightAI 
    dw $0002 
    dw ExtendedSpritemap_Crocomire_9 
    dw Instruction_Crocomire_FightAI 
    dw $0002 
    dw ExtendedSpritemap_Crocomire_9 
    dw Instruction_Crocomire_FightAI 
    dw $0002 
    dw ExtendedSpritemap_Crocomire_9 
    dw Instruction_Crocomire_FightAI 
    dw $0002 
    dw ExtendedSpritemap_Crocomire_9 
    dw Instruction_Crocomire_FightAI 
    dw $0002 
    dw ExtendedSpritemap_Crocomire_9 
    dw Instruction_Crocomire_FightAI 
    dw $0002 
    dw ExtendedSpritemap_Crocomire_9 
    dw Instruction_Crocomire_FightAI 
    dw $0002 
    dw ExtendedSpritemap_Crocomire_9 
    dw Instruction_Crocomire_FightAI 
    dw $0002 
    dw ExtendedSpritemap_Crocomire_9 
    dw Instruction_Crocomire_FightAI 
    dw $0002 
    dw ExtendedSpritemap_Crocomire_9 
    dw Instruction_Crocomire_FightAI 
    dw $0002 
    dw ExtendedSpritemap_Crocomire_9 
    dw Instruction_Crocomire_FightAI 
    dw $0005 
    dw ExtendedSpritemap_Crocomire_8 
    dw Instruction_Crocomire_FightAI 
    dw $0008 
    dw ExtendedSpritemap_Crocomire_8 
    dw Instruction_Crocomire_FightAI 
    dw $0002 
    dw ExtendedSpritemap_Crocomire_7 
    dw Instruction_Crocomire_FightAI 

InstList_CrocomireTongue_NearSpikeWallCharge_1:
    dw $0003 
    dw ExtendedSpritemap_Crocomire_ChargeForward_StepBack_0 
    dw Instruction_Crocomire_ShakeScreen 
    dw Instruction_Crocomire_MoveLeft4Pixels_SpawnBigDustCloud_dup 
    dw $0003 
    dw ExtendedSpritemap_Crocomire_ChargeForward_StepBack_1 
    dw Instruction_Crocomire_MoveLeft_SpawnCloud_HandleSpikeWall 
    dw $0003 
    dw ExtendedSpritemap_Crocomire_ChargeForward_StepBack_2 
    dw Instruction_Crocomire_MoveLeft_SpawnCloud_HandleSpikeWall 
    dw $0003 
    dw ExtendedSpritemap_Crocomire_ChargeForward_StepBack_3 
    dw Instruction_Crocomire_MoveLeft4Pixels_SpawnBigDustCloud_dup 
    dw $0003 
    dw ExtendedSpritemap_Crocomire_ChargeForward_StepBack_4 
    dw Instruction_Crocomire_MoveLeft_SpawnCloud_HandleSpikeWall 
    dw $0003 
    dw ExtendedSpritemap_Crocomire_ChargeForward_StepBack_5 
    dw Instruction_Crocomire_MoveLeft_SpawnCloud_HandleSpikeWall 
    dw $0003 
    dw ExtendedSpritemap_Crocomire_ChargeForward_StepBack_6 
    dw Instruction_Crocomire_ShakeScreen 
    dw Instruction_Crocomire_MoveLeft4Pixels_SpawnBigDustCloud_dup 
    dw $0003 
    dw ExtendedSpritemap_Crocomire_ChargeForward_StepBack_7 
    dw Instruction_Crocomire_MoveLeft_SpawnCloud_HandleSpikeWall 
    dw $0003 
    dw ExtendedSpritemap_Crocomire_ChargeForward_StepBack_8 
    dw Instruction_Crocomire_MoveLeft_SpawnCloud_HandleSpikeWall 
    dw $0003 
    dw ExtendedSpritemap_Crocomire_ChargeForward_StepBack_9 
    dw Instruction_Crocomire_MoveLeft4Pixels_SpawnBigDustCloud_dup 
    dw $0003 
    dw ExtendedSpritemap_Crocomire_ChargeForward_StepBack_A 
    dw Instruction_Crocomire_MoveLeft_SpawnCloud_HandleSpikeWall 
    dw $0003 
    dw ExtendedSpritemap_Crocomire_ChargeForward_StepBack_B 
    dw Instruction_Crocomire_FightAI 
    dw Instruction_Common_GotoY 
    dw InstList_CrocomireTongue_NearSpikeWallCharge_1 

InstList_Crocomire_BackOffFromSpikeWall:
    dw $0008 
    dw ExtendedSpritemap_Crocomire_ChargeForward_StepBack_B 
    dw Instruction_Crocomire_MoveRight4Pixels_SpawnBigDustCloud 
    dw $0008 
    dw ExtendedSpritemap_Crocomire_ChargeForward_StepBack_A 
    dw Instruction_Crocomire_MoveRight4Pixels 
    dw $0008 
    dw ExtendedSpritemap_Crocomire_ChargeForward_StepBack_9 
    dw Instruction_Crocomire_MoveRight4Pixels 
    dw $0008 
    dw ExtendedSpritemap_Crocomire_ChargeForward_StepBack_8 
    dw Instruction_Crocomire_MoveRight4Pixels_SpawnBigDustCloud 
    dw $0008 
    dw ExtendedSpritemap_Crocomire_ChargeForward_StepBack_7 
    dw Instruction_Crocomire_ShakeScreen 
    dw Instruction_Crocomire_MoveRight4Pixels 
    dw Instruction_Crocomire_FightAI 
    dw Instruction_Common_GotoY 
    dw InstList_Crocomire_BackOffFromSpikeWall 

InstList_Crocomire_Sleep:
    dw Instruction_Common_Sleep 

InstList_Crocomire_Melting1_TopRow:
    dw $7FFF 
    dw ExtendedSpritemap_Crocomire_25 
    dw Instruction_Common_GotoY 
    dw InstList_Crocomire_Melting1_TopRow 

InstList_Crocomire_Melting1_Top2Rows:
    dw $7FFF 
    dw ExtendedSpritemap_Crocomire_26 
    dw Instruction_Common_Sleep 

InstList_Crocomire_Melting1_Top3Rows:
    dw $7FFF 
    dw ExtendedSpritemap_Crocomire_27 
    dw Instruction_CommonA4_Sleep 

InstList_Crocomire_Melting1_Top4Rows:
    dw $7FFF 
    dw ExtendedSpritemap_Crocomire_28 
    dw Instruction_CommonA4_Sleep 

InstList_Crocomire_Melting2_TopRow:
    dw $7FFF 
    dw ExtendedSpritemap_Crocomire_29 
    dw Instruction_Common_GotoY 
    dw InstList_Crocomire_Melting2_TopRow 

InstList_Crocomire_Melting2_Top2Rows:
    dw $7FFF 
    dw ExtendedSpritemap_Crocomire_2A 
    dw Instruction_Common_Sleep 

InstList_Crocomire_Melting2_Top3Rows:
    dw $7FFF 
    dw ExtendedSpritemap_Crocomire_2B 
    dw Instruction_Common_Sleep 

InstList_Crocomire_Melting2_Top4Rows:
    dw $7FFF 
    dw ExtendedSpritemap_Crocomire_2C 
    dw Instruction_CommonA4_Sleep 

InstList_CrocomireTongue_Melting:
    dw $0005 
    dw ExtendedSpritemap_Crocomire_2D 
    dw $0005 
    dw ExtendedSpritemap_Crocomire_2E 
    dw $0005 
    dw ExtendedSpritemap_Crocomire_2F 
    dw $0005 
    dw ExtendedSpritemap_Crocomire_30 
    dw $0005 
    dw ExtendedSpritemap_Crocomire_31 
    dw Instruction_Common_GotoY 
    dw InstList_CrocomireTongue_Melting 

InstList_CrocomireTongue_BridgeCollapsed:
    dw $0005 
    dw ExtendedSpritemap_Crocomire_8 
    dw $0005 
    dw ExtendedSpritemap_Crocomire_7 
    dw Instruction_Crocomire_QueueCrySFX 
    dw $0005 
    dw ExtendedSpritemap_Crocomire_8 
    dw $0005 
    dw ExtendedSpritemap_Crocomire_9 
    dw Instruction_Common_Sleep 

ExtendedSpritemap_Crocomire_ChargeForward_StepBack_0:
    dw $0006,$0003,$000B 
    dw Spritemap_Crocomire_3 
    dw Hitbox_Crocomire_3 
    dw $0000,$0026 
    dw Spritemap_Crocomire_B 
    dw Hitbox_Crocomire_5 
    dw $FFE3,$0026 
    dw Spritemap_Crocomire_5 
    dw Hitbox_Crocomire_5 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_3 
    dw Hitbox_Crocomire_F 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_9 
    dw Hitbox_Crocomire_F 
    dw $0000,$FFFF 
    dw ExtendedTilemap_Crocomire_6 
    dw Hitbox_Crocomire_F 

ExtendedSpritemap_Crocomire_ChargeForward_StepBack_1:
    dw $0006,$0001,$000B 
    dw Spritemap_Crocomire_4 
    dw Hitbox_Crocomire_4 
    dw $0000,$0026 
    dw Spritemap_Crocomire_C 
    dw Hitbox_Crocomire_5 
    dw $FFE3,$0026 
    dw Spritemap_Crocomire_6 
    dw Hitbox_Crocomire_5 
    dw $0000,$FFFE 
    dw ExtendedTilemap_Crocomire_4 
    dw Hitbox_Crocomire_F 
    dw $0000,$FFFE 
    dw ExtendedTilemap_Crocomire_9 
    dw Hitbox_Crocomire_F 
    dw $0000,$FFFE 
    dw ExtendedTilemap_Crocomire_7 
    dw Hitbox_Crocomire_F 

ExtendedSpritemap_Crocomire_ChargeForward_StepBack_2:
    dw $0006,$0000,$0008 
    dw Spritemap_Crocomire_1 
    dw Hitbox_Crocomire_1 
    dw $0000,$0026 
    dw Spritemap_Crocomire_D 
    dw Hitbox_Crocomire_5 
    dw $FFE3,$0026 
    dw Spritemap_Crocomire_7 
    dw Hitbox_Crocomire_5 
    dw $0000,$FFFE 
    dw ExtendedTilemap_Crocomire_5 
    dw Hitbox_Crocomire_F 
    dw $0000,$FFFE 
    dw ExtendedTilemap_Crocomire_9 
    dw Hitbox_Crocomire_F 
    dw $0000,$FFFE 
    dw ExtendedTilemap_Crocomire_8 
    dw Hitbox_Crocomire_F 

ExtendedSpritemap_Crocomire_ChargeForward_StepBack_3:
    dw $0006,$0001,$000B 
    dw Spritemap_Crocomire_0 
    dw Hitbox_Crocomire_0 
    dw $0000,$0026 
    dw Spritemap_Crocomire_E 
    dw Hitbox_Crocomire_5 
    dw $FFE3,$0026 
    dw Spritemap_Crocomire_8 
    dw Hitbox_Crocomire_5 
    dw $0000,$FFFF 
    dw ExtendedTilemap_Crocomire_4 
    dw Hitbox_Crocomire_F 
    dw $0000,$FFFF 
    dw ExtendedTilemap_Crocomire_9 
    dw Hitbox_Crocomire_F 
    dw $0000,$FFFE 
    dw ExtendedTilemap_Crocomire_7 
    dw Hitbox_Crocomire_F 

ExtendedSpritemap_Crocomire_ChargeForward_StepBack_4:
    dw $0006,$0001,$000A 
    dw Spritemap_Crocomire_0 
    dw Hitbox_Crocomire_0 
    dw $0000,$0026 
    dw Spritemap_Crocomire_F 
    dw Hitbox_Crocomire_5 
    dw $FFE3,$0026 
    dw Spritemap_Crocomire_9 
    dw Hitbox_Crocomire_5 
    dw $0000,$FFFE 
    dw ExtendedTilemap_Crocomire_3 
    dw Hitbox_Crocomire_F 
    dw $0000,$FFFE 
    dw ExtendedTilemap_Crocomire_9 
    dw Hitbox_Crocomire_F 
    dw $0000,$FFFE 
    dw ExtendedTilemap_Crocomire_6 
    dw Hitbox_Crocomire_F 

ExtendedSpritemap_Crocomire_ChargeForward_StepBack_5:
    dw $0006,$0001,$000A 
    dw Spritemap_Crocomire_2 
    dw Hitbox_Crocomire_2 
    dw $0000,$0026 
    dw Spritemap_Crocomire_10 
    dw Hitbox_Crocomire_5 
    dw $FFE3,$0026 
    dw Spritemap_Crocomire_A 
    dw Hitbox_Crocomire_5 
    dw $0000,$FFFE 
    dw ExtendedTilemap_Crocomire_4 
    dw Hitbox_Crocomire_F 
    dw $0000,$FFFE 
    dw ExtendedTilemap_Crocomire_9 
    dw Hitbox_Crocomire_F 
    dw $0000,$FFFE 
    dw ExtendedTilemap_Crocomire_7 
    dw Hitbox_Crocomire_F 

ExtendedSpritemap_Crocomire_ChargeForward_StepBack_6:
    dw $0006,$0001,$000A 
    dw Spritemap_Crocomire_3 
    dw Hitbox_Crocomire_3 
    dw $0000,$0026 
    dw Spritemap_Crocomire_5 
    dw Hitbox_Crocomire_5 
    dw $FFE3,$0026 
    dw Spritemap_Crocomire_B 
    dw Hitbox_Crocomire_5 
    dw $0000,$FFFF 
    dw ExtendedTilemap_Crocomire_5 
    dw Hitbox_Crocomire_F 
    dw $0000,$FFFF 
    dw ExtendedTilemap_Crocomire_9 
    dw Hitbox_Crocomire_F 
    dw $0000,$FFFF 
    dw ExtendedTilemap_Crocomire_8 
    dw Hitbox_Crocomire_F 

ExtendedSpritemap_Crocomire_ChargeForward_StepBack_7:
    dw $0006,$0001,$000A 
    dw Spritemap_Crocomire_4 
    dw Hitbox_Crocomire_4 
    dw $0000,$0026 
    dw Spritemap_Crocomire_6 
    dw Hitbox_Crocomire_5 
    dw $FFE3,$0026 
    dw Spritemap_Crocomire_C 
    dw Hitbox_Crocomire_5 
    dw $0000,$FFFF 
    dw ExtendedTilemap_Crocomire_4 
    dw Hitbox_Crocomire_F 
    dw $0000,$FFFF 
    dw ExtendedTilemap_Crocomire_9 
    dw Hitbox_Crocomire_F 
    dw $0000,$FFFF 
    dw ExtendedTilemap_Crocomire_7 
    dw Hitbox_Crocomire_F 

ExtendedSpritemap_Crocomire_ChargeForward_StepBack_8:
    dw $0006,$0001,$000A 
    dw Spritemap_Crocomire_1 
    dw Hitbox_Crocomire_1 
    dw $0000,$0026 
    dw Spritemap_Crocomire_7 
    dw Hitbox_Crocomire_5 
    dw $FFE3,$0026 
    dw Spritemap_Crocomire_D 
    dw Hitbox_Crocomire_5 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_3 
    dw Hitbox_Crocomire_F 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_9 
    dw Hitbox_Crocomire_F 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_6 
    dw Hitbox_Crocomire_F 

ExtendedSpritemap_Crocomire_ChargeForward_StepBack_9:
    dw $0006,$0001,$000C 
    dw Spritemap_Crocomire_0 
    dw Hitbox_Crocomire_0 
    dw $0000,$0026 
    dw Spritemap_Crocomire_8 
    dw Hitbox_Crocomire_5 
    dw $FFE3,$0026 
    dw Spritemap_Crocomire_E 
    dw Hitbox_Crocomire_5 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_4 
    dw Hitbox_Crocomire_F 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_9 
    dw Hitbox_Crocomire_F 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_7 
    dw Hitbox_Crocomire_F 

ExtendedSpritemap_Crocomire_ChargeForward_StepBack_A:
    dw $0006,$0001,$000D 
    dw Spritemap_Crocomire_0 
    dw Hitbox_Crocomire_0 
    dw $0000,$0026 
    dw Spritemap_Crocomire_9 
    dw Hitbox_Crocomire_5 
    dw $FFE3,$0026 
    dw Spritemap_Crocomire_F 
    dw Hitbox_Crocomire_5 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_5 
    dw Hitbox_Crocomire_F 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_9 
    dw Hitbox_Crocomire_F 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_8 
    dw Hitbox_Crocomire_F 

ExtendedSpritemap_Crocomire_ChargeForward_StepBack_B:
    dw $0006,$0001,$000B 
    dw Spritemap_Crocomire_2 
    dw Hitbox_Crocomire_2 
    dw $0000,$0026 
    dw Spritemap_Crocomire_A 
    dw Hitbox_Crocomire_5 
    dw $FFE3,$0026 
    dw Spritemap_Crocomire_10 
    dw Hitbox_Crocomire_5 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_4 
    dw Hitbox_Crocomire_F 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_9 
    dw Hitbox_Crocomire_F 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_7 
    dw Hitbox_Crocomire_F 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ExtendedSpritemap_Crocomire_A4C21C:
    dw $0006,$0001,$000A 
    dw Spritemap_Crocomire_0 
    dw Hitbox_Crocomire_0 
    dw $0000,$0029 
    dw Spritemap_Crocomire_11 
    dw Hitbox_Crocomire_5 
    dw $FFE3,$0029 
    dw Spritemap_Crocomire_11 
    dw Hitbox_Crocomire_5 
    dw $0000,$FFFE 
    dw ExtendedTilemap_Crocomire_3 
    dw Hitbox_Crocomire_F 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_9 
    dw Hitbox_Crocomire_F 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_6 
    dw Hitbox_Crocomire_F 

UNUSED_ExtendedSpritemap_Crocomire_A4C24E:
    dw $0006,$0001,$0008 
    dw Spritemap_Crocomire_0 
    dw Hitbox_Crocomire_0 
    dw $0000,$0029 
    dw Spritemap_Crocomire_12 
    dw Hitbox_Crocomire_5 
    dw $FFE3,$0029 
    dw Spritemap_Crocomire_12 
    dw Hitbox_Crocomire_5 
    dw $0000,$FFFC 
    dw ExtendedTilemap_Crocomire_4 
    dw Hitbox_Crocomire_F 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_9 
    dw Hitbox_Crocomire_F 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_7 
    dw Hitbox_Crocomire_F 

UNUSED_ExtendedSpritemap_Crocomire_A4C280:
    dw $0006,$0001,$0006 
    dw Spritemap_Crocomire_0 
    dw Hitbox_Crocomire_0 
    dw $0000,$0029 
    dw Spritemap_Crocomire_13 
    dw Hitbox_Crocomire_5 
    dw $FFE3,$0029 
    dw Spritemap_Crocomire_13 
    dw Hitbox_Crocomire_5 
    dw $0000,$FFFA 
    dw ExtendedTilemap_Crocomire_5 
    dw Hitbox_Crocomire_F 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_9 
    dw Hitbox_Crocomire_F 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_8 
    dw Hitbox_Crocomire_F 

UNUSED_ExtendedSpritemap_Crocomire_A4C2B2:
    dw $0007,$0000,$000B 
    dw Spritemap_Crocomire_2 
    dw Hitbox_Crocomire_2 
    dw $FFFD,$FFE4 
    dw Spritemap_Crocomire_1D 
    dw Hitbox_Crocomire_B 
    dw $0000,$0029 
    dw Spritemap_Crocomire_13 
    dw Hitbox_Crocomire_5 
    dw $FFE3,$0029 
    dw Spritemap_Crocomire_13 
    dw Hitbox_Crocomire_5 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_2 
    dw Hitbox_Crocomire_E 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_A 
    dw Hitbox_Crocomire_10 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_6 
    dw Hitbox_Crocomire_F 
endif ; !FEATURE_KEEP_UNREFERENCED

ExtendedSpritemap_Crocomire_0:
    dw $0007,$0000,$000B 
    dw Spritemap_Crocomire_2 
    dw Hitbox_Crocomire_2 
    dw $FFFD,$FFE4 
    dw Spritemap_Crocomire_1C 
    dw Hitbox_Crocomire_B 
    dw $0000,$0029 
    dw Spritemap_Crocomire_13 
    dw Hitbox_Crocomire_5 
    dw $FFE3,$0029 
    dw Spritemap_Crocomire_13 
    dw Hitbox_Crocomire_5 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_2 
    dw Hitbox_Crocomire_E 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_A 
    dw Hitbox_Crocomire_10 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_6 
    dw Hitbox_Crocomire_F 

ExtendedSpritemap_Crocomire_1:
    dw $0007,$0000,$000B 
    dw Spritemap_Crocomire_2 
    dw Hitbox_Crocomire_2 
    dw $FFFD,$FFE4 
    dw Spritemap_Crocomire_1D 
    dw Hitbox_Crocomire_B 
    dw $0000,$0029 
    dw Spritemap_Crocomire_13 
    dw Hitbox_Crocomire_5 
    dw $FFE3,$0029 
    dw Spritemap_Crocomire_13 
    dw Hitbox_Crocomire_5 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_2 
    dw Hitbox_Crocomire_E 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_A 
    dw Hitbox_Crocomire_10 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_6 
    dw Hitbox_Crocomire_F 

ExtendedSpritemap_Crocomire_2:
    dw $0007,$0000,$000B 
    dw Spritemap_Crocomire_2 
    dw Hitbox_Crocomire_2 
    dw $FFFD,$FFE4 
    dw Spritemap_Crocomire_1E 
    dw Hitbox_Crocomire_B 
    dw $0000,$0029 
    dw Spritemap_Crocomire_13 
    dw Hitbox_Crocomire_5 
    dw $FFE3,$0029 
    dw Spritemap_Crocomire_13 
    dw Hitbox_Crocomire_5 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_2 
    dw Hitbox_Crocomire_E 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_A 
    dw Hitbox_Crocomire_10 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_6 
    dw Hitbox_Crocomire_F 

ExtendedSpritemap_Crocomire_3:
    dw $0007,$0000,$000B 
    dw Spritemap_Crocomire_2 
    dw Hitbox_Crocomire_2 
    dw $FFFD,$FFE4 
    dw Spritemap_Crocomire_1F 
    dw Hitbox_Crocomire_B 
    dw $0000,$0029 
    dw Spritemap_Crocomire_13 
    dw Hitbox_Crocomire_5 
    dw $FFE3,$0029 
    dw Spritemap_Crocomire_13 
    dw Hitbox_Crocomire_5 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_2 
    dw Hitbox_Crocomire_E 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_A 
    dw Hitbox_Crocomire_10 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_6 
    dw Hitbox_Crocomire_F 

ExtendedSpritemap_Crocomire_4:
    dw $0007,$0000,$000B 
    dw Spritemap_Crocomire_2 
    dw Hitbox_Crocomire_2 
    dw $FFFD,$FFE4 
    dw Spritemap_Crocomire_20 
    dw Hitbox_Crocomire_B 
    dw $0000,$0029 
    dw Spritemap_Crocomire_13 
    dw Hitbox_Crocomire_5 
    dw $FFE3,$0029 
    dw Spritemap_Crocomire_13 
    dw Hitbox_Crocomire_5 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_2 
    dw Hitbox_Crocomire_E 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_A 
    dw Hitbox_Crocomire_10 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_6 
    dw Hitbox_Crocomire_F 

ExtendedSpritemap_Crocomire_5:
    dw $0007,$0000,$000B 
    dw Spritemap_Crocomire_2 
    dw Hitbox_Crocomire_2 
    dw $FFFD,$FFE4 
    dw Spritemap_Crocomire_21 
    dw Hitbox_Crocomire_B 
    dw $0000,$0029 
    dw Spritemap_Crocomire_13 
    dw Hitbox_Crocomire_5 
    dw $FFE3,$0029 
    dw Spritemap_Crocomire_13 
    dw Hitbox_Crocomire_5 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_2 
    dw Hitbox_Crocomire_E 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_A 
    dw Hitbox_Crocomire_10 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_6 
    dw Hitbox_Crocomire_F 

ExtendedSpritemap_Crocomire_6:
    dw $0006,$0000,$000B 
    dw Spritemap_Crocomire_2 
    dw Hitbox_Crocomire_2 
    dw $0000,$0029 
    dw Spritemap_Crocomire_13 
    dw Hitbox_Crocomire_5 
    dw $FFE3,$0029 
    dw Spritemap_Crocomire_13 
    dw Hitbox_Crocomire_5 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_2 
    dw Hitbox_Crocomire_E 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_A 
    dw Hitbox_Crocomire_10 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_6 
    dw Hitbox_Crocomire_F 

ExtendedSpritemap_Crocomire_MovingClaws_0:
    dw $0006,$0001,$000B 
    dw Spritemap_Crocomire_15 
    dw Hitbox_Crocomire_7 
    dw $0000,$0025 
    dw Spritemap_Crocomire_11 
    dw Hitbox_Crocomire_5 
    dw $FFE3,$0029 
    dw Spritemap_Crocomire_13 
    dw Hitbox_Crocomire_5 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_3 
    dw Hitbox_Crocomire_F 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_9 
    dw Hitbox_Crocomire_F 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_6 
    dw Hitbox_Crocomire_F 

ExtendedSpritemap_Crocomire_MovingClaws_1:
    dw $0006,$0000,$0008 
    dw Spritemap_Crocomire_16 
    dw Hitbox_Crocomire_8 
    dw $0000,$0027 
    dw Spritemap_Crocomire_12 
    dw Hitbox_Crocomire_5 
    dw $FFE3,$0027 
    dw Spritemap_Crocomire_12 
    dw Hitbox_Crocomire_5 
    dw $0000,$FFFE 
    dw ExtendedTilemap_Crocomire_4 
    dw Hitbox_Crocomire_F 
    dw $0000,$FFFE 
    dw ExtendedTilemap_Crocomire_9 
    dw Hitbox_Crocomire_F 
    dw $0000,$FFFE 
    dw ExtendedTilemap_Crocomire_7 
    dw Hitbox_Crocomire_F 

ExtendedSpritemap_Crocomire_MovingClaws_2:
    dw $0006,$0001,$0008 
    dw Spritemap_Crocomire_14 
    dw Hitbox_Crocomire_6 
    dw $0000,$0029 
    dw Spritemap_Crocomire_13 
    dw Hitbox_Crocomire_5 
    dw $FFE3,$0020 
    dw Spritemap_Crocomire_11 
    dw Hitbox_Crocomire_5 
    dw $0000,$FFFC 
    dw ExtendedTilemap_Crocomire_5 
    dw Hitbox_Crocomire_F 
    dw $0000,$FFFC 
    dw ExtendedTilemap_Crocomire_9 
    dw Hitbox_Crocomire_F 
    dw $0000,$FFFC 
    dw ExtendedTilemap_Crocomire_8 
    dw Hitbox_Crocomire_F 

ExtendedSpritemap_Crocomire_MovingClaws_3:
    dw $0006,$0000,$000A 
    dw Spritemap_Crocomire_1 
    dw Hitbox_Crocomire_1 
    dw $0000,$0027 
    dw Spritemap_Crocomire_12 
    dw Hitbox_Crocomire_5 
    dw $FFE3,$0025 
    dw Spritemap_Crocomire_12 
    dw Hitbox_Crocomire_5 
    dw $0000,$FFFE 
    dw ExtendedTilemap_Crocomire_4 
    dw Hitbox_Crocomire_F 
    dw $0000,$FFFE 
    dw ExtendedTilemap_Crocomire_9 
    dw Hitbox_Crocomire_F 
    dw $0000,$FFFE 
    dw ExtendedTilemap_Crocomire_7 
    dw Hitbox_Crocomire_F 

ExtendedSpritemap_Crocomire_MovingClaws_4:
    dw $0006,$0001,$000C 
    dw Spritemap_Crocomire_0 
    dw Hitbox_Crocomire_0 
    dw $0000,$0025 
    dw Spritemap_Crocomire_11 
    dw Hitbox_Crocomire_5 
    dw $FFE3,$0028 
    dw Spritemap_Crocomire_13 
    dw Hitbox_Crocomire_5 
    dw $0000,$FFFF 
    dw ExtendedTilemap_Crocomire_3 
    dw Hitbox_Crocomire_F 
    dw $0000,$FFFF 
    dw ExtendedTilemap_Crocomire_9 
    dw Hitbox_Crocomire_F 
    dw $0000,$FFFF 
    dw ExtendedTilemap_Crocomire_6 
    dw Hitbox_Crocomire_F 

ExtendedSpritemap_Crocomire_7:
    dw $0007,$0001,$000B 
    dw Spritemap_Crocomire_2 
    dw Hitbox_Crocomire_2 
    dw $0000,$0026 
    dw Spritemap_Crocomire_A 
    dw Hitbox_Crocomire_5 
    dw $FFE3,$0026 
    dw Spritemap_Crocomire_10 
    dw Hitbox_Crocomire_5 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_2 
    dw Hitbox_Crocomire_E 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_4 
    dw Hitbox_Crocomire_F 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_A 
    dw Hitbox_Crocomire_10 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_7 
    dw Hitbox_Crocomire_F 

ExtendedSpritemap_Crocomire_8:
    dw $0007,$0001,$000B 
    dw Spritemap_Crocomire_2 
    dw Hitbox_Crocomire_2 
    dw $0000,$0026 
    dw Spritemap_Crocomire_A 
    dw Hitbox_Crocomire_5 
    dw $FFE3,$0026 
    dw Spritemap_Crocomire_10 
    dw Hitbox_Crocomire_5 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_0 
    dw Hitbox_Crocomire_C 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_4 
    dw Hitbox_Crocomire_F 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_A 
    dw Hitbox_Crocomire_10 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_7 
    dw Hitbox_Crocomire_F 

ExtendedSpritemap_Crocomire_9:
    dw $0007,$0001,$000B 
    dw Spritemap_Crocomire_2 
    dw Hitbox_Crocomire_2 
    dw $0000,$0026 
    dw Spritemap_Crocomire_A 
    dw Hitbox_Crocomire_5 
    dw $FFE3,$0026 
    dw Spritemap_Crocomire_10 
    dw Hitbox_Crocomire_5 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_1 
    dw Hitbox_Crocomire_D 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_4 
    dw Hitbox_Crocomire_F 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_A 
    dw Hitbox_Crocomire_10 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_7 
    dw Hitbox_Crocomire_F 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ExtendedSpritemap_Crocomire_A4C622:
    dw $0001,$0000,$0000 
    dw ExtendedTilemap_Crocomire_3 
    dw Hitbox_Crocomire_F 

UNUSED_ExtendedSpritemap_Crocomire_A4C62C:
    dw $0001,$0000,$0000 
    dw ExtendedTilemap_Crocomire_4 
    dw Hitbox_Crocomire_F 

UNUSED_ExtendedSpritemap_Crocomire_A4C636:
    dw $0001,$0000,$0000 
    dw ExtendedTilemap_Crocomire_5 
    dw Hitbox_Crocomire_F 

UNUSED_ExtendedSpritemap_Crocomire_A4C640:
    dw $0001,$0000,$0000 
    dw ExtendedTilemap_Crocomire_6 
    dw Hitbox_Crocomire_F 

UNUSED_ExtendedSpritemap_Crocomire_A4C64A:
    dw $0001,$0000,$0000 
    dw ExtendedTilemap_Crocomire_7 
    dw Hitbox_Crocomire_F 

UNUSED_ExtendedSpritemap_Crocomire_A4C654:
    dw $0001,$0000,$0000 
    dw ExtendedTilemap_Crocomire_8 
    dw Hitbox_Crocomire_F 
endif ; !FEATURE_KEEP_UNREFERENCED

ExtendedSpritemap_Crocomire_10:
    dw $0001,$FFE0,$FFE8 
    dw Spritemap_Crocomire_17 
    dw Hitbox_Crocomire_9 

ExtendedSpritemap_Crocomire_11:
    dw $0001,$FFE0,$FFE8 
    dw Spritemap_Crocomire_18 
    dw Hitbox_Crocomire_9 

ExtendedSpritemap_Crocomire_12:
    dw $0001,$FFE0,$FFE8 
    dw Spritemap_Crocomire_19 
    dw Hitbox_Crocomire_9 

ExtendedSpritemap_Crocomire_13:
    dw $0001,$FFE0,$FFE8 
    dw Spritemap_Crocomire_1A 
    dw Hitbox_Crocomire_9 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ExtendedSpritemap_Crocomire_A4C686:
    dw $0001,$0000,$0000 
    dw Spritemap_Crocomire_1B 
    dw Hitbox_Crocomire_A 

UNUSED_ExtendedSpritemap_Crocomire_A4C690:
    dw $0001,$0000,$0000 
    dw ExtendedTilemap_Crocomire_9 
    dw Hitbox_Crocomire_F 

UNUSED_ExtendedSpritemap_Crocomire_A4C69A:
    dw $0001,$0000,$0000 
    dw ExtendedTilemap_Crocomire_A 
    dw Hitbox_Crocomire_10 
endif ; !FEATURE_KEEP_UNREFERENCED

ExtendedSpritemap_Crocomire_14:
    dw $0007,$0003,$000B 
    dw Spritemap_Crocomire_3 
    dw Hitbox_Crocomire_3 
    dw $0000,$0026 
    dw Spritemap_Crocomire_B 
    dw Hitbox_Crocomire_5 
    dw $FFE3,$0026 
    dw Spritemap_Crocomire_5 
    dw Hitbox_Crocomire_5 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_2 
    dw Hitbox_Crocomire_E 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_3 
    dw Hitbox_Crocomire_F 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_A 
    dw Hitbox_Crocomire_10 
    dw $0000,$FFFF 
    dw ExtendedTilemap_Crocomire_6 
    dw Hitbox_Crocomire_F 

ExtendedSpritemap_Crocomire_15:
    dw $0007,$0001,$000B 
    dw Spritemap_Crocomire_4 
    dw Hitbox_Crocomire_4 
    dw $0000,$0026 
    dw Spritemap_Crocomire_C 
    dw Hitbox_Crocomire_5 
    dw $FFE3,$0026 
    dw Spritemap_Crocomire_6 
    dw Hitbox_Crocomire_5 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_4 
    dw Hitbox_Crocomire_F 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_0 
    dw Hitbox_Crocomire_C 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_A 
    dw Hitbox_Crocomire_10 
    dw $0000,$FFFE 
    dw ExtendedTilemap_Crocomire_7 
    dw Hitbox_Crocomire_F 

ExtendedSpritemap_Crocomire_16:
    dw $0007,$0000,$0008 
    dw Spritemap_Crocomire_1 
    dw Hitbox_Crocomire_1 
    dw $0000,$0026 
    dw Spritemap_Crocomire_D 
    dw Hitbox_Crocomire_5 
    dw $FFE3,$0026 
    dw Spritemap_Crocomire_7 
    dw Hitbox_Crocomire_5 
    dw $0000,$FFFF 
    dw ExtendedTilemap_Crocomire_5 
    dw Hitbox_Crocomire_F 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_1 
    dw Hitbox_Crocomire_D 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_A 
    dw Hitbox_Crocomire_10 
    dw $0000,$FFFE 
    dw ExtendedTilemap_Crocomire_8 
    dw Hitbox_Crocomire_F 

ExtendedSpritemap_Crocomire_17:
    dw $0007,$0001,$000B 
    dw Spritemap_Crocomire_0 
    dw Hitbox_Crocomire_0 
    dw $0000,$0026 
    dw Spritemap_Crocomire_E 
    dw Hitbox_Crocomire_5 
    dw $FFE3,$0026 
    dw Spritemap_Crocomire_8 
    dw Hitbox_Crocomire_5 
    dw $0000,$FFFF 
    dw ExtendedTilemap_Crocomire_4 
    dw Hitbox_Crocomire_F 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_1 
    dw Hitbox_Crocomire_D 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_A 
    dw Hitbox_Crocomire_10 
    dw $0000,$FFFE 
    dw ExtendedTilemap_Crocomire_7 
    dw Hitbox_Crocomire_F 

ExtendedSpritemap_Crocomire_18:
    dw $0007,$0001,$000A 
    dw Spritemap_Crocomire_0 
    dw Hitbox_Crocomire_0 
    dw $0000,$0026 
    dw Spritemap_Crocomire_F 
    dw Hitbox_Crocomire_5 
    dw $FFE3,$0026 
    dw Spritemap_Crocomire_9 
    dw Hitbox_Crocomire_5 
    dw $0000,$FFFF 
    dw ExtendedTilemap_Crocomire_3 
    dw Hitbox_Crocomire_F 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_1 
    dw Hitbox_Crocomire_D 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_A 
    dw Hitbox_Crocomire_10 
    dw $0000,$FFFE 
    dw ExtendedTilemap_Crocomire_6 
    dw Hitbox_Crocomire_F 

ExtendedSpritemap_Crocomire_19:
    dw $0007,$0001,$000A 
    dw Spritemap_Crocomire_2 
    dw Hitbox_Crocomire_2 
    dw $0000,$0026 
    dw Spritemap_Crocomire_10 
    dw Hitbox_Crocomire_5 
    dw $FFE3,$0026 
    dw Spritemap_Crocomire_A 
    dw Hitbox_Crocomire_5 
    dw $0000,$FFFF 
    dw ExtendedTilemap_Crocomire_4 
    dw Hitbox_Crocomire_F 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_1 
    dw Hitbox_Crocomire_D 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_A 
    dw Hitbox_Crocomire_10 
    dw $0000,$FFFE 
    dw ExtendedTilemap_Crocomire_7 
    dw Hitbox_Crocomire_F 

ExtendedSpritemap_Crocomire_1A:
    dw $0007,$0001,$000A 
    dw Spritemap_Crocomire_3 
    dw Hitbox_Crocomire_3 
    dw $0000,$0026 
    dw Spritemap_Crocomire_5 
    dw Hitbox_Crocomire_5 
    dw $FFE3,$0026 
    dw Spritemap_Crocomire_B 
    dw Hitbox_Crocomire_5 
    dw $0000,$FFFF 
    dw ExtendedTilemap_Crocomire_5 
    dw Hitbox_Crocomire_F 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_1 
    dw Hitbox_Crocomire_D 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_A 
    dw Hitbox_Crocomire_10 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_8 
    dw Hitbox_Crocomire_F 

ExtendedSpritemap_Crocomire_1B:
    dw $0007,$0001,$000A 
    dw Spritemap_Crocomire_4 
    dw Hitbox_Crocomire_4 
    dw $0000,$0026 
    dw Spritemap_Crocomire_6 
    dw Hitbox_Crocomire_5 
    dw $FFE3,$0026 
    dw Spritemap_Crocomire_C 
    dw Hitbox_Crocomire_5 
    dw $0000,$FFFF 
    dw ExtendedTilemap_Crocomire_4 
    dw Hitbox_Crocomire_F 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_1 
    dw Hitbox_Crocomire_D 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_A 
    dw Hitbox_Crocomire_10 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_7 
    dw Hitbox_Crocomire_F 

ExtendedSpritemap_Crocomire_1C:
    dw $0007,$0001,$000A 
    dw Spritemap_Crocomire_1 
    dw Hitbox_Crocomire_1 
    dw $0000,$0026 
    dw Spritemap_Crocomire_7 
    dw Hitbox_Crocomire_5 
    dw $FFE3,$0026 
    dw Spritemap_Crocomire_D 
    dw Hitbox_Crocomire_5 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_3 
    dw Hitbox_Crocomire_F 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_1 
    dw Hitbox_Crocomire_D 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_A 
    dw Hitbox_Crocomire_10 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_6 
    dw Hitbox_Crocomire_F 

ExtendedSpritemap_Crocomire_1D:
    dw $0007,$0001,$000C 
    dw Spritemap_Crocomire_0 
    dw Hitbox_Crocomire_0 
    dw $0000,$0026 
    dw Spritemap_Crocomire_8 
    dw Hitbox_Crocomire_5 
    dw $FFE3,$0026 
    dw Spritemap_Crocomire_E 
    dw Hitbox_Crocomire_5 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_4 
    dw Hitbox_Crocomire_F 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_1 
    dw Hitbox_Crocomire_D 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_A 
    dw Hitbox_Crocomire_10 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_7 
    dw Hitbox_Crocomire_F 

ExtendedSpritemap_Crocomire_1E:
    dw $0007,$0001,$000D 
    dw Spritemap_Crocomire_0 
    dw Hitbox_Crocomire_0 
    dw $0000,$0026 
    dw Spritemap_Crocomire_9 
    dw Hitbox_Crocomire_5 
    dw $FFE3,$0026 
    dw Spritemap_Crocomire_F 
    dw Hitbox_Crocomire_5 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_5 
    dw Hitbox_Crocomire_F 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_0 
    dw Hitbox_Crocomire_C 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_A 
    dw Hitbox_Crocomire_10 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_8 
    dw Hitbox_Crocomire_F 

ExtendedSpritemap_Crocomire_1F:
    dw $0007,$0001,$000B 
    dw Spritemap_Crocomire_2 
    dw Hitbox_Crocomire_2 
    dw $0000,$0026 
    dw Spritemap_Crocomire_A 
    dw Hitbox_Crocomire_5 
    dw $FFE3,$0026 
    dw Spritemap_Crocomire_10 
    dw Hitbox_Crocomire_5 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_5 
    dw Hitbox_Crocomire_F 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_2 
    dw Hitbox_Crocomire_E 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_A 
    dw Hitbox_Crocomire_10 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_8 
    dw Hitbox_Crocomire_F 

ExtendedSpritemap_Crocomire_20:
    dw $0007,$0001,$000B 
    dw Spritemap_Crocomire_15 
    dw Hitbox_Crocomire_7 
    dw $0000,$0026 
    dw Spritemap_Crocomire_A 
    dw Hitbox_Crocomire_5 
    dw $FFE3,$0026 
    dw Spritemap_Crocomire_10 
    dw Hitbox_Crocomire_5 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_1 
    dw Hitbox_Crocomire_D 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_4 
    dw Hitbox_Crocomire_F 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_A 
    dw Hitbox_Crocomire_10 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_7 
    dw Hitbox_Crocomire_F 

ExtendedSpritemap_Crocomire_21:
    dw $0007,$0000,$0006 
    dw Spritemap_Crocomire_16 
    dw Hitbox_Crocomire_8 
    dw $0000,$0026 
    dw Spritemap_Crocomire_A 
    dw Hitbox_Crocomire_5 
    dw $FFE3,$0026 
    dw Spritemap_Crocomire_10 
    dw Hitbox_Crocomire_5 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_1 
    dw Hitbox_Crocomire_D 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_4 
    dw Hitbox_Crocomire_F 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_A 
    dw Hitbox_Crocomire_10 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_7 
    dw Hitbox_Crocomire_F 

ExtendedSpritemap_Crocomire_22:
    dw $0007,$0001,$0004 
    dw Spritemap_Crocomire_14 
    dw Hitbox_Crocomire_6 
    dw $0000,$0026 
    dw Spritemap_Crocomire_A 
    dw Hitbox_Crocomire_5 
    dw $FFE3,$0026 
    dw Spritemap_Crocomire_10 
    dw Hitbox_Crocomire_5 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_1 
    dw Hitbox_Crocomire_D 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_4 
    dw Hitbox_Crocomire_F 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_A 
    dw Hitbox_Crocomire_10 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_7 
    dw Hitbox_Crocomire_F 

ExtendedSpritemap_Crocomire_23:
    dw $0007,$0000,$0008 
    dw Spritemap_Crocomire_1 
    dw Hitbox_Crocomire_1 
    dw $0000,$0026 
    dw Spritemap_Crocomire_A 
    dw Hitbox_Crocomire_5 
    dw $FFE3,$0026 
    dw Spritemap_Crocomire_10 
    dw Hitbox_Crocomire_5 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_1 
    dw Hitbox_Crocomire_D 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_4 
    dw Hitbox_Crocomire_F 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_A 
    dw Hitbox_Crocomire_10 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_7 
    dw Hitbox_Crocomire_F 

ExtendedSpritemap_Crocomire_24:
    dw $0007,$0001,$000B 
    dw Spritemap_Crocomire_0 
    dw Hitbox_Crocomire_0 
    dw $0000,$0026 
    dw Spritemap_Crocomire_A 
    dw Hitbox_Crocomire_5 
    dw $FFE3,$0026 
    dw Spritemap_Crocomire_10 
    dw Hitbox_Crocomire_5 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_1 
    dw Hitbox_Crocomire_D 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_4 
    dw Hitbox_Crocomire_F 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_A 
    dw Hitbox_Crocomire_10 
    dw $0000,$0000 
    dw ExtendedTilemap_Crocomire_7 
    dw Hitbox_Crocomire_F 

ExtendedSpritemap_Crocomire_25:
    dw $0001,$0000,$0000 
    dw Spritemap_Crocomire_22 
    dw Hitbox_Crocomire_1 

ExtendedSpritemap_Crocomire_26:
    dw $0001,$0000,$0000 
    dw Spritemap_Crocomire_23 
    dw Hitbox_Crocomire_1 

ExtendedSpritemap_Crocomire_27:
    dw $0001,$0000,$0000 
    dw Spritemap_Crocomire_24 
    dw Hitbox_Crocomire_1 

ExtendedSpritemap_Crocomire_28:
    dw $0001,$0000,$0000 
    dw Spritemap_Crocomire_25 
    dw Hitbox_Crocomire_1 

ExtendedSpritemap_Crocomire_29:
    dw $0001,$0000,$0000 
    dw Spritemap_Crocomire_26 
    dw Hitbox_Crocomire_1 

ExtendedSpritemap_Crocomire_2A:
    dw $0001,$0000,$0000 
    dw Spritemap_Crocomire_27 
    dw Hitbox_Crocomire_1 

ExtendedSpritemap_Crocomire_2B:
    dw $0001,$0000,$0000 
    dw Spritemap_Crocomire_28 
    dw Hitbox_Crocomire_1 

ExtendedSpritemap_Crocomire_2C:
    dw $0001,$0000,$0000 
    dw Spritemap_Crocomire_29 
    dw Hitbox_Crocomire_1 

ExtendedSpritemap_Crocomire_2D:
    dw $0001,$0001,$000B 
    dw Spritemap_Crocomire_15 
    dw Hitbox_Crocomire_11 

ExtendedSpritemap_Crocomire_2E:
    dw $0001,$0000,$0008 
    dw Spritemap_Crocomire_16 
    dw Hitbox_Crocomire_11 

ExtendedSpritemap_Crocomire_2F:
    dw $0001,$0001,$0008 
    dw Spritemap_Crocomire_14 
    dw Hitbox_Crocomire_11 

ExtendedSpritemap_Crocomire_30:
    dw $0001,$0000,$000A 
    dw Spritemap_Crocomire_1 
    dw Hitbox_Crocomire_11 

ExtendedSpritemap_Crocomire_31:
    dw $0001,$0001,$000C 
    dw Spritemap_Crocomire_0 
    dw Hitbox_Crocomire_11 

RTL_A4CB00:
    RTL 


LoadEnemyIndexAndRTL:
    LDX.W $0E54 
    RTL 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Hitbox_Crocomire_A4CB05:
    dw $0000 
endif ; !FEATURE_KEEP_UNREFERENCED

Hitbox_Crocomire_0:
    dw $0001,$FFB2,$0020,$FFF0,$002B 
    dw EnemyTouch_Crocomire_Claws 
    dw EnemyShot_Crocomire_SpawnShotExplosion_duplicate 

Hitbox_Crocomire_1:
    dw $0001,$FFA1,$000B,$FFF0,$000B 
    dw EnemyTouch_Crocomire_Claws 
    dw EnemyShot_Crocomire_SpawnShotExplosion_duplicate 

Hitbox_Crocomire_2:
    dw $0001,$FFBB,$001F,$FFF0,$002C 
    dw EnemyTouch_Crocomire_Claws 
    dw EnemyShot_Crocomire_SpawnShotExplosion_duplicate 

Hitbox_Crocomire_3:
    dw $0001,$FFC4,$0012,$FFF0,$0020 
    dw EnemyTouch_Crocomire_Claws 
    dw EnemyShot_Crocomire_SpawnShotExplosion_duplicate 

Hitbox_Crocomire_4:
    dw $0001,$FFB0,$000D,$FFF0,$001B 
    dw EnemyTouch_Crocomire_Claws 
    dw EnemyShot_Crocomire_SpawnShotExplosion_duplicate 

Hitbox_Crocomire_5:
    dw $0000 

Hitbox_Crocomire_6:
    dw $0001,$FFA1,$FFFA,$FFF0,$001B 
    dw EnemyTouch_Crocomire_Claws 
    dw EnemyShot_Crocomire_Nothing 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Hitbox_Crocomire_A4CB5D:
    dw $0000 
endif ; !FEATURE_KEEP_UNREFERENCED

Hitbox_Crocomire_7:
    dw $0001,$FFC5,$FFF7,$FFF0,$0005 
    dw EnemyTouch_Crocomire_Claws 
    dw EnemyShot_Crocomire_Nothing 

Hitbox_Crocomire_8:
    dw $0001,$FFA3,$FFDC,$FFE2,$FFF3 
    dw EnemyTouch_Crocomire_Claws 
    dw EnemyShot_Crocomire_Nothing 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Hitbox_Crocomire_A4CB7B:
    dw $0001,$FFFB,$FFFB,$0004,$0004 
    dw EnemyTouch_Crocomire_Claws 
    dw EnemyShot_Crocomire_Nothing 

UNUSED_Hitbox_Crocomire_A4CB89:
    dw $0001,$FFFA,$FFF9,$0005,$0006 
    dw EnemyTouch_Crocomire_Claws 
    dw EnemyShot_Crocomire_Nothing 

UNUSED_Hitbox_Crocomire_A4CB97:
    dw $0001,$FFF8,$FFF8,$0007,$0007 
    dw EnemyTouch_Crocomire_Claws 
    dw EnemyShot_Crocomire_Nothing 

UNUSED_Hitbox_Crocomire_A4CBA5:
    dw $0001,$FFF7,$FFF8,$0008,$0007 
    dw EnemyTouch_Crocomire_Claws 
    dw EnemyShot_Crocomire_Nothing 
endif ; !FEATURE_KEEP_UNREFERENCED

Hitbox_Crocomire_9:
    dw $0000 

Hitbox_Crocomire_A:
    dw $0001,$FFF7,$FFF7,$0008,$0007 
    dw EnemyTouch_Crocomire_Claws 
    dw EnemyShot_Crocomire_Nothing 

Hitbox_Crocomire_B:
    dw $0000 

Hitbox_Crocomire_C:
    dw $0003,$FFCE,$FFDB,$0028,$FFF0 
    dw CommonA4_NormalEnemyTouchAI 
    dw EnemyShot_Crocomire_OpenMouth 
    dw $FFCC,$FFC6,$002A,$FFDA 
    dw CommonA4_NormalEnemyTouchAI 
    dw CommonA4_NormalEnemyShotAI 
    dw $FFE0,$FFF3,$0028,$0000 
    dw CommonA4_NormalEnemyTouchAI 
    dw CommonA4_NormalEnemyShotAI 

Hitbox_Crocomire_D:
    dw $0003,$FFD2,$FFCB,$000D,$FFF0 
    dw CommonA4_NormalEnemyTouchAI 
    dw EnemyShot_Crocomire_OpenMouth 
    dw $FFD7,$FFB6,$0010,$FFC7 
    dw CommonA4_NormalEnemyTouchAI 
    dw CommonA4_NormalEnemyShotAI 
    dw $FFDB,$FFF0,$0010,$FFFD 
    dw CommonA4_NormalEnemyTouchAI 
    dw CommonA4_NormalEnemyShotAI 

Hitbox_Crocomire_E:
    dw $0001,$FFDB,$FFCE,$0026,$FFFC 
    dw EnemyTouch_Crocomire_Claws 
    dw CommonA4_NormalEnemyShotAI 

Hitbox_Crocomire_F:
    dw $0001,$FFDA,$FFD0,$0025,$0034 
    dw EnemyTouch_Crocomire_Claws 
    dw EnemyShot_Crocomire_SpawnShotExplosion 

Hitbox_Crocomire_10:
    dw $0001,$FFDA,$FFFC,$002A,$0034 
    dw EnemyTouch_Crocomire_Claws 
    dw EnemyShot_Crocomire_Nothing 

Hitbox_Crocomire_11:
    dw $0000 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Crocomire_A4CC3D:
    dw $0011,$01E4 
    db $18 
    dw $31A6,$01F4 
    db $18 
    dw $31BF,$01EC 
    db $18 
    dw $31AF,$801C 
    db $10 
    dw $31CA,$800C 
    db $10 
    dw $31C8,$81FC 
    db $10 
    dw $31C6,$801C 
    db $00 
    dw $31C4,$800C 
    db $00 
    dw $31C2,$81FC 
    db $00 
    dw $31C0,$000C 
    db $E8 
    dw $31B6,$801C 
    db $F0 
    dw $31AD,$800C 
    db $F0 
    dw $31AB,$81FC 
    db $F0 
    dw $31A9,$81EC 
    db $F0 
    dw $31A7,$81FC 
    db $E0 
    dw $31A4,$81EC 
    db $E0 
    dw $31A2,$81DC 
    db $E0 
    dw $31A0 

UNUSED_Spritemap_Crocomire_A4CC94:
    dw $0011,$0014 
    db $18 
    dw $71A6,$0004 
    db $18 
    dw $71BF,$000C 
    db $18 
    dw $71AF,$81D4 
    db $10 
    dw $71CA,$81E4 
    db $10 
    dw $71C8,$81F4 
    db $10 
    dw $71C6,$81D4 
    db $00 
    dw $71C4,$81E4 
    db $00 
    dw $71C2,$81F4 
    db $00 
    dw $71C0,$01EC 
    db $E8 
    dw $71B6,$81D4 
    db $F0 
    dw $71AD,$81E4 
    db $F0 
    dw $71AB,$81F4 
    db $F0 
    dw $71A9,$8004 
    db $F0 
    dw $71A7,$81F4 
    db $E0 
    dw $71A4,$8004 
    db $E0 
    dw $71A2,$8014 
    db $E0 
    dw $71A0 

UNUSED_Spritemap_Crocomire_A4CCEB:
    dw $000A,$0018 
    db $0C 
    dw $316B,$0010 
    db $0C 
    dw $316A,$8010 
    db $FC 
    dw $3168,$8010 
    db $EC 
    dw $3166,$8000 
    db $00 
    dw $3164,$81F0 
    db $00 
    dw $3162,$8000 
    db $F0 
    dw $3164,$81F0 
    db $F0 
    dw $3162,$81E0 
    db $FC 
    dw $3180,$81E0 
    db $EC 
    dw $3160 

UNUSED_Spritemap_Crocomire_A4CD1F:
    dw $000A,$01E0 
    db $0C 
    dw $716B,$01E8 
    db $0C 
    dw $716A,$81E0 
    db $FC 
    dw $7168,$81E0 
    db $EC 
    dw $7166,$81F0 
    db $00 
    dw $7164,$8000 
    db $00 
    dw $7162,$81F0 
    db $F0 
    dw $7164,$8000 
    db $F0 
    dw $7162,$8010 
    db $FC 
    dw $7180,$8010 
    db $EC 
    dw $7160 

UNUSED_Spritemap_Crocomire_A4CD53:
    dw $000F,$8020 
    db $10 
    dw $318E,$8000 
    db $10 
    dw $318A,$8010 
    db $10 
    dw $318C,$01F8 
    db $18 
    dw $317B,$01F0 
    db $10 
    dw $310F,$01F8 
    db $10 
    dw $311F,$01E7 
    db $18 
    dw $717A,$01E0 
    db $18 
    dw $317A,$01D0 
    db $10 
    dw $3188,$01D8 
    db $10 
    dw $3189,$01E0 
    db $10 
    dw $3198,$01E8 
    db $10 
    dw $3199,$81F0 
    db $00 
    dw $3186,$81E0 
    db $00 
    dw $3184,$81D0 
    db $00 
    dw $3182 

UNUSED_Spritemap_Crocomire_A4CDA0:
    dw $000F,$81D0 
    db $10 
    dw $718E,$81F0 
    db $10 
    dw $718A,$81E0 
    db $10 
    dw $718C,$0000 
    db $18 
    dw $717B,$0008 
    db $10 
    dw $710F,$0000 
    db $10 
    dw $711F,$0011 
    db $18 
    dw $317A,$0018 
    db $18 
    dw $717A,$0028 
    db $10 
    dw $7188,$0020 
    db $10 
    dw $7189,$0018 
    db $10 
    dw $7198,$0010 
    db $10 
    dw $7199,$8000 
    db $00 
    dw $7186,$8010 
    db $00 
    dw $7184,$8020 
    db $00 
    dw $7182 

UNUSED_Spritemap_Crocomire_A4CDED:
    dw $0002,$8000 
    db $F8 
    dw $316E,$81F0 
    db $F8 
    dw $316C 

UNUSED_Spritemap_Crocomire_A4CDF9:
    dw $0002,$81F0 
    db $F8 
    dw $716E,$8000 
    db $F8 
    dw $716C 

UNUSED_Spritemap_Crocomire_A4CE05:
    dw $0001,$81F8 
    db $F8 
    dw $7160 

UNUSED_Spritemap_Crocomire_A4CE0C:
    dw $0001,$81F8 
    db $F8 
    dw $7180 

UNUSED_Spritemap_Crocomire_A4CE13:
    dw $0001,$81F8 
    db $F8 
    dw $7162 

UNUSED_Spritemap_Crocomire_A4CE1A:
    dw $0001,$81F8 
    db $F8 
    dw $7164 

UNUSED_Spritemap_Crocomire_A4CE21:
    dw $0001,$81F8 
    db $F8 
    dw $7166 

UNUSED_Spritemap_Crocomire_A4CE28:
    dw $0001,$81F8 
    db $F8 
    dw $7168 

UNUSED_Spritemap_Crocomire_A4CE2F:
    dw $0002,$01F8 
    db $FC 
    dw $716B,$0000 
    db $FC 
    dw $716A 

UNUSED_Spritemap_Crocomire_A4CE3B:
    dw $0003,$0000 
    db $04 
    dw $7188,$01F8 
    db $04 
    dw $7189,$81F8 
    db $F4 
    dw $7182 

UNUSED_Spritemap_Crocomire_A4CE4C:
    dw $0005,$01F9 
    db $08 
    dw $317A,$0000 
    db $08 
    dw $717A,$0000 
    db $00 
    dw $7198,$01F8 
    db $00 
    dw $7199,$81F8 
    db $F0 
    dw $7184 

UNUSED_Spritemap_Crocomire_A4CE67:
    dw $0004,$0000 
    db $05 
    dw $710F,$01F8 
    db $0D 
    dw $717B,$01F8 
    db $05 
    dw $711F,$81F8 
    db $F5 
    dw $7186 

UNUSED_Spritemap_Crocomire_A4CE7D:
    dw $0001,$81F8 
    db $F8 
    dw $718A 

UNUSED_Spritemap_Crocomire_A4CE84:
    dw $0001,$81F8 
    db $F8 
    dw $718C 

UNUSED_Spritemap_Crocomire_A4CE8B:
    dw $0001,$81F8 
    db $F8 
    dw $718E 
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_Crocomire_0:
    dw $0009,$81C3 
    db $1A 
    dw $30E4,$81B3 
    db $1E 
    dw $3100,$0000 
    db $07 
    dw $3108,$01F0 
    db $FF 
    dw $30F6,$81F0 
    db $07 
    dw $3106,$81F8 
    db $F7 
    dw $30E7,$81EC 
    db $0B 
    dw $30E0,$81DE 
    db $12 
    dw $30E0,$81D0 
    db $19 
    dw $30E0 

Spritemap_Crocomire_1:
    dw $0009,$81B1 
    db $13 
    dw $30E4,$81A1 
    db $13 
    dw $3100,$01F8 
    db $09 
    dw $30FF,$01F0 
    db $F9 
    dw $30EF,$81E8 
    db $01 
    dw $30ED,$81F8 
    db $F9 
    dw $310D,$81DE 
    db $05 
    dw $3102,$81CE 
    db $0F 
    dw $3104,$81C0 
    db $0F 
    dw $3102 

Spritemap_Crocomire_2:
    dw $0007,$81CC 
    db $1C 
    dw $30E4,$81BC 
    db $1E 
    dw $3100,$81F8 
    db $08 
    dw $3109,$81F8 
    db $F8 
    dw $30E9,$81F6 
    db $0D 
    dw $30E0,$81E8 
    db $14 
    dw $30E0,$81DA 
    db $1B 
    dw $30E0 

Spritemap_Crocomire_3:
    dw $0009,$0000 
    db $08 
    dw $70FF,$0008 
    db $F8 
    dw $70EF,$8008 
    db $00 
    dw $70ED,$81F8 
    db $F8 
    dw $710D,$81D5 
    db $11 
    dw $30E4,$81C5 
    db $11 
    dw $3100,$8002 
    db $03 
    dw $3102,$81F2 
    db $0D 
    dw $3104,$81E4 
    db $0D 
    dw $3102 

Spritemap_Crocomire_4:
    dw $0007,$81C0 
    db $0C 
    dw $30E4,$81B0 
    db $0C 
    dw $3100,$81F8 
    db $08 
    dw $3109,$81F8 
    db $F8 
    dw $30E9,$81F0 
    db $0C 
    dw $30E2,$81E0 
    db $0C 
    dw $30E2,$81D0 
    db $0C 
    dw $30E2 

Spritemap_Crocomire_5:
    dw $0008,$0002 
    db $09 
    dw $30DF,$01FA 
    db $09 
    dw $30DE,$01F2 
    db $09 
    dw $30DD,$01EA 
    db $09 
    dw $30DC,$01E2 
    db $09 
    dw $30DB,$81F2 
    db $F9 
    dw $312D,$81F6 
    db $F9 
    dw $314B,$8001 
    db $F9 
    dw $312B 

Spritemap_Crocomire_6:
    dw $0008,$0005 
    db $09 
    dw $30DF,$01FD 
    db $09 
    dw $30DE,$01F5 
    db $09 
    dw $30DD,$01ED 
    db $09 
    dw $30DC,$01E5 
    db $09 
    dw $30DB,$81F5 
    db $F9 
    dw $312D,$81F7 
    db $F9 
    dw $314B,$8001 
    db $F9 
    dw $312B 

Spritemap_Crocomire_7:
    dw $0008,$0008 
    db $09 
    dw $30DF,$0000 
    db $09 
    dw $30DE,$01F8 
    db $09 
    dw $30DD,$01F0 
    db $09 
    dw $30DC,$01E8 
    db $09 
    dw $30DB,$81F8 
    db $F9 
    dw $312D,$81F9 
    db $F9 
    dw $314B,$8000 
    db $F9 
    dw $312B 

Spritemap_Crocomire_8:
    dw $0008,$000C 
    db $09 
    dw $30DF,$0004 
    db $09 
    dw $30DE,$01FC 
    db $09 
    dw $30DD,$01F4 
    db $09 
    dw $30DC,$01EC 
    db $09 
    dw $30DB,$81FC 
    db $F9 
    dw $312D,$81FC 
    db $F9 
    dw $314B,$8000 
    db $F9 
    dw $312B 

Spritemap_Crocomire_9:
    dw $0008,$8003 
    db $F9 
    dw $312D,$8002 
    db $F9 
    dw $714B,$0011 
    db $09 
    dw $30DF,$0009 
    db $09 
    dw $30DE,$0001 
    db $09 
    dw $30DD,$01F9 
    db $09 
    dw $30DC,$01F1 
    db $09 
    dw $30DB,$8001 
    db $F9 
    dw $712B 

Spritemap_Crocomire_A:
    dw $0008,$8009 
    db $F9 
    dw $312D,$8006 
    db $F9 
    dw $714B,$0018 
    db $09 
    dw $30DF,$0010 
    db $09 
    dw $30DE,$0008 
    db $09 
    dw $30DD,$0000 
    db $09 
    dw $30DC,$01F8 
    db $09 
    dw $30DB,$8001 
    db $F9 
    dw $712B 

Spritemap_Crocomire_B:
    dw $0008,$8010 
    db $F9 
    dw $312D,$800B 
    db $F9 
    dw $714B,$0020 
    db $09 
    dw $30DF,$0018 
    db $09 
    dw $30DE,$0010 
    db $09 
    dw $30DD,$0008 
    db $09 
    dw $30DC,$0000 
    db $09 
    dw $30DB,$8003 
    db $F9 
    dw $712B 

Spritemap_Crocomire_C:
    dw $0008,$8009 
    db $F8 
    dw $312D,$8006 
    db $F8 
    dw $714B,$0018 
    db $09 
    dw $30DF,$0010 
    db $08 
    dw $30DE,$0008 
    db $08 
    dw $30DD,$0000 
    db $09 
    dw $30DC,$01F8 
    db $09 
    dw $30DB,$8001 
    db $F9 
    dw $712B 

Spritemap_Crocomire_D:
    dw $0008,$8003 
    db $F5 
    dw $312D,$8002 
    db $F5 
    dw $714B,$0011 
    db $06 
    dw $30DF,$0009 
    db $05 
    dw $30DE,$0001 
    db $05 
    dw $30DD,$01F9 
    db $07 
    dw $30DC,$01F1 
    db $07 
    dw $30DB,$8001 
    db $F9 
    dw $712B 

Spritemap_Crocomire_E:
    dw $0008,$000C 
    db $06 
    dw $30DF,$0004 
    db $05 
    dw $30DE,$01FC 
    db $05 
    dw $30DD,$01F4 
    db $07 
    dw $30DC,$01EC 
    db $07 
    dw $30DB,$81FC 
    db $F5 
    dw $312D,$81FC 
    db $F5 
    dw $314B,$8000 
    db $F9 
    dw $312B 

Spritemap_Crocomire_F:
    dw $0008,$0008 
    db $06 
    dw $30DF,$0000 
    db $05 
    dw $30DE,$01F8 
    db $05 
    dw $30DD,$01F0 
    db $07 
    dw $30DC,$01E8 
    db $07 
    dw $30DB,$81F8 
    db $F5 
    dw $312D,$81F9 
    db $F5 
    dw $314B,$8000 
    db $F9 
    dw $312B 

Spritemap_Crocomire_10:
    dw $0008,$0005 
    db $07 
    dw $30DF,$01FD 
    db $06 
    dw $30DE,$01F5 
    db $06 
    dw $30DD,$01ED 
    db $08 
    dw $30DC,$01E5 
    db $08 
    dw $30DB,$81F5 
    db $F6 
    dw $312D,$81F7 
    db $F6 
    dw $314B,$8001 
    db $F9 
    dw $312B 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Crocomire_A4D161:
    dw $0008,$0002 
    db $08 
    dw $30DF,$01FA 
    db $07 
    dw $30DE,$01F2 
    db $07 
    dw $30DD,$01EA 
    db $08 
    dw $30DC,$01E2 
    db $08 
    dw $30DB,$81F2 
    db $F7 
    dw $312D,$81F6 
    db $F7 
    dw $314B,$8001 
    db $F9 
    dw $312B 
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_Crocomire_11:
    dw $0008,$000C 
    db $04 
    dw $30DF,$0004 
    db $05 
    dw $30DE,$01FC 
    db $05 
    dw $30DD,$01F4 
    db $05 
    dw $30DC,$01EC 
    db $05 
    dw $30DB,$81FC 
    db $F5 
    dw $312D,$81FC 
    db $F5 
    dw $314B,$8000 
    db $F9 
    dw $312B 

Spritemap_Crocomire_12:
    dw $0008,$000C 
    db $04 
    dw $30DF,$0004 
    db $05 
    dw $30DE,$01FC 
    db $05 
    dw $30DD,$01F4 
    db $05 
    dw $30DC,$01EC 
    db $05 
    dw $30DB,$81FC 
    db $F5 
    dw $312D,$81FC 
    db $F3 
    dw $314B,$8000 
    db $F5 
    dw $312B 

Spritemap_Crocomire_13:
    dw $0008,$000C 
    db $04 
    dw $30DF,$0004 
    db $05 
    dw $30DE,$01FC 
    db $05 
    dw $30DD,$01F4 
    db $05 
    dw $30DC,$01EC 
    db $05 
    dw $30DB,$81FC 
    db $F5 
    dw $312D,$81FC 
    db $F1 
    dw $314B,$8000 
    db $F1 
    dw $312B 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Crocomire_A4D209:
    dw $0009,$802D 
    db $1A 
    dw $70E4,$803D 
    db $1E 
    dw $7100,$01F8 
    db $07 
    dw $7108,$0008 
    db $FF 
    dw $70F6,$8000 
    db $07 
    dw $7106,$81F8 
    db $F7 
    dw $70E7,$8004 
    db $0B 
    dw $70E0,$8012 
    db $12 
    dw $70E0,$8020 
    db $19 
    dw $70E0 

UNUSED_Spritemap_Crocomire_A4D238:
    dw $0009,$803F 
    db $13 
    dw $70E4,$804F 
    db $13 
    dw $7100,$0000 
    db $09 
    dw $70FF,$0008 
    db $F9 
    dw $70EF,$8008 
    db $01 
    dw $70ED,$81F8 
    db $F9 
    dw $710D,$8012 
    db $05 
    dw $7102,$8022 
    db $0F 
    dw $7104,$8030 
    db $0F 
    dw $7102 

UNUSED_Spritemap_Crocomire_A4D267:
    dw $0007,$8024 
    db $1C 
    dw $70E4,$8034 
    db $1E 
    dw $7100,$81F8 
    db $08 
    dw $7109,$81F8 
    db $F8 
    dw $70E9,$81FA 
    db $0D 
    dw $70E0,$8008 
    db $14 
    dw $70E0,$8016 
    db $1B 
    dw $70E0 

UNUSED_Spritemap_Crocomire_A4D28C:
    dw $0009,$01F8 
    db $08 
    dw $30FF,$01F0 
    db $F8 
    dw $30EF,$81E8 
    db $00 
    dw $30ED,$81F8 
    db $F8 
    dw $310D,$801B 
    db $11 
    dw $70E4,$802B 
    db $11 
    dw $7100,$81EE 
    db $03 
    dw $7102,$81FE 
    db $0D 
    dw $7104,$800C 
    db $0D 
    dw $7102 
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_Crocomire_14:
    dw $0007,$81E6 
    db $FA 
    dw $30EB,$81F6 
    db $FA 
    dw $310B,$81AD 
    db $FA 
    dw $30E4,$819D 
    db $FA 
    dw $3100,$81DD 
    db $FA 
    dw $30E2,$81CD 
    db $FA 
    dw $30E2,$81BD 
    db $FA 
    dw $30E2 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Crocomire_A4D2E0:
    dw $0009,$0000 
    db $F0 
    dw $F0FF,$0008 
    db $00 
    dw $F0EF,$8008 
    db $F0 
    dw $F0ED,$81F8 
    db $F8 
    dw $F10D,$803D 
    db $DB 
    dw $70E4,$804D 
    db $DB 
    dw $7100,$8010 
    db $EC 
    dw $F102,$8020 
    db $E2 
    dw $F104,$802E 
    db $E2 
    dw $F102 

UNUSED_Spritemap_Crocomire_A4D30F:
    dw $0007,$800A 
    db $FA 
    dw $70EB,$81FA 
    db $FA 
    dw $710B,$8043 
    db $FA 
    dw $70E4,$8053 
    db $FA 
    dw $7100,$8013 
    db $FA 
    dw $70E2,$8023 
    db $FA 
    dw $70E2,$8033 
    db $FA 
    dw $70E2 

UNUSED_Spritemap_Crocomire_A4D334:
    dw $0009,$01F8 
    db $08 
    dw $30FF,$01F0 
    db $F8 
    dw $30EF,$81E8 
    db $00 
    dw $30ED,$81F8 
    db $F8 
    dw $310D,$801B 
    db $F6 
    dw $70E4,$802B 
    db $F6 
    dw $7100,$81EE 
    db $07 
    dw $F102,$81FE 
    db $FD 
    dw $F104,$800C 
    db $FD 
    dw $F102 

UNUSED_Spritemap_Crocomire_A4D363:
    dw $0007,$81F8 
    db $08 
    dw $7109,$81F8 
    db $F8 
    dw $70E9,$802A 
    db $FA 
    dw $70E4,$803A 
    db $FA 
    dw $7100,$81FD 
    db $0B 
    dw $F102,$800D 
    db $01 
    dw $F104,$801B 
    db $01 
    dw $F102 
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_Crocomire_15:
    dw $0009,$0000 
    db $08 
    dw $70FF,$0008 
    db $F8 
    dw $70EF,$8008 
    db $00 
    dw $70ED,$81F8 
    db $F8 
    dw $710D,$81D5 
    db $F6 
    dw $30E4,$81C5 
    db $F6 
    dw $3100,$8002 
    db $07 
    dw $B102,$81F2 
    db $FD 
    dw $B104,$81E4 
    db $FD 
    dw $B102 

Spritemap_Crocomire_16:
    dw $0009,$01F8 
    db $F0 
    dw $B0FF,$01F0 
    db $00 
    dw $B0EF,$81E8 
    db $F0 
    dw $B0ED,$81F8 
    db $F8 
    dw $B10D,$81B3 
    db $DB 
    dw $30E4,$81A3 
    db $DB 
    dw $3100,$81E0 
    db $EC 
    dw $B102,$81D0 
    db $E2 
    dw $B104,$81C2 
    db $E2 
    dw $B102 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Crocomire_A4D3E6:
    dw $0004,$0000 
    db $F8 
    dw $70D0,$0000 
    db $00 
    dw $F0D0,$01F8 
    db $00 
    dw $B0D0,$01F8 
    db $F8 
    dw $30D0 

UNUSED_Spritemap_Crocomire_A4D3FC:
    dw $0004,$0000 
    db $F8 
    dw $70D1,$0000 
    db $00 
    dw $F0D1,$01F8 
    db $00 
    dw $B0D1,$01F8 
    db $F8 
    dw $30D1 

UNUSED_Spritemap_Crocomire_A4D412:
    dw $0004,$0000 
    db $00 
    dw $F0D2,$0000 
    db $F8 
    dw $70D2,$01F8 
    db $00 
    dw $B0D2,$01F8 
    db $F8 
    dw $30D2 

UNUSED_Spritemap_Crocomire_A4D428:
    dw $0004,$0000 
    db $00 
    dw $F0D3,$0000 
    db $F8 
    dw $70D3,$01F8 
    db $00 
    dw $B0D3,$01F8 
    db $F8 
    dw $30D3 
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_Crocomire_17:
    dw $0004,$0008 
    db $00 
    dw $20D7,$0000 
    db $00 
    dw $20D6,$01F8 
    db $00 
    dw $20D5,$01F8 
    db $F8 
    dw $20D4 

Spritemap_Crocomire_18:
    dw $0003,$0008 
    db $00 
    dw $20DA,$0000 
    db $00 
    dw $20D9,$01F8 
    db $00 
    dw $20D8 

Spritemap_Crocomire_19:
    dw $0004,$0008 
    db $F8 
    dw $A0D7,$0000 
    db $F8 
    dw $A0D6,$01F8 
    db $F8 
    dw $A0D5,$01F8 
    db $00 
    dw $A0D4 

Spritemap_Crocomire_1A:
    dw $0003,$0008 
    db $F8 
    dw $A0DA,$0000 
    db $F8 
    dw $A0D9,$01F8 
    db $F8 
    dw $A0D8 

Spritemap_Crocomire_1B:
    dw $0001,$81F8 
    db $F8 
    dw $31CC 

Spritemap_Crocomire_1C:
    dw $0006,$01E0 
    db $00 
    dw $31DE,$01E0 
    db $F8 
    dw $31CE,$01E8 
    db $00 
    dw $315D,$01E8 
    db $F8 
    dw $314D,$81F0 
    db $F0 
    dw $31E6,$8000 
    db $F0 
    dw $31E0 

Spritemap_Crocomire_1D:
    dw $0006,$01E0 
    db $00 
    dw $31DF,$01E0 
    db $F8 
    dw $31CF,$01E8 
    db $00 
    dw $315D,$01E8 
    db $F8 
    dw $314D,$81F0 
    db $F0 
    dw $31E6,$8000 
    db $F0 
    dw $31E0 

Spritemap_Crocomire_1E:
    dw $0006,$01E8 
    db $00 
    dw $315E,$01E8 
    db $F8 
    dw $314E,$01E0 
    db $00 
    dw $313F,$01E0 
    db $F8 
    dw $312F,$81F0 
    db $F0 
    dw $31E6,$8000 
    db $F0 
    dw $31E0 

Spritemap_Crocomire_1F:
    dw $0004,$8000 
    db $F0 
    dw $31E0,$81F0 
    db $F0 
    dw $31E8,$01E8 
    db $00 
    dw $315F,$01E8 
    db $F8 
    dw $314F 

Spritemap_Crocomire_20:
    dw $0002,$8000 
    db $F0 
    dw $31E2,$81F0 
    db $F0 
    dw $31EA 

Spritemap_Crocomire_21:
    dw $0001,$8000 
    db $F0 
    dw $31E4 

ExtendedTilemap_Crocomire_0:
    dw $FFFE,$2000,$000C,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$2040 
    dw $000C,$0338,$0338,$3CA2,$3CA3,$3CA4,$3CA5,$3CA6 
    dw $3CA7,$3CA8,$3CA9,$3CAA,$0338,$2080,$000C,$3CB0 
    dw $3CB1,$3CB2,$3CB3,$3CB4,$3CB5,$3CB6,$3CB7,$3CB8 
    dw $3CB9,$3CBA,$3CBB,$20C0,$000C,$3CAC,$3CAD,$3CAE 
    dw $3CAF,$3CC0,$3CC1,$3CC2,$3CC3,$3CC4,$3CC5,$3CC6 
    dw $3CC7,$2100,$000C,$3CBC,$3CBD,$3CBE,$3CBF,$3CD0 
    dw $3CD1,$3CD2,$3CD3,$3CD4,$3CD5,$3CD6,$3CD7,$2140 
    dw $000C,$0338,$0338,$0338,$0338,$3CCA,$3CCB,$3CCC 
    dw $3CCD,$3CCE,$3CCF,$3C8B,$3C8C,$2180,$000C,$0338 
    dw $0338,$3CD8,$3CD9,$3CDA,$3CDB,$3CDC,$3CDD,$3CDE 
    dw $3CDF,$3C9B,$3C9C,$21C0,$000C,$0338,$0338,$3C43 
    dw $3C44,$3C45,$3C46,$3C8D,$3C8E,$3C8F,$3C9D,$3C9E 
    dw $3C9F,$FFFF 

ExtendedTilemap_Crocomire_1:
    dw $FFFE,$2000,$0008,$0338,$3CE0,$3CE1,$3CE2,$3CE3 
    dw $3CE4,$3CE5,$3CE6,$2040,$000B,$0338,$3CF0,$3CF1 
    dw $3CF2,$3CF3,$3CF4,$3CF5,$3CF6,$3CF7,$3CF8,$0338 
    dw $2080,$000C,$0338,$0338,$3CE9,$3CEA,$3CEB,$3CEC 
    dw $3CED,$3CEE,$3CEF,$3D00,$3D01,$0338,$20C0,$000C 
    dw $0338,$0338,$0338,$3CFA,$3CFB,$3CFC,$3CFD,$3CFE 
    dw $3CFF,$3D10,$3D11,$3D12,$2100,$000C,$0338,$0338 
    dw $0338,$0338,$3D03,$3D04,$3D05,$3D06,$3D07,$3D08 
    dw $3D09,$3D0A,$2140,$000C,$0338,$0338,$0338,$0338 
    dw $0338,$3D14,$3D15,$3D16,$3D17,$3D18,$3D19,$3D1A 
    dw $2180,$000C,$0338,$0338,$3D0C,$3D0D,$3D0E,$3D0F 
    dw $3D20,$3D21,$3D22,$3D23,$3D24,$3D25,$21C0,$000C 
    dw $0338,$0338,$3D1C,$3D1D,$3D1E,$3D1F,$3D30,$3D31 
    dw $3D32,$3D33,$3D34,$3D35,$FFFF 

ExtendedTilemap_Crocomire_2:
    dw $FFFE,$2000,$0008,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$2040,$000B,$0338,$0338,$0338 
    dw $0338,$0338,$3C02,$3C03,$3C04,$3C05,$3C06,$3C07 
    dw $2080,$000C,$0338,$0338,$0338,$3C10,$3C11,$3C12 
    dw $3C13,$3C14,$3C15,$3C16,$3C17,$3C18,$20C0,$000C 
    dw $0338,$3C0A,$3C0B,$3C0C,$3C0D,$3C0E,$3C0F,$3C20 
    dw $3C21,$3C22,$3C23,$3C24,$2100,$000C,$3C19,$3C1A 
    dw $3C1B,$3C1C,$3C1D,$3C1E,$3C1F,$3C30,$3C31,$3C32 
    dw $3C33,$3C34,$2140,$000C,$3C25,$3C26,$3C27,$3C28 
    dw $3C29,$3C2A,$3C2B,$3C2C,$3C2D,$3C2E,$3C2F,$3C40 
    dw $2180,$000C,$3C35,$3C36,$3C37,$3C38,$3C39,$3C3A 
    dw $3C3B,$3C3C,$3C3D,$3C3E,$3C3F,$3C50,$21C0,$0001 
    dw $3C00,$21C4,$000A,$3C43,$3C44,$3C45,$3C46,$3C47 
    dw $3C48,$3C49,$3C4A,$3C4B,$3C4C,$FFFF 

ExtendedTilemap_Crocomire_3:
    dw $FFFE,$2246,$0004,$3C4F,$3C60,$3C61,$3C62,$2286 
    dw $0004,$3C5F,$3C70,$3C71,$3C72,$22C6,$0004,$3C6A 
    dw $3C6B,$3C6C,$3C6D,$2306,$0004,$3C7A,$3C7B,$3C7C 
    dw $3C7D,$FFFF 

ExtendedTilemap_Crocomire_4:
    dw $FFFE,$2246,$0004,$3D46,$3D47,$3D48,$3D49,$2286 
    dw $0004,$3D56,$3D57,$3D58,$3D59,$22C6,$0004,$3D4A 
    dw $3D4B,$3D4C,$3D4D,$2306,$0004,$3D5A,$3D5B,$3D5C 
    dw $3D5D,$FFFF 

ExtendedTilemap_Crocomire_5:
    dw $FFFE,$2246,$0004,$3D4E,$3D4F,$3D02,$3D0B,$2286 
    dw $0004,$3D13,$3D1B,$3C42,$3C51,$22C6,$0004,$3CA0 
    dw $3CA1,$3CAB,$3CF9,$2306,$0004,$3C01,$3C08,$3C09 
    dw $3C41,$FFFF 

ExtendedTilemap_Crocomire_6:
    dw $FFFE,$2354,$0006,$3D40,$3D41,$3D42,$3D43,$3D44 
    dw $3D45,$2394,$0006,$3D50,$3D51,$3D52,$3D53,$3D54 
    dw $3D55,$FFFF 

ExtendedTilemap_Crocomire_7:
    dw $FFFE,$2354,$0006,$3D26,$3D27,$3D28,$3D29,$3D2A 
    dw $3D2B,$2394,$0006,$3D36,$3D37,$3D38,$3D39,$3D3A 
    dw $3D3B,$FFFF 

ExtendedTilemap_Crocomire_8:
    dw $FFFE,$2354,$0006,$3D2C,$3D2D,$3D2E,$3D2F,$3CC8 
    dw $3CC9,$2394,$0006,$3D3C,$3D3D,$3D3E,$3D3F,$3CE7 
    dw $3CE8,$FFFF 

ExtendedTilemap_Crocomire_9:
    dw $FFFE,$2040,$000C,$0338,$0338,$0338,$0338,$0338 
    dw $3C02,$3C03,$3C04,$3C05,$3C06,$3C07,$0338,$2080 
    dw $000C,$0338,$0338,$0338,$3C10,$3C11,$3C12,$3C13 
    dw $3C14,$3C15,$3C16,$3C17,$3C18,$20C0,$000C,$0338 
    dw $3C0A,$3C0B,$3C0C,$3C0D,$3C0E,$3C0F,$3C20,$3C21 
    dw $3C22,$3C23,$3C24,$2100,$000C,$3C19,$3C1A,$3C1B 
    dw $3C1C,$3C1D,$3C1E,$3C1F,$3C30,$3C31,$3C32,$3C33 
    dw $3C34,$2140,$000C,$3C25,$3C26,$3C27,$3C28,$3C29 
    dw $3C2A,$3C2B,$3C2C,$3C2D,$3C2E,$3C2F,$3C40,$2180 
    dw $000C,$3C35,$3C36,$3C37,$3C38,$3C39,$3C3A,$3C3B 
    dw $3C3C,$3C3D,$3C3E,$3C3F,$3C50,$21C0,$000C,$3C00 
    dw $0338,$3C43,$3C44,$3C45,$3C46,$3C47,$3C48,$3C49 
    dw $3C4A,$3C4B,$3C4C,$2200,$000C,$0338,$0338,$3C53 
    dw $3C54,$3C55,$3C56,$3C57,$3C58,$3C59,$3C5A,$3C5B 
    dw $3C5C,$2240,$000C,$0338,$3C4D,$3C4E,$3C4F,$3C60 
    dw $3C61,$3C62,$3C63,$3C64,$3C65,$3C66,$3C67,$2280 
    dw $000C,$0338,$3C5D,$3C5E,$3C5F,$3C70,$3C71,$3C72 
    dw $3C73,$3C74,$3C75,$3C76,$3C77,$22C0,$000C,$0338 
    dw $3C68,$3C69,$3C6A,$3C6B,$3C6C,$3C6D,$3C6E,$3C6F 
    dw $3C80,$3C81,$0338,$2300,$000C,$0338,$3C78,$3C79 
    dw $3C7A,$3C7B,$3C7C,$3C7D,$3C7E,$3C7F,$3C90,$3C91 
    dw $0338,$2340,$000C,$0338,$3C82,$3C83,$3C84,$3C85 
    dw $3C86,$3C87,$3C88,$3C89,$3C8A,$3D40,$3D41,$2380 
    dw $000C,$0338,$0338,$3C93,$3C94,$3C95,$3C96,$3C97 
    dw $3C98,$3C99,$3C9A,$3D50,$3D51,$FFFF 

ExtendedTilemap_Crocomire_A:
    dw $FFFE,$2202,$000B,$0338,$3C53,$3C54,$3C55,$3C56 
    dw $3C57,$3C58,$3C59,$3C5A,$3C5B,$3C5C,$2242,$000B 
    dw $3C4D,$3C4E,$3C4F,$3C60,$3C61,$3C62,$3C63,$3C64 
    dw $3C65,$3C66,$3C67,$2282,$000B,$3C5D,$3C5E,$3C5F 
    dw $3C70,$3C71,$3C72,$3C73,$3C74,$3C75,$3C76,$3C77 
    dw $22C2,$000B,$3C68,$3C69,$3C6A,$3C6B,$3C6C,$3C6D 
    dw $3C6E,$3C6F,$3C80,$3C81,$0338,$2302,$000B,$3C78 
    dw $3C79,$3C7A,$3C7B,$3C7C,$3C7D,$3C7E,$3C7F,$3C90 
    dw $3C91,$0338,$2342,$000B,$3C82,$3C83,$3C84,$3C85 
    dw $3C86,$3C87,$3C88,$3C89,$3C8A,$3D40,$3D41,$2382 
    dw $000B,$0338,$3C93,$3C94,$3C95,$3C96,$3C97,$3C98 
    dw $3C99,$3C9A,$3D50,$3D51,$FFFF 

Spritemap_Crocomire_22:
    dw $0017,$01D8 
    db $D8 
    dw $2F77,$01E8 
    db $E8 
    dw $2F66,$01F0 
    db $E8 
    dw $2F65,$0000 
    db $D0 
    dw $2F76,$01F8 
    db $D0 
    dw $2F75,$01F0 
    db $D0 
    dw $2F74,$01F0 
    db $C8 
    dw $2F64,$C3E0 
    db $C8 
    dw $2F62,$C3D0 
    db $C8 
    dw $2F60,$C3E8 
    db $D8 
    dw $2F68,$01E0 
    db $E0 
    dw $2F77,$01E0 
    db $D8 
    dw $2F67,$C218 
    db $D8 
    dw $2F6E,$C208 
    db $D8 
    dw $2F6C,$C3F8 
    db $D8 
    dw $2F6A,$C218 
    db $E8 
    dw $2F84,$C208 
    db $E8 
    dw $2F82,$C3F8 
    db $E8 
    dw $2F80,$C218 
    db $F8 
    dw $2F8E,$C208 
    db $F8 
    dw $2F8C,$C3F8 
    db $F8 
    dw $2F8A,$C3E8 
    db $F8 
    dw $2F88,$C3D8 
    db $F8 
    dw $2F86 

Spritemap_Crocomire_23:
    dw $0022,$01D8 
    db $D8 
    dw $2F77,$01E8 
    db $E8 
    dw $2F66,$01F0 
    db $E8 
    dw $2F65,$0000 
    db $D0 
    dw $2F76,$01F8 
    db $D0 
    dw $2F75,$01F0 
    db $D0 
    dw $2F74,$01F0 
    db $C8 
    dw $2F64,$C3E0 
    db $C8 
    dw $2F62,$C3D0 
    db $C8 
    dw $2F60,$C3E8 
    db $D8 
    dw $2F68,$01E0 
    db $E0 
    dw $2F77,$01E0 
    db $D8 
    dw $2F67,$C218 
    db $D8 
    dw $2F6E,$C208 
    db $D8 
    dw $2F6C,$C3F8 
    db $D8 
    dw $2F6A,$C218 
    db $E8 
    dw $2F84,$C208 
    db $E8 
    dw $2F82,$C3F8 
    db $E8 
    dw $2F80,$C218 
    db $F8 
    dw $2F8E,$C208 
    db $F8 
    dw $2F8C,$C3F8 
    db $F8 
    dw $2F8A,$C3E8 
    db $F8 
    dw $2F88,$C3D8 
    db $F8 
    dw $2F86,$0020 
    db $08 
    dw $2F3A,$0018 
    db $08 
    dw $2F39,$0010 
    db $08 
    dw $2F38,$0008 
    db $08 
    dw $2F37,$0000 
    db $08 
    dw $2F36,$01F8 
    db $08 
    dw $2F35,$01F0 
    db $08 
    dw $2F34,$01E8 
    db $08 
    dw $2F33,$01E0 
    db $08 
    dw $2F32,$01D8 
    db $08 
    dw $2F31,$01D0 
    db $08 
    dw $2F30 

Spritemap_Crocomire_24:
    dw $002D,$01D8 
    db $D8 
    dw $2F77,$01E8 
    db $E8 
    dw $2F66,$01F0 
    db $E8 
    dw $2F65,$0000 
    db $D0 
    dw $2F76,$01F8 
    db $D0 
    dw $2F75,$01F0 
    db $D0 
    dw $2F74,$01F0 
    db $C8 
    dw $2F64,$C3E0 
    db $C8 
    dw $2F62,$C3D0 
    db $C8 
    dw $2F60,$C3E8 
    db $D8 
    dw $2F68,$01E0 
    db $E0 
    dw $2F77,$01E0 
    db $D8 
    dw $2F67,$C218 
    db $D8 
    dw $2F6E,$C208 
    db $D8 
    dw $2F6C,$C3F8 
    db $D8 
    dw $2F6A,$C218 
    db $E8 
    dw $2F84,$C208 
    db $E8 
    dw $2F82,$C3F8 
    db $E8 
    dw $2F80,$C218 
    db $F8 
    dw $2F8E,$C208 
    db $F8 
    dw $2F8C,$C3F8 
    db $F8 
    dw $2F8A,$C3E8 
    db $F8 
    dw $2F88,$C3D8 
    db $F8 
    dw $2F86,$0020 
    db $10 
    dw $2F4A,$0018 
    db $10 
    dw $2F49,$0010 
    db $10 
    dw $2F48,$0008 
    db $10 
    dw $2F47,$0000 
    db $10 
    dw $2F46,$01F8 
    db $10 
    dw $2F45,$01F0 
    db $10 
    dw $2F44,$01E8 
    db $10 
    dw $2F43,$01E0 
    db $10 
    dw $2F42,$01D8 
    db $10 
    dw $2F41,$01D0 
    db $10 
    dw $2F40,$0020 
    db $08 
    dw $2F3A,$0018 
    db $08 
    dw $2F39,$0010 
    db $08 
    dw $2F38,$0008 
    db $08 
    dw $2F37,$0000 
    db $08 
    dw $2F36,$01F8 
    db $08 
    dw $2F35,$01F0 
    db $08 
    dw $2F34,$01E8 
    db $08 
    dw $2F33,$01E0 
    db $08 
    dw $2F32,$01D8 
    db $08 
    dw $2F31,$01D0 
    db $08 
    dw $2F30 

Spritemap_Crocomire_25:
    dw $0037,$01D8 
    db $D8 
    dw $2F77,$01E8 
    db $E8 
    dw $2F66,$01F0 
    db $E8 
    dw $2F65,$0000 
    db $D0 
    dw $2F76,$01F8 
    db $D0 
    dw $2F75,$01F0 
    db $D0 
    dw $2F74,$01F0 
    db $C8 
    dw $2F64,$C3E0 
    db $C8 
    dw $2F62,$C3D0 
    db $C8 
    dw $2F60,$C3E8 
    db $D8 
    dw $2F68,$01E0 
    db $E0 
    dw $2F77,$01E0 
    db $D8 
    dw $2F67,$C218 
    db $D8 
    dw $2F6E,$C208 
    db $D8 
    dw $2F6C,$C3F8 
    db $D8 
    dw $2F6A,$C218 
    db $E8 
    dw $2F84,$C208 
    db $E8 
    dw $2F82,$C3F8 
    db $E8 
    dw $2F80,$C218 
    db $F8 
    dw $2F8E,$C208 
    db $F8 
    dw $2F8C,$C3F8 
    db $F8 
    dw $2F8A,$C3E8 
    db $F8 
    dw $2F88,$C3D8 
    db $F8 
    dw $2F86,$0018 
    db $18 
    dw $2F59,$0010 
    db $18 
    dw $2F58,$0008 
    db $18 
    dw $2F57,$0000 
    db $18 
    dw $2F56,$01F8 
    db $18 
    dw $2F55,$01F0 
    db $18 
    dw $2F54,$01E8 
    db $18 
    dw $2F53,$01E0 
    db $18 
    dw $2F52,$01D8 
    db $18 
    dw $2F51,$01D0 
    db $18 
    dw $2F50,$0020 
    db $10 
    dw $2F4A,$0018 
    db $10 
    dw $2F49,$0010 
    db $10 
    dw $2F48,$0008 
    db $10 
    dw $2F47,$0000 
    db $10 
    dw $2F46,$01F8 
    db $10 
    dw $2F45,$01F0 
    db $10 
    dw $2F44,$01E8 
    db $10 
    dw $2F43,$01E0 
    db $10 
    dw $2F42,$01D8 
    db $10 
    dw $2F41,$01D0 
    db $10 
    dw $2F40,$0020 
    db $08 
    dw $2F3A,$0018 
    db $08 
    dw $2F39,$0010 
    db $08 
    dw $2F38,$0008 
    db $08 
    dw $2F37,$0000 
    db $08 
    dw $2F36,$01F8 
    db $08 
    dw $2F35,$01F0 
    db $08 
    dw $2F34,$01E8 
    db $08 
    dw $2F33,$01E0 
    db $08 
    dw $2F32,$01D8 
    db $08 
    dw $2F31,$01D0 
    db $08 
    dw $2F30 

Spritemap_Crocomire_26:
    dw $0018,$0010 
    db $F0 
    dw $2FED,$0008 
    db $F0 
    dw $2FEC,$0020 
    db $F0 
    dw $2FFD,$0018 
    db $F0 
    dw $2FFC,$C218 
    db $F8 
    dw $2F8E,$C208 
    db $F8 
    dw $2F8C,$C3F8 
    db $F8 
    dw $2F8A,$0001 
    db $D0 
    dw $2FB6,$01D9 
    db $00 
    dw $2FA6,$01E1 
    db $00 
    dw $2FAF,$01E9 
    db $00 
    dw $2FBF,$C211 
    db $F8 
    dw $2FCA,$C201 
    db $F8 
    dw $2FC8,$C3F1 
    db $F8 
    dw $2FC6,$C211 
    db $E8 
    dw $2FC4,$C201 
    db $E8 
    dw $2FC2,$C3F1 
    db $E8 
    dw $2FC0,$C211 
    db $D8 
    dw $2FAD,$C201 
    db $D8 
    dw $2FAB,$C3F1 
    db $D8 
    dw $2FA9,$C3E1 
    db $D8 
    dw $2FA7,$C3F1 
    db $C8 
    dw $2FA4,$C3E1 
    db $C8 
    dw $2FA2,$C3D1 
    db $C8 
    dw $2FA0 

Spritemap_Crocomire_27:
    dw $0023,$0010 
    db $F0 
    dw $2FED,$0008 
    db $F0 
    dw $2FEC,$0020 
    db $F0 
    dw $2FFD,$0018 
    db $F0 
    dw $2FFC,$C218 
    db $F8 
    dw $2F8E,$C208 
    db $F8 
    dw $2F8C,$C3F8 
    db $F8 
    dw $2F8A,$0001 
    db $D0 
    dw $2FB6,$01D9 
    db $00 
    dw $2FA6,$01E1 
    db $00 
    dw $2FAF,$01E9 
    db $00 
    dw $2FBF,$C211 
    db $F8 
    dw $2FCA,$C201 
    db $F8 
    dw $2FC8,$C3F1 
    db $F8 
    dw $2FC6,$C211 
    db $E8 
    dw $2FC4,$C201 
    db $E8 
    dw $2FC2,$C3F1 
    db $E8 
    dw $2FC0,$C211 
    db $D8 
    dw $2FAD,$C201 
    db $D8 
    dw $2FAB,$C3F1 
    db $D8 
    dw $2FA9,$C3E1 
    db $D8 
    dw $2FA7,$C3F1 
    db $C8 
    dw $2FA4,$C3E1 
    db $C8 
    dw $2FA2,$C3D1 
    db $C8 
    dw $2FA0,$0020 
    db $08 
    dw $2F3A,$0018 
    db $08 
    dw $2F39,$0010 
    db $08 
    dw $2F38,$0008 
    db $08 
    dw $2F37,$0000 
    db $08 
    dw $2F36,$01F8 
    db $08 
    dw $2F35,$01F0 
    db $08 
    dw $2F34,$01E8 
    db $08 
    dw $2F33,$01E0 
    db $08 
    dw $2F32,$01D8 
    db $08 
    dw $2F31,$01D0 
    db $08 
    dw $2F30 

Spritemap_Crocomire_28:
    dw $002E,$0010 
    db $F0 
    dw $2FED,$0008 
    db $F0 
    dw $2FEC,$0020 
    db $F0 
    dw $2FFD,$0018 
    db $F0 
    dw $2FFC,$C218 
    db $F8 
    dw $2F8E,$C208 
    db $F8 
    dw $2F8C,$C3F8 
    db $F8 
    dw $2F8A,$0001 
    db $D0 
    dw $2FB6,$01D9 
    db $00 
    dw $2FA6,$01E1 
    db $00 
    dw $2FAF,$01E9 
    db $00 
    dw $2FBF,$C211 
    db $F8 
    dw $2FCA,$C201 
    db $F8 
    dw $2FC8,$C3F1 
    db $F8 
    dw $2FC6,$C211 
    db $E8 
    dw $2FC4,$C201 
    db $E8 
    dw $2FC2,$C3F1 
    db $E8 
    dw $2FC0,$C211 
    db $D8 
    dw $2FAD,$C201 
    db $D8 
    dw $2FAB,$C3F1 
    db $D8 
    dw $2FA9,$C3E1 
    db $D8 
    dw $2FA7,$C3F1 
    db $C8 
    dw $2FA4,$C3E1 
    db $C8 
    dw $2FA2,$C3D1 
    db $C8 
    dw $2FA0,$0020 
    db $10 
    dw $2F4A,$0018 
    db $10 
    dw $2F49,$0010 
    db $10 
    dw $2F48,$0008 
    db $10 
    dw $2F47,$0000 
    db $10 
    dw $2F46,$01F8 
    db $10 
    dw $2F45,$01F0 
    db $10 
    dw $2F44,$01E8 
    db $10 
    dw $2F43,$01E0 
    db $10 
    dw $2F42,$01D8 
    db $10 
    dw $2F41,$01D0 
    db $10 
    dw $2F40,$0020 
    db $08 
    dw $2F3A,$0018 
    db $08 
    dw $2F39,$0010 
    db $08 
    dw $2F38,$0008 
    db $08 
    dw $2F37,$0000 
    db $08 
    dw $2F36,$01F8 
    db $08 
    dw $2F35,$01F0 
    db $08 
    dw $2F34,$01E8 
    db $08 
    dw $2F33,$01E0 
    db $08 
    dw $2F32,$01D8 
    db $08 
    dw $2F31,$01D0 
    db $08 
    dw $2F30 

Spritemap_Crocomire_29:
    dw $0038,$0010 
    db $F0 
    dw $2FED,$0008 
    db $F0 
    dw $2FEC,$0020 
    db $F0 
    dw $2FFD,$0018 
    db $F0 
    dw $2FFC,$C218 
    db $F8 
    dw $2F8E,$C208 
    db $F8 
    dw $2F8C,$C3F8 
    db $F8 
    dw $2F8A,$0001 
    db $D0 
    dw $2FB6,$01D9 
    db $00 
    dw $2FA6,$01E1 
    db $00 
    dw $2FAF,$01E9 
    db $00 
    dw $2FBF,$C211 
    db $F8 
    dw $2FCA,$C201 
    db $F8 
    dw $2FC8,$C3F1 
    db $F8 
    dw $2FC6,$C211 
    db $E8 
    dw $2FC4,$C201 
    db $E8 
    dw $2FC2,$C3F1 
    db $E8 
    dw $2FC0,$C211 
    db $D8 
    dw $2FAD,$C201 
    db $D8 
    dw $2FAB,$C3F1 
    db $D8 
    dw $2FA9,$C3E1 
    db $D8 
    dw $2FA7,$C3F1 
    db $C8 
    dw $2FA4,$C3E1 
    db $C8 
    dw $2FA2,$C3D1 
    db $C8 
    dw $2FA0,$0018 
    db $18 
    dw $2F59,$0010 
    db $18 
    dw $2F58,$0008 
    db $18 
    dw $2F57,$0000 
    db $18 
    dw $2F56,$01F8 
    db $18 
    dw $2F55,$01F0 
    db $18 
    dw $2F54,$01E8 
    db $18 
    dw $2F53,$01E0 
    db $18 
    dw $2F52,$01D8 
    db $18 
    dw $2F51,$01D0 
    db $18 
    dw $2F50,$0020 
    db $10 
    dw $2F4A,$0018 
    db $10 
    dw $2F49,$0010 
    db $10 
    dw $2F48,$0008 
    db $10 
    dw $2F47,$0000 
    db $10 
    dw $2F46,$01F8 
    db $10 
    dw $2F45,$01F0 
    db $10 
    dw $2F44,$01E8 
    db $10 
    dw $2F43,$01E0 
    db $10 
    dw $2F42,$01D8 
    db $10 
    dw $2F41,$01D0 
    db $10 
    dw $2F40,$0020 
    db $08 
    dw $2F3A,$0018 
    db $08 
    dw $2F39,$0010 
    db $08 
    dw $2F38,$0008 
    db $08 
    dw $2F37,$0000 
    db $08 
    dw $2F36,$01F8 
    db $08 
    dw $2F35,$01F0 
    db $08 
    dw $2F34,$01E8 
    db $08 
    dw $2F33,$01E0 
    db $08 
    dw $2F32,$01D8 
    db $08 
    dw $2F31,$01D0 
    db $08 
    dw $2F30 

InstList_CrocomireCorpse_Skeleton_Falling:
    dw $000A 
    dw ExtendedSpritemap_CrocomireCorpse_0 
    dw $000A 
    dw ExtendedSpritemap_CrocomireCorpse_1 
    dw $000A 
    dw ExtendedSpritemap_CrocomireCorpse_2 
    dw Instruction_Common_Sleep 

InstList_CrocomireCorpse_Skeleton_FallsApart_0:
    dw $000A 
    dw ExtendedSpritemap_CrocomireCorpse_3 
    dw Instruction_Crocomire_SpawnBigDustCloudProjectile_Negative20 
    dw $0005 
    dw ExtendedSpritemap_CrocomireCorpse_4 
    dw Instruction_Crocomire_SpawnBigDustCloudProjectile_0 
    dw $0005 
    dw ExtendedSpritemap_CrocomireCorpse_4 
    dw Instruction_Crocomire_SpawnBigDustCloudProjectile_Negative10 
    dw $0005 
    dw ExtendedSpritemap_CrocomireCorpse_5 
    dw Instruction_Crocomire_SpawnBigDustCloudProjectile_10 
    dw $0005 
    dw ExtendedSpritemap_CrocomireCorpse_5 
    dw $000A 
    dw ExtendedSpritemap_CrocomireCorpse_6 
    dw $0020 
    dw ExtendedSpritemap_CrocomireCorpse_7 
    dw $0010 
    dw ExtendedSpritemap_CrocomireCorpse_8 
    dw Instruction_Crocomire_QueueSkeletonCollapseSFX 
    dw $000A 
    dw ExtendedSpritemap_CrocomireCorpse_9 
    dw $0009 
    dw ExtendedSpritemap_CrocomireCorpse_A 
    dw $0009 
    dw ExtendedSpritemap_CrocomireCorpse_B 
    dw Instruction_Crocomire_SpawnBigDustCloudProjectile_0_dup 
    dw $0008 
    dw ExtendedSpritemap_CrocomireCorpse_C 
    dw Instruction_Crocomire_SpawnBigDustCloudProjectile_8 
    dw $0008 
    dw ExtendedSpritemap_CrocomireCorpse_D 
    dw Instruction_Crocomire_SpawnBigDustCloudProjectile_10_dup 
    dw $0007 
    dw ExtendedSpritemap_CrocomireCorpse_E 
    dw Instruction_Crocomire_SpawnBigDustCloudProjectile_18 
    dw $0007 
    dw ExtendedSpritemap_CrocomireCorpse_F 
    dw Instruction_Crocomire_SpawnBigDustCloudProjectile_20 
    dw $0006 
    dw ExtendedSpritemap_CrocomireCorpse_10 
    dw Instruction_Crocomire_SpawnBigDustCloudProjectile_28 
    dw $0006 
    dw ExtendedSpritemap_CrocomireCorpse_11 
    dw Instruction_Crocomire_SpawnBigDustCloudProjectile_30 
    dw $0006 
    dw ExtendedSpritemap_CrocomireCorpse_12 
    dw Instruction_Crocomire_SpawnBigDustCloudProjectile_38 
    dw $0005 
    dw ExtendedSpritemap_CrocomireCorpse_13 
    dw Instruction_Crocomire_SpawnBigDustCloudProjectile_40 
    dw Instruction_Crocomire_QueueBigExplosionSFX 
    dw $0005 
    dw ExtendedSpritemap_CrocomireCorpse_14 

InstList_CrocomireCorpse_Skeleton_1:
    dw $7FFF 
    dw ExtendedSpritemap_CrocomireCorpse_15 
    dw Instruction_Common_Sleep 

InstList_CrocomireCorpse_Skeleton_Dead:
    dw $7FFF 
    dw ExtendedSpritemap_CrocomireCorpse_16 
    dw Instruction_CommonA4_Sleep 

InstList_CrocomireCorpse_Skeleton_FlowingDownTheRiver:
    dw $0004 
    dw ExtendedSpritemap_CrocomireCorpse_17 
    dw $0004 
    dw ExtendedSpritemap_CrocomireCorpse_18 
    dw $0004 
    dw ExtendedSpritemap_CrocomireCorpse_19 
    dw $0004 
    dw ExtendedSpritemap_CrocomireCorpse_1A 
    dw $0004 
    dw ExtendedSpritemap_CrocomireCorpse_1B 
    dw $0004 
    dw ExtendedSpritemap_CrocomireCorpse_1C 
    dw $0004 
    dw ExtendedSpritemap_CrocomireCorpse_1D 
    dw $0004 
    dw ExtendedSpritemap_CrocomireCorpse_1E 
    dw $0004 
    dw ExtendedSpritemap_CrocomireCorpse_1F 
    dw $0014 
    dw ExtendedSpritemap_CrocomireCorpse_20 
    dw Instruction_Common_GotoY 
    dw InstList_CrocomireCorpse_Skeleton_FlowingDownTheRiver 

ExtendedSpritemap_CrocomireCorpse_0:
    dw $0005,$FFF0,$0007 
    dw Spritemap_CrocomireCorpse_14 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $FFFC,$FFD1 
    dw Spritemap_CrocomireCorpse_0 
    dw Hitbox_CrocomireCorspe 
    dw $FFE7,$FFF8 
    dw Spritemap_CrocomireCorpse_3 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $FFFF,$0005 
    dw Spritemap_CrocomireCorpse_1 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $FFE4,$0014 
    dw Spritemap_CrocomireCorpse_2 
    dw Hitbox_CrocomireCorspe_Empty 

ExtendedSpritemap_CrocomireCorpse_1:
    dw $0005,$FFF0,$0004 
    dw Spritemap_CrocomireCorpse_15 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $FFFD,$FFCF 
    dw Spritemap_CrocomireCorpse_0 
    dw Hitbox_CrocomireCorspe 
    dw $FFE7,$FFF8 
    dw Spritemap_CrocomireCorpse_3 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $FFFF,$0003 
    dw Spritemap_CrocomireCorpse_1 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $FFE2,$0014 
    dw Spritemap_CrocomireCorpse_2 
    dw Hitbox_CrocomireCorspe_Empty 

ExtendedSpritemap_CrocomireCorpse_2:
    dw $0005,$FFF5,$FFFF 
    dw Spritemap_CrocomireCorpse_12 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $FFFF,$FFCE 
    dw Spritemap_CrocomireCorpse_0 
    dw Hitbox_CrocomireCorspe 
    dw $FFE7,$FFF6 
    dw Spritemap_CrocomireCorpse_3 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $FFFF,$0002 
    dw Spritemap_CrocomireCorpse_1 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $FFE1,$0014 
    dw Spritemap_CrocomireCorpse_2 
    dw Hitbox_CrocomireCorspe_Empty 

ExtendedSpritemap_CrocomireCorpse_3:
    dw $0005,$FFF0,$0003 
    dw Spritemap_CrocomireCorpse_13 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $0000,$FFCD 
    dw Spritemap_CrocomireCorpse_0 
    dw Hitbox_CrocomireCorspe 
    dw $FFE7,$FFF8 
    dw Spritemap_CrocomireCorpse_3 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $FFFF,$0001 
    dw Spritemap_CrocomireCorpse_1 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $FFE0,$0014 
    dw Spritemap_CrocomireCorpse_2 
    dw Hitbox_CrocomireCorspe_Empty 

ExtendedSpritemap_CrocomireCorpse_4:
    dw $0005,$FFF4,$0007 
    dw Spritemap_CrocomireCorpse_10 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $0002,$FFD0 
    dw Spritemap_CrocomireCorpse_0 
    dw Hitbox_CrocomireCorspe 
    dw $FFE7,$FFFB 
    dw Spritemap_CrocomireCorpse_3 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $FFFF,$0004 
    dw Spritemap_CrocomireCorpse_1 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $FFDF,$0014 
    dw Spritemap_CrocomireCorpse_2 
    dw Hitbox_CrocomireCorspe_Empty 

ExtendedSpritemap_CrocomireCorpse_5:
    dw $0005,$FFF4,$0006 
    dw Spritemap_CrocomireCorpse_10 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $0002,$FFD4 
    dw Spritemap_CrocomireCorpse_0 
    dw Hitbox_CrocomireCorspe 
    dw $FFE7,$FFFB 
    dw Spritemap_CrocomireCorpse_3 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $FFFF,$0006 
    dw Spritemap_CrocomireCorpse_1 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $FFDE,$0014 
    dw Spritemap_CrocomireCorpse_2 
    dw Hitbox_CrocomireCorspe_Empty 

ExtendedSpritemap_CrocomireCorpse_6:
    dw $0005,$FFF5,$0004 
    dw Spritemap_CrocomireCorpse_10 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $0003,$FFD1 
    dw Spritemap_CrocomireCorpse_0 
    dw Hitbox_CrocomireCorspe 
    dw $FFE7,$FFFB 
    dw Spritemap_CrocomireCorpse_3 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $FFFF,$0004 
    dw Spritemap_CrocomireCorpse_1 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $FFDE,$0014 
    dw Spritemap_CrocomireCorpse_2 
    dw Hitbox_CrocomireCorspe_Empty 

ExtendedSpritemap_CrocomireCorpse_7:
    dw $0005,$FFF4,$0005 
    dw Spritemap_CrocomireCorpse_10 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $0002,$FFD0 
    dw Spritemap_CrocomireCorpse_0 
    dw Hitbox_CrocomireCorspe 
    dw $FFE7,$FFFB 
    dw Spritemap_CrocomireCorpse_3 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $FFFF,$0003 
    dw Spritemap_CrocomireCorpse_1 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $FFDD,$0014 
    dw Spritemap_CrocomireCorpse_2 
    dw Hitbox_CrocomireCorspe_Empty 

ExtendedSpritemap_CrocomireCorpse_8:
    dw $0005,$FFF0,$000E 
    dw Spritemap_CrocomireCorpse_11 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $0009,$FFD1 
    dw Spritemap_CrocomireCorpse_0 
    dw Hitbox_CrocomireCorspe 
    dw $FFE7,$0000 
    dw Spritemap_CrocomireCorpse_3 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $0001,$0005 
    dw Spritemap_CrocomireCorpse_1 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $FFDA,$0014 
    dw Spritemap_CrocomireCorpse_2 
    dw Hitbox_CrocomireCorspe_Empty 

ExtendedSpritemap_CrocomireCorpse_9:
    dw $0005,$FFEB,$001A 
    dw Spritemap_CrocomireCorpse_13 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $0010,$FFD9 
    dw Spritemap_CrocomireCorpse_0 
    dw Hitbox_CrocomireCorspe 
    dw $FFE7,$0007 
    dw Spritemap_CrocomireCorpse_3 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $0005,$000B 
    dw Spritemap_CrocomireCorpse_1 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $FFDA,$0014 
    dw Spritemap_CrocomireCorpse_2 
    dw Hitbox_CrocomireCorspe_Empty 

ExtendedSpritemap_CrocomireCorpse_A:
    dw $0005,$FFEA,$0023 
    dw Spritemap_CrocomireCorpse_13 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $0015,$FFDD 
    dw Spritemap_CrocomireCorpse_0 
    dw Hitbox_CrocomireCorspe 
    dw $FFE6,$0013 
    dw Spritemap_CrocomireCorpse_3 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $0007,$000F 
    dw Spritemap_CrocomireCorpse_1 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $FFDA,$0014 
    dw Spritemap_CrocomireCorpse_2 
    dw Hitbox_CrocomireCorspe_Empty 

ExtendedSpritemap_CrocomireCorpse_B:
    dw $0005,$FFEA,$002F 
    dw Spritemap_CrocomireCorpse_13 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $001F,$FFEC 
    dw Spritemap_CrocomireCorpse_0 
    dw Hitbox_CrocomireCorspe 
    dw $FFE7,$001E 
    dw Spritemap_CrocomireCorpse_3 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $000A,$0014 
    dw Spritemap_CrocomireCorpse_1 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $FFDA,$0014 
    dw Spritemap_CrocomireCorpse_2 
    dw Hitbox_CrocomireCorspe_Empty 

ExtendedSpritemap_CrocomireCorpse_C:
    dw $0005,$FFEA,$0036 
    dw Spritemap_CrocomireCorpse_13 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $0024,$FFF2 
    dw Spritemap_CrocomireCorpse_0 
    dw Hitbox_CrocomireCorspe 
    dw $FFE7,$0023 
    dw Spritemap_CrocomireCorpse_3 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $000A,$0019 
    dw Spritemap_CrocomireCorpse_1 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $FFDA,$0014 
    dw Spritemap_CrocomireCorpse_2 
    dw Hitbox_CrocomireCorspe_Empty 

ExtendedSpritemap_CrocomireCorpse_D:
    dw $0009,$002E,$FFFC 
    dw Spritemap_CrocomireCorpse_0 
    dw Hitbox_CrocomireCorspe 
    dw $FFE7,$002B 
    dw Spritemap_CrocomireCorpse_3 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $000C,$001E 
    dw Spritemap_CrocomireCorpse_1 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $0001,$0024 
    dw Spritemap_CrocomireCorpse_A 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $FFEB,$0020 
    dw Spritemap_CrocomireCorpse_B 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $FFD8,$0022 
    dw Spritemap_CrocomireCorpse_C 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $FFC6,$001E 
    dw Spritemap_CrocomireCorpse_D 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $FFB6,$0029 
    dw Spritemap_CrocomireCorpse_E 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $FFA3,$0029 
    dw Spritemap_CrocomireCorpse_F 
    dw Hitbox_CrocomireCorspe_Empty 

ExtendedSpritemap_CrocomireCorpse_E:
    dw $000D,$0037,$0007 
    dw Spritemap_CrocomireCorpse_0 
    dw Hitbox_CrocomireCorspe 
    dw $0029,$0027 
    dw Spritemap_CrocomireCorpse_4 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $FFF9,$0014 
    dw Spritemap_CrocomireCorpse_7 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $0019,$002C 
    dw Spritemap_CrocomireCorpse_5 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $0019,$001C 
    dw Spritemap_CrocomireCorpse_5 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $FFF8,$0025 
    dw Spritemap_CrocomireCorpse_8 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $0008,$0019 
    dw Spritemap_CrocomireCorpse_6 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $0009,$002A 
    dw Spritemap_CrocomireCorpse_6 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $FFF7,$0031 
    dw Spritemap_CrocomireCorpse_9 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $FFE8,$0024 
    dw Spritemap_CrocomireCorpse_B 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $FFD3,$0028 
    dw Spritemap_CrocomireCorpse_C 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $FFC3,$001C 
    dw Spritemap_CrocomireCorpse_D 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $FFB4,$002B 
    dw Spritemap_CrocomireCorpse_E 
    dw Hitbox_CrocomireCorspe_Empty 

ExtendedSpritemap_CrocomireCorpse_F:
    dw $000D,$003C,$000C 
    dw Spritemap_CrocomireCorpse_0 
    dw Hitbox_CrocomireCorspe 
    dw $0029,$002C 
    dw Spritemap_CrocomireCorpse_4 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $FFF9,$0019 
    dw Spritemap_CrocomireCorpse_7 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $001C,$0030 
    dw Spritemap_CrocomireCorpse_5 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $001A,$0020 
    dw Spritemap_CrocomireCorpse_5 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $FFFD,$0025 
    dw Spritemap_CrocomireCorpse_8 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $0009,$001E 
    dw Spritemap_CrocomireCorpse_6 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $000D,$002D 
    dw Spritemap_CrocomireCorpse_6 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $FFF8,$0033 
    dw Spritemap_CrocomireCorpse_9 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $FFE9,$002A 
    dw Spritemap_CrocomireCorpse_B 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $FFD0,$002A 
    dw Spritemap_CrocomireCorpse_C 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $FFC2,$0021 
    dw Spritemap_CrocomireCorpse_D 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $FFAE,$002F 
    dw Spritemap_CrocomireCorpse_E 
    dw Hitbox_CrocomireCorspe_Empty 

ExtendedSpritemap_CrocomireCorpse_10:
    dw $000D,$003E,$0011 
    dw Spritemap_CrocomireCorpse_0 
    dw Hitbox_CrocomireCorspe 
    dw $0029,$0031 
    dw Spritemap_CrocomireCorpse_4 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $FFF8,$0020 
    dw Spritemap_CrocomireCorpse_7 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $001C,$0030 
    dw Spritemap_CrocomireCorpse_5 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $0018,$0025 
    dw Spritemap_CrocomireCorpse_5 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $FFFE,$0029 
    dw Spritemap_CrocomireCorpse_8 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $0009,$0023 
    dw Spritemap_CrocomireCorpse_6 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $000F,$0030 
    dw Spritemap_CrocomireCorpse_6 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $FFF6,$0036 
    dw Spritemap_CrocomireCorpse_9 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $FFE8,$002F 
    dw Spritemap_CrocomireCorpse_B 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $FFCE,$002D 
    dw Spritemap_CrocomireCorpse_C 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $FFC0,$0026 
    dw Spritemap_CrocomireCorpse_D 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $FFAC,$0033 
    dw Spritemap_CrocomireCorpse_E 
    dw Hitbox_CrocomireCorspe_Empty 

ExtendedSpritemap_CrocomireCorpse_11:
    dw $000C,$0040,$0016 
    dw Spritemap_CrocomireCorpse_0 
    dw Hitbox_CrocomireCorspe 
    dw $0029,$0031 
    dw Spritemap_CrocomireCorpse_4 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $FFF7,$0026 
    dw Spritemap_CrocomireCorpse_7 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $001C,$002C 
    dw Spritemap_CrocomireCorpse_5 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $0016,$0028 
    dw Spritemap_CrocomireCorpse_5 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $0002,$002C 
    dw Spritemap_CrocomireCorpse_8 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $000C,$0027 
    dw Spritemap_CrocomireCorpse_6 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $000F,$0030 
    dw Spritemap_CrocomireCorpse_6 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $FFF6,$0036 
    dw Spritemap_CrocomireCorpse_9 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $FFE9,$0034 
    dw Spritemap_CrocomireCorpse_B 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $FFD2,$0032 
    dw Spritemap_CrocomireCorpse_C 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $FFBE,$002C 
    dw Spritemap_CrocomireCorpse_D 
    dw Hitbox_CrocomireCorspe_Empty 

ExtendedSpritemap_CrocomireCorpse_12:
    dw $000A,$0040,$0014 
    dw Spritemap_CrocomireCorpse_0 
    dw Hitbox_CrocomireCorspe 
    dw $0029,$0036 
    dw Spritemap_CrocomireCorpse_4 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $FFF6,$002B 
    dw Spritemap_CrocomireCorpse_7 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $001C,$0031 
    dw Spritemap_CrocomireCorpse_5 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $0016,$002D 
    dw Spritemap_CrocomireCorpse_5 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $0002,$002C 
    dw Spritemap_CrocomireCorpse_8 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $000C,$002C 
    dw Spritemap_CrocomireCorpse_6 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $000F,$0035 
    dw Spritemap_CrocomireCorpse_6 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $FFEA,$0039 
    dw Spritemap_CrocomireCorpse_B 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $FFD2,$0037 
    dw Spritemap_CrocomireCorpse_C 
    dw Hitbox_CrocomireCorspe_Empty 

ExtendedSpritemap_CrocomireCorpse_13:
    dw $0006,$0040,$0013 
    dw Spritemap_CrocomireCorpse_0 
    dw Hitbox_CrocomireCorspe 
    dw $FFF3,$002E 
    dw Spritemap_CrocomireCorpse_7 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $001D,$0033 
    dw Spritemap_CrocomireCorpse_5 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $0014,$002F 
    dw Spritemap_CrocomireCorpse_5 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $0002,$0031 
    dw Spritemap_CrocomireCorpse_8 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $000C,$002C 
    dw Spritemap_CrocomireCorpse_6 
    dw Hitbox_CrocomireCorspe_Empty 

ExtendedSpritemap_CrocomireCorpse_14:
    dw $0003,$0040,$0014 
    dw Spritemap_CrocomireCorpse_0 
    dw Hitbox_CrocomireCorspe 
    dw $FFF3,$0031 
    dw Spritemap_CrocomireCorpse_7 
    dw Hitbox_CrocomireCorspe_Empty 
    dw $000E,$0030 
    dw Spritemap_CrocomireCorpse_6 
    dw Hitbox_CrocomireCorspe_Empty 

ExtendedSpritemap_CrocomireCorpse_15:
    dw $0001,$0040,$0015 
    dw Spritemap_CrocomireCorpse_0 
    dw Hitbox_CrocomireCorspe 

ExtendedSpritemap_CrocomireCorpse_16:
    dw $0001,$0000,$0000 
    dw Spritemap_CrocomireCorpse_0 
    dw Hitbox_CrocomireCorspe 

ExtendedSpritemap_CrocomireCorpse_17:
    dw $0001,$0000,$0000 
    dw Spritemap_CrocomireCorpse_16 
    dw Hitbox_CrocomireCorspe_Empty 

ExtendedSpritemap_CrocomireCorpse_18:
    dw $0001,$0000,$0000 
    dw Spritemap_CrocomireCorpse_17 
    dw Hitbox_CrocomireCorspe_Empty 

ExtendedSpritemap_CrocomireCorpse_19:
    dw $0001,$0000,$0000 
    dw Spritemap_CrocomireCorpse_18 
    dw Hitbox_CrocomireCorspe_Empty 

ExtendedSpritemap_CrocomireCorpse_1A:
    dw $0001,$0000,$0000 
    dw Spritemap_CrocomireCorpse_19 
    dw Hitbox_CrocomireCorspe_Empty 

ExtendedSpritemap_CrocomireCorpse_1B:
    dw $0001,$0000,$0000 
    dw Spritemap_CrocomireCorpse_1A 
    dw Hitbox_CrocomireCorspe_Empty 

ExtendedSpritemap_CrocomireCorpse_1C:
    dw $0001,$0000,$0000 
    dw Spritemap_CrocomireCorpse_1B 
    dw Hitbox_CrocomireCorspe_Empty 

ExtendedSpritemap_CrocomireCorpse_1D:
    dw $0001,$0000,$0000 
    dw Spritemap_CrocomireCorpse_1C 
    dw Hitbox_CrocomireCorspe_Empty 

ExtendedSpritemap_CrocomireCorpse_1E:
    dw $0001,$0000,$0000 
    dw Spritemap_CrocomireCorpse_1D 
    dw Hitbox_CrocomireCorspe_Empty 

ExtendedSpritemap_CrocomireCorpse_1F:
    dw $0001,$0000,$0000 
    dw Spritemap_CrocomireCorpse_1E 
    dw Hitbox_CrocomireCorspe_Empty 

ExtendedSpritemap_CrocomireCorpse_20:
    dw $0001,$0020,$0020 
    dw Spritemap_CrocomireCorpse_1F 
    dw Hitbox_CrocomireCorspe_Empty 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Hitbox_CrocomireCorspe_A4E720:
    dw $0001,$FFE6,$FFE2,$0026,$001D 
    dw RTL_A4B950 
    dw EnemyShot_Crocomire_SpawnShotExplosion 
endif ; !FEATURE_KEEP_UNREFERENCED

Hitbox_CrocomireCorspe:
    dw $0002,$FFDA,$FFF0,$0000,$001F 
    dw RTL_A4B950 
    dw EnemyShot_Crocomire_SpawnShotExplosion 
    dw $0000,$FFE3,$001A,$001C 
    dw RTL_A4B950 
    dw EnemyShot_Crocomire_SpawnShotExplosion 

Hitbox_CrocomireCorspe_Empty:
    dw $0000 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_CrocomireCorpse_A4E74A:
    dw $0011,$01E4 
    db $18 
    dw $2FA6,$01F4 
    db $18 
    dw $2FBF,$01EC 
    db $18 
    dw $2FAF,$801C 
    db $10 
    dw $2FCA,$800C 
    db $10 
    dw $2FC8,$81FC 
    db $10 
    dw $2FC6,$801C 
    db $00 
    dw $2FC4,$800C 
    db $00 
    dw $2FC2,$81FC 
    db $00 
    dw $2FC0,$000C 
    db $E8 
    dw $2FB6,$801C 
    db $F0 
    dw $2FAD,$800C 
    db $F0 
    dw $2FAB,$81FC 
    db $F0 
    dw $2FA9,$81EC 
    db $F0 
    dw $2FA7,$81FC 
    db $E0 
    dw $2FA4,$81EC 
    db $E0 
    dw $2FA2,$81DC 
    db $E0 
    dw $2FA0 
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_CrocomireCorpse_0:
    dw $0011,$0014 
    db $18 
    dw $6FA6,$0004 
    db $18 
    dw $6FBF,$000C 
    db $18 
    dw $6FAF,$81D4 
    db $10 
    dw $6FCA,$81E4 
    db $10 
    dw $6FC8,$81F4 
    db $10 
    dw $6FC6,$81D4 
    db $00 
    dw $6FC4,$81E4 
    db $00 
    dw $6FC2,$81F4 
    db $00 
    dw $6FC0,$01EC 
    db $E8 
    dw $6FB6,$81D4 
    db $F0 
    dw $6FAD,$81E4 
    db $F0 
    dw $6FAB,$81F4 
    db $F0 
    dw $6FA9,$8004 
    db $F0 
    dw $6FA7,$81F4 
    db $E0 
    dw $6FA4,$8004 
    db $E0 
    dw $6FA2,$8014 
    db $E0 
    dw $6FA0 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_CrocomireCorpse_A4E7F8:
    dw $000A,$0018 
    db $0C 
    dw $2F6B,$0010 
    db $0C 
    dw $2F6A,$8010 
    db $FC 
    dw $2F68,$8010 
    db $EC 
    dw $2F66,$8000 
    db $00 
    dw $2F64,$81F0 
    db $00 
    dw $2F62,$8000 
    db $F0 
    dw $2F64,$81F0 
    db $F0 
    dw $2F62,$81E0 
    db $FC 
    dw $2F80,$81E0 
    db $EC 
    dw $2F60 
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_CrocomireCorpse_1:
    dw $000A,$01E0 
    db $0C 
    dw $6F6B,$01E8 
    db $0C 
    dw $6F6A,$81E0 
    db $FC 
    dw $6F68,$81E0 
    db $EC 
    dw $6F66,$81F0 
    db $00 
    dw $6F64,$8000 
    db $00 
    dw $6F62,$81F0 
    db $F0 
    dw $6F64,$8000 
    db $F0 
    dw $6F62,$8010 
    db $FC 
    dw $6F80,$8010 
    db $EC 
    dw $6F60 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_CrocomireCorpse_A4E860:
    dw $000F,$8020 
    db $10 
    dw $2F8E,$8000 
    db $10 
    dw $2F8A,$8010 
    db $10 
    dw $2F8C,$01F8 
    db $18 
    dw $2F7B,$01F0 
    db $10 
    dw $2F0F,$01F8 
    db $10 
    dw $2F1F,$01E7 
    db $18 
    dw $6F7A,$01E0 
    db $18 
    dw $2F7A,$01D0 
    db $10 
    dw $2F88,$01D8 
    db $10 
    dw $2F89,$01E0 
    db $10 
    dw $2F98,$01E8 
    db $10 
    dw $2F99,$81F0 
    db $00 
    dw $2F86,$81E0 
    db $00 
    dw $2F84,$81D0 
    db $00 
    dw $2F82 
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_CrocomireCorpse_2:
    dw $000F,$81D0 
    db $10 
    dw $6F8E,$81F0 
    db $10 
    dw $6F8A,$81E0 
    db $10 
    dw $6F8C,$0000 
    db $18 
    dw $6F7B,$0008 
    db $10 
    dw $6F0F,$0000 
    db $10 
    dw $6F1F,$0011 
    db $18 
    dw $2F7A,$0018 
    db $18 
    dw $6F7A,$0028 
    db $10 
    dw $6F88,$0020 
    db $10 
    dw $6F89,$0018 
    db $10 
    dw $6F98,$0010 
    db $10 
    dw $6F99,$8000 
    db $00 
    dw $6F86,$8010 
    db $00 
    dw $6F84,$8020 
    db $00 
    dw $6F82 

Spritemap_CrocomireCorpse_3:
    dw $0002,$8000 
    db $F8 
    dw $2F6E,$81F0 
    db $F8 
    dw $2F6C 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_CrocomireCorpse_A4E906:
    dw $0002,$81F0 
    db $F8 
    dw $6F6E,$8000 
    db $F8 
    dw $6F6C 

UNUSED_Spritemap_CrocomireCorpse_A4E912:
    dw $0001,$81F8 
    db $F8 
    dw $6F60 
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_CrocomireCorpse_4:
    dw $0001,$81F8 
    db $F8 
    dw $6F80 

Spritemap_CrocomireCorpse_5:
    dw $0001,$81F8 
    db $F8 
    dw $6F62 

Spritemap_CrocomireCorpse_6:
    dw $0001,$81F8 
    db $F8 
    dw $6F64 

Spritemap_CrocomireCorpse_7:
    dw $0001,$81F8 
    db $F8 
    dw $6F66 

Spritemap_CrocomireCorpse_8:
    dw $0001,$81F8 
    db $F8 
    dw $6F68 

Spritemap_CrocomireCorpse_9:
    dw $0002,$01F8 
    db $FC 
    dw $6F6B,$0000 
    db $FC 
    dw $6F6A 

Spritemap_CrocomireCorpse_A:
    dw $0003,$0000 
    db $04 
    dw $6F88,$01F8 
    db $04 
    dw $6F89,$81F8 
    db $F4 
    dw $6F82 

Spritemap_CrocomireCorpse_B:
    dw $0005,$01F9 
    db $08 
    dw $2F7A,$0000 
    db $08 
    dw $6F7A,$0000 
    db $00 
    dw $6F98,$01F8 
    db $00 
    dw $6F99,$81F8 
    db $F0 
    dw $6F84 

Spritemap_CrocomireCorpse_C:
    dw $0004,$0000 
    db $05 
    dw $6F0F,$01F8 
    db $0D 
    dw $6F7B,$01F8 
    db $05 
    dw $6F1F,$81F8 
    db $F5 
    dw $6F86 

Spritemap_CrocomireCorpse_D:
    dw $0001,$81F8 
    db $F8 
    dw $6F8A 

Spritemap_CrocomireCorpse_E:
    dw $0001,$81F8 
    db $F8 
    dw $6F8C 

Spritemap_CrocomireCorpse_F:
    dw $0001,$81F8 
    db $F8 
    dw $6F8E 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_CrocomireCorpse_A4E99F:
    dw $0009,$81C3 
    db $1A 
    dw $20E4,$81B3 
    db $1E 
    dw $2100,$0000 
    db $07 
    dw $2108,$01F0 
    db $FF 
    dw $20F6,$81F0 
    db $07 
    dw $2106,$81F8 
    db $F7 
    dw $20E7,$81EC 
    db $0B 
    dw $20E0,$81DE 
    db $12 
    dw $20E0,$81D0 
    db $19 
    dw $20E0 

UNUSED_Spritemap_CrocomireCorpse_A4E9CE:
    dw $0009,$81B1 
    db $13 
    dw $20E4,$81A1 
    db $13 
    dw $2100,$01F8 
    db $09 
    dw $20FF,$01F0 
    db $F9 
    dw $20EF,$81E8 
    db $01 
    dw $20ED,$81F8 
    db $F9 
    dw $210D,$81DE 
    db $05 
    dw $2102,$81CE 
    db $0F 
    dw $2104,$81C0 
    db $0F 
    dw $2102 

UNUSED_Spritemap_CrocomireCorpse_A4E9FD:
    dw $0007,$81CC 
    db $1C 
    dw $20E4,$81BC 
    db $1E 
    dw $2100,$81F8 
    db $08 
    dw $2109,$81F8 
    db $F8 
    dw $20E9,$81F6 
    db $0D 
    dw $20E0,$81E8 
    db $14 
    dw $20E0,$81DA 
    db $1B 
    dw $20E0 

UNUSED_Spritemap_CrocomireCorpse_A4EA22:
    dw $0009,$0000 
    db $08 
    dw $60FF,$0008 
    db $F8 
    dw $60EF,$8008 
    db $00 
    dw $60ED,$81F8 
    db $F8 
    dw $610D,$81D5 
    db $11 
    dw $20E4,$81C5 
    db $11 
    dw $2100,$8002 
    db $03 
    dw $2102,$81F2 
    db $0D 
    dw $2104,$81E4 
    db $0D 
    dw $2102 

UNUSED_Spritemap_CrocomireCorpse_A4EA51:
    dw $0007,$81C0 
    db $0C 
    dw $20E4,$81B0 
    db $0C 
    dw $2100,$81F8 
    db $08 
    dw $2109,$81F8 
    db $F8 
    dw $20E9,$81F0 
    db $0C 
    dw $20E2,$81E0 
    db $0C 
    dw $20E2,$81D0 
    db $0C 
    dw $20E2 

UNUSED_Spritemap_CrocomireCorpse_A4EA76:
    dw $0008,$0002 
    db $09 
    dw $20DF,$01FA 
    db $09 
    dw $20DE,$01F2 
    db $09 
    dw $20DD,$01EA 
    db $09 
    dw $20DC,$01E2 
    db $09 
    dw $20DB,$81F2 
    db $F9 
    dw $212D,$81F6 
    db $F9 
    dw $214B,$8001 
    db $F9 
    dw $212B 

UNUSED_Spritemap_CrocomireCorpse_A4EAA0:
    dw $0008,$0005 
    db $09 
    dw $20DF,$01FD 
    db $09 
    dw $20DE,$01F5 
    db $09 
    dw $20DD,$01ED 
    db $09 
    dw $20DC,$01E5 
    db $09 
    dw $20DB,$81F5 
    db $F9 
    dw $212D,$81F7 
    db $F9 
    dw $214B,$8001 
    db $F9 
    dw $212B 

UNUSED_Spritemap_CrocomireCorpse_A4EACA:
    dw $0008,$0008 
    db $09 
    dw $20DF,$0000 
    db $09 
    dw $20DE,$01F8 
    db $09 
    dw $20DD,$01F0 
    db $09 
    dw $20DC,$01E8 
    db $09 
    dw $20DB,$81F8 
    db $F9 
    dw $212D,$81F9 
    db $F9 
    dw $214B,$8000 
    db $F9 
    dw $212B 

UNUSED_Spritemap_CrocomireCorpse_A4EAF4:
    dw $0008,$000C 
    db $09 
    dw $20DF,$0004 
    db $09 
    dw $20DE,$01FC 
    db $09 
    dw $20DD,$01F4 
    db $09 
    dw $20DC,$01EC 
    db $09 
    dw $20DB,$81FC 
    db $F9 
    dw $212D,$81FC 
    db $F9 
    dw $214B,$8000 
    db $F9 
    dw $212B 

UNUSED_Spritemap_CrocomireCorpse_A4EB1E:
    dw $0008,$8003 
    db $F9 
    dw $212D,$8002 
    db $F9 
    dw $614B,$0011 
    db $09 
    dw $20DF,$0009 
    db $09 
    dw $20DE,$0001 
    db $09 
    dw $20DD,$01F9 
    db $09 
    dw $20DC,$01F1 
    db $09 
    dw $20DB,$8001 
    db $F9 
    dw $612B 

UNUSED_Spritemap_CrocomireCorpse_A4EB48:
    dw $0008,$8009 
    db $F9 
    dw $212D,$8006 
    db $F9 
    dw $614B,$0018 
    db $09 
    dw $20DF,$0010 
    db $09 
    dw $20DE,$0008 
    db $09 
    dw $20DD,$0000 
    db $09 
    dw $20DC,$01F8 
    db $09 
    dw $20DB,$8001 
    db $F9 
    dw $612B 

UNUSED_Spritemap_CrocomireCorpse_A4EB72:
    dw $0008,$8010 
    db $F9 
    dw $212D,$800B 
    db $F9 
    dw $614B,$0020 
    db $09 
    dw $20DF,$0018 
    db $09 
    dw $20DE,$0010 
    db $09 
    dw $20DD,$0008 
    db $09 
    dw $20DC,$0000 
    db $09 
    dw $20DB,$8003 
    db $F9 
    dw $612B 

UNUSED_Spritemap_CrocomireCorpse_A4EB9C:
    dw $0008,$8009 
    db $F8 
    dw $212D,$8006 
    db $F8 
    dw $614B,$0018 
    db $09 
    dw $20DF,$0010 
    db $08 
    dw $20DE,$0008 
    db $08 
    dw $20DD,$0000 
    db $09 
    dw $20DC,$01F8 
    db $09 
    dw $20DB,$8001 
    db $F9 
    dw $612B 

UNUSED_Spritemap_CrocomireCorpse_A4EBC6:
    dw $0008,$8003 
    db $F5 
    dw $212D,$8002 
    db $F5 
    dw $614B,$0011 
    db $06 
    dw $20DF,$0009 
    db $05 
    dw $20DE,$0001 
    db $05 
    dw $20DD,$01F9 
    db $07 
    dw $20DC,$01F1 
    db $07 
    dw $20DB,$8001 
    db $F9 
    dw $612B 

UNUSED_Spritemap_CrocomireCorpse_A4EBF0:
    dw $0008,$000C 
    db $06 
    dw $20DF,$0004 
    db $05 
    dw $20DE,$01FC 
    db $05 
    dw $20DD,$01F4 
    db $07 
    dw $20DC,$01EC 
    db $07 
    dw $20DB,$81FC 
    db $F5 
    dw $212D,$81FC 
    db $F5 
    dw $214B,$8000 
    db $F9 
    dw $212B 

UNUSED_Spritemap_CrocomireCorpse_A4EC1A:
    dw $0008,$0008 
    db $06 
    dw $20DF,$0000 
    db $05 
    dw $20DE,$01F8 
    db $05 
    dw $20DD,$01F0 
    db $07 
    dw $20DC,$01E8 
    db $07 
    dw $20DB,$81F8 
    db $F5 
    dw $212D,$81F9 
    db $F5 
    dw $214B,$8000 
    db $F9 
    dw $212B 

UNUSED_Spritemap_CrocomireCorpse_A4EC44:
    dw $0008,$0005 
    db $07 
    dw $20DF,$01FD 
    db $06 
    dw $20DE,$01F5 
    db $06 
    dw $20DD,$01ED 
    db $08 
    dw $20DC,$01E5 
    db $08 
    dw $20DB,$81F5 
    db $F6 
    dw $212D,$81F7 
    db $F6 
    dw $214B,$8001 
    db $F9 
    dw $212B 

UNUSED_Spritemap_CrocomireCorpse_A4EC6E:
    dw $0008,$0002 
    db $08 
    dw $20DF,$01FA 
    db $07 
    dw $20DE,$01F2 
    db $07 
    dw $20DD,$01EA 
    db $08 
    dw $20DC,$01E2 
    db $08 
    dw $20DB,$81F2 
    db $F7 
    dw $212D,$81F6 
    db $F7 
    dw $214B,$8001 
    db $F9 
    dw $212B 

UNUSED_Spritemap_CrocomireCorpse_A4EC98:
    dw $0008,$000C 
    db $04 
    dw $20DF,$0004 
    db $05 
    dw $20DE,$01FC 
    db $05 
    dw $20DD,$01F4 
    db $05 
    dw $20DC,$01EC 
    db $05 
    dw $20DB,$81FC 
    db $F5 
    dw $212D,$81FC 
    db $F5 
    dw $214B,$8000 
    db $F9 
    dw $212B 

UNUSED_Spritemap_CrocomireCorpse_A4ECC2:
    dw $0008,$000C 
    db $04 
    dw $20DF,$0004 
    db $05 
    dw $20DE,$01FC 
    db $05 
    dw $20DD,$01F4 
    db $05 
    dw $20DC,$01EC 
    db $05 
    dw $20DB,$81FC 
    db $F5 
    dw $212D,$81FC 
    db $F3 
    dw $214B,$8000 
    db $F5 
    dw $212B 

UNUSED_Spritemap_CrocomireCorpse_A4ECEC:
    dw $0008,$000C 
    db $04 
    dw $20DF,$0004 
    db $05 
    dw $20DE,$01FC 
    db $05 
    dw $20DD,$01F4 
    db $05 
    dw $20DC,$01EC 
    db $05 
    dw $20DB,$81FC 
    db $F5 
    dw $212D,$81FC 
    db $F1 
    dw $214B,$8000 
    db $F1 
    dw $212B 
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_CrocomireCorpse_10:
    dw $0009,$802D 
    db $1A 
    dw $62E4,$803D 
    db $1E 
    dw $6300,$01F8 
    db $07 
    dw $6308,$0008 
    db $FF 
    dw $62F6,$8000 
    db $07 
    dw $6306,$81F8 
    db $F7 
    dw $62E7,$8004 
    db $0B 
    dw $62E0,$8012 
    db $12 
    dw $62E0,$8020 
    db $19 
    dw $62E0 

Spritemap_CrocomireCorpse_11:
    dw $0009,$803F 
    db $13 
    dw $62E4,$804F 
    db $13 
    dw $6300,$0000 
    db $09 
    dw $62FF,$0008 
    db $F9 
    dw $62EF,$8008 
    db $01 
    dw $62ED,$81F8 
    db $F9 
    dw $630D,$8012 
    db $05 
    dw $6302,$8022 
    db $0F 
    dw $6304,$8030 
    db $0F 
    dw $6302 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_CrocomireCorpse_A4ED74:
    dw $0007,$8024 
    db $1C 
    dw $62E4,$8034 
    db $1E 
    dw $6300,$81F8 
    db $08 
    dw $6309,$81F8 
    db $F8 
    dw $62E9,$81FA 
    db $0D 
    dw $62E0,$8008 
    db $14 
    dw $62E0,$8016 
    db $1B 
    dw $62E0 

UNUSED_Spritemap_CrocomireCorpse_A4ED99:
    dw $0009,$01F8 
    db $08 
    dw $22FF,$01F0 
    db $F8 
    dw $22EF,$81E8 
    db $00 
    dw $22ED,$81F8 
    db $F8 
    dw $230D,$801B 
    db $11 
    dw $62E4,$802B 
    db $11 
    dw $6300,$81EE 
    db $03 
    dw $6302,$81FE 
    db $0D 
    dw $6304,$800C 
    db $0D 
    dw $6302 

UNUSED_Spritemap_CrocomireCorpse_A4EDC8:
    dw $0007,$81E6 
    db $FA 
    dw $20EB,$81F6 
    db $FA 
    dw $210B,$81AD 
    db $FA 
    dw $20E4,$819D 
    db $FA 
    dw $2100,$81DD 
    db $FA 
    dw $20E2,$81CD 
    db $FA 
    dw $20E2,$81BD 
    db $FA 
    dw $20E2 
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_CrocomireCorpse_12:
    dw $0009,$0000 
    db $F0 
    dw $E2FF,$0008 
    db $00 
    dw $E2EF,$8008 
    db $F0 
    dw $E2ED,$81F8 
    db $F8 
    dw $E30D,$803D 
    db $DB 
    dw $62E4,$804D 
    db $DB 
    dw $6300,$8010 
    db $EC 
    dw $E302,$8020 
    db $E2 
    dw $E304,$802E 
    db $E2 
    dw $E302 

Spritemap_CrocomireCorpse_13:
    dw $0007,$800A 
    db $FA 
    dw $62EB,$81FA 
    db $FA 
    dw $630B,$8043 
    db $FA 
    dw $62E4,$8053 
    db $FA 
    dw $6300,$8013 
    db $FA 
    dw $62E2,$8023 
    db $FA 
    dw $62E2,$8033 
    db $FA 
    dw $62E2 

Spritemap_CrocomireCorpse_14:
    dw $0009,$01F8 
    db $08 
    dw $22FF,$01F0 
    db $F8 
    dw $22EF,$81E8 
    db $00 
    dw $22ED,$81F8 
    db $F8 
    dw $230D,$801B 
    db $F6 
    dw $62E4,$802B 
    db $F6 
    dw $6300,$81EE 
    db $07 
    dw $E302,$81FE 
    db $FD 
    dw $E304,$800C 
    db $FD 
    dw $E302 

Spritemap_CrocomireCorpse_15:
    dw $0007,$81F8 
    db $08 
    dw $6309,$81F8 
    db $F8 
    dw $62E9,$802A 
    db $FA 
    dw $62E4,$803A 
    db $FA 
    dw $6300,$81FD 
    db $0B 
    dw $E302,$800D 
    db $01 
    dw $E304,$801B 
    db $01 
    dw $E302 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_CrocomireCorpse_A4EE95:
    dw $0009,$0000 
    db $08 
    dw $60FF,$0008 
    db $F8 
    dw $60EF,$8008 
    db $00 
    dw $60ED,$81F8 
    db $F8 
    dw $610D,$81D5 
    db $F6 
    dw $20E4,$81C5 
    db $F6 
    dw $2100,$8002 
    db $07 
    dw $A102,$81F2 
    db $FD 
    dw $A104,$81E4 
    db $FD 
    dw $A102 

UNUSED_Spritemap_CrocomireCorpse_A4EEC4:
    dw $0009,$01F8 
    db $F0 
    dw $A0FF,$01F0 
    db $00 
    dw $A0EF,$81E8 
    db $F0 
    dw $A0ED,$81F8 
    db $F8 
    dw $A10D,$81B3 
    db $DB 
    dw $20E4,$81A3 
    db $DB 
    dw $2100,$81E0 
    db $EC 
    dw $A102,$81D0 
    db $E2 
    dw $A104,$81C2 
    db $E2 
    dw $A102 

UNUSED_Spritemap_CrocomireCorpse_A4EEF3:
    dw $0004,$0000 
    db $F8 
    dw $60D0,$0000 
    db $00 
    dw $E0D0,$01F8 
    db $00 
    dw $A0D0,$01F8 
    db $F8 
    dw $20D0 

UNUSED_Spritemap_CrocomireCorpse_A4EF09:
    dw $0004,$0000 
    db $F8 
    dw $60D1,$0000 
    db $00 
    dw $E0D1,$01F8 
    db $00 
    dw $A0D1,$01F8 
    db $F8 
    dw $20D1 

UNUSED_Spritemap_CrocomireCorpse_A4EF1F:
    dw $0004,$0000 
    db $00 
    dw $E0D2,$0000 
    db $F8 
    dw $60D2,$01F8 
    db $00 
    dw $A0D2,$01F8 
    db $F8 
    dw $20D2 

UNUSED_Spritemap_CrocomireCorpse_A4EF35:
    dw $0004,$0000 
    db $00 
    dw $E0D3,$0000 
    db $F8 
    dw $60D3,$01F8 
    db $00 
    dw $A0D3,$01F8 
    db $F8 
    dw $20D3 

UNUSED_Spritemap_CrocomireCorpse_A4EF4B:
    dw $0004,$0008 
    db $00 
    dw $20D7,$0000 
    db $00 
    dw $20D6,$01F8 
    db $00 
    dw $20D5,$01F8 
    db $F8 
    dw $20D4 

UNUSED_Spritemap_CrocomireCorpse_A4EF61:
    dw $0003,$0008 
    db $00 
    dw $20DA,$0000 
    db $00 
    dw $20D9,$01F8 
    db $00 
    dw $20D8 

UNUSED_Spritemap_CrocomireCorpse_A4EF72:
    dw $0004,$0008 
    db $F8 
    dw $A0D7,$0000 
    db $F8 
    dw $A0D6,$01F8 
    db $F8 
    dw $A0D5,$01F8 
    db $00 
    dw $A0D4 

UNUSED_Spritemap_CrocomireCorpse_A4EF88:
    dw $0003,$0008 
    db $F8 
    dw $A0DA,$0000 
    db $F8 
    dw $A0D9,$01F8 
    db $F8 
    dw $A0D8 

UNUSED_Spritemap_CrocomireCorpse_A4EF99:
    dw $0001,$81F8 
    db $F8 
    dw $21CC 

UNUSED_Spritemap_CrocomireCorpse_A4EFA0:
    dw $0006,$01E0 
    db $00 
    dw $21DE,$01E0 
    db $F8 
    dw $21CE,$01E8 
    db $00 
    dw $215D,$01E8 
    db $F8 
    dw $214D,$81F0 
    db $F0 
    dw $21E6,$8000 
    db $F0 
    dw $21E0 

UNUSED_Spritemap_CrocomireCorpse_A4EFC0:
    dw $0006,$01E0 
    db $00 
    dw $21DF,$01E0 
    db $F8 
    dw $21CF,$01E8 
    db $00 
    dw $215D,$01E8 
    db $F8 
    dw $214D,$81F0 
    db $F0 
    dw $21E6,$8000 
    db $F0 
    dw $21E0 

UNUSED_Spritemap_CrocomireCorpse_A4EFE0:
    dw $0006,$01E8 
    db $00 
    dw $215E,$01E8 
    db $F8 
    dw $214E,$01E0 
    db $00 
    dw $213F,$01E0 
    db $F8 
    dw $212F,$81F0 
    db $F0 
    dw $21E6,$8000 
    db $F0 
    dw $21E0 

UNUSED_Spritemap_CrocomireCorpse_A4F000:
    dw $0004,$8000 
    db $F0 
    dw $21E0,$81F0 
    db $F0 
    dw $21E8,$01E8 
    db $00 
    dw $215F,$01E8 
    db $F8 
    dw $214F 

UNUSED_Spritemap_CrocomireCorpse_A4F016:
    dw $0002,$8000 
    db $F0 
    dw $21E2,$81F0 
    db $F0 
    dw $21EA 

UNUSED_Spritemap_CrocomireCorpse_A4F022:
    dw $0001,$8000 
    db $F0 
    dw $21E4 

UNUSED_ExtendedTilemap_CrocomireCorpse_A4F029:
    dw $FFFE,$2000,$000C,$01FF,$01FF,$01FF,$01FF,$01FF 
    dw $01FF,$01FF,$01FF,$01FF,$01FF,$01FF,$01FF,$2040 
    dw $000C,$01FF,$01FF,$1CA2,$1CA3,$1CA4,$1CA5,$1CA6 
    dw $1CA7,$1CA8,$1CA9,$1CAA,$01FF,$2080,$000C,$1CB0 
    dw $1CB1,$1CB2,$1CB3,$1CB4,$1CB5,$1CB6,$1CB7,$1CB8 
    dw $1CB9,$1CBA,$1CBB,$20C0,$000C,$1CAC,$1CAD,$1CAE 
    dw $1CAF,$1CC0,$1CC1,$1CC2,$1CC3,$1CC4,$1CC5,$1CC6 
    dw $1CC7,$2100,$000C,$1CBC,$1CBD,$1CBE,$1CBF,$1CD0 
    dw $1CD1,$1CD2,$1CD3,$1CD4,$1CD5,$1CD6,$1CD7,$2140 
    dw $000C,$01FF,$01FF,$01FF,$01FF,$1CCA,$1CCB,$1CCC 
    dw $1CCD,$1CCE,$1CCF,$1C8B,$1C8C,$2180,$000C,$01FF 
    dw $01FF,$1CD8,$1CD9,$1CDA,$1CDB,$1CDC,$1CDD,$1CDE 
    dw $1CDF,$1C9B,$1C9C,$21C0,$000C,$01FF,$01FF,$1C43 
    dw $1C44,$1C45,$1C46,$1C8D,$1C8E,$1C8F,$1C9D,$1C9E 
    dw $1C9F,$FFFF 

UNUSED_ExtendedTilemap_CrocomireCorpse_A4F10D:
    dw $FFFE,$2002,$0007,$1CE0,$1CE1,$1CE2,$1CE3,$1CE4 
    dw $1CE5,$1CE6,$2042,$000A,$1CF0,$1CF1,$1CF2,$1CF3 
    dw $1CF4,$1CF5,$1CF6,$1CF7,$1CF8,$01FF,$2080,$000C 
    dw $01FF,$01FF,$1CE9,$1CEA,$1CEB,$1CEC,$1CED,$1CEE 
    dw $1CEF,$1D00,$1D01,$01FF,$20C0,$000C,$01FF,$01FF 
    dw $01FF,$1CFA,$1CFB,$1CFC,$1CFD,$1CFE,$1CFF,$1D10 
    dw $1D11,$1D12,$2100,$000C,$01FF,$01FF,$01FF,$01FF 
    dw $1D03,$1D04,$1D05,$1D06,$1D07,$1D08,$1D09,$1D0A 
    dw $2148,$0008,$01FF,$1D14,$1D15,$1D16,$1D17,$1D18 
    dw $1D19,$1D1A,$2184,$000A,$1D0C,$1D0D,$1D0E,$1D0F 
    dw $1D20,$1D21,$1D22,$1D23,$1D24,$1D25,$21C4,$000A 
    dw $1D1C,$1D1D,$1D1E,$1D1F,$1D30,$1D31,$1D32,$1D33 
    dw $1D34,$1D35,$FFFF 

UNUSED_ExtendedTilemap_CrocomireCorpse_A4F1D3:
    dw $FFFE,$2002,$0007,$01FF,$01FF,$01FF,$01FF,$01FF 
    dw $01FF,$01FF,$2042,$000A,$01FF,$01FF,$01FF,$01FF 
    dw $1C02,$1C03,$1C04,$1C05,$1C06,$1C07,$2084,$000A 
    dw $01FF,$1C10,$1C11,$1C12,$1C13,$1C14,$1C15,$1C16 
    dw $1C17,$1C18,$20C2,$000B,$1C0A,$1C0B,$1C0C,$1C0D 
    dw $1C0E,$1C0F,$1C20,$1C21,$1C22,$1C23,$1C24,$2100 
    dw $000C,$1C19,$1C1A,$1C1B,$1C1C,$1C1D,$1C1E,$1C1F 
    dw $1C30,$1C31,$1C32,$1C33,$1C34,$2140,$000C,$1C25 
    dw $1C26,$1C27,$1C28,$1C29,$1C2A,$1C2B,$1C2C,$1C2D 
    dw $1C2E,$1C2F,$1C40,$2180,$000C,$1C35,$1C36,$1C37 
    dw $1C38,$1C39,$1C3A,$1C3B,$1C3C,$1C3D,$1C3E,$1C3F 
    dw $1C50,$21C0,$0001,$1C00,$21C4,$000A,$1C43,$1C44 
    dw $1C45,$1C46,$1C47,$1C48,$1C49,$1C4A,$1C4B,$1C4C 
    dw $FFFF 

UNUSED_ExtendedTilemap_CrocomireCorpse_A4F2A5:
    dw $FFFE,$2246,$0004,$1C4F,$1C60,$1C61,$1C62,$2286 
    dw $0004,$1C5F,$1C70,$1C71,$1C72,$22C6,$0004,$1C6A 
    dw $1C6B,$1C6C,$1C6D,$2306,$0004,$1C7A,$1C7B,$1C7C 
    dw $1C7D,$FFFF 

UNUSED_ExtendedTilemap_CrocomireCorpse_A4F2D9:
    dw $FFFE,$2246,$0004,$1D46,$1D47,$1D48,$1D49,$2286 
    dw $0004,$1D56,$1D57,$1D58,$1D59,$22C6,$0004,$1D4A 
    dw $1D4B,$1D4C,$1D4D,$2306,$0004,$1D5A,$1D5B,$1D5C 
    dw $1D5D,$FFFF 

UNUSED_ExtendedTilemap_CrocomireCorpse_A4F30D:
    dw $FFFE,$2246,$0004,$1D4E,$1D4F,$1D02,$1D0B,$2286 
    dw $0004,$1D13,$1D1B,$1C42,$1C51,$22C6,$0004,$1CA0 
    dw $1CA1,$1CAB,$1CF9,$2306,$0004,$1C01,$1C08,$1C09 
    dw $1C41,$FFFF 

UNUSED_ExtendedTilemap_CrocomireCorpse_A4F341:
    dw $FFFE,$2354,$0006,$1D40,$1D41,$1D42,$1D43,$1D44 
    dw $1D45,$2394,$0006,$1D50,$1D51,$1D52,$1D53,$1D54 
    dw $1D55,$FFFF 

UNUSED_ExtendedTilemap_CrocomireCorpse_A4F365:
    dw $FFFE,$2354,$0006,$1D26,$1D27,$1D28,$1D29,$1D2A 
    dw $1D2B,$2394,$0006,$1D36,$1D37,$1D38,$1D39,$1D3A 
    dw $1D3B,$FFFF 

UNUSED_ExtendedTilemap_CrocomireCorpse_A4F389:
    dw $FFFE,$2354,$0006,$1D2C,$1D2D,$1D2E,$1D2F,$1CC8 
    dw $1CC9,$2394,$0006,$1D3C,$1D3D,$1D3E,$1D3F,$1CE7 
    dw $1CE8,$FFFF 

UNUSED_ExtendedTilemap_CrocomireCorpse_A4F3AD:
    dw $FFFE,$2040,$000C,$01FF,$01FF,$01FF,$01FF,$01FF 
    dw $1C02,$1C03,$1C04,$1C05,$1C06,$1C07,$01FF,$2080 
    dw $000C,$01FF,$01FF,$01FF,$1C10,$1C11,$1C12,$1C13 
    dw $1C14,$1C15,$1C16,$1C17,$1C18,$20C0,$000C,$01FF 
    dw $1C0A,$1C0B,$1C0C,$1C0D,$1C0E,$1C0F,$1C20,$1C21 
    dw $1C22,$1C23,$1C24,$2100,$000C,$1C19,$1C1A,$1C1B 
    dw $1C1C,$1C1D,$1C1E,$1C1F,$1C30,$1C31,$1C32,$1C33 
    dw $1C34,$2140,$000C,$1C25,$1C26,$1C27,$1C28,$1C29 
    dw $1C2A,$1C2B,$1C2C,$1C2D,$1C2E,$1C2F,$1C40,$2180 
    dw $000C,$1C35,$1C36,$1C37,$1C38,$1C39,$1C3A,$1C3B 
    dw $1C3C,$1C3D,$1C3E,$1C3F,$1C50,$21C0,$000C,$1C00 
    dw $01FF,$1C43,$1C44,$1C45,$1C46,$1C47,$1C48,$1C49 
    dw $1C4A,$1C4B,$1C4C,$2200,$000C,$01FF,$01FF,$1C53 
    dw $1C54,$1C55,$1C56,$1C57,$1C58,$1C59,$1C5A,$1C5B 
    dw $1C5C,$2240,$000C,$01FF,$1C4D,$1C4E,$1C4F,$1C60 
    dw $1C61,$1C62,$1C63,$1C64,$1C65,$1C66,$1C67,$2280 
    dw $000C,$01FF,$1C5D,$1C5E,$1C5F,$1C70,$1C71,$1C72 
    dw $1C73,$1C74,$1C75,$1C76,$1C77,$22C0,$000C,$01FF 
    dw $1C68,$1C69,$1C6A,$1C6B,$1C6C,$1C6D,$1C6E,$1C6F 
    dw $1C80,$1C81,$01FF,$2300,$000C,$01FF,$1C78,$1C79 
    dw $1C7A,$1C7B,$1C7C,$1C7D,$1C7E,$1C7F,$1C90,$1C91 
    dw $01FF,$2340,$000C,$01FF,$1C82,$1C83,$1C84,$1C85 
    dw $1C86,$1C87,$1C88,$1C89,$1C8A,$0140,$0141,$2380 
    dw $000C,$01FF,$01FF,$1C93,$1C94,$1C95,$1C96,$1C97 
    dw $1C98,$1C99,$1C9A,$0150,$0151,$FFFF 

UNUSED_ExtendedTilemap_CrocomireCorpse_A4F539:
    dw $FFFE,$2202,$000B,$01FF,$1C53,$1C54,$1C55,$1C56 
    dw $1C57,$1C58,$1C59,$1C5A,$1C5B,$1C5C,$2242,$000B 
    dw $1C4D,$1C4E,$1C4F,$1C60,$1C61,$1C62,$1C63,$1C64 
    dw $1C65,$1C66,$1C67,$2282,$000B,$1C5D,$1C5E,$1C5F 
    dw $1C70,$1C71,$1C72,$1C73,$1C74,$1C75,$1C76,$1C77 
    dw $22C2,$000B,$1C68,$1C69,$1C6A,$1C6B,$1C6C,$1C6D 
    dw $1C6E,$1C6F,$1C80,$1C81,$01FF,$2302,$000B,$1C78 
    dw $1C79,$1C7A,$1C7B,$1C7C,$1C7D,$1C7E,$1C7F,$1C90 
    dw $1C91,$01FF,$2342,$000B,$1C82,$1C83,$1C84,$1C85 
    dw $1C86,$1C87,$1C88,$1C89,$1C8A,$0140,$0141,$2382 
    dw $000B,$01FF,$1C93,$1C94,$1C95,$1C96,$1C97,$1C98 
    dw $1C99,$1C9A,$0150,$0151,$FFFF 
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_CrocomireCorpse_16:
    dw $0001,$01FC 
    db $FC 
    dw $3A25 

Spritemap_CrocomireCorpse_17:
    dw $0003,$0000 
    db $F8 
    dw $3A25,$01FA 
    db $F6 
    dw $3A25,$01FC 
    db $FB 
    dw $3A25 

Spritemap_CrocomireCorpse_18:
    dw $0003,$0001 
    db $F7 
    dw $3A25,$01F9 
    db $F4 
    dw $3A25,$01FB 
    db $FA 
    dw $3A25 

Spritemap_CrocomireCorpse_19:
    dw $0003,$0001 
    db $F5 
    dw $3A43,$01FC 
    db $F8 
    dw $3A43,$01FA 
    db $F1 
    dw $3A43 

Spritemap_CrocomireCorpse_1A:
    dw $0003,$0001 
    db $F3 
    dw $3A43,$01FC 
    db $F5 
    dw $3A43,$01FA 
    db $EE 
    dw $3A43 

Spritemap_CrocomireCorpse_1B:
    dw $0003,$0000 
    db $F0 
    dw $3A40,$01FC 
    db $F4 
    dw $3A40,$01FA 
    db $ED 
    dw $3A40 

Spritemap_CrocomireCorpse_1C:
    dw $0003,$0000 
    db $EE 
    dw $3A40,$01FC 
    db $F2 
    dw $3A40,$01FA 
    db $EC 
    dw $3A40 

Spritemap_CrocomireCorpse_1D:
    dw $0002,$0000 
    db $EC 
    dw $3A40,$01FC 
    db $F0 
    dw $3A40 

Spritemap_CrocomireCorpse_1E:
    dw $0001,$01FC 
    db $EE 
    dw $3A40 

Spritemap_CrocomireCorpse_1F:
    dw $0001,$01FC 
    db $EE 
    dw $0A40 

InitAI_CrocomireTongue:
    LDX.W $079F 
    LDA.L $7ED828,X 
    BIT.W #$0002 
    BNE .dead 
    LDX.W $0E54 
    LDA.W #InstList_CrocomireTongue_Fight : STA.W $0F92,X 
    LDA.W $0F88,X 
    ORA.W #$0404 
    STA.W $0F88,X 
    LDA.W #$0001 : STA.W $0F94,X 
    LDA.W #$0017 : STA.W $0FA8,X 
    LDA.W #$0E00 : STA.W $0F96,X 
    RTL 


.dead:
    LDX.W $0E54 
    LDA.W $0F86,X 
    ORA.W #$0300 
    AND.W #$DFFF 
    STA.W $0F86,X 
    RTL 


MainAI_CrocomireTongue:
    LDX.W $0E54 
    RTL 


RTL_A4F6BF:
    RTL 


Freespace_BankA4_F6C0: 
; $940 bytes
