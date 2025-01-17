
org $A88000


CommonA8_GrappleAI_NoInteraction:
    JSL.L GrappleAI_SwitchEnemyAIToMainAI 
    RTL 


CommonA8_GrappleAI_SamusLatchesOn:
    JSL.L GrappleAI_SamusLatchesOnWithGrapple 
    RTL 


CommonA8_GrappleAI_KillEnemy:
    JSL.L GrappleAI_EnemyGrappleDeath 
    RTL 


CommonA8_GrappleAI_CancelGrappleBeam:
    JSL.L GrappleAI_SwitchToFrozenAI 
    RTL 


CommonA8_GrappleAI_SamusLatchesOn_NoInvincibility:
    JSL.L GrappleAI_SamusLatchesOnWithGrapple_NoInvincibility 
    RTL 


UNUSED_CommonA8_GrappleAI_SamusLatchesOn_ParalyzeEnemy_A88019:
    JSL.L GrappleAI_SamusLatchesOnWithGrapple_ParalyzeEnemy 
    RTL 


CommonA8_GrappleAI_HurtSamus:
    JSL.L GrappleAI_SwitchToFrozenAI_duplicate 
    RTL 


CommonA8_NormalEnemyTouchAI:
    JSL.L NormalEnemyTouchAI 
    RTL 


CommonA8_NormalTouchAI_NoDeathCheck:
    JSL.L NormalEnemyTouchAI_NoDeathCheck_External 
    RTL 


CommonA8_NormalEnemyShotAI:
    JSL.L NormalEnemyShotAI 
    RTL 


CommonA8_NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic:
    JSL.L NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External 
    RTL 


CommonA8_NormalEnemyPowerBombAI:
    JSL.L NormalEnemyPowerBombAI 
    RTL 


CommonA8_NormalEnemyPowerBombAI_NoDeathCheck:
    JSL.L NormalEnemyPowerBombAI_NoDeathCheck_External 
    RTL 


CommonA8_NormalEnemyFrozenAI:
    JSL.L NormalEnemyFrozenAI 
    RTL 


CommonA8_CreateADudShot:
    JSL.L CreateADudShot 
    RTL 


RTS_A8804B:
    RTS 


RTL_A8804C:
    RTL 


Spritemap_CommonA8_Nothing:
    dw $0000 

ExtendedSpritemap_CommonA8_Nothing:
    dw $0001,$0000,$0000 
    dw Spritemap_CommonA8_Nothing 
    dw Hitbox_CommonA8_Nothing 

Hitbox_CommonA8_Nothing:
    dw $0001,$0000,$0000,$0000,$0000 
    dw CommonA8_NormalEnemyTouchAI 
    dw CommonA8_NormalEnemyShotAI 

InstList_CommonA8_DeleteEnemy:
    dw Instruction_CommonA8_DeleteEnemy 

NOPNOP_A88069:
    NOP #2
    Instruction_CommonA8_Enemy0FB2_InY:
    LDA.W $0000,Y : STA.W $0FB2,X 
    INY #2
    RTL 


Instruction_CommonA8_SetEnemy0FB2ToRTS:
    LDA.W #RTS_A8807B : STA.W $0FB2,X 
    RTL 


RTS_A8807B:
    RTS 


Instruction_CommonA8_DeleteEnemy:
    LDA.W $0F86,X : ORA.W #$0200 : STA.W $0F86,X 
    PLA : PEA.W ProcessEnemyInstructions_return-1 
    RTL 


Instruction_CommonA8_CallFunctionInY:
    LDA.W $0000,Y : STA.B $12 
    PHY : PHX : PEA.W .manualReturn-1 
    JMP.W ($0012) 


.manualReturn:
    PLX : PLY 
    INY #2
    RTL 


Instruction_CommonA8_CallFunctionInY_WithA:
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
UNUSED_Instruction_CommonA8_CallExternalFunctionInY_A880B5:
    LDA.W $0000,Y : STA.B $12 
    LDA.W $0001,Y : STA.B $13 
    PHX : PHY 
    JSL.L .externalFunction 
    PLY : PLX 
    INY #3
    RTL 


.externalFunction:
    JML.W [$0012] 


UNUSED_Inst_CommonA8_CallExternalFunctionInY_WithA_A880CE:
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


Instruction_CommonA8_GotoY:
    LDA.W $0000,Y 
    TAY 
    RTL 


Instruction_CommonA8_GotoY_PlusY:
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


Instruction_CommonA8_DecrementTimer_GotoYIfNonZero:
    DEC.W $0F90,X 
    BNE Instruction_CommonA8_GotoY 
    INY #2
    RTL 


Instruction_CommonA8_DecrementTimer_GotoYIfNonZero_duplicate:
    DEC.W $0F90,X 
    BNE Instruction_CommonA8_GotoY 
    INY #2
    RTL 


Instruction_CommonA8_DecrementTimer_GotoY_PlusY_IfNonZero:
    SEP #$20 
    DEC.W $0F90,X 
    REP #$20 
    BNE Instruction_CommonA8_GotoY_PlusY 
    INY 
    RTL 


Instruction_CommonA8_TimerInY:
    LDA.W $0000,Y : STA.W $0F90,X 
    INY #2
    RTL 


Instruction_CommonA8_SkipNextInstruction:
    INY #2
    RTL 


Instruction_CommonA8_Sleep:
    DEY #2
    TYA 
    STA.W $0F92,X 
    PLA : PEA.W ProcessEnemyInstructions_return-1 
    RTL 


Instruction_CommonA8_WaitYFrames:
    LDA.W $0000,Y : STA.W $0F94,X 
    INY #2
    TYA 
    STA.W $0F92,X 
    PLA : PEA.W ProcessEnemyInstructions_return-1 
    RTL 


Instruction_CommonA8_TransferYBytesInYToVRAM:
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


Instruction_CommonA8_EnableOffScreenProcessing:
    LDA.W $0F86,X : ORA.W #$0800 : STA.W $0F86,X 
    RTL 


Instruction_CommonA8_DisableOffScreenProcessing:
    LDA.W $0F86,X : AND.W #$F7FF : STA.W $0F86,X 
    RTL 


CommonA8EnemySpeeds_LinearlyIncreasing:
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

CommonA8EnemySpeeds_QuadraticallyIncreasing:
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

Palette_Evir:
    dw $3800,$57FF,$42F7,$0929,$00A5,$4F5A,$36B5,$2610 
    dw $158C,$03FF,$02B9,$0170,$0069,$0BB1,$1EA9,$0145 

InstList_Evir_Body_FacingLeft:
    dw $000A 
    dw Spritemap_Evir_0 
    dw $000A 
    dw Spritemap_Evir_1 
    dw $000A 
    dw Spritemap_Evir_2 
    dw $000A 
    dw Spritemap_Evir_3 
    dw $000A 
    dw Spritemap_Evir_4 
    dw $000A 
    dw Spritemap_Evir_5 
    dw Instruction_Common_GotoY 
    dw InstList_Evir_Body_FacingLeft 

InstList_Evir_Arms_FacingLeft:
    dw $000A 
    dw Spritemap_Evir_6 
    dw $000A 
    dw Spritemap_Evir_7 
    dw $000A 
    dw Spritemap_Evir_8 
    dw $000A 
    dw Spritemap_Evir_9 
    dw $000A 
    dw Spritemap_Evir_6 
    dw $000A 
    dw Spritemap_Evir_7 
    dw $000A 
    dw Spritemap_Evir_8 
    dw $000A 
    dw Spritemap_Evir_9 
    dw $000A 
    dw Spritemap_Evir_6 
    dw $000A 
    dw Spritemap_Evir_7 
    dw $000A 
    dw Spritemap_Evir_8 
    dw $000A 
    dw Spritemap_Evir_9 
    dw $000A 
    dw Spritemap_Evir_6 
    dw $000A 
    dw Spritemap_Evir_7 
    dw $000A 
    dw Spritemap_Evir_8 
    dw $000A 
    dw Spritemap_Evir_9 
    dw $0030 
    dw Spritemap_Evir_A 
    dw Instruction_Common_GotoY 
    dw InstList_Evir_Arms_FacingLeft 

InstList_Evir_Body_FacingRight:
    dw $000A 
    dw Spritemap_Evir_D 
    dw $000A 
    dw Spritemap_Evir_E 
    dw $000A 
    dw Spritemap_Evir_F 
    dw $000A 
    dw Spritemap_Evir_10 
    dw $000A 
    dw Spritemap_Evir_11 
    dw $000A 
    dw Spritemap_Evir_12 
    dw Instruction_CommonA8_GotoY 
    dw InstList_Evir_Body_FacingRight 

InstList_Evir_Arms_FacingRight:
    dw $000A 
    dw Spritemap_Evir_13 
    dw $000A 
    dw Spritemap_Evir_14 
    dw $000A 
    dw Spritemap_Evir_15 
    dw $000A 
    dw Spritemap_Evir_16 
    dw $000A 
    dw Spritemap_Evir_13 
    dw $000A 
    dw Spritemap_Evir_14 
    dw $000A 
    dw Spritemap_Evir_15 
    dw $000A 
    dw Spritemap_Evir_16 
    dw $000A 
    dw Spritemap_Evir_13 
    dw $000A 
    dw Spritemap_Evir_14 
    dw $000A 
    dw Spritemap_Evir_15 
    dw $000A 
    dw Spritemap_Evir_16 
    dw $000A 
    dw Spritemap_Evir_13 
    dw $000A 
    dw Spritemap_Evir_14 
    dw $000A 
    dw Spritemap_Evir_15 
    dw $000A 
    dw Spritemap_Evir_16 
    dw $0030 
    dw Spritemap_Evir_17 
    dw Instruction_Common_GotoY 
    dw InstList_Evir_Arms_FacingRight 

InstList_Evir_Projectile_Normal:
    dw $0001 
    dw Spritemap_Evir_C 
    dw Instruction_Common_Sleep 

InstList_Evir_Projectile_Regenerating_0:
    dw Instruction_Evir_SetInitialRegenerationXOffset 
    dw Instruction_Common_TimerInY 
    dw $0008 
    dw Instruction_Evir_PlaySpitSFX 

InstList_Evir_Projectile_Regenerating_1:
    dw $0008 
    dw Spritemap_Evir_B 
    dw Instruction_Evir_AdvanceRegenerationXOffset 
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate 
    dw InstList_Evir_Projectile_Regenerating_1 
    dw $0010 
    dw Spritemap_Evir_C 
    dw Instruction_Evir_FinishRegeneration 
    dw Instruction_Common_Sleep 

Instruction_Evir_PlaySpitSFX:
    PHX : PHY 
    LDA.W #$005E : JSL.L QueueSound_Lib2_Max6 
    PLY : PLX 
    RTL 


Instruction_Evir_SetInitialRegenerationXOffset:
    LDX.W $0E54 
    LDA.L $7E7782,X : CMP.W #InstList_Evir_Body_FacingRight : BEQ .facingRight 
    LDA.W #$0008 : STA.W $0FB2,X 
    BRA .return 


.facingRight:
    LDA.W #$FFF8 : STA.W $0FB2,X 

.return:
    RTL 


Instruction_Evir_AdvanceRegenerationXOffset:
    LDX.W $0E54 
    LDA.L $7E7782,X : CMP.W #InstList_Evir_Body_FacingRight : BEQ .facingRight 
    DEC.W $0FB2,X 
    BRA .return 


.facingRight:
    INC.W $0FB2,X 

.return:
    RTL 


Instruction_Evir_FinishRegeneration:
    LDX.W $0E54 
    LDA.W #$0000 : STA.L $7E7818,X 
    STA.L $7E7816,X 
    LDA.W #Function_EvirProjectile_Idle : STA.W $0FAC,X 
    RTL 


InitAI_Evir:
    LDX.W $0E54 
    LDA.W $0FB4,X : BNE .nonZeroParam1 
    JSR.W SetEvirFacingDirection 
    LDA.W $0FB6,X : AND.W #$00FF 
    ASL #3
    TAY 
    LDA.W CommonEnemySpeeds_LinearlyIncreasing,Y : STA.L $7E7808,X 
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+2,Y : STA.L $7E7806,X 
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+4,Y : STA.L $7E780C,X 
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+6,Y : STA.L $7E780A,X 
    LDA.W $0FB7,Y : AND.W #$00FF 
    LSR A 
    STA.W $0FB0,X 
    BRA + 


.nonZeroParam1:
    JSR.W HandleEvirArms 
    LDA.W #$0004 : STA.W $0F9A,X 

  + LDA.W #$0000 : STA.L $7E7800,X 
    STA.L $7E7802,X 
    LDA.W #Function_Evir_HandleBodyArms : STA.W $0FAC,X 
    RTL 


SetEvirFacingDirection:
    LDX.W $0E54 
    JSL.L Get_SamusX_minus_EnemyX 
    BPL .SamusToTheRight 
    LDA.W #$0000 : STA.W $0FAA,X 
    BRA + 


.SamusToTheRight:
    LDA.W #$0001 : STA.W $0FAA,X 

  + LDA.W #InstList_Evir_Body_FacingLeft : STA.L $7E7804,X 
    LDA.W $0FAA,X : BEQ .keepLeft 
    LDA.W #InstList_Evir_Body_FacingRight : STA.L $7E7804,X 

.keepLeft:
    JSR.W SetEvirInstList 
    RTS 


HandleEvirArms:
    LDX.W $0E54 
    LDA.W $0F6A,X : STA.W $0FAA,X 
    BNE .facingRight 
    LDA.W $0F3A,X : SEC : SBC.W #$0004 : STA.W $0F7A,X 
    LDA.W $0F3E,X : CLC : ADC.W #$000A : STA.W $0F7E,X 
    LDA.W #InstList_Evir_Arms_FacingLeft : STA.L $7E7804,X 
    JSR.W SetEvirInstList 
    BRA .return 


.facingRight:
    LDA.W $0F3A,X : CLC : ADC.W #$0004 : STA.W $0F7A,X 
    LDA.W $0F3E,X : CLC : ADC.W #$000A : STA.W $0F7E,X 
    LDA.W #InstList_Evir_Arms_FacingRight : STA.L $7E7804,X 
    JSR.W SetEvirInstList 

.return:
    RTS 


InitAI_EvirProjectile:
    LDX.W $0E54 
    LDA.W #InstList_Evir_Projectile_Normal : STA.L $7E7804,X 
    JSR.W SetEvirInstList 
    LDA.W $0F16,X : STA.W $0F96,X 
    LDA.W $0F18,X : STA.W $0F98,X 
    JSR.W ResetEvirProjectilePosition 
    LDA.W #$0000 : STA.L $7E7802,X 
    STA.L $7E7818,X 
    STA.L $7E7816,X 
    STA.W $0FB2,X 
    LDA.W #Function_EvirProjectile_Idle : STA.W $0FAC,X 
    RTL 


ResetEvirProjectilePosition:
    LDX.W $0E54 
    LDA.W $0F2A,X : STA.W $0FAA,X 
    BNE .notUp 
    LDA.W $0EFA,X : SEC : SBC.W #$0004 : STA.W $0F7A,X 
    LDA.W $0EFE,X : CLC : ADC.W #$0012 : STA.W $0F7E,X 
    BRA .return 


.notUp:
    LDA.W $0EFA,X : CLC : ADC.W #$0004 : STA.W $0F7A,X 
    LDA.W $0EFE,X : CLC : ADC.W #$0012 : STA.W $0F7E,X 

.return:
    RTS 


MainAI_Evir:
    LDX.W $0E54 
    JSR.W ($0FAC,X) 
    RTL 


Function_Evir_HandleBodyArms:
    LDX.W $0E54 
    LDA.W $0FB4,X : BNE .notMaster 
    JSR.W HandleEvirBody 
    BRA .return 


.notMaster:
    JSR.W Call_HandleEvirArms 

.return:
    RTS 


HandleEvirBody:
    LDX.W $0E54 
    LDA.L $7E7898,X : BNE .directionChosen 
    JSR.W SetEvirFacingDirection 

.directionChosen:
    LDA.L $7E7800,X : BNE .sinking 
    LDA.W $0F7E,X : CLC : ADC.L $7E780C,X : STA.W $0F7E,X 
    LDA.W $0F80,X : CLC : ADC.L $7E780A,X : BCC .storeYSubPosition 
    INC.W $0F7E,X 

.storeYSubPosition:
    STA.W $0F80,X 
    BRA + 


.sinking:
    LDA.W $0F7E,X : CLC : ADC.L $7E7808,X : STA.W $0F7E,X 
    LDA.W $0F80,X : CLC : ADC.L $7E7806,X : BCC ..storeYSubPosition 
    INC.W $0F7E,X 

..storeYSubPosition:
    STA.W $0F80,X 

  + DEC.W $0FB0,X 
    BPL .return 
    LDA.W $0FB7,X : AND.W #$00FF : STA.W $0FB0,X 
    LDA.L $7E7800,X : EOR.W #$0001 : STA.L $7E7800,X 

.return:
    RTS 


Call_HandleEvirArms:
    LDX.W $0E54 ; >.<
    JSR.W HandleEvirArms 
    RTS 


MainAI_EvirProjectile:
    LDX.W $0E54 
    LDA.W $0F9E,X : BNE .merge 
    LDA.L $7E7816,X : BEQ .angleInitialized 
    LDA.W $0FAA,X ; >_<
    LDA.W #InstList_Evir_Projectile_Normal : STA.L $7E7804,X 
    JSR.W SetEvirInstList 
    BRA .merge 


.angleInitialized:
    LDA.L $7E7818,X : BEQ .doneSpawning 
    LDA.W #InstList_Evir_Projectile_Regenerating_0 : STA.L $7E7804,X 
    JSR.W SetEvirInstList 
    BRA .merge 


.doneSpawning:
    JSR.W ShootEvirProjectileAtSamus 

.merge:
    JSR.W ($0FAC,X) 
    RTL 


ShootEvirProjectileAtSamus:
    LDA.W $0E54 : SEC : SBC.W #$0080 : TAX 
    LDA.W #$0080 : JSL.L IsSamusWithinAPixelColumnsOfEnemy 
    BEQ .return 
    LDA.W #$0004 : STA.W $0E32 
    JSL.L CalculateAngleOfSamusFromEnemy 
    SEC : SBC.W #$0040 : AND.W #$00FF 
    EOR.W #$FFFF 
    INC A 
    STA.B $16 
    JSL.L EightBitCosineMultiplication_A0B0B2 
    STA.L $7E780E,X 
    LDA.W $0E38 : STA.L $7E7810,X 
    LDA.B $16 : JSL.L EightBitNegativeSineMultiplication_A0B0C6 
    STA.L $7E7812,X 
    LDA.W $0E38 : STA.L $7E7814,X 
    LDA.W #InstList_Evir_Projectile_Normal : STA.L $7E7804,X 
    JSR.W SetEvirInstList 
    LDA.W #$0001 : STA.L $7E7816,X 
    LDA.W #Function_EvirProjectile_Moving : STA.W $0FAC,X 

.return:
    RTS 


Function_EvirProjectile_Idle:
    LDX.W $0E54 
    JSR.W ResetEvirProjectilePosition 
    RTS 


Function_EvirProjectile_Moving:
    LDX.W $0E54 
    JSR.W StartEvirProjectileRegeneratingIfFarOffScreen 
    LDA.W $0F7A,X : CLC : ADC.L $7E780E,X : STA.W $0F7A,X 
    LDA.W $0F7C,X : CLC : ADC.L $7E7810,X : BCC + 
    INC.W $0F7A,X 

  + STA.W $0F7C,X 
    LDA.W $0F7E,X : CLC : ADC.L $7E7812,X : STA.W $0F7E,X 
    LDA.W $0F80,X : CLC : ADC.L $7E7814,X : BCC + 
    INC.W $0F7E,X 

  + STA.W $0F80,X 
    RTS 


Function_EvirProjectile_Regenerating:
    LDX.W $0E54 
    LDA.W $0F1E,X : BNE .return 
    LDA.L $7E7818,X : BNE .notRegenerating 
    LDA.W #InstList_Evir_Projectile_Normal : STA.L $7E7804,X 
    JSR.W SetEvirInstList 
    LDA.W #$0000 : STA.L $7E7818,X 
    STA.L $7E7816,X 
    LDA.W #Function_EvirProjectile_Idle : STA.W $0FAC,X 
    BRA .return 


.notRegenerating:
    JSR.W ResetEvirProjectilePosition 
    LDA.W $0F7A,X : CLC : ADC.W $0FB2,X : STA.W $0F7A,X 

.return:
    RTS 


StartEvirProjectileRegeneratingIfFarOffScreen:
    LDX.W $0E54 
    LDA.W #$0100 : JSL.L CheckIfEnemyCenterIsOverAPixelsOffScreen 
    BEQ .return 
    LDA.W $0F1E,X : BNE .return 
    LDA.W #$0000 : STA.L $7E7816,X 
    LDA.W #$0001 : STA.L $7E7818,X 
    LDA.W #Function_EvirProjectile_Regenerating : STA.W $0FAC,X 
    LDA.W #$0001 : STA.L $7E7818,X 
    LDA.W #InstList_Evir_Projectile_Regenerating_0 : STA.L $7E7804,X 
    JSR.W SetEvirInstList 

.return:
    RTS 


SetEvirInstList:
    LDX.W $0E54 
    LDA.L $7E7804,X : CMP.L $7E7802,X : BEQ .return 
    STA.W $0F92,X 
    STA.L $7E7802,X 
    LDA.W #$0001 : STA.W $0F94,X 
    STZ.W $0F90,X 

.return:
    RTS 


EnemyShot_Evir:
    JSL.L CommonA8_NormalEnemyTouchAI 
    BRA ContactReaction_Evir_Common 


PowerBombReaction_Evir:
    JSL.L CommonA8_NormalEnemyPowerBombAI 
    BRA ContactReaction_Evir_Common 


EnemyTouch_Evir:
    JSL.L NormalEnemyShotAI ; fallthrough to ContactReaction_Evir_Common

ContactReaction_Evir_Common:
    LDX.W $0E54 
    LDA.W $0F8C,X : BNE .notDead 
    LDA.W $0FC6,X : ORA.W #$0200 : STA.W $0FC6,X 
    LDA.W $1006,X : ORA.W #$0200 : STA.W $1006,X 

.notDead:
    LDA.W $0F9E,X : BEQ .return 
    STA.W $0FDE,X 
    LDA.W $0FCA,X : ORA.W #$0004 : STA.W $0FCA,X 
    LDA.W $102C,X : CMP.W #Function_EvirProjectile_Moving : BEQ .return 
    LDA.W $100A,X : ORA.W #$0004 : STA.W $100A,X 
    LDA.W $0F9E,X : STA.W $101E,X 

.return:
    RTL 


Spritemap_Evir_0:
    dw $0009,$81FE 
    db $FB 
    dw $2106,$81EE 
    db $FB 
    dw $2104,$81FE 
    db $EB 
    dw $2102,$81EE 
    db $EB 
    dw $2100,$8002 
    db $FB 
    dw $2108,$8001 
    db $01 
    dw $2108,$81FF 
    db $07 
    dw $210C,$01FE 
    db $10 
    dw $2126,$01FE 
    db $08 
    dw $2125 

Spritemap_Evir_1:
    dw $0009,$81FE 
    db $FB 
    dw $2106,$81EE 
    db $FB 
    dw $2104,$81FE 
    db $EB 
    dw $2102,$81EE 
    db $EB 
    dw $2100,$8002 
    db $FC 
    dw $2108,$8001 
    db $02 
    dw $2108,$81FF 
    db $07 
    dw $210C,$01FE 
    db $10 
    dw $2126,$01FE 
    db $08 
    dw $2125 

Spritemap_Evir_2:
    dw $0009,$81FE 
    db $FB 
    dw $2106,$81EE 
    db $FB 
    dw $2104,$81FE 
    db $EB 
    dw $2102,$81EE 
    db $EB 
    dw $2100,$8002 
    db $FD 
    dw $2108,$8001 
    db $03 
    dw $2108,$81FF 
    db $08 
    dw $210C,$01FE 
    db $11 
    dw $2126,$01FE 
    db $09 
    dw $2125 

Spritemap_Evir_3:
    dw $0009,$81FE 
    db $FB 
    dw $2106,$81EE 
    db $FB 
    dw $2104,$81FE 
    db $EB 
    dw $2102,$81EE 
    db $EB 
    dw $2100,$8002 
    db $FD 
    dw $2108,$8001 
    db $04 
    dw $2108,$81FF 
    db $09 
    dw $210C,$01FE 
    db $12 
    dw $2126,$01FE 
    db $0A 
    dw $2125 

Spritemap_Evir_4:
    dw $0009,$81FE 
    db $FB 
    dw $2106,$81EE 
    db $FB 
    dw $2104,$81FE 
    db $EB 
    dw $2102,$81EE 
    db $EB 
    dw $2100,$8002 
    db $FD 
    dw $2108,$8001 
    db $04 
    dw $2108,$81FF 
    db $0A 
    dw $210C,$01FE 
    db $11 
    dw $2126,$01FE 
    db $09 
    dw $2125 

Spritemap_Evir_5:
    dw $0009,$81FE 
    db $FB 
    dw $2106,$81EE 
    db $FB 
    dw $2104,$81FE 
    db $EB 
    dw $2102,$81EE 
    db $EB 
    dw $2100,$8002 
    db $FC 
    dw $2108,$8001 
    db $03 
    dw $2108,$81FF 
    db $09 
    dw $210C,$01FE 
    db $10 
    dw $2126,$01FE 
    db $08 
    dw $2125 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Evir_A88C73:
    dw $0009,$81FE 
    db $FB 
    dw $2106,$81EE 
    db $FB 
    dw $2104,$81FE 
    db $EB 
    dw $2102,$81EE 
    db $EB 
    dw $2100,$8002 
    db $FB 
    dw $2108,$8001 
    db $01 
    dw $2108,$81FF 
    db $07 
    dw $210C,$01FE 
    db $10 
    dw $2126,$01FE 
    db $08 
    dw $2125 
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_Evir_6:
    dw $0005,$0000 
    db $F8 
    dw $2123,$01F8 
    db $F8 
    dw $2122,$0002 
    db $FC 
    dw $2124,$01FE 
    db $F4 
    dw $2121,$01F6 
    db $F4 
    dw $2120 

Spritemap_Evir_7:
    dw $0005,$01FE 
    db $F4 
    dw $2123,$01F6 
    db $F4 
    dw $2122,$0000 
    db $F8 
    dw $2124,$0002 
    db $FC 
    dw $2123,$01FA 
    db $FC 
    dw $2122 

Spritemap_Evir_8:
    dw $0005,$01FE 
    db $F4 
    dw $2124,$01F8 
    db $F8 
    dw $2122,$0000 
    db $F8 
    dw $2123,$0002 
    db $FC 
    dw $2121,$01FA 
    db $FC 
    dw $2120 

Spritemap_Evir_9:
    dw $0006,$01FE 
    db $F4 
    dw $2123,$01F6 
    db $F4 
    dw $2122,$01F8 
    db $F8 
    dw $2120,$0000 
    db $F8 
    dw $2121,$0002 
    db $FC 
    dw $2123,$01FA 
    db $FC 
    dw $2122 

Spritemap_Evir_A:
    dw $0003,$01FE 
    db $F4 
    dw $2124,$0000 
    db $F8 
    dw $2124,$0002 
    db $FC 
    dw $2124 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Evir_A88D24:
    dw $0006,$01FE 
    db $F4 
    dw $2123,$01F6 
    db $F4 
    dw $2122,$01F8 
    db $F8 
    dw $2122,$0000 
    db $F8 
    dw $2123,$0002 
    db $FC 
    dw $2123,$01FA 
    db $FC 
    dw $2122 

UNUSED_Spritemap_Evir_A88D44:
    dw $0006,$01FE 
    db $F4 
    dw $2121,$01F6 
    db $F4 
    dw $2120,$0000 
    db $F8 
    dw $2121,$01F8 
    db $F8 
    dw $2120,$0002 
    db $FC 
    dw $2121,$01FA 
    db $FC 
    dw $2120 
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_Evir_B:
    dw $0004,$0000 
    db $00 
    dw $A128,$01F8 
    db $00 
    dw $A127,$0000 
    db $F8 
    dw $2128,$01F8 
    db $F8 
    dw $2127 

Spritemap_Evir_C:
    dw $0001,$81F8 
    db $F8 
    dw $210E 

Spritemap_Evir_D:
    dw $0009,$81F2 
    db $FB 
    dw $6106,$8002 
    db $FB 
    dw $6104,$81F2 
    db $EB 
    dw $6102,$8002 
    db $EB 
    dw $6100,$81EE 
    db $FB 
    dw $6108,$81EF 
    db $01 
    dw $6108,$81F1 
    db $07 
    dw $610C,$01FA 
    db $10 
    dw $6126,$01FA 
    db $08 
    dw $6125 

Spritemap_Evir_E:
    dw $0009,$81F2 
    db $FB 
    dw $6106,$8002 
    db $FB 
    dw $6104,$81F2 
    db $EB 
    dw $6102,$8002 
    db $EB 
    dw $6100,$81EE 
    db $FC 
    dw $6108,$81EF 
    db $02 
    dw $6108,$81F1 
    db $07 
    dw $610C,$01FA 
    db $10 
    dw $6126,$01FA 
    db $08 
    dw $6125 

Spritemap_Evir_F:
    dw $0009,$81F2 
    db $FB 
    dw $6106,$8002 
    db $FB 
    dw $6104,$81F2 
    db $EB 
    dw $6102,$8002 
    db $EB 
    dw $6100,$81EE 
    db $FD 
    dw $6108,$81EF 
    db $03 
    dw $6108,$81F1 
    db $08 
    dw $610C,$01FA 
    db $11 
    dw $6126,$01FA 
    db $09 
    dw $6125 

Spritemap_Evir_10:
    dw $0009,$81F2 
    db $FB 
    dw $6106,$8002 
    db $FB 
    dw $6104,$81F2 
    db $EB 
    dw $6102,$8002 
    db $EB 
    dw $6100,$81EE 
    db $FD 
    dw $6108,$81EF 
    db $04 
    dw $6108,$81F1 
    db $09 
    dw $610C,$01FA 
    db $12 
    dw $6126,$01FA 
    db $0A 
    dw $6125 

Spritemap_Evir_11:
    dw $0009,$81F2 
    db $FB 
    dw $6106,$8002 
    db $FB 
    dw $6104,$81F2 
    db $EB 
    dw $6102,$8002 
    db $EB 
    dw $6100,$81EE 
    db $FD 
    dw $6108,$81EF 
    db $04 
    dw $6108,$81F1 
    db $0A 
    dw $610C,$01FA 
    db $11 
    dw $6126,$01FA 
    db $09 
    dw $6125 

Spritemap_Evir_12:
    dw $0009,$81F2 
    db $FB 
    dw $6106,$8002 
    db $FB 
    dw $6104,$81F2 
    db $EB 
    dw $6102,$8002 
    db $EB 
    dw $6100,$81EE 
    db $FC 
    dw $6108,$81EF 
    db $03 
    dw $6108,$81F1 
    db $09 
    dw $610C,$01FA 
    db $10 
    dw $6126,$01FA 
    db $08 
    dw $6125 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Evir_A88E9B:
    dw $0009,$81F2 
    db $FB 
    dw $6106,$8002 
    db $FB 
    dw $6104,$81F2 
    db $EB 
    dw $6102,$8002 
    db $EB 
    dw $6100,$81EE 
    db $FB 
    dw $6108,$81EF 
    db $01 
    dw $6108,$81F1 
    db $07 
    dw $610C,$01FA 
    db $10 
    dw $6126,$01FA 
    db $08 
    dw $6125 
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_Evir_13:
    dw $0005,$01F8 
    db $F8 
    dw $6123,$0000 
    db $F8 
    dw $6122,$01FA 
    db $F4 
    dw $6121,$0002 
    db $F4 
    dw $6120,$01F6 
    db $FC 
    dw $6124 

Spritemap_Evir_14:
    dw $0005,$01FA 
    db $F4 
    dw $6123,$0002 
    db $F4 
    dw $6122,$01F8 
    db $F8 
    dw $6124,$01F6 
    db $FC 
    dw $6123,$01FE 
    db $FC 
    dw $6122 

Spritemap_Evir_15:
    dw $0005,$01FA 
    db $F4 
    dw $6124,$01F8 
    db $F8 
    dw $6123,$0000 
    db $F8 
    dw $6122,$01F6 
    db $FC 
    dw $6121,$01FE 
    db $FC 
    dw $6120 

Spritemap_Evir_16:
    dw $0006,$01FA 
    db $F4 
    dw $6123,$0002 
    db $F4 
    dw $6122,$0000 
    db $F8 
    dw $6120,$01F8 
    db $F8 
    dw $6121,$01F6 
    db $FC 
    dw $6123,$01FE 
    db $FC 
    dw $6122 

Spritemap_Evir_17:
    dw $0003,$01F6 
    db $FC 
    dw $6124,$01F8 
    db $F8 
    dw $6124,$01FA 
    db $F4 
    dw $6124 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Evir_A88F4C:
    dw $0006,$01FA 
    db $F4 
    dw $6123,$0002 
    db $F4 
    dw $6122,$01F8 
    db $F8 
    dw $6123,$0000 
    db $F8 
    dw $6122,$01F6 
    db $FC 
    dw $6123,$01FE 
    db $FC 
    dw $6122 

UNUSED_Spritemap_Evir_A88F6C:
    dw $0006,$01FA 
    db $F4 
    dw $6121,$0002 
    db $F4 
    dw $6120,$0000 
    db $F8 
    dw $6120,$01F8 
    db $F8 
    dw $6121,$01F6 
    db $FC 
    dw $6121,$01FE 
    db $FC 
    dw $6120 
endif ; !FEATURE_KEEP_UNREFERENCED

Palette_Eye:
    dw $3800,$72B2,$71C7,$2461,$1840,$7A8E,$660B,$4D03 
    dw $4900,$7FE0,$7E80,$44E0,$2C20,$0000,$0000,$0000 

InstList_Eye_Active:
    dw $000A 
    dw Spritemap_Eye_7 
    dw $000A 
    dw Spritemap_Eye_7 
    dw $000A 
    dw Spritemap_Eye_8 
    dw $000A 
    dw Spritemap_Eye_9 
    dw $000A 
    dw Spritemap_Eye_A 
    dw $000A 
    dw Spritemap_Eye_B 
    dw $000A 
    dw Spritemap_Eye_C 
    dw $000A 
    dw Spritemap_Eye_D 
    dw $000A 
    dw Spritemap_Eye_6 
    dw $000A 
    dw Spritemap_Eye_5 
    dw $000A 
    dw Spritemap_Eye_4 
    dw $000A 
    dw Spritemap_Eye_3 
    dw $000A 
    dw Spritemap_Eye_2 
    dw $000A 
    dw Spritemap_Eye_1 
    dw $000A 
    dw Spritemap_Eye_0 
    dw $000A 
    dw Spritemap_Eye_0 
    dw Instruction_Common_GotoY 
    dw InstList_Eye_Active 

InstList_Eye_FacingRight_Deactivating:
    dw $0008 
    dw Spritemap_Eye_F 
    dw $0030 
    dw Spritemap_Eye_3 
    dw $0005 
    dw Spritemap_Eye_F 

InstList_Eye_FacingRight_Closed:
    dw $0030 
    dw Spritemap_Eye_E 
    dw Instruction_Common_Sleep 

InstList_Eye_FacingLeft_Deactivating:
    dw $0008 
    dw Spritemap_Eye_11 
    dw $0030 
    dw Spritemap_Eye_A 
    dw $0005 
    dw Spritemap_Eye_11 

InstList_Eye_FacingLeft_Closed:
    dw $0030 
    dw Spritemap_Eye_10 
    dw Instruction_Common_Sleep 

InstList_Eye_FacingRight_Activating:
    dw $0020 
    dw Spritemap_Eye_E 
    dw $0005 
    dw Spritemap_Eye_F 
    dw $0030 
    dw Spritemap_Eye_3 
    dw $0008 
    dw Spritemap_Eye_F 
    dw Instruction_Common_Sleep 

InstList_Eye_FacingLeft_Activating:
    dw $0020 
    dw Spritemap_Eye_10 
    dw $0005 
    dw Spritemap_Eye_11 
    dw $0030 
    dw Spritemap_Eye_A 
    dw $0008 
    dw Spritemap_Eye_11 
    dw Instruction_Common_Sleep 

InstList_Eye_Mount_FacingRight:
    dw $0001 
    dw Spritemap_Eye_12 
    dw Instruction_Common_Sleep 

InstList_Eye_Mount_FacingDown:
    dw $0001 
    dw Spritemap_Eye_13 
    dw Instruction_Common_Sleep 

InstList_Eye_Mount_FacingLeft:
    dw $0001 
    dw Spritemap_Eye_14 
    dw Instruction_CommonA8_Sleep 

InstList_Eye_Mount_FacingUp:
    dw $0001 
    dw Spritemap_Eye_15 
    dw Instruction_CommonA8_Sleep 

EyeConstants_XProximityToActivate:
    dw $0080 

EyeConstants_XProximityToDeactivate:
    dw $00B0 

EyeConstants_YProximityToActivate:
    dw $0080 

EyeConstants_YProximityToDeactivate:
    dw $0080 

InitAI_Eye:
    LDX.W $0E54 
    LDA.W $0F86,X : ORA.W #$2000 : STA.W $0F86,X 
    LDA.W #Spritemap_CommonA8_Nothing : STA.W $0F8E,X 
    LDA.W #$0001 : STA.W $0F94,X 
    STZ.W $0F90,X 
    LDA.W $0FB6,X : BMI .mountPart 
    LDA.W #Function_Eye_WaitForSamusToGetNear : STA.W $0FB2,X 
    LDA.W $0FB4,X : BIT.W #$0001 
    BEQ .facingRight 
    LDA.W #InstList_Eye_FacingLeft_Closed : STA.W $0F92,X 
    BRA .return 


.facingRight:
    LDA.W #InstList_Eye_FacingRight_Closed : STA.W $0F92,X 
    BRA .return 


.mountPart:
    AND.W #$000F 
    ASL A 
    TAY 
    LDA.W $0F7A,X : CLC : ADC.W .XOffsets,Y : STA.W $0F7A,X 
    LDA.W $0F7E,X : CLC : ADC.W .YOffsets,Y : STA.W $0F7E,X 
    LDA.W #RTL_A891DC : STA.W $0FB2,X 
    LDA.W .instListPointers,Y : STA.W $0F92,X 
    LDX.W #$01FE 

.loop:
    LDA.W #$00FF : STA.L $7E9100,X 
    DEX #2
    BPL .loop 

.return:
    RTL 


.XOffsets:
    dw $FFF8,$0008,$0000,$0000 

.YOffsets:
    dw $0000,$0000,$FFF8,$0008 

.instListPointers:
    dw InstList_Eye_Mount_FacingLeft 
    dw InstList_Eye_Mount_FacingRight 
    dw InstList_Eye_Mount_FacingUp 
    dw InstList_Eye_Mount_FacingDown 

MainAI_Eye:
    LDX.W $0E54 
    LDA.W $09A4 : BIT.W #$0004 
    BEQ .return 
    JMP.W ($0FB2,X) 


.return:
    RTL 


Function_Eye_WaitForSamusToGetNear:
    LDA.W EyeConstants_YProximityToActivate : JSL.L IsSamusWithingAPixelRowsOfEnemy 
    TAY 
    BEQ .return 
    LDA.W EyeConstants_XProximityToActivate : JSL.L IsSamusWithinAPixelColumnsOfEnemy 
    TAY 
    BEQ .return 
    LDA.W #$0020 : STA.W $0FB0,X 
    LDA.W #$0001 : STA.W $0F94,X 
    LDA.W $0FB4,X : BIT.W #$0001 
    BEQ .zeroParam 
    LDA.W #InstList_Eye_FacingLeft_Activating : STA.W $0F92,X 
    BRA + 


.zeroParam:
    LDA.W #InstList_Eye_FacingRight_Activating : STA.W $0F92,X 

  + LDA.W #Function_Eye_Activating : STA.W $0FB2,X 

.return:
    RTL 


Function_Eye_Activating:
    DEC.W $0FB0,X 
    BEQ .timerExpired 
    BPL .return 

.timerExpired:
    LDA.W #$0017 : JSL.L QueueSound_Lib2_Max6 
    JSL.L Spawn_MorphBallEyeBeam_HDMAObject 
    LDA.W #Function_Eye_Active : STA.W $0FB2,X 
    LDA.W $0AF6 : SEC : SBC.W $0F7A,X : STA.B $12 
    LDA.W $0AFA : SEC : SBC.W $0F7E,X : STA.B $14 
    JSL.L CalculateAngleOf_12_14_Offset 
    STA.W $0FAE,X 

.return:
    RTL 


Function_Eye_Active:
    LDA.W EyeConstants_YProximityToDeactivate : JSL.L IsSamusWithingAPixelRowsOfEnemy 
    TAY 
    BEQ .notInProximity 
    LDA.W EyeConstants_XProximityToDeactivate : JSL.L IsSamusWithinAPixelColumnsOfEnemy 
    TAY 
    BNE .inProximity 

.notInProximity:
    LDA.W #$0071 : JSL.L QueueSound_Lib2_Max6 
    STZ.W $0FAC,X 
    LDA.W #$0020 : STA.W $0FB0,X 
    LDA.W $0FB4,X : BIT.W #$0001 
    BEQ .zeroParam 
    LDA.W #InstList_Eye_FacingLeft_Deactivating : STA.W $0F92,X 
    BRA + 


.zeroParam:
    LDA.W #InstList_Eye_FacingRight_Deactivating : STA.W $0F92,X 

  + LDA.W #Function_Eye_Deactivating : STA.W $0FB2,X 
    BRA .merge 


.inProximity:
    LDA.W $0AF6 : SEC : SBC.W $0F7A,X : STA.B $12 
    LDA.W $0AFA : SEC : SBC.W $0F7E,X : STA.B $14 
    JSL.L CalculateAngleOf_12_14_Offset 
    STA.W $0FAE,X 
    AND.W #$00F0 
    LSR #2
    CLC : ADC.W #InstList_Eye_Active : STA.W $0F92,X 

.merge:
    LDA.W #$0001 : STA.W $0F94,X 
    RTL 


Function_Eye_Deactivating:
    DEC.W $0FB0,X 
    BEQ .timerExpired 
    BPL .return 

.timerExpired:
    LDA.W #Function_Eye_WaitForSamusToGetNear : STA.W $0FB2,X 

.return:
    RTL 


RTL_A891DC:
    RTL 


RTL_A891DD:
    RTL 


RTL_A891DE:
    RTL 


Spritemap_Eye_0:
    dw $0001,$81F8 
    db $F8 
    dw $2100 

Spritemap_Eye_1:
    dw $0001,$81F8 
    db $F8 
    dw $2102 

Spritemap_Eye_2:
    dw $0001,$81F8 
    db $F8 
    dw $2104 

Spritemap_Eye_3:
    dw $0001,$81F8 
    db $F8 
    dw $2106 

Spritemap_Eye_4:
    dw $0001,$81F8 
    db $F8 
    dw $2108 

Spritemap_Eye_5:
    dw $0001,$81F8 
    db $F8 
    dw $210A 

Spritemap_Eye_6:
    dw $0001,$81F8 
    db $F8 
    dw $210C 

Spritemap_Eye_7:
    dw $0001,$81F8 
    db $F8 
    dw $6100 

Spritemap_Eye_8:
    dw $0001,$81F8 
    db $F8 
    dw $6102 

Spritemap_Eye_9:
    dw $0001,$81F8 
    db $F8 
    dw $6104 

Spritemap_Eye_A:
    dw $0001,$81F8 
    db $F8 
    dw $6106 

Spritemap_Eye_B:
    dw $0001,$81F8 
    db $F8 
    dw $6108 

Spritemap_Eye_C:
    dw $0001,$81F8 
    db $F8 
    dw $610A 

Spritemap_Eye_D:
    dw $0001,$81F8 
    db $F8 
    dw $610C 

Spritemap_Eye_E:
    dw $0004,$01F8 
    db $00 
    dw $A11F,$01F8 
    db $F8 
    dw $211F,$0000 
    db $00 
    dw $2117,$0000 
    db $F8 
    dw $2107 

Spritemap_Eye_F:
    dw $0004,$01F8 
    db $00 
    dw $A11E,$01F8 
    db $F8 
    dw $211E,$0000 
    db $00 
    dw $2117,$0000 
    db $F8 
    dw $2107 

Spritemap_Eye_10:
    dw $0004,$0000 
    db $00 
    dw $E11F,$0000 
    db $F8 
    dw $611F,$01F8 
    db $00 
    dw $6117,$01F8 
    db $F8 
    dw $6107 

Spritemap_Eye_11:
    dw $0004,$0000 
    db $00 
    dw $E11E,$0000 
    db $F8 
    dw $611E,$01F8 
    db $00 
    dw $6117,$01F8 
    db $F8 
    dw $6107 

Spritemap_Eye_12:
    dw $0002,$01FC 
    db $00 
    dw $A10E,$01FC 
    db $F8 
    dw $210E 

Spritemap_Eye_13:
    dw $0002,$0000 
    db $FC 
    dw $610F,$01F8 
    db $FC 
    dw $210F 

Spritemap_Eye_14:
    dw $0002,$01FC 
    db $00 
    dw $E10E,$01FC 
    db $F8 
    dw $610E 

Spritemap_Eye_15:
    dw $0002,$0000 
    db $FC 
    dw $E10F,$01F8 
    db $FC 
    dw $A10F 

Spritemap_Eye_16:
    dw $0004,$01F8 
    db $00 
    dw $A11F,$01F8 
    db $F8 
    dw $211F,$0000 
    db $00 
    dw $2117,$0000 
    db $F8 
    dw $2107 

Spritemap_Eye_17:
    dw $0004,$01F8 
    db $00 
    dw $A11E,$01F8 
    db $F8 
    dw $211E,$0000 
    db $00 
    dw $2117,$0000 
    db $F8 
    dw $2107 

Spritemap_Eye_18:
    dw $0004,$0000 
    db $00 
    dw $E11F,$0000 
    db $F8 
    dw $611F,$01F8 
    db $00 
    dw $6117,$01F8 
    db $F8 
    dw $6107 

Spritemap_Eye_19:
    dw $0004,$0000 
    db $00 
    dw $E11E,$0000 
    db $F8 
    dw $611E,$01F8 
    db $00 
    dw $6117,$01F8 
    db $F8 
    dw $6107 

Spritemap_Eye_1A:
    dw $0004,$0000 
    db $00 
    dw $E11F,$0000 
    db $F8 
    dw $611F,$01F8 
    db $00 
    dw $6117,$01F8 
    db $F8 
    dw $6107 

Spritemap_Eye_1B:
    dw $0004,$0000 
    db $00 
    dw $E11E,$0000 
    db $F8 
    dw $611E,$01F8 
    db $00 
    dw $6117,$01F8 
    db $F8 
    dw $6107 

Spritemap_Eye_1C:
    dw $0004,$01F8 
    db $00 
    dw $A11F,$01F8 
    db $F8 
    dw $211F,$0000 
    db $00 
    dw $2117,$0000 
    db $F8 
    dw $2107 

Spritemap_Eye_1D:
    dw $0004,$01F8 
    db $00 
    dw $A11E,$01F8 
    db $F8 
    dw $211E,$0000 
    db $00 
    dw $2117,$0000 
    db $F8 
    dw $2107 

Palette_Fune:
    dw $3800,$4B9C,$3694,$0929,$0042,$3B18,$2A52,$19AD 
    dw $116B,$7F5A,$7EC0,$6DE0,$54E0,$001D,$0014,$000A 

InstList_Fune_FacingLeft_Idling:
    dw $0001 
    dw Spritemap_Fune_FacingLeft_Idle_MouthClosed 
    dw Instruction_Common_Sleep 

InstList_Fune_FacingLeft_Active:
    dw $0010 
    dw Spritemap_Fune_FacingLeft_Idle_MouthClosed 
    dw $0008 
    dw Spritemap_Fune_FacingLeft_StartOpeningMouth 
    dw $0008 
    dw Spritemap_Fune_FacingLeft_MouthOpening1 
    dw $0008 
    dw Spritemap_Fune_FacingLeft_MouthOpening2 
    dw Instruction_Fune_SpawnFireball_FacingLeft 
    dw Instruction_FuneNamihe_QueueSpitSFX 
    dw $0010 
    dw Spritemap_Fune_FacingLeft_MouthMostOpen 
    dw $0008 
    dw Spritemap_Fune_FacingLeft_MouthOpening2 
    dw $0008 
    dw Spritemap_Fune_FacingLeft_MouthOpening1 
    dw $0008 
    dw Spritemap_Fune_FacingLeft_StartOpeningMouth 
    dw Instruction_FuneNamihe_FinishActivity 
    dw Instruction_Common_GotoY 
    dw InstList_Fune_FacingLeft_Idling 

InstList_Fune_FacingRight_Idling:
    dw $0001 
    dw Spritemap_Fune_FacingRight_Idle_MouthClosed 
    dw Instruction_Common_Sleep 

InstList_Fune_FacingRight_Active:
    dw $0010 
    dw Spritemap_Fune_FacingRight_Idle_MouthClosed 
    dw $0008 
    dw Spritemap_Fune_FacingRight_StartOpeningMouth 
    dw $0008 
    dw Spritemap_Fune_FacingRight_MouthOpening1 
    dw $0008 
    dw Spritemap_Fune_FacingRight_MouthOpening2 
    dw Instruction_Fune_SpawnFireball_FacingRight 
    dw Instruction_FuneNamihe_QueueSpitSFX 
    dw $0010 
    dw Spritemap_Fune_FacingRight_MouthMostOpen 
    dw $0008 
    dw Spritemap_Fune_FacingRight_MouthOpening2 
    dw $0008 
    dw Spritemap_Fune_FacingRight_MouthOpening1 
    dw $0008 
    dw Spritemap_Fune_FacingRight_StartOpeningMouth 
    dw Instruction_FuneNamihe_FinishActivity_duplicate 
    dw Instruction_Common_GotoY 
    dw InstList_Fune_FacingRight_Idling 

Spritemap_Fune_FacingLeft_Idle_MouthClosed:
    dw $0008,$0008 
    db $0C 
    dw $2127,$0000 
    db $0C 
    dw $2126,$8000 
    db $FC 
    dw $2122,$8000 
    db $EC 
    dw $2120,$81F0 
    db $FC 
    dw $2102,$01F8 
    db $FC 
    dw $2125,$01F0 
    db $FC 
    dw $2124,$81F0 
    db $EC 
    dw $2100 

Spritemap_Fune_FacingLeft_StartOpeningMouth:
    dw $0008,$0006 
    db $0C 
    dw $2127,$01FE 
    db $0C 
    dw $2126,$81FE 
    db $FC 
    dw $2122,$81FE 
    db $EC 
    dw $2120,$81EE 
    db $FE 
    dw $2102,$01F6 
    db $FC 
    dw $2125,$01EE 
    db $FC 
    dw $2124,$81EE 
    db $EC 
    dw $2100 

Spritemap_Fune_FacingLeft_MouthOpening1:
    dw $0008,$0004 
    db $0C 
    dw $2127,$01FC 
    db $0C 
    dw $2126,$81FC 
    db $FC 
    dw $2122,$81FC 
    db $EC 
    dw $2120,$81EC 
    db $00 
    dw $2102,$01F4 
    db $FC 
    dw $2125,$01EC 
    db $FC 
    dw $2124,$81EC 
    db $EC 
    dw $2100 

Spritemap_Fune_FacingLeft_MouthOpening2:
    dw $0008,$0002 
    db $0C 
    dw $2127,$01FA 
    db $0C 
    dw $2126,$81FA 
    db $FC 
    dw $2122,$81FA 
    db $EC 
    dw $2120,$81EA 
    db $01 
    dw $2102,$01F2 
    db $FC 
    dw $2125,$01EA 
    db $FC 
    dw $2124,$81EA 
    db $EC 
    dw $2100 

Spritemap_Fune_FacingLeft_MouthMostOpen:
    dw $0008,$0000 
    db $0C 
    dw $2127,$01F8 
    db $0C 
    dw $2126,$81F8 
    db $FC 
    dw $2122,$81F8 
    db $EC 
    dw $2120,$81E8 
    db $03 
    dw $2102,$01F0 
    db $FC 
    dw $2125,$01E8 
    db $FC 
    dw $2124,$81E8 
    db $EC 
    dw $2100 

Spritemap_Fune_FacingRight_Idle_MouthClosed:
    dw $0008,$01F0 
    db $0C 
    dw $6127,$01F8 
    db $0C 
    dw $6126,$81F0 
    db $FC 
    dw $6122,$81F0 
    db $EC 
    dw $6120,$8000 
    db $FC 
    dw $6102,$0000 
    db $FC 
    dw $6125,$0008 
    db $FC 
    dw $6124,$8000 
    db $EC 
    dw $6100 

Spritemap_Fune_FacingRight_StartOpeningMouth:
    dw $0008,$01F2 
    db $0C 
    dw $6127,$01FA 
    db $0C 
    dw $6126,$81F2 
    db $FC 
    dw $6122,$81F2 
    db $EC 
    dw $6120,$8002 
    db $FE 
    dw $6102,$0002 
    db $FC 
    dw $6125,$000A 
    db $FC 
    dw $6124,$8002 
    db $EC 
    dw $6100 

Spritemap_Fune_FacingRight_MouthOpening1:
    dw $0008,$01F4 
    db $0C 
    dw $6127,$01FC 
    db $0C 
    dw $6126,$81F4 
    db $FC 
    dw $6122,$81F4 
    db $EC 
    dw $6120,$8004 
    db $00 
    dw $6102,$0004 
    db $FC 
    dw $6125,$000C 
    db $FC 
    dw $6124,$8004 
    db $EC 
    dw $6100 

Spritemap_Fune_FacingRight_MouthOpening2:
    dw $0008,$01F6 
    db $0C 
    dw $6127,$01FE 
    db $0C 
    dw $6126,$81F6 
    db $FC 
    dw $6122,$81F6 
    db $EC 
    dw $6120,$8006 
    db $01 
    dw $6102,$0006 
    db $FC 
    dw $6125,$000E 
    db $FC 
    dw $6124,$8006 
    db $EC 
    dw $6100 

Spritemap_Fune_FacingRight_MouthMostOpen:
    dw $0008,$01F8 
    db $0C 
    dw $6127,$0000 
    db $0C 
    dw $6126,$81F8 
    db $FC 
    dw $6122,$81F8 
    db $EC 
    dw $6120,$8007 
    db $02 
    dw $6102,$0008 
    db $FC 
    dw $6125,$0010 
    db $FC 
    dw $6124,$8008 
    db $EC 
    dw $6100 

Palette_Namihe:
    dw $3800,$4B9C,$3694,$0929,$0042,$3B18,$2A52,$19AD 
    dw $116B,$7F5A,$7EC0,$6DE0,$54E0,$001D,$0014,$000A 

InstList_Namihe_FacingLeft_Idling:
    dw $0001 
    dw Spritemap_Namihe_FacingLeft_Idle_MouthEyeOpened 
    dw Instruction_Common_Sleep 

InstList_Namihe_FacingLeft_Active:
    dw $0008 
    dw Spritemap_Namihe_FacingLeft_Idle_MouthEyeOpened 
    dw $0008 
    dw Spritemap_Namihe_FacingLeft_EyeOpened 
    dw $0008 
    dw Spritemap_Namihe_FacingLeft_StartOpeningMouth 
    dw $0008 
    dw Spritemap_Namihe_FacingLeft_MouthOpening1 
    dw $0008 
    dw Spritemap_Namihe_FacingLeft_MouthOpening2 
    dw Instruction_Namihe_SpawnFireball_FacingLeft 
    dw Instruction_FuneNamihe_QueueSpitSFX 
    dw $0008 
    dw Spritemap_Namihe_FacingLeft_MouthMostOpen 
    dw $0008 
    dw Spritemap_Namihe_FacingLeft_MouthOpening2 
    dw $0008 
    dw Spritemap_Namihe_FacingLeft_MouthOpening1 
    dw $0008 
    dw Spritemap_Namihe_FacingLeft_StartOpeningMouth 
    dw Instruction_FuneNamihe_FinishActivity 
    dw Instruction_Common_GotoY 
    dw InstList_Namihe_FacingLeft_Idling 

InstList_Namihe_FacingRight_Idling:
    dw $0001 
    dw Spritemap_Namihe_FacingRight_Idle_MouthEyeClosed 
    dw Instruction_Common_Sleep 

InstList_Namihe_FacingRight_Active:
    dw $0008 
    dw Spritemap_Namihe_FacingRight_Idle_MouthEyeClosed 
    dw $0008 
    dw Spritemap_Namihe_FacingRight_EyeOpened 
    dw $0008 
    dw Spritemap_Namihe_FacingRight_StartOpeningMouth 
    dw $0008 
    dw Spritemap_Namihe_FacingRight_MouthOpening1 
    dw $0008 
    dw Spritemap_Namihe_FacingRight_MouthOpening2 
    dw Instruction_Namihe_SpawnFireball_FacingRight 
    dw Instruction_FuneNamihe_QueueSpitSFX 
    dw $0008 
    dw Spritemap_Namihe_FacingRight_MouthMostOpen 
    dw $0008 
    dw Spritemap_Namihe_FacingRight_MouthOpening2 
    dw $0008 
    dw Spritemap_Namihe_FacingRight_MouthOpening1 
    dw $0008 
    dw Spritemap_Namihe_FacingRight_StartOpeningMouth 
    dw Instruction_FuneNamihe_FinishActivity_duplicate 
    dw Instruction_Common_GotoY 
    dw InstList_Namihe_FacingRight_Idling 

Instruction_FuneNamihe_QueueSpitSFX:
    PHY : PHX 
    LDA.W #$001F : JSL.L QueueSound_Lib2_Max9 
    PLX : PLY 
    RTL 


Instruction_Namihe_SpawnFireball_FacingLeft:
    PHY 
    LDX.W $0E54 
    LDA.W $0FB6,X : AND.W #$00FF : STA.W $1995 
    LDA.W #$0000 
    LDY.W #EnemyProjectile_NamiheFireball 
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    PLY 
    RTL 


Instruction_Namihe_SpawnFireball_FacingRight:
    PHY 
    LDX.W $0E54 
    LDA.W $0FB6,X : AND.W #$00FF : STA.W $1995 
    LDA.W #$0001 
    LDY.W #EnemyProjectile_NamiheFireball 
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    PLY 
    RTL 


Instruction_Fune_SpawnFireball_FacingLeft:
    PHY 
    LDX.W $0E54 
    LDA.W $0FB6,X : AND.W #$00FF : STA.W $1995 
    LDA.W #$0000 
    LDY.W #EnemyProjectile_FuneFireball 
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    PLY 
    RTL 


Instruction_Fune_SpawnFireball_FacingRight:
    PHY 
    LDX.W $0E54 
    LDA.W $0FB6,X : AND.W #$00FF : STA.W $1995 
    LDA.W #$0001 
    LDY.W #EnemyProjectile_FuneFireball 
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    PLY 
    RTL 


Instruction_FuneNamihe_FinishActivity:
    LDX.W $0E54 
    LDA.W $0FA8,X 
    INC #4
    STA.W $0FA8,X 
    LDA.W #Function_Fune_WaitForTimer : STA.W $0FAA,X 
    LDA.W $0FAE,X : BEQ .return 
    LDA.W #Function_Namihe_WaitForSamusToGetNear : STA.W $0FAA,X 

.return:
    RTL 


Instruction_FuneNamihe_FinishActivity_duplicate:
    LDX.W $0E54 
    LDA.W $0FA8,X 
    INC #4
    STA.W $0FA8,X 
    LDA.W #Function_Fune_WaitForTimer : STA.W $0FAA,X 
    LDA.W $0FAE,X : BEQ .return 
    LDA.W #Function_Namihe_WaitForSamusToGetNear : STA.W $0FAA,X 

.return:
    RTL 


InstListPointers_Fune_Namihe:
    dw InstList_Fune_FacingLeft_Active 
    dw InstList_Fune_FacingRight_Active 
    dw InstList_Fune_FacingLeft_Idling 
    dw InstList_Fune_FacingRight_Idling 
    dw InstList_Namihe_FacingLeft_Active 
    dw InstList_Namihe_FacingRight_Active 
    dw InstList_Namihe_FacingLeft_Idling 
    dw InstList_Namihe_FacingRight_Idling 

InitAI_Fune_Namihe:
    LDX.W $0E54 
    LDA.W #InstListPointers_Fune_Namihe+$4 : STA.W $0FA8,X 
    LDA.W #Function_Fune_WaitForTimer : STA.W $0FAA,X 
    LDA.W $0FB4,X : AND.W #$000F : STA.W $0FAE,X 
    BEQ .speciesDetermined 
    LDA.W #InstListPointers_Fune_Namihe+$C : STA.W $0FA8,X 
    LDA.W #Function_Namihe_WaitForSamusToGetNear : STA.W $0FAA,X 

.speciesDetermined:
    LDA.W $0FB4,X : AND.W #$00F0 
    BEQ .directionDetermined 
    INC.W $0FA8,X 
    INC.W $0FA8,X 

.directionDetermined:
    JSR.W SetFuneNamiheInstList 
    LDA.W $0FB7,X : AND.W #$00FF : STA.W $0FAC,X 
    LDA.W $0FB5,X : AND.W #$00FF : STA.W $0FB2,X 
    STZ.W $0FB0,X 
    RTL 


MainAI_Fune_Namihe:
    LDX.W $0E54 
    JSR.W ($0FAA,X) 
    RTL 


Function_Fune_WaitForTimer:
    LDX.W $0E54 
    INC.W $0FB0,X 
    LDA.W $0FB0,X : CMP.W $0FB2,X : BMI .return 
    LDA.W $0FA8,X 
    DEC #4
    STA.W $0FA8,X 
    JSR.W SetFuneNamiheInstList 
    LDA.W #RTS_A8978E : STA.W $0FAA,X 
    STZ.W $0FB0,X 

.return:
    RTS 


Function_Namihe_WaitForSamusToGetNear:
    LDX.W $0E54 
    LDA.W $0FA8,X : STA.L $7E7800,X 
    JSR.W Namihe_CheckIfSamusIsInProximity 
    BEQ .notInProximity 
    LDA.L $7E7800,X : STA.W $0FA8,X 
    DEC #4
    STA.L $7E7800,X 
    STA.W $0FA8,X 
    JSR.W SetFuneNamiheInstList 
    LDA.W #RTS_A8978F : STA.W $0FAA,X 

.notInProximity:
    LDA.L $7E7800,X : STA.W $0FA8,X 
    RTS 


RTS_A8978E:
    RTS 


RTS_A8978F:
    RTS 


Namihe_CheckIfSamusIsInProximity:
    LDX.W $0E54 
    LDA.W $0FAC,X : JSL.L IsSamusWithingAPixelRowsOfEnemy 
    RTS 


SetFuneNamiheInstList:
    LDX.W $0E54 
    LDA.W #$0001 : STA.W $0F94,X 
    STZ.W $0F90,X 
    LDA.W $0FA8,X 
    TAY 
    LDA.W $0000,Y : STA.W $0F92,X 
    RTS 


RTL_A897B2:
    RTL 


RTL_A897B3:
    RTL 


Spritemap_Namihe_FacingLeft_Idle_MouthEyeOpened:
    dw $0008,$0008 
    db $0C 
    dw $2127,$0000 
    db $0C 
    dw $2126,$8000 
    db $FC 
    dw $2122,$8000 
    db $EC 
    dw $2120,$81F0 
    db $00 
    dw $2106,$01F8 
    db $FC 
    dw $2135,$01F0 
    db $FC 
    dw $2134,$81F0 
    db $EC 
    dw $2104 

Spritemap_Namihe_FacingLeft_EyeOpened:
    dw $0008,$81F0 
    db $00 
    dw $2106,$01F8 
    db $EC 
    dw $2105,$01F0 
    db $EC 
    dw $2104,$81F0 
    db $F4 
    dw $2108,$0008 
    db $0C 
    dw $2127,$0000 
    db $0C 
    dw $2126,$8000 
    db $FC 
    dw $2122,$8000 
    db $EC 
    dw $2120 

Spritemap_Namihe_FacingLeft_StartOpeningMouth:
    dw $0008,$81EE 
    db $02 
    dw $2106,$01F6 
    db $EC 
    dw $2105,$01EE 
    db $EC 
    dw $2104,$81EE 
    db $F4 
    dw $2108,$0006 
    db $0C 
    dw $2127,$01FE 
    db $0C 
    dw $2126,$81FE 
    db $FC 
    dw $2122,$81FE 
    db $EC 
    dw $2120 

Spritemap_Namihe_FacingLeft_MouthOpening1:
    dw $0008,$81EC 
    db $03 
    dw $2106,$01F4 
    db $EC 
    dw $2105,$01EC 
    db $EC 
    dw $2104,$81EC 
    db $F4 
    dw $2108,$0004 
    db $0C 
    dw $2127,$01FC 
    db $0C 
    dw $2126,$81FC 
    db $FC 
    dw $2122,$81FC 
    db $EC 
    dw $2120 

Spritemap_Namihe_FacingLeft_MouthOpening2:
    dw $0008,$81EA 
    db $04 
    dw $2106,$01F2 
    db $EC 
    dw $2105,$01EA 
    db $EC 
    dw $2104,$81EA 
    db $F4 
    dw $2108,$0002 
    db $0C 
    dw $2127,$01FA 
    db $0C 
    dw $2126,$81FA 
    db $FC 
    dw $2122,$81FA 
    db $EC 
    dw $2120 

Spritemap_Namihe_FacingLeft_MouthMostOpen:
    dw $0008,$81E9 
    db $05 
    dw $2106,$01F0 
    db $EC 
    dw $2105,$01E8 
    db $EC 
    dw $2104,$81E8 
    db $F4 
    dw $2108,$0000 
    db $0C 
    dw $2127,$01F8 
    db $0C 
    dw $2126,$81F8 
    db $FC 
    dw $2122,$81F8 
    db $EC 
    dw $2120 

Spritemap_Namihe_FacingRight_Idle_MouthEyeClosed:
    dw $0008,$01F0 
    db $0C 
    dw $6127,$01F8 
    db $0C 
    dw $6126,$81F0 
    db $FC 
    dw $6122,$81F0 
    db $EC 
    dw $6120,$8000 
    db $00 
    dw $6106,$0000 
    db $FC 
    dw $6135,$0008 
    db $FC 
    dw $6134,$8000 
    db $EC 
    dw $6104 

Spritemap_Namihe_FacingRight_EyeOpened:
    dw $0008,$8000 
    db $00 
    dw $6106,$0000 
    db $EC 
    dw $6105,$0008 
    db $EC 
    dw $6104,$8000 
    db $F4 
    dw $6108,$01F0 
    db $0C 
    dw $6127,$01F8 
    db $0C 
    dw $6126,$81F0 
    db $FC 
    dw $6122,$81F0 
    db $EC 
    dw $6120 

Spritemap_Namihe_FacingRight_StartOpeningMouth:
    dw $0008,$8002 
    db $02 
    dw $6106,$0002 
    db $EC 
    dw $6105,$000A 
    db $EC 
    dw $6104,$8002 
    db $F4 
    dw $6108,$01F2 
    db $0C 
    dw $6127,$01FA 
    db $0C 
    dw $6126,$81F2 
    db $FC 
    dw $6122,$81F2 
    db $EC 
    dw $6120 

Spritemap_Namihe_FacingRight_MouthOpening1:
    dw $0008,$8004 
    db $03 
    dw $6106,$0004 
    db $EC 
    dw $6105,$000C 
    db $EC 
    dw $6104,$8004 
    db $F4 
    dw $6108,$01F4 
    db $0C 
    dw $6127,$01FC 
    db $0C 
    dw $6126,$81F4 
    db $FC 
    dw $6122,$81F4 
    db $EC 
    dw $6120 

Spritemap_Namihe_FacingRight_MouthOpening2:
    dw $0008,$8006 
    db $04 
    dw $6106,$0006 
    db $EC 
    dw $6105,$000E 
    db $EC 
    dw $6104,$8006 
    db $F4 
    dw $6108,$01F6 
    db $0C 
    dw $6127,$01FE 
    db $0C 
    dw $6126,$81F6 
    db $FC 
    dw $6122,$81F6 
    db $EC 
    dw $6120 

Spritemap_Namihe_FacingRight_MouthMostOpen:
    dw $0008,$8007 
    db $05 
    dw $6106,$0008 
    db $EC 
    dw $6105,$0010 
    db $EC 
    dw $6104,$8008 
    db $F4 
    dw $6108,$01F8 
    db $0C 
    dw $6127,$0000 
    db $0C 
    dw $6126,$81F8 
    db $FC 
    dw $6122,$81F8 
    db $EC 
    dw $6120 

Palette_Coven:
    dw $3800,$57FF,$42F7,$0929,$00A5,$4F5A,$36B5,$2610 
    dw $1DCE,$01DF,$001F,$0018,$000A,$06B9,$00EA,$0045 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Coven_BlackPalettes_A899CC:
    dw $3800,$0000,$0000,$0000,$0000,$0000,$0000,$0000 
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000 
    dw $3800,$0000,$0000,$0000,$0000,$0000,$0000,$0000 
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000 
    dw $3800,$0000,$0000,$0000,$0000,$0000,$0000,$0000 
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000 
    dw $3800,$0000,$0000,$0000,$0000,$0000,$0000,$0000 
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000 
    dw $3800,$0000,$0000,$0000,$0000,$0000,$0000,$0000 
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000 
    dw $3800,$0000,$0000,$0000,$0000,$0000,$0000,$0000 
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000 
endif ; !FEATURE_KEEP_UNREFERENCED

InstList_Coven:
    dw $0010 
    dw Spritemap_Coven_0 
    dw $0010 
    dw Spritemap_Coven_1 
    dw $0010 
    dw Spritemap_Coven_2 
    dw Instruction_Common_GotoY 
    dw InstList_Coven 

CovenConstants_SamusMovementCounterThreshold:
    dw $0010 

CovenConstants_SamusStationaryFramesThreshold:
    dw $0040 

CovenConstants_HoveringYAccelerationDeceleration:
    dw $1800 

CovenConstants_InitialHoveringYVelocity:
    dw $0001 

CovenConstants_SleepTimer:
    dw $0078 

CovenConstants_MaterializeTimer:
    dw $0078 

CovenConstants_OffsetsFromSamusToMaterialize_X:
    dw $FFC0 

CovenConstants_OffsetsFromSamusToMaterialize_Y:
    dw $FFC0,$0000,$FFC0,$0040,$0000,$FFC0,$0000,$0000 
    dw $0000,$0040,$0000,$FFC0,$0040,$0000,$0040,$0040 
    dw $0040 

CovenPaletteTransitionDelayTable:
    dw $0001,$0008,$0001,$0008,$0001,$0007,$0001,$0007 
    dw $0002,$0006,$0002,$0006,$0003,$0005,$0003,$0005 
    dw $FFFF 

InitAI_Coven:
    LDX.W $0E54 
    LDA.W $0F86,X : ORA.W #$2500 : STA.W $0F86,X 
    LDA.W #$0001 : STA.W $0F94,X 
    STZ.W $0F90,X 
    LDA.W #InstList_Coven : STA.W $0F92,X 
    LDA.W #Function_Coven_Dematerialized_Asleep : STA.W $0FA8,X 
    LDA.W CovenConstants_SleepTimer : CLC : ADC.W #$00A0 : STA.W $0FAA,X 
    LDX.W $0E54 
    LDA.W $0F96,X 
    XBA 
    ASL #4
    CLC : ADC.W #$0100 : TAX 
    LDA.W #$0010 : STA.B $12 
    LDA.W #$0000 

.loop:
    STA.L $7EC200,X 
    INX #2
    DEC.B $12 
    BPL .loop 
    RTL 


MainAI_Coven:
    LDX.W $0E54 
    JMP.W ($0FA8,X) 


Function_Coven_Materialize_FadeToWhite:
    PHX 
    JSR.W HandleFadeInTimerAndIndex 
    LDY.W #$0010 
    LDX.W $0E54 
    LDA.W $0F96,X 
    XBA 
    ASL #4
    CLC : ADC.W #$0100 : TAX 
    LDA.W #$0010 : STA.B $12 

.loopUpper:
    LDA.L $7EC000,X : AND.W #$001F 
    CMP.W #$001F : BPL .next 
    LDA.L $7EC000,X : CLC : ADC.W #$0421 : STA.L $7EC000,X 
    DEY 

.next:
    INX #2
    DEC.B $12 
    BNE .loopUpper 
    CPY.W #$0010 
    BMI .return 
    LDX.W $0E54 
    LDA.W #Function_Coven_Materialize_FadeFromWhite : STA.W $0FA8,X 
    LDA.W $0F96,X 
    XBA 
    ASL #4
    CLC : ADC.W #$0100 : TAX 
    LDY.W #$0000 

.loopLower:
    LDA.W Palette_Coven,Y : STA.L $7EC200,X 
    INX #2
    INY #2
    CPY.W #$0020 
    BMI .loopLower 

.return:
    PLX 
    RTL 


Function_Coven_Materialize_FadeFromWhite:
    JSR.W AdvanceCovenPaletteTransition 
    PHA 
    LDX.W $0E54 
    JSR.W HandleFadeInTimerAndIndex 
    PLA 
    ORA.W $0FAA,X 
    BNE .return 
    LDA.W $0F86,X : AND.W #$FBFF ; >.< #$FAFF
    AND.W #$FEFF 
    STA.W $0F86,X 
    LDA.W #Function_Coven_Materialized : STA.W $0FA8,X 
    LDA.W $0F7E,X : STA.L $7E7800,X 
    LDA.W #$0001 : STA.W $0FAA,X 
    LDA.W #$0002 : STA.W $0FAC,X 
    LDA.W #$0000 : STA.L $7E7802,X 
    LDA.W CovenConstants_InitialHoveringYVelocity : STA.L $7E7804,X 
    LDA.W CovenConstants_MaterializeTimer : STA.W $0FAA,X 
    LDA.W #$0004 : STA.L $7E780A,X 
    LDA.W $0AF6 : STA.L $7E780C,X 
    STA.L $7E780E,X 
    STA.L $7E7810,X 
    LDA.W #$000C : STA.L $7E7812,X 
    LDA.W $0AFA,X : STA.L $7E7814,X 
    STA.L $7E7816,X 
    STA.L $7E7818,X 
    LDA.W CovenConstants_SamusStationaryFramesThreshold : STA.L $7E781A,X 
    LDA.W CovenConstants_SamusMovementCounterThreshold : STA.L $7E781C,X 

.return:
    RTL 


HandleFadeInTimerAndIndex:
    LDA.W $0FAA,X : BEQ .timerExpired 
    DEC A 
    STA.W $0FAA,X 
    BNE .return 
    LDA.W $0FAC,X 
    TAY 
    LDA.W CovenPaletteTransitionDelayTable,Y : BMI .terminator 
    STA.W $0FAA,X 
    TYA 
    INC #2
    STA.W $0FAC,X 
    TYA 
    BIT.W #$0002 
    BEQ .timerExpired 

.return:
    RTS 


.timerExpired:
    LDA.W $0F86,X : AND.W #$FEFF : STA.W $0F86,X 
    RTS 


.terminator:
    LDA.W #$0000 : STA.W $0FAA,X 
    STA.W $0FAC,X 
    RTS 


Function_Coven_Dematerializing:
    JSR.W AdvanceCovenPaletteTransition 
    CMP.W #$0000 : BNE .return 
    LDX.W $0E54 
    LDA.W #Function_Coven_Dematerialized_Asleep : STA.W $0FA8,X 
    LDA.W $0F86,X : ORA.W #$0100 : STA.W $0F86,X 
    LDA.W CovenConstants_SleepTimer : STA.W $0FAA,X 

.return:
    RTL 


Function_Coven_Materialized:
    LDA.W $0F80,X : CLC : ADC.L $7E7802,X : STA.W $0F80,X 
    LDA.W $0F7E,X : ADC.L $7E7804,X : STA.W $0F7E,X 
    LDA.W $0F7E,X : CMP.L $7E7800,X : BMI .subvelocity 
    LDA.L $7E7802,X : SEC : SBC.W CovenConstants_HoveringYAccelerationDeceleration : STA.L $7E7802,X 
    LDA.L $7E7804,X : SBC.W #$0000 : STA.L $7E7804,X 
    BRA + 


.subvelocity:
    LDA.L $7E7802,X : CLC : ADC.W CovenConstants_HoveringYAccelerationDeceleration : STA.L $7E7802,X 
    LDA.L $7E7804,X : ADC.W #$0000 : STA.L $7E7804,X 

  + LDA.W $0FAA,X 
    DEC A 
    STA.W $0FAA,X 
    BNE .return 
    LDA.W #Function_Coven_Dematerializing : STA.W $0FA8,X 
    LDA.W $0F86,X : ORA.W #$0400 : STA.W $0F86,X 
    LDX.W $0E54 
    LDA.W $0F96,X 
    XBA 
    ASL #4
    CLC : ADC.W #$0100 : TAX 
    LDA.W #$0010 : STA.B $12 
    LDA.W #$7FFF 

.loop:
    STA.L $7EC200,X 
    INX #2
    DEC.B $12 
    BPL .loop 

.return:
    RTL 


Function_Coven_Dematerialized_Asleep:
    LDA.W $0FAA,X : BEQ .timerExpired 
    DEC A 
    STA.W $0FAA,X 
    BNE .return 

.timerExpired:
    LDA.W #$0001 : STA.W $0FAA,X 
    LDA.W #$0002 : STA.W $0FAC,X 
    LDA.W #Function_Coven_Dematerialized_Awake : STA.W $0FA8,X 

.return:
    RTL 


RTL_A89D31:
    RTL 


CovenStationaryZoneXRadius:
    dw $0001 

CovenStationaryZoneYRadius:
    dw $0001 

Function_Coven_Dematerialized_Awake:
    LDA.W $0AF6 : CMP.L $7E780E,X : BMI .breakLockOn 
    CMP.L $7E7810,X : BPL .breakLockOn 
    LDA.W $0AFA,X : CMP.L $7E7816,X : BMI .breakLockOn 
    CMP.L $7E7818,X : BPL .breakLockOn 
    LDA.L $7E781A,X 
    DEC A 
    STA.L $7E781A,X 
    BEQ + 
    JMP.W .updateZone 


  + LDA.W #$0004 : STA.L $7E780A,X 
    LDA.W #$000C : STA.L $7E7812,X 
    BRA .materialize 


.breakLockOn:
    LDA.W CovenConstants_SamusStationaryFramesThreshold : STA.L $7E781A,X 
    LDY.W #$0000 
    LDA.W $0AF6 : SEC : SBC.L $7E780C,X : BMI .checkXMovementDirection 
    BEQ .noXMovement 
    LDY.W #$0008 
    BRA .checkXMovementDirection 


.noXMovement:
    LDY.W #$0004 

.checkXMovementDirection:
    TYA 
    CMP.L $7E780A,X : BEQ .checkYMovement 
    TYA 
    STA.L $7E780A,X 
    LDA.W CovenConstants_SamusMovementCounterThreshold : STA.L $7E781C,X 
    BRA .updateZone 


.materialize:
    LDA.W #Function_Coven_Materialize_FadeToWhite : STA.W $0FA8,X 
    LDA.W CovenConstants_SamusStationaryFramesThreshold : STA.L $7E781A,X 
    LDA.W CovenConstants_SamusMovementCounterThreshold : STA.L $7E781C,X 
    LDA.L $7E780A,X : CLC : ADC.L $7E7812,X : TAY 
    LDA.W $0AF6,X : CLC : ADC.W CovenConstants_OffsetsFromSamusToMaterialize_X,Y : STA.W $0F7A,X 
    LDA.W $0AFA,X : CLC : ADC.W CovenConstants_OffsetsFromSamusToMaterialize_Y,Y : STA.W $0F7E,X 
    RTL 


.checkYMovement:
    LDY.W #$0000 
    LDA.W $0AFA : SEC : SBC.L $7E7814,X : BMI .checkYMovementDirection 
    BEQ .noYMovement 
    LDY.W #$0018 
    BRA .checkYMovementDirection 


.noYMovement:
    LDY.W #$000C 

.checkYMovementDirection:
    TYA 
    CMP.L $7E7812,X : BEQ .matchingYMovementDirection 
    TYA 
    STA.L $7E7812,X 
    LDA.W CovenConstants_SamusMovementCounterThreshold : STA.L $7E781C,X 
    BRA .updateZone 


.matchingYMovementDirection:
    LDA.L $7E781C,X 
    DEC A 
    STA.L $7E781C,X 
    BEQ .materialize 

.updateZone:
    LDA.W $0AF6 : STA.L $7E780C,X 
    SEC : SBC.W CovenStationaryZoneXRadius : STA.L $7E780E,X 
    LDA.W $0AF6 : CLC : ADC.W CovenStationaryZoneXRadius : STA.L $7E7810,X 
    LDA.W $0AFA : STA.L $7E7814,X 
    SEC : SBC.W CovenStationaryZoneYRadius : STA.L $7E7816,X 
    LDA.W $0AFA : CLC : ADC.W CovenStationaryZoneYRadius : STA.L $7E7818,X 
    RTL 


RTL_A89E44:
    RTL 


RTL_A89E45:
    RTL 


Spritemap_Coven_0:
    dw $0004,$8000 
    db $00 
    dw $3106,$81F0 
    db $00 
    dw $3104,$8000 
    db $F0 
    dw $3102,$81F0 
    db $F0 
    dw $3100 

Spritemap_Coven_1:
    dw $0004,$8000 
    db $00 
    dw $310A,$81F0 
    db $00 
    dw $3108,$8000 
    db $F0 
    dw $3102,$81F0 
    db $F0 
    dw $3100 

Spritemap_Coven_2:
    dw $0004,$8000 
    db $00 
    dw $310E,$81F0 
    db $00 
    dw $310C,$8000 
    db $F0 
    dw $3102,$81F0 
    db $F0 
    dw $3100 

AdvanceCovenPaletteTransition:
    PHP : PHX : PHY 
    REP #$30 
    LDY.W #$0000 
    LDA.W $0797 : BEQ .notDoorTransition 
    JMP.W .return 


.notDoorTransition:
    LDX.W $0E54 
    LDA.W $0F96,X 
    XBA 
    ASL #4
    CLC : ADC.W #$0100 : TAX 
    CLC : ADC.W #$0020 : STA.B $14 

.loop:
    LDA.L $7EC200,X : CMP.L $7EC000,X : BNE .notReachedTarget 
    JMP.W .next 


.notReachedTarget:
    AND.W #$001F 
    STA.B $12 
    LDA.L $7EC000,X : AND.W #$001F 
    CMP.B $12 : BEQ .redEnd 
    BPL .notReachedRedTarget 
    INC A 
    BRA + 


.notReachedRedTarget:
    DEC A 

  + STA.B $12 
    LDA.L $7EC000,X : AND.W #$FFE0 
    ORA.B $12 
    STA.L $7EC000,X 
    INY 

.redEnd:
    LDA.L $7EC200,X : AND.W #$03E0 : STA.B $12 
    LDA.L $7EC000,X : AND.W #$03E0 
    CMP.B $12 : BEQ .greenEnd 
    BPL .notReachedGreenTarget 
    CLC : ADC.W #$0020 : BRA + 


.notReachedGreenTarget:
    SEC : SBC.W #$0020 

  + STA.B $12 
    LDA.L $7EC000,X : AND.W #$FC1F 
    ORA.B $12 
    STA.L $7EC000,X 
    INY 

.greenEnd:
    LDA.L $7EC200,X : AND.W #$7C00 : STA.B $12 
    LDA.L $7EC000,X : AND.W #$7C00 
    CMP.B $12 : BEQ .next 
    BPL .notReachedBlueTarget 
    CLC : ADC.W #$0400 : BRA + 


.notReachedBlueTarget:
    SEC : SBC.W #$0400 

  + STA.B $12 
    LDA.L $7EC000,X : AND.W #$83FF 
    ORA.B $12 
    STA.L $7EC000,X 
    INY 

.next:
    INX #2
    CPX.B $14 
    BPL .return 
    JMP.W .loop 


.return:
    TYA 
    PLY : PLX : PLP 
    RTS 


Palette_YappingMaw:
    dw $3800,$57FF,$42F7,$0929,$00A5,$4F5A,$36B5,$2610 
    dw $1DCE,$0000,$0000,$0000,$0000,$0000,$0000,$0000 

InstList_YappingMaw_Attacking_FacingUp:
    dw $0005 
    dw Spritemap_YappingMaw_0 
    dw $0003 
    dw Spritemap_YappingMaw_1 
    dw Instruction_YappingMaw_QueueSFXIfOnScreen 
    dw $0050 
    dw Spritemap_YappingMaw_2 
    dw $0003 
    dw Spritemap_YappingMaw_1 
    dw Instruction_Common_GotoY 
    dw InstList_YappingMaw_Attacking_FacingUp 

InstList_YappingMaw_Attacking_FacingUpRight:
    dw $0005 
    dw Spritemap_YappingMaw_3 
    dw $0003 
    dw Spritemap_YappingMaw_4 
    dw Instruction_YappingMaw_QueueSFXIfOnScreen 
    dw $0050 
    dw Spritemap_YappingMaw_5 
    dw $0003 
    dw Spritemap_YappingMaw_4 
    dw Instruction_Common_GotoY 
    dw InstList_YappingMaw_Attacking_FacingUpRight 

InstList_YappingMaw_Attacking_FacingRight:
    dw $0005 
    dw Spritemap_YappingMaw_6 
    dw $0003 
    dw Spritemap_YappingMaw_7 
    dw Instruction_YappingMaw_QueueSFXIfOnScreen 
    dw $0050 
    dw Spritemap_YappingMaw_8 
    dw $0003 
    dw Spritemap_YappingMaw_7 
    dw Instruction_Common_GotoY 
    dw InstList_YappingMaw_Attacking_FacingRight 

InstList_YappingMaw_Attacking_FacingDownRight:
    dw $0005 
    dw Spritemap_YappingMaw_9 
    dw $0003 
    dw Spritemap_YappingMaw_A 
    dw Instruction_YappingMaw_QueueSFXIfOnScreen 
    dw $0050 
    dw Spritemap_YappingMaw_B 
    dw $0003 
    dw Spritemap_YappingMaw_A 
    dw Instruction_Common_GotoY 
    dw InstList_YappingMaw_Attacking_FacingDownRight 

InstList_YappingMaw_Attacking_FacingDown:
    dw $0005 
    dw Spritemap_YappingMaw_C 
    dw $0003 
    dw Spritemap_YappingMaw_D 
    dw Instruction_YappingMaw_QueueSFXIfOnScreen 
    dw $0050 
    dw Spritemap_YappingMaw_E 
    dw $0003 
    dw Spritemap_YappingMaw_D 
    dw Instruction_Common_GotoY 
    dw InstList_YappingMaw_Attacking_FacingDown 

InstList_YappingMaw_Attacking_FacingDownLeft:
    dw $0005 
    dw Spritemap_YappingMaw_F 
    dw $0003 
    dw Spritemap_YappingMaw_10 
    dw Instruction_YappingMaw_QueueSFXIfOnScreen 
    dw $0050 
    dw Spritemap_YappingMaw_11 
    dw $0003 
    dw Spritemap_YappingMaw_10 
    dw Instruction_Common_GotoY 
    dw InstList_YappingMaw_Attacking_FacingDownLeft 

InstList_YappingMaw_Attacking_FacingLeft:
    dw $0005 
    dw Spritemap_YappingMaw_12 
    dw $0003 
    dw Spritemap_YappingMaw_13 
    dw Instruction_YappingMaw_QueueSFXIfOnScreen 
    dw $0050 
    dw Spritemap_YappingMaw_14 
    dw $0003 
    dw Spritemap_YappingMaw_13 
    dw Instruction_Common_GotoY 
    dw InstList_YappingMaw_Attacking_FacingLeft 

InstList_YappingMaw_Attacking_FacingUpLeft:
    dw $0005 
    dw Spritemap_YappingMaw_15 
    dw $0003 
    dw Spritemap_YappingMaw_16 
    dw Instruction_YappingMaw_QueueSFXIfOnScreen 
    dw $0050 
    dw Spritemap_YappingMaw_17 
    dw $0003 
    dw Spritemap_YappingMaw_16 
    dw Instruction_Common_GotoY 
    dw InstList_YappingMaw_Attacking_FacingUpLeft 

InstList_YappingMaw_Cooldown_FacingUpRight:
    dw Instruction_YappingMaw_OffsetSamusUpRight 
    dw $0004 
    dw Spritemap_YappingMaw_5 

InstList_YappingMaw_Cooldown_FacingUp_0:
    dw Instruction_YappingMaw_OffsetSamusUp 

InstList_YappingMaw_Cooldown_FacingUp_1:
    dw $0050 
    dw Spritemap_YappingMaw_2 
    dw $0003 
    dw Spritemap_YappingMaw_1 
    dw $0005 
    dw Spritemap_YappingMaw_0 
    dw $0003 
    dw Spritemap_YappingMaw_1 
    dw Instruction_YappingMaw_QueueSFXIfOnScreen 
    dw Instruction_Common_GotoY 
    dw InstList_YappingMaw_Cooldown_FacingUp_1 

InstList_YappingMaw_Cooldown_FacingUpLeft_0:
    dw Instruction_YappingMaw_OffsetSamusUpLeft 
    dw $0004 
    dw Spritemap_YappingMaw_17 
    dw Instruction_YappingMaw_OffsetSamusUp 

InstList_YappingMaw_Cooldown_FacingUpLeft_1:
    dw $0050 
    dw Spritemap_YappingMaw_2 
    dw $0003 
    dw Spritemap_YappingMaw_1 
    dw $0005 
    dw Spritemap_YappingMaw_0 
    dw $0003 
    dw Spritemap_YappingMaw_1 
    dw Instruction_YappingMaw_QueueSFXIfOnScreen 
    dw Instruction_CommonA8_GotoY 
    dw InstList_YappingMaw_Cooldown_FacingUpLeft_1 

InstList_YappingMaw_Cooldown_FacingDownRight:
    dw Instruction_YappingMaw_OffsetSamusDownRight 
    dw $0004 
    dw Spritemap_YappingMaw_B 

InstList_YappingMaw_Cooldown_FacingDown_0:
    dw Instruction_YappingMaw_OffsetSamusDown 

InstList_YappingMaw_Cooldown_FacingDown_1:
    dw $0050 
    dw Spritemap_YappingMaw_E 
    dw $0003 
    dw Spritemap_YappingMaw_D 
    dw $0005 
    dw Spritemap_YappingMaw_C 
    dw $0003 
    dw Spritemap_YappingMaw_D 
    dw Instruction_YappingMaw_QueueSFXIfOnScreen 
    dw Instruction_Common_GotoY 
    dw InstList_YappingMaw_Cooldown_FacingDown_1 

InstList_YappingMaw_Cooldown_FacingDownLeft_0:
    dw Instruction_YappingMaw_OffsetSamusDownLeft 
    dw $0004 
    dw Spritemap_YappingMaw_11 
    dw Instruction_YappingMaw_OffsetSamusDown 

InstList_YappingMaw_Cooldown_FacingDownLeft_1:
    dw $0050 
    dw Spritemap_YappingMaw_E 
    dw $0003 
    dw Spritemap_YappingMaw_D 
    dw $0005 
    dw Spritemap_YappingMaw_C 
    dw $0003 
    dw Spritemap_YappingMaw_D 
    dw Instruction_YappingMaw_QueueSFXIfOnScreen 
    dw Instruction_Common_GotoY 
    dw InstList_YappingMaw_Cooldown_FacingDownLeft_1 

InstListPointers_YappingMaw:
    dw InstList_YappingMaw_Attacking_FacingUp 
    dw InstList_YappingMaw_Attacking_FacingUpRight 
    dw InstList_YappingMaw_Attacking_FacingRight 
    dw InstList_YappingMaw_Attacking_FacingDownRight 
    dw InstList_YappingMaw_Attacking_FacingDown 
    dw InstList_YappingMaw_Attacking_FacingDownLeft 
    dw InstList_YappingMaw_Attacking_FacingLeft 
    dw InstList_YappingMaw_Attacking_FacingUpLeft 

YappingMawSamusOffsets_X_Up:
    dw $0000 

YappingMawSamusOffsets_Y_Up:
    dw $FFF0 

YappingMawSamusOffsets_X_UpRight:
    dw $0008 

YappingMawSamusOffsets_Y_UpRight:
    dw $FFF8 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_YappingMawSamusOffsets_X_Right_A8A0AF:
    dw $0010 

UNUSED_YappingMawSamusOffsets_Y_Right_A8A0B1:
    dw $0000 
endif ; !FEATURE_KEEP_UNREFERENCED

YappingMawSamusOffsets_X_DownRight:
    dw $0008 

YappingMawSamusOffsets_Y_DownRight:
    dw $0008 

YappingMawSamusOffsets_X_Down:
    dw $0000 

YappingMawSamusOffsets_Y_Down:
    dw $0010 

YappingMawSamusOffsets_X_DownLeft:
    dw $FFF8 

YappingMawSamusOffsets_Y_DownLeft:
    dw $0008 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_YappingMawSamusOffsets_X_Left_A8A0BF:
    dw $FFF0 

UNUSED_YappingMawSamusOffsets_Y_Left_A8A0C1:
    dw $0000 
endif ; !FEATURE_KEEP_UNREFERENCED

YappingMawSamusOffsets_X_UpLeft:
    dw $FFF8 

YappingMawSamusOffsets_Y_UpLeft:
    dw $FFF8 

Instruction_YappingMaw_OffsetSamusUpRight:
    LDX.W $0E54 
    LDA.W YappingMawSamusOffsets_X_UpRight : STA.L $7E8024,X 
    LDA.W YappingMawSamusOffsets_Y_UpRight : STA.L $7E8026,X 
    RTL 


Instruction_YappingMaw_OffsetSamusUpLeft:
    LDX.W $0E54 
    LDA.W YappingMawSamusOffsets_X_UpLeft : STA.L $7E8024,X 
    LDA.W YappingMawSamusOffsets_Y_UpLeft : STA.L $7E8026,X 
    RTL 


Instruction_YappingMaw_OffsetSamusDownRight:
    LDX.W $0E54 
    LDA.W YappingMawSamusOffsets_X_DownRight : STA.L $7E8024,X 
    LDA.W YappingMawSamusOffsets_Y_DownRight : STA.L $7E8026,X 
    RTL 


Instruction_YappingMaw_OffsetSamusDownLeft:
    LDX.W $0E54 
    LDA.W YappingMawSamusOffsets_X_DownLeft : STA.L $7E8024,X 
    LDA.W YappingMawSamusOffsets_Y_DownLeft : STA.L $7E8026,X 
    RTL 


Instruction_YappingMaw_OffsetSamusUp:
    LDX.W $0E54 
    LDA.W YappingMawSamusOffsets_X_Up : STA.L $7E8024,X 
    LDA.W YappingMawSamusOffsets_Y_Up : STA.L $7E8026,X 
    RTL 


Instruction_YappingMaw_OffsetSamusDown:
    LDX.W $0E54 
    LDA.W YappingMawSamusOffsets_X_Down : STA.L $7E8024,X 
    LDA.W YappingMawSamusOffsets_Y_Down : STA.L $7E8026,X 
    RTL 


Instruction_YappingMaw_QueueSFXIfOnScreen:
    PHY : PHX 
    LDX.W $0E54 
    LDA.L $7E802C,X : BNE .return 
    LDA.W #$002F : JSL.L QueueSound_Lib2_Max6 

.return:
    PLX : PLY 
    RTL 


InitAI_YappingMaw:
    LDX.W $0E54 
    LDA.W $0F7A,X : STA.L $7E7818,X 
    LDA.W $0F7E,X : STA.L $7E781A,X 
    LDA.W #$0000 : STA.L $7E7800,X 
    STA.L $7E7802,X 
    STA.L $7E7804,X 
    STA.L $7E7806,X 
    STA.L $7E7808,X 
    STA.L $7E780A,X 
    STA.L $7E780C,X 
    STA.L $7E780E,X 
    STA.L $7E8020,X 
    LDA.W $0FB4,X : STA.W $0FB2,X 
    LDA.W #$0040 : STA.W $0FB0,X 
    LDA.W #InstList_YappingMaw_Attacking_FacingUp : STA.W $0F92,X 
    LDA.W #$0039 : STA.B $24 
    LDA.W #$0008 : STA.B $22 
    LDA.W $0FB6,X : BNE .keepUp 
    LDA.W #InstList_YappingMaw_Attacking_FacingDown : STA.W $0F92,X 
    LDA.W #$0038 : STA.B $24 
    LDA.W #$FFF8 : STA.B $22 

.keepUp:
    LDA.W #$0001 : STA.W $0F94,X 
    STZ.W $0F90,X 
    LDA.W #Function_YappingMaw_Neutral : STA.W $0FA8,X 
    LDA.W $0F96,X : AND.W #$0E00 : STA.L $7E880A,X 
    LDA.W #$0003 : STA.L $7E8808,X 

.loop:
    LDX.W $0E54 
    LDY.W #EnemyProjectile_YappingMawsBody 
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    LDX.W $0E54 
    LDA.L $7E8808,X 
    DEC A 
    STA.L $7E8808,X 
    BPL .loop 
    LDA.W $0F7A,X : STA.B $12 
    LDA.W $0F7E,X : CLC : ADC.B $22 : STA.B $14 
    LDA.B $24 : STA.B $16 
    LDA.W $0F96,X : ORA.W $0F98,X : STA.L $7E880E,X 
    STA.B $18 
    JSL.L Create_Sprite_Object 
    LDA.B $12 : STA.L $7E880C,X 
    RTL 


MainAI_YappingMaw:
    LDX.W $0E54 
    LDA.L $7E802A,X 
    DEC A 
    STA.L $7E802A,X 
    JSL.L CheckIfEnemyCenterIsOnScreen 
    STA.L $7E802C,X 
    JSR.W ($0FA8,X) 
    JSR.W SetBodySegmentPosition_3 
    JSR.W SetBodySegmentPosition_2 
    JSR.W SetBodySegmentPosition_1 
    JSR.W SetBodySegmentPosition_0 
    RTL 


Function_YappingMaw_Neutral:
    LDX.W $0E54 
    LDA.W $0F7A,X : STA.W $0E32 
    LDA.W $0F7E,X : STA.W $0E34 
    LDA.W $0AF6 : STA.W $0E36 
    LDA.W $0AFA : STA.W $0E38 
    JSL.L CalculateDistanceAndAngleOfSamusFromEnemy 
    JSL.L NegateA_A0B067 
    STA.L $7E7810,X 
    CMP.W #$0020 : BMI .pointBlank 
    CMP.W $0FB2,X : BPL .return 
    LDA.L $7E7810,X ; >_<
    CMP.W #$0040 : BMI + 
    LDA.W #$0040 : STA.L $7E7810,X 

  + LDA.W $0E3A : STA.L $7E7814,X 
    LDA.W #Function_YappingMaw_Attack : STA.W $0FA8,X 

.return:
    RTS 


.pointBlank:
    LDA.W #$0030 : STA.L $7E802A,X 
    RTS 


Function_YappingMaw_Attack:
    LDX.W $0E54 
    STZ.W $0FAA,X 
    STZ.W $0FAC,X 
    STZ.W $0FAE,X 
    LDA.L $7E7810,X 
    LSR A 
    STA.L $7E7812,X 
    LDA.L $7E7814,X : SEC : SBC.W #$0040 : AND.W #$00FF 
    EOR.W #$FFFF 
    INC A 
    CLC : ADC.W #$0100 : AND.W #$00FF 
    STA.L $7E7816,X 
    CMP.W #$0080 : BPL .targetAngleGreaterThanEqualTo80 
    LDA.W #$0000 : STA.L $7E801E,X 
    BRA + 


.targetAngleGreaterThanEqualTo80:
    LDA.W #$0001 : STA.L $7E801E,X 

  + JSR.W CalculateYappingMawOriginPosition 
    LDA.L $7E7814,X : CLC : ADC.W #$0010 : AND.W #$00FF 
    LSR #5
    ASL A 
    STA.L $7E8028,X 
    TAY 
    LDA.W InstListPointers_YappingMaw,Y : STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    STZ.W $0F90,X 
    TYA 
    ASL A 
    TAY 
    LDA.W YappingMawSamusOffsets_X_Up,Y : STA.L $7E8024,X 
    LDA.W YappingMawSamusOffsets_Y_Up,Y : STA.L $7E8026,X 
    LDA.W #Function_YappingMaw_Attacking : STA.W $0FA8,X 
    RTS 


CalculateYappingMawOriginPosition:
    LDX.W $0E54 
    LDA.L $7E7812,X : STA.W $0E32 
    LDA.W #$0080 : JSL.L Math_Cosine_A8A73E 
    STA.L $7E781C,X 
    LDA.L $7E7812,X 
    LSR A 
    STA.W $0E32 
    LDA.W #$0080 : JSL.L Math_Sine_A8A742 
    STA.L $7E781E,X 
    RTS 


CalculateBodySegment1Velocities:
    LDX.W $0E54 
    LDA.L $7E7800,X : STA.W $0E32 
    LDA.W #$0000 : JSL.L Math_Cosine_A8A73E 
    STA.L $7E7820,X 
    LDA.W #$0000 : JSL.L Math_Sine_A8A742 
    STA.L $7E7822,X 
    LDA.L $7E7816,X : JSL.L Math_Cosine_A8A73E 
    SEC : SBC.L $7E7820,X : STA.L $7E800E,X 
    LDA.L $7E7816,X : JSL.L Math_Sine_A8A742 
    SEC : SBC.L $7E7822,X : STA.L $7E8010,X 
    RTS 


CalculateBodySegment2Velocities:
    LDX.W $0E54 
    LDA.L $7E7804,X : STA.W $0E32 
    LDA.W #$0000 : JSL.L Math_Cosine_A8A73E 
    STA.L $7E7820,X 
    LDA.W #$0000 : JSL.L Math_Sine_A8A742 
    STA.L $7E7822,X 
    LDA.L $7E7816,X : JSL.L Math_Cosine_A8A73E 
    SEC : SBC.L $7E7820,X : STA.L $7E8012,X 
    LDA.L $7E7816,X : JSL.L Math_Sine_A8A742 
    SEC : SBC.L $7E7822,X : STA.L $7E8014,X 
    RTS 


CalculateBodySegment3Velocities:
    LDX.W $0E54 
    LDA.L $7E7808,X : STA.W $0E32 
    LDA.W #$0000 : JSL.L Math_Cosine_A8A73E 
    STA.L $7E7820,X 
    LDA.W #$0000 : JSL.L Math_Sine_A8A742 
    STA.L $7E7822,X 
    LDA.L $7E7816,X : JSL.L Math_Cosine_A8A73E 
    SEC : SBC.L $7E7820,X : STA.L $7E8016,X 
    LDA.L $7E7816,X : JSL.L Math_Sine_A8A742 
    SEC : SBC.L $7E7822,X : STA.L $7E8018,X 
    RTS 


CalculateHeadSegmentVelocities:
    LDX.W $0E54 
    LDA.L $7E780C,X : STA.W $0E32 
    LDA.W #$0000 : JSL.L Math_Cosine_A8A73E 
    STA.L $7E7820,X 
    LDA.W #$0000 : JSL.L Math_Sine_A8A742 
    STA.L $7E7822,X 
    LDA.L $7E7816,X : JSL.L Math_Cosine_A8A73E 
    SEC : SBC.L $7E7820,X : STA.L $7E801A,X 
    LDA.L $7E7816,X : JSL.L Math_Sine_A8A742 
    SEC : SBC.L $7E7822,X : STA.L $7E801C,X 
    RTS 


Function_YappingMaw_Attacking:
    LDX.W $0E54 
    LDA.W $0FAA,X 
    LSR #2
    STA.B $14 
    LDA.L $7E801E,X : BNE .notAimingDown 
    SEC 
    LDA.W #$0080 : SBC.B $14 : STA.L $7E8002,X 
    SBC.B $14 : STA.L $7E8004,X 
    SBC.B $14 : STA.L $7E8006,X 
    SBC.B $14 : STA.L $7E8008,X 
    BRA + 


.notAimingDown:
    CLC 
    LDA.W #$0080 : ADC.B $14 : STA.L $7E8002,X 
    ADC.B $14 : STA.L $7E8004,X 
    ADC.B $14 : STA.L $7E8006,X 
    ADC.B $14 : STA.L $7E8008,X 

  + LDA.L $7E7812,X : STA.W $0E32 
    LDA.L $7E8002,X : JSL.L Math_Cosine_A8A73E 
    SEC : SBC.L $7E781C,X : STA.L $7E7800,X 
    LDA.L $7E8004,X : JSL.L Math_Cosine_A8A73E 
    SEC : SBC.L $7E781C,X : STA.L $7E7804,X 
    LDA.L $7E8006,X : JSL.L Math_Cosine_A8A73E 
    SEC : SBC.L $7E781C,X : STA.L $7E7808,X 
    LDA.L $7E8008,X : JSL.L Math_Cosine_A8A73E 
    SEC : SBC.L $7E781C,X : STA.L $7E780C,X 
    LDA.L $7E7812,X 
    LSR A 
    STA.W $0E32 
    LDA.L $7E8002,X : JSL.L Math_Sine_A8A742 
    SEC : SBC.L $7E781E,X : STA.L $7E7802,X 
    LDA.L $7E8004,X : JSL.L Math_Sine_A8A742 
    SEC : SBC.L $7E781E,X : STA.L $7E7806,X 
    LDA.L $7E8006,X : JSL.L Math_Sine_A8A742 
    SEC : SBC.L $7E781E,X : STA.L $7E780A,X 
    LDA.L $7E8008,X : JSL.L Math_Sine_A8A742 
    SEC : SBC.L $7E781E,X : STA.L $7E780E,X 
    JSR.W CalculateBodySegment1Velocities 
    JSR.W CalculateBodySegment2Velocities 
    JSR.W CalculateBodySegment3Velocities 
    JSR.W CalculateHeadSegmentVelocities 
    CLC 
    LDA.L $7E7800,X : ADC.L $7E800E,X : STA.L $7E7800,X 
    LDA.L $7E7802,X : ADC.L $7E8010,X : STA.L $7E7802,X 
    LDA.L $7E7804,X : ADC.L $7E8012,X : STA.L $7E7804,X 
    LDA.L $7E7806,X : ADC.L $7E8014,X : STA.L $7E7806,X 
    LDA.L $7E7808,X : ADC.L $7E8016,X : STA.L $7E7808,X 
    LDA.L $7E780A,X : ADC.L $7E8018,X : STA.L $7E780A,X 
    LDA.L $7E780C,X : ADC.L $7E801A,X : STA.L $7E780C,X 
    LDA.L $7E780E,X : ADC.L $7E801C,X : STA.L $7E780E,X 
    LDA.L $7E7818,X : CLC : ADC.L $7E780C,X : STA.W $0F7A,X 
    LDA.L $7E781A,X : CLC : ADC.L $7E780E,X : STA.W $0F7E,X 
    JSR.W UpdateYappingMawAngularSpeed 
    LDA.W $0FAA,X : CMP.W #$0000 : BMI .cooldown 
    CMP.W #$0080 : BMI .gotoMoveSamus 
    LDA.W #$0080 : STA.W $0FAA,X 
    STZ.W $0FAC,X 
    INC.W $0FAE,X 
    INC.W $0FAE,X 
    INC.W $0FAE,X 
    INC.W $0FAE,X 
    BRA .gotoMoveSamus 


.cooldown:
    LDA.W #Function_YappingMaw_Cooldown : STA.W $0FA8,X 
    LDA.W #$0030 : STA.L $7E802A,X 
    LDA.L $7E8028,X : CMP.W #$0004 : BEQ .upRight 
    CMP.W #$000C : BEQ .upLeft 
    BRA .up 


.gotoMoveSamus:
    BRA .moveSamus 


.upRight:
    LDA.W #InstList_YappingMaw_Cooldown_FacingUpRight : STA.W $0F92,X 
    BRA .upMerge 


.upLeft:
    LDA.W #InstList_YappingMaw_Cooldown_FacingUpLeft_0 : STA.W $0F92,X 
    BRA .upMerge 


.up:
    LDA.W #InstList_YappingMaw_Cooldown_FacingUp_0 : STA.W $0F92,X 

.upMerge:
    LDA.W $0FB6,X : BNE .return 
    LDA.L $7E8028,X : CMP.W #$0004 : BEQ .downRight 
    CMP.W #$000C : BEQ .downLeft 
    BRA .down 


.downRight:
    LDA.W #InstList_YappingMaw_Cooldown_FacingDownRight : STA.W $0F92,X 
    BRA .moveSamus 


.downLeft:
    LDA.W #InstList_YappingMaw_Cooldown_FacingDownLeft_0 : STA.W $0F92,X 
    BRA .moveSamus 


.down:
    LDA.W #InstList_YappingMaw_Cooldown_FacingDown_0 : STA.W $0F92,X 
    BRA .return 


.moveSamus:
    LDA.L $7E8020,X : BEQ .return 
    JSR.W MoveSamusWithYappingMawPincers 

.return:
    RTS 


UpdateYappingMawAngularSpeed:
    LDY.W $0FAE,X 
    LDA.W $0FAA,X : CLC : ADC.W CommonEnemySpeeds_QuadraticallyIncreasing+2,Y : STA.W $0FAA,X 
    LDA.W $0FAC,X : CLC : ADC.W CommonEnemySpeeds_QuadraticallyIncreasing,Y : BCC + 
    INC.W $0FAA,X 

  + STA.W $0FAC,X 
    LDA.W $0FAE,X : CLC : ADC.W #$0008 : STA.W $0FAE,X 
    RTS 


MoveSamusWithYappingMawPincers:
    LDX.W $0E54 
    LDA.W #$0003 : JSL.L Run_Samus_Command 
    LDA.W $0F7A,X : CLC : ADC.L $7E8024,X : STA.W $0AF6 
    LDA.W $0F7E,X : CLC : ADC.L $7E8026,X : STA.W $0AFA 
    JSL.L CapScrollingSpeed 
    RTS 


Function_YappingMaw_Cooldown:
    LDX.W $0E54 
    LDA.L $7E8020,X : BEQ .notGrabbingSamus 
    JSR.W MoveSamusWithYappingMawPincers 

.notGrabbingSamus:
    DEC.W $0FB0,X 
    BPL .return 
    LDA.W $0A60 : CMP.W #SamusPoseInputHandler_Demo : BEQ .return 
    LDA.W #SamusPoseInputHandler_Normal : STA.W $0A60 
    LDA.W #$0000 : STA.L $7E8020,X 
    LDA.W #$0030 : STA.L $7E802A,X 
    LDA.W #$0040 : STA.W $0FB0,X 
    LDA.W #Function_YappingMaw_Neutral : STA.W $0FA8,X 

.return:
    RTS 


SetBodySegmentPosition_0:
    LDX.W $0E54 
    LDA.L $7E8800,X 
    TAY 
    LDA.L $7E7818,X : STA.W $1A4B,Y 
    LDA.L $7E781A,X : STA.W $1A93,Y 
    RTS 


SetBodySegmentPosition_1:
    LDX.W $0E54 
    LDA.L $7E8802,X 
    TAY 
    LDA.L $7E7818,X : CLC : ADC.L $7E7800,X : STA.W $1A4B,Y 
    LDA.L $7E781A,X : CLC : ADC.L $7E7802,X : STA.W $1A93,Y 
    RTS 


SetBodySegmentPosition_2:
    LDX.W $0E54 
    LDA.L $7E8804,X 
    TAY 
    LDA.L $7E7818,X : CLC : ADC.L $7E7804,X : STA.W $1A4B,Y 
    LDA.L $7E781A,X : CLC : ADC.L $7E7806,X : STA.W $1A93,Y 
    RTS 


SetBodySegmentPosition_3:
    LDX.W $0E54 
    LDA.L $7E8806,X 
    TAY 
    LDA.L $7E7818,X : CLC : ADC.L $7E7808,X : STA.W $1A4B,Y 
    LDA.L $7E781A,X : CLC : ADC.L $7E780A,X : STA.W $1A93,Y 
    RTS 


Math_Cosine_A8A73E:
    SEC : SBC.W #$0040 

Math_Sine_A8A742:
    STA.B $12 
    LDA.W #$0100 : SEC : SBC.B $12 : AND.W #$00FF 
    ASL A 
    TAX 
    PHP 
    STZ.B $14 
    STZ.B $16 
    LDA.L SineCosineTables_16bitSine,X : BPL + 
    EOR.W #$FFFF 
    INC A 
    INC.B $14 

  + AND.W #$FF00 
    XBA 
    SEP #$20 
    STA.W $4202 
    LDA.W $0E32 : BEQ + 
    STA.W $4203 
    NOP #3
    REP #$20 
    LDA.W $4216 : AND.W #$FF00 
    XBA 
    ASL A 
    STA.B $16 
    LDA.B $14 : BEQ + 
    LDA.W $4216 
    EOR.W #$FFFF 
    INC A 
    XBA 
    ASL A 
    ORA.W #$FF00 
    STA.B $16 

  + LDA.B $16 
    LDX.W $0E54 
    PLP 
    RTL 


EnemyTouch_YappingMaw:
    LDX.W $0E54 
    LDA.L $7E802A,X : BPL .return 
    LDA.L $7E8020,X : BNE .return 
    LDA.W #$0000 : STA.L $7E802A,X 
    LDA.W #$0001 : STA.L $7E8020,X 
    LDA.W #RTS_90E90E : STA.W $0A60 

.return:
    RTL 


EnemyShot_YappingMaw:
    JSL.L NormalEnemyShotAI 
    LDX.W $0E54 
    LDA.W $0F8C,X : BNE .alive 
    LDA.L $7E8800,X 
    TAY 
    LDA.W #$0000 : STA.W $1997,Y 
    LDA.L $7E8802,X 
    TAY 
    LDA.W #$0000 : STA.W $1997,Y 
    LDA.L $7E8804,X 
    TAY 
    LDA.W #$0000 : STA.W $1997,Y 
    LDA.L $7E8806,X 
    TAY 
    LDA.W #$0000 : STA.W $1997,Y 
    PHX 
    LDA.L $7E880C,X 
    TAX 
    LDA.W #$0000 : STA.L $7EEF78,X 
    PLX 
    LDA.W $0A60 : CMP.W #SamusPoseInputHandler_Demo : BEQ .notDemo 
    LDA.W #SamusPoseInputHandler_Normal : STA.W $0A60 

.notDemo:
    LDA.W #$0000 : STA.L $7E8020,X 
    BRA .return 


.alive:
    LDA.W $0F9E,X : BEQ .return 
    LDA.W $0A60 : CMP.W #SamusPoseInputHandler_Demo : BEQ .alsoNotDemo 
    LDA.W #SamusPoseInputHandler_Normal : STA.W $0A60 

.alsoNotDemo:
    LDA.W #$0000 : STA.L $7E8020,X 

.return:
    RTL 


FrozenAI_YappingMaw:
    JSL.L CommonA8_NormalEnemyFrozenAI 
    LDA.L $7E8800,X 
    TAY 
    JSR.W SetYappingMawBodySegmentFrozenPalette 
    LDA.L $7E8802,X 
    TAY 
    JSR.W SetYappingMawBodySegmentFrozenPalette 
    LDA.L $7E8804,X 
    TAY 
    JSR.W SetYappingMawBodySegmentFrozenPalette 
    LDA.L $7E8806,X 
    TAY 
    JSR.W SetYappingMawBodySegmentFrozenPalette 
    JSR.W SetYappingMawBaseFrozenPalette 
    RTL 


SetYappingMawBodySegmentFrozenPalette:
    LDX.W $0E54 
    LDA.W $19BB,Y : AND.W #$F1FF 
    ORA.L $7E880A,X 
    STA.W $19BB,Y 
    LDA.W $0F9E,X : BEQ .return 
    LDA.W $19BB,Y : AND.W #$F1FF 
    ORA.W #$0C00 
    STA.W $19BB,Y 
    LDA.W $0F9E,X : CMP.W #$005A : BPL .return 
    BIT.W #$0002 
    BNE .return 
    LDA.W $19BB,Y : AND.W #$F1FF 
    ORA.L $7E880A,X 
    STA.W $19BB,Y 

.return:
    RTS 


SetYappingMawBaseFrozenPalette:
    LDX.W $0E54 
    LDA.L $7E880A,X : STA.B $12 
    LDA.L $7E880C,X : STA.B $14 
    TAX 
    LDA.L $7EF078,X : AND.W #$F1FF 
    ORA.B $12 
    STA.L $7EF078,X 
    LDX.W $0E54 
    LDA.W $0F9E,X : BEQ .return 
    LDX.B $14 
    LDA.L $7EF078,X : AND.W #$F1FF 
    ORA.W #$0C00 
    STA.L $7EF078,X 
    LDX.W $0E54 
    LDA.W $0F9E,X : CMP.W #$005A : BPL .return 
    BIT.W #$0002 
    BNE .return 
    LDX.B $14 
    LDA.L $7EF078,X : AND.W #$F1FF 
    ORA.B $12 
    STA.L $7EF078,X 

.return:
    RTS 


Spritemap_YappingMaw_0:
    dw $0005,$81F8 
    db $F8 
    dw $2100,$01F4 
    db $FA 
    dw $210F,$01EC 
    db $FA 
    dw $210E,$0004 
    db $FA 
    dw $610F,$000C 
    db $FA 
    dw $610E 

Spritemap_YappingMaw_1:
    dw $0003,$81F8 
    db $F8 
    dw $2100,$8004 
    db $F0 
    dw $6106,$81EC 
    db $F0 
    dw $2106 

Spritemap_YappingMaw_2:
    dw $0005,$81F8 
    db $F8 
    dw $2100,$0000 
    db $F6 
    dw $610D,$0000 
    db $EE 
    dw $610C,$01F8 
    db $F6 
    dw $210D,$01F8 
    db $EE 
    dw $210C 

Spritemap_YappingMaw_3:
    dw $0003,$81F8 
    db $F8 
    dw $2102,$81F2 
    db $EE 
    dw $2106,$8002 
    db $FE 
    dw $E108 

Spritemap_YappingMaw_4:
    dw $0005,$81F8 
    db $F8 
    dw $2102,$0005 
    db $FD 
    dw $610F,$000D 
    db $FD 
    dw $610E,$01FB 
    db $F3 
    dw $210D,$01FB 
    db $EB 
    dw $210C 

Spritemap_YappingMaw_5:
    dw $0003,$81F8 
    db $F8 
    dw $2102,$8001 
    db $F4 
    dw $6106,$81FC 
    db $EF 
    dw $6108 

Spritemap_YappingMaw_6:
    dw $0005,$81F8 
    db $F8 
    dw $2104,$01FE 
    db $04 
    dw $A10D,$01FE 
    db $0C 
    dw $A10C,$01FE 
    db $F4 
    dw $210D,$01FE 
    db $EC 
    dw $210C 

Spritemap_YappingMaw_7:
    dw $0003,$81F8 
    db $F8 
    dw $2104,$8000 
    db $EC 
    dw $6108,$8000 
    db $04 
    dw $E108 

Spritemap_YappingMaw_8:
    dw $0005,$81F8 
    db $F8 
    dw $2104,$0003 
    db $F8 
    dw $E10F,$000B 
    db $F8 
    dw $E10E,$0003 
    db $00 
    dw $610F,$000B 
    db $00 
    dw $610E 

Spritemap_YappingMaw_9:
    dw $0003,$81F8 
    db $F8 
    dw $A102,$81F2 
    db $02 
    dw $A106,$8002 
    db $F2 
    dw $6108 

Spritemap_YappingMaw_A:
    dw $0005,$81F8 
    db $F8 
    dw $A102,$0005 
    db $FB 
    dw $E10F,$000D 
    db $FB 
    dw $E10E,$01FB 
    db $05 
    dw $A10D,$01FB 
    db $0D 
    dw $A10C 

Spritemap_YappingMaw_B:
    dw $0003,$81F8 
    db $F8 
    dw $A102,$8001 
    db $FC 
    dw $E106,$81FC 
    db $01 
    dw $E108 

Spritemap_YappingMaw_C:
    dw $0005,$81F8 
    db $F8 
    dw $A100,$01F4 
    db $FE 
    dw $A10F,$01EC 
    db $FE 
    dw $A10E,$0004 
    db $FE 
    dw $E10F,$000C 
    db $FE 
    dw $E10E 

Spritemap_YappingMaw_D:
    dw $0003,$81F8 
    db $F8 
    dw $A100,$8004 
    db $00 
    dw $E106,$81EC 
    db $00 
    dw $A106 

Spritemap_YappingMaw_E:
    dw $0005,$81F8 
    db $F8 
    dw $A100,$0000 
    db $02 
    dw $E10D,$0000 
    db $0A 
    dw $E10C,$01F8 
    db $02 
    dw $A10D,$01F8 
    db $0A 
    dw $A10C 

Spritemap_YappingMaw_F:
    dw $0003,$81F8 
    db $F8 
    dw $E102,$81FE 
    db $02 
    dw $E106,$81EE 
    db $F2 
    dw $2108 

Spritemap_YappingMaw_10:
    dw $0005,$81F8 
    db $F8 
    dw $E102,$01F3 
    db $FB 
    dw $A10F,$01EB 
    db $FB 
    dw $A10E,$01FD 
    db $05 
    dw $E10D,$01FD 
    db $0D 
    dw $E10C 

Spritemap_YappingMaw_11:
    dw $0003,$81F8 
    db $F8 
    dw $E102,$81EF 
    db $FC 
    dw $A106,$81F4 
    db $01 
    dw $A108 

Spritemap_YappingMaw_12:
    dw $0005,$81F8 
    db $F8 
    dw $6104,$01FA 
    db $04 
    dw $E10D,$01FA 
    db $0C 
    dw $E10C,$01FA 
    db $F4 
    dw $610D,$01FA 
    db $EC 
    dw $610C 

Spritemap_YappingMaw_13:
    dw $0003,$81F8 
    db $F8 
    dw $6104,$81F0 
    db $EC 
    dw $2108,$81F0 
    db $04 
    dw $A108 

Spritemap_YappingMaw_14:
    dw $0005,$81F8 
    db $F8 
    dw $6104,$01F5 
    db $F8 
    dw $A10F,$01ED 
    db $F8 
    dw $A10E,$01F5 
    db $00 
    dw $210F,$01ED 
    db $00 
    dw $210E 

Spritemap_YappingMaw_15:
    dw $0003,$81F8 
    db $F8 
    dw $6102,$81FE 
    db $EE 
    dw $6106,$81EE 
    db $FE 
    dw $A108 

Spritemap_YappingMaw_16:
    dw $0005,$81F8 
    db $F8 
    dw $6102,$01F3 
    db $FD 
    dw $210F,$01EB 
    db $FD 
    dw $210E,$01FD 
    db $F3 
    dw $610D,$01FD 
    db $EB 
    dw $610C 

Spritemap_YappingMaw_17:
    dw $0003,$81F8 
    db $F8 
    dw $6102,$81EF 
    db $F4 
    dw $2106,$81F4 
    db $EF 
    dw $2108 

Palette_Kago:
    dw $3800,$57FF,$42F7,$0929,$00A5,$4F5A,$36B5,$2610 
    dw $1DCE,$01DF,$001F,$0018,$000A,$06B9,$00EA,$0045 

InstList_Kago_Initial_SlowAnimation:
    dw $000A 
    dw Spritemap_Kago_0 
    dw $000A 
    dw Spritemap_Kago_1 
    dw $000A 
    dw Spritemap_Kago_2 
    dw $000A 
    dw Spritemap_Kago_1 
    dw Instruction_Common_GotoY 
    dw InstList_Kago_Initial_SlowAnimation 

InstList_Kago_TakenHit_FastAnimation:
    dw $0003 
    dw Spritemap_Kago_0 
    dw $0003 
    dw Spritemap_Kago_1 
    dw $0003 
    dw Spritemap_Kago_2 
    dw $0003 
    dw Spritemap_Kago_1 
    dw Instruction_Common_GotoY 
    dw InstList_Kago_TakenHit_FastAnimation 

InitAI_Kago:
    LDX.W $0E54 
    LDA.W $0F86,X : ORA.W #$2000 : STA.W $0F86,X 
    LDA.W #$0001 : STA.W $0F94,X 
    STZ.W $0F90,X 
    STZ.W $0FB0,X 
    LDA.W #InstList_Kago_Initial_SlowAnimation : STA.W $0F92,X 
    LDA.W #Function_Kago_Nothing : STA.W $0FA8,X 
    STZ.W $0FB2,X 
    LDA.W $0FB4,X : STA.L $7E7808,X 
    RTL 


MainAI_Kago:
    LDX.W $0E54 
    JMP.W ($0FA8,X) 


Function_Kago_Nothing:
    LDA.W #RTL_A8AB81 : STA.W $0FA8,X ; fallthrough to RTL_A8AB81

RTL_A8AB81:
    RTL 


RTL_A8AB82:
    RTL 


EnemyShot_Kago:
    PHX : PHY 
    JSL.L NormalEnemyShotAI 
    LDA.W #$0002 : STA.W $183E 
    LDA.W #$0010 : STA.W $1840 
    LDX.W $0E54 
    LDA.W $0FAA,X : BNE .takenHit 
    LDA.W #$0001 : STA.W $0FAA,X 
    LDA.W #InstList_Kago_TakenHit_FastAnimation : STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 

.takenHit:
    LDA.L $7E7808,X : SEC : SBC.W #$0001 : STA.L $7E7808,X 
    BPL .notDead 
    LDA.W #$0004 : JSL.L EnemyDeath 
    LDX.W $0E54 
    LDA.W #$0001 : STA.W $0FB2,X 

.notDead:
    LDY.W #EnemyProjectile_KagoBug 
    LDA.W $0F7E,X : JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    PLY : PLX 
    RTL 


Spritemap_Kago_0:
    dw $0004,$8000 
    db $00 
    dw $210E,$81F0 
    db $00 
    dw $210C,$8000 
    db $F0 
    dw $2102,$81F0 
    db $F0 
    dw $2100 

Spritemap_Kago_1:
    dw $0004,$8000 
    db $00 
    dw $2122,$81F0 
    db $00 
    dw $2120,$8000 
    db $F0 
    dw $2106,$81F0 
    db $F0 
    dw $2104 

Spritemap_Kago_2:
    dw $0004,$8000 
    db $00 
    dw $2126,$81F0 
    db $00 
    dw $2124,$8000 
    db $F0 
    dw $210A,$81F0 
    db $F0 
    dw $2108 

Palette_Magdollite:
    dw $3800,$001F,$001C,$0018,$0015,$7FFF,$3BE0,$2680 
    dw $1580 

Palette_Magdollite_Glow_0:
    dw $023F 

Palette_Magdollite_Glow_1:
    dw $00BD 

Palette_Magdollite_Glow_2:
    dw $0014 

Palette_Magdollite_Glow_3:
    dw $0010,$0000,$0000,$0000,$3800,$0000,$0000,$0000 
    dw $0000,$0000,$0000,$0000,$0000,$00BD,$0014,$0010 
    dw $023F,$0000,$0000,$0000,$3800,$0000,$0000,$0000 
    dw $0000,$0000,$0000,$0000,$0000,$0014,$0010,$023F 
    dw $00BD,$0000,$0000,$0000,$3800,$0000,$0000,$0000 
    dw $0000,$0000,$0000,$0000,$0000,$0010,$023F,$00BD 
    dw $0014,$0000,$0000,$0000 

InstList_Magdollite_Idling_FacingLeft:
    dw $000D 
    dw Spritemap_Magdollite_FacingLeft_Head_0 
    dw $000D 
    dw Spritemap_Magdollite_FacingLeft_Head_1 
    dw $000D 
    dw Spritemap_Magdollite_FacingLeft_Head_2 
    dw $000D 
    dw Spritemap_Magdollite_FacingLeft_Head_1 
    dw Instruction_CommonA8_GotoY 
    dw InstList_Magdollite_Idling_FacingLeft 

InstList_Magdollite_Slave2_ThrowFireballs_FacingLeft:
    dw Instruction_Magdollite_QueueSFXInY_Lib2_Max6_IfOnScreen 
    dw $0061 
    dw Instruction_Magdollite_SetWaitingFlag 
    dw Instruction_Magdollite_SetCooldownTimerTo100 
    dw $001A 
    dw Spritemap_Magdollite_FacingLeft_Fist_0 
    dw $0008 
    dw Spritemap_Magdollite_FacingLeft_Fist_1 
    dw Instruction_Magdollite_ShiftLeft8Pixels_Up4Pixels_FacingLeft 
    dw $0005 
    dw Spritemap_Magdollite_FacingLeft_Hand_FingersStraight 
    dw Instruction_Magdollite_SpawnLavaProjectile 
    dw $0005 
    dw Spritemap_Magdollite_FacingLeft_Hand_FingersStraight 
    dw Instruction_Magdollite_SpawnLavaProjectile 
    dw $0005 
    dw Spritemap_Magdollite_FacingLeft_Hand_FingersStraight 
    dw Instruction_Magdollite_SpawnLavaProjectile 
    dw Instruction_Magdollite_ShiftLeft8Pixels_Up4Pixels_Left_dup 
    dw $0005 
    dw Spritemap_Magdollite_FacingLeft_Hand_FingersCurled 
    dw Instruction_Magdollite_ResetWaitingFlag 
    dw Instruction_Common_Sleep 

InstList_Magdollite_SplashIntoLavaAndFormBasePillar_Left_0:
    dw Instruction_Magdollite_SetWaitingFlag 
    dw $0005 
    dw Spritemap_Magdollite_FacingLeft_Head_1 
    dw Instruction_Magdollite_MoveDown2Pixels 
    dw $0005 
    dw Spritemap_Magdollite_FacingLeft_Head_1 
    dw $0005 
    dw Spritemap_Magdollite_FacingLeft_Head_PokingOutOfLava 
    dw $0005 
    dw Spritemap_Magdollite_FacingLeft_Head_BarelyPokingOutOfLava 
    dw Instruction_Magdollite_MoveDown2Pixels 
    dw $0005 
    dw Spritemap_Magdollite_FacingLeft_Head_BarelyPokingOutOfLava 
    dw Instruction_Magdollite_MoveDownBy18Pixels_SetSlavesAsVisible 
    dw Instruction_Common_TimerInY 
    dw $0018 

InstList_Magdollite_SplashIntoLavaAndFormBasePillar_Left_1:
    dw Instruction_Magdollite_MoveBaseAndPillarUp1Pixel 
    dw $0001 
    dw Spritemap_Magdollite_FacingLeft_WidePillarSection 
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate 
    dw InstList_Magdollite_SplashIntoLavaAndFormBasePillar_Left_1 
    dw Instruction_Magdollite_ResetWaitingFlag 
    dw Instruction_Common_Sleep 

InstList_Magdollite_UnformBasePillar_SplashBackToIdle_Left_0:
    dw Instruction_Magdollite_SetWaitingFlag 
    dw Instruction_Magdollite_RestoreInitialYPositions 
    dw Instruction_Common_TimerInY 
    dw $0018 

InstList_Magdollite_UnformBasePillar_SplashBackToIdle_Left_1:
    dw Instruction_Magdollite_MoveBaseAndPillarDown1Pixel 
    dw $0001 
    dw Spritemap_Magdollite_FacingLeft_WidePillarSection 
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate 
    dw InstList_Magdollite_UnformBasePillar_SplashBackToIdle_Left_1 
    dw Instruction_Magdollite_MoveDown4Pixels_SetSlavesAsInvisible 
    dw $0005 
    dw Spritemap_Magdollite_FacingLeft_Head_BarelyPokingOutOfLava 
    dw Instruction_Magdollite_MoveUp2Pixels 
    dw $0005 
    dw Spritemap_Magdollite_FacingLeft_Head_BarelyPokingOutOfLava 
    dw $0005 
    dw Spritemap_Magdollite_FacingLeft_Head_PokingOutOfLava 
    dw $0005 
    dw Spritemap_Magdollite_FacingLeft_Head_1 
    dw Instruction_Magdollite_MoveUp2Pixels 
    dw $0005 
    dw Spritemap_Magdollite_FacingLeft_Head_1 
    dw Instruction_Magdollite_ResetWaitingFlag 
    dw Instruction_Common_Sleep 

InstList_Magdollite_Idling_FacingRight:
    dw $000D 
    dw Spritemap_Magdollite_FacingRight_Head_0 
    dw $000D 
    dw Spritemap_Magdollite_FacingRight_Head_1 
    dw $000D 
    dw Spritemap_Magdollite_FacingRight_Head_2 
    dw $000D 
    dw Spritemap_Magdollite_FacingRight_Head_1 
    dw Instruction_Common_GotoY 
    dw InstList_Magdollite_Idling_FacingRight 

InstList_Magdollite_ThrowFireballs_FacingRight:
    dw Instruction_Magdollite_QueueSFXInY_Lib2_Max6_IfOnScreen 
    dw $0061 
    dw Instruction_Magdollite_SetWaitingFlag 
    dw Instruction_Magdollite_SetCooldownTimerTo100 
    dw $001A 
    dw Spritemap_Magdollite_FacingRight_Fist_0 
    dw $0008 
    dw Spritemap_Magdollite_FacingRight_Fist_1 
    dw Instruction_Magdollite_ShiftRight8Pixels_Up4Pixels_FaceRight 
    dw $0005 
    dw Spritemap_Magdollite_FacingRight_Hand_FingersStraight 
    dw Instruction_Magdollite_SpawnLavaProjectile 
    dw $0005 
    dw Spritemap_Magdollite_FacingRight_Hand_FingersStraight 
    dw Instruction_Magdollite_SpawnLavaProjectile 
    dw $0005 
    dw Spritemap_Magdollite_FacingRight_Hand_FingersStraight 
    dw Instruction_Magdollite_SpawnLavaProjectile 
    dw Instruction_Magdollite_ShiftRight8Pixels_Up4Pixels_Right_dup 
    dw $0005 
    dw Spritemap_Magdollite_FacingRight_Hand_FingersCurled 
    dw Instruction_Magdollite_ResetWaitingFlag 
    dw Instruction_Common_Sleep 

InstList_Magdollite_SplashIntoLavaAndFormBasePillar_Right_0:
    dw Instruction_Magdollite_SetWaitingFlag 
    dw $0005 
    dw Spritemap_Magdollite_FacingRight_Head_1 
    dw Instruction_Magdollite_MoveDown2Pixels 
    dw $0005 
    dw Spritemap_Magdollite_FacingRight_Head_1 
    dw $0005 
    dw Spritemap_Magdollite_FacingRight_Head_PokingOutOfLava 
    dw $0005 
    dw Spritemap_Magdollite_FacingRight_Head_BarelyPokingOutOfLava 
    dw Instruction_Magdollite_MoveDown2Pixels 
    dw $0005 
    dw Spritemap_Magdollite_FacingRight_Head_BarelyPokingOutOfLava 
    dw Instruction_Magdollite_MoveDownBy18Pixels_SetSlavesAsVisible 
    dw Instruction_Common_TimerInY 
    dw $0018 

InstList_Magdollite_SplashIntoLavaAndFormBasePillar_Right_1:
    dw Instruction_Magdollite_MoveBaseAndPillarUp1Pixel 
    dw $0001 
    dw Spritemap_Magdollite_FacingRight_WidePillarSection 
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate 
    dw InstList_Magdollite_SplashIntoLavaAndFormBasePillar_Right_1 
    dw Instruction_Magdollite_ResetWaitingFlag 
    dw Instruction_Common_Sleep 

InstList_Magdollite_UnformBasePillar_SplashBackToIdle_Right_0:
    dw Instruction_Magdollite_SetWaitingFlag 
    dw Instruction_Magdollite_RestoreInitialYPositions 
    dw Instruction_Common_TimerInY 
    dw $0018 

InstList_Magdollite_UnformBasePillar_SplashBackToIdle_Right_1:
    dw Instruction_Magdollite_MoveBaseAndPillarDown1Pixel 
    dw $0001 
    dw Spritemap_Magdollite_FacingRight_WidePillarSection 
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate 
    dw InstList_Magdollite_UnformBasePillar_SplashBackToIdle_Right_1 
    dw Instruction_Magdollite_MoveDown4Pixels_SetSlavesAsInvisible 
    dw $0005 
    dw Spritemap_Magdollite_FacingRight_Head_BarelyPokingOutOfLava 
    dw Instruction_Magdollite_MoveUp2Pixels 
    dw $0005 
    dw Spritemap_Magdollite_FacingRight_Head_BarelyPokingOutOfLava 
    dw $0005 
    dw Spritemap_Magdollite_FacingRight_Head_PokingOutOfLava 
    dw $0005 
    dw Spritemap_Magdollite_FacingRight_Head_1 
    dw Instruction_Magdollite_MoveUp2Pixels 
    dw $0005 
    dw Spritemap_Magdollite_FacingRight_Head_1 
    dw Instruction_Magdollite_ResetWaitingFlag 
    dw Instruction_Common_Sleep 

InstList_Magdollite_Slave1_NarrowPillar_FacingLeft:
    dw $0001 
    dw Spritemap_Magdollite_FacingLeft_NarrowPillarSection 
    dw Instruction_Common_Sleep 

InstList_Magdollite_Slave1_NarrowPillar_FacingRight:
    dw $0001 
    dw Spritemap_Magdollite_FacingRight_NarrowPillarSection 
    dw Instruction_Common_Sleep 

InstList_Magdollite_Slave1_3xPillarStack:
    dw $0001 
    dw Spritemap_Magdollite_NarrowPillarStacks_3x 
    dw Instruction_Common_Sleep 

InstList_Magdollite_Slave1_4xPillarStack:
    dw $0001 
    dw Spritemap_Magdollite_NarrowPillarStacks_4x 
    dw Instruction_Common_Sleep 

InstList_Magdollite_Slave1_5xPillarStack:
    dw $0001 
    dw Spritemap_Magdollite_NarrowPillarStacks_5x 
    dw Instruction_Common_Sleep 

InstList_Magdollite_Slave1_6xPillarStack:
    dw $0001 
    dw Spritemap_Magdollite_NarrowPillarStacks_6x 
    dw Instruction_Common_Sleep 

InstList_Magdollite_Slave1_7xPillarStack:
    dw $0001 
    dw Spritemap_Magdollite_NarrowPillarStacks_7x 
    dw Instruction_Common_Sleep 

InstList_Magdollite_Slave1_8xPillarStack:
    dw $0001 
    dw Spritemap_Magdollite_NarrowPillarStacks_8x 
    dw Instruction_Common_Sleep 

InstList_Magdollite_Slave2_PillarCap:
    dw $0001 
    dw Spritemap_Magdollite_FacingLeft_PillarCap 
    dw Instruction_CommonA8_Sleep 

Instruction_Magdollite_QueueSFXInY_Lib2_Max6_IfOnScreen:
    PHX : PHY 
    JSL.L CheckIfEnemyCenterIsOnScreen 
    BNE .offScreen 
    LDA.W $0000,Y : JSL.L QueueSound_Lib2_Max6 

.offScreen:
    PLY : PLX 
    INY #2
    RTL 


Instruction_Magdollite_MoveDown2Pixels:
    LDX.W $0E54 
    INC.W $0F7E,X 
    INC.W $0F7E,X 
    RTL 


Instruction_Magdollite_MoveUp2Pixels:
    LDX.W $0E54 
    DEC.W $0F7E,X 
    DEC.W $0F7E,X 
    RTL 


Instruction_Magdollite_SetWaitingFlag:
    LDX.W $0E54 
    LDA.W #$0001 : STA.L $7E7802,X 
    RTL 


Instruction_Magdollite_ResetWaitingFlag:
    LDX.W $0E54 
    LDA.W #$0000 : STA.L $7E7802,X 
    RTL 


Instruction_Magdollite_MoveBaseAndPillarUp1Pixel:
    LDX.W $0E54 
    DEC.W $0F7E,X 
    DEC.W $0FBE,X 
    RTL 


Instruction_Magdollite_MoveBaseAndPillarDown1Pixel:
    LDX.W $0E54 
    INC.W $0F7E,X 
    INC.W $0FBE,X 
    RTL 


Instruction_Magdollite_MoveDownBy18Pixels_SetSlavesAsVisible:
    LDX.W $0E54 
    LDA.L $7E7806,X : CLC : ADC.W #$0018 : STA.W $0F7E,X 
    STA.W $0FBE,X 
    LDA.W $0FC6,X : AND.W #$FEFF : STA.W $0FC6,X 
    LDA.W $1006,X : AND.W #$FEFF : STA.W $1006,X 
    RTL 


Instruction_Magdollite_RestoreInitialYPositions:
    LDX.W $0E54 
    LDA.L $7E7806,X : STA.W $0F7E,X 
    STA.W $0FBE,X 
    RTL 


Instruction_Magdollite_MoveDown4Pixels_SetSlavesAsInvisible:
    LDX.W $0E54 
    LDA.L $7E7806,X : CLC : ADC.W #$0004 : STA.W $0F7E,X 
    STA.W $0FBE,X 
    LDA.W $0FC6,X : ORA.W #$0100 : STA.W $0FC6,X 
    LDA.W $1006,X : ORA.W #$0100 : STA.W $1006,X 
    RTL 


Instruction_Magdollite_SpawnLavaProjectile:
    PHY 
    LDX.W $0E54 
    LDY.W #EnemyProjectile_Magdollite 
    LDA.W $0FAA,X : JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    PLY 
    RTL 


Instruction_Magdollite_ShiftRight8Pixels_Up4Pixels_FaceRight:
    LDX.W $0E54 
    LDA.L $7E7824,X : CLC : ADC.W #$0008 : STA.W $0F7A,X 
    LDA.L $7E7826,X : CLC : ADC.W #$FFFC : STA.W $0F7E,X 
    RTL 


Instruction_Magdollite_ShiftLeft8Pixels_Up4Pixels_FacingLeft:
    LDX.W $0E54 
    LDA.L $7E7824,X : CLC : ADC.W #$FFF8 : STA.W $0F7A,X 
    LDA.L $7E7826,X : CLC : ADC.W #$FFFC : STA.W $0F7E,X 
    RTL 


Instruction_Magdollite_ShiftRight8Pixels_Up4Pixels_Right_dup:
    LDX.W $0E54 
    LDA.L $7E7824,X : CLC : ADC.W #$0008 : STA.W $0F7A,X 
    LDA.L $7E7826,X : CLC : ADC.W #$FFF8 : STA.W $0F7E,X 
    RTL 


Instruction_Magdollite_ShiftLeft8Pixels_Up4Pixels_Left_dup:
    LDX.W $0E54 
    LDA.L $7E7824,X : CLC : ADC.W #$FFF8 : STA.W $0F7A,X 
    LDA.L $7E7826,X : CLC : ADC.W #$FFFC : STA.W $0F7E,X 
    RTL 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Magdollite_RestoreXYPositions_A8AF32:
    LDX.W $0E54 
    LDA.L $7E7824,X : STA.W $0F7A,X 
    LDA.L $7E7826,X : STA.W $0F7E,X 
    RTL 
endif ; !FEATURE_KEEP_UNREFERENCED


Instruction_Magdollite_SetCooldownTimerTo100:
    LDX.W $0E54 
    LDA.W #$0100 : STA.L $7E7808,X 
    RTL 


InitAIFunctionPointers:
    dw Function_Magdollite_Init_Master 
    dw Function_Magdollite_Init_Slave1 
    dw Function_Magdollite_Init_Slave2 

MagdolliteArmHeightThreshold:
    dw $0000,$0010,$0020,$0030,$0040,$0050,$0060,$0070 
    dw $0080 

MagdolliteSlave1InstListPointers:
    dw InstList_Magdollite_Slave1_NarrowPillar_FacingLeft 
    dw InstList_Magdollite_Slave1_NarrowPillar_FacingLeft 
    dw InstList_Magdollite_Slave1_NarrowPillar_FacingRight 
    dw InstList_Magdollite_Slave1_3xPillarStack 
    dw InstList_Magdollite_Slave1_4xPillarStack 
    dw InstList_Magdollite_Slave1_5xPillarStack 
    dw InstList_Magdollite_Slave1_6xPillarStack 
    dw InstList_Magdollite_Slave1_7xPillarStack 
    dw InstList_Magdollite_Slave1_8xPillarStack 

MagdolliteYOffsetAimingAtSamus:
    dw $000C,$000C,$0014,$001C,$0024,$002C,$0034,$003C 
    dw $0044 

InitAI_Magdollite:
    LDX.W $0E54 
    LDA.W $0FB4,X 
    ASL A 
    TAX 
    JSR.W (InitAIFunctionPointers,X) 
    JSR.W GetMagdolliteSpeeds 
    JSR.W SetMagdolliteGraphicsDrawnHook 
    RTL 


Function_Magdollite_Init_Master:
    LDX.W $0E54 
    LDA.W #$0000 : STA.W $0FAC,X 
    STA.L $7E7800,X 
    STA.L $7E7804,X 
    LDA.W $0F7E,X : STA.L $7E7806,X 
    JSL.L Get_SamusX_minus_EnemyX 
    BPL .keepLeft 
    LDA.W #$0001 : STA.L $7E7800,X 

.keepLeft:
    LDA.L $7E7800,X 
    LDA.W #InstList_Magdollite_Idling_FacingLeft : STA.W $0FAE,X 
    LDA.L $7E7800,X : BNE .keepLeft2 
    LDA.W #InstList_Magdollite_Idling_FacingRight : STA.W $0FAE,X 

.keepLeft2:
    JSR.W CheckIfMagdolliteInstListChanged 
    LDA.W #Function_Magdollite_WaitForSamusToGetNear : STA.W $0FB2,X 
    RTS 


Function_Magdollite_Init_Slave1:
    LDX.W $0E54 
    LDA.W $0F7E,X : STA.L $7E7806,X 
    LDA.W #$0000 : STA.W $0FAC,X 
    STA.L $7E7818,X 
    LDA.W #$0001 : STA.L $7E781A,X 
    LDA.W #InstList_Magdollite_Slave1_NarrowPillar_FacingLeft : STA.W $0FAE,X 
    JSR.W CheckIfMagdolliteInstListChanged 
    LDA.W $0F7E,X : CLC : ADC.W #$0020 : STA.W $0F7E,X 
    LDA.W #Function_Magdollite_Slave1_WaitForAttackToBeTriggered : STA.W $0FB2,X 
    LDA.W $0F86,X : ORA.W #$0100 : STA.W $0F86,X 
    RTS 


Function_Magdollite_Init_Slave2:
    LDX.W $0E54 
    LDA.W $0F7E,X : STA.L $7E7806,X 
    LDA.W $0F7A,X : STA.L $7E7822,X 
    LDA.W #$0000 : STA.W $0FAC,X 
    STA.L $7E7808,X 
    LDA.W #InstList_Magdollite_Slave2_PillarCap : STA.W $0FAE,X 
    JSR.W CheckIfMagdolliteInstListChanged 
    LDA.W $0F7E,X : CLC : ADC.W #$0020 : STA.W $0F7E,X 
    LDA.W #Function_Magdollite_Slave2_Idling_WaitingForTrigger : STA.W $0FB2,X 
    LDA.W $0F86,X : ORA.W #$0100 : STA.W $0F86,X 
    RTS 


GetMagdolliteSpeeds:
    LDX.W $0E54 
    LDA.W $0FB7,X : AND.W #$00FF 
    ASL #3
    TAY 
    LDA.W CommonEnemySpeeds_LinearlyIncreasing,Y : STA.L $7E7810,X 
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+2,Y : STA.L $7E780E,X 
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+4,Y : STA.L $7E7814,X 
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+6,Y : STA.L $7E7812,X 
    RTS 


SetMagdolliteGraphicsDrawnHook:
    LDA.W #EnemyGraphicsDrawnHook_Magdollite_PeriodicallyCyclePalettes : STA.W $178C 
    LDA.W #EnemyGraphicsDrawnHook_Magdollite_PeriodicallyCyclePalettes>>16 : STA.W $178E 
    LDA.W $0F96,X : AND.W #$0E00 
    LSR #4
    CLC : ADC.W #$0100 : STA.W $1794 
    LDA.W #$0008 : STA.W $1798 
    LDA.W #$0000 : STA.W $1796 
    RTS 


EnemyGraphicsDrawnHook_Magdollite_PeriodicallyCyclePalettes:
    LDA.W $0797 : BNE .return 
    LDX.W $0E54 
    LDA.W $1798 
    DEC A 
    STA.W $1798 
    BNE .return 
    LDA.W #$0008 : STA.W $1798 
    LDA.W $1796 
    INC A 
    STA.W $1796 
    AND.W #$0003 
    ASL #5
    TAY 
    LDA.W Palette_Magdollite_Glow_0,Y : STA.B $12 
    LDA.W Palette_Magdollite_Glow_1,Y : STA.B $14 
    LDA.W Palette_Magdollite_Glow_2,Y : STA.B $16 
    LDA.W Palette_Magdollite_Glow_3,Y : STA.B $18 
    LDA.W $1794 
    TAX 
    LDA.B $12 : STA.L $7EC012,X 
    LDA.B $14 : STA.L $7EC014,X 
    LDA.B $16 : STA.L $7EC016,X 
    LDA.B $18 : STA.L $7EC018,X 

.return:
    RTL 


MainAI_Magdollite:
    LDX.W $0E54 
    LDA.L $7E7808,X 
    DEC A 
    STA.L $7E7808,X 
    JSR.W ($0FB2,X) 
    RTL 


Function_Magdollite_WaitForSamusToGetNear:
    LDX.W $0E54 
    LDA.W #$0000 : STA.L $7E7800,X 
    LDA.W #InstList_Magdollite_Idling_FacingLeft : STA.W $0FAE,X 
    JSL.L Get_SamusX_minus_EnemyX 
    BMI .facingDirectionChosen 
    LDA.W #InstList_Magdollite_Idling_FacingRight : STA.W $0FAE,X 
    LDA.W #$0001 : STA.L $7E7800,X 

.facingDirectionChosen:
    JSR.W CheckIfMagdolliteInstListChanged 
    LDA.L $7E7888,X : BPL .return 
    LDA.W #$0000 : STA.L $7E7888,X 
    LDA.W $0FB6,X : AND.W #$00FF 
    JSL.L IsSamusWithinAPixelColumnsOfEnemy 
    BEQ .return 
    LDA.W #InstList_Magdollite_SplashIntoLavaAndFormBasePillar_Left_0 : STA.W $0FAE,X 
    LDA.L $7E7800,X : BEQ .keepLeft 
    LDA.W #InstList_Magdollite_SplashIntoLavaAndFormBasePillar_Right_0 : STA.W $0FAE,X 

.keepLeft:
    JSR.W CheckIfMagdolliteInstListChanged 
    LDA.W #Function_Magdollite_WaitUntilBasePillarFormed : STA.W $0FB2,X 

.return:
    RTS 


Function_Magdollite_WaitUntilBasePillarFormed:
    LDX.W $0E54 
    LDA.L $7E7802,X : BNE .return 
    LDA.W #$0001 : STA.L $7E7804,X 
    LDA.W #$0000 : STA.L $7E785A,X 
    LDA.W #Function_Magdollite_WaitForOtherPartsToFinish : STA.W $0FB2,X 

.return:
    RTS 


Function_Magdollite_WaitForOtherPartsToFinish:
    LDX.W $0E54 
    LDA.L $7E7804,X : BNE .return 
    LDA.W #InstList_Magdollite_UnformBasePillar_SplashBackToIdle_Left_0 : STA.W $0FAE,X 
    JSL.L Get_SamusX_minus_EnemyX 
    BMI .facingDirectionChosen 
    LDA.W #InstList_Magdollite_UnformBasePillar_SplashBackToIdle_Right_0 : STA.W $0FAE,X 

.facingDirectionChosen:
    JSR.W CheckIfMagdolliteInstListChanged 
    LDA.W #Function_Magdollite_UnformBasePillarBackToHeadIdling : STA.W $0FB2,X 

.return:
    RTS 


Function_Magdollite_UnformBasePillarBackToHeadIdling:
    LDX.W $0E54 
    LDA.L $7E7802,X : BNE .return 
    LDA.W #InstList_Magdollite_Idling_FacingLeft : STA.W $0FAE,X 
    JSL.L Get_SamusX_minus_EnemyX 
    BMI .facingDirectionChosen 
    LDA.W #InstList_Magdollite_Idling_FacingRight : STA.W $0FAE,X 

.facingDirectionChosen:
    JSR.W CheckIfMagdolliteInstListChanged 
    LDA.W #Function_Magdollite_WaitForSamusToGetNear : STA.W $0FB2,X 

.return:
    RTS 


Function_Magdollite_Slave1_WaitForAttackToBeTriggered:
    LDX.W $0E54 
    LDA.L $7E781A,X : BNE .return 
    LDA.W #Function_Magdollite_Slave1_HandlePillarGrowth : STA.W $0FB2,X 
    LDA.W #$0000 : STA.W $0FB0,X 
    STA.L $7E781A,X 
    LDA.W #$0002 : STA.W $0FAA,X 
    LDA.L $7E7806,X : STA.W $0F7E,X 

.return:
    RTS 


Function_Magdollite_Slave1_HandlePillarGrowth:
    LDX.W $0E54 
    CLC 
    LDA.W $0F80,X : ADC.L $7E77D2,X : STA.W $0F80,X 
    BCC + 
    INC.W $0FB0,X 

  + LDA.W $0F7E,X : ADC.L $7E77D4,X : STA.W $0F7E,X 
    CLC 
    LDA.W $0FB0,X : ADC.L $7E77D4,X : STA.W $0FB0,X 
    JSR.W Function_Magdollite_Slave1_AddPillarStacksToReachSamusHeight 
    RTS 


Function_Magdollite_Slave1_AddPillarStacksToReachSamusHeight:
    LDA.W $0FB0,X 
    EOR.W #$FFFF 
    INC A 
    CMP.W #$006C : BPL .doneGrowing 
    LDY.W $0FAA,X 
    LDA.W $0F7E,X : SEC : SBC.W MagdolliteYOffsetAimingAtSamus,Y : CMP.W $0AFA : BMI .doneGrowing 
    LDA.W $0FB0,X 
    EOR.W #$FFFF 
    INC A 
    CMP.W MagdolliteArmHeightThreshold,Y : BPL .increasePillarStack 
    BRA .return 


.doneGrowing:
    LDA.W #Function_Magdollite_Slave1_GetEnemyIndex : STA.W $0FB2,X 
    LDA.W #$0001 : STA.L $7E7818,X 
    LDA.W $0FB0,X 
    EOR.W #$FFFF 
    INC A 
    CMP.W MagdolliteArmHeightThreshold,Y : BPL .increasePillarStack 
    BRA .return 


.increasePillarStack:
    INC.W $0FAA,X 
    INC.W $0FAA,X 
    LDA.W $0F7E,X : CLC : ADC.W #$0008 : STA.W $0F7E,X 
    LDY.W $0FAA,X 
    LDA.W MagdolliteSlave1InstListPointers,Y : STA.W $0FAE,X 
    JSR.W CheckIfMagdolliteInstListChanged 

.return:
    RTS 


Function_Magdollite_Slave1_GetEnemyIndex:
    LDX.W $0E54 
    RTS 


Function_Magdollite_Slave1_HandlePillarShrinking:
    LDX.W $0E54 
    LDA.W $0F7E,X : CLC : ADC.L $7E77D0,X : STA.W $0F7E,X 
    LDA.W $0FB0,X : CLC : ADC.L $7E77D0,X : STA.W $0FB0,X 
    LDA.W $0F80,X : CLC : ADC.L $7E77CE,X : BCC + 
    INC.W $0F7E,X 
    INC.W $0FB0,X 

  + STA.W $0F80,X 
    JSR.W RemoveMagdollitePillarStacksUntilBackToBaseHeight 
    RTS 


RemoveMagdollitePillarStacksUntilBackToBaseHeight:
    LDY.W $0FAA,X 
    DEY #2
    LDA.W $0FB0,X : BPL .doneShrinking 
    EOR.W #$FFFF 
    INC A 
    CMP.W MagdolliteArmHeightThreshold,Y : BMI .removeTileAndRecenter 
    BRA .return 


.removeTileAndRecenter:
    DEC.W $0FAA,X 
    DEC.W $0FAA,X 
    LDA.W $0F7E,X : SEC : SBC.W #$0008 : STA.W $0F7E,X 
    LDY.W $0FAA,X 
    LDA.W MagdolliteSlave1InstListPointers,Y : STA.W $0FAE,X 
    JSR.W CheckIfMagdolliteInstListChanged 
    BRA .return 


.doneShrinking:
    LDA.W #$0001 : STA.L $7E781A,X 
    LDA.W #$0000 : STA.L $7E77C4,X 
    LDA.W #Function_Magdollite_Slave1_WaitForAttackToBeTriggered : STA.W $0FB2,X 

.return:
    RTS 


Function_Magdollite_Slave2_Idling_WaitingForTrigger:
    LDX.W $0E54 
    LDA.W $0F32,X : CMP.W #Function_Magdollite_WaitUntilBasePillarFormed : BNE .return 
    LDA.W #Function_Magdollite_Slave2_SetToThrowFireballsAfterGrowing : STA.W $0FB2,X 

.return:
    RTS 


Function_Magdollite_Slave2_SetSlave1ToShrinkAfterFireballs:
    LDX.W $0E54 
    LDA.L $7E7802,X : BNE .done 
    LDA.W #InstList_Magdollite_Slave2_PillarCap : STA.W $0FAE,X 
    JSR.W CheckIfMagdolliteInstListChanged 
    LDA.W #Function_Magdollite_Slave1_HandlePillarShrinking : STA.W $0F72,X 
    LDA.W #Function_Magdollite_Slave2_GoBackToIdlingAfterPillarShrinks : STA.W $0FB2,X 
    LDA.W #$0000 : STA.L $7E77D8,X 
    LDA.L $7E7824,X : STA.W $0F7A,X 
    LDA.L $7E7826,X : STA.W $0F7E,X 

.done:
    JSR.W SetMagdolliteYRadius 
    RTS 


Function_Magdollite_Slave2_SetToThrowFireballsAfterGrowing:
    LDX.W $0E54 
    LDA.L $7E77D8,X : BEQ .waiting 
    LDA.W #InstList_Magdollite_Slave2_ThrowFireballs_FacingLeft : STA.W $0FAE,X 
    LDA.W #$0000 : STA.W $0FAA,X 
    JSL.L Get_SamusX_minus_EnemyX 
    BMI .directionChosen 
    LDA.W #InstList_Magdollite_ThrowFireballs_FacingRight : STA.W $0FAE,X 
    LDA.W #$0001 : STA.W $0FAA,X 

.directionChosen:
    JSR.W CheckIfMagdolliteInstListChanged 
    LDA.W #Function_Magdollite_Slave2_SetSlave1ToShrinkAfterFireballs : STA.W $0FB2,X 
    LDA.W $0F7A,X : STA.L $7E7824,X 
    LDA.W $0F7E,X : STA.L $7E7826,X 
    BRA .done 


.waiting:
    LDY.W $0F6A,X 
    LDA.W $0F3E,X : SEC : SBC.W MagdolliteYOffsetAimingAtSamus,Y : STA.W $0F7E,X 

.done:
    JSR.W SetMagdolliteYRadius 
    RTS 


Function_Magdollite_Slave2_GoBackToIdlingAfterPillarShrinks:
    LDX.W $0E54 
    LDA.W $0F32,X : CMP.W #Function_Magdollite_WaitForSamusToGetNear : BNE .notWaitingForTrigger 
    LDA.W #Function_Magdollite_Slave2_Idling_WaitingForTrigger : STA.W $0FB2,X 
    BRA .done 


.notWaitingForTrigger:
    LDY.W $0F6A,X 
    LDA.W $0F3E,X : SEC : SBC.W MagdolliteYOffsetAimingAtSamus,Y : STA.W $0F7E,X 

.done:
    JSR.W SetMagdolliteYRadius 
    RTS 


SetMagdolliteYRadius:
    LDA.W $0EFE,X : SEC : SBC.W $0F7E,X : CLC : ADC.W #$0002 : STA.W $0F04,X 
    CMP.W #$0008 : BPL .return 
    LDA.W #$0008 : STA.W $0F04,X 

.return:
    RTS 


CheckIfMagdolliteInstListChanged:
    LDX.W $0E54 
    LDA.W $0FAE,X : CMP.W $0FAC,X : BEQ .return 
    STA.W $0F92,X 
    STA.W $0FAC,X 
    LDA.W #$0001 : STA.W $0F94,X 
    STZ.W $0F90,X 

.return:
    RTS 


PowerBombReaction_Magdollite:
    JSL.L CommonA8_NormalEnemyPowerBombAI 
    BRA ContactReaction_Magdollite_Common 


EnemyTouch_Magdollite:
    JSL.L CommonA8_NormalEnemyTouchAI 
    BRA ContactReaction_Magdollite_Common 


EnemyShot_Magdollite:
    JSL.L NormalEnemyShotAI 

ContactReaction_Magdollite_Common:
    LDX.W $0E54 
    LDA.W $0F8C,X : BNE .notDead 
    LDA.W $0FC6,X : ORA.W #$0200 : STA.W $0FC6,X 
    LDA.W $1006,X : ORA.W #$0200 : STA.W $1006,X 

.notDead:
    LDA.W $0F9E,X : BEQ .return 
    STA.W $0FDE,X 
    STA.W $101E,X 
    LDA.W $0FCA,X : ORA.W #$0004 : STA.W $0FCA,X 
    LDA.W $100A,X : ORA.W #$0004 : STA.W $100A,X 

.return:
    RTL 


Spritemap_Magdollite_FacingLeft_Head_0:
    dw $0003,$0004 
    db $FF 
    dw $2123,$0004 
    db $F7 
    dw $2122,$81F4 
    db $F7 
    dw $210A 

Spritemap_Magdollite_FacingLeft_Head_1:
    dw $0003,$0004 
    db $00 
    dw $2123,$0004 
    db $F8 
    dw $2122,$81F4 
    db $F8 
    dw $210A 

Spritemap_Magdollite_FacingLeft_Head_2:
    dw $0003,$0004 
    db $01 
    dw $2123,$0004 
    db $F9 
    dw $2122,$81F4 
    db $F9 
    dw $210A 

Spritemap_Magdollite_FacingLeft_Fist_0:
    dw $0003,$0000 
    db $04 
    dw $2121,$01F8 
    db $04 
    dw $2120,$81F8 
    db $F4 
    dw $2108 

Spritemap_Magdollite_FacingLeft_Fist_1:
    dw $0003,$01FD 
    db $04 
    dw $2121,$01F5 
    db $04 
    dw $2120,$81F9 
    db $F5 
    dw $2108 

Spritemap_Magdollite_FacingLeft_Hand_FingersStraight:
    dw $0002,$8000 
    db $FC 
    dw $2106,$81F0 
    db $F9 
    dw $2104 

Spritemap_Magdollite_FacingLeft_Hand_FingersCurled:
    dw $0002,$8000 
    db $F8 
    dw $2102,$81F0 
    db $F8 
    dw $2100 

Spritemap_Magdollite_FacingLeft_PillarCap:
    dw $0002,$0000 
    db $FC 
    dw $2125,$01F8 
    db $FC 
    dw $2124 

Spritemap_Magdollite_FacingLeft_WidePillarSection:
    dw $0001,$81F8 
    db $F8 
    dw $210E 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Magdollite_Blank_A8B4C8:
    dw $0001,$81F8 
    db $F8 
    dw $210C 
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_Magdollite_FacingLeft_Head_PokingOutOfLava:
    dw $0003,$0004 
    db $FC 
    dw $2128,$01FC 
    db $FC 
    dw $2127,$01F4 
    db $FC 
    dw $2126 

Spritemap_Magdollite_FacingLeft_Head_BarelyPokingOutOfLava:
    dw $0003,$0004 
    db $FC 
    dw $212B,$01FC 
    db $FC 
    dw $212A,$01F4 
    db $FC 
    dw $2129 

Spritemap_Magdollite_FacingRight_Head_0:
    dw $0003,$01F4 
    db $FF 
    dw $6123,$01F4 
    db $F7 
    dw $6122,$81FC 
    db $F7 
    dw $610A 

Spritemap_Magdollite_FacingRight_Head_1:
    dw $0003,$01F4 
    db $00 
    dw $6123,$01F4 
    db $F8 
    dw $6122,$81FC 
    db $F8 
    dw $610A 

Spritemap_Magdollite_FacingRight_Head_2:
    dw $0003,$01F4 
    db $01 
    dw $6123,$01F4 
    db $F9 
    dw $6122,$81FC 
    db $F9 
    dw $610A 

Spritemap_Magdollite_FacingRight_Fist_0:
    dw $0003,$01F8 
    db $04 
    dw $6121,$0000 
    db $04 
    dw $6120,$81F8 
    db $F4 
    dw $6108 

Spritemap_Magdollite_FacingRight_Fist_1:
    dw $0003,$01FB 
    db $04 
    dw $6121,$0003 
    db $04 
    dw $6120,$81F7 
    db $F5 
    dw $6108 

Spritemap_Magdollite_FacingRight_Hand_FingersStraight:
    dw $0002,$81F0 
    db $FC 
    dw $6106,$8000 
    db $F9 
    dw $6104 

Spritemap_Magdollite_FacingRight_Hand_FingersCurled:
    dw $0002,$81F0 
    db $F8 
    dw $6102,$8000 
    db $F8 
    dw $6100 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Magdollite_FacingRight_PillarCap_A8B55E:
    dw $0002,$01F8 
    db $FC 
    dw $6125,$0000 
    db $FC 
    dw $6124 
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_Magdollite_FacingRight_WidePillarSection:
    dw $0001,$81F8 
    db $F8 
    dw $610E 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Magdollite_FacingRight_NarrowPillar_A8B571:
    dw $0001,$81F8 
    db $F8 
    dw $610C 
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_Magdollite_FacingRight_Head_PokingOutOfLava:
    dw $0003,$01F4 
    db $FC 
    dw $6128,$01FC 
    db $FC 
    dw $6127,$0004 
    db $FC 
    dw $6126 

Spritemap_Magdollite_FacingRight_Head_BarelyPokingOutOfLava:
    dw $0003,$01F4 
    db $FC 
    dw $612B,$01FC 
    db $FC 
    dw $612A,$0004 
    db $FC 
    dw $6129 

Spritemap_Magdollite_FacingLeft_NarrowPillarSection:
    dw $0001,$81F8 
    db $F8 
    dw $210C 

Spritemap_Magdollite_FacingRight_NarrowPillarSection:
    dw $0002,$81F8 
    db $00 
    dw $210C,$81F8 
    db $F0 
    dw $210C 

Spritemap_Magdollite_NarrowPillarStacks_3x:
    dw $0003,$81F8 
    db $08 
    dw $210C,$81F8 
    db $E8 
    dw $210C,$81F8 
    db $F8 
    dw $210C 

Spritemap_Magdollite_NarrowPillarStacks_4x:
    dw $0004,$81F8 
    db $10 
    dw $210C,$81F8 
    db $00 
    dw $210C,$81F8 
    db $F0 
    dw $210C,$81F8 
    db $E0 
    dw $210C 

Spritemap_Magdollite_NarrowPillarStacks_5x:
    dw $0005,$81F8 
    db $18 
    dw $210C,$81F8 
    db $08 
    dw $210C,$81F8 
    db $D8 
    dw $210C,$81F8 
    db $F8 
    dw $210C,$81F8 
    db $E8 
    dw $210C 

Spritemap_Magdollite_NarrowPillarStacks_6x:
    dw $0006,$81F8 
    db $10 
    dw $210C,$81F8 
    db $20 
    dw $210C,$81F8 
    db $00 
    dw $210C,$81F8 
    db $F0 
    dw $210C,$81F8 
    db $E0 
    dw $210C,$81F8 
    db $D0 
    dw $210C 

Spritemap_Magdollite_NarrowPillarStacks_7x:
    dw $0007,$81F8 
    db $28 
    dw $210C,$81F8 
    db $18 
    dw $210C,$81F8 
    db $08 
    dw $210C,$81F8 
    db $F8 
    dw $210C,$81F8 
    db $E8 
    dw $210C,$81F8 
    db $D8 
    dw $210C,$81F8 
    db $C8 
    dw $210C 

Spritemap_Magdollite_NarrowPillarStacks_8x:
    dw $0008,$81F8 
    db $30 
    dw $210C,$81F8 
    db $00 
    dw $210C,$81F8 
    db $20 
    dw $210C,$81F8 
    db $10 
    dw $210C,$81F8 
    db $F0 
    dw $210C,$81F8 
    db $E0 
    dw $210C,$81F8 
    db $D0 
    dw $210C,$81F8 
    db $C0 
    dw $210C 

Palette_Beetom:
    dw $3800,$57FF,$42F7,$158C,$00A5,$4F5A,$36B5,$2610 
    dw $1DCE,$1CDF,$4FE0,$3B20,$2A20,$1097,$6BDF,$042E 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_BeetomEyeColors_A8B67E:
    dw $4FE0,$3B20,$2A20,$3BE0,$2680,$1580,$2740,$11E0 
    dw $00E0,$12A0,$0140,$0040 
endif ; !FEATURE_KEEP_UNREFERENCED

InstList_Beetom_Crawling_FacingLeft_0:
    dw Instruction_Common_DisableOffScreenProcessing 

InstList_Beetom_Crawling_FacingLeft_1:
    dw $000A 
    dw Spritemap_Beetom_0 
    dw $000A 
    dw Spritemap_Beetom_1 
    dw $000A 
    dw Spritemap_Beetom_2 
    dw $000A 
    dw Spritemap_Beetom_1 
    dw Instruction_Common_GotoY 
    dw InstList_Beetom_Crawling_FacingLeft_1 

InstList_Beetom_Hop_FacingLeft:
    dw Instruction_Common_EnableOffScreenProcessing 
    dw $0004 
    dw Spritemap_Beetom_3 
    dw $0008 
    dw Spritemap_Beetom_4 
    dw $0004 
    dw Spritemap_Beetom_3 
    dw $0001 
    dw Spritemap_Beetom_0 
    dw Instruction_Common_Sleep 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_Beetom_SmallHop_FacingLeft_A8B6C0:
    dw Instruction_Common_EnableOffScreenProcessing 
    dw $0004 
    dw Spritemap_Beetom_3 
    dw $0001 
    dw Spritemap_Beetom_0 
    dw Instruction_Common_Sleep 
endif ; !FEATURE_KEEP_UNREFERENCED

InstList_Beetom_DrainingSamus_FacingLeft_0:
    dw $0005 
    dw Spritemap_Beetom_5 
    dw $0005 
    dw Spritemap_Beetom_6 
    dw $0005 
    dw Spritemap_Beetom_7 
    dw $0030 
    dw Spritemap_Beetom_6 
    dw Instruction_Beetom_Nothing 

InstList_Beetom_DrainingSamus_FacingLeft_1:
    dw $0005 
    dw Spritemap_Beetom_8 
    dw $0005 
    dw Spritemap_Beetom_9 
    dw $0005 
    dw Spritemap_Beetom_A 
    dw $0005 
    dw Spritemap_Beetom_9 
    dw Instruction_Common_GotoY 
    dw InstList_Beetom_DrainingSamus_FacingLeft_1 

InstList_Beetom_Crawling_FacingRight_0:
    dw Instruction_Common_DisableOffScreenProcessing 

InstList_Beetom_Crawling_FacingRight_1:
    dw $000A 
    dw Spritemap_Beetom_B 
    dw $000A 
    dw Spritemap_Beetom_C 
    dw $000A 
    dw Spritemap_Beetom_D 
    dw $000A 
    dw Spritemap_Beetom_C 
    dw Instruction_Common_GotoY 
    dw InstList_Beetom_Crawling_FacingRight_1 

InstList_Beetom_Hop_FacingRight:
    dw Instruction_Common_EnableOffScreenProcessing 
    dw $0004 
    dw Spritemap_Beetom_E 
    dw $0008 
    dw Spritemap_Beetom_F 
    dw $0004 
    dw Spritemap_Beetom_E 
    dw $0001 
    dw Spritemap_Beetom_B 
    dw Instruction_Common_Sleep 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_Beetom_SmallHop_FacingRight_A8B71C:
    dw Instruction_Common_EnableOffScreenProcessing 
    dw $0004 
    dw Spritemap_Beetom_E 
    dw $0001 
    dw Spritemap_Beetom_B 
    dw Instruction_CommonA8_Sleep 
endif ; !FEATURE_KEEP_UNREFERENCED

InstList_Beetom_DrainingSamus_FacingRight_0:
    dw $0005 
    dw Spritemap_Beetom_10 
    dw $0005 
    dw Spritemap_Beetom_11 
    dw $0005 
    dw Spritemap_Beetom_12 
    dw $0030 
    dw Spritemap_Beetom_11 
    dw Instruction_Beetom_Nothing 

InstList_Beetom_DrainingSamus_FacingRight_1:
    dw $0005 
    dw Spritemap_Beetom_13 
    dw $0005 
    dw Spritemap_Beetom_14 
    dw $0005 
    dw Spritemap_Beetom_15 
    dw $0005 
    dw Spritemap_Beetom_14 
    dw Instruction_Common_GotoY 
    dw InstList_Beetom_DrainingSamus_FacingRight_1 

SamusNotInProximityBeetomFunctionPointers:
    dw Function_Beetom_StartIdling 
    dw Function_Beetom_StartIdling 
    dw Function_Beetom_StartShortHopRight 
    dw Function_Beetom_StartLongHopRight 
    dw Function_Beetom_StartShortHopRight 
    dw Function_Beetom_StartShortHopLeft 
    dw Function_Beetom_StartLongHopLeft 
    dw Function_Beetom_StartLongHopRight 

Instruction_Beetom_Nothing:
    LDX.W $0E54 
    RTL 


SetBeetomInstList:
    LDX.W $0E54 
    LDA.L $7E7800,X : STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    STZ.W $0F90,X 
    RTS 


InitAI_Beetom:
    LDX.W $0E54 
    LDA.W #$0000 : STA.W $0FAE,X 
    STA.W $0FAC,X 
    STA.L $7E780A,X 
    STA.L $7E7810,X 
    STA.W $0FA8,X 
    LDA.W #$0040 : STA.W $0FB0,X 
    LDA.B $8B : STA.W $0FB2,X 
    LDA.W #$0017 : STA.W $05E5 
    LDA.W #$3000 : STA.B $16 
    LDA.W #$0004 : STA.B $18 
    JSR.W Beetom_CalculateInitialHopSpeed 
    STA.L $7E7804,X 
    LDA.W #$4000 : STA.B $16 
    LDA.W #$0005 : STA.B $18 
    JSR.W Beetom_CalculateInitialHopSpeed 
    STA.L $7E7806,X 
    LDA.W #$3000 : STA.B $16 
    LDA.W #$0003 : STA.B $18 
    JSR.W Beetom_CalculateInitialHopSpeed 
    STA.L $7E7808,X 
    LDA.W #InstList_Beetom_Crawling_FacingRight_0 : STA.L $7E7800,X 
    JSL.L Get_SamusX_minus_EnemyX 
    BPL .SamusToTheLeft 
    LDA.W #InstList_Beetom_Crawling_FacingLeft_0 : STA.L $7E7800,X 

.SamusToTheLeft:
    JSR.W SetBeetomInstList 
    LDA.W #Function_Beetom_DecideAction : STA.W $0FAC,X 
    RTL 


Beetom_CalculateInitialHopSpeed:
    STZ.B $12 
    STZ.B $14 

.loop:
    LDA.B $12 : CLC : ADC.B $18 : STA.B $12 
    ASL #3
    TAY 
    LDA.B $14 : CLC : ADC.W CommonEnemySpeeds_QuadraticallyIncreasing+1,Y : STA.B $14 
    CMP.B $16 : BMI .loop 
    LDA.B $12 
    RTS 


MainAI_Beetom:
    LDX.W $0E54 
    JSR.W ($0FAC,X) 
    RTL 


Function_Beetom_DecideAction:
    LDX.W $0E54 
    LDA.W #$0060 : JSL.L IsSamusWithinAPixelColumnsOfEnemy 
    BEQ .notInProximity 
    LDA.W #Function_Beetom_DecideAction_SamusInProximity : STA.W $0FAC,X 
    BRA .return 


.notInProximity:
    LDA.W #Function_Beetom_DecideAction_SamusNotInProximity : STA.W $0FAC,X 

.return:
    RTS 


Function_Beetom_DecideAction_SamusNotInProximity:
    LDX.W $0E54 
    JSL.L GenerateRandomNumber 
    LDA.W $05E5 : AND.W #$0007 
    ASL A 
    TAY 
    LDA.W SamusNotInProximityBeetomFunctionPointers,Y : STA.W $0FAC,X 
    LDA.W $05E5 : AND.W #$0001 : STA.L $7E7812,X 
    RTS 


Function_Beetom_StartIdling:
    LDX.W $0E54 
    LDA.W #$0020 : STA.W $0FAE,X 
    LDA.W #Function_Beetom_Idling : STA.W $0FAC,X 
    RTS 


Function_Beetom_StartCrawlingLeft:
    LDX.W $0E54 
    LDA.W #Function_Beetom_CrawlingLeft : STA.W $0FAC,X 
    LDA.W #InstList_Beetom_Crawling_FacingLeft_0 : STA.L $7E7800,X 
    JSR.W SetBeetomInstList 
    RTS 


Function_Beetom_StartCrawlingRight:
    LDX.W $0E54 
    LDA.W #Function_Beetom_CrawlingRight : STA.W $0FAC,X 
    LDA.W #InstList_Beetom_Crawling_FacingRight_0 : STA.L $7E7800,X 
    JSR.W SetBeetomInstList 
    RTS 


Function_Beetom_StartShortHopRight:
    LDX.W $0E54 
    LDA.L $7E7804,X : STA.W $0FAA,X 
    LDA.W #Function_Beetom_ShortHopLeft : STA.W $0FAC,X 
    LDA.W #$0000 : STA.L $7E780A,X 
    LDA.W #InstList_Beetom_Hop_FacingLeft : STA.L $7E7800,X 
    JSR.W SetBeetomInstList 
    RTS 


Function_Beetom_StartShortHopLeft:
    LDX.W $0E54 
    LDA.L $7E7804,X : STA.W $0FAA,X 
    LDA.W #Function_Beetom_ShortHopRight : STA.W $0FAC,X 
    LDA.W #$0000 : STA.L $7E780A,X 
    LDA.W #InstList_Beetom_Hop_FacingRight : STA.L $7E7800,X 
    JSR.W SetBeetomInstList 
    RTS 


Function_Beetom_StartLongHopLeft:
    LDX.W $0E54 
    LDA.L $7E7806,X : STA.W $0FAA,X 
    LDA.W #Function_Beetom_LongHopLeft : STA.W $0FAC,X 
    LDA.W #$0000 : STA.L $7E780A,X 
    LDA.W #InstList_Beetom_Hop_FacingLeft : STA.L $7E7800,X 
    JSR.W SetBeetomInstList 
    RTS 


Function_Beetom_StartLongHopRight:
    LDX.W $0E54 
    LDA.L $7E7806,X : STA.W $0FAA,X 
    LDA.W #Function_Beetom_LongHopRight : STA.W $0FAC,X 
    LDA.W #$0000 : STA.L $7E780A,X 
    LDA.W #InstList_Beetom_Hop_FacingRight : STA.L $7E7800,X 
    JSR.W SetBeetomInstList 
    RTS 


Function_Beetom_DecideAction_SamusInProximity:
    LDX.W $0E54 
    LDA.L $7E7808,X : STA.W $0FAA,X 
    LDA.W #InstList_Beetom_Hop_FacingRight : STA.L $7E7800,X 
    LDA.W #Function_Beetom_LungeRight : STA.W $0FAC,X 
    LDA.W #$0001 : STA.L $7E7812,X 
    JSL.L Get_SamusX_minus_EnemyX 
    BPL .SamusToTheLeft 
    LDA.W #InstList_Beetom_Hop_FacingLeft : STA.L $7E7800,X 
    LDA.W #Function_Beetom_LungeLeft : STA.W $0FAC,X 
    LDA.W #$0000 : STA.L $7E7812,X 

.SamusToTheLeft:
    JSR.W SetBeetomInstList 
    LDA.W #$0000 : STA.L $7E780A,X 
    RTS 


Function_Beetom_StartDrainingSamus_FacingLeft:
    LDX.W $0E54 
    LDA.W #InstList_Beetom_DrainingSamus_FacingLeft_0 : STA.L $7E7800,X 
    JSR.W SetBeetomInstList 
    LDA.W #Function_Beetom_DrainingSamus_FacingLeft : STA.W $0FAC,X 
    RTS 


Function_Beetom_StartDrainingSamus_FacingRight:
    LDX.W $0E54 
    LDA.W #InstList_Beetom_DrainingSamus_FacingRight_0 : STA.L $7E7800,X 
    JSR.W SetBeetomInstList 
    LDA.W #Function_Beetom_DrainingSamus_FacingRight : STA.W $0FAC,X 
    RTS 


Function_Beetom_StartDropping:
    LDX.W $0E54 
    LDA.W #InstList_Beetom_Crawling_FacingLeft_0 : STA.L $7E7800,X 
    LDA.L $7E7812,X : BEQ .keepLeft 
    LDA.W #InstList_Beetom_Crawling_FacingRight_0 : STA.L $7E7800,X 

.keepLeft:
    JSR.W SetBeetomInstList 
    LDA.W #$0000 : STA.L $7E780A,X 
    LDA.W #Function_Beetom_Dropping : STA.W $0FAC,X 
    RTS 


Function_Beetom_StartBeingFlung:
    LDX.W $0E54 
    LDA.W #$0000 : STA.W $0FAA,X 
    LDA.W #Function_Beetom_BeingFlung : STA.W $0FAC,X 
    RTS 


Function_Beetom_Idling:
    LDX.W $0E54 
    DEC.W $0FAE,X 
    BPL .return 
    LDA.W #Function_Beetom_DecideAction : STA.W $0FAC,X 

.return:
    RTS 


Function_Beetom_CrawlingLeft:
    LDX.W $0E54 
    DEC.W $0FAE,X 
    BMI .end 
    LDA.W $0F7A,X : SEC : SBC.W #$0008 : STA.W $0F7A,X 
    LDA.W #$0001 : STA.B $14 
    STZ.B $12 
    JSL.L MoveEnemyDownBy_14_12 
    BCS .collidedWithBlock 
    LDA.W #Function_Beetom_StartCrawlingRight : STA.W $0FAC,X 
    DEC.W $0F7E,X 
    LDA.W $0F7A,X : CLC : ADC.W #$0008 : STA.W $0F7A,X 
    BRA .return 


.collidedWithBlock:
    LDA.W $0F7A,X : CLC : ADC.W #$0008 : STA.W $0F7A,X 
    LDA.W #$C000 : STA.B $12 
    LDA.W #$FFFF : STA.B $14 
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes 
    BCC .return 
    LDA.W #Function_Beetom_StartCrawlingRight : STA.W $0FAC,X 
    BRA .return 


.end:
    LDA.W #$0040 : STA.W $0FAE,X 
    LDA.W #Function_Beetom_DecideAction : STA.W $0FAC,X 

.return:
    RTS 


Function_Beetom_CrawlingRight:
    LDX.W $0E54 
    DEC.W $0FAE,X 
    BMI .end 
    LDA.W $0F7A,X : CLC : ADC.W #$0008 : STA.W $0F7A,X 
    LDA.W #$0001 : STA.B $14 
    STZ.B $12 
    JSL.L MoveEnemyDownBy_14_12 
    BCS .collidedWithBlock 
    LDA.W #Function_Beetom_StartCrawlingLeft : STA.W $0FAC,X 
    DEC.W $0F7E,X 
    LDA.W $0F7A,X : SEC : SBC.W #$0008 : STA.W $0F7A,X 
    BRA .return 


.collidedWithBlock:
    LDA.W $0F7A,X : SEC : SBC.W #$0008 : STA.W $0F7A,X 
    LDA.W #$4000 : STA.B $12 
    STZ.B $14 
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes 
    BCC .return 
    LDA.W #Function_Beetom_StartCrawlingLeft : STA.W $0FAC,X 
    BRA .return 


.end:
    LDA.W #$0040 : STA.W $0FAE,X 
    LDA.W #Function_Beetom_DecideAction : STA.W $0FAC,X 

.return:
    RTS 


Function_Beetom_ShortHopLeft:
    LDX.W $0E54 
    LDA.L $7E780A,X : BNE .falling 
    JSR.W Function_Beetom_YMovement_ShortHop_Rising 
    BRA + 


.falling:
    JSR.W Function_Beetom_YMovement_ShortHop_Falling 

  + LDA.W #$FFFF : STA.B $14 
    LDA.W #$C000 : STA.B $12 
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes 
    BCC .return 
    LDA.L $7E7812,X : EOR.W #$0001 : STA.L $7E7812,X 
    LDA.W #Function_Beetom_StartDropping : STA.W $0FAC,X 

.return:
    RTS 


Function_Beetom_ShortHopRight:
    LDX.W $0E54 
    LDA.L $7E780A,X : BNE .falling 
    JSR.W Function_Beetom_YMovement_ShortHop_Rising 
    BRA + 


.falling:
    JSR.W Function_Beetom_YMovement_ShortHop_Falling 

  + STZ.B $14 
    LDA.W #$4000 : STA.B $12 
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes 
    BCC .return 
    LDA.L $7E7812,X : EOR.W #$0001 : STA.L $7E7812,X 
    LDA.W #Function_Beetom_StartDropping : STA.W $0FAC,X 

.return:
    RTS 


Function_Beetom_YMovement_ShortHop_Rising:
    LDA.W $0FAA,X 
    ASL #3
    TAY 
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing+6,Y : STA.B $14 
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing+4,Y : STA.B $12 
    JSL.L MoveEnemyDownBy_14_12 
    BCC .notCollidedWithBlock 
    LDA.W #Function_Beetom_StartDropping : STA.W $0FAC,X 
    BRA .return 


.notCollidedWithBlock:
    LDA.W $0FAA,X : SEC : SBC.W #$0004 : STA.W $0FAA,X 
    BPL .return 
    LDA.W #$0000 : STA.W $0FAA,X 
    LDA.W #$0001 : STA.L $7E780A,X 

.return:
    RTS 


Function_Beetom_YMovement_ShortHop_Falling:
    LDA.W $0FAA,X 
    ASL #3
    TAY 
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing+2,Y : STA.B $14 
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing,Y : STA.B $12 
    JSL.L MoveEnemyDownBy_14_12 
    BCC .notCollidedWithBlock 
    LDA.W #Function_Beetom_DecideAction : STA.W $0FAC,X 
    BRA .return 


.notCollidedWithBlock:
    LDA.W $0FAA,X : CLC : ADC.W #$0004 : STA.W $0FAA,X 
    CMP.W #$0040 : BMI .return 
    LDA.W #$0040 : STA.W $0FAA,X 

.return:
    RTS 


Function_Beetom_LongHopLeft:
    LDX.W $0E54 
    LDA.L $7E780A,X : BNE .falling 
    JSR.W Function_Beetom_YMovement_LongHop_Rising 
    BRA + 


.falling:
    JSR.W Function_Beetom_YMovement_LongHop_Falling 

  + LDA.W #$FFFF : STA.B $14 
    LDA.W #$C000 : STA.B $12 
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes 
    BCC .return 
    LDA.L $7E7812,X : EOR.W #$0001 : STA.L $7E7812,X 
    LDA.W #Function_Beetom_StartDropping : STA.W $0FAC,X 

.return:
    RTS 


Function_Beetom_LongHopRight:
    LDX.W $0E54 
    LDA.L $7E780A,X : BNE .falling 
    JSR.W Function_Beetom_YMovement_LongHop_Rising 
    BRA + 


.falling:
    JSR.W Function_Beetom_YMovement_LongHop_Falling 

  + STZ.B $14 
    LDA.W #$4000 : STA.B $12 
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes 
    BCC .return 
    LDA.L $7E7812,X : EOR.W #$0001 : STA.L $7E7812,X 
    LDA.W #Function_Beetom_StartDropping : STA.W $0FAC,X 

.return:
    RTS 


Function_Beetom_YMovement_LongHop_Rising:
    LDA.W $0FAA,X 
    ASL #3
    TAY 
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing+6,Y : STA.B $14 
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing+4,Y : STA.B $12 
    JSL.L MoveEnemyDownBy_14_12 
    BCC .notCollidedWithBlock 
    LDA.W #Function_Beetom_StartDropping : STA.W $0FAC,X 
    BRA .return 


.notCollidedWithBlock:
    LDA.W $0FAA,X : SEC : SBC.W #$0005 : STA.W $0FAA,X 
    BPL .return 
    LDA.W #$0000 : STA.W $0FAA,X 
    LDA.W #$0001 : STA.L $7E780A,X 

.return:
    RTS 


Function_Beetom_YMovement_LongHop_Falling:
    LDA.W $0FAA,X 
    ASL #3
    TAY 
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing+2,Y : STA.B $14 
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing,Y : STA.B $12 
    JSL.L MoveEnemyDownBy_14_12 
    BCC .notCollidedWithBlock 
    LDA.W #Function_Beetom_DecideAction : STA.W $0FAC,X 
    BRA .return 


.notCollidedWithBlock:
    LDA.W $0FAA,X : CLC : ADC.W #$0005 : STA.W $0FAA,X 
    CMP.W #$0040 : BMI .return 
    LDA.W #$0040 : STA.W $0FAA,X 

.return:
    RTS 


Function_Beetom_LungeLeft:
    LDX.W $0E54 
    LDA.L $7E780A,X : BNE .falling 
    JSR.W Function_Beetom_YMovement_Lunge_Rising 
    BRA + 


.falling:
    JSR.W Function_Beetom_YMovement_Lunge_Falling 

  + LDA.W #$0003 
    EOR.W #$FFFF 
    INC A 
    STA.B $14 
    STZ.B $12 
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes 
    BCC .return 
    LDA.L $7E7812,X : EOR.W #$0001 : STA.L $7E7812,X 
    LDA.W #Function_Beetom_StartDropping : STA.W $0FAC,X 

.return:
    RTS 


Function_Beetom_LungeRight:
    LDX.W $0E54 
    LDA.L $7E780A,X : BNE .falling 
    JSR.W Function_Beetom_YMovement_Lunge_Rising 
    BRA + 


.falling:
    JSR.W Function_Beetom_YMovement_Lunge_Falling 

  + LDA.W #$0003 : STA.B $14 
    STZ.B $12 
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes 
    BCC .return 
    LDA.L $7E7812,X : EOR.W #$0001 : STA.L $7E7812,X 
    LDA.W #Function_Beetom_StartDropping : STA.W $0FAC,X 

.return:
    RTS 


Function_Beetom_YMovement_Lunge_Rising:
    LDA.W $0FAA,X 
    ASL #3
    TAY 
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing+6,Y : STA.B $14 
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing+4,Y : STA.B $12 
    JSL.L MoveEnemyDownBy_14_12 
    BCC .notCollidedWithBlock 
    LDA.W #Function_Beetom_StartDropping : STA.W $0FAC,X 
    BRA .return 


.notCollidedWithBlock:
    LDA.W $0FAA,X : SEC : SBC.W #$0005 : STA.W $0FAA,X 
    BPL .return 
    LDA.W #$0000 : STA.W $0FAA,X 
    LDA.W #$0001 : STA.L $7E780A,X 

.return:
    RTS 


Function_Beetom_YMovement_Lunge_Falling:
    LDA.W $0FAA,X 
    ASL #3
    TAY 
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing+2,Y : STA.B $14 
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing,Y : STA.B $12 
    JSL.L MoveEnemyDownBy_14_12 
    BCC .notCollidedWithBlock 
    LDA.W #Function_Beetom_DecideAction : STA.W $0FAC,X 
    BRA .return 


.notCollidedWithBlock:
    LDA.W $0FAA,X : CLC : ADC.W #$0003 : STA.W $0FAA,X 
    CMP.W #$0040 : BMI .return 
    LDA.W #$0040 : STA.W $0FAA,X 

.return:
    RTS 


Function_Beetom_DrainingSamus_FacingLeft:
    LDX.W $0E54 
    LDA.W $0FB0,X : BNE .attached 
    STZ.B $12 
    LDA.W #$0010 : STA.B $14 
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes 
    BCC .notCollidedWithWall 
    LDA.W #$0001 : STA.L $7E7812,X 
    STZ.B $12 
    LDA.W #$FFE0 : STA.B $14 
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes 

.notCollidedWithWall:
    LDA.W #$0000 : STA.L $7E7810,X 
    LDA.W #Function_Beetom_StartBeingFlung : STA.W $0FAC,X 
    BRA .return 


.attached:
    LDA.W $0AF6 : STA.W $0F7A,X 
    LDA.W $0AFA : SEC : SBC.W #$0004 : STA.W $0F7E,X 
    JSR.W UpdateBeetomButtonCounter 

.return:
    RTS 


Function_Beetom_DrainingSamus_FacingRight:
    LDX.W $0E54 
    LDA.W $0FB0,X : BNE .attached 
    STZ.B $12 
    LDA.W #$FFF0 : STA.B $14 
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes 
    BCC .notCollidedWithWall 
    LDA.W #$0000 : STA.L $7E7812,X 
    STZ.B $12 
    LDA.W #$0020 : STA.B $14 
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes 

.notCollidedWithWall:
    LDA.W #$0000 : STA.L $7E7810,X 
    LDA.W #Function_Beetom_StartBeingFlung : STA.W $0FAC,X 
    BRA .return 


.attached:
    LDA.W $0AF6 : STA.W $0F7A,X 
    LDA.W $0AFA : SEC : SBC.W #$0004 : STA.W $0F7E,X 
    JSR.W UpdateBeetomButtonCounter 

.return:
    RTS 


UpdateBeetomButtonCounter:
    LDX.W $0E54 
    LDA.B $8B : CMP.W $0FB2,X : BEQ .return 
    STA.W $0FB2,X 
    DEC.W $0FB0,X 

.return:
    RTS 


Function_Beetom_Dropping:
    LDX.W $0E54 
    LDA.W #$0003 : STA.B $14 
    LDA.W #$0000 : STA.B $12 
    JSL.L MoveEnemyDownBy_14_12 
    BCC .return 
    LDA.L $7E7812,X : BNE .keepLeft 
    LDA.W #Function_Beetom_StartCrawlingLeft : STA.W $0FAC,X 
    BRA .return 


.keepLeft:
    LDA.W #Function_Beetom_StartCrawlingRight : STA.W $0FAC,X 

.return:
    RTS 


Function_Beetom_BeingFlung:
    LDX.W $0E54 
    JSR.W Function_Beetom_Movement_BeingFlung 
    RTS 


Function_Beetom_Movement_BeingFlung:
    LDA.W $0FAA,X 
    ASL #3
    TAY 
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing+2,Y : STA.B $14 
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing,Y : STA.B $12 
    JSL.L MoveEnemyDownBy_14_12 
    BCC .notCollidedWithBlock 
    LDA.W #Function_Beetom_DecideAction : STA.W $0FAC,X 
    BRA + 


.notCollidedWithBlock:
    LDA.W $0FAA,X : CLC : ADC.W #$0001 : STA.W $0FAA,X 
    CMP.W #$0040 : BMI + 
    LDA.W #$0040 : STA.W $0FAA,X 

  + LDA.L $7E7812,X : BNE .right 
    LDA.W #$0002 : BRA + 


.right:
    LDA.W #$0002 
    EOR.W #$FFFF 
    INC A 

  + STA.B $14 
    STZ.B $12 
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes 
    BCC .return 
    LDA.L $7E7812,X : EOR.W #$0001 : STA.L $7E7812,X 
    LDA.W #Function_Beetom_StartDropping : STA.W $0FAC,X 

.return:
    RTS 


EnemyTouch_Beetom:
    LDX.W $0E54 
    LDA.L $7E7810,X : BNE .attached 
    LDA.L $7E7812,X : BNE .right 
    LDA.W #Function_Beetom_StartDrainingSamus_FacingLeft : STA.W $0FAC,X 
    BRA + 


.right:
    LDA.W #Function_Beetom_StartDrainingSamus_FacingRight : STA.W $0FAC,X 

  + LDA.W #$0001 : STA.L $7E7810,X 
    LDA.W #$0040 : STA.W $0FB0,X 
    LDA.W #$0002 : STA.W $0F9A,X 
    LDA.W $0AF6 : SEC : SBC.W $0F7A,X : STA.L $7E780C,X 
    LDA.W $0AFA : SEC : SBC.W $0F7E,X : STA.L $7E780E,X 

.attached:
    LDA.W $0A6E : BNE .damage 
    LDA.W $0E44 : AND.W #$0007 
    CMP.W #$0007 : BNE + 
    LDA.W $09C2 : CMP.W #$001E : BMI + 
    LDA.W #$002D : JSL.L QueueSound_Lib3_Max6 

  + LDA.W $0FA4,X : AND.W #$003F 
    CMP.W #$003F : BNE .return 

.damage:
    JSL.L CommonA8_NormalEnemyTouchAI 
    LDA.W #$0000 : STA.W $18A8 
    STA.W $18AA 

.return:
    RTL 


EnemyShot_Beetom:
    JSL.L CommonA8_NormalEnemyShotAI 
    LDX.W $0E54 
    LDA.W $0F9E,X : BEQ .return 
    LDA.W $0FAC,X : CMP.W #Function_Beetom_DrainingSamus_FacingRight : BEQ .startDropping 
    CMP.W #Function_Beetom_DrainingSamus_FacingLeft : BNE .return 

.startDropping:
    LDA.W #Function_Beetom_StartDropping : STA.W $0FAC,X 

.return:
    LDA.W #$0000 : STA.L $7E7810,X 
    RTL 


Spritemap_Beetom_0:
    dw $0005,$0000 
    db $FE 
    dw $211E,$0000 
    db $F6 
    dw $210E,$0005 
    db $00 
    dw $211F,$0005 
    db $F8 
    dw $210F,$81F8 
    db $F8 
    dw $2100 

Spritemap_Beetom_1:
    dw $0005,$0000 
    db $FF 
    dw $211E,$0000 
    db $F7 
    dw $210E,$0006 
    db $00 
    dw $211F,$0005 
    db $F9 
    dw $210F,$81F8 
    db $F8 
    dw $2102 

Spritemap_Beetom_2:
    dw $0005,$0000 
    db $00 
    dw $211E,$0001 
    db $F8 
    dw $210E,$0007 
    db $00 
    dw $211F,$0006 
    db $FA 
    dw $210F,$81F8 
    db $F8 
    dw $2104 

Spritemap_Beetom_3:
    dw $0005,$0007 
    db $FE 
    dw $A10D,$01FF 
    db $FE 
    dw $A10C,$000C 
    db $FF 
    dw $210F,$000D 
    db $07 
    dw $211F,$81F8 
    db $F8 
    dw $2100 

Spritemap_Beetom_4:
    dw $0005,$000E 
    db $0F 
    dw $211F,$000C 
    db $07 
    dw $210F,$0008 
    db $02 
    dw $210D,$0000 
    db $02 
    dw $210C,$81F8 
    db $F8 
    dw $2100 

Spritemap_Beetom_5:
    dw $0005,$0002 
    db $00 
    dw $210D,$01FA 
    db $00 
    dw $210C,$0000 
    db $05 
    dw $211D,$01F8 
    db $05 
    dw $211C,$81F8 
    db $F8 
    dw $2106 

Spritemap_Beetom_6:
    dw $0005,$0001 
    db $00 
    dw $210D,$01F9 
    db $00 
    dw $210C,$01FF 
    db $05 
    dw $211D,$01F8 
    db $05 
    dw $211C,$81F8 
    db $F8 
    dw $2108 

Spritemap_Beetom_7:
    dw $0005,$0000 
    db $00 
    dw $210D,$01F8 
    db $00 
    dw $210C,$01FE 
    db $05 
    dw $211D,$01F8 
    db $05 
    dw $211C,$81F8 
    db $F8 
    dw $210A 

Spritemap_Beetom_8:
    dw $0006,$01FA 
    db $F8 
    dw $2120,$0002 
    db $00 
    dw $210D,$01FA 
    db $00 
    dw $210C,$0000 
    db $05 
    dw $211D,$01F8 
    db $05 
    dw $211C,$81F8 
    db $F8 
    dw $2106 

Spritemap_Beetom_9:
    dw $0006,$01FA 
    db $F8 
    dw $2121,$0001 
    db $00 
    dw $210D,$01F9 
    db $00 
    dw $210C,$01FF 
    db $05 
    dw $211D,$01F8 
    db $05 
    dw $211C,$81F8 
    db $F8 
    dw $2108 

Spritemap_Beetom_A:
    dw $0006,$01FA 
    db $F8 
    dw $2122,$0000 
    db $00 
    dw $210D,$01F8 
    db $00 
    dw $210C,$01FE 
    db $05 
    dw $211D,$01F8 
    db $05 
    dw $211C,$81F8 
    db $F8 
    dw $210A 

Spritemap_Beetom_B:
    dw $0005,$01F8 
    db $FE 
    dw $611E,$01F8 
    db $F6 
    dw $610E,$01F3 
    db $00 
    dw $611F,$01F3 
    db $F8 
    dw $610F,$81F8 
    db $F8 
    dw $6100 

Spritemap_Beetom_C:
    dw $0005,$01F8 
    db $FF 
    dw $611E,$01F8 
    db $F7 
    dw $610E,$01F2 
    db $00 
    dw $611F,$01F3 
    db $F9 
    dw $610F,$81F8 
    db $F8 
    dw $6102 

Spritemap_Beetom_D:
    dw $0005,$01F8 
    db $00 
    dw $611E,$01F7 
    db $F8 
    dw $610E,$01F1 
    db $00 
    dw $611F,$01F2 
    db $FA 
    dw $610F,$81F8 
    db $F8 
    dw $6104 

Spritemap_Beetom_E:
    dw $0005,$01F1 
    db $FE 
    dw $E10D,$01F9 
    db $FE 
    dw $E10C,$01EC 
    db $FF 
    dw $610F,$01EB 
    db $07 
    dw $611F,$81F8 
    db $F8 
    dw $6100 

Spritemap_Beetom_F:
    dw $0005,$01EA 
    db $0F 
    dw $611F,$01EC 
    db $07 
    dw $610F,$01F0 
    db $02 
    dw $610D,$01F8 
    db $02 
    dw $610C,$81F8 
    db $F8 
    dw $6100 

Spritemap_Beetom_10:
    dw $0005,$01F6 
    db $00 
    dw $610D,$01FE 
    db $00 
    dw $610C,$01F8 
    db $05 
    dw $611D,$0000 
    db $05 
    dw $611C,$81F8 
    db $F8 
    dw $6106 

Spritemap_Beetom_11:
    dw $0005,$01F7 
    db $00 
    dw $610D,$01FF 
    db $00 
    dw $610C,$01F9 
    db $05 
    dw $611D,$0000 
    db $05 
    dw $611C,$81F8 
    db $F8 
    dw $6108 

Spritemap_Beetom_12:
    dw $0005,$01F8 
    db $00 
    dw $610D,$0000 
    db $00 
    dw $610C,$01FA 
    db $05 
    dw $611D,$0000 
    db $05 
    dw $611C,$81F8 
    db $F8 
    dw $610A 

Spritemap_Beetom_13:
    dw $0006,$01FE 
    db $F8 
    dw $6120,$01F6 
    db $00 
    dw $610D,$01FE 
    db $00 
    dw $610C,$01F8 
    db $05 
    dw $611D,$0000 
    db $05 
    dw $611C,$81F8 
    db $F8 
    dw $6106 

Spritemap_Beetom_14:
    dw $0006,$01FE 
    db $F8 
    dw $6121,$01F7 
    db $00 
    dw $610D,$01FF 
    db $00 
    dw $610C,$01F9 
    db $05 
    dw $611D,$0000 
    db $05 
    dw $611C,$81F8 
    db $F8 
    dw $6108 

Spritemap_Beetom_15:
    dw $0006,$01FE 
    db $F8 
    dw $6122,$01F8 
    db $00 
    dw $610D,$0000 
    db $00 
    dw $610C,$01FA 
    db $05 
    dw $611D,$0000 
    db $05 
    dw $611C,$81F8 
    db $F8 
    dw $610A 

Palette_Powamp:
    dw $3800,$57FF,$42F7,$0929,$00A5,$4F5A,$36B5,$2610 
    dw $1DCE,$02FF,$01BF,$000F,$0008,$03FF,$0237,$00D1 

InstList_Powamp_Body_FastAnimation:
    dw $0005 
    dw Spritemap_Powamp_Body_CheeksLowered 
    dw $0005 
    dw Spritemap_Powamp_Body_CheeksLifting 
    dw $0005 
    dw Spritemap_Powamp_Body_CheeksRaised 
    dw Instruction_Common_GotoY 
    dw InstList_Powamp_Body_FastAnimation 

InstList_Powamp_Body_SlowAnimation:
    dw $0009 
    dw Spritemap_Powamp_Body_CheeksLowered 
    dw $0009 
    dw Spritemap_Powamp_Body_CheeksLifting 
    dw $0009 
    dw Spritemap_Powamp_Body_CheeksRaised 
    dw Instruction_Common_GotoY 
    dw InstList_Powamp_Body_SlowAnimation 

InstList_Powamp_Balloon_StartingToRise:
    dw $0001 
    dw Spritemap_Powamp_Balloon_Deflated 

InstList_Powamp_Balloon_Inflating:
    dw $0006 
    dw Spritemap_Powamp_Balloon_Inflating 

InstList_Powamp_Balloon_Inflated:
    dw $00A0 
    dw Spritemap_Powamp_Balloon_FullyInflated 
    dw Instruction_Common_Sleep 

InstList_Powamp_Balloon_StartSinking:
    dw $0001 
    dw Spritemap_Powamp_Balloon_FullyInflated 
    dw $0006 
    dw Spritemap_Powamp_Balloon_Inflating 

InstList_Powamp_Balloon_Deflated:
    dw $00A0 
    dw Spritemap_Powamp_Balloon_Deflated 
    dw Instruction_Common_Sleep 

PowampTravelDistanceWhenNotGrappled:
    dw $0040 

PowampWiggleTable:
    dw $0000,$0001,$0002,$0003,$0002,$0001,$0000,$FFFF 
    dw $FFFE,$FFFD,$FFFE,$FFFF 

Powamp_YAccel_Rising:
    dw $0000,$0000 

Powamp_YAccel_Sinking:
    dw $0000,$0000 

Powamp_InitialYVelocity_Sinking:
    dw $0001,$0000 

Powamp_InitialYVelocity_Rising:
    dw $FFFF,$8000 

InitAI_Powamp:
    LDX.W $0E54 
    LDA.W $0F86,X : ORA.W #$2000 : STA.W $0F86,X 
    LDA.W #Spritemap_CommonA8_Nothing : STA.W $0F8E,X 
    LDA.W #$0001 : STA.W $0F94,X 
    STZ.W $0F90,X 
    LDA.W $0FB4,X : BNE .balloon 
    LDA.W #$003C : STA.W $0FB0,X 
    LDA.W #Function_Powamp_Deflated_Resting : STA.W $0FB2,X 
    LDA.W #InstList_Powamp_Body_SlowAnimation : STA.W $0F92,X 
    BRA .return 


.balloon:
    LDA.W $0F7A,X : STA.W $0FA8,X 
    LDA.W $0F7E,X : STA.W $0FAA,X 
    LDA.W #RTL_A8C568 : STA.W $0FB2,X 
    LDA.W #InstList_Powamp_Balloon_Deflated : STA.W $0F92,X 
    LDA.W $0FB6,X : STA.W $0FAE,X 

.return:
    RTL 


MainAI_Powamp:
    LDX.W $0E54 
    JMP.W ($0FB2,X) 


RTL_A8C222:
    RTL 


FirePowampSpikesIn8Directions:
    LDY.W #$0007 

.loop:
    TYA 
    PHY 
    LDY.W #EnemyProjectile_Powamp 
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    PLY 
    DEY 
    BPL .loop 
    RTS 


HandlePowampBalloonYOffset:
    LDA.W $0F52,X : CMP.W #InstList_Powamp_Balloon_StartSinking : BPL .sinking 
    SEC : SBC.W #$0004 : SEC : SBC.W #InstList_Powamp_Balloon_StartingToRise : LSR A 
    CMP.W #$0006 : BMI + 
    LDA.W #$0000 

  + TAY 
    LDA.W $0F7E,X : CLC : ADC.W .risingYOffsets,Y : STA.W $0F3E,X 
    BRA .return 


.sinking:
    SEC : SBC.W #$0004 : SEC : SBC.W #InstList_Powamp_Balloon_StartSinking : LSR A 
    CMP.W #$0006 : BMI + 
    LDA.W #$0000 

  + TAY 
    LDA.W $0F7E,X : CLC : ADC.W .sinkingYOffsets,Y : STA.W $0F3E,X 

.return:
    RTS 


.risingYOffsets:
    dw $FFF4,$FFF0,$FFEC 

.sinkingYOffsets:
    dw $FFEC,$FFF0,$FFF4 

Function_Powamp_Deflated_Resting:
    DEC.W $0FB0,X 
    BEQ .timerExpired 
    BPL .done 

.timerExpired:
    LDA.W #$0001 : STA.W $0F54,X 
    LDA.W #InstList_Powamp_Balloon_StartingToRise : STA.W $0F52,X 
    LDA.W #Function_Powamp_Inflating : STA.W $0FB2,X 
    LDA.W #$000A : STA.W $0FB0,X 

.done:
    JSR.W HandlePowampBalloonYOffset 
    RTL 


Function_Powamp_Inflating:
    DEC.W $0FB0,X 
    BEQ .timerExpired 
    BPL .done 

.timerExpired:
    LDA.W #Function_Powamp_Inflated_RiseToTargetHeight : STA.W $0FB2,X 
    LDA.W Powamp_InitialYVelocity_Rising : STA.W $0FA8,X 
    LDA.W Powamp_InitialYVelocity_Rising+2 : STA.W $0FAA,X 
    LDA.W #$0001 : STA.W $0F94,X 
    LDA.W #InstList_Powamp_Body_FastAnimation : STA.W $0F92,X 

.done:
    JSR.W HandlePowampBalloonYOffset 
    RTL 


Function_Powamp_Inflated_RiseToTargetHeight:
    LDA.W $0F8A,X : BIT.W #$0001 
    BEQ .notGrappleAI 
    LDA.W #Function_Powamp_Grappled_RiseToTargetHeight : STA.W $0FB2,X 
    JMP.W Function_Powamp_Grappled_RiseToTargetHeight 


.notGrappleAI:
    DEC.W $0FAE,X 
    BEQ .negativeTimer 
    BPL .timerNotExpired 

.negativeTimer:
    LDA.W #$0005 : STA.W $0FAE,X 
    LDA.W $0FAC,X 
    ASL A 
    TAY 
    LDA.W $0F68,X : CLC : ADC.W PowampWiggleTable,Y : STA.W $0F3A,X 
    STA.W $0F7A,X 
    LDA.W $0FAC,X 
    INC A 
    CMP.W #$000C : BMI .storeIndex 
    LDA.W #$0000 

.storeIndex:
    STA.W $0FAC,X 

.timerNotExpired:
    LDA.W $0FAA,X : CLC : ADC.W Powamp_YAccel_Rising+2 : STA.W $0FAA,X 
    LDA.W $0FA8,X : ADC.W Powamp_YAccel_Rising : STA.W $0FA8,X 
    LDA.W $0FA8,X : STA.B $14 
    LDA.W $0FAA,X : STA.B $12 
    JSL.L MoveEnemyDownBy_14_12 
    BCS .doneRising 
    LDA.W $0F6A,X : SEC : SBC.W PowampTravelDistanceWhenNotGrappled : CMP.W $0F7E,X : BMI .done 

.doneRising:
    LDA.W $0FAC,X : BEQ .centered 
    CMP.W #$0006 : BEQ .centered 
    LDA.W #Function_Powamp_Inflated_FinishWiggle : STA.W $0FB2,X 
    BRA .done 


.centered:
    LDA.W #Function_Powamp_Deflating : STA.W $0FB2,X 
    LDA.W #$000A : STA.W $0FB0,X 
    LDA.W #$0001 : STA.W $0F54,X 
    LDA.W #InstList_Powamp_Balloon_StartSinking : STA.W $0F52,X 

.done:
    JSR.W HandlePowampBalloonYOffset 
    RTL 


Function_Powamp_Inflated_FinishWiggle:
    DEC.W $0FAE,X 
    BEQ .timerExpired 
    BPL .continueRising 

.timerExpired:
    LDA.W #$0005 : STA.W $0FAE,X 
    LDA.W $0FAC,X 
    ASL A 
    TAY 
    LDA.W $0F68,X : CLC : ADC.W PowampWiggleTable,Y : STA.W $0F3A,X 
    STA.W $0F7A,X 
    LDA.W $0FAC,X : BEQ .centered 
    CMP.W #$0006 : BEQ .centered 
    INC A 
    CMP.W #$000C : BMI .storeIndex 
    LDA.W #$0000 

.storeIndex:
    STA.W $0FAC,X 
    BRA .continueRising 


.centered:
    LDA.W #Function_Powamp_Deflating : STA.W $0FB2,X 
    LDA.W #$000A : STA.W $0FB0,X 
    LDA.W #$0001 : STA.W $0F54,X 
    LDA.W #InstList_Powamp_Balloon_StartSinking : STA.W $0F52,X 
    BRA .return 


.continueRising:
    LDA.W $0FAA,X : CLC : ADC.W Powamp_YAccel_Rising+2 : STA.W $0FAA,X 
    LDA.W $0FA8,X : ADC.W Powamp_YAccel_Rising : STA.W $0FA8,X 
    LDA.W $0FA8,X : STA.B $14 
    LDA.W $0FAA,X : STA.B $12 
    JSL.L MoveEnemyDownBy_14_12 

.return:
    JSR.W HandlePowampBalloonYOffset 
    RTL 


Function_Powamp_Grappled_RiseToTargetHeight:
    LDA.W $0F8A,X : BIT.W #$0001 
    BNE .grappleAI 
    LDA.W #Function_Powamp_Inflated_FinishWiggle : STA.W $0FB2,X 
    RTL 


.grappleAI:
    DEC.W $0FAE,X 
    BEQ .timerExpired 
    BPL .timerNotExpired 

.timerExpired:
    LDA.W #$0005 : STA.W $0FAE,X 
    LDA.W $0FAC,X 
    ASL A 
    TAY 
    LDA.W $0F68,X : CLC : ADC.W PowampWiggleTable,Y : STA.W $0F3A,X 
    STA.W $0F7A,X 
    LDA.W $0FAC,X 
    INC A 
    CMP.W #$000C : BMI .storeIndex 
    LDA.W #$0000 

.storeIndex:
    STA.W $0FAC,X 

.timerNotExpired:
    LDA.W $0FAA,X : CLC : ADC.W Powamp_YAccel_Rising+2 : STA.W $0FAA,X 
    LDA.W $0FA8,X : ADC.W Powamp_YAccel_Rising : STA.W $0FA8,X 
    LDA.W $0FA8,X : STA.B $14 
    LDA.W $0FAA,X : STA.B $12 
    JSL.L MoveEnemyDownBy_14_12 
    BCS .doneSinking 
    LDA.W $0F6A,X : SEC : SBC.W $0F6E,X : CMP.W $0F7E,X : BMI .return 

.doneSinking:
    LDA.W $0FAC,X : BEQ .centered 
    CMP.W #$0006 : BEQ .centered 
    LDA.W #Function_Powamp_Grappled_FinishWiggle : STA.W $0FB2,X 
    BRA .return 


.centered:
    LDA.W #Function_Powamp_Grappled_Resting : STA.W $0FB2,X 

.return:
    JSR.W HandlePowampBalloonYOffset 
    RTL 


Function_Powamp_Grappled_FinishWiggle:
    LDA.W $0F8A,X : BIT.W #$0001 
    BNE .GrappleAI 
    LDA.W #Function_Powamp_Inflated_FinishWiggle : STA.W $0FB2,X 
    RTL 


.GrappleAI:
    DEC.W $0FAE,X 
    BEQ .timerExpired 
    BPL .continueRising 

.timerExpired:
    LDA.W #$0005 : STA.W $0FAE,X 
    LDA.W $0FAC,X 
    ASL A 
    TAY 
    LDA.W $0F68,X : CLC : ADC.W PowampWiggleTable,Y : STA.W $0F3A,X 
    STA.W $0F7A,X 
    LDA.W $0FAC,X : BEQ .centered 
    CMP.W #$0006 : BEQ .centered 
    INC A 
    CMP.W #$000C : BMI .storeIndex 
    LDA.W #$0000 

.storeIndex:
    STA.W $0FAC,X 
    BRA .continueRising 


.centered:
    LDA.W #Function_Powamp_Grappled_Resting : STA.W $0FB2,X 
    BRA .return 


.continueRising:
    LDA.W $0FAA,X : CLC : ADC.W Powamp_YAccel_Rising+2 : STA.W $0FAA,X 
    LDA.W $0FA8,X : ADC.W Powamp_YAccel_Rising : STA.W $0FA8,X 
    LDA.W $0FA8,X : STA.B $14 
    LDA.W $0FAA,X : STA.B $12 
    JSL.L MoveEnemyDownBy_14_12 

.return:
    JSR.W HandlePowampBalloonYOffset 
    RTL 


Function_Powamp_Grappled_Resting:
    LDA.W $0F8A,X : BIT.W #$0001 
    BNE .done 
    LDA.W #Function_Powamp_Deflating : STA.W $0FB2,X 
    LDA.W #$000A : STA.W $0FB0,X 
    LDA.W #$0001 : STA.W $0F54,X 
    LDA.W #InstList_Powamp_Balloon_StartSinking : STA.W $0F52,X 

.done:
    JSR.W HandlePowampBalloonYOffset 
    RTL 


Function_Powamp_Deflating:
    DEC.W $0FB0,X 
    BEQ .timerExpired 
    BPL .done 

.timerExpired:
    LDA.W #Function_Powamp_Deflated_Sinking : STA.W $0FB2,X 
    LDA.W Powamp_InitialYVelocity_Sinking : STA.W $0FA8,X 
    LDA.W Powamp_InitialYVelocity_Sinking+2 : STA.W $0FAA,X 

.done:
    JSR.W HandlePowampBalloonYOffset 
    RTL 


Function_Powamp_Deflated_Sinking:
    LDA.W $0FAA,X : CLC : ADC.W Powamp_YAccel_Sinking+2 : STA.W $0FAA,X 
    LDA.W $0FA8,X : ADC.W Powamp_YAccel_Sinking : STA.W $0FA8,X 
    LDA.W $0FA8,X : STA.B $14 
    LDA.W $0FAA,X : STA.B $12 
    JSL.L MoveEnemyDownBy_14_12 
    LDA.W $0F7E,X : CMP.W $0F6A,X : BMI .done 
    LDA.W $0F6A,X : STA.W $0F7E,X 
    LDA.W #Function_Powamp_Deflated_Resting : STA.W $0FB2,X 
    LDA.W #$003C : STA.W $0FB0,X 
    LDA.W #$0001 : STA.W $0F94,X 
    LDA.W #InstList_Powamp_Body_SlowAnimation : STA.W $0F92,X 

.done:
    JSR.W HandlePowampBalloonYOffset 
    RTL 


RTL_A8C568:
    RTL 


Function_Powamp_FatalDamage:
    LDA.W $0F52,X : CMP.W #InstList_Powamp_Balloon_StartSinking : BMI + 
    SEC : SBC.W #$0004 : SEC : SBC.W #InstList_Powamp_Balloon_StartSinking : LSR A 
    BEQ + 
    TAY 
    LDA.W .instListPointers,Y : STA.W $0F52,X 
    LDA.W #$0001 : STA.W $0F54,X 

  + LDA.W #Function_Powamp_DeathSequence : STA.W $0FB2,X 
    LDA.W #$0020 : STA.W $0FB0,X 
    JSR.W HandlePowampBalloonYOffset 
    RTL 


.instListPointers:
    dw InstList_Powamp_Balloon_Inflated 
    dw InstList_Powamp_Balloon_Inflating 
    dw InstList_Powamp_Balloon_StartingToRise 

Function_Powamp_DeathSequence:
    DEC.W $0FB0,X 
    BEQ .timerExpired 
    BPL .done 

.timerExpired:
    STZ.W $0F4C,X 
    LDA.W $0F46,X : ORA.W #$0200 : STA.W $0F46,X 
    JSR.W FirePowampSpikesIn8Directions 
    JSL.L EnemyDeath 
    RTL 


.done:
    JSR.W HandlePowampBalloonYOffset 
    RTL 


EnemyTouch_Powamp:
    LDX.W $0E54 
    LDA.W $0FB6,X : BNE .return 
    LDA.W $0F96,X 
    PHA 
    JSL.L NormalEnemyTouchAI 
    LDX.W $0E54 
    LDA.W $0F8C,X : BEQ .dead 
    PLA 
    RTL 


.dead:
    LDA.W $0F46,X : ORA.W #$0200 : STA.W $0F46,X 
    PLA 
    STA.W $0F96,X 
    JSR.W FirePowampSpikesIn8Directions 
    LDA.W #$0A00 : STA.W $0F96,X 

.return:
    RTL 


EnemyShot_Powamp:
    PHB 
    LDX.W $0E54 
    LDA.W $0FB6,X : BEQ .body 
    PLB 
    RTL 


.body:
    JSL.L NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External 
    LDA.W $0F8A,X : BIT.W #$0004 
    BEQ .notFrozenAI 
    LDA.W $0F9E,X : STA.W $0F5E,X 
    LDA.W $0F4A,X : ORA.W #$0004 : STA.W $0F4A,X 

.notFrozenAI:
    LDA.W $0F8A,X : BIT.W #$0002 
    BEQ .notHurtAI 
    LDA.W $0F9C,X : STA.W $0F5C,X 
    LDA.W $0F4A,X : ORA.W #$0002 : STA.W $0F4A,X 

.notHurtAI:
    LDA.W $0F8C,X : BNE .return 
    LDA.W #Function_Powamp_FatalDamage : STA.W $0FB2,X 
    LDA.W #$0001 : STA.W $0FB6,X 

.return:
    PLB 
    RTL 


PowerBombReaction_Powamp:
    JSL.L CommonA8_NormalEnemyPowerBombAI 
    LDX.W $0E54 
    LDA.W $0F8C,X : BNE .notDead 
    LDA.W $0F46,X : ORA.W #$0200 : STA.W $0F46,X 
    BRA .return 


.notDead:
    LDA.W $0FA2,X : STA.W $0F62,X 
    LDA.W $0FA0,X : STA.W $0F60,X 
    LDA.W $0F9C,X : STA.W $0F5C,X 
    LDA.W $0F9E,X : STA.W $0F5E,X 
    LDA.W $0F8A,X : STA.W $0F4A,X 

.return:
    RTL 


Spritemap_Powamp_Body_CheeksLowered:
    dw $0001,$81F8 
    db $F8 
    dw $2100 

Spritemap_Powamp_Body_CheeksLifting:
    dw $0001,$81F8 
    db $F8 
    dw $2102 

Spritemap_Powamp_Body_CheeksRaised:
    dw $0001,$81F8 
    db $F8 
    dw $2104 

Spritemap_Powamp_Balloon_Deflated:
    dw $0001,$01FC 
    db $FC 
    dw $210E 

Spritemap_Powamp_Balloon_Inflating:
    dw $0001,$81F8 
    db $F8 
    dw $2106 

Spritemap_Powamp_Balloon_FullyInflated:
    dw $0005,$0004 
    db $04 
    dw $210D,$01FC 
    db $04 
    dw $210C,$01F4 
    db $04 
    dw $210B,$81FC 
    db $F4 
    dw $2109,$81F4 
    db $F4 
    dw $2108 

Palette_Robot:
    dw $3800,$57FF,$42F7,$0929,$00A5,$4F5A,$36B5,$2610 
    dw $1DCE,$001F,$0018,$000F,$0008,$000A,$03FF,$02B5 

InstList_RobotNoPower_Neutral:
    dw $7FFF 
    dw Spritemap_Robot_19 
    dw Instruction_Common_Sleep 

InstList_RobotNoPower_LeaningLeft:
    dw $7FFF 
    dw Spritemap_Robot_18 
    dw Instruction_Common_Sleep 

InstList_RobotNoPower_LeaningRIght:
    dw $7FFF 
    dw Spritemap_Robot_1A 
    dw Instruction_CommonA8_Sleep 

InstList_Robot_Initial:
    dw $0020 
    dw Spritemap_Robot_1 

InstList_Robot_FacingLeft_WalkingForwards_0:
    dw $0001 
    dw Spritemap_Robot_1 

InstList_Robot_FacingLeft_WalkingForwards_1:
    dw $000A 
    dw Spritemap_Robot_1 
    dw $0001 
    dw Spritemap_Robot_2 
    dw Instruction_Robot_TryShootingLaserLeft 
    dw $0009 
    dw Spritemap_Robot_2 
    dw $0001 
    dw Spritemap_Robot_3 
    dw Instruction_Robot_TryShootingLaserUpLeft 
    dw $0009 
    dw Spritemap_Robot_3 
    dw $000A 
    dw Spritemap_Robot_4 
    dw Instruction_Robot_PlaySFXIfOnScreen 
    dw Instruction_Robot_FacingLeft_MoveForward_HandleWallOrFall 
    dw $000A 
    dw Spritemap_Robot_5 
    dw Instruction_Robot_FacingLeft_MoveForward_HandleWallOrFall 
    dw $000A 
    dw Spritemap_Robot_6 
    dw $000A 
    dw Spritemap_Robot_7 
    dw $000A 
    dw Spritemap_Robot_8 
    dw $000A 
    dw Spritemap_Robot_9 
    dw $000A 
    dw Spritemap_Robot_A 
    dw Instruction_Robot_FacingLeft_MoveForward_HandleWallOrFall 
    dw Instruction_Robot_PlaySFXIfOnScreen 
    dw $000A 
    dw Spritemap_Robot_B 
    dw Instruction_Robot_FacingLeft_MoveForward_HandleWallOrFall 
    dw $0001 
    dw Spritemap_Robot_0 
    dw Instruction_Robot_TryShootingLaserDownLeft 
    dw $0009 
    dw Spritemap_Robot_0 
    dw Instruction_Common_GotoY 
    dw InstList_Robot_FacingLeft_WalkingForwards_1 

InstList_Robot_FacingLeft_HitWallMovingForwards:
    dw $0001 
    dw Spritemap_Robot_B 
    dw $000A 
    dw Spritemap_Robot_B 
    dw Instruction_Robot_PlaySFXIfOnScreen 
    dw Instruction_Robot_FacingLeft_MoveBackward_HandleWallOrFall 
    dw $000A 
    dw Spritemap_Robot_A 
    dw $000A 
    dw Spritemap_Robot_9 
    dw $000A 
    dw Spritemap_Robot_8 
    dw $000A 
    dw Spritemap_Robot_7 
    dw $000A 
    dw Spritemap_Robot_6 
    dw Instruction_Robot_PlaySFXIfOnScreen 
    dw Instruction_Robot_FacingLeft_MoveBackward_HandleWallOrFall 
    dw $000A 
    dw Spritemap_Robot_5 
    dw Instruction_Robot_FacingLeft_MoveBackward_HandleWallOrFall 
    dw $000A 
    dw Spritemap_Robot_4 
    dw $000A 
    dw Spritemap_Robot_3 
    dw $000A 
    dw Spritemap_Robot_2 
    dw $000A 
    dw Spritemap_Robot_1 
    dw $000A 
    dw Spritemap_Robot_0 
    dw Instruction_Robot_FacingLeft_MoveBackward_HandleWallOrFall 
    dw Instruction_Robot_PlaySFXIfOnScreen 
    dw $000A 
    dw Spritemap_Robot_B 
    dw Instruction_Robot_FacingLeft_MoveBackward_HandleWallOrFall 
    dw $000A 
    dw Spritemap_Robot_A 
    dw $000A 
    dw Spritemap_Robot_9 
    dw $000A 
    dw Spritemap_Robot_8 
    dw $000A 
    dw Spritemap_Robot_7 
    dw $000A 
    dw Spritemap_Robot_6 
    dw Instruction_Robot_PlaySFXIfOnScreen 
    dw Instruction_Robot_FacingLeft_MoveBackward_HandleWallOrFall 
    dw $000A 
    dw Spritemap_Robot_5 
    dw Instruction_Robot_FacingLeft_MoveBackward_HandleWallOrFall 
    dw $000A 
    dw Spritemap_Robot_4 
    dw $000A 
    dw Spritemap_Robot_3 
    dw $000A 
    dw Spritemap_Robot_2 
    dw $000A 
    dw Spritemap_Robot_1 
    dw $000A 
    dw Spritemap_Robot_0 
    dw Instruction_Robot_SetInstListTo_FacingRight_WalkingForwards 

InstList_Robot_FacingLeft_Shot_SamusIsAhead:
    dw $0005 
    dw Spritemap_Robot_B 
    dw Instruction_Robot_PlaySFXIfOnScreen 
    dw Instruction_Robot_FacingLeft_MoveBackward_HandleHittingWall 
    dw $0005 
    dw Spritemap_Robot_A 
    dw $0005 
    dw Spritemap_Robot_9 
    dw $0005 
    dw Spritemap_Robot_8 
    dw $0005 
    dw Spritemap_Robot_7 
    dw $0005 
    dw Spritemap_Robot_6 
    dw Instruction_Robot_PlaySFXIfOnScreen 
    dw Instruction_Robot_FacingLeft_MoveBackward_HandleHittingWall 
    dw $0005 
    dw Spritemap_Robot_5 
    dw Instruction_Robot_FacingLeft_MoveBackward_HandleHittingWall 
    dw $0005 
    dw Spritemap_Robot_4 
    dw $0005 
    dw Spritemap_Robot_3 
    dw $0005 
    dw Spritemap_Robot_2 
    dw $0005 
    dw Spritemap_Robot_1 
    dw $0005 
    dw Spritemap_Robot_0 
    dw Instruction_Robot_FacingLeft_MoveBackward_HandleHittingWall 
    dw Instruction_Robot_PlaySFXIfOnScreen 
    dw $0005 
    dw Spritemap_Robot_B 
    dw Instruction_Robot_FacingLeft_MoveBackward_HandleHittingWall 
    dw $0005 
    dw Spritemap_Robot_A 
    dw $0005 
    dw Spritemap_Robot_9 
    dw $0005 
    dw Spritemap_Robot_8 
    dw $0005 
    dw Spritemap_Robot_7 
    dw $0005 
    dw Spritemap_Robot_6 
    dw Instruction_Robot_PlaySFXIfOnScreen 
    dw Instruction_Robot_FacingLeft_MoveBackward_HandleHittingWall 
    dw $0005 
    dw Spritemap_Robot_5 
    dw Instruction_Robot_FacingLeft_MoveBackward_HandleHittingWall 
    dw $0005 
    dw Spritemap_Robot_4 
    dw $0005 
    dw Spritemap_Robot_3 
    dw $0005 
    dw Spritemap_Robot_2 
    dw $0005 
    dw Spritemap_Robot_1 
    dw $0005 
    dw Spritemap_Robot_0 
    dw Instruction_Robot_SetInstListTo_FacingRight_WalkingForwards 

InstList_Robot_FacingLeft_Shot_SamusIsBehind:
    dw Instruction_Robot_PlaySFXIfOnScreen 
    dw Instruction_Robot_FacingLeft_MoveForward_HandleHittingWall 
    dw $0005 
    dw Spritemap_Robot_1 
    dw $0005 
    dw Spritemap_Robot_2 
    dw $0005 
    dw Spritemap_Robot_3 
    dw $0005 
    dw Spritemap_Robot_4 
    dw Instruction_Robot_PlaySFXIfOnScreen 
    dw Instruction_Robot_FacingLeft_MoveForward_HandleHittingWall 
    dw $0005 
    dw Spritemap_Robot_5 
    dw Instruction_Robot_FacingLeft_MoveForward_HandleHittingWall 
    dw $0005 
    dw Spritemap_Robot_6 
    dw $0005 
    dw Spritemap_Robot_7 
    dw $0005 
    dw Spritemap_Robot_8 
    dw $0005 
    dw Spritemap_Robot_9 
    dw $0005 
    dw Spritemap_Robot_A 
    dw Instruction_Robot_FacingLeft_MoveForward_HandleHittingWall 
    dw Instruction_Robot_PlaySFXIfOnScreen 
    dw $0005 
    dw Spritemap_Robot_B 
    dw Instruction_Robot_FacingLeft_MoveForward_HandleHittingWall 
    dw $0005 
    dw Spritemap_Robot_0 
    dw $0005 
    dw Spritemap_Robot_1 
    dw $0005 
    dw Spritemap_Robot_2 
    dw $0005 
    dw Spritemap_Robot_3 
    dw $0005 
    dw Spritemap_Robot_4 
    dw Instruction_Robot_PlaySFXIfOnScreen 
    dw Instruction_Robot_FacingLeft_MoveForward_HandleHittingWall 
    dw $0005 
    dw Spritemap_Robot_5 
    dw Instruction_Robot_FacingLeft_MoveForward_HandleHittingWall 
    dw $0005 
    dw Spritemap_Robot_6 
    dw $0005 
    dw Spritemap_Robot_7 
    dw $0005 
    dw Spritemap_Robot_8 
    dw $0005 
    dw Spritemap_Robot_9 
    dw $0005 
    dw Spritemap_Robot_A 
    dw Instruction_Robot_FacingLeft_MoveForward_HandleHittingWall 
    dw Instruction_Robot_PlaySFXIfOnScreen 
    dw $0005 
    dw Spritemap_Robot_B 
    dw Instruction_Robot_FacingLeft_MoveForward_HandleHittingWall 
    dw $0005 
    dw Spritemap_Robot_0 
    dw Instruction_Robot_Goto_FacingLeft_WalkingForwards 

InstList_Robot_FacingLeft_ShotLaserDownLeft:
    dw $0005 
    dw Spritemap_Robot_0 
    dw $0002 
    dw Spritemap_Robot_B 
    dw Instruction_Common_GotoY 
    dw InstList_Robot_FacingLeft_LaserShotRecoil 

InstList_Robot_FacingLeft_ShotLaserLeft:
    dw $0005 
    dw Spritemap_Robot_1 
    dw $0002 
    dw Spritemap_Robot_0 
    dw Instruction_Robot_FacingLeft_MoveBackward_HandleWallOrFall 
    dw Instruction_Robot_PlaySFXIfOnScreen 
    dw $000A 
    dw Spritemap_Robot_B 
    dw Instruction_Common_GotoY 
    dw InstList_Robot_FacingLeft_LaserShotRecoil 

InstList_Robot_FacingLeft_ShotLaserUpLeft:
    dw $0005 
    dw Spritemap_Robot_3 
    dw $0002 
    dw Spritemap_Robot_2 
    dw $0002 
    dw Spritemap_Robot_1 
    dw $0004 
    dw Spritemap_Robot_0 
    dw Instruction_Robot_FacingLeft_MoveBackward_HandleWallOrFall 
    dw Instruction_Robot_PlaySFXIfOnScreen 
    dw $0004 
    dw Spritemap_Robot_B 

InstList_Robot_FacingLeft_LaserShotRecoil:
    dw Instruction_Robot_FacingLeft_MoveBackward_HandleWallOrFall 
    dw $0010 
    dw Spritemap_Robot_A 
    dw $0005 
    dw Spritemap_Robot_9 
    dw $0005 
    dw Spritemap_Robot_8 
    dw $0005 
    dw Spritemap_Robot_7 
    dw $0005 
    dw Spritemap_Robot_6 
    dw Instruction_Robot_PlaySFXIfOnScreen 
    dw Instruction_Robot_FacingLeft_MoveBackward_HandleWallOrFall 
    dw $000A 
    dw Spritemap_Robot_5 
    dw Instruction_Robot_FacingLeft_MoveBackward_HandleWallOrFall 
    dw $000A 
    dw Spritemap_Robot_4 
    dw $000A 
    dw Spritemap_Robot_3 
    dw $0060 
    dw Spritemap_Robot_2 
    dw Instruction_Robot_DecrementLaserCooldown 
    dw Instruction_CommonA8_GotoY 
    dw InstList_Robot_FacingLeft_WalkingForwards_0 

InstList_Robot_ApproachingAFallToTheRight:
    dw $0080 
    dw Spritemap_Robot_C 
    dw $000A 
    dw Spritemap_Robot_D 
    dw $000A 
    dw Spritemap_Robot_E 
    dw Instruction_Robot_DecrementLaserCooldown 
    dw Instruction_Common_GotoY 
    dw InstList_Robot_FacingLeft_WalkingForwards_0 

InstList_Robot_FacingRight_WalkingForwards_0:
    dw $0001 
    dw Spritemap_Robot_C 

InstList_Robot_FacingRight_WalkingForwards_1:
    dw $0001 
    dw Spritemap_Robot_C 
    dw Instruction_Robot_TryShootingLaserDownRight 
    dw $0009 
    dw Spritemap_Robot_C 
    dw Instruction_Robot_DecrementLaserCooldown 
    dw $000A 
    dw Spritemap_Robot_D 
    dw $0001 
    dw Spritemap_Robot_E 
    dw Instruction_Robot_TryShootingLaserRight 
    dw $0009 
    dw Spritemap_Robot_E 
    dw $0001 
    dw Spritemap_Robot_F 
    dw Instruction_Robot_TryShootingLaserUpRight 
    dw $0009 
    dw Spritemap_Robot_F 
    dw $000A 
    dw Spritemap_Robot_10 
    dw Instruction_Robot_PlaySFXIfOnScreen 
    dw Instruction_Robot_FacingRight_MoveForward_HandleWallOrFall 
    dw $000A 
    dw Spritemap_Robot_11 
    dw Instruction_Robot_FacingRight_MoveForward_HandleWallOrFall 
    dw $000A 
    dw Spritemap_Robot_12 
    dw $000A 
    dw Spritemap_Robot_13 
    dw $000A 
    dw Spritemap_Robot_14 
    dw $000A 
    dw Spritemap_Robot_15 
    dw $000A 
    dw Spritemap_Robot_16 
    dw Instruction_Robot_FacingRight_MoveForward_HandleWallOrFall 
    dw Instruction_Robot_PlaySFXIfOnScreen 
    dw $000A 
    dw Spritemap_Robot_17 
    dw Instruction_Robot_FacingRight_MoveForward_HandleWallOrFall 
    dw Instruction_Common_GotoY 
    dw InstList_Robot_FacingRight_WalkingForwards_1 

InstList_Robot_FacingRight_HitWallMovingForwards:
    dw $0001 
    dw Spritemap_Robot_17 
    dw $000A 
    dw Spritemap_Robot_17 
    dw Instruction_Robot_PlaySFXIfOnScreen 
    dw Instruction_Robot_FacingRight_MoveBackward_HandleWallOrFall 
    dw $000A 
    dw Spritemap_Robot_16 
    dw $000A 
    dw Spritemap_Robot_15 
    dw $000A 
    dw Spritemap_Robot_14 
    dw $000A 
    dw Spritemap_Robot_13 
    dw $000A 
    dw Spritemap_Robot_12 
    dw Instruction_Robot_PlaySFXIfOnScreen 
    dw Instruction_Robot_FacingRight_MoveBackward_HandleWallOrFall 
    dw $000A 
    dw Spritemap_Robot_11 
    dw Instruction_Robot_FacingRight_MoveBackward_HandleWallOrFall 
    dw $000A 
    dw Spritemap_Robot_10 
    dw $000A 
    dw Spritemap_Robot_F 
    dw $000A 
    dw Spritemap_Robot_E 
    dw $000A 
    dw Spritemap_Robot_D 
    dw $000A 
    dw Spritemap_Robot_C 
    dw Instruction_Robot_PlaySFXIfOnScreen 
    dw Instruction_Robot_FacingRight_MoveBackward_HandleWallOrFall 
    dw $000A 
    dw Spritemap_Robot_17 
    dw Instruction_Robot_FacingRight_MoveBackward_HandleWallOrFall 
    dw $000A 
    dw Spritemap_Robot_16 
    dw $000A 
    dw Spritemap_Robot_15 
    dw $000A 
    dw Spritemap_Robot_14 
    dw $000A 
    dw Spritemap_Robot_13 
    dw $000A 
    dw Spritemap_Robot_12 
    dw Instruction_Robot_PlaySFXIfOnScreen 
    dw Instruction_Robot_FacingRight_MoveBackward_HandleWallOrFall 
    dw $000A 
    dw Spritemap_Robot_11 
    dw Instruction_Robot_FacingRight_MoveBackward_HandleWallOrFall 
    dw $000A 
    dw Spritemap_Robot_10 
    dw $000A 
    dw Spritemap_Robot_F 
    dw $000A 
    dw Spritemap_Robot_E 
    dw $000A 
    dw Spritemap_Robot_D 
    dw $000A 
    dw Spritemap_Robot_C 
    dw Instruction_Robot_Goto_FacingLeft_WalkingForwards 

InstList_Robot_FacingRight_Shot_SamusIsAhead:
    dw $0001 
    dw Spritemap_Robot_17 
    dw $0005 
    dw Spritemap_Robot_17 
    dw Instruction_Robot_PlaySFXIfOnScreen 
    dw Instruction_Robot_FacingRight_MoveBackward_HandleHittingWall 
    dw $0005 
    dw Spritemap_Robot_16 
    dw $0005 
    dw Spritemap_Robot_15 
    dw $0005 
    dw Spritemap_Robot_14 
    dw $0005 
    dw Spritemap_Robot_13 
    dw $0005 
    dw Spritemap_Robot_12 
    dw Instruction_Robot_PlaySFXIfOnScreen 
    dw Instruction_Robot_FacingRight_MoveBackward_HandleHittingWall 
    dw $0005 
    dw Spritemap_Robot_11 
    dw Instruction_Robot_FacingRight_MoveBackward_HandleHittingWall 
    dw $0005 
    dw Spritemap_Robot_10 
    dw $0005 
    dw Spritemap_Robot_F 
    dw $0005 
    dw Spritemap_Robot_E 
    dw $0005 
    dw Spritemap_Robot_D 
    dw $0005 
    dw Spritemap_Robot_C 
    dw Instruction_Robot_FacingRight_MoveBackward_HandleHittingWall 
    dw Instruction_Robot_PlaySFXIfOnScreen 
    dw $0005 
    dw Spritemap_Robot_17 
    dw Instruction_Robot_FacingRight_MoveBackward_HandleHittingWall 
    dw $0005 
    dw Spritemap_Robot_16 
    dw $0005 
    dw Spritemap_Robot_15 
    dw $0005 
    dw Spritemap_Robot_14 
    dw $0005 
    dw Spritemap_Robot_13 
    dw $0005 
    dw Spritemap_Robot_12 
    dw Instruction_Robot_PlaySFXIfOnScreen 
    dw Instruction_Robot_FacingRight_MoveBackward_HandleHittingWall 
    dw $000A 
    dw Spritemap_Robot_11 
    dw Instruction_Robot_FacingRight_MoveBackward_HandleHittingWall 
    dw $0005 
    dw Spritemap_Robot_10 
    dw $0005 
    dw Spritemap_Robot_F 
    dw $0005 
    dw Spritemap_Robot_E 
    dw $0005 
    dw Spritemap_Robot_D 
    dw $0005 
    dw Spritemap_Robot_C 
    dw Instruction_Robot_Goto_FacingLeft_WalkingForwards 

InstList_Robot_FacingRight_Shot_SamusIsBehind:
    dw Instruction_Robot_FacingRight_MoveForward_HandleHittingWall 
    dw Instruction_Robot_PlaySFXIfOnScreen 
    dw $0005 
    dw Spritemap_Robot_C 
    dw $0005 
    dw Spritemap_Robot_D 
    dw $0005 
    dw Spritemap_Robot_E 
    dw $0005 
    dw Spritemap_Robot_F 
    dw $0005 
    dw Spritemap_Robot_10 
    dw Instruction_Robot_PlaySFXIfOnScreen 
    dw Instruction_Robot_FacingRight_MoveForward_HandleHittingWall 
    dw $0005 
    dw Spritemap_Robot_11 
    dw Instruction_Robot_FacingRight_MoveForward_HandleHittingWall 
    dw Instruction_Robot_PlaySFXIfOnScreen 
    dw $0005 
    dw Spritemap_Robot_12 
    dw $0005 
    dw Spritemap_Robot_13 
    dw $0005 
    dw Spritemap_Robot_14 
    dw $0005 
    dw Spritemap_Robot_15 
    dw $0005 
    dw Spritemap_Robot_16 
    dw Instruction_Robot_FacingRight_MoveForward_HandleHittingWall 
    dw Instruction_Robot_PlaySFXIfOnScreen 
    dw $0005 
    dw Spritemap_Robot_17 
    dw Instruction_Robot_FacingRight_MoveForward_HandleHittingWall 
    dw $0005 
    dw Spritemap_Robot_C 
    dw $0005 
    dw Spritemap_Robot_D 
    dw $0005 
    dw Spritemap_Robot_E 
    dw $0005 
    dw Spritemap_Robot_F 
    dw $0005 
    dw Spritemap_Robot_10 
    dw Instruction_Robot_PlaySFXIfOnScreen 
    dw Instruction_Robot_FacingRight_MoveForward_HandleHittingWall 
    dw $0005 
    dw Spritemap_Robot_11 
    dw Instruction_Robot_FacingRight_MoveForward_HandleHittingWall 
    dw $0005 
    dw Spritemap_Robot_12 
    dw $0005 
    dw Spritemap_Robot_13 
    dw $0005 
    dw Spritemap_Robot_14 
    dw $0005 
    dw Spritemap_Robot_15 
    dw $0005 
    dw Spritemap_Robot_16 
    dw Instruction_Robot_FacingRight_MoveForward_HandleHittingWall 
    dw Instruction_Robot_PlaySFXIfOnScreen 
    dw $0005 
    dw Spritemap_Robot_17 
    dw Instruction_Robot_FacingRight_MoveForward_HandleHittingWall 
    dw Instruction_Robot_SetInstListTo_FacingRight_WalkingForwards 

InstList_Robot_FacingRight_ShotLaserDownRight:
    dw $0005 
    dw Spritemap_Robot_C 
    dw $0002 
    dw Spritemap_Robot_17 
    dw Instruction_Common_GotoY 
    dw InstList_Robot_FacingRight_LaserShotRecoil 

InstList_Robot_FacingRight_ShotLaserRight:
    dw $0005 
    dw Spritemap_Robot_D 
    dw $0002 
    dw Spritemap_Robot_C 
    dw Instruction_Robot_PlaySFXIfOnScreen 
    dw Instruction_Robot_FacingRight_MoveBackward_HandleWallOrFall 
    dw $000A 
    dw Spritemap_Robot_17 
    dw Instruction_Common_GotoY 
    dw InstList_Robot_FacingRight_LaserShotRecoil 

InstList_Robot_FacingRight_ShotLaserUpRight:
    dw $0005 
    dw Spritemap_Robot_F 
    dw $0002 
    dw Spritemap_Robot_E 
    dw $0002 
    dw Spritemap_Robot_D 
    dw $0004 
    dw Spritemap_Robot_C 
    dw Instruction_Robot_PlaySFXIfOnScreen 
    dw Instruction_Robot_FacingRight_MoveBackward_HandleWallOrFall 
    dw $0004 
    dw Spritemap_Robot_17 

InstList_Robot_FacingRight_LaserShotRecoil:
    dw Instruction_Robot_FacingRight_MoveBackward_HandleWallOrFall 
    dw $0010 
    dw Spritemap_Robot_16 
    dw $0005 
    dw Spritemap_Robot_15 
    dw $0005 
    dw Spritemap_Robot_14 
    dw $0005 
    dw Spritemap_Robot_13 
    dw $0005 
    dw Spritemap_Robot_12 
    dw Instruction_Robot_PlaySFXIfOnScreen 
    dw Instruction_Robot_FacingRight_MoveBackward_HandleWallOrFall 
    dw $000A 
    dw Spritemap_Robot_11 
    dw Instruction_Robot_FacingRight_MoveBackward_HandleWallOrFall 
    dw $000A 
    dw Spritemap_Robot_10 
    dw $000A 
    dw Spritemap_Robot_F 
    dw $0060 
    dw Spritemap_Robot_E 
    dw Instruction_Common_GotoY 
    dw InstList_Robot_FacingRight_WalkingForwards_0 

InstList_Robot_ApproachingAFallToTheLeft:
    dw $0080 
    dw Spritemap_Robot_0 
    dw $000A 
    dw Spritemap_Robot_1 
    dw $000A 
    dw Spritemap_Robot_2 
    dw Instruction_Robot_DecrementLaserCooldown 
    dw Instruction_Common_GotoY 
    dw InstList_Robot_FacingRight_WalkingForwards_0 

InitAI_Robot:
    LDX.W $079F 
    LDA.L $7ED828,X : BIT.W #$0001 
    BEQ InitAI_RobotNoPower 
    LDX.W $0E54 
    SEP #$20 
    LDA.B #EnemyGraphicsDrawnHook_Robot_PeriodicallyCyclePalettes>>16 : STA.W $178E 
    REP #$20 
    LDA.W #EnemyGraphicsDrawnHook_Robot_PeriodicallyCyclePalettes : STA.W $178C 
    LDA.W $0F86,X : ORA.W #$A000 : STA.W $0F86,X 
    LDA.W #$0004 : STA.W $0F94,X 
    STZ.W $0F90,X 
    LDA.W #InstList_Robot_Initial : STA.W $0F92,X 
    LDA.W #$FE00 : STA.W $0FA8,X 
    LDA.W #$0001 : STA.L $7ED654 
    LDA.W #$0000 : STA.L $7ED656 
    STA.W $0FAA,X 
    LDA.W $0F96,X : STA.L $7ED652 
    RTL 


InitAI_RobotNoPower:
    LDX.W $0E54 
    LDA.W $0FB4,X : CMP.W #$0000 : BMI .zeroParam1 
    CMP.W #$0004 : BMI .valid 

.zeroParam1:
    LDA.W #$0000 

.valid:
    STA.W $0FB4,X 
    ASL A 
    TAY 
    LDA.W .pointers,Y : STA.W $0F92,X 
    LDA.W $0F86,X : ORA.W #$8000 : STA.W $0F86,X 
    LDA.W #$0001 : STA.W $0F94,X 
    STZ.W $0F90,X 
    LDA.W #$0000 : STA.L $7ED654 
    LDA.W #$0000 : STA.W $0FB0,X 
    LDA.W #$0001 : STA.W $0FB2,X 
    LDA.L $7ED652 : AND.W #$FF00 
    XBA 
    ASL #4
    TAX 
    LDA.W #$000A : STA.L $7EC112,X 
    STA.L $7EC114,X 
    STA.L $7EC116,X 
    STA.L $7EC118,X 
    RTL 


.pointers:
    dw InstList_RobotNoPower_Neutral 
    dw InstList_RobotNoPower_LeaningLeft 
    dw InstList_RobotNoPower_LeaningRIght 

MainAI_Robot:
    LDX.W $0E54 
    LDA.W $0FB0,X : STA.B $12 
    LDA.W $0FB2,X : STA.B $14 
    JSL.L MoveEnemyDownBy_14_12 
    BCS RTL_A8CC66 
    LDX.W $0E54 
    LDA.W $0F94,X 
    INC A 
    STA.W $0F94,X 
    LDA.W $0FB0,X : CLC : ADC.W #$8000 : STA.W $0FB0,X 
    LDA.W $0FB2,X : ADC.W #$0000 : STA.W $0FB2,X ; fallthrough to MainAI_RobotNoPower

RTL_A8CC66:
    RTL 


EnemyGraphicsDrawnHook_Robot_PeriodicallyCyclePalettes:
    LDA.W $0797 : BNE .return 
    LDA.L $7ED654 : BEQ .return 
    DEC A 
    STA.L $7ED654 
    BNE .return 
    PHX 
    LDA.L $7ED652 : AND.W #$FF00 
    XBA 
    ASL #4
    TAX 
    LDA.L $7ED656 
    TAY 

.again:
    LDA.W .paletteColor9,Y : BMI .zero 
    STA.L $7EC112,X 
    LDA.W .paletteColorA,Y : STA.L $7EC114,X 
    LDA.W .paletteColorB,Y : STA.L $7EC116,X 
    LDA.W .paletteColorC,Y : STA.L $7EC118,X 
    LDA.W .timer,Y : STA.L $7ED654 
    TYA 
    CLC : ADC.W #$000A : STA.L $7ED656 
    PLX 

.return:
    RTL 


.zero:
    LDY.W #$0000 
    BRA .again 


.paletteColor9:
    dw $001F 

.paletteColorA:
    dw $0018 

.paletteColorB:
    dw $000F 

.paletteColorC:
    dw $0008 

.timer:
    dw $0040,$0018,$000F,$0008,$001F,$0010,$000F,$0008 
    dw $001F,$0018,$0010,$0008,$001F,$0018,$000F,$0040 
    dw $000F,$0008,$001F,$0018,$0010,$0018,$000F,$0008 
    dw $001F,$0010,$FFFF 

DecrementRobotLaserCooldown:
    LDA.W $0FAA,X : BEQ .return 
    DEC A 
    STA.W $0FAA,X 

.return:
    RTS 


Instruction_Robot_FacingLeft_MoveForward_HandleWallOrFall:
    PHX : PHY 
    LDX.W $0E54 
    JSR.W DecrementRobotLaserCooldown 
    LDA.W #$FE00 : STA.W $0FA8,X 
    LDA.W #$0000 : STA.B $12 
    LDA.W #$FFFC : STA.B $14 
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes 
    BCC .notCollidedWithWall 
    LDA.W $0FAA,X : CLC : ADC.W #$0008 : STA.W $0FAA,X 
    PLY 
    LDY.W #InstList_Robot_FacingLeft_HitWallMovingForwards 
    PLX 
    RTL 


.notCollidedWithWall:
    JSL.L CheckIfEnemyIsTouchingSamusFromBelow 
    AND.W #$FFFF 
    BEQ .notTouchingSamusFromBelow 
    LDA.W #$0000 : STA.W $0B56 
    LDA.W #$FFFC : STA.W $0B58 

.notTouchingSamusFromBelow:
    LDA.W $0F7E,X : STA.W $0FAE,X 
    LDA.W $0F7A,X : STA.W $0FAC,X 
    SEC : SBC.W $0F82,X : SEC : SBC.W $0F82,X : STA.W $0F7A,X 
    STZ.B $12 
    LDA.W #$0001 : STA.B $14 
    JSL.L MoveEnemyDownBy_14_12 
    BCS .collidedWithBlock 
    LDA.W $0FAA,X : CLC : ADC.W #$0008 : STA.W $0FAA,X 
    LDA.W $0FAC,X : STA.W $0F7A,X 
    LDA.W $0FAE,X : STA.W $0F7E,X 
    PLY 
    LDX.W $0E54 
    LDA.W #$0200 : STA.W $0FA8,X 
    LDY.W #InstList_Robot_ApproachingAFallToTheLeft 
    PLX 
    RTL 


.collidedWithBlock:
    LDA.W $0FAC,X : STA.W $0F7A,X 
    LDA.W $0FAE,X : STA.W $0F7E,X 
    PLY : PLX 
    RTL 


Instruction_Robot_FacingLeft_MoveForward_HandleHittingWall:
    PHX : PHY 
    LDX.W $0E54 
    JSR.W DecrementRobotLaserCooldown 
    LDA.W #$FE00 : STA.W $0FA8,X 
    LDA.W #$0000 : STA.B $12 
    LDA.W #$FFFC : STA.B $14 
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes 
    BCC .notCollidedWtihWall 
    LDA.W $0FAA,X : CLC : ADC.W #$0008 : STA.W $0FAA,X 
    PLY 
    LDY.W #InstList_Robot_FacingLeft_HitWallMovingForwards 
    PLX 
    RTL 


.notCollidedWtihWall:
    JSL.L CheckIfEnemyIsTouchingSamusFromBelow 
    AND.W #$FFFF 
    BEQ .return 
    LDA.W #$0000 : STA.W $0B56 
    LDA.W #$FFFC : STA.W $0B58 

.return:
    PLY : PLX 
    RTL 


Instruction_Robot_FacingLeft_MoveBackward_HandleWallOrFall:
    PHX : PHY 
    LDX.W $0E54 
    JSR.W DecrementRobotLaserCooldown 
    LDA.W #$FE00 : STA.W $0FA8,X 
    LDA.W #$0000 : STA.B $12 
    LDA.W #$0004 : STA.B $14 
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes 
    BCC .notCollidedWithWall 
    LDA.W $0FAA,X : CLC : ADC.W #$0008 : STA.W $0FAA,X 
    PLY 
    LDY.W #InstList_Robot_FacingLeft_WalkingForwards_0 
    PLX 
    RTL 


.notCollidedWithWall:
    JSL.L CheckIfEnemyIsTouchingSamusFromBelow 
    AND.W #$FFFF 
    BEQ .notTouchingSamusFromBelow 
    LDA.W #$0000 : STA.W $0B56 
    LDA.W #$0004 : STA.W $0B58 

.notTouchingSamusFromBelow:
    LDA.W $0F7E,X : STA.W $0FAE,X 
    LDA.W $0F7A,X : STA.W $0FAC,X 
    CLC : ADC.W $0F82,X : CLC : ADC.W $0F82,X : STA.W $0F7A,X 
    STZ.B $12 
    LDA.W #$0001 : STA.B $14 
    JSL.L MoveEnemyDownBy_14_12 
    BCS .collidedWithBlock 
    LDA.W $0FAA,X : CLC : ADC.W #$0008 : STA.W $0FAA,X 
    LDA.W $0FAC,X : STA.W $0F7A,X 
    LDA.W $0FAE,X : STA.W $0F7E,X 
    PLY 
    LDX.W $0E54 
    LDA.W #$FE00 : STA.W $0FA8,X 
    LDY.W #InstList_Robot_ApproachingAFallToTheRight 
    PLX 
    RTL 


.collidedWithBlock:
    LDA.W $0FAC,X : STA.W $0F7A,X 
    LDA.W $0FAE,X : STA.W $0F7E,X 
    PLY : PLX 
    RTL 


Instruction_Robot_FacingLeft_MoveBackward_HandleHittingWall:
    PHX : PHY 
    LDX.W $0E54 
    JSR.W DecrementRobotLaserCooldown 
    LDA.W #$FE00 : STA.W $0FA8,X 
    LDA.W #$0000 : STA.B $12 
    LDA.W #$0004 : STA.B $14 
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes 
    BCC .notCollidedWithWall 
    LDA.W $0FAA,X : CLC : ADC.W #$0008 : STA.W $0FAA,X 
    PLY 
    LDY.W #InstList_Robot_FacingLeft_WalkingForwards_0 
    PLX 
    RTL 


.notCollidedWithWall:
    JSL.L CheckIfEnemyIsTouchingSamusFromBelow 
    AND.W #$FFFF 
    BEQ .return 
    LDA.W #$0000 : STA.W $0B56 
    LDA.W #$0004 : STA.W $0B58 

.return:
    PLY : PLX 
    RTL 


Instruction_Robot_SetInstListTo_FacingRight_WalkingForwards:
    LDY.W #InstList_Robot_FacingRight_WalkingForwards_0 
    RTL 


Instruction_Robot_FacingRight_MoveForward_HandleWallOrFall:
    PHX : PHY 
    LDX.W $0E54 
    JSR.W DecrementRobotLaserCooldown 
    LDA.W #$0200 : STA.W $0FA8,X 
    LDA.W #$0000 : STA.B $12 
    LDA.W #$0004 : STA.B $14 
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes 
    BCC .notCollidedWithWall 
    LDA.W $0FAA,X : CLC : ADC.W #$0008 : STA.W $0FAA,X 
    PLY 
    LDY.W #InstList_Robot_FacingRight_HitWallMovingForwards 
    PLX 
    RTL 


.notCollidedWithWall:
    JSL.L CheckIfEnemyIsTouchingSamusFromBelow 
    AND.W #$FFFF 
    BEQ .notTouchingSamusFromBelow 
    LDA.W #$0000 : STA.W $0B56 
    LDA.W #$0004 : STA.W $0B58 

.notTouchingSamusFromBelow:
    LDA.W $0F7E,X : STA.W $0FAE,X 
    LDA.W $0F7A,X : STA.W $0FAC,X 
    CLC : ADC.W $0F82,X : CLC : ADC.W $0F82,X : STA.W $0F7A,X 
    STZ.B $12 
    LDA.W #$0001 : STA.B $14 
    JSL.L MoveEnemyDownBy_14_12 
    BCS .collidedWithBlock 
    LDA.W $0FAA,X : CLC : ADC.W #$0008 : STA.W $0FAA,X 
    LDA.W $0FAC,X : STA.W $0F7A,X 
    LDA.W $0FAE,X : STA.W $0F7E,X 
    PLY 
    LDX.W $0E54 
    LDA.W #$FE00 : STA.W $0FA8,X 
    LDY.W #InstList_Robot_ApproachingAFallToTheRight 
    PLX 
    RTL 


.collidedWithBlock:
    LDA.W $0FAC,X : STA.W $0F7A,X 
    LDA.W $0FAE,X : STA.W $0F7E,X 
    PLY : PLX 
    RTL 


Instruction_Robot_FacingRight_MoveForward_HandleHittingWall:
    PHX : PHY 
    LDX.W $0E54 
    JSR.W DecrementRobotLaserCooldown 
    LDA.W #$0200 : STA.W $0FA8,X 
    LDA.W #$0000 : STA.B $12 
    LDA.W #$0004 : STA.B $14 
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes 
    BCC .notCollidedWithWall 
    LDA.W $0FAA,X : CLC : ADC.W #$0008 : STA.W $0FAA,X 
    PLY 
    LDY.W #InstList_Robot_FacingRight_HitWallMovingForwards 
    PLX 
    RTL 


.notCollidedWithWall:
    JSL.L CheckIfEnemyIsTouchingSamusFromBelow 
    AND.W #$FFFF 
    BEQ .return 
    LDA.W #$0000 : STA.W $0B56 
    LDA.W #$0004 : STA.W $0B58 

.return:
    PLY : PLX 
    RTL 


Instruction_Robot_FacingRight_MoveBackward_HandleWallOrFall:
    PHX : PHY 
    LDX.W $0E54 
    JSR.W DecrementRobotLaserCooldown 
    LDA.W #$0200 : STA.W $0FA8,X 
    LDA.W #$0000 : STA.B $12 
    LDA.W #$FFFC : STA.B $14 
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes 
    BCC .notCollidedWithWall 
    LDA.W $0FAA,X : CLC : ADC.W #$0008 : STA.W $0FAA,X 
    PLY 
    LDY.W #InstList_Robot_FacingLeft_WalkingForwards_0 
    PLX 
    RTL 


.notCollidedWithWall:
    JSL.L CheckIfEnemyIsTouchingSamusFromBelow 
    AND.W #$FFFF 
    BEQ .notTouchingSamusFromBelow 
    LDA.W #$0000 : STA.W $0B56 
    LDA.W #$FFFC : STA.W $0B58 

.notTouchingSamusFromBelow:
    LDA.W $0F7E,X : STA.W $0FAE,X 
    LDA.W $0F7A,X : STA.W $0FAC,X 
    SEC : SBC.W $0F82,X : SEC : SBC.W $0F82,X : STA.W $0F7A,X 
    STZ.B $12 
    LDA.W #$0001 : STA.B $14 
    JSL.L MoveEnemyDownBy_14_12 
    BCS .collidedWithBlock 
    LDA.W $0FAA,X : CLC : ADC.W #$0008 : STA.W $0FAA,X 
    LDA.W $0FAE,X : STA.W $0F7E,X 
    LDA.W $0FAC,X : STA.W $0F7A,X 
    PLY 
    LDX.W $0E54 
    LDA.W #$0200 : STA.W $0FA8,X 
    LDY.W #InstList_Robot_ApproachingAFallToTheLeft 
    PLX 
    RTL 


.collidedWithBlock:
    LDA.W $0FAE,X : STA.W $0F7E,X 
    LDA.W $0FAC,X : STA.W $0F7A,X 
    PLY : PLX 
    RTL 


Instruction_Robot_FacingRight_MoveBackward_HandleHittingWall:
    PHX : PHY 
    LDX.W $0E54 
    JSR.W DecrementRobotLaserCooldown 
    LDA.W #$0200 : STA.W $0FA8,X 
    LDA.W #$0000 : STA.B $12 
    LDA.W #$FFFC : STA.B $14 
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes 
    BCC .notCollidedWithWall 
    LDA.W $0FAA,X : CLC : ADC.W #$0008 : STA.W $0FAA,X 
    PLY 
    LDY.W #InstList_Robot_FacingLeft_WalkingForwards_0 
    PLX 
    RTL 


.notCollidedWithWall:
    JSL.L CheckIfEnemyIsTouchingSamusFromBelow 
    AND.W #$FFFF 
    BEQ .return 
    LDA.W #$0000 : STA.W $0B56 
    LDA.W #$FFFC : STA.W $0B58 

.return:
    PLY : PLX 
    RTL 


Instruction_Robot_PlaySFXIfOnScreen:
    PHX : PHY 
    LDX.W $0E54 
    LDA.W $0911 : CMP.W $0F7A,X : BPL .return 
    CLC : ADC.W #$0100 : CMP.W $0F7A,X : BMI .return 
    LDA.W $0915 : CMP.W $0F7E,X : BPL .return 
    CLC : ADC.W #$00E0 : CMP.W $0F7E,X : BMI .return 
    LDA.W #$0068 : JSL.L QueueSound_Lib2_Max6 

.return:
    PLY : PLX 
    RTL 


Instruction_Robot_Goto_FacingLeft_WalkingForwards:
    LDY.W #InstList_Robot_FacingLeft_WalkingForwards_0 
    RTL 


Instruction_Robot_TryShootingLaserUpRight:
    LDA.W #InstList_Robot_FacingRight_ShotLaserUpRight : STA.B $32 
    LDA.W #EnemyProjectile_RobotLaser_UpRight : STA.B $30 
    BRA HandleFiringLaser_Upwards 


Instruction_Robot_TryShootingLaserUpLeft:
    LDA.W #InstList_Robot_FacingLeft_ShotLaserUpLeft : STA.B $32 
    LDA.W #EnemyProjectile_RobotLaser_UpLeft : STA.B $30 ; fallthrough to HandleFiringLaser_Upwards

HandleFiringLaser_Upwards:
    LDA.W $0FAA,X : BNE .timerNotExpired 
    LDA.W $05E5 : AND.W #$001F 
    CLC : ADC.W #$0010 : STA.W $0FAA,X 
    PHX 
    LDY.B $30 
    LDX.W $0E54 
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    PLX 
    LDY.B $32 
    RTL 


.timerNotExpired:
    JSR.W DecrementRobotLaserCooldown 
    RTL 


Instruction_Robot_TryShootingLaserRight:
    LDA.W #InstList_Robot_FacingRight_ShotLaserRight : STA.B $32 
    BRA HandleFiringLaser_Horizontal 


Instruction_Robot_TryShootingLaserLeft:
    LDA.W #InstList_Robot_FacingLeft_ShotLaserLeft : STA.B $32 

HandleFiringLaser_Horizontal:
    LDA.W $0FAA,X : BNE .timerNotExpired 
    LDA.W $05E5 : AND.W #$001F 
    CLC : ADC.W #$0010 : STA.W $0FAA,X 
    PHX 
    LDY.W #EnemyProjectile_RobotLaser_Horizontal 
    LDX.W $0E54 
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    PLX 
    LDY.B $32 
    RTL 


.timerNotExpired:
    JSR.W DecrementRobotLaserCooldown 
    RTL 


Instruction_Robot_TryShootingLaserDownRight:
    LDA.W #EnemyProjectile_RobotLaser_DownRight : STA.B $30 
    LDA.W #InstList_Robot_FacingRight_ShotLaserDownRight : STA.B $32 
    BRA HandleFiringLaser_Downwards 


Instruction_Robot_TryShootingLaserDownLeft:
    LDA.W #EnemyProjectile_RobotLaser_DownLeft : STA.B $30 
    LDA.W #InstList_Robot_FacingLeft_ShotLaserDownLeft : STA.B $32 

HandleFiringLaser_Downwards:
    LDA.W $0FAA,X : BNE .timerNotExpired 
    LDA.W $05E5 : AND.W #$001F 
    CLC : ADC.W #$0010 : STA.W $0FAA,X 
    PHX 
    LDY.B $30 
    LDX.W $0E54 
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    LDY.B $32 
    PLX 
    RTL 


.timerNotExpired:
    JSR.W DecrementRobotLaserCooldown 
    RTL 


Instruction_Robot_DecrementLaserCooldown:
    PHX 
    LDX.W $0E54 
    JSR.W DecrementRobotLaserCooldown 
    PLX 
    RTL 


EnemyTouch_Robot:
    LDX.W $0E54 
    LDA.W $0F7A,X : CMP.W $0AF6 : BMI .rightOfSamus 
    LDA.W #$FFFC : STA.W $0B58 
    RTL 


.rightOfSamus:
    LDA.W #$0004 : STA.W $0B58 
    RTL 


EnemyShot_RobotNoPower:
    JSL.L NormalEnemyShotAI 
    RTL 


EnemyShot_Robot:
    REP #$30 
    PHX : PHY 
    LDX.W $079F 
    LDA.L $7ED828,X : BIT.W #$0001 
    BEQ .return 
    LDX.W $0E54 
    JSL.L NormalEnemyShotAI 
    LDX.W $0E54 
    LDA.W $0F8C,X : BEQ .return 
    LDA.W $0FA8,X : BMI .facingLeft 
    LDA.W $0AF6 : CMP.W $0F7A,X : BMI .facingRight_behind 
    LDA.W #InstList_Robot_FacingRight_Shot_SamusIsAhead : BRA .merge 


.facingRight_behind:
    LDA.W #InstList_Robot_FacingRight_Shot_SamusIsBehind : BRA .merge 


.return:
    PLY : PLX 
    RTL 


.facingLeft:
    LDA.W $0AF6 : CMP.W $0F7A,X : BPL .facingLeft_behind 
    LDA.W #InstList_Robot_FacingLeft_Shot_SamusIsAhead 

.merge:
    STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    LDA.W $0FAA,X : CLC : ADC.W #$0040 : STA.W $0FAA,X 
    PLY : PLX 
    RTL 


.facingLeft_behind:
    LDA.W #InstList_Robot_FacingLeft_Shot_SamusIsBehind : BRA .merge 


Spritemap_Robot_0:
    dw $000C,$8000 
    db $01 
    dw $212E,$81F0 
    db $01 
    dw $212C,$0008 
    db $17 
    dw $2149,$0000 
    db $17 
    dw $2148,$8000 
    db $07 
    dw $210C,$0000 
    db $19 
    dw $214B,$01F8 
    db $19 
    dw $214A,$81F8 
    db $09 
    dw $210E,$8000 
    db $F1 
    dw $2122,$81F0 
    db $F1 
    dw $2120,$8000 
    db $E1 
    dw $2102,$81F0 
    db $E1 
    dw $2100 

Spritemap_Robot_1:
    dw $000C,$8001 
    db $01 
    dw $2146,$81F1 
    db $01 
    dw $2144,$0003 
    db $18 
    dw $2149,$01FB 
    db $18 
    dw $2148,$81FB 
    db $08 
    dw $210C,$0000 
    db $19 
    dw $214B,$01F8 
    db $19 
    dw $214A,$81F8 
    db $09 
    dw $210E,$8000 
    db $F1 
    dw $2126,$81F0 
    db $F1 
    dw $2124,$81FF 
    db $E1 
    dw $2106,$81EF 
    db $E1 
    dw $2104 

Spritemap_Robot_2:
    dw $000C,$8000 
    db $01 
    dw $2146,$81F0 
    db $01 
    dw $2144,$01FF 
    db $19 
    dw $2149,$01F7 
    db $19 
    dw $2148,$81F7 
    db $09 
    dw $210C,$0001 
    db $19 
    dw $214B,$01F9 
    db $19 
    dw $214A,$81F9 
    db $09 
    dw $210E,$8000 
    db $F1 
    dw $2126,$81F0 
    db $F1 
    dw $2124,$8000 
    db $E1 
    dw $2106,$81F0 
    db $E1 
    dw $2104 

Spritemap_Robot_3:
    dw $000C,$81FF 
    db $01 
    dw $2146,$81EF 
    db $01 
    dw $2144,$01FC 
    db $18 
    dw $2149,$01F4 
    db $18 
    dw $2148,$81F4 
    db $08 
    dw $210C,$0000 
    db $19 
    dw $214B,$01F8 
    db $19 
    dw $214A,$81F8 
    db $09 
    dw $210E,$8000 
    db $F1 
    dw $2126,$81F0 
    db $F1 
    dw $2124,$8001 
    db $E1 
    dw $2106,$81F1 
    db $E1 
    dw $2104 

Spritemap_Robot_4:
    dw $000C,$8000 
    db $01 
    dw $2142,$81F0 
    db $01 
    dw $2140,$01F7 
    db $16 
    dw $2149,$01EF 
    db $16 
    dw $2148,$81EF 
    db $06 
    dw $210C,$0001 
    db $19 
    dw $214B,$01F9 
    db $19 
    dw $214A,$81F9 
    db $09 
    dw $210E,$8000 
    db $F1 
    dw $212A,$81F0 
    db $F1 
    dw $2128,$8000 
    db $E1 
    dw $210A,$81F0 
    db $E1 
    dw $2108 

Spritemap_Robot_5:
    dw $000C,$8000 
    db $01 
    dw $2146,$81F0 
    db $01 
    dw $2144,$01FC 
    db $17 
    dw $2149,$01F4 
    db $17 
    dw $2148,$81F4 
    db $07 
    dw $210C,$0004 
    db $19 
    dw $214B,$01FC 
    db $19 
    dw $214A,$81FC 
    db $09 
    dw $210E,$8000 
    db $F1 
    dw $2126,$81F0 
    db $F1 
    dw $2124,$8000 
    db $E1 
    dw $2106,$81F0 
    db $E1 
    dw $2104 

Spritemap_Robot_6:
    dw $000C,$8000 
    db $01 
    dw $212E,$81F0 
    db $01 
    dw $212C,$0000 
    db $19 
    dw $2149,$01F8 
    db $19 
    dw $2148,$81F8 
    db $09 
    dw $210C,$0008 
    db $17 
    dw $214B,$0000 
    db $17 
    dw $214A,$8000 
    db $07 
    dw $210E,$8000 
    db $F1 
    dw $2122,$81F0 
    db $F1 
    dw $2120,$8000 
    db $E1 
    dw $2102,$81F0 
    db $E1 
    dw $2100 

Spritemap_Robot_7:
    dw $000C,$8001 
    db $01 
    dw $2146,$81F1 
    db $01 
    dw $2144,$0000 
    db $19 
    dw $2149,$01F8 
    db $19 
    dw $2148,$81F8 
    db $09 
    dw $210C,$0003 
    db $18 
    dw $214B,$01FB 
    db $18 
    dw $214A,$81FB 
    db $08 
    dw $210E,$8000 
    db $F1 
    dw $2126,$81F0 
    db $F1 
    dw $2124,$81FF 
    db $E1 
    dw $2106,$81EF 
    db $E1 
    dw $2104 

Spritemap_Robot_8:
    dw $000C,$8000 
    db $01 
    dw $2146,$81F0 
    db $01 
    dw $2144,$01F8 
    db $19 
    dw $2148,$0000 
    db $19 
    dw $2149,$81F8 
    db $09 
    dw $210C,$01FE 
    db $19 
    dw $214B,$01F6 
    db $19 
    dw $214A,$81F6 
    db $09 
    dw $210E,$8000 
    db $F1 
    dw $2126,$81F0 
    db $F1 
    dw $2124,$8000 
    db $E1 
    dw $2106,$81F0 
    db $E1 
    dw $2104 

Spritemap_Robot_9:
    dw $000C,$81FF 
    db $01 
    dw $2146,$81EF 
    db $01 
    dw $2144,$0000 
    db $19 
    dw $2149,$01F8 
    db $19 
    dw $2148,$81F8 
    db $09 
    dw $210C,$01FC 
    db $18 
    dw $214B,$01F4 
    db $18 
    dw $214A,$81F4 
    db $08 
    dw $210E,$8000 
    db $F1 
    dw $2126,$81F0 
    db $F1 
    dw $2124,$8001 
    db $E1 
    dw $2106,$81F1 
    db $E1 
    dw $2104 

Spritemap_Robot_A:
    dw $000C,$8000 
    db $01 
    dw $2142,$81F0 
    db $01 
    dw $2140,$0001 
    db $19 
    dw $2149,$01F9 
    db $19 
    dw $2148,$81F9 
    db $09 
    dw $210C,$01F7 
    db $16 
    dw $214B,$01EF 
    db $16 
    dw $214A,$81EF 
    db $06 
    dw $210E,$8000 
    db $F1 
    dw $212A,$81F0 
    db $F1 
    dw $2128,$8000 
    db $E1 
    dw $210A,$81F0 
    db $E1 
    dw $2108 

Spritemap_Robot_B:
    dw $000C,$8000 
    db $01 
    dw $2146,$81F0 
    db $01 
    dw $2144,$0004 
    db $19 
    dw $2149,$01FC 
    db $19 
    dw $2148,$81FC 
    db $09 
    dw $210C,$01FC 
    db $17 
    dw $214B,$01F4 
    db $17 
    dw $214A,$81F4 
    db $07 
    dw $210E,$8000 
    db $F1 
    dw $2126,$81F0 
    db $F1 
    dw $2124,$8000 
    db $E1 
    dw $2106,$81F0 
    db $E1 
    dw $2104 

Spritemap_Robot_C:
    dw $000C,$81F0 
    db $01 
    dw $612E,$8000 
    db $01 
    dw $612C,$01F0 
    db $17 
    dw $6149,$01F8 
    db $17 
    dw $6148,$81F0 
    db $07 
    dw $610C,$01F8 
    db $19 
    dw $614B,$0000 
    db $19 
    dw $614A,$81F8 
    db $09 
    dw $610E,$81F0 
    db $F1 
    dw $6122,$8000 
    db $F1 
    dw $6120,$81F0 
    db $E1 
    dw $6102,$8000 
    db $E1 
    dw $6100 

Spritemap_Robot_D:
    dw $000C,$81EF 
    db $01 
    dw $6146,$81FF 
    db $01 
    dw $6144,$01F5 
    db $18 
    dw $6149,$01FD 
    db $18 
    dw $6148,$81F5 
    db $08 
    dw $610C,$01F8 
    db $19 
    dw $614B,$0000 
    db $19 
    dw $614A,$81F8 
    db $09 
    dw $610E,$81F0 
    db $F1 
    dw $6126,$8000 
    db $F1 
    dw $6124,$81F1 
    db $E1 
    dw $6106,$8001 
    db $E1 
    dw $6104 

Spritemap_Robot_E:
    dw $000C,$81F0 
    db $01 
    dw $6146,$8000 
    db $01 
    dw $6144,$01F9 
    db $19 
    dw $6149,$0001 
    db $19 
    dw $6148,$81F9 
    db $09 
    dw $610C,$01F7 
    db $19 
    dw $614B,$01FF 
    db $19 
    dw $614A,$81F7 
    db $09 
    dw $610E,$81F0 
    db $F1 
    dw $6126,$8000 
    db $F1 
    dw $6124,$81F0 
    db $E1 
    dw $6106,$8000 
    db $E1 
    dw $6104 

Spritemap_Robot_F:
    dw $000C,$81F1 
    db $01 
    dw $6146,$8001 
    db $01 
    dw $6144,$01FC 
    db $18 
    dw $6149,$0004 
    db $18 
    dw $6148,$81FC 
    db $08 
    dw $610C,$01F8 
    db $19 
    dw $614B,$0000 
    db $19 
    dw $614A,$81F8 
    db $09 
    dw $610E,$81F0 
    db $F1 
    dw $6126,$8000 
    db $F1 
    dw $6124,$81EF 
    db $E1 
    dw $6106,$81FF 
    db $E1 
    dw $6104 

Spritemap_Robot_10:
    dw $000C,$81F0 
    db $01 
    dw $6142,$8000 
    db $01 
    dw $6140,$0001 
    db $16 
    dw $6149,$0009 
    db $16 
    dw $6148,$8001 
    db $06 
    dw $610C,$01F7 
    db $19 
    dw $614B,$01FF 
    db $19 
    dw $614A,$81F7 
    db $09 
    dw $610E,$81F0 
    db $F1 
    dw $612A,$8000 
    db $F1 
    dw $6128,$81F0 
    db $E1 
    dw $610A,$8000 
    db $E1 
    dw $6108 

Spritemap_Robot_11:
    dw $000C,$81F0 
    db $01 
    dw $6146,$8000 
    db $01 
    dw $6144,$01FC 
    db $17 
    dw $6149,$0004 
    db $17 
    dw $6148,$81FC 
    db $07 
    dw $610C,$01F4 
    db $19 
    dw $614B,$01FC 
    db $19 
    dw $614A,$81F4 
    db $09 
    dw $610E,$81F0 
    db $F1 
    dw $6126,$8000 
    db $F1 
    dw $6124,$81F0 
    db $E1 
    dw $6106,$8000 
    db $E1 
    dw $6104 

Spritemap_Robot_12:
    dw $000C,$81F0 
    db $01 
    dw $612E,$8000 
    db $01 
    dw $612C,$01F8 
    db $19 
    dw $6149,$0000 
    db $19 
    dw $6148,$81F8 
    db $09 
    dw $610C,$01F0 
    db $17 
    dw $614B,$01F8 
    db $17 
    dw $614A,$81F0 
    db $07 
    dw $610E,$81F0 
    db $F1 
    dw $6122,$8000 
    db $F1 
    dw $6120,$81F0 
    db $E1 
    dw $6102,$8000 
    db $E1 
    dw $6100 

Spritemap_Robot_13:
    dw $000C,$81EF 
    db $01 
    dw $6146,$81FF 
    db $01 
    dw $6144,$01F8 
    db $19 
    dw $6149,$0000 
    db $19 
    dw $6148,$81F8 
    db $09 
    dw $610C,$01F5 
    db $18 
    dw $614B,$01FD 
    db $18 
    dw $614A,$81F5 
    db $08 
    dw $610E,$81F0 
    db $F1 
    dw $6126,$8000 
    db $F1 
    dw $6124,$81F1 
    db $E1 
    dw $6106,$8001 
    db $E1 
    dw $6104 

Spritemap_Robot_14:
    dw $000C,$81F0 
    db $01 
    dw $6146,$8000 
    db $01 
    dw $6144,$0000 
    db $19 
    dw $6148,$01F8 
    db $19 
    dw $6149,$81F8 
    db $09 
    dw $610C,$01FA 
    db $19 
    dw $614B,$0002 
    db $19 
    dw $614A,$81FA 
    db $09 
    dw $610E,$81F0 
    db $F1 
    dw $6126,$8000 
    db $F1 
    dw $6124,$81F0 
    db $E1 
    dw $6106,$8000 
    db $E1 
    dw $6104 

Spritemap_Robot_15:
    dw $000C,$81F1 
    db $01 
    dw $6146,$8001 
    db $01 
    dw $6144,$01F8 
    db $19 
    dw $6149,$0000 
    db $19 
    dw $6148,$81F8 
    db $09 
    dw $610C,$01FC 
    db $18 
    dw $614B,$0004 
    db $18 
    dw $614A,$81FC 
    db $08 
    dw $610E,$81F0 
    db $F1 
    dw $6126,$8000 
    db $F1 
    dw $6124,$81EF 
    db $E1 
    dw $6106,$81FF 
    db $E1 
    dw $6104 

Spritemap_Robot_16:
    dw $000C,$81F0 
    db $01 
    dw $6142,$8000 
    db $01 
    dw $6140,$01F7 
    db $19 
    dw $6149,$01FF 
    db $19 
    dw $6148,$81F7 
    db $09 
    dw $610C,$0001 
    db $16 
    dw $614B,$0009 
    db $16 
    dw $614A,$8001 
    db $06 
    dw $610E,$81F0 
    db $F1 
    dw $612A,$8000 
    db $F1 
    dw $6128,$81F0 
    db $E1 
    dw $610A,$8000 
    db $E1 
    dw $6108 

Spritemap_Robot_17:
    dw $000C,$81F0 
    db $01 
    dw $6146,$8000 
    db $01 
    dw $6144,$01F4 
    db $19 
    dw $6149,$01FC 
    db $19 
    dw $6148,$81F4 
    db $09 
    dw $610C,$01FC 
    db $17 
    dw $614B,$0004 
    db $17 
    dw $614A,$81FC 
    db $07 
    dw $610E,$81F0 
    db $F1 
    dw $6126,$8000 
    db $F1 
    dw $6124,$81F0 
    db $E1 
    dw $6106,$8000 
    db $E1 
    dw $6104 

Spritemap_Robot_18:
    dw $0006,$8000 
    db $01 
    dw $212E,$81F0 
    db $01 
    dw $212C,$8000 
    db $F1 
    dw $2122,$81F0 
    db $F1 
    dw $2120,$8000 
    db $E1 
    dw $2102,$81F0 
    db $E1 
    dw $2100 

Spritemap_Robot_19:
    dw $0006,$8000 
    db $01 
    dw $2146,$81F0 
    db $01 
    dw $2144,$8000 
    db $F1 
    dw $2126,$81F0 
    db $F1 
    dw $2124,$8000 
    db $E1 
    dw $2106,$81F0 
    db $E1 
    dw $2104 

Spritemap_Robot_1A:
    dw $0006,$8000 
    db $01 
    dw $2142,$81F0 
    db $01 
    dw $2140,$8000 
    db $F1 
    dw $212A,$81F0 
    db $F1 
    dw $2128,$8000 
    db $E1 
    dw $210A,$81F0 
    db $E1 
    dw $2108 

Palette_Bull:
    dw $3800,$3F57,$2E4D,$00E2,$0060,$3AB0,$220B,$1166 
    dw $0924,$435A,$3694,$15AD,$0508,$03FF,$0237,$00D1 

InstList_Bull_Normal:
    dw $000A 
    dw Spritemap_Bull_0 
    dw $000A 
    dw Spritemap_Bull_1 
    dw $000A 
    dw Spritemap_Bull_0 
    dw $000A 
    dw Spritemap_Bull_2 
    dw Instruction_Common_GotoY 
    dw InstList_Bull_Normal 

InstList_Bull_Shot_0:
    dw Instruction_Common_TimerInY 
    dw $0005 

InstList_Bull_Shot_1:
    dw $0003 
    dw Spritemap_Bull_0 
    dw $0003 
    dw Spritemap_Bull_1 
    dw $0003 
    dw Spritemap_Bull_0 
    dw $0003 
    dw Spritemap_Bull_2 
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate 
    dw InstList_Bull_Shot_1 
    dw Instruction_Common_GotoY 
    dw InstList_Bull_Normal 

BullConstants_AngleToMove_upFacingRight:
    dw $00C0 

BullConstants_AngleToMove_upRight:
    dw $00E0 

BullConstants_AngleToMove_right:
    dw $0000 

BullConstants_AngleToMove_downRight:
    dw $0020 

BullConstants_AngleToMove_downFacingRight:
    dw $0040 

BullConstants_AngleToMove_downFacingLeft:
    dw $0040 

BullConstants_AngleToMove_downLeft:
    dw $0060 

BullConstants_AngleToMove_left:
    dw $0080 

BullConstants_AngleToMove_upLeft:
    dw $00A0 

BullConstants_AngleToMove_upFacingLeft:
    dw $00C0 

BullConstants_MaxSpeeds:
    dw $03FF,$04FF,$05FF,$06FF,$07FF,$08FF,$09FF,$0AFF 

BullAccelerationIntervalTable_accel:
    dw $0003 

BullAccelerationIntervalTable_decel:
    dw $0001,$0004,$0001,$0005,$0002,$0006,$0002,$0007 
    dw $0002,$0008,$0003,$0009,$0003,$000A,$0004,$000B 
    dw $0004,$000C,$0005,$000D,$0005,$000E,$0006,$000F 
    dw $0006 

InitAI_Bull:
    LDX.W $0E54 
    LDA.W #$0001 : STA.W $0F94,X 
    STZ.W $0F90,X 
    LDA.W #InstList_Bull_Normal : STA.W $0F92,X 
    LDA.W $0FB4,X 
    ASL #2
    TAY 
    LDA.W BullAccelerationIntervalTable_accel,Y : STA.L $7E780A,X 
    STA.W $0FB2,X 
    LDA.W BullAccelerationIntervalTable_decel,Y : STA.L $7E780C,X 
    LDA.W #$0010 : STA.W $0FB0,X 
    LDA.W #Function_Bull_MovementDelay : STA.W $0FA8,X 
    LDA.W $0FB6,X 
    ASL A 
    TAY 
    LDA.W BullConstants_MaxSpeeds,Y : STA.L $7E7800,X 
    RTL 


MainAI_Bull:
    LDX.W $0E54 
    LDA.L $7E780E,X 
    DEC A 
    STA.L $7E780E,X 
    BNE .function 
    LDA.W #$0001 : STA.L $7E780E,X 
    LDA.W #$0000 : STA.L $7E7806,X 

.function:
    JSR.W ($0FA8,X) 
    RTL 


Function_Bull_MovementDelay:
    LDX.W $0E54 
    DEC.W $0FB0,X 
    BNE .return 
    LDA.W #$0010 : STA.W $0FB0,X 
    LDA.W #Function_Bull_TargetSamus : STA.W $0FA8,X 

.return:
    RTS 


Function_Bull_TargetSamus:
    LDX.W $0E54 
    JSL.L CalculateAngleOfSamusFromEnemy 
    SEC : SBC.W #$0040 : AND.W #$00FF 
    STA.L $7E7802,X 
    STA.L $7E7804,X 
    LDA.W #Function_Bull_Accelerating : STA.W $0FA8,X 
    LDA.W #$0018 : STA.W $0FAC,X 
    RTS 


Function_Bull_Accelerating:
    LDX.W $0E54 
    LDA.W $0FAE,X : CMP.L $7E7800,X : BPL .maxSpeed 
    JSR.W AccelerateBull 

.maxSpeed:
    JSR.W BullXMovement 
    JSR.W BullYMovement 
    JSR.W TriggerBullDecelerationIfTooFarOffTarget 
    RTS 


Function_Bull_Decelerating:
    LDX.W $0E54 
    LDA.W $0FAE,X : BEQ .stopped 
    BMI .stopped 
    LDA.W $0FAA,X : BEQ .stopped 
    BPL .decelerate 

.stopped:
    LDA.W #Function_Bull_MovementDelay : STA.W $0FA8,X 
    LDA.W #$0000 : STA.W $0FAA,X 
    STA.W $0FAC,X 
    STA.W $0FAE,X 
    RTS 


.decelerate:
    JSR.W BullXMovement 
    JSR.W BullYMovement 
    JSR.W DecelerateBull 
    RTS 


TriggerBullDecelerationIfTooFarOffTarget:
    LDX.W $0E54 
    JSL.L CalculateAngleOfSamusFromEnemy 
    SEC : SBC.W #$0040 : AND.W #$00FF 
    STA.L $7E7802,X 
    SEC : SBC.L $7E7804,X : JSL.L Sign_Extend_A 
    JSL.L NegateA_A0B067 
    CMP.W #$0030 : BMI .return 
    LDA.W #Function_Bull_Decelerating : STA.W $0FA8,X 
    LDA.W #$0018 : STA.W $0FAC,X 

.return:
    RTS 


BullXMovement:
    LDX.W $0E54 
    STZ.B $1A 
    LDA.L $7E7804,X 
    PHX 
    CLC : ADC.W #$0040 : AND.W #$00FF 
    ASL A 
    TAX 
    LDA.L SineCosineTables_16bitSine,X : STA.B $12 
    PLX 
    LDA.B $12 : BPL .positive 
    INC.B $1A 

.positive:
    LDA.B $12 : JSL.L NegateA_A0B067 
    AND.W #$FF00 
    XBA 
    STA.B $16 
    LDA.W $0FAE,X : STA.B $18 
    JSR.W Math_24Bit_UnsignedMultiplication_A8DAB3 
    LDA.B $1A : BEQ .notLeft 
    JSR.W Negate_1E_1C_A8DAF6 

.notLeft:
    CLC 
    LDA.W $0F7C,X : ADC.B $1C : STA.W $0F7C,X 
    LDA.W $0F7A,X : ADC.B $1E : STA.W $0F7A,X 
    RTS 


BullYMovement:
    LDX.W $0E54 
    STZ.B $1A 
    LDA.L $7E7804,X 
    PHX 
    AND.W #$00FF 
    ASL A 
    TAX 
    LDA.L SineCosineTables_16bitSine,X : STA.B $12 
    PLX 
    LDA.B $12 : BPL .positive 
    INC.B $1A 

.positive:
    LDA.B $12 : JSL.L NegateA_A0B067 
    AND.W #$FF00 
    XBA 
    STA.B $16 
    LDA.W $0FAE,X : STA.B $18 
    JSR.W Math_24Bit_UnsignedMultiplication_A8DAB3 
    LDA.B $1A : BEQ .notUp 
    JSR.W Negate_1E_1C_A8DAF6 

.notUp:
    CLC 
    LDA.W $0F80,X : ADC.B $1C : STA.W $0F80,X 
    LDA.W $0F7E,X : ADC.B $1E : STA.W $0F7E,X 
    RTS 


AccelerateBull:
    DEC.W $0FB2,X 
    BNE .return 
    LDA.L $7E780A,X : STA.W $0FB2,X 
    LDA.W $0FAA,X : CLC : ADC.W $0FAC,X : STA.W $0FAA,X 
    LDA.W $0FAE,X : CLC : ADC.W $0FAA,X : STA.W $0FAE,X 

.return:
    RTS 


DecelerateBull:
    DEC.W $0FB2,X 
    BNE .return 
    LDA.L $7E780C,X : STA.W $0FB2,X 
    LDA.W $0FAA,X : SEC : SBC.W $0FAC,X : STA.W $0FAA,X 
    LDA.W $0FAE,X : SEC : SBC.W $0FAA,X : STA.W $0FAE,X 

.return:
    RTS 


Math_24Bit_UnsignedMultiplication_A8DAB3:
    PHP 
    SEP #$20 
    LDA.B $16 : STA.W $4202 
    LDA.B $18 : STA.W $4203 
    NOP #3
    REP #$20 
    LDA.W $4216 : STA.B $1C 
    SEP #$20 
    LDA.B $16 : STA.W $4202 
    LDA.B $19 : STA.W $4203 
    NOP #3
    REP #$20 
    LDA.W $4216 : AND.W #$FF00 
    XBA 
    STA.B $1E 
    LDA.W $4216 : AND.W #$00FF 
    XBA 
    CLC : ADC.B $1C : STA.B $1C 
    BCC .return 
    INC.B $1E 

.return:
    PLP 
    RTS 


Negate_1E_1C_A8DAF6:
    LDA.B $1C : BNE .nonZero 
    LDA.B $1E : BEQ .return 
    DEC.B $1C 
    BRA + 


.nonZero:
    LDA.B $1C ; >.<
    LDA.W #$0000 : SEC : SBC.B $1C : STA.B $1C 

  + LDA.B $1E : EOR.W #$FFFF : STA.B $1E 

.return:
    RTS 


EnemyShot_Bull:
    LDX.W $0E54 
    LDA.W $0F8C,X : STA.L $7E8800,X 
    JSL.L CommonA8_NormalEnemyShotAI 
    LDA.W $0F8C,X : CMP.L $7E8800,X : BEQ .noDamage 
    RTL 


.noDamage:
    LDA.L $7E7806,X : BNE .return 
    LDA.W #$0001 : STA.W $0F94,X 
    STZ.W $0F90,X 
    LDA.W #InstList_Bull_Shot_0 : STA.W $0F92,X 
    LDA.W $18A6 
    ASL A 
    TAY 
    LDA.W $0C04,Y : AND.W #$000F 
    ASL A 
    TAY 
    LDA.W BullConstants_AngleToMove_upFacingRight,Y : STA.L $7E7804,X 
    LDA.W #$0100 : STA.W $0FAA,X 
    LDA.W #$0600 : STA.W $0FAE,X 
    LDA.W #Function_Bull_Decelerating : STA.W $0FA8,X 
    LDA.W #$0030 : STA.L $7E780E,X 
    LDA.W #$0001 : STA.L $7E7806,X 

.return:
    RTL 


Spritemap_Bull_0:
    dw $0004,$81F8 
    db $00 
    dw $210A,$81F0 
    db $00 
    dw $2109,$81F8 
    db $F0 
    dw $2107,$81F0 
    db $F0 
    dw $2106 

Spritemap_Bull_1:
    dw $0004,$81F8 
    db $00 
    dw $210D,$81F0 
    db $00 
    dw $210C,$81F8 
    db $F0 
    dw $2104,$81F0 
    db $F0 
    dw $2103 

Spritemap_Bull_2:
    dw $0007,$0000 
    db $08 
    dw $211F,$0000 
    db $00 
    dw $210F,$01F8 
    db $08 
    dw $2123,$01F0 
    db $08 
    dw $2122,$81F0 
    db $F8 
    dw $2110,$81F8 
    db $F0 
    dw $2101,$81F0 
    db $F0 
    dw $2100 

Palette_Alcoon:
    dw $3800,$02FF,$01BF,$000F,$0008,$01BF,$011B,$00BA 
    dw $0011,$5A5C,$41B4,$290D,$1065,$03FF,$0237,$00D1 

InstList_Alcoon_FacingLeft_Walking_0:
    dw Instruction_Alcoon_MoveHorizontally_TurnIfWallCollision 

InstList_Alcoon_FacingLeft_Walking_1:
    dw $000A 
    dw Spritemap_Alcoon_FacingLeft_FrontFootForward 
    dw Instruction_Alcoon_MoveHorizontally_TurnIfWallCollision 
    dw $000A 
    dw Spritemap_Alcoon_FacingLeft_FeetTogether_FrontFootDown 
    dw Instruction_Alcoon_MoveHorizontally_TurnIfWallCollision 
    dw $000A 
    dw Spritemap_Alcoon_FacingLeft_FrontFootBack 
    dw Instruction_Alcoon_DecrementStepCounter_MoveHorizontally 
    dw $000A 
    dw Spritemap_Alcoon_FacingLeft_FeetTogether_BackFootForward 
    dw Instruction_Common_GotoY 
    dw InstList_Alcoon_FacingLeft_Walking_0 

InstList_Alcoon_FacingLeft_SpawnFireballs:
    dw $0014 
    dw Spritemap_Alcoon_FacingLeft_WingFullyExtended_BackFootFoward 
    dw $0009 
    dw Spritemap_Alcoon_FacingLeft_WingMovingForward_MouthEnlarging 
    dw $0010 
    dw Spritemap_Alcoon_FacingLeft_WingForward_AboutToSpit 
    dw $0003 
    dw Spritemap_Alcoon_FacingLeft_WingMovingForward_MouthEnlarging 
    dw Instruction_Alcoon_SpawnAlcoonFireballHorizontally 
    dw $000A 
    dw Spritemap_Alcoon_FacingLeft_WingExtended_MouthJustSpit 
    dw $000A 
    dw Spritemap_Alcoon_FacingLeft_WingFullyExtended_BackFootFoward 
    dw $0009 
    dw Spritemap_Alcoon_FacingLeft_WingMovingForward_MouthEnlarging 
    dw $0010 
    dw Spritemap_Alcoon_FacingLeft_WingForward_AboutToSpit 
    dw $0003 
    dw Spritemap_Alcoon_FacingLeft_WingMovingForward_MouthEnlarging 
    dw Instruction_Alcoon_SpawnAlcoonFireballUpward 
    dw $000A 
    dw Spritemap_Alcoon_FacingLeft_WingExtended_MouthJustSpit 
    dw $000A 
    dw Spritemap_Alcoon_FacingLeft_WingFullyExtended_BackFootFoward 
    dw $0009 
    dw Spritemap_Alcoon_FacingLeft_WingMovingForward_MouthEnlarging 
    dw $0010 
    dw Spritemap_Alcoon_FacingLeft_WingForward_AboutToSpit 
    dw $0003 
    dw Spritemap_Alcoon_FacingLeft_WingMovingForward_MouthEnlarging 
    dw Instruction_Alcoon_SpawnAlcoonFireballDownward 
    dw $0028 
    dw Spritemap_Alcoon_FacingLeft_WingExtended_MouthJustSpit 
    dw Instruction_Alcoon_StartWalking 
    dw $0001 
    dw Spritemap_Alcoon_FacingLeft_WingExtended_MouthJustSpit 

InstList_Alcoon_FacingLeft_Airborne_LookingUp:
    dw $7FFF 
    dw UNUSED_Spritemap_Alcoon_FacingLeft_LookingUp_A8E0BB 
    dw Instruction_Common_Sleep 

InstList_Alcoon_FacingLeft_Airborne_LookingForward:
    dw $7FFF 
    dw Spritemap_Alcoon_FacingLeft_FeetTogether_BackFootForward 
    dw Instruction_Common_Sleep 

InstList_Alcoon_FacingRight_Walking_0:
    dw Instruction_Alcoon_MoveHorizontally_TurnIfWallCollision 

InstList_Alcoon_FacingRight_Walking_1:
    dw $000A 
    dw Spritemap_Alcoon_FacingRight_FrontFootFoward 
    dw Instruction_Alcoon_MoveHorizontally_TurnIfWallCollision 
    dw $000A 
    dw Spritemap_Alcoon_FacingRight_FeetTogether_FrontFootBack 
    dw Instruction_Alcoon_MoveHorizontally_TurnIfWallCollision 
    dw $000A 
    dw Spritemap_Alcoon_FacingRight_FrontFootBack 
    dw Instruction_Alcoon_DecrementStepCounter_MoveHorizontally 
    dw $000A 
    dw Spritemap_Alcoon_FacingRight_FrontFootUp 
    dw Instruction_Common_GotoY 
    dw InstList_Alcoon_FacingRight_Walking_0 

InstList_Alcoon_FacingRight_SpawnFireballs:
    dw $0014 
    dw Spritemap_Alcoon_FaceRight_WingFullyExtended_BackFootForward 
    dw $0009 
    dw Spritemap_Alcoon_FaceRight_WingMovingForward_MouthEnlarging 
    dw $0010 
    dw Spritemap_Alcoon_FacingRight_WingForward_AboutToSpit 
    dw $0003 
    dw Spritemap_Alcoon_FaceRight_WingMovingForward_MouthEnlarging 
    dw Instruction_Alcoon_SpawnAlcoonFireballHorizontally 
    dw $000A 
    dw Spritemap_Alcoon_FacingRight_WingExtended_MouthJustSpit 
    dw $000A 
    dw Spritemap_Alcoon_FaceRight_WingFullyExtended_BackFootForward 
    dw $0009 
    dw Spritemap_Alcoon_FaceRight_WingMovingForward_MouthEnlarging 
    dw $0010 
    dw Spritemap_Alcoon_FacingRight_WingForward_AboutToSpit 
    dw $0003 
    dw Spritemap_Alcoon_FaceRight_WingMovingForward_MouthEnlarging 
    dw Instruction_Alcoon_SpawnAlcoonFireballUpward 
    dw $000A 
    dw Spritemap_Alcoon_FacingRight_WingExtended_MouthJustSpit 
    dw $000A 
    dw Spritemap_Alcoon_FaceRight_WingFullyExtended_BackFootForward 
    dw $0009 
    dw Spritemap_Alcoon_FaceRight_WingMovingForward_MouthEnlarging 
    dw $0010 
    dw Spritemap_Alcoon_FacingRight_WingForward_AboutToSpit 
    dw $0003 
    dw Spritemap_Alcoon_FaceRight_WingMovingForward_MouthEnlarging 
    dw Instruction_Alcoon_SpawnAlcoonFireballDownward 
    dw $0028 
    dw Spritemap_Alcoon_FacingRight_WingExtended_MouthJustSpit 
    dw Instruction_Alcoon_StartWalking 
    dw $0001 
    dw Spritemap_Alcoon_FacingRight_WingExtended_MouthJustSpit 

InstList_Alcoon_FacingRight_Airborne_LookingUp:
    dw $7FFF 
    dw Spritemap_Alcoon_FacingRight_LookingUp 
    dw Instruction_Common_Sleep 

InstList_Alcoon_FacingRight_Airborne_LookingForward:
    dw $7FFF 
    dw Spritemap_Alcoon_FacingRight_FrontFootUp 
    dw Instruction_Common_Sleep 

AlcoonConstants_XThresholdToEmerge:
    dw $0050 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_AlcoonConstants_A8DCC9:
    dw $0040 
endif ; !FEATURE_KEEP_UNREFERENCED

AlcoonConstants_XThresholdToHide:
    dw $0070 

InitAI_Alcoon:
    LDX.W $0E54 
    LDA.W #$0000 : STA.L $7E7808,X 
    LDA.W $0F7E,X : STA.W $0FB2,X 
    LDA.W $0F7A,X : STA.L $7E7804,X 
    LDA.W $0F86,X : ORA.W #$2000 : STA.W $0F86,X 
    LDA.W #InstList_Alcoon_FacingLeft_Walking_0 : STA.W $0F92,X 
    LDA.W #Function_Alcoon_WaitForSamusToGetNear : STA.W $0FA8,X 
    JSR.W SetupAlcoonJumpMovement 

.loopRising:
    LDA.W $0FAC,X : CLC : ADC.W $0F80,X : STA.W $0F80,X 
    LDA.W $0FAA,X : ADC.W $0F7E,X : STA.W $0F7E,X 
    JSR.W AlcoonYAcceleration 
    BMI .loopRising 

.loopFalling:
    LDA.W $0FAC,X : STA.B $12 
    LDA.W $0FAA,X : STA.B $14 
    JSL.L MoveEnemyDownBy_14_12 
    BCS .collidedWithBlock 
    JSR.W AlcoonYAcceleration 
    BRA .loopFalling 


.collidedWithBlock:
    LDA.W $0F7E,X : STA.L $7E7806,X 
    LDA.W $0FB2,X : STA.W $0F7E,X 
    RTL 


SetupAlcoonJumpMovement:
    LDA.W #$FFF4 : STA.W $0FAA,X 
    LDA.W #$0000 : STA.W $0FAC,X 
    STA.W $0FAE,X 
    STA.W $0FB0,X 
    STA.L $7E7800,X 
    LDA.W #$8000 : STA.L $7E7802,X 
    RTS 


AlcoonYAcceleration:
    LDA.W $0FAC,X : CLC : ADC.L $7E7802,X : STA.W $0FAC,X 
    LDA.W $0FAA,X : ADC.L $7E7800,X : STA.W $0FAA,X 
    RTS 


MainAI_Alcoon:
    LDX.W $0E54 
    JMP.W ($0FA8,X) 


Function_Alcoon_WaitForSamusToGetNear:
    LDA.L $7E7806,X : SEC : SBC.W $0AFA : BPL .SamusBelowSpawn 
    EOR.W #$FFFF 
    INC A 

.SamusBelowSpawn:
    CMP.W #$0020 : BPL .return 
    LDA.W $0AF6 : SEC : SBC.W $0F7A,X : PHP 
    BPL + 
    EOR.W #$FFFF 
    INC A 

  + CMP.W AlcoonConstants_XThresholdToEmerge : BPL .returnPLP 
    JSR.W SetupAlcoonJumpMovement 
    LDY.W #InstList_Alcoon_FacingLeft_Airborne_LookingUp 
    LDA.W #$FFFE 
    PLP 
    BMI .SamusToTheRight 
    LDY.W #InstList_Alcoon_FacingRight_Airborne_LookingUp 
    LDA.W #$0002 

.SamusToTheRight:
    STA.W $0FAE,X 
    TYA 
    STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    LDA.W #Function_Alcoon_Emerging_Rising : STA.W $0FA8,X 
    LDA.W #$005E : JSL.L QueueSound_Lib2_Max6 

.return:
    RTL 


.returnPLP:
    PLP 
    RTL 


Function_Alcoon_Emerging_Rising:
    LDA.W $0FAC,X : CLC : ADC.W $0F80,X : STA.W $0F80,X 
    LDA.W $0FAA,X : ADC.W $0F7E,X : STA.W $0F7E,X 
    JSR.W AlcoonYAcceleration 
    BMI .return 

.falling:
    LDA.W #Function_Alcoon_Emerging_Falling : STA.W $0FA8,X 
    LDY.W #InstList_Alcoon_FacingLeft_Airborne_LookingForward 
    LDA.W $0FAE,X : BMI .keepLeft 
    LDY.W #InstList_Alcoon_FacingRight_Airborne_LookingForward 

.keepLeft:
    TYA 
    STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 

.return:
    RTL 

    LDA.W #$0000 ; dead code
    STA.W $0FAA,X 
    STA.W $0FAC,X 
    BRA .falling 


Function_Alcoon_Emerging_Falling:
    LDA.W $0FAC,X : STA.B $12 
    LDA.W $0FAA,X : STA.B $14 
    JSL.L MoveEnemyDownBy_14_12 
    BCS .collidedWithBlock 
    JSR.W AlcoonYAcceleration 
    RTL 


.collidedWithBlock:
    LDA.W $0AF6 : SEC : SBC.W $0F7A,X : PHP 
    LDY.W #InstList_Alcoon_FacingLeft_Walking_0 
    LDA.W #$FFFE 
    PLP 
    BMI .directionChosen 
    LDA.W #$0002 
    LDY.W #InstList_Alcoon_FacingRight_Walking_0 

.directionChosen:
    STA.W $0FAE,X 
    TYA 
    STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    LDA.W #Function_Alcoon_MoveHorizontally_SpitFireballsAtSamus : STA.W $0FA8,X 
    LDA.W #$0001 : STA.L $7E7808,X 
    RTL 


Function_Alcoon_MoveHorizontally_SpitFireballsAtSamus:
    STZ.B $12 
    LDA.W #$0002 : STA.B $14 
    JSL.L MoveEnemyDownBy_14_12 
    LDA.L $7E7804,X : SEC : SBC.W $0F7A,X : BPL + 
    EOR.W #$FFFF 
    INC A 

  + CMP.W AlcoonConstants_XThresholdToHide : BPL .farAway 
    LDA.W $0AF6 : SEC : SBC.W $0F7A,X : PHP 
    BPL + 
    EOR.W #$FFFF 
    INC A 

  + LDA.L $7E7808,X : BNE .returnPLP : PLP 
    BMI .facingLeft 
    LDY.W #InstList_Alcoon_FacingRight_SpawnFireballs 
    LDA.W $0FAE,X : BPL .fireballs 
    RTL 


.returnPLP:
    PLP 
    RTL 


.facingLeft:
    LDY.W #InstList_Alcoon_FacingLeft_SpawnFireballs 
    LDA.W $0FAE,X : BPL .return 

.fireballs:
    TYA 
    STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    LDA.W #RTL_A8DECC : STA.W $0FA8,X 

.return:
    RTL 


.farAway:
    LDA.W #Function_Alcoon_Hiding_Rising : STA.W $0FA8,X 
    LDA.W #$FFFC : STA.W $0FAA,X 
    LDA.W #$0000 : STA.W $0FAC,X 
    LDY.W #InstList_Alcoon_FacingLeft_Airborne_LookingForward 
    LDA.W $0FAE,X : BMI + 
    LDY.W #InstList_Alcoon_FacingRight_Airborne_LookingForward 

  + TYA 
    STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    RTL 


RTL_A8DECC:
    RTL 


Function_Alcoon_Hiding_Rising:
    LDA.W $0FAC,X : CLC : ADC.W $0F80,X : STA.W $0F80,X 
    LDA.W $0FAA,X : ADC.W $0F7E,X : STA.W $0F7E,X 
    JSR.W AlcoonYAcceleration 
    BMI .return 
    LDA.W #Function_Alcoon_Hiding_Falling : STA.W $0FA8,X 

.return:
    RTL 


Function_Alcoon_Hiding_Falling:
    LDA.W $0FAC,X : CLC : ADC.W $0F80,X : STA.W $0F80,X 
    LDA.W $0FAA,X : ADC.W $0F7E,X : STA.W $0F7E,X 
    CMP.W $0FB2,X : BPL .reachedTargetY 
    JSR.W AlcoonYAcceleration 
    RTL 


.reachedTargetY:
    LDA.W $0FB2,X : STA.W $0F7E,X 
    LDA.L $7E7804,X : STA.W $0F7A,X 
    LDA.W #Function_Alcoon_WaitForSamusToGetNear : STA.W $0FA8,X 
    RTL 


Instruction_Alcoon_SpawnAlcoonFireballUpward:
    PHY 
    LDA.W #$0000 

Instruction_Alcoon_SpawnAlcoonFireballUpward_loop:
    LDY.W #EnemyProjectile_AlcoonFireball 
    LDX.W $0E54 
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    LDA.W #$003F : JSL.L QueueSound_Lib2_Max6 
    PLY 
    RTL 


Instruction_Alcoon_SpawnAlcoonFireballHorizontally:
    PHY 
    LDA.W #$0002 : BRA Instruction_Alcoon_SpawnAlcoonFireballUpward_loop 


Instruction_Alcoon_SpawnAlcoonFireballDownward:
    PHY 
    LDA.W #$0004 : BRA Instruction_Alcoon_SpawnAlcoonFireballUpward_loop 


Instruction_Alcoon_StartWalking:
    LDX.W $0E54 
    LDA.W #Function_Alcoon_MoveHorizontally_SpitFireballsAtSamus : STA.W $0FA8,X 
    LDA.W $05E5 : AND.W #$0003 
    BNE + 
    LDA.W #$0002 

  + STA.L $7E7808,X 
    LDY.W #InstList_Alcoon_FacingLeft_Walking_0 
    LDA.W $0FAE,X : BMI .return 
    LDY.W #InstList_Alcoon_FacingRight_Walking_0 

.return:
    RTL 


Instruction_Alcoon_DecrementStepCounter_MoveHorizontally:
    LDX.W $0E54 
    LDA.L $7E7808,X : BEQ Instruction_Alcoon_MoveHorizontally_TurnIfWallCollision 
    DEC A 
    STA.L $7E7808,X ; fallthrough to Instruction_Alcoon_MoveHorizontally_TurnIfWallCollision

Instruction_Alcoon_MoveHorizontally_TurnIfWallCollision:
    PHY 
    LDX.W $0E54 
    STZ.B $12 
    LDA.W $0FAE,X : STA.B $14 
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes 
    BCS .turnAround 
    JSL.L AlignEnemyYPositionWIthNonSquareSlope 
    PLY 
    RTL 


.turnAround:
    PLY 
    LDY.W #InstList_Alcoon_FacingLeft_Walking_1 
    LDA.W $0FAE,X : BPL .directionChosen 
    LDY.W #InstList_Alcoon_FacingRight_Walking_1 

.directionChosen:
    EOR.W #$FFFF 
    INC A 
    STA.W $0FAE,X 
    RTL 


RTL_A8DF9C:
    RTL 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_NormalEnemyShotAI_A8DF9D:
    JSL.L NormalEnemyShotAI 
    RTL 
endif ; !FEATURE_KEEP_UNREFERENCED


Spritemap_Alcoon_FacingLeft_FrontFootForward:
    dw $0006,$81FD 
    db $F3 
    dw $2124,$8004 
    db $FC 
    dw $210C,$81F8 
    db $F8 
    dw $210A,$81F8 
    db $08 
    dw $2102,$01ED 
    db $F0 
    dw $212A,$81F5 
    db $E8 
    dw $2100 

Spritemap_Alcoon_FacingLeft_FeetTogether_FrontFootDown:
    dw $0006,$8004 
    db $FB 
    dw $210E,$81FD 
    db $F2 
    dw $2126,$81F8 
    db $07 
    dw $2104,$81F8 
    db $F7 
    dw $210A,$01EE 
    db $EF 
    dw $212A,$81F6 
    db $E7 
    dw $2100 

Spritemap_Alcoon_FacingLeft_FrontFootBack:
    dw $0007,$01FD 
    db $FB 
    dw $213D,$01FD 
    db $F3 
    dw $213C,$8004 
    db $FC 
    dw $2120,$81F8 
    db $08 
    dw $2106,$81F8 
    db $F8 
    dw $210A,$01EF 
    db $F0 
    dw $212A,$81F7 
    db $E8 
    dw $2100 

Spritemap_Alcoon_FacingLeft_FeetTogether_BackFootForward:
    dw $0006,$8004 
    db $FB 
    dw $2122,$81FD 
    db $F2 
    dw $2126,$81F8 
    db $07 
    dw $2108,$81F8 
    db $F7 
    dw $210A,$01EE 
    db $EF 
    dw $212A,$81F6 
    db $E7 
    dw $2100 

Spritemap_Alcoon_FacingLeft_WingFullyExtended_BackFootFoward:
    dw $0006,$81FD 
    db $F3 
    dw $2124,$8004 
    db $FC 
    dw $210C,$81F8 
    db $08 
    dw $2106,$81F8 
    db $F8 
    dw $210A,$01EE 
    db $F0 
    dw $212A,$81F6 
    db $E8 
    dw $2100 

Spritemap_Alcoon_FacingLeft_WingMovingForward_MouthEnlarging:
    dw $0007,$81FE 
    db $F3 
    dw $2126,$8005 
    db $FC 
    dw $210E,$01F7 
    db $F0 
    dw $212E,$81F8 
    db $08 
    dw $2106,$81F9 
    db $F8 
    dw $210A,$01F0 
    db $F0 
    dw $212A,$81F7 
    db $E8 
    dw $2100 

Spritemap_Alcoon_FacingLeft_WingForward_AboutToSpit:
    dw $0009,$0000 
    db $F0 
    dw $213B,$01FE 
    db $FB 
    dw $213D,$01FE 
    db $F3 
    dw $213C,$8005 
    db $FC 
    dw $2120,$01F8 
    db $F0 
    dw $212F,$81F8 
    db $08 
    dw $2106,$81F9 
    db $F8 
    dw $210A,$01F2 
    db $F0 
    dw $212A,$81F8 
    db $E8 
    dw $2100 

Spritemap_Alcoon_FacingLeft_WingExtended_MouthJustSpit:
    dw $0006,$81FD 
    db $F3 
    dw $2124,$8004 
    db $FC 
    dw $2122,$01EE 
    db $F0 
    dw $212B,$81F8 
    db $08 
    dw $2106,$81F8 
    db $F8 
    dw $210A,$81F6 
    db $E8 
    dw $2100 

UNUSED_Spritemap_Alcoon_FacingLeft_LookingUp_A8E0BB:
    dw $0006,$81FD 
    db $F3 
    dw $2124,$01FA 
    db $E4 
    dw $613A,$81FA 
    db $EC 
    dw $2128,$8004 
    db $FC 
    dw $2122,$81F8 
    db $08 
    dw $2108,$81F8 
    db $F8 
    dw $210A 

Spritemap_Alcoon_FacingRight_FrontFootFoward:
    dw $0006,$81F3 
    db $F3 
    dw $6124,$81EC 
    db $FC 
    dw $610C,$81F8 
    db $F8 
    dw $610A,$81F8 
    db $08 
    dw $6102,$000B 
    db $F0 
    dw $612A,$81FB 
    db $E8 
    dw $6100 

Spritemap_Alcoon_FacingRight_FeetTogether_FrontFootBack:
    dw $0006,$81EC 
    db $FB 
    dw $610E,$81F3 
    db $F2 
    dw $6126,$81F8 
    db $07 
    dw $6104,$81F8 
    db $F7 
    dw $610A,$000A 
    db $EF 
    dw $612A,$81FA 
    db $E7 
    dw $6100 

Spritemap_Alcoon_FacingRight_FrontFootBack:
    dw $0007,$01FB 
    db $FB 
    dw $613D,$01FB 
    db $F3 
    dw $613C,$81EC 
    db $FC 
    dw $6120,$81F8 
    db $08 
    dw $6106,$81F8 
    db $F8 
    dw $610A,$0009 
    db $F0 
    dw $612A,$81F9 
    db $E8 
    dw $6100 

Spritemap_Alcoon_FacingRight_FrontFootUp:
    dw $0006,$81EC 
    db $FB 
    dw $6122,$81F3 
    db $F2 
    dw $6126,$81F8 
    db $07 
    dw $6108,$81F8 
    db $F7 
    dw $610A,$000A 
    db $EF 
    dw $612A,$81FA 
    db $E7 
    dw $6100 

Spritemap_Alcoon_FaceRight_WingFullyExtended_BackFootForward:
    dw $0006,$81F3 
    db $F3 
    dw $6124,$81EC 
    db $FC 
    dw $610C,$81F8 
    db $08 
    dw $6106,$81F8 
    db $F8 
    dw $610A,$000A 
    db $F0 
    dw $612A,$81FA 
    db $E8 
    dw $6100 

Spritemap_Alcoon_FaceRight_WingMovingForward_MouthEnlarging:
    dw $0007,$81F2 
    db $F3 
    dw $6126,$81EB 
    db $FC 
    dw $610E,$0001 
    db $F0 
    dw $612E,$81F8 
    db $08 
    dw $6106,$81F7 
    db $F8 
    dw $610A,$0008 
    db $F0 
    dw $612A,$81F9 
    db $E8 
    dw $6100 

Spritemap_Alcoon_FacingRight_WingForward_AboutToSpit:
    dw $0009,$01F8 
    db $F0 
    dw $613B,$01FA 
    db $FB 
    dw $613D,$01FA 
    db $F3 
    dw $613C,$81EB 
    db $FC 
    dw $6120,$0000 
    db $F0 
    dw $612F,$81F8 
    db $08 
    dw $6106,$81F7 
    db $F8 
    dw $610A,$0006 
    db $F0 
    dw $612A,$81F8 
    db $E8 
    dw $6100 

Spritemap_Alcoon_FacingRight_WingExtended_MouthJustSpit:
    dw $0006,$81F3 
    db $F3 
    dw $6124,$81EC 
    db $FC 
    dw $6122,$000A 
    db $F0 
    dw $612B,$81F8 
    db $08 
    dw $6106,$81F8 
    db $F8 
    dw $610A,$81FA 
    db $E8 
    dw $6100 

Spritemap_Alcoon_FacingRight_LookingUp:
    dw $0006,$81F3 
    db $F3 
    dw $6124,$01FE 
    db $E4 
    dw $213A,$81F6 
    db $EC 
    dw $6128,$81EC 
    db $FC 
    dw $6122,$81F8 
    db $08 
    dw $6108,$81F8 
    db $F8 
    dw $610A 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Alcoon_FireballProjectile_0_A8E214:
    dw $0001,$01FC 
    db $FC 
    dw $612C 

UNUSED_Spritemap_Alcoon_FireballProjectile_1_A8E21B:
    dw $0001,$01FC 
    db $FC 
    dw $E12D 

UNUSED_Spritemap_Alcoon_FireballProjectile_2_A8E222:
    dw $0001,$01FC 
    db $FC 
    dw $A12C 

UNUSED_Spritemap_Alcoon_FireballProjectile_3_A8E229:
    dw $0001,$01FC 
    db $FC 
    dw $212D 
endif ; !FEATURE_KEEP_UNREFERENCED

Palette_Atomic:
    dw $3800,$7FFF,$56E0,$3180,$18C0,$6BC0,$5EC0,$4A20 
    dw $35A0,$7FFF,$039C,$0237,$00D1,$03FF,$0237,$00D1 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Palettes_Atomic_A8E250:
    dw $3800,$0000,$0000,$0000,$0000,$0000,$0000,$0000 
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000 
    dw $3800,$7FFF,$6A40,$44E0,$2C20,$7F20,$7220,$5D80 
    dw $4900,$03FF,$001F,$0016,$000E,$03FF,$0237,$00D1 
    dw $3800,$3F57,$2E4D,$00E2,$0060,$3AB0,$220B,$1166 
    dw $0924,$435A,$3694,$15AD,$0508,$03FF,$0237,$00D1 
    dw $3800,$7FFF,$6A40,$44E0,$2C20,$7F20,$7220,$5D80 
    dw $4900,$7FFF,$039C,$0237,$00D1,$03FF,$0237,$00D1 
    dw $3800,$02FF,$01BF,$000F,$0008,$01BF,$011B,$00BA 
    dw $0011,$7FFF,$039C,$0237,$00D1,$03FF,$0237,$00D1 
    dw $3800,$0000,$0000,$0000,$0000,$0000,$0000,$0000 
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000 
endif ; !FEATURE_KEEP_UNREFERENCED

InstList_Atomic_SpinningUpRight:
    dw $0008 
    dw Spritemap_Atomic_0 
    dw $0008 
    dw Spritemap_Atomic_1 
    dw $0008 
    dw Spritemap_Atomic_2 
    dw $0008 
    dw Spritemap_Atomic_3 
    dw $0008 
    dw Spritemap_Atomic_4 
    dw $0008 
    dw Spritemap_Atomic_5 
    dw Instruction_Common_GotoY 
    dw InstList_Atomic_SpinningUpRight 

InstList_Atomic_SpinningUpLeft:
    dw $0008 
    dw Spritemap_Atomic_6 
    dw $0008 
    dw Spritemap_Atomic_7 
    dw $0008 
    dw Spritemap_Atomic_8 
    dw $0008 
    dw Spritemap_Atomic_9 
    dw $0008 
    dw Spritemap_Atomic_A 
    dw $0008 
    dw Spritemap_Atomic_B 
    dw Instruction_Common_GotoY 
    dw InstList_Atomic_SpinningUpLeft 

InstList_Atomic_SpinningDownLeft:
    dw $0008 
    dw Spritemap_Atomic_5 
    dw $0008 
    dw Spritemap_Atomic_4 
    dw $0008 
    dw Spritemap_Atomic_3 
    dw $0008 
    dw Spritemap_Atomic_2 
    dw $0008 
    dw Spritemap_Atomic_1 
    dw $0008 
    dw Spritemap_Atomic_0 
    dw Instruction_Common_GotoY 
    dw InstList_Atomic_SpinningDownLeft 

InstList_Atomic_SpinningDownRight:
    dw $0008 
    dw Spritemap_Atomic_B 
    dw $0008 
    dw Spritemap_Atomic_A 
    dw $0008 
    dw Spritemap_Atomic_9 
    dw $0008 
    dw Spritemap_Atomic_8 
    dw $0008 
    dw Spritemap_Atomic_7 
    dw $0008 
    dw Spritemap_Atomic_6 
    dw Instruction_Common_GotoY 
    dw InstList_Atomic_SpinningDownRight 

AtomicInstListPointers:
    dw InstList_Atomic_SpinningUpRight 
    dw InstList_Atomic_SpinningUpLeft 
    dw InstList_Atomic_SpinningDownLeft 
    dw InstList_Atomic_SpinningDownRight 

InitAI_Atomic:
    LDX.W $0E54 
    LDA.W #$0001 : STA.W $0F94,X 
    STZ.W $0F90,X 
    LDA.W $0FB4,X 
    ASL A 
    TAY 
    LDA.W AtomicInstListPointers,Y : STA.W $0F92,X 
    LDA.W $0FB6,X 
    ASL #3
    TAY 
    LDA.W CommonEnemySpeeds_LinearlyIncreasing,Y : STA.L $7E7802,X 
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+2,Y : STA.L $7E7800,X 
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+4,Y : STA.L $7E7806,X 
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+6,Y : STA.L $7E7804,X 
    RTL 


MainAI_Atomic:
    LDX.W $0E54 
    JSR.W ChooseAtomicYMovementFunction 
    JSR.W ChooseAtomicXMovementFunction 
    LDX.W $0E54 
    JSR.W ($0FA8,X) 
    LDX.W $0E54 
    JSR.W ($0FAA,X) 
    RTL 


ChooseAtomicYMovementFunction:
    LDX.W $0E54 
    LDA.W #Function_Atomic_MoveUp : STA.W $0FA8,X 
    JSL.L Get_SamusY_minus_EnemyY 
    BMI .return 
    LDA.W #Function_Atomic_MoveDown : STA.W $0FA8,X 

.return:
    RTS 


ChooseAtomicXMovementFunction:
    LDX.W $0E54 
    LDA.W #Function_Atomic_MoveLeft : STA.W $0FAA,X 
    JSL.L Get_SamusX_minus_EnemyX 
    BMI .return 
    LDA.W #Function_Atomic_MoveRight : STA.W $0FAA,X 

.return:
    RTS 


Function_Atomic_MoveUp:
    LDX.W $0E54 
    LDA.W $0F7E,X : CLC : ADC.L $7E7806,X : STA.W $0F7E,X 
    LDA.W $0F80,X : CLC : ADC.L $7E7804,X : BCC .done 
    INC.W $0F7E,X 

.done:
    STA.W $0F80,X 
    RTS 


Function_Atomic_MoveDown:
    LDX.W $0E54 
    LDA.W $0F7E,X : CLC : ADC.L $7E7802,X : STA.W $0F7E,X 
    LDA.W $0F80,X : CLC : ADC.L $7E7800,X : BCC .done 
    INC.W $0F7E,X 

.done:
    STA.W $0F80,X 
    RTS 


Function_Atomic_MoveLeft:
    LDX.W $0E54 
    LDA.W $0F7A,X : CLC : ADC.L $7E7806,X : STA.W $0F7A,X 
    LDA.W $0F7C,X : CLC : ADC.L $7E7804,X : BCC .done 
    INC.W $0F7A,X 

.done:
    STA.W $0F7C,X 
    RTS 


Function_Atomic_MoveRight:
    LDX.W $0E54 
    LDA.W $0F7A,X : CLC : ADC.L $7E7802,X : STA.W $0F7A,X 
    LDA.W $0F7C,X : CLC : ADC.L $7E7800,X : BCC .done 
    INC.W $0F7A,X 

.done:
    STA.W $0F7C,X 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Atomic_GetEnemyIndex_A8E481:
    LDX.W $0E54 
    RTL 


UNUSED_Atomic_GetEnemyIndex_A8E485:
    LDX.W $0E54 
    RTL 
endif ; !FEATURE_KEEP_UNREFERENCED


Spritemap_Atomic_0:
    dw $0004,$01F8 
    db $00 
    dw $2102,$81F8 
    db $F8 
    dw $2100,$01FC 
    db $F4 
    dw $2103,$0004 
    db $FC 
    dw $2103 

Spritemap_Atomic_1:
    dw $0004,$01FC 
    db $FC 
    dw $2102,$81F8 
    db $F8 
    dw $2100,$01F8 
    db $F8 
    dw $2103,$0000 
    db $00 
    dw $2103 

Spritemap_Atomic_2:
    dw $0004,$0000 
    db $F8 
    dw $2102,$81F8 
    db $F8 
    dw $2100,$01F4 
    db $FC 
    dw $2103,$01FC 
    db $04 
    dw $2103 

Spritemap_Atomic_3:
    dw $0004,$01F4 
    db $FC 
    dw $2102,$01FC 
    db $04 
    dw $2102,$81F8 
    db $F8 
    dw $2100,$0001 
    db $F7 
    dw $2103 

Spritemap_Atomic_4:
    dw $0003,$01F8 
    db $F8 
    dw $2102,$0000 
    db $00 
    dw $2102,$81F8 
    db $F8 
    dw $2100 

Spritemap_Atomic_5:
    dw $0004,$01FC 
    db $F4 
    dw $2102,$0004 
    db $FC 
    dw $2102,$81F8 
    db $F8 
    dw $2100,$01F7 
    db $01 
    dw $2103 

Spritemap_Atomic_6:
    dw $0004,$0000 
    db $00 
    dw $2102,$81F8 
    db $F8 
    dw $2100,$01FC 
    db $F4 
    dw $2103,$01F4 
    db $FC 
    dw $2103 

Spritemap_Atomic_7:
    dw $0004,$01FC 
    db $FC 
    dw $2102,$81F8 
    db $F8 
    dw $2100,$0000 
    db $F8 
    dw $6103,$01F8 
    db $00 
    dw $6103 

Spritemap_Atomic_8:
    dw $0004,$01F8 
    db $F8 
    dw $2102,$81F8 
    db $F8 
    dw $2100,$0004 
    db $FC 
    dw $2103,$01FC 
    db $04 
    dw $2103 

Spritemap_Atomic_9:
    dw $0004,$0004 
    db $FC 
    dw $2102,$01FC 
    db $04 
    dw $2102,$81F8 
    db $F8 
    dw $2100,$01F7 
    db $F7 
    dw $2103 

Spritemap_Atomic_A:
    dw $0003,$0000 
    db $F8 
    dw $2102,$01F8 
    db $00 
    dw $2102,$81F8 
    db $F8 
    dw $2100 

Spritemap_Atomic_B:
    dw $0004,$01FC 
    db $F4 
    dw $2102,$01F4 
    db $FC 
    dw $2102,$81F8 
    db $F8 
    dw $2100,$0001 
    db $01 
    dw $2103 

Palette_Spark:
    dw $3800,$7FFF,$3BE0,$2680,$1580,$6BFA,$4BF2,$2BEA 
    dw $03E0,$0000,$0000,$0000,$0000,$0000,$0000,$0000 

InstList_Spark_FlickerOn:
    dw Instruction_Spark_SetAsTangible 
    dw $0001 
    dw Spritemap_Spark_Flickering_0 
    dw $0002 
    dw Spritemap_CommonA8_Nothing 
    dw $0001 
    dw Spritemap_Spark_Flickering_0 
    dw $0002 
    dw Spritemap_CommonA8_Nothing 
    dw $0001 
    dw Spritemap_Spark_Flickering_1 
    dw $0002 
    dw Spritemap_CommonA8_Nothing 
    dw $0001 
    dw Spritemap_Spark_Flickering_1 
    dw $0001 
    dw Spritemap_CommonA8_Nothing 
    dw $0002 
    dw Spritemap_Spark_Flickering_2 
    dw $0002 
    dw Spritemap_Spark_Flickering_3 

InstList_Spark_Constant:
    dw $0003 
    dw Spritemap_Spark_Constant_0 
    dw $0003 
    dw Spritemap_Spark_Constant_1 
    dw $0003 
    dw Spritemap_Spark_Constant_2 
    dw $0003 
    dw Spritemap_Spark_Constant_3 
    dw Instruction_Common_GotoY 
    dw InstList_Spark_Constant 

InstList_Spark_FlickerOut:
    dw $0001 
    dw Spritemap_Spark_Flickering_0 
    dw $0001 
    dw Spritemap_Spark_Flickering_0 
    dw $0001 
    dw Spritemap_Spark_Flickering_1 
    dw $0001 
    dw Spritemap_Spark_Flickering_1 
    dw $0001 
    dw Spritemap_Spark_Flickering_2 
    dw $0001 
    dw Spritemap_CommonA8_Nothing 
    dw $0001 
    dw Spritemap_Spark_Flickering_2 
    dw $0001 
    dw Spritemap_CommonA8_Nothing 
    dw Instruction_Spark_SetAsIntangible 
    dw Instruction_CommonA8_Sleep 

InstList_Spark_EmitFallingSparks:
    dw $0003 
    dw Spritemap_Spark_Flickering_0 
    dw $0003 
    dw Spritemap_Spark_Flickering_1 
    dw $0003 
    dw Spritemap_Spark_Flickering_2 
    dw $0003 
    dw Spritemap_Spark_Flickering_3 
    dw Instruction_Common_GotoY 
    dw InstList_Spark_EmitFallingSparks 

Instruction_Spark_SetAsIntangible:
    LDX.W $0E54 
    LDA.W $0F86,X : ORA.W #$0400 : STA.W $0F86,X 
    RTL 


Instruction_Spark_SetAsTangible:
    LDX.W $0E54 
    LDA.W $0F86,X : AND.W #$FBFF : STA.W $0F86,X 
    RTL 


InitAI_Spark:
    LDX.W $0E54 
    LDA.W $0FB4,X : AND.W #$0003 
    ASL A 
    TAY 
    LDA.W .functionPointers,Y : STA.W $0FAA,X 
    LDA.W $0FB6,X : STA.W $0FB0,X 
    STZ.B $12 
    JSR.W SetSparkFunctionTimer 
    LDA.W #$0001 : STA.W $0F94,X 
    LDA.W .instListPointers,Y : STA.W $0F92,X 
    STZ.W $0F90,X 
    LDA.W #$0001 : STA.W $0F94,X 
    LDX.W $079F 
    LDA.L $7ED828,X : AND.W #$0001 
    BEQ .PhantoonAlive 
    RTL 


.PhantoonAlive:
    LDX.W $0E54 
    LDA.W $0F86,X 
    ORA.W $0100 ; >_<
    STA.W $0F86,X 
    RTL 


.instListPointers:
    dw InstList_Spark_Constant 
    dw InstList_Spark_Constant 
    dw InstList_Spark_EmitFallingSparks 

.functionPointers:
    dw RTL_A8E694 
    dw Function_Spark_Intermittent_Active 
    dw Function_Spark_EmitFallingSparks 

MainAI_Spark:
    LDX.W $0E54 
    JMP.W ($0FAA,X) 


RTL_A8E694:
    RTL 


Function_Spark_Intermittent_Inactive:
    LDA.W $0FB2,X 
    DEC A 
    BEQ .timerExpired 
    STA.W $0FB2,X 
    RTL 


.timerExpired:
    LDA.W #Function_Spark_Intermittent_Active : STA.W $0FAA,X 
    LDA.W #InstList_Spark_FlickerOn : STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    STZ.B $12 
    JSR.W SetSparkFunctionTimer 
    RTL 


Function_Spark_Intermittent_Active:
    LDA.W $0FB2,X 
    DEC A 
    BEQ .timerExpired 
    STA.W $0FB2,X 
    RTL 


.timerExpired:
    LDA.W #Function_Spark_Intermittent_Inactive : STA.W $0FAA,X 
    LDA.W #InstList_Spark_FlickerOut : STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    LDA.W #$0008 : STA.B $12 
    JSR.W SetSparkFunctionTimer 
    RTL 


Function_Spark_EmitFallingSparks:
    LDA.W $0FB2,X 
    DEC A 
    BEQ .timerExpired 
    STA.W $0FB2,X 
    RTL 


.timerExpired:
    LDX.W $0E54 
    LDY.W #EnemyProjectile_FallingSpark 
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    STZ.B $12 
    JSR.W SetSparkFunctionTimer 
    RTL 


SetSparkFunctionTimer:
    LDA.W $0FB0,X : BPL .noRNG 
    JSL.L GenerateRandomNumber 
    AND.W #$003F 
    CLC : ADC.W #$0004 

.noRNG:
    CLC : ADC.B $12 : STA.W $0FB2,X 
    RTS 


RTL_A8E70D:
    RTL 


EnemyShot_Spark:
    PHX 
    LDA.W $18A6 
    ASL A 
    TAX 
    LDA.W $0C04,X : AND.W #$FFEF : STA.W $0C04,X 
    PLX 
    RTL 


Spritemap_Spark_Constant_0:
    dw $0002,$01FC 
    db $01 
    dw $3103,$01FC 
    db $FC 
    dw $3100 

Spritemap_Spark_Constant_1:
    dw $0002,$01FC 
    db $06 
    dw $7104,$01FC 
    db $FC 
    dw $3101 

Spritemap_Spark_Constant_2:
    dw $0002,$01FC 
    db $08 
    dw $3105,$01FC 
    db $FC 
    dw $3102 

Spritemap_Spark_Constant_3:
    dw $0002,$01FC 
    db $0A 
    dw $3106,$01FC 
    db $FC 
    dw $7101 

Spritemap_Spark_Flickering_0:
    dw $0005,$0002 
    db $FE 
    dw $3109,$01F6 
    db $FC 
    dw $3108,$0000 
    db $F8 
    dw $3107,$01FC 
    db $03 
    dw $3103,$01FC 
    db $FC 
    dw $3100 

Spritemap_Spark_Flickering_1:
    dw $0005,$01F4 
    db $FC 
    dw $3109,$0004 
    db $00 
    dw $310A,$0002 
    db $F6 
    dw $3108,$01FC 
    db $06 
    dw $7104,$01FC 
    db $FC 
    dw $3101 

Spritemap_Spark_Flickering_2:
    dw $0004,$01F4 
    db $FC 
    dw $310A,$0004 
    db $F4 
    dw $3109,$01FC 
    db $09 
    dw $3105,$01FC 
    db $FC 
    dw $3102 

Spritemap_Spark_Flickering_3:
    dw $0003,$0004 
    db $F4 
    dw $310A,$01FC 
    db $0E 
    dw $3106,$01FC 
    db $FC 
    dw $7101 

Palette_FaceBlock:
    dw $3800,$72B2,$71C7,$2461,$1840,$7A8E,$660B,$4D03 
    dw $30A4,$30A4,$2461,$1840,$0800,$0000,$0000,$0000 

FaceBlockGlowColors:
    dw $001F,$0012,$000A,$002B,$051F,$0096,$0011,$0007 
    dw $0A3F,$013B,$0018,$000D,$0F3F,$01BF,$001F,$0012 
    dw $0F3F,$01BF,$001F,$0012,$0A3F,$013B,$0018,$000D 
    dw $051F,$0096,$0011,$0007,$001F,$0012,$000A,$002B 

InstList_FaceBlock_TurningLeft:
    dw $0030 
    dw Spritemap_FaceBlock_FacingForward 
    dw $0010 
    dw Spritemap_FaceBlock_TurningLeft 
    dw $0010 
    dw Spritemap_FaceBlock_FacingLeft 
    dw Instruction_Common_Sleep 

InstList_FaceBlock_TurningRight:
    dw $0030 
    dw Spritemap_FaceBlock_FacingForward 
    dw $0010 
    dw Spritemap_FaceBlock_TurningRight 
    dw $0010 
    dw Spritemap_FaceBlock_FacingRight 
    dw Instruction_Common_Sleep 

InstList_FaceBlock_FacingForward:
    dw $0001 
    dw Spritemap_FaceBlock_FacingForward 
    dw Instruction_Common_Sleep 

InitAI_FaceBlock:
    LDX.W $0E54 
    LDA.W #InstList_FaceBlock_FacingForward : STA.W $0F92,X 
    LDY.W #EnemyGraphicsDrawnHook_FaceBlock_PeriodicallyCyclePalettes 
    LDA.W $09A4 : BIT.W #$0004 
    BNE .morphBallCollected 
    LDY.W #RTL_A8804C 

.morphBallCollected:
    STY.W $178C 
    LDA.W #EnemyGraphicsDrawnHook_FaceBlock_PeriodicallyCyclePalettes>>16 : STA.W $178E 
    LDA.W $0F96,X 
    ASL #4
    AND.W #$FF00 
    XBA 
    STA.W $1794 
    LDA.W #$0010 : STA.W $1798 
    LDA.W $0FB6,X : AND.W #$0001 
    ROR A 
    ROR A 
    STA.W $0FB6,X 
    RTL 


EnemyGraphicsDrawnHook_FaceBlock_PeriodicallyCyclePalettes:
    LDA.W $0797 : BNE .return 
    LDA.W $1798 
    DEC A 
    STA.W $1798 
    BNE .return 
    LDA.W #$0010 : STA.W $1798 
    LDA.W $1794 
    TAX 
    LDA.W $1796 
    ASL #3
    TAY 
    LDA.W #$0004 : STA.W $060B 

.loopColors:
    LDA.W FaceBlockGlowColors,Y : STA.L $7EC112,X 
    INY #2
    INX #2
    DEC.W $060B 
    BNE .loopColors 
    LDA.W $1796 
    INC A 
    AND.W #$0007 
    STA.W $1796 

.return:
    RTL 


MainAI_FaceBlock:
    LDX.W $0E54 
    LDA.W $09A4 : BIT.W #$0004 
    BEQ .return 
    LDY.W #EnemyGraphicsDrawnHook_FaceBlock_PeriodicallyCyclePalettes 
    STY.W $178C 
    LDA.W $0F96,X 
    ASL #4
    AND.W #$FF00 
    XBA 
    STA.W $1794 
    LDA.W $0FA8,X : BNE .return 
    JSL.L Get_SamusY_minus_EnemyY 
    JSL.L NegateA_A0B067 
    CMP.W $0FB4,X : BPL .return 
    JSL.L Get_SamusX_minus_EnemyX 
    STA.W $0FAA,X 
    JSL.L NegateA_A0B067 
    CMP.W $0FB4,X : BPL .return 
    LDA.W $0FAA,X : AND.W #$8000 
    CMP.W $0FB6,X : BEQ .return 
    LDY.W #InstList_FaceBlock_TurningLeft 
    LDA.W $0FAA,X : BMI .keepLeft 
    LDY.W #InstList_FaceBlock_TurningRight 

.keepLeft:
    TYA 
    STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    LDA.W #$0001 : STA.W $0FA8,X 
    LDA.W #$0010 : STA.W $1798 

.return:
    RTL 


RTL_A8E91C:
    RTL 


EnemyShot_FaceBlock:
    LDA.W $18A6 
    ASL A 
    TAX 
    LDA.W $0C04,X : AND.W #$FFEF : STA.W $0C04,X 
    RTL 


Spritemap_FaceBlock_FacingForward:
    dw $0004,$0000 
    db $00 
    dw $3107,$01F8 
    db $00 
    dw $3106,$0000 
    db $F8 
    dw $3101,$01F8 
    db $F8 
    dw $3100 

Spritemap_FaceBlock_TurningLeft:
    dw $0004,$0000 
    db $00 
    dw $3109,$01F8 
    db $00 
    dw $3108,$0000 
    db $F8 
    dw $3103,$01F8 
    db $F8 
    dw $3102 

Spritemap_FaceBlock_FacingLeft:
    dw $0004,$0000 
    db $00 
    dw $310B,$01F8 
    db $00 
    dw $310A,$0000 
    db $F8 
    dw $3105,$01F8 
    db $F8 
    dw $3104 

Spritemap_FaceBlock_TurningRight:
    dw $0004,$01F8 
    db $00 
    dw $7109,$0000 
    db $00 
    dw $7108,$01F8 
    db $F8 
    dw $7103,$0000 
    db $F8 
    dw $7102 

Spritemap_FaceBlock_FacingRight:
    dw $0004,$01F8 
    db $00 
    dw $710B,$0000 
    db $00 
    dw $710A,$01F8 
    db $F8 
    dw $7105,$0000 
    db $F8 
    dw $7104 

Palette_KihunterGreen:
    dw $3800,$4B57,$3A4D,$0CE2,$0040,$46B0,$2E0B,$1D66 
    dw $1524,$48FF,$38B6,$246E,$1448,$03FF,$0237,$00D1 

Palette_KihunterYellow:
    dw $3800,$57FF,$42F7,$158C,$00A5,$4F5A,$36B5,$2610 
    dw $1DCE,$03E0,$0301,$01A1,$00C1,$6BFA,$42B0,$1545 

Palette_KihunterRed:
    dw $3800,$5ADF,$3975,$0C0A,$0006,$4E1A,$2D33,$1C8E 
    dw $102B,$6F11,$522A,$3124,$1824,$02FF,$01BF,$000F 

InstList_Kihunter_Idling_FacingLeft:
    dw $0002 
    dw Spritemap_Kihunter_0 
    dw $0002 
    dw Spritemap_Kihunter_1 
    dw $0001 
    dw Spritemap_Kihunter_2 
    dw Instruction_Kihunter_SetIdlingInstListsFacingForwards 

InstList_Kihunter_Swiping_FacingLeft:
    dw $0002 
    dw Spritemap_Kihunter_11 
    dw $0006 
    dw Spritemap_Kihunter_12 
    dw $0002 
    dw Spritemap_Kihunter_11 
    dw $0002 
    dw Spritemap_Kihunter_10 
    dw $0002 
    dw Spritemap_Kihunter_13 
    dw $0020 
    dw Spritemap_Kihunter_14 
    dw Instruction_Common_GotoY 
    dw InstList_Kihunter_Idling_FacingLeft 

InstList_Kihunter_Idling_FacingRight:
    dw $0002 
    dw Spritemap_Kihunter_8 
    dw $0002 
    dw Spritemap_Kihunter_9 
    dw $0001 
    dw Spritemap_Kihunter_A 
    dw Instruction_Kihunter_SetIdlingInstListsFacingForwards 

InstList_Kihunter_Swiping_FacingRight:
    dw $0002 
    dw Spritemap_Kihunter_16 
    dw $0006 
    dw Spritemap_Kihunter_17 
    dw $0002 
    dw Spritemap_Kihunter_16 
    dw $0002 
    dw Spritemap_Kihunter_15 
    dw $0002 
    dw Spritemap_Kihunter_18 
    dw $0020 
    dw Spritemap_Kihunter_19 
    dw Instruction_Common_GotoY 
    dw InstList_Kihunter_Idling_FacingRight 

InstList_KihunterWings_FacingLeft:
    dw $0002 
    dw Spritemap_Kihunter_3 
    dw $0002 
    dw Spritemap_Kihunter_4 
    dw $0001 
    dw Spritemap_Kihunter_5 
    dw Instruction_CommonA8_GotoY 
    dw InstList_KihunterWings_FacingLeft 

InstList_KihunterWings_FacingRight:
    dw $0002 
    dw Spritemap_Kihunter_B 
    dw $0002 
    dw Spritemap_Kihunter_C 
    dw $0001 
    dw Spritemap_Kihunter_D 
    dw Instruction_Common_GotoY 
    dw InstList_KihunterWings_FacingRight 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_KihunterWings_Falling_XFlipped_A8EA6E:
    dw $0010 
    dw Spritemap_Kihunter_6 
    dw Instruction_Common_GotoY 
    dw UNUSED_InstList_KihunterWings_Falling_XFlipped_A8EA6E 

UNUSED_InstList_KihunterWings_Falling_XFlipped_A8EA76:
    dw $0010 
    dw Spritemap_Kihunter_7 
    dw Instruction_Common_GotoY 
    dw UNUSED_InstList_KihunterWings_Falling_XFlipped_A8EA76 
endif ; !FEATURE_KEEP_UNREFERENCED

InstList_KihunterWings_Falling:
    dw $0001 
    dw Spritemap_Kihunter_E 
    dw Instruction_Common_Sleep 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_KihunterWings_Falling_A8EA84:
    dw $0001 
    dw Spritemap_Kihunter_F 
    dw Instruction_Common_Sleep 
endif ; !FEATURE_KEEP_UNREFERENCED

InstList_Kihunter_Hop_FacingLeft:
    dw $0008 
    dw Spritemap_Kihunter_1A 
    dw $0008 
    dw Spritemap_Kihunter_1B 
    dw $000B 
    dw Spritemap_Kihunter_1C 
    dw $0002 
    dw Spritemap_Kihunter_1B 
    dw $0002 
    dw Spritemap_Kihunter_1A 
    dw Instruction_Kihunter_SetFunctionToHop 
    dw $0001 
    dw Spritemap_Kihunter_1D 
    dw Instruction_Common_Sleep 

InstList_Kihunter_Hop_FacingRight:
    dw $0008 
    dw Spritemap_Kihunter_1E 
    dw $0008 
    dw Spritemap_Kihunter_1F 
    dw $000B 
    dw Spritemap_Kihunter_20 
    dw $0002 
    dw Spritemap_Kihunter_1F 
    dw $0002 
    dw Spritemap_Kihunter_1E 
    dw Instruction_Kihunter_SetFunctionToHop 
    dw $0001 
    dw Spritemap_Kihunter_21 
    dw Instruction_Common_Sleep 

InstList_Kihunter_LandedFromHop_FacingLeft:
    dw $0008 
    dw Spritemap_Kihunter_1A 
    dw $0008 
    dw Spritemap_Kihunter_1B 
    dw $000B 
    dw Spritemap_Kihunter_1C 
    dw $0008 
    dw Spritemap_Kihunter_1B 
    dw Instruction_Kihunter_SetFunctionTo_Wingless_Thinking 
    dw $0001 
    dw Spritemap_Kihunter_1A 
    dw Instruction_Common_Sleep 

InstList_Kihunter_LandedFromHop_FacingRight:
    dw $0008 
    dw Spritemap_Kihunter_1E 
    dw $0008 
    dw Spritemap_Kihunter_1F 
    dw $000B 
    dw Spritemap_Kihunter_20 
    dw $0008 
    dw Spritemap_Kihunter_1F 
    dw Instruction_Kihunter_SetFunctionTo_Wingless_Thinking 
    dw $0001 
    dw Spritemap_Kihunter_1E 
    dw Instruction_Common_Sleep 

InstList_Kihunter_AcidSpitAttack_FacingLeft:
    dw $0020 
    dw Spritemap_Kihunter_22 
    dw $0006 
    dw Spritemap_Kihunter_23 
    dw $0010 
    dw Spritemap_Kihunter_24 
    dw $0002 
    dw Spritemap_Kihunter_25 
    dw Instruction_Kihunter_FireAcidSpitLeft 
    dw $0018 
    dw Spritemap_Kihunter_26 
    dw Instruction_Kihunter_SetFunctionTo_Wingless_Thinking 
    dw $0001 
    dw Spritemap_Kihunter_22 
    dw Instruction_Common_Sleep 

InstList_Kihunter_AcidSpitAttack_FacingRight:
    dw $0020 
    dw Spritemap_Kihunter_27 
    dw $0006 
    dw Spritemap_Kihunter_28 
    dw $0010 
    dw Spritemap_Kihunter_29 
    dw $0002 
    dw Spritemap_Kihunter_2A 
    dw Instruction_Kihunter_FireAcidSpitRight 
    dw $0018 
    dw Spritemap_Kihunter_2B 
    dw Instruction_Kihunter_SetFunctionTo_Wingless_Thinking 
    dw $0001 
    dw Spritemap_Kihunter_27 
    dw Instruction_Common_Sleep 

Spritemap_Kihunter_0:
    dw $0008,$01E5 
    db $03 
    dw $210E,$C3EB 
    db $FE 
    dw $2126,$C3F4 
    db $F8 
    dw $212C,$C3FD 
    db $01 
    dw $211E,$C3FD 
    db $09 
    dw $212E,$C200 
    db $00 
    dw $2122,$C3EF 
    db $F0 
    dw $2100,$01E2 
    db $02 
    dw $210E 

Spritemap_Kihunter_1:
    dw $0008,$01E5 
    db $02 
    dw $210E,$C3EB 
    db $FD 
    dw $2126,$C3F4 
    db $F7 
    dw $212C,$C3FD 
    db $00 
    dw $211E,$C3FD 
    db $08 
    dw $212E,$C200 
    db $FF 
    dw $2122,$C3EF 
    db $EF 
    dw $2100,$01E2 
    db $01 
    dw $210E 

Spritemap_Kihunter_2:
    dw $0008,$01E5 
    db $03 
    dw $210E,$C3EB 
    db $FE 
    dw $2126,$C3F4 
    db $F8 
    dw $212C,$C3FD 
    db $01 
    dw $211E,$C3FD 
    db $09 
    dw $212E,$C200 
    db $00 
    dw $2122,$C3EF 
    db $F0 
    dw $2100,$01E2 
    db $02 
    dw $210E 

Spritemap_Kihunter_3:
    dw $0004,$000B 
    db $E3 
    dw $2144,$0001 
    db $E3 
    dw $2143,$C209 
    db $EB 
    dw $2141,$C201 
    db $EB 
    dw $2140 

Spritemap_Kihunter_4:
    dw $0002,$0012 
    db $FB 
    dw $2145,$C202 
    db $F3 
    dw $2146 

Spritemap_Kihunter_5:
    dw $0003,$0011 
    db $F3 
    dw $2155,$0009 
    db $F3 
    dw $2154,$0001 
    db $F3 
    dw $2153 

Spritemap_Kihunter_6:
    dw $0002,$C3FC 
    db $F8 
    dw $2149,$C3F4 
    db $F8 
    dw $2148 

Spritemap_Kihunter_7:
    dw $0002,$C3FC 
    db $F8 
    dw $2149,$C3F4 
    db $F8 
    dw $2148 

Spritemap_Kihunter_8:
    dw $0008,$0013 
    db $03 
    dw $610E,$C205 
    db $FE 
    dw $6126,$C3FC 
    db $F8 
    dw $612C,$C3F3 
    db $01 
    dw $611E,$C3F3 
    db $09 
    dw $612E,$C3F0 
    db $00 
    dw $6122,$C201 
    db $F0 
    dw $6100,$0016 
    db $02 
    dw $610E 

Spritemap_Kihunter_9:
    dw $0008,$0013 
    db $02 
    dw $610E,$C205 
    db $FD 
    dw $6126,$C3FC 
    db $F7 
    dw $612C,$C3F3 
    db $00 
    dw $611E,$C3F3 
    db $08 
    dw $612E,$C3F0 
    db $FF 
    dw $6122,$C201 
    db $EF 
    dw $6100,$0016 
    db $01 
    dw $610E 

Spritemap_Kihunter_A:
    dw $0008,$0013 
    db $03 
    dw $610E,$C205 
    db $FE 
    dw $6126,$C3FC 
    db $F8 
    dw $612C,$C3F3 
    db $01 
    dw $611E,$C3F3 
    db $09 
    dw $612E,$C3F0 
    db $00 
    dw $6122,$C201 
    db $F0 
    dw $6100,$0016 
    db $02 
    dw $610E 

Spritemap_Kihunter_B:
    dw $0004,$01ED 
    db $E3 
    dw $6144,$01F7 
    db $E3 
    dw $6143,$C3E7 
    db $EB 
    dw $6141,$C3EF 
    db $EB 
    dw $6140 

Spritemap_Kihunter_C:
    dw $0002,$01E6 
    db $FB 
    dw $6145,$C3EE 
    db $F3 
    dw $6146 

Spritemap_Kihunter_D:
    dw $0003,$01E7 
    db $F3 
    dw $6155,$01EF 
    db $F3 
    dw $6154,$01F7 
    db $F3 
    dw $6153 

Spritemap_Kihunter_E:
    dw $0002,$C3F4 
    db $F8 
    dw $6149,$C3FC 
    db $F8 
    dw $6148 

Spritemap_Kihunter_F:
    dw $0002,$C3F4 
    db $F8 
    dw $6149,$C3FC 
    db $F8 
    dw $6148 

Spritemap_Kihunter_10:
    dw $0008,$01E5 
    db $03 
    dw $210E,$C3EB 
    db $FE 
    dw $2126,$C3F4 
    db $F8 
    dw $212C,$C3FD 
    db $01 
    dw $211E,$C3FD 
    db $09 
    dw $212E,$C200 
    db $00 
    dw $2122,$C3EF 
    db $F0 
    dw $2100,$01E2 
    db $02 
    dw $210E 

Spritemap_Kihunter_11:
    dw $0008,$01E9 
    db $F5 
    dw $210F,$C3EC 
    db $FA 
    dw $2128,$C3F4 
    db $F8 
    dw $212C,$C3FD 
    db $01 
    dw $211E,$C3FD 
    db $09 
    dw $212E,$C200 
    db $00 
    dw $2122,$C3EF 
    db $F0 
    dw $2100,$01E6 
    db $F4 
    dw $210F 

Spritemap_Kihunter_12:
    dw $0008,$01F0 
    db $F5 
    dw $214F,$C3EC 
    db $FA 
    dw $2128,$C3F4 
    db $F8 
    dw $212C,$C3FD 
    db $01 
    dw $211E,$C3FD 
    db $09 
    dw $212E,$C200 
    db $00 
    dw $2122,$C3EF 
    db $F0 
    dw $2100,$01ED 
    db $F4 
    dw $214F 

Spritemap_Kihunter_13:
    dw $0008,$01E8 
    db $0F 
    dw $210E,$C3ED 
    db $03 
    dw $2124,$C3F4 
    db $F9 
    dw $212C,$C3FD 
    db $01 
    dw $211E,$C3FD 
    db $09 
    dw $212E,$C200 
    db $00 
    dw $2122,$C3EF 
    db $F1 
    dw $2100,$01E5 
    db $0E 
    dw $210E 

Spritemap_Kihunter_14:
    dw $0008,$C3ED 
    db $03 
    dw $2124,$01F0 
    db $0F 
    dw $214E,$C3F4 
    db $F9 
    dw $212C,$C3FD 
    db $02 
    dw $211E,$C3FD 
    db $0A 
    dw $212E,$C200 
    db $01 
    dw $2122,$C3EF 
    db $F2 
    dw $2100,$01ED 
    db $0E 
    dw $214E 

Spritemap_Kihunter_15:
    dw $0008,$0013 
    db $03 
    dw $610E,$C205 
    db $FE 
    dw $6126,$C3FC 
    db $F8 
    dw $612C,$C3F3 
    db $01 
    dw $611E,$C3F3 
    db $09 
    dw $612E,$C3F0 
    db $00 
    dw $6122,$C201 
    db $F0 
    dw $6100,$0016 
    db $02 
    dw $610E 

Spritemap_Kihunter_16:
    dw $0008,$000F 
    db $F5 
    dw $610F,$C204 
    db $FA 
    dw $6128,$C3FC 
    db $F8 
    dw $612C,$C3F3 
    db $01 
    dw $611E,$C3F3 
    db $09 
    dw $612E,$C3F0 
    db $00 
    dw $6122,$C201 
    db $F0 
    dw $6100,$0012 
    db $F4 
    dw $610F 

Spritemap_Kihunter_17:
    dw $0008,$0008 
    db $F5 
    dw $614F,$C204 
    db $FA 
    dw $6128,$C3FC 
    db $F8 
    dw $612C,$C3F3 
    db $01 
    dw $611E,$C3F3 
    db $09 
    dw $612E,$C3F0 
    db $00 
    dw $6122,$C201 
    db $F0 
    dw $6100,$000B 
    db $F4 
    dw $614F 

Spritemap_Kihunter_18:
    dw $0008,$0010 
    db $0F 
    dw $610E,$C203 
    db $03 
    dw $6124,$C3FC 
    db $F9 
    dw $612C,$C3F3 
    db $01 
    dw $611E,$C3F3 
    db $09 
    dw $612E,$C3F0 
    db $00 
    dw $6122,$C201 
    db $F1 
    dw $6100,$0013 
    db $0E 
    dw $610E 

Spritemap_Kihunter_19:
    dw $0008,$C203 
    db $03 
    dw $6124,$0008 
    db $0F 
    dw $614E,$C3FC 
    db $F9 
    dw $612C,$C3F3 
    db $02 
    dw $611E,$C3F3 
    db $0A 
    dw $612E,$C3F0 
    db $01 
    dw $6122,$C201 
    db $F2 
    dw $6100,$000B 
    db $0E 
    dw $614E 

Spritemap_Kihunter_1A:
    dw $0008,$01E3 
    db $FF 
    dw $210E,$C3E9 
    db $FA 
    dw $2126,$C3F2 
    db $F4 
    dw $212C,$C3FA 
    db $F8 
    dw $215E,$C3FA 
    db $00 
    dw $216E,$C3FE 
    db $FC 
    dw $2122,$C3EE 
    db $ED 
    dw $2100,$01E0 
    db $FE 
    dw $210E 

Spritemap_Kihunter_1B:
    dw $0008,$01E3 
    db $04 
    dw $210E,$C3E9 
    db $FF 
    dw $2126,$C3F2 
    db $F9 
    dw $212C,$C3FB 
    db $00 
    dw $2162,$C3FE 
    db $01 
    dw $2122,$C3ED 
    db $F1 
    dw $2100,$01E0 
    db $03 
    dw $210E,$C3F9 
    db $FF 
    dw $2162 

Spritemap_Kihunter_1C:
    dw $0008,$01E3 
    db $07 
    dw $210E,$C3E9 
    db $02 
    dw $2126,$C3F2 
    db $FC 
    dw $212C,$C3FB 
    db $00 
    dw $2160,$C3FE 
    db $04 
    dw $2122,$C3ED 
    db $F4 
    dw $2100,$01E0 
    db $06 
    dw $210E,$C3F9 
    db $FF 
    dw $2160 

Spritemap_Kihunter_1D:
    dw $0008,$01E8 
    db $00 
    dw $210E,$C3EE 
    db $FB 
    dw $2126,$C3F7 
    db $F5 
    dw $212C,$C200 
    db $FE 
    dw $211E,$C200 
    db $06 
    dw $212E,$C203 
    db $FD 
    dw $2122,$C3F3 
    db $EE 
    dw $2100,$01E5 
    db $FF 
    dw $210E 

Spritemap_Kihunter_1E:
    dw $0008,$0015 
    db $FF 
    dw $610E,$C207 
    db $FA 
    dw $6126,$C3FE 
    db $F4 
    dw $612C,$C3F6 
    db $F8 
    dw $615E,$C3F6 
    db $00 
    dw $616E,$C3F2 
    db $FC 
    dw $6122,$C202 
    db $ED 
    dw $6100,$0018 
    db $FE 
    dw $610E 

Spritemap_Kihunter_1F:
    dw $0008,$0015 
    db $04 
    dw $610E,$C207 
    db $FF 
    dw $6126,$C3FE 
    db $F9 
    dw $612C,$C3F5 
    db $00 
    dw $6162,$C3F2 
    db $01 
    dw $6122,$C203 
    db $F1 
    dw $6100,$0018 
    db $03 
    dw $610E,$C3F7 
    db $FF 
    dw $6162 

Spritemap_Kihunter_20:
    dw $0008,$0015 
    db $07 
    dw $610E,$C207 
    db $02 
    dw $6126,$C3FE 
    db $FC 
    dw $612C,$C3F5 
    db $00 
    dw $6160,$C3F2 
    db $04 
    dw $6122,$C203 
    db $F4 
    dw $6100,$0018 
    db $06 
    dw $610E,$C3F7 
    db $FF 
    dw $6160 

Spritemap_Kihunter_21:
    dw $0008,$0012 
    db $FF 
    dw $610E,$C204 
    db $FA 
    dw $6126,$C3FB 
    db $F4 
    dw $612C,$C3F0 
    db $FE 
    dw $611E,$C3F0 
    db $06 
    dw $612E,$C3EF 
    db $FC 
    dw $6122,$C3FF 
    db $ED 
    dw $6100,$0015 
    db $FE 
    dw $610E 

Spritemap_Kihunter_22:
    dw $0008,$01E3 
    db $FF 
    dw $210E,$C3E9 
    db $FA 
    dw $2126,$C3F2 
    db $F4 
    dw $212C,$C3FA 
    db $F8 
    dw $215E,$C3FA 
    db $00 
    dw $216E,$C3FE 
    db $FC 
    dw $2122,$C3EE 
    db $ED 
    dw $2100,$01E0 
    db $FE 
    dw $210E 

Spritemap_Kihunter_23:
    dw $0009,$01E4 
    db $FF 
    dw $210E,$C3EA 
    db $FA 
    dw $2126,$C3F3 
    db $F4 
    dw $212C,$C3FA 
    db $F8 
    dw $215E,$C3FA 
    db $00 
    dw $216E,$C3FE 
    db $FC 
    dw $2122,$C3F2 
    db $EC 
    dw $2103,$C3EA 
    db $EC 
    dw $2102,$01E1 
    db $FE 
    dw $210E 

Spritemap_Kihunter_24:
    dw $0009,$01E5 
    db $FF 
    dw $210E,$C3EB 
    db $FA 
    dw $2126,$C3F4 
    db $F4 
    dw $212C,$C3FA 
    db $F8 
    dw $215E,$C3FA 
    db $00 
    dw $216E,$C3FD 
    db $FC 
    dw $2122,$C3FC 
    db $EC 
    dw $2107,$C3EC 
    db $EC 
    dw $2105,$01E2 
    db $FE 
    dw $210E 

Spritemap_Kihunter_25:
    dw $0009,$01E5 
    db $FF 
    dw $210E,$C3EB 
    db $FA 
    dw $2126,$C3F4 
    db $F4 
    dw $212C,$C3FA 
    db $F8 
    dw $215E,$C3FA 
    db $00 
    dw $216E,$C3EB 
    db $EC 
    dw $210A,$C3FB 
    db $EC 
    dw $2107,$C3FF 
    db $FC 
    dw $2122,$01E2 
    db $FE 
    dw $210E 

Spritemap_Kihunter_26:
    dw $0009,$01E4 
    db $FF 
    dw $210E,$C3EA 
    db $FA 
    dw $2126,$C3F3 
    db $F4 
    dw $212C,$C3FA 
    db $F8 
    dw $215E,$C3FA 
    db $00 
    dw $216E,$C3FD 
    db $FC 
    dw $2122,$C3EA 
    db $EC 
    dw $210C,$C3FA 
    db $EC 
    dw $2107,$01E1 
    db $FE 
    dw $210E 

Spritemap_Kihunter_27:
    dw $0008,$0015 
    db $FF 
    dw $610E,$C207 
    db $FA 
    dw $6126,$C3FE 
    db $F4 
    dw $612C,$C3F6 
    db $F8 
    dw $615E,$C3F6 
    db $00 
    dw $616E,$C3F2 
    db $FC 
    dw $6122,$C202 
    db $ED 
    dw $6100,$0018 
    db $FE 
    dw $610E 

Spritemap_Kihunter_28:
    dw $0009,$0014 
    db $FF 
    dw $610E,$C206 
    db $FA 
    dw $6126,$C3FD 
    db $F4 
    dw $612C,$C3F6 
    db $F8 
    dw $615E,$C3F6 
    db $00 
    dw $616E,$C3F2 
    db $FC 
    dw $6122,$C3FE 
    db $EC 
    dw $6103,$C206 
    db $EC 
    dw $6102,$0017 
    db $FE 
    dw $610E 

Spritemap_Kihunter_29:
    dw $0009,$0013 
    db $FF 
    dw $610E,$C205 
    db $FA 
    dw $6126,$C3FC 
    db $F4 
    dw $612C,$C3F6 
    db $F8 
    dw $615E,$C3F6 
    db $00 
    dw $616E,$C3F3 
    db $FC 
    dw $6122,$C3F4 
    db $EC 
    dw $6107,$C204 
    db $EC 
    dw $6105,$0016 
    db $FE 
    dw $610E 

Spritemap_Kihunter_2A:
    dw $0009,$0013 
    db $FF 
    dw $610E,$C205 
    db $FA 
    dw $6126,$C3FC 
    db $F4 
    dw $612C,$C3F6 
    db $F8 
    dw $615E,$C3F6 
    db $00 
    dw $616E,$C205 
    db $EC 
    dw $610A,$C3F5 
    db $EC 
    dw $6107,$C3F1 
    db $FC 
    dw $6122,$0016 
    db $FE 
    dw $610E 

Spritemap_Kihunter_2B:
    dw $0009,$0014 
    db $FF 
    dw $610E,$C206 
    db $FA 
    dw $6126,$C3FD 
    db $F4 
    dw $612C,$C3F6 
    db $F8 
    dw $615E,$C3F6 
    db $00 
    dw $616E,$C3F3 
    db $FC 
    dw $6122,$C206 
    db $EC 
    dw $610C,$C3F6 
    db $EC 
    dw $6107,$0017 
    db $FE 
    dw $610E 

KihunterConstants_XProximityToActivateSwoop:
    dw $0060 

KihunterConstants_fallingAcceleration_hop:
    dw $E000 

KihunterConstants_fallingAcceleration_wingsClipped:
    dw $0000 

KihunterConstants_fallingWingsArcRadius:
    dw $0030 

InitAI_Kihunter:
    LDX.W $0E54 
    LDA.W $0F86,X : ORA.W #$2000 : STA.W $0F86,X 
    LDA.W #$0000 : STA.L $7E7828,X 
    LDA.W #$0001 : STA.W $0F94,X 
    STZ.W $0F90,X 
    LDA.W #InstList_Kihunter_Idling_FacingLeft : STA.W $0F92,X 
    LDA.W #$0000 : STA.W $0FB2,X 
    LDA.W #Function_Kihunter_Winged_IdleFlying : STA.W $0FA8,X 
    LDA.W #$0000 : STA.L $7E7810,X 
    LDA.W #$0001 : STA.L $7E7812,X 
    LDA.W #$0000 : STA.L $7E780C,X 
    LDA.W #$FFFF : STA.L $7E780E,X 
    LDA.W $0F7E,X : SEC : SBC.W #$0010 : STA.L $7E7814,X 
    CLC : ADC.W #$0020 : STA.L $7E7816,X 
    LDA.W $0F7A,X : STA.L $7E7818,X 
    LDA.W $0F7E,X : STA.L $7E781A,X 
    LDA.W $0FB4,X : BPL .return 
    LDA.W #$0001 : STA.L $7E7828,X 
    LDA.W #Function_Kihunter_Wingless_InitialFalling : STA.W $0FA8,X 
    LDA.W #$0000 : STA.L $7E7810,X 
    LDA.W #$0001 : STA.L $7E7812,X 

.return:
    RTL 


InitAI_KihunterWings:
    LDX.W $0E54 
    LDA.W $0F86,X : ORA.W #$2000 : STA.W $0F86,X 
    LDA.W #$0001 : STA.W $0F94,X 
    STZ.W $0F90,X 
    LDA.W #InstList_KihunterWings_FacingLeft : STA.W $0F92,X 
    LDA.W $0F3E,X : STA.W $0F7E,X 
    LDA.W $0F3A,X : STA.W $0F7A,X 
    LDA.W #Function_KihunterWings_Attached : STA.W $0FA8,X 
    LDA.W $0F56,X : STA.W $0F96,X 
    LDA.W $0F58,X : STA.W $0F98,X 
    LDA.W $0F74,X : BPL .return 
    LDA.W $0F86,X : ORA.W #$0200 : STA.W $0F86,X 

.return:
    RTL 


MainAI_Kihunter:
    LDX.W $0E54 
    JMP.W ($0FA8,X) 


MainAI_KihunterWings:
    LDX.W $0E54 
    JMP.W ($0FA8,X) 


Function_Kihunter_Winged_IdleFlying:
    LDA.L $7E7810,X : STA.B $12 
    LDA.L $7E7812,X : STA.B $14 
    JSL.L MoveEnemyDownBy_14_12 
    BCS .collidedWithBlock 
    LDA.W $0F7E,X : CMP.L $7E7814,X : BMI .idleDown 
    CMP.L $7E7816,X : BMI .noChangeY 
    LDA.W #$FFFF : BRA .changeY 


.collidedWithBlock:
    LDA.L $7E7812,X 
    EOR.W #$FFFF 
    INC A 
    BRA .changeY 


.idleDown:
    LDA.W #$0001 

.changeY:
    STA.L $7E7812,X 

.noChangeY:
    LDA.L $7E780C,X : STA.B $12 
    LDA.L $7E780E,X : STA.B $14 
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes 
    BCC .noCollision 
    LDY.W #$0000 
    LDA.L $7E780E,X 
    EOR.W #$FFFF 
    INC A 
    STA.L $7E780E,X 
    BMI .movingLeft 
    LDY.W #$0004 

.movingLeft:
    LDA.W .instListPointers_kihunter,Y : STA.W $0F92,X 
    LDA.W .instListPointers_wings,Y : STA.W $0FD2,X 
    LDA.W #$0001 : STA.W $0F94,X 
    STA.W $0FD4,X 

.noCollision:
    JSL.L AlignEnemyYPositionWIthNonSquareSlope 
    LDA.W $0AF6 : SEC : SBC.W $0F7A,X : STA.B $12 
    BPL + 
    EOR.W #$FFFF 
    INC A 

  + STA.B $14 
    CMP.W KihunterConstants_XProximityToActivateSwoop : BMI + 
    RTL 


  + LDA.W $0AFA : SEC : SBC.W $0F7E,X : CMP.W #$0020 : BPL .outsideRange 
    RTL 


.outsideRange:
    STA.B $18 
    LDA.B $12 : BMI .rightOfSamus 
    LDA.W #$0002 : STA.L $7E7800,X 
    LDA.W #$0000 : STA.L $7E7804,X 
    STA.L $7E7806,X 
    STA.L $7E7808,X 
    LDA.W #$2000 : STA.L $7E780A,X 
    LDA.W #$0080 : STA.W $0FB2,X 
    LDA.W #$0001 : STA.L $7E780E,X 
    LDA.W #$0090 : STA.L $7E781C,X 
    LDY.W #$0004 
    BRA + 


.rightOfSamus:
    LDA.W #$FFFE : STA.L $7E7800,X 
    LDA.W #$0000 : STA.L $7E7804,X 
    STA.L $7E7806,X 
    LDA.W #$FFFF : STA.L $7E7808,X 
    STA.L $7E780E,X 
    LDA.W #$E000 : STA.L $7E780A,X 
    LDA.W #$00FF : STA.W $0FB2,X 
    LDA.W #$00F0 : STA.L $7E781C,X 
    LDY.W #$0000 

  + LDA.W .instListPointers_kihunter,Y : STA.W $0F92,X 
    LDA.W .instListPointers_wings,Y : STA.W $0FD2,X 
    LDA.W #$0001 : STA.W $0F94,X 
    STA.W $0FD4,X 
    LDA.W $0F7A,X : CLC : ADC.B $12 : STA.W $0FAA,X 
    LDA.W $0F7E,X : STA.W $0FAC,X 
    LDA.W #Function_Kihunter_Winged_Swoop : STA.W $0FA8,X 
    LDA.B $18 : STA.L $7E7824,X 
    LDA.B $14 : STA.L $7E7822,X 
    LDA.W #$0000 : STA.L $7E7820,X 
    RTL 


.instListPointers_kihunter:
    dw InstList_Kihunter_Idling_FacingLeft 

.instListPointers_wings:
    dw InstList_KihunterWings_FacingLeft 
    dw InstList_Kihunter_Idling_FacingRight 
    dw InstList_KihunterWings_FacingRight 

Function_Kihunter_Winged_Swoop:
    LDA.L $7E7808,X : BPL .arcingRight 
    LDA.W $0FB2,X : CMP.L $7E781C,X : BPL .noInstListChange 
    BRA + 


.arcingRight:
    LDA.W $0FB2,X : CMP.L $7E781C,X : BMI .noInstListChange 

  + LDA.L $7E7820,X : BNE .noInstListChange 
    LDA.W #$0001 : STA.L $7E7820,X 
    LDY.W #InstList_Kihunter_Swiping_FacingRight 
    LDA.L $7E7808,X : BPL .keepRight 
    LDY.W #InstList_Kihunter_Swiping_FacingLeft 

.keepRight:
    TYA 
    STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 

.noInstListChange:
    LDA.L $7E7808,X : BPL .rightwards 
    LDA.L $7E7806,X : CLC : ADC.L $7E780A,X : STA.L $7E7806,X 
    LDA.L $7E7804,X : ADC.L $7E7808,X : CMP.L $7E7800,X : BPL + 
    LDA.L $7E7800,X 

  + STA.L $7E7804,X 
    LDA.W $0FB2,X : CLC : ADC.L $7E7804,X : STA.W $0FB2,X 
    CMP.W #$0080 : BPL .swoopContinues 
    LDA.W #Function_Kihunter_Winged_IdleFlying : STA.W $0FA8,X 
    RTL 


.rightwards:
    LDA.L $7E7806,X : CLC : ADC.L $7E780A,X : STA.L $7E7806,X 
    LDA.L $7E7804,X : ADC.L $7E7808,X : CMP.L $7E7800,X : BMI + 
    LDA.L $7E7800,X 

  + STA.L $7E7804,X 
    LDA.W $0FB2,X : CLC : ADC.L $7E7804,X : STA.W $0FB2,X 
    CMP.W #$0100 : BMI .swoopContinues 
    LDA.W #Function_Kihunter_Winged_IdleFlying : STA.W $0FA8,X 
    RTL 


.swoopContinues:
    LDA.L $7E7822,X : STA.W $0E32 
    LDA.W $0FB2,X : JSL.L EightBitCosineMultiplication_A0B0B2 
    CLC : ADC.W $0FAA,X : SEC : SBC.W $0F7A,X : STA.B $14 
    STZ.B $12 
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes 
    BCS .collidedHorizontally 
    JSL.L AlignEnemyYPositionWIthNonSquareSlope 
    LDA.L $7E7824,X : STA.W $0E32 
    LDA.W $0FB2,X : JSL.L EightBitNegativeSineMultiplication_A0B0C6 
    CLC : ADC.W $0FAC,X : SEC : SBC.W $0F7E,X : STA.B $14 
    STZ.B $12 
    JSL.L MoveEnemyDownBy_14_12 
    BCS .collidedVertically 
    RTL 


.collidedHorizontally:
    LDA.L $7E7808,X : BPL .arcRight 
    LDA.W #$0000 : STA.L $7E780C,X 
    LDA.W #$0001 : STA.L $7E780E,X 
    BRA .collidedVertically 


.arcRight:
    LDA.W #$0000 : STA.L $7E780C,X 
    LDA.W #$FFFF : STA.L $7E780E,X 

.collidedVertically:
    LDA.W #Function_Kihunter_Winged_BackOff : STA.W $0FA8,X 
    LDA.W #$0000 : STA.L $7E7810,X 
    LDA.W #$FFFF : STA.L $7E7812,X 
    RTL 


Function_Kihunter_Winged_BackOff:
    LDA.L $7E780C,X : STA.B $12 
    LDA.L $7E780E,X : STA.B $14 
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes 
    BCS .collidedWithBlock 
    JSL.L AlignEnemyYPositionWIthNonSquareSlope 
    LDA.L $7E7810,X : STA.B $12 
    LDA.L $7E7812,X : STA.B $14 
    JSL.L MoveEnemyDownBy_14_12 
    BCS .collidedWithBlock 
    LDA.W $0F7E,X : CMP.L $7E781A,X : BMI .collidedWithBlock 
    RTL 


.collidedWithBlock:
    LDA.W #Function_Kihunter_Winged_IdleFlying : STA.W $0FA8,X 
    RTL 


Instruction_Kihunter_SetIdlingInstListsFacingForwards:
    LDY.W #InstList_Kihunter_Idling_FacingLeft 
    LDA.W #InstList_KihunterWings_FacingLeft : STA.B $12 
    LDA.L $7E780E,X : BMI .keepLeft 
    LDY.W #InstList_Kihunter_Idling_FacingRight 
    LDA.W #InstList_KihunterWings_FacingRight : STA.B $12 

.keepLeft:
    TYA 
    STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    LDA.W $0FE8,X : CMP.W #Function_KihunterWings_Attached : BNE .return 
    LDA.B $12 : STA.W $0FD2,X 
    LDA.W #$0001 : STA.W $0FD4,X 

.return:
    RTL 


Function_Kihunter_Wingless_InitialFalling:
    LDA.L $7E7810,X : STA.B $12 
    LDA.L $7E7812,X : STA.B $14 
    JSL.L MoveEnemyDownBy_14_12 
    BCC .notCollidedWithBlock 
    LDA.W #Function_Kihunter_Wingless_PrepareToHop : STA.W $0FA8,X 
    RTL 


.notCollidedWithBlock:
    LDA.L $7E7810,X : CLC : ADC.W KihunterConstants_fallingAcceleration_hop : STA.L $7E7810,X 
    LDA.L $7E7812,X : ADC.W KihunterConstants_fallingAcceleration_wingsClipped : STA.L $7E7812,X 
    RTL 


Function_Kihunter_Wingless_PrepareToHop:
    LDA.W #RTL_A8F5E3 : STA.W $0FA8,X 
    LDA.W #$0000 : STA.L $7E7810,X 
    LDA.W $05E5 : AND.W #$0001 
    CLC : ADC.W #$FFF8 : STA.L $7E7812,X 
    LDA.W $0F7A,X : CMP.W $0AF6 : BPL .rightOfSamus 
    LDA.W #$0000 : STA.L $7E780C,X 
    LDA.W #$0002 : STA.L $7E780E,X 
    LDA.W #InstList_Kihunter_Hop_FacingRight : STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    RTL 


.rightOfSamus:
    LDA.W #$0000 : STA.L $7E780C,X 
    LDA.W #$FFFE : STA.L $7E780E,X 
    LDA.W #InstList_Kihunter_Hop_FacingLeft : STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X ; fallthrough to RTL_A8F5E3

RTL_A8F5E3:
    RTL 


Instruction_Kihunter_SetFunctionToHop:
    PHX 
    LDX.W $0E54 
    LDA.W #Function_Kihunter_Wingless_Hop : STA.W $0FA8,X 
    PLX 
    RTL 


Function_Kihunter_Wingless_Hop:
    LDA.L $7E7810,X : STA.B $12 
    LDA.L $7E7812,X : STA.B $14 
    JSL.L MoveEnemyDownBy_14_12 
    BCS .collidedVertically 
    LDA.L $7E780C,X : STA.B $12 
    LDA.L $7E780E,X : STA.B $14 
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes 
    BCS .collidedHorizontally 
    JSL.L AlignEnemyYPositionWIthNonSquareSlope 
    LDA.L $7E7810,X : CLC : ADC.W KihunterConstants_fallingAcceleration_hop : STA.L $7E7810,X 
    LDA.L $7E7812,X : ADC.W KihunterConstants_fallingAcceleration_wingsClipped : STA.L $7E7812,X 
    RTL 


.collidedHorizontally:
    LDA.L $7E780E,X 
    EOR.W #$FFFF 
    INC A 
    STA.L $7E780E,X 
    RTL 


.collidedVertically:
    LDA.L $7E7812,X : BMI .hitCeiling 
    LDA.W #$0000 : STA.L $7E7810,X 
    LDA.W #$FFFC : STA.L $7E7812,X 
    LDA.W #RTL_A8F5E3 : STA.W $0FA8,X 
    LDA.W #$000C : STA.L $7E781E,X 
    LDY.W #InstList_Kihunter_LandedFromHop_FacingLeft 
    LDA.W $0F92,X : CMP.W #InstList_Kihunter_Hop_FacingRight : BMI .keepLeft 
    LDY.W #InstList_Kihunter_LandedFromHop_FacingRight 

.keepLeft:
    TYA 
    STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    RTL 


.hitCeiling:
    LDA.W #$0001 : STA.L $7E7812,X 
    RTL 


Instruction_Kihunter_SetFunctionTo_Wingless_Thinking:
    PHX 
    LDX.W $0E54 
    LDA.W #Function_Kihunter_Wingless_Thinking : STA.W $0FA8,X 
    PLX 
    RTL 


Function_Kihunter_Wingless_Thinking:
    LDA.L $7E781E,X 
    DEC A 
    STA.L $7E781E,X 
    BNE .return 
    LDY.W #Function_Kihunter_Wingless_PrepareToHop 
    LDA.W $0F7A,X : SEC : SBC.W $0AF6 : BPL + 
    EOR.W #$FFFF 
    INC A 

  + CMP.W #$0060 : BPL .keepHop 
    LDY.W #Function_Kihunter_Wingless_FireAcidSpit 

.keepHop:
    TYA 
    STA.W $0FA8,X 

.return:
    RTL 


Function_Kihunter_Wingless_FireAcidSpit:
    LDY.W #InstList_Kihunter_AcidSpitAttack_FacingLeft 
    LDA.W $0F7A,X : CMP.W $0AF6 : BPL .keepLeft 
    LDY.W #InstList_Kihunter_AcidSpitAttack_FacingRight 

.keepLeft:
    TYA 
    STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    LDA.W #RTL_A8F5E3 : STA.W $0FA8,X 
    RTL 


Instruction_Kihunter_FireAcidSpitLeft:
    PHY 
    LDY.W #EnemyProjectile_KiHunterAcidSpit_Left 
    BRA FireAcidSpit 


Instruction_Kihunter_FireAcidSpitRight:
    PHY 
    LDY.W #EnemyProjectile_KiHunterAcidSpit_Right ; fallthrough to FireAcidSpit

FireAcidSpit:
    LDA.W #$004C : JSL.L QueueSound_Lib2_Max6 
    LDX.W $0E54 
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    LDA.W #$0018 : STA.L $7E781E,X 
    PLY 
    RTL 


Function_KihunterWings_Attached:
    LDA.W $0F3A,X : STA.W $0F7A,X 
    LDA.W $0F3E,X : STA.W $0F7E,X 
    RTL 


RTL_A8F700:
    RTL 


EnemyShot_Kihunter:
    JSL.L NormalEnemyShotAI 
    LDX.W $0E54 
    LDA.W $0F8C,X : BEQ .dead 
    CMP.W $0FF4,X : BEQ .clipWings 
    BMI .clipWings 
    LDA.W $0F8A,X : STA.W $0FCA,X 
    LDA.W $0F9E,X : STA.W $0FDE,X 
    LDA.W $0FA0,X : STA.W $0FE0,X 
    LDA.W $0F9C,X : STA.W $0FDC,X 

.returnUpper:
    RTL 


.dead:
    LDA.W #$0200 : STA.W $0FC6,X 
    RTL 


.clipWings:
    LDA.L $7E7828,X : BNE .returnUpper 
    LDA.W #$0001 : STA.L $7E7828,X 
    LDA.W #Function_Kihunter_Wingless_InitialFalling : STA.W $0FA8,X 
    LDA.W #$0000 : STA.L $7E7810,X 
    LDA.W #$0001 : STA.L $7E7812,X 
    PHX 
    TXA 
    CLC : ADC.W #$0040 : STA.W $0E54 
    TAX 
    LDA.W $0FA8,X : CMP.W #Function_KihunterWings_Falling : BEQ .returnLower 
    LDA.W $0F7E,X : STA.L $7E780E,X 
    LDA.W $0F7A,X : STA.L $7E7810,X 
    JSR.W DetermineFallingKihunterWingsSpeedTableIndexResetValue 
    JSR.W DetermineFallingKihunterWingsLeftArcCenterOffsets 
    JSR.W DetermineFallingKihunterWingsRightArcCenterOffsets 
    LDA.W #$E000 : STA.W $0FB2,X 
    LDA.W #Function_KihunterWings_Falling : STA.W $0FA8,X 
    LDA.W #Function_KihunterWings_Falling_DriftingLeft : STA.L $7E7800,X 
    LDA.L $7E780E,X : SEC : SBC.L $7E7816,X : STA.L $7E780C,X 
    LDA.W $0F7A,X : STA.L $7E780A,X 
    LDA.L $7E7814,X : STA.W $0FAA,X 
    LDA.W #InstList_KihunterWings_Falling : STA.W $0F92,X 
    LDA.W #Spritemap_CommonA8_Nothing : STA.W $0F8E,X 
    LDA.W #$0001 : STA.W $0F94,X 
    STZ.W $0F90,X 
    LDA.W $0F86,X : ORA.W #$0800 : STA.W $0F86,X 

.returnLower:
    PLA 
    STA.W $0E54 
    RTL 


Function_KihunterWings_Falling:
    LDX.W $0E54 
    LDA.L $7E7800,X : STA.B $12 
    JMP.W ($0012) 


Function_KihunterWings_Falling_DriftingLeft:
    LDX.W $0E54 
    LDA.W $0FAA,X : AND.W #$FF00 
    XBA 
    ASL #3
    TAY 
    LDA.W $0FB2,X : CLC : ADC.W CommonEnemySpeeds_QuadraticallyIncreasing+5,Y : STA.W $0FB2,X 
    LDA.W KihunterConstants_fallingWingsArcRadius : AND.W #$00FF : STA.W $0E32 
    LDA.W $0FB2,X 
    XBA 
    AND.W #$00FF 
    JSL.L EightBitNegativeSineMultiplication_A0B0C6 
    SEC : SBC.L $7E7808,X : CLC : ADC.L $7E780C,X : STA.W $0F7E,X 
    LDA.W KihunterConstants_fallingWingsArcRadius : AND.W #$00FF : STA.W $0E32 
    LDA.W $0FB2,X 
    XBA 
    AND.W #$00FF 
    JSL.L EightBitCosineMultiplication_A0B0B2 
    SEC : SBC.L $7E7806,X : CLC : ADC.L $7E780A,X : STA.W $0F7A,X 
    LDA.W $0FB2,X : CMP.W #$C000 : BPL + 
    JSR.W SetupFallingKihunterWingsDriftingRight 
    RTL 


  + LDA.W $0FAA,X : SEC : SBC.W #$0180 : BPL .return 
    LDA.W #$0100 

.return:
    STA.W $0FAA,X 
    RTL 


DetermineFallingKihunterWingsLeftArcCenterOffsets:
    LDX.W $0E54 
    LDA.W KihunterConstants_fallingWingsArcRadius : AND.W #$00FF : STA.W $0E32 
    LDA.W #$E000 
    XBA 
    JSL.L EightBitCosineMultiplication_A0B0B2 
    STA.L $7E7806,X 
    LDA.W KihunterConstants_fallingWingsArcRadius : AND.W #$00FF : STA.W $0E32 
    LDA.W #$E000 
    XBA 
    JSL.L EightBitNegativeSineMultiplication_A0B0C6 
    STA.L $7E7808,X 
    RTS 


DetermineFallingKihunterWingsRightArcCenterOffsets:
    LDX.W $0E54 
    LDA.W KihunterConstants_fallingWingsArcRadius : AND.W #$00FF : STA.W $0E32 
    LDA.W #$A000 
    XBA 
    JSL.L EightBitCosineMultiplication_A0B0B2 
    STA.L $7E7802,X 
    LDA.W KihunterConstants_fallingWingsArcRadius : AND.W #$00FF : STA.W $0E32 
    LDA.W #$A000 
    XBA 
    JSL.L EightBitNegativeSineMultiplication_A0B0C6 
    STA.L $7E7804,X 
    RTS 


Function_KihunterWings_Falling_DriftingRight:
    LDX.W $0E54 
    LDA.W $0FAA,X : AND.W #$FF00 
    XBA 
    ASL #3
    TAY 
    LDA.W $0FB2,X : CLC : ADC.W CommonEnemySpeeds_QuadraticallyIncreasing+1,Y : STA.W $0FB2,X 
    LDA.W KihunterConstants_fallingWingsArcRadius : AND.W #$00FF : STA.W $0E32 
    LDA.W $0FB2,X 
    XBA 
    AND.W #$00FF 
    JSL.L EightBitNegativeSineMultiplication_A0B0C6 
    SEC : SBC.L $7E7804,X : CLC : ADC.L $7E780C,X : SEC : SBC.W $0F7E,X : STA.B $14 
    STZ.B $12 
    JSL.L MoveEnemyDownBy_14_12 
    BCS .collidedVertically 
    LDA.W KihunterConstants_fallingWingsArcRadius : AND.W #$00FF : STA.W $0E32 
    LDA.W $0FB2,X 
    XBA 
    AND.W #$00FF 
    JSL.L EightBitCosineMultiplication_A0B0B2 
    SEC : SBC.L $7E7802,X : CLC : ADC.L $7E780A,X : STA.W $0F7A,X 
    LDA.W $0FB2,X : CMP.W #$C000 : BMI + 
    JSR.W SetupFallingKihunterWingsDriftingLeft 
    RTL 


  + LDA.W $0FAA,X : SEC : SBC.W #$0180 : BPL .return 
    LDA.W #$0100 

.return:
    STA.W $0FAA,X 
    RTL 


.collidedVertically:
    LDA.W $0F86,X : ORA.W #$0200 : STA.W $0F86,X 
    LDA.L $7E7810,X : STA.W $0F7A,X 
    LDA.L $7E780E,X : STA.W $0F7E,X 
    BRA .return 


SetupFallingKihunterWingsDriftingLeft:
    LDA.W #Function_KihunterWings_Falling_DriftingLeft : STA.L $7E7800,X 
    LDA.L $7E7814,X : STA.W $0FAA,X 
    LDA.W #$E000 : STA.W $0FB2,X 
    LDA.W $0F7A,X : STA.L $7E780A,X 
    LDA.W $0F7E,X : STA.L $7E780C,X 
    RTS 


SetupFallingKihunterWingsDriftingRight:
    LDA.W #Function_KihunterWings_Falling_DriftingRight : STA.L $7E7800,X 
    LDA.L $7E7814,X : STA.W $0FAA,X 
    LDA.W #$A000 : STA.W $0FB2,X 
    LDA.W $0F7A,X : STA.L $7E780A,X 
    LDA.W $0F7E,X : STA.L $7E780C,X 
    RTS 


DetermineFallingKihunterWingsSpeedTableIndexResetValue:
    LDX.W $0E54 
    LDA.W #$0000 : STA.L $7E7814,X 
    STA.W $0FAA,X 

.loop:
    LDA.L $7E7814,X : CLC : ADC.W #$0180 : STA.L $7E7814,X 
    AND.W #$FF00 
    XBA 
    ASL #3
    TAY 
    LDA.W $0FAE,X : CLC : ADC.W CommonEnemySpeeds_QuadraticallyIncreasing+1,Y : STA.W $0FAE,X 
    CMP.W #$2000 : BMI .loop 
    RTS 


Freespace_BankA8_F9BE: 
; $642 bytes
