
org $A68000


CommonA6_GrappleAI_NoInteraction:
    JSL.L GrappleAI_SwitchEnemyAIToMainAI 
    RTL 


CommonA6_GrappleAI_SamusLatchesOn:
    JSL.L GrappleAI_SamusLatchesOnWithGrapple 
    RTL 


CommonA6_GrappleAI_KillEnemy:
    JSL.L GrappleAI_EnemyGrappleDeath 
    RTL 


CommonA6_GrappleAI_CancelGrappleBeam:
    JSL.L GrappleAI_SwitchToFrozenAI 
    RTL 


CommonA6_GrappleAI_SamusLatchesOn_NoInvincibility:
    JSL.L GrappleAI_SamusLatchesOnWithGrapple_NoInvincibility 
    RTL 


UNUSED_CommonA6_GrappleAI_SamusLatchesOn_ParalyzeEnemy_A68019:
    JSL.L GrappleAI_SamusLatchesOnWithGrapple_ParalyzeEnemy 
    RTL 


CommonA6_GrappleAI_HurtSamus:
    JSL.L GrappleAI_SwitchToFrozenAI_duplicate 
    RTL 


CommonA6_NormalEnemyTouchAI:
    JSL.L NormalEnemyTouchAI 
    RTL 


CommonA6_NormalTouchAI_NoDeathCheck:
    JSL.L NormalEnemyTouchAI_NoDeathCheck_External 
    RTL 


CommonA6_NormalEnemyShotAI:
    JSL.L NormalEnemyShotAI 
    RTL 


CommonA6_NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic:
    JSL.L NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External 
    RTL 


CommonA6_NormalEnemyPowerBombAI:
    JSL.L NormalEnemyPowerBombAI 
    RTL 


CommonA6_NormalEnemyPowerBombAI_NoDeathCheck:
    JSL.L NormalEnemyPowerBombAI_NoDeathCheck_External 
    RTL 


CommonA6_NormalEnemyFrozenAI:
    JSL.L NormalEnemyFrozenAI 
    RTL 


CommonA6_CreateADudShot:
    JSL.L CreateADudShot 
    RTL 


RTS_A6804B:
    RTS 


RTL_A6804C:
    RTL 


Spritemap_CommonA6_Nothing:
    dw $0000 

ExtendedSpritemap_CommonA6_Nothing:
    dw $0001,$0000,$0000 
    dw Spritemap_CommonA6_Nothing 
    dw Hitbox_CommonA6_Nothing 

Hitbox_CommonA6_Nothing:
    dw $0001,$0000,$0000,$0000,$0000 
    dw CommonA6_NormalEnemyTouchAI 
    dw CommonA6_NormalEnemyShotAI 

InstList_CommonA6_DeleteEnemy:
    dw Instruction_CommonA6_DeleteEnemy 

NOPNOP_A68069:
    NOP #2
    Instruction_CommonA6_Enemy0FB2_InY:
    LDA.W $0000,Y : STA.W $0FB2,X 
    INY #2
    RTL 


Instruction_CommonA6_SetEnemy0FB2ToRTS:
    LDA.W #RTS_A6807B : STA.W $0FB2,X 
    RTL 


RTS_A6807B:
    RTS 


Instruction_CommonA6_DeleteEnemy:
    LDA.W $0F86,X 
    ORA.W #$0200 
    STA.W $0F86,X 
    PLA 
    PEA.W ProcessEnemyInstructions_return-1 
    RTL 


Instruction_CommonA6_CallFunctionInY:
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


Instruction_CommonA6_CallFunctionInY_WithA:
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
    CLC 
    ADC.W #$0004 
    TAY 
    RTL 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Instruction_CommonA6_CallExternalFunctionInY_A680B5:
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


UNUSED_Inst_CommonA6_CallExternalFunctionInY_WithA_A680CE:
    LDA.W $0000,Y : STA.B $12 
    LDA.W $0001,Y : STA.B $13 
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


Instruction_CommonA6_GotoY:
    LDA.W $0000,Y 
    TAY 
    RTL 


Instruction_CommonA6_GotoY_PlusY:
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


Instruction_CommonA6_DecrementTimer_GotoYIfNonZero:
    DEC.W $0F90,X 
    BNE Instruction_CommonA6_GotoY 
    INY #2
    RTL 


Instruction_CommonA6_DecrementTimer_GotoYIfNonZero_duplicate:
    DEC.W $0F90,X 
    BNE Instruction_CommonA6_GotoY 
    INY #2
    RTL 


Instruction_CommonA6_DecrementTimer_GotoY_PlusY_IfNonZero:
    SEP #$20 
    DEC.W $0F90,X 
    REP #$20 
    BNE Instruction_CommonA6_GotoY_PlusY 
    INY 
    RTL 


Instruction_CommonA6_TimerInY:
    LDA.W $0000,Y : STA.W $0F90,X 
    INY #2
    RTL 


Instruction_CommonA6_SkipNextInstruction:
    INY #2
    RTL 


Instruction_CommonA6_Sleep:
    DEY #2
    TYA 
    STA.W $0F92,X 
    PLA 
    PEA.W ProcessEnemyInstructions_return-1 
    RTL 


Instruction_CommonA6_WaitYFrames:
    LDA.W $0000,Y : STA.W $0F94,X 
    INY #2
    TYA 
    STA.W $0F92,X 
    PLA 
    PEA.W ProcessEnemyInstructions_return-1 
    RTL 


Instruction_CommonA6_TransferYBytesInYToVRAM:
    PHX 
    LDX.W $0330 
    LDA.W $0000,Y : STA.B $D0,X 
    LDA.W $0002,Y : STA.B $D2,X 
    LDA.W $0003,Y : STA.B $D3,X 
    LDA.W $0005,Y : STA.B $D5,X 
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


Instruction_CommonA6_EnableOffScreenProcessing:
    LDA.W $0F86,X 
    ORA.W #$0800 
    STA.W $0F86,X 
    RTL 


Instruction_CommonA6_DisableOffScreenProcessing:
    LDA.W $0F86,X 
    AND.W #$F7FF 
    STA.W $0F86,X 
    RTL 


CommonA6EnemySpeeds_LinearlyIncreasing:
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

CommonA6EnemySpeeds_QuadraticallyIncreasing:
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

Palette_Boulder:
    dw $3800,$49EF,$45CE,$3D8C,$396B,$3529,$2D08,$28C6 
    dw $20A5,$1C63,$2506,$1CC4,$1083,$0841,$6EF7,$0000 

InstList_Boulder_FacingLeft:
    dw $0008 
    dw Spritemap_Boulder_0 
    dw $0008 
    dw Spritemap_Boulder_1 
    dw $0008 
    dw Spritemap_Boulder_2 
    dw $0008 
    dw Spritemap_Boulder_3 
    dw $0008 
    dw Spritemap_Boulder_4 
    dw $0008 
    dw Spritemap_Boulder_5 
    dw $0008 
    dw Spritemap_Boulder_6 
    dw $0008 
    dw Spritemap_Boulder_7 
    dw Instruction_Common_GotoY 
    dw InstList_Boulder_FacingLeft 

InstList_Boulder_FacingRight:
    dw $0008 
    dw Spritemap_Boulder_0 
    dw $0008 
    dw Spritemap_Boulder_7 
    dw $0008 
    dw Spritemap_Boulder_6 
    dw $0008 
    dw Spritemap_Boulder_5 
    dw $0008 
    dw Spritemap_Boulder_4 
    dw $0008 
    dw Spritemap_Boulder_3 
    dw $0008 
    dw Spritemap_Boulder_2 
    dw $0008 
    dw Spritemap_Boulder_1 
    dw Instruction_Common_GotoY 
    dw InstList_Boulder_FacingRight 

BounceSpeedTableIndices:
    dw $0000,$1000,$1800 

InitAI_Boulder:
    LDX.W $0E54 
    STZ.W $0FAC,X 
    LDA.W #$0000 : STA.W $0FAA,X 
    LDA.W #$0002 : STA.W $0FAE,X 
    LDA.W #Function_Boulder_WaitForSamusToGetNear : STA.W $0FA8,X 
    LDA.W $0F7A,X : STA.L $7E7808,X 
    LDA.W $0F7E,X : STA.L $7E780A,X 
    STA.L $7E7806,X 
    LDA.W $0F80,X : STA.L $7E7804,X 
    LDA.W $0FB7,X 
    AND.W #$00FF 
    BNE .notRolling 
    LDA.W #$0001 : STA.L $7E780E,X 

.notRolling:
    EOR.W #$FFFF 
    INC A 
    CLC 
    ADC.L $7E780A,X 
    STA.W $0F7E,X 
    LDA.W $0FB6,X 
    AND.W #$00FF 
    EOR.W #$FFFF 
    INC A 
    STA.L $7E7800,X 
    LDA.W $0F92,X 
    AND.W #$00FF 
    STA.L $7E780C,X 
    LDA.W #InstList_Boulder_FacingLeft : STA.W $0F92,X 
    LDA.W $0FB5,X 
    AND.W #$00FF 
    STA.W $0FB0,X 
    BNE .left 
    LDA.L $7E7800,X 
    EOR.W #$FFFF 
    INC A 
    STA.L $7E7800,X 
    LDA.W #InstList_Boulder_FacingRight : STA.W $0F92,X 

.left:
    LDA.W #$0002 : STA.L $7E7802,X 
    LDA.W $0FB4,X 
    AND.W #$00FF 
    BEQ .return 
    LDA.W #$0005 : STA.L $7E7802,X 

.return:
    RTL 


MainAI_Boulder:
    LDX.W $0E54 
    JSR.W ($0FA8,X) 
    RTL 


Function_Boulder_WaitForSamusToGetNear:
    LDX.W $0E54 
    JSL.L Get_SamusY_minus_EnemyY 
    BMI .return 
    CMP.L $7E780C,X 
    BPL .return 
    LDA.W $0FB0,X 
    BNE .left 
    JSL.L Get_SamusX_minus_EnemyX 
    BMI .return 
    CMP.L $7E7800,X 
    BPL .return 
    LDA.W #Function_Boulder_Falling : STA.W $0FA8,X 
    LDA.L $7E780E,X 
    BEQ .return 
    LDA.W #Function_Boulder_Rolling : STA.W $0FA8,X 
    BRA .return 


.left:
    JSL.L Get_SamusX_minus_EnemyX 
    BPL .return 
    CMP.L $7E7800,X 
    BMI .return 
    LDA.W #Function_Boulder_Falling : STA.W $0FA8,X 
    LDA.L $7E780E,X 
    BEQ .return 
    LDA.W #Function_Boulder_Rolling : STA.W $0FA8,X 

.return:
    RTS 


Function_Boulder_Falling:
    LDX.W $0E54 
    LDA.W $0FAC,X 
    AND.W #$FF00 
    XBA 
    ASL #3
    TAY 
    JSR.W MoveBoulderVertically 
    LDA.W $0F7E,X 
    CMP.L $7E780A,X 
    BMI .notReachedTarget 
    LDA.L $7E780A,X : STA.W $0F7E,X 
    LDA.W #Function_Boulder_Bounce_Rising : STA.W $0FA8,X 
    LDA.W #$2000 : STA.W $0FAC,X 
    BRA .return 


.notReachedTarget:
    LDA.W $0FAC,X 
    CLC 
    ADC.W #$0100 
    STA.W $0FAC,X 
    CMP.W #$5000 
    BMI .return 
    LDA.W #$5000 : STA.W $0FAC,X 

.return:
    RTS 


Function_Boulder_Bounce_Rising:
    LDX.W $0E54 
    LDA.W $0FAC,X 
    AND.W #$FF00 
    XBA 
    ASL #3
    INC #4
    TAY 
    JSR.W MoveBoulderVertically 
    LDA.W $0FAC,X 
    SEC 
    SBC.W #$0100 
    STA.W $0FAC,X 
    BPL .negativeSpeedTableIndex 
    STZ.W $0FAC,X 
    LDA.W #Function_Boulder_Bounce_Falling : STA.W $0FA8,X 
    BRA .return 


.negativeSpeedTableIndex:
    LDA.W $0FAA,X 
    AND.W #$FF00 
    XBA 
    ASL #3
    TAY 
    LDA.W $0FB0,X 
    BEQ .right 
    INY #4
    .right:
    JSR.W MoveBoulderHorizontally 
    LDA.W $0FAA,X 
    CLC 
    ADC.W #$0020 
    STA.W $0FAA,X 
    CMP.W #$5000 
    BMI .return 
    LDA.W #$5000 : STA.W $0FAA,X 

.return:
    RTS 


Function_Boulder_Bounce_Falling:
    LDX.W $0E54 
    LDA.W $0FAC,X 
    AND.W #$FF00 
    XBA 
    ASL #3
    TAY 
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing,Y : STA.B $12 
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing+2,Y : STA.B $14 
    JSL.L MoveEnemyDownBy_14_12 
    BCC .noCollision 
    LDA.W #$0042 
    JSL.L QueueSound_Lib2_Max6 
    LDA.W $0FB0,X 
    CMP.W #$0002 
    BNE .right 
    LDA.W $0F86,X 
    ORA.W #$0200 
    STA.W $0F86,X 
    LDA.W $0F7A,X : STA.B $12 
    LDA.W $0F7E,X : STA.B $14 
    LDA.W #$0011 
    LDY.W #EnemyProjectile_MiscDust 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    LDA.W #$0043 
    JSL.L QueueSound_Lib2_Max6 
    BRA .return 


.right:
    LDA.W #Function_Boulder_Bounce_Rising : STA.W $0FA8,X 
    LDA.W $0FAE,X 
    DEC A 
    ASL A 
    TAY 
    LDA.W BounceSpeedTableIndices+2,Y : STA.W $0FAC,X 
    DEC.W $0FAE,X 
    BPL .return 
    LDA.W $0F7E,X : STA.L $7E7806,X 
    LDA.W $0F80,X : STA.L $7E7804,X 
    LDA.W #Function_Boulder_Rolling : STA.W $0FA8,X 
    BRA .return 


.noCollision:
    LDA.W $0FAC,X 
    CLC 
    ADC.W #$0100 
    STA.W $0FAC,X 
    LDA.W $0FAA,X 
    AND.W #$FF00 
    XBA 
    ASL #3
    TAY 
    LDA.W $0FB0,X 
    BEQ ..right 
    INY #4
    ..right:
    JSR.W MoveBoulderHorizontally 
    LDA.W $0FAA,X 
    CLC 
    ADC.W #$0020 
    STA.W $0FAA,X 
    CMP.W #$5000 
    BMI .return 
    LDA.W #$5000 : STA.W $0FAA,X 

.return:
    RTS 


Function_Boulder_Rolling:
    LDX.W $0E54 
    LDA.W $0FAA,X 
    AND.W #$FF00 
    XBA 
    ASL #3
    TAY 
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing,Y : STA.B $12 
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing+2,Y 
    CLC 
    ADC.L $7E7802,X 
    STA.B $14 
    PHY 
    JSL.L MoveEnemyDownBy_14_12 
    PLY 
    LDA.W $0F7E,X 
    SEC 
    SBC.L $7E7802,X 
    STA.W $0F7E,X 
    LDA.W $0FB0,X 
    BEQ .right 
    INY #4
    .right:
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing,Y : STA.B $12 
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing+2,Y : STA.B $14 
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes 
    BCC .notCollidedWithWall 
    LDA.W $0F86,X 
    ORA.W #$0100 
    ORA.W #$0200 
    STA.W $0F86,X 
    LDA.W #Function_Boulder_LoadEnemyIndex : STA.W $0FA8,X 
    LDA.W #$0042 
    JSL.L QueueSound_Lib2_Max6 
    LDA.W $0F7A,X : STA.B $12 
    LDA.W $0F7E,X : STA.B $14 
    LDA.W #$0011 
    LDY.W #EnemyProjectile_MiscDust 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    LDA.W #$0043 
    JSL.L QueueSound_Lib2_Max6 
    BRA .return 


.notCollidedWithWall:
    LDA.W $0FAA,X 
    CLC 
    ADC.W #$0040 
    STA.W $0FAA,X 
    CMP.W #$4000 
    BMI + 
    LDA.W #$4000 : STA.W $0FAA,X 

  + LDA.W $0F7E,X 
    CMP.L $7E7806,X 
    BNE .return 
    LDA.W $0F80,X 
    CMP.L $7E7804,X 
    BNE .return 
    LDA.W #$0000 : STA.L $7E7802,X 

.return:
    LDA.W $0F7E,X : STA.L $7E7806,X 
    LDA.W $0F80,X : STA.L $7E7804,X 
    RTS 


Function_Boulder_LoadEnemyIndex:
    LDX.W $0E54 
    RTS 


MoveBoulderHorizontally:
    LDX.W $0E54 
    LDA.W $0F7C,X 
    CLC 
    ADC.W CommonA6EnemySpeeds_QuadraticallyIncreasing,Y 
    BCC + 
    INC.W $0F7A,X 

  + STA.W $0F7C,X 
    LDA.W $0F7A,X 
    CLC 
    ADC.W CommonA6EnemySpeeds_QuadraticallyIncreasing+2,Y 
    STA.W $0F7A,X 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_MoveBoulderHorizontallyWithLinearSpeedTable_A68A1D:
    LDX.W $0E54 
    LDA.W $0F7C,X 
    CLC 
    ADC.W CommonEnemySpeeds_LinearlyIncreasing+2,Y 
    BCC + 
    INC.W $0F7A,X 

  + STA.W $0F7C,X 
    LDA.W $0F7A,X 
    CLC 
    ADC.W CommonEnemySpeeds_LinearlyIncreasing,Y 
    STA.W $0F7A,X 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


MoveBoulderVertically:
    LDX.W $0E54 
    LDA.W $0F80,X 
    CLC 
    ADC.W CommonEnemySpeeds_QuadraticallyIncreasing,Y 
    BCC + 
    INC.W $0F7E,X 

  + STA.W $0F80,X 
    LDA.W $0F7E,X 
    CLC 
    ADC.W CommonEnemySpeeds_QuadraticallyIncreasing+2,Y 
    STA.W $0F7E,X 
    RTS 


RTL_A68A57:
    RTL 


RTL_A68A58:
    RTL 


Spritemap_Boulder_0:
    dw $0004,$8000 
    db $00 
    dw $2122,$81F0 
    db $00 
    dw $2120,$8000 
    db $F0 
    dw $2102,$81F0 
    db $F0 
    dw $2100 

Spritemap_Boulder_1:
    dw $0004,$8000 
    db $00 
    dw $2162,$81F0 
    db $00 
    dw $2160,$8000 
    db $F0 
    dw $2142,$81F0 
    db $F0 
    dw $2140 

Spritemap_Boulder_2:
    dw $0004,$8000 
    db $00 
    dw $2126,$81F0 
    db $00 
    dw $2124,$8000 
    db $F0 
    dw $2106,$81F0 
    db $F0 
    dw $2104 

Spritemap_Boulder_3:
    dw $0004,$8000 
    db $00 
    dw $2166,$81F0 
    db $00 
    dw $2164,$8000 
    db $F0 
    dw $2146,$81F0 
    db $F0 
    dw $2144 

Spritemap_Boulder_4:
    dw $0004,$8000 
    db $00 
    dw $212A,$81F0 
    db $00 
    dw $2128,$8000 
    db $F0 
    dw $210A,$81F0 
    db $F0 
    dw $2108 

Spritemap_Boulder_5:
    dw $0004,$8000 
    db $00 
    dw $216A,$81F0 
    db $00 
    dw $2168,$8000 
    db $F0 
    dw $214A,$81F0 
    db $F0 
    dw $2148 

Spritemap_Boulder_6:
    dw $0004,$8000 
    db $00 
    dw $212E,$81F0 
    db $00 
    dw $212C,$8000 
    db $F0 
    dw $210E,$81F0 
    db $F0 
    dw $210C 

Spritemap_Boulder_7:
    dw $0004,$8000 
    db $00 
    dw $216E,$81F0 
    db $00 
    dw $216C,$8000 
    db $F0 
    dw $214E,$81F0 
    db $F0 
    dw $214C 

Palette_Kzan:
    dw $3800,$62BA,$49F3,$2D4D,$0C44,$49F3,$356E,$20C9 
    dw $1486,$241F,$1C17,$142F,$0C47,$0000,$0000,$0000 


InstList_Kzan:
    dw $0001 
    dw Spritemap_Kzan 
    dw Instruction_Common_Sleep 

InitAI_KzanTop:
    LDX.W $0E54 
    LDA.W #InstList_Kzan : STA.W $0F92,X 
    LDA.W #Function_Kzan_WaitingToFall : STA.W $0FA8,X 
    LDA.W $0FB4,X 
    AND.W #$00FF 
    ASL #3
    STA.L $7E7804,X 
    TAX 
    LDA.W CommonEnemySpeeds_LinearlyIncreasing,X : STA.B $12 
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+2,X : STA.B $14 
    LDX.W $0E54 
    LDA.B $14 : STA.W $0FB0,X 
    LDA.B $12 : STA.W $0FB2,X 
    LDA.W $0FB6,X 
    AND.W #$FF00 
    XBA 
    CLC 
    ADC.W $0F7E,X 
    STA.W $0FAE,X 
    LDA.W $0F7E,X : STA.W $0FAC,X 
    LDA.W $0FB6,X 
    AND.W #$00FF 
    STA.L $7E7800,X 
    STA.W $0FAA,X 
    RTL 


InitAI_KzanBottom:
    LDX.W $0E54 
    LDA.W $0F3A,X : STA.W $0F7A,X 
    LDA.W $0F3E,X 
    CLC 
    ADC.W #$000C 
    STA.W $0F7E,X 
    RTL 


MainAI_KzanBottom:
    LDX.W $0E54 ; Same as init AI
    LDA.W $0F3A,X : STA.W $0F7A,X 
    LDA.W $0F3E,X 
    CLC 
    ADC.W #$000C 
    STA.W $0F7E,X 
    RTL 


MainAI_KzanTop:
    LDX.W $0E54 
    JSR.W ($0FA8,X) 
    RTL 


Function_Kzan_WaitingToFall:
    PHX 
    LDX.W $0E54 
    DEC.W $0FAA,X 
    LDA.W $0FAA,X 
    BNE .return 
    LDA.L $7E7800,X : STA.W $0FAA,X 
    LDA.W $0FB4,X 
    AND.W #$00FF 
    ASL #3
    STA.L $7E7804,X 
    LDA.W #Function_Kzan_Falling : STA.W $0FA8,X 

.return:
    PLX 
    RTS 


Function_Kzan_Falling:
    PHX 
    LDX.W $0E54 
    LDA.W $0F7E,X : STA.L $7E7802,X 
    LDA.L $7E7804,X 
    TAX 
    LDA.W CommonEnemySpeeds_LinearlyIncreasing,X : STA.B $14 
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+2,X : STA.B $12 
    LDX.W $0E54 
    JSL.L MoveEnemyY_plus_12_14 
    LDA.W $0F7E,X 
    CMP.W $0FAE,X 
    BMI .notReachedTarget 
    LDA.W #$0040 : STA.L $7E7806,X 
    LDA.W #Function_Kzan_WaitingToRise : STA.W $0FA8,X 
    LDA.W $0FAE,X : STA.W $0F7E,X 
    LDA.W #$001B 
    JSL.L QueueSound_Lib2_Max6 

.notReachedTarget:
    JSL.L CheckIfKzanIsTouchingSamusFromBelow 
    BEQ .notTouchingSamusFromBelow 
    LDA.W $0F7E,X 
    SEC 
    SBC.L $7E7802,X 
    CLC 
    ADC.W $0B5C 
    STA.W $0B5C 

.notTouchingSamusFromBelow:
    LDA.L $7E7804,X 
    CLC 
    ADC.W #$0008 
    CMP.W #$0200 
    BMI + 
    LDA.W #$0200 

  + STA.L $7E7804,X 
    PLX 
    RTS 


Function_Kzan_WaitingToRise:
    LDA.L $7E7806,X 
    DEC A 
    STA.L $7E7806,X 
    BEQ .timerExpired 
    RTS 


.timerExpired:
    LDA.W #Function_Kzan_Rising : STA.W $0FA8,X 
    RTS 


Function_Kzan_Rising:
    PHX 
    LDX.W $0E54 
    LDA.W $0F7E,X : STA.L $7E7802,X 
    LDA.W #$8000 : STA.B $12 
    LDA.W #$0000 : STA.B $14 
    JSL.L MoveEnemyY_minus_12_14 
    LDA.W $0F7E,X 
    CMP.W $0FAC,X 
    BPL .notReachedTarget 
    LDA.W #Function_Kzan_WaitingToFall : STA.W $0FA8,X 
    LDA.W $0FAC,X : STA.W $0F7E,X 

.notReachedTarget:
    JSL.L CheckIfKzanIsTouchingSamusFromBelow 
    BEQ .notTouchingSamusFromBelow 
    LDA.W $0F7E,X 
    SEC 
    SBC.L $7E7802,X 
    CLC 
    ADC.W $0B5C 
    STA.W $0B5C 

.notTouchingSamusFromBelow:
    PLX 
    RTS 


CheckIfKzanIsTouchingSamusFromBelow:
    LDA.W $0AF6 
    SEC 
    SBC.W $0F7A,X 
    BPL + 
    EOR.W #$FFFF 
    INC A 

  + SEC 
    SBC.W $0AFE 
    BCC .YPosition 
    CMP.W $0F82,X 
    BCC .YPosition 
    LDA.W #$0000 
    RTL 


.YPosition:
    LDA.W $0AFA 
    CLC 
    ADC.W #$0005 
    SEC 
    SBC.W $0F7E,X 
    BPL .returnNotTouchingSamus 
    EOR.W #$FFFF 
    INC A 
    SEC 
    SBC.W $0B00 
    BCC .returnTouchingSamus 
    CMP.W $0F84,X 
    BEQ .returnTouchingSamus 
    BCC .returnTouchingSamus 

.returnNotTouchingSamus:
    LDA.W #$0000 
    RTL 


.returnTouchingSamus:
    LDA.W #$FFFF 
    RTL 


RTL_A68CE3:
    RTL 


RTL_A68CE4:
    RTL 


Spritemap_Kzan:
    dw $0004,$8000 
    db $04 
    dw $2106,$81F0 
    db $04 
    dw $2104,$8000 
    db $F4 
    dw $2102,$81F0 
    db $F4 
    dw $2100 

Palette_Hibashi:
    dw $3800,$3E7F,$2DFD,$10FB,$0097,$73FF,$53FF,$37FF 
    dw $17FF,$24DF,$189B,$1076,$0C50,$084B,$5EFF,$0880 

InstList_Hibashi_GraphicsPart:
    dw Instruction_Hibashi_PlaySFX 
    dw $0002 
    dw Spritemap_Hibashi_0 
    dw Instruction_Hibashi_ActivityFrame0 
    dw $0002 
    dw Spritemap_Hibashi_1 
    dw Instruction_Hibashi_ActivityFrame1 
    dw $0002 
    dw Spritemap_Hibashi_2 
    dw Instruction_Hibashi_ActivityFrame2 
    dw $0002 
    dw Spritemap_Hibashi_3 
    dw Instruction_Hibashi_ActivityFrame3 
    dw $0001 
    dw Spritemap_Hibashi_4 
    dw Instruction_Hibashi_ActivityFrame4 
    dw $0001 
    dw Spritemap_Hibashi_5 
    dw Instruction_Hibashi_ActivityFrame5 
    dw $0001 
    dw Spritemap_Hibashi_6 
    dw Instruction_Hibashi_ActivityFrame6 
    dw $0001 
    dw Spritemap_Hibashi_7 
    dw Instruction_Hibashi_ActivityFrame7 
    dw $0002 
    dw Spritemap_Hibashi_8 
    dw Instruction_Hibashi_ActivityFrame8 
    dw $0002 
    dw Spritemap_Hibashi_9 
    dw Instruction_Hibashi_ActivityFrame9 
    dw $0002 
    dw Spritemap_Hibashi_A 
    dw Instruction_Hibashi_ActivityFrameA 
    dw $0002 
    dw Spritemap_Hibashi_B 
    dw Instruction_Hibashi_ActivityFrameB 
    dw $0002 
    dw Spritemap_Hibashi_C 
    dw Instruction_Hibashi_ActivityFrameC 
    dw $0002 
    dw Spritemap_Hibashi_D 
    dw Instruction_Hibashi_ActivityFrameD 
    dw $0002 
    dw Spritemap_Hibashi_E 
    dw Instruction_Hibashi_ActivityFrameE 
    dw $0002 
    dw Spritemap_Hibashi_F 
    dw Instruction_Hibashi_ActivityFrameF 
    dw $0004 
    dw Spritemap_Hibashi_10 
    dw Instruction_Hibashi_ActivityFrame10 
    dw $0004 
    dw Spritemap_Hibashi_11 
    dw Instruction_Hibashi_ActivityFrame11 
    dw $0004 
    dw Spritemap_Hibashi_12 
    dw Instruction_Hibashi_ActivityFrame12 
    dw $0004 
    dw Spritemap_Hibashi_13 
    dw Instruction_Hibashi_ActivityFrame13 
    dw $0004 
    dw Spritemap_Hibashi_14 
    dw Instruction_Hibashi_ActivityFrame14 
    dw $0004 
    dw Spritemap_Hibashi_15 
    dw Instruction_Hibashi_ActivityFrame15 
    dw $0004 
    dw Spritemap_Hibashi_16 
    dw Instruction_Hibashi_FinishActivity 
    dw Instruction_Common_Sleep 

InstList_Hibashi_HitboxPart:
    dw $0002 
    dw Spritemap_Hibashi_0 
    dw Instruction_Common_Sleep 

Instruction_Hibashi_PlaySFX:
    PHX 
    PHY 
    LDA.W #$0061 
    JSL.L QueueSound_Lib2_Max6 
    PLY 
    PLX 
    RTL 


Hibashi_YOffset_0:
    dw $0005 

Hibashi_YOffset_1:
    dw $000A 

Hibashi_YOffset_2:
    dw $000F 

Hibashi_YOffset_3:
    dw $0014 

Hibashi_YOffset_4:
    dw $0019 

Hibashi_YOffset_5:
    dw $001E 

Hibashi_YOffset_6:
    dw $0023 

Hibashi_YOffset_7:
    dw $0028 

Hibashi_YOffset_8:
    dw $002D 

Hibashi_YOffset_9:
    dw $0032 

Hibashi_YOffset_A:
    dw $0037 

Hibashi_YOffset_B:
    dw $003C 

Hibashi_YOffset_C:
    dw $0041 

Hibashi_YOffset_D:
    dw $0046 

Hibashi_YOffset_E:
    dw $004B 

Hibashi_YOffset_F:
    dw $0050 

Hibashi_YOffset_10:
    dw $0055 

Hibashi_YOffset_11:
    dw $005A 

Hibashi_YOffset_12:
    dw $005F 

Hibashi_YOffset_13:
    dw $0064 

Hibashi_YOffset_14:
    dw $0069 

Hibashi_YOffset_15:
    dw $006E 

Hibashi_XOffset_0:
    dw $0018 

Hibashi_XOffset_1:
    dw $0018 

Hibashi_XOffset_2:
    dw $0018 

Hibashi_XOffset_3:
    dw $0018 

Hibashi_XOffset_4:
    dw $0018 

Hibashi_XOffset_5:
    dw $0018 

Hibashi_XOffset_6:
    dw $0018 

Hibashi_XOffset_7:
    dw $0018 

Hibashi_XOffset_8:
    dw $0018 

Hibashi_XOffset_9:
    dw $0018 

Hibashi_XOffset_A:
    dw $0018 

Hibashi_XOffset_B:
    dw $0018 

Hibashi_XOffset_C:
    dw $0018 

Hibashi_XOffset_D:
    dw $0018 

Hibashi_XOffset_E:
    dw $0018 

Hibashi_XOffset_F:
    dw $0018 

Hibashi_XOffset_10:
    dw $0018 

Hibashi_XOffset_11:
    dw $0018 

Hibashi_XOffset_12:
    dw $0014 

Hibashi_XOffset_13:
    dw $0010 

Hibashi_XOffset_14:
    dw $000C 

Hibashi_XOffset_15:
    dw $0008 

Instruction_Hibashi_ActivityFrame0:
    LDX.W $0E54 
    LDA.W $0FAE,X 
    SEC 
    SBC.W Hibashi_YOffset_0 
    STA.W $0FBE,X 
    LDA.W Hibashi_XOffset_0 : STA.W $0FC4,X 
    LDA.W #$0008 : STA.W $0FC2,X 
    RTL 


Instruction_Hibashi_ActivityFrame1:
    LDX.W $0E54 
    LDA.W $0FAE,X 
    SEC 
    SBC.W Hibashi_YOffset_1 
    STA.W $0FBE,X 
    LDA.W Hibashi_XOffset_1 : STA.W $0FC4,X 
    RTL 


Instruction_Hibashi_ActivityFrame2:
    LDX.W $0E54 
    LDA.W $0FAE,X 
    SEC 
    SBC.W Hibashi_YOffset_2 
    STA.W $0FBE,X 
    LDA.W Hibashi_XOffset_2 : STA.W $0FC4,X 
    RTL 


Instruction_Hibashi_ActivityFrame3:
    LDX.W $0E54 
    LDA.W $0FAE,X 
    SEC 
    SBC.W Hibashi_YOffset_3 
    STA.W $0FBE,X 
    LDA.W Hibashi_XOffset_3 : STA.W $0FC4,X 
    RTL 


Instruction_Hibashi_ActivityFrame4:
    LDX.W $0E54 
    LDA.W $0FAE,X 
    SEC 
    SBC.W Hibashi_YOffset_4 
    STA.W $0FBE,X 
    LDA.W Hibashi_XOffset_4 : STA.W $0FC4,X 
    RTL 


Instruction_Hibashi_ActivityFrame5:
    LDX.W $0E54 
    LDA.W $0FAE,X 
    SEC 
    SBC.W Hibashi_YOffset_5 
    STA.W $0FBE,X 
    LDA.W Hibashi_XOffset_5 : STA.W $0FC4,X 
    RTL 


Instruction_Hibashi_ActivityFrame6:
    LDX.W $0E54 
    LDA.W $0FAE,X 
    SEC 
    SBC.W Hibashi_YOffset_6 
    STA.W $0FBE,X 
    LDA.W Hibashi_XOffset_6 : STA.W $0FC4,X 
    RTL 


Instruction_Hibashi_ActivityFrame7:
    LDX.W $0E54 
    LDA.W $0FAE,X 
    SEC 
    SBC.W Hibashi_YOffset_7 
    STA.W $0FBE,X 
    LDA.W Hibashi_XOffset_7 : STA.W $0FC4,X 
    RTL 


Instruction_Hibashi_ActivityFrame8:
    LDX.W $0E54 
    LDA.W $0FAE,X 
    SEC 
    SBC.W Hibashi_YOffset_8 
    STA.W $0FBE,X 
    LDA.W Hibashi_XOffset_8 : STA.W $0FC4,X 
    RTL 


Instruction_Hibashi_ActivityFrame9:
    LDX.W $0E54 
    LDA.W $0FAE,X 
    SEC 
    SBC.W Hibashi_YOffset_9 
    STA.W $0FBE,X 
    LDA.W Hibashi_XOffset_9 : STA.W $0FC4,X 
    RTL 


Instruction_Hibashi_ActivityFrameA:
    LDX.W $0E54 
    LDA.W $0FAE,X 
    SEC 
    SBC.W Hibashi_YOffset_A 
    STA.W $0FBE,X 
    LDA.W Hibashi_XOffset_A : STA.W $0FC4,X 
    RTL 


Instruction_Hibashi_ActivityFrameB:
    LDX.W $0E54 
    LDA.W $0FAE,X 
    SEC 
    SBC.W Hibashi_YOffset_B 
    STA.W $0FBE,X 
    LDA.W Hibashi_XOffset_B : STA.W $0FC4,X 
    RTL 


Instruction_Hibashi_ActivityFrameC:
    LDX.W $0E54 
    LDA.W $0FAE,X 
    SEC 
    SBC.W Hibashi_YOffset_C 
    STA.W $0FBE,X 
    LDA.W Hibashi_XOffset_C : STA.W $0FC4,X 
    RTL 


Instruction_Hibashi_ActivityFrameD:
    LDX.W $0E54 
    LDA.W $0FAE,X 
    SEC 
    SBC.W Hibashi_YOffset_D 
    STA.W $0FBE,X 
    LDA.W Hibashi_XOffset_D : STA.W $0FC4,X 
    RTL 


Instruction_Hibashi_ActivityFrameE:
    LDX.W $0E54 
    LDA.W $0FAE,X 
    SEC 
    SBC.W Hibashi_YOffset_E 
    STA.W $0FBE,X 
    LDA.W Hibashi_XOffset_E : STA.W $0FC4,X 
    RTL 


Instruction_Hibashi_ActivityFrameF:
    LDX.W $0E54 
    LDA.W $0FAE,X 
    SEC 
    SBC.W Hibashi_YOffset_F 
    STA.W $0FBE,X 
    LDA.W Hibashi_XOffset_F : STA.W $0FC4,X 
    RTL 


Instruction_Hibashi_ActivityFrame10:
    LDX.W $0E54 
    LDA.W $0FAE,X 
    SEC 
    SBC.W Hibashi_YOffset_10 
    STA.W $0FBE,X 
    LDA.W Hibashi_XOffset_10 : STA.W $0FC4,X 
    RTL 


Instruction_Hibashi_ActivityFrame11:
    LDX.W $0E54 
    LDA.W $0FAE,X 
    SEC 
    SBC.W Hibashi_YOffset_11 
    STA.W $0FBE,X 
    LDA.W Hibashi_XOffset_11 : STA.W $0FC4,X 
    RTL 


Instruction_Hibashi_ActivityFrame12:
    LDX.W $0E54 
    LDA.W $0FAE,X 
    SEC 
    SBC.W Hibashi_YOffset_12 
    STA.W $0FBE,X 
    LDA.W Hibashi_XOffset_12 : STA.W $0FC4,X 
    RTL 


Instruction_Hibashi_ActivityFrame13:
    LDX.W $0E54 
    LDA.W $0FAE,X 
    SEC 
    SBC.W Hibashi_YOffset_13 
    STA.W $0FBE,X 
    LDA.W Hibashi_XOffset_13 : STA.W $0FC4,X 
    RTL 


Instruction_Hibashi_ActivityFrame14:
    LDX.W $0E54 
    LDA.W $0FAE,X 
    SEC 
    SBC.W Hibashi_YOffset_14 
    STA.W $0FBE,X 
    LDA.W Hibashi_XOffset_14 : STA.W $0FC4,X 
    RTL 


Instruction_Hibashi_ActivityFrame15:
    LDX.W $0E54 
    LDA.W $0FAE,X 
    SEC 
    SBC.W Hibashi_YOffset_15 
    STA.W $0FBE,X 
    LDA.W Hibashi_XOffset_15 : STA.W $0FC4,X 
    RTL 


Instruction_Hibashi_FinishActivity:
    LDX.W $0E54 
    LDA.W #$0001 : STA.W $0FAC,X 
    LDA.W #$0000 : STA.W $0FC2,X 
    STA.W $0FC4,X 
    LDA.W $0FAE,X : STA.W $0F7E,X 
    LDA.W $0F86,X 
    ORA.W #$0100 
    STA.W $0F86,X 
    LDA.W $0FC6,X 
    ORA.W #$0400 
    STA.W $0FC6,X 
    RTL 


InitAI_Hibashi:
    LDX.W $0E54 
    LDA.W #InstList_Hibashi_HitboxPart : STA.W $0F92,X 
    LDA.W $0FB6,X 
    BNE .return 
    LDA.W #InstList_Hibashi_GraphicsPart : STA.W $0F92,X 
    LDA.W #Function_Hibashi_Inactive : STA.W $0FA8,X 
    LDA.W $0F7E,X : STA.W $0FAE,X 
    LDA.W #$0000 : STA.W $0F82,X 

.return:
    RTL 


MainAI_Hibashi:
    LDX.W $0E54 
    LDA.W $0FB6,X 
    BNE .return 
    JSR.W ($0FA8,X) 

.return:
    RTL 


Function_Hibashi_Inactive:
    LDX.W $0E54 
    DEC.W $0FAA,X 
    BPL .return 
    LDA.W #Function_Hibashi_Active : STA.W $0FA8,X 
    STZ.W $0FAC,X 
    LDA.W #$0001 : STA.W $0F94,X 
    STZ.W $0F90,X 
    LDA.W #InstList_Hibashi_GraphicsPart : STA.W $0F92,X 
    LDA.W $0F86,X 
    AND.W #$FEFF 
    STA.W $0F86,X 
    LDA.W $0FC6,X 
    AND.W #$FBFF 
    STA.W $0FC6,X 

.return:
    RTS 


Function_Hibashi_Active:
    LDX.W $0E54 
    LDA.W $0FAC,X 
    BEQ .return 
    LDA.W $0FB4,X : STA.W $0FAA,X 
    LDA.W $0F86,X 
    ORA.W #$0100 
    STA.W $0F86,X 
    LDA.W #Function_Hibashi_Inactive : STA.W $0FA8,X 

.return:
    RTS 


RTL_A69080:
    RTL 


RTL_A69081:
    RTL 


Spritemap_Hibashi_0:
    dw $0001,$81F9 
    db $F9 
    dw $210E 

Spritemap_Hibashi_1:
    dw $0004,$0005 
    db $FF 
    dw $2134,$01F4 
    db $FF 
    dw $6134,$81F9 
    db $F8 
    dw $2102,$81F9 
    db $F2 
    dw $2100 

Spritemap_Hibashi_2:
    dw $0005,$0005 
    db $FF 
    dw $2124,$01F4 
    db $FF 
    dw $6124,$81F9 
    db $F8 
    dw $2120,$81F9 
    db $F2 
    dw $2102,$81F9 
    db $EC 
    dw $2100 

Spritemap_Hibashi_3:
    dw $0006,$81EC 
    db $F7 
    dw $6128,$8005 
    db $F7 
    dw $2128,$81F9 
    db $F8 
    dw $2104,$81F9 
    db $F0 
    dw $2120,$81F9 
    db $EA 
    dw $2102,$81F9 
    db $E4 
    dw $2100 

Spritemap_Hibashi_4:
    dw $0007,$81EC 
    db $F7 
    dw $612A,$8005 
    db $F7 
    dw $212A,$81F9 
    db $F8 
    dw $2106,$81F9 
    db $F2 
    dw $2104,$81F9 
    db $EA 
    dw $2120,$81F9 
    db $E4 
    dw $2102,$81F9 
    db $DE 
    dw $2100 

Spritemap_Hibashi_5:
    dw $0007,$0005 
    db $FF 
    dw $2134,$01F4 
    db $FF 
    dw $6134,$81F9 
    db $F8 
    dw $2122,$81F9 
    db $F0 
    dw $2104,$81F9 
    db $E8 
    dw $2120,$81F9 
    db $E2 
    dw $2102,$81F9 
    db $DC 
    dw $2100 

Spritemap_Hibashi_6:
    dw $0007,$0005 
    db $FF 
    dw $2124,$01F4 
    db $FF 
    dw $6124,$81F8 
    db $F8 
    dw $E106,$81F9 
    db $EE 
    dw $2104,$81F9 
    db $E4 
    dw $2120,$81F9 
    db $DE 
    dw $2102,$81F9 
    db $DA 
    dw $2100 

Spritemap_Hibashi_7:
    dw $0007,$81EC 
    db $F7 
    dw $6128,$8005 
    db $F7 
    dw $2128,$81F8 
    db $F8 
    dw $E122,$81F9 
    db $EC 
    dw $2104,$81F9 
    db $E2 
    dw $2120,$81F9 
    db $DC 
    dw $2102,$81F9 
    db $D8 
    dw $2100 

Spritemap_Hibashi_8:
    dw $0008,$81EC 
    db $F7 
    dw $612A,$8005 
    db $F7 
    dw $212A,$81F9 
    db $F8 
    dw $210C,$81F9 
    db $F0 
    dw $2106,$81F9 
    db $E4 
    dw $2104,$81F9 
    db $DA 
    dw $2120,$81F9 
    db $D4 
    dw $2102,$81F9 
    db $D0 
    dw $2100 

Spritemap_Hibashi_9:
    dw $0008,$0005 
    db $FF 
    dw $2134,$01F4 
    db $FF 
    dw $6134,$81F9 
    db $F4 
    dw $210C,$81F9 
    db $E6 
    dw $2122,$81F9 
    db $DA 
    dw $2104,$81F9 
    db $D0 
    dw $2120,$81F9 
    db $CA 
    dw $2102,$81F9 
    db $C6 
    dw $2100 

Spritemap_Hibashi_A:
    dw $0009,$0005 
    db $FF 
    dw $2124,$01F4 
    db $FF 
    dw $6124,$81F9 
    db $F8 
    dw $2126,$81F9 
    db $EC 
    dw $210C,$81F8 
    db $E0 
    dw $E106,$81F9 
    db $D4 
    dw $2104,$81F9 
    db $CA 
    dw $2120,$81F9 
    db $C4 
    dw $2102,$81F9 
    db $C0 
    dw $2100 

Spritemap_Hibashi_B:
    dw $000D,$8005 
    db $F7 
    dw $2128,$81EC 
    db $F7 
    dw $6128,$0002 
    db $01 
    dw $2137,$01F8 
    db $01 
    dw $2136,$0002 
    db $F7 
    dw $2127,$01F8 
    db $F7 
    dw $2126,$81F9 
    db $F0 
    dw $2126,$81F9 
    db $E4 
    dw $210C,$81F8 
    db $D8 
    dw $E122,$81F9 
    db $CC 
    dw $2104,$81F9 
    db $C2 
    dw $2120,$81F9 
    db $BC 
    dw $2102,$81F9 
    db $B8 
    dw $2100 

Spritemap_Hibashi_C:
    dw $000E,$8005 
    db $F7 
    dw $212C,$81EC 
    db $F7 
    dw $612C,$81F9 
    db $F8 
    dw $212E,$0002 
    db $FD 
    dw $2137,$01F8 
    db $FD 
    dw $2136,$0002 
    db $F3 
    dw $2127,$01F8 
    db $F3 
    dw $2126,$81F9 
    db $E8 
    dw $2126,$81F9 
    db $DC 
    dw $210C,$81F9 
    db $D0 
    dw $2106,$81F9 
    db $C4 
    dw $2104,$81F9 
    db $BA 
    dw $2120,$81F9 
    db $B4 
    dw $2102,$81F9 
    db $B0 
    dw $2100 

Spritemap_Hibashi_D:
    dw $000E,$8009 
    db $F5 
    dw $212A,$81E8 
    db $F5 
    dw $612A,$81F9 
    db $F8 
    dw $212E,$0002 
    db $F9 
    dw $2137,$01F8 
    db $F9 
    dw $2136,$0002 
    db $EF 
    dw $2127,$01F8 
    db $EF 
    dw $2126,$81F9 
    db $E0 
    dw $2126,$81F9 
    db $D4 
    dw $210C,$81F9 
    db $C8 
    dw $2122,$81F9 
    db $BC 
    dw $2104,$81F9 
    db $B2 
    dw $2120,$81F9 
    db $AC 
    dw $2102,$81F9 
    db $A8 
    dw $2100 

Spritemap_Hibashi_E:
    dw $000C,$81F9 
    db $F4 
    dw $212E,$0002 
    db $F1 
    dw $2137,$01F8 
    db $F1 
    dw $2136,$0002 
    db $E7 
    dw $2127,$01F8 
    db $E7 
    dw $2126,$81F9 
    db $D8 
    dw $2126,$81F9 
    db $CC 
    dw $210C,$81F9 
    db $C0 
    dw $E106,$81F9 
    db $B4 
    dw $2104,$81F9 
    db $AA 
    dw $2120,$81F9 
    db $A4 
    dw $2102,$81F9 
    db $A0 
    dw $2100 

Spritemap_Hibashi_F:
    dw $000E,$0005 
    db $FF 
    dw $2134,$01F4 
    db $FF 
    dw $6134,$81F9 
    db $F0 
    dw $212E,$0002 
    db $E9 
    dw $2137,$01F8 
    db $E9 
    dw $2136,$0002 
    db $DF 
    dw $2127,$01F8 
    db $DF 
    dw $2126,$81F9 
    db $D0 
    dw $2126,$81F9 
    db $C4 
    dw $210C,$81F8 
    db $B8 
    dw $E122,$81F9 
    db $AC 
    dw $2104,$81F9 
    db $A2 
    dw $2120,$81F9 
    db $9C 
    dw $2102,$81F9 
    db $98 
    dw $2100 

Spritemap_Hibashi_10:
    dw $000D,$0005 
    db $FF 
    dw $2124,$01F4 
    db $FF 
    dw $6124,$81F9 
    db $DE 
    dw $212E,$0002 
    db $D7 
    dw $2137,$01F8 
    db $D7 
    dw $2136,$0002 
    db $CD 
    dw $2127,$01F8 
    db $CD 
    dw $2126,$81F9 
    db $C2 
    dw $2126,$81F9 
    db $B6 
    dw $210C,$81F9 
    db $AC 
    dw $2106,$81F9 
    db $A2 
    dw $2104,$81F9 
    db $9A 
    dw $2120,$81F9 
    db $96 
    dw $2100 

Spritemap_Hibashi_11:
    dw $000C,$81F9 
    db $CC 
    dw $212E,$0002 
    db $C9 
    dw $2137,$01F8 
    db $C9 
    dw $2136,$0002 
    db $BF 
    dw $2127,$01F8 
    db $BF 
    dw $2126,$81F9 
    db $B4 
    dw $2126,$81EC 
    db $F7 
    dw $6128,$8005 
    db $F7 
    dw $2128,$81F9 
    db $AA 
    dw $210C,$81F9 
    db $A0 
    dw $2122,$81F9 
    db $98 
    dw $2104,$81F8 
    db $9A 
    dw $2100 

Spritemap_Hibashi_12:
    dw $000B,$81F9 
    db $C0 
    dw $212E,$0003 
    db $BD 
    dw $2137,$01F9 
    db $BD 
    dw $2136,$0003 
    db $B3 
    dw $2127,$01F9 
    db $B3 
    dw $2126,$81FA 
    db $AA 
    dw $2126,$81EC 
    db $F7 
    dw $612A,$8005 
    db $F7 
    dw $212A,$81FA 
    db $A0 
    dw $210C,$81F9 
    db $96 
    dw $E106,$81F9 
    db $98 
    dw $A100 

Spritemap_Hibashi_13:
    dw $0008,$81F9 
    db $B6 
    dw $212E,$0002 
    db $B5 
    dw $2137,$01F8 
    db $B5 
    dw $2136,$0002 
    db $AB 
    dw $2127,$01F8 
    db $AB 
    dw $2126,$81F9 
    db $A2 
    dw $2126,$81F9 
    db $9A 
    dw $210C,$81F9 
    db $9C 
    dw $210E 

Spritemap_Hibashi_14:
    dw $0006,$81F9 
    db $AA 
    dw $212E,$0002 
    db $AD 
    dw $2137,$01F8 
    db $AD 
    dw $2136,$0002 
    db $A3 
    dw $2127,$01F8 
    db $A3 
    dw $2126,$81F9 
    db $9A 
    dw $2126 

Spritemap_Hibashi_15:
    dw $0005,$81F9 
    db $A4 
    dw $212E,$0002 
    db $A5 
    dw $2137,$01F8 
    db $A5 
    dw $2136,$0002 
    db $9B 
    dw $2127,$01F8 
    db $9B 
    dw $2126 

Spritemap_Hibashi_16:
    dw $0001,$81F9 
    db $9C 
    dw $212E 

Palette_Puromi:
    dw $3800,$3E7F,$2DFD,$10FB,$0097,$73FF,$53FF,$37FF 
    dw $17FF,$24DF,$189B,$1076,$0C50,$084B,$5EFF,$0880 

InstList_Puromi:
    dw $0003 
    dw Spritemap_Puromi_0 
    dw $0003 
    dw Spritemap_Puromi_1 
    dw $0003 
    dw Spritemap_Puromi_4 
    dw $0003 
    dw Spritemap_Puromi_2 
    dw $0003 
    dw Spritemap_Puromi_3 
    dw $0003 
    dw Spritemap_Puromi_5 
    dw $0003 
    dw Spritemap_Puromi_0 
    dw $0003 
    dw Spritemap_Puromi_1 
    dw $0003 
    dw Spritemap_Puromi_6 
    dw $0003 
    dw Spritemap_Puromi_2 
    dw $0003 
    dw Spritemap_Puromi_3 
    dw $0003 
    dw Spritemap_Puromi_7 
    dw Instruction_Common_GotoY 
    dw InstList_Puromi 

InitAI_Puromi:
    LDX.W $0E54 
    LDA.W #InstList_Puromi : STA.W $0F92,X 
    LDA.W $0FB4,X 
    AND.W #$00FF 
    STA.W $0FAC,X 
    LDA.W $0FB5,X 
    AND.W #$00FF 
    STA.W $0FAE,X 
    LDA.W $0FB6,X 
    AND.W #$00FF 
    STA.W $0FB0,X 
    LDA.W $0FB7,X 
    AND.W #$00FF 
    STA.W $0FB2,X 
    STA.W $0FAA,X 
    LDA.W #Function_Puromi_Inactive : STA.W $0FA8,X 
    LDA.W $0FB0,X 
    ASL #2
    TAY 
    LDA.W .startAngle_clockwise,Y : STA.L $7E8006,X 
    STA.L $7E8002,X 
    LDA.W .finishAngle_clockwise,Y : STA.L $7E801C,X 
    LDA.W .angleBetweenBodyPartsDoubled_clockwise,Y : STA.L $7E8016,X 
    LDA.W .angleBetweenBodyParts_clockwise,Y : STA.L $7E8018,X 
    LDA.W .risingExplosionAngle_clockwise,Y : STA.L $7E8020,X 
    LDA.W .fallingExplosionAngle_clockwise,Y : STA.L $7E801E,X 
    LDA.W $0FAC,X 
    ASL #3
    TAY 
    LDA.W $0FB0,X 
    BNE .firingUp 
    INY #4
    .firingUp:
    LDA.W CommonEnemySpeeds_LinearlyIncreasing,Y : STA.L $7E800A,X 
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+2,Y : STA.L $7E8008,X 
    LDA.W $0F7A,X : STA.L $7E800C,X 
    LDA.W $0F7E,X : STA.L $7E800E,X 
    LDA.W $0FAE,X : STA.W $0E32 
    LDA.L $7E8006,X 
    JSL.L EightBitCosineMultiplication_A0B0B2 
    CLC 
    ADC.L $7E800C,X 
    STA.L $7E8010,X 
    STA.W $0F7A,X 
    LDA.W $0FAE,X : STA.W $0E32 
    LDA.L $7E8006,X 
    JSL.L EightBitNegativeSineMultiplication_A0B0C6 
    CLC 
    ADC.L $7E800E,X 
    STA.L $7E8012,X 
    STA.W $0F7E,X 
    LDA.W #$0008 : STA.L $7E8014,X 

.loopEnemyProjectiles:
    LDX.W $0E54 
    LDY.W #EnemyProjectile_Puromi 
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    LDA.L $7E8014,X 
    SEC 
    SBC.W #$0002 
    STA.L $7E8014,X 
    BNE .loopEnemyProjectiles 
    LDA.W #$0006 : STA.L $7E8014,X 

.loopSpirteObjects:
    LDX.W $0E54 
    LDA.W $0F7A,X : STA.B $12 
    LDA.W $0F7E,X : STA.B $14 
    LDA.W #$002B : STA.B $16 
    LDA.W $0F96,X 
    ORA.W $0F98,X 
    STA.L $7E8028,X 
    STA.B $18 
    JSL.L Create_Sprite_Object 
    PHX 
    LDA.L $7E8014,X 
    CLC 
    ADC.W $0E54 
    TAX 
    LDA.B $12 : STA.L $7E7820,X 
    PLX 
    LDA.L $7E8014,X 
    SEC 
    SBC.W #$0002 
    STA.L $7E8014,X 
    BNE .loopSpirteObjects 
    RTL 


.startAngle_clockwise:
    dw $0190 

.finishAngle_clockwise:
    dw $00F0 

.startAngle_antiClockwise:
    dw $00F0 

.finishAngle_antiClockwise:
    dw $0190 

.angleBetweenBodyPartsDoubled_clockwise:
    dw $FFE8 

.angleBetweenBodyParts_clockwise:
    dw $FFF4 

.angleBetweenBodyPartsDoubled_antiClockwise:
    dw $0018 

.angleBetweenBodyParts_antiClockwise:
    dw $000C 

.risingExplosionAngle_clockwise:
    dw $0180 

.fallingExplosionAngle_clockwise:
    dw $0100 

.risingExplosionAngle_antiClockwise:
    dw $0100 

.fallingExplosionAngle_antiClockwise:
    dw $0180 

MainAI_Puromi:
    LDX.W $0E54 
    JSR.W ($0FA8,X) 
    RTL 


Function_Puromi_Inactive:
    LDX.W $0E54 
    DEC.W $0FAA,X 
    BPL .return 
    LDA.W $0FB2,X : STA.W $0FAA,X 
    LDA.L $7E8006,X : STA.L $7E8002,X 
    LDA.W #Function_Puromi_Active : STA.W $0FA8,X 
    LDA.W #$0000 : STA.L $7E8026,X 
    STA.L $7E7810,X 
    STA.L $7E7812,X 
    STA.L $7E7814,X 
    STA.L $7E7816,X 
    STA.L $7E7818,X 
    STA.L $7E781A,X 
    STA.L $7E781C,X 
    STA.L $7E781E,X 
    STA.L $7E7830,X 
    STA.L $7E7832,X 
    STA.L $7E7834,X 
    STA.L $7E7836,X 
    STA.L $7E7838,X 
    STA.L $7E783A,X 
    STA.L $7E783C,X 
    STA.L $7E783E,X 
    LDA.W $0F86,X 
    ORA.W #$0800 
    STA.W $0F86,X 

.return:
    RTS 


Function_Puromi_Active:
    LDX.W $0E54 
    LDA.W $0FAE,X : STA.W $0E32 
    LDA.L $7E8002,X 
    JSR.W CheckExplosionCondition 
    STA.B $1E 
    PHA 
    CMP.L $7E8026,X 
    BEQ .matchingExplosionReason 
    LDX.W $0E54 
    LDA.W $0F7A,X : STA.B $12 
    LDA.W $0F7E,X : STA.B $14 
    LDA.W #$002E : STA.B $16 
    LDA.L $7E8028,X : STA.B $18 
    JSL.L Create_Sprite_Object 
    LDA.W $0F7A,X : STA.B $12 
    LDA.W $0F7E,X : STA.B $14 
    LDA.B $1A 
    CLC 
    ADC.W #$002C 
    STA.B $16 
    LDA.L $7E8028,X : STA.B $18 
    JSL.L Create_Sprite_Object 
    JSR.W PlayPuromiExplosionSFX 

.matchingExplosionReason:
    PLA 
    STA.L $7E8026,X 
    LDA.L $7E8002,X 
    JSR.W ClampAngle_CheckInactivityCondition 
    JSL.L EightBitCosineMultiplication_A0B0B2 
    CLC 
    ADC.L $7E800C,X 
    STA.W $0F7A,X 
    LDA.L $7E8002,X 
    JSR.W ClampAngle_CheckInactivityCondition 
    JSL.L EightBitNegativeSineMultiplication_A0B0C6 
    CLC 
    ADC.L $7E800E,X 
    STA.W $0F7E,X 
    JSR.W HandlePuromiProjectiles 
    JSR.W HandlePuromiSpriteObjects 
    CLC 
    LDA.L $7E8000,X 
    ADC.L $7E8008,X 
    STA.L $7E8000,X 
    LDA.L $7E8002,X 
    ADC.L $7E800A,X 
    STA.L $7E8002,X 
    RTS 


HandlePuromiProjectiles:
    LDX.W $0E54 
    LDA.W #$0008 : STA.L $7E8014,X 
    LDA.L $7E8002,X 
    CLC 
    ADC.L $7E8018,X 
    STA.B $24 

.loop:
    LDX.W $0E54 
    LDA.B $24 
    SEC 
    SBC.L $7E8016,X 
    STA.B $24 
    PHX 
    LDA.L $7E8014,X 
    CLC 
    ADC.W $0E54 
    TAX 
    LDA.L $7E7800,X 
    TAY 
    LDA.B $24 
    JSR.W CheckExplosionCondition 
    STA.B $1E 
    PHA 
    CMP.L $7E7810,X 
    BEQ .matchingExplosionReason 
    PHX 
    LDX.W $0E54 
    LDA.W $1A4B,Y : STA.B $12 
    LDA.W $1A93,Y : STA.B $14 
    LDA.W #$002E : STA.B $16 
    LDA.L $7E8028,X : STA.B $18 
    JSL.L Create_Sprite_Object 
    LDA.W $1A4B,Y : STA.B $12 
    LDA.W $1A93,Y : STA.B $14 
    LDA.B $1A 
    CLC 
    ADC.W #$002C 
    STA.B $16 
    LDA.L $7E8028,X : STA.B $18 
    JSL.L Create_Sprite_Object 
    JSR.W PlayPuromiExplosionSFX 
    PLX 

.matchingExplosionReason:
    PLA 
    STA.L $7E7810,X 
    PLX 
    LDA.B $24 
    JSR.W ClampAngle_CheckInactivityCondition 
    JSL.L EightBitCosineMultiplication_A0B0B2 
    CLC 
    ADC.L $7E800C,X 
    STA.W $1A4B,Y 
    LDA.B $24 
    JSR.W ClampAngle_CheckInactivityCondition 
    JSL.L EightBitNegativeSineMultiplication_A0B0C6 
    CLC 
    ADC.L $7E800E,X 
    STA.W $1A93,Y 
    LDA.L $7E8014,X 
    SEC 
    SBC.W #$0002 
    STA.L $7E8014,X 
    BEQ + 
    JMP.W .loop 


  + LDA.B $1C 
    BEQ .return 
    LDA.W #Function_Puromi_Inactive : STA.W $0FA8,X 
    LDA.W $0F86,X 
    AND.W #$F7FF 
    STA.W $0F86,X 

.return:
    RTS 


HandlePuromiSpriteObjects:
    LDX.W $0E54 
    LDA.W #$0006 : STA.L $7E8014,X 
    LDA.L $7E8002,X : STA.B $24 

.loop:
    LDX.W $0E54 
    LDA.B $24 
    SEC 
    SBC.L $7E8016,X 
    STA.B $24 
    PHX 
    LDA.L $7E8014,X 
    CLC 
    ADC.W $0E54 
    TAX 
    LDA.L $7E7820,X 
    TAY 
    LDA.B $24 
    JSR.W CheckExplosionCondition 
    STA.B $1E 
    PHA 
    CMP.L $7E7830,X 
    BEQ .matchingExplosionReason 
    PHX 
    LDX.W $0E54 
    LDA.L $7E8028,X : STA.B $26 
    TYX 
    LDA.L $7EF0F8,X : STA.B $12 
    LDA.L $7EF1F8,X : STA.B $14 
    LDA.W #$002E : STA.B $16 
    LDA.B $26 : STA.B $18 
    JSL.L Create_Sprite_Object 
    LDA.L $7EF0F8,X : STA.B $12 
    LDA.L $7EF1F8,X : STA.B $14 
    LDA.W #$002C 
    CLC 
    ADC.B $1A 
    STA.B $16 
    LDA.B $26 : STA.B $18 
    JSL.L Create_Sprite_Object 
    JSR.W PlayPuromiExplosionSFX 
    PLX 

.matchingExplosionReason:
    PLA 
    STA.L $7E7830,X 
    PLX 
    LDA.B $24 
    JSR.W ClampAngle_CheckInactivityCondition 
    JSL.L EightBitCosineMultiplication_A0B0B2 
    CLC 
    ADC.L $7E800C,X 
    STA.B $20 
    LDA.B $24 
    JSR.W ClampAngle_CheckInactivityCondition 
    JSL.L EightBitNegativeSineMultiplication_A0B0C6 
    CLC 
    ADC.L $7E800E,X 
    STA.B $22 
    PHX 
    TYX 
    LDA.B $20 : STA.L $7EF0F8,X 
    LDA.B $22 : STA.L $7EF1F8,X 
    PLX 
    LDA.L $7E8014,X 
    SEC 
    SBC.W #$0002 
    STA.L $7E8014,X 
    BEQ .return 
    JMP.W .loop 


.return:
    RTS 


ClampAngle_CheckInactivityCondition:
    PHX 
    PHA 
    LDX.W $0E54 
    STZ.B $1C 
    LDA.W $0FB0,X 
    BNE .notClockwise 
    PLA 
    CMP.L $7E801C,X 
    BMI .afterFinish 
    CMP.L $7E8006,X 
    BPL .beforeStart 
    BRA .return 


.notClockwise:
    PLA 
    CMP.L $7E801C,X 
    BPL .afterFinish 
    CMP.L $7E8006,X 
    BMI .beforeStart 
    BRA .return 


.afterFinish:
    INC.B $1C 
    LDA.L $7E801C,X 
    BRA .return 


.beforeStart:
    LDA.L $7E8006,X 
    BRA .return 


.return:
    PLX 
    RTS 


CheckExplosionCondition:
    PHX 
    PHA 
    LDX.W $0E54 
    LDA.W $0FB0,X 
    BNE .notClockwise 
    PLA 
    CMP.L $7E801E,X 
    BMI .clockwiseFalling 
    CMP.L $7E8020,X 
    BMI .clockwiseRising 
    LDA.W #$0000 
    BRA .return 


.notClockwise:
    PLA 
    CMP.L $7E801E,X 
    BPL .antiClockwiseFalling 
    CMP.L $7E8020,X 
    BPL .antiClockwiseRising 
    LDA.W #$0000 
    BRA .return 


.clockwiseRising:
    LDA.W #$0001 : STA.B $1A 
    LDA.W #$0001 
    BRA .return 


.clockwiseFalling:
    LDA.W #$0000 : STA.B $1A 
    LDA.W #$0002 
    BRA .return 


.antiClockwiseRising:
    LDA.W #$0000 : STA.B $1A 
    LDA.W #$0001 
    BRA .return 


.antiClockwiseFalling:
    LDA.W #$0001 : STA.B $1A 
    LDA.W #$0002 
    BRA .return 


.return:
    PLX 
    RTS 


PlayPuromiExplosionSFX:
    PHY 
    PHX 
    LDA.B $1E 
    CMP.W #$0002 
    BEQ .return 
    LDA.W #$005E 
    JSL.L QueueSound_Lib2_Max6 

.return:
    PLX 
    PLY 
    RTS 


RTL_A69952:
    RTL 


RTL_A69953:
    RTL 


Spritemap_Puromi_0:
    dw $0001,$81F9 
    db $F8 
    dw $230A 

Spritemap_Puromi_1:
    dw $0001,$81F9 
    db $F8 
    dw $2308 

Spritemap_Puromi_2:
    dw $0001,$81F8 
    db $F8 
    dw $E30A 

Spritemap_Puromi_3:
    dw $0001,$81F8 
    db $F8 
    dw $E308 

Spritemap_Puromi_4:
    dw $0001,$81F9 
    db $F8 
    dw $2306 

Spritemap_Puromi_5:
    dw $0001,$81F9 
    db $F8 
    dw $2322 

Spritemap_Puromi_6:
    dw $0001,$81F8 
    db $F8 
    dw $E306 

Spritemap_Puromi_7:
    dw $0001,$81F8 
    db $F8 
    dw $E322 

Palette_MiniKraid:
    dw $3800,$559D,$1816,$100D,$4B9F,$3F37,$36D0,$2E69 
    dw $2608,$1DA6,$1125,$08C5,$0003,$094E,$1656,$0000 

InstList_MiniKraid_ChooseAction:
    dw Instruction_MiniKraid_ChooseAction 

InstList_MiniKraid_StepForwards_FacingLeft:
    dw $0010 
    dw Spritemap_MiniKraid_Stepping_FacingLeft_0 
    dw $000C 
    dw Spritemap_MiniKraid_Stepping_FacingLeft_1 
    dw $0008 
    dw Spritemap_MiniKraid_Stepping_FacingLeft_2 
    dw $000C 
    dw Spritemap_MiniKraid_Stepping_FacingLeft_3 
    dw Instruction_MiniKraid_Move 
    dw Instruction_Common_GotoY 
    dw InstList_MiniKraid_ChooseAction 

InstList_MiniKraid_ChooseAction_duplicate:
    dw Instruction_MiniKraid_ChooseAction 

InstList_MiniKraid_StepBackwards_FacingLeft:
    dw $0010 
    dw Spritemap_MiniKraid_Stepping_FacingLeft_0 
    dw Instruction_MiniKraid_Move 
    dw $000C 
    dw Spritemap_MiniKraid_Stepping_FacingLeft_3 
    dw $0008 
    dw Spritemap_MiniKraid_Stepping_FacingLeft_2 
    dw $000C 
    dw Spritemap_MiniKraid_Stepping_FacingLeft_1 
    dw Instruction_CommonA6_GotoY 
    dw InstList_MiniKraid_ChooseAction_duplicate 

InstList_MiniKraid_FireSpit_FacingLeft:
    dw $0010 
    dw Spritemap_MiniKraid_FiringSpit_FacingLeft_0 
    dw Instruction_MiniKraid_PlayCrySFX 
    dw $0008 
    dw Spritemap_MiniKraid_FiringSpit_FacingLeft_1 
    dw Instruction_MiniKraid_FireSpitLeft 
    dw $0010 
    dw Spritemap_MiniKraid_FiringSpit_FacingLeft_2 
    dw $0008 
    dw Spritemap_MiniKraid_FiringSpit_FacingLeft_1 
    dw Instruction_Common_GotoY 
    dw InstList_MiniKraid_ChooseAction 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_MiniKraid_Standing_FacingLeft_A699F4:
    dw $7FFF 
    dw Spritemap_MiniKraid_FiringSpit_FacingLeft_0 
    dw Instruction_Common_Sleep 
endif ; !FEATURE_KEEP_UNREFERENCED

InstList_MiniKraid_ChooseAction_duplicate_again2:
    dw Instruction_MiniKraid_ChooseAction 

InstList_MiniKraid_StepForwards_FacingRight:
    dw $0010 
    dw Spritemap_MiniKraid_Stepping_FacingRight_0 
    dw $000C 
    dw Spritemap_MiniKraid_Stepping_FacingRight_1 
    dw $0008 
    dw Spritemap_MiniKraid_Stepping_FacingRight_2 
    dw $000C 
    dw Spritemap_MiniKraid_Stepping_FacingRight_3 
    dw Instruction_MiniKraid_Move 
    dw Instruction_Common_GotoY 
    dw InstList_MiniKraid_ChooseAction_duplicate_again2 

InstList_MiniKraid_ChooseAction_duplicate_again3:
    dw Instruction_MiniKraid_ChooseAction 

InstList_MiniKraid_StepBackwards_FacingRight:
    dw $0010 
    dw Spritemap_MiniKraid_Stepping_FacingRight_0 
    dw Instruction_MiniKraid_Move 
    dw $000C 
    dw Spritemap_MiniKraid_Stepping_FacingRight_3 
    dw $0008 
    dw Spritemap_MiniKraid_Stepping_FacingRight_2 
    dw $000C 
    dw Spritemap_MiniKraid_Stepping_FacingRight_1 
    dw Instruction_Common_GotoY 
    dw InstList_MiniKraid_ChooseAction_duplicate_again3 

InstList_MiniKraid_FireSpit_FacingRight:
    dw $0010 
    dw Spritemap_MiniKraid_FiringSpit_FacingRight_0 
    dw Instruction_MiniKraid_PlayCrySFX 
    dw $0008 
    dw Spritemap_MiniKraid_FiringSpit_FacingRight_1 
    dw Instruction_MiniKraid_FireSpitRight 
    dw $0010 
    dw Spritemap_MiniKraid_FiringSpit_FacingRight_2 
    dw $0008 
    dw Spritemap_MiniKraid_FiringSpit_FacingRight_1 
    dw Instruction_Common_GotoY 
    dw InstList_MiniKraid_ChooseAction_duplicate_again2 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_MiniKraid_Standing_FacingRight_A69A42:
    dw $7FFF 
    dw Spritemap_MiniKraid_FiringSpit_FacingRight_0 
    dw Instruction_Common_Sleep 
endif ; !FEATURE_KEEP_UNREFERENCED

MiniKraidSpitVelocityTable_leftward_X1:
    dw $FE00 

MiniKraidSpitVelocityTable_leftward_Y1:
    dw $FB00 

MiniKraidSpitVelocityTable_leftward_X2:
    dw $FC00 

MiniKraidSpitVelocityTable_leftward_Y2:
    dw $FB00 

MiniKraidSpitVelocityTable_rightward_X1:
    dw $0200 

MiniKraidSpitVelocityTable_rightward_Y1:
    dw $FB00 

MiniKraidSpitVelocityTable_rightward_X2:
    dw $0400 

MiniKraidSpitVelocityTable_rightward_Y2:
    dw $FB00 

InitAI_MiniKraid:
    LDX.W $0E54 
    LDA.W $05E5 
    AND.W #$0003 
    CLC 
    ADC.W #$0002 
    STA.W $0FAE,X 
    STA.W $0FB0,X 
    CLC 
    ADC.W #$0040 
    STA.L $7E7806,X 
    CLC 
    ADC.W #$0020 
    STA.L $7E7808,X 
    CLC 
    ADC.W #$FFD0 
    STA.L $7E780A,X 
    LDA.W #$0000 : STA.L $7E780E,X 
    LDA.W $0F86,X 
    ORA.W #$2000 
    STA.W $0F86,X 
    LDA.W #$0001 : STA.W $0F94,X 
    STZ.W $0F90,X 
    LDA.W #$FFFC : STA.W $0FAA,X 
    STA.W $0FAC,X 
    LDY.W #InstList_MiniKraid_StepForwards_FacingLeft 
    LDA.W $0F7A,X 
    SEC 
    SBC.W $0AF6 
    BPL .keepLeft 
    LDA.W #$0004 : STA.W $0FAA,X 
    STA.W $0FAC,X 
    LDY.W #InstList_MiniKraid_StepForwards_FacingRight 

.keepLeft:
    TYA 
    STA.W $0F92,X 
    RTL 


MainAI_MiniKraid:
    LDX.W $0E54 
    LDA.L $7E780E,X 
    TAY 
    INC #2
    CMP.W #$0006 
    BMI + 
    LDA.W #$0000 

  + STA.L $7E780E,X 
    JSR.W HandleMiniKraidSpike 
    RTL 


HandleMiniKraidSpike:
    PHX 
    TYA 
    STX.B $12 
    CLC 
    ADC.B $12 
    TAX 
    LDA.L $7E7806,X 
    BEQ .timerExpired 
    DEC A 
    STA.L $7E7806,X 
    PLX 
    RTS 


.timerExpired:
    LDA.W $05E5 
    AND.W #$003F 
    CLC 
    ADC.W #$0010 
    STA.L $7E7806,X 
    TYA 
    PLX 
    STA.L $7E780C,X 
    LDY.W #EnemyProjectile_MiniKraidSpikes_Left 
    LDA.W $0FAC,X 
    BMI .keepLeft 
    LDY.W #EnemyProjectile_MiniKraidSpikes_Right 

.keepLeft:
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    JSL.L CheckIfEnemyCenterIsOnScreen 
    AND.L $00FFFF ; >.<
    BNE .return 
    LDA.W #$003F 
    JSL.L QueueSound_Lib2_Max6 

.return:
    RTS 


Instruction_MiniKraid_Move:
    PHY 
    LDX.W $0E54 
    LDA.W $0FB0,X 
    BEQ + 
    DEC.W $0FB0,X 

  + DEC.W $0FAE,X 
    BNE .nonZeroCounter 
    LDA.W $05E5 
    AND.W #$0003 
    CLC 
    ADC.W #$0007 
    STA.W $0FAE,X 
    BRA .negateEnemyXVelocity 


.nonZeroCounter:
    LDA.W $0FAA,X : STA.B $14 
    STZ.B $12 
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes 
    BCC .noCollision 

.negateEnemyXVelocity:
    LDA.W $0FAA,X 
    EOR.W #$FFFF 
    INC A 
    STA.W $0FAA,X 

.noCollision:
    LDA.W #$FFFC : STA.W $0FAC,X 
    LDA.W $0F7A,X 
    SEC 
    SBC.W $0AF6 
    BPL .return 
    LDA.W #$0004 : STA.W $0FAC,X 

.return:
    PLY 
    RTL 


Instruction_MiniKraid_ChooseAction:
    LDX.W $0E54 
    LDA.W $0FB0,X 
    BNE .step 
    LDA.W $05E5 
    AND.W #$0003 
    CLC 
    ADC.W #$0003 
    STA.W $0FB0,X 
    LDY.W #InstList_MiniKraid_FireSpit_FacingRight 
    LDA.W $0FAC,X 
    BPL .return 
    LDY.W #InstList_MiniKraid_FireSpit_FacingLeft 
    RTL 


.step:
    LDA.W $0FAC,X 
    BMI .left 
    LDY.W #InstList_MiniKraid_StepForwards_FacingRight 
    LDA.W $0FAA,X 
    BPL .return 
    LDY.W #InstList_MiniKraid_StepBackwards_FacingRight 

.return:
    RTL 


.left:
    LDY.W #InstList_MiniKraid_StepForwards_FacingLeft 
    LDA.W $0FAA,X 
    BMI .return 
    LDY.W #InstList_MiniKraid_StepBackwards_FacingLeft 
    RTL 


Instruction_MiniKraid_PlayCrySFX:
    JSL.L CheckIfEnemyCenterIsOnScreen 
    AND.L $00FFFF ; >.<
    BNE .return 
    LDA.W #$0016 
    JSL.L QueueSound_Lib2_Max6 

.return:
    RTL 


Instruction_MiniKraid_FireSpitLeft:
    PHY 
    LDY.W #$0000 
    LDA.W #$FFFC ; fallthrough to FireMiniKraidSpit_Common

FireMiniKraidSpit_Common:
    LDX.W $0E54 
    PHY 
    PHX 
    STA.L $7E7804,X 
    LDA.W MiniKraidSpitVelocityTable_leftward_X1,Y : STA.L $7E7800,X 
    LDA.W MiniKraidSpitVelocityTable_leftward_Y1,Y : STA.L $7E7802,X 
    LDY.W #EnemyProjectile_MiniKraidSpit 
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    PLX 
    PLY 
    LDA.W MiniKraidSpitVelocityTable_leftward_X2,Y : STA.L $7E7800,X 
    LDA.W MiniKraidSpitVelocityTable_leftward_Y2,Y : STA.L $7E7802,X 
    LDY.W #EnemyProjectile_MiniKraidSpit 
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    PLY 
    RTL 


Instruction_MiniKraid_FireSpitRight:
    PHY 
    LDY.W #$0008 
    LDA.W #$0004 
    BRA FireMiniKraidSpit_Common 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_PowerBombReaction_MiniKraid_A69C0B:
    LDX.W $0E54 
    LDA.W $0F7A,X : STA.L $7EF434 
    LDA.W $0F7E,X : STA.L $7EF436 
    JSL.L NormalEnemyPowerBombAI_NoDeathCheck_External 
    BRA Reaction_MiniKraid_Common 
endif ; !FEATURE_KEEP_UNREFERENCED


EnemyTouch_MiniKraid:
    LDX.W $0E54 
    LDA.W $0F7A,X : STA.L $7EF434 
    LDA.W $0F7E,X : STA.L $7EF436 
    JSL.L NormalEnemyTouchAI_NoDeathCheck_External 
    BRA Reaction_MiniKraid_Common 


EnemyShot_PowerBombReaction_MiniKraid:
    LDX.W $0E54 
    LDA.W $0F7A,X : STA.L $7EF434 
    LDA.W $0F7E,X : STA.L $7EF436 
    JSL.L NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External 
    BRA Reaction_MiniKraid_Common ; >.<


Reaction_MiniKraid_Common:
    LDX.W $0E54 
    LDA.W $0F8C,X 
    BNE .return 
    LDA.W #$0003 
    JSL.L EnemyDeath 
    JSL.L MiniKraidDeathItemDropRoutine 

.return:
    RTL 


Spritemap_MiniKraid_Stepping_FacingLeft_0:
    dw $0010,$01E2 
    db $17 
    dw $2125,$81EA 
    db $0F 
    dw $2116,$81EA 
    db $07 
    dw $2106,$81FB 
    db $0F 
    dw $2163,$8001 
    db $0F 
    dw $2100,$000D 
    db $17 
    dw $2120,$01E8 
    db $F2 
    dw $211E,$0014 
    db $15 
    dw $2130,$81F0 
    db $DF 
    dw $2102,$81F8 
    db $DF 
    dw $2103,$81F8 
    db $EF 
    dw $2123,$81E8 
    db $EF 
    dw $2121,$81F3 
    db $0F 
    dw $2162,$81E3 
    db $0F 
    dw $2160,$81F3 
    db $FF 
    dw $2142,$81E3 
    db $FF 
    dw $2140 

Spritemap_MiniKraid_Stepping_FacingLeft_1:
    dw $0010,$81EA 
    db $0F 
    dw $2119,$81EA 
    db $07 
    dw $2109,$01E4 
    db $17 
    dw $2125,$81FB 
    db $0E 
    dw $2163,$8002 
    db $0D 
    dw $2100,$000D 
    db $15 
    dw $2120,$01E8 
    db $F1 
    dw $211E,$0013 
    db $17 
    dw $2130,$81F0 
    db $DE 
    dw $2102,$81F8 
    db $DE 
    dw $2103,$81F8 
    db $EE 
    dw $2123,$81E8 
    db $EE 
    dw $2121,$81F3 
    db $0E 
    dw $2162,$81E3 
    db $0E 
    dw $2160,$81F3 
    db $FE 
    dw $2142,$81E3 
    db $FE 
    dw $2140 

Spritemap_MiniKraid_Stepping_FacingLeft_2:
    dw $0010,$01E1 
    db $14 
    dw $212B,$81E9 
    db $0C 
    dw $211C,$81E9 
    db $04 
    dw $210C,$81FB 
    db $0D 
    dw $2163,$8001 
    db $0F 
    dw $2100,$000D 
    db $15 
    dw $2120,$01E8 
    db $F0 
    dw $211E,$0014 
    db $14 
    dw $2130,$81F0 
    db $DD 
    dw $2102,$81F8 
    db $DD 
    dw $2103,$81F8 
    db $ED 
    dw $2123,$81E8 
    db $ED 
    dw $2121,$81F3 
    db $0D 
    dw $2162,$81E3 
    db $0D 
    dw $2160,$81F3 
    db $FD 
    dw $2142,$81E3 
    db $FD 
    dw $2140 

Spritemap_MiniKraid_Stepping_FacingLeft_3:
    dw $0010,$01DA 
    db $17 
    dw $2154,$81E2 
    db $0F 
    dw $2145,$81EA 
    db $07 
    dw $2136,$81FB 
    db $0D 
    dw $2163,$8002 
    db $10 
    dw $2100,$000D 
    db $12 
    dw $2120,$01E8 
    db $F0 
    dw $211E,$0013 
    db $0F 
    dw $2130,$81F0 
    db $DD 
    dw $2102,$81F8 
    db $DD 
    dw $2103,$81F8 
    db $ED 
    dw $2123,$81E8 
    db $ED 
    dw $2121,$81F3 
    db $0D 
    dw $2162,$81E3 
    db $0D 
    dw $2160,$81F3 
    db $FD 
    dw $2142,$81E3 
    db $FD 
    dw $2140 

Spritemap_MiniKraid_FiringSpit_FacingLeft_0:
    dw $0010,$01E8 
    db $F2 
    dw $210E,$01E2 
    db $17 
    dw $2125,$81EA 
    db $0F 
    dw $2116,$81EA 
    db $07 
    dw $2106,$81FB 
    db $0F 
    dw $2163,$8002 
    db $12 
    dw $2100,$000F 
    db $17 
    dw $2120,$0016 
    db $18 
    dw $2130,$81F0 
    db $DF 
    dw $2102,$81F8 
    db $DF 
    dw $2103,$81F8 
    db $EF 
    dw $2123,$81E8 
    db $EF 
    dw $2121,$81F3 
    db $0F 
    dw $2162,$81E3 
    db $0F 
    dw $2160,$81F3 
    db $FF 
    dw $2142,$81E3 
    db $FF 
    dw $2140 

Spritemap_MiniKraid_FiringSpit_FacingLeft_1:
    dw $0010,$81F8 
    db $EF 
    dw $215A,$01E8 
    db $F2 
    dw $210E,$81F8 
    db $DF 
    dw $213A,$81E8 
    db $EF 
    dw $2158,$81F0 
    db $DF 
    dw $2139,$01E2 
    db $17 
    dw $2125,$81EA 
    db $0F 
    dw $2116,$81EA 
    db $07 
    dw $2106,$81FB 
    db $0F 
    dw $2163,$8002 
    db $12 
    dw $2100,$000F 
    db $17 
    dw $2120,$0016 
    db $18 
    dw $2130,$81F3 
    db $0F 
    dw $2162,$81E3 
    db $0F 
    dw $2160,$81F3 
    db $FF 
    dw $2142,$81E3 
    db $FF 
    dw $2140 

Spritemap_MiniKraid_FiringSpit_FacingLeft_2:
    dw $0010,$81F0 
    db $DF 
    dw $213D,$81F8 
    db $EF 
    dw $215E,$81F8 
    db $DF 
    dw $213E,$01E8 
    db $F2 
    dw $210E,$81E8 
    db $EF 
    dw $2158,$01E2 
    db $17 
    dw $2125,$81EA 
    db $0F 
    dw $2116,$81EA 
    db $07 
    dw $2106,$81FB 
    db $0F 
    dw $2163,$8002 
    db $12 
    dw $2100,$000F 
    db $17 
    dw $2120,$0016 
    db $18 
    dw $2130,$81F3 
    db $0F 
    dw $2162,$81E3 
    db $0F 
    dw $2160,$81F3 
    db $FF 
    dw $2142,$81E3 
    db $FF 
    dw $2140 

Spritemap_MiniKraid_Stepping_FacingRight_0:
    dw $0010,$0016 
    db $17 
    dw $6125,$8006 
    db $0F 
    dw $6116,$8006 
    db $07 
    dw $6106,$81F5 
    db $0F 
    dw $6163,$81EF 
    db $0F 
    dw $6100,$01EB 
    db $17 
    dw $6120,$0010 
    db $F2 
    dw $611E,$01E4 
    db $15 
    dw $6130,$8000 
    db $DF 
    dw $6102,$81F8 
    db $DF 
    dw $6103,$81F8 
    db $EF 
    dw $6123,$8008 
    db $EF 
    dw $6121,$81FD 
    db $0F 
    dw $6162,$800D 
    db $0F 
    dw $6160,$81FD 
    db $FF 
    dw $6142,$800D 
    db $FF 
    dw $6140 

Spritemap_MiniKraid_Stepping_FacingRight_1:
    dw $0010,$8006 
    db $0F 
    dw $6119,$8006 
    db $07 
    dw $6109,$0014 
    db $17 
    dw $6125,$81F5 
    db $0E 
    dw $6163,$81EE 
    db $0D 
    dw $6100,$01EB 
    db $15 
    dw $6120,$0010 
    db $F1 
    dw $611E,$01E5 
    db $17 
    dw $6130,$8000 
    db $DE 
    dw $6102,$81F8 
    db $DE 
    dw $6103,$81F8 
    db $EE 
    dw $6123,$8008 
    db $EE 
    dw $6121,$81FD 
    db $0E 
    dw $6162,$800D 
    db $0E 
    dw $6160,$81FD 
    db $FE 
    dw $6142,$800D 
    db $FE 
    dw $6140 

Spritemap_MiniKraid_Stepping_FacingRight_2:
    dw $0010,$0017 
    db $14 
    dw $612B,$8007 
    db $0C 
    dw $611C,$8007 
    db $04 
    dw $610C,$81F5 
    db $0D 
    dw $6163,$81EF 
    db $0F 
    dw $6100,$01EB 
    db $15 
    dw $6120,$0010 
    db $F0 
    dw $611E,$01E4 
    db $14 
    dw $6130,$8000 
    db $DD 
    dw $6102,$81F8 
    db $DD 
    dw $6103,$81F8 
    db $ED 
    dw $6123,$8008 
    db $ED 
    dw $6121,$81FD 
    db $0D 
    dw $6162,$800D 
    db $0D 
    dw $6160,$81FD 
    db $FD 
    dw $6142,$800D 
    db $FD 
    dw $6140 

Spritemap_MiniKraid_Stepping_FacingRight_3:
    dw $0010,$001E 
    db $17 
    dw $6154,$800E 
    db $0F 
    dw $6145,$8006 
    db $07 
    dw $6136,$81F5 
    db $0D 
    dw $6163,$81EE 
    db $10 
    dw $6100,$01EB 
    db $12 
    dw $6120,$0010 
    db $F0 
    dw $611E,$01E5 
    db $0F 
    dw $6130,$8000 
    db $DD 
    dw $6102,$81F8 
    db $DD 
    dw $6103,$81F8 
    db $ED 
    dw $6123,$8008 
    db $ED 
    dw $6121,$81FD 
    db $0D 
    dw $6162,$800D 
    db $0D 
    dw $6160,$81FD 
    db $FD 
    dw $6142,$800D 
    db $FD 
    dw $6140 

Spritemap_MiniKraid_FiringSpit_FacingRight_0:
    dw $0010,$0010 
    db $F2 
    dw $610E,$0016 
    db $17 
    dw $6125,$8006 
    db $0F 
    dw $6116,$8006 
    db $07 
    dw $6106,$81F5 
    db $0F 
    dw $6163,$81EE 
    db $12 
    dw $6100,$01E9 
    db $17 
    dw $6120,$01E2 
    db $18 
    dw $6130,$8000 
    db $DF 
    dw $6102,$81F8 
    db $DF 
    dw $6103,$81F8 
    db $EF 
    dw $6123,$8008 
    db $EF 
    dw $6121,$81FD 
    db $0F 
    dw $6162,$800D 
    db $0F 
    dw $6160,$81FD 
    db $FF 
    dw $6142,$800D 
    db $FF 
    dw $6140 

Spritemap_MiniKraid_FiringSpit_FacingRight_1:
    dw $0010,$81F8 
    db $EF 
    dw $615A,$0010 
    db $F2 
    dw $610E,$81F8 
    db $DF 
    dw $613A,$8008 
    db $EF 
    dw $6158,$8000 
    db $DF 
    dw $6139,$0016 
    db $17 
    dw $6125,$8006 
    db $0F 
    dw $6116,$8006 
    db $07 
    dw $6106,$81F5 
    db $0F 
    dw $6163,$81EE 
    db $12 
    dw $6100,$01E9 
    db $17 
    dw $6120,$01E2 
    db $18 
    dw $6130,$81FD 
    db $0F 
    dw $6162,$800D 
    db $0F 
    dw $6160,$81FD 
    db $FF 
    dw $6142,$800D 
    db $FF 
    dw $6140 

Spritemap_MiniKraid_FiringSpit_FacingRight_2:
    dw $0010,$8000 
    db $DF 
    dw $613D,$81F8 
    db $EF 
    dw $615E,$81F8 
    db $DF 
    dw $613E,$0010 
    db $F2 
    dw $610E,$8008 
    db $EF 
    dw $6158,$0016 
    db $17 
    dw $6125,$8006 
    db $0F 
    dw $6116,$8006 
    db $07 
    dw $6106,$81F5 
    db $0F 
    dw $6163,$81EE 
    db $12 
    dw $6100,$01E9 
    db $17 
    dw $6120,$01E2 
    db $18 
    dw $6130,$81FD 
    db $0F 
    dw $6162,$800D 
    db $0F 
    dw $6160,$81FD 
    db $FF 
    dw $6142,$800D 
    db $FF 
    dw $6140 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_MiniKraid_A6A0E0:
    dw $0001,$01FD 
    db $FD 
    dw $211F 

UNUSED_Spritemap_MiniKraid_A6A0E7:
    dw $0001,$01FC 
    db $FC 
    dw $210F 

UNUSED_Spritemap_MiniKraid_A6A0EE:
    dw $0001,$01FC 
    db $FC 
    dw $610F 
endif ; !FEATURE_KEEP_UNREFERENCED

InitAI_Ridley:
    LDX.W $079F 
    LDA.L $7ED828,X 
    AND.W #$0001 
    BEQ .notDead 
    LDA.W $0F86 
    AND.W #$FFFF 
    ORA.W #$0700 
    STA.W $0F86 
    RTL 


.notDead:
    PHB 
    PEA.W $7E7E 
    PLB 
    PLB 
    LDA.W #$0000 
    LDX.W #$0FFE 

.loopClearExtraRAM:
    STA.W $2000,X 
    DEX #2
    BPL .loopClearExtraRAM 
    PLB 
    JSL.L DisableMinimap_MarkBossRoomTilesExplored 
    STZ.W $0FB4 
    STZ.W $0FB6 
    LDA.W #InstList_Ridley_FacingLeft_Initial 
    JSR.W SetRidleyInstList 
    LDA.W #$0E00 : STA.W $0F96 
    STA.L $7E7818 
    LDA.W $0F88 
    ORA.W #$0004 
    STA.W $0F88 
    LDA.W #$0000 : STA.L $7E7802 
    STA.L $7E781A 
    STZ.W $183E 
    STZ.W $1840 
    JSR.W InitializeTailParts 
    JSR.W InitializeRibAnimation 
    LDA.W $079F 
    CMP.W #$0002 
    BEQ .norfair 
    JMP.W .ceres 


.norfair:
    LDA.W $0F86 
    ORA.W #$1400 
    STA.W $0F86 
    LDA.W #$0060 : STA.W $0F7A 
    LDA.W #$018A : STA.W $0F7E 
    LDA.W #Function_Ridley_Startup_Liftoff_FacingRight ; >_<
    LDA.W #Function_Ridley_Startup_FirstRun : STA.W $0FA8 
    STZ.W $0FAA 
    STZ.W $0FAC 
    LDA.W #$0005 : STA.W $0F9A 
    LDA.W #$0000 : STA.L $7E7802 ; >.<
    INC A 
    STA.L $7E7804 
    LDA.W #$0040 : STA.L $7E8000 
    LDA.W #$01A0 : STA.L $7E8002 
    LDA.W #$0040 : STA.L $7E8004 
    LDA.W #$00E0 : STA.L $7E8006 
    LDA.W #$0002 : STA.L $7E7820 
    LDA.W #$0078 : STA.L $7E7838 
    LDY.W #Palette_NorfairRidleyInit 
    LDX.W #$0140 
    LDA.W #$0020 
    JSL.L WriteAColorsFromYToTargetColorIndexX 
    LDX.W #$00E2 
    LDX.W #$0000 
    LDY.W #$000F 
    LDA.W #$0000 

.loopClearPalettes:
    STA.L $7EC2E2,X 
    STA.L $7EC3E2,X 
    INX #2
    DEY 
    BNE .loopClearPalettes 
    RTL 


.ceres:
    LDA.W $0F86 
    ORA.W #$1400 
    STA.W $0F86 
    LDA.W #$00BA : STA.W $0F7A 
    LDA.W #$00A9 : STA.W $0F7E 
    LDA.W #$0000 : STA.W $093F 
    STA.L $7E7820 
    STA.L $7E7804 
    INC A 
    STA.L $7E2002 
    LDA.W #$000F : STA.L $7E7838 
    LDA.W #Function_Ridley_Startup_FirstRun : STA.W $0FA8 
    STZ.W $0FAA 
    STZ.W $0FAC 
    LDA.W #$FFE0 : STA.L $7E8000 
    LDA.W #$00B0 : STA.L $7E8002 
    LDA.W #$0028 : STA.L $7E8004 
    LDA.W #$00E0 : STA.L $7E8006 
    LDY.W #Palette_CeresRidleyInit 
    LDX.W #$0140 
    LDA.W #$0020 
    JSL.L WriteAColorsFromYToTargetColorIndexX 
    LDX.W #$01E2 
    LDY.W #$000F 
    LDA.W #$0000 

.loopClearSpritePalette7:
    STA.L $7EC200,X 
    INX #2
    DEY 
    BNE .loopClearSpritePalette7 
    LDA.W #InstList_BabyMetroidCutscene_0 : STA.L $7E7806 
    LDA.W #$0001 : STA.L $7E7808 
    LDA.W #UpdateBabyMetroidPosition_CarriedInArms : STA.L $7E8800 
    LDA.W #$0005 : STA.L $7E780E 
    LDA.W #$0000 
    JSL.L QueueMusicDataOrTrack_8FrameDelay 
    RTL 


MainAI_RidleyCeres:
    LDA.W #$7FFF : STA.W $0F8C 
    PEA.W .manualReturn-1 
    JMP.W ($0FA8) 


.manualReturn:
    LDA.W $093F 
    BNE .return 
    LDA.L $7E7804 
    BEQ HandleBabyMetroidCapsuleInteractions 
    JSR.W MakeRidleysWingsAndTailFlashWhenHit 
    JSR.W HandleMovementAndMainBodyWallCollisions 
    JSR.W HandleWingFlapping 
    JSR.W RNGChanceToChooseNewTailSwingDelay 
    JSR.W HandleRidleyTailAI 
    JSR.W DetermineAndSetCeresRidleysColorPalette 
    JSR.W AnimateRidleysRibs 
    JSR.W DrawRidleyTail 
    JSR.W DrawRidleysWings 
    BRA HandleBabyMetroidCapsuleInteractions 


.return:
    RTL 


RNGChanceToChooseNewTailSwingDelay:
    LDA.W $05E5 
    CMP.W #$FF00 
    BCC .return 
    LDA.W $05E5 ; >.<
    AND.W #$000F 
    ADC.W #$0007 
    STA.L $7E201E 

.return:
    RTS 


HurtAI_RidleyCeres:
    JSR.W MakeRidleysWingsAndTailFlashWhenHit 
    JSR.W DrawRidleyTail 
    JSR.W DrawRidleysWings ; fallthrough to HandleBabyMetroidCapsuleInteractions

HandleBabyMetroidCapsuleInteractions:
    JSR.W HandleCarryingBabyMetroid 
    LDA.L $7E7804 
    BEQ EnemyGraphicsDrawnHook_RidleyCeres_DrawBabyMetroidAndDoor 
    LDA.W #EnemyGraphicsDrawnHook_RidleyCeres_DrawBabyMetroidAndDoor>>8&$FF00 : STA.W $178D 
    LDA.W #EnemyGraphicsDrawnHook_RidleyCeres_DrawBabyMetroidAndDoor : STA.W $178C 
    RTL 


EnemyGraphicsDrawnHook_RidleyCeres_DrawBabyMetroidAndDoor:
    LDA.W $093F 
    BNE .skipBaby 
    JSR.W DrawBabyMetroid 

.skipBaby:
    LDA.W $0FEA 
    BEQ .return 
    LDA.W $1840 
    AND.W #$0003 
    TAX 
    LDA.W CeresDoorOffsetsDuringEarthquake,X 
    CLC 
    ADC.W $0FBA 
    STA.B $14 
    LDA.W $0FBE : STA.B $12 
    LDA.W #$0400 : STA.B $16 
    LDY.W #Spritemap_CeresDoor 
    JSL.L AddSpritemapToOAM 

.return:
    RTL 


CeresDoorOffsetsDuringEarthquake:
    dw $0000,$FFFC,$FFFF,$0003 

Spritemap_CeresDoor:
    dw $0008,$0000 
    db $18 
    dw $A0D1,$0000 
    db $E0 
    dw $20D1,$0000 
    db $10 
    dw $A0D3,$0000 
    db $E8 
    dw $20D3,$0000 
    db $00 
    dw $A0F2,$0000 
    db $08 
    dw $A0E2,$0000 
    db $F8 
    dw $20F2,$0000 
    db $F0 
    dw $20E2 

RTL_A6A353:
    RTL 


Function_Ridley_ResetSpeeds:
    STZ.W $0FAA 
    STZ.W $0FAC 
    RTS 


Function_Ridley_Startup_FirstRun:
    LDA.W $0797 
    BNE Function_Ridley_Startup_InitalWait_return 
    LDA.W #Function_Ridley_Startup_InitalWait : STA.W $0FA8 
    LDA.W #$0200 
    LDY.W $079F 
    CPY.W #$0002 
    BNE .notNorfar 
    LDA.W #$00AA 

.notNorfar:
    STA.W $0FB2 ; fallthrough to Function_Ridley_Startup_InitalWait

Function_Ridley_Startup_InitalWait:
    DEC.W $0FB2 
    BPL Function_Ridley_Startup_InitalWait_return 
    LDA.W #Function_Ridley_Startup_EyesAppear_Wait : STA.W $0FA8 
    STZ.W $0FB0 
    STZ.W $0FB2 

Function_Ridley_Startup_InitalWait_return:
    RTS 


Function_Ridley_Startup_EyesAppear_Wait:
    LDA.W $0FB0 
    BMI .return 
    TAY 
    INC.W $0FB2 
    LDA.W $0FB2 
    CMP.W #$0001 
    BCC .return 
    STZ.W $0FB2 
    TYX 
    LDA.W CeresRidleyEyeFadeInIndices,X 
    AND.W #$00FF 
    CMP.W #$00FF 
    BEQ .done 
    STA.B $12 
    ASL A 
    CLC 
    ADC.B $12 
    ASL A 
    TAY 
    INX 
    STX.W $0FB0 
    LDX.W #$01F8 
    LDA.W CeresRidleyEyeFadeInColors_0,Y : STA.L $7EC000,X 
    LDA.W CeresRidleyEyeFadeInColors_1,Y : STA.L $7EC002,X 
    LDA.W CeresRidleyEyeFadeInColors_2,Y : STA.L $7EC004,X 

.return:
    RTS 


.done:
    STZ.W $0FB0 
    LDA.W #Function_Ridley_Startup_MainBodyAppears : STA.W $0FA8 
    LDA.W #$0001 : STA.L $7E7804 
    RTS 


Function_Ridley_Startup_MainBodyAppears:
    INC.W $0FB2 
    LDA.W $0FB2 
    CMP.W #$0002 
    BCC .return 
    STZ.W $0FB2 
    LDY.W $0FB0 
    LDA.W #$0122 : STA.B $12 
    LDA.W #$01E2 : STA.B $14 
    LDA.W #$000B 

.loop:
    PHA 
    LDA.W Palette_Ridley_FadeIn,Y 
    LDX.B $12 
    STA.L $7EC000,X 
    LDX.B $14 
    STA.L $7EC000,X 
    INY #2
    INC.B $12 
    INC.B $12 
    INC.B $14 
    INC.B $14 
    PLA 
    DEC A 
    BNE .loop 
    CPY.W #$0160 
    BCS .done 
    STY.W $0FB0 

.return:
    RTS 


.done:
    LDA.W $079F 
    CMP.W #$0002 
    BNE .notCeres 
    LDA.W #$0002 : STA.W $0F9A 

.notCeres:
    LDA.W $0F86 
    AND.W #$FBFF 
    STA.W $0F86 
    LDY.W #$0000 
    STY.W $0FB0 
    LDA.W #Function_Ridley_Startup_RidleyRoars : STA.W $0FA8 
    LDA.W #$0004 : STA.W $0FB2 
    LDA.W #$0005 
    JSL.L QueueMusicDataOrTrack_8FrameDelay 
    RTS 


Function_Ridley_Startup_RidleyRoars:
    DEC.W $0FB2 
    BPL Function_Ridley_Startup_RidleyRoars_return 
    LDA.W #InstList_Ridley_FacingLeft_OpeningRoar 
    JSR.W SetRidleyInstList 
    STZ.W $0FB2 
    LDA.W #Function_Ridley_Startup_ColorBGInNorfair_RaiseAcid_MainAI : STA.W $0FA8 
    LDA.W $079F 
    CMP.W #$0002 
    BEQ Function_Ridley_Startup_RidleyRoars_return 
    LDA.W #$00FC : STA.W $0FB2 

Function_Ridley_Startup_RidleyRoars_return:
    RTS 


Function_Ridley_Startup_ColorBGInNorfair_RaiseAcid_MainAI:
    LDA.W $079F 
    CMP.W #$0002 
    BNE .ceres 
    DEC.W $0FB2 
    BPL Function_Ridley_Startup_RidleyRoars_return 
    LDA.W #$0002 : STA.W $0FB2 
    LDA.W $0FB0 
    INC A 
    STA.W $0FB0 
    DEC A 
    JSR.W AdjustRidleyBackgroundColorsIfNecessary 
    BCC Function_Ridley_Startup_RidleyRoars_return 
    LDA.W #$01B8 : STA.W $197A 
    LDA.W #$FFA0 : STA.W $197C 
    LDA.W #$0020 : STA.W $1980 
    BRA .merge 


.ceres:
    DEC.W $0FB2 
    BPL Function_Ridley_Startup_RidleyRoars_return 

.merge:
    STZ.W $0FB0 
    LDA.W #InstList_RidleyCeres_FacingLeft_FlyUp_StartMainAI 
    JSR.W SetRidleyInstList 
    LDA.W #$0008 : STA.L $7E7810 
    STA.L $7E7812 
    JSR.W SetAllTailPartsToMoving 
    LDA.W #$0001 : STA.L $7E2000 
    LDA.W #Function_Ridley_ResetSpeeds : STA.W $0FA8 
    RTS 


AdjustRidleyBackgroundColorsIfNecessary:
    ASL A 
    TAX 
    LDY.W .pointers,X 
    BNE .adjust 
    SEC 
    RTS 


.adjust:
    LDX.W #$00E2 
    LDA.W #$000E 
    JSL.L WriteAColorsFromYtoColorIndexX 
    CLC 
    RTS 


.pointers:
    dw .palette0 
    dw .palette1 
    dw .palette2 
    dw .palette3 
    dw .palette4 
    dw .palette5 
    dw .palette6 
    dw .palette7 
    dw .palette8 
    dw .palette9 
    dw .paletteA 
    dw .paletteB 
    dw .paletteC 
    dw .paletteD 
    dw .paletteE 
    dw $0000 

.palette0:
    dw $0001,$0001,$0001,$0000,$0000,$0000,$0000,$0001 
    dw $0000,$0000,$0000,$0000,$0000,$0842 

.palette1:
    dw $0023,$0003,$0003,$0001,$0001,$0000,$0000,$0001 
    dw $0001,$0000,$0000,$0001,$0001,$1084 

.palette2:
    dw $0044,$0024,$0004,$0402,$0001,$0000,$0000,$0002 
    dw $0001,$0000,$0000,$0001,$0001,$18C6 

.palette3:
    dw $0065,$0025,$0005,$0403,$0002,$0001,$0000,$0003 
    dw $0002,$0001,$0000,$0002,$0002,$2108 

.palette4:
    dw $0087,$0047,$0007,$0404,$0402,$0001,$0000,$0004 
    dw $0003,$0001,$0000,$0402,$0003,$294A 

.palette5:
    dw $0088,$0048,$0008,$0804,$0403,$0001,$0000,$0005 
    dw $0003,$0001,$0000,$0403,$0003,$318C 

.palette6:
    dw $00AA,$004A,$002A,$0805,$0403,$0001,$0000,$0406 
    dw $0004,$0001,$0000,$0403,$0004,$39CE 

.palette7:
    dw $00CB,$006B,$002B,$0806,$0404,$0002,$0000,$0407 
    dw $0004,$0002,$0000,$0404,$0004,$4210 

.palette8:
    dw $00ED,$006D,$002D,$0C07,$0404,$0002,$0000,$0408 
    dw $0005,$0002,$0000,$0404,$0005,$4A52 

.palette9:
    dw $010E,$008E,$002E,$0C08,$0805,$0002,$0000,$0409 
    dw $0006,$0002,$0000,$0805,$0006,$5294 

.paletteA:
    dw $0110,$0090,$0030,$0C08,$0805,$0003,$0000,$040A 
    dw $0006,$0003,$0000,$0805,$0006,$5AD6 

.paletteB:
    dw $0131,$0091,$0031,$1009,$0806,$0003,$0000,$040B 
    dw $0007,$0003,$0000,$0806,$0007,$6318 

.paletteC:
    dw $0153,$00B3,$0033,$100A,$0807,$0003,$0000,$040C 
    dw $0007,$0003,$0000,$0807,$0007,$6B5A 

.paletteD:
    dw $0574,$04B4,$0434,$100B,$0807,$0403,$0000,$040D 
    dw $0408,$0003,$0000,$0807,$0408,$77BD 

.paletteE:
    dw $0596,$04D6,$0456,$140C,$0C08,$0404,$0000,$080E 
    dw $0409,$0004,$0000,$0C08,$0409,$7FFF 

Function_RidleyCeres_StartupLiftoff_FacingLeft:
    LDA.W $0FAC 
    CLC 
    ADC.W #$FFF0 
    STA.W $0FAC 
    LDA.W $0F7E 
    CMP.W #$0070 
    BMI .reachedTarget 
    RTS 


.reachedTarget:
    LDA.W #Function_RidleyCeres_StartupLiftoff_FacingLeft_SlowingDown : STA.W $0FA8 ; fallthrough to Function_RidleyCeres_StartupLiftoff_FacingLeft_SlowingDown

Function_RidleyCeres_StartupLiftoff_FacingLeft_SlowingDown:
    LDA.W $0FAC 
    CLC 
    ADC.W #$0014 
    STA.W $0FAC 
    LDA.W $0F7E 
    CMP.W #$0050 
    BPL .return 
    LDA.W #Function_RidleyCeres_MainAI : STA.W $0FA8 
    LDA.W #$0001 : STA.L $7E7802 

.return:
    RTS 


Function_RidleyCeres_MainAI:
    LDA.L $7E781A 
    CMP.W #$0064 
    BCS .shot100Times 
    LDA.W $09C2 
    CMP.W #$001E 
    BPL .SamusNotLowEnergy 
    LDA.W #$0000 : STA.L $7E7802 
    LDA.W #Function_RidleyCeres_FlyAwayToEndFight : STA.W $0FA8 
    JMP.W Function_RidleyCeres_FlyAwayToEndFight 


.shot100Times:
    LDA.W #$0000 : STA.L $7E7802 
    LDA.W #Function_RidleyCeres_InitializeBabyMetroidDrop : STA.W $0FA8 
    JMP.W Function_RidleyCeres_InitializeBabyMetroidDrop 


.SamusNotLowEnergy:
    JSR.W CeresRidleyAttackCooldown_FlyToPosition 
    BCC .notReachedTarget 
    LDA.L $7E7800 
    INC A 
    STA.L $7E7800 
    CMP.W #$007C 
    BCC .return 
    NOP 

.notReachedTarget:
    LDA.W $05E5 
    AND.W #$000F 
    ASL A 
    TAX 
    LDA.W .pointers,X : STA.W $0FA8 
    LDA.W #$0000 : STA.L $7E7800 

.return:
    RTS 


.pointers:
    dw Function_RidleyCeres_StartFireballing 
    dw Function_RidleyCeres_StartFireballing 
    dw Function_RidleyCeres_StartFireballing 
    dw Function_RidleyCeres_StartFireballing 
    dw Function_RidleyCeres_StartLunging 
    dw Function_RidleyCeres_StartLunging 
    dw Function_RidleyCeres_StartLunging 
    dw Function_RidleyCeres_StartLunging 
    dw Function_RidleyCeres_StartLunging 
    dw Function_RidleyCeres_StartFireballing 
    dw Function_RidleyCeres_StartSwoop 
    dw Function_RidleyCeres_StartSwoop 
    dw Function_RidleyCeres_StartSwoop 
    dw Function_RidleyCeres_StartSwoop 
    dw Function_RidleyCeres_StartSwoop 
    dw Function_RidleyCeres_StartFireballing 

CeresRidleyAttackCooldown_FlyToPosition:
    LDX.W #$00C0 
    LDY.W #$0064 
    STX.B $12 
    STY.B $14 
    LDX.W #$0000 
    LDY.W #$0000 
    JSR.W AccelerateCeresRidleyTowardDesiredXY 
    LDA.W #$0008 : STA.B $16 
    STA.B $18 
    JSL.L CheckForEnemyCollisionWithRectangle 
    RTS 


Function_RidleyCeres_StartFireballing:
    LDA.W $0FAC 
    BPL + 
    EOR.W #$FFFF 
    INC A 

  + CMP.W #$0080 
    BCS + 
    LDA.W #$0080 

  + BIT.W $0FAC 
    BPL + 
    EOR.W #$FFFF 
    INC A 

  + STA.W $0FAC 
    LDA.W $0F7A : STA.B $12 
    LDA.W #$0058 : STA.B $14 
    LDX.W #$0000 
    LDY.W #$0000 
    JSR.W AccelerateCeresRidleyTowardDesiredXY 
    LDA.W $0F7E 
    CMP.W #$0050 
    BMI .reachedTarget 
    CMP.W #$0080 
    BPL .return 
    LDA.W $0F7A : STA.L $7E782E 
    LDA.W $0F7E : STA.L $7E7830 
    LDA.W #InstList_Ridley_FacingLeft_Fireballing_0 
    JSR.W SetRidleyInstList 
    LDA.W #Function_RidleyCeres_Fireballing : STA.W $0FA8 
    LDA.W #$00E0 : STA.L $7E7800 
    JMP.W Function_RidleyCeres_Fireballing 


.return:
    RTS 


.reachedTarget:
    LDA.L $7E7800 
    INC A 
    STA.L $7E7800 
    CMP.W #$0030 
    BCC .return 
    LDA.W #Function_RidleyCeres_StartSwoop : STA.W $0FA8 
    RTS 


Function_RidleyCeres_Fireballing:
    LDA.W $05E5 
    AND.W #$0007 
    BIT.W $05E5 
    BPL + 
    EOR.W #$FFFF 
    INC A 

  + STA.B $16 
    LDA.L $7E782E 
    ADC.B $16 
    STA.B $12 
    LDA.L $7E7830 
    ADC.B $16 
    STA.B $14 
    LDX.W #$0000 
    LDY.W #$0000 
    JSR.W AccelerateCeresRidleyTowardDesiredXY 
    LDA.L $7E7800 
    DEC A 
    STA.L $7E7800 
    BPL .return 
    LDA.W #$0000 : STA.L $7E7800 
    LDA.W #Function_RidleyCeres_MainAI : STA.W $0FA8 

.return:
    RTS 


Function_RidleyCeres_StartLunging:
    LDA.W #InstList_RidleyCeres_FacingLeft_Lunging 
    JSR.W SetRidleyInstList 
    LDA.W #Function_RidleyCeres_Lunging : STA.W $0FA8 
    LDA.W #$0040 : STA.W $0FB2 ; fallthrough to Function_RidleyCeres_Lunging

Function_RidleyCeres_Lunging:
    LDA.W $0AF6 : STA.B $12 
    LDA.W $0AFA 
    SEC 
    SBC.W #$0044 
    CMP.W #$0040 
    BPL + 
    LDA.W #$0040 

  + STA.B $14 
    LDX.W #$0000 
    LDY.W #$000D 
    JSR.W AccelerateCeresRidleyTowardDesiredXY 
    LDA.W #$0002 : STA.B $16 
    STA.B $18 
    JSL.L CheckForEnemyCollisionWithRectangle 
    BCC .collision 
    DEC.W $0FB2 
    BPL .return 

.collision:
    LDA.W #$0000 : STA.L $7E7800 
    LDA.W #Function_RidleyCeres_MainAI : STA.W $0FA8 

.return:
    RTS 


Function_RidleyCeres_StartSwoop:
    LDA.W #Function_RidleyCeres_FlyToSwoopSetupPosition : STA.W $0FA8 
    LDA.W #$000A : STA.W $0FB2 
    LDA.W #$0000 : STA.L $7E7814 
    STA.L $7E2002 ; fallthrough to Function_Ridley_Ceres_FlyToSwoopSetupPosition

Function_RidleyCeres_FlyToSwoopSetupPosition:
    LDX.W #$00C0 
    LDY.W #$0050 
    STX.B $12 
    STY.B $14 
    LDX.W #$0000 
    LDY.W #$0001 
    JSR.W AccelerateCeresRidleyTowardDesiredXY 
    LDA.W $0F7E 
    CMP.W #$0060 
    BMI .reachedTarget 
    RTS 


.reachedTarget:
    LDA.W #Function_RidleyCeres_Swoop : STA.W $0FA8 
    LDA.W #$000A : STA.W $0FB2 
    LDA.W #$0000 : STA.L $7E7814 
    RTS 


Function_RidleyCeres_Swoop:
    LDA.W #$FFE0 : STA.B $12 
    LDA.W #$FC00 : STA.B $14 
    LDA.W #$0300 : STA.B $16 
    JSR.W UpdateRidleysUSwoopSpeedAndAngle 
    DEC.W $0FB2 
    BPL .return 
    LDA.W #Function_RidleyCeres_SwoopingDownLeft : STA.W $0FA8 
    LDA.W #$0024 : STA.W $0FB2 

.return:
    RTS 


Function_RidleyCeres_SwoopingDownLeft:
    LDA.W #$FE00 : STA.B $12 
    LDA.W #$C000 : STA.B $14 
    LDA.W #$0300 : STA.B $16 
    JSR.W UpdateRidleysUSwoopSpeedAndAngle 
    DEC.W $0FB2 
    BPL .return 
    LDA.W #Function_RidleyCeres_SwoopingUpRight : STA.W $0FA8 
    LDA.W #$001C : STA.W $0FB2 
    LDA.W #$0001 : STA.L $7E2004 

.return:
    RTS 


Function_RidleyCeres_SwoopingUpRight:
    LDA.W #$FE00 : STA.B $12 
    LDA.W #$8800 : STA.B $14 
    LDA.W #$0300 : STA.B $16 
    JSR.W UpdateRidleysUSwoopSpeedAndAngle 
    DEC.W $0FB2 
    BPL .return 
    LDA.W #Function_RidleyCeres_EndOfSwoop : STA.W $0FA8 
    LDA.W #$0001 : STA.W $0FB2 

.return:
    RTS 


Function_RidleyCeres_EndOfSwoop:
    LDA.W #$FD00 : STA.B $12 
    LDA.W #$8800 : STA.B $14 
    LDA.W #$0300 : STA.B $16 
    JSR.W UpdateRidleysUSwoopSpeedAndAngle 
    DEC.W $0FB2 
    BPL .return 
    LDA.W #Function_RidleyCeres_MainAI : STA.W $0FA8 
    LDA.W #$0000 : STA.L $7E7800 
    INC A 
    STA.L $7E2002 

.return:
    RTS 


Function_RidleyCeres_FlyAwayToEndFight:
    LDA.W #$FF40 : STA.L $7E8000 
    LDA.W #$00C0 : STA.B $12 
    LDA.W #$FF80 : STA.B $14 
    LDX.W #$0000 
    LDY.W #$0001 
    JSR.W AccelerateCeresRidleyTowardDesiredXY 
    LDA.W $0F7E 
    CMP.W #$FF80 
    BMI Function_RidleyCeres_FlyAwayToEndFight_reachedTarget 

Function_RidleyCeres_FlyAwayToEndFight_return:
    RTS 


Function_RidleyCeres_FlyAwayToEndFight_reachedTarget:
    LDA.W #Function_RidleyCeres_SpawnWallsAndUpdatePalettesForGetaway : STA.W $0FA8 
    LDA.W #$0040 : STA.W $0FB2 ; fallthrough to Function_RidleyCeres_SpawnWallsAndUpdatePalettesForGetaway

Function_RidleyCeres_SpawnWallsAndUpdatePalettesForGetaway:
    DEC.W $0FB2 
    BPL Function_RidleyCeres_FlyAwayToEndFight_return 
    JSR.W SpawnWallsDuringCeresRidleyGetawayCutscene 
    STZ.W $0FAA 
    STZ.W $0FAC 
    LDA.W #$0000 : STA.L $7E2000 
    LDA.W #Function_RidleyCeres_DisableAI_SetupMode7Ridley : STA.W $0FA8 
    LDY.W #.BG2Palette5 
    LDX.W #$00A2 
    LDA.W #$000F 
    JSL.L WriteAColorsFromYtoColorIndexX 
    LDY.W #.spritePalette7 
    LDX.W #$0042 
    LDA.W #$0008 
    JSL.L WriteAColorsFromYtoColorIndexX 
    LDY.W #.spritePalette7 
    LDX.W #$01E2 
    LDA.W #$0008 
    JSL.L WriteAColorsFromYtoColorIndexX 
    RTS 


.BG2Palette5:
    dw $0421,$0401,$0000,$0000,$0421,$0001,$0000,$0000 
    dw $0422,$0002,$0001,$0022,$0021,$0001,$0000 

.spritePalette7:
    dw $7E20,$6560,$2060,$1000,$7940,$5D00,$4CA0,$3CA0 

Function_RidleyCeres_DisableAI_SetupMode7Ridley:
    LDA.W #RTS_A6AA4F : STA.W $0FA8 
    LDA.W #$0001 : STA.W $093F 
    JMP.W SetupMode7ForCeresRidleyEscape 


SpawnWallsDuringCeresRidleyGetawayCutscene:
    LDX.W #.leftWall 
    JSL.L SpawnEnemy 
    LDX.W #.rightWall 
    JSL.L SpawnEnemy 
    RTS 


.leftWall:
    dw EnemyHeaders_CeresDoor 
    dw $0008,$007F,$0000,$2800,$0000,$0005,$0000 

.rightWall:
    dw EnemyHeaders_CeresDoor 
    dw $00F8,$007F,$0000,$2800,$0000,$0006,$0000 

RTS_A6AA4F:
    RTS 


Function_RidleyCeres_CycleEmergencyTextColors:
    JSR.W CycleEmergencyTextColors 
    RTS 


SetupMode7ForCeresRidleyEscape:
    SEP #$20 
    LDA.B #$07 : STA.B $56 
    REP #$20 
    LDA.W #$0001 : STA.W $0783 
    SEP #$20 
    LDA.B #$80 : STA.B $5F 
    REP #$20 
    LDA.W #$0100 : STA.B $78 
    STA.B $7A 
    STA.B $7C 
    STA.B $7E 
    LDA.W #$0040 : STA.B $80 
    STA.B $82 
    LDA.W #$0000 : STA.L $7E8024 
    STA.L $7E8026 
    LDA.W #$0001 : STA.L $7E7814 
    LDA.W #$FF80 : STA.L $7E8028 
    STA.B $B1 
    LDA.W #$0020 : STA.L $7E802A 
    STA.B $B3 
    LDA.W #$0800 : STA.L $7E8020 
    LDA.W #$0400 : STA.L $7E8022 
    RTS 


HandleCeresRidleyGetawayCutscene:
    PHB 
    PHK 
    PLB 
    LDA.L $7E8024 
    BNE .return 
    JSR.W ExecuteCeresRidleyGetawayCutscene 

.return:
    PLB 
    RTL 


ExecuteCeresRidleyGetawayCutscene:
    LDA.L $7E8026 
    TAX 
    INC #2
    STA.L $7E8026 
    CPX.W #$0000 
    BNE .notFirstExecution 
    LDA.W #$004E 
    JSL.L QueueSound_Lib2_Max6 

.notFirstExecution:
    CPX.W #$00D0 
    BNE .dontPushSamus 
    JSL.L SetSamusToBePushedOutOfCeresRidleysWay 
    LDA.W #$0023 : STA.W $183E 
    LDA.W #$0040 : STA.W $1840 

.dontPushSamus:
    LDA.W CeresRidleyMode7GetawayBackgroundParameters,X 
    CMP.W #$FFFF 
    BEQ .done 
    STA.L $7E8020 
    LDA.L $7E802A 
    CLC 
    ADC.W CeresRidleyGetawayYVelocityTable,X 
    STA.L $7E802A 
    STA.B $B3 
    LDA.L $7E8028 
    SEC 
    SBC.W CeresRidleyGetawayXVelocityTable,X 
    STA.L $7E8028 
    STA.B $B1 
    LDA.L $7E8020 
    JSR.W RidleyCeres_UpdateBG12Palette5 
    LDA.L $7E7814 
    CLC 
    ADC.W #$0030 
    STA.L $7E7814 
    JSR.W HandleCeresRidleyMode7TransformationMatrix 
    JSR.W AnimateMode7BabyMetroidCapsuleDuringGetaway 
    JSR.W AnimateMode7RidleyWings 
    RTS 


.done:
    LDA.L $7E8024 
    INC A 
    STA.L $7E8024 
    SEP #$20 
    LDA.B #$09 : STA.B $56 
    REP #$20 ; >.<
    SEP #$20 ; >.<
    STZ.B $5F 
    REP #$20 
    STZ.B $78 
    STZ.B $7A 
    STZ.B $7C 
    STZ.B $7E 
    STZ.B $80 
    STZ.B $82 
    STZ.B $B1 
    STZ.B $B3 
    LDA.W #CeresRidleyPostGetawayFunctionHandler : STA.W $0FA8 
    STZ.W $0FB2 
    RTS 


HandleCeresRidleyMode7TransformationMatrix:
    LDA.L $7E7814 
    XBA 
    AND.W #$00FF 
    STA.B $12 
    LDA.W #$0100 
    JSL.L Mode7Math_A6AC1E 
    STA.B $18 
    BIT.B $18 
    BPL + 
    EOR.W #$FFFF 
    INC A 

  + STA.B $26 
    LDA.L $7E8020 : STA.B $28 
    JSR.W Mode7Math_A6AC58 
    LDA.B $2B 
    BIT.B $18 
    BPL + 
    EOR.W #$FFFF 
    INC A 

  + STA.B $78 
    LDA.W #$0100 
    JSL.L Mode7Math_A6AC0E 
    STA.B $18 
    BIT.B $18 
    BPL + 
    EOR.W #$FFFF 
    INC A 

  + STA.B $26 
    LDA.L $7E8020 : STA.B $28 
    JSR.W Mode7Math_A6AC58 
    LDA.B $2B 
    BIT.B $18 
    BPL + 
    EOR.W #$FFFF 
    INC A 

  + STA.B $7A 
    LDA.W #$0100 
    JSL.L Mode7Math_A6AC0E 
    EOR.W #$FFFF 
    INC A 
    STA.B $18 
    BIT.B $18 
    BPL + 
    EOR.W #$FFFF 
    INC A 

  + STA.B $26 
    LDA.L $7E8020 : STA.B $28 
    JSR.W Mode7Math_A6AC58 
    LDA.B $2B 
    BIT.B $18 
    BPL + 
    EOR.W #$FFFF 
    INC A 

  + STA.B $7C 
    LDA.W #$0100 
    JSL.L Mode7Math_A6AC1E 
    STA.B $18 
    BIT.B $18 
    BPL + 
    EOR.W #$FFFF 
    INC A 

  + STA.B $26 
    LDA.L $7E8020 : STA.B $28 
    JSR.W Mode7Math_A6AC58 
    LDA.B $2B 
    BIT.B $18 
    BPL + 
    EOR.W #$FFFF 
    INC A 

  + STA.B $7E 
    RTS 


Mode7Math_A6AC0E:
    STA.B $14 
    BIT.B $14 
    BPL + 
    EOR.W #$FFFF 
    INC A 

  + STA.B $26 
    LDA.B $12 
    BRA Mode7Math_Common_A6AC30 


Mode7Math_A6AC1E:
    STA.B $14 
    BIT.B $14 
    BPL + 
    EOR.W #$FFFF 
    INC A 

  + STA.B $26 
    LDA.B $12 
    CLC 
    ADC.W #$0040 

Mode7Math_Common_A6AC30:
    ASL A 
    AND.W #$01FE 
    TAX 
    LDA.L SineCosineTables_8bitSine_SignExtended,X 
    BEQ .return 
    STA.B $16 
    BPL + 
    EOR.W #$FFFF 
    INC A 

  + STA.B $28 
    JSR.W Mode7Math_A6AC58 
    LDA.B $14 
    EOR.B $16 
    BMI + 
    LDA.B $2B 
    RTL 


  + LDA.B $2B 
    EOR.W #$FFFF 
    INC A 

.return:
    RTL 


Mode7Math_A6AC58:
    PHX 
    PHY 
    PHA 
    PHP 
    REP #$20 
    SEP #$10 
    LDX.B $26 
    STX.W $4202 
    LDX.B $28 
    STX.W $4203 
    NOP #3
    LDA.W $4216 : STA.B $2A 
    LDX.B $27 
    STX.W $4202 
    LDX.B $29 
    STX.W $4203 
    NOP #3
    LDX.W $4216 
    STX.B $2C 
    LDY.W $4217 
    LDX.B $27 
    STX.W $4202 
    LDX.B $28 
    STX.W $4203 
    NOP #2
    LDA.B $2B 
    CLC 
    ADC.W $4216 
    STA.B $2B 
    BCC + 
    INY 

  + LDX.B $26 
    STX.W $4202 
    LDX.B $29 
    STX.W $4203 
    NOP #2
    LDA.B $2B 
    CLC 
    ADC.W $4216 
    STA.B $2B 
    BCC + 
    INY 

  + STY.B $2D 
    PLP 
    PLA 
    PLY 
    PLX 
    RTS 


AnimateMode7BabyMetroidCapsuleDuringGetaway:
    LDA.W $05B6 
    AND.W #$0003 
    BNE .return 
    LDA.L $7E802C 
    INC A 
    AND.W #$0003 
    STA.L $7E802C 
    ASL A 
    TAY 
    LDX.W .pointers,Y 
    JSL.L QueueMode7Transfers 

.return:
    RTS 


.pointers:
    dw .tilemapEntry0 
    dw .tilemapEntry1 
    dw .tilemapEntry2 
    dw .tilemapEntry1 

.tilemapEntry0:
    db $80 
    dl .tilemap0 
    dw $0002,$0504 
    db $00,$80 
    dl .tilemap1 
    dw $0002,$0584 
    db $00,$00 

.tilemapEntry1:
    db $80 
    dl .tilemap2 
    dw $0002,$0504 
    db $00,$80 
    dl .tilemap3 
    dw $0002,$0584 
    db $00,$00 

.tilemapEntry2:
    db $80 
    dl .tilemap4 
    dw $0002,$0504 
    db $00,$80 
    dl .tilemap5 
    dw $0002,$0584 
    db $00,$00 

.tilemap0:
    db $59,$5A 

.tilemap1:
    db $69,$6A 

.tilemap2:
    db $8A,$8B 

.tilemap3:
    db $8C,$8D 

.tilemap4:
    db $8E,$8F 

.tilemap5:
    db $9D,$9E 

AnimateMode7RidleyWings:
    LDA.W $05B6 
    AND.W #$0007 
    BNE .return 
    LDA.L $7E802E 
    INC A 
    AND.W #$0001 
    STA.L $7E802E 
    ASL A 
    TAY 
    LDX.W .pointers,Y 
    JSL.L QueueMode7Transfers 

.return:
    RTS 


.pointers:
    dw .tilemapEntry0 
    dw .tilemapEntry1 

.tilemapEntry0:
    db $80 
    dl .tilemap0 
    dw $0004,$000B 
    db $00,$80 
    dl .tilemap2 
    dw $000E,$0080 
    db $00,$80 
    dl .tilemap4 
    dw $000E,$0100 
    db $00,$80 
    dl .tilemap6 
    dw $000C,$0181 
    db $00,$80 
    dl .tilemap8 
    dw $000F,$0201 
    db $00,$80 
    dl .tilemapA 
    dw $0010,$0280 
    db $00,$00 

.tilemapEntry1:
    db $80 
    dl .tilemap1 
    dw $0004,$000B 
    db $00,$80 
    dl .tilemap3 
    dw $000E,$0080 
    db $00,$80 
    dl .tilemap5 
    dw $000E,$0100 
    db $00,$80 
    dl .tilemap7 
    dw $000C,$0181 
    db $00,$80 
    dl .tilemap9 
    dw $000F,$0201 
    db $00,$80 
    dl .tilemapB 
    dw $0010,$0280 
    db $00,$00 

.tilemap0:
    db $00,$01,$02,$03 

.tilemap1:
    db $FF,$FF,$FF,$FF 

.tilemap2:
    db $04,$05,$06,$07,$08,$09,$FF,$FF,$0A,$0B,$0C,$0D,$0E,$0F 

.tilemap3:
    db $FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF 

.tilemap4:
    db $10,$11,$12,$13,$14,$15,$16,$17,$18,$19,$1A,$1B,$1C,$A8 

.tilemap5:
    db $FF,$FF,$FF,$FF,$FF,$FF,$20,$17,$AA,$FF,$FF,$FF,$FF,$FF 

.tilemap6:
    db $21,$22,$23,$24,$25,$26,$27,$28,$29,$2A,$2B,$2C 

.tilemap7:
    db $FF,$FF,$FF,$FF,$FF,$26,$27,$28,$FF,$FF,$FF,$FF 

.tilemap8:
    db $FF,$FF,$1D,$1E,$1F,$30,$31,$32,$33,$34,$FF,$FF,$FF,$FF,$FF 

.tilemap9:
    db $91,$92,$93,$94,$95,$30,$31,$32,$96,$97,$98,$99,$9A,$98,$9C 

.tilemapA:
    db $FF,$FF,$FF,$FF,$2E,$2F,$40,$41,$42,$43,$44,$FF,$FF,$FF,$FF,$FF 

.tilemapB:
    db $90,$9F,$A0,$A1,$A2,$A3,$40,$41,$42,$A4,$A5,$A6,$A7,$7D,$83,$2D 

CeresRidleyMode7GetawayBackgroundParameters:
    dw $0800,$0800,$0800,$0800,$0800,$0800,$0800,$0800 
    dw $0800,$0800,$0800,$0800,$0800,$0800,$0800,$0800 
    dw $0800,$0800,$0800,$0800,$0800,$0800,$0800,$0800 
    dw $0800,$0800,$0800,$0800,$0800,$0800,$0800,$0800 
    dw $07F0,$07E0,$07D0,$07C0,$07B0,$07A0,$0790,$0780 
    dw $0770,$0760,$0750,$0740,$0730,$0720,$0710,$0700 
    dw $06E0,$06C0,$06A0,$0680,$0660,$0640,$0620,$0600 
    dw $05E0,$05C0,$05A0,$0580,$0560,$0540,$0520,$0500 
    dw $04E0,$04C0,$04A0,$0480,$0460,$0440,$0430,$0400 
    dw $03E0,$03C0,$03A0,$0380,$0360,$0340,$0320,$0300 
    dw $02E0,$02C0,$02A0,$0280,$0260,$0240,$0230,$0200 
    dw $01E0,$01C0,$01A0,$0180,$0160,$0140,$0120,$0100 
    dw $00F0,$00E0,$00D0,$00C0,$00B0,$00A0,$0090,$0080 
    dw $0070,$0060,$0050,$0040,$0030,$0020,$0020,$0020 
    dw $FFFF 

CeresRidleyGetawayYVelocityTable:
    dw $FFFA,$FFFA,$FFFA,$FFFA,$FFFA,$FFFA,$FFFA,$FFFA 
    dw $FFFA,$FFFA,$FFFA,$FFFA,$FFFC,$FFFC,$FFFC,$FFFC 
    dw $FFFC,$FFFC,$FFFC,$FFFC,$FFFC,$FFFC,$FFFE,$FFFE 
    dw $FFFE,$FFFE,$FFFE,$FFFE,$FFFE,$FFFF,$FFFF,$FFFF 
    dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF 
    dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$0000,$0000,$0000 
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000 
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000 
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000 
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000 
    dw $0001,$0001,$0001,$0001,$0001,$0001,$0001,$0001 
    dw $0002,$0002,$0002,$0002,$0002,$0002,$0002,$0002 
    dw $0003,$0004,$0006,$0008,$000A,$000C,$000E,$0010 
    dw $0014,$0018,$002C,$0030,$0080,$0100,$0100,$0100 

CeresRidleyGetawayXVelocityTable:
    dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF 
    dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF 
    dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF 
    dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF 
    dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF 
    dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF 
    dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF 
    dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF 
    dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF 
    dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF 
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000 
    dw $0001,$0001,$0001,$0001,$0001,$0001,$0001,$0001 
    dw $0002,$0002,$0003,$0003,$0004,$0004,$0005,$0005 
    dw $0008,$000C,$0010,$0014,$0020,$0020,$0020,$0020 

RidleyCeres_UpdateBG12Palette5:
    XBA 
    AND.W #$00FF 
    ASL #5
    ADC.W #.palette0 
    TAY 
    LDX.W #$00A2 
    LDA.W #$000F 
    JSL.L WriteAColorsFromYtoColorIndexX 
    RTS 


.palette0:
    dw $56BA,$41B2,$1447,$0403,$4E15,$3570,$24CB,$1868 
    dw $5E5F,$183F,$1014,$031F,$01DA,$00F5,$0C63,$0000 

.palette1:
    dw $4E78,$3D90,$1026,$0402,$45F3,$314F,$20AA,$1447 
    dw $561D,$143D,$0C12,$02DD,$01B8,$00D3,$0842,$0000 

.palette2:
    dw $4A56,$356F,$1026,$0002,$41B2,$2D2D,$1CA9,$1447 
    dw $51FA,$141A,$0C11,$029A,$0196,$00D2,$0842,$0000 

.palette3:
    dw $4214,$314E,$1025,$0002,$3D90,$290C,$1C88,$1046 
    dw $49D8,$1018,$0C10,$0278,$0174,$00B0,$0842,$0000 

.palette4:
    dw $3DF3,$2D2D,$0C25,$0002,$396F,$250B,$1888,$1045 
    dw $41B6,$1016,$0C0E,$0236,$0153,$00AF,$0842,$0000 

.palette5:
    dw $39D1,$290C,$0C24,$0002,$314E,$20EA,$1887,$1045 
    dw $3D94,$1014,$080D,$0214,$0131,$008E,$0842,$0000 

.palette6:
    dw $318F,$24EA,$0C24,$0001,$2D2C,$1CC9,$1466,$0C24 
    dw $3552,$0C12,$080C,$01D2,$010F,$008C,$0421,$0000 

.palette7:
    dw $252C,$1CC8,$0823,$0001,$20E9,$18A7,$1045,$0823 
    dw $290E,$080E,$0409,$016E,$00CC,$0069,$0421,$0000 

.palette8:
    dw $1CE8,$1486,$0402,$0001,$18A7,$1065,$0C43,$0822 
    dw $1CCA,$080A,$0406,$010A,$0088,$0047,$0421,$0000 

MainAI_Ridley:
    LDA.L $7E8008 
    SEC 
    SBC.W #$0004 
    BPL .greaterThan4 
    LDA.W #$0000 

.greaterThan4:
    STA.L $7E8008 
    JSR.W HandleRidleySamusInteractionBit 
    JSR.W PowerBombCheck 
    PEA.W .manualReturn-1 
    JMP.W ($0FA8) 


.manualReturn:
    LDA.L $7E7804 
    BEQ .notActiveNotHoldingSamus 
    JSR.W MakeRidleysWingsAndTailFlashWhenHit 
    JSR.W HandleMovementAndMainBodyWallCollisions 
    JSR.W HandleWingFlapping 
    JSR.W HandleRidleyTailAI 
    JSR.W KillProjectilesWithRidleyTailTip 
    JSR.W DrawRidleyTail 
    JSR.W DrawRidleysWings 
    JSR.W AnimateRidleysRibs 
    LDA.L $7E7836 
    BEQ .notActiveNotHoldingSamus 
    JSR.W MoveSamusToWithinRidleysClawsIfHolding 

.notActiveNotHoldingSamus:
    JSR.W DetermineAndSetRidleySpeedAndColorPalette 
    RTL 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Ridley_TrySamusGrab_A6B26F:
    LDA.L $7E783C 
    ORA.L $7E7836 
    BNE .return 
    LDX.W #$0004 
    LDY.W #$0004 
    JSR.W AttemptToGrabSamus_SkipSpinCheck 
    BCS .gotoGrabSamus 

.return:
    RTS 


.gotoGrabSamus:
    JMP.W GrabSamus 
endif ; !FEATURE_KEEP_UNREFERENCED


RidleyHurtAIMaxTimer:
    dw $0008 

TimeIsFrozenAI_Ridley:
    LDA.W #$0000 : STA.L $7E8008 
    LDA.W #$0001 : STA.W $0FA4 ; fallthrough to HurtAI_Ridley

HurtAI_Ridley:
    LDA.W $0FA4 
    AND.W #$0001 
    BNE .timeIsFrozen 
    JSR.W HandleRidleySamusInteractionBit 
    JSR.W PowerBombCheck 
    PEA.W .manualReturn-1 
    JMP.W ($0FA8) 


.manualReturn:
    LDA.L $7E7804 
    BEQ .checkHoldingSamus 
    JSR.W HandleMovementAndMainBodyWallCollisions 
    JSR.W HandleWingFlapping 
    JSR.W HandleRidleyTailAI 

.timeIsFrozen:
    JSR.W KillProjectilesWithRidleyTailTip 
    JSR.W MakeRidleysWingsAndTailFlashWhenHit 
    JSR.W DrawRidleyTail 
    JSR.W DrawRidleysWings 
    JSR.W DetermineAndSetRidleySpeedAndColorPalette 
    JSR.W AnimateRidleysRibs 
    LDA.L $7E8008 
    CLC 
    ADC.W #$0001 
    CMP.W RidleyHurtAIMaxTimer 
    BMI + 
    LDA.W RidleyHurtAIMaxTimer 

  + STA.L $7E8008 
    LDA.L $7E8008 ; >.<
    CMP.W RidleyHurtAIMaxTimer 
    BMI .return 

.checkHoldingSamus:
    LDA.L $7E7836 
    BEQ .return 
    JSR.W MoveSamusToWithinRidleysClawsIfHolding 

.return:
    RTL 


Function_Ridley_Startup_Liftoff_FacingRight:
    LDX.W #$0040 
    LDY.W #$0100 
    STX.B $12 
    STY.B $14 
    LDX.W #$0000 
    LDY.W #$000E 
    JSR.W AccelerateRidleyTowardDesiredXYPosition_NoDecelerationBoost 
    LDA.W #$0008 : STA.B $16 
    STA.B $18 
    JSL.L CheckForEnemyCollisionWithRectangle 
    BCC .collision 
    RTS 


.collision:
    LDA.W #$0001 : STA.L $7E7802 
    LDA.W #DetermineAndExecuteNewRidleyAIScript : STA.W $0FA8 

DetermineAndExecuteNewRidleyAIScript:
    JSR.W GetNewRidleyAIScript 
    JSL.L GenerateRandomNumber 
    AND.W #$0007 
    ASL A 
    TAY 
    LDA.B ($12),Y : STA.W $0FA8 
    JMP.W ($0FA8) 


GetNewRidleyAIScript:
    LDA.W $0A1F 
    AND.W #$00FF 
    CMP.W #$0003 
    BNE .SamusNotSpinJumping 
    LDA.W #CheckIfRidleyBelowHalfHealth_spinJumping : STA.B $12 
    RTS 


.SamusNotSpinJumping:
    LDA.W $0F8C 
    BNE .RidleyNotDead 
    LDA.W #CheckIfRidleyBelowHalfHealth_zeroHealth : STA.B $12 
    LDA.L $7E800A 
    INC A 
    STA.L $7E800A 
    RTS 


.RidleyNotDead:
    CMP.W #$3840 
    BPL .notBelowHalfHealth 
    LDY.W #CheckIfRidleyBelowHalfHealth_belowHalfHealth 
    STY.B $12 
    RTS 


.notBelowHalfHealth:
    JSR.W CheckIfSamusIsBelowTailbounceThreshold 
    BCC .SamusYBelow160 
    LDY.W #CheckIfRidleyBelowHalfHealth_SamusYAbove160 
    STY.B $12 
    RTS 


.SamusYBelow160:
    JSR.W CheckIfSpinJumpGrapplingDamageBoosting 
    BCC CheckIfRidleyBelowHalfHealth 
    LDY.W #CheckIfRidleyBelowHalfHealth_notSpinJumpGrappleDamageBoost 
    STY.B $12 
    RTS 


CheckIfRidleyBelowHalfHealth:
    LDY.W #.belowHalfHealth 
    LDA.W $0F8C 
    CMP.W #$2328 
    BPL .notBelowHalf 
    LDY.W #.aboveHalfHealth 

.notBelowHalf:
    STY.B $12 
    RTS 


.belowHalfHealth:
    dw Function_Ridley_FlyToTailbouncingStartPosition 
    dw Function_Ridley_FlyToTailbouncingStartPosition 
    dw Function_Ridley_FlyToTailbouncingStartPosition 
    dw Function_Ridley_FlyToTailbouncingStartPosition 
    dw Function_Ridley_StartUSwoop 
    dw Function_Ridley_StartUSwoop 
    dw Function_Ridley_StartUSwoop 
    dw Function_Ridley_StartUSwoop 

.aboveHalfHealth:
    dw Function_Ridley_StartUSwoop 
    dw Function_Ridley_StartUSwoop 
    dw Function_Ridley_StartUSwoop 
    dw Function_Ridley_StartUSwoop 
    dw Function_Ridley_FlyToTailbouncingStartPosition 
    dw Function_Ridley_FlyToTailbouncingStartPosition 
    dw Function_Ridley_FlyToTailbouncingStartPosition 
    dw Function_Ridley_FlyToTailbouncingStartPosition 

.notSpinJumpGrappleDamageBoost:
    dw CheckFor_Deathswoop_PowerBombDodge_MoveToCenter_RamGrabSamus 
    dw CheckFor_Deathswoop_PowerBombDodge_MoveToCenter_RamGrabSamus 
    dw CheckFor_Deathswoop_PowerBombDodge_MoveToCenter_RamGrabSamus 
    dw CheckFor_Deathswoop_PowerBombDodge_MoveToCenter_RamGrabSamus 
    dw CheckFor_Deathswoop_PowerBombDodge_MoveToCenter_RamGrabSamus 
    dw CheckFor_Deathswoop_PowerBombDodge_MoveToCenter_RamGrabSamus 
    dw Function_Ridley_FlyToTailbouncingStartPosition 
    dw Function_Ridley_FlyToTailbouncingStartPosition 

.SamusYAbove160:
    dw Function_Ridley_FlyToTailbouncingStartPosition 
    dw Function_Ridley_FlyToTailbouncingStartPosition 
    dw Function_Ridley_FlyToTailbouncingStartPosition 
    dw Function_Ridley_FlyToTailbouncingStartPosition 
    dw Function_Ridley_FlyToTailbouncingStartPosition 
    dw Function_Ridley_FlyToTailbouncingStartPosition 
    dw Function_Ridley_FlyToTailbouncingStartPosition 
    dw Function_Ridley_FlyToTailbouncingStartPosition 

.spinJumping:
    dw Function_Ridley_ConsiderTailbouncing 
    dw Function_Ridley_ConsiderTailbouncing 
    dw Function_Ridley_ConsiderTailbouncing 
    dw Function_Ridley_ConsiderTailbouncing 
    dw Function_Ridley_ConsiderTailbouncing 
    dw Function_Ridley_ConsiderTailbouncing 
    dw Function_Ridley_ConsiderTailbouncing 
    dw Function_Ridley_ConsiderTailbouncing 

.zeroHealth:
    dw CheckFor_Deathswoop_PowerBombDodge_MoveToCenter_RamGrabSamus 
    dw CheckFor_Deathswoop_PowerBombDodge_MoveToCenter_RamGrabSamus 
    dw CheckFor_Deathswoop_PowerBombDodge_MoveToCenter_RamGrabSamus 
    dw CheckFor_Deathswoop_PowerBombDodge_MoveToCenter_RamGrabSamus 
    dw CheckFor_Deathswoop_PowerBombDodge_MoveToCenter_RamGrabSamus 
    dw CheckFor_Deathswoop_PowerBombDodge_MoveToCenter_RamGrabSamus 
    dw CheckFor_Deathswoop_PowerBombDodge_MoveToCenter_RamGrabSamus 
    dw CheckFor_Deathswoop_PowerBombDodge_MoveToCenter_RamGrabSamus 

Function_Ridley_InitializeMovementToCenter:
    LDA.W #Function_Ridley_MoveToCenterSide : STA.W $0FA8 
    LDA.W #$0080 : STA.W $0FB2 ; fallthrough to Function_Ridley_MoveToCenterSide

Function_Ridley_MoveToCenterSide:
    DEC.W $0FB2 
    BMI .collision 
    LDX.W #$00C0 
    LDA.L $7E7820 
    BEQ .facingLeft 
    LDX.W #$0060 

.facingLeft:
    STX.B $12 
    LDY.W #$0100 
    STY.B $14 
    JSR.W GetRidleyAccelerationDivisorIndex 
    LDX.W #$0000 
    JSR.W AccelerateRidleyTowardDesiredXYPosition_NoDecelerationBoost 
    LDA.W #$0008 : STA.B $16 
    STA.B $18 
    JSL.L CheckForEnemyCollisionWithRectangle 
    BCC .collision 
    RTS 


.collision:
    LDA.W #DetermineAndExecuteNewRidleyAIScript : STA.W $0FA8 
    RTS 


GetRidleyAccelerationDivisorIndex:
    LDA.L $7E7824 
    ASL A 
    TAY 
    LDA.W .accelerationDivisorIndex,Y 
    TAY 
    RTS 


.accelerationDivisorIndex:
    dw $0004,$0008,$000A,$000C 

Function_Ridley_StartUSwoop:
    LDA.W #Function_Ridley_FlyToUSwoopStartingPosition : STA.W $0FA8 
    LDA.W #$000A : STA.L $7E7800 
    LDA.W #$0000 : STA.L $7E7814 ; fallthrough to Function_Ridley_FlyToUSwoopStartingPosition

Function_Ridley_FlyToUSwoopStartingPosition:
    LDX.W #$00C0 
    LDA.L $7E7820 
    BEQ .facingLeft 
    LDX.W #$0040 

.facingLeft:
    STX.B $12 
    LDY.W #$0080 
    STY.B $14 
    LDX.W #$0000 
    LDY.W #$0001 
    JSR.W AccelerateRidleyTowardDesiredXYPosition_NoDecelerationBoost 
    LDA.W #$0008 : STA.B $16 
    STA.B $18 
    JSL.L CheckForEnemyCollisionWithRectangle 
    BCS .return 
    LDA.W #Function_Ridley_USwoop_FirstDive : STA.W $0FA8 
    LDA.W #$0020 : STA.L $7E7800 
    LDA.W #$0000 : STA.L $7E7814 

.return:
    RTS 


Function_Ridley_USwoop_FirstDive:
    LDA.L $7E7820 
    BNE .notFacingLeft 
    LDA.W #$FFE0 : STA.B $12 
    LDA.W #$FE00 : STA.B $14 
    BRA + 


.notFacingLeft:
    LDA.W #$0020 : STA.B $12 
    LDA.W #$0200 : STA.B $14 

  + LDA.W #$0480 : STA.B $16 
    JSR.W UpdateRidleysUSwoopSpeedAndAngle 
    LDA.L $7E7800 
    BEQ .timerExpired 
    DEC A 
    STA.L $7E7800 
    RTS 


.timerExpired:
    LDA.W #Function_Ridley_USwoop_DiveToHalfwayPoint : STA.W $0FA8 
    LDA.W #$0014 : STA.L $7E7800 
    RTS 


Function_Ridley_USwoop_DiveToHalfwayPoint:
    LDA.L $7E7820 
    BNE .facingRight 
    LDA.W #$FEC0 : STA.B $12 
    LDA.W #$C000 : STA.B $14 
    BRA + 


.facingRight:
    LDA.W #$0140 : STA.B $12 
    LDA.W #$4000 : STA.B $14 

  + LDA.W #$0500 : STA.B $16 
    JSR.W UpdateRidleysUSwoopSpeedAndAngle 
    LDA.L $7E7800 
    BEQ .timerExpired 
    DEC A 
    STA.L $7E7800 
    RTS 


.timerExpired:
    LDA.W #Function_Ridley_USwoop_ClimbAfterHalfwayPoint : STA.W $0FA8 
    LDA.W #$0010 : STA.L $7E7800 
    LDA.W #$0001 : STA.L $7E2004 
    RTS 


Function_Ridley_USwoop_ClimbAfterHalfwayPoint:
    LDA.L $7E7820 
    BNE .facingRight 
    LDA.W #$FE00 : STA.B $12 
    LDA.W #$8800 : STA.B $14 
    BRA + 


.facingRight:
    LDA.W #$0200 : STA.B $12 
    LDA.W #$7800 : STA.B $14 

  + LDA.W #$0300 : STA.B $16 
    JSR.W UpdateRidleysUSwoopSpeedAndAngle 
    LDA.L $7E7800 
    BEQ .timerExpired 
    DEC A 
    STA.L $7E7800 
    RTS 


.timerExpired:
    LDA.W #Function_Ridley_USwoop_FinalClimb : STA.W $0FA8 
    LDA.W #$0020 : STA.L $7E7800 
    RTS 


Function_Ridley_USwoop_FinalClimb:
    LDA.L $7E7820 
    BNE .facingRight 
    LDA.W #$FC00 : STA.B $12 
    LDA.W #$8800 : STA.B $14 
    BRA + 


.facingRight:
    LDA.W #$0400 : STA.B $12 
    LDA.W #$7800 : STA.B $14 

  + LDA.W #$0300 : STA.B $16 
    JSR.W UpdateRidleysUSwoopSpeedAndAngle 
    LDA.L $7E7800 
    BEQ .timerExpired 
    DEC A 
    STA.L $7E7800 
    RTS 


.timerExpired:
    LDA.W #Function_Ridley_USwoop_End : STA.W $0FA8 
    LDA.W #$0020 : STA.L $7E7800 
    JMP.W TurnAroundIfFacingAwayFromRoomCenter 


Function_Ridley_USwoop_End:
    STZ.B $12 
    LDA.W #$8000 : STA.B $14 
    LDA.W #$01C0 : STA.B $16 
    JSR.W UpdateRidleysUSwoopSpeedAndAngle 
    LDA.L $7E7800 
    BEQ .timerExpired 
    DEC A 
    STA.L $7E7800 
    RTS 


.timerExpired:
    JSR.W CheckIfSpinJumpGrapplingDamageBoosting 
    LDY.W #DetermineAndExecuteNewRidleyAIScript 
    BCC + 
    LDY.W #CheckFor_Deathswoop_PowerBombDodge_MoveToCenter_RamGrabSamus 

  + STY.W $0FA8 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_A6B5BE:
    dw $FFE0,$0000,$0020 
endif ; !FEATURE_KEEP_UNREFERENCED

Function_Ridley_ConsiderTailbouncing:
    LDA.W #$000B : STA.L $7E201E 
    LDA.W #$0180 : STA.L $7E2012 
    LDA.W #Function_Ridley_ConsideringTailbouncing : STA.W $0FA8 
    LDA.W $05E5 
    AND.W #$001F 
    CLC 
    ADC.W #$0020 
    STA.W $0FB2 ; fallthrough to Function_Ridley_ConsideringTailbouncing


Function_Ridley_ConsideringTailbouncing:
    LDA.L $7E7820 
    ASL A 
    TAY 
    LDA.W .targetXPosition,Y : STA.B $12 
    JSR.W FlyTowardTargetXPositionAndSamusYPosition 
    BCC .spinJumping 
    JMP.W SetupRidleyTailForTailbouncing 


.spinJumping:
    DEC.W $0FB2 
    BPL .return 
    LDA.W #Function_Ridley_HoverWhileSamusIsSpinJumping : STA.W $0FA8 
    LDA.W #$0080 : STA.W $0FB2 
    JMP.W TurnAroundIfFacingAwayFromRoomCenter 


.return:
    RTS 


.targetXPosition:
    dw $00C0,$0080,$0040 

Function_Ridley_HoverWhileSamusIsSpinJumping:
    LDA.L $7E7820 
    ASL A 
    TAY 
    LDA.W .targetXPosition,Y : STA.B $12 
    JSR.W FlyTowardTargetXPositionAndSamusYPosition 
    BCC .spinJumping 
    JMP.W SetupRidleyTailForTailbouncing 


.spinJumping:
    DEC.W $0FB2 
    BPL .return 
    LDA.W #Function_Ridley_ConsideringTailbouncing : STA.W $0FA8 
    LDA.W #$0080 : STA.W $0FB2 
    JMP.W TurnAroundIfFacingAwayFromRoomCenter 


.return:
    RTS 


.targetXPosition:
    dw $0040,$0080,$00C0 

FlyTowardTargetXPositionAndSamusYPosition:
    LDA.W $0AFA 
    CMP.W #$0160 
    BMI .minY160 
    LDA.W #$0160 

.minY160:
    STA.B $14 
    LDX.W #$0000 
    JSR.W GetRidleyAccelerationDivisorIndex 
    JSR.W AccelerateRidleyTowardDesiredXYPosition_NoDecelerationBoost 
    LDA.W #$0001 : STA.L $7E2004 
    LDA.W $0A1F 
    AND.W #$00FF 
    CMP.W #$0003 
    BNE .returnSamusSpinJumping 
    LDA.W $05E5 
    AND.W #$00FF 
    CMP.W #$0080 
    BCC .returnSamusNotSpinJumping 
    LDA.L $7E781E 
    BNE .returnSamusNotSpinJumping 
    LDA.L $7E7820 
    DEC A 
    BEQ .returnSamusNotSpinJumping 
    LDA.W #InstList_Ridley_FacingLeft_Fireballing_0 
    JSR.W SetRidleyInstList 

.returnSamusNotSpinJumping:
    CLC 
    RTS 


.returnSamusSpinJumping:
    SEC 
    RTS 


SetupRidleyTailForTailbouncing:
    LDA.W #$00F0 : STA.L $7E2012 
    LDA.W #$0010 : STA.L $7E201E 
    LDA.W #$0001 : STA.L $7E2000 
    LDA.W #Function_Ridley_FlyToTailbouncingStartPosition : STA.W $0FA8 
    RTS 


Function_Ridley_FlyToTailbouncingStartPosition:
    LDA.W $0F7E 
    CMP.W #$0120 
    BMI .startTailbouncing 
    LDA.L $7E7820 
    ASL A 
    TAY 
    LDA.W .targetXPositions,Y : STA.B $12 
    LDA.W #$0120 : STA.B $14 
    LDX.W #$0000 
    LDY.W #$0000 
    JMP.W AccelerateRidleyTowardDesiredXYPosition_NoDecelerationBoost 


.targetXPositions:
    dw $00B0,$0080,$0060 

.startTailbouncing:
    JSR.W TurnAroundIfFacingAwayFromRoomCenter 
    LDA.W #Function_Ridley_StartTailbouncing : STA.W $0FA8 
    LDA.W #$0020 : STA.W $0FB2 ; fallthrough to Function_Ridley_StartTailbouncing


Function_Ridley_StartTailbouncing:
    LDA.W $0F7A : STA.B $12 
    LDA.W #$0120 : STA.B $14 
    LDX.W #$0000 
    LDY.W #$0000 
    JSR.W AccelerateRidleyTowardDesiredXYPosition_NoDecelerationBoost 
    DEC.W $0FB2 
    BPL .return 
    JSR.W Function_RidleyTail_StartTailbouncing 
    JSR.W SetSpeedsForTailbouncing 
    LDA.W #Function_Ridley_Tailbouncing_AttemptToGrabSamus : STA.W $0FA8 
    LDA.W $05E5 
    AND.W #$003F 
    ADC.W #$0080 
    STA.W $0FB2 

.return:
    RTS 


Function_Ridley_Tailbouncing_AttemptToGrabSamus:
    JSR.W AttemptToGrabSamus 
    BCC .grabFailed 
    JSR.W RidleyGrabbedSamus_ResetTailAI 
    JMP.W GrabbingSamus_SetMinimumYSpeed_ResetTailAI 


.return:
    RTS 


.grabFailed:
    LDA.W $0FAC 
    CLC 
    ADC.L $7E200C 
    CMP.W #$0600 
    BMI .minimum600 
    LDA.W #$0600 

.minimum600:
    STA.W $0FAC 
    JSR.W CheckForTailbounceCollisionWithSolidBlock 
    BCC .return 
    LDA.L $7E20A4 : STA.B $12 
    LDA.L $7E20A6 
    CLC 
    ADC.W #$000C 
    STA.B $14 
    LDA.W #$0009 
    LDY.W #EnemyProjectile_MiscDust 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    LDA.W #$0076 
    JSL.L QueueSound_Lib2_Max6 
    LDA.W #$000D : STA.W $183E 
    LDA.W #$0004 : STA.W $1840 
    JSR.W CheckForTurnaroundDuringTailbounce_RandomlyChangeDirection 
    JSR.W SetSpeedsForTailbouncing 
    LDX.W #InitializeTailParts_distanceFromRidleyToTailParts 
    LDY.W #$2026 
    JSR.W UpdateTailPartRAMFromXToY 
    LDA.W #$0C00 : STA.L $7E2028 
    STA.L $7E203C 
    STA.L $7E2050 
    STA.L $7E2064 
    STA.L $7E2078 
    STA.L $7E208C 
    STA.L $7E20A0 
    LDA.W #$0004 : STA.L $7E2000 
    LDA.L $7E800C 
    INC A 
    CMP.W #$0002 
    BMI .everyOtherBounce 
    LDA.L $7E7820 
    DEC A 
    BEQ .RidleyTurning 
    LDA.W #InstList_Ridley_FacingLeft_Fireballing_0 
    JSR.W SetRidleyInstList 

.RidleyTurning:
    LDA.W #$0000 

.everyOtherBounce:
    STA.L $7E800C 
    LDA.W #Function_Ridley_Tailbouncing_HitGround : STA.W $0FA8 
    RTS 


Function_Ridley_Tailbouncing_HitGround:
    JSR.W CheckIfSamusIsBelowTailbounceThreshold 
    BCC .nextFunction 
    DEC.W $0FB2 
    BMI .nextFunction 
    LDA.W $0FAC 
    CLC 
    ADC.L $7E200E 
    STA.W $0FAC 
    BMI .return 
    LDA.W #$0000 : STA.W $0FAC 
    LDA.W #Function_Ridley_Tailbouncing_AttemptToGrabSamus : STA.W $0FA8 

.return:
    RTS 


.nextFunction:
    JSR.W RidleyGrabbedSamus_ResetTailAI 
    LDA.W #DetermineAndExecuteNewRidleyAIScript : STA.W $0FA8 
    RTS 


CheckForTailbounceCollisionWithSolidBlock:
    LDA.L $7E20A4 
    TAX 
    LDA.L $7E20A6 
    CLC 
    ADC.W #$0010 
    TAY 
    JSL.L CheckForCollisionWithNonAirBlock 
    BCS .return 
    LDA.L $7E2090 
    TAX 
    LDA.L $7E2092 
    CLC 
    ADC.W #$0012 
    TAY 
    JSL.L CheckForCollisionWithNonAirBlock 
    BCS .return 
    LDA.L $7E207C 
    TAX 
    LDA.L $7E207E 
    CLC 
    ADC.W #$0012 
    TAY 
    JSL.L CheckForCollisionWithNonAirBlock 
    BCS .return 
    LDA.L $7E2068 
    TAX 
    LDA.L $7E206A 
    CLC 
    ADC.W #$0012 
    TAY 
    JSL.L CheckForCollisionWithNonAirBlock 
    BCS .return 
    LDA.L $7E2054 
    TAX 
    LDA.L $7E2056 
    CLC 
    ADC.W #$0012 
    TAY 
    JSL.L CheckForCollisionWithNonAirBlock 
    BCS .return 
    NOP ; >.<

.return:
    RTS 


RidleyGrabbedSamus_ResetTailAI:
    LDA.W #$0001 : STA.L $7E2000 
    STA.L $7E2014 
    RTS 


AttemptToGrabSamus:
    JSR.W CheckIfSpinJumpGrapplingDamageBoosting 
    BCS .grab 
    RTS 


.grab:
    LDX.W #$0004 
    LDY.W #$0004 ; fallthrough to AttemptToGrabSamus_SkipSpinCheck

AttemptToGrabSamus_SkipSpinCheck:
    STX.B $16 
    STY.B $18 
    LDA.L $7E7820 
    ASL A 
    TAY 
    LDA.W HoldingSamusXDispacement,Y 
    CLC 
    ADC.W $0F7A 
    STA.B $12 
    LDA.L $7E783A 
    TAY 
    LDA.W HoldingSamusYDispacement,Y 
    CLC 
    ADC.W $0F7E 
    STA.B $14 
    JMP.W EfficientCollisionDetectionForSamusAt_12_14 


GrabbingSamus_SetMinimumYSpeed_ResetTailAI:
    LDA.W $0FAC 
    BMI + 
    EOR.W #$FFFF 
    INC A 

  + CMP.W #$FE00 
    BMI + 
    LDA.W #$FE00 

  + STA.W $0FAC 
    JSR.W RidleyGrabbedSamus_ResetTailAI 
    LDA.W #Function_Ridley_InPositionToGrabSamus_NoPowerBomb : STA.W $0FA8 
    JMP.W Function_Ridley_InPositionToGrabSamus_NoPowerBomb 


CheckForTurnaroundDuringTailbounce_RandomlyChangeDirection:
    LDA.W $0FAA 
    BNE .storeXSpeed 
    LDA.W #$00C0 
    BIT.W $0F79 
    BPL + 
    EOR.W #$FFFF 
    INC A 

  + STA.W $0FAA 

.storeXSpeed:
    LDA.W $0F7A 
    SEC 
    SBC.W $0AF6 
    EOR.W $0FAA 
    BMI + 
    LDA.W $0F7A 
    CMP.L $7E8004 
    BMI .crossedLeftBoundary 
    CMP.L $7E8006 
    BPL .crossedRightBoundary 
    LDA.W $05E5 
    CMP.W #$0555 
    BCC .return 

.changeDirection:
    LDA.W $0FAA 
    EOR.W #$FFFF 
    INC A 
    STA.W $0FAA 

.return:
    RTS 


  + LDA.W $0F7A 
    CMP.L $7E8004 
    BMI .crossedLeftBoundary 
    CMP.L $7E8006 
    BPL .crossedRightBoundary 
    LDA.W $05E5 
    CMP.W #$0555 
    BCC .changeDirection 
    RTS 


.crossedLeftBoundary:
    LDA.W $0FAA 
    BMI .changeDirection 
    RTS 


.crossedRightBoundary:
    LDA.W $0FAA 
    BPL .changeDirection 
    RTS 


SetSpeedsForTailbouncing:
    LDA.W $05E5 
    AND.W #$0003 
    ASL A 
    TAY 
    LDA.W .XSpeedPointers,Y : STA.B $12 
    LDA.W .YSpeedPointers,Y : STA.B $14 
    LDA.L $7E7824 
    CLC 
    ADC.W #$0002 
    ASL A 
    TAY 
    LDA.W .acceleration,Y : STA.L $7E200E 
    LDA.W .store7E200C,Y : STA.L $7E200C 
    LDA.B ($14),Y : STA.W $0FAC 
    LDA.B ($12),Y 
    LDX.W $0FAA 
    BPL + 
    EOR.W #$FFFF 
    INC A 

  + STA.W $0FAA 
    RTS 


.acceleration:
    dw $000A,$0010,$0020,$0030,$0040,$0050 

.store7E200C:
    dw $0010,$0020,$0040,$0080,$0400,$0500 

.XSpeedPointers:
    dw .randomXSpeed0 
    dw .randomXSpeed1 
    dw .randomXSpeed2 
    dw .randomXSpeed3 

.YSpeedPointers:
    dw .randomYSpeed0 
    dw .randomYSpeed1 
    dw .randomYSpeed2 
    dw .randomYSpeed3 

.randomXSpeed0:
    dw $0058,$0070,$00A0,$00A8,$00B0,$00B8 

.randomXSpeed1:
    dw $0078,$0090,$00C0,$00C8,$00D0,$00D8 

.randomXSpeed2:
    dw $0098,$00B0,$00E0,$00E8,$00F0,$00F8 

.randomXSpeed3:
    dw $00B8,$00D0,$0100,$0108,$0110,$0118 

.randomYSpeed0:
    dw $FE60,$FDE0,$FCE0,$FC20,$FA80,$F980 

.randomYSpeed1:
    dw $FE00,$FD80,$FC80,$FBC0,$FA60,$F960 

.randomYSpeed2:
    dw $FDE0,$FD60,$FC60,$FB80,$FA40,$F940 

.randomYSpeed3:
    dw $FDC0,$FD40,$FC40,$FB60,$FA20,$F920 

HoldingSamusXDispacement:
    dw $000C,$0000,$FFF4 

HoldingSamusYDispacement:
    dw $0023,$002E,$0038 

MoveSamusToWithinRidleysClawsIfHolding:
    LDA.L $7E7828 
    BEQ .noSamusXDisplacement 
    STA.B $12 
    BPL + 
    EOR.W #$FFFF 
    INC A 

  + SEC 
    SBC.W #$0004 
    BPL .positive 
    LDA.W #$0000 
    BRA + 


.positive:
    BIT.B $12 
    BPL + 
    EOR.W #$FFFF 
    INC A 

  + STA.L $7E7828 

.noSamusXDisplacement:
    LDA.L $7E782A 
    BEQ .noSamusYDisplacement 
    STA.B $12 
    BPL + 
    EOR.W #$FFFF 
    INC A 

  + SEC 
    SBC.W #$0004 
    BPL .positive2 
    LDA.W #$0000 
    BRA + 


.positive2:
    BIT.B $12 
    BPL + 
    EOR.W #$FFFF 
    INC A 

  + STA.L $7E782A 

.noSamusYDisplacement:
    LDA.L $7E7820 
    ASL A 
    TAY 
    LDA.W HoldingSamusXDispacement,Y 
    ADC.W $0F7A 
    CLC 
    ADC.L $7E7828 
    STA.W $0AF6 
    LDA.L $7E783A 
    TAY 
    LDA.W HoldingSamusYDispacement,Y 
    CLC 
    ADC.W $0F7E 
    CLC 
    ADC.L $7E782A 
    STA.W $0AFA 
    RTS 


SetDisplacementForRidleyGrabbingSamus:
    LDA.L $7E7820 
    ASL A 
    TAY 
    LDA.W HoldingSamusXDispacement,Y 
    ADC.W $0F7A 
    SEC 
    SBC.W $0AF6 
    EOR.W #$FFFF 
    INC A 
    STA.L $7E7828 
    LDA.L $7E783A 
    TAY 
    LDA.W HoldingSamusYDispacement,Y 
    CLC 
    ADC.W $0F7E 
    SEC 
    SBC.W $0AFA 
    EOR.W #$FFFF 
    INC A 
    STA.L $7E782A 
    RTS 


CheckIfRidleyIsReadyToExplode:
    LDA.L $7E800A 
    CMP.W #$000A 
    BMI .notDead 
    JSL.L SetRidleyAsDead 
    LDA.W #Function_Ridley_FinalRoar : STA.W $0FA8 
    JMP.W Function_Ridley_FinalRoar 


.notDead:
    LDA.W $0CEE 
    BEQ .noPowerBomb 
    LDA.W #Function_Ridley_DodgingPowerbomb_MaybeHoldingSamus : STA.W $0FA8 
    JMP.W Function_Ridley_DodgingPowerbomb_MaybeHoldingSamus 


.noPowerBomb:
    LDA.W #Function_Ridley_InitializeMovementToCenter : STA.W $0FA8 
    LDA.W #$0001 : STA.L $7E2004 
    RTS 


CheckFor_Deathswoop_PowerBombDodge_MoveToCenter_RamGrabSamus:
    JSR.W CheckIfSpinJumpGrapplingDamageBoosting 
    BCC CheckIfRidleyIsReadyToExplode 
    LDA.L $7E783E 
    BNE CheckIfRidleyIsReadyToExplode 
    LDA.L $7E7820 
    ASL A 
    TAY 
    LDA.W .signedBitmask,Y : STA.B $12 
    LDA.W $0F7A 
    SEC 
    SBC.W $0AF6 
    STA.B $14 
    EOR.B $12 
    BPL + 
    LDA.B $14 
    BPL .positive 
    EOR.W #$FFFF 
    INC A 

.positive:
    CMP.W #$0020 
    BPL CheckIfRidleyIsReadyToExplode 

  + LDA.W $0F7E 
    CLC 
    ADC.W #$0023 
    SEC 
    SBC.W $0AFA 
    BPL CheckIfRidleyIsReadyToExplode 
    LDX.W #$FFF0 
    LDA.L $7E7820 
    BEQ .facingLeft 
    LDX.W #$0010 

.facingLeft:
    TXA 
    CLC 
    ADC.W $0AF6 
    STA.B $12 
    LDA.W $0AFA 
    CLC 
    ADC.W #$FFFC 
    STA.B $14 
    LDX.W #$0000 
    LDA.L $7E7824 
    ASL A 
    TAY 
    LDA.W .accelerationDivisorIndex,Y 
    TAY 
    JSR.W AccelerateRidleyTowardDesiredXYPosition_NoDecelerationBoost 
    LDA.L $7E7820 
    ASL A 
    TAY 
    LDA.W HoldingSamusXDispacement,Y 
    CLC 
    ADC.W $0F7A 
    STA.B $12 
    LDA.W #$0023 
    CLC 
    ADC.W $0F7E 
    STA.B $14 
    LDA.W #$0008 : STA.B $16 
    LDA.W #$000C : STA.B $18 
    JSR.W EfficientCollisionDetectionForSamusAt_12_14 
    BCS .collision 
    RTS 


.signedBitmask:
    dw $0000,$0000,$8000 

.accelerationDivisorIndex:
    dw $0001,$0003,$0007,$000A 

.collision:
    LDA.W $0FAC 
    EOR.W #$FFFF 
    INC A 
    STA.W $0FAC 
    LDA.W $0F8C 
    BEQ .dead 
    LDA.W $0CEE 
    LDA.W $0CEE 
    BEQ Function_Ridley_InPositionToGrabSamus_NoPowerBomb 
    JSR.W GrabSamus 
    LDA.W #Function_Ridley_DodgingPowerbomb_MaybeHoldingSamus : STA.W $0FA8 
    JMP.W Function_Ridley_DodgingPowerbomb_MaybeHoldingSamus 


.dead:
    LDA.L $7E7836 
    BNE .holdingSamus 
    JSR.W GrabSamus 

.holdingSamus:
    JSL.L SetRidleyAsDead 
    LDA.W #Function_Ridley_MoveToDeathSpot : STA.W $0FA8 
    JMP.W Function_Ridley_MoveToDeathSpot 


Function_Ridley_InPositionToGrabSamus_NoPowerBomb:
    LDA.L $7E7820 
    ASL A 
    TAY 
    LDA.W TargetXPositionHoldingSamus,Y : STA.L $7E782E 
    LDA.W $0F7E 
    CLC 
    ADC.W #$FFC0 
    CMP.W #$0100 
    BPL .minimum100 
    LDA.W #$0100 

.minimum100:
    STA.L $7E7830 
    LDA.L $7E7836 
    BNE .holdingSamus 
    JSR.W GrabSamus 

.holdingSamus:
    LDA.W #Function_Ridley_HoldingSamus_MoveTowardTargetPosition : STA.W $0FA8 
    LDA.W #$0020 : STA.W $0FB2 ; fallthrough to Function_Ridley_HoldingSamus_MoveTowardTargetPosition

Function_Ridley_HoldingSamus_MoveTowardTargetPosition:
    LDA.L $7E782E : STA.B $12 
    LDA.L $7E7830 : STA.B $14 
    LDX.W #$0000 
    LDY.W #$0000 
    JSR.W AccelerateRidleyTowardDesiredXYPosition_NoDecelerationBoost 
    DEC.W $0FB2 
    BPL .return 
    LDA.W #Function_Ridley_DropSamus : STA.W $0FA8 
    LDA.W #$0020 : STA.W $0FB2 

.return:
    RTS 


TargetXPositionHoldingSamus:
    dw $0040,$0000,$00D0 

Function_Ridley_DropSamus:
    DEC.W $0FB2 
    BMI .release 
    LDA.L $7E782E : STA.B $12 
    LDA.W #$0100 : STA.B $14 
    LDX.W #$0000 
    LDY.W #$0000 
    JMP.W AccelerateRidleyTowardDesiredXYPosition_NoDecelerationBoost 


.release:
    LDA.W #$0008 : STA.L $7E201E 
    LDA.W #$00F0 : STA.L $7E2012 
    JSR.W ReleaseSamus 
    LDA.W #Function_Ridley_FallBackIntoPositionAfterDroppingSamus : STA.W $0FA8 
    LDA.W #$0040 : STA.W $0FB2 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_A6BC28:
    dw $00B0,$0000,$0050 
endif ; !FEATURE_KEEP_UNREFERENCED

Function_Ridley_FallBackIntoPositionAfterDroppingSamus:
    DEC.W $0FB2 
    BMI .timerExpired 
    LDA.L $7E7820 
    ASL A 
    TAY 
    LDA.W .targetXPositions,Y : STA.B $12 
    LDA.W #$00E0 : STA.B $14 
    LDX.W #$0000 
    LDY.W #$0000 
    JSR.W AccelerateRidleyTowardDesiredXYPosition_NoDecelerationBoost 
    RTS 


.timerExpired:
    LDA.W #$0010 : STA.L $7E201E 
    LDA.W #$00F0 : STA.L $7E2012 
    LDA.W #DetermineAndExecuteNewRidleyAIScript : STA.W $0FA8 
    RTS 


.targetXPositions:
    dw $00B0,$0000,$0050 

GrabSamus:
    JSR.W SetDisplacementForRidleyGrabbingSamus 
    LDA.W $0F86 
    ORA.W #$0400 
    STA.W $0F86 
    LDA.W #$0001 : STA.L $7E7836 
    DEC A 
    JSL.L Run_Samus_Command 
    SEC 
    JMP.W TransferGraphicsForRidleysClawsHoldingSamusOrBabyMetroid 


ReleaseSamus:
    LDA.W #$0001 : STA.L $7E2004 
    STA.L $7E2000 
    LDA.L $7E7802 
    BMI .dead 
    JSR.W CheckIfSpinJumpGrapplingDamageBoosting 
    LDA.W #$0006 
    BVS + 
    LDA.W #$000A 

  + STA.L $7E783C 

.dead:
    LDA.W #$0000 : STA.L $7E7836 
    INC A 
    JSL.L Run_Samus_Command 
    CLC 
    JMP.W TransferGraphicsForRidleysClawsHoldingSamusOrBabyMetroid 


HandleRidleySamusInteractionBit:
    LDA.L $7E7802 
    BMI .return 
    BEQ .ridleyInactive 
    JSR.W CheckIfRidleyIsOnScreen 
    BCC .onScreen 
    LDA.W $0F86 
    ORA.W #$0400 
    STA.W $0F86 
    RTS 


.onScreen:
    LDA.W $0F86 
    AND.W #$FBFF 
    STA.W $0F86 

.ridleyInactive:
    LDA.L $7E783C 
    BEQ .return 
    DEC A 
    STA.L $7E783C 
    BNE .return 
    LDA.L $7E7802 
    BMI .return 
    LDA.W $0F86 
    AND.W #$FBFF 
    STA.W $0F86 

.return:
    RTS 


CheckIfSpinJumpGrapplingDamageBoosting:
    LDA.W $0A1F 
    AND.W #$00FF 
    PHX 
    TAX 
    BIT.W .movementTypes_minus1,X 
    BMI .notSpinGrappleDamage 
    PLX 
    CLC 
    RTS 


.notSpinGrappleDamage:
    PLX 
    SEC 

.movementTypes_minus1:
    RTS 


.movementTypes:
    db $80,$80,$80,$00,$FF,$80,$80,$FF,$FF,$FF,$80,$00,$00,$80,$80,$80 
    db $80,$FF,$FF,$FF,$80,$80,$00,$80,$80,$00,$00,$80 

CheckIfSamusIsBelowTailbounceThreshold:
    LDA.W $0AFA 
    CMP.W #$0160 
    BPL .aboveThreshold 
    CLC 
    RTS 


.aboveThreshold:
    SEC 
    RTS 


PowerBombCheck:
    LDA.L $7E7802 
    BMI .return 
    BEQ .return 
    CMP.W #$0002 
    BEQ .return 
    LDA.W $0CEE 
    BEQ .return 
    LDA.L $7E7836 
    BNE .return 
    JSR.W RidleyGrabbedSamus_ResetTailAI 
    LDY.W #CheckFor_Deathswoop_PowerBombDodge_MoveToCenter_RamGrabSamus 
    STY.W $0FA8 

.return:
    RTS 


Function_Ridley_DodgingPowerbomb_MaybeHoldingSamus:
    LDA.W $0CEE 
    BEQ .powerBombActive 
    LDA.W #$0002 : STA.L $7E7802 
    LDY.W #$0050 
    LDA.W $0CE2 
    CMP.W #$0080 
    BPL + 
    LDY.W #$00C0 

  + STY.B $12 
    LDY.W #$00C0 
    LDA.W $0CE4 
    CMP.W #$0100 
    BPL + 
    LDY.W #$0180 

  + STY.B $14 
    LDX.W #$0000 
    JSR.W GetRidleyAccelerationDivisorIndex 
    JMP.W AccelerateRidleyTowardDesiredXYPosition_NoDecelerationBoost 


.powerBombActive:
    LDA.W #$0001 : STA.L $7E7802 
    LDY.W #DetermineAndExecuteNewRidleyAIScript 
    LDA.L $7E7836 
    BEQ .notHoldingSamus 
    LDY.W #Function_Ridley_InPositionToGrabSamus_NoPowerBomb 

.notHoldingSamus:
    STY.W $0FA8 
    RTS 


Function_RidleyCeres_InitializeBabyMetroidDrop:
    LDA.W #$00C0 : STA.B $12 
    LDA.W #$0080 : STA.B $14 
    LDX.W #$0000 
    LDY.W #$0001 
    JSR.W AccelerateCeresRidleyTowardDesiredXY 
    LDA.W $0F7A 
    CMP.W #$00C0 
    BMI .return 
    LDA.W #Function_RidleyCeres_DropBabyMetroid : STA.W $0FA8 

.return:
    RTS 


Function_RidleyCeres_DropBabyMetroid:
    LDA.W #$FF40 : STA.L $7E8000 
    LDA.W #$00C0 : STA.B $12 
    LDA.W #$FF80 : STA.B $14 
    LDX.W #$0000 
    LDY.W #$0001 
    JSR.W AccelerateCeresRidleyTowardDesiredXY 
    LDA.W $0F7E 
    CMP.W #$0020 
    BPL Function_RidleyCeres_PickupBabyMetroid_return 
    LDA.W #DropBabyMetroid : STA.L $7E8800 
    LDA.W #Function_RidleyCeres_PickupBabyMetroidDelay : STA.W $0FA8 
    LDA.W #$0015 : STA.W $0FB2 
    RTS 


Function_RidleyCeres_PickupBabyMetroidDelay:
    DEC.W $0FB2 
    BPL Function_RidleyCeres_PickupBabyMetroid_return 
    LDA.W #InstList_RidleyCeres_FacingLeft_ExtendLegs 
    JSR.W SetRidleyInstList 
    LDA.W #Function_RidleyCeres_PickupBabyMetroid : STA.W $0FA8 ; fallthrough to Function_RidleyCeres_PickupBabyMetroid

Function_RidleyCeres_PickupBabyMetroid:
    LDA.L $7E8804 
    CLC 
    ADC.W #$FFF6 
    STA.B $12 
    LDA.L $7E8808 
    CLC 
    ADC.W #$FFC8 
    STA.B $14 
    LDX.W #$0000 
    LDY.W #$000C 
    JSR.W AccelerateRidleyTowardDesiredXYPosition_NoDecelerationBoost 
    LDA.W #$000E 
    CLC 
    ADC.W $0F7A 
    STA.B $12 
    LDA.W #$0042 
    CLC 
    ADC.W $0F7E 
    STA.B $14 
    LDA.W #$0004 : STA.B $16 
    LDA.W #$0004 : STA.B $18 
    JSR.W CheckIfRidleyIsWithinRangeToPickupBabyMetroid 
    BCS Function_RidleyCeres_PickupBabyMetroid_holding 

Function_RidleyCeres_PickupBabyMetroid_return:
    RTS 


Function_RidleyCeres_PickupBabyMetroid_holding:
    LDA.W #$0001 : STA.L $7E7836 
    SEC 
    JSR.W TransferGraphicsForRidleysClawsHoldingSamusOrBabyMetroid 
    LDA.W #$FE00 : STA.W $0FAC 
    LDA.W #UpdateBabyMetroidPosition_CarriedInFeet : STA.L $7E8800 
    LDA.W #Function_RidleyCeres_FlyAwayToEndFight : STA.W $0FA8 
    RTS 


CheckIfRidleyIsWithinRangeToPickupBabyMetroid:
    LDA.L $7E8804 
    SEC 
    SBC.B $12 
    BPL + 
    EOR.W #$FFFF 
    INC A 

  + SEC 
    SBC.W #$0004 
    BCC + 
    CMP.B $16 
    BCS .returnNotGrabbed 

  + LDA.L $7E8808 
    SEC 
    SBC.B $14 
    BPL + 
    EOR.W #$FFFF 
    INC A 

  + SEC 
    SBC.W #$0004 
    BCC .returnGrabbed 
    CMP.B $18 
    BCC .returnGrabbed 

.returnNotGrabbed:
    CLC 
    RTS 


.returnGrabbed:
    SEC 
    RTS 


HandleCarryingBabyMetroid:
    LDA.L $7E8800 : STA.B $12 
    JMP.W ($0012) 


UpdateBabyMetroidPosition_CarriedInArms:
    LDA.W #$FFF0 
    CLC 
    ADC.W $0F7A 
    STA.L $7E8804 
    LDA.W #$0016 
    CLC 
    ADC.W $0F7E 
    STA.L $7E8808 
    RTS 


UpdateBabyMetroidPosition_CarriedInFeet:
    LDA.W #$000E 
    CLC 
    ADC.W $0F7A 
    STA.L $7E8804 
    LDA.W #$0042 
    CLC 
    ADC.W $0F7E 
    STA.L $7E8808 
    RTS 


DropBabyMetroid:
    LDA.W #$0000 : STA.L $7E880A 
    STA.L $7E880C 
    LDA.W #BabyMetroidDropped : STA.L $7E8800 ; fallthrough to BabyMetroidDropped

BabyMetroidDropped:
    LDA.L $7E880C 
    CLC 
    ADC.W #$0008 
    STA.L $7E880C 
    SEP #$20 
    CLC 
    ADC.L $7E8807 
    STA.L $7E8807 
    REP #$20 
    AND.W #$FF00 
    XBA 
    BPL + 
    ORA.W #$FF00 

  + ADC.L $7E8808 
    STA.L $7E8808 
    CMP.W #$00C0 
    BMI .return 
    LDA.W #$00C0 : STA.L $7E8808 
    LDA.W #.return : STA.L $7E8800 

.return:
    RTS 


DrawBabyMetroid:
    LDA.W #$7806 
    JSR.W GetBabyMetroidSpritemapPointerFromInstList 
    LDA.L $7E8804 : STA.B $12 
    LDA.L $7E8808 : STA.B $14 
    STZ.B $16 
    JMP.W RidleyGeneralUseDrawing 


InstList_BabyMetroidCutscene_0:
    dw Instruction_BabyMetroidCutscene_GotoXIfNotFalling 
    dw InstList_BabyMetroidCutscene_1 
    dw $000A 
    dw Spritemap_BabyMetroidCutscene_HorizontalSquish 
    dw $000A 
    dw Spritemap_BabyMetroidCutscene_Round 
    dw $000A 
    dw Spritemap_BabyMetroidCutscene_VerticalSquish 
    dw $000A 
    dw Spritemap_BabyMetroidCutscene_Round 
    dw Instruction_BabyMetroidCutscene_GotoXIfNotFalling 
    dw InstList_BabyMetroidCutscene_1 
    dw $000A 
    dw Spritemap_BabyMetroidCutscene_HorizontalSquish 
    dw $000A 
    dw Spritemap_BabyMetroidCutscene_Round 
    dw $000A 
    dw Spritemap_BabyMetroidCutscene_VerticalSquish 
    dw $000A 
    dw Spritemap_BabyMetroidCutscene_Round 

InstList_BabyMetroidCutscene_1:
    dw Instruction_BabyMetroidCutscene_PlayCrySFXOrGotoX 
    dw InstList_BabyMetroidCutscene_0 
    dw Instruction_BabyMetroidCutscene_UpdateColors 
    dw Palette_BabyMetroidCutscene_HorizontalSquish 
    dw $0006 
    dw Spritemap_BabyMetroidCutscene_HorizontalSquish 
    dw Instruction_BabyMetroidCutscene_UpdateColors 
    dw Palette_BabyMetroidCutscene_Round 
    dw $0005 
    dw Spritemap_BabyMetroidCutscene_Round 
    dw Instruction_BabyMetroidCutscene_UpdateColors 
    dw Palette_BabyMetroidCutscene_VerticalSquish 
    dw $0004 
    dw Spritemap_BabyMetroidCutscene_VerticalSquish 
    dw Instruction_BabyMetroidCutscene_UpdateColors 
    dw Palette_BabyMetroidCutscene_Round 
    dw $0003 
    dw Spritemap_BabyMetroidCutscene_Round 
    dw Instruction_BabyMetroidCutscene_UpdateColors 
    dw Palette_BabyMetroidCutscene_HorizontalSquish 
    dw $0002 
    dw Spritemap_BabyMetroidCutscene_HorizontalSquish 
    dw Instruction_BabyMetroidCutscene_UpdateColors 
    dw Palette_BabyMetroidCutscene_Round 
    dw $0003 
    dw Spritemap_BabyMetroidCutscene_Round 
    dw Instruction_BabyMetroidCutscene_UpdateColors 
    dw Palette_BabyMetroidCutscene_VerticalSquish 
    dw $0004 
    dw Spritemap_BabyMetroidCutscene_VerticalSquish 
    dw Instruction_BabyMetroidCutscene_UpdateColors 
    dw Palette_BabyMetroidCutscene_Round 
    dw $0005 
    dw Spritemap_BabyMetroidCutscene_Round 
    dw Instruction_BabyMetroidCutscene_UpdateColors 
    dw Palette_BabyMetroidCutscene_HorizontalSquish 
    dw $0006 
    dw Spritemap_BabyMetroidCutscene_HorizontalSquish 
    dw Instruction_BabyMetroidCutscene_UpdateColors 
    dw Palette_BabyMetroidCutscene_Round 
    dw $0007 
    dw Spritemap_BabyMetroidCutscene_Round 
    dw Instruction_BabyMetroidCutscene_UpdateColors 
    dw Palette_BabyMetroidCutscene_VerticalSquish 
    dw $0008 
    dw Spritemap_BabyMetroidCutscene_VerticalSquish 
    dw Instruction_BabyMetroidCutscene_UpdateColors 
    dw Palette_BabyMetroidCutscene_Round 
    dw $0009 
    dw Spritemap_BabyMetroidCutscene_Round 
    dw Instruction_BabyMetroidCutscene_UpdateColors 
    dw Palette_BabyMetroidCutscene_EndOfInstList 
    dw Instruction_BabyMetroidCutscene_GotoXIfNotFalling 
    dw InstList_BabyMetroidCutscene_1 
    dw Instruction_BabyMetroidCutscene_GotoX 
    dw InstList_BabyMetroidCutscene_0 

Instruction_BabyMetroidCutscene_PlayCrySFXOrGotoX:
    LDA.L $7E880C 
    BNE .playSFX 
    LDA.W $05E5 
    AND.W #$0001 
    BNE Instruction_BabyMetroidCutscene_GotoX 

.playSFX:
    LDA.W #$0024 
    JSL.L QueueSound_Lib3_Max6 

Instruction_BabyMetroidCutscene_NextInstruction:
    INX #2
    RTS 


Instruction_BabyMetroidCutscene_UpdateColors:
    LDY.W $0000,X 
    PHX 
    LDX.W #$0162 
    LDA.W #$000F 
    JSL.L WriteAColorsFromYtoColorIndexX 
    PLX 
    BRA Instruction_BabyMetroidCutscene_NextInstruction 


Instruction_BabyMetroidCutscene_GotoXIfNotFalling:
    LDA.L $7E880C 
    BEQ Instruction_BabyMetroidCutscene_NextInstruction 

Instruction_BabyMetroidCutscene_GotoX:
    LDA.W $0000,X 
    TAX 
    RTS 


Spritemap_BabyMetroidCutscene_HorizontalSquish:
    dw $0005,$0000 
    db $08 
    dw $F50D,$01F8 
    db $08 
    dw $B50D,$0000 
    db $F0 
    dw $750D,$01F8 
    db $F0 
    dw $350D,$81F8 
    db $F8 
    dw $3742 

Spritemap_BabyMetroidCutscene_Round:
    dw $0005,$0000 
    db $08 
    dw $F50D,$01F8 
    db $08 
    dw $B50D,$0000 
    db $F0 
    dw $750D,$01F8 
    db $F0 
    dw $350D,$81F8 
    db $F8 
    dw $374C 

Spritemap_BabyMetroidCutscene_VerticalSquish:
    dw $0005,$0000 
    db $08 
    dw $F50D,$01F8 
    db $08 
    dw $B50D,$0000 
    db $F0 
    dw $750D,$01F8 
    db $F0 
    dw $350D,$81F8 
    db $F8 
    dw $374E 

CeresRidleyPostGetawayFunctionHandler:
    LDX.W $0FB2 
    JMP.W (.pointers,X) 


.pointers:
    dw PostGetawayFunction_UpdateColors_TransferTimerSpriteTiles 
    dw PostGetawayFunction_TransferTimerBackgroundTiles 
    dw PostGetawayFunction_TransferEscapeTiles_ProcessEmergencyText 
    dw PostGetawayFunction_SetupCeresEscapeTimer 
    dw PostGetawayFunction_Wait20f_QueueTilemapTransfers 
    dw PostGetawayFunction_CycleEmergencyTextColors_HandleTyping 
    dw PostGetawayFunction_CycleEmergencyTextColors_StartEscape 

PostGetawayFunction_UpdateColors_TransferTimerSpriteTiles:
    LDA.L $7EC002 : STA.L $7EC0C2 
    LDA.L $7EC006 : STA.L $7EC0C6 
    LDA.L $7EC022 : STA.L $7EC0A2 
    LDA.L $7EC026 : STA.L $7EC0A6 
    LDX.W #ZebesEscapeTimerSpriteTileTransferEntries_size 
    STX.W $0FB0 
    INC.W $0FB2 
    INC.W $0FB2 ; fallthrough to PostGetawayFunction_TransferTimerBackgroundTiles

PostGetawayFunction_TransferTimerBackgroundTiles:
    JSR.W ProcessEscapeTimerTileTransfers 
    BCC PostGetawayFunction_return 
    LDX.W #CeresEscapeTimerBG12TransferEntries_size 
    STX.W $0FB0 
    INC.W $0FB2 
    INC.W $0FB2 ; fallthrough to PostGetawayFunction_TransferEscapeTiles_ProcessEmergencyText

PostGetawayFunction_TransferEscapeTiles_ProcessEmergencyText:
    JSR.W ProcessEscapeTimerTileTransfers 
    BCC PostGetawayFunction_return 
    INC.W $0FB2 
    INC.W $0FB2 
    JSR.W DrawEmergencyText 
    LDA.W #$0080 : STA.W $0FB0 
    LDA.W #$0007 
    JSL.L QueueMusicDataOrTrack_8FrameDelay 

PostGetawayFunction_return:
    RTS 


PostGetawayFunction_SetupCeresEscapeTimer:
    JSR.W CycleEmergencyTextColors 
    DEC.W $0FB0 
    BNE .return 
    LDA.W #TypewriterText_CeresEscapeTimer : STA.L $7E8036 
    LDA.W #$0000 : STA.L $7E8038 
    STA.L $7E803A 
    STA.L $7E803C 
    STA.L $7E803E 
    LDA.W #$0020 : STA.W $0FB0 
    LDA.W $09E2 
    BNE .japanText 
    INC.W $0FB2 
    INC.W $0FB2 

.japanText:
    INC.W $0FB2 
    INC.W $0FB2 

.return:
    RTS 


PostGetawayFunction_Wait20f_QueueTilemapTransfers:
    DEC.W $0FB0 
    BNE PostGetawayFunction_CycleEmergencyTextColors_HandleTyping 
    INC.W $0FB2 
    INC.W $0FB2 
    JSL.L QueueCeresEscapeJapaneseTextTilemapTransfers ; fallthrough to PostGetawayFunction_CycleEmergencyTextColors_HandleTyping

PostGetawayFunction_CycleEmergencyTextColors_HandleTyping:
    JSR.W CycleEmergencyTextColors 
    LDA.W #$3582 
    JSL.L HandleTypewriterText_External 
    BCC .return 
    INC.W $0FB2 
    INC.W $0FB2 

.return:
    RTS 


PostGetawayFunction_CycleEmergencyTextColors_StartEscape:
    JSR.W CycleEmergencyTextColors 
    JSR.W Function_Ridley_ResetSpeeds 
    STZ.W $0FB2 
    LDA.W #Function_RidleyCeres_CycleEmergencyTextColors : STA.W $0FA8 
    LDA.W #$0001 : STA.W $0943 
    INC A 
    STA.W $093F 
    DEC A 
    JSL.L SetBossBitsInAForCurrentArea 
    RTS 


DrawEmergencyText:
    LDX.W #.tilemapEntry 
    LDY.W $0330 
    LDA.W $0000,X : STA.W $00D0,Y 
    LDA.W $0003,X : STA.W $00D3,Y 
    LDA.W $0002,X : STA.W $00D2,Y 
    LDA.W $0005,X : STA.W $00D5,Y 
    TYA 
    CLC 
    ADC.W #$0007 
    STA.W $0330 
    RTS 


.tilemapEntry:
    dw $0012 
    dl .emergencyTilemap 
    dw $50CB 

.emergencyTilemap:
    dw $3986,$398E,$3986,$3993,$3988,$3986,$398F,$3984 
    dw $399A 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_CycleColor_A6C176:
    LDX.W #$0016 
    LDA.L $7E8032 
    INC A 
    CMP.W #$0020 
    BMI + 
    LDA.W #$FFE1 

  + STA.L $7E8032 
    LDA.L $7E8032 
    BPL + 
    EOR.W #$FFFF 
    INC A 

  + AND.W #$001F 
    STA.L $7EC000,X 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


CycleEmergencyTextColors:
    LDA.L $7EC400 
    ORA.W $0797 
    BEQ + 

.return:
    RTS 


  + LDA.W $05B6 
    AND.W #$0003 
    BNE .return 
    LDA.L $7E8030 
    INC A 
    CMP.W #$0010 
    BCC .cycle 
    LDA.W #$0000 

.cycle:
    STA.L $7E8030 
    ASL A 
    ADC.L $7E8030 
    ASL A 
    TAY 
    LDX.W #$00C2 
    LDA.W .emergencyColor0,Y : STA.L $7EC000,X 
    LDA.W .emergencyColor1,Y : STA.L $7EC002,X 
    LDA.W .emergencyColor2,Y : STA.L $7EC004,X 
    RTS 


.emergencyColor0:
    dw $02DF 

.emergencyColor1:
    dw $01D7 

.emergencyColor2:
    dw $00AC,$06BE,$05B7,$04AC,$0A9E,$09B7,$08AD,$0E7D 
    dw $0D97,$0CAE,$125D,$1197,$10AF,$1A3C,$1977,$18B0 
    dw $1E1C,$1D77,$1CB0,$21FB,$2157,$20B1,$25DB,$2557 
    dw $24D2,$21FB,$2157,$20B1,$1E1C,$1D77,$1CB0,$1A3C 
    dw $1977,$18B0,$125D,$1197,$10AF,$0E7D,$0D97,$0CAE 
    dw $0A9E,$09B7,$08AD,$06BE,$05B7,$04AC 

SetupZebesEscapeTypewriter:
    LDA.L $7EC0FA : STA.L $7EC13A 
    LDA.L $7EC0FC : STA.L $7EC13C 
    LDA.W #TypewriterText_ZebesEscapeTimer : STA.L $7E8036 
    LDA.W #$0000 : STA.L $7E8038 
    STA.L $7E803A 
    STA.L $7E803C 
    STA.L $7E803E 
    STZ.B $B5 
    STZ.B $B7 
    RTL 


ProcessEscapeTimerTileTransfers:
    LDX.W $0FB0 
    LDY.W $0330 
    LDA.W $0000,X 
    BEQ .returnCarrySet 
    STA.W $00D0,Y 
    LDA.W $0003,X : STA.W $00D3,Y 
    LDA.W $0002,X : STA.W $00D2,Y 
    LDA.W $0005,X : STA.W $00D5,Y 
    TYA 
    CLC 
    ADC.W #$0007 
    STA.W $0330 
    TXA 
    ADC.W #$0007 
    STA.W $0FB0 
    TAX 
    LDA.W $0000,X 
    BEQ .returnCarrySet 
    CLC 
    RTS 


.returnCarrySet:
    SEC 
    RTS 


HandleTypewriterText_External:
    STA.B $12 
    PHB 
    PHK 
    PLB 
    JSR.W HandleTypewriterText 
    PLB 
    RTL 


HandleTypewriterText:
    LDA.L $7E803A 
    BEQ .timerExpired 
    DEC A 
    STA.L $7E803A 
    RTS 


.timerExpired:
    LDA.L $7E803C : STA.L $7E803A 
    LDA.L $7E8036 
    TAX 

.loop:
    LDA.W $0000,X 
    BNE + 
    SEC 
    RTS 


  + CMP.W #$0001 
    BNE + 
    INX #2
    LDA.W $0000,X : STA.L $7E803C 
    INX #2
    JMP.W .loop 


  + CMP.W #$000D 
    BNE + 
    INX #2
    LDA.W $0000,X : STA.L $7E8038 
    INX #2
    JMP.W .loop 


  + AND.W #$00FF 
    CMP.W #$0020 
    BNE + 
    LDA.L $7E8038 
    INC A 
    STA.L $7E8038 
    INX 
    TXA 
    STA.L $7E8036 
    CLC 
    RTS 


  + CMP.W #$0021 
    BNE + 
    LDA.W #$005B 

  + PHA 
    TXA 
    INC A 
    STA.L $7E8036 
    LDY.W $0330 
    LDA.W #$0002 : STA.W $00D0,Y 
    LDA.W #$7E00 : STA.W $00D3,Y 
    PLA 
    SEC 
    SBC.W #$0041 
    CLC 
    ADC.B $12 
    STA.L $7E8034 
    LDA.W #$8034 ; $7E
    STA.W $00D2,Y 
    LDA.L $7E8038 : STA.W $00D5,Y 
    INC A 
    STA.L $7E8038 
    TYA 
    CLC 
    ADC.W #$0007 
    STA.W $0330 
    LDA.L $7E803E 
    INC A 
    STA.L $7E803E 
    CMP.W #$0002 
    BMI .returnStillTyping 
    LDA.W #$0000 : STA.L $7E803E 
    LDA.W $079F 
    CMP.W #$0006 
    BNE .introTypewriterSFX 
    LDA.W #$0045 
    JSL.L QueueSound_Lib2_Max3 
    BRA .returnStillTyping 


.introTypewriterSFX:
    LDA.W #$000D 
    JSL.L QueueSound_Lib3_Max3 

.returnStillTyping:
    CLC 
    RTS 


QueueCeresEscapeJapaneseTextTilemapTransfers:
    LDX.W #TypewriterCeresEscapeJapaneseTextTilemapTransfer_size 
    PHB 
    PHK 
    PLB 
    LDY.W $0330 

.loop:
    LDA.W $0000,X 
    BEQ .done 
    STA.W $00D0,Y 
    LDA.W $0003,X : STA.W $00D3,Y 
    LDA.W $0002,X : STA.W $00D2,Y 
    LDA.W $0005,X : STA.W $00D5,Y 
    TYA 
    CLC 
    ADC.W #$0007 
    TAY 
    TXA 
    ADC.W #$0007 
    TAX 
    BRA .loop 


.done:
    STY.W $0330 
    PLB 
    RTL 


TypewriterCeresEscapeJapaneseTextTilemapTransfer_size:
    dw $0018 

TypewriterCeresEscapeJapaneseTextTilemapTransfer_src:
    dl TypewriterCeresEscapeJapanTextTilemap_Line0_Row0 

TypewriterCeresEscapeJapaneseTextTilemapTransfer_VRAM:
    dw $528A,$0018 
    dl TypewriterCeresEscapeJapanTextTilemap_Line0_Row1 
    dw $52AA,$0016 
    dl TypewriterCeresEscapeJapanTextTilemap_Line1_Row0 
    dw $52CA,$0016 
    dl TypewriterCeresEscapeJapanTextTilemap_Line1_Row1 
    dw $52EA,$0000 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_TypewriterCeresEscapeJapanTextTilemapTransfer_A6C3D6:
    dw $0018 
    dl TypewriterCeresEscapeJapanTextTilemap_Line0_Row0 
    dw $4A8A,$0018 
    dl TypewriterCeresEscapeJapanTextTilemap_Line0_Row1 
    dw $4AAA,$0016 
    dl TypewriterCeresEscapeJapanTextTilemap_Line1_Row0 
    dw $4ACA,$0016 
    dl TypewriterCeresEscapeJapanTextTilemap_Line1_Row1 
    dw $4AEA,$0000 
endif ; !FEATURE_KEEP_UNREFERENCED

TypewriterCeresEscapeJapanTextTilemap_Line0_Row0:
    dw $3DA0,$3DA1,$3DA2,$3DA3,$3DA4,$3DA5,$3DA6,$3DA7 
    dw $3DAF,$3DA8,$3DAF,$3DA9 

TypewriterCeresEscapeJapanTextTilemap_Line0_Row1:
    dw $3DB0,$3DB1,$3DB2,$3DB3,$3DB4,$3DB5,$3DB6,$3DB7 
    dw $3DBF,$3DB8,$3DBF,$3DB9 

TypewriterCeresEscapeJapanTextTilemap_Line1_Row0:
    dw $3DA9,$3DAA,$3DAB,$3DAC,$3DAD,$3DAE,$3DAF,$3D9C 
    dw $3D9D,$3D9E,$3D9F 

TypewriterCeresEscapeJapanTextTilemap_Line1_Row1:
    dw $3DB9,$3DBA,$3DBB,$3DBC,$3DBD,$3DBE,$3DBF,$3DC0 
    dw $3DC1,$3DC2,$3DC3 

TypewriterText_CeresEscapeTimer:
    dw $0001,$0002,$000D,$5105 
    db "SELF DESTRUCT SEQUENC" 
    db "E" 
    dw $000D,$5145 
    db "ACTIVATED EVACUATE" 
    dw $000D,$5185 
    db "COLONY IMMEDIATELY" 
    dw $0000 

TypewriterText_ZebesEscapeTimer:
    dw $0001,$0002,$000D,$4905 
    db "TIME BOMB SET!" 
    dw $000D,$4945 
    db "ESCAPE IMMEDIATELY!" 
    dw $0000 

ZebesEscapeTimerSpriteTileTransferEntries_size:
    dw $0200 

ZebesEscapeTimerSpriteTileTransferEntries_src:
    dl Tiles_EscapeTimer_0 

ZebesEscapeTimerSpriteTileTransferEntries_VRAM:
    dw $7E00,$0120 
    dl Tiles_EscapeTimer_1 
    dw $7F00,$0200 
    dl Tiles_EscapeTimerText_0 
    dw $7820,$0200 
    dl Tiles_EscapeTimerText_1 
    dw $7920,$0200 
    dl Tiles_EscapeTimerText_2 
    dw $7A20,$0200 
    dl Tiles_EscapeTimerText_3 
    dw $7B20,$0100 
    dl Tiles_EscapeTimerText_4 
    dw $7C20,$0000 

CeresEscapeTimerBG12TransferEntries_size:
    dw $0200 

CeresEscapeTimerBG12TransferEntries_src:
    dl Tiles_EscapeTimerText_0 

CeresEscapeTimerBG12TransferEntries_VRAM:
    dw $1820,$0200 
    dl Tiles_EscapeTimerText_1 
    dw $1920,$0200 
    dl Tiles_EscapeTimerText_2 
    dw $1A20,$0200 
    dl Tiles_EscapeTimerText_3 
    dw $1B20,$0100 
    dl Tiles_EscapeTimerText_4 
    dw $1C20,$0200 
    dl Tiles_CeresDoor_0 
    dw $0D00,$0200 
    dl Tiles_CeresDoor_1 
    dw $0E00,$0200 
    dl Tiles_CeresDoor_2 
    dw $0F00,$0000 

Function_Ridley_MoveToDeathSpot:
    JSR.W MoveRidleyToDeathSpot 
    BCC Function_Ridley_FinalRoar 
    RTS 


Function_Ridley_FinalRoar:
    LDA.W #InstList_Ridley_FacingLeft_DeathRoar 
    JSR.W SetRidleyInstList 
    LDA.W #Function_Ridley_MoveToDeathSpot_Wait_LowerAcid : STA.W $0FA8 
    LDA.W #$0020 : STA.W $0FB2 

Function_Ridley_FinalRoar_return:
    RTS 


Function_Ridley_MoveToDeathSpot_Wait_LowerAcid:
    JSR.W MoveRidleyToDeathSpot 
    DEC.W $0FB2 
    BPL Function_Ridley_FinalRoar_return 
    STZ.W $0FAA 
    STZ.W $0FAC 
    LDA.W #$0210 : STA.W $197A 
    LDA.W #$0040 : STA.W $197C 
    LDA.W #$0001 : STA.W $1980 
    LDA.W #$0000 : STA.L $7E800E 
    STA.L $7E8010 
    LDA.W #Function_Ridley_DeathExplosions_DropSamusIfNeeded : STA.W $0FA8 
    LDA.W #$00A0 : STA.W $0FB2 ; fallthrough to Function_Ridley_DeathExplosions_DropSamusIfNeeded

Function_Ridley_DeathExplosions_DropSamusIfNeeded:
    JSR.W SpawnRidleyExplosions 
    DEC.W $0FB2 
    BPL Function_Ridley_FinalRoar_return 
    LDA.L $7E7836 
    BEQ .notHoldingSamus 
    JSR.W ReleaseSamus 

.notHoldingSamus:
    LDA.W #Function_Ridley_DisableRidley : STA.W $0FA8 
    STZ.W $0FAA 
    STZ.W $0FAC 
    JMP.W SpawnRidleyExplosionEnemies 


Function_Ridley_DisableRidley:
    JSR.W SpawnRidleyExplosions 
    LDA.W #$0000 : STA.L $7E7804 
    LDA.W $0F86 
    ORA.W #$0100 
    STA.W $0F86 
    LDA.W #Function_Ridley_Wait20Frames : STA.W $0FA8 
    LDA.W #$0020 : STA.W $0FB2 
    RTS 


Function_Ridley_Wait20Frames:
    DEC.W $0FB2 
    BPL Function_Ridley_FinalRoar_return 
    LDA.W #Function_Ridley_Wait100f_SpawnDrops_ChangeMusic_MarkBossDead : STA.W $0FA8 
    LDA.W #$0100 : STA.W $0FB2 
    RTS 


Function_Ridley_Wait100f_SpawnDrops_ChangeMusic_MarkBossDead:
    DEC.W $0FB2 
    BPL .return 
    LDA.W #$0001 
    JSL.L SetBossBitsInAForCurrentArea 
    JSL.L RidleyDeathItemDropRoutine 
    LDA.W #$0003 
    JSL.L QueueMusicDataOrTrack_8FrameDelay 
    LDA.W $0F86 
    ORA.W #$0200 
    STA.W $0F86 
    LDA.W #.return : STA.W $0FA8 

.return:
    RTS 


MoveRidleyToDeathSpot:
    LDX.W #$0080 
    STX.B $12 
    LDY.W #$0148 
    STY.B $14 
    LDX.W #$0000 
    LDY.W #$0000 
    LDA.W #$0010 
    JSR.W AccelerateRidleyTowardDesiredXYPosition 
    LDA.W #$0004 : STA.B $16 
    STA.B $18 
    JSL.L CheckForEnemyCollisionWithRectangle 
    RTS 


SpawnRidleyExplosions:
    LDA.L $7E800E 
    DEC A 
    BMI .timerExpired 
    STA.L $7E800E 
    RTS 


.timerExpired:
    LDA.W #$0004 : STA.L $7E800E 
    LDA.L $7E8010 
    INC A 
    CMP.W #$000A 
    BMI .notA 
    LDA.W #$0000 

.notA:
    STA.L $7E8010 
    ASL #2
    TAY 
    LDA.W .XPosition,Y 
    CLC 
    ADC.W $0F7A 
    STA.B $12 
    LDA.W .YPosition,Y 
    CLC 
    ADC.W $0F7E 
    STA.B $14 
    LDA.W #$0003 
    LDY.W #EnemyProjectile_MiscDust 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    LDA.W #$0024 
    JSL.L QueueSound_Lib2_Max3 
    RTS 


.XPosition:
    dw $FFE8 

.YPosition:
    dw $FFE8,$FFEC,$0014,$0010,$FFE2,$001E,$FFFD,$000E 
    dw $FFF3,$FFFE,$0012,$FFFE,$FFE0,$FFE1,$0008,$FFFC 
    dw $FFF6,$0013,$0013 

InitAI_RidleyExplosion:
    LDX.W $0E54 
    LDA.W #$0001 : STA.W $0F94,X 
    STZ.W $0F90,X 
    STZ.W $0F98,X 
    LDA.W #$0E00 : STA.W $0F96,X 
    LDY.W $0FB4,X 
    LDA.W .lifetimes,Y : STA.W $0FB2,X 
    JSL.L GenerateRandomNumber 
    AND.W #$0130 
    BIT.W $05E5 
    BPL + 
    EOR.W #$FFFF 
    INC A 

  + STA.W $0FAA,X 
    STZ.W $0FAC,X 
    TYX 
    JMP.W (.initPointers,X) 


.lifetimes:
    dw $0048,$0050,$0058,$0060,$0068,$0070,$0078,$0028 
    dw $0030,$0038,$0080,$0040 

.initPointers:
    dw RidleyExplosionInitialization_0 
    dw RidleyExplosionInitialization_2 
    dw RidleyExplosionInitialization_4 
    dw RidleyExplosionInitialization_6 
    dw RidleyExplosionInitialization_8 
    dw RidleyExplosionInitialization_A 
    dw RidleyExplosionInitialization_C 
    dw RidleyExplosionInitialization_E 
    dw RidleyExplosionInitialization_10 
    dw RidleyExplosionInitialization_12 
    dw RidleyExplosionInitialization_14 
    dw RidleyExplosionInitialization_16 

RidleyExplosionInitialization_0:
    LDX.W $0E54 
    LDA.L $7E202C : STA.W $0F7A,X 
    LDA.L $7E202E : STA.W $0F7E,X 
    LDA.W #InstList_RidleyTail_Large : STA.W $0F92,X 
    RTL 


RidleyExplosionInitialization_2:
    LDX.W $0E54 
    LDA.L $7E2040 : STA.W $0F7A,X 
    LDA.L $7E2042 : STA.W $0F7E,X 
    LDA.W #InstList_RidleyTail_Large : STA.W $0F92,X 
    RTL 


RidleyExplosionInitialization_4:
    LDX.W $0E54 
    LDA.L $7E2054 : STA.W $0F7A,X 
    LDA.L $7E2056 : STA.W $0F7E,X 
    LDA.W #InstList_RidleyTail_Medium : STA.W $0F92,X 
    RTL 


RidleyExplosionInitialization_6:
    LDX.W $0E54 
    LDA.L $7E2068 : STA.W $0F7A,X 
    LDA.L $7E206A : STA.W $0F7E,X 
    LDA.W #InstList_RidleyTail_Medium : STA.W $0F92,X 
    RTL 


RidleyExplosionInitialization_8:
    LDX.W $0E54 
    LDA.L $7E207C : STA.W $0F7A,X 
    LDA.L $7E207E : STA.W $0F7E,X 
    LDA.W #InstList_RidleyTail_Small : STA.W $0F92,X 
    RTL 


RidleyExplosionInitialization_A:
    LDX.W $0E54 
    LDA.L $7E2090 : STA.W $0F7A,X 
    LDA.L $7E2092 : STA.W $0F7E,X 
    LDA.W #InstList_RidleyTail_Small : STA.W $0F92,X 
    RTL 


RidleyExplosionInitialization_C:
    LDX.W $0E54 
    LDA.L $7E20A4 : STA.W $0F7A,X 
    LDA.L $7E20A6 : STA.W $0F7E,X 
    LDA.L $7E20A2 
    CLC 
    ADC.L $7E208E 
    CLC 
    ADC.W #$0008 
    AND.W #$00F0 
    LSR #3
    TAY 
    LDA.W .instListPointers,Y : STA.W $0F92,X 
    RTL 


.instListPointers:
    dw InstList_RidleyTailTip_PointingDown 
    dw InstList_RidleyTailTip_PointingDownDownRight 
    dw InstList_RidleyTailTip_PointingDownRight 
    dw InstList_RidleyTailTip_PointingRightDownRight 
    dw InstList_RidleyTailTip_PointingRight 
    dw InstList_RidleyTailTip_PointingRightUpRight 
    dw InstList_RidleyTailTip_PointingUpRight 
    dw InstList_RidleyTailTip_PointingUpUpRight 
    dw InstList_RidleyTailTip_PointingUp 
    dw InstList_RidleyTailTip_PointingUpUpLeft 
    dw InstList_RidleyTailTip_PointingUpLeft 
    dw InstList_RidleyTailTip_PointingLeftUpLeft 
    dw InstList_RidleyTailTip_PointingLeft 
    dw InstList_RidleyTailTip_PointingLeftDownLeft 
    dw InstList_RidleyTailTip_PointingDownLeft 
    dw InstList_RidleyTailTip_PointingDownDownLeft 

RidleyExplosionInitialization_E:
    LDY.W #$0000 
    LDA.L $7E7820 
    BEQ .right 
    LDY.W #$0002 

.right:
    LDX.W $0E54 
    LDA.W .XOffsetFromRidleyXPosition,Y 
    CLC 
    ADC.W $0F7A 
    STA.W $0F7A,X 
    LDA.W #$0000 
    CLC 
    ADC.W $0F7E 
    STA.W $0F7E,X 
    LDA.W .instListPointer,Y : STA.W $0F92,X 
    RTL 


.XOffsetFromRidleyXPosition:
    dw $0000,$0000 

.instListPointer:
    dw InstList_RidleyWings_FullyRaised_FacingLeft 
    dw InstList_RidleyWings_FullyRaised_FacingRight 

RidleyExplosionInitialization_10:
    LDY.W #$0000 
    LDA.L $7E7820 
    BEQ .right 
    LDY.W #$0002 

.right:
    LDX.W $0E54 
    LDA.W .XOffsetFromRidleyXPosition,Y 
    CLC 
    ADC.W $0F7A 
    STA.W $0F7A,X 
    LDA.W #$0016 
    CLC 
    ADC.W $0F7E 
    STA.W $0F7E,X 
    LDA.W .instListPointer,Y : STA.W $0F92,X 
    RTL 


.XOffsetFromRidleyXPosition:
    dw $000F,$FFF1 

.instListPointer:
    dw InstList_RidleyLegs_PulledUp_FacingLeft 
    dw InstList_RidleyLegs_PulledUp_FacingRight 

RidleyExplosionInitialization_12:
    LDY.W #$0000 
    LDA.L $7E7820 
    BEQ .right 
    LDY.W #$0002 

.right:
    LDX.W $0E54 
    LDA.W .XOffsetFromRidleyXPosition,Y 
    CLC 
    ADC.W $0F7A 
    STA.W $0F7A,X 
    LDA.W #$FFE8 
    CLC 
    ADC.W $0F7E 
    STA.W $0F7E,X 
    LDA.W .instListPointer,Y : STA.W $0F92,X 
    RTL 


.XOffsetFromRidleyXPosition:
    dw $FFFD,$0003 

.instListPointer:
    dw InstList_RidleyHead_MouthOpen_FacingLeft 
    dw InstList_RidleyHead_MouthOpen_FacingRight 

RidleyExplosionInitialization_14:
    LDY.W #$0000 
    LDA.L $7E7820 
    BEQ .right 
    LDY.W #$0002 

.right:
    LDX.W $0E54 
    LDA.W .XOffsetFromRidleyXPosition,Y 
    CLC 
    ADC.W $0F7A 
    STA.W $0F7A,X 
    LDA.W #$0000 
    CLC 
    ADC.W $0F7E 
    STA.W $0F7E,X 
    LDA.W .instListPointer,Y : STA.W $0F92,X 
    RTL 


.XOffsetFromRidleyXPosition:
    dw $0010,$FFF0 

.instListPointer:
    dw InstList_RidleyTorso_FacingLeft 
    dw InstList_RidleyTorso_FacingRight 

RidleyExplosionInitialization_16:
    LDY.W #$0000 
    LDA.L $7E7820 
    BEQ .right 
    LDY.W #$0002 

.right:
    LDX.W $0E54 
    LDA.W .XOffsetFromRidleyXPosition,Y 
    CLC 
    ADC.W $0F7A 
    STA.W $0F7A,X 
    LDA.W #$0007 
    CLC 
    ADC.W $0F7E 
    STA.W $0F7E,X 
    LDA.W .instListPointer,Y : STA.W $0F92,X 
    RTL 


.XOffsetFromRidleyXPosition:
    dw $0008,$FFF8 

.instListPointer:
    dw InstList_RidleyClaw_FacingLeft 
    dw InstList_RidleyClaw_FacingRight 

MainAI_RidleyExplosion:
    LDX.W $0E54 
    JSR.W HandleFlickering 
    LDA.W $0FAA,X 
    BPL + 
    EOR.W #$FFFF 
    INC A 

  + CLC 
    ADC.W #$FFFC 
    BPL + 
    LDA.W #$0000 

  + BIT.W $0FAA,X 
    BPL + 
    EOR.W #$FFFF 
    INC A 

  + STA.W $0FAA,X 
    LDA.W $0FAC,X 
    CLC 
    ADC.W #$0004 
    STA.W $0FAC,X 
    JSL.L MoveEnemyAccordingToVelocity 
    DEC.W $0FB2,X 
    BPL .return 
    LDA.W #$0000 
    JML.L EnemyDeath 


.return:
    RTL 


HandleFlickering:
    LDA.W $0FA4,X 
    AND.W #$0001 
    STA.W $0FA4,X 
    BEQ .visible 
    LDA.W $0F86,X 
    ORA.W #$0100 
    STA.W $0F86,X 
    RTS 


.visible:
    LDA.W $0F86,X 
    AND.W #$FEFF 
    STA.W $0F86,X 
    RTS 


SpawnRidleyExplosionEnemies:
    LDX.W #RidleyExplosionEntry_6 
    JSL.L SpawnEnemy 
    LDX.W #RidleyExplosionEntry_5 
    JSL.L SpawnEnemy 
    LDX.W #RidleyExplosionEntry_4 
    JSL.L SpawnEnemy 
    LDX.W #RidleyExplosionEntry_3 
    JSL.L SpawnEnemy 
    LDX.W #RidleyExplosionEntry_2 
    JSL.L SpawnEnemy 
    LDX.W #RidleyExplosionEntry_1 
    JSL.L SpawnEnemy 
    LDX.W #RidleyExplosionEntry_0 
    JSL.L SpawnEnemy 
    LDX.W #RidleyExplosionEntry_7 
    JSL.L SpawnEnemy 
    LDX.W #RidleyExplosionEntry_8 
    JSL.L SpawnEnemy 
    LDX.W #RidleyExplosionEntry_A 
    JSL.L SpawnEnemy 
    LDX.W #RidleyExplosionEntry_9 
    JSL.L SpawnEnemy 
    LDX.W #RidleyExplosionEntry_B 
    JSL.L SpawnEnemy 
    RTS 


RidleyExplosionEntry_0:
    dw Palette_RidleyExplosion_1 
    dw $0000,$0000,$0000,$2C00,$0000,$0000,$0000 

RidleyExplosionEntry_1:
    dw Palette_RidleyExplosion_1 
    dw $0000,$0000,$0000,$2C00,$0000,$0002,$0000 

RidleyExplosionEntry_2:
    dw Palette_RidleyExplosion_1 
    dw $0000,$0000,$0000,$2C00,$0000,$0004,$0000 

RidleyExplosionEntry_3:
    dw Palette_RidleyExplosion_1 
    dw $0000,$0000,$0000,$2C00,$0000,$0006,$0000 

RidleyExplosionEntry_4:
    dw Palette_RidleyExplosion_1 
    dw $0000,$0000,$0000,$2C00,$0000,$0008,$0000 

RidleyExplosionEntry_5:
    dw Palette_RidleyExplosion_1 
    dw $0000,$0000,$0000,$2C00,$0000,$000A,$0000 

RidleyExplosionEntry_6:
    dw Palette_RidleyExplosion_1 
    dw $0000,$0000,$0000,$2C00,$0000,$000C,$0000 

RidleyExplosionEntry_7:
    dw Palette_RidleyExplosion_1 
    dw $0000,$0000,$0000,$2C00,$0000,$000E,$0000 

RidleyExplosionEntry_8:
    dw Palette_RidleyExplosion_1 
    dw $0000,$0000,$0000,$2C00,$0000,$0010,$0000 

RidleyExplosionEntry_9:
    dw Palette_RidleyExplosion_1 
    dw $0000,$0000,$0000,$2C00,$0000,$0012,$0000 

RidleyExplosionEntry_A:
    dw Palette_RidleyExplosion_1 
    dw $0000,$0000,$0000,$2C00,$0000,$0014,$0000 

RidleyExplosionEntry_B:
    dw Palette_RidleyExplosion_1 
    dw $0000,$0000,$0000,$2C00,$0000,$0016,$0000 

InstList_RidleyTail_Large:
    dw $0001 
    dw Spritemap_RidleyTail_Large 
    dw Instruction_Common_Sleep 

InstList_RidleyTail_Medium:
    dw $0001 
    dw Spritemap_RidleyTail_Medium 
    dw Instruction_Common_Sleep 

InstList_RidleyTail_Small:
    dw $0001 
    dw Spritemap_RidleyTail_Small 
    dw Instruction_Common_Sleep 

InstList_RidleyWings_FullyRaised_FacingLeft:
    dw $0001 
    dw Spritemap_RidleyWings_FacingLeft_FullyRaised 
    dw Instruction_CommonA6_Sleep 

InstList_RidleyWings_FullyRaised_FacingRight:
    dw $0001 
    dw Spritemap_RidleyWings_FacingRight_FullyRaised 
    dw Instruction_Common_Sleep 

InstList_RidleyLegs_PulledUp_FacingLeft:
    dw $0001 
    dw Spritemap_Ridley_FacingLeft_Legs_PulledUp 
    dw Instruction_CommonA6_Sleep 

InstList_RidleyLegs_PulledUp_FacingRight:
    dw $0001 
    dw Spritemap_Ridley_FacingRight_Legs_PulledUp 
    dw Instruction_CommonA6_Sleep 

InstList_RidleyHead_MouthOpen_FacingLeft:
    dw $0001 
    dw Spritemap_Ridley_FacingLeft_HeadNeck_MouthOpen 
    dw Instruction_Common_Sleep 

InstList_RidleyHead_MouthOpen_FacingRight:
    dw $0001 
    dw Spritemap_Ridley_FacingRight_HeadNeck_MouthOpen 
    dw Instruction_Common_Sleep 

InstList_RidleyTorso_FacingLeft:
    dw $0001 
    dw Spritemap_Ridley_FacingLeft_Torso 
    dw Instruction_CommonA6_Sleep 

InstList_RidleyTorso_FacingRight:
    dw $0001 
    dw Spritemap_Ridley_FacingRight_Torso 
    dw Instruction_CommonA6_Sleep 

InstList_RidleyClaw_FacingLeft:
    dw $0001 
    dw Spritemap_Ridley_FacingLeft_Claws 
    dw Instruction_CommonA6_Sleep 

InstList_RidleyClaw_FacingRight:
    dw $0001 
    dw Spritemap_Ridley_FacingRight_Claws 
    dw Instruction_CommonA6_Sleep 

InstList_RidleyTailTip_PointingDown:
    dw $0001 
    dw Spritemap_RidleyTailTip_PointingDown 
    dw Instruction_CommonA6_Sleep 

InstList_RidleyTailTip_PointingDownDownRight:
    dw $0001 
    dw Spritemap_RidleyTailTip_PointingDownDownRight 
    dw Instruction_Common_Sleep 

InstList_RidleyTailTip_PointingDownRight:
    dw $0001 
    dw Spritemap_RidleyTailTip_PointingDownRight 
    dw Instruction_CommonA6_Sleep 

InstList_RidleyTailTip_PointingRightDownRight:
    dw $0001 
    dw Spritemap_RidleyTailTip_PointingRightDownRight 
    dw Instruction_CommonA6_Sleep 

InstList_RidleyTailTip_PointingRight:
    dw $0001 
    dw Spritemap_RidleyTailTip_PointingRight 
    dw Instruction_Common_Sleep 

InstList_RidleyTailTip_PointingRightUpRight:
    dw $0001 
    dw Spritemap_RidleyTailTip_PointingRightUpRight 
    dw Instruction_CommonA6_Sleep 

InstList_RidleyTailTip_PointingUpRight:
    dw $0001 
    dw Spritemap_RidleyTailTip_PointingUpRight 
    dw Instruction_CommonA6_Sleep 

InstList_RidleyTailTip_PointingUpUpRight:
    dw $0001 
    dw Spritemap_RidleyTailTip_PointingUpUpRight 
    dw Instruction_CommonA6_Sleep 

InstList_RidleyTailTip_PointingUp:
    dw $0001 
    dw Spritemap_RidleyTailTip_PointingUp 
    dw Instruction_CommonA6_Sleep 

InstList_RidleyTailTip_PointingUpUpLeft:
    dw $0001 
    dw Spritemap_RidleyTailTip_PointingUpUpLeft 
    dw Instruction_CommonA6_Sleep 

InstList_RidleyTailTip_PointingUpLeft:
    dw $0001 
    dw Spritemap_RidleyTailTip_PointingUpLeft 
    dw Instruction_CommonA6_Sleep 

InstList_RidleyTailTip_PointingLeftUpLeft:
    dw $0001 
    dw Spritemap_RidleyTailTip_PointingLeftUpLeft 
    dw Instruction_Common_Sleep 

InstList_RidleyTailTip_PointingLeft:
    dw $0001 
    dw Spritemap_RidleyTailTip_PointingLeft 
    dw Instruction_Common_Sleep 

InstList_RidleyTailTip_PointingLeftDownLeft:
    dw $0001 
    dw Spritemap_RidleyTailTip_PointingLeftDownLeft 
    dw Instruction_Common_Sleep 

InstList_RidleyTailTip_PointingDownLeft:
    dw $0001 
    dw Spritemap_RidleyTailTip_PointingDownLeft 
    dw Instruction_CommonA6_Sleep 

InstList_RidleyTailTip_PointingDownDownLeft:
    dw $0001 
    dw Spritemap_RidleyTailTip_PointingDownDownLeft 
    dw Instruction_CommonA6_Sleep 

HandleRidleyTailAI:
    JSR.W PlaySwishingSFXIfTailIsMovingFast 
    LDA.L $7E2000 
    ASL A 
    TAX 
    JSR.W (.pointers,X) 
    PHB 
    PEA.W $7E7E 
    PLB 
    PLB 
    JSR.W UpdateRidleyTailPositions 
    JSR.W RidleyTailExtending 
    PLB 
    LDA.W $0F86 
    AND.W #$0400 
    ORA.W $18A8 
    ORA.L $7E7836 
    BNE .return 
    JMP.W RidleyTail_vs_Samus_Interaction 


.return:
    RTS 


.pointers:
    dw .return 
    dw Function_RidleyTail_FlingingAtSamus 
    dw Function_RidleyTail_StartTailbouncing 
    dw Function_RidleyTail_StillStartingTailbouncing 
    dw Function_RidleyTail_DuringTailbouncing 
    dw Function_RidleyTail_StartExtendingDuringTailbouncing 
    dw Function_RidleyTail_ContinueExtendingDuringTailbouncing 
    dw Function_RidleyTail_StrictTailbouncingExtending 
    dw Function_RidleyTail_TailSpin 

Function_RidleyTail_StartTailbouncing:
    LDA.W #$0008 : STA.L $7E2014 
    JSR.W Function_RidleyTail_2_3_6_7_Common 
    LDA.W #$0003 : STA.L $7E2000 
    RTS 


Function_RidleyTail_StillStartingTailbouncing:
    LDA.W #$0008 : STA.L $7E2014 
    BRA Function_RidleyTail_2_3_6_7_Common 


Function_RidleyTail_ContinueExtendingDuringTailbouncing:
    LDA.W #$0003 : STA.L $7E2014 
    JSR.W Function_RidleyTail_2_3_6_7_Common 
    LDA.W #$0006 : STA.L $7E2000 
    RTS 


Function_RidleyTail_StrictTailbouncingExtending:
    LDA.W #$0002 : STA.L $7E2014 
    JSR.W Function_RidleyTail_2_3_6_7_Common 
    LDA.W #$0007 : STA.L $7E2000 
    RTS 


Function_RidleyTail_2_3_6_7_Common:
    LDA.L $7E7820 
    BNE .notFacingLeft 
    LDA.W #$4000 : STA.L $7E201C 
    LDA.W #$FFFF : STA.L $7E201A 
    BRA + 


.notFacingLeft:
    LDA.W #$4000 : STA.L $7E201A 
    LDA.W #$FFFF : STA.L $7E201C 

  + JSR.W Function_RidleyTail_DuringTailbouncing 
    LDA.L $7E2020 
    ORA.L $7E2034 
    ORA.L $7E2048 
    ORA.L $7E205C 
    ORA.L $7E2070 
    ORA.L $7E2084 
    ORA.L $7E2098 
    BEQ .duringTailbouncing 
    RTS 


.duringTailbouncing:
    LDA.W #$0004 : STA.L $7E2000 
    RTS 


Function_RidleyTail_FlingingAtSamus:
    LDA.W #RidleyTailAI_FlingTailAtSamus : STA.B $12 
    BRA ExecuteRidleyTailAI 


Function_RidleyTail_DuringTailbouncing:
    LDA.W #Function_Ridley_Tailbouncing : STA.B $12 
    BRA ExecuteRidleyTailAI 


Function_RidleyTail_StartExtendingDuringTailbouncing:
    LDA.W #ExtendTailForTailbouncing : STA.B $12 
    BRA ExecuteRidleyTailAI 


Function_RidleyTail_TailSpin:
    LDA.W #SwingRidleyTailInCircles : STA.B $12 
    BRA ExecuteRidleyTailAI ; >.<


ExecuteRidleyTailAI:
    PHB 
    PEA.W $7E7E 
    PLB 
    PLB 
    PEA.W .manualReturn-1 
    JMP.W ($0012) 


.manualReturn:
    LDA.W #$0007 
    LDX.W #$0000 

.loop:
    PHA 
    JSR.W SetRidleyTailAngles 
    TXA 
    CLC 
    ADC.W #$0014 
    TAX 
    PLA 
    DEC A 
    BNE .loop 
    PLB 
    RTS 


SetMinMaxTailAnglesBasedOnDirection:
    LDA.W $7820 
    ASL A 
    TAX 
    LDA.L .minAngle,X : STA.W $2016 
    LDA.L .maxAngle,X : STA.W $2018 
    RTS 


.minAngle:
    dw $3FF0,$3FF0,$3FC0 

.maxAngle:
    dw $4040,$4040,$4010 

CheckIfAllTailPartsAreRotating:
    LDA.W $2020 
    AND.W $2034 
    AND.W $2048 
    AND.W $205C 
    AND.W $2070 
    AND.W $2084 
    AND.W $2098 
    BEQ .returnNotAllRotating 
    SEC 
    RTS 


.returnNotAllRotating:
    CLC 
    RTS 


RidleyTailAI_FlingTailAtSamus:
    JSR.W SetMinMaxTailAnglesBasedOnDirection 
    JSR.W CheckIfAllTailPartsAreRotating 
    BCC .notAllPartsRotating 
    JSR.W HandleRidleyTailFlingTrigger 

.notAllPartsRotating:
    LDA.W $2020 
    ORA.W $2034 
    ORA.W $2048 
    ORA.W $205C 
    ORA.W $2070 
    ORA.W $2084 
    ORA.W $2098 
    BEQ .noPartsMoving 
    RTS 


.noPartsMoving:
    LDA.W #$8000 : STA.W $2020 
    LDA.W #$FFFF : STA.W $201A 
    STA.W $201C 
    LDA.W #$0002 
    LDY.W $0AF6 
    CPY.W #$0070 
    BCS .SamusNotLeftSide 
    LDA.W #$0001 

.SamusNotLeftSide:
    STA.W $2014 
    RTS 


HandleRidleyTailFlingTrigger:
    LDA.W $2004 
    BEQ .notFlingingTail 
    LDA.W $201C 
    AND.W $201A 
    BMI .notRotating 

.notFlingingTail:
    LDA.W $2002 
    BEQ .done 
    LDA.W $05E5 
    AND.W #$00FF 
    CMP.W #$00F0 
    BCS .notRotating 
    LDA.W $0AF6 
    SEC 
    SBC.W $0F7A 
    BPL .rightOfRidley 
    EOR.W #$FFFF 
    INC A 

.rightOfRidley:
    CMP.W #$0080 
    BCS .done 
    LDA.W #$0000 
    BRA + 


.notRotating:
    LDA.W $2004 
    DEC A 

  + JSR.W TargetAnAngleTowardMissileOrSamus 
    PLA 

.done:
    STZ.W $2004 
    RTS 


SwingRidleyTailInCircles:
    JSR.W SetMinMaxTailAnglesBasedOnDirection 
    JSR.W CheckIfAllTailPartsAreRotating 
    BCC .notAllPartsRotating 
    JSR.W HandleTailFlingWhileSwingingInCircles 

.notAllPartsRotating:
    LDA.L $7E2020 
    ORA.L $7E2034 
    ORA.L $7E2048 
    ORA.L $7E205C 
    ORA.L $7E2070 
    ORA.L $7E2084 
    ORA.L $7E2098 
    BEQ .noTailPartsMoving 
    RTS 


.noTailPartsMoving:
    LDA.W #$8000 : STA.L $7E2020 
    LDA.W #$FFFF : STA.L $7E201A 
    STA.L $7E201C 
    LDA.W #$0002 
    LDY.W $0AF6 
    CPY.W #$0070 
    BCS + 
    LDA.W #$0001 

  + STA.L $7E2014 
    RTS 


HandleTailFlingWhileSwingingInCircles:
    LDA.W $2004 
    BEQ .return 
    LDA.W $201C 
    AND.W $201A 
    BPL .return 
    LDA.W #$0001 
    JSR.W TargetAnAngleTowardMissileOrSamus 
    PLA 
    STZ.W $2004 

.return:
    RTS 


Function_Ridley_Tailbouncing:
    JSR.W SetMinMaxTailAnglesBasedOnDirection 
    JSR.W CheckIfAllTailPartsAreRotating 
    BCC .checkMoving 
    LDA.W $05E5 
    AND.W #$00FF 
    CMP.W #$00F0 
    BCS .randomlySkipDistanceCheck 
    LDA.W $0AF6 
    SEC 
    SBC.L $000F7A 
    BPL .SamusOnRight 
    EOR.W #$FFFF 
    INC A 

.SamusOnRight:
    CMP.W #$0080 
    BCS .checkMoving 

.randomlySkipDistanceCheck:
    LDA.W $201C 
    AND.W $201A 
    BPL .checkMoving 
    LDA.W #$3F00 : STA.W $201A 
    LDA.W #$0008 : STA.W $2014 
    RTS 


.checkMoving:
    LDA.W $2020 
    ORA.W $2034 
    ORA.W $2048 
    ORA.W $205C 
    ORA.W $2070 
    ORA.W $2084 
    ORA.W $2098 
    BEQ .tailPartsMoving 
    RTS 


.tailPartsMoving:
    BIT.W $0FAC 
    BMI .movingUp 
    LDA.W #$0005 : STA.W $2000 

.movingUp:
    LDA.W #$FFFF : STA.W $201A 
    STA.W $201C 
    LDA.W $2010 
    BNE .decrementTimer 

.done:
    STA.W $2014 
    RTS 


.decrementTimer:
    DEC A 
    STA.W $2010 
    BNE .done 
    LDA.W #$8000 : STA.W $2020 
    JSR.W SetRidleyTailAnglesTo40XX 
    LDA.W #$0008 : STA.W $2014 
    RTS 


ExtendTailForTailbouncing:
    JSR.W SetMinMaxTailAnglesBasedOnDirection 
    JSR.W CheckIfAllTailPartsAreRotating 
    BCC .checkTailPartsMoving 
    LDA.W $05E5 
    AND.W #$00FF 
    CMP.W #$00F0 
    BCS .randomlySkipDistanceCheck 
    LDA.W $0AF6 
    SEC 
    SBC.L $000F7A 
    BPL .SamusOnRight 
    EOR.W #$FFFF 
    INC A 

.SamusOnRight:
    CMP.W #$0080 
    BCS .checkTailPartsMoving 

.randomlySkipDistanceCheck:
    LDA.W $201C 
    AND.W $201A 
    BPL .checkTailPartsMoving 
    LDA.W #$3F00 : STA.W $201A 
    LDA.W #$0008 : STA.W $2014 
    RTS 


.checkTailPartsMoving:
    LDA.W $2020 
    ORA.W $2034 
    ORA.W $2048 
    ORA.W $205C 
    ORA.W $2070 
    ORA.W $2084 
    ORA.W $2098 
    BEQ .tailPartMoving 
    RTS 


.tailPartMoving:
    BIT.W $0FAC 
    BMI .RidleyMovingUp 
    LDA.W #$0006 : STA.W $2000 
    LDA.W #$0A00 : STA.W $2028 
    STA.W $203C 
    STA.W $2050 
    STA.W $2064 
    STA.W $2078 
    STA.W $208C 
    STA.W $20A0 
    LDA.W #$4000 : STA.W $202A 
    STA.W $203E 
    STA.W $2052 
    STA.W $2066 
    STA.W $207A 
    STA.W $208E 
    STA.W $20A2 
    LDA.W #$8000 : STA.W $2020 

.RidleyMovingUp:
    LDA.W #$FFFF : STA.W $201A 
    STA.W $201C 
    LDA.W $2010 
    BNE .decrementTimer 
    JMP.W .done 


.decrementTimer:
    DEC A 
    STA.W $2010 
    BNE .done 
    LDA.W #$8000 : STA.W $2020 
    JSR.W SetRidleyTailAnglesTo40XX 
    LDA.W #$0008 

.done:
    STA.W $2014 
    RTS 


SetRidleyTailAnglesTo40XX:
    LDA.W $202A 
    AND.W #$00FF 
    ORA.W #$4000 
    STA.W $202A 
    LDA.W $203E 
    AND.W #$00FF 
    ORA.W #$4000 
    STA.W $203E 
    LDA.W $2052 
    AND.W #$00FF 
    ORA.W #$4000 
    STA.W $2052 
    LDA.W $2066 
    AND.W #$00FF 
    ORA.W #$4000 
    STA.W $2066 
    LDA.W $202A 
    AND.W #$04FF 
    ORA.W #$4000 
    STA.W $207A 
    LDA.W $208E 
    AND.W #$00FF 
    ORA.W #$4000 
    STA.W $208E 
    LDA.W $20A2 
    AND.W #$00FF 
    ORA.W #$4000 
    STA.W $20A2 
    RTS 


UpdateRidleyTailPositions:
    LDA.W $0F7E 
    CLC 
    ADC.W $2032 
    CLC 
    ADC.W #$0010 
    STA.W $202E 
    CLC 
    ADC.W $2046 
    STA.W $2042 
    CLC 
    ADC.W $205A 
    STA.W $2056 
    CLC 
    ADC.W $206E 
    STA.W $206A 
    CLC 
    ADC.W $2082 
    STA.W $207E 
    CLC 
    ADC.W $2096 
    STA.W $2092 
    CLC 
    ADC.W $20AA 
    STA.W $20A6 
    LDA.W $7820 
    DEC A 
    BEQ .facingForward 
    INC A 
    ASL A 
    TAX 
    LDA.L .XPositionOffsets,X 
    ADC.W $2030 

.facingForward:
    CLC 
    ADC.W $0F7A 
    STA.W $202C 
    LDA.W $7820 
    DEC A 
    BNE .notFacingForward 
    LDA.W $0F7A : STA.W $2040 
    STA.W $2054 
    STA.W $2068 
    STA.W $207C 
    STA.W $2090 
    STA.W $20A4 
    BRA .return 


.notFacingForward:
    LDA.W $202C 
    CLC 
    ADC.W $2044 
    STA.W $2040 
    CLC 
    ADC.W $2058 
    STA.W $2054 
    CLC 
    ADC.W $206C 
    STA.W $2068 
    CLC 
    ADC.W $2080 
    STA.W $207C 
    CLC 
    ADC.W $2094 
    STA.W $2090 
    CLC 
    ADC.W $20A8 
    STA.W $20A4 

.return:
    RTS 


.XPositionOffsets:
    dw $0020,$0000,$FFE0 

RidleyTailExtending:
    LDA.W $203C 
    BEQ .reachedTargetDistanceFromPreviousTailPart 
    CMP.W $203A 
    BPL + 
    LDA.W #$0000 : STA.W $203C 

  + LDA.W $203A 
    CLC 
    ADC.W $2012 
    CMP.W #$1800 
    BMI + 
    LDA.W #$1800 

  + STA.W $203A 
    BRA + 


.reachedTargetDistanceFromPreviousTailPart:
    LDA.W #$0800 
    CMP.W $203A 
    BPL + 
    LDA.W $203A 
    SEC 
    SBC.W #$0080 
    STA.W $203A 

  + LDA.W $2050 
    BEQ .reachedTargetDistanceFromPreviousTailPart2 
    CMP.W $204E 
    BPL + 
    LDA.W #$0000 : STA.W $2050 

  + LDA.W $204E 
    CLC 
    ADC.W $2012 
    CMP.W #$1800 
    BMI + 
    LDA.W #$1800 

  + STA.W $204E 
    BRA + 


.reachedTargetDistanceFromPreviousTailPart2:
    LDA.W #$0800 
    CMP.W $204E 
    BPL + 
    LDA.W $204E 
    SEC 
    SBC.W #$0080 
    STA.W $204E 

  + LDA.W $2064 
    BEQ .reachedTargetDistanceFromPreviousTailPart3 
    CMP.W $2062 
    BPL + 
    LDA.W #$0000 : STA.W $2064 

  + LDA.W $2062 
    CLC 
    ADC.W $2012 
    CMP.W #$1600 
    BMI + 
    LDA.W #$1600 

  + STA.W $2062 
    BRA + 


.reachedTargetDistanceFromPreviousTailPart3:
    LDA.W #$0800 
    CMP.W $2062 
    BPL + 
    LDA.W $2062 
    SEC 
    SBC.W #$0080 
    STA.W $2062 

  + LDA.W $2078 
    BEQ .reachedTargetDistanceFromPreviousTailPart4 
    CMP.W $2076 
    BPL + 
    LDA.W #$0000 : STA.W $2078 

  + LDA.W $2076 
    CLC 
    ADC.W $2012 
    CMP.W #$1600 
    BMI + 
    LDA.W #$1600 

  + STA.W $2076 
    BRA + 


.reachedTargetDistanceFromPreviousTailPart4:
    LDA.W #$0800 
    CMP.W $2076 
    BPL + 
    LDA.W $2076 
    SEC 
    SBC.W #$0080 
    STA.W $2076 

  + LDA.W $208C 
    BEQ .reachedTargetDistanceFromPreviousTailPart5 
    CMP.W $208A 
    BPL + 
    LDA.W #$0000 : STA.W $208C 

  + LDA.W $208A 
    CLC 
    ADC.W $2012 
    CMP.W #$1200 
    BMI + 
    LDA.W #$1200 

  + STA.W $208A 
    BRA + 


.reachedTargetDistanceFromPreviousTailPart5:
    LDA.W #$0800 
    CMP.W $208A 
    BPL + 
    LDA.W $208A 
    SEC 
    SBC.W #$0080 
    STA.W $208A 

  + LDA.W $20A0 
    BEQ .reachedTargetDistanceFromPreviousTailPart6 
    CMP.W $209E 
    BPL + 
    LDA.W #$0000 : STA.W $20A0 

  + LDA.W $209E 
    CLC 
    ADC.W $2012 
    CMP.W #$0500 
    BMI + 
    LDA.W #$0500 

  + STA.W $209E 
    BRA .return 


.reachedTargetDistanceFromPreviousTailPart6:
    LDA.W #$0500 
    CMP.W $209E 
    BPL .return 
    LDA.W $209E 
    SEC 
    SBC.W #$0080 
    STA.W $209E 

.return:
    RTS 


SetRidleyTailAngles:
    LDA.W $2020,X 
    BMI .tailPartMoving 
    LDA.W $202A,X 
    JMP.W .notMoving 


.stopTailPartMovement:
    STZ.W $2020,X 
    STZ.W $2022,X 
    LDA.W $2024,X 
    EOR.W #$8000 
    STA.W $2024,X 
    RTS 


  - LDA.W $2022,X 
    CLC 
    ADC.W $2014 
    STA.W $2022,X 
    RTS 


.tailPartMoving:
    LDA.W $2022,X 
    CMP.W $201E 
    BCC - 
    CMP.W #$FFFF 
    BEQ + 
    LDA.W #$FFFF : STA.W $2022,X 
    LDA.W #$8000 : STA.W $2034,X 
    LDA.W $2024,X : STA.W $2038,X 

  + LDA.W $2024,X 
    BMI .clockwiseRotation 
    LDA.W $201C 
    BMI .noCounterClockwiseTarget 
    LDA.W #$0C00 : STA.W $2028,X 
    LDA.W $202A,X 
    CLC 
    ADC.W $2014 
    CMP.W $201C 
    BMI .storeAngle 
    TXA 
    BEQ + 
    LDA.W $200C,X 
    BNE .tailPartMoving2 

  + LDA.W $201C : STA.W $202A,X 
    JMP.W .stopTailPartMovement 


.noCounterClockwiseTarget:
    LDA.W $202A,X 
    CLC 
    ADC.W $2014 
    CMP.W $2018 
    BMI .storeAngle 

.tailPartMoving2:
    LDA.W #$8000 : STA.W $2024,X 
    LDA.W $2018 
    BRA .storeAngle 


.clockwiseRotation:
    LDA.W $201A 
    BMI .noClockwiseTarget 
    LDA.W #$0C00 : STA.W $2028,X 
    LDA.W $202A,X 
    SEC 
    SBC.W $2014 
    DEC A 
    CMP.W $201A 
    BPL .incrementAngle 
    TXA 
    BEQ + 
    LDA.W $200C,X 
    BNE .tailPartMoving3 

  + LDA.W $201A : STA.W $202A,X 
    JMP.W .stopTailPartMovement 


.noClockwiseTarget:
    LDA.W $202A,X 
    SEC 
    SBC.W $2014 
    DEC A 
    CMP.W $2016 
    BPL .incrementAngle 

.tailPartMoving3:
    LDA.W #$0000 : STA.W $2024,X 
    LDA.W $2016 
    BRA .storeAngle 


.incrementAngle:
    INC A 

.storeAngle:
    STA.W $202A,X 

.notMoving:
    AND.W #$00FF 
    STA.B $12 
    TXA 
    BEQ .firstTailPart 
    LDA.B $12 
    CLC 
    ADC.W $2016,X 
    AND.W #$00FF 
    STA.B $12 

.firstTailPart:
    LDA.W $2026,X 
    XBA 
    AND.W #$00FF 
    JSL.L GetSineMathInA_A9C460 
    STA.W $2030,X 
    LDA.W $2026,X 
    XBA 
    AND.W #$00FF 
    JSL.L GetCosineMathInA_A9C465 
    STA.W $2032,X 
    RTS 


TargetAnAngleTowardMissileOrSamus:
    AND.W #$00FF 
    XBA 
    STA.W $200A 
    LDA.W $7820 
    DEC A 
    BEQ .returnUpper 
    LDA.W $7802 
    BEQ .returnUpper 
    JSR.W TargetAMissileOrSuperMissileIfAvailable 
    BCC .noProjectiles 
    LDA.B $12 
    SBC.W $202C 
    STA.B $12 
    LDA.B $14 
    SEC 
    SBC.W $202E 
    STA.B $14 
    BRA + 


.returnUpper:
    RTS 


.noProjectiles:
    LDA.W $0AF6 
    SEC 
    SBC.W $202C 
    STA.B $12 
    LDA.W $0AFA 
    CLC 
    ADC.W #$0018 
    SEC 
    SBC.W $202E 
    STA.B $14 

  + PHB 
    PHK 
    PLB 
    JSL.L CalculateAngleOf_12_14_Offset 
    PLB 
    SEC 
    SBC.W #$0080 
    EOR.W #$FFFF 
    INC A 
    AND.W #$00FF 
    STA.B $12 
    LDA.W $7820 
    BNE .facingRight 
    LDA.B $12 
    CMP.W #$0018 
    BCC + 
    CMP.W #$00E8 
    BCS + 
    LDA.W #$00E8 

  + CLC 
    ADC.W #$3F00 
    SEC 
    SBC.W $200A 
    CMP.W $202A 
    BCS .returnMiddle 
    STA.W $201A 
    LDA.W #$0008 : STA.W $2014 

.returnMiddle:
    RTS 


.facingRight:
    LDA.B $12 
    CMP.W #$0018 
    BCC + 
    CMP.W #$00E8 
    BCS + 
    LDA.W #$0018 

  + CLC 
    ADC.W #$4000 
    CLC 
    ADC.W $200A 
    CMP.W $202A 
    BCC .returnLower 
    STA.W $201C 
    LDA.W #$0008 : STA.W $2014 

.returnLower:
    RTS 


TargetAMissileOrSuperMissileIfAvailable:
    LDA.W $20A4 : STA.B $12 
    LDA.W $20A6 : STA.B $14 
    LDA.W #$0040 : STA.B $16 
    STA.B $18 
    LDA.W $0CCE 
    BNE .checkProjectiles 
    CLC 
    RTS 


.checkProjectiles:
    LDY.W #$0000 

.loop:
    LDA.W $0C19,Y 
    AND.W #$000F 
    DEC A 
    BEQ .missileOrSuperMissile 
    DEC A 
    BNE .nextProjectile 

.missileOrSuperMissile:
    LDA.W $0B64,Y 
    SEC 
    SBC.B $12 
    BPL + 
    EOR.W #$FFFF 
    INC A 

  + SEC 
    SBC.W $0BB4,Y 
    BCC + 
    CMP.B $16 
    BCS .nextProjectile 

  + LDA.W $0B78,Y 
    SEC 
    SBC.B $14 
    BPL + 
    EOR.W #$FFFF 
    INC A 

  + SEC 
    SBC.W $0BC8,Y 
    BCC .targetProjectile 
    CMP.B $18 
    BCC .targetProjectile 

.nextProjectile:
    INY #2
    CPY.W #$000A 
    BMI .loop 
    CLC 
    RTS 


.targetProjectile:
    LDA.W $0B64,Y : STA.B $12 
    LDA.W $0B78,Y : STA.B $14 
    SEC 
    RTS 


PlaySwishingSFXIfTailIsMovingFast:
    LDA.L $7E2014 
    CMP.W #$0008 
    BMI .noSFX 
    LDA.L $7E781C 
    INC A 
    STA.L $7E781C 
    CMP.W #$0010 
    BMI .return 
    LDA.L $7E781E 
    BNE .noSFX 
    LDA.W #$0021 
    JSL.L QueueSound_Lib3_Max6 

.noSFX:
    LDA.W #$0000 : STA.L $7E781C 

.return:
    RTS 


InitializeTailParts:
    LDA.W #$0001 : STA.L $7E2014 
    LDA.W #$3FF0 : STA.L $7E2016 
    LDA.W #$4040 : STA.L $7E2018 
    LDA.W #$FFFF : STA.L $7E201A 
    STA.L $7E201C 
    LDA.W #$00F0 : STA.L $7E2012 
    LDA.W #$0010 : STA.L $7E201E 
    INC A 
    STA.L $7E2022 
    STA.L $7E2036 
    STA.L $7E204A 
    STA.L $7E205E 
    STA.L $7E2072 
    STA.L $7E2086 
    STA.L $7E209A 
    LDX.W #.rotationDirection 
    LDY.W #$2024 
    JSR.W UpdateTailPartRAMFromXToY 
    LDX.W #.distanceFromRidleyToTailParts 
    LDY.W #$2026 
    JSR.W UpdateTailPartRAMFromXToY 
    LDX.W #.angleOfTailPart 
    LDY.W #$202A 
    JSR.W UpdateTailPartRAMFromXToY 
    LDX.W #.XPositionOfTailPart 
    LDY.W #$202C 
    JSR.W UpdateTailPartRAMFromXToY 
    LDX.W #.YPositionOfTailPart 
    LDY.W #$202E 
    JSR.W UpdateTailPartRAMFromXToY 
    LDA.W #$0000 : STA.L $7E2020 
    STA.L $7E2034 
    STA.L $7E2048 
    STA.L $7E205C 
    STA.L $7E2070 
    STA.L $7E2084 
    STA.L $7E2098 
    RTS 


.rotationDirection:
    dw $8000,$8000,$8000,$8000,$8000,$8000,$8000 

.distanceFromRidleyToTailParts:
    dw $0200,$0800,$0800,$0800,$0800,$0800,$0500 

.angleOfTailPart:
    dw $4000,$4010,$4020,$4030,$4040,$4050,$4060 

.XPositionOfTailPart:
    dw $0000,$0003,$0007,$0007,$0003,$FFFD,$FFFC 

.YPositionOfTailPart:
    dw $0002,$0007,$0003,$FFFD,$FFF9,$FFF9,$FFFF 

UpdateTailPartRAMFromXToY:
    LDA.W #$007E : STA.B $14 
    STY.B $12 
    LDY.W #$0000 
    LDA.W #$0007 

.loop:
    PHA 
    LDA.W $0000,X : STA.B [$12],Y 
    INX #2
    TYA 
    CLC 
    ADC.W #$0014 
    TAY 
    PLA 
    DEC A 
    BNE .loop 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_SetAllTailPartsToNotMoving_A6D3D4:
    LDA.W #$0000 
    BRA SetAllTailPartsToMovingOrNotMoving 
endif ; !FEATURE_KEEP_UNREFERENCED


SetAllTailPartsToMoving:
    LDA.W #$8000 

SetAllTailPartsToMovingOrNotMoving:
    STA.L $7E2020 
    STA.L $7E2034 
    STA.L $7E2048 
    STA.L $7E205C 
    STA.L $7E2070 
    STA.L $7E2084 
    STA.L $7E2098 
    RTS 


Update_TailRotationDirection_Angle_DistanceFromRidley:
    PHX 
    PHY 
    LDX.W #InitializeTailParts_distanceFromRidleyToTailParts 
    LDY.W #$2026 
    JSR.W UpdateTailPartRAMFromXToY 
    LDY.W #$0007 
    LDX.W #$0000 

.loop:
    LDA.L $7E202A,X 
    EOR.W #$FFFF 
    INC A 
    CLC 
    ADC.W #$8000 
    STA.L $7E202A,X 
    LDA.L $7E2024,X 
    ORA.W #$8000 
    STA.L $7E2024,X 
    TXA 
    CLC 
    ADC.W #$0014 
    TAX 
    DEY 
    BNE .loop 
    PLY 
    PLX 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_CheckIfAllTailPartsAreMoving_A6D431:
    LDA.L $7E2020 
    AND.L $7E2034 
    AND.L $7E2048 
    AND.L $7E205C 
    AND.L $7E2070 
    AND.L $7E2084 
    AND.L $7E2098 
    BNE .allPartsMoving 
    CLC 
    RTS 


.allPartsMoving:
    SEC 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


DealSuitAdjustedEnemyDamageToSamus:
    LDX.W $0E54 
    LDA.W $0F78,X 
    TAX 
    LDA.L $A00006,X 
    JSL.L Suit_Damage_Division 
    JSL.L Deal_A_Damage_to_Samus 
    RTL 


SetRidleyInstList:
    STA.W $0F92 
    LDA.W #$0001 : STA.W $0F94 
    STZ.W $0F90 
    RTS 


DetermineAndSetRidleySpeedAndColorPalette:
    LDA.W #$0000 
    LDY.W $0F8C 
    CPY.W #$2328 
    BCS + 
    INC A 
    CPY.W #$1518 
    BCS + 
    INC A 
    CPY.W #$0708 
    BCS + 
    INC A 

  + STA.L $7E7824 
    DEC A 
    STA.B $12 
    BMI HandleRidleyHealthBasedPalette_return 

HandleRidleyHealthBasedPalette:
    LDA.L $7EC400 
    BNE HandleRidleyHealthBasedPalette_return 
    LDA.B $12 
    ASL #3
    SEC 
    SBC.B $12 
    ASL #2
    CLC 
    ADC.W #Palette_Ridley_HealthBased_Below9000 
    TAY 
    LDX.W #$01E2 
    LDA.W #$000E 
    JSL.L WriteAColorsFromYtoColorIndexX 

HandleRidleyHealthBasedPalette_return:
    RTS 


DetermineAndSetCeresRidleysColorPalette:
    LDA.L $7E7802 
    BEQ HandleRidleyHealthBasedPalette_return 
    LDA.L $7E781A 
    CMP.W #$0032 
    BCC HandleRidleyHealthBasedPalette_return 
    LDY.W #$0000 
    CMP.W #$0046 
    BCC .paletteChosen 
    LDY.W #$0001 
    CMP.W #$005A ; >.< where's the BCC?
    LDY.W #$0002 

.paletteChosen:
    STY.B $12 
    JMP.W HandleRidleyHealthBasedPalette 


MakeRidleysWingsAndTailFlashWhenHit:
    PHX 
    LDX.W #$0E00 
    LDA.W $0F9C 
    BEQ .noFlash 
    DEC A 
    BEQ .noFlash 
    LDA.W $0E44 
    INC A 
    AND.W #$0002 
    BEQ .noFlash 
    LDX.W #$0000 

.noFlash:
    TXA 
    STA.L $7E7818 
    PLX 
    RTS 


CheckForCollisionWithNonAirBlock:
    TYA 
    LSR #4
    SEP #$20 
    STA.W $4202 
    LDA.W $07A5 : STA.W $4203 
    REP #$20 
    TXA 
    LSR #4
    CLC 
    ADC.W $4216 
    ASL A 
    TAX 
    LDA.L $7F0002,X 
    AND.W #$F000 
    BNE .collision 
    CLC 
    RTL 


.collision:
    SEC 
    RTL 


AccelerateRidleyTowardDesiredXYPosition_NoDecelerationBoost:
    LDA.W #$0000 

AccelerateRidleyTowardDesiredXYPosition:
    STA.B $1A 
    LDA.W RidleyAccelerationDivisorIndex,Y 
    AND.W #$00FF 
    STA.B $18 
    JSR.W AccelerateRidleyTowardDesiredXPosition 
    LDA.W $0F7E,X 
    SEC 
    SBC.B $14 
    BEQ .return 
    BPL .belowTarget 
    EOR.W #$FFFF 
    INC A 
    STA.W $4204 
    SEP #$20 
    LDA.B $18 : STA.W $4206 
    REP #$20 
    XBA 
    XBA 
    NOP #2
    LDA.W $4214 
    BNE + 
    INC A 

  + STA.B $16 
    LDA.W $0FAC,X 
    BPL + 
    CLC 
    ADC.B $1A 
    CLC 
    ADC.W #$0008 
    ADC.B $16 

  + ADC.B $16 
    CMP.W #$0500 
    BMI + 
    LDA.W #$0500 

  + STA.W $0FAC,X 

.return:
    RTS 


.belowTarget:
    STA.W $4204 
    SEP #$20 
    LDA.B $18 : STA.W $4206 
    REP #$20 
    XBA 
    XBA 
    NOP #2
    LDA.W $4214 
    BNE + 
    INC A 

  + STA.B $16 
    LDA.W $0FAC,X 
    BMI + 
    SEC 
    SBC.B $1A 
    SEC 
    SBC.W #$0008 
    SBC.B $16 

  + SBC.B $16 
    CMP.W #$FB00 
    BPL + 
    LDA.W #$FB00 

  + STA.W $0FAC,X 
    RTS 


AccelerateRidleyTowardDesiredXPosition:
    LDA.W $0F7A,X 
    SEC 
    SBC.B $12 
    BEQ .return 
    BPL .rightOfTarget 
    EOR.W #$FFFF 
    INC A 
    STA.W $4204 
    SEP #$20 
    LDA.B $18 : STA.W $4206 
    REP #$20 
    XBA 
    XBA 
    NOP #2
    LDA.W $4214 
    BNE + 
    INC A 

  + STA.B $16 
    LDA.W $0FAA,X 
    BPL + 
    CLC 
    ADC.B $1A 
    CLC 
    ADC.W #$0008 
    ADC.B $16 

  + ADC.B $16 
    CMP.W #$0500 
    BMI + 
    LDA.W #$0500 

  + STA.W $0FAA,X 

.return:
    RTS 


.rightOfTarget:
    STA.W $4204 
    SEP #$20 
    LDA.B $18 : STA.W $4206 
    REP #$20 
    XBA 
    XBA 
    NOP #2
    LDA.W $4214 
    BNE + 
    INC A 

  + STA.B $16 
    LDA.W $0FAA,X 
    BMI + 
    SEC 
    SBC.B $1A 
    SEC 
    SBC.W #$0008 
    SBC.B $16 

  + SBC.B $16 
    CMP.W #$FB00 
    BPL + 
    LDA.W #$FB00 

  + STA.W $0FAA,X 
    RTS 


RidleyAccelerationDivisorIndex:
    db $10,$0F,$0E,$0D,$0C,$0B,$0A,$09,$08,$07,$06,$05,$04,$03,$02,$01 

AccelerateCeresRidleyTowardDesiredXY:
    LDA.W CeresRidleyAccelerationDivisorIndex,Y 
    AND.W #$00FF 
    STA.B $18 
    JSR.W CalculateRidleyXSpeed 
    LDA.W $0F7E,X 
    SEC 
    SBC.B $14 
    BEQ .return 
    BPL .positive 
    EOR.W #$FFFF 
    INC A 
    STA.W $4204 
    SEP #$20 
    LDA.B $18 : STA.W $4206 
    REP #$20 
    XBA 
    XBA 
    NOP #2
    LDA.W $4214 
    BNE + 
    INC A 

  + STA.B $16 
    LDA.W $0FAC,X 
    BPL .moveDown 
    ADC.B $16 
    ADC.B $16 

.moveDown:
    ADC.B $16 
    CMP.W #$0500 
    BMI .storeYSpeed 
    LDA.W #$0500 

.storeYSpeed:
    STA.W $0FAC,X 

.return:
    RTS 


.positive:
    STA.W $4204 
    SEP #$20 
    LDA.B $18 : STA.W $4206 
    REP #$20 
    XBA 
    XBA 
    NOP #2
    LDA.W $4214 
    BNE + 
    INC A 

  + STA.B $16 
    LDA.W $0FAC,X 
    BMI .movingUp 
    SBC.B $16 
    SBC.B $16 

.movingUp:
    SBC.B $16 
    CMP.W #$FB00 
    BPL + 
    LDA.W #$FB00 

  + STA.W $0FAC,X 
    RTS 


CalculateRidleyXSpeed:
    LDA.W $0F7A,X 
    SEC 
    SBC.B $12 
    BEQ .return 
    BPL .moveLeft 
    EOR.W #$FFFF 
    INC A 
    STA.W $4204 
    SEP #$20 
    LDA.B $18 : STA.W $4206 
    REP #$20 
    XBA 
    XBA 
    NOP #2
    LDA.W $4214 
    BNE + 
    INC A 

  + STA.B $16 
    LDA.W $0FAA,X 
    BPL .movingRight 
    ADC.B $16 
    ADC.B $16 

.movingRight:
    ADC.B $16 
    CMP.W #$0500 
    BMI + 
    LDA.W #$0500 

  + STA.W $0FAA,X 

.return:
    RTS 


.moveLeft:
    STA.W $4204 
    SEP #$20 
    LDA.B $18 : STA.W $4206 
    REP #$20 
    XBA 
    XBA 
    NOP #2
    LDA.W $4214 
    BNE + 
    INC A 

  + STA.B $16 
    LDA.W $0FAA,X 
    BMI .movingLeft 
    SBC.B $16 
    SBC.B $16 

.movingLeft:
    SBC.B $16 
    CMP.W #$FB00 
    BPL + 
    LDA.W #$FB00 

  + STA.W $0FAA,X 
    RTS 


CeresRidleyAccelerationDivisorIndex:
    db $10,$0F,$0E,$0D,$0C,$0B,$0A,$09,$08,$07,$06,$05,$04,$03,$02,$01 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_A6D722:
    LDA.W #$0200 : STA.B $16 
    STZ.B $1C 
    JSR.W UNUSED_A6D798 
    JSR.W UNUSED_A6D734 
    LSR.B $1C 
    LSR.B $1C 
    RTS 


UNUSED_A6D734:
    LDA.W $0F7E,X 
    SEC 
    SBC.B $14 
    BPL .unknown 
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
    LDA.B $14 : STA.W $0F7E,X 
    INC.B $1C 

.returnUpper:
    RTS 


.unknown:
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
    BEQ + 
    BPL .returnLower 

  + STZ.W $0FAC,X 
    LDA.B $14 : STA.W $0F7E,X 
    INC.B $1C 

.returnLower:
    RTS 


UNUSED_A6D798:
    LDA.W $0F7A,X 
    SEC 
    SBC.B $12 
    BPL .unknown 
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
    LDA.B $12 : STA.W $0F7A,X 
    INC.B $1C 

.returnUpper:
    RTS 


.unknown:
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
    BEQ + 
    BPL .returnLower 

  + STZ.W $0FAA,X 
    LDA.B $12 : STA.W $0F7A,X 
    INC.B $1C 

.returnLower:
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


UpdateRidleysUSwoopSpeedAndAngle:
    LDA.B $16 
    CMP.L $7E7816 
    BEQ .checkAngle 
    BPL + 
    LDA.L $7E7816 
    SEC 
    SBC.W #$0020 
    CMP.B $16 
    BPL .storeSwoopSpeed 
    LDA.B $16 

.storeSwoopSpeed:
    STA.L $7E7816 
    BRA .checkAngle 


  + LDA.L $7E7816 
    CLC 
    ADC.W #$0020 
    CMP.B $16 
    BMI + 
    LDA.B $16 

  + STA.L $7E7816 

.checkAngle:
    LDA.B $12 
    BMI .negativeTargetAngle 
    CLC 
    ADC.L $7E7814 
    CMP.B $14 
    BMI .calculateAngle 
    BRA + 


.negativeTargetAngle:
    CLC 
    ADC.L $7E7814 
    CMP.B $14 
    BPL .calculateAngle 

  + LDA.B $14 

.calculateAngle:
    STA.L $7E7814 
    XBA 
    AND.W #$00FF 
    STA.B $12 
    LDA.L $7E7816 
    JSL.L Math_86C26C 
    STA.W $0FAA 
    LDA.L $7E7816 
    JSL.L Math_86C272 
    STA.W $0FAC 
    RTS 


HandleMovementAndMainBodyWallCollisions:
    LDA.W #$0000 : STA.L $7E783E 
    LDX.W $0E54 
    LDA.W $0FAA,X 
    SEP #$20 
    CLC 
    ADC.W $0F7D,X 
    STA.W $0F7D,X 
    REP #$20 
    AND.W #$FF00 
    XBA 
    BPL .checkLeftWall 
    ORA.W #$FF00 

.checkLeftWall:
    ADC.W $0F7A,X 
    CMP.L $7E8004 
    BPL .checkRightWall 
    JSR.W CeresRidleyRoomShaking 
    LDA.L $7E8004 : STA.W $0F7A,X 
    STZ.W $0FAA,X 
    LDA.W #$0001 : STA.L $7E783E 
    BRA .getYSpeed 


.checkRightWall:
    CMP.L $7E8006 
    BMI + 
    STZ.W $0FAA,X 
    LDA.W #$0002 : STA.L $7E783E 
    LDA.L $7E8006 

  + STA.W $0F7A,X 

.getYSpeed:
    LDA.W $0FAC,X 
    SEP #$20 
    CLC 
    ADC.W $0F81,X 
    STA.W $0F81,X 
    REP #$20 
    AND.W #$FF00 
    XBA 
    BPL .checkTopWall 
    ORA.W #$FF00 

.checkTopWall:
    ADC.W $0F7E,X 
    CMP.L $7E8000 
    BPL .checkBottomWall 
    LDA.L $7E8000 : STA.W $0F7E,X 
    STZ.W $0FAC,X 
    LDA.L $7E783E 
    LDA.W #$0004 : STA.L $7E783E 
    RTS 


.checkBottomWall:
    CMP.L $7E8002 
    BMI .done 
    STZ.W $0FAC,X 
    LDA.L $7E783E 
    LDA.W #$0008 : STA.L $7E783E 
    LDA.L $7E8002 

.done:
    STA.W $0F7E,X 
    RTS 


CeresRidleyRoomShaking:
    LDA.W $079F 
    CMP.W #$0002 
    BEQ .return 
    LDA.W $0FAA,X 
    BPL .movingRight 
    EOR.W #$FFFF 
    INC A 

.movingRight:
    STA.B $12 
    LDA.W $0FAC,X 
    BPL .movingDown 
    EOR.W #$FFFF 
    INC A 

.movingDown:
    CMP.B $12 
    BCS .XSpeedGreater 
    LDA.B $12 

.XSpeedGreater:
    CMP.W #$0280 
    BCC .return 
    LDA.W $079F 
    CMP.W #$0002 
    BEQ .norfair 
    LDA.W #$0021 
    BRA + 


.norfair:
    LDA.W #$0018 ; dead code

  + STA.W $183E 
    LDA.W #$000C : STA.W $1840 

.return:
    RTS 


TurnAroundIfFacingAwayFromRoomCenter:
    LDA.L $7E7820 
    BEQ .facingLeft 
    DEC A 
    BEQ .return 
    LDA.W $0F79 
    BPL .return 
    LDA.W #InstList_Ridley_TurnFromRightToLeft 
    BRA + 


.facingLeft:
    LDA.W $0F79 
    BMI .return 
    LDA.W #InstList_Ridley_TurnFromLeftToRight 

  + STA.W $0F92 
    LDA.W #$0002 : STA.W $0F94 
    STZ.W $0F90 

.return:
    RTS 


HandleWingFlapping:
    JSR.W CalculateWingFlapSpeed 
    LDA.L $7E7812 
    SEC 
    SBC.L $7E7810 
    STA.L $7E7812 
    BPL .return 
    LDA.W #$0020 : STA.L $7E7812 
    LDA.L $7E780E 
    INC A 
    CMP.W #$000A 
    BCC .lessThanA 
    LDA.W #$0000 

.lessThanA:
    STA.L $7E780E 

.return:
    RTS 


CalculateWingFlapSpeed:
    LDA.W $0FAA 
    BPL + 
    EOR.W #$FFFF 
    INC A 

  + STA.B $12 
    LDA.W $0FAC 
    BPL + 
    EOR.W #$FFFF 
    INC A 

  + CLC 
    ADC.B $12 
    BNE .RidleyMoving 
    STA.L $7E7810 
    RTS 


.RidleyMoving:
    SEC 
    SBC.B $12 
    CMP.B $12 
    BPL .YSpeedGreater 
    LDA.B $12 

.YSpeedGreater:
    ASL #2
    AND.W #$0F00 
    XBA 
    ASL A 
    CMP.W #$000E 
    BCC .maxE 
    LDA.W #$000E 

.maxE:
    TAX 
    LDA.W .wingFlapSpeeds,X 
    BIT.W $0FAC 
    BMI .movingUp 
    LSR A 

.movingUp:
    STA.L $7E7810 
    RTS 


.wingFlapSpeeds:
    dw $000C,$000E,$0010,$0012,$001C,$0020,$0028,$0030 

InitializeRibAnimation:
    LDA.W #RidleyRib_AnimationData : STA.L $7E780A 
    LDA.W #$0001 : STA.L $7E780C 

InitializeRibAnimation_return:
    RTS 


AnimateRidleysRibs:
    LDA.L $7E780C 
    DEC A 
    STA.L $7E780C 
    BNE InitializeRibAnimation_return 
    LDA.L $7E780A 

.loop:
    TAX 
    LDA.W $0000,X 
    BPL .timer 
    STA.L $7E780A 
    BRA .loop 


.timer:
    STA.L $7E780C 
    LDY.W $0330 
    LDA.W #Tiles_RidleysRibsAndClaws_0>>8&$FF00 : STA.W $00D3,Y 
    STA.W $00DA,Y 
    LDA.W $0002,X : STA.W $00D2,Y 
    LDA.W $0004,X : STA.W $00D9,Y 
    LDA.W #$7220 : STA.W $00D5,Y 
    LDA.W #$7320 : STA.W $00DC,Y 
    LDA.W #$0040 : STA.W $00D0,Y 
    STA.W $00D7,Y 
    TYA 
    CLC 
    ADC.W #$000E 
    TAY 
    STY.W $0330 
    LDA.W #$0000 : STA.W $00D0,Y 
    TXA 
    CLC 
    ADC.W #$0006 
    STA.L $7E780A 
    RTS 


RidleyRib_AnimationData:
    dw $0014 
    dw Tiles_Ridley_1 
    dw Tiles_Ridley_2 
    dw $0014 
    dw Tiles_RidleysRibsAndClaws_0 
    dw Tiles_RidleysRibsAndClaws_3 
    dw $0014 
    dw Tiles_RidleysRibsAndClaws_1 
    dw Tiles_RidleysRibsAndClaws_4 
    dw $0014 
    dw Tiles_RidleysRibsAndClaws_0 
    dw Tiles_RidleysRibsAndClaws_3 

if !FEATURE_KEEP_UNREFERENCED
RidleyRibAnimationDataPointer:
    dw RidleyRib_AnimationData ; Unused?
endif ; !FEATURE_KEEP_UNREFERENCED

TransferGraphicsForRidleysClawsHoldingSamusOrBabyMetroid:
    LDX.W #RidleyClawGraphicsPointers_released 
    BCC .notHolding 
    LDX.W #RidleyClawGraphicsPointers_holding 

.notHolding:
    LDY.W $0330 
    LDA.W #Tiles_RidleysRibsAndClaws_0>>8&$FF00 : STA.W $00D3,Y 
    STA.W $00DA,Y 
    LDA.W $0000,X : STA.W $00D2,Y 
    LDA.W $0002,X : STA.W $00D9,Y 
    LDA.W #$7AC0 : STA.W $00D5,Y 
    LDA.W #$7BC0 : STA.W $00DC,Y 
    LDA.W #$0080 : STA.W $00D0,Y 
    STA.W $00D7,Y 
    TYA 
    CLC 
    ADC.W #$000E 
    TAY 
    STY.W $0330 
    LDA.W #$0000 : STA.W $00D0,Y 
    RTS 


RidleyClawGraphicsPointers_released:
    dw Tiles_Ridley_3 
    dw Tiles_Ridley_4 

RidleyClawGraphicsPointers_holding:
    dw Tiles_RidleysRibsAndClaws_2 
    dw Tiles_RidleysRibsAndClaws_5 

DrawRidleysWings:
    LDA.L $7E7820 
    BEQ .facingLeft 
    DEC A 
    BEQ .return 
    LDA.W #$000A 

.facingLeft:
    CLC 
    ADC.L $7E780E 
    ASL A 
    TAX 
    LDY.W .spritemapPointersLeft,X 
    LDA.L $7E7818 : STA.B $16 
    LDA.W $0F7A : STA.B $12 
    LDA.W $0F7E : STA.B $14 
    JMP.W RidleyGeneralUseDrawing 


.return:
    RTS 


.spritemapPointersLeft:
    dw Spritemap_RidleyWings_FacingLeft_FullyRaised 
    dw Spritemap_RidleyWings_FacingLeft_MostlyRaised 
    dw Spritemap_RidleyWings_FacingLeft_SlightlyRaised 
    dw Spritemap_RidleyWings_FacingLeft_SlightlyLowered 
    dw Spritemap_RidleyWings_FacingLeft_MostlyLowered 
    dw Spritemap_RidleyWings_FacingLeft_FullyLowered 
    dw Spritemap_RidleyWings_FacingLeft_MostlyLowered 
    dw Spritemap_RidleyWings_FacingLeft_SlightlyLowered 
    dw Spritemap_RidleyWings_FacingLeft_SlightlyRaised 
    dw Spritemap_RidleyWings_FacingLeft_MostlyRaised 

.spritemapPointersRight:
    dw Spritemap_RidleyWings_FacingRight_FullyRaised 
    dw Spritemap_RidleyWings_FacingRight_MostlyRaised 
    dw Spritemap_RidleyWings_FacingRight_SlightlyRaised 
    dw Spritemap_RidleyWings_FacingRight_SlightlyLowered 
    dw Spritemap_RidleyWings_FacingRight_MostlyLowered 
    dw Spritemap_RidleyWings_FacingRight_FullyLowered 
    dw Spritemap_RidleyWings_FacingRight_MostlyLowered 
    dw Spritemap_RidleyWings_FacingRight_SlightlyLowered 
    dw Spritemap_RidleyWings_FacingRight_SlightlyRaised 
    dw Spritemap_RidleyWings_FacingRight_MostlyRaised 

DrawRidleyTail:
    LDA.W $0F86 
    AND.W #$0100 
    BEQ .notInvisible 
    RTS 


.notInvisible:
    LDA.L $7E20A4 : STA.B $12 
    LDA.L $7E20A6 : STA.B $14 
    LDA.L $7E20A2 
    CLC 
    ADC.L $7E208E 
    CLC 
    ADC.W #$0008 
    AND.W #$00F0 
    LSR #3
    TAX 
    LDY.W RidleyTailTipSpritemapPointers,X 
    JSR.W GeneralPurposeRidleyDrawing_SetPalette 
    LDA.L $7E2092 : STA.B $14 
    LDA.L $7E2090 : STA.B $12 
    LDY.W #Spritemap_RidleyTail_Small 
    JSR.W GeneralPurposeRidleyDrawing_SetPalette 
    LDA.L $7E207C : STA.B $12 
    LDA.L $7E207E : STA.B $14 
    LDY.W #Spritemap_RidleyTail_Small 
    JSR.W GeneralPurposeRidleyDrawing_SetPalette 
    LDA.L $7E2068 : STA.B $12 
    LDA.L $7E206A : STA.B $14 
    LDY.W #Spritemap_RidleyTail_Medium 
    JSR.W GeneralPurposeRidleyDrawing_SetPalette 
    LDA.L $7E2054 : STA.B $12 
    LDA.L $7E2056 : STA.B $14 
    LDY.W #Spritemap_RidleyTail_Medium 
    JSR.W GeneralPurposeRidleyDrawing_SetPalette 
    LDA.L $7E2040 : STA.B $12 
    LDA.L $7E2042 : STA.B $14 
    LDY.W #Spritemap_RidleyTail_Large 
    JSR.W GeneralPurposeRidleyDrawing_SetPalette 
    LDA.L $7E202C : STA.B $12 
    LDA.L $7E202E : STA.B $14 
    LDY.W #Spritemap_RidleyTail_Large ; fallthrough to GeneralPurposeRidleyDrawing

GeneralPurposeRidleyDrawing_SetPalette:
    LDA.L $7E7818 : STA.B $16 
    JMP.W RidleyGeneralUseDrawing 


GetBabyMetroidSpritemapPointerFromInstList:
    STA.B $00 
    INC #2
    STA.B $03 
    SEP #$20 
    LDA.B #$7E : STA.B $02 
    STA.B $05 
    REP #$20 
    LDA.B [$00] 
    BMI .pointer 
    PLA 
    RTS 


.pointer:
    TAX 
    LDA.W $0000,X 
    BMI .instruction 
    CMP.B [$03] 
    BNE .timerDoesNotMatchCounter 
    INX #4
    .manualReturn:
    LDA.W $0000,X 
    BPL .notInstruction 

.instruction:
    STA.B $06 
    INX #2
    PEA.W .manualReturn-1 
    JMP.W ($0006) 


.notInstruction:
    LDA.W #$0001 : STA.B [$03] 
    TXA 
    STA.B [$00] 
    LDY.W $0002,X 
    RTS 


.timerDoesNotMatchCounter:
    LDA.B [$03] 
    INC A 
    STA.B [$03] 
    LDY.W $0002,X 
    RTS 


RidleyGeneralUseDrawing:
    LDA.W $0000,Y 
    INY #2
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
    CMP.W #$00E0 
    BPL .next 
    STA.B $1A 
    LDA.W $0000,Y 
    ADC.B $12 
    SEC 
    SBC.W $0911 
    STA.W $0370,X 
    AND.W #$0100 
    BEQ + 
    LDA.L MapOfOAMIndexToHighOAM_address,X : STA.B $1C 
    LDA.B ($1C) 
    ORA.L MapOfOAMIndex_highXPosBit,X 
    STA.B ($1C) 

  + LDA.W $0000,Y 
    BPL + 
    LDA.L MapOfOAMIndexToHighOAM_address,X : STA.B $1C 
    LDA.B ($1C) 
    ORA.L MapOfOAMIndex_sizeBit,X 
    STA.B ($1C) 

  + LDA.B $1A : STA.W $0371,X 
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


Spritemap_RidleyTail_Large:
    dw $0001,$C3F8 
    db $F8 
    dw $31E0 

Spritemap_RidleyTail_Medium:
    dw $0001,$C3F8 
    db $F8 
    dw $31E2 

Spritemap_RidleyTail_Small:
    dw $0001,$C3F8 
    db $F8 
    dw $31E4 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_RidleyTail_Large_A6DCA5:
    dw $0001,$C3F8 
    db $F8 
    dw $71E0 

UNUSED_Spritemap_RidleyTail_Medium_A6DCAC:
    dw $0001,$C3F8 
    db $F8 
    dw $71E2 

UNUSED_Spritemap_RidleyTail_Small_A6DCB3:
    dw $0001,$C3F8 
    db $F8 
    dw $71E4 
endif ; !FEATURE_KEEP_UNREFERENCED

RidleyTailTipSpritemapPointers:
    dw Spritemap_RidleyTailTip_PointingDown 
    dw Spritemap_RidleyTailTip_PointingDownDownRight 
    dw Spritemap_RidleyTailTip_PointingDownRight 
    dw Spritemap_RidleyTailTip_PointingRightDownRight 
    dw Spritemap_RidleyTailTip_PointingRight 
    dw Spritemap_RidleyTailTip_PointingRightUpRight 
    dw Spritemap_RidleyTailTip_PointingUpRight 
    dw Spritemap_RidleyTailTip_PointingUpUpRight 
    dw Spritemap_RidleyTailTip_PointingUp 
    dw Spritemap_RidleyTailTip_PointingUpUpLeft 
    dw Spritemap_RidleyTailTip_PointingUpLeft 
    dw Spritemap_RidleyTailTip_PointingLeftUpLeft 
    dw Spritemap_RidleyTailTip_PointingLeft 
    dw Spritemap_RidleyTailTip_PointingLeftDownLeft 
    dw Spritemap_RidleyTailTip_PointingDownLeft 
    dw Spritemap_RidleyTailTip_PointingDownDownLeft 

Spritemap_RidleyTailTip_PointingLeft:
    dw $0001,$C3F0 
    db $F8 
    dw $31E6 

Spritemap_RidleyTailTip_PointingLeftUpLeft:
    dw $0001,$C3F0 
    db $F4 
    dw $31E8 

Spritemap_RidleyTailTip_PointingUpLeft:
    dw $0001,$C3F2 
    db $F3 
    dw $31EA 

Spritemap_RidleyTailTip_PointingUpUpLeft:
    dw $0001,$C3F4 
    db $F0 
    dw $31EC 

Spritemap_RidleyTailTip_PointingUp:
    dw $0001,$C3F8 
    db $F0 
    dw $31EE 

Spritemap_RidleyTailTip_PointingUpUpRight:
    dw $0001,$C3FC 
    db $F0 
    dw $71EC 

Spritemap_RidleyTailTip_PointingUpRight:
    dw $0001,$C3FE 
    db $F3 
    dw $71EA 

Spritemap_RidleyTailTip_PointingRightUpRight:
    dw $0001,$C200 
    db $F4 
    dw $71E8 

Spritemap_RidleyTailTip_PointingRight:
    dw $0001,$C200 
    db $F8 
    dw $71E6 

Spritemap_RidleyTailTip_PointingRightDownRight:
    dw $0001,$C200 
    db $FC 
    dw $F1E8 

Spritemap_RidleyTailTip_PointingDownRight:
    dw $0001,$C3FE 
    db $FE 
    dw $F1EA 

Spritemap_RidleyTailTip_PointingDownDownRight:
    dw $0001,$C3FC 
    db $00 
    dw $F1EC 

Spritemap_RidleyTailTip_PointingDown:
    dw $0001,$C3F9 
    db $00 
    dw $F1EE 

Spritemap_RidleyTailTip_PointingDownDownLeft:
    dw $0001,$C3F4 
    db $FF 
    dw $B1EC 

Spritemap_RidleyTailTip_PointingDownLeft:
    dw $0001,$C3F2 
    db $FE 
    dw $B1EA 

Spritemap_RidleyTailTip_PointingLeftDownLeft:
    dw $0001,$C3F0 
    db $FC 
    dw $B1E8 

Spritemap_RidleyWings_FacingLeft_FullyRaised:
    dw $0006,$002C 
    db $D7 
    dw $3108,$000C 
    db $EF 
    dw $3128,$C21C 
    db $DF 
    dw $3116,$C20C 
    db $DF 
    dw $3114,$C21C 
    db $D7 
    dw $3106,$C20C 
    db $D7 
    dw $3104 

Spritemap_RidleyWings_FacingLeft_MostlyRaised:
    dw $0005,$002C 
    db $E4 
    dw $311D,$C21C 
    db $E4 
    dw $311B,$C20C 
    db $E4 
    dw $3119,$C21C 
    db $DC 
    dw $310B,$C20C 
    db $DC 
    dw $3109 

Spritemap_RidleyWings_FacingLeft_SlightlyRaised:
    dw $0003,$002C 
    db $F0 
    dw $3148,$C21C 
    db $E8 
    dw $3136,$C20C 
    db $E8 
    dw $3134 

Spritemap_RidleyWings_FacingLeft_SlightlyLowered:
    dw $0003,$002C 
    db $E8 
    dw $B148,$C21C 
    db $E8 
    dw $B136,$C20C 
    db $E8 
    dw $B134 

Spritemap_RidleyWings_FacingLeft_MostlyLowered:
    dw $0005,$002C 
    db $F2 
    dw $B11D,$C21C 
    db $EA 
    dw $B11B,$C20C 
    db $EA 
    dw $B119,$C21C 
    db $F2 
    dw $B10B,$C20C 
    db $F2 
    dw $B109 

Spritemap_RidleyWings_FacingLeft_FullyLowered:
    dw $0006,$002C 
    db $FF 
    dw $B108,$000C 
    db $E7 
    dw $B128,$C21C 
    db $EF 
    dw $B116,$C20C 
    db $EF 
    dw $B114,$C21C 
    db $F7 
    dw $B106,$C20C 
    db $F7 
    dw $B104 

Spritemap_RidleyWings_FacingRight_FullyRaised:
    dw $0006,$01CC 
    db $D7 
    dw $7108,$01EC 
    db $EF 
    dw $7128,$C3D4 
    db $DF 
    dw $7116,$C3E4 
    db $DF 
    dw $7114,$C3D4 
    db $D7 
    dw $7106,$C3E4 
    db $D7 
    dw $7104 

Spritemap_RidleyWings_FacingRight_MostlyRaised:
    dw $0005,$01CC 
    db $E4 
    dw $711D,$C3D4 
    db $E4 
    dw $711B,$C3E4 
    db $E4 
    dw $7119,$C3D4 
    db $DC 
    dw $710B,$C3E4 
    db $DC 
    dw $7109 

Spritemap_RidleyWings_FacingRight_SlightlyRaised:
    dw $0003,$01CC 
    db $F0 
    dw $7148,$C3D4 
    db $E8 
    dw $7136,$C3E4 
    db $E8 
    dw $7134 

Spritemap_RidleyWings_FacingRight_SlightlyLowered:
    dw $0003,$01CC 
    db $E8 
    dw $F148,$C3D4 
    db $E8 
    dw $F136,$C3E4 
    db $E8 
    dw $F134 

Spritemap_RidleyWings_FacingRight_MostlyLowered:
    dw $0005,$01CC 
    db $F2 
    dw $F11D,$C3D4 
    db $EA 
    dw $F11B,$C3E4 
    db $EA 
    dw $F119,$C3D4 
    db $F2 
    dw $F10B,$C3E4 
    db $F2 
    dw $F109 

Spritemap_RidleyWings_FacingRight_FullyLowered:
    dw $0006,$01CC 
    db $FF 
    dw $F108,$01EC 
    db $E7 
    dw $F128,$C3D4 
    db $EF 
    dw $F116,$C3E4 
    db $EF 
    dw $F114,$C3D4 
    db $F7 
    dw $F106,$C3E4 
    db $F7 
    dw $F104 

CheckIfRidleyIsOnScreen:
    LDA.W $0F7E 
    BMI .offScreen 
    CLC 
    ADC.W #$0020 
    SEC 
    SBC.W $0915 
    BMI .offScreen 
    CMP.W #$0120 
    BPL .offScreen 
    LDA.W $0F7A 
    BMI .offScreen 
    CLC 
    ADC.W #$0020 
    SEC 
    SBC.W $0911 
    BMI .offScreen 
    CMP.W #$0140 
    BPL .offScreen 
    CLC 
    RTS 


.offScreen:
    SEC 
    RTS 


RidleyTail_vs_SamusProjectile_CollisionDetection:
    LDA.W $0CCE 
    BNE .projectilesToCheck 
    CLC 
    RTS 


.projectilesToCheck:
    LDY.W #$0000 

.loop:
    LDA.W $0C18,Y 
    BPL .nextProjectile 
    XBA 
    AND.W #$000F 
    CMP.W #$0003 
    BPL .nextProjectile 
    LDA.W $0B64,Y 
    SEC 
    SBC.B $12 
    BPL + 
    EOR.W #$FFFF 
    INC A 

  + SEC 
    SBC.W $0BB4,Y 
    BCC .checkYPosition 
    CMP.B $16 
    BCS .nextProjectile 

.checkYPosition:
    LDA.W $0B78,Y 
    SEC 
    SBC.B $14 
    BPL + 
    EOR.W #$FFFF 
    INC A 

  + SEC 
    SBC.W $0BC8,Y 
    BCC .collision 
    CMP.B $18 
    BCC .collision 

.nextProjectile:
    INY #2
    CPY.W #$000A 
    BMI .loop 
    CLC 
    RTS 


.collision:
    LDA.B $12 : STA.W $0B64,Y 
    LDA.B $14 : STA.W $0B78,Y 
    LDA.W $0C04,Y 
    ORA.W #$0010 
    STA.W $0C04,Y 
    SEC 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_ChangeRidleyProjectileDirection_A6DF08:
    LDA.W $0C04,Y 
    AND.W #$000F 
    CMP.W #$0007 
    BNE .notFacingLeft 
    LDA.W #$0001 
    BRA .done 


.notFacingLeft:
    CMP.W #$0002 
    BNE .notLeftOrRight 
    LDA.W #$0008 
    BRA .done 


.notLeftOrRight:
    LDA.W #$0005 

.done:
    STA.W $0C04,Y 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


EfficientCollisionDetectionForSamusAt_12_14:
    LDA.W $0AF6 
    SEC 
    SBC.B $12 
    BPL + 
    EOR.W #$FFFF 
    INC A 

  + SEC 
    SBC.W $0AFE 
    BCC + 
    CMP.B $16 
    BCS .returnNoCollision 

  + LDA.W $0AFA 
    SEC 
    SBC.B $14 
    BPL + 
    EOR.W #$FFFF 
    INC A 

  + SEC 
    SBC.W $0B00 
    BCC .returnCollision 
    CMP.B $18 
    BCC .returnCollision 

.returnNoCollision:
    CLC 
    RTS 


.returnCollision:
    SEC 
    RTS 


RidleyHitbox_vs_Samus_Collision:
    JSL.L NormalEnemyTouchAI_NoDeathCheck_External 
    JMP.W RTL_A6DFB6 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_RidleyDamagesSamus_A6DF60:
    JSR.W UNUSED_RidleyDamagesSamus_A6DF66 
    JMP.W RTL_A6DFB6 


UNUSED_RidleyDamagesSamus_A6DF66:
    JSL.L DealSuitAdjustedEnemyDamageToSamus 
    LDA.W #$0060 : STA.W $18A8 
    LDA.W #$0005 : STA.W $18AA 
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
endif ; !FEATURE_KEEP_UNREFERENCED


EnemyShot_Ridley:
    LDA.W $079F 
    CMP.W #$0002 
    BEQ .NorfairRidley 
    LDY.W #$000D 
    LDA.W $0F9C 
    BEQ .oddFlashTimer 
    LSR A 
    BCC .oddFlashTimer 
    INY 

.oddFlashTimer:
    STY.W $0F9C 
    LDA.L $7E781A 
    INC A 
    STA.L $7E781A 
    BRA RTL_A6DFB6 


.NorfairRidley:
    JSL.L NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External 
    BRA RTL_A6DFB6 


PowerBombReaction_Ridley:
    JSL.L NormalEnemyPowerBombAI_NoDeathCheck_External ; fallthrough to RTL_A6DFB6

RTL_A6DFB6:
    RTL 


SetRidleyAsDead:
    LDA.W $0F8C 
    BNE .return 
    LDA.L $7E7802 
    BMI .return 
    LDA.W #$FFFF : STA.L $7E7802 
    LDA.W $0F86 
    ORA.W #$0400 
    STA.W $0F86 
    LDA.W #Function_Ridley_MoveToDeathSpot : STA.W $0FA8 

.return:
    RTL 


RidleyTail_vs_Samus_Interaction:
    LDA.W #$000E : STA.B $16 
    STA.B $18 
    LDA.L $7E20A4 : STA.B $12 
    LDA.L $7E20A6 : STA.B $14 
    JSR.W EfficientCollisionDetectionForSamusAt_12_14 
    BCC .return 
    LDA.L $7E7838 
    JSL.L Suit_Damage_Division 
    JSL.L Deal_A_Damage_to_Samus 
    LDA.W #$0060 : STA.W $18A8 
    LDA.W #$0005 : STA.W $18AA 
    LDY.W #$0000 
    LDA.W $0AF6 
    SEC 
    SBC.L $7E20A4 
    BMI .knockbackDirection 
    INY 

.knockbackDirection:
    STY.W $0A54 

.return:
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProjectileCollision_A6E01B:
    LDX.W $0E54 
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
    ASL #2
    CMP.W #$0300 
    BCC + 
    LDA.W #$0300 

  + PHA 
    JSL.L Math_86C26C 
    STA.B $12 
    LDX.W $0E54 
    EOR.W $0FAA,X 
    BPL + 
    LDA.B $12 
    CLC 
    ADC.W $0FAA,X 
    STA.W $0FAA,X 

  + PLA 
    JSL.L Math_86C272 
    STA.B $12 
    LDX.W $0E54 
    EOR.W $0FAC,X 
    BPL .return 
    LDA.B $12 
    CLC 
    ADC.W $0FAC,X 
    STA.W $0FAC,X 

.return:
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


KillProjectilesWithRidleyTailTip:
    LDA.W $0F86 
    AND.W #$0400 
    BEQ .notIntangible 
    RTS 


.notIntangible:
    LDA.W #$000E : STA.B $16 
    STA.B $18 
    LDA.L $7E20A4 : STA.B $12 
    LDA.L $7E20A6 : STA.B $14 
    JSR.W RidleyTail_vs_SamusProjectile_CollisionDetection 
    BCS TailProjectileCollision 
    LDA.W #$000A : STA.B $16 
    STA.B $18 
    LDA.L $7E2090 : STA.B $12 
    LDA.L $7E2092 : STA.B $14 
    JSR.W RidleyTail_vs_SamusProjectile_CollisionDetection 
    BCS TailProjectileCollision 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_TailProjectileCollision_A6E0C2:
    LDA.L $7E207C : STA.B $12 
    LDA.L $7E207E : STA.B $14 
    JSR.W RidleyTail_vs_SamusProjectile_CollisionDetection 
    BCS TailProjectileCollision 
    LDA.W #$000B : STA.B $16 
    STA.B $18 
    LDA.L $7E2068 : STA.B $12 
    LDA.L $7E206A : STA.B $14 
    JSR.W RidleyTail_vs_SamusProjectile_CollisionDetection 
    BCS TailProjectileCollision 
    LDA.L $7E2054 : STA.B $12 
    LDA.L $7E2056 : STA.B $14 
    JSR.W RidleyTail_vs_SamusProjectile_CollisionDetection 
    BCS TailProjectileCollision 
    LDA.W #$000D : STA.B $16 
    STA.B $18 
    LDA.L $7E2040 : STA.B $12 
    LDA.L $7E2042 : STA.B $14 
    JSR.W RidleyTail_vs_SamusProjectile_CollisionDetection 
    BCS TailProjectileCollision 
    LDA.L $7E202C : STA.B $12 
    LDA.L $7E202E : STA.B $14 
    JSR.W RidleyTail_vs_SamusProjectile_CollisionDetection 
    BCS TailProjectileCollision 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


TailProjectileCollision:
    LDA.W $0B64,Y : STA.B $12 
    LDA.W $0B78,Y : STA.B $14 
    LDA.W $0C19,Y 
    AND.W #$000F 
    LDY.W #$000C 
    DEC A 
    BNE .notAMissile 
    LDA.W #$003D 
    JSL.L QueueSound_Lib1_Max6 
    LDY.W #$0006 

.notAMissile:
    TYA 
    LDY.W #EnemyProjectile_MiscDust 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    RTS 


Palette_Ridley:
    dw $0000,$56BA,$41B2,$1447,$0403,$4E15,$3570,$24CB 
    dw $1868,$5E5F,$183F,$1014,$031F,$01DA,$00F5,$0C63 

Palette_CeresRidleyInit:
    dw $0000,$7E20,$6560,$2060,$1000,$7940,$5D00,$4CA0 
    dw $3CA0,$43FF,$0113,$000F,$175C,$0299,$01D6,$57E0 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Palette_Ridley_A6E18F:
    dw $0000,$6BF5,$06E1,$0641,$05A1,$5E5F,$183F,$1014 
    dw $080A,$0404,$4F9F,$3ED8,$2E12,$6F70,$7FFF,$5EE0 
endif ; !FEATURE_KEEP_UNREFERENCED

Palette_RidleyExplosion_0:
    dw $3800,$56BA,$41B2,$1447,$0403,$4E15,$3570,$24CB 

Palette_RidleyExplosion_1:
    dw $1868,$5E5F,$183F,$1014,$031F,$01DA,$00F5,$0C63 

Palette_NorfairRidleyInit:
    dw $3800,$6B5A,$5652,$28E7,$1863,$62B5,$4A10,$396B 
    dw $3129,$43FF,$0113,$000F,$175C,$0299,$01D6,$3BE0 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Palette_Ridley_A6E1EF:
    dw $3800 
endif ; !FEATURE_KEEP_UNREFERENCED

Palette_BabyMetroidCutscene_EndOfInstList:
    dw $6BF5,$06E1,$0641,$05A1,$5E5F,$183F,$1014,$080A 
    dw $0404,$4F9F,$3ED8,$2E12,$6F70,$7FFF,$5EE0 

Palette_BabyMetroidCutscene_HorizontalSquish:
    dw $6BF5,$06E1,$0641,$05A1,$5E5F,$183F,$1014,$080A 
    dw $0404,$4F9F,$3ED8,$2E12,$6F70,$7FFF,$5EE0 

Palette_BabyMetroidCutscene_Round:
    dw $77F8,$1344,$12A4,$1204,$6ABF,$249F,$1C77,$146D 
    dw $1067 

Palette_CeresSteam:
    dw $5BFF,$4B38,$3A72,$7BD3,$7FFF,$6B43 

Palette_BabyMetroidCutscene_VerticalSquish:
    dw $7FFB,$1FA7,$1F07,$1E67,$771F,$30FF,$28DA,$20D0 
    dw $1CCA,$67FF,$579B,$46D5,$7BD6,$7FFF,$77A6 

CeresRidleyEyeFadeInIndices:
    db $0F,$0E,$0D,$0C,$0B,$0A,$09,$08,$07,$06,$05,$04,$03,$02,$01,$00 
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $FF 

CeresRidleyEyeFadeInColors_0:
    dw $031F 

CeresRidleyEyeFadeInColors_1:
    dw $01DA 

CeresRidleyEyeFadeInColors_2:
    dw $00F5,$02DD,$01B8,$00D3,$029A,$0196,$00D2,$0278 
    dw $0174,$00B0,$0236,$0153,$00AF,$0214,$0131,$008E 
    dw $01D2,$010F,$008C,$0190,$00ED,$006B,$016E,$00CC 
    dw $0069,$012C,$00AA,$0048,$010A,$0088,$0047,$00C8 
    dw $0067,$0025,$0086,$0045,$0024,$0064,$0023,$0022 
    dw $0022,$0021,$0001,$0000,$0000,$0000 

Palette_Ridley_FadeIn:
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000 
    dw $0000,$0000,$0000,$0421,$0401,$0000,$0000,$0421 
    dw $0001,$0000,$0000,$0422,$0002,$0001,$0843,$0822 
    dw $0001,$0000,$0842,$0422,$0401,$0001,$0C44,$0004 
    dw $0002,$1085,$0C43,$0401,$0000,$0C64,$0843,$0422 
    dw $0401,$1066,$0406,$0004,$14A7,$1064,$0401,$0000 
    dw $1485,$0C64,$0823,$0402,$1888,$0408,$0405,$1CE8 
    dw $1486,$0402,$0001,$18A7,$1065,$0C43,$0822,$1CCA 
    dw $080A,$0406,$210A,$18A7,$0802,$0001,$1CC8,$1486 
    dw $0C44,$0823,$24EC,$080C,$0408,$252C,$1CC8,$0823 
    dw $0001,$20E9,$18A7,$1045,$0823,$290E,$080E,$0409 
    dw $2D6D,$20E9,$0823,$0001,$290B,$1CA8,$1065,$0C24 
    dw $3130,$0C10,$080A,$318F,$24EA,$0C24,$0001,$2D2C 
    dw $1CC9,$1466,$0C24,$3552,$0C12,$080C,$39D1,$290C 
    dw $0C24,$0002,$314E,$20EA,$1887,$1045,$3D94,$1014 
    dw $080D,$3DF3,$2D2D,$0C25,$0002,$396F,$250B,$1888 
    dw $1045,$41B6,$1016,$0C0E,$4214,$314E,$1025,$0002 
    dw $3D90,$290C,$1C88,$1046,$49D8,$1018,$0C10,$4A56 
    dw $356F,$1026,$0002,$41B2,$2D2D,$1CA9,$1447,$51FA 
    dw $141A,$0C11,$4E78,$3D90,$1026,$0402,$45F3,$314F 
    dw $20AA,$1447,$561D,$143D,$0C12,$56BA,$41B2,$1447 
    dw $0403,$4E15,$3570,$24CB,$1868,$5E5F,$183F,$1014 

Palette_Ridley_HealthBased_Below9000:
    dw $4E7A,$3D73,$1449,$0405,$45D6,$3151,$20AD,$184A 
    dw $561F,$183F,$1015,$02BF,$019A 

Palette_Ridley_HealthBased_Below5400:
    dw $00D6,$4A5A,$3973,$142A,$0407,$45B6,$3132,$20AE 
    dw $184B,$51FF,$183F,$1015,$029F 

Palette_Ridley_HealthBased_Below1800:
    dw $019A,$00D6,$4A3B,$3954,$142B,$0808,$41B7,$2D33 
    dw $20AF,$184C,$4DDF,$183F,$1016,$067F,$057B,$04B7 

Instruction_Ridley_QueueRoarSFX:
    LDA.W #$0059 : STA.L $7E781E 
    JSL.L QueueSound_Lib2_Max6 
    RTL 


Instruction_Ridley_ResetRoarFlag:
    LDA.W #$0000 : STA.L $7E781E 
    RTL 


Inst_Ridley_GotoYAndSetTimerTo8IfNotNorfairOrSamusLowEnergy:
    LDA.W $079F 
    CMP.W #$0002 
    BEQ Instruction_Ridley_SkipToNextInstruction 
    LDA.W $09C2 
    CMP.W #$001E 
    BPL Instruction_Ridley_SkipToNextInstruction 
    LDA.W #$0008 : STA.L $7E7800 

Instruction_Ridley_GotoY:
    LDA.W $0000,Y 
    TAY 
    RTL 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Instruction_RidleyCeres_GotoYIfNotHoldingBaby_A6E4EE:
    LDA.L $7E7836 
    BNE Instruction_Ridley_GotoY 
    INY #2
    BRA Instruction_Ridley_GotoY 


UNUSED_Instruction_RidleyCeres_GotoYIfHoldingBaby_A6E4F8:
    LDA.L $7E7836 
    BEQ Instruction_Ridley_GotoY 
    INY #2
    RTL 
endif ; !FEATURE_KEEP_UNREFERENCED


Inst_RidleyCeres_UpdateSamusPrevPosition_HeldYDisplacement:
    LDA.W $0AF6 : STA.W $0B10 
    LDA.W $0AFA : STA.W $0B14 
    LDA.W $0000,Y : STA.L $7E783A 

Instruction_Ridley_SkipToNextInstruction:
    INY #2
    RTL 


Instruction_Ridley_GotoYIfNotFacingLeft:
    LDA.L $7E7820 
    BEQ Instruction_Ridley_SkipToNextInstruction 
    BRA Instruction_Ridley_GotoY 


Instruction_Ridley_MoveRidleyWithArgsInY:
    LDA.W $0000,Y 
    CLC 
    ADC.W $0F7A 
    STA.W $0F7A 
    LDA.W $0002,Y 
    CLC 
    ADC.W $0F7E 
    STA.W $0F7E 
    INY #4
    RTL 


InstList_Ridley_FacingLeft_Initial:
    dw Instruction_Ridley_GotoYIfNotFacingLeft 
    dw InstList_Ridley_FacingRight_Initial 
    dw $000C 
    dw ExtendedSpritemap_Ridley_FacingLeft 
    dw Instruction_Common_Sleep 

InstList_Ridley_FacingRight_Initial:
    dw $000C 
    dw ExtendedSpritemap_Ridley_FacingRight 
    dw Instruction_CommonA6_Sleep 

InstList_RidleyCeres_FacingLeft_Lunging:
    dw Instruction_Ridley_GotoYIfNotFacingLeft 
    dw UNUSED_InstList_RidleyCeres_FacingRight_Lunging_A6E576 
    dw Inst_RidleyCeres_UpdateSamusPrevPosition_HeldYDisplacement 
    dw $0000,$0004 
    dw ExtendedSpritemap_Ridley_FacingLeft 
    dw Inst_RidleyCeres_UpdateSamusPrevPosition_HeldYDisplacement 
    dw $0002,$0006 
    dw ExtendedSpritemap_Ridley_FacingLeft_LegsHalfExtended 
    dw Inst_RidleyCeres_UpdateSamusPrevPosition_HeldYDisplacement 
    dw $0004,$0050 
    dw ExtendedSpritemap_Ridley_FacingLeft_LegsExtended 
    dw Inst_RidleyCeres_UpdateSamusPrevPosition_HeldYDisplacement 
    dw $0002,$0006 
    dw ExtendedSpritemap_Ridley_FacingLeft_LegsHalfExtended 
    dw Inst_RidleyCeres_UpdateSamusPrevPosition_HeldYDisplacement 
    dw $0000,$0004 
    dw ExtendedSpritemap_Ridley_FacingLeft 
    dw Instruction_Common_Sleep 

UNUSED_InstList_RidleyCeres_FacingRight_Lunging_A6E576:
    dw Inst_RidleyCeres_UpdateSamusPrevPosition_HeldYDisplacement 
    dw $0000,$0004 
    dw ExtendedSpritemap_Ridley_FacingRight 
    dw Inst_RidleyCeres_UpdateSamusPrevPosition_HeldYDisplacement 
    dw $0002,$0006 
    dw ExtendedSpritemap_Ridley_FacingRight_LegsHalfExtended 
    dw Inst_RidleyCeres_UpdateSamusPrevPosition_HeldYDisplacement 
    dw $0004,$0050 
    dw ExtendedSpritemap_Ridley_FacingRight_LegsExtended 
    dw Inst_RidleyCeres_UpdateSamusPrevPosition_HeldYDisplacement 
    dw $0002,$0006 
    dw ExtendedSpritemap_Ridley_FacingRight_LegsHalfExtended 
    dw Inst_RidleyCeres_UpdateSamusPrevPosition_HeldYDisplacement 
    dw $0000,$0004 
    dw ExtendedSpritemap_Ridley_FacingRight 
    dw Instruction_Common_Sleep 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_RidleyCeres_FacingLeft_A6E5A0:
    dw Instruction_Ridley_GotoYIfNotFacingLeft 
    dw UNUSED_InstList_RidleyCeres_FacingRight_A6E5FE 
    dw Inst_RidleyCeres_UpdateSamusPrevPosition_HeldYDisplacement 
    dw $0000,$0002 
    dw ExtendedSpritemap_Ridley_FacingLeft 
    dw UNUSED_Instruction_RidleyCeres_GotoYIfHoldingBaby_A6E4F8 
    dw UNUSED_InstList_RidleyCeres_FacingLeft_HoldingBaby_A6E5B2 
    dw Instruction_CommonA6_Sleep 

UNUSED_InstList_RidleyCeres_FacingLeft_HoldingBaby_A6E5B2:
    dw Inst_RidleyCeres_UpdateSamusPrevPosition_HeldYDisplacement 
    dw $0002,$0003 
    dw ExtendedSpritemap_Ridley_FacingLeft_LegsHalfExtended 
    dw UNUSED_Instruction_RidleyCeres_GotoYIfHoldingBaby_A6E4F8 
    dw UNUSED_InstList_RidleyCeres_FacingLeft_HoldingBaby_A6E5C8 

UNUSED_InstList_RidleyCeres_FacingLeft_HoldingBaby_A6E5BE:
    dw $0001 
    dw ExtendedSpritemap_Ridley_FacingLeft_LegsHalfExtended 
    dw UNUSED_Instruction_RidleyCeres_GotoYIfNotHoldingBaby_A6E4EE 
    dw UNUSED_InstList_RidleyCeres_FacingLeft_HoldingBaby_A6E5BE 
    dw UNUSED_InstList_RidleyCeres_FacingLeft_HoldingBaby_A6E5F4 

UNUSED_InstList_RidleyCeres_FacingLeft_HoldingBaby_A6E5C8:
    dw Inst_RidleyCeres_UpdateSamusPrevPosition_HeldYDisplacement 
    dw $0004,$0004 
    dw ExtendedSpritemap_Ridley_FacingLeft_LegsExtended 
    dw UNUSED_Instruction_RidleyCeres_GotoYIfHoldingBaby_A6E4F8 
    dw UNUSED_InstList_RidleyCeres_FacingLeft_HoldingBaby_A6E5DE 

UNUSED_InstList_RidleyCeres_FacingLeft_HoldingBaby_A6E5D4:
    dw $0001 
    dw ExtendedSpritemap_Ridley_FacingLeft_LegsExtended 
    dw UNUSED_Instruction_RidleyCeres_GotoYIfNotHoldingBaby_A6E4EE 
    dw UNUSED_InstList_RidleyCeres_FacingLeft_HoldingBaby_A6E5D4 
    dw UNUSED_InstList_RidleyCeres_FacingLeft_HoldingBaby_A6E5DE 

UNUSED_InstList_RidleyCeres_FacingLeft_HoldingBaby_A6E5DE:
    dw Inst_RidleyCeres_UpdateSamusPrevPosition_HeldYDisplacement 
    dw $0002,$0003 
    dw ExtendedSpritemap_Ridley_FacingLeft_LegsHalfExtended 
    dw UNUSED_Instruction_RidleyCeres_GotoYIfHoldingBaby_A6E4F8 
    dw UNUSED_InstList_RidleyCeres_FacingLeft_HoldingBaby_A6E5F4 

UNUSED_InstList_RidleyCeres_FacingLeft_HoldingBaby_A6E5EA:
    dw $0001 
    dw ExtendedSpritemap_Ridley_FacingLeft_LegsHalfExtended 
    dw UNUSED_Instruction_RidleyCeres_GotoYIfNotHoldingBaby_A6E4EE 
    dw UNUSED_InstList_RidleyCeres_FacingLeft_HoldingBaby_A6E5EA 
    dw UNUSED_InstList_RidleyCeres_FacingLeft_HoldingBaby_A6E5F4 

UNUSED_InstList_RidleyCeres_FacingLeft_HoldingBaby_A6E5F4:
    dw Inst_RidleyCeres_UpdateSamusPrevPosition_HeldYDisplacement 
    dw $0000,$0002 
    dw ExtendedSpritemap_Ridley_FacingLeft 
    dw Instruction_Common_Sleep 

UNUSED_InstList_RidleyCeres_FacingRight_A6E5FE:
    dw Inst_RidleyCeres_UpdateSamusPrevPosition_HeldYDisplacement 
    dw $0000,$0002 
    dw ExtendedSpritemap_Ridley_FacingRight 
    dw UNUSED_Instruction_RidleyCeres_GotoYIfHoldingBaby_A6E4F8 
    dw UNUSED_InstList_RidleyCeres_FacingRight_HoldingBaby_A6E60C 
    dw Instruction_CommonA6_Sleep 

UNUSED_InstList_RidleyCeres_FacingRight_HoldingBaby_A6E60C:
    dw Inst_RidleyCeres_UpdateSamusPrevPosition_HeldYDisplacement 
    dw $0002,$0003 
    dw ExtendedSpritemap_Ridley_FacingRight_LegsHalfExtended 
    dw UNUSED_Instruction_RidleyCeres_GotoYIfHoldingBaby_A6E4F8 
    dw UNUSED_InstList_RidleyCeres_FacingRight_HoldingBaby_A6E622 

UNUSED_InstList_RidleyCeres_FacingRight_HoldingBaby_A6E618:
    dw $0001 
    dw ExtendedSpritemap_Ridley_FacingRight_LegsHalfExtended 
    dw UNUSED_Instruction_RidleyCeres_GotoYIfNotHoldingBaby_A6E4EE 
    dw UNUSED_InstList_RidleyCeres_FacingRight_HoldingBaby_A6E618 
    dw UNUSED_InstList_RidleyCeres_FacingRight_HoldingBaby_A6E64E 

UNUSED_InstList_RidleyCeres_FacingRight_HoldingBaby_A6E622:
    dw Inst_RidleyCeres_UpdateSamusPrevPosition_HeldYDisplacement 
    dw $0004,$0004 
    dw ExtendedSpritemap_Ridley_FacingRight_LegsExtended 
    dw UNUSED_Instruction_RidleyCeres_GotoYIfHoldingBaby_A6E4F8 
    dw UNUSED_InstList_RidleyCeres_FacingRight_HoldingBaby_A6E638 

UNUSED_InstList_RidleyCeres_FacingRight_HoldingBaby_A6E62E:
    dw $0001 
    dw ExtendedSpritemap_Ridley_FacingLeft_LegsExtended 
    dw UNUSED_Instruction_RidleyCeres_GotoYIfNotHoldingBaby_A6E4EE 
    dw UNUSED_InstList_RidleyCeres_FacingRight_HoldingBaby_A6E62E 
    dw UNUSED_InstList_RidleyCeres_FacingRight_HoldingBaby_A6E638 

UNUSED_InstList_RidleyCeres_FacingRight_HoldingBaby_A6E638:
    dw Inst_RidleyCeres_UpdateSamusPrevPosition_HeldYDisplacement 
    dw $0002,$0003 
    dw ExtendedSpritemap_Ridley_FacingRight_LegsHalfExtended 
    dw UNUSED_Instruction_RidleyCeres_GotoYIfHoldingBaby_A6E4F8 
    dw UNUSED_InstList_RidleyCeres_FacingRight_HoldingBaby_A6E64E 

UNUSED_InstList_RidleyCeres_FacingRight_HoldingBaby_A6E644:
    dw $0001 
    dw ExtendedSpritemap_Ridley_FacingLeft_LegsHalfExtended 
    dw UNUSED_Instruction_RidleyCeres_GotoYIfNotHoldingBaby_A6E4EE 
    dw UNUSED_InstList_RidleyCeres_FacingRight_HoldingBaby_A6E644 
    dw UNUSED_InstList_RidleyCeres_FacingRight_HoldingBaby_A6E64E 

UNUSED_InstList_RidleyCeres_FacingRight_HoldingBaby_A6E64E:
    dw Inst_RidleyCeres_UpdateSamusPrevPosition_HeldYDisplacement 
    dw $0000,$0002 
    dw ExtendedSpritemap_Ridley_FacingRight 
    dw Instruction_Common_Sleep 
endif ; !FEATURE_KEEP_UNREFERENCED

InstList_RidleyCeres_FacingLeft_ExtendLegs:
    dw Instruction_Ridley_GotoYIfNotFacingLeft 
    dw InstList_RidleyCeres_FacingRight_ExtendLegs 
    dw Inst_RidleyCeres_UpdateSamusPrevPosition_HeldYDisplacement 
    dw $0000,$0004 
    dw ExtendedSpritemap_Ridley_FacingLeft 
    dw Inst_RidleyCeres_UpdateSamusPrevPosition_HeldYDisplacement 
    dw $0002,$0006 
    dw ExtendedSpritemap_Ridley_FacingLeft_LegsHalfExtended 
    dw Inst_RidleyCeres_UpdateSamusPrevPosition_HeldYDisplacement 
    dw $0004,$0001 
    dw ExtendedSpritemap_Ridley_FacingLeft_LegsExtended 
    dw Instruction_Common_Sleep 

InstList_RidleyCeres_FacingRight_ExtendLegs:
    dw Inst_RidleyCeres_UpdateSamusPrevPosition_HeldYDisplacement 
    dw $0000,$0004 
    dw ExtendedSpritemap_Ridley_FacingRight 
    dw Inst_RidleyCeres_UpdateSamusPrevPosition_HeldYDisplacement 
    dw $0002,$0006 
    dw ExtendedSpritemap_Ridley_FacingRight_LegsHalfExtended 
    dw Inst_RidleyCeres_UpdateSamusPrevPosition_HeldYDisplacement 
    dw $0004,$0001 
    dw ExtendedSpritemap_Ridley_FacingRight_LegsExtended 
    dw Instruction_Common_Sleep 

InstList_Ridley_FacingLeft_OpeningRoar:
    dw Instruction_Ridley_GotoYIfNotFacingLeft 
    dw InstList_Ridley_FacingRight_OpeningRoar 
    dw $0006 
    dw ExtendedSpritemap_Ridley_FacingLeft 
    dw Instruction_Ridley_QueueRoarSFX 
    dw $0008 
    dw ExtendedSpritemap_Ridley_FacingLeft_MouthHalfOpen 
    dw $0060 
    dw ExtendedSpritemap_Ridley_FacingLeft_MouthOpen 
    dw $0008 
    dw ExtendedSpritemap_Ridley_FacingLeft_MouthHalfOpen 
    dw Instruction_Ridley_ResetRoarFlag 
    dw $0001 
    dw ExtendedSpritemap_Ridley_FacingLeft 
    dw Instruction_CommonA6_Sleep 

InstList_Ridley_FacingRight_OpeningRoar:
    dw $0006 
    dw ExtendedSpritemap_Ridley_FacingRight 
    dw Instruction_Ridley_QueueRoarSFX 
    dw $0008 
    dw ExtendedSpritemap_Ridley_FacingRight_MouthHalfOpen 
    dw $0060 
    dw ExtendedSpritemap_Ridley_FacingRight_MouthOpen 
    dw $0008 
    dw ExtendedSpritemap_Ridley_FacingRight_MouthHalfOpen 
    dw Instruction_Ridley_ResetRoarFlag 
    dw $0001 
    dw ExtendedSpritemap_Ridley_FacingRight 
    dw Instruction_Common_Sleep 

InstList_Ridley_FacingLeft_DeathRoar:
    dw Instruction_Ridley_GotoYIfNotFacingLeft 
    dw InstList_Ridley_FacingRight_DeathRoar 
    dw $0006 
    dw ExtendedSpritemap_Ridley_FacingLeft 
    dw Instruction_Ridley_QueueRoarSFX 
    dw $0008 
    dw ExtendedSpritemap_Ridley_FacingLeft_MouthHalfOpen 
    dw $0010 
    dw ExtendedSpritemap_Ridley_FacingLeft_MouthOpen 
    dw Instruction_Ridley_ResetRoarFlag 
    dw Instruction_Common_Sleep 

InstList_Ridley_FacingRight_DeathRoar:
    dw $0006 
    dw ExtendedSpritemap_Ridley_FacingRight 
    dw Instruction_Ridley_QueueRoarSFX 
    dw $0008 
    dw ExtendedSpritemap_Ridley_FacingRight_MouthHalfOpen 
    dw $0010 
    dw ExtendedSpritemap_Ridley_FacingRight_MouthOpen 
    dw Instruction_Ridley_ResetRoarFlag 
    dw Instruction_Common_Sleep 

InstList_Ridley_TurnFromLeftToRight:
    dw Instruction_Ridley_SetDirectionToForwardTurning 
    dw $0001 
    dw ExtendedSpritemap_Ridley_FacingLeft 
    dw $0008 
    dw ExtendedSpritemap_Ridley_FacingForward 
    dw Instruction_Ridley_SetDirectionToRight_UpdateTailParts 
    dw $0001 
    dw ExtendedSpritemap_Ridley_FacingForward 
    dw $0001 
    dw ExtendedSpritemap_Ridley_FacingRight 
    dw Instruction_CommonA6_Sleep 

InstList_Ridley_TurnFromRightToLeft:
    dw Instruction_Ridley_SetDirectionToForwardTurning 
    dw $0001 
    dw ExtendedSpritemap_Ridley_FacingRight 
    dw $0008 
    dw ExtendedSpritemap_Ridley_FacingForward 
    dw Instruction_Ridley_SetDirectionToLeft_UpdateTailParts 
    dw $0001 
    dw ExtendedSpritemap_Ridley_FacingForward 
    dw $0001 
    dw ExtendedSpritemap_Ridley_FacingLeft 
    dw Instruction_Common_Sleep 

Instruction_Ridley_SetDirectionToLeft_UpdateTailParts:
    LDA.W #$0000 : STA.L $7E7820 
    JSR.W Update_TailRotationDirection_Angle_DistanceFromRidley 
    RTL 


Instruction_Ridley_SetDirectionToForwardTurning:
    LDA.W #$0001 : STA.L $7E7820 
    RTL 


Instruction_Ridley_SetDirectionToRight_UpdateTailParts:
    LDA.W #$0002 : STA.L $7E7820 
    JSR.W Update_TailRotationDirection_Angle_DistanceFromRidley 
    RTL 


InstList_Ridley_FacingLeft_Fireballing_0:
    dw Instruction_Ridley_GotoYIfNotFacingLeft 
    dw InstList_Ridley_FacingRight_Fireballing_0 
    dw Inst_Ridley_GotoYAndSetTimerTo8IfNotNorfairOrSamusLowEnergy 
    dw InstList_Ridley_FacingLeft_Fireballing_1 
    dw $0008 
    dw ExtendedSpritemap_Ridley_FacingLeft 
    dw Instruction_Ridley_QueueRoarSFX 
    dw $0008 
    dw ExtendedSpritemap_Ridley_FacingLeft_MouthHalfOpen 
    dw $0002 
    dw ExtendedSpritemap_Ridley_FacingLeft_MouthOpen 
    dw Instruction_Ridley_CalculateFireballAngleAndXYSpeeds 
    dw FireLeadsFireball 
    dw $0005 
    dw ExtendedSpritemap_Ridley_FacingLeft_MouthOpen 
    dw Instruction_Ridley_CalculateFireballAngleAndXYSpeeds 
    dw FireTrailsFireball 
    dw $0005 
    dw ExtendedSpritemap_Ridley_FacingLeft_MouthOpen 
    dw Instruction_Ridley_CalculateFireballAngleAndXYSpeeds 
    dw FireTrailsFireball 
    dw $0005 
    dw ExtendedSpritemap_Ridley_FacingLeft_MouthOpen 
    dw Instruction_Ridley_CalculateFireballAngleAndXYSpeeds 
    dw FireTrailsFireball 
    dw $0030 
    dw ExtendedSpritemap_Ridley_FacingLeft_MouthOpen 
    dw $0008 
    dw ExtendedSpritemap_Ridley_FacingLeft_MouthHalfOpen 
    dw Inst_Ridley_GotoYAndSetTimerTo8IfNotNorfairOrSamusLowEnergy 
    dw InstList_Ridley_FacingLeft_Fireballing_1 
    dw $0020 
    dw ExtendedSpritemap_Ridley_FacingLeft 
    dw Instruction_Ridley_CalculateFireballAngleAndXYSpeeds 
    dw Instruction_Ridley_QueueRoarSFX 
    dw $0008 
    dw ExtendedSpritemap_Ridley_FacingLeft_MouthHalfOpen 
    dw $0002 
    dw ExtendedSpritemap_Ridley_FacingLeft_MouthOpen 
    dw Instruction_Ridley_CalculateFireballAngleAndXYSpeeds 
    dw FireLeadsFireball 
    dw $0005 
    dw ExtendedSpritemap_Ridley_FacingLeft_MouthOpen 
    dw Instruction_Ridley_CalculateFireballAngleAndXYSpeeds 
    dw FireTrailsFireball 
    dw $0005 
    dw ExtendedSpritemap_Ridley_FacingLeft_MouthOpen 
    dw Instruction_Ridley_CalculateFireballAngleAndXYSpeeds 
    dw FireTrailsFireball 
    dw $0005 
    dw ExtendedSpritemap_Ridley_FacingLeft_MouthOpen 
    dw Instruction_Ridley_CalculateFireballAngleAndXYSpeeds 
    dw FireTrailsFireball 
    dw $0030 
    dw ExtendedSpritemap_Ridley_FacingLeft_MouthOpen 
    dw $0008 
    dw ExtendedSpritemap_Ridley_FacingLeft_MouthHalfOpen 

InstList_Ridley_FacingLeft_Fireballing_1:
    dw Instruction_Ridley_ResetRoarFlag 
    dw $0001 
    dw ExtendedSpritemap_Ridley_FacingLeft 
    dw Instruction_Common_Sleep 

InstList_Ridley_FacingRight_Fireballing_0:
    dw Inst_Ridley_GotoYAndSetTimerTo8IfNotNorfairOrSamusLowEnergy 
    dw InstList_Ridley_FacingRight_Fireballing_1 
    dw $0008 
    dw ExtendedSpritemap_Ridley_FacingRight 
    dw Instruction_Ridley_QueueRoarSFX 
    dw $0008 
    dw ExtendedSpritemap_Ridley_FacingRight_MouthHalfOpen 
    dw $0002 
    dw ExtendedSpritemap_Ridley_FacingRight_MouthOpen 
    dw Instruction_Ridley_CalculateFireballAngleAndXYSpeeds 
    dw FireLeadsFireball 
    dw $0005 
    dw ExtendedSpritemap_Ridley_FacingRight_MouthOpen 
    dw Instruction_Ridley_CalculateFireballAngleAndXYSpeeds 
    dw FireTrailsFireball 
    dw $0005 
    dw ExtendedSpritemap_Ridley_FacingRight_MouthOpen 
    dw Instruction_Ridley_CalculateFireballAngleAndXYSpeeds 
    dw FireTrailsFireball 
    dw $0005 
    dw ExtendedSpritemap_Ridley_FacingRight_MouthOpen 
    dw Instruction_Ridley_CalculateFireballAngleAndXYSpeeds 
    dw FireTrailsFireball 
    dw $0030 
    dw ExtendedSpritemap_Ridley_FacingRight_MouthOpen 
    dw $0008 
    dw ExtendedSpritemap_Ridley_FacingRight_MouthHalfOpen 
    dw Inst_Ridley_GotoYAndSetTimerTo8IfNotNorfairOrSamusLowEnergy 
    dw InstList_Ridley_FacingRight_Fireballing_1 
    dw $0020 
    dw ExtendedSpritemap_Ridley_FacingRight 
    dw Instruction_Ridley_QueueRoarSFX 
    dw $0008 
    dw ExtendedSpritemap_Ridley_FacingRight_MouthHalfOpen 
    dw $0002 
    dw ExtendedSpritemap_Ridley_FacingRight_MouthOpen 
    dw Instruction_Ridley_CalculateFireballAngleAndXYSpeeds 
    dw FireLeadsFireball 
    dw $0005 
    dw ExtendedSpritemap_Ridley_FacingRight_MouthOpen 
    dw Instruction_Ridley_CalculateFireballAngleAndXYSpeeds 
    dw FireTrailsFireball 
    dw $0005 
    dw ExtendedSpritemap_Ridley_FacingRight_MouthOpen 
    dw Instruction_Ridley_CalculateFireballAngleAndXYSpeeds 
    dw FireTrailsFireball 
    dw $0005 
    dw ExtendedSpritemap_Ridley_FacingRight_MouthOpen 
    dw Instruction_Ridley_CalculateFireballAngleAndXYSpeeds 
    dw FireTrailsFireball 
    dw $0030 
    dw ExtendedSpritemap_Ridley_FacingRight_MouthOpen 
    dw $0008 
    dw ExtendedSpritemap_Ridley_FacingRight_MouthHalfOpen 

InstList_Ridley_FacingRight_Fireballing_1:
    dw Instruction_Ridley_ResetRoarFlag 
    dw $0001 
    dw ExtendedSpritemap_Ridley_FacingRight 
    dw Instruction_Common_Sleep 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_SpawnUnusedEnemyProjectiles_A6E828:
    LDA.W #$0000 
    JSL.L UNUSED_SpawnUnusedEnemyProjectile_A6E840 
    LDA.W #$0001 
    JSL.L UNUSED_SpawnUnusedEnemyProjectile_A6E840 
    LDA.W #$0002 
    JSL.L UNUSED_SpawnUnusedEnemyProjectile_A6E840 
    LDA.W #$0003 

UNUSED_SpawnUnusedEnemyProjectile_A6E840:
    STA.W $0FB4 
    PHY 
    LDY.W #UNUSED_EnemyProjectile_Ridley_869634 
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    PLY 
    RTL 
endif ; !FEATURE_KEEP_UNREFERENCED


Instruction_Ridley_CalculateFireballAngleAndXYSpeeds:
    PHX 
    PHY 
    LDA.L $7E7820 
    BNE .facingRight 
    LDA.W #$FFE7 
    CLC 
    ADC.W $0F7A 
    STA.B $12 
    LDA.W $0AF6 
    SEC 
    SBC.B $12 
    STA.B $12 
    LDA.W #$FFD5 
    CLC 
    ADC.W $0F7E 
    STA.B $14 
    LDA.W $0AFA 
    SEC 
    SBC.B $14 
    STA.B $14 
    JSL.L CalculateAngleOf_12_14_Offset 
    SEC 
    SBC.W #$0080 
    EOR.W #$FFFF 
    INC A 
    AND.W #$00FF 
    CMP.W #$00B0 
    BCS .checkEB 
    CMP.W #$0040 
    BCC .loadEB 
    LDA.W #$00B0 
    BRA + 


.checkEB:
    CMP.W #$00EB 
    BCC + 

.loadEB:
    LDA.W #$00EB 

  + STA.B $12 
    BRA .merge 


.facingRight:
    LDA.W #$0019 
    CLC 
    ADC.W $0F7A 
    STA.B $12 
    LDA.W $0AF6 
    SEC 
    SBC.B $12 
    STA.B $12 
    LDA.W #$FFD5 
    CLC 
    ADC.W $0F7E 
    STA.B $14 
    LDA.W $0AFA 
    SEC 
    SBC.B $14 
    STA.B $14 
    JSL.L CalculateAngleOf_12_14_Offset 
    SEC 
    SBC.W #$0080 
    EOR.W #$FFFF 
    INC A 
    AND.W #$00FF 
    CMP.W #$0050 
    BCC .check15 
    CMP.W #$00C0 
    BCS .load15 
    LDA.W #$0050 
    BRA + 


.check15:
    CMP.W #$0015 
    BCS + 

.load15:
    LDA.W #$0015 

  + STA.B $12 

.merge:
    LDA.W #$0500 
    JSL.L Math_86C26C 
    STA.L $7E7832 
    LDA.W #$0500 
    JSL.L Math_86C272 
    STA.L $7E7834 
    PLY 
    PLX 
    RTL 


FireLeadsFireball:
    LDA.W #$0000 
    BRA SpawnRidleyFireball 


FireTrailsFireball:
    LDA.W #$000E 

SpawnRidleyFireball:
    STA.W $1995 
    LDA.L $7E7820 
    PHY 
    LDY.W #EnemyProjectile_RidleysFireball 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    PLY 
    RTL 


InstList_RidleyCeres_FacingLeft_FlyUp_StartMainAI:
    dw Instruction_Ridley_GotoYIfNotFacingLeft 
    dw InstList_RidleyCeres_FacingRight_FlyUp_StartMainAI 
    dw $0003 
    dw ExtendedSpritemap_Ridley_FacingLeft 
    dw Instruction_Ridley_MoveRidleyWithArgsInY 
    dw $0001,$FFF4,$0004 
    dw ExtendedSpritemap_Ridley_FacingLeft_LegsHalfExtended 
    dw Instruction_Ridley_MoveRidleyWithArgsInY 
    dw $FFFC,$FFF8,$0005 
    dw ExtendedSpritemap_Ridley_FacingLeft_LegsExtended 
    dw Instruction_RidleyCeres_SetRidleyMainAI_SetVerticalSpeed 
    dw $0011 
    dw ExtendedSpritemap_Ridley_FacingLeft_LegsHalfExtended 
    dw $0011 
    dw ExtendedSpritemap_Ridley_FacingLeft 
    dw Instruction_Common_Sleep 

InstList_RidleyCeres_FacingRight_FlyUp_StartMainAI:
    dw $0003 
    dw ExtendedSpritemap_Ridley_FacingRight 
    dw Instruction_Ridley_MoveRidleyWithArgsInY 
    dw $FFFF,$FFF4,$0004 
    dw ExtendedSpritemap_Ridley_FacingRight_LegsHalfExtended 
    dw Instruction_Ridley_MoveRidleyWithArgsInY 
    dw $0004,$FFF8,$0005 
    dw ExtendedSpritemap_Ridley_FacingRight_LegsExtended 
    dw Instruction_Ridley_SetRidleyMainAI_SetVerticalSpeed 
    dw $0011 
    dw ExtendedSpritemap_Ridley_FacingRight_LegsHalfExtended 
    dw $0011 
    dw ExtendedSpritemap_Ridley_FacingRight 
    dw Instruction_Common_Sleep 

Instruction_RidleyCeres_SetRidleyMainAI_SetVerticalSpeed:
    LDA.W #Function_RidleyCeres_StartupLiftoff_FacingLeft : STA.W $0FA8 
    LDA.W #$FEA0 : STA.W $0FAC 
    RTL 


Instruction_Ridley_SetRidleyMainAI_SetVerticalSpeed:
    LDA.W #Function_Ridley_Startup_Liftoff_FacingRight : STA.W $0FA8 
    LDA.W #$FEA0 : STA.W $0FAC 
    RTL 


ExtendedSpritemap_Ridley_FacingLeft:
    dw $0004,$000F,$0016 
    dw Spritemap_Ridley_FacingLeft_Legs_PulledUp 
    dw Hitbox_Ridley_FacingLeft_LegsPulledUp 
    dw $FFF8,$0007 
    dw Spritemap_Ridley_FacingLeft_Claws 
    dw Hitbox_Ridley_FacingLeft_Claws 
    dw $0010,$0000 
    dw Spritemap_Ridley_FacingLeft_Torso 
    dw Hitbox_Ridley_FacingLeft_Torso 
    dw $FFFD,$FFE8 
    dw Spritemap_Ridley_FacingLeft_HeadNeck_MouthClosed 
    dw Hitbox_Ridley_FacingLeft_MouthClosed 

ExtendedSpritemap_Ridley_FacingRight:
    dw $0004,$FFF1,$0016 
    dw Spritemap_Ridley_FacingRight_Legs_PulledUp 
    dw Hitbox_Ridley_FacingRight_LegsPulledUp 
    dw $0008,$0007 
    dw Spritemap_Ridley_FacingRight_Claws 
    dw Hitbox_Ridley_FacingRight_Claws 
    dw $FFF0,$0000 
    dw Spritemap_Ridley_FacingRight_Torso 
    dw Hitbox_Ridley_FacingRight_Torso 
    dw $0003,$FFE8 
    dw Spritemap_Ridley_FacingRight_HeadNeck_MouthClosed 
    dw Hitbox_Ridley_FacingRight_MouthClosed 

ExtendedSpritemap_Ridley_FacingLeft_MouthHalfOpen:
    dw $0004,$000F,$0016 
    dw Spritemap_Ridley_FacingLeft_Legs_PulledUp 
    dw Hitbox_Ridley_FacingLeft_LegsPulledUp 
    dw $FFF8,$0007 
    dw Spritemap_Ridley_FacingLeft_Claws 
    dw Hitbox_Ridley_FacingLeft_Claws 
    dw $0010,$0000 
    dw Spritemap_Ridley_FacingLeft_Torso 
    dw Hitbox_Ridley_FacingLeft_Torso 
    dw $FFFD,$FFE8 
    dw Spritemap_Ridley_FacingLeft_HeadNeck_MouthHalfOpened 
    dw Hitbox_Ridley_FacingLeft_MouthHalfOpen 

ExtendedSpritemap_Ridley_FacingLeft_MouthOpen:
    dw $0004,$000F,$0016 
    dw Spritemap_Ridley_FacingLeft_Legs_PulledUp 
    dw Hitbox_Ridley_FacingLeft_LegsPulledUp 
    dw $FFF8,$0007 
    dw Spritemap_Ridley_FacingLeft_Claws 
    dw Hitbox_Ridley_FacingLeft_Claws 
    dw $0010,$0000 
    dw Spritemap_Ridley_FacingLeft_Torso 
    dw Hitbox_Ridley_FacingLeft_Torso 
    dw $FFFD,$FFE8 
    dw Spritemap_Ridley_FacingLeft_HeadNeck_MouthOpen 
    dw Hitbox_Ridley_FacingLeft_MouthOpen 

ExtendedSpritemap_Ridley_FacingRight_MouthHalfOpen:
    dw $0004,$FFF1,$0016 
    dw Spritemap_Ridley_FacingRight_Legs_PulledUp 
    dw Hitbox_Ridley_FacingRight_LegsPulledUp 
    dw $0008,$0007 
    dw Spritemap_Ridley_FacingRight_Claws 
    dw Hitbox_Ridley_FacingRight_Claws 
    dw $FFF0,$0000 
    dw Spritemap_Ridley_FacingRight_Torso 
    dw Hitbox_Ridley_FacingRight_Torso 
    dw $0003,$FFE8 
    dw Spritemap_Ridley_FacingRight_HeadNeck_MouthHalfOpened 
    dw Hitbox_Ridley_FacingRight_MouthHalfOpened 

ExtendedSpritemap_Ridley_FacingRight_MouthOpen:
    dw $0004,$FFF1,$0016 
    dw Spritemap_Ridley_FacingRight_Legs_PulledUp 
    dw Hitbox_Ridley_FacingRight_LegsPulledUp 
    dw $0008,$0007 
    dw Spritemap_Ridley_FacingRight_Claws 
    dw Hitbox_Ridley_FacingRight_Claws 
    dw $FFF0,$0000 
    dw Spritemap_Ridley_FacingRight_Torso 
    dw Hitbox_Ridley_FacingRight_Torso 
    dw $0003,$FFE8 
    dw Spritemap_Ridley_FacingRight_HeadNeck_MouthOpen 
    dw Hitbox_Ridley_FacingRight_MouthOpen 

ExtendedSpritemap_Ridley_FacingLeft_LegsHalfExtended:
    dw $0004,$000F,$0016 
    dw Spritemap_Ridley_FacingLeft_Legs_HalfExtended 
    dw Hitbox_Ridley_FacingLeft_LegsHalfExtended 
    dw $FFF8,$0007 
    dw Spritemap_Ridley_FacingLeft_Claws 
    dw Hitbox_Ridley_FacingLeft_Claws 
    dw $0010,$0000 
    dw Spritemap_Ridley_FacingLeft_Torso 
    dw Hitbox_Ridley_FacingLeft_Torso 
    dw $FFFD,$FFE8 
    dw Spritemap_Ridley_FacingLeft_HeadNeck_MouthClosed 
    dw Hitbox_Ridley_FacingLeft_MouthClosed 

ExtendedSpritemap_Ridley_FacingLeft_LegsExtended:
    dw $0004,$000F,$0016 
    dw Spritemap_Ridley_FacingLeft_Legs_Extended 
    dw Hitbox_Ridley_FacingLeft_LegsExtended 
    dw $FFF8,$0007 
    dw Spritemap_Ridley_FacingLeft_Claws 
    dw Hitbox_Ridley_FacingLeft_Claws 
    dw $0010,$0000 
    dw Spritemap_Ridley_FacingLeft_Torso 
    dw Hitbox_Ridley_FacingLeft_Torso 
    dw $FFFD,$FFE8 
    dw Spritemap_Ridley_FacingLeft_HeadNeck_MouthClosed 
    dw Hitbox_Ridley_FacingLeft_MouthClosed 

ExtendedSpritemap_Ridley_FacingRight_LegsHalfExtended:
    dw $0004,$FFF1,$0016 
    dw Spritemap_Ridley_FacingRight_Legs_HalfExtended 
    dw Hitbox_Ridley_FacingRight_LegsHalfExtended 
    dw $0008,$0007 
    dw Spritemap_Ridley_FacingRight_Claws 
    dw Hitbox_Ridley_FacingRight_Claws 
    dw $FFF0,$0000 
    dw Spritemap_Ridley_FacingRight_Torso 
    dw Hitbox_Ridley_FacingRight_Torso 
    dw $0003,$FFE8 
    dw Spritemap_Ridley_FacingRight_HeadNeck_MouthClosed 
    dw Hitbox_Ridley_FacingRight_MouthClosed 

ExtendedSpritemap_Ridley_FacingRight_LegsExtended:
    dw $0004,$FFF1,$0016 
    dw Spritemap_Ridley_FacingRight_Legs_Extended 
    dw Hitbox_Ridley_FacingRight_LegsExtended 
    dw $0008,$0007 
    dw Spritemap_Ridley_FacingRight_Claws 
    dw Hitbox_Ridley_FacingRight_Claws 
    dw $FFF0,$0000 
    dw Spritemap_Ridley_FacingRight_Torso 
    dw Hitbox_Ridley_FacingRight_Torso 
    dw $0003,$FFE8 
    dw Spritemap_Ridley_FacingRight_HeadNeck_MouthClosed 
    dw Hitbox_Ridley_FacingRight_MouthClosed 

ExtendedSpritemap_Ridley_FacingForward:
    dw $0001,$0000,$FFFA 
    dw Spritemap_Ridley_FacingForward 
    dw Hitbox_Ridley_FacingForward 

Hitbox_Ridley_FacingLeft_MouthClosed:
    dw $0002,$FFF4,$FFE6,$000B,$000D 
    dw RidleyHitbox_vs_Samus_Collision 
    dw EnemyShot_Ridley 
    dw $FFE8,$0003,$FFF3,$0015 
    dw RidleyHitbox_vs_Samus_Collision 
    dw EnemyShot_Ridley 

Hitbox_Ridley_FacingLeft_MouthHalfOpen:
    dw $0002,$FFD7,$FFED,$FFEB,$FFF7 
    dw RidleyHitbox_vs_Samus_Collision 
    dw EnemyShot_Ridley 
    dw $FFEC,$FFE3,$000B,$0005 
    dw RidleyHitbox_vs_Samus_Collision 
    dw EnemyShot_Ridley 

Hitbox_Ridley_FacingLeft_MouthOpen:
    dw $0002,$FFDB,$FFD8,$FFF2,$FFE1 
    dw RidleyHitbox_vs_Samus_Collision 
    dw EnemyShot_Ridley 
    dw $FFE7,$FFE1,$0009,$0006 
    dw RidleyHitbox_vs_Samus_Collision 
    dw EnemyShot_Ridley 

Hitbox_Ridley_FacingLeft_LegsPulledUp:
    dw $0001,$FFF1,$FFF6,$0007,$0002 
    dw RidleyHitbox_vs_Samus_Collision 
    dw EnemyShot_Ridley 

Hitbox_Ridley_FacingLeft_LegsHalfExtended:
    dw $0001,$FFEF,$FFF7,$0006,$000F 
    dw RidleyHitbox_vs_Samus_Collision 
    dw EnemyShot_Ridley 

Hitbox_Ridley_FacingLeft_LegsExtended:
    dw $0001,$FFF2,$FFFF,$000A,$0017 
    dw RidleyHitbox_vs_Samus_Collision 
    dw EnemyShot_Ridley 

Hitbox_Ridley_FacingLeft_Claws:
    dw $0001,$FFF1,$FFFE,$FFFF,$0008 
    dw RidleyHitbox_vs_Samus_Collision 
    dw EnemyShot_Ridley 

Hitbox_Ridley_FacingLeft_Torso:
    dw $0001,$FFF0,$FFEC,$000C,$0015 
    dw RidleyHitbox_vs_Samus_Collision 
    dw EnemyShot_Ridley 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Hitbox_Ridley_FacingLeft_A6EB75:
    dw $0001,$FFF0,$FFEC,$000C,$0015 
    dw RidleyHitbox_vs_Samus_Collision 
    dw EnemyShot_Ridley 

UNUSED_Hitbox_Ridley_FacingLeft_A6EB83:
    dw $0001,$FFF0,$FFEC,$000C,$0015 
    dw RidleyHitbox_vs_Samus_Collision 
    dw EnemyShot_Ridley 
endif ; !FEATURE_KEEP_UNREFERENCED

Hitbox_Ridley_FacingForward:
    dw $0002,$FFF0,$FFE0,$0010,$0022 
    dw RidleyHitbox_vs_Samus_Collision 
    dw EnemyShot_Ridley 
    dw $FFF8,$FFD3,$0008,$FFDF 
    dw RidleyHitbox_vs_Samus_Collision 
    dw EnemyShot_Ridley 

Hitbox_Ridley_FacingRight_MouthClosed:
    dw $0002,$FFF4,$FFE7,$000B,$000D 
    dw RidleyHitbox_vs_Samus_Collision 
    dw EnemyShot_Ridley 
    dw $000C,$0005,$0018,$0014 
    dw RidleyHitbox_vs_Samus_Collision 
    dw EnemyShot_Ridley 

Hitbox_Ridley_FacingRight_MouthHalfOpened:
    dw $0002,$FFF3,$FFE3,$0014,$0005 
    dw RidleyHitbox_vs_Samus_Collision 
    dw EnemyShot_Ridley 
    dw $0015,$FFEE,$0027,$FFF8 
    dw RidleyHitbox_vs_Samus_Collision 
    dw EnemyShot_Ridley 

Hitbox_Ridley_FacingRight_MouthOpen:
    dw $0002,$FFF6,$FFE1,$0019,$0008 
    dw RidleyHitbox_vs_Samus_Collision 
    dw EnemyShot_Ridley 
    dw $000D,$FFD6,$0023,$FFE0 
    dw RidleyHitbox_vs_Samus_Collision 
    dw EnemyShot_Ridley 

Hitbox_Ridley_FacingRight_LegsPulledUp:
    dw $0001,$FFF6,$FFF6,$0011,$0002 
    dw RidleyHitbox_vs_Samus_Collision 
    dw EnemyShot_Ridley 

Hitbox_Ridley_FacingRight_LegsHalfExtended:
    dw $0001,$FFF7,$FFF8,$0011,$000F 
    dw RidleyHitbox_vs_Samus_Collision 
    dw EnemyShot_Ridley 

Hitbox_Ridley_FacingRight_LegsExtended:
    dw $0001,$FFF5,$FFF8,$000E,$0017 
    dw RidleyHitbox_vs_Samus_Collision 
    dw EnemyShot_Ridley 

Hitbox_Ridley_FacingRight_Claws:
    dw $0001,$0001,$FFFE,$000E,$0009 
    dw RidleyHitbox_vs_Samus_Collision 
    dw EnemyShot_Ridley 

Hitbox_Ridley_FacingRight_Torso:
    dw $0001,$FFF3,$FFEA,$000E,$0015 
    dw RidleyHitbox_vs_Samus_Collision 
    dw EnemyShot_Ridley 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Hitbox_Ridley_FacingRight_A6EC3F:
    dw $0001,$FFF3,$FFEA,$000E,$0015 
    dw RidleyHitbox_vs_Samus_Collision 
    dw EnemyShot_Ridley 

UNUSED_Hitbox_Ridley_FacingRight_A6EC4D:
    dw $0001,$FFF3,$FFEA,$000E,$0015 
    dw RidleyHitbox_vs_Samus_Collision 
    dw EnemyShot_Ridley 
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_Ridley_FacingLeft_HeadNeck_MouthClosed:
    dw $000C,$01E4 
    db $12 
    dw $3154,$0004 
    db $0A 
    dw $3159,$0004 
    db $02 
    dw $3149,$01FC 
    db $0A 
    dw $317B,$01F4 
    db $0A 
    dw $317A,$01FC 
    db $02 
    dw $316B,$01F4 
    db $02 
    dw $316A,$81E4 
    db $02 
    dw $3168,$81FC 
    db $F2 
    dw $3166,$81EC 
    db $F2 
    dw $3164,$8004 
    db $E2 
    dw $3162,$81F4 
    db $E2 
    dw $3160 

Spritemap_Ridley_FacingLeft_HeadNeck_MouthHalfOpened:
    dw $000D,$0006 
    db $F0 
    dw $314A,$01F6 
    db $08 
    dw $31BB,$01F6 
    db $00 
    dw $313D,$0006 
    db $F8 
    dw $315A,$81FE 
    db $00 
    dw $3188,$81F6 
    db $F0 
    dw $3186,$01EE 
    db $00 
    dw $3156,$01E6 
    db $00 
    dw $3155,$81E6 
    db $F0 
    dw $3184,$8006 
    db $E0 
    dw $3182,$81F6 
    db $E0 
    dw $3180,$81E6 
    db $E0 
    dw $316E,$81D6 
    db $E8 
    dw $316C 

Spritemap_Ridley_FacingLeft_HeadNeck_MouthOpen:
    dw $000F,$01E0 
    db $05 
    dw $3158,$0000 
    db $DD 
    dw $314B,$01E8 
    db $05 
    dw $3138,$01F8 
    db $05 
    dw $313A,$01F0 
    db $05 
    dw $3139,$0008 
    db $05 
    dw $313C,$0000 
    db $05 
    dw $313B,$01D8 
    db $D5 
    dw $3157,$8000 
    db $F5 
    dw $31A5,$81F8 
    db $F5 
    dw $31A4,$81E8 
    db $F5 
    dw $31A2,$8000 
    db $E5 
    dw $31A0,$81F0 
    db $E5 
    dw $318E,$81F0 
    db $D5 
    dw $318C,$81E0 
    db $D5 
    dw $318A 

Spritemap_Ridley_FacingLeft_Legs_PulledUp:
    dw $0007,$81FA 
    db $FF 
    dw $31AE,$81EA 
    db $FF 
    dw $31AC,$0008 
    db $F8 
    dw $31BA,$0000 
    db $F8 
    dw $31B9,$0008 
    db $F0 
    dw $31AA,$0000 
    db $F0 
    dw $31A9,$81F0 
    db $F0 
    dw $31A7 

Spritemap_Ridley_FacingLeft_Legs_HalfExtended:
    dw $0006,$01F9 
    db $04 
    dw $31AB,$01F1 
    db $04 
    dw $315B,$81F9 
    db $0B 
    dw $31AE,$81E9 
    db $0B 
    dw $31AC,$81FE 
    db $F4 
    dw $31C2,$81EE 
    db $F4 
    dw $31C0 

Spritemap_Ridley_FacingLeft_Legs_Extended:
    dw $0006,$01EF 
    db $08 
    dw $31BB,$81F7 
    db $08 
    dw $31CE,$81FD 
    db $13 
    dw $31AE,$81ED 
    db $13 
    dw $31AC,$81FE 
    db $F8 
    dw $31C6,$81EE 
    db $F8 
    dw $31C4 

Spritemap_Ridley_FacingLeft_Claws:
    dw $0001,$81F0 
    db $FC 
    dw $3140 

Spritemap_Ridley_FacingLeft_Torso:
    dw $0006,$81E8 
    db $03 
    dw $31CC,$81F0 
    db $F8 
    dw $3120,$8000 
    db $F8 
    dw $3122,$81FE 
    db $06 
    dw $3122,$8000 
    db $E8 
    dw $3102,$81F0 
    db $E8 
    dw $3100 

Spritemap_Ridley_FacingForward:
    dw $0020,$0000 
    db $20 
    dw $70FB,$0010 
    db $20 
    dw $70EA,$0010 
    db $18 
    dw $70FA,$0008 
    db $20 
    dw $70EB,$0008 
    db $D8 
    dw $70F0,$0010 
    db $00 
    dw $70E0,$0010 
    db $F8 
    dw $70FD,$0010 
    db $F0 
    dw $70ED,$0000 
    db $D8 
    dw $70F1,$0000 
    db $D0 
    dw $70E1,$0010 
    db $E8 
    dw $70FC,$0010 
    db $E0 
    dw $70EC,$8000 
    db $10 
    dw $70E8,$8000 
    db $00 
    dw $70E6,$8000 
    db $F0 
    dw $70E4,$8000 
    db $E0 
    dw $70E2,$01F8 
    db $20 
    dw $30FB,$01E8 
    db $20 
    dw $30EA,$01E8 
    db $18 
    dw $30FA,$01F0 
    db $20 
    dw $30EB,$01F0 
    db $D8 
    dw $30F0,$01E8 
    db $00 
    dw $30E0,$01E8 
    db $F8 
    dw $30FD,$01E8 
    db $F0 
    dw $30ED,$01F8 
    db $D8 
    dw $30F1,$01F8 
    db $D0 
    dw $30E1,$01E8 
    db $E8 
    dw $30FC,$01E8 
    db $E0 
    dw $30EC,$81F0 
    db $10 
    dw $30E8,$81F0 
    db $00 
    dw $30E6,$81F0 
    db $F0 
    dw $30E4,$81F0 
    db $E0 
    dw $30E2 

Spritemap_Ridley_FacingRight_HeadNeck_MouthClosed:
    dw $000C,$0014 
    db $12 
    dw $7154,$01F4 
    db $0A 
    dw $7159,$01F4 
    db $02 
    dw $7149,$01FC 
    db $0A 
    dw $717B,$0004 
    db $0A 
    dw $717A,$01FC 
    db $02 
    dw $716B,$0004 
    db $02 
    dw $716A,$800C 
    db $02 
    dw $7168,$81F4 
    db $F2 
    dw $7166,$8004 
    db $F2 
    dw $7164,$81EC 
    db $E2 
    dw $7162,$81FC 
    db $E2 
    dw $7160 

Spritemap_Ridley_FacingRight_HeadNeck_MouthHalfOpened:
    dw $000D,$01F2 
    db $F0 
    dw $714A,$0002 
    db $08 
    dw $71BB,$0002 
    db $00 
    dw $713D,$01F2 
    db $F8 
    dw $715A,$81F2 
    db $00 
    dw $7188,$81FA 
    db $F0 
    dw $7186,$000A 
    db $00 
    dw $7156,$0012 
    db $00 
    dw $7155,$800A 
    db $F0 
    dw $7184,$81EA 
    db $E0 
    dw $7182,$81FA 
    db $E0 
    dw $7180,$800A 
    db $E0 
    dw $716E,$801A 
    db $E8 
    dw $716C 

Spritemap_Ridley_FacingRight_HeadNeck_MouthOpen:
    dw $000F,$0018 
    db $05 
    dw $7158,$01F8 
    db $DD 
    dw $714B,$0010 
    db $05 
    dw $7138,$0000 
    db $05 
    dw $713A,$0008 
    db $05 
    dw $7139,$01F0 
    db $05 
    dw $713C,$01F8 
    db $05 
    dw $713B,$0020 
    db $D5 
    dw $7157,$81F0 
    db $F5 
    dw $71A5,$81F8 
    db $F5 
    dw $71A4,$8008 
    db $F5 
    dw $71A2,$81F0 
    db $E5 
    dw $71A0,$8000 
    db $E5 
    dw $718E,$8000 
    db $D5 
    dw $718C,$8010 
    db $D5 
    dw $718A 

Spritemap_Ridley_FacingRight_Legs_PulledUp:
    dw $0007,$81F6 
    db $FF 
    dw $71AE,$8006 
    db $FF 
    dw $71AC,$01F0 
    db $F8 
    dw $71BA,$01F8 
    db $F8 
    dw $71B9,$01F0 
    db $F0 
    dw $71AA,$01F8 
    db $F0 
    dw $71A9,$8000 
    db $F0 
    dw $71A7 

Spritemap_Ridley_FacingRight_Legs_HalfExtended:
    dw $0006,$01FF 
    db $04 
    dw $71AB,$0007 
    db $04 
    dw $715B,$81F7 
    db $0B 
    dw $71AE,$8007 
    db $0B 
    dw $71AC,$81F2 
    db $F4 
    dw $71C2,$8002 
    db $F4 
    dw $71C0 

Spritemap_Ridley_FacingRight_Legs_Extended:
    dw $0006,$0009 
    db $08 
    dw $71BB,$81F9 
    db $08 
    dw $71CE,$81F3 
    db $13 
    dw $71AE,$8003 
    db $13 
    dw $71AC,$81F2 
    db $F8 
    dw $71C6,$8002 
    db $F8 
    dw $71C4 

Spritemap_Ridley_FacingRight_Claws:
    dw $0001,$8000 
    db $FC 
    dw $7140 

Spritemap_Ridley_FacingRight_Torso:
    dw $0006,$8008 
    db $03 
    dw $71CC,$8000 
    db $F8 
    dw $7120,$81F0 
    db $F8 
    dw $7122,$81F2 
    db $06 
    dw $7122,$81F0 
    db $E8 
    dw $7102,$8000 
    db $E8 
    dw $7100 

InitAI_CeresSteam:
    LDX.W $0E54 
    STZ.W $0F98,X 
    LDA.W $0F86,X 
    ORA.W #$2000 
    STA.W $0F86,X 
    LDA.W $0F88,X 
    ORA.W #$0004 
    STA.W $0F88,X 
    LDA.W #$0001 : STA.W $0F94,X 
    STZ.W $0F90,X 
    LDA.W #$0A00 : STA.W $0F96,X 
    JSL.L GenerateRandomNumber 
    AND.W #$001F 
    INC A 
    STA.W $0FAE,X 
    LDA.W $0FB4,X 
    ASL A 
    TAY 
    LDA.W InitAI_CeresSteam_instListPointers,Y : STA.W $0F92,X 
    LDA.W InitAI_CeresSteam_initialFunctionPointers,Y : STA.W $0FA8,X 

InitAI_CeresSteam_return:
    RTL 


InitAI_CeresSteam_instListPointers:
    dw InstList_CeresSteam_Up_0 
    dw InstList_CeresSteam_Left_0 
    dw InstList_CeresSteam_Down_0 
    dw InstList_CeresSteam_Right_0 
    dw InstList_CeresSteam_Left_0 
    dw InstList_CeresSteam_Right_0 

InitAI_CeresSteam_initialFunctionPointers:
    dw InitAI_CeresSteam_return 
    dw InitAI_CeresSteam_return 
    dw InitAI_CeresSteam_return 
    dw InitAI_CeresSteam_return 
    dw Func_CeresSteam_CalculateGraphicalOffsetInRotatingElevRoom 
    dw Func_CeresSteam_CalculateGraphicalOffsetInRotatingElevRoom 

MainAI_CeresSteam:
    LDX.W $0E54 
    LDA.W #$7FFF : STA.W $0F8C,X 
    JMP.W ($0FA8,X) 


Func_CeresSteam_CalculateGraphicalOffsetInRotatingElevRoom:
    LDA.W $0F7A,X : STA.B $12 
    LDA.W $0F7E,X : STA.B $14 
    JSL.L Calculate_CeresSteamPosition_InRotatingElevatorRoom 
    LDX.W $0E54 
    LDA.B $12 
    SEC 
    SBC.W $0F7A,X 
    STA.L $7E7010,X 
    LDA.B $14 
    SEC 
    SBC.W $0F7E,X 
    STA.L $7E7012,X 
    RTL 


EnemyTouch_CeresSteam:
    LDX.W $0E54 
    LDA.W #$7FFF : STA.W $0F8C,X 
    JSL.L NormalEnemyTouchAI 
    RTL 


InstList_CeresSteam_Up_0:
    dw Instruction_CeresSteam_SetToIntangibleAndInvisible 
    dw $0001 
    dw ExtendedSpritemap_CeresSteam_Up_0 
    dw Instruction_CeresSteam_DecActivationTimer_Decide_GotoYOrY2 
    dw InstList_CeresSteam_Up_0 
    dw InstList_CeresSteam_Up_2 

InstList_CeresSteam_Up_1:
    dw Instruction_CeresSteam_SetToIntangibleAndInvisible 
    dw $0040 
    dw ExtendedSpritemap_CeresSteam_Up_0 
    dw Instruction_CeresSteam_SetToTangibleAndVisible 

InstList_CeresSteam_Up_2:
    dw $0003 
    dw ExtendedSpritemap_CeresSteam_Up_0 
    dw $0003 
    dw ExtendedSpritemap_CeresSteam_Up_1 
    dw $0003 
    dw ExtendedSpritemap_CeresSteam_Up_2 
    dw $0003 
    dw ExtendedSpritemap_CeresSteam_Up_3 
    dw $0003 
    dw ExtendedSpritemap_CeresSteam_Up_4 
    dw $0003 
    dw ExtendedSpritemap_CeresSteam_Up_5 
    dw $0003 
    dw ExtendedSpritemap_CeresSteam_Up_6 
    dw Instruction_Common_GotoY 
    dw InstList_CeresSteam_Up_1 

InstList_CeresSteam_Left_0:
    dw Instruction_CeresSteam_SetToIntangibleAndInvisible 
    dw $0001 
    dw ExtendedSpritemap_CeresSteam_Left_0 
    dw Instruction_CeresSteam_DecActivationTimer_Decide_GotoYOrY2 
    dw InstList_CeresSteam_Left_0 
    dw InstList_CeresSteam_Left_2 

InstList_CeresSteam_Left_1:
    dw Instruction_CeresSteam_SetToIntangibleAndInvisible 
    dw $0040 
    dw ExtendedSpritemap_CeresSteam_Left_0 
    dw Instruction_CeresSteam_SetToTangibleAndVisible 

InstList_CeresSteam_Left_2:
    dw $0003 
    dw ExtendedSpritemap_CeresSteam_Left_0 
    dw $0003 
    dw ExtendedSpritemap_CeresSteam_Left_1 
    dw $0003 
    dw ExtendedSpritemap_CeresSteam_Left_2 
    dw $0003 
    dw ExtendedSpritemap_CeresSteam_Left_3 
    dw $0003 
    dw ExtendedSpritemap_CeresSteam_Left_4 
    dw $0003 
    dw ExtendedSpritemap_CeresSteam_Left_5 
    dw $0003 
    dw ExtendedSpritemap_CeresSteam_Left_6 
    dw Instruction_Common_GotoY 
    dw InstList_CeresSteam_Left_1 

InstList_CeresSteam_Down_0:
    dw Instruction_CeresSteam_SetToIntangibleAndInvisible 
    dw $0001 
    dw ExtendedSpritemap_CeresSteam_Down_0 
    dw Instruction_CeresSteam_DecActivationTimer_Decide_GotoYOrY2 
    dw InstList_CeresSteam_Down_0 
    dw InstList_CeresSteam_Down_2 

InstList_CeresSteam_Down_1:
    dw Instruction_CeresSteam_SetToIntangibleAndInvisible 
    dw $0040 
    dw ExtendedSpritemap_CeresSteam_Down_0 
    dw Instruction_CeresSteam_SetToTangibleAndVisible 

InstList_CeresSteam_Down_2:
    dw $0003 
    dw ExtendedSpritemap_CeresSteam_Down_0 
    dw $0003 
    dw ExtendedSpritemap_CeresSteam_Down_1 
    dw $0003 
    dw ExtendedSpritemap_CeresSteam_Down_2 
    dw $0003 
    dw ExtendedSpritemap_CeresSteam_Down_3 
    dw $0003 
    dw ExtendedSpritemap_CeresSteam_Down_4 
    dw $0003 
    dw ExtendedSpritemap_CeresSteam_Down_5 
    dw $0003 
    dw ExtendedSpritemap_CeresSteam_Down_6 
    dw Instruction_Common_GotoY 
    dw InstList_CeresSteam_Down_1 

InstList_CeresSteam_Right_0:
    dw Instruction_CeresSteam_SetToIntangibleAndInvisible 
    dw $0001 
    dw ExtendedSpritemap_CeresSteam_Right_0 
    dw Instruction_CeresSteam_DecActivationTimer_Decide_GotoYOrY2 
    dw InstList_CeresSteam_Right_0 
    dw InstList_CeresSteam_Right_2 

InstList_CeresSteam_Right_1:
    dw Instruction_CeresSteam_SetToIntangibleAndInvisible 
    dw $0040 
    dw ExtendedSpritemap_CeresSteam_Right_0 
    dw Instruction_CeresSteam_SetToTangibleAndVisible 

InstList_CeresSteam_Right_2:
    dw $0003 
    dw ExtendedSpritemap_CeresSteam_Right_0 
    dw $0003 
    dw ExtendedSpritemap_CeresSteam_Right_1 
    dw $0003 
    dw ExtendedSpritemap_CeresSteam_Right_2 
    dw $0003 
    dw ExtendedSpritemap_CeresSteam_Right_3 
    dw $0003 
    dw ExtendedSpritemap_CeresSteam_Right_4 
    dw $0003 
    dw ExtendedSpritemap_CeresSteam_Right_5 
    dw $0003 
    dw ExtendedSpritemap_CeresSteam_Right_6 
    dw Instruction_Common_GotoY 
    dw InstList_CeresSteam_Right_1 

Instruction_CeresSteam_SetToIntangibleAndInvisible:
    LDA.W $0F86,X 
    ORA.W #$0500 
    STA.W $0F86,X 
    RTL 


Instruction_CeresSteam_DecActivationTimer_Decide_GotoYOrY2:
    DEC.W $0FAE,X 
    BEQ .gotoY2 
    LDA.W $0000,Y 
    TAY 
    RTL 


.gotoY2:
    LDA.W $0002,Y 
    TAY ; fallthrough to Instruction_CeresSteam_SetToTangibleAndVisible

Instruction_CeresSteam_SetToTangibleAndVisible:
    LDA.W $0F86,X 
    AND.W #$FBFF ; >.< #$FAFF
    AND.W #$FEFF 
    STA.W $0F86,X 
    RTL 


ExtendedSpritemap_CeresSteam_Up_0:
    dw $1001,$0000,$0000 
    dw Spritemap_CeresSteam_Up_0 
    dw Hitbox_CeresSteam_Up_0 

ExtendedSpritemap_CeresSteam_Up_1:
    dw $1001,$0000,$0000 
    dw Spritemap_CeresSteam_Up_1 
    dw Hitbox_CeresSteam_Up_1 

ExtendedSpritemap_CeresSteam_Up_2:
    dw $1001,$0000,$0000 
    dw Spritemap_CeresSteam_Up_2 
    dw Hitbox_CeresSteam_Up_2 

ExtendedSpritemap_CeresSteam_Up_3:
    dw $1001,$0000,$0000 
    dw Spritemap_CeresSteam_Up_3 
    dw Hitbox_CeresSteam_Up_3 

ExtendedSpritemap_CeresSteam_Up_4:
    dw $1001,$0000,$0000 
    dw Spritemap_CeresSteam_Up_4 
    dw Hitbox_CeresSteam_Up_4 

ExtendedSpritemap_CeresSteam_Up_5:
    dw $1001,$0000,$0000 
    dw Spritemap_CeresSteam_Up_5 
    dw Hitbox_CeresSteam_Nothing 

ExtendedSpritemap_CeresSteam_Up_6:
    dw $1001,$0000,$0000 
    dw Spritemap_CeresSteam_Up_6 
    dw Hitbox_CeresSteam_Nothing 

ExtendedSpritemap_CeresSteam_Left_0:
    dw $1001,$0000,$0000 
    dw Spritemap_CeresSteam_Left_0 
    dw Hitbox_CeresSteam_Left_0 

ExtendedSpritemap_CeresSteam_Left_1:
    dw $1001,$0000,$0000 
    dw Spritemap_CeresSteam_Left_1 
    dw Hitbox_CeresSteam_Left_1 

ExtendedSpritemap_CeresSteam_Left_2:
    dw $1001,$0000,$0000 
    dw Spritemap_CeresSteam_Left_2 
    dw Hitbox_CeresSteam_Left_2 

ExtendedSpritemap_CeresSteam_Left_3:
    dw $1001,$0000,$0000 
    dw Spritemap_CeresSteam_Left_3 
    dw Hitbox_CeresSteam_Left_3 

ExtendedSpritemap_CeresSteam_Left_4:
    dw $1001,$0000,$0000 
    dw Spritemap_CeresSteam_Left_4 
    dw Hitbox_CeresSteam_Left_4 

ExtendedSpritemap_CeresSteam_Left_5:
    dw $1001,$0000,$0000 
    dw Spritemap_CeresSteam_Left_5 
    dw Hitbox_CeresSteam_Nothing 

ExtendedSpritemap_CeresSteam_Left_6:
    dw $1001,$0000,$0000 
    dw Spritemap_CeresSteam_Left_6 
    dw Hitbox_CeresSteam_Nothing 

ExtendedSpritemap_CeresSteam_Down_0:
    dw $1001,$0000,$0000 
    dw Spritemap_CeresSteam_Down_0 
    dw Hitbox_CeresSteam_Down_0 

ExtendedSpritemap_CeresSteam_Down_1:
    dw $1001,$0000,$0000 
    dw Spritemap_CeresSteam_Down_1 
    dw Hitbox_CeresSteam_Down_1 

ExtendedSpritemap_CeresSteam_Down_2:
    dw $1001,$0000,$0000 
    dw Spritemap_CeresSteam_Down_2 
    dw Hitbox_CeresSteam_Down_2 

ExtendedSpritemap_CeresSteam_Down_3:
    dw $1001,$0000,$0000 
    dw Spritemap_CeresSteam_Down_3 
    dw Hitbox_CeresSteam_Down_3 

ExtendedSpritemap_CeresSteam_Down_4:
    dw $1001,$0000,$0000 
    dw Spritemap_CeresSteam_Down_4 
    dw Hitbox_CeresSteam_Down_4 

ExtendedSpritemap_CeresSteam_Down_5:
    dw $1001,$0000,$0000 
    dw Spritemap_CeresSteam_Down_5 
    dw Hitbox_CeresSteam_Nothing 

ExtendedSpritemap_CeresSteam_Down_6:
    dw $1001,$0000,$0000 
    dw Spritemap_CeresSteam_Down_6 
    dw Hitbox_CeresSteam_Nothing 

ExtendedSpritemap_CeresSteam_Right_0:
    dw $1001,$0000,$0000 
    dw Spritemap_CeresSteam_Right_0 
    dw Hitbox_CeresSteam_Right_0 

ExtendedSpritemap_CeresSteam_Right_1:
    dw $1001,$0000,$0000 
    dw Spritemap_CeresSteam_Right_1 
    dw Hitbox_CeresSteam_Right_1 

ExtendedSpritemap_CeresSteam_Right_2:
    dw $1001,$0000,$0000 
    dw Spritemap_CeresSteam_Right_2 
    dw Hitbox_CeresSteam_Right_2 

ExtendedSpritemap_CeresSteam_Right_3:
    dw $1001,$0000,$0000 
    dw Spritemap_CeresSteam_Right_3 
    dw Hitbox_CeresSteam_Right_3 

ExtendedSpritemap_CeresSteam_Right_4:
    dw $1001,$0000,$0000 
    dw Spritemap_CeresSteam_Right_4 
    dw Hitbox_CeresSteam_Right_4 

ExtendedSpritemap_CeresSteam_Right_5:
    dw $1001,$0000,$0000 
    dw Spritemap_CeresSteam_Right_5 
    dw Hitbox_CeresSteam_Nothing 

ExtendedSpritemap_CeresSteam_Right_6:
    dw $1001,$0000,$0000 
    dw Spritemap_CeresSteam_Right_6 
    dw Hitbox_CeresSteam_Nothing 

Hitbox_CeresSteam_Nothing:
    dw $0000 

Hitbox_CeresSteam_Up_0:
    dw $0001,$FFF8,$FFF0,$0007,$FFFF 
    dw EnemyTouch_CeresSteam 
    dw RTL_A6804C 

Hitbox_CeresSteam_Up_1:
    dw $0001,$FFF8,$FFE9,$0007,$FFFE 
    dw EnemyTouch_CeresSteam 
    dw RTL_A6804C 

Hitbox_CeresSteam_Up_2:
    dw $0001,$FFF8,$FFE0,$0007,$FFF8 
    dw EnemyTouch_CeresSteam 
    dw RTL_A6804C 

Hitbox_CeresSteam_Up_3:
    dw $0001,$FFF8,$FFD8,$0007,$FFF0 
    dw EnemyTouch_CeresSteam 
    dw RTL_A6804C 

Hitbox_CeresSteam_Up_4:
    dw $0001,$FFF8,$FFD8,$0006,$FFE8 
    dw EnemyTouch_CeresSteam 
    dw RTL_A6804C 

Hitbox_CeresSteam_Left_0:
    dw $0001,$FFF0,$FFF8,$FFFF,$0007 
    dw EnemyTouch_CeresSteam 
    dw RTL_A6804C 

Hitbox_CeresSteam_Left_1:
    dw $0001,$FFE8,$FFF8,$FFFE,$0007 
    dw EnemyTouch_CeresSteam 
    dw RTL_A6804C 

Hitbox_CeresSteam_Left_2:
    dw $0001,$FFE0,$FFF9,$FFF7,$0007 
    dw EnemyTouch_CeresSteam 
    dw RTL_A6804C 

Hitbox_CeresSteam_Left_3:
    dw $0001,$FFD8,$FFF7,$FFEF,$0005 
    dw EnemyTouch_CeresSteam 
    dw RTL_A6804C 

Hitbox_CeresSteam_Left_4:
    dw $0001,$FFD8,$FFF5,$FFE6,$0002 
    dw EnemyTouch_CeresSteam 
    dw RTL_A6804C 

Hitbox_CeresSteam_Down_0:
    dw $0001,$FFF8,$0000,$0007,$000E 
    dw EnemyTouch_CeresSteam 
    dw RTL_A6804C 

Hitbox_CeresSteam_Down_1:
    dw $0001,$FFF8,$0000,$0007,$0017 
    dw EnemyTouch_CeresSteam 
    dw RTL_A6804C 

Hitbox_CeresSteam_Down_2:
    dw $0001,$FFF8,$0008,$0007,$001F 
    dw EnemyTouch_CeresSteam 
    dw RTL_A6804C 

Hitbox_CeresSteam_Down_3:
    dw $0001,$FFF8,$000F,$0007,$0027 
    dw EnemyTouch_CeresSteam 
    dw RTL_A6804C 

Hitbox_CeresSteam_Down_4:
    dw $0001,$FFF8,$0017,$0006,$0026 
    dw EnemyTouch_CeresSteam 
    dw RTL_A6804C 

Hitbox_CeresSteam_Right_0:
    dw $0001,$0000,$FFF8,$000F,$0007 
    dw EnemyTouch_CeresSteam 
    dw RTL_A6804C 

Hitbox_CeresSteam_Right_1:
    dw $0001,$0001,$FFF8,$0017,$0007 
    dw EnemyTouch_CeresSteam 
    dw RTL_A6804C 

Hitbox_CeresSteam_Right_2:
    dw $0001,$0009,$FFF8,$001F,$0007 
    dw EnemyTouch_CeresSteam 
    dw RTL_A6804C 

Hitbox_CeresSteam_Right_3:
    dw $0001,$0012,$FFF7,$0026,$0005 
    dw EnemyTouch_CeresSteam 
    dw RTL_A6804C 

Hitbox_CeresSteam_Right_4:
    dw $0001,$0019,$FFF5,$0028,$0003 
    dw EnemyTouch_CeresSteam 
    dw RTL_A6804C 

Spritemap_CeresSteam_Up_0:
    dw $0001,$81F8 
    db $F0 
    dw $207C 

Spritemap_CeresSteam_Up_1:
    dw $0002,$81F8 
    db $E8 
    dw $207C,$81F8 
    db $F0 
    dw $207E 

Spritemap_CeresSteam_Up_2:
    dw $0003,$81F8 
    db $E0 
    dw $207C,$81F8 
    db $E8 
    dw $207E,$81F8 
    db $F0 
    dw $209A 

Spritemap_CeresSteam_Up_3:
    dw $0004,$81F8 
    db $D7 
    dw $207C,$81F8 
    db $E0 
    dw $207E,$81F8 
    db $E8 
    dw $209A,$81F8 
    db $F0 
    dw $209C 

Spritemap_CeresSteam_Up_4:
    dw $0003,$81F8 
    db $D6 
    dw $207E,$81F8 
    db $E0 
    dw $209A,$81F8 
    db $E8 
    dw $209C 

Spritemap_CeresSteam_Up_5:
    dw $0002,$81F8 
    db $D5 
    dw $209A,$81F8 
    db $E0 
    dw $209C 

Spritemap_CeresSteam_Up_6:
    dw $0001,$81F8 
    db $D3 
    dw $209C 

Spritemap_CeresSteam_Left_0:
    dw $0001,$81F0 
    db $F8 
    dw $207C 

Spritemap_CeresSteam_Left_1:
    dw $0002,$81E8 
    db $F8 
    dw $207C,$81F0 
    db $F8 
    dw $207E 

Spritemap_CeresSteam_Left_2:
    dw $0003,$81E0 
    db $F8 
    dw $207C,$81E8 
    db $F8 
    dw $207E,$81F0 
    db $F8 
    dw $209A 

Spritemap_CeresSteam_Left_3:
    dw $0004,$81D8 
    db $F6 
    dw $207C,$81E0 
    db $F8 
    dw $207E,$81E8 
    db $F8 
    dw $209A,$81F0 
    db $F8 
    dw $209C 

Spritemap_CeresSteam_Left_4:
    dw $0003,$81D7 
    db $F4 
    dw $207E,$81E0 
    db $F6 
    dw $209A,$81E8 
    db $F8 
    dw $209C 

Spritemap_CeresSteam_Left_5:
    dw $0002,$81D6 
    db $F2 
    dw $209A,$81E0 
    db $F4 
    dw $209C 

Spritemap_CeresSteam_Left_6:
    dw $0001,$81D5 
    db $F0 
    dw $209C 

Spritemap_CeresSteam_Down_0:
    dw $0001,$81F8 
    db $00 
    dw $A07C 

Spritemap_CeresSteam_Down_1:
    dw $0002,$81F8 
    db $08 
    dw $A07C,$81F8 
    db $00 
    dw $A07E 

Spritemap_CeresSteam_Down_2:
    dw $0003,$81F8 
    db $10 
    dw $A07C,$81F8 
    db $08 
    dw $A07E,$81F8 
    db $00 
    dw $A09A 

Spritemap_CeresSteam_Down_3:
    dw $0004,$81F8 
    db $18 
    dw $A07C,$81F8 
    db $10 
    dw $A07E,$81F8 
    db $08 
    dw $A09A,$81F8 
    db $00 
    dw $A09C 

Spritemap_CeresSteam_Down_4:
    dw $0003,$81F8 
    db $18 
    dw $A07E,$81F8 
    db $10 
    dw $A09A,$81F8 
    db $08 
    dw $A09C 

Spritemap_CeresSteam_Down_5:
    dw $0002,$81F8 
    db $18 
    dw $A09A,$81F8 
    db $10 
    dw $A09C 

Spritemap_CeresSteam_Down_6:
    dw $0001,$81F8 
    db $18 
    dw $A09C 

Spritemap_CeresSteam_Right_0:
    dw $0001,$8000 
    db $F8 
    dw $607C 

Spritemap_CeresSteam_Right_1:
    dw $0002,$8008 
    db $F8 
    dw $607C,$8000 
    db $F8 
    dw $607E 

Spritemap_CeresSteam_Right_2:
    dw $0003,$8010 
    db $F8 
    dw $607C,$8008 
    db $F8 
    dw $607E,$8000 
    db $F8 
    dw $609A 

Spritemap_CeresSteam_Right_3:
    dw $0004,$8018 
    db $F6 
    dw $607C,$8010 
    db $F8 
    dw $607E,$8008 
    db $F8 
    dw $609A,$8000 
    db $F8 
    dw $609C 

Spritemap_CeresSteam_Right_4:
    dw $0003,$8019 
    db $F4 
    dw $607E,$8010 
    db $F6 
    dw $609A,$8008 
    db $F8 
    dw $609C 

Spritemap_CeresSteam_Right_5:
    dw $0002,$801A 
    db $F2 
    dw $609A,$8010 
    db $F4 
    dw $609C 

Spritemap_CeresSteam_Right_6:
    dw $0001,$801B 
    db $F0 
    dw $609C 

Palette_CeresDoor_BeforeEscape:
    dw $0000,$7E20,$6560,$2060,$1000,$7940,$5D00,$4CA0 
    dw $3CA0,$43FF,$0113,$000F,$175C,$0299,$01D6,$57E0 

Palette_CeresDoor_DuringEscape:
    dw $3800,$6B5A,$5652,$28E7,$1863,$62B5,$4A10,$396B 
    dw $3129,$43FF,$0113,$000F,$175C,$0299,$01D6,$3BE0 

InstListPointers_CeresDoor:
    dw InstList_CeresDoor_Normal_FacingRight 
    dw InstList_CeresDoor_Normal_FacingLeft_0 
    dw InstList_CeresDoor_RotatingElevRoom_PreExploDoorOverlay_0 
    dw InstList_CeresDoor_RidleysRoom_FacingRight_0 
    dw InstList_CeresDoor_RotatingElevatorRoom_InvisibleWall_0 
    dw InstList_CeresDoor_RidleyEscapeMode7LeftWall_0 
    dw InstList_CeresDoor_RidleyEscapeMode7RightWall_0 

InstList_CeresDoor_RidleysRoom_FacingRight_0:
    dw Instruction_CeresDoor_SetAsIntangible 
    dw Instruction_CeresDoor_SetAsInvisible 
    dw $0002 
    dw Spritemap_CeresDoor_FacingRight_Open 
    dw Instruction_CeresDoor_SetAsTangible 
    dw Instruction_CeresDoor_SetAsVisible 
    dw $0002 
    dw Spritemap_CeresDoor_FacingRight_Open 
    dw $0002 
    dw Spritemap_CeresDoor_FacingRight_OpeningFrame3 
    dw $0002 
    dw Spritemap_CeresDoor_FacingRight_OpeningFrame2 
    dw $0002 
    dw Spritemap_CeresDoor_FacingRight_OpeningFrame1 
    dw Instruction_CeresDoor_SetDrawnByRidleyFlag 
    dw $0001 
    dw Spritemap_CeresDoor_FacingRight_Closed 
    dw Instruction_CeresDoor_SetAsInvisible 

InstList_CeresDoor_RidleysRoom_FacingRight_1:
    dw $0002 
    dw Spritemap_CeresDoor_FacingRight_Closed 
    dw Instruction_CeresDoor_GotoYIfAreaBossIsAlive 
    dw InstList_CeresDoor_RidleysRoom_FacingRight_1 
    dw Instruction_CeresDoor_SetAsVisible_ClearDrawnByRidleyFlag 
    dw Instruction_Common_GotoY 
    dw InstList_CeresDoor_Closed_FacingRight_0 

InstList_CeresDoor_Normal_FacingRight:
    dw Instruction_CeresDoor_SetAsIntangible 
    dw Instruction_CeresDoor_SetAsInvisible 
    dw $0002 
    dw Spritemap_CeresDoor_FacingRight_Closed 
    dw Inst_CeresDoor_GotoYIfSamusIsNotWithing30Pixels 
    dw InstList_CeresDoor_Closed_FacingRight_0 

InstList_CeresDoor_Open_FacingRight_0:
    dw $0002 
    dw Spritemap_CeresDoor_FacingRight_Open 
    dw Inst_CeresDoor_GotoYIfSamusIsNotWithing30Pixels 
    dw InstList_CeresDoor_Open_FacingRight_1 
    dw Instruction_Common_GotoY 
    dw InstList_CeresDoor_Open_FacingRight_0 

InstList_CeresDoor_Open_FacingRight_1:
    dw Instruction_CeresDoor_SetAsTangible 
    dw Instruction_CeresDoor_SetAsVisible 
    dw $0005 
    dw Spritemap_CeresDoor_FacingRight_Open 
    dw $0005 
    dw Spritemap_CeresDoor_FacingRight_OpeningFrame3 
    dw $0005 
    dw Spritemap_CeresDoor_FacingRight_OpeningFrame2 
    dw $0005 
    dw Spritemap_CeresDoor_FacingRight_OpeningFrame1 

InstList_CeresDoor_Closed_FacingRight_0:
    dw Instruction_CeresDoor_SetAsTangible 
    dw Instruction_CeresDoor_SetAsVisible 

InstList_CeresDoor_Closed_FacingRight_1:
    dw $0002 
    dw Spritemap_CeresDoor_FacingRight_Closed 
    dw Inst_CeresDoor_GotoYIfSamusIsNotWithing30Pixels 
    dw InstList_CeresDoor_Closed_FacingRight_1 
    dw Instruction_CeresDoor_QueueOpeningSFX 
    dw $0005 
    dw Spritemap_CeresDoor_FacingRight_OpeningFrame1 
    dw $0005 
    dw Spritemap_CeresDoor_FacingRight_OpeningFrame2 
    dw $0005 
    dw Spritemap_CeresDoor_FacingRight_OpeningFrame3 
    dw $0005 
    dw Spritemap_CeresDoor_FacingRight_Open 
    dw Instruction_CeresDoor_SetAsIntangible 
    dw Instruction_CeresDoor_SetAsInvisible 
    dw Instruction_Common_GotoY 
    dw InstList_CeresDoor_Open_FacingRight_0 

InstList_CeresDoor_Normal_FacingLeft_0:
    dw Instruction_CeresDoor_SetAsIntangible 
    dw Instruction_CeresDoor_SetAsInvisible 
    dw $0002 
    dw Spritemap_CeresDoor_FacingRight_Closed 
    dw Inst_CeresDoor_GotoYIfSamusIsNotWithing30Pixels 
    dw InstList_CeresDoor_Normal_FacingLeft_3 

InstList_CeresDoor_Normal_FacingLeft_1:
    dw $0002 
    dw Spritemap_CeresDoor_FacingLeft_Closed 
    dw Inst_CeresDoor_GotoYIfSamusIsNotWithing30Pixels 
    dw InstList_CeresDoor_Normal_FacingLeft_2 
    dw Instruction_Common_GotoY 
    dw InstList_CeresDoor_Normal_FacingLeft_1 

InstList_CeresDoor_Normal_FacingLeft_2:
    dw Instruction_CeresDoor_SetAsTangible 
    dw Instruction_CeresDoor_SetAsVisible 
    dw $0005 
    dw Spritemap_CeresDoor_FacingLeft_Open 
    dw $0005 
    dw Spritemap_CeresDoor_FacingLeft_OpeningFrame3 
    dw $0005 
    dw Spritemap_CeresDoor_FacingLeft_OpeningFrame2 
    dw $0005 
    dw Spritemap_CeresDoor_FacingLeft_OpeningFrame1 

InstList_CeresDoor_Normal_FacingLeft_3:
    dw Instruction_CeresDoor_SetAsTangible 
    dw Instruction_CeresDoor_SetAsVisible 

InstList_CeresDoor_Normal_FacingLeft_4:
    dw $0002 
    dw Spritemap_CeresDoor_FacingLeft_Closed 
    dw Inst_CeresDoor_GotoYIfSamusIsNotWithing30Pixels 
    dw InstList_CeresDoor_Normal_FacingLeft_4 
    dw Instruction_CeresDoor_QueueOpeningSFX 
    dw $0005 
    dw Spritemap_CeresDoor_FacingLeft_OpeningFrame1 
    dw $0005 
    dw Spritemap_CeresDoor_FacingLeft_OpeningFrame2 
    dw $0005 
    dw Spritemap_CeresDoor_FacingLeft_OpeningFrame3 
    dw $0005 
    dw Spritemap_CeresDoor_FacingLeft_Open 
    dw Instruction_CeresDoor_SetAsIntangible 
    dw Instruction_CeresDoor_SetAsInvisible 
    dw Instruction_Common_GotoY 
    dw InstList_CeresDoor_Normal_FacingLeft_1 

InstList_CeresDoor_RotatingElevRoom_PreExploDoorOverlay_0:
    dw Instruction_CeresDoor_SetAsIntangible 

InstList_CeresDoor_RotatingElevRoom_PreExploDoorOverlay_1:
    dw $0001 
    dw Spritemap_CeresDoor_RotatingElevRoomPreExplosionDoorOverlay 
    dw Instruction_Common_GotoY 
    dw InstList_CeresDoor_RotatingElevRoom_PreExploDoorOverlay_1 

InstList_CeresDoor_RotatingElevatorRoom_InvisibleWall_0:
    dw Instruction_CeresDoor_GotoYIfCeresRidleyHasNotEscaped 
    dw InstList_CeresDoor_Normal_FacingLeft_0 
    dw Instruction_CeresDoor_SetAsTangible 
    dw Instruction_CeresDoor_SetAsInvisible 

InstList_CeresDoor_RotatingElevatorRoom_InvisibleWall_1:
    dw $0001 
    dw Spritemap_CeresDoor_FacingLeft_Closed 
    dw Instruction_Common_GotoY 
    dw InstList_CeresDoor_RotatingElevatorRoom_InvisibleWall_1 

InstList_CeresDoor_RidleyEscapeMode7LeftWall_0:
    dw Instruction_CeresDoor_SetAsIntangible 

InstList_CeresDoor_RidleyEscapeMode7LeftWall_1:
    dw $0001 
    dw Spritemap_CeresDoor_RidleyEscapeMode7LeftWall 
    dw Instruction_Common_GotoY 
    dw InstList_CeresDoor_RidleyEscapeMode7LeftWall_1 

InstList_CeresDoor_RidleyEscapeMode7RightWall_0:
    dw Instruction_CeresDoor_SetAsIntangible 

InstList_CeresDoor_RidleyEscapeMode7RightWall_1:
    dw $0001 
    dw Spritemap_CeresDoor_RidleyEscapeMode7RightWall 
    dw Instruction_Common_GotoY 
    dw InstList_CeresDoor_RidleyEscapeMode7RightWall_1 

Inst_CeresDoor_GotoYIfSamusIsNotWithing30Pixels:
    LDA.W $0F7A,X 
    SEC 
    SBC.W $0AF6 
    BPL + 
    EOR.W #$FFFF 
    INC A 

  + CMP.W #$0030 
    BCS Inst_CeresDoor_GotoYIfSamusIsNotWithin30Pixels_gotoY 
    LDA.W $0F7E,X 
    SEC 
    SBC.W $0AFA 
    BPL + 
    EOR.W #$FFFF 
    INC A 

  + CMP.W #$0030 
    BCS Inst_CeresDoor_GotoYIfSamusIsNotWithin30Pixels_gotoY 

Inst_CeresDoor_GotoYIfSamusIsNotWithin30Pixels_outOfRange:
    INY #2
    RTL 


Inst_CeresDoor_GotoYIfSamusIsNotWithin30Pixels_gotoY:
    LDA.W $0000,Y 
    TAY 
    RTL 


Instruction_CeresDoor_GotoYIfAreaBossIsAlive:
    PHX 
    LDX.W $079F 
    LDA.L $7ED828,X 
    PLX 
    LSR A 
    BCC Inst_CeresDoor_GotoYIfSamusIsNotWithin30Pixels_gotoY 
    BRA Inst_CeresDoor_GotoYIfSamusIsNotWithin30Pixels_outOfRange 


Instruction_CeresDoor_GotoYIfCeresRidleyHasNotEscaped:
    LDA.W $093F 
    BEQ Inst_CeresDoor_GotoYIfSamusIsNotWithin30Pixels_gotoY 
    BRA Inst_CeresDoor_GotoYIfSamusIsNotWithin30Pixels_outOfRange 


SetElevatorRoomToRotateIfRidleyHasEscaped:
    LDA.W $093F 
    BEQ .return 
    LDA.W #$8000 : STA.W $093F 

.return:
    RTL 


Instruction_CeresDoor_SetAsIntangible:
    LDA.W $0F86,X 
    ORA.W #$0400 
    STA.W $0F86,X 
    RTL 


Instruction_CeresDoor_SetAsTangible:
    LDA.W $0F86,X 
    AND.W #$FBFF 
    STA.W $0F86,X 
    RTL 


Instruction_CeresDoor_SetDrawnByRidleyFlag:
    LDA.W #$0001 : STA.W $0FAA,X 
    RTL 


Instruction_CeresDoor_SetAsInvisible:
    LDA.W $0F86,X 
    ORA.W #$0100 
    STA.W $0F86,X 
    RTL 


Instruction_CeresDoor_SetAsVisible_ClearDrawnByRidleyFlag:
    STZ.W $0FAA,X ; fallthrough to Instruction_CeresDoor_SetAsVisible

Instruction_CeresDoor_SetAsVisible:
    LDA.W $0F86,X 
    AND.W #$FEFF 
    STA.W $0F86,X 
    RTL 


Instruction_CeresDoor_QueueOpeningSFX:
    LDA.W #$002C 
    JSL.L QueueSound_Lib3_Max6 
    RTL 


InitAI_CeresDoor:
    LDX.W $0E54 
    LDA.W #Spritemap_CeresDoor_Placeholder : STA.W $0F8E,X 
    LDA.W #$0001 : STA.W $0F94,X 
    STZ.W $0F90,X 
    STZ.W $0F98,X 
    LDA.W #$0400 : STA.W $0F96,X 
    LDA.W $0FB4,X 
    ASL A 
    TAY 
    LDA.W .functionPointers,Y : STA.W $0FA8,X 
    LDA.W InstListPointers_CeresDoor,Y : STA.W $0F92,X 
    STZ.W $0FAA,X 
    JSR.W LoadRotatingElevatorRoomPreExplosioNDoorOverlayTilesIfNeeded 
    LDA.W $093F 
    BNE .escapeSequence 
    LDA.W $0FB4,X 
    CMP.W #$0003 
    BNE .notRidleysRoom 
    LDY.W #Palette_CeresDoor_BeforeEscape+2 
    LDX.W #$0142 
    LDA.W #$000F 
    JSL.L WriteAColorsFromYToTargetColorIndexX 
    RTL 


.notRidleysRoom:
    LDY.W #Palette_CeresDoor_BeforeEscape+2 
    BRA .merge 


.escapeSequence:
    LDY.W #Palette_CeresDoor_DuringEscape+2 

.merge:
    LDA.W #$0E00 : STA.W $0F96,X 
    LDX.W #$01E2 
    LDA.W #$000F 
    JSL.L WriteAColorsFromYToTargetColorIndexX 
    RTL 


.functionPointers:
    dw Function_CeresDoor_HandleEarthquakeDuringEscape 
    dw Function_CeresDoor_HandleEarthquakeDuringEscape 
    dw Function_CeresDoor_RotatingElevatorRoom_Default 
    dw Function_CeresDoor_HandleEarthquakeDuringEscapeInRidleysRoom 
    dw Function_CeresDoor_HandleEarthquakeDuringEscape 
    dw Function_CeresDoor_RidleyEscapeMode7Wall 
    dw Function_CeresDoor_RidleyEscapeMode7Wall 

LoadRotatingElevatorRoomPreExplosioNDoorOverlayTilesIfNeeded:
    LDA.W $0FB4,X 
    CMP.W #$0002 
    BNE .return 
    LDY.W $0330 
    LDA.W #$0400 : STA.W $00D0,Y 
    LDA.W #Tiles_CeresElevatorRoomDoor>>8&$FF00 : STA.W $00D3,Y 
    LDA.W #Tiles_CeresElevatorRoomDoor : STA.W $00D2,Y 
    LDA.W #$7000 : STA.W $00D5,Y 
    TYA 
    CLC 
    ADC.W #$0007 
    STA.W $0330 

.return:
    RTS 


MainAI_CeresDoor:
    LDX.W $0E54 
    JMP.W ($0FA8,X) 


Function_CeresDoor_HandleEarthquakeDuringEscape:
    LDY.W #$0014 
    BRA HandleEarthquakeDuringEscape 


Function_CeresDoor_HandleEarthquakeDuringEscapeInRidleysRoom:
    LDY.W #$001D ; fallthrough to HandleEarthquakeDuringEscape

HandleEarthquakeDuringEscape:
    LDA.W $093F 
    CMP.W #$0002 
    BCC .return 
    LDA.W $1840 
    BNE .return 
    LDA.W $05E5 
    AND.W #$0FFF 
    CMP.W #$0080 
    BCC .random 
    LDA.W #$0002 : STA.W $1840 
    TYA 
    STA.W $183E 
    RTL 


.random:
    LDA.W #$0004 : STA.W $1840 
    TYA 
    CLC 
    ADC.W #$0006 
    STA.W $183E 

.return:
    RTL 


Function_CeresDoor_RidleyEscapeMode7Wall:
    LDX.W $0E54 
    JSL.L Instruction_CeresDoor_SetAsInvisible 
    LDA.W $093F 
    LSR A 
    BCC .return 
    LDA.W #$0E00 : STA.W $0F96,X 
    JSL.L Instruction_CeresDoor_SetAsVisible 

.return:
    RTL 


Function_CeresDoor_RotatingElevatorRoom_Default:
    JSL.L Function_CeresDoor_RotatingElevatorRoom_ElevatorAnimations 
    LDA.W $093F 
    CMP.W #$0002 
    BCC .return 
    LDA.W #Function_CeresDoor_RotatingElevatorRoom_Rumbling_Explosions : STA.W $0FA8,X 
    LDA.W #$0030 : STA.W $0FAE,X 
    STZ.W $0FB0 
    STZ.W $0FB2 

.return:
    RTL 


Function_CeresDoor_RotatingElevatorRoom_Rumbling_Explosions:
    DEC.W $0FAE,X 
    BPL .enemyRumbleTimerNotExpired 
    LDA.W $0F86,X 
    ORA.W #$0100 
    STA.W $0F86,X 
    LDA.W #Function_CeresDoor_RotatingElevatorRoom_ElevatorAnimations : STA.W $0FA8,X 
    JMP.W SetElevatorRoomToRotateIfRidleyHasEscaped 


.enemyRumbleTimerNotExpired:
    DEC.W $0FB0 
    BPL .return 
    LDA.W #$0004 : STA.W $0FB0 
    DEC.W $0FB2 
    BPL .ceresDoorTimerNotExpired 
    LDA.W #$0003 : STA.W $0FB2 

.ceresDoorTimerNotExpired:
    LDA.W $0FB2 
    ASL #2
    TAY 
    LDA.W .XOffset,Y 
    CLC 
    ADC.W $0F7A,X 
    STA.B $12 
    LDA.W .YOffset,Y 
    CLC 
    ADC.W $0F7E,X 
    STA.B $14 
    LDY.W #$0003 
    JSL.L GenerateRandomNumber 
    CMP.W #$4000 
    BCS .noSmoke 
    LDY.W #$000C 

.noSmoke:
    TYA 
    LDY.W #EnemyProjectile_MiscDust 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    LDA.W #$0025 
    JSL.L QueueSound_Lib2_Max6 

.return:
    RTL 


.XOffset:
    dw $FFFC 

.YOffset:
    dw $FFF8,$0000,$0004,$FFFE,$0016,$0002,$000C 

Function_CeresDoor_RotatingElevatorRoom_ElevatorAnimations:
    PHX 
    JSR.W AnimateCeresElevatorPlatform 
    LDA.L $7EC400 
    BNE .return 
    LDA.W $05B6 
    AND.W #$0038 
    ASL A 
    ADC.W #.paletteAnimation 
    TAY 
    LDX.W #$0052 
    LDA.W #$0006 
    JSL.L WriteAColorsFromYtoColorIndexX 

.return:
    PLX 
    RTL 


.paletteAnimation:
    dw $5BFF,$15B8,$14B4,$17DF,$02FC,$0239,$0000,$0000 
    dw $47FF,$0113,$000F,$175C,$0299,$01D6,$0000,$0000 
    dw $335A,$006E,$000A,$02B7,$01F4,$0131,$0000,$0000 
    dw $1EB5,$0009,$0005,$0212,$014E,$008C,$0000,$0000 
    dw $1EB5,$0009,$0005,$0212,$014E,$008C,$0000,$0000 
    dw $335A,$006E,$000A,$02B7,$01F4,$0131,$0000,$0000 
    dw $47FF,$0113,$000F,$175C,$0299,$01D6,$0000,$0000 
    dw $5BFF,$15B8,$14B4,$17DF,$02FC,$0239,$0000,$0000 

AnimateCeresElevatorPlatform:
    LDA.W $05B6 
    AND.W #$0002 
    TAY 
    LDX.W .mode7TransferPointers,Y 
    JSL.L QueueMode7Transfers 
    RTS 


.mode7TransferPointers:
    dw Mode7Transfer_CeresElevatorPlatform_light 
    dw Mode7Transfer_CeresElevatorPlatform_dark 

Mode7Transfer_CeresElevatorPlatform_light:
    db $80 
    dl CeresElevatorPlatform_light 
    dw $0004,$060E 
    db $00,$00 

Mode7Transfer_CeresElevatorPlatform_dark:
    db $80 
    dl CeresElevatorPlatform_dark 
    dw $0004,$060E 
    db $00,$00 

CeresElevatorPlatform_light:
    db $68,$69,$69,$78 

CeresElevatorPlatform_dark:
    db $8D,$8E,$8E,$79 

RTL_A6F920:
    RTL 


Spritemap_CeresDoor_RotatingElevRoomPreExplosionDoorOverlay:
    dw $000C,$81F8 
    db $18 
    dw $E0E0,$81F8 
    db $08 
    dw $60E4,$81F8 
    db $F8 
    dw $60E4,$81F8 
    db $E8 
    dw $60E0,$C208 
    db $28 
    dw $210A,$C3F8 
    db $28 
    dw $2108,$C208 
    db $18 
    dw $A104,$C208 
    db $08 
    dw $A106,$C208 
    db $F8 
    dw $2106,$C208 
    db $E8 
    dw $2104,$C208 
    db $D8 
    dw $2102,$C3F8 
    db $D8 
    dw $2100 

Spritemap_CeresDoor_FacingLeft_Closed:
    dw $0008,$01F8 
    db $18 
    dw $E0D1,$01F8 
    db $10 
    dw $E0D3,$01F8 
    db $E0 
    dw $60D1,$01F8 
    db $E8 
    dw $60D3,$01F8 
    db $00 
    dw $E0F2,$01F8 
    db $08 
    dw $E0E2,$01F8 
    db $F8 
    dw $60F2,$01F8 
    db $F0 
    dw $60E2 

Spritemap_CeresDoor_FacingLeft_OpeningFrame1:
    dw $0008,$01F8 
    db $10 
    dw $E0F3,$01F8 
    db $18 
    dw $E0E3,$01F8 
    db $E8 
    dw $60F3,$01F8 
    db $E0 
    dw $60E3,$01FA 
    db $00 
    dw $E0F2,$01FA 
    db $08 
    dw $E0E2,$01FA 
    db $F8 
    dw $60F2,$01FA 
    db $F0 
    dw $60E2 

Spritemap_CeresDoor_FacingLeft_OpeningFrame2:
    dw $0006,$01F8 
    db $18 
    dw $E0D0,$01F8 
    db $E0 
    dw $60D0,$01FC 
    db $00 
    dw $E0F2,$01FC 
    db $08 
    dw $E0E2,$01FC 
    db $F8 
    dw $60F2,$01FC 
    db $F0 
    dw $60E2 

Spritemap_CeresDoor_FacingLeft_OpeningFrame3:
    dw $0006,$01F8 
    db $E0 
    dw $60D2,$01F8 
    db $18 
    dw $E0D2,$01FE 
    db $00 
    dw $E0F2,$01FE 
    db $08 
    dw $E0E2,$01FE 
    db $F8 
    dw $60F2,$01FE 
    db $F0 
    dw $60E2 

Spritemap_CeresDoor_FacingLeft_Open:
    dw $0006,$01FA 
    db $18 
    dw $E0D2,$01FA 
    db $E0 
    dw $60D2,$01FF 
    db $00 
    dw $E0F2,$01FF 
    db $08 
    dw $E0E2,$01FF 
    db $F8 
    dw $60F2,$01FF 
    db $F0 
    dw $60E2 

Spritemap_CeresDoor_FacingRight_Closed:
    dw $0008,$0000 
    db $18 
    dw $A0D1,$0000 
    db $E0 
    dw $20D1,$0000 
    db $10 
    dw $A0D3,$0000 
    db $E8 
    dw $20D3,$0000 
    db $00 
    dw $A0F2,$0000 
    db $08 
    dw $A0E2,$0000 
    db $F8 
    dw $20F2,$0000 
    db $F0 
    dw $20E2 

Spritemap_CeresDoor_FacingRight_OpeningFrame1:
    dw $0008,$0000 
    db $10 
    dw $A0F3,$0000 
    db $18 
    dw $A0E3,$0000 
    db $E8 
    dw $20F3,$0000 
    db $E0 
    dw $20E3,$01FE 
    db $00 
    dw $A0F2,$01FE 
    db $08 
    dw $A0E2,$01FE 
    db $F8 
    dw $20F2,$01FE 
    db $F0 
    dw $20E2 

Spritemap_CeresDoor_FacingRight_OpeningFrame2:
    dw $0006,$0000 
    db $18 
    dw $A0D0,$0000 
    db $E0 
    dw $20D0,$01FC 
    db $00 
    dw $A0F2,$01FC 
    db $08 
    dw $A0E2,$01FC 
    db $F8 
    dw $20F2,$01FC 
    db $F0 
    dw $20E2 

Spritemap_CeresDoor_FacingRight_OpeningFrame3:
    dw $0006,$0000 
    db $18 
    dw $A0D2,$0000 
    db $E0 
    dw $20D2,$01FA 
    db $00 
    dw $A0F2,$01FA 
    db $08 
    dw $A0E2,$01FA 
    db $F8 
    dw $20F2,$01FA 
    db $F0 
    dw $20E2 

Spritemap_CeresDoor_FacingRight_Open:
    dw $0006,$01FE 
    db $18 
    dw $A0D2,$01FE 
    db $E0 
    dw $20D2,$01F9 
    db $00 
    dw $A0F2,$01F9 
    db $08 
    dw $A0E2,$01F9 
    db $F8 
    dw $20F2,$01F9 
    db $F0 
    dw $20E2 

Spritemap_CeresDoor_Placeholder:
    dw $0001,$0008 
    db $08 
    dw $2020 

Spritemap_CeresDoor_RidleyEscapeMode7LeftWall:
    dw $0013,$C3F8 
    db $40 
    dw $04E6,$C3F8 
    db $20 
    dw $04E8,$C3F8 
    db $D0 
    dw $84E8,$C218 
    db $20 
    dw $04EE,$C3F8 
    db $80 
    dw $04E6,$C3F8 
    db $A0 
    dw $04E6,$C3F8 
    db $B0 
    dw $04E6,$C3F8 
    db $90 
    dw $04E6,$C3F8 
    db $C0 
    dw $04E6,$C218 
    db $40 
    dw $04EE,$C218 
    db $30 
    dw $04EE,$C208 
    db $40 
    dw $04EE,$C208 
    db $30 
    dw $04EE,$C208 
    db $20 
    dw $04EE,$C3F8 
    db $30 
    dw $04E6,$C3F8 
    db $00 
    dw $84E4,$C3F8 
    db $10 
    dw $84E0,$C3F8 
    db $F0 
    dw $04E4,$C3F8 
    db $E0 
    dw $04E0 

Spritemap_CeresDoor_RidleyEscapeMode7RightWall:
    dw $000D,$C3F8 
    db $80 
    dw $04E6,$C3F8 
    db $90 
    dw $04E6,$C3F8 
    db $A0 
    dw $04E6,$C3F8 
    db $B0 
    dw $04E6,$C3F8 
    db $C0 
    dw $04E6,$C3F8 
    db $D0 
    dw $04E6,$C3F8 
    db $E0 
    dw $04E6,$C3F8 
    db $F0 
    dw $04E6,$C3F8 
    db $00 
    dw $04E6,$C3F8 
    db $10 
    dw $04E6,$C3F8 
    db $20 
    dw $04E6,$C3F8 
    db $40 
    dw $84E8,$C3F8 
    db $30 
    dw $04E6 

InitAI_Zebetite:
    LDX.W $0E54 
    LDA.W $0F86,X 
    ORA.W #$A000 
    STA.W $0F86,X 
    LDA.W #$0001 : STA.W $0F94,X 
    STZ.W $0F90,X 
    LDA.W #$0400 : STA.W $0F96,X 
    LDA.W #$0080 : STA.W $0F98,X 
    STZ.W $0FAC,X 
    LDY.W #Function_Zebetite_SpawnBottomZebetiteIfNeeded 
    LDA.W $0FB4,X 
    BEQ .setFunctionPointer 
    LDY.W #Function_Zebetite_WaitForDoorTransitionToFinish 

.setFunctionPointer:
    TYA 
    STA.W $0FA8,X 
    STZ.B $12 
    LDA.W #$0005 
    JSL.L CheckIfEvent_inA_HasHappened 
    ROL.B $12 
    LDA.W #$0004 
    JSL.L CheckIfEvent_inA_HasHappened 
    ROL.B $12 
    LDA.W #$0003 
    JSL.L CheckIfEvent_inA_HasHappened 
    ROL.B $12 
    LDA.B $12 : STA.W $0FAE,X 
    CMP.W #$0004 
    BMI .notAllDestroyed 
    LDA.W $0F86,X 
    ORA.W #$0200 
    STA.W $0F86,X 
    RTL 


.notAllDestroyed:
    ASL A 
    TAY 
    LDA.W .multipartFlag,Y : STA.W $0FB2,X 
    LDA.W .height,Y : STA.W $0F84,X 
    LDA.W .instListPointer,Y : STA.W $0F92,X 
    LDA.W .XPosition,Y : STA.W $0F7A,X 
    LDA.W $0FB4,X 
    BEQ .zeroParam1 
    LDA.W .YPosition_nonZero,Y : STA.W $0F7E,X 
    RTL 


.zeroParam1:
    LDA.W .YPosition_zero,Y : STA.W $0F7E,X 
    RTL 


.multipartFlag:
    dw $0000,$8000,$0000,$8000 

.height:
    dw $0018,$0008,$0018,$0008 

.instListPointer:
    dw InstList_Big_HealthGreaterThanEqualTo800 
    dw InstList_Small_HealthGreaterThanEqualTo800 
    dw InstList_Big_HealthGreaterThanEqualTo800 
    dw InstList_Small_HealthGreaterThanEqualTo800 

.XPosition:
    dw $0338,$0278,$01B8,$00F8 

.YPosition_zero:
    dw $006F,$0047,$006F,$0047 

.YPosition_nonZero:
    dw $006F,$0097,$006F,$0097 

MainAI_Zebetite:
    LDX.W $0E54 
    LDA.W $1840 
    BNE .function 
    STZ.W $0FA2,X 

.function:
    JMP.W ($0FA8,X) 


Function_Zebetite_SpawnBottomZebetiteIfNeeded:
    LDA.W $0FB2,X 
    BPL .notNeeded 
    JSR.W SpawnBottomZebetite 
    LDA.W $0E54 : STA.W $0FB6,X 
    TAY 
    TXA 
    TYX 
    STA.W $0FB6,X 

.notNeeded:
    LDA.W #Function_Zebetite_WaitForDoorTransitionToFinish : STA.W $0FA8,X ; fallthrough to Function_Zebetite_WaitForDoorTransitionToFinish

Function_Zebetite_WaitForDoorTransitionToFinish:
    LDA.W $0795 
    BEQ .finished 
    RTL 


.finished:
    LDA.W #Function_Zebetite_Active : STA.W $0FA8,X 

Function_Zebetite_Active:
    JSR.W HandleZebetitePaletteAnimation 
    JSR.W SetZebetiteInstList 
    LDX.W $0E54 
    LDA.W $0F8C,X 
    BEQ .destroyed 
    CLC 
    ADC.W #$0001 
    CMP.W #$03E8 
    BMI + 
    LDA.W #$03E8 

  + STA.W $0F8C,X 
    RTL 


.destroyed:
    LDA.W $0FB4,X 
    BEQ .singlePart 

.noMore:
    LDA.W #$0000 
    JML.L EnemyDeath 


.singlePart:
    JSR.W MarkZebetiteDestroyedEvent 
    LDX.W $0E54 
    LDA.W $0FAE,X 
    CMP.W #$0004 
    BPL .noMore 
    LDA.W #$0000 
    JSL.L EnemyDeath 
    JSR.W SpawnTopZebetite 
    RTL 


MarkZebetiteDestroyedEvent:
    LDX.W $0E54 
    LDA.W $0FAE,X 
    INC A 
    STA.W $0FAE,X 
    STA.B $12 
    LDY.W #$0003 
    ROR.B $12 
    JSR.W MarkUnmarkZebetiteDestroyedCounterEvent 
    LDY.W #$0004 
    ROR.B $12 
    JSR.W MarkUnmarkZebetiteDestroyedCounterEvent 
    LDY.W #$0005 
    ROR.B $12 ; fallthrough to MarkUnmarkZebetiteDestroyedCounterEvent

MarkUnmarkZebetiteDestroyedCounterEvent:
    BCC .unmark 
    TYA 
    JSL.L MarkEvent_inA 
    RTS 


.unmark:
    TYA 
    JSL.L UnmarkEvent_inA 
    RTS 


SpawnTopZebetite:
    LDX.W #.enemy 
    JSL.L SpawnEnemy 
    RTS 

  .enemy
    dw EnemyHeaders_Zebetite 
    dw $0000,$0000,$0000,$2000,$0000,$0000,$0000 

SpawnBottomZebetite:
    LDX.W #.enemy 
    JSL.L SpawnEnemy 
    RTS 

  .enemy
    dw EnemyHeaders_Zebetite 
    dw $0000,$0000,$0000,$2000,$0000,$0002,$0000 

SetZebetiteInstList:
    LDX.W $0E54 
    LDY.W #$0000 
    LDA.W $0F8C,X 
    CMP.W #$0320 
    BPL .indexInY 
    LDY.W #$0002 
    CMP.W #$0258 
    BPL .indexInY 
    LDY.W #$0004 
    CMP.W #$0190 
    BPL .indexInY 
    LDY.W #$0006 
    CMP.W #$00C8 
    BPL .indexInY 
    LDY.W #$0008 

.indexInY:
    LDA.W .bigZebetite,Y 
    BIT.W $0FB2,X 
    BPL .keepBig 
    LDA.W .smallZebetite,Y 

.keepBig:
    STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    STZ.W $0F90,X 
    RTS 


.bigZebetite:
    dw InstList_Big_HealthGreaterThanEqualTo800 
    dw InstList_Big_HealthLessThan800 
    dw InstList_Big_HealthLessThan600 
    dw InstList_Big_HealthLessThan400 
    dw InstList_Big_HealthLessThan200 

.smallZebetite:
    dw InstList_Small_HealthGreaterThanEqualTo800 
    dw InstList_Small_HealthLessThan800 
    dw InstList_Small_HealthLessThan600 
    dw InstList_Small_HealthLessThan400 
    dw InstList_Small_HealthLessThan200 

HandleZebetitePaletteAnimation:
    LDA.L $7EC400 
    BNE .return 
    LDX.W $0E54 
    LDA.W $0FB4,X 
    BNE .return 
    LDA.W $0FAC 
    INC A 
    AND.W #$0007 
    STA.W $0FAC 
    ASL #2
    ADC.W #.colors 
    TAY 
    LDX.W #$0158 
    LDA.W #$0002 
    JSL.L WriteAColorsFromYtoColorIndexX 

.return:
    RTS 


.colors:
    dw $005F,$0037,$003F,$0019,$003F,$001B,$001F,$001D 
    dw $001F,$001F,$001F,$001D,$003F,$001B,$003F,$0019 

EnemyTouch_Zebetite:
    JSL.L NormalEnemyTouchAI_NoDeathCheck_External 
    RTL 


EnemyShot_Zebetite:
    PHA 
    LDA.W #$0009 
    JSL.L QueueSound_Lib3_Max6 
    PLA 
    JSL.L NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External 
    LDX.W $0E54 
    LDY.W $0FB6,X 
    LDA.W $0F8C,X : STA.W $0F8C,Y 
    LDA.W $0F9C,X : STA.W $0F9C,Y 
    RTL 


InstList_Big_HealthGreaterThanEqualTo800:
    dw $0001 
    dw Spritemap_Zebetite_Big_HealthGreaterThanEqualTo800 
    dw Instruction_Common_Sleep 

InstList_Big_HealthLessThan800:
    dw $0001 
    dw SpritemapZebetite_Big_HealthLessThan800 
    dw Instruction_CommonA6_Sleep 

InstList_Big_HealthLessThan600:
    dw $0001 
    dw SpritemapZebetite_Big_HealthLessThan600 
    dw Instruction_CommonA6_Sleep 

InstList_Big_HealthLessThan400:
    dw $0001 
    dw SpritemapZebetite_Big_HealthLessThan400 
    dw Instruction_CommonA6_Sleep 

InstList_Big_HealthLessThan200:
    dw $0001 
    dw SpritemapZebetite_Big_HealthLessThan200 
    dw Instruction_CommonA6_Sleep 

InstList_Small_HealthGreaterThanEqualTo800:
    dw $0001 
    dw Spritemap_Zebetite_Small_HealthGreaterThanEqualTo800 
    dw Instruction_CommonA6_Sleep 

InstList_Small_HealthLessThan800:
    dw $0001 
    dw SpritemapZebetite_Small_HealthLessThan800 
    dw Instruction_CommonA6_Sleep 

InstList_Small_HealthLessThan600:
    dw $0001 
    dw SpritemapZebetite_Small_HealthLessThan600 
    dw Instruction_Common_Sleep 

InstList_Small_HealthLessThan400:
    dw $0001 
    dw SpritemapZebetite_Small_HealthLessThan400 
    dw Instruction_CommonA6_Sleep 

InstList_Small_HealthLessThan200:
    dw $0001 
    dw SpritemapZebetite_Small_HealthLessThan200 
    dw Instruction_CommonA6_Sleep 

Spritemap_Zebetite_Big_HealthGreaterThanEqualTo800:
    dw $0003,$C3F8 
    db $08 
    dw $310C,$C3F8 
    db $F8 
    dw $310C,$C3F8 
    db $E8 
    dw $310C 

SpritemapZebetite_Big_HealthLessThan800:
    dw $0003,$C3F8 
    db $08 
    dw $310E,$C3F8 
    db $F8 
    dw $310E,$C3F8 
    db $E8 
    dw $310E 

SpritemapZebetite_Big_HealthLessThan600:
    dw $0006,$01FC 
    db $10 
    dw $3121,$01FC 
    db $08 
    dw $3120,$01FC 
    db $00 
    dw $3121,$01FC 
    db $F8 
    dw $3120,$01FC 
    db $F0 
    dw $3121,$01FC 
    db $E8 
    dw $3120 

SpritemapZebetite_Big_HealthLessThan400:
    dw $0006,$01FC 
    db $10 
    dw $3123,$01FC 
    db $08 
    dw $3122,$01FC 
    db $00 
    dw $3123,$01FC 
    db $F8 
    dw $3122,$01FC 
    db $F0 
    dw $3123,$01FC 
    db $E8 
    dw $3122 

SpritemapZebetite_Big_HealthLessThan200:
    dw $0006,$01FC 
    db $10 
    dw $3125,$01FC 
    db $00 
    dw $3125,$01FC 
    db $08 
    dw $3124,$01FC 
    db $F8 
    dw $3124,$01FC 
    db $F0 
    dw $3125,$01FC 
    db $E8 
    dw $3124 

Spritemap_Zebetite_Small_HealthGreaterThanEqualTo800:
    dw $0001,$C3F8 
    db $F8 
    dw $310C 

SpritemapZebetite_Small_HealthLessThan800:
    dw $0001,$C3F8 
    db $F8 
    dw $310E 

SpritemapZebetite_Small_HealthLessThan600:
    dw $0002,$01FC 
    db $00 
    dw $3121,$01FC 
    db $F8 
    dw $3120 

SpritemapZebetite_Small_HealthLessThan400:
    dw $0002,$01FC 
    db $00 
    dw $3123,$01FC 
    db $F8 
    dw $3122 

SpritemapZebetite_Small_HealthLessThan200:
    dw $0002,$01FC 
    db $00 
    dw $3125,$01FC 
    db $F8 
    dw $3124 

Freespace_BankA6_FEBC: 
; $144 bytes
