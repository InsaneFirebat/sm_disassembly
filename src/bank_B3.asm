
org $B38000


CommonB3_GrappleAI_NoInteraction:
    JSL.L GrappleAI_SwitchEnemyAIToMainAI 
    RTL 


CommonB3_GrappleAI_SamusLatchesOn:
    JSL.L GrappleAI_SamusLatchesOnWithGrapple 
    RTL 


CommonB3_GrappleAI_KillEnemy:
    JSL.L GrappleAI_EnemyGrappleDeath 
    RTL 


CommonB3_GrappleAI_CancelGrappleBeam:
    JSL.L GrappleAI_SwitchToFrozenAI 
    RTL 


CommonB3_GrappleAI_SamusLatchesOn_NoInvincibility:
    JSL.L GrappleAI_SamusLatchesOnWithGrapple_NoInvincibility 
    RTL 


UNUSED_CommonB3_GrappleAI_SamusLatchesOn_ParalyzeEnemy_B38019:
    JSL.L GrappleAI_SamusLatchesOnWithGrapple_ParalyzeEnemy 
    RTL 


CommonB3_GrappleAI_HurtSamus:
    JSL.L GrappleAI_SwitchToFrozenAI_duplicate 
    RTL 


CommonB3_NormalEnemyTouchAI:
    JSL.L NormalEnemyTouchAI 
    RTL 


CommonB3_NormalTouchAI_NoDeathCheck:
    JSL.L NormalEnemyTouchAI_NoDeathCheck_External 
    RTL 


CommonB3_NormalEnemyShotAI:
    JSL.L NormalEnemyShotAI 
    RTL 


CommonB3_NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic:
    JSL.L NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External 
    RTL 


CommonB3_NormalEnemyPowerBombAI:
    JSL.L NormalEnemyPowerBombAI 
    RTL 


CommonB3_NormalEnemyPowerBombAI_NoDeathCheck:
    JSL.L NormalEnemyPowerBombAI_NoDeathCheck_External 
    RTL 


CommonB3_NormalEnemyFrozenAI:
    JSL.L NormalEnemyFrozenAI 
    RTL 


CommonB3_CreateADudShot_JSL:
    JSL.L CreateADudShot 
    RTL 


RTS_B3804B:
    RTS 


CommonB3_RTL_B3804C:
    RTL 


Spritemap_CommonB3_Nothing:
    dw $0000 

ExtendedSpritemap_CommonB3_Nothing:
    dw $0001,$0000,$0000 
    dw Spritemap_CommonB3_Nothing 
    dw Hitbox_CommonB3_Nothing 

Hitbox_CommonB3_Nothing:
    dw $0001,$0000,$0000,$0000,$0000 
    dw CommonB3_NormalEnemyTouchAI 
    dw CommonB3_NormalEnemyShotAI 

InstList_CommonB3_DeleteEnemy:
    dw Instruction_CommonB3_DeleteEnemy 

NOPNOP_B38069:
    NOP #2
    Instruction_CommonB3_Enemy0FB2_InY:
    LDA.W $0000,Y : STA.W $0FB2,X 
    INY #2
    RTL 


Instruction_CommonB3_SetEnemy0FB2ToRTS:
    LDA.W #RTS_B3807B : STA.W $0FB2,X 
    RTL 


RTS_B3807B:
    RTS 


Instruction_CommonB3_DeleteEnemy:
    LDA.W $0F86,X 
    ORA.W #$0200 
    STA.W $0F86,X 
    PLA 
    PEA.W ProcessEnemyInstructions_return-1 
    RTL 


Instruction_CommonB3_CallFunctionInY:
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


Instruction_CommonB3_CallFunctionInY_WithA:
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
UNUSED_Instruction_CommonB3_CallExternalFunctionInY_B380B5:
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


UNUSED_Inst_CommonB3_CallExternalFunctionInY_WithA_B380CE:
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


Instruction_CommonB3_GotoY:
    LDA.W $0000,Y 
    TAY 
    RTL 


Instruction_CommonB3_GotoY_PlusY:
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


Instruction_CommonB3_DecrementTimer_GotoYIfNonZero:
    DEC.W $0F90,X 
    BNE Instruction_CommonB3_GotoY 
    INY #2
    RTL 


Instruction_CommonB3_DecrementTimer_GotoYIfNonZero_duplicate:
    DEC.W $0F90,X 
    BNE Instruction_CommonB3_GotoY 
    INY #2
    RTL 


Instruction_CommonB3_DecrementTimer_GotoY_PlusY_IfNonZero:
    SEP #$20 
    DEC.W $0F90,X 
    REP #$20 
    BNE Instruction_CommonB3_GotoY_PlusY 
    INY 
    RTL 


Instruction_CommonB3_TimerInY:
    LDA.W $0000,Y : STA.W $0F90,X 
    INY #2
    RTL 


Instruction_CommonB3_SkipNextInstruction:
    INY #2
    RTL 


Instruction_CommonB3_Sleep:
    DEY #2
    TYA 
    STA.W $0F92,X 
    PLA 
    PEA.W ProcessEnemyInstructions_return-1 
    RTL 


Instruction_CommonB3_WaitYFrames:
    LDA.W $0000,Y : STA.W $0F94,X 
    INY #2
    TYA 
    STA.W $0F92,X 
    PLA 
    PEA.W ProcessEnemyInstructions_return-1 
    RTL 


Instruction_CommonB3_TransferYBytesInYToVRAM:
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


Instruction_CommonB3_EnableOffScreenProcessing:
    LDA.W $0F86,X 
    ORA.W #$0800 
    STA.W $0F86,X 
    RTL 


Instruction_CommonB3_DisableOffScreenProcessing:
    LDA.W $0F86,X 
    AND.W #$F7FF 
    STA.W $0F86,X 
    RTL 


CommonB3EnemySpeeds_LinearlyIncreasing:
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

CommonB3EnemySpeeds_QuadraticallyIncreasing:
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

UNUSED_Palette_SpinningTurtleEye_B38687:
    dw $3800,$4FE9,$4266,$3D85,$20A3,$52FC,$41F7,$30D2 
    dw $240E,$325F,$31DB,$3156,$30D2,$302C,$7FBD,$0C05 

UNUSED_InstList_SpinningTurtleEye_Initial_B386A7:
    dw $000A 
    dw UNUSED_Spritemaps_SpinningTurtleEye_0_B38714 
    dw $000A 
    dw UNUSED_Spritemaps_SpinningTurtleEye_1_B3871B 
    dw $000A 
    dw UNUSED_Spritemaps_SpinningTurtleEye_2_B38722 
    dw $000A 
    dw UNUSED_Spritemaps_SpinningTurtleEye_3_B38729 
    dw $000A 
    dw UNUSED_Spritemaps_SpinningTurtleEye_4_B38730 
    dw $000A 
    dw UNUSED_Spritemaps_SpinningTurtleEye_5_B38737 
    dw $000A 
    dw UNUSED_Spritemaps_SpinningTurtleEye_6_B3873E 
    dw $000A 
    dw UNUSED_Spritemaps_SpinningTurtleEye_7_B38745 
    dw Instruction_Common_GotoY 
    dw UNUSED_InstList_SpinningTurtleEye_Initial_B386A7 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_SpinningTurtleEye_B386CB:
    dw $0008 
    dw UNUSED_Spritemaps_SpinningTurtleEye_8_B3874C 
    dw $0008 
    dw UNUSED_Spritemaps_SpinningTurtleEye_9_B38753 
    dw $0008 
    dw UNUSED_Spritemaps_SpinningTurtleEye_A_B3875A 
    dw Instruction_Common_GotoY 
    dw UNUSED_InstList_SpinningTurtleEye_B386CB 

UNUSED_InstList_SpinningTurtleEye_B386DB:
    dw $0008 
    dw UNUSED_Spritemaps_SpinningTurtleEye_B_B38761 
    dw $0008 
    dw UNUSED_Spritemaps_SpinningTurtleEye_C_B38768 
    dw $0008 
    dw UNUSED_Spritemaps_SpinningTurtleEye_D_B3876F 
    dw Instruction_Common_GotoY 
    dw UNUSED_InstList_SpinningTurtleEye_B386DB 

UNUSED_InstList_SpinningTurtleEye_B386EB:
    dw $0008 
    dw UNUSED_Spritemaps_SpinningTurtleEye_E_B38776 
    dw $0008 
    dw UNUSED_Spritemaps_SpinningTurtleEye_F_B3877D 
    dw $0008 
    dw UNUSED_Spritemaps_SpinningTurtleEye_10_B38784 
    dw Instruction_Common_GotoY 
    dw UNUSED_InstList_SpinningTurtleEye_B386EB 
endif ; !FEATURE_KEEP_UNREFERENCED

UNUSED_InitAI_SpinningTurtleEye_B386FB:
    LDX.W $0E54 
    LDA.W $0F86,X 
    ORA.W #$2000 
    STA.W $0F86,X 
    LDA.W #UNUSED_InstList_SpinningTurtleEye_Initial_B386A7 : STA.W $0F92,X 
    RTL 


UNUSED_MainAI_SpinningTurtleEye_B3870E:
    LDX.W $0E54 
    RTL 


RTL_B38712:
    RTL 


RTL_B38713:
    RTL 


UNUSED_Spritemaps_SpinningTurtleEye_0_B38714:
    dw $0001,$01F8 
    db $F8 
    dw $3300 

UNUSED_Spritemaps_SpinningTurtleEye_1_B3871B:
    dw $0001,$01F8 
    db $F8 
    dw $3301 

UNUSED_Spritemaps_SpinningTurtleEye_2_B38722:
    dw $0001,$01F8 
    db $F8 
    dw $3302 

UNUSED_Spritemaps_SpinningTurtleEye_3_B38729:
    dw $0001,$01F8 
    db $F8 
    dw $3303 

UNUSED_Spritemaps_SpinningTurtleEye_4_B38730:
    dw $0001,$01F8 
    db $F8 
    dw $F300 

UNUSED_Spritemaps_SpinningTurtleEye_5_B38737:
    dw $0001,$01F8 
    db $F8 
    dw $F301 

UNUSED_Spritemaps_SpinningTurtleEye_6_B3873E:
    dw $0001,$01F8 
    db $F8 
    dw $F302 

UNUSED_Spritemaps_SpinningTurtleEye_7_B38745:
    dw $0001,$01F8 
    db $F8 
    dw $F303 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemaps_SpinningTurtleEye_8_B3874C:
    dw $0001,$01F8 
    db $F8 
    dw $3304 

UNUSED_Spritemaps_SpinningTurtleEye_9_B38753:
    dw $0001,$01F8 
    db $F8 
    dw $3305 

UNUSED_Spritemaps_SpinningTurtleEye_A_B3875A:
    dw $0001,$01F8 
    db $F8 
    dw $3306 

UNUSED_Spritemaps_SpinningTurtleEye_B_B38761:
    dw $0001,$01F8 
    db $F8 
    dw $3307 

UNUSED_Spritemaps_SpinningTurtleEye_C_B38768:
    dw $0001,$01F8 
    db $F8 
    dw $3308 

UNUSED_Spritemaps_SpinningTurtleEye_D_B3876F:
    dw $0001,$01F8 
    db $F8 
    dw $3309 

UNUSED_Spritemaps_SpinningTurtleEye_E_B38776:
    dw $0001,$01F8 
    db $F8 
    dw $330A 

UNUSED_Spritemaps_SpinningTurtleEye_F_B3877D:
    dw $0001,$01F8 
    db $F8 
    dw $330B 

UNUSED_Spritemaps_SpinningTurtleEye_10_B38784:
    dw $0001,$01F8 
    db $F8 
    dw $330C 
endif ; !FEATURE_KEEP_UNREFERENCED

Palette_Zeb:
    dw $3800,$021D,$0015,$0008,$0003,$00BD,$0013,$000E 
    dw $000B,$7F5A,$7EC0,$6DE0,$54E0,$03E0,$02A0,$0140 

InstList_Zeb_FacingLeft_Rising:
    dw $0002 
    dw Spritemaps_Zeb_0 
    dw $0002 
    dw Spritemaps_Zeb_1 
    dw $0002 
    dw Spritemaps_Zeb_2 
    dw $0002 
    dw Spritemaps_Zeb_3 
    dw $0002 
    dw Spritemaps_Zeb_4 
    dw $0002 
    dw Spritemaps_Zeb_3 
    dw $0002 
    dw Spritemaps_Zeb_2 
    dw $0002 
    dw Spritemaps_Zeb_1 
    dw Instruction_Common_GotoY 
    dw InstList_Zeb_FacingLeft_Rising 

InstList_Zeb_FacingLeft_Shooting:
    dw $0001 
    dw Spritemaps_Zeb_0 
    dw $0001 
    dw Spritemaps_Zeb_1 
    dw $0001 
    dw Spritemaps_Zeb_3 
    dw $0001 
    dw Spritemaps_Zeb_4 
    dw $0001 
    dw Spritemaps_Zeb_3 
    dw $0001 
    dw Spritemaps_Zeb_1 
    dw Instruction_Common_GotoY 
    dw InstList_Zeb_FacingLeft_Shooting 

InstList_Zeb_FacingRight_Rising:
    dw $0002 
    dw Spritemaps_Zeb_5 
    dw $0002 
    dw Spritemaps_Zeb_6 
    dw $0002 
    dw Spritemaps_Zeb_7 
    dw $0002 
    dw Spritemaps_Zeb_8 
    dw $0002 
    dw Spritemaps_Zeb_9 
    dw $0002 
    dw Spritemaps_Zeb_8 
    dw $0002 
    dw Spritemaps_Zeb_7 
    dw $0002 
    dw Spritemaps_Zeb_6 
    dw Instruction_Common_GotoY 
    dw InstList_Zeb_FacingRight_Rising 

InstList_Zeb_FacingRight_Shooting:
    dw $0001 
    dw Spritemaps_Zeb_5 
    dw $0001 
    dw Spritemaps_Zeb_6 
    dw $0001 
    dw Spritemaps_Zeb_8 
    dw $0001 
    dw Spritemaps_Zeb_9 
    dw $0001 
    dw Spritemaps_Zeb_8 
    dw $0001 
    dw Spritemaps_Zeb_6 
    dw Instruction_Common_GotoY 
    dw InstList_Zeb_FacingRight_Shooting 

InstListPointers_Zeb:
    dw InstList_Zeb_FacingLeft_Rising 
    dw InstList_Zeb_FacingLeft_Shooting 
    dw InstList_Zeb_FacingRight_Rising 
    dw InstList_Zeb_FacingRight_Shooting 

InstListPointers_Zebbo:
    dw InstList_Zebbo_FacingLeft_Rising 
    dw InstList_Zebbo_FacingLeft_Shooting 
    dw InstList_Zebbo_FacingRight_Rising 
    dw InstList_Zebbo_FacingRight_Shooting 

InitAI_Zeb_Zebbo:
    LDX.W $0E54 
    LDA.W $0F7A,X : STA.W $0FAA,X 
    LDA.W $0F7E,X : STA.W $0FAC,X 
    SEC 
    SBC.W #$0010 
    STA.L $7E7800,X 
    LDA.W #Function_Zeb_Zebbo_WaitUntilOnScreen : STA.W $0FB2,X 
    LDA.W #$0030 : STA.W $0FAE,X 
    LDA.W #$0000 : STA.W $0FB0,X 
    STA.L $7E7802,X 
    LDA.W #InstList_Zeb_FacingLeft_Rising : STA.W $0F92,X 
    LDA.W $0FB4,X 
    BEQ .return 
    LDA.W #InstList_Zebbo_FacingLeft_Rising : STA.W $0F92,X 

.return:
    RTL 


MainAI_Zeb_Zebbo:
    LDX.W $0E54 
    JMP.W ($0FB2,X) 


Function_Zeb_Zebbo_WaitUntilOnScreen:
    LDX.W $0E54 
    JSL.L CheckIfEnemyCenterIsOnScreen 
    BNE .return 
    LDA.W #Function_Zeb_Zebbo_WaitForSamusToGetNear : STA.W $0FB2,X 

.return:
    RTL 


Function_Zeb_Zebbo_WaitForSamusToGetNear:
    JSL.L Get_SamusY_minus_EnemyY 
    BPL .return 
    CMP.W #$FFA0 
    BMI .return 
    JSL.L Get_SamusX_minus_EnemyX 
    TAY 
    ROL.W $0FA8,X 
    ROL A 
    ROR.W $0FA8,X 
    LDA.W $0F7A,X 
    SEC 
    SBC.W $0AF6 
    BPL + 
    EOR.W #$FFFF 
    INC A 

  + CMP.W #$0040 
    BCC .close 

.return:
    RTL 


.close:
    LDA.W #Function_Zeb_Zebbo_Rising : STA.W $0FB2,X 
    LDA.W $0F86,X 
    AND.W #$FEFF 
    STA.W $0F86,X 
    LDA.W #$0000 : STA.W $0F90,X 
    BIT.W $0FA8,X 
    BMI .left 
    LDA.W #$0002 
    BRA + 


.left:
    LDA.W #$0000 

  + STA.W $0FB0,X 
    JSR.W Set_Zeb_Zebbo_InstList 
    RTL 


Function_Zeb_Zebbo_Rising:
    LDA.W #$FFFF 
    CLC 
    ADC.W $0F80,X 
    STA.W $0F80,X 
    LDA.W #$FFFE 
    ADC.W $0F7E,X 
    STA.W $0F7E,X 
    LDA.L $7E7800,X 
    CMP.W $0F7E,X 
    BMI .return 
    LDA.W $0F7E,X 
    CMP.W $0AFA 
    BCC .targetHeight 
    BRA .return 


.targetHeight:
    LDA.W $0FB0,X 
    ORA.W #$0001 
    STA.W $0FB0,X 
    JSR.W Set_Zeb_Zebbo_InstList 
    LDA.W #Function_Zeb_Zebbo_Shooting : STA.W $0FB2,X 

.return:
    RTL 


Function_Zeb_Zebbo_Shooting:
    BIT.W $0FA8,X 
    BPL .right 
    LDA.W $0F7C,X 
    SEC 
    SBC.W #$0000 
    STA.W $0F7C,X 
    LDA.W $0F7A,X 
    SBC.W #$0002 
    STA.W $0F7A,X 
    BRA .checkOnScreen 


.right:
    LDA.W #$0000 
    CLC 
    ADC.W $0F7C,X 
    STA.W $0F7C,X 
    LDA.W #$0002 
    ADC.W $0F7A,X 
    STA.W $0F7A,X 

.checkOnScreen:
    JSL.L CheckIfEnemyIsHorizontallyOffScreen 
    BCS .respawn 
    RTL 


.respawn:
    LDA.W $0FAA,X : STA.W $0F7A,X 
    STZ.W $0F7C,X 
    LDA.W $0FAC,X : STA.W $0F7E,X 
    STA.W $0F80,X 
    STZ.W $0FB0,X 
    JSR.W Set_Zeb_Zebbo_InstList 
    LDA.W $0F86,X 
    ORA.W #$0100 
    STA.W $0F86,X 
    LDA.W #$0030 : STA.W $0FAE,X 
    LDA.W #Function_Zeb_Zebbo_SpawnDelay : STA.W $0FB2,X 
    RTL 


Function_Zeb_Zebbo_SpawnDelay:
    DEC.W $0FAE,X 
    BEQ .doneWaiting 
    RTL 


.doneWaiting:
    LDA.W #Function_Zeb_Zebbo_WaitForSamusToGetNear : STA.W $0FB2,X 
    RTL 


Set_Zeb_Zebbo_InstList:
    LDX.W $0E54 
    LDA.W $0FB0,X 
    CMP.L $7E7802,X 
    BEQ .return 
    STA.L $7E7802,X 
    ASL A 
    TAY 
    LDA.W $0FB4,X 
    BNE .zebbo 
    LDA.W InstListPointers_Zeb,Y 
    BRA + 


.zebbo:
    LDA.W InstListPointers_Zebbo,Y 

  + STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    STZ.W $0F90,X 

.return:
    RTS 


Spritemaps_Zeb_0:
    dw $0001,$81F8 
    db $F8 
    dw $2100 

Spritemaps_Zeb_1:
    dw $0001,$81F8 
    db $F8 
    dw $2102 

Spritemaps_Zeb_2:
    dw $0001,$81F8 
    db $F8 
    dw $2104 

Spritemaps_Zeb_3:
    dw $0001,$81F8 
    db $F8 
    dw $2106 

Spritemaps_Zeb_4:
    dw $0001,$81F8 
    db $F8 
    dw $2108 

Spritemaps_Zeb_5:
    dw $0001,$81F8 
    db $F8 
    dw $6100 

Spritemaps_Zeb_6:
    dw $0001,$81F8 
    db $F8 
    dw $6102 

Spritemaps_Zeb_7:
    dw $0001,$81F8 
    db $F8 
    dw $6104 

Spritemaps_Zeb_8:
    dw $0001,$81F8 
    db $F8 
    dw $6106 

Spritemaps_Zeb_9:
    dw $0001,$81F8 
    db $F8 
    dw $6108 

Palette_Zebbo:
    dw $3800,$3F95,$2E8B,$0120,$0060,$3AEE,$2249,$11A4 
    dw $0962,$39BB,$30F5,$2C6E,$2827,$7F93,$6ECE,$6229 

InstList_Zebbo_FacingLeft_Rising:
    dw $0002 
    dw Spritemaps_Zebbo_3 
    dw $0001 
    dw Spritemaps_Zebbo_4 
    dw $0002 
    dw Spritemaps_Zebbo_5 
    dw $0001 
    dw Spritemaps_Zebbo_4 
    dw Instruction_Common_GotoY 
    dw InstList_Zebbo_FacingLeft_Rising 

InstList_Zebbo_FacingLeft_Shooting:
    dw $0003 
    dw Spritemaps_Zebbo_0 
    dw $0003 
    dw Spritemaps_Zebbo_1 
    dw $0003 
    dw Spritemaps_Zebbo_2 
    dw $0003 
    dw Spritemaps_Zebbo_1 
    dw Instruction_Common_GotoY 
    dw InstList_Zebbo_FacingLeft_Shooting 

InstList_Zebbo_FacingRight_Rising:
    dw $0002 
    dw Spritemaps_Zebbo_9 
    dw $0001 
    dw Spritemaps_Zebbo_A 
    dw $0002 
    dw Spritemaps_Zebbo_B 
    dw $0001 
    dw Spritemaps_Zebbo_A 
    dw Instruction_Common_GotoY 
    dw InstList_Zebbo_FacingRight_Rising 

InstList_Zebbo_FacingRight_Shooting:
    dw $0003 
    dw Spritemaps_Zebbo_6 
    dw $0003 
    dw Spritemaps_Zebbo_7 
    dw $0003 
    dw Spritemaps_Zebbo_8 
    dw $0003 
    dw Spritemaps_Zebbo_7 
    dw Instruction_Common_GotoY 
    dw InstList_Zebbo_FacingRight_Shooting 

Spritemaps_Zebbo_0:
    dw $0001,$81F8 
    db $F8 
    dw $2100 

Spritemaps_Zebbo_1:
    dw $0001,$81F8 
    db $F8 
    dw $2102 

Spritemaps_Zebbo_2:
    dw $0001,$81F8 
    db $F8 
    dw $2104 

Spritemaps_Zebbo_3:
    dw $0001,$81F8 
    db $F8 
    dw $2106 

Spritemaps_Zebbo_4:
    dw $0001,$81F8 
    db $F8 
    dw $2108 

Spritemaps_Zebbo_5:
    dw $0001,$81F8 
    db $F8 
    dw $210A 

Spritemaps_Zebbo_6:
    dw $0001,$81F8 
    db $F8 
    dw $6100 

Spritemaps_Zebbo_7:
    dw $0001,$81F8 
    db $F8 
    dw $6102 

Spritemaps_Zebbo_8:
    dw $0001,$81F8 
    db $F8 
    dw $6104 

Spritemaps_Zebbo_9:
    dw $0001,$81F8 
    db $F8 
    dw $6106 

Spritemaps_Zebbo_A:
    dw $0001,$81F8 
    db $F8 
    dw $6108 

Spritemaps_Zebbo_B:
    dw $0001,$81F8 
    db $F8 
    dw $610A 

Palette_Gamet:
    dw $3800,$021D,$0015,$0008,$0003,$015F,$0076,$0050 
    dw $000B,$7FFF,$56E0,$3180,$18C0,$43FF,$42DC,$4176 

InstList_Gamet_FacingLeft_Rising:
    dw $0002 
    dw Spritemaps_Gamet_0 
    dw $0002 
    dw Spritemaps_Gamet_1 
    dw $0002 
    dw Spritemaps_Gamet_2 
    dw $0002 
    dw Spritemaps_Gamet_3 
    dw $0002 
    dw Spritemaps_Gamet_4 
    dw $0002 
    dw Spritemaps_Gamet_3 
    dw $0002 
    dw Spritemaps_Gamet_2 
    dw $0002 
    dw Spritemaps_Gamet_1 
    dw Instruction_Common_GotoY 
    dw InstList_Gamet_FacingLeft_Rising 

