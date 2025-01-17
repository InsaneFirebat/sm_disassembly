
org $A98000


CommonA9_GrappleAI_NoInteraction:
    JSL.L GrappleAI_SwitchEnemyAIToMainAI 
    RTL 


CommonA9_GrappleAI_SamusLatchesOn:
    JSL.L GrappleAI_SamusLatchesOnWithGrapple 
    RTL 


CommonA9_GrappleAI_KillEnemy:
    JSL.L GrappleAI_EnemyGrappleDeath 
    RTL 


CommonA9_GrappleAI_CancelGrappleBeam:
    JSL.L GrappleAI_SwitchToFrozenAI 
    RTL 


CommonA9_GrappleAI_SamusLatchesOn_NoInvincibility:
    JSL.L GrappleAI_SamusLatchesOnWithGrapple_NoInvincibility 
    RTL 


UNUSED_CommonA9_GrappleAI_SamusLatchesOn_ParalyzeEnemy_A98019:
    JSL.L GrappleAI_SamusLatchesOnWithGrapple_ParalyzeEnemy 
    RTL 


CommonA9_GrappleAI_HurtSamus:
    JSL.L GrappleAI_SwitchToFrozenAI_duplicate 
    RTL 


CommonA9_NormalEnemyTouchAI:
    JSL.L NormalEnemyTouchAI 
    RTL 


CommonA9_NormalTouchAI_NoDeathCheck:
    JSL.L NormalEnemyTouchAI_NoDeathCheck_External 
    RTL 


CommonA9_NormalEnemyShotAI:
    JSL.L NormalEnemyShotAI 
    RTL 


CommonA9_NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic:
    JSL.L NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External 
    RTL 


CommonA9_NormalEnemyPowerBombAI:
    JSL.L NormalEnemyPowerBombAI 
    RTL 


CommonA9_NormalEnemyPowerBombAI_NoDeathCheck:
    JSL.L NormalEnemyPowerBombAI_NoDeathCheck_External 
    RTL 


CommonA9_NormalEnemyFrozenAI:
    JSL.L NormalEnemyFrozenAI 
    RTL 


CommonA9_CreateADudShot:
    JSL.L CreateADudShot 
    RTL 


RTS_A9804B:
    RTS 


RTL_A9804C:
    RTL 


Spritemap_CommonA9_Nothing:
    dw $0000 

ExtendedSpritemap_CommonA9_Nothing:
    dw $0001,$0000,$0000 
    dw Spritemap_CommonA9_Nothing 
    dw Hitbox_CommonA9_Nothing 

Hitbox_CommonA9_Nothing:
    dw $0001,$0000,$0000,$0000,$0000 
    dw CommonA9_NormalEnemyTouchAI 
    dw CommonA9_NormalEnemyShotAI 

InstList_CommonA9_DeleteEnemy:
    dw Instruction_CommonA9_DeleteEnemy 

NOPNOP_A98069:
    NOP 
    NOP 

Instruction_CommonA9_Enemy0FB2_InY:
    LDA.W $0000,Y 
    STA.W $0FB2,X 
    INY 
    INY 
    RTL 


Instruction_CommonA9_SetEnemy0FB2ToRTS:
    LDA.W #RTS_A9807B 
    STA.W $0FB2,X 
    RTL 


RTS_A9807B:
    RTS 


Instruction_CommonA9_DeleteEnemy:
    LDA.W $0F86,X 
    ORA.W #$0200 
    STA.W $0F86,X 
    PLA 
    PEA.W ProcessEnemyInstructions_return-1 
    RTL 


Instruction_CommonA9_CallFunctionInY:
    LDA.W $0000,Y 
    STA.B $12 
    PHY 
    PHX 
    PEA.W .manualReturn-1 
    JMP.W ($0012) 


.manualReturn:
    PLX 
    PLY 
    INY 
    INY 
    RTL 


Instruction_CommonA9_CallFunctionInY_WithA:
    LDA.W $0000,Y 
    STA.B $12 
    LDA.W $0002,Y 
    PHY 
    PHX 
    PEA.W .manualReturn-1 
    JMP.W ($0012) 


.manualReturn:
    PLX 
    PLY 
    TYA 
    CLC 
    ADC.W #$0004 
    TAY 
    RTL 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Instruction_CommonA9_CallExternalFunctionInY_A980B5:
    LDA.W $0000,Y 
    STA.B $12 
    LDA.W $0001,Y 
    STA.B $13 
    PHX 
    PHY 
    JSL.L .externalFunction 
    PLY 
    PLX 
    INY 
    INY 
    INY 
    RTL 


.externalFunction:
    JML.W [$0012] 


UNUSED_Inst_CommonA9_CallExternalFunctionInY_WithA_A980CE:
    LDA.W $0000,Y 
    STA.B $12 
    LDA.W $0001,Y 
    STA.B $13 
    LDA.W $0003,Y 
    PHX 
    PHY 
    JSL.L .externalFunction 
    PLY 
    PLX 
    TYA 
    CLC 
    ADC.W #$0005 
    TAY 
    RTL 


.externalFunction:
    JML.W [$0012] 
endif ; !FEATURE_KEEP_UNREFERENCED


Instruction_CommonA9_GotoY:
    LDA.W $0000,Y 
    TAY 
    RTL 


Instruction_CommonA9_GotoY_PlusY:
    STY.B $12 
    DEY 
    LDA.W $0000,Y 
    XBA 
    BMI .highByte 
    AND.W #$00FF 
    BRA + 


.highByte:
    ORA.W #$FF00 

  + CLC 
    ADC.B $12 
    TAY 
    RTL 


Instruction_CommonA9_DecrementTimer_GotoYIfNonZero:
    DEC.W $0F90,X 
    BNE Instruction_CommonA9_GotoY 
    INY 
    INY 
    RTL 


Instruction_CommonA9_DecrementTimer_GotoYIfNonZero_duplicate:
    DEC.W $0F90,X 
    BNE Instruction_CommonA9_GotoY 
    INY 
    INY 
    RTL 


Instruction_CommonA9_DecrementTimer_GotoY_PlusY_IfNonZero:
    SEP #$20 
    DEC.W $0F90,X 
    REP #$20 
    BNE Instruction_CommonA9_GotoY_PlusY 
    INY 
    RTL 


Instruction_CommonA9_TimerInY:
    LDA.W $0000,Y 
    STA.W $0F90,X 
    INY 
    INY 
    RTL 


Instruction_CommonA9_SkipNextInstruction:
    INY 
    INY 
    RTL 


Instruction_CommonA9_Sleep:
    DEY 
    DEY 
    TYA 
    STA.W $0F92,X 
    PLA 
    PEA.W ProcessEnemyInstructions_return-1 
    RTL 


Instruction_CommonA9_WaitYFrames:
    LDA.W $0000,Y 
    STA.W $0F94,X 
    INY 
    INY 
    TYA 
    STA.W $0F92,X 
    PLA 
    PEA.W ProcessEnemyInstructions_return-1 
    RTL 


Instruction_CommonA9_TransferYBytesInYToVRAM:
    PHX 
    LDX.W $0330 
    LDA.W $0000,Y 
    STA.B $D0,X 
    LDA.W $0002,Y 
    STA.B $D2,X 
    LDA.W $0003,Y 
    STA.B $D3,X 
    LDA.W $0005,Y 
    STA.B $D5,X 
    TXA 
    CLC 
    ADC.W #$0007 
    STA.W $0330 
    TYA 
    CLC 
    ADC.W #$0007 
    TAY 
    PLX 
    RTL 


Instruction_CommonA9_EnableOffScreenProcessing:
    LDA.W $0F86,X 
    ORA.W #$0800 
    STA.W $0F86,X 
    RTL 


Instruction_CommonA9_DisableOffScreenProcessing:
    LDA.W $0F86,X 
    AND.W #$F7FF 
    STA.W $0F86,X 
    RTL 


CommonA9EnemySpeeds_LinearlyIncreasing:
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

CommonA9EnemySpeeds_QuadraticallyIncreasing:
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

InitAI_MotherBrainBody:
    PHB 
    PEA.W $7E7E 
    PLB 
    PLB 
    LDA.W #$0338 
    LDX.W #$0FFE 

.loopTilemap:
    STA.W $2000,X 
    DEX 
    DEX 
    BPL .loopTilemap 
    PLB 
    LDA.W #InstList_MotherBrainHead_InitialDummy 
    JSR.W SetMotherBrainBodyInstList 
    STZ.W $0F98 
    LDA.W $0F86 
    ORA.W #$1500 
    STA.W $0F86 
    LDA.W #$0000 
    STA.W $0F96 
    LDY.W #Palette_MotherBrain_GlassShards+2 
    LDX.W #$0162 
    LDA.W #$000F 
    JSL.L WriteAColorsFromYToTargetColorIndexX 
    LDY.W #Palette_MotherBrain_TubeProjectiles+2 
    LDX.W #$01E2 
    LDA.W #$000F 
    JSL.L WriteAColorsFromYToTargetColorIndexX 
    LDA.W #$0000 
    STA.L $7E7800 
    STA.L $7E7844 
    LDA.W #$0002 
    STA.L $7E7808 
    LDA.W #Function_MotherBrain_SetupBrainToBeDrawn 
    STA.W $0FE8 
    LDA.W #Function_MotherBrain_FirstPhase 
    STA.W $0FA8 
    LDA.W #$0001 
    JSL.L Load_FX_Entry 
    LDA.W #$0000 

.loopProjectiles:
    PHA 
    LDY.W #EnemyProjectile_MotherBrainTurret 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    PLA 
    INC A 
    CMP.W #$000C 
    BCC .loopProjectiles 
    RTL 


InitAI_MotherBrainHead:
    LDX.W #$0040 
    LDY.W #CorpseRottingDefinitions_MotherBrain 
    JSR.W InitializeEnemyCorpseRotting 
    LDA.W #$0BB8 
    STA.W $0FCC 
    LDA.W #InstList_MotherBrainHead_InitialDummy 
    JSR.W SetMotherBrainHeadUnusedInstList 
    STZ.W $0FD8 
    LDA.W $0FC6 
    ORA.W #$1100 
    STA.W $0FC6 
    LDA.W #$0200 
    STA.W $0FD6 
    STA.L $7E7818 
    STA.L $7E781A 
    LDA.W #InstList_MotherBrainHead_Initial 
    JSR.W SetMotherBrainHeadInstList 
    JSR.W SetupMotherBrainHeadNormalPalette 
    RTL 


MainAI_HurtAI_MotherBrainBody:
    JSR.W MotherBrainPalette_HandleRoomPalette 
    PEA.W .manualReturn-1 
    JMP.W ($0FA8) 


.manualReturn:
    JSR.W HandleMotherBrainsPalette 
    JSR.W MotherBrain_vs_Samus_CollisionDetection 
    JSR.W ProcessMotherBrainInvincibilityPalette 
    LDA.L $7E7844 
    BEQ .return 
    LDA.W #UnpauseHook_MotherBrainBody>>8&$FF00 
    STA.W $0605 
    LDA.W #UnpauseHook_MotherBrainBody 
    STA.W $0604 

.return:
    RTL 


UnpauseHook_MotherBrainBody:
    LDA.L $7E782C 
    BEQ .noRainbowSFX 
    LDA.W #$0040 
    JSL.L QueueSound_Lib1_Max6 

.noRainbowSFX:
    LDA.W $0F88 
    AND.W #$0004 
    BEQ .return 
    LDA.W #$0800 
    STA.W $179A 
    LDA.W #$0001 
    STA.W $0E1E 

.return:
    RTL 


RTS_A98785:
    RTS 


RTL_A98786:
    RTL 


PowerBombReaction_MotherBrain:
    JSL.L NormalEnemyPowerBombAI_NoDeathCheck_External ; Fallthrough to MainAI_HurtAI_MotherBrainHead

MainAI_HurtAI_MotherBrainHead:
    LDA.W #RTL_A98786>>8&$FF00 
    STA.W $178D 
    LDA.W #RTL_A98786 
    STA.W $178C 
    LDA.W $0FC6 
    AND.W #$0100 
    BEQ RTL_A98786 
    JMP.W ($0FE8) 


Function_MotherBrain_SetupBrainAndNeckToBeDrawn:
    LDA.W $0A78 
    BNE .timeIsFrozen 
    JSR.W HandleMotherBrainsNeck 

.timeIsFrozen:
    LDA.L $7E805C 
    STA.W $0FBA 
    LDA.W #$FFEB 
    CLC 
    ADC.L $7E805E 
    STA.W $0FBE 
    LDA.W #EnemyGraphicsDrawnHook_MotherBrain_DrawBrainAndNeck>>8&$FF00 
    STA.W $178D 
    LDA.W #EnemyGraphicsDrawnHook_MotherBrain_DrawBrainAndNeck 
    STA.W $178C 
    RTL 


EnemyGraphicsDrawnHook_MotherBrain_DrawBrainAndNeck:
    JSR.W DrawMotherBrainHead 
    JSR.W DrawMotherBrainsNeck 
    RTL 


Function_MotherBrain_SetupBrainToBeDrawn:
    LDA.W #EnemyGraphicsDrawnHook_MotherBrain_DrawBrain>>8&$FF00 
    STA.W $178D 
    LDA.W #EnemyGraphicsDrawnHook_MotherBrain_DrawBrain 
    STA.W $178C 
    RTL 


EnemyGraphicsDrawnHook_MotherBrain_DrawBrain:
    JSR.W DrawMotherBrainHead 
    RTL 


Function_MotherBrain_FirstPhase:
    LDA.W #$0002 
    JSL.L CheckIfEvent_inA_HasHappened 
    BCC .runCollisionDetection 
    LDA.W $1840 
    STA.L $7E7840 
    LDA.W $0AF6 
    CMP.W #$00EC 
    BPL .runCollisionDetection 
    LDA.W $0FCC 
    BNE .runCollisionDetection 
    LDA.W #$0001 
    STA.L $7E783A 
    STA.L $7E7800 
    JSL.L DisableMinimap_MarkBossRoomTilesExplored 
    LDA.W #$0006 
    JSL.L QueueMusicDataOrTrack_8FrameDelay 
    JSL.L SealMotherBrainsWallFunction_FakeDeath_Descent 

.runCollisionDetection:
    JSR.W MotherBrain_vs_Samus_CollisionDetection 
    PLA 
    RTL 


Function_MotherBrainBody_FakeDeath_Descent_InitialPause:
    LDA.W #Function_MBBody_FakeDeath_Descent_LockSamus_SetScrollRegion 
    STA.W $0FA8 
    LDA.W #$0040 
    STA.W $0FB2 ; fallthrough to Function_MBBody_FakeDeath_Descent_LockSamus_SetScrollRegion

Function_MBBody_FakeDeath_Descent_LockSamus_SetScrollRegion:
    DEC.W $0FB2 
    BMI .timerExpired 
    RTS 


.timerExpired:
    LDA.W #$0000 
    JSL.L Run_Samus_Command 
    LDA.L $7ECD20 
    AND.W #$00FF 
    STA.L $7ECD20 
    LDA.W #Function_MotherBrainBody_FakeDeath_Descent_QueueMusic 
    STA.W $0FA8 
    LDA.W #$0020 
    STA.W $0FB2 

Function_MotherBrainBody_FakeDeath_Descent_QueueMusic:
    DEC.W $0FB2 
    BPL Function_MBBody_FakeDeath_Descent_return 
    LDA.W #$0000 
    JSL.L QueueMusicDataOrTrack_8FrameDelay 
    LDA.W #$FF21 
    JSL.L QueueMusicDataOrTrack_8FrameDelay 
    LDA.W #Function_MotherBrainBody_FakeDeath_Descent_UnlockSamus 
    STA.W $0FA8 
    LDA.W #$000C 
    STA.W $0FB2 ; fallthrough to Function_MotherBrainBody_FakeDeath_Descent_UnlockSamus

Function_MotherBrainBody_FakeDeath_Descent_UnlockSamus:
    DEC.W $0FB2 
    BPL Function_MBBody_FakeDeath_Descent_return 
    LDA.W #$0001 
    JSL.L Run_Samus_Command 
    LDA.W #Function_MBBody_FakeDeath_Descent_BeginScnFlashing_LowerAcid 
    STA.W $0FA8 
    LDA.W #$0008 
    STA.W $0FB2 ; fallthrough to Function_MBBody_FakeDeath_Descent_BeginScnFlashing_LowerAcid

Function_MBBody_FakeDeath_Descent_BeginScnFlashing_LowerAcid:
    DEC.W $0FB2 
    BPL Function_MBBody_FakeDeath_Descent_return 
    JSR.W MotherBrainPalette_BeginScreenFlashing 
    LDA.W #$0002 
    JSL.L Load_FX_Entry 
    LDA.W #Function_MotherBrainBody_SpawnTubesFallingWhenLessThan4Proj 
    STA.W $0FF0 
    LDA.W #Function_MBBody_FakeDeath_Descent_TransitionMBPaletteToGrey 
    STA.W $0FA8 
    STZ.W $0FB2 
    LDA.W #$0000 
    STA.L $7E802E 
    JSL.L Spawn_Hardcoded_PLM 
    db $0E,$02 
    dw PLMEntries_clearCeilingBlockInMotherBrainsRoom 

Function_MBBody_FakeDeath_Descent_return:
    RTS 


Function_MBBody_FakeDeath_Descent_TransitionMBPaletteToGrey:
    DEC.W $0FB2 
    BPL Function_MBBody_FakeDeath_Descent_CollapseTubes 
    LDA.W #$0008 
    STA.W $0FB2 
    LDA.L $7E802E 
    INC A 
    STA.L $7E802E 
    DEC A 
    JSL.L TransitionMotherBrainPaletteToGrey_FakeDeath 
    BCC Function_MBBody_FakeDeath_Descent_CollapseTubes 
    LDA.W #Function_MBBody_FakeDeath_Descent_CollapseTubes 
    STA.W $0FA8 

Function_MBBody_FakeDeath_Descent_CollapseTubes:
    PEA.W .manualReturn-1 
    JMP.W ($0FF0) 


.manualReturn:
    JSR.W HandleFakeDeathExplosions 
    RTS 


HandleFakeDeathExplosions:
    LDA.L $7E8030 
    DEC A 
    BMI .timerExpired 
    STA.L $7E8030 
    RTS 


.timerExpired:
    LDA.W #$0008 
    STA.L $7E8030 
    LDA.L $7E8032 
    DEC A 
    BPL + 
    LDA.W #$0007 

  + STA.L $7E8032 
    ASL A 
    ASL A 
    TAX 
    LDA.W .XPosition,X 
    STA.B $12 
    LDA.W .YPosition,X 
    STA.B $14 
    LDY.W #$0003 
    LDA.W $05E5 
    CMP.W #$4000 
    BCS + 
    LDY.W #$000C 

  + TYA 
    LDY.W #EnemyProjectile_MiscDust 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    LDA.W #$0024 
    JSL.L QueueSound_Lib2_Max3 
    RTS 


.XPosition:
    dw $0088 

.YPosition:
    dw $0074,$0078,$0084,$007C,$005A,$008A,$0092,$0078 
    dw $0034,$007C,$00AA,$008A,$0048,$0078,$00CE 

Function_MotherBrainBody_SpawnTubesFallingWhenLessThan4Proj:
    LDY.W #$0000 
    TYX 

.loop:
    LDA.W $1997,Y 
    BNE .nextProj 
    INX 

.nextProj:
    INY 
    INY 
    CPY.W #$0024 
    BMI .loop 
    CPX.W #$0004 
    BPL .tooManyProjs 
    RTS 


.tooManyProjs:
    LDX.W #EnemyPopulations_MotherBrainFallingTubes_BottomLeft 
    JSL.L SpawnEnemy 
    LDA.W #Function_MotherBrainBody_ClearBottomLeftTube 
    STA.W $0FF0 
    RTS 


Function_MotherBrainBody_ClearBottomLeftTube:
    JSL.L Spawn_Hardcoded_PLM 
    db $05,$09 
    dw PLMEntries_clearMotherBrainsBottomLeftTube 
    LDA.W #Function_MotherBrainBody_SpawnTopRightTubeFallingProjectile 
    STA.W $0FF0 
    LDA.W #$0020 
    STA.W $0FF2 
    RTS 


Function_MotherBrainBody_SpawnTopRightTubeFallingProjectile:
    DEC.W $0FF2 
    BPL .return 
    LDA.W #$0098 
    STA.B $12 
    LDA.W #$002F 
    STA.B $14 
    LDY.W #EnemyProjectile_MotherBrainTubeFalling_TopRight 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    LDA.W #Function_MotherBrainBody_ClearCeilingBlockColumn9 
    STA.W $0FF0 

.return:
    RTS 


Function_MotherBrainBody_ClearCeilingBlockColumn9:
    JSL.L Spawn_Hardcoded_PLM 
    db $09,$02 
    dw PLMEntries_clearCeilingBlockInMotherBrainsRoom 
    LDA.W #Function_MotherBrainBody_SpawnTopLeftTubeFallingProjectile 
    STA.W $0FF0 
    LDA.W #$0020 
    STA.W $0FF2 
    RTS 


Function_MotherBrainBody_SpawnTopLeftTubeFallingProjectile:
    DEC.W $0FF2 
    BPL .return 
    LDA.W #$0068 
    STA.B $12 
    LDA.W #$002F 
    STA.B $14 
    LDY.W #EnemyProjectile_MotherBrainTubeFalling_TopLeft 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    LDA.W #Function_MotherBrainBody_ClearCeilingBlockColumn6 
    STA.W $0FF0 

.return:
    RTS 


Function_MotherBrainBody_ClearCeilingBlockColumn6:
    JSL.L Spawn_Hardcoded_PLM 
    db $06,$02 
    dw PLMEntries_clearCeilingBlockInMotherBrainsRoom 
    LDA.W #Function_MotherBrainBody_SpawnTubesFalling1 
    STA.W $0FF0 
    LDA.W #$0020 
    STA.W $0FF2 
    RTS 


Function_MotherBrainBody_SpawnTubesFalling1:
    DEC.W $0FF2 
    BPL .return 
    LDX.W #EnemyPopulations_MotherBrainFallingTubes_BottomRight 
    JSL.L SpawnEnemy 
    LDA.W #Function_MotherBrainBody_ClearBottomRightTube 
    STA.W $0FF0 

.return:
    RTS 


Function_MotherBrainBody_ClearBottomRightTube:
    JSL.L Spawn_Hardcoded_PLM 
    db $0A,$09 
    dw PLMEntries_clearMotherBrainsBottomRightTube 
    LDA.W #Function_MotherBrainBody_SpawnTubesFalling2 
    STA.W $0FF0 
    LDA.W #$0020 
    STA.W $0FF2 
    RTS 


Function_MotherBrainBody_SpawnTubesFalling2:
    DEC.W $0FF2 
    BPL .return 
    LDX.W #EnemyPopulations_MotherBrainFallingTubes_BottomMiddleLeft 
    JSL.L SpawnEnemy 
    LDA.W #Function_MotherBrainBody_ClearBottomMiddleLeftTube 
    STA.W $0FF0 

.return:
    RTS 


Function_MotherBrainBody_ClearBottomMiddleLeftTube:
    JSL.L Spawn_Hardcoded_PLM 
    db $06,$0A 
    dw PLMEntries_clearMotherBrainsBottomMiddleSideTube 
    LDA.W #Function_MotherBrainBody_SpawnTopMiddleLeftTubeFallingProj 
    STA.W $0FF0 
    LDA.W #$0020 
    STA.W $0FF2 
    RTS 


Function_MotherBrainBody_SpawnTopMiddleLeftTubeFallingProj:
    DEC.W $0FF2 
    BPL .return 
    LDA.W #$0078 
    STA.B $12 
    LDA.W #$003B 
    STA.B $14 
    LDY.W #EnemyProjectile_MotherBrainTubeFalling_TopMiddleLeft 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    LDA.W #Function_MotherBrainBody_ClearCeilingTubeColumn7 
    STA.W $0FF0 

.return:
    RTS 


Function_MotherBrainBody_ClearCeilingTubeColumn7:
    JSL.L Spawn_Hardcoded_PLM 
    db $07,$02 
    dw PLMEntries_clearCeilingTubeInMotherBrainsRoom 
    LDA.W #Function_MotherBrainBody_SpawnTopMiddleRightTubeFallingProj 
    STA.W $0FF0 
    LDA.W #$0020 
    STA.W $0FF2 
    RTS 


Function_MotherBrainBody_SpawnTopMiddleRightTubeFallingProj:
    DEC.W $0FF2 
    BPL .return 
    LDA.W #$0088 
    STA.B $12 
    LDA.W #$003B 
    STA.B $14 
    LDY.W #EnemyProjectile_MotherBrainTubeFalling_TopMiddleRight 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    LDA.W #Function_MotherBrainBody_ClearCeilingTubeColumn8 
    STA.W $0FF0 

.return:
    RTS 


Function_MotherBrainBody_ClearCeilingTubeColumn8:
    JSL.L Spawn_Hardcoded_PLM 
    db $08,$02 
    dw PLMEntries_clearCeilingTubeInMotherBrainsRoom 
    LDA.W #Function_MotherBrainBody_SpawnTubesFalling3 
    STA.W $0FF0 
    LDA.W #$0020 
    STA.W $0FF2 
    RTS 


Function_MotherBrainBody_SpawnTubesFalling3:
    DEC.W $0FF2 
    BPL .return 
    LDX.W #EnemyPopulations_MotherBrainFallingTubes_BottomMiddleRight 
    JSL.L SpawnEnemy 
    LDA.W #Function_MotherBrainBody_ClearBottomMiddleRightTube 
    STA.W $0FF0 

.return:
    RTS 


Function_MotherBrainBody_ClearBottomMiddleRightTube:
    JSL.L Spawn_Hardcoded_PLM 
    db $09,$0A 
    dw PLMEntries_clearMotherBrainsBottomMiddleSideTube 
    LDA.W #Function_MotherBrainBody_SpawnTubesFalling4 
    STA.W $0FF0 
    LDA.W #$0002 
    STA.W $0FF2 
    RTS 


Function_MotherBrainBody_SpawnTubesFalling4:
    DEC.W $0FF2 
    BPL .return 
    LDX.W #EnemyPopulations_MotherBrainFallingTubes_MainTube 
    JSL.L SpawnEnemy 
    LDA.W #Function_MotherBrainBody_ClearBottomMiddleTubes 
    STA.W $0FF0 

.return:
    RTS 


Function_MotherBrainBody_ClearBottomMiddleTubes:
    JSL.L Spawn_Hardcoded_PLM 
    db $07,$07 
    dw PLMEntries_clearMotherBrainsBottomMiddleTubes 
    LDA.W #RTS_A98AE4 
    STA.W $0FF0 ; fallthrough to RTS_A98AE4

RTS_A98AE4:
    RTS 


EnemyPopulations_MotherBrainFallingTubes_BottomLeft:
    dw EnemyHeaders_MotherBrainTubes 
    dw $0060,$00B3 
    dw InstList_MotherBrainTubes_0 
    dw $A000,$0000,$0000,$0000 

EnemyPopulations_MotherBrainFallingTubes_BottomRight:
    dw EnemyHeaders_MotherBrainTubes 
    dw $00A0,$00B3 
    dw InstList_MotherBrainTubes_1 
    dw $A000,$0000,$0002,$0000 

EnemyPopulations_MotherBrainFallingTubes_BottomMiddleLeft:
    dw EnemyHeaders_MotherBrainTubes 
    dw $0068,$00BB 
    dw InstList_MotherBrainTubes_2 
    dw $A000,$0000,$0004,$0000 

EnemyPopulations_MotherBrainFallingTubes_BottomMiddleRight:
    dw EnemyHeaders_MotherBrainTubes 
    dw $0098,$00BB 
    dw InstList_MotherBrainTubes_3 
    dw $A000,$0000,$0006,$0000 

EnemyPopulations_MotherBrainFallingTubes_MainTube:
    dw EnemyHeaders_MotherBrainTubes 
    dw $0080,$00A7 
    dw InstList_MotherBrainTubes_4 
    dw $A800,$0000,$0008,$0020 

InitAI_MotherBrainTubes:
    LDX.W $0E54 
    LDY.W $0FB4,X 
    LDA.W .XRaidius,Y 
    STA.W $0F82,X 
    LDA.W .YRadius,Y 
    STA.W $0F84,X 
    LDA.W .YPositionThreshold,Y 
    STA.W $0FAA,X 
    STZ.W $0FAE,X 
    STZ.W $0FB0,X 
    STZ.W $0FAC,X 
    LDA.W .functionPointer,Y 
    STA.W $0FA8,X 
    RTL 


.XRaidius:
    dw $0010,$0010,$0008,$0008,$0010 

.YRadius:
    dw $0020,$0020,$0018,$0018,$0020 

.YPositionThreshold:
    dw $00F8,$00F8,$00F0,$00F0,$00F6 

.functionPointer:
    dw Function_MotherBrainTubes_NonMainTube 
    dw Function_MotherBrainTubes_NonMainTube 
    dw Function_MotherBrainTubes_NonMainTube 
    dw Function_MotherBrainTubes_NonMainTube 
    dw Function_MotherBrainTubes_MainTube_WaitingToFall 

MainAI_MotherBrainTubes:
    JMP.W ($0FA8,X) 


Function_MotherBrainTubes_NonMainTube:
    LDA.W $0FAC,X 
    CLC 
    ADC.W #$0006 
    STA.W $0FAC,X 
    JSR.W AddADividedBy100ToEnemyYPosition 
    LDA.W $0F7E,X 
    CMP.W $0FAA,X 
    BPL ExplodeMotherBrainTubes 

HandleFallingTubeSmoke:
    DEC.W $0FAE,X 
    BPL HandleFallingTubeSmoke_return 
    JSR.W SpawnFallingTubeSmoke 

HandleFallingTubeSmoke_return:
    RTL 


ExplodeMotherBrainTubes:
    LDA.W $0F86,X 
    ORA.W #$0200 
    STA.W $0F86,X 
    LDA.W $0F7A,X 
    STA.B $12 
    LDA.W $0F7E,X 
    STA.B $14 
    LDA.W #$0003 
    LDY.W #EnemyProjectile_MiscDust 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    LDA.W #$0024 
    JSL.L QueueSound_Lib2_Max3 
    RTL 


Function_MotherBrainTubes_MainTube_WaitingToFall:
    DEC.W $0FB6,X 
    BPL HandleFallingTubeSmoke_return 
    LDA.W #Function_MotherBrainTubes_MainTube_Falling 
    STA.W $0FA8,X ; fallthrough to Function_MotherBrainTubes_MainTube_Falling


Function_MotherBrainTubes_MainTube_Falling:
    LDA.W $0FAC,X 
    CLC 
    ADC.W #$0006 
    STA.W $0FAC,X 
    JSR.W AddADividedBy100ToEnemyYPosition 
    PHA 
    CMP.W #$00F4 
    BMI .lessThanF4 
    LDA.W $0F86,X 
    ORA.W #$0100 
    STA.W $0F86,X 

.lessThanF4:
    PLA 
    SEC 
    SBC.W #$0038 
    CMP.W #$00C4 
    STA.W $0FBE 
    BPL .greaterThanEqualToC4 
    JMP.W HandleFallingTubeSmoke 


.greaterThanEqualToC4:
    JSR.W MotherBrainPalette_EndScreenFlashing 
    LDA.W #$0019 
    JSL.L EnableEarthquakeTypeInAFor20Frames 
    STZ.W $18B4 
    STZ.W $18B6 
    STZ.W $0FAC,X 
    LDA.W #$00C4 
    STA.W $0FBE 
    LDA.W #$003B 
    STA.W $0F7A 
    LDA.W #$0117 
    STA.W $0F7E 
    JSR.W SetupMotherBrainsNeckForFakeDeathAscent 
    LDA.W #Function_MotherBrainBody_FakeDeath_Ascent_DrawRoomBG_Rows2_3 
    STA.W $0FA8 
    LDX.W $0E54 
    JMP.W ExplodeMotherBrainTubes 


SpawnFallingTubeSmoke:
    LDA.W #$0008 
    STA.W $0FAE,X 
    LDA.W $0FB0,X 
    INC A 
    AND.W #$0003 
    STA.W $0FB0,X 
    ASL A 
    TAY 
    LDA.W .data,Y 
    CLC 
    ADC.W $0F7A,X 
    STA.B $12 
    LDA.W #$00D0 
    STA.B $14 
    LDA.W #$0009 
    LDY.W #EnemyProjectile_MiscDust 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    RTS 


.data:
    dw $FFF8,$0002,$FFFC,$0006 

InstList_MotherBrainTubes_0:
    dw $0001 
    dw Spritemaps_MotherBrainTubes_0 
    dw Instruction_Common_Sleep 

InstList_MotherBrainTubes_1:
    dw $0001 
    dw Spritemaps_MotherBrainTubes_1 
    dw Instruction_Common_Sleep 

InstList_MotherBrainTubes_2:
    dw $0001 
    dw Spritemaps_MotherBrainTubes_2 
    dw Instruction_Common_Sleep 

InstList_MotherBrainTubes_3:
    dw $0001 
    dw Spritemaps_MotherBrainTubes_3 
    dw Instruction_Common_Sleep 

InstList_MotherBrainTubes_4:
    dw $0001 
    dw Spritemaps_MotherBrainTubes_4 
    dw Instruction_Common_Sleep 

Function_MotherBrainBody_FakeDeath_Ascent_DrawRoomBG_Rows2_3:
    JSL.L Spawn_Hardcoded_PLM 
    db $02,$02 
    dw PLMEntries_motherBrainsBackgroundRow2 
    JSL.L Spawn_Hardcoded_PLM 
    db $02,$03 
    dw PLMEntries_motherBrainsBackgroundRow3 
    LDA.W #Function_MotherBrainBody_FakeDeath_Ascent_DrawRoomBG_Rows4_5 
    STA.W $0FA8 
    RTS 


Function_MotherBrainBody_FakeDeath_Ascent_DrawRoomBG_Rows4_5:
    JSL.L Spawn_Hardcoded_PLM 
    db $02,$04 
    dw PLMEntries_motherBrainsBackgroundRow4 
    JSL.L Spawn_Hardcoded_PLM 
    db $02,$05 
    dw PLMEntries_motherBrainsBackgroundRow5 
    LDA.W #Function_MotherBrainBody_FakeDeath_Ascent_DrawRoomBG_Rows6_7 
    STA.W $0FA8 
    RTS 


Function_MotherBrainBody_FakeDeath_Ascent_DrawRoomBG_Rows6_7:
    JSL.L Spawn_Hardcoded_PLM 
    db $02,$06 
    dw PLMEntries_motherBrainsBackgroundRow6 
    JSL.L Spawn_Hardcoded_PLM 
    db $02,$07 
    dw PLMEntries_motherBrainsBackgroundRow7 
    LDA.W #Function_MotherBrainBody_FakeDeath_Ascent_DrawRoomBG_Rows8_9 
    STA.W $0FA8 
    RTS 


Function_MotherBrainBody_FakeDeath_Ascent_DrawRoomBG_Rows8_9:
    JSL.L Spawn_Hardcoded_PLM 
    db $02,$08 
    dw PLMEntries_motherBrainsBackgroundRow8 
    JSL.L Spawn_Hardcoded_PLM 
    db $02,$09 
    dw PLMEntries_motherBrainsBackgroundRow9 
    LDA.W #Function_MotherBrainBody_FakeDeath_Ascent_DrawRoomBG_RowsA_B 
    STA.W $0FA8 
    RTS 


Function_MotherBrainBody_FakeDeath_Ascent_DrawRoomBG_RowsA_B:
    JSL.L Spawn_Hardcoded_PLM 
    db $02,$0A 
    dw PLMEntries_motherBrainsBackgroundRowA 
    JSL.L Spawn_Hardcoded_PLM 
    db $02,$0B 
    dw PLMEntries_motherBrainsBackgroundRowB 
    LDA.W #Function_MotherBrainBody_FakeDeath_Ascent_DrawRoomBG_RowsC_D 
    STA.W $0FA8 
    RTS 


Function_MotherBrainBody_FakeDeath_Ascent_DrawRoomBG_RowsC_D:
    JSL.L Spawn_Hardcoded_PLM 
    db $02,$0C 
    dw PLMEntries_motherBrainsBackgroundRowC 
    JSL.L Spawn_Hardcoded_PLM 
    db $02,$0D 
    dw PLMEntries_motherBrainsBackgroundRowD 
    LDA.W #Function_MotherBrainBody_FakeDeath_Ascent_SetupMBPhase2GFX 
    STA.W $0FA8 
    RTS 


Function_MotherBrainBody_FakeDeath_Ascent_SetupMBPhase2GFX:
    LDA.W #$0101 
    STA.W $091B 
    LDA.B $59 
    AND.W #$FFFC 
    STA.B $59 
    LDY.W #Palette_MotherBrain_Attacks+2 
    LDX.W #$0142 
    LDA.W #$000F 
    JSL.L WriteAColorsFromYtoColorIndexX 
    LDY.W #Palette_MotherBrain_BackLeg+2 
    LDX.W #$0162 
    LDA.W #$000F 
    JSL.L WriteAColorsFromYtoColorIndexX 
    LDA.W #Function_MotherBrainBody_FakeDeath_Ascent_SetupMBPhase2Brain 
    STA.W $0FA8 
    LDA.W #$0001 
    STA.W $0E1E 
    STA.L $7E7844 
    RTS 


Function_MotherBrainBody_FakeDeath_Ascent_SetupMBPhase2Brain:
    LDA.W #$0034 
    STA.W $1982 
    LDA.W #Function_MotherBrain_SetupBrainAndNeckToBeDrawn 
    STA.W $0FE8 
    LDA.W $0F86 
    AND.W #$FBFF 
    STA.W $0F86 
    LDA.W $0FC6 
    AND.W #$FBFF 
    STA.W $0FC6 
    LDA.W #$4650 
    STA.W $0FCC 
    LDA.W #Function_MotherBrainBody_FakeDeath_Ascent_PauseForSuspense 
    STA.W $0FA8 
    LDA.W #$0080 
    STA.W $0FB2 ; fallthrough to Function_MotherBrainBody_FakeDeath_Ascent_PauseForSuspense

Function_MotherBrainBody_FakeDeath_Ascent_PauseForSuspense:
    DEC.W $0FB2 
    BMI .timerExpired 
    RTS 


.timerExpired:
    LDA.W #Function_MotherBrainBody_FakeDeath_Ascent_PrepareMBForRising 
    STA.W $0FA8 
    LDA.W #$0020 
    STA.W $0FB2 ; fallthrough to Function_MotherBrainBody_FakeDeath_Ascent_PrepareMBForRising

Function_MotherBrainBody_FakeDeath_Ascent_PrepareMBForRising:
    DEC.W $0FB2 
    BMI .timerExpired 
    RTS 


.timerExpired:
    JSL.L Spawn_MotherBrainRising_HDMAObject 
    STA.L $7E7812 
    LDA.W $0FC6 
    ORA.W #$0100 
    STA.W $0FC6 
    LDA.W #InstList_MotherBrainHead_Initial 
    JSR.W SetMotherBrainHeadInstList 
    LDA.W #Function_MotherBrainBody_FakeDeath_Ascent_LoadMBLegTiles 
    STA.W $0FA8 
    LDA.W #$0100 
    STA.W $0FB2 ; fallthrough to Function_MotherBrainBody_FakeDeath_Ascent_LoadMBLegTiles

Function_MotherBrainBody_FakeDeath_Ascent_LoadMBLegTiles:
    LDX.W #MotherBrainFightSpriteTileTransferEntries_legs 
    JSR.W ProcessSpriteTilesTransfers 
    BCS .finishedLoading 
    RTS 


.finishedLoading:
    LDA.W #Function_MotherBrainBody_FakeDeath_Ascent_ContinuePausing 
    STA.W $0FA8 ; fallthrough to Function_MotherBrainBody_FakeDeath_Ascent_ContinuePausing


Function_MotherBrainBody_FakeDeath_Ascent_ContinuePausing:
    DEC.W $0FB2 
    BPL .return 
    LDA.W #$003B 
    STA.W $0F7A 
    LDA.W #$0117 
    STA.W $0F7E 
    LDA.W #$FFE5 
    STA.B $B5 
    LDA.W #$FF27 
    STA.B $B7 
    LDA.W #$0007 
    STA.L $7E7808 
    LDA.W #Function_MotherBrainBody_FakeDeath_Ascent_StartMusic_Quake 
    STA.W $0FA8 

.return:
    RTS 


Function_MotherBrainBody_FakeDeath_Ascent_StartMusic_Quake:
    LDA.W #InstList_MotherBrainBody_Crouched 
    JSR.W SetMotherBrainBodyInstList 
    LDA.W #$0001 
    STA.W $0FD4 
    LDA.W $0F86 
    AND.W #$FEFF 
    STA.W $0F86 
    LDA.W #$003B 
    STA.W $0F7A 
    LDA.W #$0117 
    STA.W $0F7E 
    LDA.W #$FFE5 
    STA.B $B5 
    LDA.W #$FF27 
    STA.B $B7 
    LDA.W #$0005 
    JSL.L QueueMusicDataOrTrack_8FrameDelay 
    LDA.W #$0002 
    STA.W $183E 
    LDA.W #$0100 
    STA.W $1840 
    LDA.W #$0050 
    STA.L $7E8068 
    LDA.W #$0001 
    STA.L $7E8062 
    LDA.W #$0008 
    STA.L $7E8064 
    LDA.W #$0006 
    STA.L $7E8066 
    LDA.W #Function_MotherBrainBody_FakeDeath_Ascent_RaiseMotherBrain 
    STA.W $0FA8 
    RTS 


Function_MotherBrainBody_FakeDeath_Ascent_RaiseMotherBrain:
    LDA.W $05B6 
    AND.W #$0003 
    BNE Function_MBBody_FakeDeath_Ascent_WaitForMBUncrouch_return 
    JSR.W SpawnDustCloudsForMotherBrainsAscent 
    LDA.W #$0002 
    STA.B $12 
    LDA.B $B7 
    CLC 
    ADC.B $12 
    STA.B $B7 
    LDA.W $0F7E 
    SEC 
    SBC.B $12 
    STA.W $0F7E 
    CMP.W #$00BD 
    BCS Function_MBBody_FakeDeath_Ascent_WaitForMBUncrouch_return 
    LDA.W #$0140 
    STA.W $179A 
    LDA.W #$00BC 
    STA.W $0F7E 
    STZ.W $1840 
    LDA.L $7E7812 
    TAX 
    STZ.W $18B4,X 
    LDA.W #InstList_MotherBrainBody_StandingUpAfterCrouching_Slow 
    JSR.W SetMotherBrainBodyInstList 
    LDA.W #Function_MBBody_FakeDeath_Ascent_WaitForMBUncrouch 
    STA.W $0FA8 ; fallthrough to Function_MotherBrainBody_FakeDeath_Ascent_WaitForMBUncrouch

Function_MBBody_FakeDeath_Ascent_WaitForMBUncrouch:
    LDA.L $7E7804 
    BEQ Function_MBBody_FakeDeath_Ascent_WaitForMBUncrouch_standing 

Function_MBBody_FakeDeath_Ascent_WaitForMBUncrouch_return:
    RTS 


Function_MBBody_FakeDeath_Ascent_WaitForMBUncrouch_standing:
    STA.L $7E802E 
    LDA.W #Function_MBBody_FakeDeath_Ascent_TransitionFromGreyLowerHead 
    STA.W $0FA8 
    STZ.W $0FB2 
    RTS 


Function_MBBody_FakeDeath_Ascent_TransitionFromGreyLowerHead:
    DEC.W $0FB2 
    BPL .return 
    LDA.W #$0004 
    STA.W $0FB2 
    LDA.L $7E802E 
    INC A 
    STA.L $7E802E 
    DEC A 
    JSL.L TransitionMotherBrainPaletteFromGrey_FakeDeath 
    BCC .return 
    LDA.W #$0001 
    STA.L $7E7860 
    INC A 
    STA.L $7E7800 
    DEC A 
    STA.L $7E7864 
    LDA.W #$0006 
    STA.L $7E8064 
    STA.L $7E8066 
    LDA.W #$0500 
    STA.L $7E8068 
    LDA.W #Function_MotherBrainBody_Phase2_Stretching_ShakeHeadMenacing 
    STA.W $0FA8 
    LDA.W #$0017 
    STA.W $0FB2 

.return:
    RTS 


Function_MotherBrainBody_Phase2_Stretching_ShakeHeadMenacing:
    DEC.W $0FB2 
    BMI .timerExpired 
    RTS 


.timerExpired:
    LDA.W #InstList_MotherBrainHead_Stretching_Phase2_0 
    JSR.W SetMotherBrainHeadInstList 
    LDA.W #Function_MotherBrainBody_Phase2_Stretching_BringHeadBackUp 
    STA.W $0FA8 
    LDA.W #$0040 
    STA.L $7E8068 
    LDA.W #$0100 
    STA.W $0FB2 ; fallthrough to Function_MotherBrainBody_Phase2_Stretching_BringHeadBackUp

Function_MotherBrainBody_Phase2_Stretching_BringHeadBackUp:
    DEC.W $0FB2 
    BPL Function_MotherBrainBody_Phase2_Stretching_FinishStretching_return 
    LDA.W #$0002 
    STA.L $7E8064 
    LDA.W #$0004 
    STA.L $7E8066 
    LDA.W #Function_MotherBrainBody_Phase2_Stretching_FinishStretching 
    STA.W $0FA8 
    LDA.W #$0040 
    STA.W $0FB2 ; fallthrough to Function_MotherBrainBody_Phase2_Stretching_FinishStretching


Function_MotherBrainBody_Phase2_Stretching_FinishStretching:
    DEC.W $0FB2 
    BPL .return 
    LDA.W #$0001 
    STA.L $7E7868 
    LDA.W #Function_MotherBrainBody_Phase2_Thinking 
    STA.W $0FA8 

.return:
    RTS 


SpawnDustCloudsForMotherBrainsAscent:
    DEC.W $0FF2 
    BPL .timerNotExpired 
    LDA.W #$0007 
    STA.W $0FF2 

.timerNotExpired:
    LDA.W $0FF2 
    ASL A 
    TAX 
    LDA.W .XPositions,X 
    STA.B $12 
    LDA.W #$00D4 
    STA.B $14 
    LDA.W $05E5 
    AND.W #$0100 
    XBA 
    TAX 
    LDA.W .explosionType,X 
    AND.W #$00FF 
    LDY.W #EnemyProjectile_MiscDust 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    LDA.W #$0029 
    JSL.L QueueSound_Lib2_Max3 
    RTS 


.explosionType:
    db $09,$12 

.XPositions:
    dw $003D,$0054,$0020,$0035,$005A,$0043,$0067,$0029 

MotherBrainFightSpriteTileTransferEntries:
  .legs
    dw $0200 
    dl Tiles_MotherBrainLegs 
    dw $7400,$0200 
    dl Tiles_MotherBrainLegs+$200 
    dw $7500,$0200 
    dl Tiles_MotherBrainLegs+$400 
    dw $7600,$0200 
    dl Tiles_MotherBrainLegs+$600 
    dw $7700,$0200 
    dl Tiles_MotherBrainLegs+$800 
    dw $7800,$0200 
    dl Tiles_MotherBrainLegs+$A00 
    dw $7900,$0200 
    dl Tiles_MotherBrainLegs+$C00 
    dw $7A00,$0200 
    dl Tiles_MotherBrainLegs+$E00 
    dw $7B00 

  .attacks
    dw $0200 
    dl Tiles_MotherBrain_BombShells_DeathBeam_UnusedGFX 
    dw $7C00,$0200 
    dl Tiles_MotherBrain_BombShells_DeathBeam_UnusedGFX+$200 
    dw $7D00,$0200 
    dl Tiles_MotherBrain_BombShells_DeathBeam_UnusedGFX+$400 
    dw $7E00,$0200 
    dl Tiles_MotherBrain_BombShells_DeathBeam_UnusedGFX+$600 
    dw $7F00,$0000 

  .babyMetroid
    dw $0200 
    dl Tiles_BabyMetroid+$400 
    dw $7C00,$0200 
    dl Tiles_BabyMetroid+$600 
    dw $7D00,$0200 
    dl Tiles_BabyMetroid+$800 
    dw $7E00,$0200 
    dl Tiles_BabyMetroid+$A00 
    dw $7F00,$0000 

  .corpse
    dw $01C0 
    dl Tiles_CorpseMotherBrain 
    dw $7A00,$01C0 
    dl Tiles_CorpseMotherBrain+$200 
    dw $7B00,$01C0 
    dl Tiles_CorpseMotherBrain+$400 
    dw $7C00,$01C0 
    dl Tiles_CorpseMotherBrain+$600 
    dw $7D00,$01C0 
    dl Tiles_CorpseMotherBrain+$800 
    dw $7E00,$01C0 
    dl Tiles_CorpseMotherBrain+$A00 
    dw $7F00,$0000 

  .explodedDoor
    dw $0200 
    dl Tiles_MotherBrainExplodedEscapeDoorParticles 
    dw $7000,$0200 
    dl Tiles_MotherBrainExplodedEscapeDoorParticles+$200 
    dw $7100,$0000 

SetupMotherBrainsNeckForFakeDeathAscent:
    LDA.W #$0002 
    STA.L $7E8048 
    LDA.W #$000A 
    STA.L $7E804E 
    STA.L $7E805A 
    LDA.W #$0014 
    STA.L $7E8054 
    STA.L $7E8060 
    LDA.W #$4800 
    STA.L $7E8040 
    LDA.W #$5000 
    STA.L $7E8042 
    LDA.W #$0100 
    STA.L $7E8068 
    RTS 


HandleMotherBrainsNeck_Lower:
    LDA.L $7E8064 
    TAX 
    JMP.W (.pointers,X) 


.pointers:
    dw RTS_A99084 
    dw HandleMotherBrainsNeck_Lower_2_BobDown 
    dw HandleMotherBrainsNeck_Lower_4_BobUp 
    dw HandleMotherBrainsNeck_Lower_6_Lower 
    dw HandleMotherBrainsNeck_Lower_8_Raise 

RTS_A99084:
    RTS 


HandleMotherBrainsNeck_Lower_2_BobDown:
    LDA.L $7E8040 
    SEC 
    SBC.L $7E8068 
    CMP.W #$2800 
    BCS + 
    LDA.W #$0004 
    STA.L $7E8064 
    LDA.W #$2800 

  + STA.L $7E8040 
    RTS 


HandleMotherBrainsNeck_Lower_4_BobUp:
    LDA.W $0FBE 
    CMP.W #$003C 
    BMI .bobDown 
    LDA.L $7E8040 
    CLC 
    ADC.L $7E8068 
    CMP.W #$9000 
    BCC + 
    LDA.W #$0002 
    STA.L $7E8064 
    LDA.W #$9000 

  + STA.L $7E8040 
    RTS 


.bobDown:
    LDA.W #$0002 
    STA.L $7E8064 
    RTS 


HandleMotherBrainsNeck_Lower_6_Lower:
    LDA.L $7E8040 
    SEC 
    SBC.L $7E8068 
    CMP.W #$3000 
    BCS + 
    LDA.W #$0000 
    STA.L $7E8064 
    LDA.W #$3000 

  + STA.L $7E8040 
    RTS 


HandleMotherBrainsNeck_Lower_8_Raise:
    LDA.L $7E8040 
    CLC 
    ADC.L $7E8068 
    CMP.W #$9000 
    BCC + 
    LDA.W #$0000 
    STA.L $7E8064 
    LDA.W #$9000 

  + STA.L $7E8040 
    RTS 


HandleMotherBrainsNeck_Upper:
    LDA.L $7E8066 
    TAX 
    JMP.W (.pointers,X) 


.pointers:
    dw RTS_A9911B 
    dw HandleMotherBrainsNeck_Upper_3_BobDown 
    dw HandleMotherBrainsNeck_Upper_4_BobUp 
    dw HandleMotherBrainsNeck_Upper_6_Lower 
    dw HandleMotherBrainsNeck_Upper_8_Raise 

RTS_A9911B:
    RTS 


HandleMotherBrainsNeck_Upper_3_BobDown:
    LDA.W $0FBE 
    CLC 
    ADC.W #$0004 
    CMP.W $0AFA 
    BMI + 
    LDA.W #$0004 
    STA.L $7E8064 
    STA.L $7E8066 
    RTS 


  + LDA.L $7E8042 
    SEC 
    SBC.L $7E8068 
    CMP.W #$2000 
    BCS + 
    LDA.W #$0004 
    STA.L $7E8066 
    LDA.W #$2000 

  + STA.L $7E8042 
    RTS 


HandleMotherBrainsNeck_Upper_4_BobUp:
    LDA.L $7E8040 
    CLC 
    ADC.W #$0800 
    STA.B $12 
    LDA.L $7E8042 
    CLC 
    ADC.L $7E8068 
    CMP.B $12 
    BCC + 
    LDA.W #$0002 
    STA.L $7E8066 
    LDA.B $12 

  + STA.L $7E8042 
    RTS 


HandleMotherBrainsNeck_Upper_6_Lower:
    LDA.L $7E8042 
    SEC 
    SBC.L $7E8068 
    CMP.W #$2000 
    BCS + 
    LDA.W #$0000 
    STA.L $7E8066 
    LDA.W #$2000 

  + STA.L $7E8042 
    RTS 


HandleMotherBrainsNeck_Upper_8_Raise:
    LDA.L $7E8040 
    CLC 
    ADC.W #$0800 
    STA.B $12 
    LDA.L $7E8042 
    CLC 
    ADC.L $7E8068 
    CMP.B $12 
    BCC + 
    LDA.W #$0000 
    STA.L $7E8066 
    LDA.B $12 

  + STA.L $7E8042 
    RTS 


HandleMotherBrainsNeck:
    LDA.W #$FFB0 
    CLC 
    ADC.W $0F7A 
    STA.L $7E7814 
    LDA.W #$002E 
    CLC 
    ADC.W $0F7E 
    STA.L $7E7816 
    LDA.L $7E8062 
    BEQ .neckMovementDisabled 
    JSR.W HandleMotherBrainsNeck_Lower 
    JSR.W HandleMotherBrainsNeck_Upper 

.neckMovementDisabled:
    LDA.L $7E8041 
    AND.W #$00FF 
    STA.B $12 
    LDA.L $7E8048 
    JSL.L GetSineMathInA_A9C460 
    CLC 
    ADC.L $7E7814 
    CLC 
    ADC.W #$0070 
    STA.L $7E8044 
    LDA.L $7E8048 
    JSL.L GetCosineMathInA_A9C465 
    CLC 
    ADC.L $7E7816 
    CLC 
    ADC.W #$FFA0 
    STA.L $7E8046 
    LDA.L $7E804E 
    JSL.L GetSineMathInA_A9C460 
    CLC 
    ADC.L $7E7814 
    CLC 
    ADC.W #$0070 
    STA.L $7E804A 
    LDA.L $7E804E 
    JSL.L GetCosineMathInA_A9C465 
    CLC 
    ADC.L $7E7816 
    CLC 
    ADC.W #$FFA0 
    STA.L $7E804C 
    LDA.L $7E8054 
    JSL.L GetSineMathInA_A9C460 
    CLC 
    ADC.L $7E7814 
    CLC 
    ADC.W #$0070 
    STA.L $7E8050 
    LDA.L $7E8054 
    JSL.L GetCosineMathInA_A9C465 
    CLC 
    ADC.L $7E7816 
    CLC 
    ADC.W #$FFA0 
    STA.L $7E8052 
    LDA.L $7E8043 
    AND.W #$00FF 
    STA.B $12 
    LDA.L $7E805A 
    JSL.L GetSineMathInA_A9C460 
    CLC 
    ADC.L $7E8050 
    STA.L $7E8056 
    LDA.L $7E805A 
    JSL.L GetCosineMathInA_A9C465 
    CLC 
    ADC.L $7E8052 
    STA.L $7E8058 
    LDA.L $7E8060 
    JSL.L GetSineMathInA_A9C460 
    CLC 
    ADC.L $7E8050 
    STA.L $7E805C 
    LDA.L $7E8060 
    JSL.L GetCosineMathInA_A9C465 
    CLC 
    ADC.L $7E8052 
    STA.L $7E805E 
    RTS 


GetMotherBrainHeadSpritemapPointerInY:
    LDA.W $0A78 
    BNE .timeFrozen 
    LDA.L $7E8002 
    BMI .processInstList 

.noDraw:
    PLA 
    RTS 


.timeFrozen:
    LDA.L $7E8002 
    BPL .noDraw 
    TAX 
    LDY.W $0002,X 
    RTS 


.processInstList:
    TAX 
    LDA.W $0000,X 
    BMI .ASMInstruction 
    CMP.L $7E8000 
    BPL .tick 
    INX 
    INX 
    INX 
    INX 

.loop:
    LDA.W $0000,X 
    BPL .specialInstruction 

.ASMInstruction:
    STA.B $00 
    INX 
    INX 
    PEA.W .loop-1 
    JMP.W ($0000) 


.specialInstruction:
    LDA.W #$0001 
    STA.L $7E8000 
    TXA 
    STA.L $7E8002 
    LDY.W $0002,X 
    RTS 


.tick:
    LDA.L $7E8000 
    INC A 
    STA.L $7E8000 
    LDY.W $0002,X 
    RTS 


DrawMotherBrainsNeck:
    LDA.W $0F86 
    AND.W #$0100 
    BEQ .visible 
    RTS 


.visible:
    LDA.L $7E805C 
    STA.B $12 
    LDA.L $7E805E 
    STA.B $14 
    JSR.W DrawMotherBrainNeckSegment 
    LDA.L $7E8056 
    STA.B $12 
    LDA.L $7E8058 
    STA.B $14 
    JSR.W DrawMotherBrainNeckSegment 
    LDA.L $7E8050 
    STA.B $12 
    LDA.L $7E8052 
    STA.B $14 
    JSR.W DrawMotherBrainNeckSegment 
    LDA.L $7E804A 
    STA.B $12 
    LDA.L $7E804C 
    STA.B $14 
    JSR.W DrawMotherBrainNeckSegment 
    LDA.L $7E8044 
    STA.B $12 
    LDA.L $7E8046 
    STA.B $14 
    JMP.W DrawMotherBrainNeckSegment 


DrawMotherBrainHead:
    LDA.L $7E7868 
    BEQ .getSpritemap 
    LDA.L $7E786A 
    BNE .getSpritemap 
    LDA.W $05E5 
    BMI .getSpritemap 
    LDY.W #EnemyProjectile_MotherBrainPurpleBreath_Small 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 

.getSpritemap:
    JSR.W GetMotherBrainHeadSpritemapPointerInY 
    LDA.L $7E781A 
    TAX 
    LDA.W $0FDC 
    LSR A 
    BCC .evenInvincibilityTimer 
    LDX.W #$0000 

.evenInvincibilityTimer:
    STX.B $16 
    LDA.L $7E7840 
    BEQ .nonZeroShakeTimer 
    DEC A 
    STA.L $7E7840 
    BRA + 


.nonZeroShakeTimer:
    LDA.W $0FDC 
    BNE + 
    LDA.W $0FE2 

  + AND.W #$0006 
    TAX 
    LDA.W ShakingOffsets_X,X 
    CLC 
    ADC.W $0FBA 
    STA.B $12 
    CLC 
    ADC.W #$0020 
    SEC 
    SBC.W $0911 
    BMI .return 
    LDA.W ShakingOffsets_Y,X 
    CLC 
    ADC.W $0FBE 
    STA.B $14 
    JMP.W AddSpritemapToOAM_RoomCoordinates 


.return:
    RTS 


ShakingOffsets_X:
    dw $0000,$FFFF,$0000,$0001 

ShakingOffsets_Y:
    dw $0000,$0001,$FFFF,$0001 

DrawMotherBrainNeckSegment:
    LDA.W $0FDC 
    AND.W #$0006 
    TAX 
    LDA.W ShakingOffsets_X,X 
    CLC 
    ADC.B $12 
    STA.B $12 
    LDA.W ShakingOffsets_Y,X 
    CLC 
    ADC.B $14 
    STA.B $14 
    LDA.L $7E7818 
    STA.B $16 
    LDY.W #Spritemaps_MotherBrain_5 
    JMP.W AddSpritemapToOAM_RoomCoordinates ; >.<


AddSpritemapToOAM_RoomCoordinates:
    LDA.W $0000,Y 
    INY 
    INY 
    STA.B $18 
    LDX.W $0590 
    CLC 

.loop:
    LDA.W $0001,Y 
    AND.W #$FF00 
    BPL + 
    ORA.W #$00FF 

  + XBA 
    CLC 
    ADC.B $14 
    SEC 
    SBC.W $0915 
    BMI .next 
    STA.B $1A 
    LDA.W $0000,Y 
    ADC.B $12 
    SEC 
    SBC.W $0911 
    STA.W $0370,X 
    AND.W #$0100 
    BEQ .checkSizeBit 
    LDA.L MapOfOAMIndexToHighOAM_address,X 
    STA.B $1C 
    LDA.B ($1C) 
    ORA.L MapOfOAMIndex_highXPosBit,X 
    STA.B ($1C) 

.checkSizeBit:
    LDA.W $0000,Y 
    BPL + 
    LDA.L MapOfOAMIndexToHighOAM_address,X 
    STA.B $1C 
    LDA.B ($1C) 
    ORA.L MapOfOAMIndex_sizeBit,X 
    STA.B ($1C) 

  + LDA.B $1A 
    STA.W $0371,X 
    LDA.W $0003,Y 
    ORA.B $16 
    STA.W $0372,X 
    TXA 
    CLC 
    ADC.W #$0004 
    AND.W #$01FF 
    TAX 

.next:
    TYA 
    CLC 
    ADC.W #$0005 
    TAY 
    DEC.B $18 
    BNE .loop 
    STX.W $0590 
    RTS 


Calculate_MotherBrain_RainbowBeam_HDMATables:
    PHB 
    PEA.W $AD00 
    PLB 
    PLB 
    JSL.L CalculateMotherBrainRainbowBeamHDMATables 
    PLB 
    RTL 


Palette_MotherBrain:
    dw $3800,$269F,$0159,$004C,$0004,$5739,$4273,$2DAD 
    dw $14C6,$367F,$29F9,$2173,$150C,$0C86,$7FFF,$0000 

Palette_MotherBrain_BackLeg:
    dw $3800,$0000,$0000,$0000,$0024,$29AD,$214A,$14E7 
    dw $0C63,$0000,$0000,$0000,$0000,$0000,$29AD,$0000 

Palette_MotherBrain_Attacks:
    dw $3800,$7FE0,$6B20,$5640,$03FF,$02BF,$015F,$001F 
    dw $29F9,$2173,$150C,$6318,$4631,$294A,$7FFF,$0C63 

Palette_MotherBrain_BabyMetroid:
    dw $3800,$57B8,$0B11,$1646,$00E3,$72FF,$2CDF,$24B9 
    dw $1CAF,$18A9,$4F9F,$3ED8,$2E12,$08CD,$7FFF,$0000 

Palette_MotherBrain_TubeProjectiles:
    dw $3800,$6318,$6318,$0802,$5294,$39CE,$2108,$1084 
    dw $0019,$0012,$5C00,$4000,$1084,$197F,$7FFF,$0000 

Palette_MotherBrain_GlassShards:
    dw $3800,$5294,$39CE,$2108,$7F8B,$6F0A,$5E88,$4E07 
    dw $3986,$2905,$1883,$0802,$1084,$6318,$7FFF,$0000 

Palette_MotherBrain_ExplodedDoor:
    dw $3800,$4D1F,$38B6,$246E,$1448,$47FF,$2EFA,$1616 
    dw $0132,$5294,$4210,$318C,$2108,$1084,$7FFF,$0000 

MoveMotherBrainBodyDownByA_ScrollLeftByX:
    PHA 
    CLC 
    ADC.W $0F7E 
    STA.W $0F7E 
    PLA 
    EOR.W #$FFFF 
    INC A 
    CLC 
    ADC.B $B7 
    STA.B $B7 
    TXA 
    CLC 
    ADC.W #$0022 
    STA.B $14 
    LDA.W $0F7A 
    EOR.W #$FFFF 
    INC A 
    CLC 
    ADC.B $14 
    STA.B $B5 
    PLX 
    RTL 


MoveMotherBrainBodyDownByA:
    PHA 
    CLC 
    ADC.W $0F7E 
    STA.W $0F7E 
    PLA 
    EOR.W #$FFFF 
    INC A 
    CLC 
    ADC.B $B7 
    STA.B $B7 
    LDA.W #$0000 
    SEC 
    SBC.W $0F7A 
    CLC 
    ADC.W #$0022 
    STA.B $B5 
    RTL 


MotherBrainFootstepEffect:
    LDA.W #$0001 
    STA.W $183E 
    LDA.W #$0004 
    STA.W $1840 
    LDA.L $7E7800 
    CMP.W #$0003 
    BNE .return 
    LDA.W #$0016 
    STA.L QueueSound_Lib3_Max6 ; >_<

.return:
    RTS 


Instruction_MotherBrainBody_MoveBodyUpBy10_ScrollLeftBy4:
    PHX 
    LDX.W #$0004 
    LDA.W #$FFF6 
    JMP.W MoveMotherBrainBodyDownByA_ScrollLeftByX 


Instruction_MotherBrainBody_MoveBodyUpBy16_ScrollLeftBy4:
    PHX 
    LDX.W #$0004 
    LDA.W #$FFF0 
    JMP.W MoveMotherBrainBodyDownByA_ScrollLeftByX 


Instruction_MotherBrainBody_MoveBodyUpBy12_ScrollRightBy2:
    PHX 
    LDX.W #$FFFE 
    LDA.W #$FFF4 
    JMP.W MoveMotherBrainBodyDownByA_ScrollLeftByX 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Instruction_MotherBrainBody_MoveBodyRightBy2_A995D4:
    PHX 
    LDX.W #$FFFE 
    LDA.W #$0000 
    JMP.W MoveMotherBrainBodyDownByA_ScrollLeftByX 
endif ; !FEATURE_KEEP_UNREFERENCED


Instruction_MotherBrainBody_MoveBodyDownBy12_ScrollLeftBy4:
    PHX 
    LDX.W #$0004 
    LDA.W #$000C 
    JMP.W MoveMotherBrainBodyDownByA_ScrollLeftByX 


Instruction_MotherBrainBody_MoveBodyDownBy16_ScrollRightBy2:
    PHX 
    LDX.W #$FFFE 
    LDA.W #$0010 
    JMP.W MoveMotherBrainBodyDownByA_ScrollLeftByX 


Instruction_MotherBrainBody_MoveBodyDownBy10_ScrollRightBy2:
    PHX 
    LDX.W #$FFFE 
    LDA.W #$000A 
    JMP.W MoveMotherBrainBodyDownByA_ScrollLeftByX 


Instruction_MotherBrainBody_MoveBodyUpBy2_ScrollRightBy1:
    LDA.W $0F7A 
    CLC 
    ADC.W #$0001 
    STA.W $0F7A 
    LDA.W #$FFFE 
    JMP.W MoveMotherBrainBodyDownByA 


Instruction_MotherBrainBody_MoveBodyRightBy2:
    LDA.W $0F7A 
    CLC 
    ADC.W #$0002 
    STA.W $0F7A 
    LDA.W #$0000 
    JMP.W MoveMotherBrainBodyDownByA 


Instruction_MotherBrainBody_MoveBodyUpBy1:
    LDA.W #$0001 
    JMP.W MoveMotherBrainBodyDownByA 


Instruction_MotherBrainBody_MoveBodyUpBy1_RightBy3_Footstep:
    LDA.W #$0022 
    JSR.W MotherBrainFootstepEffect 
    LDA.W $0F7A 
    CLC 
    ADC.W #$0003 
    STA.W $0F7A 
    LDA.W #$0001 
    JMP.W MoveMotherBrainBodyDownByA 


Instruction_MotherBrainBody_MoveBodyDownBy2_RightBy15:
    LDA.W $0F7A 
    CLC 
    ADC.W #$000F 
    STA.W $0F7A 
    LDA.W #$FFFE 
    JMP.W MoveMotherBrainBodyDownByA 


Instruction_MotherBrainBody_MoveBodyDownBy4_RightBy6:
    LDA.W $0F7A 
    CLC 
    ADC.W #$0006 
    STA.W $0F7A 
    LDA.W #$FFFC 
    JMP.W MoveMotherBrainBodyDownByA 


Instruction_MotherBrainBody_MoveBodyUpBy4_LeftBy2:
    LDA.W $0F7A 
    CLC 
    ADC.W #$FFFE 
    STA.W $0F7A 
    LDA.W #$0004 
    JMP.W MoveMotherBrainBodyDownByA 


Instruction_MotherBrainBody_MoveBodyUpBy2_LeftBy1_Footstep:
    LDA.W #$FFEF 
    JSR.W MotherBrainFootstepEffect 
    LDA.W $0F7A 
    CLC 
    ADC.W #$FFFF 
    STA.W $0F7A 
    LDA.W #$0002 
    JMP.W MoveMotherBrainBodyDownByA 


Instruction_MotherBrainBody_MoveBodyUpBy2_LeftBy1_Footstep_duplicate:
    LDA.W #$000B 
    JSR.W MotherBrainFootstepEffect 
    LDA.W $0F7A 
    SEC 
    SBC.W #$0001 
    STA.W $0F7A 
    LDA.W #$0002 
    JMP.W MoveMotherBrainBodyDownByA 


Instruction_MotherBrainBody_MoveBodyLeftBy2:
    LDA.W $0F7A 
    SEC 
    SBC.W #$0002 
    STA.W $0F7A 
    LDA.W #$0000 
    JMP.W MoveMotherBrainBodyDownByA 


Instruction_MotherBrainBody_MoveBodyDownBy1:
    LDA.W #$FFFF 
    JMP.W MoveMotherBrainBodyDownByA 


Instruction_MotherBrainBody_MoveBodyDownBy1_LeftBy3:
    LDA.W $0F7A 
    SEC 
    SBC.W #$0003 
    STA.W $0F7A 
    LDA.W #$FFFF 
    JMP.W MoveMotherBrainBodyDownByA 


Instruction_MotherBrainBody_MoveBodyUpBy2_LeftBy15_Footstep:
    LDA.W #$FFDB 
    JSR.W MotherBrainFootstepEffect 
    LDA.W $0F7A 
    SEC 
    SBC.W #$000F 
    STA.W $0F7A 
    LDA.W #$0002 
    JMP.W MoveMotherBrainBodyDownByA 


Instruction_MotherBrainBody_MoveBodyUpBy4_LeftBy6:
    LDA.W $0F7A 
    SEC 
    SBC.W #$0006 
    STA.W $0F7A 
    LDA.W #$0004 
    JMP.W MoveMotherBrainBodyDownByA 


Instruction_MotherBrainBody_MoveBodyDownBy4_RightBy2:
    LDA.W $0F7A 
    SEC 
    SBC.W #$FFFE 
    STA.W $0F7A 
    LDA.W #$FFFC 
    JMP.W MoveMotherBrainBodyDownByA 


Instruction_MotherBrainBody_MoveBodyDownBy2_RightBy1:
    LDA.W $0F7A 
    SEC 
    SBC.W #$FFFF 
    STA.W $0F7A 
    LDA.W #$FFFE 
    JMP.W MoveMotherBrainBodyDownByA 


Instruction_MotherBrainBody_SetPoseToStanding:
    LDA.W #$0000 
    STA.L $7E7804 
    RTL 


Instruction_MotherBrainBody_SetPoseToWalking:
    LDA.W #$0001 
    STA.L $7E7804 
    RTL 


Instruction_MotherBrainBody_SetPoseToCrouching:
    LDA.W #$0003 
    STA.L $7E7804 
    RTL 


Instruction_MotherBrainBody_SetPoseToCrouchingTransition:
    LDA.W #$0002 
    STA.L $7E7804 
    RTL 


Instruction_MotherBrainBody_SetPoseToDeathBeamMode:
    LDA.W #$0004 
    STA.L $7E7804 
    RTL 


Instruction_MotherBrainBody_SetPoseToLeaningDown:
    LDA.W #$0006 
    STA.L $7E7804 
    RTL 


InstList_MotherBrainBody_WalkingForwards_ReallyFast:
    dw Instruction_MotherBrainBody_SetPoseToWalking 
    dw $0002 
    dw ExtendedSpritemap_MotherBrainBody_Standing 
    dw Instruction_MotherBrainBody_MoveBodyUpBy2_ScrollRightBy1 
    dw $0002 
    dw ExtendedSpritemap_MotherBrainBody_Walking_0 
    dw Instruction_MotherBrainBody_MoveBodyRightBy2 
    dw $0002 
    dw ExtendedSpritemap_MotherBrainBody_Walking_1 
    dw Instruction_MotherBrainBody_MoveBodyUpBy1 
    dw $0002 
    dw ExtendedSpritemap_MotherBrainBody_Walking_2 
    dw Instruction_MotherBrainBody_MoveBodyUpBy1_RightBy3_Footstep 
    dw $0002 
    dw ExtendedSpritemap_MotherBrainBody_Walking_3 
    dw Instruction_MotherBrainBody_MoveBodyDownBy2_RightBy15 
    dw $0002 
    dw ExtendedSpritemap_MotherBrainBody_Walking_4 
    dw Instruction_MotherBrainBody_MoveBodyDownBy4_RightBy6 
    dw $0002 
    dw ExtendedSpritemap_MotherBrainBody_Walking_5 
    dw Instruction_MotherBrainBody_MoveBodyUpBy4_LeftBy2 
    dw $0002 
    dw ExtendedSpritemap_MotherBrainBody_Walking_6 
    dw Instruction_MotherBrainBody_MoveBodyUpBy2_LeftBy1_Footstep 
    dw Instruction_MotherBrainBody_SetPoseToStanding 
    dw $0002 
    dw ExtendedSpritemap_MotherBrainBody_Walking_7 
    dw Instruction_Common_Sleep 

InstList_MotherBrainBody_WalkingForwards_Fast:
    dw Instruction_MotherBrainBody_SetPoseToWalking 
    dw $0004 
    dw ExtendedSpritemap_MotherBrainBody_Standing 
    dw Instruction_MotherBrainBody_MoveBodyUpBy2_ScrollRightBy1 
    dw $0004 
    dw ExtendedSpritemap_MotherBrainBody_Walking_0 
    dw Instruction_MotherBrainBody_MoveBodyRightBy2 
    dw $0004 
    dw ExtendedSpritemap_MotherBrainBody_Walking_1 
    dw Instruction_MotherBrainBody_MoveBodyUpBy1 
    dw $0004 
    dw ExtendedSpritemap_MotherBrainBody_Walking_2 
    dw Instruction_MotherBrainBody_MoveBodyUpBy1_RightBy3_Footstep 
    dw $0004 
    dw ExtendedSpritemap_MotherBrainBody_Walking_3 
    dw Instruction_MotherBrainBody_MoveBodyDownBy2_RightBy15 
    dw $0004 
    dw ExtendedSpritemap_MotherBrainBody_Walking_4 
    dw Instruction_MotherBrainBody_MoveBodyDownBy4_RightBy6 
    dw $0004 
    dw ExtendedSpritemap_MotherBrainBody_Walking_5 
    dw Instruction_MotherBrainBody_MoveBodyUpBy4_LeftBy2 
    dw $0004 
    dw ExtendedSpritemap_MotherBrainBody_Walking_6 
    dw Instruction_MotherBrainBody_MoveBodyUpBy2_LeftBy1_Footstep 
    dw Instruction_MotherBrainBody_SetPoseToStanding 
    dw $0004 
    dw ExtendedSpritemap_MotherBrainBody_Walking_7 
    dw Instruction_Common_Sleep 

InstList_MotherBrainBody_WalkingForwards_Medium:
    dw Instruction_MotherBrainBody_SetPoseToWalking 
    dw $0006 
    dw ExtendedSpritemap_MotherBrainBody_Standing 
    dw Instruction_MotherBrainBody_MoveBodyUpBy2_ScrollRightBy1 
    dw $0006 
    dw ExtendedSpritemap_MotherBrainBody_Walking_0 
    dw Instruction_MotherBrainBody_MoveBodyRightBy2 
    dw $0006 
    dw ExtendedSpritemap_MotherBrainBody_Walking_1 
    dw Instruction_MotherBrainBody_MoveBodyUpBy1 
    dw $0006 
    dw ExtendedSpritemap_MotherBrainBody_Walking_2 
    dw Instruction_MotherBrainBody_MoveBodyUpBy1_RightBy3_Footstep 
    dw $0006 
    dw ExtendedSpritemap_MotherBrainBody_Walking_3 
    dw Instruction_MotherBrainBody_MoveBodyDownBy2_RightBy15 
    dw $0006 
    dw ExtendedSpritemap_MotherBrainBody_Walking_4 
    dw Instruction_MotherBrainBody_MoveBodyDownBy4_RightBy6 
    dw $0006 
    dw ExtendedSpritemap_MotherBrainBody_Walking_5 
    dw Instruction_MotherBrainBody_MoveBodyUpBy4_LeftBy2 
    dw $0006 
    dw ExtendedSpritemap_MotherBrainBody_Walking_6 
    dw Instruction_MotherBrainBody_MoveBodyUpBy2_LeftBy1_Footstep 
    dw Instruction_MotherBrainBody_SetPoseToStanding 
    dw $0006 
    dw ExtendedSpritemap_MotherBrainBody_Walking_7 
    dw Instruction_Common_Sleep 

InstList_MotherBrainBody_WalkingForwards_Slow:
    dw Instruction_MotherBrainBody_SetPoseToWalking 
    dw $0008 
    dw ExtendedSpritemap_MotherBrainBody_Standing 
    dw Instruction_MotherBrainBody_MoveBodyUpBy2_ScrollRightBy1 
    dw $0008 
    dw ExtendedSpritemap_MotherBrainBody_Walking_0 
    dw Instruction_MotherBrainBody_MoveBodyRightBy2 
    dw $0008 
    dw ExtendedSpritemap_MotherBrainBody_Walking_1 
    dw Instruction_MotherBrainBody_MoveBodyUpBy1 
    dw $0008 
    dw ExtendedSpritemap_MotherBrainBody_Walking_2 
    dw Instruction_MotherBrainBody_MoveBodyUpBy1_RightBy3_Footstep 
    dw $0008 
    dw ExtendedSpritemap_MotherBrainBody_Walking_3 
    dw Instruction_MotherBrainBody_MoveBodyDownBy2_RightBy15 
    dw $0008 
    dw ExtendedSpritemap_MotherBrainBody_Walking_4 
    dw Instruction_MotherBrainBody_MoveBodyDownBy4_RightBy6 
    dw $0008 
    dw ExtendedSpritemap_MotherBrainBody_Walking_5 
    dw Instruction_MotherBrainBody_MoveBodyUpBy4_LeftBy2 
    dw $0008 
    dw ExtendedSpritemap_MotherBrainBody_Walking_6 
    dw Instruction_MotherBrainBody_MoveBodyUpBy2_LeftBy1_Footstep 
    dw Instruction_MotherBrainBody_SetPoseToStanding 
    dw $0008 
    dw ExtendedSpritemap_MotherBrainBody_Walking_7 
    dw Instruction_Common_Sleep 

InstList_MotherBrainBody_WalkingForwards_ReallySlow:
    dw Instruction_MotherBrainBody_SetPoseToWalking 
    dw $000A 
    dw ExtendedSpritemap_MotherBrainBody_Standing 
    dw Instruction_MotherBrainBody_MoveBodyUpBy2_ScrollRightBy1 
    dw $000A 
    dw ExtendedSpritemap_MotherBrainBody_Walking_0 
    dw Instruction_MotherBrainBody_MoveBodyRightBy2 
    dw $000A 
    dw ExtendedSpritemap_MotherBrainBody_Walking_1 
    dw Instruction_MotherBrainBody_MoveBodyUpBy1 
    dw $000A 
    dw ExtendedSpritemap_MotherBrainBody_Walking_2 
    dw Instruction_MotherBrainBody_MoveBodyUpBy1_RightBy3_Footstep 
    dw $000A 
    dw ExtendedSpritemap_MotherBrainBody_Walking_3 
    dw Instruction_MotherBrainBody_MoveBodyDownBy2_RightBy15 
    dw $000A 
    dw ExtendedSpritemap_MotherBrainBody_Walking_4 
    dw Instruction_MotherBrainBody_MoveBodyDownBy4_RightBy6 
    dw $000A 
    dw ExtendedSpritemap_MotherBrainBody_Walking_5 
    dw Instruction_MotherBrainBody_MoveBodyUpBy4_LeftBy2 
    dw $000A 
    dw ExtendedSpritemap_MotherBrainBody_Walking_6 
    dw Instruction_MotherBrainBody_MoveBodyUpBy2_LeftBy1_Footstep 
    dw Instruction_MotherBrainBody_SetPoseToStanding 
    dw $000A 
    dw ExtendedSpritemap_MotherBrainBody_Walking_7 
    dw Instruction_Common_Sleep 

InstList_MotherBrainBody_WalkingBackwards_Slow:
    dw Instruction_MotherBrainBody_SetPoseToWalking 
    dw $0008 
    dw ExtendedSpritemap_MotherBrainBody_Walking_7 
    dw Instruction_MotherBrainBody_MoveBodyDownBy2_RightBy1 
    dw $0008 
    dw ExtendedSpritemap_MotherBrainBody_Walking_6 
    dw Instruction_MotherBrainBody_MoveBodyDownBy4_RightBy2 
    dw $0008 
    dw ExtendedSpritemap_MotherBrainBody_Walking_5 
    dw Instruction_MotherBrainBody_MoveBodyUpBy4_LeftBy6 
    dw $0008 
    dw ExtendedSpritemap_MotherBrainBody_Walking_4 
    dw Instruction_MotherBrainBody_MoveBodyUpBy2_LeftBy15_Footstep 
    dw $0008 
    dw ExtendedSpritemap_MotherBrainBody_Walking_3 
    dw Instruction_MotherBrainBody_MoveBodyDownBy1_LeftBy3 
    dw $0008 
    dw ExtendedSpritemap_MotherBrainBody_Walking_2 
    dw Instruction_MotherBrainBody_MoveBodyDownBy1 
    dw $0008 
    dw ExtendedSpritemap_MotherBrainBody_Walking_1 
    dw Instruction_MotherBrainBody_MoveBodyLeftBy2 
    dw $0008 
    dw ExtendedSpritemap_MotherBrainBody_Walking_0 
    dw Instruction_MotherBrainBody_MoveBodyUpBy2_LeftBy1_Footstep_duplicate 
    dw Instruction_MotherBrainBody_SetPoseToStanding 
    dw $0008 
    dw ExtendedSpritemap_MotherBrainBody_Standing 
    dw Instruction_Common_Sleep 

InstList_MotherBrainBody_WalkingBackwards_ReallyFast:
    dw Instruction_MotherBrainBody_SetPoseToWalking 
    dw $0002 
    dw ExtendedSpritemap_MotherBrainBody_Walking_7 
    dw Instruction_MotherBrainBody_MoveBodyDownBy2_RightBy1 
    dw $0002 
    dw ExtendedSpritemap_MotherBrainBody_Walking_6 
    dw Instruction_MotherBrainBody_MoveBodyDownBy4_RightBy2 
    dw $0002 
    dw ExtendedSpritemap_MotherBrainBody_Walking_5 
    dw Instruction_MotherBrainBody_MoveBodyUpBy4_LeftBy6 
    dw $0002 
    dw ExtendedSpritemap_MotherBrainBody_Walking_4 
    dw Instruction_MotherBrainBody_MoveBodyUpBy2_LeftBy15_Footstep 
    dw $0002 
    dw ExtendedSpritemap_MotherBrainBody_Walking_3 
    dw Instruction_MotherBrainBody_MoveBodyDownBy1_LeftBy3 
    dw $0002 
    dw ExtendedSpritemap_MotherBrainBody_Walking_2 
    dw Instruction_MotherBrainBody_MoveBodyDownBy1 
    dw $0002 
    dw ExtendedSpritemap_MotherBrainBody_Walking_1 
    dw Instruction_MotherBrainBody_MoveBodyLeftBy2 
    dw $0002 
    dw ExtendedSpritemap_MotherBrainBody_Walking_0 
    dw Instruction_MotherBrainBody_MoveBodyUpBy2_LeftBy1_Footstep_duplicate 
    dw Instruction_MotherBrainBody_SetPoseToStanding 
    dw $0002 
    dw ExtendedSpritemap_MotherBrainBody_Standing 
    dw Instruction_Common_Sleep 

InstList_MotherBrainBody_WalkingBackwards_Fast:
    dw Instruction_MotherBrainBody_SetPoseToWalking 
    dw $0004 
    dw ExtendedSpritemap_MotherBrainBody_Walking_7 
    dw Instruction_MotherBrainBody_MoveBodyDownBy2_RightBy1 
    dw $0004 
    dw ExtendedSpritemap_MotherBrainBody_Walking_6 
    dw Instruction_MotherBrainBody_MoveBodyDownBy4_RightBy2 
    dw $0004 
    dw ExtendedSpritemap_MotherBrainBody_Walking_5 
    dw Instruction_MotherBrainBody_MoveBodyUpBy4_LeftBy6 
    dw $0004 
    dw ExtendedSpritemap_MotherBrainBody_Walking_4 
    dw Instruction_MotherBrainBody_MoveBodyUpBy2_LeftBy15_Footstep 
    dw $0004 
    dw ExtendedSpritemap_MotherBrainBody_Walking_3 
    dw Instruction_MotherBrainBody_MoveBodyDownBy1_LeftBy3 
    dw $0004 
    dw ExtendedSpritemap_MotherBrainBody_Walking_2 
    dw Instruction_MotherBrainBody_MoveBodyDownBy1 
    dw $0004 
    dw ExtendedSpritemap_MotherBrainBody_Walking_1 
    dw Instruction_MotherBrainBody_MoveBodyLeftBy2 
    dw $0004 
    dw ExtendedSpritemap_MotherBrainBody_Walking_0 
    dw Instruction_MotherBrainBody_MoveBodyUpBy2_LeftBy1_Footstep_duplicate 
    dw Instruction_MotherBrainBody_SetPoseToStanding 
    dw $0004 
    dw ExtendedSpritemap_MotherBrainBody_Standing 
    dw Instruction_Common_Sleep 

InstList_MotherBrainBody_WalkingBackwards_Medium:
    dw Instruction_MotherBrainBody_SetPoseToWalking 
    dw $0006 
    dw ExtendedSpritemap_MotherBrainBody_Walking_7 
    dw Instruction_MotherBrainBody_MoveBodyDownBy2_RightBy1 
    dw $0006 
    dw ExtendedSpritemap_MotherBrainBody_Walking_6 
    dw Instruction_MotherBrainBody_MoveBodyDownBy4_RightBy2 
    dw $0006 
    dw ExtendedSpritemap_MotherBrainBody_Walking_5 
    dw Instruction_MotherBrainBody_MoveBodyUpBy4_LeftBy6 
    dw $0006 
    dw ExtendedSpritemap_MotherBrainBody_Walking_4 
    dw Instruction_MotherBrainBody_MoveBodyUpBy2_LeftBy15_Footstep 
    dw $0006 
    dw ExtendedSpritemap_MotherBrainBody_Walking_3 
    dw Instruction_MotherBrainBody_MoveBodyDownBy1_LeftBy3 
    dw $0006 
    dw ExtendedSpritemap_MotherBrainBody_Walking_2 
    dw Instruction_MotherBrainBody_MoveBodyDownBy1 
    dw $0006 
    dw ExtendedSpritemap_MotherBrainBody_Walking_1 
    dw Instruction_MotherBrainBody_MoveBodyLeftBy2 
    dw $0006 
    dw ExtendedSpritemap_MotherBrainBody_Walking_0 
    dw Instruction_MotherBrainBody_MoveBodyUpBy2_LeftBy1_Footstep_duplicate 
    dw Instruction_MotherBrainBody_SetPoseToStanding 
    dw $0006 
    dw ExtendedSpritemap_MotherBrainBody_Standing 
    dw Instruction_Common_Sleep 

InstList_MotherBrainBody_WalkingBackwards_ReallySlow:
    dw Instruction_MotherBrainBody_SetPoseToWalking 
    dw $000A 
    dw ExtendedSpritemap_MotherBrainBody_Walking_7 
    dw Instruction_MotherBrainBody_MoveBodyDownBy2_RightBy1 
    dw $000A 
    dw ExtendedSpritemap_MotherBrainBody_Walking_6 
    dw Instruction_MotherBrainBody_MoveBodyDownBy4_RightBy2 
    dw $000A 
    dw ExtendedSpritemap_MotherBrainBody_Walking_5 
    dw Instruction_MotherBrainBody_MoveBodyUpBy4_LeftBy6 
    dw $000A 
    dw ExtendedSpritemap_MotherBrainBody_Walking_4 
    dw Instruction_MotherBrainBody_MoveBodyUpBy2_LeftBy15_Footstep 
    dw $000A 
    dw ExtendedSpritemap_MotherBrainBody_Walking_3 
    dw Instruction_MotherBrainBody_MoveBodyDownBy1_LeftBy3 
    dw $000A 
    dw ExtendedSpritemap_MotherBrainBody_Walking_2 
    dw Instruction_MotherBrainBody_MoveBodyDownBy1 
    dw $000A 
    dw ExtendedSpritemap_MotherBrainBody_Walking_1 
    dw Instruction_MotherBrainBody_MoveBodyLeftBy2 
    dw $000A 
    dw ExtendedSpritemap_MotherBrainBody_Walking_0 
    dw Instruction_MotherBrainBody_MoveBodyUpBy2_LeftBy1_Footstep_duplicate 
    dw Instruction_MotherBrainBody_SetPoseToStanding 
    dw $000A 
    dw ExtendedSpritemap_MotherBrainBody_Standing 
    dw Instruction_Common_Sleep 

InstList_MotherBrainBody_CrouchAndThenStandUp:
    dw Instruction_MotherBrainBody_SetPoseToCrouchingTransition 
    dw $0008 
    dw ExtendedSpritemap_MotherBrainBody_Standing 
    dw Instruction_MotherBrainBody_MoveBodyDownBy12_ScrollLeftBy4 
    dw $0008 
    dw ExtendedSpritemap_MotherBrainBody_LeaningDown 
    dw Instruction_MotherBrainBody_MoveBodyDownBy16_ScrollRightBy2 
    dw $0008 
    dw ExtendedSpritemap_MotherBrainBody_Uncrouching 
    dw Instruction_MotherBrainBody_MoveBodyDownBy10_ScrollRightBy2 
    dw Instruction_MotherBrainBody_SetPoseToCrouching 
    dw $0008 
    dw ExtendedSpritemap_MotherBrainBody_Crouched 
    dw $0008 
    dw ExtendedSpritemap_MotherBrainBody_Crouched 
    dw Instruction_MotherBrainBody_MoveBodyUpBy10_ScrollLeftBy4 
    dw Instruction_MotherBrainBody_SetPoseToCrouchingTransition 
    dw $0008 
    dw ExtendedSpritemap_MotherBrainBody_Uncrouching 
    dw Instruction_MotherBrainBody_MoveBodyUpBy16_ScrollLeftBy4 
    dw $0008 
    dw ExtendedSpritemap_MotherBrainBody_LeaningDown 
    dw Instruction_MotherBrainBody_MoveBodyUpBy12_ScrollRightBy2 
    dw $0008 
    dw ExtendedSpritemap_MotherBrainBody_Standing 
    dw Instruction_MotherBrainBody_SetPoseToStanding 
    dw Instruction_Common_Sleep 

InstList_MotherBrainBody_StandingUpAfterCrouching_Slow:
    dw Instruction_MotherBrainBody_SetPoseToCrouchingTransition 
    dw $0010 
    dw ExtendedSpritemap_MotherBrainBody_Crouched 
    dw Instruction_MotherBrainBody_MoveBodyUpBy10_ScrollLeftBy4 
    dw $0010 
    dw ExtendedSpritemap_MotherBrainBody_Uncrouching 
    dw Instruction_MotherBrainBody_MoveBodyUpBy16_ScrollLeftBy4 
    dw $0010 
    dw ExtendedSpritemap_MotherBrainBody_LeaningDown 
    dw Instruction_MotherBrainBody_MoveBodyUpBy12_ScrollRightBy2 
    dw $0010 
    dw ExtendedSpritemap_MotherBrainBody_Standing 
    dw Instruction_MotherBrainBody_SetPoseToStanding 
    dw Instruction_Common_Sleep 

InstList_MotherBrainBody_StandingUpAfterCrouching_Fast:
    dw Instruction_MotherBrainBody_SetPoseToCrouchingTransition 
    dw $0008 
    dw ExtendedSpritemap_MotherBrainBody_Crouched 
    dw Instruction_MotherBrainBody_MoveBodyUpBy10_ScrollLeftBy4 
    dw $0008 
    dw ExtendedSpritemap_MotherBrainBody_Uncrouching 
    dw Instruction_MotherBrainBody_MoveBodyUpBy16_ScrollLeftBy4 
    dw $0008 
    dw ExtendedSpritemap_MotherBrainBody_LeaningDown 
    dw Instruction_MotherBrainBody_MoveBodyUpBy12_ScrollRightBy2 
    dw $0008 
    dw ExtendedSpritemap_MotherBrainBody_Standing 
    dw Instruction_MotherBrainBody_SetPoseToStanding 
    dw Instruction_Common_Sleep 

InstList_MotherBrainBody_StandingUpAfterLeaningDown:
    dw Instruction_MotherBrainBody_SetPoseToCrouchingTransition 
    dw $0008 
    dw ExtendedSpritemap_MotherBrainBody_LeaningDown 
    dw Instruction_MotherBrainBody_MoveBodyUpBy12_ScrollRightBy2 
    dw $0008 
    dw ExtendedSpritemap_MotherBrainBody_Standing 
    dw Instruction_MotherBrainBody_SetPoseToStanding 
    dw Instruction_Common_Sleep 

InstList_MotherBrainBody_LeaningDown:
    dw Instruction_MotherBrainBody_SetPoseToCrouchingTransition 
    dw $0008 
    dw ExtendedSpritemap_MotherBrainBody_Standing 
    dw Instruction_MotherBrainBody_MoveBodyDownBy12_ScrollLeftBy4 
    dw Instruction_MotherBrainBody_SetPoseToLeaningDown 
    dw $0008 
    dw ExtendedSpritemap_MotherBrainBody_LeaningDown 
    dw Instruction_Common_Sleep 

InstList_MotherBrainBody_Crouched:
    dw Instruction_MotherBrainBody_SetPoseToCrouching 
    dw $0008 
    dw ExtendedSpritemap_MotherBrainBody_Crouched 
    dw Instruction_Common_Sleep 

InstList_MotherBrainBody_Crouch_Slow:
    dw Instruction_MotherBrainBody_SetPoseToCrouchingTransition 
    dw $0008 
    dw ExtendedSpritemap_MotherBrainBody_Standing 
    dw Instruction_MotherBrainBody_MoveBodyDownBy12_ScrollLeftBy4 
    dw $0008 
    dw ExtendedSpritemap_MotherBrainBody_LeaningDown 
    dw Instruction_MotherBrainBody_MoveBodyDownBy16_ScrollRightBy2 
    dw $0008 
    dw ExtendedSpritemap_MotherBrainBody_Uncrouching 
    dw Instruction_MotherBrainBody_MoveBodyDownBy10_ScrollRightBy2 
    dw Instruction_MotherBrainBody_SetPoseToCrouching 
    dw $0008 
    dw ExtendedSpritemap_MotherBrainBody_Crouched 
    dw Instruction_Common_Sleep 

InstList_MotherBrainBody_Crouch_Fast:
    dw Instruction_MotherBrainBody_SetPoseToCrouchingTransition 
    dw $0008 
    dw ExtendedSpritemap_MotherBrainBody_Standing 
    dw Instruction_MotherBrainBody_MoveBodyDownBy12_ScrollLeftBy4 
    dw $0002 
    dw ExtendedSpritemap_MotherBrainBody_LeaningDown 
    dw Instruction_MotherBrainBody_MoveBodyDownBy16_ScrollRightBy2 
    dw $0002 
    dw ExtendedSpritemap_MotherBrainBody_Uncrouching 
    dw Instruction_MotherBrainBody_MoveBodyDownBy10_ScrollRightBy2 
    dw Instruction_MotherBrainBody_SetPoseToCrouching 
    dw $0008 
    dw ExtendedSpritemap_MotherBrainBody_Crouched 
    dw Instruction_Common_Sleep 

InstList_MotherBrainBody_DeathBeamMode:
    dw Instruction_MotherBrainBody_SetPoseToDeathBeamMode 
    dw $0001 
    dw ExtendedSpritemap_MotherBrainBody_Standing 
    dw $0001 
    dw ExtendedSpritemap_MotherBrainBrain_DeathBeamMode_0 
    dw $0001 
    dw ExtendedSpritemap_MotherBrainBrain_DeathBeamMode_1 
    dw Instruction_MotherBrainBody_SpawnDustCloudExplosionProj 
    dw $0024,$FFD8,$0001,$0001 
    dw ExtendedSpritemap_MotherBrainBrain_DeathBeamMode_1 
    dw Instruction_MotherBrainBody_SpawnDustCloudExplosionProj 
    dw $0022,$FFD6,$0002,$0001 
    dw ExtendedSpritemap_MotherBrainBrain_DeathBeamMode_1 
    dw Instruction_MotherBrainBody_SpawnDustCloudExplosionProj 
    dw $0024,$FFD8,$0001,$0001 
    dw ExtendedSpritemap_MotherBrainBrain_DeathBeamMode_1 
    dw Instruction_MotherBrainBody_SpawnDustCloudExplosionProj 
    dw $0022,$FFD6,$0002,$0001 
    dw ExtendedSpritemap_MotherBrainBrain_DeathBeamMode_1 
    dw Instruction_MotherBrainBody_SpawnDustCloudExplosionProj 
    dw $0024,$FFD8,$0001,$0001 
    dw ExtendedSpritemap_MotherBrainBrain_DeathBeamMode_1 
    dw Instruction_MotherBrainBody_SpawnDustCloudExplosionProj 
    dw $0022,$FFD6,$0002,$0001 
    dw ExtendedSpritemap_MotherBrainBrain_DeathBeamMode_1 
    dw Instruction_MotherBrainBody_SpawnDustCloudExplosionProj 
    dw $0024,$FFD8,$0001,$0001 
    dw ExtendedSpritemap_MotherBrainBrain_DeathBeamMode_1 
    dw Instruction_MotherBrainBody_SpawnDustCloudExplosionProj 
    dw $0022,$FFD6,$0002,$0001 
    dw ExtendedSpritemap_MotherBrainBrain_DeathBeamMode_1 
    dw $0001 
    dw ExtendedSpritemap_MotherBrainBrain_DeathBeamMode_1 
    dw Instruction_MotherBrainBody_SpawnDeathBeamProjectile 
    dw $0001 
    dw ExtendedSpritemap_MotherBrainBrain_DeathBeamMode_2 
    dw $0001 
    dw ExtendedSpritemap_MotherBrainBrain_DeathBeamMode_3 
    dw $00F0 
    dw ExtendedSpritemap_MotherBrainBody_Standing 
    dw Instruction_MotherBrainBody_IncrementDeathBeamAttackPhase 
    dw Instruction_MotherBrainBody_SetPoseToStanding 
    dw Instruction_Common_Sleep 

Instruction_MotherBrainBody_SpawnDustCloudExplosionProj:
    PHY 
    PHX 
    LDA.W $0000,Y 
    CLC 
    ADC.W $0F7A 
    STA.B $12 
    LDA.W $0002,Y 
    CLC 
    ADC.W $0F7E 
    STA.B $14 
    LDA.W $0004,Y 
    LDY.W #EnemyProjectile_MiscDust 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    PLX 
    PLY 
    INY 
    INY 
    INY 
    INY 
    INY 
    INY 
    RTL 


Instruction_MotherBrainBody_SpawnDeathBeamProjectile:
    PHX 
    PHY 
    LDA.W #$0063 
    JSL.L QueueSound_Lib2_Max6 
    LDX.W #$0040 
    LDY.W #EnemyProjectile_MotherBrainRedBeam_Charging 
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    PLY 
    PLX 
    RTL 


Instruction_MotherBrainBody_IncrementDeathBeamAttackPhase:
    LDA.L $7E782E 
    INC A 
    STA.L $7E782E 
    RTL 


Instruction_MotherBrain_GotoX:
    LDA.W $0000,X 
    TAX 
    RTS 


Instruction_MotherBrainHead_EnableNeckMovement_GotoX:
    LDA.W #$0001 
    STA.L $7E8062 
    LDA.W $0000,X 
    TAX 
    RTS 


Instruction_MotherBrainHead_DisableNeckMovement:
    LDA.W #$0000 
    STA.L $7E8062 
    RTS 


Instruction_MotherBrainHead_QueueSoundX_Lib2_Max6:
    LDA.W $0000,X 
    JSL.L QueueSound_Lib2_Max6 
    INX 
    INX 
    RTS 


Instruction_MotherBrainHead_QueueSoundX_Lib3_Max6:
    LDA.W $0000,X 
    JSL.L QueueSound_Lib3_Max6 
    INX 
    INX 
    RTS 


Instruction_MotherBrainHead_SpawnDroolProjectile:
    LDA.L $7E7864 
    BEQ .return 
    PHY 
    LDA.L $7E7866 
    INC A 
    CMP.W #$0006 
    BMI + 
    LDA.W #$0000 

  + STA.L $7E7866 
    LDY.W #EnemyProjectile_MotherBrainDrool 
    LDA.L $7E8068 
    CMP.W #$0080 
    BMI .lessThan80 
    LDY.W #EnemyProjectile_MotherBrainDyingDrool 

.lessThan80:
    LDA.L $7E7866 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    PLY 

.return:
    RTS 


Instruction_MotherBrainHead_SpawnPurpleBreathBigProjectile:
    PHY 
    LDY.W #EnemyProjectile_MotherBrainPurpleBreath_Big 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    PLY 
    RTS 


Instruction_MotherBrainHead_SetMainShakeTimerTo50:
    LDA.W #$0032 
    STA.L $7E7840 
    RTS 


InstList_MotherBrainHead_Stretching_Phase2_0:
    dw Instruction_MotherBrainHead_SetMainShakeTimerTo50 
    dw $0002 
    dw Spritemaps_MotherBrain_2 
    dw $0002 
    dw Spritemaps_MotherBrain_3 
    dw Instruction_MotherBrainHead_SpawnDroolProjectile 
    dw $0002 
    dw Spritemaps_MotherBrain_3 
    dw Instruction_MotherBrainHead_SpawnPurpleBreathBigProjectile 
    dw Instruction_MotherBrainHead_QueueSoundX_Lib2_Max6 
    dw $007E 
    dw Instruction_MotherBrainHead_SpawnDroolProjectile 
    dw $0010 
    dw Spritemaps_MotherBrain_4 
    dw Instruction_MotherBrainHead_SpawnDroolProjectile 
    dw $0010 
    dw Spritemaps_MotherBrain_4 
    dw Instruction_MotherBrainHead_SpawnDroolProjectile 
    dw $0020 
    dw Spritemaps_MotherBrain_4 
    dw $0004 
    dw Spritemaps_MotherBrain_3 

InstList_MotherBrainHead_Stretching_Phase2_1:
    dw $0001 
    dw Spritemaps_MotherBrain_2 
    dw Instruction_MotherBrain_GotoX 
    dw InstList_MotherBrainHead_Stretching_Phase2_1 

InstList_MotherBrainHead_Stretching_Phase3_0:
    dw Instruction_MotherBrainHead_SetMainShakeTimerTo50 
    dw $0002 
    dw Spritemaps_MotherBrain_8 
    dw $0002 
    dw Spritemaps_MotherBrain_9 
    dw Instruction_MotherBrainHead_SpawnDroolProjectile 
    dw $0002 
    dw Spritemaps_MotherBrain_9 
    dw Instruction_MotherBrainHead_SpawnPurpleBreathBigProjectile 
    dw Instruction_MotherBrainHead_QueueSoundX_Lib2_Max6 
    dw $007E 
    dw Instruction_MotherBrainHead_SpawnDroolProjectile 
    dw $0010 
    dw Spritemaps_MotherBrain_A 
    dw Instruction_MotherBrainHead_SpawnDroolProjectile 
    dw $0010 
    dw Spritemaps_MotherBrain_A 
    dw Instruction_MotherBrainHead_SpawnDroolProjectile 
    dw $0020 
    dw Spritemaps_MotherBrain_A 
    dw $0004 
    dw Spritemaps_MotherBrain_9 

InstList_MotherBrainHead_Stretching_Phase3_1:
    dw $0001 
    dw Spritemaps_MotherBrain_8 
    dw Instruction_MotherBrain_GotoX 
    dw InstList_MotherBrainHead_Stretching_Phase3_1 

InstList_MotherBrainHead_HyperBeamRecoil_0:
    dw Instruction_MotherBrainHead_SetMainShakeTimerTo50 
    dw $0002 
    dw Spritemaps_MotherBrain_8 
    dw $0002 
    dw Spritemaps_MotherBrain_9 
    dw $0002 
    dw Spritemaps_MotherBrain_9 
    dw Instruction_MotherBrainHead_SpawnPurpleBreathBigProjectile 
    dw Instruction_MotherBrainHead_QueueSoundX_Lib2_Max6 
    dw $007E,$0010 
    dw Spritemaps_MotherBrain_A 
    dw $0010 
    dw Spritemaps_MotherBrain_A 
    dw $0020 
    dw Spritemaps_MotherBrain_A 
    dw $0004 
    dw Spritemaps_MotherBrain_9 

InstList_MotherBrainHead_HyperBeamRecoil_1:
    dw $0001 
    dw Spritemaps_MotherBrain_8 
    dw Instruction_MotherBrain_GotoX 
    dw InstList_MotherBrainHead_HyperBeamRecoil_1 

InstList_MotherBrainHead_InitialDummy:
    dw $0000 
    dw UNUSED_ExtendedSpritemap_MotherBrainBrain_A9A320 
    dw Instruction_Common_Sleep 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_MotherBrainHead_A99C19:
    dw $0008 
    dw Spritemaps_MotherBrain_2 
    dw $0004 
    dw Spritemaps_MotherBrain_1 
endif ; !FEATURE_KEEP_UNREFERENCED

InstList_MotherBrainHead_Initial:
    dw $0004 
    dw Spritemaps_MotherBrain_0 
    dw Instruction_MotherBrain_GotoX 
    dw InstList_MotherBrainHead_Initial 

InstList_MotherBrainHead_Decapitated_0:
    dw $0008 
    dw Spritemaps_MotherBrain_8 
    dw $0004 
    dw Spritemaps_MotherBrain_7 

InstList_MotherBrainHead_Decapitated_1:
    dw $0004 
    dw Spritemaps_MotherBrain_6 
    dw Instruction_MotherBrain_GotoX 
    dw InstList_MotherBrainHead_Decapitated_1 

InstList_MotherBrainHead_DyingDrool_0:
    dw Instruction_MotherBrainHead_SetMainShakeTimerTo50 
    dw $0004 
    dw Spritemaps_MotherBrain_8 
    dw $0004 
    dw Spritemaps_MotherBrain_9 
    dw Instruction_MotherBrainHead_QueueSoundX_Lib2_Max6 
    dw $007E 

InstList_MotherBrainHead_DyingDrool_1:
    dw $0002 
    dw Spritemaps_MotherBrain_A 
    dw Instruction_MotherBrainHead_SpawnDroolProjectile 
    dw $0002 
    dw Spritemaps_MotherBrain_A 
    dw Instruction_MotherBrainHead_SpawnDroolProjectile 
    dw $0002 
    dw Spritemaps_MotherBrain_A 
    dw Instruction_MotherBrainHead_SpawnDroolProjectile 
    dw $0002 
    dw Spritemaps_MotherBrain_A 
    dw Instruction_MotherBrainHead_SpawnDroolProjectile 

InstList_MotherBrainHead_DyingDrool_2:
    dw $0002 
    dw Spritemaps_MotherBrain_A 
    dw Instruction_MotherBrainHead_GotoDyingDroolInstList 

Instruction_MotherBrainHead_GotoDyingDroolInstList:
    LDX.W #InstList_MotherBrainHead_DyingDrool_2 
    LDA.W $05E5 
    AND.W #$0FFF 
    CMP.W #$0FE0 
    BCC .return 
    LDX.W #InstList_MotherBrainHead_DyingDrool_1 

.return:
    RTS 


InstList_MotherBrainHead_FiringRainbowBeam:
    dw $0001 
    dw Spritemaps_MotherBrain_2 
    dw Instruction_MotherBrain_GotoX 
    dw InstList_MotherBrainHead_FiringRainbowBeam 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_MotherBrainHead_A99C7F:
    dw $0001 
    dw Spritemaps_MotherBrain_8 
    dw Instruction_MotherBrain_GotoX 
    dw UNUSED_InstList_MotherBrainHead_A99C7F 
endif ; !FEATURE_KEEP_UNREFERENCED

InstList_MotherBrainHead_Neutral_Phase2_0:
    dw $0004 
    dw Spritemaps_MotherBrain_0 
    dw $0004 
    dw Spritemaps_MotherBrain_1 
    dw $0008 
    dw Spritemaps_MotherBrain_2 
    dw $0004 
    dw Spritemaps_MotherBrain_1 
    dw $0004 
    dw Spritemaps_MotherBrain_0 
    dw $0004 
    dw Spritemaps_MotherBrain_1 

InstList_MotherBrainHead_Neutral_Phase2_1:
    dw $0008 
    dw Spritemaps_MotherBrain_2 
    dw Instruction_MotherBrainHead_MaybeGotoNeutralPhase2 
    dw $0004 
    dw Spritemaps_MotherBrain_1 
    dw Instruction_MotherBrain_GotoX 
    dw InstList_MotherBrainHead_Neutral_Phase2_0 

Instruction_MotherBrainHead_MaybeGotoNeutralPhase2:
    LDA.W $05E5 
    CMP.W #$F000 
    BCS .return 
    LDX.W #InstList_MotherBrainHead_Neutral_Phase2_1 

.return:
    RTS 


InstList_MotherBrainHead_Neutral_Phase3_0:
    dw $0004 
    dw Spritemaps_MotherBrain_6 
    dw $0004 
    dw Spritemaps_MotherBrain_7 
    dw $0008 
    dw Spritemaps_MotherBrain_8 
    dw $0004 
    dw Spritemaps_MotherBrain_7 
    dw $0004 
    dw Spritemaps_MotherBrain_6 
    dw $0004 
    dw Spritemaps_MotherBrain_7 

InstList_MotherBrainHead_Neutral_Phase3_1:
    dw $0008 
    dw Spritemaps_MotherBrain_8 
    dw $0008 
    dw Spritemaps_MotherBrain_7 
    dw Instruction_MotherBrainHead_MaybeGotoNeutralPhase3 
    dw $0004 
    dw Spritemaps_MotherBrain_6 
    dw Instruction_MotherBrain_GotoX 
    dw InstList_MotherBrainHead_Neutral_Phase3_0 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_MotherBrainHead_Neutral_Phase3_A99CE3:
    dw $0004 
    dw Spritemaps_MotherBrain_8 
    dw $0004 
    dw Spritemaps_MotherBrain_9 
    dw $0002 
    dw Spritemaps_MotherBrain_A 
    dw Instruction_MotherBrainHead_QueueSoundX_Lib2_Max6 
    dw $006F,$0002 
    dw Spritemaps_MotherBrain_A 
    dw $0002 
    dw Spritemaps_MotherBrain_A 
    dw $0002 
    dw Spritemaps_MotherBrain_A 
    dw $0002 
    dw Spritemaps_MotherBrain_A 
    dw $0004 
    dw Spritemaps_MotherBrain_9 
    dw $0004 
    dw Spritemaps_MotherBrain_8 
    dw Instruction_MotherBrainHead_GotoNeutralPhase3 
endif ; !FEATURE_KEEP_UNREFERENCED

Instruction_MotherBrainHead_MaybeGotoNeutralPhase3:
    LDA.W $05E5 
    AND.W #$0FFF 
    CMP.W #$0F40 
    BRA + 

if !FEATURE_KEEP_UNREFERENCED
    LDX.W #UNUSED_InstList_MotherBrainHead_Neutral_Phase3_A99CE3 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


  + CMP.W #$0EC0 
    BCS Instruction_MotherBrainHead_GotoNeutralPhase3_return 

Instruction_MotherBrainHead_GotoNeutralPhase3:
    LDX.W #InstList_MotherBrainHead_Neutral_Phase3_1 

Instruction_MotherBrainHead_GotoNeutralPhase3_return:
    RTS 


InstList_MotherBrainHead_Corpse_0:
    dw $0002 
    dw Spritemaps_MotherBrain_6 
    dw $0002 
    dw Spritemaps_MotherBrain_7 
    dw $0040 
    dw Spritemaps_MotherBrain_8 
    dw $0040 
    dw Spritemaps_MotherBrain_18 

InstList_MotherBrainHead_Corpse_1:
    dw $0002 
    dw Spritemaps_MotherBrain_19 
    dw Instruction_MotherBrain_GotoX 
    dw InstList_MotherBrainHead_Corpse_1 

InstList_MotherBrainHead_Attacking_4OnionRings_Phase2:
    dw Instruction_MotherBrainHead_DisableNeckMovement 
    dw $0004 
    dw Spritemaps_MotherBrain_2 
    dw $0004 
    dw Spritemaps_MotherBrain_3 
    dw Instruction_MotherBrainHead_QueueSoundX_Lib2_Max6 
    dw $006F,$0008 
    dw Spritemaps_MotherBrain_4 
    dw Instruction_MotherBrainHead_AimOnionRingsAtSamus 
    dw Instruction_MotherBrainHead_SpawnOnionRingsProjectile 
    dw Instruction_MotherBrainHead_QueueSoundX_Lib3_Max6 
    dw $0017,$0003 
    dw Spritemaps_MotherBrain_4 
    dw Instruction_MotherBrainHead_AimOnionRingsAtSamus 
    dw Instruction_MotherBrainHead_SpawnOnionRingsProjectile 
    dw $0003 
    dw Spritemaps_MotherBrain_4 
    dw Instruction_MotherBrainHead_AimOnionRingsAtSamus 
    dw Instruction_MotherBrainHead_SpawnOnionRingsProjectile 
    dw $0003 
    dw Spritemaps_MotherBrain_4 
    dw Instruction_MotherBrainHead_AimOnionRingsAtSamus 
    dw Instruction_MotherBrainHead_SpawnOnionRingsProjectile 
    dw $0010 
    dw Spritemaps_MotherBrain_4 
    dw $0004 
    dw Spritemaps_MotherBrain_3 
    dw $0010 
    dw Spritemaps_MotherBrain_2 
    dw Instruction_MotherBrainHead_EnableNeckMovement_GotoX 
    dw InstList_MotherBrainHead_Neutral_Phase2_0 

InstList_MotherBrainHead_Attacking_2OnionRings_Phase2:
    dw Instruction_MotherBrainHead_DisableNeckMovement 
    dw $0004 
    dw Spritemaps_MotherBrain_2 
    dw $0004 
    dw Spritemaps_MotherBrain_3 
    dw Instruction_MotherBrainHead_QueueSoundX_Lib2_Max6 
    dw $006F,$0008 
    dw Spritemaps_MotherBrain_4 
    dw Instruction_MotherBrainHead_AimOnionRingsAtSamus 
    dw Instruction_MotherBrainHead_SpawnOnionRingsProjectile 
    dw Instruction_MotherBrainHead_QueueSoundX_Lib3_Max6 
    dw $0017,$0003 
    dw Spritemaps_MotherBrain_4 
    dw Instruction_MotherBrainHead_AimOnionRingsAtSamus 
    dw Instruction_MotherBrainHead_SpawnOnionRingsProjectile 
    dw $0010 
    dw Spritemaps_MotherBrain_4 
    dw $0004 
    dw Spritemaps_MotherBrain_3 
    dw $0010 
    dw Spritemaps_MotherBrain_2 
    dw Instruction_MotherBrainHead_EnableNeckMovement_GotoX 
    dw InstList_MotherBrainHead_Neutral_Phase2_0 

InstList_MotherBrainHead_Attacking_BabyMetroid:
    dw Instruction_MotherBrainHead_IncBabyMetroidAttackCounter 
    dw Instruction_MotherBrainHead_DisableNeckMovement 
    dw Instruction_MotherBrainHead_AimOnionRingsAtBabyMetroid 
    dw Instruction_MotherBrain_GotoX 
    dw InstList_MotherBrainHead_Attacking_4OnionRings_Phase3 

InstList_MotherBrainHead_AttackingSamus_4OnionRings_Phase3:
    dw Instruction_MotherBrainHead_ResetBabyMetroidAttackCounter 
    dw Instruction_MotherBrainHead_DisableNeckMovement 
    dw Instruction_MotherBrainHead_AimOnionRingsAtSamus 

InstList_MotherBrainHead_Attacking_4OnionRings_Phase3:
    dw $0004 
    dw Spritemaps_MotherBrain_8 
    dw $0004 
    dw Spritemaps_MotherBrain_9 
    dw Instruction_MotherBrainHead_QueueBabyMetroidAttackSFX 
    dw $0008 
    dw Spritemaps_MotherBrain_A 
    dw Instruction_MotherBrainHead_SpawnOnionRingsProjectile 
    dw Instruction_MotherBrainHead_QueueSoundX_Lib3_Max6 
    dw $0017,$0003 
    dw Spritemaps_MotherBrain_A 
    dw Instruction_MotherBrainHead_SpawnOnionRingsProjectile 
    dw $0003 
    dw Spritemaps_MotherBrain_A 
    dw Instruction_MotherBrainHead_SpawnOnionRingsProjectile 
    dw $0003 
    dw Spritemaps_MotherBrain_A 
    dw Instruction_MotherBrainHead_SpawnOnionRingsProjectile 
    dw $0010 
    dw Spritemaps_MotherBrain_A 
    dw $0004 
    dw Spritemaps_MotherBrain_9 
    dw $0010 
    dw Spritemaps_MotherBrain_8 
    dw Instruction_MotherBrainHead_EnableNeckMovement_GotoX 
    dw InstList_MotherBrainHead_Neutral_Phase3_0 

Instruction_MotherBrainHead_QueueBabyMetroidAttackSFX:
    PHY 
    LDA.L $7E7826 
    CMP.W #$000B 
    BEQ .return 
    LDA.W #$0000 
    ASL A 
    TAY 
    LDA.W .sfx,Y 
    JSL.L QueueSound_Lib2_Max6 

.return:
    PLY 
    RTS 


.sfx:
    dw $006F,$006F,$006F,$007E,$006F,$006F,$007E,$006F 
    dw $006F,$007E,$007E,$006F,$006F 

Instruction_MotherBrainHead_SpawnOnionRingsProjectile:
    PHY 
    LDY.W #EnemyProjectile_MotherBrainOnionRings 
    LDA.L $7E7834 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    PLY 
    RTS 


Instruction_MotherBrainHead_AimOnionRingsAtBabyMetroid:
    PHX 
    PHY 
    LDA.L $7E7854 
    TAX 
    LDA.W $0F7A,X 
    SEC 
    SBC.W $0FBA 
    SEC 
    SBC.W #$000A 
    STA.B $12 
    LDA.W $0F7E,X 
    SEC 
    SBC.W $0FBE 
    SEC 
    SBC.W #$0010 
    STA.B $14 
    JMP.W AimMotherBrainOnionRings 


Instruction_MotherBrainHead_AimOnionRingsAtSamus:
    PHX 
    PHY 
    LDA.W $0AF6 
    SEC 
    SBC.W $0FBA 
    SEC 
    SBC.W #$000A 
    STA.B $12 
    LDA.W $0AFA 
    SEC 
    SBC.W $0FBE 
    SEC 
    SBC.W #$0010 
    STA.B $14 

AimMotherBrainOnionRings:
    JSL.L CalculateAngleOf_12_14_Offset 
    SEC 
    SBC.W #$0080 
    EOR.W #$FFFF 
    INC A 
    AND.W #$00FF 
    SEP #$20 
    CMP.B #$10 
    BPL + 
    CMP.B #$C0 
    BMI .upperHalf 
    LDA.B #$10 
    BRA .merge 


  + CMP.B #$48 
    BCC .merge 

.upperHalf:
    LDA.B #$48 

.merge:
    REP #$20 
    STA.L $7E7834 
    PLY 
    PLX 
    RTS 


Instruction_MotherBrainHead_IncBabyMetroidAttackCounter:
    LDA.L $7E7826 
    INC A 
    CMP.W #$000C 
    BCC .notMax12 
    LDA.W #$000C 

.notMax12:
    STA.L $7E7826 
    RTS 


Instruction_MotherBrainHead_ResetBabyMetroidAttackCounter:
    LDA.W #$0000 
    STA.L $7E7826 
    RTS 


Instruction_MotherBrainHead_SpawnBombProjectileWithParamX:
    PHY 
    LDA.W $0000,X 
    LDY.W #EnemyProjectile_MotherBrainBomb 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    PLY 
    INX 
    INX 
    RTS 


InstList_MotherBrainHead_Attacking_Bomb_Phase2:
    dw $0004 
    dw Spritemaps_MotherBrain_0 
    dw $0004 
    dw Spritemaps_MotherBrain_1 
    dw $0008 
    dw Spritemaps_MotherBrain_2 
    dw Instruction_MotherBrainHead_DisableNeckMovement 
    dw $0004 
    dw Spritemaps_MotherBrain_2 
    dw $0004 
    dw Spritemaps_MotherBrain_3 
    dw Instruction_MotherBrainHead_QueueSoundX_Lib2_Max6 
    dw $006F,$0008 
    dw Spritemaps_MotherBrain_4 
    dw Instruction_MotherBrainHead_SpawnBombProjectileWithParamX 
    dw $0007 
    dw Instruction_MotherBrainHead_SpawnPurpleBreathBigProjectile 
    dw $0020 
    dw Spritemaps_MotherBrain_4 
    dw $0004 
    dw Spritemaps_MotherBrain_3 
    dw $0010 
    dw Spritemaps_MotherBrain_2 
    dw Instruction_MotherBrainHead_EnableNeckMovement_GotoX 
    dw InstList_MotherBrainHead_Neutral_Phase2_0 

InstList_MotherBrainHead_Attacking_Bomb_Phase3:
    dw $0004 
    dw Spritemaps_MotherBrain_6 
    dw $0004 
    dw Spritemaps_MotherBrain_7 
    dw $0008 
    dw Spritemaps_MotherBrain_8 
    dw Instruction_MotherBrainHead_DisableNeckMovement 
    dw $0004 
    dw Spritemaps_MotherBrain_8 
    dw $0004 
    dw Spritemaps_MotherBrain_9 
    dw Instruction_MotherBrainHead_QueueSoundX_Lib2_Max6 
    dw $006F,$0008 
    dw Spritemaps_MotherBrain_A 
    dw Instruction_MotherBrainHead_SpawnBombProjectileWithParamX 
    dw $0001 
    dw Instruction_MotherBrainHead_SpawnPurpleBreathBigProjectile 
    dw $0020 
    dw Spritemaps_MotherBrain_A 
    dw $0004 
    dw Spritemaps_MotherBrain_9 
    dw $0010 
    dw Spritemaps_MotherBrain_8 
    dw Instruction_MotherBrainHead_EnableNeckMovement_GotoX 
    dw InstList_MotherBrainHead_Neutral_Phase3_0 

InstList_MotherBrainHead_Attacking_Laser:
    dw $0010 
    dw Spritemaps_MotherBrain_1 
    dw $0004 
    dw Spritemaps_MotherBrain_2 
    dw InstList_MotherBrainHead_SpawnLaserProjectile 
    dw $0020 
    dw Spritemaps_MotherBrain_2 
    dw Instruction_MotherBrainHead_EnableNeckMovement_GotoX 
    dw InstList_MotherBrainHead_Neutral_Phase2_0 

InstList_MotherBrainHead_SpawnLaserProjectile:
    LDA.W #$0000 
    STA.L $7E8062 
    PHY 
    LDA.W $0FBA 
    CLC 
    ADC.W #$0010 
    STA.B $12 
    LDA.W $0FBE 
    CLC 
    ADC.W #$0004 
    STA.B $14 
    LDA.W #$0001 
    LDY.W #EnemyProjectile_PirateMotherBrainLaser 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    PLY 
    RTS 


InstList_MotherBrainHead_ChargingRainbowBeam_0:
    dw Instruction_MotherBrainHead_SetupEffectsForRainbowBeamCharge 
    dw $0004 
    dw Spritemaps_MotherBrain_2 
    dw $0004 
    dw Spritemaps_MotherBrain_1 
    dw $0002 
    dw Spritemaps_MotherBrain_0 

InstList_MotherBrainHead_ChargingRainbowBeam_1:
    dw Instruction_MotherBrainHead_SpawnRainbowBeamChargingProj 
    dw $001E 
    dw Spritemaps_MotherBrain_0 
    dw Instruction_MotherBrain_GotoX 
    dw InstList_MotherBrainHead_ChargingRainbowBeam_1 

Instruction_MotherBrainHead_SpawnRainbowBeamChargingProj:
    PHY 
    LDY.W #EnemyProjectile_MotherBrainRainbowBeam_Charging 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    PLY 
    RTS 


Instruction_MotherBrainHead_SetupEffectsForRainbowBeamCharge:
    LDA.W #$0000 
    STA.L $7E7868 
    JSR.W SetupMotherBrainHeadPaletteForChargingHerLaser 
    LDA.W #$007F 
    JSL.L QueueSound_Lib2_Max6 
    RTS 


ExtendedSpritemap_MotherBrainBody_Standing:
    dw $0009,$0012,$003A 
    dw Spritemaps_MotherBrain_13 
    dw Hitbox_MotherBrainBody_3 
    dw $001E,$001D 
    dw Spritemaps_MotherBrain_F 
    dw Hitbox_MotherBrainBody_2 
    dw $0019,$001E 
    dw Spritemaps_MotherBrain_11 
    dw Hitbox_MotherBrainBody_2 
    dw $0000,$FFFC 
    dw Spritemaps_MotherBrain_B 
    dw Hitbox_MotherBrainBody_2 
    dw $0000,$0000 
    dw ExtendedTilemaps_MotherBrain_0 
    dw Hitbox_MotherBrainBody_6 
    dw $0000,$0000 
    dw ExtendedTilemaps_MotherBrain_1 
    dw Hitbox_MotherBrainBody_8 
    dw $FFF6,$0038 
    dw Spritemaps_MotherBrain_17 
    dw Hitbox_MotherBrainBody_5 
    dw $0007,$001C 
    dw Spritemaps_MotherBrain_15 
    dw Hitbox_MotherBrainBody_4 
    dw $0002,$001D 
    dw Spritemaps_MotherBrain_16 
    dw Hitbox_MotherBrainBody_4 

ExtendedSpritemap_MotherBrainBody_Walking_0:
    dw $000A,$001C,$002F 
    dw Spritemaps_MotherBrain_13 
    dw Hitbox_MotherBrainBody_3 
    dw $0026,$0013 
    dw Spritemaps_MotherBrain_F 
    dw Hitbox_MotherBrainBody_2 
    dw $0021,$0013 
    dw Spritemaps_MotherBrain_11 
    dw Hitbox_MotherBrainBody_2 
    dw $0000,$FFFD 
    dw Spritemaps_MotherBrain_C 
    dw Hitbox_MotherBrainBody_2 
    dw $0000,$0002 
    dw ExtendedTilemaps_MotherBrain_0 
    dw Hitbox_MotherBrainBody_6 
    dw $0000,$0000 
    dw ExtendedTilemaps_MotherBrain_1 
    dw Hitbox_MotherBrainBody_8 
    dw $FFF5,$003A 
    dw Spritemaps_MotherBrain_17 
    dw Hitbox_MotherBrainBody_5 
    dw $0006,$001F 
    dw Spritemaps_MotherBrain_15 
    dw Hitbox_MotherBrainBody_4 
    dw $0001,$0021 
    dw Spritemaps_MotherBrain_16 
    dw Hitbox_MotherBrainBody_4 
    dw $FFE7,$FFFD 
    dw Spritemaps_MotherBrain_14 
    dw Hitbox_MotherBrainBody_4 

ExtendedSpritemap_MotherBrainBody_Walking_1:
    dw $000A,$0028,$0030 
    dw Spritemaps_MotherBrain_13 
    dw Hitbox_MotherBrainBody_3 
    dw $0026,$0013 
    dw Spritemaps_MotherBrain_F 
    dw Hitbox_MotherBrainBody_2 
    dw $0023,$0013 
    dw Spritemaps_MotherBrain_10 
    dw Hitbox_MotherBrainBody_2 
    dw $0000,$FFFD 
    dw Spritemaps_MotherBrain_C 
    dw Hitbox_MotherBrainBody_2 
    dw $0000,$0002 
    dw ExtendedTilemaps_MotherBrain_0 
    dw Hitbox_MotherBrainBody_6 
    dw $0000,$0000 
    dw ExtendedTilemaps_MotherBrain_1 
    dw Hitbox_MotherBrainBody_8 
    dw $FFF3,$003A 
    dw Spritemaps_MotherBrain_17 
    dw Hitbox_MotherBrainBody_5 
    dw $0005,$001F 
    dw Spritemaps_MotherBrain_15 
    dw Hitbox_MotherBrainBody_4 
    dw $FFFF,$0021 
    dw Spritemaps_MotherBrain_16 
    dw Hitbox_MotherBrainBody_4 
    dw $FFE6,$FFFD 
    dw Spritemaps_MotherBrain_14 
    dw Hitbox_MotherBrainBody_4 

ExtendedSpritemap_MotherBrainBody_Walking_2:
    dw $000A,$0028,$0033 
    dw Spritemaps_MotherBrain_13 
    dw Hitbox_MotherBrainBody_3 
    dw $0026,$0015 
    dw Spritemaps_MotherBrain_F 
    dw Hitbox_MotherBrainBody_2 
    dw $0023,$0016 
    dw Spritemaps_MotherBrain_10 
    dw Hitbox_MotherBrainBody_2 
    dw $FFFF,$FFFE 
    dw Spritemaps_MotherBrain_C 
    dw Hitbox_MotherBrainBody_2 
    dw $0000,$0001 
    dw ExtendedTilemaps_MotherBrain_0 
    dw Hitbox_MotherBrainBody_6 
    dw $0000,$0000 
    dw ExtendedTilemaps_MotherBrain_1 
    dw Hitbox_MotherBrainBody_8 
    dw $FFF3,$0039 
    dw Spritemaps_MotherBrain_17 
    dw Hitbox_MotherBrainBody_5 
    dw $0005,$001E 
    dw Spritemaps_MotherBrain_15 
    dw Hitbox_MotherBrainBody_4 
    dw $FFFF,$0020 
    dw Spritemaps_MotherBrain_16 
    dw Hitbox_MotherBrainBody_4 
    dw $FFE6,$FFFC 
    dw Spritemaps_MotherBrain_14 
    dw Hitbox_MotherBrainBody_4 

ExtendedSpritemap_MotherBrainBody_Walking_3:
    dw $0009,$0024,$003A 
    dw Spritemaps_MotherBrain_13 
    dw Hitbox_MotherBrainBody_3 
    dw $0021,$001D 
    dw Spritemaps_MotherBrain_F 
    dw Hitbox_MotherBrainBody_2 
    dw $001F,$001E 
    dw Spritemaps_MotherBrain_10 
    dw Hitbox_MotherBrainBody_2 
    dw $0001,$FFFC 
    dw Spritemaps_MotherBrain_B 
    dw Hitbox_MotherBrainBody_2 
    dw $0000,$0000 
    dw ExtendedTilemaps_MotherBrain_0 
    dw Hitbox_MotherBrainBody_6 
    dw $0000,$0000 
    dw ExtendedTilemaps_MotherBrain_1 
    dw Hitbox_MotherBrainBody_8 
    dw $FFF0,$0038 
    dw Spritemaps_MotherBrain_17 
    dw Hitbox_MotherBrainBody_5 
    dw $0003,$001C 
    dw Spritemaps_MotherBrain_15 
    dw Hitbox_MotherBrainBody_4 
    dw $FFFC,$001E 
    dw Spritemaps_MotherBrain_16 
    dw Hitbox_MotherBrainBody_4 

ExtendedSpritemap_MotherBrainBody_Walking_4:
    dw $0009,$0015,$003C 
    dw Spritemaps_MotherBrain_13 
    dw Hitbox_MotherBrainBody_3 
    dw $001D,$001F 
    dw Spritemaps_MotherBrain_F 
    dw Hitbox_MotherBrainBody_2 
    dw $001B,$0020 
    dw Spritemaps_MotherBrain_11 
    dw Hitbox_MotherBrainBody_2 
    dw $FFFE,$FFFE 
    dw Spritemaps_MotherBrain_B 
    dw Hitbox_MotherBrainBody_2 
    dw $0000,$0002 
    dw ExtendedTilemaps_MotherBrain_0 
    dw Hitbox_MotherBrainBody_6 
    dw $0000,$0000 
    dw ExtendedTilemaps_MotherBrain_1 
    dw Hitbox_MotherBrainBody_8 
    dw $FFF0,$0034 
    dw Spritemaps_MotherBrain_17 
    dw Hitbox_MotherBrainBody_5 
    dw $0000,$001A 
    dw Spritemaps_MotherBrain_15 
    dw Hitbox_MotherBrainBody_4 
    dw $FFFB,$001C 
    dw Spritemaps_MotherBrain_16 
    dw Hitbox_MotherBrainBody_4 

ExtendedSpritemap_MotherBrainBody_Walking_5:
    dw $0009,$000F,$0040 
    dw Spritemaps_MotherBrain_13 
    dw Hitbox_MotherBrainBody_3 
    dw $001E,$0023 
    dw Spritemaps_MotherBrain_F 
    dw Hitbox_MotherBrainBody_2 
    dw $001A,$0025 
    dw Spritemaps_MotherBrain_12 
    dw Hitbox_MotherBrainBody_2 
    dw $FFFE,$FFFF 
    dw Spritemaps_MotherBrain_B 
    dw Hitbox_MotherBrainBody_2 
    dw $0000,$0006 
    dw ExtendedTilemaps_MotherBrain_0 
    dw Hitbox_MotherBrainBody_6 
    dw $0000,$0000 
    dw ExtendedTilemaps_MotherBrain_1 
    dw Hitbox_MotherBrainBody_8 
    dw $FFF6,$002F 
    dw Spritemaps_MotherBrain_17 
    dw Hitbox_MotherBrainBody_5 
    dw $0004,$0016 
    dw Spritemaps_MotherBrain_15 
    dw Hitbox_MotherBrainBody_4 
    dw $FFFF,$0018 
    dw Spritemaps_MotherBrain_16 
    dw Hitbox_MotherBrainBody_4 

ExtendedSpritemap_MotherBrainBody_Walking_6:
    dw $0009,$0011,$003C 
    dw Spritemaps_MotherBrain_13 
    dw Hitbox_MotherBrainBody_3 
    dw $001E,$0020 
    dw Spritemaps_MotherBrain_F 
    dw Hitbox_MotherBrainBody_2 
    dw $0018,$0020 
    dw Spritemaps_MotherBrain_11 
    dw Hitbox_MotherBrainBody_2 
    dw $FFFF,$FFFE 
    dw Spritemaps_MotherBrain_B 
    dw Hitbox_MotherBrainBody_2 
    dw $0000,$0002 
    dw ExtendedTilemaps_MotherBrain_0 
    dw Hitbox_MotherBrainBody_6 
    dw $0000,$0000 
    dw ExtendedTilemaps_MotherBrain_1 
    dw Hitbox_MotherBrainBody_8 
    dw $FFF8,$002F 
    dw Spritemaps_MotherBrain_17 
    dw Hitbox_MotherBrainBody_5 
    dw $0007,$0015 
    dw Spritemaps_MotherBrain_15 
    dw Hitbox_MotherBrainBody_4 
    dw $0003,$0017 
    dw Spritemaps_MotherBrain_16 
    dw Hitbox_MotherBrainBody_4 

ExtendedSpritemap_MotherBrainBody_Walking_7:
    dw $0009,$0012,$003A 
    dw Spritemaps_MotherBrain_13 
    dw Hitbox_MotherBrainBody_3 
    dw $001F,$001E 
    dw Spritemaps_MotherBrain_F 
    dw Hitbox_MotherBrainBody_2 
    dw $0019,$001E 
    dw Spritemaps_MotherBrain_11 
    dw Hitbox_MotherBrainBody_2 
    dw $FFFF,$FFFD 
    dw Spritemaps_MotherBrain_B 
    dw Hitbox_MotherBrainBody_2 
    dw $0000,$0000 
    dw ExtendedTilemaps_MotherBrain_0 
    dw Hitbox_MotherBrainBody_6 
    dw $0000,$0000 
    dw ExtendedTilemaps_MotherBrain_1 
    dw Hitbox_MotherBrainBody_8 
    dw $FFF6,$0038 
    dw Spritemaps_MotherBrain_17 
    dw Hitbox_MotherBrainBody_5 
    dw $0007,$001C 
    dw Spritemaps_MotherBrain_15 
    dw Hitbox_MotherBrainBody_4 
    dw $0002,$001F 
    dw Spritemaps_MotherBrain_16 
    dw Hitbox_MotherBrainBody_4 

ExtendedSpritemap_MotherBrainBody_Crouched:
    dw $0007,$0012,$0014 
    dw Spritemaps_MotherBrain_13 
    dw Hitbox_MotherBrainBody_3 
    dw $0022,$FFF7 
    dw Spritemaps_MotherBrain_F 
    dw Hitbox_MotherBrainBody_2 
    dw $001F,$FFFA 
    dw Spritemaps_MotherBrain_12 
    dw Hitbox_MotherBrainBody_2 
    dw $FFFB,$0003 
    dw Spritemaps_MotherBrain_E 
    dw Hitbox_MotherBrainBody_2 
    dw $0000,$FFDA 
    dw ExtendedTilemaps_MotherBrain_0 
    dw Hitbox_MotherBrainBody_6 
    dw $0004,$0000 
    dw ExtendedTilemaps_MotherBrain_1 
    dw Hitbox_MotherBrainBody_8 
    dw $FFF6,$0012 
    dw Spritemaps_MotherBrain_17 
    dw Hitbox_MotherBrainBody_5 

ExtendedSpritemap_MotherBrainBody_Uncrouching:
    dw $0009,$0012,$001E 
    dw Spritemaps_MotherBrain_13 
    dw Hitbox_MotherBrainBody_3 
    dw $0024,$0002 
    dw Spritemaps_MotherBrain_F 
    dw Hitbox_MotherBrainBody_2 
    dw $001F,$0004 
    dw Spritemaps_MotherBrain_12 
    dw Hitbox_MotherBrainBody_2 
    dw $FFFB,$FFFE 
    dw Spritemaps_MotherBrain_D 
    dw Hitbox_MotherBrainBody_2 
    dw $0000,$FFE4 
    dw ExtendedTilemaps_MotherBrain_0 
    dw Hitbox_MotherBrainBody_6 
    dw $FFFE,$0000 
    dw ExtendedTilemaps_MotherBrain_1 
    dw Hitbox_MotherBrainBody_8 
    dw $FFF6,$001C 
    dw Spritemaps_MotherBrain_17 
    dw Hitbox_MotherBrainBody_5 
    dw $0007,$0000 
    dw Spritemaps_MotherBrain_15 
    dw Hitbox_MotherBrainBody_4 
    dw $0002,$0001 
    dw Spritemaps_MotherBrain_16 
    dw Hitbox_MotherBrainBody_4 

ExtendedSpritemap_MotherBrainBody_LeaningDown:
    dw $0009,$0012,$002E 
    dw Spritemaps_MotherBrain_13 
    dw Hitbox_MotherBrainBody_3 
    dw $001F,$0011 
    dw Spritemaps_MotherBrain_F 
    dw Hitbox_MotherBrainBody_2 
    dw $001A,$0012 
    dw Spritemaps_MotherBrain_11 
    dw Hitbox_MotherBrainBody_2 
    dw $FFFB,$FFFC 
    dw Spritemaps_MotherBrain_C 
    dw Hitbox_MotherBrainBody_2 
    dw $0000,$FFF4 
    dw ExtendedTilemaps_MotherBrain_0 
    dw Hitbox_MotherBrainBody_6 
    dw $FFFE,$0000 
    dw ExtendedTilemaps_MotherBrain_1 
    dw Hitbox_MotherBrainBody_8 
    dw $FFF6,$002C 
    dw Spritemaps_MotherBrain_17 
    dw Hitbox_MotherBrainBody_5 
    dw $0007,$0010 
    dw Spritemaps_MotherBrain_15 
    dw Hitbox_MotherBrainBody_4 
    dw $0002,$0011 
    dw Spritemaps_MotherBrain_16 
    dw Hitbox_MotherBrainBody_4 

UNUSED_ExtendedSpritemap_MotherBrainBrain_A9A320:
    dw $0001,$0000,$0000 
    dw Spritemaps_MotherBrain_0 
    dw Hitbox_MotherBrainBody_0 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ExtendedSpritemap_MotherBrainBrain_A9A32A:
    dw $0001,$0000,$0000 
    dw Spritemaps_MotherBrain_1 
    dw Hitbox_MotherBrainBody_0 

UNUSED_ExtendedSpritemap_MotherBrainBrain_A9A334:
    dw $0001,$0000,$0000 
    dw Spritemaps_MotherBrain_2 
    dw Hitbox_MotherBrainBody_0 

UNUSED_ExtendedSpritemap_MotherBrainBrain_A9A33E:
    dw $0001,$0000,$0000 
    dw Spritemaps_MotherBrain_3 
    dw Hitbox_MotherBrainBody_0 

UNUSED_ExtendedSpritemap_MotherBrainBrain_A9A348:
    dw $0001,$0000,$0000 
    dw Spritemaps_MotherBrain_4 
    dw Hitbox_MotherBrainBody_0 

UNUSED_ExtendedSpritemap_MotherBrainBrain_A9A352:
    dw $0001,$0000,$0000 
    dw Spritemaps_MotherBrain_6 
    dw Hitbox_MotherBrainBody_1 

UNUSED_ExtendedSpritemap_MotherBrainBrain_A9A35C:
    dw $0001,$0000,$0000 
    dw Spritemaps_MotherBrain_7 
    dw Hitbox_MotherBrainBody_1 

UNUSED_ExtendedSpritemap_MotherBrainBrain_A9A366:
    dw $0001,$0000,$0000 
    dw Spritemaps_MotherBrain_8 
    dw Hitbox_MotherBrainBody_1 

UNUSED_ExtendedSpritemap_MotherBrainBrain_A9A370:
    dw $0001,$0000,$0000 
    dw Spritemaps_MotherBrain_9 
    dw Hitbox_MotherBrainBody_1 

UNUSED_ExtendedSpritemap_MotherBrainBrain_A9A37A:
    dw $0001,$0000,$0000 
    dw Spritemaps_MotherBrain_A 
    dw Hitbox_MotherBrainBody_1 
endif ; !FEATURE_KEEP_UNREFERENCED

ExtendedSpritemap_MotherBrainBrain_DeathBeamMode_0:
    dw $0009,$0012,$003A 
    dw Spritemaps_MotherBrain_13 
    dw Hitbox_MotherBrainBody_3 
    dw $001E,$001D 
    dw Spritemaps_MotherBrain_F 
    dw Hitbox_MotherBrainBody_2 
    dw $0019,$001E 
    dw Spritemaps_MotherBrain_11 
    dw Hitbox_MotherBrainBody_2 
    dw $0000,$FFFC 
    dw Spritemaps_MotherBrain_B 
    dw Hitbox_MotherBrainBody_2 
    dw $0000,$0000 
    dw ExtendedTilemaps_MotherBrain_0 
    dw Hitbox_MotherBrainBody_6 
    dw $0000,$0000 
    dw ExtendedTilemaps_MotherBrain_2 
    dw Hitbox_MotherBrainBody_9 
    dw $FFF6,$0038 
    dw Spritemaps_MotherBrain_17 
    dw Hitbox_MotherBrainBody_5 
    dw $0007,$001C 
    dw Spritemaps_MotherBrain_15 
    dw Hitbox_MotherBrainBody_4 
    dw $0002,$001D 
    dw Spritemaps_MotherBrain_16 
    dw Hitbox_MotherBrainBody_4 

ExtendedSpritemap_MotherBrainBrain_DeathBeamMode_1:
    dw $0009,$0012,$003A 
    dw Spritemaps_MotherBrain_13 
    dw Hitbox_MotherBrainBody_3 
    dw $001E,$001D 
    dw Spritemaps_MotherBrain_F 
    dw Hitbox_MotherBrainBody_2 
    dw $0019,$001E 
    dw Spritemaps_MotherBrain_11 
    dw Hitbox_MotherBrainBody_2 
    dw $0000,$FFFC 
    dw Spritemaps_MotherBrain_B 
    dw Hitbox_MotherBrainBody_2 
    dw $0000,$0000 
    dw ExtendedTilemaps_MotherBrain_0 
    dw Hitbox_MotherBrainBody_6 
    dw $0000,$0000 
    dw ExtendedTilemaps_MotherBrain_3 
    dw Hitbox_MotherBrainBody_A 
    dw $FFF6,$0038 
    dw Spritemaps_MotherBrain_17 
    dw Hitbox_MotherBrainBody_5 
    dw $0007,$001C 
    dw Spritemaps_MotherBrain_15 
    dw Hitbox_MotherBrainBody_4 
    dw $0002,$001D 
    dw Spritemaps_MotherBrain_16 
    dw Hitbox_MotherBrainBody_4 

ExtendedSpritemap_MotherBrainBrain_DeathBeamMode_2:
    dw $0009,$0012,$003A 
    dw Spritemaps_MotherBrain_13 
    dw Hitbox_MotherBrainBody_3 
    dw $001E,$001D 
    dw Spritemaps_MotherBrain_F 
    dw Hitbox_MotherBrainBody_2 
    dw $0019,$001E 
    dw Spritemaps_MotherBrain_11 
    dw Hitbox_MotherBrainBody_2 
    dw $0000,$FFFC 
    dw Spritemaps_MotherBrain_B 
    dw Hitbox_MotherBrainBody_2 
    dw $0000,$0000 
    dw ExtendedTilemaps_MotherBrain_0 
    dw Hitbox_MotherBrainBody_6 
    dw $0000,$0000 
    dw ExtendedTilemaps_MotherBrain_4 
    dw Hitbox_MotherBrainBody_B 
    dw $FFF6,$0038 
    dw Spritemaps_MotherBrain_17 
    dw Hitbox_MotherBrainBody_5 
    dw $0007,$001C 
    dw Spritemaps_MotherBrain_15 
    dw Hitbox_MotherBrainBody_4 
    dw $0002,$001D 
    dw Spritemaps_MotherBrain_16 
    dw Hitbox_MotherBrainBody_4 

ExtendedSpritemap_MotherBrainBrain_DeathBeamMode_3:
    dw $0009,$0012,$003A 
    dw Spritemaps_MotherBrain_13 
    dw Hitbox_MotherBrainBody_3 
    dw $001E,$001D 
    dw Spritemaps_MotherBrain_F 
    dw Hitbox_MotherBrainBody_2 
    dw $0019,$001E 
    dw Spritemaps_MotherBrain_11 
    dw Hitbox_MotherBrainBody_2 
    dw $0000,$FFFC 
    dw Spritemaps_MotherBrain_B 
    dw Hitbox_MotherBrainBody_2 
    dw $0000,$0000 
    dw ExtendedTilemaps_MotherBrain_0 
    dw Hitbox_MotherBrainBody_6 
    dw $0000,$0000 
    dw ExtendedTilemaps_MotherBrain_5 
    dw Hitbox_MotherBrainBody_C 
    dw $FFF6,$0038 
    dw Spritemaps_MotherBrain_17 
    dw Hitbox_MotherBrainBody_5 
    dw $0007,$001C 
    dw Spritemaps_MotherBrain_15 
    dw Hitbox_MotherBrainBody_4 
    dw $0002,$001D 
    dw Spritemaps_MotherBrain_16 
    dw Hitbox_MotherBrainBody_4 

Hitbox_MotherBrainBody_0:
    dw $0001,$FFEC,$FFEB,$0010,$0017 
    dw EnemyTouch_MotherBrainHead 
    dw EnemyShot_MotherBrainHead 

Hitbox_MotherBrainBody_1:
    dw $0001,$FFEC,$FFEB,$0013,$0017 
    dw EnemyTouch_MotherBrainHead 
    dw EnemyShot_MotherBrainHead 

Hitbox_MotherBrainBody_2:
    dw $0000 

Hitbox_MotherBrainBody_3:
    dw $0001,$FFE9,$FFFF,$0017,$0007 
    dw RTL_A9B5C5 
    dw EnemyShot_MotherBrainBody 

Hitbox_MotherBrainBody_4:
    dw $0000 

Hitbox_MotherBrainBody_5:
    dw $0001,$FFE9,$FFFE,$0017,$0007 
    dw RTL_A9B5C5 
    dw EnemyShot_MotherBrainBody 

Hitbox_MotherBrainBody_6:
    dw $0002,$FFE0,$FFE8,$0014,$0034 
    dw RTL_A9B5C5 
    dw EnemyShot_MotherBrainBody 
    dw $FFE8,$FFD6,$000D,$FFE7 
    dw RTL_A9B5C5 
    dw EnemyShot_MotherBrainBody 

Hitbox_MotherBrainBody_7:
    dw $0000 

Hitbox_MotherBrainBody_8:
    dw $0002,$0004,$FFC5,$001C,$FFE8 
    dw RTL_A9B5C5 
    dw EnemyShot_MotherBrainBody 
    dw $001C,$FFD7,$0039,$FFE2 
    dw RTL_A9B5C5 
    dw EnemyShot_MotherBrainBody 

Hitbox_MotherBrainBody_9:
    dw $0002,$0004,$FFC5,$001C,$FFE8 
    dw RTL_A9B5C5 
    dw EnemyShot_MotherBrainBody 
    dw $001C,$FFD7,$0036,$FFE2 
    dw RTL_A9B5C5 
    dw EnemyShot_MotherBrainBody 

Hitbox_MotherBrainBody_A:
    dw $0002,$0004,$FFC5,$001C,$FFE8 
    dw RTL_A9B5C5 
    dw EnemyShot_MotherBrainBody 
    dw $001D,$FFD5,$002D,$FFE8 
    dw RTL_A9B5C5 
    dw EnemyShot_MotherBrainBody 

Hitbox_MotherBrainBody_B:
    dw $0002,$0004,$FFC5,$001C,$FFE8 
    dw RTL_A9B5C5 
    dw EnemyShot_MotherBrainBody 
    dw $001D,$FFD0,$0044,$FFD8 
    dw RTL_A9B5C5 
    dw EnemyShot_MotherBrainBody 

Hitbox_MotherBrainBody_C:
    dw $0002,$0004,$FFC5,$001C,$FFE8 
    dw RTL_A9B5C5 
    dw EnemyShot_MotherBrainBody 
    dw $001C,$FFD7,$003A,$FFE1 
    dw RTL_A9B5C5 
    dw EnemyShot_MotherBrainBody 

Spritemaps_MotherBrain_0:
    dw $000B,$000C 
    db $01 
    dw $2133,$8002 
    db $09 
    dw $2100,$81E8 
    db $04 
    dw $2108,$81F8 
    db $04 
    dw $2102,$81F8 
    db $F4 
    dw $2120,$8008 
    db $00 
    dw $2104,$8008 
    db $F0 
    dw $211E,$8008 
    db $E8 
    dw $210E,$81F8 
    db $E4 
    dw $210A,$01F0 
    db $EC 
    dw $2122,$81E8 
    db $F4 
    dw $2106 

Spritemaps_MotherBrain_1:
    dw $000B,$000C 
    db $01 
    dw $2132,$8002 
    db $09 
    dw $2100,$81E8 
    db $04 
    dw $2108,$81F8 
    db $04 
    dw $2102,$81F8 
    db $F4 
    dw $2120,$8008 
    db $00 
    dw $2104,$8008 
    db $F0 
    dw $211E,$8008 
    db $E8 
    dw $210E,$81F8 
    db $E4 
    dw $210A,$01F0 
    db $EC 
    dw $2122,$81E8 
    db $F4 
    dw $2106 

Spritemaps_MotherBrain_2:
    dw $000A,$8002 
    db $09 
    dw $2100,$81E8 
    db $04 
    dw $2108,$81F8 
    db $04 
    dw $2102,$81F8 
    db $F4 
    dw $2120,$8008 
    db $00 
    dw $2104,$8008 
    db $F0 
    dw $211E,$8008 
    db $E8 
    dw $210E,$81F8 
    db $E4 
    dw $210A,$01F0 
    db $EC 
    dw $2122,$81E8 
    db $F4 
    dw $2106 

Spritemaps_MotherBrain_3:
    dw $000A,$81FF 
    db $0E 
    dw $2124,$81E8 
    db $04 
    dw $2108,$81F8 
    db $04 
    dw $2102,$81F8 
    db $F4 
    dw $2120,$8008 
    db $00 
    dw $2104,$8008 
    db $F0 
    dw $211E,$8008 
    db $E8 
    dw $210E,$81F8 
    db $E4 
    dw $210A,$01F0 
    db $EC 
    dw $2122,$81E8 
    db $F4 
    dw $2106 

Spritemaps_MotherBrain_4:
    dw $000A,$81FC 
    db $10 
    dw $2126,$81E8 
    db $04 
    dw $2108,$81F8 
    db $04 
    dw $2102,$81F8 
    db $F4 
    dw $2120,$8008 
    db $00 
    dw $2104,$8008 
    db $F0 
    dw $211E,$8008 
    db $E8 
    dw $210E,$81F8 
    db $E4 
    dw $210A,$01F0 
    db $EC 
    dw $2122,$81E8 
    db $F4 
    dw $2106 

Spritemaps_MotherBrain_5:
    dw $0001,$81F8 
    db $F8 
    dw $212A 

Spritemaps_MotherBrain_6:
    dw $000C,$000C 
    db $01 
    dw $2133,$8002 
    db $09 
    dw $2100,$8008 
    db $00 
    dw $2104,$0008 
    db $E8 
    dw $2123,$8008 
    db $F0 
    dw $213E,$81F8 
    db $E4 
    dw $213C,$81F8 
    db $F4 
    dw $2128,$81F8 
    db $04 
    dw $2102,$01F0 
    db $0C 
    dw $214B,$01F0 
    db $EC 
    dw $214A,$81E8 
    db $F4 
    dw $210C,$81E8 
    db $FC 
    dw $211C 

Spritemaps_MotherBrain_7:
    dw $000C,$000C 
    db $01 
    dw $2132,$8002 
    db $09 
    dw $2100,$8008 
    db $00 
    dw $2104,$0008 
    db $E8 
    dw $2123,$8008 
    db $F0 
    dw $213E,$81F8 
    db $E4 
    dw $213C,$81F8 
    db $F4 
    dw $2128,$81F8 
    db $04 
    dw $2102,$01F0 
    db $0C 
    dw $214B,$01F0 
    db $EC 
    dw $214A,$81E8 
    db $F4 
    dw $210C,$81E8 
    db $FC 
    dw $211C 

Spritemaps_MotherBrain_8:
    dw $000B,$8002 
    db $09 
    dw $2100,$8008 
    db $00 
    dw $2104,$0008 
    db $E8 
    dw $2123,$8008 
    db $F0 
    dw $213E,$81F8 
    db $E4 
    dw $213C,$81F8 
    db $F4 
    dw $2128,$81F8 
    db $04 
    dw $2102,$01F0 
    db $0C 
    dw $214B,$01F0 
    db $EC 
    dw $214A,$81E8 
    db $F4 
    dw $210C,$81E8 
    db $FC 
    dw $211C 

Spritemaps_MotherBrain_9:
    dw $000B,$81FF 
    db $0E 
    dw $2124,$8008 
    db $00 
    dw $2104,$0008 
    db $E8 
    dw $2123,$8008 
    db $F0 
    dw $213E,$81F8 
    db $E4 
    dw $213C,$81F8 
    db $F4 
    dw $2128,$81F8 
    db $04 
    dw $2102,$01F0 
    db $0C 
    dw $214B,$01F0 
    db $EC 
    dw $214A,$81E8 
    db $F4 
    dw $210C,$81E8 
    db $FC 
    dw $211C 

Spritemaps_MotherBrain_A:
    dw $000B,$81FC 
    db $10 
    dw $2126,$8008 
    db $00 
    dw $2104,$0008 
    db $E8 
    dw $2123,$8008 
    db $F0 
    dw $213E,$81F8 
    db $E4 
    dw $213C,$81F8 
    db $F4 
    dw $2128,$81F8 
    db $04 
    dw $2102,$01F0 
    db $0C 
    dw $214B,$01F0 
    db $EC 
    dw $214A,$81E8 
    db $F4 
    dw $210C,$81E8 
    db $FC 
    dw $211C 

Spritemaps_MotherBrain_B:
    dw $0009,$001C 
    db $1C 
    dw $337B,$8014 
    db $0C 
    dw $335A,$800C 
    db $14 
    dw $3369,$000C 
    db $0C 
    dw $3366,$0014 
    db $04 
    dw $F378,$0004 
    db $14 
    dw $3378,$01FC 
    db $FC 
    dw $3347,$81FC 
    db $04 
    dw $3357,$8004 
    db $FC 
    dw $3348 

Spritemaps_MotherBrain_C:
    dw $0006,$801D 
    db $03 
    dw $335E,$801D 
    db $0B 
    dw $336E,$800D 
    db $0B 
    dw $3362,$800D 
    db $FB 
    dw $3360,$81FD 
    db $03 
    dw $336C,$81FD 
    db $FB 
    dw $335C 

Spritemaps_MotherBrain_D:
    dw $0008,$0028 
    db $00 
    dw $B377,$0028 
    db $F8 
    dw $3377,$8018 
    db $00 
    dw $B343,$8018 
    db $F0 
    dw $3343,$8010 
    db $00 
    dw $B342,$8000 
    db $00 
    dw $B340,$8010 
    db $F0 
    dw $3342,$8000 
    db $F0 
    dw $3340 

Spritemaps_MotherBrain_E:
    dw $0006,$801D 
    db $ED 
    dw $B35E,$801D 
    db $E5 
    dw $B36E,$800D 
    db $E5 
    dw $B362,$800D 
    db $F5 
    dw $B360,$81FD 
    db $ED 
    dw $B36C,$81FD 
    db $F5 
    dw $B35C 

Spritemaps_MotherBrain_F:
    dw $0001,$81F8 
    db $F8 
    dw $3364 

Spritemaps_MotherBrain_10:
    dw $0002,$81F8 
    db $10 
    dw $3388,$81F8 
    db $00 
    dw $3345 

Spritemaps_MotherBrain_11:
    dw $0002,$81F3 
    db $10 
    dw $338A,$81F7 
    db $00 
    dw $3381 

Spritemaps_MotherBrain_12:
    dw $0004,$01FB 
    db $0E 
    dw $3376,$81EB 
    db $0E 
    dw $3386,$81FB 
    db $FE 
    dw $3384,$81F3 
    db $FE 
    dw $3383 

Spritemaps_MotherBrain_13:
    dw $0004,$0010 
    db $00 
    dw $3390,$0008 
    db $00 
    dw $3380,$81F8 
    db $F8 
    dw $338E,$81E8 
    db $F8 
    dw $338C 

Spritemaps_MotherBrain_14:
    dw $0009,$001C 
    db $1C 
    dw $277B,$8014 
    db $0C 
    dw $275A,$800C 
    db $14 
    dw $2769,$000C 
    db $0C 
    dw $2766,$0014 
    db $04 
    dw $E778,$0004 
    db $14 
    dw $2778,$01FC 
    db $FC 
    dw $2747,$81FC 
    db $04 
    dw $2757,$8004 
    db $FC 
    dw $2748 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemaps_MotherBrain_A9A8D5:
    dw $0006,$801D 
    db $03 
    dw $275E,$801D 
    db $0B 
    dw $276E,$800D 
    db $0B 
    dw $2762,$800D 
    db $FB 
    dw $2760,$81FD 
    db $03 
    dw $276C,$81FD 
    db $FB 
    dw $275C 

UNUSED_Spritemaps_MotherBrain_A9A8F5:
    dw $0008,$0028 
    db $00 
    dw $A777,$0028 
    db $F8 
    dw $2777,$8018 
    db $00 
    dw $A743,$8018 
    db $F0 
    dw $2743,$8010 
    db $00 
    dw $A742,$8000 
    db $00 
    dw $A740,$8010 
    db $F0 
    dw $2742,$8000 
    db $F0 
    dw $2740 

UNUSED_Spritemaps_MotherBrain_A9A91F:
    dw $0006,$801D 
    db $ED 
    dw $A75E,$801D 
    db $E5 
    dw $A76E,$800D 
    db $E5 
    dw $A762,$800D 
    db $F5 
    dw $A760,$81FD 
    db $ED 
    dw $A76C,$81FD 
    db $F5 
    dw $A75C 
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemaps_MotherBrain_15:
    dw $0001,$81F8 
    db $F8 
    dw $2764 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemaps_MotherBrain_A9A946:
    dw $0002,$81F8 
    db $10 
    dw $2788,$81F8 
    db $00 
    dw $2745 

UNUSED_Spritemaps_MotherBrain_A9A952:
    dw $0002,$81F3 
    db $10 
    dw $278A,$81F7 
    db $00 
    dw $2781 
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemaps_MotherBrain_16:
    dw $0004,$01FB 
    db $0E 
    dw $2776,$81EB 
    db $0E 
    dw $2786,$81FB 
    db $FE 
    dw $2784,$81F3 
    db $FE 
    dw $2783 

Spritemaps_MotherBrain_17:
    dw $0004,$0010 
    db $00 
    dw $2790,$0008 
    db $00 
    dw $2780,$81F8 
    db $F8 
    dw $278E,$81E8 
    db $F8 
    dw $278C 

ExtendedTilemaps_MotherBrain_0:
    dw $FFFE,$2080,$0004,$2338,$2338,$31B7,$31B8,$20C0 
    dw $0004,$2338,$31B9,$31BA,$31BB,$2100,$0004,$2338 
    dw $31BC,$31BD,$31BE,$2140,$000A,$31BF,$31C0,$31C1 
    dw $31C2,$31C3,$31C4,$31C5,$31C6,$31C7,$31C8,$2180 
    dw $000A,$31CA,$31CB,$31CC,$31CD,$31CE,$31CF,$31D0 
    dw $2338,$2338,$2338,$21C0,$000A,$31D1,$31D2,$31D3 
    dw $31D4,$31D5,$31D6,$31D7,$31D8,$2338,$2338,$2200 
    dw $000A,$31D9,$31DA,$31DB,$31DC,$31DD,$31DE,$31DF 
    dw $31E0,$2338,$2338,$2240,$000A,$31E1,$31E2,$31E3 
    dw $31E4,$31E5,$31E6,$31E7,$2338,$2338,$2338,$2280 
    dw $000A,$2338,$31E8,$31E9,$31EA,$31EB,$31EC,$31ED 
    dw $2338,$2338,$2338,$22C0,$0004,$2338,$2338,$31EE 
    dw $31EF,$FFFF 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ExtendedTilemaps_MotherBrain_A9AA4E:
    dw $FFFE,$2084,$0002,$2338,$2338,$20C2,$0003,$2338 
    dw $2338,$2338,$2102,$0003,$2338,$2338,$2338,$2140 
    dw $000A,$2338,$2338,$2338,$2338,$2338,$2338,$2338 
    dw $2338,$2338,$2338,$2180,$0007,$2338,$2338,$2338 
    dw $2338,$2338,$2338,$2338,$21C0,$0008,$2338,$2338 
    dw $2338,$2338,$2338,$2338,$2338,$2338,$2200,$0008 
    dw $2338,$2338,$2338,$2338,$2338,$2338,$2338,$2338 
    dw $2240,$0007,$2338,$2338,$2338,$2338,$2338,$2338 
    dw $2338,$2282,$0006,$2338,$2338,$2338,$2338,$2338 
    dw $2338,$22C4,$0002,$2338,$2338,$FFFF 
endif ; !FEATURE_KEEP_UNREFERENCED

ExtendedTilemaps_MotherBrain_1:
    dw $FFFE,$2006,$000B,$2338,$2338,$3167,$3168,$3169 
    dw $2338,$2338,$2338,$2338,$2338,$2338,$2046,$000B 
    dw $2338,$316A,$316B,$316C,$316D,$316E,$2338,$2338 
    dw $2338,$2338,$2338,$2086,$000B,$31B8,$316F,$3170 
    dw $3171,$3172,$3173,$3174,$3186,$3187,$2338,$2338 
    dw $20C6,$000B,$31BB,$3177,$3178,$3179,$317A,$317B 
    dw $317C,$3188,$3189,$2338,$2338,$2106,$000B,$31BE 
    dw $317F,$3180,$3181,$3182,$3183,$3184,$3185,$2338 
    dw $2338,$2338,$FFFF 

ExtendedTilemaps_MotherBrain_2:
    dw $FFFE,$2006,$000B,$2338,$2338,$3167,$3168,$3169 
    dw $2338,$2338,$2338,$2338,$2338,$2338,$2046,$000B 
    dw $2338,$316A,$316B,$316C,$316D,$316E,$2338,$2338 
    dw $2338,$2338,$2338,$2086,$000B,$31B8,$316F,$3170 
    dw $3171,$3172,$3173,$3174,$3175,$3176,$2338,$2338 
    dw $20C6,$000B,$31BB,$3177,$3178,$3179,$317A,$317B 
    dw $317C,$317D,$317E,$2338,$2338,$2106,$000B,$31BE 
    dw $317F,$3180,$3181,$3182,$3183,$3184,$3185,$2338 
    dw $2338,$2338,$FFFF 

ExtendedTilemaps_MotherBrain_3:
    dw $FFFE,$2006,$0001,$2338,$200A,$0002,$318A,$318B 
    dw $2018,$0002,$2338,$2338,$2046,$0001,$2338,$204A 
    dw $0003,$318C,$318D,$318E,$2058,$0002,$2338,$2338 
    dw $2086,$000B,$31B8,$318F,$3190,$3191,$3192,$3193 
    dw $3194,$2338,$2338,$2338,$2338,$20C6,$000B,$31BB 
    dw $3195,$3196,$3197,$3198,$3199,$319A,$319B,$2338 
    dw $2338,$2338,$2106,$0001,$31BE,$210C,$0004,$319C 
    dw $319D,$319E,$319F,$2118,$0002,$2338,$2338,$FFFF 

ExtendedTilemaps_MotherBrain_4:
    dw $FFFE,$200A,$0003,$3167,$31A0,$31A1,$2046,$0001 
    dw $31B6,$204A,$0004,$31A2,$31A3,$31A4,$31A5,$2056 
    dw $0003,$31A6,$31A7,$31A8,$2088,$000A,$316F,$31A9 
    dw $31AA,$31AB,$31AC,$31AD,$31AE,$31AF,$31B0,$31B1 
    dw $20C8,$0007,$3177,$3178,$3178,$31B2,$31B3,$31B4 
    dw $31B5,$2106,$0001,$31BE,$210C,$0004,$319C,$319D 
    dw $319E,$319F,$2118,$0002,$2338,$2338,$FFFF 

ExtendedTilemaps_MotherBrain_5:
    dw $FFFE,$200C,$0002,$3168,$3169,$2046,$0001,$2338 
    dw $204A,$0004,$316B,$316C,$316D,$316E,$2056,$0003 
    dw $2338,$2338,$2338,$208A,$0009,$3170,$3171,$3172 
    dw $3173,$3174,$3186,$3187,$2338,$2338,$20CC,$0006 
    dw $3179,$317A,$317B,$317C,$3188,$3189,$210C,$0004 
    dw $3181,$3182,$3183,$3184,$FFFF 

Spritemaps_MotherBrain_18:
    dw $0009,$8008 
    db $08 
    dw $21E4,$81F8 
    db $08 
    dw $21E2,$81E8 
    db $08 
    dw $21E0,$8008 
    db $F8 
    dw $21C4,$81F8 
    db $F8 
    dw $21C2,$81E8 
    db $F8 
    dw $21C0,$8008 
    db $E8 
    dw $21A4,$81F8 
    db $E8 
    dw $21A2,$81E8 
    db $E8 
    dw $21A0 

Spritemaps_MotherBrain_19:
    dw $000A,$8014 
    db $08 
    dw $21EC,$8004 
    db $08 
    dw $21EA,$81F4 
    db $08 
    dw $21E8,$81E4 
    db $08 
    dw $21E6,$8004 
    db $F8 
    dw $21CA,$81F4 
    db $F8 
    dw $21C8,$81E4 
    db $F8 
    dw $21C6,$8004 
    db $E8 
    dw $21AA,$81F4 
    db $E8 
    dw $21A8,$81E4 
    db $E8 
    dw $21A6 

Spritemaps_MotherBrainTubes_0:
    dw $000A,$0008 
    db $E4 
    dw $2F5D,$0008 
    db $DC 
    dw $2F4D,$0000 
    db $E4 
    dw $2F5D,$0000 
    db $DC 
    dw $2F4D,$C3F0 
    db $DC 
    dw $2F42,$01F8 
    db $1C 
    dw $2F51,$01F0 
    db $1C 
    dw $2F50,$C3F0 
    db $FC 
    dw $2F47,$C3F0 
    db $EC 
    dw $AF40,$C3F0 
    db $0C 
    dw $2F40 

Spritemaps_MotherBrainTubes_1:
    dw $000A,$01F0 
    db $E4 
    dw $6F5D,$01F0 
    db $DC 
    dw $6F4D,$01F8 
    db $E4 
    dw $6F5D,$01F8 
    db $DC 
    dw $6F4D,$C200 
    db $DC 
    dw $6F42,$0000 
    db $1C 
    dw $6F51,$0008 
    db $1C 
    dw $6F50,$C200 
    db $FC 
    dw $6F47,$C200 
    db $EC 
    dw $EF40,$C200 
    db $0C 
    dw $6F40 

Spritemaps_MotherBrainTubes_2:
    dw $0008,$C3F8 
    db $E4 
    dw $2F44,$0000 
    db $14 
    dw $2F51,$01F8 
    db $14 
    dw $2F50,$C3F8 
    db $04 
    dw $2F4B,$0000 
    db $FC 
    dw $2F51,$01F8 
    db $FC 
    dw $2F50,$0000 
    db $F4 
    dw $2F51,$01F8 
    db $F4 
    dw $2F50 

Spritemaps_MotherBrainTubes_3:
    dw $0008,$C3F8 
    db $E4 
    dw $6F44,$01F8 
    db $14 
    dw $6F51,$0000 
    db $14 
    dw $6F50,$C3F8 
    db $04 
    dw $2F4B,$01F8 
    db $FC 
    dw $6F51,$0000 
    db $FC 
    dw $6F50,$01F8 
    db $F4 
    dw $6F51,$0000 
    db $F4 
    dw $6F50 

Spritemaps_MotherBrainTubes_4:
    dw $001A,$0000 
    db $E0 
    dw $6F70,$01F8 
    db $E0 
    dw $2F70,$0000 
    db $D8 
    dw $6F60,$01F8 
    db $D8 
    dw $2F60,$0008 
    db $28 
    dw $2F6D,$0000 
    db $28 
    dw $2F6D,$01F8 
    db $28 
    dw $2F6D,$01F0 
    db $28 
    dw $2F6D,$0008 
    db $20 
    dw $2F6D,$0000 
    db $20 
    dw $2F6D,$01F8 
    db $20 
    dw $2F6D,$01F0 
    db $20 
    dw $2F6D,$0008 
    db $18 
    dw $2F6C,$0000 
    db $18 
    dw $2F6C,$01F8 
    db $18 
    dw $2F6C,$01F0 
    db $18 
    dw $2F6C,$C200 
    db $F8 
    dw $6F49,$C3F0 
    db $F8 
    dw $2F49,$C200 
    db $08 
    dw $6F46,$C3F0 
    db $08 
    dw $2F46,$C200 
    db $E8 
    dw $2F40,$C3F0 
    db $E8 
    dw $2F40,$C200 
    db $D8 
    dw $EF4E,$C3F0 
    db $D8 
    dw $AF4E,$C200 
    db $D0 
    dw $EF5E,$C3F0 
    db $D0 
    dw $AF5E 

Function_MBBody_Phase3_DeathSequence_MoveToBackOfRoom:
    LDA.W $0F86 
    ORA.W #$0400 
    STA.W $0F86 
    LDA.W $0FC6 
    ORA.W #$0400 
    STA.W $0FC6 
    LDA.W #$0000 
    STA.L $7E7808 
    LDY.W #$0006 
    LDA.W #$0028 
    JSR.W MakeMotherBrainWalkBackwards 
    BCS .arrivedAtBack 
    RTS 


.arrivedAtBack:
    LDA.W #Function_MBBody_Phase3_DeathSequence_IdleWhilstExploding 
    STA.W $0FA8 
    LDA.W #$0080 
    STA.W $0FB2 

Function_MBBody_Phase3_DeathSequence_IdleWhilstExploding:
    JSR.W GenerateSmokyExplosionsAroundMotherBrainBody 
    DEC.W $0FB2 
    BPL Function_MBBody_Phase3_DeathSequence_return 
    LDA.W #Function_MBBody_Phase3_DeathSequence_StumbleToMiddleOfRoom 
    STA.W $0FA8 

Function_MBBody_Phase3_DeathSequence_return:
    RTS 


Function_MBBody_Phase3_DeathSequence_StumbleToMiddleOfRoom:
    JSR.W GenerateSmokyExplosionsAroundMotherBrainBody 
    LDY.W #$0002 
    LDA.W #$0060 
    JSR.W MakeMotherBrainWalkForwards 
    BCC Function_MBBody_Phase3_DeathSequence_return 
    LDA.W #InstList_MotherBrainHead_DyingDrool_0 
    JSR.W SetMotherBrainHeadInstList 
    LDA.W #$0006 
    STA.L $7E8064 
    STA.L $7E8066 
    LDA.W #$0500 
    STA.L $7E8068 
    LDA.W #Function_MBBody_Phase3_DeathSequence_DisableBrainEffects 
    STA.W $0FA8 
    LDA.W #$0020 
    STA.W $0FB2 
    RTS 


Function_MBBody_Phase3_DeathSequence_DisableBrainEffects:
    JSR.W GenerateSmokyExplosionsAroundMotherBrainBody 
    DEC.W $0FB2 
    BPL Function_MBBody_Phase3_DeathSequence_return 
    LDA.W #$0000 
    STA.L $7E8064 
    STA.L $7E8066 
    STA.L $7E7864 
    STA.L $7E7868 
    STA.L $7E7860 
    STA.L $7E7862 
    LDX.W #$001C 

.loopPalette:
    LDA.L $7EC122,X 
    STA.L $7EC1E2,X 
    DEX 
    DEX 
    BPL .loopPalette 
    JSL.L MotherBrainHealthBasedPaletteHandling 
    LDA.W #$0E00 
    STA.L $7E781A 
    STZ.W $0FF0 
    STZ.W $0FF2 
    LDA.W #Function_MBBody_Phase3_DeathSequence_SetupBodyFadeOut 
    STA.W $0FA8 ; fallthrough to Function_MBBody_Phase3_DeathSequence_SetupBodyFadeOut

Function_MBBody_Phase3_DeathSequence_SetupBodyFadeOut:
    JSR.W GenerateMixedExplosionsAroundMotherBrainBody 
    DEC.W $0FB2 
    BMI .timerExpired 
    RTS 


.timerExpired:
    LDA.W #$0000 
    STA.L $7E802E 
    LDA.W #Function_MBBody_Phase3_DeathSequence_FadeOutBody 
    STA.W $0FA8 
    STZ.W $0FB2 ; fallthrough to Function_MBBody_Phase3_DeathSequence_FadeOutBody

Function_MBBody_Phase3_DeathSequence_FadeOutBody:
    JSL.L HandleMotherBrainBodyFlickering 
    JSR.W GenerateMixedExplosionsAroundMotherBrainBody 
    DEC.W $0FB2 
    BPL .returnUpper 
    LDA.W #$0010 
    STA.W $0FB2 
    LDA.L $7E802E 
    INC A 
    STA.L $7E802E 
    DEC A 
    JSL.L FadeMotherBrainPaletteToBlack 
    BCS .fadedToBlack 

.returnUpper:
    RTS 


.fadedToBlack:
    LDA.W #$02C6 
    STA.W $179A 
    TAX 
    PHB 
    PEA.W $7E7E 
    PLB 
    PLB 
    LDA.W #$0338 ; >.< off by one, causing a few black pixels to remain

.loopTilemap:
    STA.W $2000,X 
    DEX 
    DEX 
    BPL .loopTilemap 
    PLB 
    LDA.W #$0001 
    STA.W $0E1E 
    LDA.W $0F86 
    ORA.W #$0100 
    AND.W #$DFFF 
    STA.W $0F86 
    STZ.W $0F88 
    LDA.W #Function_MBBody_Phase3_DeathSequence_FinalFewExplosions 
    STA.W $0FA8 
    LDA.W #$0010 
    STA.W $0FB2 

Function_MBBody_Phase3_DeathSequence_FadeOutBody_returnLower:
    RTS 


Function_MBBody_Phase3_DeathSequence_FinalFewExplosions:
    JSR.W GenerateMixedExplosionsAroundMotherBrainBody 
    DEC.W $0FB2 
    BPL Function_MBBody_Phase3_DeathSequence_FadeOutBody_returnLower 
    LDA.W #Function_MBBody_Phase3_DeathSequence_RealizeDecapitation 
    STA.W $0FA8 
    RTS 


GenerateSmokyExplosionsAroundMotherBrainBody:
    LDA.W #MotherBrainExplosionParameters_1 
    STA.B $16 
    LDA.W #$0002 
    STA.B $18 
    LDA.W #$0010 
    BRA GenerateExplosionsAroundMotherBrainBody 


GenerateMixedExplosionsAroundMotherBrainBody:
    LDA.W #MotherBrainExplosionParameters_0 
    STA.B $16 
    LDA.W #$0004 
    STA.B $18 
    LDA.W #$0008 ; fallthrough to GenerateExplosionsAroundMotherBrainBody

GenerateExplosionsAroundMotherBrainBody:
    DEC.W $0FF0 
    BPL Function_MBBody_Phase3_DeathSequence_FadeOutBody_returnLower 
    STA.W $0FF0 
    DEC.W $0FF2 
    BPL .getIndex 
    LDA.W #$0006 
    STA.W $0FF2 

.getIndex:
    LDA.W $0FF2 
    ASL A 
    ASL A 
    ASL A 
    ASL A 
    TAX 
    LDA.B $18 

.loop:
    PHA 
    PHX 
    LDA.W .XOffset,X 
    STA.B $12 
    LDA.W .YOffset,X 
    STA.B $14 
    LDX.B $16 
    LDY.W $0000,X 
    JSL.L GenerateRandomNumber 
    CMP.W #$4000 
    BCC .random 
    LDY.W $0002,X 
    CMP.W #$E000 
    BCC .random 
    LDY.W $0004,X 

.random:
    TYA 
    LDY.W #EnemyProjectile_MotherBrainDeathExplosion 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    PLX 
    PLA 
    INX 
    INX 
    INX 
    INX 
    DEC A 
    BNE .loop 
    LDA.W #$0013 
    JSL.L QueueSound_Lib3_Max3 
    RTS 


.XOffset:
    dw $0024 

.YOffset:
    dw $FFDB,$FFED,$FFF1,$FFFC,$000D,$001D,$0019,$0011 
    dw $FFC9,$001E,$FFEA,$FFFD,$FFFB,$0000,$0028,$0034 
    dw $FFDE,$FFFD,$FFF1,$000C,$0013,$0019,$002C,$0004 
    dw $FFD5,$FFF4,$FFEA,$000D,$FFFE,$FFF8,$0034,$FFFE 
    dw $FFDF,$000A,$FFF6,$FFF2,$0010,$0006,$003B,$0014 
    dw $FFD7,$0004,$FFEA,$FFEC,$0003,$FFE5,$0039,$000A 
    dw $FFE1,$FFEC,$FFF8,$0000,$0017,$001E,$003D 

MotherBrainExplosionParameters_0:
    dw $0000,$0001,$0002 

MotherBrainExplosionParameters_1:
    dw $0001,$0001,$0001 

Function_MBBody_Phase3_DeathSequence_RealizeDecapitation:
    LDA.W #InstList_MotherBrainHead_Decapitated_0 
    JSR.W SetMotherBrainHeadInstList 
    LDA.W #Function_MotherBrain_SetupBrainToBeDrawn 
    STA.W $0FE8 
    LDA.W #$0000 
    STA.W $0FB2 
    LDA.W #Function_MBBody_Phase3_DeathSequence_BrainFallsToGround 
    STA.W $0FA8 ; fallthrough to Function_MBBody_Phase3_DeathSequence_BrainFallsToGround

Function_MBBody_Phase3_DeathSequence_BrainFallsToGround:
    LDA.W $0FB2 
    CLC 
    ADC.W #$0020 
    STA.W $0FB2 
    XBA 
    AND.W #$00FF 
    CLC 
    ADC.W $0FBE 
    CMP.W #$00C4 
    BCC .hitGround 
    LDA.W #$0002 
    JSL.L EnableEarthquakeTypeInAFor20Frames 
    LDA.W #Function_MBBody_Phase3_DeathSequence_LoadCorpseTiles 
    STA.W $0FA8 
    LDA.W #$0100 
    STA.W $0FB2 
    LDA.W #$00C4 

.hitGround:
    STA.W $0FBE 
    RTS 


Function_MBBody_Phase3_DeathSequence_LoadCorpseTiles:
    LDX.W #MotherBrainFightSpriteTileTransferEntries_corpse 
    JSR.W ProcessSpriteTilesTransfers 
    BCC Function_MBBody_Phase3_DeathSequence_LoadCorpseTiles_return 
    LDA.W #Function_MBBody_Phase3_DeathSequence_SetupFadeToGrey 
    STA.W $0FA8 
    LDA.W #$0020 
    STA.W $0FB2 

Function_MBBody_Phase3_DeathSequence_LoadCorpseTiles_return:
    RTS 


Function_MBBody_Phase3_DeathSequence_SetupFadeToGrey:
    DEC.W $0FB2 
    BPL Function_MBBody_Phase3_DeathSequence_LoadCorpseTiles_return 
    LDA.W #$0000 
    STA.L $7E802E 
    LDA.W #Function_MBBody_Phase3_DeathSequence_FadeToGrey 
    STA.W $0FA8 
    STZ.W $0FB2 
    RTS 


Function_MBBody_Phase3_DeathSequence_FadeToGrey:
    DEC.W $0FB2 
    BPL .return 
    LDA.L $7E802E 
    INC A 
    STA.L $7E802E 
    DEC A 
    JSL.L TransitionMotherBrainPaletteToGrey_RealDeath 
    BCS .finishedTransition 
    LDA.W #$0010 
    STA.W $0FB2 

.return:
    RTS 


.finishedTransition:
    LDA.W #InstList_MotherBrainHead_Corpse_0 
    JSR.W SetMotherBrainHeadInstList 
    LDA.W #Function_MBBody_Phase3_DeathSequence_CorpseTipsOver 
    STA.W $0FA8 
    LDA.W #$0100 
    STA.W $0FB2 
    RTS 


Function_MBBody_Phase3_DeathSequence_CorpseTipsOver:
    DEC.W $0FB2 
    BMI .timerExpired 
    RTS 


.timerExpired:
    LDA.W #Function_MBBody_Phase3_DeathSequence_CorpseRotsAway 
    STA.W $0FA8 
    LDA.W $0FC6 
    ORA.W #$0400 
    STA.W $0FC6 
    LDA.W #$0000 
    STA.L $7E7808 
    RTS 


Function_MBBody_Phase3_DeathSequence_CorpseRotsAway:
    LDX.W #$0040 
    JSR.W ProcessCorpseRotting 
    BCC .finishedRotting 
    LDX.W #$0040 
    LDA.L $7E8826,X 
    TAX 
    JMP.W ProcessCorpseRottingVRAMTransfers 


.finishedRotting:
    LDA.W $0FC6 
    ORA.W #$0100 
    AND.W #$DFFF 
    STA.W $0FC6 
    STZ.W $0FC8 
    LDA.W #$0000 
    JSL.L QueueMusicDataOrTrack_8FrameDelay 
    LDA.W #$FF24 
    JSL.L QueueMusicDataOrTrack_8FrameDelay 
    LDA.W #Function_MBBody_Phase3_DeathSequence_20FrameDelay 
    STA.W $0FA8 
    LDA.W #$0014 
    STA.W $0FB2 ; fallthrough to Function_MBBody_Phase3_DeathSequence_20FrameDelay

Function_MBBody_Phase3_DeathSequence_20FrameDelay:
    DEC.W $0FB2 
    BPL .return 
    STZ.W $0FBA 
    STZ.W $0FBE 
    LDA.W #Function_MBBody_Phase3_DeathSequence_LoadEscapeTimerTiles 
    STA.W $0FA8 

.return:
    RTS 


CorpseRottingRotEntryFinishedHook_MotherBrain:
    PHX 
    LDA.W $05E5 
    AND.W #$001F 
    CLC 
    ADC.W $0FBA 
    CLC 
    ADC.W #$FFF0 
    STA.B $12 
    LDA.W $0FBE 
    CLC 
    ADC.W #$0010 
    STA.B $14 
    LDA.W #$000A 
    LDY.W #EnemyProjectile_MiscDust 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    LDA.W $0E44 
    AND.W #$0007 
    BNE .return 
    LDA.W #$0010 
    JSL.L QueueSound_Lib2_Max3 

.return:
    PLX 
    RTS 


Function_MBBody_Phase3_DeathSequence_LoadEscapeTimerTiles:
    PHB 
    PEA.W $A600 
    PLB 
    PLB 
    LDX.W #ZebesEscapeTimerSpriteTileTransferEntries_size 
    JSR.W ProcessSpriteTilesTransfers 
    PLB 
    BCC Function_MBBody_Phase3_DeathSequence_StartEscape_return 
    LDA.W #Function_MBBody_Phase3_DeathSequence_StartEscape 
    STA.W $0FA8 ; fallthrough to Function_MBBody_Phase3_DeathSequence_StartEscapeSequence

Function_MBBody_Phase3_DeathSequence_StartEscape:
    LDX.W #MotherBrainFightSpriteTileTransferEntries_explodedDoor 
    JSR.W ProcessSpriteTilesTransfers 
    BCC Function_MBBody_Phase3_DeathSequence_StartEscape_return 
    LDY.W #Palette_MotherBrain_ExplodedDoor+2 
    LDX.W #$0122 
    LDA.W #$000E 
    JSL.L WriteAColorsFromYtoColorIndexX 
    LDA.W #$0007 
    JSL.L QueueMusicDataOrTrack_8FrameDelay 
    LDA.W #$0005 
    STA.W $183E 
    LDA.W #$FFFF 
    STA.W $1840 
    LDY.W #PaletteFXObjects_Tourian8_ShutterRedFlashing 
    JSL.L Spawn_PaletteFXObject 
    LDY.W #PaletteFXObjects_Tourian10_BackgroundRedFlashing 
    JSL.L Spawn_PaletteFXObject 
    LDY.W #PaletteFXObjects_Tourian20_GeneralLevelRedFlashing 
    JSL.L Spawn_PaletteFXObject 
    LDY.W #PaletteFXObjects_Tourian40_RedFlashingArkanoidBlocksRedOrbs 
    JSL.L Spawn_PaletteFXObject 
    LDA.W #$0000 
    STA.L $7E7844 
    JSL.L SetupZebesEscapeTypewriter 
    LDA.W #$0020 
    STA.W $0FB2 
    LDY.W #Function_MBBody_Phase3_DeathSequence_SpawnTimeBombSetJapanText 
    LDA.W $09E2 
    BNE .keepJapanText 
    LDY.W #Function_MBBody_Phase3_DeathSequence_TypeOutZebesEscapeText 

.keepJapanText:
    STY.W $0FA8 

Function_MBBody_Phase3_DeathSequence_StartEscape_return:
    RTS 


Function_MBBody_Phase3_DeathSequence_SpawnTimeBombSetJapanText:
    DEC.W $0FB2 
    BPL Function_MBBody_Phase3_DeathSequence_TypeOutZebesEscapeText 
    LDA.W #Function_MBBody_Phase3_DeathSequence_TypeOutZebesEscapeText 
    STA.W $0FA8 
    LDY.W #EnemyProjectile_TimeBombSetJapanText 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics ; fallthrough to Function_MBBody_Phase3_DeathSequence_TypeOutZebesEscapeText

Function_MBBody_Phase3_DeathSequence_TypeOutZebesEscapeText:
    LDA.W #$2610 
    JSL.L HandleTypewriterText_External 
    BCC .return 
    LDA.W #Function_MBBody_Phase3_DeathSequence_DoorExploding_StartTimer 
    STA.W $0FA8 
    LDA.W #$0020 
    STA.W $0FB2 

.return:
    RTS 


Function_MBBody_Phase3_DeathSequence_DoorExploding_StartTimer:
    JSL.L GenerateEscapeDoorExplosion 
    DEC.W $0FB2 
    BPL .return 
    LDA.W #$000F 
    JSL.L Run_Samus_Command 
    LDA.W #$0002 
    STA.W $0943 
    JSL.L SetBossBitsInAForCurrentArea 
    LDA.W #$000E 
    JSL.L MarkEvent_inA 
    LDA.W #Function_MBBody_Phase3_DeathSequence_BlowUpEscapeDoor 
    STA.W $0FA8 
    LDA.W #$0000 
    STA.W $0FF0 
    STA.W $0FF2 

.return:
    RTS 


Function_MBBody_Phase3_DeathSequence_BlowUpEscapeDoor:
    JSR.W ExplodeMotherBrainEscapeDoor 
    LDA.W #Function_MBBody_Phase3_DeathSequence_KeepEarthquakeGoing 
    STA.W $0FA8 
    JSL.L Spawn_Hardcoded_PLM 
    db $00,$06 
    dw PLMEntries_motherBrainsRoomEscapeDoor 
    RTS 


Function_MBBody_Phase3_DeathSequence_KeepEarthquakeGoing:
    LDA.W $1840 
    BNE .return 
    DEC A 
    STA.W $1840 

.return:
    RTS 


GenerateEscapeDoorExplosion:
    LDA.W $0FF0 
    DEC A 
    STA.W $0FF0 
    BPL .return 
    LDA.W #$0004 
    STA.W $0FF0 
    LDA.W $0FF2 
    DEC A 
    STA.W $0FF2 
    BPL .max3 
    LDA.W #$0003 
    STA.W $0FF2 

.max3:
    LDA.W $0FF2 
    ASL A 
    ASL A 
    TAY 
    LDA.W .data0,Y 
    STA.B $12 
    LDA.W .data1,Y 
    STA.B $14 
    LDY.W #$0003 
    JSL.L GenerateRandomNumber 
    CMP.W #$4000 
    BCS .keepExplosion 
    LDY.W #$000C 

.keepExplosion:
    TYA 
    LDY.W #EnemyProjectile_MiscDust 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    LDA.W #$0024 
    JSL.L QueueSound_Lib2_Max3 

.return:
    RTL 


.data0:
    dw $0008 

.data1:
    dw $006C,$0018,$0080,$0009,$0090,$0018,$0074 

ExplodeMotherBrainEscapeDoor:
    LDA.W #$0000 

.loop:
    PHA 
    LDY.W #EnemyProjectile_MotherBrainExplodedEscapeDoorParticles 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    PLA 
    INC A 
    CMP.W #$0008 
    BCC .loop 
    RTS 


MotherBrain_vs_Samus_CollisionDetection:
    LDA.L $7E7808 
    STA.B $1A 
    LSR.B $1A 
    BCC .checkBrain 
    LDA.W $0F7A 
    STA.B $12 
    LDA.W $0F7E 
    STA.B $14 
    LDX.W #HitboxDefinitions_MotherBrainBody 
    JSR.W MotherBrainPart_vs_Samus_CollisionDetection 
    BCS .return 

.checkBrain:
    LSR.B $1A 
    BCC .checkNeck 
    LDA.W $0FBA 
    STA.B $12 
    LDA.W $0FBE 
    STA.B $14 
    LDX.W #HitboxDefinitions_MotherBrainHead 
    JSR.W MotherBrainPart_vs_Samus_CollisionDetection 
    BCS .return 

.checkNeck:
    LSR.B $1A 
    BCC .return 
    LDA.L $7E804A 
    STA.B $12 
    LDA.L $7E804C 
    STA.B $14 
    LDX.W #HitboxDefinitions_MotherBrainNeck 
    JSR.W MotherBrainPart_vs_Samus_CollisionDetection 
    BCS .return 
    LDA.L $7E8050 
    STA.B $12 
    LDA.L $7E8052 
    STA.B $14 
    LDX.W #HitboxDefinitions_MotherBrainNeck 
    JSR.W MotherBrainPart_vs_Samus_CollisionDetection 
    BCS .return 
    LDA.L $7E8056 
    STA.B $12 
    LDA.L $7E8058 
    STA.B $14 
    LDX.W #HitboxDefinitions_MotherBrainNeck 
    JSR.W MotherBrainPart_vs_Samus_CollisionDetection 

.return:
    RTS 


HitboxDefinitions_MotherBrainBody:
    dw $0002,$FFE0,$FFE8,$002A,$0038,$FFE8,$FFD6,$001C 
    dw $FFE7 

HitboxDefinitions_MotherBrainHead:
    dw $0002,$FFE8,$FFEA,$0016,$0000,$FFEA,$0001,$0010 
    dw $0014 

HitboxDefinitions_MotherBrainNeck:
    dw $0001,$FFF8,$FFF8,$0008,$0008 

MotherBrainPart_vs_Samus_CollisionDetection:
    LDA.W $0000,X 
    BEQ .returnNoCollision 
    STA.B $16 
    INX 
    INX 

.loop:
    LDA.W $0AFA 
    SEC 
    SBC.B $14 
    BPL .SamusBelowHitbox 
    EOR.W #$FFFF 
    INC A 
    STA.B $18 
    LDA.W $0002,X 
    BRA + 


.SamusBelowHitbox:
    STA.B $18 
    LDA.W $0006,X 

  + BPL + 
    EOR.W #$FFFF 
    INC A 

  + CLC 
    ADC.W $0B00 
    SEC 
    SBC.B $18 
    BMI .next 
    LDA.W $0AF6 
    SEC 
    SBC.B $12 
    BPL .SamusRightOfHitbox 
    EOR.W #$FFFF 
    INC A 
    STA.B $18 
    LDA.W $0000,X 
    BRA + 


.SamusRightOfHitbox:
    STA.B $18 
    LDA.W $0004,X 

  + BPL + 
    EOR.W #$FFFF 
    INC A 

  + CLC 
    ADC.W $0AFE 
    SEC 
    SBC.B $18 
    BPL .hit 

.next:
    DEC.B $16 
    BEQ .returnNoCollision 
    TXA 
    CLC 
    ADC.W #$0008 
    TAX 
    JMP.W .loop 


.returnNoCollision:
    CLC 
    RTS 


.hit:
    CMP.W #$0004 
    BPL .min4 
    LDA.W #$0004 

.min4:
    STA.W $0B58 
    LDA.W #$0004 
    STA.W $0B5C 
    STZ.W $0B56 
    STZ.W $0B5A 
    LDA.W #$0060 
    STA.W $18A8 
    LDA.W #$0005 
    STA.W $18AA 
    LDA.W #$0001 
    STA.W $0A54 
    LDA.W $0AFA 
    CMP.W #$00C0 
    BPL .SamusInAir 
    LDA.W #$0002 
    STA.W $0B36 

.SamusInAir:
    LDA.W $0F7A 
    CLC 
    ADC.W #$0018 
    CMP.W $0AF6 
    BPL .returnCollision 
    JSR.W HurtSamus_A9B5E1 

.returnCollision:
    SEC 
    RTS 


EnemyShot_MotherBrainBody:
    JML.L CreateADudShot 


EnemyShot_MotherBrainHead:
    LDA.L $7E7800 
    BNE .notFirstPhase 
    LDA.W $18A6 
    ASL A 
    TAY 
    LDA.W $0C19,Y 
    AND.W #$0007 
    TAY 
    LDA.W .projectileType,Y 
    AND.W #$00FF 
    BEQ .return 
    LDX.W #$004E 
    CLC 
    ADC.W $1DC7,X 
    STA.W $1DC7,X 
    LDA.W #$006E 
    JSL.L QueueSound_Lib2_Max6 
    LDY.W #$000D 
    LDA.W $0FDC 
    BEQ + 
    LSR A 
    BCC + 
    INY 

  + STY.W $0FDC 
    JSL.L NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External 

.return:
    RTL 


.projectileType:
    db $00,$01,$01,$00,$00,$00,$00,$00 

.notFirstPhase:
    JSR.W MotherBrainShotReaction_Phase2_3 
    LDA.L $7E7800 
    CMP.W #$0001 
    BNE .gotoNormalShotAI 
    JML.L CreateADudShot 


.gotoNormalShotAI:
    JML.L NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External 


MotherBrainShotReaction_Phase2_3:
    LDA.L $7E7800 
    CMP.W #$0004 
    BNE .notBeam 
    JSR.W DetermineMotherBrainShotReactionType 
    CMP.W #$0002 
    BNE .notBeam 
    JMP.W MotherBrainBeamShotReaction_Phase3 


.notBeam:
    JSR.W DetermineMotherBrainShotReactionType 
    DEC A 
    BEQ .superMissile 
    LDA.L $7E780E 
    SEC 
    SBC.W #$0100 
    BPL .done 

.superMissile:
    LDA.W #$0000 

.done:
    STA.L $7E780E 
    RTS 


DetermineMotherBrainShotReactionType:
    LDA.W $18A6 
    ASL A 
    TAY 
    LDA.W $0C19,Y 
    AND.W #$0007 
    TAY 
    LDA.W .projectileTypes,Y 
    AND.W #$00FF 
    RTS 


.projectileTypes:
    db $02,$01,$01,$00,$00,$00,$00,$00 

MotherBrainBeamShotReaction_Phase3:
    LDA.L $7E780E 
    SEC 
    SBC.W #$010A 
    BPL .maxCounter 
    LDA.W #Function_MotherBrainNeck_SetupHyperBeamRecoil 
    STA.L $7E7870 
    LDA.W #$0000 
    STA.W $0FB2 

.maxCounter:
    STA.L $7E780E 
    RTS 


RTL_A9B5C5:
    RTL 


EnemyTouch_MotherBrainHead:
    LDA.W $0A1F 
    AND.W #$00FF 
    CMP.W #$0003 
    BNE .return 
    LDY.W #$000D 
    LDA.W $0FDC 
    BEQ + 
    LSR A 
    BCC + 
    INY 

  + STY.W $0FDC 

.return:
    RTL 


HurtSamus_A9B5E1:
    JSL.L DealSuitAdjustedEnemyDamageToSamus 
    LDA.W #$0060 
    STA.W $18A8 
    LDA.W #$0005 
    STA.W $18AA 
    LDY.W #$0000 
    LDX.W $0E54 
    LDA.W $0AF6 
    SEC 
    SBC.W $0F7A,X 
    BMI .left 
    INY 

.left:
    STY.W $0A54 
    RTS 


Function_MotherBrainBody_Phase2_Thinking:
    LDA.W $0FCC 
    BNE .notDead 
    LDA.W #Function_MotherBrainBody_Phase2_FiringRainbowBeam_ExtendNeck 
    STA.W $0FA8 
    JMP.W Function_MotherBrainBody_Phase2_FiringRainbowBeam_ExtendNeck 


.notDead:
    LDA.L $7E7804 
    BEQ .standing 
    RTS 


.standing:
    LDA.W $0FCC 
    CMP.W #$1194 
    BMI .lowHealth 
    LDA.W $05E5 
    CMP.W #$1000 
    BCC .tryAttack 
    JMP.W HandleMotherBrainWalking 


.tryAttack:
    LDA.W #Function_MotherBrainBody_Phase2_TryAttack 
    STA.W $0FA8 
    RTS 


.lowHealth:
    LDA.W $05E5 
    CMP.W #$2000 
    BCS + 
    JMP.W HandleMotherBrainWalking 


  + CMP.W #$A000 
    BCS .tryAttack 
    LDA.W #Function_MotherBrainBody_Phase2_FiringDeathBeam 
    STA.W $0FA8 
    RTS 


Function_MotherBrainBody_Phase2_TryAttack:
    LDA.L $7E7830 
    ASL A 
    TAX 
    JMP.W (.pointers,X) 


.pointers:
    dw TryMotherBrainAttack_Phase2_TryAttack 
    dw TryMotherBrainPhase2Attack_Cooldown 
    dw TryMotherBrainPhase2Attack_EndAttack 

TryMotherBrainAttack_Phase2_TryAttack:
    LDA.W #$0040 
    STA.W $0FB4 
    LDA.L $7E7830 
    INC A 
    STA.L $7E7830 
    JSR.W DecideMotherBrainPhase2AttackStrategy 
    LDX.W #.default 
    LDA.W $0FBE 
    CLC 
    ADC.W #$0004 
    SEC 
    SBC.W $0AFA 
    BPL + 
    EOR.W #$FFFF 
    INC A 

  + CMP.W #$0020 
    BCS .SamusFar 
    LDX.W #.SamusClose 

.SamusFar:
    SEP #$20 
    LDY.W #$0000 
    LDA.W $05E5 
    CMP.W $0000,X 
    BCC + 
    INY 
    INY 
    CMP.W $0001,X 
    BCC + 
    INY 
    INY 
    CMP.W $0002,X 
    BCC + 
    INY 
    INY 

  + TYX 
    REP #$20 
    LDA.W .instListPointers,X 
    CMP.W #InstList_MotherBrainHead_Attacking_Bomb_Phase2 
    BEQ .bomb 
    CMP.W #InstList_MotherBrainHead_Attacking_Laser 
    BEQ .laser 
    JSR.W SetMotherBrainHeadInstList 

.return:
    RTS 


.bomb:
    LDA.L $7E784A 
    CMP.W #$0001 
    BPL .return 
    LDA.W #Function_MotherBrainBody_FiringBomb_DecideOnWalking 
    STA.W $0FA8 
    JMP.W Function_MotherBrainBody_FiringBomb_DecideOnWalking 


.laser:
    LDA.W #Function_MBBody_Phase2_FiringLaser_PositionHeadQuickly 
    STA.W $0FA8 
    JMP.W Function_MBBody_Phase2_FiringLaser_PositionHeadQuickly 


.instListPointers:
    dw InstList_MotherBrainHead_Neutral_Phase2_0 
    dw InstList_MotherBrainHead_Attacking_4OnionRings_Phase2 
    dw InstList_MotherBrainHead_Attacking_Laser 
    dw InstList_MotherBrainHead_Attacking_Bomb_Phase2 

.default:
    db $40,$80,$C0 

.SamusClose:
    db $10,$20,$D0 

DecideMotherBrainPhase2AttackStrategy:
    LDA.W $0A1F 
    AND.W #$00FF 
    ASL A 
    TAX 
    LDA.W .poses,X 
    BNE .aimAtGround 
    LDA.W $05E5 
    AND.W #$00FF 
    CMP.W #$0080 
    BMI .callersReturn 
    LDA.W #InstList_MotherBrainHead_Attacking_4OnionRings_Phase2 
    JSR.W SetMotherBrainHeadInstList 
    PLA 
    RTS 


.callersReturn:
    PLA 
    LDA.W #Function_MBBody_Phase2_FiringLaser_PositionHeadQuickly 
    STA.W $0FA8 
    JMP.W Function_MBBody_Phase2_FiringLaser_PositionHeadQuickly 


.aimAtGround:
    LDA.W $05E5 
    AND.W #$00FF 
    CMP.W #$0080 
    BPL + 
    RTS 


  + LDA.L $7E784A 
    CMP.W #$0001 
    BPL .return 
    LDA.W #Function_MotherBrainBody_FiringBomb_DecideOnWalking 
    STA.W $0FA8 
    PLA 
    JMP.W Function_MotherBrainBody_FiringBomb_DecideOnWalking 


.return:
    RTS 


.poses:
    dw $FFFF,$FFEF,$0000,$0000,$FFFF,$FFFF,$0000,$FFFF 
    dw $0000,$0000,$FFFF,$0000,$0000,$0000,$FFEF,$FFFF 
    dw $FFFF,$FFFF,$0000,$0000,$0000,$FFEF,$FFFF,$FFFF 
    dw $FFFF,$FFFF,$FFFF,$FFFF 

TryMotherBrainPhase2Attack_Cooldown:
    DEC.W $0FB4 
    BNE .return 
    LDA.L $7E7830 
    INC A 
    STA.L $7E7830 

.return:
    RTS 


TryMotherBrainPhase2Attack_EndAttack:
    LDA.W #$0000 
    STA.L $7E7830 
    LDA.W #Function_MotherBrainBody_Phase2_Thinking 
    STA.W $0FA8 
    RTS 


Function_MotherBrainBody_FiringBomb_DecideOnWalking:
    LDA.W $05E5 
    CMP.W #$FF80 
    BCS MotherBrainFiringBomb_DecideOnCrouching 
    LDX.W #$0040 
    CMP.W #$6000 
    BCS + 
    LDX.W #$0060 

  + TXA 
    CMP.W $0F7A 
    BPL MotherBrainFiringBomb_DecideOnCrouching 
    STA.W $0FB2 
    LDY.W #$0006 
    JSR.W MakeMotherBrainWalkBackwards 
    BCS MotherBrainFiringBomb_DecideOnCrouching 
    LDA.W #Function_MotherBrainBody_FiringBomb_WalkingBackwards 
    STA.W $0FA8 

Function_MotherBrainBody_FiringBomb_DecideOnWalking_return:
    RTS 


Function_MotherBrainBody_FiringBomb_WalkingBackwards:
    LDY.W #$0006 
    LDA.W $0FB2 
    JSR.W MakeMotherBrainWalkBackwards 
    BCC Function_MotherBrainBody_FiringBomb_DecideOnWalking_return 

MotherBrainFiringBomb_DecideOnCrouching:
    JSL.L GenerateRandomNumber 
    CMP.W #$8000 
    BCC MotherBrainFiringBomb_FireBomb 
    LDA.W #Function_MotherBrainBody_FiringBomb_Crouch 
    STA.W $0FA8 

Function_MotherBrainBody_FiringBomb_Crouch:
    JSR.W MakeMotherBrainCrouch 
    BCC Function_MotherBrainBody_FiringBomb_DecideOnWalking_return 

MotherBrainFiringBomb_FireBomb:
    LDY.W #InstList_MotherBrainHead_Attacking_Bomb_Phase2 
    LDA.L $7E783E 
    BEQ .notCorpse 
    LDY.W #InstList_MotherBrainHead_Attacking_Bomb_Phase3 

.notCorpse:
    TYA 
    JSR.W SetMotherBrainHeadInstList 
    LDA.W #Function_MotherBrainBody_FiringBomb_FiredBomb 
    STA.W $0FA8 
    LDA.W #$002C 
    STA.W $0FB2 
    RTS 


Function_MotherBrainBody_FiringBomb_FiredBomb:
    DEC.W $0FB2 
    BPL MotherBrainFiringBomb_FinishFiringBomb_return 
    JSR.W MakeMotherBrainStandUp 
    BCS MotherBrainFiringBomb_FinishFiringBomb 
    LDA.W #Function_MotherBrainBody_FiringBomb_StandUp 
    STA.W $0FA8 

Function_MotherBrainBody_FiringBomb_StandUp:
    JSR.W MakeMotherBrainStandUp 
    BCC MotherBrainFiringBomb_FinishFiringBomb_return 

MotherBrainFiringBomb_FinishFiringBomb:
    LDY.W #Function_MotherBrainBody_Phase2_Thinking 
    LDA.L $7E783E 
    BEQ .notCorpse 
    LDY.W #Function_MotherBrainBody_Phase2_KillBabyMetroid_Attack 

.notCorpse:
    TYA 
    STA.W $0FA8 

MotherBrainFiringBomb_FinishFiringBomb_return:
    RTS 


Function_MBBody_Phase2_FiringLaser_PositionHeadQuickly:
    LDX.W #$0008 
    LDA.W $0FBE 
    CMP.W $0AFA 
    BPL + 
    LDX.W #$0006 

  + TXA 
    STA.L $7E8064 
    STA.L $7E8066 
    LDA.W #$0200 
    STA.L $7E8068 
    LDA.W #Function_MBBody_Phase2_FiringLaser_PositionHeadSlowlyAndFire 
    STA.W $0FA8 
    LDA.W #$0004 
    STA.W $0FB2 
    RTS 


Function_MBBody_Phase2_FiringLaser_PositionHeadSlowlyAndFire:
    DEC.W $0FB2 
    BMI .timerExpired 
    RTS 


.timerExpired:
    LDY.W #$0100 
    LDA.L $7E8068 
    BPL + 
    LDY.W #$FF00 

  + TYA 
    STA.L $7E8068 
    LDA.W #InstList_MotherBrainHead_Attacking_Laser 
    JSR.W SetMotherBrainHeadInstList 
    LDA.W #Function_MotherBrainBody_Phase2_FiringLaser_FinishAttack 
    STA.W $0FA8 
    LDA.W #$0010 
    STA.W $0FB2 
    RTS 


Function_MotherBrainBody_Phase2_FiringLaser_FinishAttack:
    DEC.W $0FB2 
    BMI .timerExpired 
    RTS 


.timerExpired:
    LDA.W #$0004 
    STA.L $7E8064 
    STA.L $7E8066 
    LDA.W #Function_MotherBrainBody_Phase2_Thinking 
    STA.W $0FA8 
    JMP.W Function_MotherBrainBody_Phase2_Thinking 


Function_MotherBrainBody_Phase2_FiringDeathBeam:
    LDA.L $7E782E 
    ASL A 
    TAX 
    JSR.W (.pointers,X) 
    RTS 


.pointers:
    dw MotherBrainPhase2_FiringDeathBeam_BackUp 
    dw MotherBrainPhase2_FiringDeathBeam_WaitForAnyActiveBombs 
    dw RTS_A9B8C8 
    dw MotherBrainPhase2_FiringDeathBeam_Finish 

MotherBrainPhase2_FiringDeathBeam_BackUp:
    LDY.W #$0008 
    LDA.W #$0028 
    JSR.W MakeMotherBrainWalkBackwards 
    BCC .return 
    LDA.W #$0008 
    STA.L $7E8064 
    LDA.W #$0006 
    STA.L $7E8066 
    LDA.L $7E782E 
    INC A 
    STA.L $7E782E 

.return:
    RTS 


MotherBrainPhase2_FiringDeathBeam_WaitForAnyActiveBombs:
    LDA.L $7E784A 
    BNE .return 
    LDA.W #InstList_MotherBrainBody_DeathBeamMode 
    JSR.W SetMotherBrainBodyInstList 
    LDA.L $7E782E 
    INC A 
    STA.L $7E782E 

.return:
    RTS 


RTS_A9B8C8:
    RTS 


MotherBrainPhase2_FiringDeathBeam_Finish:
    LDA.W #InstList_MotherBrainHead_Neutral_Phase2_0 
    JSR.W SetMotherBrainHeadInstList 
    LDA.W #$0002 
    STA.L $7E8064 
    LDA.W #$0004 
    STA.L $7E8066 
    LDA.W #$0000 
    STA.L $7E782E 
    LDA.W #Function_MotherBrainBody_Phase2_Thinking 
    STA.W $0FA8 
    RTS 


Function_MotherBrainBody_Phase2_FiringRainbowBeam_ExtendNeck:
    LDA.W #InstList_MotherBrainHead_Neutral_Phase2_0 
    JSR.W SetMotherBrainHeadInstList 
    LDA.W #$0040 
    STA.L $7E8068 
    LDA.W #$0001 
    STA.L $7E8062 
    LDA.W #$0002 
    STA.L $7E8064 
    LDA.W #$0004 
    STA.L $7E8066 
    LDA.W #Function_MBBody_Phase2_FiringRainbowBeam_StartCharging 
    STA.W $0FA8 
    LDA.W #$0100 
    STA.W $0FB2 

Function_MotherBrainBody_Phase2_FiringRainbowBeam_return:
    RTS 


Function_MBBody_Phase2_FiringRainbowBeam_StartCharging:
    DEC.W $0FB2 
    BPL Function_MotherBrainBody_Phase2_FiringRainbowBeam_return 
    LDA.W #InstList_MotherBrainHead_ChargingRainbowBeam_0 
    JSR.W SetMotherBrainHeadInstList 
    LDA.W #Function_MotherBrainBody_Phase2_FiringRainbowBeam_RetractNeck 
    STA.W $0FA8 ; fallthrough to Function_MotherBrainBody_Phase2_FiringRainbowBeam_RetractNeck

Function_MotherBrainBody_Phase2_FiringRainbowBeam_RetractNeck:
    LDA.W #$0028 
    JSR.W MakeMBWalkBackwardsReallySlowTowardsXPositionInA_RetractHead 
    BCC Function_MotherBrainBody_Phase2_FiringRainbowBeam_return 
    LDA.W #Function_MBBody_Phase2_FiringRainbowBeam_WaitForBeamToCharge 
    STA.W $0FA8 
    LDA.W #$0100 
    STA.W $0FB2 ; fallthrough to Function_MBBody_Phase2_FiringRainbowBeam_WaitForBeamToCharge

Function_MBBody_Phase2_FiringRainbowBeam_WaitForBeamToCharge:
    DEC.W $0FB2 
    BPL Function_MotherBrainBody_Phase2_FiringRainbowBeam_return 
    LDA.W #$0071 
    JSL.L QueueSound_Lib2_Max6 
    LDA.W #Function_MBBody_Phase2_FiringRainbowBeam_ExtendNeckDown 
    STA.W $0FA8 ; fallthrough to Function_MBBody_Phase2_FiringRainbowBeam_ExtendNeckDown

Function_MBBody_Phase2_FiringRainbowBeam_ExtendNeckDown:
    LDA.W #$0008 
    STA.W $0CCC 
    LDA.W #$0006 
    STA.L $7E8064 
    STA.L $7E8066 
    LDA.W #$0500 
    STA.L $7E8068 
    LDA.W #Function_MBBody_Phase2_FiringRainbowBeam_StartFiringRainbowBeam 
    STA.W $0FA8 
    LDA.W #$0010 
    STA.W $0FB2 ; fallthough to Function_MBBody_Phase2_FiringRainbowBeam_StartFiringRainbowBeam

Function_MBBody_Phase2_FiringRainbowBeam_StartFiringRainbowBeam:
    JSR.W AimMotherBrainRainbowBeam_IncreaseWidth 
    LDA.W $0CEE 
    BNE .return 
    DEC.W $0FB2 
    BMI .timerExpired 

.return:
    RTS 


.timerExpired:
    LDA.W $0CEE 
    BNE .return ; >_<
    STZ.W $0CCC 
    JSR.W ResetMotherBrainBodyRainbowBeamPaletteAnimationIndex 
    LDA.W #InstList_MotherBrainHead_FiringRainbowBeam 
    JSR.W SetMotherBrainHeadInstList 
    LDA.W #$0200 
    STA.L $7E8026 
    JSL.L Spawn_MotherBrainRainbowBeam_HDMAObject 
    STA.L $7E7812 
    LDA.W #$0040 
    STA.L $7E8068 
    LDA.W #$0001 
    STA.L $7E8062 
    LDA.W #$0002 
    STA.L $7E8064 
    LDA.W #$0004 
    STA.L $7E8066 
    STZ.W $0FB4 
    STZ.W $0FB6 
    LDA.W #$0005 
    LDY.W $09C2 
    CPY.W #$02BC 
    BPL .greaterThan2BC 
    LDA.W #$0018 

.greaterThan2BC:
    JSL.L Run_Samus_Command 
    LDA.W #$0006 
    STA.L $7E782A 
    LDA.W #Function_MBBody_Phase2_FiringRainbowBeam_MoveSamusTowardWall 
    STA.W $0FA8 
    RTS 


Function_MBBody_Phase2_FiringRainbowBeam_MoveSamusTowardWall:
    JSR.W PlayMotherBrainRainbowBeamSFX 
    JSR.W HandleMotherBrainBodyRainbowBeamPalette 
    JSR.W AimMotherBrainRainbowBeam_IncreaseWidth 
    JSR.W HandleMotherBrainRainbowBeamExplosions 
    JSR.W MoveSamusTowardsWallDueToRainbowBeam 
    BCC .return 
    LDA.W #Function_MBBody_Phase2_FiringRainbowBeam_1FrameDelay 
    STA.W $0FA8 
    STZ.W $0FB2 

.return:
    RTS 


Function_MBBody_Phase2_FiringRainbowBeam_1FrameDelay:
    JSR.W PlayMotherBrainRainbowBeamSFX 
    JSR.W HandleMotherBrainBodyRainbowBeamPalette 
    JSR.W AimMotherBrainRainbowBeam_IncreaseWidth 
    JSR.W HandleMotherBrainRainbowBeamExplosions 
    JSR.W MoveSamusTowardsWallDueToRainbowBeam 
    DEC.W $0FB2 
    BPL .return 
    LDA.W #$0008 
    STA.W $183E 
    LDA.W #$0008 
    STA.W $1840 
    LDA.W #Function_MBBody_Phase2_FiringRainbowBeam_StartDrainingSamus 
    STA.W $0FA8 

.return:
    RTS 


Function_MBBody_Phase2_FiringRainbowBeam_StartDrainingSamus:
    LDA.W #Function_MBBody_Phase2_FiringRainbowBeam_DrainingSamus 
    STA.W $0FA8 
    LDA.W #$012B 
    STA.W $0FB2 
    STA.W $1840 
    LDA.W #$0008 
    STA.W $183E ; fallthough to Function_MBBody_Phase2_FiringRainbowBeam_DrainingSamus

Function_MBBody_Phase2_FiringRainbowBeam_DrainingSamus:
    JSR.W PlayMotherBrainRainbowBeamSFX 
    JSR.W HandleMotherBrainBodyRainbowBeamPalette 
    JSR.W AimMotherBrainRainbowBeam_IncreaseWidth 
    JSR.W HandleMotherBrainRainbowBeamExplosions 
    JSL.L DamageSamusDueToRainbowBeam 
    JSR.W DecrementAmmoDueToRainbowBeam 
    JSR.W MoveSamusTowardsMiddleOfWall 
    DEC.W $0FB2 
    BPL Function_MBBody_Phase2_FiringRainbowBeam_FinishFiring_return 
    LDA.W #Function_MBBody_Phase2_FiringRainbowBeam_FinishFiring 
    STA.W $0FA8 
    RTS 


Function_MBBody_Phase2_FiringRainbowBeam_FinishFiring:
    JSR.W PlayMotherBrainRainbowBeamSFX 
    JSR.W HandleMotherBrainBodyRainbowBeamPalette 
    JSR.W AimMotherBrainRainbowBeam 
    JSR.W HandleMotherBrainRainbowBeamExplosions 
    LDA.L $7E8026 
    SEC 
    SBC.W #$0180 
    STA.L $7E8026 
    CMP.W #$0200 
    BPL Function_MBBody_Phase2_FiringRainbowBeam_FinishFiring_return 
    LDA.W #$0200 
    STA.L $7E8026 
    LDA.W #$FF00 
    STA.W $0FB4 
    STZ.W $0FB6 
    LDA.L $7E7812 
    TAX 
    STZ.W $18B4,X 
    STZ.W $1840 
    LDA.W #InstList_MotherBrainHead_Neutral_Phase2_0 
    JSR.W SetMotherBrainHeadInstList 
    JSR.W SetupMotherBrainHeadNormalPalette 
    JSR.W WriteMotherBrainDefaultPalette 
    LDA.W #$0002 
    JSL.L QueueSound_Lib1_Max6 
    LDA.W #$0000 
    STA.L $7E782C 
    LDA.W #$0001 
    JSL.L Run_Samus_Command 
    LDA.W #$0008 
    STA.W $0CCC 
    LDA.W #Function_MBBody_Phase2_FiringRainbowBeam_LetSamusFall 
    STA.W $0FA8 

Function_MBBody_Phase2_FiringRainbowBeam_FinishFiring_return:
    RTS 


Function_MBBody_Phase2_FiringRainbowBeam_LetSamusFall:
    LDA.W #$0000 
    JSL.L DrainedSamusController 
    LDA.W #Function_MBBody_Phase2_FiringRainbowBeam_WaitForSamusToLand 
    STA.W $0FA8 

Function_MBBody_Phase2_FiringRainbowBeam_WaitForSamusToLand:
    JSR.W MoveSamusForFallingAfterRainbowBeam 
    BCC .return 
    LDA.W #Function_MBBody_Phase2_FiringRainbowBeam_LowerHead 
    STA.W $0FA8 

.return:
    RTS 


Function_MBBody_Phase2_FiringRainbowBeam_LowerHead:
    LDA.W #$0040 
    STA.L $7E8068 
    LDA.W #$0001 
    STA.L $7E8062 
    LDA.W #$0002 
    STA.L $7E8064 
    LDA.W #$0004 
    STA.L $7E8066 
    LDA.W #Function_MBBody_Phase2_FiringRainbowBeam_DecideNextAction 
    STA.W $0FA8 
    LDA.W #$0080 
    STA.W $0FB2 

Function_MBBody_Phase2_FiringRainbowBeam_LowerHead_return:
    RTS 


Function_MBBody_Phase2_FiringRainbowBeam_DecideNextAction:
    DEC.W $0FB2 
    BPL Function_MBBody_Phase2_FiringRainbowBeam_LowerHead_return 
    LDA.W $09C2 
    CMP.W #$0190 
    BMI .lessThan190 
    LDA.W #Function_MotherBrainBody_Phase2_FiringRainbowBeam_ExtendNeck 
    STA.W $0FA8 
    RTS 


.lessThan190:
    LDY.W #$000A 
    LDA.W $0F7A 
    CLC 
    ADC.W #$0010 
    JSR.W MakeMotherBrainWalkForwards 
    LDA.W #Function_MBBody_Phase2_FinishSamusOff_GetSamusToLowEnergy 
    STA.W $0FA8 
    RTS 


PlayMotherBrainRainbowBeamSFX:
    LDA.L $7E782A 
    BMI .return 
    DEC A 
    STA.L $7E782A 
    LDA.W #$0040 
    JSL.L QueueSound_Lib1_Max6 
    LDA.W #$0001 
    STA.L $7E782C 

.return:
    RTS 


MakeMBWalkBackwardsReallySlowTowardsXPositionInA_RetractHead:
    LDY.W #$000A 
    JSR.W MakeMotherBrainWalkBackwards 
    BCS RetractMotherBrainsHead 
    RTS 


RetractMotherBrainsHead:
    LDA.W #$0050 
    STA.L $7E8068 
    LDA.W #$0001 
    STA.L $7E8062 
    LDA.W #$0008 
    STA.L $7E8064 
    LDA.W #$0006 
    STA.L $7E8066 
    RTS 


AimMotherBrainRainbowBeam_IncreaseWidth:
    LDA.L $7E8026 
    CLC 
    ADC.W #$0180 
    CMP.W #$0C00 
    BMI + 
    LDA.W #$0C00 

  + STA.L $7E8026 

AimMotherBrainRainbowBeam:
    LDA.W $0AF6 
    SEC 
    SBC.W $0FBA 
    SEC 
    SBC.W #$0010 
    STA.B $12 
    LDA.W $0AFA 
    SEC 
    SBC.W $0FBE 
    SEC 
    SBC.W #$0004 
    STA.B $14 
    JSL.L CalculateAngleOf_12_14_Offset 
    SEC 
    SBC.W #$0080 
    EOR.W #$FFFF 
    INC A 
    AND.W #$00FF 
    STA.L $7E8022 
    RTS 


CalculateMotherBrainRainbowBeamHDMATables_long:
    JSL.L Calculate_MotherBrain_RainbowBeam_HDMATables 
    RTS 


MoveSamusTowardsWallDueToRainbowBeam:
    LDA.W #$1000 
    JSR.W MoveSamusHorizontallyTowardsWall 
    BCS .return 
    LDA.L $7E8022 
    STA.B $12 
    LDA.W #$1000 
    JSL.L Math_86C272 
    JSR.W MoveSamusVerticallyTowardsCeilingFloor 
    CLC 

.return:
    RTS 


MoveSamusTowardsMiddleOfWall:
    LDA.W #$0040 
    LDY.W #$007C 
    CPY.W $0AFA 
    BPL .lessThanEqualTo7C 
    EOR.W #$FFFF 
    INC A 

.lessThanEqualTo7C:
    JMP.W MoveSamusVerticallyTowardsCeilingFloor 


MoveSamusForFallingAfterRainbowBeam:
    LDA.W $0FB4 
    CLC 
    ADC.W #$0002 
    BMI + 
    LDA.W #$0000 

  + STA.W $0FB4 
    JSR.W MoveSamusHorizontallyTowardsWall 
    LDA.W $0FB6 
    CLC 
    ADC.W #$0018 
    STA.W $0FB6 ; fallthrough to MoveSamusVerticallyTowardsCeilingFloor

MoveSamusVerticallyTowardsCeilingFloor:
    SEP #$20 
    CLC 
    ADC.W $0AFD 
    STA.W $0AFD 
    STA.W $0B17 
    REP #$20 
    AND.W #$FF00 
    XBA 
    BPL + 
    ORA.W #$FF00 

  + ADC.W $0AFA 
    CMP.W #$0030 
    BMI .load30 
    CMP.W #$00C0 
    BPL .loadC0 
    STA.W $0AFA 
    STA.W $0B14 
    CLC 
    RTS 


.load30:
    LDA.W #$0030 
    BRA + 


.loadC0:
    LDA.W #$00C0 

  + STA.W $0AFA 
    STA.W $0B14 
    STZ.W $0AFC 
    STZ.W $0B16 
    SEC 
    RTS 


MoveSamusHorizontallyTowardsWall:
    SEP #$20 
    CLC 
    ADC.W $0AF9 
    STA.W $0AF9 
    STA.W $0B13 
    REP #$20 
    AND.W #$FF00 
    XBA 
    BPL + 
    ORA.W #$FF00 

  + ADC.W $0AF6 
    CMP.W #$00EB 
    BPL .greaterThanEqualToEB 
    STA.W $0AF6 
    STA.W $0B10 
    RTS 


.greaterThanEqualToEB:
    LDA.W #$00EB 
    STA.W $0AF6 
    STA.W $0B10 
    STZ.W $0AF8 
    STZ.W $0B12 
    SEC 
    RTS 


HandleMotherBrainRainbowBeamExplosions:
    DEC.W $0FB6 
    BMI .timerExpired 
    RTS 


.timerExpired:
    LDA.W #$0008 
    STA.W $0FB6 
    INC.W $0FB4 
    LDA.W $0FB4 
    AND.W #$0007 
    ASL A 
    TAX 
    LDA.W .data0,X 
    STA.B $12 
    LDA.W .data1,X 
    STA.B $14 
    LDY.W #EnemyProjectile_MotherBrainRainbowBeam_Explosion 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    LDA.W #$0024 
    JSL.L QueueSound_Lib2_Max6 
    RTS 


.data0:
    db $F8,$FF,$06,$00,$FC,$FF,$02,$00,$03,$00,$FA,$FF,$08,$00,$00,$00 

.data1:
    db $F9,$FF,$02,$00,$05,$00,$FC,$FF,$06,$00,$FE,$FF,$FA,$FF,$07,$00 

ResetMotherBrainBodyRainbowBeamPaletteAnimationIndex:
    LDA.W #$0000 
    STA.L $7E7842 
    RTS 


WriteMotherBrainDefaultPalette:
    LDY.W #Palette_MotherBrain+2 
    LDX.W #$0082 
    LDA.W #$000F 
    JSL.L WriteAColorsFromYtoColorIndexX 
    LDY.W #Palette_MotherBrain+2 
    LDX.W #$0122 
    LDA.W #$000F 
    JSL.L WriteAColorsFromYtoColorIndexX 
    LDY.W #Palette_MotherBrain_BackLeg+2 
    LDX.W #$0162 
    LDA.W #$000F 
    JSL.L WriteAColorsFromYtoColorIndexX 
    RTS 


WriteMotherBrainPhase2DeathPalette:
    LDA.L MotherBrainPhase2DeathBeforeGreyPalette_Pointers 
    TAY 
    BRA WriteMotherBrainPalette 


HandleMotherBrainBodyRainbowBeamPalette:
    LDA.W $0FA4 
    AND.W #$0002 
    BNE .loadIndex 
    RTS 


.loadIndex:
    LDA.L $7E7842 

.restart:
    TAX 
    LDA.L MotherBrainBodyRainbowBeamPalette_Pointers,X 
    BEQ .restart 
    INX 
    INX 
    TXA 
    STA.L $7E7842 
    LDA.L MotherBrainBodyRainbowBeamPalette_Pointers-2,X 
    TAY 

WriteMotherBrainPalette:
    PHB 
    PEA.W $AD00 
    PLB 
    PLB 
    PHY 
    LDX.W #$0082 
    LDA.W #$000F 
    JSL.L WriteAColorsFromYtoColorIndexX 
    PLY 
    LDX.W #$0122 
    LDA.W #$000F 
    JSL.L WriteAColorsFromYtoColorIndexX 
    LDX.W #$0162 
    LDA.W #$000F 
    JSL.L WriteAColorsFromYtoColorIndexX 
    PLB 
    RTS 


Function_MBBody_Phase2_FinishSamusOff_GetSamusToLowEnergy:
    LDA.W #$0050 
    JSL.L Suit_Damage_Division 
    ASL A 
    ASL A 
    ADC.W #$0014 
    CMP.W $09C2 
    BPL .done 
    LDA.W $05E5 
    AND.W #$0FFF 
    CMP.W #$0FA0 
    BCC .noAttack 
    LDA.W #$00A0 
    JSL.L Suit_Damage_Division 
    CLC 
    ADC.W #$0014 
    CMP.W $09C2 
    BPL .onionRings 
    LDY.W #InstList_MotherBrainHead_Attacking_Bomb_Phase2 
    LDA.W $05E5 
    AND.W #$0FFF 
    CMP.W #$0FF0 
    BCS .doAttack 

.onionRings:
    LDY.W #InstList_MotherBrainHead_Attacking_2OnionRings_Phase2 

.doAttack:
    TYA 
    JMP.W SetMotherBrainHeadInstList 


.noAttack:
    LDA.W $0FA4 
    AND.W #$001F 
    BNE .return 
    JMP.W MaybeMakeMotherBrainStandUpOrLeanDown 


.done:
    LDA.W #Function_MotherBrainBody_Phase2_FinishSamusOff_StandUp 
    STA.W $0FA8 

.return:
    RTS 


Function_MotherBrainBody_Phase2_FinishSamusOff_StandUp:
    JSR.W MakeMotherBrainStandUp 
    BCC Function_MBBody_Phase2_FinishSamusOff_LoadBabyMetroid_return 
    LDA.W #Function_MBBody_Phase2_FinishSamusOff_AdmireJobWellDone 
    STA.W $0FA8 
    LDA.W #$0010 
    STA.W $0FB2 ; fallthrough to Function_MBBody_Phase2_FinishSamusOff_AdmireJobWellDone

Function_MBBody_Phase2_FinishSamusOff_AdmireJobWellDone:
    DEC.W $0FB2 
    BPL Function_MBBody_Phase2_FinishSamusOff_LoadBabyMetroid_return 
    LDA.W #InstList_MotherBrainHead_Stretching_Phase2_0 
    JSR.W SetMotherBrainHeadInstList 
    LDA.W #Function_MBBody_Phase2_FinishSamusOff_ChargeFinalRainbowBeam 
    STA.W $0FA8 
    LDA.W #$0100 
    STA.W $0FB2 
    RTS 


Function_MBBody_Phase2_FinishSamusOff_ChargeFinalRainbowBeam:
    DEC.W $0FB2 
    BPL Function_MBBody_Phase2_FinishSamusOff_LoadBabyMetroid_return 
    LDA.W #InstList_MotherBrainHead_ChargingRainbowBeam_0 
    JSR.W SetMotherBrainHeadInstList 
    LDA.W #Function_MBBody_Phase2_FinishSamusOff_LoadBabyMetroid 
    STA.W $0FA8 ; fallthough to Function_MBBody_Phase2_FinishSamusOff_LoadBabyMetroid

Function_MBBody_Phase2_FinishSamusOff_LoadBabyMetroid:
    LDX.W #MotherBrainFightSpriteTileTransferEntries_babyMetroid 
    JSR.W ProcessSpriteTilesTransfers 
    BCC Function_MBBody_Phase2_FinishSamusOff_LoadBabyMetroid_return 
    JSR.W RetractMotherBrainsHead 
    JSR.W SpawnBabyMetroidCutscene 
    LDA.W #Function_MBBody_Phase2_FinishSamusOff_FireFinalRainbowBeam 
    STA.W $0FA8 
    LDA.W #$0100 
    STA.W $0FB2 

Function_MBBody_Phase2_FinishSamusOff_LoadBabyMetroid_return:
    RTS 


Function_MBBody_Phase2_FinishSamusOff_FireFinalRainbowBeam:
    DEC.W $0FB2 
    BPL Function_MBBody_Phase2_FinishSamusOff_LoadBabyMetroid_return 
    JSR.W ResetMotherBrainBodyRainbowBeamPaletteAnimationIndex 
    LDA.W #InstList_MotherBrainHead_FiringRainbowBeam 
    JSR.W SetMotherBrainHeadInstList 
    LDA.W #$0006 
    STA.L $7E8064 
    STA.L $7E8066 
    LDA.W #$0500 
    STA.L $7E8068 
    LDA.W #$0071 
    JSL.L QueueSound_Lib2_Max6 
    LDA.W #RTS_A9BE1A 
    STA.W $0FA8 

RTS_A9BE1A:
    RTS 


SpawnBabyMetroidCutscene:
    LDX.W #PopulationData_BabyMetroidCutscene 
    JSL.L SpawnEnemy 
    TXA 
    STA.L $7E7854 
    RTS 


PopulationData_BabyMetroidCutscene:
    dw EnemyHeaders_BabyMetroidCutscene 
    dw $0180,$0040 
    dw InstList_BabyMetroid_Initial 
    dw $2800,$0000,$0000,$0000 

Function_MotherBrainBody_DrainedByBabyMetroid_TakenAback:
    LDA.W #$0003 
    STA.L $7E7800 
    LDA.W #$0008 
    STA.L $7E8064 
    STA.L $7E8066 
    LDA.W #$0700 
    STA.L $7E8068 
    LDA.W #Function_MotherBrainBody_DrainedByBabyMetroid_RegainBalance 
    STA.W $0FA8 
    LDA.W #$0030 
    STA.W $0FB2 ; fallthrough to Function_MotherBrainBody_DrainedByBabyMetroid_RegainBalance

Function_MotherBrainBody_DrainedByBabyMetroid_RegainBalance:
    JSR.W HandleMotherBrainBodyRainbowBeamPalette 
    DEC.W $0FB2 
    BPL .return 
    LDA.W #Function_MBBody_DrainedByBabyMetroid_FiringRainbowBeam 
    STA.W $0FA8 
    LDA.W #Function_MotherBrainBody_PainfulWalking_WalkForwards 
    STA.L $7E7850 
    LDA.W #$0000 
    STA.L $7E784C 
    LDA.W #$0002 
    STA.L $7E784E 
    LDA.W #$0001 
    LDA.L $7E8062 
    LDA.W #$0002 
    STA.L $7E8064 
    LDA.W #$0004 
    STA.L $7E8066 

.return:
    RTS 


Function_MBBody_DrainedByBabyMetroid_FiringRainbowBeam:
    LDA.L $7E7840 
    BNE + 
    LDA.W #$0032 
    STA.L $7E7840 

  + JSR.W HandleMotherBrainBodyRainbowBeamPalette 
    LDA.L $7E7850 
    STA.B $12 
    PEA.W .manualReturn-1 
    JMP.W ($0012) 


.manualReturn:
    LDA.L $7E784C 
    ASL A 
    TAY 
    LDA.W .walkingAnimationDelays,Y 
    AND.W #$00FF 
    STA.L $7E784E 
    LDA.W .neckAngleDeltas,Y 
    STA.L $7E8068 
    LDA.L $7E784C 
    CMP.W #$0006 
    BNE .return 
    LDA.W #$0000 
    STA.L $7E782C 
    STA.L $7E7860 
    JSR.W WriteMotherBrainPhase2DeathPalette 
    LDA.W #$0002 
    JSL.L QueueSound_Lib1_Max6 
    LDA.W #Function_MBBody_DrainedByBabyMetroid_RainbowBeamHasRunOut 
    STA.W $0FA8 

.return:
    RTS 


.walkingAnimationDelays:
    dw $0002,$0002,$0006,$0006,$0008,$0008,$000A,$000A 

.neckAngleDeltas:
    dw $0500,$0500,$0200,$0200,$00C0,$00C0,$0040,$0040 

Function_MBBody_DrainedByBabyMetroid_RainbowBeamHasRunOut:
    LDA.L $7E7850 
    STA.B $12 
    PEA.W .manualReturn-1 
    JMP.W ($0012) 


.manualReturn:
    LDA.L $7E784C 
    CMP.W #$0008 
    BMI Function_MotherBrainBody_DrainedByBabyMetroid_return 
    LDA.W #$0040 
    STA.L $7E8068 
    LDA.W #$0008 
    STA.L $7E8064 
    STA.L $7E8066 
    LDA.W #InstList_MotherBrainHead_DyingDrool_0 
    JSR.W SetMotherBrainHeadInstList 
    LDA.W #Function_MBBody_DrainedByBabyMetroid_MoveToBackOfRoom 
    STA.W $0FA8 ; fallthrough to Function_MBBody_DrainedByBabyMetroid_MoveToBackOfRoom

Function_MBBody_DrainedByBabyMetroid_MoveToBackOfRoom:
    LDA.W #$0028 
    JSR.W MakeMotherBrainWalkBackwards 
    BCC Function_MotherBrainBody_DrainedByBabyMetroid_return 
    LDA.W #Function_MBBody_DrainedByBabyMetroid_GoIntoLowPowerMode 
    STA.W $0FA8 
    LDA.W #$0000 
    STA.L $7E8066 ; fallthrough to Function_MBBody_DrainedByBabyMetroid_GoIntoLowPowerMode

Function_MBBody_DrainedByBabyMetroid_GoIntoLowPowerMode:
    LDA.L $7E8064 
    ORA.L $7E8066 
    BNE Function_MotherBrainBody_DrainedByBabyMetroid_return 
    STA.L $7E7864 
    LDA.L $7E7804 
    BNE Function_MotherBrainBody_DrainedByBabyMetroid_return 
    LDA.W #InstList_MotherBrainBody_Crouch_Fast 
    JSR.W SetMotherBrainBodyInstList 
    LDA.W #Function_MBBody_DrainedByBabyMetroid_PrepareTransitionToGrey 
    STA.W $0FA8 
    LDA.W #$0040 
    STA.W $0FB2 

Function_MotherBrainBody_DrainedByBabyMetroid_return:
    RTS 


Function_MBBody_DrainedByBabyMetroid_PrepareTransitionToGrey:
    DEC.W $0FB2 
    BPL Function_MotherBrainBody_DrainedByBabyMetroid_return 
    LDA.W #$0000 
    STA.L $7E802E 
    LDA.W #Function_MBBody_DrainedByBabyMetroid_TransitionToGrey 
    STA.W $0FA8 
    LDA.W #$0010 
    STA.W $0FB2 

Function_MBBody_DrainedByBabyMetroid_TransitionToGrey:
    DEC.W $0FB2 
    BPL Function_MotherBrainBody_DrainedByBabyMetroid_return 
    LDA.W #$0010 
    STA.W $0FB2 
    LDA.L $7E802E 
    INC A 
    STA.L $7E802E 
    DEC A 
    JSL.L TransitionMotherBrainPaletteToGrey_DrainedByBabyMetroid 
    BCC Function_MotherBrainBody_DrainedByBabyMetroid_return 
    LDA.W #$8CA0 ; 36,000 HP
    STA.W $0FCC 
    LDA.W #$0001 
    STA.L $7E783E 
    DEC A 
    STA.L $7E7868 
    LDA.W #$0002 
    STA.L $7E7800 
    LDA.W #Function_MotherBrainBody_Phase2_ReviveSelf_InanimateGrey 
    STA.W $0FA8 
    RTS 


Function_MotherBrainBody_PainfulWalking_WalkForwards:
    LDA.L $7E784E 
    TAY 
    LDA.W #$0048 
    JSR.W MakeMotherBrainWalkForwards 
    BCC .return 
    LDA.W #Function_MotherBrainBody_PainfulWalking_WalkingForwards 
    STA.L $7E7850 
    JSR.W SetMotherBrainPainfulWalkingFunctionTimer 

.return:
    RTS 


Function_MotherBrainBody_PainfulWalking_WalkingForwards:
    LDA.L $7E7852 
    DEC A 
    STA.L $7E7852 
    BNE .return 
    LDA.L $7E784C 
    INC A 
    STA.L $7E784C 
    LDA.W #Function_MotherBrainBody_PainfulWalking_WalkBackwards 
    STA.L $7E7850 

.return:
    RTS 


Function_MotherBrainBody_PainfulWalking_WalkBackwards:
    LDA.L $7E784E 
    TAY 
    LDA.W #$0028 
    JSR.W MakeMotherBrainWalkBackwards 
    BCC .return 
    LDA.W #Function_MotherBrainBody_PainfulWalking_WalkingBackwards 
    STA.L $7E7850 
    JSR.W SetMotherBrainPainfulWalkingFunctionTimer 

.return:
    RTS 


Function_MotherBrainBody_PainfulWalking_WalkingBackwards:
    LDA.L $7E7852 
    DEC A 
    STA.L $7E7852 
    BNE .return 
    LDA.L $7E784C 
    INC A 
    STA.L $7E784C 
    LDA.W #Function_MotherBrainBody_PainfulWalking_WalkForwards 
    STA.L $7E7850 

.return:
    RTS 


SetMotherBrainPainfulWalkingFunctionTimer:
    LDA.L $7E784C 
    ASL A 
    TAY 
    LDA.W .timers,Y 
    AND.W #$00FF 
    STA.L $7E7852 
    RTS 


.timers:
    dw $0010,$0010,$0020,$0020,$0030,$0030,$0040,$0040 

Function_MotherBrainBody_Phase2_ReviveSelf_InanimateGrey:
    LDA.W #Function_MotherBrainBody_Phase2_ReviveSelf_ShowSignsOfLife 
    STA.W $0FA8 
    LDA.W #$0300 
    STA.W $0FB2 

Function_MotherBrainBody_Phase2_ReviveSelf_return:
    RTS 


Function_MotherBrainBody_Phase2_ReviveSelf_ShowSignsOfLife:
    DEC.W $0FB2 
    BPL Function_MotherBrainBody_Phase2_ReviveSelf_return 
    LDA.W #$0001 
    STA.L $7E7868 
    STA.L $7E7864 
    LDA.W #Function_MBBody_Phase2_ReviveSelf_PrepareTransitionToGrey 
    STA.W $0FA8 
    LDA.W #$00E0 
    STA.W $0FB2 ; fallthrough to Function_MBBody_Phase2_ReviveSelf_PrepareTransitionToGrey

Function_MBBody_Phase2_ReviveSelf_PrepareTransitionToGrey:
    LDA.W #Function_MBBody_Phase2_ReviveSelf_TransitionFromGrey 
    STA.W $0FA8 
    LDA.W #$0000 
    STA.L $7E802E ; fallthrough to Function_MBBody_Phase2_ReviveSelf_TransitionFromGrey

Function_MBBody_Phase2_ReviveSelf_TransitionFromGrey:
    DEC.W $0FB2 
    BPL Function_MotherBrainBody_Phase2_ReviveSelf_return 
    LDA.W #$0010 
    STA.W $0FB2 
    LDA.L $7E802E 
    INC A 
    STA.L $7E802E 
    DEC A 
    JSL.L TransitionMotherBrainPaletteFromGrey_DrainedByBabyMetroid 
    BCC Function_MotherBrainBody_Phase2_ReviveSelf_return 
    LDA.W #Function_MotherBrainBody_Phase2_ReviveSelf_WakeUp 
    STA.W $0FA8 
    LDA.W #$0001 
    STA.L $7E7860 
    JSR.W SetupMotherBrainHeadNormalPalette ; fallthrough to Function_MotherBrainBody_Phase2_ReviveSelf_WakeUp

Function_MotherBrainBody_Phase2_ReviveSelf_WakeUp:
    JSR.W MakeMotherBrainStandUp 
    BCC Function_MotherBrainBody_Phase2_ReviveSelf_return 
    LDA.W #$0006 
    STA.L $7E8064 
    STA.L $7E8066 
    LDA.W #$0500 
    STA.L $7E8068 
    LDA.W #$0001 
    STA.L $7E8062 
    LDA.W #Function_MotherBrainBody_Phase2_ReviveSelf_WakeUpStretch 
    STA.W $0FA8 
    LDA.W #$0010 
    STA.W $0FB2 ; fallthrough to Function_MotherBrainBody_Phase2_ReviveSelf_WakeUpStretch

Function_MotherBrainBody_Phase2_ReviveSelf_WakeUpStretch:
    DEC.W $0FB2 
    BPL Function_MBBody_Phase2_ReviveSelf_WalkUpToBabyMetroid_return 
    LDA.W #InstList_MotherBrainHead_Stretching_Phase3_0 
    JSR.W SetMotherBrainHeadInstList 
    LDA.W #Function_MBBody_Phase2_ReviveSelf_WalkUpToBabyMetroid 
    STA.W $0FA8 
    LDA.W #$0080 
    STA.W $0FB2 ; fallthrough to Function_MBBody_Phase2_ReviveSelf_WalkUpToBabyMetroid

Function_MBBody_Phase2_ReviveSelf_WalkUpToBabyMetroid:
    DEC.W $0FB2 
    BPL Function_MBBody_Phase2_ReviveSelf_WalkUpToBabyMetroid_return 
    LDY.W #$0004 
    LDA.W #$0050 
    JSR.W MakeMotherBrainWalkForwards 
    BCC Function_MBBody_Phase2_ReviveSelf_WalkUpToBabyMetroid_return 
    LDA.W #Func_MBBody_Phase2_ReviveSelf_PrepareNeckForBabyMetroidDeath 
    STA.W $0FA8 
    LDA.W #$0002 
    STA.L $7E783E 
    DEC A 
    STA.L $7E7862 

Function_MBBody_Phase2_ReviveSelf_WalkUpToBabyMetroid_return:
    RTS 


Func_MBBody_Phase2_ReviveSelf_PrepareNeckForBabyMetroidDeath:
    LDA.W #$0000 
    STA.L $7E7826 
    LDA.W #$0001 
    STA.L $7E8062 
    LDA.W #$0002 
    STA.L $7E8064 
    LDA.W #$0004 
    STA.L $7E8066 
    LDA.W #$0040 
    STA.L $7E8068 
    LDA.W #Func_MBBody_Phase2_ReviveSelf_FinishPrepForBabyMetroidDeath 
    STA.W $0FA8 ; fallthrough to Func_MBBody_Phase2_ReviveSelf_FinishPrepForBabyMetroidDeath

Func_MBBody_Phase2_ReviveSelf_FinishPrepForBabyMetroidDeath:
    JSR.W MakeMotherBrainStandUp 
    BCS .standing 
    RTS 


.standing:
    LDA.W #Function_MotherBrainBody_Phase2_KillBabyMetroid_Attack 
    STA.W $0FA8 
    LDY.W #$000A 
    LDA.W #$0050 
    JSR.W MakeMotherBrainWalkForwards ; fallthrough to Function_MotherBrainBody_Phase2_KillBabyMetroid_Attack

Function_MotherBrainBody_Phase2_KillBabyMetroid_Attack:
    JSR.W MaybeMakeMotherBrainStandUpOrLeanDown 
    LDA.W $05E5 
    BMI + 
    RTS 


  + LDY.W #InstList_MotherBrainHead_AttackingSamus_4OnionRings_Phase3 
    LDA.L $7E7854 
    BEQ .zeroIndex 
    LDY.W #InstList_MotherBrainHead_Attacking_BabyMetroid 

.zeroIndex:
    TYA 
    JSR.W SetMotherBrainHeadInstList 
    LDA.W #Function_MBBody_Phase2_KillBabyMetroid_AttackCooldown 
    STA.W $0FA8 
    LDA.W #$0040 
    STA.W $0FB2 

Function_MBBody_Phase2_KillBabyMetroid_return:
    RTS 


Function_MBBody_Phase2_KillBabyMetroid_AttackCooldown:
    DEC.W $0FB2 
    BPL Function_MBBody_Phase2_KillBabyMetroid_return 
    LDA.W #Function_MotherBrainBody_Phase2_KillBabyMetroid_Attack 
    STA.W $0FA8 

RTS_A9C18D:
    RTS 


Function_MBBody_Phase2_PrepareForFinalBabyMetroidAttack:
    JSR.W MakeMotherBrainStandUp 
    LDY.W #$0004 
    LDA.W #$0040 
    JMP.W MakeMotherBrainWalkBackwards 


Function_MBBody_Phase2_ExecuteFinalBabyMetroidAttack:
    LDA.W #InstList_MotherBrainHead_Attacking_BabyMetroid 
    JSR.W SetMotherBrainHeadInstList 
    LDA.W #RTS_A9C1A6 
    STA.W $0FA8 

RTS_A9C1A6:
    RTS 


MaybeMakeMotherBrainStandUpOrLeanDown:
    LDA.L $7E7804 
    BEQ .standing 
    CMP.W #$0006 
    BNE .return 
    LDA.W $05E5 
    AND.W #$00FF 
    CMP.W #$00C0 
    BCC .return 
    JMP.W MakeMotherBrainStandUp 


.standing:
    LDA.W $05E5 
    AND.W #$00FF 
    CMP.W #$00C0 
    BCC .return 
    JMP.W MakeMotherBrainLeanDown 


.return:
    RTS 


Function_MBBody_Phase3_RecoverFromCutscene_MakeSomeDistance:
    LDA.W #$0004 
    STA.L $7E7800 
    LDA.W #Function_MBBody_Phase3_RecoverFromCutscene_SetupForFighting 
    STA.W $0FA8 
    LDA.W #$0020 
    STA.W $0FB2 
    LDA.W $0F7A 
    SEC 
    SBC.W #$000E 
    LDY.W #$0002 
    JSR.W MakeMotherBrainWalkBackwards 

Function_MotherBrainBody_Phase3_RecoverFromCutscene_return:
    RTS 


Function_MBBody_Phase3_RecoverFromCutscene_SetupForFighting:
    DEC.W $0FB2 
    BPL Function_MotherBrainBody_Phase3_RecoverFromCutscene_return 
    LDA.W #Function_MBBody_Phase3_Fighting_Main 
    STA.W $0FA8 
    LDA.W #Function_MotherBrainNeck_Normal 
    STA.L $7E7870 
    LDA.W #Function_MotherBrainBody_Walking_TryToInchForward 
    STA.L $7E7874 ; fallthrough to Function_MBBody_Phase3_Fighting_Main

Function_MBBody_Phase3_Fighting_Main:
    LDA.W $0FCC 
    BNE Function_MBBody_Phase3_Fighting_Main_notDead 
    LDA.W #Function_MBBody_Phase3_DeathSequence_MoveToBackOfRoom 
    STA.W $0FA8 

Function_MBBody_Phase3_Fighting_Main_return:
    RTS 


Function_MBBody_Phase3_Fighting_Main_notDead:
    JSR.W MotherBrainPhase3NeckHandler 
    JSR.W MotherBrainPhase3WalkingHandler 
    LDA.L $7E7804 
    BNE Function_MBBody_Phase3_Fighting_Main_return 
    LDA.L $7E780C 
    BNE Function_MBBody_Phase3_Fighting_Main_return 
    LDA.W $05E5 
    BPL Function_MBBody_Phase3_Fighting_Main_return 
    LDY.W #InstList_MotherBrainHead_Attacking_Bomb_Phase3 
    LDA.W $05E5 
    AND.W #$00FF 
    CMP.W #$0080 
    BCC Function_MBBody_Phase3_Fighting_Main_lessThan80 
    LDY.W #InstList_MotherBrainHead_AttackingSamus_4OnionRings_Phase3 

Function_MBBody_Phase3_Fighting_Main_lessThan80:
    TYA 
    JSR.W SetMotherBrainHeadInstList 
    LDA.W #Function_MBBody_Phase3_Fighting_AttackCooldown 
    STA.W $0FA8 
    LDA.W #$0040 
    STA.W $0FB2 
    RTS 


Function_MBBody_Phase3_Fighting_AttackCooldown:
    DEC.W $0FB2 
    BPL Function_MBBody_Phase3_Fighting_Main_return 
    LDA.W #Function_MBBody_Phase3_Fighting_Main 
    STA.W $0FA8 
    RTS 


MotherBrainPhase3WalkingHandler:
    LDA.L $7E7804 
    BEQ .standing 
    RTS 


.standing:
    LDA.L $7E7874 
    STA.B $12 
    JMP.W ($0012) 


Function_MotherBrainBody_Walking_TryToInchForward:
    LDA.L $7E780E 
    BEQ .walkLeft 
    CLC 
    ADC.W #$0020 
    STA.L $7E780E 
    CMP.W #$0100 
    BCC .return 
    LDA.W $0F7A 
    INC A 
    STA.L $7E7876 
    LDA.W $05E5 
    AND.W #$0002 
    CLC 
    ADC.W #$0004 
    TAY 
    LDA.L $7E7876 
    JSR.W MakeMotherBrainWalkForwards 
    BCC .return 
    LDA.W #$0080 
    STA.L $7E780E 

.return:
    RTS 


.walkLeft:
    LDA.W $0F7A 
    SEC 
    SBC.W #$000E 
    STA.L $7E7876 
    LDA.W #Function_MotherBrainBody_Walking_RetreatQuickly 
    STA.L $7E7874 ; fallthrough to Function_MotherBrainBody_Walking_RetreatQuickly

Function_MotherBrainBody_Walking_RetreatQuickly:
    LDA.L $7E7876 
    LDY.W #$0002 
    JSR.W MakeMotherBrainWalkBackwards 
    BCC .return 
    LDA.W $0F7A 
    SEC 
    SBC.W #$000E 
    STA.L $7E7876 
    LDA.W #Function_MotherBrainBody_Walking_RetreatSlowly 
    STA.L $7E7874 

.return:
    RTS 


Function_MotherBrainBody_Walking_RetreatSlowly:
    LDA.L $7E7876 
    LDY.W #$0004 
    JSR.W MakeMotherBrainWalkBackwards 
    BCS .reachedTargetX 
    RTS 


.reachedTargetX:
    LDA.W #$0040 
    JMP.W SetMotherBrainWalkingFunctionToTryToInchForward 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Function_MotherBrainBody_Walking_Crouch_A9C2E5:
    JSR.W MakeMotherBrainCrouch 
    BCC UNUSED_Function_MotherBrainBody_Walking_Crouch_return_A9C2F8 
    LDA.W #UNUSED_Function_MotherBrainBody_Walking_Crouching_A9C2F9 
    STA.L $7E7874 
    LDA.W #$0040 
    STA.L $7E7878 

UNUSED_Function_MotherBrainBody_Walking_Crouch_return_A9C2F8:
    RTS 


UNUSED_Function_MotherBrainBody_Walking_Crouching_A9C2F9:
    LDA.L $7E7878 
    DEC A 
    STA.L $7E7878 
    BPL UNUSED_Function_MotherBrainBody_Walking_Crouch_return_A9C2F8 
    LDA.W #UNUSED_Function_MotherBrainBody_Walking_StandUp_A9C30B 
    STA.L $7E7874 

UNUSED_Function_MotherBrainBody_Walking_StandUp_A9C30B:
    JSR.W MakeMotherBrainStandUp 
    BCC UNUSED_Function_MotherBrainBody_Walking_Crouch_return_A9C2F8 
    LDA.W #$00C0 ; fallthrough to SetMotherBrainWalkingFunctionToTryToInchForward
endif ; !FEATURE_KEEP_UNREFERENCED

SetMotherBrainWalkingFunctionToTryToInchForward:
    STA.L $7E780E 
    LDA.W #Function_MotherBrainBody_Walking_TryToInchForward 
    STA.L $7E7874 
    LDA.W $0F7A 
    INC A 
    STA.L $7E7876 
    RTS 


MotherBrainPhase3NeckHandler:
    LDA.L $7E7870 
    STA.B $12 
    JMP.W ($0012) 


Function_MotherBrainNeck_Normal:
    LDA.W #$0001 
    STA.L $7E8064 ; >_<
    LDA.W #$0080 
    STA.L $7E8068 
    LDA.W #$0002 
    STA.L $7E8064 
    LDA.W #$0004 
    STA.L $7E8066 
    LDA.W #RTS_A9C353 
    STA.L $7E7870 

RTS_A9C353:
    RTS 


Function_MotherBrainNeck_SetupRecoilRecovery:
    LDA.W #$0001 
    STA.L $7E8062 
    LDA.W #$0500 
    STA.L $7E8068 
    LDA.W #$0006 
    STA.L $7E8064 
    STA.L $7E8066 
    LDA.W #Function_MotherBrainNeck_RecoilRecovery 
    STA.L $7E7870 
    LDA.W #$0010 
    STA.L $7E7872 ; fallthrough to Function_MotherBrainNeck_RecoilRecovery

Function_MotherBrainNeck_RecoilRecovery:
    LDA.L $7E7872 
    DEC A 
    BMI .timerExpired 
    STA.L $7E7872 
    RTS 


.timerExpired:
    LDA.W #InstList_MotherBrainHead_AttackingSamus_4OnionRings_Phase3 
    JSR.W SetMotherBrainHeadInstList 
    LDA.W #Function_MotherBrainNeck_Normal 
    STA.L $7E7870 
    RTS 


Function_MotherBrainNeck_SetupHyperBeamRecoil:
    LDA.W #$0001 
    STA.L $7E8062 
    STA.L $7E780C 
    LDA.W #InstList_MotherBrainHead_HyperBeamRecoil_0 
    JSR.W SetMotherBrainHeadInstList 
    LDA.W #$0032 
    STA.L $7E7840 
    LDA.W #$0900 
    STA.L $7E8068 
    LDA.W #$0008 
    STA.L $7E8064 
    STA.L $7E8066 
    LDA.W #Function_MotherBrainNeck_HyperBeamRecoil 
    STA.L $7E7870 
    LDA.W #$000B 
    STA.L $7E7872 ; fallthrough to Function_MotherBrainNeck_HyperBeamRecoil

Function_MotherBrainNeck_HyperBeamRecoil:
    LDA.L $7E7872 
    DEC A 
    BMI .timerExpired 
    STA.L $7E7872 
    RTS 


.timerExpired:
    LDA.W #$0080 
    STA.L $7E8068 
    LDA.W #$0000 
    STA.L $7E780C 
    LDA.W #Function_MotherBrainNeck_SetupRecoilRecovery 
    STA.L $7E7870 
    RTS 


MoveEnemyAccordingToVelocity:
    LDX.W $0E54 
    LDA.W $0FAA,X 
    SEP #$20 
    CLC 
    ADC.W $0F7D,X 
    STA.W $0F7D,X 
    REP #$20 
    AND.W #$FF00 
    XBA 
    BPL + 
    ORA.W #$FF00 

  + ADC.W $0F7A,X 
    STA.W $0F7A,X 
    LDA.W $0FAC,X 
    SEP #$20 
    CLC 
    ADC.W $0F81,X 
    STA.W $0F81,X 
    REP #$20 
    AND.W #$FF00 
    XBA 
    BPL + 
    ORA.W #$FF00 

  + ADC.W $0F7E,X 
    STA.W $0F7E,X 
    RTL 


SetMotherBrainBodyInstList:
    STA.W $0F92 
    LDA.W #$0001 
    STA.W $0F94 
    STZ.W $0F90 
    RTS 


SetMotherBrainHeadUnusedInstList:
    STA.W $0FD2 
    LDA.W #$0001 
    STA.W $0FD4 
    STZ.W $0FD0 
    RTS 


SetMotherBrainHeadInstList:
    STA.L $7E8002 
    LDA.W #$0001 
    STA.L $7E8000 
    RTS 


SetEnemyInstList:
    STA.W $0F92,X 
    LDA.W #$0001 
    STA.W $0F94,X 
    STZ.W $0F90,X 
    RTL 


GetSineMathInA_A9C460:
    TAY 
    LDA.B $12 
    BRA GetSineMathInA_A9C46C 


GetCosineMathInA_A9C465:
    TAY 
    LDA.B $12 
    CLC 
    ADC.W #$0040 

GetSineMathInA_A9C46C:
    PHX 
    ASL A 
    AND.W #$01FE 
    TAX 
    LDA.L SineCosineTables_8bitSine_SignExtended,X 
    SEP #$20 
    STA.L $00211B 
    XBA 
    STA.L $00211B 
    TYA 
    STA.L $00211C 
    REP #$20 
    LDA.L $002135 
    PLX 
    RTL 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_AddADividedBy100ToEnemyXPosition_A9C48E:
    SEP #$20 
    CLC 
    ADC.W $0F7D,X 
    STA.W $0F7D,X 
    REP #$20 
    AND.W #$FF00 
    XBA 
    BPL + 
    ORA.W #$FF00 

  + ADC.W $0F7A,X 
    STA.W $0F7A,X 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


AddADividedBy100ToEnemyYPosition:
    SEP #$20 
    CLC 
    ADC.W $0F81,X 
    STA.W $0F81,X 
    REP #$20 
    AND.W #$FF00 
    XBA 
    BPL + 
    ORA.W #$FF00 

  + ADC.W $0F7E,X 
    STA.W $0F7E,X 
    RTS 


DecrementAmmoDueToRainbowBeam:
    LDA.W $0E44 
    AND.W #$0003 
    BNE .superMissiles 
    LDA.W $09C6 
    BEQ .superMissiles 
    SEC 
    SBC.W .decrementValue 
    CMP.W #$0001 
    BPL .writeMissiles 
    LDA.W $09D2 
    CMP.W #$0001 
    BNE .resetAutoCancel 
    LDA.W #$0000 
    STA.W $09D2 

.resetAutoCancel:
    LDA.W #$0000 
    STA.W $0A04 

.writeMissiles:
    STA.W $09C6 

.superMissiles:
    LDA.W $0E44 
    AND.W #$0003 
    BNE .powerBombs 
    LDA.W $09CA 
    BEQ .powerBombs 
    SEC 
    SBC.W .decrementValue 
    CMP.W #$0001 
    BPL .writeSuperMissiles 
    LDA.W $09D2 
    CMP.W #$0002 
    BNE ..resetAutoCancel 
    LDA.W #$0000 
    STA.W $09D2 

..resetAutoCancel:
    LDA.W #$0000 
    STA.W $0A04 

.writeSuperMissiles:
    STA.W $09CA 

.powerBombs:
    LDA.W $09CE 
    BEQ .return 
    SEC 
    SBC.W .decrementValue 
    CMP.W #$0001 
    BPL .writePowerBombs 
    LDA.W $09D2 
    CMP.W #$0003 
    BNE ..resetAutoCancel 
    LDA.W #$0000 
    STA.W $09D2 

..resetAutoCancel:
    LDA.W #$0000 
    STA.W $0A04 

.writePowerBombs:
    STA.W $09CE 

.return:
    RTS 


.decrementValue:
    dw $0001 

HandlePlayingGainingLosingIncrementalEnergySFX:
    PHA 
    LDA.W $09C2 
    CMP.W #$0051 
    BMI .return 
    LDA.W $0E44 
    AND.W #$0007 
    BNE .return 
    LDA.W #$002D 
    JSL.L QueueSound_Lib3_Max3 

.return:
    PLA 
    RTS 


DamageSamusDueToBabyMetroid:
    LDY.W #$FFFC 
    LDA.W $09A2 
    LSR A 
    BCC .varia 
    LDY.W #$FFFD 

.varia:
    TYA 
    ADC.W $09C2 
    CMP.W #$0002 
    BPL .done 
    CLC 
    LDA.W #$0001 

.done:
    STA.W $09C2 
    RTL 


DamageSamusDueToRainbowBeam:
    LDY.W #$FFFE 
    LDA.W $09A2 
    LSR A 
    BCC .varia 
    LDY.W #$FFFE 

.varia:
    TYA 
    ADC.W $09C2 
    CMP.W #$0001 
    BPL .done 
    CLC 
    LDA.W #$0000 

.done:
    STA.W $09C2 
    PHP 
    JSR.W HandlePlayingGainingLosingIncrementalEnergySFX 
    PLP 
    RTL 


HealSamusDueToBabyMetroid:
    LDA.W #$0001 
    CLC 
    ADC.W $09C2 
    CMP.W $09C4 
    BMI .notMaxed 
    LDA.W $09C4 
    STA.W $09C2 
    JSR.W HandlePlayingGainingLosingIncrementalEnergySFX 
    CLC 
    RTL 


.notMaxed:
    STA.W $09C2 
    JSR.W HandlePlayingGainingLosingIncrementalEnergySFX 
    SEC 
    RTL 


ProcessSpriteTilesTransfers:
    LDA.L $7E8004 
    BNE + 
    TXA 

  + TAX 
    LDY.W $0330 
    LDA.W $0000,X 
    BEQ + 
    STA.W $00D0,Y 
    LDA.W $0003,X 
    STA.W $00D3,Y 
    LDA.W $0002,X 
    STA.W $00D2,Y 
    LDA.W $0005,X 
    STA.W $00D5,Y 
    TYA 
    CLC 
    ADC.W #$0007 
    STA.W $0330 
    TXA 
    ADC.W #$0007 
    STA.L $7E8004 
    TAX 
    LDA.W $0000,X 
    BEQ + 
    CLC 
    RTS 


  + STA.L $7E8004 
    SEC 
    RTS 


MakeMotherBrainWalkForwards:
    CMP.W $0F7A 
    BMI .returnReachedTarget 
    LDA.L $7E7804 
    BNE .returnNotReached 
    LDA.W $0F7A 
    CMP.W #$0080 
    BPL .returnReachedTarget 
    LDA.W .pointers,Y 
    JSR.W SetMotherBrainBodyInstList 

.returnNotReached:
    CLC 
    RTS 


.returnReachedTarget:
    SEC 
    RTS 


.pointers:
    dw .pointers 
    dw InstList_MotherBrainBody_WalkingForwards_ReallyFast 
    dw InstList_MotherBrainBody_WalkingForwards_Fast 
    dw InstList_MotherBrainBody_WalkingForwards_Medium 
    dw InstList_MotherBrainBody_WalkingForwards_Slow 
    dw InstList_MotherBrainBody_WalkingForwards_ReallySlow 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_MakeMotherBrainWalkBackwards_A9C62A:
    CMP.W $0F7A 
    BPL .returnCarrySet 
    LDA.L $7E7804 
    BNE .returnCarryClear 
    LDA.W $0F7A 
    CMP.W #$0010 
    BMI .returnCarrySet 
    LDA.W MakeMotherBrainWalkBackwards_pointers,Y 
    JSR.W SetMotherBrainBodyInstList 

.returnCarryClear:
    CLC 
    RTS 


.returnCarrySet:
    SEC 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


MakeMotherBrainWalkBackwards:
    CMP.W $0F7A 
    BPL .returnTargetReached 
    LDA.L $7E7804 
    BNE .returnNotReached 
    LDA.W $0F7A 
    CMP.W #$0030 
    BMI .returnTargetReached 
    LDA.W MakeMotherBrainWalkBackwards_pointers,Y 
    JSR.W SetMotherBrainBodyInstList 

.returnNotReached:
    CLC 
    RTS 


.returnTargetReached:
    SEC 
    RTS 


MakeMotherBrainWalkBackwards_pointers:
    dw MakeMotherBrainWalkBackwards_pointers 
    dw InstList_MotherBrainBody_WalkingBackwards_ReallyFast 
    dw InstList_MotherBrainBody_WalkingBackwards_Fast 
    dw InstList_MotherBrainBody_WalkingBackwards_Medium 
    dw InstList_MotherBrainBody_WalkingBackwards_Slow 
    dw InstList_MotherBrainBody_WalkingBackwards_ReallySlow 

MakeMotherBrainStandUp:
    LDA.L $7E7804 
    BEQ .returnStanding 
    LDY.W #InstList_MotherBrainBody_StandingUpAfterCrouching_Fast 
    CMP.W #$0003 
    BEQ .standFast 
    CMP.W #$0006 
    BNE .returnNotStanding 
    LDY.W #InstList_MotherBrainBody_StandingUpAfterLeaningDown 

.standFast:
    TYA 
    JSR.W SetMotherBrainBodyInstList 

.returnNotStanding:
    CLC 
    RTS 


.returnStanding:
    SEC 
    RTS 


MakeMotherBrainCrouch:
    LDA.L $7E7804 
    BEQ .crouchSlow 
    CMP.W #$0003 
    BNE .notCrouched 
    SEC 
    RTS 


.crouchSlow:
    LDA.W #InstList_MotherBrainBody_Crouch_Slow 

.setToCrouch:
    JSR.W SetMotherBrainBodyInstList 

.notCrouched:
    CLC 
    RTS 


MakeMotherBrainLeanDown:
    LDA.L $7E7804 
    BEQ .leanDown 
    CMP.W #$0006 
    BNE .notLeaningDown 
    SEC 
    RTS 


.leanDown:
    LDA.W #InstList_MotherBrainBody_LeaningDown 
    JSR.W SetMotherBrainBodyInstList 

.notLeaningDown:
    CLC 
    RTS 


HandleMotherBrainWalking:
    LDA.L $7E7804 
    BEQ .standing 
    RTS 


.standing:
    LDA.L $7E780E 
    BEQ .walkBackwards 
    CLC 
    ADC.W #$0006 
    STA.L $7E780E 
    CMP.W #$0100 
    BCC .maybeWalkForwardsIfFarLeft 

.walkForwards:
    LDA.W #$0080 
    STA.L $7E780E 
    LDA.W $0F7A 
    CMP.W #$0080 
    BPL .return 
    LDA.W #InstList_MotherBrainBody_WalkingForwards_Medium 
    JMP.W SetMotherBrainBodyInstList 


.walkBackwards:
    LDA.W #$0001 
    STA.L $7E780E 
    LDA.W $0F7A 
    CMP.W #$0030 
    BMI .maybeWalkForwards 
    LDA.W #InstList_MotherBrainBody_WalkingBackwards_Fast 
    JMP.W SetMotherBrainBodyInstList 


.maybeWalkForwardsIfFarLeft:
    LDA.W $0F7A 
    CMP.W #$0030 
    BPL .return 

.maybeWalkForwards:
    LDA.W $05E5 
    AND.W #$0FFF 
    CMP.W #$0FC0 
    BPL .walkForwards 

.return:
    RTS 


InitAI_BabyMetroidCutscene:
    LDX.W $0E54 
    LDA.W $0F86,X 
    ORA.W #$3000 
    STA.W $0F86,X 
    LDA.W #$0E00 
    STA.W $0F96,X 
    LDA.W #InstList_BabyMetroid_Initial 
    STA.W $0F92,X 
    LDA.W #$0001 
    STA.W $0F94,X 
    STA.L $7E7808,X 
    STZ.W $0F90,X 
    LDA.W #$000A 
    STA.W $0FB0,X 
    LDA.W #$00A0 
    STA.W $0F98,X 
    LDA.W #$0140 
    STA.W $0F7A,X 
    LDA.W #$0060 
    STA.W $0F7E,X 
    STZ.W $0FAA,X 
    STZ.W $0FAC,X 
    LDA.W #$0000 
    STA.L $7E7812,X 
    LDA.W #Function_BabyMetroidCutscene_DashOntoScreen 
    STA.W $0FA8,X 
    LDA.W #$00F8 
    STA.W $0FB2,X 
    LDA.W #HandleBabyMetroidCutscenePalette_Normal 
    STA.L $7E781E,X 
    LDY.W #Palette_MotherBrain_BabyMetroid+2 
    LDX.W #$01E2 
    LDA.W #$000F 
    JMP.W WriteAColorsFromYtoColorIndexX 


MainAI_BabyMetroidCutscene:
    LDX.W $0E54 
    STZ.W $0FA2,X 
    JSR.W ($0FA8,X) 
    JSL.L MoveEnemyAccordingToVelocity 
    JSR.W HandleBabyMetroidCutsceneFlashing 
    JSR.W HandleBabyMetroidCutsceneHealthBasedPalette 
    LDX.W $0E54 
    LDA.L $7E781E,X 
    STA.B $12 
    PEA.W .manualReturn-1 
    JMP.W ($0012) 


.manualReturn:
    RTL 


HandleBabyMetroidCutsceneFlashing:
    LDY.W #$0E00 
    LDA.L $7E780C,X 
    BEQ .return 
    DEC A 
    STA.L $7E780C,X 
    AND.W #$0002 
    BEQ .return 
    LDY.W #$0000 

.return:
    TYA 
    STA.W $0F96,X 
    RTS 


HandlePlayingBabyMetroidCutsceneCrySFX:
    LDA.L $7E7828 
    BEQ .return 
    LDA.W #$0000 
    STA.L $7E7828 
    LDA.W #$0072 
    JSL.L QueueSound_Lib2_Max6 

.return:
    RTS 


Function_BabyMetroidCutscene_DashOntoScreen:
    DEC.W $0FB2,X 
    BMI .timerExpired 
    RTS 


.timerExpired:
    LDA.W #$D800 
    STA.L $7E7814,X 
    LDA.W #$0A00 
    STA.L $7E7816,X 
    LDA.W #Function_BabyMetroidCutscene_CurveTowardMotherBrainHead 
    STA.W $0FA8,X 
    LDA.W #$000A 
    STA.W $0FB2,X ; fallthrough to Function_BabyMetroidCutscene_CurveTowardMotherBrainHead

Function_BabyMetroidCutscene_CurveTowardMotherBrainHead:
    LDA.W #$FE80 
    STA.B $12 
    LDA.W #$B000 
    STA.B $14 
    LDA.W #$0A00 
    STA.B $16 
    JSR.W UpdateBabyMetroidCutsceneSpeedAndAngle 
    DEC.W $0FB2,X 
    BMI .timerExpired 
    RTS 


.timerExpired:
    LDA.W #Function_BabyMetroidCutscene_GetRightUpInMotherBrainsFace 
    STA.W $0FA8,X 
    LDA.W #$0009 
    STA.W $0FB2,X 
    RTS 


Function_BabyMetroidCutscene_GetRightUpInMotherBrainsFace:
    LDA.W #$FA00 
    STA.B $12 
    LDA.W #$8200 
    STA.B $14 
    LDA.W #$0E00 
    STA.B $16 
    JSR.W UpdateBabyMetroidCutsceneSpeedAndAngle 
    LDA.W $0FBA 
    STA.B $12 
    LDA.W $0FBE 
    STA.B $14 
    LDA.W #$0004 
    STA.B $16 
    STA.B $18 
    JSL.L CheckForEnemyCollisionWithRectangle 
    BCC .timerExpired 
    DEC.W $0FB2,X 
    BMI .timerExpired 
    RTS 


.timerExpired:
    STA.W $0FA8,X 
    LDA.W #Function_BabyMetroidCutscene_LatchOntoMotherBrain 
    STA.W $0FA8,X 
    LDA.W #$0001 
    JSL.L DrainedSamusController 
    RTS 


Function_BabyMetroidCutscene_LatchOntoMotherBrain:
    LDA.W $0FBA 
    STA.B $12 
    LDA.W $0FBE 
    CLC 
    ADC.W #$FFE8 
    STA.B $14 
    LDY.W #$0000 
    JSR.W GradduallyAccelerateTowardsPoint_1A_400 
    LDA.W #$0008 
    STA.B $16 
    STA.B $18 
    JSL.L CheckForEnemyCollisionWithRectangle 
    BCS .return 
    LDA.W #Function_BabyMetroidCutscene_SetMotherBrainToStumbleBack 
    STA.W $0FA8,X 

.return:
    RTS 


Function_BabyMetroidCutscene_SetMotherBrainToStumbleBack:
    LDY.W #$0002 
    LDA.W $0F7A 
    DEC A 
    JSR.W MakeMotherBrainWalkBackwards 
    LDA.W #Function_BabyMetroidCutscene_ActivateRainbowBeamAndMBBody 
    STA.W $0FA8,X ; fallthrough to Function_BabyMetroidCutscene_ActivateRainbowBeamAndMBBody

Function_BabyMetroidCutscene_ActivateRainbowBeamAndMBBody:
    LDA.W $0FBA 
    CLC 
    ADC.W #$0000 
    STA.B $12 
    LDA.W $0FBE 
    CLC 
    ADC.W #$FFE8 
    STA.B $14 
    LDA.W #$0200 
    JSR.W AccelerateBabyMetroidTowardsPoint 
    BCS .reachedTarget 
    RTS 


.reachedTarget:
    STZ.W $0FAA,X 
    STZ.W $0FAC,X 
    LDA.W $0FBA 
    STA.W $0F7A,X 
    LDA.W $0FBE 
    CLC 
    ADC.W #$FFE8 
    STA.W $0F7E,X 
    LDA.W #InstList_BabyMetroid_DrainingMotherBrain 
    JSL.L SetEnemyInstList 
    LDA.W #Function_BabyMetroidCutscene_WaitForMBToTurnToCorpse 
    STA.W $0FA8,X 
    LDA.W #$0001 
    STA.W $0FB0,X 
    LDA.W #Function_MotherBrainBody_DrainedByBabyMetroid_TakenAback 
    STA.W $0FA8 
    LDA.W #$0040 
    JSL.L QueueSound_Lib1_Max6 
    LDA.W #$0001 
    STA.L $7E782C 
    RTS 


Function_BabyMetroidCutscene_WaitForMBToTurnToCorpse:
    LDA.W $0FA4,X 
    AND.W #$0006 
    TAY 
    LDA.W ShakingOffsets_X,Y 
    CLC 
    ADC.W $0FBA 
    STA.W $0F7A,X 
    LDA.W ShakingOffsets_Y,Y 
    CLC 
    ADC.W $0FBE 
    CLC 
    ADC.W #$FFE8 
    STA.W $0F7E,X 
    LDA.L $7E783E 
    BNE .turnedToCorpse 
    RTS 


.turnedToCorpse:
    LDA.W #Function_BabyMetroidCutscene_StopDraining 
    STA.W $0FA8,X 
    LDA.W #$0040 
    STA.W $0FB2,X 
    RTS 


Function_BabyMetroidCutscene_StopDraining:
    LDA.W $0FBA 
    STA.W $0F7A,X 
    LDA.W $0FBE 
    CLC 
    ADC.W #$FFE8 
    STA.W $0F7E,X 
    DEC.W $0FB2,X 
    BMI .timerExpired 
    RTS 


.timerExpired:
    LDA.W #InstList_BabyMetroid_Initial 
    JSL.L SetEnemyInstList 
    LDA.W #$000A 
    STA.W $0FB0,X 
    LDA.W #Function_BabyMetroidCutscene_LetGo_SpawnDustClouds 
    STA.W $0FA8,X 
    LDA.W #$0020 
    STA.W $0FB2,X 
    STZ.W $0FAA,X 
    STZ.W $0FAC,X 
    RTS 


Function_BabyMetroidCutscene_LetGo_SpawnDustClouds:
    DEC.W $0FB2,X 
    BPL Function_BabyMetroidCutscene_MoveToTheCeiling 
    JSR.W SpawnThreeDustCloudsOnMotherBrainHead 
    LDA.W #Function_BabyMetroidCutscene_MoveToTheCeiling 
    STA.W $0FA8,X ; fallthrough to Function_BabyMetroidCutscene_MoveToTheCeiling

Function_BabyMetroidCutscene_MoveToTheCeiling:
    LDA.W $0FBA 
    STA.B $12 
    LDA.W #$0000 
    STA.B $14 
    LDY.W #$0000 
    JSR.W GradduallyAccelerateTowardsPoint_1A_400 
    LDA.W #$0004 
    STA.B $16 
    STA.B $18 
    JSL.L CheckForEnemyCollisionWithRectangle 
    BCC .collision 
    RTS 


.collision:
    LDA.W #$0004 
    JSL.L DrainedSamusController 
    LDA.W #Function_BabyMetroidCutscene_MoveToSamus 
    STA.W $0FA8,X 
    LDA.W #BabyMetroidCutscene_MovementTable_CeilingToSamus 
    STA.L $7E781C,X 
    RTS 


SpawnThreeDustCloudsOnMotherBrainHead:
    LDA.W #$FFF8 
    STA.B $14 
    LDA.W #$FFF0 
    JSR.W SpawnDustCloudAtMotherBrainHeadPosition_OffsetByA_14 
    LDA.W #$FFF0 
    STA.B $14 
    LDA.W #$0000 
    JSR.W SpawnDustCloudAtMotherBrainHeadPosition_OffsetByA_14 
    LDA.W #$FFF8 
    STA.B $14 
    LDA.W #$0010 ; fallthrough to SpawnDustCloudAtMotherBrainHeadPosition_OffsetByA_14

SpawnDustCloudAtMotherBrainHeadPosition_OffsetByA_14:
    CLC 
    ADC.W $0FBA 
    STA.B $12 
    LDA.B $14 
    CLC 
    ADC.W $0FBE 
    STA.B $14 
    LDA.W #$0009 
    LDY.W #EnemyProjectile_MiscDust 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    RTS 


Function_BabyMetroidCutscene_MoveToSamus:
    LDA.W #$0000 
    STA.L $7E7808,X 
    INC A 
    STA.L $7E7812,X 
    LDA.W $05E5 
    AND.W #$0FFF 
    CMP.W #$0FA0 
    BCC .skipSFX 
    LDA.W #$0052 
    JSL.L QueueSound_Lib2_Max6 

.skipSFX:
    LDA.L $7E781C,X 
    TAY 
    LDA.W $0000,Y 
    STA.B $12 
    LDA.W $0002,Y 
    STA.B $14 
    LDA.W $0006,Y 
    STA.B $16 
    LDA.W $0004,Y 
    PHY 
    TAY 
    PEA.W .manualReturn-1 
    JMP.W ($0016) 


.manualReturn:
    PLY 
    LDA.W #$0004 
    STA.B $16 
    STA.B $18 
    JSL.L CheckForEnemyCollisionWithRectangle 
    BCS .return 
    LDA.W $0008,Y 
    BMI .function 
    LDA.L $7E781C,X 
    CLC 
    ADC.W #$0008 
    STA.L $7E781C,X 

.return:
    RTS 


.function:
    STA.W $0FA8,X 
    RTS 


BabyMetroidCutscene_MovementTable_CeilingToSamus:
    dw $00A0,$0078,$0000 
    dw GradduallyAccelerateTowardsPoint_1A_10 
    dw $0130,$007A,$0000 
    dw GradduallyAccelerateTowardsPoint_1A_10 
    dw $00C0,$0040,$0000 
    dw GradduallyAccelerateTowardsPoint_1A_10 
    dw $00C0,$0070,$0000 
    dw GradduallyAccelerateTowardsPoint_1A_10 
    dw $00E0,$0080,$0000 
    dw GradduallyAccelerateTowardsPoint_1A_10 
    dw $00CD,$0090,$0000 
    dw GradduallyAccelerateTowardsPoint_1A_8 
    dw $00CC,$00A0,$0000 
    dw GradduallyAccelerateTowardsPoint_1A_8 
    dw $00CB,$00B0,$0000 
    dw GradduallyAccelerateTowardsPoint_1A_8 
    dw Function_BabyMetroidCutscene_LatchOntoSamus 

Function_BabyMetroidCutscene_LatchOntoSamus:
    LDA.W $0AF6 
    STA.B $12 
    LDA.W $0AFA 
    SEC 
    SBC.W #$0014 
    STA.B $14 
    LDY.W #$0000 
    JMP.W GradduallyAccelerateTowardsPoint_1A_400 


Function_BabyMetroidCutscene_HealSamusUpToFullEnergy:
    LDA.W #$0000 
    STA.L $7E7808,X 
    JSR.W HandlePlayingBabyMetroidCutsceneCrySFX 
    LDA.W $0FA4,X 
    AND.W #$0006 
    TAY 
    LDA.W ShakingOffsets_X,Y 
    CLC 
    ADC.W $0AF6 
    STA.W $0F7A,X 
    LDA.W ShakingOffsets_Y,Y 
    CLC 
    ADC.W $0AFA 
    SEC 
    SBC.W #$0014 
    STA.W $0F7E,X 
    JSL.L HealSamusDueToBabyMetroid 
    BCS .return 
    LDA.W $09D4 
    STA.W $09D6 
    LDA.W #Function_BabyMetroidCutscene_IdleUntilRunOutOfHealth 
    STA.W $0FA8,X 
    LDA.W #.return 
    STA.L $7E781E,X 

.return:
    RTS 


Function_BabyMetroidCutscene_IdleUntilRunOutOfHealth:
    JSR.W HandlePlayingBabyMetroidCutsceneCrySFX 
    LDA.L $7E780C,X 
    BEQ .checkHealth 
    AND.W #$0006 
    TAY 
    LDA.W ShakingOffsets_X,Y 
    ASL A 
    CLC 
    ADC.W $0AF6 
    STA.W $0F7A,X 
    LDA.W ShakingOffsets_Y,Y 
    ASL A 
    CLC 
    ADC.W $0AFA 
    SEC 
    SBC.W #$0014 
    STA.W $0F7E,X 

.checkHealth:
    LDA.W $0F8C,X 
    BEQ .zeroHealth 
    RTS 


.zeroHealth:
    LDA.W #$0140 
    STA.W $0F8C,X 
    LDA.W #Function_BabyMetroidCutscene_ReleaseSamus 
    STA.W $0FA8,X 
    LDA.W #$000A 
    STA.W $0FB0,X 
    STZ.W $0FAE,X 
    LDA.W #HandleBabyMetroidCutscenePalette_LowHealth 
    STA.L $7E781E,X 
    LDA.W #$0001 
    STA.L $7E7808,X 
    DEC A 
    STA.L $7E7812,X 
    RTS 


Function_BabyMetroidCutscene_ReleaseSamus:
    LDA.W #$0072 
    JSL.L QueueSound_Lib2_Max6 
    LDA.W #$0001 
    STA.L $7E7856 
    LDA.W #Function_BabyMetroidCutscene_StaredownMotherBrain 
    STA.W $0FA8,X 
    LDA.W #Function_MBBody_Phase2_PrepareForFinalBabyMetroidAttack 
    STA.W $0FA8 ; fallthrough to Function_BabyMetroidCutscene_StaredownMotherBrain

Function_BabyMetroidCutscene_StaredownMotherBrain:
    LDA.W $0AF6 
    SEC 
    SBC.W #$0004 
    STA.B $12 
    LDA.W #$0060 
    STA.B $14 
    LDY.W #$0000 
    JSR.W GradduallyAccelerateTowardsPoint_1A_10 
    LDA.W #$0004 
    STA.B $16 
    STA.B $18 
    JSL.L CheckForEnemyCollisionWithRectangle 
    BCC .collision 
    RTS 


.collision:
    LDA.W #Function_BabyMetroidCutscene_FlyOffScreen 
    STA.W $0FA8,X 
    RTS 


Function_BabyMetroidCutscene_FlyOffScreen:
    LDA.W #$0110 
    STA.B $12 
    LDA.W #$0040 
    STA.B $14 
    LDY.W #$0000 
    JSR.W GradduallyAccelerateTowardsPoint_1A_10 
    LDA.W #$0004 
    STA.B $16 
    STA.B $18 
    JSL.L CheckForEnemyCollisionWithRectangle 
    BCC .collision 
    RTS 


.collision:
    LDA.W #Function_BabyMetroidCutscene_MoveToFinalChargeStartPosition 
    STA.W $0FA8,X 
    RTS 


Function_BabyMetroidCutscene_MoveToFinalChargeStartPosition:
    LDA.W #$0131 
    STA.B $12 
    LDA.W #$00A0 
    STA.B $14 
    LDY.W #$0000 
    JSR.W GradduallyAccelerateTowardsPoint_1A_10 
    LDA.W #$0004 
    STA.B $16 
    STA.B $18 
    JSL.L CheckForEnemyCollisionWithRectangle 
    BCC .collision 
    RTS 


.collision:
    LDA.W #$004F 
    STA.W $0F8C,X 
    LDA.W #$0000 
    STA.L $7E7856 
    LDA.W #Function_MBBody_Phase2_ExecuteFinalBabyMetroidAttack 
    STA.W $0FA8 
    LDA.W #Function_BabyMetroidCutscene_InitiateFinalCharge 
    STA.W $0FA8,X 
    RTS 


Function_BabyMetroidCutscene_InitiateFinalCharge:
    LDA.W #$0122 
    STA.B $12 
    LDA.W #$0080 
    STA.B $14 
    LDY.W #$000A 
    JSR.W GradduallyAccelerateTowardsPoint_1A_400 
    LDA.W #$0004 
    STA.B $16 
    STA.B $18 
    JSL.L CheckForEnemyCollisionWithRectangle 
    BCC .collision 
    RTS 


.collision:
    LDA.W #Function_BabyMetroidCutscene_FinalCharge 
    STA.W $0FA8,X 
    RTS 


Function_BabyMetroidCutscene_FinalCharge:
    LDA.W $0FBA 
    STA.B $12 
    LDA.W #$FFE0 
    CLC 
    ADC.W $0FBE 
    STA.B $14 
    LDY.W #$000C 
    JSR.W GradduallyAccelerateTowardsPoint_1A_400 
    LDA.W $0F8C,X 
    BEQ .zeroHealth 
    RTS 


.zeroHealth:
    LDA.W #Function_BabyMetroidCutscene_PrepareForHyperBeam_return 
    STA.L $7E781E,X 
    LDA.W #$10A0 
    STA.W $0F98,X 
    LDA.W #$0019 
    JSL.L QueueSound_Lib3_Max6 
    JSL.L FadeOutBackgroundForBabyMetroidDeathSequence 
    LDA.W #InstList_BabyMetroid_TookFatalBlow 
    JSL.L SetEnemyInstList 
    STZ.W $0FAA,X 
    STZ.W $0FAC,X 
    LDA.W #RTS_A9C18D 
    STA.W $0FA8 
    LDA.W #$0000 
    JSL.L QueueMusicDataOrTrack_8FrameDelay 
    LDA.W #Function_BabyMetroidCutscene_TakeFinalBlow 
    STA.W $0FA8,X 
    LDA.W #$0010 
    STA.W $0FB2,X 
    LDA.W $0F7A,X 
    STA.L $7E7820,X 
    LDA.W $0F7E,X 
    STA.L $7E7822,X ; fallthrough to Function_BabyMetroidCutscene_TakeFinalBlow

Function_BabyMetroidCutscene_TakeFinalBlow:
    JSR.W ShakeBabyMetroidCutscene 
    DEC.W $0FB2,X 
    BPL Function_BabyMetroidCutscene_PrepareForHyperBeam_return 
    LDA.L $7E7820,X 
    STA.W $0F7A,X 
    LDA.L $7E7822,X 
    STA.W $0F7E,X 
    LDA.W #Function_BabyMetroidCutscene_PlaySamusTheme 
    STA.W $0FA8,X 
    LDA.W #$0038 
    STA.W $0FB2,X ; fallthrough to Function_BabyMetroidCutscene_PlaySamusTheme

Function_BabyMetroidCutscene_PlaySamusTheme:
    DEC.W $0FB2,X 
    BPL Function_BabyMetroidCutscene_PrepareForHyperBeam_return 
    LDA.W #$FF48 
    JSL.L QueueMusicDataOrTrack_8FrameDelay 
    LDA.W #$0005 
    JSL.L QueueMusicDataOrTrack_8FrameDelay 
    LDA.W #Function_BabyMetroidCutscene_PrepareForHyperBeam 
    STA.W $0FA8,X 
    LDA.W #$000C 
    STA.W $0FB2,X ; fallthrough to Function_BabyMetroidCutscene_PrepareForHyperBeam

Function_BabyMetroidCutscene_PrepareForHyperBeam:
    DEC.W $0FB2,X 
    BPL Function_BabyMetroidCutscene_PrepareForHyperBeam_return 
    LDA.W #$0019 
    JSL.L Run_Samus_Command 
    LDA.W #SamusRainbowPaletteFunction_ActivateRainbowWhenEnemyIsLow 
    STA.L $7E786C 
    LDA.W #Function_BabyMetroidCutscene_DeathSequence 
    STA.W $0FA8,X 

Function_BabyMetroidCutscene_PrepareForHyperBeam_return:
    RTS 


Function_BabyMetroidCutscene_DeathSequence:
    JSR.W HandleSamusRainbowPaletteAnimation 
    JSR.W AccelerateBabyMetroidCutsceneDownwards 
    JSR.W FadeBabyMetroidCutsceneToBlack 
    BCS .fadedToBlack 
    JSR.W HandleBabyMetroidCutsceneDeathExplosions 
    JMP.W HandleEnemyBlinking 


.fadedToBlack:
    LDA.W $0F86,X 
    ORA.W #$0100 
    STA.W $0F86,X 
    LDA.W #Function_BabyMetroidCutscene_UnloadTiles 
    STA.W $0FA8,X 
    LDA.W #$0080 
    STA.W $0FB2,X 

Function_BabyMetroidCutscene_DeathSequence_return:
    RTS 


Function_BabyMetroidCutscene_UnloadTiles:
    JSR.W HandleSamusRainbowPaletteAnimation 
    DEC.W $0FB2,X 
    BPL Function_BabyMetroidCutscene_DeathSequence_return 
    PHX 
    LDX.W #MotherBrainFightSpriteTileTransferEntries_attacks 
    JSR.W ProcessSpriteTilesTransfers 
    PLX 
    BCC Function_BabyMetroidCutscene_DeathSequence_return 
    LDA.W #Function_BabyMetroidCutscene_LetSamusRainbowSomeMore 
    STA.W $0FA8,X 
    LDA.W #$00B0 
    STA.W $0FB2,X ; fallthrough to Function_BabyMetroidCutscene_LetSamusRainbowSomeMore

Function_BabyMetroidCutscene_LetSamusRainbowSomeMore:
    DEC.W $0FB2,X 
    BPL Function_BabyMetroidCutscene_DeathSequence_return 
    LDA.W #Function_BabyMetroidCutscene_FinalCutscene 
    STA.W $0FA8,X 
    LDA.W #$0000 
    STA.L $7E802E ; fallthrough to Function_BabyMetroidCutscene_FinalCutscene

Function_BabyMetroidCutscene_FinalCutscene:
    LDA.L $7E802E 
    INC A 
    STA.L $7E802E 
    DEC A 
    PHX 
    JSL.L FadeInBackgroundForMotherBrainPhase3 
    PLX 
    BCC Function_BabyMetroidCutscene_DeathSequence_return 
    LDA.W #Function_MBBody_Phase3_RecoverFromCutscene_MakeSomeDistance 
    STA.W $0FA8 
    LDA.W #$0017 
    JSL.L Run_Samus_Command 
    LDA.W #$0003 
    JSL.L DrainedSamusController 
    LDA.W $0F86,X 
    ORA.W #$0200 
    STA.W $0F86,X 
    LDA.W #$0000 
    STA.L $7E7854 
    RTS 


HandleSamusRainbowPaletteAnimation:
    LDA.L $7E786C 
    STA.B $12 
    JMP.W ($0012) 


SamusRainbowPaletteFunction_ActivateRainbowWhenEnemyIsLow:
    LDA.W $0F7E,X 
    CLC 
    ADC.W #$0010 
    CMP.W $0AFA 
    BMI .return 
    LDA.W #$0016 
    JSL.L Run_Samus_Command 
    LDA.W #SamusRainbowPaletteFunction_GraduallySlowAnimationDown 
    STA.L $7E786C 

.return:
    RTS 


SamusRainbowPaletteFunction_GraduallySlowAnimationDown:
    LDA.L $7E787A 
    CLC 
    ADC.W #$0300 
    STA.L $7E787A 
    BCC .return 
    LDA.W $0ACE 
    INC A 
    CMP.W #$000A 
    BMI .stillSlowing 
    LDA.W #$000A 

.stillSlowing:
    STA.W $0ACE 

.return:
    RTS 


FadeBabyMetroidCutsceneToBlack:
    LDA.W $0F7E,X 
    CMP.W #$0080 
    BMI .returnNotFaded 
    PHB 
    PEA.W $AD00 
    PLB 
    PLB 
    LDA.L $7E7818,X 
    DEC A 
    BMI .advancePalette 
    STA.L $7E7818,X 
    PLB 

.returnNotFaded:
    CLC 
    RTS 


.advancePalette:
    LDA.W #$0008 
    STA.L $7E7818,X 
    LDA.L $7E781A,X 
    INC A 
    CMP.W #$0007 
    BMI .fadeToBlack 
    PLB 
    SEC 
    RTS 


.fadeToBlack:
    PHX 
    STA.L $7E781A,X 
    ASL A 
    TAX 
    LDY.W BabyMetroidFadingToBlackPalettes,X 
    LDX.W #$01E2 
    LDA.W #$000E 
    JSL.L WriteAColorsFromYtoColorIndexX 
    PLX 
    PLB 
    CLC 
    RTS 


HandleBabyMetroidCutsceneDeathExplosions:
    LDA.L $7E7810,X 
    DEC A 
    BMI .timerExpired 
    STA.L $7E7810,X 
    RTS 


.timerExpired:
    LDA.W #$0004 
    STA.L $7E7810,X 
    LDA.L $7E780E,X 
    INC A 
    CMP.W #$000A 
    BMI + 
    LDA.W #$0000 

  + STA.L $7E780E,X 
    ASL A 
    ASL A 
    TAY 
    LDA.W .XOffsets,Y 
    CLC 
    ADC.W $0F7A,X 
    STA.B $12 
    LDA.W .YOffsets,Y 
    CLC 
    ADC.W $0F7E,X 
    STA.B $14 
    LDA.W #$0003 
    LDY.W #EnemyProjectile_MiscDust 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    LDA.W #$0013 
    JSL.L QueueSound_Lib3_Max3 
    RTS 


.XOffsets:
    dw $FFE8 

.YOffsets:
    dw $FFE8,$FFEC,$0014,$0010,$FFE2,$001E,$FFFD,$000E 
    dw $FFF3,$FFFE,$0012,$FFFE,$FFE0,$FFE1,$0008,$FFFC 
    dw $FFF6,$0013,$0013 

HandleEnemyBlinking:
    LDA.W $0FA4,X 
    AND.W #$0001 
    BEQ .invisible 
    LDA.W $0F86,X 
    AND.W #$FEFF 
    STA.W $0F86,X 
    RTS 


.invisible:
    LDA.W $0F86,X 
    ORA.W #$0100 
    STA.W $0F86,X 
    RTS 


AccelerateBabyMetroidCutsceneDownwards:
    LDA.W $0FAA,X 
    BPL + 
    EOR.W #$FFFF 
    INC A 

  + SEC 
    SBC.W #$0020 
    BPL + 
    LDA.W #$0000 

  + BIT.W $0FAA,X 
    BPL + 
    EOR.W #$FFFF 
    INC A 

  + STA.W $0FAA,X 
    LDA.W $0FAC,X 
    CLC 
    ADC.W #$0002 
    STA.W $0FAC,X 
    RTS 


HandleBabyMetroidCutsceneHealthBasedPalette:
    LDA.L $7E7812,X 
    BEQ .return 
    LDA.W $0F8C,X 
    CMP.W #$0A00 
    BMI .health80 

.return:
    RTS 


.health80:
    LDY.W #$0002 
    CMP.W #$08C0 
    BPL .setPalette 
    LDY.W #$0004 
    CMP.W #$0780 
    BPL .setPalette 
    LDY.W #$0006 
    CMP.W #$0640 
    BPL .setPalette 
    LDY.W #$0008 
    CMP.W #$0500 
    BPL .setPalette 
    LDY.W #$000A 
    CMP.W #$03C0 
    BPL .setPalette 
    LDY.W #$000C 
    CMP.W #$0280 
    BPL .setPalette 
    LDY.W #$000E 

.setPalette:
    PHB 
    PEA.W $AD00 
    PLB 
    PLB 
    PHY 
    LDA.W BabyMetroidHealthBasedPalette_Shell,Y 
    TAY 
    LDX.W #$01E2 
    LDA.W #$0004 
    JSL.L WriteAColorsFromYtoColorIndexX 
    LDX.W #$01F4 
    LDA.W #$0005 
    JSL.L WriteAColorsFromYtoColorIndexX 
    PLY 
    LDA.W BabyMetroidHealthBasedPalette_Innards,Y 
    TAY 
    LDX.W #$01EA 
    LDA.W #$0005 
    JSL.L WriteAColorsFromYtoColorIndexX 
    PLB 
    RTS 


ShakeBabyMetroidCutscene:
    LDA.W $0FAC,X 
    CLC 
    ADC.W #$FFFF 
    STA.W $0FAC,X 
    LDA.W $0FA4,X 
    AND.W #$0006 
    TAY 
    LDA.W ShakingOffsets_X,Y 
    CLC 
    ADC.L $7E7820,X 
    STA.W $0F7A,X 
    LDA.W ShakingOffsets_Y,Y 
    CLC 
    ADC.L $7E7822,X 
    STA.W $0F7E,X 
    RTS 


EnemyTouch_BabyMetroidCutscene:
    LDX.W $0E54 
    LDA.W $0FA8,X 
    CMP.W #Function_BabyMetroidCutscene_LatchOntoSamus 
    BNE .return 
    LDA.W $0AF6 
    STA.B $12 
    LDA.W $0AFA 
    SEC 
    SBC.W #$0014 
    STA.B $14 
    LDA.W #$0010 
    JSR.W AccelerateBabyMetroidTowardsPoint 
    BCC .return 
    STZ.W $0FAA,X 
    STZ.W $0FAC,X 
    LDA.W #Function_BabyMetroidCutscene_HealSamusUpToFullEnergy 
    STA.W $0FA8,X 

.return:
    RTL 


UpdateBabyMetroidCutsceneSpeedAndAngle:
    LDA.B $16 
    CMP.L $7E7816,X 
    BEQ .speedCalculated 
    BPL .notReachedTargedSpeed 
    LDA.L $7E7816,X 
    SEC 
    SBC.W #$0020 
    CMP.B $16 
    BPL .setSpeed 
    LDA.B $16 

.setSpeed:
    STA.L $7E7816,X 
    BRA .speedCalculated 


.notReachedTargedSpeed:
    LDA.L $7E7816,X 
    CLC 
    ADC.W #$0020 
    CMP.B $16 
    BMI ..setSpeed 
    LDA.B $16 

..setSpeed:
    STA.L $7E7816,X 

.speedCalculated:
    LDA.B $12 
    BMI .negativeAngleDelta 
    CLC 
    ADC.L $7E7814,X 
    CMP.B $14 
    BMI .setAngle 
    BRA .maxAngle 


.negativeAngleDelta:
    CLC 
    ADC.L $7E7814,X 
    CMP.B $14 
    BPL .setAngle 

.maxAngle:
    LDA.B $14 

.setAngle:
    STA.L $7E7814,X 
    XBA 
    AND.W #$00FF 
    STA.B $12 
    LDA.L $7E7816,X 
    JSL.L Math_86C26C 
    LDX.W $0E54 
    STA.W $0FAA,X 
    LDA.L $7E7816,X 
    JSL.L Math_86C272 
    LDX.W $0E54 
    STA.W $0FAC,X 
    RTS 


InstList_BabyMetroid_Initial:
    dw $0010 
    dw Spritemap_BabyMetroid_0 
    dw $0010 
    dw Spritemap_BabyMetroid_1 
    dw $0010 
    dw Spritemap_BabyMetroid_2 
    dw $0010 
    dw Spritemap_BabyMetroid_1 
    dw Instruction_BabyMetroid_GotoInitial 

Instruction_BabyMetroid_GotoInitial:
    LDY.W #InstList_BabyMetroid_Initial 
    RTL 


InstList_BabyMetroid_DrainingMotherBrain:
    dw $0008 
    dw Spritemap_BabyMetroid_0 
    dw $0008 
    dw Spritemap_BabyMetroid_1 
    dw $0005 
    dw Spritemap_BabyMetroid_2 
    dw $0002 
    dw Spritemap_BabyMetroid_1 
    dw Instruction_BabyMetroid_GotoDrainingMotherBrain 

Instruction_BabyMetroid_GotoDrainingMotherBrain:
    LDY.W #InstList_BabyMetroid_DrainingMotherBrain 
    RTL 


InstList_BabyMetroid_TookFatalBlow:
    dw $0080 
    dw Spritemap_BabyMetroid_2 
    dw Instruction_CommonA9_Sleep 

ProcessMotherBrainInvincibilityPalette:
    LDA.L $7E7800 
    CMP.W #$0004 
    BNE .return 
    LDA.W $0FDC 
    LSR A 
    BEQ .return 
    BCS .return 
    LDX.W #$001C 

.loop:
    LDA.L $7EC102,X 
    STA.L $7EC122,X 
    STA.L $7EC162,X 
    STA.L $7EC082,X 
    DEX 
    DEX 
    BPL .loop 

.return:
    RTS 


MotherBrainPalette_BeginScreenFlashing:
    LDA.W #InstList_RoomPalette_FirstPhaseEnded 
    STA.L $7E781C 
    LDA.W #$0001 
    STA.L $7E781E 
    RTS 


MotherBrainPalette_EndScreenFlashing:
    LDA.W #$0000 
    STA.L $7E781C 
    STA.L $7E781E 
    LDY.W #RoomPalettes_Phase1Ended_0 
    BRA MotherBrainPalette_WriteRoomPalette 


MotherBrainPalette_HandleRoomPalette:
    LDA.W #$781C 
    JSR.W HandleRoomPaletteInstList 
    BCS MotherBrainPalette_WriteRoomPalette 
    RTS 


MotherBrainPalette_WriteRoomPalette:
    LDX.W #$0068 
    LDA.W #$000C 
    JSL.L WriteAColorsFromYtoColorIndexX 
    PHY 
    LDX.W #$00A6 
    LDA.W #$000C 
    JSL.L WriteAColorsFromYtoColorIndexX 
    PLY 
    LDX.W #$00E6 
    LDA.W #$000C 
    JSL.L WriteAColorsFromYtoColorIndexX 
    RTS 


InstList_RoomPalette_FirstPhaseEnded:
    dw $0002 
    dw RoomPalettes_Phase1Ended_0 
    dw $0002 
    dw RoomPalettes_Phase1Ended_1 
    dw $0002 
    dw RoomPalettes_Phase1Ended_2 
    dw $0002 
    dw RoomPalettes_Phase1Ended_3 
    dw $0002 
    dw RoomPalettes_Phase1Ended_0 
    dw $0002 
    dw RoomPalettes_Phase1Ended_1 
    dw $0002 
    dw RoomPalettes_Phase1Ended_0 
    dw $0002 
    dw RoomPalettes_Phase1Ended_3 
    dw $0002 
    dw RoomPalettes_Phase1Ended_1 
    dw $0002 
    dw RoomPalettes_Phase1Ended_0 
    dw $0002 
    dw RoomPalettes_Phase1Ended_3 
    dw $0002 
    dw RoomPalettes_Phase1Ended_2 
    dw $0002 
    dw RoomPalettes_Phase1Ended_0 
    dw $0002 
    dw RoomPalettes_Phase1Ended_2 
    dw Instruction_MotherBrain_GotoX 
    dw InstList_RoomPalette_FirstPhaseEnded 

RoomPalettes_Phase1Ended_0:
    dw $4A16,$3991,$2D2C,$1CA7,$20E5,$18A4,$1083,$0841 
    dw $0000,$0000,$02DF,$0000,$0802,$5294,$39CE,$2108 
    dw $1084,$0019,$0012,$5C00,$4000,$1084,$197F,$7FFF 

RoomPalettes_Phase1Ended_1:
    dw $4EB9,$4656,$3E12,$31CF,$35EE,$2DCD,$29AC,$258B 
    dw $1D4A,$1D4A,$1F3F,$1D4A,$254C,$3DEF,$2D6B,$18C6 
    dw $0C63,$0013,$000E,$4400,$3000,$0C63,$1517,$5EF7 

RoomPalettes_Phase1Ended_2:
    dw $575C,$4F3A,$4B19,$46D7,$46F6,$46D6,$42D6,$3EB5 
    dw $3EB5,$3EB5,$3F9F,$3EB5,$3EB5,$294A,$1CE7,$1084 
    dw $0842,$000D,$0009,$3000,$2000,$0842,$0CD0,$4210 

RoomPalettes_Phase1Ended_3:
    dw $5BFF,$5BFF,$5BFF,$5BFF,$5BFF,$5BFF,$5BFF,$5BFF 
    dw $5BFF,$5BFF,$5BFF,$5BFF,$5BFF,$14A5,$1084,$0842 
    dw $0421,$0006,$0005,$1800,$1000,$0421,$0868,$2108 

UNSUED_SetInvalidRoomPaletteInstructionList_A9D142:
    LDA.W #MotherBrainPalettes_TransitionToGrey 
    STA.L $7E781C 
    LDA.W #$0001 
    STA.L $7E781E 
    RTS 


UNSUED_SetInvalidRoomPaletteInstructionList_A9D151:
    LDA.W #MotherBrainPalettes_TransitionFromGrey 
    STA.L $7E781C 
    LDA.W #$0001 
    STA.L $7E781E 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_HandleMotherBrainsPalette_A9D160:
    LDA.W #$781C 
    JSR.W HandleRoomPaletteInstList 
    BCC .return 
    PHY 
    LDX.W #$0082 
    LDA.W #$000D 
    JSL.L WriteAColorsFromYtoColorIndexX 
    PLY 
    LDX.W #$0122 
    LDA.W #$000D 
    JSL.L WriteAColorsFromYtoColorIndexX 
    LDX.W #$0168 
    LDA.W #$0005 
    JSL.L WriteAColorsFromYtoColorIndexX 
    LDX.W #$017C 
    LDA.W $0000,Y 
    STA.W $0000,X 

.return:
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


HandleRoomPaletteInstList:
    STA.B $00 
    INC A 
    INC A 
    STA.B $03 
    SEP #$20 
    LDA.B #$7E 
    STA.B $02 
    STA.B $05 
    REP #$20 
    LDA.B [$00] 
    BMI .pointer 
    CLC 
    RTS 


.pointer:
    TAX 
    LDA.W $0000,X 
    BMI .instruction 
    CMP.B [$03] 
    BNE .tick 
    INX 
    INX 
    INX 
    INX 

.loop:
    LDA.W $0000,X 
    BEQ .terminator 
    BPL .specialInstruction 

.instruction:
    STA.B $06 
    INX 
    INX 
    PEA.W .loop-1 
    JMP.W ($0006) 


.specialInstruction:
    LDA.W #$0001 
    STA.B [$03] 
    TXA 
    STA.B [$00] 
    LDY.W $0002,X 
    SEC 
    RTS 


.tick:
    LDA.B [$03] 
    INC A 
    STA.B [$03] 
    LDY.W $0002,X 
    SEC 
    RTS 


.terminator:
    STA.B [$00] 
    STA.B [$03] 
    CLC 
    RTS 


HandleMotherBrainsPalette:
    LDA.L $7E7860 
    BEQ .disabled 
    JSR.W HandleMotherBrainHeadPalette 

.disabled:
    LDA.L $7E7862 
    BEQ .return 
    JSL.L MotherBrainHealthBasedPaletteHandling 

.return:
    RTS 


SetupMotherBrainHeadNormalPalette:
    LDA.W #$000A 
    STA.W $0FB0 
    RTS 


SetupMotherBrainHeadPaletteForChargingHerLaser:
    LDA.W #$0202 
    STA.W $0FB0 
    RTS 


HandleMotherBrainHeadPalette:
    LDA.L $7E7800 
    DEC A 
    BEQ .return 
    SEP #$20 
    LDA.W $0FAF 
    BEQ .zero 
    DEC A 
    STA.W $0FAF 

.return:
    REP #$20 
    RTS 


.zero:
    XBA 
    LDA.W $0FB1 
    TAX 
    LDY.W .pointers,X 
    STY.B $12 
    LDA.W $0FB0 
    STA.W $0FAF 
    LDA.W $0FAE 
    BNE .zeroCounter 
    LDY.W $0FE8 
    CPY.W #Function_MotherBrain_SetupBrainAndNeckToBeDrawn 
    BNE .return 

.zeroCounter:
    INC A 
    AND.B #$07 
    STA.W $0FAE 
    REP #$20 
    AND.W #$00FF 
    ASL A 
    ASL A 
    ASL A 
    ADC.B $12 
    TAY 
    LDX.W #$0122 
    LDA.L $7E781A 
    CMP.W #$0200 
    BEQ + 
    LDX.W #$01E2 

  + LDA.W #$0003 
    JSL.L WriteAColorsFromYtoColorIndexX 
    RTS 


.pointers:
    dw .normalPaletteSet 
    dw .chargingLaserPaletteSet 

.normalPaletteSet:
    dw $2EDF,$019B,$008E,$0006,$269F,$0159,$004C,$0004 
    dw $1E5D,$0117,$000A,$0002,$161B,$00D5,$0008,$0000 
    dw $161B,$00D5,$0008,$0000,$1E5D,$0117,$000A,$0002 
    dw $269F,$0159,$004C,$0004,$2EDF,$019B,$008E,$0006 

.chargingLaserPaletteSet:
    dw $269F,$0159,$004C,$0004,$229F,$0179,$008E,$0067 
    dw $1A9F,$01BA,$00F1,$00CB,$16BF,$01FB,$0153,$012E 
    dw $16BF,$01FB,$0153,$012E,$1A9F,$01BA,$00F1,$00CB 
    dw $229F,$0179,$008E,$0067,$269F,$0159,$004C,$0004 

WriteAColorsFromYtoColorIndexX:
    STA.B $12 

.loop:
    LDA.W $0000,Y 
    STA.L $7EC000,X 
    INX 
    INX 
    INY 
    INY 
    DEC.B $12 
    BNE .loop 
    RTL 


WriteAColorsFromYToTargetColorIndexX:
    STA.B $12 

.loop:
    LDA.W $0000,Y 
    STA.L $7EC200,X 
    INX 
    INX 
    INY 
    INY 
    DEC.B $12 
    BNE .loop 
    RTL 


InitAI_CorpseTorizo:
    PHB 
    PEA.W $7E7E 
    PLB 
    PLB 
    LDA.W #$0000 
    LDX.W #$0FFE 

.loop:
    STA.W $2000,X 
    DEX 
    DEX 
    BPL .loop 
    PLB 
    LDA.W #Function_CorpseTorizo_WaitForSamusCollision 
    STA.W $0FA8 
    LDA.W $0F86 
    ORA.W #$A000 
    STA.W $0F86 
    LDA.W #InstList_CorpseTorizo 
    STA.W $0F92 
    LDA.W #$0001 
    STA.W $0F94 
    STZ.W $0F90 
    LDA.W #$0200 
    STA.W $0F96 
    STZ.W $0FAA 
    LDA.W #$0008 
    STA.W $0FAC 
    LDA.W #$0000 
    STA.L $7E7808 
    LDA.W #$000F 
    STA.L $7E7804 
    LDA.W #$0000 
    STA.L $7E7806 
    LDX.W #$0000 
    LDY.W #CorpseRottingDefinitions_Torizo 
    JSR.W InitializeEnemyCorpseRotting 
    RTL 


MainAI_CorpseTorizo:
    LDA.W $0F86 
    AND.W #$0400 
    BNE .noCollision 
    JSR.W CorpseTorizo_vs_Samus_CollisionDetection 
    BCC .noCollision 
    LDA.W $0F86 
    ORA.W #$0400 
    STA.W $0F86 
    LDA.W #Function_CorpseTorizo_Rotting 
    STA.W $0FA8 

.noCollision:
    LDA.W #EnemyGraphicsDrawnHook_CorpseTorizo>>8&$FF00 
    STA.W $178D 
    LDA.W #EnemyGraphicsDrawnHook_CorpseTorizo 
    STA.W $178C 
    LDX.W #$0000 
    JSR.W ($0FA8,X) 
    JSR.W ProcessCorpseTorizoRottingVRAMTransfers 
    RTL 


EnemyGraphicsDrawnHook_CorpseTorizo:
    STZ.B $16 
    LDA.W #$0128 
    STA.B $12 
    LDA.W #$00BB 
    STA.B $14 
    LDY.W #Spritemaps_CorpseTorizo_SandHeap 
    JSR.W AddSpritemapToOAM_RoomCoordinates 
    RTL 


Function_CorpseTorizo_WaitForSamusCollision:
    CPX.W $182C 
    BEQ .collision 
    CPX.W $182E 
    BEQ .collision 
    CPX.W $1830 
    BEQ .collision 
    CPX.W $1832 
    BNE .return 

.collision:
    LDA.W #Function_CorpseTorizo_PreRotDelay 
    STA.W $0FA8 

.return:
    RTS 


Function_CorpseTorizo_PreRotDelay:
    LDA.L $7E7808 
    INC A 
    STA.L $7E7808 
    CMP.W #$0010 
    BCS .done 
    RTS 


.done:
    LDA.W $0F86 
    ORA.W #$0400 
    STA.W $0F86 
    LDA.W #Function_CorpseTorizo_Rotting 
    STA.W $0FA8 ; fallthrough to Function_CorpseTorizo_Rotting

Function_CorpseTorizo_Rotting:
    LDA.L $7E7806 
    INC A 
    STA.L $7E7806 
    CMP.W #$000F 
    BCC .sandHeapFormed 
    LDA.W #$0000 
    STA.L $7E7806 
    LDA.L $7E7804 
    BEQ .sandHeapFormed 
    JSR.W CopyLineOfSandHeapTileData 
    LDA.L $7E7804 
    DEC A 
    STA.L $7E7804 

.sandHeapFormed:
    LDA.W $0FAC 
    CLC 
    ADC.W #$0001 
    STA.W $0FAC 
    LDX.W #$0000 
    JSL.L MoveEnemyAccordingToVelocity 
    JSR.W ProcessCorpseRotting 
    BCS .return 
    LDA.W #Function_CorpseTorizo_WaitForSamusCollision_return 
    STA.W $0FA8 

.return:
    RTS 


PowerBombReaction_CorpseTorizo:
    LDA.W $0F86 
    AND.W #$0400 
    BEQ EnemyTouch_EnemyShot_CorpseTorizo 
    RTL 


EnemyTouch_EnemyShot_CorpseTorizo:
    LDA.W $0F86 
    ORA.W #$0400 
    STA.W $0F86 
    LDA.W #Function_CorpseTorizo_Rotting 
    STA.W $0FA8 
    RTL 


CorpseTorizo_vs_Samus_CollisionDetection:
    LDA.W $0F7A 
    STA.B $12 
    LDA.W $0F7E 
    STA.B $14 
    LDX.W #HitboxDefinition_CorpseTorizo 
    LDA.W $0000,X 
    BEQ .returnNoCollision 
    STA.B $16 
    INX 
    INX 

.loop:
    LDA.W $0AFA 
    SEC 
    SBC.B $14 
    BPL .SamusBelow 
    EOR.W #$FFFF 
    INC A 
    STA.B $18 
    LDA.W $0002,X 
    BRA .checkY 


.SamusBelow:
    STA.B $18 
    LDA.W $0006,X 

.checkY:
    BPL + 
    EOR.W #$FFFF 
    INC A 

  + CLC 
    ADC.W $0B00 
    SEC 
    SBC.B $18 
    BMI .next 
    LDA.W $0AF6 
    SEC 
    SBC.B $12 
    BPL .SamusToTheRight 
    EOR.W #$FFFF 
    INC A 
    STA.B $18 
    LDA.W $0000,X 
    BRA .checkX 


.SamusToTheRight:
    STA.B $18 
    LDA.W $0004,X 

.checkX:
    BPL + 
    EOR.W #$FFFF 
    INC A 

  + CLC 
    ADC.W $0AFE 
    SEC 
    SBC.B $18 
    BPL .collision 

.next:
    DEC.B $16 
    BEQ .returnNoCollision 
    TXA 
    CLC 
    ADC.W #$0008 
    TAX 
    JMP.W .loop 


.returnNoCollision:
    CLC 
    RTS 


.collision:
    CMP.W #$0004 
    BPL .min4 
    LDA.W #$0004 

.min4:
    STA.W $0B58 
    LDA.W #$0004 
    STA.W $0B5C 
    STZ.W $0B56 
    STZ.W $0B5A 
    SEC 
    RTS 


ProcessCorpseTorizoRottingVRAMTransfers:
    LDA.L $7E7800 
    INC A 
    STA.L $7E7800 
    LSR A 
    BCS .odd 
    LDX.W #$0000 
    LDY.W $0330 
    LDA.W .size0,X 

.loopEven:
    STA.W $00D0,Y 
    LDA.W .bank0,X 
    STA.W $00D3,Y 
    LDA.W .src0,X 
    STA.W $00D2,Y 
    LDA.W .dest0,X 
    STA.W $00D5,Y 
    TYA 
    CLC 
    ADC.W #$0007 
    TAY 
    TXA 
    ADC.W #$0008 
    TAX 
    LDA.W .size0,X 
    BNE .loopEven 
    STA.L $7E8004 
    TYA 
    STA.W $0330 
    RTS 


.odd:
    LDX.W #$0000 
    LDY.W $0330 
    LDA.W .size1,X 

.loopOdd:
    STA.W $00D0,Y 
    LDA.W .bank1,X 
    STA.W $00D3,Y 
    LDA.W .src1,X 
    STA.W $00D2,Y 
    LDA.W .dest1,X 
    STA.W $00D5,Y 
    TYA 
    CLC 
    ADC.W #$0007 
    TAY 
    TXA 
    ADC.W #$0008 
    TAX 
    LDA.W .size1,X 
    BNE .loopOdd 
    STA.L $7E8004 
    TYA 
    STA.W $0330 
    RTS 


.size0:
    dw $00C0 

.bank0:
    dw $7E00 

.src0:
    dw $2060 

.dest0:
    dw $7090,$00C0,$7E00,$21A0,$7190,$0100,$7E00,$22C0 
    dw $7280,$0100,$7E00,$2400,$7380,$0100,$7E00,$2540 
    dw $7480,$0100,$7E00,$2680,$7580,$0120,$7E00,$9620 
    dw $7100,$0000 

.size1:
    dw $0100 

.bank1:
    dw $7E00 

.src1:
    dw $27C0 

.dest1:
    dw $7680,$0100,$7E00,$2900,$7780,$0100,$7E00,$2A40 
    dw $7880,$0120,$7E00,$2B60,$7970,$0140,$7E00,$2C80 
    dw $7A60,$0140,$7E00,$2DC0,$7B60,$0100,$7E00,$9500 
    dw $7000,$0000 

CorpseRottingRotEntryFinishedHook_CorpseTorizo:
    PHX 
    LDA.W $05E5 
    AND.W #$001F 
    CLC 
    ADC.W #$0110 
    STA.B $12 
    LDA.W #$00BC 
    STA.B $14 
    LDA.W #$000A 
    LDY.W #EnemyProjectile_MiscDust 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    LDA.W $0E44 
    AND.W #$0007 
    BNE .return 
    LDA.W #$0010 
    JSL.L QueueSound_Lib2_Max6 

.return:
    PLX 
    RTS 


CopyLineOfSandHeapTileData:
    ASL A 
    PHA 
    TAX 
    LDA.W .destOffsets,X 
    TAY 
    PLX 
    LDA.W .srcOffsets,X 
    TAX 
    PHB 
    PEA.W $7E7E 
    PLB 
    PLB 
    LDA.L Tiles_CorpseTorizo,X 
    STA.W $9500,Y 
    LDA.L Tiles_CorpseTorizo+$10,X 
    STA.W $9510,Y 
    LDA.L Tiles_CorpseTorizo+$20,X 
    STA.W $9520,Y 
    LDA.L Tiles_CorpseTorizo+$30,X 
    STA.W $9530,Y 
    LDA.L Tiles_CorpseTorizo+$40,X 
    STA.W $9540,Y 
    LDA.L Tiles_CorpseTorizo+$50,X 
    STA.W $9550,Y 
    LDA.L Tiles_CorpseTorizo+$60,X 
    STA.W $9560,Y 
    LDA.L Tiles_CorpseTorizo+$70,X 
    STA.W $9570,Y 
    LDA.L Tiles_CorpseTorizo+$80,X 
    STA.W $9580,Y 
    LDA.L Tiles_CorpseTorizo+$90,X 
    STA.W $9590,Y 
    LDA.L Tiles_CorpseTorizo+$A0,X 
    STA.W $95A0,Y 
    LDA.L Tiles_CorpseTorizo+$B0,X 
    STA.W $95B0,Y 
    LDA.L Tiles_CorpseTorizo+$C0,X 
    STA.W $95C0,Y 
    LDA.L Tiles_CorpseTorizo+$D0,X 
    STA.W $95D0,Y 
    LDA.L Tiles_CorpseTorizo+$E0,X 
    STA.W $95E0,Y 
    LDA.L Tiles_CorpseTorizo+$F0,X 
    STA.W $95F0,Y 
    LDA.L Tiles_CorpseTorizo+$100,X 
    STA.W $9600,Y 
    LDA.L Tiles_CorpseTorizo+$110,X 
    STA.W $9610,Y 
    PLB 
    RTS 


.destOffsets:
    dw $0000,$0002,$0004,$0006,$0008,$000A,$000C,$000E 
    dw $0120,$0122,$0124,$0126,$0128,$012A,$012C,$012E 

.srcOffsets:
    dw $0000,$0002,$0004,$0006,$0008,$000A,$000C,$000E 
    dw $0200,$0202,$0204,$0206,$0208,$020A,$020C,$020E 

Palette_CorpseTorizo:
    dw $3800,$4F38,$3A52,$0CA5,$0042,$42D5,$2DEF,$218B 
    dw $1528,$4F38,$42B4,$3631,$29CD,$1949,$0CC6,$0042 

InstList_CorpseTorizo:
    dw $0001 
    dw Spritemaps_CorpseTorizo 
    dw Instruction_Common_Sleep 

Spritemaps_CorpseTorizo:
    dw $0019,$01E8 
    db $14 
    dw $2397,$C218 
    db $CC 
    dw $230D,$C208 
    db $CC 
    dw $230B,$C3F8 
    db $CC 
    dw $2309,$C220 
    db $DC 
    dw $232E,$C210 
    db $DC 
    dw $232C,$C200 
    db $DC 
    dw $232A,$C3F0 
    db $DC 
    dw $2328,$C220 
    db $EC 
    dw $234E,$C210 
    db $EC 
    dw $234C,$C200 
    db $EC 
    dw $234A,$C3F0 
    db $EC 
    dw $2348,$C220 
    db $FC 
    dw $236E,$C210 
    db $FC 
    dw $236C,$C200 
    db $FC 
    dw $236A,$C3F0 
    db $FC 
    dw $2368,$C220 
    db $0C 
    dw $238E,$C210 
    db $0C 
    dw $238C,$C200 
    db $0C 
    dw $238A,$C3F0 
    db $0C 
    dw $2388,$C220 
    db $1C 
    dw $23AE,$C210 
    db $1C 
    dw $23AC,$C200 
    db $1C 
    dw $23AA,$C3F0 
    db $1C 
    dw $23A8,$C3E0 
    db $1C 
    dw $23A6 

Spritemaps_CorpseTorizo_SandHeap:
    dw $0005,$0018 
    db $FE 
    dw $2318,$C208 
    db $F6 
    dw $2306,$C3F8 
    db $F6 
    dw $2304,$C3E8 
    db $F6 
    dw $2302,$C3D8 
    db $F6 
    dw $2300 

HitboxDefinition_CorpseTorizo:
    dw $0007,$FFE1,$0025,$FFF5,$002B,$0010,$0025,$0026 
    dw $002B,$FFE8,$0012,$FFF3,$0024,$000B,$001A,$0019 
    dw $0024,$FFF6,$FFE2,$0010,$0018,$FFF9,$FFD4,$0022 
    dw $FFE1,$0011,$FFE1,$0028,$FFF9 

InitAI_CorpseSidehopper:
    LDX.W $0E54 
    LDA.W $0FB4,X 
    TAX 
    JMP.W (.pointers,X) 


.pointers:
    dw CorpseSidehopperInit_Param1_0_InitiallyAlive 
    dw CorpseSidehopperInit_Param1_2_InitiallyDead 

CorpseSidehopperInit_Param1_0_InitiallyAlive:
    LDX.W $0E54 
    LDA.W $0F86,X 
    AND.W #$7FFF 
    ORA.W #$0800 
    STA.W $0F86,X 
    LDA.W $0F86 
    AND.W #$0100 
    BEQ .visible 
    LDA.W $0F86,X 
    ORA.W #$0200 
    STA.W $0F86,X 

.visible:
    LDA.W #$0000 
    STA.L $7E7810,X 
    LDA.W #$0060 
    STA.L $7E7814,X 
    LDA.W #$0100 
    STA.L $7E7816,X 
    LDA.W #$01E8 
    STA.W $0F7A,X 
    LDA.W #$00B8 
    STA.W $0F7E,X 
    LDA.W #Function_CorpseSidehopper_Alive_WaitingForActivation 
    STA.W $0FA8,X 
    LDA.W #$0200 
    STA.W $0F96,X 
    LDA.W #$0015 
    STA.W $0F84,X 
    LDA.W #InstList_CorpseSidehopper_Alive_Idle 
    JSL.L SetEnemyInstList 
    LDY.W #CorpseRottingDefinitions_Sidehopper_Param1_0 
    JSR.W InitializeEnemyCorpseRotting 
    RTL 


CorpseSidehopperInit_Param1_2_InitiallyDead:
    LDX.W $0E54 
    LDA.W #$FFFF 
    STA.L $7E7810,X 
    LDA.W #Function_CorpseSidehopper_Dead_WaitForSamusCollision 
    STA.W $0FA8,X 
    LDA.W #$0E00 
    STA.W $0F96,X 
    LDA.W #InstList_CorpseSidehopper_Alive_Dead 
    JSL.L SetEnemyInstList 
    LDY.W #CorpseRottingDefinitions_Sidehopper_Param1_2 
    JSR.W InitializeEnemyCorpseRotting 
    RTL 


InitAI_CorpseZoomer:
    LDX.W $0E54 
    LDA.W #$0E00 
    STA.W $0F96,X 
    LDA.W #Function_CorpseZoomer_WaitForSamusCollision 
    STA.W $0FA8,X 
    LDY.W $0FB4,X 
    LDA.W .instListPointers,Y 
    JSL.L SetEnemyInstList 
    LDA.W .corpseRottingDefinitionPointers,Y 
    TAY 
    JSR.W InitializeEnemyCorpseRotting 
    RTL 


.instListPointers:
    dw InstList_CorpseZoomer_Param1_0 
    dw InstList_CorpseZoomer_Param1_2 
    dw InstList_CorpseZoomer_Param1_4 

.corpseRottingDefinitionPointers:
    dw CorpseRottingDefinitions_Zoomer_Param1_0 
    dw CorpseRottingDefinitions_Zoomer_Param1_2 
    dw CorpseRottingDefinitions_Zoomer_Param1_4 

InitAI_CorpseRipper:
    LDX.W $0E54 
    LDA.W #$0E00 
    STA.W $0F96,X 
    LDA.W #Function_CorpseRipper_WaitForSamusCollision 
    STA.W $0FA8,X 
    LDY.W $0FB4,X 
    LDA.W .instListPointers,Y 
    JSL.L SetEnemyInstList 
    LDA.W .corpseRottingDefinitionPointers,Y 
    TAY 
    JSR.W InitializeEnemyCorpseRotting 
    RTL 


.instListPointers:
    dw InstList_CorpseRipper_Param1_0 
    dw InstList_CorpseRipper_Param1_2 

.corpseRottingDefinitionPointers:
    dw CorpseRottingDefinitions_Ripper_Param1_0 
    dw CorpseRottingDefinitions_Ripper_Param1_2 

InitAI_CorpseSkree:
    LDX.W $0E54 
    LDA.W #$0E00 
    STA.W $0F96,X 
    LDA.W #Function_CorpseSkree_WaitForSamusCollision 
    STA.W $0FA8,X 
    LDY.W $0FB4,X 
    LDA.W .instListPointers,Y 
    JSL.L SetEnemyInstList 
    LDA.W .corpseRottingDefinitionPointers,Y 
    TAY 
    JSR.W InitializeEnemyCorpseRotting 
    RTL 


.instListPointers:
    dw InstList_CorpseSkree_Param1_0 
    dw InstList_CorpseSkree_Param1_2 
    dw InstList_CorpseSkree_Param1_4 

.corpseRottingDefinitionPointers:
    dw CorpseRottingDefinitions_Skree_Param1_0 
    dw CorpseRottingDefinitions_Skree_Param1_2 
    dw CorpseRottingDefinitions_Skree_Param1_4 

PowerBombReaction_CorpseSidehopper:
    LDX.W $0E54 
    LDA.L $7E7810,X 
    CMP.W #$0008 
    BCC MainAI_HurtAI_CorpseEnemies 
    JMP.W EnemyShot_CorpseSidehopper 


MainAI_HurtAI_CorpseEnemies:
    LDX.W $0E54 
    JSR.W ($0FA8,X) 
    RTL 


Function_CorpseSidehopper_Alive_WaitingForActivation:
    LDA.W $0911 
    CMP.W #$0201 
    BMI .activate 
    RTS 


.activate:
    LDA.W #Function_CorpseSidehopper_Hopping 
    STA.W $0FA8,X ; fallthrough to Function_CorpseSidehopper_Hopping

Function_CorpseSidehopper_Hopping:
    JSR.W CorpseSidehopperMovement 
    BCC .return 
    LDA.L $7E780C,X 
    INC A 
    AND.W #$0003 
    STA.L $7E780C,X 
    LDA.W #InstList_CorpseSidehopper_Alive_Hopping 
    JSL.L SetEnemyInstList 
    LDA.W #.return 
    STA.W $0FA8,X 

.return:
    RTS 


Function_CorpseSidehopper_StartIdling:
    LDA.W #Function_CorpseSidehopper_Idling 
    STA.W $0FA8,X 
    LDA.W #$0040 
    STA.W $0FB2,X 
    RTS 


Function_CorpseSidehopper_Idling:
    DEC.W $0FB2,X 
    BPL .return 
    LDA.L $7E7810,X 
    BEQ .notDone 
    LDA.W #Function_CorpseSidehopper_BeingDrained 
    STA.W $0FA8,X 
    RTS 


.notDone:
    LDA.W #Function_CorpseSidehopper_Hopping 
    STA.W $0FA8,X 
    LDA.W #InstList_CorpseSidehopper_Alive_Idle 
    JSL.L SetEnemyInstList 
    LDA.L $7E780C,X 
    ASL A 
    TAY 
    LDA.W .YVelocity,Y 
    STA.L $7E7816,X 
    LDA.W .XVelocity,Y 
    STA.L $7E7814,X 

.return:
    RTS 


.YVelocity:
    dw $FE00,$FE00,$FE00,$FC00 

.XVelocity:
    dw $01C0,$0120,$0120,$0300 

CorpseSidehopperMovement:
    LDA.L $7E7814,X 
    JSR.W CorpseSidehopperMovement_Horizontal 
    LDY.W #$0020 
    LDA.L $7E7816,X 
    BMI .rising 
    LDY.W #$0080 

.rising:
    TYA 
    CLC 
    ADC.L $7E7816,X 
    STA.L $7E7816,X 
    STA.B $12 
    LDA.W $0F7A,X 
    CMP.W #$0220 
    BMI .lessThan220 
    LDA.B $12 
    SEP #$20 
    STA.B $13 
    STZ.B $12 
    REP #$20 
    AND.W #$FF00 
    BPL + 
    ORA.W #$00FF 

  + XBA 
    STA.B $14 
    JSL.L MoveEnemyDownBy_14_12 
    RTS 


.lessThan220:
    LDA.B $12 
    SEP #$20 
    CLC 
    ADC.W $0F81,X 
    STA.W $0F81,X 
    REP #$20 
    AND.W #$FF00 
    XBA 
    BPL + 
    ORA.W #$FF00 

  + ADC.W $0F7E,X 
    STA.W $0F7E,X 
    CMP.W #$00B8 
    BMI .lessThanB8 
    SEC 
    RTS 


.lessThanB8:
    CLC 
    RTS 


CorpseSidehopperMovement_Horizontal:
    STA.B $12 
    LDA.W $0F7A,X 
    CMP.W #$0220 
    BMI .lessThan220 
    LDA.B $12 
    SEP #$20 
    STA.B $13 
    STZ.B $12 
    REP #$20 
    AND.W #$FF00 
    BPL + 
    ORA.W #$00FF 

  + XBA 
    STA.B $14 
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes 
    RTS 


.lessThan220:
    LDA.B $12 
    SEP #$20 
    CLC 
    ADC.W $0F7D,X 
    STA.W $0F7D,X 
    REP #$20 
    AND.W #$FF00 
    XBA 
    BPL + 
    ORA.W #$FF00 

  + ADC.W $0F7A,X 
    STA.W $0F7A,X 
    RTS 


Function_CorpseSidehopper_BeingDrained:
    LDA.L $7E780E,X 
    INC A 
    STA.L $7E780E,X 
    CMP.W #$0008 
    BCC .return 
    LDA.W #$0000 
    STA.L $7E780E,X 
    LDA.L $7E7810,X 
    DEC A 
    ASL A 
    ASL A 
    ASL A 
    ASL A 
    ASL A 
    ADC.W #Palette_SidehopperCorpseBeingDrained_0 
    TAY 
    LDX.W #$0122 
    LDA.W #$000F 
    JSL.L WriteAColorsFromYtoColorIndexX 
    LDX.W $0E54 
    LDA.L $7E7810,X 
    INC A 
    STA.L $7E7810,X 
    CMP.W #$0008 
    BCC .return 
    LDA.W #InstList_CorpseSidehopper_Alive_Corpse 
    JSL.L SetEnemyInstList 
    LDA.W #Function_CorpseSidehopper_Dead_WaitForSamusCollision 
    STA.W $0FA8,X 
    LDA.W $0F86,X 
    ORA.W #$8000 
    STA.W $0F86,X 
    LDA.W #$000C 
    STA.W $0F84,X 

.return:
    RTS 


RTS_A9DA63:
    RTS 


Function_CorpseSidehopper_Dead_WaitForSamusCollision:
    LDY.W #Function_CorpseSidehopper_PreRotDelay 
    BRA CorpseCommonAI_WaitForSamusCollision 


Function_CorpseZoomer_WaitForSamusCollision:
    LDY.W #Function_CorpseZoomer_PreRotDelay 
    BRA CorpseCommonAI_WaitForSamusCollision 


Function_CorpseSkree_WaitForSamusCollision:
    LDY.W #Function_CorpseSkree_PreRotDelay 
    BRA CorpseCommonAI_WaitForSamusCollision 


Function_CorpseRipper_WaitForSamusCollision:
    LDY.W #Function_CorpseRipper_PreRotDelay 

CorpseCommonAI_WaitForSamusCollision:
    CPX.W $182C 
    BEQ .collision 
    CPX.W $182E 
    BEQ .collision 
    CPX.W $1830 
    BEQ .collision 
    CPX.W $1832 
    BNE .return 

.collision:
    TYA 
    STA.W $0FA8,X 

.return:
    RTS 


Function_CorpseSidehopper_PreRotDelay:
    LDY.W #Function_CorpseSidehopper_Rotting 
    BRA CorpseCommonAI_PreRotDelay 


Function_CorpseZoomer_PreRotDelay:
    LDY.W #Function_CorpseZoomer_Rotting 
    BRA CorpseCommonAI_PreRotDelay 


Function_CorpseRipper_PreRotDelay:
    LDY.W #Function_CorpseRipper_Rotting 
    BRA CorpseCommonAI_PreRotDelay 


Function_CorpseSkree_PreRotDelay:
    LDY.W #Function_CorpseSkree_Rotting 

CorpseCommonAI_PreRotDelay:
    INC.W $0FAA,X 
    LDA.W $0FAA,X 
    CMP.W #$0010 
    BCC .return 
    TYA 
    STA.W $0FA8,X 
    LDA.W $0F86,X 
    ORA.W #$0400 
    STA.W $0F86,X 

.return:
    RTS 


Function_CorpseSidehopper_Rotting:
    JSR.W ProcessCorpseRotting 
    LDX.W $0E54 
    BCS .process 
    LDA.W #Function_CorpseSidehopper_Dead_WaitForSamusCollision 
    STA.W $0FA8,X 

.process:
    LDA.L $7E8826,X 
    TAX 
    JMP.W ProcessCorpseRottingVRAMTransfers 


Function_CorpseZoomer_Rotting:
    JSR.W ProcessCorpseRotting 
    LDX.W $0E54 
    BCS .process 
    LDA.W #RTS_A9DA63 
    STA.W $0FA8,X 

.process:
    LDA.L $7E8826,X 
    TAX 
    JMP.W ProcessCorpseRottingVRAMTransfers 


Function_CorpseRipper_Rotting:
    JSR.W ProcessCorpseRotting 
    LDX.W $0E54 
    BCS .process 
    LDA.W #RTS_A9DA63 
    STA.W $0FA8,X 

.process:
    LDA.L $7E8826,X 
    TAX 
    JMP.W ProcessCorpseRottingVRAMTransfers 


Function_CorpseSkree_Rotting:
    JSR.W ProcessCorpseRotting 
    LDX.W $0E54 
    BCS .process 
    LDA.W #RTS_A9DA63 
    STA.W $0FA8,X 

.process:
    LDA.L $7E8826,X 
    TAX 
    JMP.W ProcessCorpseRottingVRAMTransfers 


ProcessCorpseRotting:
    PHB 
    PEA.W $7E7E 
    PLB 
    PLB 
    LDA.W $882E,X 
    STA.W $880A 
    LDA.W $8830,X 
    STA.W $880C 
    LDA.W $8832,X 
    STA.W $880E 
    LDA.W $8834,X 
    STA.W $8810 
    LDA.W $8836,X 
    STA.W $8812 
    LDA.W $882C,X 
    STA.W $8808 
    LDA.W $8828,X 
    STA.W $8804 
    LDA.W $882A,X 
    STA.W $8806 
    LDA.W $8824,X 
    TAX 
    LDA.W #$0000 

.loop:
    PHA 
    LDA.W $0000,X 
    BMI .next 
    LDA.W $0002,X 
    BEQ .timerExpired 
    DEC A 
    STA.W $0002,X 
    CMP.W #$0004 
    BCS .next 
    LDA.W $8804 
    STA.B $12 
    LDA.B $01,S 
    CMP.W $880E 
    BCC + 
    LDA.W $8806 
    STA.B $12 

  + LDA.W $8808 
    STA.B $14 
    LDA.W #$00A9 
    STA.B $16 
    PHX 
    LDA.W $0000,X 
    JSR.W CopMoveCorpseRottingRotEntry 
    PLX 
    BRA .next 


.timerExpired:
    PHX 
    LDA.W $8806 
    STA.B $12 
    LDA.W $8808 
    STA.B $14 
    LDA.W #$00A9 
    STA.B $16 
    LDA.W $0000,X 
    JSR.W CopMoveCorpseRottingRotEntry 
    PLX 
    LDA.W $0000,X 
    CLC 
    ADC.W #$0002 
    CMP.W $880C 
    BCC .store 
    LDA.W $8812 
    STA.B $12 
    PHK 
    PLB 
    PEA.W .manualReturn-1 
    JMP.W ($0012) 


.manualReturn:
    PEA.W $7E7E 
    PLB 
    PLB 
    LDA.B $01,S 
    CMP.W $880C 
    BCS .returnFinishedRotting 
    LDA.W #$FFFF 

.store:
    STA.W $0000,X 

.next:
    TXA 
    CLC 
    ADC.W #$0004 
    TAX 
    PLA 
    INC A 
    CMP.W $880A 
    BPL .returnNotFinished 
    JMP.W .loop 


.returnNotFinished:
    PLB 
    RTS 


.returnFinishedRotting:
    PLA 
    PLB 
    CLC 
    RTS 


CopMoveCorpseRottingRotEntry:
    STA.W $8802 
    TAY 
    AND.W #$FFF8 
    LSR #2TAX 
    TYA 
    AND.W #$0007 
    CMP.W #$0006 
    BCS .greaterThan5 
    TXY 
    ASL A 
    ADC.B [$14],Y 
    TAX 
    TAY 
    JMP.W ($0012) 


.greaterThan5:
    TXY 
    ASL A 
    ADC.B [$14],Y 
    TAX 
    ADC.W $8810 
    TAY 
    JMP.W ($0012) 


CorpseRotEntryFinishedHook_Normal:
    PHX 
    LDA.W $05E5 
    AND.W #$001A 
    LDX.W $0E54 
    CLC 
    ADC.W $0F7A,X 
    CLC 
    ADC.W #$FFF2 
    STA.B $12 
    LDA.W $0F7E,X 
    CLC 
    ADC.W #$0010 
    STA.B $14 
    LDA.W #$000A 
    LDY.W #EnemyProjectile_MiscDust 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    LDA.W $0E44 
    AND.W #$0007 
    BNE .return 
    LDA.W #$0010 
    JSL.L QueueSound_Lib2_Max3 

.return:
    PLX 
    RTS 


InitializeCorpseRottingDataTable:
    DEC A 
    STZ.B $12 

.loop:
    PHA 
    STA.L $7E0000,X 
    LDA.B $12 
    INX 
    INX 
    STA.L $7E0000,X 
    INX 
    INX 
    LDA.B $12 
    CLC 
    ADC.W #$0002 
    STA.B $12 
    PLA 
    DEC A 
    BPL .loop 
    RTS 


InitializeEnemyCorpseRotting:
    LDA.W $0000,Y 
    STA.L $7E8824,X 
    LDA.W $0002,Y 
    STA.L $7E8826,X 
    LDA.W $0004,Y 
    STA.L $7E8828,X 
    LDA.W $0006,Y 
    STA.L $7E882A,X 
    LDA.W $000E,Y 
    STA.L $7E8836,X 
    LDA.W $000C,Y 
    STA.L $7E882C,X 
    PHY 
    TAY 
    LDA.W $0002,Y 
    SEC 
    SBC.W #$000C 
    STA.L $7E8834,X 
    PLY 
    LDA.W $0008,Y 
    STA.L $7E882E,X 
    DEC A 
    STA.L $7E8830,X 
    DEC A 
    STA.L $7E8832,X 
    LDX.W $0000,Y 
    LDA.W $0008,Y 
    JSR.W InitializeCorpseRottingDataTable 
    LDA.W $000A,Y 
    STA.B $12 
    JMP.W ($0012) 


ProcessCorpseRottingVRAMTransfers:
    LDY.W $0330 
    LDA.W $0000,X 

.loop:
    STA.W $00D0,Y 
    LDA.W $0002,X 
    STA.W $00D3,Y 
    LDA.W $0004,X 
    STA.W $00D2,Y 
    LDA.W $0006,X 
    STA.W $00D5,Y 
    TYA 
    CLC 
    ADC.W #$0007 
    TAY 
    TXA 
    ADC.W #$0008 
    TAX 
    LDA.W $0000,X 
    BNE .loop 
    STA.L $7E8004 
    TYA 
    STA.W $0330 
    RTS 


PowerBombReaction_CorpseZoomer:
    LDX.W $0E54 
    LDA.W $0F86,X 
    AND.W #$0400 
    BNE CorpseCommonContactReaction_return 

EnemyTouch_EnemyShot_CorpseZoomer:
    LDA.W #Function_CorpseZoomer_Rotting 
    BRA CorpseCommonContactReaction 


PowerBombReaction_CorpseRipper:
    LDX.W $0E54 
    LDA.W $0F86,X 
    AND.W #$0400 
    BNE CorpseCommonContactReaction_return 

EnemyTouch_EnemyShot_CorpseRipper:
    LDA.W #Function_CorpseRipper_Rotting 
    BRA CorpseCommonContactReaction 


PowerBombReaction_CorpseSkree:
    LDX.W $0E54 
    LDA.W $0F86,X 
    AND.W #$0400 
    BNE CorpseCommonContactReaction_return 

EnemyTouch_EnemyShot_CorpseSkree:
    LDA.W #Function_CorpseSkree_Rotting 
    BRA CorpseCommonContactReaction 


EnemyShot_CorpseSidehopper:
    LDX.W $0E54 
    LDA.W $0F86,X 
    AND.W #$0400 
    BNE CorpseCommonContactReaction_return 
    LDA.L $7E7810,X 
    CMP.W #$0008 
    BCC CorpseCommonContactReaction_return 

CorpseSidehopperContactReaction_Rottable:
    LDA.W #Function_CorpseSidehopper_Rotting 

CorpseCommonContactReaction:
    LDX.W $0E54 
    STA.W $0FA8,X 
    LDA.W $0F86,X 
    ORA.W #$0C00 
    STA.W $0F86,X 

CorpseCommonContactReaction_return:
    RTL 


EnemyTouch_CorpseSidehopper:
    LDX.W $0E54 
    LDA.L $7E7810,X 
    CMP.W #$0008 
    BCS CorpseSidehopperContactReaction_Rottable 
    LDX.W $0E54 
    JSL.L NormalEnemyTouchAI_NoDeathCheck_External 
    RTL 


CorpseRottingDefinitions_Torizo:
  .rotTablePointer
    dw $9000 
  .VRAMTransferPointer
    dw $0000 
  .rotEntryCopyFunction
    dw CorpseRottingRotEntry_Copy_Torizo 
  .rotEntryMoveFunction
    dw CorpseRottingRotEntry_Move_Torizo 
  .height
    dw $0060 
  .initFunctionPointer
    dw CorpseRottingInit_Torizo 
  .tileDataRowOffsetsPointer
    dw CorpseRottingTileRowOffsets_Torizo 
  .rotEntryFinishedHook
    dw CorpseRottingRotEntryFinishedHook_CorpseTorizo 

CorpseRottingDefinitions_Sidehopper_Param1_0:
    dw $9000 
    dw CorpseRottingVRAMTransferDefinitions_Sidehopper_Param1_0 
    dw CorpseRottingRotEntry_Copy_Sidehopper_Param1_0 
    dw CorpseRottingRotEntry_Move_Sidehopper_Param1_0 
    dw $0028 
    dw CorpseRottingInit_Sidehopper_Param1_0 
    dw CorpseRottingTileRowOffsets_Sidehopper 
    dw CorpseRotEntryFinishedHook_Normal 

CorpseRottingDefinitions_Sidehopper_Param1_2:
    dw $90A0 
    dw CorpseRottingVRAMTransferDefinitions_Sidehopper_Param1_2 
    dw CorpseRottingRotEntry_Copy_Sidehopper_Param1_2 
    dw CorpseRottingRotEntry_Move_Sidehopper_Param1_2 
    dw $0028 
    dw CorpseRottingInit_Sidehopper_Param1_2 
    dw CorpseRottingTileRowOffsets_Sidehopper 
    dw CorpseRotEntryFinishedHook_Normal 

CorpseRottingDefinitions_Zoomer_Param1_0:
    dw $92C0 
    dw CorpseRottingVRAMTransferDefinitions_Zoomer_Param1_0 
    dw CorpseRottingRotEntry_Copy_Zoomer_Param1_0 
    dw CorpseRottingRotEntry_Move_Zoomer_Param1_0 
    dw $0010 
    dw CorpseRottingInit_Zoomer_Param1_0 
    dw CorpseRottingTileRowOffsets_Zoomer 
    dw CorpseRotEntryFinishedHook_Normal 

CorpseRottingDefinitions_Zoomer_Param1_2:
    dw $9300 
    dw CorpseRottingVRAMTransferDefinitions_Zoomer_Param1_2 
    dw CorpseRottingRotEntry_Copy_Zoomer_Param1_2 
    dw CorpseRottingRotEntry_Move_Zoomer_Param1_2 
    dw $0010 
    dw CorpseRottingInit_Zoomer_Param1_2 
    dw CorpseRottingTileRowOffsets_Zoomer 
    dw CorpseRotEntryFinishedHook_Normal 

CorpseRottingDefinitions_Zoomer_Param1_4:
    dw $9340 
    dw CorpseRottingVRAMTransferDefinitions_Zoomer_Param1_4 
    dw CorpseRottingRotEntry_Copy_Zoomer_Param1_4 
    dw CorpseRottingRotEntry_Move_Zoomer_Param1_4 
    dw $0010 
    dw CorpseRottingInit_Zoomer_Param1_4 
    dw CorpseRottingTileRowOffsets_Zoomer 
    dw CorpseRotEntryFinishedHook_Normal 

CorpseRottingDefinitions_Ripper_Param1_0:
    dw $9380 
    dw CorpseRottingVRAMTransferDefinitions_Ripper_Param1_0 
    dw CorpseRottingRotEntry_Copy_Ripper_Param1_0 
    dw CorpseRottingRotEntry_Move_Ripper_Param1_0 
    dw $0010 
    dw CorpseRottingInit_Ripper_Param1_0 
    dw CorpseRottingTileRowOffsets_Ripper 
    dw CorpseRotEntryFinishedHook_Normal 

CorpseRottingDefinitions_Ripper_Param1_2:
    dw $93C0 
    dw CorpseRottingVRAMTransferDefinitions_Ripper_Param1_2 
    dw CorpseRottingRotEntry_Copy_Ripper_Param1_2 
    dw CorpseRottingRotEntry_Move_Ripper_Param1_2 
    dw $0010 
    dw CorpseRottingInit_Ripper_Param1_2 
    dw CorpseRottingTileRowOffsets_Ripper 
    dw CorpseRotEntryFinishedHook_Normal 

CorpseRottingDefinitions_Skree_Param1_0:
    dw $9140 
    dw CorpseRottingVRAMTransferDefinitions_Skree_Param1_0 
    dw CorpseRottingRotEntry_Copy_Skree_Param1_0 
    dw CorpseRottingRotEntry_Move_Skree_Param1_0 
    dw $0020 
    dw CorpseRottingInit_Skree_Param1_0 
    dw CorpseRottingTileRowOffsets_Skree 
    dw CorpseRotEntryFinishedHook_Normal 

CorpseRottingDefinitions_Skree_Param1_2:
    dw $91C0 
    dw CorpseRottingVRAMTransferDefinitions_Skree_Param1_2 
    dw CorpseRottingRotEntry_Copy_Skree_Param1_2 
    dw CorpseRottingRotEntry_Move_Skree_Param1_2 
    dw $0020 
    dw CorpseRottingInit_Skree_Param1_2 
    dw CorpseRottingTileRowOffsets_Skree 
    dw CorpseRotEntryFinishedHook_Normal 

CorpseRottingDefinitions_Skree_Param1_4:
    dw $9240 
    dw CorpseRottingVRAMTransferDefinitions_Skree_Param1_4 
    dw CorpseRottingRotEntry_Copy_Skree_Param1_4 
    dw CorpseRottingRotEntry_Move_Skree_Param1_4 
    dw $0020 
    dw CorpseRottingInit_Skree_Param1_4 
    dw CorpseRottingTileRowOffsets_Skree 
    dw CorpseRotEntryFinishedHook_Normal 

CorpseRottingDefinitions_MotherBrain:
    dw $9700 
    dw CorpseRottingVRAMTransferDefinitions_MotherBrain 
    dw CorpseRottingRotEntry_Copy_MotherBrain 
    dw CorpseRottingRotEntry_Move_MotherBrain 
    dw $0030 
    dw CorpseRottingInit_MotherBrain 
    dw CorpseRottingTileRowOffsets_MotherBrain 
    dw CorpseRottingRotEntryFinishedHook_MotherBrain 

CorpseRottingInit_Torizo:
    PHB 
    LDX.W #Tiles_CorpseTorizo+$120 
    LDY.W #$2060 
    LDA.W #$00BF 
    MVN $7E,Tiles_CorpseTorizo>>16 
    PLB 
    PHB 
    LDX.W #Tiles_CorpseTorizo+$320 
    LDY.W #$21A0 
    LDA.W #$00BF 
    MVN $7E,Tiles_CorpseTorizo>>16 
    PLB 
    PHB 
    LDX.W #Tiles_CorpseTorizo+$500 
    LDY.W #$22C0 
    LDA.W #$00FF 
    MVN $7E,Tiles_CorpseTorizo>>16 
    PLB 
    PHB 
    LDX.W #Tiles_CorpseTorizo+$700 
    LDY.W #$2400 
    LDA.W #$00FF 
    MVN $7E,Tiles_CorpseTorizo>>16 
    PLB 
    PHB 
    LDX.W #Tiles_CorpseTorizo+$900 
    LDY.W #$2540 
    LDA.W #$00FF 
    MVN $7E,Tiles_CorpseTorizo>>16 
    PLB 
    PHB 
    LDX.W #Tiles_CorpseTorizo+$B00 
    LDY.W #$2680 
    LDA.W #$00FF 
    MVN $7E,Tiles_CorpseTorizo>>16 
    PLB 
    PHB 
    LDX.W #Tiles_CorpseTorizo+$D00 
    LDY.W #$27C0 
    LDA.W #$00FF 
    MVN $7E,Tiles_CorpseTorizo>>16 
    PLB 
    PHB 
    LDX.W #Tiles_CorpseTorizo+$F00 
    LDY.W #$2900 
    LDA.W #$00FF 
    MVN $7E,Tiles_CorpseTorizo>>16 
    PLB 
    PHB 
    LDX.W #Tiles_CorpseTorizo+$1100 
    LDY.W #$2A40 
    LDA.W #$00FF 
    MVN $7E,Tiles_CorpseTorizo>>16 
    PLB 
    PHB 
    LDX.W #Tiles_CorpseTorizo+$12E0 
    LDY.W #$2B60 
    LDA.W #$011F 
    MVN $7E,Tiles_CorpseTorizo>>16 
    PLB 
    PHB 
    LDX.W #Tiles_CorpseTorizo+$14C0 
    LDY.W #$2C80 
    LDA.W #$013F 
    MVN $7E,Tiles_CorpseTorizo>>16 
    PLB 
    PHB 
    LDX.W #Tiles_CorpseTorizo+$16C0 
    LDY.W #$2DC0 
    LDA.W #$013F 
    MVN $7E,Tiles_CorpseTorizo>>16 
    PLB 
    RTS 


CorpseRottingInit_Sidehopper_Param1_0:
    PHB 
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$40 
    LDY.W #$2040 
    LDA.W #$005F 
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16 
    PLB 
    PHB 
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$200 
    LDY.W #$20A0 
    LDA.W #$009F 
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16 
    PLB 
    PHB 
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$400 
    LDY.W #$2140 
    LDA.W #$009F 
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16 
    PLB 
    PHB 
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$600 
    LDY.W #$21E0 
    LDA.W #$009F 
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16 
    PLB 
    PHB 
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$800 
    LDY.W #$2280 
    LDA.W #$009F 
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16 
    PLB 
    RTS 


CorpseRottingInit_Sidehopper_Param1_2:
    PHB 
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$120 
    LDY.W #$2320 
    LDA.W #$003F 
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16 
    PLB 
    PHB 
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$320 
    LDY.W #$23C0 
    LDA.W #$009F 
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16 
    PLB 
    PHB 
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$520 
    LDY.W #$2460 
    LDA.W #$009F 
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16 
    PLB 
    PHB 
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$720 
    LDY.W #$2500 
    LDA.W #$009F 
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16 
    PLB 
    PHB 
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$920 
    LDY.W #$25A0 
    LDA.W #$009F 
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16 
    PLB 
    RTS 


CorpseRottingInit_Zoomer_Param1_0:
    PHB 
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$A60 
    LDY.W #$2940 
    LDA.W #$005F 
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16 
    PLB 
    PHB 
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$C60 
    LDY.W #$29A0 
    LDA.W #$005F 
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16 
    PLB 
    RTS 


CorpseRottingInit_Zoomer_Param1_2:
    PHB 
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$AC0 
    LDY.W #$2A00 
    LDA.W #$005F 
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16 
    PLB 
    PHB 
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$CC0 
    LDY.W #$2A60 
    LDA.W #$005F 
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16 
    PLB 
    RTS 


CorpseRottingInit_Zoomer_Param1_4:
    PHB 
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$B20 
    LDY.W #$2AC0 
    LDA.W #$005F 
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16 
    PLB 
    PHB 
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$D20 
    LDY.W #$2B20 
    LDA.W #$005F 
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16 
    PLB 
    RTS 


CorpseRottingInit_Ripper_Param1_0:
    PHB 
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$A00 
    LDY.W #$2B80 
    LDA.W #$005F 
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16 
    PLB 
    PHB 
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$C00 
    LDY.W #$2BE0 
    LDA.W #$005F 
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16 
    PLB 
    RTS 


CorpseRottingInit_Ripper_Param1_2:
    PHB 
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$B80 
    LDY.W #$2C40 
    LDA.W #$005F 
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16 
    PLB 
    PHB 
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$D80 
    LDY.W #$2CA0 
    LDA.W #$005F 
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16 
    PLB 
    RTS 


CorpseRottingInit_Skree_Param1_0:
    PHB 
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$2A0 
    LDY.W #$2640 
    LDA.W #$003F 
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16 
    PLB 
    PHB 
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$4A0 
    LDY.W #$2680 
    LDA.W #$003F 
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16 
    PLB 
    PHB 
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$6A0 
    LDY.W #$26C0 
    LDA.W #$003F 
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16 
    PLB 
    PHB 
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$8A0 
    LDY.W #$2700 
    LDA.W #$003F 
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16 
    PLB 
    RTS 


CorpseRottingInit_Skree_Param1_2:
    PHB 
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$E0 
    LDY.W #$2740 
    LDA.W #$003F 
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16 
    PLB 
    PHB 
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$2E0 
    LDY.W #$2780 
    LDA.W #$003F 
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16 
    PLB 
    PHB 
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$4E0 
    LDY.W #$27C0 
    LDA.W #$003F 
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16 
    PLB 
    PHB 
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$6E0 
    LDY.W #$2800 
    LDA.W #$003F 
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16 
    PLB 
    RTS 


CorpseRottingInit_Skree_Param1_4:
    PHB 
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$1C0 
    LDY.W #$2840 
    LDA.W #$003F 
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16 
    PLB 
    PHB 
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$3C0 
    LDY.W #$2880 
    LDA.W #$003F 
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16 
    PLB 
    PHB 
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$5C0 
    LDY.W #$28C0 
    LDA.W #$003F 
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16 
    PLB 
    PHB 
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$7C0 
    LDY.W #$2900 
    LDA.W #$003F 
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16 
    PLB 
    RTS 


CorpseRottingInit_MotherBrain:
    PHB 
    LDX.W #Tiles_CorpseMotherBrain+$C0 
    LDY.W #$9000 
    LDA.W #$00BF 
    MVN $7E,Tiles_CorpseMotherBrain>>16 
    PLB 
    PHB 
    LDX.W #Tiles_CorpseMotherBrain+$2C0 
    LDY.W #$90E0 
    LDA.W #$00BF 
    MVN $7E,Tiles_CorpseMotherBrain>>16 
    PLB 
    PHB 
    LDX.W #Tiles_CorpseMotherBrain+$4C0 
    LDY.W #$91C0 
    LDA.W #$00BF 
    MVN $7E,Tiles_CorpseMotherBrain>>16 
    PLB 
    PHB 
    LDX.W #Tiles_CorpseMotherBrain+$6C0 
    LDY.W #$92A0 
    LDA.W #$00BF 
    MVN $7E,Tiles_CorpseMotherBrain>>16 
    PLB 
    PHB 
    LDX.W #Tiles_CorpseMotherBrain+$8C0 
    LDY.W #$9380 
    LDA.W #$00DF 
    MVN $7E,Tiles_CorpseMotherBrain>>16 
    PLB 
    PHB 
    LDX.W #Tiles_CorpseMotherBrain+$AC0 
    LDY.W #$9460 
    LDA.W #$00DF 
    MVN $7E,Tiles_CorpseMotherBrain>>16 
    PLB 
    RTS 


CorpseRottingVRAMTransferDefinitions_Sidehopper_Param1_0:
    dw $0060,$7E00,$2040,$7020,$00A0,$7E00,$20A0,$7100 
    dw $00A0,$7E00,$2140,$7200,$00A0,$7E00,$21E0,$7300 
    dw $00A0,$7E00,$2280,$7400,$0000 

CorpseRottingVRAMTransferDefinitions_Sidehopper_Param1_2:
    dw $0040,$7E00,$2320,$7090,$00A0,$7E00,$23C0,$7190 
    dw $00A0,$7E00,$2460,$7290,$00A0,$7E00,$2500,$7390 
    dw $00A0,$7E00,$25A0,$7490,$0000 

CorpseRottingVRAMTransferDefinitions_Zoomer_Param1_0:
    dw $0060,$7E00,$2940,$7530,$0060,$7E00,$29A0,$7630 
    dw $0000 

CorpseRottingVRAMTransferDefinitions_Zoomer_Param1_2:
    dw $0060,$7E00,$2A00,$7560,$0060,$7E00,$2A60,$7660 
    dw $0000 

CorpseRottingVRAMTransferDefinitions_Zoomer_Param1_4:
    dw $0060,$7E00,$2AC0,$7590,$0060,$7E00,$2B20,$7690 
    dw $0000 

CorpseRottingVRAMTransferDefinitions_Ripper_Param1_0:
    dw $0060,$7E00,$2B80,$7500,$0060,$7E00,$2BE0,$7600 
    dw $0000 

CorpseRottingVRAMTransferDefinitions_Ripper_Param1_2:
    dw $0060,$7E00,$2C40,$75C0,$0060,$7E00,$2CA0,$76C0 
    dw $0000 

CorpseRottingVRAMTransferDefinitions_Skree_Param1_0:
    dw $0040,$7E00,$2640,$7150,$0040,$7E00,$2680,$7250 
    dw $0040,$7E00,$26C0,$7350,$0040,$7E00,$2700,$7450 
    dw $0000 

CorpseRottingVRAMTransferDefinitions_Skree_Param1_2:
    dw $0040,$7E00,$2740,$7070,$0040,$7E00,$2780,$7170 
    dw $0040,$7E00,$27C0,$7270,$0040,$7E00,$2800,$7370 
    dw $0000 

CorpseRottingVRAMTransferDefinitions_Skree_Param1_4:
    dw $0040,$7E00,$2840,$70E0,$0040,$7E00,$2880,$71E0 
    dw $0040,$7E00,$28C0,$72E0,$0040,$7E00,$2900,$73E0 
    dw $0000 

CorpseRottingVRAMTransferDefinitions_MotherBrain:
    dw $0060,$7E00,$9040,$7A80,$00A0,$7E00,$9100,$7B70 
    dw $00C0,$7E00,$91C0,$7C60,$00C0,$7E00,$92A0,$7D60 
    dw $00E0,$7E00,$9380,$7E60,$00E0,$7E00,$9460,$7F60 
    dw $0000 

CorpseRottingTileRowOffsets_Torizo:
    dw $0000,$0140,$0280,$03C0,$0500,$0640,$0780,$08C0 
    dw $0A00,$0B40,$0C80,$0DC0,$0F00 

CorpseRottingTileRowOffsets_Sidehopper:
    dw $0000,$00A0,$0140,$01E0,$0280,$0320 

CorpseRottingTileRowOffsets_Zoomer:
    dw $0000,$0060,$00C0 

CorpseRottingTileRowOffsets_Ripper:
    dw $0000,$0060,$00C0 

CorpseRottingTileRowOffsets_Skree:
    dw $0000,$0040,$0080,$00C0,$0100 

CorpseRottingTileRowOffsets_MotherBrain:
    dw $0000,$00E0,$01C0,$02A0,$0380,$0460,$0540,$0620 

CorpseRottingRotEntry_Move_Torizo:
    LDA.W $8802 
    CMP.W #$0050 
    BCC .column1 
    CMP.W #$005E 
    BPL .offsetGreaterThan5D 
    LDA.W $2000,X 
    STA.W $2002,Y 
    LDA.W $2010,X 
    STA.W $2012,Y 

.offsetGreaterThan5D:
    STZ.W $2000,X 
    STZ.W $2010,X 

.column1:
    LDA.W $8802 
    CMP.W #$0048 
    BCC .column2 
    CMP.W #$005E 
    BPL ..offsetGreaterThan5E 
    LDA.W $2020,X 
    STA.W $2022,Y 
    LDA.W $2030,X 
    STA.W $2032,Y 

..offsetGreaterThan5E:
    STZ.W $2020,X 
    STZ.W $2030,X 

.column2:
    LDA.W $8802 
    CMP.W #$0010 
    BCC .column3 
    CMP.W #$005E 
    BPL ..offsetGreaterThan5E 
    LDA.W $2040,X 
    STA.W $2042,Y 
    LDA.W $2050,X 
    STA.W $2052,Y 

..offsetGreaterThan5E:
    STZ.W $2040,X 
    STZ.W $2050,X 

.column3:
    LDA.W $8802 
    CMP.W #$005E 
    BPL ..offsetGreaterThan5E 
    LDA.W $2060,X 
    STA.W $2062,Y 
    LDA.W $2070,X 
    STA.W $2072,Y 

..offsetGreaterThan5E:
    STZ.W $2060,X 
    STZ.W $2070,X 
    LDA.W $8802 
    CMP.W #$005E 
    BPL + 
    LDA.W $2080,X 
    STA.W $2082,Y 
    LDA.W $2090,X 
    STA.W $2092,Y 

  + STZ.W $2080,X 
    STZ.W $2090,X 
    LDA.W $8802 
    CMP.W #$005E 
    BPL + 
    LDA.W $20A0,X 
    STA.W $20A2,Y 
    LDA.W $20B0,X 
    STA.W $20B2,Y 

  + STZ.W $20A0,X 
    STZ.W $20B0,X 
    LDA.W $8802 
    CMP.W #$005E 
    BPL + 
    LDA.W $20C0,X 
    STA.W $20C2,Y 
    LDA.W $20D0,X 
    STA.W $20D2,Y 

  + STZ.W $20C0,X 
    STZ.W $20D0,X 
    LDA.W $8802 
    CMP.W #$005E 
    BPL + 
    LDA.W $20E0,X 
    STA.W $20E2,Y 
    LDA.W $20F0,X 
    STA.W $20F2,Y 

  + STZ.W $20E0,X 
    STZ.W $20F0,X 
    LDA.W $8802 
    CMP.W #$005E 
    BPL + 
    LDA.W $2100,X 
    STA.W $2102,Y 
    LDA.W $2110,X 
    STA.W $2112,Y 

  + STZ.W $2100,X 
    STZ.W $2110,X 
    LDA.W $8802 
    CMP.W #$0010 
    BCC .return 
    CMP.W #$005E 
    BPL + 
    LDA.W $2120,X 
    STA.W $2122,Y 
    LDA.W $2130,X 
    STA.W $2132,Y 

  + STZ.W $2120,X 
    STZ.W $2130,X 

.return:
    RTS 


CorpseRottingRotEntry_Copy_Torizo:
    LDA.W $8802 
    CMP.W #$0050 
    BCC + 
    CMP.W #$005E 
    BPL + 
    LDA.W $2000,X 
    STA.W $2002,Y 
    LDA.W $2010,X 
    STA.W $2012,Y 

  + LDA.W $8802 
    CMP.W #$0048 
    BCC + 
    CMP.W #$005E 
    BPL + 
    LDA.W $2020,X 
    STA.W $2022,Y 
    LDA.W $2030,X 
    STA.W $2032,Y 

  + LDA.W $8802 
    CMP.W #$0010 
    BCC + 
    CMP.W #$005E 
    BPL + 
    LDA.W $2040,X 
    STA.W $2042,Y 
    LDA.W $2050,X 
    STA.W $2052,Y 

  + LDA.W $8802 
    CMP.W #$005E 
    BPL + 
    LDA.W $2060,X 
    STA.W $2062,Y 
    LDA.W $2070,X 
    STA.W $2072,Y 

  + LDA.W $8802 
    CMP.W #$005E 
    BPL + 
    LDA.W $2080,X 
    STA.W $2082,Y 
    LDA.W $2090,X 
    STA.W $2092,Y 

  + LDA.W $8802 
    CMP.W #$005E 
    BPL + 
    LDA.W $20A0,X 
    STA.W $20A2,Y 
    LDA.W $20B0,X 
    STA.W $20B2,Y 

  + LDA.W $8802 
    CMP.W #$005E 
    BPL + 
    LDA.W $20C0,X 
    STA.W $20C2,Y 
    LDA.W $20D0,X 
    STA.W $20D2,Y 

  + LDA.W $8802 
    CMP.W #$005E 
    BPL + 
    LDA.W $20E0,X 
    STA.W $20E2,Y 
    LDA.W $20F0,X 
    STA.W $20F2,Y 

  + LDA.W $8802 
    CMP.W #$005E 
    BPL + 
    LDA.W $2100,X 
    STA.W $2102,Y 
    LDA.W $2110,X 
    STA.W $2112,Y 

  + LDA.W $8802 
    CMP.W #$0010 
    BCC .return 
    CMP.W #$005E 
    BPL .return 
    LDA.W $2120,X 
    STA.W $2122,Y 
    LDA.W $2130,X 
    STA.W $2132,Y 

.return:
    RTS 


CorpseRottingRotEntry_Move_Sidehopper_Param1_0:
    LDA.W $8802 
    CMP.W #$0008 
    BCC .column1 
    CMP.W #$0026 
    BPL .offsetGreaterThan25 
    LDA.W $2000,X 
    STA.W $2002,Y 
    LDA.W $2010,X 
    STA.W $2012,Y 

.offsetGreaterThan25:
    STZ.W $2000,X 
    STZ.W $2010,X 

.column1:
    LDA.W $8802 
    CMP.W #$0008 
    BCC .column2 
    CMP.W #$0026 
    BPL ..offsetGreaterThan25 
    LDA.W $2020,X 
    STA.W $2022,Y 
    LDA.W $2030,X 
    STA.W $2032,Y 

..offsetGreaterThan25:
    STZ.W $2020,X 
    STZ.W $2030,X 

.column2:
    LDA.W $8802 
    CMP.W #$0026 
    BPL + 
    LDA.W $2040,X 
    STA.W $2042,Y 
    LDA.W $2050,X 
    STA.W $2052,Y 

  + STZ.W $2040,X 
    STZ.W $2050,X 
    LDA.W $8802 
    CMP.W #$0026 
    BPL + 
    LDA.W $2060,X 
    STA.W $2062,Y 
    LDA.W $2070,X 
    STA.W $2072,Y 

  + STZ.W $2060,X 
    STZ.W $2070,X 
    LDA.W $8802 
    CMP.W #$0026 
    BPL + 
    LDA.W $2080,X 
    STA.W $2082,Y 
    LDA.W $2090,X 
    STA.W $2092,Y 

  + STZ.W $2080,X 
    STZ.W $2090,X 
    RTS 


CorpseRottingRotEntry_Copy_Sidehopper_Param1_0:
    LDA.W $8802 
    CMP.W #$0008 
    BCC + 
    CMP.W #$0026 
    BPL + 
    LDA.W $2000,X 
    STA.W $2002,Y 
    LDA.W $2010,X 
    STA.W $2012,Y 

  + LDA.W $8802 
    CMP.W #$0008 
    BCC + 
    CMP.W #$0026 
    BPL + 
    LDA.W $2020,X 
    STA.W $2022,Y 
    LDA.W $2030,X 
    STA.W $2032,Y 

  + LDA.W $8802 
    CMP.W #$0026 
    BPL + 
    LDA.W $2040,X 
    STA.W $2042,Y 
    LDA.W $2050,X 
    STA.W $2052,Y 

  + LDA.W $8802 
    CMP.W #$0026 
    BPL + 
    LDA.W $2060,X 
    STA.W $2062,Y 
    LDA.W $2070,X 
    STA.W $2072,Y 

  + LDA.W $8802 
    CMP.W #$0026 
    BPL .return 
    LDA.W $2080,X 
    STA.W $2082,Y 
    LDA.W $2090,X 
    STA.W $2092,Y 

.return:
    RTS 


CorpseRottingRotEntry_Move_Sidehopper_Param1_2:
    LDA.W $8802 
    CMP.W #$0026 
    BPL + 
    LDA.W $2320,X 
    STA.W $2322,Y 
    LDA.W $2330,X 
    STA.W $2332,Y 

  + STZ.W $2320,X 
    STZ.W $2330,X 
    LDA.W $8802 
    CMP.W #$0026 
    BPL + 
    LDA.W $2340,X 
    STA.W $2342,Y 
    LDA.W $2350,X 
    STA.W $2352,Y 

  + STZ.W $2340,X 
    STZ.W $2350,X 
    LDA.W $8802 
    CMP.W #$0008 
    BCC .column3 
    CMP.W #$0026 
    BPL + 
    LDA.W $2360,X 
    STA.W $2362,Y 
    LDA.W $2370,X 
    STA.W $2372,Y 

  + STZ.W $2360,X 
    STZ.W $2370,X 

.column3:
    LDA.W $8802 
    CMP.W #$0008 
    BCC .column4 
    CMP.W #$0026 
    BPL + 
    LDA.W $2380,X 
    STA.W $2382,Y 
    LDA.W $2390,X 
    STA.W $2392,Y 

  + STZ.W $2380,X 
    STZ.W $2390,X 

.column4:
    LDA.W $8802 
    CMP.W #$0008 
    BCC .return 
    CMP.W #$0026 
    BPL + 
    LDA.W $23A0,X 
    STA.W $23A2,Y 
    LDA.W $23B0,X 
    STA.W $23B2,Y 

  + STZ.W $23A0,X 
    STZ.W $23B0,X 

.return:
    RTS 


CorpseRottingRotEntry_Copy_Sidehopper_Param1_2:
    LDA.W $8802 
    CMP.W #$0026 
    BPL + 
    LDA.W $2320,X 
    STA.W $2322,Y 
    LDA.W $2330,X 
    STA.W $2332,Y 

  + LDA.W $8802 
    CMP.W #$0026 
    BPL + 
    LDA.W $2340,X 
    STA.W $2342,Y 
    LDA.W $2350,X 
    STA.W $2352,Y 

  + LDA.W $8802 
    CMP.W #$0008 
    BCC + 
    CMP.W #$0026 
    BPL + 
    LDA.W $2360,X 
    STA.W $2362,Y 
    LDA.W $2370,X 
    STA.W $2372,Y 

  + LDA.W $8802 
    CMP.W #$0008 
    BCC + 
    CMP.W #$0026 
    BPL + 
    LDA.W $2380,X 
    STA.W $2382,Y 
    LDA.W $2390,X 
    STA.W $2392,Y 

  + LDA.W $8802 
    CMP.W #$0008 
    BCC .return 
    CMP.W #$0026 
    BPL .return 
    LDA.W $23A0,X 
    STA.W $23A2,Y 
    LDA.W $23B0,X 
    STA.W $23B2,Y 

.return:
    RTS 


CorpseRottingRotEntry_Move_Zoomer_Param1_0:
    LDA.W $8802 
    CMP.W #$000E 
    BPL + 
    LDA.W $2940,X 
    STA.W $2942,Y 
    LDA.W $2950,X 
    STA.W $2952,Y 

  + STZ.W $2940,X 
    STZ.W $2950,X 
    LDA.W $8802 
    CMP.W #$000E 
    BPL + 
    LDA.W $2960,X 
    STA.W $2962,Y 
    LDA.W $2970,X 
    STA.W $2972,Y 

  + STZ.W $2960,X 
    STZ.W $2970,X 
    LDA.W $8802 
    CMP.W #$000E 
    BPL + 
    LDA.W $2980,X 
    STA.W $2982,Y 
    LDA.W $2990,X 
    STA.W $2992,Y 

  + STZ.W $2980,X 
    STZ.W $2990,X 
    RTS 


CorpseRottingRotEntry_Copy_Zoomer_Param1_0:
    LDA.W $8802 
    CMP.W #$000E 
    BPL + 
    LDA.W $2940,X 
    STA.W $2942,Y 
    LDA.W $2950,X 
    STA.W $2952,Y 

  + LDA.W $8802 
    CMP.W #$000E 
    BPL + 
    LDA.W $2960,X 
    STA.W $2962,Y 
    LDA.W $2970,X 
    STA.W $2972,Y 

  + LDA.W $8802 
    CMP.W #$000E 
    BPL .return 
    LDA.W $2980,X 
    STA.W $2982,Y 
    LDA.W $2990,X 
    STA.W $2992,Y 

.return:
    RTS 


CorpseRottingRotEntry_Move_Zoomer_Param1_2:
    LDA.W $8802 
    CMP.W #$000E 
    BPL + 
    LDA.W $2A00,X 
    STA.W $2A02,Y 
    LDA.W $2A10,X 
    STA.W $2A12,Y 

  + STZ.W $2A00,X 
    STZ.W $2A10,X 
    LDA.W $8802 
    CMP.W #$000E 
    BPL + 
    LDA.W $2A20,X 
    STA.W $2A22,Y 
    LDA.W $2A30,X 
    STA.W $2A32,Y 

  + STZ.W $2A20,X 
    STZ.W $2A30,X 
    LDA.W $8802 
    CMP.W #$000E 
    BPL + 
    LDA.W $2A40,X 
    STA.W $2A42,Y 
    LDA.W $2A50,X 
    STA.W $2A52,Y 

  + STZ.W $2A40,X 
    STZ.W $2A50,X 
    RTS 


CorpseRottingRotEntry_Copy_Zoomer_Param1_2:
    LDA.W $8802 
    CMP.W #$000E 
    BPL + 
    LDA.W $2A00,X 
    STA.W $2A02,Y 
    LDA.W $2A10,X 
    STA.W $2A12,Y 

  + LDA.W $8802 
    CMP.W #$000E 
    BPL + 
    LDA.W $2A20,X 
    STA.W $2A22,Y 
    LDA.W $2A30,X 
    STA.W $2A32,Y 

  + LDA.W $8802 
    CMP.W #$000E 
    BPL .return 
    LDA.W $2A40,X 
    STA.W $2A42,Y 
    LDA.W $2A50,X 
    STA.W $2A52,Y 

.return:
    RTS 


CorpseRottingRotEntry_Move_Zoomer_Param1_4:
    LDA.W $8802 
    CMP.W #$000E 
    BPL + 
    LDA.W $2AC0,X 
    STA.W $2AC2,Y 
    LDA.W $2AD0,X 
    STA.W $2AD2,Y 

  + STZ.W $2AC0,X 
    STZ.W $2AD0,X 
    LDA.W $8802 
    CMP.W #$000E 
    BPL + 
    LDA.W $2AE0,X 
    STA.W $2AE2,Y 
    LDA.W $2AF0,X 
    STA.W $2AF2,Y 

  + STZ.W $2AE0,X 
    STZ.W $2AF0,X 
    LDA.W $8802 
    CMP.W #$000E 
    BPL + 
    LDA.W $2B00,X 
    STA.W $2B02,Y 
    LDA.W $2B10,X 
    STA.W $2B12,Y 

  + STZ.W $2B00,X 
    STZ.W $2B10,X 
    RTS 


CorpseRottingRotEntry_Copy_Zoomer_Param1_4:
    LDA.W $8802 
    CMP.W #$000E 
    BPL + 
    LDA.W $2AC0,X 
    STA.W $2AC2,Y 
    LDA.W $2AD0,X 
    STA.W $2AD2,Y 

  + LDA.W $8802 
    CMP.W #$000E 
    BPL + 
    LDA.W $2AE0,X 
    STA.W $2AE2,Y 
    LDA.W $2AF0,X 
    STA.W $2AF2,Y 

  + LDA.W $8802 
    CMP.W #$000E 
    BPL .return 
    LDA.W $2B00,X 
    STA.W $2B02,Y 
    LDA.W $2B10,X 
    STA.W $2B12,Y 

.return:
    RTS 


CorpseRottingRotEntry_Move_Ripper_Param1_0:
    LDA.W $8802 
    CMP.W #$000E 
    BPL + 
    LDA.W $2B80,X 
    STA.W $2B82,Y 
    LDA.W $2B90,X 
    STA.W $2B92,Y 

  + STZ.W $2B80,X 
    STZ.W $2B90,X 
    LDA.W $8802 
    CMP.W #$000E 
    BPL + 
    LDA.W $2BA0,X 
    STA.W $2BA2,Y 
    LDA.W $2BB0,X 
    STA.W $2BB2,Y 

  + STZ.W $2BA0,X 
    STZ.W $2BB0,X 
    LDA.W $8802 
    CMP.W #$000E 
    BPL + 
    LDA.W $2BC0,X 
    STA.W $2BC2,Y 
    LDA.W $2BD0,X 
    STA.W $2BD2,Y 

  + STZ.W $2BC0,X 
    STZ.W $2BD0,X 
    RTS 


CorpseRottingRotEntry_Copy_Ripper_Param1_0:
    LDA.W $8802 
    CMP.W #$000E 
    BPL + 
    LDA.W $2B80,X 
    STA.W $2B82,Y 
    LDA.W $2B90,X 
    STA.W $2B92,Y 

  + LDA.W $8802 
    CMP.W #$000E 
    BPL + 
    LDA.W $2BA0,X 
    STA.W $2BA2,Y 
    LDA.W $2BB0,X 
    STA.W $2BB2,Y 

  + LDA.W $8802 
    CMP.W #$000E 
    BPL .return 
    LDA.W $2BC0,X 
    STA.W $2BC2,Y 
    LDA.W $2BD0,X 
    STA.W $2BD2,Y 

.return:
    RTS 


CorpseRottingRotEntry_Move_Ripper_Param1_2:
    LDA.W $8802 
    CMP.W #$000E 
    BPL + 
    LDA.W $2C40,X 
    STA.W $2C42,Y 
    LDA.W $2C50,X 
    STA.W $2C52,Y 

  + STZ.W $2C40,X 
    STZ.W $2C50,X 
    LDA.W $8802 
    CMP.W #$000E 
    BPL + 
    LDA.W $2C60,X 
    STA.W $2C62,Y 
    LDA.W $2C70,X 
    STA.W $2C72,Y 

  + STZ.W $2C60,X 
    STZ.W $2C70,X 
    LDA.W $8802 
    CMP.W #$000E 
    BPL + 
    LDA.W $2C80,X 
    STA.W $2C82,Y 
    LDA.W $2C90,X 
    STA.W $2C92,Y 

  + STZ.W $2C80,X 
    STZ.W $2C90,X 
    RTS 


CorpseRottingRotEntry_Copy_Ripper_Param1_2:
    LDA.W $8802 
    CMP.W #$000E 
    BPL + 
    LDA.W $2C40,X 
    STA.W $2C42,Y 
    LDA.W $2C50,X 
    STA.W $2C52,Y 

  + LDA.W $8802 
    CMP.W #$000E 
    BPL + 
    LDA.W $2C60,X 
    STA.W $2C62,Y 
    LDA.W $2C70,X 
    STA.W $2C72,Y 

  + LDA.W $8802 
    CMP.W #$000E 
    BPL .return 
    LDA.W $2C80,X 
    STA.W $2C82,Y 
    LDA.W $2C90,X 
    STA.W $2C92,Y 

.return:
    RTS 


CorpseRottingRotEntry_Move_Skree_Param1_0:
    LDA.W $8802 
    CMP.W #$001E 
    BPL + 
    LDA.W $2640,X 
    STA.W $2642,Y 
    LDA.W $2650,X 
    STA.W $2652,Y 

  + STZ.W $2640,X 
    STZ.W $2650,X 
    LDA.W $8802 
    CMP.W #$001E 
    BPL + 
    LDA.W $2660,X 
    STA.W $2662,Y 
    LDA.W $2670,X 
    STA.W $2672,Y 

  + STZ.W $2660,X 
    STZ.W $2670,X 
    RTS 


CorpseRottingRotEntry_Copy_Skree_Param1_0:
    LDA.W $8802 
    CMP.W #$001E 
    BPL + 
    LDA.W $2640,X 
    STA.W $2642,Y 
    LDA.W $2650,X 
    STA.W $2652,Y 

  + LDA.W $8802 
    CMP.W #$001E 
    BPL .return 
    LDA.W $2660,X 
    STA.W $2662,Y 
    LDA.W $2670,X 
    STA.W $2672,Y 

.return:
    RTS 


CorpseRottingRotEntry_Move_Skree_Param1_2:
    LDA.W $8802 
    CMP.W #$001E 
    BPL + 
    LDA.W $2740,X 
    STA.W $2742,Y 
    LDA.W $2750,X 
    STA.W $2752,Y 

  + STZ.W $2740,X 
    STZ.W $2750,X 
    LDA.W $8802 
    CMP.W #$001E 
    BPL + 
    LDA.W $2760,X 
    STA.W $2762,Y 
    LDA.W $2770,X 
    STA.W $2772,Y 

  + STZ.W $2760,X 
    STZ.W $2770,X 
    RTS 


CorpseRottingRotEntry_Copy_Skree_Param1_2:
    LDA.W $8802 
    CMP.W #$001E 
    BPL + 
    LDA.W $2740,X 
    STA.W $2742,Y 
    LDA.W $2750,X 
    STA.W $2752,Y 

  + LDA.W $8802 
    CMP.W #$001E 
    BPL .return 
    LDA.W $2760,X 
    STA.W $2762,Y 
    LDA.W $2770,X 
    STA.W $2772,Y 

.return:
    RTS 


CorpseRottingRotEntry_Move_Skree_Param1_4:
    LDA.W $8802 
    CMP.W #$001E 
    BPL + 
    LDA.W $2840,X 
    STA.W $2842,Y 
    LDA.W $2850,X 
    STA.W $2852,Y 

  + STZ.W $2840,X 
    STZ.W $2850,X 
    LDA.W $8802 
    CMP.W #$001E 
    BPL + 
    LDA.W $2860,X 
    STA.W $2862,Y 
    LDA.W $2870,X 
    STA.W $2872,Y 

  + STZ.W $2860,X 
    STZ.W $2870,X 
    RTS 


CorpseRottingRotEntry_Copy_Skree_Param1_4:
    LDA.W $8802 
    CMP.W #$001E 
    BPL + 
    LDA.W $2840,X 
    STA.W $2842,Y 
    LDA.W $2850,X 
    STA.W $2852,Y 

  + LDA.W $8802 
    CMP.W #$001E 
    BPL .return 
    LDA.W $2860,X 
    STA.W $2862,Y 
    LDA.W $2870,X 
    STA.W $2872,Y 

.return:
    RTS 


CorpseRottingRotEntry_Move_MotherBrain:
    LDA.W $8802 
    CMP.W #$0010 
    BCC .column1 
    CMP.W #$002E 
    BPL + 
    LDA.W $9000,X 
    STA.W $9002,Y 
    LDA.W $9010,X 
    STA.W $9012,Y 

  + STZ.W $9000,X 
    STZ.W $9010,X 

.column1:
    LDA.W $8802 
    CMP.W #$0008 
    BCC .column2 
    CMP.W #$002E 
    BPL + 
    LDA.W $9020,X 
    STA.W $9022,Y 
    LDA.W $9030,X 
    STA.W $9032,Y 

  + STZ.W $9020,X 
    STZ.W $9030,X 

.column2:
    LDA.W $8802 
    CMP.W #$002E 
    BPL + 
    LDA.W $9040,X 
    STA.W $9042,Y 
    LDA.W $9050,X 
    STA.W $9052,Y 

  + STZ.W $9040,X 
    STZ.W $9050,X 
    LDA.W $8802 
    CMP.W #$002E 
    BPL + 
    LDA.W $9060,X 
    STA.W $9062,Y 
    LDA.W $9070,X 
    STA.W $9072,Y 

  + STZ.W $9060,X 
    STZ.W $9070,X 
    LDA.W $8802 
    CMP.W #$002E 
    BPL + 
    LDA.W $9080,X 
    STA.W $9082,Y 
    LDA.W $9090,X 
    STA.W $9092,Y 

  + STZ.W $9080,X 
    STZ.W $9090,X 
    LDA.W $8802 
    CMP.W #$0008 
    BCC .column6 
    CMP.W #$002E 
    BPL + 
    LDA.W $90A0,X 
    STA.W $90A2,Y 
    LDA.W $90B0,X 
    STA.W $90B2,Y 

  + STZ.W $90A0,X 
    STZ.W $90B0,X 

.column6:
    LDA.W $8802 
    CMP.W #$0020 
    BCC .return 
    CMP.W #$002E 
    BPL + 
    LDA.W $90C0,X 
    STA.W $90C2,Y 
    LDA.W $90D0,X 
    STA.W $90D2,Y 

  + STZ.W $90C0,X 
    STZ.W $90D0,X 

.return:
    RTS 


CorpseRottingRotEntry_Copy_MotherBrain:
    LDA.W $8802 
    CMP.W #$0010 
    BCC + 
    CMP.W #$002E 
    BPL + 
    LDA.W $9000,X 
    STA.W $9002,Y 
    LDA.W $9010,X 
    STA.W $9012,Y 

  + LDA.W $8802 
    CMP.W #$0008 
    BCC + 
    CMP.W #$002E 
    BPL + 
    LDA.W $9020,X 
    STA.W $9022,Y 
    LDA.W $9030,X 
    STA.W $9032,Y 

  + LDA.W $8802 
    CMP.W #$002E 
    BPL + 
    LDA.W $9040,X 
    STA.W $9042,Y 
    LDA.W $9050,X 
    STA.W $9052,Y 

  + LDA.W $8802 
    CMP.W #$002E 
    BPL + 
    LDA.W $9060,X 
    STA.W $9062,Y 
    LDA.W $9070,X 
    STA.W $9072,Y 

  + LDA.W $8802 
    CMP.W #$002E 
    BPL + 
    LDA.W $9080,X 
    STA.W $9082,Y 
    LDA.W $9090,X 
    STA.W $9092,Y 

  + LDA.W $8802 
    CMP.W #$0008 
    BCC + 
    CMP.W #$002E 
    BPL + 
    LDA.W $90A0,X 
    STA.W $90A2,Y 
    LDA.W $90B0,X 
    STA.W $90B2,Y 

  + LDA.W $8802 
    CMP.W #$0020 
    BCC .return 
    CMP.W #$002E 
    BPL .return 
    LDA.W $90C0,X 
    STA.W $90C2,Y 
    LDA.W $90D0,X 
    STA.W $90D2,Y 

.return:
    RTS 


Palette_CorpseSidehopper2:
    dw $3800,$4EDA,$3A35,$2990,$14EB,$77E9,$5706,$3A44 
    dw $1D62,$2FBA,$22F6,$1A33,$1170,$08CD,$639F,$0446 

Palette_SidehopperCorpseBeingDrained_0:
    dw $3800,$7FFF,$56E0,$3180,$18C0,$6BC0,$5EC0,$4A20 
    dw $35A0,$7FFF,$039C,$0237,$00D1,$03FF,$0237,$00D1 

Palette_SidehopperCorpseBeingDrained_1:
    dw $3800,$77DF,$52C5,$2962,$14A1,$67A5,$56A4,$4203 
    dw $3182,$77FF,$0F7B,$01F4,$00CF,$037B,$01F3,$00AF 

Palette_SidehopperCorpseBeingDrained_2:
    dw $3800,$6FBF,$4ECA,$2544,$10A2,$5F8B,$4E88,$3DE6 
    dw $2D85,$6FFF,$1B5A,$05D1,$00CC,$06D6,$0190,$00AC 

Palette_SidehopperCorpseBeingDrained_3:
    dw $3800,$6BBF,$4AAE,$1D05,$0C83,$5B50,$466C,$35EA 
    dw $2567,$67FF,$2B39,$058F,$00AA,$0652,$014C,$048A 

Palette_SidehopperCorpseBeingDrained_4:
    dw $3800,$639F,$46B3,$18E7,$0884,$5336,$3E50,$31CD 
    dw $216A,$5FFF,$3718,$096C,$00A7,$09AD,$00E9,$0487 

Palette_SidehopperCorpseBeingDrained_5:
    dw $3800,$5B7F,$4298,$10C9,$0465,$4F1B,$3634,$29B0 
    dw $1D4C,$57FF,$42F7,$0929,$00A5,$0929,$00A5,$0465 

Palette_SidehopperCorpseBeingDrained_6:
    dw $3800,$57FF,$42F7,$0929,$00A5,$7FFF,$4231,$0043 
    dw $4B3F,$42DB,$3678,$2E14,$2190,$192C,$0CC9,$0465 

InstList_CorpseSidehopper_Alive_Hopping:
    dw $0002 
    dw Spritemap_CorpseSidehopper_Alive_0 
    dw $0004 
    dw Spritemap_CorpseSidehopper_Alive_1 
    dw $0005 
    dw Spritemap_CorpseSidehopper_Alive_0 
    dw $0030 
    dw Spritemap_CorpseSidehopper_Alive_1 
    dw $0005 
    dw Spritemap_CorpseSidehopper_Alive_0 
    dw $0004 
    dw Spritemap_CorpseSidehopper_Alive_1 
    dw $0005 
    dw Spritemap_CorpseSidehopper_Alive_0 
    dw $0004 
    dw Spritemap_CorpseSidehopper_Alive_1 
    dw Instruction_SidehopperCorpse_EndHop 
    dw Instruction_Common_Sleep 

Instruction_SidehopperCorpse_EndHop:
    PHY 
    LDY.W #Function_CorpseSidehopper_StartIdling 
    LDA.L $7E7810,X 
    BEQ .setFunctionPointerInY 
    LDY.W #Function_CorpseSidehopper_BeingDrained 

.setFunctionPointerInY:
    TYA 
    STA.W $0FA8,X 
    PLY 
    RTL 


InstList_CorpseSidehopper_Alive_Idle:
    dw $0001 
    dw Spritemap_CorpseSidehopper_Alive_2 
    dw Instruction_Common_Sleep 

InstList_CorpseSidehopper_Alive_Corpse:
    dw $0001 
    dw Spritemap_CorpseSidehopper_Dead_0 
    dw Instruction_Common_Sleep 

InstList_CorpseSidehopper_Alive_Dead:
    dw $0001 
    dw Spritemap_CorpseSidehopper_Dead_1 
    dw Instruction_Common_Sleep 

InstList_CorpseZoomer_Param1_0:
    dw $0001 
    dw Spritemap_CorpseZoomer_0 
    dw Instruction_Common_Sleep 

InstList_CorpseZoomer_Param1_2:
    dw $0001 
    dw Spritemap_CorpseZoomer_1 
    dw Instruction_Common_Sleep 

InstList_CorpseZoomer_Param1_4:
    dw $0001 
    dw Spritemap_CorpseZoomer_2 
    dw Instruction_Common_Sleep 

InstList_CorpseRipper_Param1_0:
    dw $0001 
    dw Spritemap_CorpseRipper_0 
    dw Instruction_Common_Sleep 

InstList_CorpseRipper_Param1_2:
    dw $0001 
    dw Spritemap_CorpseRipper_1 
    dw Instruction_Common_Sleep 

InstList_CorpseSkree_Param1_0:
    dw $0001 
    dw Spritemap_CorpseSkree_0 
    dw Instruction_Common_Sleep 

InstList_CorpseSkree_Param1_2:
    dw $0001 
    dw Spritemap_CorpseSkree_1 
    dw Instruction_Common_Sleep 

InstList_CorpseSkree_Param1_4:
    dw $0001 
    dw Spritemap_CorpseSkree_2 
    dw Instruction_Common_Sleep 

Spritemap_CorpseSidehopper_Dead_0:
    dw $0008,$C20C 
    db $02 
    dw $6130,$C20C 
    db $F2 
    dw $6110,$C3FC 
    db $FA 
    dw $2123,$C3FC 
    db $EA 
    dw $2103,$C3F4 
    db $FA 
    dw $2122,$C3F4 
    db $EA 
    dw $2102,$C3E4 
    db $02 
    dw $2130,$C3E4 
    db $F2 
    dw $2110 

Spritemap_CorpseSidehopper_Dead_1:
    dw $0008,$C20C 
    db $FE 
    dw $6129,$C20C 
    db $EE 
    dw $6109,$C3F4 
    db $06 
    dw $213B,$C3F4 
    db $F6 
    dw $211B,$C3FC 
    db $06 
    dw $213C,$C3FC 
    db $F6 
    dw $211C,$C3E4 
    db $FE 
    dw $2129,$C3E4 
    db $EE 
    dw $2109 

Spritemap_CorpseZoomer_0:
    dw $0002,$C3FC 
    db $F8 
    dw $2154,$C3F4 
    db $F8 
    dw $2153 

Spritemap_CorpseZoomer_1:
    dw $0002,$C3FC 
    db $F8 
    dw $2157,$C3F4 
    db $F8 
    dw $2156 

Spritemap_CorpseZoomer_2:
    dw $0002,$C3FC 
    db $F8 
    dw $215A,$C3F4 
    db $F8 
    dw $2159 

Spritemap_CorpseRipper_0:
    dw $0002,$C3FC 
    db $F8 
    dw $2151,$C3F4 
    db $F8 
    dw $2150 

Spritemap_CorpseRipper_1:
    dw $0002,$C3FC 
    db $F8 
    dw $215D,$C3F4 
    db $F8 
    dw $215C 

Spritemap_CorpseSkree_0:
    dw $0004,$C3FC 
    db $04 
    dw $7135,$C3FC 
    db $F4 
    dw $7115,$C3F4 
    db $04 
    dw $3135,$C3F4 
    db $F4 
    dw $3115 

Spritemap_CorpseSkree_1:
    dw $0004,$C3FC 
    db $04 
    dw $7127,$C3FC 
    db $F4 
    dw $7107,$C3F4 
    db $04 
    dw $3127,$C3F4 
    db $F4 
    dw $3107 

Spritemap_CorpseSkree_2:
    dw $0004,$C3FC 
    db $04 
    dw $712E,$C3FC 
    db $F4 
    dw $710E,$C3F4 
    db $04 
    dw $312E,$C3F4 
    db $F4 
    dw $310E 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Corpse_A9EDF7:
    dw $000A,$000C 
    db $FC 
    dw $2F0C,$0014 
    db $FC 
    dw $2F0D,$0004 
    db $FC 
    dw $2F0B,$01F4 
    db $FC 
    dw $2F0D,$01EC 
    db $FC 
    dw $2F0C,$01E4 
    db $FC 
    dw $2F0B,$0008 
    db $FC 
    dw $2F06,$0000 
    db $FC 
    dw $2F05,$01F8 
    db $FC 
    dw $2F01,$01F0 
    db $FC 
    dw $2F00 

UNUSED_Spritemap_Corpse_A9EE2B:
    dw $0003,$0004 
    db $FA 
    dw $2F0D,$01FC 
    db $FA 
    dw $2F0C,$01F4 
    db $FA 
    dw $2F0B 
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_CorpseSidehopper_Alive_0:
    dw $0007,$0000 
    db $EC 
    dw $2171,$01F8 
    db $EC 
    dw $2170,$C20C 
    db $04 
    dw $6176,$C3E4 
    db $04 
    dw $2176,$C208 
    db $F4 
    dw $6174,$C3E8 
    db $F4 
    dw $2174,$C3F8 
    db $F4 
    dw $2180 

Spritemap_CorpseSidehopper_Alive_1:
    dw $0007,$C3F8 
    db $F6 
    dw $2182,$C20D 
    db $04 
    dw $617A,$C3E3 
    db $04 
    dw $217A,$C208 
    db $F4 
    dw $6178,$C3E8 
    db $F4 
    dw $2178,$0000 
    db $EE 
    dw $2171,$01F8 
    db $EE 
    dw $2170 

Spritemap_CorpseSidehopper_Alive_2:
    dw $000B,$0010 
    db $0C 
    dw $6172,$0008 
    db $0C 
    dw $6173,$01F0 
    db $0C 
    dw $2173,$01E8 
    db $0C 
    dw $2172,$C208 
    db $FC 
    dw $617E,$C3E8 
    db $FC 
    dw $217E,$C208 
    db $EC 
    dw $617C,$C3E8 
    db $EC 
    dw $217C,$0000 
    db $E3 
    dw $2171,$01F8 
    db $E3 
    dw $2170,$C3F8 
    db $EB 
    dw $2180 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_GetYDividedByA_A9EEBF:
    STY.W $4204 
    SEP #$20 
    STA.W $4206 
    REP #$20 
    XBA 
    XBA 
    NOP 
    NOP 
    LDA.W $4214 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


CheckForEnemyCollisionWithEnemy:
    LDA.W $0F82,Y 
    CLC 
    ADC.W $0F82,X 
    INC A 
    STA.B $12 
    LDA.W $0F7A,Y 
    SEC 
    SBC.W $0F7A,X 
    BPL + 
    EOR.W #$FFFF 
    INC A 

  + CMP.B $12 
    BCS .return 
    LDA.W $0F84,Y 
    CLC 
    ADC.W $0F84,X 
    INC A 
    STA.B $12 
    LDA.W $0F7E,Y 
    SEC 
    SBC.W $0F7E,X 
    BPL + 
    EOR.W #$FFFF 
    INC A 

  + CMP.B $12 

.return:
    RTL 


CheckForEnemyCollisionWithRectangle:
    LDA.B $16 
    CLC 
    ADC.W $0F82,X 
    INC A 
    STA.B $1A 
    LDA.B $12 
    SEC 
    SBC.W $0F7A,X 
    BPL + 
    EOR.W #$FFFF 
    INC A 

  + CMP.B $1A 
    BCS .return 
    LDA.B $18 
    CLC 
    ADC.W $0F84,X 
    INC A 
    STA.B $1A 
    LDA.B $14 
    SEC 
    SBC.W $0F7E,X 
    BPL + 
    EOR.W #$FFFF 
    INC A 

  + CMP.B $1A 

.return:
    RTL 


InitAI_BabyMetroid:
    PHB 
    PEA.W $7E7E 
    PLB 
    PLB 
    LDA.W #$0000 
    LDX.W #$0FFE 

.loop:
    STA.W $2000,X 
    DEX 
    DEX 
    BPL .loop 
    PLB 
    LDX.W $0E54 
    LDA.W $0F86,X 
    ORA.W #$3000 
    STA.W $0F86,X 
    LDA.W #$0400 
    STA.W $0F96,X 
    LDA.W #InstList_BabyMetroid_Normal 
    STA.W $0F92,X 
    LDA.W #$0001 
    STA.W $0F94,X 
    STZ.W $0F90,X 
    LDA.W #Function_BabyMetroid_WaitForCamera 
    BIT.W $0911 
    BPL .notLeftDoor 
    LDA.W $0F86,X 
    ORA.W #$0500 
    STA.W $0F86,X 
    LDA.W #Function_BabyMetroid_Disappeared 

.notLeftDoor:
    STA.W $0FA8,X 
    STZ.W $0FAA,X 
    STZ.W $0FAC,X 
    LDA.W #$000A 
    STA.W $0FB0,X 
    STZ.W $0FB6,X 
    LDY.W #Palette_CorpseSidehopper 
    LDX.W #$0120 
    LDA.W #$0010 
    JSL.L WriteAColorsFromYToTargetColorIndexX 
    LDY.W #Palette_BabyMetroid 
    LDX.W #$0140 
    LDA.W #$0010 
    JSL.L WriteAColorsFromYToTargetColorIndexX 
    LDY.W #Palette_CorpseCommon 
    LDX.W #$01E0 
    LDA.W #$0010 
    JSL.L WriteAColorsFromYToTargetColorIndexX 
    RTL 


PowerBombReaction_BabyMetroid:
    LDX.W $0E54 
    LDA.W $0FB6,X 
    BEQ MainAI_BabyMetroid 
    JSR.W SignalBabyMetroidToLeave ; fallthrough to MainAI_BabyMetroid

MainAI_BabyMetroid:
    LDX.W $0E54 
    LDA.W #$7FFF 
    STA.W $0F8C,X 
    JSR.W ($0FA8,X) 
    JSL.L MoveEnemyAccordingToVelocity 
    LDA.L $7EC400 
    BNE .return 
    JSR.W HandleNormalBabyMetroidPalette 

.return:
    RTL 


Function_BabyMetroid_Disappeared:
    STZ.W $0FAA,X 
    STZ.W $0FAC,X 
    RTS 


Function_BabyMetroid_WaitForCamera:
    LDA.W $0911 
    CMP.W #$0201 
    BPL .return 
    LDA.W #$0200 
    STA.W $0911 
    LDA.L $7ECD20 
    AND.W #$00FF 
    STA.L $7ECD20 
    LDA.L $7ECD22 
    AND.W #$00FF 
    STA.L $7ECD22 
    JSL.L Spawn_Hardcoded_PLM 
    db $30,$03 
    dw PLMEntries_createBabyMetroidInvisibleWall 
    JSL.L Spawn_Hardcoded_PLM 
    db $1F,$03 
    dw PLMEntries_createBabyMetroidInvisibleWall 
    LDX.W $0E54 
    LDA.W #Function_BabyMetroid_LetSidehopperLiveForABit 
    STA.W $0FA8,X 
    LDA.W #$0001 
    STA.L $7E7808,X 

.return:
    RTS 


Function_BabyMetroid_LetSidehopperLiveForABit:
    LDA.W #Function_BabyMetroid_QueueBattleMusic 
    STA.W $0FA8,X 
    LDA.W #$01D0 
    STA.W $0FB2,X ; fallthrough to Function_BabyMetroid_QueueBattleMusic

Function_BabyMetroid_QueueBattleMusic:
    DEC.W $0FB2,X 
    BPL Function_BabyMetroid_RushToMiddleOfRoom_return 
    LDA.W #$0005 
    JSL.L QueueMusicDataOrTrack_8FrameDelay 
    LDA.W #Function_BabyMetroid_RushToMiddleOfRoom 
    STA.W $0FA8,X ; fallthrough to Function_BabyMetroid_RushToMiddleOfRoom

Function_BabyMetroid_RushToMiddleOfRoom:
    LDA.W #$0248 
    STA.B $12 
    LDA.W #$004A 
    STA.B $14 
    LDY.W #$000F 
    JSR.W GradduallyAccelerateTowardsPoint_1A_400 
    LDA.W #$0001 
    STA.B $16 
    STA.B $18 
    JSL.L CheckForEnemyCollisionWithRectangle 
    BCS Function_BabyMetroid_RushToMiddleOfRoom_return 
    LDA.W #Function_BabyMetroid_RushToSidehopper 
    STA.W $0FA8,X 

Function_BabyMetroid_RushToMiddleOfRoom_return:
    RTS 


Function_BabyMetroid_RushToSidehopper:
    LDA.W $0FBA,X 
    STA.B $12 
    LDA.W $0FBE,X 
    CLC 
    ADC.W #$FFE0 
    STA.B $14 
    LDY.W #$000F 
    JSR.W GradduallyAccelerateTowardsPoint_1A_400 
    TXA 
    CLC 
    ADC.W #$0040 
    TAY 
    JSL.L CheckForEnemyCollisionWithEnemy 
    BCS .return 
    LDA.W #Function_BabyMetroid_LatchOntoSidehopper 
    STA.W $0FA8,X 

.return:
    RTS 


Function_BabyMetroid_LatchOntoSidehopper:
    LDA.W $0FBA,X 
    STA.B $12 
    LDA.W $0FBE,X 
    CLC 
    ADC.W #$FFE0 
    STA.B $14 
    LDA.W #$0200 
    JSR.W AccelerateBabyMetroidTowardsPoint 
    BCS .reachedTarget 
    RTS 


.reachedTarget:
    STZ.W $0FAA,X 
    STZ.W $0FAC,X 
    LDA.W $0FBA,X 
    STA.W $0F7A,X 
    LDA.W $0FBE,X 
    CLC 
    ADC.W #$FFE0 
    STA.W $0F7E,X 
    LDA.W #InstList_BabyMetroid_LatchedOn 
    STA.W $0F92,X 
    LDA.W #$0001 
    STA.W $0F94,X 
    STZ.W $0F90,X 
    LDA.W #Function_BabyMetroid_DrainingSidehopper 
    STA.W $0FA8,X 
    LDA.W #$0001 
    STA.W $0FB0,X 
    STZ.W $0FB6,X 
    LDA.W #$0140 
    STA.W $0FB2,X 
    RTS 


Function_BabyMetroid_DrainingSidehopper:
    LDA.W $0FA4,X 
    AND.W #$0006 
    TAY 
    LDA.W ShakingOffsets_X,Y 
    ADC.W $0FBA,X 
    STA.W $0F7A,X 
    LDA.W ShakingOffsets_Y,Y 
    CLC 
    ADC.W $0FBE,X 
    CLC 
    ADC.W #$FFE0 
    STA.W $0F7E,X 
    DEC.W $0FB2,X 
    BNE .return 
    LDA.W #Function_BabyMetroid_MakeSidehopperRottable 
    STA.W $0FA8,X 
    LDA.W #InstList_BabyMetroid_FinishDraining 
    STA.W $0F92,X 
    LDA.W #$0001 
    STA.W $0F94,X 
    STZ.W $0F90,X 
    LDA.W #$000A 
    STA.W $0FB0,X 

.return:
    RTS 


Function_BabyMetroid_MakeSidehopperRottable:
    LDA.W #$0001 
    STA.L $7E7850 
    LDA.W #Function_BabyMetroid_MoveUp_UnlockCamera 
    STA.W $0FA8,X 
    LDA.W #$00C0 
    STA.W $0FB2,X ; fallthrough to Function_BabyMetroid_MoveUp_UnlockCamera

Function_BabyMetroid_MoveUp_UnlockCamera:
    LDA.W $0F7A,X 
    STA.B $12 
    LDA.W #$0068 
    STA.B $14 
    LDY.W #$0000 
    JSR.W GradduallyAccelerateTowardsPoint_1A_400 
    DEC.W $0FB2,X 
    BPL .return 
    LDA.W #Function_BabyMetroid_StareDownSamus 
    STA.W $0FA8,X 
    LDA.W #$0001 
    STA.W $0FB6,X 
    LDA.L $7ECD20 
    ORA.W #$0100 
    STA.L $7ECD20 
    LDA.L $7ECD22 
    ORA.W #$0100 
    STA.L $7ECD22 
    JSL.L Spawn_Hardcoded_PLM 
    db $30,$03 
    dw PLMEntries_clearBabyMetroidInvisibleWall 
    JSL.L Spawn_Hardcoded_PLM 
    db $1F,$03 
    dw PLMEntries_clearBabyMetroidInvisibleWall 

.return:
    RTS 


Function_BabyMetroid_StareDownSamus:
    LDA.W $0F7A,X 
    SEC 
    SBC.W $0AF6 
    BPL + 
    EOR.W #$FFFF 
    INC A 

  + CMP.W #$0008 
    BCS .notClose 
    LDA.L $7E7804,X 
    ADC.W #$0002 
    BRA + 


.notClose:
    LDA.L $7E7804,X 
    BEQ + 
    SEC 
    SBC.W #$0001 
    BPL + 
    LDA.W #$0000 

  + STA.L $7E7804,X 
    CMP.W #$0100 
    BCS .done 
    LDA.W $0AF6 
    CMP.W #$0200 
    BMI .done 
    LDA.L $7E7802,X 
    BEQ .zeroAggroTimer 
    DEC A 
    STA.L $7E7802,X 
    LDY.W $0AFA 
    BRA .notRareChance 


.zeroAggroTimer:
    LDY.W #$0050 
    LDA.W $05E5 
    AND.W #$0FFF 
    CMP.W #$0FE0 
    BCC .notRareChance 
    LDA.W #$0020 
    STA.L $7E7802,X 

.notRareChance:
    STY.B $14 
    LDA.W $0AF6 
    STA.B $12 
    LDX.W $0E54 
    LDY.W #$000A 
    JMP.W GradduallyAccelerateTowardsPoint_1A_400 


.done:
    LDX.W $0E54 
    LDA.W #Function_BabyMetroid_LatchOntoSamus 
    STA.W $0FA8,X 
    RTS 


Function_BabyMetroid_LatchOntoSamus:
    LDA.W $0AF6 
    STA.B $12 
    LDA.W $0AFA 
    SEC 
    SBC.W #$0020 
    STA.B $14 
    LDY.W #$000F 
    JMP.W GradduallyAccelerateTowardsPoint_1A_400 


Function_BabyMetroid_StartDrainingSamus:
    LDA.W #$0012 
    JSL.L Run_Samus_Command 
    LDA.W #Function_BabyMetroid_DrainingSamus 
    STA.W $0FA8 ; fallthrough to Function_BabyMetroid_DrainingSamus

Function_BabyMetroid_DrainingSamus:
    LDA.W $09C2 
    CMP.W #$0002 
    BCC .done 
    LDA.W #$0008 
    STA.W $0CCC 
    LDA.W #$0005 
    STA.W $0CD2 
    LDA.W #$0002 
    STA.W $0A66 
    LDA.W $0B2E 
    CMP.W #$0004 
    BMI .lessThan4 
    LDA.W #$0002 
    STA.W $0B2E 

.lessThan4:
    LDA.W $0FA4,X 
    AND.W #$0006 
    TAY 
    LDA.W ShakingOffsets_X,Y 
    ADC.W $0AF6 
    STA.W $0F7A,X 
    LDA.W ShakingOffsets_Y,Y 
    CLC 
    ADC.W #$FFEC 
    CLC 
    ADC.W $0AFA 
    STA.W $0F7E,X 
    JSL.L DamageSamusDueToBabyMetroid 
    RTS 


.done:
    STZ.W $0A66 
    STZ.W $0CD2 
    LDA.W #Function_BabyMetroid_StartHeelRealization 
    STA.W $0FA8,X 
    STZ.W $0FAA,X 
    STZ.W $0FAC,X 
    LDA.W #InstList_BabyMetroid_FinishDraining 
    JSL.L SetEnemyInstList 
    LDA.W #$000A 
    STA.W $0FB0,X 
    LDA.W #$0013 
    JSL.L Run_Samus_Command 
    LDA.W #$0000 
    JSL.L DrainedSamusController 
    LDA.W #$0000 
    STA.L $7E7808,X 
    LDA.W #$0007 
    JSL.L QueueMusicDataOrTrack_8FrameDelay 
    RTS 


Function_BabyMetroid_StartHeelRealization:
    LDA.W #Function_BabyMetroid_HeelRealization 
    STA.W $0FA8,X 
    LDA.W #$0078 
    STA.W $0FB2,X ; fallthrough to Function_BabyMetroid_HeelRealization

Function_BabyMetroid_HeelRealization:
    DEC.W $0FB2,X 
    BMI .timerExpired 
    RTS 


.timerExpired:
    LDA.W #Function_BabyMetroid_BackOffGuiltily 
    STA.W $0FA8,X 
    LDA.W #$00C0 
    STA.W $0FB2,X ; fallthrough to Function_BabyMetroid_BackOffGuiltily

Function_BabyMetroid_BackOffGuiltily:
    LDA.W $0AF6 
    STA.B $12 
    LDA.W #$0068 
    STA.B $14 
    LDX.W $0E54 
    LDY.W #$0000 
    JSR.W GradduallyAccelerateTowardsPoint_1A_400 
    DEC.W $0FB2,X 
    BMI .timerExpired 
    RTS 


.timerExpired:
    LDA.W #$007D 
    JSL.L QueueSound_Lib2_Max6 
    LDA.W #Function_BabyMetroid_GoLeftGuiltily 
    STA.W $0FA8,X 
    LDA.W #$0058 
    STA.W $0FB2,X 
    LDA.W #InstList_BabyMetroid_LatchedOn 
    STA.W $0F92,X 
    LDA.W #$0001 
    STA.W $0F94,X 
    STZ.W $0F90,X ; fallthrough to Function_BabyMetroid_GoLeftGuiltily

Function_BabyMetroid_GoLeftGuiltily:
    LDA.W $0AF6 
    CLC 
    ADC.W #$FFC0 
    STA.B $12 
    LDA.W #$0064 
    STA.B $14 
    LDX.W $0E54 
    LDY.W #$0000 
    JSR.W GradduallyAccelerateTowardsPoint_1A_400 
    DEC.W $0FB2,X 
    BMI .timerExpired 
    RTS 


.timerExpired:
    LDA.W #Function_BabyMetroid_GoRightGuiltily 
    STA.W $0FA8,X 
    LDA.W #$0058 
    STA.W $0FB2,X ; fallthrough to Function_BabyMetroid_GoRightGuiltily

Function_BabyMetroid_GoRightGuiltily:
    LDA.W $0AF6 
    CLC 
    ADC.W #$0060 
    STA.B $12 
    LDA.W #$0068 
    STA.B $14 
    LDX.W $0E54 
    LDY.W #$0000 
    JSR.W GradduallyAccelerateTowardsPoint_1A_400 
    DEC.W $0FB2,X 
    BMI .timerExpired 
    RTS 


.timerExpired:
    LDX.W $0E54 
    LDA.W #Function_BabyMetroid_SamusRecovering 
    STA.W $0FA8,X 
    LDA.W #$0100 
    STA.W $0FB2,X 
    LDA.W #InstList_BabyMetroid_Remorse 
    STA.W $0F92,X 
    LDA.W #$0001 
    STA.W $0F94,X 
    STZ.W $0F90,X 
    RTS 


Function_BabyMetroid_FleeRemorsefully:
    LDA.W #$0052 
    JSL.L QueueSound_Lib2_Max6 
    LDA.W #Function_BabyMetroid_Fleeing 
    STA.W $0FA8,X ; fallthrough to Function_BabyMetroid_Fleeing

Function_BabyMetroid_Fleeing:
    LDA.W #$FF80 
    STA.B $12 
    LDA.W #$0040 
    STA.B $14 
    LDX.W $0E54 
    LDY.W #$0000 
    JSR.W GradduallyAccelerateTowardsPoint_1A_400 
    LDA.W #$0008 
    STA.B $16 
    STA.B $18 
    JSL.L CheckForEnemyCollisionWithRectangle 
    BCS .return 
    STZ.W $0FAA,X 
    STZ.W $0FAC,X 
    LDA.W $0F86,X 
    AND.W #$DEFF 
    STA.W $0F86,X 
    LDA.W #Function_BabyMetroid_Disappeared 
    STA.W $0FA8,X 

.return:
    RTS 


Function_BabyMetroid_SamusRecovering:
    DEC.W $0FB2,X 
    BMI .timerExpired 
    JMP.W GraduallyAccelerateTowardSamus 


.timerExpired:
    LDA.W #$0002 
    JSL.L DrainedSamusController 
    LDA.W #$0001 
    STA.W $0FB6,X 
    LDA.W #Function_BabyMetroid_Remorse 
    STA.W $0FA8,X ; fallthrough to Function_BabyMetroid_Remorse

Function_BabyMetroid_Remorse:
    JSR.W GraduallyAccelerateTowardSamus 
    BCS MakeBabyMetroidFlee 
    RTS 


MakeBabyMetroidFlee:
    LDA.W #Function_BabyMetroid_FleeRemorsefully 
    STA.W $0FA8,X 
    RTS 


SignalBabyMetroidToLeave:
    LDA.W $0FA8,X 
    CMP.W #Function_BabyMetroid_Remorse 
    BEQ MakeBabyMetroidFlee 
    RTS 


GraduallyAccelerateTowardSamus:
    LDA.W $0F7A,X 
    SEC 
    SBC.W $0AF6 
    BPL + 
    EOR.W #$FFFF 
    INC A 

  + CMP.W #$0002 
    BCS .notClose 
    LDA.L $7E7804,X 
    ADC.W #$0002 
    BRA + 


.notClose:
    LDA.L $7E7804,X 
    BEQ + 
    SEC 
    SBC.W #$0001 
    BPL + 
    LDA.W #$0000 

  + STA.L $7E7804,X 
    LDA.L $7E7802,X 
    BEQ .zeroAggroTimer 
    DEC A 
    STA.L $7E7802,X 
    LDA.W $0AFA 
    CLC 
    ADC.W #$FFEE 
    TAY 
    BRA + 


.zeroAggroTimer:
    LDY.W #$0050 
    LDA.W $05E5 
    AND.W #$0FFF 
    CMP.W #$0FE0 
    BCC + 
    LDA.W #$0020 
    STA.L $7E7802,X 

  + STY.B $14 
    LDA.W $0AF6 
    STA.B $12 
    LDX.W $0E54 
    LDY.W #$0008 
    JSR.W GradduallyAccelerateTowardsPoint_1A_400 
    LDA.L $7E7804,X 
    CMP.W #$0400 
    BCS .returnReadyToFlee 
    LDA.W $0AF6 
    CMP.W #$0080 
    BMI .returnReadyToFlee 
    CLC 
    RTS 


.returnReadyToFlee:
    SEC 
    RTS 


GradduallyAccelerateTowardsPoint_1A_400:
    LDA.W #$0400 
    STA.B $1A 
    BRA GradduallyAccelerateTowardsPoint 


GradduallyAccelerateTowardsPoint_1A_4:
    LDA.W #$0004 
    STA.B $1A 
    BRA GradduallyAccelerateTowardsPoint 


GradduallyAccelerateTowardsPoint_1A_8:
    LDA.W #$0008 
    STA.B $1A 
    BRA GradduallyAccelerateTowardsPoint 


GradduallyAccelerateTowardsPoint_1A_10:
    LDA.W #$0010 
    STA.B $1A ; fallthrough to GradduallyAccelerateTowardsPoint

GradduallyAccelerateTowardsPoint:
    LDA.W GradualAccelerationDivisorTable,Y 
    AND.W #$00FF 
    STA.B $18 
    JSR.W GraduallyAccelerateHorizontally 
    LDA.W $0F7E,X 
    SEC 
    SBC.B $14 
    BEQ .return 
    BPL .up 
    EOR.W #$FFFF 
    INC A 
    STA.W $4204 
    SEP #$20 
    LDA.B $18 
    STA.W $4206 
    REP #$20 
    XBA 
    XBA 
    NOP 
    NOP 
    LDA.W $4214 
    BNE + 
    INC A 

  + STA.B $16 
    LDA.W $0FAC,X 
    BPL .movingDown 
    CLC 
    ADC.W #$0008 
    ADC.B $16 

.movingDown:
    ADC.B $16 
    CMP.W #$0500 
    BMI .storeDownwardVelocity 
    LDA.W #$0500 

.storeDownwardVelocity:
    STA.W $0FAC,X 

.return:
    RTS 


.up:
    STA.W $4204 
    SEP #$20 
    LDA.B $18 
    STA.W $4206 
    REP #$20 
    XBA 
    XBA 
    NOP 
    NOP 
    LDA.W $4214 
    BNE + 
    INC A 

  + STA.B $16 
    LDA.W $0FAC,X 
    BMI .movingUp 
    SEC 
    SBC.W #$0008 
    SBC.B $16 

.movingUp:
    SBC.B $16 
    CMP.W #$FB00 
    BPL .storeUpwardVelocity 
    LDA.W #$FB00 

.storeUpwardVelocity:
    STA.W $0FAC,X 
    RTS 


GraduallyAccelerateHorizontally:
    LDA.W $0F7A,X 
    SEC 
    SBC.B $12 
    BEQ .return 
    BPL .left 
    EOR.W #$FFFF 
    INC A 
    STA.W $4204 
    SEP #$20 
    LDA.B $18 
    STA.W $4206 
    REP #$20 
    XBA 
    XBA 
    NOP 
    NOP 
    LDA.W $4214 
    BNE + 
    INC A 

  + STA.B $16 
    LDA.W $0FAA,X 
    BPL .movingRight 
    PHA 
    JSL.L CheckIfEnemyIsVagulyOnScreen 
    PLA 
    BCC .onScreenRight 
    ADC.B $1A 

.onScreenRight:
    CLC 
    ADC.W #$0008 
    ADC.B $16 

.movingRight:
    ADC.B $16 
    CMP.W #$0800 
    BMI .storeRightwardVelocity 
    LDA.W #$0800 

.storeRightwardVelocity:
    STA.W $0FAA,X 

.return:
    RTS 


.left:
    STA.W $4204 
    SEP #$20 
    LDA.B $18 
    STA.W $4206 
    REP #$20 
    XBA 
    XBA 
    NOP 
    NOP 
    LDA.W $4214 
    BNE + 
    INC A 

  + STA.B $16 
    LDA.W $0FAA,X 
    BMI .movingLeft 
    PHA 
    JSL.L CheckIfEnemyIsVagulyOnScreen 
    PLA 
    BCC ..onScreen 
    SBC.B $1A 

..onScreen:
    SEC 
    SBC.W #$0008 
    SBC.B $16 

.movingLeft:
    SBC.B $16 
    CMP.W #$F800 
    BPL .storeLeftwardVelocity 
    LDA.W #$F800 

.storeLeftwardVelocity:
    STA.W $0FAA,X 
    RTS 


GradualAccelerationDivisorTable:
    db $10,$0F,$0E,$0D,$0C,$0B,$0A,$09,$08,$07,$06,$05,$04,$03,$02,$01 

CheckIfEnemyIsVagulyOnScreen:
    LDA.W $0F7E,X 
    BMI .returnOffScreen 
    CLC 
    ADC.W #$0060 
    SEC 
    SBC.W $0915 
    BMI .returnOffScreen 
    CMP.W #$01A0 
    BPL .returnOffScreen 
    LDA.W $0F7A,X 
    BMI .returnOffScreen 
    CLC 
    ADC.W #$0010 
    SEC 
    SBC.W $0911 
    BMI .returnOffScreen 
    CMP.W #$0120 
    BPL .returnOffScreen 
    CLC 
    RTL 


.returnOffScreen:
    SEC 
    RTL 


AccelerateBabyMetroidTowardsPoint:
    STA.B $16 
    STZ.B $1C 
    JSR.W AccelerateBabyMetroidTowardsXPosition 
    JSR.W AccelerateBabyMetroidTowardsYPosition 
    LSR.B $1C 
    LSR.B $1C 
    RTS 


AccelerateBabyMetroidTowardsYPosition:
    LDA.W $0F7E,X 
    SEC 
    SBC.B $14 
    BEQ .reachedTarget 
    BPL .up 
    LDA.W $0FAC,X 
    CLC 
    ADC.B $16 
    CMP.W #$0500 
    BMI + 
    LDA.W #$0500 

  + STA.W $0FAC,X 
    AND.W #$FF00 
    XBA 
    BPL + 
    ORA.W #$FF00 

  + CLC 
    ADC.W $0F7E,X 
    CMP.B $14 
    BMI .returnUpper 
    STZ.W $0FAC,X 
    LDA.B $14 

.reachedTarget:
    INC.B $1C 

.returnUpper:
    RTS 


.up:
    LDA.W $0FAC,X 
    SEC 
    SBC.B $16 
    CMP.W #$FB00 
    BPL + 
    LDA.W #$FB00 

  + STA.W $0FAC,X 
    AND.W #$FF00 
    XBA 
    BPL + 
    ORA.W #$FF00 

  + CLC 
    ADC.W $0F7E,X 
    CMP.B $14 
    BEQ .resetVelocity 
    BPL .returnLower 

.resetVelocity:
    STZ.W $0FAC,X 
    LDA.B $14 
    INC.B $1C 

.returnLower:
    RTS 


AccelerateBabyMetroidTowardsXPosition:
    LDA.W $0F7A,X 
    SEC 
    SBC.B $12 
    BPL .left 
    EOR.W #$FFFF 
    INC A 
    LDA.W $0FAA,X 
    CLC 
    ADC.B $16 
    CMP.W #$0500 
    BMI + 
    LDA.W #$0500 

  + STA.W $0FAA,X 
    AND.W #$FF00 
    XBA 
    BPL + 
    ORA.W #$FF00 

  + CLC 
    ADC.W $0F7A,X 
    CMP.B $12 
    BMI .returnUpper 
    STZ.W $0FAA,X 
    LDA.B $12 
    INC.B $1C 

.returnUpper:
    RTS 


.left:
    LDA.W $0FAA,X 
    SEC 
    SBC.B $16 
    CMP.W #$FB00 
    BPL + 
    LDA.W #$FB00 

  + STA.W $0FAA,X 
    AND.W #$FF00 
    XBA 
    BPL + 
    ORA.W #$FF00 

  + CLC 
    ADC.W $0F7A,X 
    CMP.B $12 
    BEQ .resetVelocity 
    BPL .returnLower 

.resetVelocity:
    STZ.W $0FAA,X 
    LDA.B $12 
    INC.B $1C 

.returnLower:
    RTS 


HandleNormalBabyMetroidPalette:
    LDA.W #$014A 
    STA.B $12 
    LDA.W #BabyMetroidColors_Normal 
    STA.B $16 
    BRA HandleBabyMetroidPalette 


HandleBabyMetroidCutscenePalette_Normal:
    LDA.W #$01EA 
    STA.B $12 
    LDA.W #BabyMetroidColors_Normal 
    STA.B $16 
    BRA HandleBabyMetroidPalette 


HandleBabyMetroidCutscenePalette_LowHealth:
    LDA.W #$01EA 
    STA.B $12 
    LDA.W #BabyMetroidColors_LowHealth 
    STA.B $16 ; fallthrough to HandleBabyMetroidPalette

HandleBabyMetroidPalette:
    LDX.W $0E54 
    SEP #$20 
    LDA.W $0FAF,X 
    BEQ .timerExpired 
    DEC A 
    STA.W $0FAF,X 
    REP #$20 
    RTS 


.timerExpired:
    LDA.W $0FB0,X 
    STA.W $0FAF,X 
    LDA.W $0FAE,X 
    INC A 
    AND.B #$07 
    STA.W $0FAE,X 
    REP #$20 
    AND.W #$00FF 
    JSR.W HandleBabyMetroidCrySFX 
    ASL A 
    ASL A 
    ASL A 
    ADC.B $16 
    TAY 
    LDX.B $12 
    LDA.W #$0004 
    JSL.L WriteAColorsFromYtoColorIndexX 
    RTS 


BabyMetroidColors_Normal:
    dw $72FF,$2CDF,$24B9,$1CAF,$5E5F,$183F,$1014,$080A 
    dw $49BA,$041A,$000F,$0005,$3515,$0015,$000A,$0005 
    dw $3515,$0015,$000A,$0005,$49BA,$041A,$000F,$0005 
    dw $5E5F,$183F,$1014,$080A,$72FF,$2CDF,$24B9,$1CAF 

BabyMetroidColors_LowHealth:
    dw $5990,$3870,$346D,$3068,$494D,$306D,$284A,$2446 
    dw $3D0B,$244B,$2048,$1844,$2CC8,$1C48,$1425,$0C22 
    dw $2CC8,$1C48,$1425,$0C22,$3D0B,$244B,$2048,$1844 
    dw $494D,$306D,$284A,$2446,$5990,$3870,$346D,$3068 

HandleBabyMetroidCrySFX:
    CMP.W #$0005 
    BEQ .timerExpired 
    RTS 


.timerExpired:
    PHA 
    PHY 
    LDA.L $7E7808,X 
    BEQ .return 
    LDA.L $7E780A,X 
    INC A 
    STA.L $7E780A,X 
    CMP.W #$0004 
    BCC .return 
    LDA.W #$0000 
    STA.L $7E780A,X 
    LDA.W #$0072 
    LDY.W $0FB0,X 
    CPY.W #$000A 
    BCS .queueSFX 
    LDA.W #$0078 

.queueSFX:
    JSL.L QueueSound_Lib2_Max6 

.return:
    PLY 
    PLA 
    RTS 


EnemyTouch_BabyMetroid:
    LDX.W $0E54 
    LDA.W $0FB6,X 
    BEQ .return 
    JSR.W SignalBabyMetroidToLeave 
    LDA.W $0A1F 
    AND.W #$00FF 
    CMP.W #$0003 
    BNE .notSpinJumping 
    LDA.W $0AF6 
    CMP.W #$0200 
    BPL .repelled 

.notSpinJumping:
    LDA.W $0FA8,X 
    CMP.W #Function_BabyMetroid_LatchOntoSamus 
    BEQ .latchedOntoSamus 
    CMP.W #Function_BabyMetroid_StareDownSamus 
    BNE .return 
    LDA.W #Function_BabyMetroid_LatchOntoSamus 
    STA.W $0FA8,X 

.return:
    RTL 


.latchedOntoSamus:
    LDA.W $0AF6 
    STA.B $12 
    LDA.W $0AFA 
    SEC 
    SBC.W #$0020 
    STA.B $14 
    LDA.W #$0200 
    JSR.W AccelerateBabyMetroidTowardsPoint 
    BCC .return 
    LDX.W $0E54 
    LDA.W #InstList_BabyMetroid_LatchedOn 
    STA.W $0F92,X 
    LDA.W #$0001 
    STA.W $0F94,X 
    STZ.W $0F90,X 
    LDA.W #$0001 
    STA.W $0FB0,X 
    STZ.W $0FB6,X 
    STZ.W $0FAA,X 
    STZ.W $0FAC,X 
    LDA.W #Function_BabyMetroid_StartDrainingSamus 
    STA.W $0FA8,X 
    RTL 


.repelled:
    LDA.W $0AF6 
    SEC 
    SBC.W $0F7A,X 
    STA.B $12 
    LDA.W $0AFA 
    SEC 
    SBC.W $0F7E,X 
    STA.B $14 
    JSL.L CalculateAngleOf_12_14_Offset 
    SEC 
    SBC.W #$0080 
    EOR.W #$FFFF 
    INC A 
    CLC 
    ADC.W #$0080 
    AND.W #$00FF 
    STA.B $12 
    LDA.W #$0040 
    PHA 
    JSL.L Math_86C26C 
    LDX.W $0E54 
    CLC 
    ADC.W $0FAA,X 
    STA.W $0FAA,X 
    PLA 
    JSL.L Math_86C272 
    LDX.W $0E54 
    CLC 
    ADC.W $0FAC,X 
    STA.W $0FAC,X 
    RTL 


EnemyShot_BabyMetroid:
    LDX.W $0E54 
    LDA.W $0FB6,X 
    BEQ .return 
    JSR.W SignalBabyMetroidToLeave 
    LDA.W $0B64 
    SEC 
    SBC.W $0F7A,X 
    STA.B $12 
    LDA.W $0B78 
    SEC 
    SBC.W $0F7E,X 
    STA.B $14 
    JSL.L CalculateAngleOf_12_14_Offset 
    SEC 
    SBC.W #$0080 
    EOR.W #$FFFF 
    INC A 
    CLC 
    ADC.W #$0080 
    AND.W #$00FF 
    STA.B $12 
    LDA.W $18A6 
    ASL A 
    TAX 
    LDA.W $0C2C,X 
    ASL A 
    ASL A 
    ASL A 
    CMP.W #$00F0 
    BCC + 
    LDA.W #$00F0 

  + PHA 
    JSL.L Math_86C26C 
    LDX.W $0E54 
    CLC 
    ADC.W $0FAA,X 
    STA.W $0FAA,X 
    PLA 
    JSL.L Math_86C272 
    LDX.W $0E54 
    CLC 
    ADC.W $0FAC,X 
    STA.W $0FAC,X 

.return:
    RTL 


Palette_CorpseCommon:
    dw $3800,$57FF,$42F7,$0929,$00A5,$7FFF,$4231,$0043 
    dw $4B3F,$42DB,$3678,$2E14,$2190,$192C,$0CC9,$0465 

Palette_CorpseSidehopper:
    dw $3800,$7FFF,$56E0,$3180,$18C0,$6BC0,$5EC0,$4A20 
    dw $35A0,$7FFF,$039C,$0237,$00D1,$03FF,$0237,$00D1 

Palette_BabyMetroid:
    dw $3800,$57B8,$0B11,$1646,$00E3,$72FF,$2CDF,$24B9 
    dw $1CAF,$18A9,$4F9F,$3ED8,$2E12,$08CD,$7FFF,$0000 

InstList_BabyMetroid_FinishDraining:
    dw $0080 
    dw Spritemap_BabyMetroid_2 
    dw $0010 
    dw Spritemap_BabyMetroid_1 

InstList_BabyMetroid_Normal:
    dw $0010 
    dw Spritemap_BabyMetroid_0 
    dw $0010 
    dw Spritemap_BabyMetroid_1 
    dw $0010 
    dw Spritemap_BabyMetroid_2 
    dw $0010 
    dw Spritemap_BabyMetroid_1 
    dw Instruction_BabyMetroid_GotoNormal 

Instruction_BabyMetroid_GotoNormal:
    LDY.W #InstList_BabyMetroid_Normal 
    RTL 


InstList_BabyMetroid_LatchedOn:
    dw $0008 
    dw Spritemap_BabyMetroid_0 
    dw $0008 
    dw Spritemap_BabyMetroid_1 
    dw $0005 
    dw Spritemap_BabyMetroid_2 
    dw $0002 
    dw Spritemap_BabyMetroid_1 
    dw Instruction_GotoLatchedOn 

Instruction_GotoLatchedOn:
    LDY.W #InstList_BabyMetroid_LatchedOn 
    RTL 


InstList_BabyMetroid_Remorse:
    dw $000A 
    dw Spritemap_BabyMetroid_0 
    dw $000A 
    dw Spritemap_BabyMetroid_1 
    dw $000A 
    dw Spritemap_BabyMetroid_2 
    dw $000A 
    dw Spritemap_BabyMetroid_1 
    dw $000A 
    dw Spritemap_BabyMetroid_0 
    dw $000A 
    dw Spritemap_BabyMetroid_1 
    dw $000A 
    dw Spritemap_BabyMetroid_2 
    dw $000A 
    dw Spritemap_BabyMetroid_1 
    dw Instruction_BabyMetroid_GotoY_OrPlayRemorseSFX 
    dw InstList_BabyMetroid_Remorse 
    dw $0006 
    dw Spritemap_BabyMetroid_0 
    dw $0005 
    dw Spritemap_BabyMetroid_1 
    dw $0004 
    dw Spritemap_BabyMetroid_2 
    dw $0003 
    dw Spritemap_BabyMetroid_1 
    dw $0002 
    dw Spritemap_BabyMetroid_0 
    dw $0003 
    dw Spritemap_BabyMetroid_1 
    dw $0004 
    dw Spritemap_BabyMetroid_2 
    dw $0005 
    dw Spritemap_BabyMetroid_1 
    dw $0006 
    dw Spritemap_BabyMetroid_0 
    dw $0007 
    dw Spritemap_BabyMetroid_1 
    dw $0008 
    dw Spritemap_BabyMetroid_2 
    dw $0009 
    dw Spritemap_BabyMetroid_1 
    dw Instruction_BabyMetroid_GotoRemorse 

Instruction_BabyMetroid_GotoRemorse:
    LDY.W #InstList_BabyMetroid_Remorse 
    RTL 


Instruction_BabyMetroid_GotoY_OrPlayRemorseSFX:
    LDA.W $05E5 
    BPL .gotoY 
    LDA.W #$0052 
    JSL.L QueueSound_Lib2_Max6 
    INY 
    INY 
    RTL 


.gotoY:
    LDA.W $0000,Y 
    TAY 
    RTL 


Spritemap_BabyMetroid_0:
    dw $001E,$0000 
    db $18 
    dw $6120,$01F8 
    db $18 
    dw $2120,$C208 
    db $18 
    dw $6105,$C3E8 
    db $18 
    dw $2105,$C210 
    db $18 
    dw $6104,$C3E0 
    db $18 
    dw $2104,$C200 
    db $08 
    dw $6148,$C3F0 
    db $08 
    dw $2148,$C208 
    db $08 
    dw $6147,$C218 
    db $08 
    dw $6145,$C3E8 
    db $08 
    dw $2147,$C3D8 
    db $08 
    dw $2145,$C218 
    db $F8 
    dw $6125,$C208 
    db $F8 
    dw $6127,$C200 
    db $F8 
    dw $6128,$C3F0 
    db $F8 
    dw $2128,$C3E8 
    db $F8 
    dw $2127,$C3D8 
    db $F8 
    dw $2125,$0018 
    db $E0 
    dw $6131,$C218 
    db $E8 
    dw $6140,$C208 
    db $E8 
    dw $6142,$C208 
    db $D8 
    dw $6122,$C200 
    db $D8 
    dw $6123,$C200 
    db $E8 
    dw $6143,$C3F0 
    db $E8 
    dw $2143,$C3F0 
    db $D8 
    dw $2123,$01E0 
    db $E0 
    dw $2131,$C3D8 
    db $E8 
    dw $2140,$C3E8 
    db $E8 
    dw $2142,$C3E8 
    db $D8 
    dw $2122 

Spritemap_BabyMetroid_1:
    dw $001E,$C200 
    db $08 
    dw $614E,$C3F0 
    db $08 
    dw $214E,$C218 
    db $08 
    dw $6145,$C210 
    db $08 
    dw $612E,$C3E0 
    db $08 
    dw $212E,$C3D8 
    db $08 
    dw $2145,$000D 
    db $28 
    dw $6130,$01EB 
    db $28 
    dw $2130,$C200 
    db $18 
    dw $6102,$C210 
    db $18 
    dw $6100,$C3F0 
    db $18 
    dw $2102,$C3E0 
    db $18 
    dw $2100,$C200 
    db $F8 
    dw $6128,$C3F0 
    db $F8 
    dw $2128,$C208 
    db $F8 
    dw $6127,$C218 
    db $F8 
    dw $6125,$C3E8 
    db $F8 
    dw $2127,$C3D8 
    db $F8 
    dw $2125,$C200 
    db $E8 
    dw $6143,$C200 
    db $D8 
    dw $6123,$C3F0 
    db $E8 
    dw $2143,$C3F0 
    db $D8 
    dw $2123,$C218 
    db $E8 
    dw $6140,$C208 
    db $E8 
    dw $6142,$C208 
    db $D8 
    dw $6122,$C3E8 
    db $E8 
    dw $2142,$C3E8 
    db $D8 
    dw $2122,$C3D8 
    db $E8 
    dw $2140,$0018 
    db $E0 
    dw $6131,$01E0 
    db $E0 
    dw $2131 

Spritemap_BabyMetroid_2:
    dw $001E,$C208 
    db $F8 
    dw $6127,$C3E8 
    db $F8 
    dw $2127,$0015 
    db $28 
    dw $6121,$01E3 
    db $28 
    dw $2121,$C200 
    db $18 
    dw $614C,$C210 
    db $18 
    dw $614A,$C200 
    db $08 
    dw $612C,$C210 
    db $08 
    dw $612A,$C3F0 
    db $18 
    dw $214C,$C3E0 
    db $18 
    dw $214A,$C3F0 
    db $08 
    dw $212C,$C3E0 
    db $08 
    dw $212A,$C218 
    db $08 
    dw $6145,$C3D8 
    db $08 
    dw $2145,$C200 
    db $F8 
    dw $6128,$C3F0 
    db $F8 
    dw $2128,$C218 
    db $F8 
    dw $6125,$C3D8 
    db $F8 
    dw $2125,$0018 
    db $E0 
    dw $6131,$01E0 
    db $E0 
    dw $2131,$C200 
    db $E8 
    dw $6143,$C200 
    db $D8 
    dw $6123,$C3F0 
    db $E8 
    dw $2143,$C3F0 
    db $D8 
    dw $2123,$C208 
    db $E8 
    dw $6142,$C208 
    db $D8 
    dw $6122,$C3E8 
    db $E8 
    dw $2142,$C3E8 
    db $D8 
    dw $2122,$C218 
    db $E8 
    dw $6140,$C3D8 
    db $E8 
    dw $2140 

Freespace_BankA9_FB70: 
; $490 bytes
