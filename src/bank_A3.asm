
org $A38000


CommonA3_GrappleAI_NoInteraction:
    JSL.L GrappleAI_SwitchEnemyAIToMainAI 
    RTL 


CommonA3_GrappleAI_SamusLatchesOn:
    JSL.L GrappleAI_SamusLatchesOnWithGrapple 
    RTL 


CommonA3_GrappleAI_KillEnemy:
    JSL.L GrappleAI_EnemyGrappleDeath 
    RTL 


CommonA3_GrappleAI_CancelGrappleBeam:
    JSL.L GrappleAI_SwitchToFrozenAI 
    RTL 


CommonA3_GrappleAI_SamusLatchesOn_NoInvincibility:
    JSL.L GrappleAI_SamusLatchesOnWithGrapple_NoInvincibility 
    RTL 


UNUSED_CommonA3_GrappleAI_SamusLatchesOn_ParalyzeEnemy_A38019:
    JSL.L GrappleAI_SamusLatchesOnWithGrapple_ParalyzeEnemy 
    RTL 


CommonA3_GrappleAI_HurtSamus:
    JSL.L GrappleAI_SwitchToFrozenAI_duplicate 
    RTL 


CommonA3_NormalEnemyTouchAI:
    JSL.L NormalEnemyTouchAI 
    RTL 


CommonA3_NormalTouchAI_NoDeathCheck:
    JSL.L NormalEnemyTouchAI_NoDeathCheck_External 
    RTL 


CommonA3_NormalEnemyShotAI:
    JSL.L NormalEnemyShotAI 
    RTL 


CommonA3_NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic:
    JSL.L NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External 
    RTL 


CommonA3_NormalEnemyPowerBombAI:
    JSL.L NormalEnemyPowerBombAI 
    RTL 


CommonA3_NormalEnemyPowerBombAI_NoDeathCheck:
    JSL.L NormalEnemyPowerBombAI_NoDeathCheck_External 
    RTL 


CommonA3_NormalEnemyFrozenAI:
    JSL.L NormalEnemyFrozenAI 
    RTL 


CommonA3_CreateADudShot:
    JSL.L CreateADudShot 
    RTL 


RTS_A3804B:
    RTS 


RTL_A3804C:
    RTL 


Spritemap_CommonA3_Nothing:
    dw $0000 

ExtendedSpritemap_CommonA3_Nothing:
    dw $0001,$0000,$0000 
    dw Spritemap_CommonA3_Nothing 
    dw Hitbox_CommonA3_Nothing 

Hitbox_CommonA3_Nothing:
    dw $0001,$0000,$0000,$0000,$0000 
    dw CommonA3_NormalEnemyTouchAI 
    dw CommonA3_NormalEnemyShotAI 

InstList_CommonA3_DeleteEnemy:
    dw Instruction_CommonA3_DeleteEnemy 

NOPNOP_A38069:
    NOP 
    NOP 

Instruction_CommonA3_Enemy0FB2_InY:
    LDA.W $0000,Y 
    STA.W $0FB2,X 
    INY #2
    RTL 


Instruction_CommonA3_SetEnemy0FB2ToRTS:
    LDA.W #RTS_A3807B 
    STA.W $0FB2,X 
    RTL 


RTS_A3807B:
    RTS 


Instruction_CommonA3_DeleteEnemy:
    LDA.W $0F86,X 
    ORA.W #$0200 
    STA.W $0F86,X 
    PLA 
    PEA.W ProcessEnemyInstructions_return-1 
    RTL 


Instruction_CommonA3_CallFunctionInY:
    LDA.W $0000,Y 
    STA.B $12 
    PHY 
    PHX 
    PEA.W .manualReturn-1 
    JMP.W ($0012) 


.manualReturn:
    PLX 
    PLY 
    INY #2
    RTL 


Instruction_CommonA3_CallFunctionInY_WithA:
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
UNUSED_Instruction_CommonA3_CallExternalFunctionInY_A380B5:
    LDA.W $0000,Y 
    STA.B $12 
    LDA.W $0001,Y 
    STA.B $13 
    PHX 
    PHY 
    JSL.L .externalFunction 
    PLY 
    PLX 
    INY #3
    RTL 


.externalFunction:
    JML.W [$0012] 


UNUSED_Inst_CommonA3_CallExternalFunctionInY_WithA_A380CE:
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


Instruction_CommonA3_GotoY:
    LDA.W $0000,Y 
    TAY 
    RTL 


Instruction_CommonA3_GotoY_PlusY:
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

    DEC.W $0F90,X 

Instruction_CommonA3_DecrementTimer_GotoYIfNonZero:
    BNE Instruction_CommonA3_GotoY 
    INY #2
    RTL 


Instruction_CommonA3_DecrementTimer_GotoYIfNonZero_duplicate:
    DEC.W $0F90,X 
    BNE Instruction_CommonA3_GotoY 
    INY #2
    RTL 


Instruction_CommonA3_DecrementTimer_GotoY_PlusY_IfNonZero:
    SEP #$20 
    DEC.W $0F90,X 
    REP #$20 
    BNE Instruction_CommonA3_GotoY_PlusY 
    INY 
    RTL 


Instruction_CommonA3_TimerInY:
    LDA.W $0000,Y 
    STA.W $0F90,X 
    INY #2
    RTL 


Instruction_CommonA3_SkipNextInstruction:
    INY #2
    RTL 


Instruction_CommonA3_Sleep:
    DEY #2
    TYA 
    STA.W $0F92,X 
    PLA 
    PEA.W ProcessEnemyInstructions_return-1 
    RTL 


Instruction_CommonA3_WaitYFrames:
    LDA.W $0000,Y 
    STA.W $0F94,X 
    INY #2
    TYA 
    STA.W $0F92,X 
    PLA 
    PEA.W ProcessEnemyInstructions_return-1 
    RTL 


Instruction_CommonA3_TransferYBytesInYToVRAM:
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


Instruction_CommonA3_EnableOffScreenProcessing:
    LDA.W $0F86,X 
    ORA.W #$0800 
    STA.W $0F86,X 
    RTL 


Instruction_CommonA3_DisableOffScreenProcessing:
    LDA.W $0F86,X 
    AND.W #$F7FF 
    STA.W $0F86,X 
    RTL 


CommonA3EnemySpeeds_LinearlyIncreasing:
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

CommonA3EnemySpeeds_QuadraticallyIncreasing:
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

Palette_Waver:
    dw $3800,$72FA,$55B0,$2845,$1801,$6210,$496B,$38C6 
    dw $2C63,$241F,$1C17,$142F,$0C47,$3BE0,$2680,$1580 

InstList_Waver_Steady_FacingLeft:
    dw $0001 
    dw Spritemap_Waver_2 
    dw Instruction_Common_Sleep 

InstList_Waver_Steady_FacingRight:
    dw $0001 
    dw Spritemap_Waver_7 
    dw Instruction_Common_Sleep 

InstList_Waver_Spinning_FacingLeft:
    dw $0008 
    dw Spritemap_Waver_3 
    dw $0008 
    dw Spritemap_Waver_4 
    dw $0008 
    dw Spritemap_Waver_0 
    dw $0008 
    dw Spritemap_Waver_1 
    dw Instruction_Waver_SetSpinFinishedFlag 
    dw Instruction_Common_Sleep 

InstList_Waver_Spinning_FacingRight:
    dw $0008 
    dw Spritemap_Waver_8 
    dw $0008 
    dw Spritemap_Waver_9 
    dw $0008 
    dw Spritemap_Waver_5 
    dw $0008 
    dw Spritemap_Waver_6 
    dw Instruction_Waver_SetSpinFinishedFlag 
    dw Instruction_Common_Sleep 

InstListPointers_Waver:
    dw InstList_Waver_Steady_FacingLeft 
    dw InstList_Waver_Steady_FacingRight 
    dw InstList_Waver_Spinning_FacingLeft 
    dw InstList_Waver_Spinning_FacingRight 

Instruction_Waver_SetSpinFinishedFlag:
    LDX.W $0E54 
    LDA.W #$0001 
    STA.W $0FB0,X 
    RTL 


InitAI_Waver:
    LDX.W $0E54 
    LDA.W #$0180 
    AND.W #$FF00 
    XBA 
    STA.W $0FAA,X 
    LDA.W #$0180 
    AND.W #$00FF 
    XBA 
    STA.W $0FA8,X 
    LDA.W $0FB4,X 
    AND.W #$0001 
    BNE .facingLeft 
    LDA.W #$0180 
    EOR.W #$FFFF 
    INC A 
    AND.W #$FF00 
    XBA 
    JSL.L Sign_Extend_A 
    STA.W $0FAA,X 
    LDA.W #$0180 
    EOR.W #$FFFF 
    INC A 
    AND.W #$00FF 
    XBA 
    JSL.L Sign_Extend_A 
    STA.W $0FA8,X 

.facingLeft:
    STZ.W $0FB2,X 
    STZ.W $0FAC,X 
    STZ.W $0FB0,X 
    LDA.W #InstList_Waver_Steady_FacingLeft 
    STA.W $0F92,X 
    LDA.W $0FB4,X 
    AND.W #$0001 
    STA.W $0FB2,X 
    JSR.W SetWaverInstList 
    RTL 


MainAI_Waver:
    LDX.W $0E54 
    LDA.W $0FA8,X 
    STA.B $12 
    LDA.W $0FAA,X 
    STA.B $14 
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes 
    BCC .noWallCollision 
    LDA.W $0FA9,X 
    STA.B $12 
    EOR.W #$FFFF 
    INC A 
    AND.W #$FF00 
    XBA 
    JSL.L Sign_Extend_A 
    STA.W $0FAA,X 
    LDA.B $12 
    EOR.W #$FFFF 
    INC A 
    AND.W #$00FF 
    XBA 
    JSL.L Sign_Extend_A 
    STA.W $0FA8,X 
    LDA.W $0FB2,X 
    EOR.W #$0001 
    AND.W #$0001 
    STA.W $0FB2,X 
    JSR.W SetWaverInstList 
    JMP.W .merge 


.noWallCollision:
    LDA.W #$0004 
    STA.W $0E32 
    LDA.W $0FAE,X 
    AND.W #$00FF 
    JSL.L EightBitNegativeSineMultiplication_A0B0C6 
    STA.B $14 
    STZ.B $12 
    JSL.L MoveEnemyDownBy_14_12 
    BCC .noBlockCollision 
    LDX.W $0E54 
    LDA.W $0FAE,X 
    CLC 
    ADC.W #$0080 
    AND.W #$00FF 
    STA.W $0FAE,X 
    BRA .merge 


.noBlockCollision:
    LDX.W $0E54 
    LDA.W $0FAE,X 
    CLC 
    ADC.W #$0002 
    STA.W $0FAE,X 

.merge:
    LDX.W $0E54 
    LDA.W $0FAE,X 
    AND.W #$007F 
    CMP.W #$0038 
    BNE .notSpinning 
    LDA.W $0FB2,X 
    ORA.W #$0002 
    STA.W $0FB2,X 
    JSR.W SetWaverInstList 

.notSpinning:
    LDA.W $0FB0,X 
    BEQ .return 
    STZ.W $0FB0,X 
    LDA.W $0FB2,X 
    AND.W #$0001 
    STA.W $0FB2,X 
    JSR.W SetWaverInstList 

.return:
    RTL 


SetWaverInstList:
    LDX.W $0E54 
    LDA.W $0FB2,X 
    CMP.W $0FAC,X 
    BEQ .return 
    STA.W $0FAC,X 
    ASL A 
    TAY 
    LDA.W InstListPointers_Waver,Y 
    STA.W $0F92,X 
    LDA.W #$0001 
    STA.W $0F94,X 
    STZ.W $0F90,X 

.return:
    RTS 


Spritemap_Waver_0:
    dw $0004,$0000 
    db $08 
    dw $2122,$01F8 
    db $08 
    dw $2121,$8000 
    db $F8 
    dw $2102,$81F0 
    db $F8 
    dw $2100 

Spritemap_Waver_1:
    dw $0004,$01ED 
    db $FC 
    dw $2124,$0005 
    db $00 
    dw $2116,$0005 
    db $F8 
    dw $2106,$81F5 
    db $F8 
    dw $2104 

Spritemap_Waver_2:
    dw $0003,$01ED 
    db $FD 
    dw $2126,$01F5 
    db $FD 
    dw $2127,$81FD 
    db $F8 
    dw $2107 

Spritemap_Waver_3:
    dw $0004,$01EC 
    db $FC 
    dw $2129,$0004 
    db $00 
    dw $211B,$0004 
    db $F8 
    dw $210B,$81F4 
    db $F8 
    dw $2109 

Spritemap_Waver_4:
    dw $0004,$0000 
    db $08 
    dw $212E,$01F8 
    db $08 
    dw $212D,$8000 
    db $F8 
    dw $210E,$81F0 
    db $F8 
    dw $210C 

Spritemap_Waver_5:
    dw $0004,$01F8 
    db $08 
    dw $6122,$0000 
    db $08 
    dw $6121,$81F0 
    db $F8 
    dw $6102,$8000 
    db $F8 
    dw $6100 

Spritemap_Waver_6:
    dw $0004,$000B 
    db $FC 
    dw $6124,$01F3 
    db $00 
    dw $6116,$01F3 
    db $F8 
    dw $6106,$81FB 
    db $F8 
    dw $6104 

Spritemap_Waver_7:
    dw $0003,$000B 
    db $FD 
    dw $6126,$0003 
    db $FD 
    dw $6127,$81F3 
    db $F8 
    dw $6107 

Spritemap_Waver_8:
    dw $0004,$000C 
    db $FC 
    dw $6129,$01F4 
    db $00 
    dw $611B,$01F4 
    db $F8 
    dw $610B,$81FC 
    db $F8 
    dw $6109 

Spritemap_Waver_9:
    dw $0004,$01F8 
    db $08 
    dw $612E,$0000 
    db $08 
    dw $612D,$81F0 
    db $F8 
    dw $610E,$8000 
    db $F8 
    dw $610C 

Palette_Metaree:
    dw $3800,$4D1F,$38B6,$246E,$1448,$47FF,$2EFA,$1616 
    dw $0132,$6F39,$5A73,$41AD,$2D08,$1863,$7FFF,$0041 

InstList_Metaree_Idling:
    dw $000A 
    dw Spritemap_Metaree_0 
    dw $000A 
    dw Spritemap_Metaree_2 
    dw $000A 
    dw Spritemap_Metaree_3 
    dw $000A 
    dw Spritemap_Metaree_4 
    dw Instruction_Common_GotoY 
    dw InstList_Metaree_Idling 

InstList_Metaree_PrepareToLaunchAttack:
    dw $0010 
    dw Spritemap_Metaree_0 
    dw $0008 
    dw Spritemap_Metaree_1 
    dw Instruction_Metaree_SetAttackReadyFlag 
    dw Instruction_Common_Sleep 

InstList_Metaree_LaunchedAttack_0:
    dw Instruction_Common_EnableOffScreenProcessing 

InstList_Metaree_LaunchedAttack_1:
    dw $0002 
    dw Spritemap_Metaree_2 
    dw $0002 
    dw Spritemap_Metaree_3 
    dw $0002 
    dw Spritemap_Metaree_4 
    dw $0002 
    dw Spritemap_Metaree_0 
    dw Instruction_Common_GotoY 
    dw InstList_Metaree_LaunchedAttack_1 

UNUSED_InstList_Metaree_StopAnimating_A38946:
    dw Instruction_Common_DisableOffScreenProcessing 
    dw $0001 
    dw Spritemap_Metaree_0 
    dw Instruction_Common_Sleep 

InstListPointers_Metaree:
    dw InstList_Metaree_Idling 
    dw InstList_Metaree_PrepareToLaunchAttack 
    dw InstList_Metaree_LaunchedAttack_0 
    dw UNUSED_InstList_Metaree_StopAnimating_A38946 

Instruction_Metaree_SetAttackReadyFlag:
    LDX.W $0E54 
    LDA.W #$0001 
    STA.W $0FB0,X 
    RTL 


InitAI_Metaree:
    LDX.W $0E54 
    STZ.W $0FAC,X 
    STZ.W $0FAE,X 
    STZ.W $0FB0,X 
    LDA.W #InstList_Metaree_Idling 
    STA.W $0F92,X 
    LDA.W #Function_Metaree_Idling 
    STA.W $0FAA,X 
    RTL 


MainAI_Metaree:
    LDX.W $0E54 
    JMP.W ($0FAA,X) 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_FunctionPointers_Metaree_A3897F:
    dw Function_Metaree_Idling 
    dw Function_Metaree_PrepareToLaunchAttack 
    dw Function_Metaree_LaunchedAttack 
    dw Function_Metaree_Burrowing 
endif ; !FEATURE_KEEP_UNREFERENCED

Function_Metaree_Idling:
    LDX.W $0E54 
    LDA.W $0F7A,X 
    SEC 
    SBC.W $0AF6 
    BPL + 
    EOR.W #$FFFF 
    INC A 

  + CMP.W #$0048 
    BCS .return 
    JSR.W DetermineMetareeYVelocity 
    INC.W $0FAC,X 
    JSR.W SetMetareeInstListPointer 
    LDA.W #Function_Metaree_PrepareToLaunchAttack 
    STA.W $0FAA,X 

.return:
    RTL 


DetermineMetareeYVelocity:
    LDA.W $0AFA 
    SEC 
    SBC.W $0F7E,X 
    STA.W $4204 
    SEP #$20 
    LDA.B #$18 
    STA.W $4206 
    REP #$20 
    NOP 
    NOP 
    NOP 
    NOP 
    NOP 
    NOP 
    NOP 
    LDA.W $4214 
    AND.W #$00FF 
    CLC 
    ADC.W #$0004 
    STA.W $0FB2,X 
    RTS 


Function_Metaree_PrepareToLaunchAttack:
    LDA.W $0FB0,X 
    BEQ .return 
    STZ.W $0FB0,X 
    LDX.W $0E54 
    INC.W $0FAC,X 
    JSR.W SetMetareeInstListPointer 
    LDA.W #Function_Metaree_LaunchedAttack 
    STA.W $0FAA,X 
    LDA.W #$005B 
    JSL.L QueueSound_Lib2_Max6 

.return:
    RTL 


Function_Metaree_LaunchedAttack:
    LDX.W $0E54 
    LDA.W #$0015 
    STA.W $0FA8,X 
    LDA.W $0FB2,X 
    STA.B $14 
    STZ.B $12 
    LDA.W $0F86,X 
    ORA.W #$0003 
    STA.W $0F86,X 
    LDX.W $0E54 
    JSL.L CheckForVerticalSolidBlockCollision_SkreeMetaree 
    BCS .collision 
    LDX.W $0E54 
    LDA.W $0F7E,X 
    CLC 
    ADC.W $0FB2,X 
    STA.W $0F7E,X 
    LDA.W #$0002 
    STA.W $0E24 
    LDA.W $0F7A,X 
    CMP.W $0AF6 
    BMI .steerLeft 
    LDA.W #$FFFE 
    STA.W $0E24 

.steerLeft:
    LDA.W $0F7A,X 
    CLC 
    ADC.W $0E24 
    STA.W $0F7A,X 
    BRA .return 


.collision:
    LDX.W $0E54 
    LDA.W #$0001 
    STA.W $0F94,X 
    STZ.W $0F90,X 
    LDA.W #Function_Metaree_Burrowing 
    STA.W $0FAA,X 
    LDA.W #$005C 
    JSL.L QueueSound_Lib2_Max6 

.return:
    RTL 


Function_Metaree_Burrowing:
    LDX.W $0E54 
    DEC.W $0FA8,X 
    BEQ .delete 
    LDA.W $0FA8,X 
    CMP.W #$0008 
    BNE .timerNot8 
    LDX.W $0E54 
    LDY.W #EnemyProjectile_MetalSkreeParticles_DownRight 
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    LDY.W #EnemyProjectile_MetalSkreeParticles_UpRight 
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    LDY.W #EnemyProjectile_MetalSkreeParticles_DownLeft 
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    LDY.W #EnemyProjectile_MetalSkreeParticles_UpLeft 
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 

.timerNot8:
    LDX.W $0E54 
    INC.W $0F7E,X 
    RTL 


.delete:
    LDX.W $0E54 
    LDA.W $0F96,X 
    ORA.W $0F98,X 
    STA.L $7E7006,X 
    LDA.W #$0A00 
    STA.W $0F96,X 
    STZ.W $0F98,X 
    LDA.W $0F86,X 
    ORA.W #$0200 
    STA.W $0F86,X 
    RTL 


SetMetareeInstListPointer:
    LDX.W $0E54 
    LDA.W $0FAC,X 
    CMP.W $0FAE,X 
    BEQ .return 
    STA.W $0FAE,X 
    ASL A 
    TAY 
    LDA.W InstListPointers_Metaree,Y 
    STA.W $0F92,X 
    LDA.W #$0001 
    STA.W $0F94,X 
    STZ.W $0F90,X 

.return:
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Metaree_DataPointers_A38AD2:
    dw UNUSED_Metaree_Data_A38ADC 
    dw UNUSED_Metaree_Data_A38AE6 
    dw UNUSED_Metaree_Data_A38AF0 
    dw UNUSED_Metaree_Data_A38AFA 
    dw UNUSED_Metaree_Data_A38B04 

UNUSED_Metaree_Data_A38ADC:
    dw $0001,$0000,$FFFE,$0008,$000C 

UNUSED_Metaree_Data_A38AE6:
    dw $0001,$0000,$FFFC,$0008,$0008 

UNUSED_Metaree_Data_A38AF0:
    dw $0001,$0004,$0000,$0002,$000C 

UNUSED_Metaree_Data_A38AFA:
    dw $0001,$0000,$0000,$0008,$0008 

UNUSED_Metaree_Data_A38B04:
    dw $0001,$FFFC,$0000,$0002,$000C 
endif ; !FEATURE_KEEP_UNREFERENCED

RTL_A38B0E:
    RTL 


EnemyShot_Metaree:
    LDX.W $0E54 
    LDA.W $0F98,X 
    STA.W $0E2A 
    LDA.W $0F96,X 
    STA.W $0E2C 
    JSL.L CommonA3_NormalEnemyShotAI 
    LDX.W $0E54 
    LDA.W $0F8C,X 
    BNE .return 
    LDX.W $0E54 
    LDA.W $0E2A 
    STA.W $0F98,X 
    LDA.W $0E2C 
    STA.W $0F96,X 
    LDA.W $0FA8,X 
    LDX.W $0E54 
    LDY.W #EnemyProjectile_MetalSkreeParticles_DownRight 
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    LDY.W #EnemyProjectile_MetalSkreeParticles_UpRight 
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    LDY.W #EnemyProjectile_MetalSkreeParticles_DownLeft 
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    LDY.W #EnemyProjectile_MetalSkreeParticles_UpLeft 
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    LDX.W $0E54 
    STZ.W $0F98,X 
    STZ.W $0F96,X 

.return:
    RTL 


Spritemap_Metaree_0:
    dw $0009,$0004 
    db $F5 
    dw $6122,$0004 
    db $FD 
    dw $6123,$0004 
    db $05 
    dw $6124,$01F4 
    db $05 
    dw $2124,$01F4 
    db $FD 
    dw $2123,$01F4 
    db $F5 
    dw $2122,$0000 
    db $03 
    dw $2121,$01F8 
    db $03 
    dw $2120,$81F8 
    db $F3 
    dw $2100 

Spritemap_Metaree_1:
    dw $0007,$0005 
    db $03 
    dw $6127,$01F3 
    db $03 
    dw $2127,$0005 
    db $FB 
    dw $6126,$01F3 
    db $FB 
    dw $2126,$0005 
    db $F3 
    dw $6125,$01F3 
    db $F3 
    dw $2125,$81F8 
    db $F3 
    dw $2102 

Spritemap_Metaree_2:
    dw $0007,$81F5 
    db $03 
    dw $2106,$81F5 
    db $F3 
    dw $2104,$0000 
    db $03 
    dw $2121,$81F8 
    db $F3 
    dw $2100,$0000 
    db $03 
    dw $212A,$0000 
    db $FB 
    dw $2129,$0000 
    db $F3 
    dw $2128 

Spritemap_Metaree_3:
    dw $0002,$81F8 
    db $03 
    dw $210E,$81F8 
    db $F3 
    dw $210C 

Spritemap_Metaree_4:
    dw $0007,$81FB 
    db $03 
    dw $210A,$81FB 
    db $F3 
    dw $2108,$01F8 
    db $03 
    dw $2120,$81F8 
    db $F3 
    dw $2100,$01F8 
    db $03 
    dw $612A,$01F8 
    db $FB 
    dw $6129,$01F8 
    db $F3 
    dw $6128 

Palette_Fireflea:
    dw $3800,$02FF,$01BF,$000F,$0008,$01BF,$011B,$00BA 
    dw $0011,$7F5A,$5D45,$40C3,$2462,$53E9,$3AC6,$1961 

InstList_Fireflea:
    dw $0002 
    dw Spritemap_Fireflea_0 
    dw $0001 
    dw Spritemap_Fireflea_1 
    dw $0002 
    dw Spritemap_Fireflea_2 
    dw $0001 
    dw Spritemap_Fireflea_1 
    dw $0002 
    dw Spritemap_Fireflea_0 
    dw $0001 
    dw Spritemap_Fireflea_1 
    dw $0002 
    dw Spritemap_Fireflea_2 
    dw $0001 
    dw Spritemap_Fireflea_1 
    dw $0002 
    dw Spritemap_Fireflea_3 
    dw $0001 
    dw Spritemap_Fireflea_4 
    dw $0002 
    dw Spritemap_Fireflea_5 
    dw $0001 
    dw Spritemap_Fireflea_4 
    dw $0002 
    dw Spritemap_Fireflea_6 
    dw $0001 
    dw Spritemap_Fireflea_7 
    dw $0002 
    dw Spritemap_Fireflea_8 
    dw $0001 
    dw Spritemap_Fireflea_7 
    dw $0002 
    dw Spritemap_Fireflea_9 
    dw $0001 
    dw Spritemap_Fireflea_A 
    dw $0002 
    dw Spritemap_Fireflea_B 
    dw $0001 
    dw Spritemap_Fireflea_A 
    dw $0002 
    dw Spritemap_Fireflea_C 
    dw $0001 
    dw Spritemap_Fireflea_D 
    dw $0002 
    dw Spritemap_Fireflea_E 
    dw $0001 
    dw Spritemap_Fireflea_D 
    dw $0002 
    dw Spritemap_Fireflea_F 
    dw $0001 
    dw Spritemap_Fireflea_10 
    dw $0002 
    dw Spritemap_Fireflea_11 
    dw $0001 
    dw Spritemap_Fireflea_10 
    dw $0002 
    dw Spritemap_Fireflea_12 
    dw $0001 
    dw Spritemap_Fireflea_13 
    dw $0002 
    dw Spritemap_Fireflea_14 
    dw $0001 
    dw Spritemap_Fireflea_13 
    dw $0002 
    dw Spritemap_Fireflea_F 
    dw $0001 
    dw Spritemap_Fireflea_10 
    dw $0002 
    dw Spritemap_Fireflea_11 
    dw $0001 
    dw Spritemap_Fireflea_10 
    dw $0002 
    dw Spritemap_Fireflea_C 
    dw $0001 
    dw Spritemap_Fireflea_D 
    dw $0002 
    dw Spritemap_Fireflea_E 
    dw $0001 
    dw Spritemap_Fireflea_D 
    dw $0002 
    dw Spritemap_Fireflea_9 
    dw $0001 
    dw Spritemap_Fireflea_A 
    dw $0002 
    dw Spritemap_Fireflea_B 
    dw $0001 
    dw Spritemap_Fireflea_A 
    dw $0002 
    dw Spritemap_Fireflea_6 
    dw $0001 
    dw Spritemap_Fireflea_7 
    dw $0002 
    dw Spritemap_Fireflea_8 
    dw $0001 
    dw Spritemap_Fireflea_7 
    dw $0002 
    dw Spritemap_Fireflea_3 
    dw $0001 
    dw Spritemap_Fireflea_4 
    dw $0002 
    dw Spritemap_Fireflea_5 
    dw $0001 
    dw Spritemap_Fireflea_4 
    dw Instruction_Common_GotoY 
    dw InstList_Fireflea 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Fireflea_Data_A38D03:
    dw $1000,$2000,$4000,$6000,$8000,$A000,$C000,$E000 

UNUSED_Fireflea_Data_A38D13:
    dw $0001,$2001,$4001,$6001,$8001 
endif ; !FEATURE_KEEP_UNREFERENCED

FirefleaMovementRadii:
    dw $0008,$0010,$0018,$0020,$0028,$0030,$0038,$0040 

InitAI_Fireflea:
    LDX.W $0E54 
    LDA.W #InstList_Fireflea 
    STA.W $0F92,X 
    LDA.W $0FB4,X 
    AND.W #$00FF 
    STA.B $12 
    AND.W #$0002 
    BNE .circleMovement 
    JSR.W SetFirefleaSpeed 
    JSR.W SetFirefleaRadius 
    JSR.W SetFirefleaMinMaxYPositions 
    RTL 


.circleMovement:
    JSR.W SetFirefleaCenter 
    JSR.W SetInitialFirefleaAngle 
    JSR.W SetFirefleaSpeed 
    JSR.W SetFirefleaRadius 
    JSR.W SetInitialCirclingFirefleaPosition 
    RTL 


SetFirefleaCenter:
    LDA.W $0F7A,X 
    STA.W $0FB0,X 
    LDA.W $0F7E,X 
    STA.W $0FB2,X 
    RTS 


SetInitialFirefleaAngle:
    LDA.W $0FB5,X 
    AND.W #$00FF 
    XBA 
    STA.W $0FAE,X 
    RTS 


SetFirefleaSpeed:
    LDA.W $0FB6,X 
    AND.W #$00FF 
    ASL #3
    TAY 
    LDA.B $12 
    AND.W #$0001 
    BNE + 
    INY #4
    + TYA 
    STA.L $7E7804,X 
    LDA.W CommonEnemySpeeds_LinearlyIncreasing,Y 
    STA.W $0FAA,X 
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+2,Y 
    STA.W $0FA8,X 
    RTS 


SetFirefleaRadius:
    LDA.W $0FB7,X 
    AND.W #$00FF 
    ASL A 
    TAY 
    LDA.W FirefleaMovementRadii,Y 
    AND.W #$00FF 
    STA.W $0FAC,X 
    RTS 


SetInitialCirclingFirefleaPosition:
    LDA.W $0FAC,X 
    STA.W $0E32 
    LDA.W $0FAE,X 
    JSL.L EightBitCosineMultiplication_A0B0B2 
    CLC 
    ADC.W $0FB0,X 
    STA.W $0F7A,X 
    LDA.W $0FAC,X 
    STA.W $0E32 
    LDA.W $0FAE,X 
    JSL.L EightBitNegativeSineMultiplication_A0B0C6 
    CLC 
    ADC.W $0FB2,X 
    STA.W $0F7E,X 
    RTS 


SetFirefleaMinMaxYPositions:
    LDA.W $0F7E,X 
    SEC 
    SBC.W $0FAC,X 
    STA.L $7E7800,X 
    LDA.W $0F7E,X 
    CLC 
    ADC.W $0FAC,X 
    STA.L $7E7802,X 
    RTS 


MainAI_Fireflea:
    LDX.W $0E54 
    LDA.W $0FB4,X 
    AND.W #$0002 
    BEQ .verticalMovement 
    LDA.W $0FAC,X 
    STA.W $0E32 
    LDA.W $0FAE,X 
    AND.W #$FF00 
    XBA 
    JSL.L EightBitCosineMultiplication_A0B0B2 
    CLC 
    ADC.W $0FB0,X 
    STA.W $0F7A,X 
    LDA.W $0FAC,X 
    STA.W $0E32 
    LDA.W $0FAE,X 
    AND.W #$FF00 
    XBA 
    JSL.L EightBitNegativeSineMultiplication_A0B0C6 
    CLC 
    ADC.W $0FB2,X 
    STA.W $0F7E,X 
    LDA.W $0FAE,X 
    CLC 
    ADC.W $0FA9,X 
    STA.W $0FAE,X 
    RTL 


.verticalMovement:
    LDA.L $7E7804,X 
    TAY 
    CLC 
    LDA.W $0F80,X 
    ADC.W CommonEnemySpeeds_LinearlyIncreasing+2,Y 
    STA.W $0F80,X 
    LDA.W $0F7E,X 
    ADC.W CommonEnemySpeeds_LinearlyIncreasing,Y 
    STA.W $0F7E,X 
    LDA.W $0F7E,X 
    CMP.L $7E7800,X 
    BMI + 
    LDA.W $0F7E,X 
    CMP.L $7E7802,X 
    BPL + 
    RTL 


  + LDA.L $7E7804,X 
    EOR.W #$0004 
    STA.L $7E7804,X 
    RTL 


EnemyTouch_Fireflea:
    JSL.L CommonA3_NormalEnemyTouchAI 
    JSL.L EnemyDeath 
    LDA.W $177E 
    CLC 
    ADC.W #$0002 
    CMP.W #$000E 
    BPL .return 
    STA.W $177E 

.return:
    RTL 


PowerBombReaction_Fireflea:
    JSL.L CommonA3_NormalEnemyPowerBombAI 
    BRA ShotReaction_Fireflea_Common 


EnemyShot_Fireflea:
    JSL.L CommonA3_NormalEnemyShotAI ; fallthrough to ShotReaction_Fireflea_Common

ShotReaction_Fireflea_Common:
    LDX.W $0E54 
    LDA.W $0F8C,X 
    BNE .return 
    LDA.W $177E 
    CLC 
    ADC.W #$0002 
    CMP.W #$000E 
    BPL .return 
    STA.W $177E 

.return:
    RTL 


Spritemap_Fireflea_0:
    dw $0003,$81F8 
    db $F8 
    dw $3100,$0001 
    db $F6 
    dw $3121,$01F7 
    db $F6 
    dw $3120 

Spritemap_Fireflea_1:
    dw $0003,$81F8 
    db $F8 
    dw $3100,$0001 
    db $F6 
    dw $3123,$01F7 
    db $F6 
    dw $3122 

Spritemap_Fireflea_2:
    dw $0003,$81F8 
    db $F8 
    dw $3100,$0001 
    db $F6 
    dw $3125,$01F7 
    db $F6 
    dw $3124 

Spritemap_Fireflea_3:
    dw $0003,$81F8 
    db $F8 
    dw $3102,$0001 
    db $F6 
    dw $3121,$01F7 
    db $F6 
    dw $3120 

Spritemap_Fireflea_4:
    dw $0003,$81F8 
    db $F8 
    dw $3102,$0001 
    db $F6 
    dw $3123,$01F7 
    db $F6 
    dw $3122 

Spritemap_Fireflea_5:
    dw $0003,$81F8 
    db $F8 
    dw $3102,$0001 
    db $F6 
    dw $3125,$01F7 
    db $F6 
    dw $3124 

Spritemap_Fireflea_6:
    dw $0003,$81F8 
    db $F8 
    dw $3104,$0001 
    db $F6 
    dw $3127,$01F7 
    db $F6 
    dw $3126 

Spritemap_Fireflea_7:
    dw $0003,$81F8 
    db $F8 
    dw $3104,$0001 
    db $F6 
    dw $3129,$01F7 
    db $F6 
    dw $3128 

Spritemap_Fireflea_8:
    dw $0003,$81F8 
    db $F8 
    dw $3104,$0001 
    db $F6 
    dw $312B,$01F7 
    db $F6 
    dw $312A 

Spritemap_Fireflea_9:
    dw $0003,$81F8 
    db $F8 
    dw $3106,$0001 
    db $F6 
    dw $3127,$01F7 
    db $F6 
    dw $3126 

Spritemap_Fireflea_A:
    dw $0003,$81F8 
    db $F8 
    dw $3106,$0001 
    db $F6 
    dw $3129,$01F7 
    db $F6 
    dw $3128 

Spritemap_Fireflea_B:
    dw $0003,$81F8 
    db $F8 
    dw $3106,$0001 
    db $F6 
    dw $312B,$01F7 
    db $F6 
    dw $312A 

Spritemap_Fireflea_C:
    dw $0003,$81F8 
    db $F8 
    dw $3108,$0001 
    db $F6 
    dw $3127,$01F7 
    db $F6 
    dw $3126 

Spritemap_Fireflea_D:
    dw $0003,$81F8 
    db $F8 
    dw $3108,$0001 
    db $F6 
    dw $3129,$01F7 
    db $F6 
    dw $3128 

Spritemap_Fireflea_E:
    dw $0003,$81F8 
    db $F8 
    dw $3108,$0001 
    db $F6 
    dw $312B,$01F7 
    db $F6 
    dw $312A 

Spritemap_Fireflea_F:
    dw $0003,$81F8 
    db $F8 
    dw $310A,$0001 
    db $F6 
    dw $312D,$01F7 
    db $F6 
    dw $312C 

Spritemap_Fireflea_10:
    dw $0003,$81F8 
    db $F8 
    dw $310A,$0001 
    db $F6 
    dw $312F,$01F7 
    db $F6 
    dw $312E 

Spritemap_Fireflea_11:
    dw $0003,$81F8 
    db $F8 
    dw $310A,$0001 
    db $F6 
    dw $311F,$01F7 
    db $F6 
    dw $311E 

Spritemap_Fireflea_12:
    dw $0003,$81F8 
    db $F8 
    dw $310C,$0001 
    db $F6 
    dw $312D,$01F7 
    db $F6 
    dw $312C 

Spritemap_Fireflea_13:
    dw $0003,$0001 
    db $F6 
    dw $312F,$01F7 
    db $F6 
    dw $312E,$81F8 
    db $F8 
    dw $310C 

Spritemap_Fireflea_14:
    dw $0003,$0001 
    db $F6 
    dw $311F,$01F7 
    db $F6 
    dw $311E,$81F8 
    db $F8 
    dw $310C 

Palette_Skultera:
    dw $3800,$72FA,$55B0,$2845,$1801,$6210,$496B,$38C6 
    dw $2C63,$241F,$1C17,$142F,$0C47,$03FF,$0237,$00D1 

InstList_Skultera_SwimmingLeft_0:
    dw Instruction_Skultera_SetLayerTo2 

InstList_Skultera_SwimmingLeft_1:
    dw $000E 
    dw Spritemap_Skultera_0 
    dw $000E 
    dw Spritemap_Skultera_1 
    dw $000E 
    dw Spritemap_Skultera_2 
    dw Instruction_Common_GotoY 
    dw InstList_Skultera_SwimmingLeft_1 

InstList_Skultera_TurningRight:
    dw $000D 
    dw Spritemap_Skultera_3 
    dw $000A 
    dw Spritemap_Skultera_4 
    dw $0008 
    dw Spritemap_Skultera_5 
    dw $0006 
    dw Spritemap_Skultera_6 
    dw $0006 
    dw Spritemap_Skultera_7 
    dw $0008 
    dw Spritemap_Skultera_8 
    dw $000A 
    dw Spritemap_Skultera_9 
    dw $000D 
    dw Spritemap_Skultera_A 
    dw Instruction_Skultera_SetTurnFinishedFlag 
    dw Instruction_Common_Sleep 

InstList_Skultera_SwimmingRight_0:
    dw Instruction_Skultera_SetLayerTo6 

InstList_Skultera_SwimmingRight_1:
    dw $000E 
    dw Spritemap_Skultera_B 
    dw $000E 
    dw Spritemap_Skultera_C 
    dw $000E 
    dw Spritemap_Skultera_D 
    dw Instruction_Common_GotoY 
    dw InstList_Skultera_SwimmingRight_1 

InstList_Skultera_TurningLeft:
    dw $000D 
    dw Spritemap_Skultera_E 
    dw $000A 
    dw Spritemap_Skultera_F 
    dw $0008 
    dw Spritemap_Skultera_10 
    dw $0006 
    dw Spritemap_Skultera_11 
    dw $0006 
    dw Spritemap_Skultera_12 
    dw $0008 
    dw Spritemap_Skultera_13 
    dw $000A 
    dw Spritemap_Skultera_14 
    dw $000D 
    dw Spritemap_Skultera_15 
    dw Instruction_Skultera_SetTurnFinishedFlag 
    dw Instruction_Common_Sleep 

Instruction_Skultera_SetLayerTo6:
    LDX.W $0E54 
    LDA.W #$0006 
    STA.W $0F9A,X 
    RTL 


Instruction_Skultera_SetLayerTo2:
    LDX.W $0E54 
    LDA.W #$0002 
    STA.W $0F9A,X 
    RTL 


Instruction_Skultera_SetTurnFinishedFlag:
    LDX.W $0E54 
    LDA.W #$0001 
    STA.L $7E7802,X 
    RTL 


InitAI_Skultera:
    LDX.W $0E54 
    LDA.W #InstList_Skultera_SwimmingLeft_0 
    STA.W $0F92,X 
    LDA.W #Function_Skultera_SwimmingLeft 
    STA.W $0FA8,X 
    LDA.W $0FB5,X 
    AND.W #$00FF 
    BNE .keepLeft 
    LDA.W #InstList_Skultera_SwimmingRight_0 
    STA.W $0F92,X 
    LDA.W #Function_Skultera_SwimmingRight 
    STA.W $0FA8,X 

.keepLeft:
    LDA.W $0FB4,X 
    AND.W #$00FF 
    ASL #3
    TAY 
    LDA.W CommonEnemySpeeds_LinearlyIncreasing,Y 
    STA.W $0FAC,X 
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+2,Y 
    STA.W $0FAA,X 
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+4,Y 
    STA.W $0FB0,X 
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+6,Y 
    STA.W $0FAE,X 
    LDA.W $0FB6,X 
    AND.W #$00FF 
    STA.L $7E7800,X 
    LDA.W $0FB7,X 
    AND.W #$00FF 
    STA.L $7E7804,X 
    LDA.W #$0000 
    STA.W $0FB2,X 
    STA.L $7E7802,X 
    LDA.L $7E7800,X 
    STA.W $0E32 
    LDA.W $0FB2,X 
    JSL.L EightBitNegativeSineMultiplication_A0B0C6 
    STA.L $7E7806,X 
    RTL 


MainAI_Skultera:
    LDX.W $0E54 
    JSR.W ($0FA8,X) 
    RTL 


Function_Skultera_SwimmingLeft:
    LDX.W $0E54 
    LDA.W $0FAE,X 
    STA.B $12 
    LDA.W $0FB0,X 
    STA.B $14 
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes 
    BCC .noWallCollision 
    LDA.W #Function_Skultera_TurningRight 
    STA.W $0FA8,X 
    LDA.W #$0001 
    STA.W $0F94,X 
    STZ.W $0F90,X 
    LDA.W #InstList_Skultera_TurningRight 
    STA.W $0F92,X 
    BRA .merge 


.noWallCollision:
    LDA.L $7E7800,X 
    STA.W $0E32 
    LDA.W $0FB2,X 
    JSL.L EightBitNegativeSineMultiplication_A0B0C6 
    STA.L $7E7808,X 
    SEC 
    SBC.L $7E7806,X 
    STA.B $14 
    STZ.B $12 
    JSL.L MoveEnemyDownBy_14_12 
    BCC .noBlockCollision 
    LDA.W #Function_Skultera_TurningRight 
    STA.W $0FA8,X 
    LDA.W #$0001 
    STA.W $0F94,X 
    STZ.W $0F90,X 
    LDA.W #InstList_Skultera_TurningRight 
    STA.W $0F92,X 
    BRA .merge 


.noBlockCollision:
    LDA.W $0FB2,X 
    CLC 
    ADC.L $7E7804,X 
    AND.W #$00FF 
    STA.W $0FB2,X 

.merge:
    LDA.L $7E7808,X 
    STA.L $7E7806,X 
    RTS 


Function_Skultera_SwimmingRight:
    LDX.W $0E54 
    LDA.W $0FAA,X 
    STA.B $12 
    LDA.W $0FAC,X 
    STA.B $14 
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes 
    BCC .noWallCollision 
    LDA.W #Function_Skultera_TurningLeft 
    STA.W $0FA8,X 
    LDA.W #$0001 
    STA.W $0F94,X 
    STZ.W $0F90,X 
    LDA.W #InstList_Skultera_TurningLeft 
    STA.W $0F92,X 
    BRA .merge 


.noWallCollision:
    LDA.L $7E7800,X 
    STA.W $0E32 
    LDA.W $0FB2,X 
    JSL.L EightBitNegativeSineMultiplication_A0B0C6 
    STA.L $7E7808,X 
    SEC 
    SBC.L $7E7806,X 
    STA.B $14 
    STZ.B $12 
    JSL.L MoveEnemyDownBy_14_12 
    BCC .noBlockCollision 
    LDA.W #Function_Skultera_TurningLeft 
    STA.W $0FA8,X 
    LDA.W #$0001 
    STA.W $0F94,X 
    STZ.W $0F90,X 
    LDA.W #InstList_Skultera_TurningLeft 
    STA.W $0F92,X 
    BRA .merge 


.noBlockCollision:
    LDA.W $0FB2,X 
    CLC 
    ADC.L $7E7804,X 
    AND.W #$00FF 
    STA.W $0FB2,X 

.merge:
    LDA.L $7E7808,X 
    STA.L $7E7806,X 
    RTS 


Function_Skultera_TurningRight:
    LDX.W $0E54 
    LDA.L $7E7802,X 
    BEQ .return 
    LDA.W #$0000 
    STA.L $7E7802,X 
    LDA.W #Function_Skultera_SwimmingRight 
    STA.W $0FA8,X 
    LDA.L $7E7804,X 
    EOR.W #$FFFF 
    INC A 
    STA.L $7E7804,X 
    LDA.W #$0001 
    STA.W $0F94,X 
    STZ.W $0F90,X 
    LDA.W #InstList_Skultera_SwimmingRight_0 
    STA.W $0F92,X 

.return:
    RTS 


Function_Skultera_TurningLeft:
    LDX.W $0E54 
    LDA.L $7E7802,X 
    BEQ .return 
    LDA.W #$0000 
    STA.L $7E7802,X 
    LDA.W #Function_Skultera_SwimmingLeft 
    STA.W $0FA8,X 
    LDA.L $7E7804,X 
    EOR.W #$FFFF 
    INC A 
    STA.L $7E7804,X 
    LDA.W #$0001 
    STA.W $0F94,X 
    STZ.W $0F90,X 
    LDA.W #InstList_Skultera_SwimmingLeft_0 
    STA.W $0F92,X 

.return:
    RTS 


RTL_A39288:
    RTL 


RTL_A39289:
    RTL 


Spritemap_Skultera_0:
    dw $0005,$C3F2 
    db $00 
    dw $2104,$C3F2 
    db $F0 
    dw $2100,$01FE 
    db $FD 
    dw $2120,$0003 
    db $FE 
    dw $2121,$0008 
    db $FE 
    dw $2123 

Spritemap_Skultera_1:
    dw $0005,$C3F2 
    db $00 
    dw $2102,$C3F2 
    db $F0 
    dw $2100,$01FE 
    db $FE 
    dw $2121,$0003 
    db $00 
    dw $2122,$0008 
    db $FE 
    dw $2124 

Spritemap_Skultera_2:
    dw $0005,$C3F2 
    db $00 
    dw $2102,$C3F2 
    db $F0 
    dw $2100,$01FE 
    db $00 
    dw $2122,$0003 
    db $FD 
    dw $2120,$0008 
    db $FE 
    dw $2125 

Spritemap_Skultera_3:
    dw $0005,$0008 
    db $FE 
    dw $2123,$0003 
    db $FE 
    dw $2121,$01FE 
    db $FD 
    dw $2120,$C3F2 
    db $00 
    dw $2102,$C3F2 
    db $F0 
    dw $2100 

Spritemap_Skultera_4:
    dw $0005,$C3F2 
    db $00 
    dw $2108,$C3F2 
    db $F0 
    dw $2106,$01FC 
    db $FE 
    dw $2121,$0001 
    db $00 
    dw $2122,$0006 
    db $FE 
    dw $2124 

Spritemap_Skultera_5:
    dw $0004,$C3F2 
    db $00 
    dw $210C,$C3F2 
    db $F0 
    dw $210A,$01FE 
    db $FD 
    dw $2120,$0003 
    db $FE 
    dw $2125 

Spritemap_Skultera_6:
    dw $0004,$C3F0 
    db $00 
    dw $6108,$C3F0 
    db $F0 
    dw $6106,$01EE 
    db $FD 
    dw $6120,$01FD 
    db $FE 
    dw $2123 

Spritemap_Skultera_7:
    dw $0003,$C3F2 
    db $F0 
    dw $6100,$C3F2 
    db $00 
    dw $6102,$01EF 
    db $FD 
    dw $6121 

Spritemap_Skultera_8:
    dw $0004,$C3F5 
    db $00 
    dw $6104,$C3F5 
    db $F0 
    dw $6100,$01F1 
    db $00 
    dw $6122,$01EF 
    db $FD 
    dw $6120 

Spritemap_Skultera_9:
    dw $0005,$C3FB 
    db $00 
    dw $6102,$C3FB 
    db $F0 
    dw $6100,$01F7 
    db $FD 
    dw $6120,$01F2 
    db $00 
    dw $6122,$01F0 
    db $FE 
    dw $6124 

Spritemap_Skultera_A:
    dw $0005,$C3FF 
    db $00 
    dw $6102,$C3FF 
    db $F0 
    dw $6100,$01FB 
    db $00 
    dw $6122,$01F6 
    db $FD 
    dw $6120,$01F1 
    db $FE 
    dw $6125 

Spritemap_Skultera_B:
    dw $0005,$C3FE 
    db $F0 
    dw $6100,$C3FE 
    db $00 
    dw $6104,$01FA 
    db $FD 
    dw $6120,$01F5 
    db $FE 
    dw $6121,$01F0 
    db $FE 
    dw $6123 

Spritemap_Skultera_C:
    dw $0005,$C3FE 
    db $00 
    dw $6102,$C3FE 
    db $F0 
    dw $6100,$01FA 
    db $FE 
    dw $6121,$01F5 
    db $00 
    dw $6122,$01F0 
    db $FE 
    dw $6124 

Spritemap_Skultera_D:
    dw $0005,$C3FE 
    db $00 
    dw $6102,$C3FE 
    db $F0 
    dw $6100,$01FA 
    db $00 
    dw $6122,$01F5 
    db $FD 
    dw $6120,$01F0 
    db $FE 
    dw $6125 

Spritemap_Skultera_E:
    dw $0005,$01F0 
    db $FE 
    dw $6123,$01F5 
    db $FE 
    dw $6121,$01FA 
    db $FD 
    dw $6120,$C3FE 
    db $00 
    dw $6102,$C3FE 
    db $F0 
    dw $6100 

Spritemap_Skultera_F:
    dw $0005,$C3FE 
    db $00 
    dw $6108,$C3FE 
    db $F0 
    dw $6106,$01FC 
    db $FE 
    dw $6121,$01F7 
    db $00 
    dw $6122,$01F2 
    db $FE 
    dw $6124 

Spritemap_Skultera_10:
    dw $0004,$C3FE 
    db $00 
    dw $610C,$C3FE 
    db $F0 
    dw $610A,$01FA 
    db $FD 
    dw $6120,$01F5 
    db $FE 
    dw $6125 

Spritemap_Skultera_11:
    dw $0004,$C200 
    db $00 
    dw $2108,$C200 
    db $F0 
    dw $2106,$000A 
    db $FD 
    dw $2120,$01FB 
    db $FE 
    dw $6123 

Spritemap_Skultera_12:
    dw $0003,$C3FE 
    db $F0 
    dw $2100,$C3FE 
    db $00 
    dw $2102,$0009 
    db $FD 
    dw $2121 

Spritemap_Skultera_13:
    dw $0004,$C3FB 
    db $00 
    dw $2104,$C3FB 
    db $F0 
    dw $2100,$0007 
    db $00 
    dw $2122,$0009 
    db $FD 
    dw $2120 

Spritemap_Skultera_14:
    dw $0005,$C3F5 
    db $00 
    dw $2102,$C3F5 
    db $F0 
    dw $2100,$0001 
    db $FD 
    dw $2120,$0006 
    db $00 
    dw $2122,$0008 
    db $FE 
    dw $2124 

Spritemap_Skultera_15:
    dw $0005,$C3F1 
    db $00 
    dw $2102,$C3F1 
    db $F0 
    dw $2100,$01FD 
    db $00 
    dw $2122,$0002 
    db $FD 
    dw $2120,$0007 
    db $FE 
    dw $2125 

UNUSED_SpritemapPointers_Skultera:
    dw Spritemap_Skultera_0 
    dw Spritemap_Skultera_1 
    dw Spritemap_Skultera_2 
    dw Spritemap_Skultera_3 
    dw Spritemap_Skultera_4 
    dw Spritemap_Skultera_5 
    dw Spritemap_Skultera_6 
    dw Spritemap_Skultera_7 
    dw Spritemap_Skultera_8 
    dw Spritemap_Skultera_9 
    dw Spritemap_Skultera_A 
    dw Spritemap_Skultera_B 
    dw Spritemap_Skultera_C 
    dw Spritemap_Skultera_D 
    dw Spritemap_Skultera_E 
    dw Spritemap_Skultera_F 
    dw Spritemap_Skultera_10 
    dw Spritemap_Skultera_11 
    dw Spritemap_Skultera_12 
    dw Spritemap_Skultera_13 
    dw Spritemap_Skultera_14 
    dw Spritemap_Skultera_15 

InstList_Elevator:
    dw $0002 
    dw Spritemap_Elevator_0 
    dw $0002 
    dw Spritemap_Elevator_1 
    dw Instruction_Common_GotoY 
    dw InstList_Elevator 

ElevatorControllerInputs:
    dw $0400,$0800 

InitAI_Elevator:
    LDX.W $0E54 
    LDA.W #Spritemap_CommonA3_Nothing 
    STA.W $0F8E,X 
    LDA.W #$0001 
    STA.W $0F94,X 
    STZ.W $0F90,X 
    LDA.W #InstList_Elevator 
    STA.W $0F92,X 
    ASL.W $0FB4,X 
    LDA.W $0F7E,X 
    STA.W $0FA8,X 
    LDA.W $0E18 
    CMP.W #$0002 
    BEQ .doorTransition 
    STZ.W $0E16 
    STZ.W $0E18 

.doorTransition:
    LDA.W $0E16 
    ORA.W $0E18 
    BEQ .return 
    LDX.W $0E54 
    LDA.W $0FB6,X 
    STA.W $0F7E,X 
    JSR.W PlaceSamusOnElevator 

.return:
    RTL 


MainAI_GrappleAI_FrozenAI_Elevator:
    LDA.W $0795 
    BNE .return 
    LDA.W $0E16 
    ORA.W $0E18 
    BEQ .return 
    LDA.W $0E18 
    ASL A 
    TAX 
    JSR.W (.pointers,X) 

.return:
    RTL 


.pointers:
    dw ElevatorAI_0_LeavingRoom 
    dw ElevatorAI_1_LeavingRoom 
    dw ElevatorAI_2_DoorTransition 
    dw ElevatorAI_3_EnteringRoom 

ElevatorAI_0_LeavingRoom:
    LDX.W $0E54 
    LDY.W $0FB4,X 
    LDA.B $8F 
    AND.W ElevatorControllerInputs,Y 
    BEQ .notRiding 
    LDA.W #$000B 
    JSL.L QueueSound_Lib3_Max6 
    LDA.W #$0032 
    JSL.L QueueSound_Lib1_Max6 
    LDA.W #$0007 
    JSL.L Run_Samus_Command 
    JSL.L Reset_Projectile_Data 
    JSR.W PlaceSamusOnElevator 
    INC.W $0E18 
    RTS 


.notRiding:
    STZ.W $0E16 
    RTS 


ElevatorAI_1_LeavingRoom:
    LDX.W $0E54 
    LDA.W $0FB4,X 
    BNE .up 
    LDA.W #$0000 
    STA.W $0799 
    LDA.W $0F80,X 
    CLC 
    ADC.W #$8000 
    STA.W $0F80,X 
    LDA.W $0F7E,X 
    ADC.W #$0001 
    STA.W $0F7E,X 
    BRA + 


.up:
    LDA.W #$8000 
    STA.W $0799 
    LDA.W $0F80,X 
    SEC 
    SBC.W #$8000 
    STA.W $0F80,X 
    LDA.W $0F7E,X 
    SBC.W #$0001 
    STA.W $0F7E,X 

  + JSR.W PlaceSamusOnElevator 
    RTS 


ElevatorAI_2_DoorTransition:
    INC.W $0E18 ; fallthrough to ElevatorAI_3_EnteringRoom

ElevatorAI_3_EnteringRoom:
    LDX.W $0E54 
    LDA.W $0FB4,X 
    BEQ .down 
    LDA.W $0F80,X 
    CLC 
    ADC.W #$8000 
    STA.W $0F80,X 
    LDA.W $0F7E,X 
    ADC.W #$0001 
    STA.W $0F7E,X 
    CMP.W $0FA8,X 
    BCS .reachedTarget 
    BRA PlaceSamusOnElevator 


.down:
    LDA.W $0F80,X 
    SEC 
    SBC.W #$8000 
    STA.W $0F80,X 
    LDA.W $0F7E,X 
    SBC.W #$0001 
    STA.W $0F7E,X 
    CMP.W $0FA8,X 
    BCC .reachedTarget 
    BRA PlaceSamusOnElevator 


.reachedTarget:
    STZ.W $0E18 
    STZ.W $0E16 
    LDA.W #$0025 
    JSL.L QueueSound_Lib3_Max6 
    LDA.W $0FA8,X 
    STA.W $0F7E,X 
    LDA.W #$000B 
    JSL.L Run_Samus_Command ; fallthrough to PlaceSamusOnElevator

PlaceSamusOnElevator:
    LDX.W $0E54 
    LDA.W $0F7E,X 
    SEC 
    SBC.W #$001A 
    STA.W $0AFA 
    STZ.W $0AFC 
    LDA.W $0F7A,X 
    STA.W $0AF6 
    STZ.W $0B2E 
    STZ.W $0B2C 
    RTS 


Spritemap_Elevator_0:
    dw $0004,$01F2 
    db $FC 
    dw $6A6C,$0006 
    db $FC 
    dw $6A6C,$0000 
    db $FC 
    dw $6A6C,$01F8 
    db $FC 
    dw $2A6C 

Spritemap_Elevator_1:
    dw $0004,$0000 
    db $FC 
    dw $6A6E,$0008 
    db $FC 
    dw $6A6D,$01F8 
    db $FC 
    dw $2A6E,$01F0 
    db $FC 
    dw $2A6D 

Palette_Sciser:
    dw $3800,$3EDF,$0018,$000F,$0005,$01DD,$0118,$0093 
    dw $002F,$7FE0,$7DA0,$48E0,$30A0,$3BE0,$2680,$1580 

InstList_Sciser_UpsideRight_0:
    dw Instruction_Crawlers_FunctionInY 
    dw Function_Crawlers_CrawlingVertically 

InstList_Sciser_UpsideRight_1:
    dw $0008 
    dw Spritemap_Sciser_UpsideRight_0 
    dw $0008 
    dw Spritemap_Sciser_UpsideRight_1 
    dw $0008 
    dw Spritemap_Sciser_UpsideRight_2 
    dw $0008 
    dw Spritemap_Sciser_UpsideRight_1 
    dw Instruction_Common_GotoY 
    dw InstList_Sciser_UpsideRight_1 

InstList_Sciser_UpsideLeft_0:
    dw Instruction_Crawlers_FunctionInY 
    dw Function_Crawlers_CrawlingVertically 

InstList_Sciser_UpsideLeft_1:
    dw $0008 
    dw Spritemap_Sciser_UpsideLeft_0 
    dw $0008 
    dw Spritemap_Sciser_UpsideLeft_1 
    dw $0008 
    dw Spritemap_Sciser_UpsideLeft_2 
    dw $0008 
    dw Spritemap_Sciser_UpsideLeft_1 
    dw Instruction_Common_GotoY 
    dw InstList_Sciser_UpsideLeft_1 

InstList_Sciser_UpsideDown_0:
    dw Instruction_Crawlers_FunctionInY 
    dw Function_Crawlers_CrawlingHorizontally 

InstList_Sciser_UpsideDown_1:
    dw $0008 
    dw Spritemap_Sciser_UpsideDown_0 
    dw $0008 
    dw Spritemap_Sciser_UpsideDown_1 
    dw $0008 
    dw Spritemap_Sciser_UpsideDown_2 
    dw $0008 
    dw Spritemap_Sciser_UpsideDown_1 
    dw Instruction_Common_GotoY 
    dw InstList_Sciser_UpsideDown_1 

InstList_Sciser_UpsideUp_0:
    dw Instruction_Crawlers_FunctionInY 
    dw Function_Crawlers_CrawlingHorizontally 

InstList_Sciser_UpsideUp_1:
    dw $0008 
    dw Spritemap_Sciser_UpsideUp_0 
    dw $0008 
    dw Spritemap_Sciser_UpsideUp_1 
    dw $0008 
    dw Spritemap_Sciser_UpsideUp_2 
    dw $0008 
    dw Spritemap_Sciser_UpsideUp_1 
    dw Instruction_Common_GotoY 
    dw InstList_Sciser_UpsideUp_1 

InstListPointers_Sciser:
    dw InstList_Sciser_UpsideRight_0 
    dw InstList_Sciser_UpsideLeft_0 
    dw InstList_Sciser_UpsideDown_0 
    dw InstList_Sciser_UpsideUp_0 

InitAI_Sciser:
    LDX.W $0E54 
    LDA.W #$0008 
    STA.W $0FB6,X 
    LDA.W $0F92,X 
    AND.W #$0003 
    ASL A 
    TAY 
    LDA.W InstListPointers_Sciser,Y 
    STA.W $0F92,X 
    JMP.W InitAI_Crawlers_Common 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_GetEnemyIndex_A396FD:
    LDX.W $0E54 
    RTL 
endif ; !FEATURE_KEEP_UNREFERENCED


RTL_A39701:
    RTL 


RTL_A39702:
    RTL 


Spritemap_Sciser_UpsideUp_0:
    dw $0004,$81FF 
    db $F3 
    dw $6106,$81F3 
    db $F4 
    dw $2106,$8000 
    db $FC 
    dw $6104,$81F0 
    db $FC 
    dw $2100 

Spritemap_Sciser_UpsideUp_1:
    dw $0004,$81FE 
    db $F3 
    dw $6106,$81F2 
    db $F3 
    dw $2106,$8000 
    db $FB 
    dw $6102,$81F0 
    db $FB 
    dw $2102 

Spritemap_Sciser_UpsideUp_2:
    dw $0004,$81FD 
    db $F4 
    dw $6106,$81F1 
    db $F3 
    dw $2106,$8000 
    db $FC 
    dw $6100,$81F0 
    db $FC 
    dw $2104 

Spritemap_Sciser_UpsideRight_0:
    dw $0004,$81FD 
    db $FF 
    dw $A10E,$81FC 
    db $F3 
    dw $210E,$81F4 
    db $00 
    dw $A10C,$81F4 
    db $F0 
    dw $2108 

Spritemap_Sciser_UpsideRight_1:
    dw $0004,$81FD 
    db $FE 
    dw $A10E,$81FD 
    db $F2 
    dw $210E,$81F5 
    db $00 
    dw $A10A,$81F5 
    db $F0 
    dw $210A 

Spritemap_Sciser_UpsideRight_2:
    dw $0004,$81FC 
    db $FD 
    dw $A10E,$81FD 
    db $F1 
    dw $210E,$81F4 
    db $00 
    dw $A108,$81F4 
    db $F0 
    dw $210C 

Spritemap_Sciser_UpsideDown_0:
    dw $0004,$81FF 
    db $FD 
    dw $E106,$81F3 
    db $FC 
    dw $A106,$8000 
    db $F4 
    dw $E104,$81F0 
    db $F4 
    dw $A100 

Spritemap_Sciser_UpsideDown_1:
    dw $0004,$81FE 
    db $FD 
    dw $E106,$81F2 
    db $FD 
    dw $A106,$8000 
    db $F5 
    dw $E102,$81F0 
    db $F5 
    dw $A102 

Spritemap_Sciser_UpsideDown_2:
    dw $0004,$81FD 
    db $FC 
    dw $E106,$81F1 
    db $FD 
    dw $A106,$8000 
    db $F4 
    dw $E100,$81F0 
    db $F4 
    dw $A104 

Spritemap_Sciser_UpsideLeft_0:
    dw $0004,$81F3 
    db $FF 
    dw $E10E,$81F4 
    db $F3 
    dw $610E,$81FC 
    db $00 
    dw $E10C,$81FC 
    db $F0 
    dw $6108 

Spritemap_Sciser_UpsideLeft_1:
    dw $0004,$81F3 
    db $FE 
    dw $E10E,$81F3 
    db $F2 
    dw $610E,$81FB 
    db $00 
    dw $E10A,$81FB 
    db $F0 
    dw $610A 

Spritemap_Sciser_UpsideLeft_2:
    dw $0004,$81F4 
    db $FD 
    dw $E10E,$81F3 
    db $F1 
    dw $610E,$81FC 
    db $00 
    dw $E108,$81FC 
    db $F0 
    dw $610C 

Palette_Zero:
    dw $3800,$57F5,$4AEF,$1182,$00C0,$5752,$3EAD,$2E08 
    dw $25C6,$03FD,$02D5,$020F,$0149,$3EDF,$0018,$000F 

UNUSED_InstList_Zero_UpsideRight_FacingUp_A3982B:
    dw Instruction_Crawlers_FunctionInY 
    dw Function_Crawlers_CrawlingVertically 

UNUSED_InstList_Zero_UpsideRight_FacingUp_A3982F:
    dw $0004 
    dw Spritemap_Zero_UpsideRight_FacingUp_0 
    dw $0004 
    dw Spritemap_Zero_UpsideRight_FacingUp_1 
    dw $0004 
    dw Spritemap_Zero_UpsideRight_FacingUp_2 
    dw $0004 
    dw Spritemap_Zero_UpsideRight_FacingUp_3 
    dw $0004 
    dw Spritemap_Zero_UpsideRight_FacingUp_2 
    dw $0004 
    dw Spritemap_Zero_UpsideRight_FacingUp_1 
    dw Instruction_Common_GotoY 
    dw UNUSED_InstList_Zero_UpsideRight_FacingUp_A3982F 

InstList_Zero_UpsideRight_FacingDown_0:
    dw Instruction_Crawlers_FunctionInY 
    dw Function_Crawlers_CrawlingVertically 

InstList_Zero_UpsideRight_FacingDown_1:
    dw $0004 
    dw Spritemap_Zero_UpsideRight_FacingDown_0 
    dw $0004 
    dw Spritemap_Zero_UpsideRight_FacingDown_1 
    dw $0004 
    dw Spritemap_Zero_UpsideRight_FacingDown_2 
    dw $0004 
    dw Spritemap_Zero_UpsideRight_FacingDown_3 
    dw $0004 
    dw Spritemap_Zero_UpsideRight_FacingDown_2 
    dw $0004 
    dw Spritemap_Zero_UpsideRight_FacingDown_1 
    dw Instruction_Common_GotoY 
    dw InstList_Zero_UpsideRight_FacingDown_1 

UNUSED_InstList_Zero_UpsideLeft_FacingDown_A3986B:
    dw Instruction_Crawlers_FunctionInY 
    dw Function_Crawlers_CrawlingVertically 

UNUSED_InstList_Zero_UpsideLeft_FacingDown_A3986F:
    dw $0004 
    dw Spritemap_Zero_UpsideLeft_FacingDown_0 
    dw $0004 
    dw Spritemap_Zero_UpsideLeft_FacingDown_1 
    dw $0004 
    dw Spritemap_Zero_UpsideLeft_FacingDown_2 
    dw $0004 
    dw Spritemap_Zero_UpsideLeft_FacingDown_3 
    dw $0004 
    dw Spritemap_Zero_UpsideLeft_FacingDown_2 
    dw $0004 
    dw Spritemap_Zero_UpsideLeft_FacingDown_1 
    dw Instruction_Common_GotoY 
    dw UNUSED_InstList_Zero_UpsideLeft_FacingDown_A3986F 

InstList_Zero_UpsideLeft_FacingUp_0:
    dw Instruction_Crawlers_FunctionInY 
    dw Function_Crawlers_CrawlingVertically 

InstList_Zero_UpsideLeft_FacingUp_1:
    dw $0004 
    dw Spritemap_Zero_UpsideLeft_FacingUp_0 
    dw $0004 
    dw Spritemap_Zero_UpsideLeft_FacingUp_1 
    dw $0004 
    dw Spritemap_Zero_UpsideLeft_FacingUp_2 
    dw $0004 
    dw Spritemap_Zero_UpsideLeft_FacingUp_3 
    dw $0004 
    dw Spritemap_Zero_UpsideLeft_FacingUp_2 
    dw $0004 
    dw Spritemap_Zero_UpsideLeft_FacingUp_1 
    dw Instruction_Common_GotoY 
    dw InstList_Zero_UpsideLeft_FacingUp_1 

InstList_Zero_UpsideDown_FacingLeft_0:
    dw Instruction_Crawlers_FunctionInY 
    dw Function_Crawlers_CrawlingHorizontally 

InstList_Zero_UpsideDown_FacingLeft_1:
    dw $0004 
    dw Spritemap_Zero_UpsideDown_FacingLeft_0 
    dw $0004 
    dw Spritemap_Zero_UpsideDown_FacingLeft_1 
    dw $0004 
    dw Spritemap_Zero_UpsideDown_FacingLeft_2 
    dw $0004 
    dw Spritemap_Zero_UpsideDown_FacingLeft_3 
    dw $0004 
    dw Spritemap_Zero_UpsideDown_FacingLeft_2 
    dw $0004 
    dw Spritemap_Zero_UpsideDown_FacingLeft_1 
    dw Instruction_Common_GotoY 
    dw InstList_Zero_UpsideDown_FacingLeft_1 

UNUSED_InstList_Zero_UpsideUp_FacingLeft_A398CB:
    dw Instruction_Crawlers_FunctionInY 
    dw Function_Crawlers_CrawlingHorizontally 

UNUSED_InstList_Zero_UpsideUp_FacingLeft_A398CF:
    dw $0004 
    dw Spritemap_Zero_UpsideUp_FacingLeft_0 
    dw $0004 
    dw Spritemap_Zero_UpsideUp_FacingLeft_1 
    dw $0004 
    dw Spritemap_Zero_UpsideUp_FacingLeft_2 
    dw $0004 
    dw Spritemap_Zero_UpsideUp_FacingLeft_3 
    dw $0004 
    dw Spritemap_Zero_UpsideUp_FacingLeft_2 
    dw $0004 
    dw Spritemap_Zero_UpsideUp_FacingLeft_1 
    dw Instruction_Common_GotoY 
    dw UNUSED_InstList_Zero_UpsideUp_FacingLeft_A398CF 

UNUSED_InstList_Zero_UpsideDown_FacingRight_A398EB:
    dw Instruction_Crawlers_FunctionInY 
    dw Function_Crawlers_CrawlingHorizontally 

UNUSED_InstList_Zero_UpsideDown_FacingRight_A398EF:
    dw $0004 
    dw Spritemap_Zero_UpsideDown_FacingRight_0 
    dw $0004 
    dw Spritemap_Zero_UpsideDown_FacingRight_1 
    dw $0004 
    dw Spritemap_Zero_UpsideDown_FacingRight_2 
    dw $0004 
    dw Spritemap_Zero_UpsideDown_FacingRight_3 
    dw $0004 
    dw Spritemap_Zero_UpsideDown_FacingRight_2 
    dw $0004 
    dw Spritemap_Zero_UpsideDown_FacingRight_1 
    dw Instruction_Common_GotoY 
    dw UNUSED_InstList_Zero_UpsideDown_FacingRight_A398EF 

UNUSED_InstList_Zero_UpsideUp_FacingRight_A3990B:
    dw Instruction_Crawlers_FunctionInY 
    dw Function_Crawlers_CrawlingHorizontally 

UNUSED_InstList_Zero_UpsideUp_FacingRight_A3990F:
    dw $0004 
    dw Spritemap_Zero_UpsideUp_FacingRight_0 
    dw $0004 
    dw Spritemap_Zero_UpsideUp_FacingRight_1 
    dw $0004 
    dw Spritemap_Zero_UpsideUp_FacingRight_2 
    dw $0004 
    dw Spritemap_Zero_UpsideUp_FacingRight_3 
    dw $0004 
    dw Spritemap_Zero_UpsideUp_FacingRight_2 
    dw $0004 
    dw Spritemap_Zero_UpsideUp_FacingRight_1 
    dw Instruction_Common_GotoY 
    dw UNUSED_InstList_Zero_UpsideUp_FacingRight_A3990F 

InitialInstListPointers_Zero:
    dw InstList_Zero_UpsideRight_FacingDown_0 
    dw InstList_Zero_UpsideLeft_FacingUp_0 
    dw InstList_Zero_UpsideDown_FacingLeft_0 
    dw UNUSED_InstList_Zero_UpsideUp_FacingRight_A3990B 
    dw UNUSED_InstList_Zero_UpsideRight_FacingUp_A3982B 
    dw UNUSED_InstList_Zero_UpsideLeft_FacingDown_A3986B 
    dw UNUSED_InstList_Zero_UpsideUp_FacingLeft_A398CB 
    dw UNUSED_InstList_Zero_UpsideDown_FacingRight_A398EB 

InitAI_Zero:
    LDX.W $0E54 
    LDA.W #$000A 
    STA.W $0FB6,X 
    LDA.W $0F92,X 
    AND.W #$0003 
    ASL A 
    TAY 
    LDA.W InitialInstListPointers_Zero,Y 
    STA.W $0F92,X 
    JMP.W InitAI_Crawlers_Common 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_GetEnemyIndex_A39955:
    LDX.W $0E54 
    RTL 
endif ; !FEATURE_KEEP_UNREFERENCED


RTL_A39959:
    RTL 


RTL_A3995A:
    RTL 


Spritemap_Zero_UpsideUp_FacingRight_0:
    dw $0003,$8000 
    db $F8 
    dw $2104,$81FA 
    db $F8 
    dw $2102,$81F1 
    db $F8 
    dw $2100 

Spritemap_Zero_UpsideUp_FacingRight_1:
    dw $0003,$8000 
    db $F8 
    dw $2104,$81FA 
    db $F8 
    dw $2102,$81F0 
    db $F8 
    dw $2100 

Spritemap_Zero_UpsideUp_FacingRight_2:
    dw $0003,$8001 
    db $F8 
    dw $2104,$81FA 
    db $F8 
    dw $2102,$81EF 
    db $F8 
    dw $2100 

Spritemap_Zero_UpsideUp_FacingRight_3:
    dw $0003,$8002 
    db $F8 
    dw $2104,$81FA 
    db $F8 
    dw $2102,$81EE 
    db $F8 
    dw $2100 

Spritemap_Zero_UpsideLeft_FacingUp_0:
    dw $0003,$81F8 
    db $00 
    dw $610A,$81F8 
    db $FA 
    dw $6108,$81F8 
    db $F1 
    dw $6106 

Spritemap_Zero_UpsideLeft_FacingUp_1:
    dw $0003,$81F8 
    db $00 
    dw $610A,$81F8 
    db $FA 
    dw $6108,$81F8 
    db $F0 
    dw $6106 

Spritemap_Zero_UpsideLeft_FacingUp_2:
    dw $0003,$81F8 
    db $01 
    dw $610A,$81F8 
    db $FA 
    dw $6108,$81F8 
    db $EF 
    dw $6106 

Spritemap_Zero_UpsideLeft_FacingUp_3:
    dw $0003,$81F8 
    db $02 
    dw $610A,$81F8 
    db $FA 
    dw $6108,$81F8 
    db $EE 
    dw $6106 

Spritemap_Zero_UpsideDown_FacingLeft_0:
    dw $0003,$81F0 
    db $F8 
    dw $E104,$81F6 
    db $F8 
    dw $E102,$81FF 
    db $F8 
    dw $E100 

Spritemap_Zero_UpsideDown_FacingLeft_1:
    dw $0003,$81F0 
    db $F8 
    dw $E104,$81F6 
    db $F8 
    dw $E102,$8000 
    db $F8 
    dw $E100 

Spritemap_Zero_UpsideDown_FacingLeft_2:
    dw $0003,$81EF 
    db $F8 
    dw $E104,$81F6 
    db $F8 
    dw $E102,$8001 
    db $F8 
    dw $E100 

Spritemap_Zero_UpsideDown_FacingLeft_3:
    dw $0003,$81EE 
    db $F8 
    dw $E104,$81F6 
    db $F8 
    dw $E102,$8002 
    db $F8 
    dw $E100 

Spritemap_Zero_UpsideLeft_FacingDown_0:
    dw $0003,$81F8 
    db $F0 
    dw $E10A,$81F8 
    db $F6 
    dw $E108,$81F8 
    db $FF 
    dw $E106 

Spritemap_Zero_UpsideLeft_FacingDown_1:
    dw $0003,$81F8 
    db $F0 
    dw $E10A,$81F8 
    db $F6 
    dw $E108,$81F8 
    db $00 
    dw $E106 

Spritemap_Zero_UpsideLeft_FacingDown_2:
    dw $0003,$81F8 
    db $EF 
    dw $E10A,$81F8 
    db $F6 
    dw $E108,$81F8 
    db $01 
    dw $E106 

Spritemap_Zero_UpsideLeft_FacingDown_3:
    dw $0003,$81F8 
    db $EE 
    dw $E10A,$81F8 
    db $F6 
    dw $E108,$81F8 
    db $02 
    dw $E106 

Spritemap_Zero_UpsideUp_FacingLeft_0:
    dw $0003,$8000 
    db $F8 
    dw $A104,$81FA 
    db $F8 
    dw $A102,$81F1 
    db $F8 
    dw $A100 

Spritemap_Zero_UpsideUp_FacingLeft_1:
    dw $0003,$8000 
    db $F8 
    dw $A104,$81FA 
    db $F8 
    dw $A102,$81F0 
    db $F8 
    dw $A100 

Spritemap_Zero_UpsideUp_FacingLeft_2:
    dw $0003,$8001 
    db $F8 
    dw $A104,$81FA 
    db $F8 
    dw $A102,$81EF 
    db $F8 
    dw $A100 

Spritemap_Zero_UpsideUp_FacingLeft_3:
    dw $0003,$8002 
    db $F8 
    dw $A104,$81FA 
    db $F8 
    dw $A102,$81EE 
    db $F8 
    dw $A100 

Spritemap_Zero_UpsideRight_FacingUp_0:
    dw $0003,$81F8 
    db $00 
    dw $210A,$81F8 
    db $FA 
    dw $2108,$81F8 
    db $F1 
    dw $2106 

Spritemap_Zero_UpsideRight_FacingUp_1:
    dw $0003,$81F8 
    db $00 
    dw $210A,$81F8 
    db $FA 
    dw $2108,$81F8 
    db $F0 
    dw $2106 

Spritemap_Zero_UpsideRight_FacingUp_2:
    dw $0003,$81F8 
    db $01 
    dw $210A,$81F8 
    db $FA 
    dw $2108,$81F8 
    db $EF 
    dw $2106 

Spritemap_Zero_UpsideRight_FacingUp_3:
    dw $0003,$81F8 
    db $02 
    dw $210A,$81F8 
    db $FA 
    dw $2108,$81F8 
    db $EE 
    dw $2106 

Spritemap_Zero_UpsideDown_FacingRight_0:
    dw $0003,$81F0 
    db $F8 
    dw $6104,$81F6 
    db $F8 
    dw $6102,$81FF 
    db $F8 
    dw $6100 

Spritemap_Zero_UpsideDown_FacingRight_1:
    dw $0003,$81F0 
    db $F8 
    dw $6104,$81F6 
    db $F8 
    dw $6102,$8000 
    db $F8 
    dw $6100 

Spritemap_Zero_UpsideDown_FacingRight_2:
    dw $0003,$81EF 
    db $F8 
    dw $6104,$81F6 
    db $F8 
    dw $6102,$8001 
    db $F8 
    dw $6100 

Spritemap_Zero_UpsideDown_FacingRight_3:
    dw $0003,$81EE 
    db $F8 
    dw $6104,$81F6 
    db $F8 
    dw $6102,$8002 
    db $F8 
    dw $6100 

Spritemap_Zero_UpsideRight_FacingDown_0:
    dw $0003,$81F8 
    db $F0 
    dw $A10A,$81F8 
    db $F6 
    dw $A108,$81F8 
    db $FF 
    dw $A106 

Spritemap_Zero_UpsideRight_FacingDown_1:
    dw $0003,$81F8 
    db $F0 
    dw $A10A,$81F8 
    db $F6 
    dw $A108,$81F8 
    db $00 
    dw $A106 

Spritemap_Zero_UpsideRight_FacingDown_2:
    dw $0003,$81F8 
    db $EF 
    dw $A10A,$81F8 
    db $F6 
    dw $A108,$81F8 
    db $01 
    dw $A106 

Spritemap_Zero_UpsideRight_FacingDown_3:
    dw $0003,$81F8 
    db $EE 
    dw $A10A,$81F8 
    db $F6 
    dw $A108,$81F8 
    db $02 
    dw $A106 

Palette_Tripper:
    dw $3800,$3F57,$2E4D,$00E2,$0060,$3AB0,$220B,$1166 
    dw $0924,$7F5A,$7EC0,$6DE0,$54E0,$03FF,$0237,$00D1 

Palette_Kamer2:
    dw $3800,$7F5A,$3BE0,$2680,$0920,$4F5A,$36B5,$2610 
    dw $1DCE,$5294,$39CE,$2108,$1084,$033B,$0216,$0113 

InstList_Kamer2_VerticallyMoving_Left_0:
    dw Instruction_Tripper_Kamer2_SetMovingLeftXMovement_duplicate 

InstList_Kamer2_VerticallyMoving_Left_1:
    dw $000A 
    dw Spritemap_Kamer2_0 
    dw $000A 
    dw Spritemap_Kamer2_1 
    dw $000A 
    dw Spritemap_Kamer2_2 
    dw $000A 
    dw Spritemap_Kamer2_3 
    dw Instruction_Common_GotoY 
    dw InstList_Kamer2_VerticallyMoving_Left_1 

InstList_Kamer2_VerticallyMoving_Right_0:
    dw Instruction_Tripper_Kamer2_SetMovingRightXMovement_duplicate 

InstList_Kamer2_VerticallyMoving_Right_1:
    dw $000A 
    dw Spritemap_Kamer2_0 
    dw $000A 
    dw Spritemap_Kamer2_1 
    dw $000A 
    dw Spritemap_Kamer2_2 
    dw $000A 
    dw Spritemap_Kamer2_3 
    dw Instruction_Common_GotoY 
    dw InstList_Kamer2_VerticallyMoving_Right_1 

InstList_Kamer2_VerticallyStill_Left_0:
    dw Instruction_Tripper_Kamer2_SetMovingLeftXMovement 

InstList_Kamer2_VerticallyStill_Left_1:
    dw $000A 
    dw Spritemap_Kamer2_0 
    dw $000A 
    dw Spritemap_Kamer2_1 
    dw $000A 
    dw Spritemap_Kamer2_2 
    dw $000A 
    dw Spritemap_Kamer2_3 
    dw Instruction_Common_GotoY 
    dw InstList_Kamer2_VerticallyStill_Left_1 

InstList_Kamer2_VerticallyStill_Right_0:
    dw Instruction_Tripper_Kamer2_SetMovingRightXMovement 

InstList_Kamer2_VerticallyStill_Right_1:
    dw $000A 
    dw Spritemap_Kamer2_0 
    dw $000A 
    dw Spritemap_Kamer2_1 
    dw $000A 
    dw Spritemap_Kamer2_2 
    dw $000A 
    dw Spritemap_Kamer2_3 
    dw Instruction_Common_GotoY 
    dw InstList_Kamer2_VerticallyStill_Right_1 

InstList_Tripper_VerticallyMoving_Left_0:
    dw Instruction_Tripper_Kamer2_SetMovingLeftXMovement_duplicate 

InstList_Tripper_VerticallyMoving_Left_1:
    dw $0007 
    dw Spritemap_Tripper_VerticallyMoving_Left_0 
    dw $0008 
    dw Spritemap_Tripper_VerticallyMoving_Left_1 
    dw $0007 
    dw Spritemap_Tripper_VerticallyMoving_Left_0 
    dw $0008 
    dw Spritemap_Tripper_VerticallyMoving_Left_2 
    dw Instruction_Common_GotoY 
    dw InstList_Tripper_VerticallyMoving_Left_1 

InstList_Tripper_VerticallyMoving_Right_0:
    dw Instruction_Tripper_Kamer2_SetMovingRightXMovement_duplicate 

InstList_Tripper_VerticallyMoving_Right_1:
    dw $0007 
    dw Spritemap_Tripper_VerticallyMoving_Right_0 
    dw $0008 
    dw Spritemap_Tripper_VerticallyMoving_Right_1 
    dw $0007 
    dw Spritemap_Tripper_VerticallyMoving_Right_0 
    dw $0008 
    dw Spritemap_Tripper_VerticallyMoving_Right_2 
    dw Instruction_Common_GotoY 
    dw InstList_Tripper_VerticallyMoving_Right_1 

InstList_Tripper_VerticallyStill_Right_0:
    dw Instruction_Tripper_Kamer2_SetMovingLeftXMovement 

InstList_Tripper_VerticallyStill_Right_1:
    dw $0007 
    dw Spritemap_Tripper_VerticallyStill_Right_0 
    dw $0008 
    dw Spritemap_Tripper_VerticallyStill_Right_1 
    dw $0007 
    dw Spritemap_Tripper_VerticallyStill_Right_0 
    dw $0008 
    dw Spritemap_Tripper_VerticallyStill_Right_2 
    dw Instruction_Common_GotoY 
    dw InstList_Tripper_VerticallyStill_Right_1 

InstList_Tripper_VerticallyStill_Left_0:
    dw Instruction_Tripper_Kamer2_SetMovingRightXMovement 

InstList_Tripper_VerticallyStill_Left_1:
    dw $0007 
    dw Spritemap_Tripper_VerticallyStill_Left_0 
    dw $0008 
    dw Spritemap_Tripper_VerticallyStill_Left_1 
    dw $0007 
    dw Spritemap_Tripper_VerticallyStill_Left_0 
    dw $0008 
    dw Spritemap_Tripper_VerticallyStill_Left_2 
    dw Instruction_Common_GotoY 
    dw InstList_Tripper_VerticallyStill_Left_1 

Instruction_Tripper_Kamer2_SetMovingLeftXMovement:
    LDX.W $0E54 
    LDA.W #$0000 
    STA.L $7E7804,X 
    RTL 


Instruction_Tripper_Kamer2_SetMovingRightXMovement:
    LDX.W $0E54 
    LDA.W #$0001 
    STA.L $7E7804,X 
    RTL 


Instruction_Tripper_Kamer2_SetMovingLeftXMovement_duplicate:
    LDX.W $0E54 
    LDA.W #$0000 
    STA.L $7E7804,X 
    RTL 


Instruction_Tripper_Kamer2_SetMovingRightXMovement_duplicate:
    LDX.W $0E54 
    LDA.W #$0001 
    STA.L $7E7804,X 
    RTL 


FunctionPointers_Tripper_Kamer2_XMovement:
    dw Function_Tripper_Kamer2_XMovement_0_MovingLeft 
    dw Function_Tripper_Kamer2_XMovement_1_MovingRight 

FunctionPointers_Tripper_Kamer2_YMovement:
    dw Function_Tripper_Kamer2_YMovement_Rising 
    dw Function_Tripper_Kamer2_YMovement_1_Sinking 

InitAI_Kamer2:
    LDX.W $0E54 
    LDA.W #$FFFF 
    STA.L $7E783E,X 
    LDY.W #InstList_Kamer2_VerticallyStill_Left_0 
    LDA.W $0FB4,X 
    STA.L $7E7804,X 
    BEQ InitAI_Tripper_Kamer2_Common 
    LDY.W #InstList_Kamer2_VerticallyStill_Right_0 
    BRA InitAI_Tripper_Kamer2_Common 


InitAI_Tripper:
    LDX.W $0E54 
    LDY.W #InstList_Tripper_VerticallyStill_Right_0 
    LDA.W $0FB4,X 
    STA.L $7E7804,X 
    BEQ InitAI_Tripper_Kamer2_Common 
    LDY.W #InstList_Tripper_VerticallyStill_Left_0 ; fallthrough to InitAI_Tripper_Kamer2_Common

InitAI_Tripper_Kamer2_Common:
    TYA 
    STA.W $0F92,X 
    LDA.W $0FB6,X 
    AND.W #$00FF 
    ASL #3
    TAY 
    LDA.W CommonEnemySpeeds_LinearlyIncreasing,Y 
    STA.W $0FAC,X 
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+2,Y 
    STA.W $0FAA,X 
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+4,Y 
    STA.W $0FB0,X 
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+6,Y 
    STA.W $0FAE,X 
    LDA.W #$0000 
    STA.L $7E7800,X 
    STA.L $7E7806,X 
    STA.L $7E7808,X 
    LDA.W $0F7E,X 
    INC A 
    STA.W $0FA8,X 
    STZ.W $0FB2,X 
    LDA.W $0FB7,X 
    AND.W #$00FF 
    STA.L $7E780A,X 
    RTL 


MainAI_Tripper_Kamer2:
    LDX.W $0E54 
    LDA.W #$0000 
    STA.L $7E7800,X 
    JSL.L CheckIfEnemyIsTouchingSamusFromBelow 
    BEQ .SamusNotRiding 
    LDA.W #$0001 
    STA.L $7E7800,X 

.SamusNotRiding:
    LDX.W $0E54 
    LDA.L $7E7804,X 
    ASL A 
    TAX 
    JSR.W (FunctionPointers_Tripper_Kamer2_XMovement,X) 
    LDX.W $0E54 
    LDA.L $7E7800,X 
    ASL A 
    TAX 
    JSR.W (FunctionPointers_Tripper_Kamer2_YMovement,X) 
    LDX.W $0E54 
    LDA.L $7E7800,X 
    CMP.L $7E780C,X 
    BEQ .noChange 
    STZ.W $0FB2,X 

.noChange:
    LDA.L $7E7800,X 
    STA.L $7E780C,X 
    RTL 


Function_Tripper_Kamer2_XMovement_0_MovingLeft:
    LDX.W $0E54 
    LDA.W $0F7A,X 
    STA.L $7E7802,X 
    LDA.W $0FAE,X 
    STA.B $12 
    LDA.W $0FB0,X 
    STA.B $14 
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes 
    BCC .return 
    LDA.W #$0001 
    STA.L $7E7804,X 
    JSR.W SetPlatformInstList_VerticallyStill_MovingRight 

.return:
    RTS 


Function_Tripper_Kamer2_XMovement_1_MovingRight:
    LDX.W $0E54 
    LDA.W $0F7A,X 
    STA.L $7E7802,X 
    LDA.W $0FAA,X 
    STA.B $12 
    LDA.W $0FAC,X 
    STA.B $14 
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes 
    BCC .return 
    LDA.W #$0000 
    STA.L $7E7804,X 
    JSR.W SetPlatformInstList_VerticallyStill_MovingLeft 

.return:
    RTS 


Function_Tripper_Kamer2_YMovement_Rising:
    LDX.W $0E54 
    LDA.W $0F7E,X 
    CMP.W $0FA8,X 
    BMI .notMoving 
    JSR.W SetPlatformInstList_VerticallyMoving 
    INC.W $0FB2,X 
    LDA.W $0FB2,X 
    CMP.L $7E780A,X 
    BMI + 
    LDA.L $7E780A,X 
    STA.W $0FB2,X 

  + ASL #3
    TAY 
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing+4,Y 
    STA.B $12 
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing+6,Y 
    STA.B $14 
    JSL.L MoveEnemyDownBy_14_12 
    BCC .return 

.notMoving:
    STZ.W $0FB2,X 
    JSR.W SetPlatformInstList_VerticallyStill 

.return:
    RTS 


Function_Tripper_Kamer2_YMovement_1_Sinking:
    LDX.W $0E54 
    LDA.W $0F7E,X 
    CMP.W $0FA8,X 
    JSR.W RTS_A39E46 
    INC.W $0FB2,X 
    LDA.W $0FB2,X 
    CMP.L $7E780A,X 
    BMI + 
    LDA.L $7E780A,X 
    STA.W $0FB2,X 

  + LDA.W $0F7A,X 
    SEC 
    SBC.L $7E7802,X 
    CLC 
    ADC.W $0B58 
    STA.W $0B58 
    LDA.W $0F7E,X 
    STA.L $7E7802,X 
    LDA.W $0FB2,X 
    ASL #3
    TAY 
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing,Y 
    STA.B $12 
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing+2,Y 
    STA.B $14 
    JSL.L MoveEnemyDownBy_14_12 
    BCC .notCollidedWithBlock 
    STZ.W $0FB2,X 
    JSR.W SetPlatformInstList_VerticallyStill 

.notCollidedWithBlock:
    LDA.W $0F7E,X 
    SEC 
    SBC.L $7E7802,X 
    CLC 
    ADC.W $0B5C 
    STA.W $0B5C 
    RTS 


RTS_A39E46:
    RTS 


SetPlatformInstList_VerticallyMoving_MovingLeft:
    LDX.W $0E54 
    LDY.W #InstList_Tripper_VerticallyMoving_Left_0 
    LDA.L $7E783E,X 
    BPL .Tripper 
    LDY.W #InstList_Kamer2_VerticallyMoving_Left_0 

.Tripper:
    TYA 
    STA.W $0F92,X 
    LDA.W #$0001 
    STA.W $0F94,X 
    STZ.W $0F90,X 
    RTS 


SetPlatformInstList_VerticallyMoving_MovingRight:
    LDX.W $0E54 
    LDY.W #InstList_Tripper_VerticallyMoving_Right_0 
    LDA.L $7E783E,X 
    BPL .Tripper 
    LDY.W #InstList_Kamer2_VerticallyMoving_Right_0 

.Tripper:
    TYA 
    STA.W $0F92,X 
    LDA.W #$0001 
    STA.W $0F94,X 
    STZ.W $0F90,X 
    RTS 


SetPlatformInstList_VerticallyStill_MovingLeft:
    LDX.W $0E54 
    LDY.W #InstList_Tripper_VerticallyStill_Right_0 
    LDA.L $7E783E,X 
    BPL .Tripper 
    LDY.W #InstList_Kamer2_VerticallyStill_Left_0 

.Tripper:
    TYA 
    STA.W $0F92,X 
    LDA.W #$0001 
    STA.W $0F94,X 
    STZ.W $0F90,X 
    RTS 


SetPlatformInstList_VerticallyStill_MovingRight:
    LDX.W $0E54 
    LDY.W #InstList_Tripper_VerticallyStill_Left_0 
    LDA.L $7E783E,X 
    BPL .Tripper 
    LDY.W #InstList_Kamer2_VerticallyStill_Right_0 

.Tripper:
    TYA 
    STA.W $0F92,X 
    LDA.W #$0001 
    STA.W $0F94,X 
    STZ.W $0F90,X 
    RTS 


SetPlatformInstList_VerticallyMoving:
    LDX.W $0E54 
    LDA.L $7E7806,X 
    BNE .merge 
    LDA.W #$0001 
    STA.L $7E7806,X 
    LDA.L $7E7804,X 
    BEQ .movingLeft 
    JSR.W SetPlatformInstList_VerticallyMoving_MovingRight 
    BRA .merge 


.movingLeft:
    JSR.W SetPlatformInstList_VerticallyMoving_MovingLeft 

.merge:
    LDA.W #$0000 
    STA.L $7E7808,X 
    RTS 


SetPlatformInstList_VerticallyStill:
    LDX.W $0E54 
    LDA.L $7E7808,X 
    BNE .merge 
    LDA.W #$0001 
    STA.L $7E7808,X 
    LDA.L $7E7804,X 
    BEQ .movingLeft 
    JSR.W SetPlatformInstList_VerticallyStill_MovingRight 
    BRA .merge 


.movingLeft:
    JSR.W SetPlatformInstList_VerticallyStill_MovingLeft 

.merge:
    LDA.W #$0000 
    STA.L $7E7806,X 
    RTS 


RTL_A39F07:
    RTL 


EnemyShot_Tripper:
    JSL.L CommonA3_NormalEnemyShotAI 
    LDX.W $0E54 
    LDA.W $0F9E,X 
    BEQ .return 
    LDA.L $7E7804,X 
    BEQ .movingLeft 
    LDA.W #Spritemap_Tripper_Frozen_MovingRight 
    STA.W $0F8E,X 
    BRA .return 


.movingLeft:
    LDA.W #Spritemap_Tripper_Frozen_MovingLeft 
    STA.W $0F8E,X 

.return:
    RTL 


Spritemap_Tripper_VerticallyMoving_Left_0:
    dw $0003,$01F9 
    db $08 
    dw $210E,$C200 
    db $F8 
    dw $2102,$C3F0 
    db $F8 
    dw $2100 

Spritemap_Tripper_VerticallyMoving_Left_1:
    dw $0003,$C200 
    db $F8 
    dw $2102,$01F9 
    db $08 
    dw $210F,$C3F0 
    db $F8 
    dw $2108 

Spritemap_Tripper_VerticallyMoving_Left_2:
    dw $0003,$C200 
    db $F8 
    dw $2102,$01F9 
    db $08 
    dw $210F,$C3F0 
    db $F8 
    dw $2104 

Spritemap_Tripper_VerticallyMoving_Right_0:
    dw $0003,$01FF 
    db $08 
    dw $610E,$C3F0 
    db $F8 
    dw $6102,$C200 
    db $F8 
    dw $6100 

Spritemap_Tripper_VerticallyMoving_Right_1:
    dw $0003,$C3F0 
    db $F8 
    dw $6102,$01FF 
    db $08 
    dw $610F,$C200 
    db $F8 
    dw $6108 

Spritemap_Tripper_VerticallyMoving_Right_2:
    dw $0003,$C3F0 
    db $F8 
    dw $6102,$01FF 
    db $08 
    dw $610F,$C200 
    db $F8 
    dw $6104 

Spritemap_Tripper_VerticallyStill_Right_0:
    dw $0004,$C200 
    db $F8 
    dw $2102,$000B 
    db $02 
    dw $211D,$0003 
    db $02 
    dw $211C,$C3F0 
    db $F8 
    dw $2100 

Spritemap_Tripper_VerticallyStill_Right_1:
    dw $0003,$C200 
    db $F8 
    dw $2102,$0002 
    db $02 
    dw $211E,$C3F0 
    db $F8 
    dw $2104 

Spritemap_Tripper_VerticallyStill_Right_2:
    dw $0004,$C200 
    db $F8 
    dw $2102,$000B 
    db $02 
    dw $210D,$0003 
    db $02 
    dw $210C,$C3F0 
    db $F8 
    dw $2108 

Spritemap_Tripper_VerticallyStill_Left_0:
    dw $0004,$C3F0 
    db $F8 
    dw $6102,$01ED 
    db $02 
    dw $611D,$01F5 
    db $02 
    dw $611C,$C200 
    db $F8 
    dw $6100 

Spritemap_Tripper_VerticallyStill_Left_1:
    dw $0003,$C3F0 
    db $F8 
    dw $6102,$01F6 
    db $02 
    dw $611E,$C200 
    db $F8 
    dw $6104 

Spritemap_Tripper_VerticallyStill_Left_2:
    dw $0004,$C3F0 
    db $F8 
    dw $6102,$01ED 
    db $02 
    dw $610D,$01F5 
    db $02 
    dw $610C,$C200 
    db $F8 
    dw $6108 

Spritemap_Tripper_Frozen_MovingLeft:
    dw $0002,$8000 
    db $F8 
    dw $2102,$81F0 
    db $F8 
    dw $2108 

Spritemap_Tripper_Frozen_MovingRight:
    dw $0002,$81F0 
    db $F8 
    dw $6102,$8000 
    db $F8 
    dw $6108 

Spritemap_Kamer2_0:
    dw $0002,$8000 
    db $F8 
    dw $6100,$81F0 
    db $F8 
    dw $2100 

Spritemap_Kamer2_1:
    dw $0002,$8000 
    db $F8 
    dw $6102,$81F0 
    db $F8 
    dw $2102 

Spritemap_Kamer2_2:
    dw $0002,$8000 
    db $F8 
    dw $6104,$81F0 
    db $F8 
    dw $2104 

Spritemap_Kamer2_3:
    dw $0002,$8000 
    db $F8 
    dw $6106,$81F0 
    db $F8 
    dw $2106 

Palette_Sbug:
    dw $3800,$3F57,$2E4D,$00E2,$0060,$3AB0,$220B,$1166 
    dw $0924,$435A,$3694,$15AD,$0508,$03FF,$0237,$00D1 

InstList_Sbug_FacingUp:
    dw $0005 
    dw Spritemap_Sbug_FacingUp_0 
    dw $0005 
    dw Spritemap_Sbug_FacingUp_1 
    dw $0005 
    dw Spritemap_Sbug_FacingUp_0 
    dw $0005 
    dw Spritemap_Sbug_FacingUp_2 
    dw Instruction_Common_GotoY 
    dw InstList_Sbug_FacingUp 

InstList_Sbug_FacingUpLeft:
    dw $0005 
    dw Spritemap_Sbug_FacingUpLeft_0 
    dw $0005 
    dw Spritemap_Sbug_FacingUpLeft_1 
    dw $0005 
    dw Spritemap_Sbug_FacingUpLeft_0 
    dw $0005 
    dw Spritemap_Sbug_FacingUpLeft_2 
    dw Instruction_Common_GotoY 
    dw InstList_Sbug_FacingUpLeft 

InstList_Sbug_FacingLeft:
    dw $0005 
    dw Spritemap_Sbug_FacingLeft_0 
    dw $0005 
    dw Spritemap_Sbug_FacingLeft_1 
    dw $0005 
    dw Spritemap_Sbug_FacingLeft_0 
    dw $0005 
    dw Spritemap_Sbug_FacingLeft_2 
    dw Instruction_Common_GotoY 
    dw InstList_Sbug_FacingLeft 

InstList_Sbug_FacingDownLeft:
    dw $0005 
    dw Spritemap_Sbug_FacingDownLeft_0 
    dw $0005 
    dw Spritemap_Sbug_FacingDownLeft_1 
    dw $0005 
    dw Spritemap_Sbug_FacingDownLeft_0 
    dw $0005 
    dw Spritemap_Sbug_FacingDownLeft_2 
    dw Instruction_Common_GotoY 
    dw InstList_Sbug_FacingDownLeft 

InstList_Sbug_FacingDown:
    dw $0005 
    dw Spritemap_Sbug_FacingDown_0 
    dw $0005 
    dw Spritemap_Sbug_FacingDown_1 
    dw $0005 
    dw Spritemap_Sbug_FacingDown_0 
    dw $0005 
    dw Spritemap_Sbug_FacingDown_2 
    dw Instruction_Common_GotoY 
    dw InstList_Sbug_FacingDown 

InstList_Sbug_FacingDownRight:
    dw $0005 
    dw Spritemap_Sbug_FacingDownRight_0 
    dw $0005 
    dw Spritemap_Sbug_FacingDownRight_1 
    dw $0005 
    dw Spritemap_Sbug_FacingDownRight_0 
    dw $0005 
    dw Spritemap_Sbug_FacingDownRight_2 
    dw Instruction_Common_GotoY 
    dw InstList_Sbug_FacingDownRight 

InstList_Sbug_FacingRight:
    dw $0005 
    dw Spritemap_Sbug_FacingRight_0 
    dw $0005 
    dw Spritemap_Sbug_FacingRight_1 
    dw $0005 
    dw Spritemap_Sbug_FacingRight_0 
    dw $0005 
    dw Spritemap_Sbug_FacingRight_2 
    dw Instruction_Common_GotoY 
    dw InstList_Sbug_FacingRight 

InstList_Sbug_FacingUpRight:
    dw $0005 
    dw Spritemap_Sbug_FacingUpRight_0 
    dw $0005 
    dw Spritemap_Sbug_FacingUpRight_1 
    dw $0005 
    dw Spritemap_Sbug_FacingUpRight_0 
    dw $0005 
    dw Spritemap_Sbug_FacingUpRight_2 
    dw Instruction_Common_GotoY 
    dw InstList_Sbug_FacingUpRight 

InstListPointers_Sbug:
    dw InstList_Sbug_FacingUp 
    dw InstList_Sbug_FacingUpLeft 
    dw InstList_Sbug_FacingLeft 
    dw InstList_Sbug_FacingDownLeft 
    dw InstList_Sbug_FacingDown 
    dw InstList_Sbug_FacingDownRight 
    dw InstList_Sbug_FacingRight 
    dw InstList_Sbug_FacingUpRight 

ActivateFunctionPointers_Sbug:
    dw Function_Sbug_Activate_0_MoveForwards 
    dw Function_Sbug_Activate_1_MoveForwardsInAZigZag 
    dw Function_Sbug_Activate_2_MoveAlong45DegreeAngleTowardsSamus 
    dw Function_Sbug_Activate_3_MoveRandomly_WaitForSamusIfHitBlock 
    dw Function_Sbug_Activate_4_MoveRandomly_ReverseUntil6BlockAway 
    dw Function_Sbug_Activate_5_MoveForwards_WaitForSamus 
    dw Function_Sbug_Activate_6_MoveAlong45DegreeAngleAwayFromSamus 

SetSbugInstList:
    LDX.W $0E54 
    LDA.L $7E8008,X 
    CMP.L $7E800A,X 
    BEQ .return 
    STA.L $7E800A,X 
    STA.W $0F92,X 
    LDA.W #$0001 
    STA.W $0F94,X 
    STZ.W $0F90,X 

.return:
    RTS 


InitAI_Sbug:
    LDX.W $0E54 
    LDA.W #$0000 
    STA.L $7E800A,X 
    STA.L $7E8008,X 
    JSR.W CalculateMovingForwardSpeeds 
    JSR.W CalculateMovingLeftVelocities 
    JSR.W CalculateMovingRightVelocities 
    JSR.W DetermineFacingForwardInstListIndex 
    JSR.W DetermineFacingLeftInstListIndex 
    JSR.W DetermineFacingRightInstListIndex 
    LDA.L $7E8000,X 
    TAY 
    LDA.W InstListPointers_Sbug,Y 
    STA.L $7E8008,X 
    JSR.W SetSbugInstList 
    LDA.W #Function_Sbug_WaitForSamusToGetNear 
    STA.W $0FAA,X 
    RTL 


CalculateMovingForwardSpeeds:
    LDA.W $0FB4,X 
    AND.W #$00FF 
    STA.B $14 
    LDA.W $0FB5,X 
    AND.W #$00FF 
    STA.B $12 
    JSL.L Do_Some_Math_With_Sine_Cosine_Terrible_Label_Name ; ($16.$18, $1A.$1C) = ([$14] * |cos([$12] * pi / 80h)|, [$14] * |sin([$12] * pi / 80h)|)
    LDA.B $16 
    STA.L $7E7802,X 
    LDA.B $18 
    STA.L $7E7800,X 
    LDA.B $1A 
    STA.L $7E7806,X 
    LDA.B $1C 
    STA.L $7E7804,X 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_CalculateMovingForwardVelocities_A3A1B0:
    LDA.W $0FB4,X 
    AND.W #$00FF 
    STA.W $0E32 
    LDA.W $0FB5,X 
    AND.W #$00FF 
    JSL.L EightBitCosineMultiplication_A0B0B2 
    LDA.W $0E36 
    STA.L $7E7802,X 
    LDA.W $0E38 
    STA.L $7E7800,X 
    LDA.W $0FB4,X 
    AND.W #$00FF 
    STA.W $0E32 
    LDA.W $0FB5,X 
    AND.W #$00FF 
    JSL.L EightBitNegativeSineMultiplication_A0B0C6 
    LDA.W $0E36 
    STA.L $7E7806,X 
    LDA.W $0E38 
    STA.L $7E7804,X 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


CalculateMovingLeftVelocities:
    LDA.W $0FB4,X 
    AND.W #$00FF 
    STA.W $0E32 
    LDA.W $0FB5,X 
    SEC 
    SBC.W #$0020 
    AND.W #$00FF 
    JSL.L EightBitCosineMultiplication_A0B0B2 
    LDA.W $0E36 
    STA.L $7E780A,X 
    LDA.W $0E38 
    STA.L $7E7808,X 
    LDA.W $0FB4,X 
    AND.W #$00FF 
    STA.W $0E32 
    LDA.W $0FB5,X 
    SEC 
    SBC.W #$0020 
    AND.W #$00FF 
    JSL.L EightBitNegativeSineMultiplication_A0B0C6 
    LDA.W $0E36 
    STA.L $7E780E,X 
    LDA.W $0E38 
    STA.L $7E780C,X 
    RTS 


CalculateMovingRightVelocities:
    LDA.W $0FB4,X 
    AND.W #$00FF 
    STA.W $0E32 
    LDA.W $0FB5,X 
    CLC 
    ADC.W #$0020 
    AND.W #$00FF 
    JSL.L EightBitCosineMultiplication_A0B0B2 
    LDA.W $0E36 
    STA.L $7E7812,X 
    LDA.W $0E38 
    STA.L $7E7810,X 
    LDA.W $0FB4,X 
    AND.W #$00FF 
    STA.W $0E32 
    LDA.W $0FB5,X 
    CLC 
    ADC.W #$0020 
    AND.W #$00FF 
    JSL.L EightBitNegativeSineMultiplication_A0B0C6 
    LDA.W $0E36 
    STA.L $7E7816,X 
    LDA.W $0E38 
    STA.L $7E7814,X 
    RTS 


DetermineFacingForwardInstListIndex:
    LDA.W $0FB5,X 
    SEC 
    SBC.W #$0030 
    AND.W #$00FF 
    LSR #5
    ASL A 
    STA.L $7E8000,X 
    RTS 


DetermineFacingLeftInstListIndex:
    LDA.W $0FB5,X 
    SEC 
    SBC.W #$0030 
    SEC 
    SBC.W #$0020 
    AND.W #$00FF 
    LSR #5
    ASL A 
    STA.L $7E8002,X 
    RTS 


DetermineFacingRightInstListIndex:
    LDA.W $0FB5,X 
    SEC 
    SBC.W #$0030 
    CLC 
    ADC.W #$0020 
    AND.W #$00FF 
    LSR #5
    ASL A 
    STA.L $7E8004,X 
    RTS 


MainAI_Sbug:
    LDX.W $0E54 
    JSR.W ($0FAA,X) 
    RTL 


Function_Sbug_WaitForSamusToGetNear:
    LDX.W $0E54 
    LDA.W $0FB6,X 
    AND.W #$00FF 
    JSL.L IsSamusWithinAPixelColumnsOfEnemy 
    BEQ .return 
    LDA.W $0FB6,X 
    AND.W #$00FF 
    JSL.L IsSamusWithingAPixelRowsOfEnemy 
    BEQ .return 
    LDA.W $0FB7,X 
    AND.W #$00FF 
    ASL A 
    TAY 
    LDA.W ActivateFunctionPointers_Sbug,Y 
    STA.W $0FAA,X 

.return:
    RTS 


Function_Sbug_Activate_0_MoveForwards:
    LDX.W $0E54 
    LDA.W #Function_Sbug_Activated_0_MoveForwards 
    STA.W $0FAA,X 
    RTS 


Function_Sbug_Activate_1_MoveForwardsInAZigZag:
    LDX.W $0E54 
    LDA.W #Function_Sbug_Activated_1_MoveForwardsInAZigZag 
    STA.W $0FAA,X 
    RTS 


Function_Sbug_Activate_3_MoveRandomly_WaitForSamusIfHitBlock:
    LDX.W $0E54 
    LDA.W #$000B 
    STA.W $05E5 
    LDA.W #Function_Sbug_Activated_3_MoveRandomly_WaitForSamusIfHitBlock 
    STA.W $0FAA,X 
    RTS 


Function_Sbug_Activate_4_MoveRandomly_ReverseUntil6BlockAway:
    LDX.W $0E54 
    LDA.W #$0200 
    STA.W $0FA8,X 
    LDA.W #$000B 
    STA.W $05E5 
    LDA.W #Function_Sbug_Activated_4_MoveRandomly_ReverseUntil6BlocksAway 
    STA.W $0FAA,X 
    RTS 


Function_Sbug_Activate_5_MoveForwards_WaitForSamus:
    LDX.W $0E54 
    LDA.W #$0020 
    STA.W $0FB2,X 
    LDA.W #Function_Sbug_Activated_5_MoveForwards_WaitForSamus 
    STA.W $0FAA,X 
    RTS 


Function_Sbug_Activate_2_MoveAlong45DegreeAngleTowardsSamus:
    LDX.W $0E54 
    JSL.L CalculateAngleOfSamusFromEnemy 
    SEC 
    SBC.W #$0040 
    EOR.W #$FFFF 
    INC A 
    CLC 
    ADC.W #$0100 
    AND.W #$00FF 
    STA.W $0FAC,X 
    JSR.W CalculateCustomVelocities 
    JSR.W DetermineCustomInstListIndex 
    LDA.L $7E8006,X 
    TAY 
    LDA.W InstListPointers_Sbug,Y 
    STA.L $7E8008,X 
    JSR.W SetSbugInstList 
    LDA.W #Function_Sbug_Activated_2_MoveAlong45DegreeAngleTowardsSamus 
    STA.W $0FAA,X 
    RTS 


Function_Sbug_Activate_6_MoveAlong45DegreeAngleAwayFromSamus:
    LDX.W $0E54 
    JSL.L CalculateAngleOfSamusFromEnemy 
    SEC 
    SBC.W #$0040 
    EOR.W #$FFFF 
    INC A 
    CLC 
    ADC.W #$0080 
    AND.W #$00FF 
    STA.W $0FAC,X 
    JSR.W CalculateCustomVelocities 
    JSR.W DetermineCustomInstListIndex 
    LDA.L $7E8006,X 
    TAY 
    LDA.W InstListPointers_Sbug,Y 
    STA.L $7E8008,X 
    JSR.W SetSbugInstList 
    LDA.W #Function_Sbug_Activated_6_MoveAlong45DegAngleAwayFromSamus 
    STA.W $0FAA,X 
    RTS 


DetermineCustomInstListIndex:
    LDA.W $0FAC,X 
    SEC 
    SBC.W #$0030 
    AND.W #$00FF 
    LSR #5
    ASL A 
    STA.L $7E8006,X 
    RTS 


CalculateCustomVelocities:
    LDA.W $0FB4,X 
    AND.W #$00FF 
    STA.W $0E32 
    LDA.W $0FAC,X 
    JSL.L EightBitCosineMultiplication_A0B0B2 
    LDA.W $0E36 
    STA.L $7E781A,X 
    LDA.W $0E38 
    STA.L $7E7818,X 
    LDA.W $0FB4,X 
    AND.W #$00FF 
    STA.W $0E32 
    LDA.W $0FAC,X 
    JSL.L EightBitNegativeSineMultiplication_A0B0C6 
    LDA.W $0E36 
    STA.L $7E781E,X 
    LDA.W $0E38 
    STA.L $7E781C,X 
    RTS 


Function_Sbug_Activated_0_MoveForwards:
    LDX.W $0E54 
    JSR.W MoveSbugForward 
    RTS 


Function_Sbug_Activated_1_MoveForwardsInAZigZag:
    LDX.W $0E54 
    LDA.W $0FA4,X 
    AND.W #$0010 
    BNE .right 
    LDA.L $7E8002,X 
    TAY 
    LDA.W InstListPointers_Sbug,Y 
    STA.L $7E8008,X 
    JSR.W SetSbugInstList 
    JSR.W MoveSbugLeft 
    BRA .return 


.right:
    LDA.L $7E8004,X 
    TAY 
    LDA.W InstListPointers_Sbug,Y 
    STA.L $7E8008,X 
    JSR.W SetSbugInstList 
    JSR.W MoveSbugRight 

.return:
    RTS 


Function_Sbug_Activated_2_MoveAlong45DegreeAngleTowardsSamus:
    LDX.W $0E54 
    JSR.W MoveSbugAlongCustomAngle 
    RTS 


Function_Sbug_Activated_6_MoveAlong45DegAngleAwayFromSamus:
    LDX.W $0E54 
    JSR.W MoveSbugAlongCustomAngle 
    RTS 


Function_Sbug_Activated_5_MoveForwards_WaitForSamus:
    LDX.W $0E54 
    DEC.W $0FB2,X 
    BMI .wait 
    JSR.W MoveSbugForward 
    BRA .return 


.wait:
    LDA.W #Function_Sbug_WaitForSamusToGetNear 
    STA.W $0FAA,X 

.return:
    RTS 


Function_Sbug_MoveAlongCustomAngle_WaitForSamusIfHitBlock:
    LDX.W $0E54 
    DEC.W $0FB2,X 
    BMI .timerExpired 
    JSR.W MoveSbugAlongCustomAngle_WaitForSamusIfHitBlock 
    BRA .return 


.timerExpired:
    LDA.W #Function_Sbug_Activated_3_MoveRandomly_WaitForSamusIfHitBlock 
    STA.W $0FAA,X 

.return:
    RTS 


Function_Sbug_MoveStraightAlongAngle_ReverseUntil6BlocksAway:
    LDX.W $0E54 
    DEC.W $0FA8,X 
    BMI .move 
    DEC.W $0FB2,X 
    BMI .done 
    LDA.W $0F7A,X 
    SEC 
    SBC.W $0AF6 
    JSL.L NegateA_A0B067 
    CMP.W #$0060 
    BPL + 
    BRA .move 


  + LDA.W $0F7E,X 
    SEC 
    SBC.W $0AFA 
    JSL.L NegateA_A0B067 
    CMP.W #$0060 
    BPL .reverse 
    BRA .move 


.reverse:
    JSR.W ReverseSbugCustomAngle 

.move:
    JSR.W MoveSbugAlongCustomAngle 
    BRA .return 


.done:
    LDA.W #Function_Sbug_Activated_4_MoveRandomly_ReverseUntil6BlocksAway 
    STA.W $0FAA,X 

.return:
    RTS 


Function_Sbug_Activated_4_MoveRandomly_ReverseUntil6BlocksAway:
    LDX.W $0E54 
    JSL.L GenerateRandomNumber 
    AND.W #$00FF 
    SEC 
    SBC.W #$0040 
    AND.W #$00FF 
    CLC 
    ADC.W $0FAC,X 
    STA.W $0FAC,X 
    JSR.W CalculateCustomVelocities 
    JSR.W DetermineCustomInstListIndex 
    LDA.L $7E8006,X 
    TAY 
    LDA.W InstListPointers_Sbug,Y 
    STA.L $7E8008,X 
    JSR.W SetSbugInstList 
    LDA.W #$0020 
    STA.W $0FB2,X 
    LDA.W #Function_Sbug_MoveStraightAlongAngle_ReverseUntil6BlocksAway 
    STA.W $0FAA,X 
    RTS 


Function_Sbug_Activated_3_MoveRandomly_WaitForSamusIfHitBlock:
    LDX.W $0E54 
    JSL.L GenerateRandomNumber 
    AND.W #$00FF 
    SEC 
    SBC.W #$0040 
    AND.W #$00FF 
    CLC 
    ADC.W $0FAC,X 
    STA.W $0FAC,X 
    JSR.W CalculateCustomVelocities 
    JSR.W DetermineCustomInstListIndex 
    LDA.L $7E8006,X 
    TAY 
    LDA.W InstListPointers_Sbug,Y 
    STA.L $7E8008,X 
    JSR.W SetSbugInstList 
    LDA.W #$0020 
    STA.W $0FB2,X 
    LDA.W #Function_Sbug_MoveAlongCustomAngle_WaitForSamusIfHitBlock 
    STA.W $0FAA,X 
    RTS 


ReverseSbugCustomAngle:
    LDX.W $0E54 
    LDA.L $7E781A,X 
    EOR.W #$FFFF 
    INC A 
    STA.L $7E781A,X 
    LDA.L $7E7818,X 
    EOR.W #$FFFF 
    INC A 
    STA.L $7E7818,X 
    LDA.L $7E781E,X 
    EOR.W #$FFFF 
    INC A 
    STA.L $7E781E,X 
    LDA.L $7E781C,X 
    EOR.W #$FFFF 
    INC A 
    STA.L $7E781C,X 
    LDA.L $7E8006,X 
    CLC 
    ADC.W #$0004 
    AND.W #$0007 
    STA.L $7E8006,X 
    TAY 
    LDA.W InstListPointers_Sbug,Y 
    STA.L $7E8008,X 
    JSR.W SetSbugInstList 
    RTS 


MoveSbugForward:
    LDA.L $7E7802,X 
    STA.W $0E24 
    LDA.L $7E7800,X 
    STA.W $0E26 
    LDA.L $7E7806,X 
    STA.W $0E28 
    LDA.L $7E7804,X 
    STA.W $0E2A 
    LDA.W $0FB5,X 
    AND.W #$00FF 
    STA.W $0E20 
    JSL.L MoveEnemyAccordingToAngleAndXYSpeeds 
    RTS 


RTS_A3A5A2:
    RTS 


MoveSbugLeft:
    LDA.W $0F7A,X 
    CLC 
    ADC.L $7E780A,X 
    STA.W $0F7A,X 
    LDA.W $0F7C,X 
    CLC 
    ADC.L $7E7808,X 
    BCC + 
    INC.W $0F7A,X 

  + STA.W $0F7C,X 
    LDA.W $0F7E,X 
    CLC 
    ADC.L $7E780E,X 
    STA.W $0F7E,X 
    LDA.W $0F80,X 
    CLC 
    ADC.L $7E780C,X 
    BCC + 
    INC.W $0F7E,X 

  + STA.W $0F80,X 
    RTS 


MoveSbugRight:
    LDA.W $0F7A,X 
    CLC 
    ADC.L $7E7812,X 
    STA.W $0F7A,X 
    LDA.W $0F7C,X 
    CLC 
    ADC.L $7E7810,X 
    BCC + 
    INC.W $0F7A,X 

  + STA.W $0F7C,X 
    LDA.W $0F7E,X 
    CLC 
    ADC.L $7E7816,X 
    STA.W $0F7E,X 
    LDA.W $0F80,X 
    CLC 
    ADC.L $7E7814,X 
    BCC + 
    INC.W $0F7E,X 

  + STA.W $0F80,X 
    RTS 


MoveSbugAlongCustomAngle:
    LDA.W $0F7A,X 
    CLC 
    ADC.L $7E781A,X 
    STA.W $0F7A,X 
    LDA.W $0F7C,X 
    CLC 
    ADC.L $7E7818,X 
    BCC + 
    INC.W $0F7A,X 

  + STA.W $0F7C,X 
    LDA.W $0F7E,X 
    CLC 
    ADC.L $7E781E,X 
    STA.W $0F7E,X 
    LDA.W $0F80,X 
    CLC 
    ADC.L $7E781C,X 
    BCC + 
    INC.W $0F7E,X 

  + STA.W $0F80,X 
    RTS 


MoveSbugAlongCustomAngle_WaitForSamusIfHitBlock:
    LDA.L $7E7818,X 
    STA.B $12 
    LDA.L $7E781A,X 
    STA.B $14 
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes 
    BCC .notCollidedWithWall 
    LDA.W #Function_Sbug_WaitForSamusToGetNear 
    STA.W $0FAA,X 
    BRA .return 


.notCollidedWithWall:
    LDA.L $7E781C,X 
    STA.B $12 
    LDA.L $7E781E,X 
    STA.B $14 
    JSL.L MoveEnemyDownBy_14_12 
    BCC .return 
    LDA.W #Function_Sbug_WaitForSamusToGetNear 
    STA.W $0FAA,X 

.return:
    RTS 


RTL_A3A67B:
    RTL 


RTL_A3A67C:
    RTL 


Spritemap_Sbug_FacingUp_0:
    dw $0001,$01FC 
    db $FC 
    dw $3100 

Spritemap_Sbug_FacingUp_1:
    dw $0001,$01FC 
    db $FC 
    dw $3101 

Spritemap_Sbug_FacingUp_2:
    dw $0001,$01FC 
    db $FC 
    dw $3102 

Spritemap_Sbug_FacingUpLeft_0:
    dw $0001,$01FC 
    db $FC 
    dw $3103 

Spritemap_Sbug_FacingUpLeft_1:
    dw $0001,$01FC 
    db $FC 
    dw $3104 

Spritemap_Sbug_FacingUpLeft_2:
    dw $0001,$01FC 
    db $FC 
    dw $3105 

Spritemap_Sbug_FacingLeft_0:
    dw $0001,$01FC 
    db $FC 
    dw $3106 

Spritemap_Sbug_FacingLeft_1:
    dw $0001,$01FC 
    db $FC 
    dw $3107 

Spritemap_Sbug_FacingLeft_2:
    dw $0001,$01FC 
    db $FC 
    dw $3108 

Spritemap_Sbug_FacingDownLeft_0:
    dw $0001,$01FC 
    db $FC 
    dw $B103 

Spritemap_Sbug_FacingDownLeft_1:
    dw $0001,$01FC 
    db $FC 
    dw $B104 

Spritemap_Sbug_FacingDownLeft_2:
    dw $0001,$01FC 
    db $FC 
    dw $B105 

Spritemap_Sbug_FacingDown_0:
    dw $0001,$01FC 
    db $FC 
    dw $B100 

Spritemap_Sbug_FacingDown_1:
    dw $0001,$01FC 
    db $FC 
    dw $B101 

Spritemap_Sbug_FacingDown_2:
    dw $0001,$01FC 
    db $FC 
    dw $B102 

Spritemap_Sbug_FacingDownRight_0:
    dw $0001,$01FC 
    db $FC 
    dw $F103 

Spritemap_Sbug_FacingDownRight_1:
    dw $0001,$01FC 
    db $FC 
    dw $F104 

Spritemap_Sbug_FacingDownRight_2:
    dw $0001,$01FC 
    db $FC 
    dw $F105 

Spritemap_Sbug_FacingRight_0:
    dw $0001,$01FC 
    db $FC 
    dw $7106 

Spritemap_Sbug_FacingRight_1:
    dw $0001,$01FC 
    db $FC 
    dw $7107 

Spritemap_Sbug_FacingRight_2:
    dw $0001,$01FC 
    db $FC 
    dw $7108 

Spritemap_Sbug_FacingUpRight_0:
    dw $0001,$01FC 
    db $FC 
    dw $7103 

Spritemap_Sbug_FacingUpRight_1:
    dw $0001,$01FC 
    db $FC 
    dw $7104 

Spritemap_Sbug_FacingUpRight_2:
    dw $0001,$01FC 
    db $FC 
    dw $7105 

Palette_Mochtroid:
    dw $3800,$3FB7,$2EAD,$0142,$0060,$3B10,$226B,$11C6 
    dw $0984,$72FF,$2CDF,$24B9,$1CAF,$2A9D,$19D6,$0D10 

InstList_Mochtroid_NotTouchingSamus:
    dw $000E 
    dw Spritemap_Mochtroid_NotTouchingSamus_0 
    dw $000E 
    dw Spritemap_Mochtroid_NotTouchingSamus_1 
    dw $000E 
    dw Spritemap_Mochtroid_NotTouchingSamus_2 
    dw $000E 
    dw Spritemap_Mochtroid_NotTouchingSamus_1 
    dw Instruction_Common_GotoY 
    dw InstList_Mochtroid_NotTouchingSamus 

InstList_Mochtroid_TouchingSamus:
    dw $0005 
    dw Spritemap_Mochtroid_TouchingSamus_0 
    dw $0005 
    dw Spritemap_Mochtroid_TouchingSamus_1 
    dw $0005 
    dw Spritemap_Mochtroid_TouchingSamus_2 
    dw $0005 
    dw Spritemap_Mochtroid_TouchingSamus_1 
    dw Instruction_Common_GotoY 
    dw InstList_Mochtroid_TouchingSamus 

MocktroidShakeVelocityTable_X:
    dw $0002,$0000,$FFFE,$0000 

MocktroidShakeVelocityTable_Y:
    dw $0000,$FFFE,$0000,$0002 

InitAI_Mochtroid:
    LDX.W $0E54 
    LDA.W #$0002 
    STA.W $0F9A,X 
    LDA.W #InstList_Mochtroid_NotTouchingSamus 
    JSR.W SetMochtroidInstList 
    STZ.W $0FB2,X 
    RTL 


MainAI_Mochtroid:
    LDX.W $0E54 
    LDA.W $0FB2,X 
    ASL A 
    TAX 
    PHX 
    LDX.W $0E54 
    STZ.W $0FB2,X 
    PLX 
    JSR.W (.pointers,X) 
    RTL 


.pointers:
    dw Function_Mochtroid_0_NotTouchingSamus 
    dw Function_Mochtroid_1_TouchingSamus 
    dw UNUSED_Function_Mochtroid_2_Shaking_A3A88F 

Function_Mochtroid_0_NotTouchingSamus:
    LDX.W $0E54 
    STZ.B $12 
    STZ.B $14 
    LDA.W $0F7E,X 
    SEC 
    SBC.W $0AFA 
    LSR #2
    STA.B $13 
    AND.W #$2000 
    BEQ + 
    LDA.B $14 
    ORA.W #$FFC0 
    STA.B $14 

  + LDA.W $0FAC,X 
    SEC 
    SBC.B $12 
    STA.W $0FAC,X 
    LDA.W $0FAE,X 
    SBC.B $14 
    STA.W $0FAE,X 
    BMI .negativeY 
    CMP.W #$0003 
    BCC + 
    LDA.W #$0003 
    BRA .storeYVelocity 


.negativeY:
    CMP.W #$FFFD 
    BCS + 
    LDA.W #$FFFD 

.storeYVelocity:
    STA.W $0FAE,X 
    STZ.W $0FAC,X 

  + LDA.W $0FAC,X 
    BNE + 
    LDA.W $0FAE,X 
    BNE + 
    STZ.W $0FAC,X 
    STZ.W $0FAE,X 

  + LDA.W $0FAC,X 
    STA.B $12 
    LDA.W $0FAE,X 
    STA.B $14 
    JSL.L MoveEnemyDownBy_14_12 
    BCC .notCollidedWithBlock 
    STZ.W $0FAC,X 
    STZ.W $0FAE,X 

.notCollidedWithBlock:
    LDX.W $0E54 
    STZ.B $12 
    STZ.B $14 
    LDA.W $0F7A,X 
    SEC 
    SBC.W $0AF6 
    LSR #2
    STA.B $13 
    AND.W #$2000 
    BEQ + 
    LDA.B $14 
    ORA.W #$FFC0 
    STA.B $14 

  + LDA.W $0FA8,X 
    SEC 
    SBC.B $12 
    STA.W $0FA8,X 
    LDA.W $0FAA,X 
    SBC.B $14 
    STA.W $0FAA,X 
    BMI .negativeX 
    CMP.W #$0003 
    BCC + 
    LDA.W #$0003 
    BRA .storeXVelocity 


.negativeX:
    CMP.W #$FFFD 
    BCS + 
    LDA.W #$FFFD 

.storeXVelocity:
    STA.W $0FAA,X 
    STZ.W $0FA8,X 

  + LDA.W $0FA8,X 
    BNE + 
    LDA.W $0FAA,X 
    BNE + 
    STZ.W $0FA8,X 
    STZ.W $0FAA,X 

  + LDA.W $0FA8,X 
    STA.B $12 
    LDA.W $0FAA,X 
    STA.B $14 
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes 
    BCC .noBlockCollision 
    STZ.W $0FA8,X 
    STZ.W $0FAA,X 

.noBlockCollision:
    LDA.W #InstList_Mochtroid_NotTouchingSamus 
    JSR.W SetMochtroidInstList 
    RTS 


UNUSED_Function_Mochtroid_2_Shaking_A3A88F:
    LDX.W $0E54 
    LDA.W $0FB0,X 
    AND.W #$0006 
    TAY 
    LDA.W $0F7A,X 
    CLC 
    ADC.W MocktroidShakeVelocityTable_X,Y 
    STA.W $0F7A,X 
    LDA.W $0F7E,X 
    CLC 
    ADC.W MocktroidShakeVelocityTable_Y,Y 
    STA.W $0F7E,X 
    STZ.W $0FA8,X 
    STZ.W $0FAA,X 
    STZ.W $0FAC,X 
    STZ.W $0FAE,X 
    DEC.W $0FB0,X 
    BNE .shaking 
    STZ.W $0FB2,X 

.shaking:
    LDA.W #InstList_Mochtroid_NotTouchingSamus 
    JSR.W SetMochtroidInstList 
    RTS 


Function_Mochtroid_1_TouchingSamus:
    LDX.W $0E54 
    LDA.W $0F7A,X 
    CMP.W $0AF6 
    BEQ .centeredX 
    BPL .moveLeft 
    BMI .moveRight 

.centeredX:
    STZ.W $0FA8,X 
    STZ.W $0FAA,X 
    BRA .moveX 


.moveLeft:
    STZ.W $0FA8,X 
    LDA.W #$FFFF 
    STA.W $0FAA,X 
    BRA .moveX 


.moveRight:
    STZ.W $0FA8,X 
    LDA.W #$0001 
    STA.W $0FAA,X 
    BRA .moveX 


.moveX:
    LDA.W $0FA8,X 
    STA.B $12 
    LDA.W $0FAA,X 
    STA.B $14 
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes 
    LDA.W $0F7E,X 
    CMP.W $0AFA 
    BEQ .centeredY 
    BPL .moveUp 
    BMI .moveDown 

.centeredY:
    STZ.W $0FAC,X 
    STZ.W $0FAE,X 
    BRA .moveY 


.moveUp:
    STZ.W $0FAC,X 
    LDA.W #$FFFF 
    STA.W $0FAE,X 
    BRA .moveY 


.moveDown:
    STZ.W $0FAC,X 
    LDA.W #$0001 
    STA.W $0FAE,X 
    BRA .moveY 


.moveY:
    LDA.W $0FAC,X 
    STA.B $12 
    LDA.W $0FAE,X 
    STA.B $14 
    JSL.L MoveEnemyDownBy_14_12 
    RTS 


SetMochtroidInstList:
    CMP.L $7E7802,X 
    BEQ .return 
    STA.L $7E7802,X 
    STA.W $0F92,X 
    LDA.W #$0001 
    STA.W $0F94,X 
    STZ.W $0F90,X 

.return:
    RTS 


EnemyTouch_Mochtroid:
    LDX.W $0E54 
    LDA.W #$0001 
    STA.W $0FB2,X 
    LDA.W #InstList_Mochtroid_TouchingSamus 
    JSR.W SetMochtroidInstList 
    LDA.L $7E8000,X 
    INC A 
    STA.L $7E8000,X 
    LDA.W $0A6E 
    BNE .damage 
    LDA.W $0E44 
    AND.W #$0007 
    CMP.W #$0007 
    BNE .skipSFX 
    LDA.W $09C2 
    CMP.W #$001E 
    BMI .skipSFX 
    LDA.W #$002D 
    JSL.L QueueSound_Lib3_Max6 

.skipSFX:
    LDA.L $7E8000,X 
    CMP.W #$0050 
    BMI .return 
    LDA.W #$0000 
    STA.L $7E8000,X 

.damage:
    JSL.L CommonA3_NormalEnemyTouchAI 
    LDA.W #$0000 
    STA.W $18A8 
    STA.W $18AA 

.return:
    RTL 


EnemyShot_Mochtroid:
    LDX.W $0E54 
    JSL.L CommonA3_NormalEnemyShotAI 
    RTL 


Spritemap_Mochtroid_NotTouchingSamus_0:
    dw $0006,$8000 
    db $F4 
    dw $6100,$81F0 
    db $F4 
    dw $2100,$0006 
    db $04 
    dw $611C,$01FE 
    db $04 
    dw $611D,$01FA 
    db $04 
    dw $211D,$01F2 
    db $04 
    dw $211C 

Spritemap_Mochtroid_NotTouchingSamus_1:
    dw $0006,$8000 
    db $F4 
    dw $6102,$81F0 
    db $F4 
    dw $2102,$0007 
    db $04 
    dw $610C,$01FF 
    db $04 
    dw $610D,$01F9 
    db $04 
    dw $210D,$01F1 
    db $04 
    dw $210C 

Spritemap_Mochtroid_NotTouchingSamus_2:
    dw $0004,$8000 
    db $F2 
    dw $6104,$81F0 
    db $F2 
    dw $2104,$81F8 
    db $02 
    dw $610E,$81F8 
    db $02 
    dw $210E 

Spritemap_Mochtroid_TouchingSamus_0:
    dw $0004,$81F9 
    db $02 
    dw $610E,$8000 
    db $F2 
    dw $6106,$81F0 
    db $F2 
    dw $2106,$81F7 
    db $02 
    dw $210E 

Spritemap_Mochtroid_TouchingSamus_1:
    dw $0004,$81F0 
    db $F1 
    dw $2108,$81FA 
    db $01 
    dw $610E,$81F6 
    db $01 
    dw $210E,$8000 
    db $F1 
    dw $6108 

Spritemap_Mochtroid_TouchingSamus_2:
    dw $0004,$81F9 
    db $02 
    dw $610E,$81F7 
    db $02 
    dw $210E,$8000 
    db $F2 
    dw $610A,$81F0 
    db $F2 
    dw $210A 

Palette_Sidehopper:
    dw $3800,$57FF,$42F7,$0D4A,$0063,$4F5A,$36B5,$2610 
    dw $1DCE,$4EDA,$3A35,$2990,$14EB,$5FE0,$32A0,$1940 

Instruction_Sidehopper_QueueSoundInY_Lib2_Max3:
    PHY 
    PHX 
    LDA.W $0000,Y 
    JSL.L QueueSound_Lib2_Max3 
    PLX 
    PLY 
    INY #2
    RTL 


InstList_Sidehopper_Hopping_UpsideUp:
    dw Instruction_Common_EnableOffScreenProcessing 
    dw Instruction_Sidehopper_QueueSoundInY_Lib2_Max3 
    dw $005D,$0001 
    dw Spritemap_Sidehopper_2 
    dw Instruction_Common_Sleep 

InstList_Sidehopper_Landed_UpsideUp:
    dw Instruction_Common_DisableOffScreenProcessing 
    dw Instruction_Sidehopper_QueueSoundInY_Lib2_Max3 
    dw $005E,$0002 
    dw Spritemap_Sidehopper_0 
    dw $0005 
    dw Spritemap_Sidehopper_1 
    dw $0002 
    dw Spritemap_Sidehopper_0 
    dw $0003 
    dw Spritemap_Sidehopper_1 
    dw Instruction_Hopper_ReadyToHop 
    dw Instruction_Common_Sleep 

InstList_Sidehopper_Hopping_UpsideDown:
    dw Instruction_Common_EnableOffScreenProcessing 
    dw Instruction_Sidehopper_QueueSoundInY_Lib2_Max3 
    dw $005D,$0001 
    dw Spritemap_Sidehopper_5 
    dw Instruction_Common_Sleep 

InstList_Sidehopper_Landed_UpsideDown:
    dw Instruction_Common_DisableOffScreenProcessing 
    dw Instruction_Sidehopper_QueueSoundInY_Lib2_Max3 
    dw $005E,$0002 
    dw Spritemap_Sidehopper_3 
    dw $0005 
    dw Spritemap_Sidehopper_4 
    dw $0002 
    dw Spritemap_Sidehopper_3 
    dw $0003 
    dw Spritemap_Sidehopper_4 
    dw Instruction_Hopper_ReadyToHop 
    dw Instruction_Common_Sleep 

InstListPointers_Sidehopper_Landed_UpsideUp:
    dw InstList_Sidehopper_Landed_UpsideUp 
    dw InstList_SidehopperLarge_Landed_UpsideUp 
    dw InstList_DesgeegaLarge_Landed_UpsideUp 
    dw InstList_Desgeega_Landed_UpsideUp 

InstListPointers_Sidehopper_Landed_UpsideDown:
    dw InstList_Sidehopper_Landed_UpsideDown 
    dw InstList_SidehopperLarge_Landed_UpsideDown 
    dw InstList_DesgeegaLarge_Landed_UpsideDown 
    dw InstList_Desgeega_Landed_UpsideDown 

InstListPointers_Sidehopper_Hopping_UpsideUp:
    dw InstList_Sidehopper_Hopping_UpsideUp 
    dw InstList_SidehopperLarge_Hopping_UpsideUp 
    dw InstList_DesgeegaLarge_Hopping_UpsideUp 
    dw InstList_Desgeega_Hopping_UpsideUp 

InstListPointers_Sidehopper_Hopping_UpsideDown:
    dw InstList_Sidehopper_Hopping_UpsideDown 
    dw InstList_SidehopperLarge_Hopping_UpsideDown 
    dw InstList_DesgeegaLarge_Hopping_UpsideDown 
    dw InstList_Desgeega_Hopping_UpsideDown 

HopFunctionPointers_Sidehopper:
    dw Function_Hopper_SmallHop 
    dw Function_Hopper_BigHop 

HopTable_Small_YSpeedTableIndexDelta:
    db $03,$00,$03,$00 

HopTable_Small_XSpeed:
    db $03,$00,$03,$00 

HopTable_Small_JumpHeight:
    db $00,$10,$00,$10 

HopTable_Big_YSpeedTableIndexDelta:
    db $04,$00,$04,$00 

HopTable_Big_XSpeed:
    db $03,$00,$03,$00 

HopTable_Big_JumpHeight:
    db $00,$30,$00,$30 

Instruction_Hopper_ReadyToHop:
    LDX.W $0E54 
    LDA.W #$0001 
    STA.L $7E7808,X 
    RTL 


InitAI_Hopper:
    LDX.W $0E54 
    LDA.W #$0025 
    STA.W $05E5 
    JSL.L GenerateRandomNumber 
    LDA.W #$0000 
    STA.L $7E7806,X 
    STA.L $7E7808,X 
    STA.L $7E780A,X 
    LDA.W $0F78,X 
    TAX 
    LDA.L $A0002A,X 
    ASL A 
    LDX.W $0E54 
    STA.L $7E780C,X 
    LDA.W $0FB4,X 
    BNE .upsideDown 
    LDA.L $7E780C,X 
    TAY 
    LDA.W InstListPointers_Sidehopper_Landed_UpsideUp,Y 
    BRA + 


.upsideDown:
    LDA.L $7E780C,X 
    TAY 
    LDA.W InstListPointers_Sidehopper_Landed_UpsideDown,Y 

  + STA.L $7E7800,X 
    JSR.W SetSidehopperInstList 
    LDA.W $0F78,X 
    TAX 
    LDA.L $A0002A,X 
    BEQ .sidehopper 
    LDA.W #$0002 
    LDX.W $0E54 
    STA.L $7E780A,X 

.sidehopper:
    LDX.W $0E54 
    LDA.L $7E780A,X 
    TAY 
    LDA.W HopTable_Small_JumpHeight,Y 
    STA.B $16 
    LDA.W HopTable_Small_YSpeedTableIndexDelta,Y 
    STA.B $18 
    JSR.W Hoppers_CalculateInitialHopSpeed 
    STA.L $7E7802,X 
    LDA.L $7E780A,X 
    TAY 
    LDA.W HopTable_Big_JumpHeight,Y 
    STA.B $16 
    LDA.W HopTable_Big_YSpeedTableIndexDelta,Y 
    STA.B $18 
    JSR.W Hoppers_CalculateInitialHopSpeed 
    STA.L $7E7804,X 
    LDA.W #Function_Hopper_Hop 
    STA.W $0FAA,X 
    RTL 


Hoppers_CalculateInitialHopSpeed:
    STZ.B $12 
    STZ.B $14 

.loop:
    LDA.B $12 
    CLC 
    ADC.B $18 
    STA.B $12 
    ASL #3
    TAY 
    LDA.B $14 
    CLC 
    ADC.W CommonEnemySpeeds_QuadraticallyIncreasing+1,Y 
    STA.B $14 
    CMP.B $16 
    BMI .loop 
    LDA.B $12 
    RTS 


SetSidehopperInstList:
    LDX.W $0E54 
    LDA.L $7E7800,X 
    STA.W $0F92,X 
    LDA.W #$0001 
    STA.W $0F94,X 
    STZ.W $0F90,X 
    RTS 


MainAI_Hopper:
    LDX.W $0E54 
    JSR.W ($0FAA,X) 
    RTL 


Function_Hopper_Hop:
    JSL.L GenerateRandomNumber 
    AND.W #$0001 
    ASL A 
    TAY 
    LDA.W HopFunctionPointers_Sidehopper,Y 
    STA.W $0FAA,X 
    RTS 


Function_Hopper_SmallHop:
    LDX.W $0E54 
    LDA.L $7E780A,X 
    TAY 
    LDA.W HopTable_Small_YSpeedTableIndexDelta,Y 
    STA.W $0FB0,X 
    LDA.W HopTable_Small_XSpeed,Y 
    STA.W $0FAE,X 
    LDA.L $7E7802,X 
    STA.W $0FAC,X 
    LDA.W #Function_Hopper_Hop_UpsideUp 
    STA.W $0FAA,X 
    LDA.W $0FB4,X 
    BEQ .return 
    LDA.W #Function_Hopper_Hop_UpsideDown 
    STA.W $0FAA,X 

.return:
    RTS 


Function_Hopper_BigHop:
    LDX.W $0E54 
    LDA.L $7E780A,X 
    TAY 
    LDA.W HopTable_Big_YSpeedTableIndexDelta,Y 
    STA.W $0FB0,X 
    LDA.W HopTable_Big_XSpeed,Y 
    STA.W $0FAE,X 
    LDA.L $7E7804,X 
    STA.W $0FAC,X 
    LDA.W #Function_Hopper_Hop_UpsideUp 
    STA.W $0FAA,X 
    LDA.W $0FB4,X 
    BEQ .return 
    LDA.W #Function_Hopper_Hop_UpsideDown 
    STA.W $0FAA,X 

.return:
    RTS 


Function_Hopper_Hop_UpsideUp:
    LDX.W $0E54 
    LDA.W #Function_Hopper_HopBackwards_UpsideUp 
    STA.W $0FAA,X 
    JSL.L Get_SamusX_minus_EnemyX 
    BMI .return 
    LDA.W #Function_Hopper_HopForwards_UpsideUp 
    STA.W $0FAA,X 

.return:
    RTS 


Function_Hopper_Hop_UpsideDown:
    LDX.W $0E54 
    LDA.W #Function_Hopper_HopBackwards_UpsideDown 
    STA.W $0FAA,X 
    JSL.L Get_SamusX_minus_EnemyX 
    BMI .return 
    LDA.W #Function_Hopper_HopForwards_UpsideDown 
    STA.W $0FAA,X 

.return:
    RTS 


Function_Hopper_HopBackwards_UpsideUp:
    LDX.W $0E54 
    LDA.W $0FAE,X 
    EOR.W #$FFFF 
    INC A 
    STA.W $0FAE,X 
    LDA.L $7E780C,X 
    TAY 
    LDA.W InstListPointers_Sidehopper_Hopping_UpsideUp,Y 
    STA.L $7E7800,X 
    JSR.W SetSidehopperInstList 
    LDA.W #Function_Hopper_Jumping_UpsideUp 
    STA.W $0FAA,X 
    RTS 


Function_Hopper_HopForwards_UpsideUp:
    LDX.W $0E54 
    LDA.L $7E780C,X 
    TAY 
    LDA.W InstListPointers_Sidehopper_Hopping_UpsideUp,Y 
    STA.L $7E7800,X 
    JSR.W SetSidehopperInstList 
    LDA.W #Function_Hopper_Jumping_UpsideUp_duplicate 
    STA.W $0FAA,X 
    RTS 


Function_Hopper_HopBackwards_UpsideDown:
    LDX.W $0E54 
    LDA.W $0FAE,X 
    EOR.W #$FFFF 
    INC A 
    STA.W $0FAE,X 
    LDA.L $7E780C,X 
    TAY 
    LDA.W InstListPointers_Sidehopper_Hopping_UpsideDown,Y 
    STA.L $7E7800,X 
    JSR.W SetSidehopperInstList 
    LDA.W #Function_Hopper_Jumping_UpsideDown 
    STA.W $0FAA,X 
    RTS 


Function_Hopper_HopForwards_UpsideDown:
    LDX.W $0E54 
    LDA.L $7E780C,X 
    TAY 
    LDA.W InstListPointers_Sidehopper_Hopping_UpsideDown,Y 
    STA.L $7E7800,X 
    JSR.W SetSidehopperInstList 
    LDA.W #Function_Hopper_Jumping_UpsideDown_duplicate 
    STA.W $0FAA,X 
    RTS 


Function_Hopper_Landed:
    LDX.W $0E54 
    LDA.L $7E780C,X 
    TAY 
    LDA.W InstListPointers_Sidehopper_Landed_UpsideUp,Y 
    STA.L $7E7800,X 
    LDA.W $0FB4,X 
    BEQ .upsideDown 
    LDA.L $7E780C,X 
    TAY 
    LDA.W InstListPointers_Sidehopper_Landed_UpsideDown,Y 
    STA.L $7E7800,X 

.upsideDown:
    JSR.W SetSidehopperInstList 
    LDA.W #Function_Hopper_WaitToHop 
    STA.W $0FAA,X 
    RTS 


Function_Hopper_Jumping_UpsideUp:
    LDX.W $0E54 
    LDA.L $7E7806,X 
    BNE .falling 
    JSR.W HopperMovement_Jumping_UpsideUp 
    BRA .return 


.falling:
    JSR.W HopperMovement_Falling_UpsideUp 

.return:
    RTS 


Function_Hopper_Jumping_UpsideUp_duplicate:
    LDX.W $0E54 
    LDA.L $7E7806,X 
    BNE .falling 
    JSR.W HopperMovement_Jumping_UpsideUp 
    BRA .return 


.falling:
    JSR.W HopperMovement_Falling_UpsideUp 

.return:
    RTS 


Function_Hopper_Jumping_UpsideDown:
    LDX.W $0E54 
    LDA.L $7E7806,X 
    BNE .falling 
    JSR.W HopperMovement_Jumping_UpsideDown 
    BRA .return 


.falling:
    JSR.W HopperMovement_Falling_UpsideDown 

.return:
    RTS 


Function_Hopper_Jumping_UpsideDown_duplicate:
    LDX.W $0E54 
    LDA.L $7E7806,X 
    BNE .falling 
    JSR.W HopperMovement_Jumping_UpsideDown 
    BRA .return 


.falling:
    JSR.W HopperMovement_Falling_UpsideDown 

.return:
    RTS 


Function_Hopper_WaitToHop:
    LDX.W $0E54 
    LDA.L $7E7808,X 
    BEQ .return 
    LDA.W #$0000 
    STA.L $7E7808,X 
    LDA.W #Function_Hopper_Hop 
    STA.W $0FAA,X 

.return:
    RTS 


HopperMovement_Jumping_UpsideUp:
    LDX.W $0E54 
    LDA.W $0FAC,X 
    ASL #3
    TAY 
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing+6,Y 
    STA.B $14 
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing+4,Y 
    STA.B $12 
    JSL.L MoveEnemyDownBy_14_12 
    BCC .notCollidedWithBlock 
    LDA.W $0FAE,X 
    EOR.W #$FFFF 
    INC A 
    STA.W $0FAE,X 
    LDA.W #$0001 
    STA.L $7E7806,X 
    BRA .return 


.notCollidedWithBlock:
    LDA.W $0FAE,X 
    STA.B $14 
    STZ.B $12 
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes 
    BCC .notCollidedWithWall 
    LDA.W $0FAE,X 
    EOR.W #$FFFF 
    INC A 
    STA.W $0FAE,X 
    LDA.W #$0001 
    STA.L $7E7806,X 
    BRA .return 


.notCollidedWithWall:
    LDA.W $0FAC,X 
    SEC 
    SBC.W $0FB0,X 
    STA.W $0FAC,X 
    BPL .return 
    LDA.W #$0001 
    STA.L $7E7806,X 
    LDA.W #$0000 
    STA.W $0FAC,X 

.return:
    RTS 


HopperMovement_Falling_UpsideUp:
    LDX.W $0E54 
    LDA.W $0FAC,X 
    ASL #3
    TAY 
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing+2,Y 
    STA.B $14 
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing,Y 
    STA.B $12 
    JSL.L MoveEnemyDownBy_14_12 
    BCC .notCollidedWithBlock 
    LDA.W #$0000 
    STA.L $7E7806,X 
    LDA.W #Function_Hopper_Landed 
    STA.W $0FAA,X 
    BRA .return 


.notCollidedWithBlock:
    LDA.W $0FAE,X 
    STA.B $14 
    STZ.B $12 
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes 
    BCC .notCollidedWithWall 
    LDA.W $0FAE,X 
    EOR.W #$FFFF 
    INC A 
    STA.W $0FAE,X 

.notCollidedWithWall:
    LDA.W $0FAC,X 
    CLC 
    ADC.W $0FB0,X 
    CMP.W #$0040 
    BMI + 
    LDA.W #$0040 

  + STA.W $0FAC,X 

.return:
    RTS 


HopperMovement_Jumping_UpsideDown:
    LDX.W $0E54 
    LDA.W $0FAC,X 
    ASL #3
    TAY 
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing+2,Y 
    STA.B $14 
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing,Y 
    STA.B $12 
    JSL.L MoveEnemyDownBy_14_12 
    BCC .notCollidedWithBlock 
    LDA.W $0FAE,X 
    EOR.W #$FFFF 
    INC A 
    STA.W $0FAE,X 
    LDA.W #$0001 
    STA.L $7E7806,X 
    BRA .return 


.notCollidedWithBlock:
    LDA.W $0FAE,X 
    STA.B $14 
    STZ.B $12 
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes 
    BCC .notCollidedWithWall 
    LDA.W $0FAE,X 
    EOR.W #$FFFF 
    INC A 
    STA.W $0FAE,X 
    LDA.W #$0001 
    STA.L $7E7806,X 
    BRA .return 


.notCollidedWithWall:
    LDA.W $0FAC,X 
    SEC 
    SBC.W $0FB0,X 
    STA.W $0FAC,X 
    BPL .return 
    LDA.W #$0001 
    STA.L $7E7806,X 
    LDA.W #$0000 
    STA.W $0FAC,X 

.return:
    RTS 


HopperMovement_Falling_UpsideDown:
    LDX.W $0E54 
    LDA.W $0FAC,X 
    ASL #3
    TAY 
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing+6,Y 
    STA.B $14 
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing+4,Y 
    STA.B $12 
    JSL.L MoveEnemyDownBy_14_12 
    BCC .notCollidedWithBlock 
    LDA.W #$0000 
    STA.L $7E7806,X 
    LDA.W #Function_Hopper_Landed 
    STA.W $0FAA,X 
    BRA .return 


.notCollidedWithBlock:
    LDA.W $0FAE,X 
    STA.B $14 
    STZ.B $12 
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes 
    BCC .notCollidedWithWall 
    LDA.W $0FAE,X 
    EOR.W #$FFFF 
    INC A 
    STA.W $0FAE,X 

.notCollidedWithWall:
    LDA.W $0FAC,X 
    CLC 
    ADC.W $0FB0,X 
    CMP.W #$0040 
    BMI + 
    LDA.W #$0040 

  + STA.W $0FAC,X 

.return:
    RTS 


RTL_A3AEE1:
    RTL 


RTL_A3AEE2:
    RTL 


Spritemap_Sidehopper_0:
    dw $0005,$81F8 
    db $F3 
    dw $2100,$8004 
    db $EC 
    dw $6106,$8004 
    db $FC 
    dw $6104,$81EC 
    db $EC 
    dw $2106,$81EC 
    db $FC 
    dw $2104 

Spritemap_Sidehopper_1:
    dw $0005,$81F8 
    db $F5 
    dw $2102,$8004 
    db $EC 
    dw $610A,$81EC 
    db $EC 
    dw $210A,$8004 
    db $FC 
    dw $6108,$81EC 
    db $FC 
    dw $2108 

Spritemap_Sidehopper_2:
    dw $0005,$81F8 
    db $EF 
    dw $2100,$8004 
    db $04 
    dw $610E,$8004 
    db $F4 
    dw $610C,$81EC 
    db $04 
    dw $210E,$81EC 
    db $F4 
    dw $210C 

Spritemap_Sidehopper_3:
    dw $0005,$81F8 
    db $FD 
    dw $A100,$8004 
    db $04 
    dw $E106,$8004 
    db $F4 
    dw $E104,$81EC 
    db $04 
    dw $A106,$81EC 
    db $F4 
    dw $A104 

Spritemap_Sidehopper_4:
    dw $0005,$81F8 
    db $FB 
    dw $A102,$8004 
    db $04 
    dw $E10A,$81EC 
    db $04 
    dw $A10A,$8004 
    db $F4 
    dw $E108,$81EC 
    db $F4 
    dw $A108 

Spritemap_Sidehopper_5:
    dw $0005,$81F8 
    db $01 
    dw $A100,$8004 
    db $EC 
    dw $E10E,$8004 
    db $FC 
    dw $E10C,$81EC 
    db $EC 
    dw $A10E,$81EC 
    db $FC 
    dw $A10C 

Palette_Desgeega:
    dw $3800,$72FA,$55B0,$2845,$1801,$6210,$496B,$38C6 
    dw $2C63,$241F,$1C17,$142F,$0C47,$03E0,$02A0,$0140 

InstList_Desgeega_Hopping_UpsideUp:
    dw Instruction_Common_EnableOffScreenProcessing 
    dw $0001 
    dw Spritemap_Desgeega_2 
    dw Instruction_Common_Sleep 

InstList_Desgeega_Landed_UpsideUp:
    dw Instruction_Common_DisableOffScreenProcessing 
    dw $0002 
    dw Spritemap_Desgeega_0 
    dw $0005 
    dw Spritemap_Desgeega_1 
    dw $0002 
    dw Spritemap_Desgeega_0 
    dw $0003 
    dw Spritemap_Desgeega_1 
    dw Instruction_Hopper_ReadyToHop 
    dw Instruction_Common_Sleep 

InstList_Desgeega_Hopping_UpsideDown:
    dw Instruction_Common_EnableOffScreenProcessing 
    dw $0001 
    dw Spritemap_Desgeega_5 
    dw Instruction_Common_Sleep 

InstList_Desgeega_Landed_UpsideDown:
    dw Instruction_Common_DisableOffScreenProcessing 
    dw $0002 
    dw Spritemap_Desgeega_3 
    dw $0005 
    dw Spritemap_Desgeega_4 
    dw $0002 
    dw Spritemap_Desgeega_3 
    dw $0003 
    dw Spritemap_Desgeega_4 
    dw Instruction_Hopper_ReadyToHop 
    dw Instruction_Common_Sleep 

RTL_A3AFE1:
    RTL 


RTL_A3AFE2:
    RTL 


Spritemap_Desgeega_0:
    dw $0005,$81F8 
    db $F3 
    dw $2100,$8004 
    db $EC 
    dw $6106,$8004 
    db $FC 
    dw $6104,$81EC 
    db $EC 
    dw $2106,$81EC 
    db $FC 
    dw $2104 

Spritemap_Desgeega_1:
    dw $0005,$81F8 
    db $F5 
    dw $2102,$8004 
    db $EC 
    dw $610A,$81EC 
    db $EC 
    dw $210A,$8004 
    db $FC 
    dw $6108,$81EC 
    db $FC 
    dw $2108 

Spritemap_Desgeega_2:
    dw $0005,$81F8 
    db $EF 
    dw $2100,$8004 
    db $04 
    dw $610E,$8004 
    db $F4 
    dw $610C,$81EC 
    db $04 
    dw $210E,$81EC 
    db $F4 
    dw $210C 

Spritemap_Desgeega_3:
    dw $0005,$81F8 
    db $FD 
    dw $A100,$8004 
    db $04 
    dw $E106,$8004 
    db $F4 
    dw $E104,$81EC 
    db $04 
    dw $A106,$81EC 
    db $F4 
    dw $A104 

Spritemap_Desgeega_4:
    dw $0005,$81F8 
    db $FB 
    dw $A102,$8004 
    db $04 
    dw $E10A,$81EC 
    db $04 
    dw $A10A,$8004 
    db $F4 
    dw $E108,$81EC 
    db $F4 
    dw $A108 

Spritemap_Desgeega_5:
    dw $0005,$81F8 
    db $01 
    dw $A100,$8004 
    db $EC 
    dw $E10E,$8004 
    db $FC 
    dw $E10C,$81EC 
    db $EC 
    dw $A10E,$81EC 
    db $FC 
    dw $A10C 

Palette_SidehopperLarge:
    dw $3800,$57FF,$42F7,$0D4A,$0063,$4F5A,$36B5,$2610 
    dw $1DCE,$4EDA,$3A35,$2990,$14EB,$5FE0,$32A0,$1940 

Palette_SidehopperTourian:
    dw $3800,$7FFF,$56E0,$3180,$18C0,$6BC0,$5EC0,$4A20 
    dw $35A0,$7FFF,$039C,$0237,$00D1,$03FF,$0237,$00D1 

InstList_SidehopperLarge_Hopping_UpsideUp:
    dw Instruction_Common_EnableOffScreenProcessing 
    dw Instruction_Sidehopper_QueueSoundInY_Lib2_Max3 
    dw $005D,$0001 
    dw Spritemap_SidehopperTourian_2 
    dw Instruction_Common_Sleep 

InstList_SidehopperLarge_Landed_UpsideUp:
    dw Instruction_Common_DisableOffScreenProcessing 
    dw Instruction_Sidehopper_QueueSoundInY_Lib2_Max3 
    dw $005E,$0002 
    dw Spritemap_SidehopperTourian_0 
    dw $0005 
    dw Spritemap_SidehopperTourian_1 
    dw $0002 
    dw Spritemap_SidehopperTourian_0 
    dw $0003 
    dw Spritemap_SidehopperTourian_1 
    dw Instruction_Hopper_ReadyToHop 
    dw Instruction_Common_Sleep 

InstList_SidehopperLarge_Hopping_UpsideDown:
    dw Instruction_Common_EnableOffScreenProcessing 
    dw Instruction_Sidehopper_QueueSoundInY_Lib2_Max3 
    dw $005D,$0001 
    dw Spritemap_SidehopperTourian_5 
    dw Instruction_Common_Sleep 

InstList_SidehopperLarge_Landed_UpsideDown:
    dw Instruction_Common_DisableOffScreenProcessing 
    dw Instruction_Sidehopper_QueueSoundInY_Lib2_Max3 
    dw $005E,$0002 
    dw Spritemap_SidehopperTourian_3 
    dw $0005 
    dw Spritemap_SidehopperTourian_4 
    dw $0002 
    dw Spritemap_SidehopperTourian_3 
    dw $0003 
    dw Spritemap_SidehopperTourian_4 
    dw Instruction_Hopper_ReadyToHop 
    dw Instruction_Common_Sleep 

Spritemap_SidehopperTourian_0:
    dw $0007,$0000 
    db $EC 
    dw $2101,$01F8 
    db $EC 
    dw $2100,$C20C 
    db $04 
    dw $6106,$C3E4 
    db $04 
    dw $2106,$C208 
    db $F4 
    dw $6104,$C3E8 
    db $F4 
    dw $2104,$C3F8 
    db $F4 
    dw $2110 

Spritemap_SidehopperTourian_1:
    dw $0007,$C3F8 
    db $F6 
    dw $2112,$C20D 
    db $04 
    dw $610A,$C3E3 
    db $04 
    dw $210A,$C208 
    db $F4 
    dw $6108,$C3E8 
    db $F4 
    dw $2108,$0000 
    db $EE 
    dw $2101,$01F8 
    db $EE 
    dw $2100 

Spritemap_SidehopperTourian_2:
    dw $000B,$0010 
    db $0C 
    dw $6102,$0008 
    db $0C 
    dw $6103,$01F0 
    db $0C 
    dw $2103,$01E8 
    db $0C 
    dw $2102,$C208 
    db $FC 
    dw $610E,$C3E8 
    db $FC 
    dw $210E,$C208 
    db $EC 
    dw $610C,$C3E8 
    db $EC 
    dw $210C,$0000 
    db $E3 
    dw $2101,$01F8 
    db $E3 
    dw $2100,$C3F8 
    db $EB 
    dw $2110 

Spritemap_SidehopperTourian_3:
    dw $0007,$0000 
    db $0C 
    dw $A101,$01F8 
    db $0C 
    dw $A100,$C20C 
    db $EC 
    dw $E106,$C3E4 
    db $EC 
    dw $A106,$C208 
    db $FC 
    dw $E104,$C3E8 
    db $FC 
    dw $A104,$C3F8 
    db $FC 
    dw $A110 

Spritemap_SidehopperTourian_4:
    dw $0007,$C3F8 
    db $FA 
    dw $A112,$C20D 
    db $EC 
    dw $E10A,$C3E3 
    db $EC 
    dw $A10A,$C208 
    db $FC 
    dw $E108,$C3E8 
    db $FC 
    dw $A108,$0000 
    db $0A 
    dw $A101,$01F8 
    db $0A 
    dw $A100 

Spritemap_SidehopperTourian_5:
    dw $000B,$0010 
    db $EC 
    dw $E102,$0008 
    db $EC 
    dw $E103,$01F0 
    db $EC 
    dw $A103,$01E8 
    db $EC 
    dw $A102,$C208 
    db $F4 
    dw $E10E,$C3E8 
    db $F4 
    dw $A10E,$C208 
    db $04 
    dw $E10C,$C3E8 
    db $04 
    dw $A10C,$0000 
    db $15 
    dw $A101,$01F8 
    db $15 
    dw $A100,$C3F8 
    db $05 
    dw $A110 

Palette_DesgeegaLarge:
    dw $3800,$72FA 
    db $B0 
    dw $4555,$0128 
    db $18 
    dw $6210,$496B 
    db $C6 
    dw $6338,$1F2C 
    db $24 
    dw $1C17,$142F 
    db $47 
    dw $E00C,$A003 
    db $02 
    dw $0140 

InstList_DesgeegaLarge_Hopping_UpsideUp:
    dw Instruction_Common_EnableOffScreenProcessing 
    dw $0001 
    dw Spritemap_DesgeegaLarge_2 
    dw Instruction_CommonA3_Sleep 

InstList_DesgeegaLarge_Landed_UpsideUp:
    dw Instruction_Common_DisableOffScreenProcessing 
    dw $0002 
    dw Spritemap_DesgeegaLarge_0 
    dw $0005 
    dw Spritemap_DesgeegaLarge_1 
    dw $0002 
    dw Spritemap_DesgeegaLarge_0 
    dw $0003 
    dw Spritemap_DesgeegaLarge_1 
    dw Instruction_Hopper_ReadyToHop 
    dw Instruction_Common_Sleep 

InstList_DesgeegaLarge_Hopping_UpsideDown:
    dw Instruction_Common_EnableOffScreenProcessing 
    dw $0001 
    dw Spritemap_DesgeegaLarge_5 
    dw Instruction_Common_Sleep 

InstList_DesgeegaLarge_Landed_UpsideDown:
    dw Instruction_Common_DisableOffScreenProcessing 
    dw $0002 
    dw Spritemap_DesgeegaLarge_3 
    dw $0005 
    dw Spritemap_DesgeegaLarge_4 
    dw $0002 
    dw Spritemap_DesgeegaLarge_3 
    dw $0003 
    dw Spritemap_DesgeegaLarge_4 
    dw Instruction_Hopper_ReadyToHop 
    dw Instruction_Common_Sleep 

Spritemap_DesgeegaLarge_0:
    dw $0009,$C3F8 
    db $F5 
    dw $2100,$C3E5 
    db $F4 
    dw $2104,$C20B 
    db $F4 
    dw $6104,$0006 
    db $F5 
    dw $611A,$01F2 
    db $F5 
    dw $211A,$C20B 
    db $04 
    dw $6106,$C3E5 
    db $04 
    dw $2106,$0000 
    db $ED 
    dw $210D,$01F8 
    db $ED 
    dw $210C 

Spritemap_DesgeegaLarge_1:
    dw $0009,$C3F8 
    db $F6 
    dw $2102,$C20A 
    db $F4 
    dw $6104,$C3E6 
    db $F4 
    dw $2104,$0006 
    db $F6 
    dw $611C,$01F2 
    db $F6 
    dw $211C,$C20B 
    db $04 
    dw $6106,$C3E5 
    db $04 
    dw $2106,$0000 
    db $EE 
    dw $210B,$01F8 
    db $EE 
    dw $210A 

Spritemap_DesgeegaLarge_2:
    dw $000B,$C3F8 
    db $F0 
    dw $2100,$C20B 
    db $F4 
    dw $6104,$C3E5 
    db $F4 
    dw $2104,$0007 
    db $F4 
    dw $611B,$01F1 
    db $F4 
    dw $211B,$0000 
    db $E8 
    dw $210D,$01F8 
    db $E8 
    dw $210C,$C20A 
    db $14 
    dw $610E,$C3E6 
    db $14 
    dw $210E,$C20A 
    db $04 
    dw $6108,$C3E6 
    db $04 
    dw $2108 

Spritemap_DesgeegaLarge_3:
    dw $0009,$C3F8 
    db $FB 
    dw $A100,$C3E5 
    db $FC 
    dw $A104,$C20B 
    db $FC 
    dw $E104,$0006 
    db $03 
    dw $E11A,$01F2 
    db $03 
    dw $A11A,$C20B 
    db $EC 
    dw $E106,$C3E5 
    db $EC 
    dw $A106,$0000 
    db $0B 
    dw $A10D,$01F8 
    db $0B 
    dw $A10C 

Spritemap_DesgeegaLarge_4:
    dw $0009,$C3F8 
    db $FA 
    dw $A102,$C20A 
    db $FC 
    dw $E104,$C3E6 
    db $FC 
    dw $A104,$0006 
    db $02 
    dw $E11C,$01F2 
    db $02 
    dw $A11C,$C20B 
    db $EC 
    dw $E106,$C3E5 
    db $EC 
    dw $A106,$0000 
    db $0A 
    dw $A10B,$01F8 
    db $0A 
    dw $A10A 

Spritemap_DesgeegaLarge_5:
    dw $000B,$C3F8 
    db $04 
    dw $A100,$C20B 
    db $00 
    dw $E104,$C3E5 
    db $00 
    dw $A104,$0007 
    db $08 
    dw $E11B,$01F1 
    db $08 
    dw $A11B,$0000 
    db $14 
    dw $A10D,$01F8 
    db $14 
    dw $A10C,$C20A 
    db $E0 
    dw $E10E,$C3E6 
    db $E0 
    dw $A10E,$C20A 
    db $F0 
    dw $E108,$C3E6 
    db $F0 
    dw $A108 

Palette_Zoa:
    dw $3800,$72FA,$55B0,$2845,$1801,$6210,$496B,$38C6 
    dw $2C63,$1D79,$1933,$150E,$10C8,$3BE0,$2680,$1580 

InstList_Zoa_FacingLeft_Shooting:
    dw Instruction_Zoa_SetXSpeedTableIndexTo4 
    dw $0040 
    dw Spritemap_Zoa_0 
    dw Instruction_Zoa_SetXSpeedTableIndexTo8 
    dw $0008 
    dw Spritemap_Zoa_1 
    dw Instruction_Zoa_SetXSpeedTableIndexToC 
    dw $0030 
    dw Spritemap_Zoa_2 
    dw Instruction_Common_GotoY 
    dw InstList_Zoa_FacingLeft_Shooting 

InstList_Zoa_FacingLeft_Rising:
    dw $0004 
    dw Spritemap_Zoa_4 
    dw $0004 
    dw Spritemap_Zoa_3 
    dw $0004 
    dw Spritemap_Zoa_5 
    dw Instruction_Common_GotoY 
    dw InstList_Zoa_FacingLeft_Rising 

InstList_Zoa_FacingRight_Shooting:
    dw Instruction_Zoa_SetXSpeedTableIndexTo4 
    dw $0040 
    dw Spritemap_Zoa_6 
    dw Instruction_Zoa_SetXSpeedTableIndexTo8 
    dw $0008 
    dw Spritemap_Zoa_7 
    dw Instruction_Zoa_SetXSpeedTableIndexToC 
    dw $0030 
    dw Spritemap_Zoa_8 
    dw Instruction_Common_GotoY 
    dw InstList_Zoa_FacingRight_Shooting 

InstList_Zoa_FacingRight_Rising:
    dw $0004 
    dw Spritemap_Zoa_A 
    dw $0004 
    dw Spritemap_Zoa_9 
    dw $0004 
    dw Spritemap_Zoa_B 
    dw Instruction_Common_GotoY 
    dw InstList_Zoa_FacingRight_Rising 

InstListPointers_Zoa:
    dw InstList_Zoa_FacingLeft_Shooting 
    dw InstList_Zoa_FacingLeft_Rising 
    dw InstList_Zoa_FacingRight_Shooting 
    dw InstList_Zoa_FacingRight_Rising 

ZoaXSpeedTable_speed:
    dw $0000 

ZoaXSpeedTable_subSpeed:
    dw $0000,$0000,$8000,$0000,$A000,$0002,$0000,$0000 
    dw $0000 

Instruction_Zoa_SetXSpeedTableIndexTo4:
    LDX.W $0E54 
    LDA.W #$0004 
    STA.L $7E7800,X 
    RTL 


Instruction_Zoa_SetXSpeedTableIndexTo8:
    LDX.W $0E54 
    LDA.W #$0008 
    STA.L $7E7800,X 
    RTL 


Instruction_Zoa_SetXSpeedTableIndexToC:
    LDX.W $0E54 
    LDA.W #$000C 
    STA.L $7E7800,X 
    RTL 


InitAI_Zoa:
    LDX.W $0E54 
    LDA.W #Function_Zoa_WaitForSamusToGetNear 
    STA.W $0FB4,X 
    LDA.W #$0000 
    STA.W $0FAE,X 
    STA.W $0FB0,X 
    STA.L $7E7800,X 
    LDA.W #InstList_Zoa_FacingLeft_Shooting 
    STA.W $0F92,X 
    LDA.W $0F86,X 
    ORA.W #$0100 
    STA.W $0F86,X 
    LDA.W $0F7A,X 
    STA.W $0FAA,X 
    LDA.W $0F7E,X 
    STA.W $0FAC,X 
    RTL 


MainAI_Zoa:
    LDX.W $0E54 
    JMP.W ($0FB4,X) 


Function_Zoa_WaitForSamusToGetNear:
    LDX.W $0E54 
    LDA.W #$0080 
    JSL.L IsSamusWithinAPixelColumnsOfEnemy 
    BEQ .return 
    LDY.W #$0001 
    JSL.L Get_SamusX_minus_EnemyX 
    BMI .keepLeft 
    LDY.W #$0003 

.keepLeft:
    TYA 
    STA.W $0FAE,X 
    JSR.W SetZoaInstList 
    LDA.W #Function_Zoa_Rising 
    STA.W $0FB4,X 

.return:
    RTL 


Function_Zoa_Rising:
    LDA.W $0F86,X 
    AND.W #$FEFF 
    STA.W $0F86,X 
    JSL.L Get_SamusY_minus_EnemyY 
    BMI .rising 
    DEC.W $0FAE,X 
    JSR.W SetZoaInstList 
    STZ.W $0FB2,X 
    LDA.W #Function_Zoa_Shooting 
    STA.W $0FB4,X 
    RTL 


.rising:
    LDA.W #$0000 
    STA.B $14 
    LDA.W #$8000 
    STA.B $12 
    JSL.L MoveEnemyY_minus_12_14 
    RTL 


Function_Zoa_Shooting:
    LDA.W $0FAE,X 
    BEQ .right 
    LDA.L $7E7800,X 
    TAY 
    LDA.W ZoaXSpeedTable_speed,Y 
    STA.B $14 
    LDA.W ZoaXSpeedTable_subSpeed,Y 
    STA.B $12 
    JSL.L MoveEnemyX_plus_12_14 
    JSL.L CheckIfEnemyCenterIsOnScreen 
    BNE .offScreen 
    JSR.W SetZoaInstList 
    RTL 


.right:
    LDA.L $7E7800,X 
    TAY 
    LDA.W ZoaXSpeedTable_speed,Y 
    STA.B $14 
    LDA.W ZoaXSpeedTable_subSpeed,Y 
    STA.B $12 
    JSL.L MoveEnemyX_minus_12_14 
    JSL.L CheckIfEnemyCenterIsOnScreen 
    BNE .offScreen 
    JSR.W SetZoaInstList 
    RTL 


.offScreen:
    LDA.W $0F86,X 
    ORA.W #$0100 
    STA.W $0F86,X 
    LDA.W $0FAA,X 
    STA.W $0F7A,X 
    LDA.W $0FAC,X 
    STA.W $0F7E,X 
    STZ.W $0FAE,X 
    JSR.W SetZoaInstList 
    LDA.W #Function_Zoa_WaitForSamusToGetNear 
    STA.W $0FB4,X 
    RTL 


SetZoaInstList:
    LDX.W $0E54 
    LDA.W $0FAE,X 
    CMP.W $0FB0,X 
    BEQ .return 
    STA.W $0FB0,X 
    ASL A 
    TAY 
    LDA.W InstListPointers_Zoa,Y 
    STA.W $0F92,X 
    LDA.W #$0001 
    STA.W $0F94,X 
    STZ.W $0F90,X 

.return:
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_GetEnemyIndex_A3B557:
    LDX.W $0E54 
    RTL 
endif ; !FEATURE_KEEP_UNREFERENCED


if !FEATURE_KEEP_UNREFERENCED
UNUSED_GetEnemyIndex_A3B55B:
    LDX.W $0E54 
    RTL 
endif ; !FEATURE_KEEP_UNREFERENCED


Spritemap_Zoa_0:
    dw $0001,$81F8 
    db $F8 
    dw $2100 

Spritemap_Zoa_1:
    dw $0001,$81F8 
    db $F8 
    dw $2102 

Spritemap_Zoa_2:
    dw $0001,$81F8 
    db $F8 
    dw $2104 

Spritemap_Zoa_3:
    dw $0001,$81F8 
    db $F8 
    dw $2106 

Spritemap_Zoa_4:
    dw $0001,$81F8 
    db $F8 
    dw $2108 

Spritemap_Zoa_5:
    dw $0001,$81F8 
    db $F8 
    dw $210A 

Spritemap_Zoa_6:
    dw $0001,$81F8 
    db $F8 
    dw $6100 

Spritemap_Zoa_7:
    dw $0001,$81F8 
    db $F8 
    dw $6102 

Spritemap_Zoa_8:
    dw $0001,$81F8 
    db $F8 
    dw $6104 

Spritemap_Zoa_9:
    dw $0001,$81F8 
    db $F8 
    dw $6106 

Spritemap_Zoa_A:
    dw $0001,$81F8 
    db $F8 
    dw $6108 

Spritemap_Zoa_B:
    dw $0001,$81F8 
    db $F8 
    dw $610A 

Palette_Viola:
    dw $3800,$7FFF,$56E0,$3180,$18C0,$6BC0,$5EC0,$4A20 
    dw $35A0,$241F,$1C17,$142F,$0C47,$03E0,$02A0,$0140 

InstList_Viola_UpsideDown:
    dw Instruction_Crawlers_FunctionInY 
    dw Function_Crawlers_CrawlingHorizontally 
    dw Instruction_Common_GotoY 
    dw InstList_Viola_Normal 

InstList_Viola_UpsideUp:
    dw Instruction_Crawlers_FunctionInY 
    dw Function_Crawlers_CrawlingHorizontally 
    dw Instruction_Common_GotoY 
    dw InstList_Viola_Normal 

InstList_Viola_UpsideRight:
    dw Instruction_Crawlers_FunctionInY 
    dw Function_Crawlers_CrawlingVertically 
    dw Instruction_Common_GotoY 
    dw InstList_Viola_Normal 

InstList_Viola_UpsideLeft:
    dw Instruction_Crawlers_FunctionInY 
    dw Function_Crawlers_CrawlingVertically 

InstList_Viola_Normal:
    dw $000A 
    dw Spritemap_Viola_Normal_0 
    dw $000A 
    dw Spritemap_Viola_Normal_1 
    dw $000A 
    dw Spritemap_Viola_Normal_2 
    dw $000A 
    dw Spritemap_Viola_Normal_3 
    dw $000A 
    dw Spritemap_Viola_Normal_4 
    dw $000A 
    dw Spritemap_Viola_Normal_5 
    dw $000A 
    dw Spritemap_Viola_Normal_6 
    dw $000A 
    dw Spritemap_Viola_Normal_7 
    dw $000A 
    dw Spritemap_Viola_Normal_6 
    dw $000A 
    dw Spritemap_Viola_Normal_5 
    dw $000A 
    dw Spritemap_Viola_Normal_4 
    dw $000A 
    dw Spritemap_Viola_Normal_3 
    dw $000A 
    dw Spritemap_Viola_Normal_2 
    dw $000A 
    dw Spritemap_Viola_Normal_1 
    dw Instruction_Common_GotoY 
    dw InstList_Viola_Normal 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_Viola_XFlipped_A3B62B:
    dw $0006 
    dw UNUSED_Spritemap_Viola_XFlipped_A3B6C1 
    dw $0006 
    dw UNUSED_Spritemap_Viola_XFlipped_A3B6C8 
    dw $0006 
    dw UNUSED_Spritemap_Viola_XFlipped_A3B6CF 
    dw $0006 
    dw UNUSED_Spritemap_Viola_XFlipped_A3B6D6 
    dw $0006 
    dw UNUSED_Spritemap_Viola_XFlipped_A3B6DD 
    dw $0006 
    dw UNUSED_Spritemap_Viola_XFlipped_A3B6E4 
    dw $0006 
    dw UNUSED_Spritemap_Viola_XFlipped_A3B6EB 
    dw $0006 
    dw UNUSED_Spritemap_Viola_XFlipped_A3B6F2 
    dw $0006 
    dw UNUSED_Spritemap_Viola_XFlipped_A3B6EB 
    dw $0006 
    dw UNUSED_Spritemap_Viola_XFlipped_A3B6E4 
    dw $0006 
    dw UNUSED_Spritemap_Viola_XFlipped_A3B6DD 
    dw $0006 
    dw UNUSED_Spritemap_Viola_XFlipped_A3B6D6 
    dw $0006 
    dw UNUSED_Spritemap_Viola_XFlipped_A3B6CF 
    dw $0006 
    dw UNUSED_Spritemap_Viola_XFlipped_A3B6C8 
    dw Instruction_Common_GotoY 
    dw UNUSED_InstList_Viola_XFlipped_A3B62B 
endif ; !FEATURE_KEEP_UNREFERENCED

InitialInstListPointers_Viola:
    dw InstList_Viola_UpsideRight 
    dw InstList_Viola_UpsideLeft 
    dw InstList_Viola_UpsideDown 
    dw InstList_Viola_UpsideUp 

InitAI_Viola:
    LDX.W $0E54 
    LDA.W #$0006 
    STA.W $0FB6,X 
    LDA.W $0F86,X 
    AND.W #$0003 
    ASL A 
    TAY 
    LDA.W InitialInstListPointers_Viola,Y 
    STA.W $0F92,X 
    JMP.W InitAI_Crawlers_Common 


Spritemap_Viola_Normal_0:
    dw $0001,$81F8 
    db $F8 
    dw $2100 

Spritemap_Viola_Normal_1:
    dw $0001,$81F8 
    db $F8 
    dw $2102 

Spritemap_Viola_Normal_2:
    dw $0001,$81F8 
    db $F8 
    dw $2104 

Spritemap_Viola_Normal_3:
    dw $0001,$81F8 
    db $F8 
    dw $2106 

Spritemap_Viola_Normal_4:
    dw $0001,$81F8 
    db $F8 
    dw $2108 

Spritemap_Viola_Normal_5:
    dw $0001,$81F8 
    db $F8 
    dw $210A 

Spritemap_Viola_Normal_6:
    dw $0001,$81F8 
    db $F8 
    dw $210C 

Spritemap_Viola_Normal_7:
    dw $0001,$81F8 
    db $F8 
    dw $210E 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Viola_XFlipped_A3B6C1:
    dw $0001,$81F8 
    db $F8 
    dw $6100 

UNUSED_Spritemap_Viola_XFlipped_A3B6C8:
    dw $0001,$81F8 
    db $F8 
    dw $6102 

UNUSED_Spritemap_Viola_XFlipped_A3B6CF:
    dw $0001,$81F8 
    db $F8 
    dw $6104 

UNUSED_Spritemap_Viola_XFlipped_A3B6D6:
    dw $0001,$81F8 
    db $F8 
    dw $6106 

UNUSED_Spritemap_Viola_XFlipped_A3B6DD:
    dw $0001,$81F8 
    db $F8 
    dw $6108 

UNUSED_Spritemap_Viola_XFlipped_A3B6E4:
    dw $0001,$81F8 
    db $F8 
    dw $610A 

UNUSED_Spritemap_Viola_XFlipped_A3B6EB:
    dw $0001,$81F8 
    db $F8 
    dw $610C 

UNUSED_Spritemap_Viola_XFlipped_A3B6F2:
    dw $0001,$81F8 
    db $F8 
    dw $610E 

UNUSED_CrashIfEnemyInitParamIsNonZero_A3B6F9:
    LDX.W $0E54 
    LDA.W $0F92,X 

.crash:
    BNE .crash 
    RTL 
endif ; !FEATURE_KEEP_UNREFERENCED


Palette_Bang:
    dw $3800,$013F,$00D8,$0091,$002B,$7F12,$5B13,$2B15 
    dw $0318,$6A03,$5DA2,$40E1,$2C60,$2020,$7FFF,$0842 

InstListPointers_Bang:
    dw InstList_Bang_Core_Growth0_Idling 
    dw InstList_Bang_Core_Growth0_Growing 
    dw InstList_Bang_Core_Growth1_Idling 
    dw InstList_Bang_Core_Growth1_Growing 
    dw InstList_Bang_Core_Growth2_Idling 
    dw InstList_Bang_Core_Growth2_Growing 
    dw InstList_Bang_Core_Growth3_Idling 
    dw InstList_Bang_Core_Growth3_Growing 
    dw InstList_Bang_Core_Growth4_Idling 
    dw InstList_Bang_Core_Growth4_Growing 
    dw InstList_Bang_Electricity_None 
    dw InstList_Bang_Electricity_None 
    dw InstList_Bang_Electricity_None 
    dw InstList_Bang_Electricity_None 
    dw InstList_Bang_Electricity_None 
    dw InstList_Bang_Electricity_None 
    dw InstList_Bang_Electricity_None 
    dw InstList_Bang_Electricity_Growth3_4_Growing 
    dw InstList_Bang_Electricity_None 
    dw InstList_Bang_Electricity_Growth3_4_Growing 
    dw InstList_Bang_Shell_Growth0_Idling 
    dw InstList_Bang_Shell_Growth0_Growing 
    dw InstList_Bang_Shell_Growth1_Idling 
    dw InstList_Bang_Shell_Growth1_Growing 
    dw InstList_Bang_Shell_Growth2_Idling 
    dw InstList_Bang_Shell_Growth2_Growing 
    dw InstList_Bang_Shell_Growth3_Idling 
    dw InstList_Bang_Shell_Growth3_Growing 
    dw InstList_Bang_Shell_Growth4_Idling 
    dw InstList_Bang_Shell_Growth4_Growing 

InstList_Bang_Core_Growth0_Idling:
    dw $0020 
    dw Spritemap_Bang_Growth0_Idling_0 
    dw $000D 
    dw Spritemap_Bang_Growth0_Idling_2 
    dw $0010 
    dw Spritemap_Bang_Growth0_Idling_4 
    dw $000D 
    dw Spritemap_Bang_Growth0_Idling_2 
    dw Instruction_Common_GotoY 
    dw InstList_Bang_Core_Growth0_Idling 

InstList_Bang_Core_Growth0_Growing:
    dw Instruction_Bang_PlayAcquiredSuitSFX 
    dw $0004 
    dw Spritemap_Bang_Growth0_Growing_0 
    dw $0008 
    dw Spritemap_Bang_Growth0_Growing_1 
    dw $0004 
    dw Spritemap_Bang_Growth0_Growing_0 
    dw $0002 
    dw Spritemap_Bang_Growth0_Growing_2 
    dw $0004 
    dw Spritemap_Bang_Growth0_Growing_4 
    dw $0010 
    dw Spritemap_Bang_Growth0_Growing_6 
    dw Instruction_Bang_SetFinishedGrowingFlagTo1 
    dw Instruction_Common_Sleep 

InstList_Bang_Core_Growth1_Idling:
    dw $0010 
    dw Spritemap_Bang_Growth1_Idling_0 
    dw $0008 
    dw Spritemap_Bang_Growth1_Idling_2 
    dw $000D 
    dw Spritemap_Bang_Growth1_Idling_4 
    dw $0008 
    dw Spritemap_Bang_Growth1_Idling_2 
    dw Instruction_Common_GotoY 
    dw InstList_Bang_Core_Growth1_Idling 

InstList_Bang_Core_Growth1_Growing:
    dw Instruction_Bang_PlayAcquiredSuitSFX 
    dw $0004 
    dw Spritemap_Bang_Growth1_Growing_0 
    dw $0008 
    dw Spritemap_Bang_Growth1_Growing_1 
    dw $0004 
    dw Spritemap_Bang_Growth1_Growing_0 
    dw $0002 
    dw Spritemap_Bang_Growth1_Growing_2 
    dw $0004 
    dw Spritemap_Bang_Growth1_Growing_4 
    dw $0010 
    dw Spritemap_Bang_Growth1_Growing_6 
    dw Instruction_Bang_SetFinishedGrowingFlagTo1 
    dw Instruction_Common_Sleep 

InstList_Bang_Core_Growth2_Idling:
    dw $000C 
    dw Spritemap_Bang_Growth2_Idling_0 
    dw $0006 
    dw Spritemap_Bang_Growth2_Idling_2 
    dw $0004 
    dw Spritemap_Bang_Growth2_Idling_4 
    dw $0006 
    dw Spritemap_Bang_Growth2_Idling_2 
    dw Instruction_Common_GotoY 
    dw InstList_Bang_Core_Growth2_Idling 

InstList_Bang_Core_Growth2_Growing:
    dw Instruction_Bang_PlayAcquiredSuitSFX 
    dw $0004 
    dw Spritemap_Bang_Growth2_Growing_0 
    dw $0008 
    dw Spritemap_Bang_Growth2_Growing_2 
    dw $0004 
    dw Spritemap_Bang_Growth2_Growing_0 
    dw $0002 
    dw Spritemap_Bang_Growth2_Growing_4 
    dw $0004 
    dw Spritemap_Bang_Growth2_Growing_6 
    dw $0010 
    dw Spritemap_Bang_Growth2_Growing_8 
    dw Instruction_Bang_SetFinishedGrowingFlagTo1 
    dw Instruction_Common_Sleep 

InstList_Bang_Core_Growth3_Idling:
    dw $0008 
    dw Spritemap_Bang_Growth3_Idling_0 
    dw $0003 
    dw Spritemap_Bang_Growth3_Idling_2 
    dw $0002 
    dw Spritemap_Bang_Growth3_Idling_4 
    dw $0003 
    dw Spritemap_Bang_Growth3_Idling_2 
    dw $0008 
    dw Spritemap_Bang_Growth3_Idling_6 
    dw $0003 
    dw Spritemap_Bang_Growth3_Idling_8 
    dw $0002 
    dw Spritemap_Bang_Growth3_Idling_A 
    dw $0003 
    dw Spritemap_Bang_Growth3_Idling_8 
    dw $0008 
    dw Spritemap_Bang_Growth3_Idling_0 
    dw $0003 
    dw Spritemap_Bang_Growth3_Idling_2 
    dw $0002 
    dw Spritemap_Bang_Growth3_Idling_4 
    dw $0003 
    dw Spritemap_Bang_Growth3_Idling_2 
    dw $0008 
    dw Spritemap_Bang_Growth3_Idling_C 
    dw $0003 
    dw Spritemap_Bang_Growth3_Idling_E 
    dw $0002 
    dw Spritemap_Bang_Growth3_Idling_10 
    dw $0003 
    dw Spritemap_Bang_Growth3_Idling_E 
    dw Instruction_Common_GotoY 
    dw InstList_Bang_Core_Growth3_Idling 

InstList_Bang_Core_Growth3_Growing:
    dw Instruction_Bang_PlayAcquiredSuitSFX 
    dw $0004 
    dw Spritemap_Bang_Growth3_Growing_0 
    dw $0008 
    dw Spritemap_Bang_Growth3_Growing_2 
    dw $0004 
    dw Spritemap_Bang_Growth3_Growing_0 
    dw $0002 
    dw Spritemap_Bang_Growth3_Growing_4 
    dw $0004 
    dw Spritemap_Bang_Growth3_Growing_6 
    dw $0004 
    dw Spritemap_Bang_Growth3_Growing_8 
    dw $0010 
    dw Spritemap_Bang_Growth3_Growing_A 
    dw Instruction_Bang_SetFinishedGrowingFlagTo1 
    dw Instruction_Common_Sleep 

InstList_Bang_Core_Growth4_Idling:
    dw $0006 
    dw Spritemap_Bang_Growth4_Idling_0 
    dw $0002 
    dw Spritemap_Bang_Growth4_Idling_2 
    dw $0001 
    dw Spritemap_Bang_Growth4_Idling_4 
    dw $0002 
    dw Spritemap_Bang_Growth4_Idling_2 
    dw $0006 
    dw Spritemap_Bang_Growth4_Idling_6 
    dw $0001 
    dw Spritemap_Bang_Growth4_Idling_4 
    dw $0002 
    dw Spritemap_Bang_Growth4_Idling_2 
    dw $0006 
    dw Spritemap_Bang_Growth4_Idling_8 
    dw $0002 
    dw Spritemap_Bang_Growth4_Idling_A 
    dw $0001 
    dw Spritemap_Bang_Growth4_Idling_C 
    dw $0002 
    dw Spritemap_Bang_Growth4_Idling_A 
    dw Instruction_Common_GotoY 
    dw InstList_Bang_Core_Growth4_Idling 

InstList_Bang_Core_Growth4_Growing:
    dw Instruction_Bang_PlayAcquiredSuitSFX 
    dw $0004 
    dw Spritemap_Bang_Growth4_Growing_0 
    dw $0008 
    dw Spritemap_Bang_Growth4_Growing_2 
    dw $0004 
    dw Spritemap_Bang_Growth4_Growing_0 
    dw $0002 
    dw Spritemap_Bang_Growth4_Growing_4 
    dw $0004 
    dw Spritemap_Bang_Growth4_Growing_6 
    dw $0004 
    dw Spritemap_Bang_Growth4_Growing_8 
    dw $0010 
    dw Spritemap_Bang_Growth4_Growing_A 
    dw Instruction_Bang_SetFinishedGrowingFlagTo1 
    dw Instruction_Common_Sleep 

InstList_Bang_Shell_Growth0_Idling:
    dw $0020 
    dw Spritemap_Bang_Growth0_Idling_1 
    dw $000D 
    dw Spritemap_Bang_Growth0_Idling_3 
    dw $0010 
    dw Spritemap_Bang_Growth0_Idling_5 
    dw $000D 
    dw Spritemap_Bang_Growth0_Idling_3 
    dw Instruction_Common_GotoY 
    dw InstList_Bang_Shell_Growth0_Idling 

InstList_Bang_Shell_Growth0_Growing:
    dw Instruction_Bang_PlayAcquiredSuitSFX 
    dw $0004 
    dw Spritemap_CommonA3_Nothing 
    dw $0008 
    dw Spritemap_CommonA3_Nothing 
    dw $0004 
    dw Spritemap_CommonA3_Nothing 
    dw $0002 
    dw Spritemap_Bang_Growth0_Growing_3 
    dw $0004 
    dw Spritemap_Bang_Growth0_Growing_5 
    dw $0010 
    dw Spritemap_Bang_Growth0_Growing_7 
    dw Instruction_Bang_SetFinishedGrowingFlagTo1 
    dw Instruction_Common_Sleep 

InstList_Bang_Shell_Growth1_Idling:
    dw $0010 
    dw Spritemap_Bang_Growth1_Idling_1 
    dw $0008 
    dw Spritemap_Bang_Growth1_Idling_3 
    dw $000D 
    dw Spritemap_Bang_Growth1_Idling_5 
    dw $0008 
    dw Spritemap_Bang_Growth1_Idling_3 
    dw Instruction_Common_GotoY 
    dw InstList_Bang_Shell_Growth1_Idling 

InstList_Bang_Shell_Growth1_Growing:
    dw Instruction_Bang_PlayAcquiredSuitSFX 
    dw $0004 
    dw Spritemap_CommonA3_Nothing 
    dw $0008 
    dw Spritemap_CommonA3_Nothing 
    dw $0004 
    dw Spritemap_CommonA3_Nothing 
    dw $0002 
    dw Spritemap_Bang_Growth1_Growing_3 
    dw $0004 
    dw Spritemap_Bang_Growth1_Growing_5 
    dw $0010 
    dw Spritemap_Bang_Growth1_Growing_7 
    dw Instruction_Bang_SetFinishedGrowingFlagTo1 
    dw Instruction_Common_Sleep 

InstList_Bang_Shell_Growth2_Idling:
    dw $000C 
    dw Spritemap_Bang_Growth2_Idling_1 
    dw $0006 
    dw Spritemap_Bang_Growth2_Idling_3 
    dw $0004 
    dw Spritemap_Bang_Growth2_Idling_5 
    dw $0006 
    dw Spritemap_Bang_Growth2_Idling_3 
    dw Instruction_Common_GotoY 
    dw InstList_Bang_Shell_Growth2_Idling 

InstList_Bang_Shell_Growth2_Growing:
    dw Instruction_Bang_PlayAcquiredSuitSFX 
    dw $0004 
    dw Spritemap_Bang_Growth2_Growing_1 
    dw $0008 
    dw Spritemap_Bang_Growth2_Growing_3 
    dw $0004 
    dw Spritemap_Bang_Growth2_Growing_1 
    dw $0002 
    dw Spritemap_Bang_Growth2_Growing_5 
    dw $0004 
    dw Spritemap_Bang_Growth2_Growing_7 
    dw $0010 
    dw Spritemap_Bang_Growth2_Growing_9 
    dw Instruction_Bang_SetFinishedGrowingFlagTo1 
    dw Instruction_Common_Sleep 

InstList_Bang_Shell_Growth3_Idling:
    dw $0008 
    dw Spritemap_Bang_Growth3_Idling_1 
    dw $0003 
    dw Spritemap_Bang_Growth3_Idling_3 
    dw $0002 
    dw Spritemap_Bang_Growth3_Idling_5 
    dw $0003 
    dw Spritemap_Bang_Growth3_Idling_3 
    dw $0008 
    dw Spritemap_Bang_Growth3_Idling_7 
    dw $0003 
    dw Spritemap_Bang_Growth3_Idling_9 
    dw $0002 
    dw Spritemap_Bang_Growth3_Idling_B 
    dw $0003 
    dw Spritemap_Bang_Growth3_Idling_9 
    dw $0008 
    dw Spritemap_Bang_Growth3_Idling_1 
    dw $0003 
    dw Spritemap_Bang_Growth3_Idling_3 
    dw $0002 
    dw Spritemap_Bang_Growth3_Idling_5 
    dw $0003 
    dw Spritemap_Bang_Growth3_Idling_3 
    dw $0008 
    dw Spritemap_Bang_Growth3_Idling_D 
    dw $0003 
    dw Spritemap_Bang_Growth3_Idling_F 
    dw $0002 
    dw Spritemap_Bang_Growth3_Idling_11 
    dw $0003 
    dw Spritemap_Bang_Growth3_Idling_F 
    dw Instruction_Common_GotoY 
    dw InstList_Bang_Shell_Growth3_Idling 

InstList_Bang_Shell_Growth3_Growing:
    dw Instruction_Bang_PlayAcquiredSuitSFX 
    dw $0004 
    dw Spritemap_Bang_Growth3_Growing_1 
    dw $0008 
    dw Spritemap_Bang_Growth3_Growing_3 
    dw $0004 
    dw Spritemap_Bang_Growth3_Growing_1 
    dw $0002 
    dw Spritemap_Bang_Growth3_Growing_5 
    dw $0004 
    dw Spritemap_Bang_Growth3_Growing_7 
    dw $0004 
    dw Spritemap_Bang_Growth3_Growing_9 
    dw $0010 
    dw Spritemap_Bang_Growth3_Growing_B 
    dw Instruction_Bang_SetFinishedGrowingFlagTo1 
    dw Instruction_Common_Sleep 

InstList_Bang_Shell_Growth4_Idling:
    dw $0006 
    dw Spritemap_Bang_Growth4_Idling_1 
    dw $0002 
    dw Spritemap_Bang_Growth4_Idling_3 
    dw $0001 
    dw Spritemap_Bang_Growth4_Idling_5 
    dw $0002 
    dw Spritemap_Bang_Growth4_Idling_3 
    dw $0006 
    dw Spritemap_Bang_Growth4_Idling_7 
    dw $0001 
    dw Spritemap_Bang_Growth4_Idling_5 
    dw $0002 
    dw Spritemap_Bang_Growth4_Idling_3 
    dw $0006 
    dw Spritemap_Bang_Growth4_Idling_9 
    dw $0002 
    dw Spritemap_Bang_Growth4_Idling_B 
    dw $0001 
    dw Spritemap_Bang_Growth4_Idling_D 
    dw $0002 
    dw Spritemap_Bang_Growth4_Idling_B 
    dw Instruction_Common_GotoY 
    dw InstList_Bang_Shell_Growth4_Idling 

InstList_Bang_Shell_Growth4_Growing:
    dw Instruction_Bang_PlayAcquiredSuitSFX 
    dw $0004 
    dw Spritemap_Bang_Growth4_Growing_1 
    dw $0008 
    dw Spritemap_Bang_Growth4_Growing_3 
    dw $0004 
    dw Spritemap_Bang_Growth4_Growing_1 
    dw $0002 
    dw Spritemap_Bang_Growth4_Growing_5 
    dw $0004 
    dw Spritemap_Bang_Growth4_Growing_7 
    dw $0004 
    dw Spritemap_Bang_Growth4_Growing_9 
    dw $0010 
    dw Spritemap_CommonA3_Nothing 
    dw Instruction_Bang_SetFinishedGrowingFlagTo1 
    dw Instruction_Common_Sleep 

InstList_Bang_Electricity_None:
    dw $0001 
    dw Spritemap_CommonA3_Nothing 
    dw Instruction_Common_Sleep 

InstList_Bang_Electricity_Growth3_4_Growing:
    dw $0002 
    dw Spritemap_Bang_Electricity_Growth3_4_Growing_0 
    dw $0003 
    dw Spritemap_Bang_Electricity_Growth3_4_Growing_1 
    dw $0004 
    dw Spritemap_Bang_Electricity_Growth3_4_Growing_2 
    dw $0002 
    dw Spritemap_CommonA3_Nothing 
    dw $0004 
    dw Spritemap_Bang_Electricity_Growth3_4_Growing_3 
    dw $0002 
    dw Spritemap_Bang_Electricity_Growth3_4_Growing_4 
    dw $0003 
    dw Spritemap_Bang_Electricity_Growth3_4_Growing_5 
    dw $0002 
    dw Spritemap_Bang_Electricity_Growth3_4_Growing_6 
    dw $0004 
    dw Spritemap_Bang_Electricity_Growth3_4_Growing_7 
    dw $0003 
    dw Spritemap_Bang_Electricity_Growth3_4_Growing_8 
    dw $000A 
    dw Spritemap_CommonA3_Nothing 
    dw $0003 
    dw Spritemap_Bang_Electricity_Growth3_4_Growing_9 
    dw $0002 
    dw Spritemap_Bang_Electricity_Growth3_4_Growing_A 
    dw $0004 
    dw Spritemap_Bang_Electricity_Growth3_4_Growing_B 
    dw Instruction_Common_GotoY 
    dw InstList_Bang_Electricity_Growth3_4_Growing 

if !FEATURE_KEEP_UNREFERENCED
UNSUED_InstList_Bang_Electricity_Growing_A3BA3C:
    dw $0002 
    dw UNUSED_Spritemap_Bang_Electricity_A3C5AE 
    dw $0003 
    dw UNUSED_Spritemap_Bang_Electricity_A3C5BA 
    dw $0004 
    dw UNUSED_Spritemap_Bang_Electricity_A3C5C6 
    dw $0002 
    dw Spritemap_CommonA3_Nothing 
    dw $0004 
    dw UNUSED_Spritemap_Bang_Electricity_A3C5D2 
    dw $0002 
    dw UNUSED_Spritemap_Bang_Electricity_A3C5DE 
    dw $0003 
    dw UNUSED_Spritemap_Bang_Electricity_A3C5EA 
    dw $0002 
    dw UNUSED_Spritemap_Bang_Electricity_A3C5F6 
    dw $0004 
    dw UNUSED_Spritemap_Bang_Electricity_A3C602 
    dw $0003 
    dw UNUSED_Spritemap_Bang_Electricity_A3C60E 
    dw $000A 
    dw Spritemap_CommonA3_Nothing 
    dw $0003 
    dw UNUSED_Spritemap_Bang_Electricity_A3C61A 
    dw $0002 
    dw UNUSED_Spritemap_Bang_Electricity_A3C626 
    dw $0004 
    dw UNUSED_Spritemap_Bang_Electricity_A3C632 
    dw Instruction_Common_GotoY 
    dw UNSUED_InstList_Bang_Electricity_Growing_A3BA3C 
endif ; !FEATURE_KEEP_UNREFERENCED

Instruction_Bang_PlayAcquiredSuitSFX:
    PHY 
    PHX 
    LDA.W #$0056 
    JSL.L QueueSound_Lib2_Max6 
    PLX 
    PLY 
    RTL 


BangMaxSpeeds:
    dw $02FF,$03FF,$04FF,$05FF,$06FF,$07FF,$08FF,$09FF 

BangAngles:
    dw $00C0,$00E0,$0000,$0020,$0040,$0040,$0060,$0080 
    dw $00A0,$00C0 

Instruction_Bang_SetFinishedGrowingFlagTo1:
    LDX.W $0E54 
    LDA.W #$0001 
    STA.L $7E8004,X 
    RTL 


InitAI_Bang:
    LDX.W $0E54 
    LDA.W $0F96,X 
    STA.W $0FAA,X 
    LDA.W $0F86,X 
    ORA.W #$1000 
    STA.W $0F86,X 
    LDA.W #Function_Bang_Movement_MovementDelay 
    STA.W $0FB2,X 
    LDA.W #$0010 
    STA.L $7E7800,X 
    LDA.W #$0000 
    STA.L $7E7802,X 
    STA.L $7E7804,X 
    STA.L $7E8000,X 
    STA.L $7E8002,X 
    STA.L $7E8004,X 
    LDA.W $0FB6,X 
    AND.W #$00FF 
    ASL A 
    TAY 
    LDA.W BangMaxSpeeds,Y 
    STA.L $7E7816,X 
    LDA.W $0FB7,X 
    AND.W #$00FF 
    ASL #2
    TAY 
    LDA.W BangAccelerationIntervalTimeResetValues_accel,Y 
    STA.L $7E7818,X 
    STA.L $7E781A,X 
    LDA.W BangAccelerationIntervalTimeResetValues_decel,Y 
    STA.L $7E781C,X 
    LDA.W $0F92,X 
    BNE .idling 
    LDA.W #Function_Bang_Movement_GetEnemyIndex 
    STA.W $0FB2,X 

.idling:
    LDA.W #InstList_Bang_Core_Growth0_Idling 
    STA.W $0F92,X 
    RTL 


MainAI_Bang:
    LDX.W $0E54 
    JMP.W ($0FB4,X) 


BangAI_Electricity:
    LDX.W $0E54 
    LDA.L $7E8040,X 
    CLC 
    ADC.W #$000A 
    STA.L $7E8000,X 
    JSR.W SetBangInstList 
    LDX.W $0E54 
    LDA.W $0F86,X 
    ORA.W #$0400 
    STA.W $0F86,X 
    RTL 


BangAI_Shell:
    LDX.W $0E54 
    LDA.L $7E7FC0,X 
    CLC 
    ADC.W #$0014 
    STA.L $7E8000,X 
    JSR.W SetBangInstList 
    LDA.W $0F86,X 
    ORA.W #$0400 
    STA.W $0F86,X 
    RTL 


BangAI_Core:
    LDX.W $0E54 
    JSR.W ExecuteBangeMovementFunction 
    LDA.W $0F7A,X 
    STA.W $0F3A,X 
    STA.W $0FBA,X 
    LDA.W $0F7E,X 
    STA.W $0F3E,X 
    STA.W $0FBE,X 
    LDY.W $0FAA,X 
    LDA.L $7E8000,X 
    AND.W #$0001 
    BEQ + 
    LDY.W #$0C00 

  + TYA 
    STA.W $0F96,X 
    JSR.W SetBangInstList 
    LDA.L $7E8004,X 
    BNE + 
    RTL 


  + LDA.W #$0000 
    STA.L $7E8004,X 
    LDA.L $7E8000,X 
    CMP.W #$0009 
    BNE + 
    LDA.W #$0010 
    STA.W $0FA0,X 
    LDA.W $0F86,X 
    ORA.W #$0400 
    STA.W $0F86,X 
    JSL.L DetermineDirectionOfSamusFromEnemy 
    JSR.W FireChargedBeamAtSamus 
    JSL.L EnemyDeath 
    LDX.W $0E54 
    LDA.W $0FC6,X 
    ORA.W #$0200 
    STA.W $0FC6,X 
    LDA.W $0F46,X 
    ORA.W #$0200 
    STA.W $0F46,X 
    RTL 


  + LDX.W $0E54 
    LDA.L $7E8000,X 
    INC A 
    STA.L $7E8000,X 
    JSR.W SetBangInstList 
    RTL 


FireChargedBeamAtSamus:
    STA.W $1872 
    LDX.W $0E54 
    LDA.W $0CCE 
    CMP.W #$0005 
    BPL .fail 
    LDA.W #$0000 
    TAY 

.loop:
    LDA.W $0C2C,Y 
    BEQ .zeroDamage 
    INY #2
    BRA .loop 


.zeroDamage:
    LDA.W $0F7A,X 
    STA.W $0B64,Y 
    LDA.W $0F7E,X 
    STA.W $0B78,Y 
    LDA.W $1872 
    STA.W $0C04,Y 
    LDA.W $09A6 
    AND.W #$000F 
    ORA.W #$0010 
    STA.W $0C18,Y 
    INC.W $0CCE 
    STY.B $14 
    JSL.L ProjectileReflection 
    LDA.W $0FB0,X 
    STA.W $0C2C,Y 
    LDA.W $0C18,Y 
    AND.W #$000F 
    ASL A 
    TAX 
    LDA.W .beamTypes,X 
    JSL.L QueueSound_Lib1_Max6 
    LDA.W #$0000 
    RTS 


.fail:
    LDA.W #$0001 
    RTS 


.beamTypes:
    dw $0017,$0019,$0018,$001A,$001E,$001C,$001D,$001F 
    dw $0022,$0020,$0021,$0000,$0000,$0000,$0000,$0000 

BangAccelerationIntervalTimeResetValues_accel:
    dw $0003 

BangAccelerationIntervalTimeResetValues_decel:
    dw $0001,$0004,$0001,$0005,$0002,$0006,$0002,$0007 
    dw $0002,$0008,$0003,$0009,$0003,$000A,$0004,$000B 
    dw $0004,$000C,$0005,$000D,$0005,$000E,$0006,$000F 
    dw $0006 

ExecuteBangeMovementFunction:
    LDX.W $0E54 
    JSR.W ($0FB2,X) 
    RTS 


Function_Bang_Movement_MovementDelay:
    LDX.W $0E54 
    LDA.L $7E7800,X 
    DEC A 
    STA.L $7E7800,X 
    BNE .return 
    LDA.W #$0010 
    STA.L $7E7800,X 
    LDA.W #Function_Bang_Movement_TargetSamus 
    STA.W $0FB2,X 

.return:
    RTS 


Function_Bang_Movement_GetEnemyIndex:
    LDX.W $0E54 
    RTS 


Function_Bang_Movement_TargetSamus:
    LDX.W $0E54 
    JSL.L CalculateAngleOfSamusFromEnemy 
    SEC 
    SBC.W #$0040 
    AND.W #$00FF 
    STA.L $7E7802,X 
    LDA.W #Function_Bang_Movement_Accelerating 
    STA.W $0FB2,X 
    LDA.W #$0000 
    STA.L $7E780E,X 
    STA.L $7E7810,X 
    STA.L $7E7812,X 
    STA.L $7E7814,X 
    RTS 


TriggerBangDecelerationIfTooFarOffTarget:
    LDX.W $0E54 
    JSL.L CalculateAngleOfSamusFromEnemy 
    SEC 
    SBC.W #$0040 
    AND.W #$00FF 
    STA.L $7E7804,X 
    SEC 
    SBC.L $7E7802,X 
    JSL.L Sign_Extend_A 
    JSL.L NegateA_A0B067 
    CMP.W #$0030 
    BMI .return 
    LDA.W #Function_Bang_Movement_Decelerating 
    STA.W $0FB2,X 

.return:
    RTS 


Function_Bang_Movement_Accelerating:
    LDX.W $0E54 
    JSR.W BangXMovement 
    JSR.W BangYMovement 
    JSR.W AccelerateBang 
    JSR.W TriggerBangDecelerationIfTooFarOffTarget 
    RTS 


Function_Bang_Movement_Decelerating:
    LDX.W $0E54 
    JSR.W BangXMovement 
    JSR.W BangYMovement 
    JSR.W DecelerateBang 
    LDA.L $7E7814,X 
    BNE .delay 
    BMI .delay 
    LDA.L $7E7812,X 
    BEQ .delay 
    BPL .return 

.delay:
    LDA.W #Function_Bang_Movement_MovementDelay 
    STA.W $0FB2,X 

.return:
    RTS 


AccelerateBang:
    LDX.W $0E54 
    LDA.L $7E7818,X 
    DEC A 
    STA.L $7E7818,X 
    BPL .return 
    LDA.L $7E781A,X 
    STA.L $7E7818,X 
    LDA.L $7E7814,X 
    CMP.L $7E7816,X 
    BPL .return 
    LDA.L $7E7812,X 
    CLC 
    ADC.W #$0016 
    STA.L $7E7812,X 
    LDA.L $7E7814,X 
    CLC 
    ADC.L $7E7812,X 
    STA.L $7E7814,X 

.return:
    RTS 


DecelerateBang:
    LDX.W $0E54 
    LDA.L $7E7818,X 
    DEC A 
    STA.L $7E7818,X 
    BPL .return 
    LDA.L $7E781C,X 
    STA.L $7E7818,X 
    LDA.L $7E7812,X 
    SEC 
    SBC.W #$0016 
    STA.L $7E7812,X 
    LDA.L $7E7814,X 
    SEC 
    SBC.L $7E7812,X 
    STA.L $7E7814,X 

.return:
    RTS 


BangXMovement:
    LDX.W $0E54 
    LDA.L $7E7802,X 
    PHX 
    CLC 
    ADC.W #$0040 
    AND.W #$00FF 
    ASL A 
    TAX 
    LDA.L SineCosineTables_16bitSine,X 
    STA.B $12 
    PLX 
    LDA.B $12 
    BPL + 
    LDA.W #$0001 
    STA.L $7E780E,X 

  + LDA.B $12 
    JSL.L NegateA_A0B067 
    AND.W #$FF00 
    XBA 
    STA.B $16 
    LDA.L $7E7814,X 
    STA.B $18 
    JSR.W UnsignedMultiplication_24bit_A3BE7B 
    LDA.B $1C 
    STA.B $16 
    LDA.B $1E 
    STA.B $18 
    LDA.L $7E780E,X 
    BEQ + 
    JSR.W StrugglingWithMultiWordNegation 
    LDA.B $1C 
    STA.B $16 
    LDA.B $1E 
    STA.B $18 

  + CLC 
    LDA.W $0F7C,X 
    ADC.B $16 
    STA.W $0F7C,X 
    LDA.W $0F7A,X 
    ADC.B $18 
    STA.W $0F7A,X 
    RTS 


BangYMovement:
    LDX.W $0E54 
    LDA.L $7E7802,X 
    PHX 
    AND.W #$00FF 
    ASL A 
    TAX 
    LDA.L SineCosineTables_16bitSine,X 
    STA.B $12 
    PLX 
    LDA.B $12 
    BPL + 
    LDA.W #$0001 
    STA.L $7E7810,X 

  + LDA.B $12 
    JSL.L NegateA_A0B067 
    AND.W #$FF00 
    XBA 
    STA.B $16 
    LDA.L $7E7814,X 
    STA.B $18 
    JSR.W UnsignedMultiplication_24bit_A3BE7B 
    LDA.B $1C 
    STA.B $16 
    LDA.B $1E 
    STA.B $18 
    LDA.L $7E7810,X 
    BEQ + 
    JSR.W StrugglingWithMultiWordNegation 
    LDA.B $1C 
    STA.B $16 
    LDA.B $1E 
    STA.B $18 

  + CLC 
    LDA.W $0F80,X 
    ADC.B $16 
    STA.W $0F80,X 
    LDA.W $0F7E,X 
    ADC.B $18 
    STA.W $0F7E,X 
    RTS 


UnsignedMultiplication_24bit_A3BE7B:
    PHP 
    SEP #$20 
    LDA.B $16 
    STA.W $4202 
    LDA.B $18 
    STA.W $4203 
    NOP 
    NOP 
    NOP 
    REP #$20 
    LDA.W $4216 
    STA.B $1C 
    SEP #$20 
    LDA.B $16 
    STA.W $4202 
    LDA.B $19 
    STA.W $4203 
    NOP 
    NOP 
    NOP 
    REP #$20 
    LDA.W $4216 
    AND.W #$FF00 
    XBA 
    STA.B $1E 
    LDA.W $4216 
    AND.W #$00FF 
    XBA 
    CLC 
    ADC.B $1C 
    STA.B $1C 
    BCC .return 
    INC.B $1E 

.return:
    PLP 
    RTS 


StrugglingWithMultiWordNegation:
    LDA.B $16 
    BNE + 
    LDA.B $18 
    BNE + 
    BRA .return 


  + LDA.B $16 
    LDA.W #$0000 
    SEC 
    SBC.B $16 
    STA.B $1C 
    LDA.B $18 
    EOR.W #$FFFF 
    STA.B $1E 

.return:
    RTS 


SetBangInstList:
    LDX.W $0E54 
    LDA.L $7E8000,X 
    CMP.L $7E8002,X 
    BEQ .return 
    STA.L $7E8002,X 
    ASL A 
    TAY 
    LDA.W InstListPointers_Bang,Y 
    STA.W $0F92,X 
    LDA.W #$0001 
    STA.W $0F94,X 
    STZ.W $0F90,X 

.return:
    RTS 


EnemyShot_Bang:
    LDX.W $0E54 
    LDA.W $0FB2,X 
    CMP.W #Function_Bang_Movement_GetEnemyIndex 
    BEQ .RTSFunction 
    LDA.W $18A6 
    ASL A 
    TAY 
    LDA.W $0C04,Y 
    AND.W #$000F 
    ASL A 
    TAY 
    LDA.W BangAngles,Y 
    STA.L $7E7802,X 
    LDA.W #Function_Bang_Movement_Decelerating 
    STA.W $0FB2,X 
    LDA.W #$0000 
    STA.L $7E780E,X 
    STA.L $7E7810,X 
    LDA.W #$0100 
    STA.L $7E7812,X 
    LDA.W #$0600 
    STA.L $7E7814,X 

.RTSFunction:
    LDA.L $7E8000,X 
    CMP.W #$0009 
    BNE .notIndex9 
    RTL 


.notIndex9:
    LDA.L $7E8000,X 
    INC A 
    STA.L $7E8000,X 
    JSR.W SetBangInstList 
    LDA.W $18A6 
    ASL A 
    TAY 
    LDA.W $0C2C,Y 
    CLC 
    ADC.W $0FB0,X 
    STA.W $0FB0,X 
    LDA.W $0C04,Y 
    ORA.W #$0010 
    STA.W $0C04,Y 
    LDX.W $0E54 
    LDA.L $7E8000,X 
    CMP.W #$0009 
    BEQ + 
    RTL 


  + LDA.W #$0001 
    STA.W $0FAE,X 
    RTL 


Spritemap_Bang_Growth0_Idling_0:
    dw $0001,$01FC 
    db $FC 
    dw $3113 

Spritemap_Bang_Growth0_Idling_1:
    dw $0001,$01FC 
    db $FC 
    dw $3110 

Spritemap_Bang_Growth0_Idling_2:
    dw $0001,$01FC 
    db $FC 
    dw $3114 

Spritemap_Bang_Growth0_Idling_3:
    dw $0001,$01FC 
    db $FC 
    dw $3111 

Spritemap_Bang_Growth0_Idling_4:
    dw $0001,$01FC 
    db $FC 
    dw $3115 

Spritemap_Bang_Growth0_Idling_5:
    dw $0001,$01FC 
    db $FC 
    dw $3112 

Spritemap_Bang_Growth0_Growing_0:
    dw $0001,$01FC 
    db $FC 
    dw $3170 

Spritemap_Bang_Growth0_Growing_1:
    dw $0001,$01FC 
    db $FC 
    dw $3160 

Spritemap_Bang_Growth0_Growing_2:
    dw $0001,$01FC 
    db $FC 
    dw $3116 

Spritemap_Bang_Growth0_Growing_3:
    dw $0004,$01F9 
    db $FF 
    dw $F101,$01FF 
    db $FF 
    dw $B101,$01FF 
    db $F9 
    dw $3101,$01F9 
    db $F9 
    dw $3100 

Spritemap_Bang_Growth0_Growing_4:
    dw $0001,$01FC 
    db $FC 
    dw $3116 

Spritemap_Bang_Growth0_Growing_5:
    dw $0004,$01F8 
    db $FF 
    dw $F101,$0000 
    db $FF 
    dw $B101,$0000 
    db $F9 
    dw $3101,$01F8 
    db $F9 
    dw $3100 

Spritemap_Bang_Growth0_Growing_6:
    dw $0001,$01FC 
    db $FC 
    dw $3116 

Spritemap_Bang_Growth0_Growing_7:
    dw $0004,$01F8 
    db $00 
    dw $F101,$0000 
    db $00 
    dw $B101,$0000 
    db $F8 
    dw $3101,$01F8 
    db $F8 
    dw $3100 

Spritemap_Bang_Growth1_Idling_0:
    dw $0001,$01FC 
    db $FC 
    dw $3116 

Spritemap_Bang_Growth1_Idling_1:
    dw $0004,$01F8 
    db $00 
    dw $F101,$0000 
    db $00 
    dw $B101,$0000 
    db $F8 
    dw $3101,$01F8 
    db $F8 
    dw $3100 

Spritemap_Bang_Growth1_Idling_2:
    dw $0001,$01FC 
    db $FC 
    dw $3117 

Spritemap_Bang_Growth1_Idling_3:
    dw $0004,$01F8 
    db $00 
    dw $F103,$0000 
    db $00 
    dw $B103,$0000 
    db $F8 
    dw $3103,$01F8 
    db $F8 
    dw $3102 

Spritemap_Bang_Growth1_Idling_4:
    dw $0001,$01FC 
    db $FC 
    dw $3118 

Spritemap_Bang_Growth1_Idling_5:
    dw $0004,$01F8 
    db $00 
    dw $F105,$0000 
    db $00 
    dw $B105,$0000 
    db $F8 
    dw $3105,$01F8 
    db $F8 
    dw $3104 

Spritemap_Bang_Growth1_Growing_0:
    dw $0004,$0000 
    db $00 
    dw $F172,$01F8 
    db $00 
    dw $B172,$0000 
    db $F8 
    dw $7172,$01F8 
    db $F8 
    dw $3172 

Spritemap_Bang_Growth1_Growing_1:
    dw $0004,$0000 
    db $00 
    dw $F171,$01F8 
    db $00 
    dw $B171,$0000 
    db $F8 
    dw $7171,$01F8 
    db $F8 
    dw $3171 

Spritemap_Bang_Growth1_Growing_2:
    dw $0001,$01FC 
    db $FC 
    dw $3119 

Spritemap_Bang_Growth1_Growing_3:
    dw $0004,$01F9 
    db $FF 
    dw $F107,$01FF 
    db $FF 
    dw $B107,$01FF 
    db $F9 
    dw $3107,$01F9 
    db $F9 
    dw $3106 

Spritemap_Bang_Growth1_Growing_4:
    dw $0001,$01FC 
    db $FC 
    dw $3119 

Spritemap_Bang_Growth1_Growing_5:
    dw $0004,$01F9 
    db $00 
    dw $F107,$01FF 
    db $00 
    dw $B107,$01FF 
    db $F8 
    dw $3107,$01F9 
    db $F8 
    dw $3106 

Spritemap_Bang_Growth1_Growing_6:
    dw $0001,$01FC 
    db $FC 
    dw $3119 

Spritemap_Bang_Growth1_Growing_7:
    dw $0004,$01F8 
    db $00 
    dw $F107,$0000 
    db $00 
    dw $B107,$0000 
    db $F8 
    dw $3107,$01F8 
    db $F8 
    dw $3106 

Spritemap_Bang_Growth2_Idling_0:
    dw $0001,$01FC 
    db $FC 
    dw $3119 

Spritemap_Bang_Growth2_Idling_1:
    dw $0004,$01F8 
    db $00 
    dw $F107,$0000 
    db $00 
    dw $B107,$0000 
    db $F8 
    dw $3107,$01F8 
    db $F8 
    dw $3106 

Spritemap_Bang_Growth2_Idling_2:
    dw $0001,$01FC 
    db $FC 
    dw $311A 

Spritemap_Bang_Growth2_Idling_3:
    dw $0004,$01F8 
    db $00 
    dw $F109,$0000 
    db $00 
    dw $B109,$0000 
    db $F8 
    dw $3109,$01F8 
    db $F8 
    dw $3108 

Spritemap_Bang_Growth2_Idling_4:
    dw $0001,$01FC 
    db $FC 
    dw $311B 

Spritemap_Bang_Growth2_Idling_5:
    dw $0004,$01F8 
    db $00 
    dw $F10B,$0000 
    db $00 
    dw $B10B,$0000 
    db $F8 
    dw $310B,$01F8 
    db $F8 
    dw $310A 

Spritemap_Bang_Growth2_Growing_0:
    dw $0001,$01FC 
    db $FC 
    dw $3119 

Spritemap_Bang_Growth2_Growing_1:
    dw $0004,$0000 
    db $00 
    dw $F177,$01F8 
    db $00 
    dw $B177,$0000 
    db $F8 
    dw $7177,$01F8 
    db $F8 
    dw $3177 

Spritemap_Bang_Growth2_Growing_2:
    dw $0001,$01FC 
    db $FC 
    dw $3119 

Spritemap_Bang_Growth2_Growing_3:
    dw $0004,$0000 
    db $00 
    dw $F167,$01F8 
    db $00 
    dw $B167,$0000 
    db $F8 
    dw $7167,$01F8 
    db $F8 
    dw $3167 

Spritemap_Bang_Growth2_Growing_4:
    dw $0001,$C3F8 
    db $F8 
    dw $310C 

Spritemap_Bang_Growth2_Growing_5:
    dw $0004,$C3F2 
    db $FE 
    dw $F122,$C3FE 
    db $FE 
    dw $B122,$C3FE 
    db $F2 
    dw $3122,$C3F2 
    db $F2 
    dw $3120 

Spritemap_Bang_Growth2_Growing_6:
    dw $0001,$C3F8 
    db $F8 
    dw $310C 

Spritemap_Bang_Growth2_Growing_7:
    dw $0004,$C3FF 
    db $F1 
    dw $3122,$C3F1 
    db $F1 
    dw $3120,$C3F1 
    db $FF 
    dw $F122,$C3FF 
    db $FF 
    dw $B122 

Spritemap_Bang_Growth2_Growing_8:
    dw $0001,$C3F8 
    db $F8 
    dw $310C 

Spritemap_Bang_Growth2_Growing_9:
    dw $0004,$C3F0 
    db $00 
    dw $F122,$C200 
    db $00 
    dw $B122,$C200 
    db $F0 
    dw $3122,$C3F0 
    db $F0 
    dw $3120 

Spritemap_Bang_Growth3_Idling_0:
    dw $0001,$C3F8 
    db $F8 
    dw $310C 

Spritemap_Bang_Growth3_Idling_1:
    dw $0004,$C200 
    db $F0 
    dw $3122,$C3F0 
    db $F0 
    dw $3120,$C3F0 
    db $00 
    dw $F122,$C200 
    db $00 
    dw $B122 

Spritemap_Bang_Growth3_Idling_2:
    dw $0001,$C3F8 
    db $F8 
    dw $312C 

Spritemap_Bang_Growth3_Idling_3:
    dw $0004,$C3F0 
    db $00 
    dw $F126,$C200 
    db $00 
    dw $B126,$C200 
    db $F0 
    dw $3126,$C3F0 
    db $F0 
    dw $3124 

Spritemap_Bang_Growth3_Idling_4:
    dw $0001,$C3F8 
    db $F8 
    dw $314C 

Spritemap_Bang_Growth3_Idling_5:
    dw $0004,$C200 
    db $F0 
    dw $312A,$C3F0 
    db $F0 
    dw $3128,$C3F0 
    db $00 
    dw $F12A,$C200 
    db $00 
    dw $B12A 

Spritemap_Bang_Growth3_Idling_6:
    dw $0001,$C3F8 
    db $F8 
    dw $310C 

Spritemap_Bang_Growth3_Idling_7:
    dw $0004,$C200 
    db $FF 
    dw $B122,$C3F0 
    db $FF 
    dw $F122,$C200 
    db $F1 
    dw $3122,$C3F0 
    db $F1 
    dw $3120 

Spritemap_Bang_Growth3_Idling_8:
    dw $0001,$C3F8 
    db $F8 
    dw $312C 

Spritemap_Bang_Growth3_Idling_9:
    dw $0004,$C200 
    db $FF 
    dw $B126,$C3F0 
    db $FF 
    dw $F126,$C200 
    db $F1 
    dw $3126,$C3F0 
    db $F1 
    dw $3124 

Spritemap_Bang_Growth3_Idling_A:
    dw $0001,$C3F8 
    db $F8 
    dw $314C 

Spritemap_Bang_Growth3_Idling_B:
    dw $0004,$C200 
    db $FF 
    dw $B12A,$C3F0 
    db $FF 
    dw $F12A,$C200 
    db $F1 
    dw $312A,$C3F0 
    db $F1 
    dw $3128 

Spritemap_Bang_Growth3_Idling_C:
    dw $0001,$C3F8 
    db $F8 
    dw $310C 

Spritemap_Bang_Growth3_Idling_D:
    dw $0004,$C3FF 
    db $00 
    dw $B122,$C3F1 
    db $00 
    dw $F122,$C3FF 
    db $F0 
    dw $3122,$C3F1 
    db $F0 
    dw $3120 

Spritemap_Bang_Growth3_Idling_E:
    dw $0001,$C3F8 
    db $F8 
    dw $312C 

Spritemap_Bang_Growth3_Idling_F:
    dw $0004,$C3FF 
    db $00 
    dw $B126,$C3F1 
    db $00 
    dw $F126,$C3FF 
    db $F0 
    dw $3126,$C3F1 
    db $F0 
    dw $3124 

Spritemap_Bang_Growth3_Idling_10:
    dw $0001,$C3F8 
    db $F8 
    dw $314C 

Spritemap_Bang_Growth3_Idling_11:
    dw $0004,$C3FF 
    db $00 
    dw $B12A,$C3F1 
    db $00 
    dw $F12A,$C3FF 
    db $F0 
    dw $312A,$C3F1 
    db $F0 
    dw $3128 

Spritemap_Bang_Growth3_Growing_0:
    dw $0001,$C3F8 
    db $F8 
    dw $316A 

Spritemap_Bang_Growth3_Growing_1:
    dw $0004,$C3F0 
    db $00 
    dw $F122,$C200 
    db $00 
    dw $B122,$C200 
    db $F0 
    dw $3122,$C3F0 
    db $F0 
    dw $3120 

Spritemap_Bang_Growth3_Growing_2:
    dw $0001,$C3F8 
    db $F8 
    dw $3168 

Spritemap_Bang_Growth3_Growing_3:
    dw $0004,$C3F0 
    db $00 
    dw $F122,$C200 
    db $00 
    dw $B122,$C200 
    db $F0 
    dw $3122,$C3F0 
    db $F0 
    dw $3120 

Spritemap_Bang_Growth3_Growing_4:
    dw $0001,$C3F8 
    db $F8 
    dw $316C 

Spritemap_Bang_Growth3_Growing_5:
    dw $0004,$C3F2 
    db $FE 
    dw $F142,$C3FE 
    db $FE 
    dw $B142,$C3FE 
    db $F2 
    dw $3142,$C3F2 
    db $F2 
    dw $3140 

Spritemap_Bang_Growth3_Growing_6:
    dw $0001,$C3F8 
    db $F8 
    dw $316E 

Spritemap_Bang_Growth3_Growing_7:
    dw $0004,$C3F1 
    db $FF 
    dw $F142,$C3FF 
    db $FF 
    dw $B142,$C3FF 
    db $F1 
    dw $3142,$C3F1 
    db $F1 
    dw $3140 

Spritemap_Bang_Growth3_Growing_8:
    dw $0001,$C3F8 
    db $F8 
    dw $316C 

Spritemap_Bang_Growth3_Growing_9:
    dw $0004,$C200 
    db $00 
    dw $B142,$C3F0 
    db $00 
    dw $F142,$C200 
    db $F0 
    dw $3142,$C3F0 
    db $F0 
    dw $3140 

Spritemap_Bang_Growth3_Growing_A:
    dw $0001,$C3F8 
    db $F8 
    dw $310E 

Spritemap_Bang_Growth3_Growing_B:
    dw $0004,$C200 
    db $00 
    dw $B142,$C3F0 
    db $00 
    dw $F142,$C200 
    db $F0 
    dw $3142,$C3F0 
    db $F0 
    dw $3140 

Spritemap_Bang_Electricity_Growth3_4_Growing_0:
    dw $0002,$0004 
    db $FC 
    dw $3164,$01F6 
    db $F6 
    dw $3161 

Spritemap_Bang_Electricity_Growth3_4_Growing_1:
    dw $0002,$0004 
    db $FC 
    dw $3165,$01F6 
    db $F6 
    dw $3162 

Spritemap_Bang_Electricity_Growth3_4_Growing_2:
    dw $0002,$0004 
    db $FC 
    dw $3166,$01F6 
    db $F6 
    dw $3163 

Spritemap_Bang_Electricity_Growth3_4_Growing_3:
    dw $0002,$0002 
    db $F6 
    dw $7161,$01F4 
    db $FD 
    dw $3164 

Spritemap_Bang_Electricity_Growth3_4_Growing_4:
    dw $0002,$0002 
    db $F6 
    dw $7162,$01F4 
    db $FD 
    dw $3165 

Spritemap_Bang_Electricity_Growth3_4_Growing_5:
    dw $0002,$01F4 
    db $FD 
    dw $3166,$0002 
    db $F6 
    dw $7163 

Spritemap_Bang_Electricity_Growth3_4_Growing_6:
    dw $0002,$01FA 
    db $03 
    dw $3176,$01FC 
    db $F5 
    dw $3174 

Spritemap_Bang_Electricity_Growth3_4_Growing_7:
    dw $0002,$01FA 
    db $03 
    dw $3175,$01FC 
    db $F5 
    dw $3175 

Spritemap_Bang_Electricity_Growth3_4_Growing_8:
    dw $0002,$01FB 
    db $03 
    dw $3174,$01FC 
    db $F5 
    dw $3176 

Spritemap_Bang_Electricity_Growth3_4_Growing_9:
    dw $0002,$0002 
    db $02 
    dw $3163,$01F6 
    db $02 
    dw $7161 

Spritemap_Bang_Electricity_Growth3_4_Growing_A:
    dw $0002,$0002 
    db $02 
    dw $3162,$01F6 
    db $02 
    dw $7162 

Spritemap_Bang_Electricity_Growth3_4_Growing_B:
    dw $0002,$0002 
    db $02 
    dw $3161,$01F6 
    db $02 
    dw $7163 

Spritemap_Bang_Growth4_Idling_0:
    dw $0001,$C3F8 
    db $F8 
    dw $310E 

Spritemap_Bang_Growth4_Idling_1:
    dw $0004,$C200 
    db $00 
    dw $B142,$C3F0 
    db $00 
    dw $F142,$C200 
    db $F0 
    dw $3142,$C3F0 
    db $F0 
    dw $3140 

Spritemap_Bang_Growth4_Idling_2:
    dw $0001,$C3F8 
    db $F8 
    dw $312E 

Spritemap_Bang_Growth4_Idling_3:
    dw $0004,$C200 
    db $00 
    dw $B146,$C3F0 
    db $00 
    dw $F146,$C200 
    db $F0 
    dw $3146,$C3F0 
    db $F0 
    dw $3144 

Spritemap_Bang_Growth4_Idling_4:
    dw $0001,$C3F8 
    db $F8 
    dw $314E 

Spritemap_Bang_Growth4_Idling_5:
    dw $0004,$C200 
    db $00 
    dw $B14A,$C3F0 
    db $00 
    dw $F14A,$C200 
    db $F0 
    dw $314A,$C3F0 
    db $F0 
    dw $3148 

Spritemap_Bang_Growth4_Idling_6:
    dw $0001,$C3F8 
    db $F8 
    dw $310E 

Spritemap_Bang_Growth4_Idling_7:
    dw $0004,$C3F0 
    db $FF 
    dw $F142,$C200 
    db $FF 
    dw $B142,$C200 
    db $F1 
    dw $3142,$C3F0 
    db $F1 
    dw $3140 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Bang_Growth4_Idling_A3C485:
    dw $0001,$C3F8 
    db $F8 
    dw $312E 

UNUSED_Spritemap_Bang_Growth4_Idling_A3C48C:
    dw $0004,$C3F0 
    db $FF 
    dw $F146,$C200 
    db $FF 
    dw $B146,$C200 
    db $F1 
    dw $3146,$C3F0 
    db $F1 
    dw $3144 

UNUSED_Spritemap_Bang_Growth4_Idling_A3C4A2:
    dw $0001,$C3F8 
    db $F8 
    dw $314E 

UNUSED_Spritemap_Bang_Growth4_Idling_A3C4A9:
    dw $0004,$C3F0 
    db $FF 
    dw $F14A,$C200 
    db $FF 
    dw $B14A,$C200 
    db $F1 
    dw $314A,$C3F0 
    db $F1 
    dw $3148 
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_Bang_Growth4_Idling_8:
    dw $0001,$C3F8 
    db $F8 
    dw $310E 

Spritemap_Bang_Growth4_Idling_9:
    dw $0004,$C3FF 
    db $00 
    dw $B142,$C3F1 
    db $00 
    dw $F142,$C3FF 
    db $F0 
    dw $3142,$C3F1 
    db $F0 
    dw $3140 

Spritemap_Bang_Growth4_Idling_A:
    dw $0001,$C3F8 
    db $F8 
    dw $312E 

Spritemap_Bang_Growth4_Idling_B:
    dw $0004,$C3FF 
    db $00 
    dw $B146,$C3F1 
    db $00 
    dw $F146,$C3FF 
    db $F0 
    dw $3146,$C3F1 
    db $F0 
    dw $3144 

Spritemap_Bang_Growth4_Idling_C:
    dw $0001,$C3F8 
    db $F8 
    dw $314E 

Spritemap_Bang_Growth4_Idling_D:
    dw $0004,$C3FF 
    db $00 
    dw $B14A,$C3F1 
    db $00 
    dw $F14A,$C3FF 
    db $F0 
    dw $314A,$C3F1 
    db $F0 
    dw $3148 

Spritemap_Bang_Growth4_Growing_0:
    dw $0001,$C3F8 
    db $F8 
    dw $316E 

Spritemap_Bang_Growth4_Growing_1:
    dw $0004,$C3F0 
    db $00 
    dw $F142,$C200 
    db $00 
    dw $B142,$C200 
    db $F0 
    dw $3142,$C3F0 
    db $F0 
    dw $3140 

Spritemap_Bang_Growth4_Growing_2:
    dw $0001,$C3F8 
    db $F8 
    dw $316C 

Spritemap_Bang_Growth4_Growing_3:
    dw $0004,$C200 
    db $00 
    dw $B142,$C3F0 
    db $00 
    dw $F142,$C200 
    db $F0 
    dw $3142,$C3F0 
    db $F0 
    dw $3140 

Spritemap_Bang_Growth4_Growing_4:
    dw $0001,$C3F8 
    db $F8 
    dw $316E 

Spritemap_Bang_Growth4_Growing_5:
    dw $0004,$C3EF 
    db $EF 
    dw $7142,$C3EF 
    db $01 
    dw $F142,$C201 
    db $01 
    dw $B142,$C201 
    db $EF 
    dw $3142 

Spritemap_Bang_Growth4_Growing_6:
    dw $0001,$C3F8 
    db $F8 
    dw $316C 

Spritemap_Bang_Growth4_Growing_7:
    dw $0004,$C3EE 
    db $EE 
    dw $7146,$C3EE 
    db $02 
    dw $F146,$C202 
    db $02 
    dw $B146,$C202 
    db $EE 
    dw $3146 

Spritemap_Bang_Growth4_Growing_8:
    dw $0001,$C3F8 
    db $F8 
    dw $316E 

Spritemap_Bang_Growth4_Growing_9:
    dw $0004,$C3ED 
    db $ED 
    dw $714A,$C3ED 
    db $03 
    dw $F14A,$C203 
    db $03 
    dw $B14A,$C203 
    db $ED 
    dw $314A 

Spritemap_Bang_Growth4_Growing_A:
    dw $0001,$C3F8 
    db $F8 
    dw $316C 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Bang_Electricity_A3C5AE:
    dw $0002,$0006 
    db $FC 
    dw $3164,$01F5 
    db $F5 
    dw $3161 

UNUSED_Spritemap_Bang_Electricity_A3C5BA:
    dw $0002,$0006 
    db $FC 
    dw $3165,$01F5 
    db $F5 
    dw $3162 

UNUSED_Spritemap_Bang_Electricity_A3C5C6:
    dw $0002,$0006 
    db $FC 
    dw $3166,$01F5 
    db $F5 
    dw $3163 

UNUSED_Spritemap_Bang_Electricity_A3C5D2:
    dw $0002,$0003 
    db $F5 
    dw $7161,$01F2 
    db $FD 
    dw $3164 

UNUSED_Spritemap_Bang_Electricity_A3C5DE:
    dw $0002,$0003 
    db $F5 
    dw $7162,$01F2 
    db $FD 
    dw $3165 

UNUSED_Spritemap_Bang_Electricity_A3C5EA:
    dw $0002,$01F2 
    db $FD 
    dw $3166,$0003 
    db $F5 
    dw $7163 

UNUSED_Spritemap_Bang_Electricity_A3C5F6:
    dw $0002,$01FA 
    db $05 
    dw $3176,$01FC 
    db $F3 
    dw $3174 

UNUSED_Spritemap_Bang_Electricity_A3C602:
    dw $0002,$01FA 
    db $05 
    dw $3175,$01FC 
    db $F3 
    dw $3175 

UNUSED_Spritemap_Bang_Electricity_A3C60E:
    dw $0002,$01FB 
    db $05 
    dw $3174,$01FC 
    db $F3 
    dw $3176 

UNUSED_Spritemap_Bang_Electricity_A3C61A:
    dw $0002,$0003 
    db $03 
    dw $3163,$01F5 
    db $03 
    dw $7161 

UNUSED_Spritemap_Bang_Electricity_A3C626:
    dw $0002,$0003 
    db $03 
    dw $3162,$01F5 
    db $03 
    dw $7162 

UNUSED_Spritemap_Bang_Electricity_A3C632:
    dw $0002,$0003 
    db $03 
    dw $3161,$01F5 
    db $03 
    dw $7163 
endif ; !FEATURE_KEEP_UNREFERENCED

Palette_Skree:
    dw $3800,$3F57,$2E4D,$00E2,$0060,$3AB0,$220B,$1166 
    dw $0924,$7FFF,$039C,$0237,$00D1,$61BF,$38B6,$1448 

InstList_Skree_Idling:
    dw $000A 
    dw Spritemap_Skree_0 
    dw $000A 
    dw Spritemap_Skree_2 
    dw $000A 
    dw Spritemap_Skree_3 
    dw $000A 
    dw Spritemap_Skree_4 
    dw Instruction_Common_GotoY 
    dw InstList_Skree_Idling 

InstList_Skree_PrepareToLaunchAttack:
    dw $0010 
    dw Spritemap_Skree_0 
    dw $0008 
    dw Spritemap_Skree_1 
    dw Instruction_Skree_SetAttackReadyFlag 
    dw Instruction_Common_Sleep 

InstList_Skree_LaunchedAttack_0:
    dw Instruction_Common_EnableOffScreenProcessing 

InstList_Skree_LaunchedAttack_1:
    dw $0002 
    dw Spritemap_Skree_2 
    dw $0002 
    dw Spritemap_Skree_3 
    dw $0002 
    dw Spritemap_Skree_4 
    dw $0002 
    dw Spritemap_Skree_0 
    dw Instruction_Common_GotoY 
    dw InstList_Skree_LaunchedAttack_1 

UNUSED_InstList_Skree_StopAnimating_A3C694:
    dw Instruction_Common_DisableOffScreenProcessing 
    dw $0001 
    dw Spritemap_Skree_0 
    dw Instruction_Common_Sleep 

InstListPointers_Skree:
    dw InstList_Skree_Idling 
    dw InstList_Skree_PrepareToLaunchAttack 
    dw InstList_Skree_LaunchedAttack_0 
    dw UNUSED_InstList_Skree_StopAnimating_A3C694 

Instruction_Skree_SetAttackReadyFlag:
    LDX.W $0E54 
    LDA.W #$0001 
    STA.W $0FB0,X 
    RTL 


InitAI_Skree:
    LDX.W $0E54 
    STZ.W $0FAC,X 
    STZ.W $0FAE,X 
    STZ.W $0FB0,X 
    LDA.W #InstList_Skree_Idling 
    STA.W $0F92,X 
    LDA.W #Function_Skree_Idling 
    STA.W $0FAA,X 
    RTL 


MainAI_Skree:
    LDX.W $0E54 
    JMP.W ($0FAA,X) 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_FunctionPointers_Skree_A3C6CD:
    dw Function_Skree_Idling 
    dw Function_Skree_PrepareToLaunchAttack 
    dw Function_Skree_LaunchedAttack 
    dw Function_Skree_Burrowing 
endif ; !FEATURE_KEEP_UNREFERENCED

Function_Skree_Idling:
    LDX.W $0E54 
    LDA.W $0F7A,X 
    SEC 
    SBC.W $0AF6 
    BPL + 
    EOR.W #$FFFF 
    INC A 

  + CMP.W #$0030 
    BCS .return 
    INC.W $0FAC,X 
    JSR.W SetSkreeInstListPointer 
    LDA.W #Function_Skree_PrepareToLaunchAttack 
    STA.W $0FAA,X 

.return:
    RTL 


Function_Skree_PrepareToLaunchAttack:
    LDA.W $0FB0,X 
    BEQ .return 
    STZ.W $0FB0,X 
    LDX.W $0E54 
    INC.W $0FAC,X 
    JSR.W SetSkreeInstListPointer 
    LDA.W #Function_Skree_LaunchedAttack 
    STA.W $0FAA,X 
    LDA.W #$005B 
    JSL.L QueueSound_Lib2_Max6 

.return:
    RTL 


Function_Skree_LaunchedAttack:
    LDX.W $0E54 
    LDA.W #$0015 
    STA.W $0FA8,X 
    LDA.W #$0006 
    STA.B $14 
    STZ.B $12 
    LDA.W $0F86,X 
    ORA.W #$0003 
    STA.W $0F86,X 
    LDX.W $0E54 
    JSL.L CheckForVerticalSolidBlockCollision_SkreeMetaree 
    BCS .collision 
    LDX.W $0E54 
    LDA.W $0F7E,X 
    CLC 
    ADC.W #$0006 
    STA.W $0F7E,X 
    LDA.W #$0001 
    STA.W $0E24 
    LDA.W $0F7A,X 
    CMP.W $0AF6 
    BMI .steerRight 
    LDA.W #$FFFF 
    STA.W $0E24 

.steerRight:
    LDA.W $0F7A,X 
    CLC 
    ADC.W $0E24 
    STA.W $0F7A,X 
    BRA .return 


.collision:
    LDX.W $0E54 
    LDA.W #$0001 
    STA.W $0F94,X 
    STZ.W $0F90,X 
    LDA.W #Function_Skree_Burrowing 
    STA.W $0FAA,X 
    LDA.W #$005C 
    JSL.L QueueSound_Lib2_Max6 

.return:
    RTL 


Function_Skree_Burrowing:
    LDX.W $0E54 
    DEC.W $0FA8,X 
    BEQ .delete 
    LDA.W $0FA8,X 
    CMP.W #$0008 
    BNE .timerNot8 
    LDX.W $0E54 
    LDY.W #EnemyProjectile_SkreeParticles_DownRight 
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    LDY.W #EnemyProjectile_SkreeParticles_UpRight 
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    LDY.W #EnemyProjectile_SkreeParticles_DownLeft 
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    LDY.W #EnemyProjectile_SkreeParticles_UpLeft 
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 

.timerNot8:
    LDX.W $0E54 
    INC.W $0F7E,X 
    RTL 


.delete:
    LDX.W $0E54 
    LDA.W $0F96,X 
    ORA.W $0F98,X 
    STA.L $7E7006,X 
    LDA.W #$0A00 
    STA.W $0F96,X 
    STZ.W $0F98,X 
    LDA.W $0F86,X 
    ORA.W #$0200 
    STA.W $0F86,X 
    RTL 


SetSkreeInstListPointer:
    LDX.W $0E54 
    LDA.W $0FAC,X 
    CMP.W $0FAE,X 
    BEQ .return 
    STA.W $0FAE,X 
    ASL A 
    TAY 
    LDA.W InstListPointers_Skree,Y 
    STA.W $0F92,X 
    LDA.W #$0001 
    STA.W $0F94,X 
    STZ.W $0F90,X 

.return:
    RTS 


EnemyShot_Skree:
    LDX.W $0E54 
    JSL.L CommonA3_NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic 
    LDX.W $0E54 
    LDA.W $0F8C,X 
    BNE .return 
    LDA.W $0FA8,X 
    LDX.W $0E54 
    LDY.W #EnemyProjectile_SkreeParticles_DownRight 
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    LDY.W #EnemyProjectile_SkreeParticles_UpRight 
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    LDY.W #EnemyProjectile_SkreeParticles_DownLeft 
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    LDY.W #EnemyProjectile_SkreeParticles_UpLeft 
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    LDY.W #$0002 
    LDA.W $18A6 
    ASL A 
    TAX 
    LDA.W $0C18,X 
    AND.W #$0F00 
    CMP.W #$0200 
    BEQ .superMissile 
    LDY.W #$0000 

.superMissile:
    TYA 
    JSL.L EnemyDeath 

.return:
    RTL 


Spritemap_Skree_0:
    dw $0006,$0000 
    db $0C 
    dw $6112,$0000 
    db $04 
    dw $6102,$01F8 
    db $0C 
    dw $2112,$01F8 
    db $04 
    dw $2102,$8000 
    db $F4 
    dw $6100,$81F0 
    db $F4 
    dw $2100 

Spritemap_Skree_1:
    dw $0004,$0004 
    db $04 
    dw $6105,$01F4 
    db $04 
    dw $2105,$8000 
    db $F4 
    dw $6103,$81F0 
    db $F4 
    dw $2103 

Spritemap_Skree_2:
    dw $0002,$81F8 
    db $04 
    dw $2108,$81F8 
    db $F4 
    dw $2106 

Spritemap_Skree_3:
    dw $0004,$01FC 
    db $0C 
    dw $211B,$01FC 
    db $04 
    dw $210B,$01FC 
    db $FC 
    dw $211A,$01FC 
    db $F4 
    dw $210A 

Spritemap_Skree_4:
    dw $0002,$81F8 
    db $04 
    dw $210E,$81F8 
    db $F4 
    dw $210C 

Palette_Yard:
    dw $3800,$57FF,$42F7,$158C,$00A5,$4F5A,$36B5,$2610 
    dw $1DCE,$77FF,$62B5,$314A,$1063,$4D1F,$38B6,$246E 

InstList_Yard_OutsideTurn_UpsideRight_MovingUp:
    dw Instruction_Yard_MovementFunctionInY 
    dw RTL_A3CF5F 
    dw Instruction_Yard_HidingInstListInY 
    dw RTL_A3CF5F 
    dw $0007 
    dw Spritemap_Yard_15 
    dw $0004 
    dw Spritemap_Yard_16 
    dw $0007 
    dw Spritemap_Yard_17 
    dw Instruction_Yard_MoveByPixelsInY 
    dw $FFFC,$FFF8 

InstList_Yard_Crawling_UpsideUp_MovingLeft:
    dw Instruction_Yard_MovementFunctionInY 
    dw Function_Yard_Movement_Crawling_UpsideUp_MovingLeft 
    dw Instruction_Yard_HidingInstListInY 
    dw InstList_Yard_Hiding_UpsideUp_MovingLeft 
    dw Instruction_Yard_DirectionInY 
    dw $0006,$0009 
    dw Spritemap_Yard_0 
    dw $000D 
    dw Spritemap_Yard_1 
    dw $0009 
    dw Spritemap_Yard_2 
    dw Instruction_Common_GotoY 
    dw InstList_Yard_Crawling_UpsideUp_MovingLeft 

InstList_Yard_OutsideTurn_UpsideUp_MovingLeft:
    dw Instruction_Yard_MovementFunctionInY 
    dw RTL_A3CF5F 
    dw Instruction_Yard_HidingInstListInY 
    dw RTL_A3CF5F 
    dw $0007 
    dw Spritemap_Yard_3 
    dw $0004 
    dw Spritemap_Yard_4 
    dw $0007 
    dw Spritemap_Yard_5 
    dw Instruction_Yard_MoveByPixelsInY 
    dw $FFF8,$0004 

InstList_Yard_Crawling_UpsideLeft_MovingDown:
    dw Instruction_Yard_MovementFunctionInY 
    dw Function_Yard_Movement_Crawling_UpsideLeft_MovingDown 
    dw Instruction_Yard_HidingInstListInY 
    dw InstList_Yard_Hiding_UpsideLeft_MovingDown 
    dw Instruction_Yard_DirectionInY 
    dw $0003,$0009 
    dw Spritemap_Yard_6 
    dw $000D 
    dw Spritemap_Yard_7 
    dw $0009 
    dw Spritemap_Yard_8 
    dw Instruction_Common_GotoY 
    dw InstList_Yard_Crawling_UpsideLeft_MovingDown 

InstList_Yard_OutsideTurn_UpsideLeft_MovingDown:
    dw Instruction_Yard_MovementFunctionInY 
    dw RTL_A3CF5F 
    dw Instruction_Yard_HidingInstListInY 
    dw RTL_A3CF5F 
    dw $0007 
    dw Spritemap_Yard_9 
    dw $0004 
    dw Spritemap_Yard_A 
    dw $0007 
    dw Spritemap_Yard_B 
    dw Instruction_Yard_MoveByPixelsInY 
    dw $0004,$0008 

InstList_Yard_Crawling_UpsideDown_MovingRight:
    dw Instruction_Yard_MovementFunctionInY 
    dw Function_Yard_Movement_Crawling_UpsideDown_MovingRight 
    dw Instruction_Yard_HidingInstListInY 
    dw InstList_Yard_Hiding_UpsideDown_MovingRight 
    dw Instruction_Yard_DirectionInY 
    dw $0005,$0009 
    dw Spritemap_Yard_C 
    dw $000D 
    dw Spritemap_Yard_D 
    dw $0009 
    dw Spritemap_Yard_E 
    dw Instruction_Common_GotoY 
    dw InstList_Yard_Crawling_UpsideDown_MovingRight 

InstList_Yard_OutsideTurn_UpsideDown_MovingRight:
    dw Instruction_Yard_MovementFunctionInY 
    dw RTL_A3CF5F 
    dw Instruction_Yard_HidingInstListInY 
    dw RTL_A3CF5F 
    dw $0007 
    dw Spritemap_Yard_F 
    dw $0004 
    dw Spritemap_Yard_10 
    dw $0007 
    dw Spritemap_Yard_11 
    dw Instruction_Yard_MoveByPixelsInY 
    dw $0008,$FFFC 

InstList_Yard_Crawling_UpsideRight_MovingUp:
    dw Instruction_Yard_MovementFunctionInY 
    dw Function_Yard_Movement_Crawling_UpsideRight_MovingUp 
    dw Instruction_Yard_HidingInstListInY 
    dw InstList_Yard_Hiding_UpsideRight_MovingUp 
    dw Instruction_Yard_DirectionInY 
    dw $0000,$0009 
    dw Spritemap_Yard_12 
    dw $000D 
    dw Spritemap_Yard_13 
    dw $0009 
    dw Spritemap_Yard_14 
    dw Instruction_Common_GotoY 
    dw InstList_Yard_Crawling_UpsideRight_MovingUp 

InstList_Yard_OutsideTurn_UpsideLeft_MovingUp:
    dw Instruction_Yard_MovementFunctionInY 
    dw RTL_A3CF5F 
    dw Instruction_Yard_HidingInstListInY 
    dw RTL_A3CF5F 
    dw $0007 
    dw Spritemap_Yard_35 
    dw $0004 
    dw Spritemap_Yard_36 
    dw $0007 
    dw Spritemap_Yard_37 
    dw Instruction_Yard_MoveByPixelsInY 
    dw $0004,$FFF8 

InstList_Yard_Crawling_UpsideUp_MovingRight:
    dw Instruction_Yard_MovementFunctionInY 
    dw Function_Yard_Movement_Crawling_UpsideUp_MovingRight 
    dw Instruction_Yard_HidingInstListInY 
    dw InstList_Yard_Hiding_UpsideUp_MovingRight 
    dw Instruction_Yard_DirectionInY 
    dw $0007,$0009 
    dw Spritemap_Yard_20 
    dw $000D 
    dw Spritemap_Yard_21 
    dw $0009 
    dw Spritemap_Yard_22 
    dw Instruction_Common_GotoY 
    dw InstList_Yard_Crawling_UpsideUp_MovingRight 

InstList_Yard_OutsideTurn_UpsideUp_MovingRight:
    dw Instruction_Yard_MovementFunctionInY 
    dw RTL_A3CF5F 
    dw Instruction_Yard_HidingInstListInY 
    dw RTL_A3CF5F 
    dw $0007 
    dw Spritemap_Yard_23 
    dw $0004 
    dw Spritemap_Yard_24 
    dw $0007 
    dw Spritemap_Yard_25 
    dw Instruction_Yard_MoveByPixelsInY 
    dw $0008,$0004 

InstList_Yard_Crawling_UpsideRight_MovingDown:
    dw Instruction_Yard_MovementFunctionInY 
    dw Function_Yard_Movement_Crawling_UpsideRight_MovingDown 
    dw Instruction_Yard_HidingInstListInY 
    dw InstList_Yard_Hiding_UpsideRight_MovingDown 
    dw Instruction_Yard_DirectionInY 
    dw $0001,$0009 
    dw Spritemap_Yard_26 
    dw $000D 
    dw Spritemap_Yard_27 
    dw $0009 
    dw Spritemap_Yard_28 
    dw Instruction_Common_GotoY 
    dw InstList_Yard_Crawling_UpsideRight_MovingDown 

InstList_Yard_OutsideTurn_UpsideRight_MovingDown:
    dw Instruction_Yard_MovementFunctionInY 
    dw RTL_A3CF5F 
    dw Instruction_Yard_HidingInstListInY 
    dw RTL_A3CF5F 
    dw $0007 
    dw Spritemap_Yard_29 
    dw $0004 
    dw Spritemap_Yard_2A 
    dw $0007 
    dw Spritemap_Yard_2B 
    dw Instruction_Yard_MoveByPixelsInY 
    dw $FFFC,$0008 

InstList_Yard_Crawling_UpsideDown_MovingLeft:
    dw Instruction_Yard_MovementFunctionInY 
    dw Function_Yard_Movement_Crawling_UpsideDown_MovingLeft 
    dw Instruction_Yard_HidingInstListInY 
    dw InstList_Yard_Hiding_UpsideDown_MovingLeft 
    dw Instruction_Yard_DirectionInY 
    dw $0004,$0009 
    dw Spritemap_Yard_2C 
    dw $000D 
    dw Spritemap_Yard_2D 
    dw $0009 
    dw Spritemap_Yard_2E 
    dw Instruction_Common_GotoY 
    dw InstList_Yard_Crawling_UpsideDown_MovingLeft 

InstList_Yard_OutsideTurn_UpsideDown_MovingLeft:
    dw Instruction_Yard_MovementFunctionInY 
    dw RTL_A3CF5F 
    dw Instruction_Yard_HidingInstListInY 
    dw RTL_A3CF5F 
    dw $0007 
    dw Spritemap_Yard_2F 
    dw $0004 
    dw Spritemap_Yard_30 
    dw $0007 
    dw Spritemap_Yard_31 
    dw Instruction_Yard_MoveByPixelsInY 
    dw $FFF8,$FFFC 

InstList_Yard_Crawling_UpsideLeft_MovingUp:
    dw Instruction_Yard_MovementFunctionInY 
    dw Function_Yard_Movement_Crawling_UpsideLeft_MovingUp 
    dw Instruction_Yard_HidingInstListInY 
    dw InstList_Yard_Hiding_UpsideLeft_MovingUp 
    dw Instruction_Yard_DirectionInY 
    dw $0002,$0009 
    dw Spritemap_Yard_32 
    dw $000D 
    dw Spritemap_Yard_33 
    dw $0009 
    dw Spritemap_Yard_34 
    dw Instruction_Common_GotoY 
    dw InstList_Yard_Crawling_UpsideLeft_MovingUp 

InstList_Yard_InsideTurn_UpsideUp_MovingLeft:
    dw Instruction_Yard_MovementFunctionInY 
    dw RTL_A3CF5F 
    dw Instruction_Yard_HidingInstListInY 
    dw RTL_A3CF5F 
    dw $0007 
    dw Spritemap_Yard_40 
    dw $0004 
    dw Spritemap_Yard_41 
    dw $0007 
    dw Spritemap_Yard_42 
    dw Instruction_Common_GotoY 
    dw InstList_Yard_Crawling_UpsideRight_MovingUp 

InstList_Yard_InsideTurn_UpsideRight_MovingUp:
    dw Instruction_Yard_MovementFunctionInY 
    dw RTL_A3CF5F 
    dw Instruction_Yard_HidingInstListInY 
    dw RTL_A3CF5F 
    dw $0007 
    dw Spritemap_Yard_43 
    dw $0004 
    dw Spritemap_Yard_44 
    dw $0007 
    dw Spritemap_Yard_45 
    dw Instruction_Common_GotoY 
    dw InstList_Yard_Crawling_UpsideDown_MovingRight 

InstList_Yard_InsideTurn_UpsideDown_MovingRight:
    dw Instruction_Yard_MovementFunctionInY 
    dw RTL_A3CF5F 
    dw Instruction_Yard_HidingInstListInY 
    dw RTL_A3CF5F 
    dw $0007 
    dw Spritemap_Yard_46 
    dw $0004 
    dw Spritemap_Yard_47 
    dw $0007 
    dw Spritemap_Yard_48 
    dw Instruction_Common_GotoY 
    dw InstList_Yard_Crawling_UpsideLeft_MovingDown 

InstList_Yard_InsideTurn_UpsideLeft_MovingDown:
    dw Instruction_Yard_MovementFunctionInY 
    dw RTL_A3CF5F 
    dw Instruction_Yard_HidingInstListInY 
    dw RTL_A3CF5F 
    dw $0007 
    dw Spritemap_Yard_49 
    dw $0004 
    dw Spritemap_Yard_4A 
    dw $0007 
    dw Spritemap_Yard_4B 
    dw Instruction_Common_GotoY 
    dw InstList_Yard_Crawling_UpsideUp_MovingLeft 

InstList_Yard_InsideTurn_UpsideUp_MovingRight:
    dw Instruction_Yard_MovementFunctionInY 
    dw RTL_A3CF5F 
    dw Instruction_Yard_HidingInstListInY 
    dw RTL_A3CF5F 
    dw $0007 
    dw Spritemap_Yard_54 
    dw $0004 
    dw Spritemap_Yard_55 
    dw $0007 
    dw Spritemap_Yard_56 
    dw Instruction_Common_GotoY 
    dw InstList_Yard_Crawling_UpsideLeft_MovingUp 

InstList_Yard_InsideTurn_UpsideLeft_MovingUp:
    dw Instruction_Yard_MovementFunctionInY 
    dw RTL_A3CF5F 
    dw Instruction_Yard_HidingInstListInY 
    dw RTL_A3CF5F 
    dw $0007 
    dw Spritemap_Yard_57 
    dw $0004 
    dw Spritemap_Yard_58 
    dw $0007 
    dw Spritemap_Yard_59 
    dw Instruction_Common_GotoY 
    dw InstList_Yard_Crawling_UpsideDown_MovingLeft 

InstList_Yard_InsideTurn_UpsideDown_MovingLeft:
    dw Instruction_Yard_MovementFunctionInY 
    dw RTL_A3CF5F 
    dw Instruction_Yard_HidingInstListInY 
    dw RTL_A3CF5F 
    dw $0007 
    dw Spritemap_Yard_5A 
    dw $0004 
    dw Spritemap_Yard_5B 
    dw $0007 
    dw Spritemap_Yard_5C 
    dw Instruction_Common_GotoY 
    dw InstList_Yard_Crawling_UpsideRight_MovingDown 

InstList_Yard_InsideTurn_UpsideRight_MovingDown:
    dw Instruction_Yard_MovementFunctionInY 
    dw RTL_A3CF5F 
    dw Instruction_Yard_HidingInstListInY 
    dw RTL_A3CF5F 
    dw $0007 
    dw Spritemap_Yard_5D 
    dw $0004 
    dw Spritemap_Yard_5E 
    dw $0007 
    dw Spritemap_Yard_5F 
    dw Instruction_Common_GotoY 
    dw InstList_Yard_Crawling_UpsideUp_MovingRight 

InstList_Yard_Hiding_UpsideUp_MovingLeft:
    dw Instruction_Yard_MovementFunctionInY 
    dw Function_Yard_Movement_Hiding 
    dw $0005 
    dw Spritemap_Yard_18 
    dw $0001 
    dw Spritemap_Yard_19 
    dw Instruction_Yard_GoBack4BytesIfHidingOr50PercentChance 

InstList_Yard_Hidden_UpsideUp_MovingLeft:
    dw $0030 
    dw Spritemap_Yard_4C 
    dw $0010 
    dw Spritemap_Yard_4D 
    dw Instruction_Common_GotoY 
    dw InstList_Yard_Crawling_UpsideUp_MovingLeft 

InstList_Yard_Hiding_UpsideDown_MovingLeft:
    dw Instruction_Yard_MovementFunctionInY 
    dw Function_Yard_Movement_Hiding 
    dw $0005 
    dw Spritemap_Yard_3C 
    dw $0001 
    dw Spritemap_Yard_3D 
    dw Instruction_Yard_GoBack4BytesIfHidingOr50PercentChance 
    dw $0030 
    dw Spritemap_Yard_64 
    dw $0010 
    dw Spritemap_Yard_65 
    dw Instruction_Common_GotoY 
    dw InstList_Yard_Crawling_UpsideDown_MovingLeft 

InstList_Yard_Hiding_UpsideDown_MovingRight:
    dw Instruction_Yard_MovementFunctionInY 
    dw Function_Yard_Movement_Hiding 
    dw $0005 
    dw Spritemap_Yard_1C 
    dw $0001 
    dw Spritemap_Yard_1D 
    dw Instruction_Yard_GoBack4BytesIfHidingOr50PercentChance 
    dw $0030 
    dw Spritemap_Yard_50 
    dw $0010 
    dw Spritemap_Yard_51 
    dw Instruction_Common_GotoY 
    dw InstList_Yard_Crawling_UpsideDown_MovingRight 

InstList_Yard_Hiding_UpsideUp_MovingRight:
    dw Instruction_Yard_MovementFunctionInY 
    dw Function_Yard_Movement_Hiding 
    dw $0005 
    dw Spritemap_Yard_38 
    dw $0001 
    dw Spritemap_Yard_39 
    dw Instruction_Yard_GoBack4BytesIfHidingOr50PercentChance 

InstList_Yard_Hidden_UpsideUp_MovingRight:
    dw $0030 
    dw Spritemap_Yard_60 
    dw $0010 
    dw Spritemap_Yard_61 
    dw Instruction_Common_GotoY 
    dw InstList_Yard_Crawling_UpsideUp_MovingRight 

InstList_Yard_Hiding_UpsideRight_MovingUp:
    dw Instruction_Yard_MovementFunctionInY 
    dw Function_Yard_Movement_Hiding 
    dw $0005 
    dw Spritemap_Yard_1E 
    dw $0001 
    dw Spritemap_Yard_1F 
    dw Instruction_Yard_GoBack4BytesIfHidingOr50PercentChance 
    dw $0030 
    dw Spritemap_Yard_4E 
    dw $0010 
    dw Spritemap_Yard_4F 
    dw Instruction_Common_GotoY 
    dw InstList_Yard_Crawling_UpsideRight_MovingUp 

InstList_Yard_Hiding_UpsideLeft_MovingUp:
    dw Instruction_Yard_MovementFunctionInY 
    dw Function_Yard_Movement_Hiding 
    dw $0005 
    dw Spritemap_Yard_3E 
    dw $0001 
    dw Spritemap_Yard_3F 
    dw Instruction_Yard_GoBack4BytesIfHidingOr50PercentChance 
    dw $0030 
    dw Spritemap_Yard_62 
    dw $0010 
    dw Spritemap_Yard_63 
    dw Instruction_Common_GotoY 
    dw InstList_Yard_Crawling_UpsideLeft_MovingUp 

InstList_Yard_Hiding_UpsideLeft_MovingDown:
    dw Instruction_Yard_MovementFunctionInY 
    dw Function_Yard_Movement_Hiding 
    dw $0005 
    dw Spritemap_Yard_1A 
    dw $0001 
    dw Spritemap_Yard_1B 
    dw Instruction_Yard_GoBack4BytesIfHidingOr50PercentChance 
    dw $0030 
    dw Spritemap_Yard_52 
    dw $0010 
    dw Spritemap_Yard_53 
    dw Instruction_Common_GotoY 
    dw InstList_Yard_Crawling_UpsideLeft_MovingDown 

InstList_Yard_Hiding_UpsideRight_MovingDown:
    dw Instruction_Yard_MovementFunctionInY 
    dw Function_Yard_Movement_Hiding 
    dw $0005 
    dw Spritemap_Yard_3A 
    dw $0001 
    dw Spritemap_Yard_3B 
    dw Instruction_Yard_GoBack4BytesIfHidingOr50PercentChance 
    dw $0030 
    dw Spritemap_Yard_66 
    dw $0010 
    dw Spritemap_Yard_67 
    dw Instruction_Common_GotoY 
    dw InstList_Yard_Crawling_UpsideRight_MovingDown 

InstList_Yard_Airborne_FacingLeft_0:
    dw Instruction_Yard_MovementFunctionInY 
    dw Function_Yard_Movement_Airborne 
    dw $0003 
    dw Spritemap_Yard_1F 

InstList_Yard_Airborne_FacingLeft_1:
    dw $0003 
    dw Spritemap_Yard_1B 
    dw $0003 
    dw Spritemap_Yard_1D 
    dw $0003 
    dw Spritemap_Yard_1F 
    dw Instruction_Common_GotoY 
    dw InstList_Yard_Airborne_FacingLeft_1 

InstList_Yard_Airborne_FacingRight_0:
    dw Instruction_Yard_MovementFunctionInY 
    dw Function_Yard_Movement_Airborne 
    dw $0003 
    dw Spritemap_Yard_3F 

InstList_Yard_Airborne_FacingRight_1:
    dw $0003 
    dw Spritemap_Yard_3B 
    dw $0003 
    dw Spritemap_Yard_3D 
    dw $0003 
    dw Spritemap_Yard_3F 
    dw Instruction_Common_GotoY 
    dw InstList_Yard_Airborne_FacingRight_1 

Instruction_Yard_MovementFunctionInY:
    LDA.W $0000,Y 
    STA.W $0FB2,X 
    INY #2
    RTL 


Instruction_Yard_HidingInstListInY:
    LDA.W $0000,Y 
    STA.W $0FAE,X 
    INY #2
    RTL 


Instruction_Yard_DirectionInY:
    PHY 
    LDA.W $0000,Y 
    STA.L $7E780E,X 
    ASL #3
    TAY 
    LDA.W YardDirectionData_airborneFacingDirection,Y 
    STA.L $000FAC,X 
    PLY 
    INY #2
    RTL 


Instruction_Yard_MoveByPixelsInY:
    LDA.W $0000,Y 
    CLC 
    ADC.W $0F7A,X 
    STA.W $0F7A,X 
    LDA.W $0002,Y 
    CLC 
    ADC.W $0F7E,X 
    STA.W $0F7E,X 
    INY #4
    RTL 


Instruction_Yard_GoBack4BytesIfHidingOr50PercentChance:
    LDA.L $7E7810,X 
    CMP.W #$0002 
    BEQ .goBack 
    JSL.L GenerateRandomNumber 
    BIT.W #$0001 
    BNE .goBack 
    RTL 


.goBack:
    TYA 
    SEC 
    SBC.W #$0006 
    TAY 
    RTL 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Instruction_Yard_A3CC92:
    NOP 
    PHY 
    JSL.L UNUSED_MakeYardFaceSamus_A3D315 
    BCC .notTurningAround 
    PLY 
    LDA.W $0F92,X 
    TAY 
    RTL 


.notTurningAround:
    PLY 
    RTL 
endif ; !FEATURE_KEEP_UNREFERENCED


YardCrawlingSpeeds:
    dw $0040,$0080,$00C0,$0100,$0140,$0180,$01C0,$0200 
    dw $0240,$0280,$02C0,$0300,$0340,$0380,$0400,$0440 
    dw $0540,$0580,$05C0,$0600,$0640,$0680,$06C0,$0700 
    dw $0740,$0780,$07C0,$0800,$0840,$0880,$0800,$0000 

YardTurnData_upsideUp_movingLeft:
    dw $FFF9,$0000 
    dw InstList_Yard_OutsideTurn_UpsideUp_MovingLeft 
    dw InstList_Yard_InsideTurn_UpsideUp_MovingLeft 

YardTurnData_upsideLeft_movingDown:
    dw $0000,$0007 
    dw InstList_Yard_OutsideTurn_UpsideLeft_MovingDown 
    dw InstList_Yard_InsideTurn_UpsideLeft_MovingDown 

YardTurnData_upsideDown_movingRight:
    dw $0007,$0000 
    dw InstList_Yard_OutsideTurn_UpsideDown_MovingRight 
    dw InstList_Yard_InsideTurn_UpsideDown_MovingRight 

YardTurnData_upsideRight_movingUp:
    dw $0000,$FFF9 
    dw InstList_Yard_OutsideTurn_UpsideRight_MovingUp 
    dw InstList_Yard_InsideTurn_UpsideRight_MovingUp 

YardTurnData_upsideUp_movingRight:
    dw $0007,$0000 
    dw InstList_Yard_OutsideTurn_UpsideUp_MovingRight 
    dw InstList_Yard_InsideTurn_UpsideUp_MovingRight 

YardTurnData_upsideRight_movingDown:
    dw $0000,$0007 
    dw InstList_Yard_OutsideTurn_UpsideRight_MovingDown 
    dw InstList_Yard_InsideTurn_UpsideRight_MovingDown 

YardTurnData_upsideDown_movingLeft:
    dw $FFF9,$0000 
    dw InstList_Yard_OutsideTurn_UpsideDown_MovingLeft 
    dw InstList_Yard_InsideTurn_UpsideDown_MovingLeft 

YardTurnData_upsideLeft_movingUp:
    dw $0000,$FFF9 
    dw InstList_Yard_OutsideTurn_UpsideLeft_MovingUp 
    dw InstList_Yard_InsideTurn_UpsideLeft_MovingUp 

YardTurnData_upsideUp_movingLeft_noTurnTransition:
    dw $0000,$0000 
    dw InstList_Yard_Crawling_UpsideLeft_MovingDown 
    dw InstList_Yard_Crawling_UpsideRight_MovingUp 

YardTurnData_upsideDown_movingRight_noTurnTransition:
    dw $0000,$0000 
    dw InstList_Yard_Crawling_UpsideRight_MovingUp 
    dw InstList_Yard_Crawling_UpsideLeft_MovingDown 

YardTurnData_upsideUp_movingRight_noTurnTransition:
    dw $0000,$0000 
    dw InstList_Yard_Crawling_UpsideRight_MovingDown 
    dw InstList_Yard_Crawling_UpsideLeft_MovingUp 

YardTurnData_upsideDown_movingLeft_noTurnTransition:
    dw $0000,$0000 
    dw InstList_Yard_Crawling_UpsideLeft_MovingUp 
    dw InstList_Yard_Crawling_UpsideRight_MovingDown 

YardDirectionData_crawlingInstList:
    dw InstList_Yard_Crawling_UpsideRight_MovingUp 

YardDirectionData_movementDirection:
    dw $0002 

YardDirectionData_hidingInstList:
    dw InstList_Yard_Hiding_UpsideRight_MovingUp 

YardDirectionData_airborneFacingDirection:
    dw $0000 
    dw InstList_Yard_Crawling_UpsideRight_MovingDown 
    dw $0003 
    dw InstList_Yard_Hiding_UpsideRight_MovingDown 
    dw $0001 
    dw InstList_Yard_Crawling_UpsideLeft_MovingUp 
    dw $0002 
    dw InstList_Yard_Hiding_UpsideLeft_MovingUp 
    dw $0001 
    dw InstList_Yard_Crawling_UpsideLeft_MovingDown 
    dw $0003 
    dw InstList_Yard_Hiding_UpsideLeft_MovingDown 
    dw $0000 
    dw InstList_Yard_Crawling_UpsideDown_MovingLeft 
    dw $0000 
    dw InstList_Yard_Hiding_UpsideDown_MovingLeft 
    dw $0001 
    dw InstList_Yard_Crawling_UpsideDown_MovingRight 
    dw $0001 
    dw InstList_Yard_Hiding_UpsideDown_MovingRight 
    dw $0000 
    dw InstList_Yard_Crawling_UpsideUp_MovingLeft 
    dw $0000 
    dw InstList_Yard_Hiding_UpsideUp_MovingLeft 
    dw $0000 
    dw InstList_Yard_Crawling_UpsideUp_MovingRight 
    dw $0001 
    dw InstList_Yard_Hiding_UpsideUp_MovingRight 
    dw $0001 

YardCrawlingVelocitySigns_X:
    dw $FFFF,$0001 

YardCrawlingVelocitySigns_Y:
    dw $FFFF,$0001,$FFFF,$0001,$0000,$0000,$0000,$0000 
    dw $FFFF,$0001,$0000,$0000,$0000,$0000,$FFFF,$0001 
    dw $FFFF,$0001,$0000,$0000,$FFFF,$0001,$FFFF,$0001 
    dw $0000,$0000,$0000,$0000,$0000,$0000 

YardOppositeDirection:
    dw $0001,$0000,$0003,$0002,$0005,$0004,$0007,$0006 

YardCrawlingMovementFunctions:
    dw Function_Yard_Movement_Crawling_UpsideDown_MovingLeft 
    dw Function_Yard_Movement_Crawling_UpsideRight_MovingDown 
    dw Function_Yard_Movement_Crawling_UpsideLeft_MovingUp 
    dw Function_Yard_Movement_Crawling_UpsideLeft_MovingDown 
    dw Function_Yard_Movement_Crawling_UpsideRight_MovingUp 
    dw Function_Yard_Movement_Crawling_UpsideDown_MovingRight 
    dw Function_Yard_Movement_Crawling_UpsideUp_MovingLeft 
    dw Function_Yard_Movement_Crawling_UpsideUp_MovingRight 

InitAI_Yard:
    LDX.W $0E54 
    LDA.W #RTL_A3CF5F 
    STA.W $0FB2,X 
    LDA.W #Spritemap_CommonA3_Nothing 
    STA.W $0F8E,X 
    LDA.W #$0001 
    STA.W $0F94,X 
    LDA.W $0F92,X 
    ASL #3
    TAY 
    LDA.W YardDirectionData_crawlingInstList,Y 
    STA.W $0F92,X 
    LDA.W YardDirectionData_movementDirection,Y 
    ORA.W $0F86,X 
    STA.W $0F86,X 
    LDA.W YardDirectionData_hidingInstList,Y 
    STA.W $0FAE,X 
    LDA.W YardDirectionData_airborneFacingDirection,Y 
    STA.W $0FAC,X 
    LDA.W #$0000 
    STA.L $7E7810,X 
    LDA.W $0FB4,X 
    STA.L $7E780C,X ; fallthrough to SetYardCrawlingVelocities

SetYardCrawlingVelocities:
    LDA.W YardCrawlingVelocitySigns_X,Y 
    STA.B $12 
    LDA.W YardCrawlingVelocitySigns_X+2,Y 
    STA.B $14 
    LDA.W YardCrawlingVelocitySigns_Y,Y 
    STA.B $16 
    LDA.W YardCrawlingVelocitySigns_Y+2,Y 
    STA.B $18 
    LDA.W $0FB4,X 
    ASL A 
    TAY 
    LDA.W YardCrawlingSpeeds,Y 
    EOR.B $12 
    CLC 
    ADC.B $14 
    STA.W $0FA8,X 
    LDA.W YardCrawlingSpeeds,Y 
    EOR.B $16 
    CLC 
    ADC.B $18 
    STA.W $0FAA,X 
    RTL 


SetYardCrawlingMovementFunction:
    LDA.L $7E780E,X 
    ASL A 
    TAY 
    LDA.W YardCrawlingMovementFunctions,Y 
    STA.W $0FB2,X 
    RTL 


MainAI_Yard:
    LDX.W $0E54 
    JSR.W DropYardIfSuperMissileQuake 
    JSR.W HandleYardHiding 
    JSR.W DetermineIfYardHitboxIsSolidToSamus 
    JMP.W ($0FB2,X) 


DropYardIfSuperMissileQuake:
    LDA.L $7E7810,X 
    CMP.W #$0003 
    BEQ .return 
    CMP.W #$0004 
    BEQ .return 
    CMP.W #$0005 
    BEQ .return 
    LDA.W $1840 
    CMP.W #$001E 
    BNE .return 
    LDA.W $183E 
    CMP.W #$0014 
    BNE .return 
    JSR.W DropYard 

.return:
    RTS 


HandleYardHiding:
    LDA.L $7E7810,X 
    CMP.W #$0001 
    BEQ .return1 
    CMP.W #$0003 
    BEQ .return1 
    CMP.W #$0004 
    BEQ .return1 
    CMP.W #$0005 
    BEQ .return1 
    LDA.W $0F7E,X 
    SEC 
    SBC.W $0AFA 
    CMP.W #$FFA0 
    BMI .crawl 
    LDA.W $0F7A,X 
    CMP.W $0AF6 
    BMI .leftOfSamus 
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0008 
    BNE .crawl 
    BRA + 


.leftOfSamus:
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0004 
    BNE .crawl 

  + LDA.L $7E7810,X 
    CMP.W #$0002 
    BEQ .return0 
    LDA.W $0FAE,X 
    CMP.W #RTL_A3CF5F 
    BEQ .crawl 
    STA.W $0F92,X 
    LDA.W #Spritemap_CommonA3_Nothing 
    STA.W $0F8E,X 
    LDA.W #$0001 
    STA.W $0F94,X 
    STZ.W $0F90,X 
    LDA.W #$0002 
    STA.L $7E7810,X 

.return0:
    RTS 


.crawl:
    LDA.W #$0000 
    STA.L $7E7810,X 

.return1:
    RTS 


DetermineIfYardHitboxIsSolidToSamus:
    LDA.W $0FB2,X 
    CMP.W #Function_Yard_Movement_Airborne 
    BEQ .notSolid 
    LDA.L $7E7810,X 
    CMP.W #$0001 
    BEQ .aggressivelyCrawling 
    LDA.W $0B3C 
    BNE .notSolid 
    LDA.L $7E7810,X 
    CMP.W #$0002 
    BEQ .solid 
    CMP.W #$0003 
    BEQ .notSolid 
    CMP.W #$0005 
    BNE .solid 
    BRA .notSolid 


.aggressivelyCrawling:
    LDA.W $0B3C 
    BNE .notSolid 
    LDA.W $0FB2,X 
    CMP.W #RTL_A3CF5F 
    BEQ .solid 
    BRA .notSolid 


.solid:
    LDA.W $0F86,X 
    ORA.W #$8000 
    STA.W $0F86,X 
    RTS 


.notSolid:
    LDA.W $0F86,X 
    AND.W #$7FFF 
    STA.W $0F86,X 
    RTS 


RTL_A3CF5F:
    RTL 


Function_Yard_Movement_Hiding:
    LDA.L $7E780E,X 
    CMP.W #$0004 
    BCS .notMovingVertically 
    STZ.B $12 
    STZ.B $14 
    LDA.W $0FA8,X 
    JSR.W SignedMath_A3CF8F 
    JSL.L CheckForHorizontalSolidBlockCollision 
    BCC .noCollision 
    RTL 


.notMovingVertically:
    STZ.B $12 
    STZ.B $14 
    LDA.W $0FAA,X 
    JSR.W SignedMath_A3CF8F 
    JSL.L CheckForVerticalSolidBlockCollision 
    BCC .noCollision 
    RTL 


.noCollision:
    JSR.W DropYard 
    RTL 


SignedMath_A3CF8F:
    BPL + 
    DEC.B $14 

  + STA.B $13 
    LDA.B $14 
    BPL .add7 
    SEC 
    SBC.W #$0007 
    BRA + 


.add7:
    CLC 
    ADC.W #$0007 

  + STA.B $14 
    RTS 


Function_Yard_Movement_Crawling_UpsideUp_MovingLeft:
    LDA.L $7E780A,X 
    BNE .upsideUpMovingLeftNoTurnTransition 
    LDY.W #YardTurnData_upsideUp_movingLeft 
    BRA .gotoCrawlingMovementHorizontal 


.upsideUpMovingLeftNoTurnTransition:
    LDY.W #YardTurnData_upsideUp_movingLeft_noTurnTransition 

.gotoCrawlingMovementHorizontal:
    JMP.W YardCrawlingMovement_Horizontal 


Function_Yard_Movement_Crawling_UpsideLeft_MovingDown:
    LDY.W #YardTurnData_upsideLeft_movingDown 
    JMP.W YardCrawlingMovement_Vertical 


Function_Yard_Movement_Crawling_UpsideDown_MovingRight:
    LDA.L $7E780A,X 
    BNE .upsideDownMovingRightNoTurnTransition 
    LDY.W #YardTurnData_upsideDown_movingRight 
    BRA .gotoCrawlingMovementHorizontal 


.upsideDownMovingRightNoTurnTransition:
    LDY.W #YardTurnData_upsideDown_movingRight_noTurnTransition 

.gotoCrawlingMovementHorizontal:
    JMP.W YardCrawlingMovement_Horizontal 


Function_Yard_Movement_Crawling_UpsideRight_MovingUp:
    LDY.W #YardTurnData_upsideRight_movingUp 
    JMP.W YardCrawlingMovement_Vertical 


Function_Yard_Movement_Crawling_UpsideUp_MovingRight:
    LDA.L $7E780A,X 
    BNE .upsideUpMovingRightNoTurnTransition 
    LDY.W #YardTurnData_upsideUp_movingRight 
    BRA .gotoCrawlingMovementHorizontal 


.upsideUpMovingRightNoTurnTransition:
    LDY.W #YardTurnData_upsideUp_movingRight_noTurnTransition 

.gotoCrawlingMovementHorizontal:
    JMP.W YardCrawlingMovement_Horizontal 


Function_Yard_Movement_Crawling_UpsideRight_MovingDown:
    LDY.W #YardTurnData_upsideRight_movingDown 
    JMP.W YardCrawlingMovement_Vertical 


Function_Yard_Movement_Crawling_UpsideDown_MovingLeft:
    LDA.L $7E780A,X 
    BNE .upsideDownMovingLeftNoTurnTransition 
    LDY.W #YardTurnData_upsideDown_movingLeft 
    BRA .gotoCrawlingMovementHorizontal 


.upsideDownMovingLeftNoTurnTransition:
    LDY.W #YardTurnData_upsideDown_movingLeft_noTurnTransition 

.gotoCrawlingMovementHorizontal:
    JMP.W YardCrawlingMovement_Horizontal 


Function_Yard_Movement_Crawling_UpsideLeft_MovingUp:
    LDY.W #YardTurnData_upsideLeft_movingUp 
    JMP.W YardCrawlingMovement_Vertical 


YardCrawlingMovement_Vertical:
    JSR.W MoveYardAheadForOutsideTurnCheck 
    STZ.B $12 
    STZ.B $14 
    LDA.W $0FA8,X 
    BPL + 
    DEC.B $14 

  + STA.B $13 
    LDA.B $14 
    BPL .inc 
    DEC A 
    BRA + 


.inc:
    INC A 

  + STA.B $14 
    PHY 
    JSL.L MoveEnemyRightBy_14_12_ProcessSlopes 
    PLY 
    JSR.W MoveYardBackForOutsideTurnCheck 
    BCC .outsideTurn 
    LDA.W #$0000 
    STA.W $0FB0,X 
    PHY 
    JSL.L AlignEnemyYPositionWIthNonSquareSlope 
    PLY 
    JSR.W HandleTurnTransitionDisabling 
    STZ.B $12 
    STZ.B $14 
    LDA.W $0FAA,X 
    BPL + 
    DEC.B $14 

  + STA.B $13 
    PHY 
    JSL.L MoveEnemyDownBy_14_12 
    PLY 
    BCS .insideTurn 
    RTL 


.insideTurn:
    LDA.W $0FA8,X 
    EOR.W #$FFFF 
    INC A 
    STA.W $0FA8,X 
    LDA.W $0006,Y 
    JSR.W SetYardInstList_DisableTurnTransition 
    RTL 


.outsideTurn:
    LDA.W $0FB0,X 
    INC A 
    STA.W $0FB0,X 
    CMP.W #$0004 
    BMI .lessThan4Turns 
    JSR.W DropYard 
    RTL 


.lessThan4Turns:
    LDA.W $0FAA,X 
    EOR.W #$FFFF 
    INC A 
    STA.W $0FAA,X 
    LDA.W $0004,Y 
    JSR.W SetYardInstList_DisableTurnTransition 
    RTL 


YardCrawlingMovement_Horizontal:
    JSR.W MoveYardAheadForOutsideTurnCheck 
    STZ.B $12 
    STZ.B $14 
    LDA.W $0FAA,X 
    BPL + 
    DEC.B $14 

  + STA.B $13 
    LDA.B $14 
    BPL .inc 
    DEC A 
    BRA + 


.inc:
    INC A 

  + STA.B $14 
    PHY 
    JSL.L MoveEnemyDownBy_14_12 
    PLY 
    JSR.W MoveYardBackForOutsideTurnCheck 
    BCC .outsideTurn 
    LDA.W #$0000 
    STA.W $0FB0,X 
    STZ.B $12 
    STZ.B $14 
    LDA.W $0FA8,X 
    BPL + 
    DEC.B $14 

  + STA.B $13 
    PHY 
    JSL.L MoveEnemyRightBy_14_12_ProcessSlopes 
    PLY 
    BCS .insideTurn 
    JSL.L AlignEnemyYPositionWIthNonSquareSlope 
    JSR.W HandleTurnTransitionDisabling 
    RTL 


.insideTurn:
    LDA.W $0FAA,X 
    EOR.W #$FFFF 
    INC A 
    STA.W $0FAA,X 
    LDA.W $0006,Y 
    JSR.W SetYardInstList_DisableTurnTransition 
    RTL 


.outsideTurn:
    LDA.W $0FB0,X 
    INC A 
    STA.W $0FB0,X 
    CMP.W #$0004 
    BMI .lessThan4Turns 
    JSR.W DropYard 
    RTL 


.lessThan4Turns:
    LDA.W $0FA8,X 
    EOR.W #$FFFF 
    INC A 
    STA.W $0FA8,X 
    LDA.W $0004,Y 
    JSR.W SetYardInstList_DisableTurnTransition 
    RTL 


MoveYardAheadForOutsideTurnCheck:
    LDA.W $0F7A,X 
    CLC 
    ADC.W $0000,Y 
    STA.W $0F7A,X 
    LDA.W $0F7E,X 
    CLC 
    ADC.W $0002,Y 
    STA.W $0F7E,X 
    RTS 


MoveYardBackForOutsideTurnCheck:
    PHP 
    LDA.W $0F7A,X 
    SEC 
    SBC.W $0000,Y 
    STA.W $0F7A,X 
    LDA.W $0F7E,X 
    SEC 
    SBC.W $0002,Y 
    STA.W $0F7E,X 
    PLP 
    RTS 


HandleTurnTransitionDisabling:
    BCS .resetTurnTransitionDisableCounter 
    LDA.L $7E7808,X 
    INC A 
    CMP.W #$0010 
    BCS .enableTurnTransition 
    STA.L $7E7808,X 
    RTS 


.resetTurnTransitionDisableCounter:
    LDA.W #$0001 
    STA.L $7E780A,X 
    LDA.W #$0000 
    STA.L $7E7808,X 
    RTS 


.enableTurnTransition:
    LDA.W #$0000 
    STA.L $7E780A,X 
    RTS 


SetYardInstList_DisableTurnTransition:
    STA.W $0F92,X 
    LDA.W #$0001 
    STA.W $0F94,X 
    LDA.W #$0001 
    STA.L $7E780A,X 
    LDA.W #$0000 
    STA.L $7E7808,X 
    RTS 


DropYard:
    PHY 
    LDA.L $7E7810,X 
    CMP.W #$0003 
    BEQ .return 
    LDA.W #$0003 
    STA.L $7E7810,X 
    LDA.W #Function_Yard_Movement_Airborne 
    STA.W $0FB2,X 
    LDA.W $0FAC,X 
    ASL #2
    TAY 
    LDA.W .airbornePointers,Y 
    STA.W $0F92,X 
    LDA.W .hidingPointers,Y 
    STA.W $0FAE,X 
    LDA.W #$0001 
    STA.W $0F94,X 
    STZ.W $0F90,X 
    LDA.W #$0000 
    STA.L $7E7804,X 
    STA.L $7E7806,X 
    STA.L $7E7800,X 
    STA.L $7E7802,X 

.return:
    PLY 
    RTS 


.airbornePointers:
    dw InstList_Yard_Airborne_FacingLeft_0 

.hidingPointers:
    dw InstList_Yard_Hidden_UpsideUp_MovingLeft 
    dw InstList_Yard_Airborne_FacingRight_0 
    dw InstList_Yard_Hidden_UpsideUp_MovingRight 

Function_Yard_Movement_Airborne:
    LDA.L $7E7810,X 
    CMP.W #$0003 
    BEQ .XMovementEnd 
    LDA.L $7E7804,X 
    STA.B $12 
    LDA.L $7E7806,X 
    STA.B $14 
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes 
    BCS .hitWall 
    LDA.L $7E7806,X 
    BMI .right 
    LDA.W #$1000 
    EOR.W #$FFFF 
    INC A 
    STA.B $16 
    LDA.W #$0000 
    EOR.W #$FFFF 
    STA.B $18 
    BRA + 


.right:
    LDA.W #$1000 
    STA.B $16 
    LDA.W #$0000 
    STA.B $18 

  + CLC 
    LDA.L $7E7804,X 
    ADC.B $16 
    STA.L $7E7804,X 
    LDA.L $7E7806,X 
    ADC.B $18 
    BEQ .gotoXMovementEnd 
    STA.L $7E7806,X 

.gotoXMovementEnd:
    BRA .XMovementEnd 


.hitWall:
    LDA.L $7E7804,X 
    EOR.W #$FFFF 
    INC A 
    STA.L $7E7804,X 
    LDA.L $7E7806,X 
    EOR.W #$FFFF 
    INC A 
    STA.L $7E7806,X 
    LDA.W #$0001 
    STA.L $7E8000,X 
    LDA.W #$0070 
    JSL.L QueueSound_Lib2_Max3 
    JMP.W .XMovementEnd ; >_<


.XMovementEnd:
    LDA.L $7E7800,X 
    STA.B $12 
    LDA.L $7E7802,X 
    STA.B $14 
    JSL.L MoveEnemyDownBy_14_12 
    BCS .collidedVertically 
    CLC 
    LDA.L $7E7800,X 
    ADC.W #$2000 
    STA.L $7E7800,X 
    LDA.L $7E7802,X 
    ADC.W #$0000 
    CMP.W #$0004 
    BPL .return 
    STA.L $7E7802,X 

.return:
    RTL 


.collidedVertically:
    LDA.L $7E7802,X 
    BMI + 
    CMP.W #$0003 
    BMI .land 

  + LDA.L $7E7800,X 
    EOR.W #$FFFF 
    INC A 
    STA.L $7E7800,X 
    LDA.L $7E7802,X 
    EOR.W #$FFFF 
    INC A 
    STA.L $7E7802,X 
    LDA.W #$0000 
    STA.L $7E8000,X 
    RTL 


.land:
    LDA.W #$0000 
    STA.L $7E7806,X 
    STA.L $7E7804,X 
    STA.L $7E7802,X 
    STA.L $7E7800,X 
    STA.W $0FB0,X 
    STA.L $7E7808,X 
    LDA.W #$0001 
    STA.L $7E780A,X 
    LDA.L $7E7810,X 
    CMP.W #$0003 
    BEQ .dropped 
    LDA.W #$0001 
    STA.L $7E7810,X 
    LDA.W #$0008 
    STA.W $0FB4,X 
    JSL.L MakeYardFaceSamusHorizontally 
    JSR.W SetYardAirborneInstList 
    BRA + 


.dropped:
    LDA.W #$0000 
    STA.L $7E7810,X 

  + LDA.W $0F86,X 
    AND.W #$FFFC 
    ORA.W $0FAC,X 
    STA.W $0F86,X 
    JSL.L InitAI_Crawlers_Common 
    LDA.W #RTL_A3CF5F 
    STA.W $0FB2,X 
    LDA.W $0FAE,X 
    STA.W $0F92,X 
    LDA.W #$0001 
    STA.W $0F94,X 
    STZ.W $0F90,X 
    RTL 


SetYardAirborneInstList:
    LDA.W $0FAC,X 
    ASL #2
    TAY 
    LDA.W .airbornePointers,Y 
    STA.W $0F92,X 
    LDA.W .hidingPointers,Y 
    STA.W $0FAE,X 
    RTS 


.airbornePointers:
    dw InstList_Yard_Airborne_FacingLeft_0 

.hidingPointers:
    dw InstList_Yard_Hidden_UpsideUp_MovingLeft 
    dw InstList_Yard_Airborne_FacingRight_0 
    dw InstList_Yard_Hidden_UpsideUp_MovingRight 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_MakeYardFaceSamus_A3D315:
    LDA.L $7E780A,X 
    BEQ .turningEnabled 
    CLC 
    RTL 


.turningEnabled:
    LDA.L $7E780E,X 
    CMP.W #$0004 
    BCS MakeYardFaceSamusHorizontally 
    BIT.W #$0001 
    BNE .movingDown 
    LDA.W $0F7E,X 
    CMP.W $0AFA 
    BCC TurnYardAround 
    CLC 
    RTL 


.movingDown:
    LDA.W $0F7E,X 
    CMP.W $0AFA 
    BCS TurnYardAround 
    RTL 
endif ; !FEATURE_KEEP_UNREFERENCED


MakeYardFaceSamusHorizontally:
    LDA.W $0FAC,X 
    BNE .facingRight 
    LDA.W $0F7A,X 
    CMP.W $0AF6 
    BCC TurnYardAround 
    CLC 
    RTL 


.facingRight:
    LDA.W $0F7A,X 
    CMP.W $0AF6 
    BCS TurnYardAround 
    RTL 


TurnYardAround:
    LDA.L $7E7810,X 
    CMP.W #$0002 
    BEQ .failed 
    LDA.W $0FB2,X 
    CMP.W #RTL_A3CF5F 
    BEQ .failed 
    LDA.L $7E780E,X 
    ASL A 
    TAY 
    LDA.W YardOppositeDirection,Y 
    STA.L $7E780E,X 
    ASL #3
    TAY 
    LDA.W YardDirectionData_crawlingInstList,Y 
    STA.W $0F92,X 
    LDA.W $0F86,X 
    AND.W #$FFFC 
    ORA.W YardDirectionData_movementDirection,Y 
    STA.W $0F86,X 
    LDA.W YardDirectionData_hidingInstList,Y 
    STA.W $0FAE,X 
    LDA.W YardDirectionData_airborneFacingDirection,Y 
    STA.W $0FAC,X 
    JSL.L SetYardCrawlingVelocities 
    JSL.L SetYardCrawlingMovementFunction 
    LDA.W #$0001 
    STA.L $7E780A,X 
    LDA.W #$0000 
    STA.L $7E7808,X 
    SEC 
    RTL 


.failed:
    CLC 
    RTL 


EnemyTouch_Yard:
    LDX.W $0E54 
    LDA.L $7E7810,X 
    CMP.W #$0001 
    BNE .notAggressiveCrawling 
    LDA.W $0FB2,X 
    CMP.W #RTL_A3CF5F 
    BEQ .notAggressiveCrawling 
    JSR.W CheckIfSamusIsDirectingTowardsYard 
    BCC .notAggressiveCrawling 
    BRA .notKicked 


.notAggressiveCrawling:
    LDA.W $0FB2,X 
    CMP.W #Function_Yard_Movement_Airborne 
    BEQ .kicked 
    LDA.W $0B3C 
    BEQ .notKicked 

.kicked:
    JSR.W KickYardIntoAIr 
    LDA.W $0FB2,X 
    CMP.W #Function_Yard_Movement_Airborne 
    BNE .returnUpper 
    LDA.W #$0070 
    JSL.L QueueSound_Lib2_Max3 

.returnUpper:
    RTL 


.notKicked:
    LDA.W $0FB2,X 
    CMP.W #RTL_A3CF5F 
    BEQ .returnLower 
    LDA.L $7E7810,X 
    CMP.W #$0004 
    BEQ .returnLower 
    CMP.W #$0003 
    BEQ .returnLower 
    JSL.L CommonA3_NormalEnemyTouchAI 
    LDA.L $7E780C,X 
    STA.W $0FB4,X 
    LDA.L $7E7810,X 
    CMP.W #$0000 
    BEQ .setIdleCrawling 
    JSL.L TurnYardAround 

.setIdleCrawling:
    LDA.W #$0000 
    STA.L $7E7810,X 

.returnLower:
    RTL 


CheckIfSamusIsDirectingTowardsYard:
    LDA.B $8B 
    AND.W #$0300 
    XBA 
    DEC A 
    STA.B $12 
    LDA.W $0FAC,X 
    AND.W #$0001 
    STA.B $14 
    LDA.B $12 
    BNE .notPressingRight 
    LDA.B $14 
    BEQ .towardsYard 
    BRA .awayFromYard 


.notPressingRight:
    LDA.B $14 
    BEQ .awayFromYard 
    BRA .towardsYard 


.awayFromYard:
    CLC 
    RTS 


.towardsYard:
    SEC 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_CheckIfYardIsMovingTheDirectionSamusIsFacing_A3D446:
    LDA.W $0FA8,X 
    BPL .positiveXVelocity 
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0008 
    BNE .movingDirectionSamusFacing 
    BRA .movingOppositeDirection 


.positiveXVelocity:
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0004 
    BNE .movingDirectionSamusFacing 
    BRA .movingOppositeDirection 


.movingDirectionSamusFacing:
    CLC 
    RTS 


.movingOppositeDirection:
    SEC 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


EnemyShot_Yard:
    LDX.W $0E54 
    LDA.W $18A6 
    ASL A 
    TAY 
    LDA.W $0C18,Y 
    AND.W #$FF00 
    CMP.W #$0300 
    BEQ .normalShotAI 
    CMP.W #$0500 
    BNE .shot 

.normalShotAI:
    JSL.L CommonA3_NormalEnemyShotAI 
    RTL 


.shot:
    LDA.L $7E7810,X 
    CMP.W #$0003 
    BEQ .playSFX 
    CMP.W #$0004 
    BEQ .playSFX 
    JSR.W ShootYardIntoAir 

.playSFX:
    LDA.W #$0070 
    JSL.L QueueSound_Lib2_Max3 
    RTL 


KickYardIntoAIr:
    LDA.W #$0004 
    STA.L $7E7810,X 
    LDA.W #Function_Yard_Movement_Airborne 
    STA.W $0FB2,X 
    LDA.W $0FAC,X 
    ASL #2
    TAY 
    LDA.W .airbornePointers,Y 
    STA.W $0F92,X 
    LDA.W .hidingPointers,Y 
    STA.W $0FAE,X 
    LDA.W #$0001 
    STA.W $0F94,X 
    STZ.W $0F90,X 
    LDA.W $0DA4 
    STA.L $7E7804,X 
    LDA.W $0DA2 
    STA.L $7E7806,X 
    CMP.W #$0010 
    BCC + 
    LDA.W #$000F 

  + ASL #2
    TAY 
    LDA.W .YSubVelocity,Y 
    STA.L $7E7800,X 
    LDA.W .YVelocity,Y 
    STA.L $7E7802,X 
    LDA.W $0A1E 
    BIT.W #$0004 
    BEQ .return 
    LDA.L $7E7804,X 
    EOR.W #$FFFF 
    INC A 
    STA.L $7E7804,X 
    LDA.L $7E7806,X 
    EOR.W #$FFFF 
    INC A 
    STA.L $7E7806,X 

.return:
    RTS 


.airbornePointers:
    dw InstList_Yard_Airborne_FacingLeft_0 

.hidingPointers:
    dw InstList_Yard_Hidden_UpsideUp_MovingLeft 
    dw InstList_Yard_Airborne_FacingRight_0 
    dw InstList_Yard_Hidden_UpsideUp_MovingRight 

.YSubVelocity:
    dw $0000 

.YVelocity:
    dw $FFFD,$A000,$FFFD,$4000,$FFFD,$0000,$FFFC,$A000 
    dw $FFFC,$4000,$FFFC,$0000,$FFFB,$A000,$FFFB,$4000 
    dw $FFFB,$0000,$FFFA,$A000,$FFFA,$4000,$FFFA,$0000 
    dw $FFF9,$A000,$FFF9,$4000,$FFF9,$0000,$FFF8 

ShootYardIntoAir:
    PHY 
    LDA.W #$0005 
    STA.L $7E7810,X 
    LDA.W #Function_Yard_Movement_Airborne 
    STA.W $0FB2,X 
    LDA.W $0FAC,X 
    ASL #2
    TAY 
    LDA.W .airbornePointers,Y 
    STA.W $0F92,X 
    LDA.W .hidingPointers,Y 
    STA.W $0FAE,X 
    LDA.W #$0001 
    STA.W $0F94,X 
    STZ.W $0F90,X 
    LDA.W #$FFFF 
    STA.L $7E7802,X 
    LDA.W $0A1E 
    AND.W #$00FF 
    CMP.W #$0004 
    BNE .SamusFacingRight 
    LDA.W #$FFFF 
    STA.L $7E7806,X 
    BRA .return 


.SamusFacingRight:
    LDA.W #$0001 
    STA.L $7E7806,X 

.return:
    PLY 
    RTS 


.airbornePointers:
    dw InstList_Yard_Airborne_FacingLeft_0 

.hidingPointers:
    dw InstList_Yard_Hidden_UpsideUp_MovingLeft 
    dw InstList_Yard_Airborne_FacingRight_0 
    dw InstList_Yard_Hidden_UpsideUp_MovingRight 

Spritemap_Yard_0:
    dw $0002,$C3FB 
    db $F6 
    dw $2120,$C3F5 
    db $F8 
    dw $2100 

Spritemap_Yard_1:
    dw $0002,$C3FC 
    db $F6 
    dw $2120,$C3F4 
    db $F8 
    dw $2102 

Spritemap_Yard_2:
    dw $0002,$C3FB 
    db $F5 
    dw $2120,$C3F5 
    db $F8 
    dw $2104 

Spritemap_Yard_3:
    dw $0002,$C3F9 
    db $F6 
    dw $2120,$C3F4 
    db $FE 
    dw $2106 

Spritemap_Yard_4:
    dw $0002,$C3F2 
    db $F6 
    dw $2122,$C3F0 
    db $01 
    dw $2108 

Spritemap_Yard_5:
    dw $0002,$C3EE 
    db $F8 
    dw $2124,$C3F0 
    db $00 
    dw $2108 

Spritemap_Yard_6:
    dw $0002,$C3F6 
    db $F5 
    dw $2124,$C3F8 
    db $FB 
    dw $2108 

Spritemap_Yard_7:
    dw $0002,$C3F6 
    db $F4 
    dw $2124,$C3F8 
    db $FC 
    dw $210A 

Spritemap_Yard_8:
    dw $0002,$C3F5 
    db $F5 
    dw $2124,$C3F8 
    db $FB 
    dw $210C 

Spritemap_Yard_9:
    dw $0002,$C3F6 
    db $F7 
    dw $2124,$C3FE 
    db $FC 
    dw $210E 

Spritemap_Yard_A:
    dw $0002,$C3F6 
    db $FE 
    dw $2126,$C201 
    db $00 
    dw $E100 

Spritemap_Yard_B:
    dw $0002,$C3F8 
    db $02 
    dw $E120,$C200 
    db $00 
    dw $E100 

Spritemap_Yard_C:
    dw $0002,$C3F5 
    db $FA 
    dw $E120,$C3FB 
    db $F8 
    dw $E100 

Spritemap_Yard_D:
    dw $0002,$C3F4 
    db $FA 
    dw $E120,$C3FC 
    db $F8 
    dw $E102 

Spritemap_Yard_E:
    dw $0002,$C3F5 
    db $FB 
    dw $E120,$C3FB 
    db $F8 
    dw $E104 

Spritemap_Yard_F:
    dw $0002,$C3F7 
    db $FA 
    dw $E120,$C3FC 
    db $F2 
    dw $E106 

Spritemap_Yard_10:
    dw $0002,$C3FE 
    db $FA 
    dw $E122,$C200 
    db $EF 
    dw $E108 

Spritemap_Yard_11:
    dw $0002,$C202 
    db $F8 
    dw $E124,$C200 
    db $F0 
    dw $E108 

Spritemap_Yard_12:
    dw $0002,$C3FA 
    db $FB 
    dw $E124,$C3F8 
    db $F5 
    dw $E108 

Spritemap_Yard_13:
    dw $0002,$C3FA 
    db $FC 
    dw $E124,$C3F8 
    db $F4 
    dw $E10A 

Spritemap_Yard_14:
    dw $0002,$C3FB 
    db $FB 
    dw $E124,$C3F8 
    db $F5 
    dw $E10C 

Spritemap_Yard_15:
    dw $0002,$C3FA 
    db $F9 
    dw $E124,$C3F2 
    db $F4 
    dw $E10E 

Spritemap_Yard_16:
    dw $0002,$C3FA 
    db $F2 
    dw $E126,$C3EF 
    db $F0 
    dw $2100 

Spritemap_Yard_17:
    dw $0002,$C3F8 
    db $EE 
    dw $2120,$C3F0 
    db $F0 
    dw $2100 

Spritemap_Yard_18:
    dw $0002,$C3FB 
    db $F7 
    dw $2120,$C3F9 
    db $F8 
    dw $2100 

Spritemap_Yard_19:
    dw $0001,$C3F8 
    db $F8 
    dw $2122 

Spritemap_Yard_1A:
    dw $0002,$C3F7 
    db $F6 
    dw $2124,$C3F8 
    db $F8 
    dw $2108 

Spritemap_Yard_1B:
    dw $0001,$C3F8 
    db $F8 
    dw $2126 

Spritemap_Yard_1C:
    dw $0002,$C3F6 
    db $F9 
    dw $E120,$C3F8 
    db $F8 
    dw $E100 

Spritemap_Yard_1D:
    dw $0001,$C3F8 
    db $F8 
    dw $E122 

Spritemap_Yard_1E:
    dw $0002,$C3F9 
    db $FA 
    dw $6124,$C3F8 
    db $F8 
    dw $E108 

Spritemap_Yard_1F:
    dw $0001,$C3F8 
    db $F8 
    dw $E126 

Spritemap_Yard_20:
    dw $0002,$C3F5 
    db $F6 
    dw $6120,$C3FB 
    db $F8 
    dw $6100 

Spritemap_Yard_21:
    dw $0002,$C3F4 
    db $F6 
    dw $6120,$C3FC 
    db $F8 
    dw $6102 

Spritemap_Yard_22:
    dw $0002,$C3F5 
    db $F5 
    dw $6120,$C3FB 
    db $F8 
    dw $6104 

Spritemap_Yard_23:
    dw $0002,$C3F7 
    db $F6 
    dw $6120,$C3FC 
    db $FE 
    dw $6106 

Spritemap_Yard_24:
    dw $0002,$C3FE 
    db $F6 
    dw $6122,$C200 
    db $01 
    dw $6108 

Spritemap_Yard_25:
    dw $0002,$C202 
    db $F8 
    dw $6124,$C200 
    db $00 
    dw $6108 

Spritemap_Yard_26:
    dw $0002,$C3FA 
    db $F5 
    dw $6124,$C3F8 
    db $FB 
    dw $6108 

Spritemap_Yard_27:
    dw $0002,$C3FA 
    db $F4 
    dw $6124,$C3F8 
    db $FC 
    dw $610A 

Spritemap_Yard_28:
    dw $0002,$C3FB 
    db $F5 
    dw $6124,$C3F8 
    db $FB 
    dw $610C 

Spritemap_Yard_29:
    dw $0002,$C3FA 
    db $F7 
    dw $6124,$C3F2 
    db $FC 
    dw $610E 

Spritemap_Yard_2A:
    dw $0002,$C3FA 
    db $FE 
    dw $6126,$C3EF 
    db $00 
    dw $A100 

Spritemap_Yard_2B:
    dw $0002,$C3F8 
    db $02 
    dw $A120,$C3F0 
    db $00 
    dw $A100 

Spritemap_Yard_2C:
    dw $0002,$C3FB 
    db $FA 
    dw $A120,$C3F5 
    db $F8 
    dw $A100 

Spritemap_Yard_2D:
    dw $0002,$C3FC 
    db $FA 
    dw $A120,$C3F4 
    db $F8 
    dw $A102 

Spritemap_Yard_2E:
    dw $0002,$C3FB 
    db $FB 
    dw $A120,$C3F5 
    db $F8 
    dw $A104 

Spritemap_Yard_2F:
    dw $0002,$C3F9 
    db $FA 
    dw $A120,$C3F4 
    db $F2 
    dw $A106 

Spritemap_Yard_30:
    dw $0002,$C3F2 
    db $FA 
    dw $A122,$C3F0 
    db $EF 
    dw $A108 

Spritemap_Yard_31:
    dw $0002,$C3EE 
    db $F8 
    dw $A124,$C3F0 
    db $F0 
    dw $A108 

Spritemap_Yard_32:
    dw $0002,$C3F6 
    db $FB 
    dw $A124,$C3F8 
    db $F5 
    dw $A108 

Spritemap_Yard_33:
    dw $0002,$C3F6 
    db $FC 
    dw $A124,$C3F8 
    db $F4 
    dw $A10A 

Spritemap_Yard_34:
    dw $0002,$C3F5 
    db $FB 
    dw $A124,$C3F8 
    db $F5 
    dw $A10C 

Spritemap_Yard_35:
    dw $0002,$C3F7 
    db $F9 
    dw $A124,$C3FF 
    db $F4 
    dw $A10E 

Spritemap_Yard_36:
    dw $0002,$C3F6 
    db $F2 
    dw $A126,$C201 
    db $F0 
    dw $6100 

Spritemap_Yard_37:
    dw $0002,$C3F8 
    db $EE 
    dw $6120,$C200 
    db $F0 
    dw $6100 

Spritemap_Yard_38:
    dw $0002,$C3F5 
    db $F7 
    dw $6120,$C3F7 
    db $F8 
    dw $6100 

Spritemap_Yard_39:
    dw $0001,$C3F8 
    db $F8 
    dw $6122 

Spritemap_Yard_3A:
    dw $0002,$C3F9 
    db $F6 
    dw $6124,$C3F8 
    db $F8 
    dw $6108 

Spritemap_Yard_3B:
    dw $0001,$C3F8 
    db $F8 
    dw $6126 

Spritemap_Yard_3C:
    dw $0002,$C3FA 
    db $F9 
    dw $A120,$C3F8 
    db $F8 
    dw $A100 

Spritemap_Yard_3D:
    dw $0001,$C3F8 
    db $F8 
    dw $A122 

Spritemap_Yard_3E:
    dw $0002,$C3F7 
    db $FA 
    dw $A124,$C3F8 
    db $F8 
    dw $A108 

Spritemap_Yard_3F:
    dw $0001,$C3F8 
    db $F8 
    dw $A126 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Yard_A3D884:
    dw $0002,$C3FB 
    db $F6 
    dw $2120,$C3F5 
    db $F8 
    dw $2100 
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_Yard_40:
    dw $0002,$C3F5 
    db $F8 
    dw $2128,$C3FB 
    db $F7 
    dw $2120 

Spritemap_Yard_41:
    dw $0002,$C3FA 
    db $FA 
    dw $E126,$C3F8 
    db $F7 
    dw $E108 

Spritemap_Yard_42:
    dw $0002,$C3FA 
    db $FA 
    dw $E124,$C3F8 
    db $F6 
    dw $E108 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Yard_A3D8B4:
    dw $0002,$C3FA 
    db $FB 
    dw $E124,$C3F8 
    db $F5 
    dw $E108 
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_Yard_43:
    dw $0002,$C3F8 
    db $F5 
    dw $E12A,$C3F9 
    db $FB 
    dw $E124 

Spritemap_Yard_44:
    dw $0002,$C3F6 
    db $FA 
    dw $2126,$C3F9 
    db $F8 
    dw $E100 

Spritemap_Yard_45:
    dw $0002,$C3F6 
    db $FA 
    dw $E120,$C3FA 
    db $F8 
    dw $E100 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Yard_A3D8E4:
    dw $0002,$C3F5 
    db $FA 
    dw $E120,$C3FB 
    db $F8 
    dw $E100 
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_Yard_46:
    dw $0002,$C3FB 
    db $F8 
    dw $E128,$C3F5 
    db $F9 
    dw $E120 

Spritemap_Yard_47:
    dw $0002,$C3F6 
    db $F6 
    dw $2126,$C3F8 
    db $F9 
    dw $2108 

Spritemap_Yard_48:
    dw $0002,$C3F6 
    db $F6 
    dw $2124,$C3F8 
    db $FA 
    dw $2108 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Yard_A3D914:
    dw $0002,$C3F6 
    db $F5 
    dw $2124,$C3F8 
    db $FB 
    dw $2108 
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_Yard_49:
    dw $0002,$C3F8 
    db $FB 
    dw $212A,$C3F7 
    db $F5 
    dw $2124 

Spritemap_Yard_4A:
    dw $0002,$C3FA 
    db $F6 
    dw $2122,$C3F7 
    db $F8 
    dw $2100 

Spritemap_Yard_4B:
    dw $0002,$C3FB 
    db $F6 
    dw $2120,$C3F7 
    db $F8 
    dw $2100 

Spritemap_Yard_4C:
    dw $0001,$C3F8 
    db $F8 
    dw $2122 

Spritemap_Yard_4D:
    dw $0002,$C3F8 
    db $F7 
    dw $2120,$C3F6 
    db $F8 
    dw $2100 

Spritemap_Yard_4E:
    dw $0001,$C3F8 
    db $F8 
    dw $E126 

Spritemap_Yard_4F:
    dw $0002,$C3F9 
    db $F8 
    dw $E124,$C3F8 
    db $F6 
    dw $E108 

Spritemap_Yard_50:
    dw $0001,$C3F8 
    db $F8 
    dw $E122 

Spritemap_Yard_51:
    dw $0002,$C3F8 
    db $F9 
    dw $E120,$C3FA 
    db $F8 
    dw $E100 

Spritemap_Yard_52:
    dw $0001,$C3F8 
    db $F8 
    dw $2126 

Spritemap_Yard_53:
    dw $0002,$C3F7 
    db $F8 
    dw $2124,$C3F8 
    db $FA 
    dw $2108 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Yard_A3D990:
    dw $0002,$C3F5 
    db $F6 
    dw $6120,$C3FB 
    db $F8 
    dw $6100 
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_Yard_54:
    dw $0002,$C3FB 
    db $F8 
    dw $6128,$C3F5 
    db $F7 
    dw $6120 

Spritemap_Yard_55:
    dw $0002,$C3F6 
    db $FA 
    dw $A126,$C3F8 
    db $F7 
    dw $A108 

Spritemap_Yard_56:
    dw $0002,$C3F6 
    db $FA 
    dw $A124,$C3F8 
    db $F6 
    dw $A108 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Yard_A3D9C0:
    dw $0002,$C3F6 
    db $FB 
    dw $A124,$C3F8 
    db $F5 
    dw $A108 
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_Yard_57:
    dw $0002,$C3F8 
    db $F5 
    dw $A12A,$C3F7 
    db $FB 
    dw $A124 

Spritemap_Yard_58:
    dw $0002,$C3FA 
    db $FA 
    dw $6126,$C3F7 
    db $F8 
    dw $A100 

Spritemap_Yard_59:
    dw $0002,$C3FA 
    db $FA 
    dw $A120,$C3F6 
    db $F8 
    dw $A100 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Yard_A3D9F0:
    dw $0002,$C3FB 
    db $FA 
    dw $A120,$C3F5 
    db $F8 
    dw $A100 
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_Yard_5A:
    dw $0002,$C3F5 
    db $F8 
    dw $A128,$C3FB 
    db $F9 
    dw $A120 

Spritemap_Yard_5B:
    dw $0002,$C3FA 
    db $F6 
    dw $6126,$C3F8 
    db $F9 
    dw $6108 

Spritemap_Yard_5C:
    dw $0002,$C3FA 
    db $F6 
    dw $6124,$C3F8 
    db $FA 
    dw $6108 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Yard_A3DA20:
    dw $0002,$C3FA 
    db $F5 
    dw $6124,$C3F8 
    db $FB 
    dw $6108 
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_Yard_5D:
    dw $0002,$C3F8 
    db $FB 
    dw $612A,$C3F9 
    db $F5 
    dw $6124 

Spritemap_Yard_5E:
    dw $0002,$C3F6 
    db $F6 
    dw $6122,$C3F9 
    db $F8 
    dw $6100 

Spritemap_Yard_5F:
    dw $0002,$C3F5 
    db $F6 
    dw $6120,$C3F9 
    db $F8 
    dw $6100 

Spritemap_Yard_60:
    dw $0001,$C3F8 
    db $F8 
    dw $6122 

Spritemap_Yard_61:
    dw $0002,$C3F8 
    db $F7 
    dw $6120,$C3FA 
    db $F8 
    dw $6100 

Spritemap_Yard_62:
    dw $0001,$C3F8 
    db $F8 
    dw $A126 

Spritemap_Yard_63:
    dw $0002,$C3F7 
    db $F8 
    dw $A124,$C3F8 
    db $F6 
    dw $A108 

Spritemap_Yard_64:
    dw $0001,$C3F8 
    db $F8 
    dw $A122 

Spritemap_Yard_65:
    dw $0002,$C3F8 
    db $F9 
    dw $A120,$C3F6 
    db $F8 
    dw $A100 

Spritemap_Yard_66:
    dw $0001,$C3F8 
    db $F8 
    dw $6126 

Spritemap_Yard_67:
    dw $0002,$C3F9 
    db $F8 
    dw $6124,$C3F8 
    db $FA 
    dw $6108 

Palette_Reflec:
    dw $3800,$7FBD,$5EB5,$1884,$0800,$777B,$5EB5,$45EF 
    dw $2D29,$241F,$1C17,$142F,$0C47,$06E1,$6BF5,$05A1 

ReflecPaletteCycleColors:
    dw $241F,$1C17,$142F,$0C47,$211F,$18D8,$10B1,$086A 
    dw $221F,$1999,$1113,$08AD,$1EFF,$163A,$0D95,$04D0 
    dw $1BFF,$12FB,$09F7,$00F3,$1BFF,$12FB,$09F7,$00F3 
    dw $1EFF,$163A,$0D95,$04D0,$221F,$1999,$1113,$08AD 
    dw $211F,$18D8,$10B1,$086A,$241F,$1C17,$142F,$0C47 

EnemyGraphicsDrawnHook_Reflec_PeriodicallyCyclePalettes:
    LDA.W $0797 
    BNE .return 
    LDA.W $1798 
    DEC A 
    STA.W $1798 
    BNE .return 
    LDA.W #$0010 
    STA.W $1798 
    LDA.W $1794 
    TAX 
    LDA.W $1796 
    ASL #3
    TAY 
    LDA.W #$0004 
    STA.W $060B 

.loop:
    LDA.W ReflecPaletteCycleColors,Y 
    STA.L $7EC112,X 
    INY #2
    INX #2
    DEC.W $060B 
    BNE .loop 
    LDA.W $1796 
    INC A 
    AND.W #$0007 
    STA.W $1796 

.return:
    RTL 


InstList_Reflec_FacingLeft:
    dw Instruction_Reflec_Param2InY 
    dw $0000,$0040 
    dw Spritemap_Reflec_0 
    dw Instruction_Common_GotoY 
    dw InstList_Reflec_FacingLeft 

InstList_Reflec_FacingUpLeft:
    dw Instruction_Reflec_Param2InY 
    dw $0001,$0040 
    dw Spritemap_Reflec_1 
    dw Instruction_Common_GotoY 
    dw InstList_Reflec_FacingUpLeft 

InstList_Reflec_FacingUp:
    dw Instruction_Reflec_Param2InY 
    dw $0002,$0040 
    dw Spritemap_Reflec_2 
    dw Instruction_Common_Sleep 

InstList_Reflec_FacingUpRight:
    dw Instruction_Reflec_Param2InY 
    dw $0003,$0040 
    dw Spritemap_Reflec_3 
    dw Instruction_Common_Sleep 

InstList_Reflec_FacingRight:
    dw Instruction_Reflec_Param2InY 
    dw $0000,$0040 
    dw Spritemap_Reflec_4 
    dw Instruction_Common_Sleep 

InstList_Reflec_FacingDownRight:
    dw Instruction_Reflec_Param2InY 
    dw $0001,$0040 
    dw Spritemap_Reflec_5 
    dw Instruction_Common_Sleep 

InstList_Reflec_FacingDown:
    dw Instruction_Reflec_Param2InY 
    dw $0002,$0040 
    dw Spritemap_Reflec_6 
    dw Instruction_Common_Sleep 

InstList_Reflec_FacingDownLeft:
    dw Instruction_Reflec_Param2InY 
    dw $0003,$0040 
    dw Spritemap_Reflec_7 
    dw Instruction_Common_Sleep 

InstList_Reflec_ZeroHealth_FacingLeft:
    dw Instruction_Reflec_Param2InY 
    dw $0000,$0001 
    dw Spritemap_Reflec_0 
    dw Instruction_Common_Sleep 

InstList_Reflec_ZeroHealth_FacingUpLeft:
    dw Instruction_Reflec_Param2InY 
    dw $0001,$0001 
    dw Spritemap_Reflec_1 
    dw Instruction_Common_Sleep 

InstList_Reflec_ZeroHealth_FacingUp:
    dw Instruction_Reflec_Param2InY 
    dw $0002,$0001 
    dw Spritemap_Reflec_2 
    dw Instruction_Common_Sleep 

InstList_Reflec_ZeroHealth_FacingUpRight:
    dw Instruction_Reflec_Param2InY 
    dw $0003,$0001 
    dw Spritemap_Reflec_3 
    dw Instruction_Common_Sleep 

Instruction_Reflec_Param2InY:
    PHY 
    LDA.W $0000,Y 
    STA.W $0FB6,X 
    PLY 
    INY #2
    RTL 


InitAI_Reflec:
    LDX.W $0E54 
    LDA.W $0F86,X 
    ORA.W #$1000 
    STA.W $0F86,X 
    LDA.W $0FB4,X 
    ASL A 
    TAY 
    LDA.W .pointers,Y 
    STA.W $0F92,X 
    LDA.W #EnemyGraphicsDrawnHook_Reflec_PeriodicallyCyclePalettes 
    STA.W $178C 
    LDA.W #EnemyGraphicsDrawnHook_Reflec_PeriodicallyCyclePalettes>>16 
    STA.W $178E 
    LDA.W $0F96,X 
    ASL #4
    AND.W #$FF00 
    XBA 
    STA.W $1794 
    LDA.W #$0010 
    STA.W $1798 
    RTL 


.pointers:
    dw InstList_Reflec_FacingLeft 
    dw InstList_Reflec_FacingUpLeft 
    dw InstList_Reflec_FacingUp 
    dw InstList_Reflec_FacingUpRight 
    dw InstList_Reflec_FacingRight 
    dw InstList_Reflec_FacingDownRight 
    dw InstList_Reflec_FacingDown 
    dw InstList_Reflec_FacingDownLeft 

RTL_A3DC1B:
    RTL 


EnemyShot_Reflec:
    LDX.W $0E54 
    LDA.W $18A6 
    ASL A 
    TAY 
    LDA.W #$000A 
    STA.W $0FA0,X 
    LDA.W $0FB6,X 
    ASL #5
    STA.W $0E32 
    LDA.W $0C04,Y 
    AND.W #$000F 
    ASL A 
    CLC 
    ADC.W $0E32 
    TAX 
    STA.W $0E32 
    LDA.W ReflectedDirectionTable,X 
    CMP.W #$8000 
    BEQ + 
    LDA.W ReflectedDirectionTable,X 
    BMI .executeFunction 
    BRA .skipFunction 


.executeFunction:
    JSR.W (ReflectedDirectionTable_offsetNegatives,X) 
    LDX.W $0E32 
    LDA.W ReflectedDirectionTable,X 
    EOR.W #$FFFF 
    INC A 

.skipFunction:
    STA.W $0C04,Y 
    LDA.W $0C18,Y 
    AND.W #$7FFF 
    STA.W $0C18,Y 
    STY.B $14 
    JSL.L ProjectileReflection 
    LDA.W #$0057 
    JSL.L QueueSound_Lib2_Max6 
    RTL 


  + LDA.W $0C04,Y 
    ORA.W #$0010 
    STA.W $0C04,Y 
    LDA.W $0F8C,X 
    BEQ .return 
    JSL.L CommonA3_NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic 
    LDA.W $0F8C,X 
    BNE .return 
    LDA.W $0FB6,X 
    ASL A 
    TAY 
    LDA.W .pointers,Y 
    STA.W $0F92,X 
    LDA.W #$0001 
    STA.W $0F94,X 
    STZ.W $0F90,X 

.return:
    RTL 


.pointers:
    dw InstList_Reflec_ZeroHealth_FacingLeft 
    dw InstList_Reflec_ZeroHealth_FacingUpLeft 
    dw InstList_Reflec_ZeroHealth_FacingUp 
    dw InstList_Reflec_ZeroHealth_FacingUpRight 

ReflectedDirectionTable:
    dw $8000,$FFF8,$0007,$FFFA,$8000,$8000,$FFFD,$0002 
    dw $FFFF,$8000,$0000,$0000,$0000,$0000,$0000,$0000 
    dw $FFFE,$8000,$FFF7,$0008,$FFF9,$FFF9,$8000,$FFFB 
    dw $0003,$FFFE,$0000,$0000,$0000,$0000,$0000,$0000 
    dw $0004,$FFFD,$8000,$FFFF,$0000,$0009,$FFF8,$8000 
    dw $FFFA,$0005,$0000,$0000,$0000,$0000,$0000,$0000 
    dw $FFF9,$0006,$FFFC,$8000,$FFFE,$FFFE,$0001,$FFF7 
    dw $8000,$FFF9,$0000,$0000,$0000,$0000,$0000,$0000 

ReflectedDirectionTable_offsetNegatives:
    dw $0000,$DDAE,$0000,$DDAE,$0000,$0000,$DDCF,$0000 
    dw $DDCF,$0000,$0000,$0000,$0000,$0000,$0000,$0000 
    dw $DDF0,$0000,$DE0D,$0000,$DE2A,$DE2A,$0000,$DE47 
    dw $0000,$DDF0,$0000,$0000,$0000,$0000,$0000,$0000 
    dw $0000,$DE64,$0000,$DE85,$0000,$0000,$DE85,$0000 
    dw $DE64,$0000,$0000,$0000,$0000,$0000,$0000,$0000 
    dw $DEA6,$0000,$DEC3,$0000,$DEE0,$DEE0,$0000,$DEFD 
    dw $0000,$DEA6,$0000,$0000,$0000,$0000,$0000,$0000 

Function_Reflec_ReflectionOffset_Vertical_UpRight_DownRight:
    LDX.W $0E54 
    LDA.W $0F7A,X 
    SEC 
    SBC.W #$0008 
    STA.W $0E36 
    LDA.W $0B64,Y 
    CLC 
    ADC.W $0BB4,Y 
    CMP.W $0E36 
    BPL .return1 
    LDA.W #$0000 
    RTS 


.return1:
    LDA.W #$0001 
    RTS 


Function_Reflec_ReflectionOffset_Vertical_UpLeft_DownLeft:
    LDX.W $0E54 
    LDA.W $0F7A,X 
    CLC 
    ADC.W #$0008 
    STA.W $0E36 
    LDA.W $0B64,Y 
    SEC 
    SBC.W $0BB4,Y 
    CMP.W $0E36 
    BMI .return1 
    LDA.W #$0000 
    RTS 


.return1:
    LDA.W #$0001 
    RTS 


Function_Reflec_ReflectionOffset_UpRightDiagonal_Up:
    LDX.W $0E54 
    LDA.W $0F7A,X 
    STA.W $0E36 
    LDA.W $0B64,Y 
    CLC 
    ADC.W $0BB4,Y 
    CMP.W $0E36 
    BMI .return1 
    LDA.W #$0000 
    RTS 


.return1:
    LDA.W #$0001 
    RTS 


Function_Reflec_ReflectionOffset_UpRightDiagonal_Right:
    LDX.W $0E54 
    LDA.W $0F7E,X 
    STA.W $0E36 
    LDA.W $0B78,Y 
    SEC 
    SBC.W $0BC8,Y 
    CMP.W $0E36 
    BPL .return1 
    LDA.W #$0000 
    RTS 


.return1:
    LDA.W #$0001 
    RTS 


Function_Reflec_ReflectionOffset_UpRightDiagonal_Down:
    LDX.W $0E54 
    LDA.W $0F7A,X 
    STA.W $0E36 
    LDA.W $0B64,Y 
    SEC 
    SBC.W $0BB4,Y 
    CMP.W $0E36 
    BPL .return1 
    LDA.W #$0000 
    RTS 


.return1:
    LDA.W #$0001 
    RTS 


Function_Reflec_ReflectionOffset_UpRightDiagonal_Left:
    LDX.W $0E54 
    LDA.W $0F7E,X 
    STA.W $0E36 
    LDA.W $0B78,Y 
    CLC 
    ADC.W $0BC8,Y 
    CMP.W $0E36 
    BMI .return1 
    LDA.W #$0000 
    RTS 


.return1:
    LDA.W #$0001 
    RTS 


Function_Reflec_ReflectionOffset_Horizontal_UpRight_UpLeft:
    LDX.W $0E54 
    LDA.W $0F7E,X 
    CLC 
    ADC.W #$0008 
    STA.W $0E36 
    LDA.W $0B78,Y 
    SEC 
    SBC.W $0BC8,Y 
    CMP.W $0E36 
    BMI .return1 
    LDA.W #$0000 
    RTS 


.return1:
    LDA.W #$0001 
    RTS 


Func_Reflec_ReflectionOffset_Horizontal_DownRight_DownLeft:
    LDX.W $0E54 
    LDA.W $0F7E,X 
    SEC 
    SBC.W #$0008 
    STA.W $0E36 
    LDA.W $0B78,Y 
    CLC 
    ADC.W $0BC8,Y 
    CMP.W $0E36 
    BPL .return1 
    LDA.W #$0000 
    RTS 


.return1:
    LDA.W #$0001 
    RTS 


Function_Reflec_ReflectionOffset_DownRightDiagonal_Up:
    LDX.W $0E54 
    LDA.W $0F7A,X 
    STA.W $0E36 
    LDA.W $0B64,Y 
    SEC 
    SBC.W $0BB4,Y 
    CMP.W $0E36 
    BMI .return1 
    LDA.W #$0000 
    RTS 


.return1:
    LDA.W #$0001 
    RTS 


Function_Reflec_ReflectionOffset_DownRightDiagonal_Right:
    LDX.W $0E54 
    LDA.W $0F7E,X 
    STA.W $0E36 
    LDA.W $0B78,Y 
    CLC 
    ADC.W $0BC8,Y 
    CMP.W $0E36 
    BPL .return0 
    LDA.W #$0001 
    RTS 


.return0:
    LDA.W #$0000 
    RTS 


Function_Reflec_ReflectionOffset_DownRightDiagonal_Down:
    LDX.W $0E54 
    LDA.W $0F7A,X 
    STA.W $0E36 
    LDA.W $0B64,Y 
    SEC 
    SBC.W $0BB4,Y 
    CMP.W $0E36 
    BMI .return1 
    LDA.W #$0000 
    RTS 


.return1:
    LDA.W #$0001 
    RTS 


Function_Reflec_ReflectionOffset_DownRightDiagonal_Left:
    LDX.W $0E54 
    LDA.W $0F7E,X 
    STA.W $0E36 
    LDA.W $0B78,Y 
    SEC 
    SBC.W $0BC8,Y 
    CMP.W $0E36 
    BPL .return1 
    LDA.W #$0000 
    RTS 


.return1:
    LDA.W #$0001 
    RTS 


Spritemap_Reflec_0:
    dw $0003,$81F0 
    db $00 
    dw $610E,$81F0 
    db $F0 
    dw $210D,$81F8 
    db $F8 
    dw $2100 

Spritemap_Reflec_1:
    dw $0003,$81EA 
    db $F3 
    dw $211A,$81F2 
    db $EB 
    dw $210B,$81F8 
    db $F8 
    dw $2102 

Spritemap_Reflec_2:
    dw $0003,$81F8 
    db $F8 
    dw $2104,$8000 
    db $F1 
    dw $A118,$81F0 
    db $F1 
    dw $2108 

Spritemap_Reflec_3:
    dw $0003,$81F8 
    db $F8 
    dw $2106,$8006 
    db $F3 
    dw $611A,$81FE 
    db $EB 
    dw $610B 

Spritemap_Reflec_4:
    dw $0003,$8000 
    db $00 
    dw $210E,$8000 
    db $F0 
    dw $610D,$81F8 
    db $F8 
    dw $2100 

Spritemap_Reflec_5:
    dw $0003,$81F8 
    db $F8 
    dw $2102,$8006 
    db $FD 
    dw $E11A,$81FE 
    db $05 
    dw $E10B 

Spritemap_Reflec_6:
    dw $0003,$81F8 
    db $F8 
    dw $2104,$8000 
    db $FF 
    dw $2118,$81F0 
    db $FF 
    dw $A108 

Spritemap_Reflec_7:
    dw $0003,$81F8 
    db $F8 
    dw $2106,$81EA 
    db $FD 
    dw $A11A,$81F2 
    db $05 
    dw $A10B 

Palette_HZoomer:
    dw $3800,$7F5A,$3BE0,$2680,$0920,$4F5A,$36B5,$2610 
    dw $1DCE,$5294,$39CE,$2108,$1084,$033B,$0216,$0113 

Instruction_HZoomer_FunctionInY:
    LDA.W $0000,Y 
    STA.W $0FB2,X 
    INY #2
    RTL 


InstList_HZoomer_UpsideRight_0:
    dw Instruction_HZoomer_FunctionInY 
    dw Function_HZoomer_CrawlingVertically 

InstList_HZoomer_UpsideRight_1:
    dw $0003 
    dw Spritemap_Crawlers_UpsideRight_0 
    dw $0003 
    dw Spritemap_Crawlers_UpsideRight_1 
    dw $0003 
    dw Spritemap_Crawlers_UpsideRight_2 
    dw $0003 
    dw Spritemap_Crawlers_UpsideRight_3 
    dw $0003 
    dw Spritemap_Crawlers_UpsideRight_4 
    dw Instruction_Common_GotoY 
    dw InstList_HZoomer_UpsideRight_1 

InstList_HZoomer_UpsideLeft_0:
    dw Instruction_HZoomer_FunctionInY 
    dw Function_HZoomer_CrawlingVertically 

InstList_HZoomer_UpsideLeft_1:
    dw $0003 
    dw Spritemap_Crawlers_UpsideLeft_0 
    dw $0003 
    dw Spritemap_Crawlers_UpsideLeft_1 
    dw $0003 
    dw Spritemap_Crawlers_UpsideLeft_2 
    dw $0003 
    dw Spritemap_Crawlers_UpsideLeft_3 
    dw $0003 
    dw Spritemap_Crawlers_UpsideLeft_4 
    dw Instruction_Common_GotoY 
    dw InstList_HZoomer_UpsideLeft_1 

InstList_HZoomer_UpsideDown_0:
    dw Instruction_HZoomer_FunctionInY 
    dw Function_HZoomer_CrawlingHorizontally 

InstList_HZoomer_UpsideDown_1:
    dw $0003 
    dw Spritemap_Crawlers_UpsideDown_FacingLeft_0 
    dw $0003 
    dw Spritemap_Crawlers_UpsideDown_FacingLeft_1 
    dw $0003 
    dw Spritemap_Crawlers_UpsideDown_FacingLeft_2 
    dw $0003 
    dw Spritemap_Crawlers_UpsideDown_FacingLeft_3 
    dw $0003 
    dw Spritemap_Crawlers_UpsideDown_FacingLeft_4 
    dw Instruction_Common_GotoY 
    dw InstList_HZoomer_UpsideDown_1 

InstList_HZoomer_UpsideUp_0:
    dw Instruction_HZoomer_FunctionInY 
    dw Function_HZoomer_CrawlingHorizontally 

InstList_HZoomer_UpsideUp_1:
    dw $0003 
    dw Spritemap_Crawlers_UpsideUp_FacingRight_0 
    dw $0003 
    dw Spritemap_Crawlers_UpsideUp_FacingRight_1 
    dw $0003 
    dw Spritemap_Crawlers_UpsideUp_FacingRight_2 
    dw $0003 
    dw Spritemap_Crawlers_UpsideUp_FacingRight_3 
    dw $0003 
    dw Spritemap_Crawlers_UpsideUp_FacingRight_4 
    dw Instruction_Common_GotoY 
    dw InstList_HZoomer_UpsideUp_1 

HZoomerInitialInstListPointers:
    dw InstList_HZoomer_UpsideRight_0 
    dw InstList_HZoomer_UpsideLeft_0 
    dw InstList_HZoomer_UpsideDown_0 
    dw InstList_HZoomer_UpsideUp_0 

InitAI_HZoomer:
    LDX.W $0E54 
    LDA.W $0F92,X 
    AND.W #$0003 
    ASL A 
    TAY 
    LDA.W HZoomerInitialInstListPointers,Y 
    STA.W $0F92,X 
    LDA.W #.return 
    STA.W $0FB2,X 
    LDA.W $0FB4,X 
    ASL A 
    TAY 
    LDA.W CrawlersSpeedTable,Y 
    STA.W $0FA8,X 
    STA.W $0FAA,X 
    LDA.W $0F86,X 
    AND.W #$0003 
    BNE + 
    LDA.W $0FA8,X 
    EOR.W #$FFFF 
    INC A 
    STA.W $0FA8,X 
    RTL 


  + CMP.W #$0002 
    BNE .return 
    LDA.W $0FAA,X 
    EOR.W #$FFFF 
    INC A 
    STA.W $0FAA,X 

.return:
    RTL 


MainAI_HZoomer:
    LDX.W $0E54 
    JMP.W ($0FB2,X) 


Function_HZoomer_CrawlingVertically:
    LDA.W $1840 
    CMP.W #$001E 
    BNE .noQuake 
    LDA.W $183E 
    CMP.W #$0014 
    BNE .noQuake 
    LDA.W $0FB2,X 
    STA.L $7E7806,X 
    LDA.W #Function_Crawlers_Falling 
    STA.W $0FB2,X 

.noQuake:
    STZ.B $12 
    STZ.B $14 
    LDA.W $0FA8,X 
    BPL + 
    DEC.B $14 

  + STA.B $13 
    LDA.B $14 
    BPL .inc 
    DEC A 
    BRA .moveRight 


.inc:
    INC A 

.moveRight:
    STA.B $14 
    JSL.L MoveEnemyRightBy_14_12_ProcessSlopes 
    BCC .outsideTurn 
    LDA.W #$0000 
    STA.L $7E7808,X 
    JSL.L AlignEnemyYPositionWIthNonSquareSlope 
    STZ.B $12 
    STZ.B $14 
    LDA.W $0FAA,X 
    BPL .moveDown 
    DEC.B $14 

.moveDown:
    STA.B $13 
    JSL.L MoveEnemyDownBy_14_12 
    BCS .insideTurn 
    LDX.W $0E54 
    LDA.W $0AFA 
    SEC 
    SBC.W $0F7E,X 
    BPL .SamusRightOfZHoomer 
    LDA.W $0FAA,X 
    BMI .return 
    BRA .negateY 


.SamusRightOfZHoomer:
    LDA.W $0FAA,X 
    BPL .return 

.negateY:
    EOR.W #$FFFF 
    INC A 

.return:
    STA.W $0FAA,X 
    RTL 


.insideTurn:
    LDA.W $0FA8,X 
    EOR.W #$FFFF 
    INC A 
    STA.W $0FA8,X 
    LDY.W #InstList_HZoomer_UpsideUp_0 
    LDY.W #InstList_HZoomer_UpsideUp_0 ; >.<
    LDA.W $0FAA,X 
    BPL ..keepUp 
    LDY.W #InstList_HZoomer_UpsideDown_0 

..keepUp:
    TYA 
    STA.W $0F92,X 
    LDA.W #$0001 
    STA.W $0F94,X 
    RTL 


.outsideTurn:
    LDA.L $7E7808,X 
    INC A 
    STA.L $7E7808,X 
    CMP.W #$0004 
    BMI .notFalling 
    LDA.W $0FB2,X 
    STA.L $7E7806,X 
    LDA.W #Function_Crawlers_Falling 
    STA.W $0FB2,X 
    RTL 


.notFalling:
    LDA.W $0FAA,X 
    EOR.W #$FFFF 
    INC A 
    STA.W $0FAA,X 
    LDY.W #InstList_HZoomer_UpsideUp_0 
    LDA.W $0FAA,X 
    BPL .keepUp 
    LDY.W #InstList_HZoomer_UpsideDown_0 

.keepUp:
    TYA 
    STA.W $0F92,X 
    LDA.W #$0001 
    STA.W $0F94,X 
    RTL 


Function_HZoomer_CrawlingHorizontally:
    LDA.W $1840 
    CMP.W #$001E 
    BNE .noQuake 
    LDA.W $183E 
    CMP.W #$0014 
    BNE .noQuake 
    LDA.W $0FB2,X 
    STA.L $7E7806,X 
    LDA.W #Function_Crawlers_Falling 
    STA.W $0FB2,X 

.noQuake:
    STZ.B $12 
    STZ.B $14 
    LDA.W $0FAA,X 
    BPL + 
    DEC.B $14 

  + STA.B $13 
    LDA.B $14 
    BPL .inc 
    DEC A 
    BRA .moveDown 


.inc:
    INC A 

.moveDown:
    STA.B $14 
    JSL.L MoveEnemyDownBy_14_12 
    BCC .outsideTurn 
    LDA.W #$0000 
    STA.L $7E7808,X 
    STZ.B $12 
    STZ.B $14 
    LDA.W $0FA8,X 
    BPL .moveRight 
    DEC.B $14 

.moveRight:
    STA.B $13 
    JSL.L MoveEnemyRightBy_14_12_ProcessSlopes 
    BCS .insideTurn 
    JSL.L AlignEnemyYPositionWIthNonSquareSlope 
    LDX.W $0E54 
    LDA.W $0AF6 
    SEC 
    SBC.W $0F7A,X 
    BPL .SamusToTheRight 
    LDA.W $0FA8,X 
    BMI .return 
    BRA .negate 


.SamusToTheRight:
    LDA.W $0FA8,X 
    BPL .return 

.negate:
    EOR.W #$FFFF 
    INC A 

.return:
    STA.W $0FA8,X 
    RTL 


.insideTurn:
    LDA.W $0FAA,X 
    EOR.W #$FFFF 
    INC A 
    STA.W $0FAA,X 
    LDY.W #InstList_HZoomer_UpsideLeft_0 
    LDA.W $0FA8,X 
    BPL .keepLeft 
    LDY.W #InstList_HZoomer_UpsideRight_0 

.keepLeft:
    TYA 
    STA.W $0F92,X 
    LDA.W #$0001 
    STA.W $0F94,X 
    RTL 


.outsideTurn:
    LDA.L $7E7808,X 
    INC A 
    STA.L $7E7808,X 
    CMP.W #$0004 
    BMI .notFalling 
    LDA.W $0FB2,X 
    STA.L $7E7806,X 
    LDA.W #Function_Crawlers_Falling 
    STA.W $0FB2,X 
    RTL 


.notFalling:
    LDA.W $0FA8,X 
    EOR.W #$FFFF 
    INC A 
    STA.W $0FA8,X 
    LDY.W #InstList_HZoomer_UpsideLeft_0 
    LDA.W $0FA8,X 
    BPL ..keepLeft 
    LDY.W #InstList_HZoomer_UpsideRight_0 

..keepLeft:
    TYA 
    STA.W $0F92,X 
    LDA.W #$0001 
    STA.W $0F94,X 
    RTL 


Palette_Zeela:
    dw $3800,$3F5A,$2E50,$00E5,$0063,$3AB3,$220E,$1169 
    dw $0927,$03FF,$02F7,$0210,$0108,$7FFF,$0299,$0170 

InstList_Zeela_Zoomer_UpsideRight_0:
    dw Instruction_Crawlers_FunctionInY 
    dw Function_Crawlers_CrawlingVertically 

InstList_Zeela_Zoomer_UpsideRight_1:
    dw $0003 
    dw Spritemap_Crawlers_UpsideRight_0 
    dw $0003 
    dw Spritemap_Crawlers_UpsideRight_1 
    dw $0003 
    dw Spritemap_Crawlers_UpsideRight_2 
    dw $0003 
    dw Spritemap_Crawlers_UpsideRight_3 
    dw $0003 
    dw Spritemap_Crawlers_UpsideRight_4 
    dw Instruction_Common_GotoY 
    dw InstList_Zeela_Zoomer_UpsideRight_1 

InstList_Zeela_Zoomer_UpsideLeft_0:
    dw Instruction_Crawlers_FunctionInY 
    dw Function_Crawlers_CrawlingVertically 

InstList_Zeela_Zoomer_UpsideLeft_1:
    dw $0003 
    dw Spritemap_Crawlers_UpsideLeft_0 
    dw $0003 
    dw Spritemap_Crawlers_UpsideLeft_1 
    dw $0003 
    dw Spritemap_Crawlers_UpsideLeft_2 
    dw $0003 
    dw Spritemap_Crawlers_UpsideLeft_3 
    dw $0003 
    dw Spritemap_Crawlers_UpsideLeft_4 
    dw Instruction_Common_GotoY 
    dw InstList_Zeela_Zoomer_UpsideLeft_1 

InstList_Zeela_Zoomer_UpsideDown_0:
    dw Instruction_Crawlers_FunctionInY 
    dw Function_Crawlers_CrawlingHorizontally 

InstList_Zeela_Zoomer_UpsideDown_1:
    dw $0003 
    dw Spritemap_Crawlers_UpsideDown_FacingLeft_0 
    dw $0003 
    dw Spritemap_Crawlers_UpsideDown_FacingLeft_1 
    dw $0003 
    dw Spritemap_Crawlers_UpsideDown_FacingLeft_2 
    dw $0003 
    dw Spritemap_Crawlers_UpsideDown_FacingLeft_3 
    dw $0003 
    dw Spritemap_Crawlers_UpsideDown_FacingLeft_4 
    dw Instruction_Common_GotoY 
    dw InstList_Zeela_Zoomer_UpsideDown_1 

InstList_Zeela_Zoomer_UpsideUp_0:
    dw Instruction_Crawlers_FunctionInY 
    dw Function_Crawlers_CrawlingHorizontally 

InstList_Zeela_Zoomer_UpsideUp_1:
    dw $0003 
    dw Spritemap_Crawlers_UpsideUp_FacingRight_0 
    dw $0003 
    dw Spritemap_Crawlers_UpsideUp_FacingRight_1 
    dw $0003 
    dw Spritemap_Crawlers_UpsideUp_FacingRight_2 
    dw $0003 
    dw Spritemap_Crawlers_UpsideUp_FacingRight_3 
    dw $0003 
    dw Spritemap_Crawlers_UpsideUp_FacingRight_4 
    dw Instruction_Common_GotoY 
    dw InstList_Zeela_Zoomer_UpsideUp_1 

InitialInstListPointers_Crawlers:
    dw InstList_Zeela_Zoomer_UpsideRight_0 
    dw InstList_Zeela_Zoomer_UpsideLeft_0 
    dw InstList_Zeela_Zoomer_UpsideDown_0 
    dw InstList_Zeela_Zoomer_UpsideUp_0 

InitAI_Zeela:
    LDX.W $0E54 
    LDA.W $0F92,X 
    AND.W #$0003 
    ASL A 
    TAY 
    LDA.W InitialInstListPointers_Crawlers,Y 
    STA.W $0F92,X 
    JMP.W InitAI_Crawlers_Common 


Spritemap_Crawlers_UpsideUp_FacingRight_0:
    dw $0004,$0002 
    db $00 
    dw $2121,$01F6 
    db $00 
    dw $2120,$8000 
    db $F8 
    dw $2102,$81F0 
    db $F8 
    dw $2100 

Spritemap_Crawlers_UpsideUp_FacingRight_1:
    dw $0004,$0002 
    db $00 
    dw $2123,$01F6 
    db $00 
    dw $2122,$8000 
    db $F7 
    dw $2102,$81F0 
    db $F7 
    dw $2100 

Spritemap_Crawlers_UpsideUp_FacingRight_2:
    dw $0004,$0002 
    db $00 
    dw $2125,$01F6 
    db $00 
    dw $2124,$81F0 
    db $F7 
    dw $6102,$8000 
    db $F7 
    dw $6100 

Spritemap_Crawlers_UpsideUp_FacingRight_3:
    dw $0004,$0002 
    db $00 
    dw $2127,$01F6 
    db $00 
    dw $2126,$81F0 
    db $F7 
    dw $6102,$8000 
    db $F7 
    dw $6100 

Spritemap_Crawlers_UpsideUp_FacingRight_4:
    dw $0004,$0002 
    db $00 
    dw $2129,$01F6 
    db $00 
    dw $2128,$8000 
    db $F8 
    dw $2102,$81F0 
    db $F8 
    dw $2100 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Crawlers_UpsideUp_FacingLeft_A3E356:
    dw $0004,$01F5 
    db $00 
    dw $6121,$0001 
    db $00 
    dw $6120,$81EF 
    db $F8 
    dw $6102,$81FF 
    db $F8 
    dw $6100 

UNUSED_Spritemap_Crawlers_UpsideUp_FacingLeft_A3E36C:
    dw $0004,$01F5 
    db $00 
    dw $6123,$0001 
    db $00 
    dw $6122,$81EF 
    db $F7 
    dw $6102,$81FF 
    db $F7 
    dw $6100 

UNUSED_Spritemap_Crawlers_UpsideUp_FacingLeft_A3E382:
    dw $0004,$01F5 
    db $00 
    dw $6125,$0001 
    db $00 
    dw $6124,$81FF 
    db $F7 
    dw $2102,$81EF 
    db $F7 
    dw $2100 

UNUSED_Spritemap_Crawlers_UpsideUp_FacingLeft_A3E398:
    dw $0004,$01F5 
    db $00 
    dw $6127,$0001 
    db $00 
    dw $6126,$81FF 
    db $F7 
    dw $2102,$81EF 
    db $F7 
    dw $2100 

UNUSED_Spritemap_Crawlers_UpsideUp_FacingLeft_A3E3AE:
    dw $0004,$01F5 
    db $00 
    dw $6129,$0001 
    db $00 
    dw $6128,$81EF 
    db $F8 
    dw $6102,$81FF 
    db $F8 
    dw $6100 
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_Crawlers_UpsideLeft_0:
    dw $0004,$0000 
    db $F6 
    dw $2108,$0000 
    db $02 
    dw $2118,$81F8 
    db $00 
    dw $2106,$81F8 
    db $F0 
    dw $2104 

Spritemap_Crawlers_UpsideLeft_1:
    dw $0004,$0000 
    db $F6 
    dw $2109,$0000 
    db $02 
    dw $2119,$81F7 
    db $00 
    dw $2106,$81F7 
    db $F0 
    dw $2104 

Spritemap_Crawlers_UpsideLeft_2:
    dw $0004,$0000 
    db $F6 
    dw $210A,$0000 
    db $02 
    dw $211A,$81F7 
    db $F0 
    dw $A106,$81F7 
    db $00 
    dw $A104 

Spritemap_Crawlers_UpsideLeft_3:
    dw $0004,$0000 
    db $F6 
    dw $210B,$0000 
    db $02 
    dw $211B,$81F7 
    db $F0 
    dw $A106,$81F7 
    db $00 
    dw $A104 

Spritemap_Crawlers_UpsideLeft_4:
    dw $0004,$0000 
    db $F6 
    dw $210C,$0000 
    db $02 
    dw $211C,$81F8 
    db $00 
    dw $2106,$81F8 
    db $F0 
    dw $2104 

Spritemap_Crawlers_UpsideDown_FacingLeft_0:
    dw $0004,$0002 
    db $F8 
    dw $A121,$01F6 
    db $F8 
    dw $A120,$8000 
    db $F8 
    dw $A102,$81F0 
    db $F8 
    dw $A100 

Spritemap_Crawlers_UpsideDown_FacingLeft_1:
    dw $0004,$0002 
    db $F7 
    dw $A123,$01F6 
    db $F7 
    dw $A122,$8000 
    db $F9 
    dw $A102,$81F0 
    db $F9 
    dw $A100 

Spritemap_Crawlers_UpsideDown_FacingLeft_2:
    dw $0004,$0002 
    db $F7 
    dw $A125,$01F6 
    db $F7 
    dw $A124,$81F0 
    db $F9 
    dw $E102,$8000 
    db $F9 
    dw $E100 

Spritemap_Crawlers_UpsideDown_FacingLeft_3:
    dw $0004,$0002 
    db $F7 
    dw $A127,$01F6 
    db $F7 
    dw $A126,$81F0 
    db $F9 
    dw $E102,$8000 
    db $F9 
    dw $E100 

Spritemap_Crawlers_UpsideDown_FacingLeft_4:
    dw $0004,$0002 
    db $F8 
    dw $A129,$01F6 
    db $F8 
    dw $A128,$8000 
    db $F8 
    dw $A102,$81F0 
    db $F8 
    dw $A100 

Spritemap_Crawlers_UpsideDown_FacingRight_0:
    dw $0004,$01F5 
    db $F8 
    dw $E121,$0001 
    db $F8 
    dw $E120,$81EF 
    db $F8 
    dw $E102,$81FF 
    db $F8 
    dw $E100 

Spritemap_Crawlers_UpsideDown_FacingRight_1:
    dw $0004,$01F5 
    db $F7 
    dw $E123,$0001 
    db $F7 
    dw $E122,$81EF 
    db $F9 
    dw $E102,$81FF 
    db $F9 
    dw $E100 

Spritemap_Crawlers_UpsideDown_FacingRight_2:
    dw $0004,$01F5 
    db $F7 
    dw $E125,$0001 
    db $F7 
    dw $E124,$81FF 
    db $F9 
    dw $A102,$81EF 
    db $F9 
    dw $A100 

Spritemap_Crawlers_UpsideDown_FacingRight_3:
    dw $0004,$01F5 
    db $F7 
    dw $E127,$0001 
    db $F7 
    dw $E126,$81FF 
    db $F9 
    dw $A102,$81EF 
    db $F9 
    dw $A100 

Spritemap_Crawlers_UpsideDown_FacingRight_4:
    dw $0004,$01F5 
    db $F8 
    dw $E129,$0001 
    db $F8 
    dw $E128,$81EF 
    db $F8 
    dw $E102,$81FF 
    db $F8 
    dw $E100 

Spritemap_Crawlers_UpsideRight_0:
    dw $0004,$01F8 
    db $F6 
    dw $6108,$01F8 
    db $02 
    dw $6118,$81F8 
    db $00 
    dw $6106,$81F8 
    db $F0 
    dw $6104 

Spritemap_Crawlers_UpsideRight_1:
    dw $0004,$01F7 
    db $F6 
    dw $6109,$01F7 
    db $02 
    dw $6119,$81F9 
    db $00 
    dw $6106,$81F9 
    db $F0 
    dw $6104 

Spritemap_Crawlers_UpsideRight_2:
    dw $0004,$01F7 
    db $F6 
    dw $610A,$01F7 
    db $02 
    dw $611A,$81F9 
    db $F0 
    dw $E106,$81F9 
    db $00 
    dw $E104 

Spritemap_Crawlers_UpsideRight_3:
    dw $0004,$01F7 
    db $F6 
    dw $610B,$01F7 
    db $02 
    dw $611B,$81F9 
    db $F0 
    dw $E106,$81F9 
    db $00 
    dw $E104 

Spritemap_Crawlers_UpsideRight_4:
    dw $0004,$01F8 
    db $F6 
    dw $610C,$01F8 
    db $02 
    dw $611C,$81F8 
    db $00 
    dw $6106,$81F8 
    db $F0 
    dw $6104 

Palette_Sova:
    dw $3800,$02FF,$01BF,$000F,$0008,$01BF,$011B,$00BA 
    dw $0011,$7FFF,$039C,$0237,$00D1,$3BE0,$2680,$1580 

InitAI_Sova:
    LDX.W $0E54 
    LDA.W $0F92,X 
    AND.W #$0003 
    ASL A 
    TAY 
    LDA.W InitialInstListPointers_Crawlers,Y 
    STA.W $0F92,X 
    JMP.W InitAI_Crawlers_Common 


Palette_Zoomer:
    dw $3800,$72FA,$55B0,$2845,$1801,$6210,$496B,$38C6 
    dw $2C63,$7FE0,$7DA0,$48E0,$30A0,$03FF,$0237,$00D1 

Palette_MZoomer:
    dw $3800,$7FFF,$4ED3,$1926,$0481,$5F57,$4691,$360D 
    dw $2DCB,$6BBA,$56B2,$2947,$18C3,$7FFF,$4ED3,$1926 

CrawlersSpeedTable:
    dw $0040,$0080,$00C0,$0100,$0140,$0180,$01C0,$0200 
    dw $0240,$0280,$02C0,$0300,$0340,$0380,$0400,$0440 
    dw $0540,$0580,$05C0,$0600,$0640,$0680,$06C0,$0700 
    dw $0740,$0780,$07C0,$0800,$0840,$0880,$0800,$0000 

CrawlersInstListPointerTable_upsideDown:
    dw InstList_Zeela_Zoomer_UpsideDown_0 
    dw InstList_Zeela_Zoomer_UpsideDown_0 
    dw InstList_Zeela_Zoomer_UpsideDown_0 
    dw InstList_Viola_UpsideDown 
    dw InstList_Sciser_UpsideDown_0 
    dw InstList_Zero_UpsideDown_FacingLeft_0 

CrawlersInstListPointerTable_upsideUp:
    dw InstList_Zeela_Zoomer_UpsideUp_0 
    dw InstList_Zeela_Zoomer_UpsideUp_0 
    dw InstList_Zeela_Zoomer_UpsideUp_0 
    dw InstList_Viola_UpsideUp 
    dw InstList_Sciser_UpsideUp_0 
    dw UNUSED_InstList_Zero_UpsideUp_FacingRight_A3990B 

CrawlersInstListPointerTable_upsideRight:
    dw InstList_Zeela_Zoomer_UpsideRight_0 
    dw InstList_Zeela_Zoomer_UpsideRight_0 
    dw InstList_Zeela_Zoomer_UpsideRight_0 
    dw InstList_Viola_UpsideRight 
    dw InstList_Sciser_UpsideRight_0 
    dw InstList_Zero_UpsideRight_FacingDown_0 

CrawlersInstListPointerTable_upsideLeft:
    dw InstList_Zeela_Zoomer_UpsideLeft_0 
    dw InstList_Zeela_Zoomer_UpsideLeft_0 
    dw InstList_Zeela_Zoomer_UpsideLeft_0 
    dw InstList_Viola_UpsideLeft 
    dw InstList_Sciser_UpsideLeft_0 
    dw InstList_Zero_UpsideLeft_FacingUp_0 

Instruction_Crawlers_FunctionInY:
    LDA.W $0000,Y 
    STA.W $0FB2,X 
    INY #2
    RTL 


InitAI_Zoomer_MZoomer:
    LDX.W $0E54 
    LDA.W $0F92,X 
    AND.W #$0003 
    ASL A 
    TAY 
    LDA.W InitialInstListPointers_Crawlers,Y 
    STA.W $0F92,X ; fallthrough to InitAI_Crawlers_Common

InitAI_Crawlers_Common:
    LDA.W #Spritemap_CommonA3_Nothing 
    STA.W $0F8E,X 
    LDA.W #$0001 
    STA.W $0F94,X 
    LDA.W #.return 
    STA.W $0FB2,X 
    LDA.W $0FB4,X 
    CMP.W #$00FF 
    BEQ .skipSpeedTable 
    ASL A 
    TAY 
    LDA.W CrawlersSpeedTable,Y 
    STA.W $0FA8,X 
    STA.W $0FAA,X 

.skipSpeedTable:
    LDA.W $0F86,X 
    AND.W #$0003 
    BNE .properties 
    LDA.W $0FA8,X 
    EOR.W #$FFFF 
    INC A 
    STA.W $0FA8,X 
    RTL 


.properties:
    CMP.W #$0002 
    BNE .return 
    LDA.W $0FAA,X 
    EOR.W #$FFFF 
    INC A 
    STA.W $0FAA,X 

.return:
    RTL 


MainAI_Crawlers:
    LDX.W $0E54 
    JMP.W ($0FB2,X) 


Function_Crawlers_CrawlingVertically:
    LDA.W $1840 
    CMP.W #$001E 
    BNE .noQuake 
    LDA.W $183E 
    CMP.W #$0014 
    BNE .noQuake 
    LDA.W $0FB2,X 
    STA.L $7E7806,X 
    LDA.W #Function_Crawlers_Falling 
    STA.W $0FB2,X 

.noQuake:
    STZ.B $12 
    STZ.B $14 
    LDA.W $0FA8,X 
    BPL .positive 
    DEC.B $14 

.positive:
    STA.B $13 
    LDA.B $14 
    BPL .inc 
    DEC A 
    BRA .moveRight 


.inc:
    INC A 

.moveRight:
    STA.B $14 
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes 
    BCC .outsideTurn 
    LDA.W #$0000 
    STA.L $7E7808,X 
    JSL.L AlignEnemyYPositionWIthNonSquareSlope 
    STZ.B $12 
    STZ.B $14 
    LDA.W $0FAA,X 
    BPL .moveDown 
    DEC.B $14 

.moveDown:
    STA.B $13 
    JSL.L MoveEnemyDownBy_14_12 
    BCS .insideTurn 
    RTL 


.insideTurn:
    LDA.W $0FA8,X 
    EOR.W #$FFFF 
    INC A 
    STA.W $0FA8,X 
    LDY.W $0FB6,X 
    LDA.W $0FAA,X 
    BPL .insideTurn_up 
    LDA.W CrawlersInstListPointerTable_upsideDown,Y 
    BRA + 


.insideTurn_up:
    LDA.W CrawlersInstListPointerTable_upsideUp,Y 

  + STA.W $0F92,X 
    LDA.W #$0001 
    STA.W $0F94,X 
    RTL 


.outsideTurn:
    LDA.L $7E7808,X 
    INC A 
    STA.L $7E7808,X 
    CMP.W #$0004 
    BMI .negate 
    LDA.W $0FB2,X 
    STA.L $7E7806,X 
    LDA.W #Function_Crawlers_Falling 
    STA.W $0FB2,X 
    RTL 


.negate:
    LDA.W $0FAA,X 
    EOR.W #$FFFF 
    INC A 
    STA.W $0FAA,X 
    LDY.W $0FB6,X 
    LDA.W $0FAA,X 
    BPL .positiveYVelocity 
    LDA.W CrawlersInstListPointerTable_upsideDown,Y 
    BRA .outsideTurn_up 


.positiveYVelocity:
    LDA.W CrawlersInstListPointerTable_upsideUp,Y 

.outsideTurn_up:
    STA.W $0F92,X 
    LDA.W #$0001 
    STA.W $0F94,X 
    RTL 


Function_Crawlers_Falling:
    LDA.L $7E7802,X 
    STA.B $12 
    LDA.L $7E7804,X 
    STA.B $14 
    JSL.L MoveEnemyDownBy_14_12 
    BCC .noCollision 
    LDA.W $0FB4,X 
    CMP.W #$00FF 
    BNE .skipSpeed 
    LDA.W #$0080 
    STA.W $0FA8,X 
    STA.W $0FAA,X 

.skipSpeed:
    LDA.W #$0000 
    STA.L $7E7802,X 
    STA.L $7E7804,X 
    STA.L $7E7808,X 
    LDA.L $7E7806,X 
    STA.W $0FB2,X 
    RTL 


.noCollision:
    LDA.L $7E7804,X 
    CMP.W #$0004 
    BPL .fallSpeedCapped 
    LDA.L $7E7802,X 
    CLC 
    ADC.W #$8000 
    STA.L $7E7802,X 
    LDA.L $7E7804,X 
    ADC.W #$0000 
    STA.L $7E7804,X 

.fallSpeedCapped:
    LDA.L $7E7802,X 
    BNE .return 
    LDA.L $7E7804,X 
    BNE .return 
    LDA.W #Function_Crawlers_CrawlingVertically 
    STA.W $0FB2,X 

.return:
    RTL 


Function_Crawlers_CrawlingHorizontally:
    LDA.W $1840 
    CMP.W #$001E 
    BNE .noQuake 
    LDA.W $183E 
    CMP.W #$0014 
    BNE .noQuake 
    LDA.W $0FB2,X 
    STA.L $7E7806,X 
    LDA.W #Function_Crawlers_Falling 
    STA.W $0FB2,X 

.noQuake:
    STZ.B $12 
    STZ.B $14 
    LDA.W $0FAA,X 
    BPL .positive 
    DEC.B $14 

.positive:
    STA.B $13 
    LDA.B $14 
    BPL .inc 
    DEC A 
    BRA .moveDown 


.inc:
    INC A 

.moveDown:
    STA.B $14 
    JSL.L MoveEnemyDownBy_14_12 
    BCC .outsideTurn 
    LDA.W #$0000 
    STA.L $7E7808,X 
    JSR.W AdjustEnemyXVelocityForSlopes 
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes 
    BCS .insideTurn 
    JSL.L AlignEnemyYPositionWIthNonSquareSlope 
    RTL 


.insideTurn:
    LDA.W $0FAA,X 
    EOR.W #$FFFF 
    INC A 
    STA.W $0FAA,X 
    LDY.W $0FB6,X 
    LDA.W $0FA8,X 
    BPL ..left 
    LDA.W CrawlersInstListPointerTable_upsideRight,Y 
    BRA + 


..left:
    LDA.W CrawlersInstListPointerTable_upsideLeft,Y 

  + STA.W $0F92,X 
    LDA.W #$0001 
    STA.W $0F94,X 
    RTL 


.outsideTurn:
    LDA.L $7E7808,X 
    INC A 
    STA.L $7E7808,X 
    CMP.W #$0004 
    BMI .notFalling 
    LDA.W $0FB2,X 
    STA.L $7E7806,X 
    LDA.W #Function_Crawlers_Falling 
    STA.W $0FB2,X 
    RTL 


.notFalling:
    LDA.W $0FA8,X 
    EOR.W #$FFFF 
    INC A 
    STA.W $0FA8,X 
    LDY.W $0FB6,X 
    LDA.W $0FA8,X 
    BPL .outsideTurn_left 
    LDA.W CrawlersInstListPointerTable_upsideRight,Y 
    BRA + 


.outsideTurn_left:
    LDA.W CrawlersInstListPointerTable_upsideLeft,Y 

  + STA.W $0F92,X 
    LDA.W #$0001 
    STA.W $0F94,X 
    RTL 


AdjustEnemyXVelocityForSlopes:
    LDA.W $0F7A,X 
    PHA 
    LDA.W $0F7E,X 
    BIT.W $0FAA,X 
    BPL .negativeYVelocity 
    SEC 
    SBC.W $0F84,X 
    BRA .positiveYVelocity 


.negativeYVelocity:
    CLC 
    ADC.W $0F84,X 
    DEC A 

.positiveYVelocity:
    PHA 
    JSL.L CalculateTheBlockContainingAPixelPosition 
    LDA.W $0DC4 
    ASL A 
    TAX 
    LDA.L $7F0002,X 
    AND.W #$F000 
    CMP.W #$1000 
    BNE .normalSpeed 
    LDX.W $0DC4 
    LDA.L $7F6402,X 
    AND.W #$001F 
    CMP.W #$0005 
    BCC .normalSpeed 
    ASL #2
    TAX 
    LDY.W .adjustedSpeedMultiplier,X 
    LDX.W $0E54 
    LDA.W $0FA8,X 
    BPL .multiply 
    EOR.W #$FFFF 
    INC A 
    JSL.L A_Y_16bit_UnsignedMultiplication 
    LDA.W $05F1 
    EOR.W #$FFFF 
    CLC 
    ADC.W #$0001 
    STA.B $12 
    LDA.W $05F3 
    EOR.W #$FFFF 
    ADC.W #$0000 
    STA.B $14 
    RTS 


.multiply:
    JSL.L A_Y_16bit_UnsignedMultiplication 
    LDA.W $05F1 
    STA.B $12 
    LDA.W $05F3 
    STA.B $14 
    RTS 


.normalSpeed:
    LDX.W $0E54 
    STZ.B $12 
    STZ.B $14 
    LDA.W $0FA8,X 
    BPL + 
    DEC.B $14 

  + STA.B $13 
    RTS 


.additiveSpeedMultiplier:
    dw $0000 

.adjustedSpeedMultiplier:
    dw $0100,$0000,$0100,$0000,$0100,$0000,$0100,$0000 
    dw $0100,$0000,$0100,$0000,$0100,$0000,$0100,$0000 
    dw $0100,$0000,$0100,$0000,$0100,$0000,$0100,$0000 
    dw $0100,$0000,$0100,$1000,$00B0,$1000,$00B0,$0000 
    dw $0100,$0000,$0100,$1000,$00C0,$0000,$0100,$1000 
    dw $00C0,$1000,$00C0,$0800,$00D8,$0800,$00D8,$0600 
    dw $00F0,$0600,$00F0,$0600,$00F0,$4000,$0080,$4000 
    dw $0080,$6000,$0050,$6000,$0050,$6000,$0050 

Palette_Metroid:
    dw $3800,$6BF5,$06E1,$0641,$05A1,$5E5F,$183F,$1014 
    dw $080A,$0404,$4F9F,$3ED8,$2E12,$6F70,$7FFF,$5EE0 

InstList_Metroid_ChasingSamus:
    dw $0010 
    dw Spritemap_Metroid_Insides_0 
    dw $0010 
    dw Spritemap_Metroid_Insides_1 
    dw $0006 
    dw Spritemap_Metroid_Insides_2 
    dw $000A 
    dw Spritemap_Metroid_Insides_3 
    dw $0010 
    dw Spritemap_Metroid_Insides_1 
    dw $0010 
    dw Spritemap_Metroid_Insides_0 
    dw $0010 
    dw Spritemap_Metroid_Insides_1 
    dw $0006 
    dw Spritemap_Metroid_Insides_2 
    dw $000A 
    dw Spritemap_Metroid_Insides_3 
    dw $0010 
    dw Spritemap_Metroid_Insides_1 
    dw $0010 
    dw Spritemap_Metroid_Insides_0 
    dw $0010 
    dw Spritemap_Metroid_Insides_1 
    dw $0006 
    dw Spritemap_Metroid_Insides_2 
    dw $000A 
    dw Spritemap_Metroid_Insides_3 
    dw $0010 
    dw Spritemap_Metroid_Insides_1 
    dw $0010 
    dw Spritemap_Metroid_Insides_0 
    dw $0010 
    dw Spritemap_Metroid_Insides_1 
    dw $0006 
    dw Spritemap_Metroid_Insides_2 
    dw $000A 
    dw Spritemap_Metroid_Insides_3 
    dw $0010 
    dw Spritemap_Metroid_Insides_1 
    dw Instruction_Metroid_PlayRandomMetroidSFX 
    dw Instruction_Common_GotoY 
    dw InstList_Metroid_ChasingSamus 

InstList_Metroid_DrainingSamus:
    dw $0010 
    dw Spritemap_Metroid_Insides_0 
    dw $0010 
    dw Spritemap_Metroid_Insides_1 
    dw $0006 
    dw Spritemap_Metroid_Insides_2 
    dw $000A 
    dw Spritemap_Metroid_Insides_3 
    dw $0010 
    dw Spritemap_Metroid_Insides_1 
    dw Instruction_Metroid_PlayDrainingSamusSFX 
    dw Instruction_Common_GotoY 
    dw InstList_Metroid_DrainingSamus 

BombedOffVelocities_X:
    dw $0002,$0000,$FFFE,$0000 

BombedOffVelocities_Y:
    dw $0000,$FFFE,$0000,$0002 

InitAI_Metroid:
    LDX.W $0E54 
    LDA.W #InstList_Metroid_ChasingSamus 
    STA.W $0F92,X 
    LDA.W $0F96,X 
    ORA.W $0F98,X 
    STA.B $18 
    LDA.W $0F7A,X 
    STA.B $12 
    LDA.W $0F7E,X 
    STA.B $14 
    LDA.W #$0032 
    STA.B $16 
    JSL.L Create_Sprite_Object 
    LDA.B $12 
    STA.L $7E7800,X 
    LDX.W $0E54 
    LDA.W $0F96,X 
    ORA.W $0F98,X 
    STA.B $18 
    LDA.W $0F7A,X 
    STA.B $12 
    LDA.W $0F7E,X 
    STA.B $14 
    LDA.W #$0034 
    STA.B $16 
    JSL.L Create_Sprite_Object 
    LDA.B $12 
    STA.L $7E7802,X 
    LDA.W #$0000 
    STA.L $7E7804,X 
    RTL 


Instruction_Metroid_PlayDrainingSamusSFX:
    PHX 
    PHY 
    LDA.W #$0050 
    JSL.L QueueSound_Lib2_Max6 
    PLY 
    PLX 
    RTL 


Instruction_Metroid_PlayRandomMetroidSFX:
    PHX 
    PHY 
    JSL.L GenerateRandomNumber 
    AND.W #$0007 
    ASL A 
    TAX 
    LDA.W .SFX,X 
    JSL.L QueueSound_Lib2_Max6 
    PLY 
    PLX 
    RTL 


if !FEATURE_KEEP_UNREFERENCED
.unused:
    dw $00B4,$00BE,$00C8,$00D2,$00DC,$00E6,$00F0,$00FA 
endif ; !FEATURE_KEEP_UNREFERENCED

.SFX:
    dw $0050,$0058,$005A,$0050,$0058,$005A,$0058,$005A 

FrozenAI_Metroid:
    JSL.L CommonA3_NormalEnemyFrozenAI 
    LDX.W $0E54 
    LDA.W $0FB0,X 
    BEQ .timerExpired 
    DEC.W $0FB0,X 
    LDA.W #$0002 
    STA.W $0F9C,X 

.timerExpired:
    LDA.L $7E7800,X 
    TAX 
    LDA.W #$0C00 
    STA.L $7EF078,X 
    LDA.W #$0001 
    STA.L $7EF2F8,X 
    LDA.W #InstList_SpriteObject_32_MetroidElectricity 
    STA.L $7EEF78,X 
    LDX.W $0E54 
    LDA.L $7E7802,X 
    TAX 
    LDA.W #$0C00 
    STA.L $7EF078,X 
    LDA.W #$0001 
    STA.L $7EF2F8,X 
    LDA.W #InstList_SpriteObject_34_MetroidShell 
    STA.L $7EEF78,X 
    RTL 


HurtAI_Metroid:
    LDX.W $0E54 
    LDY.W #$F1FF ; >.<
    LDA.W $0F9C,X 
    BIT.W #$0002 
    BEQ .flash 
    LDA.W $0F96,X 
    STA.B $12 
    LDX.W $0E54 
    LDA.L $7E7800,X 
    TAX 
    LDA.L $7EF078,X 
    AND.W #$F1FF 
    ORA.B $12 
    STA.L $7EF078,X 
    LDX.W $0E54 
    LDA.L $7E7802,X 
    TAX 
    LDA.L $7EF078,X 
    AND.W #$F1FF 
    ORA.B $12 
    STA.L $7EF078,X 
    RTL 


.flash:
    LDX.W $0E54 
    LDA.L $7E7800,X 
    TAX 
    LDA.L $7EF078,X 
    AND.W #$F1FF 
    STA.L $7EF078,X 
    LDX.W $0E54 
    LDA.L $7E7802,X 
    TAX 
    LDA.L $7EF078,X 
    AND.W #$F1FF 
    STA.L $7EF078,X 
    RTL 


MainAI_Metroid:
    LDX.W $0E54 
    LDA.W $0AFA 
    SEC 
    SBC.W #$0008 
    STA.W $0E32 
    LDA.W $0FB2,X 
    ASL A 
    TAX 
    JSR.W (.pointers,X) 
    LDA.W $0F96,X 
    ORA.W $0F98,X 
    STA.B $18 
    LDA.W $0F7A,X 
    STA.B $12 
    LDA.W $0F7E,X 
    STA.B $14 
    LDA.L $7E7800,X 
    TAX 
    LDA.B $12 
    STA.L $7EF0F8,X 
    LDA.B $14 
    STA.L $7EF1F8,X 
    LDA.B $18 
    STA.L $7EF078,X 
    LDA.W #$0000 
    STA.L $7EF2F8,X 
    LDX.W $0E54 
    LDA.W $0F7A,X 
    STA.B $12 
    LDA.W $0F7E,X 
    STA.B $14 
    LDA.L $7E7802,X 
    TAX 
    LDA.B $12 
    STA.L $7EF0F8,X 
    LDA.B $14 
    STA.L $7EF1F8,X 
    LDA.B $18 
    STA.L $7EF078,X 
    LDA.W #$0000 
    STA.L $7EF2F8,X 
    RTL 


.pointers:
    dw Function_Metroid_0_ChaseSamus 
    dw Function_Metroid_1_LatchOntoSamus 
    dw Function_Metroid_2_LatchedOntoSamus 
    dw Function_Metroid_3_BombedOffSamus 

Function_Metroid_0_ChaseSamus:
    LDX.W $0E54 
    STZ.B $12 
    STZ.B $14 
    LDA.W $0F7E,X 
    SEC 
    SBC.W $0E32 
    LSR #2
    STA.B $13 
    AND.W #$2000 
    BEQ + 
    LDA.B $14 
    ORA.W #$FFC0 
    STA.B $14 

  + LDA.W $0FAC,X 
    SEC 
    SBC.B $12 
    STA.W $0FAC,X 
    LDA.W $0FAE,X 
    SBC.B $14 
    STA.W $0FAE,X 
    BMI .negativeY 
    CMP.W #$0003 
    BCC .moveDown 
    LDA.W #$0003 
    BRA .storeYVelocity 


.negativeY:
    CMP.W #$FFFD 
    BCS .moveDown 
    LDA.W #$FFFD 

.storeYVelocity:
    STA.W $0FAE,X 
    STZ.W $0FAC,X 

.moveDown:
    LDA.W $0FAC,X 
    STA.B $12 
    LDA.W $0FAE,X 
    STA.B $14 
    LDX.W $0E54 
    JSL.L MoveEnemyDownBy_14_12 
    BCC .notCollidedWithBlock 
    LDX.W $0E54 
    STZ.W $0FAC,X 
    STZ.W $0FAE,X 

.notCollidedWithBlock:
    LDX.W $0E54 
    STZ.B $12 
    STZ.B $14 
    LDA.W $0F7A,X 
    SEC 
    SBC.W $0AF6 
    LSR #2
    STA.B $13 
    AND.W #$2000 
    BEQ + 
    LDA.B $14 
    ORA.W #$FFC0 
    STA.B $14 

  + LDA.W $0FA8,X 
    SEC 
    SBC.B $12 
    STA.W $0FA8,X 
    LDA.W $0FAA,X 
    SBC.B $14 
    STA.W $0FAA,X 
    BMI .negativeX 
    CMP.W #$0003 
    BCC .moveRight 
    LDA.W #$0003 
    BRA .storeXVelocity 


.negativeX:
    CMP.W #$FFFD 
    BCS .moveRight 
    LDA.W #$FFFD 

.storeXVelocity:
    STA.W $0FAA,X 
    STZ.W $0FA8,X 

.moveRight:
    LDA.W $0FA8,X 
    STA.B $12 
    LDA.W $0FAA,X 
    STA.B $14 
    LDX.W $0E54 
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes 
    BCC .return 
    LDX.W $0E54 
    STZ.W $0FA8,X 
    STZ.W $0FAA,X 

.return:
    RTS 


Function_Metroid_1_LatchOntoSamus:
    LDX.W $0E54 
    STZ.B $12 
    STZ.B $14 
    LDA.W $0E32 
    SEC 
    SBC.W $0F7E,X 
    XBA 
    AND.W #$FF00 
    LSR #3
    STA.B $14 
    AND.W #$1000 
    BEQ + 
    LDA.B $14 
    ORA.W #$E000 
    STA.B $14 

  + LDA.B $14 
    BMI .negativeY 
    CMP.W #$0003 
    BCC .moveDown 
    LDA.W #$0003 
    BRA .alwaysClamped 


.negativeY:
    CMP.W #$FFFD 
    BCS .moveDown 
    LDA.W #$FFFD 

.alwaysClamped:
    STA.B $14 
    STZ.B $12 

.moveDown:
    LDA.B $12 
    STA.W $0FAC,X 
    LDA.B $14 
    STA.W $0FAE,X 
    LDX.W $0E54 
    JSL.L MoveEnemyDownBy_14_12 
    BCC .notCollidedWithBlock 
    LDX.W $0E54 
    STZ.W $0FAC,X 
    STZ.W $0FAE,X 

.notCollidedWithBlock:
    LDX.W $0E54 
    STZ.B $12 
    STZ.B $14 
    LDA.W $0AF6 
    SEC 
    SBC.W $0F7A,X 
    XBA 
    AND.W #$FF00 
    LSR #3
    STA.B $14 
    AND.W #$1000 
    BEQ + 
    LDA.B $14 
    ORA.W #$E000 
    STA.B $14 

  + LDA.B $14 
    BMI .negativeX 
    CMP.W #$0003 
    BCC .moveRight 
    LDA.W #$0003 
    BRA .storeXVelocity 


.negativeX:
    CMP.W #$FFFD 
    BCS .moveRight 
    LDA.W #$FFFD 

.storeXVelocity:
    STA.B $14 
    STZ.B $12 

.moveRight:
    LDA.B $12 
    STA.W $0FA8,X 
    LDA.B $14 
    STA.W $0FAA,X 
    LDX.W $0E54 
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes 
    BCC .return 
    LDX.W $0E54 
    STZ.W $0FA8,X 
    STZ.W $0FAA,X 

.return:
    RTS 


Function_Metroid_2_LatchedOntoSamus:
    LDX.W $0E54 
    LDA.W $0AF6 
    STA.W $0F7A,X 
    LDA.W $0E32 
    STA.W $0F7E,X 
    STZ.W $0FA8,X 
    STZ.W $0FAA,X 
    STZ.W $0FAC,X 
    STZ.W $0FAE,X 
    RTS 


Function_Metroid_3_BombedOffSamus:
    LDX.W $0E54 
    LDA.W $0FB0,X 
    AND.W #$0003 
    ASL A 
    TAY 
    LDA.W $0F7A,X 
    CLC 
    ADC.W BombedOffVelocities_X,Y 
    STA.W $0F7A,X 
    LDA.W $0F7E,X 
    CLC 
    ADC.W BombedOffVelocities_Y,Y 
    STA.W $0F7E,X 
    STZ.W $0FA8,X 
    STZ.W $0FAA,X 
    STZ.W $0FAC,X 
    STZ.W $0FAE,X 
    DEC.W $0FB0,X 
    BNE .return 
    STZ.W $0FB2,X 
    LDA.W #InstList_Metroid_ChasingSamus 
    STA.W $0F92,X 
    LDA.W #$0001 
    STA.W $0F94,X 

.return:
    RTS 


EnemyTouch_Metroid:
    LDA.W $0AFA 
    SEC 
    SBC.W #$0008 
    STA.W $0E32 
    LDA.W $0A6E 
    BEQ .normal 
    LDX.W $0E54 
    LDA.W $0FB2,X 
    CMP.W #$0002 
    BEQ .return 
    STZ.W $0FA8,X 
    STZ.W $0FAC,X 
    LDY.W #$0000 
    LDA.W $0F7A,X 
    SEC 
    SBC.W $0AF6 
    BPL + 
    LDY.W #$FF00 

  + PHA 
    TYA 
    STA.W $0FAA,X 
    PLA 
    ASL #6
    STA.W $0FA9,X 
    LDY.W #$0000 
    LDA.W $0F7E,X 
    SEC 
    SBC.W $0E32 
    BPL + 
    LDY.W #$FF00 

  + PHA 
    TYA 
    STA.W $0FAE,X 
    PLA 
    ASL #6
    STA.W $0FAD,X 
    STZ.W $0FB2,X 
    LDA.W #InstList_Metroid_ChasingSamus 
    STA.W $0F92,X 
    LDA.W #$0001 
    STA.W $0F94,X 

.return:
    RTL 


.normal:
    LDX.W $0E54 
    LDA.W $0FB2,X 
    CMP.W #$0003 
    BEQ + 
    LDA.W $0E44 
    AND.W #$0007 
    CMP.W #$0007 
    BNE .skipSFX 
    LDA.W $09C2 
    CMP.W #$001E 
    BMI .skipSFX 
    LDA.W #$002D 
    JSL.L QueueSound_Lib3_Max6 

.skipSFX:
    JSR.W DealMetroidContactDamageToSamus 

  + LDA.W $0FB2,X 
    CMP.W #$0002 
    BCS .return 
    LDY.W #$0001 
    LDA.W $0F7A,X 
    SEC 
    SBC.W $0AF6 
    BPL + 
    EOR.W #$FFFF 
    INC A 

  + CMP.W #$0008 
    BCS .setFunction 
    LDA.W $0F7E,X 
    SEC 
    SBC.W $0E32 
    BPL + 
    EOR.W #$FFFF 
    INC A 

  + CMP.W #$0008 
    BCS .setFunction 
    LDY.W #$0002 
    LDA.W #$0012 
    JSL.L Run_Samus_Command 

.setFunction:
    TYA 
    STA.W $0FB2,X 
    CMP.W #$0002 
    BNE .return 
    LDA.W #InstList_Metroid_DrainingSamus 
    STA.W $0F92,X 
    LDA.W #$0001 
    STA.W $0F94,X 
    RTL 


DealMetroidContactDamageToSamus:
    LDA.W $0AFA 
    SEC 
    SBC.W #$0008 
    STA.W $0E32 
    LDA.W $09A2 
    BIT.W #$0020 
    BNE .gravitySuit 
    LSR A 
    BCC .powerSuit 
    LDA.W #$6000 
    BRA .merge 


.gravitySuit:
    LDA.W #$3000 
    BRA .merge 


.powerSuit:
    LDA.W #$C000 

.merge:
    STA.B $12 
    LDA.L $7E7804,X 
    SEC 
    SBC.B $12 
    STA.L $7E7804,X 
    BCS .return 
    LDA.W #$0001 
    JSL.L Deal_A_Damage_to_Samus 

.return:
    RTS 


EnemyShot_Metroid:
    LDA.W $0AFA 
    SEC 
    SBC.W #$0008 
    STA.W $0E32 
    LDA.W $18A6 
    ASL A 
    TAY 
    LDX.W $0E54 
    LDA.W $0F9E,X 
    BEQ .notFrozen 
    LDA.W $0C18,Y 
    AND.W #$0F00 
    CMP.W #$0100 
    BEQ .missile 
    CMP.W #$0200 
    BNE .returnUpper 

.missile:
    LDA.W $0F7A,X 
    STA.L $7EF434 
    LDA.W $0F7E,X 
    STA.L $7EF436 
    JSL.L CommonA3_NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic 
    LDA.W $0F8C,X 
    BNE .returnUpper 
    STZ.W $0FAA,X 
    LDA.W #$0004 
    JSL.L EnemyDeath 
    LDA.W #$0013 
    JSL.L Run_Samus_Command 
    LDX.W $0E54 
    LDA.L $7E7800,X 
    TAX 
    LDA.W #$0000 
    STA.L $7EEF78,X 
    LDX.W $0E54 
    LDA.L $7E7802,X 
    TAX 
    LDA.W #$0000 
    STA.L $7EEF78,X 
    JSL.L MetroidDeathItemDropRoutine 

.returnUpper:
    RTL 


.notFrozen:
    LDA.W $0FB2,X 
    CMP.W #$0002 
    BNE .notLatched 
    LDA.W $0C18,Y 
    AND.W #$0F00 
    CMP.W #$0500 
    BNE .returnLower 
    LDA.W #$0004 
    STA.W $0FB0,X 
    LDA.W #$0003 
    STA.W $0FB2,X 
    LDA.W #InstList_Metroid_ChasingSamus 
    STA.W $0F92,X 
    LDA.W #$0001 
    STA.W $0F94,X 
    LDA.W #$0013 
    JSL.L Run_Samus_Command 

.returnLower:
    RTL 


.notLatched:
    STZ.W $0FA8,X 
    STZ.W $0FAC,X 
    LDY.W #$0000 
    LDA.W $0F7A,X 
    SEC 
    SBC.W $0B64,Y 
    BPL + 
    LDY.W #$FF00 

  + PHA 
    TYA 
    STA.W $0FAA,X 
    PLA 
    ASL #5
    STA.W $0FA9,X 
    LDY.W #$0000 
    LDA.W $0F7E,X 
    SEC 
    SBC.W $0B78,Y 
    BPL + 
    LDY.W #$FF00 

  + PHA 
    TYA 
    STA.W $0FAE,X 
    PLA 
    ASL #5
    STA.W $0FAD,X 
    STZ.W $0FB2,X 
    LDA.W #InstList_Metroid_ChasingSamus 
    STA.W $0F92,X 
    LDA.W #$0001 
    STA.W $0F94,X 
    LDA.W $18A6 
    ASL A 
    TAY 
    LDA.W $0C18,Y 
    AND.W #$0002 
    BEQ .notIceBeam 
    LDA.W #$000A 
    JSL.L QueueSound_Lib3_Max6 
    LDA.W $0C2C,Y 
    STA.B $12 
    LDA.W #$0004 
    STA.W $0F9C,X 
    LDA.W $0FB6,X 
    SEC 
    SBC.B $12 
    BEQ .freeze 
    BCS .noFreeze 

.freeze:
    STZ.W $0FB6,X 
    LDA.W #$0190 
    STA.W $0F9E,X 
    LDA.W $0F8A,X 
    ORA.W #$0004 
    STA.W $0F8A,X 
    RTL 


.noFreeze:
    STA.W $0FB6,X 

.notIceBeam:
    LDA.W #$005A 
    JSL.L QueueSound_Lib2_Max6 
    RTL 


PowerBombReaction_Metroid:
    JSL.L NormalEnemyPowerBombAI 
    LDA.W $0F8C,X 
    BNE .return 
    LDA.W #$0013 
    JSL.L Run_Samus_Command 
    LDX.W $0E54 
    LDA.L $7E7800,X 
    TAX 
    LDA.W #$0000 
    STA.L $7EEF78,X 
    LDX.W $0E54 
    LDA.L $7E7802,X 
    TAX 
    LDA.W #$0000 
    STA.L $7EEF78,X 

.return:
    RTL 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Metroid_Shell_A3F071:
    dw $000A,$0010 
    db $04 
    dw $6130,$0010 
    db $FC 
    dw $6120,$0010 
    db $F4 
    dw $6110,$01E8 
    db $04 
    dw $2130,$01E8 
    db $FC 
    dw $2120,$01E8 
    db $F4 
    dw $2110,$8000 
    db $FC 
    dw $6121,$8000 
    db $EC 
    dw $2103,$81F0 
    db $FC 
    dw $2121,$81F0 
    db $EC 
    dw $2101 

UNUSED_Spritemap_Metroid_Shell_A3F0A5:
    dw $000A,$0010 
    db $FC 
    dw $612A,$0010 
    db $04 
    dw $613A,$0010 
    db $F4 
    dw $211F,$01E8 
    db $04 
    dw $213A,$01E8 
    db $FC 
    dw $212A,$01E8 
    db $F4 
    dw $211A,$8000 
    db $EC 
    dw $210D,$8000 
    db $FC 
    dw $612B,$81F0 
    db $FC 
    dw $212B,$81F0 
    db $EC 
    dw $210B 

UNUSED_Spritemap_Metroid_Shell_A3F0D9:
    dw $000A,$01E8 
    db $FC 
    dw $2125,$0010 
    db $04 
    dw $6135,$0010 
    db $FC 
    dw $6125,$0010 
    db $F4 
    dw $6115,$01E8 
    db $04 
    dw $2135,$01E8 
    db $F4 
    dw $2115,$8000 
    db $FC 
    dw $6126,$8000 
    db $EC 
    dw $2108,$81F0 
    db $FC 
    dw $2126,$81F0 
    db $EC 
    dw $2106 
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_Metroid_Insides_0:
    dw $0008,$0010 
    db $00 
    dw $6160,$0010 
    db $F8 
    dw $6150,$01E8 
    db $00 
    dw $2160,$01E8 
    db $F8 
    dw $2150,$8000 
    db $00 
    dw $6161,$8000 
    db $F0 
    dw $6141,$81F0 
    db $00 
    dw $2161,$81F0 
    db $F0 
    dw $2141 

Spritemap_Metroid_Insides_1:
    dw $0006,$0010 
    db $00 
    dw $6163,$01E8 
    db $00 
    dw $2163,$8000 
    db $00 
    dw $6164,$8000 
    db $F0 
    dw $6144,$81F0 
    db $00 
    dw $2164,$81F0 
    db $F0 
    dw $2144 

Spritemap_Metroid_Insides_2:
    dw $0008,$0010 
    db $00 
    dw $6166,$0010 
    db $F8 
    dw $6156,$01E8 
    db $00 
    dw $2166,$01E8 
    db $F8 
    dw $2156,$8000 
    db $00 
    dw $6167,$8000 
    db $F0 
    dw $6147,$81F0 
    db $00 
    dw $2167,$81F0 
    db $F0 
    dw $2147 

Spritemap_Metroid_Insides_3:
    dw $0008,$0010 
    db $00 
    dw $6169,$0010 
    db $F8 
    dw $6159,$01E8 
    db $00 
    dw $2169,$01E8 
    db $F8 
    dw $2159,$8000 
    db $00 
    dw $616A,$8000 
    db $F0 
    dw $614A,$81F0 
    db $00 
    dw $216A,$81F0 
    db $F0 
    dw $214A 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Metroid_Electricity_A3F1AB:
    dw $0003,$0000 
    db $EC 
    dw $217C,$01F8 
    db $FC 
    dw $214D,$01F0 
    db $FC 
    dw $214C 

UNUSED_Spritemap_Metroid_Electricity_A3F1BC:
    dw $0003,$0000 
    db $EC 
    dw $217D,$01F8 
    db $FC 
    dw $215D,$01F0 
    db $FC 
    dw $215C 

UNUSED_Spritemap_Metroid_Electricity_A3F1CD:
    dw $0003,$0000 
    db $EC 
    dw $217E,$01F8 
    db $FC 
    dw $216D,$01F0 
    db $FC 
    dw $216C 

UNUSED_Spritemap_Metroid_Electricity_A3F1DE:
    dw $0004,$0008 
    db $FC 
    dw $214F,$0000 
    db $FC 
    dw $214E,$01F8 
    db $F4 
    dw $213D,$01F8 
    db $EC 
    dw $212D 

UNUSED_Spritemap_Metroid_Electricity_A3F1F4:
    dw $0004,$0008 
    db $FC 
    dw $215F,$0000 
    db $FC 
    dw $215E,$01F8 
    db $F4 
    dw $213E,$01F8 
    db $EC 
    dw $212E 

UNUSED_Spritemap_Metroid_Electricity_A3F20A:
    dw $0004,$0008 
    db $FC 
    dw $216F,$0000 
    db $FC 
    dw $216E,$01F8 
    db $F4 
    dw $213F,$01F8 
    db $EC 
    dw $212F 

UNUSED_Spritemap_Metroid_Electricity_A3F220:
    dw $0003,$0008 
    db $FC 
    dw $214D,$0000 
    db $FC 
    dw $214C,$01F8 
    db $EC 
    dw $617C 

UNUSED_Spritemap_Metroid_Electricity_A3F231:
    dw $0003,$0008 
    db $FC 
    dw $215D,$0000 
    db $FC 
    dw $215C,$01F8 
    db $EC 
    dw $617D 

UNUSED_Spritemap_Metroid_Electricity_A3F242:
    dw $0003,$0008 
    db $FC 
    dw $216D,$0000 
    db $FC 
    dw $216C,$01F8 
    db $EC 
    dw $617E 

UNUSED_Spritemap_Metroid_Electricity_A3F253:
    dw $0004,$01F8 
    db $FC 
    dw $214F,$01F0 
    db $FC 
    dw $214E,$0000 
    db $F4 
    dw $613D,$0000 
    db $EC 
    dw $612D 

UNUSED_Spritemap_Metroid_Electricity_A3F269:
    dw $0004,$01F8 
    db $FC 
    dw $216F,$01F0 
    db $FC 
    dw $216E,$0000 
    db $F4 
    dw $613E,$0000 
    db $EC 
    dw $612E 

UNUSED_Spritemap_Metroid_Electricity_A3F27F:
    dw $0004,$01F8 
    db $FC 
    dw $215F,$01F0 
    db $FC 
    dw $215E,$0000 
    db $F4 
    dw $613F,$0000 
    db $EC 
    dw $612F 

UNUSED_Spritemap_Metroid_Electricity_A3F295:
    dw $0002,$01F8 
    db $FC 
    dw $214D,$01F0 
    db $FC 
    dw $214C 

UNUSED_Spritemap_Metroid_Electricity_A3F2A1:
    dw $0001,$01F0 
    db $FC 
    dw $215C 

UNUSED_Spritemap_Metroid_Electricity_A3F2A8:
    dw $0002,$01F8 
    db $FC 
    dw $216D,$01F0 
    db $FC 
    dw $216C 

UNUSED_Spritemap_Metroid_Electricity_A3F2B4:
    dw $0002,$01F8 
    db $F4 
    dw $213D,$01F8 
    db $EC 
    dw $212D 

UNUSED_Spritemap_Metroid_Electricity_A3F2C0:
    dw $0002,$01F8 
    db $F4 
    dw $213E,$01F8 
    db $EC 
    dw $212E 

UNUSED_Spritemap_Metroid_Electricity_A3F2CC:
    dw $0002,$01F8 
    db $F4 
    dw $213F,$01F8 
    db $EC 
    dw $212F 

UNUSED_Spritemap_Metroid_Electricity_A3F2D8:
    dw $0002,$0008 
    db $FC 
    dw $214D,$0000 
    db $FC 
    dw $214C 

UNUSED_Spritemap_Metroid_Electricity_A3F2E4:
    dw $0002,$0008 
    db $FC 
    dw $215D,$0000 
    db $FC 
    dw $215C 

UNUSED_Spritemap_Metroid_Electricity_A3F2F0:
    dw $0002,$0008 
    db $FC 
    dw $216D,$0000 
    db $FC 
    dw $216C 

UNUSED_Spritemap_Metroid_Electricity_A3F2FC:
    dw $0001,$0000 
    db $EC 
    dw $217C 

UNUSED_Spritemap_Metroid_Electricity_A3F303:
    dw $0001,$0000 
    db $EC 
    dw $217D 

UNUSED_Spritemap_Metroid_Electricity_A3F30A:
    dw $0001,$0000 
    db $EC 
    dw $217E 
endif ; !FEATURE_KEEP_UNREFERENCED

Freespace_BankA3_F311: 
; $CEF bytes