InstList_Gamet_FacingLeft_Shooting:
    dw $0001 
    dw Spritemaps_Gamet_0 
    dw $0001 
    dw Spritemaps_Gamet_1 
    dw $0001 
    dw Spritemaps_Gamet_3 
    dw $0001 
    dw Spritemaps_Gamet_4 
    dw $0001 
    dw Spritemaps_Gamet_3 
    dw $0001 
    dw Spritemaps_Gamet_1 
    dw Instruction_Common_GotoY 
    dw InstList_Gamet_FacingLeft_Shooting 

InstList_Gamet_FacingRight_Rising:
    dw $0002 
    dw Spritemaps_Gamet_5 
    dw $0002 
    dw Spritemaps_Gamet_6 
    dw $0002 
    dw Spritemaps_Gamet_7 
    dw $0002 
    dw Spritemaps_Gamet_8 
    dw $0002 
    dw Spritemaps_Gamet_9 
    dw $0002 
    dw Spritemaps_Gamet_8 
    dw $0002 
    dw Spritemaps_Gamet_7 
    dw $0002 
    dw Spritemaps_Gamet_6 
    dw Instruction_Common_GotoY 
    dw InstList_Gamet_FacingRight_Rising 

InstList_Gamet_FacingRight_Shooting:
    dw $0001 
    dw Spritemaps_Gamet_5 
    dw $0001 
    dw Spritemaps_Gamet_6 
    dw $0001 
    dw Spritemaps_Gamet_8 
    dw $0001 
    dw Spritemaps_Gamet_9 
    dw $0001 
    dw Spritemaps_Gamet_8 
    dw $0001 
    dw Spritemaps_Gamet_6 
    dw Instruction_Common_GotoY 
    dw InstList_Gamet_FacingRight_Shooting 

InitAI_Gamet:
    LDX.W $0E54 
    LDA.W $0F7A,X : STA.W $0FAE,X 
    LDA.W $0F7E,X : STA.W $0FB0,X 
    LDA.W $0F86,X 
    ORA.W #$0100 
    STA.W $0F86,X 
    LDA.W $0FB7,X 
    AND.W #$00FF 
    ASL #3
    STA.W $0FAA,X 
    STZ.W $0FAC,X 
    LDA.W #$0001 : STA.W $0F94,X 
    STZ.W $0F90,X 
    LDA.W #InstList_Gamet_FacingLeft_Rising : STA.W $0F92,X 
    LDA.W #Function_Gamet_WaitUntilAllReady : STA.W $0FA8,X 
    RTL 


MainAI_Gamet:
    LDX.W $0E54 
    JSR.W ($0FA8,X) 
    JSR.W ResetEnemyIfOffScreen 
    RTL 


ResetEnemyIfOffScreen:
    LDX.W $0E54 
    JSL.L CheckIfEnemyCenterIsOnScreen 
    BEQ .return 
    LDA.W $0F86,X 
    ORA.W #$0100 
    STA.W $0F86,X 
    LDA.W #Function_Gamet_WaitUntilAllReady : STA.W $0FA8,X 
    LDA.W $0FAE,X : STA.W $0F7A,X 
    LDA.W $0FB0,X : STA.W $0F7E,X 

.return:
    RTS 


Function_Gamet_WaitUntilAllReady:
    LDX.W $0E54 
    LDA.W $0FB6,X 
    AND.W #$00FF 
    BEQ .return 
    LDA.W $0FE8,X 
    CMP.W #Function_Gamet_WaitUntilAllReady 
    BNE .return 
    LDA.W $1028,X 
    CMP.W #Function_Gamet_WaitUntilAllReady 
    BNE .return 
    LDA.W $1068,X 
    CMP.W #Function_Gamet_WaitUntilAllReady 
    BNE .return 
    LDA.W $10A8,X 
    CMP.W #Function_Gamet_WaitUntilAllReady 
    BNE .return 
    LDA.W #Function_Gamet_WaitForSamusToGetNear : STA.W $0FA8,X 

.return:
    RTS 


Function_Gamet_WaitForSamusToGetNear:
    LDX.W $0E54 
    LDA.W $0FB6,X 
    AND.W #$00FF 
    JSL.L IsSamusWithinAPixelColumnsOfEnemy 
    BEQ .return 
    LDA.W $0F7E,X 
    CMP.W $0AFA 
    BMI .return 
    INC.W $0FAC,X 
    LDA.W #$0001 : STA.W $0F94,X 
    STZ.W $0F90,X 
    JSL.L Get_SamusX_minus_EnemyX 
    BPL .facingRight 
    LDA.W #InstList_Gamet_FacingLeft_Rising : STA.W $0F92,X 
    STA.W $0FD2,X 
    STA.W $1012,X 
    STA.W $1052,X 
    STA.W $1092,X 
    BRA .setupFormation 


.facingRight:
    LDA.W #InstList_Gamet_FacingRight_Rising : STA.W $0F92,X 
    STA.W $0FD2,X 
    STA.W $1012,X 
    STA.W $1052,X 
    STA.W $1092,X 

.setupFormation:
    JSR.W SetupGametFormation 

.return:
    RTS 


SetupGametFormation:
    LDA.W #Function_Gamet_Rising : STA.W $0FA8,X 
    STA.W $0FE8,X 
    STA.W $1028,X 
    STA.W $1068,X 
    STA.W $10A8,X 
    LDA.W #$0068 : STA.L $7E7804,X 
    LDA.W #$0060 : STA.L $7E7844,X 
    LDA.W #$0058 : STA.L $7E7884,X 
    LDA.W #$0070 : STA.L $7E78C4,X 
    LDA.W #$0078 : STA.L $7E7904,X 
    LDA.W #Function_Gamet_MoveToFormation_Center : STA.W $0FB2,X 
    LDA.W #Function_Gamet_MoveToFormation_UpperMiddle : STA.W $0FF2,X 
    LDA.W #Function_Gamet_MoveToFormation_Top : STA.W $1032,X 
    LDA.W #Function_Gamet_MoveToFormation_LowerMiddle : STA.W $1072,X 
    LDA.W #Function_Gamet_MoveToFormation_Bottom : STA.W $10B2,X 
    RTS 


Function_Gamet_Rising:
    LDX.W $0E54 
    LDA.W $0F86,X 
    AND.W #$FEFF 
    STA.W $0F86,X 
    LDA.W #$0080 
    TAY 
    LDA.W $0F80,X 
    CLC 
    ADC.W CommonEnemySpeeds_LinearlyIncreasing+6,Y 
    BCC + 
    INC.W $0F7E,X 

  + STA.W $0F80,X 
    LDA.W $0F7E,X 
    CLC 
    ADC.W CommonEnemySpeeds_LinearlyIncreasing+4,Y 
    STA.W $0F7E,X 
    CMP.W $0AFA 
    BPL .return 
    LDA.W $0FB2,X : STA.W $0FA8,X 
    LDA.W $0F7E,X : STA.L $7E7802,X 
    LDA.W #$0001 : STA.W $0F94,X 
    STZ.W $0F90,X 
    JSL.L Get_SamusX_minus_EnemyX 
    BPL .facingRight 
    LDA.W #InstList_Gamet_FacingLeft_Rising : STA.W $0F92,X 
    BRA .return 


.facingRight:
    LDA.W #InstList_Gamet_FacingRight_Rising : STA.W $0F92,X 

.return:
    RTS 


Function_Gamet_MoveToFormation_Center:
    LDX.W $0E54 
    INC.W $0FAC,X 
    LDA.W #Function_Gamet_ShootDelay : STA.W $0FA8,X 
    RTS 


Function_Gamet_MoveToFormation_UpperMiddle:
    LDX.W $0E54 
    INC.W $0FAC,X 
    LDA.W #$0080 
    TAY 
    LDA.W $0F80,X 
    CLC 
    ADC.W CommonEnemySpeeds_LinearlyIncreasing+6,Y 
    BCC + 
    INC.W $0F7E,X 

  + STA.W $0F80,X 
    LDA.W $0F7E,X 
    CLC 
    ADC.W CommonEnemySpeeds_LinearlyIncreasing+4,Y 
    STA.W $0F7E,X 
    CLC 
    ADC.W #$0010 
    CMP.L $7E7802,X 
    BPL .return 
    LDA.L $7E7802,X 
    SEC 
    SBC.W #$0010 
    STA.W $0F7E,X 
    STZ.W $0F80,X 
    LDA.W #Function_Gamet_ShootDelay : STA.W $0FA8,X 

.return:
    RTS 


Function_Gamet_MoveToFormation_Top:
    LDX.W $0E54 
    INC.W $0FAC,X 
    LDA.W #$0080 
    TAY 
    LDA.W $0F80,X 
    CLC 
    ADC.W CommonEnemySpeeds_LinearlyIncreasing+6,Y 
    BCC + 
    INC.W $0F7E,X 

  + STA.W $0F80,X 
    LDA.W $0F7E,X 
    CLC 
    ADC.W CommonEnemySpeeds_LinearlyIncreasing+4,Y 
    STA.W $0F7E,X 
    CLC 
    ADC.W #$0020 
    CMP.L $7E7802,X 
    BPL .return 
    LDA.L $7E7802,X 
    SEC 
    SBC.W #$0020 
    STA.W $0F7E,X 
    STZ.W $0F80,X 
    LDA.W #Function_Gamet_ShootDelay : STA.W $0FA8,X 

.return:
    RTS 


Function_Gamet_MoveToFormation_LowerMiddle:
    LDX.W $0E54 
    INC.W $0FAC,X 
    LDA.W #$0080 
    TAY 
    LDA.W $0F80,X 
    CLC 
    ADC.W CommonEnemySpeeds_LinearlyIncreasing+2,Y 
    BCC + 
    INC.W $0F7E,X 

  + STA.W $0F80,X 
    LDA.W $0F7E,X 
    CLC 
    ADC.W CommonEnemySpeeds_LinearlyIncreasing,Y 
    STA.W $0F7E,X 
    SEC 
    SBC.W #$0010 
    CMP.L $7E7802,X 
    BMI .return 
    LDA.L $7E7802,X 
    CLC 
    ADC.W #$0010 
    STA.W $0F7E,X 
    STZ.W $0F80,X 
    LDA.W #Function_Gamet_ShootDelay : STA.W $0FA8,X 

.return:
    RTS 


Function_Gamet_MoveToFormation_Bottom:
    LDX.W $0E54 
    INC.W $0FAC,X 
    LDA.W #$0080 
    TAY 
    LDA.W $0F80,X 
    CLC 
    ADC.W CommonEnemySpeeds_LinearlyIncreasing+2,Y 
    BCC + 
    INC.W $0F7E,X 

  + STA.W $0F80,X 
    LDA.W $0F7E,X 
    CLC 
    ADC.W CommonEnemySpeeds_LinearlyIncreasing,Y 
    STA.W $0F7E,X 
    SEC 
    SBC.W #$0020 
    CMP.L $7E7802,X 
    BMI .return 
    LDA.L $7E7802,X 
    CLC 
    ADC.W #$0020 
    STA.W $0F7E,X 
    STZ.W $0F80,X 
    LDA.W #Function_Gamet_ShootDelay : STA.W $0FA8,X 

.return:
    RTS 


Function_Gamet_ShootingLeft:
    LDX.W $0E54 
    LDA.W $0FAA,X 
    TAY 
    LDA.W $0F7C,X 
    CLC 
    ADC.W CommonEnemySpeeds_LinearlyIncreasing+6,Y 
    BCC + 
    INC.W $0F7A,X 

  + STA.W $0F7C,X 
    LDA.W $0F7A,X 
    CLC 
    ADC.W CommonEnemySpeeds_LinearlyIncreasing+4,Y 
    STA.W $0F7A,X 
    RTS 


Function_Gamet_ShootingRight:
    LDX.W $0E54 
    LDA.W $0FAA,X 
    TAY 
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


if !FEATURE_KEEP_UNREFERENCED
UNUSED_LoadEnemyIndex_B38E56:
    LDX.W $0E54 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


Function_Gamet_ShootDelay:
    LDX.W $0E54 
    INC.W $0FAC,X 
    LDA.W $0FAC,X 
    CMP.L $7E7804,X 
    BMI .return 
    STZ.W $0FAC,X 
    LDA.W #$0001 : STA.W $0F94,X 
    STZ.W $0F90,X 
    LDA.W #Function_Gamet_ShootingLeft : STA.W $0FA8,X 
    LDA.W #InstList_Gamet_FacingLeft_Shooting : STA.W $0F92,X 
    JSL.L Get_SamusX_minus_EnemyX 
    BMI .return 
    LDA.W #Function_Gamet_ShootingRight : STA.W $0FA8,X 
    LDA.W #InstList_Gamet_FacingRight_Shooting : STA.W $0F92,X 

.return:
    RTS 


RTL_B38E94:
    RTL 


RTL_B38E95:
    RTL 


Spritemaps_Gamet_0:
    dw $0001,$81F8 
    db $F8 
    dw $2100 

Spritemaps_Gamet_1:
    dw $0001,$81F8 
    db $F8 
    dw $2102 

Spritemaps_Gamet_2:
    dw $0001,$81F8 
    db $F8 
    dw $2104 

Spritemaps_Gamet_3:
    dw $0001,$81F8 
    db $F8 
    dw $2106 

Spritemaps_Gamet_4:
    dw $0001,$81F8 
    db $F8 
    dw $2108 

Spritemaps_Gamet_5:
    dw $0001,$81F8 
    db $F8 
    dw $6100 

Spritemaps_Gamet_6:
    dw $0001,$81F8 
    db $F8 
    dw $6102 

Spritemaps_Gamet_7:
    dw $0001,$81F8 
    db $F8 
    dw $6104 

Spritemaps_Gamet_8:
    dw $0001,$81F8 
    db $F8 
    dw $6106 

Spritemaps_Gamet_9:
    dw $0001,$81F8 
    db $F8 
    dw $6108 

Palette_Geega:
    dw $3800,$57FF,$42F7,$158C,$00A5,$4F5A,$36B5,$2610 
    dw $1DCE,$3FE0,$2EE0,$2200,$1100,$7E5B,$552F,$2887 

InstList_Geega_FacingLeft_Rising:
    dw $0004 
    dw Spritemaps_Geega_0 
    dw $0004 
    dw Spritemaps_Geega_1 
    dw $0004 
    dw Spritemaps_Geega_2 
    dw $0004 
    dw Spritemaps_Geega_1 
    dw Instruction_Common_GotoY 
    dw InstList_Geega_FacingLeft_Rising 

InstList_Geega_FacingLeft_Shooting:
    dw $0001 
    dw Spritemaps_Geega_3 
    dw $0001 
    dw Spritemaps_Geega_4 
    dw $0001 
    dw Spritemaps_Geega_5 
    dw $0001 
    dw Spritemaps_Geega_4 
    dw Instruction_Common_GotoY 
    dw InstList_Geega_FacingLeft_Shooting 

InstList_Geega_FacingRight_Rising:
    dw $0004 
    dw Spritemaps_Geega_6 
    dw $0004 
    dw Spritemaps_Geega_7 
    dw $0004 
    dw Spritemaps_Geega_8 
    dw $0004 
    dw Spritemaps_Geega_7 
    dw Instruction_Common_GotoY 
    dw InstList_Geega_FacingRight_Rising 

InstList_Geega_FacingRight_Shooting:
    dw $0001 
    dw Spritemaps_Geega_9 
    dw $0001 
    dw Spritemaps_Geega_A 
    dw $0001 
    dw Spritemaps_Geega_B 
    dw $0001 
    dw Spritemaps_Geega_A 
    dw Instruction_Common_GotoY 
    dw InstList_Geega_FacingRight_Shooting 

InitAI_Geega:
    LDX.W $0E54 
    LDA.W $0F7A,X : STA.L $7E780E,X 
    LDA.W $0F7E,X : STA.L $7E7810,X 
    STZ.W $0F7C,X 
    STZ.W $0F80,X 
    LDA.W #$0001 : STA.W $0F94,X 
    STZ.W $0F90,X 
    LDA.W #InstList_Geega_FacingLeft_Rising : STA.W $0F92,X 
    LDA.W $0FB4,X 
    BNE + 
    LDA.W #InstList_Geega_FacingRight_Rising : STA.W $0F92,X 

  + LDA.W $0FB6,X 
    ASL #3
    TAY 
    LDA.W CommonEnemySpeeds_LinearlyIncreasing,Y : STA.L $7E7802,X 
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+2,Y : STA.L $7E7800,X 
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+4,Y : STA.L $7E7806,X 
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+6,Y : STA.L $7E7804,X 
    LDA.W #Function_Geega_WaitForSamusToGetNear : STA.W $0FA8,X 
    LDA.W #$0000 : STA.L $7E780C,X 
    RTL 


MainAI_Geega:
    LDX.W $0E54 
    JSR.W ($0FA8,X) 
    RTL 


Function_Geega_WaitForSamusToGetNear:
    LDX.W $0E54 
    LDA.W $0FB4,X 
    BNE .leftwards 
    JSL.L Get_SamusX_minus_EnemyX 
    BMI .return 
    CMP.W #$00C0 
    BPL .return 
    BRA + 


.leftwards:
    JSL.L Get_SamusX_minus_EnemyX 
    BPL .return 
    CMP.W #$FF40 
    BMI .return 

  + LDA.W #$0030 
    JSL.L IsSamusWithingAPixelRowsOfEnemy 
    BEQ .return 
    LDA.W $0F86,X 
    AND.W #$FEFF 
    STA.W $0F86,X 
    LDA.W #$0018 : STA.L $7E8000,X 
    LDA.W #Function_Geega_ShootDelay : STA.W $0FA8,X 

.return:
    RTS 


Function_Geega_ShootDelay:
    LDA.L $7E8000,X 
    DEC A 
    STA.L $7E8000,X 
    BEQ .timerExpired 
    RTS 


.timerExpired:
    LDA.W #$0001 : STA.W $0F94,X 
    STZ.W $0F90,X 
    LDA.W #InstList_Geega_FacingLeft_Rising : STA.W $0F92,X 
    LDA.W #Function_Geega_ShootingLeft : STA.W $0FA8,X 
    LDA.W $0FB4,X 
    BNE .return 
    LDA.W #InstList_Geega_FacingRight_Rising : STA.W $0F92,X 
    LDA.W #Function_Geega_ShootingRight : STA.W $0FA8,X 

.return:
    RTS 


Function_Geega_ShootingLeft:
    LDX.W $0E54 
    JSR.W MoveGeegaLeft 
    JSL.L CheckIfEnemyCenterIsOnScreen 
    BEQ .onScreen 
    LDA.L $7E780E,X : STA.W $0F7A,X 
    LDA.L $7E7810,X : STA.W $0F7E,X 
    STZ.W $0F7C,X 
    STZ.W $0F80,X 
    LDA.W #Function_Geega_WaitForSamusToGetNear : STA.W $0FA8,X 
    LDA.W #$0000 : STA.L $7E780C,X 
    LDA.W $0F86,X 
    ORA.W #$0100 
    STA.W $0F86,X 
    BRA .return 


.onScreen:
    LDA.L $7E780C,X 
    BNE .return 
    LDA.W $0F7A,X 
    SEC 
    SBC.W $0AF6 
    CMP.W #$0030 
    BPL .return 
    LDA.W #Function_Geega_DippingLeft : STA.W $0FA8,X 
    STZ.W $0FAC,X 
    STZ.W $0FAE,X 
    LDA.W #$0028 : STA.W $0FB0,X 
    LDA.W #$0001 : STA.W $0FB2,X 
    LDA.W $0F7A,X : STA.L $7E7808,X 
    LDA.W #$0001 : STA.W $0F94,X 
    STZ.W $0F90,X 
    LDA.W #InstList_Geega_FacingLeft_Shooting : STA.W $0F92,X 

.return:
    RTS 


MoveGeegaLeft:
    LDA.W $0F7C,X 
    CLC 
    ADC.L $7E7804,X 
    BCC + 
    INC.W $0F7A,X 

  + STA.W $0F7C,X 
    LDA.W $0F7A,X 
    CLC 
    ADC.L $7E7806,X 
    STA.W $0F7A,X 
    RTS 


Function_Geega_ShootingRight:
    LDX.W $0E54 
    JSR.W MoveGeegaRight 
    JSL.L CheckIfEnemyCenterIsOnScreen 
    BEQ .onScreen 
    LDA.L $7E780E,X : STA.W $0F7A,X 
    LDA.L $7E7810,X : STA.W $0F7E,X 
    STZ.W $0F7C,X 
    STZ.W $0F80,X 
    LDA.W #Function_Geega_WaitForSamusToGetNear : STA.W $0FA8,X 
    LDA.W #$0000 : STA.L $7E780C,X 
    LDA.W $0F86,X 
    ORA.W #$0100 
    STA.W $0F86,X 
    BRA .return 


.onScreen:
    LDA.L $7E780C,X 
    BNE .return 
    LDA.W $0F7A,X 
    SEC 
    SBC.W $0AF6 
    EOR.W #$FFFF 
    INC A 
    CMP.W #$0030 
    BPL .return 
    LDA.W #Function_Geega_DippingRight : STA.W $0FA8,X 
    STZ.W $0FAC,X 
    STZ.W $0FAE,X 
    LDA.W #$0028 : STA.W $0FB0,X 
    LDA.W #$0001 : STA.W $0FB2,X 
    LDA.W $0F7A,X : STA.L $7E7808,X 
    LDA.W #$0001 : STA.W $0F94,X 
    STZ.W $0F90,X 
    LDA.W #InstList_Geega_FacingRight_Shooting : STA.W $0F92,X 

.return:
    RTS 


MoveGeegaRight:
    LDA.W $0FAA,X 
    TAY 
    LDA.W $0F7C,X 
    CLC 
    ADC.L $7E7800,X 
    BCC + 
    INC.W $0F7A,X 

  + STA.W $0F7C,X 
    LDA.W $0F7A,X 
    CLC 
    ADC.L $7E7802,X 
    STA.W $0F7A,X 
    RTS 


Function_Geega_DippingLeft:
    LDX.W $0E54 
    JSL.L CheckIfEnemyCenterIsOnScreen 
    BEQ .onScreen 
    LDA.L $7E780E,X : STA.W $0F7A,X 
    LDA.L $7E7810,X : STA.W $0F7E,X 
    STZ.W $0F7C,X 
    STZ.W $0F80,X 
    LDA.W #Function_Geega_WaitForSamusToGetNear : STA.W $0FA8,X 
    LDA.W #$0000 : STA.L $7E780C,X 
    LDA.W #$0001 : STA.W $0F94,X 
    STZ.W $0F90,X 
    LDA.W #InstList_Geega_FacingLeft_Rising : STA.W $0F92,X 
    LDA.W $0F86,X 
    ORA.W #$0100 
    STA.W $0F86,X 
    JMP.W .return 


.onScreen:
    JSR.W MoveGeegaLeft 
    LDA.W $0FB2,X 
    BNE .moveDown 
    JSR.W MoveGeegaUp 
    LDA.W $0F7E,X 
    CMP.L $7E7810,X 
    BPL .return 
    LDA.W #$0001 : STA.L $7E780C,X 
    STA.W $0FB2,X 
    LDA.W #Function_Geega_ShootingLeft : STA.W $0FA8,X 
    LDA.W #$0001 : STA.W $0F94,X 
    STZ.W $0F90,X 
    LDA.W #InstList_Geega_FacingLeft_Rising : STA.W $0F92,X 
    BRA .return 


.moveDown:
    JSR.W MoveGeegaDown 

.return:
    RTS 


Function_Geega_DippingRight:
    LDX.W $0E54 
    JSL.L CheckIfEnemyCenterIsOnScreen 
    BEQ .onScreen 
    LDA.L $7E780E,X : STA.W $0F7A,X 
    LDA.L $7E7810,X : STA.W $0F7E,X 
    STZ.W $0F7C,X 
    STZ.W $0F80,X 
    LDA.W #Function_Geega_WaitForSamusToGetNear : STA.W $0FA8,X 
    LDA.W #$0000 : STA.L $7E780C,X 
    LDA.W #$0001 : STA.W $0F94,X 
    STZ.W $0F90,X 
    LDA.W #InstList_Geega_FacingRight_Rising : STA.W $0F92,X 
    LDA.W $0F86,X 
    ORA.W #$0100 
    STA.W $0F86,X 
    JMP.W .return 


.onScreen:
    JSR.W MoveGeegaRight 
    LDA.W $0FB2,X 
    BNE .moveDown 
    JSR.W MoveGeegaUp 
    LDA.L $7E7810,X 
    CMP.W $0F7E,X 
    BMI .return 
    LDA.W #$0001 : STA.L $7E780C,X 
    STA.W $0FB2,X 
    LDA.W #$0001 : STA.W $0F94,X 
    STZ.W $0F90,X 
    LDA.W #InstList_Geega_FacingRight_Rising : STA.W $0F92,X 
    LDA.W #Function_Geega_ShootingRight : STA.W $0FA8,X 
    BRA .return 


.moveDown:
    JSR.W MoveGeegaDown 

.return:
    RTS 


MoveGeegaUp:
    INC.W $0FB0,X 
    LDA.W $0FB0,X 
    ASL #3
    TAY 
    LDA.W $0F80,X 
    CLC 
    ADC.W CommonEnemySpeeds_QuadraticallyIncreasing+4,Y 
    BCC + 
    INC.W $0F7E,X 

  + STA.W $0F80,X 
    LDA.W $0F7E,X 
    CLC 
    ADC.W CommonEnemySpeeds_QuadraticallyIncreasing+6,Y 
    STA.W $0F7E,X 
    RTS 


