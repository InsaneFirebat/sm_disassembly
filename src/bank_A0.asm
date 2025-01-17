
org $A08000


Common_GrappleAI_NoInteraction:
    JSL.L GrappleAI_SwitchEnemyAIToMainAI 
    RTL 


Common_GrappleAI_SamusLatchesOn:
    JSL.L GrappleAI_SamusLatchesOnWithGrapple 
    RTL 


Common_GrappleAI_KillEnemy:
    JSL.L GrappleAI_EnemyGrappleDeath 
    RTL 


Common_GrappleAI_CancelGrappleBeam:
    JSL.L GrappleAI_SwitchToFrozenAI 
    RTL 


Common_GrappleAI_SamusLatchesOn_NoInvincibility:
    JSL.L GrappleAI_SamusLatchesOnWithGrapple_NoInvincibility 
    RTL 


UNUSED_Common_GrappleAI_SamusLatchesOn_ParalyzeEnemy_A08019:
    JSL.L GrappleAI_SamusLatchesOnWithGrapple_ParalyzeEnemy 
    RTL 


Common_GrappleAI_HurtSamus:
    JSL.L GrappleAI_SwitchToFrozenAI_duplicate 
    RTL 


Common_NormalEnemyTouchAI:
    JSL.L NormalEnemyTouchAI 
    RTL 


Common_NormalTouchAI_NoDeathCheck:
    JSL.L NormalEnemyTouchAI_NoDeathCheck_External 
    RTL 


Common_NormalEnemyShotAI:
    JSL.L NormalEnemyShotAI 
    RTL 


Common_NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic:
    JSL.L NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External 
    RTL 


Common_NormalEnemyPowerBombAI:
    JSL.L NormalEnemyPowerBombAI 
    RTL 


Common_NormalEnemyPowerBombAI_NoDeathCheck:
    JSL.L NormalEnemyPowerBombAI_NoDeathCheck_External 
    RTL 


Common_NormalEnemyFrozenAI:
    JSL.L NormalEnemyFrozenAI 
    RTL 


Common_CreateADudShot:
    JSL.L CreateADudShot 
    RTL 


RTS_A0804B:
    RTS 


RTL_A0804C:
    RTL 


Spritemap_Common_Nothing:
    dw $0000 

ExtendedSpritemap_Common_Nothing:
    dw $0001,$0000,$0000 
    dw Spritemap_Common_Nothing 
    dw Hitbox_Common_Nothing 

Hitbox_Common_Nothing:
    dw $0001,$0000,$0000,$0000,$0000 
    dw Common_NormalEnemyTouchAI 
    dw Common_NormalEnemyShotAI 

InstList_Common_DeleteEnemy:
    dw Instruction_Common_DeleteEnemy 

NOPNOP_A08069:
    NOP #2
    Instruction_Common_Enemy0FB2_InY:
    LDA.W $0000,Y : STA.W $0FB2,X 
    INY #2
    RTL 


Instruction_Common_SetEnemy0FB2ToRTS:
    LDA.W #RTS_A0807B : STA.W $0FB2,X 
    RTL 


RTS_A0807B:
    RTS 


Instruction_Common_DeleteEnemy:
    LDA.W $0F86,X : ORA.W #$0200 : STA.W $0F86,X 
    PLA : PEA.W ProcessEnemyInstructions_return-1 
    RTL 


Instruction_Common_CallFunctionInY:
    LDA.W $0000,Y : STA.B $12 
    PHY : PHX : PEA.W .manualReturn-1 
    JMP.W ($0012) 


.manualReturn:
    PLX : PLY 
    INY #2
    RTL 


Instruction_Common_CallFunctionInY_WithA:
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
UNUSED_Instruction_Common_CallExternalFunctionInY_A080B5:
    LDA.W $0000,Y : STA.B $12 
    LDA.W $0001,Y : STA.B $13 
    PHX : PHY 
    JSL.L .externalFunction 
    PLY : PLX 
    INY #3
    RTL 


.externalFunction:
    JML.W [$0012] 


UNUSED_Inst_Common_CallExternalFunctionInY_WithA_A080CE:
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


Instruction_Common_GotoY:
    LDA.W $0000,Y 
    TAY 
    RTL 


Instruction_Common_GotoY_PlusY:
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


Instruction_Common_DecrementTimer_GotoYIfNonZero:
    DEC.W $0F90,X 
    BNE Instruction_Common_GotoY 
    INY #2
    RTL 


Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate:
    DEC.W $0F90,X 
    BNE Instruction_Common_GotoY 
    INY #2
    RTL 


Instruction_Common_DecrementTimer_GotoY_PlusY_IfNonZero:
    SEP #$20 
    DEC.W $0F90,X 
    REP #$20 
    BNE Instruction_Common_GotoY_PlusY 
    INY 
    RTL 


Instruction_Common_TimerInY:
    LDA.W $0000,Y : STA.W $0F90,X 
    INY #2
    RTL 


Instruction_Common_SkipNextInstruction:
    INY #2
    RTL 


Instruction_Common_Sleep:
    DEY #2
    TYA 
    STA.W $0F92,X 
    PLA : PEA.W ProcessEnemyInstructions_return-1 
    RTL 


Instruction_Common_WaitYFrames:
    LDA.W $0000,Y : STA.W $0F94,X 
    INY #2
    TYA 
    STA.W $0F92,X 
    PLA : PEA.W ProcessEnemyInstructions_return-1 
    RTL 


Instruction_Common_TransferYBytesInYToVRAM:
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


Instruction_Common_EnableOffScreenProcessing:
    LDA.W $0F86,X : ORA.W #$0800 : STA.W $0F86,X 
    RTL 


Instruction_Common_DisableOffScreenProcessing:
    LDA.W $0F86,X : AND.W #$F7FF : STA.W $0F86,X 
    RTL 


CommonEnemySpeeds_LinearlyIncreasing:
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

CommonEnemySpeeds_QuadraticallyIncreasing:
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

Handle_Room_Shaking:
    PHB : PEA.W $A000 
    PLB : PLB 
    REP #$30 
    LDA.W $1840 : BEQ .return 
    LDA.W $0A78 : BNE .return 
    LDA.W $183E : CMP.W #$0024 : BPL .return 
    ASL #3
    TAX 
    LDA.W $1840 : BIT.W #$0002 
    BEQ .timerExpired 
    LDA.W BGShakeDisplacements_BG1X,X 
    EOR.W #$FFFF 
    INC A 
    CLC : ADC.B $B1 : STA.B $B1 
    LDA.W BGShakeDisplacements_BG1Y,X 
    EOR.W #$FFFF 
    INC A 
    CLC : ADC.B $B3 : STA.B $B3 
    LDA.W BGShakeDisplacements_BG2X,X 
    EOR.W #$FFFF 
    INC A 
    CLC : ADC.B $B5 : STA.B $B5 
    LDA.W BGShakeDisplacements_BG2Y,X 
    EOR.W #$FFFF 
    INC A 
    CLC : ADC.B $B7 : STA.B $B7 
    BRA .decrementEarthquakeTimer 


.timerExpired:
    LDA.B $B1 : CLC : ADC.W BGShakeDisplacements_BG1X,X : STA.B $B1 
    LDA.B $B3 : CLC : ADC.W BGShakeDisplacements_BG1Y,X : STA.B $B3 
    LDA.B $B5 : CLC : ADC.W BGShakeDisplacements_BG2X,X : STA.B $B5 
    LDA.B $B7 : CLC : ADC.W BGShakeDisplacements_BG2Y,X : STA.B $B7 

.decrementEarthquakeTimer:
    DEC.W $1840 
    LDA.W $183E : CMP.W #$0012 : BMI .return 
    JSR.W SetAllActiveEnemiesToShakeHorizontallyFor2Frames 

.return:
    INC.W $1842 
    PLB 
    RTL 


SetAllActiveEnemiesToShakeHorizontallyFor2Frames:
    PHY : PHX 
    LDY.W #$0000 

.loop:
    LDA.W $17AC,Y : CMP.W #$FFFF : BEQ .return 
    TAX 
    LDA.W #$0002 : STA.W $0FA2,X 
    INY #2
    BRA .loop 


.return:
    PLX : PLY 
    RTS 


BGShakeDisplacements_BG1X:
    dw $0001 

BGShakeDisplacements_BG1Y:
    dw $0000 

BGShakeDisplacements_BG2X:
    dw $0000 

BGShakeDisplacements_BG2Y:
    dw $0000,$0000,$0001,$0000,$0000,$0001,$0001,$0000 
    dw $0000,$0002,$0000,$0000,$0000,$0000,$0002,$0000 
    dw $0000,$0002,$0002,$0000,$0000,$0003,$0000,$0000 
    dw $0000,$0000,$0003,$0000,$0000,$0003,$0003,$0000 
    dw $0000,$0001,$0000,$0001,$0000,$0000,$0001,$0000 
    dw $0001,$0001,$0001,$0001,$0001,$0002,$0000,$0002 
    dw $0000,$0000,$0002,$0000,$0002,$0002,$0002,$0002 
    dw $0002,$0003,$0000,$0003,$0000,$0000,$0003,$0000 
    dw $0003,$0003,$0003,$0003,$0003,$0001,$0000,$0001 
    dw $0000,$0000,$0001,$0000,$0001,$0001,$0001,$0001 
    dw $0001,$0002,$0000,$0002,$0000,$0000,$0002,$0000 
    dw $0002,$0002,$0002,$0002,$0002,$0003,$0000,$0003 
    dw $0000,$0000,$0003,$0000,$0003,$0003,$0003,$0003 
    dw $0003,$0000,$0000,$0001,$0000,$0000,$0000,$0000 
    dw $0001,$0000,$0000,$0001,$0001,$0000,$0000,$0002 
    dw $0000,$0000,$0000,$0000,$0002,$0000,$0000,$0002 
    dw $0002,$0000,$0000,$0003,$0000,$0000,$0000,$0000 
    dw $0003,$0000,$0000,$0003,$0003 

Draw_Samus_Projectiles_Enemies_and_Enemy_Projectiles:
    PHB : PEA.W $A000 
    PLB : PLB 
    REP #$30 
    JSL.L DrawSpriteObjects 
    JSL.L DrawBombsAndProjectileExplosions 
    JSL.L Draw_HighPriority_EnemyProjectile 
    STZ.W $0E32 

.loopMain:
    LDA.W $0E32 : CMP.W #$0008 : BEQ .finish 
    CMP.W #$0003 : BNE .layerNot3 
    JSL.L DrawSamusAndProjectiles 
    BRA .layerNot6 


.layerNot3:
    CMP.W #$0006 : BNE .layerNot6 
    JSL.L Draw_LowPriority_EnemyProjectile 

.layerNot6:
    LDA.W $0E32 
    ASL A 
    TAY 
    LDA.W $0F68,Y : BEQ .next 
    STA.W $0E36 
    LDA.W AddressesForEnemyDrawingQueues,Y : STA.W $0E3A 
    LDA.W #$0000 : STA.W $0F68,Y 

.loopOAM:
    STA.W $0E38 
    CLC : ADC.W $0E3A : TAX 
    LDA.W $0000,X 
    STZ.W $0000,X 
    STA.W $0E54 
    JSR.W WriteEnemyOAM_IfNotFrozenOrInvincibleFrame 
    LDA.W $0E38 
    INC #2
    CMP.W $0E36 : BNE .loopOAM 

.next:
    INC.W $0E32 
    BRA .loopMain 


.finish:
    PHB 
    JSL.L .executeHook 
    PLB 
    BRA .return 


.executeHook:
    LDA.W $178E 
    XBA 
    PHA : PLB : PLB 
    JML.W [$178C] 


.return:
    PLB 
    RTL 


Record_EnemySpawnData:
    PHX : PHY 
    TYX 
    LDA.W $0F78,X : STA.L $7E701E,X 
    LDA.W $0F7A,X : STA.L $7E7020,X 
    LDA.W $0F7E,X : STA.L $7E7022,X 
    LDA.W $0F92,X : STA.L $7E7024,X 
    LDA.W $0F86,X : STA.L $7E7026,X 
    LDA.W $0F88,X : STA.L $7E7028,X 
    LDA.W $0FB4,X : STA.L $7E702A,X 
    LDA.W $0FB6,X : STA.L $7E702C,X 
    STZ.B $12 
    STZ.B $14 
    STZ.B $16 
    STZ.B $18 
    STZ.B $1A 
    STZ.B $1C 
    PHX 
    LDA.W $0F78,X 
    TAX 
    LDA.L $A0003E,X : BEQ .doneName 
    TAX 
    LDA.L $B40000,X : STA.B $12 
    LDA.L $B40002,X : STA.B $14 
    LDA.L $B40004,X : STA.B $16 
    LDA.L $B40006,X : STA.B $18 
    LDA.L $B40008,X : STA.B $1A 
    LDA.L $B4000C,X : STA.B $1C 

.doneName:
    PLX 
    LDA.B $12 : STA.L $7E702E,X 
    LDA.B $14 : STA.L $7E7030,X 
    LDA.B $16 : STA.L $7E7032,X 
    LDA.B $18 : STA.L $7E7034,X 
    LDA.B $1A : STA.L $7E7036,X 
    LDA.B $1C : STA.L $7E7038,X 
    PLY : PLX 
    RTL 


Debug_LoadEnemySetData:
    LDA.W #$0000 
    LDX.W #$0000 
    LDY.W #$00A0 

.loopUpper:
    STA.L $7ED552,X 
    INX #2
    DEY #2
    BNE .loopUpper 
    LDA.W $07D1 : SEC : SBC.W #$0007 : TAX 
    LDA.L $B40000,X : STA.L $7ED552 
    LDA.L $B40002,X : STA.L $7ED554 
    LDA.L $B40004,X : STA.L $7ED556 
    LDA.L $B40006,X : STA.L $7ED558 
    LDY.W #$0007 
    LDA.W $07D1 
    TAX 

.loop:
    LDA.L $B40000,X : CMP.W #$FFFF : BEQ .return 
    PHX 
    TAX 
    LDA.L $A0003E,X : BNE .hasName 
    LDA.W #EnemyName_NoData 

.hasName:
    TAX 
    LDA.L $B40000,X : STA.B $12 
    LDA.L $B40002,X : STA.B $14 
    LDA.L $B40004,X : STA.B $16 
    LDA.L $B40006,X : STA.B $18 
    LDA.L $B40008,X : STA.B $1A 
    TYX 
    LDA.B $12 : STA.L $7ED552,X 
    LDA.B $14 : STA.L $7ED554,X 
    LDA.B $16 : STA.L $7ED556,X 
    LDA.B $18 : STA.L $7ED558,X 
    LDA.B $1A : STA.L $7ED55A,X 
    PLX : PHX 
    LDA.L $B40002,X 
    TYX 
    STA.L $7ED55C,X 
    PLX 
    TYA 
    CLC : ADC.W #$000C : TAY 
    TXA 
    CLC : ADC.W #$0004 : TAX 
    BRA .loop 


.return:
    RTL 


Load_Enemies:
    PHP : PHB : PEA.W $A000 
    PLB : PLB 
    REP #$30 
    JSL.L Debug_LoadEnemySetData 
    STZ.W $185E 
    STZ.W $179C 
    LDA.W #$00A0 : STA.W $178E 
    LDA.W #RTL_A0804C : STA.W $178C 
    LDA.W #$00A0 : STA.W $1792 
    LDA.W #RTL_A0804C : STA.W $1790 
    LDA.W #$0800 : STA.W $179A 
    STZ.W $179E 
    STZ.W $17A0 
    STZ.W $179C 
    JSL.L ClearEnemyData_ProcessEnemySet 
    JSL.L LoadEnemyTileData 
    STZ.W $0E7C 
    STZ.W $18AE 
    JSL.L ClearSpriteObjects 
    PLB : PLP 
    RTL 


ClearEnemyData_ProcessEnemySet:
    PHP : PHB : PEA.W $A000 
    PLB : PLB 
    REP #$30 
    LDA.W #$0000 
    LDY.W #$0800 
    LDX.W #$0000 

.loop:
    STA.L $000F78,X 
    INX 
    DEY 
    INX 
    DEY 
    BNE .loop 
    LDX.W $07CF 
    LDA.L $A10000,X : CMP.W #$FFFF : BNE .processEnemySet 
    JMP.W .return 


.processEnemySet:
    JSR.W ProcessEnemySet_LoadPalettesAndEnemyLoadingData 

.return:
    PLB : PLP 
    RTL 


Initialise_Enemies:
    PHP : PHB 
    LDY.W #$1400 
    LDX.W #$0000 
    LDA.W #$0000 

.loopExtraEnemyRAM:
    STA.L $7E7000,X 
    INX #2
    DEY 
    BNE .loopExtraEnemyRAM 
    PEA.W $A000 
    PLB : PLB 
    REP #$30 
    STZ.W $0E4E 
    STZ.W $0E50 
    STZ.W $183C 
    LDX.W #$011E 
    LDA.W #$0000 

.loopExtraEnemyProjectileRAM:
    STA.L $7EF380,X 
    DEX #2
    BPL .loopExtraEnemyProjectileRAM 
    LDX.W #$0022 
    LDA.W #$FFFF 

.loopEnemyProjectileKilledEnemyIndices:
    STA.L $7EF410,X 
    DEX #2
    BPL .loopEnemyProjectileKilledEnemyIndices 
    LDX.W $07CF 
    LDA.L $A10000,X : CMP.W #$FFFF : BNE + 
    JMP.W .return 


  + STZ.W $0E48 
    LDY.W #$0000 

.loop:
    JSR.W LoadEnemyGFXIndices 
    PHX 
    LDA.L $A10000,X 
    TAX 
    LDA.W $0008,X : STA.W $0F82,Y 
    LDA.W $000A,X : STA.W $0F84,Y 
    LDA.W $0004,X : STA.W $0F8C,Y 
    LDA.W $0039,X : AND.W #$00FF : STA.W $0F9A,Y 
    LDA.W $000C,X : STA.W $0FA6,Y 
    LDA.W $0010,X : BEQ + 
    STA.W $179C 

  + PLX 
    LDA.L $A10000,X : STA.W $0F78,Y 
    LDA.L $A10002,X : STA.W $0F7A,Y 
    LDA.L $A10004,X : STA.W $0F7E,Y 
    LDA.L $A10006,X : STA.W $0F92,Y 
    LDA.L $A10008,X : STA.W $0F86,Y 
    LDA.L $A1000A,X : STA.W $0F88,Y 
    LDA.L $A1000C,X : STA.W $0FB4,Y 
    LDA.L $A1000E,X : STA.W $0FB6,Y 
    LDA.W #$0000 : STA.W $0FA4,Y 
    STA.W $0F90,Y 
    LDA.W #$0001 : STA.W $0F94,Y 
    LDA.W #$0000 : STA.W $0FA4,Y 
    JSL.L Record_EnemySpawnData 
    PHX : PHY 
    STY.W $0E54 
    LDX.W $0F78,Y 
    LDA.W $0012,X : STA.W $1784 
    LDA.W $000C,X : STA.W $1786 
    PHB 
    JSL.L .executeInitAI 
    PLB : PLY : PLX 
    LDA.W #$0000 : STA.W $0F8E,Y 
    LDA.W $0F86,Y : BIT.W #$2000 
    BEQ .noInstructions 
    PHX : PHY 
    LDX.W #Spritemap_Common_Nothing 
    LDA.W $0F88,Y : BIT.W #$0004 
    BEQ + 
    LDX.W #ExtendedSpritemap_Common_Nothing 

  + TXA 
    STA.W $0F8E,Y 
    PLY : PLX 

.noInstructions:
    TYA 
    CLC : ADC.W #$0040 : TAY 
    TXA 
    CLC : ADC.W #$0010 : TAX 
    LDA.L $A10000,X : CMP.W #$FFFF : BEQ + 
    JMP.W .loop 


  + STY.W $0E4C 
    TYA 
    LSR #6
    STA.W $0E4E 
    LDA.L $A10002,X : AND.W #$00FF : STA.W $0E52 

.return:
    PLB : PLP 
    RTL 


.executeInitAI:
    LDA.W $0FA6,Y 
    XBA 
    PHA : PLB : PLB 
    JML.W [$1784] 


LoadEnemyGFXIndices:
    PHX : PHY 
    STX.B $12 
    STY.B $14 
    LDA.W $07D1 : STA.B $1C 
    STZ.B $1E 

.loop:
    LDX.B $12 
    LDA.L $A10000,X 
    LDX.B $1C : CMP.L $B40000,X : BEQ .found 
    LDA.L $B40000,X : CMP.W #$FFFF : BEQ .notFound 
    LDA.L $B40000,X 
    TAX 
    LDA.W $0000,X 
    LSR #5
    CLC : ADC.B $1E : STA.B $1E 
    LDA.B $1C : CLC : ADC.W #$0004 : STA.B $1C 
    BRA .loop 


.notFound:
    LDX.B $14 
    STZ.W $0F98,X 
    LDA.W #$0000 : STA.L $7E7006,X 
    LDA.W #$0A00 : STA.W $0F96,X 
    STA.L $7E7008,X 
    PLY : PLX 
    RTS 


.found:
    LDX.B $1C 
    LDA.L $B40002,X : AND.W #$000F 
    XBA 
    ASL A 
    LDX.B $14 
    STA.W $0F96,X 
    STA.L $7E7008,X 
    LDA.B $1E : STA.W $0F98,X 
    STA.L $7E7006,X 
    PLY : PLX 
    RTS 


LoadEnemyTileData:
    REP #$30 
    LDX.W #$01FE 

.loopSprites:
    LDA.L Tiles_Standard_Sprite_1,X : STA.L $7E7000,X 
    DEX #2
    BPL .loopSprites 
    LDA.W $0E7A : BEQ .return 
    LDX.W #$0000 
    PHB 

.loopEnemies:
    LDA.W $0E5C,X 
    TAY 
    CLC : ADC.W $0E5A,X : STA.B $12 
    LDA.W $0E5D,X 
    PHA : PLB : PLB 
    TXA 
    CLC : ADC.W #$0007 : PHA 
    LDA.W $0E5F,X 
    TAX 

.loopTiles:
    LDA.W $0000,Y : STA.L $7E7000,X 
    LDA.W $0002,Y : STA.L $7E7002,X 
    LDA.W $0004,Y : STA.L $7E7004,X 
    LDA.W $0006,Y : STA.L $7E7006,X 
    TXA 
    CLC : ADC.W #$0008 : TAX 
    TYA 
    CLC : ADC.W #$0008 : TAY 
    CPY.B $12 : BNE .loopTiles 
    PLX 
    CPX.W $0E7A : BNE .loopEnemies 
    STZ.W $0E7A 
    PLB 

.return:
    RTL 


TransferEnemyTilesToVRAM_InitialiseEnemies:
    REP #$30 
    LDA.W $0E7C : BNE .nonZeroSrcAddr 
    LDA.W #$7000 : STA.W $0E7C 
    LDX.W #$6C00 
    STX.W $0E7E 

.nonZeroSrcAddr:
    CMP.W #$FFFF : BNE .notFFFF 
    RTL 


.notFFFF:
    CMP.W #$FFFE : BNE .notFFFE 
    JSL.L Initialise_Enemies 
    LDA.W #$FFFF : STA.W $0E7C 
    RTL 


.notFFFE:
    CMP.W #$9800 : BEQ .finish 
    LDX.W $0330 
    LDA.W #$0800 : STA.B $D0,X 
    LDA.W $0E7C : STA.B $D2,X 
    CLC : ADC.W #$0800 : STA.W $0E7C 
    LDA.W #$007E : STA.B $D4,X 
    LDA.W $0E7E : STA.B $D5,X 
    CLC : ADC.W #$0400 : STA.W $0E7E 
    TXA 
    CLC : ADC.W #$0007 : STA.W $0330 
    RTL 


.finish:
    LDA.W #$FFFE : STA.W $0E7C 
    RTL 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_LoadEnemyWidthHeightHealthLayerBank_A08D3A:
    PHX : PHY 
    LDA.W $0000,X 
    TAX 
    LDA.W $0008,X : STA.W $0F82,Y 
    LDA.W $000A,X : STA.W $0F84,Y 
    LDA.W $0004,X : STA.W $0F8C,Y 
    LDA.W $0039,X : AND.W #$00FF : STA.W $0F9A,Y 
    LDA.W $000C,X : STA.W $0FA6,Y 
    PLY : PLX 
    RTL 
endif ; !FEATURE_KEEP_UNREFERENCED


ProcessEnemySet_LoadPalettesAndEnemyLoadingData:
    PHX : PHY 
    STZ.W $0E7A 
    LDA.W #$0800 : STA.B $1E 
    LDA.W #$0000 : STA.L $7EEF5C 
    STA.L $7EEF5E 
    STA.L $7EEF60 
    STA.L $7EEF62 
    STA.L $7EEF64 
    STA.L $7EEF66 
    STA.L $7EEF68 
    STA.L $7EEF6A 
    STA.L $7EEF6C 
    STA.L $7EEF6E 
    STA.L $7EEF70 
    STA.L $7EEF72 
    STA.L $7EEF74 
    STA.L $7EEF76 
    LDA.W $07D1 : STA.B $1C 

.loop:
    TAX 
    LDA.L $B40000,X : CMP.W #$FFFF : BNE .notFFFF 
    JMP.W .return 


.notFFFF:
    TAX 
    LDA.W $0000,X : STA.B $12 
    LDA.W $0002,X : STA.B $14 
    LDA.W $000C,X : STA.W $0E20 
    LDX.B $1C 
    LDA.L $B40002,X : AND.W #$00FF 
    CLC : ADC.W #$0008 : JSL.L MultiplyBy20_A0B002 
    CLC : ADC.W #$C200 : STA.B $16 
    PHB 
    LDA.W $0E20 
    XBA 
    PHA : PLB : PLB 
    LDA.W #$0010 : STA.W $0E2E 
    LDX.B $16 
    LDY.B $14 

.loopTargetEnemyPalette:
    LDA.W $0000,Y : STA.L $7E0000,X 
    INX #2
    INY #2
    DEC.W $0E2E 
    BNE .loopTargetEnemyPalette 
    PLB 
    LDX.B $1C 
    LDA.L $B40000,X 
    TAX 
    LDA.W $0036,X : STA.B $16 
    LDA.W $0038,X : AND.W #$00FF : STA.B $1A 
    LDX.W $0E7A 
    LDA.B $12 : AND.W #$7FFF : STA.W $0E5A,X 
    LDA.B $16 : STA.W $0E5C,X 
    LDA.B $1E : BIT.B $12 
    BPL .noMSB 
    PHX 
    LDX.B $1C 
    LDA.L $B40002,X : AND.W #$3000 
    LSR #3
    PLX 

.noMSB:
    STA.W $0E5F,X 
    SEP #$20 
    LDA.B $1A : STA.W $0E5E,X 
    REP #$20 
    LDA.W $0E7A : CLC : ADC.W #$0007 : STA.W $0E7A 
    PHX : PHY 
    LDA.L $7EEF74 
    TAX 
    LDA.L $7EEF76 : STA.L $7EEF64,X 
    PHX 
    LDX.B $1C 
    LDA.L $B40000,X 
    PLX 
    STA.L $7EEF5C,X 
    PHX 
    LDX.B $1C 
    LDA.L $B40002,X 
    PLX 
    STA.L $7EEF6C,X 
    LDA.L $7EEF74 : CLC : ADC.W #$0002 : STA.L $7EEF74 
    PLY : PLX 
    LDA.B $12 
    LSR #5
    CLC : ADC.L $7EEF76 : STA.L $7EEF76 
    LDX.B $1C 
    LDA.L $B40000,X 
    TAX 
    LDA.W $0000,X : CLC : ADC.B $1E : STA.B $1E 
    LDA.B $1C : CLC : ADC.W #$0004 : STA.B $1C 
    JMP.W .loop 


.return:
    PLY : PLX 
    RTS 


Determine_Which_Enemies_to_Process:
    PHB : PEA.W $A000 
    PLB : PLB 
    REP #$30 
    INC.W $0E46 
    STZ.W $0E54 
    STZ.W $17A4 
    STZ.W $17A6 
    LDA.W $183C : BEQ .resetIndex 
    JMP.W .loopProcessOffscreen 


.resetIndex:
    LDX.W #$0000 ; >_<
    LDY.W #$0000 

.loop:
    LDX.W $0E54 
    LDA.W $0F78,X : BEQ .next 
    CMP.W #EnemyHeaders_Respawn : BEQ .next 
    LDA.W $0F86,X : BIT.W #$0200 
    BEQ ..notDeleted 
    STZ.W $0F78,X 
    JMP.W .next 


..notDeleted:
    BIT.W #$0800 
    BNE .activeEnemies 
    LDA.W $0F8A,X : BIT.W #$0004 
    BNE .activeEnemies 
    LDA.W $0F7A,X : CLC : ADC.W $0F82,X : CMP.W $0911 : BMI .next 
    LDA.W $0911 : CLC : ADC.W #$0100 : CLC : ADC.W $0F82,X : CMP.W $0F7A,X : BMI .next 
    LDA.W $0F7E,X : CLC : ADC.W #$0008 : CMP.W $0915 : BMI .next 
    LDA.W $0915 : CLC : ADC.W #$00F8 : CMP.W $0F7E,X : BMI .next 

.activeEnemies:
    TXA 
    LDY.W $17A4 
    STA.W $17AC,Y 
    INY #2
    STY.W $17A4 
    LDA.W $0F86,X : BIT.W #$0400 
    BNE .next 
    TXA 
    LDY.W $17A6 
    STA.W $17EC,Y 
    INY #2
    STY.W $17A6 

.next:
    LDA.W $0E54 : CLC : ADC.W #$0040 : STA.W $0E54 
    CMP.W #$0800 : BPL .done 
    JMP.W .loop 


.done:
    LDA.W #$FFFF 
    LDY.W $17A4 
    STA.W $17AC,Y 
    LDY.W $17A6 
    STA.W $17EC,Y 
    PLB 
    RTL 


.loopProcessOffscreen:
    LDX.W $0E54 
    LDA.W $0F78,X : BEQ .nextProcessOffscreen 
    CMP.W #EnemyHeaders_Respawn : BEQ .nextProcessOffscreen 
    LDA.W $0F86,X : BIT.W #$0200 
    BEQ ..notDeleted 
    STZ.W $0F78,X 
    BRA .nextProcessOffscreen 


..notDeleted:
    TXA 
    LDY.W $17A4 
    STA.W $17AC,Y 
    STA.W $17EC,Y 
    INY #2
    STY.W $17A4 
    LDA.W $0F86,X : BIT.W #$0400 
    BNE .nextProcessOffscreen 
    TXA 
    LDY.W $17A6 
    STA.W $17EC,Y 
    INY #2
    STY.W $17A6 

.nextProcessOffscreen:
    LDA.W $0E54 : CLC : ADC.W #$0040 : STA.W $0E54 
    CMP.W #$0800 : BMI .loopProcessOffscreen 
    LDA.W #$FFFF 
    LDY.W $17A4 
    STA.W $17AC,Y 
    LDY.W $17A6 
    STA.W $17EC,Y 
    PLB 
    RTL 


Main_Enemy_Routine:
    PHB : PEA.W $A000 
    PLB : PLB 
    REP #$30 
    LDA.W $0E4C : BNE .processEnemies 
    JMP.W .return 


.processEnemies:
    LDA.W $0E1C : CMP.W #$FFFF : BEQ .resetEnemyIndices 
    TAX 
    LDA.W #$0040 : STA.W $0FA2,X 
    LDA.W #$FFFF : STA.W $0E1C 

.resetEnemyIndices:
    STZ.W $17AA 
    STZ.W $17A8 

.loop:
    LDY.W $17A8 
    LDA.W $17AC,Y : CMP.W #$FFFF : BNE ..notFFFF 
    JMP.W .return 


..notFFFF:
    STA.W $0E54 
    TAX 
    CLC : ADC.W #$0F78 : STA.W $0E58 
    LDA.W $0FA6,X : STA.W $1786 
    LDA.W $0F86,X : BIT.W #$0400 
    BNE .interactEnd 
    LDA.W $0FA0,X : BEQ .notInvincible 
    DEC.W $0FA0,X 
    JMP.W .interactEnd 


.notInvincible:
    LDA.W $0E12 : BNE .interactEnd 
    LDA.W $0A78 
    ORA.W $185E 
    BNE .checkParalyzed 
    JSR.W EnemyCollisionHandling 
    LDX.W $0E54 
    LDA.W $0F78,X : BNE .checkParalyzed 
    JMP.W .drawEnemyEnd 


.checkParalyzed:
    LDX.W $0E54 
    LDA.W $0F88,X : BIT.W #$0001 
    BNE .processAIEnd 

.interactEnd:
    STZ.W $17A2 
    LDA.W $0A78 
    ORA.W $185E 
    BEQ .timeNotFrozen 
    LDA.W $0F78,X 
    TAY 
    LDA.W $0020,Y : BEQ .processAIEnd 
    STA.W $1784 
    BRA .determineAIEnd 


.timeNotFrozen:
    LDX.W #$0000 
    LDY.W $0E54 
    LDA.W $0F8A,Y : BEQ + 

.loopBitIndex:
    INX 
    LSR A 
    BCS + 
    BRA .loopBitIndex 


  + TXA 
    ASL A 
    CLC : ADC.W $0F78,Y : TAX 
    LDA.W $0018,X : STA.W $1784 

.determineAIEnd:
    PHB 
    JSL.L .executeAI 
    PLB 
    BRA + 


.executeAI:
    LDX.W $0E54 
    LDA.W $0FA6,X : STA.W $1786 
    XBA 
    PHA : PLB : PLB 
    JML.W [$1784] 


  + LDA.W $0A78 
    ORA.W $185E 
    BNE .processAIEnd 
    LDX.W $0E54 
    INC.W $0FA4,X 
    LDA.W $0F86,X : BIT.W #$2000 
    BEQ .processAIEnd 
    LDA.W #$0002 : STA.L $7EF378 
    JSR.W ProcessEnemyInstructions 

.processAIEnd:
    LDX.W $0E54 
    LDA.W $0F88,X : BIT.W #$0001 
    BEQ .paralysedEnd 
    LDA.W $0F9C,X : CMP.W #$0001 : BEQ + 
    LDA.W $0F9E,X : CMP.W #$0001 : BNE .paralysedEnd 

  + LDA.W #$0000 : STA.L $7E7002,X 
    LDA.W #$0000 : JSL.L EnemyDeath 

.paralysedEnd:
    LDX.W $0E54 
    LDA.W $0F88,X : BIT.W #$0004 
    BNE + 
    JSL.L CheckIfEnemyIsOnScreen 
    BEQ + 
    BRA .drawEnemyEnd 


  + LDX.W $0E54 
    LDA.W $0F86,X : BIT.W #$0300 
    BNE .drawEnemyEnd 
    LDA.W $17A2 : BIT.W #$0001 
    BNE .drawEnemyEnd 
    JSR.W AddEnemyToDrawingQueue 

.drawEnemyEnd:
    LDX.W $0E54 
    LDA.W $0F9C,X : BEQ + 
    LDA.W $0A78 
    ORA.W $185E 
    BNE + 
    DEC.W $0F9C,X 
    LDA.W $0F9C,X : CMP.W #$0008 : BPL + 
    LDA.W $0F8A,X : AND.W #$FFFD : STA.W $0F8A,X 

  + INC.W $17A8 
    INC.W $17A8 
    JMP.W .loop 


.return:
    JSL.L HandleSpriteObjects 
    INC.W $0E44 
    LDA.W #$FFFF : STA.W $182C 
    STA.W $182E 
    STA.W $1830 
    STA.W $1832 
    STZ.W $1834 
    STZ.W $1836 
    STZ.W $1838 
    STZ.W $183A 
    PLB 
    RTL 


DecrementSamusHurtTimers_ClearActiveEnemyIndicesLists:
    LDA.W $18A8 : BEQ + 
    DEC.W $18A8 

  + LDA.W $18AA : BEQ + 
    DEC.W $18AA 

  + LDA.W $18AC : BEQ + 
    DEC.W $18AC 

  + LDA.W #$FFFF : STA.W $17EC 
    STA.W $17AC 
    RTL 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_LoggingRoutineForASpecificVertcalEnemyReaction_A0918B:
    PHB 
    LDA.W $1848 : BNE .nonZeroIndex 
    LDA.W #$9000 

.nonZeroIndex:
    TAX 
    LDA.W $0E44 : STA.L $7E0000,X 
    LDA.W $0FFE : STA.L $7E0002,X 
    LDA.W $1000 : STA.L $7E0004,X 
    LDA.W $0B5C : STA.L $7E0006,X 
    LDA.W $0B5A : STA.L $7E0008,X 
    LDA.W $0AFA : STA.L $7E000A,X 
    LDA.W $0AFC : STA.L $7E000C,X 
    LDA.W $0B2E : STA.L $7E000E,X 
    LDA.W $0B2C : STA.L $7E0010,X 
    LDA.W $0B00 : STA.L $7E0012,X 
    LDA.W $0A1C : STA.L $7E0014,X 
    LDA.W $0A1E : STA.L $7E0016,X 
    LDA.W #$0000 : STA.L $7E0018,X 
    STA.L $7E001A,X 
    STA.L $7E001C,X 
    STA.L $7E001E,X 
    TXA 
    CLC : ADC.W #$0020 : CMP.W #$9800 : BMI .return 
    LDA.W #$0000 

.return:
    STA.W $1848 
    PLB 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


Spawn_Enemy_Drops:
    PHP : PHB : PHX : PHY 
    STA.W $0E24 
    PEA.W $A000 
    PLB : PLB 
    REP #$30 
    LDY.W #EnemyProjectile_EnemyDeathPickup 
    LDA.W $0E20 : JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    PLX : PLY : PLB : PLP 
    RTL 


DeleteEnemyAndAnyConnectedEnemies:
    PHB 
    LDX.W $0E54 
    PHX 
    LDA.W $0F78,X 
    TAX 
    LDA.L $A00014,X : BNE + 
    INC A 

  + TAY 
    PLX 

.loop:
    STZ.W $0F78,X 
    TXA 
    CLC : ADC.W #$0040 : TAX 
    DEY 
    BNE .loop 
    PLB 
    RTL 


Debug_SpawnEnemy_ToEnemyIndex_inY:
    PHB 
    STX.W $0E20 
    STY.W $0E4A 
    LDA.W $0E54 : STA.W $0E56 
    LDA.W $1784 : STA.W $1788 
    LDA.W $1786 : STA.W $178A 
    LDA.W $0000,X 
    TAX 
    LDA.L $A00014,X : AND.W #$00FF : STA.W $0E26 
    JMP.W SpawnEnemy_AlwaysSucceed 


SpawnEnemy:
    PHB 
    STX.W $0E20 
    LDA.W $0E54 : STA.W $0E56 
    LDA.W $1784 : STA.W $1788 
    LDA.W $1786 : STA.W $178A 
    LDA.W $0000,X 
    TAY 
    PHX 
    TAX 
    LDA.L $A00014,X 
    PLX 
    DEC A 
    BPL + 
    LDA.W #$0000 

  + STA.W $0E22 
    STA.W $0E26 
    STZ.W $0E4A 

.loopFirstEnemy:
    LDX.W $0E4A 
    LDA.W $0F78,X : BNE .next 

.loopOtherEnemies:
    LDA.W $0F78,X : BNE .next 
    LDA.W $0E22 : BEQ SpawnEnemy_AlwaysSucceed 
    DEC.W $0E22 
    TXA 
    CLC : ADC.W #$0040 : TAX 
    CPX.W #$0800 : BMI .loopOtherEnemies 
    BRA .notFound 


.next:
    LDA.W $0E4A : CLC : ADC.W #$0040 : STA.W $0E4A 
    CMP.W #$0800 : BMI .loopFirstEnemy 

.notFound:
    LDA.W #$FFFF 
    PLB 
    RTL 


SpawnEnemy_AlwaysSucceed:
    LDY.W $0E4A 
    LDX.W $0E20 
    LDA.W $0000,X 
    LDX.W #$0000 : CMP.L $7EEF5C : BEQ .graphics 
    LDX.W #$0002 : CMP.L $7EEF5E : BEQ .graphics 
    LDX.W #$0004 : CMP.L $7EEF60 : BEQ .graphics 
    LDX.W #$0006 : CMP.L $7EEF62 : BEQ .graphics 
    LDA.W #$0000 : STA.W $0F98,Y 
    STA.W $0F96,Y 
    BRA + 


.graphics:
    LDA.L $7EEF64,X : STA.W $0F98,Y 
    LDA.L $7EEF6C,X 
    XBA 
    ASL A 
    STA.W $0F96,Y 

  + LDX.W $0E20 
    LDA.W $0000,X 
    TAX 
    LDA.L $A00008,X : STA.W $0F82,Y 
    LDA.L $A0000A,X : STA.W $0F84,Y 
    LDA.L $A00004,X : STA.W $0F8C,Y 
    LDA.L $A00039,X : AND.W #$00FF : STA.W $0F9A,Y 
    LDA.L $A0000C,X : STA.W $0FA6,Y 
    LDX.W $0E20 
    LDA.W $0000,X : STA.W $0F78,Y 
    LDA.W $0002,X : STA.W $0F7A,Y 
    LDA.W $0004,X : STA.W $0F7E,Y 
    LDA.W $0006,X : STA.W $0F92,Y 
    LDA.W $0008,X : STA.W $0F86,Y 
    LDA.W $000A,X : STA.W $0F88,Y 
    LDA.W $000C,X : STA.W $0FB4,Y 
    LDA.W $000E,X : STA.W $0FB6,Y 
    LDA.W #$0000 : STA.W $0FA4,Y 
    STA.W $0F90,Y 
    STA.W $0FA8,Y 
    STA.W $0FAA,Y 
    STA.W $0FAC,Y 
    STA.W $0FAE,Y 
    STA.W $0FB0,Y 
    STA.W $0FB2,Y 
    LDA.W #$0001 : STA.W $0F94,Y 
    LDA.W #$0000 : STA.W $0FA4,Y 
    JSL.L Record_EnemySpawnData 
    PHX : PHY 
    STY.W $0E54 
    LDX.W $0F78,Y 
    LDA.L $A00012,X : CMP.W #$8000 : BMI .processInstructions 
    STA.W $1784 
    LDA.L $A0000C,X : STA.W $1786 
    PHB 
    JSL.L .executeAI 
    PLB 

.processInstructions:
    PLY : PLX 
    LDA.W $0F86,Y : BIT.W #$2000 
    BEQ .nextEnemy 
    LDA.W #Spritemap_Common_Nothing : STA.W $0F8E,Y 

.nextEnemy:
    LDA.W $0E26 : BEQ .setAI 
    DEC.W $0E26 
    BEQ .setAI 
    LDA.W $0E4A : CLC : ADC.W #$0040 : STA.W $0E4A 
    LDA.W $0E20 : CLC : ADC.W #$0010 : STA.W $0E20 
    JMP.W SpawnEnemy_AlwaysSucceed 


.setAI:
    LDA.W $1788 : STA.W $1784 
    LDA.W $178A : STA.W $1786 
    LDA.W $0E56 : STA.W $0E54 
    LDX.W $0E4A 
    LDA.W #$0000 
    PLB 
    RTL 


.executeAI:
    LDA.W $0FA5,Y 
    PHA : PLB : PLB 
    JML.W [$1784] 


AddEnemyToDrawingQueue:
    PHX : PHY 
    LDX.W $0E54 
    LDA.W $0F9A,X 
    ASL A 
    STA.W $0E34 
    TAY 
    LDA.W AddressesForEnemyDrawingQueues,Y : CLC : ADC.W $0F68,Y : TAY 
    LDA.W $0E54 : STA.W $0000,Y 
    LDX.W $0E34 
    INC.W $0F68,X 
    INC.W $0F68,X 
    PLY : PLX 
    RTS 


WriteEnemyOAM_IfNotFrozenOrInvincibleFrame:
    PHB 
    LDX.W $0E54 
    LDA.W $0FA5,X 
    PHA : PLB : PLB 
    REP #$30 
    LDX.W $0E54 
    LDA.W $0F7A,X : SEC : SBC.W $0911 : CLC : ADC.L $7E7010,X : STA.W $0E22 
    STA.B $14 
    LDA.W $0F7E,X : SEC : SBC.W $0915 : CLC : ADC.L $7E7012,X : STA.W $0E20 
    STA.B $12 
    LDA.W $0FA2,X : BEQ .noShake 
    LDA.W $0FA4,X : AND.W #$0002 
    BEQ .zeroCounter 
    DEC.B $14 
    DEC.W $0E22 
    BRA .decrementShakeTimer 


.zeroCounter:
    INC.B $14 
    INC.W $0E22 

.decrementShakeTimer:
    DEC.W $0FA2,X 

.noShake:
    LDA.W $0F9C,X : BEQ .timerExpired 
    LDA.W $0E44 : AND.W #$0002 
    BEQ .timerExpired 
    LDA.W #$0000 : BRA .determinedPalette 


.timerExpired:
    LDA.W $0F9E,X : BEQ .useEnemyPalette 
    CMP.W #$005A : BCS .palette6 
    BIT.W #$0002 
    BEQ .useEnemyPalette 

.palette6:
    LDA.W #$0C00 : BRA .determinedPalette 


.useEnemyPalette:
    LDA.W $0F96,X 

.determinedPalette:
    STA.B $03 
    LDA.W $0F98,X : STA.B $00 
    LDA.W $0F88,X : BIT.W #$0004 
    BNE .extendedSpritemap 
    LDA.W $0F78,X : STA.L $7EF37E 
    LDA.W $0F92,X : STA.L $7EF37A 
    LDA.W $0E54 : STA.L $7EF37C 
    LDA.W #$0001 : STA.L $7EF378 
    LDY.W $0F8E,X 
    JSL.L AddSpritemapToOAM_WithBaseTileNumber_8AB8 
    PLB 
    RTS 


.extendedSpritemap:
    LDA.W $0F8E,X : CMP.W #$8000 

.crash:
    BMI .crash 
    TAY 
    LDA.W $0000,Y : AND.W #$00FF : STA.W $060B 
    INY #2
    .loop:
    LDA.W $0004,Y : STA.B $16 
    TAX 
    LDA.W $0000,X : CMP.W #$FFFE : BNE .notExtendedSpritemap 
    LDA.W $0000,Y : CLC : ADC.W $0E22 : STA.B $14 
    LDA.W $0002,Y : CLC : ADC.W $0E20 : STA.B $12 
    LDX.W $0E54 
    LDA.W $0F88,X : AND.W #$8000 
    BEQ .next 
    JSR.W ProcessExtendedTilemap 
    BRA .next 


.notExtendedSpritemap:
    LDA.W $0000,Y : CLC : ADC.W $0E22 : STA.B $14 
    ADC.W #$0080 : BIT.W #$FE00 
    BNE .next 
    LDA.W $0002,Y : CLC : ADC.W $0E20 : STA.B $12 
    ADC.W #$0080 : BIT.W #$FE00 
    BNE .next 
    PHY 
    LDA.B $12 : BIT.W #$FF00 
    BNE .offScreen 
    LDY.B $16 
    JSL.L AddSpritemapToOAM_WithBaseTileNumber_8B22 
    BRA .pullY 


.offScreen:
    LDY.B $16 
    JSL.L AddSpritemapToOAM_WithBaseTileNumber_Offscreen_8B96 

.pullY:
    PLY 

.next:
    TYA 
    CLC : ADC.W #$0008 : TAY 
    DEC.W $060B 
    BNE .loop 
    PLB 
    RTS 


NormalEnemyFrozenAI:
    PHX : PHY 
    LDX.W $0E54 
    STZ.W $0F9C,X 
    LDA.W $0F9E,X : BEQ .unsetFrozenAI 
    DEC.W $0F9E,X 
    LDA.W $09A6 : AND.W #$0002 
    BEQ .unsetFrozenAI 
    LDA.W #$0001 : BRA .return 


.unsetFrozenAI:
    LDA.W $0F8A,X : AND.W #$FFFB : STA.W $0F8A,X 
    STA.W $0F9E,X 
    LDA.W #$0000 

.return:
    PLY : PLX 
    RTL 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_ExecuteEnemyAI_A095AD:
    PHB : PHP : PEA.W $A000 
    PLB : PLB 
    REP #$30 
    LDX.W #$0000 
    LDY.W $0E54 
    LDA.W $0F8A,Y : BEQ + 

.loop:
    INX 
    LSR A 
    BCS + 
    BRA .loop 


  + TXA 
    ASL A 
    CLC : ADC.W $0F78,Y : TAX 
    LDA.W $0018,X : STA.W $1784 
    LDA.W $0FA6,Y : STA.W $1786 
    JSL.L .executeAI 
    PLP : PLB 
    RTL 


.executeAI:
    LDX.W $0E54 
    LDA.W $0FA6,X : STA.W $1786 
    XBA 
    PHA : PLB : PLB 
    JML.W [$1784] 


UNUSED_RespawnEnemy_A095F1:
    PHB : PEA.W $A000 
    PLB : PLB 
    REP #$30 
    LDA.W $0E54 
    LSR #2
    STA.B $12 
    LDA.W $07CF : CLC : ADC.B $12 : TAX 
    LDY.W $0E54 
    LDA.L $A10000,X : STA.W $0F78,Y 
    LDA.L $A10002,X : STA.W $0F7A,Y 
    LDA.L $A10004,X : STA.W $0F7E,Y 
    LDA.L $A10006,X : STA.W $0F92,Y 
    LDA.L $A10008,X : STA.W $0F86,Y 
    LDA.L $A1000A,X : STA.W $0F88,Y 
    LDA.L $A1000C,X : STA.W $0FB4,Y 
    LDA.L $A1000E,X : STA.W $0FB6,Y 
    PHX 
    TYX 
    LDA.L $7E7006,X : AND.W #$0E00 : STA.W $0F96,X 
    LDA.L $7E7006,X : AND.W #$01FF : STA.W $0F98,X 
    PLX 
    LDA.W #$0000 : STA.W $0F9E,Y 
    STA.W $0F9C,Y 
    STA.W $0FA0,Y 
    STA.W $0F90,Y 
    STA.W $0FA4,Y 
    STA.W $0FA8,Y 
    STA.W $0FAA,Y 
    STA.W $0FAC,Y 
    STA.W $0FAE,Y 
    STA.W $0FB0,Y 
    STA.W $0FB2,Y 
    LDA.W #$0001 : STA.W $0F94,Y 
    LDX.W $0E54 
    LDA.W $0F78,X 
    TAX 
    LDA.W $0012,X : STA.W $1784 
    LDA.W $0008,X : STA.W $0F82,Y 
    LDA.W $000A,X : STA.W $0F84,Y 
    LDA.W $0004,X : STA.W $0F8C,Y 
    LDA.W $0039,X : AND.W #$00FF : STA.W $0F9A,Y 
    LDA.W $000C,X : STA.W $0FA6,Y 
    STA.W $1786 
    JSL.L .executeAI 
    PLB 
    RTL 


.executeAI:
    LDX.W $0E54 
    LDA.W $0FA6,X : STA.W $1786 
    XBA 
    PHA : PLB : PLB 
    JML.W [$1784] 
endif ; !FEATURE_KEEP_UNREFERENCED


ProcessExtendedTilemap:
    PHY 
    LDY.B $16 
    INY #2
    .loop:
    LDA.W $0000,Y : CMP.W #$FFFF : BEQ .return 
    TAX 
    LDA.W $0002,Y : STA.W $060D 
    INY #4
    LSR A 
    BCC .unrolled 

.innerLoop:
    LDA.W $0000,Y : STA.L $7E0000,X 
    INX #2
    INY #2
    DEC.W $060D 
    BNE .innerLoop 
    JMP.W .loop 


.unrolled:
    LDA.W $0000,Y : STA.L $7E0000,X 
    LDA.W $0002,Y : STA.L $7E0002,X 
    INX #4
    INY #4
    CPX.W #$2800 

.crash:
    BPL .crash 
    DEC.W $060D 
    DEC.W $060D 
    LDA.W $060D : BNE .unrolled 
    JMP.W .loop 


.return:
    INC.W $0E1E 
    PLY 
    RTS 


Handle_Queuing_Enemy_BG2_Tilemap_VRAM_Transfer:
    LDA.W $0E1E : BEQ .clearTransferFlag 
    LDA.W $0A78 
    ORA.W $185E 
    BNE .clearTransferFlag 
    LDX.W $0330 
    LDA.W $179A : STA.B $D0,X 
    LDA.W #$2000 : STA.B $D2,X 
    LDA.W #$007E : STA.B $D4,X 
    LDA.W #$4800 : STA.B $D5,X 
    LDA.W $0330 : CLC : ADC.W #$0007 : STA.W $0330 

.clearTransferFlag:
    STZ.W $0E1E 
    RTL 


EnemyCollisionHandling:
    PHP : PHB : PEA.W $A000 
    PLB : PLB 
    REP #$30 
    LDX.W $0E54 
    LDA.W $0F88,X : BIT.W #$0004 
    BEQ .notExtendedSpritemap 
    JSR.W Enemy_vs_Projectile_CollisionHandling_ExtendedSpritemap 
    JSR.W Enemy_vs_Bomb_CollisionHandling_ExtendedSpritemap 
    JSR.W EnemySamusCollisionHandling_ExtendedSpritemap 
    PLB : PLP 
    RTS 


.notExtendedSpritemap:
    JSR.W Enemy_vs_ProjectileCollisionHandling 
    JSR.W Enemy_vs_Bomb_CollisionHandling 
    JSR.W Enemy_vs_Samus_CollisionHandling 
    PLB : PLP 
    RTS 


RTL_A09784:
    RTL 


Samus_Projectiles_Interaction_Handling:
    PHB : PEA.W $A000 
    PLB : PLB 
    REP #$30 
    LDA.W #$000A : STA.L $7EF378 
    LDA.W $18AE : BNE .returnUpper 
    LDA.W #$0005 : STA.W $187C 
    LDA.W $0CD2 : BNE .bombIsActive 
    LDA.W $0CCE : BNE .projectileIsActive 

.returnUpper:
    PLB 
    RTL 


.bombIsActive:
    LDA.W #$000A : STA.W $187C 

.projectileIsActive:
    LDA.W $18AC : BEQ .checkContactDamage 
    PLB 
    RTL 


.checkContactDamage:
    LDA.W $0A6E : BEQ .resetProjectileIndex 
    PLB 
    RTL 


.resetProjectileIndex:
    STZ.W $18A6 

.loop:
    LDA.W $18A6 
    ASL A 
    TAY 
    LDA.W $0C2C,Y : BNE .hasDamage 
    JMP.W .next 


.hasDamage:
    LDA.W $0C18,Y : BIT.W #$8000 
    BNE .gotoNext 
    AND.W #$0F00 
    CMP.W #$0700 : BMI .interactive 

.gotoNext:
    JMP.W .next 


.interactive:
    LDA.W $0C04,Y : AND.W #$0010 
    BNE .gotoNext 
    LDA.W $0B64,Y : SEC : SBC.W $0AF6 : BPL + 
    EOR.W #$FFFF 
    INC A 

  + SEC : SBC.W $0BB4,Y : BCC + 
    CMP.W $0AFE : BCS .gotoNext 

  + LDA.W $0B78,Y : SEC : SBC.W $0AFA : BPL + 
    EOR.W #$FFFF 
    INC A 

  + SEC : SBC.W $0BC8,Y : BCC .checkBombType 
    CMP.W $0B00 : BCC .checkBombType 
    BRA .next 


.checkBombType:
    LDA.W $0C18,Y : AND.W #$FF00 
    CMP.W #$0300 : BEQ .checkBombTimer 
    CMP.W #$0500 : BNE .notABomb 

.checkBombTimer:
    LDA.W $0C7C,Y : CMP.W #$0008 : BNE .next 
    LDA.W $0AF6 : CMP.W $0B64,Y : BEQ .straight 
    BMI .left 
    LDA.W #$0003 : BRA .storeBombJumpDirection 


.left:
    LDA.W #$0001 : BRA .storeBombJumpDirection 


.straight:
    LDA.W #$0002 

.storeBombJumpDirection:
    STA.W $0A56 
    BRA .next 


.notABomb:
    LDA.W $0C04,Y : ORA.W #$0010 : STA.W $0C04,Y 
    LDA.W $0C2C,Y : JSL.L Suit_Damage_Division 
    JSL.L Deal_A_Damage_to_Samus 
    LDA.W #$0060 : STA.W $18A8 
    LDA.W #$0005 : STA.W $18AA 
    LDY.W #$0000 
    LDA.W $0AF6 : SEC : SBC.W $1A4B,X : BMI .storeKnockbackDirection 
    LDY.W #$0001 

.storeKnockbackDirection:
    STY.W $0A54 
    BRA .returnLower 


.next:
    INC.W $18A6 
    LDA.W $18A6 : CMP.W $187C : BEQ .returnLower 
    JMP.W .loop 


.returnLower:
    PLB 
    RTL 


EnemyProjectile_Samus_Collision_Handling:
    PHP : PHB : PEA.W $A000 
    PLB : PLB 
    REP #$30 
    LDA.W #$000B : STA.L $7EF378 
    LDA.W $18A8 : BEQ .notInvincible 
    PLB : PLP 
    RTL 


.notInvincible:
    LDA.W $0A6E : BNE .return 
    LDA.W #$0022 : STA.W $18A6 

.loop:
    LDX.W $18A6 
    LDA.W $1997,X : BEQ .next 
    LDA.W $1BD7,X : BIT.W #$2000 
    BNE .next 
    LDA.W $1BB3,X : AND.W #$00FF 
    BNE .hasXHitbox 
    JMP.W .next 


.hasXHitbox:
    STA.W $0E20 
    LDA.W $1BB4,X : AND.W #$00FF 
    BEQ .next 
    STA.W $0E22 
    LDA.W $0AF6 : SEC : SBC.W $1A4B,X : BPL + 
    EOR.W #$FFFF 
    INC A 

  + SEC : SBC.W $0AFE : BCC .checkY 
    CMP.W $0E20 : BCS .next 

.checkY:
    LDA.W $0AFA : SEC : SBC.W $1A93,X : BPL + 
    EOR.W #$FFFF 
    INC A 

  + SEC : SBC.W $0B00 : BCC .handleCollision 
    CMP.W $0E22 : BCC .handleCollision 
    BRA .next 


.handleCollision:
    JSR.W HandleEnemyProjectileCollisionWithSamus 

.next:
    DEC.W $18A6 
    DEC.W $18A6 
    LDA.W $18A6 : BPL .loop 

.return:
    PLB : PLP 
    RTL 


HandleEnemyProjectileCollisionWithSamus:
    LDA.W #$0060 : STA.W $18A8 
    LDA.W #$0005 : STA.W $18AA 
    TXY 
    LDX.W $1997,Y 
    LDA.L $86000A,X : BEQ .checkContact 
    STA.W $1B47,Y 
    LDA.W #$0001 : STA.W $1B8F,Y 

.checkContact:
    TYX 
    BIT.W $1BD7,X 
    BVS .dontDelete 
    STZ.W $1997,X 

.dontDelete:
    LDA.W $1BD7,X : AND.W #$0FFF 
    JSL.L Suit_Damage_Division 
    JSL.L Deal_A_Damage_to_Samus 
    LDY.W #$0000 
    LDA.W $0AF6 : SEC : SBC.W $1A4B,X : BMI .knockbackDirection 
    LDY.W #$0001 

.knockbackDirection:
    STY.W $0A54 
    RTS 


Projectile_vs_Projectile_Collision_Handling:
    PHP : PHB : PEA.W $A000 
    PLB : PLB 
    REP #$30 
    LDA.W #$000C : STA.L $7EF378 
    LDA.W $0CCE : BNE .setIndex 
    PLB : PLP 
    RTL 


.setIndex:
    LDA.W #$0022 : STA.W $18A6 

.loopEnemyProjectile:
    LDX.W $18A6 
    LDA.W $1997,X : BEQ .nextEnemyProjectile 
    LDA.W $1BD7,X : BPL .nextEnemyProjectile 
    LDY.W #$0000 

.loopProjectile:
    LDA.L $7EF380,X : CMP.W #$0002 : BEQ .nextEnemyProjectile 
    LDA.W $0C18,Y : BEQ .nextProjectile 
    AND.W #$0F00 
    CMP.W #$0300 : BEQ .nextProjectile 
    CMP.W #$0500 : BEQ .nextProjectile 
    CMP.W #$0700 : BPL .nextProjectile 
    LDA.W $0B64,Y : AND.W #$FFE0 : STA.B $12 
    LDA.W $1A4B,X : AND.W #$FFE0 
    CMP.B $12 : BNE .nextProjectile 
    LDA.W $0B78,Y : AND.W #$FFE0 : STA.B $12 
    LDA.W $1A93,X : AND.W #$FFE0 
    CMP.B $12 : BNE .nextProjectile 
    JSR.W HandleEnemyProjectileCollisionWithProjectile 

.nextProjectile:
    INY #2
    CPY.W #$000A : BMI .loopProjectile 

.nextEnemyProjectile:
    DEC.W $18A6 
    DEC.W $18A6 
    LDA.W $18A6 : BMI .return 
    JMP.W .loopEnemyProjectile 


.return:
    PLB : PLP 
    RTL 


HandleEnemyProjectileCollisionWithProjectile:
    LDA.W $0C18,Y : BIT.W #$0008 
    BNE .plasmaBeam 
    LDA.W $0C04,Y : ORA.W #$0010 : STA.W $0C04,Y 

.plasmaBeam:
    LDA.L $7EF380,X : CMP.W #$0001 : BEQ .buggyDudShot 
    LDA.W $0C18,Y 
    PHY 
    TXY 
    STA.W $1BFB,Y 
    LDX.W $1997,Y 
    LDA.L $86000C,X : STA.W $1B47,Y 
    LDA.W #$0001 : STA.W $1B8F,Y 
    LDA.W #RTS_8684FB : STA.W $1A03,Y 
    LDA.W $1BD7,Y : AND.W #$0FFF : STA.W $1BD7,Y 
    TYX 
    PLY 
    RTS 


.buggyDudShot:
    LDA.W $0B64,X : STA.B $12 
    LDA.W $0B78,X : STA.B $14 
    LDA.W #$0006 : STA.B $16 
    STZ.B $18 
    JSL.L Create_Sprite_Object 
    LDA.W #$003D : JSL.L QueueSound_Lib1_Max6 
    RTS 


EnemySamusCollisionHandling_ExtendedSpritemap:
    PHB 
    LDX.W $0E54 
    LDA.W $0FA6,X : STA.W $1786 
    XBA 
    PHA : PLB : PLB 
    LDA.W #$0006 : STA.L $7EF378 
    LDY.W $0E54 
    LDA.W $0F8E,Y : BEQ .returnUpper 
    LDA.W $0F78,X 
    TAX 
    LDA.L $A00030,X : CMP.W #RTL_A0804C : BEQ .returnUpper 
    CMP.W #RTS_A0804B : BNE .touch 

.returnUpper:
    PLB 
    RTS 


.touch:
    LDA.W $0A6E : BEQ .normalContact 
    STZ.W $18A8 
    BRA .notInvincible 


.normalContact:
    LDA.W $18A8 : BNE .returnUpper 

.notInvincible:
    LDX.W $0E54 
    LDA.W $0F8E,X : CMP.W #$8000 : BMI .returnUpper 
    LDA.W $0AF6 : CLC : ADC.W $0AFE : STA.W $187E 
    LDA.W $0AF6 : SEC : SBC.W $0AFE : STA.W $1880 
    LDA.W $0AFA : CLC : ADC.W $0B00 : STA.W $1882 
    LDA.W $0AFA : SEC : SBC.W $0B00 : STA.W $1884 
    LDA.W $0F8E,X 
    TAX 
    LDA.W $0000,X : AND.W #$00FF : STA.W $060B 
    INX #2
    STX.W $186E 

.loopSpritemapEntries:
    LDX.W $186E 
    LDY.W $0E54 
    LDA.W $0F7A,Y : CLC : ADC.W $0000,X : STA.W $187A 
    LDA.W $0F7E,Y : CLC : ADC.W $0002,X : STA.W $187C 
    LDA.W $0006,X 
    TAX 
    LDA.W $0000,X : BEQ .nextSpritemapEntry 
    STA.W $060D 
    INX #2
    STX.W $1878 

.loopHitboxes:
    LDX.W $1878 
    LDA.W $187A : CLC : ADC.W $0000,X : CMP.W $187E : BPL .nextHitboxEntry 
    LDA.W $187A : CLC : ADC.W $0004,X : CMP.W $1880 : BMI .nextHitboxEntry 
    LDA.W $187C : CLC : ADC.W $0002,X : CMP.W $1882 : BPL .nextHitboxEntry 
    LDA.W $187C : CLC : ADC.W $0006,X : CMP.W $1884 : BMI .nextHitboxEntry 
    JSL.L .executeAI 
    BRA .returnLower 


.executeAI:
    LDX.W $1878 
    LDA.W $0008,X : STA.W $1784 
    JML.W [$1784] 


.nextHitboxEntry:
    LDA.W $1878 : CLC : ADC.W #$000C : STA.W $1878 
    DEC.W $060D 
    LDA.W $060D : BEQ .nextSpritemapEntry 
    BMI .nextSpritemapEntry 
    JMP.W .loopHitboxes 


.nextSpritemapEntry:
    LDA.W $186E : CLC : ADC.W #$0008 : STA.W $186E 
    DEC.W $060B 
    LDA.W $060B : BEQ .returnLower 
    BMI .returnLower 
    JMP.W .loopSpritemapEntries 


.returnLower:
    PLB 
    RTS 


Enemy_vs_Projectile_CollisionHandling_ExtendedSpritemap:
    PHB 
    LDX.W $0E54 
    LDA.W $0FA6,X : STA.W $1786 
    XBA 
    PHA : PLB : PLB 
    LDA.W #$0003 : STA.L $7EF378 
    LDA.W $0CCE : BNE .nonZeroCounter 
    PLB 
    RTS 


.nonZeroCounter:
    STA.W $060F 
    LDY.W $0E54 
    LDA.W $0F8E,Y : BEQ .returnUpper 
    CMP.W #ExtendedSpritemap_Common_Nothing : BEQ .returnUpper 
    LDX.W $0F78,Y 
    LDA.L $A00032,X : CMP.W #RTL_A0804C : BEQ .returnUpper 
    CMP.W #RTS_A0804B : BNE + 

.returnUpper:
    PLB 
    RTS 


  + LDX.W $0E54 
    LDA.W $0F86,X : BIT.W #$0400 
    BNE .returnUpper 
    LDA.W $0FA0,X : BNE .returnUpper 
    LDA.W $0F78,X : CMP.W #EnemyHeaders_Respawn : BEQ .returnUpper 
    STZ.W $18A6 

.loopProjectiles:
    LDX.W $0E54 
    LDA.W $18A6 
    ASL A 
    TAY 
    LDA.W $0C18,Y : BEQ .gotoNextProjectile 
    AND.W #$0F00 
    CMP.W #$0300 : BEQ .gotoNextProjectile 
    CMP.W #$0500 : BEQ .gotoNextProjectile 
    CMP.W #$0700 : BMI .validProjectile 

.gotoNextProjectile:
    JMP.W .nextProjectile 


.validProjectile:
    LDX.W $0E54 
    LDA.W $0F8E,X : CMP.W #$8000 

.crash:
    BMI .crash 
    TAX 
    LDA.W $0000,X : AND.W #$00FF : STA.W $060B 
    INX #2
    STX.W $186E 

.loopSpritemapEntries:
    LDX.W $186E 
    LDY.W $0E54 
    LDA.W $0F7A,Y : CLC : ADC.W $0000,X : STA.W $187A 
    LDA.W $0F7E,Y : CLC : ADC.W $0002,X : STA.W $187C 
    LDA.W $0006,X 
    TAX 
    LDA.W $0000,X : BNE .entriesRemaining 
    JMP.W .nextSpritemapEntry 


.entriesRemaining:
    STA.W $060D 
    INX #2
    STX.W $1878 

.loopHitboxes:
    LDX.W $1878 
    LDA.W $18A6 
    ASL A 
    TAY 
    LDA.W $0000,X : CLC : ADC.W $187A : STA.W $1870 
    LDA.W $0B64,Y : CLC : ADC.W $0BB4,Y : CMP.W $1870 : BPL + 
    JMP.W .nextHitbox 


  + LDA.W $0004,X : CLC : ADC.W $187A : STA.W $1874 
    LDA.W $0B64,Y : SEC : SBC.W $0BB4,Y : CMP.W $1874 : BPL .nextHitbox 
    LDA.W $0002,X : CLC : ADC.W $187C : STA.W $1872 
    LDA.W $0B78,Y : CLC : ADC.W $0BC8,Y : CMP.W $1872 : BMI .nextHitbox 
    LDA.W $0006,X : CLC : ADC.W $187C : STA.W $1876 
    LDA.W $0B78,Y : SEC : SBC.W $0BC8,Y : CMP.W $1876 : BPL .nextHitbox 
    LDA.W $0C18,Y : AND.W #$0F00 
    CMP.W #$0200 : BNE .notSuperMissile 
    LDA.W #$001E : STA.W $1840 
    LDA.W #$0012 : STA.W $183E 

.notSuperMissile:
    LDX.W $0E54 
    LDA.W $0F86,X : BIT.W #$1000 
    BNE .delete 
    LDA.W $0C18,Y : AND.W #$0008 
    BNE .noDelete 

.delete:
    LDA.W $0C04,Y : ORA.W #$0010 : STA.W $0C04,Y 

.noDelete:
    JSL.L .executeCollision 
    BRA .returnLower 


.nextHitbox:
    LDA.W $1878 : CLC : ADC.W #$000C : STA.W $1878 
    DEC.W $060D 
    BEQ .nextSpritemapEntry 
    BMI .nextSpritemapEntry 
    JMP.W .loopHitboxes 


.nextSpritemapEntry:
    LDA.W $186E : CLC : ADC.W #$0008 : STA.W $186E 
    DEC.W $060B 
    BEQ .nextProjectile 
    BMI .nextProjectile 
    JMP.W .loopSpritemapEntries 


.nextProjectile:
    INC.W $18A6 
    LDA.W $18A6 : CMP.W #$0005 : BPL .returnLower 
    JMP.W .loopProjectiles 


.returnLower:
    PLB 
    RTS 


.executeCollision:
    LDX.W $1878 
    LDA.W $000A,X : STA.W $1784 
    JML.W [$1784] 


Enemy_vs_Bomb_CollisionHandling_ExtendedSpritemap:
    PHB 
    LDX.W $0E54 
    LDA.W $0FA6,X : STA.W $1786 
    XBA 
    PHA : PLB : PLB 
    LDA.W #$0004 : STA.L $7EF378 
    LDY.W $0E54 
    LDA.W $0F8E,Y : BEQ .returnUpper 
    LDX.W $0E54 
    LDA.W $0F86,X : BIT.W #$0400 
    BNE .returnUpper 
    LDA.W $0FA0,X : BNE .returnUpper 
    LDY.W $0E54 
    LDX.W $0F78,Y 
    LDA.L $A00032,X : CMP.W #RTL_A0804C : BEQ .returnUpper 
    CMP.W #RTS_A0804B : BNE + 

.returnUpper:
    PLB 
    RTS 


  + LDA.W $0CD2 : BEQ .returnUpper 
    LDA.W #$0005 : STA.W $18A6 

.loopProjectiles:
    LDX.W $0E54 
    LDA.W $18A6 
    ASL A 
    TAY 
    LDA.W $0B64,Y : BNE .notZeroX 
    JMP.W .nextProjectile 


.notZeroX:
    LDA.W $0C18,Y : BEQ .gotoNextProjectile 
    AND.W #$0F00 
    CMP.W #$0500 : BEQ .bomb 

.gotoNextProjectile:
    JMP.W .nextProjectile 


.bomb:
    LDA.W $0C7C,Y : BEQ .timerExpired 
    JMP.W .nextProjectile 


.timerExpired:
    LDA.W $0F8E,X : CMP.W #$8000 

.crash:
    BMI .crash 
    TAX 
    LDA.W $0000,X : AND.W #$00FF : STA.W $060B 
    INX #2
    STX.W $186E 

.loopSpritemapEntries:
    LDX.W $186E 
    LDY.W $0E54 
    LDA.W $0F7A,Y : CLC : ADC.W $0000,X : STA.W $187A 
    LDA.W $0F7E,Y : CLC : ADC.W $0002,X : STA.W $187C 
    LDA.W $0006,X 
    TAX 
    LDA.W $0000,X : BNE + 
    JMP.W .nextSpritemapEntry 


  + STA.W $060D 
    INX #2
    STX.W $1878 

.loopHitboxes:
    LDX.W $1878 
    LDA.W $18A6 
    ASL A 
    TAY 
    LDA.W $0000,X : CLC : ADC.W $187A : STA.W $1870 
    LDA.W $0B64,Y : CLC : ADC.W $0BB4,Y : CMP.W $1870 : BPL + 
    JMP.W .nextHitbox 


  + LDA.W $0004,X : CLC : ADC.W $187A : STA.W $1874 
    LDA.W $0B64,Y : SEC : SBC.W $0BB4,Y : CMP.W $1874 : BPL .nextHitbox 
    LDA.W $0002,X : CLC : ADC.W $187C : STA.W $1872 
    LDA.W $0B78,Y : CLC : ADC.W $0BC8,Y : CMP.W $1872 : BMI .nextHitbox 
    LDA.W $0006,X : CLC : ADC.W $187C : STA.W $1876 
    LDA.W $0B78,Y : SEC : SBC.W $0BC8,Y : CMP.W $1876 : BPL .nextHitbox 
    LDA.W $0C04,Y : ORA.W #$0010 : STA.W $0C04,Y 
    JSL.L .executeCollision 
    BRA .returnLower 


.nextHitbox:
    LDA.W $1878 : CLC : ADC.W #$000C : STA.W $1878 
    DEC.W $060D 
    LDA.W $060D : BEQ .nextSpritemapEntry 
    BMI .nextSpritemapEntry 
    JMP.W .loopHitboxes 


.nextSpritemapEntry:
    LDA.W $186E : CLC : ADC.W #$0008 : STA.W $186E 
    DEC.W $060B 
    LDA.W $060B : BEQ .nextProjectile 
    BMI .nextProjectile 
    JMP.W .loopSpritemapEntries 


.nextProjectile:
    INC.W $18A6 
    LDA.W $18A6 : CMP.W #$000A : BEQ .returnLower 
    JMP.W .loopProjectiles 


.returnLower:
    PLB 
    RTS 


.executeCollision:
    LDX.W $1878 
    LDA.W $000A,X : STA.W $1784 
    JML.W [$1784] 


EnemyGrappleBeamCollisionDetection:
    PHB : PHX : PHY 
    LDA.W #$000D : JSL.L Run_Samus_Command 
    BNE + 
    JMP.W .grappleIndexDetermined 


  + STZ.W $18A6 
    STZ.W $17AA 

.loop:
    LDY.W $17AA 
    LDA.W $17EC,Y : STA.W $0E54 
    CMP.W #$FFFF : BNE .notFFFF 
    STZ.B $12 
    LDA.W #$0000 
    PLY : PLX : PLB 
    RTL 


.notFFFF:
    TAX 
    LDA.W $0FA0,X : BNE .next 
    LDA.W $0F7A,X : SEC : SBC.W $0D08 : BPL + 
    EOR.W #$FFFF 
    INC A 

  + SEC : SBC.W $0F82,X : BCC .Y 
    CMP.W #$0008 : BCS .next 

.Y:
    LDA.W $0F7E,X : SEC : SBC.W $0D0C : BPL + 
    EOR.W #$FFFF 
    INC A 

  + SEC : SBC.W $0F84,X : BCC .hit 
    CMP.W #$0008 : BCC .hit 

.next:
    INC.W $17AA 
    INC.W $17AA 
    JMP.W .loop 


.hit:
    LDA.W #$0001 : STA.W $0F8A,X 
    LDY.W #$0000 
    LDA.W $0F78,X 
    TAX 
    LDA.L $A0001A,X : CMP.W #Common_GrappleAI_NoInteraction : BEQ .grappleIndexDetermined 
    LDY.W #$0001 : CMP.W #Common_GrappleAI_SamusLatchesOn : BEQ .grappleIndexDetermined 
    INY 
    CMP.W #Common_GrappleAI_KillEnemy : BEQ .grappleIndexDetermined 
    INY 
    CMP.W #Common_GrappleAI_CancelGrappleBeam : BEQ .grappleIndexDetermined 
    INY 
    CMP.W #Common_GrappleAI_SamusLatchesOn_NoInvincibility : BEQ .grappleIndexDetermined 
    INY 
    CMP.W #UNUSED_Common_GrappleAI_SamusLatchesOn_ParalyzeEnemy_A08019 : BEQ .grappleIndexDetermined 
    INY 
    CMP.W #Common_GrappleAI_HurtSamus : BEQ .grappleIndexDetermined 
    LDY.W #$0000 

.grappleIndexDetermined:
    STX.B $12 
    TYA 
    CMP.W #$0001 : BEQ .attachGrapple 
    CMP.W #$0004 : BEQ .attachGrapple 
    CMP.W #$0005 : BEQ .attachGrapple 

.return:
    PLY : PLX : PLB 
    RTL 


.attachGrapple:
    PHA 
    LDX.W $0E54 
    LDA.W $0F7A,X : STA.W $0D08 
    LDA.W $0F7E,X : STA.W $0D0C 
    PLA 
    BRA .return 


GrappleAI_SwitchEnemyAIToMainAI:
    LDX.W $0E54 
    STZ.W $0F8A,X 
    STZ.W $0FA0,X 
    STZ.W $0F9E,X 
    STZ.W $0FA2,X 
    RTL 


GrappleAI_SamusLatchesOnWithGrapple:
    LDX.W $0E54 
    LDX.W $0E54 ; >_<
    LDA.W $0F7A,X : STA.W $0D08 
    LDA.W $0F7E,X : STA.W $0D0C 
    LDX.W $0E54 
    LDA.W $0F9E,X : BNE .frozen 
    LDX.W $0E54 
    LDA.W $0F78,X 
    TAX 
    LDA.L $A0000D,X : AND.W #$00FF 
    BNE .main 
    LDA.W #$0004 

.main:
    LDX.W $0E54 
    STA.W $0F9C,X 
    LDX.W $0E54 
    LDX.W $0E54 
    STZ.W $0F8A,X 
    RTL 


.frozen:
    LDX.W $0E54 
    LDA.W #$0004 : STA.W $0F8A,X 
    RTL 


GrappleAI_EnemyGrappleDeath:
    LDX.W $0E54 
    LDX.W $0E54 
    LDA.W #$0004 : STA.L $7E7002,X 
    LDA.W #$0000 : JSL.L EnemyDeath 
    LDX.W $0E54 
    STZ.W $0F8A,X 
    RTL 


GrappleAI_SwitchToFrozenAI:
    LDX.W $0E54 
    LDA.W #$0004 : STA.W $0F8A,X 
    RTL 


GrappleAI_SamusLatchesOnWithGrapple_NoInvincibility:
    LDX.W $0E54 
    LDA.W $0F9E,X : BNE .frozen 
    LDX.W $0E54 
    LDA.W $0F78,X 
    TAX 
    LDA.L $A00018,X : STA.W $1784 
    PHB 
    JSL.L .executeAI 
    PLB 
    LDX.W $0E54 
    LDA.W $0F7A,X : STA.W $0D08 
    LDA.W $0F7E,X : STA.W $0D0C 
    STZ.W $0F8A,X 
    RTL 


.executeAI:
    LDX.W $0E54 
    LDA.W $0FA6,X : STA.W $1786 
    XBA 
    PHA : PLB : PLB 
    JML.W [$1784] 


.frozen:
    LDX.W $0E54 
    LDA.W $0F7A,X : STA.W $0D08 
    LDA.W $0F7E,X : STA.W $0D0C 
    LDA.W #$0004 : STA.W $0F8A,X 
    RTL 


GrappleAI_SamusLatchesOnWithGrapple_ParalyzeEnemy:
    LDX.W $0E54 
    LDX.W $0E54 
    LDA.W $0F78,X 
    TAX 
    LDA.L $A0000D,X : AND.W #$00FF 
    BNE + 
    LDA.W #$0004 

  + LDX.W $0E54 
    STA.W $0F9C,X 
    LDX.W $0E54 
    LDX.W $0E54 
    STZ.W $0F8A,X 
    LDX.W $0E54 
    LDA.W $0F88,X : ORA.W #$0001 : STA.W $0F88,X 
    RTL 


GrappleAI_SwitchToFrozenAI_duplicate:
    LDX.W $0E54 
    LDA.W #$0004 : STA.W $0F8A,X 
    RTL 


Enemy_vs_Samus_CollisionHandling:
    PHB 
    REP #$30 
    PEA.W $A000 
    PLB : PLB 
    LDA.W #$0009 : STA.L $7EF378 
    LDY.W $0E54 
    LDA.W $0F8E,Y : BEQ .return 
    LDA.W $0A6E : BEQ .normalContactDamage 
    STZ.W $18A8 
    BRA .tangible 


.normalContactDamage:
    LDA.W $18A8 : BEQ .tangible 
    LDX.W $0E54 
    LDA.W $0F78,X : CMP.W #EnemyHeaders_Respawn : BNE .return 
    LDA.L $7E7000,X : BEQ .return 
    CMP.W #$0008 : BNE .tangible 

.return:
    PLB 
    RTS 


.tangible:
    LDX.W $0E54 
    LDY.W $0F78,X 
    LDA.W $0030,Y : CMP.W #RTL_A0804C : BEQ ..return 
    CMP.W #RTS_A0804B : BNE .hasTouchAI 

..return:
    PLB 
    RTS 


.hasTouchAI:
    LDX.W $0E54 
    LDA.W $0AF6 : SEC : SBC.W $0F7A,X : BPL + 
    EOR.W #$FFFF 
    INC A 

  + SEC : SBC.W $0AFE : BCC ..Y 
    CMP.W $0F82,X : BCS ..return 

..Y:
    LDA.W $0AFA : SEC : SBC.W $0F7E,X : BPL + 
    EOR.W #$FFFF 
    INC A 

  + SEC : SBC.W $0B00 : BCC + 
    CMP.W $0F84,X : BCC + 

..return:
    PLB 
    RTS 


  + LDX.W $0E54 
    LDA.W $0F8E,X 
    ASL A 
    STA.B $14 
    LDX.W $0E54 
    LDA.W $0F78,X : CMP.W #EnemyHeaders_Respawn : BEQ .gotoExecuteEnemyTouch 
    LDY.W $0E54 
    LDA.W $0F9E,Y : BEQ .gotoExecuteEnemyTouch 
    PLB 
    RTS 


.gotoExecuteEnemyTouch:
    JSL.L .executeEnemyTouch 
    PLB 
    RTS 


.executeEnemyTouch:
    LDY.W $0E54 
    LDA.W $0FA6,Y 
    XBA 
    PHA : PLB : PLB 
    LDX.W $0F78,Y 
    LDA.L $A00030,X : STA.W $1784 
    LDA.W $0FA6,Y : STA.W $1786 
    JML.W [$1784] 


Enemy_vs_ProjectileCollisionHandling:
    PHB 
    LDX.W $0E54 
    LDA.W $0FA6,X : STA.W $1786 
    XBA 
    PHA : PLB : PLB 
    LDA.W #$0007 : STA.L $7EF378 
    LDA.W $0CCE : BNE .nonZeroCounter 

.returnUpper:
    PLB 
    RTS 


.nonZeroCounter:
    LDY.W $0E54 
    LDA.W $0F8E,Y : BEQ .returnUpper 
    CMP.W #Spritemap_Common_Nothing : BEQ .returnUpper 
    LDA.W $0F86,Y : BIT.W #$0400 
    BNE .returnUpper 
    LDA.W $0F78,Y : CMP.W #EnemyHeaders_Respawn : BEQ .returnUpper 
    LDA.W $0FA0,Y : BNE .returnUpper 
    STZ.W $18A6 

.loop:
    LDX.W $0E54 
    LDA.W $18A6 
    ASL A 
    TAY 
    LDA.W $0C18,Y : BEQ .gotoNextProjectile 
    AND.W #$0F00 
    CMP.W #$0300 : BEQ .gotoNextProjectile 
    CMP.W #$0500 : BEQ .gotoNextProjectile 
    CMP.W #$0700 : BMI .validProjectile 

.gotoNextProjectile:
    JMP.W .nextProjectile 


.validProjectile:
    LDA.W $0B64,Y : SEC : SBC.W $0F7A,X : BPL + 
    EOR.W #$FFFF 
    INC A 

  + SEC : SBC.W $0BB4,Y : BCC .Y 
    CMP.W $0F82,X : BCS .nextProjectile 

.Y:
    LDA.W $0B78,Y : SEC : SBC.W $0F7E,X : BPL + 
    EOR.W #$FFFF 
    INC A 

  + SEC : SBC.W $0BC8,Y : BCC .checkSuper 
    CMP.W $0F84,X : BCC .checkSuper 
    BRA .nextProjectile 


.checkSuper:
    LDA.W $0C18,Y : AND.W #$0F00 
    CMP.W #$0200 : BNE .checkPlasma 
    LDA.W #$001E : STA.W $1840 
    LDA.W #$0012 : STA.W $183E 

.checkPlasma:
    LDA.W $18A6 
    ASL A 
    TAY 
    LDX.W $0E54 
    LDA.W $0F86,X : BIT.W #$1000 
    BNE .delete 
    LDA.W $0C18,Y : BIT.W #$0008 
    BNE .noDelete 

.delete:
    LDA.W $0C04,Y : ORA.W #$0010 : STA.W $0C04,Y 

.noDelete:
    JSL.L .executeEnemyShot 
    BRA .returnLower 


.nextProjectile:
    INC.W $18A6 
    LDA.W $18A6 : CMP.W #$0005 : BEQ .returnLower 
    JMP.W .loop 


.returnLower:
    PLB 
    RTS 


.executeEnemyShot:
    LDY.W $0E54 
    LDX.W $0F78,Y 
    LDA.L $A00032,X : STA.W $1784 
    JML.W [$1784] 


Enemy_vs_Bomb_CollisionHandling:
    PHB 
    LDX.W $0E54 
    LDA.W $0FA6,X : STA.W $1786 
    XBA 
    PHA : PLB : PLB 
    LDA.W #$0008 : STA.L $7EF378 
    LDA.W $0CD2 : BNE .nonZeroCounter 

.returnUpper:
    PLB 
    RTS 


.nonZeroCounter:
    LDY.W $0E54 
    LDA.W $0F8E,Y : BEQ .returnUpper 
    LDY.W $0E54 
    LDA.W $0FA0,Y : BNE .returnUpper 
    LDA.W $0F78,Y : CMP.W #EnemyHeaders_Respawn : BEQ .returnUpper 
    LDA.W #$0005 : STA.W $18A6 

.loop:
    LDX.W $0E54 
    LDA.W $18A6 
    ASL A 
    TAY 
    LDA.W $0C18,Y : BNE .projectileType 
    JMP.W .next 


.projectileType:
    LDA.W $0C7C,Y : BNE .next 
    LDA.W $0C18,Y : AND.W #$0F00 
    CMP.W #$0500 : BEQ .bomb 
    LDA.W $0C18,Y : BIT.W #$8000 
    BNE .bomb 
    JMP.W .next 


.bomb:
    LDA.W $0B64,Y : SEC : SBC.W $0F7A,X : BPL + 
    EOR.W #$FFFF 
    INC A 

  + SEC : SBC.W $0BB4,Y : BCC .Y 
    CMP.W $0F82,X : BCS .next 

.Y:
    LDA.W $0B78,Y : SEC : SBC.W $0F7E,X : BPL + 
    EOR.W #$FFFF 
    INC A 

  + SEC : SBC.W $0BC8,Y : BCC + 
    CMP.W $0F84,X : BCC + 
    BRA .next 


  + LDA.W $18A6 
    ASL A 
    TAY 
    LDA.W $0C7C,Y : BNE .next 
    LDA.W $0C04,Y : ORA.W #$0010 : STA.W $0C04,Y 
    JSL.L .executeEnemyShot 
    BRA .returnLower 


.next:
    INC.W $18A6 
    LDA.W $18A6 : CMP.W #$000A : BEQ .returnLower 
    JMP.W .loop 


.returnLower:
    PLB 
    RTS 


.executeEnemyShot:
    LDY.W $0E54 
    LDX.W $0F78,Y 
    LDA.L $A00032,X : STA.W $1784 
    JML.W [$1784] 


Process_Enemy_PowerBomb_Interaction:
    PHB 
    LDA.W #$0005 : STA.L $7EF378 
    LDA.W $0CEB : AND.W #$00FF : STA.B $12 
    BNE .hasRadius 
    PLB 
    RTL 


.hasRadius:
    LSR A 
    ADC.B $12 : LSR A 
    STA.B $14 
    LDA.W #$07C0 : STA.W $0E54 

.loop:
    LDX.W $0E54 
    LDA.W $0FA0,X : BNE .next 
    LDA.W $0F78,X : BEQ .next 
    CMP.W #EnemyHeaders_Respawn : BEQ .next 
    TAX 
    LDA.L $A0003C,X : BNE + 
    LDA.W #EnemyVulnerabilities_Default 

  + TAX 
    LDA.L $B4000F,X : AND.W #$007F 
    BEQ .next 
    LDX.W $0E54 
    LDA.W $0CE2 : SEC : SBC.W $0F7A,X : BPL + 
    EOR.W #$FFFF 
    INC A 

  + CMP.B $12 : BCS .next 
    LDA.W $0CE4 : SEC : SBC.W $0F7E,X : BPL + 
    EOR.W #$FFFF 
    INC A 

  + CMP.B $14 : BCS .next 
    LDA.W $0F78,X 
    TAX 
    LDA.L $A00028,X : BNE .enemyAI 
    LDA.W #Common_NormalEnemyPowerBombAI 

.enemyAI:
    STA.W $1784 
    JSL.L .executeEnemyAI 
    LDX.W $0E54 
    LDA.W $0F86,X : ORA.W #$0800 : STA.W $0F86,X 

.next:
    LDA.W $0E54 : SEC : SBC.W #$0040 : STA.W $0E54 
    BPL .loop 
    PLB 
    RTL 


.executeEnemyAI:
    LDX.W $0E54 
    LDA.W $0FA6,X : STA.W $1786 
    XBA 
    PHA : PLB : PLB 
    JML.W [$1784] 


EnemyDeath:
    PHP : PHB : PEA.W $A000 
    PLB : PLB 
    REP #$30 
    PHA 
    LDA.W $0F8A,X : CMP.W #$0001 : BNE .checkA 
    LDA.W #GrappleBeamFunction_Dropped : STA.W $0D32 

.checkA:
    PLA 
    CMP.W #$0005 : BMI .AIsValid 
    LDA.W #$0000 

.AIsValid:
    STA.W $0E20 
    LDX.W $0E54 
    LDY.W #EnemyProjectile_EnemyDeathExplosion 
    LDA.W $0E20 : JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    LDA.W $0F86,X : AND.W #$4000 : STA.B $12 
    LDY.W #$003E 
    LDX.W $0E54 

.loopClearEnemySlot:
    STZ.W $0F78,X 
    INX #2
    DEY #2
    BPL .loopClearEnemySlot 
    LDA.B $12 : BEQ .incEnemiesKilled 
    LDX.W $0E54 
    LDA.W #EnemyHeaders_Respawn : STA.W $0F78,X 
    LDA.W #$00A3 : STA.W $0FA6,X 

.incEnemiesKilled:
    INC.W $0E50 
    PLB : PLP 
    RTL 


RinkaDeath:
    PHP : PHB : PEA.W $A000 
    PLB : PLB 
    REP #$30 
    CMP.W #$0003 : BMI .AIsValid 
    LDA.W #$0000 

.AIsValid:
    STA.W $0E20 
    LDX.W $0E54 
    LDY.W #EnemyProjectile_EnemyDeathExplosion 
    LDA.W $0E20 : JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    LDA.W $0F86,X : AND.W #$4000 : STA.B $12 
    LDY.W #$003E 
    LDX.W $0E54 

.loopClearEnemySlot:
    STZ.W $0F78,X 
    INX #2
    DEY #2
    BPL .loopClearEnemySlot 
    LDA.B $12 : BEQ .return 
    LDX.W $0E54 
    LDA.W #EnemyHeaders_Respawn : STA.W $0F78,X 
    LDA.W #$00A3 : STA.W $0FA6,X 

.return:
    PLB : PLP 
    RTL 


Suit_Damage_Division:
    STA.B $12 
    LDA.W $09A2 : BIT.W #$0020 
    BNE .quarterDamage 
    LSR A 
    BCC .fullDamage 
    LSR.B $12 

.fullDamage:
    LDA.B $12 
    RTL 


.quarterDamage:
    LSR.B $12 
    LSR.B $12 
    LDA.B $12 
    RTL 


NormalEnemyTouchAI:
    LDX.W $0E54 
    JSR.W NormalEnemyTouchAI_NoDeathCheck 
    LDX.W $0E54 
    LDA.W $0F8C,X : BNE .return 
    LDA.W #$0006 : STA.L $7E7002,X 
    LDA.W #$0001 : JSL.L EnemyDeath 

.return:
    LDX.W $0E54 
    RTL 


NormalEnemyTouchAI_NoDeathCheck_External:
    LDX.W $0E54 
    JSR.W NormalEnemyTouchAI_NoDeathCheck 
    LDX.W $0E54 
    RTL 


NormalEnemyTouchAI_NoDeathCheck:
    LDA.W $0A6E : BNE .notNormal 
    JMP.W .normalSamus 


.notNormal:
    CLC : ADC.W #$000F : STA.B $14 
    LDY.W #$01F4 
    LDA.W $0A6E : CMP.W #$0001 : BEQ .damageCalculated 
    LDY.W #$012C : CMP.W #$0002 : BEQ .damageCalculated 
    LDY.W #$07D0 : CMP.W #$0003 : BEQ .damageCalculated 
    INC.B $14 
    LDY.W #$00C8 : CMP.W #$0004 : BNE .defaultDamage 
    LDA.W #$0004 : JSL.L Run_Samus_Command 
    BRA .damageCalculated 


.defaultDamage:
    LDY.W #$00C8 

.damageCalculated:
    STY.B $16 
    LDX.W $0E54 
    LDA.W $0F78,X 
    TAX 
    LDA.L $A0003C,X : BNE .nonZero 
    LDA.W #EnemyVulnerabilities_Default 

.nonZero:
    CLC : ADC.B $14 : TAX 
    LDA.L $B40000,X : STA.W $0E40 
    AND.W #$007F 
    STA.W $0E32 
    BEQ .return 
    CMP.W #$00FF : BEQ .return 
    LDA.W $0E32 : STA.B $28 
    LDA.B $16 
    LSR A 
    STA.B $26 
    JSL.L Multiplication_32bit_A0B6FF 
    LDA.B $2A : BEQ .return 
    STA.B $12 
    BRA .damage 


.return:
    RTS 


.damage:
    LDX.W $0E54 
    LDX.W $0E54 ; >_<
    LDA.W $0F78,X 
    TAX 
    LDA.L $A0000D,X : AND.W #$00FF 
    BNE .hurtTimerNotExpired 
    LDA.W #$0004 

.hurtTimerNotExpired:
    LDX.W $0E54 
    STA.W $0F9C,X 
    LDA.W $0F8A,X : ORA.W #$0002 : STA.W $0F8A,X 
    STZ.W $18A8 
    STZ.W $18AA 
    LDA.W $0F8C,X : SEC : SBC.B $12 : BPL .storeHealth 
    LDA.W #$0000 

.storeHealth:
    STA.W $0F8C,X 
    LDA.W #$000B : JSL.L QueueSound_Lib2_Max1 
    RTS 


.normalSamus:
    LDX.W $0E54 
    LDA.W $0F78,X 
    TAX 
    LDA.L $A00006,X : JSL.L Suit_Damage_Division 
    JSL.L Deal_A_Damage_to_Samus 
    LDA.W #$0060 : STA.W $18A8 
    LDA.W #$0005 : STA.W $18AA 
    LDY.W #$0000 
    LDX.W $0E54 
    LDA.W $0AF6 : SEC : SBC.W $0F7A,X : BMI .storeKnockbackDirection 
    LDY.W #$0001 

.storeKnockbackDirection:
    STY.W $0A54 
    RTS 


NormalEnemyPowerBombAI:
    LDX.W $0E54 
    JSR.W NormalEnemyPowerBombAI_NoDeathCheck 
    LDX.W $0E54 
    LDA.W $0F8C,X : BNE .return 
    LDA.W #$0003 : STA.L $7E7002,X 
    LDA.W #$0000 : JSL.L EnemyDeath 

.return:
    LDX.W $0E54 
    RTL 


NormalEnemyPowerBombAI_NoDeathCheck_External:
    LDX.W $0E54 
    JSR.W NormalEnemyPowerBombAI_NoDeathCheck 
    LDX.W $0E54 
    RTL 


NormalEnemyPowerBombAI_NoDeathCheck:
    LDX.W $0E54 
    LDA.W $0F78,X 
    TAX 
    LDA.L $A0003C,X : BNE .XNonZero 
    LDA.W #EnemyVulnerabilities_Default 

.XNonZero:
    TAX 
    LDA.L $B4000F,X : AND.W #$00FF 
    CMP.W #$00FF : BEQ .return 
    AND.W #$007F 
    STA.W $0E32 
    BEQ .return 
    LDA.W #$00C8 
    LSR A 
    STA.B $26 
    LDA.W $0E32 : STA.B $28 
    JSL.L Multiplication_32bit_A0B6FF 
    LDA.B $2A : STA.W $187A 
    BEQ .return 
    LDX.W $0E54 
    LDA.W #$0030 : STA.W $0FA0,X 
    LDX.W $0E54 
    LDA.W $0F78,X 
    TAX 
    LDA.L $A0000D,X : AND.W #$00FF 
    BNE .ANonZero 
    LDA.W #$0004 

.ANonZero:
    CLC : ADC.W #$0008 : LDX.W $0E54 
    STA.W $0F9C,X 
    LDA.W $0F8A,X : ORA.W #$0002 : STA.W $0F8A,X 
    LDA.W $0F8C,X : SEC : SBC.W $187A : BEQ .zeroHealth 
    BCS .storeHealth 

.zeroHealth:
    LDA.W #$0000 

.storeHealth:
    STA.W $0F8C,X 

.return:
    RTS 


NormalEnemyShotAI:
    STZ.W $0E2E 
    LDX.W $0E54 
    JSR.W NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic 
    LDX.W $0E54 
    LDA.W $0E2E : BEQ .notHit 
    LDX.W $0E54 
    LDA.W $0F7A,X : STA.B $12 
    LDA.W $0F7E,X : STA.B $14 
    LDA.W #$0037 : STA.B $16 
    STZ.B $18 
    JSL.L Create_Sprite_Object 

.notHit:
    LDA.W $0F8C,X : BNE .return 
    LDA.W $18A6 
    ASL A 
    TAY 
    LDA.W $0C18,Y 
    XBA 
    AND.W #$000F 
    STA.L $7E7002,X 
    LDY.W #$0002 : CMP.W #$0002 : BEQ .superMissile 
    LDA.W $0F78,X 
    TAX 
    LDA.L $A00022,X : BEQ .deathAnimationInY 

.deathAnimationInY:
    TAY 
    BRA .enemyDeath 


.superMissile:
    LDA.W $0F78,X 
    TAX 
    LDA.L $A00022,X : CMP.W #$0003 : BMI .enemyDeath 
    TAY 

.enemyDeath:
    TYA 
    JSL.L EnemyDeath 

.return:
    LDX.W $0E54 
    RTL 


NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External:
    STZ.W $0E2E 
    LDX.W $0E54 
    JSR.W NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic 
    LDX.W $0E54 
    RTL 


NormalEnemyShotAI_NoDeathCheck:
    STZ.W $0E2E 
    LDX.W $0E54 
    JSR.W NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic 
    LDA.W $0E2E : BEQ .return 
    LDX.W $0E54 
    LDA.W $0F7A,X : STA.B $12 
    LDA.W $0F7E,X : STA.B $14 
    LDA.W #$0037 : STA.B $16 
    STZ.B $18 
    JSL.L Create_Sprite_Object 

.return:
    LDX.W $0E54 
    RTL 


NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic:
    PHB 
    LDA.W $18A6 
    ASL A 
    TAX 
    LDA.W $0C2C,X : STA.W $187A 
    LDA.W $0C18,X : STA.B $12 
    PHX 
    LDX.W $0E54 
    LDA.W $0F78,X 
    TAX 
    LDA.L $A0003C,X : BNE .nonZero 
    LDA.W #EnemyVulnerabilities_Default 

.nonZero:
    STA.B $14 
    LDA.B $12 : BIT.W #$0F00 
    BNE .notBeam 
    LDA.B $12 : AND.W #$000F 
    CLC : ADC.B $14 : TAX 
    LDA.L $B40000,X : AND.W #$00FF : STA.W $0E40 
    AND.W #$007F 
    STA.W $0E32 
    LDA.W $0E40 : CMP.W #$00FF : BNE .checkCharge 
    JMP.W .freeze 


.checkCharge:
    LDA.B $12 : BIT.W #$0010 
    BEQ .calculateDamage 
    LDX.B $14 
    LDA.L $B40013,X : AND.W #$00FF 
    CMP.W #$00FF : BEQ .noDamage 
    AND.W #$000F 
    BEQ .noDamage 
    STA.W $0E32 

.calculateDamage:
    LDA.W $187A 
    LSR A 
    STA.B $26 
    LDA.W $0E32 : STA.B $28 
    JSL.L Multiplication_32bit_A0B6FF 
    LDA.B $2A : BEQ .noDamage 
    STA.W $187A 
    JMP.W .damage 


.notBeam:
    AND.W #$0F00 
    CMP.W #$0100 : BEQ + 
    CMP.W #$0200 : BNE .notMissile 

  + XBA 
    CLC : ADC.B $14 : TAX 
    LDA.L $B4000B,X : AND.W #$007F : STA.W $0E32 
    BRA .calculateDamage 


.notMissile:
    CMP.W #$0500 : BNE .checkPowerBomb 
    LDX.B $14 
    LDA.L $B4000E,X : AND.W #$007F : STA.W $0E32 
    BRA .calculateDamage 


.checkPowerBomb:
    CMP.W #$0300 : BNE .noDamage 
    LDX.B $14 
    LDA.L $B4000F,X : AND.W #$007F : STA.W $0E32 
    JMP.W .calculateDamage 


.noDamage:
    LDA.W $18A6 
    ASL A 
    TAX 
    LDA.W $0C04,X : ORA.W #$0010 : STA.W $0C04,X 
    LDA.W $0B64,X : STA.B $12 
    LDA.W $0B78,X : STA.B $14 
    LDA.W #$0006 : STA.B $16 
    STZ.B $18 
    JSL.L Create_Sprite_Object 
    LDA.W #$003D : JSL.L QueueSound_Lib1_Max3 
    PLX : PLB 
    RTS 


.freeze:
    LDX.W $0E54 
    LDA.W $0F9E,X : BNE .timerNotExpired 
    LDA.W #$000A : JSL.L QueueSound_Lib3_Max3 

.timerNotExpired:
    LDY.W #$0190 
    LDA.W $079F : CMP.W #$0002 : BNE .notNorfair 
    LDY.W #$012C 

.notNorfair:
    TYA 
    STA.W $0F9E,X 
    LDA.W $0F8A,X : ORA.W #$0004 : STA.W $0F8A,X 
    LDA.W #$000A : STA.W $0FA0,X 
    PLX : PLB 
    RTS 


.damage:
    PLX 
    LDX.W $0E54 
    LDX.W $0E54 
    LDA.W $0F78,X 
    TAX 
    LDA.L $A0000D,X : AND.W #$00FF 
    BNE + 
    LDA.W #$0004 

  + CLC : ADC.W #$0008 : LDX.W $0E54 
    STA.W $0F9C,X 
    LDA.W $0F8A,X : ORA.W #$0002 : STA.W $0F8A,X 
    LDA.W $0F9E,X : BNE .noFlashNoCry 
    PHX : PHY 
    LDA.W $0F78,X 
    TAX 
    LDA.L $A0000E,X : BEQ .setEnemyHit 
    JSL.L QueueSound_Lib2_Max3 

.setEnemyHit:
    PLY : PLX 
    INC.W $0E2E 

.noFlashNoCry:
    LDX.W $0E54 
    LDA.W $18A6 
    ASL A 
    TAY 
    LDA.W $0C18,Y : BIT.W #$0008 
    BEQ .notPlasma 
    LDA.W #$0010 : STA.W $0FA0,X 

.notPlasma:
    LDA.W $0F8C,X : SEC : SBC.W $187A : BEQ .checkKill 
    BCS .return 

.checkKill:
    LDA.W $18A6 
    ASL A 
    TAY 
    LDA.W $0C18,Y : AND.W #$0002 
    BEQ .enemyHealthZero 
    LDA.W $0E40 : AND.W #$00F0 
    CMP.W #$0080 : BEQ .enemyHealthZero 
    LDA.W $0F9E,X : BNE .enemyHealthZero 
    LDY.W #$0190 
    LDA.W $079F : CMP.W #$0002 : BNE ..notNorfair 
    LDY.W #$012C 

..notNorfair:
    TYA 
    STA.W $0F9E,X 
    LDA.W $0F8A,X : ORA.W #$0004 : STA.W $0F8A,X 
    LDA.W #$000A : STA.W $0FA0,X 
    LDA.W #$000A : JSL.L QueueSound_Lib3_Max3 
    PLB 
    RTS 


.enemyHealthZero:
    LDA.W #$0000 

.return:
    STA.W $0F8C,X 
    PLB 
    RTS 


CreateADudShot:
    PHX : PHY 
    LDA.W $18A6 
    ASL A 
    TAX 
    LDA.W $0B64,X : STA.B $12 
    LDA.W $0B78,X : STA.B $14 
    LDA.W #$0006 : STA.B $16 
    STZ.B $18 
    JSL.L Create_Sprite_Object 
    LDA.W #$003D : JSL.L QueueSound_Lib1_Max3 
    LDA.W $18A6 
    ASL A 
    TAX 
    LDA.W $0C04,X : ORA.W #$0010 : STA.W $0C04,X 
    PLY : PLX 
    RTL 


Samus_vs_SolidEnemy_CollisionDetection:
    PHP : PHB : PEA.W $A000 
    PLB : PLB 
    REP #$30 
    LDA.W $17A6 : BEQ .returnZeroUpper 
    BRA .execute 


.returnZeroUpper:
    LDA.W #$0000 
    PLB : PLP 
    RTL 


.execute:
    LDA.W $0B02 : AND.W #$0003 
    ASL A 
    TAX 
    JMP.W (.pointers,X) 


.pointers:
    dw .left 
    dw .right 
    dw .up 
    dw .down 

.left:
    LDA.B $12 
    EOR.W #$FFFF 
    INC A 
    CLC : ADC.W $0AF6 : STA.W $189A 
    LDA.W $0AF8 : SEC : SBC.B $14 : BCS ..checkTargetSubposition 
    DEC.W $189A 

..checkTargetSubposition:
    BEQ ..zeroTarget 
    DEC.W $189A 

..zeroTarget:
    LDA.W $0AFA : STA.W $189E 
    LDA.W $0AFC : STA.W $18A0 
    JMP.W .targetPositionSet 


.right:
    LDA.B $12 : CLC : ADC.W $0AF6 : STA.W $189A 
    LDA.B $14 : CLC : ADC.W $0AF8 : BCC ..checkTargetSubposition 
    INC.W $189A 

..checkTargetSubposition:
    BEQ ..zeroTarget 
    INC.W $189A 

..zeroTarget:
    LDA.W $0AFA : STA.W $189E 
    LDA.W $0AFC : STA.W $18A0 
    BRA .targetPositionSet 


.up:
    LDA.W $0AFA : SEC : SBC.B $12 : STA.W $189E 
    LDA.W $0AFC : SEC : SBC.B $14 : BCS ..checkTargetSubposition 
    DEC.W $189E 

..checkTargetSubposition:
    BEQ ..zeroTarget 
    DEC.W $189E 

..zeroTarget:
    LDA.W $0AF6 : STA.W $189A 
    LDA.W $0AF8 : STA.W $189C 
    BRA .targetPositionSet 


.down:
    LDA.B $12 : CLC : ADC.W $0AFA : STA.W $189E 
    LDA.B $14 : CLC : ADC.W $0AFC : BCC ..checkTargetSubposition 
    INC.W $189E 

..checkTargetSubposition:
    BEQ ..zeroTarget 
    INC.W $189E 

..zeroTarget:
    LDA.W $0AF6 : STA.W $189A 
    LDA.W $0AF8 : STA.W $189C 

.targetPositionSet:
    LDA.W $0AFE : STA.W $18A2 
    LDA.W $0B00 : STA.W $18A4 
    STZ.W $18A6 
    STZ.W $17AA 

.loop:
    LDY.W $17AA 
    LDA.W $17EC,Y : CMP.W #$FFFF : BNE .valid 
    JMP.W .returnZeroLower 


.valid:
    STA.W $18A6 
    TAX 
    LDA.W $0F9E,X : BNE .notFrozenNotSolid 
    LDA.W $0F86,X : BIT.W #$8000 
    BNE .notFrozenNotSolid 
    JMP.W .next 


.notFrozenNotSolid:
    TXA 
    CLC : ADC.W #$0F7A : TAX 
    LDY.W #$189A 
    LDA.B $00,X : SEC : SBC.W $0000,Y : BPL + 
    EOR.W #$FFFF 
    INC A 

  + SEC : SBC.B $08,X : BCC .checkY 
    CMP.W $0008,Y : BCS .gotoNext 

.checkY:
    LDA.B $04,X : SEC : SBC.W $0004,Y : BPL + 
    EOR.W #$FFFF 
    INC A 

  + SEC : SBC.B $0A,X : BCC .collision 
    CMP.W $000A,Y : BCC .collision 

.gotoNext:
    JMP.W .next 


.collision:
    LDA.W $0B02 : AND.W #$0003 
    ASL A 
    TAX 
    JMP.W (.collisionPointers,X) 


.collisionPointers:
    dw .collisionLeft 
    dw .collisionRight 
    dw .collisionUp 
    dw .collisionDown 

.collisionLeft:
    LDX.W $18A6 
    LDA.W $0F7A,X : CLC : ADC.W $0F82,X : STA.W $0E32 
    LDA.W $0AF6 : SEC : SBC.W $0AFE : SEC : SBC.W $0E32 : BEQ ..gotoTouching 
    BPL ..gotoNotTouching 
    JMP.W .gotoNextLower 


..gotoNotTouching:
    JMP.W .notTouching 


..gotoTouching:
    JMP.W .touching 


.collisionRight:
    LDX.W $18A6 
    LDA.W $0AF6 : CLC : ADC.W $0AFE : STA.W $0E32 
    LDA.W $0F7A,X : SEC : SBC.W $0F82,X : SEC : SBC.W $0E32 : BEQ .touching 
    BPL ..gotoNotTouching 
    JMP.W .gotoNextLower 


..gotoNotTouching:
    JMP.W .notTouching 


.collisionUp:
    LDX.W $18A6 
    LDA.W $0F7E,X : CLC : ADC.W $0F84,X : STA.W $0E32 
    LDA.W $0AFA : SEC : SBC.W $0B00 : SEC : SBC.W $0E32 : BEQ .touching 
    BPL ..gotoNotTouching 
    JMP.W .gotoNextLower 


..gotoNotTouching:
    JMP.W .notTouching 


.collisionDown:
    LDX.W $18A6 
    LDA.W $0AFA : CLC : ADC.W $0B00 : STA.W $0E32 
    LDA.W $0F7E,X : SEC : SBC.W $0F84,X : SEC : SBC.W $0E32 : BEQ .touching 
    BPL .notTouching 
    JMP.W .gotoNextLower 


.next:
    INC.W $17AA 
    INC.W $17AA 
    JMP.W .loop 


.touching:
    STZ.W $0AFC 
    LDX.W $18A6 
    LDA.W $0AF6 : STA.W $184A 
    LDA.W $0AF8 : STA.W $184C 
    LDA.W $0F7A,X : STA.W $184E 
    LDA.W $0F7C,X : STA.W $1850 
    LDA.B $12 : STA.W $1852 
    LDA.B $14 : STA.W $1854 
    LDA.W $0AFA : STA.W $1856 
    LDA.W $0AFC : STA.W $1858 
    LDA.W #$0001 : STA.W $185A 
    STZ.B $12 
    STZ.B $14 
    LDA.W $18A6 : STA.B $16 
    LDA.W $0B02 : AND.W #$0003 
    ASL A 
    TAX 
    LDA.W $18A6 : STA.W $182C,X 
    STZ.W $1834,X 
    LDA.W #$FFFF 
    PLB : PLP 
    RTL 


.notTouching:
    PHA 
    LDX.W $18A6 
    LDA.W $0AF6 : STA.W $184A 
    LDA.W $0AF8 : STA.W $184C 
    LDA.W $0F7A,X : STA.W $184E 
    LDA.W $0F7C,X : STA.W $1850 
    LDA.B $12 : STA.W $1852 
    LDA.B $14 : STA.W $1854 
    LDA.W $0AFA : STA.W $1856 
    LDA.W $0AFC : STA.W $1858 
    LDA.W #$0002 : STA.W $185A 
    LDA.W $0B02 : AND.W #$0003 
    ASL A 
    TAX 
    PLA 
    STA.B $12 
    STA.W $1834,X 
    STZ.B $14 
    LDA.W $18A6 : STA.B $16 
    LDA.W $18A6 : STA.W $182C,X 
    LDA.W #$FFFF 
    PLB : PLP 
    RTL 


.returnZeroLower:
    LDA.W #$0000 
    PLB : PLP 
    RTL 


.gotoNextLower:
    JMP.W .next 


if !FEATURE_KEEP_UNREFERENCED
.unused:
    PHA 
    LDX.W $18A6 
    LDA.W $0AF6 : STA.W $184A 
    LDA.W $0AF8 : STA.W $184C 
    LDA.W $0F7A,X : STA.W $184E 
    LDA.W $0F7C,X : STA.W $1850 
    LDA.B $12 : STA.W $1852 
    LDA.B $14 : STA.W $1854 
    LDA.W $0AFA : STA.W $1856 
    LDA.W $0AFC : STA.W $1858 
    LDA.W #$0003 : STA.W $185A 
    LDA.W $0B02 : AND.W #$0003 
    ASL A 
    TAX 
    PLA 
    EOR.W #$FFFF 
    INC A 
    STA.B $12 
    STA.W $1834,X 
    STZ.B $14 
    LDA.W $18A6 : STA.B $16 
    LDA.W $18A6 : STA.W $182C,X 
    LDA.W #$FFFF 
    PLB : PLP 
    RTL 


..return:
    LDA.W #$0000 
    PLB : PLP 
    RTL 
endif ; !FEATURE_KEEP_UNREFERENCED


CheckIfEnemyIsTouchingSamusFromBelow:
    LDA.W $0AF6 : SEC : SBC.W $0F7A,X : BPL + 
    EOR.W #$FFFF 
    INC A 

  + SEC : SBC.W $0AFE : BCC .checkY 
    CMP.W $0F82,X : BCC .checkY 
    LDA.W #$0000 
    RTL 


.checkY:
    LDA.W $0AFA : CLC : ADC.W #$0003 : SEC : SBC.W $0F7E,X : BPL .noTouch 
    EOR.W #$FFFF 
    INC A 
    SEC : SBC.W $0B00 : BCC .touching 
    CMP.W $0F84,X : BEQ .touching 
    BCC .touching 

.noTouch:
    LDA.W #$0000 
    RTL 


.touching:
    LDA.W #$FFFF 
    RTL 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_CheckIfEnemyIsTouchingSamusFromAbove_A0AC29:
    LDA.W $0AF6 : SEC : SBC.W $0F7A,X : BPL + 
    EOR.W #$FFFF 
    INC A 

  + SEC : SBC.W $0AFE : BCC .checkY 
    CMP.W $0F82,X : BCC .checkY 
    LDA.W #$0000 
    RTL 


.checkY:
    LDA.W $0AFA : SEC : SBC.W $0F7E,X : BPL .noTouch 
    EOR.W #$FFFF 
    INC A 
    SEC : SBC.W $0B00 : BCC .touching 
    CMP.W $0F84,X : BEQ .touching 
    BCC .touching 

.noTouch:
    LDA.W #$0000 
    RTL 


.touching:
    LDA.W #$FFFF 
    RTL 
endif ; !FEATURE_KEEP_UNREFERENCED


CheckIfEnemyIsTouchingSamus:
    LDA.W $0AF6 : SEC : SBC.W $0F7A,X : BPL + 
    EOR.W #$FFFF 
    INC A 

  + SEC : SBC.W $0AFE : BCC .checkY 
    CMP.W $0F82,X : BCC .checkY 
    CMP.W #$0008 : BCC .checkY 
    LDA.W #$0000 
    RTL 


.checkY:
    LDA.W $0AFA : SEC : SBC.W $0F7E,X : BPL + 
    EOR.W #$FFFF 
    INC A 

  + SEC : SBC.W $0B00 : BCC .touching 
    CMP.W $0F84,X : BCC .touching 
    LDA.W #$0000 
    RTL 


.touching:
    LDA.W #$FFFF 
    RTL 


CalculateDistanceAndAngleOfSamusFromEnemy:
    PHX : PHY 
    LDA.W $0E36 : SEC : SBC.W $0E32 : STA.W $0E3C 
    BPL + 
    EOR.W #$FFFF 
    INC A 

  + CMP.W #$00FF : BPL .returnError 
    STA.B $12 
    STA.W $0E20 
    LDA.W $0E38 : SEC : SBC.W $0E34 : STA.W $0E3E 
    BPL + 
    EOR.W #$FFFF 
    INC A 

  + CMP.W #$00FF : BPL .returnError 
    STA.B $14 
    STA.W $0E22 
    JSL.L CalculateAngleOf_12_14_Offset 
    STA.W $0E24 
    LDA.W $0E20 : STA.W $0E32 
    LDA.W $0E24 : JSL.L EightBitNegativeSineMultiplication_A0B0C6 
    BIT.W #$8000 
    BEQ + 
    EOR.W #$FFFF 
    INC A 

  + STA.W $0E26 
    LDA.W $0E22 : STA.W $0E32 
    LDA.W $0E24 : JSL.L EightBitCosineMultiplication_A0B0B2 
    BIT.W #$8000 
    BEQ + 
    EOR.W #$FFFF 
    INC A 

  + CLC : ADC.W $0E26 : PHA 
    LDA.W $0E3C : STA.B $12 
    LDA.W $0E3E : STA.B $14 
    JSL.L CalculateAngleOf_12_14_Offset 
    STA.W $0E3A 
    PLA : PLY : PLX 
    CLC 
    RTL 


.returnError:
    PLY : PLX 
    SEC 
    RTL 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyVariable_ZeroOrMax_A0AD33:
    PHB 
    SEP #$20 
    LDA.B #$A0 
    PHA : PLB 
    REP #$30 
    LDA.W $0FB0,X : BEQ UNUSED_SignedA_ZeroIsSpecialCase_A0AD4A 
    DEC.W $0FB0,X 
    BEQ UNUSED_SignedA_ZeroIsSpecialCase_A0AD4A 
    LDA.W #$0000 
    RTL 


UNUSED_SignedA_ZeroIsSpecialCase_A0AD4A:
    LDA.W #$0001 
    PLB 
    RTL 

    BNE .notZero 
    LDA.W #$0000 
    RTL 


.notZero:
    CMP.W #$8000 : BMI .return1 
    LDA.W #$FFFF 
    RTL 


.return1:
    LDA.W #$0001 
    RTL 


UNUSED_NegateA_A0AD62:
    TAY 
    AND.W #$8000 
    BNE + 
    TYA 
    RTL 


  + TYA 
    EOR.W #$FFFF 
    INC A 
    RTL 
endif ; !FEATURE_KEEP_UNREFERENCED


CheckIfEnemyCenterIsOnScreen:
    LDX.W $0E54 
    LDA.W $0F7A,X : CMP.W $0911 : BMI .offScreen 
    LDA.W $0911 : CLC : ADC.W #$0100 : CMP.W $0F7A,X : BMI .offScreen 
    LDA.W $0F7E,X : CMP.W $0915 : BMI .offScreen 
    LDA.W $0915 : CLC : ADC.W #$0100 : CMP.W $0F7E,X : BMI .offScreen 
    LDA.W #$0000 
    RTL 


.offScreen:
    LDA.W #$0001 
    RTL 


CheckIfEnemyCenterIsOverAPixelsOffScreen:
    PHX 
    STA.B $12 
    LDX.W $0E54 
    LDA.W $0F7A,X : CLC : ADC.B $12 : CMP.W $0911 : BMI .offScreen 
    LDA.W $0911 : CLC : ADC.W #$0100 : CLC : ADC.B $12 : CMP.W $0F7A,X : BMI .offScreen 
    LDA.W $0F7E,X : CLC : ADC.B $12 : CMP.W $0915 : BMI .offScreen 
    LDA.W $0915 : CLC : ADC.W #$0100 : CLC : ADC.B $12 : CMP.W $0F7E,X : BMI .offScreen 
    PLX 
    LDA.W #$0000 
    RTL 


.offScreen:
    PLX 
    LDA.W #$0001 
    RTL 


CheckIfEnemyIsOnScreen:
    PHX 
    LDX.W $0E54 
    LDA.W $0F7A,X : CLC : ADC.W $0F82,X : CMP.W $0911 : BMI .offScreen 
    LDA.W $0911 : CLC : ADC.W #$0100 : CLC : ADC.W $0F82,X : CMP.W $0F7A,X : BMI .offScreen 
    LDA.W $0F7E,X : CLC : ADC.W #$0008 : CMP.W $0915 : BMI .offScreen 
    LDA.W $0915 : CLC : ADC.W #$00F8 : CMP.W $0F7E,X : BMI .offScreen 
    PLX 
    LDA.W #$0000 
    RTL 


.offScreen:
    PLX 
    LDA.W #$0001 
    RTL 


DetermineDirectionOfSamusFromEnemy:
    LDX.W $0E54 
    LDA.W #$0020 : JSL.L IsSamusWithingAPixelRowsOfEnemy 
    BEQ notLeftNorRight 
    LDY.W #$0002 
    JSL.L Get_SamusX_minus_EnemyX 
    BPL + 
    LDY.W #$0007 

  + TYA 
    RTL 


notLeftNorRight:
    LDA.W #$0020 : JSL.L IsSamusWithinAPixelColumnsOfEnemy 
    BEQ notAboveOrBelow 
    LDY.W #$0004 
    JSL.L Get_SamusY_minus_EnemyY 
    BPL + 
    LDY.W #$0000 

  + TYA 
    RTL 


notAboveOrBelow:
    JSL.L Get_SamusX_minus_EnemyX 
    BMI .notDiagonallyRight 
    LDY.W #$0003 
    JSL.L Get_SamusY_minus_EnemyY 
    BPL + 
    LDY.W #$0001 

  + TYA 
    RTL 


.notDiagonallyRight:
    LDY.W #$0006 
    JSL.L Get_SamusY_minus_EnemyY 
    BPL + 
    LDY.W #$0008 

  + TYA 
    RTL 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_ProtoInstructionListHandler_A0AE7C:
    LDX.W $0E54 
    LDA.W $0F78,X 
    TAX 
    LDA.L $A0002A,X : STA.W $0E20 
    LDX.W $0E54 
    LDA.W $0F92,X 
    ASL A 
    CLC : ADC.W $0E20 : TAY 
    LDX.W $0000,Y 
    TXY 
    LDX.W $0E54 
    LDA.W $0F94,X : BEQ + 
    CMP.W #$0001 : BEQ + 
    DEC.W $0F94,X 
    LDA.W #$0000 
    RTL 


  + STY.B $00 
    LDY.W $0F90,X 

.loop:
    LDA.B ($00),Y : CMP.W #$FFFF : BEQ .return1 
    CMP.W #$FFFE : BNE .notTerminated 
    LDY.W #$0000 
    JMP.W .loop 


.notTerminated:
    STA.W $0F8E,X 
    INY #2
    LDA.B ($00),Y : STA.W $0F94,X 
    INY #2
    TYA 
    STA.W $0F90,X 
    LDA.W #$0000 
    RTL 


.return1:
    LDA.W #$0001 
    RTL 
endif ; !FEATURE_KEEP_UNREFERENCED


Get_SamusY_minus_EnemyY:
    LDA.W $0AFA : SEC : SBC.W $0F7E,X : RTL 


Get_SamusX_minus_EnemyX:
    LDA.W $0AF6 : SEC : SBC.W $0F7A,X : RTL 


IsSamusWithingAPixelRowsOfEnemy:
    STA.W $0E20 
    LDY.W $0AFA 
    LDA.W $0F7E,X 
    TAX 
    JSL.L GetSignedYMinusX_A0B07D 
    LDX.W $0E54 : CMP.W $0E20 : BPL .returnZero 
    LDA.W #$0001 
    RTL 


.returnZero:
    LDA.W #$0000 
    RTL 


IsSamusWithinAPixelColumnsOfEnemy:
    STA.W $0E20 
    LDY.W $0AF6 
    LDA.W $0F7A,X 
    TAX 
    JSL.L GetSignedYMinusX_A0B07D 
    LDX.W $0E54 : CMP.W $0E20 : BPL .returnZero 
    LDA.W #$0001 
    RTL 


.returnZero:
    LDA.W #$0000 
    RTL 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_MoveEnemyX_NoCollision_A0AF29:
    LDA.W $0F7C,X : CLC : ADC.B $12 : STA.W $0F7C,X 
    LDA.W $0F7A,X : ADC.B $14 : STA.W $0F7A,X 
    RTL 


UNUSED_MoveEnemyY_NoCollision_A0AF3B:
    LDA.W $0F80,X : CLC : ADC.B $12 : STA.W $0F80,X 
    LDA.W $0F7E,X : ADC.B $14 : STA.W $0F7E,X 
    RTL 


UNUSED_MoveEnemy_12_14_A0AF4D:
    ASL A 
    TAX 
    JMP.W (.pointers,X) 


.pointers:
    dw MoveEnemyX_minus_12_14 
    dw MoveEnemyX_plus_12_14 
    dw MoveEnemyY_minus_12_14 
    dw MoveEnemyY_plus_12_14 
endif ; !FEATURE_KEEP_UNREFERENCED

MoveEnemyX_minus_12_14:
    LDA.W $0F7C,X : SEC : SBC.B $12 : STA.W $0F7C,X 
    LDA.W $0F7A,X : SBC.B $14 : STA.W $0F7A,X 
    RTL 


MoveEnemyX_plus_12_14:
    LDA.W $0F7C,X : CLC : ADC.B $12 : STA.W $0F7C,X 
    LDA.W $0F7A,X : ADC.B $14 : STA.W $0F7A,X 
    RTL 


MoveEnemyY_minus_12_14:
    LDA.W $0F80,X : SEC : SBC.B $12 : STA.W $0F80,X 
    LDA.W $0F7E,X : SBC.B $14 : STA.W $0F7E,X 
    RTL 


MoveEnemyY_plus_12_14:
    LDA.W $0F80,X : CLC : ADC.B $12 : STA.W $0F80,X 
    LDA.W $0F7E,X : ADC.B $14 : STA.W $0F7E,X 
    RTL 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_MoveSamus_ExtraXDisplacement_minus_12_14_A0AFA2:
    LDA.W $0AF8 : SEC : SBC.B $12 : STA.W $0B56 
    LDA.W $0AF6 : SBC.B $14 : STA.W $0B58 
    RTL 


UNUSED_MoveSamus_ExtraXDisplacement_plus_12_14_A0AFB4:
    LDA.W $0AF8 : CLC : ADC.B $12 : STA.W $0B56 
    LDA.W $0AF6 : ADC.B $14 : STA.W $0B58 
    RTL 


UNUSED_MoveSamus_ExtraYDisplacement_minus_12_14_A0AFC6:
    LDA.W $0AFC : SEC : SBC.B $12 : STA.W $0B5A 
    LDA.W $0AFA : SBC.B $14 : STA.W $0B5C 
    RTL 


UNUSED_MoveSamus_ExtraYDisplacement_plus_12_14_A0AFD8:
    LDA.W $0AFC : CLC : ADC.B $12 : STA.W $0B5A 
    LDA.W $0AFA : ADC.B $14 : STA.W $0B5C 
    RTL 
endif ; !FEATURE_KEEP_UNREFERENCED


Sign_Extend_A:
    STA.W $0E32 
    AND.W #$0080 
    BEQ + 
    LDA.W $0E32 
    ORA.W #$FF00 
    RTL 


  + LDA.W $0E32 
    RTL 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_MultiplyBy10_A0AFFD:
    ASL #4
    RTL 
endif ; !FEATURE_KEEP_UNREFERENCED


MultiplyBy20_A0B002:
    ASL #5
    RTL 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_MultiplyBy30_A0B008:
    ASL #4
    STA.W $0E32 
    CLC : ADC.W $0E32 : CLC : ADC.W $0E32 : RTL 


UNUSED_MultiplyBy40_A0B018:
    ASL #6
    RTL 


UNUSED_SwapLowByteNybbles_A0B01F:
    PHA 
    AND.W #$FF00 
    STA.W $0E34 
    PLA 
    AND.W #$00FF 
    STA.W $0E32 
    SEP #$20 ; >_<
    XBA 
    REP #$20 
    ORA.W $0E32 
    LSR #4
    AND.W #$00FF 
    ORA.W $0E34 
    RTL 


UNUSED_SwapHighByteNybbles_A0B040:
    PHA 
    AND.W #$00FF 
    STA.W $0E34 
    PLA 
    AND.W #$FF00 
    STA.W $0E32 
    SEP #$20 ; >_<
    XBA 
    REP #$20 
    ORA.W $0E32 
    ASL #4
    AND.W #$FF00 
    ORA.W $0E34 

UNUSED_XBA_A0B060:
    RTL 

    SEP #$20 ; >_<
    XBA 
    REP #$20 
    RTL 
endif ; !FEATURE_KEEP_UNREFERENCED


NegateA_A0B067:
    STA.W $0E32 
    AND.W #$8000 
    BEQ + 
    LDA.W $0E32 
    EOR.W #$FFFF 
    INC A 
    STA.W $0E32 

  + LDA.W $0E32 
    RTL 


GetSignedYMinusX_A0B07D:
    PHX : PHY 
    TXA ; >.<
    STA.W $0E32 
    TYA 
    SEC : SBC.W $0E32 : STA.W $0E34 
    AND.W #$8000 
    BEQ + 
    LDA.W $0E34 
    EOR.W #$FFFF 
    INC A 
    STA.W $0E34 

  + LDA.W $0E34 
    PLY : PLX 
    RTL 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_GetNegativeA_A0B0A0:
    EOR.W #$FFFF 
    INC A 
    RTL 


UNUSED_SignedA_ZeroCountsAsPositive_A0B0A5:
    AND.W #$8000 
    BEQ + 
    LDA.W #$FFFF 
    RTL 


  + LDA.W #$0001 
    RTL 
endif ; !FEATURE_KEEP_UNREFERENCED


EightBitCosineMultiplication_A0B0B2:
    CLC : ADC.W #$0040 : AND.W #$00FF 
    STA.W $0E34 
    PHX : PHY : PHB 
    JSR.W EightBitSineMultiplication_A0B0DA 
    PLB : PLY : PLX 
    RTL 


EightBitNegativeSineMultiplication_A0B0C6:
    CLC : ADC.W #$0080 : AND.W #$00FF 
    STA.W $0E34 
    PHX : PHY : PHB 
    JSR.W EightBitSineMultiplication_A0B0DA 
    PLB : PLY : PLX 
    RTL 


EightBitSineMultiplication_A0B0DA:
    SEP #$20 
    LDA.B #$A0 
    PHA : PLB 
    REP #$30 
    LDA.W $0E34 : AND.W #$007F 
    TAY 
    LDA.W SineCosineTables_8bitSine,Y : AND.W #$00FF 
    SEP #$20 
    STA.W $4202 
    LDA.W $0E32 : STA.W $4203 
    NOP #5
    REP #$20 
    LDA.W $4216 
    XBA 
    PHA 
    AND.W #$00FF 
    STA.W $0E36 
    PLA 
    AND.W #$FF00 
    STA.W $0E38 
    LDA.W $0E34 : AND.W #$0080 
    BEQ .return 
    LDA.W $0E36 
    EOR.W #$FFFF 
    INC A 
    STA.W $0E36 
    LDA.W $0E38 
    EOR.W #$FFFF 
    INC A 
    STA.W $0E38 

.return:
    LDA.W $0E36 
    RTS 


AddressesForEnemyDrawingQueues:
    dw $0E84 
    dw $0EA4 
    dw $0EA6 
    dw $0EC6 
    dw $0EC8 
    dw $0EE8 
    dw $0F28 
    dw $0F48 

SineCosineTables_8bitSine:
    db $00,$06,$0C,$12,$19,$1F,$25,$2B,$31,$38,$3E,$44,$4A,$50,$56,$5C 
    db $61,$67,$6D,$73,$78,$7E,$83,$88,$8E,$93,$98,$9D,$A2,$A7,$AB,$B0 
    db $B5,$B9,$BD,$C1,$C5,$C9,$CD,$D1,$D4,$D8,$DB,$DE,$E1,$E4,$E7,$EA 
    db $EC,$EE,$F1,$F3,$F4,$F6,$F8,$F9,$FB,$FC,$FD,$FE,$FE,$FF,$FF,$FF 

SineCosineTables_8bitCosine:
    db $FF,$FF,$FF,$FF,$FE,$FE,$FD,$FC,$FB,$F9,$F8,$F6,$F4,$F3,$F1,$EE 
    db $EC,$EA,$E7,$E4,$E1,$DE,$DB,$D8,$D4,$D1,$CD,$C9,$C5,$C1,$BD,$B9 
    db $B5,$B0,$AB,$A7,$A2,$9D,$98,$93,$8E,$88,$83,$7E,$78,$73,$6D,$67 
    db $61,$5C,$56,$50,$4A,$44,$3E,$38,$31,$2B,$25,$1F,$19,$12,$0C,$06 

SineCosineTables_16bitSine:
    dw $0000,$0324,$0647,$096A,$0C8B,$0FAB,$12C7,$15E1 
    dw $18F8,$1C0B,$1F19,$2223,$2527,$2826,$2B1F,$2E10 
    dw $30FB,$33DE,$36B9,$398C,$3C56,$3F17,$41CD,$447A 
    dw $471C,$49B3,$4C3F,$4EBF,$5133,$539A,$55F5,$5842 
    dw $5A82,$5CB3,$5ED7,$60EB,$62F1,$64E8,$66CF,$68A6 
    dw $6A6D,$6C23,$6DC9,$6F5E,$70E2,$7254,$73B5,$7504 
    dw $7641,$776B,$7884,$7989,$7A7C,$7B5C,$7C29,$7CE3 
    dw $7D89,$7E1D,$7E9C,$7F09,$7F61,$7FA6,$7FD8,$7FF5 

SineCosineTables_16bitCosine:
    dw $7FFF,$7FF5,$7FD8,$7FA6,$7F61,$7F09,$7E9C,$7E1D 
    dw $7D89,$7CE3,$7C29,$7B5C,$7A7C,$7989,$7884,$776B 
    dw $7641,$7504,$73B5,$7254,$70E2,$6F5E,$6DC9,$6C23 
    dw $6A6D,$68A6,$66CF,$64E8,$62F1,$60EB,$5ED7,$5CB3 
    dw $5A82,$5842,$55F5,$539A,$5133,$4EBF,$4C3F,$49B3 
    dw $471C,$447A,$41CD,$3F17,$3C56,$398C,$36B9,$33DE 
    dw $30FB,$2E10,$2B1F,$2826,$2527,$2223,$1F19,$1C0B 
    dw $18F8,$15E1,$12C7,$0FAB,$0C8B,$096A,$0647,$0324 

SineCosineTables_16bitNegativeSine:
    dw $0000,$FCDC,$F9B9,$F696,$F375,$F055,$ED39,$EA1F 
    dw $E708,$E3F5,$E0E7,$DDDD,$DAD9,$D7DA,$D4E1,$D1F0 
    dw $CF05,$CC22,$C947,$C674,$C3AA,$C0E9,$BE33,$BB86 
    dw $B8E4,$B64D,$B3C1,$B141,$AECD,$AC66,$AA0B,$A7BE 
    dw $A57E,$A34D,$A129,$9F15,$9D0F,$9B18,$9931,$975A 
    dw $9593,$93DD,$9237,$90A2,$8F1E,$8DAC,$8C4B,$8AFC 
    dw $89BF,$8895,$877C,$8677,$8584,$84A4,$83D7,$831D 
    dw $8277,$81E3,$8164,$80F7,$809F,$805A,$8028,$800B 

SineCosineTables_16bitNegativeCosine:
    dw $8001,$800B,$8028,$805A,$809F,$80F7,$8164,$81E3 
    dw $8277,$831D,$83D7,$84A4,$8584,$8677,$877C,$8895 
    dw $89BF,$8AFC,$8C4B,$8DAC,$8F1E,$90A2,$9237,$93DD 
    dw $9593,$975A,$9931,$9B18,$9D0F,$9F15,$A129,$A34D 
    dw $A57E,$A7BE,$AA0B,$AC66,$AECD,$B141,$B3C1,$B64D 
    dw $B8E4,$BB86,$BE33,$C0E9,$C3AA,$C674,$C947,$CC22 
    dw $CF05,$D1F0,$D4E1,$D7DA,$DAD9,$DDDD,$E0E7,$E3F5 
    dw $E708,$EA1F,$ED39,$F055,$F375,$F696,$F9B9,$FCDC 

SineCosineTables_NegativeCosine_SignExtended:
    dw $FF00,$FF01,$FF01,$FF01,$FF02,$FF02,$FF03,$FF04 
    dw $FF05,$FF07,$FF08,$FF0A,$FF0C,$FF0D,$FF0F,$FF12 
    dw $FF14,$FF16,$FF19,$FF1C,$FF1F,$FF22,$FF25,$FF28 
    dw $FF2C,$FF2F,$FF33,$FF37,$FF3B,$FF3F,$FF43,$FF47 
    dw $FF4B,$FF50,$FF55,$FF59,$FF5E,$FF63,$FF68,$FF6D 
    dw $FF72,$FF78,$FF7D,$FF82,$FF88,$FF8D,$FF93,$FF99 
    dw $FF9F,$FFA4,$FFAA,$FFB0,$FFB6,$FFBC,$FFC2,$FFC8 
    dw $FFCF,$FFD5,$FFDB,$FFE1,$FFE7,$FFEE,$FFF4,$FFFA 

SineCosineTables_8bitSine_SignExtended:
    dw $0000,$0006,$000C,$0012,$0019,$001F,$0025,$002B 
    dw $0031,$0038,$003E,$0044,$004A,$0050,$0056,$005C 
    dw $0061,$0067,$006D,$0073,$0078,$007E,$0083,$0088 
    dw $008E,$0093,$0098,$009D,$00A2,$00A7,$00AB,$00B0 
    dw $00B5,$00B9,$00BD,$00C1,$00C5,$00C9,$00CD,$00D1 
    dw $00D4,$00D8,$00DB,$00DE,$00E1,$00E4,$00E7,$00EA 
    dw $00EC,$00EE,$00F1,$00F3,$00F4,$00F6,$00F8,$00F9 
    dw $00FB,$00FC,$00FD,$00FE,$00FE,$00FF,$00FF,$00FF 

SineCosineTables_8bitCosine_SignExtended:
    dw $0100,$00FF,$00FF,$00FF,$00FE,$00FE,$00FD,$00FC 
    dw $00FB,$00F9,$00F8,$00F6,$00F4,$00F3,$00F1,$00EE 
    dw $00EC,$00EA,$00E7,$00E4,$00E1,$00DE,$00DB,$00D8 
    dw $00D4,$00D1,$00CD,$00C9,$00C5,$00C1,$00BD,$00B9 
    dw $00B5,$00B0,$00AB,$00A7,$00A2,$009D,$0098,$0093 
    dw $008E,$0088,$0083,$007E,$0078,$0073,$006D,$0067 
    dw $0061,$005C,$0056,$0050,$004A,$0044,$003E,$0038 
    dw $0031,$002B,$0025,$001F,$0019,$0012,$000C,$0006 

SineCosineTables_8bitNegativeSign_SignExtended:
    dw $0000,$FFFA,$FFF4,$FFEE,$FFE7,$FFE1,$FFDB,$FFD5 
    dw $FFCF,$FFC8,$FFC2,$FFBC,$FFB6,$FFB0,$FFAA,$FFA4 
    dw $FF9F,$FF99,$FF93,$FF8D,$FF88,$FF82,$FF7D,$FF78 
    dw $FF72,$FF6D,$FF68,$FF63,$FF5E,$FF59,$FF55,$FF50 
    dw $FF4B,$FF47,$FF43,$FF3F,$FF3B,$FF37,$FF33,$FF2F 
    dw $FF2C,$FF28,$FF25,$FF22,$FF1F,$FF1C,$FF19,$FF16 
    dw $FF14,$FF12,$FF0F,$FF0D,$FF0C,$FF0A,$FF08,$FF07 
    dw $FF05,$FF04,$FF03,$FF02,$FF02,$FF01,$FF01,$FF01 

SineCosineTables_8bitNegativeCosign_SignExtended:
    dw $FF00,$FF01,$FF01,$FF01,$FF02,$FF02,$FF03,$FF04 
    dw $FF05,$FF07,$FF08,$FF0A,$FF0C,$FF0D,$FF0F,$FF12 
    dw $FF14,$FF16,$FF19,$FF1C,$FF1F,$FF22,$FF25,$FF28 
    dw $FF2C,$FF2F,$FF33,$FF37,$FF3B,$FF3F,$FF43,$FF47 
    dw $FF4B,$FF50,$FF55,$FF59,$FF5E,$FF63,$FF68,$FF6D 
    dw $FF72,$FF78,$FF7D,$FF82,$FF88,$FF8D,$FF93,$FF99 
    dw $FF9F,$FFA4,$FFAA,$FFB0,$FFB6,$FFBC,$FFC2,$FFC8 
    dw $FFCF,$FFD5,$FFDB,$FFE1,$FFE7,$FFEE,$FFF4,$FFFA  
Do_Some_Math_With_Sine_Cosine_Terrible_Label_Name:
; All arithmetic done here is unsigned, so [$14] should be positive
; Uses the standard maths convention for angle(!)

; Standard maths angle convention:
;          40h
;           |
;     80h   #    0
;
;          C0h
;
; Where # is the origin and | is the negative y axis
    PHB : PHX : PEA.W UnsignedSineTable>>8&$FF00 ; $A000
    PLB : PLB 
    REP #$30 
    LDA.B $12 : CLC : ADC.W #$0080 : AND.W #$007F 
    ASL A 
    TAX 
    LDA.L UnsignedSineTable,X : STA.B $26 
    LDA.B $14 : STA.B $28 
    JSL.L Multiplication_32bit_A0B6FF 
    LDA.B $2C : STA.B $1A 
    LDA.B $2A : STA.B $1C 
    LDA.B $12 : CLC : ADC.W #$0040 : AND.W #$007F 
    ASL A 
    TAX 
    LDA.L UnsignedSineTable,X : STA.B $26 
    LDA.B $14 : STA.B $28 
    JSL.L Multiplication_32bit_A0B6FF 
    LDA.B $2C : STA.B $16 
    LDA.B $2A : STA.B $18 
    PLX : PLB 
    RTL 


MoveEnemyAccordingToAngleAndXYSpeeds:
    PHX 
    LDX.W $0E54 
    LDA.W $0E20 : CLC : ADC.W #$0040 : BIT.W #$0080 
    BNE .greaterThanEqualTo80 
    LDA.W $0F7C,X : CLC : ADC.W $0E26 : STA.W $0F7C,X 
    LDA.W $0F7A,X : ADC.W $0E24 : STA.W $0F7A,X 
    BRA + 


.greaterThanEqualTo80:
    LDA.W $0F7C,X : SEC : SBC.W $0E26 : STA.W $0F7C,X 
    LDA.W $0F7A,X : SBC.W $0E24 : STA.W $0F7A,X 

  + LDA.W $0E20 : CLC : ADC.W #$0080 : BIT.W #$0080 
    BNE .lessThan80 
    LDA.W $0F80,X : CLC : ADC.W $0E2A : STA.W $0F80,X 
    LDA.W $0F7E,X : ADC.W $0E28 : STA.W $0F7E,X 
    BRA .return 


.lessThan80:
    LDA.W $0F80,X : SEC : SBC.W $0E2A : STA.W $0F80,X 
    LDA.W $0F7E,X : SBC.W $0E28 : STA.W $0F7E,X 

.return:
    PLX 
    RTL 


Multiplication_32bit_A0B6FF:
    PHX : PHY : PHP 
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
    LDA.B $2B : CLC : ADC.W $4216 : STA.B $2B 
    BCC .carryClear 
    INY 

.carryClear:
    LDX.B $26 
    STX.W $4202 
    LDX.B $29 
    STX.W $4203 
    NOP #2
    LDA.B $2B : CLC : ADC.W $4216 : STA.B $2B 
    BCC .carryClearAgain 
    INY 

.carryClearAgain:
    STY.B $2D 
    PLP : PLY : PLX 
    RTL 


UnsignedDivision_32bit_A0B761:
    PHP : PHB : PHK : PLB 
    REP #$30 
    STZ.B $28 
    STZ.B $26 
    LDA.B $30 
    ORA.B $2E 
    BNE .loopCounter 
    STZ.B $2C 
    STZ.B $2A 
    BRA .return 


.loopCounter:
    LDX.W #$0021 
    CLC 

.loop:
    ROL.B $2A 
    ROL.B $2C 
    DEX 
    BEQ .return 
    ROL.B $26 
    ROL.B $28 
    LDA.B $28 
    ORA.B $26 
    BEQ .loop 
    LDA.B $26 : SEC : SBC.B $2E : TAY 
    LDA.B $28 : SBC.B $30 : BCC .loop 
    STA.B $28 
    STY.B $26 
    BRA .loop 


.return:
    PLB : PLP 
    RTL 


CapScrollingSpeed:
    PHX : PHY 
    LDA.W $0AFA : SEC : SBC.W $0B14 : STA.B $12 
    JSL.L NegateA_A0B067 
    CMP.W #$000C : BMI .YPositionEnd 
    LDY.W #$FFF4 
    LDA.B $12 : BMI .negative 
    LDY.W #$000C 

.negative:
    TYA 
    CLC : ADC.W $0AFA : STA.W $0B14 

.YPositionEnd:
    LDA.W $0AF6 : SEC : SBC.W $0B10 : STA.B $12 
    JSL.L NegateA_A0B067 
    CMP.W #$000C : BMI .retrun 
    LDY.W #$FFF4 
    LDA.B $12 : BMI + 
    LDY.W #$000C 

  + TYA 
    CLC : ADC.W $0AF6 : STA.W $0B10 

.retrun:
    PLY : PLX 
    RTL 


UnsignedSineTable:
    dw $0000,$0648,$0C8F,$12D5,$1917,$1F56,$258F,$2BC3 
    dw $31F1,$3816,$3E33,$4447,$4A4F,$504D,$563E,$5C21 
    dw $61F7,$67BD,$6D73,$7319,$78AC,$7E2E,$839B,$88F5 
    dw $8E39,$9367,$987F,$9D7F,$A266,$A735,$ABEA,$B085 
    dw $B504,$B967,$BDAE,$C1D7,$C5E3,$C9D0,$CD9E,$D14C 
    dw $D4DA,$D847,$DB93,$DEBD,$E1C4,$E4A9,$E76A,$EA08 
    dw $EC82,$EED7,$F108,$F313,$F4F9,$F6B9,$F852,$F9C6 
    dw $FB13,$FC3A,$FD39,$FE12,$FEC3,$FF4D,$FFB0,$FFEB 
    dw $FFFF,$FFEB,$FFB0,$FF4D,$FEC3,$FE12,$FD39,$FC3A 
    dw $FB13,$F9C6,$F852,$F6B9,$F4F9,$F313,$F108,$EED7 
    dw $EC82,$EA08,$E76A,$E4A9,$E1C4,$DEBD,$DB93,$D847 
    dw $D4DA,$D14C,$CD9E,$C9D0,$C5E3,$C1D7,$BDAE,$B967 
    dw $B504,$B085,$ABEA,$A735,$A266,$9D7F,$987F,$9367 
    dw $8E39,$88F5,$839B,$7E2E,$78AC,$7319,$6D73,$67BD 
    dw $61F7,$5C21,$563E,$504D,$4A4F,$4447,$3E33,$3816 
    dw $31F1,$2BC3,$258F,$1F56,$1917,$12D5,$0C8F,$0648 

MiniKraidDeathItemDropRoutine:
    PHX : PHY : PHP 
    LDA.W #$0004 : STA.W $060B 

.loop:
    JSL.L GenerateRandomNumber 
    AND.W #$001F 
    SEC : SBC.W #$0010 : CLC : ADC.L $7EF434 : STA.B $12 
    LDA.W $05E5 : AND.W #$1F00 
    XBA 
    SEC : SBC.W #$0010 : CLC : ADC.L $7EF436 : STA.B $14 
    LDA.W #EnemyHeaders_MiniKraid : JSL.L Spawn_Enemy_Drops 
    DEC.W $060B 
    BNE .loop 
    PLP : PLY : PLX 
    RTL 


MetalNinjaPirateDeathItemDropRoutine:
    PHX : PHY : PHP 
    LDA.W #$0005 : STA.W $060B 

.loop:
    JSL.L GenerateRandomNumber 
    AND.W #$001F 
    SEC : SBC.W #$0010 : CLC : ADC.L $7EF434 : STA.B $12 
    LDA.W $05E5 : AND.W #$1F00 
    XBA 
    SEC : SBC.W #$0010 : CLC : ADC.L $7EF436 : STA.B $14 
    LDA.W #EnemyHeaders_PirateGoldNinja : JSL.L Spawn_Enemy_Drops 
    DEC.W $060B 
    BNE .loop 
    PLP : PLY : PLX 
    RTL 


MetroidDeathItemDropRoutine:
    PHX : PHY : PHP 
    LDA.W #$0005 : STA.W $060B 

.loop:
    JSL.L GenerateRandomNumber 
    AND.W #$001F 
    SEC : SBC.W #$0010 : CLC : ADC.L $7EF434 : STA.B $12 
    LDA.W $05E5 : AND.W #$1F00 
    XBA 
    SEC : SBC.W #$0010 : CLC : ADC.L $7EF436 : STA.B $14 
    LDA.W #EnemyHeaders_Metroid : JSL.L Spawn_Enemy_Drops 
    DEC.W $060B 
    BNE .loop 
    PLP : PLY : PLX 
    RTL 


RidleyDeathItemDropRoutine:
    PHX : PHY : PHP 
    LDA.W #$0010 : STA.W $060B 

.loop:
    JSL.L GenerateRandomNumber 
    AND.W #$007F 
    CLC : ADC.W #$0040 : STA.B $12 
    LDA.W $05E5 : AND.W #$3F00 
    XBA 
    CLC : ADC.W #$0140 : STA.B $14 
    LDA.W #EnemyHeaders_Ridley : JSL.L Spawn_Enemy_Drops 
    DEC.W $060B 
    BNE .loop 
    PLP : PLY : PLX 
    RTL 


CrocomireDeathItemDropRoutine:
    PHX : PHY : PHP 
    LDA.W #$0010 : STA.W $060B 

.loop:
    JSL.L GenerateRandomNumber 
    AND.W #$007F 
    CLC : ADC.W #$0240 : STA.B $12 
    LDA.W $05E5 : AND.W #$3F00 
    XBA 
    CLC : ADC.W #$0060 : STA.B $14 
    LDA.W #EnemyHeaders_Crocomire : JSL.L Spawn_Enemy_Drops 
    DEC.W $060B 
    BNE .loop 
    PLP : PLY : PLX 
    RTL 


PhantoonDeathItemDropRoutine:
    PHX : PHY : PHP 
    LDA.W #$0010 : STA.W $060B 

.loop:
    JSL.L GenerateRandomNumber 
    AND.W #$007F 
    CLC : ADC.W #$0040 : STA.B $12 
    LDA.W $05E5 : AND.W #$3F00 
    XBA 
    CLC : ADC.W #$0060 : STA.B $14 
    LDA.W #EnemyHeaders_PhantoonBody : JSL.L Spawn_Enemy_Drops 
    DEC.W $060B 
    BNE .loop 
    PLP : PLY : PLX 
    RTL 


BotwoonDeathItemDropRoutine:
    PHX : PHY : PHP 
    LDA.W #$0010 : STA.W $060B 

.loop:
    JSL.L GenerateRandomNumber 
    AND.W #$007F 
    CLC : ADC.W #$0040 : STA.B $12 
    LDA.W $05E5 : AND.W #$3F00 
    XBA 
    CLC : ADC.W #$0080 : STA.B $14 
    LDA.W #EnemyHeaders_Botwoon : JSL.L Spawn_Enemy_Drops 
    DEC.W $060B 
    BNE .loop 
    PLP : PLY : PLX 
    RTL 


KraidDeathItemDropRoutine:
    PHX : PHY : PHP 
    LDA.W #$0010 : STA.W $060B 

.loop:
    JSL.L GenerateRandomNumber 
    AND.W #$00FF 
    CLC : ADC.W #$0080 : STA.B $12 
    LDA.W $05E5 : AND.W #$3F00 
    XBA 
    CLC : ADC.W #$0160 : STA.B $14 
    LDA.W #EnemyHeaders_Kraid : JSL.L Spawn_Enemy_Drops 
    DEC.W $060B 
    BNE .loop 
    PLP : PLY : PLX 
    RTL 


BombTorizoDeathItemDropRoutine:
    PHX : PHY : PHP 
    LDA.W #$0010 : STA.W $060B 

.loop:
    JSL.L GenerateRandomNumber 
    AND.W #$007F 
    CLC : ADC.W #$0040 : STA.B $12 
    LDA.W $05E5 : AND.W #$3F00 
    XBA 
    CLC : ADC.W #$0060 : STA.B $14 
    LDA.W #EnemyHeaders_BombTorizo : JSL.L Spawn_Enemy_Drops 
    DEC.W $060B 
    BNE .loop 
    PLP : PLY : PLX 
    RTL 


GoldenTorizoDeathItemDropRoutine:
    PHX : PHY : PHP 
    LDA.W #$0010 : STA.W $060B 

.loop:
    JSL.L GenerateRandomNumber 
    AND.W #$00FF 
    CLC : ADC.W #$0080 : STA.B $12 
    LDA.W $05E5 : AND.W #$3F00 
    XBA 
    CLC : ADC.W #$0120 : STA.B $14 
    LDA.W #EnemyHeaders_BombTorizo : JSL.L Spawn_Enemy_Drops 
    DEC.W $060B 
    BNE .loop 
    PLP : PLY : PLX 
    RTL 


SporeSpawnDeathItemDropRoutine:
    PHX : PHY : PHP 
    LDA.W #$0010 : STA.W $060B 

.loop:
    JSL.L GenerateRandomNumber 
    AND.W #$007F 
    CLC : ADC.W #$0040 : STA.B $12 
    LDA.W $05E5 : AND.W #$3F00 
    XBA 
    CLC : ADC.W #$0210 : STA.B $14 
    LDA.W #EnemyHeaders_SporeSpawn : JSL.L Spawn_Enemy_Drops 
    DEC.W $060B 
    BNE .loop 
    PLP : PLY : PLX 
    RTL 


DraygonDeathItemDropRoutine:
    PHX : PHY : PHP 
    LDA.W #$0010 : STA.W $060B 

.loop:
    JSL.L GenerateRandomNumber 
    AND.W #$00FF 
    CLC : ADC.W #$0080 : STA.B $12 
    LDA.W $05E5 : AND.W #$3F00 
    XBA 
    CLC : ADC.W #$0160 : STA.B $14 
    LDA.W #EnemyHeaders_DraygonBody : JSL.L Spawn_Enemy_Drops 
    DEC.W $060B 
    BNE .loop 
    PLP : PLY : PLX 
    RTL 


CalculateTheBlockContainingAPixelPosition:
    LDA.B $04,S 
    LSR #4
    SEP #$20 
    STA.W $4202 
    LDA.W $07A5 : STA.W $4203 
    REP #$20 
    LDA.B $06,S 
    LSR #4
    CLC : ADC.W $4216 : STA.W $0DC4 
    LDA.B $02,S : STA.B $06,S 
    LDA.B $01,S : STA.B $05,S 
    PLA : PLA 
    RTL 


CheckIfXDistanceBetweenEnemyAndSamusIsAtLeastA:
    PHA 
    LDA.W $0AF6 : SEC : SBC.W $0F7A,X : BPL + 
    EOR.W #$FFFF 
    INC A 

  + CMP.B $01,S 
    PLA 
    RTL 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_CheckIfYDistanceBetweenEnemyAndSamusIsAtLeastA_A0BBAD:
    PHA 
    LDA.W $0AFA : SEC : SBC.W $0F7E,X : BPL + 
    EOR.W #$FFFF 
    INC A 

  + CMP.B $01,S 
    PLA 
    RTL 
endif ; !FEATURE_KEEP_UNREFERENCED


CheckForHorizontalSolidBlockCollision:
    PHB 
    SEP #$20 
    LDA.B #$A0 
    PHA : PLB 
    REP #$30 
    PHX 
    LDA.W $0F7E,X : SEC : SBC.W $0F84,X : AND.W #$FFF0 
    STA.B $1A 
    LDA.W $0F7E,X : CLC : ADC.W $0F84,X : DEC A 
    SEC : SBC.B $1A : LSR #4
    STA.B $1A 
    LDA.W $0F7E,X : SEC : SBC.W $0F84,X : LSR #4
    SEP #$20 
    STA.W $4202 
    LDA.W $07A5 : STA.W $4203 
    REP #$20 
    LDA.W $0F7C,X : CLC : ADC.B $12 : STA.B $16 
    LDA.W $0F7A,X : ADC.B $14 : STA.B $18 
    BIT.B $14 
    BMI .targetLeftBoundary 
    CLC : ADC.W $0F82,X : DEC A 
    BRA + 


.targetLeftBoundary:
    SEC : SBC.W $0F82,X 

  + STA.B $22 
    LSR #4
    CLC : ADC.W $4216 : ASL A 
    TAX 

.loop:
    LDA.L $7F0002,X : BMI + 
    TXA 
    CLC : ADC.W $07A5 : ADC.W $07A5 : TAX 
    DEC.B $1A 
    BPL .loop 
    PLX 
    CLC 
    PLB 
    RTL 


  + PLX 
    STZ.B $12 
    LDA.B $22 : BIT.B $14 
    BMI .movingLeft 
    AND.W #$FFF0 
    SEC : SBC.W $0F82,X : SEC : SBC.W $0F7A,X : BPL + 
    LDA.W #$0000 

  + STA.B $14 
    SEC 
    PLB 
    RTL 


.movingLeft:
    ORA.W #$000F 
    SEC 
    ADC.W $0F82,X : SEC : SBC.W $0F7A,X : BMI + 
    LDA.W #$0000 

  + EOR.W #$FFFF 
    INC A 
    STA.B $14 
    SEC 
    PLB 
    RTL 


CheckForVerticalSolidBlockCollision:
    PHB 
    SEP #$20 
    LDA.B #$A0 
    PHA : PLB 
    REP #$30 
    PHX 
    LDA.W $0F7A,X : SEC : SBC.W $0F82,X : AND.W #$FFF0 
    STA.B $1A 
    LDA.W $0F7A,X : CLC : ADC.W $0F82,X : DEC A 
    SEC : SBC.B $1A : LSR #4
    STA.B $1A 
    LDA.W $0F80,X : CLC : ADC.B $12 : STA.B $16 
    LDA.W $0F7E,X : ADC.B $14 : STA.B $18 
    BIT.B $14 
    BMI .targetFrontBoundary 
    CLC : ADC.W $0F84,X : DEC A 
    BRA + 


.targetFrontBoundary:
    SEC : SBC.W $0F84,X 

  + STA.B $22 
    LSR #4
    SEP #$20 
    STA.W $4202 
    LDA.W $07A5 : STA.W $4203 
    REP #$20 
    LDA.W $0F7A,X : SEC : SBC.W $0F82,X : LSR #4
    CLC : ADC.W $4216 : ASL A 
    TAX 

.loop:
    LDA.L $7F0002,X : BMI + 
    INX #2
    DEC.B $1A 
    BPL .loop 
    PLX 
    CLC 
    PLB 
    RTL 


  + PLX 
    STZ.B $12 
    LDA.B $22 : BIT.B $14 
    BMI .movingUp 
    AND.W #$FFF0 
    SEC : SBC.W $0F84,X : SEC : SBC.W $0F7E,X : BPL .returnCarrySet 
    LDA.W #$0000 

.returnCarrySet:
    STA.B $14 
    SEC 
    PLB 
    RTL 


.movingUp:
    ORA.W #$000F 
    SEC 
    ADC.W $0F84,X : SEC : SBC.W $0F7E,X : BMI + 
    LDA.W #$0000 

  + EOR.W #$FFFF 
    INC A 
    STA.B $14 
    SEC 
    PLB 
    RTL 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_MoveEnemyRight_NoBlockCollisionReactions_A0BD26:
    PHB 
    SEP #$20 
    LDA.B #$A0 
    PHA : PLB 
    REP #$30 
    PHX 
    STA.B $1C 
    LDA.W $0F7E,X : SEC : SBC.W $0F84,X : AND.W #$FFF0 
    STA.B $1A 
    LDA.W $0F7E,X : CLC : ADC.W $0F84,X : DEC A 
    SEC : SBC.B $1A : LSR #4
    STA.B $1A 
    LDA.W $0F7E,X : SEC : SBC.W $0F84,X : LSR #4
    SEP #$20 
    STA.W $4202 
    LDA.W $07A5 : STA.W $4203 
    REP #$20 
    LDA.B $1C 
    LSR A 
    BCC .zero1C 
    LDA.W $0F7C,X : CLC : ADC.B $12 : STA.B $16 
    LDA.W $0F7A,X : ADC.B $14 : STA.B $18 
    CLC : ADC.W $0F82,X : DEC A 
    BRA + 


.zero1C:
    LDA.W $0F7C,X : SEC : SBC.B $12 : STA.B $16 
    LDA.W $0F7A,X : SBC.B $14 : STA.B $18 
    SEC : SBC.W $0F82,X 

  + STA.B $22 
    LSR #4
    CLC : ADC.W $4216 : ASL A 
    TAX 

.loop:
    LDA.L $7F0002,X : BMI + 
    TXA 
    CLC : ADC.W $07A5 : ADC.W $07A5 : TAX 
    DEC.B $1A 
    BPL .loop 
    PLX 
    LDA.B $16 : STA.W $0F7C,X 
    LDA.B $18 : STA.W $0F7A,X 
    CLC 
    PLB 
    RTL 


  + PLX 
    STZ.W $0F7C,X 
    LDA.B $1C 
    LSR A 
    BCC .movingLeft 
    LDA.B $22 : AND.W #$FFF0 
    SEC : SBC.W $0F82,X : CMP.W $0F7A,X : BMI .returnCarrySetUpper 
    STA.W $0F7A,X 

.returnCarrySetUpper:
    SEC 
    PLB 
    RTL 


.movingLeft:
    LDA.B $22 
    ORA.W #$000F 
    SEC 
    ADC.W $0F82,X : SEC 
    CMP.W $0F7A,X : BEQ .storeX 
    BPL .returnCarrySetLower 

.storeX:
    STA.W $0F7A,X 

.returnCarrySetLower:
    SEC 
    PLB 
    RTL 


UNUSED_MoveEnemyDown_NoBlockCollisionReactions_A0BDF6:
    PHB 
    SEP #$20 
    LDA.B #$A0 
    PHA : PLB 
    REP #$30 
    STA.B $1C 
    PHX 
    LDA.W $0F7A,X : SEC : SBC.W $0F82,X : AND.W #$FFF0 
    STA.B $1A 
    LDA.W $0F7A,X : CLC : ADC.W $0F82,X : DEC A 
    SEC : SBC.B $1A : LSR #4
    STA.B $1A 
    LDA.B $1C 
    LSR A 
    BCC .zero1C 
    LDA.W $0F80,X : CLC : ADC.B $12 : STA.B $16 
    LDA.W $0F7E,X : ADC.B $14 : STA.B $18 
    CLC : ADC.W $0F84,X : DEC A 
    BRA + 


.zero1C:
    LDA.W $0F80,X : SEC : SBC.B $12 : STA.B $16 
    LDA.W $0F7E,X : SBC.B $14 : STA.B $18 
    SEC : SBC.W $0F84,X 

  + STA.B $22 
    LSR #4
    SEP #$20 
    STA.W $4202 
    LDA.W $07A5 : STA.W $4203 
    REP #$20 
    LDA.W $0F7A,X : SEC : SBC.W $0F82,X : LSR #4
    CLC : ADC.W $4216 : ASL A 
    TAX 

.loop:
    LDA.L $7F0002,X : BMI + 
    INX #2
    DEC.B $1A 
    BPL .loop 
    PLX 
    LDA.B $16 : STA.W $0F80,X 
    LDA.B $18 : STA.W $0F7E,X 
    CLC 
    PLB 
    RTL 


  + PLX 
    STZ.W $0F80,X 
    LDA.B $1C 
    LSR A 
    BCC .movingUp 
    LDA.B $22 : AND.W #$FFF0 
    SEC : SBC.W $0F84,X : CMP.W $0F7E,X : BMI .returnCarrySetUpper 
    STA.W $0F7E,X 

.returnCarrySetUpper:
    SEC 
    PLB 
    RTL 


.movingUp:
    LDA.B $22 
    ORA.W #$000F 
    SEC 
    ADC.W $0F84,X : SEC 
    CMP.W $0F7E,X : BEQ .storeY 
    BPL .returnCarrySetLower 

.storeY:
    STA.W $0F7E,X 

.returnCarrySetLower:
    SEC 
    PLB 
    RTL 


UNUSED_CheckForHorizontalSolidBlockCollision_A0BEBF:
    STA.B $1C 
    PHB 
    SEP #$20 
    LDA.B #$A0 
    PHA : PLB 
    REP #$30 
    PHX 
    LDA.W $0F7E,X : SEC : SBC.W $0F84,X : AND.W #$FFF0 
    STA.B $1A 
    LDA.W $0F7E,X : CLC : ADC.W $0F84,X : DEC A 
    SEC : SBC.B $1A : LSR #4
    STA.B $1A 
    LDA.W $0F7E,X : SEC : SBC.W $0F84,X : LSR #4
    SEP #$20 
    STA.W $4202 
    LDA.W $07A5 : STA.W $4203 
    REP #$20 
    LDA.B $1C 
    LSR A 
    BCC .zero1C 
    LDA.W $0F7C,X : CLC : ADC.B $12 : STA.B $16 
    LDA.W $0F7A,X : ADC.B $14 : STA.B $18 
    CLC : ADC.W $0F82,X : DEC A 
    BRA + 


.zero1C:
    LDA.W $0F7C,X : SEC : SBC.B $12 : STA.B $16 
    LDA.W $0F7A,X : SBC.B $14 : STA.B $18 
    SEC : SBC.W $0F82,X 

  + STA.B $22 
    LSR #4
    CLC : ADC.W $4216 : ASL A 
    TAX 

.loop:
    LDA.L $7F0002,X : BMI + 
    TXA 
    CLC : ADC.W $07A5 : ADC.W $07A5 : TAX 
    DEC.B $1A 
    BPL .loop 
    PLX 
    CLC 
    PLB 
    RTL 


  + PLX 
    STZ.B $12 
    LDA.B $1C 
    LSR A 
    BCC .movingLeft 
    LDA.B $22 : AND.W #$FFF0 
    SEC : SBC.W $0F82,X : SBC.W $0F7A,X : BPL + 
    LDA.W #$0000 

  + STA.B $14 
    SEC 
    PLB 
    RTL 


.movingLeft:
    LDA.B $22 
    ORA.W #$000F 
    SEC 
    ADC.W $0F82,X : SEC : SBC.W $0F7A,X : BMI + 
    LDA.W #$0000 

  + EOR.W #$FFFF 
    INC A 
    STA.B $14 
    SEC 
    PLB 
    RTL 
endif ; !FEATURE_KEEP_UNREFERENCED


CheckForVerticalSolidBlockCollision_SkreeMetaree:
    STA.B $1C 
    PHB 
    SEP #$20 
    LDA.B #$A0 
    PHA : PLB 
    REP #$30 
    PHX 
    LDA.W $0F7A,X : SEC : SBC.W $0F82,X : AND.W #$FFF0 
    STA.B $1A 
    LDA.W $0F7A,X : CLC : ADC.W $0F82,X : DEC A 
    SEC : SBC.B $1A : LSR #4
    STA.B $1A 
    LDA.B $1C 
    LSR A 
    BCC .zero1C 
    LDA.W $0F80,X : CLC : ADC.B $12 : STA.B $16 
    LDA.W $0F7E,X : ADC.B $14 : STA.B $18 
    CLC : ADC.W $0F84,X : DEC A 
    BRA + 


.zero1C:
    LDA.W $0F80,X : SEC : SBC.B $12 : STA.B $16 
    LDA.W $0F7E,X : SBC.B $14 : STA.B $18 
    SEC : SBC.W $0F84,X 

  + STA.B $22 
    LSR #4
    SEP #$20 
    STA.W $4202 
    LDA.W $07A5 : STA.W $4203 
    REP #$20 
    LDA.W $0F7A,X : SEC : SBC.W $0F82,X : LSR #4
    CLC : ADC.W $4216 : ASL A 
    TAX 

.loop:
    LDA.L $7F0002,X : BMI + 
    INX #2
    DEC.B $1A 
    BPL .loop 
    PLX 
    CLC 
    PLB 
    RTL 


  + PLX 
    STZ.B $12 
    LDA.B $1C 
    LSR A 
    BCC .movingUp 
    LDA.B $22 : AND.W #$FFF0 
    SEC : SBC.W $0F84,X : SBC.W $0F7E,X : BPL + 
    LDA.W #$0000 

  + STA.B $14 
    SEC 
    PLB 
    RTL 


.movingUp:
    LDA.B $22 
    ORA.W #$000F 
    SEC 
    ADC.W $0F84,X : SEC : SBC.W $0F7E,X : BMI + 
    LDA.W #$0000 

  + EOR.W #$FFFF 
    INC A 
    STA.B $14 
    SEC 
    PLB 
    RTL 


CalculateAngleOfSamusFromEnemyProjectile:
    PHP 
    REP #$30 
    LDA.W $0AF6 : SEC : SBC.W $1A4B,X : STA.B $12 
    LDA.W $0AFA : SEC : SBC.W $1A93,X : STA.B $14 
    JMP.W CalculateAngleOfXYOffset 


CalculateAngleOfSamusFromEnemy:
    PHP 
    REP #$30 
    LDA.W $0AF6 : SEC : SBC.W $0F7A,X : STA.B $12 
    LDA.W $0AFA : SEC : SBC.W $0F7E,X : STA.B $14 
    JMP.W CalculateAngleOfXYOffset 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_CalculateAngleOfEnemyYFromEnemyX_A0C07E:
    PHP 
    REP #$30 
    LDA.W $0F7A,Y : SEC : SBC.W $0F7A,X : STA.B $12 
    LDA.W $0F7E,Y : SEC : SBC.W $0F7E,X : STA.B $14 
    JMP.W CalculateAngleOfXYOffset 
endif ; !FEATURE_KEEP_UNREFERENCED


CalculateAngleOfEnemyYFromEnemyX:
    PHP 
    REP #$30 
    LDA.W $0F7A,X : SEC : SBC.W $0F7A,Y : STA.B $12 
    LDA.W $0F7E,X : SEC : SBC.W $0F7E,Y : STA.B $14 
    JMP.W CalculateAngleOfXYOffset 


CalculateAngleOf_12_14_Offset:
    PHP 
    REP #$30 

CalculateAngleOfXYOffset:
    PHX 
    LDX.W #$0000 
    LDA.B $12 : BPL .positive12 
    LDX.W #$0004 
    EOR.W #$FFFF 
    INC A 

.positive12:
    STA.B $12 
    LDA.B $14 : BPL .positive14 
    INX #2
    EOR.W #$FFFF 
    INC A 

.positive14:
    STA.B $14 
    CMP.B $12 : BCC .lowerOctant 
    SEP #$20 
    STZ.W $4204 
    LDA.B $12 : STA.W $4205 
    LDA.B $14 : STA.W $4206 
    NOP 
    REP #$20 
    JSR.W (.pointers,X) 
    PLX : PLP 
    RTL 


.pointers:
    dw CalculateAngleOfXYOffset_BottomRightLowerOctant 
    dw CalculateAngleOfXYOffset_TopRightUpperOctant 
    dw CalculateAngleOfXYOffset_BottomLeftLowerOctant 
    dw CalculateAngleOfXYOffset_TopLeftUpperOctant 

.lowerOctant:
    SEP #$20 
    STZ.W $4204 
    LDA.B $14 : STA.W $4205 
    LDA.B $12 : STA.W $4206 
    NOP 
    REP #$20 
    JSR.W (..pointers,X) 
    PLX : PLP 
    RTL 


..pointers:
    dw CalculateAngleOfXYOffset_BottomRightUpperOctant 
    dw CalculateAngleOfXYOffset_TopRightLowerOctant 
    dw CalculateAngleOfXYOffset_BottomLeftUpperOctant 
    dw CalculateAngleOfXYOffset_TopLeftLowerOctant 

CalculateAngleOfXYOffset_BottomRightUpperOctant:
    LDA.W $4214 
    LSR #3
    CLC : ADC.W #$0040 : AND.W #$00FF 
    RTS 


CalculateAngleOfXYOffset_BottomRightLowerOctant:
    LDA.W $4214 
    LSR #3
    STA.B $12 
    LDA.W #$0080 : SEC : SBC.B $12 : AND.W #$00FF 
    RTS 


CalculateAngleOfXYOffset_TopRightUpperOctant:
    LDA.W $4214 
    LSR #3
    AND.W #$00FF 
    RTS 


CalculateAngleOfXYOffset_TopRightLowerOctant:
    LDA.W $4214 
    LSR #3
    STA.B $12 
    LDA.W #$0040 : SEC : SBC.B $12 : AND.W #$00FF 
    RTS 


CalculateAngleOfXYOffset_BottomLeftLowerOctant:
    LDA.W $4214 
    LSR #3
    CLC : ADC.W #$0080 : AND.W #$00FF 
    RTS 


CalculateAngleOfXYOffset_BottomLeftUpperOctant:
    LDA.W $4214 
    LSR #3
    STA.B $12 
    LDA.W #$00C0 : SEC : SBC.B $12 : AND.W #$00FF 
    RTS 


CalculateAngleOfXYOffset_TopLeftLowerOctant:
    LDA.W $4214 
    LSR #3
    CLC : ADC.W #$00C0 : AND.W #$00FF 
    RTS 


CalculateAngleOfXYOffset_TopLeftUpperOctant:
    LDA.W $4214 
    LSR #3
    STA.B $12 
    LDA.W #$0100 : SEC : SBC.B $12 : AND.W #$00FF 
    RTS 


CheckIfEnemyIsHorizontallyOffScreen:
    LDA.W $0F7A,X : BMI .offScreen 
    CLC : ADC.W $0F82,X : SEC : SBC.W $0911 : BMI .offScreen 
    SEC : SBC.W #$0100 : SEC : SBC.W $0F82,X : BPL .offScreen 
    LDA.W #$0000 
    CLC 
    RTL 


.offScreen:
    LDA.W #$0001 
    SEC 
    RTL 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_CheckIfEnemyIsVerticallyOffScreen_A0C1B1:
    LDA.W $0F7E,X : BMI .offScreen 
    CLC : ADC.W $0F84,X : SEC : SBC.W $0915 : BMI .offScreen 
    SEC : SBC.W #$0100 : SEC : SBC.W $0F84,X : BPL .offScreen 
    LDA.W #$0000 
    CLC 
    RTL 


.offScreen:
    LDA.W #$0001 
    SEC 
    RTL 


UNUSED_AssessSamusThreatLevel_A0C1D4:
    LDA.W $09C4 : STA.W $4204 
    SEP #$20 
    LDA.B #$03 : STA.W $4206 
    REP #$20 
    NOP #3
    LDA.W $4214 : CMP.W $09C2 : BCC + 
    LDA.W #$0001 : BRA .store12 


  + ASL A 
    CMP.W $09C2 : BCC .load3 
    LDA.W #$0002 : BRA .store12 


.load3:
    LDA.W #$0003 

.store12:
    STA.B $12 
    LDA.W $09A8 : AND.W #$000F 
    EOR.W #$FFFF 
    STA.B $16 
    LDA.W $09A4 : EOR.W #$FFFF : STA.B $18 
    LDA.W #$0000 
    LSR.B $16 
    BCS + 
    ADC.W #$0002 

  + LSR.B $16 
    BCS + 
    ADC.W #$0001 

  + LSR.B $16 
    BCS + 
    ADC.W #$0003 

  + LSR.B $16 
    BCS + 
    ADC.W #$0003 

  + LSR.B $18 
    BCS + 
    ADC.W #$0000 

  + LSR.B $18 
    BCS + 
    ADC.W #$0000 

  + LSR.B $18 
    BCS + 
    ADC.W #$0000 

  + LSR.B $18 
    BCS + 
    ADC.W #$0003 

  + CLC : ADC.W $09CA : CLC : ADC.W $09CE : STA.B $14 
    CMP.W #$000B : BCC .return 
    INC.B $12 
    CMP.W #$001E : BCC .return 
    INC.B $12 

.return:
    RTL 
endif ; !FEATURE_KEEP_UNREFERENCED


ProcessEnemyInstructions:
    PHB 
    LDX.W $0E54 
    LDA.W $0F8A,X : AND.W #$0004 
    BNE .return 
    DEC.W $0F94,X 
    BNE ProcessEnemyInstructions_noUpdate 
    LDA.W $0FA5,X 
    PHA : PLB : PLB 
    LDY.W $0F92,X 

.loop:
    LDA.W $0000,Y : BPL .timer 
    STA.W $1784 
    INY #2
    PHK : PEA.W .loop-1 
    JML.W [$1784] 


.timer:
    STA.W $0F94,X 
    LDA.W $0002,Y : STA.W $0F8E,X 
    TYA 
    CLC : ADC.W #$0004 : STA.W $0F92,X 
    LDA.W $0F88,X : ORA.W #$8000 : STA.W $0F88,X 

  .return ; sleep, wait, delete
    PLB 
    RTS 


ProcessEnemyInstructions_noUpdate:
    LDA.W $0F88,X : AND.W #$7FFF : STA.W $0F88,X 
    PLB 
    RTS 


CLCRTS_A0C2BC:
    CLC 
    RTS 


SECRTS_A0C2BE:
    SEC 
    RTS 


EnemyBlockCollisionReaction_Spike:
    LDX.W $0DC4 
    LDA.L $7F6402,X : AND.W #$007F 
    ASL A 
    TAX 
    LDA.L .PLMs,X : BEQ .returnCollision 
    JSL.L Spawn_PLM_to_CurrentBlockIndex 
    CLC 
    RTS 


.returnCollision:
    SEC 
    RTS 


.PLMs:
    dw $0000 
    dw $0000 
    dw $0000 
    dw $0000 
    dw $0000 
    dw $0000 
    dw $0000 
    dw $0000 
    dw $0000 
    dw $0000 
    dw $0000 
    dw $0000 
    dw $0000 
    dw $0000 
    dw $0000 
    dw PLMEntries_EnemyBreakableBlock 

EnemyBlockCollisionReaction_Horizontal_Slope:
    LDX.W $0DC4 
    LDA.L $7F6402,X : AND.W #$001F 
    CMP.W #$0005 : BCS .nonSquare 
    JMP.W EnemyBlockCollisionReaction_Horizontal_Slope_Square 


.nonSquare:
    LDA.L $7F6402,X : AND.W #$00FF : STA.W $1E77 
    JMP.W EnemyBlockCollisionReaction_Horizontal_Slope_NonSquare 


EnemyBlockCollisionReaction_Vertical_Slope:
    LDX.W $0DC4 
    LDA.L $7F6402,X : AND.W #$001F 
    CMP.W #$0005 : BCS .nonSquare 
    JMP.W EnemyBlockCollisionReaction_Vertical_Slope_Square 


.nonSquare:
    JMP.W EnemyBlockCollisionReaction_Vertical_Slope_NonSquare 


EnemyBlockCollisionReaction_Horizontal_Slope_Square:
    ASL #2
    STA.W $0DD4 
    LDA.L $7F6401,X 
    ROL A 
    ROL A 
    ROL A 
    AND.W #$0003 
    STA.W $0DD6 
    LDA.B $1A : AND.W #$0008 
    LSR #3
    EOR.W $0DD6 
    ADC.W $0DD4 : TAX 
    LDY.W $0E54 
    LDA.B $1C : BNE .topBlockCheck 
    LDA.W $0F7E,Y : CLC : ADC.W $0F84,Y : DEC A 
    AND.W #$0008 
    BNE .checkBothHalves 
    LDA.L SquareSlopeDefinitions_BankA0-1,X : BMI .solid 
    BRA .returnNoCollision 


.topBlockCheck:
    CMP.B $1E : BNE .checkBothHalves 
    LDA.W $0F7E,Y : SEC : SBC.W $0F84,Y : AND.W #$0008 
    BNE .checkBottomHalf 

.checkBothHalves:
    LDA.L SquareSlopeDefinitions_BankA0-1,X : BMI .solid 

.checkBottomHalf:
    TXA 
    EOR.W #$0002 
    TAX 
    LDA.L SquareSlopeDefinitions_BankA0-1,X : BMI .solid 

.returnNoCollision:
    CLC 
    RTS 


.solid:
    SEC 
    RTS 


.deadCode:
    TYX 
    STZ.W $0F7C,X 
    LDA.B $1A : BIT.B $14 
    BMI ..right 
    AND.W #$FFF8 
    SEC : SBC.W $0F82,X : STA.W $0F7A,X 
    SEC 
    RTS 


..right:
    ORA.W #$0007 
    SEC 
    ADC.W $0F82,X : STA.W $0F7A,X 
    SEC 
    RTS 


EnemyBlockCollisionReaction_Vertical_Slope_Square:
    ASL #2
    STA.W $0DD4 
    LDA.L $7F6401,X 
    ROL A 
    ROL A 
    ROL A 
    AND.W #$0003 
    STA.W $0DD6 
    LDA.B $1A : AND.W #$0008 
    LSR #2
    EOR.W $0DD6 
    ADC.W $0DD4 : TAX 
    LDY.W $0E54 
    LDA.B $1C : BNE .leftmostBlockCheck 
    LDA.W $0F7A,Y : CLC : ADC.W $0F82,Y : DEC A 
    AND.W #$0008 
    BNE .checkBothHalves 
    LDA.L SquareSlopeDefinitions_BankA0-1,X : BMI .solid 
    BRA .returnNoCollision 


.leftmostBlockCheck:
    CMP.B $1E : BNE .checkBothHalves 
    LDA.W $0F7A,Y : SEC : SBC.W $0F82,Y : AND.W #$0008 
    BNE .checkRightHalf 

.checkBothHalves:
    LDA.L SquareSlopeDefinitions_BankA0-1,X : BMI .solid 

.checkRightHalf:
    TXA 
    EOR.W #$0001 
    TAX 
    LDA.L SquareSlopeDefinitions_BankA0-1,X : BMI .solid 

.returnNoCollision:
    CLC 
    RTS 


.solid:
    SEC 
    RTS 


.deadCode:
    TYX 
    STZ.W $0F80,X 
    LDA.B $1A : BIT.B $14 
    BMI ..bottom 
    AND.W #$FFF8 
    SEC : SBC.W $0F84,X : STA.W $0F7E,X 
    SEC 
    RTS 


..bottom:
    ORA.W #$0007 
    SEC 
    ADC.W $0F84,X : STA.W $0F7E,X 
    SEC 
    RTS 


SquareSlopeDefinitions_BankA0:
    db $00,$01,$82,$83,$00,$81,$02,$83,$00,$01,$02,$83,$00,$81,$82,$83 
    db $80,$81,$82,$83 

EnemyBlockCollisionReaction_Horizontal_Slope_NonSquare:
    BIT.B $20 
    BMI .processSlopes 
    BVS .returnCollision 
    CLC 
    RTS 


.returnCollision:
    SEC 
    RTS 


.processSlopes:
    LDA.W $1E77 : AND.W #$001F 
    ASL #2
    TAX 
    LDA.B $14 : BPL + 
    LDA.L .adjustedDistanceMult,X 
    TAY 
    LDA.B $13 
    EOR.W #$FFFF 
    INC A 
    JSL.L A_Y_16bit_UnsignedMultiplication 
    LDA.W $05F1 
    EOR.W #$FFFF 
    CLC : ADC.W #$0001 : STA.B $12 
    LDA.W $05F3 
    EOR.W #$FFFF 
    ADC.W #$0000 : STA.B $14 
    CLC 
    RTS 


  + LDA.L .adjustedDistanceMult,X 
    TAY 
    LDA.B $13 : JSL.L A_Y_16bit_UnsignedMultiplication 
    LDA.W $05F1 : STA.B $12 
    LDA.W $05F3 : STA.B $14 
    CLC 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
.unused:
    dw $0000 
endif ; !FEATURE_KEEP_UNREFERENCED

.adjustedDistanceMult:
    dw $0100,$0000,$0100,$0000,$0100,$0000,$0100,$0000 
    dw $0100,$0000,$0100,$0000,$0100,$0000,$0100,$0000 
    dw $0100,$0000,$0100,$0000,$0100,$0000,$0100,$0000 
    dw $0100,$0000,$0100,$1000,$00B0,$1000,$00B0,$0000 
    dw $0100,$0000,$0100,$1000,$00C0,$0000,$0100,$1000 
    dw $00C0,$1000,$00C0,$0800,$00D8,$0800,$00D8,$0600 
    dw $00F0,$0600,$00F0,$0600,$00F0,$4000,$0080,$4000 
    dw $0080,$6000,$0050,$6000,$0050,$6000,$0050 

EnemyBlockCollisionReaction_Vertical_Slope_NonSquare:
    LDY.W $0E54 
    LDA.B $14 : BPL + 
    JMP.W .up 


  + LDX.W $0DC4 
    STX.W $4204 
    SEP #$20 
    LDA.W $07A5 : STA.W $4206 
    REP #$20 
    LDA.W $0F7A,Y 
    LSR #4
    CMP.W $4216 : BEQ + 
    CLC 
    RTS 


  + LDA.B $18 : CLC : ADC.W $0F84,Y : DEC A 
    AND.W #$000F 
    STA.W $0DD4 
    LDA.L $7F6402,X : AND.W #$001F 
    ASL #4
    STA.W $0DD6 
    LDA.L $7F6401,X : BMI .returnUpper 
    ASL A 
    BMI .blockBTS40 
    LDA.W $0F7A,Y : BRA + 


.blockBTS40:
    LDA.W $0F7A,Y 
    EOR.W #$000F 

  + AND.W #$000F 
    CLC : ADC.W $0DD6 : TAX 
    LDA.L SlopeDefinitions_SlopeTopXOffsetByYPixel,X : AND.W #$001F 
    SEC : SBC.W $0DD4 : DEC A 
    BEQ + 
    BPL .returnUpper 

  + CLC : ADC.B $18 : STA.W $0F7E,Y 
    LDA.W #$FFFF : STA.W $0F80,Y 
    SEC 
    RTS 


.returnUpper:
    CLC 
    RTS 


.up:
    LDX.W $0DC4 
    STX.W $4204 
    SEP #$20 
    LDA.W $07A5 : STA.W $4206 
    REP #$20 
    LDA.W $0F7A,Y 
    LSR #4
    CMP.W $4216 : BEQ + 
    CLC 
    RTS 


  + LDA.B $18 : SEC : SBC.W $0F84,Y : AND.W #$000F 
    EOR.W #$000F 
    STA.W $0DD4 
    LDA.L $7F6402,X : AND.W #$001F 
    ASL #4
    STA.W $0DD6 
    LDA.L $7F6401,X : BPL .returnLower 
    ASL A 
    BMI ..blockBTS40 
    LDA.W $0F7A,Y : BRA + 


..blockBTS40:
    LDA.W $0F7A,Y 
    EOR.W #$000F 

  + AND.W #$000F 
    CLC : ADC.W $0DD6 : TAX 
    LDA.L SlopeDefinitions_SlopeTopXOffsetByYPixel,X : AND.W #$001F 
    SEC : SBC.W $0DD4 : DEC A 
    BEQ + 
    BPL .returnLower 

  + EOR.W #$FFFF 
    INC A 
    CLC : ADC.B $18 : STA.W $0F7E,Y 
    LDA.W #$0000 : STA.W $0F80,Y 
    SEC 
    RTS 


.returnLower:
    CLC 
    RTS 


EnemyBlockCollisionReaction_HorizontalExtension:
    LDX.W $0DC4 
    LDA.L $7F6402,X : AND.W #$00FF 
    BEQ .return 
    BIT.W #$0080 
    BNE .highByte 
    AND.W #$00FF 
    BRA + 


.highByte:
    ORA.W #$FF00 

  + CLC : ADC.W $0DC4 : STA.W $0DC4 
    ASL A 
    TAX 
    LDA.L $7F0002,X : AND.W #$F000 
    XBA 
    LSR #3
    TAX 
    PLA 
    SEC : SBC.W #$0003 : PHA 

.return:
    CLC 
    RTS 


EnemyBlockCollisionReaction_VerticalExtension:
    LDX.W $0DC4 
    LDA.L $7F6402,X : AND.W #$00FF 
    BEQ .return 
    BIT.W #$0080 
    BNE .highByte 
    STA.W $0DD4 
    LDA.W $0DC4 

  - CLC : ADC.W $07A5 : DEC.W $0DD4 
    BNE - 
    JMP.W + 


.highByte:
    ORA.W #$FF00 
    STA.W $0DD4 
    LDA.W $0DC4 

.loop:
    SEC : SBC.W $07A5 : INC.W $0DD4 
    BNE .loop 

  + STA.W $0DC4 
    ASL A 
    TAX 
    LDA.L $7F0002,X : AND.W #$F000 
    XBA 
    LSR #3
    TAX 
    PLA 
    SEC : SBC.W #$0003 : PHA 

.return:
    CLC 
    RTS 


MoveEnemyRightBy_14_12_TreatSlopesAsWalls:
    LDA.W #$4000 : STA.B $20 
    BRA MoveEnemyRightBy_14_12_Common 


MoveEnemyRightBy_14_12_ProcessSlopes:
    LDA.W #$8000 : STA.B $20 
    BRA MoveEnemyRightBy_14_12_Common 


MoveEnemyRightBy_14_12_IgnoreSlopes:
    STZ.B $20 

MoveEnemyRightBy_14_12_Common:
    LDA.B $12 
    ORA.B $14 
    BNE .notZero 
    CLC 
    RTL 


.notZero:
    PHX 
    LDA.W $0F7E,X : SEC : SBC.W $0F84,X : AND.W #$FFF0 
    STA.B $1C 
    LDA.W $0F7E,X : CLC : ADC.W $0F84,X : DEC A 
    SEC : SBC.B $1C : LSR #4
    STA.B $1C 
    STA.B $1E 
    LDA.W $0F7E,X : SEC : SBC.W $0F84,X : LSR #4
    SEP #$20 
    STA.W $4202 
    LDA.W $07A5 : STA.W $4203 
    REP #$20 
    LDA.W $0F7C,X : CLC : ADC.B $12 : STA.B $16 
    LDA.W $0F7A,X : ADC.B $14 : STA.B $18 
    BIT.B $14 
    BMI .targetLeftBoundary 
    CLC : ADC.W $0F82,X : DEC A 
    BRA + 


.targetLeftBoundary:
    SEC : SBC.W $0F82,X 

  + STA.B $1A 
    LSR #4
    CLC : ADC.W $4216 : ASL A 
    TAX 

.loop:
    LDA.L $7F0002,X : JSR.W EnemyHorizontalBlockReaction 
    BCS .solid 
    TXA 
    CLC : ADC.W $07A5 : ADC.W $07A5 : TAX 
    DEC.B $1C 
    BPL .loop 
    PLX 
    LDA.B $12 : CLC : ADC.W $0F7C,X : STA.W $0F7C,X 
    LDA.B $14 : ADC.W $0F7A,X : STA.W $0F7A,X 
    CLC 
    RTL 

    PLX ; dead code
    SEC 
    RTL 


.solid:
    PLX 
    LDA.B $1A : BIT.B $14 
    BMI .movingLeft 
    AND.W #$FFF0 
    SEC : SBC.W $0F82,X : CMP.W $0F7A,X : BCC + 
    STA.W $0F7A,X 

  + LDA.W #$FFFF : STA.W $0F7C,X 
    SEC 
    RTL 


.movingLeft:
    ORA.W #$000F 
    SEC 
    ADC.W $0F82,X : CMP.W $0F7A,X : BEQ .storeX 
    BCS .storeSubX 

.storeX:
    STA.W $0F7A,X 

.storeSubX:
    STZ.W $0F7C,X 
    SEC 
    RTL 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_MoveEnemyDownBy_14_12_A0C778:
    LDA.W #$4000 : STA.B $20 
    BRA MoveEnemyDownBy_14_12_BranchEntry 


UNUSED_MoveEnemyDownBy_14_12_A0C77F:
    LDA.W #$8000 : STA.B $20 
    BRA MoveEnemyDownBy_14_12_BranchEntry 
endif ; !FEATURE_KEEP_UNREFERENCED


MoveEnemyDownBy_14_12:
    STZ.B $20 

MoveEnemyDownBy_14_12_BranchEntry:
    LDA.B $12 
    ORA.B $14 
    BNE .notZero 
    CLC 
    RTL 


.notZero:
    PHX 
    LDA.W $0F7A,X : SEC : SBC.W $0F82,X : AND.W #$FFF0 
    STA.B $1C 
    LDA.W $0F7A,X : CLC : ADC.W $0F82,X : DEC A 
    SEC : SBC.B $1C : LSR #4
    STA.B $1C 
    STA.B $1E 
    LDA.W $0F80,X : CLC : ADC.B $12 : STA.B $16 
    LDA.W $0F7E,X : ADC.B $14 : STA.B $18 
    BIT.B $14 
    BMI .targetFrontBoundary 
    CLC : ADC.W $0F84,X : DEC A 
    BRA + 


.targetFrontBoundary:
    SEC : SBC.W $0F84,X 

  + STA.B $1A 
    LSR #4
    SEP #$20 
    STA.W $4202 
    LDA.W $07A5 : STA.W $4203 
    REP #$20 
    LDA.W $0F7A,X : SEC : SBC.W $0F82,X : LSR #4
    CLC : ADC.W $4216 : ASL A 
    TAX 

.loop:
    LDA.L $7F0002,X : JSR.W EnemyVerticalBlockReaction 
    BCS .solid 
    INX #2
    DEC.B $1C 
    BPL .loop 
    PLX 
    LDA.B $16 : STA.W $0F80,X 
    LDA.B $18 : STA.W $0F7E,X 
    CLC 
    RTL 

    PLX ; dead code
    SEC 
    RTL 


.solid:
    PLX 
    LDA.B $1A : BIT.B $14 
    BMI .movingUp 
    AND.W #$FFF0 
    SEC : SBC.W $0F84,X : CMP.W $0F7E,X : BCC + 
    STA.W $0F7E,X 

  + LDA.W #$FFFF : STA.W $0F80,X 
    SEC 
    RTL 


.movingUp:
    ORA.W #$000F 
    SEC 
    ADC.W $0F84,X : CMP.W $0F7E,X : BEQ .storeX 
    BCS .storeSubX 

.storeX:
    STA.W $0F7E,X 

.storeSubX:
    STZ.W $0F80,X 
    SEC 
    RTL 


EnemyHorizontalBlockReaction:
    PHX 
    TXY 
    AND.W #$F000 
    XBA 
    LSR #3
    TAX 
    TYA 
    LSR A 
    STA.W $0DC4 
    JSR.W (.pointers,X) 
    PLX 
    RTS 


.pointers:
    dw CLCRTS_A0C2BC 
    dw EnemyBlockCollisionReaction_Horizontal_Slope 
    dw CLCRTS_A0C2BC 
    dw CLCRTS_A0C2BC 
    dw CLCRTS_A0C2BC 
    dw EnemyBlockCollisionReaction_HorizontalExtension 
    dw CLCRTS_A0C2BC 
    dw CLCRTS_A0C2BC 
    dw SECRTS_A0C2BE 
    dw SECRTS_A0C2BE 
    dw EnemyBlockCollisionReaction_Spike 
    dw SECRTS_A0C2BE 
    dw SECRTS_A0C2BE 
    dw EnemyBlockCollisionReaction_VerticalExtension 
    dw SECRTS_A0C2BE 
    dw SECRTS_A0C2BE 

EnemyVerticalBlockReaction:
    PHX 
    TXY 
    AND.W #$F000 
    XBA 
    LSR #3
    TAX 
    TYA 
    LSR A 
    STA.W $0DC4 
    JSR.W (.pointers,X) 
    PLX 
    RTS 


.pointers:
    dw CLCRTS_A0C2BC 
    dw EnemyBlockCollisionReaction_Vertical_Slope 
    dw CLCRTS_A0C2BC 
    dw CLCRTS_A0C2BC 
    dw CLCRTS_A0C2BC 
    dw EnemyBlockCollisionReaction_HorizontalExtension 
    dw CLCRTS_A0C2BC 
    dw CLCRTS_A0C2BC 
    dw SECRTS_A0C2BE 
    dw SECRTS_A0C2BE 
    dw EnemyBlockCollisionReaction_Spike 
    dw SECRTS_A0C2BE 
    dw SECRTS_A0C2BE 
    dw EnemyBlockCollisionReaction_VerticalExtension 
    dw SECRTS_A0C2BE 
    dw SECRTS_A0C2BE 

AlignEnemyYPositionWIthNonSquareSlope:
    PHY : PHX 
    CLC 
    PHP 
    TXY 
    LDA.W $0F7A,Y 
    PHA 
    LDA.W $0F7E,Y : CLC : ADC.W $0F84,Y : DEC A 
    PHA 
    JSL.L CalculateTheBlockContainingAPixelPosition 
    LDA.W $0DC4 
    ASL A 
    TAX 
    LDA.L $7F0002,X : AND.W #$F000 
    CMP.W #$1000 : BNE .enemyTopCheck 
    LDX.W $0DC4 
    LDA.L $7F6402,X : AND.W #$001F 
    CMP.W #$0005 : BCC .enemyTopCheck 
    PLP 
    SEC 
    PHP 
    LDA.W $0F7E,Y : CLC : ADC.W $0F84,Y : DEC A 
    AND.W #$000F 
    STA.W $0DD4 
    LDA.L $7F6402,X : AND.W #$001F 
    ASL #4
    STA.W $0DD6 
    LDA.L $7F6401,X : BMI .enemyTopCheck 
    ASL A 
    BMI .blockBTS40 
    LDA.W $0F7A,Y : BRA + 


.blockBTS40:
    LDA.W $0F7A,Y 
    EOR.W #$000F 

  + AND.W #$000F 
    CLC : ADC.W $0DD6 : TAX 
    LDA.L SlopeDefinitions_SlopeTopXOffsetByYPixel,X : AND.W #$001F 
    SEC : SBC.W $0DD4 : DEC A 
    BPL .enemyTopCheck 
    CLC : ADC.W $0F7E,Y : STA.W $0F7E,Y 

.enemyTopCheck:
    LDA.W $0F7A,Y 
    PHA 
    LDA.W $0F7E,Y : SEC : SBC.W $0F84,Y : PHA 
    JSL.L CalculateTheBlockContainingAPixelPosition 
    LDA.W $0DC4 
    ASL A 
    TAX 
    LDA.L $7F0002,X : AND.W #$F000 
    CMP.W #$1000 : BNE .return 
    LDX.W $0DC4 
    LDA.L $7F6402,X : AND.W #$001F 
    CMP.W #$0005 : BCC .return 
    PLP 
    SEC 
    PHP 
    LDA.W $0F7E,Y : SEC : SBC.W $0F84,Y : AND.W #$000F 
    EOR.W #$000F 
    STA.W $0DD4 
    LDA.L $7F6402,X : AND.W #$001F 
    ASL #4
    STA.W $0DD6 
    LDA.L $7F6401,X : BPL .return 
    ASL A 
    BMI ..blockBTS40 
    LDA.W $0F7A,Y : BRA + 


..blockBTS40:
    LDA.W $0F7A,Y 
    EOR.W #$000F 

  + AND.W #$000F 
    CLC : ADC.W $0DD6 : TAX 
    LDA.L SlopeDefinitions_SlopeTopXOffsetByYPixel,X : AND.W #$001F 
    SEC : SBC.W $0DD4 : DEC A 
    BEQ + 
    BPL .return 

  + EOR.W #$FFFF 
    INC A 
    CLC : ADC.W $0F7E,Y : STA.W $0F7E,Y 

.return:
    PLP : PLX : PLY 
    RTL 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_CommonEnemyProjectileSpeeds_LinearlyIncreasing_A0C9BF:
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
endif ; !FEATURE_KEEP_UNREFERENCED

CommonEnemyProjectileSpeeds_QuadraticallyIncreasing:
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


EnemyHeaders_Boyon:
EnemyHeaders:
  .tileDataSize:
    dw $0400 

  .palette:
    dw Palette_Boyon 

  .health:
    dw $03E8 

  .damage:
    dw $000A 

  .width:
    dw $0008 

  .height:
    dw $0008 

  .bank:
    db $A2 

  .hurtAITime:
    db $00 

  .cry:
    dw $0000 

  .bossID:
    dw $0000 

  .initAI:
    dw InitAI_Boyon 

  .numberOfParts:
    dw $0001 

  .unused16:
    dw $0000 

  .mainAI:
    dw MainAI_Boyon 

  .grappleAI:
    dw CommonA2_GrappleAI_CancelGrappleBeam 

  .hurtAI:
    dw RTL_A2804C 

  .frozenAI:
    dw CommonA2_NormalEnemyFrozenAI 

  .timeIsFrozenAI:
    dw $0000 

  .deathAnimation:
    dw $0000 

  .unused24:
    dd $00000000 

  .powerBombReaction:
    dw $0000 

  .sidehopperVariantIndex:
    dw $0000 

  .unused2C:
    dd $00000000 

  .enemyTouch:
    dw Common_NormalEnemyTouchAI 

  .enemyShot:
    dw Common_NormalEnemyShotAI 

  .unused34SpritemapPointerTable:
    dw $0000 

  .tileData:
    dl Tiles_Boyon 

  .layer:
    db $05 

  .dropChances:
    dw EnemyDropChances_Boyon 

  .vulnerabilities:
    dw EnemyVulnerabilities_Boyon 

  .name:
    dw EnemyName_Boyon 

EnemyHeaders_Stoke:
    dw $0400 
    dw Palette_Stoke 
    dw $0014,$0028,$0008,$0008 
    db $A2,$00 
    dw $0053,$0000 
    dw InitAI_Stoke 
    dw $0001,$0000 
    dw MainAI_Stoke 
    dw CommonA2_GrappleAI_CancelGrappleBeam 
    dw RTL_A2804C 
    dw CommonA2_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw CommonA2_NormalEnemyTouchAI 
    dw CommonA2_NormalEnemyShotAI 
    dw $0000 
    dl Tiles_Stoke 
    db $05 
    dw EnemyDropChances_Stoke 
    dw EnemyVulnerabilities_Default 
    dw EnemyName_Stoke 

EnemyHeaders_MamaTurtle:
    dw $0C00 
    dw Palette_MamaTurtle_BabyTurtle 
    dw $4E20,$00C8,$0014,$0010 
    db $A2,$00 
    dw $0000,$0000 
    dw InitAI_MamaTurtle 
    dw $0005,$0000 
    dw MainAI_MamaTurtle 
    dw CommonA2_GrappleAI_CancelGrappleBeam 
    dw RTL_A2804C 
    dw CommonA2_NormalEnemyFrozenAI 
    dw $0000 
    dw $0004 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw EnemyTouch_MamaTurtle 
    dw CommonA2_NormalEnemyShotAI 
    dw $0000 
    dl Tiles_MamaTurtle_BabyTurtle 
    db $05 
    dw EnemyDropChances_MamaTurtle_BabyTurtle 
    dw EnemyVulnerabilities_Indestructible 
    dw EnemyName_MamaTurtle 

EnemyHeaders_BabyTurtle:
    dw $0C00 
    dw Palette_MamaTurtle_BabyTurtle 
    dw $4E20,$0000,$0008,$0005 
    db $A2,$00 
    dw $0000,$0000 
    dw InitAI_BabyTurtle 
    dw $0001,$0000 
    dw MainAI_BabyTurtle 
    dw CommonA2_GrappleAI_CancelGrappleBeam 
    dw RTL_A2804C 
    dw CommonA2_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw EnemyTouch_BabyTurtle 
    dw EnemyShot_BabyTurtle 
    dw $0000 
    dl Tiles_MamaTurtle_BabyTurtle 
    db $05 
    dw EnemyDropChances_MamaTurtle_BabyTurtle 
    dw EnemyVulnerabilities_Indestructible 
    dw $0000 

EnemyHeaders_Puyo:
    dw $0200 
    dw Palette_Puyo 
    dw $0064,$003C,$0008,$0004 
    db $A2,$00 
    dw $0000,$0000 
    dw InitAI_Puyo 
    dw $0001,$0000 
    dw MainAI_Puyo 
    dw CommonA2_GrappleAI_KillEnemy 
    dw RTL_A2804C 
    dw CommonA2_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw CommonA2_NormalEnemyTouchAI 
    dw CommonA2_NormalEnemyShotAI 
    dw $0000 
    dl Tiles_Puyo 
    db $05 
    dw EnemyDropChances_Puyo 
    dw EnemyVulnerabilities_Default 
    dw EnemyName_Puyo 

EnemyHeaders_Cacatac:
    dw $0400 
    dw Palette_Cacatac 
    dw $003C,$0014,$0008,$0008 
    db $A2,$00 
    dw $0000,$0000 
    dw InitAI_Cacatac 
    dw $0001,$0000 
    dw MainAI_Cacatac 
    dw CommonA2_GrappleAI_KillEnemy 
    dw RTL_A2804C 
    dw CommonA2_NormalEnemyFrozenAI 
    dw $0000 
    dw $0002 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw CommonA2_NormalEnemyTouchAI 
    dw CommonA2_NormalEnemyShotAI 
    dw $0000 
    dl Tiles_Cacatac 
    db $05 
    dw EnemyDropChances_Cacatac 
    dw EnemyVulnerabilities_Default 
    dw EnemyName_Cacatac 

EnemyHeaders_Owtch:
    dw $0400 
    dw Palette_Owtch 
    dw $0014,$0064,$0008,$0008 
    db $A2,$00 
    dw $003E,$0000 
    dw InitAI_Owtch 
    dw $0001,$0000 
    dw MainAI_Owtch 
    dw CommonA2_GrappleAI_CancelGrappleBeam 
    dw RTL_A2804C 
    dw CommonA2_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw CommonA2_NormalEnemyTouchAI 
    dw EnemyShot_Owtch 
    dw $0000 
    dl Tiles_Owtch 
    db $05 
    dw EnemyDropChances_Owtch 
    dw EnemyVulnerabilities_Owtch 
    dw EnemyName_Owtch 

EnemyHeaders_ShipTop:
    dw $1000 
    dw Palette_Ship 
    dw $0014,$0028,$005C,$0028 
    db $A2,$00 
    dw $0000,$0000 
    dw InitAI_ShipTop 
    dw $0001,$0000 
    dw MainAI_ShipTop 
    dw CommonA2_GrappleAI_CancelGrappleBeam 
    dw RTL_A2804C 
    dw CommonA2_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw RTL_A0804C 
    dw $0000 
    dd $00000000 
    dw RTL_A2804C 
    dw RTL_A2804C 
    dw $0000 
    dl Tiles_Ship 
    db $02 
    dw EnemyDropChances_ShipTop_ShipBottomEntrance 
    dw EnemyVulnerabilities_Default 
    dw $0000 

EnemyHeaders_ShipBottomEntrance:
    dw $0200 
    dw Palette_Ship 
    dw $0014,$0028,$0060,$0028 
    db $A2,$00 
    dw $0000,$0000 
    dw InitAI_ShipBottomEntrance 
    dw $0001,$0000 
    dw RTL_A2804C 
    dw CommonA2_GrappleAI_CancelGrappleBeam 
    dw RTL_A2804C 
    dw RTL_A2804C 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw RTL_A0804C 
    dw $0000 
    dd $00000000 
    dw RTL_A2804C 
    dw RTL_A2804C 
    dw $0000 
    dl Tiles_Ship 
    db $02 
    dw EnemyDropChances_ShipTop_ShipBottomEntrance 
    dw EnemyVulnerabilities_Default 
    dw $0000 

EnemyHeaders_Mellow:
    dw $0400 
    dw Palette_Mellow 
    dw $0009,$0008,$0008,$0004 
    db $A2,$00 
    dw $0020,$0000 
    dw InitAI_Mellow_Mella_Menu 
    dw $0001,$0000 
    dw MainAI_Mellow_Mella_Menu 
    dw CommonA2_GrappleAI_KillEnemy 
    dw RTL_A2804C 
    dw CommonA2_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw $0000 
    dw InstList_Mellow_Mella_Menu 
    dd $00000000 
    dw CommonA2_NormalEnemyTouchAI 
    dw CommonA2_NormalEnemyShotAI 
    dw UNUSED_FlySpritemapPointers_A2B204 
    dl Tiles_Mellow 
    db $05 
    dw EnemyDropChances_Mellow 
    dw EnemyVulnerabilities_Default 
    dw EnemyName_Mellow 

EnemyHeaders_Mella:
    dw $0400 
    dw Palette_Mella 
    dw $001E,$0010,$0008,$0004 
    db $A2,$00 
    dw $0020,$0000 
    dw InitAI_Mellow_Mella_Menu 
    dw $0001,$0000 
    dw MainAI_Mellow_Mella_Menu 
    dw CommonA2_GrappleAI_KillEnemy 
    dw RTL_A2804C 
    dw CommonA2_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw $0000 
    dw UNUSED_PointerToUnusedData_A2B22C 
    dd $00000000 
    dw CommonA2_NormalEnemyTouchAI 
    dw CommonA2_NormalEnemyShotAI 
    dw UNUSED_SpritemapPointers_Mella_A2B25C 
    dl Tiles_Mella 
    db $05 
    dw EnemyDropChances_Mella 
    dw EnemyVulnerabilities_Mella 
    dw EnemyName_Mella 

EnemyHeaders_Menu:
    dw $0400 
    dw Palette_Menu 
    dw $0064,$003C,$0008,$0008 
    db $A2,$00 
    dw $0020,$0000 
    dw InitAI_Mellow_Mella_Menu 
    dw $0001,$0000 
    dw MainAI_Mellow_Mella_Menu 
    dw CommonA2_GrappleAI_KillEnemy 
    dw RTL_A2804C 
    dw CommonA2_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw $0000 
    dw UNUSED_DataPointer_A2B284 
    dd $00000000 
    dw CommonA2_NormalEnemyTouchAI 
    dw CommonA2_NormalEnemyShotAI 
    dw UNUSED_SpritemapPointers_Menu_A2B2B4 
    dl Tiles_Menu 
    db $05 
    dw EnemyDropChances_Menu 
    dw EnemyVulnerabilities_Default 
    dw EnemyName_Menu 

EnemyHeaders_Multiviola:
    dw $0400 
    dw Palette_Multiviola 
    dw $005A,$0032,$0008,$0008 
    db $A2,$00 
    dw $003E,$0000 
    dw InitAI_Multiviola 
    dw $0001,$0000 
    dw MainAI_Multiviola 
    dw CommonA2_GrappleAI_CancelGrappleBeam 
    dw RTL_A2804C 
    dw CommonA2_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw $0000 
    dw InstList_Multiviola 
    dd $00000000 
    dw CommonA2_NormalEnemyTouchAI 
    dw CommonA2_NormalEnemyShotAI 
    dw $0000 
    dl Tiles_Multiviola 
    db $05 
    dw EnemyDropChances_Multiviola 
    dw EnemyVulnerabilities_Multiviola 
    dw EnemyName_Multiviola 

EnemyHeaders_LavaRocks:
    dw $0600 
    dw Palette_Polyp_Rinka 
    dw $0001,$0004,$0004,$0004 
    db $A2,$00 
    dw $0000,$0000 
    dw InitAI_Polyp 
    dw $0001,$0000 
    dw MainAI_Polyp 
    dw CommonA2_GrappleAI_CancelGrappleBeam 
    dw RTL_A2804C 
    dw CommonA2_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw CommonA2_NormalEnemyTouchAI 
    dw CommonA2_NormalEnemyShotAI 
    dw $0000 
    dl Tiles_Polyp_Rinka 
    db $05 
    dw EnemyDropChances_Polyp 
    dw EnemyVulnerabilities_Indestructible 
    dw EnemyName_Polyp 

EnemyHeaders_Rinka:
    dw $0600 
    dw Palette_Polyp_Rinka 
    dw $000A,$0028,$0008,$0008 
    db $A2,$00 
    dw $0000,$0000 
    dw InitAI_Rinka 
    dw $0001,$0000 
    dw MainAI_Rinka 
    dw CommonA2_GrappleAI_CancelGrappleBeam 
    dw RTL_A2804C 
    dw FrozenAI_Rinka 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw PowerBombReaction_Rinka 
    dw $0000 
    dd $00000000 
    dw EnemyTouch_Rinka 
    dw EnemyShot_Rinka 
    dw $0000 
    dl Tiles_Polyp_Rinka 
    db $02 
    dw EnemyDropChances_Rinka 
    dw EnemyVulnerabilities_Default 
    dw EnemyName_Rinka 

EnemyHeaders_Rio:
    dw $0400 
    dw Palette_Rio 
    dw $002D,$000F,$0010,$0007 
    db $A2,$00 
    dw $0036,$0000 
    dw InitAI_Rio 
    dw $0001,$0000 
    dw MainAI_Rio 
    dw CommonA2_GrappleAI_CancelGrappleBeam 
    dw RTL_A2804C 
    dw CommonA2_NormalEnemyFrozenAI 
    dw $0000 
    dw $0002 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw CommonA2_NormalEnemyTouchAI 
    dw CommonA2_NormalEnemyShotAI 
    dw $0000 
    dl Tiles_Rio 
    db $05 
    dw EnemyDropChances_Rio 
    dw EnemyVulnerabilities_Default 
    dw EnemyName_Rio 

EnemyHeaders_Squeept:
    dw $0400 
    dw Palette_Squeept 
    dw $012C,$0032,$0008,$000C 
    db $A2,$00 
    dw $0036,$0000 
    dw InitAI_Squeept 
    dw $0002,$0000 
    dw MainAI_Squeept 
    dw CommonA2_GrappleAI_CancelGrappleBeam 
    dw RTL_A2804C 
    dw CommonA2_NormalEnemyFrozenAI 
    dw $0000 
    dw $0002 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw CommonA2_NormalEnemyTouchAI 
    dw CommonA2_NormalEnemyShotAI 
    dw $0000 
    dl Tiles_Squeept 
    db $05 
    dw EnemyDropChances_Squeept 
    dw EnemyVulnerabilities_Squeept_Ripper2_Ripper_Tripper 
    dw EnemyName_Squeept 

EnemyHeaders_Geruta:
    dw $0600 
    dw Palette_Geruta 
    dw $0078,$003C,$0010,$0009 
    db $A2,$00 
    dw $0036,$0000 
    dw InitAI_Geruta 
    dw $0002,$0000 
    dw MainAI_Geruta 
    dw CommonA2_GrappleAI_CancelGrappleBeam 
    dw RTL_A2804C 
    dw CommonA2_NormalEnemyFrozenAI 
    dw $0000 
    dw $0002 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw CommonA2_NormalEnemyTouchAI 
    dw CommonA2_NormalEnemyShotAI 
    dw $0000 
    dl Tiles_Geruta 
    db $05 
    dw EnemyDropChances_smallEnergy 
    dw EnemyVulnerabilities_Geruta 
    dw EnemyName_Geruta 

EnemyHeaders_Holtz:
    dw $0800 
    dw Palette_Holtz 
    dw $0384,$0078,$0010,$000A 
    db $A2,$00 
    dw $005F,$0000 
    dw InitAI_Holtz 
    dw $0002,$0000 
    dw MainAI_Holtz 
    dw CommonA2_GrappleAI_CancelGrappleBeam 
    dw RTL_A2804C 
    dw CommonA2_NormalEnemyFrozenAI 
    dw $0000 
    dw $0002 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw CommonA2_NormalEnemyTouchAI 
    dw CommonA2_NormalEnemyShotAI 
    dw $0000 
    dl Tiles_Holtz 
    db $05 
    dw EnemyDropChances_Holtz 
    dw EnemyVulnerabilities_Holtz 
    dw EnemyName_Holtz 

EnemyHeaders_Oum:
    dw $0800 
    dw Palette_Oum 
    dw $012C,$0064,$0010,$0010 
    db $A2,$00 
    dw $0000,$0000 
    dw InitAI_Oum 
    dw $0001,$0000 
    dw MainAI_Oum 
    dw CommonA2_GrappleAI_CancelGrappleBeam 
    dw RTL_A2804C 
    dw CommonA2_NormalEnemyFrozenAI 
    dw $0000 
    dw $0002 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw EnemyTouch_Oum_DoesNotHurtSamus 
    dw EnemyShot_Oum 
    dw $0000 
    dl Tiles_Oum 
    db $05 
    dw EnemyDropChances_Oum 
    dw EnemyVulnerabilities_Indestructible 
    dw EnemyName_Oum 

EnemyHeaders_Choot:
    dw $0400 
    dw Palette_Choot 
    dw $0064,$0050,$0010,$0005 
    db $A2,$00 
    dw $0022,$0000 
    dw InitAI_Choot 
    dw $0001,$0000 
    dw MainAI_Choot 
    dw CommonA2_GrappleAI_KillEnemy 
    dw RTL_A2804C 
    dw CommonA2_NormalEnemyFrozenAI 
    dw $0000 
    dw $0002 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw CommonA2_NormalEnemyTouchAI 
    dw CommonA2_NormalEnemyShotAI 
    dw $0000 
    dl Tiles_Choot 
    db $05 
    dw EnemyDropChances_Choot 
    dw EnemyVulnerabilities_Default 
    dw EnemyName_Choot 

EnemyHeaders_GRipper:
    dw $0400 
    dw Palette_GRipper 
    dw $00C8,$000A,$0008,$0008 
    db $A2,$00 
    dw $003E,$0000 
    dw InitAI_GRipper 
    dw $0001,$0000 
    dw MainAI_GRipper 
    dw CommonA2_GrappleAI_SamusLatchesOn 
    dw RTL_A2804C 
    dw CommonA2_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw CommonA2_NormalEnemyTouchAI 
    dw EnemyShot_GRipper_Ripper2 
    dw $0000 
    dl Tiles_Ripper 
    db $05 
    dw EnemyDropChances_GRipper_Ripper2 
    dw EnemyVulnerabilities_GRipper 
    dw EnemyName_GRipper_Ripper2 

EnemyHeaders_Ripper2:
    dw $0400 
    dw Palette_Ripper2 
    dw $00C8,$000A,$0008,$0004 
    db $A2,$00 
    dw $003E,$0000 
    dw InitAI_Ripper2 
    dw $0001,$0000 
    dw MainAI_Ripper2 
    dw CommonA2_GrappleAI_CancelGrappleBeam 
    dw RTL_A2804C 
    dw CommonA2_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw $0000 
    dw InstList_Ripper_MovingRight 
    dd $00000000 
    dw CommonA2_NormalEnemyTouchAI 
    dw EnemyShot_GRipper_Ripper2 
    dw $0000 
    dl Tiles_Ripper 
    db $05 
    dw EnemyDropChances_GRipper_Ripper2 
    dw EnemyVulnerabilities_Squeept_Ripper2_Ripper_Tripper 
    dw EnemyName_GRipper_Ripper2 

EnemyHeaders_Ripper:
    dw $0400 
    dw Palette_Ripper 
    dw $00C8,$0005,$0008,$0004 
    db $A2,$00 
    dw $003E,$0000 
    dw InitAI_Ripper 
    dw $0001,$0000 
    dw MainAI_Ripper 
    dw CommonA2_GrappleAI_CancelGrappleBeam 
    dw RTL_A2804C 
    dw CommonA2_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw $0000 
    dw InstList_Ripper_MovingRight 
    dd $00000000 
    dw CommonA2_NormalEnemyTouchAI 
    dw CommonA2_NormalEnemyShotAI 
    dw SpritemapPointers_Ripper 
    dl Tiles_Ripper 
    db $05 
    dw EnemyDropChances_Ripper 
    dw EnemyVulnerabilities_Squeept_Ripper2_Ripper_Tripper 
    dw EnemyName_Ripper 

EnemyHeaders_Dragon:
    dw $0600 
    dw Palette_Dragon 
    dw $012C,$0018,$0008,$001C 
    db $A2,$00 
    dw $0036,$0000 
    dw InitAI_Dragon 
    dw $0002,$0000 
    dw MainAI_Dragon 
    dw CommonA2_GrappleAI_CancelGrappleBeam 
    dw RTL_A2804C 
    dw CommonA2_NormalEnemyFrozenAI 
    dw $0000 
    dw $0004 
    dd $00000000 
    dw PowerBombReaction_Dragon 
    dw $0000 
    dd $00000000 
    dw EnemyTouch_Dragon 
    dw EnemyShot_Dragon 
    dw $0000 
    dl Tiles_Dragon 
    db $05 
    dw EnemyDropChances_Dragon 
    dw EnemyVulnerabilities_Dragon 
    dw EnemyName_Dragon 

EnemyHeaders_ShutterGrowing:
    dw $0400 
    dw Palette_Shutters 
    dw $0014,$0028,$0008,$0008 
    db $A2,$00 
    dw $0000,$0000 
    dw InitAI_ShutterGrowing 
    dw $0001,$0000 
    dw MainAI_ShutterGrowing 
    dw CommonA2_GrappleAI_CancelGrappleBeam 
    dw RTL_A2804C 
    dw CommonA2_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw RTL_A0804C 
    dw $0000 
    dd $00000000 
    dw RTL_A2804C 
    dw CommonA2_NormalEnemyShotAI 
    dw $0000 
    dl Tiles_Shutter 
    db $05 
    dw EnemyDropChances_Shutter_Kamer_BabyMetroidCutscene 
    dw EnemyVulnerabilities_NonDestructibleShutter 
    dw EnemyName_ShutterGrowing 

EnemyHeaders_ShutterShootable:
    dw $0400 
    dw Palette_Shutters 
    dw $0014,$0028,$0008,$0020 
    db $A2,$00 
    dw $0000,$0000 
    dw InitAI_ShutterShootable_ShutterDestroyable 
    dw $0001,$0000 
    dw MainAI_ShutterShootable_ShutterDestroyable_Kamer 
    dw CommonA2_GrappleAI_CancelGrappleBeam 
    dw RTL_A2804C 
    dw CommonA2_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw PowerBombReaction_ShutterShootable_ShutterDestroyable_Kamer 
    dw $0000 
    dd $00000000 
    dw EnemyTouch_ShutterShootable_ShutterDestroyable_Kamer 
    dw EnemyShot_ShutterShootable_Kamer 
    dw $0000 
    dl Tiles_Shutter 
    db $05 
    dw EnemyDropChances_Shutter_Kamer_BabyMetroidCutscene 
    dw EnemyVulnerabilities_NonDestructibleShutter 
    dw EnemyName_Shutter2_Kamer 

EnemyHeaders_ShutterHorizShootable:
    dw $0400 
    dw Palette_Shutters 
    dw $0014,$0028,$0020,$0008 
    db $A2,$00 
    dw $0000,$0000 
    dw InitAI_ShutterHorizShootable 
    dw $0001,$0000 
    dw MainAI_ShutterHorizShootable 
    dw CommonA2_GrappleAI_CancelGrappleBeam 
    dw RTL_A2804C 
    dw CommonA2_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw PowerBombReaction_CommonReaction_HorizontalShutter 
    dw $0000 
    dd $00000000 
    dw EnemyTouch_HorizShootableShutter 
    dw EnemyShot_ShutterHorizShootable 
    dw $0000 
    dl Tiles_Shutter 
    db $05 
    dw EnemyDropChances_Shutter_Kamer_BabyMetroidCutscene 
    dw EnemyVulnerabilities_NonDestructibleShutter 
    dw EnemyName_Shutter2_Kamer 

EnemyHeaders_ShutterDestroyable:
    dw $0400 
    dw Palette_Shutters 
    dw $0014,$0028,$0008,$0020 
    db $A2,$00 
    dw $0000,$0000 
    dw InitAI_ShutterShootable_ShutterDestroyable 
    dw $0001,$0000 
    dw MainAI_ShutterShootable_ShutterDestroyable_Kamer 
    dw CommonA2_GrappleAI_CancelGrappleBeam 
    dw RTL_A2804C 
    dw CommonA2_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw PowerBombReaction_ShutterShootable_ShutterDestroyable_Kamer 
    dw $0000 
    dd $00000000 
    dw EnemyTouch_ShutterShootable_ShutterDestroyable_Kamer 
    dw EnemyTouch_ShutterDestroyable 
    dw $0000 
    dl Tiles_Shutter 
    db $05 
    dw EnemyDropChances_Shutter_Kamer_BabyMetroidCutscene 
    dw EnemyVulnerabilities_ShutterDestroyable 
    dw EnemyName_Shutter2_Kamer 

EnemyHeaders_Kamer:
    dw $0400 
    dw Palette_Kamer 
    dw $0014,$0028,$0010,$0008 
    db $A2,$00 
    dw $0000,$0000 
    dw InitAI_Kamer 
    dw $0001,$0000 
    dw MainAI_ShutterShootable_ShutterDestroyable_Kamer 
    dw CommonA2_GrappleAI_CancelGrappleBeam 
    dw RTL_A2804C 
    dw CommonA2_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw PowerBombReaction_ShutterShootable_ShutterDestroyable_Kamer 
    dw $0000 
    dd $00000000 
    dw EnemyTouch_ShutterShootable_ShutterDestroyable_Kamer 
    dw EnemyShot_ShutterShootable_Kamer 
    dw $0000 
    dl Tiles_Kamer 
    db $05 
    dw EnemyDropChances_Shutter_Kamer_BabyMetroidCutscene 
    dw EnemyVulnerabilities_NonDestructibleShutter 
    dw EnemyName_Shutter2_Kamer 

EnemyHeaders_Waver:
    dw $0600 
    dw Palette_Waver 
    dw $001E,$000A,$0008,$0008 
    db $A3,$00 
    dw $0047,$0000 
    dw InitAI_Waver 
    dw $0001,$0000 
    dw MainAI_Waver 
    dw CommonA3_GrappleAI_KillEnemy 
    dw RTL_A3804C 
    dw CommonA3_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw CommonA3_NormalEnemyTouchAI 
    dw CommonA3_NormalEnemyShotAI 
    dw $0000 
    dl Tiles_Waver 
    db $05 
    dw EnemyDropChances_Waver 
    dw EnemyVulnerabilities_Default 
    dw EnemyName_Waver 

EnemyHeaders_Metaree:
    dw $0600 
    dw Palette_Metaree 
    dw $0032,$0032,$0008,$000C 
    db $A3,$00 
    dw $0021,$0000 
    dw InitAI_Metaree 
    dw $0001,$0000 
    dw MainAI_Metaree 
    dw CommonA3_GrappleAI_CancelGrappleBeam 
    dw RTL_A3804C 
    dw CommonA3_NormalEnemyFrozenAI 
    dw $0000 
    dw $0002 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw CommonA3_NormalEnemyTouchAI 
    dw EnemyShot_Metaree 
    dw $0000 
    dl Tiles_Metaree 
    db $05 
    dw EnemyDropChances_Metaree 
    dw EnemyVulnerabilities_Metaree 
    dw EnemyName_Metaree 

EnemyHeaders_Fireflea:
    dw $0600 
    dw Palette_Fireflea 
    dw $0014,$0004,$0008,$0008 
    db $A3,$00 
    dw $0020,$0000 
    dw InitAI_Fireflea 
    dw $0001,$0000 
    dw MainAI_Fireflea 
    dw CommonA3_GrappleAI_CancelGrappleBeam 
    dw RTL_A3804C 
    dw CommonA3_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw PowerBombReaction_Fireflea 
    dw $0000 
    dd $00000000 
    dw EnemyTouch_Fireflea 
    dw EnemyShot_Fireflea 
    dw $0000 
    dl Tiles_Fireflea 
    db $05 
    dw EnemyDropChances_Fireflea 
    dw EnemyVulnerabilities_Default 
    dw EnemyName_Fireflea 

EnemyHeaders_Skultera:
    dw $0600 
    dw Palette_Skultera 
    dw $012C,$0050,$000D,$000B 
    db $A3,$00 
    dw $0049,$0000 
    dw InitAI_Skultera 
    dw $0001,$0000 
    dw MainAI_Skultera 
    dw CommonA3_GrappleAI_NoInteraction 
    dw RTL_A3804C 
    dw CommonA3_NormalEnemyFrozenAI 
    dw $0000 
    dw $0002 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw CommonA3_NormalEnemyTouchAI 
    dw CommonA3_NormalEnemyShotAI 
    dw UNUSED_SpritemapPointers_Skultera 
    dl Tiles_Skultera 
    db $05 
    dw EnemyDropChances_Skultera 
    dw EnemyVulnerabilities_Default 
    dw EnemyName_Skultera 

EnemyHeaders_Elevator:
    dw $0000 
    dw $0000 
    dw $0028,$000F,$0010,$0008 
    db $A3,$00 
    dw $0059,$0000 
    dw InitAI_Elevator 
    dw $0001,$0000 
    dw MainAI_GrappleAI_FrozenAI_Elevator 
    dw MainAI_GrappleAI_FrozenAI_Elevator 
    dw RTL_A3804C 
    dw MainAI_GrappleAI_FrozenAI_Elevator 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw RTL_A0804C 
    dw $0000 
    dd $00000000 
    dw RTL_A3804C 
    dw RTL_A3804C 
    dw $0000 
    dl $000000 
    db $05 
    dw $0000 
    dw $0000 
    dw $0000 

EnemyHeaders_Sciser:
    dw $0400 
    dw Palette_Sciser 
    dw $00C8,$0078,$0008,$0008 
    db $A3,$00 
    dw $0049,$0000 
    dw InitAI_Sciser 
    dw $0001,$0000 
    dw MainAI_Crawlers 
    dw CommonA3_GrappleAI_KillEnemy 
    dw RTL_A3804C 
    dw CommonA3_NormalEnemyFrozenAI 
    dw $0000 
    dw $0002 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw CommonA3_NormalEnemyTouchAI 
    dw CommonA3_NormalEnemyShotAI 
    dw $0000 
    dl Tiles_Sciser 
    db $05 
    dw EnemyDropChances_Sciser 
    dw EnemyVulnerabilities_Sciser_Zero 
    dw EnemyName_Sciser 

EnemyHeaders_Zero:
    dw $0400 
    dw Palette_Zero 
    dw $0032,$0028,$0008,$0008 
    db $A3,$00 
    dw $0023,$0000 
    dw InitAI_Zero 
    dw $0001,$0000 
    dw MainAI_Crawlers 
    dw CommonA3_GrappleAI_KillEnemy 
    dw RTL_A3804C 
    dw CommonA3_NormalEnemyFrozenAI 
    dw $0000 
    dw $0002 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw CommonA3_NormalEnemyTouchAI 
    dw CommonA3_NormalEnemyShotAI 
    dw $0000 
    dl Tiles_Zero 
    db $05 
    dw EnemyDropChances_Zero 
    dw EnemyVulnerabilities_Sciser_Zero 
    dw EnemyName_Zero 

EnemyHeaders_Tripper:
    dw $0400 
    dw Palette_Tripper 
    dw $0014,$0028,$0010,$0008 
    db $A3,$00 
    dw $003E,$0000 
    dw InitAI_Tripper 
    dw $0001,$0000 
    dw MainAI_Tripper_Kamer2 
    dw CommonA3_GrappleAI_CancelGrappleBeam 
    dw RTL_A3804C 
    dw CommonA3_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw RTL_A39F07 
    dw EnemyShot_Tripper 
    dw $0000 
    dl Tiles_Tripper 
    db $05 
    dw EnemyDropChances_Tripper_Kamer2 
    dw EnemyVulnerabilities_Squeept_Ripper2_Ripper_Tripper 
    dw EnemyName_Tripper 

EnemyHeaders_Kamer2:
    dw $0400 
    dw Palette_Kamer2 
    dw $0014,$0028,$0010,$0008 
    db $A3,$00 
    dw $003E,$0000 
    dw InitAI_Kamer2 
    dw $0001,$0000 
    dw MainAI_Tripper_Kamer2 
    dw CommonA3_GrappleAI_CancelGrappleBeam 
    dw RTL_A3804C 
    dw CommonA3_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw RTL_A39F07 
    dw CommonA3_NormalEnemyShotAI 
    dw $0000 
    dl Tiles_Kamer 
    db $05 
    dw EnemyDropChances_Tripper_Kamer2 
    dw EnemyVulnerabilities_Indestructible 
    dw EnemyName_Tripper 

EnemyHeaders_Sbug:
    dw $0200 
    dw Palette_Sbug 
    dw $0014,$0028,$0004,$0004 
    db $A3,$00 
    dw $0000,$0000 
    dw InitAI_Sbug 
    dw $0001,$0000 
    dw MainAI_Sbug 
    dw CommonA3_GrappleAI_CancelGrappleBeam 
    dw RTL_A3804C 
    dw CommonA3_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw CommonA3_NormalEnemyTouchAI 
    dw CommonA3_NormalEnemyShotAI 
    dw $0000 
    dl Tiles_Sbug 
    db $05 
    dw EnemyDropChances_Sbug_Sbug2 
    dw EnemyVulnerabilities_Indestructible 
    dw EnemyName_Sbug 

EnemyHeaders_Sbug2:
    dw $8200 
    dw Palette_Sbug 
    dw $0014,$0028,$0004,$0004 
    db $A3,$00 
    dw $0000,$0000 
    dw InitAI_Sbug 
    dw $0001,$0000 
    dw MainAI_Sbug 
    dw CommonA3_GrappleAI_CancelGrappleBeam 
    dw RTL_A3804C 
    dw CommonA3_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw CommonA3_NormalEnemyTouchAI 
    dw CommonA3_NormalEnemyShotAI 
    dw $0000 
    dl Tiles_Sbug 
    db $05 
    dw EnemyDropChances_Sbug_Sbug2 
    dw EnemyVulnerabilities_Indestructible 
    dw EnemyName_Sbug 

EnemyHeaders_Mochtroid:
    dw $0400 
    dw Palette_Mochtroid 
    dw $0064,$005A,$000A,$000C 
    db $A3,$00 
    dw $0058,$0000 
    dw InitAI_Mochtroid 
    dw $0001,$0000 
    dw MainAI_Mochtroid 
    dw CommonA3_GrappleAI_KillEnemy 
    dw RTL_A3804C 
    dw CommonA3_NormalEnemyFrozenAI 
    dw $0000 
    dw $0002 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw EnemyTouch_Mochtroid 
    dw EnemyShot_Mochtroid 
    dw $0000 
    dl Tiles_Mochtroid 
    db $05 
    dw EnemyDropChances_Mochtroid 
    dw EnemyVulnerabilities_Default 
    dw EnemyName_Mochtroid 

EnemyHeaders_Sidehopper:
    dw $0400 
    dw Palette_Sidehopper 
    dw $003C,$0014,$0010,$000D 
    db $A3,$00 
    dw $0023,$0000 
    dw InitAI_Hopper 
    dw $0001,$0000 
    dw MainAI_Hopper 
    dw CommonA3_GrappleAI_CancelGrappleBeam 
    dw RTL_A3804C 
    dw CommonA3_NormalEnemyFrozenAI 
    dw $0000 
    dw $0002 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw CommonA3_NormalEnemyTouchAI 
    dw CommonA3_NormalEnemyShotAI 
    dw $0000 
    dl Tiles_Sidehopper 
    db $05 
    dw EnemyDropChances_Sidehopper 
    dw EnemyVulnerabilities_Default 
    dw EnemyName_Sidehopper 

EnemyHeaders_Desgeega:
    dw $0400 
    dw Palette_Desgeega 
    dw $0078,$0050,$0010,$000D 
    db $A3,$00 
    dw $005F,$0000 
    dw InitAI_Hopper 
    dw $0001,$0000 
    dw MainAI_Hopper 
    dw CommonA3_GrappleAI_CancelGrappleBeam 
    dw RTL_A3804C 
    dw CommonA3_NormalEnemyFrozenAI 
    dw $0000 
    dw $0002 
    dd $00000000 
    dw $0000,$0003 
    dd $00000000 
    dw CommonA3_NormalEnemyTouchAI 
    dw CommonA3_NormalEnemyShotAI 
    dw $0000 
    dl Tiles_Desgeega 
    db $05 
    dw EnemyDropChances_Desgeega 
    dw EnemyVulnerabilities_Default 
    dw EnemyName_Desgeega 

EnemyHeaders_SidehopperLarge:
    dw $0600 
    dw Palette_SidehopperLarge 
    dw $0140,$0050,$0018,$0014 
    db $A3,$00 
    dw $0023,$0000 
    dw InitAI_Hopper 
    dw $0001,$0000 
    dw MainAI_Hopper 
    dw CommonA3_GrappleAI_CancelGrappleBeam 
    dw RTL_A3804C 
    dw CommonA3_NormalEnemyFrozenAI 
    dw $0000 
    dw $0004 
    dd $00000000 
    dw $0000,$0001 
    dd $00000000 
    dw CommonA3_NormalEnemyTouchAI 
    dw CommonA3_NormalEnemyShotAI 
    dw $0000 
    dl Tiles_SidehopperLarge 
    db $05 
    dw EnemyDropChances_SidehopperLarge_SidehopperTourian 
    dw EnemyVulnerabilities_Default 
    dw EnemyName_SidehopperLarge_SidehopperTourian 

EnemyHeaders_SidehopperTourian:
    dw $0600 
    dw Palette_SidehopperTourian 
    dw $05DC,$0078,$0018,$0014 
    db $A3,$00 
    dw $0023,$0000 
    dw InitAI_Hopper 
    dw $0001,$0000 
    dw MainAI_Hopper 
    dw CommonA3_GrappleAI_CancelGrappleBeam 
    dw RTL_A3804C 
    dw CommonA3_NormalEnemyFrozenAI 
    dw $0000 
    dw $0004 
    dd $00000000 
    dw $0000,$0001 
    dd $00000000 
    dw CommonA3_NormalEnemyTouchAI 
    dw CommonA3_NormalEnemyShotAI 
    dw $0000 
    dl Tiles_SidehopperLarge 
    db $05 
    dw EnemyDropChances_SidehopperLarge_SidehopperTourian 
    dw EnemyVulnerabilities_SidehopperTourian 
    dw EnemyName_SidehopperLarge_SidehopperTourian 

EnemyHeaders_DesgeegaLarge:
    dw $0400 
    dw Palette_DesgeegaLarge 
    dw $0320,$00A0,$0018,$0014 
    db $A3,$00 
    dw $0030,$0000 
    dw InitAI_Hopper 
    dw $0001,$0000 
    dw MainAI_Hopper 
    dw CommonA3_GrappleAI_CancelGrappleBeam 
    dw RTL_A3804C 
    dw CommonA3_NormalEnemyFrozenAI 
    dw $0000 
    dw $0004 
    dd $00000000 
    dw $0000,$0002 
    dd $00000000 
    dw CommonA3_NormalEnemyTouchAI 
    dw CommonA3_NormalEnemyShotAI 
    dw $0000 
    dl Tiles_DesgeegaLarge 
    db $05 
    dw EnemyDropChances_DesgeegaLarge 
    dw EnemyVulnerabilities_DesgeegaLarge 
    dw EnemyName_DesgeegaLarge 

EnemyHeaders_Zoa:
    dw $0400 
    dw Palette_Zoa 
    dw $0028,$000F,$0008,$0008 
    db $A3,$00 
    dw $0049,$0000 
    dw InitAI_Zoa 
    dw $0001,$0000 
    dw MainAI_Zoa 
    dw CommonA3_GrappleAI_KillEnemy 
    dw RTL_A3804C 
    dw CommonA3_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw CommonA3_NormalEnemyTouchAI 
    dw CommonA3_NormalEnemyShotAI 
    dw $0000 
    dl Tiles_Zoa 
    db $05 
    dw EnemyDropChances_Zoa 
    dw EnemyVulnerabilities_Default 
    dw EnemyName_Zoa 

EnemyHeaders_Viola:
    dw $0400 
    dw Palette_Viola 
    dw $001E,$000F,$0008,$0008 
    db $A3,$00 
    dw $005F,$0000 
    dw InitAI_Viola 
    dw $0001,$0000 
    dw MainAI_Crawlers 
    dw CommonA3_GrappleAI_KillEnemy 
    dw RTL_A3804C 
    dw CommonA3_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw $0000 
    dw InstList_Viola_UpsideDown 
    dd $00000000 
    dw CommonA3_NormalEnemyTouchAI 
    dw CommonA3_NormalEnemyShotAI 
    dw $0000 
    dl Tiles_Viola 
    db $05 
    dw EnemyDropChances_Viola 
    dw EnemyVulnerabilities_Viola_Yard_HZoomer_Zeela_Sova_Zoomer 
    dw EnemyName_Viola 

EnemyHeaders_Respawn:
    dw $0000 
    dw NOPNOP_A38069 
    dw $0000,$0000,$0008,$0008 
    db $A3,$00 
    dw $0059,$0000 
    dw RTL_A3804C 
    dw $0001,$0000 
    dw RTL_A3804C 
    dw CommonA3_GrappleAI_CancelGrappleBeam 
    dw RTL_A3804C 
    dw RTL_A3804C 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw RTL_A3804C 
    dw RTL_A3804C 
    dw $0000 
    dl Tiles_Metroid 
    db $00 
    dw $0000 
    dw $0000 
    dw $0000 

EnemyHeaders_Bang:
    dw $1000 
    dw Palette_Bang 
    dw $000A,$0004,$0010,$0010 
    db $A3,$00 
    dw $0056,$0000 
    dw InitAI_Bang 
    dw $0003,$0000 
    dw MainAI_Bang 
    dw CommonA3_GrappleAI_CancelGrappleBeam 
    dw RTL_A3804C 
    dw CommonA3_NormalEnemyFrozenAI 
    dw $0000 
    dw $0004 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw CommonA3_NormalEnemyTouchAI 
    dw EnemyShot_Bang 
    dw $0000 
    dl Tiles_Bang 
    db $05 
    dw EnemyDropChances_Bang 
    dw EnemyVulnerabilities_Bang 
    dw EnemyName_Bang 

EnemyHeaders_Skree:
    dw $0400 
    dw Palette_Skree 
    dw $000F,$000A,$0008,$000C 
    db $A3,$00 
    dw $0021,$0000 
    dw InitAI_Skree 
    dw $0001,$0000 
    dw MainAI_Skree 
    dw CommonA3_GrappleAI_KillEnemy 
    dw RTL_A3804C 
    dw CommonA3_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw CommonA3_NormalEnemyTouchAI 
    dw EnemyShot_Skree 
    dw $0000 
    dl Tiles_Skree 
    db $05 
    dw EnemyDropChances_Skree 
    dw EnemyVulnerabilities_Default 
    dw EnemyName_Skree 

EnemyHeaders_Yard:
    dw $0800 
    dw Palette_Yard 
    dw $000A,$0064,$0008,$0008 
    db $A3,$00 
    dw $003E,$0000 
    dw InitAI_Yard 
    dw $0001,$0000 
    dw MainAI_Yard 
    dw CommonA3_GrappleAI_CancelGrappleBeam 
    dw RTL_A3804C 
    dw CommonA3_NormalEnemyFrozenAI 
    dw $0000 
    dw $0002 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw EnemyTouch_Yard 
    dw EnemyShot_Yard 
    dw $0000 
    dl Tiles_Yard 
    db $05 
    dw EnemyDropChances_Yard 
    dw EnemyVulnerabilities_Viola_Yard_HZoomer_Zeela_Sova_Zoomer 
    dw EnemyName_Yard 

EnemyHeaders_Reflec:
    dw $0600 
    dw Palette_Reflec 
    dw $00C8,$001E,$0010,$0010 
    db $A3,$00 
    dw $0057,$0000 
    dw InitAI_Reflec 
    dw $0001,$0000 
    dw RTL_A3DC1B 
    dw CommonA3_GrappleAI_CancelGrappleBeam 
    dw RTL_A3804C 
    dw CommonA3_NormalEnemyFrozenAI 
    dw $0000 
    dw $0002 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw RTL_A3804C 
    dw EnemyShot_Reflec 
    dw $0000 
    dl Tiles_Reflec 
    db $05 
    dw EnemyDropChances_Reflec 
    dw EnemyVulnerabilities_Indestructible 
    dw EnemyName_Reflec 

EnemyHeaders_HZoomer:
    dw $0600 
    dw Palette_HZoomer 
    dw $000F,$0005,$0008,$0008 
    db $A3,$00 
    dw $0023,$0000 
    dw InitAI_HZoomer 
    dw $0001,$0000 
    dw MainAI_HZoomer 
    dw CommonA3_GrappleAI_KillEnemy 
    dw RTL_A3804C 
    dw CommonA3_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw CommonA3_NormalEnemyTouchAI 
    dw CommonA3_NormalEnemyShotAI 
    dw $0000 
    dl Tiles_Zoomer 
    db $05 
    dw EnemyDropChances_HZoomer 
    dw EnemyVulnerabilities_Viola_Yard_HZoomer_Zeela_Sova_Zoomer 
    dw EnemyName_HZoomer 

EnemyHeaders_Zeela:
    dw $0600 
    dw Palette_Zeela 
    dw $001E,$000A,$0008,$0008 
    db $A3,$00 
    dw $0023,$0000 
    dw InitAI_Zeela 
    dw $0001,$0000 
    dw MainAI_Crawlers 
    dw CommonA3_GrappleAI_KillEnemy 
    dw RTL_A3804C 
    dw CommonA3_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw CommonA3_NormalEnemyTouchAI 
    dw CommonA3_NormalEnemyShotAI 
    dw $0000 
    dl Tiles_Zeela 
    db $05 
    dw EnemyDropChances_Zeela 
    dw EnemyVulnerabilities_Viola_Yard_HZoomer_Zeela_Sova_Zoomer 
    dw EnemyName_Zeela 

EnemyHeaders_Sova:
    dw $0600 
    dw Palette_Sova 
    dw $0028,$0014,$0008,$0008 
    db $A3,$00 
    dw $0023,$0000 
    dw InitAI_Sova 
    dw $0001,$0000 
    dw MainAI_Crawlers 
    dw CommonA3_GrappleAI_KillEnemy 
    dw RTL_A3804C 
    dw CommonA3_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw CommonA3_NormalEnemyTouchAI 
    dw CommonA3_NormalEnemyShotAI 
    dw $0000 
    dl Tiles_Sova 
    db $05 
    dw EnemyDropChances_Sova 
    dw EnemyVulnerabilities_Viola_Yard_HZoomer_Zeela_Sova_Zoomer 
    dw EnemyName_Sova 

EnemyHeaders_Zoomer:
    dw $0600 
    dw Palette_Zoomer 
    dw $000F,$0005,$0008,$0008 
    db $A3,$00 
    dw $0023,$0000 
    dw InitAI_Zoomer_MZoomer 
    dw $0001,$0001 
    dw MainAI_Crawlers 
    dw CommonA3_GrappleAI_KillEnemy 
    dw RTL_A3804C 
    dw CommonA3_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw CommonA3_NormalEnemyTouchAI 
    dw CommonA3_NormalEnemyShotAI 
    dw $0000 
    dl Tiles_Zoomer 
    db $05 
    dw EnemyDropChances_Zoomer 
    dw EnemyVulnerabilities_Viola_Yard_HZoomer_Zeela_Sova_Zoomer 
    dw EnemyName_Zoomer 

EnemyHeaders_MZoomer:
    dw $0600 
    dw Palette_MZoomer 
    dw $000F,$0005,$0008,$0008 
    db $A3,$00 
    dw $0023,$0000 
    dw InitAI_Zoomer_MZoomer 
    dw $0001,$0001 
    dw MainAI_Crawlers 
    dw CommonA3_GrappleAI_KillEnemy 
    dw RTL_A3804C 
    dw CommonA3_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw CommonA3_NormalEnemyTouchAI 
    dw CommonA3_NormalEnemyShotAI 
    dw $0000 
    dl Tiles_Zoomer 
    db $05 
    dw EnemyDropChances_MZoomer 
    dw EnemyVulnerabilities_MZoomer 
    dw EnemyName_MZoomer 

EnemyHeaders_Metroid:
    dw $1000 
    dw Palette_Metroid 
    dw $01F4,$0078,$000A,$000A 
    db $A3,$00 
    dw $005A,$0000 
    dw InitAI_Metroid 
    dw $0001,$0000 
    dw MainAI_Metroid 
    dw CommonA3_GrappleAI_CancelGrappleBeam 
    dw HurtAI_Metroid 
    dw FrozenAI_Metroid 
    dw $0000 
    dw $0004 
    dd $00000000 
    dw PowerBombReaction_Metroid 
    dw $0000 
    dd $00000000 
    dw EnemyTouch_Metroid 
    dw EnemyShot_Metroid 
    dw $0000 
    dl Tiles_Metroid 
    db $05 
    dw EnemyDropChances_Metroid 
    dw EnemyVulnerabilities_Metroid 
    dw EnemyName_Metroid 

EnemyHeaders_Crocomire:
    dw $A600 
    dw Palette_Crocomire 
    dw $7FFF,$0028,$0030,$0038 
    db $A4,$00 
    dw $0005,$0006 
    dw InitAI_Crocomire 
    dw $0001,$0000 
    dw MainAI_Crocomire 
    dw CommonA4_GrappleAI_SamusLatchesOn 
    dw HurtAI_Crocomire 
    dw CommonA4_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw PowerBombReaction_Crocomire 
    dw $0000 
    dd $00000000 
    dw RTL_A4B950 
    dw $0000 
    dw $0000 
    dl Tiles_Crocomire 
    db $05 
    dw EnemyDropChances_Crocomire 
    dw EnemyVulnerabilities_Crocomire_CrocomireTongue 
    dw $0000 

EnemyHeaders_CrocomireTongue:
    dw $2000 
    dw Palette_Crocomire 
    dw $7FFF,$0028,$0008,$0008 
    db $A4,$00 
    dw $0000,$0006 
    dw InitAI_CrocomireTongue 
    dw $0001,$0000 
    dw MainAI_CrocomireTongue 
    dw CommonA4_GrappleAI_SamusLatchesOn 
    dw RTL_A4804C 
    dw CommonA4_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw CommonA4_NormalEnemyTouchAI 
    dw CommonA4_NormalEnemyShotAI 
    dw $0000 
    dl Tiles_Crocomire 
    db $05 
    dw EnemyDropChances_CrocomireTongue 
    dw EnemyVulnerabilities_Crocomire_CrocomireTongue 
    dw $0000 

EnemyHeaders_DraygonBody:
    dw $2000 
    dw Palette_Draygon_Sprite7 
    dw $1770,$00A0,$0040,$0040 
    db $A5,$04 
    dw $0000,$0008 
    dw InitAI_DraygonBody 
    dw $0001,$0000 
    dw MainAI_DraygonBody 
    dw CommonA5_GrappleAI_NoInteraction 
    dw HurtAI_Draygon 
    dw CommonA5_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw PowerBombReaction_Draygon 
    dw $0000 
    dd $00000000 
    dw EnemyTouch_Draygon 
    dw EnemyShot_Draygon 
    dw $0000 
    dl Tiles_Draygon 
    db $05 
    dw EnemyDropChances_DraygonBody_DraygonTail_DraygonArms 
    dw EnemyVulnerabilities_Draygon_Body_Eye_Tail_Arms 
    dw $0000 

EnemyHeaders_DraygonEye:
    dw $1800 
    dw NOPNOP_A58069 
    dw $1770,$00A0,$0002,$0002 
    db $A5,$00 
    dw $0000,$0000 
    dw InitAI_DraygonEye 
    dw $0001,$0000 
    dw MainAI_DraygonEye 
    dw CommonA5_GrappleAI_CancelGrappleBeam 
    dw RTL_A5804C 
    dw CommonA5_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw RTL_A0804C 
    dw $0000 
    dd $00000000 
    dw RTL_A5804C 
    dw RTL_A5804C 
    dw $0000 
    dl Tiles_Draygon 
    db $05 
    dw EnemyDropChances_DraygonEye 
    dw EnemyVulnerabilities_Draygon_Body_Eye_Tail_Arms 
    dw $0000 

EnemyHeaders_DraygonTail:
    dw $1800 
    dw Palette_Draygon_Sprite7 
    dw $1770,$00A0,$0010,$0020 
    db $A5,$00 
    dw $0000,$0000 
    dw InitAI_DraygonTail 
    dw $0001,$0000 
    dw RTL_A5C5AA 
    dw CommonA5_GrappleAI_CancelGrappleBeam 
    dw RTL_A5804C 
    dw CommonA5_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw RTL_A0804C 
    dw $0000 
    dd $00000000 
    dw CommonA5_NormalEnemyTouchAI 
    dw CommonA5_NormalEnemyShotAI 
    dw $0000 
    dl Tiles_Draygon 
    db $05 
    dw EnemyDropChances_DraygonBody_DraygonTail_DraygonArms 
    dw EnemyVulnerabilities_Draygon_Body_Eye_Tail_Arms 
    dw $0000 

EnemyHeaders_DraygonArms:
    dw $1800 
    dw Palette_Draygon_Sprite7 
    dw $1770,$00A0,$0018,$0018 
    db $A5,$00 
    dw $0000,$0000 
    dw InitAI_DraygonArms 
    dw $0001,$0000 
    dw RTL_A5C5C4 
    dw CommonA5_GrappleAI_CancelGrappleBeam 
    dw RTL_A5804C 
    dw CommonA5_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw RTL_A0804C 
    dw $0000 
    dd $00000000 
    dw RTL_A5804C 
    dw RTL_A5804C 
    dw $0000 
    dl Tiles_Draygon 
    db $05 
    dw EnemyDropChances_DraygonBody_DraygonTail_DraygonArms 
    dw EnemyVulnerabilities_Draygon_Body_Eye_Tail_Arms 
    dw $0000 

EnemyHeaders_SporeSpawn:
    dw $0E00 
    dw Palette_SporeSpawn 
    dw $03C0,$000C,$0030,$0020 
    db $A5,$04 
    dw $002C,$0004 
    dw InitAI_SporeSpawn 
    dw $0001,$0000 
    dw MainAI_SporeSpawn 
    dw CommonA5_GrappleAI_CancelGrappleBeam 
    dw RTL_A5804C 
    dw CommonA5_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw PowerBombReaction_SporeSpawn 
    dw $0000 
    dd $00000000 
    dw EnemyTouch_SporeSpawn 
    dw EnemyShot_SporeSpawn_Vulnerable 
    dw $0000 
    dl Tiles_SporeSpawn 
    db $02 
    dw EnemyDropChances_SporeSpawn 
    dw EnemyVulnerabilities_SporeSpawn 
    dw $0000 

EnemyHeaders_SporeSpawnStalk:
    dw $0E00 
    dw Palette_SporeSpawn 
    dw $03C0,$000C,$0013,$0013 
    db $A5,$08 
    dw $0000,$0004 
    dw InitAI_SporeSpawn 
    dw $0001,$0000 
    dw MainAI_SporeSpawn 
    dw CommonA5_GrappleAI_CancelGrappleBeam 
    dw RTL_A5804C 
    dw CommonA5_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw EnemyTouch_SporeSpawn 
    dw EnemyShot_SporeSpawn_Vulnerable 
    dw $0000 
    dl Tiles_SporeSpawn 
    db $05 
    dw EnemyDropChances_SporeSpawnStalk 
    dw EnemyVulnerabilities_SporeSpawn 
    dw $0000 

EnemyHeaders_Boulder:
    dw $1000 
    dw Palette_Boulder 
    dw $0014,$0028,$0010,$0010 
    db $A6,$00 
    dw $0000,$0000 
    dw InitAI_Boulder 
    dw $0001,$0000 
    dw MainAI_Boulder 
    dw CommonA6_GrappleAI_CancelGrappleBeam 
    dw RTL_A6804C 
    dw CommonA6_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw CommonA6_NormalEnemyTouchAI 
    dw CommonA6_NormalEnemyShotAI 
    dw $0000 
    dl Tiles_Boulder 
    db $05 
    dw EnemyDropChances_Boulder 
    dw EnemyVulnerabilities_Boulder 
    dw EnemyName_Boulder 

EnemyHeaders_KzanTop:
    dw $0400 
    dw Palette_Kzan 
    dw $01F4,$00C8,$0010,$000C 
    db $A6,$00 
    dw $0000,$0000 
    dw InitAI_KzanTop 
    dw $0002,$0000 
    dw MainAI_KzanTop 
    dw CommonA6_GrappleAI_CancelGrappleBeam 
    dw RTL_A6804C 
    dw CommonA6_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw CommonA6_NormalEnemyTouchAI 
    dw RTL_A6804C 
    dw $0000 
    dl Tiles_Kzan 
    db $05 
    dw EnemyDropChances_KzanTop_KzanBottom 
    dw EnemyVulnerabilities_Indestructible 
    dw EnemyName_KzanTop 

EnemyHeaders_KzanBottom:
    dw $0200 
    dw Palette_Kzan 
    dw $01F4,$00C8,$0010,$0002 
    db $A6,$00 
    dw $0000,$0000 
    dw InitAI_KzanBottom 
    dw $0001,$0000 
    dw MainAI_KzanBottom 
    dw CommonA6_GrappleAI_CancelGrappleBeam 
    dw RTL_A6804C 
    dw CommonA6_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw CommonA6_NormalEnemyTouchAI 
    dw RTL_A6804C 
    dw $0000 
    dl Tiles_Kzan 
    db $05 
    dw EnemyDropChances_KzanTop_KzanBottom 
    dw EnemyVulnerabilities_Indestructible 
    dw $0000 

EnemyHeaders_Hibashi:
    dw $0800 
    dw Palette_Hibashi 
    dw $0014,$001E,$0008,$0008 
    db $A6,$00 
    dw $0000,$0000 
    dw InitAI_Hibashi 
    dw $0002,$0000 
    dw MainAI_Hibashi 
    dw CommonA6_GrappleAI_CancelGrappleBeam 
    dw RTL_A6804C 
    dw CommonA6_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw CommonA6_NormalEnemyTouchAI 
    dw RTL_A6804C 
    dw $0000 
    dl Tiles_Hibashi_Puromi 
    db $05 
    dw EnemyDropChances_Hibashi 
    dw EnemyVulnerabilities_Indestructible 
    dw EnemyName_Hibashi 

EnemyHeaders_Puromi:
    dw $0800 
    dw Palette_Puromi 
    dw $0028,$0032,$0008,$0008 
    db $A6,$00 
    dw $0000,$0000 
    dw InitAI_Puromi 
    dw $0001,$0000 
    dw MainAI_Puromi 
    dw CommonA6_GrappleAI_NoInteraction 
    dw RTL_A6804C 
    dw CommonA6_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw CommonA6_NormalEnemyTouchAI 
    dw RTL_A6804C 
    dw $0000 
    dl Tiles_Hibashi_Puromi 
    db $05 
    dw EnemyDropChances_Puromi 
    dw EnemyVulnerabilities_Indestructible 
    dw EnemyName_Puromi 

EnemyHeaders_MiniKraid:
    dw $1000 
    dw Palette_MiniKraid 
    dw $0190,$0064,$0020,$0018 
    db $A6,$00 
    dw $0000,$0000 
    dw InitAI_MiniKraid 
    dw $0001,$0000 
    dw MainAI_MiniKraid 
    dw CommonA6_GrappleAI_CancelGrappleBeam 
    dw RTL_A6804C 
    dw CommonA6_NormalEnemyFrozenAI 
    dw $0000 
    dw $0003 
    dd $00000000 
    dw EnemyShot_PowerBombReaction_MiniKraid 
    dw $0000 
    dd $00000000 
    dw EnemyTouch_MiniKraid 
    dw EnemyShot_PowerBombReaction_MiniKraid 
    dw $0000 
    dl Tiles_MiniKraid 
    db $05 
    dw EnemyDropChances_MiniKraid 
    dw EnemyVulnerabilities_MiniKraid 
    dw EnemyName_MiniKraid 

EnemyHeaders_RidleyCeres:
    dw $2000 
    dw Palette_Ridley 
    dw $7FFF,$0005,$0008,$0008 
    db $A6,$08 
    dw $0000,$0001 
    dw InitAI_Ridley 
    dw $0001,$0000 
    dw MainAI_RidleyCeres 
    dw CommonA6_GrappleAI_CancelGrappleBeam 
    dw HurtAI_RidleyCeres 
    dw CommonA6_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw PowerBombReaction_Ridley 
    dw $0000 
    dd $00000000 
    dw CommonA6_NormalEnemyTouchAI 
    dw EnemyShot_Ridley 
    dw $0000 
    dl Tiles_Ridley_0 
    db $05 
    dw EnemyDropChances_Ridley_RidleyCeres 
    dw EnemyVulnerabilities_Ridley_RidleyCeres 
    dw $0000 

EnemyHeaders_Ridley:
    dw $2000 
    dw Palette_Ridley 
    dw $4650,$00A0,$0008,$0008 
    db $A6,$08 
    dw $0000,$0005 
    dw InitAI_Ridley 
    dw $0001,$0000 
    dw MainAI_Ridley 
    dw CommonA6_GrappleAI_CancelGrappleBeam 
    dw HurtAI_Ridley 
    dw CommonA6_NormalEnemyFrozenAI 
    dw TimeIsFrozenAI_Ridley 
    dw $0000 
    dd $00000000 
    dw PowerBombReaction_Ridley 
    dw $0000 
    dd $00000000 
    dw CommonA6_NormalEnemyTouchAI 
    dw EnemyShot_Ridley 
    dw $0000 
    dl Tiles_Ridley_0 
    db $02 
    dw EnemyDropChances_Ridley_RidleyCeres 
    dw EnemyVulnerabilities_Ridley_RidleyCeres 
    dw $0000 

EnemyHeaders_RidleyExplosion:
    dw $8400 
    dw Palette_RidleyExplosion_0 
    dw $4650,$00A0,$0008,$0008 
    db $A6,$00 
    dw $0000,$0000 
    dw InitAI_RidleyExplosion 
    dw $0001,$0000 
    dw MainAI_RidleyExplosion 
    dw CommonA6_GrappleAI_CancelGrappleBeam 
    dw RTL_A6804C 
    dw RTL_A6804C 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw RTL_A0804C 
    dw $0000 
    dd $00000000 
    dw RTL_A6804C 
    dw RTL_A6804C 
    dw $0000 
    dl Tiles_RidleyExplosion 
    db $05 
    dw $0000 
    dw EnemyVulnerabilities_Indestructible 
    dw $0000 

EnemyHeaders_Steam:
    dw $0000 
    dw Palette_CeresSteam 
    dw $7FFF,$0000,$0008,$0008 
    db $A6,$00 
    dw $0000,$0000 
    dw InitAI_CeresSteam 
    dw $0001,$0000 
    dw MainAI_CeresSteam 
    dw CommonA6_GrappleAI_CancelGrappleBeam 
    dw RTL_A6804C 
    dw CommonA6_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw EnemyTouch_CeresSteam 
    dw RTL_A6804C 
    dw $0000 
    dl EnemyHeaders_CeresDoor 
    db $05 
    dw EnemyDropChances_Steam_Dachora_DachoraEscape 
    dw EnemyVulnerabilities_Indestructible 
    dw $0000 

EnemyHeaders_CeresDoor:
    dw $8600 
    dw Palette_CeresDoor_BeforeEscape 
    dw $0028,$000F,$0008,$0020 
    db $A6,$00 
    dw $0059,$0000 
    dw InitAI_CeresDoor 
    dw $0001,$0000 
    dw MainAI_CeresDoor 
    dw CommonA6_GrappleAI_CancelGrappleBeam 
    dw RTL_A6804C 
    dw CommonA6_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw $0000 
    dw InstListPointers_CeresDoor 
    dd $00000000 
    dw RTL_A6F920 
    dw RTL_A6F920 
    dw InitAI_Zebetite 
    dl Tiles_CeresDoor_0 
    db $02 
    dw $0000 
    dw $0000 
    dw $0000 

EnemyHeaders_Zebetite:
    dw $0000 
    dw $0000 
    dw $03E8,$0000,$0008,$0018 
    db $A6,$00 
    dw $0000,$0000 
    dw InitAI_Zebetite 
    dw $0001,$0000 
    dw MainAI_Zebetite 
    dw CommonA6_GrappleAI_CancelGrappleBeam 
    dw RTL_A6804C 
    dw CommonA6_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw EnemyTouch_Zebetite 
    dw EnemyShot_Zebetite 
    dw $0000 
    dl Tiles_MotherBrainHead 
    db $05 
    dw $0000 
    dw EnemyVulnerabilities_Zebetite 
    dw $0000 

EnemyHeaders_Kraid:
    dw $1E00 
    dw Palette_Kraid 
    dw $03E8,$0014,$0038,$0090 
    db $A7,$00 
    dw $0000,$0003 
    dw InitAI_Kraid 
    dw $0001,$0000 
    dw MainAI_Kraid 
    dw CommonA7_GrappleAI_CancelGrappleBeam 
    dw RTL_A7804C 
    dw CommonA7_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw Common_NormalEnemyPowerBombAI_NoDeathCheck 
    dw $0000 
    dd $00000000 
    dw EnemyTouch_Kraid 
    dw RTL_A7804C 
    dw $0000 
    dl Tiles_Kraid 
    db $05 
    dw EnemyDropChances_Kraid 
    dw EnemyVulnerabilities_Kraid 
    dw $0000 

EnemyHeaders_KraidArm:
    dw $1E00 
    dw Palette_Kraid 
    dw $03E8,$0014,$0030,$0030 
    db $A7,$00 
    dw $0000,$0000 
    dw InitAI_KraidArm 
    dw $0001,$0000 
    dw MainAI_KraidArm 
    dw CommonA7_GrappleAI_CancelGrappleBeam 
    dw RTL_A7804C 
    dw CommonA7_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw EnemyTouch_KraidArm 
    dw RTL_A794B5 
    dw $0000 
    dl Tiles_Kraid 
    db $05 
    dw $0000 
    dw EnemyVulnerabilities_KraidArm_KraidFoot 
    dw $0000 

EnemyHeaders_LintTop:
    dw $1E00 
    dw Palette_Kraid 
    dw $03E8,$000A,$0018,$0008 
    db $A7,$00 
    dw $0000,$0000 
    dw InitAI_KraidLintTop 
    dw $0001,$0000 
    dw MainAI_KraidLintTop 
    dw CommonA7_GrappleAI_CancelGrappleBeam 
    dw RTL_A7804C 
    dw CommonA7_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw RTL_A7948F 
    dw CommonA7_NormalEnemyShotAI 
    dw $0000 
    dl Tiles_Kraid 
    db $05 
    dw $0000 
    dw EnemyVulnerabilities_Kraid_LintTop_LintMiddle_LintBottom 
    dw $0000 

EnemyHeaders_LintMiddle:
    dw $1E00 
    dw Palette_Kraid 
    dw $03E8,$000A,$0018,$0008 
    db $A7,$00 
    dw $0000,$0000 
    dw InitAI_KraidLintMiddle 
    dw $0001,$0000 
    dw MainAI_KraidLintMiddle 
    dw CommonA7_GrappleAI_CancelGrappleBeam 
    dw RTL_A7804C 
    dw CommonA7_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw RTL_A7948F 
    dw CommonA7_NormalEnemyShotAI 
    dw $0000 
    dl Tiles_Kraid 
    db $05 
    dw $0000 
    dw EnemyVulnerabilities_Kraid_LintTop_LintMiddle_LintBottom 
    dw $0000 

EnemyHeaders_LintBottom:
    dw $1E00 
    dw Palette_Kraid 
    dw $03E8,$000A,$0018,$0008 
    db $A7,$00 
    dw $0000,$0000 
    dw InitAI_KraidLintBottom 
    dw $0001,$0000 
    dw MainAI_KraidLintBottom 
    dw CommonA7_GrappleAI_CancelGrappleBeam 
    dw RTL_A7804C 
    dw CommonA7_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw RTL_A7948F 
    dw CommonA7_NormalEnemyShotAI 
    dw $0000 
    dl Tiles_Kraid 
    db $05 
    dw $0000 
    dw EnemyVulnerabilities_Kraid_LintTop_LintMiddle_LintBottom 
    dw $0000 

EnemyHeaders_KraidFoot:
    dw $1E00 
    dw Palette_Kraid 
    dw $03E8,$0014,$0008,$0008 
    db $A7,$00 
    dw $0000,$0000 
    dw InitAI_KraidFoot 
    dw $0001,$0000 
    dw MainAI_KraidFoot 
    dw CommonA7_GrappleAI_CancelGrappleBeam 
    dw RTL_A7804C 
    dw CommonA7_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw RTL_A7948F 
    dw RTL_A794B5 
    dw $0000 
    dl Tiles_Kraid 
    db $05 
    dw EnemyDropChances_KraidNail_KraidFoot 
    dw EnemyVulnerabilities_KraidArm_KraidFoot 
    dw $0000 

EnemyHeaders_KraidNail:
    dw $1E00 
    dw Palette_Kraid 
    dw $000A,$000A,$0008,$0008 
    db $A7,$00 
    dw $0000,$0000 
    dw InitAI_KraidNail 
    dw $0001,$0000 
    dw MainAI_KraidNail 
    dw CommonA7_GrappleAI_CancelGrappleBeam 
    dw RTL_A7804C 
    dw CommonA7_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw EnemyTouch_KraidNail 
    dw CommonA7_NormalEnemyShotAI 
    dw $0000 
    dl Tiles_Kraid 
    db $05 
    dw EnemyDropChances_KraidNail_KraidFoot 
    dw EnemyVulnerabilities_KraidNail_KraidNailBad 
    dw $0000 

EnemyHeaders_KraidNailBad:
    dw $1E00 
    dw Palette_Kraid 
    dw $000A,$000A,$0008,$0008 
    db $A7,$00 
    dw $0000,$0000 
    dw InitAI_KraidNailBad 
    dw $0001,$0000 
    dw MainAI_KraidNailBad 
    dw CommonA7_GrappleAI_CancelGrappleBeam 
    dw RTL_A7804C 
    dw CommonA7_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw EnemyTouch_KraidNailBad 
    dw CommonA7_NormalEnemyShotAI 
    dw $0000 
    dl Tiles_Kraid 
    db $05 
    dw $0000 
    dw EnemyVulnerabilities_KraidNail_KraidNailBad 
    dw $0000 

EnemyHeaders_PhantoonBody:
    dw $0C00 
    dw Palette_Phantoon 
    dw $09C4,$0028,$0008,$0008 
    db $A7,$08 
    dw $0000,$0007 
    dw InitAI_PhantoonBody 
    dw $0001,$0000 
    dw MainAI_Phantoon 
    dw CommonA7_GrappleAI_NoInteraction 
    dw HurtAI_Phantoon 
    dw RTL_A7804C 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw RTL_A7DD9A 
    dw $0000 
    dd $00000000 
    dw EnemyTouch_Phantoon 
    dw EnemyShot_Phantoon 
    dw $0000 
    dl Tiles_Phantoon 
    db $05 
    dw EnemyDropChances_Phantoon_Body_Tentacles_Mouth 
    dw EnemyVulnerabilities_Phantoon_Body_Eye_Tentacles_Mouth 
    dw $0000 

EnemyHeaders_PhantoonEye:
    dw $0400 
    dw Palette_Phantoon 
    dw $09C4,$0028,$0008,$0008 
    db $A7,$00 
    dw $0000,$0000 
    dw InitAI_Phantoon_Eye_Tentacles_Mouth 
    dw $0001,$0000 
    dw RTL_A7804C 
    dw CommonA7_GrappleAI_NoInteraction 
    dw RTL_A7804C 
    dw RTL_A7804C 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw RTL_A0804C 
    dw $0000 
    dd $00000000 
    dw RTL_A7804C 
    dw RTL_A7804C 
    dw $0000 
    dl Tiles_Phantoon 
    db $05 
    dw EnemyDropChances_PhantoonEye 
    dw EnemyVulnerabilities_Phantoon_Body_Eye_Tentacles_Mouth 
    dw $0000 

EnemyHeaders_PhantoonTentacles:
    dw $0400 
    dw Palette_Phantoon 
    dw $09C4,$0028,$0008,$0008 
    db $A7,$00 
    dw $0000,$0000 
    dw InitAI_Phantoon_Eye_Tentacles_Mouth 
    dw $0001,$0000 
    dw RTL_A7E011 
    dw CommonA7_GrappleAI_NoInteraction 
    dw RTL_A7804C 
    dw RTL_A7804C 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw RTL_A0804C 
    dw $0000 
    dd $00000000 
    dw RTL_A7804C 
    dw RTL_A7804C 
    dw $0000 
    dl Tiles_Phantoon 
    db $05 
    dw EnemyDropChances_Phantoon_Body_Tentacles_Mouth 
    dw EnemyVulnerabilities_Phantoon_Body_Eye_Tentacles_Mouth 
    dw $0000 

EnemyHeaders_PhantoonMouth:
    dw $0400 
    dw Palette_Phantoon 
    dw $09C4,$0028,$0008,$0008 
    db $A7,$00 
    dw $0000,$0000 
    dw InitAI_Phantoon_Eye_Tentacles_Mouth 
    dw $0001,$0000 
    dw RTL_A7E011 
    dw CommonA7_GrappleAI_NoInteraction 
    dw RTL_A7804C 
    dw RTL_A7804C 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw RTL_A0804C 
    dw $0000 
    dd $00000000 
    dw RTL_A7804C 
    dw RTL_A7804C 
    dw $0000 
    dl Tiles_Phantoon 
    db $05 
    dw EnemyDropChances_Phantoon_Body_Tentacles_Mouth 
    dw EnemyVulnerabilities_Phantoon_Body_Eye_Tentacles_Mouth 
    dw $0000 

EnemyHeaders_Etecoon:
    dw $0600 
    dw Palette_Etecoon 
    dw $7FFF,$0000,$0006,$0007 
    db $A7,$00 
    dw $0000,$0000 
    dw InitAI_Etecoon 
    dw $0001,$0000 
    dw MainAI_Etecoon 
    dw CommonA7_GrappleAI_NoInteraction 
    dw RTL_A7804C 
    dw CommonA7_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw RTL_A0804C 
    dw $0000 
    dd $00000000 
    dw RTL_A7804C 
    dw RTL_A7804C 
    dw $0000 
    dl Tiles_Etecoon 
    db $05 
    dw EnemyDropChances_Etecoon_EtecoonEscape 
    dw $0000 
    dw $0000 

EnemyHeaders_Dachora:
    dw $0C00 
    dw Palette_Dachora 
    dw $7FFF,$0000,$0008,$0018 
    db $A7,$00 
    dw $0000,$0000 
    dw InitAI_Dachora 
    dw $0001,$0000 
    dw MainAI_Dachora 
    dw CommonA7_GrappleAI_NoInteraction 
    dw RTL_A7804C 
    dw CommonA7_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw RTL_A0804C 
    dw $0000 
    dd $00000000 
    dw RTL_A7804C 
    dw RTL_A7804C 
    dw $0000 
    dl Tiles_Dachora 
    db $05 
    dw EnemyDropChances_Steam_Dachora_DachoraEscape 
    dw $0000 
    dw $0000 

EnemyHeaders_Evir:
    dw $0600 
    dw Palette_Evir 
    dw $012C,$0064,$0010,$0014 
    db $A8,$00 
    dw $004A,$0000 
    dw InitAI_Evir 
    dw $0003,$0000 
    dw MainAI_Evir 
    dw CommonA8_GrappleAI_CancelGrappleBeam 
    dw RTL_A8804C 
    dw CommonA8_NormalEnemyFrozenAI 
    dw $0000 
    dw $0004 
    dd $00000000 
    dw PowerBombReaction_Evir 
    dw $0000 
    dd $00000000 
    dw EnemyShot_Evir 
    dw EnemyTouch_Evir 
    dw $0000 
    dl Tiles_Evir 
    db $05 
    dw EnemyDropChances_Evir_EvirProjectile 
    dw EnemyVulnerabilities_Evir 
    dw EnemyName_Evir 

EnemyHeaders_EvirProjectile:
    dw $0600 
    dw Palette_Evir 
    dw $012C,$0064,$0008,$0008 
    db $A8,$00 
    dw $0000,$0000 
    dw InitAI_EvirProjectile 
    dw $0001,$0000 
    dw MainAI_EvirProjectile 
    dw CommonA8_GrappleAI_CancelGrappleBeam 
    dw RTL_A8804C 
    dw CommonA8_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw RTL_A0804C 
    dw $0000 
    dd $00000000 
    dw CommonA8_NormalEnemyTouchAI 
    dw RTL_A8804C 
    dw $0000 
    dl Tiles_Evir 
    db $05 
    dw EnemyDropChances_Evir_EvirProjectile 
    dw EnemyVulnerabilities_EvirProjectile 
    dw $0000 

EnemyHeaders_Eye:
    dw $0400 
    dw Palette_Eye 
    dw $0014,$0000,$0008,$0008 
    db $A8,$00 
    dw $0000,$0000 
    dw InitAI_Eye 
    dw $0002,$0000 
    dw MainAI_Eye 
    dw CommonA8_GrappleAI_CancelGrappleBeam 
    dw RTL_A8804C 
    dw CommonA8_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw CommonA8_NormalEnemyTouchAI 
    dw RTL_A8804C 
    dw $0000 
    dl Tiles_Eye 
    db $05 
    dw EnemyDropChances_Eye 
    dw EnemyVulnerabilities_Indestructible 
    dw EnemyName_Eye 

EnemyHeaders_Fune:
    dw $0800 
    dw Palette_Fune 
    dw $0014,$000A,$0010,$0010 
    db $A8,$00 
    dw $0000,$0000 
    dw InitAI_Fune_Namihe 
    dw $0001,$0000 
    dw MainAI_Fune_Namihe 
    dw CommonA8_GrappleAI_CancelGrappleBeam 
    dw RTL_A8804C 
    dw CommonA8_NormalEnemyFrozenAI 
    dw $0000 
    dw $0002 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw CommonA8_NormalEnemyTouchAI 
    dw CommonA8_NormalEnemyShotAI 
    dw $0000 
    dl Tiles_Fune_Namihe 
    db $05 
    dw EnemyDropChances_Fune 
    dw EnemyVulnerabilities_Fune_Magdollite 
    dw EnemyName_Fune 

EnemyHeaders_Namihe:
    dw $0800 
    dw Palette_Namihe 
    dw $0014,$000A,$0010,$0010 
    db $A8,$00 
    dw $0000,$0000 
    dw InitAI_Fune_Namihe 
    dw $0003,$0000 
    dw MainAI_Fune_Namihe 
    dw CommonA8_GrappleAI_CancelGrappleBeam 
    dw RTL_A8804C 
    dw CommonA8_NormalEnemyFrozenAI 
    dw $0000 
    dw $0002 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw CommonA8_NormalEnemyTouchAI 
    dw CommonA8_NormalEnemyShotAI 
    dw $0000 
    dl Tiles_Fune_Namihe 
    db $05 
    dw EnemyDropChances_Namihe 
    dw EnemyVulnerabilities_Namihe 
    dw EnemyName_Namihe 

EnemyHeaders_Coven:
    dw $0400 
    dw Palette_Coven 
    dw $012C,$003C,$0010,$0010 
    db $A8,$00 
    dw $0051,$0000 
    dw InitAI_Coven 
    dw $0001,$0000 
    dw MainAI_Coven 
    dw CommonA8_GrappleAI_NoInteraction 
    dw RTL_A8804C 
    dw CommonA8_NormalEnemyFrozenAI 
    dw $0000 
    dw $0002 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw CommonA8_NormalEnemyTouchAI 
    dw CommonA8_NormalEnemyShotAI 
    dw $0000 
    dl Tiles_Coven 
    db $05 
    dw EnemyDropChances_Coven 
    dw EnemyVulnerabilities_Default 
    dw EnemyName_Coven 

EnemyHeaders_YappingMaw:
    dw $0400 
    dw Palette_YappingMaw 
    dw $0014,$001E,$0008,$0008 
    db $A8,$00 
    dw $003E,$0000 
    dw InitAI_YappingMaw 
    dw $0001,$0000 
    dw MainAI_YappingMaw 
    dw CommonA8_GrappleAI_CancelGrappleBeam 
    dw RTL_A8804C 
    dw FrozenAI_YappingMaw 
    dw $0000 
    dw $0004 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw EnemyTouch_YappingMaw 
    dw EnemyShot_YappingMaw 
    dw $0000 
    dl Tiles_YappingMaw 
    db $05 
    dw EnemyDropChances_YappingMaw 
    dw EnemyVulnerabilities_YappingMaw 
    dw EnemyName_YappingMaw 

EnemyHeaders_Kago:
    dw $0800 
    dw Palette_Kago 
    dw $0640,$0000,$0010,$0010 
    db $A8,$00 
    dw $0000,$0000 
    dw InitAI_Kago 
    dw $0009,$0000 
    dw MainAI_Kago 
    dw CommonA8_GrappleAI_CancelGrappleBeam 
    dw RTL_A8804C 
    dw CommonA8_NormalEnemyFrozenAI 
    dw $0000 
    dw $0004 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw CommonA8_NormalEnemyTouchAI 
    dw EnemyShot_Kago 
    dw $0000 
    dl Tiles_Kago 
    db $05 
    dw EnemyDropChances_Kago 
    dw EnemyVulnerabilities_Kago 
    dw EnemyName_Kago 

EnemyHeaders_Magdollite:
    dw $0600 
    dw Palette_Magdollite 
    dw $0014,$0028,$0008,$0008 
    db $A8,$00 
    dw $0000,$0000 
    dw InitAI_Magdollite 
    dw $0003,$0000 
    dw MainAI_Magdollite 
    dw CommonA8_GrappleAI_CancelGrappleBeam 
    dw RTL_A8804C 
    dw CommonA8_NormalEnemyFrozenAI 
    dw $0000 
    dw $0004 
    dd $00000000 
    dw PowerBombReaction_Magdollite 
    dw $0000 
    dd $00000000 
    dw EnemyTouch_Magdollite 
    dw EnemyShot_Magdollite 
    dw $0000 
    dl Tiles_Magdollite 
    db $05 
    dw EnemyDropChances_Magdollite 
    dw EnemyVulnerabilities_Fune_Magdollite 
    dw EnemyName_Magdollite 

EnemyHeaders_Beetom:
    dw $0600 
    dw Palette_Beetom 
    dw $003C,$000A,$0008,$0008 
    db $A8,$00 
    dw $0055,$0000 
    dw InitAI_Beetom 
    dw $0001,$0000 
    dw MainAI_Beetom 
    dw CommonA8_GrappleAI_CancelGrappleBeam 
    dw RTL_A8804C 
    dw CommonA8_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw EnemyTouch_Beetom 
    dw EnemyShot_Beetom 
    dw $0000 
    dl Tiles_Beetom 
    db $05 
    dw EnemyDropChances_Beetom 
    dw EnemyVulnerabilities_Beetom 
    dw EnemyName_Beetom 

EnemyHeaders_Powamp:
    dw $0400 
    dw Palette_Powamp 
    dw $000A,$0064,$0008,$0010 
    db $A8,$00 
    dw $006A,$0000 
    dw InitAI_Powamp 
    dw $0002,$0000 
    dw MainAI_Powamp 
    dw CommonA8_GrappleAI_SamusLatchesOn_NoInvincibility 
    dw RTL_A8804C 
    dw CommonA8_NormalEnemyFrozenAI 
    dw $0000 
    dw $0002 
    dd $00000000 
    dw PowerBombReaction_Powamp 
    dw $0000 
    dd $00000000 
    dw EnemyTouch_Powamp 
    dw EnemyShot_Powamp 
    dw $0000 
    dl Tiles_Powamp 
    db $05 
    dw EnemyDropChances_Powamp 
    dw EnemyVulnerabilities_Powamp 
    dw EnemyName_Powamp 

EnemyHeaders_Robot:
    dw $0C00 
    dw Palette_Robot 
    dw $0320,$0050,$000C,$0020 
    db $A8,$00 
    dw $0068,$0000 
    dw InitAI_Robot 
    dw $0001,$0000 
    dw MainAI_Robot 
    dw CommonA8_GrappleAI_CancelGrappleBeam 
    dw RTL_A8804C 
    dw CommonA8_NormalEnemyFrozenAI 
    dw $0000 
    dw $0002 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw EnemyTouch_Robot 
    dw EnemyShot_Robot 
    dw $0000 
    dl Tiles_Robot 
    db $05 
    dw EnemyDropChances_Robot 
    dw EnemyVulnerabilities_Indestructible 
    dw EnemyName_Robot 

EnemyHeaders_RobotNoPower:
    dw $0C00 
    dw Palette_Robot 
    dw $01C2,$0050,$000C,$0020 
    db $A8,$00 
    dw $0068,$0000 
    dw InitAI_RobotNoPower 
    dw $0001,$0000 
    dw RTL_A8CC66 
    dw CommonA8_GrappleAI_CancelGrappleBeam 
    dw RTL_A8804C 
    dw CommonA8_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw EnemyTouch_Robot 
    dw EnemyShot_RobotNoPower 
    dw $0000 
    dl Tiles_Robot 
    db $05 
    dw EnemyDropChances_RobotNoPower 
    dw EnemyVulnerabilities_Indestructible 
    dw EnemyName_RobotNoPower 

EnemyHeaders_Bull:
    dw $0600 
    dw Palette_Bull 
    dw $0064,$000A,$0008,$0008 
    db $A8,$00 
    dw $0000,$0000 
    dw InitAI_Bull 
    dw $0001,$0000 
    dw MainAI_Bull 
    dw CommonA8_GrappleAI_KillEnemy 
    dw RTL_A8804C 
    dw CommonA8_NormalEnemyFrozenAI 
    dw $0000 
    dw $0002 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw CommonA8_NormalEnemyTouchAI 
    dw EnemyShot_Bull 
    dw $0000 
    dl Tiles_Bull 
    db $05 
    dw EnemyDropChances_Bull 
    dw EnemyVulnerabilities_Bull 
    dw EnemyName_Bull 

EnemyHeaders_Alcoon:
    dw $0800 
    dw Palette_Alcoon 
    dw $00C8,$0032,$0008,$0018 
    db $A8,$00 
    dw $005F,$0000 
    dw InitAI_Alcoon 
    dw $0001,$0000 
    dw MainAI_Alcoon 
    dw CommonA8_GrappleAI_CancelGrappleBeam 
    dw RTL_A8804C 
    dw CommonA8_NormalEnemyFrozenAI 
    dw $0000 
    dw $0004 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw CommonA8_NormalEnemyTouchAI 
    dw CommonA8_NormalEnemyShotAI 
    dw $0000 
    dl Tiles_Alcoon 
    db $05 
    dw EnemyDropChances_Alcoon 
    dw EnemyVulnerabilities_Alcoon 
    dw EnemyName_Alcoon 

EnemyHeaders_Atomic:
    dw $0400 
    dw Palette_Atomic 
    dw $00FA,$0028,$0008,$0008 
    db $A8,$00 
    dw $003E,$0000 
    dw InitAI_Atomic 
    dw $0001,$0000 
    dw MainAI_Atomic 
    dw CommonA8_GrappleAI_CancelGrappleBeam 
    dw RTL_A8804C 
    dw CommonA8_NormalEnemyFrozenAI 
    dw $0000 
    dw $0002 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw CommonA8_NormalEnemyTouchAI 
    dw CommonA8_NormalEnemyShotAI 
    dw $0000 
    dl Tiles_Atomic 
    db $05 
    dw EnemyDropChances_Atomic 
    dw EnemyVulnerabilities_Default 
    dw EnemyName_Atomic 

EnemyHeaders_Spark:
    dw $0200 
    dw Palette_Spark 
    dw $0050,$001E,$0008,$0008 
    db $A8,$00 
    dw $0000,$0000 
    dw InitAI_Spark 
    dw $0001,$0000 
    dw MainAI_Spark 
    dw CommonA8_GrappleAI_HurtSamus 
    dw RTL_A8804C 
    dw CommonA8_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw CommonA8_NormalEnemyTouchAI 
    dw EnemyShot_Spark 
    dw $0000 
    dl Tiles_Spark 
    db $05 
    dw EnemyDropChances_Spark 
    dw EnemyVulnerabilities_Indestructible 
    dw EnemyName_Spark 

EnemyHeaders_FaceBlock:
    dw $0200 
    dw Palette_FaceBlock 
    dw $0014,$0000,$0008,$0008 
    db $A8,$00 
    dw $0000,$0000 
    dw InitAI_FaceBlock 
    dw $0001,$0000 
    dw MainAI_FaceBlock 
    dw CommonA8_GrappleAI_CancelGrappleBeam 
    dw RTL_A8804C 
    dw CommonA8_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw RTL_A8804C 
    dw EnemyShot_FaceBlock 
    dw $0000 
    dl Tiles_FaceBlock 
    db $02 
    dw EnemyDropChances_FaceBlock 
    dw EnemyVulnerabilities_Indestructible 
    dw EnemyName_FaceBlock 

EnemyHeaders_KihunterGreen:
    dw $1000 
    dw Palette_KihunterGreen 
    dw $003C,$0014,$0008,$0012 
    db $A8,$00 
    dw $0066,$0000 
    dw InitAI_Kihunter 
    dw $0002,$0000 
    dw MainAI_Kihunter 
    dw CommonA8_GrappleAI_CancelGrappleBeam 
    dw RTL_A8804C 
    dw CommonA8_NormalEnemyFrozenAI 
    dw $0000 
    dw $0004 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw CommonA8_NormalEnemyTouchAI 
    dw EnemyShot_Kihunter 
    dw $0000 
    dl Tiles_Kihunter 
    db $05 
    dw EnemyDropChances_KihunterGreen_KihunterGreenWings 
    dw EnemyVulnerabilities_KihunterGreen_KihunterGreenWings 
    dw EnemyName_KihunterGreen 

EnemyHeaders_KihunterGreenWings:
    dw $0200 
    dw Palette_KihunterGreen 
    dw $003C,$0014,$000A,$000A 
    db $A8,$00 
    dw $0066,$0000 
    dw InitAI_KihunterWings 
    dw $0001,$0000 
    dw MainAI_KihunterWings 
    dw CommonA8_GrappleAI_CancelGrappleBeam 
    dw RTL_A8804C 
    dw CommonA8_NormalEnemyFrozenAI 
    dw $0000 
    dw $0004 
    dd $00000000 
    dw RTL_A0804C 
    dw $0000 
    dd $00000000 
    dw RTL_A8804C 
    dw RTL_A8804C 
    dw $0000 
    dl Tiles_Kihunter 
    db $05 
    dw EnemyDropChances_KihunterGreen_KihunterGreenWings 
    dw EnemyVulnerabilities_KihunterGreen_KihunterGreenWings 
    dw $0000 

EnemyHeaders_KihunterYellow:
    dw $1000 
    dw Palette_KihunterYellow 
    dw $0168,$003C,$0008,$0012 
    db $A8,$00 
    dw $0066,$0000 
    dw InitAI_Kihunter 
    dw $0002,$0000 
    dw MainAI_Kihunter 
    dw CommonA8_GrappleAI_CancelGrappleBeam 
    dw RTL_A8804C 
    dw CommonA8_NormalEnemyFrozenAI 
    dw $0000 
    dw $0004 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw CommonA8_NormalEnemyTouchAI 
    dw EnemyShot_Kihunter 
    dw $0000 
    dl Tiles_Kihunter 
    db $05 
    dw EnemyDropChances_KihunterYellow_KihunterYellowWings 
    dw EnemyVulnerabilities_KihunterYellow_KihunterYellowWings 
    dw EnemyName_KihunterYellow 

EnemyHeaders_KihunterYellowWings:
    dw $0200 
    dw Palette_KihunterYellow 
    dw $0168,$003C,$000A,$000A 
    db $A8,$00 
    dw $0066,$0000 
    dw InitAI_KihunterWings 
    dw $0001,$0000 
    dw MainAI_KihunterWings 
    dw CommonA8_GrappleAI_CancelGrappleBeam 
    dw RTL_A8804C 
    dw CommonA8_NormalEnemyFrozenAI 
    dw $0000 
    dw $0004 
    dd $00000000 
    dw RTL_A0804C 
    dw $0000 
    dd $00000000 
    dw RTL_A8804C 
    dw RTL_A8804C 
    dw $0000 
    dl Tiles_Kihunter 
    db $05 
    dw EnemyDropChances_KihunterYellow_KihunterYellowWings 
    dw EnemyVulnerabilities_KihunterYellow_KihunterYellowWings 
    dw $0000 

EnemyHeaders_KihunterRed:
    dw $1000 
    dw Palette_KihunterRed 
    dw $0708,$00C8,$0008,$0012 
    db $A8,$00 
    dw $0066,$0000 
    dw InitAI_Kihunter 
    dw $0002,$0000 
    dw MainAI_Kihunter 
    dw CommonA8_GrappleAI_CancelGrappleBeam 
    dw RTL_A8804C 
    dw CommonA8_NormalEnemyFrozenAI 
    dw $0000 
    dw $0004 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw CommonA8_NormalEnemyTouchAI 
    dw EnemyShot_Kihunter 
    dw $0000 
    dl Tiles_Kihunter 
    db $05 
    dw EnemyDropChances_KihunterRed_KihunterRedWings 
    dw EnemyVulnerabilities_KihunterRed_KihunterRedWings 
    dw EnemyName_KihunterRed 

EnemyHeaders_KihunterRedWings:
    dw $0200 
    dw Palette_KihunterRed 
    dw $0708,$00C8,$000A,$000A 
    db $A8,$00 
    dw $0066,$0000 
    dw InitAI_KihunterWings 
    dw $0001,$0000 
    dw MainAI_KihunterWings 
    dw CommonA8_GrappleAI_CancelGrappleBeam 
    dw RTL_A8804C 
    dw CommonA8_NormalEnemyFrozenAI 
    dw $0000 
    dw $0004 
    dd $00000000 
    dw RTL_A0804C 
    dw $0000 
    dd $00000000 
    dw RTL_A8804C 
    dw RTL_A8804C 
    dw $0000 
    dl Tiles_Kihunter 
    db $05 
    dw EnemyDropChances_KihunterRed_KihunterRedWings 
    dw EnemyVulnerabilities_KihunterRed_KihunterRedWings 
    dw $0000 

EnemyHeaders_MotherBrainHead:
    dw $1000 
    dw Palette_MotherBrain 
    dw $4650,$0078,$0010,$0010 
    db $A9,$00 
    dw $0000,$000A 
    dw InitAI_MotherBrainHead 
    dw $0001,$0000 
    dw MainAI_HurtAI_MotherBrainHead 
    dw CommonA9_GrappleAI_CancelGrappleBeam 
    dw MainAI_HurtAI_MotherBrainHead 
    dw CommonA9_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw PowerBombReaction_MotherBrain 
    dw $0000 
    dd $00000000 
    dw EnemyTouch_MotherBrainHead 
    dw EnemyShot_MotherBrainHead 
    dw $0000 
    dl Tiles_MotherBrainHead 
    db $05 
    dw EnemyDropChances_MotherBrainHead 
    dw EnemyVulnerabilities_MotherBrainHead 
    dw $0000 

EnemyHeaders_MotherBrainBody:
    dw $8600 
    dw Palette_MotherBrain 
    dw $4650,$0078,$0008,$0008 
    db $A9,$00 
    dw $0000,$0000 
    dw InitAI_MotherBrainBody 
    dw $0001,$0000 
    dw MainAI_HurtAI_MotherBrainBody 
    dw CommonA9_GrappleAI_CancelGrappleBeam 
    dw MainAI_HurtAI_MotherBrainBody 
    dw CommonA9_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw PowerBombReaction_MotherBrain 
    dw $0000 
    dd $00000000 
    dw RTL_A9B5C5 
    dw EnemyShot_MotherBrainBody 
    dw $0000 
    dl Tiles_MotherBrainBody 
    db $05 
    dw EnemyDropChances_MotherBrainBody_BombTorizo 
    dw EnemyVulnerabilities_MotherBrainBody 
    dw $0000 

EnemyHeaders_BabyMetroidCutscene:
    dw $0000 
    dw Palette_BabyMetroid 
    dw $0C80,$0028,$0024,$0024 
    db $A9,$00 
    dw $0000,$0000 
    dw InitAI_BabyMetroidCutscene 
    dw $0001,$0000 
    dw MainAI_BabyMetroidCutscene 
    dw CommonA9_GrappleAI_CancelGrappleBeam 
    dw RTL_A9804C 
    dw CommonA9_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw EnemyTouch_BabyMetroidCutscene 
    dw RTL_A9804C 
    dw $0000 
    dl Tiles_BabyMetroid 
    db $02 
    dw EnemyDropChances_Shutter_Kamer_BabyMetroidCutscene 
    dw EnemyVulnerabilities_Default 
    dw $0000 

EnemyHeaders_MotherBrainTubes:
    dw $0000 
    dw Palette_MotherBrain 
    dw $03E8,$0000,$0000,$0000 
    db $A9,$00 
    dw $0000,$0000 
    dw InitAI_MotherBrainTubes 
    dw $0001,$0000 
    dw MainAI_MotherBrainTubes 
    dw CommonA9_GrappleAI_CancelGrappleBeam 
    dw RTL_A9804C 
    dw CommonA9_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw RTL_A9804C 
    dw RTL_A9804C 
    dw $0000 
    dl Tiles_MotherBrainHead 
    db $05 
    dw $0000 
    dw EnemyVulnerabilities_Default 
    dw $0000 

EnemyHeaders_CorpseTorizo:
    dw $1800 
    dw Palette_CorpseTorizo 
    dw $03E8,$0000,$0010,$0028 
    db $A9,$00 
    dw $0000,$0000 
    dw InitAI_CorpseTorizo 
    dw $0001,$0000 
    dw MainAI_CorpseTorizo 
    dw CommonA9_GrappleAI_CancelGrappleBeam 
    dw RTL_A9804C 
    dw CommonA9_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw PowerBombReaction_CorpseTorizo 
    dw $0000 
    dd $00000000 
    dw EnemyTouch_EnemyShot_CorpseTorizo 
    dw EnemyTouch_EnemyShot_CorpseTorizo 
    dw $0000 
    dl Tiles_CorpseTorizo 
    db $05 
    dw EnemyDropChances_Shutter_Kamer_BabyMetroidCutscene 
    dw EnemyVulnerabilities_Corpse_BabyMetroid 
    dw $0000 

EnemyHeaders_CorpseSidehopper:
    dw $0E00 
    dw Palette_CorpseCommon 
    dw $0140,$0050,$0016,$000C 
    db $A9,$00 
    dw $0000,$0000 
    dw InitAI_CorpseSidehopper 
    dw $0001,$0000 
    dw MainAI_HurtAI_CorpseEnemies 
    dw CommonA9_GrappleAI_CancelGrappleBeam 
    dw MainAI_HurtAI_CorpseEnemies 
    dw CommonA9_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw PowerBombReaction_CorpseSidehopper 
    dw $0000 
    dd $00000000 
    dw EnemyTouch_CorpseSidehopper 
    dw EnemyShot_CorpseSidehopper 
    dw $0000 
    dl Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree 
    db $05 
    dw $0000 
    dw EnemyVulnerabilities_Corpse_BabyMetroid 
    dw $0000 

EnemyHeaders_CorpseSidehopper2:
    dw $0600 
    dw Palette_CorpseSidehopper2 
    dw $0140,$0050,$0016,$000C 
    db $A9,$00 
    dw $0000,$0000 
    dw InitAI_CorpseSidehopper 
    dw $0001,$0000 
    dw MainAI_HurtAI_CorpseEnemies 
    dw CommonA9_GrappleAI_CancelGrappleBeam 
    dw RTL_A9804C 
    dw CommonA9_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw EnemyShot_CorpseSidehopper 
    dw $0000 
    dd $00000000 
    dw EnemyShot_CorpseSidehopper 
    dw EnemyShot_CorpseSidehopper 
    dw $0000 
    dl Tiles_SidehopperLarge 
    db $05 
    dw $0000 
    dw EnemyVulnerabilities_Corpse_BabyMetroid 
    dw $0000 

EnemyHeaders_CorpseZoomer:
    dw $0000 
    dw Palette_CorpseCommon 
    dw $03E8,$0000,$000A,$0008 
    db $A9,$00 
    dw $0000,$0000 
    dw InitAI_CorpseZoomer 
    dw $0001,$0000 
    dw MainAI_HurtAI_CorpseEnemies 
    dw CommonA9_GrappleAI_CancelGrappleBeam 
    dw RTL_A9804C 
    dw CommonA9_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw PowerBombReaction_CorpseZoomer 
    dw $0000 
    dd $00000000 
    dw EnemyTouch_EnemyShot_CorpseZoomer 
    dw EnemyTouch_EnemyShot_CorpseZoomer 
    dw $0000 
    dl Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree 
    db $05 
    dw $0000 
    dw EnemyVulnerabilities_Corpse_BabyMetroid 
    dw $0000 

EnemyHeaders_CorpseRipper:
    dw $0000 
    dw Palette_CorpseCommon 
    dw $03E8,$0000,$000B,$0006 
    db $A9,$00 
    dw $0000,$0000 
    dw InitAI_CorpseRipper 
    dw $0001,$0000 
    dw MainAI_HurtAI_CorpseEnemies 
    dw CommonA9_GrappleAI_CancelGrappleBeam 
    dw RTL_A9804C 
    dw CommonA9_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw PowerBombReaction_CorpseRipper 
    dw $0000 
    dd $00000000 
    dw EnemyTouch_EnemyShot_CorpseRipper 
    dw EnemyTouch_EnemyShot_CorpseRipper 
    dw $0000 
    dl Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree 
    db $05 
    dw $0000 
    dw EnemyVulnerabilities_Corpse_BabyMetroid 
    dw $0000 

EnemyHeaders_CorpseSkree:
    dw $0000 
    dw Palette_CorpseCommon 
    dw $03E8,$0000,$000C,$0010 
    db $A9,$00 
    dw $0000,$0000 
    dw InitAI_CorpseSkree 
    dw $0001,$0000 
    dw MainAI_HurtAI_CorpseEnemies 
    dw CommonA9_GrappleAI_CancelGrappleBeam 
    dw RTL_A9804C 
    dw CommonA9_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw PowerBombReaction_CorpseSkree 
    dw $0000 
    dd $00000000 
    dw EnemyTouch_EnemyShot_CorpseSkree 
    dw EnemyTouch_EnemyShot_CorpseSkree 
    dw $0000 
    dl Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree 
    db $05 
    dw $0000 
    dw EnemyVulnerabilities_Corpse_BabyMetroid 
    dw $0000 

EnemyHeaders_BabyMetroid:
    dw $0C00 
    dw Palette_BabyMetroid 
    dw $0C80,$0028,$0028,$0028 
    db $A9,$00 
    dw $0000,$0000 
    dw InitAI_BabyMetroid 
    dw $0001,$0000 
    dw MainAI_BabyMetroid 
    dw CommonA9_GrappleAI_CancelGrappleBeam 
    dw RTL_A9804C 
    dw CommonA9_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw PowerBombReaction_BabyMetroid 
    dw $0000 
    dd $00000000 
    dw EnemyTouch_BabyMetroid 
    dw EnemyShot_BabyMetroid 
    dw $0000 
    dl Tiles_BabyMetroid 
    db $02 
    dw $0000 
    dw EnemyVulnerabilities_Corpse_BabyMetroid 
    dw $0000 

EnemyHeaders_BombTorizo:
    dw $2000 
    dw Palette_Torizo_OrbProjectile 
    dw $0320,$0008,$0012,$0030 
    db $AA,$08 
    dw $0027,$0002 
    dw InitAI_Torizo 
    dw $0001,$0000 
    dw MainAI_BombTorizo 
    dw CommonAA_GrappleAI_CancelGrappleBeam 
    dw HurtAI_BombTorizo 
    dw CommonAA_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw EnemyTouch_Torizo 
    dw EnemyShot_Torizo_Normal 
    dw $0000 
    dl Tiles_BombTorizo_GoldenTorizo 
    db $05 
    dw EnemyDropChances_MotherBrainBody_BombTorizo 
    dw EnemyVulnerabilities_BombTorizo_BombTorizoOrb 
    dw $0000 

EnemyHeaders_BombTorizoOrb:
    dw $2000 
    dw Palette_Torizo_OrbProjectile 
    dw $0320,$0008,$0012,$0030 
    db $AA,$08 
    dw $0027,$0002 
    dw InitAI_Torizo 
    dw $0001,$0000 
    dw MainAI_BombTorizo 
    dw CommonAA_GrappleAI_CancelGrappleBeam 
    dw HurtAI_BombTorizo 
    dw CommonAA_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw EnemyTouch_Torizo 
    dw EnemyShot_Torizo_Normal 
    dw $0000 
    dl Tiles_BombTorizo_GoldenTorizo 
    db $05 
    dw EnemyDropChances_BombTorizoOrb 
    dw EnemyVulnerabilities_BombTorizo_BombTorizoOrb 
    dw $0000 

EnemyHeaders_GoldenTorizo:
    dw $2000 
    dw Palette_Torizo_OrbProjectile 
    dw $34BC,$00A0,$0012,$0030 
    db $AA,$08 
    dw $0027,$0002 
    dw InitAI_Torizo 
    dw $0001,$0000 
    dw MainAI_GoldenTorizo 
    dw CommonAA_GrappleAI_CancelGrappleBeam 
    dw HurtAI_GoldenTorizo 
    dw CommonAA_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw EnemyTouch_Torizo 
    dw ShotReaction_GoldenTorizo_Normal 
    dw $0000 
    dl Tiles_BombTorizo_GoldenTorizo 
    db $05 
    dw EnemyDropChances_GoldenTorizo 
    dw EnemyVulnerabilities_GoldenTorizo_GoldenTorizoOrb 
    dw $0000 

EnemyHeaders_GoldenTorizoOrb:
    dw $2000 
    dw Palette_Torizo_OrbProjectile 
    dw $34BC,$00A0,$0012,$0030 
    db $AA,$08 
    dw $0027,$0002 
    dw InitAI_Torizo 
    dw $0001,$0000 
    dw MainAI_GoldenTorizo 
    dw CommonAA_GrappleAI_CancelGrappleBeam 
    dw HurtAI_GoldenTorizo 
    dw CommonAA_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw EnemyTouch_Torizo 
    dw ShotReaction_GoldenTorizo_Normal 
    dw $0000 
    dl Tiles_BombTorizo_GoldenTorizo 
    db $05 
    dw EnemyDropChances_GoldenTorizoOrb 
    dw EnemyVulnerabilities_GoldenTorizo_GoldenTorizoOrb 
    dw $0000 

EnemyHeaders_TourianStatue:
    dw $1600 
    dw Palettes_TourianStatue_Ridley 
    dw $0BB8,$0BB8,$0000,$0000 
    db $AA,$00 
    dw $0000,$0000 
    dw InitAI_TourianStatue 
    dw $0001,$0000 
    dw MainAI_TourianStatue 
    dw CommonAA_GrappleAI_CancelGrappleBeam 
    dw RTL_AA804C 
    dw CommonAA_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw RTL_A0804C 
    dw $0000 
    dd $00000000 
    dw RTL_AA804C 
    dw RTL_AA804C 
    dw $0000 
    dl Tiles_TourianStatue 
    db $06 
    dw $0000 
    dw EnemyVulnerabilities_Default 
    dw $0000 

EnemyHeaders_TourianStatueGhost:
    dw $8600 
    dw Palettes_TourianStatue_Ridley 
    dw $0BB8,$0BB8,$0000,$0000 
    db $AA,$00 
    dw $0000,$0000 
    dw RTL_AA804C 
    dw $0001,$0000 
    dw RTL_AA804C 
    dw CommonAA_GrappleAI_CancelGrappleBeam 
    dw RTL_AA804C 
    dw CommonAA_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw RTL_A0804C 
    dw $0000 
    dd $00000000 
    dw RTL_AA804C 
    dw RTL_AA804C 
    dw $0000 
    dl Tiles_TourianStatuesSoul 
    db $06 
    dw $0000 
    dw EnemyVulnerabilities_Default 
    dw $0000 

EnemyHeaders_Shaktool:
    dw $0400 
    dw Palette_Shaktool 
    dw $012C,$0078,$0006,$0006 
    db $AA,$08 
    dw $0069,$0000 
    dw InitAI_Shaktool 
    dw $0007,$0000 
    dw MainAI_HurtAI_Shaktool 
    dw CommonAA_GrappleAI_CancelGrappleBeam 
    dw MainAI_HurtAI_Shaktool 
    dw CommonAA_NormalEnemyFrozenAI 
    dw $0000 
    dw $0004 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw EnemyTouch_Shaktool 
    dw EnemyShot_Shaktool 
    dw $0000 
    dl Tiles_Shaktool 
    db $05 
    dw EnemyDropChances_Shaktool 
    dw EnemyVulnerabilities_Shaktool 
    dw EnemyName_GoldenTorizo 

EnemyHeaders_NoobTubeCrack:
    dw $1800 
    dw Palette_NoobTubeCrack_Initial 
    dw $0014,$0028,$0000,$0000 
    db $AA,$00 
    dw $0000,$0000 
    dw InitAI_NoobTubeCrack 
    dw $0001,$0000 
    dw RTL_AA804C 
    dw CommonAA_GrappleAI_CancelGrappleBeam 
    dw RTL_AA804C 
    dw CommonAA_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw RTL_AA804C 
    dw RTL_AA804C 
    dw $0000 
    dl Tiles_NoobTubeCrack 
    db $05 
    dw EnemyDropChances_NoobTubeCrack_Chozo 
    dw EnemyVulnerabilities_Default 
    dw $0000 

EnemyHeaders_Chozo:
    dw $1200 
    dw Palette_Chozo_WreckedShip_SpritePalette1 
    dw $0014,$0028,$0010,$0024 
    db $AA,$00 
    dw $0000,$0000 
    dw InitAI_Chozo 
    dw $0001,$0000 
    dw MainAI_Chozo 
    dw CommonAA_GrappleAI_CancelGrappleBeam 
    dw RTL_AA804C 
    dw CommonAA_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw RTL_AAE7DB 
    dw RTL_AAE7DC 
    dw $0000 
    dl Tiles_Chozo 
    db $05 
    dw EnemyDropChances_NoobTubeCrack_Chozo 
    dw EnemyVulnerabilities_Indestructible 
    dw $0000 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_BunchOf2s_A0F13F:
    dw $0202,$0202,$0202,$0202,$0202,$0202,$0202,$0202 
    dw $0202,$0202 
endif ; !FEATURE_KEEP_UNREFERENCED

UNUSED_EnemyHeaders_SpinningTurtleEye_A0F153:
    dw $0200 
    dw UNUSED_Palette_SpinningTurtleEye_B38687 
    dw $0014,$0028,$0008,$0008 
    db $B3,$00 
    dw $0000,$0000 
    dw UNUSED_InitAI_SpinningTurtleEye_B386FB 
    dw $0001,$0000 
    dw UNUSED_MainAI_SpinningTurtleEye_B3870E 
    dw CommonB3_GrappleAI_CancelGrappleBeam 
    dw CommonB3_RTL_B3804C 
    dw CommonB3_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw CommonB3_NormalEnemyTouchAI 
    dw CommonB3_NormalEnemyShotAI 
    dw $0000 
    dl UNUSED_Tiles_SpinningTurtleEye_B7FB00 
    db $05 
    dw $0000 
    dw $0000 
    dw $0000 

EnemyHeaders_Zeb:
    dw $0400 
    dw Palette_Zeb 
    dw $0009,$0006,$0008,$0008 
    db $B3,$00 
    dw $0022,$0000 
    dw InitAI_Zeb_Zebbo 
    dw $0001,$0000 
    dw MainAI_Zeb_Zebbo 
    dw CommonB3_GrappleAI_KillEnemy 
    dw CommonB3_RTL_B3804C 
    dw CommonB3_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw CommonB3_NormalEnemyTouchAI 
    dw CommonB3_NormalEnemyShotAI 
    dw $0000 
    dl Tiles_Zeb 
    db $05 
    dw EnemyDropChances_Zeb 
    dw EnemyVulnerabilities_Default 
    dw EnemyName_Zeb 

EnemyHeaders_Zebbo:
    dw $0400 
    dw Palette_Zebbo 
    dw $001E,$0014,$0008,$0008 
    db $B3,$00 
    dw $0022,$0000 
    dw InitAI_Zeb_Zebbo 
    dw $0001,$0000 
    dw MainAI_Zeb_Zebbo 
    dw CommonB3_GrappleAI_KillEnemy 
    dw CommonB3_RTL_B3804C 
    dw CommonB3_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw CommonB3_NormalEnemyTouchAI 
    dw CommonB3_NormalEnemyShotAI 
    dw $0000 
    dl Tiles_Zebbo 
    db $05 
    dw EnemyDropChances_Zebbo 
    dw EnemyVulnerabilities_Default 
    dw EnemyName_Zebbo 

EnemyHeaders_Gamet:
    dw $0400 
    dw Palette_Gamet 
    dw $0014,$0010,$0008,$0008 
    db $B3,$00 
    dw $0022,$0000 
    dw InitAI_Gamet 
    dw $0005,$0000 
    dw MainAI_Gamet 
    dw CommonB3_GrappleAI_KillEnemy 
    dw CommonB3_RTL_B3804C 
    dw CommonB3_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw CommonB3_NormalEnemyTouchAI 
    dw CommonB3_NormalEnemyShotAI 
    dw $0000 
    dl Tiles_Gamet 
    db $05 
    dw EnemyDropChances_Gamet 
    dw EnemyVulnerabilities_Default 
    dw EnemyName_Gamet 

EnemyHeaders_Geega:
    dw $0400 
    dw Palette_Geega 
    dw $000A,$000A,$0008,$0008 
    db $B3,$00 
    dw $0022,$0000 
    dw InitAI_Geega 
    dw $0001,$0000 
    dw MainAI_Geega 
    dw CommonB3_GrappleAI_KillEnemy 
    dw CommonB3_RTL_B3804C 
    dw CommonB3_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw CommonB3_NormalEnemyTouchAI 
    dw CommonB3_NormalEnemyShotAI 
    dw $0000 
    dl Tiles_Geega 
    db $05 
    dw EnemyDropChances_Geega 
    dw EnemyVulnerabilities_Default 
    dw EnemyName_Geega 

EnemyHeaders_Botwoon:
    dw $1800 
    dw Palette_Botwoon 
    dw $0BB8,$0078,$0008,$0008 
    db $B3,$00 
    dw $005F,$0009 
    dw InitAI_Botwoon 
    dw $0001,$0000 
    dw MainAI_Botwoon 
    dw CommonB3_GrappleAI_CancelGrappleBeam 
    dw CommonB3_RTL_B3804C 
    dw CommonB3_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw PowerBombReaction_Botwoon 
    dw $0000 
    dd $00000000 
    dw EnemyTouch_Botwoon 
    dw EnemyShot_Botwoon 
    dw $0000 
    dl Tiles_Botwoon 
    db $05 
    dw EnemyDropChances_Botwoon 
    dw EnemyVulnerabilities_Botwoon 
    dw EnemyName_Botwoon 

EnemyHeaders_EtecoonEscape:
    dw $0600 
    dw Palette_EtecoonEscape 
    dw $0BB8,$0BB8,$0006,$0008 
    db $B3,$00 
    dw $0000,$0000 
    dw InitAI_EtecoonEscape 
    dw $0001,$0000 
    dw MainAI_EtecoonEscape 
    dw CommonB3_GrappleAI_NoInteraction 
    dw CommonB3_RTL_B3804C 
    dw CommonB3_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw RTL_A0804C 
    dw $0000 
    dd $00000000 
    dw CommonB3_RTL_B3804C 
    dw CommonB3_RTL_B3804C 
    dw $0000 
    dl Tiles_Etecoon 
    db $05 
    dw EnemyDropChances_Etecoon_EtecoonEscape 
    dw $0000 
    dw $0000 

EnemyHeaders_DachoraEscape:
    dw $0C00 
    dw Palette_DachoraEscape 
    dw $0BB8,$0BB8,$0008,$0018 
    db $B3,$00 
    dw $0000,$0000 
    dw InitAI_DachoraEscape 
    dw $0001,$0000 
    dw RTL_B3EB1A 
    dw CommonB3_GrappleAI_NoInteraction 
    dw CommonB3_RTL_B3804C 
    dw CommonB3_NormalEnemyFrozenAI 
    dw $0000 
    dw $0000 
    dd $00000000 
    dw RTL_A0804C 
    dw $0000 
    dd $00000000 
    dw CommonB3_RTL_B3804C 
    dw CommonB3_RTL_B3804C 
    dw $0000 
    dl Tiles_Dachora 
    db $05 
    dw EnemyDropChances_Steam_Dachora_DachoraEscape 
    dw $0000 
    dw $0000 

EnemyHeaders_PirateGreyWall:
    dw $0C00 
    dw Palette_Pirate_Grey 
    dw $0014,$000F,$0010,$0018 
    db $B2,$00 
    dw $0021,$0000 
    dw InitAI_PirateWall 
    dw $0001,$0000 
    dw MainAI_PirateWall 
    dw CommonB2_GrappleAI_CancelGrappleBeam 
    dw RTL_B2804C 
    dw CommonB2_NormalEnemyFrozenAI 
    dw $0000 
    dw $0004 
    dd $00000000 
    dw PowerBombReaction_Ninja_Walking_GreyWall 
    dw $0000 
    dd $00000000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 
    dw $0000 
    dl Tiles_SpacePirate 
    db $05 
    dw EnemyDropChances_PirateGreyWall 
    dw EnemyVulnerabilities_PirateGreyWall 
    dw EnemyName_PirateGreyWall 

EnemyHeaders_PirateGreenWall:
    dw $0C00 
    dw Palette_Pirate_Green 
    dw $005A,$0014,$0010,$0018 
    db $B2,$00 
    dw $0021,$0000 
    dw InitAI_PirateWall 
    dw $0001,$0000 
    dw MainAI_PirateWall 
    dw CommonB2_GrappleAI_CancelGrappleBeam 
    dw RTL_B2804C 
    dw CommonB2_NormalEnemyFrozenAI 
    dw $0000 
    dw $0004 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 
    dw $0000 
    dl Tiles_SpacePirate 
    db $05 
    dw EnemyDropChances_PirateGreenWall 
    dw EnemyVulnerabilities_PirateGreyWall 
    dw EnemyName_PirateGreenWall 

EnemyHeaders_PirateRedWall:
    dw $0C00 
    dw Palette_Pirate_Red 
    dw $00C8,$0050,$0010,$0018 
    db $B2,$00 
    dw $0021,$0000 
    dw InitAI_PirateWall 
    dw $0001,$0000 
    dw MainAI_PirateWall 
    dw CommonB2_GrappleAI_CancelGrappleBeam 
    dw RTL_B2804C 
    dw CommonB2_NormalEnemyFrozenAI 
    dw $0000 
    dw $0004 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 
    dw $0000 
    dl Tiles_SpacePirate 
    db $05 
    dw EnemyDropChances_PirateRedWall 
    dw EnemyVulnerabilities_PirateRedWall 
    dw EnemyName_PirateRedWall 

EnemyHeaders_PirateGoldWall:
    dw $0C00 
    dw Palette_Pirate_Gold_NonNinja 
    dw $0384,$00C8,$0010,$0018 
    db $B2,$00 
    dw $0021,$0000 
    dw InitAI_PirateWall 
    dw $0001,$0000 
    dw MainAI_PirateWall 
    dw CommonB2_GrappleAI_CancelGrappleBeam 
    dw RTL_B2804C 
    dw CommonB2_NormalEnemyFrozenAI 
    dw $0000 
    dw $0004 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 
    dw $0000 
    dl Tiles_SpacePirate 
    db $05 
    dw EnemyDropChances_PirateGoldWall 
    dw EnemyVulnerabilities_PirateGoldWall_PirateGoldWalking 
    dw EnemyName_PirateGoldWall 

EnemyHeaders_PirateMagentaWall:
    dw $0C00 
    dw Palette_Pirate_Magenta 
    dw $012C,$00A0,$0010,$0018 
    db $B2,$00 
    dw $0021,$0000 
    dw InitAI_PirateWall 
    dw $0001,$0000 
    dw MainAI_PirateWall 
    dw CommonB2_GrappleAI_CancelGrappleBeam 
    dw RTL_B2804C 
    dw CommonB2_NormalEnemyFrozenAI 
    dw $0000 
    dw $0004 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 
    dw $0000 
    dl Tiles_SpacePirate 
    db $05 
    dw EnemyDropChances_PirateMagentaWall 
    dw EnemyVulnerabilities_PirateMagentaWall 
    dw EnemyName_PirateMagentaWall 

EnemyHeaders_PirateSilverWall:
    dw $0C00 
    dw Palette_Pirate_Silver_GoldNinja 
    dw $01F4,$000F,$0010,$0018 
    db $B2,$00 
    dw $0021,$0000 
    dw InitAI_PirateWall 
    dw $0001,$0000 
    dw MainAI_PirateWall 
    dw CommonB2_GrappleAI_CancelGrappleBeam 
    dw RTL_B2804C 
    dw CommonB2_NormalEnemyFrozenAI 
    dw $0000 
    dw $0004 
    dd $00000000 
    dw $0000,$0000 
    dd $00000000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 
    dw $0000 
    dl Tiles_SpacePirate 
    db $05 
    dw EnemyDropChances_PirateSilverWall 
    dw EnemyVulnerabilities_PirateSilverWall_PirateSilverWalking 
    dw EnemyName_PirateSilverWall 

EnemyHeaders_PirateGreyNinja:
    dw $1800 
    dw Palette_Pirate_Grey 
    dw $0014,$000F,$0010,$0020 
    db $B2,$00 
    dw $0021,$0000 
    dw InitAI_PirateNinja 
    dw $0001,$0000 
    dw MainAI_PirateNinja 
    dw CommonB2_GrappleAI_CancelGrappleBeam 
    dw RTL_B2804C 
    dw CommonB2_NormalEnemyFrozenAI 
    dw $0000 
    dw $0004 
    dd $00000000 
    dw PowerBombReaction_Ninja_Walking_GreyWall 
    dw $0000 
    dd $00000000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 
    dw $0000 
    dl Tiles_SpacePirate 
    db $05 
    dw EnemyDropChances_PirateGreyNinja 
    dw EnemyVulnerabilities_PirateNinja_Grey_Green_Red_Magenta 
    dw EnemyName_PirateGreyNinja 

EnemyHeaders_PirateGreenNinja:
    dw $1800 
    dw Palette_Pirate_Green 
    dw $005A,$0014,$0010,$0020 
    db $B2,$00 
    dw $0021,$0000 
    dw InitAI_PirateNinja 
    dw $0001,$0000 
    dw MainAI_PirateNinja 
    dw CommonB2_GrappleAI_CancelGrappleBeam 
    dw RTL_B2804C 
    dw CommonB2_NormalEnemyFrozenAI 
    dw $0000 
    dw $0004 
    dd $00000000 
    dw PowerBombReaction_Ninja_Walking_GreyWall 
    dw $0000 
    dd $00000000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 
    dw $0000 
    dl Tiles_SpacePirate 
    db $05 
    dw EnemyDropChances_PirateGreenNinja 
    dw EnemyVulnerabilities_PirateNinja_Grey_Green_Red_Magenta 
    dw EnemyName_PirateGreenNinja 

EnemyHeaders_PirateRedNinja:
    dw $1800 
    dw Palette_Pirate_Red 
    dw $00C8,$0050,$0010,$0020 
    db $B2,$00 
    dw $0021,$0000 
    dw InitAI_PirateNinja 
    dw $0001,$0001 
    dw MainAI_PirateNinja 
    dw CommonB2_GrappleAI_CancelGrappleBeam 
    dw RTL_B2804C 
    dw CommonB2_NormalEnemyFrozenAI 
    dw $0000 
    dw $0004 
    dd $00000000 
    dw PowerBombReaction_Ninja_Walking_GreyWall 
    dw $0000 
    dd $00000000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 
    dw $0000 
    dl Tiles_SpacePirate 
    db $05 
    dw EnemyDropChances_PirateRedNinja 
    dw EnemyVulnerabilities_PirateNinja_Grey_Green_Red_Magenta 
    dw EnemyName_PirateRedNinja 

EnemyHeaders_PirateGoldNinja:
    dw $1800 
    dw Palette_Pirate_Silver_GoldNinja 
    dw $0708,$0064,$0010,$0020 
    db $B2,$00 
    dw $0021,$0000 
    dw InitAI_PirateNinja 
    dw $0001,$0000 
    dw MainAI_PirateNinja 
    dw CommonB2_GrappleAI_CancelGrappleBeam 
    dw RTL_B2804C 
    dw CommonB2_NormalEnemyFrozenAI 
    dw $0000 
    dw $0004 
    dd $00000000 
    dw PowerBombReaction_Ninja_Walking_GreyWall 
    dw $0000 
    dd $00000000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 
    dw $0000 
    dl Tiles_SpacePirate 
    db $05 
    dw EnemyDropChances_PirateGoldNinja 
    dw EnemyVulnerabilities_PirateGoldNinja 
    dw EnemyName_PirateGoldNinja 

EnemyHeaders_PirateMagentaNinja:
    dw $1800 
    dw Palette_Pirate_Magenta 
    dw $012C,$00A0,$0010,$0020 
    db $B2,$00 
    dw $0021,$0000 
    dw InitAI_PirateNinja 
    dw $0001,$0000 
    dw MainAI_PirateNinja 
    dw CommonB2_GrappleAI_CancelGrappleBeam 
    dw RTL_B2804C 
    dw CommonB2_NormalEnemyFrozenAI 
    dw $0000 
    dw $0004 
    dd $00000000 
    dw PowerBombReaction_Ninja_Walking_GreyWall 
    dw $0000 
    dd $00000000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 
    dw $0000 
    dl Tiles_SpacePirate 
    db $05 
    dw EnemyDropChances_PirateMagentaNinja 
    dw EnemyVulnerabilities_PirateNinja_Grey_Green_Red_Magenta 
    dw EnemyName_PirateMagentaNinja 

EnemyHeaders_PirateSilverNinja:
    dw $1800 
    dw Palette_Pirate_Silver_GoldNinja 
    dw $01F4,$000F,$0010,$0020 
    db $B2,$00 
    dw $0021,$0000 
    dw InitAI_PirateNinja 
    dw $0001,$0000 
    dw MainAI_PirateNinja 
    dw CommonB2_GrappleAI_CancelGrappleBeam 
    dw RTL_B2804C 
    dw CommonB2_NormalEnemyFrozenAI 
    dw $0000 
    dw $0004 
    dd $00000000 
    dw PowerBombReaction_Ninja_Walking_GreyWall 
    dw $0000 
    dd $00000000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 
    dw $0000 
    dl Tiles_SpacePirate 
    db $05 
    dw EnemyDropChances_PirateSilverNinja 
    dw EnemyVulnerabilities_PirateSilverNinja 
    dw EnemyName_PirateSilverNinja 

EnemyHeaders_PirateGreyWalking:
    dw $0C00 
    dw Palette_Pirate_Grey 
    dw $0014,$000F,$0010,$0020 
    db $B2,$00 
    dw $0066,$0000 
    dw InitAI_PirateWalking 
    dw $0001,$0000 
    dw MainAI_PirateWalking 
    dw CommonB2_GrappleAI_CancelGrappleBeam 
    dw RTL_B2804C 
    dw CommonB2_NormalEnemyFrozenAI 
    dw $0000 
    dw $0004 
    dd $00000000 
    dw PowerBombReaction_Ninja_Walking_GreyWall 
    dw $0000 
    dd $00000000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 
    dw $0000 
    dl Tiles_SpacePirate 
    db $05 
    dw EnemyDropChances_PirateGreyWalking 
    dw EnemyVulnerabilities_PirateGreyWalking 
    dw EnemyName_PirateGreyWalking 

EnemyHeaders_PirateGreenWalking:
    dw $0C00 
    dw Palette_Pirate_Green 
    dw $005A,$0014,$0010,$0020 
    db $B2,$00 
    dw $0066,$0000 
    dw InitAI_PirateWalking 
    dw $0001,$0000 
    dw MainAI_PirateWalking 
    dw CommonB2_GrappleAI_CancelGrappleBeam 
    dw RTL_B2804C 
    dw CommonB2_NormalEnemyFrozenAI 
    dw $0000 
    dw $0004 
    dd $00000000 
    dw PowerBombReaction_Ninja_Walking_GreyWall 
    dw $0000 
    dd $00000000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 
    dw $0000 
    dl Tiles_SpacePirate 
    db $05 
    dw EnemyDropChances_PirateGreenWalking 
    dw EnemyVulnerabilities_PirateGreenWalking 
    dw EnemyName_PirateGreenWalking 

EnemyHeaders_PirateRedWalking:
    dw $0C00 
    dw Palette_Pirate_Red 
    dw $00C8,$0050,$0010,$0020 
    db $B2,$00 
    dw $0066,$0000 
    dw InitAI_PirateWalking 
    dw $0001,$0000 
    dw MainAI_PirateWalking 
    dw CommonB2_GrappleAI_CancelGrappleBeam 
    dw RTL_B2804C 
    dw CommonB2_NormalEnemyFrozenAI 
    dw $0000 
    dw $0004 
    dd $00000000 
    dw PowerBombReaction_Ninja_Walking_GreyWall 
    dw $0000 
    dd $00000000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 
    dw $0000 
    dl Tiles_SpacePirate 
    db $05 
    dw EnemyDropChances_PirateRedWalking 
    dw EnemyVulnerabilities_PirateRedWalking 
    dw EnemyName_PirateRedWalking 

EnemyHeaders_PirateGoldWalking:
    dw $0C00 
    dw Palette_Pirate_Gold_NonNinja 
    dw $0384,$00C8,$0010,$0020 
    db $B2,$00 
    dw $0066,$0000 
    dw InitAI_PirateWalking 
    dw $0001,$0000 
    dw MainAI_PirateWalking 
    dw CommonB2_GrappleAI_CancelGrappleBeam 
    dw RTL_B2804C 
    dw CommonB2_NormalEnemyFrozenAI 
    dw $0000 
    dw $0004 
    dd $00000000 
    dw PowerBombReaction_Ninja_Walking_GreyWall 
    dw $0000 
    dd $00000000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 
    dw $0000 
    dl Tiles_SpacePirate 
    db $05 
    dw EnemyDropChances_PirateGoldWalking 
    dw EnemyVulnerabilities_PirateGoldWall_PirateGoldWalking 
    dw EnemyName_PirateGoldWalking 

EnemyHeaders_PirateMagentaWalking:
    dw $0C00 
    dw Palette_Pirate_Magenta 
    dw $012C,$00A0,$0010,$0020 
    db $B2,$00 
    dw $0066,$0000 
    dw InitAI_PirateWalking 
    dw $0001,$0000 
    dw MainAI_PirateWalking 
    dw CommonB2_GrappleAI_CancelGrappleBeam 
    dw RTL_B2804C 
    dw CommonB2_NormalEnemyFrozenAI 
    dw $0000 
    dw $0004 
    dd $00000000 
    dw PowerBombReaction_Ninja_Walking_GreyWall 
    dw $0000 
    dd $00000000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 
    dw $0000 
    dl Tiles_SpacePirate 
    db $05 
    dw EnemyDropChances_PirateMagentaWalking 
    dw EnemyVulnerabilities_PirateMagentaWalking 
    dw EnemyName_PirateMagentaWalking 

EnemyHeaders_PirateSilverWalking:
    dw $0C00 
    dw Palette_Pirate_Silver_GoldNinja 
    dw $01F4,$000F,$0010,$0020 
    db $B2,$00 
    dw $0066,$0000 
    dw InitAI_PirateWalking 
    dw $0001,$0000 
    dw MainAI_PirateWalking 
    dw CommonB2_GrappleAI_CancelGrappleBeam 
    dw RTL_B2804C 
    dw CommonB2_NormalEnemyFrozenAI 
    dw $0000 
    dw $0004 
    dd $00000000 
    dw PowerBombReaction_Ninja_Walking_GreyWall 
    dw $0000 
    dd $00000000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 
    dw $0000 
    dl Tiles_SpacePirate 
    db $05 
    dw EnemyDropChances_PirateSilverWalking 
    dw EnemyVulnerabilities_PirateSilverWall_PirateSilverWalking 
    dw EnemyName_PirateSilverWalking 

Freespace_BankA0_F7D3: 
; $82D bytes
