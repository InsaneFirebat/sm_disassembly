
org $A78000


CommonA7_GrappleAI_NoInteraction:
    JSL.L GrappleAI_SwitchEnemyAIToMainAI 
    RTL 


CommonA7_GrappleAI_SamusLatchesOn:
    JSL.L GrappleAI_SamusLatchesOnWithGrapple 
    RTL 


CommonA7_GrappleAI_KillEnemy:
    JSL.L GrappleAI_EnemyGrappleDeath 
    RTL 


CommonA7_GrappleAI_CancelGrappleBeam:
    JSL.L GrappleAI_SwitchToFrozenAI 
    RTL 


CommonA7_GrappleAI_SamusLatchesOn_NoInvincibility:
    JSL.L GrappleAI_SamusLatchesOnWithGrapple_NoInvincibility 
    RTL 


UNUSED_CommonA7_GrappleAI_SamusLatchesOn_ParalyzeEnemy_A78019:
    JSL.L GrappleAI_SamusLatchesOnWithGrapple_ParalyzeEnemy 
    RTL 


CommonA7_GrappleAI_HurtSamus:
    JSL.L GrappleAI_SwitchToFrozenAI_duplicate 
    RTL 


CommonA7_NormalEnemyTouchAI:
    JSL.L NormalEnemyTouchAI 
    RTL 


CommonA7_NormalTouchAI_NoDeathCheck:
    JSL.L NormalEnemyTouchAI_NoDeathCheck_External 
    RTL 


CommonA7_NormalEnemyShotAI:
    JSL.L NormalEnemyShotAI 
    RTL 


CommonA7_NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic:
    JSL.L NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External 
    RTL 


CommonA7_NormalEnemyPowerBombAI:
    JSL.L NormalEnemyPowerBombAI 
    RTL 


CommonA7_NormalEnemyPowerBombAI_NoDeathCheck:
    JSL.L NormalEnemyPowerBombAI_NoDeathCheck_External 
    RTL 


CommonA7_NormalEnemyFrozenAI:
    JSL.L NormalEnemyFrozenAI 
    RTL 


CommonA7_CreateADudShot:
    JSL.L CreateADudShot 
    RTL 


RTS_A7804B:
    RTS 


RTL_A7804C:
    RTL 


Spritemap_CommonA7_Nothing:
    dw $0000 

ExtendedSpritemap_CommonA7_Nothing:
    dw $0001,$0000,$0000 
    dw Spritemap_CommonA7_Nothing 
    dw Hitbox_CommonA7_Nothing 

Hitbox_CommonA7_Nothing:
    dw $0001,$0000,$0000,$0000,$0000 
    dw CommonA7_NormalEnemyTouchAI 
    dw CommonA7_NormalEnemyShotAI 

InstList_CommonA7_DeleteEnemy:
    dw Instruction_CommonA7_DeleteEnemy 

NOPNOP_A78069:
    NOP #2
    Instruction_CommonA7_Enemy0FB2_InY:
    LDA.W $0000,Y : STA.W $0FB2,X 
    INY #2
    RTL 


Instruction_CommonA7_SetEnemy0FB2ToRTS:
    LDA.W #RTS_A7807B : STA.W $0FB2,X 
    RTL 


RTS_A7807B:
    RTS 


Instruction_CommonA7_DeleteEnemy:
    LDA.W $0F86,X : ORA.W #$0200 : STA.W $0F86,X 
    PLA : PEA.W ProcessEnemyInstructions_return-1 
    RTL 


Instruction_CommonA7_CallFunctionInY:
    LDA.W $0000,Y : STA.B $12 
    PHY : PHX : PEA.W .manualReturn-1 
    JMP.W ($0012) 


.manualReturn:
    PLX : PLY 
    INY #2
    RTL 


Instruction_CommonA7_CallFunctionInY_WithA:
    LDA.W $0000,Y : STA.B $12 
    LDA.W $0002,Y 
    PHY : PHX : PEA.W .manualReturn-1 
    JMP.W ($0012) 


.manualReturn:
    PLX : PLY 
    TYA 
    CLC : ADC.W #$0004 : TAY 
    RTL 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Instruction_CommonA7_CallExternalFunctionInY_A780B5:
    LDA.W $0000,Y : STA.B $12 
    LDA.W $0001,Y : STA.B $13 
    PHX : PHY 
    JSL.L .externalFunction 
    PLY : PLX 
    INY #3
    RTL 


.externalFunction:
    JML.W [$0012] 


UNUSED_Inst_CommonA7_CallExternalFunctionInY_WithA_A780CE:
    LDA.W $0000,Y : STA.B $12 
    LDA.W $0001,Y : STA.B $13 
    LDA.W $0003,Y 
    PHX : PHY 
    JSL.L .externalFunction 
    PLY : PLX 
    TYA 
    CLC : ADC.W #$0005 : TAY 
    RTL 


.externalFunction:
    JML.W [$0012] 
endif ; !FEATURE_KEEP_UNREFERENCED


Instruction_CommonA7_GotoY:
    LDA.W $0000,Y 
    TAY 
    RTL 


Instruction_CommonA7_GotoY_PlusY:
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


Instruction_CommonA7_DecrementTimer_GotoYIfNonZero:
    DEC.W $0F90,X 
    BNE Instruction_CommonA7_GotoY 
    INY #2
    RTL 


Instruction_CommonA7_DecrementTimer_GotoYIfNonZero_duplicate:
    DEC.W $0F90,X 
    BNE Instruction_CommonA7_GotoY 
    INY #2
    RTL 


Instruction_CommonA7_DecrementTimer_GotoY_PlusY_IfNonZero:
    SEP #$20 
    DEC.W $0F90,X 
    REP #$20 
    BNE Instruction_CommonA7_GotoY_PlusY 
    INY 
    RTL 


Instruction_CommonA7_TimerInY:
    LDA.W $0000,Y : STA.W $0F90,X 
    INY #2
    RTL 


Instruction_CommonA7_SkipNextInstruction:
    INY #2
    RTL 


Instruction_CommonA7_Sleep:
    DEY #2
    TYA 
    STA.W $0F92,X 
    PLA : PEA.W ProcessEnemyInstructions_return-1 
    RTL 


Instruction_CommonA7_WaitYFrames:
    LDA.W $0000,Y : STA.W $0F94,X 
    INY #2
    TYA 
    STA.W $0F92,X 
    PLA : PEA.W ProcessEnemyInstructions_return-1 
    RTL 


Instruction_CommonA7_TransferYBytesInYToVRAM:
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


Instruction_CommonA7_EnableOffScreenProcessing:
    LDA.W $0F86,X : ORA.W #$0800 : STA.W $0F86,X 
    RTL 


Instruction_CommonA7_DisableOffScreenProcessing:
    LDA.W $0F86,X : AND.W #$F7FF : STA.W $0F86,X 
    RTL 


CommonA7EnemySpeeds_LinearlyIncreasing:
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

CommonA7EnemySpeeds_QuadraticallyIncreasing:
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

Palette_Kraid:
    dw $3800,$559D,$1816,$100D,$4B9F,$3F37,$36D0,$2E69 
    dw $2608,$1DA6,$1125,$08C5,$0003,$6318,$7FFF,$0000 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Palette_Kraid_A786A7:
    dw $3800,$559D,$1816,$100D,$4B9F,$3F37,$36D0,$2E69 
    dw $2608,$1DA6,$1125,$08C5,$0003,$6318,$7FFF,$0000 
endif ; !FEATURE_KEEP_UNREFERENCED

Palette_KraidRoomBackground:
    dw $0400,$2D6B,$2D6B,$2D6B,$1986,$14C2,$0840,$0400 
    dw $31ED,$18C6,$10C3,$0420,$0252,$2D6B,$4A52,$0000 

InstList_KraidFoot_Initial:
    dw $7FFF 
    dw ExtendedSpritemap_KraidFoot_Initial 
    dw Instruction_Common_Sleep 

InstList_KraidFoot_KraidIsBig_Neutral:
    dw $7FFF 
    dw ExtendedSpritemap_KraidFoot_0 
    dw Instruction_Common_Sleep 

InstList_KraidFoot_KraidIsBig_WalkingForward_0:
    dw Instruction_Kraid_NOP_A7B633 
    dw $0004 
    dw ExtendedSpritemap_KraidFoot_0 
    dw $0004 
    dw ExtendedSpritemap_KraidFoot_1 
    dw $0004 
    dw ExtendedSpritemap_KraidFoot_2 
    dw $0004 
    dw ExtendedSpritemap_KraidFoot_3 
    dw $0004 
    dw ExtendedSpritemap_KraidFoot_4 
    dw $0004 
    dw ExtendedSpritemap_KraidFoot_5 
    dw $0004 
    dw ExtendedSpritemap_KraidFoot_6 
    dw $0004 
    dw ExtendedSpritemap_KraidFoot_7 
    dw $0004 
    dw ExtendedSpritemap_KraidFoot_8 
    dw $0004 
    dw ExtendedSpritemap_KraidFoot_9 
    dw $0004 
    dw ExtendedSpritemap_KraidFoot_A 
    dw $0003 
    dw ExtendedSpritemap_KraidFoot_B 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_C 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_D 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_E 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_F 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_10 
    dw $0010 
    dw ExtendedSpritemap_KraidFoot_11 
    dw Instruction_Kraid_DecrementYPosition 
    dw Instruction_Kraid_XPositionMinus3 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_12 
    dw Instruction_Kraid_DecrementYPosition 
    dw Instruction_Kraid_XPositionMinus3 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_13 
    dw Instruction_Kraid_NOP_A7B633 
    dw $0003 
    dw ExtendedSpritemap_KraidFoot_13 
    dw Instruction_Kraid_DecrementYPosition 
    dw Instruction_Kraid_XPositionMinus3 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_13 
    dw Instruction_Kraid_NOP_A7B633 
    dw $0003 
    dw ExtendedSpritemap_KraidFoot_13 
    dw Instruction_Kraid_DecrementYPosition 
    dw Instruction_Kraid_XPositionMinus3 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_15 
    dw Instruction_Kraid_NOP_A7B633 
    dw $0003 
    dw ExtendedSpritemap_KraidFoot_15 
    dw Instruction_Kraid_IncrementYPosition_SetScreenShaking 
    dw Instruction_Kraid_XPositionMinus3 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_16 
    dw Instruction_Kraid_IncrementYPosition_SetScreenShaking 
    dw Instruction_Kraid_XPositionMinus3 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_17 
    dw Instruction_Kraid_IncrementYPosition_SetScreenShaking 
    dw Instruction_Kraid_XPositionMinus3 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_18 
    dw Instruction_Kraid_IncrementYPosition_SetScreenShaking 
    dw Instruction_Kraid_XPositionMinus3 
    dw Instruction_Kraid_QueueSFX76_Lib2_Max6 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_19 
    dw Instruction_Kraid_NOP_A7B633 
    dw Instruction_Kraid_XPositionMinus3 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_1A 
    dw Instruction_Kraid_XPositionMinus3 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_1B 
    dw Instruction_Kraid_XPositionMinus3 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_1C 
    dw Instruction_Kraid_XPositionMinus3 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_1D 
    dw Instruction_Kraid_XPositionMinus3 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_1E 
    dw Instruction_Kraid_XPositionMinus3 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_1F 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_0 

InstList_KraidFoot_KraidIsBig_WalkingForward_1:
    dw Instruction_Common_Sleep 

InstList_KraidFoot_LungeForward_0:
    dw Instruction_Kraid_NOP_A7B633 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_0 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_1 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_2 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_3 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_4 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_5 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_6 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_7 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_8 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_9 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_A 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_B 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_C 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_D 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_E 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_F 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_10 
    dw $0004 
    dw ExtendedSpritemap_KraidFoot_11 
    dw Instruction_Kraid_DecrementYPosition 
    dw Instruction_Kraid_XPositionMinus3_duplicate 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_12 
    dw Instruction_Kraid_DecrementYPosition 
    dw Instruction_Kraid_XPositionMinus3_duplicate 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_13 
    dw Instruction_Kraid_NOP_A7B633 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_13 
    dw Instruction_Kraid_DecrementYPosition 
    dw Instruction_Kraid_XPositionMinus3_duplicate 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_13 
    dw Instruction_Kraid_NOP_A7B633 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_13 
    dw Instruction_Kraid_DecrementYPosition 
    dw Instruction_Kraid_XPositionMinus3_duplicate 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_15 
    dw Instruction_Kraid_NOP_A7B633 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_15 
    dw Instruction_Kraid_IncrementYPosition_SetScreenShaking 
    dw Instruction_Kraid_XPositionMinus3_duplicate 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_16 
    dw Instruction_Kraid_IncrementYPosition_SetScreenShaking 
    dw Instruction_Kraid_XPositionMinus3_duplicate 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_17 
    dw Instruction_Kraid_IncrementYPosition_SetScreenShaking 
    dw Instruction_Kraid_XPositionMinus3_duplicate 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_18 
    dw Instruction_Kraid_IncrementYPosition_SetScreenShaking 
    dw Instruction_Kraid_XPositionMinus3_duplicate 
    dw Instruction_Kraid_QueueSFX76_Lib2_Max6 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_19 
    dw Instruction_Kraid_NOP_A7B633 
    dw Instruction_Kraid_XPositionMinus3_duplicate 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_1A 
    dw Instruction_Kraid_XPositionMinus3_duplicate 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_1B 
    dw Instruction_Kraid_XPositionMinus3_duplicate 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_1C 
    dw Instruction_Kraid_XPositionMinus3_duplicate 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_1D 
    dw Instruction_Kraid_XPositionMinus3_duplicate 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_1E 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_1F 
    dw Instruction_Kraid_XPositionMinus3_duplicate 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_0 

InstList_KraidFoot_LungeForward_1:
    dw Instruction_Common_Sleep 

InstList_KraidFoot_KraidIsBig_WalkingBackwards_0:
    dw Instruction_Kraid_NOP_A7B633 
    dw Instruction_Kraid_XPositionPlus3 
    dw $0004 
    dw ExtendedSpritemap_KraidFoot_22 
    dw Instruction_Kraid_XPositionPlus3 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_20 
    dw Instruction_Kraid_XPositionPlus3 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_1E 
    dw Instruction_Kraid_XPositionPlus3 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_1D 
    dw Instruction_Kraid_XPositionPlus3 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_1C 
    dw Instruction_Kraid_XPositionPlus3 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_1B 
    dw Instruction_Kraid_XPositionPlus3 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_1A 
    dw Instruction_Kraid_DecrementYPosition 
    dw Instruction_Kraid_XPositionPlus3 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_19 
    dw Instruction_Kraid_DecrementYPosition 
    dw Instruction_Kraid_XPositionPlus3 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_18 
    dw Instruction_Kraid_DecrementYPosition 
    dw Instruction_Kraid_XPositionPlus3 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_17 
    dw Instruction_Kraid_DecrementYPosition 
    dw Instruction_Kraid_XPositionPlus3 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_16 
    dw Instruction_Kraid_IncrementYPosition_SetScreenShaking 
    dw Instruction_Kraid_XPositionPlus3 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_15 
    dw Instruction_Kraid_IncrementYPosition_SetScreenShaking 
    dw Instruction_Kraid_XPositionPlus3 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_14 
    dw Instruction_Kraid_IncrementYPosition_SetScreenShaking 
    dw Instruction_Kraid_XPositionPlus3 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_13 
    dw Instruction_Kraid_IncrementYPosition_SetScreenShaking 
    dw Instruction_Kraid_QueueSFX76_Lib2_Max6 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_12 
    dw Instruction_Kraid_NOP_A7B633 
    dw $0014 
    dw ExtendedSpritemap_KraidFoot_11 
    dw $0004 
    dw ExtendedSpritemap_KraidFoot_10 
    dw $0004 
    dw ExtendedSpritemap_KraidFoot_F 
    dw $0004 
    dw ExtendedSpritemap_KraidFoot_E 
    dw $0004 
    dw ExtendedSpritemap_KraidFoot_D 
    dw $0004 
    dw ExtendedSpritemap_KraidFoot_C 
    dw $0004 
    dw ExtendedSpritemap_KraidFoot_B 
    dw $0004 
    dw ExtendedSpritemap_KraidFoot_A 
    dw $0004 
    dw ExtendedSpritemap_KraidFoot_9 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_8 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_7 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_6 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_5 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_4 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_3 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_2 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_1 

InstList_KraidFoot_KraidIsBig_WalkingBackwards_1:
    dw Instruction_Common_GotoY 
    dw InstList_KraidFoot_KraidIsBig_WalkingBackwards_0 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_KraidFoot_WalkingBackwards_Fast_A7893D:
    dw Instruction_Kraid_NOP_A7B633 
    dw UNUSED_Instruction_Kraid_MoveRight_A7B683 
    dw $0004 
    dw ExtendedSpritemap_KraidFoot_22 
    dw UNUSED_Instruction_Kraid_MoveRight_A7B683 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_20 
    dw UNUSED_Instruction_Kraid_MoveRight_A7B683 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_1E 
    dw UNUSED_Instruction_Kraid_MoveRight_A7B683 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_1D 
    dw UNUSED_Instruction_Kraid_MoveRight_A7B683 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_1C 
    dw UNUSED_Instruction_Kraid_MoveRight_A7B683 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_1B 
    dw UNUSED_Instruction_Kraid_MoveRight_A7B683 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_1A 
    dw Instruction_Kraid_DecrementYPosition 
    dw UNUSED_Instruction_Kraid_MoveRight_A7B683 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_19 
    dw Instruction_Kraid_DecrementYPosition 
    dw UNUSED_Instruction_Kraid_MoveRight_A7B683 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_18 
    dw Instruction_Kraid_DecrementYPosition 
    dw UNUSED_Instruction_Kraid_MoveRight_A7B683 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_17 
    dw Instruction_Kraid_DecrementYPosition 
    dw UNUSED_Instruction_Kraid_MoveRight_A7B683 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_16 
    dw Instruction_Kraid_IncrementYPosition_SetScreenShaking 
    dw UNUSED_Instruction_Kraid_MoveRight_A7B683 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_15 
    dw Instruction_Kraid_IncrementYPosition_SetScreenShaking 
    dw UNUSED_Instruction_Kraid_MoveRight_A7B683 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_14 
    dw Instruction_Kraid_IncrementYPosition_SetScreenShaking 
    dw UNUSED_Instruction_Kraid_MoveRight_A7B683 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_13 
    dw Instruction_Kraid_IncrementYPosition_SetScreenShaking 
    dw Instruction_Kraid_QueueSFX76_Lib2_Max6 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_12 
    dw Instruction_Kraid_NOP_A7B633 
    dw $0014 
    dw ExtendedSpritemap_KraidFoot_11 
    dw $0004 
    dw ExtendedSpritemap_KraidFoot_10 
    dw $0004 
    dw ExtendedSpritemap_KraidFoot_F 
    dw $0004 
    dw ExtendedSpritemap_KraidFoot_E 
    dw $0004 
    dw ExtendedSpritemap_KraidFoot_D 
    dw $0004 
    dw ExtendedSpritemap_KraidFoot_C 
    dw $0004 
    dw ExtendedSpritemap_KraidFoot_B 
    dw $0004 
    dw ExtendedSpritemap_KraidFoot_A 
    dw $0004 
    dw ExtendedSpritemap_KraidFoot_9 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_8 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_7 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_6 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_5 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_4 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_3 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_2 
    dw $0001 
    dw ExtendedSpritemap_KraidFoot_1 
    dw Instruction_Common_GotoY 
    dw UNUSED_InstList_KraidFoot_WalkingBackwards_Fast_A7893D 
endif ; !FEATURE_KEEP_UNREFERENCED

InstList_KraidArm_Normal_0:
    dw $0006 
    dw ExtendedSpritemap_KraidArm_General_0 
    dw $0006 
    dw ExtendedSpritemap_KraidArm_General_1 
    dw $0006 
    dw ExtendedSpritemap_KraidArm_General_2 
    dw $0006 
    dw ExtendedSpritemap_KraidArm_General_3 
    dw $0006 
    dw ExtendedSpritemap_KraidArm_General_4 
    dw $0006 
    dw ExtendedSpritemap_KraidArm_General_5 
    dw $0006 
    dw ExtendedSpritemap_KraidArm_General_6 
    dw $0006 
    dw ExtendedSpritemap_KraidArm_General_7 
    dw $0006 
    dw ExtendedSpritemap_KraidArm_General_8 
    dw $0006 
    dw ExtendedSpritemap_KraidArm_General_9 
    dw $0006 
    dw ExtendedSpritemap_KraidArm_General_7 
    dw $0006 
    dw ExtendedSpritemap_KraidArm_General_6 
    dw $0006 
    dw ExtendedSpritemap_KraidArm_General_5 
    dw $0006 
    dw ExtendedSpritemap_KraidArm_General_4 
    dw $0006 
    dw ExtendedSpritemap_KraidArm_General_3 
    dw $0006 
    dw ExtendedSpritemap_KraidArm_General_2 
    dw $0006 
    dw ExtendedSpritemap_KraidArm_General_1 

InstList_KraidArm_Normal_1:
    dw $0020 
    dw ExtendedSpritemap_KraidArm_General_0 
    dw Instruction_KraidArm_SlowArmIfLessThanHalfHealth 
    dw Instruction_Common_GotoY 
    dw InstList_KraidArm_Normal_0 

InstList_KraidArm_Slow:
    dw $0008 
    dw ExtendedSpritemap_KraidArm_General_0 
    dw $0008 
    dw ExtendedSpritemap_KraidArm_General_1 
    dw $0008 
    dw ExtendedSpritemap_KraidArm_General_2 
    dw $0008 
    dw ExtendedSpritemap_KraidArm_General_3 
    dw $0008 
    dw ExtendedSpritemap_KraidArm_General_4 
    dw $0008 
    dw ExtendedSpritemap_KraidArm_General_5 
    dw $0008 
    dw ExtendedSpritemap_KraidArm_General_6 
    dw $0008 
    dw ExtendedSpritemap_KraidArm_General_7 
    dw $0008 
    dw ExtendedSpritemap_KraidArm_General_8 
    dw $0008 
    dw ExtendedSpritemap_KraidArm_General_9 
    dw $0008 
    dw ExtendedSpritemap_KraidArm_General_7 
    dw $0008 
    dw ExtendedSpritemap_KraidArm_General_6 
    dw $0008 
    dw ExtendedSpritemap_KraidArm_General_5 
    dw $0008 
    dw ExtendedSpritemap_KraidArm_General_4 
    dw $0008 
    dw ExtendedSpritemap_KraidArm_General_3 
    dw $0008 
    dw ExtendedSpritemap_KraidArm_General_2 
    dw $0008 
    dw ExtendedSpritemap_KraidArm_General_1 
    dw $0030 
    dw ExtendedSpritemap_KraidArm_General_0 
    dw Instruction_KraidArm_SlowArmIfLessThanHalfHealth 
    dw Instruction_Common_GotoY 
    dw InstList_KraidArm_Slow 

Instruction_KraidArm_SlowArmIfLessThanHalfHealth:
    LDA.W $0F8C : CMP.L $7E7812 : BPL .return 
    LDA.W $0FD2 : CMP.W #InstList_KraidArm_Slow : BPL .return 
    LDY.W #InstList_KraidArm_Slow 

.return:
    RTL 


InstList_KraidArm_RisingSinking:
    dw $0006 
    dw ExtendedSpritemap_KraidArm_RisingSinking_0 
    dw $0006 
    dw ExtendedSpritemap_KraidArm_RisingSinking_1 
    dw $0006 
    dw ExtendedSpritemap_KraidArm_RisingSinking_2 
    dw $0006 
    dw ExtendedSpritemap_KraidArm_RisingSinking_3 
    dw $0006 
    dw ExtendedSpritemap_KraidArm_RisingSinking_4 
    dw $0006 
    dw ExtendedSpritemap_KraidArm_RisingSinking_5 
    dw $0006 
    dw ExtendedSpritemap_KraidArm_RisingSinking_6 
    dw $0006 
    dw ExtendedSpritemap_KraidArm_RisingSinking_7 
    dw $0006 
    dw ExtendedSpritemap_KraidArm_RisingSinking_8 
    dw $0006 
    dw ExtendedSpritemap_KraidArm_RisingSinking_9 
    dw $0006 
    dw ExtendedSpritemap_KraidArm_RisingSinking_7 
    dw $0006 
    dw ExtendedSpritemap_KraidArm_RisingSinking_6 
    dw $0006 
    dw ExtendedSpritemap_KraidArm_RisingSinking_5 
    dw $0006 
    dw ExtendedSpritemap_KraidArm_RisingSinking_4 
    dw $0006 
    dw ExtendedSpritemap_KraidArm_RisingSinking_3 
    dw $0006 
    dw ExtendedSpritemap_KraidArm_RisingSinking_2 
    dw $0006 
    dw ExtendedSpritemap_KraidArm_RisingSinking_1 
    dw $0020 
    dw ExtendedSpritemap_KraidArm_RisingSinking_0 
    dw Instruction_Common_GotoY 
    dw InstList_KraidArm_RisingSinking 

InstList_KraidArm_Dying_PreparingToLungeForward:
    dw $0006 
    dw ExtendedSpritemap_KraidArm_General_0 
    dw $0006 
    dw ExtendedSpritemap_KraidArm_Dying_PreparingToLungeForward_0 
    dw $7FFF 
    dw ExtendedSpritemap_KraidArm_Dying_PreparingToLungeForward_1 
    dw Instruction_Common_Sleep 

InstList_KraidLint_Initial:
    dw $7FFF 
    dw Spritemap_KraidLint_Initial 
    dw Instruction_Common_Sleep 

InstList_KraidLint_KraidIsBig:
    dw $7FFF 
    dw ExtendedSpritemap_KraidLint_KraidIsBig 
    dw Instruction_Common_Sleep 

InstList_KraidNail:
    dw $0003 
    dw Spritemap_KraidNail_0 
    dw $0003 
    dw Spritemap_KraidNail_1 
    dw $0003 
    dw Spritemap_KraidNail_2 
    dw $0003 
    dw Spritemap_KraidNail_3 
    dw $0003 
    dw Spritemap_KraidNail_4 
    dw $0003 
    dw Spritemap_KraidNail_5 
    dw $0003 
    dw Spritemap_KraidNail_6 
    dw $0003 
    dw Spritemap_KraidNail_7 
    dw Instruction_Common_GotoY 
    dw InstList_KraidNail 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ExtendedSpritemap_KraidArm_A78B2E:
    dw $0002,$0000,$0000 
    dw Spritemap_KraidArm_General_A 
    dw Hitbox_KraidArm_F 
    dw $FFF7,$FFF6 
    dw Spritemap_KraidArm_General_0 
    dw Hitbox_KraidArm_0 

UNUSED_ExtendedSpritemap_KraidArm_A78B40:
    dw $0002,$FFF9,$FFF8 
    dw Spritemap_KraidArm_General_1 
    dw Hitbox_KraidArm_1 
    dw $0001,$0000 
    dw Spritemap_KraidArm_General_A 
    dw Hitbox_KraidArm_F 

UNUSED_ExtendedSpritemap_KraidArm_A78B52:
    dw $0002,$FFF8,$FFF8 
    dw Spritemap_KraidArm_General_2 
    dw Hitbox_KraidArm_2 
    dw $0000,$0000 
    dw Spritemap_KraidArm_General_A 
    dw Hitbox_KraidArm_F 

UNUSED_ExtendedSpritemap_KraidArm_A78B64:
    dw $0002,$FFF8,$FFF8 
    dw Spritemap_KraidArm_General_3 
    dw Hitbox_KraidArm_3 
    dw $0000,$0000 
    dw Spritemap_KraidArm_General_A 
    dw Hitbox_KraidArm_F 

UNUSED_ExtendedSpritemap_KraidArm_A78B76:
    dw $0002,$FFF6,$0001 
    dw Spritemap_KraidArm_General_1 
    dw Hitbox_KraidArm_1 
    dw $0000,$0000 
    dw Spritemap_KraidArm_General_7 
    dw Hitbox_KraidArm_8 

UNUSED_ExtendedSpritemap_KraidArm_A78B88:
    dw $0002,$FFF6,$0000 
    dw Spritemap_KraidArm_General_2 
    dw Hitbox_KraidArm_2 
    dw $0000,$0000 
    dw Spritemap_KraidArm_General_7 
    dw Hitbox_KraidArm_8 

UNUSED_ExtendedSpritemap_KraidArm_A78B9A:
    dw $0002,$FFF6,$0000 
    dw Spritemap_KraidArm_General_3 
    dw Hitbox_KraidArm_3 
    dw $0000,$0000 
    dw Spritemap_KraidArm_General_7 
    dw Hitbox_KraidArm_8 

UNUSED_ExtendedSpritemap_KraidArm_A78BAC:
    dw $0002,$FFF6,$0000 
    dw Spritemap_KraidArm_General_4 
    dw Hitbox_KraidArm_4 
    dw $0000,$0000 
    dw Spritemap_KraidArm_General_7 
    dw Hitbox_KraidArm_8 

UNUSED_ExtendedSpritemap_KraidArm_A78BBE:
    dw $0002,$FFFA,$0006 
    dw Spritemap_KraidArm_General_2 
    dw Hitbox_KraidArm_2 
    dw $0000,$0000 
    dw Spritemap_KraidArm_General_8 
    dw Hitbox_KraidArm_9 

UNUSED_ExtendedSpritemap_KraidArm_A78BD0:
    dw $0002,$FFFA,$0006 
    dw Spritemap_KraidArm_General_3 
    dw Hitbox_KraidArm_3 
    dw $0000,$0000 
    dw Spritemap_KraidArm_General_8 
    dw Hitbox_KraidArm_9 

UNUSED_ExtendedSpritemap_KraidArm_A78BE2:
    dw $0002,$FFF8,$0006 
    dw Spritemap_KraidArm_General_4 
    dw Hitbox_KraidArm_4 
    dw $0000,$0000 
    dw Spritemap_KraidArm_General_8 
    dw Hitbox_KraidArm_9 

UNUSED_ExtendedSpritemap_KraidArm_A78BF4:
    dw $0002,$FFF8,$0006 
    dw Spritemap_KraidArm_General_5 
    dw Hitbox_KraidArm_5 
    dw $0000,$0000 
    dw Spritemap_KraidArm_General_8 
    dw Hitbox_KraidArm_9 

UNUSED_ExtendedSpritemap_KraidArm_A78C06:
    dw $0002,$0001,$000A 
    dw Spritemap_KraidArm_General_3 
    dw Hitbox_KraidArm_3 
    dw $0000,$0000 
    dw Spritemap_KraidArm_General_9 
    dw Hitbox_KraidArm_A 

UNUSED_ExtendedSpritemap_KraidArm_A78C18:
    dw $0002,$0000,$000A 
    dw Spritemap_KraidArm_General_4 
    dw Hitbox_KraidArm_4 
    dw $0000,$0000 
    dw Spritemap_KraidArm_General_9 
    dw Hitbox_KraidArm_A 

UNUSED_ExtendedSpritemap_KraidArm_A78C2A:
    dw $0002,$FFFF,$000C 
    dw Spritemap_KraidArm_General_5 
    dw Hitbox_KraidArm_5 
    dw $0000,$0000 
    dw Spritemap_KraidArm_General_9 
    dw Hitbox_KraidArm_A 

UNUSED_ExtendedSpritemap_KraidArm_A78C3C:
    dw $0002,$0000,$000B 
    dw Spritemap_KraidArm_General_6 
    dw Hitbox_KraidArm_6 
    dw $0000,$0000 
    dw Spritemap_KraidArm_General_9 
    dw Hitbox_KraidArm_A 

UNUSED_ExtendedSpritemap_KraidArm_A78C4E:
    dw $0001,$0000,$0000 
    dw Spritemap_KraidArm_General_D 
    dw Hitbox_KraidArm_12 

UNUSED_ExtendedSpritemap_KraidArm_A78C58:
    dw $0001,$0000,$0000 
    dw Spritemap_KraidArm_General_C 
    dw Hitbox_KraidArm_11 

UNUSED_ExtendedSpritemap_KraidArm_A78C62:
    dw $0001,$0000,$0000 
    dw Spritemap_KraidArm_General_B 
    dw Hitbox_KraidArm_10 
endif ; !FEATURE_KEEP_UNREFERENCED

ExtendedSpritemap_KraidLint_KraidIsBig:
    dw $0005,$01F4 
    db $08 
    dw $21C2,$81E4 
    db $00 
    dw $21B0,$81F4 
    db $F8 
    dw $21A2,$81E4 
    db $F8 
    dw $21A0,$8004 
    db $F8 
    dw $21A9 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ExtendedSpritemap_KraidFoot_A78C87:
    dw $0001,$0000,$0000 
    dw UNUSED_Spritemap_KraidFoot_A794DA 
    dw UNUSED_Hitbox_KraidFoot 

UNUSED_ExtendedSpritemap_KraidFoot_A78C91:
    dw $0002,$0000,$0000 
    dw Spritemap_KraidFoot_0 
    dw UNUSED_Hitbox_KraidFoot 
    dw $000C,$0030 
    dw Spritemap_KraidFoot_4 
    dw UNUSED_Hitbox_KraidFoot 

UNUSED_ExtendedSpritemap_KraidFoot_A78CA3:
    dw $0002,$0000,$0000 
    dw Spritemap_KraidFoot_1 
    dw UNUSED_Hitbox_KraidFoot 
    dw $0000,$0039 
    dw Spritemap_KraidFoot_4 
    dw UNUSED_Hitbox_KraidFoot 

UNUSED_ExtendedSpritemap_KraidFoot_A78CB5:
    dw $0002,$0000,$0000 
    dw Spritemap_KraidFoot_2 
    dw UNUSED_Hitbox_KraidFoot 
    dw $FFF0,$003F 
    dw Spritemap_KraidFoot_4 
    dw UNUSED_Hitbox_KraidFoot 

UNUSED_ExtendedSpritemap_KraidFoot_A78CC7:
    dw $0002,$0000,$0000 
    dw Spritemap_KraidFoot_3 
    dw UNUSED_Hitbox_KraidFoot 
    dw $FFDF,$003D 
    dw Spritemap_KraidFoot_4 
    dw UNUSED_Hitbox_KraidFoot 

UNUSED_ExtendedSpritemap_KraidFoot_A78CD9:
    dw $0001,$0000,$0000 
    dw UNUSED_Spritemap_KraidFoot_A796CB 
    dw UNUSED_Hitbox_KraidFoot_A79461 
endif ; !FEATURE_KEEP_UNREFERENCED

ExtendedSpritemap_KraidFoot_0:
    dw $0002,$0008,$0028 
    dw Spritemap_KraidFoot_4 
    dw Hitbox_KraidFoot 
    dw $0000,$0000 
    dw Spritemap_KraidFoot_0 
    dw Hitbox_KraidFoot 

ExtendedSpritemap_KraidFoot_1:
    dw $0002,$0006,$0027 
    dw Spritemap_KraidFoot_4 
    dw Hitbox_KraidFoot 
    dw $FFFE,$FFFF 
    dw Spritemap_KraidFoot_0 
    dw Hitbox_KraidFoot 

ExtendedSpritemap_KraidFoot_2:
    dw $0002,$0004,$0026 
    dw Spritemap_KraidFoot_4 
    dw Hitbox_KraidFoot 
    dw $FFFC,$FFFE 
    dw Spritemap_KraidFoot_0 
    dw Hitbox_KraidFoot 

ExtendedSpritemap_KraidFoot_3:
    dw $0002,$0002,$0025 
    dw Spritemap_KraidFoot_4 
    dw Hitbox_KraidFoot 
    dw $FFFA,$FFFD 
    dw Spritemap_KraidFoot_0 
    dw Hitbox_KraidFoot 

ExtendedSpritemap_KraidFoot_4:
    dw $0002,$0000,$0024 
    dw Spritemap_KraidFoot_4 
    dw Hitbox_KraidFoot 
    dw $FFF8,$FFFC 
    dw Spritemap_KraidFoot_0 
    dw Hitbox_KraidFoot 

ExtendedSpritemap_KraidFoot_5:
    dw $0002,$FFFE,$0023 
    dw Spritemap_KraidFoot_4 
    dw Hitbox_KraidFoot 
    dw $0005,$FFF1 
    dw Spritemap_KraidFoot_1 
    dw Hitbox_KraidFoot 

ExtendedSpritemap_KraidFoot_6:
    dw $0002,$FFFC,$0022 
    dw Spritemap_KraidFoot_4 
    dw Hitbox_KraidFoot 
    dw $0003,$FFF0 
    dw Spritemap_KraidFoot_1 
    dw Hitbox_KraidFoot 

ExtendedSpritemap_KraidFoot_7:
    dw $0002,$FFFA,$0021 
    dw Spritemap_KraidFoot_4 
    dw Hitbox_KraidFoot 
    dw $0001,$FFEF 
    dw Spritemap_KraidFoot_1 
    dw Hitbox_KraidFoot 

ExtendedSpritemap_KraidFoot_8:
    dw $0002,$FFF8,$0020 
    dw Spritemap_KraidFoot_4 
    dw Hitbox_KraidFoot 
    dw $FFFF,$FFEE 
    dw Spritemap_KraidFoot_1 
    dw Hitbox_KraidFoot 

ExtendedSpritemap_KraidFoot_9:
    dw $0002,$FFF6,$001F 
    dw Spritemap_KraidFoot_4 
    dw Hitbox_KraidFoot 
    dw $FFFD,$FFED 
    dw Spritemap_KraidFoot_1 
    dw Hitbox_KraidFoot 

ExtendedSpritemap_KraidFoot_A:
    dw $0002,$FFF4,$001D 
    dw Spritemap_KraidFoot_4 
    dw Hitbox_KraidFoot 
    dw $000C,$FFE6 
    dw Spritemap_KraidFoot_2 
    dw Hitbox_KraidFoot 

ExtendedSpritemap_KraidFoot_B:
    dw $0002,$FFF2,$001C 
    dw Spritemap_KraidFoot_4 
    dw Hitbox_KraidFoot 
    dw $001A,$FFE9 
    dw Spritemap_KraidFoot_3 
    dw Hitbox_KraidFoot 

ExtendedSpritemap_KraidFoot_C:
    dw $0002,$FFF0,$001E 
    dw Spritemap_KraidFoot_4 
    dw Hitbox_KraidFoot 
    dw $0018,$FFEB 
    dw Spritemap_KraidFoot_3 
    dw Hitbox_KraidFoot 

ExtendedSpritemap_KraidFoot_D:
    dw $0002,$FFEE,$0020 
    dw Spritemap_KraidFoot_4 
    dw Hitbox_KraidFoot 
    dw $0016,$FFED 
    dw Spritemap_KraidFoot_3 
    dw Hitbox_KraidFoot 

ExtendedSpritemap_KraidFoot_E:
    dw $0002,$FFEC,$0022 
    dw Spritemap_KraidFoot_4 
    dw Hitbox_KraidFoot 
    dw $0014,$FFEF 
    dw Spritemap_KraidFoot_3 
    dw Hitbox_KraidFoot 

ExtendedSpritemap_KraidFoot_F:
    dw $0002,$FFEA,$0024 
    dw Spritemap_KraidFoot_4 
    dw Hitbox_KraidFoot 
    dw $0012,$FFF1 
    dw Spritemap_KraidFoot_3 
    dw Hitbox_KraidFoot 

ExtendedSpritemap_KraidFoot_10:
    dw $0002,$FFE8,$0026 
    dw Spritemap_KraidFoot_4 
    dw Hitbox_KraidFoot 
    dw $0010,$FFF3 
    dw Spritemap_KraidFoot_3 
    dw Hitbox_KraidFoot 

ExtendedSpritemap_KraidFoot_11:
    dw $0002,$FFE6,$0028 
    dw Spritemap_KraidFoot_4 
    dw Hitbox_KraidFoot 
    dw $000E,$FFF5 
    dw Spritemap_KraidFoot_3 
    dw Hitbox_KraidFoot 

ExtendedSpritemap_KraidFoot_12:
    dw $0002,$FFE8,$0028 
    dw Spritemap_KraidFoot_4 
    dw Hitbox_KraidFoot 
    dw $0010,$FFF6 
    dw Spritemap_KraidFoot_3 
    dw Hitbox_KraidFoot 

ExtendedSpritemap_KraidFoot_13:
    dw $0002,$FFEA,$0028 
    dw Spritemap_KraidFoot_4 
    dw Hitbox_KraidFoot 
    dw $0012,$FFF6 
    dw Spritemap_KraidFoot_3 
    dw Hitbox_KraidFoot 

ExtendedSpritemap_KraidFoot_14:
    dw $0002,$FFEC,$0028 
    dw Spritemap_KraidFoot_4 
    dw Hitbox_KraidFoot 
    dw $0014,$FFF6 
    dw Spritemap_KraidFoot_3 
    dw Hitbox_KraidFoot 

ExtendedSpritemap_KraidFoot_15:
    dw $0002,$FFEE,$0028 
    dw Spritemap_KraidFoot_4 
    dw Hitbox_KraidFoot 
    dw $0006,$FFF1 
    dw Spritemap_KraidFoot_2 
    dw Hitbox_KraidFoot 

ExtendedSpritemap_KraidFoot_16:
    dw $0002,$FFF0,$0028 
    dw Spritemap_KraidFoot_4 
    dw Hitbox_KraidFoot 
    dw $0008,$FFF1 
    dw Spritemap_KraidFoot_2 
    dw Hitbox_KraidFoot 

ExtendedSpritemap_KraidFoot_17:
    dw $0002,$FFF2,$0028 
    dw Spritemap_KraidFoot_4 
    dw Hitbox_KraidFoot 
    dw $FFF9,$FFF6 
    dw Spritemap_KraidFoot_1 
    dw Hitbox_KraidFoot 

ExtendedSpritemap_KraidFoot_18:
    dw $0002,$FFF4,$0028 
    dw Spritemap_KraidFoot_4 
    dw Hitbox_KraidFoot 
    dw $FFFB,$FFF6 
    dw Spritemap_KraidFoot_1 
    dw Hitbox_KraidFoot 

ExtendedSpritemap_KraidFoot_19:
    dw $0002,$FFF6,$0028 
    dw Spritemap_KraidFoot_4 
    dw Hitbox_KraidFoot 
    dw $FFFD,$FFF6 
    dw Spritemap_KraidFoot_1 
    dw Hitbox_KraidFoot 

ExtendedSpritemap_KraidFoot_1A:
    dw $0002,$FFF8,$0028 
    dw Spritemap_KraidFoot_4 
    dw Hitbox_KraidFoot 
    dw $FFFF,$FFF6 
    dw Spritemap_KraidFoot_1 
    dw Hitbox_KraidFoot 

ExtendedSpritemap_KraidFoot_1B:
    dw $0002,$FFFA,$0028 
    dw Spritemap_KraidFoot_4 
    dw Hitbox_KraidFoot 
    dw $0001,$FFF6 
    dw Spritemap_KraidFoot_1 
    dw Hitbox_KraidFoot 

ExtendedSpritemap_KraidFoot_1C:
    dw $0002,$FFFC,$0028 
    dw Spritemap_KraidFoot_4 
    dw Hitbox_KraidFoot 
    dw $0003,$FFF6 
    dw Spritemap_KraidFoot_1 
    dw Hitbox_KraidFoot 

ExtendedSpritemap_KraidFoot_1D:
    dw $0002,$FFFE,$0028 
    dw Spritemap_KraidFoot_4 
    dw Hitbox_KraidFoot 
    dw $0005,$FFF6 
    dw Spritemap_KraidFoot_1 
    dw Hitbox_KraidFoot 

ExtendedSpritemap_KraidFoot_1E:
    dw $0002,$0000,$0028 
    dw Spritemap_KraidFoot_4 
    dw Hitbox_KraidFoot 
    dw $0007,$FFF6 
    dw Spritemap_KraidFoot_1 
    dw Hitbox_KraidFoot 

ExtendedSpritemap_KraidFoot_1F:
    dw $0002,$0002,$0028 
    dw Spritemap_KraidFoot_4 
    dw Hitbox_KraidFoot 
    dw $FFFA,$0000 
    dw Spritemap_KraidFoot_0 
    dw Hitbox_KraidFoot 

ExtendedSpritemap_KraidFoot_20:
    dw $0002,$0004,$0028 
    dw Spritemap_KraidFoot_4 
    dw Hitbox_KraidFoot 
    dw $FFFC,$0000 
    dw Spritemap_KraidFoot_0 
    dw Hitbox_KraidFoot 

ExtendedSpritemap_KraidFoot_21:
    dw $0002,$0006,$0028 
    dw Spritemap_KraidFoot_4 
    dw Hitbox_KraidFoot 
    dw $FFFE,$0000 
    dw Spritemap_KraidFoot_0 
    dw Hitbox_KraidFoot 

ExtendedSpritemap_KraidFoot_22:
    dw $0002,$0008,$0028 
    dw Spritemap_KraidFoot_4 
    dw Hitbox_KraidFoot 
    dw $0000,$0000 
    dw Spritemap_KraidFoot_0 
    dw Hitbox_KraidFoot 

ExtendedSpritemap_KraidArm_General_0:
    dw $0005,$FFDC,$FFDF 
    dw Spritemap_KraidArm_General_0 
    dw Hitbox_KraidArm_0 
    dw $FFE4,$FFE8 
    dw Spritemap_KraidArm_General_A 
    dw Hitbox_KraidArm_F 
    dw $0000,$0000 
    dw Spritemap_KraidArm_General_D 
    dw Hitbox_KraidArm_12 
    dw $FFDC,$FFD8 
    dw Spritemap_KraidArm_General_0 
    dw Hitbox_KraidArm_0 
    dw $FFE4,$FFE1 
    dw Spritemap_KraidArm_General_A 
    dw Hitbox_KraidArm_F 

ExtendedSpritemap_KraidArm_General_1:
    dw $0005,$FFDA,$FFDF 
    dw Spritemap_KraidArm_General_1 
    dw Hitbox_KraidArm_1 
    dw $FFE2,$FFE6 
    dw Spritemap_KraidArm_General_A 
    dw Hitbox_KraidArm_F 
    dw $0000,$0000 
    dw Spritemap_KraidArm_General_D 
    dw Hitbox_KraidArm_12 
    dw $FFDC,$FFD8 
    dw Spritemap_KraidArm_General_0 
    dw Hitbox_KraidArm_0 
    dw $FFE4,$FFE1 
    dw Spritemap_KraidArm_General_A 
    dw Hitbox_KraidArm_F 

ExtendedSpritemap_KraidArm_General_2:
    dw $0005,$FFD0,$FFF3 
    dw Spritemap_KraidArm_General_2 
    dw Hitbox_KraidArm_2 
    dw $FFDA,$FFF3 
    dw Spritemap_KraidArm_General_7 
    dw Hitbox_KraidArm_8 
    dw $0000,$0000 
    dw Spritemap_KraidArm_General_C 
    dw Hitbox_KraidArm_11 
    dw $FFD3,$FFE5 
    dw Spritemap_KraidArm_General_1 
    dw Hitbox_KraidArm_1 
    dw $FFDB,$FFED 
    dw Spritemap_KraidArm_General_A 
    dw Hitbox_KraidArm_F 

ExtendedSpritemap_KraidArm_General_3:
    dw $0005,$FFD2,$FFF3 
    dw Spritemap_KraidArm_General_3 
    dw Hitbox_KraidArm_3 
    dw $FFDB,$FFF3 
    dw Spritemap_KraidArm_General_7 
    dw Hitbox_KraidArm_8 
    dw $0000,$0000 
    dw Spritemap_KraidArm_General_C 
    dw Hitbox_KraidArm_11 
    dw $FFD3,$FFED 
    dw Spritemap_KraidArm_General_2 
    dw Hitbox_KraidArm_2 
    dw $FFDC,$FFEE 
    dw Spritemap_KraidArm_General_7 
    dw Hitbox_KraidArm_8 

ExtendedSpritemap_KraidArm_General_4:
    dw $0005,$FFD3,$0008 
    dw Spritemap_KraidArm_General_4 
    dw Hitbox_KraidArm_4 
    dw $FFDA,$0002 
    dw Spritemap_KraidArm_General_8 
    dw Hitbox_KraidArm_9 
    dw $0000,$0000 
    dw Spritemap_KraidArm_General_B 
    dw Hitbox_KraidArm_10 
    dw $FFD2,$0003 
    dw Spritemap_KraidArm_General_3 
    dw Hitbox_KraidArm_3 
    dw $FFD9,$FFFD 
    dw Spritemap_KraidArm_General_8 
    dw Hitbox_KraidArm_9 

ExtendedSpritemap_KraidArm_General_5:
    dw $0005,$FFD4,$0008 
    dw Spritemap_KraidArm_General_4 
    dw Hitbox_KraidArm_4 
    dw $FFDB,$0002 
    dw Spritemap_KraidArm_General_8 
    dw Hitbox_KraidArm_9 
    dw $0000,$0000 
    dw Spritemap_KraidArm_General_B 
    dw Hitbox_KraidArm_10 
    dw $FFD2,$0004 
    dw Spritemap_KraidArm_General_4 
    dw Hitbox_KraidArm_4 
    dw $FFD9,$FFFE 
    dw Spritemap_KraidArm_General_8 
    dw Hitbox_KraidArm_9 

ExtendedSpritemap_KraidArm_General_6:
    dw $0005,$FFD9,$000A 
    dw Spritemap_KraidArm_General_5 
    dw Hitbox_KraidArm_5 
    dw $FFDA,$0000 
    dw Spritemap_KraidArm_General_9 
    dw Hitbox_KraidArm_A 
    dw $0000,$0000 
    dw Spritemap_KraidArm_General_B 
    dw Hitbox_KraidArm_10 
    dw $FFD5,$000A 
    dw Spritemap_KraidArm_General_5 
    dw Hitbox_KraidArm_5 
    dw $FFD7,$FFFE 
    dw Spritemap_KraidArm_General_9 
    dw Hitbox_KraidArm_A 

ExtendedSpritemap_KraidArm_General_7:
    dw $0005,$FFD9,$000A 
    dw Spritemap_KraidArm_General_5 
    dw Hitbox_KraidArm_5 
    dw $FFDA,$0000 
    dw Spritemap_KraidArm_General_9 
    dw Hitbox_KraidArm_A 
    dw $0000,$0000 
    dw Spritemap_KraidArm_General_B 
    dw Hitbox_KraidArm_10 
    dw $FFD5,$0009 
    dw Spritemap_KraidArm_General_5 
    dw Hitbox_KraidArm_5 
    dw $FFD7,$FFFE 
    dw Spritemap_KraidArm_General_9 
    dw Hitbox_KraidArm_A 

ExtendedSpritemap_KraidArm_General_8:
    dw $0005,$FFD9,$000A 
    dw Spritemap_KraidArm_General_6 
    dw Hitbox_KraidArm_6 
    dw $FFDA,$0000 
    dw Spritemap_KraidArm_General_9 
    dw Hitbox_KraidArm_A 
    dw $0000,$0000 
    dw Spritemap_KraidArm_General_B 
    dw Hitbox_KraidArm_10 
    dw $FFD5,$0009 
    dw Spritemap_KraidArm_General_5 
    dw Hitbox_KraidArm_5 
    dw $FFD7,$FFFE 
    dw Spritemap_KraidArm_General_9 
    dw Hitbox_KraidArm_A 

ExtendedSpritemap_KraidArm_General_9:
    dw $0005,$FFD9,$000A 
    dw Spritemap_KraidArm_General_6 
    dw Hitbox_KraidArm_6 
    dw $FFDA,$0000 
    dw Spritemap_KraidArm_General_9 
    dw Hitbox_KraidArm_A 
    dw $0000,$0000 
    dw Spritemap_KraidArm_General_B 
    dw Hitbox_KraidArm_10 
    dw $FFD6,$0009 
    dw Spritemap_KraidArm_General_6 
    dw Hitbox_KraidArm_6 
    dw $FFD6,$FFFE 
    dw Spritemap_KraidArm_General_9 
    dw Hitbox_KraidArm_A 

ExtendedSpritemap_KraidArm_RisingSinking_0:
    dw $0005,$FFDC,$FFDF 
    dw Spritemap_KraidArm_RisingSinking_0 
    dw Hitbox_KraidArm_0 
    dw $FFE4,$FFE8 
    dw Spritemap_KraidArm_RisingSinking_A 
    dw Hitbox_KraidArm_F 
    dw $0000,$0000 
    dw Spritemap_KraidArm_RisingSinking_D 
    dw Hitbox_KraidArm_12 
    dw $FFDC,$FFD8 
    dw Spritemap_KraidArm_RisingSinking_0 
    dw Hitbox_KraidArm_0 
    dw $FFE4,$FFE1 
    dw Spritemap_KraidArm_RisingSinking_A 
    dw Hitbox_KraidArm_F 

ExtendedSpritemap_KraidArm_RisingSinking_1:
    dw $0005,$FFDA,$FFDF 
    dw Spritemap_KraidArm_RisingSinking_1 
    dw Hitbox_KraidArm_1 
    dw $FFE2,$FFE6 
    dw Spritemap_KraidArm_RisingSinking_A 
    dw Hitbox_KraidArm_F 
    dw $0000,$0000 
    dw Spritemap_KraidArm_RisingSinking_D 
    dw Hitbox_KraidArm_12 
    dw $FFDC,$FFD8 
    dw Spritemap_KraidArm_RisingSinking_0 
    dw Hitbox_KraidArm_0 
    dw $FFE4,$FFE1 
    dw Spritemap_KraidArm_RisingSinking_A 
    dw Hitbox_KraidArm_F 

ExtendedSpritemap_KraidArm_RisingSinking_2:
    dw $0005,$FFD0,$FFF3 
    dw Spritemap_KraidArm_RisingSinking_2 
    dw Hitbox_KraidArm_2 
    dw $FFDA,$FFF3 
    dw Spritemap_KraidArm_RisingSinking_7 
    dw Hitbox_KraidArm_8 
    dw $0000,$0000 
    dw Spritemap_KraidArm_RisingSinking_C 
    dw Hitbox_KraidArm_11 
    dw $FFD3,$FFE5 
    dw Spritemap_KraidArm_RisingSinking_1 
    dw Hitbox_KraidArm_1 
    dw $FFDB,$FFED 
    dw Spritemap_KraidArm_RisingSinking_A 
    dw Hitbox_KraidArm_F 

ExtendedSpritemap_KraidArm_RisingSinking_3:
    dw $0005,$FFD2,$FFF3 
    dw Spritemap_KraidArm_RisingSinking_3 
    dw Hitbox_KraidArm_3 
    dw $FFDB,$FFF3 
    dw Spritemap_KraidArm_RisingSinking_7 
    dw Hitbox_KraidArm_8 
    dw $0000,$0000 
    dw Spritemap_KraidArm_RisingSinking_C 
    dw Hitbox_KraidArm_11 
    dw $FFD3,$FFED 
    dw Spritemap_KraidArm_RisingSinking_2 
    dw Hitbox_KraidArm_2 
    dw $FFDC,$FFEE 
    dw Spritemap_KraidArm_RisingSinking_7 
    dw Hitbox_KraidArm_8 

ExtendedSpritemap_KraidArm_RisingSinking_4:
    dw $0005,$FFD3,$0008 
    dw Spritemap_KraidArm_RisingSinking_4 
    dw Hitbox_KraidArm_4 
    dw $FFDA,$0002 
    dw Spritemap_KraidArm_RisingSinking_8 
    dw Hitbox_KraidArm_9 
    dw $0000,$0000 
    dw Spritemap_KraidArm_RisingSinking_B 
    dw Hitbox_KraidArm_10 
    dw $FFD2,$0003 
    dw Spritemap_KraidArm_RisingSinking_3 
    dw Hitbox_KraidArm_3 
    dw $FFD9,$FFFD 
    dw Spritemap_KraidArm_RisingSinking_8 
    dw Hitbox_KraidArm_9 

ExtendedSpritemap_KraidArm_RisingSinking_5:
    dw $0005,$FFD4,$0008 
    dw Spritemap_KraidArm_RisingSinking_4 
    dw Hitbox_KraidArm_4 
    dw $FFDB,$0002 
    dw Spritemap_KraidArm_RisingSinking_8 
    dw Hitbox_KraidArm_9 
    dw $0000,$0000 
    dw Spritemap_KraidArm_RisingSinking_B 
    dw Hitbox_KraidArm_10 
    dw $FFD2,$0004 
    dw Spritemap_KraidArm_RisingSinking_4 
    dw Hitbox_KraidArm_4 
    dw $FFD9,$FFFE 
    dw Spritemap_KraidArm_RisingSinking_8 
    dw Hitbox_KraidArm_9 

ExtendedSpritemap_KraidArm_RisingSinking_6:
    dw $0005,$FFD9,$000A 
    dw Spritemap_KraidArm_RisingSinking_5 
    dw Hitbox_KraidArm_5 
    dw $FFDA,$0000 
    dw Spritemap_KraidArm_RisingSinking_9 
    dw Hitbox_KraidArm_A 
    dw $0000,$0000 
    dw Spritemap_KraidArm_RisingSinking_B 
    dw Hitbox_KraidArm_10 
    dw $FFD5,$000A 
    dw Spritemap_KraidArm_RisingSinking_5 
    dw Hitbox_KraidArm_5 
    dw $FFD7,$FFFE 
    dw Spritemap_KraidArm_RisingSinking_9 
    dw Hitbox_KraidArm_A 

ExtendedSpritemap_KraidArm_RisingSinking_7:
    dw $0005,$FFD9,$000A 
    dw Spritemap_KraidArm_RisingSinking_5 
    dw Hitbox_KraidArm_5 
    dw $FFDA,$0000 
    dw Spritemap_KraidArm_RisingSinking_9 
    dw Hitbox_KraidArm_A 
    dw $0000,$0000 
    dw Spritemap_KraidArm_RisingSinking_B 
    dw Hitbox_KraidArm_10 
    dw $FFD5,$0009 
    dw Spritemap_KraidArm_RisingSinking_5 
    dw Hitbox_KraidArm_5 
    dw $FFD7,$FFFE 
    dw Spritemap_KraidArm_RisingSinking_9 
    dw Hitbox_KraidArm_A 

ExtendedSpritemap_KraidArm_RisingSinking_8:
    dw $0005,$FFD9,$000A 
    dw Spritemap_KraidArm_RisingSinking_6 
    dw Hitbox_KraidArm_6 
    dw $FFDA,$0000 
    dw Spritemap_KraidArm_RisingSinking_9 
    dw Hitbox_KraidArm_A 
    dw $0000,$0000 
    dw Spritemap_KraidArm_RisingSinking_B 
    dw Hitbox_KraidArm_10 
    dw $FFD5,$0009 
    dw Spritemap_KraidArm_RisingSinking_5 
    dw Hitbox_KraidArm_5 
    dw $FFD7,$FFFE 
    dw Spritemap_KraidArm_RisingSinking_9 
    dw Hitbox_KraidArm_A 

ExtendedSpritemap_KraidArm_RisingSinking_9:
    dw $0005,$FFD9,$000A 
    dw Spritemap_KraidArm_RisingSinking_6 
    dw Hitbox_KraidArm_6 
    dw $FFDA,$0000 
    dw Spritemap_KraidArm_RisingSinking_9 
    dw Hitbox_KraidArm_A 
    dw $0000,$0000 
    dw Spritemap_KraidArm_RisingSinking_B 
    dw Hitbox_KraidArm_10 
    dw $FFD6,$0009 
    dw Spritemap_KraidArm_RisingSinking_6 
    dw Hitbox_KraidArm_6 
    dw $FFD6,$FFFE 
    dw Spritemap_KraidArm_RisingSinking_9 
    dw Hitbox_KraidArm_A 

ExtendedSpritemap_KraidArm_Dying_PreparingToLungeForward_0:
    dw $0001,$0000,$0000 
    dw Spritemap_KraidArm_Dying_PreparingToLunge_0 
    dw Hitbox_KraidArm_Dying_PreparingToLungeForward_0 

ExtendedSpritemap_KraidArm_Dying_PreparingToLungeForward_1:
    dw $0001,$0000,$0000 
    dw Spritemap_KraidArm_Dying_PreparingToLunge_1 
    dw Hitbox_KraidArm_Dying_PreparingToLungeForward_1 

Hitbox_KraidLint:
    dw $0001 
    dw $FFE8,$FFFC,$0004,$0006 
    dw EnemyTouch_KraidArm_KraidFoot_Normal 
    dw RTL_A794B5 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Hitbox_KraidFoot:
    dw $0001,$FFF8,$FFF8,$0007,$0007 
    dw EnemyTouch_KraidArm_KraidFoot_Normal 
    dw RTL_A794B5 
endif ; !FEATURE_KEEP_UNREFERENCED

Hitbox_KraidArm_0:
    dw $0002,$FFF3,$FFF5,$FFFD,$FFFB 
    dw EnemyTouch_KraidArm 
    dw EnemyShot_KraidArm 
    dw $FFF7,$FFFB,$0001,$0002 
    dw EnemyTouch_KraidArm 
    dw EnemyShot_KraidArm 

Hitbox_KraidArm_1:
    dw $0001,$FFF0,$FFFB,$0001,$0002 
    dw EnemyTouch_KraidArm 
    dw EnemyShot_KraidArm 

Hitbox_KraidArm_2:
    dw $0002,$FFF7,$FFFE,$0001,$0007 
    dw EnemyTouch_KraidArm 
    dw EnemyShot_KraidArm 
    dw $FFF4,$0003,$FFFA,$000C 
    dw EnemyTouch_KraidArm 
    dw EnemyShot_KraidArm 

Hitbox_KraidArm_3:
    dw $0001,$FFFA,$FFFF,$0001,$000E 
    dw EnemyTouch_KraidArm 
    dw EnemyShot_KraidArm 

Hitbox_KraidArm_4:
    dw $0002,$FFFD,$FFFE,$0006,$0009 
    dw EnemyTouch_KraidArm 
    dw EnemyShot_KraidArm 
    dw $0002,$0007,$000B,$000B 
    dw EnemyTouch_KraidArm 
    dw EnemyShot_KraidArm 

Hitbox_KraidArm_5:
    dw $0001,$FFFF,$FFFC,$000E,$0004 
    dw EnemyTouch_KraidArm 
    dw EnemyShot_KraidArm 

Hitbox_KraidArm_6:
    dw $0002,$FFFD,$FFF9,$0006,$0002 
    dw EnemyTouch_KraidArm 
    dw EnemyShot_KraidArm 
    dw $0004,$FFF4,$000A,$FFFF 
    dw EnemyTouch_KraidArm 
    dw EnemyShot_KraidArm 

Hitbox_KraidArm_7:
    dw $0001,$FFFC,$FFF2,$0003,$0001 
    dw EnemyTouch_KraidArm_KraidFoot_Normal 
    dw EnemyShot_KraidArm 

Hitbox_KraidArm_8:
    dw $0001,$FFF1,$FFFB,$0002,$0004 
    dw EnemyTouch_KraidArm 
    dw EnemyShot_KraidArm 

Hitbox_KraidArm_9:
    dw $0002,$FFF5,$0002,$FFFC,$000A 
    dw EnemyTouch_KraidArm 
    dw EnemyShot_KraidArm 
    dw $FFFA,$FFFD,$0003,$0005 
    dw EnemyTouch_KraidArm 
    dw EnemyShot_KraidArm 

Hitbox_KraidArm_A:
    dw $0001,$FFFC,$FFFE,$0003,$000D 
    dw EnemyTouch_KraidArm 
    dw EnemyShot_KraidArm 

Hitbox_KraidArm_B:
    dw $0002,$0003,$0002,$000A,$000B 
    dw EnemyTouch_KraidArm_KraidFoot_Normal 
    dw EnemyShot_KraidArm 
    dw $FFFD,$FFFD,$0005,$0005 
    dw EnemyTouch_KraidArm_KraidFoot_Normal 
    dw EnemyShot_KraidArm 

Hitbox_KraidArm_C:
    dw $0001,$FFFD,$FFFB,$000E,$0004 
    dw EnemyTouch_KraidArm_KraidFoot_Normal 
    dw EnemyShot_KraidArm 

Hitbox_KraidArm_D:
    dw $0002,$0002,$FFF4,$000B,$FFFC 
    dw EnemyTouch_KraidArm_KraidFoot_Normal 
    dw EnemyShot_KraidArm 
    dw $FFFD,$FFF9,$0004,$0002 
    dw EnemyTouch_KraidArm_KraidFoot_Normal 
    dw EnemyShot_KraidArm 

Hitbox_KraidArm_E:
    dw $0001,$FFFC,$FFF1,$0005,$0002 
    dw EnemyTouch_KraidArm_KraidFoot_Normal 
    dw EnemyShot_KraidArm 

Hitbox_KraidArm_F:
    dw $0002,$FFF4,$FFF4,$FFFD,$FFFD 
    dw EnemyTouch_KraidArm 
    dw EnemyShot_KraidArm 
    dw $FFFA,$FFFA,$0003,$0002 
    dw EnemyTouch_KraidArm 
    dw EnemyShot_KraidArm 

Hitbox_KraidArm_10:
    dw $0001,$FFD3,$FFF7,$0004,$0008 
    dw EnemyTouch_KraidArm_KraidFoot_Normal 
    dw EnemyShot_KraidArm 

Hitbox_KraidArm_11:
    dw $0002,$FFE4,$FFEF,$FFF4,$0000 
    dw EnemyTouch_KraidArm_KraidFoot_Normal 
    dw EnemyShot_KraidArm 
    dw $FFD6,$FFE9,$FFE4,$FFFA 
    dw EnemyTouch_KraidArm_KraidFoot_Normal 
    dw EnemyShot_KraidArm 

Hitbox_KraidArm_12:
    dw $0002,$FFEA,$FFE7,$FFF8,$FFFB 
    dw EnemyTouch_KraidArm_KraidFoot_Normal 
    dw EnemyShot_KraidArm 
    dw $FFDD,$FFDD,$FFED,$FFEF 
    dw EnemyTouch_KraidArm_KraidFoot_Normal 
    dw EnemyShot_KraidArm 

Hitbox_KraidFoot:
    dw $0001,$FFFA,$FFFA,$0006,$0006 
    dw EnemyTouch_KraidArm_KraidFoot_Normal 
    dw RTL_A794B5 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Hitbox_KraidFoot_A79461:
    dw $0001,$FFFE,$FFFD,$0002,$0003 
    dw EnemyTouch_KraidArm_KraidFoot_Normal 
    dw RTL_A794B5 
endif ; !FEATURE_KEEP_UNREFERENCED

Hitbox_KraidArm_Dying_PreparingToLungeForward_0:
    dw $0001,$FFC0,$FFD0,$FFE0,$FFF0 
    dw EnemyTouch_KraidArm_KraidFoot_Normal 
    dw EnemyShot_KraidArm 

Hitbox_KraidArm_Dying_PreparingToLungeForward_1:
    dw $0001,$FFC0,$FFFC,$0000,$0004 
    dw EnemyTouch_KraidArm_KraidFoot_Normal 
    dw EnemyShot_KraidArm 

EnemyTouch_KraidArm_KraidFoot_Normal:
    JSL.L NormalEnemyTouchAI ; fallthrough to RTL_A7948F

RTL_A7948F:
    RTL 


EnemyTouch_KraidArm:
    LDA.W $18A8 : BEQ .SamusInvincible 
    RTL 


.SamusInvincible:
    JSR.W PushSamusBack 
    LDA.W #Function_KraidLint_FireLint : STA.W $10A8 

EnemyTouch_Kraid:
    JSL.L NormalEnemyTouchAI_NoDeathCheck_External 
    RTL 


PushSamusBack:
    LDA.W #$0004 : STA.W $0B58 
    LDA.W #$FFF8 : STA.W $0B5C 
    RTS 


NormalEnemyShot:
    JSL.L NormalEnemyShotAI ; fallthrough to RTL_A794B5

RTL_A794B5:
    RTL 


EnemyShot_KraidArm:
    TYX 
    JSR.W SpawnExplosionProjectile 
    LDA.W $0C04,Y : ORA.W #$0010 : STA.W $0C04,Y 
    RTL 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_KraidLint_A794C4:
    dw $0004,$0000 
    db $08 
    dw $21C2,$81F0 
    db $00 
    dw $21B0,$8000 
    db $F8 
    dw $21A2,$81F0 
    db $F8 
    dw $21A0 

UNUSED_Spritemap_KraidFoot_A794DA:
    dw $0001,$81F8 
    db $F8 
    dw $21A9 
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_KraidArm_General_0:
    dw $0001,$81F2 
    db $F4 
    dw $3126 

Spritemap_KraidArm_General_1:
    dw $0002,$01F9 
    db $FB 
    dw $3129,$01F1 
    db $FB 
    dw $3128 

Spritemap_KraidArm_General_2:
    dw $0001,$81F2 
    db $FD 
    dw $312A 

Spritemap_KraidArm_General_3:
    dw $0002,$01FA 
    db $07 
    dw $3139,$01FA 
    db $FF 
    dw $3138 

Spritemap_KraidArm_General_4:
    dw $0001,$81FD 
    db $FD 
    dw $F126 

Spritemap_KraidArm_General_5:
    dw $0002,$01FF 
    db $FD 
    dw $F129,$0007 
    db $FD 
    dw $F128 

Spritemap_KraidArm_General_6:
    dw $0001,$81FD 
    db $F4 
    dw $F12A 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_KraidArm_General_A79521:
    dw $0002,$01FC 
    db $F2 
    dw $F139,$01FC 
    db $FA 
    dw $F138 
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_KraidArm_General_7:
    dw $0002,$01FA 
    db $FC 
    dw $F12E,$01F2 
    db $FC 
    dw $B12E 

Spritemap_KraidArm_General_8:
    dw $0001,$81F4 
    db $FC 
    dw $B12C 

Spritemap_KraidArm_General_9:
    dw $0002,$01FC 
    db $06 
    dw $B13E,$01FC 
    db $FE 
    dw $313E 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_KraidArm_General_A7954C:
    dw $0001,$81FC 
    db $FC 
    dw $312C 

UNUSED_Spritemap_KraidArm_General_A79553:
    dw $0002,$0006 
    db $FC 
    dw $712E,$01FE 
    db $FC 
    dw $312E 

UNUSED_Spritemap_KraidArm_General_A7955F:
    dw $0001,$81FC 
    db $F4 
    dw $712C 

UNUSED_Spritemap_KraidArm_General_A79566:
    dw $0002,$01FD 
    db $FA 
    dw $F13E,$01FD 
    db $F2 
    dw $713E 
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_KraidArm_General_A:
    dw $0001,$81F4 
    db $F4 
    dw $312C 

Spritemap_KraidArm_General_B:
    dw $0003,$81F4 
    db $F8 
    dw $3104,$81E4 
    db $F8 
    dw $3102,$81D4 
    db $F8 
    dw $3100 

Spritemap_KraidArm_General_C:
    dw $0008,$01EC 
    db $00 
    dw $311C,$01FC 
    db $F0 
    dw $310F,$01F4 
    db $F0 
    dw $310E,$01E4 
    db $E8 
    dw $310D,$01DC 
    db $F8 
    dw $310C,$81F4 
    db $F8 
    dw $310A,$81E4 
    db $F0 
    dw $3108,$81D4 
    db $E8 
    dw $3106 

Spritemap_KraidArm_General_D:
    dw $0008,$01FC 
    db $ED 
    dw $313F,$01EC 
    db $FD 
    dw $312F,$01EC 
    db $F5 
    dw $311F,$01EC 
    db $DD 
    dw $311E,$01E4 
    db $ED 
    dw $311D,$81F4 
    db $F5 
    dw $3124,$81EC 
    db $E5 
    dw $3122,$81DC 
    db $DD 
    dw $3120 

Spritemap_KraidFoot_0:
    dw $0008,$8020 
    db $1C 
    dw $315A,$8020 
    db $14 
    dw $314A,$8010 
    db $1C 
    dw $3148,$01F8 
    db $0C 
    dw $314C,$8010 
    db $0C 
    dw $3146,$8000 
    db $0C 
    dw $3144,$8008 
    db $FC 
    dw $3142,$81F8 
    db $FC 
    dw $3140 

Spritemap_KraidFoot_1:
    dw $0008,$8012 
    db $28 
    dw $3168,$800A 
    db $28 
    dw $3167,$8010 
    db $18 
    dw $3182,$8000 
    db $18 
    dw $3180,$8008 
    db $08 
    dw $3165,$81F8 
    db $08 
    dw $3163,$8000 
    db $F8 
    dw $3161,$81F8 
    db $F8 
    dw $3160 

Spritemap_KraidFoot_2:
    dw $0008,$81F9 
    db $2C 
    dw $31AD,$81F8 
    db $1C 
    dw $318D,$81F8 
    db $0C 
    dw $316D,$81F8 
    db $FC 
    dw $314D,$8001 
    db $2C 
    dw $31AE,$8000 
    db $1C 
    dw $318E,$8000 
    db $0C 
    dw $316E,$8000 
    db $FC 
    dw $314E 

Spritemap_KraidFoot_3:
    dw $0008,$81F0 
    db $2C 
    dw $31A5,$81E8 
    db $2C 
    dw $31A4,$81F8 
    db $1C 
    dw $31CE,$81E8 
    db $1C 
    dw $31CC,$8000 
    db $0C 
    dw $317A,$81F0 
    db $0C 
    dw $3188,$8000 
    db $FC 
    dw $3186,$81F0 
    db $FC 
    dw $3184 

Spritemap_KraidFoot_4:
    dw $000C,$01D8 
    db $F4 
    dw $31C3,$0018 
    db $F4 
    dw $319A,$8000 
    db $F4 
    dw $31C8,$81F0 
    db $F4 
    dw $31C6,$81E0 
    db $F4 
    dw $31C4,$81D0 
    db $FC 
    dw $31A7,$8020 
    db $FC 
    dw $31AB,$8020 
    db $F4 
    dw $319B,$8010 
    db $FC 
    dw $31DA,$8000 
    db $FC 
    dw $31D8,$81F0 
    db $FC 
    dw $31D6,$81E0 
    db $FC 
    dw $31D4 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_KraidFoot_A796C4:
    dw $0001,$81F8 
    db $F8 
    dw $21D0 

UNUSED_Spritemap_KraidFoot_A796CB:
    dw $0001,$01FC 
    db $FC 
    dw $21D2 
endif ; !FEATURE_KEEP_UNREFERENCED

InstList_Kraid_Roar_0:
    dw $000A 
    dw Tilemap_KraidHead_0 
    dw Hitbox_KraidMouth_0 
    dw $FFFF 

InstList_Kraid_Roar_1:
    dw $000A 
    dw Tilemap_KraidHead_1 
    dw Hitbox_KraidMouth_1 
    dw Hitbox_KraidMouth_5 

InstList_Kraid_Roar_2:
    dw $000A 
    dw Tilemap_KraidHead_2 
    dw Hitbox_KraidMouth_2 
    dw Hitbox_KraidMouth_6 

InstList_Kraid_Roar_3:
    dw Instruction_Kraid_PlayRoarSFX 

InstList_Kraid_Roar_4:
    dw $0040 
    dw Tilemap_KraidHead_3 
    dw Hitbox_KraidMouth_3 
    dw Hitbox_KraidMouth_7 

InstList_Kraid_Roar_5:
    dw $000A 
    dw Tilemap_KraidHead_2 
    dw Hitbox_KraidMouth_2 
    dw Hitbox_KraidMouth_6 

InstList_Kraid_Roar_6:
    dw $000A 
    dw Tilemap_KraidHead_1 
    dw Hitbox_KraidMouth_1 
    dw Hitbox_KraidMouth_5 

InstList_Kraid_Roar_7:
    dw $000A 
    dw Tilemap_KraidHead_0 
    dw Hitbox_KraidMouth_0 
    dw $FFFF 

InstList_Kraid_Roar_8:
    dw $FFFF 

InstList_Kraid_DyingRoar_0:
    dw $0014 
    dw Tilemap_KraidHead_0 
    dw Hitbox_KraidMouth_0 
    dw $FFFF 

InstList_Kraid_DyingRoar_1:
    dw $0014 
    dw Tilemap_KraidHead_1 
    dw Hitbox_KraidMouth_1 
    dw Hitbox_KraidMouth_5 
    dw $0014 
    dw Tilemap_KraidHead_2 
    dw Hitbox_KraidMouth_2 
    dw Hitbox_KraidMouth_6 
    dw Instruction_Kraid_PlayRoarSFX 
    dw $00C0 
    dw Tilemap_KraidHead_3 
    dw Hitbox_KraidMouth_3 
    dw Hitbox_KraidMouth_7 
    dw $0014 
    dw Tilemap_KraidHead_2 
    dw Hitbox_KraidMouth_2 
    dw Hitbox_KraidMouth_6 
    dw $0014 
    dw Tilemap_KraidHead_1 
    dw Hitbox_KraidMouth_1 
    dw Hitbox_KraidMouth_5 
    dw $0014 
    dw Tilemap_KraidHead_0 
    dw Hitbox_KraidMouth_0 
    dw $FFFF,$FFFF 

InstList_Kraid_EyeGlowing_0:
    dw $0005 
    dw Tilemap_KraidHead_0 
    dw Hitbox_KraidMouth_0 
    dw $FFFF 

InstList_Kraid_EyeGlowing_1:
    dw $000A 
    dw Tilemap_KraidHead_1 
    dw Hitbox_KraidMouth_1 
    dw Hitbox_KraidMouth_5 
    dw $0005 
    dw Tilemap_KraidHead_0 
    dw Hitbox_KraidMouth_0 
    dw $FFFF,$FFFF 

InstList_Kraid_Dying_0:
    dw $0019 
    dw Tilemap_KraidHead_0 
    dw Hitbox_KraidMouth_0 
    dw $FFFF 

InstList_Kraid_Dying_1:
    dw $0019 
    dw Tilemap_KraidHead_1 
    dw Hitbox_KraidMouth_1 
    dw Hitbox_KraidMouth_5 
    dw $0019 
    dw Tilemap_KraidHead_2 
    dw Hitbox_KraidMouth_2 
    dw Hitbox_KraidMouth_6 
    dw Instruction_Kraid_PlayDyingSFX 
    dw $0040 
    dw Tilemap_KraidHead_3 
    dw Hitbox_KraidMouth_3 
    dw Hitbox_KraidMouth_7 
    dw $FFFF 

Hitbox_KraidMouth_0:
    dw $0010,$FF88,$0028,$FFA8 

Hitbox_KraidMouth_1:
    dw $0010,$FF88,$0028,$FF98 

Hitbox_KraidMouth_2:
    dw $0010,$FF80,$0028,$FF90 

Hitbox_KraidMouth_3:
    dw $0010,$FF80,$0028,$FF88 

Hitbox_KraidMouth_4:
    dw $0000,$0000,$0000,$0000 

Hitbox_KraidMouth_5:
    dw $0006,$FFA0,$0020,$FFB0 

Hitbox_KraidMouth_6:
    dw $0000,$FF98,$0020,$FFB0 

Hitbox_KraidMouth_7:
    dw $0000,$FF90,$0020,$FFB0 

Tilemap_KraidHead_0:
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$3C00,$3C01,$3C02,$3C03 
    dw $3C04,$3C05,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$3C06,$3C07,$3C08,$3C09,$3C0A,$3C0B 
    dw $3C0C,$3C0D,$3C0E,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$3C0F,$3C10,$3C11,$3C12,$3C13,$3C14 
    dw $3C15,$3C16,$3C17,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$3C18,$3C19,$3C1A,$3C1B,$3C1C,$3C1D,$3C1E 
    dw $3C1F,$3C20,$3C21,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$3C22,$3C23,$3C24,$3C25,$3C26,$3C27,$3C28 
    dw $3C29,$3C2A,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $3C2B,$3C2C,$3C2D,$3C2E,$3C2F,$3C30,$3C31,$3C32 
    dw $3C33,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$3C34,$3C35,$3C36,$3C37,$3C38,$3C39,$3C3A 
    dw $3C3B,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$3C3C 
    dw $3C3D,$3C3E,$3C3F,$3C40,$3C41,$3C42,$3C43,$3C44 
    dw $3C45,$3C46,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$3C47 
    dw $3C48,$3C49,$3C4A,$3C4B,$3C4C,$3C4D,$3C4E,$3C4F 
    dw $3C50,$3C51,$3C52,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$3C53 
    dw $3C54,$3C55,$3C56,$3C57,$3C58,$3C59,$3C5A,$3C5B 
    dw $3C5C,$3C5D,$3C5E,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$3C5F 
    dw $3C60,$3C61,$3D50,$3D50,$3C62,$3C63,$3C64,$3C65 
    dw $3C66,$3C67,$3C68,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$3C69,$3C6A 
    dw $3D50,$3D50,$3D50,$3C6B,$3C6C,$3C6D,$3C6E,$3C6F 
    dw $3C70,$3C71,$3C72,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 

Tilemap_KraidHead_1:
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$3C73,$3C74,$3C75,$3C76 
    dw $3C77,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$3C78,$3C79,$3C7A,$3C7B,$3C7C 
    dw $3C7D,$3C7E,$3C7F,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$3C80,$3C81,$3C82,$3C83,$3C84,$3C85 
    dw $3C86,$3C87,$3C88,$3C89,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$3C8A,$3C8B,$3C8C,$3C8D,$3C8E,$3C8F,$3C90 
    dw $3C91,$3C92,$3C93,$3C94,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$3C95 
    dw $0338,$3C96,$3C97,$3C98,$3C99,$3C9A,$3C9B,$3C9C 
    dw $3C9D,$3C9E,$3C9F,$3CA0,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$3CA1 
    dw $3CA2,$3CA3,$3CA4,$3CA5,$3CA6,$3CA7,$3CA8,$3CA9 
    dw $3CAA,$3CAB,$3CAC,$3CAD,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$3CAE 
    dw $3CAF,$3CB0,$3CB1,$3CB2,$3CB3,$3CB4,$3C43,$3C44 
    dw $3C45,$3C46,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $3CB5,$3CB6,$3CB7,$3CB8,$3C4C,$3C4D,$3C4E,$3C4F 
    dw $3C50,$3C51,$3C52,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$3CB9 
    dw $3CBA,$3CBB,$3C56,$3C57,$3C58,$3C59,$3C5A,$3C5B 
    dw $3C5C,$3C5D,$3C5E,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$3C5F 
    dw $3C60,$3C61,$3D50,$3D50,$3C62,$3C63,$3C64,$3C65 
    dw $3C66,$3C67,$3C68,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$3C69,$3C6A 
    dw $3D50,$3D50,$3D50,$3C6B,$3C6C,$3C6D,$3C6E,$3C6F 
    dw $3C70,$3C71,$3C72,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 

Tilemap_KraidHead_2:
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$3CBC,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$3CBD,$3CBE,$3CBF,$3CC0 
    dw $3CC1,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$3CC2,$3CC3,$3CC4,$3CC5,$3CC6,$3CC7 
    dw $3CC8,$3CC9,$3CCA,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $3CCB,$3CCC,$3CCD,$3CCE,$3CCF,$3CD0,$3CD1,$3CD2 
    dw $3CD3,$3CD4,$3D43,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$3CD5 
    dw $3CD6,$3CD7,$3CD8,$3CD9,$3CDA,$3CDB,$3CDC,$3CDD 
    dw $3CDE,$3CDF,$3CE0,$3CE1,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$3CE2 
    dw $3CE3,$3CE4,$3CE5,$3CE6,$3CE7,$3CE8,$3CE9,$3CEA 
    dw $3CEB,$3CEC,$3CED,$3CEE,$3CEF,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$3CF0,$3CF1,$3CF2,$3CF3,$3CF4,$3CF5 
    dw $3CF6,$3CF7,$3CF8,$3CF9,$3CFA,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $3CFB,$3CFC,$3CB7,$3CFD,$3CFE,$3C4D,$3C4E,$3C4F 
    dw $3C50,$3C51,$3CFF,$3D00,$3D44,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$3CB9 
    dw $3CBA,$3CBB,$3C56,$3C57,$3C58,$3C59,$3C5A,$3C5B 
    dw $3C5C,$3C5D,$3C5E,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$3C5F 
    dw $3C60,$3C61,$3D50,$3D50,$3C62,$3C63,$3C64,$3C65 
    dw $3C66,$3C67,$3C68,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$3C69,$3C6A 
    dw $3D50,$3D50,$3D50,$3C6B,$3C6C,$3C6D,$3C6E,$3C6F 
    dw $3C70,$3C71,$3C72,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 

Tilemap_KraidHead_3:
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $3D01,$3D02,$0338,$3D03,$3D04,$3D05,$3D06,$3D07 
    dw $3D08,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $3D09,$3D0A,$3D0B,$3D0C,$3D0D,$3D0E,$3D0F,$3D10 
    dw $3D11,$3D12,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $3D13,$3D14,$3D15,$3D16,$3D17,$3D18,$3D19,$3D1A 
    dw $3D1B,$3D1C,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$3D1D,$3D1E,$3D1F,$3D20,$3D21,$3D22 
    dw $3D23,$3D24,$3D25,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$3D26,$3D27,$3D28,$3D29,$3D2A,$3D2B 
    dw $3D2C,$3D2D,$3D2E,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $3D2F,$3D30,$3CB7,$3D31,$3D32,$3D33,$3D34,$3D35 
    dw $3D36,$3C51,$3D37,$3D38,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$3CB9 
    dw $3CBA,$3CBB,$3C56,$3C57,$3C58,$3C59,$3D39,$3D3A 
    dw $3D3B,$3D3C,$3D3D,$3D3E,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$3C5F 
    dw $3C60,$3C61,$3D50,$3D50,$3C62,$3C63,$3C64,$3C65 
    dw $3C66,$3D3F,$3D40,$3D41,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$3C69,$3C6A 
    dw $3D50,$3D50,$3D50,$3C6B,$3C6C,$3C6D,$3C6E,$3C6F 
    dw $3C70,$3C71,$3D42,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ExtendedSpritemap_KraidArm_A7A3C8:
    dw $0002,$0000,$0000 
    dw Spritemap_KraidArm_RisingSinking_A 
    dw Hitbox_KraidArm_F 
    dw $FFF7,$FFF6 
    dw Spritemap_KraidArm_RisingSinking_0 
    dw Hitbox_KraidArm_0 

UNUSED_ExtendedSpritemap_KraidArm_A7A3DA:
    dw $0002,$FFF9,$FFF8 
    dw Spritemap_KraidArm_RisingSinking_1 
    dw Hitbox_KraidArm_1 
    dw $0001,$0000 
    dw Spritemap_KraidArm_RisingSinking_A 
    dw Hitbox_KraidArm_F 

UNUSED_ExtendedSpritemap_KraidArm_A7A3EC:
    dw $0002,$FFF6,$0001 
    dw Spritemap_KraidArm_RisingSinking_1 
    dw Hitbox_KraidArm_1 
    dw $0000,$0000 
    dw Spritemap_KraidArm_RisingSinking_7 
    dw Hitbox_KraidArm_8 

UNUSED_ExtendedSpritemap_KraidArm_A7A3FE:
    dw $0002,$FFF6,$0000 
    dw Spritemap_KraidArm_RisingSinking_2 
    dw Hitbox_KraidArm_2 
    dw $0000,$0000 
    dw Spritemap_KraidArm_RisingSinking_7 
    dw Hitbox_KraidArm_8 

UNUSED_ExtendedSpritemap_KraidArm_A7A410:
    dw $0002,$FFF6,$0000 
    dw Spritemap_KraidArm_RisingSinking_3 
    dw Hitbox_KraidArm_3 
    dw $0000,$0000 
    dw Spritemap_KraidArm_RisingSinking_7 
    dw Hitbox_KraidArm_8 

UNUSED_ExtendedSpritemap_KraidArm_A7A422:
    dw $0002,$FFFA,$0006 
    dw Spritemap_KraidArm_RisingSinking_3 
    dw Hitbox_KraidArm_3 
    dw $0000,$0000 
    dw Spritemap_KraidArm_RisingSinking_8 
    dw Hitbox_KraidArm_9 

UNUSED_ExtendedSpritemap_KraidArm_A7A434:
    dw $0002,$FFF8,$0006 
    dw Spritemap_KraidArm_RisingSinking_4 
    dw Hitbox_KraidArm_4 
    dw $0000,$0000 
    dw Spritemap_KraidArm_RisingSinking_8 
    dw Hitbox_KraidArm_9 

UNUSED_ExtendedSpritemap_KraidArm_A7A446:
    dw $0002,$FFF8,$0006 
    dw Spritemap_KraidArm_RisingSinking_5 
    dw Hitbox_KraidArm_5 
    dw $0000,$0000 
    dw Spritemap_KraidArm_RisingSinking_8 
    dw Hitbox_KraidArm_9 

UNUSED_ExtendedSpritemap_KraidArm_A7A458:
    dw $0002,$FFFF,$000C 
    dw Spritemap_KraidArm_RisingSinking_5 
    dw Hitbox_KraidArm_5 
    dw $0000,$0000 
    dw Spritemap_KraidArm_RisingSinking_9 
    dw Hitbox_KraidArm_A 

UNUSED_ExtendedSpritemap_KraidArm_A7A46A:
    dw $0002,$0000,$000B 
    dw Spritemap_KraidArm_RisingSinking_6 
    dw Hitbox_KraidArm_6 
    dw $0000,$0000 
    dw Spritemap_KraidArm_RisingSinking_9 
    dw Hitbox_KraidArm_A 
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_KraidArm_RisingSinking_0:
    dw $0001,$81F2 
    db $F4 
    dw $2126 

Spritemap_KraidArm_RisingSinking_1:
    dw $0002,$01F9 
    db $FB 
    dw $2129,$01F1 
    db $FB 
    dw $2128 

Spritemap_KraidArm_RisingSinking_2:
    dw $0001,$81F2 
    db $FD 
    dw $212A 

Spritemap_KraidArm_RisingSinking_3:
    dw $0002,$01FA 
    db $07 
    dw $2139,$01FA 
    db $FF 
    dw $2138 

Spritemap_KraidArm_RisingSinking_4:
    dw $0001,$81FD 
    db $FD 
    dw $E126 

Spritemap_KraidArm_RisingSinking_5:
    dw $0002,$01FF 
    db $FD 
    dw $E129,$0007 
    db $FD 
    dw $E128 

Spritemap_KraidArm_RisingSinking_6:
    dw $0001,$81FD 
    db $F4 
    dw $E12A 

Spritemap_KraidArm_RisingSinking_7:
    dw $0002,$01FA 
    db $FC 
    dw $E12E,$01F2 
    db $FC 
    dw $A12E 

Spritemap_KraidArm_RisingSinking_8:
    dw $0001,$81F4 
    db $FC 
    dw $A12C 

Spritemap_KraidArm_RisingSinking_9:
    dw $0002,$01FC 
    db $06 
    dw $A13E,$01FC 
    db $FE 
    dw $213E 

Spritemap_KraidArm_RisingSinking_A:
    dw $0001,$81F4 
    db $F4 
    dw $212C 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ExtendedSpritemap_KraidArm_A7A4E2:
    dw $0001,$0000,$0000 
    dw Spritemap_KraidArm_RisingSinking_D 
    dw Hitbox_KraidArm_12 

UNUSED_ExtendedSpritemap_KraidArm_A7A4EC:
    dw $0001,$0000,$0000 
    dw Spritemap_KraidArm_RisingSinking_C 
    dw Hitbox_KraidArm_11 

UNUSED_ExtendedSpritemap_KraidArm_A7A4F6:
    dw $0001,$0000,$0000 
    dw Spritemap_KraidArm_RisingSinking_B 
    dw Hitbox_KraidArm_10 
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_KraidArm_RisingSinking_B:
    dw $0003,$81F4 
    db $F8 
    dw $2104,$81E4 
    db $F8 
    dw $2102,$81D4 
    db $F8 
    dw $2100 

Spritemap_KraidArm_RisingSinking_C:
    dw $0008,$01EC 
    db $00 
    dw $211C,$01FC 
    db $F0 
    dw $210F,$01F4 
    db $F0 
    dw $210E,$01E4 
    db $E8 
    dw $210D,$01DC 
    db $F8 
    dw $210C,$81F4 
    db $F8 
    dw $210A,$81E4 
    db $F0 
    dw $2108,$81D4 
    db $E8 
    dw $2106 

Spritemap_KraidArm_RisingSinking_D:
    dw $0008,$01FC 
    db $ED 
    dw $213F,$01EC 
    db $FD 
    dw $212F,$01EC 
    db $F5 
    dw $211F,$01EC 
    db $DD 
    dw $211E,$01E4 
    db $ED 
    dw $211D,$81F4 
    db $F5 
    dw $2124,$81EC 
    db $E5 
    dw $2122,$81DC 
    db $DD 
    dw $2120 

ExtendedSpritemap_KraidFoot_Initial:
    dw $0002,$0008,$0028 
    dw Spritemap_KraidFoot_6 
    dw Hitbox_KraidFoot 
    dw $0000,$0000 
    dw Spritemap_KraidFoot_5 
    dw Hitbox_KraidFoot 

Spritemap_KraidFoot_5:
    dw $0008,$8020 
    db $1C 
    dw $215A,$8020 
    db $14 
    dw $214A,$8010 
    db $1C 
    dw $2148,$01F8 
    db $0C 
    dw $214C,$8010 
    db $0C 
    dw $2146,$8000 
    db $0C 
    dw $2144,$8008 
    db $FC 
    dw $2142,$81F8 
    db $FC 
    dw $2140 

Spritemap_KraidFoot_6:
    dw $000C,$01D8 
    db $F4 
    dw $21C3,$0018 
    db $F4 
    dw $219A,$8000 
    db $F4 
    dw $21C8,$81F0 
    db $F4 
    dw $21C6,$81E0 
    db $F4 
    dw $21C4,$81D0 
    db $FC 
    dw $21A7,$8020 
    db $FC 
    dw $21AB,$8020 
    db $F4 
    dw $219B,$8010 
    db $FC 
    dw $21DA,$8000 
    db $FC 
    dw $21D8,$81F0 
    db $FC 
    dw $21D6,$81E0 
    db $FC 
    dw $21D4 

Spritemap_KraidLint_Initial:
    dw $0005,$0000 
    db $08 
    dw $11C2,$81F0 
    db $00 
    dw $11B0,$8000 
    db $F8 
    dw $11A2,$81F0 
    db $F8 
    dw $11A0,$8000 
    db $08 
    dw $11A9 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_KraidLint_A7A5FA:
    dw $0004,$0000 
    db $08 
    dw $11C2,$81F0 
    db $00 
    dw $11B0,$8000 
    db $F8 
    dw $11A2,$81F0 
    db $F8 
    dw $11A0 

UNUSED_Spritemap_KraidLint_A7A610:
    dw $0001,$81F8 
    db $F8 
    dw $11A9 
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_KraidNail_0:
    dw $0002,$C3F4 
    db $F8 
    dw $212A,$C3FC 
    db $F8 
    dw $212C 

Spritemap_KraidNail_1:
    dw $0004,$01F9 
    db $FB 
    dw $2138,$01F9 
    db $03 
    dw $2139,$0002 
    db $F9 
    dw $612E,$01FA 
    db $F9 
    dw $212E 

Spritemap_KraidNail_2:
    dw $0002,$C3F9 
    db $FB 
    dw $E126,$C3F9 
    db $F4 
    dw $612C 

Spritemap_KraidNail_3:
    dw $0004,$01FC 
    db $FF 
    dw $E129,$0004 
    db $FF 
    dw $E128,$01F9 
    db $FE 
    dw $E13E,$01F9 
    db $F6 
    dw $613E 

Spritemap_KraidNail_4:
    dw $0002,$C3FC 
    db $F8 
    dw $E12A,$C3F4 
    db $F8 
    dw $212C 

Spritemap_KraidNail_5:
    dw $0004,$01FF 
    db $FD 
    dw $E138,$01FF 
    db $F5 
    dw $E139,$01FD 
    db $FF 
    dw $E12E,$01F5 
    db $FF 
    dw $A12E 

Spritemap_KraidNail_6:
    dw $0002,$C3F7 
    db $F4 
    dw $2126,$C3F7 
    db $FC 
    dw $A12C 

Spritemap_KraidNail_7:
    dw $0004,$01FD 
    db $F9 
    dw $2129,$01F5 
    db $F9 
    dw $2128,$01FF 
    db $03 
    dw $A13E,$01FF 
    db $FB 
    dw $213E 

Spritemap_KraidArm_Dying_PreparingToLunge_0:
    dw $000C,$C3C1 
    db $D8 
    dw $3326,$C3CE 
    db $E3 
    dw $332C,$C3C2 
    db $D2 
    dw $3326,$C3CF 
    db $DD 
    dw $332C,$01FF 
    db $EF 
    dw $330F,$01F7 
    db $EF 
    dw $330E,$01EF 
    db $FF 
    dw $331C,$01DF 
    db $F7 
    dw $330C,$01E7 
    db $E7 
    dw $330D,$C3F7 
    db $F7 
    dw $330A,$C3E7 
    db $EF 
    dw $3308,$C3D7 
    db $E7 
    dw $3306 

Spritemap_KraidArm_Dying_PreparingToLunge_1:
    dw $000B,$01BD 
    db $FE 
    dw $3328,$01C5 
    db $FE 
    dw $3329,$01D4 
    db $FE 
    dw $732E,$01CC 
    db $FE 
    dw $332E,$01B9 
    db $F9 
    dw $3328,$01C1 
    db $F9 
    dw $3329,$01D0 
    db $F9 
    dw $732E,$01C8 
    db $F9 
    dw $332E,$C3F4 
    db $F8 
    dw $3304,$C3E4 
    db $F8 
    dw $3302,$C3D4 
    db $F8 
    dw $3300 

Tiles_KraidRoomBackground:
    db $3F,$FF,$4C,$F3,$5F,$E0,$CB,$F0,$B9,$C0,$8F,$F0,$B6,$C9,$B1,$CE 
    db $00,$FF,$3F,$C0,$39,$C6,$3C,$C3,$76,$89,$71,$8E,$7F,$80,$7F,$80 
    db $FF,$FF,$3F,$FF,$8F,$7F,$4E,$BF,$E7,$1F,$EF,$1F,$CF,$3F,$1F,$FF 
    db $03,$FC,$FB,$04,$FF,$00,$FF,$00,$FE,$01,$FD,$02,$F3,$0C,$E8,$17 
    db $07,$FF,$8F,$FF,$FE,$FF,$FE,$FF,$FF,$FF,$FF,$FF,$F6,$FF,$C3,$FF 
    db $FE,$01,$FE,$01,$FD,$02,$FD,$02,$FF,$00,$BB,$44,$0F,$F0,$3F,$C0 
    db $FF,$F9,$07,$FE,$13,$EF,$29,$D7,$BD,$C3,$D5,$EB,$E1,$FF,$61,$FF 
    db $06,$F9,$F9,$06,$FC,$03,$FE,$01,$7E,$81,$BE,$41,$DE,$21,$DE,$21 
    db $8D,$F2,$0B,$F4,$E0,$FF,$0F,$FF,$E7,$1F,$5B,$A7,$B4,$4B,$FC,$03 
    db $7F,$80,$7F,$80,$1F,$E0,$F0,$0F,$FE,$01,$FF,$00,$FF,$00,$CF,$30 
    db $3E,$FF,$3E,$FD,$7F,$F8,$FB,$F4,$F9,$F6,$EF,$F0,$E5,$FA,$E3,$FC 
    db $D1,$2E,$E3,$1C,$C7,$38,$CF,$30,$4E,$B1,$3E,$C1,$9F,$60,$DF,$20 
    db $E1,$1F,$EC,$13,$7A,$85,$9E,$01,$99,$06,$FF,$00,$FE,$01,$F8,$87 
    db $FF,$00,$FF,$00,$9F,$60,$6F,$D0,$67,$98,$07,$F8,$8F,$70,$FF,$00 
    db $E1,$FF,$A3,$FF,$FC,$FF,$70,$FF,$60,$FF,$66,$F9,$43,$FC,$4F,$F0 
    db $DE,$21,$FC,$03,$E3,$1C,$EF,$10,$FF,$00,$DF,$20,$FF,$00,$FD,$02 
    db $4E,$81,$CE,$01,$F8,$07,$B4,$4B,$B1,$4F,$23,$DF,$02,$FF,$0F,$FF 
    db $B7,$68,$B7,$48,$CF,$30,$FF,$00,$FE,$01,$FD,$02,$FD,$02,$F1,$0E 
    db $66,$F9,$71,$FE,$70,$FF,$FC,$FF,$87,$FF,$03,$FF,$1D,$C3,$3E,$C1 
    db $FF,$00,$EF,$10,$CF,$30,$CB,$34,$FF,$00,$FF,$00,$EF,$10,$CF,$30 
    db $EC,$13,$68,$97,$41,$BF,$03,$FF,$8F,$FF,$FE,$FF,$F8,$FF,$F1,$FE 
    db $FF,$00,$FF,$00,$FF,$00,$FE,$01,$F7,$08,$FF,$00,$FF,$00,$FF,$00 
    db $CF,$F0,$EF,$F0,$E3,$FC,$E2,$FD,$F1,$FE,$02,$FF,$EA,$17,$9D,$03 
    db $FC,$03,$9E,$61,$1F,$E0,$1F,$E0,$8F,$70,$FD,$02,$FD,$02,$FE,$41 
    db $3F,$FF,$FF,$FF,$C7,$F9,$9F,$E0,$9F,$E0,$8E,$F1,$C3,$FF,$FF,$7F 
    db $C1,$3E,$01,$FE,$3E,$C1,$7F,$80,$77,$88,$7F,$80,$3C,$C3,$80,$7F 
    db $74,$8B,$B9,$C7,$C1,$FF,$FB,$FF,$FF,$FF,$9F,$FF,$FE,$FF,$3C,$FF 
    db $FF,$00,$FF,$00,$FF,$00,$E7,$18,$27,$D8,$6F,$90,$0F,$F0,$DF,$20 
    db $F3,$FC,$F2,$FD,$79,$FE,$F9,$FF,$F8,$FF,$FC,$FF,$3F,$FF,$0F,$FD 
    db $DF,$20,$DF,$20,$C7,$38,$07,$F8,$C7,$38,$E3,$1C,$F8,$07,$F2,$0D 
    db $9D,$03,$F5,$0B,$B9,$47,$D3,$2F,$A7,$DF,$0F,$FF,$1F,$F9,$FF,$EF 
    db $6E,$91,$8E,$71,$FE,$01,$FC,$03,$F8,$07,$F0,$0F,$E6,$19,$10,$EF 

KraidLint_InitialFunctionTimers_top:
    dw $0120 

KraidLint_InitialFunctionTimers_middle:
    dw $00A0 

KraidLint_InitialFunctionTimers_bottom:
    dw $0040 

KraidForwardsSpeed:
    dw $0003 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_KraidConstant_A7A91E:
    dw $0005 
endif ; !FEATURE_KEEP_UNREFERENCED

KraidBackwardsSpeed:
    dw $0003 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_KraidBackwardsFastSpeed_A7A922:
    dw $0004 

UNUSED_KraidConstant_A7A924:
    dw $0110 
endif ; !FEATURE_KEEP_UNREFERENCED

KraidLint_XSubSpeed:
    dw $8000 

KraidLint_XSpeed:
    dw $0003 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_REP30_A7A92A:
    REP #$30 
endif ; !FEATURE_KEEP_UNREFERENCED

CheckIfKraidHasDied:
    PHX 
    LDX.W $079F 
    LDA.L $7ED828,X : BIT.W #$0001 
    BEQ .returnAlive 
    PLX 
    LDA.W #$0001 
    RTS 


.returnAlive:
    PLX 
    LDA.W #$0000 
    RTS 


SetEnemyPropertiesToDead:
    LDX.W $0E54 
    LDA.W $0F86,X 
    ORA.W #$0700 
    AND.W #$F7FF ; >.< $57FF
    AND.W #$DFFF 
    AND.W #$7FFF 
    STA.W $0F86,X 
    RTS 


InitAI_Kraid:
    SEP #$20 
    LDA.B #$A7 : STA.W $0606 
    LDA.B #$A7 : STA.W $0603 
    REP #$20 
    LDA.W #UnpauseHook_KraidIsAlive : STA.W $0604 
    LDA.W #PauseHook_Kraid : STA.W $0601 
    JSR.W CheckIfKraidHasDied 
    BNE .dead 
    JMP.W .alive 


.dead:
    LDX.W #$00C0 
    LDY.W #$0000 

.loopBGPalette6:
    LDA.W Palette_KraidRoomBackground,Y : STA.L $7EC200,X 
    INX #2
    INY #2
    CPY.W #$0020 
    BMI .loopBGPalette6 
    LDX.W #$07FE 
    LDA.W #$0338 

.loopBG2Tilemap:
    STA.L $7E2000,X 
    DEX #2
    BPL .loopBG2Tilemap 
    LDA.W #$0000 : STA.L $7E7804 
    LDX.W $0330 
    LDA.W #$0200 : STA.B $D0,X 
    LDA.W #Tiles_KraidRoomBackground : STA.B $D2,X 
    SEP #$20 
    LDA.B #Tiles_KraidRoomBackground>>16 : STA.B $D4,X 
    REP #$20 
    LDA.B $5D : AND.W #$000F 
    XBA 
    CLC : ADC.W #$3F00 : STA.B $D5,X 
    TXA 
    CLC : ADC.W #$0007 : STA.W $0330 
    JSR.W SpawnPLMToClearTheCeiling 
    JSR.W SpawnPLMToClearTheSpikes 
    LDA.W #Function_Kraid_FadeInRegularBG_ClearBG2TilemapTopHalf : STA.W $0FA8 
    RTL 


.alive:
    SEP #$20 
    LDA.B #$43 : STA.B $59 
    REP #$20 
    LDA.W #$0002 : STA.W $0941 
    LDA.W #$0000 : STA.L $7ECD20 
    LDA.W #$0001 : STA.L $7ECD22 
    LDA.W #$0144 : STA.L $7E7808 
    LDX.W #$0000 
    LDA.W $0F8C 
    LSR #3
    STA.B $12 

.loopKraidHealth:
    STA.L $7E780C,X 
    CLC : ADC.B $12 : INX #2
    CPX.W #$0010 
    BMI .loopKraidHealth 
    LDA.W #$DFFF : STA.B $12 
    LDX.W $0E54 
    JSR.W SetupKraidGFXWithTheTilePriorityCleared 
    LDA.W $0F8C 
    LSR #2
    STA.L $7E7820 
    CLC : ADC.L $7E7820 : STA.L $7E7822 
    CLC : ADC.L $7E7820 : STA.L $7E7824 
    CLC : ADC.L $7E7820 : STA.L $7E7826 
    LDA.W #$0000 : STA.L $7E783E 
    LDA.W #$00B0 : STA.W $0F7A 
    LDA.W #$0250 : STA.W $0F7E 
    LDA.W $0F86 : ORA.W #$0400 : STA.W $0F86 
    LDA.W #Function_Kraid_RestrictSamusXPositionToFirstScreen : STA.W $0FA8 
    LDA.W #$012C : STA.W $0FB2 
    LDA.W #Function_Kraid_RaiseThruFloor_LoadTilemapTopHalf : STA.L $7E7800 
    LDA.W #$0040 : STA.W $0FAC 
    JSL.L DisableMinimap_MarkBossRoomTilesExplored 
    LDX.W #$003E 
    LDA.W #$0338 

.loopKraidGFX:
    STA.L $7E2FC0,X 
    DEX #2
    BPL .loopKraidGFX 
    LDA.W #$0005 : STA.W $183E 
    LDX.W #$0000 

.loopSpritePalette3:
    LDA.W .spritePalette3,X : STA.L $7EC360,X 
    INX #2
    CPX.W #$0020 
    BMI .loopSpritePalette3 
    RTL 


.spritePalette3:
    dw $0000,$0000,$0000,$0000,$0000,$0DF6,$0D92,$0CEC 
    dw $0CA9,$0000,$0000,$0000,$0000,$0000,$0000,$0000 

SetupKraidGFXWithTheTilePriorityCleared:
    SEP #$20 
    LDA.B #$38 : STA.L $000047 
    LDA.B #$FA : STA.L $000048 
    LDA.B #$B9 : STA.L $000049 
    LDA.B #$00 : STA.L $00004C 
    LDA.B #$40 : STA.L $00004D 
    JSL.L Decompression_VariableDestination 
    LDA.B #$3E : STA.L $000047 
    LDA.B #$FE : STA.L $000048 
    LDA.B #$B9 : STA.L $000049 
    LDA.B #$00 : STA.L $00004C 
    LDA.B #$20 : STA.L $00004D 
    JSL.L Decompression_VariableDestination 
    REP #$20 
    LDA.W #$0000 : STA.L $7E782A 
    STA.L $7E782C 
    LDX.W #$0000 

.loop0:
    LDA.L $7E2000,X : AND.W #$DFFF : STA.L $7E2800,X 
    INX #2
    CPX.W #$0600 
    BMI .loop0 
    LDX.W #$0000 

.loop1:
    LDA.L $7E4000,X : AND.B $12 : STA.L $7E2000,X 
    INX #2
    CPX.W #$0800 
    BMI .loop1 
    RTS 


InitAI_KraidArm:
    JSR.W CheckIfKraidHasDied 
    BNE .dead 
    LDA.W $0F96 : STA.W $0FD6 
    LDA.W #RTL_A7BA2D : STA.W $0FE8 
    LDA.W #InstList_KraidArm_RisingSinking : STA.W $0FD2 
    LDA.W #$0001 : STA.W $0FD4 
    STZ.W $0FEA 
    RTL 


.dead:
    JSR.W SetEnemyPropertiesToDead 
    RTL 


InitAI_KraidLintTop:
    JSR.W CheckIfKraidHasDied 
    BNE .dead 
    LDA.W $0F96 : STA.W $1016 
    LDA.W #$7FFF : STA.W $1014 
    LDA.W #InstList_KraidLint_Initial : STA.W $1012 
    LDA.W #Spritemap_KraidLint_Initial : STA.W $100E 
    LDA.W #RTL_A7B831 : STA.W $1028 
    LDA.W #$7FFF : STA.W $1032 
    LDA.W #$0000 : STA.W $102C 
    RTL 


.dead:
    JSR.W SetEnemyPropertiesToDead 
    RTL 


InitAI_KraidLintMiddle:
    JSR.W CheckIfKraidHasDied 
    BNE .dead 
    LDA.W $0F96 : STA.W $1056 
    LDA.W #$7FFF : STA.W $1054 
    LDA.W #InstList_KraidLint_Initial : STA.W $1052 
    LDA.W #Spritemap_KraidLint_Initial : STA.W $104E 
    LDA.W #RTL_A7B831 : STA.W $1068 
    LDA.W #$FFF0 : STA.W $106C 
    RTL 


.dead:
    JSR.W SetEnemyPropertiesToDead 
    RTL 


InitAI_KraidLintBottom:
    JSR.W CheckIfKraidHasDied 
    BNE .dead 
    LDA.W $0F96 : STA.W $1096 
    LDA.W #$7FFF : STA.W $1094 
    LDA.W #InstList_KraidLint_Initial : STA.W $1092 
    LDA.W #Spritemap_KraidLint_Initial : STA.W $108E 
    LDA.W #RTL_A7B831 : STA.W $10A8 
    LDA.W #$FFF0 : STA.W $10AC 
    RTL 


.dead:
    JSR.W SetEnemyPropertiesToDead 
    RTL 


InitAI_KraidFoot:
    JSR.W CheckIfKraidHasDied 
    BNE .dead 
    LDA.W $0F96 : STA.W $10D6 
    LDA.W #InstList_KraidFoot_Initial : STA.W $10D2 
    LDA.W #$0001 : STA.W $10D4 
    LDA.W #RTL_A7BA2D : STA.W $10E8 
    LDA.W #$0000 : STA.L $7E7940 
    RTL 


.dead:
    JSR.W SetEnemyPropertiesToDead 
    RTL 


MainAI_Kraid:
    JSR.W KraidsMouth_vs_Projectile_CollisionHandling 
    JSR.W KraidPaletteHandling 
    JSR.W KraidBody_vs_Projectile_CollisionHandling 
    JSR.W KraidBody_vs_Samus_CollisionHandling 
    LDX.W $0E54 
    LDA.B $B1 : SEC : SBC.W $091D : SBC.W $0F7A : ADC.W $0F82 : STA.B $B5 
    LDA.W $0915 : SEC : SBC.W $0F7E : ADC.W #$0098 : STA.B $B7 
    JMP.W ($0FA8) 


Function_Kraid_KraidGetsBig_BreakCeilingIntoPlatforms:
    LDA.W $05B6 : AND.W #$0007 
    BNE .nonZeroCounter 
    JSR.W SpawnRandomEarthquakeProjectile 

.nonZeroCounter:
    LDY.W #$0001 
    LDA.W $0F7E : BIT.W #$0002 
    BEQ + 
    LDY.W #$FFFF 

  + STY.B $12 
    LDA.W $0F7A : CLC : ADC.B $12 : STA.W $0F7A 
    DEC.W $0F7E 
    LDA.W $0F7E : AND.W #$0003 
    BNE .done 
    LDX.W $0FB2 
    CPX.W #$0012 
    BPL .done 
    LDA.W .XPositions,X 
    LDY.W #EnemyProjectile_KraidCeilingRocks 
    LDX.W $0E54 
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    LDX.W $0FB2 
    LDA.W .functionPointers,X : STA.B $12 
    JMP.W ($0012) 


.manualReturn:
    LDX.W $0FB2 
    INX #2
    STX.W $0FB2 

.done:
    LDA.W $0F7E : CMP.W #$0128 : BPL .return 
    LDA.W #Function_Kraid_KraidGetsBig_SetBG2TilemapPriorityBits : STA.W $0FA8 

.return:
    RTL 


.XPositions:
    dw $0068,$00D8,$0028,$00A8,$0058,$00C8,$0038,$00B8 
    dw $0048 

.functionPointers:
    dw .spawnPLM4 
    dw .spawnPLM8 
    dw .spawnPLM0 
    dw .spawnPLM5 
    dw .spawnPLM3 
    dw .spawnPLM7 
    dw .spawnPLM1 
    dw .spawnPLM6 
    dw .spawnPLM2 

.spawnPLM0:
    JSL.L Spawn_Hardcoded_PLM 
    db $02,$12 
    dw PLMEntries_crumbleKraidCeilingBlockIntoBackground1 
    JMP.W .manualReturn 


.spawnPLM1:
    JSL.L Spawn_Hardcoded_PLM 
    db $03,$12 
    dw PLMEntries_crumbleKraidCeilingBlockIntoBackground2 
    JMP.W .manualReturn 


.spawnPLM2:
    JSL.L Spawn_Hardcoded_PLM 
    db $04,$12 
    dw PLMEntries_crumbleKraidCeilingBlockIntoBackground3 
    JMP.W .manualReturn 


.spawnPLM3:
    JSL.L Spawn_Hardcoded_PLM 
    db $05,$12 
    dw PLMEntries_crumbleKraidCeilingBlockIntoBackground2 
    JMP.W .manualReturn 


.spawnPLM4:
    JSL.L Spawn_Hardcoded_PLM 
    db $06,$12 
    dw PLMEntries_crumbleKraidCeilingBlockIntoBackground3 
    JMP.W .manualReturn 


.spawnPLM5:
    JSL.L Spawn_Hardcoded_PLM 
    db $0A,$12 
    dw PLMEntries_crumbleKraidCeilingBlockIntoBackground3 
    JMP.W .manualReturn 


.spawnPLM6:
    JSL.L Spawn_Hardcoded_PLM 
    db $0B,$12 
    dw PLMEntries_crumbleKraidCeilingBlockIntoBackground2 
    JMP.W .manualReturn 


.spawnPLM7:
    JSL.L Spawn_Hardcoded_PLM 
    db $0C,$12 
    dw PLMEntries_crumbleKraidCeilingBlockIntoBackground3 
    JMP.W .manualReturn 


.spawnPLM8:
    JSL.L Spawn_Hardcoded_PLM 
    db $0D,$12 
    dw PLMEntries_crumbleKraidCeilingBlockIntoBackground2 
    JMP.W .manualReturn 


Function_Kraid_KraidGetsBig_SetBG2TilemapPriorityBits:
    LDX.W #$0000 

.loop:
    LDA.L $7E2000,X : ORA.W #$2000 : STA.L $7E2000,X 
    INX #2
    CPX.W #$1000 
    BMI .loop 
    LDA.W $0FC6 : AND.W #$FBFF : STA.W $0FC6 
    LDA.W #Function_Kraid_KraidGetsBig_FinishUpdatingBG2Tilemap : STA.W $0FA8 
    JMP.W UpdateBG2TilemapTopHalf 


Function_Kraid_KraidGetsBig_FinishUpdatingBG2Tilemap:
    LDA.W #Function_Kraid_KraidGetsBig_DrawRoomBackground : STA.W $0FA8 
    LDA.W #$0001 : STA.W $10D4 
    LDA.W #InstList_KraidFoot_KraidIsBig_Neutral : STA.W $10D2 
    LDA.W #InstList_KraidLint_KraidIsBig : STA.W $1012 
    STA.W $1052 
    STA.W $1092 
    LDA.W #ExtendedSpritemap_KraidLint_KraidIsBig : STA.W $100E 
    STA.W $104E 
    STA.W $108E 
    JMP.W UpdateBG2TilemapBottomHalf 


Function_Kraid_KraidGetsBig_DrawRoomBackground:
    LDA.W #Function_Kraid_KraidGetsBig_FadeInRoomBackground : STA.W $0FA8 
    STZ.W $0FB0 
    STZ.W $0FB2 ; fallthrough to DrawKraidsRoomBackground

DrawKraidsRoomBackground:
    LDX.W #$00C0 
    LDY.W #$0000 

.loop:
    LDA.W Palette_KraidRoomBackground,Y : STA.L $7EC200,X 
    INX #2
    INY #2
    CPY.W #$0020 
    BMI .loop 
    LDA.W #$0000 : STA.L $7EC400 
    LDX.W $0330 
    LDA.W #$0200 : STA.B $D0,X 
    LDA.W #Tiles_KraidRoomBackground : STA.B $D2,X 
    SEP #$20 
    LDA.B #Tiles_KraidRoomBackground>>16 : STA.B $D4,X 
    REP #$20 
    LDA.B $5D : AND.W #$000F 
    XBA 
    CLC : ADC.W #$3F00 : STA.B $D5,X 
    TXA 
    CLC : ADC.W #$0007 : STA.W $0330 
    RTL 


SetupKraidGetsBig_Thinking:
    LDA.W #Function_Kraid_KraidGetsBig_Thinking : STA.W $0FA8 
    BRA SetLintYPositionsAndRandomThinkingTimer 


SetupKraidMainLoop_Thinking:
    LDA.W #Function_Kraid_MainLoop_Thinking : STA.W $0FA8 

SetLintYPositionsAndRandomThinkingTimer:
    LDA.W $0F7E : SEC : SBC.W #$0014 : STA.W $0FFE 
    LDA.W $0F7E : CLC : ADC.W #$002E : STA.W $103E 
    LDA.W $0F7E : CLC : ADC.W #$0070 : STA.W $107E 
    LDA.W $05E5 : AND.W #$0007 
    BNE .multiplyBy40 
    LDA.W #$0002 

.multiplyBy40:
    ASL #6
    STA.L $7E7806 
    RTS 


Function_Kraid_KraidGetsBig_FadeInRoomBackground:
    REP #$30 
    JSL.L Advance_GradualColorChange_ofBGPalette6 
    BCS .reachedTargetColor 
    RTL 


.reachedTargetColor:
    JSR.W SetupKraidGetsBig_Thinking 
    LDX.W #$0080 
    LDA.W KraidLint_InitialFunctionTimers_top : JSR.W EnableKraidLints 
    LDX.W #$00C0 
    LDA.W KraidLint_InitialFunctionTimers_middle : JSR.W EnableKraidLints 
    LDX.W #$0100 
    LDA.W KraidLint_InitialFunctionTimers_bottom : JSR.W EnableKraidLints 
    LDA.W #Function_KraidNail_Initialize : STA.L $7E7980 
    STA.L $7E79C0 
    LDA.W #Function_Kraid_HandleFunctionTimer : STA.W $1128 
    STA.W $1168 
    LDA.W #$0040 : STA.W $1132 
    LDA.W #$0080 : STA.W $1172 
    LDA.W #$0001 : STA.W $0FEC 
    LDA.W #InstList_Kraid_Roar_1 : STA.W $0FAA 
    LDA.W #$0120 : STA.L $7E781E 
    LDA.W #Function_KraidFoot_Phase2Setup_WalkToStartingPoint : STA.W $10E8 
    LDA.W #$0001 : STA.W $10D4 
    LDA.W #InstList_KraidFoot_KraidIsBig_WalkingBackwards_0 : STA.W $10D2 
    RTL 


EnableKraidLints:
    STA.W $0FB2,X 
    LDA.W #Function_KraidNail_HorizontallyAlignEnemyToKraid : STA.W $0FA8,X 
    LDA.W #Function_KraidLint_ProduceLint : STA.L $7E7800,X 
    STZ.W $0FAA,X 
    RTS 


Function_Kraid_MainLoop_Thinking:
    LDA.L $7E7806 : BEQ .return 
    DEC A 
    STA.L $7E7806 
    BNE .return 
    LDA.W #Function_KraidMainLoop_AttackingWithMouthOpen : STA.W $0FA8 
    LDA.W #InstList_Kraid_Roar_1 : STA.W $0FAA 
    LDA.W InstList_Kraid_Roar_0 : STA.W $0FAC 

.return:
    RTL 


Function_Kraid_KraidGetsBig_Thinking:
    LDA.L $7E7806 : BEQ .return 
    DEC A 
    STA.L $7E7806 
    BNE .return 
    LDA.W #Function_Kraid_KraidShot_KraidsMouthIsOpen : STA.W $0FA8 
    LDA.W #InstList_Kraid_Roar_1 : STA.W $0FAA 
    LDA.W InstList_Kraid_Roar_0 : STA.W $0FAC 

.return:
    RTL 


Function_Kraid_KraidShot_KraidsMouthIsOpen:
    JSR.W KraidInstListHandling 
    CMP.W #$FFFF : BNE .return 
    LDA.W #Function_Kraid_MainLoop_Thinking : STA.W $0FA8 
    LDA.W #$005A : STA.W $0FAC 
    LDA.L $7E780A : BIT.W #$0004 
    BEQ .done 
    SEC : SBC.W #$0100 : STA.L $7E780A 
    AND.W #$FF00 
    BEQ .done 
    LDA.W #Function_Kraid_HandleFunctionTimer : STA.W $0FA8 
    LDA.W #$0040 : STA.W $0FB2 
    LDA.W #Function_Kraid_KraidShot_InitializeEyeGlowing : STA.L $7E7800 
    LDA.W #$0002 : STA.L $7E7802 

.return:
    RTL 


.done:
    LDA.W #$0000 : STA.L $7E780A 
    BRA .return 


KraidInstListHandling:
    LDA.W $0FAC : BEQ .return 
    DEC.W $0FAC 
    BEQ ProcessKraidInstList 

.return:
    RTS 


ProcessKraidInstList:
    LDX.W $0FAA 
    LDA.W $0000,X : CMP.W #$FFFF : BEQ .return 
    BMI .ASMInstruction 
    STA.W $0FAC 
    TXA 
    CLC : ADC.W #$0008 : STA.W $0FAA 
    LDA.W $0002,X 
    TAY 
    PHX 
    LDX.W $0330 
    LDA.W #$02C0 : STA.B $D0,X 
    INX #2
    STY.B $D0,X 
    INX #2
    SEP #$20 
    LDA.B #$A7 : STA.B $D0,X 
    REP #$20 
    INX 
    LDA.B $59 : AND.W #$00FC 
    XBA 
    STA.B $D0,X 
    INX #2
    STX.W $0330 
    PLX 
    LDA.W #$0001 

.return:
    RTS 


.ASMInstruction:
    STA.B $12 
    JMP.W ($0012) 


ProcessNextKraidInstruction:
    LDA.W $0FAA : CLC : ADC.W #$0002 : STA.W $0FAA 
    BRA ProcessKraidInstList 


Instruction_Kraid_PlayRoarSFX:
    PHX 
    LDA.W #$002D : JSL.L QueueSound_Lib2_Max6 
    PLX 
    BRA ProcessNextKraidInstruction 


Instruction_Kraid_PlayDyingSFX:
    PHX 
    LDA.W #$002E : JSL.L QueueSound_Lib2_Max15 
    PLX 
    BRA ProcessNextKraidInstruction 


KraidsMouth_vs_Projectile_CollisionHandling:
    REP #$30 
    PHX 
    LDA.W $0FA8 : CMP.W #KraidDeath_SinkThroughFloor : BMI .notDying 
    PLX 
    RTS 


.notDying:
    LDA.W $0FAA : SEC : SBC.W #$0008 : TAX 
    LDA.W $0006,X : CMP.W #$FFFF : BNE .notTerminator 
    LDY.W #$0000 
    JMP.W .noProjectiles 


.notTerminator:
    TAX 
    LDA.W #$0001 : STA.W $0FB0 
    LDY.W #$0000 
    LDA.W $0000,X : CLC : ADC.W $0F7A : STA.B $16 
    LDA.W $0002,X : CLC : ADC.W $0F7E : STA.B $14 
    LDA.W $0006,X : CLC : ADC.W $0F7E : STA.B $12 
    LDA.W $0CCE : BEQ .noProjectiles 
    ASL A 
    TAX 

.loop:
    LDA.W $0B78,X : SEC : SBC.W $0BC8,X : DEC A 
    CMP.B $12 : BPL .next 
    LDA.W $0B78,X : CLC : ADC.W $0BC8,X : CMP.B $14 : BMI .next 
    LDA.W $0B64,X : CLC : ADC.W $0BB4,X : CMP.B $16 : BMI .next 
    LDA.W $0C18,X : BIT.W #$0F00 
    BNE .notBeam 
    BIT.W #$0010 
    BEQ .next 
    LDA.L $7E780A : ORA.W #$0001 : STA.L $7E780A 

.notBeam:
    PHX 
    TXA 
    LSR A 
    STA.W $18A6 
    PHP 
    JSL.L NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External 
    PLP : PLX 
    LDA.W $0C04,X : ORA.W #$0010 : STA.W $0C04,X 
    LDY.W #$0001 

.next:
    DEX #2
    BPL .loop 

.noProjectiles:
    PLX 
    CPY.W #$0000 
    BNE .collision 
    RTS 


.collision:
    LDA.W #$0006 : STA.L $7E782A 
    LDA.W #$0002 : STA.L $7E782C 
    LDA.L $7E780A : BIT.W #$0002 
    BEQ .notChargedBeam 
    ORA.W #$0004 
    STA.L $7E780A 

.notChargedBeam:
    LDA.W $0F8C : CMP.W #$0001 : BMI .dead 
    RTS 


.dead:
    LDA.W $0FA8 : CMP.W #KraidDeath_Initialize : BPL .return 
    LDA.W #KraidDeath_Initialize : STA.W $0FA8 
    LDA.W #$0000 : STA.L $7E780A 
    LDA.W $0F86 : ORA.W #$0400 : STA.W $0F86 
    LDA.W #$DFFF : STA.B $12 
    JSR.W SetupKraidGFXWithTheTilePriorityCleared 
    LDX.W #$0000 

.loopSetIntangible:
    LDA.W $0F86,X : ORA.W #$0400 : STA.W $0F86,X 
    TXA 
    CLC : ADC.W #$0040 : TAX 
    CPX.W #$0180 
    BMI .loopSetIntangible 
    LDA.W $0FAA : CMP.W #InstList_Kraid_DyingRoar_0 : BPL .return 
    CLC : ADC.W #$003C : STA.W $0FAA 

.return:
    RTS 


SpawnExplosionProjectile:
    LDA.W $0B64,X : STA.B $12 
    LDA.W $0B78,X : STA.B $14 
    LDA.W $0C18,X 
    LDY.W #$001D 
    BIT.W #$0200 
    BNE .superMissile 
    LDY.W #$0006 

.superMissile:
    TYA 
    LDY.W #EnemyProjectile_MiscDust 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    LDA.W #$003D : JSL.L QueueSound_Lib1_Max6 
    RTS 


KraidBody_vs_Samus_CollisionHandling:
    LDA.W $0FA8 : CMP.W #KraidDeath_Initialize : BPL .return0 
    LDA.W $0AF6 : CLC : ADC.W $0AFE : STA.B $12 
    LDA.W $0AFA : SEC : SBC.W $0F7E : LDX.W #$0000 

.loop:
    CMP.W HitboxDefinitionTable_KraidBody_bottom,X : BPL + 
    CMP.W HitboxDefinitionTable_KraidBody_top,X : BPL + 
    INX #4
    BRA .loop 


  + LDA.W HitboxDefinitionTable_KraidBody_left,X : CLC : ADC.W $0F7A : SEC : SBC.B $12 : BPL .return1 
    LDA.W $0AF6 : CMP.W #$0028 : BMI .lessThan28 
    SEC : SBC.W #$0008 : STA.W $0AF6 
    STA.W $0B10 

.lessThan28:
    LDA.W $0AFA : SEC : SBC.W #$0008 : CMP.L $7E7808 : BPL + 
    LDA.L $7E7808 

  + STA.W $0AFA 
    STA.W $0B14 
    JSR.W PushSamusBack 
    LDA.W $18A8 : BNE .return1 
    JSL.L NormalEnemyTouchAI 

.return0:
    RTS 


.return1:
    RTS 


HitboxDefinitionTable_KraidBody_bottom:
    dw $03FF 

HitboxDefinitionTable_KraidBody_left:
    dw $FFD0 

HitboxDefinitionTable_KraidBody_top:
    dw $0010,$FFD0,$0000,$FFE0,$FFE0,$FFE8,$FFD0,$FFF8 
    dw $FFB0,$0000,$FF90,$0008,$8000,$0008 

KraidBody_vs_Projectile_CollisionHandling:
    PHX 
    LDA.W $0FA8 : CMP.W #KraidDeath_SinkThroughFloor : BMI .lessThanC537 
    PLX 
    RTS 


.lessThanC537:
    STZ.W $0FB0 
    LDA.L $7E780A : AND.W #$FFFE : STA.L $7E780A 
    STZ.B $30 
    LDA.W $0FAA : SEC : SBC.W #$0008 : TAX 
    LDA.W $0004,X 
    TAX 
    LDA.W $0000,X : CLC : ADC.W $0F7A : STA.B $16 
    LDA.W $0002,X : CLC : ADC.W $0F7E : STA.B $14 
    LDA.W $0006,X : CLC : ADC.W $0F7E : STA.B $12 
    LDA.W $0CCE : BEQ .noProjectiles 
    ASL A 
    TAX 

.loop:
    LDA.W $0B78,X : SEC : SBC.W $0BC8,X : DEC A 
    CMP.B $12 : BPL .body 
    LDA.W $0B78,X : CLC : ADC.W $0BC8,X : CMP.B $14 : BMI .next 
    LDA.W $0B64,X : CLC : ADC.W $0BB4,X : CMP.B $16 : BMI .next 

.hit:
    JSR.W SpawnExplosionProjectile 
    LDA.W $0C04,X : ORA.W #$0010 : STA.W $0C04,X 
    LDA.W $0C18,X : BIT.W #$0010 
    BEQ + 
    LDA.L $7E780A : ORA.W #$0001 : STA.L $7E780A 

  + INC.B $30 

.next:
    DEX #2
    BPL .loop 

.noProjectiles:
    PLX 
    LDY.B $30 
    CPY.W #$0000 
    BEQ .return 
    LDA.W $0FA8 : CMP.W #Function_Kraid_MainLoop_Thinking : BNE .return 
    LDA.W #Function_Kraid_KraidShot_InitializeEyeGlowing : STA.W $0FA8 
    LDA.L $7E780A : BIT.W #$0001 
    BEQ .return 
    ORA.W #$0302 
    STA.L $7E780A 

.return:
    RTS 


.body:
    LDA.W $0B64,X : CLC : ADC.W $0BB4,X : STA.B $12 
    LDA.W $0B78,X : SEC : SBC.W $0F7E : LDY.W #$0000 

.loopBody:
    CMP.W HitboxDefinitionTable_KraidBody_bottom,Y : BPL + 
    CMP.W HitboxDefinitionTable_KraidBody_top,Y : BPL + 
    INY #4
    BRA .loopBody 


  + LDA.W HitboxDefinitionTable_KraidBody_left,Y : CLC : ADC.W $0F7A : SEC : SBC.B $12 : BPL .next 
    BRA .hit 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_HandleProjectileDamageAndSound:
    PHX : PHY 
    TXY 
    LDX.W $0E54 
    LDA.W $0C2C,Y : STA.W $187A 
    LDA.W $0C18,Y : STA.B $12 
    LDA.W $0C18,Y : BIT.W #$0018 
    BEQ .notPlasmaOrCharge 
    LDA.W #$0010 : STA.W $0FA0 

.notPlasmaOrCharge:
    LDX.W $0F78 
    LDA.L $A0003C,X : BNE .vulnerabilities 
    LDA.W #EnemyVulnerabilities 

.vulnerabilities:
    STA.B $14 
    LDA.B $12 : BIT.W #$0F00 
    BNE .notBeam 
    AND.W #$00FF 
    CLC : ADC.B $14 : TAX 
    LDA.L $B40000,X : BRA .determinedVulnerability 


.notBeam:
    AND.W #$0F00 
    CMP.W #$0100 : BEQ .superMissile 
    CMP.W #$0200 : BNE .missileEnd 

.superMissile:
    XBA 
    CLC : ADC.B $14 : TAX 
    LDA.L $B4000B,X : BRA .determinedVulnerability 


.missileEnd:
    CMP.W #$0300 : BNE .notPowerBomb 
    LDX.B $14 
    LDA.L $B4000E,X : BRA .determinedVulnerability 


.notPowerBomb:
    CMP.W #$0500 : BNE .return 
    LDX.B $14 
    LDA.L $B4000F,X 

.determinedVulnerability:
    AND.W #$00FF 
    STA.W $0E32 
    BEQ .return 
    LDA.W $187A 
    LSR A 
    STA.W $4202 
    SEP #$20 
    LDA.W $0E32 : STA.W $4203 
    NOP #5
    REP #$20 
    LDA.W $4216 : BEQ .return 
    STA.W $187A 
    LDA.W $0F8C : SEC : SBC.W $187A : LDA.W $0F8C : SEC : SBC.W $187A : STA.W $0F8C 
    LDA.W $0FB0 : BEQ .tripleDamageEnd 
    LDA.W $0F8C : SEC : SBC.W $187A : SEC : SBC.W $187A : BPL .storeHealth 
    LDA.W #$0000 

.storeHealth:
    STA.W $0F8C 

.tripleDamageEnd:
    LDX.W $0F78 
    LDA.L $A0000E,X : JSL.L QueueSound_Lib2_Max6 

.return:
    PLY : PLX 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


KraidPaletteHandling:
    PHX : PHY 
    LDA.W $0F8C : CMP.W #$0001 : BPL .alive 
    STA.L $7E782A 
    BRA + 


.alive:
    LDA.L $7E782A : BEQ .return 
    LDA.L $7E782C 
    DEC A 
    STA.L $7E782C 
    BNE .return 
    LDA.W #$0002 : STA.L $7E782C 
    LDA.L $7E782A 
    DEC A 
    STA.L $7E782A 

  + JSR.W KraidHurtFlashHandling 
    JSR.W KraidHealthBasedPaletteHandling 

.return:
    PLY : PLX 
    RTS 


KraidHurtFlashHandling:
    LDY.W #$0000 
    LDA.L $7E782A : BIT.W #$0001 
    BNE .loopSetup 
    LDY.W #$0020 

.loopSetup:
    LDX.W #$0000 

.loop:
    LDA.W Palette_Kraid_Sprite_HurtFlash,Y : STA.L $7EC1E0,X 
    INX #2
    INY #2
    CPX.W #$0020 
    BMI .loop 
    RTS 


KraidHealthBasedPaletteHandling:
    LDY.W #$0000 
    LDA.L $7E782A : BIT.W #$0001 
    BNE .hurtFlashFrame 
    LDX.W #$000E 
    LDA.W $0F8C 

.loop:
    CMP.L $7E780C,X : BPL .getIndex 
    DEX #2
    BNE .loop 

.getIndex:
    INX #2
    TXA 
    ASL #4
    TAY 

.hurtFlashFrame:
    LDX.W #$0000 

.loopPalette:
    LDA.W Palette_Kraid_BG_HurtFlash,Y : STA.L $7EC0E0,X 
    LDA.W Palette_Kraid_Sprite_HurtFlash,Y : STA.L $7EC1E0,X 
    INY #2
    INX #2
    CPX.W #$0020 
    BMI .loopPalette 
    RTS 


Palette_Kraid_BG_HurtFlash:
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF 
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF 

Palette_Kraid_BG_1_8:
    dw $0000,$559D,$1816,$100D,$127A,$0E17,$0DD3,$0970 
    dw $092D,$04CA,$0486,$0023,$0443,$3E52,$4AD5,$0000 

Palette_Kraid_BG_2_8:
    dw $3800,$559D,$1816,$100D,$1A9B,$1637,$11F3,$0D8F 
    dw $0D4C,$08E9,$04A6,$0043,$0443,$4273,$52F6,$0000 

Palette_Kraid_BG_3_8:
    dw $3800,$559D,$1816,$100D,$22DB,$1A77,$1A12,$15AE 
    dw $116C,$0D09,$08A6,$0444,$0423,$4A94,$5B38,$0000 

Palette_Kraid_BG_4_8:
    dw $3800,$559D,$1816,$100D,$2AFC,$2297,$1E32,$19CD 
    dw $158B,$1128,$08C6,$0464,$0423,$4EB5,$6359,$0000 

Palette_Kraid_BG_5_8:
    dw $3800,$559D,$1816,$100D,$331D,$2AB7,$2A91,$1E0C 
    dw $19AA,$1148,$0CE5,$0484,$0023,$52B5,$677B,$0000 

Palette_Kraid_BG_6_8:
    dw $3800,$559D,$1816,$100D,$3B3E,$32D7,$32B0,$222B 
    dw $1DC9,$1567,$0D05,$04A4,$0023,$56D6,$6F9C,$0000 

Palette_Kraid_BG_7_8:
    dw $3800,$559D,$1816,$100D,$437E,$3717,$32B0,$2A4A 
    dw $21E9,$1987,$1105,$08A5,$0003,$5EF7,$77DE,$0000 

Palette_Kraid_BG_8_8:
    dw $3800,$559D,$1816,$100D,$4B9F,$3F37,$36D0,$2E69 
    dw $2608,$1DA6,$1125,$08C5,$0003,$6318,$7FFF,$0000 

Palette_Kraid_Death:
    dw $3800,$0807,$0404,$0000,$127A,$0E17,$0DD3,$0970 
    dw $092D,$04CA,$0486,$0023,$0443,$3E52,$4AD5,$0000 

Palette_Kraid_Sprite_HurtFlash:
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF 
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF 

Palette_Kraid_Sprite_1_8:
    dw $0000,$559D,$1816,$100D,$127A,$0E17,$0DD3,$0970 
    dw $092D,$04CA,$0486,$0023,$0443,$3E52,$4AD5,$0000 

Palette_Kraid_Sprite_2_8:
    dw $3800,$559D,$1816,$100D,$1A9B,$1637,$11F3,$0D8F 
    dw $0D4C,$08E9,$04A6,$0043,$0443,$4273,$52F6,$0000 

Palette_Kraid_Sprite_3_8:
    dw $3800,$559D,$1816,$100D,$22DB,$1A77,$1A12,$15AE 
    dw $116C,$0D09,$08A6,$0444,$0423,$4A94,$5B38,$0000 

Palette_Kraid_Sprite_4_8:
    dw $3800,$559D,$1816,$100D,$2AFC,$2297,$1E32,$19CD 
    dw $158B,$1128,$08C6,$0464,$0423,$4EB5,$6359,$0000 

Palette_Kraid_Sprite_5_8:
    dw $3800,$559D,$1816,$100D,$331D,$2AB7,$2A91,$1E0C 
    dw $19AA,$1148,$0CE5,$0484,$0023,$52B5,$677B,$0000 

Palette_Kraid_Sprite_6_8:
    dw $3800,$559D,$1816,$100D,$3B3E,$32D7,$32B0,$222B 
    dw $1DC9,$1567,$0D05,$04A4,$0023,$56D6,$6F9C,$0000 

Palette_Kraid_Sprite_7_8:
    dw $3800,$559D,$1816,$100D,$437E,$3717,$32B0,$2A4A 
    dw $21E9,$1987,$1105,$08A5,$0003,$5EF7,$77DE,$0000 

Palette_Kraid_Sprite_8_8:
    dw $3800,$559D,$1816,$100D,$4B9F,$3F37,$36D0,$2E69 
    dw $2608,$1DA6,$1125,$08C5,$0003,$6318,$7FFF,$0000 

Instruction_Kraid_NOP_A7B633:
    PHX : PLX 
    RTL 


Instruction_Kraid_DecrementYPosition:
    PHX 
    DEC.W $0F7E 
    PLX 
    RTL 


Instruction_Kraid_IncrementYPosition_SetScreenShaking:
    PHX 
    INC.W $0F7E 
    LDA.W #$0001 : STA.W $183E 
    LDA.W #$000A : STA.W $1840 
    PLX 
    RTL 


Instruction_Kraid_QueueSFX76_Lib2_Max6:
    PHX : PHY 
    LDA.W #$0076 : JSL.L QueueSound_Lib2_Max6 
    PLY : PLX 
    RTL 


Instruction_Kraid_XPositionMinus3:
    PHX 
    LDA.W $0F7A : SEC : SBC.W KraidForwardsSpeed : STA.W $0F7A 
    PLX 
    RTL 


Instruction_Kraid_XPositionMinus3_duplicate:
    PHX 
    LDA.W $0F7A : SEC : SBC.W KraidForwardsSpeed : STA.W $0F7A 
    PLX 
    RTL 


Instruction_Kraid_XPositionPlus3:
    PHX : PHY 
    LDA.W KraidBackwardsSpeed : CLC : ADC.W $0F7A : STA.W $0F7A 
    PLY : PLX 
    RTL 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Instruction_Kraid_MoveRight_A7B683:
    PHX : PHY 
    LDA.W $0F7A : CMP.W #$0140 : BMI .leftScreen 
    LDA.L $7E781E 
    DEC A 
    STA.L $7E781E 
    BNE .return 

.leftScreen:
    LDX.W #$0000 
    STZ.B $12 
    LDA.W UNUSED_KraidBackwardsFastSpeed_A7A922 : STA.B $14 
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes 
    BCS .collision 

.return:
    PLY : PLX 
    RTL 


.collision:
    LDA.W #$0000 : STA.W $183E 
    LDA.W #$0007 : STA.W $1840 
    LDA.W $0F7A : STA.W $10BA 
    BRA .return 
endif ; !FEATURE_KEEP_UNREFERENCED


Function_Kraid_KraidShot_InitializeEyeGlowing:
    LDA.W #Function_Kraid_KraidShot_KraidsMouthIsOpen : STA.W $0FA8 
    LDA.W #Function_Kraid_KraidShot_GlowEye : STA.W $0FA8 
    LDA.W #InstList_Kraid_EyeGlowing_1 : STA.W $0FAA 
    LDA.W InstList_Kraid_EyeGlowing_0 : STA.W $0FAC ; fallthrough to Function_Kraid_KraidShot_GlowEye

Function_Kraid_KraidShot_GlowEye:
    PHX : PHY 
    JSR.W KraidInstListHandling 
    CMP.W #$FFFF : BNE .notTerminator 
    LDA.W #$0100 
    LDA.W $0FAC 

.notTerminator:
    LDX.W #$00E2 
    LDY.W #$0000 

.loop:
    LDA.L $7EC000,X : AND.W #$001F 
    CLC : ADC.W #$0001 : CMP.W #$001F : BMI + 
    INY 
    LDA.W #$001F 

  + STA.B $12 
    LDA.L $7EC000,X : AND.W #$03E0 
    CLC : ADC.W #$0020 : CMP.W #$03E0 : BMI + 
    INY 
    LDA.W #$03E0 

  + STA.B $14 
    LDA.L $7EC000,X : AND.W #$FC00 
    ORA.B $12 
    ORA.B $14 
    STA.L $7EC000,X 
    INX #2
    CPX.W #$00E8 
    BMI .loop 
    CPY.W #$0006 
    BMI .return 
    LDA.W #Function_Kraid_KraidShot_UnglowEye : STA.W $0FA8 

.return:
    PLY : PLX 
    RTL 


Function_Kraid_KraidShot_UnglowEye:
    PHX : PHY 
    LDX.W #$000E 
    LDA.W $0F8C 

.loopHealth:
    CMP.L $7E780C,X : BPL .getIndexY 
    DEX #2
    BNE .loopHealth 

.getIndexY:
    INX #2
    TXA 
    ASL #4
    TAY 
    LDX.W #$00E2 
    STZ.B $14 

.loop:
    LDA.L $7EC000,X : AND.W #$001F : STA.B $12 
    LDA.W Palette_Kraid_BG_HurtFlash+2,Y : AND.W #$001F 
    CMP.B $12 : BEQ + 
    INC.B $14 
    LDA.L $7EC000,X 
    DEC A 
    STA.L $7EC000,X 

  + LDA.L $7EC000,X : AND.W #$03E0 : STA.B $12 
    LDA.W Palette_Kraid_BG_HurtFlash+2,Y : AND.W #$03E0 
    CMP.B $12 : BEQ .next 
    INC.B $14 
    LDA.L $7EC000,X : SEC : SBC.W #$0020 : STA.L $7EC000,X 

.next:
    INX #2
    INY #2
    CPX.W #$00E8 
    BMI .loop 
    LDA.B $14 : BNE .return 
    LDA.W #Function_Kraid_KraidShot_KraidsMouthIsOpen : STA.W $0FA8 
    LDA.W #InstList_Kraid_Roar_1 : STA.W $0FAA 
    LDA.W InstList_Kraid_Roar_0 : STA.W $0FAC 

.return:
    PLY : PLX 
    RTL 


MainAI_KraidArm:
    LDA.W $0915 : CLC : ADC.W #$00E0 : STA.B $12 
    LDA.W $0F7E : SEC : SBC.W #$002C : STA.W $0FBE 
    TAY 
    LDA.W $0FC6 
    ORA.W #$0100 
    CPY.W $0915 
    BMI + 
    CPY.B $12 
    BPL + 
    AND.W #$FEFF 

  + STA.W $0FC6 
    LDA.W $0F7A : CLC : ADC.W #$0000 : STA.W $0FBA 
    LDA.L $7E780A : BIT.W #$FF00 
    BEQ .return 
    LDA.W $0FD4 
    INC A 
    STA.W $0FD4 

.return:
    RTL 


MainAI_KraidLintTop:
    LDX.W #$0080 
    LDA.W #$7FFF : STA.W $0F94,X 
    JMP.W MainAI_KraidLintCommon 


MainAI_KraidLintMiddle:
    LDX.W #$00C0 
    LDA.W #$7FFF : STA.W $0F94,X 
    JMP.W MainAI_KraidLintCommon 


MainAI_KraidLintBottom:
    LDX.W #$0100 
    LDA.W #$7FFF : STA.W $0F94,X 

MainAI_KraidLintCommon:
    JSR.W KraidLint_vs_Samus_CollisionHandling 
    LDA.W $0915 : CLC : ADC.W #$00E0 : STA.B $12 
    JMP.W ($0FA8,X) 

RTL_A7B831:
    RTL 


Function_KraidLint_ProduceLint:
    LDA.W $0F86,X : AND.W #$FEFF ; >.< #$FAFF
    AND.W #$FBFF 
    STA.W $0F86,X 
    LDA.W $0F7A : CLC : ADC.W $0FAC,X : SEC : SBC.W $0FAA,X : STA.W $0F7A,X 
    LDA.W $0FAA,X : CLC : ADC.W #$0001 : STA.W $0FAA,X 
    CMP.W #$0020 : BMI .return 
    LDA.W #Function_KraidLint_ChargeLint : STA.W $0FA8,X 
    LDA.W #$001E : STA.W $0FB2,X 

.return:
    RTL 


Function_KraidLint_ChargeLint:
    LDY.W #$0000 
    LDA.W $0FB2,X : BIT.W #$0001 
    BEQ .zeroTimer 
    LDY.W #$0E00 

.zeroTimer:
    TYA 
    STA.W $0F96,X 
    LDA.W $0F7A : CLC : ADC.W $0FAC,X : SEC : SBC.W $0FAA,X : STA.W $0F7A,X 
    DEC.W $0FB2,X 
    BNE .return 
    LDA.W #Function_KraidLint_FireLint : STA.W $0FA8,X 
    LDA.W #$001F : JSL.L QueueSound_Lib3_Max6 

.return:
    RTL 


Function_KraidLint_FireLint:
    LDA.W $0F7C,X : SEC : SBC.W KraidLint_XSubSpeed : STA.W $0F7C,X 
    LDA.W $0F7A,X : SBC.W KraidLint_XSpeed : STA.W $0F7A,X 
    CMP.W #$0038 : BPL .greaterThanEqualTo38 
    PHA 
    LDA.W $0F86,X : ORA.W #$0400 : STA.W $0F86,X 
    PLA 

.greaterThanEqualTo38:
    CMP.W #$0020 : BPL .greaterThanEqualTo20 
    LDA.W $0F86,X : ORA.W #$0100 : STA.W $0F86,X 
    LDA.W #Function_KraidNail_HorizontallyAlignEnemyToKraid : STA.W $0FA8,X 
    LDA.W #$012C : STA.W $0FB2,X 
    LDA.W #Function_KraidLint_ProduceLint : STA.L $7E7800,X 
    STZ.W $0FAA,X 

.greaterThanEqualTo20:
    JSL.L CheckIfEnemyIsTouchingSamusFromBelow 
    AND.W #$FFFF 
    BEQ .return 
    LDA.W $0B56 : SEC : SBC.W KraidLint_XSubSpeed : STA.W $0B56 
    LDA.W $0B58 : SBC.W KraidLint_XSpeed : CMP.W #$FFF0 : BPL .storeExtraDisplacement 
    LDA.W #$FFF0 

.storeExtraDisplacement:
    STA.W $0B58 

.return:
    RTL 


Function_KraidNail_WaitUntilTopLintXPosition100Plus:
    LDA.W $0FFA : CMP.W #$0100 : BMI .return 
    LDA.L $7E7800,X : STA.W $0FA8,X 
    LDA.W $0F86,X : AND.W #$FEFF ; >.< #$FAFF
    AND.W #$FBFF 
    STA.W $0F86,X 

.return:
    RTL 


Function_KraidNail_HorizontallyAlignEnemyToKraid:
    LDA.W $0F7A : SEC : SBC.W $0F82,X : STA.W $0F7A,X ; fallthrough to Function_Kraid_HandleFunctionTimer

Function_Kraid_HandleFunctionTimer:
    LDA.W $0FB2,X : BEQ .return 
    DEC.W $0FB2,X 
    BNE .return 
    LDA.L $7E7800,X : STA.W $0FA8,X 

.return:
    RTL 


Function_KraidFoot_StartRetreat:
    LDX.W $0E54 
    LDA.W $0FB2,X : BEQ .return 
    DEC.W $0FB2,X 
    BNE .return 
    LDA.L $7E7800,X : STA.W $0FA8,X 
    LDA.W #InstList_KraidFoot_KraidIsBig_WalkingBackwards_0 : STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 

.return:
    RTL 


Function_KraidFoot_Phase1_Thinking:
    JSR.W HandleKraidPhase1 
    BRA Function_Kraid_HandleFunctionTimer 


Function_Kraid_ProcessKraidInstruction:
    JSR.W KraidInstListHandling 
    BRA Function_Kraid_HandleFunctionTimer 


KraidLint_vs_Samus_CollisionHandling:
    LDA.W $0F86,X : BIT.W #$0400 
    BEQ .notIntangible 
    RTS 


.notIntangible:
    LDA.W $18A8 : BNE .return 
    LDA.W $0F7A,X : CLC : ADC.W Hitbox_KraidLint+2 : SEC : SBC.W #$0002 : STA.B $12 
    LDA.W $0AF6 : CLC : ADC.W $0AFE : CMP.B $12 : BMI .return 
    LDA.W $0AF6 : SEC : SBC.W $0AFE : CMP.B $12 : BPL .return 
    LDA.W $0F7E,X : CLC : ADC.W Hitbox_KraidLint+4 : CLC : ADC.W #$0002 : STA.B $16 
    LDA.W $0AFA : CLC : ADC.W $0B00 : CMP.B $16 : BMI .return 
    LDA.W $0F7E,X : CLC : ADC.W Hitbox_KraidLint+8 : SEC : SBC.W #$0002 : STA.B $18 
    LDA.W $0AFA : SEC : SBC.W $0B00 : CMP.B $18 : BPL .return 
    LDA.W $0AFE : CLC : ADC.W #$0010 : EOR.W #$FFFF 
    CLC : ADC.W $0B58 : CMP.W #$0010 : BMI + 
    LDA.W #$0010 

  + STA.W $0B58 
    PHX : PHP 
    JSL.L NormalEnemyTouchAI 
    PLP : PLX 
    LDA.W $0F86,X : ORA.W #$0400 : STA.W $0F86,X 

.return:
    RTS 


MainAI_KraidFoot:
    LDA.W $0F7A : STA.W $10BA 
    LDA.W $0F7E : CLC : ADC.W #$0064 : STA.W $10BE 
    TAY 
    SEC : SBC.W #$00E0 : TAX 
    LDA.W $10C6 : AND.W #$FEFF 
    CPY.W $0915 
    BPL .offScreen 
    ORA.W #$0100 
    BRA + 


.offScreen:
    CPX.W $0915 
    BMI + 
    ORA.W #$0100 

  + STA.W $10C6 
    LDX.W $0E54 
    JMP.W ($10E8) 


RTL_A7BA2D:
    RTL 


Function_KraidFoot_Phase2_Thinking:
    LDA.L $7E7940 
    DEC A 
    STA.L $7E7940 
    BNE .return 
    LDX.W #$0000 

.loopXPositions:
    LDA.W $0F7A : CMP.W .XPosition,X : BEQ + 
    INX #4
    CPX.W #$0018 
    BMI .loopXPositions 
    LDX.W #$0004 

  + LDA.W $05E5 : AND.W #$001C 
    CMP.W #$0010 : BMI + 
    LDA.W #$0010 

  + CLC : ADC.W .movementDataPointer,X : TAX 
    LDA.W $0002,X 
    TAY 
    LDA.W $0000,X : CMP.W $0F7A : BPL .backwards 
    LDA.W $0000,X : JSR.W SetKraidWalkingForwards 
    RTL 


.backwards:
    LDA.W $0000,X : JSR.W SetKraidWalkingBackwards 

.return:
    RTL 


.XPosition:
    dw $00F0 

.movementDataPointer:
    dw .movementData0 
    dw $0160 
    dw .movementData1 
    dw $0180 
    dw .movementData2 
    dw $00D0 
    dw .movementData3 
    dw $0140 
    dw .movementData4 
    dw $0170 
    dw .movementData5 

.movementData0:
    dw $0180,$0158,$0180,$0158,$00D0,$002C,$0170,$002C 
    dw $0170,$002C 

.movementData1:
    dw $00F0,$0100,$0180,$0158,$00D0,$002C,$0140,$002C 
    dw $0170,$002C 

.movementData2:
    dw $00F0,$0100,$0160,$0158,$00D0,$002C,$0140,$002C 
    dw $0170,$002C 

.movementData3:
    dw $00F0,$0100,$0160,$0158,$0180,$0158,$0140,$002C 
    dw $0170,$002C 

.movementData4:
    dw $00F0,$0100,$0160,$0158,$0180,$0158,$00D0,$002C 
    dw $0170,$002C 

.movementData5:
    dw $00F0,$0100,$0180,$0158,$0170,$0158,$00D0,$002C 
    dw $0140,$002C 

SetKraidWalkingBackwards:
    STA.L $7E781E 
    TYA 
    STA.L $7E7940 
    LDA.W #Function_KraidFoot_Phase2_WalkingBackward : STA.W $10E8 
    LDA.W #$0001 : STA.W $10D4 
    LDA.W #InstList_KraidFoot_KraidIsBig_WalkingBackwards_0 : STA.W $10D2 
    RTS 


SetKraidWalkingForwards:
    STA.L $7E781E 
    TYA 
    STA.L $7E7940 
    LDA.W #Function_KraidFoot_Phase2_WalkingForward : STA.W $10E8 
    LDA.W #$0001 : STA.W $10D4 
    LDA.W #InstList_KraidFoot_KraidIsBig_WalkingForward_0 : STA.W $10D2 
    RTS 


Function_KraidFoot_Phase2_WalkingBackward:
    LDA.L $7E781E : CMP.W $0F7A : BEQ .walking 
    BPL .return 
    STA.W $0F7A 

.walking:
    LDA.W $10D2 : CMP.W #InstList_KraidFoot_KraidIsBig_WalkingBackwards_1 : BMI .return 
    LDA.W #Function_KraidFoot_Phase2_Thinking : STA.W $10E8 
    LDA.W #$0001 : STA.W $10D4 
    LDA.W #InstList_KraidFoot_KraidIsBig_Neutral : STA.W $10D2 

.return:
    RTL 


Function_KraidFoot_Phase2Setup_WalkToStartingPoint:
    LDA.L $7E781E : CMP.W $0F7A : BEQ .walking 
    BPL .return 
    STA.W $0F7A 

.walking:
    LDA.W $10D2 : CMP.W #InstList_KraidFoot_KraidIsBig_WalkingBackwards_1 : BMI .return 
    LDA.W #Function_Kraid_HandleFunctionTimer : STA.W $10E8 
    LDA.W #$00B4 : STA.W $10F2 
    LDA.W #Function_KraidFoot_Phase2Setup_InitializePhase2 : STA.L $7E7940 
    LDA.W #$0001 : STA.W $10D4 
    LDA.W #InstList_KraidFoot_KraidIsBig_Neutral : STA.W $10D2 

.return:
    RTL 


Function_KraidFoot_Phase2Setup_InitializePhase2:
    LDA.W #$0160 
    LDY.W #$00B4 
    JSR.W SetKraidWalkingBackwards 
    RTL 


Function_KraidFoot_Phase2_WalkingForward:
    LDA.L $7E781E : CMP.W $0F7A : BMI .forwards 
    STA.W $0F7A 
    LDA.W $10D2 : CMP.W #InstList_KraidFoot_KraidIsBig_WalkingForward_1 : BNE .return 
    LDA.W #Function_KraidFoot_Phase2_Thinking : STA.W $10E8 
    LDA.W #$0001 : STA.W $10D4 
    LDA.W #InstList_KraidFoot_KraidIsBig_Neutral : STA.W $10D2 

.return:
    RTL 


.forwards:
    LDA.W $10D2 : CMP.W #InstList_KraidFoot_KraidIsBig_WalkingForward_1 : BNE .return 
    LDA.W #InstList_KraidFoot_KraidIsBig_WalkingForward_0 : STA.W $10D2 
    LDA.W #$0001 : STA.W $10D4 
    RTL 


Function_KraidMainLoop_AttackingWithMouthOpen:
    JSR.W KraidInstListHandling 
    CMP.W #$FFFF : BEQ .finishedInstructions 
    LDA.W $0FAA : SEC : SBC.W #$0008 : TAX 
    LDA.W $0002,X : CMP.W #Tilemap_KraidHead_3 : BNE .return 
    LDA.W $0FAC : AND.W #$000F 
    BNE .return 
    LDY.W #EnemyProjectile_KraidRockSpit 
    LDA.W $05E5 : AND.W #$000E 
    TAX 
    LDA.W .rockSpitXVelocities,X : JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    LDA.W #$001E : JSL.L QueueSound_Lib3_Max6 

.return:
    RTL 


.finishedInstructions:
    JSR.W SetupKraidMainLoop_Thinking 
    LDA.W #$005A : STA.W $0FAC 
    LDA.L $7E780A : BIT.W #$0004 
    BEQ .done 
    SEC : SBC.W #$0100 : STA.L $7E780A 
    AND.W #$FF00 
    BEQ .done 
    LDA.W #Function_Kraid_HandleFunctionTimer : STA.W $0FA8 
    LDA.W #$0040 : STA.W $0FB2 
    LDA.W #Function_Kraid_KraidShot_InitializeEyeGlowing : STA.L $7E7800 
    LDA.W #$0002 : STA.L $7E7802 
    RTL 


.done:
    LDA.W #$0000 : STA.L $7E780A 
    RTL 


.rockSpitXVelocities:
    dw $FC00,$FC40,$FB40,$FB80,$FB40,$FC00,$FB80,$FC40 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_KraidFoot_LungeForwardIfSamusIsNotInvincible_A7BC75:
    LDA.W $10D2 : CMP.W #InstList_KraidFoot_LungeForward_1 : BMI .return 
    LDA.W $18A8 : BEQ .lunge 
    LDA.W #Function_KraidFoot_Phase2_WalkingBackward : STA.W $10E8 
    LDA.W $0911 : CLC : ADC.W #$0120 : CMP.W #$0120 : BMI + 
    LDA.W #$0120 

  + STA.L $7E781E 
    LDA.W #$0001 : STA.W $10D4 
    LDA.W #InstList_KraidFoot_KraidIsBig_WalkingBackwards_0 : STA.W $10D2 

.return:
    RTL 


.lunge:
    LDA.W #$0001 : STA.W $10D4 
    LDA.W #InstList_KraidFoot_LungeForward_0 : STA.W $10D2 
    RTL 


UNUSED_Kraid_FireLintAfterAFrames_A7BCB5:
    STA.W $0FB2,X 
    LDA.W #Function_KraidNail_HorizontallyAlignEnemyToKraid : STA.W $0FA8,X 
    LDA.W #Function_KraidLint_FireLint : STA.L $7E7800,X 
    LDA.W $0F86,X : ORA.W #$0100 : STA.W $0F86,X 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


EnemyTouch_KraidNail:
    JSL.L NormalEnemyTouchAI 
    LDX.W $0E54 
    JSL.L EnemyDeath 
    LDX.W $0E54 
    RTL 


EnemyTouch_KraidNailBad:
    JSL.L NormalEnemyTouchAI 
    LDX.W $0E54 
    JSL.L EnemyDeath 
    LDX.W $0E54 
    RTL 


RTL_A7BCED:
    RTL 


RTL_A7BCEE:
    RTL 


InitAI_KraidNail:
    LDX.W $0E54 ; fallthrough to InitAI_KraidNail_WithoutLoadingEnemyIndex

InitAI_KraidNail_Common:
    LDA.W $0F96 : STA.W $0F96,X 
    LDA.W #$0028 : STA.W $0FAA,X 
    LDA.W $0F86,X : ORA.W #$0100 : STA.W $0F86,X 
    LDA.W #$7FFF : STA.W $0F94,X 
    LDA.W #InstList_KraidNail : STA.W $0F92,X 
    LDA.W InstList_KraidNail+2 : STA.W $0F8E,X 
    LDA.W #Function_KraidNail_Initialize : STA.L $7E7800,X 
    LDA.W #Function_Kraid_HandleFunctionTimer : STA.W $0FA8,X 
    LDA.W #$0040 : STA.W $0FB2,X 
    RTL 


InitAI_KraidNailBad:
    LDX.W $0E54 
    BRA InitAI_KraidNail_Common 


MainAI_KraidNail:
    REP #$30 
    LDA.W $0F8C : CMP.W #$0001 : BMI .delete 
    JMP.W ($1128) 


.delete:
    LDA.W $1106 : ORA.W #$0300 : STA.W $1106 
    RTL 


MainAI_KraidNailBad:
    REP #$30 
    LDA.W $0F8C : CMP.W #$0001 : BMI .delete 
    JMP.W ($1168) 


.delete:
    LDA.W $1146 : ORA.W #$0300 : STA.W $1146 
    RTL 


Function_KraidNail_Initialize:
    LDA.W $05E5 : AND.W #$0006 
    TAY 
    LDA.W $1130 
    LDX.W $0E54 
    CPX.W #$0180 
    BNE + 
    LDA.W $1170 

  + CMP.W #$0000 : BPL .positiveYVelocity 
    LDA.W .upwardsVelocityPointers,Y : BRA + 


.positiveYVelocity:
    LDA.W .downwardsVelocityPointers,Y 

  + TAY 
    LDA.W $0000,Y : STA.W $0FAA,X 
    LDA.W $0002,Y : STA.W $0FAC,X 
    LDA.W $0004,Y : STA.W $0FAE,X 
    LDA.W $0006,Y : STA.W $0FB0,X 
    LDA.W #$0001 : STA.W $0FB4,X 
    LDA.W $0F86,X : AND.W #$FEFF ; >.< #$FAFF
    AND.W #$FBFF 
    STA.W $0F86,X 
    LDA.W #$0001 : STA.W $0F94,X 
    LDA.W #InstList_KraidNail : STA.W $0F92,X 
    LDA.W #Function_KraidNail_Fire : STA.W $0FA8,X 
    LDA.W $05E5 : BIT.W #$0001 
    BNE .horizontal 

.diagonal:
    LDA.W #$0000 : STA.L $7E780E,X 
    LDA.W $0F7A : SEC : SBC.W $0F82 : SEC : SBC.W $0F82,X : AND.W #$FFF0 
    STA.W $0F7A,X 
    LDA.W $0FBE : CLC : ADC.W #$0080 : STA.W $0F7E,X 
    RTL 


.horizontal:
    LDA.L $7E798E 
    CPX.W #$01C0 
    BEQ .notKraidNailBad 
    LDA.L $7E79CE 

.notKraidNailBad:
    CMP.W #$0001 : BEQ .diagonal 
    LDA.W #$0001 : STA.L $7E780E,X 
    LDA.W #$0032 : STA.W $0F7A,X 
    LDA.W #$00F0 : STA.W $0F7E,X 
    LDA.W #$0000 : STA.W $0FAA,X 
    LDA.W #$0001 : STA.W $0FAC,X 
    LDA.W #$0000 : STA.W $0FAE,X 
    LDA.W #$0000 : STA.W $0FB0,X 
    LDA.W #Function_KraidNail_WaitUntilTopLintXPosition100Plus : STA.W $0FA8,X 
    LDA.W #Function_KraidNail_Fire : STA.L $7E7800,X 
    LDA.W $0F86,X : ORA.W #$0500 : STA.W $0F86,X 
    RTL 


.upwardsVelocityPointers:
    dw .upwards0 
    dw .upwards1 
    dw .upwards2 
    dw .upwards3 

.downwardsVelocityPointers:
    dw .downwards0 
    dw .downwards1 
    dw .downwards2 
    dw .downwards3 

.upwards0:
    dw $0000,$FFFF,$0000,$0001 

.downwards0:
    dw $0000,$FFFF,$0000,$FFFF 

.upwards1:
    dw $0000,$FFFF,$0000,$0001 

.downwards1:
    dw $0000,$FFFF,$0000,$FFFF 

.upwards2:
    dw $0000,$FFFF,$0000,$0001 

.downwards2:
    dw $0000,$FFFF,$0000,$FFFF 

.upwards3:
    dw $0000,$FFFF,$0000,$0001 

.downwards3:
    dw $0000,$FFFF,$0000,$FFFF 

Function_KraidNail_Fire:
    LDA.W $0FAA,X : STA.B $12 
    LDA.W $0FAC,X : STA.B $14 
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes 
    BCC .loopSetup 
    LDA.W $0FAA,X 
    EOR.W #$FFFF 
    INC A 
    STA.W $0FAA,X 
    LDA.W $0FAC,X 
    EOR.W #$FFFF 
    INC A 
    STA.W $0FAC,X 
    BRA .bounced 


.loopSetup:
    LDY.W #$0000 

.loop:
    LDA.W $0F7E : CLC : ADC.W .topBoundaryOffset,Y : CMP.W $0F7E,X : BMI + 
    INY #4
    BRA .loop 


  + LDA.W $0F7A : CLC : ADC.W .leftBoundaryOffset,Y : STA.B $12 
    LDA.W $0F7A,X : CLC : ADC.W $0F82,X : CMP.B $12 : BMI .bounced 
    LDA.W $0FAC,X : BMI .bounced 
    LDA.W $0FAA,X 
    EOR.W #$FFFF 
    INC A 
    STA.W $0FAA,X 
    LDA.W $0FAC,X 
    EOR.W #$FFFF 
    INC A 
    STA.W $0FAC,X 

.bounced:
    LDA.W $0FAE,X : STA.B $12 
    LDA.W $0FB0,X : STA.B $14 
    JSL.L MoveEnemyDownBy_14_12 
    BCC .return 
    LDA.W $0FAE,X 
    EOR.W #$FFFF 
    INC A 
    STA.W $0FAE,X 
    LDA.W $0FB0,X 
    EOR.W #$FFFF 
    ADC.W #$0000 : STA.W $0FB0,X 

.return:
    RTL 


.leftBoundaryOffset:
    dw $FFC0 

.topBoundaryOffset:
    dw $0010,$FFD8,$FFD8,$FFF0,$FFA0,$0008,$FF80 

Function_KraidFoot_Phase1_PrepareToLungeForward:
    JSR.W HandleKraidPhase1 
    LDA.W $0FD2 : CMP.W #InstList_KraidArm_Normal_1 : BMI .return 
    LDA.W #InstList_KraidArm_Dying_PreparingToLungeForward : STA.W $0FD2 
    LDA.W #$0001 : STA.W $0FD4 
    LDA.W #$0001 : STA.W $10D4 
    LDA.W #InstList_KraidFoot_LungeForward_0 : STA.W $10D2 
    LDA.W #Function_KraidFoot_Phase1_LungeForward : STA.W $10E8 
    LDA.W #$0000 : STA.W $10F2 

.return:
    RTL 


Function_KraidFoot_Phase1_LungeForward:
    JSR.W HandleKraidPhase1 
    LDA.W $0F7A : CMP.W #$005C : BPL + 
    LDA.W #$005C : STA.W $0F7A 

  + LDA.W $10D2 : CMP.W #InstList_KraidFoot_LungeForward_1 : BNE .return 
    LDA.W $0F7A : CMP.W #$005C : BEQ .done 
    LDA.W #$0001 : STA.W $10D4 
    LDA.W #InstList_KraidFoot_LungeForward_0 : STA.W $10D2 
    RTL 


.done:
    LDA.W #Function_KraidFoot_Phase1_RetreatFromLunge : STA.L $7E7940 
    LDA.W #Function_KraidFoot_StartRetreat : STA.W $10E8 
    LDA.W #$0001 : STA.W $10F2 
    LDA.W #$0001 : STA.W $10D4 
    LDA.W #InstList_KraidFoot_KraidIsBig_Neutral : STA.W $10D2 

.return:
    RTL 


Function_KraidFoot_Phase1_RetreatFromLunge:
    JSR.W HandleKraidPhase1 
    LDA.W $0F7A : CMP.W #$00B0 : BMI + 
    LDA.W #$00B0 : STA.W $0F7A 

  + LDA.W $10D2 : CMP.W #InstList_KraidFoot_KraidIsBig_WalkingBackwards_1 : BMI .return 
    LDA.W $0F7A : CMP.W #$00B0 : BEQ .done 
    LDA.W #InstList_KraidFoot_KraidIsBig_WalkingBackwards_0 : STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    RTL 


.done:
    LDA.W #InstList_KraidArm_Normal_0 : STA.W $0FD2 
    LDA.W #$0001 : STA.W $0FD4 
    LDA.W #$0001 : STA.W $10D4 
    LDA.W #InstList_KraidFoot_KraidIsBig_Neutral : STA.W $10D2 
    LDA.W #Function_KraidFoot_Phase1_Thinking : STA.W $10E8 
    LDA.W #$012C : STA.W $10F2 
    LDA.W #Function_KraidFoot_Phase1_PrepareToLungeForward : STA.L $7E7940 

.return:
    RTL 


HandleKraidPhase1:
    LDA.W $0F8C : CMP.L $7E7818 : BMI .getBig 
    RTS 


.getBig:
    LDA.W #Function_Kraid_ProcessKraidInstruction : STA.W $0FA8 
    LDA.W #$00B4 : STA.W $0FB2 
    LDA.W #Function_Kraid_GetBig_ReleaseCamera : STA.L $7E7800 
    LDA.W $0FAA 
    TAX 
    LDA.W $0002,X 
    LDY.W #$0032 : CMP.W #Tilemap_KraidHead_0 : BEQ + 
    LDY.W #$002A : CMP.W #Tilemap_KraidHead_1 : BEQ + 
    LDY.W #$0022 : CMP.W #Tilemap_KraidHead_2 : BEQ + 
    LDY.W #$001A 

  + TYA 
    CLC : ADC.W #InstList_Kraid_Roar_1 : STA.W $0FAA 
    LDA.W InstList_Kraid_Roar_0,Y : STA.W $0FAC 
    LDA.W #$0004 : STA.W $183E 
    LDA.W #$0154 : STA.W $1840 
    LDA.W #InstList_KraidFoot_Initial : STA.W $10D2 
    LDA.W #$0001 : STA.W $10D4 
    LDA.W #RTL_A7BA2D : STA.W $10E8 
    LDA.W #InstList_KraidArm_Normal_0 : STA.W $0FD2 
    LDA.W #$0001 : STA.W $0FD4 
    LDA.W $1006 : ORA.W #$0100 : STA.W $1006 
    LDA.W $1046 : ORA.W #$0100 : STA.W $1046 
    LDA.W $1086 : ORA.W #$0100 : STA.W $1086 
    LDA.W $0FC6 : ORA.W #$0400 : STA.W $0FC6 
    RTS 


Function_Kraid_GetBig_ReleaseCamera:
    LDA.W #Function_Kraid_KraidGetsBig_BreakCeilingIntoPlatforms : STA.W $0FA8 
    LDA.W #$0202 : STA.L $7ECD20 
    LDA.W #$0101 : STA.L $7ECD22 
    LDA.W #$00A4 : STA.L $7E7808 
    RTL 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_CrumbleFirstSectionOfKraidsSpikeFloor_A7C0BD:
    JSL.L Spawn_Hardcoded_PLM 
    db $06,$1B 
    dw PLMEntries_crumbleKraidSpikeBlocks 
    JSL.L Spawn_Hardcoded_PLM 
    db $07,$1B 
    dw PLMEntries_crumbleKraidSpikeBlocks 
    JSL.L Spawn_Hardcoded_PLM 
    db $08,$1B 
    dw PLMEntries_crumbleKraidSpikeBlocks 
    JSL.L Spawn_Hardcoded_PLM 
    db $09,$1B 
    dw PLMEntries_crumbleKraidSpikeBlocks 
    JSL.L Spawn_Hardcoded_PLM 
    db $0A,$1B 
    dw PLMEntries_crumbleKraidSpikeBlocks 
    JSL.L Spawn_Hardcoded_PLM 
    db $0B,$1B 
    dw PLMEntries_crumbleKraidSpikeBlocks 
    JSL.L Spawn_Hardcoded_PLM 
    db $0C,$1B 
    dw PLMEntries_crumbleKraidSpikeBlocks 
    JSL.L Spawn_Hardcoded_PLM 
    db $0D,$1B 
    dw PLMEntries_crumbleKraidSpikeBlocks 
    JSL.L Spawn_Hardcoded_PLM 
    db $0E,$1B 
    dw PLMEntries_crumbleKraidSpikeBlocks 
    RTS 

    JSL.L Spawn_Hardcoded_PLM 
    db $0F,$1B 
    dw PLMEntries_crumbleKraidSpikeBlocks 
    JSL.L Spawn_Hardcoded_PLM 
    db $10,$1B 
    dw PLMEntries_crumbleKraidSpikeBlocks 
    JSL.L Spawn_Hardcoded_PLM 
    db $11,$1B 
    dw PLMEntries_crumbleKraidSpikeBlocks 
    JSL.L Spawn_Hardcoded_PLM 
    db $12,$1B 
    dw PLMEntries_crumbleKraidSpikeBlocks 
    JSL.L Spawn_Hardcoded_PLM 
    db $13,$1B 
    dw PLMEntries_crumbleKraidSpikeBlocks 
    RTS 

    JSL.L Spawn_Hardcoded_PLM 
    db $14,$1B 
    dw PLMEntries_crumbleKraidSpikeBlocks 
    JSL.L Spawn_Hardcoded_PLM 
    db $15,$1B 
    dw PLMEntries_crumbleKraidSpikeBlocks 
    JSL.L Spawn_Hardcoded_PLM 
    db $16,$1B 
    dw PLMEntries_crumbleKraidSpikeBlocks 
    JSL.L Spawn_Hardcoded_PLM 
    db $17,$1B 
    dw PLMEntries_crumbleKraidSpikeBlocks 
    JSL.L Spawn_Hardcoded_PLM 
    db $18,$1B 
    dw PLMEntries_crumbleKraidSpikeBlocks 
    JSL.L Spawn_Hardcoded_PLM 
    db $19,$1B 
    dw PLMEntries_crumbleKraidSpikeBlocks 
    JSL.L Spawn_Hardcoded_PLM 
    db $1A,$1B 
    dw PLMEntries_crumbleKraidSpikeBlocks 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


SpawnPLMToClearTheCeiling:
    JSL.L Spawn_Hardcoded_PLM 
    db $02,$12 
    dw PLMEntries_clearKraidCeilingBlocks 
    RTS 


SpawnPLMToClearTheSpikes:
    JSL.L Spawn_Hardcoded_PLM 
    db $05,$1B 
    dw PLMEntries_clearKraidSpikeBlocks 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_ClearSomeOfTheSpikeBlocks_A7C17A:
    JSL.L Spawn_Hardcoded_PLM 
    db $0B,$1B 
    dw PLMEntries_clearKraidSpikeBlocks 
    JSL.L Spawn_Hardcoded_PLM 
    db $0C,$1B 
    dw PLMEntries_clearKraidSpikeBlocks 
    JSL.L Spawn_Hardcoded_PLM 
    db $0D,$1B 
    dw PLMEntries_clearKraidSpikeBlocks 
    JSL.L Spawn_Hardcoded_PLM 
    db $0E,$1B 
    dw PLMEntries_clearKraidSpikeBlocks 
    JSL.L Spawn_Hardcoded_PLM 
    db $0F,$1B 
    dw PLMEntries_clearKraidSpikeBlocks 
    JSL.L Spawn_Hardcoded_PLM 
    db $10,$1B 
    dw PLMEntries_clearKraidSpikeBlocks 
    JSL.L Spawn_Hardcoded_PLM 
    db $11,$1B 
    dw PLMEntries_clearKraidSpikeBlocks 
    JSL.L Spawn_Hardcoded_PLM 
    db $12,$1B 
    dw PLMEntries_clearKraidSpikeBlocks 
    JSL.L Spawn_Hardcoded_PLM 
    db $13,$1B 
    dw PLMEntries_clearKraidSpikeBlocks 
    JSL.L Spawn_Hardcoded_PLM 
    db $14,$1B 
    dw PLMEntries_clearKraidSpikeBlocks 
    JSL.L Spawn_Hardcoded_PLM 
    db $15,$1B 
    dw PLMEntries_clearKraidSpikeBlocks 
    JSL.L Spawn_Hardcoded_PLM 
    db $16,$1B 
    dw PLMEntries_clearKraidSpikeBlocks 
    JSL.L Spawn_Hardcoded_PLM 
    db $17,$1B 
    dw PLMEntries_clearKraidSpikeBlocks 
    JSL.L Spawn_Hardcoded_PLM 
    db $18,$1B 
    dw PLMEntries_clearKraidSpikeBlocks 
    JSL.L Spawn_Hardcoded_PLM 
    db $19,$1B 
    dw PLMEntries_clearKraidSpikeBlocks 
    JSL.L Spawn_Hardcoded_PLM 
    db $1A,$1B 
    dw PLMEntries_clearKraidSpikeBlocks 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


UnpauseHook_KraidIsDead:
    PHP 
    SEP #$20 
    JSL.L SetForceBlankAndWaitForNMI 
    LDA.B #$00 : STA.W $2116 
    LDA.B $5D : AND.B #$0F 
    ASL #4
    CLC : ADC.B #$3F : STA.W $2117 
    LDA.B #$80 : STA.W $2115 
    JSL.L SetupHDMATransfer 
    db $01,$01,$18 
    dl Tiles_KraidRoomBackground 
    dw $0200 
    LDA.B #$02 : STA.W $420B 
    LDA.B #$00 : STA.W $2116 
    LDA.B #$40 : STA.W $2117 
    LDA.B #$80 : STA.W $2115 
    JSL.L SetupHDMATransfer 
    db $01,$01,$18 
    dl Tiles_Standard_BG3 
    dw $0800 
    LDA.B #$02 : STA.W $420B 
    JMP.W TransferKraidTopHalfTilemapToVRAM 


UnpauseHook_KraidIsAlive:
    PHP 
    SEP #$20 
    JSL.L SetForceBlankAndWaitForNMI 
    LDA.B #$00 : STA.W $2116 
    LDA.B $5D : CLC : ADC.B #$3E : STA.W $2117 
    LDA.B #$80 : STA.W $2115 
    JSL.L SetupHDMATransfer 
    db $01,$01,$18 
    dl $7E5000 
    dw $0400 
    LDA.B #$02 : STA.W $420B ; fallthrough to TransferKraidTopHalfTilemapToVRAM

TransferKraidTopHalfTilemapToVRAM:
    LDA.B #$00 : STA.W $2116 
    LDA.B $59 : AND.B #$FC : STA.W $2117 
    LDA.B #$80 : STA.W $2115 
    JSL.L SetupHDMATransfer 
    db $01,$01,$18 
    dl $7E2000 
    dw $0800 
    LDA.B #$02 : STA.W $420B 
    JSL.L ClearForceBlankAndWaitForNMI 
    PLP 
    RTL 


UnpauseHook_KraidIsSinking:
    PHP 
    SEP #$20 
    JSL.L SetForceBlankAndWaitForNMI 
    LDA.B #$00 : STA.W $2116 
    LDA.B $5D : CLC : ADC.B #$3E : STA.W $2117 
    LDA.B #$80 : STA.W $2115 
    JSL.L SetupHDMATransfer 
    db $01,$01,$18 
    dl $7E5000 
    dw $0400 
    LDA.B #$02 : STA.W $420B 
    REP #$30 
    PHB : PHK : PLB 
    LDA.W $0F7E : CMP.W ShrinkingKraidTable_KraidYPosition : BMI .return 
    LDY.W #$0000 
    LDX.W $0330 

.loop:
    REP #$30 
    LDA.W ShrinkingKraidTable_KraidYPosition,Y : CMP.W #$FFFF : BEQ .return 
    LDA.W $0F7E : CMP.W ShrinkingKraidTable_KraidYPosition,Y : BMI .return 
    LDA.W #$0040 : STA.B $D0,X 
    LDA.W #$2FC0 : STA.B $D2,X 
    LDA.W #$007E : STA.B $D4,X 
    LDA.B $59 : AND.W #$00FC 
    XBA 
    CLC : ADC.W ShrinkingKraidTable_VRAMBG2TilemapOffset,Y : STA.B $D5,X 
    TXA 
    CLC : ADC.W #$0007 : STA.W $0330 
    JSL.L WaitForNMI 
    TYA 
    CLC : ADC.W #$0006 : TAY 
    BRA .loop 


.return:
    PLB 
    JSL.L SetForceBlankAndWaitForNMI 
    PLP 
    RTL 


PauseHook_Kraid:
    PHP 
    REP #$30 
    LDX.W $0360 
    LDA.B $5D : AND.W #$00FC 
    XBA 
    CLC : ADC.W #$3E00 : STA.W $0340,X 
    LDA.W #$0081 : STA.W $0342,X 
    LDA.W #$0039 : STA.W $0343,X 
    LDA.W #$5000 : STA.W $0344,X 
    LDA.W #$007E : STA.W $0346,X 
    LDA.W #$0400 : STA.W $0347,X 
    TXA 
    CLC : ADC.W #$0009 : STA.W $0360 
    PLP 
    RTL 


KraidDeath_Initialize:
    LDA.L $7E782A : BEQ .notHurtFrame 
    RTL 


.notHurtFrame:
    LDX.W #$00C0 
    LDA.W #$0000 

.loopPalette6:
    STA.L $7EC200,X 
    INX #2
    CPX.W #$00E0 
    BMI .loopPalette6 
    LDX.W #$001E 

.loopPalette7:
    LDA.W Palette_Kraid_Death,X : STA.L $7EC0E0,X 
    DEX #2
    BPL .loopPalette7 
    LDA.W #InstList_KraidArm_Dying_PreparingToLungeForward : STA.W $0FD2 
    LDA.W #$0001 : STA.W $0FD4 
    LDA.W #KraidDeath_FadeOutBackground : STA.W $0FA8 
    LDA.W #InstList_Kraid_Dying_1 : STA.W $0FAA 
    LDA.W InstList_Kraid_Dying_0 : STA.W $0FAC 
    LDX.W $0E54 
    PHX 
    LDA.W $1106 : AND.W #$BFFF : STA.W $1106 
    LDA.W #$0180 : STA.W $0E54 
    JSL.L EnemyDeath 
    LDA.W $1146 : AND.W #$BFFF : STA.W $1146 
    LDA.W #$01C0 : STA.W $0E54 
    JSL.L EnemyDeath 
    LDA.W #$0080 : STA.W $0E54 
    JSL.L EnemyDeath 
    LDA.W #$00C0 : STA.W $0E54 
    JSL.L EnemyDeath 
    LDA.W #$0100 : STA.W $0E54 
    JSL.L EnemyDeath 
    PLA 
    STA.W $0E54 
    JSL.L Spawn_Hardcoded_PLM 
    db $05,$1B 
    dw PLMEntries_crumbleKraidSpikeBlocks 
    RTL 


KraidDeath_FadeOutBackground:
    JSR.W KraidInstListHandling 
    JSL.L Advance_GradualColorChange_ofBGPalette6 
    BCC .return 
    LDA.W #KraidDeath_UpdateBG2TilemapTopHalf : STA.W $0FA8 
    LDA.W #$0001 : STA.L $7E782C 
    STA.L $7E782A 
    JSR.W KraidPaletteHandling 
    LDX.W #$0000 
    LDA.W #$0000 

.loopClearRoomBackground:
    STA.L $7E4000,X 
    STA.L $7E4002,X 
    INX #4
    CPX.W #$0200 
    BMI .loopClearRoomBackground 
    LDX.W $0330 
    LDA.W #$0200 : STA.B $D0,X 
    LDA.W #$4000 : STA.B $D2,X 
    SEP #$20 
    LDA.B #$7E : STA.B $D4,X 
    REP #$20 
    LDA.B $5D : AND.W #$000F 
    XBA 
    CLC : ADC.W #$3F00 : STA.B $D5,X 
    TXA 
    CLC : ADC.W #$0007 : STA.W $0330 

.return:
    RTL 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProcessKraidInstruction_WithNoASMInstructions_A7C457:
    LDA.W $0FAC : BEQ .return 
    DEC.W $0FAC 
    BNE .return 
    LDX.W $0FAA 
    LDA.W $0000,X : BPL .timer 
    LDA.W #$0000 : STA.W $0FAC 
    RTS 


.timer:
    STA.W $0FAC 
    TXA 
    CLC : ADC.W #$0008 : STA.W $0FAA 
    LDA.W $0002,X 
    TAY 
    LDX.W $0330 
    LDA.W #$02C0 : STA.B $D0,X 
    INX #2
    STY.B $D0,X 
    INX #2
    SEP #$20 
    LDA.B #$A7 : STA.B $D0,X 
    REP #$20 
    INX 
    LDA.B $59 : AND.W #$00FC 
    XBA 
    STA.B $D0,X 
    INX #2
    STX.W $0330 

.return:
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


KraidDeath_UpdateBG2TilemapTopHalf:
    JSR.W KraidInstListHandling 
    LDA.W #KraidDeath_UpdateBG2TilemapBottomHalf : STA.W $0FA8 
    LDA.W #Function_KraidNail_HorizontallyAlignEnemyToKraid : STA.W $1028 
    STA.W $1068 
    STA.W $10A8 
    LDA.W #$7FFF : STA.W $1032 
    STA.W $1072 
    STA.W $10B2 
    JMP.W UpdateBG2TilemapTopHalf 


KraidDeath_UpdateBG2TilemapBottomHalf:
    JSR.W KraidInstListHandling 
    SEP #$20 
    LDA.B #$A7 : STA.W $0606 
    REP #$20 
    LDA.W #UnpauseHook_KraidIsSinking : STA.W $0604 
    LDA.W #KraidDeath_SinkThroughFloor : STA.W $0FA8 
    LDA.W #$002B : STA.L $7E9000 
    LDA.W $0F86 : ORA.W #$8000 : STA.W $0F86 
    LDA.W #$0001 : STA.W $183E 
    LDA.W #$0100 : STA.W $1840 
    LDA.W #InstList_KraidArm_RisingSinking : STA.W $0FD2 
    LDA.W #$0001 : STA.W $0FD4 
    LDA.W #InstList_KraidFoot_Initial : STA.W $10D2 
    LDA.W #$0001 : STA.W $10D4 
    LDA.W #RTL_A7BA2D : STA.W $10E8 
    JMP.W UpdateBG2TilemapBottomHalf 


PlaySoundEveryHalfSecond:
    LDA.L $7E9000 
    DEC A 
    STA.L $7E9000 
    BNE .return 
    LDA.W #$001E : JSL.L QueueSound_Lib3_Max6 
    LDA.W #$001E : STA.L $7E9000 

.return:
    RTS 


KraidDeath_SinkThroughFloor:
    JSR.W KraidInstListHandling 
    JSR.W PlaySoundEveryHalfSecond 
    JSR.W HandleKraidSinking 
    INC.W $0F7E 
    LDA.W $0F7E : CMP.W #$0260 : BMI .return 
    LDA.W $0F86 : AND.W #$FBFF : STA.W $0F86 
    LDA.W #$0002 : STA.W $179A 
    LDY.W $0E54 
    LDX.W $0F78,Y 
    LDA.W #RTL_A7804C : STA.L $A00032,X 
    LDA.W $0FC6 
    ORA.W #$0200 
    ORA.W #$0400 
    STA.W $0FC6 
    ORA.W #$0200 
    ORA.W #$0400 
    AND.W #$F7FF ; >.< #$57FF
    AND.W #$DFFF 
    AND.W #$7FFF 
    STA.W $1006 
    STA.W $1046 
    STA.W $1086 
    STA.W $10C6 
    LDA.W #Function_Kraid_FadeInRegularBG_ClearBG2TilemapTopHalf : STA.W $0FA8 
    STZ.W $0941 
    JSL.L KraidDeathItemDropRoutine 
    JMP.W DrawKraidsRoomBackground 


.return:
    RTL 


HandleKraidSinking:
    LDY.W #$0000 

.loop:
    LDA.W ShrinkingKraidTable_KraidYPosition,Y : BMI .return 
    CMP.W $0F7E : BEQ .found 
    TYA 
    CLC : ADC.W #$0006 : TAY 
    BRA .loop 


.found:
    LDA.W ShrinkingKraidTable_VRAMBG2TilemapOffset,Y : BMI .executeFunction 
    LDX.W $0330 
    LDA.W #$0040 : STA.B $D0,X 
    LDA.W #$2FC0 : STA.B $D2,X 
    SEP #$20 
    LDA.B #$7E : STA.B $D4,X 
    REP #$20 
    LDA.B $59 : AND.W #$00FC 
    XBA 
    CLC : ADC.W ShrinkingKraidTable_VRAMBG2TilemapOffset,Y : STA.B $D5,X 
    TXA 
    CLC : ADC.W #$0007 : STA.W $0330 

.executeFunction:
    TYX 
    JSR.W (ShrinkingKraidTable_functionPointer,X) 

.return:
    RTS 


ShrinkingKraidTable_KraidYPosition:
    dw $0130 

ShrinkingKraidTable_VRAMBG2TilemapOffset:
    dw $08A0 

ShrinkingKraidTable_functionPointer:
    dw CrumbleLeftPlatform_Left 
    dw $0138,$0880 
    dw RTS_A7C6A6 
    dw $0140,$0860 
    dw RTS_A7C6A6 
    dw $0148,$0840 
    dw CrumbleRightPlatform_Middle 
    dw $0150,$0820 
    dw RTS_A7C6A6 
    dw $0158,$0800 
    dw RTS_A7C6A6 
    dw $0160,$03E0 
    dw CrumbleRightPlatform_Left 
    dw $0168,$03C0 
    dw RTS_A7C6A6 
    dw $0170,$03A0 
    dw RTS_A7C6A6 
    dw $0178,$0380 
    dw RTS_A7C6A6 
    dw $0180,$0360 
    dw CrumbleLeftPlatform_Right 
    dw $0188,$0340 
    dw RTS_A7C6A6 
    dw $0190,$0320 
    dw RTS_A7C6A6 
    dw $0198,$0300 
    dw CrumbleLeftPlatform_Middle 
    dw $01A0,$02E0 
    dw RTS_A7C6A6 
    dw $01A8,$02C0 
    dw RTS_A7C6A6 
    dw $01B0,$02A0 
    dw CrumbleRightPlatform_Right 
    dw $01B8,$0280 
    dw RTS_A7C6A6 
    dw $01C0,$0260 
    dw RTS_A7C6A6 
    dw $01C8,$0240 
    dw RTS_A7C6A6 
    dw $01D0,$0220 
    dw RTS_A7C6A6 
    dw $01D8,$0200 
    dw RTS_A7C6A6 
    dw $01E0,$01E0 
    dw RTS_A7C6A6 
    dw $01E8,$01C0 
    dw RTS_A7C6A6 
    dw $01F0,$01A0 
    dw RTS_A7C6A6 
    dw $01F8,$0180 
    dw RTS_A7C6A6 
    dw $0200,$0160 
    dw RTS_A7C6A6 
    dw $0208,$0140 
    dw RTS_A7C6A6 
    dw $FFFF 

CrumbleLeftPlatform_Left:
    LDA.W #$0070 
    LDY.W #EnemyProjectile_KraidCeilingRocks 
    LDX.W $0E54 
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    JSL.L Spawn_Hardcoded_PLM ; fallthrough to RTS_A7C6A6
    db $07,$12 
    dw PLMEntries_setKraidCeilingBlockToBackground2 

RTS_A7C6A6:
    RTS 


CrumbleRightPlatform_Middle:
    LDA.W #$00F0 
    LDY.W #EnemyProjectile_KraidCeilingRocks 
    LDX.W $0E54 
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    JSL.L Spawn_Hardcoded_PLM 
    db $0F,$12 
    dw PLMEntries_setKraidCeilingBlockToBackground2 
    RTS 


CrumbleRightPlatform_Left:
    LDA.W #$00E0 
    LDY.W #EnemyProjectile_KraidCeilingRocks 
    LDX.W $0E54 
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    JSL.L Spawn_Hardcoded_PLM 
    db $0E,$12 
    dw PLMEntries_SetKraidCeilingBlockToBackground3 
    RTS 


CrumbleLeftPlatform_Right:
    LDA.W #$0090 
    LDY.W #EnemyProjectile_KraidCeilingRocks 
    LDX.W $0E54 
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    JSL.L Spawn_Hardcoded_PLM 
    db $09,$12 
    dw PLMEntries_setKraidCeilingBlockToBackground2 
    RTS 


CrumbleLeftPlatform_Middle:
    LDA.W #$0080 
    LDY.W #EnemyProjectile_KraidCeilingRocks 
    LDX.W $0E54 
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    JSL.L Spawn_Hardcoded_PLM 
    db $08,$12 
    dw PLMEntries_SetKraidCeilingBlockToBackground3 
    RTS 


CrumbleRightPlatform_Right:
    LDA.W #$0100 
    LDY.W #EnemyProjectile_KraidCeilingRocks 
    LDX.W $0E54 
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    JSL.L Spawn_Hardcoded_PLM 
    db $10,$12 
    dw PLMEntries_SetKraidCeilingBlockToBackground3 
    RTS 


Function_Kraid_FadeInRegularBG_ClearBG2TilemapTopHalf:
    SEP #$20 
    LDA.B #$48 : STA.B $59 
    REP #$20 
    LDX.W #$07FE 
    LDA.W #$0338 

.loop:
    STA.L $7E2000,X 
    DEX #2
    BPL .loop 
    LDX.W $0330 
    LDA.W #$0400 : STA.B $D0,X 
    LDA.W #$2000 : STA.B $D2,X 
    LDA.W #$007E : STA.B $D4,X 
    LDA.W #$4800 : STA.B $D5,X 
    TXA 
    CLC : ADC.W #$0007 : STA.W $0330 
    LDA.W #Function_Kraid_FadeInRegularBG_ClearBG2TilemapBottomHalf : STA.W $0FA8 
    RTL 


Function_Kraid_FadeInRegularBG_ClearBG2TilemapBottomHalf:
    LDX.W $0330 
    LDA.W #$0400 : STA.B $D0,X 
    LDA.W #$2000 : STA.B $D2,X 
    LDA.W #$007E : STA.B $D4,X 
    LDA.W #$4A00 : STA.B $D5,X 
    TXA 
    CLC : ADC.W #$0007 : STA.W $0330 
    LDA.W #Function_Kraid_FadeInRegularBG_LoadStandardBG3Tiles_0 : STA.W $0FA8 
    RTL 


Function_Kraid_FadeInRegularBG_LoadStandardBG3Tiles_0:
    LDA.W #UnpauseHook_KraidIsDead : STA.W $0604 
    LDA.W #Function_Kraid_FadeInRegularBG_LoadStandardBG3Tiles_1 : STA.W $0FA8 
    LDX.W $0330 
    LDA.W #$0400 : STA.B $D0,X 
    LDA.W #Tiles_Standard_BG3 : STA.B $D2,X 
    LDA.W #Tiles_Standard_BG3>>16 : STA.B $D4,X 
    LDA.W #$4000 : STA.B $D5,X 
    TXA 
    CLC : ADC.W #$0007 : STA.W $0330 
    RTL 


Function_Kraid_FadeInRegularBG_LoadStandardBG3Tiles_1:
    LDA.W #Function_Kraid_FadeInRegularBG_LoadStandardBG3Tiles_2 : STA.W $0FA8 
    LDX.W $0330 
    LDA.W #$0400 : STA.B $D0,X 
    LDA.W #Tiles_Standard_BG3+$400 : STA.B $D2,X 
    LDA.W #Tiles_Standard_BG3>>16 : STA.B $D4,X 
    LDA.W #$4200 : STA.B $D5,X 
    TXA 
    CLC : ADC.W #$0007 : STA.W $0330 
    RTL 


Function_Kraid_FadeInRegularBG_LoadStandardBG3Tiles_2:
    LDA.W #Function_Kraid_FadeInRegularBG_LoadStandardBG3Tiles_3 : STA.W $0FA8 
    LDX.W $0330 
    LDA.W #$0400 : STA.B $D0,X 
    LDA.W #Tiles_Standard_BG3+$800 : STA.B $D2,X 
    LDA.W #Tiles_Standard_BG3>>16 : STA.B $D4,X 
    LDA.W #$4400 : STA.B $D5,X 
    TXA 
    CLC : ADC.W #$0007 : STA.W $0330 
    RTL 


Function_Kraid_FadeInRegularBG_LoadStandardBG3Tiles_3:
    LDA.W #Function_Kraid_FadeInRegularBG_FadeInBGPalette6 : STA.W $0FA8 
    LDX.W $0330 
    LDA.W #$0400 : STA.B $D0,X 
    LDA.W #Tiles_Standard_BG3+$C00 : STA.B $D2,X 
    LDA.W #Tiles_Standard_BG3>>16 : STA.B $D4,X 
    LDA.W #$4600 : STA.B $D5,X 
    TXA 
    CLC : ADC.W #$0007 : STA.W $0330 
    RTL 


Function_Kraid_FadeInRegularBG_FadeInBGPalette6:
    JSL.L Advance_GradualColorChange_ofBGPalette6 
    BCC .return 
    LDA.W #$0003 : JSL.L QueueMusicDataOrTrack_8FrameDelay 
    LDX.W $079F 
    LDA.L $7ED828,X : BIT.W #$0001 
    BNE .KraidIsDead 
    ORA.W #$0001 
    STA.L $7ED828,X 
    LDA.W #Function_Kraid_FadeInRegularBG_SetToDead_KraidWasAlive : STA.W $0FA8 

.return:
    RTL 


.KraidIsDead:
    LDA.W #Function_Kraid_FadeInRegularBG_SetToDead_KraidWasDead : STA.W $0FA8 
    RTL 


Function_Kraid_FadeInRegularBG_SetToDead_KraidWasAlive:
    JSR.W CheckIfKraidHasDied 
    BEQ .setToDead 
    LDA.W $0911 : BEQ .return 

.setToDead:
    JSR.W SetEnemyPropertiesToDead 

.return:
    RTL 


Function_Kraid_FadeInRegularBG_SetToDead_KraidWasDead:
    JSR.W CheckIfKraidHasDied 
    BEQ .setToDead 
    LDA.W $0911 : BEQ .return 

.setToDead:
    JSR.W SetEnemyPropertiesToDead 

.return:
    LDA.W #$FFFF : STA.W $08FF 
    RTL 


Function_Kraid_RestrictSamusXPositionToFirstScreen:
    JSR.W RestrictSamusXPositionToFirstScreen 
    JMP.W Function_Kraid_HandleFunctionTimer 


Function_Kraid_RaiseThruFloor_LoadTilemapTopHalf:
    JSR.W RestrictSamusXPositionToFirstScreen 
    LDA.W #Function_Kraid_RaiseThruFloor_LoadTilemapBottomHalf_ShakeScn : STA.W $0FA8 ; fallthrough to UpdateBG2TilemapTopHalf

UpdateBG2TilemapTopHalf:
    LDX.W $0330 
    LDA.W #$0800 : STA.B $D0,X 
    LDA.W #$2000 : STA.B $D2,X 
    SEP #$20 
    LDA.B #$7E : STA.B $D4,X 
    REP #$20 
    LDA.B $59 : AND.W #$00FC 
    XBA 
    STA.B $D5,X 
    TXA 
    CLC : ADC.W #$0007 : STA.W $0330 
    RTL 


Function_Kraid_RaiseThruFloor_LoadTilemapBottomHalf_ShakeScn:
    JSR.W RestrictSamusXPositionToFirstScreen 
    LDA.W #Function_Kraid_RaiseThruFloor_SpawnRNGEarthquakeProjEvery10f : STA.W $0FA8 
    LDA.W #$0078 : STA.W $0FB2 
    LDA.W #$01F0 : STA.W $1840 
    LDA.W #$0005 : JSL.L QueueMusicDataOrTrack_8FrameDelay ; fallthrough to UpdateBG2TilemapBottomHalf

UpdateBG2TilemapBottomHalf:
    LDX.W $0330 
    LDA.W #$0800 : STA.B $D0,X 
    LDA.W #$2800 : STA.B $D2,X 
    SEP #$20 
    LDA.B #$7E : STA.B $D4,X 
    REP #$20 
    LDA.B $59 : AND.W #$00FC 
    XBA 
    CLC : ADC.W #$0800 : STA.B $D5,X 
    TXA 
    CLC : ADC.W #$0007 : STA.W $0330 
    RTL 


Function_Kraid_RaiseThruFloor_SpawnRNGEarthquakeProjEvery10f:
    JSR.W RestrictSamusXPositionToFirstScreen 
    LDA.W $0FB2 
    DEC A 
    STA.W $0FB2 
    BNE .timerNotExpired 
    LDA.W #Function_Kraid_RaiseThruFloor_SpawnRNGEarthquakeProjEvery8f : STA.W $0FA8 
    LDA.W #$0060 : STA.W $0FB2 
    RTL 


.timerNotExpired:
    AND.W #$000F 
    BNE .return 
    JSR.W SpawnRandomEarthquakeProjectile 

.return:
    RTL 


Function_Kraid_RaiseThruFloor_SpawnRNGEarthquakeProjEvery8f:
    JSR.W RestrictSamusXPositionToFirstScreen 
    LDA.W $0FB2 
    DEC A 
    STA.W $0FB2 
    BNE .timerNotExpired 
    LDA.W #Function_Kraid_RaiseThruFloor_RaiseKraid : STA.W $0FA8 
    LDA.W #$0120 : STA.W $0FB2 
    RTL 


.timerNotExpired:
    AND.W #$0007 
    BNE .return 
    JSR.W SpawnRandomEarthquakeProjectile 

.return:
    RTL 


Function_Kraid_RaiseThruFloor_RaiseKraid:
    JSR.W RestrictSamusXPositionToFirstScreen 
    LDA.W $1840 : BIT.W #$0005 
    BNE + 
    JSR.W SpawnRandomEarthquakeProjectile 

  + LDY.W #$0001 
    LDA.W $0F7E : BIT.W #$0002 
    BNE + 
    LDY.W #$FFFF 

  + STY.B $12 
    LDA.W $0F7A : CLC : ADC.B $12 : STA.W $0F7A 
    LDA.W $0F80 : SEC : SBC.W #$8000 : STA.W $0F80 
    LDA.W $0F7E : SBC.W #$0000 : STA.W $0F7E 
    LDA.W $0F7E : CMP.W #$01C9 : BPL .return 
    LDA.W #$00B0 : STA.W $0F7A 
    LDA.W #Function_KraidFoot_Phase1_Thinking : STA.W $10E8 
    LDA.W #$012C : STA.W $10F2 
    LDA.W #Function_KraidFoot_Phase1_PrepareToLungeForward : STA.L $7E7940 
    LDA.W #InstList_Kraid_Roar_1 : STA.W $0FAA 
    JSR.W SetupKraidMainLoop_Thinking 
    LDA.W #InstList_KraidArm_Normal_0 : STA.W $0FD2 
    LDA.W #$0001 : STA.W $0FD4 

.return:
    RTL 


SpawnRandomEarthquakeProjectile:
    LDA.W $05B5 : BIT.W #$0002 
    LDA.W $05E5 : AND.W #$003F 
    TAX 
    LDA.W $05E5 : BIT.W #$0002 
    BNE + 
    TXA 
    EOR.W #$FFFF 
    TAX 

  + TXA 
    CLC : ADC.W $0F7A : STA.B $12 
    LDA.W $05E5 : AND.W #$3F00 
    XBA 
    STA.B $14 
    LDA.W #$01C0 : SEC : SBC.B $14 : STA.B $14 
    LDA.W #$0015 : STA.B $16 
    STZ.B $18 
    JSL.L Create_Sprite_Object 
    LDY.W #EnemyProjectile_KraidFloorRocks_Left 
    LDA.W $05E5 : BIT.W #$0010 
    BEQ .keepLeft 
    LDY.W #EnemyProjectile_KraidFloorRocks_Right 

.keepLeft:
    LDX.W $0E54 
    LDA.W $05E5 : AND.W #$03F0 
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    RTS 


RestrictSamusXPositionToFirstScreen:
    LDA.W $0AF6 : SEC : SBC.W #$0100 : BMI .return 
    LDA.W #$0100 : STA.W $0AF6 
    STA.W $0B10 

.return:
    RTS 


Palette_Phantoon:
    dw $3800,$7FFF,$7EC0,$6DE0,$54E0,$0000,$0000,$0000 
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Palette_Phantoon_A7CA21:
    dw $0000,$477B,$2E52,$00C6,$0063,$3AB5,$2210,$116B 
    dw $0508,$7FFF,$36B5,$19AD,$0929,$381D,$1814,$000A 
endif ; !FEATURE_KEEP_UNREFERENCED

Palette_Phantoon_FadeOutTarget:
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000 
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000 

Palette_WreckedShipPoweredOn:
    dw $0000,$02DF,$01D7,$00AC,$5EBB,$3DB3,$292E,$1486 
    dw $0BB1,$48FB,$7FFF,$0000,$7FFF,$44E5,$7FFF,$0000 
    dw $2003,$0BB1,$1EA9,$0145,$5EBB,$3DB3,$292E,$1486 
    dw $6318,$1CE7,$1084,$0000,$7FFF,$02DF,$001F,$0000 
    dw $2003,$72BC,$48FB,$1816,$6318,$6318,$6318,$6318 
    dw $6318,$6318,$6318,$6318,$6318,$6318,$7FFF,$0000 
    dw $0000,$72B2,$71C7,$4D03,$6318,$6318,$6318,$6318 
    dw $6318,$6318,$6318,$6318,$6318,$6318,$7FFF,$0000 
    dw $0000,$3EF4,$262E,$0D68,$3E94,$25CE,$0D08,$1484 
    dw $6E94,$55CE,$3D08,$2C84,$1EA9,$0BB1,$7FFF,$0000 
    dw $0000,$1246,$0145,$00C0,$3652,$1D8C,$04C6,$0484 
    dw $6231,$496B,$30A5,$2021,$0015,$025B,$7FFF,$0000 
    dw $0000,$6318,$6318,$6318,$6318,$6318,$6318,$6318 
    dw $6318,$6318,$6318,$6318,$6318,$6318,$7FFF,$0000 

Palette_Phantoon_HealthBased_0:
    dw $000E,$25DC,$1538,$0071,$0030,$1D79,$1117,$08B4 
    dw $0092,$421F,$1D79,$0CF5,$0493,$1C1D,$0C19,$0013 

Palette_Phantoon_HealthBased_1:
    dw $000C,$2A1C,$1957,$0070,$002E,$2199,$1136,$08D3 
    dw $0091,$4A5F,$1D99,$0CF4,$04B1,$201D,$0C18,$0012 

Palette_Phantoon_HealthBased_2:
    dw $000A,$2E5C,$1D96,$008E,$004C,$25D8,$1555,$08F1 
    dw $00AF,$529F,$21D8,$1113,$04D0,$241D,$1017,$0011 

Palette_Phantoon_HealthBased_3:
    dw $0008,$327C,$21B5,$008C,$004A,$29F7,$1574,$0D10 
    dw $00AE,$5ADF,$25F7,$1131,$04CE,$281D,$1016,$000F 

Palette_Phantoon_HealthBased_4:
    dw $0006,$36BB,$21D4,$008B,$0048,$2E17,$1993,$0D0F 
    dw $00CC,$631F,$2A17,$1150,$04ED,$2C1D,$1016,$000E 

Palette_Phantoon_HealthBased_5:
    dw $0004,$3AFB,$25F3,$00A9,$0046,$3256,$1DB2,$0D2D 
    dw $00EB,$6B5F,$2E56,$156F,$04EB,$301D,$1415,$000C 

Palette_Phantoon_HealthBased_6:
    dw $0002,$3F3B,$2A12,$00A7,$0044,$3675,$1DF1,$0D4C 
    dw $04E9,$77BF,$3275,$158E,$050A,$341D,$1414,$000B 

Palette_Phantoon_HealthBased_7:
    dw $0000,$477B,$2E52,$00C6,$0063,$3AB5,$2210,$116B 
    dw $0508,$7FFF,$36B5,$19AD,$0929,$381D,$1814,$000A 

InstList_Phantoon_Body_Invulnerable:
    dw $0001 
    dw ExtendedSpritemap_Phantoon_Body_Invulnerable 
    dw Instruction_Common_Sleep 

InstList_Phantoon_Body_FullHitbox:
    dw $0001 
    dw ExtendedSpritemap_Phantoon_Body_FullHitbox 
    dw Instruction_CommonA7_Sleep 

InstList_Phantoon_Body_EyeHitboxOnly:
    dw $0001 
    dw ExtendedSpritemap_Phantoon_Body_EyeHitbox 
    dw Instruction_CommonA7_Sleep 

InstList_Phantoon_Eye_Open:
    dw $000A 
    dw ExtendedSpritemap_Phantoon_Eye_Opening 
    dw $000A 
    dw ExtendedSpritemap_Phantoon_Eye_OpeningClosing 
    dw $0001 
    dw ExtendedSpritemap_Phantoon_Eye_Open 
    dw Instruction_Common_CallFunctionInY 
    dw PlayPhantoonMaterializationSFX 
    dw Instruction_Common_CallFunctionInY 
    dw SetupEyeOpenPhantoonState 
    dw Instruction_Common_Sleep 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_Phantoon_Eye_Open_IgnoringSamus_A7CC69:
    dw $000A 
    dw ExtendedSpritemap_Phantoon_Eye_Opening 
    dw $000A 
    dw ExtendedSpritemap_Phantoon_Eye_OpeningClosing 
    dw $0001 
    dw ExtendedSpritemap_Phantoon_Eye_Open 
    dw Instruction_Common_CallFunctionInY 
    dw PlayPhantoonMaterializationSFX 
    dw Instruction_CommonA7_Sleep 
endif ; !FEATURE_KEEP_UNREFERENCED

InstList_Phantoon_Eye_Closed:
    dw $0001 
    dw ExtendedSpritemap_Phantoon_Eye_Closed 
    dw Instruction_Common_Sleep 

InstList_Phantoon_Eye_Close_PickNewPattern:
    dw $0001 
    dw ExtendedSpritemap_Phantoon_Eye_Open 
    dw $000A 
    dw ExtendedSpritemap_Phantoon_Eye_OpeningClosing 
    dw Instruction_Common_CallFunctionInY 
    dw PickNewPhantoonPattern 
    dw Instruction_Common_GotoY 
    dw InstList_Phantoon_Eye_Closed 

InstList_Phantoon_Eye_Close:
    dw $0001 
    dw ExtendedSpritemap_Phantoon_Eye_Open 
    dw $000A 
    dw ExtendedSpritemap_Phantoon_Eye_OpeningClosing 
    dw Instruction_Common_GotoY 
    dw InstList_Phantoon_Eye_Closed 

InstList_Phantoon_Eyeball_Centered:
    dw $0001 
    dw ExtendedSpritemap_Phantoon_Eyeball_Centered 
    dw Instruction_Common_CallFunctionInY 
    dw PlayPhantoonMaterializationSFX 
    dw Instruction_Common_Sleep 

InstList_Phantoon_Eyeball_LookingUp:
    dw $0001 
    dw ExtendedSpritemap_Phantoon_Eyeball_LookingUp 
    dw Instruction_Common_Sleep 

InstList_Phantoon_Eyeball_LookingUpRight:
    dw $0001 
    dw ExtendedSpritemap_Phantoon_Eyeball_LookingUpRight 
    dw Instruction_CommonA7_Sleep 

InstList_Phantoon_Eyeball_LookingRight:
    dw $0001 
    dw ExtendedSpritemap_Phantoon_Eyeball_LookingRight 
    dw Instruction_CommonA7_Sleep 

InstList_Phantoon_Eyeball_LookingDownRight:
    dw $0001 
    dw ExtendedSpritemap_Phantoon_Eyeball_LookingDownRight 
    dw Instruction_Common_Sleep 

InstList_Phantoon_Eyeball_LookingDown:
    dw $0001 
    dw ExtendedSpritemap_Phantoon_Eyeball_LookingDown 
    dw Instruction_Common_Sleep 

InstList_Phantoon_Eyeball_LookingDownLeft:
    dw $0001 
    dw ExtendedSpritemap_Phantoon_Eyeball_LookingDownLeft 
    dw Instruction_CommonA7_Sleep 

InstList_Phantoon_Eyeball_LookingLeft:
    dw $0001 
    dw ExtendedSpritemap_Phantoon_Eyeball_LookingLeft 
    dw Instruction_CommonA7_Sleep 

InstList_Phantoon_Eyeball_LookingUpLeft:
    dw $0001 
    dw ExtendedSpritemap_Phantoon_Eyeball_LookingUpLeft 
    dw Instruction_CommonA7_Sleep 

InstList_Phantoon_Tentacles:
    dw $0008 
    dw ExtendedSpritemap_Phantoon_Tentacles_0 
    dw $0008 
    dw ExtendedSpritemap_Phantoon_Tentacles_1 
    dw $0008 
    dw ExtendedSpritemap_Phantoon_Tentacles_2 
    dw $0008 
    dw ExtendedSpritemap_Phantoon_Tentacles_1 
    dw Instruction_Common_GotoY 
    dw InstList_Phantoon_Tentacles 

InstList_Phantoon_Mouth_SpawnFlame:
    dw $0005 
    dw ExtendedSpritemap_Phantoon_Mouth_SpawningFlame_1 
    dw $0005 
    dw ExtendedSpritemap_Phantoon_Mouth_SpawningFlame_0 
    dw Instruction_Common_CallFunctionInY 
    dw SpawnCasualFlame 

InstList_Phantoon_Mouth_Initial:
    dw $0001 
    dw ExtendedSpritemap_Phantoon_Mouth_Normal 
    dw Instruction_CommonA7_Sleep 

CasualFlameTimers_pointers:
    dw CasualFlameTimers_pattern0 
    dw CasualFlameTimers_pattern1 
    dw CasualFlameTimers_pattern2 
    dw CasualFlameTimers_pattern3 

CasualFlameTimers_pattern0:
    dw $0005,$00B4,$0020,$0020,$0020,$0020,$0020 

CasualFlameTimers_pattern1:
    dw $0003,$00B4,$0010,$0010,$0010 

CasualFlameTimers_pattern2:
    dw $0007,$00B4,$0030,$0030,$0030,$0030,$0030,$0030 
    dw $0030 

CasualFlameTimers_pattern3:
    dw $0007,$00B4,$0010,$0040,$0020,$0040,$0020,$0010 
    dw $0020 

Phantoon_Figure8_VulnerableWindowTimers:
    dw $003C,$001E,$000F,$001E,$003C,$001E,$000F,$003C 

EmptyHDMATable:
    db $00,$00 

Phantoon_EyeClosedTimers:
    dw $02D0,$003C,$0168,$02D0,$0168,$003C,$0168,$02D0 

Phantoon_FlameRain_HidingTimers:
    dw $003C,$0078,$001E,$003C,$001E,$003C,$001E,$001E 

Phantoon_Figure8_SubAcceleration_SlowStage:
    dw $0600 

Phantoon_Figure8_Acceleration_SlowStage:
    dw $0000 

Phantoon_Figure8_SubAcceleration_FastStages:
    dw $1000 

Phantoon_Figure8_Acceleration_FastStages:
    dw $0000 

Phantoon_Figure8_SpeedCaps_Stage0Max:
    dw $0002 

Phantoon_Figure8_SpeedCaps_Stage1Max:
    dw $0007 

Phantoon_Figure8_SpeedCaps_Stage2Min:
    dw $0000 

Phantoon_ReverseFigure8_SubAcceleration_SlowStage:
    dw $0600 

Phantoon_ReverseFigure8_Acceleration_SlowStage:
    dw $0000 

Phantoon_ReverseFigure8_SubAcceleration_FastStages:
    dw $1000 

Phantoon_ReverseFigure8_Acceleration_FastStages:
    dw $0000 

Phantoon_ReverseFigure8_SpeedCaps_Stage0Max:
    dw $FFFE 

Phantoon_ReverseFigure8_SpeedCaps_Stage1Max:
    dw $FFF9 

Phantoon_ReverseFigure8_SpeedCaps_Stage2Min:
    dw $0000 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Phantoon_A7CD8F:
    dw $8000,$0000,$000B,$8000,$0000,$FFF5 
endif ; !FEATURE_KEEP_UNREFERENCED

WavyPhantoonConstants_Intro_amplitudeDelta:
    dw $0040 

WavyPhantoonConstants_Intro_maxAmplitude:
    dw $0C00 

WavyPhantoonConstants_Dying_amplitudeDelta:
    dw $0100 

WavyPhantoonConstants_Dying_maxAmplitude:
    dw $F000 

WavyPhantoonConstants_phaseDelta:
    dw $0008 

Phantoon_Unknown0FEAValues_A7CDA5:
    db $06,$06,$08,$08,$06,$08,$06,$08 

Phantoon_FlameRain_PositionTable_index:
    dw $0001 

Phantoon_FlameRain_PositionTable_XPosition:
    dw $0080 

Phantoon_FlameRain_PositionTable_YPosition:
    dw $0060,$0000,$0047,$00A8,$0040,$0000,$0088,$00D0 
    dw $0060,$0000,$00C9,$00A8,$0080,$0000,$0001,$0080 
    dw $0060,$0000,$014E,$0058,$0040,$0000,$018F,$0030 
    dw $0060,$0000,$01D1,$0058,$0080,$0000 

Phantoon_MaterializationSFX:
    dw $0079,$007A,$007B 

InitAI_PhantoonBody:
    LDX.W #$0FFE 
    LDA.W #$0338 

.loopBG2Tilemap:
    STA.L $7E2000,X 
    DEX #2
    BPL .loopBG2Tilemap 
    LDX.W #$07FE 
    LDA.W #$0000 

.loop9000:
    STA.L $7E9000,X 
    DEX #2
    BPL .loop9000 
    LDX.W #$001E 
    LDA.W #$0000 

.loopBGPalette:
    STA.L $7EC2E0,X 
    DEX #2
    BPL .loopBGPalette 
    LDA.W #$0360 : STA.L $00179A 
    JSL.L DisableMinimap_MarkBossRoomTilesExplored 
    LDX.W $0E54 
    LDA.W #$0078 : STA.W $0FB0,X 
    STZ.W $0FA8,X 
    STZ.W $0FAA,X 
    LDA.W #$0000 : STA.L $7E9032 
    STZ.W $0FF4 
    STZ.W $0FF6 
    LDA.W $0F86 : ORA.W #$0400 : STA.W $0F86 
    JSL.L Spawn_HDMAObject 
    db $01,$14 
    dw HDMAObjectInstList_Phantoon_SemiTransparency 

InitAI_Phantoon_Eye_Tentacles_Mouth:
    LDX.W $0E54 
    LDA.W #Spritemap_CommonA7_Nothing : STA.W $0F8E,X 
    LDA.W #$0001 : STA.W $0F94,X 
    STZ.W $0F90,X 
    LDA.W $0F96 : STA.W $0F96,X 
    LDA.W $0F98 : STA.W $0F98,X 
    LDA.W $0FB6,X 
    ASL A 
    TAY 
    LDA.W .instListPointers,Y : STA.W $0F92,X 
    LDA.W #Function_Phantoon_FightIntro_SpawnCircleOfFlames : STA.W $0FB2,X 
    STZ.W $1074 
    LDA.W #$FFFF : STA.W $106C 
    RTL 


.instListPointers:
    dw InstList_Phantoon_Body_Invulnerable 
    dw InstList_Phantoon_Eye_Closed 
    dw InstList_Phantoon_Tentacles 
    dw InstList_Phantoon_Mouth_Initial 

HDMAObjectInstList_Phantoon_SemiTransparency:
    dw Instruction_HDMAObject_HDMATableBank 
    db $A7 
    dw $0001 
    dw EmptyHDMATable 
    dw Instruction_HDMAObject_PreInstructionInY 
    dl PreInstruction_PhantoonSemiTransparency 
    dw Instruction_HDMAObject_Sleep 
    dw Instruction_HDMAObject_Delete 

MainAI_Phantoon:
    LDX.W $0E54 
    JSR.W Phantoon_BrokenNothingness 
    PEA.W .manualReturn-1 
    JMP.W ($0FB2,X) 


.manualReturn:
    TXA 
    BNE .return 
    LDA.W $0F7A,X : STA.W $0FBA,X 
    STA.W $0FFA,X 
    STA.W $103A,X 
    LDA.W $0F7E,X : STA.W $0FBE,X 
    STA.W $0FFE,X 
    STA.W $103E,X 
    LDA.W $0FF4 : BNE .return 
    LDA.W $0911 : SEC : SBC.W $0F7A,X : SEC : SBC.W #$FFD8 : STA.B $B5 
    LDA.W $0915 : SEC : SBC.W $0F7E,X : SEC : SBC.W #$FFD8 : STA.B $B7 

.return:
    RTL 


PlayPhantoonMaterializationSFX:
    LDA.L $7E9032 
    ASL A 
    TAY 
    LDA.W Phantoon_MaterializationSFX,Y : JSL.L QueueSound_Lib2_Max6 
    LDA.L $7E9032 
    INC A 
    CMP.W #$0003 : BMI .storeIndex 
    LDA.W #$0000 

.storeIndex:
    STA.L $7E9032 
    RTS 


Phantoon_BrokenNothingness:
    TXA 
    BNE .return 
    LDA.B $8F : BIT.W #$4000 
    BEQ .return 
    LDA.W $9030,X : BNE .nonZero 
    LDA.W #$0001 : STA.W $9030,X 
    BRA .return 


.nonZero:
    STZ.W $9030,X 

.return:
    RTS 


GrowShrinkPhantoonWaveAmplitude:
    LDA.W $1070 : BNE .shrinking 
    LDA.B $14 : AND.W #$FF00 
    XBA 
    STA.B $16 
    LDA.W $106E : CLC : ADC.B $12 : STA.W $106E 
    AND.W #$FF00 
    XBA 
    CMP.B $16 : BMI .returnNotCompletedCycle 
    LDA.B $14 : STA.W $106E 
    BRA .returnNotCompletedCycle 


.shrinking:
    LDA.W $106E : SEC : SBC.B $12 : STA.W $106E 
    BCS .returnNotCompletedCycle 
    STZ.W $106E 
    SEC 
    RTS 


.returnNotCompletedCycle:
    CLC 
    RTS 


SpawnCasualFlame:
    LDA.W #$0000 
    LDY.W #EnemyProjectile_PhantoonDestroyableFlames 
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    LDA.W #$001D : JSL.L QueueSound_Lib3_Max6 
    RTS 


PhantoonMaterializationFlameSpiral:
    LDY.W #$0007 

.loop:
    PHY 
    TYA 
    ORA.W #$0600 
    LDY.W #EnemyProjectile_PhantoonDestroyableFlames 
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    PLY 
    DEY 
    BPL .loop 
    LDA.W #$0028 : JSL.L QueueSound_Lib3_Max6 
    RTS 


SpawnFlameRainProjectiles:
    TAY 
    LDA.W .firstFlamePositions,Y : AND.W #$00FF 
    TAY 
    LDA.W #$0007 : STA.B $12 
    LDA.W #$0010 : STA.B $14 

.loop:
    TYA 
    ORA.W #$0400 
    ORA.B $14 
    PHY 
    LDY.W #EnemyProjectile_PhantoonDestroyableFlames 
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    PLY 
    INY 
    CPY.W #$0009 
    BMI + 
    LDY.W #$0000 

  + LDA.B $14 : CLC : ADC.W #$0010 : STA.B $14 
    DEC.B $12 
    BPL .loop 
    RTS 


.firstFlamePositions:
    db $05,$07,$00,$07,$05,$03,$01,$03 

HandleCasualFlames:
    DEC.W $106A,X 
    BEQ .timerExpired 
    BPL .return 

.timerExpired:
    LDA.W $106C,X : BPL .positiveIndex 
    JSL.L GenerateRandomNumber 
    AND.W #$0003 
    STA.W $1068,X 
    ASL A 
    TAY 
    LDA.W CasualFlameTimers_pointers,Y 
    TAY 
    LDA.W $0000,Y : STA.W $106C,X 
    ASL A 
    STA.B $12 
    TYA 
    CLC : ADC.B $12 : TAY 
    LDA.W $0002,Y : STA.W $106A,X 
    BRA .return 


.positiveIndex:
    DEC.W $106C,X 
    BEQ .indexReachedZero 
    BPL .nonZeroTimer 

.indexReachedZero:
    LDA.W #$FFFF : STA.W $106C,X 
    LDA.W $1068,X 
    ASL A 
    TAY 
    LDA.W CasualFlameTimers_pointers,Y 
    TAY 
    LDA.W $0002,Y : STA.W $106A,X 
    BRA + 


.nonZeroTimer:
    LDA.W $106C,X 
    ASL A 
    STA.B $12 
    LDA.W $1068,X 
    ASL A 
    TAY 
    LDA.W CasualFlameTimers_pointers,Y : CLC : ADC.B $12 : TAY 
    LDA.W $0002,Y : STA.W $106A,X 

  + LDA.W #$0001 : STA.W $1054,X 
    LDA.W #InstList_Phantoon_Mouth_SpawnFlame : STA.W $1052,X 

.return:
    RTS 


SetupEyeOpenPhantoonState:
    STZ.W $1028 
    LDA.W #$0001 : STA.W $0F94 
    STA.W $0FD4 
    LDA.W #InstList_Phantoon_Body_EyeHitboxOnly : STA.W $0F92 
    LDA.W #InstList_Phantoon_Eyeball_Centered : STA.W $0FD2 
    LDA.W $0F86 : AND.W #$FBFF : STA.W $0F86 
    JSL.L GenerateRandomNumber 
    AND.W #$0007 
    ASL A 
    TAY 
    LDA.W Phantoon_Figure8_VulnerableWindowTimers,Y : STA.W $0FB0 
    LDA.W #Function_Phantoon_Figure8_VulnerableWindow : STA.W $0FB2 
    RTS 


PickNewPhantoonPattern:
    LDA.W #$003C : STA.W $0FB0 
    JSL.L GenerateRandomNumber 
    AND.W #$0007 
    ASL A 
    TAY 
    LDA.W Phantoon_EyeClosedTimers,Y : STA.W $0FE8 
    LDA.W $05B6 : BIT.W #$0001 
    BNE .reversed 
    LDA.W $0FEC : BEQ + 
    LDA.W $0FA8 
    INC A 
    STA.W $0FA8 
    CMP.W #$0216 : BMI + 
    STZ.W $0FA8 

  + LDA.W #$0001 : STA.W $0FAC 
    STZ.W $0FAA 
    STZ.W $0FAE 
    STZ.W $0FEC 
    BRA .merge 


.reversed:
    LDA.W $0FEC : BNE + 
    LDA.W $0FA8 
    DEC A 
    STA.W $0FA8 
    BPL + 
    LDA.W #$0215 : STA.W $0FA8 

  + STZ.W $0FAC 
    STZ.W $0FAA 
    STZ.W $0FAE 
    LDA.W #$0001 : STA.W $0FEC 

.merge:
    LDA.W $0FB6 : BNE + 
    LDA.W #Function_Phantoon_Figure8_Moving : STA.W $0FB2 
    RTS 


  + STZ.W $0FF2 
    LDA.W #Function_Phantoon_FlameRain_InitialFlameRain : STA.W $0FB2 
    RTS 


AdjustSpeedAndMovePhantoonInFigure8:
    LDA.W $0FEC : BNE .reversed 
    JSR.W UpdateFigure8PhantoonSpeed 
    LDY.W #PhantoonMovementData 
    LDA.W #$0216 : STA.B $14 
    JSR.W MovePhantoonInFigure8 
    RTS 


.reversed:
    JSR.W UpdateReversedFigure8PhantoonSpeed 
    LDY.W #PhantoonMovementData 
    LDA.W #$0215 : STA.B $14 
    JSR.W MovePhantoonInReverseFigure8 
    RTS 


UpdateFigure8PhantoonSpeed:
    LDA.W $0FAE : BEQ .stage0 
    BIT.W #$0001 
    BNE .stage1 
    BRA .stage2 


.stage0:
    LDA.W $0FAA : CLC : ADC.W Phantoon_Figure8_SubAcceleration_SlowStage : STA.W $0FAA 
    LDA.W $0FAC : ADC.W Phantoon_Figure8_Acceleration_SlowStage : STA.W $0FAC 
    CMP.W Phantoon_Figure8_SpeedCaps_Stage0Max : BMI ..return 
    LDA.W Phantoon_Figure8_SpeedCaps_Stage0Max 
    DEC A 
    STA.W $0FAC 
    STZ.W $0FAA 
    INC.W $0FAE 

..return:
    RTS 


.stage1:
    LDA.W $0FAA : CLC : ADC.W Phantoon_Figure8_SubAcceleration_FastStages : STA.W $0FAA 
    LDA.W $0FAC : ADC.W Phantoon_Figure8_Acceleration_FastStages : STA.W $0FAC 
    CMP.W Phantoon_Figure8_SpeedCaps_Stage1Max : BMI ..return 
    LDA.W Phantoon_Figure8_SpeedCaps_Stage1Max : STA.W $0FAC 
    STZ.W $0FAA 
    INC.W $0FAE 

..return:
    RTS 


.stage2:
    LDA.W $0FAA : SEC : SBC.W Phantoon_Figure8_SubAcceleration_FastStages : STA.W $0FAA 
    LDA.W $0FAC : SBC.W Phantoon_Figure8_Acceleration_FastStages : STA.W $0FAC 
    CMP.W Phantoon_Figure8_SpeedCaps_Stage2Min : BEQ .negativeSpeed 
    BPL .return 

.negativeSpeed:
    LDA.W Phantoon_Figure8_SpeedCaps_Stage2Min 
    INC A 
    STA.W $0FAC 
    STZ.W $0FAA 
    STZ.W $0FAE 

.return:
    RTS 


UpdateReversedFigure8PhantoonSpeed:
    LDA.W $0FAE : BEQ .stage0 
    BIT.W #$0001 
    BNE .stage1 
    BRA .stage2 


.stage0:
    LDA.W $0FAA : SEC : SBC.W Phantoon_ReverseFigure8_SubAcceleration_SlowStage : STA.W $0FAA 
    LDA.W $0FAC : SBC.W Phantoon_ReverseFigure8_Acceleration_SlowStage : STA.W $0FAC 
    CMP.W Phantoon_ReverseFigure8_SpeedCaps_Stage0Max : BEQ + 
    BPL .stage0_return 

  + LDA.W Phantoon_ReverseFigure8_SpeedCaps_Stage0Max 
    INC #2
    STA.W $0FAC 
    STZ.W $0FAA 
    INC.W $0FAE 

.stage0_return:
    RTS 


.stage1:
    LDA.W $0FAA : SEC : SBC.W Phantoon_ReverseFigure8_SubAcceleration_FastStages : STA.W $0FAA 
    LDA.W $0FAC : SBC.W Phantoon_ReverseFigure8_Acceleration_FastStages : STA.W $0FAC 
    CMP.W Phantoon_ReverseFigure8_SpeedCaps_Stage1Max : BEQ + 
    BPL .stage1_return 

  + LDA.W Phantoon_ReverseFigure8_SpeedCaps_Stage1Max 
    INC A 
    STA.W $0FAC 
    STZ.W $0FAA 
    INC.W $0FAE 

.stage1_return:
    RTS 


.stage2:
    LDA.W $0FAA : CLC : ADC.W Phantoon_ReverseFigure8_SubAcceleration_FastStages : STA.W $0FAA 
    LDA.W $0FAC : ADC.W Phantoon_ReverseFigure8_Acceleration_FastStages : STA.W $0FAC 
    CMP.W Phantoon_ReverseFigure8_SpeedCaps_Stage2Min : BMI ..return 
    LDA.W Phantoon_ReverseFigure8_SpeedCaps_Stage2Min : STA.W $0FAC 
    STZ.W $0FAA 
    STZ.W $0FAE 

..return:
    RTS 


MovePhantoonInFigure8:
    LDA.W $0FAC : STA.B $16 
    BNE .loop 
    RTS 


.loop:
    PHY 
    LDA.W $0FA8 
    ASL A 
    STA.B $12 
    TYA 
    CLC : ADC.B $12 : TAY 
    LDA.W $0000,Y : AND.W #$00FF 
    BIT.W #$0080 
    BEQ + 
    ORA.W #$FF00 

  + STA.B $12 
    LDA.W $0F7A : CLC : ADC.B $12 : STA.W $0F7A 
    LDA.W $0001,Y : AND.W #$00FF 
    BIT.W #$0080 
    BEQ + 
    ORA.W #$FF00 

  + STA.B $12 
    LDA.W $0F7E : CLC : ADC.B $12 : STA.W $0F7E 
    LDA.W $0FA8 
    INC A 
    STA.W $0FA8 
    CMP.B $14 : BMI + 
    STZ.W $0FA8 

  + PLY 
    DEC.B $16 
    BEQ .return 
    BRA .loop 


.return:
    RTS 


MovePhantoonInReverseFigure8:
    LDA.W $0FAC 
    EOR.W #$FFFF 
    INC A 
    STA.B $16 
    BNE .loop 
    RTS 


.loop:
    PHY 
    LDA.W $0FA8 
    ASL A 
    STA.B $12 
    TYA 
    CLC : ADC.B $12 : TAY 
    LDA.W $0000,Y : AND.W #$00FF 
    BIT.W #$0080 
    BEQ + 
    ORA.W #$FF00 

  + STA.B $12 
    LDA.W $0F7A : SEC : SBC.B $12 : STA.W $0F7A 
    LDA.W $0001,Y : AND.W #$00FF 
    BIT.W #$0080 
    BEQ + 
    ORA.W #$FF00 

  + STA.B $12 
    LDA.W $0F7E : SEC : SBC.B $12 : STA.W $0F7E 
    LDA.W $0FA8 
    DEC A 
    STA.W $0FA8 
    BPL + 
    LDA.B $14 : STA.W $0FA8 

  + PLY 
    DEC.B $16 
    BEQ .return 
    BRA .loop 


.return:
    RTS 


MovePhantoonInSwoopingPattern:
    LDA.W $1030 : BMI .targetXNegative 
    CLC : ADC.W #$0002 : STA.W $1030 
    CMP.W #$0100 : BMI .targetCalculated 
    ORA.W #$8000 
    STA.W $1030 
    AND.W #$7FFF 
    BRA .targetCalculated 


.targetXNegative:
    SEC : SBC.W #$0002 : STA.W $1030 
    AND.W #$7FFF 
    BEQ + 
    BPL .targetCalculated 

  + LDA.W #$0000 : STA.W $1030 

.targetCalculated:
    CMP.W $0F7A : BMI .lessThanX 
    LDA.W $102C : CMP.W #$0800 : BPL + 
    CLC : ADC.W #$0020 : STA.W $102C 
    BRA + 


.lessThanX:
    LDA.W $102C : CMP.W #$F801 : BMI + 
    SEC : SBC.W #$0020 : STA.W $102C 

  + LDA.W $102C 
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
    LDA.W $0F7C : CLC : ADC.B $14 : STA.W $0F7C 
    LDA.W $0F7A : ADC.B $12 : STA.W $0F7A 
    CMP.W #$FFC0 : BPL + 
    LDA.W #$FFC0 : STA.W $0F7A 
    BRA .checkDead 


  + CMP.W #$01C0 : BMI .checkDead 
    LDA.W #$01C0 : STA.W $0F7A 

.checkDead:
    LDA.W $0FB2,X : CMP.W #Function_Phantoon_Swooping_FatalDamage : BNE .notDeathSwoop 
    LDA.W #$0070 : BRA + 


.notDeathSwoop:
    LDA.W $0AFA : SEC : SBC.W #$0030 

  + CMP.W $0F7E : BMI .lessThanY 
    LDA.W $102E : CMP.W #$0600 : BPL + 
    CLC : ADC.W #$0040 : STA.W $102E 
    BRA + 


.lessThanY:
    LDA.W $102E : CMP.W #$FA01 : BMI + 
    SEC : SBC.W #$0040 : STA.W $102E 

  + LDA.W $102E 
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
    LDA.W $0F80 : CLC : ADC.B $14 : STA.W $0F80 
    LDA.W $0F7E : ADC.B $12 : STA.W $0F7E 
    CMP.W #$0040 : BPL + 
    LDA.W #$0040 : STA.W $0F7E 
    RTS 


  + CMP.W #$00D8 : BMI .return 
    LDA.W #$00D8 : STA.W $0F7E 

.return:
    RTS 


StartPhantoonSwoopingPattern:
    LDA.W #$0400 : STA.W $102C 
    STA.W $102E 
    STZ.W $1030 
    LDA.W #Function_Phantoon_Swooping_Opaque : STA.W $0FB2,X 
    LDA.W #$0168 : STA.W $0FB0,X 
    RTS 


MakePhantoonLookTowardsSamus:
    JSL.L DetermineDirectionOfSamusFromEnemy 
    ASL A 
    TAY 
    LDA.W #$0001 : STA.W $0FD4 
    LDA.W .directionPointers,Y : STA.W $0FD2 
    RTS 


.directionPointers:
    dw InstList_Phantoon_Eyeball_LookingUp 
    dw InstList_Phantoon_Eyeball_LookingUpRight 
    dw InstList_Phantoon_Eyeball_LookingRight 
    dw InstList_Phantoon_Eyeball_LookingDownRight 
    dw InstList_Phantoon_Eyeball_LookingDown 
    dw InstList_Phantoon_Eyeball_LookingDown 
    dw InstList_Phantoon_Eyeball_LookingDownLeft 
    dw InstList_Phantoon_Eyeball_LookingLeft 
    dw InstList_Phantoon_Eyeball_LookingUpLeft 
    dw InstList_Phantoon_Eyeball_LookingUp 

StartPhantoonDeathSequence:
    PHX 
    LDA.W $0FB2,X : CMP.W #Function_Phantoon_Swooping_Opaque : BEQ .swooping 
    CMP.W #Function_Phantoon_Swooping_FadeOut : BEQ .swooping 
    LDA.W #Function_Phantoon_DeathSequence_FadingInAndOut : STA.W $0FB2,X 
    BRA + 


.swooping:
    LDA.W #Function_Phantoon_Swooping_FatalDamage : STA.W $0FB2,X 

  + STZ.W $0FEC 
    STZ.W $0FF2 
    JSR.W MakePhantoonLookTowardsSamus 
    LDX.W #$01FE 
    LDA.B $B5 

.loopBG2XScroll:
    STA.L $7E9100,X 
    DEX #2
    BPL .loopBG2XScroll 
    LDA.W $1988 : ORA.W #$4000 : STA.W $1988 
    LDA.W #$0001 : STA.W $1076 
    PLX 
    RTS 


AdvancePhantoonFadeOut_DenominatorInA:
    PHX 
    STA.B $12 
    LDA.W $05B6 : BIT.W #$0001 
    BNE .return 
    LDA.W $0FF2 : BNE .return 
    LDA.B $12 : STA.W $0FEE 
    JSR.W AdvancePhantoonFadeOut 
    BCC .return 
    LDA.W #$0001 : STA.W $0FF2 

.return:
    PLX 
    RTS 


AdvancePhantoonFadeIn_DenominatorInA:
    PHX 
    STA.B $12 
    LDA.W $05B6 : BIT.W #$0001 
    BNE .return 
    LDA.W $0FF2 : BNE .return 
    LDA.B $12 : STA.W $0FEE 
    JSR.W AdvancePhantoonFadeIn 
    BCC .return 
    LDA.W #$0001 : STA.W $0FF2 

.return:
    PLX 
    RTS 


RTS_A7D4A8:
    RTS 


Function_Phantoon_FightIntro_SpawnCircleOfFlames:
    DEC.W $0FB0,X 
    BEQ .timerExpired 
    BPL .return 

.timerExpired:
    LDA.W $0FA8 
    LDY.W #EnemyProjectile_PhantoonStartingFlames 
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    LDA.W #$001D : JSL.L QueueSound_Lib3_Max6 
    LDA.W #$001E : STA.W $0FB0,X 
    LDA.W $0FA8 
    INC A 
    STA.W $0FA8 
    CMP.W #$0008 : BMI .return 
    STZ.W $0FA8 
    STZ.W $102A,X 
    LDA.W #Function_Phantoon_FightIntro_SpinCircleOfFlames : STA.W $0FB2,X 
    LDA.W #$001E : STA.W $0FB0,X 
    JSL.L Spawn_Hardcoded_PLM 
    db $00,$06 
    dw PLMEntries_drawPhantoonsDoorDuringBossFight 

.return:
    RTS 


Function_Phantoon_FightIntro_SpinCircleOfFlames:
    DEC.W $0FB0,X 
    BEQ .timerExpired 
    BPL .return 

.timerExpired:
    LDA.W #$00F0 : STA.W $0FB0,X 
    LDA.W #$0001 : STA.W $0FAA,X 
    LDA.W #Function_Phantoon_FightIntro_StartWavyFadeIn : STA.W $0FB2,X 

.return:
    RTS 


Function_Phantoon_FightIntro_StartWavyFadeIn:
    DEC.W $0FB0,X 
    BEQ .timerExpired 
    BPL .return 

.timerExpired:
    STZ.W $0FAA,X 
    LDA.W $1988 : ORA.W #$4000 : STA.W $1988 
    LDA.W #Function_Phantoon_FightIntro_WavyFadeIn : STA.W $0FB2,X 
    LDA.W #$8001 : STA.W $1074 
    LDA.W #$0078 : STA.W $0FB0,X 
    LDA.W WavyPhantoonConstants_phaseDelta : STA.B $16 
    LDA.W #$0002 : JSL.L Spawn_WavyPhantoon_HDMAObject 
    LDA.W WavyPhantoonConstants_Intro_maxAmplitude : STA.W $106E 
    STZ.W $0FF2 
    LDA.W #$0005 : JSL.L QueueMusicDataOrTrack_8FrameDelay 

.return:
    RTS 


Function_Phantoon_FightIntro_WavyFadeIn:
    LDA.W #$000C : JSR.W AdvancePhantoonFadeIn_DenominatorInA 
    LDA.W WavyPhantoonConstants_Intro_amplitudeDelta : STA.B $12 
    LDA.W WavyPhantoonConstants_Intro_maxAmplitude : STA.B $14 
    JSR.W GrowShrinkPhantoonWaveAmplitude 
    BCS .done 
    DEC.W $0FB0,X 
    BEQ .shrinking 
    BPL .return 

.shrinking:
    LDA.W #$0001 : STA.W $1070 
    BRA .return 


.done:
    LDA.W #Function_Phantoon_FightIntro_PickFirstPattern : STA.W $0FB2,X 
    LDA.W #$0001 : STA.W $1074 
    LDA.W #$001E : STA.W $0FB0,X 

.return:
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Function_Phantoon_FightIntro_A7D581:
    LDX.W #$01FE 
    LDA.W #$0000 

.loop:
    STA.L $7E9100,X 
    DEX #2
    BPL .loop 
    LDA.W #Function_Phantoon_FightIntro_PickFirstPattern : STA.W $0FB2,X 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


Function_Phantoon_FightIntro_PickFirstPattern:
    DEC.W $0FB0,X 
    BEQ .timerExpired 
    BPL .return 

.timerExpired:
    STZ.W $0FF4 
    LDA.W #Function_Phantoon_Figure8_Moving : STA.W $0FB2,X 
    LDA.W $05B6 
    LSR A 
    AND.W #$0003 
    ASL A 
    TAY 
    LDA.W Phantoon_EyeClosedTimers,Y : STA.W $0FE8 
    JSL.L GenerateRandomNumber 
    BIT.W #$0001 
    BNE .reversed 
    LDA.W #$0001 : STA.W $0FAC 
    STZ.W $0FAA 
    STZ.W $0FAE 
    STZ.W $0FEC 
    STZ.W $0FA8 
    RTS 


.reversed:
    STZ.W $0FAC 
    STZ.W $0FAA 
    STZ.W $0FAE 
    LDA.W #$0001 : STA.W $0FEC 
    LDA.W #$0215 : STA.W $0FA8 

.return:
    RTS 


Function_Phantoon_Figure8_Moving:
    JSR.W AdjustSpeedAndMovePhantoonInFigure8 
    JSR.W HandleCasualFlames 
    DEC.W $0FE8 
    BEQ .timerExpired 
    BPL .return 

.timerExpired:
    LDA.W #RTS_A7D4A8 : STA.W $0FB2,X 
    LDA.W #$0001 : STA.W $0FD4 
    LDA.W #InstList_Phantoon_Eye_Open : STA.W $0FD2 
    STZ.W $0FB6 
    JSR.W PhantoonMaterializationFlameSpiral 

.return:
    RTS 


Function_Phantoon_Figure8_VulnerableWindow:
    DEC.W $0FB0,X 
    BEQ .timerExpired 
    BPL .waiting 

.timerExpired:
    STZ.W $102A,X 
    LDA.W $1028 : BEQ .swoopingNotTriggered 
    STZ.W $1028 
    LDA.W #$003C : STA.W $0FB0,X 
    LDA.W #Function_Phantoon_Figure8_SwoopingTriggered : STA.W $0FB2,X 
    BRA .waiting 


.swoopingNotTriggered:
    LDA.W #RTS_A7D4A8 : STA.W $0FB2,X 
    LDA.W #$0001 : STA.W $0F94 
    STA.W $0FD4 
    LDA.W #InstList_Phantoon_Body_Invulnerable : STA.W $0F92 
    LDA.W #InstList_Phantoon_Eye_Close_PickNewPattern : STA.W $0FD2 
    LDA.W $0F86 : ORA.W #$0400 : STA.W $0F86 
    LDA.W #$0001 : STA.W $0FB6 
    RTS 


.waiting:
    JSR.W MakePhantoonLookTowardsSamus 
    RTS 


Function_Phantoon_Figure8_SwoopingTriggered:
    JSR.W MakePhantoonLookTowardsSamus 
    LDA.W $1988 : AND.W #$BFFF : STA.W $1988 
    JSR.W StartPhantoonSwoopingPattern 
    LDA.W #$0001 : STA.W $0F94 
    LDA.W #InstList_Phantoon_Body_FullHitbox : STA.W $0F92 
    RTS 


Function_Phantoon_Swooping_Opaque:
    JSR.W MakePhantoonLookTowardsSamus 
    JSR.W MovePhantoonInSwoopingPattern 
    DEC.W $0FB0,X 
    BEQ .timerExpired 
    BPL .return 

.timerExpired:
    LDA.W #Function_Phantoon_Swooping_FadeOut : STA.W $0FB2,X 
    LDA.W $1988 : ORA.W #$4000 : STA.W $1988 
    LDA.W #$0001 : STA.W $0F94 
    STA.W $0FD4 
    LDA.W #InstList_Phantoon_Body_Invulnerable : STA.W $0F92 
    LDA.W #InstList_Phantoon_Eye_Close : STA.W $0FD2 
    LDA.W $0F86 : ORA.W #$0400 : STA.W $0F86 
    STZ.W $0FF2 
    STZ.W $102A,X 

.return:
    RTS 


Function_Phantoon_Swooping_FadeOut:
    JSR.W MovePhantoonInSwoopingPattern 
    LDA.W #$000C : JSR.W AdvancePhantoonFadeOut_DenominatorInA 
    LDA.W $0FF2 : BEQ .return 
    LDA.W #Function_Phantoon_HidingBeforeFigure8_Hiding : STA.W $0FB2,X 
    LDA.W #$0078 : STA.W $0FB0,X 

.return:
    RTS 


Function_Phantoon_HidingBeforeFigure8_Hiding:
    DEC.W $0FB0,X 
    BEQ .timerExpired 
    BPL .return 

.timerExpired:
    LDA.W #Function_Phantoon_HidingBeforeFigure8_PlacePhantoon : STA.W $0FB2,X 

.return:
    RTS 


Function_Phantoon_HidingBeforeFigure8_PlacePhantoon:
    JSL.L GenerateRandomNumber 
    BIT.W #$0001 
    BEQ .leftSidePattern 
    LDA.W #$0088 : STA.W $0FA8 
    LDA.W #$00D0 : STA.W $0F7A 
    LDA.W #$0060 : STA.W $0F7E 
    BRA + 


.leftSidePattern:
    LDA.W #$018F : STA.W $0FA8 
    LDA.W #$0030 : STA.W $0F7A 
    LDA.W #$0060 : STA.W $0F7E 

  + STZ.W $0FEC 
    LDA.W #$0001 : STA.W $0FAC 
    STZ.W $0FAA 
    STZ.W $0FB6 
    JSR.W PickNewPhantoonPattern 
    LDA.W #Function_Phantoon_HidingBeforeFigure8_FadingIn : STA.W $0FB2,X 
    STZ.W $0FF2 
    RTS 


Function_Phantoon_HidingBeforeFigure8_FadingIn:
    LDA.W #$000C : JSR.W AdvancePhantoonFadeIn_DenominatorInA 
    LDA.W $0FF2 : BEQ .return 
    LDA.W #Function_Phantoon_Figure8_Moving : STA.W $0FB2 

.return:
    RTS 


Function_Phantoon_FlameRain_ShowPhantoon:
    STZ.W $0FF2 
    LDA.W $1988 : AND.W #$BFFF : STA.W $1988 
    LDA.W #$0001 : STA.W $0F94 
    STA.W $0FD4 
    LDA.W #InstList_Phantoon_Body_FullHitbox : STA.W $0F92 
    LDA.W #InstList_Phantoon_Eyeball_Centered : STA.W $0FD2 
    LDA.W #Function_Phantoon_FlameRain_MakePhantoonVulnerable : STA.W $0FB2,X 
    RTS 


Function_Phantoon_FlameRain_MakePhantoonVulnerable:
    LDA.W #$0001 : JSR.W AdvancePhantoonFadeIn_DenominatorInA 
    LDA.W $0FF2 : BEQ .return 
    LDA.W $0F86 : AND.W #$FBFF : STA.W $0F86 
    LDA.W #Function_Phantoon_FlameRain_VulnerableWindow : STA.W $0FB2,X 
    LDA.W #$005A : STA.W $0FB0 

.return:
    RTS 


Function_Phantoon_FlameRain_VulnerableWindow:
    DEC.W $0FB0,X 
    BEQ .timerExpired 
    BPL .return 

.timerExpired:
    STZ.W $102A,X 
    LDA.W $1028 : BEQ .endVulnerableWindow 
    STZ.W $1028 
    LDA.W #$0001 : STA.W $0FB6 
    JSR.W StartPhantoonSwoopingPattern 
    RTS 


.endVulnerableWindow:
    LDA.W #Function_Phantoon_FlameRain_FadingOut : STA.W $0FB2,X 
    STZ.W $0FF2 
    LDA.W #$0001 : STA.W $0F94 
    STA.W $0FD4 
    LDA.W #InstList_Phantoon_Body_Invulnerable : STA.W $0F92 
    LDA.W #InstList_Phantoon_Eye_Close : STA.W $0FD2 
    LDA.W $0F86 : ORA.W #$0400 : STA.W $0F86 
    LDA.W $1988 : ORA.W #$4000 : STA.W $1988 

.return:
    RTS 


Function_Phantoon_FlameRain_FadingOut:
    LDA.W #$000C : JSR.W AdvancePhantoonFadeOut_DenominatorInA 
    LDA.W $0FF2 : BNE .fadeComplete 
    RTS 


.fadeComplete:
    LDA.W #Function_Phantoon_FlameRain_SubsequentFlameRain : STA.W $0FB2,X 
    JSL.L GenerateRandomNumber 
    AND.W #$0007 
    ASL A 
    TAY 
    LDA.W Phantoon_FlameRain_HidingTimers,Y : STA.W $0FB0,X 
    RTS 


Function_Phantoon_FlameRain_SubsequentFlameRain:
    DEC.W $0FB0,X 
    BEQ .timerExpired 
    BPL .return 

.timerExpired:
    JSL.L GenerateRandomNumber 
    AND.W #$0007 
    PHA 
    ASL #3
    TAY 
    LDA.W Phantoon_FlameRain_PositionTable_index,Y : STA.W $0FA8 
    LDA.W Phantoon_FlameRain_PositionTable_XPosition,Y : STA.W $0F7A 
    LDA.W Phantoon_FlameRain_PositionTable_YPosition,Y : STA.W $0F7E 
    STZ.W $0FEC 
    LDA.W #Function_Phantoon_FlameRain_ShowPhantoon : STA.W $0FB2,X 
    PLA 
    JSR.W SpawnFlameRainProjectiles 

.return:
    RTS 


Function_Phantoon_FlameRain_InitialFlameRain:
    LDA.W #$000C : JSR.W AdvancePhantoonFadeOut_DenominatorInA 
    JSR.W AdjustSpeedAndMovePhantoonInFigure8 
    JSR.W HandleCasualFlames 
    DEC.W $0FE8 
    BEQ .timerExpired 
    BPL .return 

.timerExpired:
    STZ.W $1028 
    LDA.W #Function_Phantoon_FlameRain_ShowPhantoon : STA.W $0FB2,X 
    LDA.W $0F7A : CMP.W #$0080 : BMI .pattern0 
    LDA.W #$0002 : JSR.W SpawnFlameRainProjectiles 
    RTS 


.pattern0:
    LDA.W #$0000 : JSR.W SpawnFlameRainProjectiles 

.return:
    RTS 


Function_Phantoon_Enraged_FadingOutBeforeRage:
    LDA.W #$000C : JSR.W AdvancePhantoonFadeOut_DenominatorInA 
    LDA.W $0FF2 : BEQ .return 
    LDA.W #Function_Phantoon_Enraged_Hiding : STA.W $0FB2,X 
    LDA.W #$0078 : STA.W $0FB0,X 

.return:
    RTS 


Function_Phantoon_Enraged_Hiding:
    DEC.W $0FB0,X 
    BEQ .timerExpired 
    BPL .return 

.timerExpired:
    LDA.W #Function_Phantoon_Enraged_FadingIn : STA.W $0FB2,X 
    LDA.W #$0080 : STA.W $0F7A 
    LDA.W #$0020 : STA.W $0F7E 
    STZ.W $0FF2 

.return:
    RTS 


Function_Phantoon_Enraged_FadingIn:
    LDA.W #$000C : JSR.W AdvancePhantoonFadeIn_DenominatorInA 
    LDA.W $0FF2 : BEQ .return 
    LDA.W #Function_Phantoon_Enraged_Rage : STA.W $0FB2 
    LDA.W #$0004 : STA.W $0FB0,X 
    STZ.W $0FF2 

.return:
    RTS 


Function_Phantoon_Enraged_Rage:
    DEC.W $0FB0,X 
    BEQ .timerExpired 
    BPL .return 

.timerExpired:
    LDA.W $0FF2 : BIT.W #$0001 
    BNE .oddWave 
    LDY.W #$0006 

.loopEvenWave:
    PHY 
    TYA 
    ORA.W #$0200 
    LDY.W #EnemyProjectile_PhantoonDestroyableFlames 
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    PLY 
    DEY 
    BPL .loopEvenWave 
    BRA .merge 


.oddWave:
    LDY.W #$000F 

.loopOddWave:
    PHY 
    TYA 
    ORA.W #$0200 
    LDY.W #EnemyProjectile_PhantoonDestroyableFlames 
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    PLY 
    DEY 
    CPY.W #$0008 
    BPL .loopOddWave 

.merge:
    LDA.W #$0029 : JSL.L QueueSound_Lib3_Max6 
    LDA.W $0FF2 
    INC A 
    STA.W $0FF2 
    CMP.W #$0008 : BPL .doneRaging 
    LDA.W #$0080 : STA.W $0FB0,X 
    RTS 


.doneRaging:
    LDA.W #$0001 : STA.W $0FD4 
    LDA.W #InstList_Phantoon_Eye_Close : STA.W $0FD2 
    STZ.W $0FF2 
    LDA.W #Function_Phantoon_Enraged_FadingOutAfterRage : STA.W $0FB2,X 

.return:
    RTS 


Function_Phantoon_Enraged_FadingOutAfterRage:
    LDA.W #$000C : JSR.W AdvancePhantoonFadeOut_DenominatorInA 
    LDA.W $0FF2 : BEQ .return 
    LDA.W #Function_Phantoon_HidingBeforeFigure8_Hiding : STA.W $0FB2,X 
    LDA.W #$0078 : STA.W $0FB0,X 

.return:
    RTS 


Function_Phantoon_Swooping_FatalDamage:
    JSR.W MakePhantoonLookTowardsSamus 
    JSR.W MovePhantoonInSwoopingPattern 
    LDA.W $0F7A : CMP.W #$0060 : BMI .return 
    CMP.W #$00A0 : BPL .return 
    LDA.W #Function_Phantoon_DeathSequence_FadingInAndOut : STA.W $0FB2,X 

.return:
    RTS 


Function_Phantoon_DeathSequence_FadingInAndOut:
    NOP 
    LDA.W $0FEC : BIT.W #$0001 
    BNE .advanceFade 
    LDA.W #$000C : JSR.W AdvancePhantoonFadeOut_DenominatorInA 
    LDA.W $0FF2 : BNE .fadeComplete 
    BRA .return 


.advanceFade:
    LDA.W #$000C : JSR.W AdvancePhantoonFadeIn_DenominatorInA 
    LDA.W $0FF2 : BEQ .return 

.fadeComplete:
    STZ.W $0FF2 
    LDA.W $0FEC 
    INC A 
    STA.W $0FEC 
    CMP.W #$000A : BMI .return 
    LDA.W #Function_Phantoon_DeathSequence_Exploding : STA.W $0FB2,X 
    LDA.W #$000F : STA.W $0FB0,X 
    STZ.W $1032 
    STZ.W $0FA8 

.return:
    RTS 


Function_Phantoon_DeathSequence_Exploding:
    DEC.W $0FB0,X 
    BEQ .timerExpired 
    BMI .timerExpired 
    RTS 


.timerExpired:
    LDA.W $1032 
    ASL #2
    TAY 
    LDA.W .XOffset,Y : AND.W #$00FF 
    BIT.W #$0080 
    BEQ + 
    ORA.W #$FF00 

  + STA.B $12 
    LDA.W $0F7A : CLC : ADC.B $12 : STA.B $12 
    LDA.W .YOffset,Y : AND.W #$00FF 
    BIT.W #$0080 
    BEQ + 
    ORA.W #$FF00 

  + STA.B $14 
    LDA.W $0F7E : CLC : ADC.B $14 : STA.B $14 
    PHY 
    LDA.W .explosionType,Y : AND.W #$00FF 
    PHA 
    LDY.W #EnemyProjectile_MiscDust 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    PLA 
    CMP.W #$001D : BNE .PhantoonExplosion 
    LDA.W #$0024 : JSL.L QueueSound_Lib2_Max6 
    BRA + 


.PhantoonExplosion:
    LDA.W #$002B : JSL.L QueueSound_Lib2_Max6 

  + PLY 
    LDA.W .timer,Y : AND.W #$00FF : STA.W $0FB0,X 
    LDA.W $1032 
    INC A 
    STA.W $1032 
    CMP.W #$000D : BMI .return 
    LDA.W #$0005 : STA.W $1032 
    LDA.W $0FA8 
    INC A 
    STA.W $0FA8 
    CMP.W #$0003 : BMI .return 
    LDA.W #Function_Phantoon_DeathSequence_SetupWavyMosaicPhantoon : STA.W $0FB2,X 

.return:
    RTS 


.XOffset:
    db $00 

.YOffset:
    db $00 

.explosionType:
    db $1D 

.timer:
    db $10,$20,$E0,$1D,$10,$E0,$20,$1D,$10,$E0,$E0,$1D,$10,$20,$20,$1D 
    db $20,$E0,$F8,$1D,$08,$00,$00,$03,$08,$20,$F8,$1D,$08,$00,$00,$03 
    db $08,$00,$18,$03,$08,$00,$30,$1D,$08,$E8,$18,$03,$08,$18,$18,$03 
    db $08 

Function_Phantoon_DeathSequence_SetupWavyMosaicPhantoon:
    LDA.W WavyPhantoonConstants_phaseDelta : STA.B $16 
    LDA.W #$0001 : JSL.L Spawn_WavyPhantoon_HDMAObject 
    STZ.W $106E 
    LDA.W #Function_Phantoon_DeathSequence_WavyMosaicPhantoon : STA.W $0FB2,X 
    LDA.W #$0002 : STA.W $0FEC 
    LDA.W $0F86 : AND.W #$DFFF 
    ORA.W #$0500 
    STA.W $0FC6 
    STA.W $1006 
    STA.W $1046 
    LDA.W #$007E : JSL.L QueueSound_Lib2_Max6 
    RTS 


Function_Phantoon_DeathSequence_WavyMosaicPhantoon:
    LDA.W WavyPhantoonConstants_Dying_amplitudeDelta : STA.B $12 
    LDA.W WavyPhantoonConstants_Dying_maxAmplitude : STA.B $14 
    JSR.W GrowShrinkPhantoonWaveAmplitude 
    LDA.W $0FEC : CMP.W #$FFFF : BEQ .doneMosaic 
    LDA.W $05B6 : BIT.W #$000F 
    BNE .return 
    SEP #$20 
    LDA.W $0FEC : CMP.B #$F2 : BEQ .mosaicF2 
    CLC : ADC.B #$10 : STA.W $0FEC 
    STA.B $57 
    REP #$20 
    BRA .return 


.mosaicF2:
    REP #$20 
    LDA.W #$FFFF : STA.W $0FEC 
    STZ.W $0FF2 
    BRA .return 


.doneMosaic:
    LDA.W #$000C : JSR.W AdvancePhantoonFadeOut_DenominatorInA 
    LDA.W $0FF2 : BEQ .return 
    LDA.W #Function_Phantoon_DeathSequence_ClearGraphics : STA.W $0FB2,X 

.return:
    RTS 


Function_Phantoon_DeathSequence_ClearGraphics:
    SEP #$20 
    STZ.B $57 
    REP #$20 
    STZ.W $0FF4 
    LDA.W $1988 : AND.W #$BFFF : STA.W $1988 
    LDA.W #$FFFF : STA.W $1074 
    LDA.W #Function_Phantoon_DeathSequence_ActivateWreckedShip : STA.W $0FB2,X 
    LDA.W #$003C : STA.W $0FB0,X 
    STZ.W $0FF2 
    LDA.W #$0180 : STA.W $0F7A 
    LDA.W #$0080 : STA.W $0F7E 
    LDX.W #$03FE 
    LDA.W #$0338 

.loop:
    STA.L $7E2000,X 
    DEX #2
    BPL .loop 
    LDX.W $0330 
    LDA.W #$0400 : STA.B $D0,X 
    INX #2
    LDA.W #$2000 : STA.B $D0,X 
    INX #2
    SEP #$20 
    LDA.B #$7E : STA.B $D0,X 
    REP #$20 
    INX 
    LDA.W #$4800 : STA.B $D0,X 
    INX #2
    STX.W $0330 
    RTS 


Function_Phantoon_DeathSequence_ActivateWreckedShip:
    PHX 
    LDA.W $0FB0,X : BEQ .timerExpired 
    DEC.W $0FB0,X 
    PLX 
    RTS 


.timerExpired:
    LDA.W $05B6 : BIT.W #$0003 
    BNE .return 
    LDA.W #$000C : STA.W $0FEE 
    JSR.W AdvanceWreckedShipPowerOnPaletteTransition 
    BCC .return 
    SEP #$20 
    LDA.B $69 : ORA.B #$02 : STA.B $69 
    REP #$20 
    JSL.L PhantoonDeathItemDropRoutine 
    LDA.W $0F86 : ORA.W #$0200 : STA.W $0F86 
    STA.W $0FC6 
    STA.W $1006 
    STA.W $1046 
    LDX.W $079F 
    LDA.L $7ED828,X : ORA.W #$0001 : STA.L $7ED828,X 
    JSL.L Spawn_Hardcoded_PLM 
    db $00,$06 
    dw PLMEntries_restorePhantoonsDoorDuringBossFight 
    LDA.W #$0003 : JSL.L QueueMusicDataOrTrack_8FrameDelay 

.return:
    PLX 
    RTS 


AdvancePhantoonFadeOut:
    REP #$30 
    LDA.W $0FEE 
    INC A 
    CMP.W $0FF0 : BCS .advance 
    LDA.W #$0000 : STA.W $0FF0 
    SEC 
    RTS 


.advance:
    LDX.W #$0000 

.loop:
    PHX 
    LDA.W Palette_Phantoon_FadeOutTarget,X 
    TAY 
    LDA.L $7EC0E0,X 
    TAX 
    LDA.W $0FF0 : JSR.W CalculateAthTransitionalColorFromXToY 
    PLX 
    STA.L $7EC0E0,X 
    INX #2
    CPX.W #$0020 
    BCC .loop 
    LDA.W $0FF0 
    INC A 
    STA.W $0FF0 
    CLC 
    RTS 


AdvancePhantoonFadeIn:
    REP #$30 
    LDA.W $0FEE 
    INC A 
    CMP.W $0FF0 : BCS .advance 
    LDA.W #$0000 : STA.W $0FF0 
    SEC 
    RTS 


.advance:
    LDX.W #$0000 

.loop:
    PHX 
    JSR.W GetPhantoonHealthBasedPaletteColor 
    LDA.L $7EC0E0,X 
    TAX 
    LDA.W $0FF0 : JSR.W CalculateAthTransitionalColorFromXToY 
    PLX 
    STA.L $7EC0E0,X 
    INX #2
    CPX.W #$0020 
    BCC .loop 
    LDA.W $0FF0 
    INC A 
    STA.W $0FF0 
    CLC 
    RTS 


GetPhantoonHealthBasedPaletteColor:
    STX.B $18 
    LDX.W $0E54 
    LDA.W #$09C4 
    LSR #3
    STA.B $12 
    STA.B $14 
    STZ.B $16 

.loop:
    LDA.B $14 : CMP.W $0F8C,X : BPL .getPointer 
    LDA.B $14 : CLC : ADC.B $12 : STA.B $14 
    LDA.B $16 
    INC A 
    STA.B $16 
    CMP.W #$0007 : BMI .loop 

.getPointer:
    LDA.B $16 
    ASL A 
    TAY 
    LDA.W .palettePointers,Y : CLC : ADC.B $18 : TAY 
    LDA.W $0000,Y 
    TAY 
    LDX.B $18 
    RTS 


.palettePointers:
    dw Palette_Phantoon_HealthBased_0 
    dw Palette_Phantoon_HealthBased_1 
    dw Palette_Phantoon_HealthBased_2 
    dw Palette_Phantoon_HealthBased_3 
    dw Palette_Phantoon_HealthBased_4 
    dw Palette_Phantoon_HealthBased_5 
    dw Palette_Phantoon_HealthBased_6 
    dw Palette_Phantoon_HealthBased_7 

AdvanceWreckedShipPowerOnPaletteTransition:
    REP #$30 
    LDA.W $0FEE 
    INC A 
    CMP.W $0FF0 : BCS .advance 
    LDA.W #$0000 : STA.W $0FF0 
    SEC 
    RTS 


.advance:
    LDX.W #$0000 

.loop:
    PHX 
    LDA.W Palette_WreckedShipPoweredOn,X 
    TAY 
    LDA.L $7EC000,X 
    TAX 
    LDA.W $0FF0 : JSR.W CalculateAthTransitionalColorFromXToY 
    PLX 
    STA.L $7EC000,X 
    INX #2
    CPX.W #$00E0 
    BCC .loop 
    LDA.W $0FF0 
    INC A 
    STA.W $0FF0 
    CLC 
    RTS 


CalculateAthTransitionalColorFromXToY:
    PHA : PHA : PHX : PHY 
    LDA.B $01,S : AND.W #$001F 
    TAY 
    LDA.B $03,S : AND.W #$001F 
    TAX 
    LDA.B $05,S : JSR.W CalculateTheAthTransitionalColorComponentFromXToY 
    STA.B $07,S 
    LDA.B $01,S 
    ASL #3
    XBA 
    AND.W #$001F 
    TAY 
    LDA.B $03,S 
    ASL #3
    XBA 
    AND.W #$001F 
    TAX 
    LDA.B $05,S : JSR.W CalculateTheAthTransitionalColorComponentFromXToY 
    ASL #5
    ORA.B $07,S 
    STA.B $07,S 
    LDA.B $01,S 
    LSR #2
    XBA 
    AND.W #$001F 
    TAY 
    LDA.B $03,S 
    LSR #2
    XBA 
    AND.W #$001F 
    TAX 
    LDA.B $05,S : JSR.W CalculateTheAthTransitionalColorComponentFromXToY 
    ASL #2
    XBA 
    ORA.B $07,S 
    STA.B $07,S 
    PLY : PLX : PLA : PLA 
    RTS 


CalculateTheAthTransitionalColorComponentFromXToY:
    CMP.W #$0000 : BNE .notZero 
    TXA 
    RTS 


.notZero:
    DEC A 
    CMP.W $0FEE : BNE + 
    TYA 
    RTS 


  + PHX 
    INC A 
    STA.B $14 
    TYA 
    SEC : SBC.B $01,S : STA.B $12 
    BPL + 
    EOR.W #$FFFF 
    INC A 

  + SEP #$21 
    STZ.W $4204 
    STA.W $4205 
    LDA.W $0FEE : SBC.B $14 : INC A 
    STA.W $4206 
    REP #$20 
    NOP #5
    LDA.W $4214 : BIT.B $12 
    BPL + 
    EOR.W #$FFFF 
    INC A 

  + STA.B $12 
    PLA 
    XBA 
    CLC : ADC.B $12 : XBA 
    AND.W #$00FF 
    RTS 


HurtAI_Phantoon:
    PHP 
    REP #$30 
    LDA.W $0F9C : CMP.W #$0008 : BEQ .healthBased 
    LDA.W $0FA4 : BIT.W #$0002 
    BNE .white 
    LDA.W $1036 : BIT.W #$FF00 
    BEQ .return 

.healthBased:
    LDX.W #$001E 

.loopPalette:
    JSR.W GetPhantoonHealthBasedPaletteColor 
    TYA 
    STA.L $7EC0E0,X 
    DEX #2
    BPL .loopPalette 
    LDA.W $1036 : AND.W #$00FF : STA.W $1036 
    BRA .return 


.white:
    LDA.W $1036 : BIT.W #$FF00 
    BNE .return 
    LDX.W #$001E 

.loopWhite:
    LDA.W #$7FFF : STA.L $7EC0E0,X 
    DEX #2
    BPL .loopWhite 
    LDA.W $1036 : ORA.W #$0100 : STA.W $1036 

.return:
    PLP 
    RTL 


EnemyTouch_Phantoon:
    JSL.L NormalEnemyTouchAI_NoDeathCheck_External 
    RTL 


RTL_A7DD9A:
    RTL 


EnemyShot_Phantoon:
    PHB 
    LDA.W $0FB2 : CMP.W #Function_Phantoon_DeathSequence_FadingInAndOut : BMI .notDead 
    PLB 
    RTL 


.notDead:
    LDX.W $0E54 
    LDA.W $0F8C,X 
    PHA 
    JSL.L NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External 
    PLA 
    STA.B $12 
    LDA.W $0F8C,X : BNE .alive 
    LDA.W #$0073 : JSL.L QueueSound_Lib2_Max6 
    LDA.W #$0001 : STA.W $1036 
    LDA.W $0F86 : ORA.W #$0400 : STA.W $0F86 
    JSR.W StartPhantoonDeathSequence 

.returnUpper:
    PLB 
    RTL 


.alive:
    LDA.W $0F8A,X : BIT.W #$0002 
    BEQ .returnUpper 
    LDA.W #$0073 : JSL.L QueueSound_Lib2_Max6 
    LDA.W $0FB2,X : CMP.W #Function_Phantoon_Figure8_VulnerableWindow : BEQ .vulnerableWindow 
    CMP.W #Function_Phantoon_FlameRain_VulnerableWindow : BEQ .vulnerableWindow 
    CMP.W #Function_Phantoon_Swooping_Opaque : BEQ .swooping 
    JMP.W .return1036_2 


.swooping:
    LDA.B $12 : SEC : SBC.W $0F8C,X : STA.B $12 
    CMP.W #$012C : BMI .overDamaged 
    LDA.W $18A6 
    ASL A 
    TAY 
    LDA.W $0C18,Y : AND.W #$0F00 
    CMP.W #$0200 : BNE .overDamaged 
    JMP.W .enraged 


.overDamaged:
    LDA.W $102A,X : CLC : ADC.B $12 : STA.W $102A,X 
    CMP.W #$012C : BMI .return1036_2 
    LDA.W #$0001 : STA.W $0FB0,X 
    BRA .return1036_2 


.vulnerableWindow:
    LDA.B $12 : SEC : SBC.W $0F8C,X : STA.B $12 
    CMP.W #$012C : BMI + 
    LDA.W $18A6 
    ASL A 
    TAY 
    LDA.W $0C18,Y : AND.W #$0F00 
    CMP.W #$0200 : BNE + 
    JMP.W .enraged 


  + LDA.W $102A,X : CLC : ADC.B $12 : STA.W $102A,X 
    CMP.W #$012C : BPL .nextRound 
    JSL.L GenerateRandomNumber 
    AND.W #$0007 
    TAY 
    LDA.W Phantoon_Unknown0FEAValues_A7CDA5,Y : AND.W #$00FF : STA.W $0FEA 
    TYA 
    STA.W $1076 
    LDA.W #$0001 : STA.W $1036 
    LDA.W $1028 : BNE .returnLower 
    LDA.W #$0001 : STA.W $1028 
    LDA.W $0FB0,X : CMP.W #$0010 : BMI .returnLower 
    LDA.W #$0010 : STA.W $0FB0,X 

.returnLower:
    PLB 
    RTL 


.return1036_2:
    LDA.W #$0002 : STA.W $1036 
    PLB 
    RTL 


.nextRound:
    LDA.W #Function_Phantoon_Swooping_FadeOut : STA.W $0FB2,X 

.nextRoundOrEnraged:
    STZ.W $0FB0,X 
    STZ.W $1028 
    STZ.W $102A,X 
    LDA.W $1988 : ORA.W #$4000 : STA.W $1988 
    LDA.W #$0001 : STA.W $0F94 
    STA.W $0FD4 
    LDA.W #InstList_Phantoon_Body_Invulnerable : STA.W $0F92 
    LDA.W #InstList_Phantoon_Eye_Close : STA.W $0FD2 
    LDA.W $0F86 : ORA.W #$0400 : STA.W $0F86 
    STZ.W $0FF2 
    BRA .return1036_2 


.enraged:
    LDA.W #Function_Phantoon_Enraged_FadingOutBeforeRage : STA.W $0FB2,X 
    BRA .nextRoundOrEnraged 


ExtendedSpritemap_Phantoon_Body_Invulnerable:
    dw $0001,$0000,$0000 
    dw ExtendedTilemap_Phantoon_Body 
    dw Hitbox_Phantoon_0 

ExtendedSpritemap_Phantoon_Body_FullHitbox:
    dw $0001,$0000,$0000 
    dw ExtendedTilemap_Phantoon_Body 
    dw Hitbox_Phantoon_1 

ExtendedSpritemap_Phantoon_Body_EyeHitbox:
    dw $0001,$0000,$0000 
    dw ExtendedTilemap_Phantoon_Body 
    dw Hitbox_Phantoon_2 

ExtendedSpritemap_Phantoon_Eye_Closed:
    dw $0001,$0000,$0000 
    dw ExtendedTilemap_Phantoon_Eye_Closed 
    dw Hitbox_Phantoon_0 

ExtendedSpritemap_Phantoon_Eye_Opening:
    dw $0001,$0000,$0000 
    dw ExtendedTilemap_Phantoon_Eye_Closed 
    dw Hitbox_Phantoon_0 

ExtendedSpritemap_Phantoon_Eye_OpeningClosing:
    dw $0001,$0000,$0000 
    dw ExtendedTilemap_Phantoon_Eye_OpeningClosing 
    dw Hitbox_Phantoon_0 

ExtendedSpritemap_Phantoon_Eye_Open:
    dw $0001,$0000,$0000 
    dw ExtendedTilemap_Phantoon_Eye_Open 
    dw Hitbox_Phantoon_0 

ExtendedSpritemap_Phantoon_Eyeball_Centered:
    dw $0001,$0000,$0000 
    dw ExtendedTilemap_Phantoon_Eyeball_Centered 
    dw Hitbox_Phantoon_0 

ExtendedSpritemap_Phantoon_Eyeball_LookingUp:
    dw $0001,$0000,$0000 
    dw ExtendedTilemap_Phantoon_Eyeball_LookingUp 
    dw Hitbox_Phantoon_0 

ExtendedSpritemap_Phantoon_Eyeball_LookingDown:
    dw $0001,$0000,$0000 
    dw ExtendedTilemap_Phantoon_Eyeball_LookingDown 
    dw Hitbox_Phantoon_0 

ExtendedSpritemap_Phantoon_Eyeball_LookingLeft:
    dw $0001,$0000,$0000 
    dw ExtendedTilemap_Phantoon_Eyeball_LookingLeft 
    dw Hitbox_Phantoon_0 

ExtendedSpritemap_Phantoon_Eyeball_LookingRight:
    dw $0001,$0000,$0000 
    dw ExtendedTilemap_Phantoon_Eyeball_LookingRight 
    dw Hitbox_Phantoon_0 

ExtendedSpritemap_Phantoon_Eyeball_LookingDownLeft:
    dw $0001,$0000,$0000 
    dw ExtendedTilemap_Phantoon_Eyeball_LookingDownLeft 
    dw Hitbox_Phantoon_0 

ExtendedSpritemap_Phantoon_Eyeball_LookingDownRight:
    dw $0001,$0000,$0000 
    dw ExtendedTilemap_Phantoon_Eyeball_LookingDownRight 
    dw Hitbox_Phantoon_0 

ExtendedSpritemap_Phantoon_Eyeball_LookingUpLeft:
    dw $0001,$0000,$0000 
    dw ExtendedTilemap_Phantoon_Eyeball_LookingUpLeft 
    dw Hitbox_Phantoon_0 

ExtendedSpritemap_Phantoon_Eyeball_LookingUpRight:
    dw $0001,$0000,$0000 
    dw ExtendedTilemap_Phantoon_Eyeball_LookingUpRight 
    dw Hitbox_Phantoon_0 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ExtendedSpritemap_Phantoon_Tentacles_A7DF7D:
    dw $0002,$0000,$0000 
    dw ExtendedTilemap_Phantoon_Tentacle_Left_0 
    dw Hitbox_Phantoon_0 
    dw $0000,$0000 
    dw ExtendedTilemap_Phantoon_Tentacle_Right_0 
    dw Hitbox_Phantoon_0 

UNUSED_ExtendedSpritemap_Phantoon_Tentacles_A7DF8F:
    dw $0002,$0000,$0000 
    dw ExtendedTilemap_Phantoon_Tentacle_Left_1 
    dw Hitbox_Phantoon_0 
    dw $0000,$0000 
    dw ExtendedTilemap_Phantoon_Tentacle_Right_1 
    dw Hitbox_Phantoon_0 

UNUSED_ExtendedSpritemap_Phantoon_Tentacles_A7DFA1:
    dw $0002,$0000,$0000 
    dw ExtendedTilemap_Phantoon_Tentacle_Left_2 
    dw Hitbox_Phantoon_0 
    dw $0000,$0000 
    dw ExtendedTilemap_Phantoon_Tentacle_Right_2 
    dw Hitbox_Phantoon_0 
endif ; !FEATURE_KEEP_UNREFERENCED

ExtendedSpritemap_Phantoon_Tentacles_0:
    dw $0002,$0000,$0000 
    dw ExtendedTilemap_Phantoon_Tentacle_Left_0 
    dw Hitbox_Phantoon_0 
    dw $0000,$0000 
    dw ExtendedTilemap_Phantoon_Tentacle_Right_0 
    dw Hitbox_Phantoon_0 

ExtendedSpritemap_Phantoon_Tentacles_1:
    dw $0002,$0000,$0000 
    dw ExtendedTilemap_Phantoon_Tentacle_Left_1 
    dw Hitbox_Phantoon_0 
    dw $0000,$0000 
    dw ExtendedTilemap_Phantoon_Tentacle_Right_1 
    dw Hitbox_Phantoon_0 

ExtendedSpritemap_Phantoon_Tentacles_2:
    dw $0002,$0000,$0000 
    dw ExtendedTilemap_Phantoon_Tentacle_Left_2 
    dw Hitbox_Phantoon_0 
    dw $0000,$0000 
    dw ExtendedTilemap_Phantoon_Tentacle_Right_2 
    dw Hitbox_Phantoon_0 

ExtendedSpritemap_Phantoon_Mouth_Normal:
    dw $0001,$0000,$0000 
    dw ExtendedTilemap_Phantoon_Mouth_0 
    dw Hitbox_Phantoon_0 

ExtendedSpritemap_Phantoon_Mouth_SpawningFlame_0:
    dw $0001,$0000,$0000 
    dw ExtendedTilemap_Phantoon_Mouth_1 
    dw Hitbox_Phantoon_0 

ExtendedSpritemap_Phantoon_Mouth_SpawningFlame_1:
    dw $0001,$0000,$0000 
    dw ExtendedTilemap_Phantoon_Mouth_2 
    dw Hitbox_Phantoon_0 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ExtendedSpritemap_Phantoon_Mouth_SpawningFlame_A7E007:
    dw $0001,$0000,$0000 
    dw ExtendedTilemap_Phantoon_Mouth_0 
    dw Hitbox_Phantoon_0 
endif ; !FEATURE_KEEP_UNREFERENCED

RTL_A7E011:
    RTL 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Hitbox_Phantoon_A7E012:
    dw $0001,$FFF7,$FFF0,$0008,$0010 
    dw EnemyTouch_Phantoon 
    dw EnemyShot_Phantoon 
endif ; !FEATURE_KEEP_UNREFERENCED

Hitbox_Phantoon_0:
    dw $0001,$0000,$0000,$0000,$0000 
    dw RTL_A7804C 
    dw RTL_A7804C 

Hitbox_Phantoon_1:
    dw $0005,$FFDF,$FFD8,$0020,$0038 
    dw EnemyTouch_Phantoon 
    dw EnemyShot_Phantoon 
    dw $FFF7,$0016,$0008,$0027 
    dw EnemyTouch_Phantoon 
    dw EnemyShot_Phantoon 
    dw $FFE9,$0034,$FFF0,$0047 
    dw EnemyTouch_Phantoon 
    dw EnemyShot_Phantoon 
    dw $000F,$0035,$0016,$0046 
    dw EnemyTouch_Phantoon 
    dw EnemyShot_Phantoon 
    dw $FFF4,$0035,$000B,$0045 
    dw EnemyTouch_Phantoon 
    dw EnemyShot_Phantoon 

Hitbox_Phantoon_2:
    dw $0001,$FFF7,$0016,$0008,$0027 
    dw EnemyTouch_Phantoon 
    dw EnemyShot_Phantoon 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_PhantoonFlame_A7E07A:
    dw $0002,$81F8 
    db $00 
    dw $2106,$81F8 
    db $F0 
    dw $2100 

UNUSED_Spritemap_PhantoonFlame_A7E086:
    dw $0002,$81F8 
    db $00 
    dw $2108,$81F8 
    db $F0 
    dw $2102 

UNUSED_Spritemap_PhantoonFlame_A7E092:
    dw $0002,$81F8 
    db $00 
    dw $210A,$81F8 
    db $F0 
    dw $2104 

UNUSED_Spritemap_PhantoonFlame_A7E09E:
    dw $0002,$8000 
    db $F8 
    dw $610C,$81F0 
    db $F8 
    dw $210C 
endif ; !FEATURE_KEEP_UNREFERENCED

ExtendedTilemap_Phantoon_Body:
    dw $FFFE,$2000,$000A,$2338,$2338,$2338,$3D32,$3D33 
    dw $7D33,$7D32,$2338,$2338,$2338,$2040,$000A,$2338 
    dw $3D40,$3D41,$3D42,$3D43,$7D43,$7D42,$7D41,$7D40 
    dw $2338,$2080,$000A,$2338,$3D50,$3D51,$3D52,$3D53 
    dw $7D53,$7D52,$7D51,$7D50,$2338,$20C0,$000A,$3D78 
    dw $3D60,$3D61,$3D62,$3D63,$7D63,$7D62,$7D61,$7D60 
    dw $7D78,$2100,$000A,$3D79,$3D70,$3D71,$3D72,$3D73 
    dw $7D73,$7D72,$7D71,$7D70,$7D79,$2140,$000A,$BD78 
    dw $3D34,$3D35,$3D36,$3D37,$7D37,$7D36,$7D35,$7D34 
    dw $FD78,$2180,$000A,$2338,$3D44,$3D45,$3D46,$3D47 
    dw $7D47,$7D46,$7D45,$7D44,$2338,$21C0,$000A,$2338 
    dw $3D54,$3D55,$3D56,$3D57,$7D57,$7D56,$7D55,$7D54 
    dw $2338,$2200,$000A,$2338,$3D64,$3D65,$3D66,$2338 
    dw $2338,$7D66,$7D65,$7D64,$2338,$2240,$000A,$2338 
    dw $3D74,$3D75,$3D76,$2338,$2338,$7D76,$7D75,$7D74 
    dw $2338,$2280,$000A,$2338,$2338,$3D38,$3D39,$3D3A 
    dw $7D3A,$7D39,$7D38,$2338,$2338,$22C0,$000A,$2338 
    dw $2338,$3D48,$3D49,$3D4A,$7D4A,$7D49,$7D48,$2338 
    dw $2338,$FFFF 

ExtendedTilemap_Phantoon_Eye_Open:
    dw $FFFE,$21C6,$0004,$3D56,$3D57,$7D57,$7D56,$2206 
    dw $0004,$3D66,$3D67,$3D3F,$7D66,$2246,$0004,$3D76 
    dw $3D77,$3D4F,$7D76,$2286,$0004,$3D39,$3D3A,$7D3A 
    dw $7D39,$FFFF 

ExtendedTilemap_Phantoon_Eye_OpeningClosing:
    dw $FFFE,$21C6,$0004,$3D3D,$3D3E,$7D3E,$7D3D,$2206 
    dw $0004,$3D4D,$3D4E,$3D5F,$7D4D,$2246,$0004,$3D5D 
    dw $3D5E,$3D6F,$7D5D,$2286,$0004,$3D6D,$3D6E,$7D6E 
    dw $7D6D,$FFFF 

ExtendedTilemap_Phantoon_Eye_Closed:
    dw $FFFE,$21C6,$0004,$3D3B,$3D3C,$7D3C,$7D3B,$2206 
    dw $0004,$3D4B,$3D4C,$7D4C,$7D4B,$2246,$0004,$3D5B 
    dw $3D5C,$7D5C,$7D5B,$2286,$0004,$3D6B,$3D6C,$7D6C 
    dw $7D6B,$FFFF 

ExtendedTilemap_Phantoon_Eyeball_Centered:
    dw $FFFE,$2208,$0002,$3D67,$3D3F,$2248,$0002,$3D77 
    dw $3D4F,$FFFF 

ExtendedTilemap_Phantoon_Eyeball_LookingUp:
    dw $FFFE,$2208,$0002,$3D10,$3D11,$2248,$0002,$3D20 
    dw $3D21,$FFFF 

ExtendedTilemap_Phantoon_Eyeball_LookingDown:
    dw $FFFE,$2208,$0002,$3D12,$3D13,$2248,$0002,$3D22 
    dw $3D23,$FFFF 

ExtendedTilemap_Phantoon_Eyeball_LookingLeft:
    dw $FFFE,$2208,$0002,$3D14,$3D15,$2248,$0002,$3D24 
    dw $3D25,$FFFF 

ExtendedTilemap_Phantoon_Eyeball_LookingRight:
    dw $FFFE,$2208,$0002,$3D16,$3D17,$2248,$0002,$3D26 
    dw $3D27,$FFFF 

ExtendedTilemap_Phantoon_Eyeball_LookingDownLeft:
    dw $FFFE,$2208,$0002,$3D18,$3D19,$2248,$0002,$3D28 
    dw $3D29,$FFFF 

ExtendedTilemap_Phantoon_Eyeball_LookingDownRight:
    dw $FFFE,$2208,$0002,$3D1A,$3D1B,$2248,$0002,$3D2A 
    dw $3D2B,$FFFF 

ExtendedTilemap_Phantoon_Eyeball_LookingUpLeft:
    dw $FFFE,$2208,$0002,$3D1C,$3D1D,$2248,$0002,$3D2C 
    dw $3D2D,$FFFF 

ExtendedTilemap_Phantoon_Eyeball_LookingUpRight:
    dw $FFFE,$2208,$0002,$3D1E,$3D1F,$2248,$0002,$3D2E 
    dw $3D2F,$FFFF 

ExtendedTilemap_Phantoon_Tentacle_Left_0:
    dw $FFFE,$2304,$0001,$3D58,$2344,$0001,$3D68,$FFFF 

ExtendedTilemap_Phantoon_Tentacle_Left_1:
    dw $FFFE,$2304,$0001,$3D81,$2344,$0001,$3D83,$FFFF 

ExtendedTilemap_Phantoon_Tentacle_Left_2:
    dw $FFFE,$2304,$0001,$3D80,$2344,$0001,$3D82,$FFFF 

ExtendedTilemap_Phantoon_Tentacle_Right_0:
    dw $FFFE,$230E,$0001,$7D58,$234E,$0001,$7D68,$FFFF 

ExtendedTilemap_Phantoon_Tentacle_Right_1:
    dw $FFFE,$230E,$0001,$7D81,$234E,$0001,$7D83,$FFFF 

ExtendedTilemap_Phantoon_Tentacle_Right_2:
    dw $FFFE,$230E,$0001,$7D80,$234E,$0001,$7D82,$FFFF 

ExtendedTilemap_Phantoon_Mouth_0:
    dw $FFFE,$2306,$0004,$3D59,$3D5A,$7D5A,$7D59,$2346 
    dw $0004,$3D69,$3D6A,$7D6A,$7D69,$FFFF 

ExtendedTilemap_Phantoon_Mouth_1:
    dw $FFFE,$2306,$0004,$3D7A,$3D7B,$7D7B,$7D7A,$2346 
    dw $0004,$3D7C,$3D7D,$7D7D,$7D7C,$FFFF 

ExtendedTilemap_Phantoon_Mouth_2:
    dw $FFFE,$2306,$0004,$3D7E,$3D7F,$7D7F,$7D7E,$2346 
    dw $0004,$3D30,$3D31,$7D31,$7D30,$FFFF 

PhantoonMovementData:
    db $00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$FF,$00,$FF,$01,$00 
    db $00,$FF,$01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF 
    db $01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00 
    db $00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF 
    db $01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF 
    db $01,$00,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00 
    db $00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00 
    db $01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$01,$00 
    db $01,$00,$00,$FF,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00 
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$01,$01,$00,$01,$00,$01,$00 
    db $01,$00,$00,$01,$01,$00,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00 
    db $00,$01,$01,$00,$01,$00,$01,$01,$01,$00,$01,$01,$01,$00,$00,$01 
    db $01,$00,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$01,$00,$00,$01 
    db $01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$01,$01,$01,$01,$01,$01 
    db $01,$01,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01 
    db $00,$01,$01,$00,$00,$01,$00,$01,$01,$00,$00,$01,$00,$01,$01,$00 
    db $00,$01,$00,$01,$00,$01,$01,$00,$00,$01,$00,$01,$00,$01,$00,$01 
    db $00,$01,$00,$01,$00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$00,$01 
    db $FF,$00,$00,$01,$00,$01,$FF,$01,$00,$01,$FF,$00,$00,$01,$00,$01 
    db $FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$01,$00,$01 
    db $FF,$00,$FF,$01,$FF,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00 
    db $00,$01,$FF,$00,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$FF,$00 
    db $00,$01,$FF,$00,$FF,$01,$FF,$00,$FF,$01,$FF,$00,$FF,$00,$00,$01 
    db $FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00,$FF,$00,$00,$01,$FF,$00 
    db $FF,$00,$FF,$00,$FF,$00,$FF,$01,$FF,$00,$FF,$00,$FF,$00,$FF,$00 
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$FF,$FF,$00 
    db $FF,$00,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF,$FF,$00 
    db $FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$FF,$FF,$00 
    db $00,$FF,$FF,$00,$00,$FF,$FF,$00,$FF,$FF,$FF,$FF,$FF,$00,$00,$FF 
    db $FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$FF,$FF,$FF,$00,$FF,$FF,$00 
    db $00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$FF 
    db $00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$00,$FF 
    db $FF,$00,$00,$FF,$FF,$00,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$FF,$00 
    db $00,$FF,$FF,$00,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF 
    db $FF,$FF,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$00,$FF,$FF,$00 
    db $00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$FF,$00,$FF,$FF,$00 
    db $00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$FF 
    db $00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00 
    db $00,$FF,$FF,$00,$FF,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00 
    db $FF,$FF,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00 
    db $00,$FF,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$FF,$00,$FF,$00 
    db $00,$FF,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00 
    db $FF,$00,$FF,$00,$FF,$00,$FF,$01,$FF,$00,$FF,$00,$FF,$00,$FF,$00 
    db $00,$01,$FF,$00,$FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00,$00,$01 
    db $FF,$00,$FF,$00,$FF,$01,$FF,$00,$FF,$01,$FF,$00,$00,$01,$FF,$00 
    db $FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$FF,$00,$00,$01,$FF,$00 
    db $00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$FF,$01,$FF,$01 
    db $FF,$01,$00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01 
    db $00,$01,$FF,$00,$00,$01,$FF,$01,$00,$01,$00,$01,$FF,$00,$00,$01 
    db $00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01 
    db $00,$01,$00,$01,$00,$01,$01,$00,$00,$01,$00,$01,$00,$01,$01,$00 
    db $00,$01,$00,$01,$01,$00,$00,$01,$00,$01,$01,$00,$00,$01,$00,$01 
    db $01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01,$01,$01,$01,$01 
    db $00,$01,$01,$00,$01,$01,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00 
    db $00,$01,$01,$00,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$01,$00 
    db $00,$01,$01,$00,$01,$01,$01,$00,$01,$01,$01,$00,$01,$00,$00,$01 
    db $01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$01,$00,$00,$01,$01,$00 
    db $01,$00,$01,$00,$01,$00,$01,$01,$01,$00,$01,$00,$01,$00,$01,$00 
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$00,$FF,$01,$00 
    db $01,$00,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00 
    db $01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF 
    db $01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$01,$FF 
    db $01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF 
    db $01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00 
    db $00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF 
    db $01,$00,$00,$FF,$01,$FF,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF 
    db $01,$FF,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF 

Palette_Etecoon:
    dw $3800,$5F97,$56F2,$2987,$00A0,$6355,$4AB0,$3A0B 
    dw $31C9,$57FF,$42F7,$2610,$158C,$03FF,$0279,$0029 

InstList_Etecoon_LookRightAtSamusAndRunLeft:
    dw $0005 
    dw Spritemap_Etecoon_C 
    dw Instruction_Common_Sleep 
    dw $0001 
    dw Spritemap_Etecoon_D 

InstList_Etecoon_RunningLeft:
    dw $0005 
    dw Spritemap_Etecoon_0 
    dw $0005 
    dw Spritemap_Etecoon_1 
    dw $0005 
    dw Spritemap_Etecoon_2 
    dw $0005 
    dw Spritemap_Etecoon_1 
    dw Instruction_Common_GotoY 
    dw InstList_Etecoon_RunningLeft 

InstList_Etecoon_WallJump_0:
    dw $0008 
    dw Spritemap_Etecoon_7 

InstList_Etecoon_WallJump_1:
    dw $0003 
    dw Spritemap_Etecoon_3 
    dw $0003 
    dw Spritemap_Etecoon_4 
    dw $0003 
    dw Spritemap_Etecoon_5 
    dw $0003 
    dw Spritemap_Etecoon_6 
    dw Instruction_Common_GotoY 
    dw InstList_Etecoon_WallJump_1 

InstList_Etecoon_Hopping_FacingLeft:
    dw $0001 
    dw Spritemap_Etecoon_8 
    dw Instruction_Common_Sleep 
    dw $000C 
    dw Spritemap_Etecoon_9 
    dw $000C 
    dw Spritemap_Etecoon_A 

InstList_Etecoon_HitCeiling:
    dw $0006 
    dw Spritemap_Etecoon_B 
    dw $000C 
    dw Spritemap_Etecoon_A 
    dw $000C 
    dw Spritemap_Etecoon_9 
    dw Instruction_Common_Sleep 

InstList_Etecoon_WallJumpLeftEligible:
    dw $0001 
    dw Spritemap_Etecoon_F 
    dw Instruction_Common_Sleep 

InstList_Etecoon_LookLeftAtSamusAndRunRight:
    dw $0005 
    dw Spritemap_Etecoon_1E 
    dw Instruction_CommonA7_Sleep 
    dw $0001 
    dw Spritemap_Etecoon_1D 

InstList_Etecoon_RunningRight:
    dw $0005 
    dw Spritemap_Etecoon_10 
    dw $0005 
    dw Spritemap_Etecoon_11 
    dw $0005 
    dw Spritemap_Etecoon_12 
    dw $0005 
    dw Spritemap_Etecoon_11 
    dw Instruction_Common_GotoY 
    dw InstList_Etecoon_RunningRight 

InstList_Etecoon_WallJumpRight:
    dw $0008 
    dw Spritemap_Etecoon_17 

InstList_Etecoon_JumpingRight:
    dw $0003 
    dw Spritemap_Etecoon_13 
    dw $0003 
    dw Spritemap_Etecoon_14 
    dw $0003 
    dw Spritemap_Etecoon_15 
    dw $0003 
    dw Spritemap_Etecoon_16 
    dw Instruction_Common_GotoY 
    dw InstList_Etecoon_JumpingRight 

InstList_Etecoon_Hopping_FacingRight:
    dw $0001 
    dw Spritemap_Etecoon_18 
    dw Instruction_Common_Sleep 
    dw $000C 
    dw Spritemap_Etecoon_19 
    dw $000C 
    dw Spritemap_Etecoon_1A 
    dw $0006 
    dw Spritemap_Etecoon_1B 
    dw $000C 
    dw Spritemap_Etecoon_1A 
    dw $000C 
    dw Spritemap_Etecoon_19 
    dw Instruction_CommonA7_Sleep 

InstList_Etecoon_WallJumpRightEligible:
    dw $0001 
    dw Spritemap_Etecoon_1F 
    dw Instruction_Common_Sleep 

InstList_Etecoon_Initial:
    dw $0008 
    dw Spritemap_Etecoon_18 
    dw Instruction_Common_GotoY 
    dw InstList_Etecoon_Initial 

InstList_Etecoon_Flexing_0:
    dw Instruction_Common_TimerInY 
    dw $0004 

InstList_Etecoon_Flexing_1:
    dw $0008 
    dw Spritemap_Etecoon_18 
    dw $0008 
    dw Spritemap_Etecoon_19 
    dw $0008 
    dw Spritemap_Etecoon_1A 
    dw $0008 
    dw Spritemap_Etecoon_1B 
    dw $0008 
    dw Spritemap_Etecoon_1A 
    dw $0008 
    dw Spritemap_Etecoon_19 
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate 
    dw InstList_Etecoon_Flexing_1 
    dw $0020 
    dw Spritemap_Etecoon_1C 
    dw $0020 
    dw Spritemap_Etecoon_1E 
    dw Instruction_Common_Sleep 

EtecoonConstants_initialYVelocityOfHopsAndFailedJumps:
    dw $FFFD,$0000 

EtecoonConstants_initialYVelocityOfSuccessfulJump:
    dw $FFFC,$0000 

EtecoonConstants_XVelocityRight:
    dw $0002,$0000 

EtecoonConstants_XVelocityLeft:
    dw $FFFE,$0000 

EtecoonConstants_SamusXProximityThresholdAtBottomOfRoom:
    dw $0040 

InitAI_Etecoon:
    LDX.W $0E54 
    LDA.W $0F86,X : ORA.W #$2000 : STA.W $0F86,X 
    LDA.W #Spritemap_CommonA7_Nothing : STA.W $0F8E,X 
    LDA.W #$0001 : STA.W $0F94,X 
    STZ.W $0F90,X 
    LDA.W #InstList_Etecoon_Initial : STA.W $0F92,X 
    LDA.W #Function_Etecoon_Initial : STA.W $0FB2,X 
    LDA.W #$FFFF : STA.W $0FB0,X 
    RTL 


MainAI_Etecoon:
    LDX.W $0E54 
    LDA.W $0FB6,X : BIT.W #$FF00 
    BEQ .executeFunction 
    SEC : SBC.W #$0100 : STA.W $0FB6,X 
    BRA .return 


.executeFunction:
    JMP.W ($0FB2,X) 


.return:
    RTL 


FreezeEtecoonIfQuakeActive:
    LDA.W $1840 : BEQ .return 
    LDA.W $0FB6,X : AND.W #$00FF 
    ORA.W #$8000 
    STA.W $0FB6,X 
    LDA.W $0F94,X : CLC : ADC.W #$0080 : STA.W $0F94,X 

.return:
    RTS 


EtecoonHorizontalMovement:
    LDA.W $0FAC,X : STA.B $14 
    LDA.W $0FAE,X : STA.B $12 
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes 
    RTS 


EtecoonVerticalMovement:
    LDA.W $0FA8,X : STA.B $14 
    LDA.W $0FAA,X : STA.B $12 
    LDA.W $0FA8,X : CMP.W #$0005 : BPL .move 
    LDA.W $0FAA,X : CLC : ADC.L $000B32 : STA.W $0FAA,X 
    LDA.W $0FA8,X : ADC.L $000B34 : STA.W $0FA8,X 

.move:
    JSL.L MoveEnemyDownBy_14_12 
    RTS 


Function_Etecoon_Initial:
    LDA.W $0797 : BEQ .notDoorTransition 
    RTL 


.notDoorTransition:
    LDA.W $0FB0,X : BPL .positive 
    LDA.W #$0080 : JSL.L IsSamusWithingAPixelRowsOfEnemy 
    TAY 
    BEQ .return 
    LDA.W $0FB6,X : BIT.W #$0003 
    BNE .flex 
    LDA.W #$0035 : JSL.L QueueSound_Lib2_Max15 

.flex:
    LDA.W #$0001 : STA.W $0F94,X 
    LDA.W #InstList_Etecoon_Flexing_0 : STA.W $0F92,X 
    LDA.W #$0100 : STA.W $0FB0,X 
    RTL 


.positive:
    DEC.W $0FB0,X 
    BEQ .hop 
    BPL .return 

.hop:
    LDA.W #InstList_Etecoon_Hopping_FacingLeft : STA.W $0F92,X 
    LDA.W #Function_Etecoon_StartHop_BottomOfRoom : STA.W $0FB2,X 
    LDA.W #$000B : STA.W $0FB0,X 

.return:
    RTL 


Function_Etecoon_StartHop_BottomOfRoom:
    DEC.W $0FB0,X 
    BEQ .timerExpired 
    BPL .return 

.timerExpired:
    LDA.W EtecoonConstants_initialYVelocityOfHopsAndFailedJumps : STA.W $0FA8,X 
    LDA.W EtecoonConstants_initialYVelocityOfHopsAndFailedJumps+2 : STA.W $0FAA,X 
    LDA.W $0F92,X 
    INC #2
    STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    LDA.W #Function_Etecoon_Hopping_BottomOfRoom : STA.W $0FB2,X 
    LDA.W $0AF6 : CMP.W #$0100 : BMI .return 
    LDA.W #$0033 : JSL.L QueueSound_Lib2_Max6 

.return:
    RTL 


Function_Etecoon_Hopping_BottomOfRoom:
    JSR.W EtecoonVerticalMovement 
    BCS .collision 
    RTL 


.collision:
    LDA.W $0FA8,X : BPL .notRising 
    STZ.W $0FA8,X 
    STZ.W $0FAA,X 
    LDA.W #$0003 : STA.W $0F94,X 
    LDA.W #InstList_Etecoon_HitCeiling : STA.W $0F92,X 
    RTL 


.notRising:
    LDA.W #$0040 : JSL.L IsSamusWithingAPixelRowsOfEnemy 
    TAY 
    BEQ .hopMore 
    LDA.W EtecoonConstants_SamusXProximityThresholdAtBottomOfRoom : JSL.L IsSamusWithinAPixelColumnsOfEnemy 
    TAY 
    BEQ .hopMore 
    JSL.L DetermineDirectionOfSamusFromEnemy 
    CMP.W #$0005 : BPL .left 
    LDA.W #InstList_Etecoon_LookRightAtSamusAndRunLeft : STA.W $0F92,X 
    STZ.W $0FB4,X 
    BRA + 


.left:
    LDA.W #InstList_Etecoon_LookLeftAtSamusAndRunRight : STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0FB4,X 

  + LDA.W #$0020 : STA.W $0FB0,X 
    LDA.W #$0001 : STA.W $0F94,X 
    LDA.W #Function_Etecoon_LookAtSamus : STA.W $0FB2,X 
    RTL 


.hopMore:
    LDA.W #$000B : STA.W $0FB0,X 
    LDA.W #Function_Etecoon_StartHop_BottomOfRoom : STA.W $0FB2,X 
    LDA.W #$0001 : STA.W $0F94,X 
    LDA.W #InstList_Etecoon_Hopping_FacingLeft : STA.W $0F92,X 
    RTL 


Function_Etecoon_LookAtSamus:
    DEC.W $0FB0,X 
    BEQ .timerExpired 
    BPL .return 

.timerExpired:
    LDA.W $0F92,X 
    INC #2
    STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    LDA.W $0FB4,X : BEQ .left 
    LDA.W EtecoonConstants_XVelocityRight : STA.W $0FAC,X 
    LDA.W EtecoonConstants_XVelocityRight+2 : STA.W $0FAE,X 
    LDA.W #Function_Etecoon_RunningRight : STA.W $0FB2,X 
    BRA + 


.left:
    LDA.W EtecoonConstants_XVelocityLeft : STA.W $0FAC,X 
    LDA.W EtecoonConstants_XVelocityLeft+2 : STA.W $0FAE,X 
    LDA.W #Function_Etecoon_RunningLeft : STA.W $0FB2,X 

  + LDA.W EtecoonConstants_initialYVelocityOfHopsAndFailedJumps : STA.W $0FA8,X 
    LDA.W EtecoonConstants_initialYVelocityOfHopsAndFailedJumps+2 : STA.W $0FAA,X 

.return:
    RTL 


Function_Etecoon_RunningLeft:
    JSR.W EtecoonHorizontalMovement 
    BCC .return 
    LDA.W EtecoonConstants_XVelocityRight : STA.W $0FAC,X 
    LDA.W EtecoonConstants_XVelocityRight+2 : STA.W $0FAE,X 
    LDA.W #Function_Etecoon_RunningRight : STA.W $0FB2,X 
    LDA.W #$0001 : STA.W $0F94,X 
    LDA.W #InstList_Etecoon_RunningRight : STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0FB4,X 

.return:
    RTL 


Function_Etecoon_RunningRight:
    LDA.W #$0020 : STA.B $14 
    STZ.B $12 
    JSL.L CheckForHorizontalSolidBlockCollision 
    BCC .move 
    LDA.W #$0001 : STA.W $0F94,X 
    LDA.W #InstList_Etecoon_JumpingRight : STA.W $0F92,X 
    LDA.W #Function_Etecoon_Jumping : STA.W $0FB2,X 
    RTL 


.move:
    JSR.W EtecoonHorizontalMovement 
    RTL 


Function_Etecoon_Jumping:
    JSR.W FreezeEtecoonIfQuakeActive 
    JSR.W EtecoonHorizontalMovement 
    BCC .noWall 
    LDA.W $0FB4,X : BNE .leftEligible 
    LDA.W #InstList_Etecoon_WallJumpRightEligible : STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0FB4,X 
    BRA + 


.leftEligible:
    LDA.W #InstList_Etecoon_WallJumpLeftEligible : STA.W $0F92,X 
    STZ.W $0FB4,X 

  + LDA.W #$0001 : STA.W $0F94,X 
    LDA.W #Function_Etecoon_WallJump : STA.W $0FB2,X 
    LDA.W #$0008 : STA.W $0FB0,X 
    LDA.W $0AF6 : CMP.W #$0100 : BMI .returnUpper 
    LDA.W #$0032 : JSL.L QueueSound_Lib2_Max6 

.returnUpper:
    RTL 


.noWall:
    JSR.W EtecoonVerticalMovement 
    BCC .returnLower 
    LDA.W $0FB4,X : BNE .hopLeft 
    LDA.W #InstList_Etecoon_Hopping_FacingRight : STA.W $0F92,X 
    BRA + 


.hopLeft:
    LDA.W #InstList_Etecoon_Hopping_FacingLeft : STA.W $0F92,X 

  + LDA.W #$0001 : STA.W $0F94,X 
    LDA.W #$000B : STA.W $0FB0,X 
    LDA.W #Function_Etecoon_LandedFromJump : STA.W $0FB2,X 
    LDA.W EtecoonConstants_initialYVelocityOfHopsAndFailedJumps : STA.W $0FA8,X 
    LDA.W EtecoonConstants_initialYVelocityOfHopsAndFailedJumps+2 : STA.W $0FAA,X 

.returnLower:
    RTL 


Function_Etecoon_WallJump:
    JSR.W FreezeEtecoonIfQuakeActive 
    DEC.W $0FB0,X 
    BEQ .timerExpired 
    BPL .return 

.timerExpired:
    LDA.W $0FB4,X : BEQ .left 
    LDA.W #InstList_Etecoon_WallJumpRight : STA.W $0F92,X 
    LDA.W EtecoonConstants_XVelocityRight : STA.W $0FAC,X 
    LDA.W EtecoonConstants_XVelocityRight+2 : STA.W $0FAE,X 
    BRA + 


.left:
    LDA.W #InstList_Etecoon_WallJump_0 : STA.W $0F92,X 
    LDA.W EtecoonConstants_XVelocityLeft : STA.W $0FAC,X 
    LDA.W EtecoonConstants_XVelocityLeft+2 : STA.W $0FAE,X 

  + LDA.W #$0001 : STA.W $0F94,X 
    LDA.W #Function_Etecoon_Jumping : STA.W $0FB2,X 
    LDA.W EtecoonConstants_initialYVelocityOfHopsAndFailedJumps : STA.W $0FA8,X 
    LDA.W EtecoonConstants_initialYVelocityOfHopsAndFailedJumps+2 : STA.W $0FAA,X 

.return:
    RTL 


Function_Etecoon_LandedFromJump:
    DEC.W $0FB0,X 
    BEQ .timerExpired 
    BPL .return 

.timerExpired:
    LDA.W EtecoonConstants_initialYVelocityOfHopsAndFailedJumps : STA.W $0FA8,X 
    LDA.W EtecoonConstants_initialYVelocityOfHopsAndFailedJumps+2 : STA.W $0FAA,X 
    TXY 
    LDA.W $0FB6,X : AND.W #$00FF 
    ASL A 
    TAX 
    JSR.W (.pointers,X) 
    LDA.W #$0001 : STA.W $0F94,X 

.return:
    RTL 


.pointers:
    dw RunToLeftRunUpPoint 
    dw RunToRightRunUpPoint 
    dw HopAtCenterRunUpPoint 

RunToLeftRunUpPoint:
    TYX 
    LDA.W #Function_Etecoon_RunToLeftRunUpPoint : STA.W $0FB2,X 
    LDA.W #InstList_Etecoon_RunningLeft : STA.W $0F92,X 
    LDA.W EtecoonConstants_XVelocityLeft : STA.W $0FAC,X 
    LDA.W EtecoonConstants_XVelocityLeft+2 : STA.W $0FAE,X 
    RTS 


RunToRightRunUpPoint:
    TYX 
    LDA.W #Function_Etecoon_RunToRightRunUpPoint : STA.W $0FB2,X 
    LDA.W #InstList_Etecoon_RunningRight : STA.W $0F92,X 
    LDA.W EtecoonConstants_XVelocityRight : STA.W $0FAC,X 
    LDA.W EtecoonConstants_XVelocityRight+2 : STA.W $0FAE,X 
    RTS 


HopAtCenterRunUpPoint:
    TYX 
    LDA.W #Function_Etecoon_Hopping_TopOfRoom : STA.W $0FB2,X 
    LDA.W $0F92,X 
    INC #2
    STA.W $0F92,X 
    LDA.W EtecoonConstants_XVelocityRight : STA.W $0FAC,X 
    LDA.W EtecoonConstants_XVelocityRight+2 : STA.W $0FAE,X 
    RTS 


Function_Etecoon_RunToLeftRunUpPoint:
    JSR.W EtecoonHorizontalMovement 
    LDA.W $0F7A,X : CMP.W #$0219 : BPL .return 
    LDA.W #$000B : STA.W $0FB0,X 
    LDA.W #Function_Etecoon_StartHop_TopOfRoom : STA.W $0FB2,X 
    LDA.W #$0001 : STA.W $0F94,X 
    LDA.W #InstList_Etecoon_Hopping_FacingLeft : STA.W $0F92,X 

.return:
    RTL 


Function_Etecoon_RunToRightRunUpPoint:
    JSR.W EtecoonHorizontalMovement 
    LDA.W $0F7A,X : CMP.W #$0258 : BMI .return 
    LDA.W #$000B : STA.W $0FB0,X 
    LDA.W #Function_Etecoon_StartHop_TopOfRoom : STA.W $0FB2,X 
    LDA.W #$0001 : STA.W $0F94,X 
    LDA.W #InstList_Etecoon_Hopping_FacingLeft : STA.W $0F92,X 

.return:
    RTL 


Function_Etecoon_RunningForSuccessfulMorphTunnelJump:
    JSR.W EtecoonHorizontalMovement 
    LDA.W $0F7A,X : CMP.W #$0258 : BMI .return 
    LDA.W #Function_Etecoon_SuccessfulMorphTunnelJump : STA.W $0FB2,X 
    LDA.W EtecoonConstants_initialYVelocityOfSuccessfulJump : STA.W $0FA8,X 
    LDA.W EtecoonConstants_initialYVelocityOfSuccessfulJump+2 : STA.W $0FAA,X 
    LDA.W #$0001 : STA.W $0F94,X 
    LDA.W #InstList_Etecoon_JumpingRight : STA.W $0F92,X 

.return:
    RTL 


Function_Etecoon_SuccessfulMorphTunnelJump:
    JSR.W EtecoonHorizontalMovement 
    JSR.W EtecoonVerticalMovement 
    LDA.W $0F7A,X : CMP.W #$02A8 : BMI .return 
    LDA.W #$0001 : STA.W $0F94,X 
    LDA.W #InstList_Etecoon_RunningRight : STA.W $0F92,X 
    LDA.W #Function_Etecoon_RunningThroughMorphTunnel : STA.W $0FB2,X 

.return:
    RTL 


Function_Etecoon_RunningThroughMorphTunnel:
    JSR.W EtecoonHorizontalMovement 
    LDA.W $0F7A,X : CMP.W #$0348 : BMI .return 
    LDA.W #$0001 : STA.W $0F94,X 
    LDA.W #InstList_Etecoon_JumpingRight : STA.W $0F92,X 
    LDA.W #Function_Etecoon_FallingFromMorphTunnelLedge : STA.W $0FB2,X 
    LDA.W #$FFFF : STA.W $0FA8,X 
    LDA.W EtecoonConstants_initialYVelocityOfSuccessfulJump+2 : STA.W $0FAA,X 

.return:
    RTL 


Function_Etecoon_FallingFromMorphTunnelLedge:
    JSR.W EtecoonHorizontalMovement 
    JSR.W EtecoonVerticalMovement 
    BCC .return 
    LDA.W #$000B : STA.W $0FB0,X 
    LDA.W #$0001 : STA.W $0F94,X 
    LDA.W #InstList_Etecoon_Hopping_FacingLeft : STA.W $0F92,X 
    LDA.W #Function_Etecoon_StartHop_TopOfRoom : STA.W $0FB2,X 

.return:
    RTL 


Function_Etecoon_Hopping_TopOfRoom:
    JSR.W FreezeEtecoonIfQuakeActive 
    JSR.W EtecoonVerticalMovement 
    BCS .collision 
    RTL 


.collision:
    LDA.W $0FA8,X : BPL .rising 
    STZ.W $0FA8,X 
    STZ.W $0FAA,X 
    LDA.W #$0003 : STA.W $0F94,X 
    LDA.W #InstList_Etecoon_HitCeiling : STA.W $0F92,X 
    RTL 


.rising:
    LDA.W #$000B : STA.W $0FB0,X 
    LDA.W #$0001 : STA.W $0F94,X 
    LDA.W #InstList_Etecoon_Hopping_FacingLeft : STA.W $0F92,X 
    LDA.W $0FB6,X : BIT.W #$0002 
    BNE .successEtecoon 

.hop:
    LDA.W #Function_Etecoon_StartHop_TopOfRoom : STA.W $0FB2,X 
    BRA .return 


.successEtecoon:
    LDA.W $0F7A,X : CMP.W #$0340 : BPL .hop 
    LDA.W #Function_Etecoon_HopUntilSamusIsNear : STA.W $0FB2,X 

.return:
    RTL 


Function_Etecoon_StartHop_TopOfRoom:
    JSR.W FreezeEtecoonIfQuakeActive 
    DEC.W $0FB0,X 
    BEQ .timerExpired 
    BPL .return 

.timerExpired:
    LDA.W $0FB4,X : CLC : ADC.W #$0100 : STA.W $0FB4,X 
    AND.W #$FF00 
    CMP.W #$0400 : BMI .notFailedJump 
    LDA.W $0FB4,X : AND.W #$00FF : STA.W $0FB4,X 
    LDA.W $0FB6,X : BIT.W #$0002 
    BNE .notFailedJump 
    LDA.W #Function_Etecoon_RunningForFailedMorphTunnelJump : STA.W $0FB2,X 
    LDA.W #InstList_Etecoon_RunningRight : STA.W $0F92,X 
    LDA.W EtecoonConstants_XVelocityRight : STA.W $0FAC,X 
    LDA.W EtecoonConstants_XVelocityRight+2 : STA.W $0FAE,X 
    BRA .merge 


.notFailedJump:
    LDA.W #Function_Etecoon_Hopping_TopOfRoom : STA.W $0FB2,X 
    LDA.W $0F92,X 
    INC #2
    STA.W $0F92,X 

.merge:
    LDA.W EtecoonConstants_initialYVelocityOfHopsAndFailedJumps : STA.W $0FA8,X 
    LDA.W EtecoonConstants_initialYVelocityOfHopsAndFailedJumps+2 : STA.W $0FAA,X 
    LDA.W #$0001 : STA.W $0F94,X 
    LDA.W $0AF6 : CMP.W #$0100 : BMI .return 
    LDA.W #$0033 : JSL.L QueueSound_Lib2_Max6 

.return:
    RTL 


Function_Etecoon_HopUntilSamusIsNear:
    JSR.W FreezeEtecoonIfQuakeActive 
    DEC.W $0FB0,X 
    BEQ .timerExpired 
    BPL .return 

.timerExpired:
    LDA.W #$0040 : JSL.L IsSamusWithingAPixelRowsOfEnemy 
    TAY 
    BEQ .notClose 
    LDA.W #$0030 : JSL.L IsSamusWithinAPixelColumnsOfEnemy 
    TAY 
    BEQ .notClose 
    LDA.W #InstList_Etecoon_RunningRight : STA.W $0F92,X 
    LDA.W #Function_Etecoon_RunningForSuccessfulMorphTunnelJump : STA.W $0FB2,X 
    BRA .skipSFX 


.notClose:
    LDA.W EtecoonConstants_initialYVelocityOfHopsAndFailedJumps : STA.W $0FA8,X 
    LDA.W EtecoonConstants_initialYVelocityOfHopsAndFailedJumps+2 : STA.W $0FAA,X 
    LDA.W $0F92,X 
    INC #2
    STA.W $0F92,X 
    LDA.W #Function_Etecoon_Hopping_TopOfRoom : STA.W $0FB2,X 
    LDA.W $0AF6 : CMP.W #$0100 : BMI .skipSFX 
    LDA.W #$0033 : JSL.L QueueSound_Lib2_Max6 

.skipSFX:
    LDA.W #$0001 : STA.W $0F94,X 

.return:
    RTL 


Function_Etecoon_RunningForFailedMorphTunnelJump:
    JSR.W EtecoonHorizontalMovement 
    LDA.W $0F7A,X : CMP.W #$0258 : BMI .return 
    LDA.W #Function_Etecoon_FailedTunnelJump : STA.W $0FB2,X 
    LDA.W #$0001 : STA.W $0F94,X 
    LDA.W #InstList_Etecoon_JumpingRight : STA.W $0F92,X 

.return:
    RTL 


Function_Etecoon_FailedTunnelJump:
    JSR.W EtecoonHorizontalMovement 
    JSR.W EtecoonVerticalMovement 
    BCC .return 
    LDA.W EtecoonConstants_XVelocityLeft : STA.W $0FAC,X 
    LDA.W EtecoonConstants_XVelocityLeft+2 : STA.W $0FAE,X 
    LDA.W #Function_Etecoon_RunningLeft : STA.W $0FB2,X 
    LDA.W EtecoonConstants_initialYVelocityOfHopsAndFailedJumps : STA.W $0FA8,X 
    LDA.W EtecoonConstants_initialYVelocityOfHopsAndFailedJumps+2 : STA.W $0FAA,X 
    LDA.W #$0001 : STA.W $0F94,X 
    LDA.W #InstList_Etecoon_RunningLeft : STA.W $0F92,X 

.return:
    RTL 


RTL_A7EEEB:
    RTL 


RTL_A7EEEC:
    RTL 


Spritemap_Etecoon_0:
    dw $0003,$01F2 
    db $FF 
    dw $3329,$C3F5 
    db $EF 
    dw $3300,$C3FA 
    db $F7 
    dw $3302 

Spritemap_Etecoon_1:
    dw $0002,$C3F5 
    db $F0 
    dw $3300,$C3FA 
    db $F8 
    dw $3304 

Spritemap_Etecoon_2:
    dw $0002,$C3F5 
    db $F1 
    dw $3300,$C3FA 
    db $F9 
    dw $3306 

Spritemap_Etecoon_3:
    dw $0003,$0000 
    db $06 
    dw $3326,$01F8 
    db $06 
    dw $3325,$C3F8 
    db $F6 
    dw $3308 

Spritemap_Etecoon_4:
    dw $0003,$0006 
    db $F8 
    dw $3327,$0006 
    db $00 
    dw $3328,$C3F6 
    db $F8 
    dw $330A 

Spritemap_Etecoon_5:
    dw $0003,$0000 
    db $F2 
    dw $B326,$01F8 
    db $F2 
    dw $B325,$C3F8 
    db $FA 
    dw $F308 

Spritemap_Etecoon_6:
    dw $0003,$01F2 
    db $F8 
    dw $7327,$01F2 
    db $00 
    dw $7328,$C3FA 
    db $F8 
    dw $F30A 

Spritemap_Etecoon_7:
    dw $0003,$0008 
    db $02 
    dw $332E,$C3F3 
    db $F3 
    dw $3300,$C3F8 
    db $FA 
    dw $330E 

Spritemap_Etecoon_8:
    dw $0007,$0001 
    db $FE 
    dw $7322,$01F8 
    db $FE 
    dw $3322,$C3F8 
    db $F2 
    dw $730C,$01F9 
    db $01 
    dw $3324,$0000 
    db $01 
    dw $7324,$01F9 
    db $FA 
    dw $3320,$0000 
    db $FA 
    dw $7320 

Spritemap_Etecoon_9:
    dw $0007,$01F7 
    db $FC 
    dw $3322,$0002 
    db $FC 
    dw $7322,$C3F8 
    db $F1 
    dw $730C,$01F9 
    db $01 
    dw $3323,$0000 
    db $01 
    dw $7323,$01F9 
    db $FA 
    dw $3320,$0000 
    db $FA 
    dw $7320 

Spritemap_Etecoon_A:
    dw $0007,$01F9 
    db $01 
    dw $3323,$0000 
    db $01 
    dw $7323,$C3F8 
    db $EF 
    dw $730C,$01F9 
    db $F9 
    dw $3320,$0000 
    db $F9 
    dw $7320,$01F5 
    db $F9 
    dw $3321,$0004 
    db $F9 
    dw $7321 

Spritemap_Etecoon_B:
    dw $0007,$01F9 
    db $01 
    dw $3323,$0000 
    db $01 
    dw $7323,$C3F8 
    db $EF 
    dw $730C,$01F9 
    db $F9 
    dw $3320,$0000 
    db $F9 
    dw $7320,$01F5 
    db $F7 
    dw $3321,$0004 
    db $F7 
    dw $7321 

Spritemap_Etecoon_C:
    dw $0007,$C3F8 
    db $F0 
    dw $3300,$0002 
    db $FC 
    dw $7322,$01F7 
    db $FC 
    dw $3322,$01F9 
    db $02 
    dw $3324,$0000 
    db $02 
    dw $7324,$01F9 
    db $FA 
    dw $3320,$0000 
    db $FA 
    dw $7320 

Spritemap_Etecoon_D:
    dw $0007,$0002 
    db $FC 
    dw $7322,$01F7 
    db $FC 
    dw $3322,$C3F8 
    db $F0 
    dw $730C,$01F9 
    db $02 
    dw $3324,$0000 
    db $02 
    dw $7324,$01F9 
    db $FA 
    dw $3320,$0000 
    db $FA 
    dw $7320 

Spritemap_Etecoon_E:
    dw $0007,$C3F8 
    db $F0 
    dw $7300,$0002 
    db $FC 
    dw $7322,$01F7 
    db $FC 
    dw $3322,$01F9 
    db $02 
    dw $3324,$0000 
    db $02 
    dw $7324,$01F9 
    db $FA 
    dw $3320,$0000 
    db $FA 
    dw $7320 

Spritemap_Etecoon_F:
    dw $0005,$C3F6 
    db $F2 
    dw $3300,$0000 
    db $00 
    dw $332D,$01F8 
    db $00 
    dw $332C,$0000 
    db $F8 
    dw $332B,$01F8 
    db $F8 
    dw $332A 

Spritemap_Etecoon_10:
    dw $0003,$0006 
    db $FF 
    dw $7329,$C3FB 
    db $EF 
    dw $7300,$C3F6 
    db $F7 
    dw $7302 

Spritemap_Etecoon_11:
    dw $0002,$C3FB 
    db $F0 
    dw $7300,$C3F6 
    db $F8 
    dw $7304 

Spritemap_Etecoon_12:
    dw $0002,$C3FB 
    db $F1 
    dw $7300,$C3F6 
    db $F9 
    dw $7306 

Spritemap_Etecoon_13:
    dw $0003,$01F8 
    db $06 
    dw $7326,$0000 
    db $06 
    dw $7325,$C3F8 
    db $F6 
    dw $7308 

Spritemap_Etecoon_14:
    dw $0003,$01F2 
    db $F8 
    dw $7327,$01F2 
    db $00 
    dw $7328,$C3FA 
    db $F8 
    dw $730A 

Spritemap_Etecoon_15:
    dw $0003,$01F8 
    db $F2 
    dw $F326,$0000 
    db $F2 
    dw $F325,$C3F8 
    db $FA 
    dw $B308 

Spritemap_Etecoon_16:
    dw $0003,$0006 
    db $F8 
    dw $3327,$0006 
    db $00 
    dw $3328,$C3F6 
    db $F8 
    dw $B30A 

Spritemap_Etecoon_17:
    dw $0003,$01F0 
    db $02 
    dw $732E,$C3FD 
    db $F3 
    dw $7300,$C3F8 
    db $FA 
    dw $730E 

Spritemap_Etecoon_18:
    dw $0007,$01F7 
    db $FE 
    dw $3322,$0000 
    db $FE 
    dw $7322,$C3F8 
    db $F2 
    dw $330C,$01FF 
    db $01 
    dw $7324,$01F8 
    db $01 
    dw $3324,$01FF 
    db $FA 
    dw $7320,$01F8 
    db $FA 
    dw $3320 

Spritemap_Etecoon_19:
    dw $0007,$0001 
    db $FC 
    dw $7322,$01F6 
    db $FC 
    dw $3322,$C3F8 
    db $F1 
    dw $330C,$01FF 
    db $01 
    dw $7323,$01F8 
    db $01 
    dw $3323,$01FF 
    db $FA 
    dw $7320,$01F8 
    db $FA 
    dw $3320 

Spritemap_Etecoon_1A:
    dw $0007,$01FF 
    db $01 
    dw $7323,$01F8 
    db $01 
    dw $3323,$C3F8 
    db $EF 
    dw $330C,$01FF 
    db $F9 
    dw $7320,$01F8 
    db $F9 
    dw $3320,$0003 
    db $F9 
    dw $7321,$01F4 
    db $F9 
    dw $3321 

Spritemap_Etecoon_1B:
    dw $0007,$01FF 
    db $01 
    dw $7323,$01F8 
    db $01 
    dw $3323,$C3F8 
    db $EF 
    dw $330C,$01FF 
    db $F9 
    dw $7320,$01F8 
    db $F9 
    dw $3320,$0003 
    db $F7 
    dw $7321,$01F4 
    db $F7 
    dw $3321 

Spritemap_Etecoon_1C:
    dw $0007,$C3F8 
    db $F0 
    dw $7300,$01F6 
    db $FC 
    dw $3322,$0001 
    db $FC 
    dw $7322,$01FF 
    db $02 
    dw $7324,$01F8 
    db $02 
    dw $3324,$01FF 
    db $FA 
    dw $7320,$01F8 
    db $FA 
    dw $3320 

Spritemap_Etecoon_1D:
    dw $0007,$01F6 
    db $FC 
    dw $3322,$0001 
    db $FC 
    dw $7322,$C3F8 
    db $F0 
    dw $330C,$01FF 
    db $02 
    dw $7324,$01F8 
    db $02 
    dw $3324,$01FF 
    db $FA 
    dw $7320,$01F8 
    db $FA 
    dw $3320 

Spritemap_Etecoon_1E:
    dw $0007,$C3F8 
    db $F0 
    dw $3300,$01F6 
    db $FC 
    dw $3322,$0001 
    db $FC 
    dw $7322,$01FF 
    db $02 
    dw $7324,$01F8 
    db $02 
    dw $3324,$01FF 
    db $FA 
    dw $7320,$01F8 
    db $FA 
    dw $3320 

Spritemap_Etecoon_1F:
    dw $0005,$C3FA 
    db $F2 
    dw $7300,$01F8 
    db $00 
    dw $732D,$0000 
    db $00 
    dw $732C,$01F8 
    db $F8 
    dw $732B,$0000 
    db $F8 
    dw $732A 

Palette_Dachora:
    dw $3800,$3F57,$2E4D,$00E2,$0060,$3AB0,$220B,$1166 
    dw $0924,$57FF,$42F7,$2610,$158C,$7C1F,$6018,$300A 

Palette_Dachora_SpeedBoosting_0:
    dw $1580,$3F57,$2E4D,$00E2,$0060,$3AB0,$220B,$1166 
    dw $0924,$57FF,$42F7,$2610,$158C,$7C1F,$6018,$300A 

Palette_Dachora_SpeedBoosting_1:
    dw $3800,$5357,$424D,$14E2,$1460,$4EB0,$360B,$2566 
    dw $1D24,$63FF,$56F7,$3A10,$298C,$7C1F,$6818,$440A 

Palette_Dachora_SpeedBoosting_2:
    dw $3800,$6B57,$5A4D,$2CE2,$2C60,$66B0,$4E0B,$3D66 
    dw $3524,$73FF,$6AF7,$5210,$418C,$7C1F,$7418,$5C0A 

Palette_Dachora_SpeedBoosting_3:
    dw $3800,$7F57,$6E4D,$40E2,$4060,$7AB0,$620B,$5166 
    dw $4924,$7FFF,$7EF7,$6610,$558C,$7C1F,$7C18,$700A 

Palette_Dachora_Shine_0:
    dw $3800,$3F57,$2E4D,$00E2,$0060,$3AB0,$220B,$1166 
    dw $0924,$57FF,$42F7,$2610,$158C,$7C1F,$6018,$300A 

Palette_Dachora_Shine_1:
    dw $3800,$4B78,$3E90,$1967,$1906,$46F3,$326F,$25EB 
    dw $1DA9,$5FFF,$4F18,$3673,$29EF,$7CDF,$64D9,$3CCE 

Palette_Dachora_Shine_2:
    dw $3800,$579A,$4EF4,$320D,$31CC,$5336,$46D3,$3A70 
    dw $362E,$67FF,$5B5A,$46D6,$3E73,$7D9F,$699A,$4D92 

Palette_Dachora_Shine_3:
    dw $3800,$63BB,$5F37,$4AB3,$4A72,$6379,$5737,$52F5 
    dw $4ED4,$6FFF,$677B,$5B39,$52F7,$7E5F,$725C,$5E56 

InstList_Dachora_RunningLeft:
    dw $0005 
    dw Spritemap_Dachora_0 
    dw $0005 
    dw Spritemap_Dachora_1 
    dw $0005 
    dw Spritemap_Dachora_2 
    dw $0005 
    dw Spritemap_Dachora_3 
    dw $0005 
    dw Spritemap_Dachora_4 
    dw $0005 
    dw Spritemap_Dachora_5 
    dw Instruction_Common_GotoY 
    dw InstList_Dachora_RunningLeft 

InstList_Dachora_RunningLeft_FastAnimation:
    dw $0003 
    dw Spritemap_Dachora_0 
    dw $0003 
    dw Spritemap_Dachora_1 
    dw $0003 
    dw Spritemap_Dachora_2 
    dw $0003 
    dw Spritemap_Dachora_3 
    dw $0003 
    dw Spritemap_Dachora_4 
    dw $0003 
    dw Spritemap_Dachora_5 
    dw Instruction_Common_GotoY 
    dw InstList_Dachora_RunningLeft_FastAnimation 

InstList_Dachora_RunningLeft_VeryFastAnimation:
    dw $0001 
    dw Spritemap_Dachora_0 
    dw $0001 
    dw Spritemap_Dachora_1 
    dw $0001 
    dw Spritemap_Dachora_2 
    dw $0001 
    dw Spritemap_Dachora_3 
    dw $0001 
    dw Spritemap_Dachora_4 
    dw $0001 
    dw Spritemap_Dachora_5 
    dw Instruction_Common_GotoY 
    dw InstList_Dachora_RunningLeft_VeryFastAnimation 

InstList_Dachora_Idling_FacingLeft:
    dw $0030 
    dw Spritemap_Dachora_8 
    dw $000A 
    dw Spritemap_Dachora_B 
    dw $0007 
    dw Spritemap_Dachora_C 
    dw $0007 
    dw Spritemap_Dachora_D 
    dw $0007 
    dw Spritemap_Dachora_E 
    dw $0007 
    dw Spritemap_Dachora_D 
    dw $0007 
    dw Spritemap_Dachora_C 
    dw $0007 
    dw Spritemap_Dachora_D 
    dw $0007 
    dw Spritemap_Dachora_E 
    dw $0007 
    dw Spritemap_Dachora_D 
    dw $000A 
    dw Spritemap_Dachora_B 
    dw Instruction_Common_GotoY 
    dw InstList_Dachora_Idling_FacingLeft 

InstList_Dachora_Blinking_FacingLeft:
    dw $000B 
    dw Spritemap_Dachora_8 
    dw $0008 
    dw Spritemap_Dachora_9 
    dw $0008 
    dw Spritemap_Dachora_A 
    dw $0004 
    dw Spritemap_Dachora_8 
    dw $0004 
    dw Spritemap_Dachora_9 
    dw $0004 
    dw Spritemap_Dachora_A 
    dw $000A 
    dw Spritemap_Dachora_8 
    dw $0005 
    dw Spritemap_Dachora_9 
    dw $000B 
    dw Spritemap_Dachora_A 
    dw Instruction_Common_GotoY 
    dw InstList_Dachora_Blinking_FacingLeft 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_Dachora_ChargeShinespark_FacingLeft_A7F3F1:
    dw $0001 
    dw Spritemap_Dachora_6 
    dw Instruction_Common_Sleep 
endif ; !FEATURE_KEEP_UNREFERENCED

InstList_Dachora_Echo_FacingLeft:
    dw $000A 
    dw Spritemap_Dachora_7 
    dw Instruction_Common_GotoY 
    dw InstList_Dachora_Echo_FacingLeft 

InstList_Dachora_Falling_FacingLeft:
    dw $0005 
    dw Spritemap_Dachora_4 
    dw Instruction_Common_GotoY 
    dw InstList_Dachora_Falling_FacingLeft 

InstList_Dachora_RunningRight:
    dw $0005 
    dw Spritemap_Dachora_F 
    dw $0005 
    dw Spritemap_Dachora_10 
    dw $0005 
    dw Spritemap_Dachora_11 
    dw $0005 
    dw Spritemap_Dachora_12 
    dw $0005 
    dw Spritemap_Dachora_13 
    dw $0005 
    dw Spritemap_Dachora_14 
    dw Instruction_Common_GotoY 
    dw InstList_Dachora_RunningRight 

InstList_Dachora_RunningRight_FastAnimation:
    dw $0003 
    dw Spritemap_Dachora_F 
    dw $0003 
    dw Spritemap_Dachora_10 
    dw $0003 
    dw Spritemap_Dachora_11 
    dw $0003 
    dw Spritemap_Dachora_12 
    dw $0003 
    dw Spritemap_Dachora_13 
    dw $0003 
    dw Spritemap_Dachora_14 
    dw Instruction_Common_GotoY 
    dw InstList_Dachora_RunningRight_FastAnimation 

InstList_Dachora_RunningRight_VeryFastAnimation:
    dw $0001 
    dw Spritemap_Dachora_F 
    dw $0001 
    dw Spritemap_Dachora_10 
    dw $0001 
    dw Spritemap_Dachora_11 
    dw $0001 
    dw Spritemap_Dachora_12 
    dw $0001 
    dw Spritemap_Dachora_13 
    dw $0001 
    dw Spritemap_Dachora_14 
    dw Instruction_Common_GotoY 
    dw InstList_Dachora_RunningRight_VeryFastAnimation 

InstList_Dachora_Idling_FacingRight:
    dw $0030 
    dw Spritemap_Dachora_17 
    dw $000A 
    dw Spritemap_Dachora_1A 
    dw $0007 
    dw Spritemap_Dachora_1B 
    dw $0007 
    dw Spritemap_Dachora_1C 
    dw $0007 
    dw Spritemap_Dachora_1D 
    dw $0007 
    dw Spritemap_Dachora_1C 
    dw $0007 
    dw Spritemap_Dachora_1B 
    dw $0007 
    dw Spritemap_Dachora_1C 
    dw $0007 
    dw Spritemap_Dachora_1D 
    dw $0007 
    dw Spritemap_Dachora_1C 
    dw $000A 
    dw Spritemap_Dachora_1A 
    dw Instruction_Common_GotoY 
    dw InstList_Dachora_Idling_FacingRight 

InstList_Dachora_Blinking_FacingRight:
    dw $000B 
    dw Spritemap_Dachora_17 
    dw $0008 
    dw Spritemap_Dachora_18 
    dw $0008 
    dw Spritemap_Dachora_19 
    dw $0004 
    dw Spritemap_Dachora_17 
    dw $0004 
    dw Spritemap_Dachora_18 
    dw $0004 
    dw Spritemap_Dachora_19 
    dw $000A 
    dw Spritemap_Dachora_17 
    dw $0005 
    dw Spritemap_Dachora_18 
    dw $000B 
    dw Spritemap_Dachora_19 
    dw Instruction_Common_GotoY 
    dw InstList_Dachora_Blinking_FacingRight 

InstList_Dachora_ChargeShinespark_FacingRight:
    dw $0001 
    dw Spritemap_Dachora_15 
    dw Instruction_Common_Sleep 

InstList_Dachora_Echo_FacingRight:
    dw $000A 
    dw Spritemap_Dachora_16 
    dw Instruction_Common_GotoY 
    dw InstList_Dachora_Echo_FacingRight 

InstList_Dachora_Falling_FacingRight:
    dw $0005 
    dw Spritemap_Dachora_13 
    dw Instruction_Common_GotoY 
    dw InstList_Dachora_Falling_FacingRight 

DachoraConstants_SamusProximityXThreshold:
    dw $0060 

UNUSED_DachoraConstants_maxXDistanceFromSamusToStop_A7F4CB:
    dw $0060 

DachoraConstants_blinkingDuration:
    dw $0078 

DachoraConstants_delayBeforeActivatingShinespark:
    dw $003C 

DachoraConstants_echoPositionUpdateInterval:
    dw $0001 

DachoraConstants_echoLifetime:
    dw $0008 

DachoraConstants_maxXSpeed:
    dw $0008,$0000 

DachoraConstants_XAcceleration:
    dw $0000,$1000 

InitAI_Dachora:
    LDX.W $0E54 
    LDA.W $0F86,X : ORA.W #$2000 : STA.W $0F86,X 
    LDA.W #Spritemap_CommonA7_Nothing : STA.W $0F8E,X 
    LDA.W #$0001 : STA.W $0F94,X 
    STZ.W $0F90,X 
    LDA.W $0FB4,X : BMI .echo 
    BEQ .left 
    LDA.W #InstList_Dachora_Idling_FacingRight : STA.W $0F92,X 
    BRA + 


.left:
    LDA.W #InstList_Dachora_Idling_FacingLeft : STA.W $0F92,X 

  + LDA.W #Function_Dachora_WaitForSamusToBeNear : STA.W $0FB2,X 
    RTL 


.echo:
    BIT.W #$0001 
    BEQ ..left 
    LDA.W #InstList_Dachora_Echo_FacingRight : STA.W $0F92,X 
    BRA + 


..left:
    LDA.W #InstList_Dachora_Echo_FacingLeft : STA.W $0F92,X 

  + LDA.W #Function_Dachora_Echo : STA.W $0FB2,X 
    RTL 


MainAI_Dachora:
    LDX.W $0E54 
    JMP.W ($0FB2,X) 


RTL_A7F534:
    RTL 


LoadDachoraPalette:
    PHP 
    REP #$30 
    PHX 
    LDA.W #$7E00 : STA.B $01 
    LDA.W $0F96,X 
    XBA 
    LSR A 
    ASL A 
    TAX 
    LDA.W .pointers,X : STA.B $00 
    TYX 
    LDY.W #$0000 

.loop:
    LDA.W $0000,X : STA.B [$00],Y 
    INX #2
    INY #2
    CPY.W #$0020 
    BMI .loop 
    PLX : PLP 
    RTS 


.pointers:
    dw $C100 
    dw $C120 
    dw $C140 
    dw $C160 
    dw $C180 
    dw $C1A0 
    dw $C1C0 
    dw $C1E0 

RTL_A7F56F:
    RTL 


Function_Dachora_WaitForSamusToBeNear:
    LDA.W #$0001 : STA.B $14 
    STZ.B $12 
    JSL.L MoveEnemyDownBy_14_12 
    LDA.W #$0040 : JSL.L IsSamusWithingAPixelRowsOfEnemy 
    TAY 
    BEQ .return 
    LDA.W DachoraConstants_SamusProximityXThreshold : JSL.L IsSamusWithinAPixelColumnsOfEnemy 
    TAY 
    BEQ .return 
    LDA.W $0FB4,X : BEQ .left 
    LDA.W #InstList_Dachora_Blinking_FacingRight : STA.W $0F92,X 
    BRA + 


.left:
    LDA.W #InstList_Dachora_Blinking_FacingLeft : STA.W $0F92,X 

  + LDA.W #$0001 : STA.W $0F94,X 
    LDA.W #Function_Dachora_StartRunning : STA.W $0FB2,X 
    LDA.W DachoraConstants_blinkingDuration : STA.W $0FA8,X 
    LDA.W #$001D : JSL.L QueueSound_Lib2_Max15 

.return:
    RTL 


Function_Dachora_StartRunning:
    DEC.W $0FA8,X 
    BNE .return 
    LDA.W $0FB4,X : BEQ .left 
    LDA.W #InstList_Dachora_RunningRight : STA.W $0F92,X 
    LDA.W #Function_Dachora_RunningRight : STA.W $0FB2,X 
    BRA + 


.left:
    LDA.W #InstList_Dachora_RunningLeft : STA.W $0F92,X 
    LDA.W #Function_Dachora_RunningLeft : STA.W $0FB2,X 

  + LDA.W #$0001 : STA.W $0F94,X 
    LDA.W #$0001 : STA.W $0FB0,X 

.return:
    RTL 


Function_Dachora_RunningLeft:
    JSR.W AccelerateRunningDachora 
    LDA.B $14 : EOR.W #$FFFF : STA.B $14 
    LDA.B $12 
    EOR.W #$FFFF 
    INC A 
    STA.B $12 
    BNE + 
    INC.B $14 

  + JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes 
    BCS .stop 
    JSL.L AlignEnemyYPositionWIthNonSquareSlope 
    BRA .noWall 


.stop:
    LDA.W #InstList_Dachora_RunningRight : STA.W $0F92,X 
    LDA.W #Function_Dachora_RunningRight : STA.W $0FB2,X 
    LDA.W #$0001 : STA.W $0FB0,X 

.merge:
    LDA.W #$0001 : STA.W $0FB4,X 
    LDA.W #$0001 : STA.W $0F94,X 
    STZ.W $0FA8,X 
    STZ.W $0FAA,X 
    LDY.W #Palette_Dachora 
    JSR.W LoadDachoraPalette 
    RTL 


.noWall:
    LDA.W $0F7A,X : CMP.W #$0060 : BMI .stop 
    RTL 

    LDA.W UNUSED_DachoraConstants_maxXDistanceFromSamusToStop_A7F4CB ; dead code
    JSL.L IsSamusWithinAPixelColumnsOfEnemy 
    TAY 
    BNE .stop 
    LDA.W #InstList_Dachora_Idling_FacingRight : STA.W $0F92,X 
    LDA.W #Function_Dachora_WaitForSamusToBeNear : STA.W $0FB2,X 
    STZ.W $0FB0,X 
    BRA .merge 


Function_Dachora_RunningRight:
    JSR.W AccelerateRunningDachora 
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes 
    BCS .collision 
    JSL.L AlignEnemyYPositionWIthNonSquareSlope 
    BRA .noWall 


.collision:
    LDA.W #$0071 : JSL.L QueueSound_Lib2_Max15 
    LDA.W #InstList_Dachora_RunningLeft : STA.W $0F92,X 
    LDA.W #Function_Dachora_RunningLeft : STA.W $0FB2,X 

.merge:
    STZ.W $0FB4,X 
    STZ.W $0FA8,X 
    LDY.W #Palette_Dachora 
    JSR.W LoadDachoraPalette 

.newAnimation:
    STZ.W $0FB0,X 
    STZ.W $0FAA,X 
    LDA.W #$0001 : STA.W $0F94,X 
    RTL 


.noWall:
    LDA.W $0F7A,X : CMP.W #$0480 : BPL + 
    RTL 


  + LDA.W #InstList_Dachora_ChargeShinespark_FacingRight : STA.W $0F92,X 
    LDA.W #Function_Dachora_ActivateShinespark : STA.W $0FB2,X 
    LDA.W DachoraConstants_delayBeforeActivatingShinespark : STA.W $0FA8,X 
    LDA.W $0F7E,X : CLC : ADC.W #$0008 : STA.W $0F7E,X 
    LDA.W #$003D : JSL.L QueueSound_Lib2_Max6 
    BRA .newAnimation 

    LDA.W #InstList_Dachora_Idling_FacingLeft ; dead code
    STA.W $0F92,X 
    LDA.W #Function_Dachora_WaitForSamusToBeNear : STA.W $0FB2,X 
    BRA .merge 


AccelerateRunningDachora:
    LDA.W $0FA8,X : CMP.W DachoraConstants_maxXSpeed : BMI .noPaletteChange 
    LDA.W $0FB0,X : CMP.W #$0001 : BNE .animTimer 
    LDA.W #$0039 : JSL.L QueueSound_Lib2_Max6 

.animTimer:
    LDA.W $0FB0,X 
    DEC A 
    STA.W $0FB0,X 
    AND.W #$00FF 
    BEQ .loadPalette 
    BPL .noPaletteChange 

.loadPalette:
    LDA.W $0FB0,X 
    XBA 
    AND.W #$00FF 
    ASL A 
    TAY 
    LDA.W .pointers,Y 
    TAY 
    JSR.W LoadDachoraPalette 
    LDA.W $0FB0,X : CLC : ADC.W #$0110 : STA.W $0FB0,X 
    CMP.W #$0410 : BMI .noPaletteChange 
    LDA.W #$0310 : STA.W $0FB0,X 

.noPaletteChange:
    LDA.W #$0001 : STA.B $14 
    STZ.B $12 
    JSL.L MoveEnemyDownBy_14_12 
    LDA.W $0FA8,X : CMP.W DachoraConstants_maxXSpeed : BMI .increaseSpeed 
    LDA.W $0FAA,X : CMP.W DachoraConstants_maxXSpeed+2 : BMI .increaseSpeed 
    LDA.W DachoraConstants_maxXSpeed : STA.W $0FA8,X 
    STA.B $14 
    LDA.W DachoraConstants_maxXSpeed+2 : STA.W $0FAA,X 
    STA.B $12 
    BRA .return 


.increaseSpeed:
    LDA.W $0FAA,X : CLC : ADC.W DachoraConstants_XAcceleration+2 : STA.W $0FAA,X 
    STA.B $12 
    LDA.W $0FA8,X : ADC.W DachoraConstants_XAcceleration : STA.W $0FA8,X 
    STA.B $14 
    CMP.W #$0004 : BNE .checkMaxSpeed 
    LDA.B $12 : CMP.W #$0000 : BNE .return 

.maxSpeed:
    LDA.W $0F92,X : CLC : ADC.W #$001C : STA.W $0F92,X 
    RTS 


.checkMaxSpeed:
    CMP.W #$0008 : BNE .return 
    LDA.B $12 : CMP.W #$0000 : BEQ .maxSpeed 

.return:
    RTS 


.pointers:
    dw Palette_Dachora_SpeedBoosting_0 
    dw Palette_Dachora_SpeedBoosting_1 
    dw Palette_Dachora_SpeedBoosting_2 
    dw Palette_Dachora_SpeedBoosting_3 

Function_Dachora_ActivateShinespark:
    JSR.W LoadDachoraShinePalette 
    DEC.W $0FA8,X 
    BNE .return 
    LDA.W $0F92,X 
    INC #2
    STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    LDA.W #Function_Dachora_Shinesparking : STA.W $0FB2,X 
    STZ.W $0FE8,X 
    STZ.W $0FEE,X 
    STZ.W $102E,X 
    STZ.W $106E,X 
    STZ.W $10AE,X 
    STZ.W $0FAC,X 
    STZ.W $0FAE,X 
    LDA.W $0F7E,X : SEC : SBC.W #$0008 : STA.W $0F7E,X 
    LDA.W #$003B : JSL.L QueueSound_Lib2_Max6 
    LDA.W $0FB4,X : BEQ .left 
    LDA.W #InstList_Dachora_Echo_FacingRight : STA.W $0FD2,X 
    STA.W $1012,X 
    STA.W $1052,X 
    STA.W $1092,X 
    BRA + 


.left:
    LDA.W #InstList_Dachora_Echo_FacingLeft : STA.W $0FD2,X 
    STA.W $1012,X 
    STA.W $1052,X 
    STA.W $1092,X 

  + LDA.W #$0001 : STA.W $0FD4,X 
    STA.W $1014,X 
    STA.W $1054,X 
    STA.W $1094,X 

.return:
    RTL 


Function_Dachora_Shinesparking:
    JSR.W LoadDachoraShinePalette 
    JSR.W UpdateDachoraEchoPositions 
    LDA.W $0FAE,X : CLC : ADC.L $000B32 : STA.W $0FAE,X 
    LDA.W $0FAC,X : ADC.L $000B34 : STA.W $0FAC,X 
    LDA.W $0FAA,X : CLC : ADC.W $0FAE,X : STA.W $0FAA,X 
    STA.B $12 
    LDA.W $0FA8,X : ADC.W $0FAC,X : STA.W $0FA8,X 
    STA.B $14 
    CMP.W #$000F : BMI + 
    LDA.W #$000F : STA.B $14 

  + LDA.B $14 : EOR.W #$FFFF : STA.B $14 
    LDA.B $12 
    EOR.W #$FFFF 
    INC A 
    STA.B $12 
    BNE .move 
    INC.B $14 

.move:
    JSL.L MoveEnemyDownBy_14_12 
    BCC .return 
    LDA.W $0FB4,X : BNE .right 
    LDA.W #InstList_Dachora_Falling_FacingRight : STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0FB4,X 
    BRA + 


.right:
    LDA.W #InstList_Dachora_Falling_FacingLeft : STA.W $0F92,X 
    STZ.W $0FB4,X 

  + LDA.W #Function_Dachora_Falling : STA.W $0FB2,X 
    LDA.W #$0001 : STA.W $0F94,X 
    STZ.W $0FA8,X 
    STZ.W $0FAA,X 
    STZ.W $0FB0,X 
    LDY.W #Palette_Dachora 
    JSR.W LoadDachoraPalette 
    LDA.W #$003C : JSL.L QueueSound_Lib2_Max6 

.return:
    RTL 


UpdateDachoraEchoPositions:
    LDA.W $0FE8,X : BEQ .timerExpired 
    DEC A 
    STA.W $0FE8,X 
    RTS 


.timerExpired:
    LDA.W DachoraConstants_echoPositionUpdateInterval : STA.W $0FE8,X 
    LDA.W $0FEE,X : BNE .echo1 
    LDA.W $0F7A,X : STA.W $0FBA,X 
    LDA.W $0F7E,X : STA.W $0FBE,X 
    LDA.W DachoraConstants_echoLifetime : STA.W $0FEE,X 
    RTS 


.echo1:
    LDA.W $102E,X : BNE .echo2 
    LDA.W $0F7A,X : STA.W $0FFA,X 
    LDA.W $0F7E,X : STA.W $0FFE,X 
    LDA.W DachoraConstants_echoLifetime : STA.W $102E,X 
    RTS 


.echo2:
    LDA.W $106E,X : BNE .echo3 
    LDA.W $0F7A,X : STA.W $103A,X 
    LDA.W $0F7E,X : STA.W $103E,X 
    LDA.W DachoraConstants_echoLifetime : STA.W $106E,X 
    RTS 


.echo3:
    LDA.W $10AE,X : BNE .return 
    LDA.W $0F7A,X : STA.W $107A,X 
    LDA.W $0F7E,X : STA.W $107E,X 
    LDA.W DachoraConstants_echoLifetime : STA.W $10AE,X 

.return:
    RTS 


LoadDachoraShinePalette:
    LDA.W $0FB0,X 
    XBA 
    AND.W #$00FF 
    ASL A 
    TAY 
    LDA.W .pointers,Y 
    TAY 
    JSR.W LoadDachoraPalette 
    LDA.W $0FB0,X : CLC : ADC.W #$0100 : STA.W $0FB0,X 
    CMP.W #$0400 : BMI .return 
    STZ.W $0FB0,X 

.return:
    RTS 


.pointers:
    dw Palette_Dachora_Shine_0 
    dw Palette_Dachora_Shine_1 
    dw Palette_Dachora_Shine_2 
    dw Palette_Dachora_Shine_3 

Function_Dachora_Falling:
    LDA.W $0FAA,X : CLC : ADC.L $000B32 : STA.W $0FAA,X 
    STA.B $12 
    LDA.W $0FA8,X : ADC.L $000B34 : STA.W $0FA8,X 
    STA.B $14 
    CMP.W #$000A : BMI + 
    LDA.W #$000A : STA.B $14 
    STZ.B $12 

  + JSL.L MoveEnemyDownBy_14_12 
    BCC .return 
    LDA.W $0FB4,X : BEQ .left 
    LDA.W #InstList_Dachora_RunningRight : STA.W $0F92,X 
    LDA.W #Function_Dachora_RunningRight : STA.W $0FB2,X 
    BRA + 


.left:
    LDA.W #InstList_Dachora_RunningLeft : STA.W $0F92,X 
    LDA.W #Function_Dachora_RunningLeft : STA.W $0FB2,X 

  + LDA.W #$0001 : STA.W $0F94,X 
    STZ.W $0FA8,X 
    STZ.W $0FAA,X 

.return:
    RTL 


Function_Dachora_Echo:
    LDA.W $0FAE,X : BEQ .invisible 
    DEC A 
    STA.W $0FAE,X 
    TXA 
    BIT.W #$0040 
    BEQ + 
    LDA.W $05B6 : BIT.W #$0001 
    BNE .visible 
    BRA .invisible 


  + LDA.W $05B6 : BIT.W #$0001 
    BEQ .visible 

.invisible:
    LDA.W $0F86,X : ORA.W #$0100 : STA.W $0F86,X 
    BRA .return 


.visible:
    LDA.W $0F86,X : AND.W #$FEFF : STA.W $0F86,X 

.return:
    RTL 


RTL_A7F9C2:
    RTL 


RTL_A7F9C3:
    RTL 


Spritemap_Dachora_0:
    dw $0009,$01F0 
    db $F2 
    dw $3310,$C3F8 
    db $EA 
    dw $3301,$0002 
    db $F7 
    dw $331E,$01FA 
    db $F7 
    dw $330E,$01F2 
    db $03 
    dw $331F,$01F2 
    db $FB 
    dw $330F,$01F2 
    db $0F 
    dw $3322,$C3FA 
    db $07 
    dw $3313,$C3FA 
    db $FF 
    dw $3303 

Spritemap_Dachora_1:
    dw $0009,$01EF 
    db $F3 
    dw $3310,$C3F7 
    db $EB 
    dw $3301,$0002 
    db $F8 
    dw $335F,$01FA 
    db $F8 
    dw $335E,$01F2 
    db $04 
    dw $331F,$01F2 
    db $FC 
    dw $330F,$C3FA 
    db $08 
    dw $3316,$01F2 
    db $08 
    dw $3315,$C3FA 
    db $00 
    dw $3306 

Spritemap_Dachora_2:
    dw $000B,$01EE 
    db $F1 
    dw $3310,$C3F6 
    db $E9 
    dw $3301,$01EA 
    db $0E 
    dw $332D,$0002 
    db $F6 
    dw $331E,$01FA 
    db $F6 
    dw $330E,$01F2 
    db $FA 
    dw $330F,$C3FA 
    db $FE 
    dw $3309,$C3F2 
    db $FE 
    dw $3308,$000A 
    db $0E 
    dw $332B,$000A 
    db $06 
    dw $331B,$C3F2 
    db $06 
    dw $3318 

Spritemap_Dachora_3:
    dw $0009,$01F0 
    db $F2 
    dw $3310,$C3F8 
    db $EA 
    dw $3301,$0002 
    db $F7 
    dw $335F,$01FA 
    db $F7 
    dw $335E,$01F2 
    db $0F 
    dw $3352,$01F2 
    db $03 
    dw $331F,$01F2 
    db $FB 
    dw $330F,$C3FA 
    db $07 
    dw $3343,$C3FA 
    db $FF 
    dw $3333 

Spritemap_Dachora_4:
    dw $0009,$01EF 
    db $F3 
    dw $3310,$C3F7 
    db $EB 
    dw $3301,$01F4 
    db $10 
    dw $3352,$01F2 
    db $04 
    dw $331F,$01F2 
    db $FC 
    dw $330F,$0002 
    db $F8 
    dw $331E,$01FA 
    db $F8 
    dw $330E,$C3FA 
    db $08 
    dw $3346,$C3FA 
    db $00 
    dw $3336 

Spritemap_Dachora_5:
    dw $000B,$01EE 
    db $F1 
    dw $3310,$C3F6 
    db $E9 
    dw $3301,$0002 
    db $F6 
    dw $335F,$01FA 
    db $F6 
    dw $335E,$01EA 
    db $0E 
    dw $335A,$01F2 
    db $FA 
    dw $330F,$C3FA 
    db $FE 
    dw $3339,$C3F2 
    db $06 
    dw $3348,$000A 
    db $06 
    dw $334B,$000A 
    db $0E 
    dw $335B,$C3F2 
    db $FE 
    dw $3338 

Spritemap_Dachora_6:
    dw $0008,$01F6 
    db $FD 
    dw $3305,$01ED 
    db $FD 
    dw $3310,$C3F5 
    db $F5 
    dw $3301,$01F3 
    db $08 
    dw $331F,$01F3 
    db $00 
    dw $330F,$0003 
    db $FD 
    dw $331E,$01FB 
    db $FD 
    dw $330E,$C3FB 
    db $05 
    dw $330C 

Spritemap_Dachora_7:
    dw $000A,$0003 
    db $F1 
    dw $331E,$01FB 
    db $F1 
    dw $330E,$01F3 
    db $FD 
    dw $331F,$01F3 
    db $F5 
    dw $330F,$C3FB 
    db $F9 
    dw $333C,$01FE 
    db $DF 
    dw $F341,$C3FE 
    db $E7 
    dw $F320,$0003 
    db $09 
    dw $335D,$01FB 
    db $09 
    dw $3350,$01FB 
    db $11 
    dw $3325 

Spritemap_Dachora_8:
    dw $0009,$01F0 
    db $F3 
    dw $3310,$C3F8 
    db $EB 
    dw $3301,$01F3 
    db $10 
    dw $3351,$0003 
    db $F8 
    dw $331E,$01FB 
    db $F8 
    dw $330E,$01F3 
    db $04 
    dw $331F,$01F3 
    db $FC 
    dw $330F,$C3FB 
    db $08 
    dw $334C,$C3FB 
    db $00 
    dw $333C 

Spritemap_Dachora_9:
    dw $000A,$01F9 
    db $F3 
    dw $3340,$01F0 
    db $F3 
    dw $3310,$C3F8 
    db $EB 
    dw $3301,$01F3 
    db $10 
    dw $3351,$0003 
    db $F8 
    dw $331E,$01FB 
    db $F8 
    dw $330E,$01F3 
    db $04 
    dw $331F,$01F3 
    db $FC 
    dw $330F,$C3FB 
    db $08 
    dw $334C,$C3FB 
    db $00 
    dw $333C 

Spritemap_Dachora_A:
    dw $000A,$01F9 
    db $F3 
    dw $3305,$01F0 
    db $F3 
    dw $3310,$C3F8 
    db $EB 
    dw $3301,$01F3 
    db $10 
    dw $3351,$0003 
    db $F8 
    dw $331E,$01FB 
    db $F8 
    dw $330E,$01F3 
    db $04 
    dw $331F,$01F3 
    db $FC 
    dw $330F,$C3FB 
    db $08 
    dw $334C,$C3FB 
    db $00 
    dw $333C 

Spritemap_Dachora_B:
    dw $0009,$01E5 
    db $09 
    dw $332A,$C3E3 
    db $F9 
    dw $333E,$0003 
    db $F8 
    dw $332F,$01FB 
    db $F8 
    dw $332E,$01F3 
    db $08 
    dw $3345,$01F3 
    db $00 
    dw $3335,$01F3 
    db $10 
    dw $3351,$C3FB 
    db $08 
    dw $334C,$C3FB 
    db $00 
    dw $333C 

Spritemap_Dachora_C:
    dw $0009,$0003 
    db $F8 
    dw $332F,$01FB 
    db $F8 
    dw $332E,$01EB 
    db $11 
    dw $3341,$C3E3 
    db $01 
    dw $3320,$01F3 
    db $08 
    dw $3342,$01F3 
    db $00 
    dw $3332,$01F3 
    db $10 
    dw $3351,$C3FB 
    db $08 
    dw $334C,$C3FB 
    db $00 
    dw $333C 

Spritemap_Dachora_D:
    dw $0009,$0003 
    db $F8 
    dw $332F,$01FB 
    db $F8 
    dw $332E,$01EB 
    db $12 
    dw $3341,$C3E3 
    db $02 
    dw $3320,$01F3 
    db $08 
    dw $3342,$01F3 
    db $00 
    dw $3332,$01F3 
    db $10 
    dw $3351,$C3FB 
    db $08 
    dw $334C,$C3FB 
    db $00 
    dw $333C 

Spritemap_Dachora_E:
    dw $0009,$0003 
    db $F8 
    dw $332F,$01FB 
    db $F8 
    dw $332E,$01EB 
    db $13 
    dw $3341,$C3E3 
    db $03 
    dw $3320,$01F3 
    db $08 
    dw $3342,$01F3 
    db $00 
    dw $3332,$01F3 
    db $10 
    dw $3351,$C3FB 
    db $08 
    dw $334C,$C3FB 
    db $00 
    dw $333C 

Spritemap_Dachora_F:
    dw $0009,$0008 
    db $F2 
    dw $7310,$C3F8 
    db $EA 
    dw $7301,$01F6 
    db $F7 
    dw $731E,$01FE 
    db $F7 
    dw $730E,$0006 
    db $03 
    dw $731F,$0006 
    db $FB 
    dw $730F,$0006 
    db $0F 
    dw $7322,$C3F6 
    db $07 
    dw $7313,$C3F6 
    db $FF 
    dw $7303 

Spritemap_Dachora_10:
    dw $0009,$0009 
    db $F3 
    dw $7310,$C3F9 
    db $EB 
    dw $7301,$01F6 
    db $F8 
    dw $735F,$01FE 
    db $F8 
    dw $735E,$0006 
    db $04 
    dw $731F,$0006 
    db $FC 
    dw $730F,$C3F6 
    db $08 
    dw $7316,$0006 
    db $08 
    dw $7315,$C3F6 
    db $00 
    dw $7306 

Spritemap_Dachora_11:
    dw $000B,$000A 
    db $F1 
    dw $7310,$C3FA 
    db $E9 
    dw $7301,$000E 
    db $0E 
    dw $732D,$01F6 
    db $F6 
    dw $731E,$01FE 
    db $F6 
    dw $730E,$0006 
    db $FA 
    dw $730F,$C3F6 
    db $FE 
    dw $7309,$C3FE 
    db $FE 
    dw $7308,$01EE 
    db $0E 
    dw $732B,$01EE 
    db $06 
    dw $731B,$C3FE 
    db $06 
    dw $7318 

Spritemap_Dachora_12:
    dw $0009,$0008 
    db $F2 
    dw $7310,$C3F8 
    db $EA 
    dw $7301,$01F6 
    db $F7 
    dw $735F,$01FE 
    db $F7 
    dw $735E,$0006 
    db $0F 
    dw $7352,$0006 
    db $03 
    dw $731F,$0006 
    db $FB 
    dw $730F,$C3F6 
    db $07 
    dw $7343,$C3F6 
    db $FF 
    dw $7333 

Spritemap_Dachora_13:
    dw $0009,$0009 
    db $F3 
    dw $7310,$C3F9 
    db $EB 
    dw $7301,$0004 
    db $10 
    dw $7352,$0006 
    db $04 
    dw $731F,$0006 
    db $FC 
    dw $730F,$01F6 
    db $F8 
    dw $731E,$01FE 
    db $F8 
    dw $730E,$C3F6 
    db $08 
    dw $7346,$C3F6 
    db $00 
    dw $7336 

Spritemap_Dachora_14:
    dw $000B,$000A 
    db $F1 
    dw $7310,$C3FA 
    db $E9 
    dw $7301,$01F6 
    db $F6 
    dw $735F,$01FE 
    db $F6 
    dw $735E,$000E 
    db $0E 
    dw $735A,$0006 
    db $FA 
    dw $730F,$C3F6 
    db $FE 
    dw $7339,$C3FE 
    db $06 
    dw $7348,$01EE 
    db $06 
    dw $734B,$01EE 
    db $0E 
    dw $735B,$C3FE 
    db $FE 
    dw $7338 

Spritemap_Dachora_15:
    dw $0008,$0002 
    db $FD 
    dw $7305,$000B 
    db $FD 
    dw $7310,$C3FB 
    db $F5 
    dw $7301,$0005 
    db $08 
    dw $731F,$0005 
    db $00 
    dw $730F,$01F5 
    db $FD 
    dw $731E,$01FD 
    db $FD 
    dw $730E,$C3F5 
    db $05 
    dw $730C 

Spritemap_Dachora_16:
    dw $000A,$01F5 
    db $F1 
    dw $731E,$01FD 
    db $F1 
    dw $730E,$0005 
    db $FD 
    dw $731F,$0005 
    db $F5 
    dw $730F,$C3F5 
    db $F9 
    dw $733C,$01FA 
    db $DF 
    dw $B341,$C3F2 
    db $E7 
    dw $B320,$01F5 
    db $09 
    dw $735D,$01FD 
    db $09 
    dw $7350,$01FD 
    db $11 
    dw $7325 

Spritemap_Dachora_17:
    dw $0009,$0008 
    db $F3 
    dw $7310,$C3F8 
    db $EB 
    dw $7301,$0005 
    db $10 
    dw $7351,$01F5 
    db $F8 
    dw $731E,$01FD 
    db $F8 
    dw $730E,$0005 
    db $04 
    dw $731F,$0005 
    db $FC 
    dw $730F,$C3F5 
    db $08 
    dw $734C,$C3F5 
    db $00 
    dw $733C 

Spritemap_Dachora_18:
    dw $000A,$01FF 
    db $F3 
    dw $7340,$0008 
    db $F3 
    dw $7310,$C3F8 
    db $EB 
    dw $7301,$0005 
    db $10 
    dw $7351,$01F5 
    db $F8 
    dw $731E,$01FD 
    db $F8 
    dw $730E,$0005 
    db $04 
    dw $731F,$0005 
    db $FC 
    dw $730F,$C3F5 
    db $08 
    dw $734C,$C3F5 
    db $00 
    dw $733C 

Spritemap_Dachora_19:
    dw $000A,$01FF 
    db $F3 
    dw $7305,$0008 
    db $F3 
    dw $7310,$C3F8 
    db $EB 
    dw $7301,$0005 
    db $10 
    dw $7351,$01F5 
    db $F8 
    dw $731E,$01FD 
    db $F8 
    dw $730E,$0005 
    db $04 
    dw $731F,$0005 
    db $FC 
    dw $730F,$C3F5 
    db $08 
    dw $734C,$C3F5 
    db $00 
    dw $733C 

Spritemap_Dachora_1A:
    dw $0009,$0013 
    db $09 
    dw $732A,$C20D 
    db $F9 
    dw $733E,$01F5 
    db $F8 
    dw $732F,$01FD 
    db $F8 
    dw $732E,$0005 
    db $08 
    dw $7345,$0005 
    db $00 
    dw $7335,$0005 
    db $10 
    dw $7351,$C3F5 
    db $08 
    dw $734C,$C3F5 
    db $00 
    dw $733C 

Spritemap_Dachora_1B:
    dw $0009,$01F5 
    db $F8 
    dw $732F,$01FD 
    db $F8 
    dw $732E,$000D 
    db $11 
    dw $7341,$C20D 
    db $01 
    dw $7320,$0005 
    db $08 
    dw $7342,$0005 
    db $00 
    dw $7332,$0005 
    db $10 
    dw $7351,$C3F5 
    db $08 
    dw $734C,$C3F5 
    db $00 
    dw $733C 

Spritemap_Dachora_1C:
    dw $0009,$01F5 
    db $F8 
    dw $732F,$01FD 
    db $F8 
    dw $732E,$000D 
    db $12 
    dw $7341,$C20D 
    db $02 
    dw $7320,$0005 
    db $08 
    dw $7342,$0005 
    db $00 
    dw $7332,$0005 
    db $10 
    dw $7351,$C3F5 
    db $08 
    dw $734C,$C3F5 
    db $00 
    dw $733C 

Spritemap_Dachora_1D:
    dw $0009,$01F5 
    db $F8 
    dw $732F,$01FD 
    db $F8 
    dw $732E,$000D 
    db $13 
    dw $7341,$C20D 
    db $03 
    dw $7320,$0005 
    db $08 
    dw $7342,$0005 
    db $00 
    dw $7332,$0005 
    db $10 
    dw $7351,$C3F5 
    db $08 
    dw $734C,$C3F5 
    db $00 
    dw $733C 

Freespace_BankA7_FF82: 
; $7E bytes