MoveGeegaDown:
    DEC.W $0FB0,X 
    BPL + 
    LDA.W #$0000 : STA.W $0FB0,X 
    STA.W $0FB2,X 
    BRA .return 


  + LDA.W $0FB0,X 
    ASL #3
    TAY 
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

.return:
    RTS 


RTL_B392AB:
    RTL 


RTL_B392AC:
    RTL 


Spritemaps_Geega_0:
    db $01,$00,$F8,$C3,$F8,$00,$21 

Spritemaps_Geega_1:
    db $01,$00,$F8,$C3,$F8,$02,$21 

Spritemaps_Geega_2:
    db $01,$00,$F8,$C3,$F8,$04,$21 

Spritemaps_Geega_3:
    db $01,$00,$F8,$C3,$F8,$06,$21 

Spritemaps_Geega_4:
    db $01,$00,$F8,$C3,$F8,$08,$21 

Spritemaps_Geega_5:
    db $01,$00,$F8,$C3,$F8,$0A,$21 

Spritemaps_Geega_6:
    db $01,$00,$F8,$C3,$F8,$00,$61 

Spritemaps_Geega_7:
    db $01,$00,$F8,$C3,$F8,$02,$61 

Spritemaps_Geega_8:
    db $01,$00,$F8,$C3,$F8,$04,$61 

Spritemaps_Geega_9:
    db $01,$00,$F8,$C3,$F8,$06,$61 

Spritemaps_Geega_A:
    db $01,$00,$F8,$C3,$F8,$08,$61 

Spritemaps_Geega_B:
    db $01,$00,$F8,$C3,$F8,$0A,$61 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_SpritemapPointers_Geega_B39301:
    dw Spritemaps_Geega_0 
    dw Spritemaps_Geega_1 
    dw Spritemaps_Geega_2 
    dw Spritemaps_Geega_3 
    dw Spritemaps_Geega_4 
    dw Spritemaps_Geega_5 
    dw Spritemaps_Geega_6 
    dw Spritemaps_Geega_7 
    dw Spritemaps_Geega_8 
    dw Spritemaps_Geega_9 
    dw Spritemaps_Geega_A 
    dw Spritemaps_Geega_B 
endif ; !FEATURE_KEEP_UNREFERENCED

Palette_Botwoon:
    dw $0000,$27E9,$1A66,$1585,$0CA3,$3F9C,$2E97,$1D72 
    dw $108E,$0A5F,$09DB,$0956,$08D2,$082C,$7FBD,$0C05 

InstList_Botwoon_MouthClosed_AimingUp_FacingLeft:
    dw Instruction_Botwoon_EnemyRadius_8x10 
    dw $0001 
    dw Spritemaps_Botwoon_MouthClosed_Priority2_AimingUp_FacingLeft 
    dw Instruction_Common_Sleep 

InstList_Botwoon_MouthClosed_AimingUpLeft:
    dw Instruction_Botwoon_EnemyRadius_CxC 
    dw $0001 
    dw Spritemaps_Botwoon_MouthClosed_Priority2_AimingUpLeft 
    dw Instruction_Common_Sleep 

InstList_Botwoon_MouthClosed_AimingLeft:
    dw Instruction_Botwoon_EnemyRadius_10x8 
    dw $0001 
    dw Spritemaps_Botwoon_MouthClosed_Priority2_AimingLeft 
    dw Instruction_Common_Sleep 

InstList_Botwoon_MouthClosed_AimingDownLeft:
    dw Instruction_Botwoon_EnemyRadius_CxC_duplicate 
    dw $0001 
    dw Spritemaps_Botwoon_MouthClosed_Priority2_AimingDownLeft 
    dw Instruction_Common_Sleep 

UNSUED_InstList_Botwoon_MouthClosed_AimDown_FaceLeft_B39359:
    dw Instruction_Botwoon_EnemyRadius_8x10_duplicate 
    dw $0001 
    dw Spritemaps_Botwoon_MouthClosed_Priority2_AimDown_FacingLeft 
    dw Instruction_Common_Sleep 

InstList_Botwoon_MouthClosed_AimingDown_FacingRight:
    dw Instruction_Botwoon_EnemyRadius_8x10_duplicate_again 
    dw $0001 
    dw Spritemaps_Botwoon_MouthClosed_Priority2_AimDown_FacingRight 
    dw Instruction_Common_Sleep 

InstList_Botwoon_MouthClosed_AimingDownRight:
    dw Instruction_Botwoon_EnemyRadius_CxC_duplicate_again 
    dw $0001 
    dw Spritemaps_Botwoon_MouthClosed_Priority2_AimingDownRight 
    dw Instruction_Common_Sleep 

InstList_Botwoon_MouthClosed_AimingRight:
    dw Instruction_Botwoon_EnemyRadius_10x8_duplicate 
    dw $0001 
    dw Spritemaps_Botwoon_MouthClosed_Priority2_AimingRight 
    dw Instruction_Common_Sleep 

InstList_Botwoon_MouthClosed_AimingUpRight:
    dw Instruction_Botwoon_EnemyRadius_CxC_duplicate_again2 
    dw $0001 
    dw Spritemaps_Botwoon_MouthClosed_Priority2_AimingUpRight 
    dw Instruction_Common_Sleep 

InstList_Botwoon_MouthClosed_AimingUp_FacingRight:
    dw Instruction_Botwoon_EnemyRadius_8x10_duplicate_again2 
    dw $0001 
    dw Spritemaps_Botwoon_MouthClosed_Priority2_AimUp_FacingRight 
    dw Instruction_Common_Sleep 

InstList_Botwoon_Hide:
    dw $0001 
    dw Spritemap_Common_Nothing 
    dw Instruction_Common_Sleep 

UNSUED_InstList_Botwoon_Spit_AimingUp_FacingLeft:
    dw $0020 
    dw Spritemaps_Botwoon_MouthClosed_Priority2_AimingUp_FacingLeft 
    dw Instruction_Botwoon_EnemyRadius_8x10 
    dw Instruction_Botwoon_QueueSpitSFX 
    dw Instruction_Botwoon_SetSpittingFlag 
    dw $0010 
    dw Spritemaps_Botwoon_MouthOpen_Priority2_AimingUp_FacingLeft 
    dw Instruction_Common_Sleep 

InstList_Botwoon_Spit_AimingUpLeft:
    dw $0020 
    dw Spritemaps_Botwoon_MouthClosed_Priority2_AimingUpLeft 
    dw Instruction_Botwoon_EnemyRadius_CxC 
    dw Instruction_Botwoon_QueueSpitSFX 
    dw Instruction_Botwoon_SetSpittingFlag 
    dw $0010 
    dw Spritemaps_Botwoon_MouthOpen_Priority2_AimingUpLeft 
    dw Instruction_Common_Sleep 

InstList_Botwoon_Spit_AimingLeft:
    dw $0020 
    dw Spritemaps_Botwoon_MouthClosed_Priority2_AimingLeft 
    dw Instruction_Botwoon_EnemyRadius_10x8 
    dw Instruction_Botwoon_QueueSpitSFX 
    dw Instruction_Botwoon_SetSpittingFlag 
    dw $0019 
    dw Spritemaps_Botwoon_MouthOpen_Priority2_AimingLeft 
    dw Instruction_Common_Sleep 

InstList_Botwoon_Spit_AimingDownLeft:
    dw $0020 
    dw Spritemaps_Botwoon_MouthClosed_Priority2_AimingDownLeft 
    dw Instruction_Botwoon_EnemyRadius_CxC_duplicate 
    dw Instruction_Botwoon_QueueSpitSFX 
    dw Instruction_Botwoon_SetSpittingFlag 
    dw $0010 
    dw Spritemaps_Botwoon_MouthOpen_Priority2_AimingDownLeft 
    dw Instruction_Common_Sleep 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_Botwoon_Spit_AimingDown_FacingLeft_B393CF:
    dw $0020 
    dw Spritemaps_Botwoon_MouthClosed_Priority2_AimDown_FacingLeft 
    dw Instruction_Botwoon_EnemyRadius_8x10_duplicate 
    dw Instruction_Botwoon_QueueSpitSFX 
    dw Instruction_Botwoon_SetSpittingFlag 
    dw $0010 
    dw Spritemaps_Botwoon_MouthOpen_Priority2_AimingDown_FacingLeft 
    dw Instruction_Common_Sleep 
endif ; !FEATURE_KEEP_UNREFERENCED

InstList_Botwoon_Spit_AimingDown_FacingRight:
    dw $0020 
    dw Spritemaps_Botwoon_MouthClosed_Priority2_AimDown_FacingRight 
    dw Instruction_Botwoon_EnemyRadius_8x10_duplicate_again 
    dw Instruction_Botwoon_QueueSpitSFX 
    dw Instruction_Botwoon_SetSpittingFlag 
    dw $0010 
    dw Spritemaps_Botwoon_MouthOpen_Priority2_AimDown_FacingRight 
    dw Instruction_Common_Sleep 

InstList_Botwoon_Spit_AimingDownRight:
    dw $0020 
    dw Spritemaps_Botwoon_MouthClosed_Priority2_AimingDownRight 
    dw Instruction_Botwoon_EnemyRadius_CxC_duplicate_again 
    dw Instruction_Botwoon_QueueSpitSFX 
    dw Instruction_Botwoon_SetSpittingFlag 
    dw $0010 
    dw Spritemaps_Botwoon_MouthOpen_Priority2_AimingDownRight 
    dw Instruction_Common_Sleep 

InstList_Botwoon_Spit_AimingRight:
    dw $0020 
    dw Spritemaps_Botwoon_MouthClosed_Priority2_AimingRight 
    dw Instruction_Botwoon_EnemyRadius_10x8_duplicate 
    dw Instruction_Botwoon_QueueSpitSFX 
    dw Instruction_Botwoon_SetSpittingFlag 
    dw $0010 
    dw Spritemaps_Botwoon_MouthOpen_Priority2_AimingRight 
    dw Instruction_Common_Sleep 

InstList_Botwoon_Spit_AimingUpRight:
    dw $0020 
    dw Spritemaps_Botwoon_MouthClosed_Priority2_AimingUpRight 
    dw Instruction_Botwoon_EnemyRadius_CxC_duplicate_again2 
    dw Instruction_Botwoon_QueueSpitSFX 
    dw Instruction_Botwoon_SetSpittingFlag 
    dw $0010 
    dw Spritemaps_Botwoon_MouthOpen_Priority2_AimingUpRight 
    dw Instruction_Common_Sleep 

InstList_Botwoon_Spit_AimingUp_FacingRight:
    dw $0020 
    dw Spritemaps_Botwoon_MouthClosed_Priority2_AimUp_FacingRight 
    dw Instruction_Botwoon_EnemyRadius_8x10_duplicate_again2 
    dw Instruction_Botwoon_QueueSpitSFX 
    dw Instruction_Botwoon_SetSpittingFlag 
    dw $0010 
    dw Spritemaps_Botwoon_MouthOpen_Priority2_AimingUp_FacingRight 
    dw Instruction_Common_Sleep 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_Botwoon_Hidden_AimingUp_FacingLeft_B3942F:
    dw $0001 
    dw Spritemaps_Botwoon_MouthClosed_Priority0_AimingUp_FacingLeft 
    dw Instruction_Common_Sleep 
endif ; !FEATURE_KEEP_UNREFERENCED

InstList_Botwoon_Hidden_AimingUpLeft:
    dw $0001 
    dw Spritemaps_Botwoon_MouthClosed_Priority0_AimingUpLeft 
    dw Instruction_Common_Sleep 

InstList_Botwoon_Hidden_AimingLeft:
    dw $0001 
    dw Spritemaps_Botwoon_MouthClosed_Priority0_AimingLeft 
    dw Instruction_Common_Sleep 

InstList_Botwoon_Hidden_AimingDownLeft:
    dw $0001 
    dw Spritemaps_Botwoon_MouthClosed_Priority0_AimingDownLeft 
    dw Instruction_Common_Sleep 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_Botwoon_Hidden_AimingDown_FacingLeft_B39447:
    dw $0001 
    dw Spritemaps_Botwoon_MouthClosed_Priority0_AimDown_FacingLeft 
    dw Instruction_Common_Sleep 
endif ; !FEATURE_KEEP_UNREFERENCED

InstList_Botwoon_Hidden_AimingDown_FacingRight:
    dw $0001 
    dw Spritemaps_Botwoon_MouthClosed_Priority0_AimDown_FacingRight 
    dw Instruction_Common_Sleep 

InstList_Botwoon_Hidden_AimingDownRight:
    dw $0001 
    dw Spritemaps_Botwoon_MouthClosed_Priority0_AimingDownRight 
    dw Instruction_Common_Sleep 

InstList_Botwoon_Hidden_AimingRight:
    dw $0001 
    dw Spritemaps_Botwoon_MouthClosed_Priority0_AimingRight 
    dw Instruction_Common_Sleep 

InstList_Botwoon_Hidden_AimingUpRight:
    dw $0001 
    dw Spritemaps_Botwoon_MouthClosed_Priority0_AimingUpRight 
    dw Instruction_Common_Sleep 

InstList_Botwoon_Hidden_AimingUp_FacingRIght:
    dw $0001 
    dw Spritemaps_Botwoon_MouthClosed_Priority0_AimUp_FacingRight 
    dw Instruction_Common_Sleep 

InstListPointers_Botwoon:
    dw InstList_Botwoon_MouthClosed_AimingUp_FacingRight 
    dw InstList_Botwoon_MouthClosed_AimingUpRight 
    dw InstList_Botwoon_MouthClosed_AimingRight 
    dw InstList_Botwoon_MouthClosed_AimingDownRight 
    dw InstList_Botwoon_MouthClosed_AimingDown_FacingRight 
    dw InstList_Botwoon_MouthClosed_AimingDownLeft 
    dw InstList_Botwoon_MouthClosed_AimingLeft 
    dw InstList_Botwoon_MouthClosed_AimingUpLeft 
    dw InstList_Botwoon_Hide 
    dw InstList_Botwoon_Hide 
    dw InstList_Botwoon_Hide 
    dw InstList_Botwoon_Hide 
    dw InstList_Botwoon_Hide 
    dw InstList_Botwoon_Hide 
    dw InstList_Botwoon_Hide 
    dw InstList_Botwoon_Hide 

InstListPointers_Botwoon_spit:
    dw InstList_Botwoon_Spit_AimingUp_FacingRight 
    dw InstList_Botwoon_Spit_AimingUpRight 
    dw InstList_Botwoon_Spit_AimingRight 
    dw InstList_Botwoon_Spit_AimingDownRight 
    dw InstList_Botwoon_Spit_AimingDown_FacingRight 
    dw InstList_Botwoon_Spit_AimingDownLeft 
    dw InstList_Botwoon_Spit_AimingLeft 
    dw InstList_Botwoon_Spit_AimingUpLeft 

BotwoonHoleHitboxes_leftBoundary:
    dw $003C 

BotwoonHoleHitboxes_rightBoundary:
    dw $0044 

BotwoonHoleHitboxes_topBoundary:
    dw $006C 

BotwoonHoleHitboxes_bottomBoundary:
    dw $0074,$007C,$0084,$00AC,$00B4,$009C,$00A4,$005C 
    dw $0064,$00DC,$00E4,$008C,$0094 

BotwoonSpeedTable_speed:
    dw $0002 

BotwoonSpeedTable_bodyTravelTime:
    dw $0018,$0003,$0010,$0004,$000C 

Instruction_Botwoon_EnemyRadius_8x10:
    LDX.W $0E54 
    LDA.W #$0008 : STA.W $0F82,X 
    LDA.W #$0010 : STA.W $0F84,X 
    RTL 


Instruction_Botwoon_EnemyRadius_CxC:
    LDX.W $0E54 
    LDA.W #$000C : STA.W $0F82,X 
    LDA.W #$000C : STA.W $0F84,X 
    RTL 


Instruction_Botwoon_EnemyRadius_10x8:
    LDX.W $0E54 
    LDA.W #$0010 : STA.W $0F82,X 
    LDA.W #$0008 : STA.W $0F84,X 
    RTL 


Instruction_Botwoon_EnemyRadius_CxC_duplicate:
    LDX.W $0E54 
    LDA.W #$000C : STA.W $0F82,X 
    LDA.W #$000C : STA.W $0F84,X 
    RTL 


Instruction_Botwoon_EnemyRadius_8x10_duplicate:
    LDX.W $0E54 
    LDA.W #$0008 : STA.W $0F82,X 
    LDA.W #$0010 : STA.W $0F84,X 
    RTL 


Instruction_Botwoon_EnemyRadius_8x10_duplicate_again:
    LDX.W $0E54 
    LDA.W #$0008 : STA.W $0F82,X 
    LDA.W #$0010 : STA.W $0F84,X 
    RTL 


Instruction_Botwoon_EnemyRadius_CxC_duplicate_again:
    LDX.W $0E54 
    LDA.W #$000C : STA.W $0F82,X 
    LDA.W #$000C : STA.W $0F84,X 
    RTL 


Instruction_Botwoon_EnemyRadius_10x8_duplicate:
    LDX.W $0E54 
    LDA.W #$0010 : STA.W $0F82,X 
    LDA.W #$0008 : STA.W $0F84,X 
    RTL 


Instruction_Botwoon_EnemyRadius_CxC_duplicate_again2:
    LDX.W $0E54 
    LDA.W #$000C : STA.W $0F82,X 
    LDA.W #$000C : STA.W $0F84,X 
    RTL 


Instruction_Botwoon_EnemyRadius_8x10_duplicate_again2:
    LDX.W $0E54 
    LDA.W #$0008 : STA.W $0F82,X 
    LDA.W #$0010 : STA.W $0F84,X 
    RTL 


Instruction_Botwoon_SetSpittingFlag:
    LDX.W $0E54 
    LDA.W #$0001 : STA.L $7E8834,X 
    RTL 


Instruction_Botwoon_QueueSpitSFX:
    LDA.W #$007C 
    JSL.L QueueSound_Lib2_Max6 
    RTL 


RTL_B3957A:
    RTL 


QueueSmallExplosionSFX:
    LDA.W #$0024 
    JSL.L QueueSound_Lib2_Max6 
    RTL 


InitAI_Botwoon:
    LDA.L $7ED82C 
    AND.W #$0002 
    BEQ .notDead 
    LDX.W $0E54 
    JSL.L Spawn_Hardcoded_PLM 
    db $0F,$04 
    dw PLMEntries_clearBotwoonWall 
    LDA.W #$0101 : STA.L $7ECD20 
    LDA.W #InstList_Botwoon_Hide : STA.W $0F92,X 
    LDA.W $0F86,X 
    ORA.W #$0200 
    STA.W $0F86,X 
    JMP.W .return 


.notDead:
    LDX.W $0E54 
    LDA.W #$0018 : STA.W $0FA8,X 

.loop:
    LDY.W #EnemyProjectile_BotwoonsBody 
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    LDX.W $0E54 
    DEC.W $0FA8,X 
    DEC.W $0FA8,X 
    BPL .loop 
    LDA.W #InstList_Botwoon_Hide : STA.W $0F92,X 
    STA.L $7E8036,X 
    LDA.W #Function_Botwoon_Initial : STA.W $0FAE,X 
    LDA.W #Function_Botwoon_Movement_DirectlyTowardTargetHole : STA.W $0FB0,X 
    LDA.W #Function_Botwoon_Head_MovingAround : STA.W $0FB2,X 
    LDA.W #$0100 : STA.L $7E8000,X 
    LDA.W BotwoonSpeedTable_speed : STA.L $7E8030,X 
    LDA.W BotwoonSpeedTable_bodyTravelTime : STA.W $0FAC,X 
    LDA.W #$0001 : STA.L $7E8026,X 
    STA.L $7E8028,X 
    STA.L $7E8832,X 
    LDA.W #$FFFF : STA.L $7E802C,X 
    LDA.W #$0000 : STA.L $7E802E,X 
    LDA.W $0F86,X 
    ORA.W #$0400 
    STA.W $0F86,X 
    LDA.W $0F8C,X : STA.L $7E8836,X 
    LSR A 
    STA.L $7E8838,X 
    LSR A 
    STA.L $7E883A,X 
    LDA.W $0F7A,X : STA.L $7E8820,X 
    STA.L $7E8824,X 
    STA.L $7E8828,X 
    STA.L $7E882C,X 
    LDA.W $0F7E,X : STA.L $7E8822,X 
    STA.L $7E8826,X 
    STA.L $7E882A,X 
    STA.L $7E882E,X 
    LDA.W $0F96,X 
    LSR #4
    CLC 
    ADC.W #$0100 
    STA.L $7E881C,X 

.return:
    RTL 


MainAI_Botwoon:
    LDX.W $0E54 
    JSR.W BotwoonDeathCheck 
    JSR.W ($0FAE,X) 
    JSR.W BotwoonHealthBasedPaletteHandling 
    RTL 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Data_B39675:
    dw $FFFF,$00FF,$01FF 

UNUSED_SpeedTable_Random_B3967B:
    LDA.L $7E803E,X 
    ASL A 
    TAY 
    LDA.W UNUSED_Data_B39675,Y : STA.B $12 
    JSL.L GenerateRandomNumber 
    AND.B $12 
    BNE .return 
    LDA.W #$0001 : STA.L $7E801C,X 

.return:
    RTS 


UNUSED_Botwoon_MaybeSpitting_B39396:
    LDX.W $0E54 
    LDA.L $7E801E,X 
    BNE + 
    LDA.L $7E801C,X 
    BEQ + 
    LDA.L $7E8026,X 
    BNE + 
    LDA.L $7E8002,X 
    BNE + 
    LDA.W #Function_Botwoon_Head_Spitting_SetAngleAndShow : STA.W $0FB2,X 
    LDA.W #$0018 : STA.L $7E8002,X 

  + LDA.W #$0000 : STA.L $7E801C,X 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


BotwoonDeathCheck:
    LDX.W $0E54 
    LDA.L $7E801E,X 
    BEQ .return 
    LDA.L $7E803C,X 
    BEQ .return 
    LDA.W #$0001 : STA.L $7E8020,X 
    LDA.W #Function_Botwoon_DeathSequence_PreDeathDelay : STA.W $0FAE,X 
    LDA.W #$00F0 : STA.L $7E8004,X 
    LDA.W #$0000 : STA.L $7E801E,X 
    STA.L $7E803C,X 

.return:
    RTS 


SetBotwoonAsIntangible:
    LDA.W $0F86 
    ORA.W #$0400 
    STA.W $0F86 
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_SetBotwoonBodyProjectilesAsIntangible_B396FF:
    LDY.W #$0022 

.loop:
    TYX 
    LDA.W $1BD7,Y 
    ORA.W #$2000 
    STA.W $1BD7,Y 
    LDA.W #$0002 : STA.L $7EF380,X 
    DEY #2
    CPY.W #$000A 
    BPL .loop 
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


BotwoonHealthBasedPalettes:
    dw $0000,$27E9,$1A66,$1585,$0CA3,$3F9C,$2E97,$1D72 
    dw $108E,$0A5F,$09DB,$0956,$08D2,$082C,$7FBD,$0C05 
    dw $2003,$27EB,$1A88,$15A7,$0CC4,$3B5C,$2E58,$1D53 
    dw $106F,$0E3F,$0DBB,$0D36,$0CD2,$0C2C,$77BD,$0C06 
    dw $2003,$23ED,$168A,$11C8,$08E5,$3AFD,$2A38,$1D34 
    dw $1071,$0DFF,$0D9B,$0D36,$0CB3,$0C2D,$6FDE,$0807 
    dw $0000,$23EF,$16AC,$11EA,$0906,$36BD,$29F9,$1D15 
    dw $1052,$11DF,$117B,$1116,$10B3,$102D,$67DE,$0808 
    dw $0000,$23F2,$12CF,$11EC,$0908,$327D,$25B9,$18D6 
    dw $1453,$11BF,$115C,$10F7,$1093,$102E,$5FDE,$0408 
    dw $0000,$23F4,$12F1,$120E,$0929,$2E3D,$257A,$18B7 
    dw $1434,$159F,$153C,$14D7,$1493,$142E,$57DE,$0409 
    dw $0000,$1FF6,$0EF3,$0E2F,$054A,$2DDE,$215A,$1898 
    dw $1436,$155F,$151C,$14D7,$1474,$142F,$4FFF,$000A 
    dw $0000,$1FF8,$0F15,$0E51,$056B,$299E,$211B,$1879 
    dw $1417,$193F,$18FC,$18B7,$1874,$182F,$47FF,$000B 

BotwoonHealthThresholdsForPaletteChange:
    dw $0BB8,$0A41,$08CA,$0753,$05DC,$0465,$02EE,$0177 

BotwoonHealthBasedPaletteHandling:
    LDX.W $0E54 
    LDA.L $7E881E,X 
    CMP.W #$0010 
    BEQ .return 
    TAY 
    LDA.W $0F8C,X 
    CMP.W BotwoonHealthThresholdsForPaletteChange,Y 
    BPL .return 
    LDA.L $7E881E,X 
    ASL #4
    STA.B $12 
    LDA.L $7E881C,X : STA.B $14 

