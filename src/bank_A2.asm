
org $A28000


CommonA2_GrappleAI_NoInteraction:
    JSL.L GrappleAI_SwitchEnemyAIToMainAI 
    RTL 


CommonA2_GrappleAI_SamusLatchesOn:
    JSL.L GrappleAI_SamusLatchesOnWithGrapple 
    RTL 


CommonA2_GrappleAI_KillEnemy:
    JSL.L GrappleAI_EnemyGrappleDeath 
    RTL 


CommonA2_GrappleAI_CancelGrappleBeam:
    JSL.L GrappleAI_SwitchToFrozenAI 
    RTL 


CommonA2_GrappleAI_SamusLatchesOn_NoInvincibility:
    JSL.L GrappleAI_SamusLatchesOnWithGrapple_NoInvincibility 
    RTL 


UNUSED_CommonA2_GrappleAI_SamusLatchesOn_ParalyzeEnemy_A28019:
    JSL.L GrappleAI_SamusLatchesOnWithGrapple_ParalyzeEnemy 
    RTL 


CommonA2_GrappleAI_HurtSamus:
    JSL.L GrappleAI_SwitchToFrozenAI_duplicate 
    RTL 


CommonA2_NormalEnemyTouchAI:
    JSL.L NormalEnemyTouchAI 
    RTL 


CommonA2_NormalTouchAI_NoDeathCheck:
    JSL.L NormalEnemyTouchAI_NoDeathCheck_External 
    RTL 


CommonA2_NormalEnemyShotAI:
    JSL.L NormalEnemyShotAI 
    RTL 


CommonA2_NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic:
    JSL.L NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External 
    RTL 


CommonA2_NormalEnemyPowerBombAI:
    JSL.L NormalEnemyPowerBombAI 
    RTL 


CommonA2_NormalEnemyPowerBombAI_NoDeathCheck:
    JSL.L NormalEnemyPowerBombAI_NoDeathCheck_External 
    RTL 


CommonA2_NormalEnemyFrozenAI:
    JSL.L NormalEnemyFrozenAI 
    RTL 


CommonA2_CreateADudShot_JSL:
    JSL.L CreateADudShot 
    RTL 


RTS_A2804B:
    RTS 


RTL_A2804C:
    RTL 


Spritemap_CommonA2_Nothing:
    dw $0000 

ExtendedSpritemap_CommonA2_Nothing:
    dw $0001,$0000,$0000 
    dw Spritemap_CommonA2_Nothing 
    dw Hitbox_CommonA2_Nothing 

Hitbox_CommonA2_Nothing:
    dw $0001,$0000,$0000,$0000,$0000 
    dw CommonA2_NormalEnemyTouchAI 
    dw CommonA2_NormalEnemyShotAI 

InstList_CommonA2_DeleteEnemy:
    dw Instruction_CommonA2_DeleteEnemy 

NOPNOP_A28069:
    NOP #2
    Instruction_CommonA2_Enemy0FB2_InY:
    LDA.W $0000,Y : STA.W $0FB2,X 
    INY #2
    RTL 


Instruction_CommonA2_SetEnemy0FB2ToRTS:
    LDA.W #RTS_A2807B : STA.W $0FB2,X 
    RTL 


RTS_A2807B:
    RTS 


Instruction_CommonA2_DeleteEnemy:
    LDA.W $0F86,X : ORA.W #$0200 : STA.W $0F86,X 
    PLA 
    PEA.W  ProcessEnemyInstructions_return-1 
    RTL 


Instruction_CommonA2_CallFunctionInY:
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


Instruction_CommonA2_CallFunctionInY_WithA:
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
UNUSED_Instruction_CommonA2_CallExternalFunctionInY_A280B5:
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


UNUSED_Inst_CommonA2_CallExternalFunctionInY_WithA_A280CE:
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


Instruction_CommonA2_GotoY:
    LDA.W $0000,Y 
    TAY 
    RTL 


Instruction_CommonA2_GotoY_PlusY:
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


Instruction_CommonA2_DecrementTimer_GotoYIfNonZero:
    DEC.W $0F90,X 
    BNE Instruction_CommonA2_GotoY 
    INY #2
    RTL 


Instruction_CommonA2_DecrementTimer_GotoYIfNonZero_duplicate:
    DEC.W $0F90,X 
    BNE Instruction_CommonA2_GotoY 
    INY #2
    RTL 


Instruction_CommonA2_DecrementTimer_GotoY_PlusY_IfNonZero:
    SEP #$20 
    DEC.W $0F90,X 
    REP #$20 
    BNE Instruction_CommonA2_GotoY_PlusY 
    INY 
    RTL 


Instruction_CommonA2_TimerInY:
    LDA.W $0000,Y : STA.W $0F90,X 
    INY #2
    RTL 


Instruction_CommonA2_SkipNextInstruction:
    INY #2
    RTL 


Instruction_CommonA2_Sleep:
    DEY #2
    TYA 
    STA.W $0F92,X 
    PLA 
    PEA.W ProcessEnemyInstructions_return-1 
    RTL 


Instruction_CommonA2_WaitYFrames:
    LDA.W $0000,Y : STA.W $0F94,X 
    INY #2
    TYA 
    STA.W $0F92,X 
    PLA 
    PEA.W ProcessEnemyInstructions_return-1 
    RTL 


Instruction_CommonA2_TransferYBytesInYToVRAM:
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


Instruction_CommonA2_EnableOffScreenProcessing:
    LDA.W $0F86,X : ORA.W #$0800 : STA.W $0F86,X 
    RTL 


Instruction_CommonA2_DisableOffScreenProcessing:
    LDA.W $0F86,X : AND.W #$F7FF : STA.W $0F86,X 
    RTL 


CommonA2EnemySpeeds_LinearlyIncreasing:
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

CommonA2EnemySpeeds_QuadraticallyIncreasing:
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

Palette_Boyon:
    dw $3800,$4BBE,$06B9,$00EA,$0065,$173A,$0276,$01F2 
    dw $014D,$0000,$0000,$0000,$0000,$0000,$0000,$0000 

InstList_Boyon_Idle_0:
    dw Instruction_Common_DisableOffScreenProcessing 
    dw RTL_A288C5 

InstList_Boyon_Idle_1:
    dw $000A 
    dw Spritemap_Boyon_0 
    dw $000A 
    dw Spritemap_Boyon_1 
    dw $000A 
    dw Spritemap_Boyon_2 
    dw $000A 
    dw Spritemap_Boyon_1 
    dw Instruction_CommonA2_GotoY 
    dw InstList_Boyon_Idle_1 

InstList_Boyon_Bouncing_0:
    dw Instruction_Common_EnableOffScreenProcessing 
    dw Instruction_Boyon_88C6 

InstList_Boyon_Bouncing_1:
    dw $0005 
    dw Spritemap_Boyon_3 
    dw $0005 
    dw Spritemap_Boyon_4 
    dw $0005 
    dw Spritemap_Boyon_5 
    dw $0005 
    dw Spritemap_Boyon_6 
    dw $0005 
    dw Spritemap_Boyon_5 
    dw $0005 
    dw Spritemap_Boyon_4 
    dw Instruction_Common_GotoY 
    dw InstList_Boyon_Bouncing_1 

BoyonData_speedMultipliers:
    dw $0001,$0002,$0004,$0008,$000A,$000D,$0010,$0014 

BoyonData_jumpHeights:
    dw $3000,$4000,$5000,$6000,$7000,$8000,$9000,$A000 
    dw $B000 

BoyonData_speedTable:
    db $00,$01,$03,$06,$0A,$0F,$15,$1C,$24,$2D,$37,$42,$4E,$5B,$69,$78 
    db $88,$99,$AB,$BE,$D2,$E7,$FD 

BoyonData_bounceFunctionPointers:
    dw Function_Boyon_Falling 
    dw Function_Boyon_Jumping 

InitAI_Boyon:
    LDX.W $0E54 
    LDA.W #Spritemap_CommonA2_Nothing : STA.W $0F8E,X 
    JSR.W SetBoyonInstList 
    LDA.W #$0001 : STA.L $7E7802,X 
    LDA.W $0FB4,X : AND.W #$00FF 
    ASL A 
    TAY 
    LDA.W BoyonData_speedMultipliers,Y : STA.W $0FA8,X 
    LDA.W $0FB5,X : AND.W #$00FF 
    ASL A 
    TAY 
    LDA.W BoyonData_jumpHeights,Y : STA.W $0FAC,X 
    STZ.W $0FAE,X 
    STZ.W $0FB0,X 
    STZ.W $0FB2,X 
    RTL 


CalculateInitialBounceSpeed:
    PHP 

.loop:
    LDY.W $0FB0,X 
    SEP #$20 
    LDA.W BoyonData_speedTable,Y 
    CPY.W #$0017 
    BMI + 
    LDA.B #$FF 

  + STA.W $4202 
    LDA.W $0FA8,X : STA.W $4203 
    NOP #3
    REP #$20 
    LDA.W $4216 : STA.W $0FAA,X 
    CLC : ADC.W $0FAE,X : STA.W $0FAE,X 
    INC.W $0FB0,X 
    CMP.W $0FAC,X 
    BMI .loop 
    LDA.W $0FB0,X : STA.L $7E7800,X 
    LDA.W #$0001 : STA.L $7E7804,X 
    STA.L $7E7808,X 
    PLP 
    RTS 


MainAI_Boyon:
    LDX.W $0E54 
    LDA.L $7E780A,X : BNE .notJumping 
    JSR.W CalculateInitialBounceSpeed 
    LDA.W #$0001 : STA.L $7E780A,X 
    RTL 


.notJumping:
    LDA.W $0FA8,X : STA.L $7E7806,X 
    JSR.W CheckIfSamusIsInProximity 
    BNE .SamusInProximity 
    LDA.L $7E7804,X : BEQ .bouncing 
    LDA.L $7E7808,X : BNE .return 
    LDA.W #$0001 : STA.L $7E7808,X 
    JSR.W SetBoyonInstList 
    BRA .return 


.SamusInProximity:
    LDA.W #$0000 : STA.L $7E7804,X 
    STA.L $7E7808,X 
    LDA.W $0FB2,X : BNE .bouncing 
    LDA.W #$0001 : STA.W $0FB2,X 
    JSR.W SetBoyonBouncingInstList 

.bouncing:
    LDX.W $0E54 
    LDA.L $7E7806,X : STA.W $0FA8,X 
    LDA.L $7E7802,X 
    ASL A 
    TAX 
    JSR.W (BoyonData_bounceFunctionPointers,X) 

.return:
    RTL 


Function_Boyon_Falling:
    LDX.W $0E54 
    INC.W $0FB0,X 
    LDY.W $0FB0,X 
    SEP #$20 
    LDA.W BoyonData_speedTable,Y 
    CPY.W #$0017 
    BMI .lessThan17 
    LDA.B #$FF 

.lessThan17:
    STA.W $4202 
    LDA.W $0FA8,X : STA.W $4203 
    NOP #3
    REP #$20 
    LDA.W $4216 : STA.W $0FAA,X 
    XBA 
    AND.W #$00FF 
    CLC : ADC.W $0F7E,X : STA.W $0F7E,X 
    LDA.W $0FB0,X 
    CMP.L $7E7800,X 
    BMI .return 
    LDA.W #$0001 : STA.L $7E7802,X 
    LDA.W #$0001 : STA.L $7E7804,X 
    STZ.W $0FB2,X 

.return:
    RTS 


Function_Boyon_Jumping:
    LDX.W $0E54 
    LDY.W $0FB0,X 
    SEP #$20 
    LDA.W BoyonData_speedTable,Y 
    CPY.W #$0017 
    BMI .lessThan17 
    LDA.B #$FF 

.lessThan17:
    STA.W $4202 
    LDA.W $0FA8,X : STA.W $4203 
    NOP #3
    REP #$20 
    LDA.W $4216 : STA.W $0FAA,X 
    XBA 
    AND.W #$00FF 
    EOR.W #$FFFF 
    INC A 
    CLC : ADC.W $0F7E,X : STA.W $0F7E,X 
    DEC.W $0FB0,X 
    BMI .doneJumping 
    BRA .return 


.doneJumping:
    LDA.W #$0000 : STA.L $7E7802,X 

.return:
    RTS 


CheckIfSamusIsInProximity:
    LDX.W $0E54 
    LDA.W $0FB6,X 
    JSL.L IsSamusWithinAPixelColumnsOfEnemy 
    RTS 


SetBoyonInstList:
    LDX.W $0E54 
    LDA.W #InstList_Boyon_Idle_0 : STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    STZ.W $0F90,X 
    RTS 


SetBoyonBouncingInstList:
    LDX.W $0E54 
    LDA.W #InstList_Boyon_Bouncing_0 : STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    STZ.W $0F90,X 
    RTS 


RTL_A288C5:
    RTL 


Instruction_Boyon_88C6:
    LDX.W $0E54 
    LDA.W #$0000 : STA.L $7E7804,X 
    LDA.W #$000E 
    JSL.L QueueSound_Lib2_Max6 
    RTL 


RTL_A288D8:
    RTL 


RTL_A288D9:
    RTL 


Spritemap_Boyon_0:
    dw $0001,$C3F8 
    db $F8 
    dw $2100 

Spritemap_Boyon_1:
    dw $0001,$C3F8 
    db $F8 
    dw $2102 

Spritemap_Boyon_2:
    dw $0001,$C3F8 
    db $F8 
    dw $2104 

Spritemap_Boyon_3:
    dw $0001,$C3F8 
    db $F8 
    dw $2106 

Spritemap_Boyon_4:
    dw $0001,$C3F8 
    db $F8 
    dw $2108 

Spritemap_Boyon_5:
    dw $0001,$C3F8 
    db $F8 
    dw $210A 

Spritemap_Boyon_6:
    dw $0001,$C3F8 
    db $F8 
    dw $210C 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Boyon_A2890B:
    dw $0001,$C3F8 
    db $F8 
    dw $210E 
endif ; !FEATURE_KEEP_UNREFERENCED

Palette_Stoke:
    dw $3800,$3DB3,$292E,$1486,$1840,$3D92,$38CA,$1C61 
    dw $24A7,$24A7,$2063,$1840,$0800,$0000,$0000,$0000 

InstList_Stoke_MovingLeft_0:
    dw Instruction_Stoke_SetMovingLeft 

InstList_Stoke_MovingLeft_1:
    dw $0008 
    dw Spritemap_Stoke_0 
    dw $0010 
    dw Spritemap_Stoke_1 
    dw $0008 
    dw Spritemap_Stoke_2 
    dw $0008 
    dw Spritemap_Stoke_3 
    dw Instruction_Common_GotoY 
    dw InstList_Stoke_MovingLeft_1 

InstList_Stoke_AttackingLeft:
    dw $0010 
    dw Spritemap_Stoke_2 
    dw Instruction_Stoke_SpawnProjectileWithDirectionInY 
    dw $0000,$0010 
    dw Spritemap_Stoke_4 
    dw Instruction_Common_GotoY 
    dw InstList_Stoke_MovingLeft_0 

InstList_Stoke_MovingRight_0:
    dw Instruction_Stoke_SetMovingRight 

InstList_Stoke_MovingRight_1:
    dw $0008 
    dw Spritemap_Stoke_5 
    dw $0010 
    dw Spritemap_Stoke_6 
    dw $0008 
    dw Spritemap_Stoke_7 
    dw $0008 
    dw Spritemap_Stoke_8 
    dw Instruction_Common_GotoY 
    dw InstList_Stoke_MovingRight_1 

InstList_Stoke_AttackingRight:
    dw $0010 
    dw Spritemap_Stoke_7 
    dw Instruction_Stoke_SpawnProjectileWithDirectionInY 
    dw $0001,$0010 
    dw Spritemap_Stoke_9 
    dw Instruction_Common_GotoY 
    dw InstList_Stoke_MovingRight_0 

Instruction_Stoke_SpawnProjectileWithDirectionInY:
    PHY 
    LDA.W $0000,Y 
    LDX.W $0E54 
    LDY.W #UNUSED_EnemyProjectile_Stoke_86DBF2 
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    PLY 
    INY #2
    RTL 


Instruction_Stoke_SetMovingLeft:
    LDX.W $0E54 
    LDA.W #Function_Stoke_MovingLeft : STA.W $0FB2,X 
    STZ.W $0FB0,X 
    RTL 


Instruction_Stoke_SetMovingRight:
    LDX.W $0E54 
    LDA.W #Function_Stoke_MovingRight : STA.W $0FB2,X 
    LDA.W #$0001 : STA.W $0FB0,X 
    RTL 


InitAI_Stoke:
    LDX.W $0E54 
    LDA.W #Spritemap_CommonA2_Nothing : STA.W $0F8E,X 
    LDA.W $0FB6,X 
    ASL #3
    TAY 
    LDA.W CommonEnemySpeeds_LinearlyIncreasing,Y : STA.W $0FAA,X 
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+2,Y : STA.W $0FA8,X 
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+4,Y : STA.W $0FAE,X 
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+6,Y : STA.W $0FAC,X 
    JSR.W SetStokeMovingLeftInstList 
    LDA.W #Function_Stoke_MovingLeft : STA.W $0FB2,X 
    LDA.W $0FB4,X : STA.W $0FB0,X 
    BEQ .return 
    JSR.W SetStokeMovingRightInstList 
    LDA.W #Function_Stoke_MovingRight : STA.W $0FB2,X 

.return:
    RTL 


MainAI_Stoke:
    LDX.W $0E54 
    JSR.W ($0FB2,X) 
    RTL 


SetStokeMovingLeftInstList:
    LDX.W $0E54 
    LDA.W #$0001 : STA.W $0F94,X 
    STZ.W $0F90,X 
    LDA.W #InstList_Stoke_MovingLeft_0 : STA.W $0F92,X 
    RTS 


SetStokeAttackingLeftInstList:
    LDX.W $0E54 
    LDA.W #$0001 : STA.W $0F94,X 
    STZ.W $0F90,X 
    LDA.W #InstList_Stoke_AttackingLeft : STA.W $0F92,X 
    RTS 


SetStokeMovingRightInstList:
    LDX.W $0E54 
    LDA.W #$0001 : STA.W $0F94,X 
    STZ.W $0F90,X 
    LDA.W #InstList_Stoke_MovingRight_0 : STA.W $0F92,X 
    RTS 


SetStokeAttackingRightInstList:
    LDX.W $0E54 
    LDA.W #$0001 : STA.W $0F94,X 
    STZ.W $0F90,X 
    LDA.W #InstList_Stoke_AttackingRight : STA.W $0F92,X 
    RTS 


Function_Stoke_MovingLeft:
    LDX.W $0E54 
    LDA.W $0FAE,X : STA.B $14 
    LDA.W $0FAC,X : STA.B $12 
    JSR.W StokeMovement 
    JSR.W DecideWhetherToAttack 
    BCC .return 
    JSR.W SetStokeAttackingLeftInstList 

.return:
    RTS 


Function_Stoke_MovingRight:
    LDX.W $0E54 
    LDA.W $0FAA,X : STA.B $14 
    LDA.W $0FA8,X : STA.B $12 
    JSR.W StokeMovement 
    JSR.W DecideWhetherToAttack 
    BCC .return 
    JSR.W SetStokeAttackingRightInstList 

.return:
    RTS 


RTS_A28A75:
    RTS 


StokeMovement:
    LDX.W $0E54 
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes 
    BCC .notCollidedWithWall 
    JSR.W TurnStokeAround 
    BRA .return 


.notCollidedWithWall:
    LDA.W #$0002 : STA.B $14 
    STZ.B $12 
    JSL.L CheckForVerticalSolidBlockCollision 
    BCS .return 
    JSR.W TurnStokeAround 

.return:
    RTS 


TurnStokeAround:
    LDX.W $0E54 
    JSR.W SetStokeMovingLeftInstList 
    LDA.W $0FB0,X 
    EOR.W #$0001 
    BEQ .return 
    JSR.W SetStokeMovingRightInstList 

.return:
    RTS 


DecideWhetherToAttack:
    LDX.W $0E54 
    JSL.L GenerateRandomNumber 
    LDA.W $05E5 : CLC : ADC.W $0FA4,X : AND.W #$00FF 
    CMP.W #$0002 
    BPL .returnNoAttack 
    LDA.W #RTS_A28A75 : STA.W $0FB2,X 
    SEC 
    BRA .return 


.returnNoAttack:
    CLC 

.return:
    RTS 


RTL_A28AC8:
    RTL 


RTL_A28AC9:
    RTL 


Spritemap_Stoke_0:
    dw $0002,$C3FE 
    db $F8 
    dw $2101,$C3F6 
    db $F8 
    dw $2100 

Spritemap_Stoke_1:
    dw $0003,$01FE 
    db $F0 
    dw $210F,$C3FE 
    db $F8 
    dw $2104,$C3F6 
    db $F8 
    dw $2103 

Spritemap_Stoke_2:
    dw $0002,$C3F6 
    db $F8 
    dw $2106,$C3FE 
    db $F8 
    dw $2101 

Spritemap_Stoke_3:
    dw $0002,$C3FE 
    db $F8 
    dw $2101,$C3F6 
    db $F8 
    dw $2108 

Spritemap_Stoke_4:
    dw $0004,$01FE 
    db $F0 
    dw $210E,$01F6 
    db $F0 
    dw $210D,$C3FE 
    db $F8 
    dw $210B,$C3F6 
    db $F8 
    dw $210A 

Spritemap_Stoke_5:
    dw $0002,$C3F2 
    db $F8 
    dw $6101,$C3FA 
    db $F8 
    dw $6100 

Spritemap_Stoke_6:
    dw $0003,$01FA 
    db $F0 
    dw $610F,$C3F2 
    db $F8 
    dw $6104,$C3FA 
    db $F8 
    dw $6103 

Spritemap_Stoke_7:
    dw $0002,$C3FA 
    db $F8 
    dw $6106,$C3F2 
    db $F8 
    dw $6101 

Spritemap_Stoke_8:
    dw $0002,$C3F2 
    db $F8 
    dw $6101,$C3FA 
    db $F8 
    dw $6108 

Spritemap_Stoke_9:
    dw $0004,$01FA 
    db $F0 
    dw $610E,$0002 
    db $F0 
    dw $610D,$C3F2 
    db $F8 
    dw $610B,$C3FA 
    db $F8 
    dw $610A 

Palette_MamaTurtle_BabyTurtle:
    dw $3800,$4B9C,$3694,$08E7,$0884,$42F7,$2A52,$19AD 
    dw $1129,$7FFF,$033B,$0216,$0113,$7FFF,$03FF,$000D 

InstList_BabyTurtle_CrawlingLeft:
    dw Instruction_BabyTurtle_Crawl 
    dw $000A 
    dw Spritemap_BabyTurtle_FacingLeft_0 
    dw $000A 
    dw Spritemap_BabyTurtle_FacingLeft_1 
    dw Instruction_BabyTurtle_Crawl 
    dw $000A 
    dw Spritemap_BabyTurtle_FacingLeft_2 
    dw $000A 
    dw Spritemap_BabyTurtle_FacingLeft_3 
    dw Instruction_BabyTurtle_Crawl 
    dw $000A 
    dw Spritemap_BabyTurtle_FacingLeft_0 
    dw $000A 
    dw Spritemap_BabyTurtle_FacingLeft_1 
    dw Instruction_BabyTurtle_Crawl 
    dw $000A 
    dw Spritemap_BabyTurtle_FacingLeft_2 
    dw $000A 
    dw Spritemap_BabyTurtle_FacingLeft_3 
    dw Instruction_BabyTurtle_Crawl 
    dw $000A 
    dw Spritemap_BabyTurtle_FacingLeft_0 
    dw $000A 
    dw Spritemap_BabyTurtle_FacingLeft_1 
    dw Instruction_BabyTurtle_Crawl 
    dw $000A 
    dw Spritemap_BabyTurtle_FacingLeft_5 
    dw $000A 
    dw Spritemap_BabyTurtle_FacingLeft_6 
    dw Instruction_BabyTurtle_Crawl 
    dw $000A 
    dw Spritemap_BabyTurtle_FacingLeft_0 
    dw $000A 
    dw Spritemap_BabyTurtle_FacingLeft_4 
    dw Instruction_BabyTurtle_Crawl 
    dw $000A 
    dw Spritemap_BabyTurtle_FacingLeft_5 
    dw $000A 
    dw Spritemap_BabyTurtle_FacingLeft_6 
    dw Instruction_BabyTurtle_LoopOrTurnAroundIfMovedTooFar 

InstList_BabyTurtle_Spinning:
    dw $0001 
    dw Spritemap_BabyTurtle_FacingLeft_7 
    dw Instruction_MamaTurtle_PlaySpinningSFX 
    dw $0004 
    dw Spritemap_BabyTurtle_FacingLeft_7 
    dw $0005 
    dw Spritemap_BabyTurtle_FacingLeft_8 
    dw $0005 
    dw Spritemap_BabyTurtle_FacingLeft_9 
    dw $0005 
    dw Spritemap_BabyTurtle_FacingLeft_A 
    dw Instruction_BabyTurtle_Set_Spinning_Stoppable 
    dw Instruction_Common_GotoY 
    dw InstList_BabyTurtle_Spinning 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_A28BEE:
    dw $0010 
    dw Spritemap_MamaTurtle_FacingLeft_3 
    dw $0010 
    dw Spritemap_MamaTurtle_FacingLeft_4 
    dw $0010 
    dw Spritemap_MamaTurtle_FacingLeft_5 
    dw $0010 
    dw Spritemap_MamaTurtle_FacingLeft_6 
    dw Instruction_Common_GotoY 
    dw UNUSED_InstList_A28BEE 
endif ; !FEATURE_KEEP_UNREFERENCED

InstList_MamaTurtle_Spinning:
    dw $0001 
    dw Spritemap_MamaTurtle_FacingLeft_0 
    dw Instruction_MamaTurtle_PlaySpinningSFX 
    dw $0004 
    dw Spritemap_MamaTurtle_FacingLeft_0 
    dw $0005 
    dw Spritemap_MamaTurtle_FacingLeft_8 
    dw $0005 
    dw Spritemap_MamaTurtle_FacingLeft_7 
    dw $0005 
    dw Spritemap_MamaTurtle_FacingLeft_8 
    dw Instruction_CommonA2_GotoY 
    dw InstList_MamaTurtle_Spinning 

InstList_MamaTurtle_FacingLeft_EnterShell:
    dw $0020 
    dw Spritemap_MamaTurtle_FacingLeft_3 
    dw $0005 
    dw Spritemap_MamaTurtle_FacingLeft_2 
    dw $0005 
    dw Spritemap_MamaTurtle_FacingLeft_1 
    dw Instruction_MamaTurtle_RiseToHoverRightwards 
    dw $7FFF 
    dw Spritemap_MamaTurtle_FacingLeft_0 
    dw Instruction_Common_Sleep 

InstList_BabyTurtle_FacingLeft_Hiding:
    dw $0005 
    dw Spritemap_BabyTurtle_FacingLeft_4 
    dw $0005 
    dw Spritemap_BabyTurtle_FacingLeft_5 
    dw $0040 
    dw Spritemap_BabyTurtle_FacingLeft_7 
    dw Instruction_BabyTurtle_LeaveShell 
    dw $7FFF 
    dw Spritemap_BabyTurtle_FacingLeft_7 
    dw Instruction_Common_Sleep 

InstList_MamaTurtle_Asleep:
    dw $7FFF 
    dw Spritemap_MamaTurtle_FacingLeft_0 
    dw Instruction_Common_Sleep 

InstList_MamaTurtle_FacingLeft_LeaveShell:
    dw $0010 
    dw Spritemap_MamaTurtle_FacingLeft_0 
    dw $0005 
    dw Spritemap_MamaTurtle_FacingLeft_1 
    dw $0005 
    dw Spritemap_MamaTurtle_FacingLeft_2 
    dw $0060 
    dw Spritemap_MamaTurtle_FacingLeft_3 
    dw Instruction_MamaTurtle_EnterShell 
    dw $7FFF 
    dw Spritemap_MamaTurtle_FacingLeft_3 
    dw Instruction_Common_Sleep 

InstList_BabyTurtle_FacingLeft_LeaveShell:
    dw $0005 
    dw Spritemap_BabyTurtle_FacingLeft_5 
    dw $002F 
    dw Spritemap_BabyTurtle_FacingLeft_4 
    dw Instruction_BabyTurtle_LeftShell 
    dw $002F 
    dw Spritemap_BabyTurtle_FacingLeft_4 
    dw Instruction_Common_Sleep 

InstList_BabyTurtle_CrawlingRight:
    dw Instruction_BabyTurtle_Crawl 
    dw $000A 
    dw Spritemap_BabyTurtle_FacingRight_B 
    dw $000A 
    dw Spritemap_BabyTurtle_FacingRight_C 
    dw Instruction_BabyTurtle_Crawl 
    dw $000A 
    dw Spritemap_BabyTurtle_FacingRight_D 
    dw $000A 
    dw Spritemap_BabyTurtle_FacingRight_E 
    dw Instruction_BabyTurtle_Crawl 
    dw $000A 
    dw Spritemap_BabyTurtle_FacingRight_B 
    dw $000A 
    dw Spritemap_BabyTurtle_FacingRight_C 
    dw Instruction_BabyTurtle_Crawl 
    dw $000A 
    dw Spritemap_BabyTurtle_FacingRight_D 
    dw $000A 
    dw Spritemap_BabyTurtle_FacingRight_E 
    dw Instruction_BabyTurtle_Crawl 
    dw $000A 
    dw Spritemap_BabyTurtle_FacingRight_B 
    dw $000A 
    dw Spritemap_BabyTurtle_FacingRight_C 
    dw Instruction_BabyTurtle_Crawl 
    dw $000A 
    dw Spritemap_BabyTurtle_FacingRight_10 
    dw $000A 
    dw Spritemap_BabyTurtle_FacingRight_11 
    dw Instruction_BabyTurtle_Crawl 
    dw $000A 
    dw Spritemap_BabyTurtle_FacingRight_B 
    dw $000A 
    dw Spritemap_BabyTurtle_FacingRight_F 
    dw Instruction_BabyTurtle_Crawl 
    dw $000A 
    dw Spritemap_BabyTurtle_FacingRight_10 
    dw $000A 
    dw Spritemap_BabyTurtle_FacingRight_11 
    dw Instruction_BabyTurtle_LoopOrTurnAroundIfMovedTooFar 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_A28CC4:
    dw $0005 
    dw Spritemap_BabyTurtle_FacingRight_12 
    dw $0005 
    dw Spritemap_BabyTurtle_FacingRight_13 
    dw $0005 
    dw Spritemap_BabyTurtle_FacingRight_14 
    dw $0005 
    dw Spritemap_BabyTurtle_FacingRight_15 
    dw Instruction_Common_GotoY 
    dw UNUSED_InstList_A28CC4 

UNUSED_InstList_A28CD8:
    dw $0010 
    dw Spritemap_MamaTurtle_FacingRight_C 
    dw $0010 
    dw Spritemap_MamaTurtle_FacingRight_D 
    dw $0010 
    dw Spritemap_MamaTurtle_FacingRight_E 
    dw $0010 
    dw Spritemap_MamaTurtle_FacingRight_F 
    dw Instruction_Common_GotoY 
    dw UNUSED_InstList_A28CD8 

UNUSED_InstList_A28CEC:
    dw $0005 
    dw Spritemap_MamaTurtle_FacingRight_9 
    dw $0005 
    dw Spritemap_MamaTurtle_FacingRight_11 
    dw $0005 
    dw Spritemap_MamaTurtle_FacingRight_10 
    dw $0005 
    dw Spritemap_MamaTurtle_FacingRight_11 
    dw Instruction_CommonA2_GotoY 
    dw UNUSED_InstList_A28CEC 
endif ; !FEATURE_KEEP_UNREFERENCED

InstList_MamaTurtle_FacingRight_EnterShell:
    dw $0001 
    dw Spritemap_MamaTurtle_FacingRight_C 
    dw $0005 
    dw Spritemap_MamaTurtle_FacingRight_B 
    dw $0005 
    dw Spritemap_MamaTurtle_FacingRight_A 
    dw Instruction_MamaTurtle_RiseToHoverLeftwards 
    dw $7FFF 
    dw Spritemap_MamaTurtle_FacingRight_9 
    dw Instruction_Common_Sleep 

InstList_BabyTurtle_FacingRight_Hiding:
    dw $0005 
    dw Spritemap_BabyTurtle_FacingRight_F 
    dw $0005 
    dw Spritemap_BabyTurtle_FacingRight_10 
    dw $0040 
    dw Spritemap_BabyTurtle_FacingRight_12 
    dw Instruction_BabyTurtle_LeaveShell 
    dw $7FFF 
    dw Spritemap_BabyTurtle_FacingRight_12 
    dw Instruction_Common_Sleep 

InstList_MamaTurtle_FacingRight_LeaveShell:
    dw $0010 
    dw Spritemap_MamaTurtle_FacingRight_9 
    dw $0005 
    dw Spritemap_MamaTurtle_FacingRight_A 
    dw $0005 
    dw Spritemap_MamaTurtle_FacingRight_B 
    dw $0060 
    dw Spritemap_MamaTurtle_FacingRight_C 
    dw Instruction_MamaTurtle_EnterShell 
    dw $7FFF 
    dw Spritemap_MamaTurtle_FacingRight_C 
    dw Instruction_Common_Sleep 

InstList_BabyTurtle_FacingRight_LeaveShell:
    dw $0005 
    dw Spritemap_BabyTurtle_FacingLeft_5 
    dw $002F 
    dw Spritemap_BabyTurtle_FacingLeft_4 
    dw Instruction_BabyTurtle_LeftShell 
    dw $002F 
    dw Spritemap_BabyTurtle_FacingLeft_4 
    dw Instruction_Common_Sleep 

BabyTurtleConstants_travelDistance:
    dw $0030 

MamaTurtleConstants_asleepFlag:
    dw $0001 

MamaTurtleConstants_unknown:
    dw $0020 

MamaTurtleConstants_HoveringXAcceleration_movingLeft:
    dw $F000 

MamaTurtleConstants_HoveringXAcceleration_movingRight:
    dw $FFFF,$1000,$0000 

MamaTurtleConstants_maxHoveringXSpeed:
    dw $0003 

MamaTurtleConstants_peakYPosition:
    dw $01E8 

MamaTurtleConstants_risingToPeakSpeed:
    dw $0007 

MamaTurtleConstants_hoveringAtPeakPosition:
    dw $001E 

MamaTurtleConstants_maxFallingYSpeed:
    dw $0004 

BabyTurtleConstants_maxSpinningLeftVelocity:
    dw $FFFD 

BabyTurtleConstants_maxSpinningRightVelocity:
    dw $0003 

InitAI_MamaTurtle:
    LDX.W $0E54 
    LDA.W $0F86,X : ORA.W #$2000 : STA.W $0F86,X 
    LDA.W #Spritemap_CommonA2_Nothing : STA.W $0F8E,X 
    LDA.W #$0001 : STA.W $0F94,X 
    STZ.W $0F90,X 
    STZ.W $0F84,X 
    LDA.W #InstList_MamaTurtle_Asleep : STA.W $0F92,X 
    LDA.W #Function_MamaTurtle_Initial : STA.W $0FA8,X 
    LDA.W MamaTurtleConstants_asleepFlag : STA.W $0FB2,X 
    RTL 


InitAI_BabyTurtle:
    LDX.W $0E54 
    LDA.W $0F7A,X : STA.W $0FAC,X 
    LDA.W $0F7E,X : SEC : SBC.W $0F84,X : STA.W $0FAE,X 
    LDA.W #Function_BabyTurtle_Crawling_NotCarryingSamus : STA.W $0FA8,X 
    LDA.W #$0001 : STA.W $0F94,X 
    STZ.W $0F90,X 
    LDY.W #InstList_BabyTurtle_CrawlingLeft 
    LDA.W $0FB4,X : STA.W $0FB0,X 
    BMI .keepPointer 
    LDY.W #InstList_BabyTurtle_CrawlingRight 

.keepPointer:
    TYA 
    STA.W $0F92,X 
    RTL 


MainAI_MamaTurtle:
    LDX.W $0E54 
    JMP.W ($0FA8,X) 


Function_MamaTurtle_Initial:
    LDA.W $0F96,X : STA.W $0FD6,X 
    STA.W $1016,X 
    STA.W $1056,X 
    STA.W $1096,X 
    LDA.W $0F98,X : STA.W $0FD8,X 
    STA.W $1018,X 
    STA.W $1058,X 
    STA.W $1098,X 
    TXA 
    STA.W $0FEA,X 
    STA.W $102A,X 
    STA.W $106A,X 
    STA.W $10AA,X 
    LDA.W #Function_MamaTurtle_Asleep : STA.W $0FA8,X 

RTL_A28E09:
    RTL 


Function_MamaTurtle_Asleep:
    LDA.W $0FB2,X : BNE .asleep 
    LDA.W #Function_MamaTurtle_LeaveShell : STA.W $0FA8,X 
    LDA.W $0F86,X : AND.W #$FBFF : STA.W $0F86,X 
    RTL 


.asleep:
    STZ.W $0F84,X 
    LDA.W $0F7A,X : SEC : SBC.W $0AF6 : PHP 
    BPL + 
    EOR.W #$FFFF 
    INC A 

  + CMP.W #$0018 
    BPL .returnPLP 
    PLP 
    BPL .SamusToTheRight 
    CLC : ADC.W #$0018 

.SamusToTheRight:
    ASL A 
    TAX 
    LDA.W SleepingMamaTurtleShellShape,X 
    LDX.W $0E54 
    EOR.W #$FFFF 
    INC A 
    STA.W $0F84,X 
    LDA.W $0F86,X : ORA.W #$8000 : STA.W $0F86,X 
    JSL.L CheckIfEnemyIsTouchingSamusFromBelow 
    AND.W #$FFFF 
    BEQ .return 
    LDA.W $0F7E,X : SEC : SBC.W $0F84,X : STA.B $12 
    LDA.W $0AFA : CLC : ADC.W $0B00 : SEC : SBC.B $12 : BMI .return 
    EOR.W #$FFFF 
    INC A 
    CLC : ADC.W $0B5C : STA.W $0B5C 

.return:
    RTL 


.returnPLP:
    PLP 
    RTL 


SleepingMamaTurtleShellShape:
    dw $FFF0,$FFF0,$FFF0,$FFF0,$FFF1,$FFF1,$FFF1,$FFF1 
    dw $FFF1,$FFF2,$FFF3,$FFF3,$FFF4,$FFF5,$FFF6,$FFF7 
    dw $FFF8,$FFF9,$FFFA,$FFFB,$FFFC,$FFFC,$0000,$0000 
    dw $FFF0,$FFF0,$FFF0,$FFF1,$FFF1,$FFF1,$FFF2,$FFF3 
    dw $FFF4,$FFF5,$FFF6,$FFF7,$FFF8,$FFF9,$FFFA,$FFFB 
    dw $FFFC,$FFFD,$FFFD,$FFFE,$0000,$0000,$0000,$0000 

Function_MamaTurtle_LeaveShell:
    JSR.W MamaTurtle_vs_Samus_CollisionDetection 
    LDA.W $05B5 : AND.W #$0001 
    BNE .return 
    PHX 
    JSL.L CheckIfEnemyIsTouchingSamusFromBelow 
    PLX 
    AND.W #$FFFF 
    BEQ .notTouchingSamusFromBelow 
    LDA.W $0B58 : SEC : SBC.W #$0001 : STA.W $0B58 

.notTouchingSamusFromBelow:
    DEC.W $0F7E,X 
    STZ.B $12 
    LDA.W #$0010 : STA.W $0F84,X 
    LDA.W $0F7E,X 
    BIT.W #$0001 
    BNE .odd 
    INC.W $0F7A,X 
    BRA + 


.odd:
    DEC.W $0F7A,X 

  + LDA.W #$0001 : STA.B $14 
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes 
    BCS .return 
    LDA.W #InstList_MamaTurtle_FacingLeft_LeaveShell : STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    LDA.W MamaTurtleConstants_unknown : STA.W $0006,X 
    LDA.W #RTL_A28E09 : STA.W $0FA8,X 

.return:
    RTL 


Function_MamaTurtle_EnterShell:
    LDY.W #InstList_MamaTurtle_FacingLeft_EnterShell 
    LDA.W $0F7A,X : SEC : SBC.W $0AF6 : BPL .keepLeft 
    LDY.W #InstList_MamaTurtle_FacingRight_EnterShell 

.keepLeft:
    TYA 
    STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    LDA.W #RTL_A28E09 : STA.W $0FA8,X 
    RTL 


HandleSamusLandingOnHoveringTatori:
    PHX 
    JSL.L CheckIfEnemyIsTouchingSamusFromBelow 
    PLX 
    AND.W #$FFFF 
    BEQ .return 
    LDA.W #Function_MamaTurtle_RisingToPeak : STA.W $0FA8,X 
    LDA.W $0B56 : SEC : SBC.L $7E7806,X : STA.W $0B56 
    LDA.W $0B58 : SBC.W $0FB0,X : CMP.W #$FFF0 
    BPL + 
    LDA.W #$FFF0 

  + STA.W $0B58 

.return:
    RTS 


Function_MamaTurtle_RiseToHover:
    JSR.W MamaTurtle_vs_Samus_CollisionDetection 
    LDA.W #$FFFF : STA.B $14 
    STZ.B $12 
    JSL.L MoveEnemyDownBy_14_12 
    BCS .return 
    PHX 
    JSL.L CheckIfEnemyIsTouchingSamusFromBelow 
    PLX 
    AND.W #$FFFF 
    BEQ .notTouchingSamusFromBelow 
    LDA.W $0B5C : SEC : SBC.W #$0001 : STA.W $0B5C 

.notTouchingSamusFromBelow:
    LDA.L $7E7800,X 
    DEC A 
    STA.L $7E7800,X 
    BNE .return 
    LDY.W #$0000 
    LDA.W $0F7A,X : SEC : SBC.W $0AF6 : BPL + 
    LDY.W #$0004 

  + LDA.W MamaTurtleConstants_HoveringXAcceleration_movingLeft,Y : STA.L $7E7802,X 
    LDA.W MamaTurtleConstants_HoveringXAcceleration_movingRight,Y : STA.L $7E7804,X 
    LDA.W #$0000 : STA.W $0FB0,X 
    STA.L $7E7806,X 
    LDA.W #Function_MamaTurtle_Hovering : STA.W $0FA8,X 

.return:
    RTL 


Function_MamaTurtle_Hovering:
    JSR.W MamaTurtle_vs_Samus_CollisionDetection 
    LDA.W $0FB0,X : STA.B $14 
    LDA.L $7E7806,X : STA.B $12 
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes 
    BCS .hitWall 
    JSR.W HandleSamusLandingOnHoveringTatori 
    LDA.L $7E7806,X : CLC : ADC.L $7E7802,X : STA.L $7E7806,X 
    LDA.W $0FB0,X : ADC.L $7E7804,X : PHA 
    BPL + 
    EOR.W #$FFFF 
    INC A 

  + CMP.W MamaTurtleConstants_maxHoveringXSpeed 
    BMI .pullA 
    PLA 
    LDY.W MamaTurtleConstants_maxHoveringXSpeed 
    LDA.W $0FB0,X 
    BIT.W #$8000 
    BEQ + 
    LDA.W MamaTurtleConstants_maxHoveringXSpeed 
    EOR.W #$FFFF 
    INC A 
    TAY 

  + PHY 

.pullA:
    PLA 
    STA.W $0FB0,X 
    RTL 


.hitWall:
    LDA.L $7E7806,X 
    EOR.W #$FFFF 
    INC A 
    STA.L $7E7806,X 
    LDA.W $0FB0,X : ADC.W #$0000 : EOR.W #$FFFF 
    INC A 
    STA.W $0FB0,X 
    LDA.L $7E7802,X 
    EOR.W #$FFFF 
    INC A 
    STA.L $7E7802,X 
    LDA.L $7E7804,X : ADC.W #$0000 : EOR.W #$FFFF 
    STA.L $7E7804,X 
    LDA.W #$0000 : STA.W $183E 
    LDA.W #$0010 : STA.W $1840 
    LDA.W #$001B 
    JSL.L QueueSound_Lib2_Max6 
    RTL 


Function_MamaTurtle_RisingToPeak:
    JSR.W MamaTurtle_vs_Samus_CollisionDetection 
    LDA.W $0F7E,X 
    CMP.W MamaTurtleConstants_peakYPosition 
    BMI + 
    PHX 
    JSL.L CheckIfEnemyIsTouchingSamusFromBelow 
    PLX 
    AND.W #$FFFF 
    BEQ .notTouchingSamus 
    LDA.W $0F7E,X : SEC : SBC.W MamaTurtleConstants_risingToPeakSpeed : STA.W $0F7E,X 
    LDA.W $0B5C : SEC : SBC.W MamaTurtleConstants_risingToPeakSpeed : STA.W $0B5C 
    RTL 


  + LDA.W MamaTurtleConstants_hoveringAtPeakPosition : STA.L $7E7800,X 
    LDA.W #Function_MamaTurtle_HoveringAtPeak 

.merge:
    STA.W $0FA8,X 
    LDA.W #$0000 : STA.L $7E780E,X 
    STA.L $7E7808,X 
    RTL 


.notTouchingSamus:
    LDA.W #Function_MamaTurtle_Falling : BRA .merge 


Function_MamaTurtle_HoveringAtPeak:
    JSR.W MamaTurtle_vs_Samus_CollisionDetection 
    LDA.L $7E7800,X 
    DEC A 
    STA.L $7E7800,X 
    BNE .return 
    LDA.W #Function_MamaTurtle_Falling : STA.W $0FA8,X 

.return:
    RTL 


Function_MamaTurtle_Falling:
    JSR.W MamaTurtle_vs_Samus_CollisionDetection 
    LDA.L $7E7808 
    CMP.W MamaTurtleConstants_maxFallingYSpeed 
    BPL .maxVelocity 
    LDA.L $7E780E,X : CLC : ADC.W #$2000 : STA.L $7E780E,X 
    LDA.L $7E7808,X : ADC.W #$0000 : STA.L $7E7808,X 

.maxVelocity:
    STZ.B $12 
    LDA.L $7E7808,X : STA.B $14 
    JSL.L MoveEnemyDownBy_14_12 
    BCC .return 
    LDY.W #InstList_MamaTurtle_FacingLeft_LeaveShell 
    LDA.W $0FB0,X : BMI .keepLeft 
    LDY.W #InstList_MamaTurtle_FacingRight_LeaveShell 

.keepLeft:
    TYA 
    STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    LDA.W #RTL_A28E09 : STA.W $0FA8,X 

.return:
    RTL 


MainAI_BabyTurtle:
    LDX.W $0E54 
    LDA.W $0FAA,X 
    TAX 
    LDA.W #$0000 : STA.L $7E780C,X 
    LDX.W $0E54 
    JMP.W ($0FA8,X) 


Function_BabyTurtle_Crawling_NotCarryingSamus:
    JSL.L CheckIfEnemyIsTouchingSamusFromBelow 
    AND.W #$FFFF 
    BEQ .return 
    LDA.W #Function_BabyTurtle_Hiding_CarryingSamus : STA.W $0FA8,X 
    LDA.W #$0004 : STA.L $7E780A,X 
    LDY.W #InstList_BabyTurtle_FacingLeft_Hiding 
    LDA.W $0FB0,X : BMI .keepLeft 
    LDY.W #InstList_BabyTurtle_FacingRight_Hiding 

.keepLeft:
    TYA 
    STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 

.return:
    RTL 


Function_BabyTurtle_Hiding_CarryingSamus:
    JSL.L CheckIfEnemyIsTouchingSamusFromBelow 
    AND.W #$FFFF 
    BEQ .notTouchingSamus 
    LDA.W #$0004 : STA.L $7E780A,X 

.return:
    RTL 


.notTouchingSamus:
    LDA.L $7E780A,X 
    DEC A 
    STA.L $7E780A,X 
    BNE .return 
    LDA.W #Function_BabyTurtle_Hiding_NotCarryingSamus : STA.W $0FA8,X 
    LDA.W #$003C : STA.L $7E7800,X 
    RTL 


Function_BabyTurtle_Hiding_NotCarryingSamus:
    JSL.L CheckIfEnemyIsTouchingSamusFromBelow 
    AND.W #$FFFF 
    BEQ .notTouchingSamus 
    LDA.W #Function_BabyTurtle_Spinning_Unstoppable : STA.W $0FA8,X 
    LDA.W #InstList_BabyTurtle_Spinning : STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    LDA.W #$0001 : STA.L $7E7808,X 
    LDA.W $0A1E : AND.W #$000F 
    LDY.W BabyTurtleConstants_maxSpinningLeftVelocity 
    CMP.W #$0008 
    BNE .keepLeft 
    LDY.W BabyTurtleConstants_maxSpinningRightVelocity 

.keepLeft:
    TYA 
    STA.W $0FB0,X 
    RTL 


.notTouchingSamus:
    LDA.L $7E7800,X 
    DEC A 
    STA.L $7E7800,X 
    BEQ .timerExpired 
    RTL 


.timerExpired:
    LDY.W #InstList_BabyTurtle_CrawlingLeft 
    LDA.W $0FB0,X : BMI ..keepLeft 
    LDY.W #InstList_BabyTurtle_CrawlingRight 

..keepLeft:
    TYA 
    STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    LDA.W #Function_BabyTurtle_Crawling_NotCarryingSamus : STA.W $0FA8,X 
    RTL 


Function_BabyTurtle_Spinning_Unstoppable:
    STZ.B $12 
    LDA.W $0FB0,X : STA.B $14 
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes 
    BCS .collidedWithWall 
    STZ.B $12 
    LDA.L $7E7808,X : STA.B $14 
    JSL.L MoveEnemyDownBy_14_12 
    RTL 


.collidedWithWall:
    LDA.W $0FB0,X 
    EOR.W #$FFFF 
    INC A 
    STA.W $0FB0,X 
    RTL 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_A2921D:
    LDY.W #InstList_BabyTurtle_CrawlingLeft 
    LDA.W $0FB0,X : BMI .keepLeft 
    LDY.W #InstList_BabyTurtle_CrawlingRight 

.keepLeft:
    TYA 
    STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    LDA.W #Function_BabyTurtle_Crawling_NotCarryingSamus : STA.W $0FA8,X 
    RTL 
endif ; !FEATURE_KEEP_UNREFERENCED


Function_BabyTurtle_Spinning_Stoppable:
    JSL.L CheckIfEnemyIsTouchingSamusFromBelow 
    AND.W #$FFFF 
    BEQ Function_BabyTurtle_Spinning_Unstoppable 
    LDY.W #InstList_BabyTurtle_CrawlingLeft 
    LDA.W $0FB0,X : BMI .keepLeft 
    LDY.W #InstList_BabyTurtle_CrawlingRight 

.keepLeft:
    TYA 
    STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    LDA.W #Function_BabyTurtle_Crawling_NotCarryingSamus : STA.W $0FA8,X 
    RTL 


Function_BabyTurtle_Crawling_CarryingSamus:
    LDX.W $0E54 
    LDA.W $0F84,X 
    PHA 
    LDA.W $0FAA,X 
    TAX 
    PLA 
    STA.L $7E780C,X 
    LDX.W $0E54 
    JSL.L CheckIfEnemyIsTouchingSamusFromBelow 
    AND.W #$FFFF 
    BNE .return 
    LDA.W #Function_BabyTurtle_Crawling_NotCarryingSamus : STA.W $0FA8,X 

.return:
    RTL 


EnemyTouch_MamaTurtle:
    LDX.W $0E54 
    LDA.W $0F86,X 
    BIT.W #$8000 
    BNE .return 
    JSL.L CommonA2_NormalEnemyTouchAI 
    LDA.W #Function_MamaTurtle_Falling : STA.W $0FA8,X 
    LDA.W #$0002 : STA.L $7E7808,X 

.return:
    RTL 


RTL_A2929E:
    RTL 


EnemyTouch_BabyTurtle:
    LDX.W $0E54 
    LDA.W $0FA8,X 
    CMP.W #Function_BabyTurtle_Crawling_CarryingSamus 
    BNE + 
    RTL 


  + LDA.W $0FB0,X : BMI .negative 
    LDA.W #InstList_BabyTurtle_CrawlingLeft : STA.W $0F92,X 
    LDA.W #$FFFF : BRA + 


.negative:
    LDA.W #InstList_BabyTurtle_CrawlingRight : STA.W $0F92,X 
    LDA.W #$0001 

  + STA.W $0FB0,X 
    LDA.W #$0001 : STA.W $0F94,X 
    LDA.W $0F7A,X 
    CMP.W $0AF6 
    BPL .SamusToTheLeft 
    LDA.W $0AF6 : SEC : SBC.W $0AFE : SBC.W $0F82,X : BRA + 


.SamusToTheLeft:
    LDA.W $0AF6 : CLC : ADC.W $0AFE : ADC.W $0F82,X 

  + STA.W $0F7A,X 
    LDA.W #Function_BabyTurtle_Crawling_NotCarryingSamus : STA.W $0FA8,X 
    STZ.B $12 
    LDA.W $0FB0,X : STA.B $14 
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes ; fallthrough to AwakenTurtle

AwakenTurtle:
    LDX.W $0E54 
    LDA.W $0FAA,X 
    TAX 
    LDA.W $0FB2,X : BEQ .return 
    DEC.W $0FB2,X 

.return:
    RTL 


EnemyShot_BabyTurtle:
    JSL.L NormalEnemyShotAI 
    BRA AwakenTurtle 


MamaTurtle_vs_Samus_CollisionDetection:
    LDA.W $0F7A : SEC : SBC.W $0F82 : SEC : SBC.W #$0008 : STA.B $12 
    LDA.W $0F7A : CLC : ADC.W $0F82 : CLC : ADC.W #$0008 : STA.B $14 
    LDA.W $0F7E : SEC : SBC.W $0F84 : CLC : ADC.W #$0004 : STA.B $16 
    LDA.W $0F7E : CLC : ADC.W $0F84 : SEC : SBC.W #$0004 : STA.B $18 
    LDA.W $0AF6 : SEC : SBC.W $0AFE : DEC A 
    CMP.B $14 
    BPL .return 
    LDA.W $0AF6 : CLC : ADC.W $0AFE : CMP.B $12 
    BMI .return 
    LDA.W $0AFA : SEC : SBC.W $0B00 : INC A 
    CMP.B $18 
    BPL .return 
    LDA.W $0AFA : CLC : ADC.W $0B00 : CMP.B $16 
    BMI .return 
    LDA.W $18A8 : BNE .return 
    JSL.L NormalEnemyTouchAI 

.return:
    RTS 


Instruction_BabyTurtle_Crawl:
    PHX 
    PHY 
    LDA.W #$0000 : STA.B $30 
    LDX.W $0E54 
    JSL.L CheckIfEnemyIsTouchingSamusFromBelow 
    AND.W #$FFFF 
    BEQ .notTouchingSamusFromBelow 
    LDA.W $0FB0,X : CLC : ADC.W $0B58 : STA.W $0B58 
    LDA.W #$0001 : STA.B $30 

.notTouchingSamusFromBelow:
    LDA.W $0F7E,X : STA.B $32 
    LDA.W $0FAE,X : STA.W $0F7E,X 
    STZ.B $12 
    LDA.W $0FB0,X : STA.B $14 
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes 
    LDA.W $0FAA,X 
    TAX 
    LDA.W $0FA8,X 
    CMP.W #Function_MamaTurtle_Asleep 
    BNE .return 
    LDX.W $0E54 
    PHX 
    LDA.W $0FAA,X 
    TAX 
    LDA.W $0F7A,X 
    PLX 
    SEC : SBC.W $0F7A,X : PHP 
    BPL + 
    EOR.W #$FFFF 
    INC A 

  + CMP.W #$0018 
    BPL .notOnMama 
    PLP 
    BPL .rightOfMama 
    CLC : ADC.W #$0018 

.rightOfMama:
    ASL A 
    TAX 
    LDA.W SleepingMamaTurtleShellShape,X 

.merge:
    STA.B $14 
    STZ.B $12 
    LDX.W $0E54 
    JSL.L MoveEnemyDownBy_14_12 
    LDA.B $30 : BEQ .return 
    LDA.W $0F7E,X : SEC : SBC.B $32 : CLC : ADC.W $0B5C : STA.W $0B5C 

.return:
    PLY 
    PLX 
    RTL 


.notOnMama:
    PLP 
    LDA.W #$0001 : BRA .merge 


Instruction_BabyTurtle_LoopOrTurnAroundIfMovedTooFar:
    PHX 
    LDX.W $0E54 
    LDA.W $0FAC,X : SEC : SBC.W $0F7A,X : PHP 
    BPL + 
    EOR.W #$FFFF 
    INC A 

  + CMP.W BabyTurtleConstants_travelDistance 
    BMI .noTurn 
    PLP 
    BMI .rightOfSpawn 
    LDA.W #$0001 : BRA + 


.rightOfSpawn:
    LDA.W #$FFFF 

  + STA.W $0FB0,X 

.merge:
    LDY.W #InstList_BabyTurtle_CrawlingRight 
    LDA.W $0FB0,X : BPL .return 
    LDY.W #InstList_BabyTurtle_CrawlingLeft 

.return:
    PLX 
    RTL 


.noTurn:
    PLP 
    BRA .merge 


Instruction_MamaTurtle_EnterShell:
    LDX.W $0E54 
    LDA.W #Function_MamaTurtle_EnterShell : STA.W $0FA8,X 
    RTL 


Instruction_MamaTurtle_RiseToHoverRightwards:
    LDX.W $0E54 
    LDA.W #Function_MamaTurtle_RiseToHover : STA.W $0FA8,X 
    LDA.W #$FFFF : STA.W $0FB0,X 
    LDA.W #$0010 : STA.L $7E7800,X 
    LDY.W #InstList_MamaTurtle_Spinning 
    RTL 


Instruction_MamaTurtle_RiseToHoverLeftwards:
    LDX.W $0E54 
    LDA.W #Function_MamaTurtle_RiseToHover : STA.W $0FA8,X 
    LDA.W #$0001 : STA.W $0FB0,X 
    LDA.W #$0010 : STA.L $7E7800,X 
    LDY.W #InstList_MamaTurtle_Spinning 
    RTL 


Instruction_BabyTurtle_LeaveShell:
    PHY 
    LDX.W $0E54 
    JSL.L CheckIfEnemyIsTouchingSamusFromBelow 
    AND.W #$FFFF 
    BEQ .returnPLY 
    PLY 
    LDY.W #InstList_BabyTurtle_FacingLeft_LeaveShell 
    LDA.W $0FB0,X : BMI .return 
    LDY.W #InstList_BabyTurtle_FacingRight_LeaveShell 

.return:
    RTL 


.returnPLY:
    PLY 
    RTL 


Instruction_BabyTurtle_LeftShell:
    LDX.W $0E54 
    JSL.L CheckIfEnemyIsTouchingSamusFromBelow 
    AND.W #$FFFF 
    BEQ .notTouchingSamusFromBelow 
    LDA.W #Function_BabyTurtle_Crawling_CarryingSamus : STA.W $0FA8,X 

.chooseDirection:
    LDY.W #InstList_BabyTurtle_CrawlingLeft 
    LDA.W $0FB0,X : BMI .return 
    LDY.W #InstList_BabyTurtle_CrawlingRight 

.return:
    RTL 


.notTouchingSamusFromBelow:
    LDA.W #Function_BabyTurtle_Crawling_NotCarryingSamus : STA.W $0FA8,X 
    BRA .chooseDirection 


Instruction_BabyTurtle_Set_Spinning_Stoppable:
    LDX.W $0E54 
    LDA.W #Function_BabyTurtle_Spinning_Stoppable : STA.W $0FA8,X 
    RTL 


Instruction_MamaTurtle_PlaySpinningSFX:
    LDA.W #$003A 
    JSL.L QueueSound_Lib2_Max6 
    RTL 


Spritemap_BabyTurtle_FacingLeft_0:
    dw $0001,$C3F8 
    db $F8 
    dw $2104 

Spritemap_BabyTurtle_FacingLeft_1:
    dw $0001,$C3F8 
    db $F8 
    dw $2106 

Spritemap_BabyTurtle_FacingLeft_2:
    dw $0001,$C3F8 
    db $F8 
    dw $2108 

Spritemap_BabyTurtle_FacingLeft_3:
    dw $0001,$C3F8 
    db $F8 
    dw $210A 

Spritemap_BabyTurtle_FacingLeft_4:
    dw $0002,$01F8 
    db $FF 
    dw $214D,$C3F8 
    db $F8 
    dw $2106 

Spritemap_BabyTurtle_FacingLeft_5:
    dw $0002,$01F8 
    db $00 
    dw $214E,$C3F8 
    db $F8 
    dw $2108 

Spritemap_BabyTurtle_FacingLeft_6:
    dw $0002,$01F8 
    db $FF 
    dw $214F,$C3F8 
    db $F8 
    dw $210A 

Spritemap_BabyTurtle_FacingLeft_7:
    dw $0001,$C3F8 
    db $F8 
    dw $2102 

Spritemap_BabyTurtle_FacingLeft_8:
    dw $0001,$C3F8 
    db $F8 
    dw $2100 

Spritemap_BabyTurtle_FacingLeft_9:
    dw $0001,$C3F8 
    db $F8 
    dw $6102 

Spritemap_BabyTurtle_FacingLeft_A:
    dw $0001,$C3F8 
    db $F8 
    dw $6100 

Spritemap_MamaTurtle_FacingLeft_0:
    dw $0006,$C208 
    db $00 
    dw $212A,$C3F8 
    db $00 
    dw $2128,$C3E8 
    db $00 
    dw $2126,$C208 
    db $F0 
    dw $2124,$C3F8 
    db $F0 
    dw $2122,$C3E8 
    db $F0 
    dw $2120 

Spritemap_MamaTurtle_FacingLeft_1:
    dw $000E,$0008 
    db $08 
    dw $214B,$0000 
    db $08 
    dw $214A,$01F8 
    db $08 
    dw $2149,$01F0 
    db $08 
    dw $2148,$01E8 
    db $08 
    dw $2157,$01E8 
    db $00 
    dw $2147,$0010 
    db $00 
    dw $212B,$0008 
    db $00 
    dw $212A,$0000 
    db $00 
    dw $2129,$01F8 
    db $00 
    dw $2128,$01F0 
    db $00 
    dw $2127,$C208 
    db $F0 
    dw $2124,$C3F8 
    db $F0 
    dw $2122,$C3E8 
    db $F0 
    dw $2120 

Spritemap_MamaTurtle_FacingLeft_2:
    dw $000E,$0008 
    db $08 
    dw $215B,$0000 
    db $08 
    dw $215A,$01F8 
    db $08 
    dw $2159,$01F0 
    db $08 
    dw $2158,$01E8 
    db $08 
    dw $2156,$01E8 
    db $00 
    dw $2146,$0010 
    db $00 
    dw $212B,$0008 
    db $00 
    dw $212A,$0000 
    db $00 
    dw $2129,$01F8 
    db $00 
    dw $2128,$01F0 
    db $00 
    dw $2127,$C208 
    db $F0 
    dw $2124,$C3F8 
    db $F0 
    dw $2122,$C3E8 
    db $F0 
    dw $2120 

Spritemap_MamaTurtle_FacingLeft_3:
    dw $000B,$C201 
    db $01 
    dw $2144,$C3F3 
    db $00 
    dw $2142,$C3E8 
    db $01 
    dw $2140,$C208 
    db $FB 
    dw $212A,$C20C 
    db $01 
    dw $212E,$C3DD 
    db $FA 
    dw $212C,$C3F8 
    db $FB 
    dw $2128,$C3E8 
    db $FB 
    dw $2126,$C208 
    db $EB 
    dw $2124,$C3F8 
    db $EB 
    dw $2122,$C3E8 
    db $EB 
    dw $2120 

Spritemap_MamaTurtle_FacingLeft_4:
    dw $000B,$C201 
    db $00 
    dw $2142,$C3EF 
    db $01 
    dw $2140,$C3EA 
    db $00 
    dw $2142,$C208 
    db $FA 
    dw $212A,$C20B 
    db $01 
    dw $212E,$C3DD 
    db $FB 
    dw $212C,$C3F8 
    db $FA 
    dw $2128,$C3E8 
    db $FA 
    dw $2126,$C208 
    db $EA 
    dw $2124,$C3F8 
    db $EA 
    dw $2122,$C3E8 
    db $EA 
    dw $2120 

Spritemap_MamaTurtle_FacingLeft_5:
    dw $000B,$C3FF 
    db $01 
    dw $2140,$C3F3 
    db $00 
    dw $2142,$C3EA 
    db $01 
    dw $2144,$C208 
    db $F9 
    dw $212A,$C20C 
    db $01 
    dw $212E,$C3DD 
    db $FC 
    dw $212C,$C3F8 
    db $F9 
    dw $2128,$C3E8 
    db $F9 
    dw $2126,$C208 
    db $E9 
    dw $2124,$C3F8 
    db $E9 
    dw $2122,$C3E8 
    db $E9 
    dw $2120 

Spritemap_MamaTurtle_FacingLeft_6:
    dw $000B,$C201 
    db $00 
    dw $2142,$C3F3 
    db $01 
    dw $2144,$C3EA 
    db $00 
    dw $2142,$C208 
    db $FA 
    dw $212A,$C20D 
    db $01 
    dw $212E,$C3DD 
    db $FB 
    dw $212C,$C3F8 
    db $FA 
    dw $2128,$C3E8 
    db $FA 
    dw $2126,$C208 
    db $EA 
    dw $2124,$C3F8 
    db $EA 
    dw $2122,$C3E8 
    db $EA 
    dw $2120 

Spritemap_MamaTurtle_FacingLeft_7:
    dw $0006,$C3E8 
    db $00 
    dw $612A,$C3F8 
    db $00 
    dw $6128,$C208 
    db $00 
    dw $6126,$C3E8 
    db $F0 
    dw $6124,$C3F8 
    db $F0 
    dw $6122,$C208 
    db $F0 
    dw $6120 

Spritemap_MamaTurtle_FacingLeft_8:
    dw $0004,$C200 
    db $00 
    dw $610E,$C200 
    db $F0 
    dw $610C,$C3F0 
    db $00 
    dw $210E,$C3F0 
    db $F0 
    dw $210C 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_MamaTurtle_FacingLeft_A296FF:
    dw $000A,$0000 
    db $08 
    dw $615F,$0000 
    db $00 
    dw $615E,$01F8 
    db $08 
    dw $215F,$01F8 
    db $00 
    dw $215E,$C206 
    db $00 
    dw $6140,$C3EA 
    db $00 
    dw $2140,$C200 
    db $FA 
    dw $610E,$C3F0 
    db $FA 
    dw $210E,$C200 
    db $EA 
    dw $610C,$C3F0 
    db $EA 
    dw $210C 
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_BabyTurtle_FacingRight_B:
    dw $0001,$C3F8 
    db $F8 
    dw $6104 

Spritemap_BabyTurtle_FacingRight_C:
    dw $0001,$C3F8 
    db $F8 
    dw $6106 

Spritemap_BabyTurtle_FacingRight_D:
    dw $0001,$C3F8 
    db $F8 
    dw $6108 

Spritemap_BabyTurtle_FacingRight_E:
    dw $0001,$C3F8 
    db $F8 
    dw $610A 

Spritemap_BabyTurtle_FacingRight_F:
    dw $0002,$0000 
    db $FF 
    dw $614D,$C3F8 
    db $F8 
    dw $6106 

Spritemap_BabyTurtle_FacingRight_10:
    dw $0002,$0000 
    db $00 
    dw $614E,$C3F8 
    db $F8 
    dw $6108 

Spritemap_BabyTurtle_FacingRight_11:
    dw $0002,$0000 
    db $FF 
    dw $614F,$C3F8 
    db $F8 
    dw $610A 

Spritemap_BabyTurtle_FacingRight_12:
    dw $0001,$C3F8 
    db $F8 
    dw $6102 

Spritemap_BabyTurtle_FacingRight_13:
    dw $0001,$C3F8 
    db $F8 
    dw $6100 

Spritemap_BabyTurtle_FacingRight_14:
    dw $0001,$C3F8 
    db $F8 
    dw $2102 

Spritemap_BabyTurtle_FacingRight_15:
    dw $0001,$C3F8 
    db $F8 
    dw $2100 

Spritemap_MamaTurtle_FacingRight_9:
    dw $0006,$C3E8 
    db $00 
    dw $612A,$C3F8 
    db $00 
    dw $6128,$C208 
    db $00 
    dw $6126,$C3E8 
    db $F0 
    dw $6124,$C3F8 
    db $F0 
    dw $6122,$C208 
    db $F0 
    dw $6120 

Spritemap_MamaTurtle_FacingRight_A:
    dw $000E,$01F0 
    db $08 
    dw $614B,$01F8 
    db $08 
    dw $614A,$0000 
    db $08 
    dw $6149,$0008 
    db $08 
    dw $6148,$0010 
    db $08 
    dw $6157,$0010 
    db $00 
    dw $6147,$01E8 
    db $00 
    dw $612B,$01F0 
    db $00 
    dw $612A,$01F8 
    db $00 
    dw $6129,$0000 
    db $00 
    dw $6128,$0008 
    db $00 
    dw $6127,$C3E8 
    db $F0 
    dw $6124,$C3F8 
    db $F0 
    dw $6122,$C208 
    db $F0 
    dw $6120 

Spritemap_MamaTurtle_FacingRight_B:
    dw $000E,$01F0 
    db $08 
    dw $615B,$01F8 
    db $08 
    dw $615A,$0000 
    db $08 
    dw $6159,$0008 
    db $08 
    dw $6158,$0010 
    db $08 
    dw $6156,$0010 
    db $00 
    dw $6146,$01E8 
    db $00 
    dw $612B,$01F0 
    db $00 
    dw $612A,$01F8 
    db $00 
    dw $6129,$0000 
    db $00 
    dw $6128,$0008 
    db $00 
    dw $6127,$C3E8 
    db $F0 
    dw $6124,$C3F8 
    db $F0 
    dw $6122,$C208 
    db $F0 
    dw $6120 

Spritemap_MamaTurtle_FacingRight_C:
    dw $000B,$C3EF 
    db $01 
    dw $6144,$C3FD 
    db $00 
    dw $6142,$C208 
    db $01 
    dw $6140,$C3E8 
    db $FB 
    dw $612A,$C3E4 
    db $01 
    dw $612E,$C213 
    db $FA 
    dw $612C,$C3F8 
    db $FB 
    dw $6128,$C208 
    db $FB 
    dw $6126,$C3E8 
    db $EB 
    dw $6124,$C3F8 
    db $EB 
    dw $6122,$C208 
    db $EB 
    dw $6120 

Spritemap_MamaTurtle_FacingRight_D:
    dw $000B,$C3EF 
    db $00 
    dw $6142,$C201 
    db $01 
    dw $6140,$C206 
    db $00 
    dw $6142,$C3E8 
    db $FA 
    dw $612A,$C3E5 
    db $01 
    dw $612E,$C213 
    db $FB 
    dw $612C,$C3F8 
    db $FA 
    dw $6128,$C208 
    db $FA 
    dw $6126,$C3E8 
    db $EA 
    dw $6124,$C3F8 
    db $EA 
    dw $6122,$C208 
    db $EA 
    dw $6120 

Spritemap_MamaTurtle_FacingRight_E:
    dw $000B,$C3F1 
    db $01 
    dw $6140,$C3FD 
    db $00 
    dw $6142,$C206 
    db $01 
    dw $6144,$C3E8 
    db $F9 
    dw $612A,$C3E4 
    db $01 
    dw $612E,$C213 
    db $FC 
    dw $612C,$C3F8 
    db $F9 
    dw $6128,$C208 
    db $F9 
    dw $6126,$C3E8 
    db $E9 
    dw $6124,$C3F8 
    db $E9 
    dw $6122,$C208 
    db $E9 
    dw $6120 

Spritemap_MamaTurtle_FacingRight_F:
    dw $000B,$C3EF 
    db $00 
    dw $6142,$C3FD 
    db $01 
    dw $6144,$C206 
    db $00 
    dw $6142,$C3E8 
    db $FA 
    dw $612A,$C3E3 
    db $01 
    dw $612E,$C213 
    db $FB 
    dw $612C,$C3F8 
    db $FA 
    dw $6128,$C208 
    db $FA 
    dw $6126,$C3E8 
    db $EA 
    dw $6124,$C3F8 
    db $EA 
    dw $6122,$C208 
    db $EA 
    dw $6120 

Spritemap_MamaTurtle_FacingRight_10:
    dw $0006,$C208 
    db $00 
    dw $212A,$C3F8 
    db $00 
    dw $2128,$C3E8 
    db $00 
    dw $2126,$C208 
    db $F0 
    dw $2124,$C3F8 
    db $F0 
    dw $2122,$C3E8 
    db $F0 
    dw $2120 

Spritemap_MamaTurtle_FacingRight_11:
    dw $0004,$C3F0 
    db $00 
    dw $210E,$C3F0 
    db $F0 
    dw $210C,$C200 
    db $00 
    dw $610E,$C200 
    db $F0 
    dw $610C 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_MamaTurtle_FacingRight_A29959:
    dw $000A,$01F8 
    db $08 
    dw $215F,$01F8 
    db $00 
    dw $215E,$0000 
    db $08 
    dw $615F,$0000 
    db $00 
    dw $615E,$C3EA 
    db $00 
    dw $2140,$C206 
    db $00 
    dw $6140,$C3F0 
    db $FA 
    dw $210E,$C200 
    db $FA 
    dw $610E,$C3F0 
    db $EA 
    dw $210C,$C200 
    db $EA 
    dw $610C 
endif ; !FEATURE_KEEP_UNREFERENCED

Palette_Puyo:
    dw $3800,$4B9C,$2610,$0CC6,$0C63,$42F7,$2A52,$19AD 
    dw $0D29,$5617,$3D72,$1C48,$0C05,$033B,$0216,$0113 

InstList_Puyo_GroundedDropping_Fast:
    dw $0005 
    dw Spritemap_Puyo_0 
    dw $0005 
    dw Spritemap_Puyo_1 
    dw $0005 
    dw Spritemap_Puyo_2 
    dw $0005 
    dw Spritemap_Puyo_1 
    dw Instruction_Common_GotoY 
    dw InstList_Puyo_GroundedDropping_Fast 

InstList_Puyo_GroundedDropping_Medium:
    dw $0008 
    dw Spritemap_Puyo_0 
    dw $0008 
    dw Spritemap_Puyo_1 
    dw $0008 
    dw Spritemap_Puyo_2 
    dw $0008 
    dw Spritemap_Puyo_1 
    dw Instruction_Common_GotoY 
    dw InstList_Puyo_GroundedDropping_Medium 

InstList_Puyo_GroundedDropping_Slow:
    dw $000A 
    dw Spritemap_Puyo_0 
    dw $000A 
    dw Spritemap_Puyo_1 
    dw $000A 
    dw Spritemap_Puyo_2 
    dw $000A 
    dw Spritemap_Puyo_1 
    dw Instruction_Common_GotoY 
    dw InstList_Puyo_GroundedDropping_Slow 

InstList_Puyo_HoppingRight_0_HoppingLeft_4:
    dw $0001 
    dw Spritemap_Puyo_7 
    dw Instruction_Common_Sleep 

InstList_Puyo_HoppingRight_1_HoppingLeft_3:
    dw $0001 
    dw Spritemap_Puyo_6 
    dw Instruction_CommonA2_Sleep 

InstList_Puyo_Hopping_2:
    dw $0001 
    dw Spritemap_Puyo_5 
    dw Instruction_CommonA2_Sleep 

InstList_Puyo_HoppingRight_3_HoppingLeft_1:
    dw $0001 
    dw Spritemap_Puyo_4 
    dw Instruction_CommonA2_Sleep 

InstList_Puyo_HoppingRight_4_HoppingLeft_0:
    dw $0001 
    dw Spritemap_Puyo_3 
    dw Instruction_Common_Sleep 

PuyoHopTable_jumpHeight:
    dw $0010 

PuyoHopTable_XSpeed:
    dw $0100 

PuyoHopTable_YSpeedTableIndexDelta:
    dw $0200 

PuyoHopTable_airborneFunction:
    dw Function_Puyo_Airborne_Normal_ShortHop 
    dw $0020,$0100,$0200 
    dw Function_Puyo_Airborne_Normal_BigHop 
    dw $0020,$0200,$0300 
    dw Function_Puyo_Airborne_Normal_LongHop 
    dw $0080,$0140,$0200 
    dw Function_Puyo_Airborne_GiantHop 
    dw $0000,$0000,$0100 
    dw Function_Puyo_Airborne_Dropping 
    dw $0010,$0100,$01C0 
    dw Function_Puyo_Airborne_Dropped 
    dw $0015,$0100,$01C0 
    dw Function_Puyo_Airborne_Dropped 

InitAI_Puyo:
    LDX.W $0E54 
    LDA.W #Spritemap_CommonA2_Nothing : STA.W $0F8E,X 
    STZ.W $0FA8,X 
    LDA.W #InstList_Puyo_GroundedDropping_Fast 
    JSR.W SetPuyoInstList 
    LDA.W #$0000 : STA.L $7E7800,X 
    LDA.W #Function_Puyo_Grounded : STA.W $0FAE,X 
    LDA.W $0FB4,X : STA.W $0FAC,X 
    LDA.W #$0000 : STA.L $7E7808,X 
    RTL 


SetPuyoInstList:
    LDX.W $0E54 
    STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    STZ.W $0F90,X 
    RTS 


RTS_A29A7C:
    RTS 


MainAI_Puyo:
    LDX.W $0E54 
    JSR.W ($0FAE,X) 
    RTL 


InitiateHop:
    LDA.L $7E7800,X 
    CMP.W #$0003 
    BPL .hop 
    JSR.W Puyo_CheckIfSamusIsInProximity 
    LDA.L $7E7800,X 

.hop:
    JSR.W ChooseHopType 
    JSR.W Puyo_CalculateInitialHopSpeed 
    RTS 


Puyo_CheckIfSamusIsInProximity:
    LDX.W $0E54 
    LDA.W $0FB6,X 
    JSL.L IsSamusWithinAPixelColumnsOfEnemy 
    STA.L $7E7800,X 
    RTS 


ChooseHopType:
    LDX.W $0E54 
    LDA.W #$0001 : STA.L $7E7804,X 
    JSL.L Get_SamusX_minus_EnemyX 
    BMI .checkInverted 
    LDA.W #$0000 : STA.L $7E7804,X 

.checkInverted:
    LDA.L $7E7808,X : BEQ .notInverted 
    LDA.L $7E780A,X : STA.L $7E7804,X 

.notInverted:
    LDA.W #$0000 : STA.L $7E7808,X 
    JSR.W GetRandomNumber0_7 
    LDA.L $7E7800,X 
    CMP.W #$0003 
    BPL .greaterThan2 
    CMP.W #$0000 
    BNE .nonZeroHopType 
    LDA.B $1C : AND.W #$0001 : STA.B $1C 

.nonZeroHopType:
    LDA.B $1C 
    CMP.W #$0002 
    BMI .greaterThan2 
    LDA.W #$0002 

.greaterThan2:
    ASL #3
    STA.W $0FB2,X 
    TAY 
    LDA.W PuyoHopTable_airborneFunction,Y : STA.W $0FB0,X 
    RTS 


GetRandomNumber0_7:
    LDX.W $0E54 
    JSL.L GenerateRandomNumber 
    LDA.W $05E5 : CLC : ADC.W $0FA4,X : AND.W #$0007 
    STA.B $1C 
    RTS 


Puyo_CalculateInitialHopSpeed:
    LDX.W $0E54 
    LDY.W $0FB2,X 
    STZ.B $16 
    STZ.B $18 

.loop:
    LDA.B $16 : CLC : ADC.W PuyoHopTable_XSpeed,Y : STA.B $16 
    AND.W #$FF00 
    XBA 
    ASL #3
    TAY 
    LDA.B $18 : CLC : ADC.W CommonEnemySpeeds_QuadraticallyIncreasing+1,Y : STA.B $18 
    LDY.W $0FB2,X 
    LDA.W PuyoHopTable_jumpHeight,Y 
    XBA 
    CMP.B $18 
    BPL .loop 
    LDA.B $16 : STA.W $0FAA,X 
    LDA.W #$0000 : STA.L $7E7806,X 
    LDA.B $16 
    LSR A 
    STA.L $7E780E,X 
    LSR A 
    CLC : ADC.L $7E780E,X : STA.L $7E780C,X 
    RTS 


Function_Puyo_Grounded:
    DEC.W $0FAC,X 
    BPL .return 
    LDA.W #Function_Puyo_Airborne : STA.W $0FAE,X 
    LDA.W $0FB4,X : STA.W $0FAC,X 
    LDA.W #$0001 : STA.L $7E7802,X 
    JSR.W InitiateHop 

.return:
    RTS 


Function_Puyo_Airborne:
    LDX.W $0E54 
    JSR.W ($0FB0,X) 
    RTS 


PuyoMovement:
    LDX.W $0E54 
    LDA.W $0FAA,X 
    CMP.W #$4000 
    BMI + 
    LDA.W #$4000 

  + AND.W #$FF00 
    XBA 
    ASL #3
    TAY 
    LDA.L $7E7806,X : BEQ .notFalling 
    DEY #4
    .notFalling:
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing+4,Y : STA.B $12 
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing+6,Y : STA.B $14 
    CLC 
    JSL.L MoveEnemyDownBy_14_12 
    BCC .noCollision 
    LDA.L $7E7806,X : BNE .falling 
    LDA.B $01 : STA.L $7E7808,X 
    LDA.L $7E7804,X : EOR.W #$0001 : STA.L $7E780A,X 
    LDA.W #$0004 : STA.L $7E7800,X 
    LDA.W #Function_Puyo_Airborne_Dropping : STA.W $0FB0,X 
    LDA.W #$0000 : STA.L $7E7802,X 
    BRA .gotoReturn 


.falling:
    LDA.W #Function_Puyo_Grounded : STA.W $0FAE,X 
    LDA.W #$0000 : STA.L $7E7802,X 

.gotoReturn:
    BRA .return 


.noCollision:
    LDY.W $0FB2,X 
    LDA.L $7E7806,X : BNE ..falling 
    JSR.W SetRisingInstList 
    LDA.W $0FAA,X : SEC : SBC.W PuyoHopTable_YSpeedTableIndexDelta,Y : STA.W $0FAA,X 
    BRA + 


..falling:
    JSR.W SetFallingInstList 
    LDA.W $0FAA,X : CLC : ADC.W PuyoHopTable_YSpeedTableIndexDelta,Y : STA.W $0FAA,X 

  + BPL .positiveIndex 
    LDA.W #$0001 : STA.L $7E7806,X 
    STZ.W $0FAA,X 

.positiveIndex:
    LDY.W $0FB2,X 
    LDA.W PuyoHopTable_XSpeed,Y : AND.W #$FF00 
    XBA 
    STA.B $14 
    STZ.B $12 
    LDA.L $7E7804,X : BEQ .moveRight 
    LDA.B $14 
    EOR.W #$FFFF 
    INC A 
    STA.B $14 

.moveRight:
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes 
    BCC .return 
    LDA.W #$0001 : STA.L $7E7808,X 
    LDA.L $7E7804,X : EOR.W #$0001 : STA.L $7E780A,X 
    LDA.W #$0000 : STA.L $7E7802,X 
    LDA.W #$0004 : STA.L $7E7800,X 
    LDA.W #Function_Puyo_Airborne_Dropping : STA.W $0FB0,X 
    BRA .return ; >.<


.return:
    RTS 


SetRisingInstList:
    LDX.W $0E54 
    LDA.L $7E7804,X : BNE .left 
    LDA.W $0FAA,X 
    CMP.L $7E780C,X 
    BPL .rightFrame0 
    CMP.L $7E780E,X 
    BPL .rightFrame1 
    BRA .rightFrame2 


.rightFrame0:
    LDA.W #InstList_Puyo_HoppingRight_0_HoppingLeft_4 : BRA .return 


.rightFrame1:
    LDA.W #InstList_Puyo_HoppingRight_1_HoppingLeft_3 : BRA .return 


.rightFrame2:
    LDA.W #InstList_Puyo_Hopping_2 : BRA .return 


.left:
    LDA.W $0FAA,X 
    CMP.L $7E780C,X 
    BPL .leftFrame0 
    CMP.L $7E780E,X 
    BPL .leftFrame1 
    BRA .leftFrame2 


.leftFrame0:
    LDA.W #InstList_Puyo_HoppingRight_4_HoppingLeft_0 : BRA .return 


.leftFrame1:
    LDA.W #InstList_Puyo_HoppingRight_3_HoppingLeft_1 : BRA .return 


.leftFrame2:
    LDA.W #InstList_Puyo_Hopping_2 : BRA .return 


.return:
    JSR.W SetPuyoInstList 
    RTS 


SetFallingInstList:
    LDX.W $0E54 
    LDA.L $7E7804,X : BNE .left 
    LDA.W $0FAA,X 
    CMP.L $7E780E,X 
    BMI .rightFrame2 
    CMP.L $7E780C,X 
    BMI .rightFrame3 
    BRA .rightFrame4 


.rightFrame2:
    LDA.W #InstList_Puyo_Hopping_2 : BRA .return 


.rightFrame3:
    LDA.W #InstList_Puyo_HoppingRight_3_HoppingLeft_1 : BRA .return 


.rightFrame4:
    LDA.W #InstList_Puyo_HoppingRight_4_HoppingLeft_0 : BRA .return 


.left:
    LDA.W $0FAA,X 
    CMP.L $7E780E,X 
    BMI .leftFrame2 
    CMP.L $7E780C,X 
    BMI .leftFrame3 
    BRA .leftFrame4 


.leftFrame2:
    LDA.W #InstList_Puyo_Hopping_2 : BRA .return 


.leftFrame3:
    LDA.W #InstList_Puyo_HoppingRight_1_HoppingLeft_3 : BRA .return 


.leftFrame4:
    LDA.W #InstList_Puyo_HoppingRight_0_HoppingLeft_4 : BRA .return 


.return:
    JSR.W SetPuyoInstList 
    RTS 


Function_Puyo_Airborne_Normal_ShortHop:
    LDX.W $0E54 
    JSR.W PuyoMovement 
    LDA.L $7E7808,X : BNE .inverted 
    LDA.L $7E7802,X : BNE .return 

.inverted:
    LDA.W #$0000 : STA.L $7E7802,X 
    LDA.W #InstList_Puyo_GroundedDropping_Slow 
    JSR.W SetPuyoInstList 

.return:
    RTS 


Function_Puyo_Airborne_Normal_BigHop:
    LDX.W $0E54 
    JSR.W PuyoMovement 
    LDA.L $7E7808,X : BNE .inverted 
    LDA.L $7E7802,X : BNE .return 

.inverted:
    LDA.W #$0000 : STA.L $7E7802,X 
    LDA.W #InstList_Puyo_GroundedDropping_Medium 
    JSR.W SetPuyoInstList 

.return:
    RTS 


Function_Puyo_Airborne_Normal_LongHop:
    LDX.W $0E54 
    JSR.W PuyoMovement 
    LDA.L $7E7808,X : BNE .inverted 
    LDA.L $7E7802,X : BNE .return 

.inverted:
    LDA.W #$0000 : STA.L $7E7802,X 
    LDA.W #InstList_Puyo_GroundedDropping_Fast 
    JSR.W SetPuyoInstList 

.return:
    RTS 


Function_Puyo_Airborne_GiantHop:
    LDX.W $0E54 
    JSR.W PuyoMovement 
    LDA.L $7E7808,X : BNE .inverted 
    LDA.L $7E7802,X : BNE .return 
    LDA.W #$0000 : STA.L $7E7800,X 
    LDA.W #Function_Puyo_Grounded : STA.W $0FAE,X 

.inverted:
    LDA.W #$0000 : STA.L $7E7802,X 
    LDA.W #InstList_Puyo_GroundedDropping_Slow 
    JSR.W SetPuyoInstList 

.return:
    RTS 


Function_Puyo_Airborne_Dropping:
    LDX.W $0E54 
    LDY.W $0FB2,X 
    LDA.W PuyoHopTable_YSpeedTableIndexDelta,Y : AND.W #$FF00 
    XBA 
    STA.B $14 
    LDA.W PuyoHopTable_YSpeedTableIndexDelta,Y : AND.W #$00FF 
    XBA 
    STA.B $12 
    JSL.L MoveEnemyDownBy_14_12 
    BCC .return 
    JSR.W GetRandomNumber0_7 
    LDA.B $1C : AND.W #$0001 
    CLC : ADC.W #$0005 : STA.L $7E7800,X 
    LDA.W #Function_Puyo_Grounded : STA.W $0FAE,X 

.return:
    RTS 


Function_Puyo_Airborne_Dropped:
    LDX.W $0E54 
    JSR.W PuyoMovement 
    LDA.L $7E7802,X : BNE .return 
    LDA.W #$0000 : STA.L $7E7802,X 
    LDA.W #$0003 : STA.L $7E7800,X 
    LDA.W #Function_Puyo_Grounded : STA.W $0FAE,X 
    LDA.W #InstList_Puyo_GroundedDropping_Slow 
    JSR.W SetPuyoInstList 

.return:
    RTS 


RTL_A29DF4:
    RTL 


RTL_A29DF5:
    RTL 


Spritemap_Puyo_0:
    dw $0002,$0000 
    db $FC 
    dw $6100,$01F8 
    db $FC 
    dw $2100 

Spritemap_Puyo_1:
    dw $0002,$0000 
    db $FC 
    dw $6101,$01F8 
    db $FC 
    dw $2101 

Spritemap_Puyo_2:
    dw $0002,$0000 
    db $FC 
    dw $6102,$01F8 
    db $FC 
    dw $2102 

Spritemap_Puyo_3:
    dw $0002,$0000 
    db $FC 
    dw $2108,$01F8 
    db $FC 
    dw $2107 

Spritemap_Puyo_4:
    dw $0003,$0004 
    db $FC 
    dw $210B,$01FC 
    db $FC 
    dw $210A,$01F4 
    db $FC 
    dw $2109 

Spritemap_Puyo_5:
    dw $0004,$0008 
    db $FC 
    dw $210F,$0000 
    db $FC 
    dw $210E,$01F8 
    db $FC 
    dw $210D,$01F0 
    db $FC 
    dw $210C 

Spritemap_Puyo_6:
    dw $0003,$01F4 
    db $FC 
    dw $610B,$01FC 
    db $FC 
    dw $610A,$0004 
    db $FC 
    dw $6109 

Spritemap_Puyo_7:
    dw $0002,$01F8 
    db $FC 
    dw $6108,$0000 
    db $FC 
    dw $6107 

Palette_Cacatac:
    dw $3800,$3F57,$2E4D,$00E2,$0060,$3AB0,$220B,$1166 
    dw $0924,$57FF,$42F7,$2610,$158C,$017F,$0016,$300A 

InstList_Cacatac_UpsideUp_Idling:
    dw Instruction_Cacatac_SetFunction_MovingLeftRight 
    dw $0008 
    dw Spritemap_Cacatac_0 
    dw $0008 
    dw Spritemap_Cacatac_1 
    dw $0008 
    dw Spritemap_Cacatac_2 
    dw $0008 
    dw Spritemap_Cacatac_3 
    dw $0008 
    dw Spritemap_Cacatac_4 
    dw $0008 
    dw Spritemap_Cacatac_5 
    dw $0008 
    dw Spritemap_Cacatac_6 
    dw $0008 
    dw Spritemap_Cacatac_7 
    dw Instruction_Common_GotoY 
    dw InstList_Cacatac_UpsideUp_Idling 

InstList_Cacatac_UpsideUp_Attacking:
    dw $0015 
    dw Spritemap_Cacatac_0 
    dw $0005 
    dw Spritemap_Cacatac_8 
    dw $0015 
    dw Spritemap_Cacatac_9 
    dw $0005 
    dw Spritemap_Cacatac_8 
    dw Instruction_Cacatac_PlaySpikesSFX 
    dw Instruction_Cacatac_SpawnSpikeProjectileWithParameterInY 
    dw $0000 
    dw Instruction_Cacatac_SpawnSpikeProjectileWithParameterInY 
    dw $000C 
    dw Instruction_Cacatac_SpawnSpikeProjectileWithParameterInY 
    dw $0002 
    dw Instruction_Cacatac_SpawnSpikeProjectileWithParameterInY 
    dw $000E 
    dw Instruction_Cacatac_SpawnSpikeProjectileWithParameterInY 
    dw $0004 
    dw Instruction_CommonA2_GotoY 
    dw InstList_Cacatac_UpsideUp_Idling 

InstList_Cacatac_UpsideDown_Idling_0:
    dw Instruction_Cacatac_SetFunction_MovingLeftRight 

InstList_Cacatac_UpsideDown_Idling_1:
    dw $0008 
    dw Spritemap_Cacatac_A 
    dw $0008 
    dw Spritemap_Cacatac_B 
    dw $0008 
    dw Spritemap_Cacatac_C 
    dw $0008 
    dw Spritemap_Cacatac_D 
    dw $0008 
    dw Spritemap_Cacatac_E 
    dw $0008 
    dw Spritemap_Cacatac_F 
    dw $0008 
    dw Spritemap_Cacatac_10 
    dw $0008 
    dw Spritemap_Cacatac_11 
    dw Instruction_Common_GotoY 
    dw InstList_Cacatac_UpsideDown_Idling_1 

InstList_Cacatac_UpsideDown_Attacking:
    dw $0015 
    dw Spritemap_Cacatac_A 
    dw $0005 
    dw Spritemap_Cacatac_12 
    dw $0015 
    dw Spritemap_Cacatac_13 
    dw $0005 
    dw Spritemap_Cacatac_12 
    dw Instruction_Cacatac_PlaySpikesSFX 
    dw Instruction_Cacatac_SpawnSpikeProjectileWithParameterInY 
    dw $0006 
    dw Instruction_Cacatac_SpawnSpikeProjectileWithParameterInY 
    dw $0010 
    dw Instruction_Cacatac_SpawnSpikeProjectileWithParameterInY 
    dw $0008 
    dw Instruction_Cacatac_SpawnSpikeProjectileWithParameterInY 
    dw $0012 
    dw Instruction_Cacatac_SpawnSpikeProjectileWithParameterInY 
    dw $000A 
    dw Instruction_CommonA2_GotoY 
    dw InstList_Cacatac_UpsideDown_Idling_0 

Instruction_Cacatac_PlaySpikesSFX:
    PHX 
    PHY 
    LDA.W #$0034 
    JSL.L QueueSound_Lib2_Max6 
    PLY 
    PLX 
    RTL 


CacatacMaxTravelDistances:
    dw $0010,$0040,$0050,$0060,$0070,$0080 

CacatacFunctionPointers:
    dw Function_Cacatac_MovingLeft 
    dw Function_Cacatac_MovingRight 
    dw RTS_A2A01B 

InitAI_Cacatac:
    LDX.W $0E54 
    LDA.W #Spritemap_CommonA2_Nothing : STA.W $0F8E,X 
    LDA.W $0FB5,X : AND.W #$00FF 
    BEQ .upsideDown 
    JSR.W SetCacatacInstList_UpsideUp_Idling 
    BRA + 


.upsideDown:
    JSR.W SetCacatacInstList_UpsideDown_Idling 

  + LDA.W $0FB4,X : AND.W #$00FF : STA.W $0FB0,X 
    ASL A 
    TAY 
    LDA.W CacatacFunctionPointers,Y : STA.W $0FB2,X 
    LDA.W $0FB6,X : AND.W #$00FF 
    ASL A 
    TAY 
    LDA.W $0F7A,X : CLC : ADC.W CacatacMaxTravelDistances,Y : STA.L $7E7802,X 
    LDA.W $0F7A,X : SEC : SBC.W CacatacMaxTravelDistances,Y : STA.L $7E7800,X 
    LDA.W $0FB7,X : AND.W #$00FF 
    ASL #3
    TAY 
    LDA.W CommonEnemySpeeds_LinearlyIncreasing,Y : STA.W $0FAA,X 
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+2,Y : STA.W $0FA8,X 
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+4,Y : STA.W $0FAE,X 
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+6,Y : STA.W $0FAC,X 
    RTL 


MainAI_Cacatac:
    LDX.W $0E54 
    JSR.W ($0FB2,X) 
    RTL 


Function_Cacatac_MovingLeft:
    LDX.W $0E54 
    LDA.W $0F7C,X : CLC : ADC.W $0FAC,X : BCC + 
    INC.W $0F7A,X 

  + STA.W $0F7C,X 
    LDA.W $0F7A,X : CLC : ADC.W $0FAE,X : STA.W $0F7A,X 
    CMP.L $7E7800,X 
    BPL .attack 
    LDA.W #Function_Cacatac_MovingRight : STA.W $0FB2,X 
    LDA.W #$0001 : STA.W $0FB0,X 

.attack:
    JSR.W MaybeMakeCacatacAttack 
    RTS 


Function_Cacatac_MovingRight:
    LDX.W $0E54 
    LDA.W $0F7C,X : CLC : ADC.W $0FA8,X : BCC + 
    INC.W $0F7A,X 

  + STA.W $0F7C,X 
    LDA.W $0F7A,X : CLC : ADC.W $0FAA,X : STA.W $0F7A,X 
    CMP.L $7E7802,X 
    BMI .attack 
    LDA.W #Function_Cacatac_MovingLeft : STA.W $0FB2,X 
    STZ.W $0FB0,X 

.attack:
    JSR.W MaybeMakeCacatacAttack 
    RTS 


RTS_A2A01B:
    RTS 


MaybeMakeCacatacAttack:
    LDX.W $0E54 
    JSL.L GenerateRandomNumber 
    LDA.W $05E5 : CLC : ADC.W $0FA4,X : AND.W #$00FF 
    CMP.W #$0003 
    BPL .return 
    LDA.W #RTS_A2A01B : STA.W $0FB2,X 
    LDA.W $0FB5,X : AND.W #$00FF 
    BEQ .keepUpsideUp 
    JSR.W SetCacatacInstList_UpsideUp_Attacking 
    BRA .return 


.keepUpsideUp:
    JSR.W SetCacatacInstList_UpsideDown_Attacking 

.return:
    RTS 


SetCacatacInstList_UpsideUp_Idling:
    LDX.W $0E54 
    LDA.W #InstList_Cacatac_UpsideUp_Idling : STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    STZ.W $0F90,X 
    RTS 


SetCacatacInstList_UpsideUp_Attacking:
    LDX.W $0E54 
    LDA.W #InstList_Cacatac_UpsideUp_Attacking : STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    STZ.W $0F90,X 
    RTS 


SetCacatacInstList_UpsideDown_Idling:
    LDX.W $0E54 
    LDA.W #InstList_Cacatac_UpsideDown_Idling_0 : STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    STZ.W $0F90,X 
    RTS 


SetCacatacInstList_UpsideDown_Attacking:
    LDX.W $0E54 
    LDA.W #InstList_Cacatac_UpsideDown_Attacking : STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    STZ.W $0F90,X 
    RTS 


Instruction_Cacatac_SetFunction_MovingLeftRight:
    LDA.W #Function_Cacatac_MovingLeft : STA.W $0FB2,X 
    LDA.W $0FB0,X : BEQ .return 
    LDA.W #Function_Cacatac_MovingRight : STA.W $0FB2,X 

.return:
    RTL 


Instruction_Cacatac_SpawnSpikeProjectileWithParameterInY:
    PHY 
    LDA.W $0000,Y 
    LDX.W $0E54 
    LDY.W #EnemyProjectile_Cacatac 
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    PLY 
    INY #2
    RTL 


RTL_A2A0B9:
    RTL 


RTL_A2A0BA:
    RTL 


Spritemap_Cacatac_0:
    dw $0006,$0000 
    db $04 
    dw $610C,$0004 
    db $04 
    dw $610B,$01F8 
    db $04 
    dw $210C,$01F4 
    db $04 
    dw $210B,$01FC 
    db $EF 
    dw $211C,$C3F8 
    db $F7 
    dw $2100 

Spritemap_Cacatac_1:
    dw $0006,$01F8 
    db $04 
    dw $210C,$01F4 
    db $05 
    dw $210C,$0000 
    db $04 
    dw $610C,$0004 
    db $04 
    dw $610B,$01FC 
    db $F0 
    dw $211C,$C3F8 
    db $F8 
    dw $2100 

Spritemap_Cacatac_2:
    dw $0006,$01FA 
    db $05 
    dw $210D,$01F4 
    db $04 
    dw $210C,$0000 
    db $04 
    dw $610C,$0004 
    db $04 
    dw $610B,$01FC 
    db $F0 
    dw $211C,$C3F8 
    db $F8 
    dw $2100 

Spritemap_Cacatac_3:
    dw $0006,$0000 
    db $05 
    dw $610B,$01FA 
    db $04 
    dw $210D,$01F4 
    db $04 
    dw $210C,$0004 
    db $04 
    dw $610B,$01FC 
    db $F1 
    dw $211C,$C3F8 
    db $F9 
    dw $2100 

Spritemap_Cacatac_4:
    dw $0006,$0000 
    db $04 
    dw $610B,$0004 
    db $05 
    dw $610C,$01FA 
    db $04 
    dw $210D,$01F4 
    db $04 
    dw $210C,$01FC 
    db $F1 
    dw $211C,$C3F8 
    db $F9 
    dw $2100 

Spritemap_Cacatac_5:
    dw $0006,$0000 
    db $05 
    dw $610C,$0004 
    db $04 
    dw $610C,$01FA 
    db $04 
    dw $210D,$01F4 
    db $04 
    dw $210C,$01FC 
    db $F0 
    dw $211C,$C3F8 
    db $F8 
    dw $2100 

Spritemap_Cacatac_6:
    dw $0006,$0000 
    db $04 
    dw $610C,$0004 
    db $04 
    dw $610C,$01F8 
    db $05 
    dw $210C,$01F4 
    db $04 
    dw $210C,$01FC 
    db $F0 
    dw $211C,$C3F8 
    db $F8 
    dw $2100 

Spritemap_Cacatac_7:
    dw $0006,$0000 
    db $04 
    dw $610C,$0004 
    db $04 
    dw $610C,$01F8 
    db $04 
    dw $210C,$01F4 
    db $05 
    dw $210B,$01FC 
    db $EF 
    dw $211C,$C3F8 
    db $F7 
    dw $2100 

Spritemap_Cacatac_8:
    dw $000A,$01FC 
    db $ED 
    dw $211C,$0000 
    db $04 
    dw $610C,$0004 
    db $04 
    dw $610B,$01F8 
    db $04 
    dw $210C,$01F4 
    db $04 
    dw $210B,$0004 
    db $02 
    dw $210A,$01FC 
    db $02 
    dw $2109,$01F4 
    db $02 
    dw $2108,$C3FC 
    db $F2 
    dw $2103,$C3F4 
    db $F2 
    dw $2102 

Spritemap_Cacatac_9:
    dw $000A,$01FC 
    db $E9 
    dw $211C,$0000 
    db $04 
    dw $610C,$0004 
    db $04 
    dw $610B,$01F8 
    db $04 
    dw $210C,$01F4 
    db $04 
    dw $210B,$0004 
    db $00 
    dw $211A,$01FC 
    db $00 
    dw $2119,$01F4 
    db $00 
    dw $2118,$C3FC 
    db $F0 
    dw $2106,$C3F4 
    db $F0 
    dw $2105 

Spritemap_Cacatac_A:
    dw $0006,$0000 
    db $F4 
    dw $E10C,$0004 
    db $F4 
    dw $E10B,$01F8 
    db $F4 
    dw $A10C,$01F4 
    db $F4 
    dw $A10B,$01FC 
    db $09 
    dw $A11C,$C3F8 
    db $F9 
    dw $A100 

Spritemap_Cacatac_B:
    dw $0006,$01F8 
    db $F4 
    dw $A10C,$01F4 
    db $F3 
    dw $A10C,$0000 
    db $F4 
    dw $E10C,$0004 
    db $F4 
    dw $E10B,$01FC 
    db $08 
    dw $A11C,$C3F8 
    db $F8 
    dw $A100 

Spritemap_Cacatac_C:
    dw $0006,$01FA 
    db $F3 
    dw $A10D,$01F4 
    db $F4 
    dw $A10C,$0000 
    db $F4 
    dw $E10C,$0004 
    db $F4 
    dw $E10B,$01FC 
    db $08 
    dw $A11C,$C3F8 
    db $F8 
    dw $A100 

Spritemap_Cacatac_D:
    dw $0006,$0000 
    db $F3 
    dw $E10B,$01FA 
    db $F4 
    dw $A10D,$01F4 
    db $F4 
    dw $A10C,$0004 
    db $F4 
    dw $E10B,$01FC 
    db $07 
    dw $A11C,$C3F8 
    db $F7 
    dw $A100 

Spritemap_Cacatac_E:
    dw $0006,$0000 
    db $F4 
    dw $E10B,$0004 
    db $F3 
    dw $E10C,$01FA 
    db $F4 
    dw $A10D,$01F4 
    db $F4 
    dw $A10C,$01FC 
    db $07 
    dw $A11C,$C3F8 
    db $F7 
    dw $A100 

Spritemap_Cacatac_F:
    dw $0006,$0000 
    db $F3 
    dw $E10C,$0004 
    db $F4 
    dw $E10C,$01FA 
    db $F4 
    dw $A10D,$01F4 
    db $F4 
    dw $A10C,$01FC 
    db $08 
    dw $A11C,$C3F8 
    db $F8 
    dw $A100 

Spritemap_Cacatac_10:
    dw $0006,$0000 
    db $F4 
    dw $E10C,$0004 
    db $F4 
    dw $E10C,$01F8 
    db $F3 
    dw $A10C,$01F4 
    db $F4 
    dw $A10C,$01FC 
    db $08 
    dw $A11C,$C3F8 
    db $F8 
    dw $A100 

Spritemap_Cacatac_11:
    dw $0006,$0000 
    db $F4 
    dw $E10C,$0004 
    db $F4 
    dw $E10C,$01F8 
    db $F4 
    dw $A10C,$01F4 
    db $F3 
    dw $A10B,$01FC 
    db $09 
    dw $A11C,$C3F8 
    db $F9 
    dw $A100 

Spritemap_Cacatac_12:
    dw $000A,$01FC 
    db $0B 
    dw $A11C,$0000 
    db $F4 
    dw $E10C,$0004 
    db $F4 
    dw $E10B,$01F8 
    db $F4 
    dw $A10C,$01F4 
    db $F4 
    dw $A10B,$0004 
    db $F6 
    dw $A10A,$01FC 
    db $F6 
    dw $A109,$01F4 
    db $F6 
    dw $A108,$C3FC 
    db $FE 
    dw $A103,$C3F4 
    db $FE 
    dw $A102 

Spritemap_Cacatac_13:
    dw $000A,$01FC 
    db $0F 
    dw $A11C,$0000 
    db $F4 
    dw $E10C,$0004 
    db $F4 
    dw $E10B,$01F8 
    db $F4 
    dw $A10C,$01F4 
    db $F4 
    dw $A10B,$0004 
    db $F8 
    dw $A11A,$01FC 
    db $F8 
    dw $A119,$01F4 
    db $F8 
    dw $A118,$C3FC 
    db $00 
    dw $A106,$C3F4 
    db $00 
    dw $A105 

Palette_Owtch:
    dw $3800,$4B9C,$2610,$0CC6,$0C63,$42F7,$2A52,$19AD 
    dw $0D29,$5E59,$3D72,$2CEE,$1447,$033B,$0216,$0113 

InstList_Owtch_MovingLeft_0:
    dw Instruction_Owtch_0 

InstList_Owtch_MovingLeft_1:
    dw $0008 
    dw Spritemap_Owtch_0 
    dw $0008 
    dw Spritemap_Owtch_1 
    dw $0008 
    dw Spritemap_Owtch_2 
    dw Instruction_Common_GotoY 
    dw InstList_Owtch_MovingLeft_1 

InstList_Owtch_MovingRight_0:
    dw Instruction_Owtch_1 

InstList_Owtch_MovingRight_1:
    dw $0008 
    dw Spritemap_Owtch_2 
    dw $0008 
    dw Spritemap_Owtch_1 
    dw $0008 
    dw Spritemap_Owtch_0 
    dw Instruction_Common_GotoY 
    dw InstList_Owtch_MovingRight_1 

OwtchConstants_initAIPointers:
    dw SetOwtchInitialInstListPointer_MovingLeft 
    dw SetOwtchInitialInstListPointer_MovingRight 

OwtchConstants_functionPointers:
    dw Function_Owtch_0_MovingLeft 
    dw Function_Owtch_1_MovingRight 
    dw Function_Owtch_2_Underground 
    dw Function_Owtch_3_Sinking 
    dw Function_Owtch_4_Rising 

OwtchConstants_XDistanceRanges:
    dw $0010,$0020,$0030,$0040,$0050,$0060,$0070,$0080 

OwtchConstants_undergroundTimers:
    dw $0020,$0040,$0060,$0080,$00A0,$00C0 

InitAI_Owtch:
    LDX.W $0E54 
    LDA.W #Spritemap_CommonA2_Nothing : STA.W $0F8E,X 
    LDA.W $0FB4,X : AND.W #$00FF : STA.W $0FB0,X 
    AND.W #$0001 
    ASL A 
    TAX 
    JSR.W (OwtchConstants_initAIPointers,X) 
    LDX.W $0E54 
    LDA.W $0FB6,X : AND.W #$00FF 
    ASL #3
    TAY 
    LDA.W CommonEnemySpeeds_LinearlyIncreasing,Y : STA.W $0FAA,X 
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+2,Y : STA.W $0FA8,X 
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+4,Y : STA.W $0FAE,X 
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+6,Y : STA.W $0FAC,X 
    LDA.W $0FB7,X : AND.W #$00FF 
    ASL A 
    TAY 
    LDA.W $0F7A,X : CLC : ADC.W OwtchConstants_XDistanceRanges,Y : STA.L $7E7804,X 
    LDA.W $0F7A,X : SEC : SBC.W OwtchConstants_XDistanceRanges,Y : STA.L $7E7802,X 
    LDA.W $0FB5,X : AND.W #$00FF 
    ASL A 
    TAY 
    LDA.W OwtchConstants_undergroundTimers,Y : STA.L $7E7800,X 
    STZ.W $0FB2,X 
    LDA.W $0FB0,X 
    CMP.W #$0002 
    BNE .return 
    LDA.W #$0010 : STA.W $0FB2,X 
    CLC : ADC.W $0F7E,X : STA.W $0F7E,X 

.return:
    RTL 


MainAI_Owtch:
    LDX.W $0E54 
    LDA.W $0FB0,X 
    ASL A 
    TAX 
    JSR.W (OwtchConstants_functionPointers,X) 
    RTL 


SetOwtchInitialInstListPointer_MovingLeft:
    LDX.W $0E54 
    LDA.W #InstList_Owtch_MovingLeft_0 : STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    STZ.W $0F90,X 
    RTS 


SetOwtchInitialInstListPointer_MovingRight:
    LDX.W $0E54 
    LDA.W #InstList_Owtch_MovingRight_0 : STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    STZ.W $0F90,X 
    RTS 


Function_Owtch_0_MovingLeft:
    LDX.W $0E54 
    LDA.W $0F7C,X : CLC : ADC.W $0FAC,X : BCC + 
    INC.W $0F7A,X 

  + STA.W $0F7C,X 
    LDA.W $0F7A,X : CLC : ADC.W $0FAE,X : STA.W $0F7A,X 
    CMP.L $7E7802,X 
    BPL + 
    DEC.W $0FB0,X 

  + JSR.W MaybeMakeOwtchSink 
    RTS 


Function_Owtch_1_MovingRight:
    LDX.W $0E54 
    LDA.W $0F7C,X : CLC : ADC.W $0FA8,X : BCC + 
    INC.W $0F7A,X 

  + STA.W $0F7C,X 
    LDA.W $0F7A,X : CLC : ADC.W $0FAA,X : STA.W $0F7A,X 
    CMP.L $7E7804,X 
    BMI + 
    STZ.W $0FB0,X 

  + JSR.W MaybeMakeOwtchSink 
    RTS 


Function_Owtch_2_Underground:
    LDX.W $0E54 
    LDA.L $7E7800,X 
    DEC A 
    STA.L $7E7800,X 
    BNE .return 
    LDA.W #$0004 : STA.W $0FB0,X 

.return:
    RTS 


Function_Owtch_3_Sinking:
    LDX.W $0E54 
    INC.W $0F7E,X 
    INC.W $0FB2,X 
    LDA.W $0FB2,X 
    CMP.W #$0010 
    BMI .return 
    LDA.W #$0002 : STA.W $0FB0,X 
    LDA.W $0FB5,X : AND.W #$00FF 
    ASL A 
    TAY 
    LDA.W OwtchConstants_undergroundTimers,Y : STA.L $7E7800,X 

.return:
    RTS 


Function_Owtch_4_Rising:
    LDX.W $0E54 
    DEC.W $0F7E,X 
    DEC.W $0FB2,X 
    BNE .return 
    LDA.W $05E6 : AND.W #$0001 : STA.W $0FB0,X 

.return:
    RTS 


MaybeMakeOwtchSink:
    JSL.L GenerateRandomNumber 
    LDA.W $05E5 : CLC : ADC.W $0FA4,X : AND.W #$00FF 
    CMP.W #$0006 
    BPL .return 
    LDA.W #$0003 : STA.W $0FB0,X 

.return:
    RTS 


Instruction_Owtch_0:
    STZ.W $0FB0,X 
    RTL 


Instruction_Owtch_1:
    LDA.W #$0001 : STA.W $0FB0,X 
    RTL 


RTL_A2A578:
    RTL 


EnemyShot_Owtch:
    LDX.W $0E54 
    LDA.W $0FB0,X 
    CMP.W #$0001 
    BPL .return 
    JSL.L CommonA2_NormalEnemyShotAI 

.return:
    RTL 


Spritemap_Owtch_0:
    dw $0001,$C3F8 
    db $F8 
    dw $2100 

Spritemap_Owtch_1:
    dw $0001,$C3F8 
    db $F8 
    dw $2102 

Spritemap_Owtch_2:
    dw $0001,$C3F8 
    db $F8 
    dw $2104 

Palette_Ship:
    dw $3800,$0295,$0190,$0403,$0001,$0211,$014D,$00C9 
    dw $0024,$3BE0,$2680,$1580,$24C6,$1442,$0000,$0000 

InstList_ShipEntrancePad_Opening_0:
    dw $0028 
    dw Spritemap_Ship_C 
    dw $0008 
    dw Spritemap_Ship_B 
    dw $0008 
    dw Spritemap_Ship_2 
    dw $0008 
    dw Spritemap_Ship_3 
    dw $0018 
    dw Spritemap_Ship_4 
    dw $0008 
    dw Spritemap_Ship_5 
    dw $0007 
    dw Spritemap_Ship_6 
    dw $0006 
    dw Spritemap_Ship_7 
    dw $0005 
    dw Spritemap_Ship_8 
    dw $0004 
    dw Spritemap_Ship_9 

InstList_ShipEntrancePad_Opening_1:
    dw $0004 
    dw Spritemap_Ship_A 
    dw Instruction_Common_GotoY 
    dw InstList_ShipEntrancePad_Opening_1 

InstList_ShipEntrancePad_Closing:
    dw $0004 
    dw Spritemap_Ship_9 
    dw $0005 
    dw Spritemap_Ship_8 
    dw $0006 
    dw Spritemap_Ship_7 
    dw $0007 
    dw Spritemap_Ship_6 
    dw $0008 
    dw Spritemap_Ship_5 
    dw $0018 
    dw Spritemap_Ship_4 
    dw $0008 
    dw Spritemap_Ship_3 
    dw $0008 
    dw Spritemap_Ship_B 

InstList_ShipEntrancePad_Closed:
    dw $0008 
    dw Spritemap_Ship_C 
    dw Instruction_Common_GotoY 
    dw InstList_ShipEntrancePad_Closed 

InstList_ShipTop:
    dw $0001 
    dw Spritemap_Ship_0 
    dw Instruction_Common_Sleep 

InstList_ShipBottom:
    dw $0001 
    dw Spritemap_Ship_1 
    dw Instruction_CommonA2_Sleep 

ShipBrakesMovementData:
    dw $0001,$0001,$0001,$0001,$0001,$0001,$0000,$0000 
    dw $0000,$0000,$0000,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF 
    dw $FFFF 

InitAI_ShipTop:
    LDX.W $0E54 
    LDA.W $0F86,X : ORA.W #$2400 : STA.W $0F86,X 
    LDA.W #$0001 : STA.W $0F94,X 
    STZ.W $0F90,X 
    LDA.W #InstList_ShipTop : STA.W $0F92,X 
    LDA.W #$0E00 : STA.W $0F96,X 
    LDA.W $0998 
    CMP.W #$0028 
    BEQ .demoTransition 

.landingOnZebes:
    LDA.L $7ED914 
    CMP.W #$0022 
    BNE .notLandingOnZebes 
    LDA.W $0AFA : SEC : SBC.W #$0011 : STA.W $0F7E,X 
    LDA.W #Function_Ship_LandingOnZebes_Descending : STA.W $0FB2,X 
    BRA .merge 


.notLandingOnZebes:
    LDA.W $0F7E,X : SEC : SBC.W #$0019 : STA.W $0F7E,X 
    STA.W $0FB0,X 
    LDA.W #Function_Ship_Idle_HandleLettingSamusEnter : STA.W $0FB2,X 
    BRA .merge 


.demoTransition:
    LDA.W $1F55 : BNE .landingOnZebes 
    LDA.W #$0472 : STA.W $0AFA 
    LDA.W $0F7E,X : SEC : SBC.W #$0019 : STA.W $0F7E,X 
    STA.W $0FB0,X 
    LDA.W #Function_Ship_SamusExiting_WaitForEntrancePadToOpen : STA.W $0FB2,X 
    LDA.W #$0090 : STA.W $0FA8 

.merge:
    LDY.W #PaletteFXObjects_GunshipGlow 
    JSL.L Spawn_PaletteFXObject 
    LDA.W #$0001 : STA.W $0FAE,X 
    STZ.W $0FAC 
    RTL 


InitAI_ShipBottomEntrance:
    LDX.W $0E54 
    LDA.W $0F86,X : ORA.W #$2400 : STA.W $0F86,X 
    LDA.W #$0001 : STA.W $0F94,X 
    STZ.W $0F90,X 
    LDA.W $0FB6,X : BEQ .shipBottom 
    LDA.W #InstList_ShipEntrancePad_Closed : STA.W $0F92,X 
    BRA + 


.shipBottom:
    LDA.W #InstList_ShipBottom : STA.W $0F92,X 

  + LDA.W $0F58,X : STA.W $0F98,X 
    LDA.W #$0E00 : STA.W $0F96,X 
    LDA.W $0FB6,X : BNE .entrancePad 
    LDA.L $7ED914 
    CMP.W #$0022 
    BNE .notLandingOnZebes 
    LDA.W $0AFA : CLC : ADC.W #$0017 : STA.W $0F7E,X 
    BRA .merge 


.notLandingOnZebes:
    LDA.W $0F7E,X : CLC : ADC.W #$000F : STA.W $0F7E,X 
    LDA.W #$0047 : STA.W $0FAE,X 
    BRA .merge 


.entrancePad:
    LDA.W $0EFE,X 
    DEC A 
    STA.W $0F7E,X 
    LDA.W $0998 
    CMP.W #$0028 
    BNE .merge 
    LDA.W $1F55 : BNE .merge 
    LDA.W #$0001 : STA.W $0F94,X 
    LDA.W #InstList_ShipEntrancePad_Opening_0 : STA.W $0F92,X 

.merge:
    LDA.W #RTL_A2A7D7 : STA.W $0FB2,X 
    RTL 


MainAI_ShipTop:
    LDX.W $0E54 
    DEC.W $0FEE,X 
    BEQ .SFX 
    BPL .noSFX 

.SFX:
    LDA.W #$004D 
    JSL.L QueueSound_Lib2_Max6 
    LDA.W #$0046 : STA.W $0FEE,X 

.noSFX:
    LDA.W $0FB2,X 
    CMP.W #Function_Ship_LandingOnZebes_WaitForShipEntranceToOpen 
    BMI .function 
    CMP.W #Function_Ship_Liftoff_FireUpEngines_SpawnDustClouds 
    BPL .function 
    JSR.W ProcessShipHover 

.function:
    JMP.W ($0FB2,X) 


RTL_A2A783:
    RTL 


ProcessShipHover:
    DEC.W $0FAE,X 
    BEQ .timerExpired 
    BPL .return 

.timerExpired:
    LDA.W $0FAC,X 
    ASL A 
    TAY 
    LDA.W .timer,Y : AND.W #$00FF : STA.W $0FAE,X 
    LDA.W .YVelocity,Y : AND.W #$00FF 
    BIT.W #$0080 
    BEQ + 
    ORA.W #$FF00 

  + STA.B $12 
    LDA.W $0F7E,X : CLC : ADC.B $12 : STA.W $0F7E,X 
    LDA.W $0FBE,X : CLC : ADC.B $12 : STA.W $0FBE,X 
    LDA.W $0FFE,X : CLC : ADC.B $12 : STA.W $0FFE,X 
    LDA.W $0FAC,X 
    INC A 
    AND.W #$0003 
    STA.W $0FAC,X 

.return:
    RTS 


.timer:
    db $10 

.YVelocity:
    db $01,$10,$FF,$10,$FF,$10,$01 

RTL_A2A7D7:
    RTL 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Function_Ship_RiseToYPosition80_Descend:
    LDA.W $0AFA : SEC : SBC.W #$0008 : STA.W $0AFA 
    LDA.W $0FFE,X : SEC : SBC.W #$0008 : STA.W $0FFE,X 
    LDA.W $0FBE,X : SEC : SBC.W #$0008 : STA.W $0FBE,X 
    LDA.W $0F7E,X : SEC : SBC.W #$0008 : STA.W $0F7E,X 
    CMP.W #$0080 
    BPL .return 
    LDA.W #Function_Ship_LandingOnZebes_Descending : STA.W $0FB2,X 

.return:
    RTL 
endif ; !FEATURE_KEEP_UNREFERENCED


Function_Ship_LandingOnZebes_Descending:
    LDA.W $0F7E,X 
    CMP.W #$0300 
    BPL .slowDown 
    LDA.W $0AFC : CLC : ADC.W #$8000 : STA.W $0AFC 
    LDA.W $0AFA : ADC.W #$0004 : STA.W $0AFA 
    LDA.W $1000,X : CLC : ADC.W #$8000 : STA.W $1000,X 
    LDA.W $0FFE,X : ADC.W #$0004 : STA.W $0FFE,X 
    LDA.W $0FC0,X : CLC : ADC.W #$8000 : STA.W $0FC0,X 
    LDA.W $0FBE,X : ADC.W #$0004 : STA.W $0FBE,X 
    LDA.W $0F80,X : CLC : ADC.W #$8000 : STA.W $0F80,X 
    LDA.W $0F7E,X : ADC.W #$0004 : STA.W $0F7E,X 
    RTL 


.slowDown:
    LDA.W $0AFC : CLC : ADC.W #$8000 : STA.W $0AFC 
    LDA.W $0AFA : ADC.W #$0002 : STA.W $0AFA 
    LDA.W $1000,X : CLC : ADC.W #$8000 : STA.W $1000,X 
    LDA.W $0FFE,X : ADC.W #$0002 : STA.W $0FFE,X 
    LDA.W $0FC0,X : CLC : ADC.W #$8000 : STA.W $0FC0,X 
    LDA.W $0FBE,X : ADC.W #$0002 : STA.W $0FBE,X 
    LDA.W $0F80,X : CLC : ADC.W #$8000 : STA.W $0F80,X 
    LDA.W $0F7E,X : ADC.W #$0002 : STA.W $0F7E,X 
    CMP.W #$045F 
    BMI .return 
    LDA.W #$045F : STA.W $0F7E,X 
    CLC : ADC.W #$0028 : STA.W $0FBE,X 
    LDA.W $0F7E,X 
    DEC A 
    STA.W $0FFE,X 
    LDA.W #Function_Ship_LandingOnZebes_ApplyBrakes : STA.W $0FB2,X 
    STZ.W $0FB0,X 

.return:
    RTL 


Function_Ship_LandingOnZebes_ApplyBrakes:
    LDA.W $0FB0,X 
    ASL A 
    TAY 
    LDA.W $0AFA : CLC : ADC.W ShipBrakesMovementData,Y : STA.W $0AFA 
    LDA.W $0FFE,X : CLC : ADC.W ShipBrakesMovementData,Y : STA.W $0FFE,X 
    LDA.W $0FBE,X : CLC : ADC.W ShipBrakesMovementData,Y : STA.W $0FBE,X 
    LDA.W $0F7E,X : CLC : ADC.W ShipBrakesMovementData,Y : STA.W $0F7E,X 
    LDA.W $0FB0,X 
    INC A 
    STA.W $0FB0,X 
    CMP.W #$0011 
    BMI .return 
    LDA.W #Function_Ship_LandingOnZebes_WaitForShipEntranceToOpen : STA.W $0FB2,X 
    LDA.W $0F7E,X : STA.W $0FB0,X 
    LDA.W #$0001 : STA.W $0FAE,X 
    STZ.W $0FAC 
    LDA.W $0F7A,X 
    INC A 
    STA.W $0AF6 
    STA.W $0B10 
    LDA.W #$0001 : STA.W $1014,X 
    LDA.W #InstList_ShipEntrancePad_Opening_0 : STA.W $1012,X 
    LDA.W #$0090 : STA.W $0FA8 
    LDA.W #$0014 
    JSL.L QueueSound_Lib3_Max6 

.return:
    RTL 


Function_Ship_LandingOnZebes_WaitForShipEntranceToOpen:
    DEC.W $0FA8 
    BEQ .timerExpired 
    BPL .return 

.timerExpired:
    LDA.W #Function_Ship_LandingOnZebes_EjectSamus : STA.W $0FB2,X 

.return:
    RTL 


Function_Ship_LandingOnZebes_EjectSamus:
    LDA.W $0FB0,X : SEC : SBC.W #$001E : STA.B $12 
    LDA.W $0AFA : SEC : SBC.W #$0001 : STA.W $0AFA 
    CMP.B $12 
    BPL .return 
    LDA.W #Function_Ship_LandOnZebes_WaitForShipEntranceToClose_UnlockSamus : STA.W $0FB2,X 
    LDA.W #$0001 : STA.W $1014,X 
    LDA.W #InstList_ShipEntrancePad_Closing : STA.W $1012,X 
    LDA.W #$0090 : STA.W $0FA8 
    LDA.W #$0015 
    JSL.L QueueSound_Lib3_Max6 

.return:
    RTL 


Function_Ship_LandOnZebes_WaitForShipEntranceToClose_UnlockSamus:
    DEC.W $0FA8 
    BEQ .timerExpired 
    BPL .return 

.timerExpired:
    LDA.W #Function_Ship_Idle_HandleLettingSamusEnter : STA.W $0FB2,X 
    LDA.W #SamusCurrentStateHandler_Normal : STA.W $0A42 
    LDA.W #SamusNewStateHandler_Normal : STA.W $0A44 
    LDA.W #$0005 : STA.L $7ED914 
    LDA.L $7ED8F8 : ORA.W #$0001 : STA.L $7ED8F8 
    STZ.W $078B 
    LDA.W $0952 
    JSL.L SaveToSRAM 

.return:
    RTL 


Function_Ship_Idle_HandleLettingSamusEnter:
    LDA.W $0998 
    CMP.W #$0008 
    BNE .return 
    LDA.W $0A42 
    CMP.W #SamusCurrentStateHandler_Normal 
    BNE .return 
    LDA.W $0F7A,X : SEC : SBC.W #$0008 : CMP.W $0AF6 
    BPL .return 
    LDA.W $0F7A,X : CLC : ADC.W #$0008 : CMP.W $0AF6 
    BMI .return 
    LDA.W $0F7E,X : SEC : SBC.W #$0040 : CMP.W $0AFA 
    BPL .return 
    LDA.W $0F7E,X 
    CMP.W $0AFA 
    BMI .return 
    LDA.W $0A1F : AND.W #$00FF 
    BNE .return 
    LDA.B $8F 
    BIT.W #$0400 
    BNE .enterShip 

.return:
    RTL 


.enterShip:
    LDA.W #Function_Ship_SamusEntering_WaitForEntrancePadToOpen : STA.W $0FB2,X 
    LDA.W $0AF6 
    CMP.W #$0480 
    BEQ .skipMovingSamus 
    LDA.W $0F7A,X : STA.W $0AF6 
    STA.W $0B10 

.skipMovingSamus:
    JSL.L MakeSamusFaceForward 
    LDA.W #$001A 
    JSL.L Run_Samus_Command 
    STZ.W $0E18 
    LDA.W $0F7E,X 
    DEC A 
    STA.W $0FFE,X 
    LDA.W #$0001 : STA.W $1014,X 
    LDA.W #InstList_ShipEntrancePad_Opening_0 : STA.W $1012,X 
    LDA.W #$0090 : STA.W $0FA8 
    LDA.W #$0014 
    JSL.L QueueSound_Lib3_Max6 
    RTL 


Function_Ship_SamusEntering_WaitForEntrancePadToOpen:
    DEC.W $0FA8 
    BEQ .timerExpired 
    BPL .return 

.timerExpired:
    LDA.W #Function_Ship_SamusEntering_LowerSamus : STA.W $0FB2,X 

.return:
    RTL 


Function_Ship_SamusEntering_LowerSamus:
    LDA.W $0FB0,X : CLC : ADC.W #$0012 : STA.B $12 
    LDA.W $0AFA : CLC : ADC.W #$0002 : STA.W $0AFA 
    CMP.B $12 
    BMI .return 
    LDA.W #Function_Ship_SamusEntering_WaitForEntrancePadToClose : STA.W $0FB2,X 
    LDA.W #$0001 : STA.W $1014,X 
    LDA.W #InstList_ShipEntrancePad_Closing : STA.W $1012,X 
    LDA.W #$0090 : STA.W $0FA8 
    LDA.W #$0015 
    JSL.L QueueSound_Lib3_Max6 

.return:
    RTL 


Function_Ship_SamusEntering_WaitForEntrancePadToClose:
    DEC.W $0FA8 
    BEQ .timerExpired 
    BPL .return 

.timerExpired:
    LDA.W #Function_Ship_SamusEntered_LiftoffOrRestoreSamusEnergyAmmo : STA.W $0FB2,X 

.return:
    RTL 


Function_Ship_SamusEntered_LiftoffOrRestoreSamusEnergyAmmo:
    LDA.W #$000E 
    JSL.L CheckIfEvent_inA_HasHappened 
    BCS .liftoff 
    LDA.W #$0002 
    JSL.L Restore_A_Energy_ToSamus 
    LDA.W #$0002 
    JSL.L Restore_A_Missiles_ToSamus 
    LDA.W #$0002 
    JSL.L Restore_A_SuperMissiles_ToSamus 
    LDA.W #$0002 
    JSL.L Restore_A_PowerBombs_ToSamus 
    LDA.W $09D6 
    CMP.W $09D4 
    BMI .return 
    LDA.W $09C2 
    CMP.W $09C4 
    BMI .return 
    LDA.W $09C6 
    CMP.W $09C8 
    BMI .return 
    LDA.W $09CA 
    CMP.W $09CC 
    BMI .return 
    LDA.W $09CE 
    CMP.W $09D0 
    BMI .return 
    BRA .continue 

    LDA.B $8D 
    BIT.W #$8000 
    BEQ .continue 

.liftoff:
    LDA.W #Function_Ship_Liftoff_LoadDustCloudTiles : STA.W $0FB2,X 
    STZ.W $0FF2,X 
    STZ.W $0FF0,X 
    STZ.W $0DEC 
    STZ.W $0DEE 
    STZ.W $0DF0 
    STZ.W $0DF2 
    LDA.W #$000A 
    JSL.L Run_Samus_Command 
    RTL 


.continue:
    LDA.W #Function_Ship_SamusEntered_HandleSaveConfirmation : STA.W $0FB2,X 

.return:
    RTL 


Function_Ship_SamusEntered_HandleSaveConfirmation:
    LDA.W #$001C 
    JSL.L MessageBox_Routine 
    CMP.W #$0002 
    BEQ .selectedNo 
    LDA.L $7ED8F8 : ORA.W #$0001 : STA.L $7ED8F8 
    STZ.W $078B 
    LDA.W $0952 
    JSL.L SaveToSRAM 

.selectedNo:
    LDA.W #Function_Ship_SamusExiting_WaitForEntrancePadToOpen : STA.W $0FB2,X 
    LDA.W #$0001 : STA.W $1014,X 
    LDA.W #InstList_ShipEntrancePad_Opening_0 : STA.W $1012,X 
    LDA.W #$0090 : STA.W $0FA8 
    LDA.W #$0014 
    JSL.L QueueSound_Lib3_Max6 
    RTL 


Function_Ship_SamusExiting_WaitForEntrancePadToOpen:
    DEC.W $0FA8 
    BEQ .timerExpired 
    BPL .return 

.timerExpired:
    LDA.W #Function_Ship_SamusExiting_RaiseSamus : STA.W $0FB2,X 

.return:
    RTL 


Function_Ship_SamusExiting_RaiseSamus:
    LDA.W $0FB0,X : SEC : SBC.W #$001E : STA.B $12 
    LDA.W $0AFA : SEC : SBC.W #$0002 : STA.W $0AFA 
    CMP.B $12 
    BPL .return 
    LDA.W #Function_Ship_SamusExiting_WaitForEntrancePadToClose : STA.W $0FB2,X 
    LDA.W #$0001 : STA.W $1014,X 
    LDA.W #InstList_ShipEntrancePad_Closing : STA.W $1012,X 
    LDA.W #$0090 : STA.W $0FA8 
    LDA.W #$0015 
    JSL.L QueueSound_Lib3_Max6 

.return:
    RTL 


Function_Ship_SamusExiting_WaitForEntrancePadToClose:
    DEC.W $0FA8 
    BEQ .timerExpired 
    BPL .return 

.timerExpired:
    LDA.W #Function_Ship_Idle_HandleLettingSamusEnter : STA.W $0FB2,X 
    LDA.W $0998 
    CMP.W #$0028 
    BPL .return 
    LDA.W #SamusCurrentStateHandler_Normal : STA.W $0A42 
    LDA.W #SamusNewStateHandler_Normal : STA.W $0A44 

.return:
    RTL 


Function_Ship_Liftoff_LoadDustCloudTiles:
    LDY.W $0DEC 
    PHX 
    LDX.W $0330 
    LDA.W #$0400 : STA.B $D0,X 
    INX #2
    LDA.W .src,Y : STA.B $D0,X 
    INX #2
    SEP #$20 
    LDA.B #$94 : STA.B $D0,X 
    REP #$20 
    INX 
    LDA.W .dest,Y : STA.B $D0,X 
    INX #2
    STX.W $0330 
    PLX 
    LDA.W $0DEC 
    INC #2
    STA.W $0DEC 
    CMP.W #$000A 
    BMI .return 
    LDA.W #Function_Ship_Liftoff_FireUpEngines_SpawnDustClouds : STA.W $0FB2,X 
    STZ.W $0DEC 

.return:
    RTL 


.src:
    dw Tiles_GunshipLiftoffDustClouds 
    dw Tiles_GunshipLiftoffDustClouds+$400 
    dw Tiles_GunshipLiftoffDustClouds+$800 
    dw Tiles_GunshipLiftoffDustClouds+$C00 
    dw Tiles_GunshipLiftoffDustClouds+$1000 

.dest:
    dw $7600,$7800,$7A00,$7C00,$7E00 

Function_Ship_Liftoff_FireUpEngines_SpawnDustClouds:
    LDA.W $0FF0,X 
    CMP.W #$0040 
    BPL .rumbleIntensifies 
    BIT.W #$0001 
    BEQ + 
    LDA.W $0AFA : CLC : ADC.W #$0001 : STA.W $0AFA 
    STA.W $0B14 
    BRA .merge 


  + LDA.W $0AFA : SEC : SBC.W #$0001 : STA.W $0AFA 
    STA.W $0B14 
    BRA .merge 


.rumbleIntensifies:
    BIT.W #$0001 
    BEQ + 
    LDA.W $0AFA : CLC : ADC.W #$0002 : STA.W $0AFA 
    STA.W $0B14 
    BRA .merge 


  + LDA.W $0AFA : SEC : SBC.W #$0002 : STA.W $0AFA 
    STA.W $0B14 

.merge:
    LDA.W $0AFA : SEC : SBC.W #$0011 : STA.W $0F7E,X 
    DEC A 
    STA.W $0FFE,X 
    LDA.W $0AFA : CLC : ADC.W #$0017 : STA.W $0FBE,X 
    LDA.W $0FF0,X 
    INC A 
    STA.W $0FF0,X 
    CMP.W #$0080 
    BMI .spawnDustClouds 
    LDA.W #Function_Ship_Liftoff_SteadyRise : STA.W $0FB2,X 
    STZ.W $0FA8 
    RTL 


.spawnDustClouds:
    CMP.W #$0040 
    BNE .return 
    LDA.W #$0000 
    LDY.W #EnemyProjectile_GunShipLiftoffDustClouds 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    LDA.W #$0002 
    LDY.W #EnemyProjectile_GunShipLiftoffDustClouds 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    LDA.W #$0004 
    LDY.W #EnemyProjectile_GunShipLiftoffDustClouds 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    LDA.W #$0006 
    LDY.W #EnemyProjectile_GunShipLiftoffDustClouds 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    LDA.W #$0008 
    LDY.W #EnemyProjectile_GunShipLiftoffDustClouds 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    LDA.W #$000A 
    LDY.W #EnemyProjectile_GunShipLiftoffDustClouds 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 

.return:
    RTL 


Function_Ship_Liftoff_SteadyRise:
    LDA.W $0AFA : SEC : SBC.W #$0002 : STA.W $0AFA 
    LDA.W $0AFA : SEC : SBC.W #$0011 : STA.W $0F7E,X 
    DEC A 
    STA.W $0FFE,X 
    LDA.W $0AFA : CLC : ADC.W #$0017 : STA.W $0FBE,X 
    LDA.W $0F7E,X 
    CMP.W #$0380 
    BPL .return 
    LDA.W #Function_Ship_Liftoff_Accelerating_SetGameState : STA.W $0FB2,X 
    LDA.W #$0200 : STA.W $0FF2,X 

.return:
    RTL 


Function_Ship_Liftoff_Accelerating_SetGameState:
    JSL.L Function_Ship_Liftoff_Accelerating 
    LDA.W $0F7E,X 
    CMP.W #$0100 
    BPL .return 
    LDA.W #Function_Ship_Liftoff_Accelerating : STA.W $0FB2,X 
    LDA.W #$0026 : STA.W $0998 
    STZ.W $0723 
    STZ.W $0725 

.return:
    RTL 


Function_Ship_Liftoff_Accelerating:
    LDA.W $0FF2,X : CLC : ADC.W #$0040 : STA.W $0FF2,X 
    AND.W #$FF00 
    CMP.W #$0A00 
    BMI + 
    LDA.W #$0900 : STA.W $0FF2,X 

  + LDA.W $0FF2,X 
    XBA 
    PHA 
    AND.W #$FF00 
    STA.B $14 
    PLA 
    AND.W #$00FF 
    STA.B $12 
    LDA.W $0AFC : SEC : SBC.B $14 : STA.W $0AFC 
    LDA.W $0AFA : SBC.B $12 : STA.W $0AFA 
    LDA.W $0AFA : SEC : SBC.W #$0011 : STA.W $0F7E,X 
    DEC A 
    STA.W $0FFE,X 
    LDA.W $0AFA : CLC : ADC.W #$0017 : STA.W $0FBE,X 
    RTL 


RTL_A2AD7F:
    RTL 


RTL_A2AD80:
    RTL 


Spritemap_Ship_0:
    dw $0012,$C201 
    db $FE 
    dw $7F20,$C211 
    db $FE 
    dw $7F0E,$C221 
    db $FE 
    dw $7F0C,$C231 
    db $FE 
    dw $7F0A,$C241 
    db $FE 
    dw $7F08 
    db $01 
    dw $EEC2,$7F06 
    db $11 
    dw $EEC2,$7F04,$C221,$02EE 
    db $7F 
    dw $C231,$00EE 
    db $7F 
    dw $C3F1 
    db $FE 
    dw $3F20,$C3E1 
    db $FE 
    dw $3F0E,$C3D1 
    db $FE 
    dw $3F0C,$C3C1 
    db $FE 
    dw $3F0A,$C3B1 
    db $FE 
    dw $3F08,$C3F1 
    db $EE 
    dw $3F06,$C3E1 
    db $EE 
    dw $3F04,$C3D1 
    db $EE 
    dw $3F02,$C3C1 
    db $EE 
    dw $3F00 

Spritemap_Ship_1:
    dw $0022,$C201 
    db $06 
    dw $7F62,$C211 
    db $06 
    dw $7F60,$C221 
    db $06 
    dw $7F4E,$C231 
    db $06 
    dw $7F4C,$C241 
    db $06 
    dw $7F4A,$C201 
    db $F6 
    dw $7F48,$C211 
    db $F6 
    dw $7F46,$C221 
    db $F6 
    dw $7F44,$C231 
    db $F6 
    dw $7F42,$C241 
    db $F6 
    dw $7F40,$C251 
    db $F6 
    dw $7F2E,$C201 
    db $E6 
    dw $7F2C,$C211 
    db $E6 
    dw $7F2A,$C221 
    db $E6 
    dw $7F28,$C231 
    db $E6 
    dw $7F26,$C241 
    db $E6 
    dw $7F24,$C251 
    db $E6 
    dw $7F22,$C3F1 
    db $06 
    dw $3F62,$C3E1 
    db $06 
    dw $3F60,$C3D1 
    db $06 
    dw $3F4E,$C3C1 
    db $06 
    dw $3F4C,$C3B1 
    db $06 
    dw $3F4A,$C3F1 
    db $F6 
    dw $3F48,$C3E1 
    db $F6 
    dw $3F46,$C3D1 
    db $F6 
    dw $3F44,$C3C1 
    db $F6 
    dw $3F42,$C3B1 
    db $F6 
    dw $3F40,$C3A1 
    db $F6 
    dw $3F2E,$C3F1 
    db $E6 
    dw $3F2C,$C3E1 
    db $E6 
    dw $3F2A,$C3D1 
    db $E6 
    dw $3F28,$C3C1 
    db $E6 
    dw $3F26,$C3B1 
    db $E6 
    dw $3F24,$C3A1 
    db $E6 
    dw $3F22 

Spritemap_Ship_2:
    dw $0004,$0000 
    db $F6 
    dw $7F65,$0008 
    db $F6 
    dw $7F64,$01F8 
    db $F6 
    dw $3F65,$01F0 
    db $F6 
    dw $3F64 

Spritemap_Ship_3:
    dw $0004,$0000 
    db $F4 
    dw $7F65,$0008 
    db $F4 
    dw $7F64,$01F8 
    db $F4 
    dw $3F65,$01F0 
    db $F4 
    dw $3F64 

Spritemap_Ship_4:
    dw $0004,$0000 
    db $F2 
    dw $7F65,$0008 
    db $F3 
    dw $7F64,$01F8 
    db $F2 
    dw $3F65,$01F0 
    db $F3 
    dw $3F64 

Spritemap_Ship_5:
    dw $0008,$01F6 
    db $F2 
    dw $3F65,$01EE 
    db $F3 
    dw $3F64,$0002 
    db $F2 
    dw $7F65,$000A 
    db $F3 
    dw $7F64,$0000 
    db $F5 
    dw $7F67,$0008 
    db $F5 
    dw $7F66,$01F8 
    db $F5 
    dw $3F67,$01F0 
    db $F5 
    dw $3F66 

Spritemap_Ship_6:
    dw $0008,$0004 
    db $F2 
    dw $7F65,$000C 
    db $F4 
    dw $7F64,$01F4 
    db $F2 
    dw $3F65,$01EC 
    db $F4 
    dw $3F64,$0000 
    db $F4 
    dw $7F67,$0008 
    db $F4 
    dw $7F66,$01F8 
    db $F4 
    dw $3F67,$01F0 
    db $F4 
    dw $3F66 

Spritemap_Ship_7:
    dw $0008,$0006 
    db $F2 
    dw $7F65,$000E 
    db $F4 
    dw $7F64,$01F2 
    db $F2 
    dw $3F65,$01EA 
    db $F4 
    dw $3F64,$0000 
    db $F3 
    dw $7F67,$0008 
    db $F3 
    dw $7F66,$01F8 
    db $F3 
    dw $3F67,$01F0 
    db $F3 
    dw $3F66 

Spritemap_Ship_8:
    dw $0008,$0008 
    db $F2 
    dw $7F65,$0010 
    db $F4 
    dw $7F64,$01F0 
    db $F2 
    dw $3F65,$01E8 
    db $F4 
    dw $3F64,$0000 
    db $F3 
    dw $7F67,$0008 
    db $F3 
    dw $7F66,$01F8 
    db $F3 
    dw $3F67,$01F0 
    db $F3 
    dw $3F66 

Spritemap_Ship_9:
    dw $0008,$000A 
    db $F3 
    dw $7F65,$0012 
    db $F6 
    dw $7F64,$01EE 
    db $F3 
    dw $3F65,$01E6 
    db $F6 
    dw $3F64,$0000 
    db $F3 
    dw $7F67,$0008 
    db $F3 
    dw $7F66,$01F8 
    db $F3 
    dw $3F67,$01F0 
    db $F3 
    dw $3F66 

Spritemap_Ship_A:
    dw $0008,$000C 
    db $F3 
    dw $7F65,$0014 
    db $F6 
    dw $7F64,$01EC 
    db $F3 
    dw $3F65,$01E4 
    db $F6 
    dw $3F64,$0000 
    db $F3 
    dw $7F67,$0008 
    db $F3 
    dw $7F66,$01F8 
    db $F3 
    dw $3F67,$01F0 
    db $F3 
    dw $3F66 

Spritemap_Ship_B:
    dw $0004,$0000 
    db $F7 
    dw $7F65,$0008 
    db $F7 
    dw $7F64,$01F8 
    db $F7 
    dw $3F65,$01F0 
    db $F7 
    dw $3F64 

Spritemap_Ship_C:
    dw $0004,$0000 
    db $F8 
    dw $7F65,$0008 
    db $F8 
    dw $7F64,$01F8 
    db $F8 
    dw $3F65,$01F0 
    db $F8 
    dw $3F64 

Palette_Mellow:
    dw $3800,$72FA,$55B0,$2845,$1801,$6210,$496B,$38C6 
    dw $2C63,$2FEF,$030D,$0209,$0145,$183F,$1014,$080A 

InstList_Mellow_Mella_Menu:
    dw $0002 
    dw Spritemap_Mellow_Mella_Menu_0 
    dw $0002 
    dw Spritemap_Mellow_Mella_Menu_1 
    dw $0002 
    dw Spritemap_Mellow_Mella_Menu_2 
    dw $0002 
    dw Spritemap_Mellow_Mella_Menu_3 
    dw Instruction_Common_GotoY 
    dw InstList_Mellow_Mella_Menu 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_OldMovementData_A2B027:
    dw $0002,$FFFC,$FFFE,$0004,$0002,$FFFE,$0002,$0004 
    dw $0002,$FFFE,$FFFE,$0002,$FFFC,$FFFE,$0002,$0002 
    dw $FFFE,$FFFE,$0004,$0002,$FFFC,$FFFE,$0002,$FFFE 
    dw $FFFC,$FFFE,$0002,$0002,$FFFE,$0004,$0002,$FFFE 
    dw $FFFE,$0002 
endif ; !FEATURE_KEEP_UNREFERENCED

InitAI_Mellow_Mella_Menu:
    LDX.W $0E54 
    STZ.W $0FB0,X 
    LDA.W #Function_Flies_IdleMovement_ClockwiseCircle : STA.W $0FB2,X 
    LDA.W #InstList_Mellow_Mella_Menu : STA.W $0F92,X 
    LDA.W #Spritemap_CommonA2_Nothing : STA.W $0F8E,X 
    LDA.W #$0001 : STA.W $0F94,X 
    LDA.W #Spritemap_CommonA2_Nothing : STA.W $0F8E,X 
    RTL 


MoveFlyAccordingToAngle:
    TXY 
    LDX.W $0FB0,Y 
    LDA.L SineCosineTables_8bitSine_SignExtended-1,X : AND.W #$FF00 
    CLC : ADC.W $0F7C,Y : STA.W $0F7C,Y 
    LDA.L SineCosineTables_8bitSine_SignExtended,X 
    XBA 
    BPL .lowByteX 
    ORA.W #$FF00 
    BRA + 


.lowByteX:
    AND.W #$00FF 

  + ADC.W $0F7A,Y : STA.W $0F7A,Y 
    LDA.L SineCosineTables_NegativeCosine_SignExtended-1,X : AND.W #$FF00 
    CLC : ADC.W $0F80,Y : STA.W $0F80,Y 
    LDA.L SineCosineTables_NegativeCosine_SignExtended,X 
    XBA 
    BPL .lowByteY 
    ORA.W #$FF00 
    BRA + 


.lowByteY:
    AND.W #$00FF 

  + ADC.W $0F7E,Y : STA.W $0F7E,Y 
    TYX 
    RTS 


MoveFlyAccordingToVelocities:
    LDA.W $0FA9,X : AND.W #$FF00 
    CLC : ADC.W $0F7C,X : STA.W $0F7C,X 
    LDA.W $0FAA,X 
    XBA 
    BPL .lowByteX 
    ORA.W #$FF00 
    BRA + 


.lowByteX:
    AND.W #$00FF 

  + ADC.W $0F7A,X : STA.W $0F7A,X 
    LDA.W $0FAB,X : AND.W #$FF00 
    CLC : ADC.W $0F80,X : STA.W $0F80,X 
    LDA.W $0FAC,X 
    XBA 
    BPL .lowByteY 
    ORA.W #$FF00 
    BRA + 


.lowByteY:
    AND.W #$00FF 

  + ADC.W $0F7E,X : STA.W $0F7E,X 
    RTS 


MainAI_Mellow_Mella_Menu:
    JSL.L GenerateRandomNumber 
    LDX.W $0E54 
    JMP.W ($0FB2,X) 


SetFlyToAttackSamus:
    JSL.L CalculateAngleOfSamusFromEnemy 
    ASL A 
    TXY 
    TAX 
    LDA.L SineCosineTables_8bitSine_SignExtended,X 
    ASL A 
    STA.W $0FAA,Y 
    LDA.L SineCosineTables_NegativeCosine_SignExtended,X 
    ASL #2
    STA.W $0FAC,Y 
    LDA.W $0AFA : STA.W $0FAE,Y 
    LDA.W #Function_Flies_AttackSamus : STA.W $0FB2,Y 
    RTL 


Function_Flies_IdleMovement_ClockwiseCircle:
    LDA.W $0FA8,X : BEQ .retreatTimerExpired 
    DEC A 
    STA.W $0FA8,X 
    BRA .move 


.retreatTimerExpired:
    LDA.W #$0070 
    JSL.L CheckIfXDistanceBetweenEnemyAndSamusIsAtLeastA 
    BCC SetFlyToAttackSamus 

.move:
    JSR.W MoveFlyAccordingToAngle 
    LDA.W $0FB0,X : CLC : ADC.W #$0020 : AND.W #$01FF 
    STA.W $0FB0,X 
    BEQ .antiClockwise 
    RTL 


.antiClockwise:
    LDA.W #Function_Flies_IdleMovement_AntiClockwiseCircle : STA.W $0FB2,X 
    RTL 


Function_Flies_IdleMovement_AntiClockwiseCircle:
    LDA.W $0FA8,X : BEQ .retreatTimerExpired 
    DEC A 
    STA.W $0FA8,X 
    BRA .move 


.retreatTimerExpired:
    LDA.W #$0070 
    JSL.L CheckIfXDistanceBetweenEnemyAndSamusIsAtLeastA 
    BCC SetFlyToAttackSamus 

.move:
    JSR.W MoveFlyAccordingToAngle 
    LDA.W $0FB0,X : SEC : SBC.W #$0020 : AND.W #$01FF 
    STA.W $0FB0,X 
    BEQ .clockwise 
    RTL 


.clockwise:
    LDA.W #Function_Flies_IdleMovement_ClockwiseCircle : STA.W $0FB2,X 
    RTL 


Function_Flies_AttackSamus:
    JSR.W MoveFlyAccordingToVelocities 
    INC.W $0FA8,X 
    BIT.W $0FAC,X 
    BPL .positiveYVelocity 
    CMP.W $0FAE,X 
    BCC .aboveTarget 
    RTL 


.positiveYVelocity:
    CMP.W $0FAE,X 
    BCS .aboveTarget 
    RTL 


.aboveTarget:
    LDA.W $0FAC,X 
    EOR.W #$FFFF 
    INC A 
    STA.W $0FAC,X 
    LDA.W #Function_Flies_Retreat : STA.W $0FB2,X 
    RTL 


Function_Flies_Retreat:
    JSR.W MoveFlyAccordingToVelocities 
    DEC.W $0FA8,X 
    BMI .retreatTimerExpired 
    RTL 


.retreatTimerExpired:
    LDA.W #$0018 : STA.W $0FA8,X 
    LDA.W #Function_Flies_IdleMovement_ClockwiseCircle : STA.W $0FB2,X 
    RTL 


Spritemap_Mellow_Mella_Menu_0:
    dw $0001,$C3F8 
    db $F8 
    dw $2100 

Spritemap_Mellow_Mella_Menu_1:
    dw $0001,$C3F8 
    db $F8 
    dw $2102 

Spritemap_Mellow_Mella_Menu_2:
    dw $0001,$C3F8 
    db $F8 
    dw $2104 

Spritemap_Mellow_Mella_Menu_3:
    dw $0001,$C3F8 
    db $F8 
    dw $2106 

UNUSED_FlySpritemapPointers_A2B204:
    dw Spritemap_Mellow_Mella_Menu_0 
    dw Spritemap_Mellow_Mella_Menu_1 
    dw Spritemap_Mellow_Mella_Menu_2 
    dw Spritemap_Mellow_Mella_Menu_3 

Palette_Mella:
    dw $3800,$039F,$01BF,$000F,$0005,$021F,$015B,$00BA 
    dw $0011,$4F72,$36AD,$1DC8,$0925,$7E1F,$5415,$280A 

UNUSED_PointerToUnusedData_A2B22C:
    dw UNUSED_Data_A2B22E 

UNUSED_Data_A2B22E:
    dw $0000,$000E,$0001,$000B,$0002,$000A,$0003,$0009 
    dw $FFFE 

UNUSED_Spritemap_Mella_A2B240:
    dw $0001,$C3F8 
    db $F4 
    dw $2100 

UNUSED_Spritemap_Mella_A2B247:
    dw $0001,$C3F8 
    db $F4 
    dw $2102 

UNUSED_Spritemap_Mella_A2B24E:
    dw $0001,$C3F8 
    db $F4 
    dw $2104 

UNUSED_Spritemap_Mella_A2B255:
    dw $0001,$C3F8 
    db $F4 
    dw $2106 

UNUSED_SpritemapPointers_Mella_A2B25C:
    dw UNUSED_Spritemap_Mella_A2B240 
    dw UNUSED_Spritemap_Mella_A2B247 
    dw UNUSED_Spritemap_Mella_A2B24E 
    dw UNUSED_Spritemap_Mella_A2B255 

Palette_Menu:
    dw $3800,$72FA,$55B0,$2845,$1801,$6210,$496B,$38C6 
    dw $2C63,$2F5A,$2294,$01AD,$0108,$7FFF,$56B5,$294A 

UNUSED_DataPointer_A2B284:
    dw UNUSED_Data_A2B286 

UNUSED_Data_A2B286:
    dw $0000,$000E,$0001,$000B,$0002,$000A,$0003,$0009 
    dw $FFFE 

UNUSED_Spritemap_Menu_A2B298:
    dw $0001,$C3F8 
    db $F8 
    dw $2100 

UNUSED_Spritemap_Menu_A2B29F:
    dw $0001,$C3F8 
    db $F8 
    dw $2102 

UNUSED_Spritemap_Menu_A2B2A6:
    dw $0001,$C3F8 
    db $F8 
    dw $2104 

UNUSED_Spritemap_Menu_A2B2AD:
    dw $0001,$C3F8 
    db $F8 
    dw $2106 

UNUSED_SpritemapPointers_Menu_A2B2B4:
    dw UNUSED_Spritemap_Menu_A2B298 
    dw UNUSED_Spritemap_Menu_A2B29F 
    dw UNUSED_Spritemap_Menu_A2B2A6 
    dw UNUSED_Spritemap_Menu_A2B2AD 

Palette_Multiviola:
    dw $3800,$02FF,$01BF,$000F,$0008,$01BF,$011B,$0015 
    dw $0011,$241F,$1C17,$142F,$0C47,$03E0,$02A0,$0140 

InstList_Multiviola:
    dw $000A 
    dw Spritemap_Multiviola_0 
    dw $000A 
    dw Spritemap_Multiviola_1 
    dw $000A 
    dw Spritemap_Multiviola_2 
    dw $000A 
    dw Spritemap_Multiviola_3 
    dw $000A 
    dw Spritemap_Multiviola_4 
    dw $000A 
    dw Spritemap_Multiviola_5 
    dw $000A 
    dw Spritemap_Multiviola_6 
    dw $000A 
    dw Spritemap_Multiviola_7 
    dw $000A 
    dw Spritemap_Multiviola_6 
    dw $000A 
    dw Spritemap_Multiviola_5 
    dw $000A 
    dw Spritemap_Multiviola_4 
    dw $000A 
    dw Spritemap_Multiviola_3 
    dw $000A 
    dw Spritemap_Multiviola_2 
    dw $000A 
    dw Spritemap_Multiviola_1 
    dw Instruction_Common_GotoY 
    dw InstList_Multiviola 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_Multiviola_A2B318:
    dw $0002 
    dw UNUSED_Spritemap_Multiviola_A2B4E2 
    dw $0001 
    dw Spritemap_Common_Nothing 
    dw $0002 
    dw UNUSED_Spritemap_Multiviola_A2B4E2 
    dw $0001 
    dw Spritemap_Common_Nothing 
    dw $0002 
    dw UNUSED_Spritemap_Multiviola_A2B4E9 
    dw $0001 
    dw Spritemap_Common_Nothing 
    dw $0002 
    dw UNUSED_Spritemap_Multiviola_A2B4E9 
    dw $0001 
    dw Spritemap_Common_Nothing 
    dw $0002 
    dw UNUSED_Spritemap_Multiviola_A2B4F0 
    dw $0001 
    dw Spritemap_Common_Nothing 
    dw $0002 
    dw UNUSED_Spritemap_Multiviola_A2B4F0 
    dw $0001 
    dw Spritemap_Common_Nothing 
    dw $0002 
    dw UNUSED_Spritemap_Multiviola_A2B4F7 
    dw $0001 
    dw Spritemap_Common_Nothing 
    dw $0002 
    dw UNUSED_Spritemap_Multiviola_A2B4F7 
    dw $0001 
    dw Spritemap_Common_Nothing 
    dw $0002 
    dw UNUSED_Spritemap_Multiviola_A2B4F0 
    dw $0001 
    dw Spritemap_Common_Nothing 
    dw $0002 
    dw UNUSED_Spritemap_Multiviola_A2B4F0 
    dw $0001 
    dw Spritemap_Common_Nothing 
    dw $0002 
    dw UNUSED_Spritemap_Multiviola_A2B4E9 
    dw $0001 
    dw Spritemap_Common_Nothing 
    dw $0002 
    dw UNUSED_Spritemap_Multiviola_A2B4E9 
    dw $0001 
    dw Spritemap_Common_Nothing 
    dw Instruction_Common_GotoY 
    dw UNUSED_InstList_Multiviola_A2B318 

UNUSED_InstList_Multiviola_A2B37C:
    dw $0002 
    dw UNUSED_Spritemap_Multiviola_A2B4FE 
    dw $0001 
    dw Spritemap_Common_Nothing 
    dw $0002 
    dw UNUSED_Spritemap_Multiviola_A2B4FE 
    dw $0001 
    dw Spritemap_Common_Nothing 
    dw $0002 
    dw UNUSED_Spritemap_Multiviola_B2B505 
    dw $0001 
    dw Spritemap_Common_Nothing 
    dw $0002 
    dw UNUSED_Spritemap_Multiviola_B2B505 
    dw $0001 
    dw Spritemap_Common_Nothing 
    dw $0002 
    dw UNUSED_Spritemap_Multiviola_A2B50C 
    dw $0001 
    dw Spritemap_Common_Nothing 
    dw $0002 
    dw UNUSED_Spritemap_Multiviola_A2B50C 
    dw $0001 
    dw Spritemap_Common_Nothing 
    dw $0002 
    dw UNUSED_Spritemap_Multiviola_A2B513 
    dw $0001 
    dw Spritemap_Common_Nothing 
    dw $0002 
    dw UNUSED_Spritemap_Multiviola_A2B513 
    dw $0001 
    dw Spritemap_Common_Nothing 
    dw $0002 
    dw UNUSED_Spritemap_Multiviola_A2B50C 
    dw $0001 
    dw Spritemap_Common_Nothing 
    dw $0002 
    dw UNUSED_Spritemap_Multiviola_A2B50C 
    dw $0001 
    dw Spritemap_Common_Nothing 
    dw $0002 
    dw UNUSED_Spritemap_Multiviola_B2B505 
    dw $0001 
    dw Spritemap_Common_Nothing 
    dw $0002 
    dw UNUSED_Spritemap_Multiviola_B2B505 
    dw $0001 
    dw Spritemap_Common_Nothing 
    dw Instruction_Common_GotoY 
    dw UNUSED_InstList_Multiviola_A2B37C 
endif ; !FEATURE_KEEP_UNREFERENCED

InitAI_Multiviola:
    LDX.W $0E54 
    LDA.W $0FB4,X : STA.B $12 
    LDA.W $0FB6,X : AND.W #$00FF : STA.B $14 
    JSL.L Do_Some_Math_With_Sine_Cosine_Terrible_Label_Name ; ($16.$18, $1A.$1C) = ([$14] * |cos([$12] * pi / 80h)|, [$14] * |sin([$12] * pi / 80h)|)
    LDA.B $16 : STA.W $0FAC,X 
    LDA.B $18 : STA.W $0FAE,X 
    LDA.B $1A : STA.W $0FB0,X 
    LDA.B $1C : STA.W $0FB2,X 
    LDA.W #InstList_Multiviola : STA.W $0F92,X 
    RTL 


MainAI_Multiviola:
    LDX.W $0E54 
    LDA.W $0FB4,X : STA.B $12 
    LDA.W $0FB6,X : AND.W #$00FF : STA.B $14 
    JSL.L Do_Some_Math_With_Sine_Cosine_Terrible_Label_Name ; ($16.$18, $1A.$1C) = ([$14] * |cos([$12] * pi / 80h)|, [$14] * |sin([$12] * pi / 80h)|)
    LDA.B $16 : STA.W $0FAC,X 
    LDA.B $18 : STA.W $0FAE,X 
    LDA.B $1A : STA.W $0FB0,X 
    LDA.B $1C : STA.W $0FB2,X 
    LDA.W $0FB4,X : CLC : ADC.W #$0040 : BIT.W #$0080 
    BNE + 
    LDA.W $0FAC,X : EOR.W #$FFFF : STA.W $0FAC,X 
    LDA.W $0FAE,X 
    EOR.W #$FFFF 
    INC A 
    STA.W $0FAE,X 

  + LDA.W $0FAC,X : STA.B $14 
    LDA.W $0FAE,X : STA.B $12 
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes 
    BCC .notCollidedWithWall 
    LDA.W $0FB4,X : EOR.W #$0040 : STA.W $0FB4,X 
    BRA .return 


.notCollidedWithWall:
    LDA.W $0FB4,X : CLC : ADC.W #$0080 : BIT.W #$0080 
    BNE + 
    LDA.W $0FB0,X : EOR.W #$FFFF : STA.W $0FB0,X 
    LDA.W $0FB2,X 
    EOR.W #$FFFF 
    INC A 
    STA.W $0FB2,X 

  + LDA.W $0FB0,X : STA.B $14 
    LDA.W $0FB2,X : STA.B $12 
    JSL.L MoveEnemyDownBy_14_12 
    BCC .return 
    LDA.W $0FB4,X : EOR.W #$00C0 : STA.W $0FB4,X 

.return:
    RTL 


Spritemap_Multiviola_0:
    dw $0001,$81F8 
    db $F8 
    dw $2100 

Spritemap_Multiviola_1:
    dw $0001,$81F8 
    db $F8 
    dw $2102 

Spritemap_Multiviola_2:
    dw $0001,$81F8 
    db $F8 
    dw $2104 

Spritemap_Multiviola_3:
    dw $0001,$81F8 
    db $F8 
    dw $2106 

Spritemap_Multiviola_4:
    dw $0001,$81F8 
    db $F8 
    dw $2108 

Spritemap_Multiviola_5:
    dw $0001,$81F8 
    db $F8 
    dw $210A 

Spritemap_Multiviola_6:
    dw $0001,$81F8 
    db $F8 
    dw $210C 

Spritemap_Multiviola_7:
    dw $0001,$81F8 
    db $F8 
    dw $210E 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Multiviola_A2B4E2:
    dw $0001,$81F8 
    db $F8 
    dw $2120 

UNUSED_Spritemap_Multiviola_A2B4E9:
    dw $0001,$81F8 
    db $F8 
    dw $2122 

UNUSED_Spritemap_Multiviola_A2B4F0:
    dw $0001,$81F8 
    db $F8 
    dw $2124 

UNUSED_Spritemap_Multiviola_A2B4F7:
    dw $0001,$81F8 
    db $F8 
    dw $2126 

UNUSED_Spritemap_Multiviola_A2B4FE:
    dw $0001,$81F8 
    db $F8 
    dw $2128 

UNUSED_Spritemap_Multiviola_B2B505:
    dw $0001,$81F8 
    db $F8 
    dw $212A 

UNUSED_Spritemap_Multiviola_A2B50C:
    dw $0001,$81F8 
    db $F8 
    dw $212C 

UNUSED_Spritemap_Multiviola_A2B513:
    dw $0001,$81F8 
    db $F8 
    dw $212E 
endif ; !FEATURE_KEEP_UNREFERENCED

InstList_Polyp:
    dw $0001 
    dw Spritemap_Polyp 
    dw Instruction_Common_Sleep 

PolypData_cooldownTimer:
    dw $0010,$0018,$0020,$0028,$0030,$0038,$0040,$0048 

PolypData_projectileInitialYSpeedTableIndex:
    dw $001C,$001D,$001E,$001F,$0020,$0021,$0022,$0023 
    dw $0024,$0025,$0026,$0027,$0028,$0029,$002A,$002B 

PolypData_projectileXVelocity:
    dw $0060,$0070,$0080,$0090,$00A0,$00B0,$00C0,$00D0 
    dw $FFA0,$FF90,$FF80,$FF70,$FF60,$FF50,$FF40,$FF30 

InitAI_Polyp:
    LDX.W $0E54 
    LDA.W #InstList_Polyp : STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    STZ.W $0F90,X 
    LDA.W #Function_Polyp_WaitForSamusToGetNear : STA.W $0FA8,X 
    LDA.W #$0011 : STA.W $05E5 
    RTL 


MainAI_Polyp:
    LDX.W $0E54 
    JSR.W ($0FA8,X) 
    RTL 


Function_Polyp_WaitForSamusToGetNear:
    LDX.W $0E54 
    LDA.W #$0040 
    JSL.L IsSamusWithinAPixelColumnsOfEnemy 
    BEQ .return 
    LDA.W #$0040 
    JSL.L IsSamusWithingAPixelRowsOfEnemy 
    BEQ .return 
    LDA.W #Function_Polyp_ShootRock : STA.W $0FA8,X 

.return:
    RTS 


Function_Polyp_ShootRock:
    LDX.W $0E54 
    JSL.L GenerateRandomNumber 
    AND.W #$001E 
    TAY 
    LDA.W PolypData_projectileXVelocity,Y : STA.W $1995 
    JSL.L GenerateRandomNumber 
    AND.W #$001E 
    TAY 
    LDA.W PolypData_projectileInitialYSpeedTableIndex,Y 
    LDY.W #EnemyProjectile_LavaquakeRocks 
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    LDA.W #Function_Polyp_Cooldown : STA.W $0FA8,X 
    JSL.L GenerateRandomNumber 
    AND.W #$000E 
    TAY 
    LDA.W PolypData_cooldownTimer,Y : STA.W $0FAA,X 
    RTS 


Function_Polyp_Cooldown:
    LDX.W $0E54 
    DEC.W $0FAA,X 
    BPL .return 
    LDA.W #Function_Polyp_WaitForSamusToGetNear : STA.W $0FA8,X 

.return:
    RTS 


RTL_B5FAF9:
    RTL 


RTL_B5FAFA:
    RTL 


Spritemap_Polyp:
    dw $0001,$01FC 
    db $FC 
    dw $210A 

InitAI_Rinka:
    LDX.W $0E54 
    LDA.W $0FB4,X : BEQ .notMBRoom 
    JSR.W SpawnMotherBrainsRoomRinka 
    LDA.L $7E783A 
    LDA.W $0F86,X 
    ORA.W #$2C00 
    AND.W #$BFFF 
    STA.W $0F86,X 
    BRA .propertiesSet 

    LDA.W $0F86,X ; dead code
    ORA.W #$2C00 
    STA.W $0F86,X 
    BRA .propertiesSet 


.notMBRoom:
    LDA.W $0F86,X 
    ORA.W #$6400 
    AND.W #$F7FF 
    STA.W $0F86,X 

.propertiesSet:
    LDA.W #$0400 : STA.W $0F96,X 
    BRA ResetRinka 


RespawnRinka:
    LDA.W $0FB4,X : BEQ .notMBRoom 
    JSR.W SpawnMotherBrainsRoomRinka 

.notMBRoom:
    LDA.L $7E7020,X : STA.W $0F7A,X 
    LDA.L $7E7022,X : STA.W $0F7E,X ; fallthrough to ResetRinka

ResetRinka:
    LDA.W #Function_Rinka_WaitingToFire : STA.W $0FA8,X 
    LDA.W #$001A : STA.W $0FB2,X 
    STZ.W $0FAA,X 
    STZ.W $0FAC,X 
    LDA.W $0FB4,X : BNE .MBRoom 
    LDA.W #InstList_Rinka_NotMotherBrainsRoom_0 : STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    STZ.W $0F90,X 
    RTL 


.MBRoom:
    LDA.L $7E783A : BEQ .MBPhase1 
    LDA.W $0F86,X : ORA.W #$0200 : STA.W $0F86,X 
    RTL 


.MBPhase1:
    LDA.W #InstList_Rinka_MotherBrainsRoom_0 : STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    STZ.W $0F90,X 
    RTL 


SpawnMotherBrainsRoomRinka:
    LDA.L $7E7020,X : STA.B $12 
    LDA.L $7E7022,X : STA.B $14 
    JSL.L CheckIfPositionIsOnScreen 
    BCS + 
    JSR.W GetAvailabilityIndexOfEnemySpawnPosition 
    TAY 
    PHX 
    TAX 
    LDA.L $7E87FE,X 
    LSR A 
    PLX 
    BCS + 
    TYA 
    STA.W $0FAE,X 
    PHX 
    TAX 
    LDA.W #$FFFF : STA.L $7E87FE,X 
    PLX 
    RTS 


  + LDY.W #$0000 

.loopOnScreen:
    LDA.W MotherBrainsRoomRinkaSpawnData_XPosition,Y : STA.B $12 
    LDA.W MotherBrainsRoomRinkaSpawnData_YPosition,Y : STA.B $14 
    JSL.L CheckIfPositionIsOnScreen 
    BCS .next 
    PHX 
    LDX.W MotherBrainsRoomRinkaSpawnData_spawnPointAvailabilityIndex,Y 
    LDA.L $7E87FE,X 
    LSR A 
    PLX 
    BCC .found 

.next:
    INY #6
    CPY.W #$0042 
    BMI .loopOnScreen 
    JMP.W .notFound 

    RTS 


.found:
    LDA.B $12 : STA.L $7E7020,X 
    STA.W $0F7A,X 
    LDA.B $14 : STA.L $7E7022,X 
    STA.W $0F7E,X 
    PHX 
    LDX.W MotherBrainsRoomRinkaSpawnData_spawnPointAvailabilityIndex,Y 
    LDA.W #$FFFF : STA.L $7E87FE,X 
    TXA 
    PLX 
    STA.W $0FAE,X 
    RTS 


.notFound:
    LDY.W #$0000 

.loopAny:
    PHX 
    LDX.W MotherBrainsRoomRinkaSpawnData_spawnPointAvailabilityIndex,Y 
    LDA.L $7E87FE,X 
    PLX 
    LSR A 
    BCC .spawn 
    INY #6
    CPY.W #$0042 
    BMI .loopAny 
    RTS 


.spawn:
    LDA.W MotherBrainsRoomRinkaSpawnData_XPosition,Y : STA.L $7E7020,X 
    STA.W $0F7A,X 
    LDA.W MotherBrainsRoomRinkaSpawnData_YPosition,Y : STA.L $7E7022,X 
    STA.W $0F7E,X 
    LDA.W MotherBrainsRoomRinkaSpawnData_spawnPointAvailabilityIndex,Y : STA.W $0FAE,X 
    PHX 
    TAX 
    LDA.W #$FFFF : STA.L $7E87FE,X 
    PLX 
    RTS 


MotherBrainsRoomRinkaSpawnData_XPosition:
    dw $03E7 

MotherBrainsRoomRinkaSpawnData_YPosition:
    dw $0026 

MotherBrainsRoomRinkaSpawnData_spawnPointAvailabilityIndex:
    dw $0002,$03E7,$00A6,$0004,$0337,$0036,$0006,$0337 
    dw $00A6,$0008,$0277,$001C,$000A,$0277,$00B6,$000C 
    dw $01B7,$0036,$000E,$01B7,$00A6,$0010,$00F7,$001C 
    dw $0012,$00F7,$00B6,$0014,$0080,$00A8,$0016 

GetAvailabilityIndexOfEnemySpawnPosition:
    LDY.W #$0000 

.loop:
    LDA.W MotherBrainsRoomRinkaSpawnData_XPosition,Y 
    CMP.L $7E7020,X 
    BNE .next 
    LDA.W MotherBrainsRoomRinkaSpawnData_YPosition,Y 
    CMP.L $7E7022,X 
    BEQ .found 

.next:
    TYA 
    CLC : ADC.W #$0006 : TAY 
    CMP.W #$0042 
    BMI .loop 
    LDY.W #$0000 

.found:
    LDA.W MotherBrainsRoomRinkaSpawnData_spawnPointAvailabilityIndex,Y 
    RTS 


MainAI_Rinka:
    LDX.W $0E54 
    LDA.W $0FB4,X : BEQ .function 
    LDA.L $7E783A : BEQ .function 
    JSR.W DecrementRinkaCounter 
    JSR.W MarkRinkaSpawnPointAvailable 
    JML.L RinkaDeath 


.function:
    JMP.W ($0FA8,X) 


Function_Rinka_Fire:
    DEC.W $0FB2,X 
    BPL Function_Rinka_Fire_return 
    LDA.W #Function_Rinka_Moving : STA.W $0FA8,X 
    LDA.W $0FB4,X : BEQ .notMBRoom 
    LDA.W $0F86,X : AND.W #$FBFF : STA.W $0F86,X 
    BRA + 


.notMBRoom:
    LDA.W $0F86,X 
    ORA.W #$0800 
    AND.W #$FBFF 
    STA.W $0F86,X 

  + LDA.W $0AF6 : SEC : SBC.W $0F7A,X : STA.B $12 
    LDA.W $0AFA : SEC : SBC.W $0F7E,X : STA.B $14 
    JSL.L CalculateAngleOf_12_14_Offset 
    SEC : SBC.W #$0080 : EOR.W #$FFFF 
    INC A 
    AND.W #$00FF 
    STA.B $12 
    LDA.W #$0120 
    JSL.L Math_86C26C 
    LDX.W $0E54 
    STA.W $0FAA,X 
    LDA.W #$0120 
    JSL.L Math_86C272 
    LDX.W $0E54 
    STA.W $0FAC,X 

Function_Rinka_Fire_return:
    RTL 


Function_Rinka_Killed:
    DEC.W $0FB2,X 
    BPL Function_Rinka_Fire_return 
    LDA.W #$000A : STA.W $0F8C,X 
    JMP.W RespawnRinka 


Function_Rinka_WaitingToFire:
    JSL.L CheckIfRinkaIsOnScreen 
    BCC Function_Rinka_Fire_return 
    JMP.W DeleteAndRespawnRinka 


Function_Rinka_Moving:
    JSL.L MoveEnemyAccordingToVelocity 
    JSL.L CheckIfRinkaIsOnScreen 
    BCC Function_Rinka_Fire_return ; fallthrough to DeleteAndRespawnRinka

DeleteAndRespawnRinka:
    LDA.W $0FB4,X : BEQ .notMBRoom 
    JSR.W MarkRinkaSpawnPointAvailable 
    LDA.L $7E783A : BEQ .notMBRoom 
    JSR.W DecrementRinkaCounter 
    JML.L DeleteEnemyAndAnyConnectedEnemies 


.notMBRoom:
    JSR.W DecrementRinkaCounter 
    JMP.W RespawnRinka 


DecrementRinkaCounter:
    LDA.W $0FB4,X : BEQ .return 
    LDA.W $0F86,X : AND.W #$0100 
    BNE .return 
    LDA.L $7E783C 
    DEC A 
    BPL .storeRinkaCounter 
    LDA.W #$0000 

.storeRinkaCounter:
    STA.L $7E783C 

.return:
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Rinka_A2B89C:
    LDA.W $0E44 : AND.W #$0003 
    CMP.W $0FB4,X 
    BNE .setAsIntangible 
    LDA.W $0F86,X : AND.W #$FBFF : STA.W $0F86,X 
    RTS 


.setAsIntangible:
    LDA.W $0F86,X : ORA.W #$0400 : STA.W $0F86,X 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


MarkRinkaSpawnPointAvailable:
    LDA.W $0FB4,X : BEQ .return 
    LDA.W $0FAE,X : BEQ .return 
    PHX 
    TAX 
    LDA.W #$0000 : STA.L $7E87FE,X 
    PLX 
    STA.W $0FAE,X 

.return:
    RTS 


CheckIfRinkaIsOnScreen:
    LDA.W $0F7E,X : BMI .returnOffScreen 
    CLC : ADC.W #$0010 : SEC : SBC.W $0915 : BMI .returnOffScreen 
    CMP.W #$0100 
    BPL .returnOffScreen 
    LDA.W $0F7A,X : BMI .returnOffScreen 
    CLC : ADC.W #$0010 : SEC : SBC.W $0911 : BMI .returnOffScreen 
    CMP.W #$0120 
    BPL .returnOffScreen 
    CLC 
    RTL 


.returnOffScreen:
    SEC 
    RTL 


CheckIfPositionIsOnScreen:
    LDA.B $14 : BMI .returnOffScreen 
    CLC : ADC.W #$0000 : SEC : SBC.W $0915 : BMI .returnOffScreen 
    CMP.W #$00E0 
    BPL .returnOffScreen 
    LDA.B $12 : BMI .returnOffScreen 
    CLC : ADC.W #$0000 : SEC : SBC.W $0911 : BMI .returnOffScreen 
    CMP.W #$0100 
    BPL .returnOffScreen 
    CLC 
    RTL 


.returnOffScreen:
    SEC 
    RTL 


FrozenAI_Rinka:
    JSL.L CheckIfRinkaIsOnScreen 
    BCC .onScreen 
    STZ.W $0F9E,X 

.onScreen:
    JSL.L NormalEnemyFrozenAI 
    LDA.L $7E783A : BNE .delete 
    RTL 


.delete:
    JSR.W DecrementRinkaCounter 
    JSR.W MarkRinkaSpawnPointAvailable 
    JML.L RinkaDeath 


EnemyTouch_Rinka:
    JSL.L NormalEnemyTouchAI_NoDeathCheck_External 
    BRA ContactReaction_Rinka_Common 


EnemyShot_Rinka:
    JSL.L NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External 
    BRA ContactReaction_Rinka_Common 


PowerBombReaction_Rinka:
    LDA.W $0F86,X : AND.W #$0100 
    BEQ .notInvisible 
    RTL 


.notInvisible:
    JSL.L NormalEnemyPowerBombAI_NoDeathCheck_External 

ContactReaction_Rinka_Common:
    LDA.W $0F8C,X : BEQ .dead 
    RTL 


.dead:
    JSR.W DecrementRinkaCounter 
    JSR.W MarkRinkaSpawnPointAvailable 
    LDA.W $0FB4,X : BNE .MBRoom 
    LDA.W #$0000 
    JML.L RinkaDeath 


.MBRoom:
    LDA.W $0F86,X : ORA.W #$0500 : STA.W $0F86,X 
    LDA.W $0F7A,X : STA.B $12 
    LDA.W $0F7E,X : STA.B $14 
    LDY.W #EnemyProjectile_MiscDust 
    LDA.W #$0003 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    LDA.W #Function_Rinka_Killed : STA.W $0FA8,X 
    LDA.W #$0001 : STA.W $0FB2,X 
    RTL 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Instruction_Rinka_GotoYIfCounterGreaterThan2_A2B9A2:
    LDA.L $7E783C 
    CMP.W #$0003 
    BPL .gotoY 
    INY #2
    RTL 


.gotoY:
    LDA.W $0000,Y 
    TAY 
    RTL 
endif ; !FEATURE_KEEP_UNREFERENCED


Instruction_Rinka_SetAsIntangibleAndInvisible:
    LDA.W $0F86,X : ORA.W #$0500 : STA.W $0F86,X 
    RTL 


Instruction_Rinka_SetAsIntangibleInvisibleAndActiveOffScreen:
    LDA.W $0F86,X : ORA.W #$0D00 : STA.W $0F86,X 
    RTL 


Instruction_Rinka_FireRinka:
    LDA.W $0F86,X : AND.W #$FAFF : STA.W $0F86,X 
    LDA.W #Function_Rinka_Fire : STA.W $0FA8,X 
    LDA.L $7E783C 
    INC A 
    STA.L $7E783C 
    RTL 


InstList_Rinka_NotMotherBrainsRoom_0:
    dw Instruction_Rinka_SetAsIntangibleAndInvisible 
    dw $0040 
    dw Spritemap_Rinka_0 
    dw Instruction_Rinka_FireRinka 

InstList_Rinka_NotMotherBrainsRoom_1:
    dw $0010 
    dw Spritemap_Rinka_0 
    dw $0008 
    dw Spritemap_Rinka_1 
    dw $0007 
    dw Spritemap_Rinka_2 
    dw $0006 
    dw Spritemap_Rinka_3 
    dw $0005 
    dw Spritemap_Rinka_4 
    dw $0006 
    dw Spritemap_Rinka_3 
    dw $0007 
    dw Spritemap_Rinka_2 
    dw $0008 
    dw Spritemap_Rinka_1 
    dw Instruction_Common_GotoY 
    dw InstList_Rinka_NotMotherBrainsRoom_1 

InstList_Rinka_MotherBrainsRoom_0:
    dw Instruction_Rinka_SetAsIntangibleInvisibleAndActiveOffScreen 
    dw $0040 
    dw Spritemap_Rinka_0 
    dw Instruction_Rinka_FireRinka 

InstList_Rinka_MotherBrainsRoom_1:
    dw $0010 
    dw Spritemap_Rinka_0 
    dw $0008 
    dw Spritemap_Rinka_1 
    dw $0007 
    dw Spritemap_Rinka_2 
    dw $0006 
    dw Spritemap_Rinka_3 
    dw $0005 
    dw Spritemap_Rinka_4 
    dw $0006 
    dw Spritemap_Rinka_3 
    dw $0007 
    dw Spritemap_Rinka_2 
    dw $0008 
    dw Spritemap_Rinka_1 
    dw Instruction_Common_GotoY 
    dw InstList_Rinka_MotherBrainsRoom_1 

Spritemap_Rinka_0:
    dw $0001,$C3F8 
    db $F8 
    dw $3100 

Spritemap_Rinka_1:
    dw $0001,$C3F8 
    db $F8 
    dw $3102 

Spritemap_Rinka_2:
    dw $0001,$C3F8 
    db $F8 
    dw $3104 

Spritemap_Rinka_3:
    dw $0001,$C3F8 
    db $F8 
    dw $3106 

Spritemap_Rinka_4:
    dw $0001,$C3F8 
    db $F8 
    dw $3108 

Palette_Polyp_Rinka:
    dw $3800,$5739,$4273,$2DAD,$14C6,$19DA,$1174,$0D0F 
    dw $08AA,$0FDE,$02DF,$019F,$005F,$0037,$6FDF,$0006 

Palette_Rio:
    dw $3800,$2FFF,$1AF7,$014A,$0063,$275A,$0EB5,$0210 
    dw $01CE,$03E0,$02E0,$0200,$0100,$7F00,$6DE0,$54E0 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_Rio_Idle_A2BB9B:
    dw $0004 
    dw Spritemap_Rio_0 
    dw $0004 
    dw Spritemap_Rio_1 
    dw $0004 
    dw Spritemap_Rio_0 
    dw $0004 
    dw Spritemap_Rio_1 
    dw $0004 
    dw Spritemap_Rio_0 
    dw $0004 
    dw Spritemap_Rio_1 
    dw $0004 
    dw Spritemap_Rio_0 
    dw $0004 
    dw Spritemap_Rio_1 
    dw $0004 
    dw Spritemap_Rio_2 
    dw $0004 
    dw Spritemap_Rio_3 
    dw $0004 
    dw Spritemap_Rio_2 
    dw $0004 
    dw Spritemap_Rio_3 
    dw Instruction_Common_GotoY 
    dw UNUSED_InstList_Rio_Idle_A2BB9B 

UNUSED_InstList_Rio_Swooping_A2BACF:
    dw $0003 
    dw Spritemap_Rio_2 
    dw $0003 
    dw Spritemap_Rio_3 
    dw $0003 
    dw Spritemap_Rio_4 
    dw $0003 
    dw Spritemap_Rio_5 
    dw $0003 
    dw Spritemap_Rio_6 
    dw $0003 
    dw Spritemap_Rio_7 
    dw $0003 
    dw Spritemap_Rio_6 
    dw $0003 
    dw Spritemap_Rio_7 
    dw $0003 
    dw Spritemap_Rio_6 
    dw $0003 
    dw Spritemap_Rio_7 
    dw $0003 
    dw Spritemap_Rio_6 
    dw $0003 
    dw Spritemap_Rio_7 
    dw $0003 
    dw Spritemap_Rio_6 
    dw $0003 
    dw Spritemap_Rio_7 
    dw $0003 
    dw Spritemap_Rio_6 
    dw $0003 
    dw Spritemap_Rio_7 
    dw $0003 
    dw Spritemap_Rio_6 
    dw $0003 
    dw Spritemap_Rio_7 
    dw $0003 
    dw Spritemap_Rio_6 
    dw $0003 
    dw Spritemap_Rio_7 
    dw $0003 
    dw Spritemap_Rio_6 
    dw $0003 
    dw Spritemap_Rio_7 
    dw $0003 
    dw Spritemap_Rio_6 
    dw $0003 
    dw Spritemap_Rio_7 
    dw $0003 
    dw Spritemap_Rio_6 
    dw $0003 
    dw Spritemap_Rio_7 
    dw $0003 
    dw Spritemap_Rio_6 
    dw $0003 
    dw Spritemap_Rio_7 
    dw $0003 
    dw Spritemap_Rio_6 
    dw $0003 
    dw Spritemap_Rio_7 
    dw Instruction_Common_GotoY 
    dw UNUSED_InstList_Rio_Swooping_A2BACF 
endif ; !FEATURE_KEEP_UNREFERENCED

InstList_Rio_Idle:
    dw $0004 
    dw Spritemap_Rio_0 
    dw $0004 
    dw Spritemap_Rio_1 

InstList_Rio_PostSwoopIdle:
    dw $0004 
    dw Spritemap_Rio_0 
    dw $0004 
    dw Spritemap_Rio_1 
    dw $0004 
    dw Spritemap_Rio_0 
    dw $0004 
    dw Spritemap_Rio_1 
    dw $0004 
    dw Spritemap_Rio_0 
    dw $0004 
    dw Spritemap_Rio_1 
    dw $0004 
    dw Spritemap_Rio_2 
    dw $0004 
    dw Spritemap_Rio_3 
    dw $0004 
    dw Spritemap_Rio_2 
    dw $0004 
    dw Spritemap_Rio_3 
    dw Instruction_Common_GotoY 
    dw InstList_Rio_Idle 

InstList_Rio_Swooping_Part1:
    dw $0003 
    dw Spritemap_Rio_2 
    dw $0003 
    dw Spritemap_Rio_3 
    dw $0003 
    dw Spritemap_Rio_4 
    dw $0003 
    dw Spritemap_Rio_5 
    dw $0003 
    dw Spritemap_Rio_6 
    dw Instruction_Rio_SetAnimationFinishedFlag 
    dw Instruction_Common_Sleep 

InstList_Rio_Swooping_Part2:
    dw $0003 
    dw Spritemap_Rio_7 
    dw $0003 
    dw Spritemap_Rio_6 
    dw Instruction_Common_GotoY 
    dw InstList_Rio_Swooping_Part2 

InstList_Rio_SwoopCooldown:
    dw $0003 
    dw Spritemap_Rio_6 
    dw $0003 
    dw Spritemap_Rio_5 
    dw $0003 
    dw Spritemap_Rio_4 
    dw $0003 
    dw Spritemap_Rio_3 
    dw $0003 
    dw Spritemap_Rio_2 
    dw Instruction_Rio_SetAnimationFinishedFlag 
    dw Instruction_Common_Sleep 

RioConstants_YVelocity:
    dw $0580 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_RioConstants_A2BBBD:
    dw $0600 
endif ; !FEATURE_KEEP_UNREFERENCED

RioConstants_XVelocity:
    dw $0180 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_RioConstants_A2BBC1:
    dw $0200 
endif ; !FEATURE_KEEP_UNREFERENCED

Instruction_Rio_SetAnimationFinishedFlag:
    LDX.W $0E54 
    LDA.W #$0001 : STA.W $0FB0,X 
    RTL 


InitAI_Rio:
    LDX.W $0E54 
    STZ.W $0FB0,X 
    STZ.W $0FB2,X 
    LDA.W #InstList_Rio_Idle : STA.W $0F92,X 
    LDA.W #Function_Rio_WaitForSamusToGetNear : STA.W $0FAA,X 
    RTL 


MainAI_Rio:
    JSL.L GenerateRandomNumber 
    LDX.W $0E54 
    JMP.W ($0FAA,X) 


Function_Rio_WaitForSamusToGetNear:
    LDA.W #$00A0 
    JSL.L CheckIfXDistanceBetweenEnemyAndSamusIsAtLeastA 
    BCC .SamusNear 
    RTL 


.SamusNear:
    LDA.W RioConstants_YVelocity : STA.W $0FAC,X 
    LDA.W RioConstants_XVelocity : STA.W $0FAE,X 
    LDA.W $0AF6 
    CMP.W $0F7A,X 
    BPL + 
    LDA.W $0FAE,X 
    EOR.W #$FFFF 
    INC A 
    STA.W $0FAE,X 

  + LDA.W #InstList_Rio_Swooping_Part1 
    JSR.W SetRioInstList 
    LDA.W #Function_Rio_Swoop_Descending : STA.W $0FAA,X 
    JSL.L CheckIfEnemyCenterIsOnScreen 
    AND.W #$FFFF 
    BNE .return 
    LDA.W #$0065 
    JSL.L QueueSound_Lib2_Max6 

.return:
    RTL 


Function_Rio_SwoopCooldown:
    LDA.W $0FB0,X : BNE .finishedAnimation 
    RTL 


.finishedAnimation:
    STZ.W $0FB0,X 
    LDA.W #InstList_Rio_PostSwoopIdle 
    JSR.W SetRioInstList 
    LDA.W #Function_Rio_WaitForSamusToGetNear : STA.W $0FAA,X 
    RTL 


Function_Rio_Swoop_Descending:
    STZ.B $12 
    STZ.B $14 
    LDA.W $0FAE,X : BPL + 
    DEC.B $14 

  + STA.B $13 
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes 
    BCS .collidedHorizontally 
    STZ.B $12 
    STZ.B $14 
    LDA.W $0FAC,X : BPL + 
    DEC.B $14 

  + STA.B $13 
    JSL.L MoveEnemyDownBy_14_12 
    BCS .collidedVertically 
    LDA.W $0FAC,X : SEC : SBC.W #$0018 : STA.W $0FAC,X 
    BMI .homing 
    LDA.W $0FB0,X : BEQ .return 
    STZ.W $0FB0,X 
    LDA.W #InstList_Rio_Swooping_Part2 
    JSR.W SetRioInstList 

.return:
    RTL 


.homing:
    LDA.W $0FAE,X : STA.W $0FA8,X 
    STZ.W $0FAE,X 
    STZ.W $0FAC,X 
    LDA.W #Function_Rio_Homing : STA.W $0FAA,X 
    RTL 


.collidedHorizontally:
    LDA.W $0FAE,X 
    EOR.W #$FFFF 
    INC A 
    STA.W $0FAE,X 

.collidedVertically:
    LDA.W $0FAC,X 
    EOR.W #$FFFF 
    INC A 
    STA.W $0FAC,X 
    LDA.W #Function_Rio_Swoop_Ascending : STA.W $0FAA,X 
    RTL 


Function_Rio_Swoop_Ascending:
    STZ.B $12 
    STZ.B $14 
    LDA.W $0FAE,X : BPL + 
    DEC.B $14 

  + STA.B $13 
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes 
    BCC .notCollidedWithWall 
    LDA.W $0FAE,X 
    EOR.W #$FFFF 
    INC A 
    STA.W $0FAE,X 

.notCollidedWithWall:
    STZ.B $12 
    STZ.B $14 
    LDA.W $0FAC,X : BPL + 
    DEC.B $14 

  + STA.B $13 
    JSL.L MoveEnemyDownBy_14_12 
    BCS .notCollidedWithBlock 
    LDA.W $0FAC,X : SEC : SBC.W #$0018 : STA.W $0FAC,X 
    RTL 


.notCollidedWithBlock:
    LDA.W #InstList_Rio_SwoopCooldown 
    JSR.W SetRioInstList 
    LDA.W #Function_Rio_SwoopCooldown : STA.W $0FAA,X 
    RTL 


Function_Rio_Homing:
    LDA.W $0F7E,X : SEC : SBC.W $0AFA : BPL .resumeSwoop 
    JSL.L CalculateAngleOfSamusFromEnemy 
    TXY 
    ASL A 
    TAX 
    LDA.L SineCosineTables_8bitSine_SignExtended,X : STA.W $0FAE,Y 
    LDA.L SineCosineTables_NegativeCosine_SignExtended,X : STA.W $0FAC,Y 
    TYX 
    STZ.B $12 
    STZ.B $14 
    LDA.W $0FAE,X : BPL + 
    DEC.B $14 

  + STA.B $13 
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes 
    STZ.B $12 
    STZ.B $14 
    LDA.W $0FAC,X : BPL + 
    DEC.B $14 

  + STA.B $13 
    JSL.L MoveEnemyDownBy_14_12 
    RTL 


.resumeSwoop:
    LDA.W $0FA8,X : STA.W $0FAE,X 
    LDA.W #$FFFF : STA.W $0FAC,X 
    LDA.W #Function_Rio_Swoop_Ascending : STA.W $0FAA,X 
    RTL 


SetRioInstList:
    LDX.W $0E54 
    CMP.W $0FB2,X 
    BEQ .return 
    STA.W $0FB2,X 
    STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    STZ.W $0F90,X 

.return:
    RTS 


Spritemap_Rio_0:
    dw $0004,$81FF 
    db $F0 
    dw $6100,$81FF 
    db $00 
    dw $6102,$81F0 
    db $00 
    dw $2102,$81F0 
    db $F0 
    dw $2100 

Spritemap_Rio_1:
    dw $0004,$81F0 
    db $00 
    dw $2102,$81FF 
    db $00 
    dw $6102,$81FF 
    db $F8 
    dw $E104,$81F0 
    db $F8 
    dw $A104 

Spritemap_Rio_2:
    dw $0004,$81FF 
    db $00 
    dw $6106,$81F0 
    db $00 
    dw $2106,$81FF 
    db $F0 
    dw $6100,$81F0 
    db $F0 
    dw $2100 

Spritemap_Rio_3:
    dw $0004,$81FF 
    db $00 
    dw $6106,$81F0 
    db $00 
    dw $2106,$81FF 
    db $F8 
    dw $E104,$81F0 
    db $F8 
    dw $A104 

Spritemap_Rio_4:
    dw $0004,$81FF 
    db $00 
    dw $6108,$81F0 
    db $00 
    dw $2108,$81FF 
    db $F0 
    dw $6100,$81F0 
    db $F0 
    dw $2100 

Spritemap_Rio_5:
    dw $0004,$81FF 
    db $00 
    dw $6108,$81F0 
    db $00 
    dw $2108,$81FF 
    db $F8 
    dw $E104,$81F0 
    db $F8 
    dw $A104 

Spritemap_Rio_6:
    dw $0004,$81FF 
    db $00 
    dw $610A,$81F0 
    db $00 
    dw $210A,$81FF 
    db $F0 
    dw $6100,$81F0 
    db $F0 
    dw $2100 

Spritemap_Rio_7:
    dw $0004,$81FF 
    db $00 
    dw $610A,$81F0 
    db $00 
    dw $210A,$81FF 
    db $F8 
    dw $E104,$81F0 
    db $F8 
    dw $A104 

Palette_Squeept:
    dw $3800,$021D,$0015,$0008,$0003,$00BD,$0013,$000E 
    dw $000B,$7FFF,$039C,$0237,$00D1,$03A0,$02C0,$05E0 

InstList_Squeept_Rising:
    dw $0001 
    dw Spritemap_Squeept_0 
    dw Instruction_Common_Sleep 

InstList_Squeept_Flipping_Falling:
    dw $0001 
    dw Spritemap_Squeept_0 
    dw $0005 
    dw Spritemap_Squeept_1 
    dw $0009 
    dw Spritemap_Squeept_2 
    dw $0007 
    dw Spritemap_Squeept_3 
    dw $0003 
    dw Spritemap_Squeept_4 
    dw $000A 
    dw Spritemap_Squeept_5 
    dw $0001 
    dw Spritemap_Squeept_6 
    dw Instruction_Squeept_SetAnimationFinishedFlag 
    dw Instruction_Common_Sleep 

InstList_Squeept_Flame_0:
    dw $0001 
    dw Spritemap_Squeept_7 
    dw $0001 
    dw Spritemap_CommonA2_Nothing 
    dw Instruction_Common_TimerInY 
    dw $0001 

InstList_Squeept_Flame_1:
    dw $0001 
    dw Spritemap_Squeept_9 
    dw $0001 
    dw Spritemap_CommonA2_Nothing 
    dw $0001 
    dw Spritemap_Squeept_8 
    dw $0001 
    dw Spritemap_CommonA2_Nothing 
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate 
    dw InstList_Squeept_Flame_1 
    dw Instruction_Common_GotoY 
    dw InstList_Squeept_Flame_0 

SqueeptInitialYVelocities:
    dw $F7FF,$F8FE,$F9BF,$FAFF 

Instruction_Squeept_SetAnimationFinishedFlag:
    LDX.W $0E54 
    LDA.W #$0001 : STA.L $7E7800,X 
    RTL 


InitAI_Squeept:
    LDX.W $0E54 
    LDA.W #$0000 : STA.L $7E7800,X 
    STA.L $7E7802,X 
    LDA.W $0FB4,X : BMI .flame 
    LDA.W $0F7A,X : STA.W $0FAE,X 
    LDA.W $0F7E,X : STA.W $0FB0,X 
    LDA.W #InstList_Squeept_Rising : STA.W $0F92,X 
    LDA.W #Function_Squeept_Jump : STA.W $0FB2,X 
    RTL 


.flame:
    LDA.W #InstList_Squeept_Flame_0 : STA.W $0F92,X 
    LDA.W #Function_Squeept_Flame : STA.W $0FB2,X 
    RTL 


MainAI_Squeept:
    JSL.L GenerateRandomNumber 
    LDX.W $0E54 
    JMP.W ($0FB2,X) 


Function_Squeept_Flame:
    LDA.W $0F4C,X : BNE .notDead 
    LDA.W $0F86,X : ORA.W #$0200 : STA.W $0F86,X 
    RTL 


.notDead:
    LDA.W $0F5E,X : STA.W $0F9E,X 
    BEQ .frozen 
    BRA .invisible 


.frozen:
    BIT.W $0F6C,X 
    BMI .visible 

.invisible:
    LDA.W $0F86,X : ORA.W #$0100 : STA.W $0F86,X 
    RTL 


.visible:
    LDA.W $0F86,X : AND.W #$FEFF : STA.W $0F86,X 
    LDA.W $0F3E,X : STA.W $0F7E,X 
    LDA.W $0F3E,X ; >_<
    STA.W $0F7E,X 
    RTL 


Function_Squeept_Jump:
    LDA.W $05E6 : AND.W #$0006 
    TAY 
    LDA.W SqueeptInitialYVelocities,Y : STA.W $0FAC,X 
    LDA.W #Function_Squeept_Rising : STA.W $0FB2,X 
    LDA.W $0F86,X : ORA.W #$0800 : STA.W $0F86,X 
    LDA.W #$000D 
    JSL.L QueueSound_Lib2_Max6 
    RTL 


Function_Squeept_Rising:
    LDA.W $0FAB,X : AND.W #$FF00 
    CLC : ADC.W $0F80,X : STA.W $0F80,X 
    LDA.W $0FAC,X 
    XBA 
    BPL .lowByte 
    ORA.W #$FF00 
    BRA + 


.lowByte:
    AND.W #$00FF 

  + ADC.W $0F7E,X : STA.W $0F7E,X 
    LDA.W $0FAC,X : CLC : ADC.W #$0038 : STA.W $0FAC,X 
    CMP.W #$FC00 
    BCS .maxHeight 
    RTL 


.maxHeight:
    LDA.W #InstList_Squeept_Flipping_Falling 
    JSR.W SetSqueeptInstList 
    LDA.W #Function_Squeept_Flipping : STA.W $0FB2,X 
    RTL 


Function_Squeept_Flipping:
    LDA.W $0FAB,X : AND.W #$FF00 
    CLC : ADC.W $0F80,X : STA.W $0F80,X 
    LDA.W $0FAC,X 
    XBA 
    BPL .lowByte 
    ORA.W #$FF00 
    BRA + 


.lowByte:
    AND.W #$00FF 

  + ADC.W $0F7E,X : STA.W $0F7E,X 
    LDA.W $0FAC,X : CLC : ADC.W #$0038 : STA.W $0FAC,X 
    LDA.L $7E7800,X : BNE .animationFinished 
    RTL 


.animationFinished:
    LDA.W #$0000 : STA.L $7E7800,X 
    LDA.W #Function_Squeept_Falling : STA.W $0FB2,X 
    RTL 


Function_Squeept_Falling:
    LDA.W $0FAB,X : AND.W #$FF00 
    CLC : ADC.W $0F80,X : STA.W $0F80,X 
    LDA.W $0FAC,X 
    XBA 
    BPL .lowByte 
    ORA.W #$FF00 
    BRA + 


.lowByte:
    AND.W #$00FF 

  + ADC.W $0F7E,X : STA.W $0F7E,X 
    AND.W #$00F0 
    CMP.W #$00F0 
    BEQ .nextJump 
    LDA.W $0FAC,X : CLC : ADC.W #$0038 : STA.W $0FAC,X 
    RTL 


.nextJump:
    LDA.W $0FAE,X : STA.W $0F7A,X 
    LDA.W $0FB0,X : STA.W $0F7E,X 
    LDA.W #InstList_Squeept_Rising 
    JSR.W SetSqueeptInstList 
    LDA.W #Function_Squeept_Jump : STA.W $0FB2,X 
    LDA.W $0F86,X : AND.W #$F7FF : STA.W $0F86,X 
    RTL 


SetSqueeptInstList:
    LDX.W $0E54 
    CMP.L $7E7802,X 
    BEQ .return 
    STA.L $7E7802,X 
    STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    STZ.W $0F90,X 

.return:
    RTS 


Spritemap_Squeept_0:
    dw $0004,$81FF 
    db $F3 
    dw $6100,$81FF 
    db $03 
    dw $6102,$81F0 
    db $03 
    dw $2102,$81F0 
    db $F3 
    dw $2100 

Spritemap_Squeept_1:
    dw $0004,$0007 
    db $03 
    dw $610C,$01F0 
    db $03 
    dw $210C,$81FF 
    db $F3 
    dw $6104,$81F0 
    db $F3 
    dw $2104 

Spritemap_Squeept_2:
    dw $0002,$8000 
    db $F4 
    dw $6106,$81F0 
    db $F4 
    dw $2106 

Spritemap_Squeept_3:
    dw $0002,$8000 
    db $F8 
    dw $E106,$81F0 
    db $F8 
    dw $A106 

Spritemap_Squeept_4:
    dw $0004,$0007 
    db $EF 
    dw $E10C,$01F0 
    db $EF 
    dw $A10C,$81FF 
    db $F7 
    dw $E104,$81F0 
    db $F7 
    dw $A104 

Spritemap_Squeept_5:
    dw $0004,$81FF 
    db $FC 
    dw $E100,$81FF 
    db $EC 
    dw $E102,$81F0 
    db $EC 
    dw $A102,$81F0 
    db $FC 
    dw $A100 

Spritemap_Squeept_6:
    dw $0003,$81FF 
    db $FC 
    dw $610A,$81F0 
    db $FC 
    dw $210A,$81F8 
    db $EC 
    dw $2108 

Spritemap_Squeept_7:
    dw $0002,$0000 
    db $04 
    dw $611C,$01F9 
    db $04 
    dw $211C 

Spritemap_Squeept_8:
    dw $0002,$01FC 
    db $0C 
    dw $211D,$01FC 
    db $04 
    dw $210D 

Spritemap_Squeept_9:
    dw $0002,$01FC 
    db $0C 
    dw $211E,$01FC 
    db $04 
    dw $210E 

Palette_Geruta:
    dw $3800,$4E7F,$3975,$0C0A,$0006,$45D8,$2D33,$1C8E 
    dw $102B,$5347,$5624,$5962,$5CA0,$1BBD,$0DFD,$009D 

InstList_Geruta_Main_Idle:
    dw Instruction_Geruta_SetFlamesYOffset_8_duplicate 
    dw $000D 
    dw Spritemap_Geruta_1 
    dw $0012 
    dw Spritemap_Geruta_0 
    dw $000D 
    dw Spritemap_Geruta_1 
    dw $0012 
    dw Spritemap_Geruta_2 
    dw Instruction_Common_GotoY 
    dw InstList_Geruta_Main_Idle 

InstList_Geruta_Main_Swoop_StartDescending:
    dw Instruction_Geruta_SetFlamesYOffset_8 
    dw $0001 
    dw Spritemap_Geruta_0 
    dw Instruction_Geruta_SetFlamesYOffset_4 
    dw $0001 
    dw Spritemap_Geruta_A 
    dw Instruction_Geruta_SetFlamesYOffset_0 
    dw $0001 
    dw Spritemap_Geruta_B 
    dw Instruction_Geruta_SetFlamesYOffset_negative4 
    dw $0001 
    dw Spritemap_Geruta_C 
    dw Instruction_Geruta_SetFlamesYOffset_negativeC_duplicate 
    dw $0001 
    dw Spritemap_Geruta_D 
    dw Instruction_Geruta_SetFlamesYOffset_negative10 
    dw $0001 
    dw Spritemap_Geruta_E 
    dw Instruction_Geruta_SetFinishedSwoopStartAnimationFlag 
    dw Instruction_Common_Sleep 

InstList_Geruta_Main_Swoop_Descending:
    dw Instruction_Geruta_SetFlamesYOffset_negativeC 
    dw $0006 
    dw Spritemap_Geruta_7 
    dw $0005 
    dw Spritemap_Geruta_8 
    dw $0008 
    dw Spritemap_Geruta_9 
    dw $0006 
    dw Spritemap_Geruta_8 
    dw Instruction_Common_GotoY 
    dw InstList_Geruta_Main_Swoop_Descending 

InstList_Geruta_Main_Swoop_StartAscending:
    dw Instruction_Geruta_SetFlamesYOffset_negative10 
    dw $0001 
    dw Spritemap_Geruta_E 
    dw Instruction_Geruta_SetFlamesYOffset_negativeC_duplicate 
    dw $0001 
    dw Spritemap_Geruta_D 
    dw Instruction_Geruta_SetFlamesYOffset_negative4 
    dw $0001 
    dw Spritemap_Geruta_C 
    dw Instruction_Geruta_SetFlamesYOffset_0 
    dw $0001 
    dw Spritemap_Geruta_B 
    dw Instruction_Geruta_SetFlamesYOffset_4 
    dw $0001 
    dw Spritemap_Geruta_A 
    dw Instruction_Geruta_SetFlamesYOffset_8 
    dw $0001 
    dw Spritemap_Geruta_0 
    dw Instruction_Geruta_SetFlamesYOffset_8_duplicate 
    dw $0001 
    dw Spritemap_Geruta_1 
    dw Instruction_Geruta_SetFlamesYOffset_C 
    dw $0001 
    dw Spritemap_Geruta_2 
    dw Instruction_Geruta_SetFinishedSwoopStartAnimationFlag 
    dw Instruction_Common_Sleep 

InstList_Geruta_Main_Swoop_Ascending:
    dw Instruction_Geruta_SetFlamesYOffset_C_duplicate 
    dw $0006 
    dw Spritemap_Geruta_F 
    dw $0005 
    dw Spritemap_Geruta_10 
    dw $0008 
    dw Spritemap_Geruta_11 
    dw $0006 
    dw Spritemap_Geruta_10 
    dw Instruction_Common_GotoY 
    dw InstList_Geruta_Main_Swoop_Ascending 

InstList_Geruta_Flames_Ascending:
    dw $0006 
    dw Spritemap_Geruta_4 
    dw $0005 
    dw Spritemap_Geruta_5 
    dw $0008 
    dw Spritemap_Geruta_6 
    dw $0006 
    dw Spritemap_Geruta_5 
    dw Instruction_Common_GotoY 
    dw InstList_Geruta_Flames_Ascending 

InstList_Geruta_Flames_Descending:
    dw $0006 
    dw Spritemap_Geruta_12 
    dw $0005 
    dw Spritemap_Geruta_13 
    dw $0008 
    dw Spritemap_Geruta_14 
    dw $0006 
    dw Spritemap_Geruta_13 
    dw Instruction_Common_GotoY 
    dw InstList_Geruta_Flames_Descending 

UNSUED_GerutaConstants_A2C1B7:
    dw $0000,$000E,$000C,$000E,$0010 

GerutaConstants_swoopYSpeeds:
    dw $0700,$05C0 

GerutaConstants_swoopXSpeed:
    dw $0100 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_GerutaConstants_maybeLeftoverSwoopXSpeed_A2C1C7:
    dw $0100 
endif ; !FEATURE_KEEP_UNREFERENCED

Instruction_Geruta_SetFinishedSwoopStartAnimationFlag:
    LDX.W $0E54 
    LDA.W #$0001 : STA.L $7E7802,X 
    RTL 


Instruction_Geruta_SetFlamesYOffset_8:
    LDX.W $0E54 
    LDA.W #$0008 : STA.L $7E7804,X 
    RTL 


Instruction_Geruta_SetFlamesYOffset_8_duplicate:
    LDX.W $0E54 
    LDA.W #$0008 : STA.L $7E7804,X 
    RTL 


Instruction_Geruta_SetFlamesYOffset_C:
    LDX.W $0E54 
    LDA.W #$000C : STA.L $7E7804,X 
    RTL 


Instruction_Geruta_SetFlamesYOffset_negativeC:
    LDX.W $0E54 
    LDA.W #$FFF4 : STA.L $7E7804,X 
    RTL 


Instruction_Geruta_SetFlamesYOffset_4:
    LDX.W $0E54 
    LDA.W #$0004 : STA.L $7E7804,X 
    RTL 


Instruction_Geruta_SetFlamesYOffset_0:
    LDX.W $0E54 
    LDA.W #$0000 : STA.L $7E7804,X 
    RTL 


Instruction_Geruta_SetFlamesYOffset_negative4:
    LDX.W $0E54 
    LDA.W #$FFFC : STA.L $7E7804,X 
    RTL 


Instruction_Geruta_SetFlamesYOffset_negativeC_duplicate:
    LDX.W $0E54 
    LDA.W #$FFF4 : STA.L $7E7804,X 
    RTL 


Instruction_Geruta_SetFlamesYOffset_negative10:
    LDX.W $0E54 
    LDA.W #$FFF0 : STA.L $7E7804,X 
    RTL 


Instruction_Geruta_SetFlamesYOffset_C_duplicate:
    LDX.W $0E54 
    LDA.W #$000C : STA.L $7E7804,X 
    RTL 


InitAI_Geruta:
    LDX.W $0E54 
    LDA.W #$0000 : STA.L $7E7802,X 
    STA.L $7E7804,X 
    LDA.W $0FB4,X : BMI .flames 
    LDA.W #InstList_Geruta_Main_Idle : STA.L $7E7800,X 
    STA.W $0F92,X 
    LDA.W #Function_Geruta_Idle : STA.W $0FB2,X 
    RTL 


.flames:
    LDA.W #InstList_Geruta_Flames_Ascending : STA.L $7E7800,X 
    STA.W $0F92,X 
    LDA.W #Function_Geruta_Flames : STA.W $0FB2,X 
    RTL 


MainAI_Geruta:
    JSL.L GenerateRandomNumber 
    LDX.W $0E54 
    JMP.W ($0FB2,X) 


Function_Geruta_Flames:
    LDA.W $0F4C,X : BNE .notDead 
    LDA.W $0F86,X : ORA.W #$0200 : STA.W $0F86,X 
    RTL 


.notDead:
    LDA.W $0F5E,X : STA.W $0F9E,X 
    BEQ .notFrozen 
    BRA .frozen 

    RTL ; >_<


.notFrozen:
    LDA.W $0F86,X : AND.W #$FEFF : STA.W $0F86,X 
    LDA.L $7E77C0,X 
    CMP.W #InstList_Geruta_Main_Idle 
    BNE .swooping 

.frozen:
    LDA.W $0F86,X : ORA.W #$0100 : STA.W $0F86,X 
    RTL 


.swooping:
    LDA.W #InstList_Geruta_Flames_Ascending : STA.B $12 
    LDA.L $7E77C4,X : BPL + 
    LDA.W #InstList_Geruta_Flames_Descending : STA.B $12 

  + LDA.B $12 
    JSR.W SetGerutaInstList 
    LDA.W $0F86,X : AND.W #$FEFF : STA.W $0F86,X 
    LDA.W $0F3A,X : STA.W $0F7A,X 
    LDA.W $0F3E,X : CLC : ADC.L $7E77C4,X : STA.W $0F7E,X 
    RTL 


Function_Geruta_Idle:
    LDA.W $05E5 : AND.W #$0101 
    BEQ + 
    LDA.W #$00C0 
    JSL.L CheckIfXDistanceBetweenEnemyAndSamusIsAtLeastA 
    BCC .swoop 

  + LDA.L $7E7802,X : BEQ .return 
    LDA.W #$0000 : STA.L $7E7802,X 
    LDA.W #InstList_Geruta_Main_Idle 
    JSR.W SetGerutaInstList 

.return:
    RTL 


.swoop:
    LDA.W $05E5 
    LSR A 
    AND.W #$0002 
    TAY 
    LDA.W GerutaConstants_swoopYSpeeds,Y : STA.W $0FA8,X 
    LDA.W GerutaConstants_swoopXSpeed : STA.W $0FAA,X 
    LDA.W $0AF6 
    CMP.W $0F7A,X 
    BPL .SamusToTheLeft 
    LDA.W $0FAA,X 
    EOR.W #$FFFF 
    INC A 
    STA.W $0FAA,X 

.SamusToTheLeft:
    LDA.W #InstList_Geruta_Main_Swoop_StartDescending 
    JSR.W SetGerutaInstList 
    LDA.W #Function_Geruta_StartSwoop : STA.W $0FB2,X 
    RTL 


Function_Geruta_StartSwoop:
    LDA.L $7E7802,X : BNE .finishedStartAnimation 
    RTL 


.finishedStartAnimation:
    LDA.W #$0000 : STA.L $7E7802,X 
    LDA.W #InstList_Geruta_Main_Swoop_Descending 
    JSR.W SetGerutaInstList 
    LDA.W #Function_Geruta_Swoop_Descending : STA.W $0FB2,X 
    LDA.W #$0065 
    JSL.L QueueSound_Lib2_Max6 
    RTL 


Function_Geruta_Swoop_Descending:
    STZ.B $12 
    STZ.B $14 
    LDA.W $0FAA,X : BPL + 
    DEC.B $14 

  + STA.B $13 
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes 
    BCC .notCollidedWithWall 
    LDA.W $0FAA,X 
    EOR.W #$FFFF 
    INC A 
    STA.W $0FAA,X 

.notCollidedWithWall:
    STZ.B $12 
    STZ.B $14 
    LDA.W $0FA8,X : BPL + 
    DEC.B $14 

  + STA.B $13 
    JSL.L MoveEnemyDownBy_14_12 
    BCS .collidedWithBlock 
    LDA.W $0FA8,X : SEC : SBC.W #$0020 : STA.W $0FA8,X 
    BMI .collidedWithBlock 
    RTL 


.collidedWithBlock:
    LDA.W #$FFFF : STA.W $0FA8,X 
    LDA.W #InstList_Geruta_Main_Swoop_StartAscending 
    JSR.W SetGerutaInstList 
    LDA.W #Function_Geruta_Swoop_Ascending : STA.W $0FB2,X 
    RTL 


Function_Geruta_Swoop_Ascending:
    STZ.B $12 
    STZ.B $14 
    LDA.W $0FAA,X : BPL + 
    DEC.B $14 

  + STA.B $13 
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes 
    BCC .notCollidedWithWall 
    LDA.W $0FAA,X 
    EOR.W #$FFFF 
    INC A 
    STA.W $0FAA,X 

.notCollidedWithWall:
    STZ.B $12 
    STZ.B $14 
    LDA.W $0FA8,X : BPL + 
    DEC.B $14 

  + STA.B $13 
    JSL.L MoveEnemyDownBy_14_12 
    BCS .collidedVertically 
    LDA.W $0FA8,X : SEC : SBC.W #$0020 : STA.W $0FA8,X 
    LDA.L $7E7802,X : BEQ .return 
    LDA.W #$0000 : STA.L $7E7802,X 
    LDA.W #InstList_Geruta_Main_Swoop_Ascending 
    JSR.W SetGerutaInstList 

.return:
    RTL 


.collidedVertically:
    LDA.W #Function_Geruta_FinishSwoop : STA.W $0FB2,X 
    RTL 


Function_Geruta_FinishSwoop:
    LDA.W #Function_Geruta_Idle : STA.W $0FB2,X 
    RTL 


SetGerutaInstList:
    LDX.W $0E54 
    CMP.L $7E7800,X 
    BEQ .return 
    STA.L $7E7800,X 
    STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    STZ.W $0F90,X 

.return:
    RTS 


Spritemap_Geruta_0:
    dw $0005,$81F8 
    db $F6 
    dw $2100,$81FE 
    db $02 
    dw $610C,$81F1 
    db $02 
    dw $210C,$8006 
    db $F5 
    dw $6106,$81E9 
    db $F5 
    dw $2106 

Spritemap_Geruta_1:
    dw $0005,$81F8 
    db $F6 
    dw $2102,$81FE 
    db $04 
    dw $610C,$81F1 
    db $04 
    dw $210C,$8006 
    db $F6 
    dw $6108,$81E9 
    db $F6 
    dw $2108 

Spritemap_Geruta_2:
    dw $0005,$8006 
    db $F7 
    dw $610A,$81E9 
    db $F7 
    dw $210A,$81FE 
    db $06 
    dw $610C,$81F1 
    db $06 
    dw $210C,$81F8 
    db $F6 
    dw $2104 

Spritemap_Geruta_3:
    dw $0005,$81FE 
    db $04 
    dw $610C,$81F1 
    db $04 
    dw $210C,$8006 
    db $F6 
    dw $610A,$81E9 
    db $F6 
    dw $210A,$81F8 
    db $F6 
    dw $2102 

Spritemap_Geruta_4:
    dw $0002,$0002 
    db $FC 
    dw $210E,$01F6 
    db $FC 
    dw $210E 

Spritemap_Geruta_5:
    dw $0002,$0002 
    db $FC 
    dw $210F,$01F6 
    db $FC 
    dw $210F 

Spritemap_Geruta_6:
    dw $0002,$0002 
    db $FC 
    dw $211E,$01F6 
    db $FC 
    dw $211E 

Spritemap_Geruta_7:
    dw $0005,$81F8 
    db $F8 
    dw $2100,$81FE 
    db $EA 
    dw $E10C,$81F1 
    db $EA 
    dw $A10C,$8006 
    db $F8 
    dw $610A,$81E9 
    db $F8 
    dw $210A 

Spritemap_Geruta_8:
    dw $0005,$81F8 
    db $F8 
    dw $2100,$81FE 
    db $EA 
    dw $E10C,$81F1 
    db $EA 
    dw $A10C,$8006 
    db $F8 
    dw $610A,$81E9 
    db $F8 
    dw $210A 

Spritemap_Geruta_9:
    dw $0005,$81F8 
    db $F8 
    dw $2100,$81FE 
    db $EA 
    dw $E10C,$81F1 
    db $EA 
    dw $A10C,$8006 
    db $F8 
    dw $610A,$81E9 
    db $F8 
    dw $210A 

Spritemap_Geruta_A:
    dw $0005,$81F8 
    db $F6 
    dw $2100,$81FE 
    db $FF 
    dw $610C,$81F1 
    db $FF 
    dw $210C,$8006 
    db $F6 
    dw $6106,$81E9 
    db $F6 
    dw $2106 

Spritemap_Geruta_B:
    dw $0003,$8005 
    db $F7 
    dw $610A,$81EA 
    db $F7 
    dw $210A,$81F8 
    db $F6 
    dw $2100 

Spritemap_Geruta_C:
    dw $0005,$81F8 
    db $F6 
    dw $2100,$8005 
    db $F8 
    dw $610A,$81FE 
    db $ED 
    dw $E10C,$81F1 
    db $ED 
    dw $A10C,$81EA 
    db $F8 
    dw $210A 

Spritemap_Geruta_D:
    dw $0005,$81F8 
    db $F6 
    dw $2100,$81FE 
    db $EA 
    dw $E10C,$81F1 
    db $EA 
    dw $A10C,$8005 
    db $F8 
    dw $610A,$81EA 
    db $F8 
    dw $210A 

Spritemap_Geruta_E:
    dw $0005,$81F8 
    db $F6 
    dw $2100,$81FE 
    db $E8 
    dw $E10C,$81F1 
    db $E8 
    dw $A10C,$8005 
    db $F8 
    dw $610A,$81EA 
    db $F8 
    dw $210A 

Spritemap_Geruta_F:
    dw $0005,$81FE 
    db $06 
    dw $610C,$81F1 
    db $06 
    dw $210C,$8006 
    db $F7 
    dw $6108,$81E9 
    db $F7 
    dw $2108,$81F8 
    db $F6 
    dw $2104 

Spritemap_Geruta_10:
    dw $0005,$81FE 
    db $06 
    dw $610C,$81F1 
    db $06 
    dw $210C,$8006 
    db $F7 
    dw $6108,$81E9 
    db $F7 
    dw $2108,$81F8 
    db $F6 
    dw $2104 

Spritemap_Geruta_11:
    dw $0005,$81FE 
    db $06 
    dw $610C,$81F1 
    db $06 
    dw $210C,$8006 
    db $F7 
    dw $6108,$81E9 
    db $F7 
    dw $2108,$81F8 
    db $F6 
    dw $2104 

Spritemap_Geruta_12:
    dw $0002,$0002 
    db $FC 
    dw $A10E,$01F6 
    db $FC 
    dw $A10E 

Spritemap_Geruta_13:
    dw $0002,$0002 
    db $FC 
    dw $A10F,$01F6 
    db $FC 
    dw $A10F 

Spritemap_Geruta_14:
    dw $0002,$0002 
    db $FC 
    dw $A11E,$01F6 
    db $FC 
    dw $A11E 

Palette_Holtz:
    dw $3800,$72FA,$55B0,$2845,$1801,$6210,$496B,$38C6 
    dw $2C63,$7D7F,$54D5,$384D,$2007,$021F,$1014,$080A 

InstList_Holtz_Idle_0:
    dw Instruction_Holtz_HideFlames 

InstList_Holtz_Idle_1:
    dw $000B 
    dw Spritemap_Holtz_0 
    dw $000B 
    dw Spritemap_Holtz_1 
    dw $000B 
    dw Spritemap_Holtz_2 
    dw $000B 
    dw Spritemap_Holtz_1 
    dw Instruction_Common_GotoY 
    dw InstList_Holtz_Idle_1 

InstList_Holtz_PrepareToSwoop:
    dw Instruction_Holtz_HideFlames 
    dw $0003 
    dw Spritemap_Holtz_2 
    dw $0003 
    dw Spritemap_Holtz_3 
    dw $0003 
    dw Spritemap_Holtz_4 
    dw $0003 
    dw Spritemap_Holtz_5 
    dw $0002 
    dw Spritemap_Holtz_6 
    dw $0001 
    dw Spritemap_Holtz_7 
    dw $0002 
    dw Spritemap_Holtz_8 
    dw $0003 
    dw Spritemap_Holtz_9 
    dw $0003 
    dw Spritemap_Holtz_A 
    dw Instruction_Holtz_SetAnimationFinishedFlag 
    dw Instruction_Common_Sleep 

InstList_Holtz_Swoop_Descending:
    dw Instruction_Holtz_HideFlames 
    dw $0001 
    dw Spritemap_Holtz_A 
    dw Instruction_Common_Sleep 

InstList_Holtz_Swoop_Ascending_Part1:
    dw Instruction_Holtz_HideFlames 
    dw $0003 
    dw Spritemap_Holtz_A 
    dw $0003 
    dw Spritemap_Holtz_9 
    dw $0003 
    dw Spritemap_Holtz_B 
    dw Instruction_Holtz_SetAnimationFinishedFlag 
    dw Instruction_Common_Sleep 

InstList_Holtz_Swoop_Part2_0:
    dw Instruction_Holtz_ShowFlames 

InstList_Holtz_Swoop_Part2_1:
    dw $0002 
    dw Spritemap_Holtz_E 
    dw $0002 
    dw Spritemap_Holtz_C 
    dw $0002 
    dw Spritemap_Holtz_D 
    dw Instruction_Common_GotoY 
    dw InstList_Holtz_Swoop_Part2_1 

InstList_Holtz_SwoopCooldown:
    dw Instruction_Holtz_ShowFlames 
    dw $0003 
    dw Spritemap_Holtz_B 
    dw $0003 
    dw Spritemap_Holtz_9 
    dw $0002 
    dw Spritemap_Holtz_8 
    dw $0001 
    dw Spritemap_Holtz_7 
    dw $0002 
    dw Spritemap_Holtz_6 
    dw $0003 
    dw Spritemap_Holtz_5 
    dw $0001 
    dw Spritemap_Holtz_4 
    dw $0001 
    dw Spritemap_Holtz_3 
    dw $0001 
    dw Spritemap_Holtz_2 
    dw Instruction_Holtz_SetAnimationFinishedFlag 
    dw Instruction_Common_Sleep 

InstList_Holtz_Flames:
    dw $0006 
    dw Spritemap_Holtz_F 
    dw $0004 
    dw Spritemap_Holtz_10 
    dw $0003 
    dw Spritemap_Holtz_11 
    dw Instruction_Common_GotoY 
    dw InstList_Holtz_Flames 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_HoltzConstants_A2C6C0:
    dw $0000,$0009,$000A,$000B,$000A 
endif ; !FEATURE_KEEP_UNREFERENCED

HoltzConstants_initialYVelocity:
    dw $0700 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_HoltzConstants_A2C6CC:
    dw $0700 
endif ; !FEATURE_KEEP_UNREFERENCED

HoltzConstants_XSpeed:
    dw $0100 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_HoltzConstants_A2C6D0:
    dw $0100 
endif ; !FEATURE_KEEP_UNREFERENCED

Instruction_Holtz_SetAnimationFinishedFlag:
    LDX.W $0E54 
    LDA.W #$0001 : STA.L $7E7802,X 
    RTL 


Instruction_Holtz_HideFlames:
    LDX.W $0E54 
    LDA.W #$0000 : STA.L $7E7804,X 
    RTL 


Instruction_Holtz_ShowFlames:
    LDX.W $0E54 
    LDA.W #$0001 : STA.L $7E7804,X 
    RTL 


InitAI_Holtz:
    LDX.W $0E54 
    LDA.W #$0000 : STA.L $7E7802,X 
    LDA.W $0FB4,X : BPL .idle 
    LDA.W #Function_Holtz_Flames : STA.W $0FB2,X 
    LDA.W #InstList_Holtz_Flames : STA.L $7E7800,X 
    STA.W $0F92,X 
    RTL 


.idle:
    LDA.W #Function_Holtz_Idle : STA.W $0FB2,X 
    LDA.W #InstList_Holtz_Idle_0 : STA.L $7E7800,X 
    STA.W $0F92,X 
    RTL 


MainAI_Holtz:
    JSL.L GenerateRandomNumber 
    LDX.W $0E54 
    JMP.W ($0FB2,X) 


Function_Holtz_Flames:
    LDA.W $0F4C,X : BNE .notDead 
    LDA.W $0F86,X : ORA.W #$0200 : STA.W $0F86,X 
    RTL 


.notDead:
    LDA.W $0F5E,X : STA.W $0F9E,X 
    BEQ .frozen 
    BRA .invisible 


.frozen:
    LDA.L $7E77C4,X : BNE .visible 

.invisible:
    LDA.W $0F86,X : ORA.W #$0100 : STA.W $0F86,X 
    RTL 


.visible:
    LDA.W $0F86,X : AND.W #$FEFF : STA.W $0F86,X 
    LDA.W $0F3A,X : STA.W $0F7A,X 
    LDA.W $0F3E,X : CLC : ADC.W #$000C : STA.W $0F7E,X 
    RTL 


Function_Holtz_Idle:
    LDA.W $05E5 : AND.W #$0101 
    BEQ .quarterChancestayIdle 
    LDA.W #$0070 
    JSL.L CheckIfXDistanceBetweenEnemyAndSamusIsAtLeastA 
    BCC .triggered 

.quarterChancestayIdle:
    LDA.W #$0000 : STA.L $7E7802,X 
    LDA.W #InstList_Holtz_Idle_0 
    JSR.W SetHoltzInstList 
    RTL 


.triggered:
    LDA.W HoltzConstants_initialYVelocity : STA.W $0FAC,X 
    LDA.W HoltzConstants_XSpeed : STA.W $0FAE,X 
    LDA.W $0AF6 
    CMP.W $0F7A,X 
    BPL + 
    LDA.W $0FAE,X 
    EOR.W #$FFFF 
    INC A 
    STA.W $0FAE,X 

  + LDA.W #InstList_Holtz_PrepareToSwoop 
    JSR.W SetHoltzInstList 
    LDA.W #Function_Holtz_PrepareToSwoop : STA.W $0FB2,X 
    RTL 


Function_Holtz_PrepareToSwoop:
    LDA.L $7E7802,X : BNE .animationFinished 
    RTL 


.animationFinished:
    LDA.W #$0000 : STA.L $7E7802,X 
    LDA.W #InstList_Holtz_Swoop_Descending 
    JSR.W SetHoltzInstList 
    LDA.W #Function_Holtz_Swoop_Descending : STA.W $0FB2,X 
    RTL 


Function_Holtz_Swoop_Descending:
    STZ.B $12 
    STZ.B $14 
    LDA.W $0FAE,X : BPL + 
    DEC.B $14 

  + STA.B $13 
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes 
    BCC .notCollidedWithWall 
    LDA.W $0FAE,X 
    EOR.W #$FFFF 
    INC A 
    STA.W $0FAE,X 

.notCollidedWithWall:
    STZ.B $12 
    STZ.B $14 
    LDA.W $0FAC,X : BPL + 
    DEC.B $14 

  + STA.B $13 
    JSL.L MoveEnemyDownBy_14_12 
    BCS .notCollidedWithBlock 
    LDA.W $0FAC,X : SEC : SBC.W #$0020 : STA.W $0FAC,X 
    BMI .notCollidedWithBlock 
    RTL 


.notCollidedWithBlock:
    LDA.W #$FFFF : STA.W $0FAC,X 
    LDA.W #InstList_Holtz_Swoop_Ascending_Part1 
    JSR.W SetHoltzInstList 
    LDA.W #Function_Holtz_Swoop_Ascending : STA.W $0FB2,X 
    LDA.W #$0064 
    JSL.L QueueSound_Lib2_Max6 
    RTL 


Function_Holtz_Swoop_Ascending:
    STZ.B $12 
    STZ.B $14 
    LDA.W $0FAE,X : BPL + 
    DEC.B $14 

  + STA.B $13 
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes 
    BCC .notCollidedWithWall 
    LDA.W $0FAE,X 
    EOR.W #$FFFF 
    INC A 
    STA.W $0FAE,X 

.notCollidedWithWall:
    STZ.B $12 
    STZ.B $14 
    LDA.W $0FAC,X : BPL + 
    DEC.B $14 

  + STA.B $13 
    JSL.L MoveEnemyDownBy_14_12 
    BCS .collidedVertically 
    LDA.W $0FAC,X : SEC : SBC.W #$0020 : STA.W $0FAC,X 
    LDA.L $7E7802,X : BEQ .return 
    LDA.W #$0000 : STA.L $7E7802,X 
    LDA.W #InstList_Holtz_Swoop_Part2_0 
    JSR.W SetHoltzInstList 

.return:
    RTL 


.collidedVertically:
    LDA.W #InstList_Holtz_SwoopCooldown 
    JSR.W SetHoltzInstList 
    LDA.W #Function_Holtz_SwoopCooldown : STA.W $0FB2,X 
    RTL 


Function_Holtz_SwoopCooldown:
    LDA.L $7E7802,X : BNE .animationFinished 
    RTL 


.animationFinished:
    LDA.W #$0000 : STA.L $7E7802,X 
    LDA.W #InstList_Holtz_SwoopCooldown 
    JSR.W SetHoltzInstList 
    LDA.W #Function_Holtz_Idle : STA.W $0FB2,X 
    RTL 


SetHoltzInstList:
    LDX.W $0E54 
    CMP.L $7E7800,X 
    BEQ .return 
    STA.L $7E7800,X 
    STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    STZ.W $0F90,X 

.return:
    RTS 


Spritemap_Holtz_0:
    dw $0004,$81F8 
    db $04 
    dw $2126,$8008 
    db $F4 
    dw $6100,$81F8 
    db $F4 
    dw $210A,$81E8 
    db $F4 
    dw $2100 

Spritemap_Holtz_1:
    dw $0004,$8008 
    db $F5 
    dw $6100,$81E8 
    db $F5 
    dw $2100,$81F8 
    db $F5 
    dw $210A,$81F8 
    db $05 
    dw $2128 

Spritemap_Holtz_2:
    dw $0004,$81F8 
    db $06 
    dw $2128,$8008 
    db $F6 
    dw $6100,$81F8 
    db $F6 
    dw $210A,$81E8 
    db $F6 
    dw $2100 

Spritemap_Holtz_3:
    dw $0004,$81F8 
    db $06 
    dw $2128,$81F8 
    db $F6 
    dw $210C,$8008 
    db $F6 
    dw $6100,$81E8 
    db $F6 
    dw $2100 

Spritemap_Holtz_4:
    dw $0004,$81F8 
    db $06 
    dw $2128,$81F8 
    db $F6 
    dw $210E,$8008 
    db $F6 
    dw $6100,$81E8 
    db $F6 
    dw $2100 

Spritemap_Holtz_5:
    dw $0004,$81F8 
    db $06 
    dw $2128,$81F8 
    db $F6 
    dw $2120,$8008 
    db $F6 
    dw $6100,$81E8 
    db $F6 
    dw $2100 

Spritemap_Holtz_6:
    dw $0004,$81F8 
    db $06 
    dw $2128,$8008 
    db $F6 
    dw $6102,$81E8 
    db $F6 
    dw $2102,$81F8 
    db $F6 
    dw $2120 

Spritemap_Holtz_7:
    dw $0004,$81F8 
    db $06 
    dw $2128,$8008 
    db $F6 
    dw $6104,$81E8 
    db $F6 
    dw $2104,$81F8 
    db $F6 
    dw $2120 

Spritemap_Holtz_8:
    dw $0004,$81F8 
    db $06 
    dw $2128,$8008 
    db $F6 
    dw $6106,$81E8 
    db $F6 
    dw $2106,$81F8 
    db $F6 
    dw $2120 

Spritemap_Holtz_9:
    dw $0004,$81F8 
    db $06 
    dw $2128,$8008 
    db $F6 
    dw $6108,$81E8 
    db $F6 
    dw $2108,$81F8 
    db $F6 
    dw $2120 

Spritemap_Holtz_A:
    dw $0004,$81F8 
    db $06 
    dw $2128,$8008 
    db $F6 
    dw $6108,$81E8 
    db $F6 
    dw $2108,$81F8 
    db $F6 
    dw $2124 

Spritemap_Holtz_B:
    dw $0004,$81F8 
    db $06 
    dw $2128,$8008 
    db $F6 
    dw $6108,$81E8 
    db $F6 
    dw $2108,$81F8 
    db $F6 
    dw $2122 

Spritemap_Holtz_C:
    dw $0004,$81F8 
    db $06 
    dw $2128,$8008 
    db $F6 
    dw $6108,$81E8 
    db $F6 
    dw $2108,$81F8 
    db $F6 
    dw $2122 

Spritemap_Holtz_D:
    dw $0004,$81F8 
    db $06 
    dw $2128,$8008 
    db $F6 
    dw $6108,$81E8 
    db $F6 
    dw $2108,$81F8 
    db $F6 
    dw $2122 

Spritemap_Holtz_E:
    dw $0004,$81F8 
    db $06 
    dw $2128,$8008 
    db $F6 
    dw $6108,$81E8 
    db $F6 
    dw $2108,$81F8 
    db $F6 
    dw $2122 

Spritemap_Holtz_F:
    dw $0002,$0004 
    db $FC 
    dw $612A,$01F4 
    db $FC 
    dw $212A 

Spritemap_Holtz_10:
    dw $0002,$0004 
    db $FC 
    dw $612B,$01F4 
    db $FC 
    dw $212B 

Spritemap_Holtz_11:
    dw $0002,$0004 
    db $FC 
    dw $612C,$01F4 
    db $FC 
    dw $212C 

Palette_Oum:
    dw $3800,$3F57,$2E4D,$00E2,$0060,$3AB0,$220B,$1166 
    dw $0924,$21B9,$1533,$0CCE,$0448,$03E0,$02A0,$0140 

InstList_Oum_FacingLeft_Idle:
    dw $0001 
    dw ExtendedSpritemap_Oum_FacingLeft_0 
    dw Instruction_Common_Sleep 

InstList_Oum_FacingLeft_Attacking:
    dw $0010 
    dw ExtendedSpritemap_Oum_FacingLeft_0 
    dw $0010 
    dw ExtendedSpritemap_Oum_FacingLeft_1 
    dw Instruction_Oum_PlaySplashedOutOfWaterSFX 
    dw $0010 
    dw ExtendedSpritemap_Oum_FacingLeft_2 
    dw $0002 
    dw ExtendedSpritemap_Oum_FacingLeft_3 
    dw $0003 
    dw ExtendedSpritemap_Oum_FacingLeft_4 
    dw $0004 
    dw ExtendedSpritemap_Oum_FacingLeft_5 
    dw $0002 
    dw ExtendedSpritemap_Oum_FacingLeft_6 
    dw $0003 
    dw ExtendedSpritemap_Oum_FacingLeft_7 
    dw $0001 
    dw ExtendedSpritemap_Oum_FacingLeft_6 
    dw $0003 
    dw ExtendedSpritemap_Oum_FacingLeft_5 
    dw $0002 
    dw ExtendedSpritemap_Oum_FacingLeft_4 
    dw $0001 
    dw ExtendedSpritemap_Oum_FacingLeft_3 
    dw $0012 
    dw ExtendedSpritemap_Oum_FacingLeft_2 
    dw Instruction_Oum_SetAnimationFinishedFlag 
    dw Instruction_CommonA2_Sleep 

InstList_Oum_FacingLeft_RollingForwards:
    dw $0007 
    dw ExtendedSpritemap_Oum_FacingLeft_2 
    dw Instruction_Oum_SetAttackAllowingRotationFlag 
    dw $0007 
    dw ExtendedSpritemap_Oum_FacingLeft_8 
    dw Instruction_Oum_ResetAttackAllowingRotationFlag 
    dw $0007 
    dw ExtendedSpritemap_Oum_FacingLeft_9 
    dw $0007 
    dw ExtendedSpritemap_Oum_FacingLeft_A 
    dw $0007 
    dw ExtendedSpritemap_Oum_FacingLeft_B 
    dw $0007 
    dw ExtendedSpritemap_Oum_FacingLeft_C 
    dw $0007 
    dw ExtendedSpritemap_Oum_FacingLeft_D 
    dw $0007 
    dw ExtendedSpritemap_Oum_FacingLeft_E 
    dw Instruction_Common_GotoY 
    dw InstList_Oum_FacingLeft_RollingForwards 

InstList_Oum_FacingLeft_RollingBackwards:
    dw $0007 
    dw ExtendedSpritemap_Oum_FacingLeft_E 
    dw $0007 
    dw ExtendedSpritemap_Oum_FacingLeft_D 
    dw $0007 
    dw ExtendedSpritemap_Oum_FacingLeft_C 
    dw $0007 
    dw ExtendedSpritemap_Oum_FacingLeft_B 
    dw $0007 
    dw ExtendedSpritemap_Oum_FacingLeft_A 
    dw $0007 
    dw ExtendedSpritemap_Oum_FacingLeft_9 
    dw $0007 
    dw ExtendedSpritemap_Oum_FacingLeft_8 
    dw Instruction_Oum_SetAttackAllowingRotationFlag 
    dw $0007 
    dw ExtendedSpritemap_Oum_FacingLeft_2 
    dw Instruction_Oum_ResetAttackAllowingRotationFlag 
    dw Instruction_Common_GotoY 
    dw InstList_Oum_FacingLeft_RollingBackwards 

InstList_Oum_FacingRight_Idle:
    dw $0001 
    dw ExtendedSpritemap_Oum_FacingRight_0 
    dw Instruction_Common_Sleep 

InstList_Oum_FacingRight_Attacking:
    dw $0010 
    dw ExtendedSpritemap_Oum_FacingRight_0 
    dw $0010 
    dw ExtendedSpritemap_Oum_FacingRight_1 
    dw $0010 
    dw ExtendedSpritemap_Oum_FacingRight_2 
    dw Instruction_Oum_PlaySplashedOutOfWaterSFX 
    dw $0002 
    dw ExtendedSpritemap_Oum_FacingRight_3 
    dw $0003 
    dw ExtendedSpritemap_Oum_FacingRight_4 
    dw $0004 
    dw ExtendedSpritemap_Oum_FacingRight_5 
    dw $0002 
    dw ExtendedSpritemap_Oum_FacingRight_6 
    dw $0003 
    dw ExtendedSpritemap_Oum_FacingRight_7 
    dw $0001 
    dw ExtendedSpritemap_Oum_FacingRight_6 
    dw $0003 
    dw ExtendedSpritemap_Oum_FacingRight_5 
    dw $0002 
    dw ExtendedSpritemap_Oum_FacingRight_4 
    dw $0001 
    dw ExtendedSpritemap_Oum_FacingRight_3 
    dw $0012 
    dw ExtendedSpritemap_Oum_FacingRight_2 
    dw Instruction_Oum_SetAnimationFinishedFlag 
    dw Instruction_CommonA2_Sleep 

InstList_Oum_FacingRight_RollingForwards:
    dw $0007 
    dw ExtendedSpritemap_Oum_FacingRight_2 
    dw Instruction_Oum_SetAttackAllowingRotationFlag 
    dw $0007 
    dw ExtendedSpritemap_Oum_FacingRight_8 
    dw Instruction_Oum_ResetAttackAllowingRotationFlag 
    dw $0007 
    dw ExtendedSpritemap_Oum_FacingRight_9 
    dw $0007 
    dw ExtendedSpritemap_Oum_FacingRight_A 
    dw $0007 
    dw ExtendedSpritemap_Oum_FacingRight_B 
    dw $0007 
    dw ExtendedSpritemap_Oum_FacingRight_C 
    dw $0007 
    dw ExtendedSpritemap_Oum_FacingRight_D 
    dw $0007 
    dw ExtendedSpritemap_Oum_FacingRight_E 
    dw Instruction_Common_GotoY 
    dw InstList_Oum_FacingRight_RollingForwards 

InstList_Oum_FacingRight_RollingBackwards:
    dw $0007 
    dw ExtendedSpritemap_Oum_FacingRight_E 
    dw $0007 
    dw ExtendedSpritemap_Oum_FacingRight_D 
    dw $0007 
    dw ExtendedSpritemap_Oum_FacingRight_C 
    dw $0007 
    dw ExtendedSpritemap_Oum_FacingRight_B 
    dw $0007 
    dw ExtendedSpritemap_Oum_FacingRight_A 
    dw $0007 
    dw ExtendedSpritemap_Oum_FacingRight_9 
    dw $0007 
    dw ExtendedSpritemap_Oum_FacingRight_8 
    dw Instruction_Oum_SetAttackAllowingRotationFlag 
    dw $0007 
    dw ExtendedSpritemap_Oum_FacingRight_2 
    dw Instruction_Oum_ResetAttackAllowingRotationFlag 
    dw Instruction_Common_GotoY 
    dw InstList_Oum_FacingRight_RollingBackwards 

Instruction_Oum_PlaySplashedOutOfWaterSFX:
    PHX 
    PHY 
    LDA.W #$000E 
    JSL.L QueueSound_Lib2_Max6 
    PLY 
    PLX 
    RTL 


InstListPointers_Oum:
    dw InstList_Oum_FacingRight_Idle 
    dw InstList_Oum_FacingLeft_Idle 
    dw InstList_Oum_FacingRight_RollingForwards 
    dw InstList_Oum_FacingLeft_RollingForwards 
    dw InstList_Oum_FacingRight_Attacking 
    dw InstList_Oum_FacingLeft_Attacking 
    dw InstList_Oum_FacingRight_RollingBackwards 
    dw InstList_Oum_FacingLeft_RollingBackwards 

ExtendedSpritemap_Oum_FacingLeft_0:
    dw $0001,$0000,$0000 
    dw Spritemap_Oum_FacingLeft_0 
    dw Hitbox_Oum_FacingLeft_0 

ExtendedSpritemap_Oum_FacingLeft_1:
    dw $0001,$0000,$0000 
    dw Spritemap_Oum_FacingLeft_1 
    dw Hitbox_Oum_FacingLeft_1 

ExtendedSpritemap_Oum_FacingLeft_2:
    dw $0001,$0000,$0000 
    dw Spritemap_Oum_FacingLeft_2 
    dw Hitbox_Oum_FacingLeft_2 

ExtendedSpritemap_Oum_FacingLeft_3:
    dw $0001,$0000,$0000 
    dw Spritemap_Oum_3 
    dw Hitbox_Oum_FacingLeft_3 

ExtendedSpritemap_Oum_FacingLeft_4:
    dw $0001,$0000,$0000 
    dw Spritemap_Oum_FacingLeft_4 
    dw Hitbox_Oum_FacingLeft_4 

ExtendedSpritemap_Oum_FacingLeft_5:
    dw $0001,$0000,$0000 
    dw Spritemap_Oum_FacingLeft_5 
    dw Hitbox_Oum_FacingLeft_5 

ExtendedSpritemap_Oum_FacingLeft_6:
    dw $0001,$0000,$0000 
    dw Spritemap_Oum_FacingLeft_6 
    dw Hitbox_Oum_FacingLeft_6 

ExtendedSpritemap_Oum_FacingLeft_7:
    dw $0001,$0000,$0000 
    dw Spritemap_Oum_FacingLeft_7 
    dw Hitbox_Oum_FacingLeft_7 

ExtendedSpritemap_Oum_FacingLeft_8:
    dw $0001,$0000,$0000 
    dw Spritemap_Oum_FacingLeft_8 
    dw Hitbox_Oum_FacingLeft_8 

ExtendedSpritemap_Oum_FacingLeft_9:
    dw $0001,$0000,$0000 
    dw Spritemap_Oum_FacingLeft_9 
    dw Hitbox_Oum_FacingLeft_9 

ExtendedSpritemap_Oum_FacingLeft_A:
    dw $0001,$0000,$0000 
    dw Spritemap_Oum_FacingLeft_A 
    dw Hitbox_Oum_FacingLeft_A 

ExtendedSpritemap_Oum_FacingLeft_B:
    dw $0001,$0000,$0000 
    dw Spritemap_Oum_FacingLeft_B 
    dw Hitbox_Oum_FacingLeft_B 

ExtendedSpritemap_Oum_FacingLeft_C:
    dw $0001,$0000,$0000 
    dw Spritemap_Oum_FacingLeft_C 
    dw Hitbox_Oum_FacingLeft_C 

ExtendedSpritemap_Oum_FacingLeft_D:
    dw $0001,$0000,$0000 
    dw Spritemap_Oum_FacingLeft_D 
    dw Hitbox_Oum_FacingLeft_D 

ExtendedSpritemap_Oum_FacingLeft_E:
    dw $0001,$0000,$0000 
    dw Spritemap_Oum_FacingLeft_E 
    dw Hitbox_Oum_FacingLeft_E 

ExtendedSpritemap_Oum_FacingRight_0:
    dw $0001,$0000,$0000 
    dw Spritemap_Oum_FacingRight_0 
    dw Hitbox_Oum_FacingRight_0 

ExtendedSpritemap_Oum_FacingRight_1:
    dw $0001,$0000,$0000 
    dw Spritemap_Oum_FacingRight_1 
    dw Hitbox_Oum_FacingRight_1 

ExtendedSpritemap_Oum_FacingRight_2:
    dw $0001,$0000,$0000 
    dw Spritemap_Oum_FacingRight_2 
    dw Hitbox_Oum_FacingRight_2 

ExtendedSpritemap_Oum_FacingRight_3:
    dw $0001,$0000,$0000 
    dw Spritemap_Oum_FacingRight_3 
    dw Hitbox_Oum_FacingRight_3 

ExtendedSpritemap_Oum_FacingRight_4:
    dw $0001,$0000,$0000 
    dw Spritemap_Oum_FacingRight_4 
    dw Hitbox_Oum_FacingRight_4 

ExtendedSpritemap_Oum_FacingRight_5:
    dw $0001,$0000,$0000 
    dw Spritemap_Oum_FacingRight_5 
    dw Hitbox_Oum_FacingRight_5 

ExtendedSpritemap_Oum_FacingRight_6:
    dw $0001,$0000,$0000 
    dw Spritemap_Oum_FacingRight_6 
    dw Hitbox_Oum_FacingRight_6 

ExtendedSpritemap_Oum_FacingRight_7:
    dw $0001,$0000,$0000 
    dw Spritemap_Oum_FacingRight_7 
    dw Hitbox_Oum_FacingRight_7 

ExtendedSpritemap_Oum_FacingRight_8:
    dw $0001,$0000,$0000 
    dw Spritemap_Oum_FacingRight_8 
    dw Hitbox_Oum_FacingRight_8 

ExtendedSpritemap_Oum_FacingRight_9:
    dw $0001,$0000,$0000 
    dw Spritemap_Oum_FacingRight_9 
    dw Hitbox_Oum_FacingRight_9 

ExtendedSpritemap_Oum_FacingRight_A:
    dw $0001,$0000,$0000 
    dw Spritemap_Oum_FacingRight_A 
    dw Hitbox_Oum_FacingRight_A 

ExtendedSpritemap_Oum_FacingRight_B:
    dw $0001,$0000,$0000 
    dw Spritemap_Oum_FacingRight_B 
    dw Hitbox_Oum_FacingRight_B 

ExtendedSpritemap_Oum_FacingRight_C:
    dw $0001,$0000,$0000 
    dw Spritemap_Oum_FacingRight_C 
    dw Hitbox_Oum_FacingRight_C 

ExtendedSpritemap_Oum_FacingRight_D:
    dw $0001,$0000,$0000 
    dw Spritemap_Oum_FacingRight_D 
    dw Hitbox_Oum_FacingRight_D 

ExtendedSpritemap_Oum_FacingRight_E:
    dw $0001,$0000,$0000 
    dw Spritemap_Oum_FacingRight_E 
    dw Hitbox_Oum_FacingRight_E 

Instruction_Oum_SetAnimationFinishedFlag:
    LDX.W $0E54 
    LDA.W #$0001 : STA.L $7E7804,X 
    RTL 


Instruction_Oum_SetAttackAllowingRotationFlag:
    LDX.W $0E54 
    LDA.W #$0001 : STA.L $7E7806,X 
    RTL 


Instruction_Oum_ResetAttackAllowingRotationFlag:
    LDX.W $0E54 
    LDA.W #$0000 : STA.L $7E7806,X 
    RTL 


InitAI_Oum:
    LDX.W $0E54 
    LDA.W #$0000 : STA.W $0FAA,X 
    STA.W $0FAE,X 
    STA.L $7E7800,X 
    STA.L $7E7802,X 
    STA.L $7E7804,X 
    STA.L $7E7806,X 
    STA.L $7E7814,X 
    LDA.W #$0003 : STA.W $0FB0,X 
    LDA.W #$0080 : STA.W $0FAC,X 
    LDA.W #InstList_Oum_FacingLeft_Idle : STA.W $0F92,X 
    LDA.W #Function_Oum_Idle : STA.W $0FA8,X 
    LDA.W #Function_Oum_Falling : STA.W $0FB2,X 
    RTL 


MainAI_Oum:
    LDX.W $0E54 
    JSR.W CheckIfTouchingSamus_UpdatePreviousPositions 
    JSR.W ($0FA8,X) 
    JSR.W HandlePushingSamus 
    JSR.W StopIfSamusIsPressingTowardsOum 
    RTL 


CheckIfTouchingSamus_UpdatePreviousPositions:
    JSR.W CheckIfTouchingSamus 
    LDA.W $0F7A,X : STA.L $7E780C,X 
    LDA.W $0F7E,X : STA.L $7E7810,X 
    RTS 


HandlePushingSamus:
    LDA.W #$0000 : STA.L $7E7816,X 
    JSL.L CheckIfEnemyIsTouchingSamusFromBelow 
    BEQ .notTouchingSamusFromBelow 
    LDA.W $0F7E,X : SEC : SBC.L $7E7810,X : STA.W $0B5C 

.notTouchingSamusFromBelow:
    LDA.L $7E7808,X : BEQ .return 
    LDA.W $0F7A,X : SEC : SBC.L $7E780C,X : STA.B $12 
    BMI .movedLeft 
    LDA.L $7E780A,X : BNE .return 
    BRA + 


.movedLeft:
    LDA.L $7E780A,X : BEQ .return 

  + LDA.W $0B58 : CLC : ADC.B $12 : STA.W $0B58 

.return:
    RTS 


StopIfSamusIsPressingTowardsOum:
    LDA.L $7E7808,X : BEQ .return 
    LDA.W $0F7A,X : SEC : SBC.L $7E780C,X : BEQ .stationary 
    BMI .checkPressingRight 
    LDA.B $8B : AND.W #$0200 
    BEQ .return 
    LDA.W #$0001 : STA.L $7E7816,X 
    LDA.L $7E780C,X : STA.W $0F7A,X 
    BRA .return 


.checkPressingRight:
    LDA.B $8B : AND.W #$0100 
    BEQ .return 
    LDA.W #$0001 : STA.L $7E7816,X 
    LDA.L $7E780C,X : STA.W $0F7A,X 
    BRA .return 


.stationary:
    LDA.L $7E780A,X : BEQ .SamusIsToTheRight 
    LDA.W $0FAE,X : BEQ .return 
    LDA.B $8B : AND.W #$0100 
    BEQ .return 
    BRA + 


.SamusIsToTheRight:
    LDA.W $0FAE,X : BNE .return 
    LDA.B $8B : AND.W #$0200 
    BEQ .return 

  + LDA.W #$0001 : STA.L $7E7816,X 
    LDA.L $7E780C,X : STA.W $0F7A,X 

.return:
    RTS 


Function_Oum_Idle:
    LDX.W $0E54 
    LDA.W $0FB0,X : BEQ .noBounce 
    JSR.W ($0FB2,X) 
    BRA .return 


.noBounce:
    LDA.W #$0000 : STA.L $7E7800,X 
    JSL.L Get_SamusX_minus_EnemyX 
    BPL .SamusToTheLeft 
    LDA.W #$0001 : STA.W $0FAE,X 
    STA.L $7E7800,X 

.SamusToTheLeft:
    JSR.W SetOumInstList 
    LDA.W #$0018 
    JSL.L IsSamusWithinAPixelColumnsOfEnemy 
    BEQ .return 
    LDA.L $7E7800,X : ORA.W #$0002 : STA.L $7E7800,X 
    JSR.W SetOumInstList 
    LDA.W #Function_Oum_Rolling : STA.W $0FA8,X 

.return:
    RTS 


Function_Oum_Rolling:
    LDX.W $0E54 
    LDA.W $0FB0,X : BEQ .noBounce 
    JSR.W ($0FB2,X) 
    BRA .collidedWithBlock 


.noBounce:
    STZ.B $12 
    LDA.W #$0001 : STA.B $14 
    JSL.L MoveEnemyDownBy_14_12 
    BCS .collidedWithBlock 
    STZ.W $0FAA,X 
    LDA.W #Function_Oum_Falling : STA.W $0FB2,X 
    LDA.W #$0003 : STA.W $0FB0,X 

.collidedWithBlock:
    LDA.L $7E7816,X : BEQ .notStopped 
    JMP.W .return 


.notStopped:
    STZ.B $24 
    DEC.W $0FAC,X 
    BPL .noAttack 
    STZ.W $0FAC,X 
    LDA.W #$0020 
    JSL.L IsSamusWithinAPixelColumnsOfEnemy 
    BEQ .noAttack 
    LDA.L $7E7806,X : BEQ .noAttack 
    LDA.W $0FB0,X : BNE .noAttack 
    LDA.W #$0000 : STA.L $7E7800,X 
    STA.W $0FAE,X 
    JSL.L Get_SamusX_minus_EnemyX 
    BPL .SamusToTheRight 
    LDA.W #$0001 : STA.L $7E7800,X 
    STA.W $0FAE,X 

.SamusToTheRight:
    LDA.W #$0080 : STA.W $0FAC,X 
    LDA.L $7E7800,X : AND.W #$0001 
    ORA.W #$0004 
    STA.L $7E7800,X 
    JSR.W SetOumInstList 
    LDA.W #Function_Oum_Attacking : STA.W $0FA8,X 
    JMP.W .return 


.noAttack:
    LDA.W #$0080 
    TAY 
    LDA.W $0FAE,X : BEQ .notLeft 
    INY #4
    .notLeft:
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+2,Y : STA.B $12 
    LDA.W CommonEnemySpeeds_LinearlyIncreasing,Y : STA.B $14 
    LDA.L $7E7808,X : BEQ .noAdjustForSamus 
    LDA.W $0FAE,X 
    CMP.L $7E780A,X 
    BNE .noAdjustForSamus 
    LDA.W $0FAE,X : BEQ .right 
    LDA.B $14 : SEC : SBC.W #$0010 : STA.B $14 
    BRA .noAdjustForSamus 


.right:
    LDA.B $14 : CLC : ADC.W #$0010 : STA.B $14 

.noAdjustForSamus:
    JSL.L MoveEnemyRightBy_14_12_TreatSlopesAsWalls 
    BCC .notCollidedWithWall 
    INC.B $24 

.notCollidedWithWall:
    LDA.L $7E7808,X : BEQ .noUnadjustForSamus 
    LDA.W $0FAE,X 
    CMP.L $7E780A,X 
    BNE .noUnadjustForSamus 
    LDA.W $0FAE,X : BEQ .movingRight 
    LDA.W $0F7A,X : CLC : ADC.W #$0010 : STA.W $0F7A,X 
    BRA .noUnadjustForSamus 


.movingRight:
    LDA.W $0F7A,X : SEC : SBC.W #$0010 : STA.W $0F7A,X 

.noUnadjustForSamus:
    LDA.B $24 : BEQ .return 
    LDA.W $0FAE,X : EOR.W #$0001 : STA.W $0FAE,X 
    LDA.L $7E7800,X : EOR.W #$0004 : STA.L $7E7800,X 
    JSR.W SetOumInstList 

.return:
    RTS 


Function_Oum_Attacking:
    LDX.W $0E54 
    LDA.L $7E7804,X : BEQ .return 
    LDA.W #$0000 : STA.L $7E7804,X 
    LDA.L $7E7800,X : SEC : SBC.W #$0002 : STA.L $7E7800,X 
    JSR.W SetOumInstList 
    LDA.W #Function_Oum_Rolling : STA.W $0FA8,X 

.return:
    RTS 


Function_Oum_Falling:
    LDA.W $0FAA,X : CLC : ADC.W #$0180 : CMP.W #$4000 
    BMI + 
    LDA.W #$4000 

  + STA.W $0FAA,X 
    AND.W #$FF00 
    XBA 
    ASL #3
    TAY 
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing,Y : STA.B $12 
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing+2,Y : STA.B $14 
    JSL.L MoveEnemyDownBy_14_12 
    BCC .return 
    DEC.W $0FB0,X 
    LDA.W $0FAA,X : SEC : SBC.W #$1000 : BPL .notNegative 
    STZ.W $0FB0,X 

.notNegative:
    STA.W $0FAA,X 
    LDA.W #Function_Oum_Rising : STA.W $0FB2,X 

.return:
    RTS 


Function_Oum_Rising:
    LDA.W $0FAA,X : SEC : SBC.W #$0180 : STA.W $0FAA,X 
    BPL .notNegative 
    STZ.W $0FAA,X 
    LDA.W #Function_Oum_Falling : STA.W $0FB2,X 
    BRA .return 


.notNegative:
    AND.W #$FF00 
    XBA 
    ASL #3
    TAY 
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing+4,Y : STA.B $12 
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing+6,Y : STA.B $14 
    JSL.L MoveEnemyDownBy_14_12 

.return:
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_PlayKetchupBeamSFX_A2CFD7:
    LDA.W #$0063 
    JSL.L QueueSound_Lib2_Max6 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


SetOumInstList:
    LDA.L $7E7800,X 
    CMP.L $7E7802,X 
    BEQ .return 
    STA.L $7E7802,X 
    ASL A 
    TAY 
    LDA.W InstListPointers_Oum,Y : STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    STZ.W $0F90,X 

.return:
    RTS 


CheckIfTouchingSamus:
    LDX.W $0E54 
    LDA.W #$0000 : STA.L $7E7808,X 
    STA.L $7E780A,X 
    LDA.W #$0020 
    JSL.L IsSamusWithingAPixelRowsOfEnemy 
    BEQ .return 
    LDA.W #$0018 
    JSL.L IsSamusWithinAPixelColumnsOfEnemy 
    BEQ .return 
    LDA.W #$0001 : STA.L $7E7808,X 
    JSL.L Get_SamusX_minus_EnemyX 
    BPL .return 
    LDA.W #$0001 : STA.L $7E780A,X 

.return:
    RTS 


Hitbox_Oum_FacingLeft_0:
    dw $0002,$FFF0,$FFEF,$FFF8,$0010 
    dw EnemyTouch_Oum_DoesNotHurtSamus 
    dw EnemyShot_Oum 
    dw $FFF8,$FFEF,$000E,$0010 
    dw EnemyTouch_Oum_DoesNotHurtSamus 
    dw RTL_A2804C 

Hitbox_Oum_FacingLeft_1:
    dw $0001,$FFF0,$FFEF,$000E,$0010 
    dw EnemyTouch_Oum_DoesNotHurtSamus 
    dw RTL_A2804C 

Hitbox_Oum_FacingLeft_2:
    dw $0002,$FFFF,$FFEF,$000E,$0010 
    dw EnemyTouch_Oum_DoesNotHurtSamus 
    dw RTL_A2804C 
    dw $FFEF,$FFEF,$0000,$0010 
    dw EnemyTouch_Oum_DoesNotHurtSamus 
    dw EnemyShot_Oum 

Hitbox_Oum_FacingLeft_3:
    dw $0002,$FFEC,$FFF8,$0000,$0008 
    dw EnemyTouch_Oum_HurtsSamus 
    dw EnemyShot_Oum 
    dw $0000,$FFEF,$000D,$0010 
    dw EnemyTouch_Oum_HurtsSamus 
    dw RTL_A2804C 

Hitbox_Oum_FacingLeft_4:
    dw $0002,$FFEA,$FFF8,$0000,$0007 
    dw EnemyTouch_Oum_HurtsSamus 
    dw EnemyShot_Oum 
    dw $0000,$FFEF,$000E,$0010 
    dw EnemyTouch_Oum_HurtsSamus 
    dw RTL_A2804C 

Hitbox_Oum_FacingLeft_5:
    dw $0002,$FFE7,$FFF7,$0000,$0008 
    dw EnemyTouch_Oum_HurtsSamus 
    dw EnemyShot_Oum 
    dw $0000,$FFEE,$000E,$0010 
    dw EnemyTouch_Oum_HurtsSamus 
    dw RTL_A2804C 

Hitbox_Oum_FacingLeft_6:
    dw $0002,$FFE8,$FFF8,$0000,$0009 
    dw EnemyTouch_Oum_HurtsSamus 
    dw EnemyShot_Oum 
    dw $0000,$FFEE,$000F,$0010 
    dw EnemyTouch_Oum_HurtsSamus 
    dw RTL_A2804C 

Hitbox_Oum_FacingLeft_7:
    dw $0002,$FFE5,$FFF8,$0000,$0008 
    dw EnemyTouch_Oum_HurtsSamus 
    dw EnemyShot_Oum 
    dw $0000,$FFEE,$000F,$0010 
    dw EnemyTouch_Oum_HurtsSamus 
    dw RTL_A2804C 

Hitbox_Oum_FacingLeft_8:
    dw $0003,$FFF0,$0000,$0000,$0010 
    dw EnemyTouch_Oum_DoesNotHurtSamus 
    dw EnemyShot_Oum 
    dw $FFF0,$FFF0,$0000,$0000 
    dw EnemyTouch_Oum_DoesNotHurtSamus 
    dw RTL_A2804C 
    dw $0000,$FFF0,$000E,$0010 
    dw EnemyTouch_Oum_DoesNotHurtSamus 
    dw RTL_A2804C 

Hitbox_Oum_FacingLeft_9:
    dw $0002,$FFF1,$FFEF,$000F,$0000 
    dw EnemyTouch_Oum_DoesNotHurtSamus 
    dw RTL_A2804C 
    dw $FFF1,$0000,$000F,$0010 
    dw EnemyTouch_Oum_DoesNotHurtSamus 
    dw EnemyShot_Oum 

Hitbox_Oum_FacingLeft_A:
    dw $0003,$FFF1,$FFEF,$0000,$0010 
    dw EnemyTouch_Oum_DoesNotHurtSamus 
    dw RTL_A2804C 
    dw $0000,$FFEF,$000F,$0000 
    dw EnemyTouch_Oum_DoesNotHurtSamus 
    dw RTL_A2804C 
    dw $0000,$0000,$000F,$0010 
    dw EnemyTouch_Oum_DoesNotHurtSamus 
    dw EnemyShot_Oum 

Hitbox_Oum_FacingLeft_B:
    dw $0002,$FFF0,$FFEF,$0000,$0010 
    dw EnemyTouch_Oum_DoesNotHurtSamus 
    dw RTL_A2804C 
    dw $0000,$FFEF,$000F,$0010 
    dw EnemyTouch_Oum_DoesNotHurtSamus 
    dw EnemyShot_Oum 

Hitbox_Oum_FacingLeft_C:
    dw $0003,$FFF1,$FFEF,$0000,$0010 
    dw EnemyTouch_Oum_DoesNotHurtSamus 
    dw RTL_A2804C 
    dw $0000,$FFEF,$000F,$0000 
    dw EnemyTouch_Oum_DoesNotHurtSamus 
    dw EnemyShot_Oum 
    dw $0000,$0000,$000F,$0010 
    dw EnemyTouch_Oum_DoesNotHurtSamus 
    dw RTL_A2804C 

Hitbox_Oum_FacingLeft_D:
    dw $0002,$FFF0,$FFEE,$000F,$0000 
    dw EnemyTouch_Oum_DoesNotHurtSamus 
    dw EnemyShot_Oum 
    dw $FFF0,$0000,$000F,$0010 
    dw EnemyTouch_Oum_DoesNotHurtSamus 
    dw RTL_A2804C 

Hitbox_Oum_FacingLeft_E:
    dw $0003,$FFF0,$0000,$0000,$0010 
    dw EnemyTouch_Oum_DoesNotHurtSamus 
    dw RTL_A2804C 
    dw $FFF0,$FFEF,$0000,$0000 
    dw EnemyTouch_Oum_DoesNotHurtSamus 
    dw EnemyShot_Oum 
    dw $0000,$FFEF,$000E,$0010 
    dw EnemyTouch_Oum_DoesNotHurtSamus 
    dw RTL_A2804C 

Hitbox_Oum_FacingRight_0:
    dw $0002,$FFF0,$FFEF,$0008,$0010 
    dw EnemyTouch_Oum_DoesNotHurtSamus 
    dw RTL_A2804C 
    dw $0008,$FFEF,$0010,$0010 
    dw EnemyTouch_Oum_DoesNotHurtSamus 
    dw EnemyShot_Oum 

Hitbox_Oum_FacingRight_1:
    dw $0001,$FFF0,$FFEF,$0010,$0010 
    dw EnemyTouch_Oum_DoesNotHurtSamus 
    dw RTL_A2804C 

Hitbox_Oum_FacingRight_2:
    dw $0002,$FFF0,$FFEF,$0000,$0010 
    dw EnemyTouch_Oum_DoesNotHurtSamus 
    dw RTL_A2804C 
    dw $0000,$FFEF,$0010,$0010 
    dw EnemyTouch_Oum_DoesNotHurtSamus 
    dw EnemyShot_Oum 

Hitbox_Oum_FacingRight_3:
    dw $0002,$FFF0,$FFEF,$0000,$0010 
    dw EnemyTouch_Oum_HurtsSamus 
    dw RTL_A2804C 
    dw $0000,$FFF8,$0014,$0008 
    dw EnemyTouch_Oum_HurtsSamus 
    dw EnemyShot_Oum 

Hitbox_Oum_FacingRight_4:
    dw $0002,$FFF0,$FFEF,$FFFF,$0010 
    dw EnemyTouch_Oum_HurtsSamus 
    dw RTL_A2804C 
    dw $0000,$FFF8,$0016,$0008 
    dw EnemyTouch_Oum_HurtsSamus 
    dw EnemyShot_Oum 

Hitbox_Oum_FacingRight_5:
    dw $0002,$FFF0,$FFEE,$0000,$0010 
    dw EnemyTouch_Oum_HurtsSamus 
    dw RTL_A2804C 
    dw $0000,$FFF8,$0018,$0008 
    dw EnemyTouch_Oum_HurtsSamus 
    dw EnemyShot_Oum 

Hitbox_Oum_FacingRight_6:
    dw $0002,$FFF1,$FFEF,$0000,$0010 
    dw EnemyTouch_Oum_HurtsSamus 
    dw RTL_A2804C 
    dw $0000,$FFF8,$0018,$0008 
    dw EnemyTouch_Oum_HurtsSamus 
    dw EnemyShot_Oum 

Hitbox_Oum_FacingRight_7:
    dw $0002,$FFF0,$FFEF,$0000,$0010 
    dw EnemyTouch_Oum_HurtsSamus 
    dw RTL_A2804C 
    dw $0000,$FFF8,$0019,$0008 
    dw EnemyTouch_Oum_HurtsSamus 
    dw EnemyShot_Oum 

Hitbox_Oum_FacingRight_8:
    dw $0003,$FFF1,$FFF0,$0000,$0010 
    dw EnemyTouch_Oum_DoesNotHurtSamus 
    dw RTL_A2804C 
    dw $0000,$FFF0,$0010,$0000 
    dw EnemyTouch_Oum_DoesNotHurtSamus 
    dw RTL_A2804C 
    dw $0000,$0000,$0010,$0010 
    dw EnemyTouch_Oum_DoesNotHurtSamus 
    dw EnemyShot_Oum 

Hitbox_Oum_FacingRight_9:
    dw $0002,$FFF1,$FFEF,$000F,$0000 
    dw EnemyTouch_Oum_DoesNotHurtSamus 
    dw RTL_A2804C 
    dw $FFF1,$0000,$000F,$0010 
    dw EnemyTouch_Oum_DoesNotHurtSamus 
    dw EnemyShot_Oum 

Hitbox_Oum_FacingRight_A:
    dw $0003,$FFF0,$0000,$0000,$0011 
    dw EnemyTouch_Oum_DoesNotHurtSamus 
    dw EnemyShot_Oum 
    dw $FFF0,$FFEF,$0000,$0000 
    dw EnemyTouch_Oum_DoesNotHurtSamus 
    dw RTL_A2804C 
    dw $0000,$FFEF,$000E,$0011 
    dw EnemyTouch_Oum_DoesNotHurtSamus 
    dw RTL_A2804C 

Hitbox_Oum_FacingRight_B:
    dw $0002,$FFF0,$FFEF,$0000,$0010 
    dw EnemyTouch_Oum_DoesNotHurtSamus 
    dw EnemyShot_Oum 
    dw $0000,$FFEF,$000E,$0010 
    dw EnemyTouch_Oum_DoesNotHurtSamus 
    dw RTL_A2804C 

Hitbox_Oum_FacingRight_C:
    dw $0003,$FFF0,$FFEF,$0000,$0000 
    dw EnemyTouch_Oum_DoesNotHurtSamus 
    dw EnemyShot_Oum 
    dw $FFF0,$0000,$0000,$0010 
    dw EnemyTouch_Oum_DoesNotHurtSamus 
    dw RTL_A2804C 
    dw $0000,$FFEF,$000E,$0010 
    dw EnemyTouch_Oum_DoesNotHurtSamus 
    dw RTL_A2804C 

Hitbox_Oum_FacingRight_D:
    dw $0002,$FFF0,$FFEF,$000F,$0000 
    dw EnemyTouch_Oum_DoesNotHurtSamus 
    dw EnemyShot_Oum 
    dw $FFF0,$0000,$000F,$0010 
    dw EnemyTouch_Oum_DoesNotHurtSamus 
    dw RTL_A2804C 

Hitbox_Oum_FacingRight_E:
    dw $0003,$FFF1,$FFEF,$0000,$0010 
    dw EnemyTouch_Oum_DoesNotHurtSamus 
    dw RTL_A2804C 
    dw $0000,$FFEF,$0010,$0000 
    dw EnemyTouch_Oum_DoesNotHurtSamus 
    dw EnemyShot_Oum 
    dw $0000,$0000,$0010,$0010 
    dw EnemyTouch_Oum_DoesNotHurtSamus 
    dw RTL_A2804C 

EnemyTouch_Oum_HurtsSamus:
    JSL.L CommonA2_NormalEnemyTouchAI 

EnemyTouch_Oum_DoesNotHurtSamus:
    JSL.L CheckIfEnemyIsTouchingSamusFromBelow 
    BNE .return 
    LDX.W $0E54 
    LDA.W $0AF6 : SEC : SBC.W $0F7A,X : BMI .rightOfSamus 
    LDA.W $0B58 : CLC : ADC.W #$0004 : STA.W $0B58 
    RTL 


.rightOfSamus:
    LDA.W $0B58 : CLC : ADC.W #$FFFC : STA.W $0B58 

.return:
    RTL 


EnemyShot_Oum:
    JSL.L NormalEnemyShotAI 
    LDA.W #$0057 
    JSL.L QueueSound_Lib2_Max6 
    RTL 


Spritemap_Oum_FacingLeft_0:
    dw $0006,$01F0 
    db $00 
    dw $211E,$01F0 
    db $F8 
    dw $210E,$8000 
    db $00 
    dw $2122,$81F0 
    db $00 
    dw $2120,$8000 
    db $F0 
    dw $2102,$81F0 
    db $F0 
    dw $2100 

Spritemap_Oum_FacingLeft_1:
    dw $0006,$01F0 
    db $00 
    dw $211F,$01F0 
    db $F8 
    dw $210F,$8000 
    db $00 
    dw $2122,$81F0 
    db $00 
    dw $2120,$8000 
    db $F0 
    dw $2102,$81F0 
    db $F0 
    dw $2100 

Spritemap_Oum_FacingLeft_2:
    dw $0007,$81F0 
    db $F8 
    dw $2110,$01F8 
    db $08 
    dw $2131,$01F0 
    db $08 
    dw $2130,$01F8 
    db $F0 
    dw $2101,$01F0 
    db $F0 
    dw $2100,$8000 
    db $00 
    dw $2122,$8000 
    db $F0 
    dw $2102 

Spritemap_Oum_3:
    dw $0009,$01EA 
    db $FF 
    dw $212E,$01F0 
    db $00 
    dw $212F,$81F0 
    db $F8 
    dw $2110,$01F8 
    db $F0 
    dw $2101,$01F0 
    db $F0 
    dw $2100,$01F8 
    db $08 
    dw $2131,$01F0 
    db $08 
    dw $2130,$8000 
    db $00 
    dw $2122,$8000 
    db $F0 
    dw $2102 

Spritemap_Oum_FacingLeft_4:
    dw $0009,$01F8 
    db $08 
    dw $2131,$01F0 
    db $08 
    dw $2130,$01F8 
    db $F0 
    dw $2101,$01F0 
    db $F0 
    dw $2100,$01E8 
    db $FE 
    dw $212E,$01F0 
    db $00 
    dw $212F,$81F0 
    db $F8 
    dw $2110,$8000 
    db $00 
    dw $2122,$8000 
    db $F0 
    dw $2102 

Spritemap_Oum_FacingLeft_5:
    dw $000A,$01F0 
    db $00 
    dw $212F,$01E3 
    db $FE 
    dw $213E,$01E9 
    db $FF 
    dw $213F,$01F8 
    db $08 
    dw $2131,$01F0 
    db $08 
    dw $2130,$01F8 
    db $F0 
    dw $2101,$01F0 
    db $F0 
    dw $2100,$81F0 
    db $F8 
    dw $2110,$8000 
    db $00 
    dw $2122,$8000 
    db $F0 
    dw $2102 

Spritemap_Oum_FacingLeft_6:
    dw $000A,$01F0 
    db $00 
    dw $212F,$01E2 
    db $00 
    dw $213E,$01E9 
    db $00 
    dw $213F,$01F8 
    db $08 
    dw $2131,$01F0 
    db $08 
    dw $2130,$01F8 
    db $F0 
    dw $2101,$01F0 
    db $F0 
    dw $2100,$81F0 
    db $F8 
    dw $2110,$8000 
    db $00 
    dw $2122,$8000 
    db $F0 
    dw $2102 

Spritemap_Oum_FacingLeft_7:
    dw $000A,$01F0 
    db $00 
    dw $212F,$01E0 
    db $FF 
    dw $213E,$01E8 
    db $FF 
    dw $213F,$01F8 
    db $08 
    dw $2131,$01F0 
    db $08 
    dw $2130,$01F8 
    db $F0 
    dw $2101,$01F0 
    db $F0 
    dw $2100,$81F0 
    db $F8 
    dw $2110,$8000 
    db $00 
    dw $2122,$8000 
    db $F0 
    dw $2102 

Spritemap_Oum_FacingLeft_8:
    dw $0004,$8000 
    db $F0 
    dw $2104,$8000 
    db $00 
    dw $2128,$81F0 
    db $00 
    dw $2126,$81F0 
    db $F0 
    dw $2106 

Spritemap_Oum_FacingLeft_9:
    dw $0007,$0008 
    db $08 
    dw $211B,$0008 
    db $00 
    dw $210B,$01F0 
    db $08 
    dw $2118,$01F0 
    db $00 
    dw $2108,$81F8 
    db $00 
    dw $2109,$81F0 
    db $F0 
    dw $E122,$8000 
    db $F0 
    dw $2102 

Spritemap_Oum_FacingLeft_A:
    dw $0004,$81F0 
    db $F0 
    dw $E124,$8000 
    db $F0 
    dw $210C,$8000 
    db $00 
    dw $212C,$81F0 
    db $00 
    dw $212A 

Spritemap_Oum_FacingLeft_B:
    dw $0007,$0008 
    db $F0 
    dw $E130,$0000 
    db $F0 
    dw $E131,$0000 
    db $08 
    dw $E101,$0008 
    db $08 
    dw $E100,$8000 
    db $F8 
    dw $E110,$81F0 
    db $F0 
    dw $E122,$81F0 
    db $00 
    dw $E102 

Spritemap_Oum_FacingLeft_C:
    dw $0004,$81F0 
    db $00 
    dw $E104,$81F0 
    db $F0 
    dw $E128,$8000 
    db $F0 
    dw $E126,$8000 
    db $00 
    dw $E106 

Spritemap_Oum_FacingLeft_D:
    dw $0007,$01F0 
    db $F8 
    dw $E10B,$01F0 
    db $F0 
    dw $E11B,$0008 
    db $F8 
    dw $E108,$0008 
    db $F0 
    dw $E118,$81F8 
    db $F0 
    dw $E109,$8000 
    db $00 
    dw $2122,$81F0 
    db $00 
    dw $E102 

Spritemap_Oum_FacingLeft_E:
    dw $0004,$8000 
    db $00 
    dw $2124,$81F0 
    db $00 
    dw $E10C,$81F0 
    db $F0 
    dw $E12C,$8000 
    db $F0 
    dw $E12A 

Spritemap_Oum_FacingRight_0:
    dw $0006,$0008 
    db $00 
    dw $611E,$0008 
    db $F8 
    dw $610E,$81F0 
    db $00 
    dw $6122,$8000 
    db $00 
    dw $6120,$81F0 
    db $F0 
    dw $6102,$8000 
    db $F0 
    dw $6100 

Spritemap_Oum_FacingRight_1:
    dw $0006,$0008 
    db $00 
    dw $611F,$0008 
    db $F8 
    dw $610F,$81F0 
    db $00 
    dw $6122,$8000 
    db $00 
    dw $6120,$81F0 
    db $F0 
    dw $6102,$8000 
    db $F0 
    dw $6100 

Spritemap_Oum_FacingRight_2:
    dw $0007,$8000 
    db $F8 
    dw $6110,$0000 
    db $08 
    dw $6131,$0008 
    db $08 
    dw $6130,$0000 
    db $F0 
    dw $6101,$0008 
    db $F0 
    dw $6100,$81F0 
    db $00 
    dw $6122,$81F0 
    db $F0 
    dw $6102 

Spritemap_Oum_FacingRight_3:
    dw $0009,$000E 
    db $FF 
    dw $612E,$0008 
    db $00 
    dw $612F,$8000 
    db $F8 
    dw $6110,$0000 
    db $F0 
    dw $6101,$0008 
    db $F0 
    dw $6100,$0000 
    db $08 
    dw $6131,$0008 
    db $08 
    dw $6130,$81F0 
    db $00 
    dw $6122,$81F0 
    db $F0 
    dw $6102 

Spritemap_Oum_FacingRight_4:
    dw $0009,$0000 
    db $08 
    dw $6131,$0008 
    db $08 
    dw $6130,$0000 
    db $F0 
    dw $6101,$0008 
    db $F0 
    dw $6100,$0010 
    db $FE 
    dw $612E,$0008 
    db $00 
    dw $612F,$8000 
    db $F8 
    dw $6110,$81F0 
    db $00 
    dw $6122,$81F0 
    db $F0 
    dw $6102 

Spritemap_Oum_FacingRight_5:
    dw $000A,$0008 
    db $00 
    dw $612F,$0015 
    db $FE 
    dw $613E,$000F 
    db $FF 
    dw $613F,$0000 
    db $08 
    dw $6131,$0008 
    db $08 
    dw $6130,$0000 
    db $F0 
    dw $6101,$0008 
    db $F0 
    dw $6100,$8000 
    db $F8 
    dw $6110,$81F0 
    db $00 
    dw $6122,$81F0 
    db $F0 
    dw $6102 

Spritemap_Oum_FacingRight_6:
    dw $000A,$0008 
    db $00 
    dw $612F,$0016 
    db $00 
    dw $613E,$000F 
    db $00 
    dw $613F,$0000 
    db $08 
    dw $6131,$0008 
    db $08 
    dw $6130,$0000 
    db $F0 
    dw $6101,$0008 
    db $F0 
    dw $6100,$8000 
    db $F8 
    dw $6110,$81F0 
    db $00 
    dw $6122,$81F0 
    db $F0 
    dw $6102 

Spritemap_Oum_FacingRight_7:
    dw $000A,$0008 
    db $00 
    dw $612F,$0018 
    db $FF 
    dw $613E,$0010 
    db $FF 
    dw $613F,$0000 
    db $08 
    dw $6131,$0008 
    db $08 
    dw $6130,$0000 
    db $F0 
    dw $6101,$0008 
    db $F0 
    dw $6100,$8000 
    db $F8 
    dw $6110,$81F0 
    db $00 
    dw $6122,$81F0 
    db $F0 
    dw $6102 

Spritemap_Oum_FacingRight_8:
    dw $0004,$81F0 
    db $F0 
    dw $6104,$81F0 
    db $00 
    dw $6128,$8000 
    db $00 
    dw $6126,$8000 
    db $F0 
    dw $6106 

Spritemap_Oum_FacingRight_9:
    dw $0007,$01F0 
    db $08 
    dw $611B,$01F0 
    db $00 
    dw $610B,$0008 
    db $08 
    dw $6118,$0008 
    db $00 
    dw $6108,$81F8 
    db $00 
    dw $6109,$8000 
    db $F0 
    dw $A122,$81F0 
    db $F0 
    dw $6102 

Spritemap_Oum_FacingRight_A:
    dw $0004,$8000 
    db $F0 
    dw $A124,$81F0 
    db $F0 
    dw $610C,$81F0 
    db $00 
    dw $612C,$8000 
    db $00 
    dw $612A 

Spritemap_Oum_FacingRight_B:
    dw $0007,$01F0 
    db $F0 
    dw $A130,$01F8 
    db $F0 
    dw $A131,$01F8 
    db $08 
    dw $A101,$01F0 
    db $08 
    dw $A100,$81F0 
    db $F8 
    dw $A110,$8000 
    db $F0 
    dw $A122,$8000 
    db $00 
    dw $A102 

Spritemap_Oum_FacingRight_C:
    dw $0004,$8000 
    db $00 
    dw $A104,$8000 
    db $F0 
    dw $A128,$81F0 
    db $F0 
    dw $A126,$81F0 
    db $00 
    dw $A106 

Spritemap_Oum_FacingRight_D:
    dw $0007,$0008 
    db $F8 
    dw $A10B,$0008 
    db $F0 
    dw $A11B,$01F0 
    db $F8 
    dw $A108,$01F0 
    db $F0 
    dw $A118,$81F8 
    db $F0 
    dw $A109,$81F0 
    db $00 
    dw $6122,$8000 
    db $00 
    dw $A102 

Spritemap_Oum_FacingRight_E:
    dw $0004,$81F0 
    db $00 
    dw $6124,$8000 
    db $00 
    dw $A10C,$8000 
    db $F0 
    dw $A12C,$81F0 
    db $F0 
    dw $A12A 

Palette_Choot:
    dw $3800,$4B9C,$2610,$0CC6,$0C63,$42F7,$2A52,$19AD 
    dw $0D29,$5E59,$3D72,$2CEE,$1447,$033B,$0216,$0113 

InstList_Choot_Idle:
    dw Instruction_Common_DisableOffScreenProcessing 
    dw $0001 
    dw Spritemap_Choot_0 
    dw Instruction_Common_Sleep 

InstList_Choot_Jumping:
    dw Instruction_Common_EnableOffScreenProcessing 
    dw $0008 
    dw Spritemap_Choot_1 
    dw $0001 
    dw Spritemap_Choot_2 
    dw Instruction_Common_Sleep 

InstList_Choot_Falling:
    dw Instruction_Common_EnableOffScreenProcessing 
    dw $0008 
    dw Spritemap_Choot_1 
    dw $0001 
    dw Spritemap_Choot_3 
    dw Instruction_CommonA2_Sleep 

ChootFallingPatternData_0_Normal:
    dw $0000,$0000,$0001,$0001,$0002,$0001,$0003,$0002 
    dw $0004,$0002,$0005,$0002,$0006,$0003,$0007,$0003 
    dw $0008,$0003,$0009,$0003,$000A,$0003,$000B,$0003 
    dw $000C,$0003,$000C,$0003,$000D,$0003,$000D,$0003 
    dw $000D,$0003,$000E,$0003,$000E,$0003,$000E,$0003 
    dw $000F,$0003,$000F,$0003,$0010,$0003,$0010,$0003 
    dw $0010,$0003,$0010,$0003,$0011,$0003,$0011,$0003 
    dw $0010,$0005,$000F,$0006,$000E,$0008,$000C,$0009 
    dw $000B,$000A,$000A,$000C,$0008,$000D,$0007,$000E 
    dw $0006,$000E,$0004,$000F,$0003,$0010,$0002,$0010 
    dw $0001,$0011,$0000,$0011,$FFFF,$0011,$FFFE,$0012 
    dw $FFFC,$0012,$FFFC,$0012,$FFFB,$0012,$FFFA,$0012 
    dw $FFF9,$0012,$FFF8,$0012,$FFF7,$0012,$FFF7,$0012 
    dw $FFF7,$0012,$FFF6,$0012,$FFF6,$0012,$FFF5,$0012 
    dw $FFF5,$0012,$FFF4,$0012,$FFF4,$0012,$FFF4,$0012 
    dw $FFF3,$0012,$FFF3,$0012,$FFF3,$0012,$FFF4,$0014 
    dw $FFF5,$0016,$FFF6,$0017,$FFF7,$0019,$FFF9,$001A 
    dw $FFFA,$001B,$FFFB,$001C,$FFFD,$001D,$FFFE,$001E 
    dw $FFFF,$001F,$8000,$8000 

ChootFallingPatternData_0_Normal_YDistance:
    dw $001E 

ChootFallingPatternData_1_Wide:
    dw $0000,$0000,$0003,$0000,$0005,$0001,$0007,$0001 
    dw $0009,$0002,$000B,$0002,$000D,$0002,$000E,$0002 
    dw $0010,$0003,$0012,$0003,$0013,$0003,$0015,$0003 
    dw $0016,$0003,$0017,$0003,$0018,$0003,$0019,$0003 
    dw $0019,$0003,$001A,$0003,$001B,$0003,$001C,$0003 
    dw $001D,$0003,$001E,$0003,$001E,$0003,$001F,$0003 
    dw $001F,$0003,$0020,$0003,$0020,$0003,$0020,$0003 
    dw $001E,$0004,$001C,$0006,$001A,$0007,$0017,$0008 
    dw $0015,$000A,$0013,$000B,$0010,$000C,$000E,$000C 
    dw $000B,$000D,$0009,$000E,$0007,$000E,$0005,$000F 
    dw $0002,$000F,$0000,$0010,$FFFE,$0010,$FFFC,$0010 
    dw $FFFA,$0010,$FFF9,$0011,$FFF7,$0011,$FFF5,$0011 
    dw $FFF4,$0011,$FFF2,$0011,$FFF1,$0011,$FFF0,$0011 
    dw $FFF0,$0011,$FFEF,$0011,$FFEE,$0011,$FFED,$0011 
    dw $FFEC,$0011,$FFEB,$0011,$FFEA,$0011,$FFEA,$0011 
    dw $FFE9,$0011,$FFE8,$0011,$FFE8,$0011,$FFEA,$0013 
    dw $FFEC,$0014,$FFEE,$0016,$FFF0,$0017,$FFF2,$0018 
    dw $FFF5,$0019,$FFF7,$001A,$FFFA,$001B,$FFFC,$001C 
    dw $FFFE,$001D,$8000,$8000 

ChootFallingPatternData_1_Wide_YDistance:
    dw $001C 

ChootFallingPatternData_2_VeryWide:
    dw $0000,$0000,$0003,$0001,$0006,$0001,$0009,$0002 
    dw $000C,$0002,$000F,$0003,$0011,$0003,$0014,$0003 
    dw $0016,$0003,$0018,$0003,$001A,$0003,$001C,$0004 
    dw $001E,$0004,$0020,$0004,$0022,$0004,$0023,$0004 
    dw $0024,$0004,$0025,$0004,$0026,$0004,$0028,$0004 
    dw $0029,$0004,$002A,$0004,$002A,$0004,$002B,$0004 
    dw $002C,$0003,$002D,$0003,$002D,$0003,$002D,$0003 
    dw $002A,$0005,$0027,$0007,$0024,$0009,$0021,$000A 
    dw $001E,$000B,$001A,$000D,$0017,$000E,$0014,$000F 
    dw $0010,$000F,$000D,$0010,$000A,$0011,$0006,$0011 
    dw $0003,$0012,$0000,$0012,$FFFD,$0013,$FFFB,$0013 
    dw $FFF8,$0013,$FFF6,$0013,$FFF3,$0013,$FFF1,$0014 
    dw $FFEF,$0014,$FFED,$0014,$FFEB,$0014,$FFE9,$0014 
    dw $FFE8,$0014,$FFE7,$0014,$FFE5,$0014,$FFE4,$0014 
    dw $FFE3,$0014,$FFE2,$0014,$FFE1,$0013,$FFE0,$0013 
    dw $FFDF,$0013,$FFDE,$0013,$FFDE,$0013,$FFE1,$0015 
    dw $FFE4,$0017,$FFE7,$0018,$FFEA,$001A,$FFEE,$001B 
    dw $FFF1,$001C,$FFF4,$001D,$FFF8,$001E,$FFFB,$001F 
    dw $FFFE,$0020,$8000,$8000 

ChootFallingPatternData_2_VeryWide_YDistance:
    dw $0020 

ChootFallingPatternData_3_Slow:
    dw $0000,$0000,$0001,$0001,$0002,$0001,$0003,$0002 
    dw $0004,$0002,$0005,$0002,$0006,$0003,$0007,$0003 
    dw $0008,$0003,$0009,$0003,$000A,$0003,$000B,$0003 
    dw $000C,$0003,$000C,$0003,$000D,$0003,$000D,$0003 
    dw $000D,$0003,$000E,$0003,$000E,$0003,$000E,$0003 
    dw $000F,$0003,$000F,$0003,$0010,$0003,$0010,$0003 
    dw $0010,$0003,$0010,$0003,$0011,$0003,$0011,$0003 
    dw $0011,$0003,$0011,$0003,$0011,$0003,$0011,$0003 
    dw $0011,$0003,$0011,$0003,$0011,$0003,$0011,$0003 
    dw $0011,$0003,$0011,$0003,$0010,$0005,$000F,$0006 
    dw $000E,$0008,$000C,$0009,$000B,$000A,$000A,$000C 
    dw $0008,$000D,$0007,$000E,$0006,$000E,$0004,$000F 
    dw $0003,$0010,$0002,$0010,$0001,$0011,$0000,$0011 
    dw $FFFF,$0011,$FFFE,$0012,$FFFC,$0012,$FFFC,$0012 
    dw $FFFB,$0012,$FFFA,$0012,$FFF9,$0012,$FFF8,$0012 
    dw $FFF7,$0012,$FFF7,$0012,$FFF7,$0012,$FFF6,$0012 
    dw $FFF6,$0012,$FFF5,$0012,$FFF5,$0012,$FFF4,$0012 
    dw $FFF4,$0012,$FFF4,$0012,$FFF3,$0012,$FFF3,$0012 
    dw $FFF3,$0012,$FFF3,$0012,$FFF3,$0012,$FFF3,$0012 
    dw $FFF3,$0012,$FFF3,$0012,$FFF3,$0012,$FFF3,$0012 
    dw $FFF3,$0012,$FFF3,$0012,$FFF3,$0012,$FFF4,$0014 
    dw $FFF5,$0016,$FFF6,$0017,$FFF7,$0019,$FFF9,$001A 
    dw $FFFA,$001B,$FFFB,$001C,$FFFD,$001D,$FFFE,$001E 
    dw $FFFF,$001F,$8000,$8000 

ChootFallingPatternData_3_Slow_YDistance:
    dw $001E 

ChootFallingPatternData_4_VerySlow:
    dw $0000,$0000,$0001,$0001,$0002,$0001,$0003,$0002 
    dw $0004,$0002,$0005,$0002,$0006,$0003,$0007,$0003 
    dw $0008,$0003,$0009,$0003,$000A,$0003,$000B,$0003 
    dw $000C,$0003,$000C,$0003,$000D,$0003,$000D,$0003 
    dw $000D,$0003,$000E,$0003,$000E,$0003,$000E,$0003 
    dw $000F,$0003,$000F,$0003,$0010,$0003,$0010,$0003 
    dw $0010,$0003,$0010,$0003,$0011,$0003,$0011,$0003 
    dw $0011,$0003,$0011,$0003,$0011,$0003,$0011,$0003 
    dw $0011,$0003,$0011,$0003,$0011,$0003,$0011,$0003 
    dw $0011,$0003,$0011,$0003,$0011,$0003,$0011,$0003 
    dw $0011,$0003,$0011,$0003,$0011,$0003,$0011,$0003 
    dw $0011,$0003,$0011,$0003,$0011,$0003,$0011,$0003 
    dw $0011,$0003,$0011,$0003,$0011,$0003,$0011,$0003 
    dw $0011,$0003,$0011,$0003,$0011,$0003,$0011,$0003 
    dw $0011,$0003,$0011,$0003,$0010,$0005,$000F,$0006 
    dw $000E,$0008,$000C,$0009,$000B,$000A,$000A,$000C 
    dw $0008,$000D,$0007,$000E,$0006,$000E,$0004,$000F 
    dw $0003,$0010,$0002,$0010,$0001,$0011,$0000,$0011 
    dw $FFFF,$0011,$FFFE,$0012,$FFFC,$0012,$FFFC,$0012 
    dw $FFFB,$0012,$FFFA,$0012,$FFF9,$0012,$FFF8,$0012 
    dw $FFF7,$0012,$FFF7,$0012,$FFF7,$0012,$FFF6,$0012 
    dw $FFF6,$0012,$FFF5,$0012,$FFF5,$0012,$FFF4,$0012 
    dw $FFF4,$0012,$FFF4,$0012,$FFF3,$0012,$FFF3,$0012 
    dw $FFF3,$0012,$FFF3,$0012,$FFF3,$0012,$FFF3,$0012 
    dw $FFF3,$0012,$FFF3,$0012,$FFF3,$0012,$FFF3,$0012 
    dw $FFF3,$0012,$FFF3,$0012,$FFF3,$0012,$FFF3,$0012 
    dw $FFF3,$0012,$FFF3,$0012,$FFF3,$0012,$FFF3,$0012 
    dw $FFF3,$0012,$FFF3,$0012,$FFF3,$0012,$FFF3,$0012 
    dw $FFF3,$0012,$FFF3,$0012,$FFF3,$0012,$FFF3,$0012 
    dw $FFF3,$0012,$FFF3,$0012,$FFF3,$0012,$FFF3,$0012 
    dw $FFF3,$0012,$FFF3,$0012,$FFF3,$0012,$FFF4,$0014 
    dw $FFF5,$0016,$FFF6,$0017,$FFF7,$0019,$FFF9,$001A 
    dw $FFFA,$001B,$FFFB,$001C,$FFFD,$001D,$FFFE,$001E 
    dw $FFFF,$001F,$8000,$8000 

ChootFallingPatternData_4_VerySlow_YDistance:
    dw $001E 

ChootFallingPatternDataPointers_offsets:
    dw ChootFallingPatternData_0_Normal 
    dw ChootFallingPatternData_1_Wide 
    dw ChootFallingPatternData_2_VeryWide 
    dw ChootFallingPatternData_3_Slow 
    dw ChootFallingPatternData_4_VerySlow 
    dw ChootFallingPatternDataPointers_offsets 

ChootFallingPatternDataPointers_YDistance:
    dw ChootFallingPatternData_0_Normal_YDistance 
    dw ChootFallingPatternData_1_Wide_YDistance 
    dw ChootFallingPatternData_2_VeryWide_YDistance 
    dw ChootFallingPatternData_3_Slow_YDistance 
    dw ChootFallingPatternData_4_VerySlow_YDistance 
    dw ChootFallingPatternDataPointers_offsets 

InitAI_Choot:
    LDX.W $0E54 
    LDA.W #InstList_Choot_Idle 
    JSR.W SetChootInstList 
    LDA.W #Function_Choot_WaitForSamusToGetNear : STA.W $0FA8,X 
    LDA.W $0F7A,X : STA.L $7E7800,X 
    LDA.W $0F7E,X : STA.L $7E7802,X 
    LDA.W $0FB5,X : AND.W #$00FF 
    ASL A 
    TAY 
    LDA.W ChootFallingPatternDataPointers_offsets,Y : STA.W $0FB0,X 
    LDA.W ChootFallingPatternDataPointers_YDistance,Y 
    TAY 
    LDA.W $0000,Y : STA.W $0FB2,X 
    JSR.W CalculateChootJumpHeight 
    JSR.W CalculateChootInitialJumpSpeed 
    LDA.B $18 ; >_<
    LDA.L $7E7802,X : SEC : SBC.B $12 : STA.L $7E7806,X 
    LDA.L $7E7800,X : STA.L $7E7804,X 
    LDA.L $7E780C,X : STA.W $0FAA,X 
    RTL 


CalculateChootJumpHeight:
    PHP 
    SEP #$20 
    LDA.W $0FB4,X : STA.W $4202 
    LDA.W $0FB2,X : STA.W $4203 
    NOP #3
    REP #$20 
    LDA.W $4216 : STA.B $12 
    PLP 
    RTS 


CalculateChootInitialJumpSpeed:
    STZ.B $14 
    STZ.B $16 
    STZ.B $18 

.loop:
    LDA.B $18 : CLC : ADC.W #$0200 : STA.B $18 
    AND.W #$FF00 
    XBA 
    ASL #3
    TAY 
    LDA.B $14 : CLC : ADC.W CommonEnemySpeeds_QuadraticallyIncreasing,Y : BCC + 
    INC.B $16 

  + STA.B $14 
    LDA.B $16 : CLC : ADC.W CommonEnemySpeeds_QuadraticallyIncreasing+2,Y : STA.B $16 
    CMP.B $12 
    BMI .loop 
    LDA.B $18 : STA.L $7E780C,X 
    RTS 


SetChootInstList:
    LDX.W $0E54 
    STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    STZ.W $0F90,X 
    RTS 


MainAI_Choot:
    LDX.W $0E54 
    JSR.W ($0FA8,X) 
    RTL 


Function_Choot_WaitForSamusToGetNear:
    LDX.W $0E54 
    LDA.W #$0050 
    JSL.L IsSamusWithinAPixelColumnsOfEnemy 
    BEQ .return 
    LDA.W $0FB6,X : STA.L $7E780E,X 
    LDA.W #Function_Choot_PrepareToJump : STA.W $0FA8,X 

.return:
    RTS 


Function_Choot_PrepareToJump:
    LDX.W $0E54 
    LDA.L $7E780E,X 
    DEC A 
    STA.L $7E780E,X 
    BPL .return 
    LDA.W #InstList_Choot_Jumping 
    JSR.W SetChootInstList 
    LDA.W #Function_Choot_Jumping : STA.W $0FA8,X 

.return:
    RTS 


Function_Choot_Jumping:
    LDX.W $0E54 
    LDA.W $0FAA,X : AND.W #$FF00 
    XBA 
    ASL #3
    TAY 
    LDA.W $0F80,X : CLC : ADC.W CommonEnemySpeeds_QuadraticallyIncreasing+4,Y : BCC + 
    INC.W $0F7E,X 

  + STA.W $0F80,X 
    LDA.W $0F7E,X : CLC : ADC.W CommonEnemySpeeds_QuadraticallyIncreasing+6,Y : STA.W $0F7E,X 
    LDA.W $0FAA,X : SEC : SBC.W #$0200 : STA.W $0FAA,X 
    BPL .return 
    LDA.L $7E7804,X : STA.W $0F7A,X 
    STA.L $7E7808,X 
    LDA.L $7E7806,X : STA.W $0F7E,X 
    STA.L $7E780A,X 
    STZ.W $0FAC,X 
    LDA.W $0FB4,X : AND.W #$00FF 
    DEC A 
    STA.W $0FAE,X 
    LDA.W #InstList_Choot_Falling 
    JSR.W SetChootInstList 
    LDA.W #Function_Choot_Falling : STA.W $0FA8,X 

.return:
    RTS 


Function_Choot_Falling:
    LDX.W $0E54 
    LDA.W $0FAC,X : AND.W #$FF00 
    XBA 
    ASL #2
    CLC : ADC.W $0FB0,X : TAY 
    LDA.W $0000,Y 
    CMP.W #$8000 
    BNE + 
    LDA.L $7E780A,X : CLC : ADC.W $0FB2,X : STA.L $7E780A,X 
    STZ.W $0FAC,X 
    DEC.W $0FAE,X 
    BPL .return 
    LDA.L $7E780C,X : STA.W $0FAA,X 
    LDA.L $7E7800,X : STA.W $0F7A,X 
    STZ.W $0F7C,X 
    LDA.L $7E7802,X : STA.W $0F7E,X 
    STZ.W $0F80,X 
    LDA.W #InstList_Choot_Idle 
    JSR.W SetChootInstList 
    LDA.W #Function_Choot_WaitForSamusToGetNear : STA.W $0FA8,X 
    BRA .return 


  + LDA.L $7E7808,X : CLC : ADC.W $0000,Y : STA.W $0F7A,X 
    LDA.L $7E780A,X : CLC : ADC.W $0002,Y : STA.W $0F7E,X 
    LDA.W $0FAC,X : CLC : ADC.W #$0100 : STA.W $0FAC,X 

.return:
    RTS 


RTL_A2E144:
    RTL 


RTL_A2E145:
    RTL 


Spritemap_Choot_0:
    dw $0004,$01F0 
    db $FC 
    dw $6107,$01F8 
    db $FC 
    dw $6106,$0008 
    db $FC 
    dw $2107,$0000 
    db $FC 
    dw $2106 

Spritemap_Choot_1:
    dw $0002,$C3F0 
    db $F8 
    dw $6102,$C200 
    db $F8 
    dw $2102 

Spritemap_Choot_2:
    dw $0001,$C3F8 
    db $F8 
    dw $2100 

Spritemap_Choot_3:
    dw $0002,$C3F0 
    db $F8 
    dw $6104,$C200 
    db $F8 
    dw $2104 

Palette_GRipper:
    dw $3800,$4B9C,$3694,$0929,$0042,$3B18,$2A52,$19AD 
    dw $116B,$7F5A,$7EC0,$6DE0,$54E0,$001D,$0014,$000A 

InstList_GRipper_MovingLeft:
    dw $0008 
    dw Spritemap_GRipper_Ripper2_0 
    dw $0007 
    dw Spritemap_GRipper_Ripper2_1 
    dw $0008 
    dw Spritemap_GRipper_Ripper2_0 
    dw $0007 
    dw Spritemap_GRipper_Ripper2_2 
    dw Instruction_Common_GotoY 
    dw InstList_GRipper_MovingLeft 

InstList_GRipper_MovingRight:
    dw $0008 
    dw Spritemap_GRipper_Ripper2_3 
    dw $0007 
    dw Spritemap_GRipper_Ripper2_4 
    dw $0008 
    dw Spritemap_GRipper_Ripper2_3 
    dw $0007 
    dw Spritemap_GRipper_Ripper2_5 
    dw Instruction_Common_GotoY 
    dw InstList_GRipper_MovingRight 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_GRipper_FacingLeft_A2E1C3:
    dw $0010 
    dw Spritemap_GRipper_Ripper2_6 
    dw Instruction_Common_GotoY 
    dw UNUSED_InstList_GRipper_FacingLeft_A2E1C3 

UNUSED_InstList_GRipper_FacingRight_A2E1CB:
    dw $0010 
    dw Spritemap_GRipper_Ripper2_7 
    dw Instruction_CommonA2_GotoY 
    dw UNUSED_InstList_GRipper_FacingRight_A2E1CB 
endif ; !FEATURE_KEEP_UNREFERENCED

InitAI_GRipper:
    LDX.W $0E54 
    LDA.W $0F92,X : AND.W #$00FF 
    ASL #3
    STA.W $0FB0,X 
    TAY 
    LDA.W $0F92,X 
    BIT.W #$FEFF 
    BEQ .negateSpeed 
    LDA.W CommonEnemySpeeds_LinearlyIncreasing,Y : STA.W $0FAE,X 
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+2,Y : STA.W $0FAC,X 
    BRA + 


.negateSpeed:
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+4,Y : STA.W $0FAE,X 
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+6,Y : STA.W $0FAC,X 

  + LDY.W #InstList_GRipper_MovingLeft 
    LDA.W $0FAE,X : BMI .setMinMaxX 
    LDY.W #InstList_GRipper_MovingRight 

.setMinMaxX:
    TYA 
    STA.W $0F92,X 
    LDA.W $0FB4,X : STA.W $0FA8,X 
    LDA.W $0FB6,X : STA.W $0FAA,X 
    RTL 


MainAI_GRipper:
    LDX.W $0E54 
    LDA.W $0FAC,X : STA.B $12 
    LDA.W $0FAE,X : STA.B $14 
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes 
    BCS .collidedWithWall 
    JSR.W CheckIfGRipperMovedLeftTooFar 
    BCS .collidedWithWall 
    JSR.W CheckIfGRipperMovedRightTooFar 
    BCS .collidedWithWall 
    RTL 


.collidedWithWall:
    LDX.W $0E54 
    LDA.W $0FB0,X 
    TAY 
    LDA.W $0FAE,X : BPL .movingLeft 
    LDA.W CommonEnemySpeeds_LinearlyIncreasing,Y : STA.W $0FAE,X 
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+2,Y : STA.W $0FAC,X 
    LDY.W #InstList_GRipper_MovingRight 
    BRA .setInstList 


.movingLeft:
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+4,Y : STA.W $0FAE,X 
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+6,Y : STA.W $0FAC,X 
    LDY.W #InstList_GRipper_MovingLeft 

.setInstList:
    TYA 
    STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    STZ.W $0F90,X 
    RTL 


CheckIfGRipperMovedLeftTooFar:
    LDA.W $0FAE,X : BPL .notTooFar 
    LDA.W $0F7A,X 
    CMP.W $0FA8,X 
    BPL .notTooFar 
    SEC 
    RTS 


.notTooFar:
    CLC 
    RTS 


CheckIfGRipperMovedRightTooFar:
    LDA.W $0FAE,X : BMI .notTooFar 
    LDA.W $0F7A,X 
    CMP.W $0FAA,X 
    BMI .notTooFar 
    SEC 
    RTS 


.notTooFar:
    CLC 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_FrozenAI_GRipper_A2E29B:
    LDX.W $0E54 
    JSL.L CommonA2_NormalEnemyFrozenAI 
    RTL 
endif ; !FEATURE_KEEP_UNREFERENCED


RTL_A2E2A3:
    RTL 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_EnemyShot_A2E2A4:
    JSL.L NormalEnemyShotAI 
    LDX.W $0E54 
    LDA.W $0F9E,X : BEQ .return 
    LDY.W #Spritemap_GRipper_Ripper2_6 
    LDA.W $0FAE,X : BMI + 
    LDY.W #Spritemap_GRipper_Ripper2_7 

  + TYA 
    STA.W $0F8E,X 

.return:
    RTL 
endif ; !FEATURE_KEEP_UNREFERENCED


Palette_Ripper2:
    dw $3800,$021D,$0015,$0008,$0003,$00BD,$0013,$000E 
    dw $000B,$17BE,$1A9F,$0C53,$084B,$7EC0,$6DE0,$54E0 

InstList_Ripper2_MovingRight:
    dw $0008 
    dw Spritemap_GRipper_Ripper2_0 
    dw $0007 
    dw Spritemap_GRipper_Ripper2_1 
    dw $0008 
    dw Spritemap_GRipper_Ripper2_0 
    dw $0007 
    dw Spritemap_GRipper_Ripper2_2 
    dw Instruction_CommonA2_GotoY 
    dw InstList_Ripper2_MovingRight 

InstList_Ripper2_MovingLeft:
    dw $0008 
    dw Spritemap_GRipper_Ripper2_3 
    dw $0007 
    dw Spritemap_GRipper_Ripper2_4 
    dw $0008 
    dw Spritemap_GRipper_Ripper2_3 
    dw $0007 
    dw Spritemap_GRipper_Ripper2_5 
    dw Instruction_CommonA2_GotoY 
    dw InstList_Ripper2_MovingLeft 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_Ripper2_FacingLeft_A2E308:
    dw $0010 
    dw Spritemap_GRipper_Ripper2_6 
    dw Instruction_Common_GotoY 
    dw UNUSED_InstList_Ripper2_FacingLeft_A2E308 

UNUSED_InstList_Ripper2_FacingRight_A2E310:
    dw $0010 
    dw Spritemap_GRipper_Ripper2_7 
    dw Instruction_Common_GotoY 
    dw UNUSED_InstList_Ripper2_FacingRight_A2E310 
endif ; !FEATURE_KEEP_UNREFERENCED

InitAI_Ripper2:
    LDX.W $0E54 
    LDY.W #InstList_Ripper2_MovingRight 
    LDA.W $0FB6,X : BEQ .keepLeft 
    LDY.W #InstList_Ripper2_MovingLeft 

.keepLeft:
    TYA 
    STA.W $0F92,X 
    LDA.W $0FB4,X 
    ASL #3
    STA.W $0FB0,X 
    TAY 
    LDA.W $0FB6,X : BEQ + 
    LDA.W CommonEnemySpeeds_LinearlyIncreasing,Y : STA.W $0FAE,X 
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+2,Y : STA.W $0FAC,X 
    RTL 


  + LDA.W CommonEnemySpeeds_LinearlyIncreasing+4,Y : STA.W $0FAE,X 
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+6,Y : STA.W $0FAC,X 
    RTL 


MainAI_Ripper2:
    LDX.W $0E54 
    LDA.W $0FAC,X : STA.B $12 
    LDA.W $0FAE,X : STA.B $14 
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes 
    BCC .return 
    LDX.W $0E54 
    LDA.W $0FB0,X 
    TAY 
    LDA.W $0FAE,X : BPL .movingLeft 
    LDA.W CommonEnemySpeeds_LinearlyIncreasing,Y : STA.W $0FAE,X 
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+2,Y : STA.W $0FAC,X 
    LDY.W #InstList_Ripper2_MovingLeft 
    BRA + 


.movingLeft:
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+4,Y : STA.W $0FAE,X 
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+6,Y : STA.W $0FAC,X 
    LDY.W #InstList_Ripper2_MovingRight 

  + TYA 
    STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    STZ.W $0F90,X 

.return:
    RTL 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_FrozenAI_Ripper2_A2E3A0:
    LDX.W $0E54 
    JSL.L CommonA2_NormalEnemyFrozenAI 
    RTL 
endif ; !FEATURE_KEEP_UNREFERENCED


RTL_A2E3A8:
    RTL 


EnemyShot_GRipper_Ripper2:
    JSL.L NormalEnemyShotAI 
    LDX.W $0E54 
    LDA.W $0F9E,X : BEQ .return 
    LDY.W #Spritemap_GRipper_Ripper2_6 
    LDA.W $0FAE,X : BMI .setSpritemap 
    LDY.W #Spritemap_GRipper_Ripper2_7 

.setSpritemap:
    TYA 
    STA.W $0F8E,X 

.return:
    RTL 


Spritemap_GRipper_Ripper2_0:
    dw $0004,$0014 
    db $FF 
    dw $2119,$000C 
    db $FF 
    dw $2118,$01F4 
    db $FD 
    dw $2114,$81FC 
    db $F8 
    dw $2105 

Spritemap_GRipper_Ripper2_1:
    dw $0003,$000C 
    db $FF 
    dw $211A,$01F4 
    db $FD 
    dw $2107,$81FC 
    db $F8 
    dw $2105 

Spritemap_GRipper_Ripper2_2:
    dw $0004,$0014 
    db $FF 
    dw $2109,$000C 
    db $FF 
    dw $2108,$01F4 
    db $FD 
    dw $2117,$81FC 
    db $F8 
    dw $2105 

Spritemap_GRipper_Ripper2_3:
    dw $0004,$01E4 
    db $FF 
    dw $6119,$01EC 
    db $FF 
    dw $6118,$0004 
    db $FD 
    dw $6114,$81F4 
    db $F8 
    dw $6105 

Spritemap_GRipper_Ripper2_4:
    dw $0003,$01EC 
    db $FF 
    dw $611A,$0004 
    db $FD 
    dw $6107,$81F4 
    db $F8 
    dw $6105 

Spritemap_GRipper_Ripper2_5:
    dw $0004,$01EC 
    db $FF 
    dw $6108,$01E4 
    db $FF 
    dw $6109,$0004 
    db $FD 
    dw $6117,$81F4 
    db $F8 
    dw $6105 

Spritemap_GRipper_Ripper2_6:
    dw $0002,$01F4 
    db $FD 
    dw $2114,$81FC 
    db $F8 
    dw $2105 

Spritemap_GRipper_Ripper2_7:
    dw $0002,$0004 
    db $FD 
    dw $6114,$81F4 
    db $F8 
    dw $6105 

Palette_Ripper:
    dw $3800,$2F1F,$0932,$006A,$0003,$221C,$19B6,$1551 
    dw $10EC,$17BE,$189F,$0C53,$084B,$3BE0,$2680,$1580 

InstList_Ripper_MovingRight:
    dw $0008 
    dw Spritemap_Ripper_MovingRight_0 
    dw $0007 
    dw Spritemap_Ripper_MovingRight_1 
    dw $0008 
    dw Spritemap_Ripper_MovingRight_0 
    dw $0007 
    dw Spritemap_Ripper_MovingRight_2 
    dw Instruction_Common_GotoY 
    dw InstList_Ripper_MovingRight 

InstList_Ripper_MovingLeft:
    dw $0008 
    dw Spritemap_Ripper_MovingLeft_0 
    dw $0007 
    dw Spritemap_Ripper_MovingLeft_1 
    dw $0008 
    dw Spritemap_Ripper_MovingLeft_0 
    dw $0007 
    dw Spritemap_Ripper_MovingLeft_2 
    dw Instruction_Common_GotoY 
    dw InstList_Ripper_MovingLeft 

InitAI_Ripper:
    LDX.W $0E54 
    LDY.W #InstList_Ripper_MovingRight 
    LDA.W $0FB6,X : BNE .keepRight 
    LDY.W #InstList_Ripper_MovingLeft 

.keepRight:
    TYA 
    STA.W $0F92,X 
    LDA.W $0FB4,X 
    ASL #3
    STA.W $0FB0,X 
    TAY 
    LDA.W $0FB6,X : BEQ + 
    LDA.W CommonEnemySpeeds_LinearlyIncreasing,Y : STA.W $0FAE,X 
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+2,Y : STA.W $0FAC,X 
    RTL 


  + LDA.W CommonEnemySpeeds_LinearlyIncreasing+4,Y : STA.W $0FAE,X 
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+6,Y : STA.W $0FAC,X 
    RTL 


MainAI_Ripper:
    LDX.W $0E54 
    LDA.W $0FAC,X : STA.B $12 
    LDA.W $0FAE,X : STA.B $14 
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes 
    BCC .return 
    LDX.W $0E54 
    LDA.W $0FB0,X 
    TAY 
    LDA.W $0FAE,X : BPL .movingLeft 
    LDA.W CommonEnemySpeeds_LinearlyIncreasing,Y : STA.W $0FAE,X 
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+2,Y : STA.W $0FAC,X 
    LDY.W #InstList_Ripper_MovingRight 
    BRA + 


.movingLeft:
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+4,Y : STA.W $0FAE,X 
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+6,Y : STA.W $0FAC,X 
    LDY.W #InstList_Ripper_MovingLeft 

  + TYA 
    STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    STZ.W $0F90,X 

.return:
    RTL 


Spritemap_Ripper_MovingLeft_0:
    dw $0002,$01F4 
    db $FD 
    dw $3110,$C3FC 
    db $F8 
    dw $3101 

Spritemap_Ripper_MovingLeft_1:
    dw $0002,$01F4 
    db $FD 
    dw $3113,$C3FC 
    db $F8 
    dw $3101 

Spritemap_Ripper_MovingLeft_2:
    dw $0002,$01F4 
    db $FD 
    dw $3103,$C3FC 
    db $F8 
    dw $3101 

Spritemap_Ripper_MovingRight_0:
    dw $0002,$0004 
    db $FD 
    dw $7110,$C3F4 
    db $F8 
    dw $7101 

Spritemap_Ripper_MovingRight_1:
    dw $0002,$0004 
    db $FD 
    dw $7103,$C3F4 
    db $F8 
    dw $7101 

Spritemap_Ripper_MovingRight_2:
    dw $0002,$0004 
    db $FD 
    dw $7113,$C3F4 
    db $F8 
    dw $7101 

SpritemapPointers_Ripper:
    dw Spritemap_Ripper_MovingLeft_0 
    dw Spritemap_Ripper_MovingLeft_1 
    dw Spritemap_Ripper_MovingLeft_2 
    dw Spritemap_Ripper_MovingRight_0 
    dw Spritemap_Ripper_MovingRight_1 
    dw Spritemap_Ripper_MovingRight_2 

Palette_Dragon:
    dw $3800,$02FF,$01BF,$000F,$0008,$01BF,$011B,$00BA 
    dw $0011,$5A5C,$41B4,$290D,$1065,$03FF,$0237,$00D1 

InstList_Dragon_Idle_FacingLeft:
    dw $0001 
    dw Spritemap_Dragon_0 
    dw Instruction_CommonA2_Sleep 

InstList_Dragon_Wings_FacingLeft:
    dw $0005 
    dw Spritemap_Dragon_4 
    dw $0005 
    dw Spritemap_Dragon_5 
    dw Instruction_Common_GotoY 
    dw InstList_Dragon_Wings_FacingLeft 

InstList_Dragon_Idle_FacingRight:
    dw $0001 
    dw Spritemap_Dragon_6 
    dw Instruction_Common_Sleep 

InstList_Dragon_Wings_FacingRight:
    dw $0005 
    dw Spritemap_Dragon_A 
    dw $0005 
    dw Spritemap_Dragon_B 
    dw Instruction_Common_GotoY 
    dw InstList_Dragon_Wings_FacingRight 

InstList_Dragon_Attacking_FacingLeft:
    dw $0020 
    dw Spritemap_Dragon_1 
    dw $0003 
    dw Spritemap_Dragon_2 
    dw $0007 
    dw Spritemap_Dragon_3 
    dw $0003 
    dw Spritemap_Dragon_2 
    dw $0001 
    dw Spritemap_Dragon_1 
    dw Instruction_Dragon_SetAnimationFinishedFlag 
    dw Instruction_CommonA2_Sleep 

InstList_Dragon_Attacking_FacingRight:
    dw $0020 
    dw Spritemap_Dragon_7 
    dw $0003 
    dw Spritemap_Dragon_8 
    dw $0007 
    dw Spritemap_Dragon_9 
    dw $0003 
    dw Spritemap_Dragon_8 
    dw $0001 
    dw Spritemap_Dragon_7 
    dw Instruction_Dragon_SetAnimationFinishedFlag 
    dw Instruction_CommonA2_Sleep 

InstListPointers_Dragon:
    dw InstList_Dragon_Idle_FacingLeft 
    dw InstList_Dragon_Idle_FacingRight 
    dw InstList_Dragon_Wings_FacingLeft 
    dw InstList_Dragon_Wings_FacingRight 
    dw InstList_Dragon_Attacking_FacingLeft 
    dw InstList_Dragon_Attacking_FacingRight 

Instruction_Dragon_SetAnimationFinishedFlag:
    LDX.W $0E54 
    LDA.W #$0001 : STA.L $7E7804,X 
    RTL 


InitAI_Dragon:
    LDX.W $0E54 
    LDA.W #$0000 : STA.L $7E7804,X 
    LDA.W $0FB4,X : BEQ .idle 
    LDA.W #$0002 : STA.L $7E7800,X 
    STA.L $7E7802,X 
    LDA.W #InstList_Dragon_Wings_FacingLeft : STA.W $0F92,X 
    LDA.W $0F86,X : ORA.W #$0400 : STA.W $0F86,X 
    LDA.W #RTL_A2E781 : STA.W $0FB2,X 
    RTL 


.idle:
    LDA.W #$0000 : STA.L $7E7800,X 
    STA.L $7E7802,X 
    LDA.W #InstList_Dragon_Idle_FacingLeft : STA.W $0F92,X 
    LDA.W #Function_Dragon_WaitToRise : STA.W $0FB2,X 
    RTL 


MainAI_Dragon:
    LDX.W $0E54 
    JMP.W ($0FB2,X) 


Function_Dragon_WaitToRise:
    DEC.W $0FAE,X 
    BMI .timerExpired 
    RTL 


.timerExpired:
    LDA.W #$0030 : STA.W $0FAE,X 
    LDA.W #Function_Dragon_Rising : STA.W $0FB2,X 
    JSL.L Get_SamusX_minus_EnemyX 
    TAY 
    ROL.W $0FA8,X 
    ROL A 
    ROR.W $0FA8,X 
    TYA 
    SEP #$20 
    BIT.W $0FA9,X 
    BMI .facingLeft 
    LDA.L $7E7800,X : ORA.B #$01 : STA.L $7E7800,X 
    LDA.L $7E7840,X : ORA.B #$01 : STA.L $7E7840,X 
    BRA + 


.facingLeft:
    LDA.L $7E7800,X : AND.B #$FE : STA.L $7E7800,X 
    LDA.L $7E7840,X : AND.B #$FE : STA.L $7E7840,X 

  + REP #$20 
    JSR.W SetDragonInstList 
    JSR.W SetDragonWingsInstList 
    RTL 


Function_Dragon_Rising:
    DEC.W $0FAE,X 
    BPL .timerNotExpired 
    LDA.L $7E7800,X : CLC : ADC.W #$0004 : STA.L $7E7800,X 
    LDA.W #$0003 : STA.W $0FAE,X 
    LDA.W #Function_Dragon_Attacking : STA.W $0FB2,X 

.timerNotExpired:
    LDA.W $0F80,X : SEC : SBC.W #$0000 : STA.W $0F80,X 
    LDA.W $0F7E,X : SBC.W #$0001 : STA.W $0F7E,X 
    LDA.W $0FC0,X : SEC : SBC.W #$0000 : STA.W $0FC0,X 
    LDA.W $0FBE,X : SBC.W #$0001 : STA.W $0FBE,X 
    RTL 


Function_Dragon_Attacking:
    JSR.W SetDragonInstList 
    LDA.L $7E7804,X : BEQ .return 
    LDA.W #$0000 : STA.L $7E7804,X 
    LDA.W #$FFFF : STA.L $7E7802,X 
    LDY.W #EnemyProjectile_DragonFireball 
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    LDA.W #$0061 
    JSL.L QueueSound_Lib2_Max6 
    DEC.W $0FAE,X 
    BNE .return 
    LDA.L $7E7800,X : SEC : SBC.W #$0004 : STA.L $7E7800,X 
    LDA.W #$0060 : STA.W $0FAE,X 
    LDA.W #Function_Dragon_WaitToSink : STA.W $0FB2,X 

.return:
    RTL 


Function_Dragon_WaitToSink:
    DEC.W $0FAE,X 
    BNE .return 
    LDA.W #$0030 : STA.W $0FAE,X 
    LDA.W #Function_Dragon_Sinking : STA.W $0FB2,X 
    JSR.W SetDragonInstList 

.return:
    RTL 


Function_Dragon_Sinking:
    DEC.W $0FAE,X 
    BPL .timerNotExpired 
    LDA.W #$0080 : STA.W $0FAE,X 
    LDA.W #Function_Dragon_WaitToRise : STA.W $0FB2,X 

.timerNotExpired:
    LDA.W $0F80,X : CLC : ADC.W #$0000 : STA.W $0F80,X 
    LDA.W $0F7E,X : ADC.W #$0001 : STA.W $0F7E,X 
    LDA.W $0FC0,X : CLC : ADC.W #$0000 : STA.W $0FC0,X 
    LDA.W $0FBE,X : ADC.W #$0001 : STA.W $0FBE,X 
    RTL 


RTL_A2E781:
    RTL 


SetDragonInstList:
    LDX.W $0E54 
    LDA.L $7E7800,X 
    CMP.L $7E7802,X 
    BEQ .return 
    STA.L $7E7802,X 
    ASL A 
    TAY 
    LDA.W InstListPointers_Dragon,Y : STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    STZ.W $0F90,X 

.return:
    RTS 


SetDragonWingsInstList:
    LDX.W $0E54 
    LDA.L $7E7840,X 
    CMP.L $7E7842,X 
    BEQ .return 
    STA.L $7E7842,X 
    ASL A 
    TAY 
    LDA.W InstListPointers_Dragon,Y : STA.W $0FD2,X 
    LDA.W #$0001 : STA.W $0FD4,X 
    STZ.W $0FD0,X 

.return:
    RTS 


EnemyTouch_Dragon:
    JSL.L CommonA2_NormalEnemyTouchAI 
    BRA ContactReaction_Dragon_Common 


EnemyShot_Dragon:
    JSL.L CommonA2_NormalEnemyShotAI 
    BRA ContactReaction_Dragon_Common 


PowerBombReaction_Dragon:
    JSL.L CommonA2_NormalEnemyPowerBombAI 
    BRA ContactReaction_Dragon_Common ; >.<


ContactReaction_Dragon_Common:
    LDX.W $0E54 
    LDA.W $0F8C,X : BNE .notDead 
    LDA.W $0FC6,X : ORA.W #$0200 : STA.W $0FC6,X 
    BRA .return 


.notDead:
    LDA.W $0FA2,X : STA.W $0FE2,X 
    LDA.W $0FA0,X : STA.W $0FE0,X 
    LDA.W $0F9C,X : STA.W $0FDC,X 
    LDA.W $0F9E,X : STA.W $0FDE,X 
    LDA.W $0F8A,X : STA.W $0FCA,X 

.return:
    RTL 


Spritemap_Dragon_0:
    dw $0008,$0008 
    db $04 
    dw $211C,$0008 
    db $FC 
    dw $210C,$01F0 
    db $EC 
    dw $2110,$0000 
    db $04 
    dw $211D,$01F8 
    db $04 
    dw $210D,$81F9 
    db $0C 
    dw $210E,$81F8 
    db $F4 
    dw $210A,$81F8 
    db $E4 
    dw $2101 

Spritemap_Dragon_1:
    dw $0008,$01F0 
    db $E4 
    dw $2100,$81F8 
    db $E4 
    dw $2103,$0008 
    db $04 
    dw $211C,$0008 
    db $FC 
    dw $210C,$0000 
    db $04 
    dw $211D,$01F8 
    db $04 
    dw $210D,$81F9 
    db $0C 
    dw $210E,$81F8 
    db $F4 
    dw $210A 

Spritemap_Dragon_2:
    dw $0008,$01F0 
    db $E5 
    dw $2105,$81F8 
    db $E4 
    dw $2106,$0008 
    db $04 
    dw $211C,$0008 
    db $FC 
    dw $210C,$0000 
    db $04 
    dw $211D,$01F8 
    db $04 
    dw $210D,$81F9 
    db $0C 
    dw $210E,$81F8 
    db $F4 
    dw $210A 

Spritemap_Dragon_3:
    dw $0008,$01F0 
    db $E5 
    dw $2115,$81F8 
    db $E4 
    dw $2108,$0008 
    db $04 
    dw $211C,$0008 
    db $FC 
    dw $210C,$0000 
    db $04 
    dw $211D,$01F8 
    db $04 
    dw $210D,$81F9 
    db $0C 
    dw $210E,$81F8 
    db $F4 
    dw $210A 

Spritemap_Dragon_4:
    dw $0001,$0004 
    db $F4 
    dw $2120 

Spritemap_Dragon_5:
    dw $0001,$0004 
    db $F4 
    dw $2121 

Spritemap_Dragon_6:
    dw $0008,$01F0 
    db $04 
    dw $611C,$01F0 
    db $FC 
    dw $610C,$0008 
    db $EC 
    dw $6110,$01F8 
    db $04 
    dw $611D,$0000 
    db $04 
    dw $610D,$81F7 
    db $0C 
    dw $610E,$81F8 
    db $F4 
    dw $610A,$81F8 
    db $E4 
    dw $6101 

Spritemap_Dragon_7:
    dw $0008,$0008 
    db $E4 
    dw $6100,$81F8 
    db $E4 
    dw $6103,$01F0 
    db $04 
    dw $611C,$01F0 
    db $FC 
    dw $610C,$01F8 
    db $04 
    dw $611D,$0000 
    db $04 
    dw $610D,$81F7 
    db $0C 
    dw $610E,$81F8 
    db $F4 
    dw $610A 

Spritemap_Dragon_8:
    dw $0008,$0008 
    db $E5 
    dw $6105,$81F8 
    db $E4 
    dw $6106,$01F0 
    db $04 
    dw $611C,$01F0 
    db $FC 
    dw $610C,$01F8 
    db $04 
    dw $611D,$0000 
    db $04 
    dw $610D,$81F7 
    db $0C 
    dw $610E,$81F8 
    db $F4 
    dw $610A 

Spritemap_Dragon_9:
    dw $0008,$0008 
    db $E5 
    dw $6115,$81F8 
    db $E4 
    dw $6108,$01F0 
    db $04 
    dw $611C,$01F0 
    db $FC 
    dw $610C,$01F8 
    db $04 
    dw $611D,$0000 
    db $04 
    dw $610D,$81F7 
    db $0C 
    dw $610E,$81F8 
    db $F4 
    dw $610A 

Spritemap_Dragon_A:
    dw $0001,$01F4 
    db $F4 
    dw $6120 

Spritemap_Dragon_B:
    dw $0001,$01F4 
    db $F4 
    dw $6121 

Palette_Shutters:
    dw $3800,$4D1F,$38B6,$246E,$1448,$47FF,$2EFA,$1616 
    dw $0132,$6F39,$5A73,$41AD,$2D08,$1863,$7FFF,$0041 

InstList_Shutter_GrowthLevel0:
    dw $0001 
    dw Spritemap_Shutters_10px 
    dw Instruction_Common_Sleep 

InstList_Shutter_GrowthLevel1:
    dw $0001 
    dw Spritemap_Shutters_20px 
    dw Instruction_Common_Sleep 

InstList_Shutter_GrowthLevel2:
    dw $0001 
    dw Spritemap_Shutters_30px 
    dw Instruction_CommonA2_Sleep 

InstList_Shutter_GrowthLevel3:
    dw $0001 
    dw Spritemap_Shutters_40px 
    dw Instruction_CommonA2_Sleep 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_Shutter_ShrinkingLoop_A2E9B0:
    dw $0004 
    dw Spritemap_Shutters_40px 
    dw $0004 
    dw UNUSED_Spritemap_Shutters_38px_A2ED85 
    dw $0004 
    dw Spritemap_Shutters_30px 
    dw $0004 
    dw UNUSED_Spritemap_Shutters_28px_A2ED63 
    dw $0004 
    dw Spritemap_Shutters_20px 
    dw $0004 
    dw UNUSED_Spritemap_Shutters_18px_A2ED4B 
    dw $0004 
    dw Spritemap_Shutters_10px 
    dw $0004 
    dw UNUSED_Spritemap_Shutters_8px_A2ED38 
    dw Instruction_Common_GotoY 
    dw UNUSED_InstList_Shutter_ShrinkingLoop_A2E9B0 
endif ; !FEATURE_KEEP_UNREFERENCED

InstList_ShutterHorizontal:
    dw $0001 
    dw Spritemap_Shutters_Horizontal 
    dw Instruction_Common_Sleep 

InitAI_ShutterGrowing:
    LDX.W $0E54 
    LDA.W $0F88,X 
    ASL A 
    CLC : ADC.W $0F92,X : ASL A 
    TAY 
    LDA.W .functionPointers,Y : STA.W $0FA8,X 
    LDA.W $0F88,X : BEQ .movingDown 
    LDA.W $0F7E,X : STA.W $0FAA,X 
    SEC : SBC.W #$0008 : STA.W $0FAC,X 
    SEC : SBC.W #$0008 : STA.W $0FAE,X 
    SEC : SBC.W #$0008 : STA.W $0FB0,X 
    BRA + 


.movingDown:
    LDA.W $0F7E,X : STA.W $0FAA,X 
    CLC : ADC.W #$0008 : STA.W $0FAC,X 
    CLC : ADC.W #$0008 : STA.W $0FAE,X 
    CLC : ADC.W #$0008 : STA.W $0FB0,X 

  + STZ.W $0F88,X 
    STZ.W $0FB2,X 
    LDA.W #InstList_Shutter_GrowthLevel0 : STA.W $0F92,X 
    LDA.W $0FB6,X : AND.W #$00FF 
    ASL #2
    TAY 
    LDA.W .YSpeed,Y : STA.L $7E7800,X 
    LDA.W .YSubSpeed,Y : STA.L $7E7802,X 
    RTL 


.functionPointers:
    dw Function_ShutterGrowing_Initial_Downwards_WaitForTimer 
    dw Func_ShutterGrowing_Initial_Downwards_WaitForSamusToGetNear 
    dw Function_ShutterGrowing_Initial_Upwards_WaitForTimer 
    dw Func_ShutterGrowing_Initial_Upwards_WaitForSamusToGetNear 

.YSpeed:
    dw $0000 

.YSubSpeed:
    dw $1000,$0000,$2000,$0000,$3000,$0000,$4000,$0000 
    dw $5000,$0000,$6000,$0000,$7000,$0000,$8000,$0000 
    dw $9000,$0000,$A000,$0000,$B000,$0000,$C000,$0000 
    dw $D000,$0000,$E000,$0000,$F000,$0001,$0000,$0001 
    dw $1000,$0001,$2000,$0001,$3000,$0001,$4000,$0001 
    dw $5000,$0001,$6000,$0001,$7000,$0001,$8000 

MainAI_ShutterGrowing:
    LDX.W $0E54 
    JSR.W ($0FA8,X) 
    RTL 


Function_ShutterGrowing_Initial_Upwards_WaitForTimer:
    LDA.W $0FB4,X : BEQ + 
    DEC A 
    STA.W $0FB4,X 
    RTS 


  + JSR.W PlayGateOpeningClosingSFXIfOnScreen 
    LDA.W #Function_ShutterGrowing_Growing_Upwards : STA.W $0FA8,X 
    RTS 


Func_ShutterGrowing_Initial_Upwards_WaitForSamusToGetNear:
    LDA.W $0FB4,X 
    JSL.L IsSamusWithinAPixelColumnsOfEnemy 
    AND.W #$FFFF 
    BEQ .return 
    JSR.W PlayGateOpeningClosingSFXIfOnScreen 
    LDA.W #Function_ShutterGrowing_Growing_Upwards : STA.W $0FA8,X 

.return:
    RTS 


Func_ShutterGrowing_Initial_Downwards_WaitForSamusToGetNear:
    LDA.W $0FB4,X 
    JSL.L IsSamusWithinAPixelColumnsOfEnemy 
    AND.W #$FFFF 
    BEQ .return 
    JSR.W PlayGateOpeningClosingSFXIfOnScreen 
    LDA.W #Function_ShutterGrowing_Growing_Downwards : STA.W $0FA8,X 

.return:
    RTS 


Function_ShutterGrowing_Initial_Downwards_WaitForTimer:
    LDA.W $0FB4,X : BEQ + 
    DEC A 
    STA.W $0FB4,X 
    RTS 


  + JSR.W PlayGateOpeningClosingSFXIfOnScreen 
    LDA.W #Function_ShutterGrowing_Growing_Downwards : STA.W $0FA8,X 
    RTS 


Function_ShutterGrowing_Growing_Downwards:
    LDA.W $0FB2,X 
    ASL A 
    TAX 
    JSR.W (.pointers,X) 
    RTS 


.pointers:
    dw Function_ShutterGrowing_Growing_Downwards_GrowthLevel0 
    dw Function_ShutterGrowing_Growing_Downwards_GrowthLevel1 
    dw Function_ShutterGrowing_Growing_Downwards_GrowthLevel2 
    dw Function_ShutterGrowing_Growing_Downwards_GrowthLevel3 
    dw RTS_A2EB24 

RTS_A2EB24:
    RTS 


Function_ShutterGrowing_Growing_Downwards_GrowthLevel0:
    LDX.W $0E54 
    LDA.W $0F80,X : CLC : ADC.L $7E7802,X : STA.W $0F80,X 
    LDA.W $0F7E,X : ADC.L $7E7800,X : STA.W $0F7E,X 
    LDA.W $0FAA,X : CLC : ADC.W #$0010 : CMP.W $0F7E,X 
    BPL .return 
    SEC : SBC.W #$0007 : STA.W $0F7E,X 
    INC.W $0FB2,X 
    LDA.W #$0001 : STA.W $0F94,X 
    LDA.W #InstList_Shutter_GrowthLevel1 : STA.W $0F92,X 
    LDA.W #$0010 : STA.W $0F84,X 

.return:
    RTS 


Function_ShutterGrowing_Growing_Downwards_GrowthLevel1:
    LDX.W $0E54 
    LDA.W $0F80,X : CLC : ADC.L $7E7802,X : STA.W $0F80,X 
    LDA.W $0F7E,X : ADC.L $7E7800,X : STA.W $0F7E,X 
    LDA.W $0FAC,X : CLC : ADC.W #$0010 : CMP.W $0F7E,X 
    BPL .return 
    SEC : SBC.W #$0007 : STA.W $0F7E,X 
    INC.W $0FB2,X 
    LDA.W #$0001 : STA.W $0F94,X 
    LDA.W #InstList_Shutter_GrowthLevel2 : STA.W $0F92,X 
    LDA.W #$0018 : STA.W $0F84,X 

.return:
    RTS 


Function_ShutterGrowing_Growing_Downwards_GrowthLevel2:
    LDX.W $0E54 
    LDA.W $0F80,X : CLC : ADC.L $7E7802,X : STA.W $0F80,X 
    LDA.W $0F7E,X : ADC.L $7E7800,X : STA.W $0F7E,X 
    LDA.W $0FAE,X : CLC : ADC.W #$0010 : CMP.W $0F7E,X 
    BPL .return 
    SEC : SBC.W #$0007 : STA.W $0F7E,X 
    INC.W $0FB2,X 
    LDA.W #$0001 : STA.W $0F94,X 
    LDA.W #InstList_Shutter_GrowthLevel3 : STA.W $0F92,X 
    LDA.W #$0020 : STA.W $0F84,X 

.return:
    RTS 


Function_ShutterGrowing_Growing_Downwards_GrowthLevel3:
    LDX.W $0E54 
    LDA.W $0F80,X : CLC : ADC.L $7E7802,X : STA.W $0F80,X 
    LDA.W $0F7E,X : ADC.L $7E7800,X : STA.W $0F7E,X 
    LDA.W $0FB0,X : CLC : ADC.W #$0010 : CMP.W $0F7E,X 
    BPL .return 
    STA.W $0F7E,X 
    INC.W $0FB2,X 

.return:
    RTS 


Function_ShutterGrowing_Growing_Upwards:
    LDA.W $0F7E,X : STA.L $7E8800,X 
    LDA.W $0FB2,X 
    ASL A 
    TAX 
    JSR.W (.pointers,X) 
    JSL.L CheckIfEnemyIsTouchingSamusFromBelow 
    BEQ .return 
    LDA.W $0F7E,X : SEC : SBC.L $7E8800,X : BPL .return 
    CLC : ADC.W $0B5C : STA.W $0B5C 

.return:
    RTS 


.pointers:
    dw Function_ShutterGrowing_Growing_Upwards_GrowthLevel0 
    dw Function_ShutterGrowing_Growing_Upwards_GrowthLevel1 
    dw Function_ShutterGrowing_Growing_Upwards_GrowthLevel2 
    dw Function_ShutterGrowing_Growing_Upwards_GrowthLevel3 
    dw RTS_A2EC44 

RTS_A2EC44:
    RTS 


Function_ShutterGrowing_Growing_Upwards_GrowthLevel0:
    LDX.W $0E54 
    LDA.W $0F80,X : SEC : SBC.L $7E7802,X : STA.W $0F80,X 
    LDA.W $0F7E,X : SBC.L $7E7800,X : STA.W $0F7E,X 
    LDA.W $0FAA,X : SEC : SBC.W #$0010 : CMP.W $0F7E,X 
    BMI .return 
    CLC : ADC.W #$0007 : STA.W $0F7E,X 
    INC.W $0FB2,X 
    LDA.W #$0001 : STA.W $0F94,X 
    LDA.W #InstList_Shutter_GrowthLevel1 : STA.W $0F92,X 
    LDA.W #$0010 : STA.W $0F84,X 

.return:
    RTS 


Function_ShutterGrowing_Growing_Upwards_GrowthLevel1:
    LDX.W $0E54 
    LDA.W $0F80,X : SEC : SBC.L $7E7802,X : STA.W $0F80,X 
    LDA.W $0F7E,X : SBC.L $7E7800,X : STA.W $0F7E,X 
    LDA.W $0FAC,X : SEC : SBC.W #$0010 : CMP.W $0F7E,X 
    BMI .return 
    CLC : ADC.W #$0007 : STA.W $0F7E,X 
    INC.W $0FB2,X 
    LDA.W #$0001 : STA.W $0F94,X 
    LDA.W #InstList_Shutter_GrowthLevel2 : STA.W $0F92,X 
    LDA.W #$0018 : STA.W $0F84,X 

.return:
    RTS 


Function_ShutterGrowing_Growing_Upwards_GrowthLevel2:
    LDX.W $0E54 
    LDA.W $0F80,X : SEC : SBC.L $7E7802,X : STA.W $0F80,X 
    LDA.W $0F7E,X : SBC.L $7E7800,X : STA.W $0F7E,X 
    LDA.W $0FAE,X : SEC : SBC.W #$0010 : CMP.W $0F7E,X 
    BMI .return 
    CLC : ADC.W #$0007 : STA.W $0F7E,X 
    INC.W $0FB2,X 
    LDA.W #$0001 : STA.W $0F94,X 
    LDA.W #InstList_Shutter_GrowthLevel3 : STA.W $0F92,X 
    LDA.W #$0020 : STA.W $0F84,X 

.return:
    RTS 


Function_ShutterGrowing_Growing_Upwards_GrowthLevel3:
    LDX.W $0E54 
    LDA.W $0F80,X : SEC : SBC.L $7E7802,X : STA.W $0F80,X 
    LDA.W $0F7E,X : SBC.L $7E7800,X : STA.W $0F7E,X 
    LDA.W $0FB0,X : SEC : SBC.W #$0010 : CMP.W $0F7E,X 
    BMI .return 
    STA.W $0F7E,X 
    INC.W $0FB2,X 

.return:
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Load5_A2ED33:
    LDA.W #$0005 
    RTL 
endif ; !FEATURE_KEEP_UNREFERENCED


RTL_A2ED37:
    RTL 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Shutters_8px_A2ED38:
    dw $0002,$0000 
    db $FC 
    dw $2101,$01F8 
    db $FC 
    dw $2100 
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_Shutters_10px:
    dw $0001,$C3F8 
    db $F8 
    dw $2100 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Shutters_18px_A2ED4B:
    dw $0002,$C3F8 
    db $FC 
    dw $2100,$C3F8 
    db $F4 
    dw $2100 
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_Shutters_20px:
    dw $0002,$C3F8 
    db $00 
    dw $2100,$C3F8 
    db $F0 
    dw $2100 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Shutters_28px_A2ED63:
    dw $0003,$C3F8 
    db $F8 
    dw $2100,$C3F8 
    db $04 
    dw $2100,$C3F8 
    db $EC 
    dw $2100 
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_Shutters_30px:
    dw $0003,$C3F8 
    db $08 
    dw $2100,$C3F8 
    db $F8 
    dw $2100,$C3F8 
    db $E8 
    dw $2100 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Shutters_38px_A2ED85:
    dw $0004,$C3F8 
    db $0C 
    dw $2100,$C3F8 
    db $00 
    dw $2100,$C3F8 
    db $F0 
    dw $2100,$C3F8 
    db $E4 
    dw $2100 
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_Shutters_40px:
    dw $0004,$C3F8 
    db $10 
    dw $2100,$C3F8 
    db $00 
    dw $2100,$C3F8 
    db $F0 
    dw $2100,$C3F8 
    db $E0 
    dw $2100 

Spritemap_Shutters_Horizontal:
    dw $0004,$81E0 
    db $F8 
    dw $2102,$8010 
    db $F8 
    dw $2102,$8000 
    db $F8 
    dw $2102,$81F0 
    db $F8 
    dw $2102 

Palette_Kamer:
    dw $3800,$7F5A,$3BE0,$2680,$0920,$4F5A,$36B5,$2610 
    dw $1DCE,$5294,$39CE,$2108,$1084,$033B,$0216,$0113 

InstList_Kamer:
    dw $000A 
    dw Spritemap_Kamer_0 
    dw $000A 
    dw Spritemap_Kamer_1 
    dw $000A 
    dw Spritemap_Kamer_2 
    dw $000A 
    dw Spritemap_Kamer_3 
    dw Instruction_Common_GotoY 
    dw InstList_Kamer 

KamerInitialFunctionPointers:
    dw Function_Shutter_Kamer_WaitForTimer 
    dw Function_Shutter_Kamer_WaitForSamusToGetNear 
    dw Function_Shutter_Kamer_Activate 
    dw Function_Shutter_Kamer_GetEnemyIndex 
    dw Function_Shutter_Kamer_GetEnemyIndex 

InitAI_Kamer:
    LDX.W $0E54 
    JSR.W Init_Shutter_Kamer_Common 
    LDA.W #InstList_Kamer : STA.W $0F92,X 
    RTL 


InitAI_ShutterShootable_ShutterDestroyable:
    LDX.W $0E54 
    JSR.W Init_Shutter_Kamer_Common 
    LDA.W #InstList_Shutter_GrowthLevel3 : STA.W $0F92,X 
    RTL 


Init_Shutter_Kamer_Common:
    LDA.W $0F92,X : AND.W #$00FF : STA.L $7E7800,X 
    ASL #3
    TAY 
    LDA.W CommonEnemySpeeds_LinearlyIncreasing,Y : STA.W $0FAE,X 
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+2,Y : STA.W $0FAC,X 
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+4,Y : STA.W $0FB2,X 
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+6,Y : STA.W $0FB0,X 
    LDA.W $0F93,X : AND.W #$00FF : STA.L $7E7802,X 
    STA.L $7E8000,X 
    LDA.W $0F88,X : AND.W #$00FF : STA.L $7E7804,X 
    ASL #4
    STA.L $7E7810,X 
    LDA.W $0F89,X : AND.W #$00FF : STA.L $7E7806,X 
    ASL #4
    STA.L $7E7812,X 
    LDA.W $0FB4,X : AND.W #$00FF : STA.L $7E7808,X 
    ASL A 
    STA.L $7E780E,X 
    LDA.W $0FB5,X : AND.W #$00FF : STA.L $7E780A,X 
    LDA.W $0FB6,X : STA.L $7E780C,X 
    STA.W $0FAA,X 
    LDA.W $0F7E,X : STA.L $7E781E,X 
    CLC : ADC.L $7E780A,X : STA.L $7E7820,X 
    LDA.L $7E7802,X : BNE .keep20 
    LDA.W $0F7E,X : STA.L $7E7820,X 
    SEC : SBC.L $7E780A,X : STA.L $7E781E,X 

.keep20:
    LDA.W #Function_Shutter_Kamer_Initial : STA.W $0FA8,X 
    LDA.W #$0000 : STA.W $0F88,X 
    STA.L $7E7814,X 
    RTS 


MainAI_ShutterShootable_ShutterDestroyable_Kamer:
    LDX.W $0E54 
    JSR.W ($0FA8,X) 
    LDA.W $0FA8,X 
    CMP.W #Function_Kamer_MovingUp 
    BNE + 
    BRA .return 


  + LDA.W $0FA8,X 
    CMP.W #Function_Kamer_MovingDown 
    BEQ .return 
    LDA.W $182C : AND.W $182E 
    AND.W $1830 
    AND.W $1832 
    CMP.W #$FFFF 
    BEQ .return 
    CMP.W $0E54 
    BNE .return 
    LDA.W $0A6E : BEQ .return 
    JSL.L PowerBombReaction_ShutterShootable_ShutterDestroyable_Kamer 

.return:
    RTL 


Function_Shutter_Kamer_Initial:
    LDX.W $0E54 
    LDA.L $7E780E,X 
    TAX 
    JSR.W (KamerInitialFunctionPointers,X) 
    RTS 


Function_Shutter_Kamer_WaitForTimer:
    LDX.W $0E54 
    DEC.W $0FAA,X 
    BNE .return 
    LDA.L $7E780C,X : STA.W $0FAA,X 
    JSR.W ActivateKamer 

.return:
    RTS 


Function_Shutter_Kamer_WaitForSamusToGetNear:
    LDX.W $0E54 
    LDA.L $7E780C,X 
    JSL.L IsSamusWithinAPixelColumnsOfEnemy 
    BEQ .return 
    JSR.W ActivateKamer 

.return:
    RTS 


Function_Shutter_Kamer_Activate:
    LDX.W $0E54 
    JSR.W ActivateKamer 
    RTS 


Function_Shutter_Kamer_GetEnemyIndex:
    LDX.W $0E54 
    RTS 


ActivateKamer:
    LDA.W #Function_Kamer_MovingUp : STA.W $0FA8,X 
    LDA.L $7E7802,X : BEQ .keepUp 
    LDA.W #Function_Kamer_MovingDown : STA.W $0FA8,X 

.keepUp:
    JSR.W PlayGateOpeningClosingSFXIfOnScreen 
    RTS 


PlayGateOpeningClosingSFXIfOnScreen:
    JSL.L CheckIfEnemyCenterIsOnScreen 
    BNE .return 
    LDA.W #$000E 
    JSL.L QueueSound_Lib3_Max6 

.return:
    RTS 


Function_Kamer_MovingUp:
    LDX.W $0E54 
    LDA.W $0F7E,X : STA.L $7E781C,X 
    LDA.W #$0000 : STA.L $7E7814,X 
    JSL.L CheckIfEnemyIsTouchingSamusFromBelow 
    BEQ .notTouchingSamusFromBelow 
    LDA.W #$0001 : STA.L $7E7814,X 

.notTouchingSamusFromBelow:
    LDA.W $0F80,X : CLC : ADC.W $0FB0,X : BCC + 
    INC.W $0F7E,X 

  + STA.W $0F80,X 
    LDA.W $0F7E,X : CLC : ADC.W $0FB2,X : STA.W $0F7E,X 
    LDA.L $7E7814,X : BEQ .notMovingSamus 
    LDA.W $0F7E,X : SEC : SBC.L $7E781C,X : STA.W $0B5C 

.notMovingSamus:
    LDA.L $7E781E,X 
    CMP.W $0F7E,X 
    BMI .return 
    LDA.L $7E7810,X 
    CMP.W #$0FF0 
    BEQ .setFunction 
    STA.W $0FAA,X 
    LDA.W #Function_Kamer_StoppedMovingUp : STA.W $0FA8,X 
    BRA .return 


.setFunction:
    LDA.W #Function_Shutter_Kamer_GetEnemyIndex_duplicate : STA.W $0FA8,X 

.return:
    RTS 


Function_Kamer_MovingDown:
    LDX.W $0E54 
    LDA.W $0F7E,X : STA.L $7E781C,X 
    LDA.W #$0000 : STA.L $7E7814,X 
    JSL.L CheckIfEnemyIsTouchingSamusFromBelow 
    BEQ .notTouchingSamusFromBelow 
    LDA.W #$0001 : STA.L $7E7814,X 

.notTouchingSamusFromBelow:
    LDA.W $0F80,X : CLC : ADC.W $0FAC,X : BCC + 
    INC.W $0F7E,X 

  + STA.W $0F80,X 
    LDA.W $0F7E,X : CLC : ADC.W $0FAE,X : STA.W $0F7E,X 
    LDA.L $7E7814,X : BEQ .notMovingSamus 
    LDA.W $0F7E,X : SEC : SBC.L $7E781C,X : STA.W $0B5C 

.notMovingSamus:
    LDA.W $0F7E,X 
    CMP.L $7E7820,X 
    BMI .return 
    LDA.L $7E7812,X 
    CMP.W #$0FF0 
    BEQ .setFunction 
    STA.W $0FAA,X 
    LDA.W #Function_Kamer_StoppedMovingDown : STA.W $0FA8,X 
    BRA .return 


.setFunction:
    LDA.W #Function_Shutter_Kamer_GetEnemyIndex_duplicate : STA.W $0FA8,X 

.return:
    RTS 


Function_Kamer_StoppedMovingUp:
    LDX.W $0E54 
    DEC.W $0FAA,X 
    BPL .return 
    LDA.W #Function_Kamer_MovingDown : STA.W $0FA8,X 
    LDA.L $7E7808,X 
    CMP.W #$0001 
    BNE .upwards 
    LDA.L $7E7802,X : BEQ .upwards 
    LDA.W #Function_Shutter_Kamer_WaitForSamusToGetNear : STA.W $0FA8,X 

.upwards:
    LDX.W $0E54 
    LDA.W $0F78,X 
    CMP.W #EnemyHeaders_Kamer2 
    BEQ .return 
    JSR.W PlayGateOpeningClosingSFXIfOnScreen 

.return:
    RTS 


Function_Kamer_StoppedMovingDown:
    LDX.W $0E54 
    DEC.W $0FAA,X 
    BPL .return 
    JSR.W PlayGateOpeningClosingSFXIfOnScreen 
    LDA.W #Function_Kamer_MovingUp : STA.W $0FA8,X 
    LDA.L $7E7808,X 
    CMP.W #$0001 
    BNE .return 
    LDA.L $7E7802,X : BNE .return 
    LDA.W #Function_Shutter_Kamer_WaitForSamusToGetNear : STA.W $0FA8,X 

.return:
    RTS 


Function_Shutter_Kamer_GetEnemyIndex_duplicate:
    LDX.W $0E54 
    RTS 


EnemyTouch_ShutterShootable_ShutterDestroyable_Kamer:
    JSL.L PowerBombReaction_ShutterShootable_ShutterDestroyable_Kamer 
    RTL 


EnemyShot_ShutterShootable_Kamer:
    LDX.W $0E54 
    JSL.L PowerBombReaction_ShutterShootable_ShutterDestroyable_Kamer 
    RTL 


EnemyTouch_ShutterDestroyable:
    LDX.W $0E54 
    JSL.L NormalEnemyShotAI 
    JSL.L PowerBombReaction_ShutterShootable_ShutterDestroyable_Kamer 
    RTL 


PowerBombReaction_ShutterShootable_ShutterDestroyable_Kamer:
    LDX.W $0E54 
    LDA.L $7E780E,X 
    CMP.W #$0006 
    BMI .nonShootable 
    CMP.W #$0008 
    BEQ .function8 
    LDA.L $7E7818,X : BNE .return 
    LDA.W #$0001 : STA.L $7E7818,X 

.function8:
    LDA.W $0FA8,X 
    CMP.W #Function_Kamer_MovingUp 
    BNE .notMovingUp 
    BRA .return 


.notMovingUp:
    LDA.W $0FA8,X 
    CMP.W #Function_Kamer_MovingDown 
    BEQ .return 
    LDA.W #Function_Kamer_MovingUp : STA.W $0FA8,X 
    LDA.L $7E8000,X : BEQ .upwards 
    LDA.W #Function_Kamer_MovingDown : STA.W $0FA8,X 

.upwards:
    LDA.L $7E8000,X : EOR.W #$0001 : STA.L $7E8000,X 

.nonShootable:
    JSR.W PlayGateOpeningClosingSFXIfOnScreen 

.return:
    RTL 


InitialHorizontalShutterFunctionPointers:
    dw Function_HorizontalShutter_Initial_WaitForTimer 
    dw Function_HorizontalShutter_Initial_WaitForSamusToGetNear 
    dw Function_HorizontalShutter_Initial_Activate 
    dw Function_HorizontalShutter_Initial_Nothing 
    dw Function_HorizontalShutter_Initial_Nothing 

InitAI_ShutterHorizShootable:
    LDX.W $0E54 
    JSR.W InitializeHorizontalShutter 
    LDA.W #InstList_ShutterHorizontal : STA.W $0F92,X 
    RTL 


InitializeHorizontalShutter:
    LDA.W $0F92,X : AND.W #$00FF : STA.L $7E7800,X 
    ASL #3
    TAY 
    LDA.W CommonEnemySpeeds_LinearlyIncreasing,Y : STA.W $0FAE,X 
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+2,Y : STA.W $0FAC,X 
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+4,Y : STA.W $0FB2,X 
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+6,Y : STA.W $0FB0,X 
    LDA.W $0F93,X : AND.W #$00FF : STA.L $7E7802,X 
    EOR.W #$0001 
    STA.L $7E8000,X 
    LDA.W $0F88,X : AND.W #$00FF : STA.L $7E7804,X 
    ASL #4
    STA.L $7E7810,X 
    LDA.W $0F89,X : AND.W #$00FF : STA.L $7E7806,X 
    ASL #4
    STA.L $7E7812,X 
    LDA.W $0FB4,X : AND.W #$00FF : STA.L $7E7808,X 
    ASL A 
    STA.L $7E780E,X 
    LDA.W $0FB5,X : AND.W #$00FF : STA.L $7E780A,X 
    LDA.W $0FB6,X : STA.L $7E780C,X 
    STA.W $0FAA,X 
    LDA.W $0F7A,X : STA.L $7E7822,X 
    CLC : ADC.L $7E780A,X : STA.L $7E7824,X 
    LDA.L $7E7802,X : BNE .notLeftwards 
    LDA.W $0F7A,X : STA.L $7E7824,X 
    SEC : SBC.L $7E780A,X : STA.L $7E7822,X 

.notLeftwards:
    LDA.W #Function_HorizontalShutter_Initial : STA.W $0FA8,X 
    LDA.W $0AF6 : STA.L $7E782A,X 
    LDA.W #$0000 : STA.W $0F88,X 
    STA.L $7E7814,X 
    STA.L $7E7816,X 
    RTS 


MainAI_ShutterHorizShootable:
    LDX.W $0E54 
    JSR.W ($0FA8,X) 
    LDA.W $0FA8,X 
    CMP.W #Function_HorizontalShutter_MovingLeft 
    BNE .notMovingLeft 
    BRA + 


.notMovingLeft:
    LDA.W $0FA8,X 
    CMP.W #Function_HorizontalShutter_MovingRight 
    BEQ + 
    LDA.W $182C : AND.W $182E 
    AND.W $1830 
    AND.W $1832 
    CMP.W #$FFFF 
    BEQ + 
    CMP.W $0E54 
    BNE + 
    LDA.W $0A6E : BEQ + 
    JSL.L PowerBombReaction_CommonReaction_HorizontalShutter 

  + LDA.W $0AF6 : STA.L $7E782A,X 
    LDA.W $0AF8 : STA.L $7E782C,X 
    RTL 


Function_HorizontalShutter_Initial:
    LDX.W $0E54 
    LDA.L $7E780E,X 
    TAX 
    JSR.W (InitialHorizontalShutterFunctionPointers,X) 
    RTS 


Function_HorizontalShutter_Initial_WaitForTimer:
    LDX.W $0E54 
    DEC.W $0FAA,X 
    BNE .return 
    LDA.L $7E780C,X : STA.W $0FAA,X 
    JSR.W ActivateHorizontalShutter 

.return:
    RTS 


Function_HorizontalShutter_Initial_WaitForSamusToGetNear:
    LDX.W $0E54 
    LDA.L $7E780C,X 
    JSL.L IsSamusWithinAPixelColumnsOfEnemy 
    BEQ .return 
    JSR.W ActivateHorizontalShutter 

.return:
    RTS 


Function_HorizontalShutter_Initial_Activate:
    LDX.W $0E54 
    JSR.W ActivateHorizontalShutter 
    RTS 


Function_HorizontalShutter_Initial_Nothing:
    LDX.W $0E54 
    RTS 


ActivateHorizontalShutter:
    LDA.W #Function_HorizontalShutter_MovingLeft : STA.W $0FA8,X 
    LDA.L $7E7802,X : BEQ .return 
    LDA.W #Function_HorizontalShutter_MovingRight : STA.W $0FA8,X 

.return:
    RTS 


Function_HorizontalShutter_MovingLeft:
    LDX.W $0E54 
    LDA.W $0F7A,X : STA.L $7E781A,X 
    LDA.W #$0000 : STA.L $7E7826,X 
    JSL.L CheckIfEnemyIsTouchingSamus 
    BEQ .notTouchingSamus 
    LDA.W $0AF6 
    CMP.W $0F7A,X 
    BPL .notTouchingSamus 
    LDA.W #$0001 : STA.L $7E7826,X 

.notTouchingSamus:
    CLC 
    LDA.W $0F7C,X : ADC.W $0FB0,X : STA.W $0F7C,X 
    LDA.W $0F7A,X : ADC.W $0FB2,X : STA.W $0F7A,X 
    LDA.L $7E7826,X : BEQ .notMovingSamus 
    LDA.W $0FB0,X : STA.W $0B56 
    LDA.W $0FB2,X : STA.W $0B58 
    JSR.W EjectSamusIfPressingRight 

.notMovingSamus:
    LDA.L $7E7822,X 
    CMP.W $0F7A,X 
    BMI .return 
    LDA.L $7E7810,X 
    CMP.W #$0FF0 
    BEQ + 
    STA.W $0FAA,X 
    LDA.W #Function_HorizontalShutter_StoppedMovingLeft : STA.W $0FA8,X 
    BRA .return 


  + LDA.W #EnemyTouch_ShutterHorizShootable : STA.W $0FA8,X 

.return:
    RTS 


Function_HorizontalShutter_MovingRight:
    LDX.W $0E54 
    LDA.W $0F7A,X : STA.L $7E781A,X 
    LDA.W #$0000 : STA.L $7E7826,X 
    JSL.L CheckIfEnemyIsTouchingSamus 
    BEQ .notTouchingSamus 
    LDA.W $0AF6 
    CMP.W $0F7A,X 
    BMI .notTouchingSamus 
    LDA.W #$0001 : STA.L $7E7826,X 

.notTouchingSamus:
    CLC 
    LDA.W $0F7C,X : ADC.W $0FAC,X : STA.W $0F7C,X 
    LDA.W $0F7A,X : ADC.W $0FAE,X : STA.W $0F7A,X 
    LDA.L $7E7826,X : BEQ .notMovingSamus 
    LDA.W $0FAC,X : STA.W $0B56 
    LDA.W $0FAE,X : STA.W $0B58 
    JSR.W EjectSamusIfPressingLeft 

.notMovingSamus:
    LDA.W $0F7A,X 
    CMP.L $7E7824,X 
    BMI .return 
    LDA.L $7E7812,X 
    CMP.W #$0FF0 
    BEQ + 
    STA.W $0FAA,X 
    LDA.W #Function_HorizontalShutter_StoppedMovingRight : STA.W $0FA8,X 
    BRA .return 


  + LDA.W #EnemyTouch_ShutterHorizShootable : STA.W $0FA8,X 

.return:
    RTS 


EjectSamusIfPressingRight:
    LDA.L $7E7826,X : BEQ .return 
    LDA.B $8B : AND.W #$0100 
    BEQ .return 
    LDA.W $0B58 : CLC : ADC.W #$FFFC : STA.W $0B58 
    STZ.W $0B5A 

.return:
    RTS 


EjectSamusIfPressingLeft:
    LDA.L $7E7826,X : BEQ .return 
    LDA.B $8B : AND.W #$0200 
    BEQ .return 
    LDA.W $0B58 : CLC : ADC.W #$0004 : STA.W $0B58 
    STZ.W $0B5A 

.return:
    RTS 


Function_HorizontalShutter_StoppedMovingLeft:
    LDX.W $0E54 
    DEC.W $0FAA,X 
    BPL .return 
    LDA.W #Function_HorizontalShutter_MovingRight : STA.W $0FA8,X 
    LDA.L $7E7808,X 
    CMP.W #$0001 
    BNE .return 
    LDA.L $7E7802,X : BEQ .return 
    LDA.W #Function_HorizontalShutter_Initial_WaitForSamusToGetNear : STA.W $0FA8,X 

.return:
    RTS 


Function_HorizontalShutter_StoppedMovingRight:
    LDX.W $0E54 
    DEC.W $0FAA,X 
    BPL .return 
    LDA.W #Function_HorizontalShutter_MovingLeft : STA.W $0FA8,X 
    LDA.L $7E7808,X 
    CMP.W #$0001 
    BNE .return 
    LDA.L $7E7802,X : BNE .return 
    LDA.W #Function_HorizontalShutter_Initial_WaitForSamusToGetNear : STA.W $0FA8,X 

.return:
    RTS 


EnemyTouch_ShutterHorizShootable:
    LDX.W $0E54 
    RTS 


EnemyTouch_HorizShootableShutter:
    LDX.W $0E54 
    LDA.W $0FA8,X 
    CMP.W #EnemyTouch_ShutterHorizShootable 
    BNE .return 
    LDA.W $0AF6 
    CMP.W $0F7A,X 
    BPL .checkPressingLeft 
    LDA.B $8B : AND.W #$0100 
    BEQ .return 
    LDA.W #$FFFC : STA.W $0B58 
    STZ.W $0B5A 
    BRA .return 


.checkPressingLeft:
    LDA.B $8B : AND.W #$0200 
    BEQ .return 
    LDA.W #$0004 : STA.W $0B58 
    STZ.W $0B5A 

.return:
    RTL 


EnemyShot_ShutterHorizShootable:
    LDX.W $0E54 
    JSL.L NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External 
    JSL.L PowerBombReaction_CommonReaction_HorizontalShutter 
    RTL 


PowerBombReaction_CommonReaction_HorizontalShutter:
    LDX.W $0E54 
    LDA.L $7E780E,X 
    CMP.W #$0006 
    BMI .return 
    CMP.W #$0008 
    BEQ .function8 
    LDA.L $7E7818,X : BNE .return 
    LDA.W #$0001 : STA.L $7E7818,X 

.function8:
    LDA.W $0FA8,X 
    CMP.W #Function_HorizontalShutter_MovingLeft 
    BNE .notMovingLeft 
    BRA .return 


.notMovingLeft:
    LDA.W $0FA8,X 
    CMP.W #Function_HorizontalShutter_MovingRight 
    BEQ .return 
    LDA.L $7E8000,X : EOR.W #$0001 : STA.L $7E8000,X 
    LDA.W #Function_HorizontalShutter_MovingLeft : STA.W $0FA8,X 
    LDA.L $7E8000,X : BEQ .return 
    LDA.W #Function_HorizontalShutter_MovingRight : STA.W $0FA8,X 

.return:
    RTL 


Spritemap_Kamer_0:
    dw $0002,$8000 
    db $F8 
    dw $6100,$81F0 
    db $F8 
    dw $2100 

Spritemap_Kamer_1:
    dw $0002,$8000 
    db $F8 
    dw $6102,$81F0 
    db $F8 
    dw $2102 

Spritemap_Kamer_2:
    dw $0002,$8000 
    db $F8 
    dw $6104,$81F0 
    db $F8 
    dw $2104 

Spritemap_Kamer_3:
    dw $0002,$8000 
    db $F8 
    dw $6106,$81F0 
    db $F8 
    dw $2106 

Freespace_BankA2_F498: 
; $B68 bytes
