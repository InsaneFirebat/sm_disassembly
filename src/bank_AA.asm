
org $AA8000


CommonAA_GrappleAI_NoInteraction:
    JSL.L GrappleAI_SwitchEnemyAIToMainAI 
    RTL 


CommonAA_GrappleAI_SamusLatchesOn:
    JSL.L GrappleAI_SamusLatchesOnWithGrapple 
    RTL 


CommonAA_GrappleAI_KillEnemy:
    JSL.L GrappleAI_EnemyGrappleDeath 
    RTL 


CommonAA_GrappleAI_CancelGrappleBeam:
    JSL.L GrappleAI_SwitchToFrozenAI 
    RTL 


CommonAA_GrappleAI_SamusLatchesOn_NoInvincibility:
    JSL.L GrappleAI_SamusLatchesOnWithGrapple_NoInvincibility 
    RTL 


UNUSED_CommonAA_GrappleAI_SamusLatchesOn_ParalyzeEnemy_A38019:
    JSL.L GrappleAI_SamusLatchesOnWithGrapple_ParalyzeEnemy 
    RTL 


CommonAA_GrappleAI_HurtSamus:
    JSL.L GrappleAI_SwitchToFrozenAI_duplicate 
    RTL 


CommonAA_NormalEnemyTouchAI:
    JSL.L NormalEnemyTouchAI 
    RTL 


CommonAA_NormalTouchAI_NoDeathCheck:
    JSL.L NormalEnemyTouchAI_NoDeathCheck_External 
    RTL 


CommonAA_NormalEnemyShotAI:
    JSL.L NormalEnemyShotAI 
    RTL 


CommonAA_NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic:
    JSL.L NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External 
    RTL 


CommonAA_NormalEnemyPowerBombAI:
    JSL.L NormalEnemyPowerBombAI 
    RTL 


CommonAA_NormalEnemyPowerBombAI_NoDeathCheck:
    JSL.L NormalEnemyPowerBombAI_NoDeathCheck_External 
    RTL 


CommonAA_NormalEnemyFrozenAI:
    JSL.L NormalEnemyFrozenAI 
    RTL 


CommonAA_CreateADudShot_JSL:
    JSL.L CreateADudShot 
    RTL 


RTS_AA804B:
    RTS 


RTL_AA804C:
    RTL 


Spritemap_CommonAA_Nothing:
    dw $0000 

ExtendedSpritemap_CommonAA_Nothing:
    dw $0001,$0000,$0000 
    dw Spritemap_CommonAA_Nothing 
    dw Hitbox_CommonAA_Nothing 

Hitbox_CommonAA_Nothing:
    dw $0001,$0000,$0000,$0000,$0000 
    dw CommonAA_NormalEnemyTouchAI 
    dw CommonAA_NormalEnemyShotAI 

InstList_CommonAA_DeleteEnemy:
    dw Instruction_CommonAA_DeleteEnemy 

NOPNOP_AA8069:
    NOP #2
    Instruction_CommonAA_Enemy0FB2_InY:
    LDA.W $0000,Y : STA.W $0FB2,X 
    INY #2
    RTL 


Instruction_CommonAA3_SetEnemy0FB2ToRTS:
    LDA.W #RTS_AA807B : STA.W $0FB2,X 
    RTL 


RTS_AA807B:
    RTS 


Instruction_CommonAA_DeleteEnemy:
    LDA.W $0F86,X 
    ORA.W #$0200 
    STA.W $0F86,X 
    PLA 
    PEA.W ProcessEnemyInstructions_return-1 
    RTL 


Instruction_CommonAA_CallFunctionInY:
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


Instruction_CommonAA_CallFunctionInY_WithA:
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
UNUSED_Instruction_CommonAA_CallExternalFunctionInY_AA80B5:
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


UNUSED_Inst_CommonAA_CallExternalFunctionInY_WithA_AA80CE:
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


Instruction_CommonAA_GotoY:
    LDA.W $0000,Y 
    TAY 
    RTL 


Instruction_CommonAA_GotoY_PlusY:
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


Instruction_CommonAA_DecrementTimer_GotoYIfNonZero:
    DEC.W $0F90,X 
    BNE Instruction_CommonAA_GotoY 
    INY #2
    RTL 


Instruction_CommonAA_DecrementTimer_GotoYIfNonZero_duplicate:
    DEC.W $0F90,X 
    BNE Instruction_CommonAA_GotoY 
    INY #2
    RTL 


Instruction_CommonAA_DecrementTimer_GotoY_PlusY_IfNonZero:
    SEP #$20 
    DEC.W $0F90,X 
    REP #$20 
    BNE Instruction_CommonAA_GotoY_PlusY 
    INY 
    RTL 


Instruction_CommonAA_TimerInY:
    LDA.W $0000,Y : STA.W $0F90,X 
    INY #2
    RTL 


Instruction_CommonAA_SkipNextInstruction:
    INY #2
    RTL 


Instruction_CommonAA_Sleep:
    DEY #2
    TYA 
    STA.W $0F92,X 
    PLA 
    PEA.W ProcessEnemyInstructions_return-1 
    RTL 


Instruction_CommonAA_WaitYFrames:
    LDA.W $0000,Y : STA.W $0F94,X 
    INY #2
    TYA 
    STA.W $0F92,X 
    PLA 
    PEA.W ProcessEnemyInstructions_return-1 
    RTL 


Instruction_CommonAA_TransferYBytesInYToVRAM:
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


Instruction_CommonAA_EnableOffScreenProcessing:
    LDA.W $0F86,X 
    ORA.W #$0800 
    STA.W $0F86,X 
    RTL 


Instruction_CommonAA_DisableOffScreenProcessing:
    LDA.W $0F86,X 
    AND.W #$F7FF 
    STA.W $0F86,X 
    RTL 


CommonAAEnemySpeeds_LinearlyIncreasing:
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

CommonAAEnemySpeeds_QuadraticallyIncreasing:
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

Palette_Torizo_OrbProjectile:
    dw $3800,$03FF,$033B,$0216,$0113,$6B1E,$4A16,$3591 
    dw $20E9,$1580,$1580,$1580,$1580,$1580,$1580,$1580 

Palette_Torizo_BombTorizoStatue:
    dw $3800,$02DF,$01D7,$00AC,$5A73,$41AD,$2D08,$1863 
    dw $1486,$0145,$0145,$0145,$7FFF,$0145,$0145,$0000 

Palette_Torizo_InitialBombTorizo_SpritePalette1:
    dw $3800,$679F,$5299,$252E,$14AA,$5EFC,$4657,$35B2 
    dw $2D70,$5B7F,$3DF8,$2D0E,$5F5F,$5E1A,$5D35,$0C63 

Palette_Torizo_InitialBombTorizo_SpritePalette2:
    dw $3800,$4ABA,$35B2,$0847,$0003,$4215,$2970,$18CB 
    dw $1089,$463A,$28B3,$1809,$6F7F,$51FD,$4113,$0C63 

Palette_Torizo_Normal_SpritePalette1:
    dw $3800,$56BA,$41B2,$1447,$0403,$4E15,$3570,$24CB 
    dw $1868,$6F7F,$51F8,$410E,$031F,$01DA,$00F5,$0C63 

Palette_Torizo_Normal_SpritePalette2:
    dw $3800,$4215,$2D0D,$0002,$0000,$3970,$20CB,$0C26 
    dw $0403,$463A,$28B3,$1809,$6F7F,$51FD,$4113,$0C63 

Palette_Torizo_InitialGoldenTorizo_SpritePalette1:
    dw $3800,$6AB5,$49B0,$1C45,$0C01,$5613,$416D,$2CC9 
    dw $2066,$5714,$31CC,$14E3,$5630,$3569,$1883,$0C66 

Palette_Torizo_InitialGoldenTorizo_SpritePalette2:
    dw $3800,$5610,$350B,$0800,$0000,$416E,$2CC8,$1823 
    dw $0C01,$6A31,$4CAA,$2406,$7F7B,$75F4,$4D10,$0C63 

Palette_Torizo_GoldenTorizo_SpritePalette1:
    dw $3800,$4BBE,$06B9,$00A8,$0000,$173A,$0276,$01F2 
    dw $014D,$73E0,$4F20,$2A20,$7FE0,$5AA0,$5920,$0043 

Palette_Torizo_GoldenTorizo_SpritePalette2:
    dw $3800,$3719,$0214,$0003,$0000,$0295,$01D1,$014D 
    dw $00A8,$4B40,$25E0,$00E0,$6B40,$4600,$4480,$0000 

Hitboxes_Torizo_Blank:
    dw $0000 

Spritemap_Torizo_Blank:
    dw $0001,$0100 
    db $00 
    dw $4200 

ExtendedSpritemap_Torizo_Blank:
    dw $0001,$0000,$0000 
    dw Spritemap_Torizo_Blank 
    dw Hitboxes_Torizo_Blank 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Hitboxes_Torizo_AA87DA:
    dw $0001,$FFF5,$FFD6,$000A,$0003 
    dw EnemyTouch_Torizo 
    dw EnemyShot_Torizo_Normal 
endif ; !FEATURE_KEEP_UNREFERENCED

Hitboxes_Torizo_StandUp_SitDown_FacingLeft_0:
    dw $0001,$FFF0,$FFE5,$0010,$001B 
    dw EnemyTouch_Torizo 
    dw EnemyShot_Torizo_StandUp_SitDown 

Hitboxes_Torizo_StandUp_SitDown_FacingLeft_1:
    dw $0001,$FFF2,$FFE5,$000D,$001B 
    dw EnemyTouch_Torizo 
    dw EnemyShot_Torizo_StandUp_SitDown 

Hitboxes_Torizo_StandUp_SitDown_FacingLeft_2:
    dw $0001,$FFF3,$FFDE,$0009,$0021 
    dw EnemyTouch_Torizo 
    dw EnemyShot_Torizo_StandUp_SitDown 

Hitboxes_Torizo_StandUp_SitDown_FacingLeft_3:
    dw $0001,$FFF5,$FFDA,$000B,$0027 
    dw EnemyTouch_Torizo 
    dw EnemyShot_Torizo_StandUp_SitDown 

Hitboxes_Torizo_StandUp_SitDown_FacingLeft_4:
    dw $0001,$FFF1,$FFD4,$0008,$002F 
    dw EnemyTouch_Torizo 
    dw EnemyShot_Torizo_StandUp_SitDown 

Hitboxes_Torizo_StandUp_SitDown_FacingLeft_5:
    dw $0001,$FFEE,$FFD5,$0003,$0018 
    dw EnemyTouch_Torizo 
    dw EnemyShot_Torizo_StandUp_SitDown 

Hitboxes_Torizo_StandUp_SitDown_FacingLeft_6:
    dw $0001,$FFEF,$FFD6,$0005,$000F 
    dw EnemyTouch_Torizo 
    dw EnemyShot_Torizo_StandUp_SitDown 

Hitboxes_Torizo_StandUp_SitDown_FacingLeft_7:
    dw $0001,$FFF1,$FFD9,$0007,$0015 
    dw EnemyTouch_Torizo 
    dw EnemyShot_Torizo_Normal 

Hitboxes_Torizo_StandUp_SitDown_FacingLeft_8:
    dw $0000 

Hitboxes_Torizo_StandUp_SitDown_FacingLeft_9:
    dw $0000 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Hitboxes_Torizo_StandUp_SitDown_FacingLeft_AA885C:
    dw $0001,$FFF0,$0027,$FFFF,$0037 
    dw EnemyTouch_Torizo 
    dw RTL_AAC9C1 
endif ; !FEATURE_KEEP_UNREFERENCED

Hitboxes_Torizo_StandUp_SitDown_FacingLeft_A:
    dw $0000 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Hitboxes_Torizo_StandUp_SitDown_FacingLeft_AA886C:
    dw $0001,$FFE0,$0029,$FFF3,$0040 
    dw EnemyTouch_Torizo 
    dw RTL_AAC9C1 
endif ; !FEATURE_KEEP_UNREFERENCED

Hitboxes_Torizo_StandUp_SitDown_FacingLeft_B:
    dw $0000 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Hitboxes_Torizo_StandUp_SitDown_FacingLeft_AA887C:
    dw $0001,$FFD8,$001C,$FFEC,$0030 
    dw EnemyTouch_Torizo 
    dw RTL_AAC9C1 
endif ; !FEATURE_KEEP_UNREFERENCED

Hitboxes_Torizo_StandUp_SitDown_FacingLeft_C:
    dw $0000 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Hitboxes_Torizo_StandUp_SitDown_FacingLeft_AA888C:
    dw $0001,$FFC8,$0009,$FFEB,$0014 
    dw EnemyTouch_Torizo 
    dw RTL_AAC9C1 
endif ; !FEATURE_KEEP_UNREFERENCED

Hitboxes_Torizo_StandUp_SitDown_FacingLeft_D:
    dw $0000 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Hitboxes_Torizo_StandUp_SitDown_FacingLeft_AA889C:
    dw $0001,$FFD3,$FFF3,$FFE5,$0003 
    dw EnemyTouch_Torizo 
    dw RTL_AAC9C1 
endif ; !FEATURE_KEEP_UNREFERENCED

Hitboxes_Torizo_StandUp_SitDown_FacingLeft_E:
    dw $0000 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Hitboxes_Torizo_StandUp_SitDown_FacingLeft_AA88AC:
    dw $0001,$FFE3,$FFDB,$FFF0,$FFF1 
    dw EnemyTouch_Torizo 
    dw RTL_AAC9C1 
endif ; !FEATURE_KEEP_UNREFERENCED

Hitboxes_Torizo_StandUp_SitDown_FacingLeft_F:
    dw $0000 

Hitboxes_Torizo_StandUp_SitDown_FacingLeft_10:
    dw $0000 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Hitboxes_Torizo_StandUp_SitDown_FacingLeft_AA88BE:
    dw $0001,$FFEF,$0028,$0000,$0039 
    dw EnemyTouch_Torizo 
    dw RTL_AAC9C1 
endif ; !FEATURE_KEEP_UNREFERENCED

Hitboxes_Torizo_StandUp_SitDown_FacingLeft_11:
    dw $0000 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Hitboxes_Torizo_StandUp_SitDown_FacingLeft_AA88CE:
    dw $0001,$FFE6,$0021,$FFF4,$0032 
    dw EnemyTouch_Torizo 
    dw RTL_AAC9C1 
endif ; !FEATURE_KEEP_UNREFERENCED

Hitboxes_Torizo_StandUp_SitDown_FacingLeft_12:
    dw $0000 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Hitboxes_Torizo_StandUp_SitDown_FacingLeft_AA88DE:
    dw $0001,$FFDD,$0018,$FFEA,$0025 
    dw EnemyTouch_Torizo 
    dw RTL_AAC9C1 
endif ; !FEATURE_KEEP_UNREFERENCED

Hitboxes_Torizo_StandUp_SitDown_FacingLeft_13:
    dw $0000 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Hitboxes_Torizo_StandUp_SitDown_FacingLeft_AA88EE:
    dw $0001,$FFCA,$0008,$FFE9,$0012 
    dw EnemyTouch_Torizo 
    dw RTL_AAC9C1 
endif ; !FEATURE_KEEP_UNREFERENCED

Hitboxes_Torizo_StandUp_SitDown_FacingLeft_14:
    dw $0000 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Hitboxes_Torizo_StandUp_SitDown_FacingLeft_AA88FE:
    dw $0001,$FFD3,$FFF3,$FFE3,$0000 
    dw EnemyTouch_Torizo 
    dw RTL_AAC9C1 
endif ; !FEATURE_KEEP_UNREFERENCED

Hitboxes_Torizo_StandUp_SitDown_FacingLeft_15:
    dw $0000 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Hitboxes_Torizo_StandUp_SitDown_FacingLeft_AA890E:
    dw $0001,$FFE4,$FFDA,$FFEF,$FFEE 
    dw EnemyTouch_Torizo 
    dw RTL_AAC9C1 
endif ; !FEATURE_KEEP_UNREFERENCED

Hitboxes_Torizo_StandUp_SitDown_FacingLeft_16:
    dw $0001,$FFEE,$FFDA,$0007,$0009 
    dw EnemyTouch_Torizo 
    dw EnemyShot_Torizo_Normal 

Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17:
    dw $0001,$FFEE,$FFDB,$0007,$0012 
    dw EnemyTouch_Torizo 
    dw EnemyShot_Torizo_Normal 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Hitboxes_Torizo_StandUp_SitDown_FacingLeft_AA8938:
    dw $0001,$FFF5,$FFD6,$000A,$0007 
    dw EnemyTouch_Torizo 
    dw EnemyShot_Torizo_Normal 
endif ; !FEATURE_KEEP_UNREFERENCED

Hitboxes_Torizo_StandUp_SitDown_FacingRight_0:
    dw $0001,$FFF1,$FFE5,$000D,$001B 
    dw EnemyTouch_Torizo 
    dw EnemyShot_Torizo_StandUp_SitDown 

Hitboxes_Torizo_StandUp_SitDown_FacingRight_1:
    dw $0001,$FFF3,$FFE5,$000D,$001B 
    dw EnemyTouch_Torizo 
    dw EnemyShot_Torizo_StandUp_SitDown 

Hitboxes_Torizo_StandUp_SitDown_FacingRight_2:
    dw $0001,$FFF2,$FFE0,$000D,$0021 
    dw EnemyTouch_Torizo 
    dw EnemyShot_Torizo_StandUp_SitDown 

Hitboxes_Torizo_StandUp_SitDown_FacingRight_3:
    dw $0001,$FFF2,$FFDD,$000B,$0027 
    dw EnemyTouch_Torizo 
    dw EnemyShot_Torizo_StandUp_SitDown 

Hitboxes_Torizo_StandUp_SitDown_FacingRight_4:
    dw $0001,$FFFA,$FFD6,$000D,$002F 
    dw EnemyTouch_Torizo 
    dw EnemyShot_Torizo_StandUp_SitDown 

Hitboxes_Torizo_StandUp_SitDown_FacingRight_5:
    dw $0001,$FFF9,$FFD7,$000B,$002F 
    dw EnemyTouch_Torizo 
    dw EnemyShot_Torizo_StandUp_SitDown 

Hitboxes_Torizo_StandUp_SitDown_FacingRight_6:
    dw $0001,$FFF8,$FFD7,$0016,$002F 
    dw EnemyTouch_Torizo 
    dw EnemyShot_Torizo_StandUp_SitDown 

Hitboxes_Torizo_StandUp_SitDown_FacingRight_7:
    dw $0001,$FFF6,$FFDA,$000D,$0017 
    dw EnemyTouch_Torizo 
    dw EnemyShot_Torizo_Normal 

Hitboxes_Torizo_StandUp_SitDown_FacingRight_8:
    dw $0000 

Hitboxes_Torizo_StandUp_SitDown_FacingRight_9:
    dw $0000 

UNSUED_Hitboxes_Torizo_StandUp_SitDown_FacingRight_AA89BA:
    dw $0001,$0000,$002B,$0016,$0040 
    dw EnemyTouch_Torizo 
    dw RTL_AAC9C1 

Hitboxes_Torizo_StandUp_SitDown_FacingRight_A:
    dw $0000 

UNSUED_Hitboxes_Torizo_StandUp_SitDown_FacingRight_AA89CA:
    dw $0001,$000A,$0026,$001F,$003C 
    dw EnemyTouch_Torizo 
    dw RTL_AAC9C1 

Hitboxes_Torizo_StandUp_SitDown_FacingRight_B:
    dw $0000 

UNSUED_Hitboxes_Torizo_StandUp_SitDown_FacingRight_AA89DA:
    dw $0001,$0014,$0018,$0022,$0025 
    dw EnemyTouch_Torizo 
    dw RTL_AAC9C1 

Hitboxes_Torizo_StandUp_SitDown_FacingRight_C:
    dw $0000 

UNSUED_Hitboxes_Torizo_StandUp_SitDown_FacingRight_AA89EA:
    dw $0001,$0015,$0008,$003B,$0014 
    dw EnemyTouch_Torizo 
    dw RTL_AAC9C1 

Hitboxes_Torizo_StandUp_SitDown_FacingRight_D:
    dw $0000 

UNSUED_Hitboxes_Torizo_StandUp_SitDown_FacingRight_AA89FA:
    dw $0001,$0017,$FFF9,$002D,$0004 
    dw EnemyTouch_Torizo 
    dw RTL_AAC9C1 

Hitboxes_Torizo_StandUp_SitDown_FacingRight_E:
    dw $0000 

UNSUED_Hitboxes_Torizo_StandUp_SitDown_FacingRight_AA8A0A:
    dw $0001,$000F,$FFDB,$001C,$FFED 
    dw EnemyTouch_Torizo 
    dw RTL_AAC9C1 

Hitboxes_Torizo_StandUp_SitDown_FacingRight_F:
    dw $0000 

Hitboxes_Torizo_StandUp_SitDown_FacingRight_10:
    dw $0000 

UNSUED_Hitboxes_Torizo_StandUp_SitDown_FacingRight_AA8A1C:
    dw $0001,$FFFF,$0027,$000F,$003B 
    dw EnemyTouch_Torizo 
    dw RTL_AAC9C1 

Hitboxes_Torizo_StandUp_SitDown_FacingRight_11:
    dw $0000 

UNSUED_Hitboxes_Torizo_StandUp_SitDown_FacingRight_AA8A2C:
    dw $0001,$0009,$0023,$001A,$0034 
    dw EnemyTouch_Torizo 
    dw RTL_AAC9C1 

Hitboxes_Torizo_StandUp_SitDown_FacingRight_12:
    dw $0000 

UNSUED_Hitboxes_Torizo_StandUp_SitDown_FacingRight_AA8A3C:
    dw $0001,$0016,$0018,$0023,$0024 
    dw EnemyTouch_Torizo 
    dw RTL_AAC9C1 

Hitboxes_Torizo_StandUp_SitDown_FacingRight_13:
    dw $0000 

UNSUED_Hitboxes_Torizo_StandUp_SitDown_FacingRight_AA8A4C:
    dw $0001,$0016,$0007,$0034,$0012 
    dw EnemyTouch_Torizo 
    dw RTL_AAC9C1 

Hitboxes_Torizo_StandUp_SitDown_FacingRight_14:
    dw $0000 

UNSUED_Hitboxes_Torizo_StandUp_SitDown_FacingRight_AA8A5C:
    dw $0001,$0018,$FFF6,$002C,$0005 
    dw EnemyTouch_Torizo 
    dw RTL_AAC9C1 

Hitboxes_Torizo_StandUp_SitDown_FacingRight_15:
    dw $0000 

UNSUED_Hitboxes_Torizo_StandUp_SitDown_FacingRight_AA8A6C:
    dw $0001,$000F,$FFDA,$001C,$FFF1 
    dw EnemyTouch_Torizo 
    dw RTL_AAC9C1 

Hitboxes_Torizo_StandUp_SitDown_FacingRight_16:
    dw $0001,$FFF8,$FFDB,$000F,$000E 
    dw EnemyTouch_Torizo 
    dw EnemyShot_Torizo_Normal 

Hitboxes_Torizo_StandUp_SitDown_FacingRight_17:
    dw $0001,$FFF7,$FFD8,$0010,$0019 
    dw EnemyTouch_Torizo 
    dw EnemyShot_Torizo_Normal 

Spritemaps_Torizo_0:
    dw $0004,$000C 
    db $F4 
    dw $23CB,$0004 
    db $F4 
    dw $23CA,$81F4 
    db $F4 
    dw $23C8,$81F4 
    db $04 
    dw $23E8 

Spritemaps_Torizo_1:
    dw $0004,$01F8 
    db $04 
    dw $23DB,$01F0 
    db $04 
    dw $23DA,$8000 
    db $F4 
    dw $23C6,$81F0 
    db $F4 
    dw $23C4 

Spritemaps_Torizo_2:
    dw $0003,$81E8 
    db $FC 
    dw $23C0,$8000 
    db $F4 
    dw $23C6,$81F0 
    db $F4 
    dw $23C4 

Spritemaps_Torizo_3:
    dw $0003,$81E8 
    db $FC 
    dw $23C2,$8000 
    db $F4 
    dw $23C6,$81F0 
    db $F4 
    dw $23C4 

Spritemaps_Torizo_4:
    dw $0003,$81E8 
    db $FC 
    dw $23E0,$8000 
    db $F4 
    dw $23C6,$81F0 
    db $F4 
    dw $23C4 

Spritemaps_Torizo_5:
    dw $0008,$01E0 
    db $F4 
    dw $2372,$01E8 
    db $F4 
    dw $2371,$01F0 
    db $0C 
    dw $23F2,$01F0 
    db $04 
    dw $23F3,$01F0 
    db $FC 
    dw $23E3,$01E8 
    db $FC 
    dw $23E2,$8000 
    db $F4 
    dw $23C6,$81F0 
    db $F4 
    dw $23C4 

Spritemaps_Torizo_6:
    dw $0013,$01F5 
    db $18 
    dw $234C,$0003 
    db $18 
    dw $634C,$01FC 
    db $00 
    dw $635F,$01F8 
    db $D8 
    dw $239F,$01F5 
    db $28 
    dw $23DF,$01F5 
    db $20 
    dw $23CF,$01F5 
    db $10 
    dw $239E,$01F6 
    db $08 
    dw $23DE,$01F7 
    db $00 
    dw $23CE,$81F0 
    db $F0 
    dw $23E6,$81F0 
    db $E0 
    dw $23E4,$0000 
    db $D8 
    dw $639F,$0003 
    db $28 
    dw $63DF,$0003 
    db $20 
    dw $63CF,$0003 
    db $10 
    dw $639E,$0002 
    db $08 
    dw $63DE,$0001 
    db $00 
    dw $63CE,$8000 
    db $F0 
    dw $63E6,$8000 
    db $E0 
    dw $63E4 

Spritemaps_Torizo_7:
    dw $001B,$0000 
    db $F8 
    dw $63DC,$0000 
    db $F0 
    dw $63CC,$01F8 
    db $F8 
    dw $23DC,$01F8 
    db $F0 
    dw $23CC,$0003 
    db $18 
    dw $634C,$01F5 
    db $18 
    dw $234C,$01F0 
    db $E8 
    dw $23F4,$01F0 
    db $E0 
    dw $23E4,$0000 
    db $E8 
    dw $63DD,$0000 
    db $E0 
    dw $63CD,$01F8 
    db $E8 
    dw $23DD,$01F8 
    db $E0 
    dw $23CD,$0008 
    db $E8 
    dw $63F4,$0008 
    db $E0 
    dw $63E4,$01FC 
    db $00 
    dw $635F,$01F5 
    db $28 
    dw $23DF,$01F5 
    db $20 
    dw $23CF,$01F5 
    db $10 
    dw $239E,$01F6 
    db $08 
    dw $23DE,$01F7 
    db $00 
    dw $23CE,$81F0 
    db $F0 
    dw $23E6,$0003 
    db $28 
    dw $63DF,$0003 
    db $20 
    dw $63CF,$0003 
    db $10 
    dw $639E,$0002 
    db $08 
    dw $63DE,$0001 
    db $00 
    dw $63CE,$8000 
    db $F0 
    dw $63E6 

Spritemaps_Torizo_8:
    dw $0001,$01FC 
    db $FC 
    dw $6B70 

Spritemaps_Torizo_9:
    dw $0001,$01FC 
    db $FC 
    dw $6B63 

Spritemaps_Torizo_A:
    dw $0001,$01FC 
    db $FC 
    dw $6B67 

Spritemaps_Torizo_B:
    dw $0001,$01FC 
    db $FC 
    dw $6B6A 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemaps_Torizo_AA8C25:
    dw $0001,$81F8 
    db $F8 
    dw $6B2E 

UNUSED_Spritemaps_Torizo_AA8C2C:
    dw $0001,$81F8 
    db $F8 
    dw $2304 
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemaps_Torizo_C:
    dw $001A,$01E9 
    db $FA 
    dw $23FB,$01E1 
    db $FA 
    dw $23FA,$81FC 
    db $EE 
    dw $2328,$81F8 
    db $FB 
    dw $6308,$01F2 
    db $15 
    dw $2362,$01EA 
    db $15 
    dw $2361,$01E2 
    db $15 
    dw $2360,$81E7 
    db $F7 
    dw $E358,$81EF 
    db $FF 
    dw $E347,$01F9 
    db $12 
    dw $2394,$01F1 
    db $12 
    dw $2393,$81F1 
    db $02 
    dw $2373,$0005 
    db $16 
    dw $23EF,$000D 
    db $16 
    dw $23FC,$000D 
    db $0E 
    dw $23FF,$81FD 
    db $06 
    dw $23ED,$0007 
    db $E3 
    dw $23CB,$01FF 
    db $E3 
    dw $23CA,$81EF 
    db $E3 
    dw $23C8,$81EF 
    db $F3 
    dw $23E8,$8008 
    db $06 
    dw $2342,$81F8 
    db $06 
    dw $2340,$8008 
    db $F6 
    dw $2322,$81F8 
    db $F6 
    dw $2320,$8008 
    db $E6 
    dw $2302,$81F8 
    db $E6 
    dw $2300 

Spritemaps_Torizo_D:
    dw $001A,$81FD 
    db $F9 
    dw $2306,$81FD 
    db $EC 
    dw $2326,$01E3 
    db $03 
    dw $638F,$01EB 
    db $03 
    dw $638E,$01EF 
    db $04 
    dw $634F,$01F7 
    db $04 
    dw $634E,$01FF 
    db $04 
    dw $634D,$01FB 
    db $10 
    dw $2396,$01F3 
    db $10 
    dw $2395,$81F3 
    db $00 
    dw $2375,$0002 
    db $01 
    dw $A3AE,$01FA 
    db $01 
    dw $A3AD,$81FA 
    db $09 
    dw $A3A6,$01FB 
    db $15 
    dw $2362,$01F3 
    db $15 
    dw $2361,$01EB 
    db $15 
    dw $2360,$0006 
    db $E4 
    dw $23CB,$01FE 
    db $E4 
    dw $23CA,$81EE 
    db $E4 
    dw $23C8,$81EE 
    db $F4 
    dw $23E8,$8007 
    db $07 
    dw $2342,$81F7 
    db $07 
    dw $2340,$8007 
    db $F7 
    dw $2322,$81F7 
    db $F7 
    dw $2320,$8007 
    db $E7 
    dw $2302,$81F7 
    db $E7 
    dw $2300 

Spritemaps_Torizo_E:
    dw $001B,$81E7 
    db $0D 
    dw $636C,$81FA 
    db $F4 
    dw $2306,$81FA 
    db $E7 
    dw $2326,$81EE 
    db $07 
    dw $6358,$81F5 
    db $FF 
    dw $6347,$01FB 
    db $16 
    dw $2398,$01F3 
    db $16 
    dw $2397,$81F3 
    db $06 
    dw $2377,$0001 
    db $1B 
    dw $2362,$01F9 
    db $1B 
    dw $2361,$01F1 
    db $1B 
    dw $2360,$0007 
    db $0B 
    dw $A3EC,$01FF 
    db $0B 
    dw $A3EB,$01F7 
    db $0B 
    dw $A3EA,$0007 
    db $03 
    dw $23EC,$01FF 
    db $03 
    dw $23EB,$01F7 
    db $03 
    dw $23EA,$0006 
    db $DE 
    dw $23CB,$01FE 
    db $DE 
    dw $23CA,$81EE 
    db $DE 
    dw $23C8,$81EE 
    db $EE 
    dw $23E8,$8007 
    db $01 
    dw $2342,$81F7 
    db $01 
    dw $2340,$8007 
    db $F1 
    dw $2322,$81F7 
    db $F1 
    dw $2320,$8007 
    db $E1 
    dw $2302,$81F7 
    db $E1 
    dw $2300 

Spritemaps_Torizo_E_miscount:
    dw $0019,$81FB 
    db $F1 
    dw $2306,$81FB 
    db $E4 
    dw $2326,$81E6 
    db $0A 
    dw $636C,$81ED 
    db $05 
    dw $6358,$81F4 
    db $FD 
    dw $6347,$8002 
    db $FB 
    dw $23A9,$0002 
    db $0B 
    dw $23BB,$01FA 
    db $0B 
    dw $23AF,$81FA 
    db $FB 
    dw $23A8,$0006 
    db $D9 
    dw $23CB,$01FE 
    db $D9 
    dw $23CA,$81EE 
    db $D9 
    dw $23C8,$81EE 
    db $E9 
    dw $23E8,$8007 
    db $FC 
    dw $2342,$81F7 
    db $FC 
    dw $2340,$8007 
    db $EC 
    dw $2322,$81F7 
    db $EC 
    dw $2320,$8007 
    db $DC 
    dw $2302,$81F7 
    db $DC 
    dw $2300,$0001 
    db $1B 
    dw $2398,$01F9 
    db $1B 
    dw $2397,$81F9 
    db $0B 
    dw $2377,$0008 
    db $21 
    dw $2362,$0000 
    db $21 
    dw $2361,$01F8 
    db $21 
    dw $2360 

Spritemaps_Torizo_F:
    dw $0019,$01FD 
    db $D3 
    dw $23CB,$01F5 
    db $D3 
    dw $23CA,$81E5 
    db $E3 
    dw $23E8,$81E5 
    db $D3 
    dw $23C8,$0001 
    db $0F 
    dw $23AC,$01F9 
    db $0F 
    dw $23AB,$81F9 
    db $FF 
    dw $23A4,$0003 
    db $28 
    dw $2362,$01FB 
    db $28 
    dw $2361,$01F3 
    db $28 
    dw $2360,$0002 
    db $21 
    dw $2396,$01FA 
    db $21 
    dw $2395,$81FA 
    db $11 
    dw $2375,$01FB 
    db $0E 
    dw $25AE,$01F3 
    db $0E 
    dw $25AD,$81F3 
    db $FE 
    dw $25A6,$81FD 
    db $15 
    dw $258A,$81F5 
    db $0D 
    dw $2579,$81FF 
    db $1F 
    dw $25A2,$81FE 
    db $F7 
    dw $2342,$81EE 
    db $F7 
    dw $2340,$81FE 
    db $E7 
    dw $2322,$81EE 
    db $E7 
    dw $2320,$81FE 
    db $D7 
    dw $2302,$81EE 
    db $D7 
    dw $2300 

Spritemaps_Torizo_10:
    dw $001A,$01FD 
    db $D4 
    dw $23CB,$01F5 
    db $D4 
    dw $23CA,$81E5 
    db $E4 
    dw $23E8,$81E5 
    db $D4 
    dw $23C8,$01FC 
    db $0E 
    dw $63AE,$0004 
    db $0E 
    dw $63AD,$81FC 
    db $FE 
    dw $63A6,$0013 
    db $28 
    dw $2362,$000B 
    db $28 
    dw $2361,$0003 
    db $28 
    dw $2360,$000D 
    db $22 
    dw $2398,$0005 
    db $22 
    dw $2397,$8005 
    db $12 
    dw $2377,$81F6 
    db $FC 
    dw $25A9,$01F6 
    db $0C 
    dw $25BB,$01EE 
    db $0C 
    dw $25AF,$81EE 
    db $FC 
    dw $25A8,$81F2 
    db $1F 
    dw $25A2,$01EF 
    db $1F 
    dw $2597,$81EF 
    db $0F 
    dw $2577,$81FE 
    db $F8 
    dw $2342,$81EE 
    db $F8 
    dw $2340,$81FE 
    db $E8 
    dw $2322,$81EE 
    db $E8 
    dw $2320,$81FE 
    db $D8 
    dw $2302,$81EE 
    db $D8 
    dw $2300 

Spritemaps_Torizo_12:
    dw $001C,$01FD 
    db $D5 
    dw $23CB,$01F5 
    db $D5 
    dw $23CA,$81E5 
    db $E5 
    dw $23E8,$81E5 
    db $D5 
    dw $23C8,$001A 
    db $28 
    dw $2362,$0012 
    db $28 
    dw $2361,$000A 
    db $28 
    dw $2360,$01FD 
    db $10 
    dw $63AE,$0005 
    db $10 
    dw $63AD,$81FD 
    db $00 
    dw $63A6,$800F 
    db $1C 
    dw $238A,$8007 
    db $14 
    dw $2379,$01EB 
    db $28 
    dw $2562,$01E3 
    db $28 
    dw $2561,$01DB 
    db $28 
    dw $2560,$81F7 
    db $FE 
    dw $25A9,$01F7 
    db $0E 
    dw $25BB,$01EF 
    db $0E 
    dw $25AF,$81EF 
    db $FE 
    dw $25A8,$01EF 
    db $22 
    dw $2594,$01E7 
    db $22 
    dw $2593,$81E7 
    db $12 
    dw $2573,$81FE 
    db $F9 
    dw $2342,$81EE 
    db $F9 
    dw $2340,$81FE 
    db $E9 
    dw $2322,$81EE 
    db $E9 
    dw $2320,$81FE 
    db $D9 
    dw $2302,$81EE 
    db $D9 
    dw $2300 

Spritemaps_Torizo_13:
    dw $0016,$01EB 
    db $28 
    dw $2362,$01E3 
    db $28 
    dw $2361,$01DB 
    db $28 
    dw $2360,$81F7 
    db $FE 
    dw $23A9,$01F7 
    db $0E 
    dw $23BB,$01EF 
    db $0E 
    dw $23AF,$81EF 
    db $FE 
    dw $23A8,$01EF 
    db $22 
    dw $2394,$01E7 
    db $22 
    dw $2393,$81E7 
    db $12 
    dw $2373,$01FC 
    db $0D 
    dw $65AE,$0004 
    db $0D 
    dw $65AD,$81FC 
    db $FD 
    dw $65A6,$800D 
    db $16 
    dw $258A,$8005 
    db $0E 
    dw $2579,$8013 
    db $1F 
    dw $25A0,$81FE 
    db $F9 
    dw $2342,$81EE 
    db $F9 
    dw $2340,$81FE 
    db $E9 
    dw $2322,$81EE 
    db $E9 
    dw $2320,$81FE 
    db $D9 
    dw $2302,$81EE 
    db $D9 
    dw $2300 

Spritemaps_Torizo_14:
    dw $0015,$01FB 
    db $0F 
    dw $23AE,$01F3 
    db $0F 
    dw $23AD,$81F3 
    db $FF 
    dw $23A6,$01F0 
    db $28 
    dw $2362,$01E8 
    db $28 
    dw $2361,$01E0 
    db $28 
    dw $2360,$01F4 
    db $23 
    dw $2394,$01EC 
    db $23 
    dw $2393,$81EC 
    db $13 
    dw $2373,$8009 
    db $1E 
    dw $25A0,$01FF 
    db $10 
    dw $25AC,$01F7 
    db $10 
    dw $25AB,$81F7 
    db $00 
    dw $25A4,$8005 
    db $18 
    dw $258A,$81FD 
    db $10 
    dw $2579,$81FE 
    db $F8 
    dw $2342,$81EE 
    db $F8 
    dw $2340,$81FE 
    db $E8 
    dw $2322,$81EE 
    db $E8 
    dw $2320,$81FE 
    db $D8 
    dw $2302,$81EE 
    db $D8 
    dw $2300 

Spritemaps_Torizo_15:
    dw $0015,$0001 
    db $0F 
    dw $23AC,$01F9 
    db $0F 
    dw $23AB,$81F9 
    db $FF 
    dw $23A4,$0003 
    db $28 
    dw $2362,$01FB 
    db $28 
    dw $2361,$01F3 
    db $28 
    dw $2360,$0002 
    db $21 
    dw $2396,$01FA 
    db $21 
    dw $2395,$81FA 
    db $11 
    dw $2375,$01FB 
    db $0E 
    dw $25AE,$01F3 
    db $0E 
    dw $25AD,$81F3 
    db $FE 
    dw $25A6,$81FD 
    db $15 
    dw $258A,$81F5 
    db $0D 
    dw $2579,$81FF 
    db $1F 
    dw $25A2,$81FE 
    db $F7 
    dw $2342,$81EE 
    db $F7 
    dw $2340,$81FE 
    db $E7 
    dw $2322,$81EE 
    db $E7 
    dw $2320,$81FE 
    db $D7 
    dw $2302,$81EE 
    db $D7 
    dw $2300 

Spritemaps_Torizo_16:
    dw $0016,$01FC 
    db $0E 
    dw $63AE,$0004 
    db $0E 
    dw $63AD,$81FC 
    db $FE 
    dw $63A6,$0013 
    db $28 
    dw $2362,$000B 
    db $28 
    dw $2361,$0003 
    db $28 
    dw $2360,$000D 
    db $22 
    dw $2398,$0005 
    db $22 
    dw $2397,$8005 
    db $12 
    dw $2377,$81F6 
    db $FC 
    dw $25A9,$01F6 
    db $0C 
    dw $25BB,$01EE 
    db $0C 
    dw $25AF,$81EE 
    db $FC 
    dw $25A8,$81F2 
    db $1F 
    dw $25A2,$01EF 
    db $1F 
    dw $2597,$81EF 
    db $0F 
    dw $2577,$81FE 
    db $F8 
    dw $2342,$81EE 
    db $F8 
    dw $2340,$81FE 
    db $E8 
    dw $2322,$81EE 
    db $E8 
    dw $2320,$81FE 
    db $D8 
    dw $2302,$81EE 
    db $D8 
    dw $2300 

Spritemaps_Torizo_17:
    dw $0016,$01FC 
    db $0E 
    dw $63AE,$0004 
    db $0E 
    dw $63AD,$81FC 
    db $FE 
    dw $63A6,$800D 
    db $17 
    dw $238A,$8005 
    db $0F 
    dw $2379,$8013 
    db $20 
    dw $23A0,$01EB 
    db $28 
    dw $2562,$01E3 
    db $28 
    dw $2561,$01DB 
    db $28 
    dw $2560,$81F7 
    db $FE 
    dw $25A9,$01F7 
    db $0E 
    dw $25BB,$01EF 
    db $0E 
    dw $25AF,$81EF 
    db $FE 
    dw $25A8,$01EF 
    db $22 
    dw $2594,$01E7 
    db $22 
    dw $2593,$81E7 
    db $12 
    dw $2573,$81FE 
    db $F9 
    dw $2342,$81EE 
    db $F9 
    dw $2340,$81FE 
    db $E9 
    dw $2322,$81EE 
    db $E9 
    dw $2320,$81FE 
    db $D9 
    dw $2302,$81EE 
    db $D9 
    dw $2300 

Spritemaps_Torizo_18:
    dw $0015,$800A 
    db $1D 
    dw $23A0,$0000 
    db $0F 
    dw $23AC,$01F8 
    db $0F 
    dw $23AB,$81F8 
    db $FF 
    dw $23A4,$8006 
    db $17 
    dw $238A,$81FE 
    db $0F 
    dw $2379,$01FD 
    db $0F 
    dw $25AE,$01F5 
    db $0F 
    dw $25AD,$81F5 
    db $FF 
    dw $25A6,$01F2 
    db $28 
    dw $2562,$01EA 
    db $28 
    dw $2561,$01E2 
    db $28 
    dw $2560,$01F6 
    db $23 
    dw $2594,$01EE 
    db $23 
    dw $2593,$81EE 
    db $13 
    dw $2573,$81FE 
    db $F8 
    dw $2342,$81EE 
    db $F8 
    dw $2340,$81FE 
    db $E8 
    dw $2322,$81EE 
    db $E8 
    dw $2320,$81FE 
    db $D8 
    dw $2302,$81EE 
    db $D8 
    dw $2300 

Spritemaps_Torizo_19:
    dw $0015,$01FB 
    db $0E 
    dw $23AE,$01F3 
    db $0E 
    dw $23AD,$81F3 
    db $FE 
    dw $23A6,$81FD 
    db $15 
    dw $238A,$81F5 
    db $0D 
    dw $2379,$81FF 
    db $1F 
    dw $23A2,$0001 
    db $0F 
    dw $25AC,$01F9 
    db $0F 
    dw $25AB,$81F9 
    db $FF 
    dw $25A4,$0003 
    db $28 
    dw $2562,$01FB 
    db $28 
    dw $2561,$01F3 
    db $28 
    dw $2560,$0002 
    db $21 
    dw $2596,$01FA 
    db $21 
    dw $2595,$81FA 
    db $11 
    dw $2575,$81FE 
    db $F7 
    dw $2342,$81EE 
    db $F7 
    dw $2340,$81FE 
    db $E7 
    dw $2322,$81EE 
    db $E7 
    dw $2320,$81FE 
    db $D7 
    dw $2302,$81EE 
    db $D7 
    dw $2300 

Spritemaps_Torizo_1A:
    dw $0016,$81F7 
    db $FC 
    dw $23A9,$01F7 
    db $0C 
    dw $23BB,$01EF 
    db $0C 
    dw $23AF,$81EF 
    db $FC 
    dw $23A8,$81F3 
    db $1F 
    dw $23A2,$01F0 
    db $1F 
    dw $2397,$81F0 
    db $0F 
    dw $2377,$01FE 
    db $0E 
    dw $65AE,$0006 
    db $0E 
    dw $65AD,$81FE 
    db $FE 
    dw $65A6,$0015 
    db $28 
    dw $2562,$000D 
    db $28 
    dw $2561,$0005 
    db $28 
    dw $2560,$000F 
    db $22 
    dw $2598,$0007 
    db $22 
    dw $2597,$8007 
    db $12 
    dw $2577,$81FE 
    db $F8 
    dw $2342,$81EE 
    db $F8 
    dw $2340,$81FE 
    db $E8 
    dw $2322,$81EE 
    db $E8 
    dw $2320,$81FE 
    db $D8 
    dw $2302,$81EE 
    db $D8 
    dw $2300 

Spritemaps_Torizo_1B:
    dw $0007,$0010 
    db $25 
    dw $637B,$0010 
    db $1D 
    dw $636B,$8005 
    db $FB 
    dw $230C,$0010 
    db $16 
    dw $2364,$0010 
    db $0E 
    dw $2354,$0010 
    db $06 
    dw $2344,$81F8 
    db $F8 
    dw $632A 

Spritemaps_Torizo_1C:
    dw $0005,$81FA 
    db $23 
    dw $236C,$8001 
    db $02 
    dw $230A,$0002 
    db $1F 
    dw $6366,$8002 
    db $0F 
    dw $6345,$81F8 
    db $F8 
    dw $2324 

Spritemaps_Torizo_1D:
    dw $0005,$81F0 
    db $28 
    dw $236C,$01F9 
    db $24 
    dw $6366,$81F9 
    db $14 
    dw $6345,$81FC 
    db $05 
    dw $2308,$81F8 
    db $F8 
    dw $6328 

Spritemaps_Torizo_1E:
    dw $0005,$81E7 
    db $24 
    dw $236C,$81F8 
    db $06 
    dw $2306,$81EC 
    db $1B 
    dw $6358,$81F4 
    db $13 
    dw $6347,$81F8 
    db $F8 
    dw $2326 

Spritemaps_Torizo_1F:
    dw $0005,$81DE 
    db $19 
    dw $236C,$81F4 
    db $05 
    dw $6308,$01E4 
    db $16 
    dw $635C,$81EC 
    db $0E 
    dw $634A,$81F8 
    db $F8 
    dw $2328 

Spritemaps_Torizo_20:
    dw $0007,$81EF 
    db $02 
    dw $630A,$01CE 
    db $0B 
    dw $638F,$01D6 
    db $0B 
    dw $638E,$01DA 
    db $0B 
    dw $634F,$01E2 
    db $0B 
    dw $634E,$01EA 
    db $0B 
    dw $634D,$81F8 
    db $F8 
    dw $6324 

Spritemaps_Torizo_21:
    dw $0005,$81D4 
    db $F6 
    dw $E36E,$81EF 
    db $02 
    dw $630A,$81DB 
    db $FA 
    dw $E358,$81E3 
    db $02 
    dw $E347,$81F8 
    db $F8 
    dw $6324 

Spritemaps_Torizo_22:
    dw $0007,$01E6 
    db $DD 
    dw $A37B,$01E6 
    db $E5 
    dw $A36B,$81EA 
    db $F8 
    dw $630E,$01E6 
    db $EB 
    dw $E364,$01E6 
    db $F3 
    dw $E354,$01E6 
    db $FB 
    dw $E344,$81F8 
    db $F8 
    dw $232A 

Spritemaps_Torizo_23:
    dw $0007,$000F 
    db $25 
    dw $657B,$000F 
    db $1D 
    dw $656B,$8005 
    db $FB 
    dw $250C,$0010 
    db $16 
    dw $2564,$0010 
    db $0E 
    dw $2554,$0010 
    db $06 
    dw $2544,$81F8 
    db $F8 
    dw $652A 

Spritemaps_Torizo_24:
    dw $0005,$81FA 
    db $23 
    dw $256C,$8001 
    db $02 
    dw $250A,$0002 
    db $1F 
    dw $6566,$8002 
    db $0F 
    dw $6545,$81F8 
    db $F8 
    dw $2524 

Spritemaps_Torizo_25:
    dw $0005,$81F0 
    db $28 
    dw $256C,$01F9 
    db $24 
    dw $6566,$81F9 
    db $14 
    dw $6545,$81FC 
    db $05 
    dw $2508,$81F8 
    db $F8 
    dw $6528 

Spritemaps_Torizo_26:
    dw $0005,$81E6 
    db $23 
    dw $256C,$81F8 
    db $06 
    dw $2506,$81EC 
    db $1B 
    dw $6558,$81F4 
    db $13 
    dw $6547,$81F8 
    db $F8 
    dw $2526 

Spritemaps_Torizo_27:
    dw $0005,$81DC 
    db $19 
    dw $256C,$81F4 
    db $05 
    dw $6508,$01E4 
    db $16 
    dw $655C,$81EC 
    db $0E 
    dw $654A,$81F8 
    db $F8 
    dw $2528 

Spritemaps_Torizo_28:
    dw $0007,$81EF 
    db $02 
    dw $650A,$01CB 
    db $0B 
    dw $658F,$01D3 
    db $0B 
    dw $658E,$01DA 
    db $0B 
    dw $654F,$01E2 
    db $0B 
    dw $654E,$01EA 
    db $0B 
    dw $654D,$81F8 
    db $F8 
    dw $6524 

Spritemaps_Torizo_29:
    dw $0005,$81D3 
    db $F4 
    dw $E56E,$81EF 
    db $02 
    dw $650A,$81DB 
    db $FA 
    dw $E558,$81E3 
    db $02 
    dw $E547,$81F8 
    db $F8 
    dw $6524 

Spritemaps_Torizo_2A:
    dw $0007,$01E6 
    db $DD 
    dw $A57B,$01E6 
    db $E5 
    dw $A56B,$81EA 
    db $F8 
    dw $650E,$01E6 
    db $EB 
    dw $E564,$01E6 
    db $F3 
    dw $E554,$01E6 
    db $FB 
    dw $E544,$81F8 
    db $F8 
    dw $252A 

Spritemaps_Torizo_2B:
    dw $0018,$81EE 
    db $F3 
    dw $2330,$81F9 
    db $FD 
    dw $23A9,$01F9 
    db $0D 
    dw $23BB,$01F1 
    db $0D 
    dw $23AF,$81F1 
    db $FD 
    dw $23A8,$81FA 
    db $15 
    dw $238A,$81F2 
    db $0D 
    dw $2379,$0005 
    db $20 
    dw $2362,$01FD 
    db $20 
    dw $2361,$01F5 
    db $20 
    dw $2360,$81F5 
    db $FD 
    dw $25A9,$01F5 
    db $0D 
    dw $25BB,$01ED 
    db $0D 
    dw $25AF,$81ED 
    db $FD 
    dw $25A8,$81F6 
    db $15 
    dw $258A,$81EE 
    db $0D 
    dw $2579,$0001 
    db $20 
    dw $2562,$01F9 
    db $20 
    dw $2561,$01F1 
    db $20 
    dw $2560,$81EE 
    db $E3 
    dw $2310,$81FE 
    db $FB 
    dw $2342,$81FE 
    db $EB 
    dw $2322,$81FE 
    db $DB 
    dw $2302,$81EE 
    db $DB 
    dw $2300 

Spritemaps_Torizo_2C:
    dw $0013,$81EE 
    db $F2 
    dw $2330,$01FC 
    db $0F 
    dw $23AE,$01F4 
    db $0F 
    dw $23AD,$81F4 
    db $FF 
    dw $23A6,$8002 
    db $22 
    dw $23A0,$81FD 
    db $19 
    dw $238A,$81F5 
    db $11 
    dw $2379,$81EE 
    db $FA 
    dw $2340,$81EE 
    db $E2 
    dw $2310,$81FE 
    db $FA 
    dw $2342,$81FE 
    db $EA 
    dw $2322,$81FE 
    db $DA 
    dw $2302,$81EE 
    db $DA 
    dw $2300,$01F8 
    db $10 
    dw $65AC,$0000 
    db $10 
    dw $65AB,$81F8 
    db $00 
    dw $65A4,$8009 
    db $24 
    dw $25A0,$8004 
    db $1B 
    dw $258A,$81FC 
    db $13 
    dw $2579 

Spritemaps_Torizo_2D:
    dw $0015,$81EE 
    db $F2 
    dw $2330,$8003 
    db $27 
    dw $23A2,$8006 
    db $27 
    dw $23A2,$01F8 
    db $10 
    dw $23AB,$0000 
    db $10 
    dw $23AC,$81F8 
    db $00 
    dw $23A4,$81FD 
    db $13 
    dw $2377,$0005 
    db $23 
    dw $2398,$01FD 
    db $23 
    dw $2397,$01FB 
    db $10 
    dw $25AB,$0003 
    db $10 
    dw $25AC,$81FB 
    db $00 
    dw $25A4,$8000 
    db $13 
    dw $2577,$0008 
    db $23 
    dw $2598,$0000 
    db $23 
    dw $2597,$81EE 
    db $FA 
    dw $2340,$81EE 
    db $E2 
    dw $2310,$81FE 
    db $FA 
    dw $2342,$81FE 
    db $EA 
    dw $2322,$81FE 
    db $DA 
    dw $2302,$81EE 
    db $DA 
    dw $2300 

Spritemaps_Torizo_2E:
    dw $0018,$001A 
    db $28 
    dw $2562,$0012 
    db $28 
    dw $2561,$000A 
    db $28 
    dw $2560,$01EB 
    db $28 
    dw $2362,$01E3 
    db $28 
    dw $2361,$01DB 
    db $28 
    dw $2360,$81F7 
    db $FE 
    dw $23A9,$01F7 
    db $0E 
    dw $23BB,$01EF 
    db $0E 
    dw $23AF,$81EF 
    db $FE 
    dw $23A8,$01EF 
    db $22 
    dw $2394,$01E7 
    db $22 
    dw $2393,$81E7 
    db $12 
    dw $2373,$01FD 
    db $10 
    dw $65AE,$0005 
    db $10 
    dw $65AD,$81FD 
    db $00 
    dw $65A6,$800F 
    db $1C 
    dw $258A,$8007 
    db $14 
    dw $2579,$81FE 
    db $F9 
    dw $2342,$81EE 
    db $F9 
    dw $2340,$81FE 
    db $E9 
    dw $2322,$81EE 
    db $E9 
    dw $2320,$81FE 
    db $D9 
    dw $2302,$81EE 
    db $D9 
    dw $2300 

Spritemaps_Torizo_2F:
    dw $0018,$001A 
    db $28 
    dw $2362,$0012 
    db $28 
    dw $2361,$000A 
    db $28 
    dw $2360,$01FD 
    db $10 
    dw $63AE,$0005 
    db $10 
    dw $63AD,$81FD 
    db $00 
    dw $63A6,$800F 
    db $1C 
    dw $238A,$8007 
    db $14 
    dw $2379,$01EB 
    db $28 
    dw $2562,$01E3 
    db $28 
    dw $2561,$01DB 
    db $28 
    dw $2560,$81F7 
    db $FE 
    dw $25A9,$01F7 
    db $0E 
    dw $25BB,$01EF 
    db $0E 
    dw $25AF,$81EF 
    db $FE 
    dw $25A8,$01EF 
    db $22 
    dw $2594,$01E7 
    db $22 
    dw $2593,$81E7 
    db $12 
    dw $2573,$81FE 
    db $F9 
    dw $2342,$81EE 
    db $F9 
    dw $2340,$81FE 
    db $E9 
    dw $2322,$81EE 
    db $E9 
    dw $2320,$81FE 
    db $D9 
    dw $2302,$81EE 
    db $D9 
    dw $2300 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemaps_Torizo_AA9766:
    dw $0006,$8000 
    db $0C 
    dw $2342,$81F0 
    db $0C 
    dw $2340,$8000 
    db $FC 
    dw $2322,$81F0 
    db $FC 
    dw $2320,$8000 
    db $EC 
    dw $2302,$81F0 
    db $EC 
    dw $2300 
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemaps_Torizo_30:
    dw $0004,$01EC 
    db $F4 
    dw $63CB,$01F4 
    db $F4 
    dw $63CA,$81FC 
    db $F4 
    dw $63C8,$81FC 
    db $04 
    dw $63E8 

Spritemaps_Torizo_31:
    dw $0004,$0000 
    db $04 
    dw $63DB,$0008 
    db $04 
    dw $63DA,$81F0 
    db $F4 
    dw $63C6,$8000 
    db $F4 
    dw $63C4 

Spritemaps_Torizo_32:
    dw $0003,$8008 
    db $FC 
    dw $63C0,$81F0 
    db $F4 
    dw $63C6,$8000 
    db $F4 
    dw $63C4 

Spritemaps_Torizo_33:
    dw $0003,$8008 
    db $FC 
    dw $63C2,$81F0 
    db $F4 
    dw $63C6,$8000 
    db $F4 
    dw $63C4 

Spritemaps_Torizo_34:
    dw $0003,$8008 
    db $FC 
    dw $63E0,$81F0 
    db $F4 
    dw $63C6,$8000 
    db $F4 
    dw $63C4 

Spritemaps_Torizo_35:
    dw $0008,$0018 
    db $F4 
    dw $6372,$0010 
    db $F4 
    dw $6371,$0008 
    db $0C 
    dw $63F2,$0008 
    db $04 
    dw $63F3,$0008 
    db $FC 
    dw $63E3,$0010 
    db $FC 
    dw $63E2,$81F0 
    db $F4 
    dw $63C6,$8000 
    db $F4 
    dw $63C4 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemaps_Torizo_AA980F:
    dw $0013,$01F5 
    db $10 
    dw $234C,$0003 
    db $10 
    dw $634C,$01FC 
    db $F8 
    dw $635F,$01F8 
    db $D0 
    dw $239F,$01F5 
    db $20 
    dw $23DF,$01F5 
    db $18 
    dw $23CF,$01F5 
    db $08 
    dw $239E,$01F6 
    db $00 
    dw $23DE,$01F7 
    db $F8 
    dw $23CE,$81F0 
    db $E8 
    dw $23E6,$81F0 
    db $D8 
    dw $23E4,$0000 
    db $D0 
    dw $639F,$0003 
    db $20 
    dw $63DF,$0003 
    db $18 
    dw $63CF,$0003 
    db $08 
    dw $639E,$0002 
    db $00 
    dw $63DE,$0001 
    db $F8 
    dw $63CE,$8000 
    db $E8 
    dw $63E6,$8000 
    db $D8 
    dw $63E4 

UNUSED_Spritemaps_Torizo_AA9870:
    dw $001B,$0000 
    db $F0 
    dw $63DC,$0000 
    db $E8 
    dw $63CC,$01F8 
    db $F0 
    dw $23DC,$01F8 
    db $E8 
    dw $23CC,$0003 
    db $10 
    dw $634C,$01F5 
    db $10 
    dw $234C,$01F0 
    db $E0 
    dw $23F4,$01F0 
    db $D8 
    dw $23E4,$0000 
    db $E0 
    dw $63DD,$0000 
    db $D8 
    dw $63CD,$01F8 
    db $E0 
    dw $23DD,$01F8 
    db $D8 
    dw $23CD,$0008 
    db $E0 
    dw $63F4,$0008 
    db $D8 
    dw $63E4,$01FC 
    db $F8 
    dw $635F,$01F5 
    db $20 
    dw $23DF,$01F5 
    db $18 
    dw $23CF,$01F5 
    db $08 
    dw $239E,$01F6 
    db $00 
    dw $23DE,$01F7 
    db $F8 
    dw $23CE,$81F0 
    db $E8 
    dw $23E6,$0003 
    db $20 
    dw $63DF,$0003 
    db $18 
    dw $63CF,$0003 
    db $08 
    dw $639E,$0002 
    db $00 
    dw $63DE,$0001 
    db $F8 
    dw $63CE,$8000 
    db $E8 
    dw $63E6 

UNUSED_Spritemaps_Torizo_AA98F9:
    dw $0001,$01FC 
    db $FC 
    dw $6B70 

UNUSED_Spritemaps_Torizo_AA9900:
    dw $0001,$01FC 
    db $FC 
    dw $6B63 

UNUSED_Spritemaps_Torizo_AA9907:
    dw $0001,$01FC 
    db $FC 
    dw $6B67 

UNUSED_Spritemaps_Torizo_AA990E:
    dw $0001,$01FC 
    db $FC 
    dw $6B6A 

UNUSED_Spritemaps_Torizo_AA9915:
    dw $0001,$81F8 
    db $F8 
    dw $672C 

UNUSED_Spritemaps_Torizo_AA991C:
    dw $0001,$81F8 
    db $F8 
    dw $6B2E 

UNUSED_Spritemaps_Torizo_AA9923:
    dw $0001,$81F8 
    db $F8 
    dw $6304 

UNUSED_Spritemaps_Torizo_AA992A:
    dw $0006,$01F8 
    db $08 
    dw $EB52,$0000 
    db $08 
    dw $AB52,$01F8 
    db $F8 
    dw $2B92,$01F8 
    db $F0 
    dw $2B82,$0000 
    db $F8 
    dw $6B92,$0000 
    db $F0 
    dw $6B82 
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemaps_Torizo_36:
    dw $001A,$000F 
    db $FA 
    dw $63FB,$0017 
    db $FA 
    dw $63FA,$0017 
    db $FA 
    dw $63FA,$81F4 
    db $EE 
    dw $6328,$81F8 
    db $FB 
    dw $2308,$0006 
    db $15 
    dw $6362,$000E 
    db $15 
    dw $6361,$0016 
    db $15 
    dw $6360,$8009 
    db $F7 
    dw $A358,$8001 
    db $FF 
    dw $A347,$01FF 
    db $12 
    dw $6394,$0007 
    db $12 
    dw $6393,$81FF 
    db $02 
    dw $6373,$01F3 
    db $16 
    dw $63EF,$01EB 
    db $16 
    dw $63FC,$01EB 
    db $0E 
    dw $63FF,$81F3 
    db $06 
    dw $63ED,$01F1 
    db $E3 
    dw $63CB,$01F9 
    db $E3 
    dw $63CA,$8001 
    db $E3 
    dw $63C8,$8001 
    db $F3 
    dw $63E8,$81E8 
    db $06 
    dw $6342,$81F8 
    db $06 
    dw $6340,$81E8 
    db $F6 
    dw $6322,$81F8 
    db $F6 
    dw $6320,$81E8 
    db $E6 
    dw $6302 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemaps_Torizo_UnusedEntry_AA99CE:
    dw $81F8 
    db $E6 
    dw $6300 
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemaps_Torizo_37:
    dw $001A,$81F3 
    db $F9 
    dw $6306,$81F3 
    db $EC 
    dw $6326,$0015 
    db $03 
    dw $238F,$000D 
    db $03 
    dw $238E,$0009 
    db $04 
    dw $234F,$0001 
    db $04 
    dw $234E,$01F9 
    db $04 
    dw $234D,$01FD 
    db $10 
    dw $6396,$0005 
    db $10 
    dw $6395,$81FD 
    db $00 
    dw $6375,$01F6 
    db $01 
    dw $E3AE,$01FE 
    db $01 
    dw $E3AD,$81F6 
    db $09 
    dw $E3A6,$01FD 
    db $15 
    dw $6362,$0005 
    db $15 
    dw $6361,$000D 
    db $15 
    dw $6360,$01F2 
    db $E4 
    dw $63CB,$01FA 
    db $E4 
    dw $63CA,$8002 
    db $E4 
    dw $63C8,$8002 
    db $F4 
    dw $63E8,$81E9 
    db $07 
    dw $6342,$81F9 
    db $07 
    dw $6340,$81E9 
    db $F7 
    dw $6322,$81F9 
    db $F7 
    dw $6320,$81E9 
    db $E7 
    dw $6302,$81F9 
    db $E7 
    dw $6300 

Spritemaps_Torizo_38:
    dw $001B,$8009 
    db $0D 
    dw $236C,$81F6 
    db $F4 
    dw $6306,$81F6 
    db $E7 
    dw $6326,$8002 
    db $07 
    dw $2358,$81FB 
    db $FF 
    dw $2347,$01FD 
    db $16 
    dw $6398,$0005 
    db $16 
    dw $6397,$81FD 
    db $06 
    dw $6377,$01F7 
    db $1B 
    dw $6362,$01FF 
    db $1B 
    dw $6361,$0007 
    db $1B 
    dw $6360,$01F1 
    db $0B 
    dw $E3EC,$01F9 
    db $0B 
    dw $E3EB,$0001 
    db $0B 
    dw $E3EA,$01F1 
    db $03 
    dw $63EC,$01F9 
    db $03 
    dw $63EB,$0001 
    db $03 
    dw $63EA,$01F2 
    db $DE 
    dw $63CB,$01FA 
    db $DE 
    dw $63CA,$8002 
    db $DE 
    dw $63C8,$8002 
    db $EE 
    dw $63E8,$81E9 
    db $01 
    dw $6342,$81F9 
    db $01 
    dw $6340,$81E9 
    db $F1 
    dw $6322,$81F9 
    db $F1 
    dw $6320,$81E9 
    db $E1 
    dw $6302,$81F9 
    db $E1 
    dw $6300 

Spritemaps_Torizo_39:
    dw $0019,$81F5 
    db $F1 
    dw $6306,$81F5 
    db $E4 
    dw $6326,$800A 
    db $0A 
    dw $236C,$8003 
    db $05 
    dw $2358,$81FC 
    db $FD 
    dw $2347,$81EE 
    db $FB 
    dw $63A9,$01F6 
    db $0B 
    dw $63BB,$01FE 
    db $0B 
    dw $63AF,$81F6 
    db $FB 
    dw $63A8,$01F2 
    db $D9 
    dw $63CB,$01FA 
    db $D9 
    dw $63CA,$8002 
    db $D9 
    dw $63C8,$8002 
    db $E9 
    dw $63E8,$81E9 
    db $FC 
    dw $6342,$81F9 
    db $FC 
    dw $6340,$81E9 
    db $EC 
    dw $6322,$81F9 
    db $EC 
    dw $6320,$81E9 
    db $DC 
    dw $6302,$81F9 
    db $DC 
    dw $6300,$01F7 
    db $1B 
    dw $6398,$01FF 
    db $1B 
    dw $6397,$81F7 
    db $0B 
    dw $6377,$01F0 
    db $21 
    dw $6362,$01F8 
    db $21 
    dw $6361,$0000 
    db $21 
    dw $6360 

Spritemaps_Torizo_3A:
    dw $0019,$01FB 
    db $D3 
    dw $63CB,$0003 
    db $D3 
    dw $63CA,$800B 
    db $E3 
    dw $63E8,$800B 
    db $D3 
    dw $63C8,$01F7 
    db $0F 
    dw $63AC,$01FF 
    db $0F 
    dw $63AB,$81F7 
    db $FF 
    dw $63A4,$01F5 
    db $28 
    dw $6362,$01FD 
    db $28 
    dw $6361,$0005 
    db $28 
    dw $6360,$01F6 
    db $21 
    dw $6396,$01FE 
    db $21 
    dw $6395,$81F6 
    db $11 
    dw $6375,$01FD 
    db $0E 
    dw $65AE,$0005 
    db $0E 
    dw $65AD,$81FD 
    db $FE 
    dw $65A6,$81F3 
    db $15 
    dw $658A,$81FB 
    db $0D 
    dw $6579,$81F1 
    db $1F 
    dw $65A2,$81F2 
    db $F7 
    dw $6342,$8002 
    db $F7 
    dw $6340,$81F2 
    db $E7 
    dw $6322,$8002 
    db $E7 
    dw $6320,$81F2 
    db $D7 
    dw $6302,$8002 
    db $D7 
    dw $6300 

Spritemaps_Torizo_3B:
    dw $001A,$01FB 
    db $D4 
    dw $63CB,$0003 
    db $D4 
    dw $63CA,$800B 
    db $E4 
    dw $63E8,$800B 
    db $D4 
    dw $63C8,$01FC 
    db $0E 
    dw $23AE,$01F4 
    db $0E 
    dw $23AD,$81F4 
    db $FE 
    dw $23A6,$01E5 
    db $28 
    dw $6362,$01ED 
    db $28 
    dw $6361,$01F5 
    db $28 
    dw $6360,$01EB 
    db $22 
    dw $6398,$01F3 
    db $22 
    dw $6397,$81EB 
    db $12 
    dw $6377,$81FA 
    db $FC 
    dw $65A9,$0002 
    db $0C 
    dw $65BB,$000A 
    db $0C 
    dw $65AF,$8002 
    db $FC 
    dw $65A8,$81FE 
    db $1F 
    dw $65A2,$0009 
    db $1F 
    dw $6597,$8001 
    db $0F 
    dw $6577,$81F2 
    db $F8 
    dw $6342,$8002 
    db $F8 
    dw $6340,$81F2 
    db $E8 
    dw $6322,$8002 
    db $E8 
    dw $6320,$81F2 
    db $D8 
    dw $6302,$8002 
    db $D8 
    dw $6300 

Spritemaps_Torizo_3C:
    dw $001C,$01FB 
    db $D5 
    dw $63CB,$0003 
    db $D5 
    dw $63CA,$800B 
    db $E5 
    dw $63E8,$800B 
    db $D5 
    dw $63C8,$01DE 
    db $28 
    dw $6362,$01E6 
    db $28 
    dw $6361,$01EE 
    db $28 
    dw $6360,$01FB 
    db $10 
    dw $23AE,$01F3 
    db $10 
    dw $23AD,$81F3 
    db $00 
    dw $23A6,$81E1 
    db $1C 
    dw $638A,$81E9 
    db $14 
    dw $6379,$000D 
    db $28 
    dw $6562,$0015 
    db $28 
    dw $6561,$001D 
    db $28 
    dw $6560,$81F9 
    db $FE 
    dw $65A9,$0001 
    db $0E 
    dw $65BB,$0009 
    db $0E 
    dw $65AF,$8001 
    db $FE 
    dw $65A8,$0009 
    db $22 
    dw $6594,$0011 
    db $22 
    dw $6593,$8009 
    db $12 
    dw $6573,$81F2 
    db $F9 
    dw $6342,$8002 
    db $F9 
    dw $6340,$81F2 
    db $E9 
    dw $6322,$8002 
    db $E9 
    dw $6320,$81F2 
    db $D9 
    dw $6302,$8002 
    db $D9 
    dw $6300 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemaps_Torizo_AA9CF0:
    dw $0002,$01F8 
    db $FC 
    dw $2B80,$0000 
    db $FC 
    dw $6B80 

UNUSED_Spritemaps_Torizo_AA9CFC:
    dw $0004,$01F8 
    db $00 
    dw $2B90,$01F8 
    db $F8 
    dw $2B80,$0000 
    db $00 
    dw $6B90,$0000 
    db $F8 
    dw $6B80 

UNUSED_Spritemaps_Torizo_AA9D12:
    dw $0003,$81F8 
    db $F4 
    dw $6B80,$01F8 
    db $04 
    dw $2B99,$0000 
    db $04 
    dw $6B99 

UNUSED_Spritemaps_Torizo_AA9D23:
    dw $0003,$0000 
    db $06 
    dw $6B80,$01F8 
    db $06 
    dw $2B80,$81F8 
    db $F2 
    dw $2B2E 
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemaps_Torizo_3D:
    dw $0016,$000D 
    db $28 
    dw $6362,$0015 
    db $28 
    dw $6361,$001D 
    db $28 
    dw $6360,$81F9 
    db $FE 
    dw $63A9,$0001 
    db $0E 
    dw $63BB,$0009 
    db $0E 
    dw $63AF,$8001 
    db $FE 
    dw $63A8,$0009 
    db $22 
    dw $6394,$0011 
    db $22 
    dw $6393,$8009 
    db $12 
    dw $6373,$01FC 
    db $0D 
    dw $25AE,$01F4 
    db $0D 
    dw $25AD,$81F4 
    db $FD 
    dw $25A6,$81E3 
    db $16 
    dw $658A,$81EB 
    db $0E 
    dw $6579,$81DD 
    db $1F 
    dw $65A0,$81F2 
    db $F9 
    dw $6342,$8002 
    db $F9 
    dw $6340,$81F2 
    db $E9 
    dw $6322,$8002 
    db $E9 
    dw $6320,$81F2 
    db $D9 
    dw $6302,$8002 
    db $D9 
    dw $6300 

Spritemaps_Torizo_3E:
    dw $0015,$01FD 
    db $0F 
    dw $63AE,$0005 
    db $0F 
    dw $63AD,$81FD 
    db $FF 
    dw $63A6,$0008 
    db $28 
    dw $6362,$0010 
    db $28 
    dw $6361,$0018 
    db $28 
    dw $6360,$0004 
    db $23 
    dw $6394,$000C 
    db $23 
    dw $6393,$8004 
    db $13 
    dw $6373,$81E7 
    db $1E 
    dw $65A0,$01F9 
    db $10 
    dw $65AC,$0001 
    db $10 
    dw $65AB,$81F9 
    db $00 
    dw $65A4,$81EB 
    db $18 
    dw $658A,$81F3 
    db $10 
    dw $6579,$81F2 
    db $F8 
    dw $6342,$8002 
    db $F8 
    dw $6340,$81F2 
    db $E8 
    dw $6322,$8002 
    db $E8 
    dw $6320,$81F2 
    db $D8 
    dw $6302,$8002 
    db $D8 
    dw $6300 

Spritemaps_Torizo_3F:
    dw $0015,$01F7 
    db $0F 
    dw $63AC,$01FF 
    db $0F 
    dw $63AB,$81F7 
    db $FF 
    dw $63A4,$01F5 
    db $28 
    dw $6362,$01FD 
    db $28 
    dw $6361,$0005 
    db $28 
    dw $6360,$01F6 
    db $21 
    dw $6396,$01FE 
    db $21 
    dw $6395,$81F6 
    db $11 
    dw $6375,$01FD 
    db $0E 
    dw $65AE,$0005 
    db $0E 
    dw $65AD,$81FD 
    db $FE 
    dw $65A6,$81F3 
    db $15 
    dw $658A,$81FB 
    db $0D 
    dw $6579,$81F1 
    db $1F 
    dw $65A2,$81F2 
    db $F7 
    dw $6342,$8002 
    db $F7 
    dw $6340,$81F2 
    db $E7 
    dw $6322,$8002 
    db $E7 
    dw $6320,$81F2 
    db $D7 
    dw $6302,$8002 
    db $D7 
    dw $6300 

Spritemaps_Torizo_40:
    dw $0016,$01FC 
    db $0E 
    dw $23AE,$01F4 
    db $0E 
    dw $23AD,$81F4 
    db $FE 
    dw $23A6,$01E5 
    db $28 
    dw $6362,$01ED 
    db $28 
    dw $6361,$01F5 
    db $28 
    dw $6360,$01EB 
    db $22 
    dw $6398,$01F3 
    db $22 
    dw $6397,$81EB 
    db $12 
    dw $6377,$81FA 
    db $FC 
    dw $65A9,$0002 
    db $0C 
    dw $65BB,$000A 
    db $0C 
    dw $65AF,$8002 
    db $FC 
    dw $65A8,$81FE 
    db $1F 
    dw $65A2,$0009 
    db $1F 
    dw $6597,$8001 
    db $0F 
    dw $6577,$81F2 
    db $F8 
    dw $6342,$8002 
    db $F8 
    dw $6340,$81F2 
    db $E8 
    dw $6322,$8002 
    db $E8 
    dw $6320,$81F2 
    db $D8 
    dw $6302,$8002 
    db $D8 
    dw $6300 

Spritemaps_Torizo_41:
    dw $0016,$01FC 
    db $0E 
    dw $23AE,$01F4 
    db $0E 
    dw $23AD,$81F4 
    db $FE 
    dw $23A6,$81E3 
    db $17 
    dw $638A,$81EB 
    db $0F 
    dw $6379,$81DD 
    db $20 
    dw $63A0,$000D 
    db $28 
    dw $6562,$0015 
    db $28 
    dw $6561,$001D 
    db $28 
    dw $6560,$81F9 
    db $FE 
    dw $65A9,$0001 
    db $0E 
    dw $65BB,$0009 
    db $0E 
    dw $65AF,$8001 
    db $FE 
    dw $65A8,$0009 
    db $22 
    dw $6594,$0011 
    db $22 
    dw $6593,$8009 
    db $12 
    dw $6573,$81F2 
    db $F9 
    dw $6342,$8002 
    db $F9 
    dw $6340,$81F2 
    db $E9 
    dw $6322,$8002 
    db $E9 
    dw $6320,$81F2 
    db $D9 
    dw $6302,$8002 
    db $D9 
    dw $6300 

Spritemaps_Torizo_42:
    dw $0015,$81E6 
    db $1D 
    dw $63A0,$01F8 
    db $0F 
    dw $63AC,$0000 
    db $0F 
    dw $63AB,$81F8 
    db $FF 
    dw $63A4,$81EA 
    db $17 
    dw $638A,$81F2 
    db $0F 
    dw $6379,$01FB 
    db $0F 
    dw $65AE,$0003 
    db $0F 
    dw $65AD,$81FB 
    db $FF 
    dw $65A6,$0006 
    db $28 
    dw $6562,$000E 
    db $28 
    dw $6561,$0016 
    db $28 
    dw $6560,$0002 
    db $23 
    dw $6594,$000A 
    db $23 
    dw $6593,$8002 
    db $13 
    dw $6573,$81F2 
    db $F8 
    dw $6342,$8002 
    db $F8 
    dw $6340,$81F2 
    db $E8 
    dw $6322,$8002 
    db $E8 
    dw $6320,$81F2 
    db $D8 
    dw $6302,$8002 
    db $D8 
    dw $6300 

Spritemaps_Torizo_43:
    dw $0015,$01FD 
    db $0E 
    dw $63AE,$0005 
    db $0E 
    dw $63AD,$81FD 
    db $FE 
    dw $63A6,$81F3 
    db $15 
    dw $638A,$81FB 
    db $0D 
    dw $6379,$81F1 
    db $1F 
    dw $63A2,$01F7 
    db $0F 
    dw $65AC,$01FF 
    db $0F 
    dw $65AB,$81F7 
    db $FF 
    dw $65A4,$01F5 
    db $28 
    dw $6562,$01FD 
    db $28 
    dw $6561,$0005 
    db $28 
    dw $6560,$01F6 
    db $21 
    dw $6596,$01FE 
    db $21 
    dw $6595,$81F6 
    db $11 
    dw $6575,$81F2 
    db $F7 
    dw $6342,$8002 
    db $F7 
    dw $6340,$81F2 
    db $E7 
    dw $6322,$8002 
    db $E7 
    dw $6320,$81F2 
    db $D7 
    dw $6302,$8002 
    db $D7 
    dw $6300 

Spritemaps_Torizo_44:
    dw $0016,$81F9 
    db $FC 
    dw $63A9,$0001 
    db $0C 
    dw $63BB,$0009 
    db $0C 
    dw $63AF,$8001 
    db $FC 
    dw $63A8,$81FD 
    db $1F 
    dw $63A2,$0008 
    db $1F 
    dw $6397,$8000 
    db $0F 
    dw $6377,$01FA 
    db $0E 
    dw $25AE,$01F2 
    db $0E 
    dw $25AD,$81F2 
    db $FE 
    dw $25A6,$01E3 
    db $28 
    dw $6562,$01EB 
    db $28 
    dw $6561,$01F3 
    db $28 
    dw $6560,$01E9 
    db $22 
    dw $6598,$01F1 
    db $22 
    dw $6597,$81E9 
    db $12 
    dw $6577,$81F2 
    db $F8 
    dw $6342,$8002 
    db $F8 
    dw $6340,$81F2 
    db $E8 
    dw $6322,$8002 
    db $E8 
    dw $6320,$81F2 
    db $D8 
    dw $6302,$8002 
    db $D8 
    dw $6300 

Spritemaps_Torizo_45:
    dw $0007,$01E8 
    db $25 
    dw $237B,$01E8 
    db $1D 
    dw $236B,$81EB 
    db $FB 
    dw $630C,$01E8 
    db $16 
    dw $6364,$01E8 
    db $0E 
    dw $6354,$01E8 
    db $06 
    dw $6344,$81F8 
    db $F8 
    dw $232A 

Spritemaps_Torizo_46:
    dw $0005,$81F6 
    db $23 
    dw $636C,$81EF 
    db $02 
    dw $630A,$01F6 
    db $1F 
    dw $2366,$81EE 
    db $0F 
    dw $2345,$81F8 
    db $F8 
    dw $6324 

Spritemaps_Torizo_47:
    dw $0005,$8000 
    db $28 
    dw $636C,$01FF 
    db $24 
    dw $2366,$81F7 
    db $14 
    dw $2345,$81F4 
    db $05 
    dw $6308,$81F8 
    db $F8 
    dw $2328 

Spritemaps_Torizo_48:
    dw $0005,$8009 
    db $24 
    dw $636C,$81F8 
    db $06 
    dw $6306,$8004 
    db $1B 
    dw $2358,$81FC 
    db $13 
    dw $2347,$81F8 
    db $F8 
    dw $6326 

Spritemaps_Torizo_49:
    dw $0005,$8012 
    db $19 
    dw $636C,$81FC 
    db $05 
    dw $2308,$0014 
    db $16 
    dw $235C,$8004 
    db $0E 
    dw $234A,$81F8 
    db $F8 
    dw $6328 

Spritemaps_Torizo_4A:
    dw $0007,$8001 
    db $02 
    dw $230A,$002A 
    db $0B 
    dw $238F,$0022 
    db $0B 
    dw $238E,$001E 
    db $0B 
    dw $234F,$0016 
    db $0B 
    dw $234E,$000E 
    db $0B 
    dw $234D,$81F8 
    db $F8 
    dw $2324 

Spritemaps_Torizo_4B:
    dw $0005,$801C 
    db $F6 
    dw $A36E,$8001 
    db $02 
    dw $230A,$8015 
    db $FA 
    dw $A358,$800D 
    db $02 
    dw $A347,$81F8 
    db $F8 
    dw $2324 

Spritemaps_Torizo_4C:
    dw $0007,$0012 
    db $DD 
    dw $E37B,$0012 
    db $E5 
    dw $E36B,$8006 
    db $F8 
    dw $230E,$0012 
    db $EB 
    dw $A364,$0012 
    db $F3 
    dw $A354,$0012 
    db $FB 
    dw $A344,$81F8 
    db $F8 
    dw $632A 

Spritemaps_Torizo_4D:
    dw $0007,$01E9 
    db $25 
    dw $257B,$01E9 
    db $1D 
    dw $256B,$81EB 
    db $FB 
    dw $650C,$01E8 
    db $16 
    dw $6564,$01E8 
    db $0E 
    dw $6554,$01E8 
    db $06 
    dw $6544,$81F8 
    db $F8 
    dw $252A 

Spritemaps_Torizo_4E:
    dw $0005,$81F6 
    db $23 
    dw $656C,$81EF 
    db $02 
    dw $650A,$01F6 
    db $1F 
    dw $2566,$81EE 
    db $0F 
    dw $2545,$81F8 
    db $F8 
    dw $6524 

Spritemaps_Torizo_4F:
    dw $0005,$8000 
    db $28 
    dw $656C,$01FF 
    db $24 
    dw $2566,$81F7 
    db $14 
    dw $2545,$81F4 
    db $05 
    dw $6508,$81F8 
    db $F8 
    dw $2528 

Spritemaps_Torizo_50:
    dw $0005,$800A 
    db $23 
    dw $656C,$81F8 
    db $06 
    dw $6506,$8004 
    db $1B 
    dw $2558,$81FC 
    db $13 
    dw $2547,$81F8 
    db $F8 
    dw $6526 

Spritemaps_Torizo_51:
    dw $0005,$8014 
    db $19 
    dw $656C,$81FC 
    db $05 
    dw $2508,$0014 
    db $16 
    dw $255C,$8004 
    db $0E 
    dw $254A,$81F8 
    db $F8 
    dw $6528 

Spritemaps_Torizo_52:
    dw $0007,$8001 
    db $02 
    dw $250A,$002D 
    db $0B 
    dw $258F,$0025 
    db $0B 
    dw $258E,$001E 
    db $0B 
    dw $254F,$0016 
    db $0B 
    dw $254E,$000E 
    db $0B 
    dw $254D,$81F8 
    db $F8 
    dw $2524 

Spritemaps_Torizo_53:
    dw $0005,$801D 
    db $F4 
    dw $A56E,$8001 
    db $02 
    dw $250A,$8015 
    db $FA 
    dw $A558,$800D 
    db $02 
    dw $A547,$81F8 
    db $F8 
    dw $2524 

Spritemaps_Torizo_54:
    dw $0007,$0012 
    db $DD 
    dw $E57B,$0012 
    db $E5 
    dw $E56B,$8006 
    db $F8 
    dw $250E,$0012 
    db $EB 
    dw $A564,$0012 
    db $F3 
    dw $A554,$0012 
    db $FB 
    dw $A544,$81F8 
    db $F8 
    dw $652A 

Spritemaps_Torizo_55:
    dw $0018,$8002 
    db $F3 
    dw $6330,$81F7 
    db $FD 
    dw $63A9,$01FF 
    db $0D 
    dw $63BB,$0007 
    db $0D 
    dw $63AF,$81FF 
    db $FD 
    dw $63A8,$81F6 
    db $15 
    dw $638A,$81FE 
    db $0D 
    dw $6379,$01F3 
    db $20 
    dw $6362,$01FB 
    db $20 
    dw $6361,$0003 
    db $20 
    dw $6360,$81FB 
    db $FD 
    dw $65A9,$0003 
    db $0D 
    dw $65BB,$000B 
    db $0D 
    dw $65AF,$8003 
    db $FD 
    dw $65A8,$81FA 
    db $15 
    dw $658A,$8002 
    db $0D 
    dw $6579,$01F7 
    db $20 
    dw $6562,$01FF 
    db $20 
    dw $6561,$0007 
    db $20 
    dw $6560,$8002 
    db $E3 
    dw $6310,$81F2 
    db $FB 
    dw $6342,$81F2 
    db $EB 
    dw $6322,$81F2 
    db $DB 
    dw $6302,$8002 
    db $DB 
    dw $6300 

Spritemaps_Torizo_56:
    dw $0013,$8002 
    db $F2 
    dw $6330,$01FC 
    db $0F 
    dw $63AE,$0004 
    db $0F 
    dw $63AD,$81FC 
    db $FF 
    dw $63A6,$81EE 
    db $22 
    dw $63A0,$81F3 
    db $19 
    dw $638A,$81FB 
    db $11 
    dw $6379,$8002 
    db $FA 
    dw $6340,$8002 
    db $E2 
    dw $6310,$81F2 
    db $FA 
    dw $6342,$81F2 
    db $EA 
    dw $6322,$81F2 
    db $DA 
    dw $6302,$8002 
    db $DA 
    dw $6300,$0000 
    db $10 
    dw $25AC,$01F8 
    db $10 
    dw $25AB,$81F8 
    db $00 
    dw $25A4,$81E7 
    db $24 
    dw $65A0,$81EC 
    db $1B 
    dw $658A,$81F4 
    db $13 
    dw $6579 

Spritemaps_Torizo_57:
    dw $0015,$8002 
    db $F2 
    dw $6330,$81ED 
    db $27 
    dw $63A2,$81EA 
    db $27 
    dw $63A2,$0000 
    db $10 
    dw $63AB,$01F8 
    db $10 
    dw $63AC,$81F8 
    db $00 
    dw $63A4,$81F3 
    db $13 
    dw $6377,$01F3 
    db $23 
    dw $6398,$01FB 
    db $23 
    dw $6397,$01FD 
    db $10 
    dw $65AB,$01F5 
    db $10 
    dw $65AC,$81F5 
    db $00 
    dw $65A4,$81F0 
    db $13 
    dw $6577,$01F0 
    db $23 
    dw $6598,$01F8 
    db $23 
    dw $6597,$8002 
    db $FA 
    dw $6340,$8002 
    db $E2 
    dw $6310,$81F2 
    db $FA 
    dw $6342,$81F2 
    db $EA 
    dw $6322,$81F2 
    db $DA 
    dw $6302,$8002 
    db $DA 
    dw $6300 

Spritemaps_Torizo_58:
    dw $0018,$01DE 
    db $28 
    dw $6562,$01E6 
    db $28 
    dw $6561,$01EE 
    db $28 
    dw $6560,$000D 
    db $28 
    dw $6362,$0015 
    db $28 
    dw $6361,$001D 
    db $28 
    dw $6360,$81F9 
    db $FE 
    dw $63A9,$0001 
    db $0E 
    dw $63BB,$0009 
    db $0E 
    dw $63AF,$8001 
    db $FE 
    dw $63A8,$0009 
    db $22 
    dw $6394,$0011 
    db $22 
    dw $6393,$8009 
    db $12 
    dw $6373,$01FB 
    db $10 
    dw $25AE,$01F3 
    db $10 
    dw $25AD,$81F3 
    db $00 
    dw $25A6,$81E1 
    db $1C 
    dw $658A,$81E9 
    db $14 
    dw $6579,$81F2 
    db $F9 
    dw $6342,$8002 
    db $F9 
    dw $6340,$81F2 
    db $E9 
    dw $6322,$8002 
    db $E9 
    dw $6320,$81F2 
    db $D9 
    dw $6302,$8002 
    db $D9 
    dw $6300 

Spritemaps_Torizo_59:
    dw $0018,$01DE 
    db $28 
    dw $6362,$01E6 
    db $28 
    dw $6361,$01EE 
    db $28 
    dw $6360,$01FB 
    db $10 
    dw $23AE,$01F3 
    db $10 
    dw $23AD,$81F3 
    db $00 
    dw $23A6,$81E1 
    db $1C 
    dw $638A,$81E9 
    db $14 
    dw $6379,$000D 
    db $28 
    dw $6562,$0015 
    db $28 
    dw $6561,$001D 
    db $28 
    dw $6560,$81F9 
    db $FE 
    dw $65A9,$0001 
    db $0E 
    dw $65BB,$0009 
    db $0E 
    dw $65AF,$8001 
    db $FE 
    dw $65A8,$0009 
    db $22 
    dw $6594,$0011 
    db $22 
    dw $6593,$8009 
    db $12 
    dw $6573,$81F2 
    db $F9 
    dw $6342,$8002 
    db $F9 
    dw $6340,$81F2 
    db $E9 
    dw $6322,$8002 
    db $E9 
    dw $6320,$81F2 
    db $D9 
    dw $6302,$8002 
    db $D9 
    dw $6300 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemaps_Torizo_AAA4C6:
    dw $0006,$81F0 
    db $0C 
    dw $6342,$8000 
    db $0C 
    dw $6340,$81F0 
    db $FC 
    dw $6322,$8000 
    db $FC 
    dw $6320,$81F0 
    db $EC 
    dw $6302,$8000 
    db $EC 
    dw $6300 

UNUSED_ExtendedSpritemaps_Torizo_AAA4E6:
    dw $0001,$0000,$0000 
    dw Spritemaps_Torizo_7 
    dw UNUSED_Hitboxes_Torizo_AA87DA 
endif ; !FEATURE_KEEP_UNREFERENCED

ExtendedSpritemaps_Torizo_FacingScreen_Turning_Dodging:
    dw $0001,$0000,$0000 
    dw Spritemaps_Torizo_6 
    dw Hitboxes_Torizo_Blank 

ExtendedSpritemaps_Torizo_WalkingLeft_RightLegMoving_0:
    dw $0004,$FFF1,$FFE2 
    dw Spritemaps_Torizo_0 
    dw Hitboxes_Torizo_Blank 
    dw $FFFB,$FFE8 
    dw Spritemaps_Torizo_1B 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_8 
    dw $0000,$0000 
    dw Spritemaps_Torizo_2E 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17 
    dw $FFFB,$FFE8 
    dw Spritemaps_Torizo_27 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_12 

ExtendedSpritemaps_Torizo_WalkingLeft_RightLegMoving_1:
    dw $0004,$FFF1,$FFE2 
    dw Spritemaps_Torizo_0 
    dw Hitboxes_Torizo_Blank 
    dw $FFFB,$FFE7 
    dw Spritemaps_Torizo_1C 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_8 
    dw $0000,$0000 
    dw Spritemaps_Torizo_13 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_7 
    dw $FFFB,$FFE7 
    dw Spritemaps_Torizo_26 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_11 

ExtendedSpritemaps_Torizo_WalkingLeft_RightLegMoving_2:
    dw $0004,$FFF1,$FFE1 
    dw Spritemaps_Torizo_0 
    dw Hitboxes_Torizo_Blank 
    dw $FFFB,$FFE6 
    dw Spritemaps_Torizo_1D 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_9 
    dw $0000,$0000 
    dw Spritemaps_Torizo_14 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_7 
    dw $FFFB,$FFE6 
    dw Spritemaps_Torizo_25 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_10 

ExtendedSpritemaps_Torizo_WalkingLeft_RightLegMoving_3:
    dw $0004,$FFF1,$FFE0 
    dw Spritemaps_Torizo_0 
    dw Hitboxes_Torizo_Blank 
    dw $FFFB,$FFE7 
    dw Spritemaps_Torizo_1E 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_A 
    dw $0000,$0000 
    dw Spritemaps_Torizo_15 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_7 
    dw $FFFB,$FFE7 
    dw Spritemaps_Torizo_24 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_F 

ExtendedSpritemaps_Torizo_WalkingLeft_RightLegMoving_4:
    dw $0004,$FFF1,$FFE0 
    dw Spritemaps_Torizo_0 
    dw Hitboxes_Torizo_Blank 
    dw $FFFB,$FFE8 
    dw Spritemaps_Torizo_1F 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_B 
    dw $0000,$0000 
    dw Spritemaps_Torizo_16 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_7 
    dw $FFFB,$FFE8 
    dw Spritemaps_Torizo_23 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_F 

ExtendedSpritemaps_Torizo_WalkingLeft_LeftLegMoving_0:
    dw $0004,$FFF1,$FFE2 
    dw Spritemaps_Torizo_0 
    dw Hitboxes_Torizo_Blank 
    dw $FFFB,$FFE8 
    dw Spritemaps_Torizo_1F 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_B 
    dw $0000,$0000 
    dw Spritemaps_Torizo_2F 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17 
    dw $FFFB,$FFE8 
    dw Spritemaps_Torizo_23 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_F 

ExtendedSpritemaps_Torizo_WalkingLeft_LeftLegMoving_1:
    dw $0004,$FFF1,$FFE1 
    dw Spritemaps_Torizo_0 
    dw Hitboxes_Torizo_Blank 
    dw $FFFB,$FFE7 
    dw Spritemaps_Torizo_1E 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_A 
    dw $0000,$0000 
    dw Spritemaps_Torizo_17 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_7 
    dw $FFFB,$FFE7 
    dw Spritemaps_Torizo_24 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_F 

ExtendedSpritemaps_Torizo_WalkingLeft_LeftLegMoving_2:
    dw $0004,$FFF1,$FFE1 
    dw Spritemaps_Torizo_0 
    dw Hitboxes_Torizo_Blank 
    dw $FFFB,$FFE6 
    dw Spritemaps_Torizo_1D 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_9 
    dw $0000,$0000 
    dw Spritemaps_Torizo_18 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_7 
    dw $FFFB,$FFE6 
    dw Spritemaps_Torizo_25 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_10 

ExtendedSpritemaps_Torizo_WalkingLeft_LeftLegMoving_3:
    dw $0004,$FFF1,$FFE0 
    dw Spritemaps_Torizo_0 
    dw Hitboxes_Torizo_Blank 
    dw $FFFB,$FFE7 
    dw Spritemaps_Torizo_1C 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_8 
    dw $0000,$0000 
    dw Spritemaps_Torizo_19 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_7 
    dw $FFFB,$FFE7 
    dw Spritemaps_Torizo_26 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_11 

ExtendedSpritemaps_Torizo_WalkingLeft_LeftLegMoving_4:
    dw $0004,$FFF1,$FFE1 
    dw Spritemaps_Torizo_0 
    dw Hitboxes_Torizo_Blank 
    dw $FFFB,$FFE8 
    dw Spritemaps_Torizo_1B 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_8 
    dw $0000,$0000 
    dw Spritemaps_Torizo_1A 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_7 
    dw $FFFB,$FFE8 
    dw Spritemaps_Torizo_27 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_12 

ExtendedSpritemaps_Torizo_Attacks_FaceLeft_RightFootForward:
    dw $0003,$FFF1,$FFE1 
    dw Spritemaps_Torizo_0 
    dw Hitboxes_Torizo_Blank 
    dw $FFFC,$FFE7 
    dw Spritemaps_Torizo_1D 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_9 
    dw $0000,$0000 
    dw Spritemaps_Torizo_2F 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17 

ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_RightFootForward_0:
    dw $0003,$FFF7,$FFE1 
    dw Spritemaps_Torizo_1 
    dw Hitboxes_Torizo_Blank 
    dw $FFFC,$FFE7 
    dw Spritemaps_Torizo_1E 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_A 
    dw $0000,$0000 
    dw Spritemaps_Torizo_2F 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17 

ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_RightFootForward_1:
    dw $0003,$FFF7,$FFE1 
    dw Spritemaps_Torizo_2 
    dw Hitboxes_Torizo_Blank 
    dw $FFFC,$FFE7 
    dw Spritemaps_Torizo_1F 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_B 
    dw $0000,$0000 
    dw Spritemaps_Torizo_2F 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17 

ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_RightFootForward_2:
    dw $0003,$FFF7,$FFE1 
    dw Spritemaps_Torizo_3 
    dw Hitboxes_Torizo_Blank 
    dw $FFFC,$FFE7 
    dw Spritemaps_Torizo_20 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_C 
    dw $0000,$0000 
    dw Spritemaps_Torizo_2F 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17 

ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_RightFootForward_3:
    dw $0003,$FFFC,$FFE7 
    dw Spritemaps_Torizo_21 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_D 
    dw $FFF7,$FFE1 
    dw Spritemaps_Torizo_4 
    dw Hitboxes_Torizo_Blank 
    dw $0000,$0000 
    dw Spritemaps_Torizo_2F 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17 

ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_RightFootForward_4:
    dw $0003,$FFFC,$FFE7 
    dw Spritemaps_Torizo_21 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_D 
    dw $FFF7,$FFE1 
    dw Spritemaps_Torizo_5 
    dw Hitboxes_Torizo_Blank 
    dw $0000,$0000 
    dw Spritemaps_Torizo_2F 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17 

ExtendedSpritemaps_Torizo_Attacks_FaceLeft_LeftFootForward:
    dw $0003,$FFF1,$FFE1 
    dw Spritemaps_Torizo_0 
    dw Hitboxes_Torizo_Blank 
    dw $FFFC,$FFE7 
    dw Spritemaps_Torizo_1C 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_8 
    dw $0000,$0000 
    dw Spritemaps_Torizo_2E 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17 

ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_LeftFootForward_0:
    dw $0003,$FFF7,$FFE1 
    dw Spritemaps_Torizo_1 
    dw Hitboxes_Torizo_Blank 
    dw $FFFC,$FFE7 
    dw Spritemaps_Torizo_1E 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_A 
    dw $0000,$0000 
    dw Spritemaps_Torizo_2E 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17 

ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_LeftFootForward_1:
    dw $0003,$FFF7,$FFE1 
    dw Spritemaps_Torizo_2 
    dw Hitboxes_Torizo_Blank 
    dw $FFFC,$FFE7 
    dw Spritemaps_Torizo_1F 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_B 
    dw $0000,$0000 
    dw Spritemaps_Torizo_2E 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17 

ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_LeftFootForward_2:
    dw $0003,$FFF7,$FFE1 
    dw Spritemaps_Torizo_3 
    dw Hitboxes_Torizo_Blank 
    dw $FFFC,$FFE7 
    dw Spritemaps_Torizo_20 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_C 
    dw $0000,$0000 
    dw Spritemaps_Torizo_2E 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17 

ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_LeftFootForward_3:
    dw $0003,$FFFC,$FFE7 
    dw Spritemaps_Torizo_21 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_D 
    dw $FFF7,$FFE1 
    dw Spritemaps_Torizo_4 
    dw Hitboxes_Torizo_Blank 
    dw $0000,$0000 
    dw Spritemaps_Torizo_2E 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17 

ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_LeftFootForward_4:
    dw $0003,$FFFC,$FFE7 
    dw Spritemaps_Torizo_21 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_D 
    dw $FFF7,$FFE1 
    dw Spritemaps_Torizo_5 
    dw Hitboxes_Torizo_Blank 
    dw $0000,$0000 
    dw Spritemaps_Torizo_2E 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17 

ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_0:
    dw $0003,$FFF1,$FFE1 
    dw Spritemaps_Torizo_0 
    dw Hitboxes_Torizo_Blank 
    dw $FFFC,$FFE7 
    dw Spritemaps_Torizo_1E 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_A 
    dw $0000,$0000 
    dw Spritemaps_Torizo_2F 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17 

ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_1:
    dw $0004,$FFF1,$FFE1 
    dw Spritemaps_Torizo_0 
    dw Hitboxes_Torizo_Blank 
    dw $FFFC,$FFE7 
    dw Spritemaps_Torizo_1E 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_A 
    dw $0000,$0000 
    dw Spritemaps_Torizo_2F 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17 
    dw $FFFC,$FFE7 
    dw Spritemaps_Torizo_27 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_12 

ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_2:
    dw $0004,$FFFC,$FFE7 
    dw Spritemaps_Torizo_1E 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_A 
    dw $FFF1,$FFE1 
    dw Spritemaps_Torizo_0 
    dw Hitboxes_Torizo_Blank 
    dw $0000,$0000 
    dw Spritemaps_Torizo_2F 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17 
    dw $FFFC,$FFE7 
    dw Spritemaps_Torizo_28 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_13 

ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_3:
    dw $0004,$FFFC,$FFE7 
    dw Spritemaps_Torizo_1E 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_A 
    dw $FFF1,$FFE1 
    dw Spritemaps_Torizo_0 
    dw Hitboxes_Torizo_Blank 
    dw $0000,$0000 
    dw Spritemaps_Torizo_2F 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17 
    dw $FFFC,$FFE7 
    dw Spritemaps_Torizo_29 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_14 

ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_4:
    dw $0004,$FFFC,$FFE7 
    dw Spritemaps_Torizo_1E 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_A 
    dw $FFF1,$FFE1 
    dw Spritemaps_Torizo_0 
    dw Hitboxes_Torizo_Blank 
    dw $0000,$0000 
    dw Spritemaps_Torizo_2F 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17 
    dw $FFFC,$FFE7 
    dw Spritemaps_Torizo_2A 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_15 

ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_5:
    dw $0004,$FFF1,$FFE1 
    dw Spritemaps_Torizo_0 
    dw Hitboxes_Torizo_Blank 
    dw $FFFC,$FFE7 
    dw Spritemaps_Torizo_1E 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_A 
    dw $0000,$0000 
    dw Spritemaps_Torizo_2F 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17 
    dw $FFFC,$FFE7 
    dw Spritemaps_Torizo_24 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_F 

ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_RightFootForward_0:
    dw $0004,$FFF1,$FFE1 
    dw Spritemaps_Torizo_0 
    dw Hitboxes_Torizo_Blank 
    dw $FFFC,$FFE7 
    dw Spritemaps_Torizo_1F 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_B 
    dw $0000,$0000 
    dw Spritemaps_Torizo_2F 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17 
    dw $FFFC,$FFE7 
    dw Spritemaps_Torizo_24 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_F 

ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_RightFootForward_1:
    dw $0004,$FFF1,$FFE1 
    dw Spritemaps_Torizo_0 
    dw Hitboxes_Torizo_Blank 
    dw $FFFC,$FFE7 
    dw Spritemaps_Torizo_20 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_C 
    dw $0000,$0000 
    dw Spritemaps_Torizo_2F 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17 
    dw $FFFC,$FFE7 
    dw Spritemaps_Torizo_24 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_F 

ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_RightFootForward_2:
    dw $0004,$FFFC,$FFE7 
    dw Spritemaps_Torizo_21 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_D 
    dw $FFF1,$FFE1 
    dw Spritemaps_Torizo_0 
    dw Hitboxes_Torizo_Blank 
    dw $0000,$0000 
    dw Spritemaps_Torizo_2F 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17 
    dw $FFFC,$FFE7 
    dw Spritemaps_Torizo_24 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_F 

ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_RightFootForward_3:
    dw $0004,$FFFC,$FFE7 
    dw Spritemaps_Torizo_22 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_E 
    dw $FFF1,$FFE1 
    dw Spritemaps_Torizo_0 
    dw Hitboxes_Torizo_Blank 
    dw $0000,$0000 
    dw Spritemaps_Torizo_2F 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17 
    dw $FFFC,$FFE7 
    dw Spritemaps_Torizo_24 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_F 

ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_0:
    dw $0003,$FFF1,$FFE1 
    dw Spritemaps_Torizo_0 
    dw Hitboxes_Torizo_Blank 
    dw $FFFC,$FFE7 
    dw Spritemaps_Torizo_1E 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_A 
    dw $0000,$0000 
    dw Spritemaps_Torizo_2E 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17 

ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_1:
    dw $0003,$FFF1,$FFE1 
    dw Spritemaps_Torizo_0 
    dw Hitboxes_Torizo_Blank 
    dw $FFFC,$FFE7 
    dw Spritemaps_Torizo_1F 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_B 
    dw $0000,$0000 
    dw Spritemaps_Torizo_2E 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17 

ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_2:
    dw $0003,$FFFC,$FFE7 
    dw Spritemaps_Torizo_20 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_C 
    dw $FFF1,$FFE1 
    dw Spritemaps_Torizo_0 
    dw Hitboxes_Torizo_Blank 
    dw $0000,$0000 
    dw Spritemaps_Torizo_2E 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17 

ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_3:
    dw $0003,$FFFC,$FFE7 
    dw Spritemaps_Torizo_21 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_D 
    dw $FFF1,$FFE1 
    dw Spritemaps_Torizo_0 
    dw Hitboxes_Torizo_Blank 
    dw $0000,$0000 
    dw Spritemaps_Torizo_2E 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17 

ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_4:
    dw $0003,$FFFC,$FFE7 
    dw Spritemaps_Torizo_22 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_E 
    dw $FFF1,$FFE1 
    dw Spritemaps_Torizo_0 
    dw Hitboxes_Torizo_Blank 
    dw $0000,$0000 
    dw Spritemaps_Torizo_2E 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17 

ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_5:
    dw $0004,$FFF1,$FFE1 
    dw Spritemaps_Torizo_0 
    dw Hitboxes_Torizo_Blank 
    dw $FFFC,$FFE7 
    dw Spritemaps_Torizo_1D 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_9 
    dw $0000,$0000 
    dw Spritemaps_Torizo_2E 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17 
    dw $FFFC,$FFE7 
    dw Spritemaps_Torizo_26 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_11 

ExtSpritemap_Torizo_SonicBoom_Swipe_FaceLeft_LeftFootFwd_0:
    dw $0004,$FFF1,$FFE1 
    dw Spritemaps_Torizo_0 
    dw Hitboxes_Torizo_Blank 
    dw $FFFC,$FFE7 
    dw Spritemaps_Torizo_1D 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_9 
    dw $0000,$0000 
    dw Spritemaps_Torizo_2E 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17 
    dw $FFFC,$FFE7 
    dw Spritemaps_Torizo_27 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_12 

ExtSpritemap_Torizo_SonicBoom_Swipe_FaceLeft_LeftFootFwd_1:
    dw $0004,$FFF1,$FFE1 
    dw Spritemaps_Torizo_0 
    dw Hitboxes_Torizo_Blank 
    dw $FFFC,$FFE7 
    dw Spritemaps_Torizo_1D 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_9 
    dw $0000,$0000 
    dw Spritemaps_Torizo_2E 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17 
    dw $FFFC,$FFE7 
    dw Spritemaps_Torizo_28 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_13 

ExtSpritemap_Torizo_SonicBoom_Swipe_FaceLeft_LeftFootFwd_2:
    dw $0004,$FFFC,$FFE7 
    dw Spritemaps_Torizo_1D 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_9 
    dw $FFF1,$FFE1 
    dw Spritemaps_Torizo_0 
    dw Hitboxes_Torizo_Blank 
    dw $0000,$0000 
    dw Spritemaps_Torizo_2E 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17 
    dw $FFFC,$FFE7 
    dw Spritemaps_Torizo_29 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_14 

ExtSpritemap_Torizo_SonicBoom_Swipe_FaceLeft_LeftFootFwd_3:
    dw $0004,$FFFC,$FFE7 
    dw Spritemaps_Torizo_1D 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_9 
    dw $FFF1,$FFE1 
    dw Spritemaps_Torizo_0 
    dw Hitboxes_Torizo_Blank 
    dw $0000,$0000 
    dw Spritemaps_Torizo_2E 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17 
    dw $FFFC,$FFE7 
    dw Spritemaps_Torizo_2A 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_15 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ExtendedSpritemaps_Torizo_AAA9FE:
    dw $0001,$0000,$0008 
    dw Spritemaps_Torizo_6 
    dw UNUSED_Hitboxes_Torizo_AA87DA 

UNUSED_ExtendedSpritemaps_Torizo_AAAA08:
    dw $0001,$0000,$0008 
    dw Spritemaps_Torizo_7 
    dw UNUSED_Hitboxes_Torizo_AA87DA 
endif ; !FEATURE_KEEP_UNREFERENCED

ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_0:
    dw $0001,$0000,$0000 
    dw Spritemaps_Torizo_C 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_0 

ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_1:
    dw $0001,$0000,$0000 
    dw Spritemaps_Torizo_D 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_1 

ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_2:
    dw $0001,$0000,$0000 
    dw Spritemaps_Torizo_E 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_2 

ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_3:
    dw $0001,$0000,$0000 
    dw Spritemaps_Torizo_E_miscount 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_3 

ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_4:
    dw $0002,$FFFB,$FFE8 
    dw Spritemaps_Torizo_1D 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_9 
    dw $0000,$0000 
    dw Spritemaps_Torizo_F 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_4 

ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_5:
    dw $0002,$FFFB,$FFE8 
    dw Spritemaps_Torizo_1E 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_A 
    dw $0000,$0000 
    dw Spritemaps_Torizo_10 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_5 

ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_6:
    dw $0002,$FFFB,$FFE8 
    dw Spritemaps_Torizo_1E 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_A 
    dw $0000,$0000 
    dw Spritemaps_Torizo_12 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_6 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ExtendedSpritemaps_Torizo_AAAA70:
    dw $0001,$0000,$0000 
    dw Spritemaps_Torizo_8 
    dw Hitboxes_Torizo_Blank 

UNUSED_ExtendedSpritemaps_Torizo_AAAA7A:
    dw $0001,$0000,$0000 
    dw Spritemaps_Torizo_9 
    dw Hitboxes_Torizo_Blank 

UNUSED_ExtendedSpritemaps_Torizo_AAAA84:
    dw $0001,$0000,$0000 
    dw Spritemaps_Torizo_A 
    dw Hitboxes_Torizo_Blank 

UNUSED_ExtendedSpritemaps_Torizo_AAAA8E:
    dw $0001,$0000,$0000 
    dw Spritemaps_Torizo_B 
    dw Hitboxes_Torizo_Blank 
endif ; !FEATURE_KEEP_UNREFERENCED

ExtendedSpritemaps_Torizo_WalkingRight_LeftLegMoving_0:
    dw $0004,$000F,$FFE2 
    dw Spritemaps_Torizo_30 
    dw Hitboxes_Torizo_Blank 
    dw $0005,$FFE8 
    dw Spritemaps_Torizo_45 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_8 
    dw $0000,$0000 
    dw Spritemaps_Torizo_58 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17 
    dw $0005,$FFE8 
    dw Spritemaps_Torizo_51 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_12 

ExtendedSpritemaps_Torizo_WalkingRight_LeftLegMoving_1:
    dw $0004,$000F,$FFE2 
    dw Spritemaps_Torizo_30 
    dw Hitboxes_Torizo_Blank 
    dw $0005,$FFE7 
    dw Spritemaps_Torizo_46 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_8 
    dw $0000,$0000 
    dw Spritemaps_Torizo_3D 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_7 
    dw $0005,$FFE7 
    dw Spritemaps_Torizo_50 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_11 

ExtendedSpritemaps_Torizo_WalkingRight_LeftLegMoving_2:
    dw $0004,$000F,$FFE1 
    dw Spritemaps_Torizo_30 
    dw Hitboxes_Torizo_Blank 
    dw $0005,$FFE6 
    dw Spritemaps_Torizo_47 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_9 
    dw $0000,$0000 
    dw Spritemaps_Torizo_3E 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_7 
    dw $0005,$FFE6 
    dw Spritemaps_Torizo_4F 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_10 

ExtendedSpritemaps_Torizo_WalkingRight_LeftLegMoving_3:
    dw $0004,$000F,$FFE0 
    dw Spritemaps_Torizo_30 
    dw Hitboxes_Torizo_Blank 
    dw $0005,$FFE7 
    dw Spritemaps_Torizo_48 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_A 
    dw $0000,$0000 
    dw Spritemaps_Torizo_3F 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_7 
    dw $0005,$FFE7 
    dw Spritemaps_Torizo_4E 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_F 

ExtendedSpritemaps_Torizo_WalkingRight_LeftLegMoving_4:
    dw $0004,$000F,$FFE0 
    dw Spritemaps_Torizo_30 
    dw Hitboxes_Torizo_Blank 
    dw $0005,$FFE8 
    dw Spritemaps_Torizo_49 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_B 
    dw $0000,$0000 
    dw Spritemaps_Torizo_40 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_7 
    dw $0005,$FFE8 
    dw Spritemaps_Torizo_4D 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_F 

ExtendedSpritemaps_Torizo_WalkingRight_RightLegMoving_0:
    dw $0004,$000F,$FFE2 
    dw Spritemaps_Torizo_30 
    dw Hitboxes_Torizo_Blank 
    dw $0005,$FFE8 
    dw Spritemaps_Torizo_49 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_B 
    dw $0000,$0000 
    dw Spritemaps_Torizo_59 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17 
    dw $0005,$FFE8 
    dw Spritemaps_Torizo_4D 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_F 

ExtendedSpritemaps_Torizo_WalkingRight_RightLegMoving_1:
    dw $0004,$000F,$FFE1 
    dw Spritemaps_Torizo_30 
    dw Hitboxes_Torizo_Blank 
    dw $0005,$FFE7 
    dw Spritemaps_Torizo_48 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_A 
    dw $0000,$0000 
    dw Spritemaps_Torizo_41 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_7 
    dw $0005,$FFE7 
    dw Spritemaps_Torizo_4E 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_F 

ExtendedSpritemaps_Torizo_WalkingRight_RightLegMoving_2:
    dw $0004,$000F,$FFE1 
    dw Spritemaps_Torizo_30 
    dw Hitboxes_Torizo_Blank 
    dw $0005,$FFE6 
    dw Spritemaps_Torizo_47 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_9 
    dw $0000,$0000 
    dw Spritemaps_Torizo_42 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_7 
    dw $0005,$FFE6 
    dw Spritemaps_Torizo_4F 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_10 

ExtendedSpritemaps_Torizo_WalkingRight_RightLegMoving_3:
    dw $0004,$000F,$FFE0 
    dw Spritemaps_Torizo_30 
    dw Hitboxes_Torizo_Blank 
    dw $0005,$FFE7 
    dw Spritemaps_Torizo_46 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_8 
    dw $0000,$0000 
    dw Spritemaps_Torizo_43 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_7 
    dw $0005,$FFE7 
    dw Spritemaps_Torizo_50 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_11 

ExtendedSpritemaps_Torizo_WalkingRight_RightLegMoving_4:
    dw $0004,$000F,$FFE1 
    dw Spritemaps_Torizo_30 
    dw Hitboxes_Torizo_Blank 
    dw $0005,$FFE8 
    dw Spritemaps_Torizo_45 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_8 
    dw $0000,$0000 
    dw Spritemaps_Torizo_44 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_7 
    dw $0005,$FFE8 
    dw Spritemaps_Torizo_51 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_12 

ExtendedSpritemaps_Torizo_Attacks_FaceRight_LeftFootForward:
    dw $0003,$000F,$FFE1 
    dw Spritemaps_Torizo_30 
    dw Hitboxes_Torizo_Blank 
    dw $0004,$FFE7 
    dw Spritemaps_Torizo_47 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_9 
    dw $0000,$0000 
    dw Spritemaps_Torizo_59 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17 

ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_LeftFootForward_0:
    dw $0003,$0009,$FFE1 
    dw Spritemaps_Torizo_31 
    dw Hitboxes_Torizo_Blank 
    dw $0004,$FFE7 
    dw Spritemaps_Torizo_48 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_A 
    dw $0000,$0000 
    dw Spritemaps_Torizo_59 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17 

ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_LeftFootForward_1:
    dw $0003,$0009,$FFE1 
    dw Spritemaps_Torizo_32 
    dw Hitboxes_Torizo_Blank 
    dw $0004,$FFE7 
    dw Spritemaps_Torizo_49 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_B 
    dw $0000,$0000 
    dw Spritemaps_Torizo_59 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17 

ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_LeftFootForward_2:
    dw $0003,$0009,$FFE1 
    dw Spritemaps_Torizo_33 
    dw Hitboxes_Torizo_Blank 
    dw $0004,$FFE7 
    dw Spritemaps_Torizo_4A 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_C 
    dw $0000,$0000 
    dw Spritemaps_Torizo_59 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17 

ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_LeftFootForward_3:
    dw $0003,$0004,$FFE7 
    dw Spritemaps_Torizo_4B 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_D 
    dw $0009,$FFE1 
    dw Spritemaps_Torizo_34 
    dw Hitboxes_Torizo_Blank 
    dw $0000,$0000 
    dw Spritemaps_Torizo_59 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17 

ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_LeftFootForward_4:
    dw $0003,$0004,$FFE7 
    dw Spritemaps_Torizo_4B 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_D 
    dw $0009,$FFE1 
    dw Spritemaps_Torizo_35 
    dw Hitboxes_Torizo_Blank 
    dw $0000,$0000 
    dw Spritemaps_Torizo_59 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17 

ExtendedSpritemaps_Torizo_Attacks_FaceRight_RightFootForward:
    dw $0003,$000F,$FFE1 
    dw Spritemaps_Torizo_30 
    dw Hitboxes_Torizo_Blank 
    dw $0004,$FFE7 
    dw Spritemaps_Torizo_46 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_8 
    dw $0000,$0000 
    dw Spritemaps_Torizo_58 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17 

ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_RightFootForward_0:
    dw $0003,$0009,$FFE1 
    dw Spritemaps_Torizo_31 
    dw Hitboxes_Torizo_Blank 
    dw $0004,$FFE7 
    dw Spritemaps_Torizo_48 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_A 
    dw $0000,$0000 
    dw Spritemaps_Torizo_58 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17 

ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_RightFootForward_1:
    dw $0003,$0009,$FFE1 
    dw Spritemaps_Torizo_32 
    dw Hitboxes_Torizo_Blank 
    dw $0004,$FFE7 
    dw Spritemaps_Torizo_49 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_B 
    dw $0000,$0000 
    dw Spritemaps_Torizo_58 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17 

ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_RightFootForward_2:
    dw $0003,$0009,$FFE1 
    dw Spritemaps_Torizo_33 
    dw Hitboxes_Torizo_Blank 
    dw $0004,$FFE7 
    dw Spritemaps_Torizo_4A 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_C 
    dw $0000,$0000 
    dw Spritemaps_Torizo_58 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17 

ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_RightFootForward_3:
    dw $0003,$0004,$FFE7 
    dw Spritemaps_Torizo_4B 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_D 
    dw $0009,$FFE1 
    dw Spritemaps_Torizo_34 
    dw Hitboxes_Torizo_Blank 
    dw $0000,$0000 
    dw Spritemaps_Torizo_58 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17 

ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_RightFootForward_4:
    dw $0003,$0004,$FFE7 
    dw Spritemaps_Torizo_4B 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_D 
    dw $0009,$FFE1 
    dw Spritemaps_Torizo_35 
    dw Hitboxes_Torizo_Blank 
    dw $0000,$0000 
    dw Spritemaps_Torizo_58 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17 

ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_0:
    dw $0003,$000F,$FFE1 
    dw Spritemaps_Torizo_30 
    dw Hitboxes_Torizo_Blank 
    dw $0004,$FFE7 
    dw Spritemaps_Torizo_48 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_A 
    dw $0000,$0000 
    dw Spritemaps_Torizo_59 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17 

ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_1:
    dw $0004,$000F,$FFE1 
    dw Spritemaps_Torizo_30 
    dw Hitboxes_Torizo_Blank 
    dw $0004,$FFE7 
    dw Spritemaps_Torizo_48 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_A 
    dw $0000,$0000 
    dw Spritemaps_Torizo_59 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17 
    dw $0004,$FFE7 
    dw Spritemaps_Torizo_51 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_12 

ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_2:
    dw $0004,$0004,$FFE7 
    dw Spritemaps_Torizo_48 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_A 
    dw $000F,$FFE1 
    dw Spritemaps_Torizo_30 
    dw Hitboxes_Torizo_Blank 
    dw $0000,$0000 
    dw Spritemaps_Torizo_59 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17 
    dw $0004,$FFE7 
    dw Spritemaps_Torizo_52 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_13 

ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_3:
    dw $0004,$0004,$FFE7 
    dw Spritemaps_Torizo_48 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_A 
    dw $000F,$FFE1 
    dw Spritemaps_Torizo_30 
    dw Hitboxes_Torizo_Blank 
    dw $0000,$0000 
    dw Spritemaps_Torizo_59 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17 
    dw $0004,$FFE7 
    dw Spritemaps_Torizo_53 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_14 

ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_4:
    dw $0004,$0004,$FFE7 
    dw Spritemaps_Torizo_48 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_A 
    dw $000F,$FFE1 
    dw Spritemaps_Torizo_30 
    dw Hitboxes_Torizo_Blank 
    dw $0000,$0000 
    dw Spritemaps_Torizo_59 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17 
    dw $0004,$FFE7 
    dw Spritemaps_Torizo_54 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_15 

ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_5:
    dw $0004,$000F,$FFE1 
    dw Spritemaps_Torizo_30 
    dw Hitboxes_Torizo_Blank 
    dw $0004,$FFE7 
    dw Spritemaps_Torizo_48 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_A 
    dw $0000,$0000 
    dw Spritemaps_Torizo_59 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17 
    dw $0004,$FFE7 
    dw Spritemaps_Torizo_4E 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_F 

ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_6:
    dw $0004,$000F,$FFE1 
    dw Spritemaps_Torizo_30 
    dw Hitboxes_Torizo_Blank 
    dw $0004,$FFE7 
    dw Spritemaps_Torizo_49 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_B 
    dw $0000,$0000 
    dw Spritemaps_Torizo_59 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17 
    dw $0004,$FFE7 
    dw Spritemaps_Torizo_4E 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_F 

ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_7:
    dw $0004,$000F,$FFE1 
    dw Spritemaps_Torizo_30 
    dw Hitboxes_Torizo_Blank 
    dw $0004,$FFE7 
    dw Spritemaps_Torizo_4A 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_C 
    dw $0000,$0000 
    dw Spritemaps_Torizo_59 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17 
    dw $0004,$FFE7 
    dw Spritemaps_Torizo_4E 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_F 

ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_8:
    dw $0004,$0004,$FFE7 
    dw Spritemaps_Torizo_4B 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_D 
    dw $000F,$FFE1 
    dw Spritemaps_Torizo_30 
    dw Hitboxes_Torizo_Blank 
    dw $0000,$0000 
    dw Spritemaps_Torizo_59 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17 
    dw $0004,$FFE7 
    dw Spritemaps_Torizo_4E 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_F 

ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_9:
    dw $0004,$0004,$FFE7 
    dw Spritemaps_Torizo_4C 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_E 
    dw $000F,$FFE1 
    dw Spritemaps_Torizo_30 
    dw Hitboxes_Torizo_Blank 
    dw $0000,$0000 
    dw Spritemaps_Torizo_59 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17 
    dw $0004,$FFE7 
    dw Spritemaps_Torizo_4E 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_F 

ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_0:
    dw $0003,$000F,$FFE1 
    dw Spritemaps_Torizo_30 
    dw Hitboxes_Torizo_Blank 
    dw $0004,$FFE7 
    dw Spritemaps_Torizo_48 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_A 
    dw $0000,$0000 
    dw Spritemaps_Torizo_58 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17 

ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_1:
    dw $0003,$000F,$FFE1 
    dw Spritemaps_Torizo_30 
    dw Hitboxes_Torizo_Blank 
    dw $0004,$FFE7 
    dw Spritemaps_Torizo_49 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_B 
    dw $0000,$0000 
    dw Spritemaps_Torizo_58 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17 

ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_2:
    dw $0003,$0004,$FFE7 
    dw Spritemaps_Torizo_4A 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_C 
    dw $000F,$FFE1 
    dw Spritemaps_Torizo_30 
    dw Hitboxes_Torizo_Blank 
    dw $0000,$0000 
    dw Spritemaps_Torizo_58 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17 

ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_3:
    dw $0003,$0004,$FFE7 
    dw Spritemaps_Torizo_4B 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_D 
    dw $000F,$FFE1 
    dw Spritemaps_Torizo_30 
    dw Hitboxes_Torizo_Blank 
    dw $0000,$0000 
    dw Spritemaps_Torizo_58 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17 

ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_4:
    dw $0003,$0004,$FFE7 
    dw Spritemaps_Torizo_4C 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_E 
    dw $000F,$FFE1 
    dw Spritemaps_Torizo_30 
    dw Hitboxes_Torizo_Blank 
    dw $0000,$0000 
    dw Spritemaps_Torizo_58 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17 

ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_5:
    dw $0004,$000F,$FFE1 
    dw Spritemaps_Torizo_30 
    dw Hitboxes_Torizo_Blank 
    dw $0004,$FFE7 
    dw Spritemaps_Torizo_47 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_9 
    dw $0000,$0000 
    dw Spritemaps_Torizo_58 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17 
    dw $0004,$FFE7 
    dw Spritemaps_Torizo_50 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_11 

ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_6:
    dw $0004,$000F,$FFE1 
    dw Spritemaps_Torizo_30 
    dw Hitboxes_Torizo_Blank 
    dw $0004,$FFE7 
    dw Spritemaps_Torizo_47 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_9 
    dw $0000,$0000 
    dw Spritemaps_Torizo_58 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17 
    dw $0004,$FFE7 
    dw Spritemaps_Torizo_51 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_12 

ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_7:
    dw $0004,$000F,$FFE1 
    dw Spritemaps_Torizo_30 
    dw Hitboxes_Torizo_Blank 
    dw $0004,$FFE7 
    dw Spritemaps_Torizo_47 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_9 
    dw $0000,$0000 
    dw Spritemaps_Torizo_58 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17 
    dw $0004,$FFE7 
    dw Spritemaps_Torizo_52 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_13 

ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_8:
    dw $0004,$0004,$FFE7 
    dw Spritemaps_Torizo_47 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_9 
    dw $000F,$FFE1 
    dw Spritemaps_Torizo_30 
    dw Hitboxes_Torizo_Blank 
    dw $0000,$0000 
    dw Spritemaps_Torizo_58 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17 
    dw $0004,$FFE7 
    dw Spritemaps_Torizo_53 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_14 

ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_9:
    dw $0004,$0004,$FFE7 
    dw Spritemaps_Torizo_47 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_9 
    dw $000F,$FFE1 
    dw Spritemaps_Torizo_30 
    dw Hitboxes_Torizo_Blank 
    dw $0000,$0000 
    dw Spritemaps_Torizo_58 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17 
    dw $0004,$FFE7 
    dw Spritemaps_Torizo_54 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_15 

ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingRight_0:
    dw $0001,$0000,$0000 
    dw Spritemaps_Torizo_36 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_0 

ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingRight_1:
    dw $0001,$0000,$0000 
    dw Spritemaps_Torizo_37 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_1 

ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingRight_2:
    dw $0001,$0000,$0000 
    dw Spritemaps_Torizo_38 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_2 

ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingRight_3:
    dw $0001,$0000,$0000 
    dw Spritemaps_Torizo_39 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_3 

ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingRight_4:
    dw $0002,$0005,$FFE8 
    dw Spritemaps_Torizo_47 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_9 
    dw $0000,$0000 
    dw Spritemaps_Torizo_3A 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_4 

ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingRight_5:
    dw $0002,$0005,$FFE8 
    dw Spritemaps_Torizo_48 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_A 
    dw $0000,$0000 
    dw Spritemaps_Torizo_3B 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_5 

ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingRight_6:
    dw $0002,$0005,$FFE8 
    dw Spritemaps_Torizo_48 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_A 
    dw $0000,$0000 
    dw Spritemaps_Torizo_3C 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_6 

ExtendedSpritemaps_Torizo_Jumping_Falling_FacingLeft_0:
    dw $0003,$FFF0,$FFE3 
    dw Spritemaps_Torizo_0 
    dw Hitboxes_Torizo_Blank 
    dw $FFFC,$FFEA 
    dw Spritemaps_Torizo_1D 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_9 
    dw $0000,$0000 
    dw Spritemaps_Torizo_2B 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_16 

ExtendedSpritemaps_Torizo_Jumping_Falling_FacingLeft_1:
    dw $0003,$FFF0,$FFE2 
    dw Spritemaps_Torizo_0 
    dw Hitboxes_Torizo_Blank 
    dw $FFFC,$FFE8 
    dw Spritemaps_Torizo_1C 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_8 
    dw $0000,$0000 
    dw Spritemaps_Torizo_2C 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_16 

ExtendedSpritemaps_Torizo_Jumping_Falling_FacingLeft_2:
    dw $0003,$FFF0,$FFE2 
    dw Spritemaps_Torizo_0 
    dw Hitboxes_Torizo_Blank 
    dw $FFFD,$FFE8 
    dw Spritemaps_Torizo_1B 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_8 
    dw $0000,$0000 
    dw Spritemaps_Torizo_2D 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_16 

ExtendedSpritemaps_Torizo_Jumping_Falling_FacingRight_0:
    dw $0003,$000F,$FFE4 
    dw Spritemaps_Torizo_30 
    dw Hitboxes_Torizo_Blank 
    dw $0004,$FFEA 
    dw Spritemaps_Torizo_47 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_9 
    dw $0000,$0000 
    dw Spritemaps_Torizo_55 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_16 

ExtendedSpritemaps_Torizo_Jumping_Falling_FacingRight_1:
    dw $0003,$000F,$FFE3 
    dw Spritemaps_Torizo_30 
    dw Hitboxes_Torizo_Blank 
    dw $0004,$FFE8 
    dw Spritemaps_Torizo_46 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_8 
    dw $0000,$0000 
    dw Spritemaps_Torizo_56 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_16 

ExtendedSpritemaps_Torizo_Jumping_Falling_FacingRight_2:
    dw $0003,$000F,$FFE3 
    dw Spritemaps_Torizo_30 
    dw Hitboxes_Torizo_Blank 
    dw $0003,$FFE8 
    dw Spritemaps_Torizo_45 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_8 
    dw $0000,$0000 
    dw Spritemaps_Torizo_57 
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_16 

TorizoMusicTracks_song1:
    dw $0006 

TorizoMusicTracks_song0:
    dw $0005 

TorizoMusicTracks_elevator:
    dw $0003 

Instruction_Torizo_FunctionInY:
    LDA.W $0000,Y : STA.W $0FB0,X 
    INY #2
    RTL 


Tiles_Blank:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 

InstList_Torizo_SpecialCallable_BlowUpBombTorizosGut:
    dw Instruction_Torizo_FunctionInY 
    dw RTS_AAC6AB 
    dw Instruction_Torizo_SetAnimationLock 
    dw Instruction_Torizo_Spawn5LowHealthExplosion_SleepFor28Frames 
    dw $0000 
    dw Instruction_Torizo_MarkBTGutBlownUp_Spawn6BTDroolProjectiles 
    dw Instruction_Common_TransferYBytesInYToVRAM 
    dw $0040 
    dl Tiles_Torizo_AAB479 
    dw $7300 
    dw Instruction_Common_TransferYBytesInYToVRAM 
    dw $0040 
    dl Tiles_Torizo_AAB679 
    dw $7400 
    dw Instruction_Common_TransferYBytesInYToVRAM 
    dw $0020 
    dl Tiles_Torizo_AAB4B9 
    dw $7E70 
    dw Instruction_Common_TransferYBytesInYToVRAM 
    dw $0020 
    dl Tiles_Torizo_AAB6B9 
    dw $7F70 
    dw Instruction_Torizo_FunctionInY 
    dw Function_Torizo_NormalMovement 
    dw Instruction_Torizo_ClearAnimationLock 
    dw Instruction_Torizo_GotoGutExplosionLinkInstruction 

Instruction_Torizo_MarkBTGutBlownUp_Spawn6BTDroolProjectiles:
    LDA.W $0FB6,X 
    ORA.W #$8000 
    STA.W $0FB6,X 
    PHX 
    PHY 
    LDY.W #EnemyProjectile_BombTorizoContinuousDrool 
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    LDY.W #EnemyProjectile_BombTorizoContinuousDrool 
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    LDY.W #EnemyProjectile_BombTorizoContinuousDrool 
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    LDY.W #EnemyProjectile_BombTorizoContinuousDrool 
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    LDY.W #EnemyProjectile_BombTorizoContinuousDrool 
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    LDY.W #EnemyProjectile_BombTorizoContinuousDrool 
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    PLY 
    PLX 
    RTL 


InstList_Torizo_Callable_BlowUpBombTorizosFace:
    dw Instruction_Torizo_FunctionInY 
    dw RTS_AAC6AB 
    dw Instruction_Torizo_SetAnimationLock 
    dw Instruction_Torizo_Spawn5LowHealthExplosion_SleepFor28Frames 
    dw $0006 
    dw Instruction_Torizo_MarkBombTorizoFaceBlownUp 
    dw Instruction_Common_TransferYBytesInYToVRAM 
    dw $0020 
    dl Tiles_Torizo_AAB4D9 
    dw $7E50 
    dw Instruction_Common_TransferYBytesInYToVRAM 
    dw $0020 
    dl Tiles_Torizo_AAB6D9 
    dw $7F50 
    dw Instruction_Common_TransferYBytesInYToVRAM 
    dw $0040 
    dl Tiles_Blank 
    dw $7C80 
    dw Instruction_Common_TransferYBytesInYToVRAM 
    dw $0040 
    dl Tiles_Blank 
    dw $7CA0 
    dw Instruction_Common_WaitYFrames 
    dw $0001 
    dw Instruction_Common_TransferYBytesInYToVRAM 
    dw $0040 
    dl Tiles_Blank 
    dw $7D80 
    dw Instruction_Common_TransferYBytesInYToVRAM 
    dw $0040 
    dl Tiles_Blank 
    dw $7DA0 
    dw Instruction_Common_TransferYBytesInYToVRAM 
    dw $0040 
    dl Tiles_Blank 
    dw $7E80 
    dw Instruction_Common_TransferYBytesInYToVRAM 
    dw $0040 
    dl Tiles_Blank 
    dw $7F80 
    dw Instruction_Common_TransferYBytesInYToVRAM 
    dw $0020 
    dl Tiles_Blank 
    dw $79F0 
    dw Instruction_Torizo_FunctionInY 
    dw Function_Torizo_NormalMovement 
    dw Instruction_Torizo_ClearAnimationLock 
    dw Instruction_Torizo_Return 

Instruction_Torizo_MarkBombTorizoFaceBlownUp:
    LDA.W $0FB6,X 
    ORA.W #$4000 
    STA.W $0FB6,X 
    RTL 


InstList_Torizo_DeathSequence_0:
    dw Instruction_Torizo_FunctionInY 
    dw RTS_AAC6AB 
    dw Instruction_Torizo_SetAnimationLock 
    dw Instruction_Common_TimerInY 
    dw $0008 

InstList_Torizo_DeathSequence_1:
    dw Instruction_Torizo_SpawnTorizoDeathExplosion_SleepFor1IFrame 
    dw Instruction_Common_WaitYFrames 
    dw $0006 
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate 
    dw InstList_Torizo_DeathSequence_1 
    dw Instruction_Torizo_SetupPaletteTransitionToBlack 
    dw Instruction_Common_TimerInY 
    dw $000E 

InstList_Torizo_DeathSequence_2:
    dw Instruction_Torizo_SpawnTorizoDeathExplosion_SleepFor1IFrame 
    dw Instruction_Torizo_SetAsVisible 
    dw Instruction_Common_WaitYFrames 
    dw $0002 
    dw Instruction_Torizo_SetAsInvisible 
    dw Instruction_Common_WaitYFrames 
    dw $0002 
    dw Instruction_Torizo_SpawnTorizoDeathExplosion_SleepFor1IFrame 
    dw Instruction_Torizo_SetAsVisible 
    dw Instruction_Common_WaitYFrames 
    dw $0002 
    dw Instruction_Torizo_SetAsInvisible 
    dw Instruction_Common_WaitYFrames 
    dw $0002 
    dw Instruction_Torizo_SetAsVisible 
    dw Instruction_Common_WaitYFrames 
    dw $0002 
    dw Instruction_Torizo_SetAsInvisible 
    dw Instruction_Common_WaitYFrames 
    dw $0002 
    dw Instruction_Torizo_SetAsVisible 
    dw Instruction_Common_WaitYFrames 
    dw $0002 
    dw Instruction_Torizo_SetAsInvisible 
    dw Instruction_Common_WaitYFrames 
    dw $0002 
    dw Instruction_Torizo_AdvanceGradualColorChange 
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate 
    dw InstList_Torizo_DeathSequence_2 
    dw Instruction_Common_WaitYFrames 
    dw $0040 
    dw Instruction_Torizo_SetBossBit_QueueElevatorMusic_SpawnDrops 
    dw Instruction_Common_DeleteEnemy 

Instruction_Torizo_SetAsVisible:
    LDA.W $0F86,X 
    AND.W #$FEFF 
    STA.W $0F86,X 
    RTL 


Instruction_Torizo_SetAsInvisible:
    LDA.W $0F86,X 
    ORA.W #$0100 
    STA.W $0F86,X 
    RTL 


Instruction_Torizo_SetupPaletteTransitionToBlack:
    PHX 
    LDX.W #$001E 
    LDA.W #$0000 

.loop:
    STA.L $7EC340,X 
    STA.L $7EC320,X 
    DEX #2
    BPL .loop 
    PLX 
    RTL 


Instruction_Torizo_SetBossBit_QueueElevatorMusic_SpawnDrops:
    LDA.W #$0004 
    JSL.L SetBossBitsInAForCurrentArea 
    LDA.W TorizoMusicTracks_elevator 
    JSL.L QueueMusicDataOrTrack_8FrameDelay 
    PHY 
    PHX 
    PHP 
    LDA.W $079F 
    BNE .notCrateria 
    JSL.L BombTorizoDeathItemDropRoutine 
    BRA .return 


.notCrateria:
    JSL.L GoldenTorizoDeathItemDropRoutine 

.return:
    PLP 
    PLX 
    PLY 
    RTL 


Instruction_Torizo_AdvanceGradualColorChange:
    LDA.W #$0600 
    JSL.L Advance_GradualColorChange_ofPalettesInA_Denominator_C 
    RTL 


Tiles_Torizo:
    db $34,$2C,$4D,$7D,$5F,$7F,$1E,$7F,$9C,$FF,$B9,$FE,$BB,$FD,$7B,$BE 
    db $7F,$00,$3A,$00,$DB,$00,$D7,$00,$37,$00,$EE,$00,$AF,$00,$ED,$00 
    db $B7,$B7,$FF,$FF,$D5,$F5,$6A,$BA,$FE,$5E,$DA,$BA,$94,$74,$38,$F8 
    db $78,$10,$11,$01,$EB,$01,$D6,$02,$76,$06,$B6,$02,$7E,$04,$EC,$08 

Tiles_Torizo_AAB2B9:
    db $34,$2C,$4D,$7D,$5F,$7F,$1E,$7F,$9C,$FF,$B9,$FF,$BB,$FE,$7C,$BE 
    db $7F,$00,$3A,$00,$DB,$00,$D7,$00,$36,$00,$EC,$00,$AD,$01,$EB,$03 
    db $B7,$B7,$FF,$FF,$F5,$F5,$6A,$FA,$BE,$FE,$DA,$3A,$34,$74,$78,$F8 
    db $78,$10,$11,$01,$CB,$01,$96,$02,$56,$66,$F6,$E2,$DE,$C4,$AC,$88 

Tiles_Torizo_AAB2F9:
    db $34,$2C,$4D,$7D,$5F,$7F,$1E,$7F,$9D,$FF,$BB,$FE,$BC,$FE,$7D,$BE 
    db $7F,$00,$3A,$00,$DB,$00,$D7,$00,$36,$01,$ED,$03,$AB,$03,$EB,$03 
    db $B7,$B7,$FF,$FF,$F5,$F5,$EA,$FA,$3E,$FE,$5A,$3A,$54,$34,$B8,$78 
    db $78,$10,$11,$01,$CB,$01,$16,$02,$D6,$E6,$F6,$E2,$FE,$E4,$EC,$C8 

Tiles_Torizo_AAB339:
    db $34,$2C,$4D,$7D,$5D,$7F,$1A,$7F,$94,$FE,$BC,$F6,$BD,$F6,$76,$BF 
    db $7F,$00,$3B,$00,$DE,$01,$D5,$03,$3B,$07,$EB,$07,$AB,$07,$E9,$03 
    db $B7,$B7,$7F,$FF,$F5,$F5,$32,$FA,$5E,$3E,$5A,$3A,$D4,$34,$28,$F8 
    db $78,$10,$D1,$01,$3B,$E1,$DE,$F2,$EE,$F6,$EE,$F2,$EE,$F4,$DC,$E8 
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
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00 

Tiles_Torizo_AAB479:
    db $FD,$FD,$FA,$FB,$F7,$FF,$FF,$F7,$F7,$FF,$DF,$FF,$3F,$7F,$2F,$7F 
    db $7A,$01,$04,$03,$E4,$FF,$F0,$FF,$20,$39,$00,$78,$00,$70,$00,$58 
    db $E9,$F9,$5A,$F8,$FE,$FA,$73,$FF,$EF,$7F,$FF,$FF,$7F,$FF,$CF,$FF 
    db $7F,$E1,$75,$D0,$2F,$F0,$1E,$F0,$3C,$E8,$10,$F8,$03,$FB,$07,$BB 

Tiles_Torizo_AAB4B9:
    db $C7,$C6,$EB,$EA,$2A,$23,$96,$9F,$AB,$9F,$B3,$BF,$1F,$2F,$5B,$37 
    db $7B,$00,$37,$00,$D5,$08,$61,$0C,$41,$3C,$C0,$1C,$C0,$3F,$80,$7F 

Tiles_Torizo_AAB4D9:
    db $4F,$4F,$43,$46,$6F,$2F,$5B,$4C,$5F,$5B,$4F,$4A,$3B,$1F,$0F,$0F 
    db $B6,$00,$F7,$08,$F0,$00,$B7,$00,$BE,$00,$F3,$00,$F4,$00,$FD,$00 

Tiles_Torizo_AAB4F9:
    db $8D,$FD,$FA,$FB,$FF,$FF,$FD,$FE,$F3,$FC,$E5,$FB,$7F,$7E,$7B,$7C 
    db $FA,$01,$64,$03,$1C,$1F,$F8,$FF,$00,$1F,$00,$3F,$00,$1F,$10,$1F 
    db $E9,$F9,$5A,$F8,$FE,$FA,$B3,$7F,$4F,$FF,$BF,$FF,$BF,$7E,$CF,$7D 
    db $7F,$E1,$75,$D0,$2F,$F0,$1E,$F0,$1C,$E8,$10,$F8,$02,$FA,$05,$F9 

Tiles_Torizo_AAB539:
    db $8D,$FD,$FA,$FB,$FF,$FF,$FD,$FE,$FB,$FC,$FC,$FF,$7F,$7F,$3E,$3F 
    db $FA,$01,$64,$03,$1C,$1F,$F8,$FF,$00,$1F,$60,$6F,$38,$3F,$1C,$1F 
    db $E9,$F9,$5A,$F8,$FC,$FA,$B3,$7F,$4F,$FF,$BF,$FF,$7F,$BE,$EF,$7D 
    db $7F,$E1,$75,$D0,$2F,$F0,$1E,$F0,$1C,$E8,$10,$F8,$02,$FA,$05,$F9 

Tiles_Torizo_AAB579:
    db $8D,$FD,$FA,$FB,$FF,$FF,$FD,$FE,$FB,$FC,$FE,$FF,$7F,$7F,$3F,$3F 
    db $FA,$01,$64,$03,$1C,$1F,$F8,$FF,$08,$1F,$7C,$7F,$3E,$3F,$2F,$2F 
    db $E9,$F9,$4A,$F8,$FC,$FA,$73,$FF,$4F,$FF,$BF,$FF,$5F,$BE,$AE,$FD 
    db $7F,$E1,$75,$C0,$2F,$F0,$1E,$F0,$1C,$E8,$10,$F8,$02,$FA,$05,$F8 
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

Tiles_Torizo_AAB679:
    db $7F,$2F,$2B,$3F,$3F,$3F,$07,$2F,$0D,$07,$01,$03,$03,$01,$00,$00 
    db $00,$58,$00,$3E,$00,$2A,$04,$2F,$00,$0B,$00,$03,$00,$02,$00,$00 
    db $FE,$FE,$FF,$FF,$FF,$FF,$EF,$FF,$FF,$EF,$DF,$FF,$7F,$DF,$FF,$FF 
    db $0F,$1A,$0E,$12,$0D,$11,$83,$FB,$03,$FB,$0B,$FB,$1B,$EB,$17,$17 

Tiles_Torizo_AAB6B9:
    db $97,$9F,$13,$AF,$5B,$D7,$FB,$EF,$09,$0F,$44,$47,$2B,$E7,$0A,$E8 
    db $60,$1F,$40,$3F,$20,$1F,$40,$1F,$70,$0F,$F8,$07,$30,$0D,$1D,$02 

Tiles_Torizo_AAB6D9:
    db $47,$47,$65,$66,$3F,$BF,$DF,$7F,$17,$D7,$6F,$2F,$5F,$7F,$AF,$B7 
    db $B9,$00,$9F,$00,$C1,$00,$30,$00,$EE,$00,$92,$00,$B7,$00,$D6,$00 

Tiles_Torizo_AAB6F9:
    db $3D,$3E,$1F,$1F,$1F,$1F,$0F,$0F,$07,$07,$03,$03,$01,$01,$01,$01 
    db $18,$1F,$1C,$1F,$0C,$0F,$06,$07,$03,$03,$00,$00,$00,$00,$01,$01 
    db $DE,$FE,$DF,$3F,$6F,$BF,$2F,$FF,$DF,$EF,$9F,$FF,$FF,$FF,$FF,$FF 
    db $0F,$FA,$0E,$F2,$0D,$F1,$03,$FB,$03,$FB,$0B,$FB,$1B,$6B,$17,$17 

Tiles_Torizo_AAB739:
    db $1F,$1F,$0F,$0F,$07,$07,$07,$07,$03,$03,$01,$01,$01,$01,$01,$01 
    db $0E,$0F,$07,$07,$03,$03,$03,$03,$01,$01,$01,$01,$00,$00,$01,$01 
    db $DE,$FE,$BF,$DF,$EF,$FF,$CF,$FF,$DF,$EF,$FF,$FF,$FF,$FF,$FF,$FF 
    db $0F,$FA,$0E,$F2,$4D,$B1,$83,$FB,$C3,$FB,$AB,$DB,$BB,$8B,$17,$17 

Tiles_Torizo_AAB779:
    db $1F,$1F,$0F,$0F,$07,$07,$03,$03,$03,$03,$01,$01,$01,$01,$01,$01 
    db $0F,$0F,$07,$07,$03,$03,$01,$01,$01,$01,$00,$00,$00,$00,$01,$01 
    db $DE,$FE,$FF,$DF,$EF,$FF,$EF,$FF,$FF,$EF,$FF,$FF,$FF,$FF,$FF,$FF 
    db $8F,$FA,$CE,$F2,$CD,$F1,$C3,$FB,$C3,$FB,$CB,$FB,$BB,$CB,$17,$17 
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

InstList_Torizo_BombTorizo_Initial_0:
    dw Instruction_Torizo_SetSteppedLeftWithRightFootState 
    dw Instruction_Torizo_SetAnimationLock 
    dw $0001 
    dw ExtendedSpritemap_Torizo_Blank 
    dw Instruction_Torizo_FunctionInY 
    dw Function_Torizo_WakeWhenBombTorizoChozoFinishesCrumbling 
    dw Instruction_Common_Sleep 
    dw Instruction_Torizo_FunctionInY 
    dw Function_Torizo_SimpleMovement 
    dw $0030 
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_0 
    dw Instruction_Common_TransferYBytesInYToVRAM 
    dw $0040 
    dl Tiles_Torizo 
    dw $7D80,$0020 
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_0 
    dw Instruction_Common_TransferYBytesInYToVRAM 
    dw $0040 
    dl Tiles_Torizo_AAB2B9 
    dw $7D80,$0010 
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_0 
    dw Instruction_Common_TransferYBytesInYToVRAM 
    dw $0040 
    dl Tiles_Torizo_AAB2F9 
    dw $7D80,$0008 
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_0 
    dw Instruction_Common_TransferYBytesInYToVRAM 
    dw $0040 
    dl Tiles_Torizo_AAB339 
    dw $7D80,$0020 
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_0 
    dw Instruction_Common_TimerInY 
    dw $0002 

InstList_Torizo_BombTorizo_Initial_1:
    dw $0004 
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_0 
    dw Instruction_Common_TransferYBytesInYToVRAM 
    dw $0040 
    dl Tiles_Torizo 
    dw $7D80,$0004 
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_0 
    dw Instruction_Common_TransferYBytesInYToVRAM 
    dw $0040 
    dl Tiles_Torizo_AAB2B9 
    dw $7D80,$0004 
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_0 
    dw Instruction_Common_TransferYBytesInYToVRAM 
    dw $0040 
    dl Tiles_Torizo_AAB2F9 
    dw $7D80,$0004 
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_0 
    dw Instruction_Common_TransferYBytesInYToVRAM 
    dw $0040 
    dl Tiles_Torizo_AAB339 
    dw $7D80 
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate 
    dw InstList_Torizo_BombTorizo_Initial_1 
    dw $0030 
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_0 
    dw Instruction_Torizo_StandingUpMovement_IndexInY 
    dw $0000,$0010 
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_1 
    dw Instruction_Torizo_StandingUpMovement_IndexInY 
    dw $0002,$0008 
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_2 
    dw Instruction_Torizo_StandingUpMovement_IndexInY 
    dw $0004,$0008 
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_3 
    dw Instruction_Torizo_StandingUpMovement_IndexInY 
    dw $0006,$0008 
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_4 
    dw Instruction_Torizo_StandingUpMovement_IndexInY 
    dw $0008,$0008 
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_5 
    dw Instruction_Torizo_StandingUpMovement_IndexInY 
    dw $000A 
    dw Instruction_Torizo_SetupPaletteTransitionToNormalTorizo 
    dw Instruction_Common_TimerInY 
    dw $0010 

InstList_Torizo_BombTorizo_Initial_2:
    dw $0004 
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_6 
    dw Instruction_Torizo_AdvanceGradualColorChange 
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate 
    dw InstList_Torizo_BombTorizo_Initial_2 
    dw RTL_AAC2C8 
    dw Instruction_Torizo_ClearAnimationLock 
    dw Instruction_Torizo_StartFightMusic_BombTorizoBellyPaletteFX 
    dw $0010 
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_6 
    dw Instruction_Common_GotoY 
    dw InstList_Torizo_FacingLeft_Walking_LeftLegMoving 

Instruction_Torizo_SetupPaletteTransitionToNormalTorizo:
    JSR.W LoadNormalTorizoTargetPalettes 
    RTL 


Instruction_Torizo_StartFightMusic_BombTorizoBellyPaletteFX:
    LDA.W TorizoMusicTracks_song0 
    JSL.L QueueMusicDataOrTrack_8FrameDelay 
    PHY 
    LDY.W #PaletteFXObjects_BombTorizoBelly 
    JSL.L Spawn_PaletteFXObject 
    PLY 
    RTL 


InstList_Torizo_FacingLeft_TurningLeft:
    dw Instruction_Torizo_FunctionInY 
    dw Function_Torizo_SimpleMovement 
    dw Instruction_Torizo_SetTorizoTurningAroundFlag 
    dw $0018 
    dw ExtendedSpritemaps_Torizo_FacingScreen_Turning_Dodging 

InstList_Torizo_FacingLeft_Walking_RightLegMoving:
    dw Instruction_Torizo_SetSteppedLeftWithLeftFootState 
    dw Instruction_Torizo_FunctionInY 
    dw Function_Torizo_NormalMovement 
    dw Instruction_Common_Enemy0FB2_InY 
    dw Function_Torizo_Movement_Walking 
    dw Instruction_Torizo_SpawnLowHealthInitialDroolIfHealthIsLow 
    dw Instruction_Torizo_PlayTorizoFootstepsSFX 
    dw $000A 
    dw ExtendedSpritemaps_Torizo_WalkingLeft_RightLegMoving_0 
    dw Instruction_Torizo_CallYIfSamusIsLessThan38PixelsInFront 
    dw InstList_Torizo_FacingLeft_ExplosiveSwipe_LeftFootForward_ 
    dw Instruction_Torizo_GotoYAndJumpBackwardsIfLessThan20Pixels 
    dw InstList_Torizo_FacingLeft_JumpingBackward_LandLeftFootFwd_0 
    dw Instruction_Torizo_BombTorizoWalkingMovement_Normal_IndexInY 
    dw $0002,$0006 
    dw ExtendedSpritemaps_Torizo_WalkingLeft_RightLegMoving_1 
    dw Instruction_Torizo_GotoYAndJumpBackwardsIfLessThan20Pixels 
    dw InstList_Torizo_FacingLeft_JumpingBackward_LandLeftFootFwd_0 
    dw Instruction_Torizo_BombTorizoWalkingMovement_Normal_IndexInY 
    dw $0004,$0006 
    dw ExtendedSpritemaps_Torizo_WalkingLeft_RightLegMoving_2 
    dw Instruction_Torizo_GotoYAndJumpBackwardsIfLessThan20Pixels 
    dw InstList_Torizo_FacingLeft_JumpingBackward_LandLeftFootFwd_0 
    dw Instruction_Torizo_BombTorizoWalkingMovement_Normal_IndexInY 
    dw $0006,$0006 
    dw ExtendedSpritemaps_Torizo_WalkingLeft_RightLegMoving_3 
    dw Instruction_Torizo_GotoYAndJumpBackwardsIfLessThan20Pixels 
    dw InstList_Torizo_FacingLeft_JumpingBackward_LandLeftFootFwd_0 
    dw Instruction_Torizo_BombTorizoWalkingMovement_Normal_IndexInY 
    dw $0008,$0006 
    dw ExtendedSpritemaps_Torizo_WalkingLeft_RightLegMoving_4 
    dw Instruction_Torizo_BombTorizoWalkingMovement_Normal_IndexInY 
    dw $000A 

InstList_Torizo_FacingLeft_Walking_LeftLegMoving:
    dw Instruction_Torizo_SetSteppedLeftWithRightFootState 
    dw Instruction_Torizo_FunctionInY 
    dw Function_Torizo_NormalMovement 
    dw Instruction_Common_Enemy0FB2_InY 
    dw Function_Torizo_Movement_Walking 
    dw Instruction_Torizo_SpawnLowHealthInitialDroolIfHealthIsLow 
    dw Instruction_Torizo_PlayTorizoFootstepsSFX 
    dw $000A 
    dw ExtendedSpritemaps_Torizo_WalkingLeft_LeftLegMoving_0 
    dw Instruction_Torizo_CallYIfSamusIsLessThan38PixelsInFront 
    dw InstList_Torizo_FacingLeft_ExplosiveSwipe_RightFootForward 
    dw Instruction_Torizo_GotoYAndJumpBackwardsIfLessThan20Pixels 
    dw InstList_Torizo_FacingLeft_JumpingBackward_RightFootFwd_0 
    dw Instruction_Torizo_BombTorizoWalkingMovement_Normal_IndexInY 
    dw $000C,$0006 
    dw ExtendedSpritemaps_Torizo_WalkingLeft_LeftLegMoving_1 
    dw Instruction_Torizo_GotoYAndJumpBackwardsIfLessThan20Pixels 
    dw InstList_Torizo_FacingLeft_JumpingBackward_RightFootFwd_0 
    dw Instruction_Torizo_BombTorizoWalkingMovement_Normal_IndexInY 
    dw $000E,$0006 
    dw ExtendedSpritemaps_Torizo_WalkingLeft_LeftLegMoving_2 
    dw Instruction_Torizo_GotoYAndJumpBackwardsIfLessThan20Pixels 
    dw InstList_Torizo_FacingLeft_JumpingBackward_RightFootFwd_0 
    dw Instruction_Torizo_BombTorizoWalkingMovement_Normal_IndexInY 
    dw $0010,$0006 
    dw ExtendedSpritemaps_Torizo_WalkingLeft_LeftLegMoving_3 
    dw Instruction_Torizo_GotoYAndJumpBackwardsIfLessThan20Pixels 
    dw InstList_Torizo_FacingLeft_JumpingBackward_RightFootFwd_0 
    dw Instruction_Torizo_BombTorizoWalkingMovement_Normal_IndexInY 
    dw $0012,$0006 
    dw ExtendedSpritemaps_Torizo_WalkingLeft_LeftLegMoving_4 
    dw Instruction_Torizo_BombTorizoWalkingMovement_Normal_IndexInY 
    dw $0000 
    dw Instruction_Common_GotoY 
    dw InstList_Torizo_FacingLeft_Walking_RightLegMoving 

InstList_Torizo_FacingLeft_SpewingChozoOrbs_RightFootFwd_0:
    dw Instruction_Common_Enemy0FB2_InY 
    dw Function_Torizo_Movement_Attacking 
    dw $0010 
    dw ExtendedSpritemaps_Torizo_Attacks_FaceLeft_RightFootForward 
    dw $0008 
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_RightFootForward_0 
    dw $0008 
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_RightFootForward_1 
    dw $0008 
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_RightFootForward_2 
    dw $0008 
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_RightFootForward_3 
    dw $0010 
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_RightFootForward_4 
    dw Instruction_Torizo_PlayShotTorizoSFX 
    dw Instruction_Common_TimerInY 
    dw $0003 

InstList_Torizo_FacingLeft_SpewingChozoOrbs_RightFootFwd_1:
    dw Instruction_Torizo_SpawnBombTorizosChozoOrbs 
    dw Instruction_Common_WaitYFrames 
    dw $0010 
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate 
    dw InstList_Torizo_FacingLeft_SpewingChozoOrbs_RightFootFwd_1 
    dw $0008 
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_RightFootForward_3 
    dw $0008 
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_RightFootForward_2 
    dw $0008 
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_RightFootForward_1 
    dw $0048 
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_RightFootForward_0 
    dw Instruction_Common_Enemy0FB2_InY 
    dw Function_Torizo_Movement_Walking 
    dw Instruction_Torizo_Return 

InstList_Torizo_FacingLeft_SpewingChozoOrbs_LeftFootFwd_0:
    dw Instruction_Common_Enemy0FB2_InY 
    dw Function_Torizo_Movement_Attacking 
    dw $0010 
    dw ExtendedSpritemaps_Torizo_Attacks_FaceLeft_LeftFootForward 
    dw $0008 
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_LeftFootForward_0 
    dw $0008 
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_LeftFootForward_1 
    dw $0008 
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_LeftFootForward_2 
    dw $0008 
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_LeftFootForward_3 
    dw $0010 
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_LeftFootForward_4 
    dw Instruction_Torizo_PlayShotTorizoSFX 
    dw Instruction_Common_TimerInY 
    dw $0003 

InstList_Torizo_FacingLeft_SpewingChozoOrbs_LeftFootFwd_1:
    dw Instruction_Torizo_SpawnBombTorizosChozoOrbs 
    dw Instruction_Common_WaitYFrames 
    dw $0010 
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate 
    dw InstList_Torizo_FacingLeft_SpewingChozoOrbs_LeftFootFwd_1 
    dw $0008 
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_LeftFootForward_3 
    dw $0008 
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_LeftFootForward_2 
    dw $0008 
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_LeftFootForward_1 
    dw $0048 
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_LeftFootForward_0 
    dw Instruction_Common_Enemy0FB2_InY 
    dw Function_Torizo_Movement_Walking 
    dw Instruction_Torizo_Return 

InstList_Torizo_FacingLeft_SonicBooms_RightFootForward_0:
    dw Instruction_Common_Enemy0FB2_InY 
    dw Function_Torizo_Movement_Attacking 
    dw Instruction_Common_TimerInY 
    dw $0004 

InstList_Torizo_FacingLeft_SonicBooms_RightFootForward_1:
    dw $0006 
    dw ExtendedSpritemaps_Torizo_Attacks_FaceLeft_RightFootForward 
    dw $0006 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_0 
    dw $0006 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_1 
    dw $0006 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_2 
    dw $0006 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_3 
    dw $0006 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_4 
    dw $0002 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_3 
    dw $0002 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_2 
    dw Instruction_Torizo_SpawnBombTorizoSonicBoomWithParameterY 
    dw $0000,$0002 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_1 
    dw $0018 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_0 
    dw $0006 
    dw ExtendedSpritemaps_Torizo_Attacks_FaceLeft_RightFootForward 
    dw $0006 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_5 
    dw $0006 
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_RightFootForward_0 
    dw $0006 
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_RightFootForward_1 
    dw $0006 
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_RightFootForward_2 
    dw $0006 
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_RightFootForward_3 
    dw $0002 
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_RightFootForward_2 
    dw $0002 
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_RightFootForward_1 
    dw Instruction_Torizo_SpawnBombTorizoSonicBoomWithParameterY 
    dw $0001,$0002 
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_RightFootForward_0 
    dw $0038 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_5 
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate 
    dw InstList_Torizo_FacingLeft_SonicBooms_RightFootForward_1 
    dw Instruction_Common_Enemy0FB2_InY 
    dw Function_Torizo_Movement_Walking 
    dw Instruction_Torizo_Return 

InstList_Torizo_FacingLeft_SonicBooms_LeftFootForward_0:
    dw Instruction_Common_Enemy0FB2_InY 
    dw Function_Torizo_Movement_Attacking 
    dw Instruction_Common_TimerInY 
    dw $0004 

InstList_Torizo_FacingLeft_SonicBooms_LeftFootForward_1:
    dw $0006 
    dw ExtendedSpritemaps_Torizo_Attacks_FaceLeft_LeftFootForward 
    dw $0006 
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_0 
    dw $0006 
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_1 
    dw $0006 
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_2 
    dw $0006 
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_3 
    dw $0006 
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_4 
    dw $0002 
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_3 
    dw $0002 
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_2 
    dw Instruction_Torizo_SpawnBombTorizoSonicBoomWithParameterY 
    dw $0000,$0002 
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_1 
    dw $0018 
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_0 
    dw $0006 
    dw ExtendedSpritemaps_Torizo_Attacks_FaceLeft_LeftFootForward 
    dw $0006 
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_5 
    dw $0006 
    dw ExtSpritemap_Torizo_SonicBoom_Swipe_FaceLeft_LeftFootFwd_0 
    dw $0006 
    dw ExtSpritemap_Torizo_SonicBoom_Swipe_FaceLeft_LeftFootFwd_1 
    dw $0006 
    dw ExtSpritemap_Torizo_SonicBoom_Swipe_FaceLeft_LeftFootFwd_2 
    dw $0006 
    dw ExtSpritemap_Torizo_SonicBoom_Swipe_FaceLeft_LeftFootFwd_3 
    dw $0002 
    dw ExtSpritemap_Torizo_SonicBoom_Swipe_FaceLeft_LeftFootFwd_2 
    dw $0002 
    dw ExtSpritemap_Torizo_SonicBoom_Swipe_FaceLeft_LeftFootFwd_1 
    dw Instruction_Torizo_SpawnBombTorizoSonicBoomWithParameterY 
    dw $0001 
    dw $0002 
    dw ExtSpritemap_Torizo_SonicBoom_Swipe_FaceLeft_LeftFootFwd_0 
    dw $0038 
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_5 
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate 
    dw InstList_Torizo_FacingLeft_SonicBooms_LeftFootForward_1 
    dw Instruction_Common_Enemy0FB2_InY 
    dw Function_Torizo_Movement_Walking 
    dw Instruction_Torizo_Return 

InstList_Torizo_FacingLeft_ExplosiveSwipe_RightFootForward:
    dw Instruction_Common_Enemy0FB2_InY 
    dw Function_Torizo_Movement_Attacking 
    dw $0003 
    dw ExtendedSpritemaps_Torizo_Attacks_FaceLeft_RightFootForward 
    dw $0003 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_0 
    dw $0003 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_1 
    dw $0003 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_2 
    dw $0003 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_3 
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY 
    dw $0000,$0003 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_4 
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY 
    dw $0002,$0001 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_3 
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY 
    dw $0004,$0001 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_2 
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY 
    dw $0006,$0001 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_1 
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY 
    dw $0008,$0001 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_0 
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY 
    dw $000A,$0003 
    dw ExtendedSpritemaps_Torizo_Attacks_FaceLeft_RightFootForward 
    dw $0003 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_5 
    dw $0003 
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_RightFootForward_0 
    dw $0003 
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_RightFootForward_1 
    dw $0003 
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_RightFootForward_2 
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY 
    dw $000C,$0003 
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_RightFootForward_3 
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY 
    dw $000E,$0001 
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_RightFootForward_2 
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY 
    dw $0010,$0001 
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_RightFootForward_1 
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY 
    dw $0012,$0001 
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_RightFootForward_0 
    dw $0010 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_5 
    dw Instruction_Common_Enemy0FB2_InY 
    dw Function_Torizo_Movement_Walking 
    dw Instruction_Torizo_Return 

InstList_Torizo_FacingLeft_ExplosiveSwipe_LeftFootForward_:
    dw Instruction_Common_Enemy0FB2_InY 
    dw Function_Torizo_Movement_Attacking 
    dw $0003 
    dw ExtendedSpritemaps_Torizo_Attacks_FaceLeft_LeftFootForward 
    dw $0003 
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_0 
    dw $0003 
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_1 
    dw $0003 
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_2 
    dw $0003 
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_3 
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY 
    dw $0000,$0003 
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_4 
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY 
    dw $0002,$0001 
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_3 
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY 
    dw $0004,$0001 
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_2 
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY 
    dw $0006,$0001 
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_1 
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY 
    dw $0008,$0001 
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_0 
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY 
    dw $000A,$0003 
    dw ExtendedSpritemaps_Torizo_Attacks_FaceLeft_LeftFootForward 
    dw $0003 
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_5 
    dw $0003 
    dw ExtSpritemap_Torizo_SonicBoom_Swipe_FaceLeft_LeftFootFwd_0 
    dw $0003 
    dw ExtSpritemap_Torizo_SonicBoom_Swipe_FaceLeft_LeftFootFwd_1 
    dw $0003 
    dw ExtSpritemap_Torizo_SonicBoom_Swipe_FaceLeft_LeftFootFwd_2 
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY 
    dw $000C,$0003 
    dw ExtSpritemap_Torizo_SonicBoom_Swipe_FaceLeft_LeftFootFwd_3 
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY 
    dw $000E,$0001 
    dw ExtSpritemap_Torizo_SonicBoom_Swipe_FaceLeft_LeftFootFwd_2 
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY 
    dw $0010,$0001 
    dw ExtSpritemap_Torizo_SonicBoom_Swipe_FaceLeft_LeftFootFwd_1 
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY 
    dw $0012,$0001 
    dw ExtSpritemap_Torizo_SonicBoom_Swipe_FaceLeft_LeftFootFwd_0 
    dw $0010 
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_5 
    dw Instruction_Common_Enemy0FB2_InY 
    dw Function_Torizo_Movement_Walking 
    dw Instruction_Torizo_Return 

InstList_Torizo_FacingLeft_JumpingForwards_0:
    dw Instruction_Common_Enemy0FB2_InY 
    dw Function_Torizo_Movement_Jumping_Falling 
    dw Instruction_Torizo_LinkInstructionInY 
    dw InstList_Torizo_FacingLeft_Falling_0 
    dw $0005 
    dw ExtendedSpritemaps_Torizo_Jumping_Falling_FacingLeft_0 
    dw $0005 
    dw ExtendedSpritemaps_Torizo_Jumping_Falling_FacingLeft_1 

InstList_Torizo_FacingLeft_JumpingForwards_1:
    dw $0001 
    dw ExtendedSpritemaps_Torizo_Jumping_Falling_FacingLeft_2 
    dw Instruction_Torizo_GotoY_IfRising 
    dw InstList_Torizo_FacingLeft_JumpingForwards_1 

InstList_Torizo_FacingLeft_Falling_0:
    dw Instruction_Common_Enemy0FB2_InY 
    dw Function_Torizo_Movement_Jumping_Falling 
    dw Instruction_Torizo_LinkInstructionInY 
    dw InstList_Torizo_FacingLeft_Falling_2 

InstList_Torizo_FacingLeft_Falling_1:
    dw $0005 
    dw ExtendedSpritemaps_Torizo_Jumping_Falling_FacingLeft_1 
    dw Instruction_Common_GotoY 
    dw InstList_Torizo_FacingLeft_Falling_1 

InstList_Torizo_FacingLeft_Falling_2:
    dw Instruction_Torizo_PlayTorizoFootstepsSFX 
    dw Instruction_Torizo_SpawnTorizoLandingDustClouds 
    dw Instruction_Torizo_GotoY_IfFaceBlownUp_ElseGotoY2_IfGolden 
    dw InstList_Torizo_FacingLeft_Faceless_Walking_LeftLegMoving 
    dw InstList_GoldenTorizo_WalkingLeft_LeftLegMoving 
    dw Instruction_Common_GotoY 
    dw InstList_Torizo_FacingLeft_Walking_LeftLegMoving 

InstList_Torizo_FacingLeft_JumpingBackward_LandLeftFootFwd_0:
    dw Instruction_Common_Enemy0FB2_InY 
    dw Function_Torizo_Movement_Jumping_Falling 
    dw Instruction_Torizo_LinkInstructionInY 
    dw InstList_Torizo_FacingLeft_JumpingBackward_LandLeftFootFwd_2 
    dw $0005 
    dw ExtendedSpritemaps_Torizo_Jumping_Falling_FacingLeft_0 
    dw $0005 
    dw ExtendedSpritemaps_Torizo_Jumping_Falling_FacingLeft_1 

InstList_Torizo_FacingLeft_JumpingBackward_LandLeftFootFwd_1:
    dw $0001 
    dw ExtendedSpritemaps_Torizo_Jumping_Falling_FacingLeft_2 
    dw Instruction_Torizo_GotoY_IfRising 
    dw InstList_Torizo_FacingLeft_JumpingBackward_LandLeftFootFwd_1 

InstList_Torizo_FacingLeft_JumpingBackward_LandLeftFootFwd_2:
    dw Instruction_Common_Enemy0FB2_InY 
    dw Function_Torizo_Movement_Jumping_Falling 
    dw Instruction_Torizo_LinkInstructionInY 
    dw InstList_Torizo_FacingLeft_JumpingBackward_LandLeftFootFwd_4 

InstList_Torizo_FacingLeft_JumpingBackward_LandLeftFootFwd_3:
    dw $0005 
    dw ExtendedSpritemaps_Torizo_Jumping_Falling_FacingLeft_1 
    dw Instruction_Common_GotoY 
    dw InstList_Torizo_FacingLeft_JumpingBackward_LandLeftFootFwd_3 

InstList_Torizo_FacingLeft_JumpingBackward_LandLeftFootFwd_4:
    dw Instruction_Torizo_PlayTorizoFootstepsSFX 
    dw Instruction_Torizo_SpawnTorizoLandingDustClouds 
    dw Instruction_Torizo_GotoY_IfFaceBlownUp_ElseGotoY2_IfGolden 
    dw InstList_Torizo_FacingLeft_Faceless_Walking_RightLegMoving 
    dw InstList_GT_LandedFromBackwardsJump_FacingLeft_LeftFootFwd 
    dw Instruction_Torizo_CallY_OrY2_ForBombTorizoAttack 
    dw InstList_Torizo_FacingLeft_SpewingChozoOrbs_LeftFootFwd_0 
    dw InstList_Torizo_FacingLeft_SonicBooms_LeftFootForward_0 
    dw Instruction_Common_GotoY 
    dw InstList_Torizo_FacingLeft_Walking_RightLegMoving 

InstList_Torizo_FacingLeft_JumpingBackward_RightFootFwd_0:
    dw Instruction_Common_Enemy0FB2_InY 
    dw Function_Torizo_Movement_Jumping_Falling 
    dw Instruction_Torizo_LinkInstructionInY 
    dw InstList_Torizo_FacingLeft_JumpingBackward_RightFootFwd_2 
    dw $0005 
    dw ExtendedSpritemaps_Torizo_Jumping_Falling_FacingLeft_0 
    dw $0005 
    dw ExtendedSpritemaps_Torizo_Jumping_Falling_FacingLeft_1 

InstList_Torizo_FacingLeft_JumpingBackward_RightFootFwd_1:
    dw $0001 
    dw ExtendedSpritemaps_Torizo_Jumping_Falling_FacingLeft_2 
    dw Instruction_Torizo_GotoY_IfRising 
    dw InstList_Torizo_FacingLeft_JumpingBackward_RightFootFwd_1 

InstList_Torizo_FacingLeft_JumpingBackward_RightFootFwd_2:
    dw Instruction_Common_Enemy0FB2_InY 
    dw Function_Torizo_Movement_Jumping_Falling 
    dw Instruction_Torizo_LinkInstructionInY 
    dw InstList_Torizo_FacingLeft_JumpingBackward_RightFootFwd_4 

InstList_Torizo_FacingLeft_JumpingBackward_RightFootFwd_3:
    dw $0005 
    dw ExtendedSpritemaps_Torizo_Jumping_Falling_FacingLeft_1 
    dw Instruction_Common_GotoY 
    dw InstList_Torizo_FacingLeft_JumpingBackward_RightFootFwd_3 

InstList_Torizo_FacingLeft_JumpingBackward_RightFootFwd_4:
    dw Instruction_Torizo_PlayTorizoFootstepsSFX 
    dw Instruction_Torizo_SpawnTorizoLandingDustClouds 
    dw Instruction_Torizo_GotoY_IfFaceBlownUp_ElseGotoY2_IfGolden 
    dw InstList_Torizo_FacingLeft_Faceless_Walking_LeftLegMoving 
    dw InstList_GT_LandedFromBackwardsJump_FacingLeft_RightFootFwd 
    dw Instruction_Torizo_CallY_OrY2_ForBombTorizoAttack 
    dw InstList_Torizo_FacingLeft_SpewingChozoOrbs_RightFootFwd_0 
    dw InstList_Torizo_FacingLeft_SonicBooms_RightFootForward_0 
    dw Instruction_Common_GotoY 
    dw InstList_Torizo_FacingLeft_Walking_LeftLegMoving 

InstList_Torizo_FacingLeft_Faceless_TurningLeft:
    dw Instruction_Torizo_FunctionInY 
    dw Function_Torizo_SimpleMovement 
    dw Instruction_Torizo_SetTorizoTurningAroundFlag 
    dw $0008 
    dw ExtendedSpritemaps_Torizo_FacingScreen_Turning_Dodging 

InstList_Torizo_FacingLeft_Faceless_Walking_RightLegMoving:
    dw Instruction_Torizo_SetSteppedLeftWithLeftFootState 
    dw Instruction_Torizo_FunctionInY 
    dw Function_Torizo_NormalMovement 
    dw Instruction_Common_Enemy0FB2_InY 
    dw Function_Torizo_Movement_Walking 
    dw Instruction_Torizo_SpawnLowHealthInitialDroolIfHealthIsLow 
    dw Instruction_Torizo_PlayTorizoFootstepsSFX 
    dw $0001 
    dw ExtendedSpritemaps_Torizo_WalkingLeft_RightLegMoving_0 
    dw Instruction_Torizo_CallYIfSamusIsLessThan38PixelsInFront 
    dw InstList_Torizo_FacingLeft_ExplosiveSwipe_LeftFootForward_ 
    dw Instruction_Torizo_BTWalkingMovement_Faceless_IndexInY 
    dw $0002,$0005 
    dw ExtendedSpritemaps_Torizo_WalkingLeft_RightLegMoving_1 
    dw Instruction_Torizo_BTWalkingMovement_Faceless_IndexInY 
    dw $0004,$0005 
    dw ExtendedSpritemaps_Torizo_WalkingLeft_RightLegMoving_2 
    dw Instruction_Torizo_BTWalkingMovement_Faceless_IndexInY 
    dw $0006,$0005 
    dw ExtendedSpritemaps_Torizo_WalkingLeft_RightLegMoving_3 
    dw Instruction_Torizo_BTWalkingMovement_Faceless_IndexInY 
    dw $0008,$0005 
    dw ExtendedSpritemaps_Torizo_WalkingLeft_RightLegMoving_4 
    dw Instruction_Torizo_BTWalkingMovement_Faceless_IndexInY 
    dw $000A 

InstList_Torizo_FacingLeft_Faceless_Walking_LeftLegMoving:
    dw Instruction_Torizo_SetSteppedLeftWithRightFootState 
    dw Instruction_Torizo_FunctionInY 
    dw Function_Torizo_NormalMovement 
    dw Instruction_Common_Enemy0FB2_InY 
    dw Function_Torizo_Movement_Walking 
    dw Instruction_Torizo_SpawnLowHealthInitialDroolIfHealthIsLow 
    dw Instruction_Torizo_PlayTorizoFootstepsSFX 
    dw $0001 
    dw ExtendedSpritemaps_Torizo_WalkingLeft_LeftLegMoving_0 
    dw Instruction_Torizo_CallYIfSamusIsLessThan38PixelsInFront 
    dw InstList_Torizo_FacingLeft_ExplosiveSwipe_RightFootForward 
    dw Instruction_Torizo_BTWalkingMovement_Faceless_IndexInY 
    dw $000C,$0005 
    dw ExtendedSpritemaps_Torizo_WalkingLeft_LeftLegMoving_1 
    dw Instruction_Torizo_BTWalkingMovement_Faceless_IndexInY 
    dw $000E,$0005 
    dw ExtendedSpritemaps_Torizo_WalkingLeft_LeftLegMoving_2 
    dw Instruction_Torizo_BTWalkingMovement_Faceless_IndexInY 
    dw $0010,$0005 
    dw ExtendedSpritemaps_Torizo_WalkingLeft_LeftLegMoving_3 
    dw Instruction_Torizo_BTWalkingMovement_Faceless_IndexInY 
    dw $0012,$0005 
    dw ExtendedSpritemaps_Torizo_WalkingLeft_LeftLegMoving_4 
    dw Instruction_Torizo_BTWalkingMovement_Faceless_IndexInY 
    dw $0000 
    dw Instruction_Common_GotoY 
    dw InstList_Torizo_FacingLeft_Faceless_Walking_RightLegMoving 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_Torizo_FacingRight_StandUp_AABD90:
    dw Instruction_Torizo_SetSteppedRightWithLeftFootState 
    dw $0001 
    dw ExtendedSpritemap_Torizo_Blank 
    dw Instruction_Torizo_FunctionInY 
    dw Function_Torizo_WakeWhenBombTorizoChozoFinishesCrumbling 
    dw Instruction_Common_Sleep 
    dw Instruction_Torizo_FunctionInY 
    dw Function_Torizo_SimpleMovement 
    dw $0020 
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingRight_0 
    dw Instruction_Torizo_StandingUpMovement_IndexInY 
    dw $0010,$0010 
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingRight_1 
    dw Instruction_Torizo_StandingUpMovement_IndexInY 
    dw $0012,$0008 
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingRight_2 
    dw Instruction_Torizo_StandingUpMovement_IndexInY 
    dw $0014,$0008 
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingRight_3 
    dw Instruction_Torizo_StandingUpMovement_IndexInY 
    dw $0016,$0008 
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingRight_4 
    dw Instruction_Torizo_StandingUpMovement_IndexInY 
    dw $0018,$0008 
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingRight_5 
    dw Instruction_Torizo_StandingUpMovement_IndexInY 
    dw $001A,$0008 
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingRight_6 
    dw Instruction_Common_GotoY 
    dw InstList_Torizo_FacingRight_Walking_RightLegMoving 
endif ; !FEATURE_KEEP_UNREFERENCED

InstList_Torizo_FacingRight_TurningRight:
    dw Instruction_Torizo_FunctionInY 
    dw Function_Torizo_SimpleMovement 
    dw Instruction_Torizo_SetTorizoTurningAroundFlag 
    dw $0018 
    dw ExtendedSpritemaps_Torizo_FacingScreen_Turning_Dodging 

InstList_Torizo_FacingRight_Walking_LeftLegMoving:
    dw Instruction_Torizo_SetSteppedRightWithRightFootState 
    dw Instruction_Torizo_FunctionInY 
    dw Function_Torizo_NormalMovement 
    dw Instruction_Common_Enemy0FB2_InY 
    dw Function_Torizo_Movement_Walking 
    dw Instruction_Torizo_SpawnLowHealthInitialDroolIfHealthIsLow 
    dw Instruction_Torizo_PlayTorizoFootstepsSFX 
    dw $000A 
    dw ExtendedSpritemaps_Torizo_WalkingRight_LeftLegMoving_0 
    dw Instruction_Torizo_CallYIfSamusIsLessThan38PixelsInFront 
    dw InstList_Torizo_FacingRight_ExplosiveSwipe_RightFootForward 
    dw Instruction_Torizo_GotoYAndJumpBackwardsIfLessThan20Pixels 
    dw InstList_Torizo_FacingRight_JumpBackward_LandRightFootFwd_0 
    dw Instruction_Torizo_BombTorizoWalkingMovement_Normal_IndexInY 
    dw $0016,$0006 
    dw ExtendedSpritemaps_Torizo_WalkingRight_LeftLegMoving_1 
    dw Instruction_Torizo_GotoYAndJumpBackwardsIfLessThan20Pixels 
    dw InstList_Torizo_FacingRight_JumpBackward_LandRightFootFwd_0 
    dw Instruction_Torizo_BombTorizoWalkingMovement_Normal_IndexInY 
    dw $0018,$0006 
    dw ExtendedSpritemaps_Torizo_WalkingRight_LeftLegMoving_2 
    dw Instruction_Torizo_GotoYAndJumpBackwardsIfLessThan20Pixels 
    dw InstList_Torizo_FacingRight_JumpBackward_LandRightFootFwd_0 
    dw Instruction_Torizo_BombTorizoWalkingMovement_Normal_IndexInY 
    dw $001A,$0006 
    dw ExtendedSpritemaps_Torizo_WalkingRight_LeftLegMoving_3 
    dw Instruction_Torizo_GotoYAndJumpBackwardsIfLessThan20Pixels 
    dw InstList_Torizo_FacingRight_JumpBackward_LandRightFootFwd_0 
    dw Instruction_Torizo_BombTorizoWalkingMovement_Normal_IndexInY 
    dw $001C,$0006 
    dw ExtendedSpritemaps_Torizo_WalkingRight_LeftLegMoving_4 
    dw Instruction_Torizo_GotoYAndJumpBackwardsIfLessThan20Pixels 
    dw InstList_Torizo_FacingRight_JumpBackward_LandRightFootFwd_0 
    dw Instruction_Torizo_BombTorizoWalkingMovement_Normal_IndexInY 
    dw $001E 

InstList_Torizo_FacingRight_Walking_RightLegMoving:
    dw Instruction_Torizo_SetSteppedRightWithLeftFootState 
    dw Instruction_Torizo_FunctionInY 
    dw Function_Torizo_NormalMovement 
    dw Instruction_Common_Enemy0FB2_InY 
    dw Function_Torizo_Movement_Walking 
    dw Instruction_Torizo_SpawnLowHealthInitialDroolIfHealthIsLow 
    dw Instruction_Torizo_PlayTorizoFootstepsSFX 
    dw $000A 
    dw ExtendedSpritemaps_Torizo_WalkingRight_RightLegMoving_0 
    dw Instruction_Torizo_CallYIfSamusIsLessThan38PixelsInFront 
    dw InstList_Torizo_FacingRight_ExplosiveSwipe_LeftFootForward 
    dw Instruction_Torizo_GotoYAndJumpBackwardsIfLessThan20Pixels 
    dw InstList_Torizo_FacingRight_JumpBackwards_LandLeftFootFwd_0 
    dw Instruction_Torizo_BombTorizoWalkingMovement_Normal_IndexInY 
    dw $0020,$0006 
    dw ExtendedSpritemaps_Torizo_WalkingRight_RightLegMoving_1 
    dw Instruction_Torizo_GotoYAndJumpBackwardsIfLessThan20Pixels 
    dw InstList_Torizo_FacingRight_JumpBackwards_LandLeftFootFwd_0 
    dw Instruction_Torizo_BombTorizoWalkingMovement_Normal_IndexInY 
    dw $0022,$0006 
    dw ExtendedSpritemaps_Torizo_WalkingRight_RightLegMoving_2 
    dw Instruction_Torizo_GotoYAndJumpBackwardsIfLessThan20Pixels 
    dw InstList_Torizo_FacingRight_JumpBackwards_LandLeftFootFwd_0 
    dw Instruction_Torizo_BombTorizoWalkingMovement_Normal_IndexInY 
    dw $0024,$0006 
    dw ExtendedSpritemaps_Torizo_WalkingRight_RightLegMoving_3 
    dw Instruction_Torizo_GotoYAndJumpBackwardsIfLessThan20Pixels 
    dw InstList_Torizo_FacingRight_JumpBackwards_LandLeftFootFwd_0 
    dw Instruction_Torizo_BombTorizoWalkingMovement_Normal_IndexInY 
    dw $0026,$0006 
    dw ExtendedSpritemaps_Torizo_WalkingRight_RightLegMoving_4 
    dw Instruction_Torizo_BombTorizoWalkingMovement_Normal_IndexInY 
    dw $0014 
    dw Instruction_Common_GotoY 
    dw InstList_Torizo_FacingRight_Walking_LeftLegMoving 

InstList_Torizo_FacingRight_SpewingChozoOrbs_LeftFootFwd_0:
    dw Instruction_Common_Enemy0FB2_InY 
    dw Function_Torizo_Movement_Attacking 
    dw $0010 
    dw ExtendedSpritemaps_Torizo_Attacks_FaceRight_LeftFootForward 
    dw $0008 
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_LeftFootForward_0 
    dw $0008 
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_LeftFootForward_1 
    dw $0008 
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_LeftFootForward_2 
    dw $0008 
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_LeftFootForward_3 
    dw $0010 
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_LeftFootForward_4 
    dw Instruction_Torizo_PlayShotTorizoSFX 
    dw Instruction_Common_TimerInY 
    dw $0003 

InstList_Torizo_FacingRight_SpewingChozoOrbs_LeftFootFwd_1:
    dw Instruction_Torizo_SpawnBombTorizosChozoOrbs 
    dw Instruction_Common_WaitYFrames 
    dw $0010 
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate 
    dw InstList_Torizo_FacingRight_SpewingChozoOrbs_LeftFootFwd_1 
    dw $0008 
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_LeftFootForward_3 
    dw $0008 
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_LeftFootForward_2 
    dw $0008 
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_LeftFootForward_1 
    dw $0048 
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_LeftFootForward_0 
    dw Instruction_Common_Enemy0FB2_InY 
    dw Function_Torizo_Movement_Walking 
    dw Instruction_Torizo_Return 

InstList_Torizo_FacingRight_SpewingChozoOrbs_RightFootFwd_0:
    dw Instruction_Common_Enemy0FB2_InY 
    dw Function_Torizo_Movement_Attacking 
    dw $0010 
    dw ExtendedSpritemaps_Torizo_Attacks_FaceRight_RightFootForward 
    dw $0008 
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_RightFootForward_0 
    dw $0008 
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_RightFootForward_1 
    dw $0008 
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_RightFootForward_2 
    dw $0008 
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_RightFootForward_3 
    dw $0010 
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_RightFootForward_4 
    dw Instruction_Torizo_PlayShotTorizoSFX 
    dw Instruction_Common_TimerInY 
    dw $0003 

InstList_Torizo_FacingRight_SpewingChozoOrbs_RightFootFwd_1:
    dw Instruction_Torizo_SpawnBombTorizosChozoOrbs 
    dw Instruction_Common_WaitYFrames 
    dw $0010 
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate 
    dw InstList_Torizo_FacingRight_SpewingChozoOrbs_RightFootFwd_1 
    dw $0008 
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_RightFootForward_3 
    dw $0008 
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_RightFootForward_2 
    dw $0008 
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_RightFootForward_1 
    dw $0048 
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_RightFootForward_0 
    dw Instruction_Common_Enemy0FB2_InY 
    dw Function_Torizo_Movement_Walking 
    dw Instruction_Torizo_Return 

InstList_Torizo_FacingRight_SonicBooms_LeftFootForward_0:
    dw Instruction_Common_Enemy0FB2_InY 
    dw Function_Torizo_Movement_Attacking 
    dw Instruction_Common_TimerInY 
    dw $0004 

InstList_Torizo_FacingRight_SonicBooms_LeftFootForward_1:
    dw $0006 
    dw ExtendedSpritemaps_Torizo_Attacks_FaceRight_LeftFootForward 
    dw $0006 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_0 
    dw $0006 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_1 
    dw $0006 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_2 
    dw $0006 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_3 
    dw $0006 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_4 
    dw $0002 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_3 
    dw $0002 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_2 
    dw Instruction_Torizo_SpawnBombTorizoSonicBoomWithParameterY 
    dw $0000,$0002 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_1 
    dw $0018 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_0 
    dw $0006 
    dw ExtendedSpritemaps_Torizo_Attacks_FaceRight_LeftFootForward 
    dw $0006 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_5 
    dw $0006 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_6 
    dw $0006 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_7 
    dw $0006 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_8 
    dw $0006 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_9 
    dw $0002 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_8 
    dw $0002 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_7 
    dw Instruction_Torizo_SpawnBombTorizoSonicBoomWithParameterY 
    dw $0001,$0002 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_6 
    dw $0038 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_5 
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate 
    dw InstList_Torizo_FacingRight_SonicBooms_LeftFootForward_1 
    dw Instruction_Common_Enemy0FB2_InY 
    dw Function_Torizo_Movement_Walking 
    dw Instruction_Torizo_Return 

InstList_Torizo_FacingRight_SonicBooms_RightFootForward_0:
    dw Instruction_Common_Enemy0FB2_InY 
    dw Function_Torizo_Movement_Attacking 
    dw Instruction_Common_TimerInY 
    dw $0004 

InstList_Torizo_FacingRight_SonicBooms_RightFootForward_1:
    dw $0006 
    dw ExtendedSpritemaps_Torizo_Attacks_FaceRight_RightFootForward 
    dw $0006 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_0 
    dw $0006 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_1 
    dw $0006 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_2 
    dw $0006 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_3 
    dw $0006 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_4 
    dw $0002 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_3 
    dw $0002 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_2 
    dw Instruction_Torizo_SpawnBombTorizoSonicBoomWithParameterY 
    dw $0000,$0002 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_1 
    dw $0018 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_0 
    dw $0006 
    dw ExtendedSpritemaps_Torizo_Attacks_FaceRight_RightFootForward 
    dw $0006 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_5 
    dw $0006 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_6 
    dw $0006 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_7 
    dw $0006 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_8 
    dw $0006 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_9 
    dw $0002 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_8 
    dw $0002 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_7 
    dw Instruction_Torizo_SpawnBombTorizoSonicBoomWithParameterY 
    dw $0001,$0002 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_6 
    dw $0038 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_5 
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate 
    dw InstList_Torizo_FacingRight_SonicBooms_RightFootForward_1 
    dw Instruction_Common_Enemy0FB2_InY 
    dw Function_Torizo_Movement_Walking 
    dw Instruction_Torizo_Return 

InstList_Torizo_FacingRight_ExplosiveSwipe_LeftFootForward:
    dw Instruction_Common_Enemy0FB2_InY 
    dw Function_Torizo_Movement_Attacking 
    dw $0003 
    dw ExtendedSpritemaps_Torizo_Attacks_FaceRight_LeftFootForward 
    dw $0003 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_0 
    dw $0003 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_1 
    dw $0003 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_2 
    dw $0003 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_3 
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY 
    dw $0000,$0003 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_4 
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY 
    dw $0002,$0001 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_3 
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY 
    dw $0004,$0001 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_2 
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY 
    dw $0006,$0001 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_1 
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY 
    dw $0008,$0001 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_0 
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY 
    dw $000A,$0003 
    dw ExtendedSpritemaps_Torizo_Attacks_FaceRight_LeftFootForward 
    dw $0003 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_5 
    dw $0003 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_6 
    dw $0003 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_7 
    dw $0003 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_8 
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY 
    dw $000C,$0003 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_9 
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY 
    dw $000E,$0001 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_8 
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY 
    dw $0010,$0001 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_7 
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY 
    dw $0012,$0001 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_6 
    dw $0010 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_5 
    dw Instruction_Common_Enemy0FB2_InY 
    dw Function_Torizo_Movement_Walking 
    dw Instruction_Torizo_Return 

InstList_Torizo_FacingRight_ExplosiveSwipe_RightFootForward:
    dw Instruction_Common_Enemy0FB2_InY 
    dw Function_Torizo_Movement_Attacking 
    dw $0003 
    dw ExtendedSpritemaps_Torizo_Attacks_FaceRight_RightFootForward 
    dw $0003 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_0 
    dw $0003 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_1 
    dw $0003 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_2 
    dw $0003 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_3 
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY 
    dw $0000,$0003 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_4 
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY 
    dw $0002,$0001 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_3 
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY 
    dw $0004,$0001 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_2 
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY 
    dw $0006,$0001 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_1 
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY 
    dw $0008,$0001 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_0 
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY 
    dw $000A,$0003 
    dw ExtendedSpritemaps_Torizo_Attacks_FaceRight_RightFootForward 
    dw $0003 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_5 
    dw $0003 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_6 
    dw $0003 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_7 
    dw $0003 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_8 
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY 
    dw $000C,$0003 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_9 
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY 
    dw $000E,$0001 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_8 
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY 
    dw $0010,$0001 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_7 
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY 
    dw $0012,$0001 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_6 
    dw $0010 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_5 
    dw Instruction_Common_Enemy0FB2_InY 
    dw Function_Torizo_Movement_Walking 
    dw Instruction_Torizo_Return 

InstList_Torizo_FacingRight_JumpingForwards_0:
    dw Instruction_Common_Enemy0FB2_InY 
    dw Function_Torizo_Movement_Jumping_Falling 
    dw Instruction_Torizo_LinkInstructionInY 
    dw InstList_Torizo_FacingRight_Falling_0 
    dw $0005 
    dw ExtendedSpritemaps_Torizo_Jumping_Falling_FacingRight_0 
    dw $0005 
    dw ExtendedSpritemaps_Torizo_Jumping_Falling_FacingRight_1 

InstList_Torizo_FacingRight_JumpingForwards_1:
    dw $0001 
    dw ExtendedSpritemaps_Torizo_Jumping_Falling_FacingRight_2 
    dw Instruction_Torizo_GotoY_IfRising 
    dw InstList_Torizo_FacingRight_JumpingForwards_1 

InstList_Torizo_FacingRight_Falling_0:
    dw Instruction_Common_Enemy0FB2_InY 
    dw Function_Torizo_Movement_Jumping_Falling 
    dw Instruction_Torizo_LinkInstructionInY 
    dw InstList_Torizo_FacingRight_Falling_2 

InstList_Torizo_FacingRight_Falling_1:
    dw $0005 
    dw ExtendedSpritemaps_Torizo_Jumping_Falling_FacingRight_1 
    dw Instruction_Common_GotoY 
    dw InstList_Torizo_FacingRight_Falling_1 

InstList_Torizo_FacingRight_Falling_2:
    dw Instruction_Torizo_PlayTorizoFootstepsSFX 
    dw Instruction_Torizo_SpawnTorizoLandingDustClouds 
    dw Instruction_Torizo_GotoY_IfFaceBlownUp_ElseGotoY2_IfGolden 
    dw InstList_Torizo_FacingRight_Faceless_Walking_RightLegMoving 
    dw InstList_GoldenTorizo_WalkingRight_RightLegMoving 
    dw Instruction_Common_GotoY 
    dw InstList_Torizo_FacingRight_Walking_RightLegMoving 

InstList_Torizo_FacingRight_JumpBackward_LandRightFootFwd_0:
    dw Instruction_Common_Enemy0FB2_InY 
    dw Function_Torizo_Movement_Jumping_Falling 
    dw Instruction_Torizo_LinkInstructionInY 
    dw InstList_Torizo_FacingRight_JumpBackward_LandRightFootFwd_2 
    dw $0005 
    dw ExtendedSpritemaps_Torizo_Jumping_Falling_FacingRight_0 
    dw $0005 
    dw ExtendedSpritemaps_Torizo_Jumping_Falling_FacingRight_1 

InstList_Torizo_FacingRight_JumpBackward_LandRightFootFwd_1:
    dw $0001 
    dw ExtendedSpritemaps_Torizo_Jumping_Falling_FacingRight_2 
    dw Instruction_Torizo_GotoY_IfRising 
    dw InstList_Torizo_FacingRight_JumpBackward_LandRightFootFwd_1 

InstList_Torizo_FacingRight_JumpBackward_LandRightFootFwd_2:
    dw Instruction_Common_Enemy0FB2_InY 
    dw Function_Torizo_Movement_Jumping_Falling 
    dw Instruction_Torizo_LinkInstructionInY 
    dw InstList_Torizo_FacingRight_JumpBackward_LandRightFootFwd_4 

InstList_Torizo_FacingRight_JumpBackward_LandRightFootFwd_3:
    dw $0005 
    dw ExtendedSpritemaps_Torizo_Jumping_Falling_FacingRight_1 
    dw Instruction_Common_GotoY 
    dw InstList_Torizo_FacingRight_JumpBackward_LandRightFootFwd_3 

InstList_Torizo_FacingRight_JumpBackward_LandRightFootFwd_4:
    dw Instruction_Torizo_PlayTorizoFootstepsSFX 
    dw Instruction_Torizo_SpawnTorizoLandingDustClouds 
    dw Instruction_Torizo_GotoY_IfFaceBlownUp_ElseGotoY2_IfGolden 
    dw InstList_Torizo_FacingRight_Faceless_Walking_LeftLegMoving 
    dw InstList_GT_LandedFromBackwardsJump_FacingRight_RightFootFwd 
    dw Instruction_Torizo_CallY_OrY2_ForBombTorizoAttack 
    dw InstList_Torizo_FacingRight_SpewingChozoOrbs_RightFootFwd_0 
    dw InstList_Torizo_FacingRight_SonicBooms_RightFootForward_0 
    dw Instruction_Common_GotoY 
    dw InstList_Torizo_FacingRight_Walking_LeftLegMoving 

InstList_Torizo_FacingRight_JumpBackwards_LandLeftFootFwd_0:
    dw Instruction_Common_Enemy0FB2_InY 
    dw Function_Torizo_Movement_Jumping_Falling 
    dw Instruction_Torizo_LinkInstructionInY 
    dw InstList_Torizo_FacingRight_JumpBackwards_LandLeftFootFwd_2 
    dw $0005 
    dw ExtendedSpritemaps_Torizo_Jumping_Falling_FacingRight_0 
    dw $0005 
    dw ExtendedSpritemaps_Torizo_Jumping_Falling_FacingRight_1 

InstList_Torizo_FacingRight_JumpBackwards_LandLeftFootFwd_1:
    dw $0001 
    dw ExtendedSpritemaps_Torizo_Jumping_Falling_FacingRight_2 
    dw Instruction_Torizo_GotoY_IfRising 
    dw InstList_Torizo_FacingRight_JumpBackwards_LandLeftFootFwd_1 

InstList_Torizo_FacingRight_JumpBackwards_LandLeftFootFwd_2:
    dw Instruction_Common_Enemy0FB2_InY 
    dw Function_Torizo_Movement_Jumping_Falling 
    dw Instruction_Torizo_LinkInstructionInY 
    dw InstList_Torizo_FacingRight_JumpBackwards_LandLeftFootFwd_4 

InstList_Torizo_FacingRight_JumpBackwards_LandLeftFootFwd_3:
    dw $0005 
    dw ExtendedSpritemaps_Torizo_Jumping_Falling_FacingRight_1 
    dw Instruction_Common_GotoY 
    dw InstList_Torizo_FacingRight_JumpBackwards_LandLeftFootFwd_3 

InstList_Torizo_FacingRight_JumpBackwards_LandLeftFootFwd_4:
    dw Instruction_Torizo_PlayTorizoFootstepsSFX 
    dw Instruction_Torizo_SpawnTorizoLandingDustClouds 
    dw Instruction_Torizo_GotoY_IfFaceBlownUp_ElseGotoY2_IfGolden 
    dw InstList_Torizo_FacingRight_Faceless_Walking_RightLegMoving 
    dw InstList_GT_LandedFromBackwardsJump_FacingRight_LeftFootFwd 
    dw Instruction_Torizo_CallY_OrY2_ForBombTorizoAttack 
    dw InstList_Torizo_FacingRight_SpewingChozoOrbs_LeftFootFwd_0 
    dw InstList_Torizo_FacingRight_SonicBooms_LeftFootForward_0 
    dw Instruction_Common_GotoY 
    dw InstList_Torizo_FacingRight_Walking_RightLegMoving 

InstList_Torizo_FacingRight_Faceless_TurningRight:
    dw Instruction_Torizo_FunctionInY 
    dw Function_Torizo_SimpleMovement 
    dw Instruction_Torizo_SetTorizoTurningAroundFlag 
    dw $0008 
    dw ExtendedSpritemaps_Torizo_FacingScreen_Turning_Dodging 

InstList_Torizo_FacingRight_Faceless_Walking_LeftLegMoving:
    dw Instruction_Torizo_SetSteppedRightWithRightFootState 
    dw Instruction_Torizo_FunctionInY 
    dw Function_Torizo_NormalMovement 
    dw Instruction_Common_Enemy0FB2_InY 
    dw Function_Torizo_Movement_Walking 
    dw Instruction_Torizo_SpawnLowHealthInitialDroolIfHealthIsLow 
    dw Instruction_Torizo_PlayTorizoFootstepsSFX 
    dw $0001 
    dw ExtendedSpritemaps_Torizo_WalkingRight_LeftLegMoving_0 
    dw Instruction_Torizo_CallYIfSamusIsLessThan38PixelsInFront 
    dw InstList_Torizo_FacingRight_ExplosiveSwipe_RightFootForward 
    dw Instruction_Torizo_BTWalkingMovement_Faceless_IndexInY 
    dw $0016,$0005 
    dw ExtendedSpritemaps_Torizo_WalkingRight_LeftLegMoving_1 
    dw Instruction_Torizo_BTWalkingMovement_Faceless_IndexInY 
    dw $0018,$0005 
    dw ExtendedSpritemaps_Torizo_WalkingRight_LeftLegMoving_2 
    dw Instruction_Torizo_BTWalkingMovement_Faceless_IndexInY 
    dw $001A,$0005 
    dw ExtendedSpritemaps_Torizo_WalkingRight_LeftLegMoving_3 
    dw Instruction_Torizo_BTWalkingMovement_Faceless_IndexInY 
    dw $001C,$0005 
    dw ExtendedSpritemaps_Torizo_WalkingRight_LeftLegMoving_4 
    dw Instruction_Torizo_BTWalkingMovement_Faceless_IndexInY 
    dw $001E 

InstList_Torizo_FacingRight_Faceless_Walking_RightLegMoving:
    dw Instruction_Torizo_SetSteppedRightWithLeftFootState 
    dw Instruction_Torizo_FunctionInY 
    dw Function_Torizo_NormalMovement 
    dw Instruction_Common_Enemy0FB2_InY 
    dw Function_Torizo_Movement_Walking 
    dw Instruction_Torizo_SpawnLowHealthInitialDroolIfHealthIsLow 
    dw Instruction_Torizo_PlayTorizoFootstepsSFX 
    dw $0001 
    dw ExtendedSpritemaps_Torizo_WalkingRight_RightLegMoving_0 
    dw Instruction_Torizo_CallYIfSamusIsLessThan38PixelsInFront 
    dw InstList_Torizo_FacingRight_ExplosiveSwipe_LeftFootForward 
    dw Instruction_Torizo_BTWalkingMovement_Faceless_IndexInY 
    dw $0020,$0005 
    dw ExtendedSpritemaps_Torizo_WalkingRight_RightLegMoving_1 
    dw Instruction_Torizo_BTWalkingMovement_Faceless_IndexInY 
    dw $0022,$0005 
    dw ExtendedSpritemaps_Torizo_WalkingRight_RightLegMoving_2 
    dw Instruction_Torizo_BTWalkingMovement_Faceless_IndexInY 
    dw $0024,$0005 
    dw ExtendedSpritemaps_Torizo_WalkingRight_RightLegMoving_3 
    dw Instruction_Torizo_BTWalkingMovement_Faceless_IndexInY 
    dw $0026,$0005 
    dw ExtendedSpritemaps_Torizo_WalkingRight_RightLegMoving_4 
    dw Instruction_Torizo_BTWalkingMovement_Faceless_IndexInY 
    dw $0014 
    dw Instruction_Common_GotoY 
    dw InstList_Torizo_FacingRight_Faceless_Walking_LeftLegMoving 

MakeTorizoJumpForwards:
    LDA.W $0FB4,X 
    BMI .facingRight 
    LDA.W #$FE00 
    BRA + 


.facingRight:
    LDA.W #$0200 

  + STA.W $0FA8,X 
    LDA.W #$FA40 : STA.W $0FAA,X 
    LDA.W #$0028 : STA.W $0FAC,X 
    LDA.W #$0001 : STA.W $0F94,X 
    RTS 


MakeTorizoJumpBackwards:
    LDA.W $0FB4,X 
    BMI .facingRight 
    LDA.W #$0300 
    BRA + 


.facingRight:
    LDA.W #$FD00 

  + STA.W $0FA8,X 
    LDA.W #$FB80 : STA.W $0FAA,X 
    LDA.W #$0028 : STA.W $0FAC,X 
    LDA.W #$0001 : STA.W $0F94,X 
    RTS 


LoadInitialBombTorizoPalettes:
    PHX 
    LDX.W #$001E 

.loop:
    LDA.W Palette_Torizo_InitialBombTorizo_SpritePalette2,X : STA.L $7EC340,X 
    LDA.W Palette_Torizo_InitialBombTorizo_SpritePalette1,X : STA.L $7EC320,X 
    DEX #2
    BPL .loop 
    PLX 
    RTS 


LoadNormalTorizoTargetPalettes:
    PHX 
    LDX.W #$001E 

.loop:
    LDA.W Palette_Torizo_Normal_SpritePalette2,X : STA.L $7EC340,X 
    LDA.W Palette_Torizo_Normal_SpritePalette1,X : STA.L $7EC320,X 
    DEX #2
    BPL .loop 
    PLX 
    RTS 


LoadInitialGoldenTorizoPalettes:
    PHX 
    LDX.W #$001E 

.loop:
    LDA.W Palette_Torizo_InitialGoldenTorizo_SpritePalette2,X : STA.L $7EC340,X 
    LDA.W Palette_Torizo_InitialGoldenTorizo_SpritePalette1,X : STA.L $7EC320,X 
    DEX #2
    BPL .loop 
    PLX 
    RTS 


LoadGoldenTorizoPalettes:
    PHX 
    LDX.W #$001E 

.loop:
    LDA.W Palette_Torizo_GoldenTorizo_SpritePalette2,X : STA.L $7EC340,X 
    LDA.W Palette_Torizo_GoldenTorizo_SpritePalette1,X : STA.L $7EC320,X 
    DEX #2
    BPL .loop 
    PLX 
    RTS 


LoadNormalTorizoPalettes:
    PHX 
    LDX.W #$001E 

.loop:
    LDA.W Palette_Torizo_Normal_SpritePalette2,X : STA.L $7EC140,X 
    LDA.W Palette_Torizo_Normal_SpritePalette1,X : STA.L $7EC120,X 
    DEX #2
    BPL .loop 
    PLX 
    RTS 


RTL_AAC2C8:
    RTL 


Instruction_Torizo_SetAnimationLock:
    LDA.W #$7777 : STA.L $7E7808,X 
    RTL 


Instruction_Torizo_ClearAnimationLock:
    LDA.W #$0000 : STA.L $7E7808,X 
    RTL 


Instruction_Torizo_GotoY_IfFaceBlownUp_ElseGotoY2_IfGolden:
    BIT.W $0FB6,X 
    BVS .faceBlownUp 
    INY #2
    LDA.W $079F 
    BNE .faceBlownUp 
    INY #2
    RTL 


.faceBlownUp:
    LDA.W $0000,Y 
    TAY 
    RTL 


Instruction_Torizo_LinkInstructionInY:
    LDA.W $0000,Y : STA.L $7E7800,X 
    INY #2
    RTL 


Instruction_Torizo_Return:
    LDA.L $7E7800,X 
    TAY 
    RTL 


Instruction_Torizo_GotoGutExplosionLinkInstruction:
    LDA.L $7E7802,X 
    TAY 
    RTL 


Instruction_Torizo_Spawn5LowHealthExplosion_SleepFor28Frames:
    PHY 
    LDA.W $0000,Y 
    PHA 
    LDY.W #$0005 

.loop:
    PHY 
    LDA.B $03,S 
    LDY.W #EnemyProjectile_BombTorizoLowHealthExplosion 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    PLY 
    DEY 
    BPL .loop 
    PLA 
    PLY 
    INY #2
    TYA 
    STA.W $0F92,X 
    LDA.W #$0028 : STA.W $0F9C,X 
    STA.W $0F94,X 
    PLA 
    PEA.W ProcessEnemyInstructions_return-1 
    RTL 


Instruction_Torizo_SpawnTorizoDeathExplosion_SleepFor1IFrame:
    PHY 
    LDY.W #EnemyProjectile_BombTorizoDeathExplosion 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    PLY 
    TYA 
    STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F9C,X 
    STA.W $0F94,X 
    PLA 
    PEA.W ProcessEnemyInstructions_return-1 
    RTL 


Instruction_Torizo_SpawnTorizoLandingDustClouds:
    PHY 
    LDY.W #EnemyProjectile_TorizoLandingDustCloud_RightFoot 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    LDY.W #EnemyProjectile_TorizoLandingDustCloud_LeftFoot 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    PLY 
    RTL 


Instruction_Torizo_SpawnLowHealthInitialDroolIfHealthIsLow:
    LDA.W $0F8C,X 
    CMP.W #$015E 
    BCS .return 
    PHY 
    LDY.W #EnemyProjectile_BombTorizoInitialDrool 
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    PLY 

.return:
    RTL 


Instruction_Torizo_SetTorizoTurningAroundFlag:
    LDA.W $0FB4,X 
    ORA.W #$4000 
    STA.W $0FB4,X 
    RTL 


Instruction_Torizo_SetSteppedLeftWithLeftFootState:
    LDA.W $0FB4,X 
    AND.W #$1FFF 
    STA.W $0FB4,X 
    LDA.L $7E7812,X 
    INC A 
    STA.L $7E7812,X 
    RTL 


Instruction_Torizo_SetSteppedRightWithRightFootState:
    LDA.W $0FB4,X 
    AND.W #$1FFF 
    ORA.W #$8000 
    STA.W $0FB4,X 
    LDA.L $7E7812,X 
    INC A 
    STA.L $7E7812,X 
    RTL 


Instruction_Torizo_SetSteppedLeftWithRightFootState:
    LDA.W $0FB4,X 
    AND.W #$1FFF 
    ORA.W #$2000 
    STA.W $0FB4,X 
    LDA.L $7E7812,X 
    INC A 
    STA.L $7E7812,X 
    RTL 


Instruction_Torizo_SetSteppedRightWithLeftFootState:
    LDA.W $0FB4,X 
    AND.W #$1FFF 
    ORA.W #$A000 
    STA.W $0FB4,X 
    LDA.L $7E7812,X 
    INC A 
    STA.L $7E7812,X 
    RTL 


Instruction_Torizo_StandingUpMovement_IndexInY:
    PHY 
    LDA.W $0000,Y 
    TAY 
    LDA.W $0F7A,X 
    CLC 
    ADC.W .XVelocities,Y 
    STA.W $0F7A,X 
    TYA 
    AND.W #$000F 
    TAY 
    LDA.W $0F7E,X 
    CLC 
    ADC.W .YVelocities,Y 
    STA.W $0F7E,X 
    PLY 
    INY #2
    RTL 


.XVelocities:
    dw $FFF7,$FFFA,$FFF9,$0005,$FFF0,$FFF9,$0000,$0000 
    dw $0009,$0006,$0007,$FFFB,$0010,$0007,$0000,$0000 

.YVelocities:
    dw $0000,$FFFA,$FFFA,$FFF9,$0000,$0000,$0000,$0000 

Instruction_Torizo_SittingDownMovement_IndexInY:
    PHY 
    LDA.W $0000,Y 
    TAY 
    LDA.W $0F7A,X 
    SEC 
    SBC.W .negatedXVelocities,Y 
    STA.W $0F7A,X 
    TYA 
    AND.W #$000F 
    TAY 
    LDA.W $0F7E,X 
    SEC 
    SBC.W .negatedYVelocities,Y 
    STA.W $0F7E,X 
    PLY 
    INY #2
    RTL 


.negatedXVelocities:
    dw $FFF7,$FFFA,$FFF9,$0005,$FFF0,$FFF9,$0000,$0000 
    dw $0009,$0006,$0007,$FFFB,$0010,$0007,$0000,$0000 

.negatedYVelocities:
    dw $0000,$FFFA,$FFFA,$FFF9,$0000,$0000,$0000,$0000 

Instruction_Torizo_BombTorizoWalkingMovement_Normal_IndexInY:
    PHY 
    STZ.B $12 
    LDA.W $0000,Y 
    TAY 
    LDA.W .velocities,Y : STA.B $14 
    STA.W $0FA8,X 
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes 
    PLY 
    BCC .noCollision 
    LDA.W #$0000 : STA.L $7E7806,X 
    LDA.W $0FB4,X 
    BMI .turningLeft 
    LDY.W #InstList_Torizo_FacingRight_TurningRight 
    RTL 


.turningLeft:
    LDY.W #InstList_Torizo_FacingLeft_TurningLeft 
    RTL 


.noCollision:
    JSL.L AlignEnemyYPositionWIthNonSquareSlope 
    LDA.W $0AF6 
    SEC 
    SBC.W $0F7A,X 
    EOR.W $0FB4,X 
    BPL .facingAway 
    INY #2
    RTL 


.facingAway:
    LDA.L $7E7806,X 
    BNE .return 
    LDA.W #$0048 : STA.L $7E7806,X 

.return:
    INY #2
    RTL 


.velocities:
    dw $FFFB,$0000,$FFFB,$FFED,$FFF0,$FFF9,$0000,$FFF9 
    dw $FFEF,$FFEE,$0005,$0000,$0005,$0013,$0010,$0007 
    dw $0000,$0007,$0011,$0012 

Instruction_Torizo_BTWalkingMovement_Faceless_IndexInY:
    PHY 
    STZ.B $12 
    LDA.W $0000,Y 
    TAY 
    LDA.W .velocities,Y : STA.B $14 
    STA.W $0FA8,X 
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes 
    PLY 
    BCC .noCollision 
    LDA.W #$0000 : STA.L $7E7806,X 
    LDA.W $0FB4,X 
    BMI .turningLeft 
    LDY.W #InstList_Torizo_FacingRight_Faceless_TurningRight 
    RTL 


.turningLeft:
    LDY.W #InstList_Torizo_FacingLeft_Faceless_TurningLeft 
    RTL 


.noCollision:
    JSL.L AlignEnemyYPositionWIthNonSquareSlope 
    LDA.W $0AF6 
    SEC 
    SBC.W $0F7A,X 
    EOR.W $0FB4,X 
    BPL .facingAway 
    INY #2
    RTL 


.facingAway:
    LDA.L $7E7806,X 
    BNE .return 
    LDA.W #$0048 : STA.L $7E7806,X 

.return:
    INY #2
    RTL 


.velocities:
    dw $FFFB,$0000,$FFFB,$FFED,$FFF0,$FFF9,$0000,$FFF9 
    dw $FFEF,$FFEE,$0005,$0000,$0005,$0013,$0010,$0007 
    dw $0000,$0007,$0011,$0012 

Instruction_Torizo_GotoY_IfRising:
    LDA.W $0FAA,X 
    BMI .rising 
    INY #2
    RTL 


.rising:
    LDA.W $0000,Y 
    TAY 
    RTL 


Instruction_Torizo_CallYIfSamusIsLessThan38PixelsInFront:
    LDA.W #$0038 
    JSL.L CheckIfXDistanceBetweenEnemyAndSamusIsAtLeastA 
    BCC .near 

.return:
    INY #2
    RTL 


.near:
    LDA.W $0AF6 
    SEC 
    SBC.W $0F7A,X 
    EOR.W $0FB4,X 
    BPL .return 
    TYA 
    INC #2
    STA.L $7E7800,X 
    LDA.W $0000,Y 
    TAY 
    RTL 


Instruction_Torizo_GotoYAndJumpBackwardsIfLessThan20Pixels:
    LDA.W #$0020 
    JSL.L CheckIfXDistanceBetweenEnemyAndSamusIsAtLeastA 
    BCS .return 
    JSR.W CheckIfTorizoIsFacingSamus 
    BMI .return 
    JSR.W MakeTorizoJumpBackwards 
    LDA.W $0000,Y 
    TAY 
    RTL 


.return:
    INY #2
    RTL 


Instruction_Torizo_CallY_OrY2_ForBombTorizoAttack:
    TYA 
    INC #4
    STA.L $7E7800,X 
    LDA.W $09C6 
    CMP.W #$0005 
    BCC .spewOrbs 
    LDA.W $0AF6 
    LSR A 
    ADC.W $05B6 
    BIT.W #$0008 
    BEQ .sonicBooms 

.spewOrbs:
    LDA.W $0000,Y 
    BRA .return 


.sonicBooms:
    LDA.W $0002,Y 

.return:
    TAY 
    RTL 


Instruction_Torizo_SpawnBombTorizosChozoOrbs:
    PHY 
    LDY.W #EnemyProjectile_BombTorizoChozoOrbs 
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    LDY.W #EnemyProjectile_BombTorizoChozoOrbs 
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    LDY.W #EnemyProjectile_BombTorizoChozoOrbs 
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    PLY 
    RTL 


Instruction_Torizo_SpawnBombTorizoSonicBoomWithParameterY:
    PHY 
    LDA.W $0000,Y 
    LDY.W #EnemyProjectile_BombTorizoSonicBoom 
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    PLY 
    INY #2
    RTL 


Instruction_Torizo_SpawnGoldenTorizoSonicBoomWithParameterY:
    PHY 
    LDA.W $0000,Y 
    LDY.W #EnemyProjectile_GoldenTorizoSonicBoom 
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    PLY 
    INY #2
    RTL 


Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY:
    PHY 
    LDA.W $0000,Y 
    LDY.W #EnemyProjectile_BombTorizoExplosiveSwipe 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    PLY 
    INY #2
    RTL 


Instruction_Torizo_PlayShotTorizoSFX:
    LDA.W #$0027 
    JSL.L QueueSound_Lib2_Max6 
    RTL 


Instruction_Torizo_PlayTorizoFootstepsSFX:
    LDA.W #$004B 
    JSL.L QueueSound_Lib2_Max6 
    RTL 


HandleLowHealthInitialDrool:
    LDA.W $079F 
    BEQ .crateria 
    JMP.W .returnNotCrateria ; >.<


.crateria:
    LDA.W $05E5 
    AND.W #$8142 ; If [random number] & 8142h = 0: (1/16 chance)
    BNE .return 
    LDA.W $0F8C,X 
    BEQ .return 
    CMP.W #$015E 
    BCS .return 
    LDY.W #EnemyProjectile_BombTorizoInitialDrool 
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 

.return:
    RTS 


.returnNotCrateria:
    RTS ; >.<


HandleFalling:
    STZ.B $12 
    STZ.B $14 
    LDA.W $0FAA,X 
    BPL + 
    DEC.B $14 

  + STA.B $13 
    JSL.L MoveEnemyDownBy_14_12 
    BCS .collision 
    LDA.W $0FAA,X 
    CLC 
    ADC.W #$0028 
    STA.W $0FAA,X 
    RTS 


.collision:
    LDA.W $0FAA,X 
    BMI .return 
    CMP.W #$0100 
    BEQ .return 
    LDA.W #$0004 : STA.W $183E 
    LDA.W #$0020 : STA.W $1840 
    LDA.W #$0100 : STA.W $0FAA,X 

.return:
    RTS 


HurtAI_BombTorizo:
    LDX.W $0E54 
    JSR.W HandleLowHealthInitialDrool 
    LDA.W $0F9C,X 
    LSR A 
    BCS .flash 
    JSR.W LoadNormalTorizoPalettes 
    BRA .return 


.flash:
    PHX 
    LDX.W #$001E 

.loop:
    LDA.W #$7FFF : STA.L $7EC140,X 
    STA.L $7EC120,X 
    DEX #2
    BPL .loop 
    PLX 

.return:
    RTL 


MainAI_BombTorizo:
    LDX.W $0E54 
    JSR.W ($0FB0,X) 
    RTL 


RTS_AAC6AB:
    RTS 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Torizo_AAC6AC:
    JSR.W HandleFalling 
    LDA.W #$0600 
    JSL.L Advance_GradualColorChange_ofPalettesInA_Denominator_C 
    BCS .return 
    LDA.W #RTS_AAC6AB : STA.W $0FB0,X 

.return:
    RTS 
endif ; !FEATURE_KEEP_UNREFERENCED


Function_Torizo_SimpleMovement:
    JSR.W HandleLowHealthInitialDrool 
    JSR.W HandleFalling 
    RTS 


Function_Torizo_WakeWhenBombTorizoChozoFinishesCrumbling:
    LDA.W $0F86,X 
    ORA.W #$0400 
    STA.W $0F86,X 
    PHX 
    LDX.W #$004E 

.loop:
    LDA.W $1C37,X 
    CMP.W #PLMEntries_BombTorizosCrumblingChozo 
    BEQ .return 
    DEX #2
    BPL .loop 
    PLX 
    LDA.W TorizoMusicTracks_song1 
    JSL.L QueueMusicDataOrTrack_8FrameDelay 
    LDA.W $0F86,X 
    AND.W #$FBFF 
    STA.W $0F86,X 
    INC.W $0F92,X 
    INC.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    RTS 


.return:
    PLX 
    RTS 


Function_Torizo_NormalMovement:
    JSR.W HandleLowHealthInitialDrool 
    BIT.W $0FB6,X 
    BMI .notLowHealth 
    LDA.W $0F8C,X 
    CMP.W #$015E 
    BCS .notLowHealth 
    LDA.W $0F92,X : STA.L $7E7802,X 
    LDA.W #InstList_Torizo_SpecialCallable_BlowUpBombTorizosGut : STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    RTS 


.notLowHealth:
    BIT.W $0FB6,X 
    BVS .noChange 
    LDA.W $0F8C,X 
    CMP.W #$0064 
    BCS .noChange 
    LDA.W $0FB4,X 
    BMI .facingRight 
    LDA.W #InstList_Torizo_FacingRight_Faceless_TurningRight 
    BRA + 


.facingRight:
    LDA.W #InstList_Torizo_FacingLeft_Faceless_TurningLeft 

  + STA.L $7E7800,X 
    LDA.W #InstList_Torizo_Callable_BlowUpBombTorizosFace : STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    RTS 


.noChange:
    JSR.W ($0FB2,X) 
    RTS 


Function_Torizo_Movement_Walking:
    BIT.W $0FB6,X 
    BVC .notFaceless 
    JMP.W .faceless 


.notFaceless:
    LDA.L $7E7806,X 
    BEQ .notTurning 
    DEC A 
    STA.L $7E7806,X 
    BNE .notTurning 
    LDA.W #$0000 : STA.L $7E7806,X 
    LDA.W $0FB4,X 
    BMI .facingRight 
    LDA.W #InstList_Torizo_FacingRight_TurningRight 
    BRA + 


.facingRight:
    LDA.W #InstList_Torizo_FacingLeft_TurningLeft 

  + STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    RTS 


.notTurning:
    STZ.B $12 
    LDA.W $0FA8,X 
    BPL + 
    EOR.W #$FFFF 
    INC A 

  + INC A 
    CMP.W #$0010 
    BCC + 
    LDA.W #$000F 

  + STA.B $14 
    JSL.L MoveEnemyDownBy_14_12 
    BCS .returnUpper 
    LDA.W $0FB4,X 
    BMI ..facingRight 
    LDA.W #InstList_Torizo_FacingLeft_Falling_0 
    BRA + 


..facingRight:
    LDA.W #InstList_Torizo_FacingRight_Falling_0 

  + STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    LDA.W #$0100 : STA.W $0FAA,X 
    STZ.W $0FA8,X 

.returnUpper:
    RTS 


.faceless:
    LDA.L $7E7806,X 
    BEQ .facelessNotTurning 
    DEC A 
    STA.L $7E7806,X 
    BNE .facelessNotTurning 
    LDA.W #$0000 : STA.L $7E7806,X 
    LDA.W $0FB4,X 
    BMI ..facingRight 
    LDA.W #InstList_Torizo_FacingRight_Faceless_TurningRight 
    BRA + 


..facingRight:
    LDA.W #InstList_Torizo_FacingLeft_Faceless_TurningLeft 

  + STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    RTS 


.facelessNotTurning:
    STZ.B $12 
    LDA.W $0FA8,X 
    BPL + 
    EOR.W #$FFFF 
    INC A 

  + INC A 
    CMP.W #$0010 
    BCC + 
    LDA.W #$000F 

  + STA.B $14 
    JSL.L MoveEnemyDownBy_14_12 
    BCS .returnLower 
    LDA.W $0FB4,X 
    BMI ..facingRight 
    LDA.W #InstList_Torizo_FacingLeft_Falling_0 
    BRA + 


..facingRight:
    LDA.W #InstList_Torizo_FacingRight_Falling_0 

  + STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    LDA.W #$0100 : STA.W $0FAA,X 
    STZ.W $0FA8,X 

.returnLower:
    RTS 


Function_Torizo_Movement_Attacking:
    JSR.W HandleFalling 
    RTS 


Function_Torizo_Movement_Jumping_Falling:
    STZ.B $12 
    STZ.B $14 
    LDA.W $0FA8,X 
    BPL + 
    DEC.B $14 

  + STA.B $13 
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes 
    JSL.L AlignEnemyYPositionWIthNonSquareSlope 
    STZ.B $12 
    STZ.B $14 
    LDA.W $0FAA,X 
    BPL + 
    DEC.B $14 

  + STA.B $13 
    JSL.L MoveEnemyDownBy_14_12 
    BCS .collision 
    LDA.W $0FAA,X 
    CLC 
    ADC.W $0FAC,X 
    STA.W $0FAA,X 
    RTS 


.collision:
    LDA.L $7E7800,X : STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    LDA.W #$0100 : STA.W $0FAA,X 
    LDA.W #$0004 : STA.W $183E 
    LDA.W #$0020 : STA.W $1840 
    RTS 


InitAI_Torizo:
    LDA.W #$0004 
    JSL.L CheckIfBossBitsForCurrentAreaMatchAnyBitsInA 
    BCC .notDead 
    LDX.W $0E54 
    LDA.W $0F86,X 
    ORA.W #$0200 
    STA.W $0F86,X 
    RTL 


.notDead:
    LDY.W $079F 
    LDX.W $0E54 
    LDA.W $0F86,X 
    ORA.W TorizoInitial_properties,Y 
    STA.W $0F86,X 
    LDA.W $0F88,X 
    ORA.W #$0004 
    STA.W $0F88,X 
    LDA.W TorizoInitial_XRadius,Y : STA.W $0F82,X 
    LDA.W TorizoInitial_YRadius,Y : STA.W $0F84,X 
    LDA.W #Function_Torizo_SimpleMovement : STA.W $0FB0,X 
    LDA.W #$0001 : STA.W $0F94,X 
    STZ.W $0F90,X 
    STZ.W $0F96,X 
    LDA.W #RTS_AAC95E : STA.W $0FB2,X 
    LDA.W TorizoInitial_instListPointer,Y : STA.W $0F92,X 
    LDA.W #ExtendedSpritemap_Torizo_Blank : STA.W $0F8E,X 
    LDA.W TorizoInitial_XPosition,Y : STA.W $0F7A,X 
    LDA.W TorizoInitial_YPosition,Y : STA.W $0F7E,X 
    STZ.W $0FA8,X 
    LDA.W #$0100 : STA.W $0FAA,X 
    LDX.W #$001E 

.loopTargetPalettes:
    LDA.W Palette_Torizo_BombTorizoStatue,X : STA.L $7EC3E0,X 
    LDA.W Palette_Torizo_OrbProjectile,X : STA.L $7EC360,X 
    DEX #2
    BPL .loopTargetPalettes 
    LDA.W $079F 
    BNE .GTCode 
    JSR.W LoadInitialBombTorizoPalettes 
    JSL.L Spawn_BombTorizoHaze 
    RTL 


.GTCode:
    JSR.W LoadInitialGoldenTorizoPalettes 
    LDA.B $8B 
    CMP.W #$C0C0 ; ABXY inputs
    BNE .return 
    LDA.W #$02BC : STA.W $09C2 
    STA.W $09C4 
    LDA.W #$012C : STA.W $09D4 
    STA.W $09D6 
    LDA.W #$0064 : STA.W $09C6 
    STA.W $09C8 
    LDA.W #$0014 : STA.W $09CA 
    STA.W $09CC 
    LDA.W #$0014 : STA.W $09CE 
    STA.W $09D0 
    LDA.W #$F337 : STA.W $09A2 
    STA.W $09A4 
    LDA.W #$100F : STA.W $09A6 
    STA.W $09A8 

.return:
    RTL 


RTS_AAC95E:
    RTS 


TorizoInitial_XPosition:
    dw $00DB,$01A8 

TorizoInitial_YPosition:
    dw $00B3,$0090 

TorizoInitial_instListPointer:
    dw InstList_Torizo_BombTorizo_Initial_0 
    dw InstList_GoldenTorizo_Initial_0 

TorizoInitial_properties:
    dw $2800,$2800 

TorizoInitial_XRadius:
    dw $0012,$0012 

TorizoInitial_YRadius:
    dw $0030,$0029 

EnemyTouch_Torizo:
    JSL.L NormalEnemyTouchAI_NoDeathCheck_External 
    RTL 


EnemyShot_Torizo_Normal:
    LDA.W $079F 
    BEQ .crateria 
    JMP.W ShotReaction_GoldenTorizo_Normal 


.crateria:
    LDX.W $0E54 
    LDA.W $0F9C,X 
    ORA.L $7E7808,X 
    BNE .return 
    JSL.L NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External 
    LDX.W $0E54 
    LDA.W $0F8C,X 
    BNE .return 
    LDA.W #RTS_AAC6AB : STA.W $0FB0,X 
    LDA.W #InstList_Torizo_DeathSequence_0 : STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    LDA.W $0FB6,X 
    ORA.W #$C000 
    STA.W $0FB6,X 
    LDA.W $0F86,X 
    ORA.W #$0400 
    STA.W $0F86,X 

.return:
    RTL 


RTL_AAC9C1:
    RTL 


EnemyShot_Torizo_StandUp_SitDown:
    LDA.W $079F 
    BEQ .return 
    JMP.W ShotReaction_GoldenTorizo_StandUp_SitDown 


.return:
    RTL 


InstList_GoldenTorizo_Initial_0:
    dw Instruction_Common_TransferYBytesInYToVRAM 
    dw $0600 
    dl Tiles_GoldenTorizoEgg 
    dw $6D00 
    dw Instruction_Torizo_SetSteppedLeftWithRightFootState 
    dw Instruction_Torizo_SetAnimationLock 
    dw Instruction_Torizo_FunctionInY 
    dw Function_GoldenTorizo_WakeIfSamusIsBelowAndRightOfTargetPos 
    dw $0001 
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_3 
    dw Instruction_Common_Sleep 
    dw Instruction_Torizo_FunctionInY 
    dw Function_Torizo_SimpleMovement 

InstList_GoldenTorizo_Initial_1:
    dw $0001 
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_3 
    dw Instruction_Torizo_GotoY_IfNotHitGround 
    dw InstList_GoldenTorizo_Initial_1 
    dw Instruction_Torizo_PlayTorizoFootstepsSFX 
    dw $0003 
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_3 
    dw Instruction_Torizo_SittingDownMovement_IndexInY 
    dw $0004,$0004 
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_2 
    dw Instruction_Torizo_SittingDownMovement_IndexInY 
    dw $0002,$0005 
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_1 
    dw Instruction_Torizo_SittingDownMovement_IndexInY 
    dw $0000 
    dw Instruction_Torizo_FunctionInY 
    dw RTS_AAC6AB 
    dw $0030 
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_0 
    dw Instruction_Common_TransferYBytesInYToVRAM 
    dw $0040 
    dl Tiles_Torizo 
    dw $7D80,$0020 
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_0 
    dw Instruction_Common_TransferYBytesInYToVRAM 
    dw $0040 
    dl Tiles_Torizo_AAB2B9 
    dw $7D80,$0010 
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_0 
    dw Instruction_Common_TransferYBytesInYToVRAM 
    dw $0040 
    dl Tiles_Torizo_AAB2F9 
    dw $7D80,$0008 
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_0 
    dw Instruction_Common_TransferYBytesInYToVRAM 
    dw $0040 
    dl Tiles_Torizo_AAB339 
    dw $7D80,$0020 
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_0 
    dw Instruction_Common_TimerInY 
    dw $0002 

InstList_GoldenTorizo_Initial_2:
    dw $0004 
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_0 
    dw Instruction_Common_TransferYBytesInYToVRAM 
    dw $0040 
    dl Tiles_Torizo 
    dw $7D80,$0004 
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_0 
    dw Instruction_Common_TransferYBytesInYToVRAM 
    dw $0040 
    dl Tiles_Torizo_AAB2B9 
    dw $7D80,$0004 
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_0 
    dw Instruction_Common_TransferYBytesInYToVRAM 
    dw $0040 
    dl Tiles_Torizo_AAB2F9 
    dw $7D80,$0004 
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_0 
    dw Instruction_Common_TransferYBytesInYToVRAM 
    dw $0040 
    dl Tiles_Torizo_AAB339 
    dw $7D80 
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate 
    dw InstList_GoldenTorizo_Initial_2 
    dw $0020 
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_0 
    dw Instruction_Torizo_StandingUpMovement_IndexInY 
    dw $0000,$000C 
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_1 
    dw Instruction_Torizo_StandingUpMovement_IndexInY 
    dw $0002,$0008 
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_2 
    dw Instruction_Torizo_StandingUpMovement_IndexInY 
    dw $0004,$0008 
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_3 
    dw Instruction_Torizo_StandingUpMovement_IndexInY 
    dw $0006,$0008 
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_4 
    dw Instruction_Torizo_StandingUpMovement_IndexInY 
    dw $0008,$0008 
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_5 
    dw Instruction_Torizo_StandingUpMovement_IndexInY 
    dw $000A 
    dw Instruction_Torizo_LoadGoldenTorizoPalettes 
    dw Instruction_Common_TimerInY 
    dw $0010 

InstList_GoldenTorizo_Initial_3:
    dw $0004 
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_6 
    dw Instruction_Torizo_AdvanceGradualColorChange 
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate 
    dw InstList_GoldenTorizo_Initial_3 
    dw RTL_AAC2C8 
    dw Instruction_Torizo_ClearAnimationLock 
    dw Inst_Torizo_StartFightMusic_GoldenTorizoBellyPaletteFX 
    dw $0010 
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_6 
    dw Instruction_Common_GotoY 
    dw InstList_GoldenTorizo_WalkingLeft_LeftLegMoving 

Instruction_Torizo_GotoY_IfNotHitGround:
    LDA.W $0F7E,X 
    CMP.W #$0177 
    BEQ .notHitGround 
    LDA.W $0000,Y 
    TAY 
    RTL 


.notHitGround:
    INY #2
    RTL 


Instruction_Torizo_LoadGoldenTorizoPalettes:
    JSR.W LoadGoldenTorizoPalettes 
    RTL 


Inst_Torizo_StartFightMusic_GoldenTorizoBellyPaletteFX:
    LDA.W #$0005 
    JSL.L QueueMusicDataOrTrack_8FrameDelay 
    LDA.W #$0012 : STA.W $0F82,X 
    LDA.W #$0030 : STA.W $0F84,X 
    PHY 
    LDY.W #PaletteFXObjects_GoldenTorizoBelly 
    JSL.L Spawn_PaletteFXObject 
    PLY 
    RTL 


InstList_GoldenTorizo_SpewChozoOrbs_FaceLeft_RightFootFwd_0:
    dw Instruction_Common_Enemy0FB2_InY 
    dw Function_GoldenTorizo_Movement_Attacking 
    dw $0006 
    dw ExtendedSpritemaps_Torizo_Attacks_FaceLeft_RightFootForward 
    dw $0003 
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_RightFootForward_0 
    dw $0003 
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_RightFootForward_1 
    dw $0003 
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_RightFootForward_2 
    dw $0003 
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_RightFootForward_3 
    dw $0006 
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_RightFootForward_4 
    dw Instruction_Common_TimerInY 
    dw $0006 

InstList_GoldenTorizo_SpewChozoOrbs_FaceLeft_RightFootFwd_1:
    dw Instruction_Torizo_PlayShotTorizoSFX 
    dw Instruction_GoldenTorizo_SpawnChozoOrbs 
    dw Instruction_Common_WaitYFrames 
    dw $0006 
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate 
    dw InstList_GoldenTorizo_SpewChozoOrbs_FaceLeft_RightFootFwd_1 
    dw $0003 
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_RightFootForward_3 
    dw $0003 
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_RightFootForward_2 
    dw $0003 
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_RightFootForward_1 
    dw $0003 
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_RightFootForward_0 
    dw Instruction_Common_Enemy0FB2_InY 
    dw Function_GoldenTorizo_Movement_Walking 
    dw Instruction_Torizo_Return 

InstList_GoldenTorizo_SpewChozoOrbs_FacingLeft_LeftFootFwd_0:
    dw Instruction_Common_Enemy0FB2_InY 
    dw Function_GoldenTorizo_Movement_Attacking 
    dw $0006 
    dw ExtendedSpritemaps_Torizo_Attacks_FaceLeft_LeftFootForward 
    dw $0003 
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_LeftFootForward_0 
    dw $0003 
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_LeftFootForward_1 
    dw $0003 
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_LeftFootForward_2 
    dw $0003 
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_LeftFootForward_3 
    dw $0006 
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_LeftFootForward_4 
    dw Instruction_Common_TimerInY 
    dw $0006 

InstList_GoldenTorizo_SpewChozoOrbs_FacingLeft_LeftFootFwd_1:
    dw Instruction_Torizo_PlayShotTorizoSFX 
    dw Instruction_GoldenTorizo_SpawnChozoOrbs 
    dw Instruction_Common_WaitYFrames 
    dw $0006 
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate 
    dw InstList_GoldenTorizo_SpewChozoOrbs_FacingLeft_LeftFootFwd_1 
    dw $0003 
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_LeftFootForward_3 
    dw $0003 
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_LeftFootForward_2 
    dw $0003 
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_LeftFootForward_1 
    dw $0003 
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_LeftFootForward_0 
    dw Instruction_Common_Enemy0FB2_InY 
    dw Function_GoldenTorizo_Movement_Walking 
    dw Instruction_Torizo_Return 

InstList_GoldenTorizo_SonicBooms_FacingLeft_RightFootFwd_0:
    dw Instruction_Common_Enemy0FB2_InY 
    dw Function_GoldenTorizo_Movement_Attacking 
    dw Instruction_Common_TimerInY 
    dw $0004 

InstList_GoldenTorizo_SonicBooms_FacingLeft_RightFootFwd_1:
    dw $0003 
    dw ExtendedSpritemaps_Torizo_Attacks_FaceLeft_RightFootForward 
    dw $0003 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_0 
    dw $0003 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_1 
    dw $0003 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_2 
    dw $0003 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_3 
    dw $0003 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_4 
    dw $0001 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_3 
    dw $0001 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_2 
    dw Instruction_Torizo_SpawnGoldenTorizoSonicBoomWithParameterY 
    dw $0000,$0001 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_1 
    dw $0004 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_0 
    dw $0003 
    dw ExtendedSpritemaps_Torizo_Attacks_FaceLeft_RightFootForward 
    dw $0003 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_5 
    dw $0003 
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_RightFootForward_0 
    dw $0003 
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_RightFootForward_1 
    dw $0003 
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_RightFootForward_2 
    dw $0003 
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_RightFootForward_3 
    dw $0001 
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_RightFootForward_2 
    dw $0001 
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_RightFootForward_1 
    dw Instruction_Torizo_SpawnGoldenTorizoSonicBoomWithParameterY 
    dw $0001,$0001 
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_RightFootForward_0 
    dw $0004 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_5 
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate 
    dw InstList_GoldenTorizo_SonicBooms_FacingLeft_RightFootFwd_1 
    dw Instruction_Common_Enemy0FB2_InY 
    dw Function_GoldenTorizo_Movement_Walking 
    dw Instruction_Torizo_Return 

InstList_GoldenTorizo_SonicBooms_FacingLeft_LeftFootFwd_0:
    dw Instruction_Common_Enemy0FB2_InY 
    dw Function_GoldenTorizo_Movement_Attacking 
    dw Instruction_Common_TimerInY 
    dw $0004 

InstList_GoldenTorizo_SonicBooms_FacingLeft_LeftFootFwd_1:
    dw $0003 
    dw ExtendedSpritemaps_Torizo_Attacks_FaceLeft_LeftFootForward 
    dw $0003 
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_0 
    dw $0003 
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_1 
    dw $0003 
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_2 
    dw $0003 
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_3 
    dw $0003 
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_4 
    dw $0001 
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_3 
    dw $0001 
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_2 
    dw Instruction_Torizo_SpawnGoldenTorizoSonicBoomWithParameterY 
    dw $0000,$0001 
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_1 
    dw $0004 
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_0 
    dw $0003 
    dw ExtendedSpritemaps_Torizo_Attacks_FaceLeft_LeftFootForward 
    dw $0003 
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_5 
    dw $0003 
    dw ExtSpritemap_Torizo_SonicBoom_Swipe_FaceLeft_LeftFootFwd_0 
    dw $0003 
    dw ExtSpritemap_Torizo_SonicBoom_Swipe_FaceLeft_LeftFootFwd_1 
    dw $0003 
    dw ExtSpritemap_Torizo_SonicBoom_Swipe_FaceLeft_LeftFootFwd_2 
    dw $0003 
    dw ExtSpritemap_Torizo_SonicBoom_Swipe_FaceLeft_LeftFootFwd_3 
    dw $0001 
    dw ExtSpritemap_Torizo_SonicBoom_Swipe_FaceLeft_LeftFootFwd_2 
    dw $0001 
    dw ExtSpritemap_Torizo_SonicBoom_Swipe_FaceLeft_LeftFootFwd_1 
    dw Instruction_Torizo_SpawnGoldenTorizoSonicBoomWithParameterY 
    dw $0001,$0001 
    dw ExtSpritemap_Torizo_SonicBoom_Swipe_FaceLeft_LeftFootFwd_0 
    dw $0004 
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_5 
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate 
    dw InstList_GoldenTorizo_SonicBooms_FacingLeft_LeftFootFwd_1 
    dw Instruction_Common_Enemy0FB2_InY 
    dw Function_GoldenTorizo_Movement_Walking 
    dw Instruction_Torizo_Return 

InstList_GoldenTorizo_SpewChozoOrb_FacingLeft_LeftFootFwd_0:
    dw Instruction_Common_Enemy0FB2_InY 
    dw Function_GoldenTorizo_Movement_Attacking 
    dw $0006 
    dw ExtendedSpritemaps_Torizo_Attacks_FaceRight_LeftFootForward 
    dw $0003 
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_LeftFootForward_0 
    dw $0003 
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_LeftFootForward_1 
    dw $0003 
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_LeftFootForward_2 
    dw $0003 
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_LeftFootForward_3 
    dw $0006 
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_LeftFootForward_4 
    dw Instruction_Common_TimerInY 
    dw $0006 

InstList_GoldenTorizo_SpewChozoOrb_FacingLeft_LeftFootFwd_1:
    dw Instruction_Torizo_PlayShotTorizoSFX 
    dw Instruction_GoldenTorizo_SpawnChozoOrbs 
    dw Instruction_Common_WaitYFrames 
    dw $0006 
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate 
    dw InstList_GoldenTorizo_SpewChozoOrb_FacingLeft_LeftFootFwd_1 
    dw $0003 
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_LeftFootForward_3 
    dw $0003 
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_LeftFootForward_2 
    dw $0003 
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_LeftFootForward_1 
    dw $0003 
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_LeftFootForward_0 
    dw Instruction_Common_Enemy0FB2_InY 
    dw Function_GoldenTorizo_Movement_Walking 
    dw Instruction_Torizo_Return 

InstList_GoldenTorizo_SpewChozoOrb_FacingLeft_RightFootFwd_0:
    dw Instruction_Common_Enemy0FB2_InY 
    dw Function_GoldenTorizo_Movement_Attacking 
    dw $0006 
    dw ExtendedSpritemaps_Torizo_Attacks_FaceRight_RightFootForward 
    dw $0003 
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_RightFootForward_0 
    dw $0003 
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_RightFootForward_1 
    dw $0003 
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_RightFootForward_2 
    dw $0003 
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_RightFootForward_3 
    dw $0006 
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_RightFootForward_4 
    dw Instruction_Common_TimerInY 
    dw $0006 

InstList_GoldenTorizo_SpewChozoOrb_FacingLeft_RightFootFwd_1:
    dw Instruction_Torizo_PlayShotTorizoSFX 
    dw Instruction_GoldenTorizo_SpawnChozoOrbs 
    dw Instruction_Common_WaitYFrames 
    dw $0006 
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate 
    dw InstList_GoldenTorizo_SpewChozoOrb_FacingLeft_RightFootFwd_1 
    dw $0003 
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_RightFootForward_3 
    dw $0003 
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_RightFootForward_2 
    dw $0003 
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_RightFootForward_1 
    dw $0003 
    dw ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_RightFootForward_0 
    dw Instruction_Common_Enemy0FB2_InY 
    dw Function_GoldenTorizo_Movement_Walking 
    dw Instruction_Torizo_Return 

InstList_GoldenTorizo_SonicBooms_FacingRight_LeftFootFwd_0:
    dw Instruction_Common_Enemy0FB2_InY 
    dw Function_GoldenTorizo_Movement_Attacking 
    dw Instruction_Common_TimerInY 
    dw $0004 

InstList_GoldenTorizo_SonicBooms_FacingRight_LeftFootFwd_1:
    dw $0003 
    dw ExtendedSpritemaps_Torizo_Attacks_FaceRight_LeftFootForward 
    dw $0003 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_0 
    dw $0003 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_1 
    dw $0003 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_2 
    dw $0003 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_3 
    dw $0003 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_4 
    dw $0001 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_3 
    dw $0001 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_2 
    dw Instruction_Torizo_SpawnGoldenTorizoSonicBoomWithParameterY 
    dw $0000,$0001 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_1 
    dw $0004 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_0 
    dw $0003 
    dw ExtendedSpritemaps_Torizo_Attacks_FaceRight_LeftFootForward 
    dw $0003 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_5 
    dw $0003 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_6 
    dw $0003 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_7 
    dw $0003 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_8 
    dw $0003 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_9 
    dw $0001 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_8 
    dw $0001 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_7 
    dw Instruction_Torizo_SpawnGoldenTorizoSonicBoomWithParameterY 
    dw $0001,$0001 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_6 
    dw $0004 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_5 
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate 
    dw InstList_GoldenTorizo_SonicBooms_FacingRight_LeftFootFwd_1 
    dw Instruction_Common_Enemy0FB2_InY 
    dw Function_GoldenTorizo_Movement_Walking 
    dw Instruction_Torizo_Return 

InstList_GoldenTorizo_SonicBooms_FacingRight_RightFootFwd_0:
    dw Instruction_Common_Enemy0FB2_InY 
    dw Function_GoldenTorizo_Movement_Attacking 
    dw Instruction_Common_TimerInY 
    dw $0004 

InstList_GoldenTorizo_SonicBooms_FacingRight_RightFootFwd_1:
    dw $0003 
    dw ExtendedSpritemaps_Torizo_Attacks_FaceRight_RightFootForward 
    dw $0003 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_0 
    dw $0003 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_1 
    dw $0003 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_2 
    dw $0003 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_3 
    dw $0003 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_4 
    dw $0001 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_3 
    dw $0001 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_2 
    dw Instruction_Torizo_SpawnGoldenTorizoSonicBoomWithParameterY 
    dw $0000,$0001 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_1 
    dw $0004 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_0 
    dw $0003 
    dw ExtendedSpritemaps_Torizo_Attacks_FaceRight_RightFootForward 
    dw $0003 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_5 
    dw $0003 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_6 
    dw $0003 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_7 
    dw $0003 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_8 
    dw $0003 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_9 
    dw $0001 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_8 
    dw $0001 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_7 
    dw Instruction_Torizo_SpawnGoldenTorizoSonicBoomWithParameterY 
    dw $0001,$0001 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_6 
    dw $0004 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_5 
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate 
    dw InstList_GoldenTorizo_SonicBooms_FacingRight_RightFootFwd_1 
    dw Instruction_Common_Enemy0FB2_InY 
    dw Function_GoldenTorizo_Movement_Walking 
    dw Instruction_Torizo_Return 

InstList_GT_LandedFromBackwardsJump_FacingLeft_LeftFootFwd:
    dw Instruction_GoldenTorizo_CallY_OrY2_ForAttack 
    dw InstList_GoldenTorizo_SpewChozoOrbs_FacingLeft_LeftFootFwd_0 
    dw InstList_GoldenTorizo_SonicBooms_FacingLeft_LeftFootFwd_0 
    dw Instruction_Common_GotoY 
    dw InstList_GoldenTorizo_WalkingLeft_RightLegMoving 

InstList_GT_LandedFromBackwardsJump_FacingLeft_RightFootFwd:
    dw Instruction_GoldenTorizo_CallY_OrY2_ForAttack 
    dw InstList_GoldenTorizo_SpewChozoOrbs_FaceLeft_RightFootFwd_0 
    dw InstList_GoldenTorizo_SonicBooms_FacingLeft_RightFootFwd_0 
    dw Instruction_Common_GotoY 
    dw InstList_GoldenTorizo_WalkingLeft_LeftLegMoving 

InstList_GT_LandedFromBackwardsJump_FacingRight_RightFootFwd:
    dw Instruction_GoldenTorizo_CallY_OrY2_ForAttack 
    dw InstList_GoldenTorizo_SpewChozoOrb_FacingLeft_RightFootFwd_0 
    dw InstList_GoldenTorizo_SonicBooms_FacingRight_RightFootFwd_0 
    dw Instruction_Common_GotoY 
    dw InstList_GoldenTorizo_WalkingRight_LeftLegMoving 

InstList_GT_LandedFromBackwardsJump_FacingRight_LeftFootFwd:
    dw Instruction_GoldenTorizo_CallY_OrY2_ForAttack 
    dw InstList_GoldenTorizo_SpewChozoOrb_FacingLeft_LeftFootFwd_0 
    dw InstList_GoldenTorizo_SonicBooms_FacingRight_LeftFootFwd_0 
    dw Instruction_Common_GotoY 
    dw InstList_GoldenTorizo_WalkingRight_RightLegMoving 

Instruction_GoldenTorizo_ClearCaughtSuperMissileFlag:
    LDA.W $0FB6,X 
    AND.W #$EFFF 
    STA.W $0FB6,X 
    RTL 


InstList_GoldenTorizo_CaughtSuper_FacingLeft_LeftLegFwd:
    dw Instruction_Torizo_QueueSonicBoomSFX 
    dw Instruction_Torizo_FunctionInY 
    dw Function_GoldenTorizo_SimpleMovement 
    dw $0001 
    dw ExtendedSpritemaps_Torizo_Attacks_FaceLeft_LeftFootForward 
    dw $0001 
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_0 
    dw $0001 
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_1 
    dw $0001 
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_2 
    dw $0001 
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_3 
    dw $0001 
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_4 
    dw $0001 
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_3 
    dw $0001 
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_2 
    dw $0001 
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_1 
    dw $0001 
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_0 
    dw $0002 
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_0 
    dw $0002 
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_1 
    dw $0002 
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_2 
    dw $0002 
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_3 
    dw Instruction_GoldenTorizo_SpawnSuperMissile 
    dw $0030 
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_4 
    dw $0002 
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_3 
    dw $0002 
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_2 
    dw $0002 
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_1 
    dw $0002 
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_0 
    dw $0002 
    dw ExtendedSpritemaps_Torizo_Attacks_FaceLeft_LeftFootForward 
    dw $0010 
    dw ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_5 
    dw Instruction_GoldenTorizo_ClearCaughtSuperMissileFlag 
    dw Instruction_Common_GotoY 
    dw InstList_GoldenTorizo_WalkingLeft_RightLegMoving 

InstList_GoldenTorizo_CaughtSuper_FacingLeft_RightLegFwd:
    dw Instruction_Torizo_QueueSonicBoomSFX 
    dw Instruction_Torizo_FunctionInY 
    dw Function_GoldenTorizo_SimpleMovement 
    dw $0001 
    dw ExtendedSpritemaps_Torizo_Attacks_FaceLeft_RightFootForward 
    dw $0001 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_0 
    dw $0001 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_1 
    dw $0001 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_2 
    dw $0001 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_3 
    dw $0001 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_4 
    dw $0001 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_3 
    dw $0001 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_2 
    dw $0001 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_1 
    dw $0001 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_0 
    dw $0002 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_0 
    dw $0002 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_1 
    dw $0002 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_2 
    dw $0002 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_3 
    dw Instruction_GoldenTorizo_SpawnSuperMissile 
    dw $0030 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_4 
    dw $0002 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_3 
    dw $0002 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_2 
    dw $0002 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_1 
    dw $0002 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_0 
    dw $0002 
    dw ExtendedSpritemaps_Torizo_Attacks_FaceLeft_RightFootForward 
    dw $0010 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_5 
    dw Instruction_GoldenTorizo_ClearCaughtSuperMissileFlag 
    dw Instruction_Common_GotoY 
    dw InstList_GoldenTorizo_WalkingLeft_LeftLegMoving 

InstList_GoldenTorizo_CaughtSuper_FacingRight_RightLegFwd:
    dw Instruction_Torizo_QueueSonicBoomSFX 
    dw Instruction_Torizo_FunctionInY 
    dw Function_GoldenTorizo_SimpleMovement 
    dw $0001 
    dw ExtendedSpritemaps_Torizo_Attacks_FaceRight_RightFootForward 
    dw $0001 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_0 
    dw $0001 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_1 
    dw $0001 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_2 
    dw $0001 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_3 
    dw $0001 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_4 
    dw $0001 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_3 
    dw $0001 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_2 
    dw $0001 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_1 
    dw $0002 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_1 
    dw $0002 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_2 
    dw $0002 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_3 
    dw Instruction_GoldenTorizo_SpawnSuperMissile 
    dw $0030 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_4 
    dw $0002 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_3 
    dw $0002 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_2 
    dw $0002 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_1 
    dw $0002 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_0 
    dw $0002 
    dw ExtendedSpritemaps_Torizo_Attacks_FaceRight_RightFootForward 
    dw $0010 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_5 
    dw Instruction_GoldenTorizo_ClearCaughtSuperMissileFlag 
    dw Instruction_Common_GotoY 
    dw InstList_GoldenTorizo_WalkingRight_LeftLegMoving 

InstList_GoldenTorizo_CaughtSuper_FacingRight_LeftLegFwd:
    dw Instruction_Torizo_QueueSonicBoomSFX 
    dw Instruction_Torizo_FunctionInY 
    dw Function_GoldenTorizo_SimpleMovement 
    dw $0001 
    dw ExtendedSpritemaps_Torizo_Attacks_FaceRight_LeftFootForward 
    dw $0001 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_0 
    dw $0001 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_1 
    dw $0001 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_2 
    dw $0001 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_3 
    dw $0001 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_4 
    dw $0001 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_3 
    dw $0001 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_2 
    dw $0001 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_1 
    dw $0002 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_1 
    dw $0002 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_2 
    dw $0002 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_3 
    dw Instruction_GoldenTorizo_SpawnSuperMissile 
    dw $0030 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_4 
    dw $0002 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_3 
    dw $0002 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_2 
    dw $0002 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_1 
    dw $0002 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_0 
    dw $0002 
    dw ExtendedSpritemaps_Torizo_Attacks_FaceRight_LeftFootForward 
    dw $0010 
    dw ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_5 
    dw Instruction_GoldenTorizo_ClearCaughtSuperMissileFlag 
    dw Instruction_Common_GotoY 
    dw InstList_GoldenTorizo_WalkingRight_RightLegMoving 

InstList_GoldenTorizo_SitDownAttack_FacingLeft:
    dw Instruction_Common_Enemy0FB2_InY 
    dw Function_GoldenTorizo_Movement_Attacking 
    dw $0008 
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_6 
    dw Instruction_Torizo_SittingDownMovement_IndexInY 
    dw $000A,$0008 
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_5 
    dw Instruction_Torizo_SittingDownMovement_IndexInY 
    dw $0008,$0006 
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_4 
    dw Instruction_Torizo_SittingDownMovement_IndexInY 
    dw $0006,$0006 
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_3 
    dw Instruction_Torizo_SittingDownMovement_IndexInY 
    dw $0004,$0004 
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_2 
    dw Instruction_Torizo_SittingDownMovement_IndexInY 
    dw $0002,$0004 
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_1 
    dw Instruction_Torizo_SittingDownMovement_IndexInY 
    dw $0000,$0008 
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_0 
    dw Instruction_Torizo_StandingUpMovement_IndexInY 
    dw $0000,$0008 
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_1 
    dw Instruction_Torizo_StandingUpMovement_IndexInY 
    dw $0002,$0008 
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_2 
    dw Instruction_Torizo_StandingUpMovement_IndexInY 
    dw $0004,$0008 
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_3 
    dw Instruction_Torizo_StandingUpMovement_IndexInY 
    dw $0006,$000A 
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_4 
    dw Instruction_Torizo_StandingUpMovement_IndexInY 
    dw $0008,$000A 
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_5 
    dw Instruction_Torizo_StandingUpMovement_IndexInY 
    dw $000A 
    dw Instruction_Common_Enemy0FB2_InY 
    dw Function_GoldenTorizo_Movement_Walking 
    dw Instruction_Common_GotoY 
    dw InstList_GoldenTorizo_WalkingLeft_LeftLegMoving 

InstList_GoldenTorizo_SitDownAttack_FacingRight:
    dw Instruction_Common_Enemy0FB2_InY 
    dw Function_GoldenTorizo_Movement_Attacking 
    dw $0008 
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingRight_6 
    dw Instruction_Torizo_SittingDownMovement_IndexInY 
    dw $001A,$0008 
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingRight_5 
    dw Instruction_Torizo_SittingDownMovement_IndexInY 
    dw $0018,$0006 
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingRight_4 
    dw Instruction_Torizo_SittingDownMovement_IndexInY 
    dw $0016,$0006 
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingRight_3 
    dw Instruction_Torizo_SittingDownMovement_IndexInY 
    dw $0014,$0004 
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingRight_2 
    dw Instruction_Torizo_SittingDownMovement_IndexInY 
    dw $0012,$0004 
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingRight_1 
    dw Instruction_Torizo_SittingDownMovement_IndexInY 
    dw $0010,$0008 
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingRight_0 
    dw Instruction_Torizo_StandingUpMovement_IndexInY 
    dw $0010,$0008 
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingRight_1 
    dw Instruction_Torizo_StandingUpMovement_IndexInY 
    dw $0012,$0008 
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingRight_2 
    dw Instruction_Torizo_StandingUpMovement_IndexInY 
    dw $0014,$0008 
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingRight_3 
    dw Instruction_Torizo_StandingUpMovement_IndexInY 
    dw $0016,$000A 
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingRight_4 
    dw Instruction_Torizo_StandingUpMovement_IndexInY 
    dw $0018,$000A 
    dw ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingRight_5 
    dw Instruction_Torizo_StandingUpMovement_IndexInY 
    dw $001A 
    dw Instruction_Common_Enemy0FB2_InY 
    dw Function_GoldenTorizo_Movement_Walking 
    dw Instruction_Common_GotoY 
    dw InstList_GoldenTorizo_WalkingRight_RightLegMoving 

InstList_GoldenTorizo_ReleaseGoldenTorizoEggs_0:
    dw Instruction_Common_Enemy0FB2_InY 
    dw Function_GoldenTorizo_Movement_Attacking 
    dw Instruction_Common_TransferYBytesInYToVRAM 
    dw $0040 
    dl Tiles_Torizo_AAB4F9 
    dw $7300 
    dw Instruction_Common_TransferYBytesInYToVRAM 
    dw $0040 
    dl Tiles_Torizo_AAB6F9 
    dw $7400 
    dw Instruction_Common_WaitYFrames 
    dw $0008 
    dw Instruction_Common_TransferYBytesInYToVRAM 
    dw $0040 
    dl Tiles_Torizo_AAB539 
    dw $7300 
    dw Instruction_Common_TransferYBytesInYToVRAM 
    dw $0040 
    dl Tiles_Torizo_AAB739 
    dw $7400 
    dw Instruction_Common_WaitYFrames 
    dw $0008 
    dw Instruction_Common_TransferYBytesInYToVRAM 
    dw $0040 
    dl Tiles_Torizo_AAB579 
    dw $7300 
    dw Instruction_Common_TransferYBytesInYToVRAM 
    dw $0040 
    dl Tiles_Torizo_AAB779 
    dw $7400 
    dw Instruction_Common_WaitYFrames 
    dw $0010 
    dw Instruction_Common_TimerInY 
    dw $0006 

InstList_GoldenTorizo_ReleaseGoldenTorizoEggs_1:
    dw Instruction_GoldenTorizo_QueueEggReleasedSFX 
    dw Instruction_GoldenTorizo_SpawnGoldenTorizoEgg 
    dw Instruction_Common_WaitYFrames 
    dw $0008 
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate 
    dw InstList_GoldenTorizo_ReleaseGoldenTorizoEggs_1 

InstList_GoldenTorizo_ReleaseGoldenTorizoEggs_2:
    dw Instruction_Common_WaitYFrames 
    dw $0001 
    dw Instruction_GoldenTorizo_EyeBeamAttack_0 
    dw InstList_GoldenTorizo_ReleaseGoldenTorizoEggs_2 
    dw Instruction_Common_TransferYBytesInYToVRAM 
    dw $0040 
    dl Tiles_Torizo_AAB579 
    dw $7300 
    dw Instruction_Common_TransferYBytesInYToVRAM 
    dw $0040 
    dl Tiles_Torizo_AAB779 
    dw $7400 
    dw Instruction_Common_WaitYFrames 
    dw $0008 
    dw Instruction_Common_TransferYBytesInYToVRAM 
    dw $0040 
    dl Tiles_Torizo_AAB539 
    dw $7300 
    dw Instruction_Common_TransferYBytesInYToVRAM 
    dw $0040 
    dl Tiles_Torizo_AAB739 
    dw $7400 
    dw Instruction_Common_WaitYFrames 
    dw $0008 
    dw Instruction_Common_TransferYBytesInYToVRAM 
    dw $0040 
    dl Tiles_Torizo_AAB4F9 
    dw $7300 
    dw Instruction_Common_TransferYBytesInYToVRAM 
    dw $0040 
    dl Tiles_Torizo_AAB6F9 
    dw $7400 
    dw Instruction_Common_WaitYFrames 
    dw $0008 
    dw Instruction_Common_TransferYBytesInYToVRAM 
    dw $0040 
    dl Tiles_BombTorizo_GoldenTorizo+$600 
    dw $7300 
    dw Instruction_Common_TransferYBytesInYToVRAM 
    dw $0040 
    dl Tiles_BombTorizo_GoldenTorizo+$800 
    dw $7400 
    dw Instruction_Common_Enemy0FB2_InY 
    dw Function_GoldenTorizo_Movement_Walking 
    dw Instruction_Torizo_Return 

Instruction_GoldenTorizo_SpawnGoldenTorizoEgg:
    PHY 
    LDY.W #EnemyProjectile_GoldenTorizoEgg 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    PLY 
    RTL 


Instruction_GoldenTorizo_EyeBeamAttack_0:
    PHX 
    LDX.W #$0022 

.loop:
    LDA.W $1997,X 
    CMP.W #EnemyProjectile_GoldenTorizoEgg 
    BEQ .gotoY 
    DEX #2
    BPL .loop 
    PLX 
    INY #2
    RTL 


.gotoY:
    PLX 
    LDA.W $0000,Y 
    TAY 
    RTL 


InstList_GoldenTorizo_EyeBeamAttack_0:
    dw Instruction_Torizo_FunctionInY 
    dw Function_GoldenTorizo_SimpleMovement 
    dw Instruction_GoldenTorizo_DisableEyeBeamExplosions 
    dw Instruction_Torizo_SetAnimationLock 
    dw Instruction_Common_WaitYFrames 
    dw $0008 
    dw Instruction_Common_TimerInY 
    dw $0004 
    dw Instruction_GoldenTorizo_QueueLaserSFX 

InstList_GoldenTorizo_EyeBeamAttack_1:
    dw Instruction_GoldenTorizo_SpawnEyeBeam 
    dw $0000 
    dw Instruction_Common_WaitYFrames 
    dw $0004 
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate 
    dw InstList_GoldenTorizo_EyeBeamAttack_1 
    dw Instruction_Common_WaitYFrames 
    dw $0008 
    dw Instruction_Common_TimerInY 
    dw $0002 

InstList_GoldenTorizo_EyeBeamAttack_2:
    dw Instruction_Common_WaitYFrames 
    dw $0003 
    dw Instruction_Common_TransferYBytesInYToVRAM 
    dw $0040 
    dl Tiles_Torizo 
    dw $7D80 
    dw Instruction_Common_WaitYFrames 
    dw $0003 
    dw Instruction_Common_TransferYBytesInYToVRAM 
    dw $0040 
    dl Tiles_Torizo_AAB2B9 
    dw $7D80 
    dw Instruction_Common_WaitYFrames 
    dw $0003 
    dw Instruction_Common_TransferYBytesInYToVRAM 
    dw $0040 
    dl Tiles_Torizo_AAB2F9 
    dw $7D80 
    dw Instruction_Common_WaitYFrames 
    dw $0003 
    dw Instruction_Common_TransferYBytesInYToVRAM 
    dw $0040 
    dl Tiles_Torizo_AAB339 
    dw $7D80 
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate 
    dw InstList_GoldenTorizo_EyeBeamAttack_2 
    dw Instruction_GoldenTorizo_EnableEyeBeamExplosions 
    dw Instruction_Common_WaitYFrames 
    dw $0008 
    dw Instruction_GoldenTorizo_DisableEyeBeamExplosions 
    dw Instruction_Torizo_ClearAnimationLock 
    dw Instruction_Torizo_FunctionInY 
    dw Function_GoldenTorizo_NormalMovement 
    dw Instruction_Torizo_Return 

Instruction_GoldenTorizo_DisableEyeBeamExplosions:
    LDA.L $7E780C,X 
    AND.W #$7FFF 
    STA.L $7E780C,X 
    RTL 


Instruction_GoldenTorizo_EnableEyeBeamExplosions:
    LDA.L $7E780C,X 
    ORA.W #$8000 
    STA.L $7E780C,X 
    RTL 


InstList_Torizo_Stunned_0:
    dw Instruction_Common_Enemy0FB2_InY 
    dw Function_GoldenTorizo_Movement_Attacking 
    dw Instruction_Torizo_SetAnimationLock 
    dw Instruction_Common_WaitYFrames 
    dw $0018 
    dw Instruction_Common_TimerInY 
    dw $0002 

InstList_Torizo_Stunned_1:
    dw Instruction_Common_WaitYFrames 
    dw $0003 
    dw Instruction_Common_TransferYBytesInYToVRAM 
    dw $0040 
    dl Tiles_Torizo 
    dw $7D80 
    dw Instruction_Common_WaitYFrames 
    dw $0003 
    dw Instruction_Common_TransferYBytesInYToVRAM 
    dw $0040 
    dl Tiles_Torizo_AAB2B9 
    dw $7D80 
    dw Instruction_Common_WaitYFrames 
    dw $0003 
    dw Instruction_Common_TransferYBytesInYToVRAM 
    dw $0040 
    dl Tiles_Torizo_AAB2F9 
    dw $7D80 
    dw Instruction_Common_WaitYFrames 
    dw $0003 
    dw Instruction_Common_TransferYBytesInYToVRAM 
    dw $0040 
    dl Tiles_Torizo_AAB339 
    dw $7D80 
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate 
    dw InstList_Torizo_Stunned_1 
    dw Instruction_Common_WaitYFrames 
    dw $0010 
    dw Instruction_Torizo_ClearAnimationLock 
    dw Instruction_GoldenTorizo_UnmarkStunned 
    dw Instruction_Common_Enemy0FB2_InY 
    dw Function_GoldenTorizo_Movement_Walking 
    dw Instruction_Torizo_Return 

Instruction_GoldenTorizo_UnmarkStunned:
    LDA.W $0FB6,X 
    AND.W #$DFFF 
    STA.W $0FB6,X 
    RTL 


InstList_GoldenTorizo_Dodge_TurningLeft:
    dw Instruction_Torizo_FunctionInY 
    dw Function_Torizo_SimpleMovement 
    dw Instruction_Torizo_SetAnimationLock 
    dw Instruction_Torizo_SetTorizoTurningAroundFlag 
    dw $0018 
    dw ExtendedSpritemaps_Torizo_FacingScreen_Turning_Dodging 
    dw Instruction_Torizo_ClearAnimationLock 
    dw Instruction_Common_GotoY 
    dw InstList_GoldenTorizo_WalkingLeft_RightLegMoving 

InstList_GoldenTorizo_TurningLeft:
    dw Instruction_Torizo_FunctionInY 
    dw Function_Torizo_SimpleMovement 
    dw Instruction_Torizo_SetTorizoTurningAroundFlag 
    dw $0008 
    dw ExtendedSpritemaps_Torizo_FacingScreen_Turning_Dodging 

InstList_GoldenTorizo_WalkingLeft_RightLegMoving:
    dw Instruction_Torizo_SetSteppedLeftWithLeftFootState 
    dw Instruction_Torizo_FunctionInY 
    dw Function_GoldenTorizo_NormalMovement 
    dw Instruction_Common_Enemy0FB2_InY 
    dw Function_GoldenTorizo_Movement_Walking 
    dw Instruction_Torizo_PlayTorizoFootstepsSFX 
    dw $0008 
    dw ExtendedSpritemaps_Torizo_WalkingLeft_RightLegMoving_0 
    dw Instruction_GoldenTorizo_GotoY_JumpForwards_IfAtLeast70Pixel 
    dw InstList_Torizo_FacingLeft_JumpingForwards_0 
    dw Instruction_GoldenTorizo_GotoY_JumpBack_IfLessThan20Pixels 
    dw InstList_Torizo_FacingLeft_JumpingBackward_LandLeftFootFwd_0 
    dw Instruction_GoldenTorizo_CallY_IfStunHealthGreaterThan2A31 
    dw InstList_Torizo_Stunned_0 
    dw Instruction_GT_CallY_25Chance_IfSamusMorphedInFrontOfTorizo 
    dw InstList_GoldenTorizo_EyeBeamAttack_0 
    dw Instruction_GoldenTorizo_WalkingMovement_IndexInY 
    dw $0002,$0004 
    dw ExtendedSpritemaps_Torizo_WalkingLeft_RightLegMoving_1 
    dw Instruction_GoldenTorizo_WalkingMovement_IndexInY 
    dw $0004,$0004 
    dw ExtendedSpritemaps_Torizo_WalkingLeft_RightLegMoving_2 
    dw Instruction_GoldenTorizo_CallY_25Chance_IfHealthLessThan789 
    dw InstList_GoldenTorizo_ReleaseGoldenTorizoEggs_0 
    dw Instruction_GoldenTorizo_GotoY_JumpBack_IfLessThan20Pixels 
    dw InstList_Torizo_FacingLeft_JumpingBackward_LandLeftFootFwd_0 
    dw Instruction_GoldenTorizo_WalkingMovement_IndexInY 
    dw $0006,$0004 
    dw ExtendedSpritemaps_Torizo_WalkingLeft_RightLegMoving_3 
    dw Instruction_GoldenTorizo_WalkingMovement_IndexInY 
    dw $0008,$0004 
    dw ExtendedSpritemaps_Torizo_WalkingLeft_RightLegMoving_4 
    dw Instruction_GoldenTorizo_WalkingMovement_IndexInY 
    dw $000A 

InstList_GoldenTorizo_WalkingLeft_LeftLegMoving:
    dw Instruction_Torizo_SetSteppedLeftWithRightFootState 
    dw Instruction_Torizo_FunctionInY 
    dw Function_GoldenTorizo_NormalMovement 
    dw Instruction_Common_Enemy0FB2_InY 
    dw Function_GoldenTorizo_Movement_Walking 
    dw Instruction_Torizo_PlayTorizoFootstepsSFX 
    dw $0008 
    dw ExtendedSpritemaps_Torizo_WalkingLeft_LeftLegMoving_0 
    dw Instruction_GoldenTorizo_GotoY_IfSamusIsMorphedBehindTorizo 
    dw InstList_GoldenTorizo_SitDownAttack_FacingLeft 
    dw Instruction_GoldenTorizo_GotoY_JumpForwards_IfAtLeast70Pixel 
    dw InstList_Torizo_FacingLeft_JumpingForwards_0 
    dw Instruction_GoldenTorizo_GotoY_JumpBack_IfLessThan20Pixels 
    dw InstList_Torizo_FacingLeft_JumpingBackward_RightFootFwd_0 
    dw Instruction_GoldenTorizo_CallY_IfStunHealthGreaterThan2A31 
    dw InstList_Torizo_Stunned_0 
    dw Instruction_GT_CallY_25Chance_IfSamusMorphedInFrontOfTorizo 
    dw InstList_GoldenTorizo_EyeBeamAttack_0 
    dw Instruction_GoldenTorizo_WalkingMovement_IndexInY 
    dw $000C,$0004 
    dw ExtendedSpritemaps_Torizo_WalkingLeft_LeftLegMoving_1 
    dw Instruction_GoldenTorizo_WalkingMovement_IndexInY 
    dw $000E,$0004 
    dw ExtendedSpritemaps_Torizo_WalkingLeft_LeftLegMoving_2 
    dw Instruction_GoldenTorizo_CallY_25Chance_IfHealthLessThan789 
    dw InstList_GoldenTorizo_ReleaseGoldenTorizoEggs_0 
    dw Instruction_GoldenTorizo_GotoY_JumpBack_IfLessThan20Pixels 
    dw InstList_Torizo_FacingLeft_JumpingBackward_RightFootFwd_0 
    dw Instruction_GoldenTorizo_WalkingMovement_IndexInY 
    dw $0010,$0004 
    dw ExtendedSpritemaps_Torizo_WalkingLeft_LeftLegMoving_3 
    dw Instruction_GoldenTorizo_WalkingMovement_IndexInY 
    dw $0012,$0004 
    dw ExtendedSpritemaps_Torizo_WalkingLeft_LeftLegMoving_4 
    dw Instruction_GoldenTorizo_WalkingMovement_IndexInY 
    dw $0000 
    dw Instruction_Common_GotoY 
    dw InstList_GoldenTorizo_WalkingLeft_RightLegMoving 

InstList_GoldenTorizo_Dodge_TurningRight:
    dw Instruction_Torizo_FunctionInY 
    dw Function_Torizo_SimpleMovement 
    dw Instruction_Torizo_SetAnimationLock 
    dw Instruction_Torizo_SetTorizoTurningAroundFlag 
    dw $0018 
    dw ExtendedSpritemaps_Torizo_FacingScreen_Turning_Dodging 
    dw Instruction_Torizo_ClearAnimationLock 
    dw Instruction_Common_GotoY 
    dw InstList_GoldenTorizo_WalkingRight_LeftLegMoving 

InstList_GoldenTorizo_TurningRight:
    dw Instruction_Torizo_FunctionInY 
    dw Function_Torizo_SimpleMovement 
    dw Instruction_Torizo_SetTorizoTurningAroundFlag 
    dw $0008 
    dw ExtendedSpritemaps_Torizo_FacingScreen_Turning_Dodging 

InstList_GoldenTorizo_WalkingRight_LeftLegMoving:
    dw Instruction_Torizo_SetSteppedRightWithRightFootState 
    dw Instruction_Torizo_FunctionInY 
    dw Function_GoldenTorizo_NormalMovement 
    dw Instruction_Common_Enemy0FB2_InY 
    dw Function_GoldenTorizo_Movement_Walking 
    dw Instruction_Torizo_PlayTorizoFootstepsSFX 
    dw $0008 
    dw ExtendedSpritemaps_Torizo_WalkingRight_LeftLegMoving_0 
    dw Instruction_GoldenTorizo_GotoY_JumpForwards_IfAtLeast70Pixel 
    dw InstList_Torizo_FacingRight_JumpingForwards_0 
    dw Instruction_GoldenTorizo_GotoY_JumpBack_IfLessThan20Pixels 
    dw InstList_Torizo_FacingRight_JumpBackward_LandRightFootFwd_0 
    dw Instruction_GoldenTorizo_CallY_IfStunHealthGreaterThan2A31 
    dw InstList_Torizo_Stunned_0 
    dw Instruction_GT_CallY_25Chance_IfSamusMorphedInFrontOfTorizo 
    dw InstList_GoldenTorizo_EyeBeamAttack_0 
    dw Instruction_GoldenTorizo_WalkingMovement_IndexInY 
    dw $0016,$0004 
    dw ExtendedSpritemaps_Torizo_WalkingRight_LeftLegMoving_1 
    dw Instruction_GoldenTorizo_WalkingMovement_IndexInY 
    dw $0018,$0004 
    dw ExtendedSpritemaps_Torizo_WalkingRight_LeftLegMoving_2 
    dw Instruction_GoldenTorizo_CallY_25Chance_IfHealthLessThan789 
    dw InstList_GoldenTorizo_ReleaseGoldenTorizoEggs_0 
    dw Instruction_GoldenTorizo_WalkingMovement_IndexInY 
    dw $001A,$0004 
    dw ExtendedSpritemaps_Torizo_WalkingRight_LeftLegMoving_3 
    dw Instruction_GoldenTorizo_GotoY_JumpBack_IfLessThan20Pixels 
    dw InstList_Torizo_FacingRight_JumpBackward_LandRightFootFwd_0 
    dw Instruction_GoldenTorizo_WalkingMovement_IndexInY 
    dw $001C,$0004 
    dw ExtendedSpritemaps_Torizo_WalkingRight_LeftLegMoving_4 
    dw Instruction_GoldenTorizo_WalkingMovement_IndexInY 
    dw $001E 

InstList_GoldenTorizo_WalkingRight_RightLegMoving:
    dw Instruction_Torizo_SetSteppedRightWithLeftFootState 
    dw Instruction_Torizo_FunctionInY 
    dw Function_GoldenTorizo_NormalMovement 
    dw Instruction_Common_Enemy0FB2_InY 
    dw Function_GoldenTorizo_Movement_Walking 
    dw Instruction_Torizo_PlayTorizoFootstepsSFX 
    dw $0008 
    dw ExtendedSpritemaps_Torizo_WalkingRight_RightLegMoving_0 
    dw Instruction_GoldenTorizo_GotoY_IfSamusIsMorphedBehindTorizo 
    dw InstList_GoldenTorizo_SitDownAttack_FacingRight 
    dw Instruction_GoldenTorizo_GotoY_JumpForwards_IfAtLeast70Pixel 
    dw InstList_Torizo_FacingRight_JumpingForwards_0 
    dw Instruction_GoldenTorizo_GotoY_JumpBack_IfLessThan20Pixels 
    dw InstList_Torizo_FacingRight_JumpBackwards_LandLeftFootFwd_0 
    dw Instruction_GoldenTorizo_CallY_IfStunHealthGreaterThan2A31 
    dw InstList_Torizo_Stunned_0 
    dw Instruction_GT_CallY_25Chance_IfSamusMorphedInFrontOfTorizo 
    dw InstList_GoldenTorizo_EyeBeamAttack_0 
    dw Instruction_GoldenTorizo_WalkingMovement_IndexInY 
    dw $0020,$0004 
    dw ExtendedSpritemaps_Torizo_WalkingRight_RightLegMoving_1 
    dw Instruction_GoldenTorizo_WalkingMovement_IndexInY 
    dw $0022,$0004 
    dw ExtendedSpritemaps_Torizo_WalkingRight_RightLegMoving_2 
    dw Instruction_GoldenTorizo_CallY_25Chance_IfHealthLessThan789 
    dw InstList_GoldenTorizo_ReleaseGoldenTorizoEggs_0 
    dw Instruction_GoldenTorizo_GotoY_JumpBack_IfLessThan20Pixels 
    dw InstList_Torizo_FacingRight_JumpBackwards_LandLeftFootFwd_0 
    dw Instruction_GoldenTorizo_WalkingMovement_IndexInY 
    dw $0024,$0004 
    dw ExtendedSpritemaps_Torizo_WalkingRight_RightLegMoving_3 
    dw Instruction_GoldenTorizo_WalkingMovement_IndexInY 
    dw $0026,$0004 
    dw ExtendedSpritemaps_Torizo_WalkingRight_RightLegMoving_4 
    dw Instruction_GoldenTorizo_WalkingMovement_IndexInY 
    dw $0014 
    dw Instruction_Common_GotoY 
    dw InstList_GoldenTorizo_WalkingRight_LeftLegMoving 

MainAI_GoldenTorizo:
    LDX.W $0E54 
    LDA.W $0A1C 
    CMP.W #$001B 
    BEQ .spaceJump 
    CMP.W #$001C 
    BEQ .spaceJump 
    LDA.W #$0000 : STA.L $7E780E,X 
    BRA .executeFunction 


.spaceJump:
    LDA.L $7E780E,X 
    INC A 
    STA.L $7E780E,X 

.executeFunction:
    JSR.W ($0FB0,X) 
    RTL 


Instruction_GoldenTorizo_QueueEggReleasedSFX:
    LDA.W #$0034 
    JSL.L QueueSound_Lib2_Max6 
    RTL 


Instruction_GoldenTorizo_QueueLaserSFX:
    LDA.W #$0067 
    JSL.L QueueSound_Lib2_Max6 
    RTL 


Instruction_Torizo_QueueSonicBoomSFX:
    LDA.W #$0048 
    JSL.L QueueSound_Lib2_Max6 
    RTL 


CheckIfTorizoIsFacingSamus:
    LDA.W $0F7A,X 
    SEC 
    SBC.W $0AF6 
    EOR.W $0FB4,X 
    RTS 


Goto_GoldenTorizoHealthBasedPaletteHandling:
    LDA.W $0F8C,X 
    JSL.L GoldenTorizo_HealthBasedPalette_Handling 
    RTS 


HurtAI_GoldenTorizo:
    LDX.W $0E54 
    JSR.W HandleLowHealthInitialDrool 
    LDA.W $0F9C,X 
    LSR A 
    BCS .flash 
    JSR.W Goto_GoldenTorizoHealthBasedPaletteHandling 
    BRA .return 


.flash:
    PHX 
    LDX.W #$001E 

.loopPalettes:
    LDA.W #$7FFF : STA.L $7EC140,X 
    STA.L $7EC120,X 
    DEX #2
    BPL .loopPalettes 
    PLX 

.return:
    RTL 


Instruction_GoldenTorizo_SpawnSuperMissile:
    PHY 
    LDY.W #EnemyProjectile_GoldenTorizoSuperMissile 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    PLY 
    RTL 


Instruction_GoldenTorizo_GotoY_IfSamusIsMorphedBehindTorizo:
    JSR.W CheckIfTorizoIsFacingSamus 
    BPL .noGo 
    LDA.W #$0004 
    JSL.L CheckIfXDistanceBetweenEnemyAndSamusIsAtLeastA 
    BCC .noGo 
    LDA.W #$0028 
    JSL.L CheckIfXDistanceBetweenEnemyAndSamusIsAtLeastA 
    BCS .noGo 
    LDA.W $0A1C 
    CMP.W #$001D 
    BEQ .gotoY 
    CMP.W #$001E 
    BEQ .gotoY 
    CMP.W #$001F 
    BEQ .gotoY 
    CMP.W #$0079 
    BEQ .gotoY 
    CMP.W #$007A 
    BEQ .gotoY 
    CMP.W #$007B 
    BEQ .gotoY 
    CMP.W #$007C 
    BNE .noGo 

.gotoY:
    LDA.W #$0000 : STA.L $7E7812,X 
    LDA.W $0000,Y 
    TAY 
    RTL 


.noGo:
    INY #2
    RTL 


Instruction_GoldenTorizo_SpawnEyeBeam:
    PHY 
    LDA.W $0000,Y 
    LDY.W #EnemyProjectile_GoldenTorizoEyeBeam 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    PLY 
    INY #2
    RTL 


Instruction_GT_CallY_25Chance_IfSamusMorphedInFrontOfTorizo:
    JSR.W CheckIfTorizoIsFacingSamus 
    BMI .noGo 
    LDA.W #$0020 
    JSL.L CheckIfXDistanceBetweenEnemyAndSamusIsAtLeastA 
    BCC .noGo 
    LDA.W #$0060 
    JSL.L CheckIfXDistanceBetweenEnemyAndSamusIsAtLeastA 
    BCS .noGo 
    JSL.L GenerateRandomNumber 
    AND.W #$0110 
    BNE .noGo 
    TYA 
    INC #2
    STA.L $7E7800,X 
    LDA.W $0000,Y 
    TAY 
    RTL 


.noGo:
    INY #2
    RTL 


Instruction_GoldenTorizo_CallY_25Chance_IfHealthLessThan789:
    LDA.W #$0788 
    CMP.W $0F8C,X 
    BCC .noGo 
    JSL.L GenerateRandomNumber 
    AND.W #$0102 
    BNE .noGo 
    LDA.W #$0000 : STA.L $7E7812,X 
    TYA 
    INC #2
    STA.L $7E7800,X 
    LDA.W $0000,Y 
    TAY 
    RTL 


.noGo:
    INY #2
    RTL 


Instruction_GoldenTorizo_CallY_IfStunHealthGreaterThan2A31:
    LDA.W #$2A30 
    CMP.W $0F8C,X 
    BCS .noGo 
    LDA.W $0FB6,X 
    BIT.W #$2000 
    BEQ .noGo 
    TYA 
    INC #2
    STA.L $7E7800,X 
    LDA.W $0000,Y 
    TAY 
    RTL 


.noGo:
    INY #2
    RTL 


Instruction_GoldenTorizo_GotoY_JumpForwards_IfAtLeast70Pixel:
    LDA.W #$0070 
    JSL.L CheckIfXDistanceBetweenEnemyAndSamusIsAtLeastA 
    BCC .noGo 
    JSR.W CheckIfTorizoIsFacingSamus 
    BMI .noGo 
    LDA.W #$0168 
    CMP.L $7E780E,X 
    BCC .jump 
    LDA.B $8B 
    AND.W #$0300 
    BEQ .noGo 
    JSL.L GenerateRandomNumber 
    AND.W #$0101 
    BEQ .noGo 

.jump:
    LDA.W #$0000 : STA.L $7E7812,X 
    JSR.W MakeTorizoJumpForwards 
    LDA.W $0000,Y 
    TAY 
    RTL 


.noGo:
    INY #2
    RTL 


Instruction_GoldenTorizo_SpawnChozoOrbs:
    PHY 
    LDY.W #EnemyProjectile_GoldenTorizoChozoOrbs 
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    PLY 
    RTL 


Instruction_GoldenTorizo_GotoY_JumpBack_IfLessThan20Pixels:
    LDA.L $7E7812,X 
    CMP.W #$0008 
    BCS .jump 
    LDA.W #$0020 
    JSL.L CheckIfXDistanceBetweenEnemyAndSamusIsAtLeastA 
    BCS .noGo 
    JSR.W CheckIfTorizoIsFacingSamus 
    BMI .noGo 

.jump:
    LDA.W #$0000 : STA.L $7E7812,X 
    JSR.W MakeTorizoJumpBackwards 
    LDA.W $0000,Y 
    TAY 
    RTL 


.noGo:
    INY #2
    RTL 


Instruction_GoldenTorizo_CallY_OrY2_ForAttack:
    TYA 
    INC #4
    STA.L $7E7800,X 
    LDA.W $09C6 
    CMP.W #$0020 
    BCC .spewOrbs 
    LDA.W $0AF6 
    LSR A 
    ADC.W $05B6 
    AND.W #$0008 
    BEQ .sonicBooms 

.spewOrbs:
    LDA.W $0000,Y 
    BRA .return 


.sonicBooms:
    LDA.W $0002,Y 

.return:
    TAY 
    RTL 


Instruction_GoldenTorizo_WalkingMovement_IndexInY:
    PHY 
    STZ.B $12 
    LDA.W $0000,Y 
    TAY 
    LDA.W .velocities,Y : STA.B $14 
    STA.W $0FA8,X 
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes 
    PLY 
    BCC .noCollision 
    LDA.W #$0000 : STA.L $7E7806,X 
    LDA.W $0FB4,X 
    BMI .facingRight 
    LDY.W #InstList_GoldenTorizo_TurningRight 
    RTL 


.facingRight:
    LDY.W #InstList_GoldenTorizo_TurningLeft 
    RTL 


.noCollision:
    JSL.L AlignEnemyYPositionWIthNonSquareSlope 
    LDA.W $0AF6 
    SEC 
    SBC.W $0F7A,X 
    EOR.W $0FB4,X 
    BPL .facingAway 
    INY #2
    RTL 


.facingAway:
    LDA.L $7E7806,X 
    BNE .return 
    LDA.W #$0010 : STA.L $7E7806,X 

.return:
    INY #2
    RTL 


.velocities:
    dw $FFFB,$0000,$FFFB,$FFED,$FFF0,$FFF9,$0000,$FFF9 
    dw $FFEF,$FFEE,$0005,$0000,$0005,$0013,$0010,$0007 
    dw $0000,$0007,$0011,$0012 

Function_GoldenTorizo_WakeIfSamusIsBelowAndRightOfTargetPos:
    LDA.W #$0140 
    CMP.W $0AFA 
    BCS .return 
    LDA.W #$0170 
    CMP.W $0AF6 
    BCS .return 
    INC.W $0F92,X 
    INC.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 

.return:
    RTS 


Function_GoldenTorizo_SimpleMovement:
    JSR.W HandleLowHealthInitialDrool 
    JSR.W HandleFalling 
    RTS 


Function_GoldenTorizo_NormalMovement:
    JSR.W HandleLowHealthInitialDrool 
    JSR.W ($0FB2,X) 
    RTS 


Function_GoldenTorizo_Movement_Attacking:
    JSR.W HandleFalling 
    RTS 


Function_GoldenTorizo_Movement_Walking:
    LDA.L $7E7806,X 
    BEQ .notTurning 
    DEC A 
    STA.L $7E7806,X 
    BNE .notTurning 
    LDA.W #$0000 : STA.L $7E7806,X 
    LDA.W $0FB4,X 
    BMI .facingRight 
    LDA.W #InstList_GoldenTorizo_TurningRight 
    BRA + 


.facingRight:
    LDA.W #InstList_GoldenTorizo_TurningLeft 

  + STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    RTS 


.notTurning:
    STZ.B $12 
    LDA.W $0FA8,X 
    BPL + 
    EOR.W #$FFFF 
    INC A 

  + INC A 
    CMP.W #$0010 
    BCC + 
    LDA.W #$000F 

  + STA.B $14 
    JSL.L MoveEnemyDownBy_14_12 
    BCS .return 
    LDA.W $0FB4,X 
    BMI ..facingRight 
    LDA.W #InstList_Torizo_FacingLeft_Falling_0 
    BRA + 


..facingRight:
    LDA.W #InstList_Torizo_FacingRight_Falling_0 

  + STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    LDA.W #$0100 : STA.W $0FAA,X 
    STZ.W $0FA8,X 

.return:
    RTS 


ShotReaction_GoldenTorizo_StandUp_SitDown:
    LDX.W $0E54 
    LDA.W $0F9C,X 
    BNE .return 
    LDA.L $7E7808,X 
    BEQ ShotReaction_GoldenTorizo_Damaged 

.return:
    RTL 


ShotReaction_GoldenTorizo_Normal:
    LDX.W $0E54 
    LDA.W $0F9C,X 
    BNE .return 
    LDA.L $7E7808,X 
    BEQ .gotoFlashOrAnimLock 
    JMP.W ShotReaction_GoldenTorizo_Damaged 


.gotoFlashOrAnimLock:
    JMP.W .flashOrAnimLock ; >.<


.return:
    RTL 


.flashOrAnimLock:
    LDA.W $0FB6,X 
    BIT.W #$1000 
    BNE .stun 
    LDA.W $18A6 
    ASL A 
    TAY 
    LDA.W $0C18,Y 
    AND.W #$0F00 
    STA.L $7E780A,X 
    CMP.W #$0100 
    BEQ ShotReaction_GoldenTorizo_Normal_Missile 
    CMP.W #$0200 
    BEQ ShotReaction_GoldenTorizo_Normal_SuperMissile 

.stun:
    LDA.W $0FB6,X 
    ORA.W #$2000 
    STA.W $0FB6,X ; fallthrough to ShotReaction_GoldenTorizo_Damaged

ShotReaction_GoldenTorizo_Damaged:
    JSL.L NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External 
    LDX.W $0E54 
    LDA.W $0F8C,X 
    BNE .return 
    LDA.W #InstList_Torizo_DeathSequence_0 : STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    LDA.W $0FB6,X 
    ORA.W #$C000 
    STA.W $0FB6,X 
    LDA.W $0F86,X 
    ORA.W #$0400 
    STA.W $0F86,X 

.return:
    RTL 


ShotReaction_GoldenTorizo_Normal_Missile:
    LDA.W $0C04,Y 
    AND.W #$FFEF 
    STA.W $0C04,Y 
    LDA.W #RTS_AAC6AB : STA.W $0FB0,X 
    LDA.W #$0001 : STA.W $0F94,X 
    BIT.W $0FB4,X 
    BMI .keepRight 
    LDA.W #InstList_GoldenTorizo_Dodge_TurningLeft 
    BRA + 


.keepRight:
    LDA.W #InstList_GoldenTorizo_Dodge_TurningRight 

  + STA.W $0F92,X 
    RTL 


ShotReaction_GoldenTorizo_Normal_SuperMissile:
    JSR.W CheckIfTorizoIsFacingSamus 
    BPL .facingSamus 
    JMP.W ShotReaction_GoldenTorizo_Damaged 


.facingSamus:
    LDA.W $0FB6,X 
    ORA.W #$1000 
    STA.W $0FB6,X 
    LDA.W #RTS_AAC6AB : STA.W $0FB0,X 
    LDA.W $0C04,Y 
    ORA.W #$0010 
    STA.W $0C04,Y 
    LDA.W #$0001 : STA.W $0F94,X 
    LDA.W $0FB4,X 
    BIT.W #$2000 
    BNE .backgroundLegForward 
    BIT.W $0FB4,X 
    BMI .facingRight 
    LDA.W #InstList_GoldenTorizo_CaughtSuper_FacingLeft_LeftLegFwd 
    BRA + 


.facingRight:
    LDA.W #InstList_GoldenTorizo_CaughtSuper_FacingRight_RightLegFwd 
    BRA + 


.backgroundLegForward:
    BIT.W $0FB4,X 
    BMI ..facingRight 
    LDA.W #InstList_GoldenTorizo_CaughtSuper_FacingLeft_RightLegFwd 
    BRA + 


..facingRight:
    LDA.W #InstList_GoldenTorizo_CaughtSuper_FacingRight_LeftLegFwd 

  + STA.W $0F92,X 
    RTL 


Palettes_TourianStatue_Ridley:
    dw $3800,$57FF,$2BFF,$1F3C,$0278,$01B0,$010B,$0087 
    dw $0044,$001F,$0012,$0009,$7FFF,$7FFF,$7FFF,$0000 

Palettes_TourianStatue_Phantoon:
    dw $3800,$57FF,$2BFF,$1F3C,$0278,$01B0,$010B,$0087 
    dw $0044,$7FFF,$7FFF,$7FFF,$03FF,$0252,$0129,$0000 

Palettes_TourianStatue_BaseDecoration:
    dw $3800,$27F9,$2375,$1AD2,$164E,$11AB,$0D27,$0484 
    dw $0000,$7F5F,$7C1F,$5816,$300C,$5294,$39CE,$2108 

InstList_TourianStatue_Ridley_0:
    dw Instruction_Common_DeleteEnemy 

InstList_TourianStatue_Ridley_1:
    dw $7777 
    dw UNUSED_Spritemaps_TourianStatue_Ridley_AAD83B 
    dw Instruction_Common_GotoY 
    dw InstList_TourianStatue_Ridley_1 

InstList_TourianStatue_Phantoon_0:
    dw Instruction_Common_DeleteEnemy 

InstList_TourianStatue_Phantoon_1:
    dw $7777 
    dw UNUSED_Spritemaps_TourianStatue_Phantoon_AAD8B0 
    dw Instruction_Common_GotoY 
    dw InstList_TourianStatue_Phantoon_1 

InstList_TourianStatue_BaseDecoration_0:
    dw Instruction_Common_DeleteEnemy 
    dw $0100 
    dw UNUSED_Spritemaps_TourianStatue_BaseDecoration_AAD816 

InstList_TourianStatue_BaseDecoration_1:
    dw $7777 
    dw UNUSED_Spritemaps_TourianStatue_BaseDecoration_AAD816 
    dw Instruction_Common_GotoY 
    dw InstList_TourianStatue_BaseDecoration_1 

MainAI_TourianStatue:
    RTL 


InitAI_TourianStatue:
    LDX.W $0E54 
    STZ.W $0F96,X 
    LDA.W #$0001 : STA.W $0F94,X 
    STZ.W $0F90,X 
    LDY.W $0FB4,X 
    LDA.W .pointers,Y : STA.W $0F92,X 
    LDY.W $0FB4,X 
    BNE .nonZeroParam1 
    LDY.W #EnemyProjectile_TourianStatueBaseDecoration 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    LDY.W #EnemyProjectile_TourianStatueRidley 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    LDY.W #EnemyProjectile_TourianStatuePhantoon 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 

.nonZeroParam1:
    LDX.W #$001E 

.loopPalettes:
    LDA.W Palettes_TourianStatue_BaseDecoration,X : STA.L $7EC3E0,X 
    LDA.W Palettes_TourianStatue_Phantoon,X : STA.L $7EC340,X 
    DEX #2
    BPL .loopPalettes 
    RTL 


.pointers:
    dw InstList_TourianStatue_BaseDecoration_0 
    dw InstList_TourianStatue_Ridley_0 
    dw InstList_TourianStatue_Phantoon_0 

UNUSED_Spritemaps_TourianStatue_BaseDecoration_AAD816:
    dw $0007,$C228 
    db $F8 
    dw $1F9C,$C218 
    db $F8 
    dw $1F9A,$C208 
    db $F8 
    dw $1F98,$C3F8 
    db $F8 
    dw $1F96,$C3E8 
    db $F8 
    dw $1F94,$C3D8 
    db $F8 
    dw $1F92,$C3C8 
    db $F8 
    dw $1F90 

UNUSED_Spritemaps_TourianStatue_Ridley_AAD83B:
    dw $0017,$C3E5 
    db $18 
    dw $2344,$C3E5 
    db $08 
    dw $232C,$C3F5 
    db $18 
    dw $2346,$000D 
    db $20 
    dw $237D,$000D 
    db $18 
    dw $236D,$0005 
    db $18 
    dw $2348,$C215 
    db $08 
    dw $2342,$C205 
    db $08 
    dw $2340,$C3F5 
    db $08 
    dw $232E,$C3D5 
    db $08 
    dw $232A,$C215 
    db $F8 
    dw $2328,$C205 
    db $F8 
    dw $2326,$C3F5 
    db $F8 
    dw $2324,$C3E5 
    db $F8 
    dw $2322,$C3D5 
    db $F8 
    dw $2320,$C215 
    db $E8 
    dw $230E,$C205 
    db $E8 
    dw $230C,$C3F5 
    db $E8 
    dw $230A,$C3E5 
    db $E8 
    dw $2308,$C215 
    db $D8 
    dw $2306,$C205 
    db $D8 
    dw $2304,$C3F5 
    db $D8 
    dw $2302,$C3E5 
    db $D8 
    dw $2300 

UNUSED_Spritemaps_TourianStatue_Phantoon_AAD8B0:
    dw $0013,$0008 
    db $1C 
    dw $2587,$0000 
    db $1C 
    dw $2586,$01F8 
    db $1C 
    dw $2585,$01F0 
    db $1C 
    dw $2584,$0000 
    db $04 
    dw $2583,$0000 
    db $FC 
    dw $2581,$01F8 
    db $04 
    dw $2582,$01F8 
    db $FC 
    dw $2580,$C208 
    db $EC 
    dw $2561,$C3E8 
    db $EC 
    dw $254D,$C208 
    db $FC 
    dw $2565,$C208 
    db $0C 
    dw $256B,$C3F8 
    db $0C 
    dw $2569,$C3E8 
    db $0C 
    dw $2567,$C3E8 
    db $FC 
    dw $2563,$C200 
    db $EC 
    dw $2560,$C3F0 
    db $EC 
    dw $254E,$C200 
    db $DC 
    dw $254B,$C3F0 
    db $DC 
    dw $2549 

Palette_Shaktool:
    dw $3800,$5755,$4A4F,$1CE4,$0C60,$56B2,$3E0D,$2D68 
    dw $2526,$03FF,$02F7,$0210,$0108,$001F,$0018,$000E 

UNUSED_Instruction_Shaktool_Lower1PixelAwayFromProj_AAD931:
    PHY 
    LDY.W $0FB0,X 
    LDA.W $106E,Y 
    EOR.W #$0080 
    PLY 
    JMP.W MoveShaktoolPiece1Pixel 


UNUSED_Instruction_Shaktool_Raise1PixelTowardsProj_AAD93F:
    PHY 
    LDY.W $0FB0,X 
    LDA.W $106E,Y 
    PLY 
    JMP.W MoveShaktoolPiece1Pixel 


Instruction_Shaktool_Lower1Pixel:
    LDA.W $0FA9,X 
    EOR.W #$0080 
    JMP.W MoveShaktoolPiece1Pixel 


Instruction_Shaktool_Raise1Pixel:
    LDA.W $0FA9,X 

MoveShaktoolPiece1Pixel:
    PHX 
    PHY 
    TXY 
    AND.W #$00FF 
    ASL A 
    TAX 
    STZ.B $12 
    STZ.B $14 
    LDA.L SineCosineTables_8bitSine_SignExtended,X 
    BPL + 
    DEC.B $14 

  + STA.B $13 
    LDA.W $0F7C,Y 
    CLC 
    ADC.B $12 
    STA.W $0F7C,Y 
    LDA.W $0F7A,Y 
    ADC.B $14 
    STA.W $0F7A,Y 
    STZ.B $12 
    STZ.B $14 
    LDA.L SineCosineTables_NegativeCosine_SignExtended,X 
    BPL + 
    DEC.B $14 

  + STA.B $13 
    LDA.W $0F80,Y 
    CLC 
    ADC.B $12 
    STA.W $0F80,Y 
    LDA.W $0F7E,Y 
    ADC.B $14 
    STA.W $0F7E,Y 
    PLY 
    PLX 
    RTL 


RTL_AAD99F:
    RTL 

    PHY ; dead code
    LDY.W #EnemyProjectile_ShaktoolFrontCircle 
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    PHA 
    LDY.W #EnemyProjectile_ShaktoolMiddleCircle 
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    PLA 
    LDY.W #EnemyProjectile_ShaktoolBackCircle 
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    PLY 
    RTL 


Instruction_Shaktool_ResetShaktoolFunctions:
    PHY 
    LDY.W $0FB0,X 
    LDA.W ShaktoolPieceData_functionPointer : STA.W $0FB2,Y 
    LDA.W ShaktoolPieceData_functionPointer_rightArm : STA.W $0FF2,Y 
    LDA.W ShaktoolPieceData_functionPointer_centerRightArm : STA.W $1032,Y 
    LDA.W ShaktoolPieceData_functionPointer_head : STA.W $1072,Y 
    LDA.W ShaktoolPieceData_functionPointer_centerLeftArm : STA.W $10B2,Y 
    LDA.W ShaktoolPieceData_functionPointer_leftArm : STA.W $10F2,Y 
    LDA.W ShaktoolPieceData_functionPointer_leftSaw : STA.W $1132,Y 
    PLY 
    RTL 


UNUSED_InstList_Shaktool_SawHand_Attack_PrimaryPiece_AAD9EA:
    dw Instruction_Common_WaitYFrames 
    dw $0240 
    dw Instruction_Common_GotoY 
    dw InstList_Shaktool_SawHand_PrimaryPiece 

UNUSED_InstList_Shaktool_SawHand_Attack_FinalPiece_AAD9F2:
    dw Instruction_Common_WaitYFrames 
    dw $0240 
    dw Instruction_Shaktool_ResetShaktoolFunctions 
    dw Instruction_Common_GotoY 
    dw InstList_Shaktool_SawHand_FinalPiece 

InstList_Shaktool_SawHand_HeadBob_PrimaryPiece:
    dw Instruction_Common_WaitYFrames 
    dw $0014 
    dw Instruction_Common_GotoY 
    dw InstList_Shaktool_SawHand_PrimaryPiece 

InstList_Shaktool_SawHand_HeadBob_FinalPiece:
    dw Instruction_Common_WaitYFrames 
    dw $0014 
    dw Instruction_Shaktool_ResetShaktoolFunctions 
    dw Instruction_Common_GotoY 
    dw InstList_Shaktool_SawHand_FinalPiece 

InstList_Shaktool_SawHand_PrimaryPiece:
    dw $000A 
    dw Spritemaps_Shaktool_SawHand_PrimaryPiece_0 
    dw $000A 
    dw Spritemaps_Shaktool_SawHand_PrimaryPiece_1 
    dw $000A 
    dw Spritemaps_Shaktool_SawHand_PrimaryPiece_2 
    dw Instruction_Common_GotoY 
    dw InstList_Shaktool_SawHand_PrimaryPiece 

InstList_Shaktool_SawHand_FinalPiece:
    dw $0003 
    dw Spritemaps_Shaktool_SawHand_FinalPiece_0 
    dw $0003 
    dw Spritemaps_Shaktool_SawHand_FinalPiece_1 
    dw $0003 
    dw Spritemaps_Shaktool_SawHand_FinalPiece_2 
    dw Instruction_Common_GotoY 
    dw InstList_Shaktool_SawHand_FinalPiece 

UNUSED_InstList_Shaktool_ArmPiece_Attack_Back_AADA2E:
    dw Instruction_Common_WaitYFrames 
    dw $00C0 
    dw UNUSED_Instruction_Shaktool_Lower1PixelAwayFromProj_AAD931 
    dw Instruction_Common_WaitYFrames 
    dw $0080 
    dw UNUSED_Instruction_Shaktool_Raise1PixelTowardsProj_AAD93F 
    dw Instruction_Common_WaitYFrames 
    dw $0100 
    dw Instruction_Common_GotoY 
    dw InstList_Shaktool_ArmPiece_Normal 

UNUSED_InstList_Shaktool_ArmPiece_Attack_Front_AADA42:
    dw Instruction_Common_WaitYFrames 
    dw $0100 
    dw UNUSED_Instruction_Shaktool_Lower1PixelAwayFromProj_AAD931 
    dw Instruction_Common_WaitYFrames 
    dw $0080 
    dw UNUSED_Instruction_Shaktool_Raise1PixelTowardsProj_AAD93F 
    dw Instruction_Common_WaitYFrames 
    dw $00C0 
    dw Instruction_Common_GotoY 
    dw InstList_Shaktool_ArmPiece_Normal 

InstList_Shaktool_ArmPiece_HeadBob_Back:
    dw Instruction_Shaktool_Lower1Pixel 
    dw Instruction_Common_WaitYFrames 
    dw $0014 
    dw Instruction_Shaktool_Raise1Pixel 
    dw Instruction_Common_GotoY 
    dw InstList_Shaktool_ArmPiece_Normal 

InstList_Shaktool_ArmPiece_HeadBob_Front:
    dw Instruction_Common_WaitYFrames 
    dw $0004 
    dw Instruction_Shaktool_Lower1Pixel 
    dw Instruction_Common_WaitYFrames 
    dw $000C 
    dw Instruction_Shaktool_Raise1Pixel 
    dw Instruction_Common_WaitYFrames 
    dw $0004 

InstList_Shaktool_ArmPiece_Normal:
    dw $0077 
    dw Spritemaps_Shaktool_ArmPiece 
    dw Instruction_Common_GotoY 
    dw InstList_Shaktool_ArmPiece_Normal 

UNUSED_InstList_Shaktool_Head_Attack_AADA7A:
    dw Instruction_Common_WaitYFrames 
    dw $0080 
    dw UNUSED_Instruction_Shaktool_Lower1PixelAwayFromProj_AAD931 
    dw RTL_AAD99F 
    dw Instruction_Common_WaitYFrames 
    dw $0080 
    dw UNUSED_Instruction_Shaktool_Raise1PixelTowardsProj_AAD93F 
    dw Instruction_Common_WaitYFrames 
    dw $0140 
    dw Instruction_Common_WaitYFrames 
    dw $0001 

InstList_Shaktool_Head_HeadBob:
    dw Instruction_Common_WaitYFrames 
    dw $0008 
    dw Instruction_Shaktool_Lower1Pixel 
    dw Instruction_Common_WaitYFrames 
    dw $0004 
    dw Instruction_Shaktool_Raise1Pixel 
    dw Instruction_Common_WaitYFrames 
    dw $0008 
    dw Instruction_Common_WaitYFrames 
    dw $0001 

InstList_Shaktool_Head_AimingLeft:
    dw $0774 
    dw Spritemaps_Shaktool_Head_0 
    dw Instruction_Common_GotoY 
    dw InstList_Shaktool_Head_AimingLeft 

InstList_Shaktool_Head_AimingUpLeft:
    dw $0775 
    dw Spritemaps_Shaktool_Head_1 
    dw Instruction_Common_GotoY 
    dw InstList_Shaktool_Head_AimingUpLeft 

InstList_Shaktool_Head_AimingUp:
    dw $0776 
    dw Spritemaps_Shaktool_Head_2 
    dw Instruction_Common_GotoY 
    dw InstList_Shaktool_Head_AimingUp 

InstList_Shaktool_Head_AimingUpRight:
    dw $0777 
    dw Spritemaps_Shaktool_Head_3 
    dw Instruction_Common_GotoY 
    dw InstList_Shaktool_Head_AimingUpRight 

InstList_Shaktool_Head_AimingRight:
    dw $0778 
    dw Spritemaps_Shaktool_Head_4 
    dw Instruction_Common_GotoY 
    dw InstList_Shaktool_Head_AimingRight 

InstList_Shaktool_Head_AimingDownRight:
    dw $0779 
    dw Spritemaps_Shaktool_Head_5 
    dw Instruction_Common_GotoY 
    dw InstList_Shaktool_Head_AimingDownRight 

InstList_Shaktool_Head_AimingDown:
    dw $077A 
    dw Spritemaps_Shaktool_Head_6 
    dw Instruction_Common_GotoY 
    dw InstList_Shaktool_Head_AimingDown 

InstList_Shaktool_Head_AimingDownLeft:
    dw $077B 
    dw Spritemaps_Shaktool_Head_7 
    dw Instruction_Common_GotoY 
    dw InstList_Shaktool_Head_AimingDownLeft 

RTS_AADAE4:
    RTS 

    JSL.L GenerateRandomNumber ; dead code
    BIT.W #$8431 
    BNE .return 
    LDY.W #$000C 

.loop:
    LDA.W #RTS_AADCAA : STA.W $0FB2,X 
    LDA.W ShaktoolPieceData_unusedAttackInstListPointer,Y : STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    TXA 
    SEC 
    SBC.W #$0040 
    TAX 
    DEY #2
    BPL .loop 

.return:
    RTS 


ShaktoolPiecesMovementOptionsInA:
    LDY.W $0FB0,X 
    STA.W $0FB4,Y 
    STA.W $0FF4,Y 
    STA.W $1034,Y 
    STA.W $1074,Y 
    STA.W $10B4,Y 
    STA.W $10F4,Y 
    STA.W $1134,Y 
    RTS 


ShaktoolPiecesFacingAngleInA:
    LDY.W $0FB0,X 
    STA.W $0FA8,Y 
    STA.W $0FE8,Y 
    STA.W $1028,Y 
    STA.W $1068,Y 
    STA.W $10A8,Y 
    STA.W $10E8,Y 
    STA.W $1128,Y 
    RTS 


ShaktoolPiecesNeighborAngleInA:
    LDY.W $0FB0,X 
    STA.W $0FAA,Y 
    STA.W $0FEA,Y 
    STA.W $102A,Y 
    STA.W $106A,Y 
    STA.W $10AA,Y 
    STA.W $10EA,Y 
    STA.W $112A,Y 
    RTS 


FlipShaktool:
    LDY.W $0FB0,X 
    LDA.W $106E,Y 
    EOR.W #$8000 
    STA.W $106E,Y 
    LDX.W $112A,Y 
    LDA.W $0FEA,Y 
    EOR.W #$8000 
    AND.W #$FF00 
    STA.W $112A,Y 
    TXA 
    EOR.W #$8000 
    AND.W #$FF00 
    STA.W $0FEA,Y 
    LDX.W $10EA,Y 
    LDA.W $102A,Y 
    EOR.W #$8000 
    AND.W #$FF00 
    STA.W $10EA,Y 
    TXA 
    EOR.W #$8000 
    AND.W #$FF00 
    STA.W $102A,Y 
    LDX.W $10AA,Y 
    LDA.W $106A,Y 
    EOR.W #$8000 
    AND.W #$FF00 
    STA.W $10AA,Y 
    TXA 
    EOR.W #$8000 
    AND.W #$FF00 
    STA.W $106A,Y 
    LDX.W $10FC,Y 
    LDA.W $0F7C,Y : STA.W $10FC,Y 
    TXA 
    STA.W $0F7C,Y 
    LDX.W $1100,Y 
    LDA.W $0F80,Y : STA.W $1100,Y 
    TXA 
    STA.W $0F80,Y 
    LDX.W $10FA,Y 
    LDA.W $0F7A,Y : STA.W $10FA,Y 
    TXA 
    STA.W $0F7A,Y 
    LDX.W $10FE,Y 
    LDA.W $0F7E,Y : STA.W $10FE,Y 
    TXA 
    STA.W $0F7E,Y 
    TYX 
    LDA.W #$8000 : STA.W $0FBC,X 
    STA.W $0FFC,X 
    STA.W $103C,X 
    STA.W $107C,X 
    STA.W $10BC,X 
    STA.W $0FC0,X 
    STA.W $1000,X 
    STA.W $1040,X 
    STA.W $1080,X 
    STA.W $10C0,X 
    RTS 


SetSHaktoolPieceNeighborAngleDeltaDueToBlockCollision:
    LDA.W #$0000 
    SEC 
    BIT.W $0FB4,X 
    BMI .antiClockwise 
    SBC.W $0FAA,X 
    CLC 
    ADC.W $0FA8,X 
    BRA + 


.antiClockwise:
    SBC.W $0FA8,X 
    CLC 
    ADC.W $0FAA,X 

  + XBA 
    AND.W #$00FF 
    ASL #2
    STA.W $0FAC,X 
    RTS 


PositionShaktoolPieceRelativeToPreviousPiece:
    LDA.W $0FAB,X 
    AND.W #$00FF 
    ASL A 
    TAY 
    STZ.B $12 
    STZ.B $14 
    LDA.W SineCosineTables_sine,Y 
    BPL + 
    DEC.B $14 

  + STA.B $13 
    LDA.B $12 
    CLC 
    ADC.W $0F3C,X 
    STA.W $0F7C,X 
    LDA.B $14 
    ADC.W $0F3A,X 
    STA.W $0F7A,X 
    STZ.B $12 
    STZ.B $14 
    LDA.W SineCosineTables_negativeCosine,Y 
    BPL + 
    DEC.B $14 

  + STA.B $13 
    LDA.B $12 
    CLC 
    ADC.W $0F40,X 
    STA.W $0F80,X 
    LDA.B $14 
    ADC.W $0F3E,X 
    STA.W $0F7E,X 
    RTS 


SetShaktoolPiecesNeighborAngleAndAngleDeltaForCurling:
    LDA.W $0FA8,X 
    JSR.W ShaktoolPiecesNeighborAngleInA 
    LDY.W $0FB0,X 
    LDA.W ShaktoolPieceData_initialCurlingNeighborAngleDelta : STA.W $0FAC,Y 
    LDA.W ShaktoolPieceData_initialCurlingNeighborAngleDelta_rightArm : STA.W $0FEC,Y 
    LDA.W ShaktoolPieceData_initialCurlingNeighborAngleDelta_centerRightArm : STA.W $102C,Y 
    LDA.W ShaktoolPieceData_initialCurlingNeighborAngleDelta_head : STA.W $106C,Y 
    LDA.W ShaktoolPieceData_initialCurlingNeighborAngleDelta_centerLeftArm : STA.W $10AC,Y 
    LDA.W ShaktoolPieceData_initialCurlingNeighborAngleDelta_leftArm : STA.W $10EC,Y 
    LDA.W ShaktoolPieceData_initialCurlingNeighborAngleDelta_leftSaw : STA.W $112C,Y 
    RTS 


MainAI_HurtAI_Shaktool:
    LDX.W $0E54 
    JSR.W ($0FB2,X) 
    RTL 


RTS_AADCAA:
    RTS 


RTS_AADCAB:
    RTS 


Function_Shaktool_ArmPiece_SetPosition_HandleCurling:
    JSR.W PositionShaktoolPieceRelativeToPreviousPiece 
    BIT.W $0FB4,X 
    BVC .notFullyCurled 
    LDA.W #$0100 
    CLC 
    ADC.W $0FA8,X 
    STA.W $0FA8,X 
    LDA.W #$0100 
    BRA + 


.notFullyCurled:
    LDA.W $0FAC,X 

  + BIT.W $0FB4,X 
    BPL .clockwise 
    EOR.W #$FFFF 
    INC A 

.clockwise:
    CLC 
    ADC.W $0FAA,X 
    STA.W $0FAA,X 
    RTS 


Function_Shaktool_Head:
    JSR.W Function_Shaktool_ArmPiece_SetPosition_HandleCurling 
    LDA.W $0FAA,X 
    EOR.W #$8000 
    STA.B $12 
    LDA.W $0FEA,X 
    SEC 
    SBC.B $12 
    LSR A 
    CLC 
    ADC.B $12 
    BIT.W $0FAE,X 
    BPL + 
    EOR.W #$8000 

  + XBA 
    CLC 
    ADC.W #$0008 
    AND.W #$00E0 
    SEP #$20 
    STA.W $0FAE,X 
    REP #$20 
    LSR #4
    TAY 
    LDA.W .pointers,Y : STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    RTS 


.pointers:
    dw InstList_Shaktool_Head_AimingUp 
    dw InstList_Shaktool_Head_AimingUpRight 
    dw InstList_Shaktool_Head_AimingRight 
    dw InstList_Shaktool_Head_AimingDownRight 
    dw InstList_Shaktool_Head_AimingDown 
    dw InstList_Shaktool_Head_AimingDownLeft 
    dw InstList_Shaktool_Head_AimingLeft 
    dw InstList_Shaktool_Head_AimingUpLeft 

Function_Shaktool_FinalPiece:
    LDA.W $0F7E,X 
    PHA 
    LDA.W $0F7A,X 
    PHA 
    JSR.W Function_Shaktool_ArmPiece_SetPosition_HandleCurling 
    LDA.W $0F7E,X 
    PHA 
    LDA.W $0F7A,X 
    PHA 
    LDA.B $05,S : STA.W $0F7A,X 
    LDA.B $07,S : STA.W $0F7E,X 
    STZ.B $12 
    LDA.B $01,S 
    SEC 
    SBC.B $05,S 
    STA.B $14 
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes 
    BCS .collision 
    LDA.B $07,S : STA.W $0F7E,X 
    STZ.B $12 
    LDA.B $03,S 
    SEC 
    SBC.B $07,S 
    STA.B $14 
    JSL.L MoveEnemyDownBy_14_12 
    BCS .collision 
    PLA 
    STA.W $0F7A,X 
    PLA 
    STA.W $0F7E,X 
    PLA 
    PLA 
    BIT.W $0FB4,X 
    BVC .notFullyCurled 
    LDA.W #$0100 
    CLC 
    ADC.W $0FA8,X 
    STA.W $0FA8,X 
    RTS 


.notFullyCurled:
    LDA.W $0FAA,X 
    EOR.W $0FA8,X 
    AND.W #$FF00 
    BNE + 
    JSR.W SetShaktoolPiecesNeighborAngleAndAngleDeltaForCurling 
    LDA.W #$7800 : STA.W $0FAE,X 
    LDA.W $0FB4,X 
    AND.W #$DFFF 
    JSR.W ShaktoolPiecesMovementOptionsInA 
    LDA.W $0FAE,X 
    AND.W #$FF00 
    STA.W $0FAE,X 

  + LDA.W $0FAC,X 
    CLC 
    ADC.W $0FAE,X 
    STA.W $0FAE,X 
    CMP.W #$F000 
    BCC .return 
    LDY.W $0FB0,X 
    LDA.W $0FB4,X 
    ORA.W #$4000 
    JSR.W ShaktoolPiecesMovementOptionsInA 

.return:
    JSR.W RTS_AADAE4 
    RTS 


.collision:
    LDA.W $0FB4,X 
    BIT.W #$2000 
    BEQ .curling 
    PLA 
    PLA 
    PLA 
    PLA 
    LDA.W $0FB4,X 
    EOR.W #$8000 
    AND.W #$8FFF 
    JSR.W ShaktoolPiecesMovementOptionsInA 
    BRA + 


.curling:
    PLA 
    PLA 
    PLA 
    STA.W $0F7A,X 
    PLA 
    STA.W $0F7E,X 
    JSR.W FlipShaktool 
    LDX.W $0E54 
    LDA.W $0FB4,X 
    ORA.W #$2000 
    JSR.W ShaktoolPiecesMovementOptionsInA 
    LDA.W $0FB4,X 
    AND.W #$BFFF 
    JSR.W ShaktoolPiecesMovementOptionsInA 

  + STZ.W $0FAE,X 
    LDY.W $0FB0,X 
    JSL.L CalculateAngleOfEnemyYFromEnemyX 
    XBA 
    AND.W #$FF00 
    BIT.W $0FB4,X 
    BMI .antiClockwise 
    CLC 
    ADC.W #$4000 
    BRA + 


.antiClockwise:
    SEC 
    SBC.W #$4000 

  + JSR.W ShaktoolPiecesFacingAngleInA 
    LDY.W #$000C 

.loop:
    JSR.W SetSHaktoolPieceNeighborAngleDeltaDueToBlockCollision 
    LDA.W #RTS_AADCAA : STA.W $0FB2,X 
    LDA.W ShaktoolPieceData_headBobInstListPointer,Y : STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    TXA 
    SEC 
    SBC.W #$0040 
    TAX 
    DEY #2
    BPL .loop 
    RTS 


InitAI_Shaktool:
    LDX.W $0E54 
    LDA.W #$0001 : STA.W $0F94,X 
    STZ.W $0F90,X 
    LDA.W #$0000 : STA.W $0FA8,X 
    STA.W $0FAE,X 
    LDY.W $0FB6,X 
    LDA.W $0F86,X 
    ORA.W ShaktoolPieceData_properties,Y 
    STA.W $0F86,X 
    TXA 
    SEC 
    SBC.W ShaktoolPieceData_RAMOffset,Y 
    STA.W $0FB0,X 
    LDA.W ShaktoolPieceData_functionPointer,Y : STA.W $0FB2,X 
    LDA.W ShaktoolPieceData_initialCurlingNeighborAngleDelta,Y 
    SEC 
    SBC.W ShaktoolPieceData_zero,Y 
    STA.W $0FAC,X 
    LDA.W ShaktoolPieceData_initialNeighborAngle,Y : STA.W $0FAA,X 
    LDA.W ShaktoolPieceData_initialInstListPointer,Y : STA.W $0F92,X 
    LDA.W ShaktoolPieceData_layerControl,Y : STA.W $0F9A,X 
    TYA 
    BEQ .return 
    JSR.W PositionShaktoolPieceRelativeToPreviousPiece 

.return:
    RTL 


ShaktoolPieceData_properties:
    dw $2800,$2C00,$2C00,$2C00,$2C00,$2C00,$2800 

ShaktoolPieceData_RAMOffset:
    dw $0000,$0040,$0080,$00C0,$0100,$0140,$0180 

ShaktoolPieceData_initialNeighborAngle:
    dw $0000,$F800,$E800,$D000,$B000,$9800,$8800 

ShaktoolPieceData_initialInstListPointer:
    dw InstList_Shaktool_SawHand_PrimaryPiece 
    dw InstList_Shaktool_ArmPiece_Normal 
    dw InstList_Shaktool_ArmPiece_Normal 
    dw InstList_Shaktool_Head_AimingDown 
    dw InstList_Shaktool_ArmPiece_Normal 
    dw InstList_Shaktool_ArmPiece_Normal 
    dw InstList_Shaktool_SawHand_PrimaryPiece 

ShaktoolPieceData_layerControl:
    dw $0002,$0004,$0004,$0002,$0004,$0004,$0002 

ShaktoolPieceData_functionPointer:
    dw RTS_AADCAB 

ShaktoolPieceData_functionPointer_rightArm:
    dw Function_Shaktool_ArmPiece_SetPosition_HandleCurling 

ShaktoolPieceData_functionPointer_centerRightArm:
    dw Function_Shaktool_ArmPiece_SetPosition_HandleCurling 

ShaktoolPieceData_functionPointer_head:
    dw Function_Shaktool_Head 

ShaktoolPieceData_functionPointer_centerLeftArm:
    dw Function_Shaktool_ArmPiece_SetPosition_HandleCurling 

ShaktoolPieceData_functionPointer_leftArm:
    dw Function_Shaktool_ArmPiece_SetPosition_HandleCurling 

ShaktoolPieceData_functionPointer_leftSaw:
    dw Function_Shaktool_FinalPiece 

ShaktoolPieceData_initialCurlingNeighborAngleDelta:
    dw $0000 

ShaktoolPieceData_initialCurlingNeighborAngleDelta_rightArm:
    dw $0020 

ShaktoolPieceData_initialCurlingNeighborAngleDelta_centerRightArm:
    dw $0060 

ShaktoolPieceData_initialCurlingNeighborAngleDelta_head:
    dw $00C0 

ShaktoolPieceData_initialCurlingNeighborAngleDelta_centerLeftArm:
    dw $0140 

ShaktoolPieceData_initialCurlingNeighborAngleDelta_leftArm:
    dw $01A0 

ShaktoolPieceData_initialCurlingNeighborAngleDelta_leftSaw:
    dw $01E0 

ShaktoolPieceData_zero:
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000 

if !FEATURE_KEEP_UNREFERENCED
ShaktoolPieceData_unused:
    dw $0000,$0000,$0002,$0004,$0006,$0008,$000A 
endif ; !FEATURE_KEEP_UNREFERENCED

ShaktoolPieceData_headBobInstListPointer:
    dw InstList_Shaktool_SawHand_HeadBob_PrimaryPiece 
    dw InstList_Shaktool_ArmPiece_HeadBob_Back 
    dw InstList_Shaktool_ArmPiece_HeadBob_Front 
    dw InstList_Shaktool_Head_HeadBob 
    dw InstList_Shaktool_ArmPiece_HeadBob_Front 
    dw InstList_Shaktool_ArmPiece_HeadBob_Back 
    dw InstList_Shaktool_SawHand_HeadBob_FinalPiece 

ShaktoolPieceData_unusedAttackInstListPointer:
    dw UNUSED_InstList_Shaktool_SawHand_Attack_PrimaryPiece_AAD9EA 
    dw UNUSED_InstList_Shaktool_ArmPiece_Attack_Back_AADA2E 
    dw UNUSED_InstList_Shaktool_ArmPiece_Attack_Front_AADA42 
    dw UNUSED_InstList_Shaktool_Head_Attack_AADA7A 
    dw UNUSED_InstList_Shaktool_ArmPiece_Attack_Front_AADA42 
    dw UNUSED_InstList_Shaktool_ArmPiece_Attack_Back_AADA2E 
    dw UNUSED_InstList_Shaktool_SawHand_Attack_FinalPiece_AAD9F2 

EnemyTouch_Shaktool:
    JSL.L NormalEnemyTouchAI 
    RTL 


EnemyShot_Shaktool:
    JSL.L NormalEnemyShotAI 
    LDX.W $0E54 
    LDA.W $0F8C,X 
    BNE .return 
    LDY.W $0FB0,X 
    LDA.W #$0200 : STA.W $0F86,Y 
    STA.W $0FC6,Y 
    STA.W $1006,Y 
    STA.W $1046,Y 
    STA.W $1086,Y 
    STA.W $10C6,Y 
    STA.W $1106,Y 

.return:
    RTL 


Spritemaps_Shaktool_SawHand_FinalPiece_0:
    dw $0001,$81F8 
    db $F8 
    dw $2100 

Spritemaps_Shaktool_SawHand_FinalPiece_1:
    dw $0001,$81F8 
    db $F8 
    dw $2102 

Spritemaps_Shaktool_SawHand_FinalPiece_2:
    dw $0001,$81F8 
    db $F8 
    dw $2104 

Spritemaps_Shaktool_ArmPiece:
    dw $0001,$81F8 
    db $F8 
    dw $2106 

Spritemaps_Shaktool_Head_0:
    dw $0004,$81F8 
    db $F8 
    dw $2108,$0001 
    db $F6 
    dw $211F,$0001 
    db $02 
    dw $211F,$01F0 
    db $FC 
    dw $210E 

Spritemaps_Shaktool_Head_1:
    dw $0004,$01F4 
    db $F4 
    dw $210F,$81F8 
    db $F8 
    dw $610C,$0004 
    db $FC 
    dw $211F,$01FC 
    db $04 
    dw $211F 

Spritemaps_Shaktool_Head_2:
    dw $0004,$81F8 
    db $F8 
    dw $210A,$0002 
    db $01 
    dw $211F,$01F6 
    db $01 
    dw $211F,$01FC 
    db $F0 
    dw $211E 

Spritemaps_Shaktool_Head_3:
    dw $0004,$0004 
    db $F4 
    dw $610F,$81F8 
    db $F8 
    dw $210C,$01FC 
    db $04 
    dw $211F,$01F4 
    db $FC 
    dw $211F 

Spritemaps_Shaktool_Head_4:
    dw $0004,$81F8 
    db $F8 
    dw $6108,$01F7 
    db $02 
    dw $211F,$01F7 
    db $F6 
    dw $211F,$0008 
    db $FC 
    dw $610E 

Spritemaps_Shaktool_Head_5:
    dw $0004,$0004 
    db $04 
    dw $E10F,$81F8 
    db $F8 
    dw $A10C,$01F4 
    db $FC 
    dw $211F,$01FC 
    db $F4 
    dw $211F 

Spritemaps_Shaktool_Head_6:
    dw $0004,$81F8 
    db $F8 
    dw $A10A,$0002 
    db $F7 
    dw $211F,$01F6 
    db $F7 
    dw $211F,$01FC 
    db $08 
    dw $A11E 

Spritemaps_Shaktool_Head_7:
    dw $0004,$01F4 
    db $04 
    dw $A10F,$81F8 
    db $F8 
    dw $E10C,$0004 
    db $FC 
    dw $211F,$01FC 
    db $F4 
    dw $211F 

Spritemaps_Shaktool_SawHand_PrimaryPiece_0:
    dw $0001,$81F8 
    db $F8 
    dw $6100 

Spritemaps_Shaktool_SawHand_PrimaryPiece_1:
    dw $0001,$81F8 
    db $F8 
    dw $6102 

Spritemaps_Shaktool_SawHand_PrimaryPiece_2:
    dw $0001,$81F8 
    db $F8 
    dw $6104 

SineCosineTables_negativeCosine:
    dw $F401,$F401,$F404,$F409,$F40F,$F418,$F422,$F42E 
    dw $F43C,$F44B,$F45D,$F470,$F485,$F49C,$F4B4,$F4CE 
    dw $F4EA,$F508,$F527,$F549,$F56B,$F590,$F5B6,$F5DD 
    dw $F606,$F631,$F65D,$F68B,$F6BA,$F6EA,$F71C,$F750 
    dw $F784,$F7BA,$F7F1,$F82A,$F864,$F89E,$F8DA,$F918 
    dw $F956,$F995,$F9D5,$FA16,$FA58,$FA9B,$FADF,$FB24 
    dw $FB69,$FBAF,$FBF6,$FC3D,$FC85,$FCCD,$FD16,$FD5F 
    dw $FDA9,$FDF3,$FE3E,$FE88,$FED3,$FF1E,$FF6A,$FFB5 

SineCosineTables_sine:
    dw $0000,$004B,$0096,$00E1,$012D,$0178,$01C2,$020D 
    dw $0257,$02A1,$02EA,$0333,$037B,$03C3,$040A,$0451 
    dw $0497,$04DC,$0521,$0565,$05A8,$05EA,$062B,$066B 
    dw $06AA,$06E8,$0725,$0761,$079C,$07D6,$080F,$0846 
    dw $087C,$08B0,$08E4,$0916,$0946,$0975,$09A3,$09CF 
    dw $09FA,$0A23,$0A4A,$0A70,$0A95,$0AB7,$0AD9,$0AF8 
    dw $0B16,$0B32,$0B4C,$0B64,$0B7B,$0B90,$0BA3,$0BB5 
    dw $0BC4,$0BD2,$0BDE,$0BE8,$0BF1,$0BF7,$0BFC,$0BFF 

SineCosineTables_cosine:
    dw $0BFF,$0BFF,$0BFC,$0BF7,$0BF1,$0BE8,$0BDE,$0BD2 
    dw $0BC4,$0BB5,$0BA3,$0B90,$0B7B,$0B64,$0B4C,$0B32 
    dw $0B16,$0AF8,$0AD9,$0AB7,$0A95,$0A70,$0A4A,$0A23 
    dw $09FA,$09CF,$09A3,$0975,$0946,$0916,$08E4,$08B0 
    dw $087C,$0846,$080F,$07D6,$079C,$0761,$0725,$06E8 
    dw $06AA,$066B,$062B,$05EA,$05A8,$0565,$0521,$04DC 
    dw $0497,$0451,$040A,$03C3,$037B,$0333,$02EA,$02A1 
    dw $0257,$020D,$01C2,$0178,$012D,$00E1,$0096,$004B 

SineCosineTables_negativeSine:
    dw $0000,$FFB5,$FF6A,$FF1F,$FED3,$FE88,$FE3E,$FDF3 
    dw $FDA9,$FD5F,$FD16,$FCCD,$FC85,$FC3D,$FBF6,$FBAF 
    dw $FB69,$FB24,$FADF,$FA9B,$FA58,$FA16,$F9D5,$F995 
    dw $F956,$F918,$F8DB,$F89F,$F864,$F82A,$F7F1,$F7BA 
    dw $F784,$F750,$F71C,$F6EA,$F6BA,$F68B,$F65D,$F631 
    dw $F606,$F5DD,$F5B6,$F590,$F56B,$F549,$F527,$F508 
    dw $F4EA,$F4CE,$F4B4,$F49C,$F485,$F470,$F45D,$F44B 
    dw $F43C,$F42E,$F422,$F418,$F40F,$F409,$F404,$F401 

SineCosineTables_negativeCosine_duplicate:
    dw $F401,$F401,$F404,$F409,$F40F,$F418,$F422,$F42E 
    dw $F43C,$F44B,$F45D,$F470,$F485,$F49C,$F4B4,$F4CE 
    dw $F4EA,$F508,$F527,$F549,$F56B,$F590,$F5B6,$F5DD 
    dw $F606,$F631,$F65D,$F68B,$F6BA,$F6EA,$F71C,$F750 
    dw $F784,$F7BA,$F7F1,$F82A,$F864,$F89E,$F8DA,$F918 
    dw $F956,$F995,$F9D5,$FA16,$FA58,$FA9B,$FADF,$FB24 
    dw $FB69,$FBAF,$FBF6,$FC3D,$FC85,$FCCD,$FD16,$FD5F 
    dw $FDA9,$FDF3,$FE3E,$FE88,$FED3,$FF1E,$FF6A,$FFB5 

Palette_NoobTubeCrack_Initial:
    dw $3800,$7F9C,$7F17,$6E72,$59EE,$456A,$3528,$28E6 
    dw $777F,$66FB,$5676,$45F2,$358D,$2509,$1484,$0400 

Palette_NoobTubeCrack_SpritePalette1:
    dw $3800,$7F9C,$7F17,$6E72,$59EE,$456A,$3528,$28E6 
    dw $777F,$66FB,$5676,$45F2,$358D,$2509,$1484,$0400 

Palette_NoobTubeCrack_SpritePalette2:
    dw $3800,$7F9C,$7F17,$6E72,$59EE,$456A,$3528,$28E6 
    dw $777F,$66FB,$5676,$45F2,$358D,$2509,$1484,$0400 

Palette_Chozo_WreckedShip_SpritePalette1:
    dw $3800,$633F,$4A9F,$2DDF,$6739,$4E73,$318C,$18C6 
    dw $27FF,$1AF7,$0DCE,$00C6,$3FFF,$2B39,$7FFF,$0000 

Palette_Chozo_WreckedShip_SpritePalette2:
    dw $3800,$633F,$4A9F,$2DDF,$4210,$318C,$2108,$1084 
    dw $27FF,$1AF7,$0DCE,$00C6,$3FFF,$2B39,$5294,$0000 

Palette_Chozo_LowerNorfair_SpritePalette1:
    dw $3800,$633F,$4A9F,$2DDF,$2F7C,$2295,$118D,$08E8 
    dw $27FF,$1AF7,$0DCE,$00C6,$3FFF,$2B39,$73DF,$0043 

Palette_Chozo_LowerNorfair_SpritePalette2:
    dw $3800,$633F,$4A9F,$2DDF,$2295,$118D,$08E8,$0085 
    dw $27FF,$1AF7,$0DCE,$00C6,$3FFF,$2B39,$5294,$0001 

InstList_Chozo_LowerNorfair_Initial:
    dw Instruction_Common_Enemy0FB2_InY 
    dw Function_Chozo_LowerNorfair 
    dw $0001 
    dw Spritemaps_Chozo_13 
    dw Instruction_Common_Sleep 

InstList_Chozo_LowerNorfair_Activated_0:
    dw Instruction_Common_SetEnemy0FB2ToRTS 
    dw Instruction_Chozo_Movement_IndexInY 
    dw $0020,$0020 
    dw Spritemaps_Chozo_13 
    dw Instruction_Chozo_Movement_IndexInY 
    dw $0022,$0008 
    dw Spritemaps_Chozo_14 
    dw Instruction_Chozo_Movement_IndexInY 
    dw $0024,$0030 
    dw Spritemaps_Chozo_15 
    dw Instruction_Chozo_PlayChozoGrabsSamusSFX 
    dw Instruction_Chozo_Movement_IndexInY 
    dw $0026,$0040 
    dw Spritemaps_Chozo_16 
    dw $0006 
    dw Spritemaps_Chozo_1F 
    dw $0008 
    dw Spritemaps_Chozo_20 
    dw $000A 
    dw Spritemaps_Chozo_21 
    dw $000C 
    dw Spritemaps_Chozo_22 
    dw $0060 
    dw Spritemaps_Chozo_23 
    dw Instruction_Chozo_StartLoweringAcid 
    dw Instruction_Common_TimerInY 
    dw $0005 

InstList_Chozo_LowerNorfair_Activated_1:
    dw $000B 
    dw Spritemaps_Chozo_20 
    dw $0008 
    dw Spritemaps_Chozo_21 
    dw $0006 
    dw Spritemaps_Chozo_22 
    dw $0008 
    dw Spritemaps_Chozo_23 
    dw $0006 
    dw Spritemaps_Chozo_22 
    dw $0008 
    dw Spritemaps_Chozo_21 
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate 
    dw InstList_Chozo_LowerNorfair_Activated_1 
    dw Instruction_Common_SetEnemy0FB2ToRTS 
    dw Instruction_Chozo_Movement_IndexInY 
    dw $0026,$0080 
    dw Spritemaps_Chozo_16 
    dw Instruction_Chozo_Movement_IndexInY 
    dw $0024,$0050 
    dw Spritemaps_Chozo_15 
    dw Instruction_Chozo_Movement_IndexInY 
    dw $0022,$0008 
    dw Spritemaps_Chozo_14 
    dw Instruction_Chozo_Movement_IndexInY 
    dw $0020,$0020 
    dw Spritemaps_Chozo_13 
    dw Instruction_Chozo_UnlockSamus 
    dw Instruction_Chozo_SetLoweredAcidPosition 
    dw Instruction_Common_Sleep 

Instruction_Chozo_StartLoweringAcid:
    LDA.W #$0020 : STA.W $1980 
    LDA.W #$0040 : STA.W $197C 
    RTL 


Instruction_Chozo_SetLoweredAcidPosition:
    LDA.W #$02D2 : STA.W $1978 
    RTL 


Instruction_Chozo_UnlockSamus:
    LDA.W #$0001 
    JSL.L Run_Samus_Command 
    RTL 


Function_Chozo_LowerNorfair:
    LDA.W $0FB4,X 
    BEQ .return 
    LDA.W #InstList_Chozo_LowerNorfair_Activated_0 : STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 

.return:
    RTS 


InstList_Chozo_WreckedShip_Initial:
    dw Instruction_Common_Enemy0FB2_InY 
    dw Function_Chozo_WreckedShip 
    dw $0001 
    dw Spritemaps_Chozo_0 
    dw Instruction_Common_Sleep 

InstList_Chozo_WreckedShip_Activated_0:
    dw Instruction_Common_SetEnemy0FB2ToRTS 
    dw Instruction_Chozo_Movement_IndexInY 
    dw $0000,$0020 
    dw Spritemaps_Chozo_0 
    dw Instruction_Chozo_Movement_IndexInY 
    dw $0002,$0008 
    dw Spritemaps_Chozo_1 
    dw Instruction_Chozo_Movement_IndexInY 
    dw $0004,$0050 
    dw Spritemaps_Chozo_2 
    dw Instruction_Chozo_PlayChozoGrabsSamusSFX 
    dw Instruction_Chozo_Movement_IndexInY 
    dw $0006,$0080 
    dw Spritemaps_Chozo_3 
    dw $0006 
    dw Spritemaps_Chozo_C 
    dw $0008 
    dw Spritemaps_Chozo_D 
    dw $000A 
    dw Spritemaps_Chozo_E 
    dw $000C 
    dw Spritemaps_Chozo_F 
    dw $0080 
    dw Spritemaps_Chozo_10 
    dw Instruction_Common_TimerInY 
    dw $0004 

InstList_Chozo_WreckedShip_Activated_1:
    dw $000B 
    dw Spritemaps_Chozo_D 
    dw $0008 
    dw Spritemaps_Chozo_E 
    dw $0006 
    dw Spritemaps_Chozo_F 
    dw $0008 
    dw Spritemaps_Chozo_10 
    dw $0006 
    dw Spritemaps_Chozo_F 
    dw $0008 
    dw Spritemaps_Chozo_E 
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate 
    dw InstList_Chozo_WreckedShip_Activated_1 
    dw Instruction_Common_Enemy0FB2_InY 
    dw RTS_AAE7DA 
    dw Instruction_Common_TimerInY 
    dw $0010 

InstList_Chozo_WreckedShip_Activated_2:
    dw Instruction_Chozo_Movement_IndexInY 
    dw $0016 
    dw Instruction_Chozo_SpawnChozoSpikeClearingFootstepProjectile 
    dw $FFF8,$0008 
    dw Spritemaps_Chozo_B 
    dw Instruction_Chozo_PlayChozoFootstepsSFX 
    dw Instruction_Chozo_Movement_IndexInY 
    dw $0008 
    dw Instruction_Chozo_SpawnChozoSpikeClearingFootstepProjectile 
    dw $FFEC,$000B 
    dw Spritemaps_Chozo_4 
    dw Instruction_Chozo_Movement_IndexInY 
    dw $000A 
    dw Instruction_Chozo_SpawnChozoSpikeClearingFootstepProjectile 
    dw $FFF0,$0008 
    dw Spritemaps_Chozo_5 
    dw Instruction_Chozo_Movement_IndexInY 
    dw $000C 
    dw Instruction_Chozo_SpawnChozoSpikeClearingFootstepProjectile 
    dw $0000,$0006 
    dw Spritemaps_Chozo_6 
    dw Instruction_Chozo_Movement_IndexInY 
    dw $000E 
    dw Instruction_Chozo_SpawnChozoSpikeClearingFootstepProjectile 
    dw $FFF8,$0008 
    dw Spritemaps_Chozo_7 
    dw Instruction_Chozo_PlayChozoFootstepsSFX 
    dw Instruction_Chozo_Movement_IndexInY 
    dw $0010 
    dw Instruction_Chozo_SpawnChozoSpikeClearingFootstepProjectile 
    dw $FFEC,$000B 
    dw Spritemaps_Chozo_8 
    dw Instruction_Chozo_Movement_IndexInY 
    dw $0012 
    dw Instruction_Chozo_SpawnChozoSpikeClearingFootstepProjectile 
    dw $FFF0,$0008 
    dw Spritemaps_Chozo_9 
    dw Instruction_Chozo_Movement_IndexInY 
    dw $0014 
    dw Instruction_Chozo_SpawnChozoSpikeClearingFootstepProjectile 
    dw $0000,$0006 
    dw Spritemaps_Chozo_A 
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate 
    dw InstList_Chozo_WreckedShip_Activated_2 
    dw Instruction_Chozo_Movement_IndexInY 
    dw $0016 
    dw Instruction_Chozo_SpawnChozoSpikeClearingFootstepProjectile 
    dw $FFF8,$0008 
    dw Spritemaps_Chozo_B 
    dw Instruction_Chozo_Movement_IndexInY 
    dw $0008 
    dw Instruction_Chozo_SpawnChozoSpikeClearingFootstepProjectile 
    dw $FFEC,$000B 
    dw Spritemaps_Chozo_4 
    dw Instruction_Chozo_Movement_IndexInY 
    dw $000A 
    dw Instruction_Chozo_SpawnChozoSpikeClearingFootstepProjectile 
    dw $FFF0,$0008 
    dw Spritemaps_Chozo_5 
    dw Instruction_Chozo_Movement_IndexInY 
    dw $000C 
    dw Instruction_Chozo_SpawnChozoSpikeClearingFootstepProjectile 
    dw $0000,$0006 
    dw Spritemaps_Chozo_6 
    dw Instruction_Common_SetEnemy0FB2ToRTS 
    dw Instruction_Chozo_Movement_IndexInY 
    dw $0006,$0080 
    dw Spritemaps_Chozo_3 
    dw Instruction_Chozo_Movement_IndexInY 
    dw $0004,$0050 
    dw Spritemaps_Chozo_2 
    dw Instruction_Chozo_Movement_IndexInY 
    dw $0002,$0008 
    dw Spritemaps_Chozo_1 
    dw Instruction_Chozo_Movement_IndexInY 
    dw $0000,$0020 
    dw Spritemaps_Chozo_0 
    dw Instruction_Chozo_ReleaseSamus_BlockSlopeAccess 
    dw Instruction_Common_Sleep 

Instruction_Chozo_PlayChozoGrabsSamusSFX:
    LDA.W #$001C 
    JSL.L QueueSound_Lib2_Max6 
    RTL 


Instruction_Chozo_PlayChozoFootstepsSFX:
    LDA.W #$004B 
    JSL.L QueueSound_Lib2_Max6 
    RTL 


Instruction_Chozo_SpawnChozoSpikeClearingFootstepProjectile:
    PHX 
    PHY 
    LDA.W $0F7A,X 
    CLC 
    ADC.W $0000,Y 
    PHA 
    LDA.W $0F7E,X 
    CLC 
    ADC.W #$001C 
    PHA 
    JSL.L CalculateTheBlockContainingAPixelPosition 
    LDA.W $0DC4 
    CLC 
    ADC.W $07A5 
    ASL A 
    TAX 
    LDA.L $7F0002,X 
    AND.W #$F000 
    CMP.W #$A000 
    BNE .return 
    TXA 
    SEC 
    SBC.W $07A5 
    TAX 
    LDA.W #PLMEntries_CrumbleLowerNorfairChozoRoomPlug 
    JSL.L Spawn_PLM_to_CurrentBlockIndex 
    PLY 
    PHY 
    LDA.W $0000,Y 
    LDY.W #EnemyProjectile_WreckedShipChozoSpikeClearingFootsteps 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 

.return:
    PLY 
    PLX 
    INY #2
    RTL 


Instruction_Chozo_Movement_IndexInY:
    LDA.W $0000,Y : STA.W $0FAC,X 
    PHY 
    STZ.B $12 
    STZ.B $14 
    LDY.W $0FAC,X 
    LDA.W .XVelocity,Y 
    BPL + 
    DEC.B $14 

  + STA.B $13 
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes 
    BCS .goingNowhere ; >_<

.goingNowhere:
    STZ.B $12 
    STZ.B $14 
    LDY.W $0FAC,X 
    LDA.W .XVelocity,Y 
    BPL + 
    EOR.W #$FFFF 
    INC A 

  + BPL + 
    DEC.B $14 

  + STA.B $13 
    JSL.L MoveEnemyDownBy_14_12 
    BCS .move 

.move:
    JSL.L AlignEnemyYPositionWIthNonSquareSlope 
    LDY.W $0FAC,X 
    LDA.W $0F7A,X 
    CLC 
    ADC.W .XOffsets,Y 
    STA.W $0AF6 
    LDA.W $0F7E,X 
    CLC 
    ADC.W .YOffsets,Y 
    STA.W $0AFA 
    PLY 
    INY #2
    RTL 


.XVelocity:
    dw $0000,$0000,$0000,$0000,$FE00,$FD00,$F200,$F800 
    dw $FE00,$FD00,$F200,$F800,$0000,$0000,$0000,$0000 
    dw $0000,$0000,$0000,$0000,$0200,$0300,$0E00,$0800 
    dw $0200,$0300,$0E00,$0800,$0000,$0000,$0000,$0000 

.XOffsets:
    dw $FFE4,$FFE2,$FFE0,$FFE0,$FFE0,$FFE0,$FFE0,$FFE0 
    dw $FFE0,$FFE0,$FFE0,$FFE0,$FFE0,$FFE0,$FFE0,$FFE0 
    dw $001C,$001E,$0020,$0020,$0020,$0020,$0020,$0020 
    dw $0020,$0020,$0020,$0020,$0020,$0020,$0020,$0020 

.YOffsets:
    dw $FFE0,$FFE7,$FFE9,$FFE9,$FFE9,$FFE8,$FFE7,$FFE8 
    dw $FFE9,$FFE8,$FFE7,$FFE8,$FFE9,$FFE9,$FFE9,$FFE9 
    dw $FFE0,$FFE7,$FFE9,$FFE9,$FFE9,$FFE8,$FFE7,$FFE8 
    dw $FFE9,$FFE8,$FFE7,$FFE8,$FFE9,$FFE9,$FFE9,$FFE9 

Instruction_Chozo_ReleaseSamus_BlockSlopeAccess:
    LDA.W #$0001 
    JSL.L Run_Samus_Command 
    LDA.W #$0000 : STA.L $7ECD26 
    STA.L $7ECD28 
    STA.L $7ECD29 
    LDA.W #$0001 : STA.L $7ECD2D 
    JSL.L Spawn_Hardcoded_PLM 
    db $17,$1D 
    dw PLMEntries_BlockSlopeAccessForWreckedShipChozo 
    RTL 


InitAI_NoobTubeCrack:
    LDX.W #$003E 

.loop:
    LDA.W Palette_NoobTubeCrack_SpritePalette1,X : STA.L $7EC320,X 
    DEX #2
    BPL .loop 
    RTL 


InitAI_Chozo:
    LDX.W $0E54 
    LDA.W $0F86,X 
    ORA.W #$A800 
    STA.W $0F86,X 
    LDA.W #Spritemap_CommonAA_Nothing : STA.W $0F8E,X 
    LDA.W #$0001 : STA.W $0F94,X 
    STZ.W $0F90,X 
    LDA.W #RTS_AAE7A6 : STA.W $0FB2,X 
    LDA.W #$0000 : STA.W $0FB4,X 
    STZ.W $0F96,X 
    STZ.W $0F9A 
    LDY.W $0FB6,X 
    LDA.W .instListPointers,Y : STA.W $0F92,X 
    TYA 
    BNE .lowerNorfair 
    LDX.W #$001E 

.loopWreckedShip:
    LDA.W Palette_Chozo_WreckedShip_SpritePalette2,X : STA.L $7EC340,X 
    LDA.W Palette_Chozo_WreckedShip_SpritePalette1,X : STA.L $7EC320,X 
    DEX #2
    BPL .loopWreckedShip 
    JSL.L Spawn_Hardcoded_PLM 
    db $4A,$17 
    dw PLMEntries_WreckedShipChozoHand 
    JSL.L Spawn_Hardcoded_PLM 
    db $17,$1D 
    dw PLMEntries_BlockSlopeAccessForWreckedShipChozo 
    RTL 


.lowerNorfair:
    LDX.W #$001E 

.loop:
    LDA.W Palette_Chozo_LowerNorfair_SpritePalette2,X : STA.L $7EC340,X 
    LDA.W Palette_Chozo_LowerNorfair_SpritePalette1,X : STA.L $7EC320,X 
    DEX #2
    BPL .loop 
    JSL.L Spawn_Hardcoded_PLM 
    db $0C,$1D 
    dw PLMEntries_LowerNorfairChozoHand 
    RTL 


.instListPointers:
    dw InstList_Chozo_WreckedShip_Initial 
    dw InstList_Chozo_LowerNorfair_Initial 

RTS_AAE7A6:
    RTS 


MainAI_Chozo:
    LDX.W $0E54 
    JSR.W ($0FB2,X) 
    RTL 


Function_Chozo_WreckedShip:
    PHX 
    LDX.W $079F 
    LDA.L $7ED828,X 
    PLX 
    AND.W #$0001 
    BEQ .return 
    LDA.W $0FB4,X 
    BEQ .return 
    LDA.W #InstList_Chozo_WreckedShip_Activated_0 : STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    LDA.W #$FF00 : STA.W $0FA8,X 
    LDA.W #$0100 : STA.W $0FAA,X 

.return:
    RTS 


RTS_AAE7DA:
    RTS 


RTL_AAE7DB:
    RTL 


RTL_AAE7DC:
    RTL 


Spritemaps_Chozo_0:
    dw $0012,$01FA 
    db $DF 
    dw $237D,$C3D6 
    db $E7 
    dw $2320,$01E6 
    db $E7 
    dw $230F,$C3E6 
    db $EF 
    dw $2322,$C3ED 
    db $EC 
    dw $230D,$C3F5 
    db $E4 
    dw $230B,$C3F2 
    db $1F 
    dw $2370,$C3FA 
    db $1F 
    dw $2371,$C3FA 
    db $0D 
    dw $234C,$C3FA 
    db $15 
    dw $235C,$C3F9 
    db $05 
    dw $2350,$C3F9 
    db $FD 
    dw $2340,$C3F4 
    db $F7 
    dw $2308,$C3FC 
    db $F7 
    dw $2309,$C3FC 
    db $E7 
    dw $2306,$C3EC 
    db $E7 
    dw $2304,$C3FC 
    db $D7 
    dw $2302,$C3EC 
    db $D7 
    dw $2300 

Spritemaps_Chozo_1:
    dw $0011,$01FA 
    db $DF 
    dw $237D,$C3E9 
    db $ED 
    dw $232A,$C3D9 
    db $ED 
    dw $2328,$C3ED 
    db $EC 
    dw $230D,$C3F5 
    db $E4 
    dw $230B,$C3F2 
    db $1F 
    dw $2370,$C3FA 
    db $1F 
    dw $2371,$C3FA 
    db $0D 
    dw $234C,$C3FA 
    db $15 
    dw $235C,$C3F9 
    db $05 
    dw $2350,$C3F9 
    db $FD 
    dw $2340,$C3F4 
    db $F7 
    dw $2308,$C3FC 
    db $F7 
    dw $2309,$C3FC 
    db $E7 
    dw $2306,$C3EC 
    db $E7 
    dw $2304,$C3FC 
    db $D7 
    dw $2302,$C3EC 
    db $D7 
    dw $2300 

Spritemaps_Chozo_2:
    dw $0011,$C3E8 
    db $ED 
    dw $2326,$C3D8 
    db $ED 
    dw $2324,$01FA 
    db $DF 
    dw $237D,$C3ED 
    db $EC 
    dw $230D,$C3F5 
    db $E4 
    dw $230B,$C3F2 
    db $1F 
    dw $2370,$C3FA 
    db $1F 
    dw $2371,$C3FA 
    db $0D 
    dw $234C,$C3FA 
    db $15 
    dw $235C,$C3F9 
    db $05 
    dw $2350,$C3F9 
    db $FD 
    dw $2340,$C3F4 
    db $F7 
    dw $2308,$C3FC 
    db $F7 
    dw $2309,$C3FC 
    db $E7 
    dw $2306,$C3EC 
    db $E7 
    dw $2304,$C3FC 
    db $D7 
    dw $2302,$C3EC 
    db $D7 
    dw $2300 

Spritemaps_Chozo_3:
    dw $0012,$C3E8 
    db $ED 
    dw $2326,$C3D8 
    db $E9 
    dw $232C,$01E0 
    db $F9 
    dw $231F,$01FA 
    db $DF 
    dw $237D,$C3ED 
    db $EC 
    dw $230D,$C3F5 
    db $E4 
    dw $230B,$C3F2 
    db $1F 
    dw $2370,$C3FA 
    db $1F 
    dw $2371,$C3FA 
    db $0D 
    dw $234C,$C3FA 
    db $15 
    dw $235C,$C3F9 
    db $05 
    dw $2350,$C3F9 
    db $FD 
    dw $2340,$C3F4 
    db $F7 
    dw $2308,$C3FC 
    db $F7 
    dw $2309,$C3FC 
    db $E7 
    dw $2306,$C3EC 
    db $E7 
    dw $2304,$C3FC 
    db $D7 
    dw $2302,$C3EC 
    db $D7 
    dw $2300 

Spritemaps_Chozo_4:
    dw $0015,$01E0 
    db $F9 
    dw $231F,$C3E8 
    db $ED 
    dw $2326,$01FA 
    db $DF 
    dw $2379,$C3E9 
    db $1B 
    dw $2371,$C3E1 
    db $1B 
    dw $2370,$C3EE 
    db $10 
    dw $2358,$C3EE 
    db $08 
    dw $2348,$C3F4 
    db $FD 
    dw $2344,$C3F4 
    db $F7 
    dw $2308,$C3FC 
    db $F7 
    dw $2309,$C210 
    db $15 
    dw $2575,$C204 
    db $09 
    dw $254E,$C3FB 
    db $FD 
    dw $6542,$C3FB 
    db $05 
    dw $6552,$C3D8 
    db $E9 
    dw $232C,$C3ED 
    db $EC 
    dw $230D,$C3F5 
    db $E4 
    dw $230B,$C3FC 
    db $E7 
    dw $2306,$C3EC 
    db $E7 
    dw $2304,$C3FC 
    db $D7 
    dw $2302,$C3EC 
    db $D7 
    dw $2300 

Spritemaps_Chozo_5:
    dw $0016,$01E0 
    db $F8 
    dw $231F,$C3E8 
    db $EC 
    dw $2326,$01FA 
    db $DE 
    dw $237A,$C3EC 
    db $1C 
    dw $2371,$C3E4 
    db $1C 
    dw $2370,$C3F1 
    db $11 
    dw $2358,$C3F1 
    db $09 
    dw $2348,$C3F7 
    db $04 
    dw $2352,$C3F7 
    db $FC 
    dw $2342,$C3F4 
    db $F6 
    dw $2308,$C3FC 
    db $F6 
    dw $2309,$C209 
    db $16 
    dw $2575,$C3FC 
    db $09 
    dw $254E,$C3F9 
    db $04 
    dw $2550,$C3F9 
    db $FC 
    dw $2540,$C3D8 
    db $E8 
    dw $232C,$C3ED 
    db $EB 
    dw $230D,$C3F5 
    db $E3 
    dw $230B,$C3FC 
    db $E6 
    dw $2306,$C3EC 
    db $E6 
    dw $2304,$C3FC 
    db $D6 
    dw $2302,$C3EC 
    db $D6 
    dw $2300 

Spritemaps_Chozo_6:
    dw $0016,$C3E8 
    db $EB 
    dw $2326,$01E0 
    db $F7 
    dw $231F,$01FA 
    db $DD 
    dw $237B,$C3FA 
    db $1E 
    dw $2371,$C3F2 
    db $1E 
    dw $2370,$C3FA 
    db $13 
    dw $235C,$C3FA 
    db $0B 
    dw $234C,$C3FD 
    db $17 
    dw $2573,$C3F9 
    db $03 
    dw $2350,$C3F9 
    db $FB 
    dw $2340,$C3FA 
    db $08 
    dw $254E,$C3F4 
    db $F5 
    dw $2308,$C3FC 
    db $F5 
    dw $2309,$C3F7 
    db $03 
    dw $2552,$C3F7 
    db $FB 
    dw $2542,$C3D8 
    db $E7 
    dw $232C,$C3ED 
    db $EA 
    dw $230D,$C3F5 
    db $E2 
    dw $230B,$C3FC 
    db $E5 
    dw $2306,$C3EC 
    db $E5 
    dw $2304,$C3FC 
    db $D5 
    dw $2302,$C3EC 
    db $D5 
    dw $2300 

Spritemaps_Chozo_7:
    dw $0016,$01E0 
    db $F8 
    dw $231F,$C3E8 
    db $EC 
    dw $2326,$01FA 
    db $DE 
    dw $237C,$C201 
    db $1D 
    dw $2371,$C3F9 
    db $1D 
    dw $2370,$C201 
    db $12 
    dw $2356,$C201 
    db $0A 
    dw $2346,$C3FB 
    db $04 
    dw $6352,$C3FB 
    db $FC 
    dw $6342,$C3F2 
    db $1B 
    dw $2573,$C3F3 
    db $10 
    dw $2556,$C3F3 
    db $08 
    dw $2546,$C3F4 
    db $F6 
    dw $2308,$C3FC 
    db $F6 
    dw $2309,$C3F4 
    db $FC 
    dw $2544,$C3D8 
    db $E8 
    dw $232C,$C3ED 
    db $EB 
    dw $230D,$C3F5 
    db $E3 
    dw $230B,$C3FC 
    db $E6 
    dw $2306,$C3EC 
    db $E6 
    dw $2304,$C3FC 
    db $D6 
    dw $2302,$C3EC 
    db $D6 
    dw $2300 

Spritemaps_Chozo_8:
    dw $0015,$C3E8 
    db $ED 
    dw $2326,$01E0 
    db $F9 
    dw $231F,$01FA 
    db $DF 
    dw $2379,$C210 
    db $15 
    dw $2375,$C204 
    db $09 
    dw $234E,$C3FB 
    db $05 
    dw $6352,$C3FB 
    db $FD 
    dw $6342,$C3F4 
    db $F7 
    dw $2308,$C3FC 
    db $F7 
    dw $2309,$C3E1 
    db $1B 
    dw $2570,$C3E9 
    db $1B 
    dw $2571,$C3EE 
    db $10 
    dw $2558,$C3EE 
    db $08 
    dw $2548,$C3F4 
    db $FD 
    dw $2544,$C3D8 
    db $E9 
    dw $232C,$C3ED 
    db $EC 
    dw $230D,$C3F5 
    db $E4 
    dw $230B,$C3FC 
    db $E7 
    dw $2306,$C3EC 
    db $E7 
    dw $2304,$C3FC 
    db $D7 
    dw $2302,$C3EC 
    db $D7 
    dw $2300 

Spritemaps_Chozo_9:
    dw $0016,$01E0 
    db $F8 
    dw $231F,$C3E8 
    db $EC 
    dw $2326,$01FA 
    db $DE 
    dw $237A,$C209 
    db $16 
    dw $2375,$C3FC 
    db $09 
    dw $234E,$C3F9 
    db $04 
    dw $2350,$C3F9 
    db $FC 
    dw $2340,$C3D8 
    db $E8 
    dw $232C,$C3F5 
    db $E3 
    dw $230B,$C3ED 
    db $EB 
    dw $230D,$C3F4 
    db $F6 
    dw $2308,$C3FC 
    db $F6 
    dw $2309,$C3FC 
    db $E6 
    dw $2306,$C3EC 
    db $E6 
    dw $2304,$C3FC 
    db $D6 
    dw $2302,$C3EC 
    db $D6 
    dw $2300,$C3E4 
    db $1C 
    dw $2570,$C3EC 
    db $1C 
    dw $2571,$C3F1 
    db $11 
    dw $2558,$C3F1 
    db $09 
    dw $2548,$C3F7 
    db $04 
    dw $2552,$C3F7 
    db $FC 
    dw $2542 

Spritemaps_Chozo_A:
    dw $0016,$C3E8 
    db $EB 
    dw $2326,$01E0 
    db $F7 
    dw $231F,$01FA 
    db $DD 
    dw $237B,$C3FD 
    db $17 
    dw $2373,$C3FA 
    db $08 
    dw $234E,$C3F7 
    db $03 
    dw $2352,$C3F7 
    db $FB 
    dw $2342,$C3F2 
    db $1E 
    dw $2570,$C3FA 
    db $1E 
    dw $2571,$C3FA 
    db $13 
    dw $255C,$C3FA 
    db $0B 
    dw $254C,$C3F9 
    db $03 
    dw $2550,$C3F9 
    db $FB 
    dw $2540,$C3D8 
    db $E7 
    dw $232C,$C3ED 
    db $EA 
    dw $230D,$C3F5 
    db $E2 
    dw $230B,$C3F4 
    db $F5 
    dw $2308,$C3FC 
    db $F5 
    dw $2309,$C3FC 
    db $E5 
    dw $2306,$C3EC 
    db $E5 
    dw $2304,$C3FC 
    db $D5 
    dw $2302,$C3EC 
    db $D5 
    dw $2300 

Spritemaps_Chozo_B:
    dw $0016,$01E0 
    db $F8 
    dw $231F,$C3E8 
    db $EC 
    dw $2326,$01FA 
    db $DE 
    dw $237C,$C3F2 
    db $1B 
    dw $2373,$C3F3 
    db $10 
    dw $2356,$C3F3 
    db $08 
    dw $2346,$C3F4 
    db $FC 
    dw $2344,$C3F9 
    db $1D 
    dw $2570,$C201 
    db $1D 
    dw $2571,$C201 
    db $12 
    dw $2556,$C201 
    db $0A 
    dw $2546,$C3F4 
    db $F6 
    dw $2308,$C3FC 
    db $F6 
    dw $2309,$C3FB 
    db $FC 
    dw $6542,$C3FB 
    db $04 
    dw $6552,$C3D8 
    db $E8 
    dw $232C,$C3ED 
    db $EB 
    dw $230D,$C3F5 
    db $E3 
    dw $230B,$C3FC 
    db $E6 
    dw $2306,$C3EC 
    db $E6 
    dw $2304,$C3FC 
    db $D6 
    dw $2302,$C3EC 
    db $D6 
    dw $2300 

Spritemaps_Chozo_C:
    dw $0012,$C3E8 
    db $ED 
    dw $2326,$01E0 
    db $F9 
    dw $231F,$01FA 
    db $DF 
    dw $237D,$C3D8 
    db $E9 
    dw $232C,$C3ED 
    db $EC 
    dw $230D,$C3F5 
    db $E4 
    dw $230B,$C3F2 
    db $1F 
    dw $2370,$C3FA 
    db $1F 
    dw $2371,$C3FA 
    db $0D 
    dw $234C,$C3FA 
    db $15 
    dw $235C,$C3F9 
    db $05 
    dw $2350,$C3F9 
    db $FD 
    dw $2340,$C3F4 
    db $F7 
    dw $2308,$C3FC 
    db $F7 
    dw $2309,$C3FC 
    db $E7 
    dw $2306,$C3EC 
    db $E7 
    dw $2304,$C3FC 
    db $D7 
    dw $2302,$C3EC 
    db $D7 
    dw $2300 

Spritemaps_Chozo_D:
    dw $0012,$01E0 
    db $F9 
    dw $231F,$C3E8 
    db $ED 
    dw $2326,$01FA 
    db $DF 
    dw $237C,$C3D8 
    db $E9 
    dw $232C,$C3ED 
    db $EC 
    dw $230D,$C3F5 
    db $E4 
    dw $230B,$C3F2 
    db $1F 
    dw $2370,$C3FA 
    db $1F 
    dw $2371,$C3FA 
    db $0D 
    dw $234C,$C3FA 
    db $15 
    dw $235C,$C3F9 
    db $05 
    dw $2350,$C3F9 
    db $FD 
    dw $2340,$C3F4 
    db $F7 
    dw $2308,$C3FC 
    db $F7 
    dw $2309,$C3FC 
    db $E7 
    dw $2306,$C3EC 
    db $E7 
    dw $2304,$C3FC 
    db $D7 
    dw $2302,$C3EC 
    db $D7 
    dw $2300 

Spritemaps_Chozo_E:
    dw $0012,$C3D8 
    db $E9 
    dw $232C,$C3E8 
    db $ED 
    dw $2326,$01E0 
    db $F9 
    dw $231F,$01FA 
    db $DF 
    dw $237B,$C3ED 
    db $EC 
    dw $230D,$C3F5 
    db $E4 
    dw $230B,$C3F2 
    db $1F 
    dw $2370,$C3FA 
    db $1F 
    dw $2371,$C3FA 
    db $0D 
    dw $234C,$C3FA 
    db $15 
    dw $235C,$C3F9 
    db $05 
    dw $2350,$C3F9 
    db $FD 
    dw $2340,$C3F4 
    db $F7 
    dw $2308,$C3FC 
    db $F7 
    dw $2309,$C3FC 
    db $E7 
    dw $2306,$C3EC 
    db $E7 
    dw $2304,$C3FC 
    db $D7 
    dw $2302,$C3EC 
    db $D7 
    dw $2300 

Spritemaps_Chozo_F:
    dw $0012,$01E0 
    db $F9 
    dw $231F,$C3E8 
    db $ED 
    dw $2326,$01FA 
    db $DF 
    dw $237A,$C3D8 
    db $E9 
    dw $232C,$C3ED 
    db $EC 
    dw $230D,$C3F5 
    db $E4 
    dw $230B,$C3F2 
    db $1F 
    dw $2370,$C3FA 
    db $1F 
    dw $2371,$C3FA 
    db $0D 
    dw $234C,$C3FA 
    db $15 
    dw $235C,$C3F9 
    db $05 
    dw $2350,$C3F9 
    db $FD 
    dw $2340,$C3F4 
    db $F7 
    dw $2308,$C3FC 
    db $F7 
    dw $2309,$C3FC 
    db $E7 
    dw $2306,$C3EC 
    db $E7 
    dw $2304,$C3FC 
    db $D7 
    dw $2302,$C3EC 
    db $D7 
    dw $2300 

Spritemaps_Chozo_10:
    dw $0012,$C3D8 
    db $E9 
    dw $232C,$01E0 
    db $F9 
    dw $231F,$C3E8 
    db $ED 
    dw $2326,$01FA 
    db $DF 
    dw $2379,$C3ED 
    db $EC 
    dw $230D,$C3F5 
    db $E4 
    dw $230B,$C3F2 
    db $1F 
    dw $2370,$C3FA 
    db $1F 
    dw $2371,$C3FA 
    db $0D 
    dw $234C,$C3FA 
    db $15 
    dw $235C,$C3F9 
    db $05 
    dw $2350,$C3F9 
    db $FD 
    dw $2340,$C3F4 
    db $F7 
    dw $2308,$C3FC 
    db $F7 
    dw $2309,$C3FC 
    db $E7 
    dw $2306,$C3EC 
    db $E7 
    dw $2304,$C3FC 
    db $D7 
    dw $2302,$C3EC 
    db $D7 
    dw $2300 

Spritemaps_Chozo_11:
    dw $002A,$C3E0 
    db $98 
    dw $2344,$C242 
    db $98 
    dw $234A,$C232 
    db $A0 
    dw $2358,$C232 
    db $98 
    dw $2348,$C222 
    db $A0 
    dw $235C,$C222 
    db $98 
    dw $234C,$C202 
    db $98 
    dw $234E,$C212 
    db $A0 
    dw $2356,$C212 
    db $98 
    dw $2346,$C201 
    db $B8 
    dw $254E,$C211 
    db $C0 
    dw $2556,$C211 
    db $B8 
    dw $2546,$C241 
    db $B8 
    dw $254A,$C231 
    db $C0 
    dw $2558,$C231 
    db $B8 
    dw $2548,$C221 
    db $C0 
    dw $255C,$C221 
    db $B8 
    dw $254C,$C3D8 
    db $F0 
    dw $2577,$C3C8 
    db $F0 
    dw $2575,$C3B8 
    db $F0 
    dw $2573,$C3A0 
    db $F0 
    dw $2570,$C3A8 
    db $F0 
    dw $2571,$C3D8 
    db $E0 
    dw $2377,$C3C8 
    db $E0 
    dw $2375,$C3B8 
    db $E0 
    dw $2373,$C3A8 
    db $E0 
    dw $2371,$C3A0 
    db $E0 
    dw $2370,$C3D0 
    db $A0 
    dw $2352,$C3D0 
    db $98 
    dw $2342,$C3B0 
    db $A0 
    dw $6352,$C3B0 
    db $98 
    dw $6342,$C3C0 
    db $A0 
    dw $2350,$C3C0 
    db $98 
    dw $2340,$C3A0 
    db $98 
    dw $6344,$C3A1 
    db $B8 
    dw $6544,$C3B0 
    db $B8 
    dw $6542,$C3B0 
    db $C0 
    dw $6552,$C3D0 
    db $C0 
    dw $2552,$C3C0 
    db $C0 
    dw $2550,$C3E0 
    db $B8 
    dw $2544,$C3D0 
    db $B8 
    dw $2542,$C3C0 
    db $B8 
    dw $2540 

Spritemaps_Chozo_12:
    dw $0019,$C238 
    db $88 
    dw $230D,$C240 
    db $80 
    dw $230B,$003E 
    db $EF 
    dw $2339,$C236 
    db $DF 
    dw $232C,$C246 
    db $E7 
    dw $232A,$C220 
    db $DB 
    dw $232A,$C210 
    db $DB 
    dw $2328,$C245 
    db $C8 
    dw $2326,$0045 
    db $C0 
    dw $231F,$C235 
    db $C0 
    dw $2324,$C211 
    db $C0 
    dw $2320,$0021 
    db $C0 
    dw $230F,$C221 
    db $C8 
    dw $2322,$C3B7 
    db $BD 
    dw $234C,$C3B7 
    db $C5 
    dw $235C,$C399 
    db $D7 
    dw $2350,$C399 
    db $CF 
    dw $2340,$C3DA 
    db $CA 
    dw $2370,$C3E2 
    db $CA 
    dw $2371,$C3F1 
    db $A8 
    dw $2308,$C3F9 
    db $A8 
    dw $2309,$C3F9 
    db $98 
    dw $2306,$C3E9 
    db $98 
    dw $2304,$C3F9 
    db $88 
    dw $2302,$C3E9 
    db $88 
    dw $2300 

Spritemaps_Chozo_13:
    dw $0012,$01FE 
    db $DF 
    dw $637D,$C21A 
    db $E7 
    dw $6320,$0012 
    db $E7 
    dw $630F,$C20A 
    db $EF 
    dw $6322,$C203 
    db $EC 
    dw $630D,$C3FB 
    db $E4 
    dw $630B,$C3FE 
    db $1F 
    dw $6370,$C3F6 
    db $1F 
    dw $6371,$C3F6 
    db $0D 
    dw $634C,$C3F6 
    db $15 
    dw $635C,$C3F7 
    db $05 
    dw $6350,$C3F7 
    db $FD 
    dw $6340,$C3FC 
    db $F7 
    dw $6308,$C3F4 
    db $F7 
    dw $6309,$C3F4 
    db $E7 
    dw $6306,$C204 
    db $E7 
    dw $6304,$C3F4 
    db $D7 
    dw $6302,$C204 
    db $D7 
    dw $6300 

Spritemaps_Chozo_14:
    dw $0011,$01FE 
    db $DF 
    dw $637D,$C207 
    db $ED 
    dw $632A,$C217 
    db $ED 
    dw $6328,$C203 
    db $EC 
    dw $630D,$C3FB 
    db $E4 
    dw $630B,$C3FE 
    db $1F 
    dw $6370,$C3F6 
    db $1F 
    dw $6371,$C3F6 
    db $0D 
    dw $634C,$C3F6 
    db $15 
    dw $635C,$C3F7 
    db $05 
    dw $6350,$C3F7 
    db $FD 
    dw $6340,$C3FC 
    db $F7 
    dw $6308,$C3F4 
    db $F7 
    dw $6309,$C3F4 
    db $E7 
    dw $6306,$C204 
    db $E7 
    dw $6304,$C3F4 
    db $D7 
    dw $6302,$C204 
    db $D7 
    dw $6300 

Spritemaps_Chozo_15:
    dw $0011,$C208 
    db $ED 
    dw $6326,$C218 
    db $ED 
    dw $6324,$01FE 
    db $DF 
    dw $637D,$C203 
    db $EC 
    dw $630D,$C3FB 
    db $E4 
    dw $630B,$C3FE 
    db $1F 
    dw $6370,$C3F6 
    db $1F 
    dw $6371,$C3F6 
    db $0D 
    dw $634C,$C3F6 
    db $15 
    dw $635C,$C3F7 
    db $05 
    dw $6350,$C3F7 
    db $FD 
    dw $6340,$C3FC 
    db $F7 
    dw $6308,$C3F4 
    db $F7 
    dw $6309,$C3F4 
    db $E7 
    dw $6306,$C204 
    db $E7 
    dw $6304,$C3F4 
    db $D7 
    dw $6302,$C204 
    db $D7 
    dw $6300 

Spritemaps_Chozo_16:
    dw $0012,$C208 
    db $ED 
    dw $6326,$C218 
    db $E9 
    dw $632C,$0018 
    db $F9 
    dw $631F,$01FE 
    db $DF 
    dw $637D,$C203 
    db $EC 
    dw $630D,$C3FB 
    db $E4 
    dw $630B,$C3FE 
    db $1F 
    dw $6370,$C3F6 
    db $1F 
    dw $6371,$C3F6 
    db $0D 
    dw $634C,$C3F6 
    db $15 
    dw $635C,$C3F7 
    db $05 
    dw $6350,$C3F7 
    db $FD 
    dw $6340,$C3FC 
    db $F7 
    dw $6308,$C3F4 
    db $F7 
    dw $6309,$C3F4 
    db $E7 
    dw $6306,$C204 
    db $E7 
    dw $6304,$C3F4 
    db $D7 
    dw $6302,$C204 
    db $D7 
    dw $6300 

Spritemaps_Chozo_17:
    dw $0015,$01E0 
    db $F9 
    dw $231F,$C3E8 
    db $ED 
    dw $2326,$01FA 
    db $DF 
    dw $2379,$C3E9 
    db $1B 
    dw $2371,$C3E1 
    db $1B 
    dw $2370,$C3EE 
    db $10 
    dw $2358,$C3EE 
    db $08 
    dw $2348,$C3F4 
    db $FD 
    dw $2344,$C3F4 
    db $F7 
    dw $2308,$C3FC 
    db $F7 
    dw $2309,$C210 
    db $15 
    dw $2575,$C204 
    db $09 
    dw $254E,$C3FB 
    db $FD 
    dw $6542,$C3FB 
    db $05 
    dw $6552,$C3D8 
    db $E9 
    dw $232C,$C3ED 
    db $EC 
    dw $230D,$C3F5 
    db $E4 
    dw $230B,$C3FC 
    db $E7 
    dw $2306,$C3EC 
    db $E7 
    dw $2304,$C3FC 
    db $D7 
    dw $2302,$C3EC 
    db $D7 
    dw $2300 

Spritemaps_Chozo_18:
    dw $0016,$01E0 
    db $F8 
    dw $231F,$C3E8 
    db $EC 
    dw $2326,$01FA 
    db $DE 
    dw $237A,$C3EC 
    db $1C 
    dw $2371,$C3E4 
    db $1C 
    dw $2370,$C3F1 
    db $11 
    dw $2358,$C3F1 
    db $09 
    dw $2348,$C3F7 
    db $04 
    dw $2352,$C3F7 
    db $FC 
    dw $2342,$C3F4 
    db $F6 
    dw $2308,$C3FC 
    db $F6 
    dw $2309,$C209 
    db $16 
    dw $2575,$C3FC 
    db $09 
    dw $254E,$C3F9 
    db $04 
    dw $2550,$C3F9 
    db $FC 
    dw $2540,$C3D8 
    db $E8 
    dw $232C,$C3ED 
    db $EB 
    dw $230D,$C3F5 
    db $E3 
    dw $230B,$C3FC 
    db $E6 
    dw $2306,$C3EC 
    db $E6 
    dw $2304,$C3FC 
    db $D6 
    dw $2302,$C3EC 
    db $D6 
    dw $2300 

Spritemaps_Chozo_19:
    dw $0016,$C3E8 
    db $EB 
    dw $2326,$01E0 
    db $F7 
    dw $231F,$01FA 
    db $DD 
    dw $237B,$C3FA 
    db $1E 
    dw $2371,$C3F2 
    db $1E 
    dw $2370,$C3FA 
    db $13 
    dw $235C,$C3FA 
    db $0B 
    dw $234C,$C3FD 
    db $17 
    dw $2573,$C3F9 
    db $03 
    dw $2350,$C3F9 
    db $FB 
    dw $2340,$C3FA 
    db $08 
    dw $254E,$C3F4 
    db $F5 
    dw $2308,$C3FC 
    db $F5 
    dw $2309,$C3F7 
    db $03 
    dw $2552,$C3F7 
    db $FB 
    dw $2542,$C3D8 
    db $E7 
    dw $232C,$C3ED 
    db $EA 
    dw $230D,$C3F5 
    db $E2 
    dw $230B,$C3FC 
    db $E5 
    dw $2306,$C3EC 
    db $E5 
    dw $2304,$C3FC 
    db $D5 
    dw $2302,$C3EC 
    db $D5 
    dw $2300 

Spritemaps_Chozo_1A:
    dw $0016,$01E0 
    db $F8 
    dw $231F,$C3E8 
    db $EC 
    dw $2326,$01FA 
    db $DE 
    dw $237C,$C201 
    db $1D 
    dw $2371,$C3F9 
    db $1D 
    dw $2370,$C201 
    db $12 
    dw $2356,$C201 
    db $0A 
    dw $2346,$C3FB 
    db $04 
    dw $6352,$C3FB 
    db $FC 
    dw $6342,$C3F2 
    db $1B 
    dw $2573,$C3F3 
    db $10 
    dw $2556,$C3F3 
    db $08 
    dw $2546,$C3F4 
    db $F6 
    dw $2308,$C3FC 
    db $F6 
    dw $2309,$C3F4 
    db $FC 
    dw $2544,$C3D8 
    db $E8 
    dw $232C,$C3ED 
    db $EB 
    dw $230D,$C3F5 
    db $E3 
    dw $230B,$C3FC 
    db $E6 
    dw $2306,$C3EC 
    db $E6 
    dw $2304,$C3FC 
    db $D6 
    dw $2302,$C3EC 
    db $D6 
    dw $2300 

Spritemaps_Chozo_1B:
    dw $0015,$C3E8 
    db $ED 
    dw $2326,$01E0 
    db $F9 
    dw $231F,$01FA 
    db $DF 
    dw $2379,$C210 
    db $15 
    dw $2375,$C204 
    db $09 
    dw $234E,$C3FB 
    db $05 
    dw $6352,$C3FB 
    db $FD 
    dw $6342,$C3F4 
    db $F7 
    dw $2308,$C3FC 
    db $F7 
    dw $2309,$C3E1 
    db $1B 
    dw $2570,$C3E9 
    db $1B 
    dw $2571,$C3EE 
    db $10 
    dw $2558,$C3EE 
    db $08 
    dw $2548,$C3F4 
    db $FD 
    dw $2544,$C3D8 
    db $E9 
    dw $232C,$C3ED 
    db $EC 
    dw $230D,$C3F5 
    db $E4 
    dw $230B,$C3FC 
    db $E7 
    dw $2306,$C3EC 
    db $E7 
    dw $2304,$C3FC 
    db $D7 
    dw $2302,$C3EC 
    db $D7 
    dw $2300 

Spritemaps_Chozo_1C:
    dw $0016,$01E0 
    db $F8 
    dw $231F,$C3E8 
    db $EC 
    dw $2326,$01FA 
    db $DE 
    dw $237A,$C209 
    db $16 
    dw $2375,$C3FC 
    db $09 
    dw $234E,$C3F9 
    db $04 
    dw $2350,$C3F9 
    db $FC 
    dw $2340,$C3D8 
    db $E8 
    dw $232C,$C3F5 
    db $E3 
    dw $230B,$C3ED 
    db $EB 
    dw $230D,$C3F4 
    db $F6 
    dw $2308,$C3FC 
    db $F6 
    dw $2309,$C3FC 
    db $E6 
    dw $2306,$C3EC 
    db $E6 
    dw $2304,$C3FC 
    db $D6 
    dw $2302,$C3EC 
    db $D6 
    dw $2300,$C3E4 
    db $1C 
    dw $2570,$C3EC 
    db $1C 
    dw $2571,$C3F1 
    db $11 
    dw $2558,$C3F1 
    db $09 
    dw $2548,$C3F7 
    db $04 
    dw $2552,$C3F7 
    db $FC 
    dw $2542 

Spritemaps_Chozo_1D:
    dw $0016,$C3E8 
    db $EB 
    dw $2326,$01E0 
    db $F7 
    dw $231F,$01FA 
    db $DD 
    dw $237B,$C3FD 
    db $17 
    dw $2373,$C3FA 
    db $08 
    dw $234E,$C3F7 
    db $03 
    dw $2352,$C3F7 
    db $FB 
    dw $2342,$C3F2 
    db $1E 
    dw $2570,$C3FA 
    db $1E 
    dw $2571,$C3FA 
    db $13 
    dw $255C,$C3FA 
    db $0B 
    dw $254C,$C3F9 
    db $03 
    dw $2550,$C3F9 
    db $FB 
    dw $2540,$C3D8 
    db $E7 
    dw $232C,$C3ED 
    db $EA 
    dw $230D,$C3F5 
    db $E2 
    dw $230B,$C3F4 
    db $F5 
    dw $2308,$C3FC 
    db $F5 
    dw $2309,$C3FC 
    db $E5 
    dw $2306,$C3EC 
    db $E5 
    dw $2304,$C3FC 
    db $D5 
    dw $2302,$C3EC 
    db $D5 
    dw $2300 

Spritemaps_Chozo_1E:
    dw $0016,$01E0 
    db $F8 
    dw $231F,$C3E8 
    db $EC 
    dw $2326,$01FA 
    db $DE 
    dw $237C,$C3F2 
    db $1B 
    dw $2373,$C3F3 
    db $10 
    dw $2356,$C3F3 
    db $08 
    dw $2346,$C3F4 
    db $FC 
    dw $2344,$C3F9 
    db $1D 
    dw $2570,$C201 
    db $1D 
    dw $2571,$C201 
    db $12 
    dw $2556,$C201 
    db $0A 
    dw $2546,$C3F4 
    db $F6 
    dw $2308,$C3FC 
    db $F6 
    dw $2309,$C3FB 
    db $FC 
    dw $6542,$C3FB 
    db $04 
    dw $6552,$C3D8 
    db $E8 
    dw $232C,$C3ED 
    db $EB 
    dw $230D,$C3F5 
    db $E3 
    dw $230B,$C3FC 
    db $E6 
    dw $2306,$C3EC 
    db $E6 
    dw $2304,$C3FC 
    db $D6 
    dw $2302,$C3EC 
    db $D6 
    dw $2300 

Spritemaps_Chozo_1F:
    dw $0012,$C208 
    db $ED 
    dw $6326,$0018 
    db $F9 
    dw $631F,$01FE 
    db $DF 
    dw $637D,$C218 
    db $E9 
    dw $632C,$C203 
    db $EC 
    dw $630D,$C3FB 
    db $E4 
    dw $630B,$C3FE 
    db $1F 
    dw $6370,$C3F6 
    db $1F 
    dw $6371,$C3F6 
    db $0D 
    dw $634C,$C3F6 
    db $15 
    dw $635C,$C3F7 
    db $05 
    dw $6350,$C3F7 
    db $FD 
    dw $6340,$C3FC 
    db $F7 
    dw $6308,$C3F4 
    db $F7 
    dw $6309,$C3F4 
    db $E7 
    dw $6306,$C204 
    db $E7 
    dw $6304,$C3F4 
    db $D7 
    dw $6302,$C204 
    db $D7 
    dw $6300 

Spritemaps_Chozo_20:
    dw $0012,$0018 
    db $F9 
    dw $631F,$C208 
    db $ED 
    dw $6326,$01FE 
    db $DF 
    dw $637C,$C218 
    db $E9 
    dw $632C,$C203 
    db $EC 
    dw $630D,$C3FB 
    db $E4 
    dw $630B,$C3FE 
    db $1F 
    dw $6370,$C3F6 
    db $1F 
    dw $6371,$C3F6 
    db $0D 
    dw $634C,$C3F6 
    db $15 
    dw $635C,$C3F7 
    db $05 
    dw $6350,$C3F7 
    db $FD 
    dw $6340,$C3FC 
    db $F7 
    dw $6308,$C3F4 
    db $F7 
    dw $6309,$C3F4 
    db $E7 
    dw $6306,$C204 
    db $E7 
    dw $6304,$C3F4 
    db $D7 
    dw $6302,$C204 
    db $D7 
    dw $6300 

Spritemaps_Chozo_21:
    dw $0012,$C218 
    db $E9 
    dw $632C,$C208 
    db $ED 
    dw $6326,$0018 
    db $F9 
    dw $631F,$01FE 
    db $DF 
    dw $637B,$C203 
    db $EC 
    dw $630D,$C3FB 
    db $E4 
    dw $630B,$C3FE 
    db $1F 
    dw $6370,$C3F6 
    db $1F 
    dw $6371,$C3F6 
    db $0D 
    dw $634C,$C3F6 
    db $15 
    dw $635C,$C3F7 
    db $05 
    dw $6350,$C3F7 
    db $FD 
    dw $6340,$C3FC 
    db $F7 
    dw $6308,$C3F4 
    db $F7 
    dw $6309,$C3F4 
    db $E7 
    dw $6306,$C204 
    db $E7 
    dw $6304,$C3F4 
    db $D7 
    dw $6302,$C204 
    db $D7 
    dw $6300 

Spritemaps_Chozo_22:
    dw $0012,$0018 
    db $F9 
    dw $631F,$C208 
    db $ED 
    dw $6326,$01FE 
    db $DF 
    dw $637A,$C218 
    db $E9 
    dw $632C,$C203 
    db $EC 
    dw $630D,$C3FB 
    db $E4 
    dw $630B,$C3FE 
    db $1F 
    dw $6370,$C3F6 
    db $1F 
    dw $6371,$C3F6 
    db $0D 
    dw $634C,$C3F6 
    db $15 
    dw $635C,$C3F7 
    db $05 
    dw $6350,$C3F7 
    db $FD 
    dw $6340,$C3FC 
    db $F7 
    dw $6308,$C3F4 
    db $F7 
    dw $6309,$C3F4 
    db $E7 
    dw $6306,$C204 
    db $E7 
    dw $6304,$C3F4 
    db $D7 
    dw $6302,$C204 
    db $D7 
    dw $6300 

Spritemaps_Chozo_23:
    dw $0012,$C218 
    db $E9 
    dw $632C,$0018 
    db $F9 
    dw $631F,$C208 
    db $ED 
    dw $6326,$01FE 
    db $DF 
    dw $6379,$C203 
    db $EC 
    dw $630D,$C3FB 
    db $E4 
    dw $630B,$C3FE 
    db $1F 
    dw $6370,$C3F6 
    db $1F 
    dw $6371,$C3F6 
    db $0D 
    dw $634C,$C3F6 
    db $15 
    dw $635C,$C3F7 
    db $05 
    dw $6350,$C3F7 
    db $FD 
    dw $6340,$C3FC 
    db $F7 
    dw $6308,$C3F4 
    db $F7 
    dw $6309,$C3F4 
    db $E7 
    dw $6306,$C204 
    db $E7 
    dw $6304,$C3F4 
    db $D7 
    dw $6302,$C204 
    db $D7 
    dw $6300 

Spritemaps_Chozo_24:
    dw $002A,$C3E0 
    db $98 
    dw $2344,$C242 
    db $98 
    dw $234A,$C232 
    db $A0 
    dw $2358,$C232 
    db $98 
    dw $2348,$C222 
    db $A0 
    dw $235C,$C222 
    db $98 
    dw $234C,$C202 
    db $98 
    dw $234E,$C212 
    db $A0 
    dw $2356,$C212 
    db $98 
    dw $2346,$C201 
    db $B8 
    dw $254E,$C211 
    db $C0 
    dw $2556,$C211 
    db $B8 
    dw $2546,$C241 
    db $B8 
    dw $254A,$C231 
    db $C0 
    dw $2558,$C231 
    db $B8 
    dw $2548,$C221 
    db $C0 
    dw $255C,$C221 
    db $B8 
    dw $254C,$C3D8 
    db $F0 
    dw $2577,$C3C8 
    db $F0 
    dw $2575,$C3B8 
    db $F0 
    dw $2573,$C3A0 
    db $F0 
    dw $2570,$C3A8 
    db $F0 
    dw $2571,$C3D8 
    db $E0 
    dw $2377,$C3C8 
    db $E0 
    dw $2375,$C3B8 
    db $E0 
    dw $2373,$C3A8 
    db $E0 
    dw $2371,$C3A0 
    db $E0 
    dw $2370,$C3D0 
    db $A0 
    dw $2352,$C3D0 
    db $98 
    dw $2342,$C3B0 
    db $A0 
    dw $6352,$C3B0 
    db $98 
    dw $6342,$C3C0 
    db $A0 
    dw $2350,$C3C0 
    db $98 
    dw $2340,$C3A0 
    db $98 
    dw $6344,$C3A1 
    db $B8 
    dw $6544,$C3B0 
    db $B8 
    dw $6542,$C3B0 
    db $C0 
    dw $6552,$C3D0 
    db $C0 
    dw $2552,$C3C0 
    db $C0 
    dw $2550,$C3E0 
    db $B8 
    dw $2544,$C3D0 
    db $B8 
    dw $2542,$C3C0 
    db $B8 
    dw $2540 

Spritemaps_Chozo_25:
    dw $0019,$C238 
    db $88 
    dw $230D,$C240 
    db $80 
    dw $230B,$003E 
    db $EF 
    dw $2339,$C236 
    db $DF 
    dw $232C,$C246 
    db $E7 
    dw $232A,$C220 
    db $DB 
    dw $232A,$C210 
    db $DB 
    dw $2328,$C245 
    db $C8 
    dw $2326,$0045 
    db $C0 
    dw $231F,$C235 
    db $C0 
    dw $2324,$C211 
    db $C0 
    dw $2320,$0021 
    db $C0 
    dw $230F,$C221 
    db $C8 
    dw $2322,$C3B7 
    db $BD 
    dw $234C,$C3B7 
    db $C5 
    dw $235C,$C399 
    db $D7 
    dw $2350,$C399 
    db $CF 
    dw $2340,$C3DA 
    db $CA 
    dw $2370,$C3E2 
    db $CA 
    dw $2371,$C3F1 
    db $A8 
    dw $2308,$C3F9 
    db $A8 
    dw $2309,$C3F9 
    db $98 
    dw $2306,$C3E9 
    db $98 
    dw $2304,$C3F9 
    db $88 
    dw $2302,$C3E9 
    db $88 
    dw $2300 

Freespace_BankAA_F7D3: 
; $82D bytes