.loop:
    LDY.B $12 
    LDX.B $14 
    LDA.W BotwoonHealthBasedPalettes,Y : STA.L $7EC000,X 
    INC.B $12 
    INC.B $12 
    INC.B $14 
    INC.B $14 
    LDA.B $14 
    CMP.W #$0200 
    BNE .loop 
    LDX.W $0E54 
    LDA.L $7E881E,X 
    INC #2
    STA.L $7E881E,X 

.return:
    RTS 


Function_Botwoon_Initial:
    LDX.W $0E54 
    LDA.L $7E8000,X 
    DEC A 
    STA.L $7E8000,X 
    BNE .return 
    LDA.W #Function_Botwoon_GoThroughHole : STA.W $0FAE,X 

.return:
    RTS 


BotwoonLeaveHoleAction_JumpTable:
    dw SetupBotwoonMovingAround 
    dw SetupBotwoonMovingAround 
    dw SetupBotwoonMovingAround 
    dw SetupBotwoonSpitting 
    dw SetupBotwoonSpitting 
    dw SetupBotwoonSpitting 
    dw SetupBotwoonSpitting 
    dw SetupBotwoonSpitting 

Function_Botwoon_GoThroughHole:
    LDX.W $0E54 
    LDA.L $7E8038,X 
    BEQ .moveAround 
    LDA.W #$0000 : STA.L $7E8038,X 
    STZ.B $12 
    LDA.L $7E8026,X 
    BNE .gotoAction 
    LDA.L $7E8832,X 
    BNE .gotoAction 
    LDA.L $7E803E,X 
    BNE .gotoAction 
    JSL.L GenerateRandomNumber 
    AND.W #$000E 
    STA.B $12 

.gotoAction:
    LDA.W #$0000 : STA.L $7E8832,X 
    LDX.B $12 
    JMP.W (BotwoonLeaveHoleAction_JumpTable,X) 


.moveAround:
    JSR.W ($0FB0,X) 
    JSR.W UpdateBotwoonPositionHistory 
    JSR.W UpdateBotwonBodyProjectilePositions 
    JSR.W ($0FB2,X) 
    JSR.W SetBotwoonInstListTableIndices 
    JSR.W UpdateBotwoonPositionHistoryIndex 
    JSR.W Botwoon_vs_Hole_CollisionDetection 
    RTS 


SetupBotwoonMovingAround:
    LDX.W $0E54 
    LDA.W #Function_Botwoon_MovingAround : STA.W $0FAE,X 
    LDA.W #Function_Botwoon_Movement_StartMovingAccordingToMovementData : STA.W $0FB0,X 
    LDA.W #$0000 : STA.L $7E8002,X 
    LDA.W #Function_Botwoon_Head_MovingAround : STA.W $0FB2,X 
    LDA.W #$0000 : STA.L $7E8816,X 
    JSR.W ChooseBotwoonMovementPath 
    RTS 


SetupBotwoonSpitting:
    LDX.W $0E54 
    LDA.W #Function_Botwoon_Spitting : STA.W $0FAE,X 
    LDA.W #Function_Botwoon_Head_Spitting_SetAngleAndShow : STA.W $0FB2,X 
    LDA.W #$0030 : STA.L $7E8002,X 
    LDA.W $0F86,X 
    AND.W #$FBFF 
    STA.W $0F86,X 
    RTS 


ChooseBotwoonMovementPath:
    JSR.W SetBotwoonSpeed 
    STZ.B $12 
    LDA.L $7E8026,X 
    BEQ .notHidden 
    LDA.W #$0080 : STA.B $12 

.notHidden:
    JSL.L GenerateRandomNumber 
    AND.W #$0018 
    STA.B $14 
    LDA.L $7E802E,X 
    ASL #2
    CLC 
    ADC.B $12 
    CLC 
    ADC.B $14 
    STA.L $7E8800,X 
    RTS 


SetBotwoonSpeed:
    LDA.L $7E8026,X 
    BNE .return 
    LDA.W #$0000 : STA.L $7E803E,X 
    LDA.W $0F8C,X 
    BEQ .return 
    BMI .return 
    CMP.L $7E8838,X 
    BPL .return 
    CMP.L $7E883A,X 
    BPL .halfHealth 
    BRA .quarterHealth 


.halfHealth:
    LDA.W #$0001 : STA.L $7E803E,X 
    BRA .merge 


.quarterHealth:
    LDA.W #$0002 : STA.L $7E803E,X 

.merge:
    LDA.L $7E803E,X 
    ASL #2
    TAY 
    LDA.W BotwoonSpeedTable_speed,Y : STA.L $7E8030,X 
    LDA.W BotwoonSpeedTable_bodyTravelTime,Y : STA.W $0FAC,X 

.return:
    RTS 


Function_Botwoon_MovingAround:
    LDX.W $0E54 
    LDA.L $7E8038,X 
    BEQ .notGoingThroughHole 
    LDA.W #$0000 : STA.L $7E8038,X 
    JMP.W + ; >.<


.notGoingThroughHole:
    JSR.W ($0FB0,X) 
    JSR.W UpdateBotwoonPositionHistory 
    JSR.W UpdateBotwonBodyProjectilePositions 
    JSR.W ($0FB2,X) 
    JSR.W SetBotwoonInstListTableIndices 
    JSR.W UpdateBotwoonPositionHistoryIndex 
    RTS 


  + LDA.W #Function_Botwoon_GoThroughHole : STA.W $0FAE,X 
    LDA.W #Function_Botwoon_Movement_DirectlyTowardTargetHole : STA.W $0FB0,X 
    LDA.L $7E8026,X 
    BEQ .return 
    LDA.W #$0000 : STA.L $7E802A,X 

.return:
    RTS 


Function_Botwoon_Spitting:
    LDX.W $0E54 
    LDA.L $7E8002,X 
    BNE .timerNotExpired 
    LDA.W #$0000 : STA.L $7E8038,X 
    JMP.W + ; >.<


.timerNotExpired:
    LDA.W #$0000 : STA.L $7E801C,X 
    JSR.W ($0FB2,X) 
    RTS 


  + LDA.W #Function_Botwoon_MovingAround : STA.W $0FAE,X 
    LDA.W #Function_Botwoon_Movement_StartMovingAccordingToMovementData : STA.W $0FB0,X 
    LDA.W #Function_Botwoon_Head_MovingAround : STA.W $0FB2,X 
    LDA.L $7E801E,X 
    BNE .deathFlagSet 
    JSL.L GenerateRandomNumber 
    AND.W #$0001 
    STA.L $7E8026,X 
    STA.L $7E8028,X 
    BEQ .deathFlagSet 
    LDA.W #$0000 : STA.L $7E802A,X 
    LDA.W #$FFFF : STA.L $7E802C,X 
    BRA .merge 


.deathFlagSet:
    LDA.W #$0000 : STA.L $7E8816,X 

.merge:
    JSR.W ChooseBotwoonMovementPath 
    RTS 


Function_Botwoon_DeathSequence_PreDeathDelay:
    LDX.W $0E54 
    LDA.L $7E8004,X 
    INC A 
    STA.L $7E8004,X 
    CMP.W #$0100 
    BMI .return 
    LDA.W #Function_Botwoon_DeathSequence_FallingToGround : STA.W $0FAE,X 

.return:
    RTS 


Function_Botwoon_DeathSequence_FallingToGround:
    LDX.W $0E54 
    LDA.L $7E8010,X 
    AND.W #$FF00 
    XBA 
    ASL #3
    TAY 
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
    CMP.W #$00C8 
    BMI .lessThanC8 
    LDA.W #$00C8 : STA.W $0F7E,X 
    LDA.W #Function_Botwoon_DeathSequence_WaitForBodyToFallToGround : STA.W $0FAE,X 
    LDA.W $0F7A,X : STA.B $12 
    LDA.W $0F7E,X : STA.B $14 
    LDA.W #$001D 
    LDY.W #EnemyProjectile_MiscDust 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    JSL.L QueueSmallExplosionSFX 
    LDA.W $0F86,X 
    ORA.W #$0400 
    ORA.W #$0100 
    STA.W $0F86,X 
    BRA .return 


.lessThanC8:
    LDA.L $7E8010,X 
    CLC 
    ADC.W #$00C0 
    STA.L $7E8010,X 

.return:
    RTS 


Function_Botwoon_DeathSequence_WaitForBodyToFallToGround:
    LDX.W $0E54 
    LDA.L $7E883E,X 
    BEQ .return 
    LDA.W #Function_Botwoon_DeathSequence_CrumblingWall : STA.W $0FAE,X 
    JSR.W SpawnBotwoonItemDrops_StartCrumblingWall 

.return:
    RTS 


SpawnBotwoonItemDrops_StartCrumblingWall:
    JSL.L Spawn_Hardcoded_PLM 
    db $0F,$04 
    dw PLMEntries_crumbleBotwoonWall 
    JSL.L BotwoonDeathItemDropRoutine 
    LDA.W #$0000 : STA.L $7E8006,X 
    STA.L $7E8008,X 
    STA.L $7E800A,X 
    RTS 


Function_Botwoon_DeathSequence_CrumblingWall:
    LDA.L $7E8006,X 
    CMP.W #$00C0 
    BPL .end 
    CMP.W #$0040 
    BPL .wall 
    JMP.W .return 


.end:
    LDA.W $0F86,X 
    ORA.W #$0200 
    STA.W $0F86,X 
    LDA.W #$0002 
    JSL.L SetBossBitsInAForCurrentArea 
    LDA.W #$0003 
    JSL.L QueueMusicDataOrTrack_8FrameDelay 
    RTS 


.wall:
    LDA.L $7E8008,X 
    DEC A 
    STA.L $7E8008,X 
    BPL .timerNotExpired 
    LDA.W #$000C : STA.L $7E8008,X 
    JSL.L GenerateRandomNumber 
    AND.W #$001F 
    CLC 
    ADC.W #$00E8 
    STA.B $12 
    JSL.L GenerateRandomNumber 
    AND.W #$001F 
    SEC 
    SBC.W #$0008 
    CLC 
    ADC.L $7E8006,X 
    STA.B $14 
    LDA.W #$001D : STA.B $16 
    LDA.W #$0A00 : STA.B $18 
    JSL.L Create_Sprite_Object 
    JSL.L QueueSmallExplosionSFX 

.timerNotExpired:
    LDA.L $7E800A,X 
    DEC A 
    STA.L $7E800A,X 
    BPL .return 
    LDA.W #$0004 : STA.L $7E800A,X 
    LDA.W #$0002 : STA.B $24 

.loop:
    JSL.L GenerateRandomNumber 
    AND.W #$003F 
    CLC 
    ADC.W #$00E0 
    STA.B $12 
    JSL.L GenerateRandomNumber 
    AND.W #$001F 
    SEC 
    SBC.W #$0008 
    CLC 
    ADC.L $7E8006,X 
    STA.B $14 
    LDA.W #$0009 : STA.B $16 
    LDA.W #$0A00 : STA.B $18 
    JSL.L Create_Sprite_Object 
    DEC.B $24 
    BNE .loop 

.return:
    LDA.L $7E8006,X 
    INC A 
    STA.L $7E8006,X 
    RTS 


Function_Botwoon_Movement_DirectlyTowardTargetHole:
    LDX.W $0E54 
    JSR.W CalculateXYOffsetsToTargetHole 
    JSL.L CalculateAngleOf_12_14_Offset 
    STA.L $7E8032,X 
    SEC 
    SBC.W #$0040 
    EOR.W #$FFFF 
    INC A 
    CLC 
    ADC.W #$0100 
    AND.W #$00FF 
    STA.L $7E8034,X 
    LDA.L $7E8026,X 
    CMP.L $7E8028,X 
    BEQ .move 
    LDA.L $7E8026,X : STA.L $7E8028,X 
    LDA.W #$0001 : STA.L $7E8038,X 
    JMP.W .return 


.move:
    JSR.W MoveBotwoonAccordingToSpeedAndAngleToTargetHole 

.return:
    RTS 


CalculateXYOffsetsToTargetHole:
    LDA.L $7E802E,X 
    TAY 
    LDA.W BotwoonHoleHitboxes_leftBoundary,Y 
    CLC 
    ADC.W #$0004 
    SEC 
    SBC.W $0F7A,X 
    STA.B $12 
    CMP.W #$0100 
    BPL .XClampHigh 
    CMP.W #$FF00 
    BMI .XClampLow 
    BRA .merge 


.XClampHigh:
    LDA.W #$00FF : STA.B $12 
    BRA .merge 


.XClampLow:
    LDA.W #$FF01 : STA.B $12 

.merge:
    LDA.W BotwoonHoleHitboxes_topBoundary,Y 
    CLC 
    ADC.W #$0004 
    SEC 
    SBC.W $0F7E,X 
    STA.B $14 
    CMP.W #$0100 
    BPL .YClampHigh 
    CMP.W #$FF00 
    BMI .YClampLow 
    BRA .return 


.YClampHigh:
    LDA.W #$00FF : STA.B $14 
    BRA .return 


.YClampLow:
    LDA.W #$FF01 : STA.B $14 

.return:
    RTS 


MoveBotwoonAccordingToSpeedAndAngleToTargetHole:
    LDX.W $0E54 
    LDA.L $7E8034,X : STA.B $12 
    LDA.L $7E8030,X : STA.B $14 
    JSL.L Do_Some_Math_With_Sine_Cosine_Terrible_Label_Name ; ($16.$18, $1A.$1C) = ([$14] * |cos([$12] * pi / 80h)|, [$14] * |sin([$12] * pi / 80h)|)
    LDA.L $7E8034,X : STA.W $0E20 
    LDA.B $16 : STA.W $0E24 
    LDA.B $18 : STA.W $0E26 
    LDA.B $1A : STA.W $0E28 
    LDA.B $1C : STA.W $0E2A 
    JSL.L MoveEnemyAccordingToAngleAndXYSpeeds 
    RTS 


UpdateBotwoonPositionHistory:
    LDY.W $0E54 
    LDX.W $0FAA,Y 
    LDA.W $0F7A,Y : STA.L $7E9000,X 
    LDA.W $0F7E,Y : STA.L $7E9002,X 
    RTS 


UpdateBotwonBodyProjectilePositions:
    LDX.W $0E54 
    LDA.W $0FAA,X 
    SEC 
    SBC.W $0FAC,X 
    AND.W #$03FF 
    STA.B $12 
    LDA.W #$0018 : STA.B $14 

.loop:
    LDX.B $14 
    LDA.L $7E7800,X 
    TAY 
    LDX.W $0E54 
    LDA.L $7E802C,X 
    CMP.B $12 
    BNE .toggleVisibilityEnd 
    LDX.B $14 
    LDA.L $7E7820,X 
    EOR.W #$0001 
    STA.L $7E7820,X 
    BEQ .notHidden 
    LDA.W $1BD7,Y 
    ORA.W #$2000 
    STA.W $1BD7,Y 
    PHX 
    TYX 
    LDA.W #$0002 : STA.L $7EF380,X 
    PLX 
    BRA + 


.notHidden:
    LDA.W $1BD7,Y 
    AND.W #$DFFF 
    STA.W $1BD7,Y 
    PHX 
    TYX 
    LDA.W #$0001 : STA.L $7EF380,X 
    PLX 

  + CPX.W #$0000 
    BNE .toggleVisibilityEnd 
    LDX.W $0E54 
    LDA.W #$0000 : STA.L $7E802A,X 
    STA.L $7E803C,X 
    LDA.W #$FFFF : STA.L $7E802C,X 
    LDA.L $7E8026,X 
    BNE .toggleVisibilityEnd 
    LDA.W #$0001 : STA.L $7E803C,X 

.toggleVisibilityEnd:
    LDX.B $12 
    LDA.L $7E9000,X : STA.W $1A4B,Y 
    LDA.L $7E9002,X : STA.W $1A93,Y 
    LDX.W $0E54 
    LDA.B $12 
    SEC 
    SBC.W $0FAC,X 
    AND.W #$03FF 
    STA.B $12 
    DEC.B $14 
    DEC.B $14 
    BMI .return 
    JMP.W .loop 


.return:
    RTS 


UpdateBotwoonPositionHistoryIndex:
    LDX.W $0E54 
    LDA.W $0FAA,X 
    CLC 
    ADC.W #$0004 
    AND.W #$03FF 
    STA.W $0FAA,X 
    RTS 


SetBotwoonInstListTableIndices:
    LDX.W $0E54 
    LDA.W #$0018 : STA.B $16 

.loop:
    STZ.B $18 
    LDX.B $16 
    LDA.L $7E7800,X 
    TAY 
    LDA.L $7E7820,X 
    BEQ .nothidden 
    LDA.W #$0100 : STA.B $18 

.nothidden:
    LDA.B $16 
    CMP.W #$0018 
    BEQ .first 
    CMP.W #$0000 
    BNE .notZero 
    LDA.B $18 
    CLC 
    ADC.W #$0200 
    STA.B $18 

.notZero:
    LDA.W $1A4D,Y 
    SEC 
    SBC.W $1A4B,Y 
    STA.B $12 
    LDA.W $1A95,Y 
    SEC 
    SBC.W $1A93,Y 
    STA.B $14 
    BRA .merge 


.first:
    LDX.W $0E54 
    LDA.W $0F7A,X 
    SEC 
    SBC.W $1A4B,Y 
    STA.B $12 
    LDA.W $0F7E,X 
    SEC 
    SBC.W $1A93,Y 
    STA.B $14 

.merge:
    JSL.L CalculateAngleOf_12_14_Offset 
    CLC 
    ADC.B $18 
    LSR #5
    ASL A 
    STA.W $1AFF,Y 
    DEC.B $16 
    DEC.B $16 
    BMI .return 
    JMP.W .loop 


.return:
    RTS 


Function_Botwoon_Head_MovingAround:
    LDX.W $0E54 
    LDA.W $0F7A,X 
    SEC 
    SBC.L $7E882C,X 
    STA.B $12 
    LDA.W $0F7E,X 
    SEC 
    SBC.L $7E882E,X 
    STA.B $14 
    JSL.L CalculateAngleOf_12_14_Offset 
    STA.B $16 
    LDA.B $12 
    BNE .nonZero 
    LDA.B $14 
    BNE .nonZero 
    JMP.W .noHeadUpdate 


  .nonZero
    LDA.L $7E8026,X 
    BEQ .notHidden 
    LDA.W #$0007 : STA.W $0F9A,X 
    LDA.W $0F86,X 
    ORA.W #$0400 
    STA.W $0F86,X 
    LDA.B $16 
    CLC 
    ADC.W #$0100 
    STA.B $16 
    BRA + 


  .notHidden
    LDA.W #$0002 : STA.W $0F9A,X 
    LDA.W $0F86,X 
    AND.W #$FBFF 
    STA.W $0F86,X 

+   LDA.B $16 
    LSR #5
    ASL A 
    TAY 
    LDA.W InstListPointers_Botwoon,Y 
    CMP.L $7E8036,X 
    BEQ .noHeadUpdate 
    STA.W $0F92,X 
    STA.L $7E8036,X 
    LDA.W #$0001 : STA.W $0F94,X 
    STZ.W $0F90,X 

  .noHeadUpdate
    LDA.L $7E8828,X : STA.L $7E882C,X 
    LDA.L $7E882A,X : STA.L $7E882E,X 
    LDA.L $7E8824,X : STA.L $7E8828,X 
    LDA.L $7E8826,X : STA.L $7E882A,X 
    LDA.L $7E8820,X : STA.L $7E8824,X 
    LDA.L $7E8822,X : STA.L $7E8826,X 
    LDA.W $0F7A,X : STA.L $7E8820,X 
    LDA.W $0F7E,X : STA.L $7E8822,X 
    RTS 


BotwoonSpitSpeeds:
    dw $0002,$0003,$0004 

Function_Botwoon_Head_Spitting_SetAngleAndShow:
    LDX.W $0E54 
    LDA.W #$0002 : STA.W $0F9A,X 
    JSL.L CalculateAngleOfSamusFromEnemy 
    STA.L $7E803A,X 
    CLC 
    ADC.W #$0010 
    AND.W #$00FF 
    LSR #5
    ASL A 
    TAY 
    LDA.W InstListPointers_Botwoon_spit,Y : STA.W $0F92,X 
    STA.L $7E8036,X 
    LDA.W #$0001 : STA.W $0F94,X 
    STZ.W $0F90,X 
    LDA.L $7E803A,X 
    SEC 
    SBC.W #$0040 
    AND.W #$00FF 
    EOR.W #$FFFF 
    INC A 
    CLC 
    ADC.W #$0100 
    AND.W #$00FF 
    STA.L $7E803A,X 
    LDA.W #Function_Botwoon_Head_Spitting_Spawn5SpitProjectiles : STA.W $0FB2,X 
    LDA.W $0FAE,X 
    CMP.W #Function_Botwoon_Spitting 
    BEQ .gotoHeadFunction 
    LDA.W #Function_Botwoon_Head_Spitting_Spawn3SpitProjectiles : STA.W $0FB2,X 

.gotoHeadFunction:
    JMP.W ($0FB2,X) 


Function_Botwoon_Head_Spitting_Spawn5SpitProjectiles:
    LDX.W $0E54 
    LDA.L $7E8834,X 
    BNE .spitting 
    RTS 


.spitting:
    LDA.L $7E803A,X 
    SEC 
    SBC.W #$0020 
    AND.W #$00FF 
    STA.W $060B 
    LDA.W #$0005 : STA.W $060D 
    LDA.L $7E803E,X 
    ASL A 
    TAY 
    LDA.W BotwoonSpitSpeeds,Y : STA.W $0E32 

.loop:
    LDY.W #EnemyProjectile_BotwoonsSpit 
    LDA.W $0E32 
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    LDA.W $060B 
    CLC 
    ADC.W #$0010 
    AND.W #$00FF 
    STA.W $060B 
    DEC.W $060D 
    BNE .loop 
    LDA.W #$0000 : STA.L $7E8834,X 
    LDA.W #Function_Botwoon_Head_Spitting_Cooldown : STA.W $0FB2,X 
    RTS 


Function_Botwoon_Head_Spitting_Spawn3SpitProjectiles:
    LDX.W $0E54 
    LDA.L $7E803A,X 
    SEC 
    SBC.W #$0010 
    AND.W #$00FF 
    STA.W $060B 
    LDA.W #$0003 : STA.W $060D 
    LDA.L $7E803E,X 
    ASL A 
    TAY 
    LDA.W BotwoonSpitSpeeds,Y : STA.W $0E32 

.loop:
    LDY.W #EnemyProjectile_BotwoonsSpit 
    LDA.W $0E32 
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    LDA.W $060B 
    CLC 
    ADC.W #$0010 
    AND.W #$00FF 
    STA.W $060B 
    DEC.W $060D 
    BNE .loop 
    LDA.W #Function_Botwoon_Head_Spitting_Cooldown : STA.W $0FB2,X 
    RTS 


Function_Botwoon_Head_Spitting_Cooldown:
    LDA.L $7E8002,X 
    DEC A 
    STA.L $7E8002,X 
    BPL .return 
    LDA.W #$0000 : STA.L $7E8002,X 
    LDA.W #Function_Botwoon_Head_MovingAround : STA.W $0FB2,X 

.return:
    RTS 


Botwoon_vs_Hole_CollisionDetection:
    LDA.L $7E802A,X 
    BEQ .collisionNotDisabled 
    JMP.W .return 


.collisionNotDisabled:
    LDA.W #$0018 : STA.B $12 

.loop:
    LDY.B $12 
    LDX.W $0E54 
    LDA.W $0F7A,X 
    CMP.W BotwoonHoleHitboxes_leftBoundary,Y 
    BMI .notInHole 
    LDA.W $0F7A,X 
    CMP.W BotwoonHoleHitboxes_rightBoundary,Y 
    BPL .notInHole 
    LDA.W $0F7E,X 
    CMP.W BotwoonHoleHitboxes_topBoundary,Y 
    BMI .notInHole 
    LDA.W $0F7E,X 
    CMP.W BotwoonHoleHitboxes_bottomBoundary,Y 
    BPL .notInHole 
    LDA.W #$0001 : STA.L $7E802A,X 
    LDA.L $7E8026,X 
    EOR.W #$0001 
    STA.L $7E8026,X 
    LDA.W $0FAA,X : STA.L $7E802C,X 
    LDA.L $7E800C,X 
    DEC A 
    STA.L $7E800C,X 
    BRA .return 


.notInHole:
    LDA.W #$0000 : STA.L $7E802A,X 
    LDA.B $12 
    SEC 
    SBC.W #$0008 
    STA.B $12 
    BMI .return 
    JMP.W .loop 


.return:
    RTS 


EnemyTouch_Botwoon:
    JSL.L CommonB3_NormalTouchAI_NoDeathCheck 
    LDX.W $0E54 
    LDA.W $0F8C,X 
    BNE .return 
    LDA.W #$0001 : STA.L $7E801E,X 
    JSR.W SetBotwoonAsIntangible 

.return:
    RTL 


EnemyShot_Botwoon:
    LDX.W $0E54 
    LDA.W $0F8C,X : STA.L $7E8818,X 
    JSL.L CommonB3_NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic 
    LDA.L $7E8818,X 
    CMP.W $0F8C,X 
    BEQ .healthUnchanged 
    JSL.L RTL_B3957A ; >.<

.healthUnchanged:
    LDA.W $0F8C,X 
    BNE .return 
    LDA.W #$0001 : STA.L $7E801E,X 
    JSR.W SetBotwoonAsIntangible 

