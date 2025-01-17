
org $A58000


CommonA5_GrappleAI_NoInteraction:
    JSL.L GrappleAI_SwitchEnemyAIToMainAI 
    RTL 


CommonA5_GrappleAI_SamusLatchesOn:
    JSL.L GrappleAI_SamusLatchesOnWithGrapple 
    RTL 


CommonA5_GrappleAI_KillEnemy:
    JSL.L GrappleAI_EnemyGrappleDeath 
    RTL 


CommonA5_GrappleAI_CancelGrappleBeam:
    JSL.L GrappleAI_SwitchToFrozenAI 
    RTL 


CommonA5_GrappleAI_SamusLatchesOn_NoInvincibility:
    JSL.L GrappleAI_SamusLatchesOnWithGrapple_NoInvincibility 
    RTL 


UNUSED_CommonA5_GrappleAI_SamusLatchesOn_ParalyzeEnemy_A58019:
    JSL.L GrappleAI_SamusLatchesOnWithGrapple_ParalyzeEnemy 
    RTL 


CommonA5_GrappleAI_HurtSamus:
    JSL.L GrappleAI_SwitchToFrozenAI_duplicate 
    RTL 


CommonA5_NormalEnemyTouchAI:
    JSL.L NormalEnemyTouchAI 
    RTL 


CommonA5_NormalTouchAI_NoDeathCheck:
    JSL.L NormalEnemyTouchAI_NoDeathCheck_External 
    RTL 


CommonA5_NormalEnemyShotAI:
    JSL.L NormalEnemyShotAI 
    RTL 


CommonA5_NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic:
    JSL.L NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External 
    RTL 


CommonA5_NormalEnemyPowerBombAI:
    JSL.L NormalEnemyPowerBombAI 
    RTL 


CommonA5_NormalEnemyPowerBombAI_NoDeathCheck:
    JSL.L NormalEnemyPowerBombAI_NoDeathCheck_External 
    RTL 


CommonA5_NormalEnemyFrozenAI:
    JSL.L NormalEnemyFrozenAI 
    RTL 


CommonA5_CreateADudShot:
    JSL.L CreateADudShot 
    RTL 


RTS_A5804B:
    RTS 


RTL_A5804C:
    RTL 


Spritemap_CommonA5_Nothing:
    dw $0000 

ExtendedSpritemap_CommonA5_Nothing:
    dw $0001,$0000,$0000 
    dw Spritemap_CommonA5_Nothing 
    dw Hitbox_CommonA5_Nothing 

Hitbox_CommonA5_Nothing:
    dw $0001,$0000,$0000,$0000,$0000 
    dw CommonA5_NormalEnemyTouchAI 
    dw CommonA5_NormalEnemyShotAI 

InstList_CommonA5_DeleteEnemy:
    dw Instruction_CommonA5_DeleteEnemy 

NOPNOP_A58069:
    NOP #2
    Instruction_CommonA5_Enemy0FB2_InY:
    LDA.W $0000,Y : STA.W $0FB2,X 
    INY #2
    RTL 


Instruction_CommonA5_SetEnemy0FB2ToRTS:
    LDA.W #RTS_A5807B : STA.W $0FB2,X 
    RTL 


RTS_A5807B:
    RTS 


Instruction_CommonA5_DeleteEnemy:
    LDA.W $0F86,X : ORA.W #$0200 : STA.W $0F86,X 
    PLA : PEA.W ProcessEnemyInstructions_return-1 
    RTL 


Instruction_CommonA5_CallFunctionInY:
    LDA.W $0000,Y : STA.B $12 
    PHY : PHX : PEA.W .manualReturn-1 
    JMP.W ($0012) 


.manualReturn:
    PLX : PLY 
    INY #2
    RTL 


Instruction_CommonA5_CallFunctionInY_WithA:
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
UNUSED_Instruction_CommonA5_CallExternalFunctionInY_A580B5:
    LDA.W $0000,Y : STA.B $12 
    LDA.W $0001,Y : STA.B $13 
    PHX : PHY 
    JSL.L .externalFunction 
    PLY : PLX 
    INY #3
    RTL 


.externalFunction:
    JML.W [$0012] 


UNUSED_Inst_CommonA5_CallExternalFunctionInY_WithA_A580CE:
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


Instruction_CommonA5_GotoY:
    LDA.W $0000,Y 
    TAY 
    RTL 


Instruction_CommonA5_GotoY_PlusY:
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


Instruction_CommonA5_DecrementTimer_GotoYIfNonZero:
    DEC.W $0F90,X 
    BNE Instruction_CommonA5_GotoY 
    INY #2
    RTL 


Instruction_CommonA5_DecrementTimer_GotoYIfNonZero_duplicate:
    DEC.W $0F90,X 
    BNE Instruction_CommonA5_GotoY 
    INY #2
    RTL 


Instruction_CommonA5_DecrementTimer_GotoY_PlusY_IfNonZero:
    SEP #$20 
    DEC.W $0F90,X 
    REP #$20 
    BNE Instruction_CommonA5_GotoY_PlusY 
    INY 
    RTL 


Instruction_CommonA5_TimerInY:
    LDA.W $0000,Y : STA.W $0F90,X 
    INY #2
    RTL 


Instruction_CommonA5_SkipNextInstruction:
    INY #2
    RTL 


Instruction_CommonA5_Sleep:
    DEY #2
    TYA 
    STA.W $0F92,X 
    PLA : PEA.W ProcessEnemyInstructions_return-1 
    RTL 


Instruction_CommonA5_WaitYFrames:
    LDA.W $0000,Y : STA.W $0F94,X 
    INY #2
    TYA 
    STA.W $0F92,X 
    PLA : PEA.W ProcessEnemyInstructions_return-1 
    RTL 


Instruction_CommonA5_TransferYBytesInYToVRAM:
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


Instruction_CommonA5_EnableOffScreenProcessing:
    LDA.W $0F86,X : ORA.W #$0800 : STA.W $0F86,X 
    RTL 


Instruction_CommonA5_DisableOffScreenProcessing:
    LDA.W $0F86,X : AND.W #$F7FF : STA.W $0F86,X 
    RTL 


CommonA5EnemySpeeds_LinearlyIncreasing:
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

CommonA5EnemySpeeds_QuadraticallyIncreasing:
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

InitAI_DraygonBody:
    LDX.W #$0030 

.loopTargetPalette:
    LDA.W Palette_Draygon_Sprite1,X : STA.L $7EC320,X 
    DEX #2
    BPL .loopTargetPalette 
    LDX.W #$0FFE 
    LDA.W #$0338 

.loopBG2Tilemap:
    STA.L $7E2000,X 
    DEX #2
    BPL .loopBG2Tilemap 
    LDX.W $0E54 
    LDA.W #$0700 
    ASL A 
    STA.W $0F96,X 
    LDA.W #$00A5 : STA.W $178E 
    LDA.W #EnemyGraphicsDrawnHook_Draygon_SetBG2XYScroll : STA.W $178C 
    LDA.W #$FFFF : STA.W $183C 
    LDA.W #InstList_DraygonBody_FacingLeft_Idle : STA.W $0F92 
    LDA.W #InstList_DraygonEye_FacingLeft_Idle : STA.W $0FD2 
    LDA.W #InstList_DraygonTail_FacingLeft_FakeTailWhip : STA.W $1012 
    LDA.W #InstList_DraygonArms_FacingLeft_NearSwoopApex : STA.W $1052 
    LDA.W #$0400 : STA.W $179A 
    LDA.W #Function_DraygonBody_FightIntro_InitialDelay : STA.W $0FA8,X 
    JSL.L Spawn_DraygonMainScreenLayers_HDMAObject 
    LDA.W #$000C : STA.B $A9 
    JSL.L Spawn_BG3_Scroll_HDMA_Object 
    LDA.W #$0001 : STA.L $7E880A 
    JSL.L DisableMinimap_MarkBossRoomTilesExplored 
    RTL 


MainAI_DraygonBody:
    LDX.W $0E54 
    JSR.W ($0FA8,X) 
    LDA.W $0F7A : STA.W $0FBA 
    STA.W $0FFA 
    STA.W $103A 
    LDA.W $0F7E : STA.W $0FBE 
    STA.W $0FFE 
    STA.W $103E 
    RTL 


Function_DraygonBody_FightIntro_InitialDelay:
    JSR.W HandleFiringWallTurret 
    LDX.W $0E54 ; >.<
    LDA.W $0FAA : CMP.W #$0100 : BPL .done 
    LDA.W $0FAA : BNE .incFunctionTimer 
    LDX.W $0330 
    LDA.W #$0600 : STA.B $D0,X 
    LDA.W #Tiles_Evir : STA.B $D2,X 
    LDA.W #Tiles_Evir>>16 : STA.B $D4,X 
    LDA.W #$6D00 : STA.B $D5,X 
    LDA.W $0330 : CLC : ADC.W #$0007 : STA.W $0330 
    JSR.W SpawnFightIntroEvirSpriteObjects 

.incFunctionTimer:
    INC.W $0FAA 
    RTS 


.done:
    LDA.W #Function_DraygonBody_FightIntro_Dance : STA.W $0FA8 
    STZ.W $0FAA 
    LDA.W $0F7A : STA.L $7E7800 
    CLC : ADC.W #$02A0 : STA.L $7E7804 
    LDA.W $0F7E : STA.L $7E7802 
    LDA.L $7E7800 : STA.W $0F7A ; >.<
    LDA.L $7E7802 : STA.W $0F7E ; >.<
    LDA.W #$0018 : STA.L $7E781E 
    RTS 


Function_DraygonBody_FightIntro_Dance:
    JSR.W HandleFiringWallTurret 
    LDX.W $0E54 ; >.<
    LDA.W $0FAA : CMP.W #$04D0 : BPL .startFight 
    JSR.W HandleDraygonFightIntroDance 
    INC.W $0FAA 
    RTS 


.startFight:
    LDA.W #Function_DraygonBody_SwoopRight_Setup : STA.W $0FA8 
    STZ.W $0FAA 
    RTS 


HandleFiringWallTurret:
    LDA.W $05B6 : AND.W #$003F 
    BNE .return 
    JSL.L GenerateRandomNumber 
    AND.W #$0003 
    CLC : ADC.W #$0002 : ASL A 
    TAX 
    ASL A 
    TAY 
    LDA.L $7E8800,X : BNE .return 
    LDA.W .XPosition,Y : STA.B $12 
    LDA.W .YPosition,Y : STA.B $14 
    LDY.W #EnemyProjectile_DraygonWallTurret 
    LDA.W #$0003 : JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 

.return:
    RTS 


.XPosition:
    dw $0040 

.YPosition:
    dw $0060,$0038,$00C0,$0034,$012F,$01CC,$0101,$01CC 
    dw $015E,$01BC,$0188 

Function_DraygonBody_SwoopRight_Setup:
    JSR.W HandleFiringWallTurret 
    LDX.W $0E54 ; >.<
    JSR.W CalculateDraygonSwoopYPositions 
    LDA.W #Function_DraygonBody_SwoopRight_Descending : STA.W $0FA8 
    LDA.W #InstList_DraygonBody_FacingRight_Reset : STA.W $0F92 
    LDA.W #$0001 : STA.W $0F94 
    LDA.W #$0001 : STA.L $7E8000 
    RTS 


CalculateDraygonSwoopYPositions:
    LDA.W #$0180 : STA.W $0E28 
    LDA.W $0E28 ; >.<
    STA.W $0E24 
    STZ.W $0E22 
    STZ.W $0E26 

.loop:
    LDX.W $0E54 ; >.<
    LDA.L $7E781E : CLC : ADC.W $0E22 : STA.W $0E22 
    XBA 
    AND.W #$00FF 
    EOR.W #$FFFF 
    INC A 
    CLC : ADC.W $0E24 : CMP.L $7E7802 : BMI + 
    STA.W $0E24 
    LDX.W $0E26 
    STA.L $7E9002,X 
    INC.W $0E26 ; >.<
    INC.W $0E26 
    INC.W $0E26 
    INC.W $0E26 
    LDA.W $0E26 : CMP.W #$0800 : BMI .loop 

.crash:
    BRA .crash 


  + LDA.L $7E7800 : BMI .leftSideReset 
    SEC : SBC.W $0AF6 : JSL.L NegateA_A0B067 
    BRA + 


.leftSideReset:
    JSL.L NegateA_A0B067 
    CLC : ADC.W $0AF6 : JSL.L NegateA_A0B067 

  + STA.B $2C 
    STZ.B $2A 
    LDA.W $0E26 
    LSR #2
    STA.B $2E 
    STZ.B $30 
    JSL.L UnsignedDivision_32bit_A0B761 
    LDA.B $2C : STA.W $0FAE 
    LDA.B $2A : STA.W $0FB0 
    LDA.W $0F7E 
    LDX.W $0E26 
    STA.L $7E9002,X 
    STX.W $0FAA 
    STX.W $0FAC 
    RTS 


Function_DraygonBody_SwoopRight_Descending:
    JSR.W HandleFiringWallTurret 
    JSR.W HandleShortDraygonBreathBubbles 
    LDY.W $0E54 
    LDX.W $0FAA 
    CPX.W #$0068 
    BNE .notIndex68 
    LDA.W #InstList_DraygonArms_FacingRight_NearSwoopApex : STA.W $1052 
    LDA.W #$0001 : STA.W $1054 

.notIndex68:
    LDA.L $7E9002,X : STA.W $0F7E,Y 
    DEC.W $0FAA 
    DEC.W $0FAA 
    DEC.W $0FAA 
    DEC.W $0FAA 
    LDA.W $0FAA : BEQ .apex 
    LDA.W $0F7C : CLC : ADC.W $0FB0 : STA.W $0F7C 
    LDA.W $0F7A : ADC.W $0FAE : STA.W $0F7A 
    RTS 


.apex:
    LDA.W #Function_DraygonBody_SwoopRight_Apex : STA.W $0FA8 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Draygon_FireGoop_A58901:
    LDA.W $05B6 : AND.W #$000F 
    BNE .return 
    LDA.W #InstList_DraygonBody_FacingLeft_FireGoop : STA.W $0F92 
    LDA.L $7E8000 : BEQ .keepLeft 
    LDA.W #InstList_DraygonBody_FacingRight_FireGoop : STA.W $0F92 

.keepLeft:
    LDA.W #$0001 : STA.W $0F94 

.return:
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


Function_DraygonBody_SwoopRight_Apex:
    JSR.W HandleFiringWallTurret 
    LDX.W $0E54 ; >.<
    LDA.W #$02A0 : SEC : SBC.W $0F7A : STA.B $2C 
    STZ.B $2A 
    LDA.W $0FAC 
    LSR #2
    STA.B $2E 
    STZ.B $30 
    JSL.L UnsignedDivision_32bit_A0B761 
    LDA.B $2C : STA.W $0FAE 
    LDA.B $2A : STA.W $0FB0 
    LDA.W #Function_DraygonBody_SwoopRight_Ascending : STA.W $0FA8 
    RTS 


Function_DraygonBody_SwoopRight_Ascending:
    JSR.W HandleFiringWallTurret 
    LDY.W $0E54 
    LDX.W $0FAA 
    CPX.W #$0068 
    BNE .notIndex68 
    LDA.W #InstList_DraygonArms_FacingRight_Idle_0 : STA.W $1052 
    LDA.W #$0001 : STA.W $1054 

.notIndex68:
    LDA.L $7E9002,X : STA.W $0F7E,Y 
    INC.W $0FAA 
    INC.W $0FAA 
    INC.W $0FAA 
    INC.W $0FAA 
    LDA.W $0FAA : CMP.W $0FAC : BEQ + 
    LDA.W $0F7C : CLC : ADC.W $0FB0 : STA.W $0F7C 
    LDA.W $0F7A : ADC.W $0FAE : STA.W $0F7A 
    RTS 


  + STZ.W $0FAA 
    LDA.W $05E5 : AND.W #$0001 
    BEQ .goopLeft 
    LDA.W #Function_DraygonBody_SwoopLeft_Setup : STA.W $0FA8 
    RTS 


.goopLeft:
    LDA.W #Function_DraygonBody_GoopLeft_Setup : STA.W $0FA8 
    RTS 


Function_DraygonBody_SwoopLeft_Setup:
    JSR.W HandleFiringWallTurret 
    LDX.W $0E54 ; >.<
    LDA.L $7E7804 : SEC : SBC.W $0AF6 : JSL.L NegateA_A0B067 
    STA.B $2C 
    STZ.B $2A 
    LDA.W $0E26 
    LSR #2
    STA.B $2E 
    STZ.B $30 
    JSL.L UnsignedDivision_32bit_A0B761 
    LDA.B $2C : STA.W $0FAE 
    LDA.B $2A : STA.W $0FB0 
    LDA.W #Function_DraygonBody_SwoopLeft_Descending : STA.W $0FA8 
    LDA.W #InstList_DraygonBody_FacingLeft_Reset : STA.W $0F92 
    LDA.W #$0001 : STA.W $0F94 
    LDA.W #$0000 : STA.L $7E8000 
    LDA.W $0FAC : STA.W $0FAA 
    RTS 


Function_DraygonBody_SwoopLeft_Descending:
    JSR.W HandleFiringWallTurret 
    JSR.W HandleShortDraygonBreathBubbles 
    LDY.W $0E54 
    LDX.W $0FAA 
    CPX.W #$0068 
    BNE .notIndex68 
    LDA.W #InstList_DraygonArms_FacingLeft_NearSwoopApex : STA.W $1052 
    LDA.W #$0001 : STA.W $1054 

.notIndex68:
    LDA.L $7E9002,X : STA.W $0F7E,Y 
    DEC.W $0FAA 
    DEC.W $0FAA 
    DEC.W $0FAA 
    DEC.W $0FAA 
    LDA.W $0FAA : BEQ .apex 
    LDA.W $0F7C : SEC : SBC.W $0FB0 : STA.W $0F7C 
    LDA.W $0F7A : SBC.W $0FAE : STA.W $0F7A 
    RTS 


.apex:
    LDA.W #Function_DraygonBody_SwoopLeft_Apex : STA.W $0FA8 
    RTS 


Function_DraygonBody_SwoopLeft_Apex:
    JSR.W HandleFiringWallTurret 
    LDX.W $0E54 ; >.<
    LDA.L $7E7800 : BMI .leftSideReset 
    LDA.W $0F7A : SEC : SBC.L $7E7800 : BRA + 


.leftSideReset:
    EOR.W #$FFFF 
    INC A 
    CLC : ADC.W $0F7A 

  + STA.B $2C 
    STZ.B $2A 
    LDA.W $0FAC 
    LSR #2
    STA.B $2E 
    STZ.B $30 
    JSL.L UnsignedDivision_32bit_A0B761 
    LDA.B $2C : STA.W $0FAE 
    LDA.B $2A : STA.W $0FB0 
    LDA.W #Function_DraygonBody_SwoopLeft_Ascending : STA.W $0FA8 
    RTS 


Function_DraygonBody_SwoopLeft_Ascending:
    JSR.W HandleFiringWallTurret 
    JSR.W HandleShortDraygonBreathBubbles 
    LDY.W $0E54 
    LDX.W $0FAA 
    CPX.W #$0068 
    BNE + 
    LDA.W #InstList_DraygonArms_FacingLeft_Idle_0 : STA.W $1052 
    LDA.W #$0001 : STA.W $1054 

  + LDA.L $7E9002,X : STA.W $0F7E,Y 
    INC.W $0FAA 
    INC.W $0FAA 
    INC.W $0FAA 
    INC.W $0FAA 
    LDA.W $0FAA : CMP.W $0FAC : BEQ .chooseAttack 
    LDA.W $0F7C : SEC : SBC.W $0FB0 : STA.W $0F7C 
    LDA.W $0F7A : SBC.W $0FAE : STA.W $0F7A 
    RTS 


.chooseAttack:
    LDA.W $05E5 : AND.W #$0001 
    BEQ .goop 
    LDA.W #Function_DraygonBody_SwoopRight_Setup : STA.W $0FA8 
    STZ.W $0FAA 
    LDA.L $7E7800 : STA.W $0F7A 
    LDA.L $7E7802 : STA.W $0F7E 
    RTS 


.goop:
    LDA.W #Function_DraygonBody_GoopRight_Setup : STA.W $0FA8 
    LDA.L $7E7800 : STA.W $0F7A 
    RTS 


Function_DraygonBody_GoopRight_Setup:
    JSR.W HandleFiringWallTurret 
    LDA.W #$FFB0 : STA.W $0F7A 
    LDA.W #$0180 : STA.W $0F7E 
    LDA.W #$0000 : STA.W $0FB0 
    LDA.W #$0001 : STA.W $0FAE 
    LDA.W #$0000 : STA.L $7E781A 
    LDA.W #InstList_DraygonArms_FacingRight_NearSwoopApex : STA.W $1052 
    LDA.W #$0001 : STA.W $1054 
    LDA.W #Function_DraygonBody_GoopRight_MoveUntilSamusInRange : STA.W $0FA8 
    LDA.W #InstList_DraygonBody_FacingRight_Reset : STA.W $0F92 
    LDA.W #$0001 : STA.W $0F94 
    LDA.W #$0001 : STA.L $7E8000 
    RTS 


Function_DraygonBody_GoopRight_MoveUntilSamusInRange:
    JSR.W HandleFiringWallTurret 
    JSR.W HandleShortDraygonBreathBubbles 
    LDA.W $0F7A : SEC : SBC.W $0AF6 : JSL.L NegateA_A0B067 
    CMP.W #$00D0 : BPL .tooFar 
    LDA.W #Function_DraygonBody_GoopRight_FiringGoops : STA.W $0FA8 
    LDA.W #$0010 : STA.L $7E7806 
    RTS 


.tooFar:
    LDA.W #$0020 : STA.W $0E32 
    LDA.L $7E781A : JSL.L EightBitCosineMultiplication_A0B0B2 
    CLC : ADC.W #$0180 : STA.W $0F7E 
    LDA.L $7E781A : CLC : ADC.W #$0001 : AND.W #$00FF 
    STA.L $7E781A 
    LDA.W $0F7C : CLC : ADC.W $0FB0 : STA.W $0F7C 
    LDA.W $0F7A : ADC.W $0FAE : STA.W $0F7A 
    RTS 


Function_DraygonBody_GoopRight_FiringGoops:
    JSR.W HandleFiringWallTurret 
    LDA.W $0A66 : BNE .SamusGooped 
    LDA.W $05E5 : AND.W #$000F 
    BNE .noGoop 
    LDA.L $7E7806 
    DEC A 
    STA.L $7E7806 
    BEQ .reloadSpeedDivisor 
    LDY.W #InstList_DraygonBody_FacingRight_FireGoop 
    STY.W $0F92 
    LDA.W #$0001 : STA.W $0F94 

.noGoop:
    LDA.W #$0020 : STA.W $0E32 
    LDA.L $7E781A : JSL.L EightBitCosineMultiplication_A0B0B2 
    CLC : ADC.W #$0180 : STA.W $0F7E 
    LDA.L $7E781A : CLC : ADC.W #$0001 : AND.W #$00FF 
    STA.L $7E781A 
    LDA.W $0F7C : CLC : ADC.W $0FB0 : STA.W $0F7C 
    LDA.W $0F7A : ADC.W $0FAE : STA.W $0F7A 
    BMI .return 
    CMP.W #$02A0 : BPL .reloadSpeedDivisor 

.return:
    RTS 


.reloadSpeedDivisor:
    LDA.W $0A66 : BEQ .done 

.SamusGooped:
    LDA.W #Function_DraygonBody_ChaseSamus : STA.W $0FA8 
    RTS 


.done:
    LDA.W #InstList_DraygonArms_FacingRight_Idle_0 : STA.W $1052 
    LDA.W #$0001 : STA.W $1054 
    LDA.W #Function_DraygonBody_GoopRight_MoveUntilOffScreen : STA.W $0FA8 
    RTS 


Function_DraygonBody_GoopRight_MoveUntilOffScreen:
    JSR.W HandleShortDraygonBreathBubbles 
    LDA.W #$0020 : STA.W $0E32 
    LDA.L $7E781A : JSL.L EightBitCosineMultiplication_A0B0B2 
    CLC : ADC.W #$0180 : STA.W $0F7E 
    LDA.L $7E781A : CLC : ADC.W #$0001 : AND.W #$00FF 
    STA.L $7E781A 
    LDA.W $0F7C : CLC : ADC.W $0FB0 : STA.W $0F7C 
    LDA.W $0F7A : ADC.W $0FAE : STA.W $0F7A 
    BMI .return 
    CMP.W #$02A0 : BPL .done 

.return:
    RTS 


.done:
    LDA.W #Function_DraygonBody_SwoopLeft_Setup : STA.W $0FA8 
    LDA.W #$0250 : STA.W $0F7A 
    LDA.W #$FFB0 : STA.W $0F7E 
    LDA.W $0FAC : STA.W $0FAA 
    RTS 


Function_DraygonBody_GoopLeft_Setup:
    LDA.L $7E7804 : STA.W $0F7A 
    LDA.W #$0180 : STA.W $0F7E 
    LDA.W #$0000 : STA.W $0FB0 
    LDA.W #$0001 : STA.W $0FAE 
    LDA.W #$0000 : STA.L $7E781A 
    LDA.W #InstList_DraygonArms_FacingRight_NearSwoopApex : STA.W $1052 
    LDA.W #$0001 : STA.W $1054 
    LDA.W #Function_DraygonBody_GoopLeft_MoveUntilSamusInRange : STA.W $0FA8 
    LDA.W #InstList_DraygonBody_FacingLeft_Reset : STA.W $0F92 
    LDA.W #$0001 : STA.W $0F94 
    LDA.W #$0000 : STA.L $7E8000 
    RTS 


Function_DraygonBody_GoopLeft_MoveUntilSamusInRange:
    JSR.W HandleFiringWallTurret 
    JSR.W HandleShortDraygonBreathBubbles 
    LDA.W $0F7A : SEC : SBC.W $0AF6 : JSL.L NegateA_A0B067 
    CMP.W #$00D0 : BPL .tooFar 
    LDA.W #Function_DraygonBody_GoopLeft_FiringGoops : STA.W $0FA8 
    LDA.W #$0010 : STA.L $7E7806 
    RTS 


.tooFar:
    LDA.W #$0020 : STA.W $0E32 
    LDA.L $7E781A : JSL.L EightBitCosineMultiplication_A0B0B2 
    CLC : ADC.W #$0180 : STA.W $0F7E 
    LDA.L $7E781A : CLC : ADC.W #$0001 : AND.W #$00FF 
    STA.L $7E781A 
    LDA.W $0F7C : SEC : SBC.W $0FB0 : STA.W $0F7C 
    LDA.W $0F7A : SBC.W $0FAE : STA.W $0F7A 
    RTS 


Function_DraygonBody_GoopLeft_FiringGoops:
    LDA.W $0A66 : BNE .SamusGooped 
    LDA.W $05E5 : AND.W #$000F 
    BNE .noGoop 
    LDA.L $7E7806 
    DEC A 
    STA.L $7E7806 
    BEQ .reloadSpeedDivisor 
    LDY.W #InstList_DraygonBody_FacingLeft_FireGoop 
    STY.W $0F92 
    LDA.W #$0001 : STA.W $0F94 

.noGoop:
    LDA.W #$0020 : STA.W $0E32 
    LDA.L $7E781A : JSL.L EightBitCosineMultiplication_A0B0B2 
    CLC : ADC.W #$0180 : STA.W $0F7E 
    LDA.L $7E781A : CLC : ADC.W #$0001 : AND.W #$00FF 
    STA.L $7E781A 
    LDA.W $0F7C : SEC : SBC.W $0FB0 : STA.W $0F7C 
    LDA.W $0F7A : SBC.W $0FAE : STA.W $0F7A 
    BPL .return 
    CMP.W #$FFB0 : BMI .reloadSpeedDivisor 

.return:
    RTS 


.reloadSpeedDivisor:
    LDA.W $0A66 : BEQ .done 

.SamusGooped:
    LDA.W #Function_DraygonBody_ChaseSamus : STA.W $0FA8 
    RTS 


.done:
    LDA.W #InstList_DraygonArms_FacingLeft_Idle_0 : STA.W $1052 
    LDA.W #$0001 : STA.W $1054 
    LDA.W #Function_DraygonBody_GoopLeft_MoveUntilOffScreen : STA.W $0FA8 
    RTS 


Function_DraygonBody_GoopLeft_MoveUntilOffScreen:
    JSR.W HandleShortDraygonBreathBubbles 
    LDA.W $0A66 : BNE .SamusGooped 
    LDA.W #$0020 : STA.W $0E32 
    LDA.L $7E781A : JSL.L EightBitCosineMultiplication_A0B0B2 
    CLC : ADC.W #$0180 : STA.W $0F7E 
    LDA.L $7E781A : CLC : ADC.W #$0001 : AND.W #$00FF 
    STA.L $7E781A 
    LDA.W $0F7C : SEC : SBC.W $0FB0 : STA.W $0F7C 
    LDA.W $0F7A : SBC.W $0FAE : STA.W $0F7A 
    BPL .return 
    CMP.W #$FFB0 : BMI .done 

.return:
    RTS 


.SamusGooped:
    LDA.W #Function_DraygonBody_ChaseSamus : STA.W $0FA8 
    RTS 


.done:
    LDA.W #Function_DraygonBody_SwoopRight_Setup : STA.W $0FA8 
    LDA.W #$FFB0 : STA.W $0F7A 
    LDA.W #$FFB0 : STA.W $0F7E 
    LDA.W $0FAC : STA.W $0FAA 
    RTS 


Function_DraygonBody_ChaseSamus:
    JSR.W HandleFiringWallTurret 
    LDA.W $0A66 : BNE .SamusStillGooped 
    LDA.W #Function_DraygonBody_GrabbedSamus_FlyStraightUp : STA.W $0FA8 
    RTS 


.SamusStillGooped:
    LDA.W $0F86 : ORA.W #$0400 : STA.W $0F86 
    LDY.W #$0008 
    LDA.L $7E8000 : BNE .notLeft 
    LDY.W #$FFF8 

.notLeft:
    TYA 
    CLC : ADC.W $0F7A : SEC : SBC.W $0AF6 : JSL.L NegateA_A0B067 
    CMP.W #$0008 : BPL .notGrabbed 
    LDA.W $0F7E : SEC : SBC.W $0AFA : JSL.L NegateA_A0B067 
    CMP.W #$0008 : BPL .notGrabbed 
    BRA .grab 


.notGrabbed:
    LDA.W $0AF6 : SEC : SBC.W $0F7A : STA.B $12 
    LDA.W $0AFA : SEC : SBC.W $0F7E : STA.B $14 
    JSL.L CalculateAngleOf_12_14_Offset 
    EOR.W #$00FF 
    INC A 
    CLC : ADC.W #$0040 : AND.W #$00FF 
    STA.W $0E20 
    STA.B $12 
    LDA.W #$0002 : STA.B $14 
    JSL.L Do_Some_Math_With_Sine_Cosine_Terrible_Label_Name ; ($16.$18, $1A.$1C) = ([$14] * |cos([$12] * pi / 80h)|, [$14] * |sin([$12] * pi / 80h)|)
    LDA.B $16 : STA.W $0E24 
    LDA.B $18 : STA.W $0E26 
    LDA.B $1A : STA.W $0E28 
    LDA.B $1C : STA.W $0E2A 
    JSL.L MoveEnemyAccordingToAngleAndXYSpeeds 
    RTS 


.grab:
    LDY.W #InstList_DraygonArms_FacingLeft_Grab 
    LDA.L $7E8000 : BEQ .keepLeft 
    LDY.W #InstList_DraygonArms_FacingRight_Grab 

.keepLeft:
    STY.W $1052 
    LDA.W #$0001 : STA.W $1054 
    LDA.W #$000D : JSL.L Run_Samus_Command 
    AND.W #$FFFF 
    BNE .retreat 
    LDY.W #$0000 
    LDA.L $7E8000 : BEQ .left 
    LDY.W #$0001 

.left:
    TYA 
    JSL.L SetSamusIntoTheGrabbedByDraygonPose 
    LDA.W #$0100 : STA.L $7E780C 
    LDA.W #$0180 : STA.L $7E780E 
    LDA.W #$0000 : STA.L $7E780A 
    STA.L $7E7812 
    LDA.W #$00C0 : STA.L $7E7810 
    LDA.W #$0800 : STA.L $7E7816 
    LDA.W #Function_DraygonBody_GrabbedSamus_MovingToTargetPosition : STA.W $0FA8 
    RTS 


.retreat:
    LDA.W #Function_DraygonBody_RepelledByGrapple : STA.W $0FA8 
    RTS 


Function_DraygonBody_RepelledByGrapple:
    LDA.W #GrappleBeamFunction_Dropped : STA.W $0D32 
    LDA.W #Function_DraygonBody_GrabbedSamus_FlailTail_FlyStraightUp : STA.W $0FA8 
    RTS 


RTS_A58F1D:
    RTS 


Function_DraygonBody_GrabbedSamus_MovingToTargetPosition:
    LDA.W $0A64 : BIT.W #$0001 
    BEQ .notGrappled 
    PHX 
    LDX.W $0F78 
    LDA.L $A0000D,X : AND.W #$00FF 
    CLC : ADC.W #$0008 : STA.W $0F9C 
    PLX 
    LDA.W $0F8A : ORA.W #$0002 : STA.W $0F8A 
    RTS 


.notGrappled:
    LDA.W $0F7A : SEC : SBC.W #$0100 : JSL.L NegateA_A0B067 
    CMP.W #$0002 : BPL .notReachedTarget 
    LDA.W $0F7E : SEC : SBC.W #$0180 : JSL.L NegateA_A0B067 
    CMP.W #$0002 : BPL .notReachedTarget 
    BRA .reachedTargetPosition 


.notReachedTarget:
    LDA.W #$0100 : SEC : SBC.W $0F7A : STA.B $12 
    LDA.W #$0180 : SEC : SBC.W $0F7E : STA.B $14 
    JSL.L CalculateAngleOf_12_14_Offset 
    EOR.W #$00FF 
    INC A 
    CLC : ADC.W #$0040 : AND.W #$00FF 
    STA.W $0E20 
    STA.B $12 
    LDA.W #$0002 : STA.B $14 
    JSL.L Do_Some_Math_With_Sine_Cosine_Terrible_Label_Name ; ($16.$18, $1A.$1C) = ([$14] * |cos([$12] * pi / 80h)|, [$14] * |sin([$12] * pi / 80h)|)
    LDA.B $16 : STA.W $0E24 
    LDA.B $18 : STA.W $0E26 
    LDA.B $1A : STA.W $0E28 
    LDA.B $1C : STA.W $0E2A 
    JSL.L MoveEnemyAccordingToAngleAndXYSpeeds 
    JSR.W MoveSamusWithDraygon 
    RTS 


.reachedTargetPosition:
    LDA.W #Function_DraygonBody_GrabbedSamus_RisingSpiralMovement : STA.W $0FA8 
    LDY.W #InstList_DraygonBody_FacingLeft_Roar 
    LDA.L $7E8000 : BEQ .keepLeft 
    LDY.W #InstList_DraygonBody_FacingRight_Roar 

.keepLeft:
    TYA 
    STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    LDA.W $0F86 : ORA.W #$0400 : STA.W $0F86 
    RTS 


Function_DraygonBody_GrabbedSamus_RisingSpiralMovement:
    LDA.W $0A64 : BIT.W #$0001 
    BEQ .notGrappled 
    PHX 
    LDX.W $0F78 
    LDA.L $A0000D,X : AND.W #$00FF 
    CLC : ADC.W #$0008 : STA.W $0F9C 
    PLX 
    LDA.W $0F8A : ORA.W #$0002 : STA.W $0F8A 
    RTS 


.notGrappled:
    LDA.W $05E5 : AND.W #$00FF 
    BNE .noSpank 
    LDA.W #$0040 : STA.L $7E7818 
    LDA.W #Function_DraygonBody_GrabbedSamus_TailWhip : STA.W $0FA8 
    RTS 


.noSpank:
    LDA.L $7E780A : STA.W $0E32 
    LDA.L $7E7810 : JSL.L EightBitCosineMultiplication_A0B0B2 
    CLC : ADC.L $7E780C : STA.W $0F7A 
    LDA.L $7E780A 
    LSR #2
    STA.W $0E32 
    LDA.L $7E7810 : JSL.L EightBitNegativeSineMultiplication_A0B0C6 
    CLC : ADC.L $7E780E : STA.W $0F7E 
    LDA.W $0FA4,X : AND.W #$0007 
    BNE .noFoam 
    LDA.W $0F7A : SEC : SBC.W #$0020 : STA.B $12 
    LDA.L $7E8000 : BEQ .left 
    LDA.W $0F7A : CLC : ADC.W #$0020 : STA.B $12 

.left:
    LDA.W $0F7E : SEC : SBC.W #$0010 : STA.B $14 
    LDA.W #$003D : STA.B $16 
    STZ.B $18 
    JSL.L Create_Sprite_Object 

.noFoam:
    LDA.L $7E7812 : CLC : ADC.W #$2000 : STA.L $7E7812 
    LDA.L $7E780A : ADC.W #$0000 : STA.L $7E780A 
    CMP.W #$00A0 : BPL .finalSpanking 
    LDA.L $7E7816 : SEC : SBC.W #$0001 : STA.L $7E7816 
    AND.W #$FF00 
    XBA 
    CLC : ADC.L $7E7810 : AND.W #$00FF 
    STA.L $7E7810 
    LDA.L $7E7814 : SEC : SBC.W #$4000 : STA.L $7E7814 
    LDA.L $7E780E : SBC.W #$0000 : STA.L $7E780E 
    CMP.W #$0040 : BMI .finalSpanking 
    JSR.W MoveSamusWithDraygon 
    RTS 

.finalSpanking:
    LDA.W #Function_DraygonBody_GrabbedSamus_FinalSpanking_Start : STA.W $0FA8 
    RTS 


Function_DraygonBody_GrabbedSamus_TailWhip:
    JSR.W MoveSamusWithDraygon 
    LDA.L $7E7818 
    DEC A 
    STA.L $7E7818 
    BEQ .done 
    CMP.W #$003F : BEQ .getDirection 
    RTS 

.getDirection:
    LDY.W #InstList_DraygonTail_FacingLeft_TailWhip 
    LDA.L $7E8000 : BEQ .keepLeft 
    LDY.W #InstList_DraygonTail_FacingRight_TailWhip_0 

.keepLeft:
    STY.W $1012 
    LDA.W #$0001 : STA.W $1014 
    RTS 

.done:
    LDA.W #Function_DraygonBody_GrabbedSamus_RisingSpiralMovement : STA.W $0FA8 
    RTS 


Function_DraygonBody_GrabbedSamus_FinalSpanking_Start:
    JSR.W MoveSamusWithDraygon 
    LDY.W #InstList_DraygonTail_FacingLeft_FinalTailWhips_0 
    LDA.L $7E8000,X : BEQ .keepLeft 
    LDY.W #InstList_DraygonTail_FacingRight_FinalTailWhips_0 

.keepLeft:
    STY.W $1012 
    LDA.W #$0001 : STA.W $1014 
    LDA.W #Function_DraygonBody_GrabbedSamus_FinalSpanking_Ongoing : STA.W $0FA8 
    RTS 


Function_DraygonBody_GrabbedSamus_FinalSpanking_Ongoing:
    JSR.W MoveSamusWithDraygon 
    RTS 


Function_DraygonBody_GrabbedSamus_FlailTail_FlyStraightUp:
    JSL.L ReleaseSamusFromDraygon_external 
    STZ.W $0A64 
    LDA.W #Function_DraygonBody_GrabbedSamus_FlyStraightUp : STA.W $0FA8 
    LDA.W $0F86 : AND.W #$FBFF : STA.W $0F86 
    LDY.W #InstList_DraygonTail_FacingLeft_TailFlail 
    LDA.L $7E8000 : BEQ .keepLeft 
    LDY.W #InstList_DraygonTail_FacingRight_TailFlail_0 

.keepLeft:
    STY.W $1012 
    LDA.W #$0001 : STA.W $1014 
    RTS 


Function_DraygonBody_GrabbedSamus_FlyStraightUp:
    JSR.W HandleFiringWallTurret 
    LDA.W $0F7E : SEC : SBC.W #$0004 : STA.W $0F7E 
    BMI .offScreenTop 
    RTS 


.offScreenTop:
    LDA.W $0F86 : AND.W #$FBFF : STA.W $0F86 
    LDA.W #Function_DraygonBody_SwoopRight_Setup : STA.W $0FA8 
    STZ.W $0FAA 
    LDA.L $7E7800 : STA.W $0F7A 
    LDA.L $7E7802 : STA.W $0F7E 
    RTS 


Function_DraygonBody_DeathSequence_DriftToDeathSpot:
    LDX.W $0E54 ; >.<
    LDA.W $0FA4,X : AND.W #$000F 
    BNE .noFoam 
    LDA.W $0F7A : SEC : SBC.W #$0020 : STA.B $12 
    LDA.L $7E8000 : BEQ .left 
    LDA.W $0F7A : CLC : ADC.W #$0020 : STA.B $12 

.left:
    LDA.W $0F7E : SEC : SBC.W #$0010 : STA.B $14 
    LDA.W #$003D : STA.B $16 
    STZ.B $18 
    JSL.L Create_Sprite_Object 

.noFoam:
    LDA.W $0F7A 
    LSR #2
    STA.B $12 
    LDA.W #$0100 
    LSR A ; >.<
    LSR A 
    SEC : SBC.B $12 : STA.B $12 
    LDA.W $0F7E 
    LSR #2
    STA.B $14 
    LDA.W #$01E0 
    LSR A ; >.<
    LSR A 
    SEC : SBC.B $14 : STA.B $14 
    JSL.L CalculateAngleOf_12_14_Offset 
    SEC : SBC.W #$0040 : EOR.W #$FFFF 
    INC A 
    AND.W #$00FF 
    STA.L $7E8806 
    LDA.W #$0001 : STA.B $14 
    LDA.L $7E8806 : AND.W #$00FF : STA.B $12 
    JSL.L Do_Some_Math_With_Sine_Cosine_Terrible_Label_Name ; ($16.$18, $1A.$1C) = ([$14] * |cos([$12] * pi / 80h)|, [$14] * |sin([$12] * pi / 80h)|)
    LDA.B $16 : STA.W $0E24 
    LDA.B $18 : STA.W $0E26 
    LDA.B $1A : STA.W $0E28 
    LDA.B $1C : STA.W $0E2A 
    LDA.L $7E8806 : AND.W #$00FF : STA.W $0E20 
    JSL.L MoveEnemyAccordingToAngleAndXYSpeeds 
    LDA.W $0F7A : SEC : SBC.W #$0100 : JSL.L NegateA_A0B067 
    CMP.W #$0004 : BPL .gotoReturn 
    LDA.W $0F7E : SEC : SBC.W #$01E0 : JSL.L NegateA_A0B067 
    CMP.W #$0004 : BPL .gotoReturn 
    BRA .done 


.gotoReturn:
    JMP.W .return 


.done:
    JSR.W SpawnDeathSequenceEvirSpriteObjects 
    LDA.W #Function_DraygonBody_DeathSequence_WaitForEvirs : STA.W $0FA8 
    LDA.W #$0003 : JSL.L QueueMusicDataOrTrack_8FrameDelay 
    LDA.W #$01A0 : STA.W $0FAA 
    LDA.W #InstList_Draygon_Sleep : STA.W $0F92 
    LDA.W #$0001 : STA.W $0F94 
    LDA.W $0F86 : ORA.W #$0200 : STA.W $1006 
    STA.W $1046 
    LDY.W #InstList_DraygonEye_FacingLeft_Dead 
    LDA.L $7E8000 : BEQ .keepLeft 
    LDY.W #InstList_DraygonEye_FacingRight_Dead 

.keepLeft:
    STY.W $0FD2 
    LDA.W #$0001 : STA.W $0FD4 
    LDA.W #RTS_A5804B : STA.W $0FE8 

.return:
    RTS 


Function_DraygonBody_DeathSequence_WaitForEvirs:
    JSR.W HandleDyingDraygonSmoke 
    DEC.W $0FAA 
    LDA.W $0FAA : BEQ .timerExpired 
    JSR.W HandleDeathSequenceEvirMovement 
    BRA .return 


.timerExpired:
    LDA.W #Function_DraygonBody_DeathSequence_BuriedByEvirs : STA.W $0FA8 

.return:
    RTS 


Function_DraygonBody_DeathSequence_BuriedByEvirs:
    JSR.W HandleDyingDraygonSmoke 
    JSR.W HandleDeathSequenceEvirMovement 
    INC.W $0F7E 
    LDA.W $0F7E : CMP.W #$0240 : BMI .return 
    LDA.W #InstList_Draygon_Delete : STA.W $0F92 
    LDA.W #$0001 : STA.W $0F94 
    LDA.W $0F86 : ORA.W #$0200 : STA.W $0F86 
    STA.W $0FC6 
    LDX.W $079F 
    LDA.L $7ED828,X : ORA.W #$0001 : STA.L $7ED828,X 
    JSL.L DraygonDeathItemDropRoutine 
    JSR.W Draygon_ClearSpriteObjects 

.return:
    RTS 


HandleDyingDraygonSmoke:
    PHY : PHX 
    LDA.W $05B6 : AND.W #$0007 
    BNE .return 
    JSL.L GenerateRandomNumber 
    AND.W #$007F 
    CLC : ADC.W #$00C0 : STA.B $12 
    LDA.W $05E5 : AND.W #$3F00 
    XBA 
    CLC : ADC.W #$0190 : STA.B $14 
    LDA.W #$0015 : STA.B $16 
    STZ.B $18 
    JSL.L Create_Sprite_Object 

.return:
    PLX : PLY 
    RTS 


HandleShortDraygonBreathBubbles:
    LDA.W $0FA4,X : AND.W #$007F 
    BNE .return 
    LDA.W $0F7A : CLC : ADC.W #$FFF0 : STA.B $12 
    LDA.W $0F7E : CLC : ADC.W #$FFF0 : STA.B $14 
    LDA.W #$0018 : STA.B $16 
    STZ.B $18 
    JSL.L Create_Sprite_Object 

.return:
    RTS 


EnemyGraphicsDrawnHook_Draygon_SetBG2XYScroll:
    LDA.W $0911 : SEC : SBC.W $0F7A : SEC : SBC.W #$01C2 : CLC : ADC.L $7E883C : STA.B $B5 
    LDA.W $0915 : SEC : SBC.W $0F7E : SEC : SBC.W #$00C0 : CLC : ADC.L $7E883E : STA.B $B7 
    RTL 


Debug_DraygonController2InputHandling:
    LDX.W #$0000 
    LDA.B $8D : BIT.W #$0040 
    BEQ .notPressingX 
    JSL.L Debug_MoveDraygonWithDpad_Fast 
    BRA + 


.notPressingX:
    JSL.L Debug_MoveDraygonWithDpad_Slow 

  + LDX.W #$0000 
    LDA.B $91 : BIT.W #$4000 
    BEQ .fireGoopEnd 
    LDY.W #InstList_DraygonBody_FacingLeft_FireGoop 
    LDA.L $7E8000,X : BEQ .keepLeft 
    LDY.W #InstList_DraygonBody_FacingRight_FireGoop 

.keepLeft:
    STY.W $0F92 
    LDA.W #$0001 : STA.W $0F94 
    BRA .return 


.fireGoopEnd:
    BIT.W #$8000 
    BEQ .tailWhipEnd 
    LDY.W #InstList_DraygonTail_FacingLeft_FakeTailWhip 
    LDA.L $7E8000,X : BEQ ..keepLeft 
    LDY.W #Debug_InstList_DraygonTail_FacingRight_FakeTailWhip 

..keepLeft:
    STY.W $1012 
    LDA.W #$0001 : STA.W $1014 
    BRA .return 


.tailWhipEnd:
    BIT.W #$0080 
    BEQ .grabEnd 
    LDY.W #Debug_InstList_DraygonArms_FacingLeft_FakeGrab 
    LDA.L $7E8000,X : BEQ ..keepLeft 
    LDY.W #Debug_InstList_DraygonArms_FacingRight_FakeGrab 

..keepLeft:
    STY.W $1052 
    LDA.W #$0001 : STA.W $1054 
    BRA .return 


.grabEnd:
    BIT.W #$0040 
    BEQ .return ; >.<

.return:
    RTL 


Debug_MoveDraygonWithDpad_Slow:
    LDA.B $8D : BIT.W #$0200 
    BEQ .notPressingLeft 
    DEC.W $0F7A 
    CMP.W $1866 : BEQ .notPressingLeft 
    STA.W $1866 
    LDY.W #InstList_DraygonBody_FacingLeft_Reset 
    LDA.W #$0000 : STA.L $7E8000 
    BRA + 


.notPressingLeft:
    BIT.W #$0100 
    BEQ .noHorizontalMovement 
    INC.W $0F7A 
    CMP.W $1866 : BEQ .noHorizontalMovement 
    STA.W $1866 
    LDY.W #InstList_DraygonBody_FacingRight_Reset 
    LDA.W #$0001 : STA.L $7E8000 

  + STY.W $0F92 
    LDA.W #$0001 : STA.W $0F94 

.noHorizontalMovement:
    LDA.B $8D : BIT.W #$0800 
    BEQ .notPressingUp 
    DEC.W $0F7E 
    BRA .return 


.notPressingUp:
    BIT.W #$0400 
    BEQ .return 
    INC.W $0F7E 

.return:
    RTL 


Debug_MoveDraygonWithDpad_Fast:
    LDA.B $8D : BIT.W #$0200 
    BEQ .noPressingLeft 
    LDA.W $0F7A : SEC : SBC.W #$0004 : STA.W $0F7A 
    LDA.B $8D : CMP.W $1866 : BEQ .noPressingLeft 
    STA.W $1866 
    LDY.W #InstList_DraygonBody_FacingLeft_Reset 
    LDA.W #$0000 : STA.L $7E8000 
    BRA + 


.noPressingLeft:
    BIT.W #$0100 
    BEQ .noHorizontalMovement 
    LDA.W $0F7A : CLC : ADC.W #$0004 : STA.W $0F7A 
    LDA.B $8D : CMP.W $1866 : BEQ .noHorizontalMovement 
    STA.W $1866 
    LDY.W #InstList_DraygonBody_FacingRight_Reset 
    LDA.W #$0001 : STA.L $7E8000 

  + STY.W $0F92 
    LDA.W #$0001 : STA.W $0F94 

.noHorizontalMovement:
    LDA.B $8D : BIT.W #$0800 
    BEQ .notPressingUp 
    LDA.W $0F7E : SEC : SBC.W #$0004 : STA.W $0F7E 
    BRA .return 


.notPressingUp:
    BIT.W #$0400 
    BEQ .return 
    INC.W $0F7E 
    LDA.W $0F7E : CLC : ADC.W #$0004 : STA.W $0F7E 

.return:
    RTL 


MoveSamusWithDraygon:
    LDY.W #$0008 
    LDA.L $7E8000,X : BNE .keepLeft 
    LDY.W #$FFF8 

.keepLeft:
    TYA 
    CLC : ADC.W $0F7A : STA.W $0AF6 
    LDA.W $0F7E : CLC : ADC.W #$0028 : STA.W $0AFA 
    JSL.L CapScrollingSpeed 
    LDA.W $0A64 : BIT.W #$0002 
    BEQ .return 
    STZ.W $0A64 
    LDA.W #Function_DraygonBody_GrabbedSamus_FlyStraightUp : STA.W $0FA8 

.return:
    RTS 


Instruction_Draygon_SetInstList_Body_Eye_Tail_Arms:
    PHY 
    LDA.W $0000,Y : STA.W $0F92 
    LDA.W $0002,Y : STA.W $0FD2 
    LDA.W $0004,Y : STA.W $1012 
    LDA.W $0006,Y : STA.W $1052 
    LDA.W #$0001 : STA.W $0F94 
    STA.W $0FD4 
    STA.W $1014 
    STA.W $1054 
    PLY 
    TYA 
    CLC : ADC.W #$0008 : TAY 
    RTL 


if !FEATURE_KEEP_UNREFERENCED
Unused_DraygonInstListPointers_A5950D:
    dw InstList_DraygonArms_FacingLeft_Idle_0 
    dw InstList_DraygonArms_FacingLeft_NearSwoopApex 
    dw UNUSED_InstList_DraygonArms_A59805 
    dw InstList_DraygonArms_FacingRight_Idle_0 
    dw InstList_DraygonArms_FacingRight_NearSwoopApex 
    dw UNUSED_InstList_DraygonArms_A59BF8 
    dw $0000 
    dw InstList_DraygonBody_FacingLeft_Idle 
    dw InstList_DraygonArms_FacingLeft_Dying 
    dw UNUSED_InstList_DraygonBody_A5987B 
    dw InstList_DraygonBody_FacingLeft_FireGoop 
    dw InstList_DraygonBody_FacingRight_Idle 
    dw InstList_DraygonArms_FacingRight_Dying_0 
    dw UNUSED_InstList_DraygonBody_A59C70 
    dw InstList_DraygonBody_FacingRight_FireGoop 
    dw $0000 
    dw InstList_DraygonEye_FacingLeft_Idle 
    dw InstList_DraygonEye_FacingLeft_LookingLeft 
    dw InstList_DraygonEye_FacingLeft_LookingRight 
    dw InstList_DraygonEye_FacingLeft_LookingUp 
    dw InstList_DraygonEye_FacingLeft_LookingDown 
    dw InstList_DraygonEye_FacingRight_Idle 
    dw InstList_DraygonEye_FacingRight_LookingRight 
    dw InstList_DraygonEye_FacingRight_LookingLeft 
    dw InstList_DraygonEye_FacingRight_LookingUp 
    dw InstList_DraygonEye_FacingRight_LookingDown 
    dw $0000 
    dw InstList_DraygonTail_FacingLeft_Idle_0 
    dw InstList_DraygonTail_FacingLeft_FakeTailWhip 
    dw InstList_DraygonTail_FacingRight_Idle_0 
    dw Debug_InstList_DraygonTail_FacingRight_FakeTailWhip 
    dw $0000 
endif ; !FEATURE_KEEP_UNREFERENCED

HurtAI_Draygon:
    LDY.W #Palette_Draygon_BG12_5 
    LDX.W $0E54 
    LDA.W $0F9C,X : BIT.W #$0002 
    BEQ .noFlash 
    LDY.W #Palette_Draygon_WhiteFlash 

.noFlash:
    LDX.W #$C0A0 ; $7E
    LDA.W #$0010 : STA.W $060B 

.loopBG12Palette5:
    LDA.W $0000,Y : STA.L $7E0000,X 
    INX #2
    INY #2
    DEC.W $060B 
    BNE .loopBG12Palette5 
    LDX.W $0E54 
    LDA.W $0F9C,X : BIT.W #$0002 
    BNE .flashing 
    LDA.L $7E781C 
    ASL #2
    TAY 
    LDX.W #$0000 

.loopHealthBasedPalette:
    LDA.W DraygonHealthBasedPaletteTable,Y : STA.L $7EC0B2,X 
    INY #2
    INX #2
    CPX.W #$0008 
    BNE .loopHealthBasedPalette 

.flashing:
    LDY.W #Palette_Draygon_Sprite7 
    LDX.W $0E54 
    LDA.W $0F9C,X : BIT.W #$0002 
    BEQ ..noFlash 
    LDY.W #Palette_Draygon_WhiteFlash 

..noFlash:
    LDX.W #$C1E0 ; $7E
    LDA.W #$0010 : STA.W $060B 

.loopSpritePalette7:
    LDA.W $0000,Y : STA.L $7E0000,X 
    INX #2
    INY #2
    DEC.W $060B 
    BNE .loopSpritePalette7 
    LDA.W $0A64 : BIT.W #$0001 
    BEQ .return 
    LDA.W $0FA4 : AND.W #$0007 
    BNE .return 
    LDA.W $0F8C : SEC : SBC.W #$0100 : BPL .grappleDamage 
    LDA.W #$0000 

.grappleDamage:
    STA.W $0F8C 
    JSL.L DraygonReaction_Common 

.return:
    RTL 


EnemyTouch_Draygon:
    JSL.L NormalEnemyTouchAI_NoDeathCheck_External 
    BRA DraygonReaction_Common 


EnemyShot_Draygon:
    LDA.L $7E781E : CLC : ADC.W #$0008 : CMP.W #$00A0 : BPL + 
    STA.L $7E781E 

  + JSL.L NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External 
    BRA DraygonReaction_Common 


PowerBombReaction_Draygon:
    JSL.L NormalEnemyPowerBombAI_NoDeathCheck_External 
    BRA DraygonReaction_Common ; >.<


DraygonReaction_Common:
    LDX.W $0E54 
    LDA.W $0F8C,X : BEQ .dead 
    JMP.W .notDead 


.dead:
    LDA.W #GrappleBeamFunction_Dropped : STA.W $0D32 
    LDY.W #InstList_DraygonArms_FacingLeft_Dying 
    LDA.L $7E8000 : BEQ ..keepLeft 
    LDY.W #InstList_DraygonArms_FacingRight_Dying_0 

  ..keepLeft
    STY.W $0F92 
    LDA.W #$0001 : STA.W $0F94 
    LDY.W #InstList_DraygonEye_FacingLeft_Dying_0 
    LDA.L $7E8000 : BEQ + 
    LDY.W #InstList_DraygonEye_FacingRight_Dying_0 

+   STY.W $0FD2 
    LDA.W #$0001 : STA.W $0FD4 
    LDA.W #RTS_A5804B : STA.W $0FE8 
    LDA.W #Function_DraygonBody_DeathSequence_DriftToDeathSpot : STA.W $0FA8 
    JSL.L ReleaseSamusFromDraygon_external 
    STZ.W $0A64 
    LDA.W #$0100 : SEC : SBC.W $0F7A : STA.B $12 
    LDA.W #$01E0 : SEC : SBC.W $0F7E : STA.B $14 
    JSL.L CalculateAngleOf_12_14_Offset 
    SEC : SBC.W #$0040 : EOR.W #$FFFF 
    INC A 
    AND.W #$00FF 
    STA.L $7E8806 
    LDA.W #$0001 : STA.B $14 
    LDA.L $7E8806 : AND.W #$00FF : STA.B $12 
    JSL.L Do_Some_Math_With_Sine_Cosine_Terrible_Label_Name ; ($16.$18, $1A.$1C) = ([$14] * |cos([$12] * pi / 80h)|, [$14] * |sin([$12] * pi / 80h)|)
    LDA.B $16 : STA.L $7E8010 
    LDA.B $18 : STA.L $7E8012 
    LDA.B $1A : STA.L $7E8014 
    LDA.B $1C : STA.L $7E8016 
    RTL 


.notDead:
    JSR.W DraygonHealthBasedPaletteHandling 
    RTL 


DraygonHealthBasedPaletteTable:
    dw $0319,$0254,$018F,$00CA,$02BA,$01F4,$014F,$00AA 
    dw $023B,$01B5,$012F,$0089,$01DC,$0155,$00EF,$0069 
    dw $015C,$0116,$00B0,$0069,$00FD,$00B6,$0070,$0049 
    dw $007E,$0077,$0050,$0028,$001F,$0017,$0010,$0008 

DraygonHealthBasedPaletteThresholds:
    dw $1482,$1194,$0EA6,$0BB8,$08CA,$05DC,$02EE,$0000 
    dw $FFFF 

DraygonHealthBasedPaletteHandling:
    LDX.W #$0000 

.loopFindThreshold:
    LDA.W $0F8C : CMP.W DraygonHealthBasedPaletteThresholds,X : BPL .found 
    INX #2
    BRA .loopFindThreshold 


.found:
    TXA 
    CMP.L $7E781C : BEQ .return 
    STA.L $7E781C 
    LDA.L $7E781C ; >_<
    ASL #2
    TAY 
    LDX.W #$0000 

.loopPalette:
    LDA.W DraygonHealthBasedPaletteTable,Y : STA.L $7EC0B2,X 
    INY #2
    INX #2
    CPX.W #$0008 
    BNE .loopPalette 

.return:
    RTS 


Instruction_Draygon_FunctionInY:
    LDA.W $0000,Y : STA.W $0FA8,X 
    INY #2
    RTL 


Inst_Draygon_SpawnDyingDraygonSpriteObject_BigDustCloud:
    PHY : PHX 
    JSR.W GenerateRandomDyingDraygonSpriteObjectPosition 
    LDA.W #$0015 : STA.B $16 
    STZ.B $18 
    JSL.L Create_Sprite_Object 
    PLX : PLY 
    RTL 


Inst_Draygon_SpawnDyingDraygonSpriteObject_SmallExplosion:
    PHY : PHX 
    JSR.W GenerateRandomDyingDraygonSpriteObjectPosition 
    LDA.W #$0003 : STA.B $16 
    STZ.B $18 
    JSL.L Create_Sprite_Object 
    PLX : PLY 
    RTL 


Inst_Draygon_SpawnDyingDraygonSpriteObject_BigExplosion:
    PHY : PHX 
    JSR.W GenerateRandomDyingDraygonSpriteObjectPosition 
    LDA.W #$001D : STA.B $16 
    STZ.B $18 
    JSL.L Create_Sprite_Object 
    PLX : PLY 
    RTL 


Inst_Draygon_SpawnDyingDraygonSpriteObject_BreathBubbles:
    PHY : PHX 
    JSR.W GenerateRandomDyingDraygonSpriteObjectPosition 
    LDA.W #$0018 : STA.B $16 
    STZ.B $18 
    JSL.L Create_Sprite_Object 
    PLX : PLY 
    RTL 


GenerateRandomDyingDraygonSpriteObjectPosition:
    JSL.L GenerateRandomNumber 
    LDA.W $05E5 : AND.W #$007F 
    SEC : SBC.W #$0040 : STA.B $12 
    LDA.W $0F7A : CLC : ADC.B $12 : STA.B $12 
    LDA.W $05E5 : AND.W #$7F00 
    XBA 
    SEC : SBC.W #$0040 : STA.B $14 
    LDA.W $0F7E : CLC : ADC.B $14 : STA.B $14 
    RTS 


InstList_Draygon_Sleep:
    dw Instruction_Common_Sleep 

InstList_DraygonBody_FacingLeft_Reset:
    dw Instruction_Draygon_SetInstList_Body_Eye_Tail_Arms 
    dw InstList_DraygonBody_FacingLeft_Idle 
    dw InstList_DraygonEye_FacingLeft_Idle 
    dw InstList_DraygonTail_FacingLeft_Idle_0 
    dw InstList_DraygonArms_FacingLeft_Idle_0 
    dw Instruction_Draygon_RoomLoadingInterruptCmd_BeginHUDDraw 
    dw Instruction_Draygon_EyeFunctionInY 
    dw Function_DraygonEye_FacingLeft 
    dw $0001 
    dw ExtendedSpritemap_Draygon_1A 
    dw Instruction_Common_Sleep 

InstList_DraygonBody_FacingRight_Reset:
    dw Instruction_Draygon_SetInstList_Body_Eye_Tail_Arms 
    dw InstList_DraygonBody_FacingRight_Idle 
    dw InstList_DraygonEye_FacingRight_Idle 
    dw InstList_DraygonTail_FacingRight_Idle_0 
    dw InstList_DraygonArms_FacingRight_Idle_0 
    dw Instruction_Draygon_RoomLoadingInterruptCmd_BeginHUDDraw 
    dw Instruction_Draygon_EyeFunctionInY 
    dw Function_DraygonEye_FacingRight 
    dw $0001 
    dw ExtendedSpritemap_Draygon_4A 
    dw Instruction_Common_Sleep 

InstList_DraygonArms_FacingLeft_Idle_0:
    dw $0005 
    dw ExtendedSpritemap_Draygon_4 
    dw $0005 
    dw ExtendedSpritemap_Draygon_5 
    dw $0005 
    dw ExtendedSpritemap_Draygon_6 
    dw $0005 
    dw ExtendedSpritemap_Draygon_7 
    dw $0005 
    dw ExtendedSpritemap_Draygon_8 
    dw $0005 
    dw ExtendedSpritemap_Draygon_9 
    dw Instruction_Common_GotoY 
    dw InstList_DraygonArms_FacingLeft_Idle_0 

InstList_DraygonArms_FacingLeft_Idle_1:
    dw Instruction_Common_Sleep 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_DraygonArms_A59805:
    dw $0001 
    dw ExtendedSpritemap_Draygon_1D 
    dw $0001 
    dw ExtendedSpritemap_Draygon_1C 
    dw $0040 
    dw ExtendedSpritemap_Draygon_1B 
    dw Instruction_Common_Sleep 
endif ; !FEATURE_KEEP_UNREFERENCED

InstList_DraygonArms_FacingLeft_NearSwoopApex:
    dw $0001 
    dw ExtendedSpritemap_Draygon_1B 
    dw $0001 
    dw ExtendedSpritemap_Draygon_1C 
    dw $0001 
    dw ExtendedSpritemap_Draygon_1D 
    dw $0040 
    dw ExtendedSpritemap_Draygon_1E 
    dw Instruction_Common_Sleep 

Debug_InstList_DraygonArms_FacingLeft_FakeGrab:
    dw $0001 
    dw ExtendedSpritemap_Draygon_1B 
    dw $0001 
    dw ExtendedSpritemap_Draygon_1C 
    dw $0001 
    dw ExtendedSpritemap_Draygon_1D 
    dw $0040 
    dw ExtendedSpritemap_Draygon_1E 
    dw $0001 
    dw ExtendedSpritemap_Draygon_1D 
    dw $0001 
    dw ExtendedSpritemap_Draygon_1C 
    dw $0040 
    dw ExtendedSpritemap_Draygon_1B 
    dw Instruction_Common_GotoY 
    dw InstList_DraygonArms_FacingLeft_Idle_0 

InstList_DraygonArms_FacingLeft_Grab:
    dw $0001 
    dw ExtendedSpritemap_Draygon_1B 
    dw $0001 
    dw ExtendedSpritemap_Draygon_1C 
    dw $0001 
    dw ExtendedSpritemap_Draygon_1D 
    dw $0008 
    dw ExtendedSpritemap_Draygon_1E 
    dw $0001 
    dw ExtendedSpritemap_Draygon_1D 
    dw $0001 
    dw ExtendedSpritemap_Draygon_1C 
    dw $0001 
    dw ExtendedSpritemap_Draygon_1B 
    dw $0001 
    dw ExtendedSpritemap_Draygon_1C 
    dw Instruction_Common_Sleep 

InstList_DraygonArms_FacingLeft_Dying:
    dw $0005 
    dw ExtendedSpritemap_Draygon_A 
    dw $0005 
    dw ExtendedSpritemap_Draygon_B 
    dw $0005 
    dw ExtendedSpritemap_Draygon_C 
    dw $0005 
    dw ExtendedSpritemap_Draygon_D 
    dw Instruction_Common_GotoY 
    dw InstList_DraygonBody_Dying_0 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_DraygonBody_A5987B:
    dw $0005 
    dw ExtendedSpritemap_Draygon_C 
    dw $0005 
    dw ExtendedSpritemap_Draygon_B 
    dw $0005 
    dw ExtendedSpritemap_Draygon_A 
    dw Instruction_Common_Sleep 
endif ; !FEATURE_KEEP_UNREFERENCED

InstList_DraygonBody_FacingLeft_Idle:
    dw Instruction_Draygon_RoomLoadingInterruptCmd_BeginHUDDraw 
    dw Instruction_Draygon_EyeFunctionInY 
    dw Function_DraygonEye_FacingLeft 
    dw $0001 
    dw ExtendedSpritemap_Draygon_1A 
    dw Instruction_Common_Sleep 

Instruction_Draygon_RoomLoadingInterruptCmd_BeginHUDDraw:
    LDA.W #$000C : STA.B $A9 
    RTL 


InstList_DraygonBody_Dying_0:
    dw Instruction_Draygon_QueueSFXInY_Lib3_Max6 
    dw $001B 
    dw Instruction_DraygonBody_SetAsIntangible 
    dw Instruction_Common_TimerInY 
    dw $0008 

InstList_DraygonBody_Dying_1:
    dw Instruction_Common_WaitYFrames 
    dw $000C 
    dw Inst_Draygon_SpawnDyingDraygonSpriteObject_BigExplosion 
    dw Inst_Draygon_SpawnDyingDraygonSpriteObject_SmallExplosion 
    dw Inst_Draygon_SpawnDyingDraygonSpriteObject_BigDustCloud 
    dw Inst_Draygon_SpawnDyingDraygonSpriteObject_BreathBubbles 
    dw Instruction_Draygon_QueueSFXInY_Lib2_Max6 
    dw $0025 
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate 
    dw InstList_DraygonBody_Dying_1 
    dw Instruction_Common_WaitYFrames 
    dw $0001 
    dw Instruction_Draygon_ParalyseDraygonTailAndArms 

InstList_DraygonBody_Dying_2:
    dw Instruction_Common_WaitYFrames 
    dw $0010 
    dw Inst_Draygon_SpawnDyingDraygonSpriteObject_BigExplosion 
    dw Inst_Draygon_SpawnDyingDraygonSpriteObject_SmallExplosion 
    dw Inst_Draygon_SpawnDyingDraygonSpriteObject_BigDustCloud 
    dw Inst_Draygon_SpawnDyingDraygonSpriteObject_BreathBubbles 
    dw Instruction_Draygon_QueueSFXInY_Lib2_Max6 
    dw $0025 
    dw Instruction_Common_GotoY 
    dw InstList_DraygonBody_Dying_2 

Instruction_Draygon_ParalyseDraygonTailAndArms:
    PHX : PHY 
    LDA.W #$0001 : STA.W $1014 
    STA.W $1054 
    LDA.W #InstList_Draygon_Sleep : STA.W $1012 
    LDA.W #InstList_Draygon_Sleep : STA.W $1052 
    PLY : PLX 
    RTL 


InstList_Draygon_Delete:
    dw Instruction_Common_DeleteEnemy 

Instruction_DraygonBody_SetAsIntangible:
    PHX 
    LDX.W $0E54 
    LDA.W $0F86 : ORA.W #$0400 : STA.W $0F86 
    PLX 
    RTL 


InstList_DraygonBody_FacingLeft_FireGoop:
    dw $0001 
    dw ExtendedSpritemap_Draygon_E 
    dw $0002 
    dw ExtendedSpritemap_Draygon_F 
    dw $0003 
    dw ExtendedSpritemap_Draygon_10 
    dw Instruction_Draygon_SpawnGoop_Leftwards 
    dw Instruction_Draygon_QueueSFXInY_Lib2_Max6 
    dw $004C,$0003 
    dw ExtendedSpritemap_Draygon_11 
    dw $0002 
    dw ExtendedSpritemap_Draygon_10 
    dw $0002 
    dw ExtendedSpritemap_Draygon_F 
    dw $0001 
    dw ExtendedSpritemap_Draygon_E 
    dw Instruction_Common_Sleep 

InstList_DraygonBody_FacingLeft_Roar:
    dw Instruction_Draygon_QueueSFXInY_Lib2_Max6 
    dw $0073,$0006 
    dw ExtendedSpritemap_Draygon_E 
    dw $0006 
    dw ExtendedSpritemap_Draygon_F 
    dw $0006 
    dw ExtendedSpritemap_Draygon_10 
    dw $0006 
    dw ExtendedSpritemap_Draygon_11 
    dw $0006 
    dw ExtendedSpritemap_Draygon_10 
    dw $0006 
    dw ExtendedSpritemap_Draygon_F 
    dw $0006 
    dw ExtendedSpritemap_Draygon_E 
    dw Instruction_Common_Sleep 

InstList_DraygonEye_FacingLeft_Idle:
    dw $0015 
    dw ExtendedSpritemap_Draygon_12 
    dw $0005 
    dw ExtendedSpritemap_Draygon_13 
    dw $0005 
    dw ExtendedSpritemap_Draygon_14 
    dw $000A 
    dw ExtendedSpritemap_Draygon_13 
    dw $000A 
    dw ExtendedSpritemap_Draygon_16 
    dw $000A 
    dw ExtendedSpritemap_Draygon_16 
    dw $000A 
    dw ExtendedSpritemap_Draygon_18 
    dw $000A 
    dw ExtendedSpritemap_Draygon_18 
    dw $000A 
    dw ExtendedSpritemap_Draygon_19 
    dw $0005 
    dw ExtendedSpritemap_Draygon_14 
    dw $0005 
    dw ExtendedSpritemap_Draygon_13 
    dw $0005 
    dw ExtendedSpritemap_Draygon_12 
    dw Instruction_Draygon_FunctionInY 
    dw Function_DraygonEye_FacingLeft 
    dw Instruction_Common_Sleep 

InstList_DraygonEye_FacingLeft_Dying_0:
    dw Instruction_Common_TimerInY 
    dw $0004 

InstList_DraygonEye_FacingLeft_Dying_1:
    dw $0004 
    dw ExtendedSpritemap_Draygon_16 
    dw $0004 
    dw ExtendedSpritemap_Draygon_18 
    dw $0004 
    dw ExtendedSpritemap_Draygon_17 
    dw $0004 
    dw ExtendedSpritemap_Draygon_19 
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate 
    dw InstList_DraygonEye_FacingLeft_Dying_1 
    dw $0020 
    dw ExtendedSpritemap_Draygon_15 
    dw $0010 
    dw ExtendedSpritemap_Draygon_14 
    dw Instruction_Common_Sleep 

InstList_DraygonEye_FacingLeft_Dead:
    dw $0020 
    dw ExtendedSpritemap_Draygon_15 
    dw $0020 
    dw ExtendedSpritemap_Draygon_14 
    dw $0020 
    dw ExtendedSpritemap_Draygon_13 
    dw $0001 
    dw ExtendedSpritemap_Draygon_12 
    dw Instruction_Common_Sleep 

InstList_DraygonEye_FacingLeft_LookingLeft:
    dw $0001 
    dw ExtendedSpritemap_Draygon_16 
    dw Instruction_Common_Sleep 

InstList_DraygonEye_FacingLeft_LookingRight:
    dw $0001 
    dw ExtendedSpritemap_Draygon_17 
    dw Instruction_Common_Sleep 

InstList_DraygonEye_FacingLeft_LookingUp:
    dw $0001 
    dw ExtendedSpritemap_Draygon_18 
    dw Instruction_Common_Sleep 

InstList_DraygonEye_FacingLeft_LookingDown:
    dw $0001 
    dw ExtendedSpritemap_Draygon_19 
    dw Instruction_Common_Sleep 

InstList_DraygonTail_FacingLeft_Idle_0:
    dw $0008 
    dw ExtendedSpritemap_Draygon_22 
    dw $0007 
    dw ExtendedSpritemap_Draygon_23 
    dw $0006 
    dw ExtendedSpritemap_Draygon_24 
    dw $0006 
    dw ExtendedSpritemap_Draygon_25 
    dw $0006 
    dw ExtendedSpritemap_Draygon_26 
    dw $0006 
    dw ExtendedSpritemap_Draygon_27 
    dw $0006 
    dw ExtendedSpritemap_Draygon_28 
    dw $0006 
    dw ExtendedSpritemap_Draygon_27 
    dw $0006 
    dw ExtendedSpritemap_Draygon_26 
    dw $0006 
    dw ExtendedSpritemap_Draygon_25 
    dw $0006 
    dw ExtendedSpritemap_Draygon_24 
    dw $0007 
    dw ExtendedSpritemap_Draygon_23 
    dw Instruction_Common_GotoY 
    dw InstList_DraygonTail_FacingLeft_Idle_0 

InstList_DraygonTail_FacingLeft_Idle_1:
    dw Instruction_Common_Sleep 

InstList_DraygonTail_FacingLeft_FakeTailWhip:
    dw Instruction_DraygonBody_DisplaceGraphics 
    dw $FFFF,$FFFF,$0010 
    dw ExtendedSpritemap_Draygon_24 
    dw Instruction_DraygonBody_DisplaceGraphics 
    dw $FFFE,$FFFE,$0006 
    dw ExtendedSpritemap_Draygon_29 
    dw Instruction_DraygonBody_DisplaceGraphics 
    dw $FFFD,$FFFD,$0005 
    dw ExtendedSpritemap_Draygon_2A 
    dw Instruction_DraygonBody_DisplaceGraphics 
    dw $FFFC,$FFFC,$0004 
    dw ExtendedSpritemap_Draygon_2B 
    dw Instruction_DraygonBody_DisplaceGraphics 
    dw $FFFB,$FFFB,$0003 
    dw ExtendedSpritemap_Draygon_2C 
    dw Instruction_DraygonBody_DisplaceGraphics 
    dw $FFFA,$FFFA,$0002 
    dw ExtendedSpritemap_Draygon_2D 
    dw Instruction_DraygonBody_DisplaceGraphics 
    dw $FFF8,$FFF8,$0001 
    dw ExtendedSpritemap_Draygon_2E 
    dw Instruction_DraygonBody_DisplaceGraphics 
    dw $0000,$0000,$0010 
    dw ExtendedSpritemap_Draygon_2F 
    dw $0001 
    dw ExtendedSpritemap_Draygon_2E 
    dw $0002 
    dw ExtendedSpritemap_Draygon_2D 
    dw $0003 
    dw ExtendedSpritemap_Draygon_2C 
    dw $0004 
    dw ExtendedSpritemap_Draygon_2B 
    dw $0005 
    dw ExtendedSpritemap_Draygon_2A 
    dw $0006 
    dw ExtendedSpritemap_Draygon_29 
    dw Instruction_Common_GotoY 
    dw InstList_DraygonTail_FacingLeft_Idle_0 

InstList_DraygonTail_FacingLeft_FinalTailWhips_0:
    dw Instruction_Common_TimerInY 
    dw $0004 

InstList_DraygonTail_FacingLeft_FinalTailWhips_1:
    dw Instruction_DraygonBody_DisplaceGraphics 
    dw $FFFF,$FFFF,$0002 
    dw ExtendedSpritemap_Draygon_24 
    dw Instruction_DraygonBody_DisplaceGraphics 
    dw $FFFE,$FFFE,$0006 
    dw ExtendedSpritemap_Draygon_29 
    dw Instruction_DraygonBody_DisplaceGraphics 
    dw $FFFD,$FFFD,$0005 
    dw ExtendedSpritemap_Draygon_2A 
    dw Instruction_DraygonBody_DisplaceGraphics 
    dw $FFFC,$FFFC,$0004 
    dw ExtendedSpritemap_Draygon_2B 
    dw Instruction_DraygonBody_DisplaceGraphics 
    dw $FFFB,$FFFB,$0003 
    dw ExtendedSpritemap_Draygon_2C 
    dw Instruction_DraygonBody_DisplaceGraphics 
    dw $FFFA,$FFFA,$0002 
    dw ExtendedSpritemap_Draygon_2D 
    dw Instruction_DraygonBody_DisplaceGraphics 
    dw $FFF8,$FFF8,$0001 
    dw ExtendedSpritemap_Draygon_2E 
    dw Instruction_DraygonBody_DisplaceGraphics 
    dw $0000,$0000 
    dw Instruction_DraygonTail_TailWhipHit 
    dw Instruction_Draygon_QueueSFXInY_Lib2_Max6 
    dw $0025,$0003 
    dw ExtendedSpritemap_Draygon_2F 
    dw $0001 
    dw ExtendedSpritemap_Draygon_2E 
    dw $0002 
    dw ExtendedSpritemap_Draygon_2D 
    dw $0003 
    dw ExtendedSpritemap_Draygon_2C 
    dw $0004 
    dw ExtendedSpritemap_Draygon_2B 
    dw $0005 
    dw ExtendedSpritemap_Draygon_2A 
    dw $0006 
    dw ExtendedSpritemap_Draygon_29 
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate 
    dw InstList_DraygonTail_FacingLeft_FinalTailWhips_1 
    dw Instruction_Draygon_BodyFunctionInY 
    dw Function_DraygonBody_GrabbedSamus_FlailTail_FlyStraightUp 
    dw Instruction_Common_GotoY 
    dw InstList_DraygonTail_FacingLeft_Idle_0 

InstList_DraygonTail_FacingLeft_FinalTailWhips_2:
    dw Instruction_Common_Sleep 

InstList_DraygonTail_FacingLeft_TailWhip:
    dw Instruction_DraygonBody_DisplaceGraphics 
    dw $FFFF,$FFFF,$0002 
    dw ExtendedSpritemap_Draygon_24 
    dw Instruction_DraygonBody_DisplaceGraphics 
    dw $FFFE,$FFFE,$0006 
    dw ExtendedSpritemap_Draygon_29 
    dw Instruction_DraygonBody_DisplaceGraphics 
    dw $FFFD,$FFFD,$0005 
    dw ExtendedSpritemap_Draygon_2A 
    dw Instruction_DraygonBody_DisplaceGraphics 
    dw $FFFC,$FFFC,$0004 
    dw ExtendedSpritemap_Draygon_2B 
    dw Instruction_DraygonBody_DisplaceGraphics 
    dw $FFFB,$FFFB,$0003 
    dw ExtendedSpritemap_Draygon_2C 
    dw Instruction_DraygonBody_DisplaceGraphics 
    dw $FFFA,$FFFA,$0002 
    dw ExtendedSpritemap_Draygon_2D 
    dw Instruction_DraygonBody_DisplaceGraphics 
    dw $FFF8,$FFF8,$0001 
    dw ExtendedSpritemap_Draygon_2E 
    dw Instruction_DraygonBody_DisplaceGraphics 
    dw $0000,$0000 
    dw Instruction_DraygonTail_TailWhipHit 
    dw Instruction_Draygon_QueueSFXInY_Lib2_Max6 
    dw $0025,$0003 
    dw ExtendedSpritemap_Draygon_2F 
    dw $0001 
    dw ExtendedSpritemap_Draygon_2E 
    dw $0002 
    dw ExtendedSpritemap_Draygon_2D 
    dw $0003 
    dw ExtendedSpritemap_Draygon_2C 
    dw $0004 
    dw ExtendedSpritemap_Draygon_2B 
    dw $0005 
    dw ExtendedSpritemap_Draygon_2A 
    dw $0006 
    dw ExtendedSpritemap_Draygon_29 
    dw Instruction_Common_GotoY 
    dw InstList_DraygonTail_FacingLeft_Idle_0 

InstList_DraygonTail_FacingLeft_TailFlail:
    dw $0002 
    dw ExtendedSpritemap_Draygon_24 
    dw $0006 
    dw ExtendedSpritemap_Draygon_29 
    dw $0005 
    dw ExtendedSpritemap_Draygon_2A 
    dw $0004 
    dw ExtendedSpritemap_Draygon_2B 
    dw $0003 
    dw ExtendedSpritemap_Draygon_2C 
    dw $0002 
    dw ExtendedSpritemap_Draygon_2D 
    dw $0001 
    dw ExtendedSpritemap_Draygon_2E 
    dw Instruction_Draygon_QueueSFXInY_Lib2_Max6 
    dw $0025,$0003 
    dw ExtendedSpritemap_Draygon_2F 
    dw $0001 
    dw ExtendedSpritemap_Draygon_2E 
    dw $0002 
    dw ExtendedSpritemap_Draygon_2D 
    dw $0003 
    dw ExtendedSpritemap_Draygon_2C 
    dw $0004 
    dw ExtendedSpritemap_Draygon_2B 
    dw $0005 
    dw ExtendedSpritemap_Draygon_2A 
    dw $0006 
    dw ExtendedSpritemap_Draygon_29 
    dw Instruction_Common_GotoY 
    dw InstList_DraygonTail_FacingLeft_Idle_0 

Instruction_DraygonTail_TailWhipHit:
    PHX : PHY 
    LDA.W #$0018 : STA.L $7E781E 
    LDX.W $0F78 
    LDA.L $A00006,X : JSL.L Suit_Damage_Division 
    JSL.L Deal_A_Damage_to_Samus 
    LDA.W #$0020 : STA.W $1840 
    LDA.W #$0007 : STA.W $183E 
    LDA.W $0AF6 : STA.B $12 
    LDA.W $0AFA : CLC : ADC.W #$0010 : STA.B $14 
    LDA.W #$0015 : STA.B $16 
    STZ.B $18 
    JSL.L Create_Sprite_Object 
    PLY : PLX 
    RTL 


InstList_DraygonArms_FacingRight_Idle_0:
    dw $0005 
    dw ExtendedSpritemap_Draygon_34 
    dw $0005 
    dw ExtendedSpritemap_Draygon_35 
    dw $0005 
    dw ExtendedSpritemap_Draygon_36 
    dw $0005 
    dw ExtendedSpritemap_Draygon_37 
    dw $0005 
    dw ExtendedSpritemap_Draygon_38 
    dw $0005 
    dw ExtendedSpritemap_Draygon_39 
    dw Instruction_Common_GotoY 
    dw InstList_DraygonArms_FacingRight_Idle_0 

InstList_DraygonArms_FacingRight_Idle_1:
    dw Instruction_Common_Sleep 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_DraygonArms_A59BF8:
    dw $0001 
    dw ExtendedSpritemap_Draygon_4D 
    dw $0001 
    dw ExtendedSpritemap_Draygon_4C 
    dw $0040 
    dw ExtendedSpritemap_Draygon_4B 
    dw Instruction_Common_Sleep 
endif ; !FEATURE_KEEP_UNREFERENCED

InstList_DraygonArms_FacingRight_NearSwoopApex:
    dw $0001 
    dw ExtendedSpritemap_Draygon_4B 
    dw $0001 
    dw ExtendedSpritemap_Draygon_4C 
    dw $0001 
    dw ExtendedSpritemap_Draygon_4D 
    dw $0040 
    dw ExtendedSpritemap_Draygon_4E 
    dw Instruction_Common_Sleep 

Debug_InstList_DraygonArms_FacingRight_FakeGrab:
    dw $0001 
    dw ExtendedSpritemap_Draygon_4B 
    dw $0001 
    dw ExtendedSpritemap_Draygon_4C 
    dw $0001 
    dw ExtendedSpritemap_Draygon_4D 
    dw $0040 
    dw ExtendedSpritemap_Draygon_4E 
    dw $0001 
    dw ExtendedSpritemap_Draygon_4D 
    dw $0001 
    dw ExtendedSpritemap_Draygon_4C 
    dw $0040 
    dw ExtendedSpritemap_Draygon_4B 
    dw Instruction_Common_GotoY 
    dw InstList_DraygonArms_FacingRight_Idle_0 

InstList_DraygonArms_FacingRight_Grab:
    dw $0001 
    dw ExtendedSpritemap_Draygon_4B 
    dw $0001 
    dw ExtendedSpritemap_Draygon_4C 
    dw $0001 
    dw ExtendedSpritemap_Draygon_4D 
    dw $0008 
    dw ExtendedSpritemap_Draygon_4E 
    dw $0001 
    dw ExtendedSpritemap_Draygon_4D 
    dw $0001 
    dw ExtendedSpritemap_Draygon_4C 
    dw $0001 
    dw ExtendedSpritemap_Draygon_4B 
    dw $0001 
    dw ExtendedSpritemap_Draygon_4C 
    dw Instruction_Common_Sleep 

InstList_DraygonArms_FacingRight_Dying_0:
    dw $0005 
    dw ExtendedSpritemap_Draygon_3A 
    dw $0005 
    dw ExtendedSpritemap_Draygon_3B 
    dw $0005 
    dw ExtendedSpritemap_Draygon_3C 
    dw $0005 
    dw ExtendedSpritemap_Draygon_3D 
    dw Instruction_Common_GotoY 
    dw InstList_DraygonBody_Dying_0 

InstList_DraygonBody_FacingRight_Dying_1:
    dw Instruction_Common_Sleep 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_DraygonBody_A59C70:
    dw $0005 
    dw ExtendedSpritemap_Draygon_3C 
    dw $0005 
    dw ExtendedSpritemap_Draygon_3B 
    dw $0005 
    dw ExtendedSpritemap_Draygon_3A 
    dw Instruction_Common_Sleep 
endif ; !FEATURE_KEEP_UNREFERENCED

InstList_DraygonBody_FacingRight_Idle:
    dw Instruction_Draygon_RoomLoadingInterruptCmd_BeginHUDDraw_dup 
    dw Instruction_Draygon_EyeFunctionInY 
    dw Function_DraygonEye_FacingRight 
    dw $0001 
    dw ExtendedSpritemap_Draygon_4A 
    dw Instruction_Common_Sleep 

Instruction_Draygon_RoomLoadingInterruptCmd_BeginHUDDraw_dup:
    LDA.W #$000C : STA.B $A9 
    RTL 


InstList_DraygonBody_FacingRight_FireGoop:
    dw $0001 
    dw ExtendedSpritemap_Draygon_3E 
    dw $0002 
    dw ExtendedSpritemap_Draygon_3F 
    dw $0003 
    dw ExtendedSpritemap_Draygon_40 
    dw Instruction_Draygon_SpawnGoop_Rightwards 
    dw Instruction_Draygon_QueueSFXInY_Lib2_Max6 
    dw $004C,$0003 
    dw ExtendedSpritemap_Draygon_41 
    dw $0002 
    dw ExtendedSpritemap_Draygon_40 
    dw $0002 
    dw ExtendedSpritemap_Draygon_3F 
    dw $0001 
    dw ExtendedSpritemap_Draygon_3E 
    dw Instruction_Common_Sleep 

InstList_DraygonBody_FacingRight_Roar:
    dw Instruction_Draygon_QueueSFXInY_Lib2_Max6 
    dw $0073,$0006 
    dw ExtendedSpritemap_Draygon_3E 
    dw $0006 
    dw ExtendedSpritemap_Draygon_3F 
    dw $0006 
    dw ExtendedSpritemap_Draygon_40 
    dw $0006 
    dw ExtendedSpritemap_Draygon_41 
    dw $0006 
    dw ExtendedSpritemap_Draygon_40 
    dw $0006 
    dw ExtendedSpritemap_Draygon_3F 
    dw $0006 
    dw ExtendedSpritemap_Draygon_3E 
    dw Instruction_Common_Sleep 

InstList_DraygonEye_FacingRight_Idle:
    dw $0015 
    dw ExtendedSpritemap_Draygon_42 
    dw $0005 
    dw ExtendedSpritemap_Draygon_43 
    dw $0005 
    dw ExtendedSpritemap_Draygon_44 
    dw $000A 
    dw ExtendedSpritemap_Draygon_43 
    dw $000A 
    dw ExtendedSpritemap_Draygon_46 
    dw $000A 
    dw ExtendedSpritemap_Draygon_46 
    dw $000A 
    dw ExtendedSpritemap_Draygon_48 
    dw $000A 
    dw ExtendedSpritemap_Draygon_48 
    dw $000A 
    dw ExtendedSpritemap_Draygon_49 
    dw $0005 
    dw ExtendedSpritemap_Draygon_44 
    dw $0005 
    dw ExtendedSpritemap_Draygon_43 
    dw $0005 
    dw ExtendedSpritemap_Draygon_42 
    dw Instruction_Draygon_FunctionInY 
    dw Function_DraygonEye_FacingLeft 
    dw Instruction_Common_Sleep 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_DraygonEye_A59D0C:
    dw $0015 
    dw ExtendedSpritemap_Draygon_42 
    dw $0005 
    dw ExtendedSpritemap_Draygon_43 
    dw $0005 
    dw ExtendedSpritemap_Draygon_44 
    dw $000A 
    dw ExtendedSpritemap_Draygon_45 
endif ; !FEATURE_KEEP_UNREFERENCED

InstList_DraygonEye_FacingRight_Dying_0:
    dw Instruction_Common_TimerInY 
    dw $0004 

InstList_DraygonEye_FacingRight_Dying_1:
    dw $0004 
    dw ExtendedSpritemap_Draygon_46 
    dw $0004 
    dw ExtendedSpritemap_Draygon_48 
    dw $0004 
    dw ExtendedSpritemap_Draygon_47 
    dw $0004 
    dw ExtendedSpritemap_Draygon_49 
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate 
    dw InstList_DraygonEye_FacingRight_Dying_1 
    dw $0020 
    dw ExtendedSpritemap_Draygon_45 
    dw $0010 
    dw ExtendedSpritemap_Draygon_44 
    dw Instruction_Common_Sleep 

InstList_DraygonEye_FacingRight_Dead:
    dw $0020 
    dw ExtendedSpritemap_Draygon_45 
    dw $0020 
    dw ExtendedSpritemap_Draygon_44 
    dw $0020 
    dw ExtendedSpritemap_Draygon_43 
    dw $0001 
    dw ExtendedSpritemap_Draygon_42 
    dw Instruction_Common_Sleep 

InstList_DraygonEye_FacingRight_LookingRight:
    dw $0001 
    dw ExtendedSpritemap_Draygon_46 
    dw Instruction_Common_Sleep 

InstList_DraygonEye_FacingRight_LookingLeft:
    dw $0001 
    dw ExtendedSpritemap_Draygon_47 
    dw Instruction_Common_Sleep 

InstList_DraygonEye_FacingRight_LookingUp:
    dw $0001 
    dw ExtendedSpritemap_Draygon_48 
    dw Instruction_Common_Sleep 

InstList_DraygonEye_FacingRight_LookingDown:
    dw $0001 
    dw ExtendedSpritemap_Draygon_49 
    dw Instruction_Common_Sleep 

InstList_DraygonTail_FacingRight_Idle_0:
    dw $0008 
    dw ExtendedSpritemap_Draygon_59 
    dw $0007 
    dw ExtendedSpritemap_Draygon_5A 
    dw $0006 
    dw ExtendedSpritemap_Draygon_5B 
    dw $0006 
    dw ExtendedSpritemap_Draygon_5C 
    dw $0006 
    dw ExtendedSpritemap_Draygon_5D 
    dw $0006 
    dw ExtendedSpritemap_Draygon_5E 
    dw $0006 
    dw ExtendedSpritemap_Draygon_5F 
    dw $0006 
    dw ExtendedSpritemap_Draygon_5E 
    dw $0006 
    dw ExtendedSpritemap_Draygon_5D 
    dw $0006 
    dw ExtendedSpritemap_Draygon_5C 
    dw $0006 
    dw ExtendedSpritemap_Draygon_5B 
    dw $0007 
    dw ExtendedSpritemap_Draygon_5A 
    dw Instruction_Common_GotoY 
    dw InstList_DraygonTail_FacingRight_Idle_0 

InstList_DraygonTail_FacingRight_Idle_1:
    dw Instruction_Common_Sleep 

Debug_InstList_DraygonTail_FacingRight_FakeTailWhip:
    dw Instruction_DraygonBody_DisplaceGraphics 
    dw $0001,$FFFF,$0010 
    dw ExtendedSpritemap_Draygon_5B 
    dw Instruction_DraygonBody_DisplaceGraphics 
    dw $0002,$FFFE,$0006 
    dw ExtendedSpritemap_Draygon_60 
    dw Instruction_DraygonBody_DisplaceGraphics 
    dw $0003,$FFFD,$0005 
    dw ExtendedSpritemap_Draygon_61 
    dw Instruction_DraygonBody_DisplaceGraphics 
    dw $0004,$FFFC,$0004 
    dw ExtendedSpritemap_Draygon_62 
    dw Instruction_DraygonBody_DisplaceGraphics 
    dw $0005,$FFFB,$0003 
    dw ExtendedSpritemap_Draygon_63 
    dw Instruction_DraygonBody_DisplaceGraphics 
    dw $0006,$FFFA,$0002 
    dw ExtendedSpritemap_Draygon_64 
    dw Instruction_DraygonBody_DisplaceGraphics 
    dw $0008,$FFF9,$0001 
    dw ExtendedSpritemap_Draygon_65 
    dw Instruction_DraygonBody_DisplaceGraphics 
    dw $0000,$0000,$0010 
    dw ExtendedSpritemap_Draygon_66 
    dw $0001 
    dw ExtendedSpritemap_Draygon_65 
    dw $0002 
    dw ExtendedSpritemap_Draygon_64 
    dw $0003 
    dw ExtendedSpritemap_Draygon_63 
    dw $0004 
    dw ExtendedSpritemap_Draygon_62 
    dw $0005 
    dw ExtendedSpritemap_Draygon_61 
    dw $0006 
    dw ExtendedSpritemap_Draygon_60 
    dw Instruction_Common_GotoY 
    dw InstList_DraygonTail_FacingRight_Idle_0 

Instruction_DraygonBody_DisplaceGraphics:
    PHX : PHY 
    LDA.W $0000,Y : STA.L $7E883C 
    LDA.W $0002,Y : STA.L $7E883E 
    PLY : PLX 
    INY #4
    RTL 


InstList_DraygonTail_FacingRight_FinalTailWhips_0:
    dw Instruction_Common_TimerInY 
    dw $0004 

InstList_DraygonTail_FacingRight_FinalTailWhips_1:
    dw Instruction_DraygonBody_DisplaceGraphics 
    dw $0001,$FFFF,$0002 
    dw ExtendedSpritemap_Draygon_5B 
    dw Instruction_DraygonBody_DisplaceGraphics 
    dw $0002,$FFFE,$0006 
    dw ExtendedSpritemap_Draygon_60 
    dw Instruction_DraygonBody_DisplaceGraphics 
    dw $0003,$FFFD,$0005 
    dw ExtendedSpritemap_Draygon_61 
    dw Instruction_DraygonBody_DisplaceGraphics 
    dw $0004,$FFFC,$0004 
    dw ExtendedSpritemap_Draygon_62 
    dw Instruction_DraygonBody_DisplaceGraphics 
    dw $0005,$FFFB,$0003 
    dw ExtendedSpritemap_Draygon_63 
    dw Instruction_DraygonBody_DisplaceGraphics 
    dw $0006,$FFFA,$0002 
    dw ExtendedSpritemap_Draygon_64 
    dw Instruction_DraygonBody_DisplaceGraphics 
    dw $0008,$FFF8,$0001 
    dw ExtendedSpritemap_Draygon_65 
    dw Instruction_DraygonBody_DisplaceGraphics 
    dw $0000,$0000 
    dw Instruction_DraygonTail_TailWhipHit 
    dw Instruction_Draygon_QueueSFXInY_Lib2_Max6 
    dw $0025,$0003 
    dw ExtendedSpritemap_Draygon_66 
    dw $0001 
    dw ExtendedSpritemap_Draygon_65 
    dw $0002 
    dw ExtendedSpritemap_Draygon_64 
    dw $0003 
    dw ExtendedSpritemap_Draygon_63 
    dw $0004 
    dw ExtendedSpritemap_Draygon_62 
    dw $0005 
    dw ExtendedSpritemap_Draygon_61 
    dw $0006 
    dw ExtendedSpritemap_Draygon_60 
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate 
    dw InstList_DraygonTail_FacingRight_FinalTailWhips_1 
    dw Instruction_Draygon_BodyFunctionInY 
    dw Function_DraygonBody_GrabbedSamus_FlailTail_FlyStraightUp 
    dw Instruction_Common_GotoY 
    dw InstList_DraygonTail_FacingRight_Idle_0 

InstList_DraygonTail_FacingRight_FinalTailWhips_2:
    dw Instruction_Common_Sleep 

InstList_DraygonTail_FacingRight_TailWhip_0:
    dw Instruction_DraygonBody_DisplaceGraphics 
    dw $0001,$FFFF,$0002 
    dw ExtendedSpritemap_Draygon_5B 
    dw Instruction_DraygonBody_DisplaceGraphics 
    dw $0002,$FFFE,$0006 
    dw ExtendedSpritemap_Draygon_60 
    dw Instruction_DraygonBody_DisplaceGraphics 
    dw $0003,$FFFD,$0005 
    dw ExtendedSpritemap_Draygon_61 
    dw Instruction_DraygonBody_DisplaceGraphics 
    dw $0004,$FFFC,$0004 
    dw ExtendedSpritemap_Draygon_62 
    dw Instruction_DraygonBody_DisplaceGraphics 
    dw $0005,$FFFB,$0003 
    dw ExtendedSpritemap_Draygon_63 
    dw Instruction_DraygonBody_DisplaceGraphics 
    dw $0006,$FFFA,$0002 
    dw ExtendedSpritemap_Draygon_64 
    dw Instruction_DraygonBody_DisplaceGraphics 
    dw $0008,$FFF8,$0001 
    dw ExtendedSpritemap_Draygon_65 
    dw Instruction_DraygonBody_DisplaceGraphics 
    dw $0000,$0000 
    dw Instruction_DraygonTail_TailWhipHit 
    dw Instruction_Draygon_QueueSFXInY_Lib2_Max6 
    dw $0025,$0003 
    dw ExtendedSpritemap_Draygon_66 
    dw $0001 
    dw ExtendedSpritemap_Draygon_65 
    dw $0002 
    dw ExtendedSpritemap_Draygon_64 
    dw $0003 
    dw ExtendedSpritemap_Draygon_63 
    dw $0004 
    dw ExtendedSpritemap_Draygon_62 
    dw $0005 
    dw ExtendedSpritemap_Draygon_61 
    dw $0006 
    dw ExtendedSpritemap_Draygon_60 
    dw Instruction_Common_GotoY 
    dw InstList_DraygonTail_FacingRight_Idle_0 

InstList_DraygonTail_FacingRight_TailWhip_1:
    dw Instruction_Common_Sleep 

InstList_DraygonTail_FacingRight_TailFlail_0:
    dw $0002 
    dw ExtendedSpritemap_Draygon_5B 
    dw $0006 
    dw ExtendedSpritemap_Draygon_60 
    dw $0005 
    dw ExtendedSpritemap_Draygon_61 
    dw $0004 
    dw ExtendedSpritemap_Draygon_62 
    dw $0003 
    dw ExtendedSpritemap_Draygon_63 
    dw $0002 
    dw ExtendedSpritemap_Draygon_64 
    dw $0001 
    dw ExtendedSpritemap_Draygon_65 
    dw Instruction_Draygon_QueueSFXInY_Lib2_Max6 
    dw $0025,$0003 
    dw ExtendedSpritemap_Draygon_66 
    dw $0001 
    dw ExtendedSpritemap_Draygon_65 
    dw $0002 
    dw ExtendedSpritemap_Draygon_64 
    dw $0003 
    dw ExtendedSpritemap_Draygon_63 
    dw $0004 
    dw ExtendedSpritemap_Draygon_62 
    dw $0005 
    dw ExtendedSpritemap_Draygon_61 
    dw $0006 
    dw ExtendedSpritemap_Draygon_60 
    dw Instruction_Common_GotoY 
    dw InstList_DraygonTail_FacingRight_Idle_0 

InstList_DraygonTail_FacingRight_TailFlail_1:
    dw Instruction_Common_Sleep 

Instruction_Draygon_BodyFunctionInY:
    LDA.W $0000,Y : STA.W $0FA8 
    INY #2
    RTL 


Instruction_Draygon_QueueSFXInY_Lib2_Max6:
    PHX : PHY 
    LDA.W $0000,Y : JSL.L QueueSound_Lib2_Max6 
    PLY : PLX 
    INY #2
    RTL 


Instruction_Draygon_QueueSFXInY_Lib3_Max6:
    PHX : PHY 
    LDA.W $0000,Y : JSL.L QueueSound_Lib3_Max6 
    PLY : PLX 
    INY #2
    RTL 


Instruction_Draygon_SpawnGoop_Leftwards:
    PHX : PHY 
    LDX.W $0E54 
    LDA.W $0F7A : CLC : ADC.W #$FFE4 : STA.B $12 
    LDA.W $0F7E : CLC : ADC.W #$FFF0 : STA.B $14 
    JSL.L GenerateRandomNumber 
    AND.W #$003F 
    CLC : ADC.W #$0080 : STA.W $1995 
    LDY.W #EnemyProjectile_DraygonGoop 
    LDA.W #$0002 : JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    PLY : PLX 
    RTL 


Instruction_Draygon_SpawnGoop_Rightwards:
    PHX : PHY 
    LDX.W $0E54 
    LDA.W $0F7A : CLC : ADC.W #$0018 : STA.B $12 
    LDA.W $0F7E : CLC : ADC.W #$FFF0 : STA.B $14 
    JSL.L GenerateRandomNumber 
    AND.W #$003F 
    CLC : ADC.W #$00C0 : STA.W $1995 
    LDY.W #EnemyProjectile_DraygonGoop 
    LDA.W #$0002 : JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    PLY : PLX 
    RTL 


HandleDeathSequenceEvirMovement:
    PHY 
    LDX.W #$003E 
    LDY.W #$0014 

.loop:
    LDA.W DraygonDeathSequenceEvirAngles,Y : CLC : ADC.W #$0040 : BIT.W #$0080 
    BEQ + 
    LDA.L $7EF178,X : CLC : ADC.W DraygonDeathSequenceEvirSubSpeeds_X,Y : STA.L $7EF178,X 
    LDA.L $7EF0F8,X : ADC.W #$0000 : STA.L $7EF0F8,X 
    BRA .YPosition 


  + LDA.L $7EF178,X : SEC : SBC.W DraygonDeathSequenceEvirSubSpeeds_X,Y : STA.L $7EF178,X 
    LDA.L $7EF0F8,X : SBC.W $0E24 : STA.L $7EF0F8,X 

.YPosition:
    LDA.W DraygonDeathSequenceEvirAngles,Y : CLC : ADC.W #$0080 : BIT.W #$0080 
    BEQ + 
    LDA.L $7EF278,X : CLC : ADC.W DraygonDeathSequenceEvirSubSpeeds_Y,Y : STA.L $7EF278,X 
    LDA.L $7EF1F8,X : ADC.W #$0000 : STA.L $7EF1F8,X 
    BRA .nextSpriteObject 


  + LDA.L $7EF278,X : SEC : SBC.W DraygonDeathSequenceEvirSubSpeeds_Y,Y : STA.L $7EF278,X 
    LDA.L $7EF1F8,X : SBC.W #$0000 : STA.L $7EF1F8,X 

.nextSpriteObject:
    DEX #2
    DEY #4
    BPL .gotoLoop 
    PLY 
    RTS 


.gotoLoop:
    JMP.W .loop 


SpawnDeathSequenceEvirSpriteObjects:
    PHX : PHY 
    LDX.W #$003E 
    LDA.W #$0000 

.loopClearSpriteObjects:
    STA.L $7EEF78,X 
    DEX #2
    BPL .loopClearSpriteObjects 
    LDX.W #$0002 
    LDY.W #$0014 

loopLeft:
    LDA.W DraygonDeathSequenceEvirSpawnPositions_X,Y : STA.B $12 
    LDA.W DraygonDeathSequenceEvirSpawnPositions_Y,Y : STA.B $14 
    LDA.W #$003B : STA.B $16 
    LDA.W #$0E00 : STA.B $18 
    JSL.L Create_Sprite_Object 
    DEY #4
    DEX 
    BPL loopLeft 
    LDX.W #$0002 

.loopRight:
    LDA.W DraygonDeathSequenceEvirSpawnPositions_X,Y : STA.B $12 
    LDA.W DraygonDeathSequenceEvirSpawnPositions_Y,Y : STA.B $14 
    LDA.W #$003C : STA.B $16 
    LDA.W #$0E00 : STA.B $18 
    JSL.L Create_Sprite_Object 
    DEY #4
    DEX 
    BPL .loopRight 
    PLY : PLX 
    RTS 


Draygon_ClearSpriteObjects:
    PHX : PHY 
    LDX.W #$003E 
    LDA.W #$0000 

.loop:
    STA.L $7EEF78,X 
    DEX #2
    BPL .loop 
    PLY : PLX 
    RTS 


SpawnFightIntroEvirSpriteObjects:
    PHX : PHY 
    LDA.W #$0010 : STA.B $12 
    LDA.W #$0180 : STA.B $14 
    LDA.W #$003B : STA.B $16 
    LDA.W #$0E00 : STA.B $18 
    JSL.L Create_Sprite_Object 
    LDA.W #$0010 : STA.B $12 
    LDA.W #$0180 : STA.B $14 
    LDA.W #$003B : STA.B $16 
    LDA.W #$0E00 : STA.B $18 
    JSL.L Create_Sprite_Object 
    LDA.W #$0010 : STA.B $12 
    LDA.W #$0180 : STA.B $14 
    LDA.W #$003B : STA.B $16 
    LDA.W #$0E00 : STA.B $18 
    JSL.L Create_Sprite_Object 
    LDA.W #$0010 : STA.B $12 
    LDA.W #$0180 : STA.B $14 
    LDA.W #$003B : STA.B $16 
    LDA.W #$0E00 : STA.B $18 
    JSL.L Create_Sprite_Object 
    PLY : PLX 
    RTS 


HandleDraygonFightIntroDance:
    PHY 
    LDX.W #$003E 

.loop:
    TXA 
    SEC : SBC.W #$0038 : TAY 
    LDA.W MovementLatencyForEachEvirSpriteObject,Y : CLC : ADC.L $7E880C : BMI .next 
    TAY 
    LDA.W DraygonFightIntroDanceData_KeikoLove,Y : CMP.W #$8080 : BEQ .deleteSpriteObject 
    LDA.W DraygonFightIntroDanceData_KeikoLove,Y : AND.W #$00FF 
    JSL.L Sign_Extend_A 
    CLC : ADC.L $7EF0F8,X : STA.L $7EF0F8,X 
    LDA.W DraygonFightIntroDanceData_KeikoLove+1,Y : AND.W #$00FF 
    JSL.L Sign_Extend_A 
    CLC : ADC.L $7EF1F8,X : STA.L $7EF1F8,X 

.next:
    DEX #2
    CPX.W #$0038 
    BPL .loop 
    LDA.L $7E880C 
    INC #4
    STA.L $7E880C 
    PLY 
    RTS 


.deleteSpriteObject:
    LDA.W #$0000 : STA.L $7EEF78,X 
    BRA .next 


MovementLatencyForEachEvirSpriteObject:
    dw $FC80,$FD00,$FD80,$FE00 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_MovementLatencyForEachEvirSpriteObject_A5A1A7:
    dw $FE80,$FF00,$FF80,$0000 
endif ; !FEATURE_KEEP_UNREFERENCED

DraygonDeathSequenceEvirSubSpeeds_X:
    dw $D4DA 

DraygonDeathSequenceEvirSubSpeeds_Y:
    dw $8E39,$8E39,$D4DA,$31F1,$FB13,$31F1,$FB13,$8E39 
    dw $D4DA,$D4DA,$8E39 

DraygonDeathSequenceEvirSpawnPositions_X:
    dw $FF59 

DraygonDeathSequenceEvirSpawnPositions_Y:
    dw $00E5,$FFE5,$0059,$009C,$000D,$0163,$000D,$021A 
    dw $0059,$02A6,$00E5 

DraygonDeathSequenceEvirAngles:
    dw $0068,$0000,$0058,$0000,$0048,$0000,$0038,$0000 
    dw $0028,$0000,$0018,$0000 

Palette_Draygon_Sprite7:
    dw $3800,$3F57,$2E4D,$00E2,$0060,$3AB0,$220B,$1166 
    dw $0924,$0319,$0254,$018F,$00CA,$581B,$1892,$0145 

Palette_Draygon_Sprite1:
    dw $3800,$3F57,$2E4D,$00E2,$0060,$3AB0,$220B,$1166 
    dw $0924,$0319,$0254,$018F,$00CA,$581B,$1892,$0145 

Palette_Draygon_Sprite2:
    dw $3800,$6B5A,$5652,$28E7,$1863,$62B5,$4A10,$396B 
    dw $3129,$43FF,$0113,$000F,$175C,$0299,$01D6,$03E0 

Palette_Draygon_Sprite3:
    dw $3800,$4B9C,$3694,$0929,$0042,$42F7,$2A52,$19AD 
    dw $116B,$1420,$1420,$1420,$1420,$1420,$1420,$1420 

Palette_Draygon_BG12_5:
    dw $3800,$3F57,$2E4D,$00E2,$0060,$3AB0,$220B,$1166 
    dw $0924,$0319,$0254,$018F,$00CA,$581B,$1892,$0145 

Palette_Draygon_WhiteFlash:
    dw $3800,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF 
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF 

ExtendedSpritemap_Draygon_0:
    dw $0001,$0000,$0000 
    dw Spritemap_Draygon_0 
    dw Hitbox_Draygon_1B 

ExtendedSpritemap_Draygon_1:
    dw $0001,$0000,$0000 
    dw Spritemap_Draygon_0 
    dw Hitbox_Draygon_1B 

ExtendedSpritemap_Draygon_2:
    dw $0001,$0000,$0000 
    dw Spritemap_Draygon_0 
    dw Hitbox_Draygon_1B 

ExtendedSpritemap_Draygon_3:
    dw $0001,$0000,$0000 
    dw Spritemap_Draygon_0 
    dw Hitbox_Draygon_1B 

ExtendedSpritemap_Draygon_4:
    dw $0001,$0000,$0001 
    dw Spritemap_Draygon_B 
    dw Hitbox_Draygon_1B 

ExtendedSpritemap_Draygon_5:
    dw $0001,$0000,$0001 
    dw Spritemap_Draygon_C 
    dw Hitbox_Draygon_1B 

ExtendedSpritemap_Draygon_6:
    dw $0001,$0000,$0001 
    dw Spritemap_Draygon_D 
    dw Hitbox_Draygon_1B 

ExtendedSpritemap_Draygon_7:
    dw $0001,$0000,$0001 
    dw Spritemap_Draygon_E 
    dw Hitbox_Draygon_1B 

ExtendedSpritemap_Draygon_8:
    dw $0001,$0000,$0001 
    dw Spritemap_Draygon_F 
    dw Hitbox_Draygon_1B 

ExtendedSpritemap_Draygon_9:
    dw $0001,$0000,$0001 
    dw Spritemap_Draygon_10 
    dw Hitbox_Draygon_1B 

ExtendedSpritemap_Draygon_A:
    dw $0001,$0000,$0000 
    dw ExtendedTilemap_Draygon_B 
    dw Hitbox_Draygon_1A 

ExtendedSpritemap_Draygon_B:
    dw $0001,$0000,$0000 
    dw ExtendedTilemap_Draygon_C 
    dw Hitbox_Draygon_1A 

ExtendedSpritemap_Draygon_C:
    dw $0001,$0000,$0000 
    dw ExtendedTilemap_Draygon_D 
    dw Hitbox_Draygon_1A 

ExtendedSpritemap_Draygon_D:
    dw $0001,$0000,$0000 
    dw ExtendedTilemap_Draygon_E 
    dw Hitbox_Draygon_1A 

ExtendedSpritemap_Draygon_E:
    dw $0001,$0000,$0000 
    dw ExtendedTilemap_Draygon_7 
    dw Hitbox_Draygon_1A 

ExtendedSpritemap_Draygon_F:
    dw $0001,$0000,$0000 
    dw ExtendedTilemap_Draygon_8 
    dw Hitbox_Draygon_1A 

ExtendedSpritemap_Draygon_10:
    dw $0001,$0000,$0000 
    dw ExtendedTilemap_Draygon_9 
    dw Hitbox_Draygon_1A 

ExtendedSpritemap_Draygon_11:
    dw $0001,$0000,$0000 
    dw ExtendedTilemap_Draygon_A 
    dw Hitbox_Draygon_1A 

ExtendedSpritemap_Draygon_12:
    dw $0001,$0000,$0000 
    dw ExtendedTilemap_Draygon_F 
    dw Hitbox_Draygon_1B 

ExtendedSpritemap_Draygon_13:
    dw $0001,$0000,$0000 
    dw ExtendedTilemap_Draygon_10 
    dw Hitbox_Draygon_1B 

ExtendedSpritemap_Draygon_14:
    dw $0001,$0000,$0000 
    dw ExtendedTilemap_Draygon_11 
    dw Hitbox_Draygon_1B 

ExtendedSpritemap_Draygon_15:
    dw $0001,$0000,$0000 
    dw ExtendedTilemap_Draygon_12 
    dw Hitbox_Draygon_1B 

ExtendedSpritemap_Draygon_16:
    dw $0001,$0000,$0000 
    dw ExtendedTilemap_Draygon_13 
    dw Hitbox_Draygon_1B 

ExtendedSpritemap_Draygon_17:
    dw $0001,$0000,$0000 
    dw ExtendedTilemap_Draygon_14 
    dw Hitbox_Draygon_1B 

ExtendedSpritemap_Draygon_18:
    dw $0001,$0000,$0000 
    dw ExtendedTilemap_Draygon_15 
    dw Hitbox_Draygon_1B 

ExtendedSpritemap_Draygon_19:
    dw $0001,$0000,$0000 
    dw ExtendedTilemap_Draygon_16 
    dw Hitbox_Draygon_1B 

ExtendedSpritemap_Draygon_1A:
    dw $0001,$0000,$0000 
    dw ExtendedTilemap_Draygon_17 
    dw Hitbox_Draygon_1A 

ExtendedSpritemap_Draygon_1B:
    dw $0001,$0000,$0001 
    dw Spritemap_Draygon_3 
    dw Hitbox_Draygon_1B 

ExtendedSpritemap_Draygon_1C:
    dw $0001,$0000,$0001 
    dw Spritemap_Draygon_4 
    dw Hitbox_Draygon_1B 

ExtendedSpritemap_Draygon_1D:
    dw $0001,$0000,$0001 
    dw Spritemap_Draygon_5 
    dw Hitbox_Draygon_1B 

ExtendedSpritemap_Draygon_1E:
    dw $0001,$0000,$0001 
    dw Spritemap_Draygon_6 
    dw Hitbox_Draygon_1B 

ExtendedSpritemap_Draygon_1F:
    dw $0001,$0029,$0001 
    dw Spritemap_Draygon_0 
    dw Hitbox_Draygon_1B 

ExtendedSpritemap_Draygon_20:
    dw $0001,$0000,$0000 
    dw ExtendedTilemap_Draygon_5 
    dw Hitbox_Draygon_12 

ExtendedSpritemap_Draygon_21:
    dw $0001,$0000,$0000 
    dw ExtendedTilemap_Draygon_6 
    dw Hitbox_Draygon_12 

ExtendedSpritemap_Draygon_22:
    dw $0002,$001B,$003F 
    dw Spritemap_Draygon_1A 
    dw Hitbox_Draygon_1B 
    dw $0037,$0021 
    dw Spritemap_Draygon_7 
    dw Hitbox_Draygon_1B 

ExtendedSpritemap_Draygon_23:
    dw $0002,$0017,$003D 
    dw Spritemap_Draygon_19 
    dw Hitbox_Draygon_1B 
    dw $0037,$0021 
    dw Spritemap_Draygon_7 
    dw Hitbox_Draygon_1B 

ExtendedSpritemap_Draygon_24:
    dw $0002,$0013,$003A 
    dw Spritemap_Draygon_18 
    dw Hitbox_Draygon_1B 
    dw $0037,$0021 
    dw Spritemap_Draygon_8 
    dw Hitbox_Draygon_1B 

ExtendedSpritemap_Draygon_25:
    dw $0002,$000E,$0035 
    dw Spritemap_Draygon_17 
    dw Hitbox_Draygon_1B 
    dw $0037,$0021 
    dw Spritemap_Draygon_8 
    dw Hitbox_Draygon_1B 

ExtendedSpritemap_Draygon_26:
    dw $0002,$000C,$002E 
    dw Spritemap_Draygon_16 
    dw Hitbox_Draygon_1B 
    dw $0037,$0021 
    dw Spritemap_Draygon_9 
    dw Hitbox_Draygon_1B 

ExtendedSpritemap_Draygon_27:
    dw $0002,$000E,$002D 
    dw Spritemap_Draygon_15 
    dw Hitbox_Draygon_1B 
    dw $0037,$0021 
    dw Spritemap_Draygon_9 
    dw Hitbox_Draygon_1B 

ExtendedSpritemap_Draygon_28:
    dw $0002,$0011,$0028 
    dw Spritemap_Draygon_14 
    dw Hitbox_Draygon_1B 
    dw $0037,$0021 
    dw Spritemap_Draygon_A 
    dw Hitbox_Draygon_1B 

ExtendedSpritemap_Draygon_29:
    dw $0003,$000B,$003C 
    dw Spritemap_Draygon_18 
    dw Hitbox_Draygon_1B 
    dw $0019,$0032 
    dw Spritemap_Draygon_24 
    dw Hitbox_Draygon_1B 
    dw $0037,$0021 
    dw Spritemap_Draygon_7 
    dw Hitbox_Draygon_1B 

ExtendedSpritemap_Draygon_2A:
    dw $0004,$0008,$0043 
    dw Spritemap_Draygon_18 
    dw Hitbox_Draygon_1B 
    dw $0014,$0036 
    dw Spritemap_Draygon_24 
    dw Hitbox_Draygon_1B 
    dw $0018,$0031 
    dw Spritemap_Draygon_24 
    dw Hitbox_Draygon_1B 
    dw $0037,$0021 
    dw Spritemap_Draygon_7 
    dw Hitbox_Draygon_1B 

ExtendedSpritemap_Draygon_2B:
    dw $0005,$0009,$004D 
    dw Spritemap_Draygon_19 
    dw Hitbox_Draygon_1B 
    dw $000F,$003D 
    dw Spritemap_Draygon_24 
    dw Hitbox_Draygon_1B 
    dw $0013,$0036 
    dw Spritemap_Draygon_24 
    dw Hitbox_Draygon_1B 
    dw $0019,$0031 
    dw Spritemap_Draygon_23 
    dw Hitbox_Draygon_1B 
    dw $0037,$0021 
    dw Spritemap_Draygon_8 
    dw Hitbox_Draygon_1B 

ExtendedSpritemap_Draygon_2C:
    dw $0006,$FFF8,$004D 
    dw Spritemap_Draygon_18 
    dw Hitbox_Draygon_1B 
    dw $0007,$0042 
    dw Spritemap_Draygon_24 
    dw Hitbox_Draygon_1B 
    dw $000C,$003C 
    dw Spritemap_Draygon_24 
    dw Hitbox_Draygon_1B 
    dw $0013,$0037 
    dw Spritemap_Draygon_23 
    dw Hitbox_Draygon_1B 
    dw $001A,$0032 
    dw Spritemap_Draygon_23 
    dw Hitbox_Draygon_1B 
    dw $0037,$0021 
    dw Spritemap_Draygon_9 
    dw Hitbox_Draygon_1B 

ExtendedSpritemap_Draygon_2D:
    dw $0007,$FFEC,$0037 
    dw Spritemap_Draygon_15 
    dw Hitbox_Draygon_1B 
    dw $FFFC,$003D 
    dw Spritemap_Draygon_24 
    dw Hitbox_Draygon_1B 
    dw $0005,$003F 
    dw Spritemap_Draygon_24 
    dw Hitbox_Draygon_1B 
    dw $000D,$003E 
    dw Spritemap_Draygon_23 
    dw Hitbox_Draygon_1B 
    dw $0015,$003A 
    dw Spritemap_Draygon_23 
    dw Hitbox_Draygon_1B 
    dw $001B,$0034 
    dw Spritemap_Draygon_22 
    dw Hitbox_Draygon_1B 
    dw $0037,$0021 
    dw Spritemap_Draygon_A 
    dw Hitbox_Draygon_1B 

ExtendedSpritemap_Draygon_2E:
    dw $0008,$FFED,$002E 
    dw Spritemap_Draygon_14 
    dw Hitbox_Draygon_1B 
    dw $FFF9,$003A 
    dw Spritemap_Draygon_24 
    dw Hitbox_Draygon_1B 
    dw $0000,$0040 
    dw Spritemap_Draygon_24 
    dw Hitbox_Draygon_1B 
    dw $0008,$0041 
    dw Spritemap_Draygon_23 
    dw Hitbox_Draygon_1B 
    dw $0011,$0043 
    dw Spritemap_Draygon_23 
    dw Hitbox_Draygon_1B 
    dw $0019,$003F 
    dw Spritemap_Draygon_22 
    dw Hitbox_Draygon_1B 
    dw $001D,$0035 
    dw Spritemap_Draygon_22 
    dw Hitbox_Draygon_1B 
    dw $0037,$0021 
    dw Spritemap_Draygon_A 
    dw Hitbox_Draygon_1B 

ExtendedSpritemap_Draygon_2F:
    dw $0008,$FFF7,$0025 
    dw Spritemap_Draygon_12 
    dw Hitbox_Draygon_1B 
    dw $FFF8,$0038 
    dw Spritemap_Draygon_24 
    dw Hitbox_Draygon_1B 
    dw $FFFD,$0041 
    dw Spritemap_Draygon_24 
    dw Hitbox_Draygon_1B 
    dw $0006,$0043 
    dw Spritemap_Draygon_23 
    dw Hitbox_Draygon_1B 
    dw $0010,$0044 
    dw Spritemap_Draygon_23 
    dw Hitbox_Draygon_1B 
    dw $0018,$0041 
    dw Spritemap_Draygon_22 
    dw Hitbox_Draygon_1B 
    dw $001E,$0037 
    dw Spritemap_Draygon_22 
    dw Hitbox_Draygon_1B 
    dw $0037,$0021 
    dw Spritemap_Draygon_A 
    dw Hitbox_Draygon_1B 

ExtendedSpritemap_Draygon_30:
    dw $0001,$0000,$0000 
    dw Spritemap_Draygon_28 
    dw Hitbox_Draygon_1B 

ExtendedSpritemap_Draygon_31:
    dw $0001,$0000,$0000 
    dw Spritemap_Draygon_28 
    dw Hitbox_Draygon_1B 

ExtendedSpritemap_Draygon_32:
    dw $0001,$0000,$0000 
    dw Spritemap_Draygon_28 
    dw Hitbox_Draygon_1B 

ExtendedSpritemap_Draygon_33:
    dw $0001,$0000,$0000 
    dw Spritemap_Draygon_28 
    dw Hitbox_Draygon_1B 

ExtendedSpritemap_Draygon_34:
    dw $0001,$0000,$0001 
    dw Spritemap_Draygon_41 
    dw Hitbox_Draygon_1B 

ExtendedSpritemap_Draygon_35:
    dw $0001,$0000,$0001 
    dw Spritemap_Draygon_42 
    dw Hitbox_Draygon_1B 

ExtendedSpritemap_Draygon_36:
    dw $0001,$0000,$0001 
    dw Spritemap_Draygon_43 
    dw Hitbox_Draygon_1B 

ExtendedSpritemap_Draygon_37:
    dw $0001,$0000,$0001 
    dw Spritemap_Draygon_44 
    dw Hitbox_Draygon_1B 

ExtendedSpritemap_Draygon_38:
    dw $0001,$0000,$0001 
    dw Spritemap_Draygon_45 
    dw Hitbox_Draygon_1B 

ExtendedSpritemap_Draygon_39:
    dw $0001,$0000,$0001 
    dw Spritemap_Draygon_46 
    dw Hitbox_Draygon_1B 

ExtendedSpritemap_Draygon_3A:
    dw $0001,$0000,$0000 
    dw ExtendedTilemap_Draygon_23 
    dw Hitbox_Draygon_2D 

ExtendedSpritemap_Draygon_3B:
    dw $0001,$0000,$0000 
    dw ExtendedTilemap_Draygon_24 
    dw Hitbox_Draygon_2D 

ExtendedSpritemap_Draygon_3C:
    dw $0001,$0000,$0000 
    dw ExtendedTilemap_Draygon_25 
    dw Hitbox_Draygon_2D 

ExtendedSpritemap_Draygon_3D:
    dw $0001,$0000,$0000 
    dw ExtendedTilemap_Draygon_26 
    dw Hitbox_Draygon_2D 

ExtendedSpritemap_Draygon_3E:
    dw $0001,$0000,$0000 
    dw ExtendedTilemap_Draygon_1F 
    dw Hitbox_Draygon_2D 

ExtendedSpritemap_Draygon_3F:
    dw $0001,$0000,$0000 
    dw ExtendedTilemap_Draygon_20 
    dw Hitbox_Draygon_2D 

ExtendedSpritemap_Draygon_40:
    dw $0001,$0000,$0000 
    dw ExtendedTilemap_Draygon_21 
    dw Hitbox_Draygon_2D 

ExtendedSpritemap_Draygon_41:
    dw $0001,$0000,$0000 
    dw ExtendedTilemap_Draygon_22 
    dw Hitbox_Draygon_2D 

ExtendedSpritemap_Draygon_42:
    dw $0001,$0000,$0000 
    dw ExtendedTilemap_Draygon_27 
    dw Hitbox_Draygon_1B 

ExtendedSpritemap_Draygon_43:
    dw $0001,$0000,$0000 
    dw ExtendedTilemap_Draygon_28 
    dw Hitbox_Draygon_1B 

ExtendedSpritemap_Draygon_44:
    dw $0001,$0000,$0000 
    dw ExtendedTilemap_Draygon_29 
    dw Hitbox_Draygon_1B 

ExtendedSpritemap_Draygon_45:
    dw $0001,$0000,$0000 
    dw ExtendedTilemap_Draygon_2A 
    dw Hitbox_Draygon_1B 

ExtendedSpritemap_Draygon_46:
    dw $0001,$0000,$0000 
    dw ExtendedTilemap_Draygon_2B 
    dw Hitbox_Draygon_1B 

ExtendedSpritemap_Draygon_47:
    dw $0001,$0000,$0000 
    dw ExtendedTilemap_Draygon_2C 
    dw Hitbox_Draygon_1B 

ExtendedSpritemap_Draygon_48:
    dw $0001,$0000,$0000 
    dw ExtendedTilemap_Draygon_2D 
    dw Hitbox_Draygon_1B 

ExtendedSpritemap_Draygon_49:
    dw $0001,$0000,$0000 
    dw ExtendedTilemap_Draygon_2E 
    dw Hitbox_Draygon_1B 

ExtendedSpritemap_Draygon_4A:
    dw $0001,$0000,$0000 
    dw ExtendedTilemap_Draygon_2F 
    dw Hitbox_Draygon_2D 

ExtendedSpritemap_Draygon_4B:
    dw $0001,$0000,$0001 
    dw Spritemap_Draygon_2B 
    dw Hitbox_Draygon_1B 

ExtendedSpritemap_Draygon_4C:
    dw $0001,$0000,$0001 
    dw Spritemap_Draygon_2C 
    dw Hitbox_Draygon_1B 

ExtendedSpritemap_Draygon_4D:
    dw $0001,$0000,$0001 
    dw Spritemap_Draygon_2D 
    dw Hitbox_Draygon_1B 

ExtendedSpritemap_Draygon_4E:
    dw $0001,$0000,$0001 
    dw Spritemap_Draygon_2E 
    dw Hitbox_Draygon_1B 

ExtendedSpritemap_Draygon_4F:
    dw $0001,$0000,$0000 
    dw Spritemap_Draygon_28 
    dw Hitbox_Draygon_1B 

ExtendedSpritemap_Draygon_50:
    dw $0001,$0000,$0000 
    dw Spritemap_Draygon_28 
    dw Hitbox_Draygon_1B 

ExtendedSpritemap_Draygon_51:
    dw $0001,$0000,$0000 
    dw Spritemap_Draygon_28 
    dw Hitbox_Draygon_1B 

ExtendedSpritemap_Draygon_52:
    dw $0001,$0000,$0000 
    dw Spritemap_Draygon_28 
    dw Hitbox_Draygon_1B 

ExtendedSpritemap_Draygon_53:
    dw $0001,$0000,$0000 
    dw Spritemap_Draygon_28 
    dw Hitbox_Draygon_1B 

ExtendedSpritemap_Draygon_54:
    dw $0001,$0000,$0000 
    dw Spritemap_Draygon_28 
    dw Hitbox_Draygon_1B 

ExtendedSpritemap_Draygon_55:
    dw $0001,$0000,$0000 
    dw Spritemap_Draygon_28 
    dw Hitbox_Draygon_1B 

ExtendedSpritemap_Draygon_56:
    dw $0001,$0000,$0000 
    dw Spritemap_Draygon_28 
    dw Hitbox_Draygon_1B 

ExtendedSpritemap_Draygon_57:
    dw $0001,$0000,$0000 
    dw ExtendedTilemap_Draygon_1D 
    dw Hitbox_Draygon_29 

ExtendedSpritemap_Draygon_58:
    dw $0001,$0000,$0000 
    dw ExtendedTilemap_Draygon_1E 
    dw Hitbox_Draygon_29 

ExtendedSpritemap_Draygon_59:
    dw $0002,$FFE5,$003F 
    dw Spritemap_Draygon_50 
    dw Hitbox_Draygon_1B 
    dw $FFCE,$0021 
    dw Spritemap_Draygon_34 
    dw Hitbox_Draygon_1B 

ExtendedSpritemap_Draygon_5A:
    dw $0002,$FFE9,$003D 
    dw Spritemap_Draygon_4F 
    dw Hitbox_Draygon_1B 
    dw $FFCE,$0021 
    dw Spritemap_Draygon_34 
    dw Hitbox_Draygon_1B 

ExtendedSpritemap_Draygon_5B:
    dw $0002,$FFED,$003A 
    dw Spritemap_Draygon_4E 
    dw Hitbox_Draygon_1B 
    dw $FFCE,$0021 
    dw Spritemap_Draygon_35 
    dw Hitbox_Draygon_1B 

ExtendedSpritemap_Draygon_5C:
    dw $0002,$FFF2,$0035 
    dw Spritemap_Draygon_4D 
    dw Hitbox_Draygon_1B 
    dw $FFCE,$0021 
    dw Spritemap_Draygon_35 
    dw Hitbox_Draygon_1B 

ExtendedSpritemap_Draygon_5D:
    dw $0002,$FFF4,$002E 
    dw Spritemap_Draygon_4C 
    dw Hitbox_Draygon_1B 
    dw $FFCE,$0021 
    dw Spritemap_Draygon_3F 
    dw Hitbox_Draygon_1B 

ExtendedSpritemap_Draygon_5E:
    dw $0002,$FFF2,$002D 
    dw Spritemap_Draygon_4B 
    dw Hitbox_Draygon_1B 
    dw $FFCE,$0021 
    dw Spritemap_Draygon_3F 
    dw Hitbox_Draygon_1B 

ExtendedSpritemap_Draygon_5F:
    dw $0002,$FFEF,$0028 
    dw Spritemap_Draygon_4A 
    dw Hitbox_Draygon_1B 
    dw $FFCE,$0021 
    dw Spritemap_Draygon_40 
    dw Hitbox_Draygon_1B 

ExtendedSpritemap_Draygon_60:
    dw $0003,$FFF5,$003C 
    dw Spritemap_Draygon_4E 
    dw Hitbox_Draygon_2E 
    dw $FFE7,$0032 
    dw Spritemap_Draygon_5A 
    dw Hitbox_Draygon_1B 
    dw $FFCE,$0021 
    dw Spritemap_Draygon_34 
    dw Hitbox_Draygon_1B 

ExtendedSpritemap_Draygon_61:
    dw $0004,$FFF8,$0043 
    dw Spritemap_Draygon_4E 
    dw Hitbox_Draygon_2E 
    dw $FFEC,$0036 
    dw Spritemap_Draygon_5A 
    dw Hitbox_Draygon_1B 
    dw $FFE8,$0031 
    dw Spritemap_Draygon_5A 
    dw Hitbox_Draygon_1B 
    dw $FFCE,$0021 
    dw Spritemap_Draygon_34 
    dw Hitbox_Draygon_1B 

ExtendedSpritemap_Draygon_62:
    dw $0005,$FFF7,$004D 
    dw Spritemap_Draygon_4F 
    dw Hitbox_Draygon_2E 
    dw $FFF1,$003D 
    dw Spritemap_Draygon_5A 
    dw Hitbox_Draygon_1B 
    dw $FFED,$0036 
    dw Spritemap_Draygon_5A 
    dw Hitbox_Draygon_1B 
    dw $FFE7,$0031 
    dw Spritemap_Draygon_59 
    dw Hitbox_Draygon_1B 
    dw $FFCE,$0021 
    dw Spritemap_Draygon_35 
    dw Hitbox_Draygon_1B 

ExtendedSpritemap_Draygon_63:
    dw $0006,$0008,$004D 
    dw Spritemap_Draygon_4E 
    dw Hitbox_Draygon_2E 
    dw $FFF9,$0042 
    dw Spritemap_Draygon_5A 
    dw Hitbox_Draygon_1B 
    dw $FFF4,$003C 
    dw Spritemap_Draygon_5A 
    dw Hitbox_Draygon_1B 
    dw $FFED,$0037 
    dw Spritemap_Draygon_59 
    dw Hitbox_Draygon_1B 
    dw $FFE6,$0032 
    dw Spritemap_Draygon_59 
    dw Hitbox_Draygon_1B 
    dw $FFCE,$0021 
    dw Spritemap_Draygon_35 
    dw Hitbox_Draygon_1B 

ExtendedSpritemap_Draygon_64:
    dw $0007,$0014,$0037 
    dw Spritemap_Draygon_4B 
    dw Hitbox_Draygon_2E 
    dw $0004,$003D 
    dw Spritemap_Draygon_5A 
    dw Hitbox_Draygon_1B 
    dw $FFFB,$003F 
    dw Spritemap_Draygon_5A 
    dw Hitbox_Draygon_1B 
    dw $FFF3,$003E 
    dw Spritemap_Draygon_59 
    dw Hitbox_Draygon_1B 
    dw $FFEB,$003A 
    dw Spritemap_Draygon_59 
    dw Hitbox_Draygon_1B 
    dw $FFE5,$0034 
    dw Spritemap_Draygon_58 
    dw Hitbox_Draygon_1B 
    dw $FFCE,$0021 
    dw Spritemap_Draygon_3F 
    dw Hitbox_Draygon_1B 

ExtendedSpritemap_Draygon_65:
    dw $0008,$0013,$002E 
    dw Spritemap_Draygon_4A 
    dw Hitbox_Draygon_2E 
    dw $0007,$003A 
    dw Spritemap_Draygon_5A 
    dw Hitbox_Draygon_1B 
    dw $0000,$0040 
    dw Spritemap_Draygon_5A 
    dw Hitbox_Draygon_1B 
    dw $FFF8,$0041 
    dw Spritemap_Draygon_59 
    dw Hitbox_Draygon_1B 
    dw $FFEF,$0043 
    dw Spritemap_Draygon_59 
    dw Hitbox_Draygon_1B 
    dw $FFE7,$003F 
    dw Spritemap_Draygon_58 
    dw Hitbox_Draygon_1B 
    dw $FFE3,$0035 
    dw Spritemap_Draygon_58 
    dw Hitbox_Draygon_1B 
    dw $FFCE,$0021 
    dw Spritemap_Draygon_3F 
    dw Hitbox_Draygon_1B 

ExtendedSpritemap_Draygon_66:
    dw $0008,$0009,$0025 
    dw Spritemap_Draygon_48 
    dw Hitbox_Draygon_2E 
    dw $0008,$0038 
    dw Spritemap_Draygon_5A 
    dw Hitbox_Draygon_1B 
    dw $0003,$0041 
    dw Spritemap_Draygon_5A 
    dw Hitbox_Draygon_1B 
    dw $FFFA,$0043 
    dw Spritemap_Draygon_59 
    dw Hitbox_Draygon_1B 
    dw $FFF0,$0044 
    dw Spritemap_Draygon_59 
    dw Hitbox_Draygon_1B 
    dw $FFE8,$0041 
    dw Spritemap_Draygon_58 
    dw Hitbox_Draygon_1B 
    dw $FFE2,$0037 
    dw Spritemap_Draygon_58 
    dw Hitbox_Draygon_1B 
    dw $FFCE,$0021 
    dw Spritemap_Draygon_40 
    dw Hitbox_Draygon_1B 

Hitbox_Draygon_0:
    dw $0001,$0000,$0000,$0017,$001F 
    dw EnemyTouch_Draygon 
    dw CommonA5_NormalEnemyShotAI 

Hitbox_Draygon_1:
    dw $0001,$0000,$0000,$0015,$001F 
    dw EnemyTouch_Draygon 
    dw CommonA5_NormalEnemyShotAI 

Hitbox_Draygon_2:
    dw $0001,$0000,$0000,$000C,$0021 
    dw EnemyTouch_Draygon 
    dw CommonA5_NormalEnemyShotAI 

Hitbox_Draygon_3:
    dw $0001,$FFF9,$FFF8,$0006,$0006 
    dw EnemyTouch_Draygon 
    dw CommonA5_NormalEnemyShotAI 

Hitbox_Draygon_4:
    dw $0001,$FFF7,$FFF6,$0009,$0008 
    dw EnemyTouch_Draygon 
    dw CommonA5_NormalEnemyShotAI 

Hitbox_Draygon_5:
    dw $0001,$FFF9,$FFF8,$0007,$0007 
    dw EnemyTouch_Draygon 
    dw CommonA5_NormalEnemyShotAI 

Hitbox_Draygon_6:
    dw $0001,$FFF8,$FFF8,$0006,$0006 
    dw EnemyTouch_Draygon 
    dw CommonA5_NormalEnemyShotAI 

Hitbox_Draygon_7:
    dw $0001,$FFF7,$FFF7,$0004,$0007 
    dw RTL_A5804C 
    dw RTL_A5804C 

Hitbox_Draygon_8:
    dw $0000 

Hitbox_Draygon_9:
    dw $0000 

Hitbox_Draygon_A:
    dw $0001,$FFFB,$FFFB,$0004,$0004 
    dw EnemyTouch_Draygon 
    dw CommonA5_NormalEnemyShotAI 

Hitbox_Draygon_B:
    dw $0001,$FFFB,$FFFB,$0003,$0005 
    dw EnemyTouch_Draygon 
    dw CommonA5_NormalEnemyShotAI 

Hitbox_Draygon_C:
    dw $0001,$FFFB,$FFFB,$0004,$0004 
    dw EnemyTouch_Draygon 
    dw CommonA5_NormalEnemyShotAI 

Hitbox_Draygon_D:
    dw $0001,$FFF9,$FFF9,$0007,$0006 
    dw EnemyTouch_Draygon 
    dw CommonA5_NormalEnemyShotAI 

Hitbox_Draygon_E:
    dw $0001,$FFFB,$FFFB,$0004,$0004 
    dw EnemyTouch_Draygon 
    dw CommonA5_NormalEnemyShotAI 

Hitbox_Draygon_F:
    dw $0001,$FFFB,$FFFC,$0004,$0004 
    dw EnemyTouch_Draygon 
    dw CommonA5_NormalEnemyShotAI 

Hitbox_Draygon_10:
    dw $0001,$FFFB,$FFFB,$0004,$0004 
    dw EnemyTouch_Draygon 
    dw CommonA5_NormalEnemyShotAI 

Hitbox_Draygon_11:
    dw $0000 

Hitbox_Draygon_12:
    dw $0001,$FFE2,$FFE6,$FFF2,$FFF5 
    dw EnemyTouch_Draygon 
    dw CommonA5_NormalEnemyShotAI 

Hitbox_Draygon_13:
    dw $0001,$FFE1,$FFE6,$FFF2,$FFF6 
    dw EnemyTouch_Draygon 
    dw CommonA5_NormalEnemyShotAI 

Hitbox_Draygon_14:
    dw $0001,$FFE1,$FFE6,$FFF2,$FFF6 
    dw EnemyTouch_Draygon 
    dw CommonA5_NormalEnemyShotAI 

Hitbox_Draygon_15:
    dw $0001,$FFE1,$FFE6,$FFF2,$FFF7 
    dw EnemyTouch_Draygon 
    dw CommonA5_NormalEnemyShotAI 

Hitbox_Draygon_16:
    dw $0001,$FFF3,$0000,$000A,$0017 
    dw EnemyTouch_Draygon 
    dw CommonA5_NormalEnemyShotAI 

Hitbox_Draygon_17:
    dw $0001,$FFF3,$0000,$000A,$0017 
    dw EnemyTouch_Draygon 
    dw CommonA5_NormalEnemyShotAI 

Hitbox_Draygon_18:
    dw $0001,$FFF3,$0000,$000A,$0017 
    dw EnemyTouch_Draygon 
    dw CommonA5_NormalEnemyShotAI 

Hitbox_Draygon_19:
    dw $0001,$FFF3,$0000,$000A,$0017 
    dw EnemyTouch_Draygon 
    dw CommonA5_NormalEnemyShotAI 

Hitbox_Draygon_1A:
    dw $0004,$FFEF,$FFF0,$0012,$001E 
    dw RTL_A5804C 
    dw EnemyShot_Draygon 
    dw $FFC5,$FFBE,$0003,$FFE2 
    dw EnemyTouch_Draygon 
    dw CommonA5_CreateADudShot 
    dw $0010,$0001,$003C,$0035 
    dw EnemyTouch_Draygon 
    dw CommonA5_CreateADudShot 
    dw $FFE4,$FFDB,$003D,$FFF6 
    dw EnemyTouch_Draygon 
    dw CommonA5_CreateADudShot 

Hitbox_Draygon_1B:
    dw $0000 

Hitbox_Draygon_1C:
    dw $0001,$FFF9,$FFF8,$0006,$0006 
    dw EnemyTouch_Draygon 
    dw CommonA5_NormalEnemyShotAI 

Hitbox_Draygon_1D:
    dw $0001,$FFF7,$FFF6,$0009,$0008 
    dw EnemyTouch_Draygon 
    dw CommonA5_NormalEnemyShotAI 

Hitbox_Draygon_1E:
    dw $0001,$FFF9,$FFF8,$0007,$0007 
    dw EnemyTouch_Draygon 
    dw CommonA5_NormalEnemyShotAI 

Hitbox_Draygon_1F:
    dw $0001,$FFF8,$FFF8,$0006,$0006 
    dw EnemyTouch_Draygon 
    dw CommonA5_NormalEnemyShotAI 

Hitbox_Draygon_20:
    dw $0001,$FFFB,$FFF7,$0007,$0007 
    dw RTL_A5804C 
    dw RTL_A5804C 

Hitbox_Draygon_21:
    dw $0001,$FFFB,$FFFB,$0004,$0004 
    dw EnemyTouch_Draygon 
    dw CommonA5_NormalEnemyShotAI 

Hitbox_Draygon_22:
    dw $0001,$FFFB,$FFFB,$0003,$0005 
    dw EnemyTouch_Draygon 
    dw CommonA5_NormalEnemyShotAI 

Hitbox_Draygon_23:
    dw $0001,$FFFB,$FFFB,$0004,$0004 
    dw EnemyTouch_Draygon 
    dw CommonA5_NormalEnemyShotAI 

Hitbox_Draygon_24:
    dw $0001,$FFF9,$FFF9,$0007,$0006 
    dw EnemyTouch_Draygon 
    dw CommonA5_NormalEnemyShotAI 

Hitbox_Draygon_25:
    dw $0001,$FFFB,$FFFB,$0004,$0004 
    dw EnemyTouch_Draygon 
    dw CommonA5_NormalEnemyShotAI 

Hitbox_Draygon_26:
    dw $0001,$FFFB,$FFFC,$0004,$0004 
    dw EnemyTouch_Draygon 
    dw CommonA5_NormalEnemyShotAI 

Hitbox_Draygon_27:
    dw $0001,$FFFB,$FFFB,$0004,$0004 
    dw EnemyTouch_Draygon 
    dw CommonA5_NormalEnemyShotAI 

Hitbox_Draygon_28:
    dw $0000 

Hitbox_Draygon_29:
    dw $0001,$FFFA,$0000,$0010,$0017 
    dw EnemyTouch_Draygon 
    dw CommonA5_NormalEnemyShotAI 

Hitbox_Draygon_2A:
    dw $0001,$FFFA,$0000,$0010,$0017 
    dw EnemyTouch_Draygon 
    dw CommonA5_NormalEnemyShotAI 

Hitbox_Draygon_2B:
    dw $0001,$FFFA,$0000,$0010,$0017 
    dw EnemyTouch_Draygon 
    dw CommonA5_NormalEnemyShotAI 

Hitbox_Draygon_2C:
    dw $0001,$FFFA,$0000,$0010,$0017 
    dw EnemyTouch_Draygon 
    dw CommonA5_NormalEnemyShotAI 

Hitbox_Draygon_2D:
    dw $0004,$FFEE,$FFF9,$0012,$001E 
    dw RTL_A5804C 
    dw EnemyShot_Draygon 
    dw $FFF6,$FFC1,$003E,$FFE6 
    dw EnemyTouch_Draygon 
    dw CommonA5_CreateADudShot 
    dw $FFC9,$0000,$FFEB,$0039 
    dw EnemyTouch_Draygon 
    dw CommonA5_CreateADudShot 
    dw $FFC2,$FFDF,$000F,$FFFB 
    dw EnemyTouch_Draygon 
    dw CommonA5_CreateADudShot 

Hitbox_Draygon_2E:
    dw $0000 

Spritemap_Draygon_0:
    dw $0004,$8008 
    db $10 
    dw $0721,$8008 
    db $00 
    dw $0701,$8000 
    db $10 
    dw $0720,$8000 
    db $00 
    dw $0700 

Spritemap_Draygon_1:
    dw $0004,$0000 
    db $10 
    dw $2723,$8000 
    db $00 
    dw $2703,$8008 
    db $10 
    dw $2724,$8008 
    db $00 
    dw $2704 

Spritemap_Draygon_2:
    dw $0002,$8000 
    db $10 
    dw $2726,$8000 
    db $00 
    dw $2706 

Spritemap_Draygon_3:
    dw $0018,$81E5 
    db $02 
    dw $271C,$81DD 
    db $0A 
    dw $272B,$81ED 
    db $FA 
    dw $270D,$01F4 
    db $EC 
    dw $2750,$81FC 
    db $E4 
    dw $2741,$81F4 
    db $F4 
    dw $2760,$81ED 
    db $0A 
    dw $271C,$81E5 
    db $12 
    dw $272B,$81F5 
    db $02 
    dw $270D,$01FC 
    db $F4 
    dw $2750,$8004 
    db $EC 
    dw $2741,$81FC 
    db $FC 
    dw $2760,$81F5 
    db $12 
    dw $271C,$81ED 
    db $1A 
    dw $272B,$81FD 
    db $0A 
    dw $270D,$0004 
    db $FC 
    dw $2750,$800C 
    db $F4 
    dw $2741,$8004 
    db $04 
    dw $2760,$81FC 
    db $1B 
    dw $271C,$81F4 
    db $23 
    dw $272B,$8004 
    db $13 
    dw $270D,$000B 
    db $05 
    dw $2750,$8013 
    db $FD 
    dw $2741,$800B 
    db $0D 
    dw $2760 

Spritemap_Draygon_4:
    dw $0014,$81F8 
    db $F9 
    dw $272E,$01E8 
    db $09 
    dw $274C,$81F0 
    db $01 
    dw $273D,$81FC 
    db $F4 
    dw $2762,$81FC 
    db $E4 
    dw $2743,$8000 
    db $01 
    dw $272E,$01F0 
    db $11 
    dw $274C,$81F8 
    db $09 
    dw $273D,$8004 
    db $FC 
    dw $2762,$8004 
    db $EC 
    dw $2743,$8008 
    db $09 
    dw $272E,$01F8 
    db $19 
    dw $274C,$8000 
    db $11 
    dw $273D,$800C 
    db $04 
    dw $2762,$800C 
    db $F4 
    dw $2743,$800F 
    db $12 
    dw $272E,$01FF 
    db $22 
    dw $274C,$8007 
    db $1A 
    dw $273D,$8013 
    db $0D 
    dw $2762,$8013 
    db $FD 
    dw $2743 

Spritemap_Draygon_5:
    dw $0010,$81F9 
    db $F9 
    dw $2738,$8001 
    db $F1 
    dw $2729,$8004 
    db $EC 
    dw $2756,$81FC 
    db $E4 
    dw $2745,$8000 
    db $00 
    dw $2738,$8008 
    db $F8 
    dw $2729,$800B 
    db $F3 
    dw $2756,$8003 
    db $EB 
    dw $2745,$8007 
    db $07 
    dw $2738,$800F 
    db $FF 
    dw $2729,$8012 
    db $FA 
    dw $2756,$800A 
    db $F2 
    dw $2745,$800E 
    db $0E 
    dw $2738,$8016 
    db $06 
    dw $2729,$8019 
    db $01 
    dw $2756,$8011 
    db $F9 
    dw $2745 

Spritemap_Draygon_6:
    dw $0010,$8000 
    db $F4 
    dw $2768,$8000 
    db $EC 
    dw $2758,$8004 
    db $E4 
    dw $2709,$81FC 
    db $E4 
    dw $2708,$8007 
    db $FC 
    dw $2768,$8007 
    db $F4 
    dw $2758,$800B 
    db $EC 
    dw $2709,$8003 
    db $EC 
    dw $2708,$800E 
    db $03 
    dw $2768,$800E 
    db $FB 
    dw $2758,$8012 
    db $F3 
    dw $2709,$800A 
    db $F3 
    dw $2708,$8015 
    db $0A 
    dw $2768,$8015 
    db $02 
    dw $2758,$8019 
    db $FA 
    dw $2709,$8011 
    db $FA 
    dw $2708 

Spritemap_Draygon_7:
    dw $000A,$81FC 
    db $F0 
    dw $0721,$81FC 
    db $E0 
    dw $0701,$81F4 
    db $F0 
    dw $0720,$81F4 
    db $E0 
    dw $0700,$01F4 
    db $04 
    dw $2723,$81F4 
    db $F4 
    dw $2703,$81FC 
    db $04 
    dw $2724,$81FC 
    db $F4 
    dw $2704,$81F4 
    db $14 
    dw $2726,$81F4 
    db $04 
    dw $2706 

Spritemap_Draygon_8:
    dw $000A,$81FB 
    db $F0 
    dw $0721,$81FB 
    db $E0 
    dw $0701,$81F3 
    db $F0 
    dw $0720,$81F3 
    db $E0 
    dw $0700,$01F3 
    db $04 
    dw $2723,$81F3 
    db $F4 
    dw $2703,$81FB 
    db $04 
    dw $2724,$81FB 
    db $F4 
    dw $2704,$81F3 
    db $14 
    dw $2726,$81F3 
    db $04 
    dw $2706 

Spritemap_Draygon_9:
    dw $000A,$81FB 
    db $F0 
    dw $0721,$81FB 
    db $E0 
    dw $0701,$81F3 
    db $F0 
    dw $0720,$81F3 
    db $E0 
    dw $0700,$01F2 
    db $04 
    dw $2723,$81F2 
    db $F4 
    dw $2703,$81FA 
    db $04 
    dw $2724,$81FA 
    db $F4 
    dw $2704,$81F2 
    db $14 
    dw $2726,$81F2 
    db $04 
    dw $2706 

Spritemap_Draygon_A:
    dw $000A,$81FB 
    db $F0 
    dw $0721,$81FB 
    db $E0 
    dw $0701,$81F3 
    db $F0 
    dw $0720,$81F3 
    db $E0 
    dw $0700,$01F2 
    db $04 
    dw $2723,$81F2 
    db $F4 
    dw $2703,$81FA 
    db $04 
    dw $2724,$81FA 
    db $F4 
    dw $2704,$81F1 
    db $14 
    dw $2726,$81F1 
    db $04 
    dw $2706 

Spritemap_Draygon_B:
    dw $0013,$81E5 
    db $02 
    dw $271C,$81DD 
    db $0A 
    dw $272B,$81ED 
    db $FA 
    dw $270D,$01F4 
    db $EC 
    dw $2750,$81FC 
    db $E4 
    dw $2741,$81F4 
    db $F4 
    dw $2760,$8000 
    db $01 
    dw $272E,$01F0 
    db $11 
    dw $274C,$81F8 
    db $09 
    dw $273D,$8004 
    db $FC 
    dw $2762,$8004 
    db $EC 
    dw $2743,$8009 
    db $09 
    dw $2738,$8011 
    db $01 
    dw $2729,$8014 
    db $FC 
    dw $2756,$800C 
    db $F4 
    dw $2745,$8018 
    db $0C 
    dw $2768,$8018 
    db $04 
    dw $2758,$801C 
    db $FC 
    dw $2709,$8014 
    db $FC 
    dw $2708 

Spritemap_Draygon_C:
    dw $0011,$81F8 
    db $F9 
    dw $272E,$01E8 
    db $09 
    dw $274C,$81F0 
    db $01 
    dw $273D,$81FC 
    db $F4 
    dw $2762,$81FC 
    db $E4 
    dw $2743,$8001 
    db $01 
    dw $2738,$8009 
    db $F9 
    dw $2729,$800C 
    db $F4 
    dw $2756,$8004 
    db $EC 
    dw $2745,$8010 
    db $04 
    dw $2768,$8010 
    db $FC 
    dw $2758,$8014 
    db $F4 
    dw $2709,$800C 
    db $F4 
    dw $2708,$8011 
    db $11 
    dw $2738,$8019 
    db $09 
    dw $2729,$801C 
    db $04 
    dw $2756,$8014 
    db $FC 
    dw $2745 

Spritemap_Draygon_D:
    dw $0011,$81F9 
    db $F9 
    dw $2738,$8001 
    db $F1 
    dw $2729,$8004 
    db $EC 
    dw $2756,$81FC 
    db $E4 
    dw $2745,$8008 
    db $FC 
    dw $2768,$8008 
    db $F4 
    dw $2758,$800C 
    db $EC 
    dw $2709,$8004 
    db $EC 
    dw $2708,$8009 
    db $09 
    dw $2738,$8011 
    db $01 
    dw $2729,$8014 
    db $FC 
    dw $2756,$800C 
    db $F4 
    dw $2745,$8010 
    db $11 
    dw $272E,$0000 
    db $21 
    dw $274C,$8008 
    db $19 
    dw $273D,$8014 
    db $0C 
    dw $2762,$8014 
    db $FC 
    dw $2743 

Spritemap_Draygon_E:
    dw $0013,$8000 
    db $F4 
    dw $2768,$8000 
    db $EC 
    dw $2758,$8004 
    db $E4 
    dw $2709,$81FC 
    db $E4 
    dw $2708,$8001 
    db $01 
    dw $2738,$8009 
    db $F9 
    dw $2729,$800C 
    db $F4 
    dw $2756,$8004 
    db $EC 
    dw $2745,$8008 
    db $09 
    dw $272E,$01F8 
    db $19 
    dw $274C,$8000 
    db $11 
    dw $273D,$800C 
    db $04 
    dw $2762,$800C 
    db $F4 
    dw $2743,$81FD 
    db $1A 
    dw $271C,$81F5 
    db $22 
    dw $272B,$8005 
    db $12 
    dw $270D,$000C 
    db $04 
    dw $2750,$8014 
    db $FC 
    dw $2741,$800C 
    db $0C 
    dw $2760 

Spritemap_Draygon_F:
    dw $0014,$81F9 
    db $F9 
    dw $2738,$8001 
    db $F1 
    dw $2729,$8004 
    db $EC 
    dw $2756,$81FC 
    db $E4 
    dw $2745,$8000 
    db $01 
    dw $272E,$01F0 
    db $11 
    dw $274C,$81F8 
    db $09 
    dw $273D,$8004 
    db $FC 
    dw $2762,$8004 
    db $EC 
    dw $2743,$81F5 
    db $12 
    dw $271C,$81ED 
    db $1A 
    dw $272B,$81FD 
    db $0A 
    dw $270D,$0004 
    db $FC 
    dw $2750,$800C 
    db $F4 
    dw $2741,$8004 
    db $04 
    dw $2760,$8010 
    db $11 
    dw $272E,$0000 
    db $21 
    dw $274C,$8008 
    db $19 
    dw $273D,$8014 
    db $0C 
    dw $2762,$8014 
    db $FC 
    dw $2743 

Spritemap_Draygon_10:
    dw $0014,$81F8 
    db $F9 
    dw $272E,$01E8 
    db $09 
    dw $274C,$81F0 
    db $01 
    dw $273D,$81FC 
    db $F4 
    dw $2762,$81FC 
    db $E4 
    dw $2743,$81ED 
    db $0A 
    dw $271C,$81E5 
    db $12 
    dw $272B,$81F5 
    db $02 
    dw $270D,$01FC 
    db $F4 
    dw $2750,$8004 
    db $EC 
    dw $2741,$81FC 
    db $FC 
    dw $2760,$8008 
    db $09 
    dw $272E,$01F8 
    db $19 
    dw $274C,$8000 
    db $11 
    dw $273D,$800C 
    db $04 
    dw $2762,$800C 
    db $F4 
    dw $2743,$8011 
    db $11 
    dw $2738,$8019 
    db $09 
    dw $2729,$801C 
    db $04 
    dw $2756,$8014 
    db $FC 
    dw $2745 

Spritemap_Draygon_11:
    dw $0013,$81BB 
    db $E5 
    dw $271C,$81B3 
    db $ED 
    dw $272B,$81C3 
    db $DD 
    dw $270D,$01CA 
    db $CF 
    dw $2750,$81D2 
    db $C7 
    dw $2741,$81CA 
    db $D7 
    dw $2760,$800E 
    db $05 
    dw $2768,$800E 
    db $FD 
    dw $2758,$8012 
    db $F5 
    dw $2709,$800A 
    db $F5 
    dw $2708,$81F7 
    db $F0 
    dw $2738,$81FF 
    db $E8 
    dw $2729,$8002 
    db $E3 
    dw $2756,$81FA 
    db $DB 
    dw $2745,$81D8 
    db $ED 
    dw $272E,$01C8 
    db $FD 
    dw $274C,$81D0 
    db $F5 
    dw $273D,$81DC 
    db $E8 
    dw $2762,$81DC 
    db $D8 
    dw $2743 

ExtendedTilemap_Draygon_0:
    dw $FFFE,$2316,$0002,$159F,$15A0,$2356,$0002,$15AC 
    dw $15AD,$2394,$0003,$15B9,$15BA,$15BB,$23D4,$0003 
    dw $15C8,$15C9,$15CA,$2414,$0003,$15D7,$15D8,$15D9 
    dw $2454,$0003,$15DF,$15E0,$1547,$2496,$0002,$1547 
    dw $1547,$FFFF 

ExtendedTilemap_Draygon_1:
    dw $FFFE,$2316,$0002,$1559,$155A,$2356,$0002,$1569 
    dw $156A,$2394,$0003,$1576,$1577,$1578,$23D2,$0004 
    dw $1585,$1586,$1587,$1588,$2412,$0004,$1592,$1593 
    dw $1594,$1595,$2452,$0004,$15A1,$15A2,$15A3,$0147 
    dw $2496,$0002,$0147,$0147,$FFFF 

ExtendedTilemap_Draygon_2:
    dw $FFFE,$2316,$0002,$1596,$1597,$2356,$0002,$15A4 
    dw $15A5,$2390,$0005,$15AE,$15AF,$15B0,$15B1,$15B2 
    dw $23CE,$0006,$15BC,$15BD,$15BE,$15BF,$15C0,$15C1 
    dw $240E,$0006,$15CB,$15CC,$15CD,$15CE,$15CF,$15D0 
    dw $2452,$0003,$0147,$0147,$0147,$FFFF 

ExtendedTilemap_Draygon_3:
    dw $FFFE,$230A,$0003,$15DA,$15DB,$1547,$2316,$0002 
    dw $15DC,$15DD,$234C,$0003,$15E1,$15E2,$15E3,$2354 
    dw $0003,$15AE,$15E4,$15E5,$238C,$0007,$15E9,$15EA 
    dw $15EB,$15EC,$15ED,$15EE,$15EF,$23CC,$0007,$15F3 
    dw $15F4,$15F5,$15F6,$15F7,$15F8,$15F9,$240E,$0005 
    dw $1600,$1601,$1602,$1603,$1604,$FFFF 

ExtendedTilemap_Draygon_4:
    dw $FFFE,$230A,$0003,$0147,$0147,$0147,$2316,$0002 
    dw $1596,$1597,$234C,$0003,$0147,$0147,$0147,$2354 
    dw $0003,$0147,$15A4,$15A5,$238C,$0007,$0147,$0147 
    dw $15AE,$15AF,$15B0,$15B1,$15B2,$23CC,$0007,$0147 
    dw $15BC,$15BD,$15BE,$15BF,$15C0,$15C1,$240E,$0005 
    dw $15CB,$15CC,$15CD,$15CE,$15CF,$FFFF 

ExtendedTilemap_Draygon_5:
    dw $FFFE,$2316,$0002,$1559,$155A,$2356,$0002,$1569 
    dw $156A,$2390,$0005,$0147,$0147,$1576,$1577,$1578 
    dw $23CE,$0006,$0147,$0147,$1585,$1586,$1587,$1588 
    dw $240E,$0006,$0147,$0147,$1592,$1593,$1594,$1595 
    dw $2452,$0003,$15A1,$15A2,$15A3,$FFFF 

ExtendedTilemap_Draygon_6:
    dw $FFFE,$2316,$0002,$159F,$15A0,$2356,$0002,$15AC 
    dw $15AD,$2394,$0003,$15B9,$15BA,$15BB,$23D2,$0004 
    dw $0147,$15C8,$15C9,$15CA,$2412,$0004,$0147,$15D7 
    dw $15D8,$15D9,$2452,$0004,$0147,$15DF,$15E0,$1547 
    dw $2496,$0002,$1547,$1547,$FFFF 

ExtendedTilemap_Draygon_7:
    dw $FFFE,$2148,$0002,$1554,$1555,$2188,$0002,$1564 
    dw $1565,$FFFF 

ExtendedTilemap_Draygon_8:
    dw $FFFE,$2148,$0002,$1580,$1581,$2188,$0002,$1590 
    dw $1591,$FFFF 

ExtendedTilemap_Draygon_9:
    dw $FFFE,$2148,$0002,$1582,$1583,$2188,$0002,$1592 
    dw $1593,$FFFF 

ExtendedTilemap_Draygon_A:
    dw $FFFE,$2148,$0002,$1562,$1563,$2188,$0002,$1572 
    dw $1573,$FFFF 

ExtendedTilemap_Draygon_B:
    dw $FFFE,$220C,$0003,$1586,$159E,$159F,$224C,$0003 
    dw $1596,$1597,$1598,$228C,$0003,$15A6,$15A7,$15A8 
    dw $FFFF 

ExtendedTilemap_Draygon_C:
    dw $FFFE,$220C,$0001,$159D,$224C,$0003,$15AD,$15AE 
    dw $15AF,$228C,$0003,$15BD,$15BE,$15BF,$FFFF 

ExtendedTilemap_Draygon_D:
    dw $FFFE,$220C,$0003,$15A0,$15A1,$15A2,$224C,$0003 
    dw $15B0,$15B1,$15B2,$228C,$0003,$15B4,$15B5,$15B6 
    dw $FFFF 

ExtendedTilemap_Draygon_E:
    dw $FFFE,$220C,$0003,$15A3,$1584,$1585,$224C,$0003 
    dw $15B3,$1594,$1595,$228C,$0003,$1574,$15A4,$15A5 
    dw $FFFF 

ExtendedTilemap_Draygon_F:
    dw $FFFE,$20C8,$0002,$1540,$1541,$2108,$0002,$1550 
    dw $1551,$FFFF 

ExtendedTilemap_Draygon_10:
    dw $FFFE,$20C8,$0002,$1560,$1561,$2108,$0002,$1570 
    dw $1571,$FFFF 

ExtendedTilemap_Draygon_11:
    dw $FFFE,$20C8,$0002,$150A,$150B,$2108,$0002,$151A 
    dw $151B,$FFFF 

ExtendedTilemap_Draygon_12:
    dw $FFFE,$20C8,$0002,$150C,$150D,$2108,$0002,$151C 
    dw $151D,$FFFF 

ExtendedTilemap_Draygon_13:
    dw $FFFE,$20C8,$0002,$1534,$1535,$2108,$0002,$1544 
    dw $1545,$FFFF 

ExtendedTilemap_Draygon_14:
    dw $FFFE,$20C8,$0002,$150E,$150F,$2108,$0002,$151E 
    dw $151F,$FFFF 

ExtendedTilemap_Draygon_15:
    dw $FFFE,$20C8,$0002,$152C,$152D,$2108,$0002,$153C 
    dw $153D,$FFFF 

ExtendedTilemap_Draygon_16:
    dw $FFFE,$20C8,$0002,$152E,$152F,$2108,$0002,$153E 
    dw $153F,$FFFF 

ExtendedTilemap_Draygon_17:
    dw $FFFE,$2000,$0010,$1500,$1501,$1502,$1503,$1504 
    dw $1505,$1506,$1507,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$2040,$0010,$1510,$1511,$1512 
    dw $1513,$1514,$1515,$1516,$1517,$1518,$0338,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$2080,$0010,$1520 
    dw $1521,$1522,$1523,$1524,$1525,$1526,$1527,$1528 
    dw $1529,$0338,$0338,$0338,$0338,$0338,$0338,$20C0 
    dw $0010,$1530,$1531,$1532,$1533,$02FF,$02FF,$1536 
    dw $1537,$1538,$1539,$153A,$0338,$0338,$0338,$0338 
    dw $0338,$2100,$0010,$0338,$0338,$1542,$1543,$02FF 
    dw $02FF,$1546,$1547,$1548,$1549,$154A,$154B,$154C 
    dw $154D,$154E,$1738,$2140,$0010,$0338,$0338,$0338 
    dw $1553,$1554,$1555,$1556,$1557,$1558,$1559,$155A 
    dw $155B,$155C,$155D,$155E,$155F,$2180,$0010,$0338 
    dw $0338,$0338,$0338,$1564,$1565,$1566,$1567,$1568 
    dw $1569,$156A,$156B,$156C,$156D,$156E,$156F,$21C0 
    dw $0010,$0338,$0338,$0338,$0338,$0338,$1575,$1576 
    dw $1577,$1578,$1579,$157A,$157B,$157C,$157D,$157E 
    dw $157F,$2200,$0010,$0338,$0338,$0338,$0338,$0338 
    dw $0338,$1586,$159E,$159F,$1589,$158A,$158B,$158C 
    dw $158D,$158E,$158F,$2240,$0010,$0338,$0338,$0338 
    dw $0338,$0338,$0338,$1596,$1597,$1598,$1599,$159A 
    dw $159B,$159C,$0338,$0338,$0338,$2280,$0010,$0338 
    dw $0338,$0338,$0338,$0338,$0338,$15A6,$15A7,$15A8 
    dw $15A9,$15AA,$15AB,$15AC,$0338,$0338,$0338,$22C0 
    dw $0010,$0338,$0338,$0338,$0338,$0338,$0338,$0338 
    dw $15B7,$15B8,$15B9,$15BA,$15BB,$15BC,$0338,$0338 
    dw $0338,$2300,$0010,$8338,$8338,$8338,$8338,$8338 
    dw $8338,$8338,$8338,$8338,$8338,$8338,$1508,$1509 
    dw $8338,$8338,$8338,$2340,$0010,$8338,$8338,$8338 
    dw $8338,$8338,$8338,$8338,$8338,$8338,$8338,$8338 
    dw $153B,$1519,$8338,$8338,$8338,$2380,$0010,$8338 
    dw $8338,$8338,$8338,$8338,$8338,$8338,$8338,$8338 
    dw $8338,$8338,$152A,$152B,$8338,$8338,$8338,$FFFF 

Spritemap_Draygon_12:
    dw $0003,$01F8 
    db $F8 
    dw $27BD,$01F8 
    db $F0 
    dw $27AD,$81F8 
    db $00 
    dw $27A9 

Spritemap_Draygon_13:
    dw $0003,$01F8 
    db $F8 
    dw $27BC,$01F8 
    db $F0 
    dw $27AC,$81F8 
    db $00 
    dw $27A7 

Spritemap_Draygon_14:
    dw $0004,$01F4 
    db $F4 
    dw $27BB,$01F4 
    db $EC 
    dw $27AB,$01F4 
    db $FC 
    dw $27A4,$81FC 
    db $FC 
    dw $27A5 

Spritemap_Draygon_15:
    dw $0002,$81F0 
    db $F8 
    dw $27A0,$8000 
    db $F8 
    dw $27A2 

Spritemap_Draygon_16:
    dw $0003,$01F8 
    db $00 
    dw $2797,$01F0 
    db $00 
    dw $2796,$8000 
    db $F8 
    dw $27AE 

Spritemap_Draygon_17:
    dw $0003,$01F8 
    db $00 
    dw $27D1,$01F0 
    db $00 
    dw $27D0,$8000 
    db $F8 
    dw $27C2 

Spritemap_Draygon_18:
    dw $0003,$01FC 
    db $04 
    dw $2787,$01F4 
    db $04 
    dw $2786,$81FC 
    db $F4 
    dw $27C4 

Spritemap_Draygon_19:
    dw $0002,$81F8 
    db $00 
    dw $2788,$81F8 
    db $F0 
    dw $27C6 

Spritemap_Draygon_1A:
    dw $0003,$0000 
    db $00 
    dw $E1BD,$0000 
    db $08 
    dw $E1AD,$81F8 
    db $F0 
    dw $21C8 

Spritemap_Draygon_1B:
    dw $0003,$0000 
    db $00 
    dw $E7BC,$0000 
    db $08 
    dw $E7AC,$81F8 
    db $F0 
    dw $E7A7 

Spritemap_Draygon_1C:
    dw $0004,$0004 
    db $04 
    dw $E7BB,$0004 
    db $0C 
    dw $E7AB,$0004 
    db $FC 
    dw $E7A4,$81F4 
    db $F4 
    dw $E7A5 

Spritemap_Draygon_1D:
    dw $0002,$8000 
    db $F8 
    dw $E7A0,$81F0 
    db $F8 
    dw $E7A2 

Spritemap_Draygon_1E:
    dw $0003,$0000 
    db $F8 
    dw $E797,$0008 
    db $F8 
    dw $E796,$81F0 
    db $F8 
    dw $E7AE 

Spritemap_Draygon_1F:
    dw $0003,$0000 
    db $F8 
    dw $E7D1,$0008 
    db $F8 
    dw $E7D0,$81F0 
    db $F8 
    dw $E7C2 

Spritemap_Draygon_20:
    dw $0003,$01FC 
    db $F4 
    dw $E787,$0004 
    db $F4 
    dw $E786,$81F4 
    db $FC 
    dw $E7C4 

Spritemap_Draygon_21:
    dw $0002,$81F8 
    db $F0 
    dw $E788,$81F8 
    db $00 
    dw $E7C6 

Spritemap_Draygon_22:
    dw $0001,$81F8 
    db $F8 
    dw $2784 

Spritemap_Draygon_23:
    dw $0001,$81F8 
    db $F8 
    dw $2782 

Spritemap_Draygon_24:
    dw $0001,$81F8 
    db $F8 
    dw $2780 

Spritemap_Draygon_25:
    dw $0001,$81F8 
    db $F8 
    dw $6784 

Spritemap_Draygon_26:
    dw $0001,$81F8 
    db $F8 
    dw $6782 

Spritemap_Draygon_27:
    dw $0001,$81F8 
    db $F8 
    dw $6780 

Spritemap_Draygon_28:
    dw $0004,$81E8 
    db $10 
    dw $4721,$81E8 
    db $00 
    dw $6701,$81F0 
    db $10 
    dw $6720,$81F0 
    db $00 
    dw $6700 

Spritemap_Draygon_29:
    dw $0004,$01F8 
    db $10 
    dw $6723,$81F0 
    db $00 
    dw $6703,$81E8 
    db $10 
    dw $6724,$81E8 
    db $00 
    dw $6704 

Spritemap_Draygon_2A:
    dw $0002,$81F0 
    db $10 
    dw $6726,$81F0 
    db $00 
    dw $6706 

Spritemap_Draygon_2B:
    dw $0018,$800B 
    db $02 
    dw $671C,$8013 
    db $0A 
    dw $672B,$8003 
    db $FA 
    dw $670D,$0004 
    db $EC 
    dw $6750,$81F4 
    db $E4 
    dw $6741,$81FC 
    db $F4 
    dw $6760,$8003 
    db $0A 
    dw $671C,$800B 
    db $12 
    dw $672B,$81FB 
    db $02 
    dw $670D,$01FC 
    db $F4 
    dw $6750,$81EC 
    db $EC 
    dw $6741,$81F4 
    db $FC 
    dw $6760,$81FB 
    db $12 
    dw $671C,$8003 
    db $1A 
    dw $672B,$81F3 
    db $0A 
    dw $670D,$01F4 
    db $FC 
    dw $6750,$81E4 
    db $F4 
    dw $6741,$81EC 
    db $04 
    dw $6760,$81F4 
    db $1B 
    dw $671C,$81FC 
    db $23 
    dw $672B,$81EC 
    db $13 
    dw $670D,$01ED 
    db $05 
    dw $6750,$81DD 
    db $FD 
    dw $6741,$81E5 
    db $0D 
    dw $6760 

Spritemap_Draygon_2C:
    dw $0014,$81F8 
    db $F9 
    dw $672E,$0010 
    db $09 
    dw $674C,$8000 
    db $01 
    dw $673D,$81F4 
    db $F4 
    dw $6762,$81F4 
    db $E4 
    dw $6743,$81F0 
    db $01 
    dw $672E,$0008 
    db $11 
    dw $674C,$81F8 
    db $09 
    dw $673D,$81EC 
    db $FC 
    dw $6762,$81EC 
    db $EC 
    dw $6743,$81E8 
    db $09 
    dw $672E,$0000 
    db $19 
    dw $674C,$81F0 
    db $11 
    dw $673D,$81E4 
    db $04 
    dw $6762,$81E4 
    db $F4 
    dw $6743,$81E1 
    db $12 
    dw $672E,$01F9 
    db $22 
    dw $674C,$81E9 
    db $1A 
    dw $673D,$81DD 
    db $0D 
    dw $6762,$81DD 
    db $FD 
    dw $6743 

Spritemap_Draygon_2D:
    dw $0010,$81F7 
    db $F9 
    dw $6738,$81EF 
    db $F1 
    dw $6729,$81EC 
    db $EC 
    dw $6756,$81F4 
    db $E4 
    dw $6745,$81F0 
    db $00 
    dw $6738,$81E8 
    db $F8 
    dw $6729,$81E5 
    db $F3 
    dw $6756,$81ED 
    db $EB 
    dw $6745,$81E9 
    db $07 
    dw $6738,$81E1 
    db $FF 
    dw $6729,$81DE 
    db $FA 
    dw $6756,$81E6 
    db $F2 
    dw $6745,$81E2 
    db $0E 
    dw $6738,$81DA 
    db $06 
    dw $6729,$81D7 
    db $01 
    dw $6756,$81DF 
    db $F9 
    dw $6745 

Spritemap_Draygon_2E:
    dw $0010,$81F0 
    db $F4 
    dw $6768,$81F0 
    db $EC 
    dw $6758,$81EC 
    db $E4 
    dw $6709,$81F4 
    db $E4 
    dw $6708,$81E9 
    db $FC 
    dw $6768,$81E9 
    db $F4 
    dw $6758,$81E5 
    db $EC 
    dw $6709,$81ED 
    db $EC 
    dw $6708,$81E2 
    db $03 
    dw $6768,$81E2 
    db $FB 
    dw $6758,$81DE 
    db $F3 
    dw $6709,$81E6 
    db $F3 
    dw $6708,$81DB 
    db $0A 
    dw $6768,$81DB 
    db $02 
    dw $6758,$81D7 
    db $FA 
    dw $6709,$81DF 
    db $FA 
    dw $6708 

Spritemap_Draygon_2F:
    dw $0001,$81F8 
    db $F8 
    dw $2764 

Spritemap_Draygon_30:
    dw $0001,$81F8 
    db $F8 
    dw $276A 

Spritemap_Draygon_31:
    dw $0001,$81F8 
    db $F8 
    dw $275E 

Spritemap_Draygon_32:
    dw $0001,$81F8 
    db $F8 
    dw $275C 

Spritemap_Draygon_33:
    dw $0001,$81F8 
    db $F8 
    dw $274A 

Spritemap_Draygon_34:
    dw $000A,$81F4 
    db $F0 
    dw $4721,$81F4 
    db $E0 
    dw $4701,$81FC 
    db $F0 
    dw $4720,$81FC 
    db $E0 
    dw $4700,$0004 
    db $04 
    dw $6723,$81FC 
    db $F4 
    dw $6703,$81F4 
    db $04 
    dw $6724,$81F4 
    db $F4 
    dw $6704,$81FC 
    db $14 
    dw $6726,$81FC 
    db $04 
    dw $6706 

Spritemap_Draygon_35:
    dw $000A,$81F5 
    db $F0 
    dw $4721,$81F5 
    db $E0 
    dw $4701,$81FD 
    db $F0 
    dw $4720,$81FD 
    db $E0 
    dw $4700,$0005 
    db $04 
    dw $6723,$81FD 
    db $F4 
    dw $6703,$81F5 
    db $04 
    dw $6724,$81F5 
    db $F4 
    dw $6704,$81FD 
    db $14 
    dw $6726,$81FD 
    db $04 
    dw $6706 

Spritemap_Draygon_36:
    dw $0001,$01FC 
    db $FC 
    dw $277E 

Spritemap_Draygon_37:
    dw $0001,$01FC 
    db $FC 
    dw $277D 

Spritemap_Draygon_38:
    dw $0001,$01FC 
    db $FC 
    dw $277C 

Spritemap_Draygon_39:
    dw $0001,$81F8 
    db $F8 
    dw $278A 

Spritemap_Draygon_3A:
    dw $0001,$01FC 
    db $FC 
    dw $277F 

Spritemap_Draygon_3B:
    dw $0001,$01FC 
    db $FC 
    dw $2777 

Spritemap_Draygon_3C:
    dw $0001,$01FC 
    db $FC 
    dw $2776 

Spritemap_Draygon_3D:
    dw $0001,$81F8 
    db $F8 
    dw $278C 

Spritemap_Draygon_3E:
    dw $0001,$81F8 
    db $F8 
    dw $278E 

Spritemap_Draygon_3F:
    dw $000A,$81F5 
    db $F0 
    dw $4721,$81F5 
    db $E0 
    dw $4701,$81FD 
    db $F0 
    dw $4720,$81FD 
    db $E0 
    dw $4700,$0006 
    db $04 
    dw $6723,$81FE 
    db $F4 
    dw $6703,$81F6 
    db $04 
    dw $6724,$81F6 
    db $F4 
    dw $6704,$81FE 
    db $14 
    dw $6726,$81FE 
    db $04 
    dw $6706 

Spritemap_Draygon_40:
    dw $000A,$81F5 
    db $F0 
    dw $4721,$81F5 
    db $E0 
    dw $4701,$81FD 
    db $F0 
    dw $4720,$81FD 
    db $E0 
    dw $4700,$0006 
    db $04 
    dw $6723,$81FE 
    db $F4 
    dw $6703,$81F6 
    db $04 
    dw $6724,$81F6 
    db $F4 
    dw $6704,$81FF 
    db $14 
    dw $6726,$81FF 
    db $04 
    dw $6706 

Spritemap_Draygon_41:
    dw $0013,$800B 
    db $02 
    dw $671C,$8013 
    db $0A 
    dw $672B,$8003 
    db $FA 
    dw $670D,$0004 
    db $EC 
    dw $6750,$81F4 
    db $E4 
    dw $6741,$81FC 
    db $F4 
    dw $6760,$81F0 
    db $01 
    dw $672E,$0008 
    db $11 
    dw $674C,$81F8 
    db $09 
    dw $673D,$81EC 
    db $FC 
    dw $6762,$81EC 
    db $EC 
    dw $6743,$81E7 
    db $09 
    dw $6738,$81DF 
    db $01 
    dw $6729,$81DC 
    db $FC 
    dw $6756,$81E4 
    db $F4 
    dw $6745,$81D8 
    db $0C 
    dw $6768,$81D8 
    db $04 
    dw $6758,$81D4 
    db $FC 
    dw $6709,$81DC 
    db $FC 
    dw $6708 

Spritemap_Draygon_42:
    dw $0011,$81F8 
    db $F9 
    dw $672E,$0010 
    db $09 
    dw $674C,$8000 
    db $01 
    dw $673D,$81F4 
    db $F4 
    dw $6762,$81F4 
    db $E4 
    dw $6743,$81EF 
    db $01 
    dw $6738,$81E7 
    db $F9 
    dw $6729,$81E4 
    db $F4 
    dw $6756,$81EC 
    db $EC 
    dw $6745,$81E0 
    db $04 
    dw $6768,$81E0 
    db $FC 
    dw $6758,$81DC 
    db $F4 
    dw $6709,$81E4 
    db $F4 
    dw $6708,$81DF 
    db $11 
    dw $6738,$81D7 
    db $09 
    dw $6729,$81D4 
    db $04 
    dw $6756,$81DC 
    db $FC 
    dw $6745 

Spritemap_Draygon_43:
    dw $0011,$81F7 
    db $F9 
    dw $6738,$81EF 
    db $F1 
    dw $6729,$81EC 
    db $EC 
    dw $6756,$81F4 
    db $E4 
    dw $6745,$81E8 
    db $FC 
    dw $6768,$81E8 
    db $F4 
    dw $6758,$81E4 
    db $EC 
    dw $6709,$81EC 
    db $EC 
    dw $6708,$81E7 
    db $09 
    dw $6738,$81DF 
    db $01 
    dw $6729,$81DC 
    db $FC 
    dw $6756,$81E4 
    db $F4 
    dw $6745,$81E0 
    db $11 
    dw $672E,$01F8 
    db $21 
    dw $674C,$81E8 
    db $19 
    dw $673D,$81DC 
    db $0C 
    dw $6762,$81DC 
    db $FC 
    dw $6743 

Spritemap_Draygon_44:
    dw $0013,$81F0 
    db $F4 
    dw $6768,$81F0 
    db $EC 
    dw $6758,$81EC 
    db $E4 
    dw $6709,$81F4 
    db $E4 
    dw $6708,$81EF 
    db $01 
    dw $6738,$81E7 
    db $F9 
    dw $6729,$81E4 
    db $F4 
    dw $6756,$81EC 
    db $EC 
    dw $6745,$81E8 
    db $09 
    dw $672E,$0000 
    db $19 
    dw $674C,$81F0 
    db $11 
    dw $673D,$81E4 
    db $04 
    dw $6762,$81E4 
    db $F4 
    dw $6743,$81F3 
    db $1A 
    dw $671C,$81FB 
    db $22 
    dw $672B,$81EB 
    db $12 
    dw $670D,$01EC 
    db $04 
    dw $6750,$81DC 
    db $FC 
    dw $6741,$81E4 
    db $0C 
    dw $6760 

Spritemap_Draygon_45:
    dw $0014,$81F7 
    db $F9 
    dw $6738,$81EF 
    db $F1 
    dw $6729,$81EC 
    db $EC 
    dw $6756,$81F4 
    db $E4 
    dw $6745,$81F0 
    db $01 
    dw $672E,$0008 
    db $11 
    dw $674C,$81F8 
    db $09 
    dw $673D,$81EC 
    db $FC 
    dw $6762,$81EC 
    db $EC 
    dw $6743,$81FB 
    db $12 
    dw $671C,$8003 
    db $1A 
    dw $672B,$81F3 
    db $0A 
    dw $670D,$01F4 
    db $FC 
    dw $6750,$81E4 
    db $F4 
    dw $6741,$81EC 
    db $04 
    dw $6760,$81E0 
    db $11 
    dw $672E,$01F8 
    db $21 
    dw $674C,$81E8 
    db $19 
    dw $673D,$81DC 
    db $0C 
    dw $6762,$81DC 
    db $FC 
    dw $6743 

Spritemap_Draygon_46:
    dw $0014,$81F8 
    db $F9 
    dw $672E,$0010 
    db $09 
    dw $674C,$8000 
    db $01 
    dw $673D,$81F4 
    db $F4 
    dw $6762,$81F4 
    db $E4 
    dw $6743,$8003 
    db $0A 
    dw $671C,$800B 
    db $12 
    dw $672B,$81FB 
    db $02 
    dw $670D,$01FC 
    db $F4 
    dw $6750,$81EC 
    db $EC 
    dw $6741,$81F4 
    db $FC 
    dw $6760,$81E8 
    db $09 
    dw $672E,$0000 
    db $19 
    dw $674C,$81F0 
    db $11 
    dw $673D,$81E4 
    db $04 
    dw $6762,$81E4 
    db $F4 
    dw $6743,$81DF 
    db $11 
    dw $6738,$81D7 
    db $09 
    dw $6729,$81D4 
    db $04 
    dw $6756,$81DC 
    db $FC 
    dw $6745 

Spritemap_Draygon_47:
    dw $0013,$8035 
    db $E5 
    dw $671C,$803D 
    db $ED 
    dw $672B,$802D 
    db $DD 
    dw $670D,$002E 
    db $CF 
    dw $6750,$801E 
    db $C7 
    dw $6741,$8026 
    db $D7 
    dw $6760,$81E2 
    db $05 
    dw $6768,$81E2 
    db $FD 
    dw $6758,$81DE 
    db $F5 
    dw $6709,$81E6 
    db $F5 
    dw $6708,$81F9 
    db $F0 
    dw $6738,$81F1 
    db $E8 
    dw $6729,$81EE 
    db $E3 
    dw $6756,$81F6 
    db $DB 
    dw $6745,$8018 
    db $ED 
    dw $672E,$0030 
    db $FD 
    dw $674C,$8020 
    db $F5 
    dw $673D,$8014 
    db $E8 
    dw $6762,$8014 
    db $D8 
    dw $6743 

ExtendedTilemap_Draygon_18:
    dw $FFFE,$2316,$0002,$159F,$15A0,$2356,$0002,$15AC 
    dw $15AD,$2394,$0003,$15B9,$15BA,$15BB,$23D4,$0003 
    dw $15C8,$15C9,$15CA,$2414,$0003,$15D7,$15D8,$15D9 
    dw $2454,$0003,$15DF,$15E0,$1547,$2496,$0002,$1547 
    dw $1547,$FFFF 

ExtendedTilemap_Draygon_19:
    dw $FFFE,$2316,$0002,$1559,$155A,$2356,$0002,$1569 
    dw $156A,$2394,$0003,$1576,$1577,$1578,$23D2,$0004 
    dw $1585,$1586,$1587,$1588,$2412,$0004,$1592,$1593 
    dw $1594,$1595,$2452,$0004,$15A1,$15A2,$15A3,$0147 
    dw $2496,$0002,$0147,$0147,$FFFF 

ExtendedTilemap_Draygon_1A:
    dw $FFFE,$2316,$0002,$1596,$1597,$2356,$0002,$15A4 
    dw $15A5,$2390,$0005,$15AE,$15AF,$15B0,$15B1,$15B2 
    dw $23CE,$0006,$15BC,$15BD,$15BE,$15BF,$15C0,$15C1 
    dw $240E,$0006,$15CB,$15CC,$15CD,$15CE,$15CF,$15D0 
    dw $2452,$0003,$0147,$0147,$0147,$FFFF 

ExtendedTilemap_Draygon_1B:
    dw $FFFE,$230A,$0003,$15DA,$15DB,$1547,$2316,$0002 
    dw $15DC,$15DD,$234C,$0003,$15E1,$15E2,$15E3,$2354 
    dw $0003,$15AE,$15E4,$15E5,$238C,$0007,$15E9,$15EA 
    dw $15EB,$15EC,$15ED,$15EE,$15EF,$23CC,$0007,$15F3 
    dw $15F4,$15F5,$15F6,$15F7,$15F8,$15F9,$240E,$0005 
    dw $1600,$1601,$1602,$1603,$1604,$FFFF 

ExtendedTilemap_Draygon_1C:
    dw $FFFE,$230A,$0003,$0147,$0147,$0147,$2316,$0002 
    dw $1596,$1597,$234C,$0003,$0147,$0147,$0147,$2354 
    dw $0003,$0147,$15A4,$15A5,$238C,$0007,$0147,$0147 
    dw $15AE,$15AF,$15B0,$15B1,$15B2,$23CC,$0007,$0147 
    dw $15BC,$15BD,$15BE,$15BF,$15C0,$15C1,$240E,$0005 
    dw $15CB,$15CC,$15CD,$15CE,$15CF,$FFFF 

ExtendedTilemap_Draygon_1D:
    dw $FFFE,$2316,$0002,$1559,$155A,$2356,$0002,$1569 
    dw $156A,$2390,$0005,$0147,$0147,$1576,$1577,$1578 
    dw $23CE,$0006,$0147,$0147,$1585,$1586,$1587,$1588 
    dw $240E,$0006,$0147,$0147,$1592,$1593,$1594,$1595 
    dw $2452,$0003,$15A1,$15A2,$15A3,$FFFF 

ExtendedTilemap_Draygon_1E:
    dw $FFFE,$2316,$0002,$159F,$15A0,$2356,$0002,$15AC 
    dw $15AD,$2394,$0003,$15B9,$15BA,$15BB,$23D2,$0004 
    dw $0147,$15C8,$15C9,$15CA,$2412,$0004,$0147,$15D7 
    dw $15D8,$15D9,$2452,$0004,$0147,$15DF,$15E0,$1547 
    dw $2496,$0002,$1547,$1547,$FFFF 

ExtendedTilemap_Draygon_1F:
    dw $FFFE,$2154,$0002,$5555,$5554,$2194,$0002,$5565 
    dw $5564,$FFFF 

ExtendedTilemap_Draygon_20:
    dw $FFFE,$2154,$0002,$5581,$5580,$2194,$0002,$5591 
    dw $5590,$FFFF 

ExtendedTilemap_Draygon_21:
    dw $FFFE,$2154,$0002,$5583,$5582,$2194,$0002,$5593 
    dw $5592,$FFFF 

ExtendedTilemap_Draygon_22:
    dw $FFFE,$2154,$0002,$5563,$5562,$2194,$0002,$5573 
    dw $5572,$FFFF 

ExtendedTilemap_Draygon_23:
    dw $FFFE,$220E,$0003,$559F,$559E,$5586,$224E,$0003 
    dw $5598,$5597,$5596,$228E,$0003,$55A8,$55A7,$55A6 
    dw $FFFF 

ExtendedTilemap_Draygon_24:
    dw $FFFE,$2212,$0001,$559D,$224E,$0003,$55AF,$55AE 
    dw $55AD,$228E,$0003,$55BF,$55BE,$55BD,$FFFF 

ExtendedTilemap_Draygon_25:
    dw $FFFE,$220E,$0003,$55A2,$55A1,$55A0,$224E,$0003 
    dw $55B2,$55B1,$55B0,$228E,$0003,$55B6,$55B5,$55B4 
    dw $FFFF 

ExtendedTilemap_Draygon_26:
    dw $FFFE,$220E,$0003,$5585,$5584,$55A3,$224E,$0003 
    dw $5595,$5594,$55B3,$228E,$0003,$55A5,$55A4,$5574 
    dw $FFFF 

ExtendedTilemap_Draygon_27:
    dw $FFFE,$20D4,$0002,$5541,$5540,$2114,$0002,$5551 
    dw $5550,$FFFF 

ExtendedTilemap_Draygon_28:
    dw $FFFE,$20D4,$0002,$5561,$5560,$2114,$0002,$5571 
    dw $5570,$FFFF 

ExtendedTilemap_Draygon_29:
    dw $FFFE,$20D4,$0002,$550B,$550A,$2114,$0002,$551B 
    dw $551A,$FFFF 

ExtendedTilemap_Draygon_2A:
    dw $FFFE,$20D4,$0002,$550D,$550C,$2114,$0002,$551D 
    dw $551C,$FFFF 

ExtendedTilemap_Draygon_2B:
    dw $FFFE,$20D4,$0002,$5535,$5534,$2114,$0002,$5545 
    dw $5544,$FFFF 

ExtendedTilemap_Draygon_2C:
    dw $FFFE,$20D4,$0002,$550F,$550E,$2114,$0002,$551F 
    dw $551E,$FFFF 

ExtendedTilemap_Draygon_2D:
    dw $FFFE,$20D4,$0002,$552D,$552C,$2114,$0002,$553D 
    dw $553C,$FFFF 

ExtendedTilemap_Draygon_2E:
    dw $FFFE,$20D4,$0002,$552F,$552E,$2114,$0002,$553F 
    dw $553E,$FFFF 

ExtendedTilemap_Draygon_2F:
    dw $FFFE,$2000,$0010,$4338,$4338,$4338,$4338,$4338 
    dw $4338,$4338,$4338,$5507,$5506,$5505,$5504,$5503 
    dw $5502,$5501,$5500,$2040,$0010,$4338,$4338,$4338 
    dw $4338,$4338,$4338,$4338,$5518,$5517,$5516,$5515 
    dw $5514,$5513,$5512,$5511,$5510,$2080,$0010,$4338 
    dw $4338,$4338,$4338,$4338,$4338,$5529,$5528,$5527 
    dw $5526,$5525,$5524,$5523,$5522,$5521,$5520,$20C0 
    dw $0010,$4338,$4338,$4338,$4338,$4338,$553A,$5539 
    dw $5538,$5537,$5536,$02FF,$02FF,$5533,$5532,$5531 
    dw $5530,$2100,$0010,$5738,$554E,$554D,$554C,$554B 
    dw $554A,$5549,$5548,$5547,$5546,$02FF,$02FF,$5543 
    dw $5542,$4338,$4338,$2140,$0010,$555F,$555E,$555D 
    dw $555C,$555B,$555A,$5559,$5558,$5557,$5556,$5555 
    dw $5554,$5553,$4338,$4338,$4338,$2180,$0010,$556F 
    dw $556E,$556D,$556C,$556B,$556A,$5569,$5568,$5567 
    dw $5566,$5565,$5564,$4338,$4338,$4338,$4338,$21C0 
    dw $0010,$557F,$557E,$557D,$557C,$557B,$557A,$5579 
    dw $5578,$5577,$5576,$5575,$4338,$4338,$4338,$4338 
    dw $4338,$2200,$0010,$558F,$558E,$558D,$558C,$558B 
    dw $558A,$5589,$559F,$559E,$5586,$4338,$4338,$4338 
    dw $4338,$4338,$4338,$2240,$0010,$4338,$4338,$4338 
    dw $559C,$559B,$559A,$5599,$5598,$5597,$5596,$4338 
    dw $4338,$4338,$4338,$4338,$4338,$2280,$0010,$4338 
    dw $4338,$4338,$55AC,$55AB,$55AA,$55A9,$55A8,$55A7 
    dw $55A6,$4338,$4338,$4338,$4338,$4338,$4338,$22C0 
    dw $0010,$4338,$4338,$4338,$55BC,$55BB,$55BA,$55B9 
    dw $55B8,$55B7,$4338,$4338,$4338,$4338,$4338,$4338 
    dw $4338,$2300,$0010,$C338,$C338,$C338,$5509,$5508 
    dw $C338,$C338,$C338,$C338,$C338,$C338,$C338,$C338 
    dw $C338,$C338,$C338,$2340,$0010,$C338,$C338,$C338 
    dw $5519,$553B,$C338,$C338,$C338,$C338,$C338,$C338 
    dw $C338,$C338,$C338,$C338,$C338,$2380,$0010,$C338 
    dw $C338,$C338,$552B,$552A,$C338,$C338,$C338,$C338 
    dw $C338,$C338,$C338,$C338,$C338,$C338,$C338,$FFFF 

Spritemap_Draygon_48:
    dw $0003,$0000 
    db $F8 
    dw $67BD,$0000 
    db $F0 
    dw $67AD,$81F8 
    db $00 
    dw $67A9 

Spritemap_Draygon_49:
    dw $0003,$0000 
    db $F8 
    dw $67BC,$0000 
    db $F0 
    dw $67AC,$81F8 
    db $00 
    dw $67A7 

Spritemap_Draygon_4A:
    dw $0004,$0004 
    db $F4 
    dw $67BB,$0004 
    db $EC 
    dw $67AB,$0004 
    db $FC 
    dw $67A4,$81F4 
    db $FC 
    dw $67A5 

Spritemap_Draygon_4B:
    dw $0002,$8000 
    db $F8 
    dw $67A0,$81F0 
    db $F8 
    dw $67A2 

Spritemap_Draygon_4C:
    dw $0003,$0000 
    db $00 
    dw $6797,$0008 
    db $00 
    dw $6796,$81F0 
    db $F8 
    dw $67AE 

Spritemap_Draygon_4D:
    dw $0003,$0000 
    db $00 
    dw $67D1,$0008 
    db $00 
    dw $67D0,$81F0 
    db $F8 
    dw $67C2 

Spritemap_Draygon_4E:
    dw $0003,$01FC 
    db $04 
    dw $6787,$0004 
    db $04 
    dw $6786,$81F4 
    db $F4 
    dw $67C4 

Spritemap_Draygon_4F:
    dw $0002,$81F8 
    db $00 
    dw $6788,$81F8 
    db $F0 
    dw $67C6 

Spritemap_Draygon_50:
    dw $0003,$0000 
    db $00 
    dw $E1BD,$0000 
    db $08 
    dw $E1AD,$81F8 
    db $F0 
    dw $21C8 

Spritemap_Draygon_51:
    dw $0003,$01F8 
    db $00 
    dw $A7BC,$01F8 
    db $08 
    dw $A7AC,$81F8 
    db $F0 
    dw $A7A7 

Spritemap_Draygon_52:
    dw $0004,$01F4 
    db $04 
    dw $A7BB,$01F4 
    db $0C 
    dw $A7AB,$01F4 
    db $FC 
    dw $A7A4,$81FC 
    db $F4 
    dw $A7A5 

Spritemap_Draygon_53:
    dw $0002,$81F0 
    db $F8 
    dw $A7A0,$8000 
    db $F8 
    dw $A7A2 

Spritemap_Draygon_54:
    dw $0003,$01F8 
    db $F8 
    dw $A797,$01F0 
    db $F8 
    dw $A796,$8000 
    db $F8 
    dw $A7AE 

Spritemap_Draygon_55:
    dw $0003,$01F8 
    db $F8 
    dw $A7D1,$01F0 
    db $F8 
    dw $A7D0,$8000 
    db $F8 
    dw $A7C2 

Spritemap_Draygon_56:
    dw $0003,$01FC 
    db $F4 
    dw $A787,$01F4 
    db $F4 
    dw $A786,$81FC 
    db $FC 
    dw $A7C4 

Spritemap_Draygon_57:
    dw $0002,$81F8 
    db $F0 
    dw $A788,$81F8 
    db $00 
    dw $A7C6 

Spritemap_Draygon_58:
    dw $0001,$81F8 
    db $F8 
    dw $6784 

Spritemap_Draygon_59:
    dw $0001,$81F8 
    db $F8 
    dw $6782 

Spritemap_Draygon_5A:
    dw $0001,$81F8 
    db $F8 
    dw $6780 

Spritemap_Draygon_5B:
    dw $0001,$81F8 
    db $F8 
    dw $2784 

Spritemap_Draygon_5C:
    dw $0001,$81F8 
    db $F8 
    dw $2782 

Spritemap_Draygon_5D:
    dw $0001,$81F8 
    db $F8 
    dw $2780 

InitAI_DraygonEye:
    LDX.W $0E54 
    LDA.W #InstList_DraygonEye_FacingLeft_Idle : STA.W $0F92,X 
    LDA.W #RTS_A5804B : STA.W $0FA8,X 
    RTL 


Instruction_Draygon_EyeFunctionInY:
    PHY 
    LDA.W $0000,Y : STA.W $0FE8 
    PLY 
    INY #2
    RTL 


MainAI_DraygonEye:
    LDX.W $0E54 
    JSR.W ($0FA8,X) 
    RTL 


Function_DraygonEye_FacingLeft:
    LDA.W $0FA4,X : AND.W #$007F 
    BNE .nonZeroCounter 
    LDA.W $0FBA : SEC : SBC.W #$0018 : STA.B $12 
    LDA.W $0FBE : SEC : SBC.W #$0020 : STA.B $14 
    LDA.W #$0018 
    LDY.W #EnemyProjectile_MiscDust 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 

.nonZeroCounter:
    LDX.W $0E54 
    LDA.W $0F7A : SEC : SBC.W #$0018 : STA.B $12 
    LDA.W $0AF6 : SEC : SBC.B $12 : STA.B $12 
    LDA.W $0F7E : SEC : SBC.W #$0020 : STA.B $14 
    LDA.W $0AFA : SEC : SBC.B $14 : STA.B $14 
    JSL.L CalculateAngleOf_12_14_Offset 
    CMP.W $0FB2,X : BEQ .return 
    LDY.W #InstList_DraygonEye_FacingLeft_LookingUp : CMP.W #$0020 : BMI .directionChosen 
    LDY.W #InstList_DraygonEye_FacingLeft_LookingRight : CMP.W #$0060 : BMI .directionChosen 
    LDY.W #InstList_DraygonEye_FacingLeft_LookingDown : CMP.W #$00A0 : BMI .directionChosen 
    LDY.W #InstList_DraygonEye_FacingLeft_LookingLeft : CMP.W #$00E0 : BMI .directionChosen 
    LDY.W #InstList_DraygonEye_FacingLeft_LookingUp 

.directionChosen:
    STA.W $0FB2,X 
    TYA 
    STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    STZ.W $0F90,X 

.return:
    RTS 


Function_DraygonEye_FacingRight:
    LDA.W $0FA4,X : AND.W #$007F 
    BNE .nonZeroCounter 
    LDA.W $0F7A : CLC : ADC.W #$0018 : STA.B $12 
    LDA.W $0F7E : SEC : SBC.W #$0020 : STA.B $14 
    LDA.W #$0018 
    LDY.W #EnemyProjectile_MiscDust 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 

.nonZeroCounter:
    LDX.W $0E54 
    LDA.W $0F7A : CLC : ADC.W #$0018 : STA.B $12 
    LDA.W $0AF6 : SEC : SBC.B $12 : STA.B $12 
    LDA.W $0F7E : SEC : SBC.W #$0020 : STA.B $14 
    LDA.W $0AFA : SEC : SBC.B $14 : STA.B $14 
    JSL.L CalculateAngleOf_12_14_Offset 
    CMP.W $0FB2,X : BEQ .return 
    LDY.W #InstList_DraygonEye_FacingRight_LookingUp : CMP.W #$0020 : BMI .directionChosen 
    LDY.W #InstList_DraygonEye_FacingRight_LookingRight : CMP.W #$0060 : BMI .directionChosen 
    LDY.W #InstList_DraygonEye_FacingRight_LookingDown : CMP.W #$00A0 : BMI .directionChosen 
    LDY.W #InstList_DraygonEye_FacingRight_LookingLeft : CMP.W #$00E0 : BMI .directionChosen 
    LDY.W #InstList_DraygonEye_FacingRight_LookingUp 

.directionChosen:
    STA.W $0FB2,X 
    TYA 
    STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    STZ.W $0F90,X 

.return:
    RTS 


InitAI_DraygonTail:
    LDX.W $0E54 
    LDA.W #InstList_DraygonTail_FacingLeft_FakeTailWhip : STA.W $0F92,X 
    LDA.W #$0700 
    ASL A 
    STA.W $0F96,X 
    RTL 


RTL_A5C5AA:
    RTL 


RTL_A5C5AB:
    RTL 


RTL_A5C5AC:
    RTL 


InitAI_DraygonArms:
    LDX.W $0E54 
    LDA.W #InstList_DraygonArms_FacingLeft_Idle_0 : STA.W $0F92,X 
    LDA.W #$0700 
    ASL A 
    STA.W $0F96,X 
    LDA.W #$0002 : STA.W $0F9A,X 
    RTL 


RTL_A5C5C4:
    RTL 


RTL_A5C5C5:
    RTL 


RTL_A5C5C6:
    RTL 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_DraygonFightIntroDanceData_KeikoLove_A5C5C7:
    db $01,$FF,$01,$00,$00,$FF,$01,$00,$01,$FF,$01,$00,$00,$FF,$01,$00 
    db $01,$FF,$01,$00,$00,$FF,$01,$00,$01,$FF,$00,$FF,$01,$00,$01,$FF 
    db $01,$FF,$01,$FF,$01,$FF,$00,$FF,$01,$00,$00,$FF,$01,$FF,$00,$FF 
    db $01,$00,$00,$FF,$01,$FF,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF 
    db $00,$FF,$01,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FE 
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FE,$FF,$FF,$00,$FF,$00,$FF 
    db $00,$FE,$FF,$FF,$00,$FF,$00,$FF,$FF,$FF,$00,$FF,$00,$FF,$FF,$FF 
    db $00,$FF,$FF,$FF,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF 
    db $FF,$00,$FF,$00,$FF,$01,$00,$01,$FF,$00,$00,$01,$FF,$01,$00,$01 
    db $00,$01,$00,$01,$FF,$01,$00,$01,$00,$01,$00,$01,$FF,$01,$00,$01 
    db $00,$01,$00,$02,$00,$01,$00,$01,$FF,$01,$00,$01,$00,$01,$00,$01 
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$01,$01,$00,$01 
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01 
    db $00,$01,$01,$00,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01 
    db $00,$01,$00,$01,$00,$01,$00,$01,$01,$01,$00,$01,$00,$01,$00,$01 
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$02,$00,$01,$00,$01,$00,$01 
    db $00,$01,$00,$01,$00,$02,$00,$01,$00,$01,$00,$01,$00,$02,$00,$01 
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01 
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$FF,$01,$FF,$00,$FF 
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$01,$FF,$00,$FF,$00,$FF 
    db $00,$FE,$00,$FF,$00,$FF,$01,$FF,$00,$FE,$00,$FF,$00,$FF,$00,$FF 
    db $00,$FE,$01,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FE,$01,$FF,$00,$FF 
    db $00,$FF,$00,$FF,$01,$FF,$00,$FF,$01,$FF,$00,$FF,$01,$FF,$01,$FF 
    db $01,$00,$00,$FF,$01,$00,$01,$00,$01,$00,$01,$FF,$01,$00,$01,$00 
    db $01,$01,$01,$00,$01,$01,$01,$00,$01,$01,$01,$01,$00,$01,$01,$01 
    db $00,$01,$01,$00,$00,$01,$00,$01,$00,$01,$01,$02,$00,$01,$00,$01 
    db $FF,$01,$00,$01,$00,$01,$00,$01,$FF,$01,$00,$01,$FF,$01,$00,$01 
    db $FF,$01,$FF,$01,$FF,$01,$FF,$00,$FF,$01,$FF,$00,$FF,$00,$FF,$00 
    db $FF,$00,$FF,$00,$FF,$FF,$FF,$00,$FF,$FF,$FF,$00,$FF,$FF,$00,$01 
    db $01,$01,$01,$01,$01,$01,$00,$01,$01,$01,$01,$01,$01,$01,$01,$00 
    db $01,$01,$01,$01,$01,$01,$02,$01,$01,$00,$00,$01,$01,$00,$01,$01 
    db $01,$00,$01,$00,$01,$01,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00 
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$02,$00 
    db $01,$00,$02,$FF,$01,$00,$02,$00,$01,$00,$02,$FF,$01,$00,$02,$00 
    db $01,$FF,$02,$00,$01,$00,$01,$FF,$02,$00,$01,$FF,$01,$00,$01,$FF 
    db $02,$FF,$01,$00,$01,$FF,$01,$FF,$01,$FF,$01,$00,$00,$FF,$01,$FF 
    db $01,$FF,$01,$FE,$00,$FF,$01,$FF,$01,$FF,$00,$FF,$00,$FE,$01,$FF 
    db $00,$FE,$00,$FF,$01,$FF,$00,$FE,$00,$FF,$00,$FE,$00,$FE,$00,$FF 
    db $00,$FE,$00,$FF,$00,$FE,$FF,$FE,$00,$FF,$00,$FE,$FF,$FE,$00,$FF 
    db $00,$FE,$FF,$FE,$FF,$FE,$00,$FF,$FF,$FE,$FF,$FE,$00,$FE,$FF,$FF 
    db $FF,$FE,$FF,$FF,$FF,$FE,$FF,$FF,$00,$FF,$FF,$FE,$FF,$FF,$FF,$FF 
    db $FF,$FF,$FF,$00,$FF,$FF,$FF,$00,$FF,$FF,$FF,$00,$FF,$00,$FF,$00 
    db $FF,$01,$FF,$00,$FF,$01,$FF,$01,$FF,$01,$FF,$02,$FF,$01,$00,$01 
    db $FF,$02,$FF,$01,$00,$02,$FF,$01,$FF,$02,$00,$02,$FF,$01,$00,$02 
    db $00,$02,$FF,$02,$00,$01,$00,$02,$FF,$02,$00,$02,$00,$01,$00,$02 
    db $00,$01,$00,$02,$00,$02,$00,$01,$00,$02,$00,$01,$01,$02,$00,$01 
    db $00,$01,$01,$02,$00,$01,$01,$02,$00,$01,$01,$01,$00,$01,$01,$02 
    db $01,$01,$00,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01 
    db $01,$01,$01,$01,$02,$00,$01,$01,$01,$01,$01,$01,$02,$00,$01,$01 
    db $01,$00,$02,$01,$01,$00,$01,$01,$02,$00,$01,$00,$02,$01,$01,$00 
    db $02,$00,$01,$00,$01,$00,$02,$00,$01,$00,$02,$00,$01,$00,$02,$00 
    db $01,$00,$01,$00,$02,$00,$01,$FF,$01,$00,$02,$00,$01,$00,$01,$FF 
    db $01,$00,$01,$FF,$01,$00,$01,$FF,$01,$00,$01,$FF,$01,$FF,$01,$FF 
    db $00,$FF,$01,$FF,$00,$FF,$00,$FF,$01,$FE,$00,$FF,$00,$FF,$00,$FF 
    db $00,$FE,$00,$FF,$00,$FE,$00,$FF,$00,$FE,$00,$FF,$00,$FE,$00,$FF 
    db $00,$FE,$00,$FE,$00,$FF,$00,$FE,$00,$FE,$00,$FE,$00,$FF,$00,$FE 
    db $00,$FE,$00,$FF,$00,$FE,$00,$FE,$00,$FF,$00,$FE,$00,$FE,$00,$FF 
    db $00,$FE,$00,$FF,$00,$FF,$00,$FE,$00,$FF,$00,$FF,$00,$FF,$01,$FF 
    db $00,$FF,$00,$FF,$00,$FF,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01 
    db $00,$01,$00,$01,$00,$01,$01,$02,$00,$01,$00,$02,$00,$01,$00,$02 
    db $00,$01,$00,$02,$FF,$01,$00,$02,$00,$02,$00,$02,$00,$01,$00,$02 
    db $00,$02,$00,$01,$00,$02,$00,$02,$00,$02,$00,$01,$00,$02,$00,$01 
    db $00,$02,$FF,$01,$00,$02,$00,$01,$00,$02,$00,$01,$01,$01,$00,$01 
    db $00,$02,$00,$01,$00,$01,$01,$01,$00,$01,$00,$01,$01,$01,$01,$01 
    db $01,$01,$01,$01,$01,$00,$01,$01,$01,$00,$01,$01,$01,$00,$02,$00 
    db $01,$01,$01,$00,$02,$00,$01,$01,$01,$FF,$01,$00,$00,$FF,$01,$00 
    db $01,$FF,$01,$00,$00,$FF,$01,$00,$01,$FF,$01,$00,$00,$FF,$01,$00 
    db $01,$FF,$00,$FF,$01,$00,$01,$FF,$01,$FF,$01,$FF,$01,$FF,$00,$FF 
    db $01,$00,$00,$FF,$01,$FF,$00,$FF,$01,$00,$00,$FF,$01,$FF,$00,$FF 
    db $00,$FF,$01,$00,$00,$FF,$00,$FF,$00,$FF,$01,$FF,$00,$FF,$00,$FF 
    db $00,$FF,$00,$FF,$00,$FF,$00,$FE,$00,$FF,$00,$FF,$00,$FF,$00,$FF 
    db $00,$FE,$FF,$FF,$00,$FF,$00,$FF,$00,$FE,$FF,$FF,$00,$FF,$00,$FF 
    db $FF,$FF,$00,$FF,$00,$FF,$FF,$FF,$00,$FF,$FF,$FF,$00,$FF,$00,$FF 
    db $FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$FF,$01,$00,$01 
    db $FF,$00,$00,$01,$FF,$01,$00,$01,$00,$01,$00,$01,$FF,$01,$00,$01 
    db $00,$01,$00,$01,$FF,$01,$00,$01,$00,$01,$00,$02,$00,$01,$00,$01 
    db $FF,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01 
    db $00,$01,$00,$01,$01,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01 
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$01,$00,$00,$01,$00,$01 
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01 
    db $01,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01 
    db $00,$02,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$02,$00,$01 
    db $00,$01,$00,$01,$00,$02,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01 
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01 
    db $00,$01,$00,$FF,$01,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF 
    db $00,$FF,$01,$FF,$00,$FF,$00,$FF,$00,$FE,$00,$FF,$00,$FF,$01,$FF 
    db $00,$FE,$00,$FF,$00,$FF,$00,$FF,$00,$FE,$01,$FF,$00,$FF,$00,$FF 
    db $00,$FF,$00,$FE,$01,$FF,$00,$FF,$00,$FF,$00,$FF,$01,$FF,$00,$FF 
    db $01,$FF,$00,$FF,$01,$FF,$01,$FF,$01,$00,$00,$FF,$01,$00,$01,$00 
    db $01,$00,$01,$FF,$01,$00,$01,$00,$01,$01,$01,$00,$01,$01,$01,$00 
    db $01,$01,$01,$01,$00,$01,$01,$01,$00,$01,$01,$00,$00,$01,$00,$01 
    db $00,$01,$01,$02,$00,$01,$00,$01,$FF,$01,$00,$01,$00,$01,$00,$01 
    db $FF,$01,$00,$01,$FF,$01,$00,$01,$FF,$01,$FF,$01,$FF,$01,$FF,$00 
    db $FF,$01,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$FF,$FF,$00 
    db $FF,$FF,$FF,$00,$FF,$FF,$00,$01,$01,$01,$01,$01,$01,$01,$00,$01 
    db $01,$01,$01,$01,$01,$01,$01,$00,$01,$01,$01,$01,$01,$01,$02,$01 
    db $01,$00,$00,$01,$01,$00,$01,$01,$01,$00,$01,$00,$01,$01,$01,$00 
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00 
    db $01,$00,$01,$00,$01,$00,$01,$FF,$01,$FF,$00,$FF,$01,$00,$01,$FF 
    db $00,$FF,$01,$00,$01,$FF,$00,$FF,$01,$00,$00,$FF,$01,$FF,$01,$FF 
    db $01,$FF,$01,$FF,$00,$FF,$01,$FF,$00,$FF,$01,$FF,$01,$FF,$00,$FF 
    db $01,$FF,$01,$FF,$00,$FF,$01,$FF,$00,$FF,$01,$FF,$01,$FF,$00,$FF 
    db $01,$FE,$01,$FF,$00,$FF,$01,$FE,$00,$FF,$01,$FF,$00,$FF,$01,$FE 
    db $01,$FF,$00,$FF,$00,$FE,$01,$FF,$00,$FF,$01,$FF,$00,$FF,$00,$FE 
    db $00,$FF,$01,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF 
    db $00,$FF,$FF,$00,$00,$FF,$FF,$FF,$FF,$00,$FF,$00,$FF,$00,$FF,$00 
    db $FF,$00,$00,$01,$FF,$00,$FF,$01,$FF,$00,$FF,$01,$FF,$00,$FF,$01 
    db $FF,$01,$FF,$00,$FF,$01,$FF,$01,$FF,$01,$FF,$01,$FF,$01,$FF,$01 
    db $FF,$01,$00,$01,$FF,$01,$00,$01,$FF,$01,$00,$01,$00,$01,$FF,$01 
    db $00,$01,$00,$01,$00,$01,$00,$01,$FF,$01,$00,$01,$00,$01,$00,$01 
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01 
    db $00,$01,$00,$01,$01,$01,$00,$01,$00,$01,$00,$01,$00,$01,$01,$01 
    db $00,$01,$00,$01,$01,$01,$00,$01,$00,$01,$01,$01,$00,$01,$00,$01 
    db $01,$01,$00,$01,$01,$01,$01,$01,$00,$01,$01,$01,$00,$01,$01,$01 
    db $01,$01,$01,$01,$01,$00,$01,$01,$01,$00,$01,$00,$01,$00,$01,$FF 
    db $01,$00,$01,$FF,$01,$00,$01,$FF,$00,$FF,$01,$00,$01,$FF,$01,$FF 
    db $01,$FF,$00,$FF,$01,$FF,$01,$FF,$00,$FF,$01,$FF,$01,$FE,$00,$FF 
    db $01,$FF,$00,$FF,$01,$FF,$00,$FF,$01,$FF,$01,$FF,$00,$FF,$00,$FF 
    db $01,$FF,$00,$FF,$00,$FF,$00,$FF,$01,$FF,$00,$FF,$00,$FF,$00,$FF 
    db $01,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$01,$FF,$00,$FF 
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF 
    db $00,$FF,$00,$FE,$00,$FF,$00,$FF,$FF,$FF,$00,$FF,$00,$FF,$FF,$FF 
    db $FF,$FF,$00,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$00,$FF,$FF,$00,$FF,$FF 
    db $FF,$00,$FF,$FF,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$01 
    db $FF,$00,$FF,$01,$FF,$01,$FF,$01,$FF,$00,$FF,$01,$00,$01,$FF,$02 
    db $00,$01,$00,$01,$00,$01,$00,$01,$01,$01,$01,$01,$01,$00,$01,$01 
    db $01,$00,$01,$00,$02,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00 
    db $01,$FF,$01,$00,$01,$00,$01,$FF,$01,$00,$01,$00,$01,$FF,$01,$00 
    db $01,$FF,$01,$00,$01,$FF,$01,$FF,$01,$FF,$01,$00,$01,$FF,$01,$00 
    db $01,$FF,$01,$FF,$01,$00,$01,$FF,$01,$00,$01,$FF,$01,$00,$01,$FF 
    db $01,$00,$00,$FF,$01,$00,$01,$FF,$01,$00,$01,$FF,$01,$00,$01,$FF 
    db $01,$00,$01,$FF,$01,$FF,$01,$00,$01,$FF,$01,$00,$01,$FF,$01,$00 
endif ; !FEATURE_KEEP_UNREFERENCED

DraygonFightIntroDanceData_KeikoLove:
    db $03,$00,$03,$00,$03,$00,$02,$FF,$03,$00,$03,$FF,$03,$00,$02,$FF 
    db $03,$FF,$02,$FE,$02,$FF,$02,$FE,$02,$FE,$02,$FD,$02,$FE,$01,$FD 
    db $02,$FD,$01,$FE,$01,$FD,$02,$FE,$01,$FE,$00,$FE,$01,$FE,$01,$FF 
    db $01,$00,$00,$FF,$01,$00,$01,$01,$00,$01,$00,$01,$00,$02,$00,$02 
    db $00,$02,$00,$02,$00,$02,$00,$03,$FF,$03,$00,$03,$00,$03,$FF,$04 
    db $00,$03,$FF,$04,$00,$04,$FF,$04,$00,$04,$FF,$04,$FF,$04,$00,$05 
    db $FF,$04,$FF,$04,$00,$05,$FF,$04,$FF,$04,$FF,$05,$FF,$04,$00,$04 
    db $FF,$05,$FF,$04,$FF,$04,$FF,$04,$FF,$04,$00,$04,$FF,$03,$FF,$04 
    db $FF,$03,$00,$03,$FF,$03,$FF,$03,$FF,$03,$00,$02,$FF,$02,$FF,$02 
    db $00,$01,$FF,$02,$00,$01,$FF,$01,$FF,$00,$00,$FF,$00,$FF,$00,$FF 
    db $00,$FF,$00,$FE,$00,$FF,$00,$FD,$00,$FE,$00,$FE,$00,$FD,$00,$FD 
    db $01,$FD,$00,$FD,$00,$FD,$01,$FD,$00,$FC,$01,$FD,$01,$FC,$00,$FD 
    db $01,$FC,$01,$FD,$00,$FC,$01,$FC,$01,$FD,$01,$FC,$01,$FD,$01,$FC 
    db $01,$FD,$01,$FD,$02,$FD,$01,$FD,$01,$FD,$02,$FD,$01,$FD,$01,$FE 
    db $02,$FE,$02,$FE,$01,$FD,$02,$FF,$02,$FE,$02,$FE,$01,$FE,$02,$FF 
    db $02,$FE,$03,$FE,$02,$FF,$02,$FE,$03,$FE,$02,$FF,$03,$FE,$02,$FF 
    db $03,$FE,$03,$FE,$03,$FE,$03,$FE,$03,$FE,$02,$FF,$03,$FE,$03,$FE 
    db $03,$FF,$03,$FE,$02,$FF,$03,$FF,$02,$FF,$03,$FF,$02,$00,$01,$FF 
    db $02,$00,$01,$01,$02,$00,$00,$01,$01,$01,$00,$02,$00,$02,$00,$02 
    db $00,$02,$FF,$02,$00,$03,$FF,$02,$FF,$03,$FE,$03,$FF,$03,$FF,$03 
    db $FE,$03,$FE,$03,$FE,$03,$FE,$04,$FE,$03,$FE,$03,$FE,$03,$FE,$02 
    db $FE,$03,$FD,$03,$FE,$02,$FE,$03,$FD,$02,$FE,$02,$FE,$01,$FD,$02 
    db $FE,$01,$FD,$02,$FE,$01,$FD,$01,$FD,$01,$FE,$00,$FD,$01,$FD,$00 
    db $FE,$00,$FD,$00,$FD,$FF,$FD,$00,$FD,$FF,$FD,$FF,$FD,$FF,$FD,$FE 
    db $FD,$FF,$FD,$FE,$FE,$FE,$FE,$FE,$FF,$FE,$00,$FF,$01,$FE,$01,$FE 
    db $02,$FE,$02,$FF,$03,$FE,$03,$FF,$04,$FF,$03,$FF,$03,$00,$03,$00 
    db $03,$00,$03,$01,$03,$00,$02,$01,$02,$02,$03,$01,$02,$02,$02,$02 
    db $02,$02,$01,$02,$02,$02,$02,$03,$01,$03,$02,$02,$01,$03,$02,$03 
    db $01,$03,$01,$03,$02,$03,$01,$03,$01,$02,$01,$03,$01,$03,$02,$03 
    db $01,$03,$01,$02,$01,$03,$02,$03,$01,$02,$01,$03,$02,$02,$01,$02 
    db $02,$02,$01,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$01,$02,$02 
    db $02,$01,$02,$01,$03,$01,$02,$01,$03,$01,$02,$01,$03,$00,$03,$01 
    db $03,$01,$01,$FF,$02,$00,$01,$FF,$02,$00,$01,$FF,$02,$00,$01,$FF 
    db $01,$00,$02,$FF,$01,$FF,$02,$00,$01,$FF,$02,$00,$01,$FF,$01,$FF 
    db $02,$00,$01,$FF,$01,$FF,$02,$FF,$01,$FF,$01,$00,$02,$FF,$01,$FF 
    db $01,$FF,$01,$FF,$02,$FF,$01,$FF,$01,$FF,$01,$FF,$01,$FF,$02,$FF 
    db $01,$FF,$01,$FE,$01,$FF,$01,$FF,$01,$FF,$01,$FE,$01,$FF,$01,$FF 
    db $01,$FE,$00,$FF,$01,$FE,$01,$FF,$01,$FE,$00,$FF,$01,$FE,$01,$FF 
    db $00,$FE,$01,$FF,$00,$FE,$00,$FF,$01,$FE,$00,$FE,$00,$FF,$00,$FE 
    db $00,$FF,$00,$FE,$00,$FE,$00,$FF,$00,$FE,$00,$FF,$FF,$FE,$00,$FE 
    db $00,$FF,$FF,$FE,$FF,$FE,$00,$FF,$FF,$FE,$FF,$FF,$FF,$FE,$FF,$FF 
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FE,$FF,$FF,$00,$FF,$00,$FE,$00 
    db $FF,$00,$FF,$00,$FE,$01,$FF,$00,$FE,$01,$FF,$01,$FE,$01,$FF,$01 
    db $FF,$01,$FE,$01,$FF,$01,$FF,$02,$FF,$01,$FF,$01,$FF,$02,$FF,$01 
    db $FF,$01,$00,$02,$FF,$01,$FF,$02,$00,$01,$FF,$01,$00,$02,$00,$01 
    db $FF,$02,$00,$01,$00,$02,$00,$01,$00,$02,$FF,$01,$00,$02,$00,$02 
    db $00,$01,$00,$02,$00,$01,$00,$02,$00,$02,$00,$01,$00,$02,$00,$02 
    db $00,$01,$00,$02,$00,$02,$00,$01,$00,$02,$00,$02,$01,$01,$00,$02 
    db $00,$01,$01,$02,$00,$01,$01,$01,$00,$02,$01,$01,$01,$01,$00,$01 
    db $01,$01,$01,$02,$02,$00,$01,$01,$01,$01,$01,$01,$02,$01,$01,$00 
    db $02,$01,$01,$00,$02,$01,$01,$00,$02,$01,$01,$00,$02,$00,$02,$01 
    db $01,$00,$02,$00,$01,$00,$02,$00,$02,$00,$01,$00,$02,$00,$01,$00 
    db $02,$00,$01,$00,$02,$00,$01,$00,$02,$00,$01,$00,$01,$00,$02,$FF 
    db $01,$00,$02,$00,$01,$FF,$01,$00,$02,$FF,$01,$00,$01,$00,$02,$FF 
    db $01,$00,$01,$FF,$01,$FF,$01,$00,$02,$FF,$01,$00,$01,$FF,$01,$FF 
    db $01,$FF,$01,$FF,$01,$FF,$01,$FF,$01,$FF,$00,$FF,$01,$FF,$01,$FF 
    db $01,$FE,$00,$FF,$01,$FF,$00,$FF,$01,$FE,$01,$FF,$00,$FE,$01,$FF 
    db $00,$FE,$01,$FF,$00,$FE,$01,$FE,$00,$FF,$01,$FE,$00,$FE,$01,$FE 
    db $01,$FE,$00,$FE,$01,$FE,$00,$FF,$01,$FE,$00,$FE,$01,$FE,$00,$FE 
    db $01,$FE,$00,$FE,$01,$FE,$00,$FE,$01,$FE,$00,$FE,$00,$FE,$01,$FF 
    db $00,$FE,$01,$FE,$00,$FF,$01,$FE,$00,$FF,$00,$FE,$01,$FF,$00,$FF 
    db $00,$FE,$01,$FF,$00,$FF,$00,$FF,$01,$FF,$00,$FF,$00,$FF,$01,$00 
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01 
    db $00,$02,$00,$01,$00,$02,$FF,$01,$00,$02,$00,$02,$00,$01,$00,$02 
    db $00,$02,$FF,$01,$00,$02,$00,$02,$00,$01,$FF,$02,$00,$02,$00,$01 
    db $00,$02,$FF,$01,$00,$02,$00,$01,$00,$02,$FF,$01,$00,$01,$00,$02 
    db $00,$01,$00,$01,$00,$02,$FF,$01,$00,$01,$00,$02,$00,$01,$00,$01 
    db $00,$02,$00,$01,$00,$01,$00,$01,$00,$02,$00,$01,$00,$01,$01,$02 
    db $00,$01,$00,$01,$01,$01,$00,$02,$00,$01,$01,$01,$00,$02,$01,$01 
    db $00,$01,$01,$01,$01,$02,$01,$01,$00,$01,$01,$01,$01,$01,$01,$01 
    db $01,$01,$01,$01,$01,$01,$01,$01,$01,$00,$02,$01,$01,$01,$01,$00 
    db $01,$01,$02,$00,$01,$00,$01,$01,$02,$00,$01,$00,$02,$00,$01,$01 
    db $01,$00,$01,$FF,$01,$FF,$01,$FF,$01,$FF,$01,$FF,$01,$FF,$02,$FF 
    db $01,$FF,$01,$FF,$01,$FF,$01,$FF,$01,$FF,$01,$FF,$01,$FF,$01,$FF 
    db $01,$FF,$01,$FF,$01,$FF,$01,$FF,$01,$FF,$01,$FF,$01,$FF,$01,$FF 
    db $01,$FF,$01,$FF,$01,$FF,$00,$FF,$01,$FF,$01,$FE,$01,$FF,$01,$FF 
    db $01,$FF,$00,$FF,$01,$FF,$01,$FF,$01,$FF,$00,$FF,$01,$FF,$01,$FF 
    db $00,$FF,$01,$FF,$01,$FF,$00,$FE,$01,$FF,$01,$FF,$00,$FF,$01,$FF 
    db $00,$FF,$01,$FE,$01,$FF,$00,$FF,$01,$FF,$00,$FE,$01,$FF,$00,$FF 
    db $01,$FE,$00,$FF,$00,$FE,$01,$FF,$00,$FF,$01,$FE,$00,$FF,$00,$FE 
    db $01,$FE,$00,$FF,$01,$FE,$00,$FF,$00,$FE,$00,$FE,$01,$FE,$00,$FF 
    db $00,$FE,$01,$FE,$00,$FE,$00,$FE,$00,$FE,$01,$FE,$00,$FE,$00,$FE 
    db $00,$FE,$00,$FE,$00,$FE,$01,$FE,$00,$FE,$00,$FE,$00,$FE,$00,$FE 
    db $00,$FE,$00,$FE,$00,$FE,$00,$FF,$00,$FE,$00,$FE,$00,$FF,$00,$FE 
    db $00,$FF,$00,$FE,$FF,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$FF,$FF 
    db $00,$FF,$FF,$00,$FF,$00,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$01 
    db $FF,$01,$00,$01,$FF,$01,$FF,$01,$00,$02,$FF,$01,$FF,$02,$00,$01 
    db $FF,$02,$00,$02,$FF,$01,$FF,$02,$00,$02,$FF,$02,$FF,$01,$00,$02 
    db $FF,$02,$00,$02,$FF,$01,$00,$02,$00,$02,$FF,$01,$00,$02,$FF,$01 
    db $00,$02,$00,$02,$00,$01,$FF,$02,$00,$01,$00,$02,$00,$01,$00,$02 
    db $FF,$01,$00,$02,$00,$01,$00,$01,$00,$02,$00,$01,$00,$02,$00,$01 
    db $00,$01,$00,$02,$00,$01,$00,$01,$00,$02,$00,$01,$00,$01,$00,$02 
    db $00,$01,$00,$01,$01,$01,$00,$02,$00,$01,$00,$01,$00,$02,$00,$01 
    db $00,$01,$00,$02,$00,$01,$00,$01,$00,$02,$01,$01,$00,$01,$00,$02 
    db $00,$01,$00,$01,$00,$02,$00,$01,$00,$01,$00,$02,$00,$01,$00,$02 
    db $00,$01,$00,$01,$00,$02,$00,$01,$00,$02,$00,$01,$00,$02,$00,$01 
    db $00,$02,$00,$01,$00,$02,$FF,$02,$00,$01,$00,$02,$00,$02,$00,$01 
    db $FF,$02,$00,$02,$00,$01,$00,$02,$FF,$01,$00,$01,$00,$01,$00,$01 
    db $FF,$00,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FE,$00,$FF 
    db $00,$FE,$00,$FF,$00,$FE,$01,$FE,$00,$FE,$00,$FE,$00,$FE,$00,$FE 
    db $01,$FE,$00,$FE,$00,$FD,$01,$FE,$00,$FE,$01,$FE,$00,$FE,$01,$FE 
    db $00,$FD,$01,$FE,$01,$FE,$00,$FE,$01,$FE,$01,$FE,$00,$FF,$01,$FE 
    db $01,$FE,$01,$FF,$01,$FF,$01,$FE,$01,$FF,$01,$FF,$01,$FF,$01,$FF 
    db $01,$FF,$01,$00,$01,$FF,$01,$00,$01,$00,$02,$00,$01,$00,$01,$00 
    db $02,$01,$01,$00,$01,$01,$02,$01,$01,$01,$01,$01,$01,$01,$01,$01 
    db $02,$01,$01,$01,$01,$01,$00,$02,$01,$01,$01,$01,$01,$02,$00,$01 
    db $01,$02,$00,$01,$00,$02,$01,$01,$00,$02,$00,$01,$00,$02,$00,$01 
    db $00,$02,$FF,$01,$00,$02,$00,$01,$FF,$02,$00,$01,$FF,$01,$FF,$02 
    db $FF,$01,$FF,$01,$FF,$02,$FF,$01,$FF,$01,$FF,$01,$FF,$01,$FE,$01 
    db $FF,$00,$FF,$00,$FE,$00,$FF,$00,$FE,$FF,$FF,$FF,$FE,$00,$FF,$FF 
    db $FF,$FF,$FF,$FF,$FF,$00,$FF,$00,$00,$01,$00,$02,$01,$01,$00,$01 
    db $01,$02,$01,$02,$01,$02,$01,$01,$01,$02,$02,$02,$01,$01,$01,$01 
    db $02,$01,$01,$01,$01,$01,$02,$01,$01,$00,$02,$00,$01,$00,$01,$01 
    db $02,$00,$01,$00,$02,$FF,$01,$00,$02,$00,$01,$00,$01,$00,$02,$FF 
    db $01,$00,$02,$00,$01,$FF,$01,$00,$02,$00,$01,$FF,$02,$00,$02,$FF 
    db $01,$FE,$02,$FF,$02,$FF,$02,$FF,$01,$FE,$02,$FF,$02,$FE,$01,$FE 
    db $02,$FF,$02,$FE,$01,$FE,$02,$FE,$02,$FE,$01,$FD,$02,$FE,$01,$FD 
    db $02,$FE,$01,$FD,$02,$FD,$01,$FE,$02,$FD,$01,$FD,$01,$FD,$02,$FD 
    db $01,$FD,$01,$FD,$01,$FD,$01,$FD,$01,$FD,$01,$FD,$01,$FD,$01,$FE 
    db $00,$FD,$01,$FE,$01,$FD,$00,$FE,$01,$FD,$00,$FE,$00,$FE,$01,$FF 
    db $00,$FE,$00,$FF,$00,$FE,$FF,$FF,$00,$FF,$FF,$FF,$FF,$00,$FF,$00 
    db $00,$01,$FF,$01,$FF,$01,$FE,$01,$FF,$01,$FF,$02,$FF,$02,$FF,$02 
    db $FE,$02,$FF,$02,$FF,$02,$FF,$03,$FF,$03,$FE,$02,$FF,$03,$FF,$03 
    db $00,$03,$FF,$03,$FF,$03,$00,$03,$FF,$03,$00,$03,$00,$03,$00,$03 
    db $00,$03,$00,$03,$00,$03,$01,$03,$00,$03,$01,$03,$00,$03,$01,$02 
    db $01,$03,$01,$02,$01,$02,$01,$03,$01,$02,$01,$01,$01,$02,$01,$02 
    db $02,$01,$01,$01,$01,$01,$02,$01,$01,$01,$01,$00,$02,$00,$01,$00 
    db $02,$00,$01,$FF,$02,$FF,$02,$FF,$01,$FF,$02,$FF,$01,$FE,$02,$FF 
    db $01,$FE,$02,$FE,$01,$FE,$02,$FE,$01,$FD,$01,$FE,$02,$FD,$01,$FE 
    db $01,$FD,$02,$FD,$01,$FD,$01,$FD,$01,$FD,$01,$FD,$01,$FD,$01,$FD 
    db $01,$FD,$00,$FD,$01,$FD,$01,$FC,$00,$FD,$00,$FD,$01,$FE,$00,$FD 
    db $00,$FD,$00,$FD,$FF,$FE,$00,$FD,$FF,$FE,$00,$FE,$FF,$FE,$FF,$FE 
    db $FF,$FE,$FE,$FE,$FF,$FF,$FE,$FF,$FE,$FF,$FE,$00,$FE,$FF,$FD,$00 
    db $FD,$00,$FE,$00,$FD,$01,$FD,$01,$FE,$01,$FE,$01,$FE,$01,$FF,$01 
    db $FF,$02,$00,$01,$01,$02,$01,$02,$02,$01,$02,$02,$02,$01,$03,$02 
    db $02,$01,$03,$01,$03,$00,$02,$01,$03,$00,$02,$00,$02,$00,$03,$00 
    db $02,$00,$02,$FF,$02,$00,$02,$FF,$02,$00,$03,$FF,$01,$00,$01,$00 
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$02,$00,$01,$00 
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00 
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00 
    db $01,$00,$01,$FF,$01,$00,$01,$00,$02,$00,$01,$00,$01,$00,$01,$00 
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$FF,$01,$00,$01,$00,$01,$00 
    db $01,$00,$01,$FF,$01,$00,$01,$00,$01,$00,$01,$00,$01,$FF,$01,$00 
    db $01,$00,$01,$00,$01,$00,$01,$FF,$01,$00,$01,$00,$01,$FF,$01,$00 
    db $01,$00,$01,$FF,$01,$00,$01,$00,$01,$FF,$01,$00,$01,$FF,$01,$00 
    db $01,$00,$00,$FF,$01,$00,$01,$FF,$01,$00,$01,$FF,$01,$00,$01,$00 
    db $01,$FF,$01,$FF,$01,$FF,$01,$00,$01,$FF,$01,$00,$01,$FF,$01,$FF 
    db $01,$FF,$01,$00,$01,$FF,$01,$00,$01,$FF,$01,$FF,$01,$00,$01,$FF 
    db $00,$FF,$01,$FF,$01,$00,$01,$FF,$01,$FF,$01,$FF,$01,$00,$01,$FF 
    db $01,$FF,$01,$FF,$01,$FF,$00,$FF,$01,$00,$01,$FF,$01,$FF,$01,$FF 
    db $01,$FF,$00,$FF,$01,$FF,$01,$FF,$00,$FF,$01,$FF,$01,$FF,$00,$FF 
    db $01,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF 
    db $00,$FF,$00,$FF,$00,$FF,$FF,$FF,$00,$FF,$FF,$FF,$FF,$FF,$00,$FF 
    db $FF,$00,$FF,$FF,$FF,$FF,$FF,$00,$FF,$FF,$FF,$00,$FF,$00,$FF,$00 
    db $FF,$01,$FF,$00,$00,$01,$FF,$00,$FF,$01,$00,$01,$FF,$01,$FF,$01 
    db $00,$01,$FF,$01,$00,$01,$FF,$01,$00,$02,$00,$01,$FF,$01,$00,$01 
    db $00,$01,$00,$01,$FF,$02,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01 
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$01,$01,$00,$01 
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01 
    db $01,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01 
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$02,$00,$01 
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01 
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01 
    db $FF,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01 
    db $00,$02,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01 
    db $00,$01,$00,$01,$00,$01,$00,$01,$FF,$01,$00,$01,$00,$01,$00,$01 
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01 
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01 
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01 
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01 
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$02,$00,$01 
    db $00,$01,$00,$01,$00,$01,$FF,$01,$00,$02,$00,$01,$00,$01,$FF,$01 
    db $00,$01,$00,$01,$FF,$01,$00,$01,$FF,$00,$00,$01,$FF,$01,$FF,$00 
    db $FF,$01,$FF,$00,$FE,$01,$FF,$00,$FF,$00,$FF,$00,$FF,$FF,$FF,$00 
    db $FF,$00,$FF,$FF,$FE,$00,$FF,$FF,$FF,$00,$FF,$FF,$FF,$FF,$FF,$FF 
    db $00,$FF,$FF,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$01,$FF 
    db $00,$FF,$01,$FF,$00,$FF,$01,$FF,$01,$FF,$01,$FF,$00,$FF,$01,$00 
    db $01,$FF,$01,$FF,$01,$00,$01,$FF,$01,$FF,$01,$00,$01,$00,$01,$FF 
    db $01,$00,$01,$00,$01,$00,$01,$FF,$02,$00,$01,$00,$01,$00,$01,$00 
    db $01,$00,$01,$00,$01,$01,$01,$00,$01,$00,$01,$00,$01,$01,$01,$00 
    db $01,$00,$01,$01,$01,$00,$01,$01,$01,$01,$01,$00,$01,$01,$01,$01 
    db $01,$01,$01,$01,$01,$00,$00,$01,$01,$01,$01,$00,$01,$01,$00,$01 
    db $01,$01,$01,$00,$01,$01,$01,$01,$01,$01,$01,$01,$01,$00,$01,$01 
    db $00,$01,$01,$00,$01,$01,$01,$00,$01,$01,$01,$00,$01,$01,$01,$00 
    db $01,$01,$01,$00,$00,$01,$01,$00,$01,$00,$01,$01,$01,$00,$01,$00 
    db $01,$00,$01,$01,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00 
    db $01,$01,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$FF,$01,$00 
    db $02,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$FE,$00,$FF,$01,$FE 
    db $00,$FF,$01,$FE,$01,$FF,$00,$FE,$01,$FF,$00,$FE,$01,$FF,$00,$FE 
    db $01,$FF,$01,$FE,$00,$FF,$01,$FE,$00,$FF,$01,$FF,$00,$FE,$01,$FF 
    db $00,$FE,$01,$FF,$00,$FF,$01,$FE,$00,$FF,$01,$FF,$00,$FF,$00,$FF 
    db $01,$FE,$00,$FF,$01,$FF,$00,$FF,$00,$FF,$01,$FF,$00,$FF,$00,$FF 
    db $01,$FF,$00,$FF,$00,$FF,$00,$FF,$01,$FF,$00,$FF,$00,$FF,$00,$FF 
    db $00,$FF,$00,$FF,$FF,$00,$FF,$00,$FF,$01,$FF,$00,$00,$01,$FF,$00 
    db $00,$01,$FF,$01,$FF,$01,$00,$01,$FF,$01,$00,$01,$FF,$00,$FF,$01 
    db $00,$01,$FF,$01,$00,$01,$FF,$01,$00,$01,$FF,$02,$00,$01,$FF,$01 
    db $00,$01,$FF,$01,$00,$01,$00,$02,$FF,$01,$00,$01,$00,$01,$00,$02 
    db $00,$01,$FF,$01,$00,$02,$00,$01,$00,$01,$00,$01,$00,$02,$00,$01 
    db $00,$01,$01,$01,$00,$02,$00,$01,$00,$01,$00,$01,$01,$01,$00,$01 
    db $00,$02,$01,$01,$00,$01,$01,$01,$00,$01,$01,$01,$00,$01,$01,$01 
    db $01,$01,$01,$01,$01,$01,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00 
    db $00,$FF,$01,$00,$01,$FF,$01,$00,$00,$FF,$01,$FF,$01,$00,$00,$FF 
    db $01,$FF,$00,$FF,$01,$FF,$00,$FF,$01,$FF,$01,$FF,$00,$FF,$01,$FF 
    db $00,$FF,$01,$FF,$00,$FF,$01,$FE,$00,$FF,$00,$FF,$01,$FE,$00,$FF 
    db $01,$FF,$00,$FE,$00,$FF,$01,$FE,$00,$FF,$00,$FF,$00,$FE,$00,$FF 
    db $01,$FE,$00,$FF,$00,$FE,$00,$FF,$00,$FE,$00,$FF,$00,$FF,$00,$FE 
    db $00,$FF,$FF,$FF,$00,$FE,$00,$FF,$00,$FF,$FF,$FF,$00,$FF,$00,$FF 
    db $FF,$FF,$00,$FF,$FF,$FF,$FF,$FF,$FF,$00,$00,$FF,$FF,$00,$FF,$00 
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$01,$FF,$01,$FF,$00,$FF,$01 
    db $FF,$01,$FF,$00,$FF,$01,$00,$01,$FF,$01,$00,$01,$00,$01,$01,$00 
    db $00,$01,$01,$00,$01,$01,$01,$00,$01,$00,$01,$01,$01,$00,$01,$00 
    db $01,$00,$02,$01,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00 
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$FF,$01,$00,$01,$00,$01,$FF 
    db $01,$FF,$01,$00,$01,$FF,$01,$FF,$01,$FF,$01,$FF,$01,$FF,$01,$FF 
    db $01,$FF,$01,$FF,$00,$FF,$01,$00,$01,$FF,$01,$00,$01,$00,$01,$01 
    db $00,$01,$01,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$02,$00,$01 
    db $00,$01,$00,$02,$00,$01,$00,$02,$00,$01,$00,$02,$00,$02,$00,$01 
    db $00,$02,$00,$01,$FF,$02,$00,$01,$00,$02,$00,$01,$00,$02,$FF,$01 
    db $00,$01,$00,$02,$00,$01,$FF,$01,$00,$01,$00,$02,$00,$01,$00,$01 
    db $FF,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$FF,$01 
    db $00,$01,$00,$01,$01,$01,$00,$01,$00,$01,$01,$00,$01,$00,$01,$00 
    db $01,$00,$01,$FF,$01,$00,$00,$FF,$01,$00,$01,$FF,$01,$00,$00,$FF 
    db $01,$00,$01,$FF,$01,$FF,$01,$FF,$01,$FF,$01,$FF,$01,$FF,$01,$FF 
    db $00,$FF,$01,$FF,$01,$FF,$01,$FF,$01,$FE,$00,$FF,$01,$FF,$01,$FF 
    db $00,$FE,$01,$FF,$01,$FF,$00,$FE,$01,$FF,$00,$FF,$01,$FE,$00,$FF 
    db $00,$FF,$01,$FE,$00,$FF,$01,$FE,$00,$FF,$00,$FF,$01,$FE,$00,$FF 
    db $00,$FF,$00,$FF,$00,$FE,$01,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF 
    db $00,$FF,$00,$FF,$01,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$01,$00,$01 
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$01,$01,$00,$01,$00,$01 
    db $00,$01,$00,$01,$00,$01,$00,$02,$01,$01,$00,$01,$00,$01,$00,$02 
    db $01,$01,$00,$01,$00,$01,$01,$02,$00,$01,$00,$01,$01,$01,$00,$01 
    db $01,$01,$01,$01,$00,$01,$01,$01,$01,$01,$01,$01,$00,$01,$01,$00 
    db $01,$01,$00,$01,$01,$00,$01,$01,$01,$01,$01,$01,$01,$01,$00,$01 
    db $01,$00,$00,$01,$01,$01,$00,$01,$01,$01,$00,$01,$01,$01,$00,$01 
    db $01,$01,$00,$01,$01,$01,$00,$01,$01,$00,$00,$01,$01,$01,$00,$01 
    db $01,$00,$01,$01,$01,$01,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00 
    db $01,$00,$01,$FF,$01,$00,$01,$00,$01,$FF,$01,$00,$01,$FF,$01,$00 
    db $01,$FF,$01,$00,$01,$FF,$01,$FF,$01,$FF,$01,$FF,$01,$FF,$01,$FF 
    db $00,$FF,$01,$FF,$00,$FF,$01,$FF,$00,$FF,$00,$FF,$01,$FF,$00,$FF 
    db $00,$FF,$00,$FE,$01,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FE 
    db $00,$FF,$00,$FF,$00,$FF,$00,$FE,$00,$FF,$00,$FF,$00,$FF,$00,$FE 
    db $FF,$FF,$00,$FF,$00,$FE,$00,$FF,$00,$FF,$FF,$FF,$00,$FE,$00,$FF 
    db $00,$FF,$FF,$FF,$00,$FF,$00,$FF,$FF,$FF,$00,$FF,$FF,$FF,$00,$FF 
    db $00,$FF,$FF,$FF,$00,$FF,$FF,$FF,$FF,$FF,$00,$FF,$FF,$00,$00,$FF 
    db $FF,$00,$00,$FF,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$01,$FF,$00 
    db $FF,$01,$FF,$01,$00,$01,$FF,$00,$00,$01,$FF,$01,$00,$01,$00,$01 
    db $FF,$01,$00,$01,$FF,$01,$00,$01,$FF,$01,$00,$01,$00,$01,$FF,$01 
    db $00,$01,$00,$02,$FF,$01,$00,$01,$00,$01,$00,$02,$00,$01,$FF,$01 
    db $00,$02,$00,$01,$00,$01,$00,$01,$00,$02,$00,$01,$00,$01,$00,$02 
    db $00,$01,$00,$01,$00,$01,$01,$01,$00,$02,$00,$01,$00,$01,$01,$01 
    db $00,$01,$01,$01,$00,$01,$00,$01,$01,$01,$00,$01,$01,$01,$00,$01 
    db $01,$01,$01,$00,$00,$01,$01,$01,$80,$80,$80,$80,$80,$80,$80,$80 

DraygonFightIntroDanceData_KeikoLove_EvirsAlreadyDeleted:
    db $01,$FF,$02,$FE,$01,$FF,$02,$FE,$01,$FF,$01,$FE,$02,$FF,$01,$FE 
    db $02,$FF,$01,$FE,$01,$FF,$02,$FE,$01,$FE,$01,$FF,$02,$FE,$01,$FE 
    db $01,$FF,$02,$FE,$01,$FE,$01,$FE,$01,$FE,$02,$FF,$01,$FE,$01,$FE 
    db $01,$FD,$02,$FE,$01,$FE,$01,$FE,$01,$FE,$01,$FD,$01,$FE,$01,$FE 
    db $01,$FD,$01,$FD,$01,$FE,$01,$FD,$01,$FD,$01,$FE,$01,$FD,$01,$FD 
    db $01,$FD,$00,$FE,$01,$FD,$01,$FE,$00,$FD,$00,$FE,$01,$FE,$00,$FE 
    db $00,$FF,$00,$FE,$FF,$FF,$00,$FF,$FF,$FF,$FF,$00,$FF,$00,$FF,$01 
    db $FF,$01,$FF,$01,$FF,$01,$FE,$01,$FF,$02,$FF,$01,$FE,$02,$FF,$02 
    db $FE,$03,$FF,$02,$FE,$02,$FF,$03,$FE,$03,$FF,$03,$FE,$02,$FF,$03 
    db $FF,$03,$FF,$03,$FF,$04,$FF,$03,$FF,$03,$FF,$03,$FF,$03,$00,$03 
    db $00,$03,$FF,$03,$00,$03,$00,$03,$00,$03,$01,$03,$00,$03,$00,$02 
    db $01,$03,$01,$03,$00,$02,$01,$02,$01,$03,$01,$02,$01,$02,$01,$02 
    db $01,$02,$02,$01,$01,$02,$01,$01,$02,$01,$01,$01,$02,$01,$01,$01 
    db $02,$01,$01,$00,$02,$00,$02,$00,$01,$00,$02,$00,$02,$FF,$02,$00 
    db $01,$FF,$02,$FF,$02,$FF,$02,$FE,$01,$FF,$02,$FE,$02,$FF,$01,$FE 
    db $02,$FE,$01,$FE,$02,$FE,$01,$FD,$02,$FE,$01,$FE,$01,$FD,$01,$FD 
    db $01,$FE,$01,$FD,$01,$FD,$01,$FD,$01,$FD,$00,$FD,$01,$FD,$00,$FD 
    db $00,$FC,$01,$FD,$00,$FD,$FF,$FD,$00,$FD,$00,$FC,$00,$FD,$FF,$FD 
    db $00,$FD,$FF,$FD,$FF,$FD,$FF,$FD,$00,$FE,$FF,$FD,$FF,$FE,$FF,$FD 
    db $FE,$FE,$FF,$FE,$FF,$FE,$FF,$FF,$FE,$FE,$FF,$FF,$FF,$FF,$FE,$00 
    db $FF,$FF,$FE,$00,$FF,$00,$FE,$01,$FF,$01,$FF,$01,$FE,$01,$FF,$01 
    db $FE,$02,$FF,$02,$FF,$02,$FE,$02,$FF,$03,$FF,$02,$00,$03,$FF,$02 
    db $FF,$02,$00,$03,$00,$02,$00,$02,$00,$03,$00,$02,$01,$02,$01,$02 
    db $01,$02,$00,$02,$02,$02,$01,$01,$01,$02,$01,$02,$02,$02,$02,$01 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_DraygonFightIntroDanceData_KeikoLove_A5DF47:
    db $01,$02,$02,$02,$02,$01,$01,$02,$02,$02,$02,$01,$02,$02,$02,$01 
    db $02,$02,$02,$02,$02,$01,$02,$02,$01,$02,$02,$01,$02,$02,$02,$02 
    db $01,$01,$02,$02,$01,$02,$02,$02,$01,$02,$02,$01,$01,$02,$02,$02 
    db $01,$02,$02,$01,$01,$02,$02,$02,$01,$01,$02,$01,$02,$02,$02,$01 
    db $01,$01,$02,$01,$02,$01,$02,$01,$03,$01,$02,$00,$02,$01,$00,$FF 
    db $00,$FE,$00,$FF,$01,$FF,$00,$FF,$00,$FE,$00,$FF,$00,$FF,$01,$FE 
    db $00,$FF,$00,$FF,$00,$FE,$00,$FF,$01,$FF,$00,$FE,$00,$FF,$00,$FF 
    db $01,$FE,$00,$FF,$00,$FE,$01,$FF,$00,$FF,$00,$FE,$01,$FF,$00,$FE 
    db $00,$FF,$01,$FE,$00,$FF,$01,$FE,$00,$FF,$01,$FE,$00,$FF,$01,$FE 
    db $01,$FE,$00,$FF,$01,$FE,$00,$FF,$01,$FE,$01,$FE,$01,$FE,$01,$FF 
    db $00,$FE,$01,$FE,$01,$FE,$01,$FF,$01,$FE,$01,$FE,$01,$FE,$01,$FE 
    db $01,$FE,$01,$FE,$01,$FF,$02,$FE,$01,$FF,$01,$FF,$01,$FF,$01,$FF 
    db $01,$00,$01,$00,$01,$01,$01,$01,$00,$01,$01,$02,$00,$01,$00,$02 
    db $01,$02,$00,$02,$00,$02,$00,$02,$00,$02,$00,$01,$00,$02,$00,$02 
    db $00,$01,$00,$02,$FF,$02,$00,$01,$00,$02,$00,$01,$FF,$02,$00,$01 
    db $00,$02,$00,$01,$FF,$01,$00,$02,$00,$01,$FF,$02,$00,$01,$00,$01 
    db $FF,$02,$00,$01,$00,$02,$00,$01,$00,$02,$00,$01,$00,$02,$00,$01 
    db $00,$02,$00,$02,$00,$01,$00,$02,$00,$02,$01,$02,$00,$02,$01,$02 
    db $00,$01,$01,$02,$00,$02,$01,$02,$01,$01,$00,$02,$01,$01,$01,$02 
    db $01,$01,$00,$01,$01,$01,$01,$01,$01,$00,$01,$01,$01,$00,$01,$00 
    db $01,$00,$01,$FF,$01,$FF,$01,$00,$01,$FF,$01,$FE,$00,$FF,$01,$FF 
    db $01,$FE,$01,$FF,$01,$FE,$00,$FE,$01,$FE,$01,$FE,$01,$FE,$00,$FE 
    db $01,$FD,$00,$FE,$01,$FE,$01,$FD,$00,$FE,$01,$FD,$00,$FE,$00,$FE 
    db $01,$FD,$00,$FE,$01,$FD,$00,$FE,$00,$FD,$01,$FE,$00,$FE,$00,$FD 
    db $00,$FE,$01,$FE,$00,$FE,$00,$FE,$00,$FE,$01,$FE,$00,$FE,$00,$FF 
    db $00,$FE,$00,$FF,$01,$FF,$00,$FF,$00,$FF,$00,$FF,$01,$FF,$00,$FF 
    db $01,$00,$00,$01,$01,$00,$00,$01,$00,$01,$01,$01,$00,$01,$01,$02 
    db $00,$01,$01,$02,$00,$01,$00,$02,$01,$02,$00,$02,$00,$01,$01,$02 
    db $00,$02,$00,$01,$01,$02,$00,$02,$00,$01,$00,$02,$00,$01,$00,$02 
    db $01,$01,$00,$02,$00,$01,$00,$02,$00,$01,$00,$02,$00,$01,$01,$02 
    db $00,$01,$00,$02,$00,$01,$00,$02,$01,$01,$00,$02,$00,$01,$01,$02 
    db $00,$01,$00,$02,$01,$01,$00,$02,$01,$01,$00,$02,$01,$01,$01,$02 
    db $00,$01,$01,$01,$01,$02,$01,$01,$01,$01,$01,$01,$01,$01,$01,$01 
    db $02,$01,$01,$01,$01,$01,$01,$01,$02,$00,$01,$01,$02,$01,$01,$01 
    db $02,$00,$02,$00,$02,$00,$01,$00,$02,$00,$02,$00,$01,$00,$02,$00 
    db $02,$00,$02,$00,$01,$00,$02,$00,$01,$00,$02,$00,$02,$00,$01,$FF 
    db $02,$00,$01,$00,$02,$FF,$01,$00,$02,$FF,$01,$00,$01,$FF,$02,$FF 
    db $01,$FF,$01,$FF,$01,$FF,$01,$FF,$01,$FF,$02,$FF,$01,$FF,$01,$FF 
    db $01,$FF,$01,$FE,$01,$FF,$01,$FF,$00,$FE,$01,$FF,$01,$FE,$01,$FF 
    db $01,$FE,$01,$FF,$01,$FE,$01,$FF,$01,$FE,$00,$FF,$01,$FE,$01,$FF 
    db $01,$FE,$01,$FF,$01,$FE,$01,$FF,$01,$FE,$00,$FF,$01,$FE,$01,$FF 
    db $01,$FE,$01,$FF,$00,$FE,$01,$FF,$01,$FE,$00,$FF,$01,$FE,$00,$FF 
    db $01,$FE,$00,$FF,$00,$FE,$01,$FF,$00,$FE,$00,$FE,$00,$FF,$00,$FE 
    db $00,$FF,$00,$FE,$FF,$FE,$00,$FF,$00,$FE,$FF,$FE,$00,$FE,$FF,$FF 
    db $FF,$FE,$FF,$FE,$FF,$FF,$FF,$FE,$FF,$FE,$FF,$FF,$FF,$FE,$FF,$FF 
    db $FF,$FF,$FF,$FE,$FE,$FF,$FF,$FF,$FF,$FF,$FE,$FF,$FF,$00,$FF,$FF 
    db $FE,$FF,$FF,$00,$FF,$00,$FE,$00,$FF,$00,$FF,$01,$FF,$00,$FE,$01 
    db $FF,$00,$FF,$01,$FF,$01,$FF,$01,$FE,$01,$FF,$02,$FF,$01,$FF,$02 
    db $FF,$01,$FF,$02,$FF,$01,$FF,$02,$00,$02,$FF,$01,$FF,$02,$FF,$02 
    db $00,$02,$FF,$02,$FF,$02,$00,$01,$FF,$02,$00,$02,$00,$02,$FF,$01 
    db $00,$02,$00,$02,$00,$01,$00,$02,$00,$02,$00,$01,$00,$02,$00,$01 
    db $00,$02,$00,$02,$00,$01,$00,$02,$01,$01,$00,$02,$00,$01,$01,$02 
    db $00,$02,$01,$01,$00,$02,$01,$01,$00,$02,$01,$01,$00,$02,$01,$01 
    db $00,$02,$01,$01,$01,$02,$00,$02,$01,$01,$01,$02,$01,$01,$00,$02 
    db $01,$01,$01,$02,$01,$01,$01,$02,$01,$01,$01,$01,$01,$02,$01,$01 
    db $01,$01,$01,$01,$01,$01,$01,$01,$01,$01,$02,$01,$01,$01,$01,$01 
    db $01,$01,$02,$00,$01,$01,$02,$01,$01,$00,$02,$01,$01,$00,$02,$00 
    db $01,$01,$02,$00,$01,$00,$02,$00,$02,$00,$01,$00,$02,$00,$02,$00 
    db $02,$00,$01,$00,$02,$00,$02,$00,$01,$00,$02,$00,$02,$00,$01,$FF 
    db $02,$00,$02,$00,$02,$00,$01,$00,$02,$00,$02,$FF,$01,$00,$02,$00 
    db $01,$00,$02,$00,$02,$FF,$01,$00,$02,$00,$02,$00,$01,$00,$02,$00 
    db $01,$FF,$02,$00,$01,$00,$02,$00,$02,$00,$01,$00,$02,$00,$01,$FF 
    db $02,$00,$02,$00,$01,$00,$02,$00,$01,$00,$02,$00,$02,$00,$01,$00 
    db $02,$00,$01,$00,$02,$00,$02,$00,$01,$00,$02,$00,$01,$00,$02,$00 
    db $02,$00,$01,$00,$02,$00,$02,$00,$01,$00,$02,$00,$01,$00,$02,$00 
    db $02,$00 
endif ; !FEATURE_KEEP_UNREFERENCED

Palette_SporeSpawn:
    dw $0000,$3F57,$2E4D,$00E2,$0060,$3AB0,$220B,$1166 
    dw $0924,$57FF,$3AB5,$1DCE,$00E7,$03FF,$0216,$00B0 

Palette_SporeSpawn_HealthBased_0:
    dw $0000,$3F57,$2E4D,$00E2,$0060,$3AB0,$220B,$1166 
    dw $0924,$57FF,$3AB5,$1DCE,$00E7,$03FF,$0216,$00B0 

Palette_SporeSpawn_HealthBased_1:
    dw $3800,$2A92,$21CC,$00C4,$0062,$260E,$15AA,$0D27 
    dw $04E5,$475A,$2E52,$198C,$00C6,$033F,$01B6,$008F 

Palette_SporeSpawn_HealthBased_2:
    dw $3800,$15EF,$156B,$00A5,$0063,$15AC,$0D49,$0907 
    dw $04C6,$36D6,$21D0,$114B,$00A6,$025F,$0137,$008D 

Palette_SporeSpawn_HealthBased_3:
    dw $3800,$094A,$0908,$0463,$0000,$0929,$04C6,$04A5 
    dw $0484,$2631,$156D,$0D09,$0085,$019F,$00D7,$006C 

Palette_SporeSpawn_DeathSequence_0:
    dw $3800,$094A,$0908,$0463,$0000,$0929,$04C6,$04A5 
    dw $0484,$2631,$156D,$0D09,$0085,$019F,$00D7,$006C 

Palette_SporeSpawn_DeathSequence_1:
    dw $3800,$118C,$0D2A,$0464,$0000,$0D4B,$08E8,$04A6 
    dw $0485,$2A53,$156E,$0D09,$0065,$09DF,$04F6,$006C 

Palette_SporeSpawn_DeathSequence_2:
    dw $3800,$15AF,$114B,$0465,$0001,$156D,$0D09,$08C7 
    dw $04A6,$2A74,$158E,$08EA,$0065,$11FE,$0916,$008C 

Palette_SporeSpawn_DeathSequence_3:
    dw $3800,$1DF1,$156D,$0466,$0001,$198F,$112B,$08C8 
    dw $04A7,$2E96,$158F,$08EA,$0045,$1A3E,$0D35,$008C 

Palette_SporeSpawn_DeathSequence_4:
    dw $3800,$2213,$1D8F,$0086,$0001,$21D0,$114D,$08EA 
    dw $04A8,$2E97,$1990,$04EA,$0044,$1E5D,$0D54,$00AB 

Palette_SporeSpawn_DeathSequence_5:
    dw $3800,$2A55,$21B1,$0087,$0001,$25F2,$156F,$08EB 
    dw $04A9,$32B9,$1991,$04EA,$0024,$269D,$1173,$00AB 

Palette_SporeSpawn_DeathSequence_6:
    dw $3800,$2E78,$25D2,$0088,$0002,$2E14,$1990,$0D0C 
    dw $04CA,$32DA,$19B1,$00CB,$0024,$2EBC,$1593,$00CB 

Palette_SporeSpawn_DeathSequence_7:
    dw $3800,$36BA,$29F4,$0089,$0002,$3236,$1DB2,$0D0D 
    dw $04CB,$36FC,$19B2,$00CB,$0004,$36FC,$19B2,$00CB 

Palette_SporeSpawn_DeathSequence_Level_0:
    dw $2003,$6318,$6318,$1CE1,$1DA9,$2923,$24A1,$1400 
    dw $2269,$21C9,$1544,$0420,$268B,$04C5,$2731,$0000 

Palette_SporeSpawn_DeathSequence_Level_1:
    dw $2003,$6318,$6318,$18C3,$1DAA,$2524,$1CA3,$1000 
    dw $1E2A,$1D8A,$1145,$0000,$2A8D,$0CE7,$22F1,$0001 

Palette_SporeSpawn_DeathSequence_Level_2:
    dw $0000,$6318,$6318,$14C4,$1DAC,$2126,$18A4,$0C00 
    dw $19EA,$196A,$1147,$0001,$2A6F,$112A,$22B1,$0001 

Palette_SporeSpawn_DeathSequence_Level_3:
    dw $0000,$6318,$6318,$0CA5,$19AD,$1908,$1085,$0400 
    dw $118A,$114A,$0D29,$0001,$2E70,$194C,$1E72,$0002 

Palette_SporeSpawn_DeathSequence_Level_4:
    dw $0000,$6318,$6318,$08A6,$19AF,$150A,$0C86,$0000 
    dw $0D4A,$0D2A,$0D2B,$0002,$2E52,$1D8F,$1E32,$0002 

Palette_SporeSpawn_DeathSequence_Level_5:
    dw $0000,$6318,$6318,$0488,$19B0,$110B,$0488,$0001 
    dw $090B,$08EB,$092C,$0003,$3254,$25B1,$19F2,$0002 

Palette_SporeSpawn_DeathSequence_Level_6:
    dw $0000,$6318,$6318,$0089,$19B2,$0D0D,$0089,$0002 
    dw $04CB,$04CB,$092E,$0004,$3236,$29F4,$19B2,$0002 

Palette_SporeSpawn_DeathSequence_Background_0:
    dw $3800,$5544,$3C84,$1441,$24E3,$18A2,$1081,$0C40 
    dw $129C,$11B5,$14EE,$1066,$7FFF,$7FFF,$16BD,$0800 

Palette_SporeSpawn_DeathSequence_Background_1:
    dw $3800,$4947,$3486,$1063,$2105,$18C4,$1083,$0C21 
    dw $1239,$1194,$110E,$1065,$7FFF,$7FFF,$167B,$0401 

Palette_SporeSpawn_DeathSequence_Background_2:
    dw $3800,$4169,$2CA7,$0C64,$2128,$14C6,$0C84,$0821 
    dw $0DF6,$0D72,$110E,$0C45,$7FFF,$7FFF,$1659,$0401 

Palette_SporeSpawn_DeathSequence_Background_3:
    dw $3800,$356B,$24C9,$0C65,$1D4A,$14E7,$0885,$0821 
    dw $0DB4,$0D30,$0D0E,$0845,$7FFF,$7FFF,$1A38,$0401 

Palette_SporeSpawn_DeathSequence_Background_4:
    dw $3800,$2D8D,$1CEA,$0866,$1D6D,$10E9,$0486,$0421 
    dw $0971,$090E,$0D0E,$0425,$7FFF,$7FFF,$1A16,$0401 

Palette_SporeSpawn_DeathSequence_Background_5:
    dw $3800,$2190,$14EC,$0488,$198F,$110B,$0488,$0402 
    dw $090E,$08ED,$092E,$0424,$7FFF,$7FFF,$19D4,$0002 

Palette_SporeSpawn_DeathSequence_Background_6:
    dw $3800,$19B2,$0D0D,$0089,$19B2,$0D0D,$0089,$0002 
    dw $04CB,$04CB,$092E,$0004,$7FFF,$7FFF,$19B2,$0002 

InstList_SporeSpawn_Initial_Dead:
    dw Instruction_SporeSpawn_LoadDeathSequenceTargetPalette 
    dw $00C0 
    dw Instruction_SporeSpawn_FunctionInY 
    dw RTS_A5EB1A 
    dw $0001 
    dw ExtendedSpritemap_SporeSpawn_Dead 
    dw Instruction_Common_Sleep 

InstList_SporeSpawn_Initial_Alive:
    dw $0100 
    dw ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_0 
    dw Instruction_SporeSpawn_FunctionInY 
    dw Function_SporeSpawn_Descent 
    dw $0001 
    dw ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_0 
    dw Instruction_Common_Sleep 

InstList_SporeSpawn_FightHasStarted:
    dw Instruction_SporeSpawn_SetMaxXRadiusAndAngleDelta 
    dw $0040,$0001 
    dw Instruction_SporeSpawn_FunctionInY 
    dw Function_SporeSpawn_Moving 
    dw $0300 
    dw ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_0 

InstList_SporeSpawn_OpenAndStop_0:
    dw Instruction_SporeSpawn_SporeGenerationFlagInY 
    dw $0001 
    dw Instruction_SporeSpawn_QueueSFXInY_Lib2_Max6 
    dw $002C,$0001 
    dw ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_0 
    dw $0008 
    dw ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_1 
    dw $0008 
    dw ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_2 
    dw $0008 
    dw ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_3 
    dw $0007 
    dw ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_4 
    dw $0007 
    dw ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_5 
    dw $0006 
    dw ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_6 
    dw $0001 
    dw ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_7 
    dw Instruction_SporeSpawn_ClearDamagedFlag 
    dw Instruction_SporeSpawn_FunctionInY 
    dw RTS_A5EB1A 
    dw Instruction_Common_TimerInY 
    dw $0005 

InstList_SporeSpawn_OpenAndStop_1:
    dw $0008 
    dw ExtendedSpritemap_SporeSpawn_FullyOpen_0 
    dw $0008 
    dw ExtendedSpritemap_SporeSpawn_FullyOpen_1 
    dw $0008 
    dw ExtendedSpritemap_SporeSpawn_FullyOpen_2 
    dw $0008 
    dw ExtendedSpritemap_SporeSpawn_FullyOpen_1 
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate 
    dw InstList_SporeSpawn_OpenAndStop_1 

InstList_SporeSpawn_CloseAndMove:
    dw $0008 
    dw ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_6 
    dw $0008 
    dw ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_5 
    dw $0008 
    dw ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_4 
    dw $0008 
    dw ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_3 
    dw $0008 
    dw ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_2 
    dw $0008 
    dw ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_1 
    dw $0001 
    dw ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_0 
    dw Instruction_SporeSpawn_FunctionInY 
    dw Function_SporeSpawn_Moving 
    dw Instruction_SporeSpawn_SporeGenerationFlagInY 
    dw $0000 
    dw Instruction_SporeSpawn_IncreaseMaxXRadius 
    dw $0200 
    dw ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_0 
    dw Instruction_SporeSpawn_SporeGenerationFlagInY 
    dw $0001,$00D0 
    dw ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_0 
    dw Instruction_Common_GotoY 
    dw InstList_SporeSpawn_OpenAndStop_0 

Instruction_SporeSpawn_IncreaseMaxXRadius:
    LDA.L $7E7816 : CLC : ADC.W #$0008 : CMP.W #$0030 : BPL .return 
    STA.L $7E7816 

.return:
    RTL 


Instruction_SporeSpawn_ClearDamagedFlag:
    PHX : PHY 
    LDA.W #$0000 : STA.L $7E801E 
    PLY : PLX 
    RTL 


InstList_SporeSpawn_DeathSequence_0:
    dw Instruction_SporeSpawn_FunctionInY 
    dw Function_SporeSpawn_SetupDeath 
    dw $0001 
    dw ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_6 
    dw Instruction_SporeSpawn_FunctionInY 
    dw Function_SporeSpawn_Dying 
    dw Instruction_Common_TimerInY 
    dw $000A 

InstList_SporeSpawn_DeathSequence_1:
    dw $0001 
    dw ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_6 
    dw Instruction_SporeSpawn_SpawnDyingExplosion 
    dw Instruction_Common_WaitYFrames 
    dw $0008 
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate 
    dw InstList_SporeSpawn_DeathSequence_1 
    dw $0008 
    dw ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_6 
    dw $0008 
    dw ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_5 
    dw $0008 
    dw ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_4 
    dw $0008 
    dw ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_3 
    dw $0008 
    dw ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_2 
    dw $0008 
    dw ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_1 
    dw $0001 
    dw ExtendedSpritemap_SporeSpawn_Dead 
    dw Instruction_SporeSpawn_Harden 
    dw Instruction_Common_TimerInY 
    dw $000A 

InstList_SporeSpawn_DeathSequence_2:
    dw Instruction_SporeSpawn_SpawnHardeningDustCloud 
    dw Instruction_Common_WaitYFrames 
    dw $0008 
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate 
    dw InstList_SporeSpawn_DeathSequence_2 
    dw Instruction_SporeSpawn_LoadDeathSequencePalette 
    dw $0000 
    dw Instruction_SporeSpawn_SpawnHardeningDustCloud 
    dw $0010 
    dw ExtendedSpritemap_SporeSpawn_Dead 
    dw Instruction_SporeSpawn_LoadDeathSequencePalette 
    dw $0020 
    dw Instruction_SporeSpawn_SpawnHardeningDustCloud 
    dw $0010 
    dw ExtendedSpritemap_SporeSpawn_Dead 
    dw Instruction_SporeSpawn_LoadDeathSequencePalette 
    dw $0040 
    dw Instruction_SporeSpawn_SpawnHardeningDustCloud 
    dw $0010 
    dw ExtendedSpritemap_SporeSpawn_Dead 
    dw Instruction_SporeSpawn_LoadDeathSequencePalette 
    dw $0060 
    dw Instruction_SporeSpawn_SpawnHardeningDustCloud 
    dw $0010 
    dw ExtendedSpritemap_SporeSpawn_Dead 
    dw Instruction_SporeSpawn_LoadDeathSequencePalette 
    dw $0080 
    dw Instruction_SporeSpawn_SpawnHardeningDustCloud 
    dw $0010 
    dw ExtendedSpritemap_SporeSpawn_Dead 
    dw Instruction_SporeSpawn_LoadDeathSequencePalette 
    dw $00A0 
    dw Instruction_SporeSpawn_SpawnHardeningDustCloud 
    dw $0010 
    dw ExtendedSpritemap_SporeSpawn_Dead 
    dw Instruction_SporeSpawn_LoadDeathSequencePalette 
    dw $00C0 
    dw Instruction_SporeSpawn_SpawnHardeningDustCloud 
    dw $0010 
    dw ExtendedSpritemap_SporeSpawn_Dead 
    dw Instruction_SporeSpawn_CallSporeSpawnDeathItemDropRoutine 
    dw Instruction_Common_Sleep 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Instruction_SporeSpawn_SetMaxXRadiusAndAngles_A5E811:
    LDA.W $0000,Y : STA.L $7E7816 
    LDA.W $0002,Y : STA.L $7E7818 
    LDA.W $0004,Y : STA.L $7E7814 
    TYA 
    CLC : ADC.W #$0006 : TAY 
    RTL 
endif ; !FEATURE_KEEP_UNREFERENCED


Instruction_SporeSpawn_SetMaxXRadiusAndAngleDelta:
    LDA.W $0000,Y : STA.L $7E7816 
    LDA.W $0002,Y : STA.L $7E7818 
    INY #4
    RTL 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Instruction_SporeSpawn_MaxXRadiusInY_A5E840:
    LDA.W $0000,Y : STA.L $7E7816 
    INY #2
    RTL 


UNUSED_Instruction_SporeSpawn_AngleDeltaInY_A5E84A:
    LDA.W $0000,Y : STA.L $7E7818 
    INY #2
    RTL 


UNUSED_Instruction_SporeSpawn_MaxXRadiusPlusY_A5E854:
    LDA.L $7E7816 : CLC : ADC.W $0000,Y : STA.L $7E7816 
    INY #2
    RTL 


UNUSED_Instruction_SporeSpawn_AngleDeltaPlusY_A5E863:
    LDA.L $7E7818 : CLC : ADC.W $0000,Y : STA.L $7E7818 
    INY #2
    RTL 
endif ; !FEATURE_KEEP_UNREFERENCED


Instruction_SporeSpawn_SporeGenerationFlagInY:
    LDA.W $0000,Y : STA.L $7E9000 
    INY #2
    RTL 


Instruction_SporeSpawn_Harden:
    LDA.W #$0080 : STA.W $0F7A 
    LDA.W #$0270 : STA.W $0F7E 
    LDA.W $0F86 
    ORA.W #$A000 
    AND.W #$FBFF 
    STA.W $0F86 
    RTL 


Instruction_SporeSpawn_QueueSFXInY_Lib2_Max6:
    PHX : PHY 
    LDA.W $0000,Y : JSL.L QueueSound_Lib2_Max6 
    PLY : PLX 
    INY #2
    RTL 


Instruction_SporeSpawn_QueueSFXInY_Lib3_Max6:
    PHX : PHY 
    LDA.W $0000,Y : JSL.L QueueSound_Lib3_Max6 
    PLY : PLX 
    INY #2
    RTL 


Instruction_SporeSpawn_CallSporeSpawnDeathItemDropRoutine:
    PHX : PHY 
    JSL.L SporeSpawnDeathItemDropRoutine 
    PLY : PLX 
    RTL 


Instruction_SporeSpawn_FunctionInY:
    PHY : PHX 
    LDX.W $0E54 
    LDA.W $0000,Y : STA.W $0FA8,X 
    PLX : PLY 
    INY #2
    RTL 


Instruction_SporeSpawn_LoadDeathSequencePalette:
    PHY : PHX 
    STY.B $12 
    LDA.W $0000,Y 
    TAY 
    LDX.W #$0000 

.loopSpritePalette1:
    LDA.W Palette_SporeSpawn_DeathSequence_0,Y : STA.L $7EC120,X 
    INY #2
    INX #2
    CPX.W #$0020 
    BNE .loopSpritePalette1 
    LDY.B $12 
    LDA.W $0000,Y 
    TAY 
    LDX.W #$0000 

.loopBG12Palette4:
    LDA.W Palette_SporeSpawn_DeathSequence_Level_0,Y : STA.L $7EC080,X 
    INY #2
    INX #2
    CPX.W #$0020 
    BNE .loopBG12Palette4 
    LDY.B $12 
    LDA.W $0000,Y 
    TAY 
    LDX.W #$0000 

Instruction_SporeSpawn_.loopBG12Palette7:
    LDA.W Palette_SporeSpawn_DeathSequence_Background_0,Y : STA.L $7EC0E0,X 
    INY #2
    INX #2
    CPX.W #$0020 
    BNE Instruction_SporeSpawn_.loopBG12Palette7 
    PLX : PLY 
    INY #2
    RTL 


Instruction_SporeSpawn_LoadDeathSequenceTargetPalette:
    PHY : PHX 
    STY.B $12 
    LDA.W $0000,Y 
    TAY 
    LDX.W #$0000 

.loopSpritePalette1:
    LDA.W Palette_SporeSpawn_DeathSequence_0,Y : STA.L $7EC320,X 
    INY #2
    INX #2
    CPX.W #$0020 
    BNE .loopSpritePalette1 
    LDY.B $12 
    LDA.W $0000,Y 
    TAY 
    LDX.W #$0000 

.loopBG12Palette4:
    LDA.W Palette_SporeSpawn_DeathSequence_Level_0,Y : STA.L $7EC280,X 
    INY #2
    INX #2
    CPX.W #$0020 
    BNE .loopBG12Palette4 
    LDY.B $12 
    LDA.W $0000,Y 
    TAY 
    LDX.W #$0000 

.loopBG12Palette7:
    LDA.W Palette_SporeSpawn_DeathSequence_Background_0,Y : STA.L $7EC2E0,X 
    INY #2
    INX #2
    CPX.W #$0020 
    BNE .loopBG12Palette7 
    PLX : PLY 
    INY #2
    RTL 


Instruction_SporeSpawn_SpawnHardeningDustCloud:
    PHY : PHX 
    JSL.L GenerateRandomNumber 
    LDA.W $05E5 : AND.W #$007F 
    SEC : SBC.W #$0040 : STA.B $12 
    LDA.W $0F7A : CLC : ADC.B $12 : STA.B $12 
    LDA.W $05E5 : AND.W #$7F00 
    XBA 
    SEC : SBC.W #$0040 : STA.B $14 
    LDA.W $0F7E : CLC : ADC.B $14 : STA.B $14 
    LDA.W #$0015 
    LDY.W #EnemyProjectile_MiscDust 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    LDA.W #$0029 : JSL.L QueueSound_Lib2_Max6 
    PLX : PLY 
    RTL 


Instruction_SporeSpawn_SpawnDyingExplosion:
    PHY : PHX 
    JSL.L GenerateRandomNumber 
    LDA.W $05E5 : AND.W #$007F 
    SEC : SBC.W #$0040 : STA.B $12 
    LDA.W $0F7A : CLC : ADC.B $12 : STA.B $12 
    LDA.W $05E5 : AND.W #$3F00 
    XBA 
    SEC : SBC.W #$0020 : STA.B $14 
    LDA.W $0F7E : CLC : ADC.B $14 : STA.B $14 
    LDA.W #$0003 : STA.B $16 
    STZ.B $18 
    JSL.L Create_Sprite_Object 
    LDA.W #$0025 : JSL.L QueueSound_Lib2_Max6 
    PLX : PLY 
    RTL 


SpawnSporeSpawnCeilingDustCloud:
    PHY : PHX 
    LDA.W $05B6 : AND.W #$000F 
    BNE .return 
    JSL.L GenerateRandomNumber 
    LDA.W $05E5 : AND.W #$003F 
    CLC : ADC.W #$0060 : STA.B $12 
    LDA.W $05E5 : AND.W #$0F00 
    XBA 
    CLC : ADC.W #$01E0 : STA.B $14 
    LDA.W #$0015 : STA.B $16 
    STZ.B $18 
    JSL.L Create_Sprite_Object 

.return:
    PLX : PLY 
    RTL 


InitAI_SporeSpawn:
    LDY.W #$0000 
    LDX.W #$0000 

.loopSpritePalette7:
    LDA.W Palette_SporeSpawn,Y : STA.L $7EC3E0,X 
    INY #2
    INX #2
    CPX.W #$0020 
    BNE .loopSpritePalette7 
    LDX.W $0E54 
    LDA.W #$0000 
    LDY.W #EnemyProjectile_SporeSpawnStalk 
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    LDA.W #$0001 
    LDY.W #EnemyProjectile_SporeSpawnStalk 
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    LDA.W #$0002 
    LDY.W #EnemyProjectile_SporeSpawnStalk 
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    LDA.W #$0003 
    LDY.W #EnemyProjectile_SporeSpawnStalk 
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    LDX.W $0E54 
    LDA.W $0F7A,X : STA.L $7E7808,X 
    LDA.W $0F7E,X : SEC : SBC.W #$0048 : STA.L $7E780A,X 
    LDA.W $0F7A,X : STA.W $0FAC,X 
    LDA.W $0F7E,X : STA.W $0FAE,X 
    STZ.W $0FB2,X 
    LDX.W $079F 
    LDA.L $7ED828,X : AND.W #$0002 
    BEQ .alive 
    LDA.W #InstList_SporeSpawn_Initial_Dead : STA.W $0F92 
    LDA.W #RTS_A5EB1A : STA.W $0FA8 
    LDA.W $0F86 : ORA.W #$8000 : STA.W $0F86 
    JSR.W UpdateSporeSpawnStalkSegmentPositions 
    JSL.L Spawn_Hardcoded_PLM 
    db $07,$1E 
    dw PLMEntries_clearSporeSpawnCeiling 
    STZ.W $07E9 
    RTL 


.alive:
    LDX.W $0E54 
    LDA.W #InstList_SporeSpawn_Initial_Alive : STA.W $0F92 
    LDA.W #$FFFF : STA.W $183C 
    LDX.W $0E54 
    LDA.W #RTS_A5EB1A : STA.W $0FA8,X 
    LDA.W #ScrollingFinishedHook_SporeSpawnFight : STA.W $07E9 
    LDA.W $0F7E,X : SEC : SBC.W #$0080 : STA.W $0F7E,X 
    LDA.W #$0000 
    LDY.W #EnemyProjectile_SporeSpawnSporeSpawner 
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    LDA.W #$0001 
    LDY.W #EnemyProjectile_SporeSpawnSporeSpawner 
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    LDA.W #$0002 
    LDY.W #EnemyProjectile_SporeSpawnSporeSpawner 
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    LDA.W #$0003 
    LDY.W #EnemyProjectile_SporeSpawnSporeSpawner 
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    JSR.W UpdateSporeSpawnStalkSegmentPositions 
    RTL 


MainAI_SporeSpawn:
    LDX.W $0E54 
    JSR.W ($0FA8,X) 
    RTL 


RTS_A5EB1A:
    RTS 


Function_SporeSpawn_Descent:
    JSR.W UpdateSporeSpawnStalkSegmentPositions 
    LDX.W $0E54 
    LDA.W $0F7E,X : CLC : ADC.W #$0001 : STA.W $0F7E,X 
    CMP.W #$0270 : BMI .descending 
    LDA.W #InstList_SporeSpawn_FightHasStarted : STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 

.descending:
    LDA.W #$0030 : STA.L $7E7816 
    LDA.W #$0001 : STA.L $7E7818 
    LDA.W #$00C0 : STA.L $7E7814 
    RTS 


Function_SporeSpawn_Moving:
    JSR.W UpdateSporeSpawnStalkSegmentPositions 
    LDA.L $7E7816 : STA.W $0E32 
    LDA.L $7E7814 : JSL.L EightBitCosineMultiplication_A0B0B2 
    CLC : ADC.W $0FAC,X : STA.W $0F7A,X 
    LDA.L $7E7816 : SEC : SBC.W #$0010 : STA.W $0E32 
    LDA.L $7E7814 : SEC : SBC.W #$0040 : ASL A 
    JSL.L EightBitNegativeSineMultiplication_A0B0C6 
    CLC : ADC.W $0FAE,X : STA.W $0F7E,X 
    LDA.L $7E7814 : CLC : ADC.L $7E7818 : AND.W #$00FF 
    STA.L $7E7814 
    RTS 


Function_SporeSpawn_SetupDeath:
    LDX.W $0E54 
    LDA.W #$0080 : SEC : SBC.W $0F7A : STA.B $12 
    LDA.W #$0270 : SEC : SBC.W $0F7E : STA.B $14 
    JSL.L CalculateAngleOf_12_14_Offset 
    SEC : SBC.W #$0040 : EOR.W #$FFFF 
    INC A 
    AND.W #$00FF 
    STA.L $7E8806 
    LDA.W #$0001 : STA.B $14 
    LDA.L $7E8806 : AND.W #$00FF : STA.B $12 
    JSL.L Do_Some_Math_With_Sine_Cosine_Terrible_Label_Name ; ($16.$18, $1A.$1C) = ([$14] * |cos([$12] * pi / 80h)|, [$14] * |sin([$12] * pi / 80h)|)
    LDA.B $16 : STA.L $7E8010,X 
    LDA.B $18 : STA.L $7E8012,X 
    LDA.B $1A : STA.L $7E8014,X 
    LDA.B $1C : STA.L $7E8016,X 
    RTS 


Function_SporeSpawn_Dying:
    LDX.W $0E54 
    LDA.L $7E8010,X : STA.W $0E24 
    LDA.L $7E8012,X : STA.W $0E26 
    LDA.L $7E8014,X : STA.W $0E28 
    LDA.L $7E8016,X : STA.W $0E2A 
    LDA.L $7E8806 : AND.W #$00FF : STA.W $0E20 
    JSL.L MoveEnemyAccordingToAngleAndXYSpeeds 
    LDA.W $0F7A : SEC : SBC.W #$0080 : JSL.L NegateA_A0B067 
    CMP.W #$0008 : BPL .notDone 
    LDA.W $0F7E : SEC : SBC.W #$0270 : JSL.L NegateA_A0B067 
    CMP.W #$0008 : BPL .notDone 
    LDA.W #RTS_A5EB1A : STA.W $0FA8 

.notDone:
    JSR.W UpdateSporeSpawnStalkSegmentPositions 
    JSL.L SpawnSporeSpawnCeilingDustCloud 
    RTS 


UpdateSporeSpawnStalkSegmentPositions:
    LDA.W $0F7A : SEC : SBC.L $7E7808 : BPL .positiveX 
    EOR.W #$FFFF 
    INC A 
    LSR A 
    STA.B $12 
    LSR A 
    STA.B $14 
    CLC : ADC.B $12 : STA.B $16 
    LDA.W #$0080 : STA.W $1A67 
    LDA.L $7E7808 : SEC : SBC.B $14 : STA.W $1A69 
    STA.L $7E8000 
    LDA.L $7E7808 : SEC : SBC.B $12 : STA.W $1A6B 
    STA.L $7E8002 
    LDA.L $7E7808 : SEC : SBC.B $16 : STA.W $1A6D 
    STA.L $7E8004 
    BRA .checkY 


.positiveX:
    LSR A 
    STA.B $12 
    LSR A 
    STA.B $14 
    CLC : ADC.B $12 : STA.B $16 
    LDA.W #$0080 : STA.W $1A67 
    LDA.B $14 : CLC : ADC.L $7E7808 : STA.W $1A69 
    STA.L $7E8000 
    LDA.B $12 : CLC : ADC.L $7E7808 : STA.W $1A6B 
    STA.L $7E8002 
    LDA.B $16 : CLC : ADC.L $7E7808 : STA.W $1A6D 
    STA.L $7E8004 

.checkY:
    LDA.W $0F7E : SEC : SBC.W #$0028 : SEC : SBC.L $7E780A : BPL .positiveY 
    EOR.W #$FFFF 
    INC A 
    LSR A 
    STA.B $12 
    LSR A 
    STA.B $14 
    CLC : ADC.B $12 : STA.B $16 
    LDA.W #$0230 : STA.W $1AAF 
    LDA.L $7E780A : SEC : SBC.B $14 : STA.W $1AB1 
    STA.L $7E8006 
    LDA.L $7E780A : SEC : SBC.B $12 : STA.W $1AB3 
    STA.L $7E8008 
    LDA.L $7E780A : SEC : SBC.B $16 : STA.W $1AB5 
    STA.L $7E800A 
    BRA .return 


.positiveY:
    LSR A 
    STA.B $12 
    LSR A 
    STA.B $14 
    CLC : ADC.B $12 : STA.B $16 
    LDA.W #$0230 : STA.W $1AAF 
    LDA.B $14 : CLC : ADC.L $7E780A : STA.W $1AB1 
    STA.L $7E8006 
    LDA.B $12 : CLC : ADC.L $7E780A : STA.W $1AB3 
    STA.L $7E8008 
    LDA.B $16 : CLC : ADC.L $7E780A : STA.W $1AB5 
    STA.L $7E800A 

.return:
    RTS 


EnemyShot_SporeSpawn_Vulnerable:
    LDA.W $18A6 
    ASL A 
    TAX 
    LDA.W $0C18,X : BIT.W #$0700 
    BNE .notBeam 
    BIT.W #$0010 
    BNE .notBeam 
    RTL 


.notBeam:
    JSL.L NormalEnemyShotAI_NoDeathCheck 
    LDA.W $0F9C,X : BEQ EnemyShot_SporeSpawn 
    LDA.W #Function_SporeSpawn_Moving : STA.W $0FA8,X 
    LDY.W #$0002 
    LDA.W $0F8C,X : CMP.W #$0190 : BPL .noSpeedUp 
    LDA.L $7E7818 : BPL .negativeAngleDelta 
    TYA 
    EOR.W #$FFFF 
    INC A 
    TAY 

.negativeAngleDelta:
    TYA 
    STA.L $7E7818 

.noSpeedUp:
    LDA.L $7E801E : BNE EnemyShot_SporeSpawn 
    LDA.L $7E7818 
    EOR.W #$FFFF 
    INC A 
    STA.L $7E7818 
    LDA.W #$0001 : STA.L $7E801E 
    LDA.W #InstList_SporeSpawn_CloseAndMove : STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    LDY.W #$0060 
    LDA.W $0F8C,X : CMP.W #$0046 : BMI .paletteChosen 
    LDY.W #$0040 : CMP.W #$019A : BMI .paletteChosen 
    LDY.W #$0020 : CMP.W #$0302 : BMI .paletteChosen 
    LDY.W #$0000 

.paletteChosen:
    CMP.L $7E8800 : BEQ EnemyShot_SporeSpawn 
    STA.L $7E8800 
    TYA 
    JSL.L LoadSporeSpawnHealthBasedPalette 

EnemyShot_SporeSpawn:
    BRA SporeSpawnReaction_Common 


EnemyTouch_SporeSpawn:
    JSL.L NormalEnemyTouchAI_NoDeathCheck_External 
    BRA SporeSpawnReaction_Common 


PowerBombReaction_SporeSpawn:
    RTL ; >.<


SporeSpawnReaction_Common:
    LDX.W $0E54 
    LDA.W $0F8C,X : BNE .return 
    LDX.W $0E54 
    LDA.W #$0000 : STA.L $7E781C 
    STZ.W $0FA0,X 
    STZ.W $0F9C,X 
    STZ.W $0F8A,X 
    LDA.W $0F86,X : ORA.W #$0400 : STA.W $0F86,X 
    LDY.W #$001A 
    LDA.W #$0000 

.loopClearProjectiles:
    STA.W $1997,Y 
    DEY #2
    BPL .loopClearProjectiles 
    LDA.W #InstList_SporeSpawn_DeathSequence_0 : STA.W $0F92 
    LDA.W #$0001 : STA.W $0F94 
    LDX.W $079F 
    LDA.L $7ED828,X : ORA.W #$0002 : STA.L $7ED828,X 
    STZ.W $07E9 
    JSL.L Spawn_Hardcoded_PLM 
    db $07,$1E 
    dw PLMEntries_crumbleSporeSpawnCeiling 

.return:
    RTL 


LoadSporeSpawnHealthBasedPalette:
    PHY : PHX 
    STA.B $12 
    TAY 
    LDX.W #$0000 

.loopSpritePalette1:
    LDA.W Palette_SporeSpawn_HealthBased_0,Y : STA.L $7EC120,X 
    INY #2
    INX #2
    CPX.W #$0020 
    BNE .loopSpritePalette1 
    PLX : PLY 
    RTL 


ExtendedSpritemap_SporeSpawn_Dead:
    dw $0001 
    dw $0000,$0000 
    dw Spritemap_SporeSpawn_0 
    dw Hitbox_SporeSpawn_0 

ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_0:
    dw $0001,$0000,$0000 
    dw Spritemap_SporeSpawn_0 
    dw Hitbox_SporeSpawn_1 

ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_1:
    dw $0002,$0000,$0000 
    dw Spritemap_SporeSpawn_1 
    dw Hitbox_SporeSpawn_2 
    dw $0000,$0000 
    dw Spritemap_SporeSpawn_B 
    dw Hitbox_SporeSpawn_B 

ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_2:
    dw $0002,$0000,$0000 
    dw Spritemap_SporeSpawn_2 
    dw Hitbox_SporeSpawn_3 
    dw $0000,$0000 
    dw Spritemap_SporeSpawn_C 
    dw Hitbox_SporeSpawn_C 

ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_3:
    dw $0002,$0000,$0000 
    dw Spritemap_SporeSpawn_3 
    dw Hitbox_SporeSpawn_4 
    dw $0000,$0000 
    dw Spritemap_SporeSpawn_D 
    dw Hitbox_SporeSpawn_D 

ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_4:
    dw $0002,$0000,$0000 
    dw Spritemap_SporeSpawn_4 
    dw Hitbox_SporeSpawn_5 
    dw $0000,$0000 
    dw Spritemap_SporeSpawn_C 
    dw Hitbox_SporeSpawn_C 

ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_5:
    dw $0002,$0000,$0000 
    dw Spritemap_SporeSpawn_5 
    dw Hitbox_SporeSpawn_6 
    dw $0000,$0000 
    dw Spritemap_SporeSpawn_B 
    dw Hitbox_SporeSpawn_B 

ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_6:
    dw $0002,$0000,$0000 
    dw Spritemap_SporeSpawn_15 
    dw Hitbox_SporeSpawn_13 
    dw $0000,$0000 
    dw Spritemap_SporeSpawn_C 
    dw Hitbox_SporeSpawn_C 

ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_7:
    dw $0002,$0000,$0000 
    dw Spritemap_SporeSpawn_16 
    dw Hitbox_SporeSpawn_14 
    dw $0000,$0000 
    dw Spritemap_SporeSpawn_D 
    dw Hitbox_SporeSpawn_D 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ExtendedSpritemap_SporeSpawn_A5EEF7:
    dw $0001,$0000,$0000 
    dw Spritemap_SporeSpawn_F 
    dw Hitbox_SporeSpawn_F 

UNUSED_ExtendedSpritemap_SporeSpawn_A5EF01:
    dw $0001,$0000,$0000 
    dw Spritemap_SporeSpawn_10 
    dw Hitbox_SporeSpawn_10 

UNUSED_ExtendedSpritemap_SporeSpawn_A5EF0B:
    dw $0001,$0000,$0000 
    dw Spritemap_SporeSpawn_11 
    dw Hitbox_SporeSpawn_11 

UNUSED_ExtendedSpritemap_SporeSpawn_A5EF15:
    dw $0001,$0000,$0000 
    dw Spritemap_SporeSpawn_12 
    dw Hitbox_SporeSpawn_12 

UNUSED_ExtendedSpritemap_SporeSpawn_A5EF1F:
    dw $0001,$0000,$0000 
    dw Spritemap_SporeSpawn_13 
    dw Hitbox_SporeSpawn_13 

UNUSED_ExtendedSpritemap_SporeSpawn_A5EF29:
    dw $0001,$0000,$0000 
    dw Spritemap_SporeSpawn_14 
    dw Hitbox_SporeSpawn_13 

UNUSED_ExtendedSpritemap_SporeSpawn_A5EF33:
    dw $0001,$0000,$0000 
    dw Spritemap_SporeSpawn_E 
    dw Hitbox_SporeSpawn_E 
endif ; !FEATURE_KEEP_UNREFERENCED

ExtendedSpritemap_SporeSpawn_FullyOpen_0:
    dw $0002,$0000,$0000 
    dw Spritemap_SporeSpawn_16 
    dw Hitbox_SporeSpawn_14 
    dw $0000,$0000 
    dw Spritemap_SporeSpawn_B 
    dw Hitbox_SporeSpawn_B 

ExtendedSpritemap_SporeSpawn_FullyOpen_1:
    dw $0002,$0000,$0000 
    dw Spritemap_SporeSpawn_16 
    dw Hitbox_SporeSpawn_14 
    dw $0000,$0000 
    dw Spritemap_SporeSpawn_C 
    dw Hitbox_SporeSpawn_C 

ExtendedSpritemap_SporeSpawn_FullyOpen_2:
    dw $0002,$0000,$0000 
    dw Spritemap_SporeSpawn_16 
    dw Hitbox_SporeSpawn_14 
    dw $0000,$0000 
    dw Spritemap_SporeSpawn_D 
    dw Hitbox_SporeSpawn_D 

Hitbox_SporeSpawn_0:
    dw $0002,$FFD7,$FFE2,$0029,$001E 
    dw RTL_A5804C 
    dw CommonA5_CreateADudShot 
    dw $FFF0,$FFD3,$000F,$FFE2 
    dw RTL_A5804C 
    dw CommonA5_CreateADudShot 

Hitbox_SporeSpawn_1:
    dw $0002,$FFD7,$FFE2,$0029,$001E 
    dw EnemyTouch_SporeSpawn 
    dw CommonA5_CreateADudShot 
    dw $FFF0,$FFD3,$000F,$FFE2 
    dw EnemyTouch_SporeSpawn 
    dw CommonA5_CreateADudShot 

Hitbox_SporeSpawn_2:
    dw $0002,$FFD4,$FFDD,$002B,$0021 
    dw EnemyTouch_SporeSpawn 
    dw CommonA5_CreateADudShot 
    dw $FFF0,$FFCF,$000F,$FFDD 
    dw EnemyTouch_SporeSpawn 
    dw CommonA5_CreateADudShot 

Hitbox_SporeSpawn_3:
    dw $0004,$FFD3,$FFDA,$002C,$FFF7 
    dw EnemyTouch_SporeSpawn 
    dw CommonA5_CreateADudShot 
    dw $FFD3,$0008,$002C,$0023 
    dw EnemyTouch_SporeSpawn 
    dw CommonA5_CreateADudShot 
    dw $FFF1,$FFE8,$000E,$0017 
    dw EnemyTouch_SporeSpawn 
    dw EnemyShot_SporeSpawn_Vulnerable 
    dw $FFF0,$FFCA,$0010,$FFEA 
    dw EnemyTouch_SporeSpawn 
    dw CommonA5_CreateADudShot 

Hitbox_SporeSpawn_4:
    dw $0004,$FFD5,$FFD4,$002A,$FFF3 
    dw EnemyTouch_SporeSpawn 
    dw CommonA5_CreateADudShot 
    dw $FFD4,$000C,$002A,$002A 
    dw EnemyTouch_SporeSpawn 
    dw CommonA5_CreateADudShot 
    dw $FFF1,$FFE8,$000E,$0017 
    dw EnemyTouch_SporeSpawn 
    dw EnemyShot_SporeSpawn_Vulnerable 
    dw $FFF0,$FFC6,$0010,$FFD6 
    dw EnemyTouch_SporeSpawn 
    dw CommonA5_CreateADudShot 

Hitbox_SporeSpawn_5:
    dw $0004,$FFD3,$FFD1,$002C,$FFEF 
    dw EnemyTouch_SporeSpawn 
    dw CommonA5_CreateADudShot 
    dw $FFD4,$0010,$002B,$002E 
    dw EnemyTouch_SporeSpawn 
    dw CommonA5_CreateADudShot 
    dw $FFF1,$FFE8,$000E,$0017 
    dw EnemyTouch_SporeSpawn 
    dw EnemyShot_SporeSpawn_Vulnerable 
    dw $FFF0,$FFC2,$0010,$FFD3 
    dw EnemyTouch_SporeSpawn 
    dw CommonA5_CreateADudShot 

Hitbox_SporeSpawn_6:
    dw $0004,$FFD4,$FFCE,$002D,$FFEB 
    dw EnemyTouch_SporeSpawn 
    dw CommonA5_CreateADudShot 
    dw $FFD5,$0014,$002B,$0032 
    dw EnemyTouch_SporeSpawn 
    dw CommonA5_CreateADudShot 
    dw $FFF1,$FFE8,$000E,$0017 
    dw EnemyTouch_SporeSpawn 
    dw EnemyShot_SporeSpawn_Vulnerable 
    dw $FFF0,$FFC0,$0010,$FFD0 
    dw EnemyTouch_SporeSpawn 
    dw CommonA5_CreateADudShot 

Hitbox_SporeSpawn_7:
    dw $0002,$FFD2,$FFDD,$002C,$0023 
    dw EnemyTouch_SporeSpawn 
    dw CommonA5_CreateADudShot 
    dw $FFF0,$FFD0,$0010,$FFE0 
    dw EnemyTouch_SporeSpawn 
    dw CommonA5_CreateADudShot 

Hitbox_SporeSpawn_8:
    dw $0004,$FFD3,$FFD9,$002D,$FFF7 
    dw EnemyTouch_SporeSpawn 
    dw CommonA5_CreateADudShot 
    dw $FFD4,$0008,$002C,$0026 
    dw EnemyTouch_SporeSpawn 
    dw CommonA5_CreateADudShot 
    dw $FFF1,$FFE8,$000E,$0017 
    dw EnemyTouch_SporeSpawn 
    dw EnemyShot_SporeSpawn_Vulnerable 
    dw $FFF0,$FFCA,$0010,$FFE0 
    dw EnemyTouch_SporeSpawn 
    dw CommonA5_CreateADudShot 

Hitbox_SporeSpawn_9:
    dw $0004,$FFD3,$FFD4,$002D,$FFF3 
    dw EnemyTouch_SporeSpawn 
    dw CommonA5_CreateADudShot 
    dw $FFD6,$000C,$002A,$002B 
    dw EnemyTouch_SporeSpawn 
    dw CommonA5_CreateADudShot 
    dw $FFF1,$FFE8,$000E,$0017 
    dw EnemyTouch_SporeSpawn 
    dw EnemyShot_SporeSpawn_Vulnerable 
    dw $FFF0,$FFC6,$0010,$FFE0 
    dw EnemyTouch_SporeSpawn 
    dw CommonA5_CreateADudShot 

Hitbox_SporeSpawn_A:
    dw $0004,$FFD4,$FFD1,$0029,$FFEF 
    dw EnemyTouch_SporeSpawn 
    dw CommonA5_CreateADudShot 
    dw $FFD4,$0010,$002C,$002D 
    dw EnemyTouch_SporeSpawn 
    dw CommonA5_CreateADudShot 
    dw $FFF1,$FFE8,$000E,$0017 
    dw EnemyTouch_SporeSpawn 
    dw EnemyShot_SporeSpawn_Vulnerable 
    dw $FFF0,$FFC3,$0010,$FFD2 
    dw EnemyTouch_SporeSpawn 
    dw CommonA5_CreateADudShot 

Hitbox_SporeSpawn_B:
    dw $0001,$FFF1,$FFE8,$000E,$0017 
    dw EnemyTouch_SporeSpawn 
    dw EnemyShot_SporeSpawn_Vulnerable 

Hitbox_SporeSpawn_C:
    dw $0001,$FFF1,$FFE8,$000E,$0017 
    dw EnemyTouch_SporeSpawn 
    dw EnemyShot_SporeSpawn_Vulnerable 

Hitbox_SporeSpawn_D:
    dw $0001,$FFF1,$FFE8,$000E,$0017 
    dw EnemyTouch_SporeSpawn 
    dw CommonA5_CreateADudShot 

Hitbox_SporeSpawn_E:
    dw $0001,$FFF8,$FFF8,$0007,$0007 
    dw EnemyTouch_SporeSpawn 
    dw CommonA5_CreateADudShot 

Hitbox_SporeSpawn_F:
    dw $0001,$FFF8,$FFF8,$0007,$0006 
    dw EnemyTouch_SporeSpawn 
    dw CommonA5_CreateADudShot 

Hitbox_SporeSpawn_10:
    dw $0001,$FFF8,$FFF8,$0007,$0006 
    dw EnemyTouch_SporeSpawn 
    dw CommonA5_CreateADudShot 

Hitbox_SporeSpawn_11:
    dw $0001,$FFF8,$FFF8,$0007,$0006 
    dw EnemyTouch_SporeSpawn 
    dw EnemyShot_SporeSpawn_Vulnerable 

Hitbox_SporeSpawn_12:
    dw $0001,$FFFC,$FFFC,$0003,$0003 
    dw EnemyTouch_SporeSpawn 
    dw EnemyShot_SporeSpawn_Vulnerable 

Hitbox_SporeSpawn_13:
    dw $0004,$FFD4,$FFCB,$002C,$FFE9 
    dw EnemyTouch_SporeSpawn 
    dw CommonA5_CreateADudShot 
    dw $FFD4,$0016,$002B,$0034 
    dw EnemyTouch_SporeSpawn 
    dw CommonA5_CreateADudShot 
    dw $FFF1,$FFE8,$000E,$0017 
    dw EnemyTouch_SporeSpawn 
    dw EnemyShot_SporeSpawn_Vulnerable 
    dw $FFF0,$FFBC,$0010,$FFD0 
    dw EnemyTouch_SporeSpawn 
    dw CommonA5_CreateADudShot 

Hitbox_SporeSpawn_14:
    dw $0004,$FFD4,$FFC9,$002B,$FFE7 
    dw EnemyTouch_SporeSpawn 
    dw CommonA5_CreateADudShot 
    dw $FFD3,$0018,$002B,$0037 
    dw EnemyTouch_SporeSpawn 
    dw CommonA5_CreateADudShot 
    dw $FFF1,$FFE7,$000E,$0018 
    dw EnemyTouch_SporeSpawn 
    dw EnemyShot_SporeSpawn_Vulnerable 
    dw $FFF0,$FFBB,$0010,$FFD0 
    dw EnemyTouch_SporeSpawn 
    dw CommonA5_CreateADudShot 

Spritemap_SporeSpawn_0:
    dw $001A,$8000 
    db $F0 
    dw $6124,$8010 
    db $F0 
    dw $6122,$8020 
    db $F0 
    dw $6120,$8000 
    db $E0 
    dw $6104,$8010 
    db $E0 
    dw $6102,$8020 
    db $E0 
    dw $6100,$81F0 
    db $F0 
    dw $2124,$81E0 
    db $F0 
    dw $2122,$81D0 
    db $F0 
    dw $2120,$81F0 
    db $E0 
    dw $2104,$81E0 
    db $E0 
    dw $2102,$81D0 
    db $E0 
    dw $2100,$8000 
    db $D2 
    dw $6142,$81F0 
    db $D2 
    dw $2142,$8000 
    db $10 
    dw $614E,$8010 
    db $10 
    dw $614C,$8020 
    db $10 
    dw $614A,$8000 
    db $00 
    dw $6148,$8010 
    db $00 
    dw $6146,$8020 
    db $00 
    dw $6144,$81F0 
    db $10 
    dw $214E,$81E0 
    db $10 
    dw $214C,$81D0 
    db $10 
    dw $214A,$81F0 
    db $00 
    dw $2148,$81E0 
    db $00 
    dw $2146,$81D0 
    db $00 
    dw $2144 

Spritemap_SporeSpawn_1:
    dw $001E,$8000 
    db $EC 
    dw $6124,$8010 
    db $EC 
    dw $6122,$8020 
    db $EC 
    dw $6120,$8000 
    db $DC 
    dw $6104,$8010 
    db $DC 
    dw $6102,$8020 
    db $DC 
    dw $6100,$81F0 
    db $EC 
    dw $2124,$81E0 
    db $EC 
    dw $2122,$81D0 
    db $EC 
    dw $2120,$81F0 
    db $DC 
    dw $2104,$81E0 
    db $DC 
    dw $2102,$81D0 
    db $DC 
    dw $2100,$8000 
    db $CE 
    dw $6142,$81F0 
    db $CE 
    dw $2142,$8000 
    db $14 
    dw $614E,$8010 
    db $14 
    dw $614C,$8020 
    db $14 
    dw $614A,$8000 
    db $04 
    dw $6148,$8010 
    db $04 
    dw $6146,$8020 
    db $04 
    dw $6144,$81F0 
    db $14 
    dw $214E,$81E0 
    db $14 
    dw $214C,$81D0 
    db $14 
    dw $214A,$81F0 
    db $04 
    dw $2148,$81E0 
    db $04 
    dw $2146,$81D0 
    db $04 
    dw $2144,$0010 
    db $FC 
    dw $613F,$0024 
    db $FC 
    dw $613F,$01D4 
    db $FC 
    dw $213F,$01E8 
    db $FC 
    dw $213F 

Spritemap_SporeSpawn_2:
    dw $0022,$8000 
    db $E8 
    dw $6124,$8010 
    db $E8 
    dw $6122,$8020 
    db $E8 
    dw $6120,$8000 
    db $D8 
    dw $6104,$8010 
    db $D8 
    dw $6102,$8020 
    db $D8 
    dw $6100,$81F0 
    db $E8 
    dw $2124,$81E0 
    db $E8 
    dw $2122,$81D0 
    db $E8 
    dw $2120,$81F0 
    db $D8 
    dw $2104,$81E0 
    db $D8 
    dw $2102,$81D0 
    db $D8 
    dw $2100,$8000 
    db $CA 
    dw $6142,$81F0 
    db $CA 
    dw $2142,$0024 
    db $00 
    dw $6161,$000E 
    db $00 
    dw $6161,$01EA 
    db $00 
    dw $2161,$01D5 
    db $00 
    dw $2161,$0024 
    db $F8 
    dw $6160,$000E 
    db $F8 
    dw $6160,$01EA 
    db $F8 
    dw $2160,$01D5 
    db $F8 
    dw $2160,$8000 
    db $18 
    dw $614E,$8010 
    db $18 
    dw $614C,$8020 
    db $18 
    dw $614A,$8000 
    db $08 
    dw $6148,$8010 
    db $08 
    dw $6146,$8020 
    db $08 
    dw $6144,$81F0 
    db $18 
    dw $214E,$81E0 
    db $18 
    dw $214C,$81D0 
    db $18 
    dw $214A,$81F0 
    db $08 
    dw $2148,$81E0 
    db $08 
    dw $2146,$81D0 
    db $08 
    dw $2144 

Spritemap_SporeSpawn_3:
    dw $0022,$8000 
    db $E4 
    dw $6124,$8010 
    db $E4 
    dw $6122,$8020 
    db $E4 
    dw $6120,$8000 
    db $D4 
    dw $6104,$8010 
    db $D4 
    dw $6102,$8020 
    db $D4 
    dw $6100,$81F0 
    db $E4 
    dw $2124,$81E0 
    db $E4 
    dw $2122,$81D0 
    db $E4 
    dw $2120,$81F0 
    db $D4 
    dw $2104,$81E0 
    db $D4 
    dw $2102,$81D0 
    db $D4 
    dw $2100,$8000 
    db $C6 
    dw $6142,$81F0 
    db $C6 
    dw $2142,$0020 
    db $04 
    dw $6163,$000C 
    db $04 
    dw $6163,$01EC 
    db $04 
    dw $2163,$01D8 
    db $04 
    dw $2163,$0020 
    db $F4 
    dw $6162,$000C 
    db $F4 
    dw $6162,$01EC 
    db $F4 
    dw $2162,$01D8 
    db $F4 
    dw $2162,$8000 
    db $1C 
    dw $614E,$8010 
    db $1C 
    dw $614C,$8020 
    db $1C 
    dw $614A,$8000 
    db $0C 
    dw $6148,$8010 
    db $0C 
    dw $6146,$8020 
    db $0C 
    dw $6144,$81F0 
    db $1C 
    dw $214E,$81E0 
    db $1C 
    dw $214C,$81D0 
    db $1C 
    dw $214A,$81F0 
    db $0C 
    dw $2148,$81E0 
    db $0C 
    dw $2146,$81D0 
    db $0C 
    dw $2144 

Spritemap_SporeSpawn_4:
    dw $0022,$8000 
    db $D0 
    dw $6104,$8010 
    db $D0 
    dw $6102,$8020 
    db $D0 
    dw $6100,$81F0 
    db $D0 
    dw $2104,$81E0 
    db $D0 
    dw $2102,$81D0 
    db $D0 
    dw $2100,$8000 
    db $E0 
    dw $6124,$8010 
    db $E0 
    dw $6122,$8020 
    db $E0 
    dw $6120,$81F0 
    db $E0 
    dw $2124,$81E0 
    db $E0 
    dw $2122,$81D0 
    db $E0 
    dw $2120,$8000 
    db $C2 
    dw $6142,$81F0 
    db $C2 
    dw $2142,$001F 
    db $08 
    dw $6165,$000B 
    db $08 
    dw $6165,$01ED 
    db $08 
    dw $2165,$01D9 
    db $08 
    dw $2165,$001F 
    db $F0 
    dw $6164,$000B 
    db $F0 
    dw $6164,$01ED 
    db $F0 
    dw $2164,$01D9 
    db $F0 
    dw $2164,$8000 
    db $20 
    dw $614E,$8010 
    db $20 
    dw $614C,$8020 
    db $20 
    dw $614A,$8000 
    db $10 
    dw $6148,$8010 
    db $10 
    dw $6146,$8020 
    db $10 
    dw $6144,$81F0 
    db $20 
    dw $214E,$81E0 
    db $20 
    dw $214C,$81D0 
    db $20 
    dw $214A,$81F0 
    db $10 
    dw $2148,$81E0 
    db $10 
    dw $2146,$81D0 
    db $10 
    dw $2144 

Spritemap_SporeSpawn_5:
    dw $001A,$8000 
    db $CC 
    dw $6104,$8010 
    db $CC 
    dw $6102,$8020 
    db $CC 
    dw $6100,$81F0 
    db $CC 
    dw $2104,$81E0 
    db $CC 
    dw $2102,$81D0 
    db $CC 
    dw $2100,$8000 
    db $BE 
    dw $6142,$81F0 
    db $BE 
    dw $2142,$8000 
    db $24 
    dw $614E,$8010 
    db $24 
    dw $614C,$8020 
    db $24 
    dw $614A,$8000 
    db $14 
    dw $6148,$8010 
    db $14 
    dw $6146,$8020 
    db $14 
    dw $6144,$81F0 
    db $24 
    dw $214E,$81E0 
    db $24 
    dw $214C,$81D0 
    db $24 
    dw $214A,$81F0 
    db $14 
    dw $2148,$81E0 
    db $14 
    dw $2146,$81D0 
    db $14 
    dw $2144,$8000 
    db $DC 
    dw $6124,$8010 
    db $DC 
    dw $6122,$8020 
    db $DC 
    dw $6120,$81F0 
    db $DC 
    dw $2124,$81E0 
    db $DC 
    dw $2122,$81D0 
    db $DC 
    dw $2120 

Spritemap_SporeSpawn_6:
    dw $001A,$8000 
    db $DC 
    dw $6104,$8010 
    db $DC 
    dw $6102,$8020 
    db $DC 
    dw $6100,$81F0 
    db $DC 
    dw $2104,$81E0 
    db $DC 
    dw $2102,$81D0 
    db $DC 
    dw $2100,$8000 
    db $CE 
    dw $6142,$81F0 
    db $CE 
    dw $2142,$8000 
    db $14 
    dw $614E,$8010 
    db $14 
    dw $614C,$8020 
    db $14 
    dw $614A,$8000 
    db $04 
    dw $6148,$8010 
    db $04 
    dw $6146,$8020 
    db $04 
    dw $6144,$81F0 
    db $14 
    dw $214E,$81E0 
    db $14 
    dw $214C,$81D0 
    db $14 
    dw $214A,$81F0 
    db $04 
    dw $2148,$81E0 
    db $04 
    dw $2146,$81D0 
    db $04 
    dw $2144,$8000 
    db $EC 
    dw $6124,$8010 
    db $EC 
    dw $6122,$8020 
    db $EC 
    dw $6120,$81F0 
    db $EC 
    dw $2124,$81E0 
    db $EC 
    dw $2122,$81D0 
    db $EC 
    dw $2120 

Spritemap_SporeSpawn_7:
    dw $001A,$8000 
    db $D8 
    dw $6104,$8010 
    db $D8 
    dw $6102,$8020 
    db $D8 
    dw $6100,$81F0 
    db $D8 
    dw $2104,$81E0 
    db $D8 
    dw $2102,$81D0 
    db $D8 
    dw $2100,$8000 
    db $CA 
    dw $6142,$81F0 
    db $CA 
    dw $2142,$8000 
    db $18 
    dw $614E,$8010 
    db $18 
    dw $614C,$8020 
    db $18 
    dw $614A,$8000 
    db $08 
    dw $6148,$8010 
    db $08 
    dw $6146,$8020 
    db $08 
    dw $6144,$81F0 
    db $18 
    dw $214E,$81E0 
    db $18 
    dw $214C,$81D0 
    db $18 
    dw $214A,$81F0 
    db $08 
    dw $2148,$81E0 
    db $08 
    dw $2146,$81D0 
    db $08 
    dw $2144,$8000 
    db $E8 
    dw $6124,$8010 
    db $E8 
    dw $6122,$8020 
    db $E8 
    dw $6120,$81F0 
    db $E8 
    dw $2124,$81E0 
    db $E8 
    dw $2122,$81D0 
    db $E8 
    dw $2120 

Spritemap_SporeSpawn_8:
    dw $001A,$8000 
    db $E4 
    dw $6124,$8010 
    db $E4 
    dw $6122,$8020 
    db $E4 
    dw $6120,$8000 
    db $D4 
    dw $6104,$8010 
    db $D4 
    dw $6102,$8020 
    db $D4 
    dw $6100,$81F0 
    db $E4 
    dw $2124,$81E0 
    db $E4 
    dw $2122,$81D0 
    db $E4 
    dw $2120,$81F0 
    db $D4 
    dw $2104,$81E0 
    db $D4 
    dw $2102,$81D0 
    db $D4 
    dw $2100,$8000 
    db $C6 
    dw $6142,$81F0 
    db $C6 
    dw $2142,$8000 
    db $1C 
    dw $614E,$8010 
    db $1C 
    dw $614C,$8020 
    db $1C 
    dw $614A,$8000 
    db $0C 
    dw $6148,$8010 
    db $0C 
    dw $6146,$8020 
    db $0C 
    dw $6144,$81F0 
    db $1C 
    dw $214E,$81E0 
    db $1C 
    dw $214C,$81D0 
    db $1C 
    dw $214A,$81F0 
    db $0C 
    dw $2148,$81E0 
    db $0C 
    dw $2146,$81D0 
    db $0C 
    dw $2144 

Spritemap_SporeSpawn_A:
    dw $001A,$8000 
    db $E0 
    dw $6124,$8010 
    db $E0 
    dw $6122,$8020 
    db $E0 
    dw $6120,$8000 
    db $D0 
    dw $6104,$8010 
    db $D0 
    dw $6102,$8020 
    db $D0 
    dw $6100,$81F0 
    db $E0 
    dw $2124,$81E0 
    db $E0 
    dw $2122,$81D0 
    db $E0 
    dw $2120,$81F0 
    db $D0 
    dw $2104,$81E0 
    db $D0 
    dw $2102,$81D0 
    db $D0 
    dw $2100,$8000 
    db $C2 
    dw $6142,$81F0 
    db $C2 
    dw $2142,$8000 
    db $20 
    dw $614E,$8010 
    db $20 
    dw $614C,$8020 
    db $20 
    dw $614A,$8000 
    db $10 
    dw $6148,$8010 
    db $10 
    dw $6146,$8020 
    db $10 
    dw $6144,$81F0 
    db $20 
    dw $214E,$81E0 
    db $20 
    dw $214C,$81D0 
    db $20 
    dw $214A,$81F0 
    db $10 
    dw $2148,$81E0 
    db $10 
    dw $2146,$81D0 
    db $10 
    dw $2144 

Spritemap_SporeSpawn_B:
    dw $0006,$8000 
    db $F8 
    dw $6106,$81F0 
    db $F8 
    dw $2106,$8000 
    db $E8 
    dw $E126,$8000 
    db $08 
    dw $6126,$81F0 
    db $E8 
    dw $A126,$81F0 
    db $08 
    dw $2126 

Spritemap_SporeSpawn_C:
    dw $0006,$8000 
    db $F8 
    dw $6108,$81F0 
    db $F8 
    dw $2108,$8000 
    db $E8 
    dw $E128,$81F0 
    db $E8 
    dw $A128,$8000 
    db $08 
    dw $6128,$81F0 
    db $08 
    dw $2128 

Spritemap_SporeSpawn_D:
    dw $0006,$8000 
    db $F8 
    dw $610A,$81F0 
    db $F8 
    dw $210A,$8000 
    db $E8 
    dw $E12A,$81F0 
    db $E8 
    dw $A12A,$8000 
    db $08 
    dw $612A,$81F0 
    db $08 
    dw $212A 

Spritemap_SporeSpawn_E:
    dw $0001,$81F8 
    db $F8 
    dw $2140 

Spritemap_SporeSpawn_F:
    dw $0001,$81F8 
    db $F8 
    dw $210C 

Spritemap_SporeSpawn_10:
    dw $0001,$81F8 
    db $F8 
    dw $210E 

Spritemap_SporeSpawn_11:
    dw $0001,$81F8 
    db $F8 
    dw $212C 

Spritemap_SporeSpawn_12:
    dw $0001,$01FC 
    db $FC 
    dw $213E 

Spritemap_SporeSpawn_13:
    dw $0001,$01FC 
    db $FC 
    dw $212F 

Spritemap_SporeSpawn_14:
    dw $0001,$01FC 
    db $FC 
    dw $212E 

Spritemap_SporeSpawn_15:
    dw $001A,$8000 
    db $DA 
    dw $6124,$8010 
    db $DA 
    dw $6122,$8020 
    db $DA 
    dw $6120,$8000 
    db $CA 
    dw $6104,$8010 
    db $CA 
    dw $6102,$8020 
    db $CA 
    dw $6100,$81F0 
    db $DA 
    dw $2124,$81E0 
    db $DA 
    dw $2122,$81D0 
    db $DA 
    dw $2120,$81F0 
    db $CA 
    dw $2104,$81E0 
    db $CA 
    dw $2102,$81D0 
    db $CA 
    dw $2100,$8000 
    db $BC 
    dw $6142,$81F0 
    db $BC 
    dw $2142,$8000 
    db $26 
    dw $614E,$8010 
    db $26 
    dw $614C,$8020 
    db $26 
    dw $614A,$8000 
    db $16 
    dw $6148,$8010 
    db $16 
    dw $6146,$8020 
    db $16 
    dw $6144,$81F0 
    db $26 
    dw $214E,$81E0 
    db $26 
    dw $214C,$81D0 
    db $26 
    dw $214A,$81F0 
    db $16 
    dw $2148,$81E0 
    db $16 
    dw $2146,$81D0 
    db $16 
    dw $2144 

Spritemap_SporeSpawn_16:
    dw $001A,$8000 
    db $C8 
    dw $6104,$8010 
    db $C8 
    dw $6102,$81F0 
    db $C8 
    dw $2104,$81E0 
    db $C8 
    dw $2102,$81D0 
    db $C8 
    dw $2100,$8000 
    db $BA 
    dw $6142,$81F0 
    db $BA 
    dw $2142,$8000 
    db $28 
    dw $614E,$8010 
    db $28 
    dw $614C,$8020 
    db $28 
    dw $614A,$8000 
    db $18 
    dw $6148,$8010 
    db $18 
    dw $6146,$8020 
    db $18 
    dw $6144,$81F0 
    db $28 
    dw $214E,$81E0 
    db $28 
    dw $214C,$81D0 
    db $28 
    dw $214A,$81F0 
    db $18 
    dw $2148,$81E0 
    db $18 
    dw $2146,$81D0 
    db $18 
    dw $2144,$8000 
    db $D8 
    dw $6124,$8010 
    db $D8 
    dw $6122,$8020 
    db $D8 
    dw $6120,$8020 
    db $C8 
    dw $6100,$81F0 
    db $D8 
    dw $2124,$81E0 
    db $D8 
    dw $2122,$81D0 
    db $D8 
    dw $2120 

Freespace_BankA5_F95A: 
; $6A6 bytes