.return:
    RTL 


PowerBombReaction_Botwoon:
    JSL.L CommonB3_NormalEnemyPowerBombAI_NoDeathCheck 
    LDX.W $0E54 
    LDA.W $0F8C,X 
    BNE .return 
    LDA.W #$0001 : STA.L $7E801E,X 
    JSR.W SetBotwoonAsIntangible 

.return:
    RTL 


BotwoonMovementData_Terminator:
    db $80,$00 

BotwoonMovementData_Visible_LeftToBottom:
    db $01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00 
    db $00,$FF,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$00,$FF,$01,$00 
    db $01,$00,$01,$00,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$01,$00 
    db $01,$00,$01,$FF,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$00,$FF 
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00 
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00 
    db $01,$00,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$01,$00,$00,$01 
    db $01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00 
    db $00,$01,$01,$00,$01,$01,$01,$00,$00,$01,$01,$00,$01,$01,$01,$00 
    db $00,$01,$01,$00,$00,$01,$01,$00,$01,$00,$00,$01,$01,$00,$00,$01 
    db $01,$00,$00,$01,$01,$00,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00 
    db $01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$01,$00,$00,$01,$01,$00 
    db $00,$01,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$00,$01,$01,$00 
    db $01,$00,$00,$01,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$01,$00 
    db $00,$01,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$01,$00,$00,$01 
    db $01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00 
    db $01,$00,$00,$01,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$00,$01 
    db $01,$00,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$01,$00,$00,$01 
    db $01,$00,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$01,$00,$01,$00 
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00 
    db $01,$00,$00,$FF,$01,$00,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00 
    db $00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$FF,$01,$00,$00,$FF 
    db $01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$00,$FF 
    db $01,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF 
    db $00,$FF,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF,$00,$FF,$00,$FF 
    db $00,$FF,$FF,$00,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF,$FF,$00 
    db $00,$FF,$FF,$FF,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00 
    db $00,$FF,$FF,$00,$FF,$FF,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF 
    db $FF,$00,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$FF,$00,$FF,$00 
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$01,$FF,$00 
    db $FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00,$00,$01,$FF,$00,$00,$01 
    db $FF,$00,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$01 
    db $00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$00,$01,$FF,$00,$00,$01 
    db $00,$01,$FF,$00,$00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$00,$01 
    db $FF,$00,$00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$00,$01,$FF,$00 
    db $00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$00,$01,$FF,$00,$00,$01 
    db $00,$01,$FF,$00,$00,$01,$00,$01,$00,$01,$FF,$00,$00,$01,$00,$01 
    db $FF,$00,$00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$FF,$00,$00,$01 
    db $FF,$00,$00,$01,$00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00 
    db $00,$01,$00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01 
    db $FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01 
    db $FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01 
    db $FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$00,$01,$FF,$00 
    db $00,$01,$FF,$00,$00,$01,$00,$01,$FF,$01,$00,$01,$00,$01,$00,$01 
    db $FF,$00,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$80,$00 

BotwoonMovementData_Visible_LeftToTop:
    db $01,$00,$00,$01,$01,$00,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00 
    db $01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$01,$01,$01,$00,$00,$01 
    db $01,$00,$00,$01,$01,$00,$00,$01,$00,$01,$01,$00,$00,$01,$01,$00 
    db $00,$01,$00,$01,$01,$00,$00,$01,$00,$01,$00,$01,$01,$00,$00,$01 
    db $00,$01,$00,$01,$00,$01,$01,$00,$00,$01,$00,$01,$00,$01,$00,$01 
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01 
    db $00,$01,$FF,$00,$00,$01,$00,$01,$00,$01,$00,$01,$FF,$00,$00,$01 
    db $00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$FF,$00,$00,$01,$00,$01 
    db $FF,$00,$00,$01,$00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$00,$01 
    db $FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01 
    db $00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$01,$00,$01,$FF,$00 
    db $00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$FF,$00,$00,$01,$00,$01 
    db $00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01 
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$01,$00 
    db $00,$01,$00,$01,$01,$00,$00,$01,$00,$01,$01,$00,$00,$01,$01,$00 
    db $00,$01,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$00,$01,$01,$00 
    db $01,$00,$00,$01,$01,$00,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00 
    db $01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00 
    db $00,$01,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00 
    db $00,$01,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00 
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00 
    db $01,$00,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$01,$00,$01,$00 
    db $01,$00,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$01,$00,$01,$00 
    db $01,$00,$00,$FF,$01,$00,$01,$00,$01,$00,$01,$00,$01,$FF,$01,$00 
    db $01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$01,$00,$00,$FF,$01,$00 
    db $01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$01,$FF 
    db $01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00 
    db $01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF 
    db $01,$00,$00,$FF,$01,$00,$01,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF 
    db $01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$01,$00 
    db $00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF 
    db $01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF 
    db $01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00 
    db $01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF 
    db $01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF 
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF 
    db $00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF 
    db $FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$FF,$00 
    db $00,$FF,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF,$FF,$00 
    db $FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00 
    db $00,$FF,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00 
    db $FF,$00,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$FF,$00,$FF,$00 
    db $FF,$00,$00,$FF,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$FF 
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$FF,$00 
    db $FF,$00,$00,$FF,$FF,$00,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00 
    db $FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00 
    db $FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF 
    db $FF,$00,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF,$FF,$00,$00,$FF 
    db $00,$FF,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF,$00,$FF,$00,$FF 
    db $00,$FF,$01,$00,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$01,$00,$00,$FF 
    db $00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00 
    db $00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00 
    db $01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$01,$00,$01,$00,$00,$FF 
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$00,$FF,$01,$00 
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00 
    db $01,$00,$00,$FF,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00 
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$80,$F0,$00,$00,$00,$00 
    db $80,$00 

BotwoonMovementData_Visible_LeftToRight:
    db $00,$01,$01,$00,$00,$01,$00,$01,$01,$00,$00,$01,$00,$01,$01,$00 
    db $00,$01,$00,$01,$01,$00,$00,$01,$00,$01,$01,$00,$00,$01,$00,$01 
    db $01,$01,$00,$01,$00,$01,$01,$01,$00,$01,$00,$01,$00,$01,$01,$00 
    db $00,$01,$00,$01,$00,$01,$00,$01,$01,$01,$00,$01,$00,$01,$00,$01 
    db $00,$01,$00,$01,$01,$00,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01 
    db $00,$01,$00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$00,$01,$FF,$00 
    db $00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$FF,$00,$00,$01,$FF,$00 
    db $00,$01,$FF,$00,$00,$01,$00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01 
    db $00,$01,$FF,$00,$00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$FF,$01 
    db $00,$01,$00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$00,$01,$00,$01 
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01 
    db $01,$00,$00,$01,$00,$01,$00,$01,$01,$01,$00,$01,$00,$01,$01,$00 
    db $00,$01,$00,$01,$01,$00,$00,$01,$00,$01,$01,$00,$00,$01,$01,$01 
    db $01,$01,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01 
    db $01,$00,$01,$01,$01,$00,$00,$01,$01,$00,$01,$00,$01,$01,$01,$00 
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00 
    db $01,$FF,$01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00,$00,$FF 
    db $01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF 
    db $01,$00,$00,$FF,$01,$FF,$01,$FF,$01,$FF,$01,$FF,$00,$FF,$01,$00 
    db $01,$FF,$01,$FF,$01,$FF,$01,$FF,$01,$FF,$00,$FF,$01,$00,$00,$FF 
    db $01,$00,$00,$FF,$01,$FF,$00,$FF,$01,$FF,$00,$FF,$00,$FF,$00,$FF 
    db $00,$FF,$01,$00,$00,$FF,$00,$FF,$00,$FF,$FF,$FF,$00,$FF,$00,$FF 
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF 
    db $00,$FF,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF,$00,$FF,$00,$FF 
    db $01,$00,$00,$FF,$00,$FF,$01,$FF,$00,$FF,$00,$FF,$01,$00,$00,$FF 
    db $00,$FF,$01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF,$01,$FF,$00,$FF 
    db $01,$00,$00,$FF,$01,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00 
    db $00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$01,$00,$01,$00 
    db $00,$FF,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00 
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00 
    db $01,$00,$00,$01,$01,$00,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00 
    db $00,$01,$01,$00,$00,$01,$01,$00,$00,$01,$01,$01,$00,$01,$01,$00 
    db $00,$01,$00,$01,$01,$00,$00,$01,$00,$01,$01,$01,$00,$01,$00,$01 
    db $01,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01 
    db $00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$FF,$01,$00,$01,$FF,$00 
    db $00,$01,$FF,$01,$FF,$01,$FF,$00,$00,$01,$FF,$00,$FF,$00,$00,$01 
    db $FF,$00,$FF,$00,$FF,$01,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00 
    db $FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$00,$FF 
    db $FF,$00,$FF,$FF,$00,$FF,$FF,$00,$00,$FF,$FF,$FF,$00,$FF,$FF,$FF 
    db $00,$FF,$00,$FF,$FF,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF 
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF,$01,$00 
    db $00,$FF,$00,$FF,$01,$00,$01,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF 
    db $01,$00,$01,$00,$01,$FF,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00 
    db $01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00 
    db $00,$FF,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$FF 
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00 
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00 
    db $00,$01,$01,$00,$01,$00,$01,$01,$01,$00,$01,$00,$00,$01,$01,$00 
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00 
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00 
    db $01,$00,$01,$00,$01,$00,$01,$FF,$01,$00,$01,$00,$01,$00,$01,$00 
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$00,$01 
    db $01,$00,$01,$00,$01,$00,$01,$01,$01,$00,$01,$00,$00,$01,$01,$00 
    db $01,$00,$00,$01,$01,$00,$01,$01,$01,$00,$00,$01,$01,$00,$00,$01 
    db $01,$00,$00,$01,$01,$00,$80,$00 

BotwoonMovementData_Visible_LeftToLeft:
    db $01,$00,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$01,$00,$01,$00 
    db $01,$00,$00,$01,$01,$00,$01,$00,$01,$00,$01,$01,$01,$00,$01,$00 
    db $00,$01,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$00,$01,$01,$00 
    db $00,$01,$01,$00,$01,$01,$01,$01,$01,$01,$00,$01,$01,$00,$00,$01 
    db $01,$00,$00,$01,$01,$01,$00,$01,$01,$00,$00,$01,$00,$01,$01,$00 
    db $00,$01,$00,$01,$01,$00,$00,$01,$00,$01,$00,$01,$01,$00,$00,$01 
    db $00,$01,$00,$01,$01,$00,$00,$01,$00,$01,$00,$01,$00,$01,$01,$00 
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$01,$00,$00,$01,$00,$01 
    db $00,$01,$00,$01,$00,$01,$01,$01,$00,$01,$00,$01,$00,$01,$00,$01 
    db $01,$00,$00,$01,$00,$01,$00,$01,$00,$01,$01,$00,$00,$01,$00,$01 
    db $00,$01,$01,$00,$00,$01,$00,$01,$00,$01,$01,$00,$00,$01,$00,$01 
    db $01,$00,$00,$01,$00,$01,$01,$00,$00,$01,$00,$01,$01,$00,$00,$01 
    db $01,$00,$00,$01,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01,$01,$01 
    db $00,$01,$01,$00,$00,$01,$01,$01,$01,$01,$00,$01,$01,$00,$00,$01 
    db $01,$01,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01,$01,$01,$01,$01 
    db $01,$01,$01,$01,$01,$01,$01,$00,$00,$01,$01,$00,$01,$00,$00,$01 
    db $01,$00,$01,$00,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$01,$00 
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00 
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$00,$FF 
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$FF,$01,$00,$01,$00,$00,$FF 
    db $01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00,$00,$FF 
    db $01,$00,$01,$FF,$01,$FF,$01,$FF,$00,$FF,$01,$00,$00,$FF,$01,$00 
    db $00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF 
    db $01,$FF,$00,$FF,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF,$00,$FF 
    db $01,$00,$00,$FF,$00,$FF,$00,$FF,$01,$FF,$00,$FF,$00,$FF,$01,$00 
    db $00,$FF,$00,$FF,$01,$00,$00,$FF,$01,$FF,$00,$FF,$01,$00,$00,$FF 
    db $01,$FF,$01,$FF,$01,$FF,$01,$FF,$01,$00,$00,$FF,$01,$00,$01,$00 
    db $00,$FF,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00 
    db $00,$01,$01,$00,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$00,$01 
    db $01,$00,$01,$01,$01,$00,$00,$01,$01,$00,$01,$00,$00,$01,$01,$00 
    db $00,$01,$01,$00,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01 
    db $01,$00,$00,$01,$01,$00,$00,$01,$01,$01,$00,$01,$01,$00,$00,$01 
    db $00,$01,$01,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01 
    db $00,$01,$00,$01,$FF,$01,$00,$01,$00,$01,$FF,$00,$00,$01,$00,$01 
    db $FF,$00,$00,$01,$FF,$01,$FF,$01,$00,$01,$FF,$00,$FF,$01,$FF,$00 
    db $00,$01,$FF,$00,$FF,$01,$FF,$00,$FF,$01,$FF,$00,$FF,$00,$FF,$00 
    db $00,$01,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00 
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00 
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00 
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00 
    db $FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$FF,$FF,$00 
    db $00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00 
    db $00,$FF,$FF,$00,$00,$FF,$FF,$00,$FF,$FF,$FF,$FF,$FF,$00,$00,$FF 
    db $FF,$00,$FF,$FF,$FF,$00,$00,$FF,$FF,$00,$FF,$FF,$FF,$00,$FF,$FF 
    db $FF,$00,$FF,$FF,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF,$FF,$00 
    db $FF,$00,$00,$FF,$FF,$00,$FF,$FF,$FF,$00,$00,$FF,$FF,$00,$FF,$00 
    db $00,$FF,$FF,$00,$FF,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00 
    db $FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF,$FF,$00 
    db $FF,$FF,$FF,$00,$00,$FF,$FF,$00,$FF,$FF,$FF,$00,$00,$FF,$FF,$00 
    db $FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$FF,$FF 
    db $FF,$00,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$FF,$00,$FF,$00 
    db $FF,$00,$FF,$00,$FF,$FF,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00 
    db $FF,$00,$FF,$00,$FF,$FF,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00 
    db $00,$FF,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00 
    db $FF,$00,$00,$FF,$FF,$00,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00 
    db $00,$FF,$FF,$00,$00,$FF,$FF,$00,$FF,$FF,$FF,$00,$00,$FF,$FF,$00 
    db $00,$FF,$FF,$FF,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$00,$FF 
    db $FF,$00,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF,$FF,$00,$00,$FF 
    db $00,$FF,$FF,$FF,$00,$FF,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF 
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$01,$00 
    db $00,$FF,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF,$00,$FF,$01,$00 
    db $00,$FF,$00,$FF,$01,$00,$00,$FF,$80,$00 

BotwoonMovementData_Visible_BottomToLeft:
    db $01,$00,$01,$00,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$01,$00 
    db $01,$00,$01,$00,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$01,$00 
    db $01,$00,$01,$00,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$01,$00 
    db $01,$00,$01,$00,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$01,$00 
    db $01,$00,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$01,$00,$01,$00 
    db $01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$01,$00,$01,$00,$00,$FF 
    db $01,$00,$01,$00,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$01,$00 
    db $01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$01,$00 
    db $00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00 
    db $01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00 
    db $01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00 
    db $00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00 
    db $00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00 
    db $00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$FF 
    db $00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF 
    db $01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF,$01,$FF,$00,$FF,$01,$00 
    db $00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF 
    db $01,$00,$00,$FF,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF,$01,$00 
    db $00,$FF,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF 
    db $00,$FF,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF,$00,$FF,$01,$00 
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF,$00,$FF 
    db $00,$FF,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF,$00,$FF,$00,$FF 
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF 
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$FF,$00,$00,$FF 
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF,$00,$FF 
    db $FF,$00,$00,$FF,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF,$FF,$00 
    db $00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$FF,$00 
    db $00,$FF,$FF,$00,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF 
    db $FF,$00,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF 
    db $FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00 
    db $FF,$00,$00,$FF,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$FF 
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00 
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$01,$FF,$00 
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00,$FF,$00 
    db $FF,$00,$00,$01,$FF,$00,$FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00 
    db $00,$01,$FF,$00,$FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00,$00,$01 
    db $FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00 
    db $00,$01,$FF,$00,$00,$01,$FF,$00,$FF,$00,$00,$01,$FF,$00,$00,$01 
    db $FF,$00,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00 
    db $00,$01,$FF,$00,$00,$01,$FF,$00,$FF,$01,$FF,$01,$00,$01,$FF,$00 
    db $00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00 
    db $00,$01,$FF,$00,$00,$01,$00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01 
    db $FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$00,$01,$FF,$00 
    db $00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00 
    db $00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$FF,$00,$00,$01 
    db $FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$FF,$00 
    db $00,$01,$FF,$00,$00,$01,$FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00 
    db $00,$01,$FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00,$FF,$01,$FF,$00 
    db $FF,$00,$00,$01,$FF,$00,$FF,$00,$FF,$00,$FF,$01,$FF,$00,$FF,$00 
    db $FF,$00,$00,$01,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$01 
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$01,$FF,$00 
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$01,$FF,$00 
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$01,$FF,$00 
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$01 
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$80,$00 

BotwoonMovementData_Visible_BottomToTop:
    db $01,$FF,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF 
    db $01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF 
    db $00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$00,$FF 
    db $01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF 
    db $00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF 
    db $01,$00,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF 
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$FF,$00,$00,$FF 
    db $00,$FF,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF,$00,$FF,$FF,$00 
    db $00,$FF,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$FF,$00,$FF 
    db $FF,$00,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF 
    db $FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00 
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$01 
    db $FF,$00,$FF,$00,$FF,$01,$FF,$00,$00,$01,$FF,$00,$FF,$00,$00,$01 
    db $FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01 
    db $FF,$00,$00,$01,$FF,$00,$00,$01,$00,$01,$FF,$00,$00,$01,$00,$01 
    db $00,$01,$FF,$00,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01 
    db $00,$01,$00,$01,$00,$01,$00,$01,$01,$00,$00,$01,$00,$01,$01,$01 
    db $00,$01,$01,$01,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01,$00,$01 
    db $01,$00,$00,$01,$01,$00,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00 
    db $01,$00,$00,$01,$01,$00,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00 
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00 
    db $00,$FF,$01,$00,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF 
    db $01,$00,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00 
    db $00,$FF,$01,$00,$00,$FF,$01,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF 
    db $01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF,$00,$FF,$01,$00 
    db $00,$FF,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF,$00,$FF,$00,$FF 
    db $01,$00,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF 
    db $00,$FF,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF,$00,$FF,$00,$FF 
    db $00,$FF,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF,$00,$FF,$00,$FF 
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF,$00,$FF 
    db $00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF,$00,$FF,$FF,$00,$00,$FF 
    db $00,$FF,$FF,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF,$FF,$00,$00,$FF 
    db $FF,$00,$00,$FF,$FF,$FF,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$FF,$00 
    db $00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF 
    db $FF,$00,$FF,$00,$FF,$FF,$FF,$00,$FF,$00,$FF,$FF,$FF,$00,$FF,$00 
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00 
    db $00,$01,$FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00,$00,$01,$FF,$00 
    db $00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00 
    db $00,$01,$00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$00,$01,$FF,$00 
    db $00,$01,$00,$01,$00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$00,$01 
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$01,$00,$00,$01,$00,$01 
    db $00,$01,$01,$00,$00,$01,$00,$01,$01,$00,$00,$01,$00,$01,$01,$00 
    db $00,$01,$01,$01,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00 
    db $00,$01,$01,$00,$01,$01,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00 
    db $01,$00,$00,$01,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$01,$01 
    db $01,$00,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$01,$00,$01,$00 
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00 
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00 
    db $01,$00,$01,$FF,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$01,$00 
    db $00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00 
    db $01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00 
    db $00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF 
    db $01,$00,$00,$FF,$01,$00,$01,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF 
    db $01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF 
    db $00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$FF 
    db $00,$FF,$01,$00,$00,$FF,$00,$FF,$01,$FF,$00,$FF,$00,$FF,$00,$FF 
    db $01,$00,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF 
    db $00,$FF,$FF,$00,$00,$FF,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF 
    db $FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$FF,$00 
    db $FF,$00,$FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00,$FF,$00,$00,$01 
    db $FF,$00,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$FF,$00,$00,$01 
    db $FF,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$FF,$00,$00,$01,$00,$01 
    db $FF,$00,$00,$01,$00,$01,$FF,$01,$00,$01,$80,$00 

BotwoonMovementData_Visible_BottomToRight:
    db $01,$00,$00,$FF,$01,$00,$00,$FF,$01,$FF,$01,$FF,$01,$FF,$01,$FF 
    db $00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00 
    db $00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF 
    db $01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$00,$FF 
    db $01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF 
    db $00,$FF,$01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF,$00,$FF 
    db $01,$00,$00,$FF,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF,$00,$FF 
    db $00,$FF,$01,$00,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF 
    db $01,$00,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF 
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF 
    db $FF,$00,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF 
    db $FF,$00,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF 
    db $00,$FF,$FF,$00,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF 
    db $FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$FF,$00,$00,$FF 
    db $FF,$00,$FF,$00,$FF,$00,$FF,$01,$FF,$00,$FF,$00,$FF,$00,$00,$01 
    db $FF,$00,$FF,$00,$FF,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00 
    db $FF,$01,$00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$00,$01,$FF,$00 
    db $00,$01,$00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$00,$01,$00,$01 
    db $00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01 
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01 
    db $FF,$00,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01 
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01 
    db $00,$01,$01,$00,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$01,$00 
    db $00,$01,$00,$01,$00,$01,$01,$00,$00,$01,$00,$01,$01,$00,$00,$01 
    db $00,$01,$01,$00,$00,$01,$01,$01,$00,$01,$01,$00,$00,$01,$01,$00 
    db $00,$01,$01,$00,$00,$01,$00,$01,$01,$00,$01,$01,$01,$00,$00,$01 
    db $01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$01,$00 
    db $00,$01,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00 
    db $01,$01,$01,$01,$01,$01,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01 
    db $01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01 
    db $01,$00,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$01,$00,$00,$01 
    db $01,$00,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$01,$00,$00,$01 
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00 
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$00,$FF 
    db $01,$00,$01,$00,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$01,$00 
    db $00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00 
    db $01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00 
    db $01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF 
    db $01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF 
    db $01,$FF,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$00,$FF,$01,$00 
    db $00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF 
    db $00,$FF,$01,$00,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$01,$00,$00,$FF 
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$FF,$00 
    db $00,$FF,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF,$00,$FF,$FF,$00 
    db $00,$FF,$FF,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF,$FF,$00,$00,$FF 
    db $FF,$00,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF,$FF,$00,$00,$FF 
    db $00,$FF,$FF,$00,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$FF,$00 
    db $00,$FF,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF,$00,$FF,$00,$FF 
    db $00,$FF,$01,$00,$00,$FF,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF 
    db $01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00 
    db $00,$FF,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00 
    db $00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00 
    db $01,$00,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$01,$00,$01,$00 
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$00,$01 
    db $01,$00,$01,$00,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$00,$01 
    db $01,$00,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$01,$01,$00,$01 
    db $01,$00,$00,$01,$01,$00,$00,$01,$00,$01,$01,$00,$00,$01,$00,$01 
    db $00,$01,$01,$00,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01 
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01 
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01 
    db $00,$01,$FF,$00,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01 
    db $00,$01,$FF,$00,$00,$01,$00,$01,$00,$01,$FF,$00,$00,$01,$00,$01 
    db $FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$FF,$00 
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$80,$00 

BotwoonMovementData_Visible_BottomToBottom:
    db $FF,$00,$00,$FF,$FF,$00,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00 
    db $00,$FF,$FF,$00,$FF,$00,$FF,$FF,$FF,$00,$FF,$FF,$FF,$00,$FF,$FF 
    db $FF,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$FF,$FF,$FF,$FF 
    db $FF,$FF,$00,$FF,$FF,$00,$00,$FF,$FF,$FF,$00,$FF,$00,$FF,$FF,$FF 
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF 
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF 
    db $00,$FF,$FF,$00,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$FF,$00 
    db $00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF 
    db $FF,$00,$00,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$00,$00,$FF,$FF,$00 
    db $FF,$00,$00,$FF,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00 
    db $FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00 
    db $FF,$00,$00,$FF,$FF,$00,$FF,$00,$FF,$FF,$FF,$00,$FF,$00,$00,$FF 
    db $FF,$00,$00,$FF,$FF,$00,$FF,$FF,$FF,$FF,$FF,$FF,$00,$FF,$FF,$00 
    db $00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF 
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF,$00,$FF 
    db $01,$FF,$00,$FF,$01,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF,$01,$00 
    db $00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00 
    db $00,$FF,$01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00 
    db $01,$FF,$01,$00,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$01,$00 
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00 
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00 
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00 
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00 
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$00,$01,$01,$00 
    db $01,$00,$01,$00,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$01,$00 
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00 
    db $01,$00,$01,$00,$01,$FF,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00 
    db $01,$00,$01,$FF,$01,$00,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00 
    db $01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$01,$00,$00,$FF,$01,$00 
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00 
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00 
    db $01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$01,$00,$01,$00,$00,$01 
    db $01,$00,$01,$00,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$01,$01 
    db $01,$01,$00,$01,$01,$00,$00,$01,$00,$01,$01,$01,$00,$01,$00,$01 
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01 
    db $00,$01,$00,$01,$FF,$01,$00,$01,$00,$01,$FF,$01,$00,$01,$FF,$01 
    db $00,$01,$FF,$00,$00,$01,$FF,$01,$FF,$01,$FF,$00,$00,$01,$FF,$00 
    db $00,$01,$FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00,$FF,$00,$00,$01 
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00,$FF,$00 
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$01,$FF,$00 
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00 
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00 
    db $FF,$01,$FF,$00,$FF,$00,$FF,$01,$FF,$00,$00,$01,$FF,$00,$00,$01 
    db $FF,$00,$00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$00,$01,$FF,$01 
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01 
    db $00,$01,$00,$01,$00,$01,$01,$00,$00,$01,$00,$01,$00,$01,$00,$01 
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01 
    db $00,$01,$00,$01,$FF,$01,$00,$01,$00,$01,$FF,$01,$00,$01,$00,$01 
    db $FF,$00,$00,$01,$00,$01,$FF,$01,$00,$01,$FF,$00,$00,$01,$00,$01 
    db $FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$FF,$01 
    db $FF,$00,$00,$01,$FF,$00,$FF,$01,$FF,$00,$00,$01,$FF,$00,$80,$00 

BotwoonMovementData_Visible_TopToLeft:
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$FF,$00,$00,$01 
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$FF,$00 
    db $00,$01,$00,$01,$00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$00,$01 
    db $FF,$00,$00,$01,$00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$00,$01 
    db $FF,$00,$00,$01,$00,$01,$FF,$01,$00,$01,$00,$01,$FF,$01,$00,$01 
    db $00,$01,$FF,$01,$00,$01,$00,$01,$00,$01,$FF,$01,$00,$01,$00,$01 
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$01,$00 
    db $00,$01,$00,$01,$00,$01,$01,$00,$00,$01,$00,$01,$01,$00,$00,$01 
    db $00,$01,$01,$00,$00,$01,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01 
    db $01,$00,$00,$01,$01,$01,$01,$01,$01,$00,$00,$01,$01,$00,$00,$01 
    db $01,$00,$01,$01,$01,$00,$00,$01,$01,$00,$01,$00,$00,$01,$01,$00 
    db $01,$00,$00,$01,$01,$00,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00 
    db $01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$01,$00,$01,$00,$01,$01 
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00 
    db $01,$00,$01,$00,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$01,$00 
    db $01,$00,$01,$00,$01,$01,$01,$00,$01,$00,$01,$00,$01,$01,$01,$00 
    db $01,$00,$00,$01,$01,$00,$01,$00,$01,$01,$01,$00,$00,$01,$01,$00 
    db $01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01,$01,$01,$01,$01 
    db $00,$01,$01,$01,$00,$01,$01,$01,$00,$01,$01,$01,$00,$01,$00,$01 
    db $01,$01,$00,$01,$00,$01,$00,$01,$01,$01,$00,$01,$00,$01,$00,$01 
    db $00,$01,$00,$01,$00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$FF,$00 
    db $00,$01,$FF,$01,$FF,$01,$FF,$00,$00,$01,$FF,$00,$FF,$00,$FF,$01 
    db $FF,$00,$FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00,$FF,$00,$FF,$00 
    db $FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00 
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00 
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00 
    db $FF,$00,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$FF,$FF,$FF,$00 
    db $FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$FF,$FF,$00 
    db $00,$FF,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$00,$FF 
    db $FF,$00,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF 
    db $FF,$00,$FF,$FF,$FF,$00,$00,$FF,$FF,$00,$FF,$FF,$FF,$00,$00,$FF 
    db $FF,$00,$FF,$FF,$FF,$00,$00,$FF,$FF,$00,$FF,$FF,$FF,$FF,$FF,$00 
    db $00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00 
    db $00,$FF,$FF,$00,$00,$FF,$FF,$FF,$FF,$FF,$FF,$FF,$00,$FF,$FF,$00 
    db $00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00 
    db $00,$FF,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF 
    db $FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$FF,$FF,$FF,$FF,$FF,$00 
    db $00,$FF,$FF,$00,$FF,$FF,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF 
    db $FF,$00,$FF,$00,$FF,$FF,$FF,$00,$FF,$00,$FF,$00,$00,$FF,$FF,$00 
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$01,$FF,$00,$FF,$00 
    db $00,$01,$FF,$00,$FF,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00 
    db $00,$01,$FF,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$FF,$01,$00,$01 
    db $00,$01,$00,$01,$FF,$01,$00,$01,$00,$01,$00,$01,$01,$01,$00,$01 
    db $00,$01,$00,$01,$00,$01,$01,$00,$00,$01,$00,$01,$01,$00,$00,$01 
    db $01,$01,$01,$01,$01,$01,$01,$00,$00,$01,$01,$00,$01,$01,$01,$00 
    db $01,$00,$00,$01,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00 
    db $01,$00,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00 
    db $01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF 
    db $01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF 
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF 
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$FF,$00 
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF,$00,$FF 
    db $FF,$00,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF,$FF,$00,$00,$FF 
    db $FF,$FF,$FF,$FF,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$FF,$FF,$FF,$FF 
    db $FF,$FF,$FF,$00,$00,$FF,$FF,$00,$FF,$FF,$FF,$00,$00,$FF,$FF,$00 
    db $FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF 
    db $FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$FF,$00,$00,$FF,$FF,$00 
    db $FF,$00,$00,$FF,$FF,$00,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00 
    db $00,$FF,$FF,$00,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF 
    db $FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00 
    db $00,$FF,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$00,$FF 
    db $FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF 
    db $FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$FF,$FF,$FF,$00,$FF,$FF,$00 
    db $00,$FF,$00,$FF,$FF,$00,$00,$FF,$FF,$FF,$00,$FF,$FF,$00,$80,$00 

BotwoonMovementData_Visible_TopToBottom:
    db $00,$01,$00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$00,$01,$00,$01 
    db $FF,$00,$00,$01,$00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$FF,$00 
    db $00,$01,$00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01 
    db $FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$FF,$00,$00,$01,$FF,$00 
    db $00,$01,$FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00,$00,$01,$FF,$00 
    db $FF,$00,$00,$01,$FF,$00,$FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00 
    db $FF,$00,$00,$01,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$01,$FF,$00 
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$01,$FF,$00,$FF,$00,$FF,$00 
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00 
    db $00,$01,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00 
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00 
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00 
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$FF 
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00 
    db $00,$01,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$01,$FF,$00 
    db $FF,$00,$00,$01,$FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00,$00,$01 
    db $FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$00,$01,$FF,$00 
    db $00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$00,$01,$00,$01,$FF,$00 
    db $00,$01,$00,$01,$00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$00,$01 
    db $00,$01,$FF,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01 
    db $00,$01,$00,$01,$00,$01,$00,$01,$01,$00,$00,$01,$00,$01,$00,$01 
    db $01,$00,$00,$01,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01,$00,$01 
    db $01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$01,$00 
    db $00,$01,$01,$00,$00,$01,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00 
    db $01,$00,$00,$01,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$00,$01 
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00 
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00 
    db $01,$00,$00,$FF,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00 
    db $01,$00,$00,$FF,$01,$00,$01,$00,$01,$00,$01,$00,$00,$FF,$01,$00 
    db $01,$00,$01,$00,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$01,$00 
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$01,$01,$00 
    db $01,$00,$00,$01,$01,$00,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00 
    db $00,$01,$01,$00,$00,$01,$01,$00,$80,$00 

BotwoonMovementData_Visible_TopToRight:
    db $01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$01,$00,$00,$01,$01,$00 
    db $00,$01,$01,$00,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01 
    db $01,$00,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00 
    db $00,$01,$01,$00,$00,$01,$01,$00,$01,$01,$01,$00,$00,$01,$00,$01 
    db $01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01 
    db $01,$00,$00,$01,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01,$00,$01 
    db $01,$00,$00,$01,$01,$00,$00,$01,$00,$01,$01,$00,$00,$01,$00,$01 
    db $01,$00,$00,$01,$00,$01,$00,$01,$01,$00,$00,$01,$00,$01,$01,$00 
    db $00,$01,$00,$01,$00,$01,$00,$01,$01,$00,$00,$01,$00,$01,$00,$01 
    db $00,$01,$00,$01,$01,$00,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01 
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01 
    db $00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01 
    db $FF,$01,$00,$01,$00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$00,$01 
    db $FF,$00,$00,$01,$00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$FF,$00 
    db $00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$FF,$00,$00,$01,$FF,$00 
    db $00,$01,$00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$00,$01,$FF,$00 
    db $00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00 
    db $00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00 
    db $00,$01,$FF,$00,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$FF,$00 
    db $00,$01,$FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00,$00,$01,$FF,$00 
    db $FF,$00,$00,$01,$FF,$00,$FF,$00,$FF,$00,$FF,$01,$FF,$00,$FF,$00 
    db $FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00 
    db $FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00 
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$01 
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00 
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00 
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$FF,$FF,$00 
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00 
    db $FF,$00,$00,$FF,$FF,$00,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00 
    db $00,$FF,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF,$FF,$00 
    db $00,$FF,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF 
    db $FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF 
    db $00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$00,$FF,$FF,$00,$00,$FF 
    db $00,$FF,$FF,$00,$00,$FF,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF 
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$01,$00 
    db $00,$FF,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF 
    db $00,$FF,$01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF 
    db $01,$FF,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF 
    db $01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00 
    db $00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00 
    db $01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$01,$00 
    db $00,$FF,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$00,$FF,$01,$00 
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00 
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00 
    db $01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$01,$00,$01,$00,$00,$01 
    db $01,$00,$01,$00,$01,$01,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00 
    db $00,$01,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$00,$01,$01,$00 
    db $00,$01,$01,$00,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$01,$00 
    db $00,$01,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$01,$00,$00,$01 
    db $01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01 
    db $01,$00,$00,$01,$01,$00,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00 
    db $00,$01,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00 
    db $00,$01,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01,$00,$01 
    db $01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01,$00,$01,$01,$00 
    db $00,$01,$01,$00,$00,$01,$00,$01,$01,$00,$00,$01,$00,$01,$01,$00 
    db $00,$01,$00,$01,$01,$01,$00,$01,$00,$01,$01,$00,$00,$01,$00,$01 
    db $00,$01,$01,$00,$00,$01,$00,$01,$01,$01,$00,$01,$00,$01,$01,$00 
    db $00,$01,$00,$01,$01,$00,$00,$01,$00,$01,$01,$00,$00,$01,$01,$00 
    db $00,$01,$01,$00,$00,$01,$01,$01,$01,$00,$00,$01,$01,$00,$00,$01 
    db $01,$00,$01,$01,$01,$00,$01,$01,$01,$00,$01,$00,$01,$00,$00,$01 
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00 
    db $00,$FF,$01,$00,$01,$00,$01,$FF,$01,$00,$00,$FF,$01,$00,$01,$00 
    db $00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00 
    db $00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$80,$00 

BotwoonMovementData_Visible_TopToTop:
    db $01,$00,$01,$00,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$01,$00 
    db $01,$00,$01,$00,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$01,$00 
    db $01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$01,$00,$01,$00,$00,$01 
    db $01,$00,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$01,$00,$00,$01 
    db $01,$00,$01,$00,$00,$01,$01,$00,$01,$01,$01,$00,$00,$01,$01,$00 
    db $00,$01,$01,$00,$01,$01,$01,$01,$00,$01,$01,$00,$00,$01,$01,$00 
    db $00,$01,$00,$01,$01,$00,$00,$01,$00,$01,$01,$00,$00,$01,$00,$01 
    db $00,$01,$01,$00,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01 
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01 
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01 
    db $00,$01,$01,$00,$00,$01,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01 
    db $01,$00,$00,$01,$01,$01,$01,$01,$00,$01,$01,$00,$00,$01,$01,$00 
    db $00,$01,$01,$00,$00,$01,$01,$00,$00,$01,$00,$01,$01,$00,$00,$01 
    db $00,$01,$00,$01,$01,$01,$00,$01,$00,$01,$FF,$00,$00,$01,$00,$01 
    db $00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$FF,$00,$00,$01,$FF,$00 
    db $00,$01,$FF,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$FF,$00 
    db $00,$01,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00 
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00 
    db $FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$FF,$00,$00,$FF,$FF,$00 
    db $FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00 
    db $00,$FF,$00,$FF,$FF,$00,$00,$FF,$FF,$FF,$00,$FF,$00,$FF,$FF,$00 
    db $00,$FF,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF,$00,$FF,$FF,$FF 
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF,$00,$FF 
    db $00,$FF,$FF,$00,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$FF,$00,$00,$FF 
    db $00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF 
    db $FF,$00,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF,$FF,$00,$00,$FF 
    db $FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF 
    db $FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00 
    db $FF,$00,$00,$FF,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00 
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$01,$FF,$00 
    db $FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00 
    db $00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00 
    db $00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$FF,$00,$00,$01,$00,$01 
    db $00,$01,$FF,$00,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$FF,$00 
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$FF,$00 
    db $00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$FF,$00,$00,$01,$FF,$00 
    db $FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$FF,$FF,$00,$FF,$00,$FF,$00 
    db $FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF 
    db $FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF 
    db $00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$00,$FF,$00,$FF,$FF,$00 
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF,$00,$FF 
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF 
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF,$00,$FF 
    db $00,$FF,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF,$00,$FF,$01,$00 
    db $00,$FF,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF 
    db $00,$FF,$01,$00,$00,$FF,$01,$FF,$00,$FF,$01,$00,$00,$FF,$01,$00 
    db $00,$FF,$01,$00,$00,$FF,$01,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF 
    db $01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00 
    db $01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$01,$00 
    db $00,$FF,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00 
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00 
    db $01,$00,$00,$01,$01,$00,$01,$00,$01,$00,$80,$00 

BotwoonMovementData_Visible_RightToLeft:
    db $FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$FF,$FF,$FF,$00,$00,$FF 
    db $FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00 
    db $FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF,$FF,$00 
    db $00,$FF,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$FF,$FF,$00,$00,$FF 
    db $FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$00,$FF 
    db $FF,$00,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00 
    db $FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF 
    db $FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00 
    db $FF,$00,$00,$FF,$FF,$00,$FF,$00,$FF,$00,$FF,$FF,$FF,$00,$FF,$00 
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00 
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00,$FF,$00 
    db $FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00 
    db $00,$01,$FF,$00,$00,$01,$FF,$00,$FF,$01,$00,$01,$FF,$00,$00,$01 
    db $FF,$00,$00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$00,$01,$FF,$00 
    db $00,$01,$00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$FF,$00,$00,$01 
    db $00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$00,$01,$FF,$00,$00,$01 
    db $00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$00,$01,$FF,$01,$00,$01 
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$FF,$00,$00,$01 
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$01,$00,$00,$01,$00,$01 
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01 
    db $00,$01,$00,$01,$00,$01,$01,$00,$00,$01,$00,$01,$00,$01,$00,$01 
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$01,$00,$00,$01 
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$01,$00 
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$01,$00,$00,$01,$00,$01 
    db $00,$01,$00,$01,$01,$00,$00,$01,$00,$01,$00,$01,$01,$00,$00,$01 
    db $00,$01,$01,$00,$00,$01,$01,$00,$00,$01,$00,$01,$01,$00,$00,$01 
    db $01,$00,$00,$01,$01,$00,$01,$00,$00,$01,$01,$00,$01,$01,$01,$00 
    db $01,$00,$00,$01,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00 
    db $01,$00,$01,$00,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$01,$00 
    db $00,$FF,$01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00,$00,$FF 
    db $01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF 
    db $00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF 
    db $00,$FF,$01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF,$00,$FF 
    db $00,$FF,$01,$00,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF 
    db $01,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF 
    db $00,$FF,$FF,$FF,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF,$FF,$00 
    db $00,$FF,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$00,$FF,$FF,$00 
    db $00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$FF,$FF,$FF,$00 
    db $00,$FF,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00 
    db $00,$FF,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$FF,$00,$00,$FF 
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$FF,$00 
    db $FF,$00,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$FF,$00,$FF,$00 
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00 
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00,$FF,$00 
    db $FF,$00,$00,$01,$FF,$00,$FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00 
    db $00,$01,$FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00,$00,$01,$FF,$00 
    db $FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$FF,$00,$00,$01,$FF,$00 
    db $FF,$00,$00,$01,$FF,$00,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00 
    db $FF,$00,$00,$01,$FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00,$00,$01 
    db $FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00 
    db $FF,$00,$00,$01,$FF,$00,$FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00 
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00 
    db $00,$FF,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$FF,$FF,$00,$00,$FF 
    db $FF,$00,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$00,$FF 
    db $FF,$00,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF,$00,$FF,$FF,$FF 
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF 
    db $01,$FF,$00,$FF,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF,$01,$00 
    db $00,$FF,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF 
    db $00,$FF,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF,$00,$FF,$00,$FF 
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF 
    db $FF,$00,$00,$FF,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF,$FF,$00 
    db $00,$FF,$FF,$00,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$FF,$00 
    db $00,$FF,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$FF,$00,$00,$FF 
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$80,$00 

BotwoonMovementData_Visible_RightToBottom:
    db $FF,$00,$00,$FF,$FF,$00,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00 
    db $FF,$00,$00,$FF,$FF,$00,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00 
    db $FF,$00,$00,$FF,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$FF,$FF,$00 
    db $FF,$00,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$FF,$00,$FF,$00 
    db $00,$FF,$FF,$00,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF 
    db $FF,$00,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$FF,$FF,$FF,$FF 
    db $FF,$FF,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$FF,$00,$FF 
    db $FF,$00,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF,$FF,$00,$00,$FF 
    db $00,$FF,$FF,$00,$00,$FF,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF 
    db $00,$FF,$FF,$00,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$FF,$00 
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$01,$FF,$00,$FF,$00,$FF,$00,$FF 
    db $01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF 
    db $01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00 
    db $01,$00,$01,$00,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$00,$01 
    db $01,$00,$01,$00,$00,$01,$01,$00,$00,$01,$00,$01,$01,$00,$00,$01 
    db $00,$01,$01,$00,$00,$01,$00,$01,$00,$01,$00,$01,$01,$00,$00,$01 
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01 
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01 
    db $00,$01,$00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$00,$01,$FF,$00 
    db $00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$FF,$00,$00,$01,$FF,$00 
    db $00,$01,$FF,$00,$00,$01,$FF,$00,$FF,$00,$00,$01,$FF,$00,$00,$01 
    db $FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00 
    db $00,$01,$FF,$00,$FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00,$FF,$00 
    db $FF,$01,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00 
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00,$FF,$00 
    db $FF,$00,$FF,$00,$FF,$00,$FF,$01,$FF,$00,$FF,$00,$FF,$00,$FF,$00 
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00,$FF,$00 
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00 
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$FF,$FF,$00 
    db $FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$FF 
    db $FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF 
    db $FF,$FF,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$00,$FF,$FF,$00 
    db $00,$FF,$FF,$00,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$FF,$FF,$00,$FF 
    db $FF,$00,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF,$00,$FF,$FF,$00 
    db $00,$FF,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF,$00,$FF,$00,$FF 
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$01,$00,$00,$FF 
    db $00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF 
    db $01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00 
    db $01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00 
    db $01,$00,$00,$01,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$00,$01 
    db $01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01,$01,$01,$00,$01 
    db $01,$00,$00,$01,$00,$01,$01,$00,$00,$01,$01,$01,$00,$01,$00,$01 
    db $01,$00,$00,$01,$00,$01,$01,$01,$00,$01,$00,$01,$00,$01,$01,$00 
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01 
    db $00,$01,$01,$00,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01 
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$01,$00 
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$01,$00,$00,$01 
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$01,$00,$00,$01,$00,$01 
    db $00,$01,$00,$01,$00,$01,$00,$01,$01,$00,$00,$01,$00,$01,$00,$01 
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01 
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$FF,$00 
    db $00,$01,$00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$FF,$00,$FF,$00 
    db $00,$01,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$FF,$FF,$00 
    db $FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$FF,$FF,$FF,$00,$FF,$FF 
    db $FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF 
    db $FF,$00,$80,$00 

BotwoonMovementData_Visible_RightToTop:
    db $FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$FF,$00,$00,$01,$FF,$00 
    db $FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$FF,$00,$00,$01,$FF,$00 
    db $00,$01,$FF,$00,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$FF,$00 
    db $00,$01,$FF,$00,$00,$01,$FF,$00,$FF,$00,$00,$01,$FF,$00,$00,$01 
    db $FF,$00,$FF,$01,$FF,$00,$00,$01,$FF,$00,$FF,$00,$00,$01,$FF,$00 
    db $00,$01,$FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00,$FF,$00,$00,$01 
    db $FF,$00,$FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00,$FF,$00,$FF,$00 
    db $00,$01,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00 
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00 
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$FF,$00 
    db $FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$FF,$00,$00,$FF,$FF,$00 
    db $FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00 
    db $00,$FF,$FF,$00,$FF,$FF,$FF,$00,$00,$FF,$00,$FF,$FF,$00,$00,$FF 
    db $FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$FF,$00,$FF,$FF,$00,$00,$FF 
    db $00,$FF,$FF,$00,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF,$00,$FF 
    db $FF,$00,$00,$FF,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF,$00,$FF 
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF 
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF,$00,$FF 
    db $01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF 
    db $00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00 
    db $00,$FF,$01,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF 
    db $01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00 
    db $01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$01,$FF 
    db $01,$00,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$01,$00,$01,$00 
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$00,$01 
    db $01,$00,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$00,$01,$01,$00 
    db $01,$00,$00,$01,$01,$00,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00 
    db $00,$01,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01,$00,$01 
    db $01,$00,$00,$01,$01,$01,$00,$01,$00,$01,$01,$00,$00,$01,$00,$01 
    db $00,$01,$01,$00,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01 
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01 
    db $FF,$00,$00,$01,$00,$01,$00,$01,$00,$01,$FF,$00,$00,$01,$00,$01 
    db $FF,$00,$00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$FF,$00,$00,$01 
    db $FF,$00,$00,$01,$00,$01,$FF,$00,$00,$01,$FF,$00,$FF,$00,$00,$01 
    db $FF,$00,$00,$01,$FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00,$FF,$00 
    db $FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00,$FF,$00,$00,$FF,$FF,$00 
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF 
    db $FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$FF,$FF,$FF,$00,$FF,$FF,$00 
    db $00,$FF,$FF,$00,$00,$FF,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF 
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF 
    db $00,$FF,$01,$00,$00,$FF,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF 
    db $00,$FF,$01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF 
    db $01,$FF,$01,$FF,$01,$00,$00,$FF,$01,$00,$01,$FF,$01,$00,$01,$00 
    db $01,$00,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$00,$01,$01,$00 
    db $01,$01,$01,$00,$00,$01,$01,$00,$00,$01,$00,$01,$01,$00,$00,$01 
    db $01,$00,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$FF,$00 
    db $00,$01,$00,$01,$FF,$00,$FF,$01,$FF,$00,$00,$01,$FF,$00,$FF,$00 
    db $00,$01,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$FF,$FF,$00 
    db $FF,$00,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$00,$FF 
    db $00,$FF,$FF,$00,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$FF,$00 
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF,$00,$FF 
    db $00,$FF,$FF,$00,$00,$FF,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF 
    db $00,$FF,$FF,$00,$00,$FF,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF 
    db $FF,$00,$00,$FF,$00,$FF,$FF,$FF,$00,$FF,$00,$FF,$FF,$00,$00,$FF 
    db $80,$00 

BotwoonMovementData_Visible_RightToRight:
    db $FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$FF,$FF,$FF,$00,$00,$FF 
    db $FF,$00,$FF,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$FF,$00 
    db $00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF 
    db $FF,$00,$00,$FF,$FF,$00,$FF,$FF,$FF,$00,$00,$FF,$FF,$00,$FF,$FF 
    db $FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF 
    db $FF,$00,$FF,$00,$FF,$FF,$FF,$00,$FF,$00,$FF,$00,$00,$FF,$FF,$00 
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$FF,$FF,$00,$FF,$00,$FF,$00 
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$FF,$00 
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00 
    db $FF,$00,$00,$01,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$01 
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00 
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00,$FF,$00 
    db $FF,$01,$FF,$00,$FF,$00,$FF,$01,$FF,$00,$FF,$01,$FF,$00,$00,$01 
    db $FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00,$FF,$01,$FF,$00,$FF,$00 
    db $FF,$00,$00,$01,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00 
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00 
    db $FF,$00,$FF,$00,$FF,$00,$FF,$01,$FF,$00,$FF,$00,$FF,$00,$FF,$00 
    db $00,$01,$FF,$00,$FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00,$00,$01 
    db $FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00,$00,$01,$FF,$00,$00,$01 
    db $FF,$00,$FF,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$01,$FF,$01 
    db $00,$01,$FF,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01 
    db $00,$01,$00,$01,$00,$01,$01,$01,$00,$01,$00,$01,$01,$00,$00,$01 
    db $01,$01,$01,$01,$00,$01,$01,$00,$01,$01,$01,$00,$00,$01,$01,$00 
    db $01,$00,$00,$01,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$01,$00 
    db $01,$00,$00,$01,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00 
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00 
    db $01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00 
    db $01,$00,$00,$01,$01,$00,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00 
    db $00,$01,$01,$00,$01,$01,$01,$00,$00,$01,$01,$00,$01,$01,$01,$00 
    db $00,$01,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01,$00,$01 
    db $01,$00,$00,$01,$01,$00,$00,$01,$00,$01,$01,$00,$00,$01,$00,$01 
    db $01,$00,$00,$01,$00,$01,$00,$01,$00,$01,$01,$00,$00,$01,$00,$01 
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01 
    db $FF,$00,$00,$01,$00,$01,$00,$01,$FF,$01,$00,$01,$00,$01,$FF,$00 
    db $00,$01,$00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$01,$FF,$01 
    db $FF,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$FF,$00,$00,$01 
    db $FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00,$FF,$00,$FF,$01,$FF,$00 
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00 
    db $FF,$FF,$FF,$00,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$FF,$FF 
    db $FF,$00,$00,$FF,$FF,$00,$FF,$FF,$FF,$FF,$FF,$FF,$00,$FF,$FF,$00 
    db $00,$FF,$FF,$FF,$00,$FF,$FF,$FF,$00,$FF,$00,$FF,$FF,$00,$00,$FF 
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF 
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF 
    db $00,$FF,$01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF,$01,$FF,$00,$FF 
    db $01,$00,$00,$FF,$01,$00,$00,$FF,$01,$FF,$00,$FF,$01,$00,$00,$FF 
    db $01,$00,$01,$FF,$01,$FF,$01,$00,$00,$FF,$01,$00,$01,$FF,$01,$00 
    db $00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00 
    db $01,$00,$00,$FF,$01,$00,$01,$00,$01,$FF,$01,$00,$01,$00,$01,$FF 
    db $01,$00,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$01,$00,$01,$00 
    db $01,$FF,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$FF,$01,$00 
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$00,$FF 
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00 
    db $01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00 
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00 
    db $01,$00,$01,$00,$01,$00,$01,$01,$01,$00,$01,$00,$01,$00,$01,$00 
    db $01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00 
    db $01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00 
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$FF,$01,$00,$01,$00 
    db $01,$00,$01,$FF,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$01,$FF 
    db $01,$00,$00,$FF,$01,$00,$01,$FF,$01,$FF,$01,$00,$00,$FF,$01,$FF 
    db $00,$FF,$01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF,$00,$FF 
    db $00,$FF,$01,$00,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$80,$00 

BotwoonMovementData_Hidden_LeftToFromBottom:
    db $01,$00,$00,$01,$01,$00,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00 
    db $00,$01,$01,$00,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$01,$00 
    db $00,$01,$01,$00,$00,$01,$01,$00,$00,$01,$00,$01,$01,$00,$00,$01 
    db $01,$01,$00,$01,$00,$01,$01,$00,$00,$01,$00,$01,$01,$00,$00,$01 
    db $00,$01,$01,$00,$00,$01,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01 
    db $01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$01,$00,$01,$00,$00,$01 
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00 
    db $00,$01,$01,$00,$01,$01,$00,$01,$01,$00,$00,$01,$00,$01,$00,$01 
    db $01,$00,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$FF,$00 
    db $00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$FF,$00,$FF,$00,$00,$01 
    db $FF,$00,$00,$01,$FF,$00,$FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00 
    db $FF,$00,$00,$01,$FF,$00,$FF,$00,$00,$01,$FF,$00,$FF,$00,$00,$01 
    db $FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$00,$01,$FF,$00 
    db $00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01 
    db $00,$01,$00,$01,$00,$01,$00,$01,$01,$00,$00,$01,$00,$01,$01,$00 
    db $00,$01,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00 
    db $00,$01,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$00,$01,$01,$00 
    db $01,$00,$00,$01,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$00,$01 
    db $01,$00,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$01,$00,$01,$00 
    db $01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF 
    db $01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00 
    db $00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00 
    db $00,$FF,$01,$00,$00,$FF,$01,$00,$01,$00,$01,$00,$01,$00,$00,$01 
    db $01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01 

BotwoonMovementData_Hidden_LeftToFromBottom_End:
    db $80,$00 

BotwoonMovementData_Hidden_LeftToFromTop:
    db $01,$00,$00,$FF,$01,$00,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00 
    db $01,$00,$00,$FF,$01,$00,$01,$00,$01,$FF,$01,$00,$01,$00,$01,$00 
    db $00,$FF,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$00,$FF,$01,$00 
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00 
    db $01,$00,$00,$01,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$00,$01 
    db $01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01,$00,$01,$01,$00 
    db $00,$01,$00,$01,$01,$00,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01 
    db $00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$00,$01,$00,$01,$FF,$00 
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$01,$00 
    db $00,$01,$00,$01,$01,$00,$00,$01,$00,$01,$01,$00,$00,$01,$00,$01 
    db $01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$01,$00,$00,$01,$01,$00 
    db $00,$01,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$01,$00,$01,$00 
    db $00,$01,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$00,$FF 
    db $01,$00,$01,$00,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$01,$00 
    db $00,$FF,$01,$00,$01,$FF,$01,$00,$00,$FF,$01,$00,$01,$FF,$01,$00 
    db $00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF 
    db $01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF,$00,$FF,$01,$00 
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF 
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$FF,$00 
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$FF,$00,$00,$FF 
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF,$00,$FF 
    db $01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF 
    db $01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00 
    db $01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$01,$00,$01,$00,$00,$01 
    db $01,$00,$01,$00,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$01,$01 
    db $01,$00,$01,$00,$00,$01,$01,$00 

BotwoonMovementData_Hidden_LeftToFromTop_End:
    db $80,$00 

BotwoonMovementData_Hidden_LeftToFromRight:
    db $00,$01,$01,$00,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$01,$00 
    db $00,$01,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$00,$01,$01,$00 
    db $01,$00,$00,$01,$01,$00,$01,$00,$00,$01,$01,$00,$01,$01,$01,$00 
    db $00,$01,$01,$00,$00,$01,$01,$00,$01,$00,$00,$01,$01,$00,$00,$01 
    db $01,$00,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$01,$00,$00,$01 
    db $01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00 
    db $00,$01,$01,$00,$01,$00,$01,$00,$00,$01,$01,$00,$01,$01,$01,$00 
    db $00,$01,$01,$00,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01 
    db $01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01 
    db $01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$01,$00,$00,$01,$01,$00 
    db $00,$01,$01,$00,$00,$01,$01,$00,$01,$00,$00,$01,$01,$00,$00,$01 
    db $01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00 
    db $00,$01,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$00,$01,$01,$00 
    db $01,$00,$00,$01,$01,$00,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00 
    db $00,$01,$01,$00,$01,$00,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00 
    db $01,$00,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$01,$00,$01,$00 
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00 
    db $01,$00,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$01,$00,$01,$00 
    db $01,$00,$01,$00,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$01,$00 
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00 
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00 
    db $01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00 
    db $00,$01,$01,$00,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$01,$00 
    db $01,$00,$00,$01,$01,$00,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00 
    db $01,$00,$01,$00,$01,$01,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00 
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$00,$FF,$01,$00 
    db $01,$00,$01,$00 

BotwoonMovementData_Hidden_LeftToFromRight_End:
    db $80,$00 

BotwoonMovementData_Hidden_BottomToFromTop:
    db $01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00 
    db $00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF 
    db $01,$00,$00,$FF,$01,$00,$01,$FF,$01,$FF,$01,$FF,$01,$FF,$00,$FF 
    db $01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$00,$FF,$01,$00 
    db $00,$FF,$01,$FF,$00,$FF,$01,$FF,$00,$FF,$00,$FF,$01,$00,$00,$FF 
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF 
    db $00,$FF,$FF,$00,$00,$FF,$00,$FF,$FF,$00,$00,$FF,$00,$FF,$FF,$00 
    db $00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00,$00,$FF,$FF,$00 
    db $00,$FF,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00,$FF,$00,$00,$FF 
    db $FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$00 
    db $FF,$00,$00,$FF,$FF,$00,$FF,$00,$00,$FF,$FF,$00,$FF,$FF,$00,$FF 
    db $FF,$00,$00,$FF,$FF,$FF,$00,$FF,$00,$FF,$00,$FF,$FF,$00,$00,$FF 
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF 
    db $00,$FF,$01,$00,$00,$FF,$01,$FF,$01,$00,$00,$FF,$01,$00,$01,$00 
    db $00,$FF,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$01,$01,$00 
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00 
    db $01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$01,$00,$00,$FF,$01,$00 
    db $00,$FF,$01,$00,$01,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00 
    db $00,$FF,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF 
    db $00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF 

BotwoonMovementData_Hidden_BottomToFromTop_End:
    db $80,$00 

BotwoonMovementData_Hidden_BottomToFromRight:
    db $01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF 
    db $01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF 
    db $01,$00,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF 
    db $01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00 
    db $00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00 
    db $00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF,$00,$FF,$01,$00,$00,$FF 
    db $00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$00,$FF 
    db $FF,$00,$00,$FF,$00,$FF,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF 
    db $00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF,$01,$00 
    db $01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$01,$00 
    db $01,$00,$00,$FF,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00 
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00 
    db $00,$01,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$00,$01,$01,$00 
    db $01,$01,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01,$00,$01,$01,$00 
    db $00,$01,$00,$01,$01,$00,$00,$01,$00,$01,$01,$00,$00,$01,$00,$01 
    db $01,$00,$00,$01,$00,$01,$01,$00,$00,$01,$01,$00,$00,$01,$01,$01 
    db $01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$01,$00,$00,$01,$01,$00 
    db $01,$00,$00,$01,$01,$00,$01,$00,$01,$00,$01,$00,$00,$01,$01,$00 
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00 
    db $01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF 
    db $01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF 
    db $01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF 

BotwoonMovementData_Hidden_BottomToFromRight_End:
    db $80,$00 

BotwoonMovementData_Hidden_TopToFromRight:
    db $00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$FF,$00,$00,$01,$00,$01 
    db $FF,$00,$00,$01,$FF,$00,$00,$01,$00,$01,$FF,$00,$00,$01,$00,$01 
    db $FF,$00,$00,$01,$00,$01,$FF,$00,$00,$01,$00,$01,$00,$01,$FF,$00 
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01 
    db $00,$01,$00,$01,$00,$01,$00,$01,$01,$00,$00,$01,$00,$01,$00,$01 
    db $01,$00,$00,$01,$01,$00,$00,$01,$00,$01,$01,$00,$00,$01,$01,$00 
    db $00,$01,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$01,$00,$00,$01 
    db $01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$01,$00,$00,$01,$01,$00 
    db $01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00 
    db $00,$FF,$01,$00,$01,$00,$01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF 
    db $01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF 
    db $01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$00,$FF 
    db $01,$00,$00,$FF,$01,$00,$00,$FF,$01,$00,$01,$00,$00,$FF,$01,$00 
    db $01,$00,$00,$FF,$01,$00,$01,$00,$01,$00,$01,$00,$00,$FF,$01,$00 
    db $01,$00,$01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$00,$01,$00,$01 
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$FF,$00 
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00,$01 
    db $00,$01,$00,$01,$00,$01,$00,$01,$00,$01,$01,$01,$00,$01,$00,$01 
    db $01,$00,$00,$01,$01,$00,$00,$01,$01,$01,$00,$01,$01,$00,$00,$01 
    db $01,$00,$01,$00,$00,$01,$01,$00,$00,$01,$01,$00,$01,$00,$00,$01 
    db $01,$00,$01,$00,$00,$01,$01,$00,$01,$00,$01,$00,$01,$00,$01,$00 
    db $00,$FF,$01,$00,$01,$00,$00,$FF,$00,$FF,$01,$00,$00,$FF,$00,$FF 
    db $01,$00,$00,$FF,$00,$FF,$00,$FF,$01,$FF,$00,$FF,$00,$FF 

BotwoonMovementData_Hidden_TopToFromRight_End:
    db $80,$00 

BotwoonMovementTable:
    dw BotwoonMovementData_Visible_LeftToBottom 
    dw $0000,$0008,$0000 
    dw BotwoonMovementData_Visible_LeftToTop 
    dw $0000,$0010,$0000 
    dw BotwoonMovementData_Visible_LeftToRight 
    dw $0000,$0018,$0000 
    dw BotwoonMovementData_Visible_LeftToLeft 
    dw $0000,$0000,$0000 
    dw BotwoonMovementData_Visible_BottomToLeft 
    dw $0000,$0000,$0000 
    dw BotwoonMovementData_Visible_BottomToTop 
    dw $0000,$0010,$0000 
    dw BotwoonMovementData_Visible_BottomToRight 
    dw $0000,$0018,$0000 
    dw BotwoonMovementData_Visible_BottomToBottom 
    dw $0000,$0008,$0000 
    dw BotwoonMovementData_Visible_TopToLeft 
    dw $0000,$0000,$0000 
    dw BotwoonMovementData_Visible_TopToBottom 
    dw $0000,$0008,$0000 
    dw BotwoonMovementData_Visible_TopToRight 
    dw $0000,$0018,$0000 
    dw BotwoonMovementData_Visible_TopToTop 
    dw $0000,$0010,$0000 
    dw BotwoonMovementData_Visible_RightToLeft 
    dw $0000,$0000,$0000 
    dw BotwoonMovementData_Visible_RightToBottom 
    dw $0000,$0008,$0000 
    dw BotwoonMovementData_Visible_RightToTop 
    dw $0000,$0010,$0000 
    dw BotwoonMovementData_Visible_RightToRight 
    dw $0000,$0018,$0000 
    dw BotwoonMovementData_Hidden_LeftToFromBottom 
    dw $0000,$0008,$0000 
    dw BotwoonMovementData_Hidden_LeftToFromTop 
    dw $0000,$0010,$0000 
    dw BotwoonMovementData_Hidden_LeftToFromRight 
    dw $0000,$0018,$0000 
    dw BotwoonMovementData_Hidden_LeftToFromRight 
    dw $0000,$0018,$0000 
    dw BotwoonMovementData_Hidden_LeftToFromBottom_End 
    dw $FFFF,$0000,$0000 
    dw BotwoonMovementData_Hidden_BottomToFromTop 
    dw $0000,$0010,$0000 
    dw BotwoonMovementData_Hidden_BottomToFromRight 
    dw $0000,$0018,$0000 
    dw BotwoonMovementData_Hidden_BottomToFromRight 
    dw $0000,$0018,$0000 
    dw BotwoonMovementData_Hidden_LeftToFromTop_End 
    dw $FFFF,$0000,$0000 
    dw BotwoonMovementData_Hidden_BottomToFromTop_End 
    dw $FFFF,$0008,$0000 
    dw BotwoonMovementData_Hidden_TopToFromRight 
    dw $0000,$0018,$0000 
    dw BotwoonMovementData_Hidden_TopToFromRight 
    dw $0000,$0018,$0000 
    dw BotwoonMovementData_Hidden_LeftToFromRight_End 
    dw $FFFF,$0000,$0000 
    dw BotwoonMovementData_Hidden_BottomToFromRight_End 
    dw $FFFF,$0008,$0000 
    dw BotwoonMovementData_Hidden_TopToFromRight_End 
    dw $FFFF,$0010,$0000 
    dw BotwoonMovementData_Hidden_TopToFromRight_End 
    dw $FFFF,$0010,$0000 

Function_Botwoon_Movement_StartMovingAccordingToMovementData:
    LDX.W $0E54 
    LDA.W #Function_Botwoon_Movement_MoveAccordingToMovementData : STA.W $0FB0,X 
    LDA.W #$0000 : STA.L $7E8038,X 
    LDA.L $7E8800,X 
    CLC 
    ADC.W #BotwoonMovementTable 
    TAY 
    LDA.W $0000,Y : STA.L $7E8804,X 
    LDA.W $0004,Y : STA.L $7E802E,X 
    LDA.W $0002,Y : STA.L $7E8808,X 
    BPL Function_Botwoon_Movement_MoveAccordingToMovementData 
    LDA.L $7E8804,X 
    SEC 
    SBC.W #$0004 
    STA.L $7E8804,X 

Function_Botwoon_Movement_MoveAccordingToMovementData:
    LDX.W $0E54 
    STZ.B $12 
    STZ.B $14 
    LDA.L $7E8030,X : STA.B $18 
    LDA.W #$0002 : STA.B $16 
    LDA.L $7E8808,X 
    BPL .loop 
    LDA.W #$FFFE : STA.B $16 

.loop:
    LDA.L $7E8804,X 
    TAY 
    LDA.W $0000,Y 
    AND.W #$00FF 
    JSL.L Sign_Extend_A 
    CMP.W #$FF80 
    BEQ .end 
    CLC 
    ADC.B $12 
    STA.B $12 
    LDA.W $0001,Y 
    AND.W #$00FF 
    JSL.L Sign_Extend_A 
    CMP.W #$FF80 
    BEQ .end 
    CLC 
    ADC.B $14 
    STA.B $14 
    LDA.L $7E8804,X 
    CLC 
    ADC.B $16 
    STA.L $7E8804,X 
    DEC.B $18 
    BNE .loop 
    LDA.L $7E8808,X 
    BPL .positive 
    LDA.B $12 
    EOR.W #$FFFF 
    INC A 
    STA.B $12 
    LDA.B $14 
    EOR.W #$FFFF 
    INC A 
    STA.B $14 

.positive:
    LDA.W $0F7A,X 
    CLC 
    ADC.B $12 
    STA.W $0F7A,X 
    LDA.W $0F7E,X 
    CLC 
    ADC.B $14 
    STA.W $0F7E,X 
    RTS 


.end:
    LDA.W #$0000 : STA.L $7E8802,X 
    LDA.W #$0001 : STA.L $7E8038,X 
    RTS 


Spritemaps_Botwoon_MouthClosed_Priority2_AimingUp_FacingLeft:
    dw $0002,$81F8 
    db $F7 
    dw $2122,$81F8 
    db $E7 
    dw $2120 

Spritemaps_Botwoon_MouthClosed_Priority2_AimingUpLeft:
    dw $0002,$81F8 
    db $F6 
    dw $2106,$81F0 
    db $EE 
    dw $2104 

Spritemaps_Botwoon_MouthClosed_Priority2_AimingLeft:
    dw $0002,$81FC 
    db $F8 
    dw $2102,$81EC 
    db $F8 
    dw $2100 

Spritemaps_Botwoon_MouthClosed_Priority2_AimingDownLeft:
    dw $0002,$81F8 
    db $F9 
    dw $210A,$81F0 
    db $01 
    dw $2108 

Spritemaps_Botwoon_MouthClosed_Priority2_AimDown_FacingLeft:
    dw $0002,$81F8 
    db $09 
    dw $210E,$81F8 
    db $F9 
    dw $210C 

Spritemaps_Botwoon_MouthClosed_Priority2_AimDown_FacingRight:
    dw $0002,$81F8 
    db $09 
    dw $610E,$81F8 
    db $F9 
    dw $610C 

Spritemaps_Botwoon_MouthClosed_Priority2_AimingDownRight:
    dw $0002,$8000 
    db $01 
    dw $6108,$81F8 
    db $F9 
    dw $610A 

Spritemaps_Botwoon_MouthClosed_Priority2_AimingRight:
    dw $0002,$81F4 
    db $F8 
    dw $6102,$8004 
    db $F8 
    dw $6100 

Spritemaps_Botwoon_MouthClosed_Priority2_AimingUpRight:
    dw $0002,$8000 
    db $EE 
    dw $6104,$81F8 
    db $F6 
    dw $6106 

Spritemaps_Botwoon_MouthClosed_Priority2_AimUp_FacingRight:
    dw $0002,$81F8 
    db $F7 
    dw $6122,$81F8 
    db $E7 
    dw $6120 

Spritemaps_Botwoon_MouthOpen_Priority2_AimingUp_FacingLeft:
    dw $0002,$81F8 
    db $F8 
    dw $2126,$81F8 
    db $E8 
    dw $2124 

Spritemaps_Botwoon_MouthOpen_Priority2_AimingUpLeft:
    dw $0003,$01F0 
    db $00 
    dw $21A6,$81F8 
    db $F8 
    dw $2186,$81F0 
    db $F0 
    dw $2184 

Spritemaps_Botwoon_MouthOpen_Priority2_AimingLeft:
    dw $0002,$81FC 
    db $F8 
    dw $2182,$81EC 
    db $F8 
    dw $2180 

Spritemaps_Botwoon_MouthOpen_Priority2_AimingDownLeft:
    dw $0003,$0000 
    db $09 
    dw $21A7,$81F8 
    db $F9 
    dw $218A,$81F0 
    db $01 
    dw $2188 

Spritemaps_Botwoon_MouthOpen_Priority2_AimingDown_FacingLeft:
    dw $0002,$81F8 
    db $09 
    dw $218E,$81F8 
    db $F9 
    dw $218C 

Spritemaps_Botwoon_MouthOpen_Priority2_AimDown_FacingRight:
    dw $0002,$81F8 
    db $09 
    dw $618E,$81F8 
    db $F9 
    dw $618C 

Spritemaps_Botwoon_MouthOpen_Priority2_AimingDownRight:
    dw $0003,$01F8 
    db $09 
    dw $61A7,$81F8 
    db $F9 
    dw $618A,$8000 
    db $01 
    dw $6188 

Spritemaps_Botwoon_MouthOpen_Priority2_AimingRight:
    dw $0002,$81F4 
    db $F8 
    dw $6182,$8004 
    db $F8 
    dw $6180 

Spritemaps_Botwoon_MouthOpen_Priority2_AimingUpRight:
    dw $0003,$0008 
    db $00 
    dw $61A6,$81F8 
    db $F8 
    dw $6186,$8000 
    db $F0 
    dw $6184 

Spritemaps_Botwoon_MouthOpen_Priority2_AimingUp_FacingRight:
    dw $0002,$81F8 
    db $F8 
    dw $6126,$81F8 
    db $E8 
    dw $6124 

Spritemaps_Botwoon_MouthClosed_Priority0_AimingUp_FacingLeft:
    dw $0002,$81F8 
    db $F7 
    dw $0122,$81F8 
    db $E7 
    dw $0120 

Spritemaps_Botwoon_MouthClosed_Priority0_AimingUpLeft:
    dw $0002,$81F8 
    db $F6 
    dw $0106,$81F0 
    db $EE 
    dw $0104 

Spritemaps_Botwoon_MouthClosed_Priority0_AimingLeft:
    dw $0002,$81FC 
    db $F8 
    dw $0102,$81EC 
    db $F8 
    dw $0100 

Spritemaps_Botwoon_MouthClosed_Priority0_AimingDownLeft:
    dw $0002,$81F8 
    db $F9 
    dw $010A,$81F0 
    db $01 
    dw $0108 

Spritemaps_Botwoon_MouthClosed_Priority0_AimDown_FacingLeft:
    dw $0002,$81F8 
    db $09 
    dw $010E,$81F8 
    db $F9 
    dw $010C 

Spritemaps_Botwoon_MouthClosed_Priority0_AimDown_FacingRight:
    dw $0002,$81F8 
    db $09 
    dw $410E,$81F8 
    db $F9 
    dw $410C 

Spritemaps_Botwoon_MouthClosed_Priority0_AimingDownRight:
    dw $0002,$8000 
    db $01 
    dw $4108,$81F8 
    db $F9 
    dw $410A 

Spritemaps_Botwoon_MouthClosed_Priority0_AimingRight:
    dw $0002,$81F4 
    db $F8 
    dw $4102,$8004 
    db $F8 
    dw $4100 

Spritemaps_Botwoon_MouthClosed_Priority0_AimingUpRight:
    dw $0002,$8000 
    db $EE 
    dw $4104,$81F8 
    db $F6 
    dw $4106 

Spritemaps_Botwoon_MouthClosed_Priority0_AimUp_FacingRight:
    dw $0002,$81F8 
    db $F7 
    dw $4122,$81F8 
    db $E7 
    dw $4120 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemaps_Botwoon_MouthOpen_Prio0_UpFaceLeft_B3E499:
    dw $0002,$81F8 
    db $F8 
    dw $0126,$81F8 
    db $E8 
    dw $0124 

UNUSED_Spritemaps_Botwoon_MouthOpen_Prio0_UpLeft_B3E4A5:
    dw $0003,$01F0 
    db $00 
    dw $01A6,$81F8 
    db $F8 
    dw $0186,$81F0 
    db $F0 
    dw $0184 

UNUSED_Spritemaps_Botwoon_MouthOpen_Prio0_Left_B3E4B6:
    dw $0002,$81FC 
    db $F8 
    dw $0182,$81EC 
    db $F8 
    dw $0180 

UNUSED_Spritemaps_Botwoon_MouthOpen_Prio0_DownLeft_B3E4C2:
    dw $0003,$0000 
    db $09 
    dw $01A7,$81F8 
    db $F9 
    dw $018A,$81F0 
    db $01 
    dw $0188 

UNUSED_Spritemap_Botwoon_MouthOpen_Prio0_DownFaceLeft_B3E4D3:
    dw $0002,$81F8 
    db $09 
    dw $018E,$81F8 
    db $F9 
    dw $018C 

UNUSED_Spritemap_Botwoon_MouthOpen_Pri0_DownFaceRight_B3E4DF:
    dw $0002,$81F8 
    db $09 
    dw $418E,$81F8 
    db $F9 
    dw $418C 

UNUSED_Spritemaps_Botwoon_MouthOpen_Prio0_DownRight_B3E4EB:
    dw $0003,$01F8 
    db $09 
    dw $41A7,$81F8 
    db $F9 
    dw $418A,$8000 
    db $01 
    dw $4188 

UNUSED_Spritemaps_Botwoon_MouthOpen_Prio0_Right_B3E4FC:
    dw $0002,$81F4 
    db $F8 
    dw $4182,$8004 
    db $F8 
    dw $4180 

UNUSED_Spritemaps_Botwoon_MouthOpen_Prio0_UpRight_B3E508:
    dw $0003,$0008 
    db $00 
    dw $41A6,$81F8 
    db $F8 
    dw $4186,$8000 
    db $F0 
    dw $4184 

UNUSED_Spritemaps_Botwoon_MouthOpen_Prio0_UpFaceRight_B3E519:
    dw $0002,$81F8 
    db $F8 
    dw $4126,$81F8 
    db $E8 
    dw $4124 
endif ; !FEATURE_KEEP_UNREFERENCED

Palette_EtecoonEscape:
    dw $3800,$5F97,$56F2,$2987,$00A0,$6355,$4AB0,$3A0B 
    dw $31C9,$57FF,$42F7,$2610,$158C,$03FF,$0279,$0029 

Instruction_EtecoonEscape_GotoY_IfAcidPositionLessThanCE:
    LDA.W $1962 
    CMP.W #$00CE 
    BCS .greaterThanCE 
    LDA.W $0000,Y 
    TAY 
    RTL 


.greaterThanCE:
    INY #2
    RTL 


RTS_B3E555:
    RTS 


InstList_EtecoonEscape_RunningLeft_LowTide_0:
    dw Instruction_EtecoonEscape_GotoY_IfAcidPositionLessThanCE 
    dw InstList_EtecoonEscape_RunningLeft_HighTide 

InstList_EtecoonEscape_RunningLeft_LowTide_1:
    dw $0005 
    dw Spritemaps_EtecoonEscape_0 
    dw $0005 
    dw Spritemaps_EtecoonEscape_1 
    dw $0005 
    dw Spritemaps_EtecoonEscape_2 
    dw $0005 
    dw Spritemaps_EtecoonEscape_1 
    dw Instruction_Common_GotoY 
    dw InstList_EtecoonEscape_RunningLeft_LowTide_1 

InstList_EtecoonEscape_RunningLeft_HighTide:
    dw $0003 
    dw Spritemaps_EtecoonEscape_0 
    dw $0003 
    dw Spritemaps_EtecoonEscape_1 
    dw $0003 
    dw Spritemaps_EtecoonEscape_2 
    dw $0003 
    dw Spritemaps_EtecoonEscape_1 
    dw Instruction_Common_GotoY 
    dw InstList_EtecoonEscape_RunningLeft_HighTide 

InstList_EtecoonEscape_RunningRight_LowTide_0:
    dw Instruction_EtecoonEscape_GotoY_IfAcidPositionLessThanCE 
    dw InstList_EtecoonEscape_RunningRight_HighTide 

InstList_EtecoonEscape_RunningRight_LowTide_1:
    dw $0006 
    dw Spritemaps_EtecoonEscape_3 
    dw $0006 
    dw Spritemaps_EtecoonEscape_4 
    dw $0006 
    dw Spritemaps_EtecoonEscape_5 
    dw $0006 
    dw Spritemaps_EtecoonEscape_4 
    dw Instruction_Common_GotoY 
    dw InstList_EtecoonEscape_RunningRight_LowTide_1 

InstList_EtecoonEscape_RunningRight_HighTide:
    dw $0003 
    dw Spritemaps_EtecoonEscape_3 
    dw $0003 
    dw Spritemaps_EtecoonEscape_4 
    dw $0003 
    dw Spritemaps_EtecoonEscape_5 
    dw $0003 
    dw Spritemaps_EtecoonEscape_4 
    dw Instruction_Common_GotoY 
    dw InstList_EtecoonEscape_RunningRight_HighTide 

InstList_EtecoonEscape_RunningForEscape_0:
    dw Instruction_Common_Enemy0FB2_InY 
    dw Function_EtecoonEscape_RunningForEscape 

InstList_EtecoonEscape_RunningForEscape_1:
    dw $0003 
    dw Spritemaps_EtecoonEscape_3 
    dw $0003 
    dw Spritemaps_EtecoonEscape_4 
    dw $0003 
    dw Spritemaps_EtecoonEscape_5 
    dw $0003 
    dw Spritemaps_EtecoonEscape_4 
    dw Instruction_Common_GotoY 
    dw InstList_EtecoonEscape_RunningForEscape_1 

InstList_EtecoonEscape_Stationary:
    dw $0040 
    dw Spritemaps_EtecoonEscape_E 
    dw $0008 
    dw Spritemaps_EtecoonEscape_F 
    dw $0040 
    dw Spritemaps_EtecoonEscape_11 
    dw $0008 
    dw Spritemaps_EtecoonEscape_10 
    dw Instruction_Common_GotoY 
    dw InstList_EtecoonEscape_Stationary 

InstList_EtecoonEscape_ExpressGratitudeThenEscape_0:
    dw Instruction_Common_SetEnemy0FB2ToRTS 
    dw Instruction_Common_TimerInY 
    dw $0008 

InstList_EtecoonEscape_ExpressGratitudeThenEscape_1:
    dw $0008 
    dw Spritemaps_EtecoonEscape_0 
    dw Instruction_EtecoonEscape_XPositionPlusY 
    dw $FFFD,$0008 
    dw Spritemaps_EtecoonEscape_1 
    dw Instruction_EtecoonEscape_XPositionPlusY 
    dw $FFFD,$0008 
    dw Spritemaps_EtecoonEscape_2 
    dw Instruction_EtecoonEscape_XPositionPlusY 
    dw $FFFD,$0008 
    dw Spritemaps_EtecoonEscape_1 
    dw Instruction_EtecoonEscape_XPositionPlusY 
    dw $FFFD 
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate 
    dw InstList_EtecoonEscape_ExpressGratitudeThenEscape_1 
    dw $0040 
    dw Spritemaps_EtecoonEscape_E 
    dw $0008 
    dw Spritemaps_EtecoonEscape_F 
    dw Instruction_Common_GotoY 
    dw InstList_EtecoonEscape_RunningForEscape_0 

Instruction_EtecoonEscape_XPositionPlusY:
    LDA.W $0F7A,X 
    CLC 
    ADC.W $0000,Y 
    STA.W $0F7A,X 
    INY #2
    RTL 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_EtecoonEscape_B3E61D:
    dw $0001 
    dw Spritemaps_EtecoonEscape_6 
    dw Instruction_Common_Sleep 

UNUSED_InstList_EtecoonEscape_B3E623:
    dw $000C 
    dw Spritemaps_EtecoonEscape_7 
    dw $000C 
    dw Spritemaps_EtecoonEscape_8 
    dw $0006 
    dw Spritemaps_EtecoonEscape_9 
    dw $000C 
    dw Spritemaps_EtecoonEscape_8 
    dw $000C 
    dw Spritemaps_EtecoonEscape_7 
    dw Instruction_Common_Sleep 

UNUSED_InstList_EtecoonEscape_B3E639:
    dw $0001 
    dw Spritemaps_EtecoonEscape_A 
    dw Instruction_Common_Sleep 

UNUSED_InstList_EtecoonEscape_B3E63F:
    dw $000C 
    dw Spritemaps_EtecoonEscape_B 
    dw $000C 
    dw Spritemaps_EtecoonEscape_C 
    dw $0006 
    dw Spritemaps_EtecoonEscape_D 
    dw $000C 
    dw Spritemaps_EtecoonEscape_C 
    dw $000C 
    dw Spritemaps_EtecoonEscape_B 
    dw Instruction_Common_Sleep 
endif ; !FEATURE_KEEP_UNREFERENCED

MainAI_EtecoonEscape:
    LDX.W $0E54 
    JSR.W ($0FB2,X) 
    RTL 


Function_EtecoonEscape_RunningForEscape:
    LDA.W $0F7C,X 
    CLC 
    ADC.W #$8000 
    STA.W $0F7C,X 
    LDA.W $0F7A,X 
    ADC.W #$0003 
    STA.W $0F7A,X 
    RTS 


Function_EtecoonEscape_StationaryWaitingToExpressGratitude:
    LDA.W #$000F 
    JSL.L CheckIfEvent_inA_HasHappened 
    BCC .return 
    LDA.W #InstList_EtecoonEscape_ExpressGratitudeThenEscape_0 : STA.W $0F92,X 

.return:
    RTS 


Function_EtecoonEscape_RunningAroundAimlessly:
    STZ.B $12 
    STZ.B $14 
    LDA.W $0FA8,X 
    BPL + 
    DEC.B $14 

  + STA.B $13 
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes 
    BCC .noCollision 
    LDA.W #$0001 : STA.W $0F94,X 
    LDA.W $0FA8,X 
    EOR.W #$FFFF 
    INC A 
    STA.W $0FA8,X 
    BPL .greaterThan0 
    LDA.W #InstList_EtecoonEscape_RunningLeft_LowTide_0 
    BRA + 


.greaterThan0:
    LDA.W #InstList_EtecoonEscape_RunningRight_LowTide_0 

  + STA.W $0F92,X 
    LDA.W #$000F 
    JSL.L CheckIfEvent_inA_HasHappened 
    BCC .noCollision 
    LDA.W #InstList_EtecoonEscape_RunningForEscape_0 : STA.W $0F92,X 

.noCollision:
    STZ.B $12 
    LDA.W #$0001 : STA.B $14 
    JSL.L MoveEnemyDownBy_14_12 
    RTS 


InitAI_EtecoonEscape:
    LDX.W $0E54 
    LDA.W #$000F 
    JSL.L CheckIfEvent_inA_HasHappened 
    BCC .notEscaped 
    LDA.W $0F86,X 
    ORA.W #$0200 
    STA.W $0F86,X 
    RTL 


.notEscaped:
    LDA.W $0F86,X 
    ORA.W #$A400 
    STA.W $0F86,X 
    LDA.W #$0001 : STA.W $0F94,X 
    STZ.W $0F90,X 
    STZ.W $0F96,X 
    LDY.W $0FB4,X 
    LDA.W .XPosition,Y : STA.W $0F7A,X 
    LDA.W .YPosition,Y : STA.W $0F7E,X 
    LDA.W .functionPointer,Y : STA.W $0FB2,X 
    LDA.W .instListPointer,Y : STA.W $0F92,X 
    LDA.W .XVelocity,Y : STA.W $0FA8,X 
    RTL 


.XPosition:
    dw $0080,$00A0,$00E8 

.YPosition:
    dw $00C8,$00C8,$00C8 

.functionPointer:
    dw Function_EtecoonEscape_RunningAroundAimlessly 
    dw Function_EtecoonEscape_RunningAroundAimlessly 
    dw Function_EtecoonEscape_StationaryWaitingToExpressGratitude 

.instListPointer:
    dw InstList_EtecoonEscape_RunningLeft_LowTide_0 
    dw InstList_EtecoonEscape_RunningRight_LowTide_0 
    dw InstList_EtecoonEscape_Stationary 

.XVelocity:
    dw $FE00,$0280,$0000 

Spritemaps_EtecoonEscape_0:
    dw $0003,$01F2 
    db $FF 
    dw $3329,$C3F5 
    db $EF 
    dw $3300,$C3FA 
    db $F7 
    dw $3302 

Spritemaps_EtecoonEscape_1:
    dw $0002,$C3F5 
    db $F0 
    dw $3300,$C3FA 
    db $F8 
    dw $3304 

Spritemaps_EtecoonEscape_2:
    dw $0002,$C3F5 
    db $F1 
    dw $3300,$C3FA 
    db $F9 
    dw $3306 

Spritemaps_EtecoonEscape_3:
    dw $0003,$0006 
    db $FF 
    dw $7329,$C3FB 
    db $EF 
    dw $7300,$C3F6 
    db $F7 
    dw $7302 

Spritemaps_EtecoonEscape_4:
    dw $0002,$C3FB 
    db $F0 
    dw $7300,$C3F6 
    db $F8 
    dw $7304 

Spritemaps_EtecoonEscape_5:
    dw $0002,$C3FB 
    db $F1 
    dw $7300,$C3F6 
    db $F9 
    dw $7306 

Spritemaps_EtecoonEscape_6:
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

Spritemaps_EtecoonEscape_7:
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

Spritemaps_EtecoonEscape_8:
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

Spritemaps_EtecoonEscape_9:
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

Spritemaps_EtecoonEscape_A:
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

Spritemaps_EtecoonEscape_B:
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

Spritemaps_EtecoonEscape_C:
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

Spritemaps_EtecoonEscape_D:
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

Spritemaps_EtecoonEscape_E:
    dw $0007,$C3F8 
    db $ED 
    dw $3300,$0002 
    db $F9 
    dw $7322,$01F7 
    db $F9 
    dw $3322,$01F9 
    db $FF 
    dw $3324,$0000 
    db $FF 
    dw $7324,$01F9 
    db $F7 
    dw $3320,$0000 
    db $F7 
    dw $7320 

Spritemaps_EtecoonEscape_F:
    dw $0007,$0002 
    db $F9 
    dw $7322,$01F7 
    db $F9 
    dw $3322,$C3F8 
    db $ED 
    dw $730C,$01F9 
    db $FF 
    dw $3324,$0000 
    db $FF 
    dw $7324,$01F9 
    db $F7 
    dw $3320,$0000 
    db $F7 
    dw $7320 

Spritemaps_EtecoonEscape_10:
    dw $0007,$01F6 
    db $F9 
    dw $3322,$0001 
    db $F9 
    dw $7322,$C3F8 
    db $ED 
    dw $330C,$01FF 
    db $FF 
    dw $7324,$01F8 
    db $FF 
    dw $3324,$01FF 
    db $F7 
    dw $7320,$01F8 
    db $F7 
    dw $3320 

Spritemaps_EtecoonEscape_11:
    dw $0007,$C3F8 
    db $ED 
    dw $3300,$01F6 
    db $F9 
    dw $3322,$0001 
    db $F9 
    dw $7322,$01FF 
    db $FF 
    dw $7324,$01F8 
    db $FF 
    dw $3324,$01FF 
    db $F7 
    dw $7320,$01F8 
    db $F7 
    dw $3320 

Palette_DachoraEscape:
    dw $3800,$3F57,$2E4D,$00E2,$0060,$3AB0,$220B,$1166 
    dw $0924,$57FF,$42F7,$2610,$158C,$7C1F,$6018,$300A 

InstList_DachoraEscape_RunningAroundAimlessly_LowTide_0:
    dw Instruction_Common_TimerInY 
    dw $0005 

InstList_DachoraEscape_RunningAroundAimlessly_LowTide_1:
    dw $0003 
    dw Spritemaps_DachoraEscape_0 
    dw InstList_DachoraEscape_XPositionMinus6 
    dw $0003 
    dw Spritemaps_DachoraEscape_1 
    dw InstList_DachoraEscape_XPositionMinus6 
    dw $0003 
    dw Spritemaps_DachoraEscape_2 
    dw InstList_DachoraEscape_XPositionMinus6 
    dw $0003 
    dw Spritemaps_DachoraEscape_3 
    dw InstList_DachoraEscape_XPositionMinus6 
    dw $0003 
    dw Spritemaps_DachoraEscape_4 
    dw InstList_DachoraEscape_XPositionMinus6 
    dw $0003 
    dw Spritemaps_DachoraEscape_5 
    dw InstList_DachoraEscape_XPositionMinus6 
    dw InstList_DachoraEscape_GotoY_IfAcidLessThanCE 
    dw InstList_DachoraEscape_RunningAroundAimlessly_HighTide_2 
    dw InstList_DachoraEscape_GotoY_IfCrittersEscaped 
    dw InstList_DachoraEscape_RunningForEscape_0 
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate 
    dw InstList_DachoraEscape_RunningAroundAimlessly_LowTide_1 
    dw Instruction_Common_TimerInY 
    dw $0005 

InstList_DachoraEscape_RunningAroundAimlessly_LowTide_2:
    dw $0003 
    dw Spritemaps_DachoraEscape_6 
    dw InstList_DachoraEscape_XPositionPlus6 
    dw $0003 
    dw Spritemaps_DachoraEscape_7 
    dw InstList_DachoraEscape_XPositionPlus6 
    dw $0003 
    dw Spritemaps_DachoraEscape_8 
    dw InstList_DachoraEscape_XPositionPlus6 
    dw $0003 
    dw Spritemaps_DachoraEscape_9 
    dw InstList_DachoraEscape_XPositionPlus6 
    dw $0003 
    dw Spritemaps_DachoraEscape_A 
    dw InstList_DachoraEscape_XPositionPlus6 
    dw $0003 
    dw Spritemaps_DachoraEscape_B 
    dw InstList_DachoraEscape_XPositionPlus6 
    dw InstList_DachoraEscape_GotoY_IfAcidLessThanCE 
    dw InstList_DachoraEscape_RunningAroundAimlessly_HighTide_4 
    dw InstList_DachoraEscape_GotoY_IfCrittersEscaped 
    dw InstList_DachoraEscape_RunningForEscape_1 
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate 
    dw InstList_DachoraEscape_RunningAroundAimlessly_LowTide_2 
    dw Instruction_Common_GotoY 
    dw InstList_DachoraEscape_RunningAroundAimlessly_LowTide_0 

InstList_DachoraEscape_RunningAroundAimlessly_HighTide_0:
    dw Instruction_Common_TimerInY 
    dw $0005 

InstList_DachoraEscape_RunningAroundAimlessly_HighTide_1:
    dw $0002 
    dw Spritemaps_DachoraEscape_0 
    dw InstList_DachoraEscape_XPositionMinus6 
    dw $0002 
    dw Spritemaps_DachoraEscape_1 
    dw InstList_DachoraEscape_XPositionMinus6 
    dw $0002 
    dw Spritemaps_DachoraEscape_2 
    dw InstList_DachoraEscape_XPositionMinus6 
    dw $0002 
    dw Spritemaps_DachoraEscape_3 
    dw InstList_DachoraEscape_XPositionMinus6 
    dw $0002 
    dw Spritemaps_DachoraEscape_4 
    dw InstList_DachoraEscape_XPositionMinus6 
    dw $0002 
    dw Spritemaps_DachoraEscape_5 
    dw InstList_DachoraEscape_XPositionMinus6 
    dw InstList_DachoraEscape_GotoY_IfCrittersEscaped 
    dw InstList_DachoraEscape_RunningForEscape_0 

InstList_DachoraEscape_RunningAroundAimlessly_HighTide_2:
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate 
    dw InstList_DachoraEscape_RunningAroundAimlessly_HighTide_1 
    dw Instruction_Common_TimerInY 
    dw $0005 

InstList_DachoraEscape_RunningAroundAimlessly_HighTide_3:
    dw $0002 
    dw Spritemaps_DachoraEscape_6 
    dw InstList_DachoraEscape_XPositionPlus6 
    dw $0002 
    dw Spritemaps_DachoraEscape_7 
    dw InstList_DachoraEscape_XPositionPlus6 
    dw $0002 
    dw Spritemaps_DachoraEscape_8 
    dw InstList_DachoraEscape_XPositionPlus6 
    dw $0002 
    dw Spritemaps_DachoraEscape_9 
    dw InstList_DachoraEscape_XPositionPlus6 
    dw $0002 
    dw Spritemaps_DachoraEscape_A 
    dw InstList_DachoraEscape_XPositionPlus6 
    dw $0002 
    dw Spritemaps_DachoraEscape_B 
    dw InstList_DachoraEscape_XPositionPlus6 
    dw InstList_DachoraEscape_GotoY_IfCrittersEscaped 
    dw InstList_DachoraEscape_RunningForEscape_1 

InstList_DachoraEscape_RunningAroundAimlessly_HighTide_4:
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate 
    dw InstList_DachoraEscape_RunningAroundAimlessly_HighTide_3 
    dw Instruction_Common_GotoY 
    dw InstList_DachoraEscape_RunningAroundAimlessly_HighTide_0 

InstList_DachoraEscape_RunningForEscape_0:
    dw $001E 
    dw Spritemaps_DachoraEscape_0 

InstList_DachoraEscape_RunningForEscape_1:
    dw $005A 
    dw Spritemaps_DachoraEscape_6 
    dw InstList_DachoraEscape_XPositionPlus6 
    dw $0005 
    dw Spritemaps_DachoraEscape_7 
    dw InstList_DachoraEscape_XPositionPlus6 
    dw $0005 
    dw Spritemaps_DachoraEscape_8 
    dw InstList_DachoraEscape_XPositionPlus6 
    dw $0004 
    dw Spritemaps_DachoraEscape_9 
    dw InstList_DachoraEscape_XPositionPlus6 
    dw $0004 
    dw Spritemaps_DachoraEscape_A 
    dw InstList_DachoraEscape_XPositionPlus6 
    dw $0004 
    dw Spritemaps_DachoraEscape_B 
    dw InstList_DachoraEscape_XPositionPlus6 
    dw $0003 
    dw Spritemaps_DachoraEscape_6 
    dw InstList_DachoraEscape_XPositionPlus6 
    dw $0003 
    dw Spritemaps_DachoraEscape_7 
    dw InstList_DachoraEscape_XPositionPlus6 
    dw $0003 
    dw Spritemaps_DachoraEscape_8 
    dw InstList_DachoraEscape_XPositionPlus6 
    dw $0002 
    dw Spritemaps_DachoraEscape_9 
    dw InstList_DachoraEscape_XPositionPlus6 
    dw $0002 
    dw Spritemaps_DachoraEscape_A 
    dw InstList_DachoraEscape_XPositionPlus6 
    dw $0002 
    dw Spritemaps_DachoraEscape_B 
    dw InstList_DachoraEscape_XPositionPlus6 

InstList_DachoraEscape_RunningForEscape_2:
    dw $0001 
    dw Spritemaps_DachoraEscape_6 
    dw InstList_DachoraEscape_XPositionPlus6 
    dw $0001 
    dw Spritemaps_DachoraEscape_7 
    dw InstList_DachoraEscape_XPositionPlus6 
    dw $0001 
    dw Spritemaps_DachoraEscape_8 
    dw InstList_DachoraEscape_XPositionPlus6 
    dw $0001 
    dw Spritemaps_DachoraEscape_9 
    dw InstList_DachoraEscape_XPositionPlus6 
    dw $0001 
    dw Spritemaps_DachoraEscape_A 
    dw InstList_DachoraEscape_XPositionPlus6 
    dw $0001 
    dw Spritemaps_DachoraEscape_B 
    dw InstList_DachoraEscape_XPositionPlus6 
    dw Instruction_Common_GotoY 
    dw InstList_DachoraEscape_RunningForEscape_2 

InstList_DachoraEscape_GotoY_IfAcidLessThanCE:
    LDA.W $1962 
    CMP.W #$00CE 
    BCS .greaterThanCE 
    LDA.W $0000,Y 
    TAY 
    RTL 


.greaterThanCE:
    INY #2
    RTL 


InstList_DachoraEscape_GotoY_IfCrittersEscaped:
    LDA.W #$000F 
    JSL.L CheckIfEvent_inA_HasHappened 
    BCC .notEscaped 
    LDA.W $0000,Y 
    TAY 
    RTL 


.notEscaped:
    INY #2
    RTL 


InstList_DachoraEscape_XPositionMinus6:
    LDX.W $0E54 
    LDA.W $0F7A,X 
    SEC 
    SBC.W #$0006 
    STA.W $0F7A,X 
    RTL 


InstList_DachoraEscape_XPositionPlus6:
    LDX.W $0E54 
    LDA.W $0F7A,X 
    CLC 
    ADC.W #$0006 
    STA.W $0F7A,X 
    RTL 


InitAI_DachoraEscape:
    LDX.W $0E54 
    LDA.W #$000F 
    JSL.L CheckIfEvent_inA_HasHappened 
    BCC .notEscaped 
    LDA.W $0F86,X 
    ORA.W #$0200 
    STA.W $0F86,X 
    RTL 


.notEscaped:
    LDA.W $0F86,X 
    ORA.W #$2000 
    STA.W $0F86,X 
    LDA.W #Spritemap_CommonB3_Nothing : STA.W $0F8E,X 
    LDA.W #$0001 : STA.W $0F94,X 
    STZ.W $0F90,X 
    LDA.W #InstList_DachoraEscape_RunningAroundAimlessly_LowTide_0 : STA.W $0F92,X 
    RTL 


RTL_B3EB1A:
    RTL 


Spritemaps_DachoraEscape_0:
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

Spritemaps_DachoraEscape_1:
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

Spritemaps_DachoraEscape_2:
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

Spritemaps_DachoraEscape_3:
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

Spritemaps_DachoraEscape_4:
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

Spritemaps_DachoraEscape_5:
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

Spritemaps_DachoraEscape_6:
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

Spritemaps_DachoraEscape_7:
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

Spritemaps_DachoraEscape_8:
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

Spritemaps_DachoraEscape_9:
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

Spritemaps_DachoraEscape_A:
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

Spritemaps_DachoraEscape_B:
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

Freespace_BankB3_ED77: 
; $1289 bytes
