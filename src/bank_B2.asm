
org $B28000


CommonB2_GrappleAI_NoInteraction:
    JSL.L GrappleAI_SwitchEnemyAIToMainAI 
    RTL 


CommonB2_GrappleAI_SamusLatchesOn:
    JSL.L GrappleAI_SamusLatchesOnWithGrapple 
    RTL 


CommonB2_GrappleAI_KillEnemy:
    JSL.L GrappleAI_EnemyGrappleDeath 
    RTL 


CommonB2_GrappleAI_CancelGrappleBeam:
    JSL.L GrappleAI_SwitchToFrozenAI 
    RTL 


CommonB2_GrappleAI_SamusLatchesOn_NoInvincibility:
    JSL.L GrappleAI_SamusLatchesOnWithGrapple_NoInvincibility 
    RTL 


UNUSED_CommonB2_GrappleAI_SamusLatchesOn_ParalyzeEnemy_B28019:
    JSL.L GrappleAI_SamusLatchesOnWithGrapple_ParalyzeEnemy 
    RTL 


CommonB2_GrappleAI_HurtSamus:
    JSL.L GrappleAI_SwitchToFrozenAI_duplicate 
    RTL 


CommonB2_NormalEnemyTouchAI:
    JSL.L NormalEnemyTouchAI 
    RTL 


CommonB2_NormalTouchAI_NoDeathCheck:
    JSL.L NormalEnemyTouchAI_NoDeathCheck_External 
    RTL 


CommonB2_NormalEnemyShotAI:
    JSL.L NormalEnemyShotAI 
    RTL 


CommonB2_NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic:
    JSL.L NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External 
    RTL 


CommonB2_NormalEnemyPowerBombAI:
    JSL.L NormalEnemyPowerBombAI 
    RTL 


CommonB2_NormalEnemyPowerBombAI_NoDeathCheck:
    JSL.L NormalEnemyPowerBombAI_NoDeathCheck_External 
    RTL 


CommonB2_NormalEnemyFrozenAI:
    JSL.L NormalEnemyFrozenAI 
    RTL 


CommonB2_CreateADudShot_JSL:
    JSL.L CreateADudShot 
    RTL 


RTS_B2804B:
    RTS 


RTL_B2804C:
    RTL 


Spritemap_CommonB2_Nothing:
    dw $0000 

ExtendedSpritemap_CommonB2_Nothing:
    dw $0001,$0000,$0000 
    dw Spritemap_CommonB2_Nothing 
    dw Hitbox_CommonB2_Nothing 

Hitbox_CommonB2_Nothing:
    dw $0001,$0000,$0000,$0000,$0000 
    dw CommonB2_NormalEnemyTouchAI 
    dw CommonB2_NormalEnemyShotAI 

InstList_CommonB2_DeleteEnemy:
    dw Instruction_CommonB2_DeleteEnemy 

NOPNOP_B28069:
    NOP #2
    Instruction_CommonB2_Enemy0FB2_InY:
    LDA.W $0000,Y : STA.W $0FB2,X 
    INY #2
    RTL 


Instruction_CommonB2_SetEnemy0FB2ToRTS:
    LDA.W #RTS_B2807B : STA.W $0FB2,X 
    RTL 


RTS_B2807B:
    RTS 


Instruction_CommonB2_DeleteEnemy:
    LDA.W $0F86,X 
    ORA.W #$0200 
    STA.W $0F86,X 
    PLA 
    PEA.W ProcessEnemyInstructions_return-1 
    RTL 


Instruction_CommonB2_CallFunctionInY:
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


Instruction_CommonB2_CallFunctionInY_WithA:
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
UNUSED_Instruction_CommonB2_CallExternalFunctionInY_B280B5:
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


UNUSED_Inst_CommonB2_CallExternalFunctionInY_WithA_B280CE:
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


Instruction_CommonB2_GotoY:
    LDA.W $0000,Y 
    TAY 
    RTL 


Instruction_CommonB2_GotoY_PlusY:
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


Instruction_CommonB2_DecrementTimer_GotoYIfNonZero:
    DEC.W $0F90,X 
    BNE Instruction_CommonB2_GotoY 
    INY #2
    RTL 


Instruction_CommonB2_DecrementTimer_GotoYIfNonZero_duplicate:
    DEC.W $0F90,X 
    BNE Instruction_CommonB2_GotoY 
    INY #2
    RTL 


Instruction_CommonB2_DecrementTimer_GotoY_PlusY_IfNonZero:
    SEP #$20 
    DEC.W $0F90,X 
    REP #$20 
    BNE Instruction_CommonB2_GotoY_PlusY 
    INY 
    RTL 


Instruction_CommonB2_TimerInY:
    LDA.W $0000,Y : STA.W $0F90,X 
    INY #2
    RTL 


Instruction_CommonB2_SkipNextInstruction:
    INY #2
    RTL 


Instruction_CommonB2_Sleep:
    DEY #2
    TYA 
    STA.W $0F92,X 
    PLA 
    PEA.W ProcessEnemyInstructions_return-1 
    RTL 


Instruction_CommonB2_WaitYFrames:
    LDA.W $0000,Y : STA.W $0F94,X 
    INY #2
    TYA 
    STA.W $0F92,X 
    PLA 
    PEA.W ProcessEnemyInstructions_return-1 
    RTL 


Instruction_CommonB2_TransferYBytesInYToVRAM:
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


Instruction_CommonB2_EnableOffScreenProcessing:
    LDA.W $0F86,X 
    ORA.W #$0800 
    STA.W $0F86,X 
    RTL 


Instruction_CommonB2_DisableOffScreenProcessing:
    LDA.W $0F86,X 
    AND.W #$F7FF 
    STA.W $0F86,X 
    RTL 


CommonB2EnemySpeeds_LinearlyIncreasing:
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

CommonB2EnemySpeeds_QuadraticallyIncreasing:
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

Palette_Pirate_Grey:
    dw $3800,$5755,$4A4F,$1CE4,$0C60,$56B2,$3E0D,$2D68 
    dw $2526,$5EBB,$3DB3,$292E,$1486,$033B,$0216,$0113 

Palette_Pirate_Green:
    dw $3800,$3F57,$2E4D,$00E2,$0060,$3AB0,$220B,$1166 
    dw $0924,$5EBB,$3DB3,$292E,$1486,$033B,$0216,$0113 

Palette_Pirate_Magenta:
    dw $3800,$4EBF,$4D9E,$1009,$0C04,$49DE,$555D,$30B0 
    dw $1C4D,$5EBB,$3DB3,$292E,$1486,$033B,$0216,$0113 

Palette_Pirate_Red:
    dw $3800,$02FD,$013E,$006C,$0066,$021E,$005F,$0059 
    dw $0073,$5EBB,$3DB3,$292E,$1486,$033B,$0216,$0113 

Palette_Pirate_Silver_GoldNinja:
    dw $3800,$6BFF,$4ED6,$14A4,$0420,$5B7B,$3E52,$31CD 
    dw $2149,$5EBB,$3DB3,$292E,$1486,$033B,$0216,$0113 

Palette_Pirate_Gold_NonNinja:
    dw $3800,$4BBE,$06B9,$00EA,$0065,$173A,$0276,$01F2 
    dw $014D,$5EBB,$3DB3,$292E,$1486,$033B,$0216,$0113 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Palette_Pirate_Silver_GoldNinja_B28747:
    dw $3800,$6BFF,$4ED6,$14A4,$0420,$5B7B,$3E52,$31CD 
    dw $2149,$5EBB,$3DB3,$292E,$1486,$033B,$0216,$0113 
endif ; !FEATURE_KEEP_UNREFERENCED

PowerBombReaction_Ninja_Walking_GreyWall:
    JSL.L NormalEnemyPowerBombAI 
    RTL 


EnemyTouch_SpacePirate:
    LDX.W $0E54 
    LDA.W $0F9E,X 
    BNE .return 
    JSL.L NormalEnemyTouchAI 

.return:
    RTL 


EnemyShot_SpacePirate_Normal:
    LDX.W $0E54 
    LDA.W $0F78,X 
    CMP.W #EnemyHeaders_PirateGoldNinja 
    BEQ NormalPirateShot 
    JSL.L NormalEnemyShotAI 
    RTL 


NormalPirateShot:
    LDX.W $0E54 
    LDA.W $0F7A,X : STA.L $7EF434 
    LDA.W $0F7E,X : STA.L $7EF436 
    JSL.L NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External 
    LDA.W $0F8C,X 
    BNE .return 
    LDX.W $0E54 
    LDA.W $0F78,X 
    CMP.W #EnemyHeaders_PirateGoldNinja 
    BNE .notGold 
    STZ.W $0FAA,X 
    LDA.W #$0004 
    JSL.L EnemyDeath 
    JSL.L MetalNinjaPirateDeathItemDropRoutine 

.return:
    RTL 


.notGold:
    STZ.W $0FAA,X 
    LDA.W #$0004 
    JSL.L EnemyDeath 
    RTL 


EnemyShot_SpacePirate_GoldNinjaIsVulnerable:
    LDX.W $0E54 
    LDA.W $0F78,X 
    CMP.W #EnemyHeaders_PirateGoldNinja 
    BEQ .goldNinja 
    JMP.W NormalPirateShot 


.goldNinja:
    LDA.W $18A6 
    ASL A 
    TAY 
    LDA.W $0C18,Y : STA.B $12 
    AND.W #$0F00 
    CMP.W #$0300 
    BMI .beamMissileSuper 
    RTL 


.beamMissileSuper:
    LDX.W $0E54 
    LDA.W $0F78,X 
    TAX 
    LDA.L $A0003C,X 
    BNE .zeroVuln 
    LDA.W #EnemyVulnerabilities 

.zeroVuln:
    STA.B $14 
    LDA.B $12 
    BIT.W #$0F00 
    BNE .notBeam 
    LDA.B $12 
    AND.W #$000F 
    CLC : ADC.B $14 : TAX 
    LDA.L $B40000,X 
    AND.W #$000F 
    BEQ EnemyShot_SpacePirate_GoldNinjaIsInvincible 
    CMP.W #$000F 
    BEQ EnemyShot_SpacePirate_GoldNinjaIsInvincible 

.gotoNormal:
    JMP.W NormalPirateShot 


.notBeam:
    AND.W #$0F00 
    CMP.W #$0100 
    BEQ .missile 
    CMP.W #$0200 
    BNE .gotoNormal 

.missile:
    XBA 
    CLC : ADC.B $14 : TAX 
    LDA.L $B4000B,X 
    AND.W #$000F 
    BEQ EnemyShot_SpacePirate_GoldNinjaIsInvincible 
    CMP.W #$000F 
    BEQ EnemyShot_SpacePirate_GoldNinjaIsInvincible 
    BRA .gotoNormal 


EnemyShot_SpacePirate_GoldNinjaIsInvincible:
    LDX.W $0E54 
    LDA.W $0F78,X 
    CMP.W #EnemyHeaders_PirateGoldNinja 
    BEQ .gold 
    JMP.W NormalPirateShot 


.gold:
    LDX.W $0E54 
    LDA.W $18A6 
    ASL A 
    TAY 
    LDA.W $0C18,Y : STA.B $12 
    AND.W #$0F00 
    CMP.W #$0200 
    BEQ .super 
    CMP.W #$0300 
    BMI .reflect 
    RTL 


.super:
    LDA.W $0C7C,Y 
    BEQ .return 

.reflect:
    LDA.W #$000A : STA.W $0FA0,X 
    LDA.W $0C04,Y 
    AND.W #$000F 
    CMP.W #$0007 
    BNE .notLeft 
    LDA.W #$0001 
    BRA .merge 


.notLeft:
    CMP.W #$0002 
    BNE .downFacingLeft 
    LDA.W #$0008 
    BRA .merge 


.downFacingLeft:
    LDA.W #$0005 

.merge:
    STA.W $0C04,Y 
    STY.B $14 
    JSL.L ProjectileReflection 
    LDA.W #$0066 
    JSL.L QueueSound_Lib2_Max6 

.return:
    RTL 


ExtendedSpritemaps_PirateWall_0:
    dw $0002,$0000,$0000 
    dw Spitemaps_PirateWall_9 
    dw Hitboxes_PirateWall_9 
    dw $0000,$0000 
    dw Spitemaps_PirateWall_0 
    dw Hitboxes_PirateWall_0 

ExtendedSpritemaps_PirateWall_1:
    dw $0002,$0000,$0000 
    dw Spitemaps_PirateWall_8 
    dw Hitboxes_PirateWall_8 
    dw $0000,$0000 
    dw Spitemaps_PirateWall_1 
    dw Hitboxes_PirateWall_1 

ExtendedSpritemaps_PirateWall_2:
    dw $0002,$0000,$0000 
    dw Spitemaps_PirateWall_7 
    dw Hitboxes_PirateWall_7 
    dw $0000,$0000 
    dw Spitemaps_PirateWall_2 
    dw Hitboxes_PirateWall_2 

ExtendedSpritemaps_PirateWall_3:
    dw $0002,$0000,$0000 
    dw Spitemaps_PirateWall_3 
    dw Hitboxes_PirateWall_3 
    dw $0000,$0000 
    dw Spitemaps_PirateWall_6 
    dw Hitboxes_PirateWall_6 

ExtendedSpritemaps_PirateWall_4:
    dw $0002,$0000,$0000 
    dw Spitemaps_PirateWall_4 
    dw Hitboxes_PirateWall_4 
    dw $0000,$0000 
    dw Spitemaps_PirateWall_5 
    dw Hitboxes_PirateWall_5 

ExtendedSpritemaps_PirateWall_5:
    dw $0002,$0000,$FFFE 
    dw Spitemaps_PirateWall_A 
    dw Hitboxes_PirateWall_A 
    dw $0000,$0000 
    dw Spitemaps_PirateWall_9 
    dw Hitboxes_PirateWall_9 

ExtendedSpritemaps_PirateWall_6:
    dw $0002,$0001,$FFFE 
    dw Spitemaps_PirateWall_B 
    dw Hitboxes_PirateWall_B 
    dw $0000,$0000 
    dw Spitemaps_PirateWall_5 
    dw Hitboxes_PirateWall_5 

ExtendedSpritemaps_PirateWall_7:
    dw $0001,$0000,$0000 
    dw Spitemaps_PirateWall_C 
    dw Hitboxes_PirateWall_C 

ExtendedSpritemaps_PirateWall_8:
    dw $0001,$0000,$0000 
    dw Spitemaps_PirateWall_D 
    dw Hitboxes_PirateWall_D 

ExtendedSpritemaps_PirateWall_9:
    dw $0002,$0000,$0000 
    dw Spitemaps_PirateWall_17 
    dw Hitboxes_PirateWall_17 
    dw $0000,$0000 
    dw Spitemaps_PirateWall_E 
    dw Hitboxes_PirateWall_E 

ExtendedSpritemaps_PirateWall_A:
    dw $0002,$0000,$0000 
    dw Spitemaps_PirateWall_16 
    dw Hitboxes_PirateWall_16 
    dw $0000,$0000 
    dw Spitemaps_PirateWall_F 
    dw Hitboxes_PirateWall_F 

ExtendedSpritemaps_PirateWall_B:
    dw $0002,$0000,$0000 
    dw Spitemaps_PirateWall_15 
    dw Hitboxes_PirateWall_15 
    dw $0000,$0000 
    dw Spitemaps_PirateWall_10 
    dw Hitboxes_PirateWall_10 

ExtendedSpritemaps_PirateWall_C:
    dw $0002,$0000,$0000 
    dw Spitemaps_PirateWall_11 
    dw Hitboxes_PirateWall_11 
    dw $0000,$0000 
    dw Spitemaps_PirateWall_14 
    dw Hitboxes_PirateWall_14 

ExtendedSpritemaps_PirateWall_D:
    dw $0002,$0000,$0000 
    dw Spitemaps_PirateWall_12 
    dw Hitboxes_PirateWall_12 
    dw $0000,$0000 
    dw Spitemaps_PirateWall_13 
    dw Hitboxes_PirateWall_13 

ExtendedSpritemaps_PirateWall_E:
    dw $0002,$0000,$0000 
    dw Spitemaps_PirateWall_18 
    dw Hitboxes_PirateWall_18 
    dw $0000,$0002 
    dw Spitemaps_PirateWall_13 
    dw Hitboxes_PirateWall_13 

ExtendedSpritemaps_PirateWall_F:
    dw $0002,$0000,$0000 
    dw Spitemaps_PirateWall_19 
    dw Hitboxes_PirateWall_19 
    dw $0000,$0002 
    dw Spitemaps_PirateWall_13 
    dw Hitboxes_PirateWall_13 

ExtendedSpritemaps_PirateWall_10:
    dw $0001,$0000,$0000 
    dw Spitemaps_PirateWall_1A 
    dw Hitboxes_PirateWall_1A 

ExtendedSpritemaps_PirateWall_11:
    dw $0001,$0000,$0000 
    dw Spitemaps_PirateWall_1B 
    dw Hitboxes_PirateWall_1B 

ExtendedSpritemaps_PirateWalking_0:
    dw $0002,$FFFB,$0003 
    dw Spitemaps_PirateWalking_26_Ninja_D 
    dw Hitboxes_PirateWalking_33_Ninja_1C 
    dw $0000,$0000 
    dw Spritemaps_PirateWalking_1 
    dw Hitboxes_PirateWalking_1 

ExtendedSpritemaps_PirateWalking_1:
    dw $0002,$FFFB,$0003 
    dw Spitemaps_PirateWalking_27_Ninja_E 
    dw Hitboxes_PirateWalking_35_Ninja_1E 
    dw $0000,$0000 
    dw Spritemaps_PirateWalking_2 
    dw Hitboxes_PirateWalking_2 

ExtendedSpritemaps_PirateWalking_2:
    dw $0002,$FFFB,$0003 
    dw Spitemaps_PirateWalking_28_Ninja_F 
    dw Hitboxes_PirateWalking_36_Ninja_1F 
    dw $0000,$0000 
    dw Spritemaps_PirateWalking_3 
    dw Hitboxes_PirateWalking_3 

ExtendedSpritemaps_PirateWalking_3:
    dw $0002,$FFFB,$0003 
    dw Spitemaps_PirateWalking_29_Ninja_10 
    dw Hitboxes_PirateWalking_37_Ninja_20 
    dw $0002,$0000 
    dw Spritemaps_PirateWalking_4 
    dw Hitboxes_PirateWalking_4 

ExtendedSpritemaps_PirateWalking_4:
    dw $0002,$FFFB,$0003 
    dw Spitemaps_PirateWalking_29_Ninja_10 
    dw Hitboxes_PirateWalking_37_Ninja_20 
    dw $0002,$0000 
    dw Spritemaps_PirateWalking_5 
    dw Hitboxes_PirateWalking_5 

ExtendedSpritemaps_PirateWalking_5:
    dw $0002,$FFFB,$0003 
    dw Spitemaps_PirateWalking_28_Ninja_F 
    dw Hitboxes_PirateWalking_36_Ninja_1F 
    dw $0002,$0000 
    dw Spritemaps_PirateWalking_6 
    dw Hitboxes_PirateWalking_6 

ExtendedSpritemaps_PirateWalking_6:
    dw $0002,$FFFB,$0003 
    dw Spitemaps_PirateWalking_27_Ninja_E 
    dw Hitboxes_PirateWalking_35_Ninja_1E 
    dw $0000,$0000 
    dw Spritemaps_PirateWalking_7 
    dw Hitboxes_PirateWalking_7 

ExtendedSpritemaps_PirateWalking_7:
    dw $0002,$FFFB,$0003 
    dw Spitemaps_PirateWalking_26_Ninja_D 
    dw Hitboxes_PirateWalking_33_Ninja_1C 
    dw $0000,$0000 
    dw Spritemaps_PirateWalking_8 
    dw Hitboxes_PirateWalking_8 

ExtendedSpritemaps_PirateNinja_0:
    dw $0002,$0000,$0005 
    dw Spitemaps_PirateWalking_26_Ninja_D 
    dw Hitboxes_PirateWalking_34_Ninja_1D 
    dw $0000,$0003 
    dw Spitemaps_PirateWalking_B_Ninja_2 
    dw Hitboxes_PirateWalking_12_Ninja_A 

ExtendedSpritemaps_PirateNinja_1:
    dw $0002,$0000,$0005 
    dw Spitemaps_PirateNinja_11 
    dw Hitboxes_PirateNinja_21 
    dw $0000,$0003 
    dw Spitemaps_PirateWalking_9_Ninja_0 
    dw Hitboxes_PirateWalking_9_Ninja_0 

ExtendedSpritemaps_PirateNinja_2:
    dw $0002,$0000,$0005 
    dw Spitemaps_PirateNinja_12 
    dw Hitboxes_PirateNinja_22 
    dw $0000,$0003 
    dw Spitemaps_PirateWalking_9_Ninja_0 
    dw Hitboxes_PirateWalking_9_Ninja_0 

ExtendedSpritemaps_PirateNinja_3:
    dw $0002,$0000,$0004 
    dw Spitemaps_PirateNinja_13 
    dw Hitboxes_PirateNinja_23 
    dw $0000,$0003 
    dw Spitemaps_PirateWalking_9_Ninja_0 
    dw Hitboxes_PirateWalking_9_Ninja_0 

ExtendedSpritemaps_PirateNinja_4:
    dw $0002,$0000,$0003 
    dw Spitemaps_PirateNinja_14 
    dw Hitboxes_PirateNinja_24 
    dw $0000,$0003 
    dw Spitemaps_PirateWalking_9_Ninja_0 
    dw Hitboxes_PirateWalking_9_Ninja_0 

ExtendedSpritemaps_PirateNinja_5:
    dw $0002,$0000,$0005 
    dw Spitemaps_PirateNinja_13 
    dw Hitboxes_PirateNinja_23 
    dw $0000,$0003 
    dw Spitemaps_PirateWalking_9_Ninja_0 
    dw Hitboxes_PirateWalking_9_Ninja_0 

ExtendedSpritemaps_PirateNinja_6:
    dw $0002,$0000,$0005 
    dw Spitemaps_PirateNinja_11 
    dw Hitboxes_PirateNinja_21 
    dw $0000,$0003 
    dw Spitemaps_PirateWalking_9_Ninja_0 
    dw Hitboxes_PirateWalking_9_Ninja_0 

ExtendedSpritemaps_PirateNinja_7:
    dw $0002,$0000,$0006 
    dw Spitemaps_PirateWalking_29_Ninja_10 
    dw Hitboxes_PirateWalking_37_Ninja_20 
    dw $0000,$0003 
    dw Spitemaps_PirateWalking_9_Ninja_0 
    dw Hitboxes_PirateWalking_9_Ninja_0 

ExtendedSpritemaps_PirateNinja_8:
    dw $0002,$0000,$0007 
    dw Spitemaps_PirateNinja_18 
    dw Hitboxes_PirateNinja_28 
    dw $0000,$0003 
    dw Spitemaps_PirateWalking_B_Ninja_2 
    dw Hitboxes_PirateWalking_12_Ninja_A 

ExtendedSpritemaps_PirateWalking_8:
    dw $0002,$0005,$0003 
    dw Spitemaps_PirateWalking_2B_Ninja_21 
    dw Hitboxes_PirateWalking_39_Ninja_32 
    dw $0000,$0000 
    dw Spitemaps_PirateWalking_E 
    dw Hitboxes_PirateWalking_15 

ExtendedSpritemaps_PirateWalking_9:
    dw $0002,$0005,$0003 
    dw Spitemaps_PirateWalking_2C_Ninja_22 
    dw Hitboxes_PirateWalking_3A_Ninja_34 
    dw $0000,$0000 
    dw Spitemaps_PirateWalking_F 
    dw Hitboxes_PirateWalking_16 

ExtendedSpritemaps_PirateWalking_A:
    dw $0002,$0005,$0003 
    dw Spitemaps_PirateWalking_2D_Ninja_23 
    dw Hitboxes_PirateWalking_3B_Ninja_35 
    dw $0000,$0000 
    dw Spitemaps_PirateWalking_10 
    dw Hitboxes_PirateWalking_17 

ExtendedSpritemaps_PirateWalking_B:
    dw $0002,$0005,$0003 
    dw Spitemaps_PirateWalking_2E_Ninja_24 
    dw Hitboxes_PirateWalking_3C_Ninja_36 
    dw $0000,$0000 
    dw Spitemaps_PirateWalking_11 
    dw Hitboxes_PirateWalking_18 

ExtendedSpritemaps_PirateWalking_C:
    dw $0002,$0005,$0003 
    dw Spitemaps_PirateWalking_2E_Ninja_24 
    dw Hitboxes_PirateWalking_3C_Ninja_36 
    dw $FFFF,$0000 
    dw Spitemaps_PirateWalking_12 
    dw Hitboxes_PirateWalking_19 

ExtendedSpritemaps_PirateWalking_D:
    dw $0002,$0005,$0003 
    dw Spitemaps_PirateWalking_2D_Ninja_23 
    dw Hitboxes_PirateWalking_3B_Ninja_35 
    dw $0000,$0000 
    dw Spitemaps_PirateWalking_13 
    dw Hitboxes_PirateWalking_1A 

ExtendedSpritemaps_PirateWalking_E:
    dw $0002,$0005,$0003 
    dw Spitemaps_PirateWalking_2C_Ninja_22 
    dw Hitboxes_PirateWalking_3A_Ninja_34 
    dw $0001,$0000 
    dw Spitemaps_PirateWalking_14 
    dw Hitboxes_PirateWalking_1B 

ExtendedSpritemaps_PirateWalking_F:
    dw $0002,$0005,$0003 
    dw Spitemaps_PirateWalking_2B_Ninja_21 
    dw Hitboxes_PirateWalking_39_Ninja_32 
    dw $0001,$0000 
    dw Spitemaps_PirateWalking_15 
    dw Hitboxes_PirateWalking_1C 

ExtendedSpritemaps_PirateNinja_9:
    dw $0002,$0000,$0005 
    dw Spitemaps_PirateWalking_2B_Ninja_21 
    dw Hitboxes_PirateNinja_33 
    dw $0000,$0003 
    dw Spitemaps_PirateWalking_17_Ninja_4 
    dw Hitboxes_PirateWalking_26_Ninja_13 

ExtendedSpritemaps_PirateNinja_A:
    dw $0002,$0000,$0005 
    dw Spitemaps_PirateNinja_25 
    dw Hitboxes_PirateNinja_37 
    dw $0000,$0003 
    dw Spitemaps_PirateWalking_16_Ninja_3 
    dw Hitboxes_PirateWalking_1D_Ninja_A 

ExtendedSpritemaps_PirateNinja_B:
    dw $0002,$0000,$0005 
    dw Spitemaps_PirateNinja_26 
    dw Hitboxes_PirateNinja_38 
    dw $0000,$0003 
    dw Spitemaps_PirateWalking_16_Ninja_3 
    dw Hitboxes_PirateWalking_1D_Ninja_A 

ExtendedSpritemaps_PirateNinja_C:
    dw $0002,$0000,$0004 
    dw Spitemaps_PirateNinja_27 
    dw Hitboxes_PirateNinja_39 
    dw $0000,$0003 
    dw Spitemaps_PirateWalking_16_Ninja_3 
    dw Hitboxes_PirateWalking_1D_Ninja_A 

ExtendedSpritemaps_PirateNinja_D:
    dw $0002,$0000,$0003 
    dw Spitemaps_PirateNinja_28 
    dw Hitboxes_PirateNinja_3A 
    dw $0000,$0003 
    dw Spitemaps_PirateWalking_16_Ninja_3 
    dw Hitboxes_PirateWalking_1D_Ninja_A 

ExtendedSpritemaps_PirateNinja_E:
    dw $0002,$0000,$0005 
    dw Spitemaps_PirateNinja_27 
    dw Hitboxes_PirateNinja_39 
    dw $0000,$0003 
    dw Spitemaps_PirateWalking_16_Ninja_3 
    dw Hitboxes_PirateWalking_1D_Ninja_A 

ExtendedSpritemaps_PirateNinja_F:
    dw $0002,$0000,$0005 
    dw Spitemaps_PirateWalking_2E_Ninja_24 
    dw Hitboxes_PirateWalking_3C_Ninja_36 
    dw $0000,$0003 
    dw Spitemaps_PirateWalking_16_Ninja_3 
    dw Hitboxes_PirateWalking_1D_Ninja_A 

ExtendedSpritemaps_PirateNinja_10:
    dw $0002,$0000,$0006 
    dw Spitemaps_PirateNinja_2C 
    dw Hitboxes_PirateNinja_3E 
    dw $0000,$0003 
    dw Spitemaps_PirateWalking_16_Ninja_3 
    dw Hitboxes_PirateWalking_1D_Ninja_A 

ExtendedSpritemaps_PirateNinja_11:
    dw $0002,$0000,$0007 
    dw Spitemaps_PirateNinja_2C 
    dw Hitboxes_PirateNinja_3E 
    dw $0000,$0003 
    dw Spitemaps_PirateWalking_17_Ninja_4 
    dw Hitboxes_PirateWalking_26_Ninja_13 

ExtendedSpritemaps_PirateWalking_10:
    dw $0002,$0000,$0003 
    dw Spitemaps_PirateWalking_1A 
    dw Hitboxes_PirateWalking_27 
    dw $0000,$0003 
    dw Spitemaps_PirateWalking_9_Ninja_0 
    dw Hitboxes_PirateWalking_9_Ninja_0 

ExtendedSpritemaps_PirateWalking_11:
    dw $0002,$0000,$0003 
    dw Spitemaps_PirateWalking_1B 
    dw Hitboxes_PirateWalking_28 
    dw $0000,$0003 
    dw Spitemaps_PirateWalking_9_Ninja_0 
    dw Hitboxes_PirateWalking_9_Ninja_0 

ExtendedSpritemaps_PirateWalking_12:
    dw $0002,$0000,$0003 
    dw Spitemaps_PirateWalking_1C 
    dw Hitboxes_PirateWalking_29 
    dw $0000,$0003 
    dw Spitemaps_PirateWalking_9_Ninja_0 
    dw Hitboxes_PirateWalking_9_Ninja_0 

ExtendedSpritemaps_PirateWalking_13:
    dw $0002,$0000,$0003 
    dw Spitemaps_PirateWalking_1D 
    dw Hitboxes_PirateWalking_2A 
    dw $0000,$0003 
    dw Spitemaps_PirateWalking_9_Ninja_0 
    dw Hitboxes_PirateWalking_9_Ninja_0 

ExtendedSpritemaps_PirateWalking_14:
    dw $0002,$FFFF,$0004 
    dw Spitemaps_PirateWalking_1E 
    dw Hitboxes_PirateWalking_2B 
    dw $0000,$0003 
    dw Spitemaps_PirateWalking_9_Ninja_0 
    dw Hitboxes_PirateWalking_9_Ninja_0 

ExtendedSpritemaps_PirateWalking_15:
    dw $0002,$FFFE,$0006 
    dw Spitemaps_PirateWalking_1F 
    dw Hitboxes_PirateWalking_2C 
    dw $0000,$0003 
    dw Spitemaps_PirateWalking_B_Ninja_2 
    dw Hitboxes_PirateWalking_12_Ninja_A 

ExtendedSpritemaps_PirateWalking_16:
    dw $0002,$0000,$0003 
    dw Spitemaps_PirateWalking_20 
    dw Hitboxes_PirateWalking_2D 
    dw $0000,$0003 
    dw Spitemaps_PirateWalking_16_Ninja_3 
    dw Hitboxes_PirateWalking_1D_Ninja_A 

ExtendedSpritemaps_PirateWalking_17:
    dw $0002,$0000,$0003 
    dw Spitemaps_PirateWalking_21 
    dw Hitboxes_PirateWalking_2E 
    dw $0000,$0003 
    dw Spitemaps_PirateWalking_16_Ninja_3 
    dw Hitboxes_PirateWalking_1D_Ninja_A 

ExtendedSpritemaps_PirateWalking_18:
    dw $0002,$0000,$0003 
    dw Spitemaps_PirateWalking_22 
    dw Hitboxes_PirateWalking_2F 
    dw $0000,$0003 
    dw Spitemaps_PirateWalking_16_Ninja_3 
    dw Hitboxes_PirateWalking_1D_Ninja_A 

ExtendedSpritemaps_PirateWalking_19:
    dw $0002,$0000,$0003 
    dw Spitemaps_PirateWalking_23 
    dw Hitboxes_PirateWalking_30 
    dw $0000,$0003 
    dw Spitemaps_PirateWalking_16_Ninja_3 
    dw Hitboxes_PirateWalking_1D_Ninja_A 

ExtendedSpritemaps_PirateWalking_1A:
    dw $0002,$0001,$0004 
    dw Spitemaps_PirateWalking_24 
    dw Hitboxes_PirateWalking_31 
    dw $0000,$0003 
    dw Spitemaps_PirateWalking_16_Ninja_3 
    dw Hitboxes_PirateWalking_1D_Ninja_A 

ExtendedSpritemaps_PirateWalking_1B:
    dw $0002,$0002,$0006 
    dw Spitemaps_PirateWalking_25 
    dw Hitboxes_PirateWalking_32 
    dw $0000,$0003 
    dw Spitemaps_PirateWalking_17_Ninja_4 
    dw Hitboxes_PirateWalking_26_Ninja_13 

ExtendedSpritemaps_PirateWalking_1C:
    dw $0003,$FFFB,$FFF4 
    dw Spitemaps_PirateWalking_18 
    dw Hitboxes_PirateWalking_27 
    dw $0000,$0003 
    dw Spitemaps_PirateWalking_C 
    dw Hitboxes_PirateWalking_13 
    dw $0000,$0003 
    dw Spitemaps_PirateWalking_9_Ninja_0 
    dw Hitboxes_PirateWalking_9_Ninja_0 

ExtendedSpritemaps_PirateWalking_1D:
    dw $0002,$0000,$0003 
    dw Spitemaps_PirateWalking_1A 
    dw Hitboxes_PirateWalking_27 
    dw $0000,$0003 
    dw Spitemaps_PirateWalking_9_Ninja_0 
    dw Hitboxes_PirateWalking_9_Ninja_0 

ExtendedSpritemaps_PirateWalking_1E:
    dw $0003,$FFFB,$FFF5 
    dw Spitemaps_PirateWalking_19 
    dw Hitboxes_PirateWalking_27 
    dw $0000,$0003 
    dw Spitemaps_PirateWalking_C 
    dw Hitboxes_PirateWalking_13 
    dw $0000,$0003 
    dw Spitemaps_PirateWalking_9_Ninja_0 
    dw Hitboxes_PirateWalking_9_Ninja_0 

ExtendedSpritemaps_PirateWalking_1F:
    dw $0003,$0005,$FFF4 
    dw Spitemaps_PirateWalking_18 
    dw Hitboxes_PirateWalking_27 
    dw $0000,$0003 
    dw Spitemaps_PirateWalking_D 
    dw Hitboxes_PirateWalking_14 
    dw $0000,$0003 
    dw Spitemaps_PirateWalking_16_Ninja_3 
    dw Hitboxes_PirateWalking_1D_Ninja_A 

ExtendedSpritemaps_PirateWalking_20:
    dw $0002,$0000,$0003 
    dw Spitemaps_PirateWalking_20 
    dw Hitboxes_PirateWalking_2D 
    dw $0000,$0003 
    dw Spitemaps_PirateWalking_16_Ninja_3 
    dw Hitboxes_PirateWalking_1D_Ninja_A 

ExtendedSpritemaps_PirateWalking_21:
    dw $0003,$0005,$FFF5 
    dw Spitemaps_PirateWalking_19 
    dw Hitboxes_PirateWalking_27 
    dw $0000,$0003 
    dw Spitemaps_PirateWalking_D 
    dw Hitboxes_PirateWalking_14 
    dw $0000,$0003 
    dw Spitemaps_PirateWalking_16_Ninja_3 
    dw Hitboxes_PirateWalking_1D_Ninja_A 

ExtendedSpritemaps_PirateWalking_22:
    dw $0001,$0000,$0001 
    dw Spritemaps_PirateWalking_0 
    dw Hitboxes_PirateWalking_0 

ExtendedSpritemaps_PirateNinja_12:
    dw $0001,$0000,$0000 
    dw Spitemaps_PirateNinja_2D 
    dw Hitboxes_PirateNinja_40 

ExtendedSpritemaps_PirateNinja_13:
    dw $0001,$0000,$0000 
    dw Spitemaps_PirateNinja_2E 
    dw Hitboxes_PirateNinja_41 

ExtendedSpritemaps_PirateNinja_14:
    dw $0001,$0000,$0000 
    dw Spitemaps_PirateNinja_2E_miscount 
    dw Hitboxes_PirateNinja_42 

ExtendedSpritemaps_PirateNinja_15:
    dw $0001,$0000,$0000 
    dw Spitemaps_PirateNinja_2F 
    dw Hitboxes_PirateNinja_43 

ExtendedSpritemaps_PirateNinja_16:
    dw $0001,$0000,$0000 
    dw Spitemaps_PirateNinja_30 
    dw Hitboxes_PirateNinja_44 

ExtendedSpritemaps_PirateNinja_17:
    dw $0001,$0000,$0000 
    dw Spitemaps_PirateNinja_31 
    dw Hitboxes_PirateNinja_45 

ExtendedSpritemaps_PirateNinja_18:
    dw $0001,$0000,$0000 
    dw Spitemaps_PirateNinja_32 
    dw Hitboxes_PirateNinja_46 

ExtendedSpritemaps_PirateNinja_19:
    dw $0001,$0000,$0000 
    dw Spitemaps_PirateNinja_33 
    dw Hitboxes_PirateNinja_47 

ExtendedSpritemaps_PirateNinja_1A:
    dw $0001,$0000,$0000 
    dw Spitemaps_PirateNinja_34 
    dw Hitboxes_PirateNinja_48 

ExtendedSpritemaps_PirateNinja_1B:
    dw $0001,$0000,$0000 
    dw Spitemaps_PirateNinja_35 
    dw Hitboxes_PirateNinja_49 

ExtendedSpritemaps_PirateNinja_1C:
    dw $0001,$0000,$0000 
    dw Spitemaps_PirateNinja_36 
    dw Hitboxes_PirateNinja_4A 

ExtendedSpritemaps_PirateNinja_1D:
    dw $0001,$0000,$0000 
    dw Spitemaps_PirateNinja_37 
    dw Hitboxes_PirateNinja_4B 

ExtendedSpritemaps_PirateNinja_1E:
    dw $0001,$0000,$0000 
    dw Spitemaps_PirateNinja_38 
    dw Hitboxes_PirateNinja_4C 

ExtendedSpritemaps_PirateNinja_1F:
    dw $0001,$0000,$0000 
    dw Spitemaps_PirateNinja_39 
    dw Hitboxes_PirateNinja_4D 

ExtendedSpritemaps_PirateNinja_20:
    dw $0001,$0000,$0000 
    dw Spitemaps_PirateNinja_3A 
    dw Hitboxes_PirateNinja_4E 

ExtendedSpritemaps_PirateNinja_21:
    dw $0001,$0000,$0000 
    dw Spitemaps_PirateNinja_3B 
    dw Hitboxes_PirateNinja_4F 

ExtendedSpritemaps_PirateNinja_22:
    dw $0002,$FFFB,$0001 
    dw Spitemaps_PirateWalking_26_Ninja_D 
    dw Hitboxes_PirateWalking_33_Ninja_1C 
    dw $0000,$FFFE 
    dw Spitemaps_PirateNinja_5 
    dw Hitboxes_PirateNinja_14 

ExtendedSpritemaps_PirateNinja_23:
    dw $0002,$FFFB,$0003 
    dw Spitemaps_PirateWalking_27_Ninja_E 
    dw Hitboxes_PirateWalking_35_Ninja_1E 
    dw $FFFF,$0000 
    dw Spitemaps_PirateNinja_6 
    dw Hitboxes_PirateNinja_15 

ExtendedSpritemaps_PirateNinja_24:
    dw $0002,$FFFB,$0004 
    dw Spitemaps_PirateWalking_28_Ninja_F 
    dw Hitboxes_PirateWalking_36_Ninja_1F 
    dw $0000,$0000 
    dw Spitemaps_PirateNinja_7 
    dw Hitboxes_PirateNinja_16 

ExtendedSpritemaps_PirateNinja_25:
    dw $0002,$FFFB,$0002 
    dw Spitemaps_PirateWalking_29_Ninja_10 
    dw Hitboxes_PirateWalking_37_Ninja_20 
    dw $FFFF,$0000 
    dw Spitemaps_PirateNinja_8 
    dw Hitboxes_PirateNinja_17 

ExtendedSpritemaps_PirateNinja_26:
    dw $0002,$FFFB,$0001 
    dw Spitemaps_PirateWalking_29_Ninja_10 
    dw Hitboxes_PirateWalking_37_Ninja_20 
    dw $0002,$FFFE 
    dw Spitemaps_PirateNinja_9 
    dw Hitboxes_PirateNinja_18 

ExtendedSpritemaps_PirateNinja_27:
    dw $0002,$FFFB,$0003 
    dw Spitemaps_PirateWalking_28_Ninja_F 
    dw Hitboxes_PirateWalking_36_Ninja_1F 
    dw $0002,$0000 
    dw Spitemaps_PirateNinja_A 
    dw Hitboxes_PirateNinja_19 

ExtendedSpritemaps_PirateNinja_28:
    dw $0002,$FFFB,$0003 
    dw Spitemaps_PirateWalking_27_Ninja_E 
    dw Hitboxes_PirateWalking_35_Ninja_1E 
    dw $0000,$0000 
    dw Spitemaps_PirateNinja_B 
    dw Hitboxes_PirateNinja_1A 

ExtendedSpritemaps_PirateNinja_29:
    dw $0002,$FFFB,$0001 
    dw Spitemaps_PirateWalking_26_Ninja_D 
    dw Hitboxes_PirateWalking_33_Ninja_1C 
    dw $0000,$0000 
    dw Spitemaps_PirateNinja_C 
    dw Hitboxes_PirateNinja_1B 

ExtendedSpritemaps_PirateNinja_2A:
    dw $0002,$0005,$0001 
    dw Spitemaps_PirateWalking_2B_Ninja_21 
    dw Hitboxes_PirateWalking_39_Ninja_32 
    dw $0000,$FFFE 
    dw Spitemaps_PirateNinja_19 
    dw Hitboxes_PirateNinja_2A 

ExtendedSpritemaps_PirateNinja_2B:
    dw $0002,$0005,$0003 
    dw Spitemaps_PirateWalking_2C_Ninja_22 
    dw Hitboxes_PirateWalking_3A_Ninja_34 
    dw $0000,$0000 
    dw Spitemaps_PirateNinja_1A 
    dw Hitboxes_PirateNinja_2B 

ExtendedSpritemaps_PirateNinja_2C:
    dw $0002,$0005,$0004 
    dw Spitemaps_PirateWalking_2D_Ninja_23 
    dw Hitboxes_PirateWalking_3B_Ninja_35 
    dw $0000,$0000 
    dw Spitemaps_PirateNinja_1B 
    dw Hitboxes_PirateNinja_2C 

ExtendedSpritemaps_PirateNinja_2D:
    dw $0002,$0005,$0002 
    dw Spitemaps_PirateWalking_2E_Ninja_24 
    dw Hitboxes_PirateWalking_3C_Ninja_36 
    dw $0000,$0000 
    dw Spitemaps_PirateNinja_1C 
    dw Hitboxes_PirateNinja_2D 

ExtendedSpritemaps_PirateNinja_2E:
    dw $0002,$0005,$0001 
    dw Spitemaps_PirateWalking_2E_Ninja_24 
    dw Hitboxes_PirateWalking_3C_Ninja_36 
    dw $FFFF,$FFFF 
    dw Spitemaps_PirateNinja_1D 
    dw Hitboxes_PirateNinja_2E 

ExtendedSpritemaps_PirateNinja_2F:
    dw $0002,$0005,$0003 
    dw Spitemaps_PirateWalking_2D_Ninja_23 
    dw Hitboxes_PirateWalking_3B_Ninja_35 
    dw $0000,$0000 
    dw Spitemaps_PirateNinja_1E 
    dw Hitboxes_PirateNinja_2F 

ExtendedSpritemaps_PirateNinja_30:
    dw $0002,$0005,$0003 
    dw Spitemaps_PirateWalking_2C_Ninja_22 
    dw Hitboxes_PirateWalking_3A_Ninja_34 
    dw $0001,$0000 
    dw Spitemaps_PirateNinja_1F 
    dw Hitboxes_PirateNinja_30 

ExtendedSpritemaps_PirateNinja_31:
    dw $0002,$0005,$0001 
    dw Spitemaps_PirateWalking_2B_Ninja_21 
    dw Hitboxes_PirateWalking_39_Ninja_32 
    dw $0001,$0000 
    dw Spitemaps_PirateNinja_20 
    dw Hitboxes_PirateNinja_31 

ExtendedSpritemaps_PirateNinja_32:
    dw $0001,$0000,$0003 
    dw Spitemaps_PirateNinja_15 
    dw Hitboxes_PirateNinja_25 

ExtendedSpritemaps_PirateNinja_33:
    dw $0001,$0000,$0003 
    dw Spitemaps_PirateNinja_16 
    dw Hitboxes_PirateNinja_26 

ExtendedSpritemaps_PirateNinja_34:
    dw $0001,$0000,$0003 
    dw Spitemaps_PirateNinja_17 
    dw Hitboxes_PirateNinja_27 

ExtendedSpritemaps_PirateNinja_35:
    dw $0001,$0000,$0003 
    dw Spitemaps_PirateNinja_29 
    dw Hitboxes_PirateNinja_3B 

ExtendedSpritemaps_PirateNinja_36:
    dw $0001,$0000,$0003 
    dw Spitemaps_PirateNinja_2A 
    dw Hitboxes_PirateNinja_3C 

ExtendedSpritemaps_PirateNinja_37:
    dw $0001,$0000,$0003 
    dw Spitemaps_PirateNinja_2B 
    dw Hitboxes_PirateNinja_3D 

ExtendedSpritemaps_PirateWalking_23:
    dw $0001,$0000,$0008 
    dw Spitemaps_PirateWalking_2A_Ninja_18 
    dw Hitboxes_PirateWalking_38 

ExtendedSpritemaps_PirateNinja_38:
    dw $0001,$0000,$0008 
    dw Spitemaps_PirateWalking_2A_Ninja_18 
    dw Hitboxes_PirateNinja_29 

ExtendedSpritemaps_PirateWalking_24:
    dw $0001,$0000,$0008 
    dw Spitemaps_PirateWalking_2F 
    dw Hitboxes_PirateWalking_3D 

ExtendedSpritemaps_PirateNinja_39:
    dw $0001,$0000,$0008 
    dw Spitemaps_PirateWalking_2F 
    dw Hitboxes_PirateNinja_3F 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ExtendedSpritemaps_SpacePirate_B28FBA:
    dw $0001,$0000,$0000 
    dw UNUSED_Spitemaps_SpacePirate_B2DEBA 
    dw UNUSED_Hitboxes_SpacePirate_B2A57C 

UNUSED_ExtendedSpritemaps_SpacePirate_B28FC4:
    dw $0001,$0000,$0000 
    dw UNUSED_Spitemaps_SpacePirate_B2DF20 
    dw UNUSED_Hitboxes_SpacePirate_B2A58A 

UNUSED_ExtendedSpritemaps_SpacePirate_B28FCE:
    dw $0001,$0000,$0000 
    dw UNUSED_Spitemaps_SpacePirate_B2DF6D 
    dw UNUSED_Hitboxes_SpacePirate_B2A598 

UNUSED_ExtendedSpritemaps_SpacePirate_B28FD8:
    dw $0001,$0000,$0000 
    dw UNUSED_Spitemaps_SpacePirate_B2DFB5 
    dw UNUSED_Hitboxes_SpacePirate_B2A5A6 

UNUSED_ExtendedSpritemaps_SpacePirate_B28FE2:
    dw $0001,$0000,$0000 
    dw UNUSED_Spitemaps_SpacePirate_B2E71A 
    dw UNUSED_Hitboxes_SpacePirate_B2A760 

UNUSED_ExtendedSpritemaps_SpacePirate_B28FEC:
    dw $0001,$0000,$0000 
    dw UNUSED_Spitemaps_SpacePirate_B2E780 
    dw UNUSED_Hitboxes_SpacePirate_B2A76E 

UNUSED_ExtendedSpritemaps_SpacePirate_B28FF6:
    dw $0001,$0000,$0000 
    dw UNUSED_Spitemaps_SpacePirate_B2E7CD 
    dw UNUSED_Hitboxes_SpacePirate_B2A77C 

UNUSED_ExtendedSpritemaps_SpacePirate_B29000:
    dw $0001,$0000,$0000 
    dw UNUSED_Spitemaps_SpacePirate_B2E815 
    dw UNUSED_Hitboxes_SpacePirate_B2A78A 
endif ; !FEATURE_KEEP_UNREFERENCED

ExtendedSpritemaps_PirateNinja_3A:
    dw $0001,$0000,$0000 
    dw Spitemaps_PirateNinja_48 
    dw Hitboxes_PirateNinja_5A 

ExtendedSpritemaps_PirateNinja_3B:
    dw $0001,$0000,$0000 
    dw Spitemaps_PirateNinja_4C 
    dw Hitboxes_PirateNinja_5E 

ExtendedSpritemaps_PirateNinja_3C:
    dw $0001,$0000,$0000 
    dw Spitemaps_PirateNinja_4E 
    dw Hitboxes_PirateNinja_60 

ExtendedSpritemaps_PirateNinja_3D:
    dw $0001,$0000,$0000 
    dw Spitemaps_PirateNinja_52 
    dw Hitboxes_PirateNinja_64 

ExtendedSpritemaps_PirateNinja_3E:
    dw $0001,$0005,$0000 
    dw Spitemaps_PirateNinja_4A 
    dw Hitboxes_PirateNinja_5C 

ExtendedSpritemaps_PirateNinja_3F:
    dw $0001,$FFFB,$0001 
    dw Spitemaps_PirateNinja_4B 
    dw Hitboxes_PirateNinja_5D 

ExtendedSpritemaps_PirateNinja_40:
    dw $0001,$FFFB,$0000 
    dw Spitemaps_PirateNinja_50 
    dw Hitboxes_PirateNinja_62 

ExtendedSpritemaps_PirateNinja_41:
    dw $0001,$0005,$0001 
    dw Spitemaps_PirateNinja_51 
    dw Hitboxes_PirateNinja_63 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ExtendedSpritemaps_SpacePirate_B2905A:
    dw $0001,$0000,$0000 
    dw UNUSED_Spitemaps_SpacePirate_B2C9FC 
    dw UNUSED_Hitboxes_SpacePirate_B29FE8 

UNUSED_ExtendedSpritemaps_SpacePirate_B29064:
    dw $0001,$0000,$0000 
    dw UNUSED_Spitemaps_SpacePirate_B2C9FC 
    dw UNUSED_Hitboxes_SpacePirate_B29FE8 

UNUSED_ExtendedSpritemaps_SpacePirate_B2906E:
    dw $0002,$FFFB,$0003 
    dw Spitemaps_PirateNinja_47 
    dw Hitboxes_PirateNinja_59 
    dw $0000,$0000 
    dw UNUSED_Spitemaps_SpacePirate_B2D0F8 
    dw UNUSED_Hitboxes_SpacePirate_B2A17E 

UNUSED_ExtendedSpritemaps_SpacePirate_B29080:
    dw $0002,$FFFB,$0003 
    dw UNUSED_Spitemaps_SpacePirate_B2DB49 
    dw UNUSED_Hitboxes_SpacePirate_B2A4C6 
    dw $0000,$0000 
    dw UNUSED_Spitemaps_SpacePirate_B2D12C 
    dw UNUSED_Hitboxes_SpacePirate_B2A18C 

UNUSED_ExtendedSpritemaps_SpacePirate_B29092:
    dw $0002,$FFFB,$0003 
    dw UNUSED_Spitemaps_SpacePirate_B2DB78 
    dw UNUSED_Hitboxes_SpacePirate_B2A4D4 
    dw $0000,$0000 
    dw UNUSED_Spitemaps_SpacePirate_B2D165 
    dw UNUSED_Hitboxes_SpacePirate_B2A19A 

UNUSED_ExtendedSpritemaps_SpacePirate_B290A4:
    dw $0002,$FFFB,$0003 
    dw UNUSED_Spitemaps_SpacePirate_B2DBA2 
    dw UNUSED_Hitboxes_SpacePirate_B2A4E2 
    dw $0002,$0000 
    dw UNUSED_Spitemaps_SpacePirate_B2D1A3 
    dw UNUSED_Hitboxes_SpacePirate_B2A1A8 

UNUSED_ExtendedSpritemaps_SpacePirate_B290B6:
    dw $0002,$FFFB,$0003 
    dw UNUSED_Spitemaps_SpacePirate_B2DBA2 
    dw UNUSED_Hitboxes_SpacePirate_B2A4E2 
    dw $0002,$0000 
    dw UNUSED_Spitemaps_SpacePirate_B2D1DC 
    dw UNUSED_Hitboxes_SpacePirate_B2A1B6 

UNUSED_ExtendedSpritemaps_SpacePirate_B290C8:
    dw $0002,$FFFB,$0003 
    dw UNUSED_Spitemaps_SpacePirate_B2DB78 
    dw UNUSED_Hitboxes_SpacePirate_B2A4D4 
    dw $0002,$0000 
    dw UNUSED_Spitemaps_SpacePirate_B2D210 
    dw UNUSED_Hitboxes_SpacePirate_B2A1C4 

UNUSED_ExtendedSpritemaps_SpacePirate_B290DA:
    dw $0002,$FFFB,$0003 
    dw UNUSED_Spitemaps_SpacePirate_B2DB49 
    dw UNUSED_Hitboxes_SpacePirate_B2A4C6 
    dw $0000,$0000 
    dw UNUSED_Spitemaps_SpacePirate_B2D249 
    dw UNUSED_Hitboxes_SpacePirate_B2A1D2 

UNUSED_ExtendedSpritemaps_SpacePirate_B290EC:
    dw $0002,$FFFB,$0003 
    dw Spitemaps_PirateNinja_47 
    dw Hitboxes_PirateNinja_59 
    dw $0000,$0000 
    dw UNUSED_Spitemaps_SpacePirate_B2D287 
    dw UNUSED_Hitboxes_SpacePirate_B2A1E0 
endif ; !FEATURE_KEEP_UNREFERENCED

ExtendedSpritemaps_PirateNinja_42:
    dw $0002,$0000,$0005 
    dw Spitemaps_PirateNinja_47 
    dw Hitboxes_PirateNinja_59 
    dw $0000,$0003 
    dw Spitemaps_PirateNinja_3E 
    dw Hitboxes_PirateNinja_52 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ExtendedSpritemaps_SpacePirate_B29110:
    dw $0002,$0000,$0005 
    dw UNUSED_Spitemaps_SpacePirate_B2DBCC 
    dw UNUSED_Hitboxes_SpacePirate_B2A4F0 
    dw $0000,$0003 
    dw Spitemaps_PirateNinja_3D 
    dw Hitboxes_PirateNinja_51 

UNUSED_ExtendedSpritemaps_SpacePirate_B29122:
    dw $0002,$0000,$0005 
    dw UNUSED_Spitemaps_SpacePirate_B2DBF1 
    dw UNUSED_Hitboxes_SpacePirate_B2A4FE 
    dw $0000,$0003 
    dw Spitemaps_PirateNinja_3D 
    dw Hitboxes_PirateNinja_51 

UNUSED_ExtendedSpritemaps_SpacePirate_B29134:
    dw $0002,$0000,$0004 
    dw UNUSED_Spitemaps_SpacePirate_B2DC16 
    dw UNUSED_Hitboxes_SpacePirate_B2A50C 
    dw $0000,$0003 
    dw Spitemaps_PirateNinja_3D 
    dw Hitboxes_PirateNinja_51 

UNUSED_ExtendedSpritemaps_SpacePirate_B29146:
    dw $0002,$0000,$0003 
    dw UNUSED_Spitemaps_SpacePirate_B2DC45 
    dw UNUSED_Hitboxes_SpacePirate_B2A51A 
    dw $0000,$0003 
    dw Spitemaps_PirateNinja_3D 
    dw Hitboxes_PirateNinja_51 

UNUSED_ExtendedSpritemaps_SpacePirate_B29158:
    dw $0002,$0000,$0005 
    dw UNUSED_Spitemaps_SpacePirate_B2DC16 
    dw UNUSED_Hitboxes_SpacePirate_B2A50C 
    dw $0000,$0003 
    dw Spitemaps_PirateNinja_3D 
    dw Hitboxes_PirateNinja_51 

UNUSED_ExtendedSpritemaps_SpacePirate_B2916A:
    dw $0002,$0000,$0005 
    dw UNUSED_Spitemaps_SpacePirate_B2DBCC 
    dw UNUSED_Hitboxes_SpacePirate_B2A4F0 
    dw $0000,$0003 
    dw Spitemaps_PirateNinja_3D 
    dw Hitboxes_PirateNinja_51 

UNUSED_ExtendedSpritemaps_SpacePirate_B2917C:
    dw $0002,$0000,$0006 
    dw UNUSED_Spitemaps_SpacePirate_B2DBA2 
    dw UNUSED_Hitboxes_SpacePirate_B2A4E2 
    dw $0000,$0003 
    dw Spitemaps_PirateNinja_3D 
    dw Hitboxes_PirateNinja_51 

UNUSED_ExtendedSpritemaps_SpacePirate_B2918E:
    dw $0002,$0000,$0007 
    dw UNUSED_Spitemaps_SpacePirate_B2DFFD 
    dw UNUSED_Hitboxes_SpacePirate_B2A5B4 
    dw $0000,$0003 
    dw Spitemaps_PirateNinja_3E 
    dw Hitboxes_PirateNinja_52 

UNUSED_ExtendedSpritemaps_SpacePirate_B291A0:
    dw $0001,$0000,$0003 
    dw UNUSED_Spitemaps_SpacePirate_B2D328 
    dw UNUSED_Hitboxes_SpacePirate_B2A20A 

UNUSED_ExtendedSpritemaps_SpacePirate_B291AA:
    dw $0001,$0000,$0003 
    dw UNUSED_Spitemaps_SpacePirate_B2D339 
    dw UNUSED_Hitboxes_SpacePirate_B2A218 

UNUSED_ExtendedSpritemaps_SpacePirate_B291B4:
    dw $0001,$0000,$0003 
    dw UNUSED_Spitemaps_SpacePirate_B2D345 
    dw UNUSED_Hitboxes_SpacePirate_B2A226 

UNUSED_ExtendedSpritemaps_SpacePirate_B291BE:
    dw $0001,$0000,$0003 
    dw UNUSED_Spitemaps_SpacePirate_B2D356 
    dw UNUSED_Hitboxes_SpacePirate_B2A234 

UNUSED_ExtendedSpritemaps_SpacePirate_B291C8:
    dw $0001,$0000,$0003 
    dw UNUSED_Spitemaps_SpacePirate_B2D362 
    dw UNUSED_Hitboxes_SpacePirate_B2A242 

UNUSED_ExtendedSpritemaps_SpacePirate_B291D2:
    dw $0001,$0000,$0003 
    dw UNUSED_Spitemaps_SpacePirate_B2D373 
    dw UNUSED_Hitboxes_SpacePirate_B2A250 

UNUSED_ExtendedSpritemaps_SpacePirate_B291DC:
    dw $0001,$0000,$0003 
    dw UNUSED_Spitemaps_SpacePirate_B2D37F 
    dw UNUSED_Hitboxes_SpacePirate_B2A25E 

UNUSED_ExtendedSpritemaps_SpacePirate_B291E6:
    dw $0001,$0000,$0003 
    dw UNUSED_Spitemaps_SpacePirate_B2D390 
    dw UNUSED_Hitboxes_SpacePirate_B2A26C 

UNUSED_ExtendedSpritemaps_SpacePirate_B291F0:
    dw $0002,$0005,$0003 
    dw Spitemaps_PirateNinja_4D 
    dw Hitboxes_PirateNinja_5F 
    dw $0000,$0000 
    dw UNUSED_Spitemaps_SpacePirate_B2D406 
    dw UNUSED_Hitboxes_SpacePirate_B2A2A4 

UNUSED_ExtendedSpritemaps_SpacePirate_B29202:
    dw $0002,$0005,$0003 
    dw UNUSED_Spitemaps_SpacePirate_B2E3A9 
    dw UNUSED_Hitboxes_SpacePirate_B2A6AA 
    dw $0000,$0000 
    dw UNUSED_Spitemaps_SpacePirate_B2D43A 
    dw UNUSED_Hitboxes_SpacePirate_B2A2B2 

UNUSED_ExtendedSpritemaps_SpacePirate_B29214:
    dw $0002,$0005,$0003 
    dw UNUSED_Spitemaps_SpacePirate_B2E3D8 
    dw UNUSED_Hitboxes_SpacePirate_B2A6B8 
    dw $0000,$0000 
    dw UNUSED_Spitemaps_SpacePirate_B2D473 
    dw UNUSED_Hitboxes_SpacePirate_B2A2C0 

UNUSED_ExtendedSpritemaps_SpacePirate_B29226:
    dw $0002,$0005,$0003 
    dw UNUSED_Spitemaps_SpacePirate_B2E402 
    dw UNUSED_Hitboxes_SpacePirate_B2A6C6 
    dw $0000,$0000 
    dw UNUSED_Spitemaps_SpacePirate_B2D4B1 
    dw UNUSED_Hitboxes_SpacePirate_B2A2CE 

UNUSED_ExtendedSpritemaps_SpacePirate_B29238:
    dw $0002,$0005,$0003 
    dw UNUSED_Spitemaps_SpacePirate_B2E402 
    dw UNUSED_Hitboxes_SpacePirate_B2A6C6 
    dw $FFFF,$0000 
    dw UNUSED_Spitemaps_SpacePirate_B2D4EA 
    dw UNUSED_Hitboxes_SpacePirate_B2A2DC 

UNUSED_ExtendedSpritemaps_SpacePirate_B2924A:
    dw $0002,$0005,$0003 
    dw UNUSED_Spitemaps_SpacePirate_B2E3D8 
    dw UNUSED_Hitboxes_SpacePirate_B2A6B8 
    dw $0000,$0000 
    dw UNUSED_Spitemaps_SpacePirate_B2D51E 
    dw UNUSED_Hitboxes_SpacePirate_B2A2EA 

UNUSED_ExtendedSpritemaps_SpacePirate_B2925C:
    dw $0002,$0005,$0003 
    dw UNUSED_Spitemaps_SpacePirate_B2E3A9 
    dw UNUSED_Hitboxes_SpacePirate_B2A6AA 
    dw $0001,$0000 
    dw UNUSED_Spitemaps_SpacePirate_B2D557 
    dw UNUSED_Hitboxes_SpacePirate_B2A2F8 

UNUSED_ExtendedSpritemaps_SpacePirate_B2926E:
    dw $0002,$0005,$0003 
    dw Spitemaps_PirateNinja_4D 
    dw Hitboxes_PirateNinja_5F 
    dw $0001,$0000 
    dw UNUSED_Spitemaps_SpacePirate_B2D595 
    dw UNUSED_Hitboxes_SpacePirate_B2A306 
endif ; !FEATURE_KEEP_UNREFERENCED

ExtendedSpritemaps_PirateNinja_43:
    dw $0002,$0000,$0005 
    dw Spitemaps_PirateNinja_4D 
    dw Hitboxes_PirateNinja_5F 
    dw $0000,$0003 
    dw Spitemaps_PirateNinja_42 
    dw Hitboxes_PirateNinja_56 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ExtendedSpritemaps_SpacePirate_B29292:
    dw $0002,$0000,$0005 
    dw UNUSED_Spitemaps_SpacePirate_B2E42C 
    dw UNUSED_Hitboxes_SpacePirate_B2A6D4 
    dw $0000,$0003 
    dw Spitemaps_PirateNinja_41 
    dw Hitboxes_PirateNinja_55 

UNUSED_ExtendedSpritemaps_SpacePirate_B292A4:
    dw $0002,$0000,$0005 
    dw UNUSED_Spitemaps_SpacePirate_B2E451 
    dw UNUSED_Hitboxes_SpacePirate_B2A6E2 
    dw $0000,$0003 
    dw Spitemaps_PirateNinja_41 
    dw Hitboxes_PirateNinja_55 

UNUSED_ExtendedSpritemaps_SpacePirate_B292B6:
    dw $0002,$0000,$0004 
    dw UNUSED_Spitemaps_SpacePirate_B2E476 
    dw UNUSED_Hitboxes_SpacePirate_B2A6F0 
    dw $0000,$0003 
    dw Spitemaps_PirateNinja_41 
    dw Hitboxes_PirateNinja_55 

UNUSED_ExtendedSpritemaps_SpacePirate_B292C8:
    dw $0002,$0000,$0003 
    dw UNUSED_Spitemaps_SpacePirate_B2E4A5 
    dw UNUSED_Hitboxes_SpacePirate_B2A6FE 
    dw $0000,$0003 
    dw Spitemaps_PirateNinja_41 
    dw Hitboxes_PirateNinja_55 

UNUSED_ExtendedSpritemaps_SpacePirate_B292DA:
    dw $0002,$0000,$0005 
    dw UNUSED_Spitemaps_SpacePirate_B2E476 
    dw UNUSED_Hitboxes_SpacePirate_B2A6F0 
    dw $0000,$0003 
    dw Spitemaps_PirateNinja_41 
    dw Hitboxes_PirateNinja_55 

UNUSED_ExtendedSpritemaps_SpacePirate_B292EC:
    dw $0002,$0000,$0005 
    dw UNUSED_Spitemaps_SpacePirate_B2E402 
    dw UNUSED_Hitboxes_SpacePirate_B2A6C6 
    dw $0000,$0003 
    dw Spitemaps_PirateNinja_41 
    dw Hitboxes_PirateNinja_55 

UNUSED_ExtendedSpritemaps_SpacePirate_B292FE:
    dw $0002,$0000,$0006 
    dw UNUSED_Spitemaps_SpacePirate_B2E85D 
    dw UNUSED_Hitboxes_SpacePirate_B2A798 
    dw $0000,$0003 
    dw Spitemaps_PirateNinja_41 
    dw Hitboxes_PirateNinja_55 

UNUSED_ExtendedSpritemaps_SpacePirate_B29310:
    dw $0002,$0000,$0007 
    dw UNUSED_Spitemaps_SpacePirate_B2E85D 
    dw UNUSED_Hitboxes_SpacePirate_B2A798 
    dw $0000,$0003 
    dw Spitemaps_PirateNinja_42 
    dw Hitboxes_PirateNinja_56 

UNUSED_ExtendedSpritemaps_SpacePirate_B29322:
    dw $0001,$0000,$0000 
    dw UNUSED_Spitemaps_SpacePirate_B2D636 
    dw UNUSED_Hitboxes_SpacePirate_B2A322 

UNUSED_ExtendedSpritemaps_SpacePirate_B2932C:
    dw $0001,$0000,$0000 
    dw UNUSED_Spitemaps_SpacePirate_B2D647 
    dw UNUSED_Hitboxes_SpacePirate_B2A330 

UNUSED_ExtendedSpritemaps_SpacePirate_B29336:
    dw $0001,$0000,$0000 
    dw UNUSED_Spitemaps_SpacePirate_B2D653 
    dw UNUSED_Hitboxes_SpacePirate_B2A33E 

UNUSED_ExtendedSpritemaps_SpacePirate_B29340:
    dw $0001,$0000,$0000 
    dw UNUSED_Spitemaps_SpacePirate_B2D664 
    dw UNUSED_Hitboxes_SpacePirate_B2A34C 

UNUSED_ExtendedSpritemaps_SpacePirate_B2934A:
    dw $0001,$0000,$0000 
    dw UNUSED_Spitemaps_SpacePirate_B2D670 
    dw UNUSED_Hitboxes_SpacePirate_B2A35A 

UNUSED_ExtendedSpritemaps_SpacePirate_B29354:
    dw $0001,$0000,$0000 
    dw UNUSED_Spitemaps_SpacePirate_B2D681 
    dw UNUSED_Hitboxes_SpacePirate_B2A368 

UNUSED_ExtendedSpritemaps_SpacePirate_B2935E:
    dw $0001,$0000,$0000 
    dw UNUSED_Spitemaps_SpacePirate_B2D68D 
    dw UNUSED_Hitboxes_SpacePirate_B2A376 

UNUSED_ExtendedSpritemaps_SpacePirate_B29368:
    dw $0001,$0000,$0004 
    dw UNUSED_Spitemaps_SpacePirate_B2D69E 
    dw UNUSED_Hitboxes_SpacePirate_B2A384 
endif ; !FEATURE_KEEP_UNREFERENCED

ExtendedSpritemaps_PirateNinja_44:
    dw $0001,$0002,$0000 
    dw Spitemaps_PirateNinja_49 
    dw Hitboxes_PirateNinja_5B 

ExtendedSpritemaps_PirateNinja_45:
    dw $0001,$FFFE,$0000 
    dw Spitemaps_PirateNinja_4F 
    dw Hitboxes_PirateNinja_61 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ExtendedSpritemaps_SpacePirate_B29386:
    dw $0001,$0000,$0003 
    dw UNUSED_Spitemaps_SpacePirate_B2C9FC 
    dw UNUSED_Hitboxes_SpacePirate_B29FE8 

UNUSED_ExtendedSpritemaps_SpacePirate_B29390:
    dw $0001,$0000,$0003 
    dw UNUSED_Spitemaps_SpacePirate_B2C9FC 
    dw UNUSED_Hitboxes_SpacePirate_B29FE8 

UNUSED_ExtendedSpritemaps_SpacePirate_B2939A:
    dw $0001,$FFFF,$0004 
    dw UNUSED_Spitemaps_SpacePirate_B2C9FC 
    dw UNUSED_Hitboxes_SpacePirate_B29FE8 

UNUSED_ExtendedSpritemaps_SpacePirate_B293A4:
    dw $0001,$FFFE,$0006 
    dw UNUSED_Spitemaps_SpacePirate_B2C9FC 
    dw UNUSED_Hitboxes_SpacePirate_B29FE8 

UNUSED_ExtendedSpritemaps_SpacePirate_B293AE:
    dw $0001,$0000,$0003 
    dw UNUSED_Spitemaps_SpacePirate_B2C9FC 
    dw UNUSED_Hitboxes_SpacePirate_B29FE8 

UNUSED_ExtendedSpritemaps_SpacePirate_B293B8:
    dw $0001,$0000,$0003 
    dw UNUSED_Spitemaps_SpacePirate_B2C9FC 
    dw UNUSED_Hitboxes_SpacePirate_B29FE8 

UNUSED_ExtendedSpritemaps_SpacePirate_B293C2:
    dw $0001,$0000,$0003 
    dw UNUSED_Spitemaps_SpacePirate_B2C9FC 
    dw UNUSED_Hitboxes_SpacePirate_B29FE8 

UNUSED_ExtendedSpritemaps_SpacePirate_B293CC:
    dw $0001,$0000,$0003 
    dw UNUSED_Spitemaps_SpacePirate_B2C9FC 
    dw UNUSED_Hitboxes_SpacePirate_B29FE8 

UNUSED_ExtendedSpritemaps_SpacePirate_B293D6:
    dw $0001,$0001,$0004 
    dw UNUSED_Spitemaps_SpacePirate_B2C9FC 
    dw UNUSED_Hitboxes_SpacePirate_B29FE8 

UNUSED_ExtendedSpritemaps_SpacePirate_B293E0:
    dw $0001,$0002,$0006 
    dw UNUSED_Spitemaps_SpacePirate_B2C9FC 
    dw UNUSED_Hitboxes_SpacePirate_B29FE8 
endif ; !FEATURE_KEEP_UNREFERENCED

ExtendedSpritemaps_PirateNinja_46:
    dw $0003,$FFFB,$FFF4 
    dw Spitemaps_PirateNinja_43 
    dw Hitboxes_PirateNinja_57 
    dw $0000,$0003 
    dw Spitemaps_PirateNinja_3F 
    dw Hitboxes_PirateNinja_53 
    dw $0000,$0003 
    dw Spitemaps_PirateNinja_3D 
    dw Hitboxes_PirateNinja_51 

ExtendedSpritemaps_PirateNinja_47:
    dw $0002,$0000,$0003 
    dw Spitemaps_PirateNinja_45 
    dw Hitboxes_PirateNinja_57 
    dw $0000,$0003 
    dw Spitemaps_PirateNinja_3D 
    dw Hitboxes_PirateNinja_51 

ExtendedSpritemaps_PirateNinja_48:
    dw $0003,$FFFB,$FFF5 
    dw Spitemaps_PirateNinja_44 
    dw Hitboxes_PirateNinja_57 
    dw $0000,$0003 
    dw Spitemaps_PirateNinja_3F 
    dw Hitboxes_PirateNinja_53 
    dw $0000,$0003 
    dw Spitemaps_PirateNinja_3D 
    dw Hitboxes_PirateNinja_51 

ExtendedSpritemaps_PirateNinja_49:
    dw $0003,$0005,$FFF4 
    dw Spitemaps_PirateNinja_43 
    dw Hitboxes_PirateNinja_57 
    dw $0000,$0003 
    dw Spitemaps_PirateNinja_40 
    dw Hitboxes_PirateNinja_54 
    dw $0000,$0003 
    dw Spitemaps_PirateNinja_41 
    dw Hitboxes_PirateNinja_55 

ExtendedSpritemaps_PirateNinja_4A:
    dw $0002,$0000,$0003 
    dw Spitemaps_PirateNinja_46 
    dw Hitboxes_PirateNinja_58 
    dw $0000,$0003 
    dw Spitemaps_PirateNinja_41 
    dw Hitboxes_PirateNinja_55 

ExtendedSpritemaps_PirateNinja_4B:
    dw $0003,$0005,$FFF5 
    dw Spitemaps_PirateNinja_44 
    dw Hitboxes_PirateNinja_57 
    dw $0000,$0003 
    dw Spitemaps_PirateNinja_40 
    dw Hitboxes_PirateNinja_54 
    dw $0000,$0003 
    dw Spitemaps_PirateNinja_41 
    dw Hitboxes_PirateNinja_55 

ExtendedSpritemaps_PirateNinja_4C:
    dw $0001,$0000,$0001 
    dw Spitemaps_PirateNinja_3C 
    dw Hitboxes_PirateNinja_50 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ExtendedSpritemaps_SpacePirate_B29480:
    dw $0001,$0000,$0000 
    dw UNUSED_Spitemaps_SpacePirate_B2E9F7 
    dw UNUSED_Hitboxes_SpacePirate_B2A802 

UNUSED_ExtendedSpritemaps_SpacePirate_B2948A:
    dw $0001,$0000,$0000 
    dw UNUSED_Spitemaps_SpacePirate_B2EA0D 
    dw UNUSED_Hitboxes_SpacePirate_B2A810 

UNUSED_ExtendedSpritemaps_SpacePirate_B29494:
    dw $0001,$0000,$0000 
    dw UNUSED_Spitemaps_SpacePirate_B2EA2D 
    dw UNUSED_Hitboxes_SpacePirate_B2A81E 

UNUSED_ExtendedSpritemaps_SpacePirate_B2949E:
    dw $0001,$0000,$0000 
    dw UNUSED_Spitemaps_SpacePirate_B2EA48 
    dw UNUSED_Hitboxes_SpacePirate_B2A82C 

UNUSED_ExtendedSpritemaps_SpacePirate_B294A8:
    dw $0001,$0000,$0000 
    dw UNUSED_Spitemaps_SpacePirate_B2EA6D 
    dw UNUSED_Hitboxes_SpacePirate_B2A83A 

UNUSED_ExtendedSpritemaps_SpacePirate_B294B2:
    dw $0001,$0000,$0000 
    dw UNUSED_Spitemaps_SpacePirate_B2EA83 
    dw UNUSED_Hitboxes_SpacePirate_B2A848 

UNUSED_ExtendedSpritemaps_SpacePirate_B294BC:
    dw $0001,$0000,$0000 
    dw UNUSED_Spitemaps_SpacePirate_B2EAA3 
    dw UNUSED_Hitboxes_SpacePirate_B2A856 

UNUSED_ExtendedSpritemaps_SpacePirate_B294C6:
    dw $0001,$0000,$0000 
    dw UNUSED_Spitemaps_SpacePirate_B2EABE 
    dw UNUSED_Hitboxes_SpacePirate_B2A864 

UNUSED_ExtendedSpritemaps_SpacePirate_B294D0:
    dw $0001,$0000,$0000 
    dw UNUSED_Spitemaps_SpacePirate_B2EBD4 
    dw UNUSED_Hitboxes_SpacePirate_B2A872 

UNUSED_ExtendedSpritemaps_SpacePirate_B294DA:
    dw $0001,$0000,$0000 
    dw UNUSED_Spitemaps_SpacePirate_B2EBEA 
    dw UNUSED_Hitboxes_SpacePirate_B2A880 

UNUSED_ExtendedSpritemaps_SpacePirate_B294E4:
    dw $0001,$0000,$0000 
    dw UNUSED_Spitemaps_SpacePirate_B2EC0A 
    dw UNUSED_Hitboxes_SpacePirate_B2A88E 

UNUSED_ExtendedSpritemaps_SpacePirate_B294EE:
    dw $0001,$0000,$0000 
    dw UNUSED_Spitemaps_SpacePirate_B2EC25 
    dw UNUSED_Hitboxes_SpacePirate_B2A89C 

UNUSED_ExtendedSpritemaps_SpacePirate_B294F8:
    dw $0001,$0000,$0000 
    dw UNUSED_Spitemaps_SpacePirate_B2EC4A 
    dw UNUSED_Hitboxes_SpacePirate_B2A8AA 

UNUSED_ExtendedSpritemaps_SpacePirate_B29502:
    dw $0001,$0000,$0000 
    dw UNUSED_Spitemaps_SpacePirate_B2EC60 
    dw UNUSED_Hitboxes_SpacePirate_B2A8B8 

UNUSED_ExtendedSpritemaps_SpacePirate_B2950C:
    dw $0001,$0000,$0000 
    dw UNUSED_Spitemaps_SpacePirate_B2EC80 
    dw UNUSED_Hitboxes_SpacePirate_B2A8C6 

UNUSED_ExtendedSpritemaps_SpacePirate_B29516:
    dw $0001,$0000,$0000 
    dw UNUSED_Spitemaps_SpacePirate_B2EC9B 
    dw UNUSED_Hitboxes_SpacePirate_B2A8D4 

UNUSED_ExtendedSpritemaps_SpacePirate_B29520:
    dw $0002,$FFFB,$0001 
    dw Spitemaps_PirateNinja_47 
    dw Hitboxes_PirateNinja_59 
    dw $0000,$FFFE 
    dw UNUSED_Spitemaps_SpacePirate_B2D948 
    dw UNUSED_Hitboxes_SpacePirate_B2A448 

UNUSED_ExtendedSpritemaps_SpacePirate_B29532:
    dw $0002,$FFFB,$0003 
    dw UNUSED_Spitemaps_SpacePirate_B2DB49 
    dw UNUSED_Hitboxes_SpacePirate_B2A4C6 
    dw $FFFF,$0000 
    dw UNUSED_Spitemaps_SpacePirate_B2D97C 
    dw UNUSED_Hitboxes_SpacePirate_B2A456 

UNUSED_ExtendedSpritemaps_SpacePirate_B29544:
    dw $0002,$FFFB,$0004 
    dw UNUSED_Spitemaps_SpacePirate_B2DB78 
    dw UNUSED_Hitboxes_SpacePirate_B2A4D4 
    dw $0000,$0000 
    dw UNUSED_Spitemaps_SpacePirate_B2D9BA 
    dw UNUSED_Hitboxes_SpacePirate_B2A464 

UNUSED_ExtendedSpritemaps_SpacePirate_B29556:
    dw $0002,$FFFB,$0002 
    dw UNUSED_Spitemaps_SpacePirate_B2DBA2 
    dw UNUSED_Hitboxes_SpacePirate_B2A4E2 
    dw $FFFF,$0000 
    dw UNUSED_Spitemaps_SpacePirate_B2D9F8 
    dw UNUSED_Hitboxes_SpacePirate_B2A472 

UNUSED_ExtendedSpritemaps_SpacePirate_B29568:
    dw $0002,$FFFB,$0001 
    dw UNUSED_Spitemaps_SpacePirate_B2DBA2 
    dw UNUSED_Hitboxes_SpacePirate_B2A4E2 
    dw $0002,$FFFE 
    dw UNUSED_Spitemaps_SpacePirate_B2DA31 
    dw UNUSED_Hitboxes_SpacePirate_B2A480 

UNUSED_ExtendedSpritemaps_SpacePirate_B2957A:
    dw $0002,$FFFB,$0003 
    dw UNUSED_Spitemaps_SpacePirate_B2DB78 
    dw UNUSED_Hitboxes_SpacePirate_B2A4D4 
    dw $0002,$0000 
    dw UNUSED_Spitemaps_SpacePirate_B2DA65 
    dw UNUSED_Hitboxes_SpacePirate_B2A48E 

UNUSED_ExtendedSpritemaps_SpacePirate_B2958C:
    dw $0002,$FFFB,$0003 
    dw UNUSED_Spitemaps_SpacePirate_B2DB49 
    dw UNUSED_Hitboxes_SpacePirate_B2A4C6 
    dw $0000,$0000 
    dw UNUSED_Spitemaps_SpacePirate_B2DAA3 
    dw UNUSED_Hitboxes_SpacePirate_B2A49C 

UNUSED_ExtendedSpritemaps_SpacePirate_B2959E:
    dw $0002,$FFFB,$0001 
    dw Spitemaps_PirateNinja_47 
    dw Hitboxes_PirateNinja_59 
    dw $0000,$0000 
    dw UNUSED_Spitemaps_SpacePirate_B2DAE1 
    dw UNUSED_Hitboxes_SpacePirate_B2A4AA 

UNUSED_ExtendedSpritemaps_SpacePirate_B295B0:
    dw $0002,$0005,$0001 
    dw Spitemaps_PirateNinja_4D 
    dw Hitboxes_PirateNinja_5F 
    dw $0000,$FFFE 
    dw UNUSED_Spitemaps_SpacePirate_B2E1A8 
    dw UNUSED_Hitboxes_SpacePirate_B2A62C 

UNUSED_ExtendedSpritemaps_SpacePirate_B295C2:
    dw $0002,$0005,$0003 
    dw UNUSED_Spitemaps_SpacePirate_B2E3A9 
    dw UNUSED_Hitboxes_SpacePirate_B2A6AA 
    dw $0000,$0000 
    dw UNUSED_Spitemaps_SpacePirate_B2E1DC 
    dw UNUSED_Hitboxes_SpacePirate_B2A63A 

UNUSED_ExtendedSpritemaps_SpacePirate_B295D4:
    dw $0002,$0005,$0004 
    dw UNUSED_Spitemaps_SpacePirate_B2E3D8 
    dw UNUSED_Hitboxes_SpacePirate_B2A6B8 
    dw $0000,$0000 
    dw UNUSED_Spitemaps_SpacePirate_B2E21A 
    dw UNUSED_Hitboxes_SpacePirate_B2A648 

UNUSED_ExtendedSpritemaps_SpacePirate_B295E6:
    dw $0002,$0005,$0002 
    dw UNUSED_Spitemaps_SpacePirate_B2E402 
    dw UNUSED_Hitboxes_SpacePirate_B2A6C6 
    dw $0000,$0000 
    dw UNUSED_Spitemaps_SpacePirate_B2E258 
    dw UNUSED_Hitboxes_SpacePirate_B2A656 

UNUSED_ExtendedSpritemaps_SpacePirate_B295F8:
    dw $0002,$0005,$0001 
    dw UNUSED_Spitemaps_SpacePirate_B2E402 
    dw UNUSED_Hitboxes_SpacePirate_B2A6C6 
    dw $FFFF,$FFFF 
    dw UNUSED_Spitemaps_SpacePirate_B2E291 
    dw UNUSED_Hitboxes_SpacePirate_B2A664 

UNUSED_ExtendedSpritemaps_SpacePirate_B2960A:
    dw $0002,$0005,$0003 
    dw UNUSED_Spitemaps_SpacePirate_B2E3D8 
    dw UNUSED_Hitboxes_SpacePirate_B2A6B8 
    dw $0000,$0000 
    dw UNUSED_Spitemaps_SpacePirate_B2E2C5 
    dw UNUSED_Hitboxes_SpacePirate_B2A672 

UNUSED_ExtendedSpritemaps_SpacePirate_B2961C:
    dw $0002,$0005,$0003 
    dw UNUSED_Spitemaps_SpacePirate_B2E3A9 
    dw UNUSED_Hitboxes_SpacePirate_B2A6AA 
    dw $0001,$0000 
    dw UNUSED_Spitemaps_SpacePirate_B2E303 
    dw UNUSED_Hitboxes_SpacePirate_B2A680 

UNUSED_ExtendedSpritemaps_SpacePirate_B2962E:
    dw $0002 
    dw $0005,$0001 
    dw Spitemaps_PirateNinja_4D 
    dw Hitboxes_PirateNinja_5F 
    dw $0001,$0000 
    dw UNUSED_Spitemaps_SpacePirate_B2E341 
    dw UNUSED_Hitboxes_SpacePirate_B2A68E 

UNUSED_ExtendedSpritemaps_SpacePirate_B29640:
    dw $0001 
    dw $0000,$0003 
    dw UNUSED_Spitemaps_SpacePirate_B2DC79 
    dw UNUSED_Hitboxes_SpacePirate_B2A528 

UNUSED_ExtendedSpritemaps_SpacePirate_B2964A:
    dw $0001,$0000,$0003 
    dw UNUSED_Spitemaps_SpacePirate_B2DCDF 
    dw UNUSED_Hitboxes_SpacePirate_B2A536 

UNUSED_ExtendedSpritemaps_SpacePirate_B29654:
    dw $0001,$0000,$0003 
    dw UNUSED_Spitemaps_SpacePirate_B2DD40 
    dw UNUSED_Hitboxes_SpacePirate_B2A544 

UNUSED_ExtendedSpritemaps_SpacePirate_B2965E:
    dw $0001,$0000,$0003 
    dw UNUSED_Spitemaps_SpacePirate_B2E4D9 
    dw UNUSED_Hitboxes_SpacePirate_B2A70C 

UNUSED_ExtendedSpritemaps_SpacePirate_B29668:
    dw $0001,$0000,$0003 
    dw UNUSED_Spitemaps_SpacePirate_B2E53F 
    dw UNUSED_Hitboxes_SpacePirate_B2A71A 

UNUSED_ExtendedSpritemaps_SpacePirate_B29672:
    dw $0001,$0000,$0003 
    dw UNUSED_Spitemaps_SpacePirate_B2E5A0 
    dw UNUSED_Hitboxes_SpacePirate_B2A728 

UNUSED_ExtendedSpritemaps_SpacePirate_B2967C:
    dw $0001,$0000,$0008 
    dw UNUSED_Spitemaps_SpacePirate_B2E03D 
    dw UNUSED_Hitboxes_SpacePirate_B2A5D0 

UNUSED_ExtendedSpritemaps_SpacePirate_B29686:
    dw $0001,$0000,$0008 
    dw UNUSED_Spitemaps_SpacePirate_B2E88C 
    dw UNUSED_Hitboxes_SpacePirate_B2A7A6 
endif ; !FEATURE_KEEP_UNREFERENCED

Hitboxes_PirateWall_0:
    dw $0001,$FFEE,$FFED,$0006,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateWall_1:
    dw $0001,$FFEE,$FFED,$0006,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateWall_2:
    dw $0001,$FFEE,$FFED,$0006,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateWall_3:
    dw $0001,$FFEE,$FFED,$0006,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateWall_4:
    dw $0001,$FFEE,$FFED,$0006,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateWall_5:
    dw $0001,$FFF2,$0000,$0004,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateWall_6:
    dw $0001,$FFF1,$0000,$FFFF,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateWall_7:
    dw $0001,$FFF1,$FFFA,$0000,$0017 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateWall_8:
    dw $0001,$FFF0,$FFFB,$FFFF,$0019 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateWall_9:
    dw $0001,$FFEF,$FFF8,$0000,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateWalking_0:
    dw $0001,$FFF3,$FFED,$000A,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateWall_A:
    dw $0001,$FFF1,$FFED,$000E,$0006 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateWall_B:
    dw $0001,$FFF0,$FFED,$000E,$0003 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateWall_C:
    dw $0001,$FFF6,$FFEB,$0013,$0016 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateWall_D:
    dw $0001,$FFF8,$FFED,$0012,$0010 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateWall_E:
    dw $0001,$FFF7,$FFE9,$0011,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateWall_F:
    dw $0001,$FFF7,$FFED,$0010,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateWall_10:
    dw $0001,$FFF7,$FFED,$0011,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateWall_11:
    dw $0001,$FFF7,$FFED,$0010,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateWall_12:
    dw $0001,$FFF7,$FFED,$0011,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateWall_13:
    dw $0001,$FFF9,$0000,$000F,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateWall_14:
    dw $0001,$FFFE,$0000,$000F,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateWall_15:
    dw $0001,$FFFE,$0000,$000F,$0017 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateWall_16:
    dw $0001,$0000,$0000,$000F,$0019 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateWall_17:
    dw $0001,$FFFF,$0000,$000F,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateWall_18:
    dw $0001,$FFF1,$FFED,$000F,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateWall_19:
    dw $0001,$FFF1,$FFED,$000E,$0003 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateWall_1A:
    dw $0001,$FFEC,$FFED,$000A,$0019 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateWall_1B:
    dw $0001,$FFEC,$FFED,$0006,$0010 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateWalking_1:
    dw $0001,$FFF5,$0000,$0008,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateWalking_2:
    dw $0001,$FFF5,$0000,$0008,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateWalking_3:
    dw $0001,$FFF9,$0000,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateWalking_4:
    dw $0001,$FFF9,$0000,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateWalking_5:
    dw $0001,$FFF9,$0000,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateWalking_6:
    dw $0001,$FFF9,$0000,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateWalking_7:
    dw $0001,$FFF9,$0000,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateWalking_8:
    dw $0001,$FFF9,$0000,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateWalking_9_Ninja_0:
    dw $0001,$FFF9,$0000,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible 

Hitboxes_PirateWalking_A_Ninja_1:
    dw $0001,$FFF9,$0000,$0006,$0010 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateWalking_A_Ninja_2:
    dw $0001,$FFF9,$FFF7,$0006,$0006 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateWalking_B_Ninja_3:
    dw $0001,$FFF9,$FFF7,$0006,$0006 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateWalking_C_Ninja_4:
    dw $0001,$FFF9,$FFF7,$0006,$0006 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateWalking_D_Ninja_5:
    dw $0001,$FFF9,$FFF7,$0006,$0006 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateWalking_E_Ninja_6:
    dw $0001,$FFF9,$FFF7,$0006,$0006 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateWalking_F_Ninja_7:
    dw $0001,$FFF9,$FFF7,$0006,$0006 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateWalking_10_Ninja_8:
    dw $0001,$FFF9,$FFF7,$0006,$0006 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateWalking_11_Ninja_9:
    dw $0001,$FFF9,$FFF7,$0006,$0006 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateWalking_12_Ninja_A:
    dw $0001,$FFF9,$0000,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible 

Hitboxes_PirateWalking_13:
    dw $0001,$FFF9,$FFED,$0006,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateWalking_14:
    dw $0001,$FFF9,$FFED,$0006,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateWalking_15:
    dw $0001,$FFF9,$0000,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateWalking_16:
    dw $0001,$FFF9,$0000,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateWalking_17:
    dw $0001,$FFF9,$0000,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateWalking_18:
    dw $0001,$FFF9,$0000,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateWalking_19:
    dw $0001,$FFF9,$FFFF,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateWalking_1A:
    dw $0001,$FFF9,$0000,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateWalking_1B:
    dw $0001,$FFF9,$0000,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateWalking_1C:
    dw $0001,$FFF9,$0000,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateWalking_1D_Ninja_A:
    dw $0001,$FFF9,$0000,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible 

Hitboxes_PirateWalking_1E_Ninja_B:
    dw $0001,$FFF9,$FFF7,$0006,$0006 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateWalking_1F_Ninja_C:
    dw $0001,$FFF9,$FFF7,$0006,$0006 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateWalking_20_Ninja_D:
    dw $0001,$FFF9,$FFF7,$0006,$0006 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateWalking_21_Ninja_E:
    dw $0001,$FFF9,$FFF7,$0006,$0006 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateWalking_22_Ninja_F:
    dw $0001,$FFF9,$FFF7,$0006,$0006 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateWalking_23_Ninja_10:
    dw $0001,$FFF9,$FFF7,$0006,$0006 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateWalking_24_Ninja_11:
    dw $0001,$FFF9,$FFF7,$0006,$0006 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateWalking_25_Ninja_12:
    dw $0001,$FFF9,$FFF7,$0006,$0006 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateWalking_26_Ninja_13:
    dw $0001,$FFF9,$0000,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible 

Hitboxes_PirateWalking_27:
    dw $0001,$FFF9,$FFED,$0006,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateWalking_28:
    dw $0001,$FFF9,$FFED,$0006,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateWalking_29:
    dw $0001,$FFF9,$FFED,$0006,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateWalking_2A:
    dw $0001,$FFF9,$FFED,$0006,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateWalking_2B:
    dw $0001,$FFF9,$FFED,$0006,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateWalking_2C:
    dw $0001,$FFF9,$FFED,$0006,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateWalking_2D:
    dw $0001,$FFF9,$FFED,$0006,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateWalking_2E:
    dw $0001,$FFF9,$FFED,$0006,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateWalking_2F:
    dw $0001,$FFF9,$FFED,$0006,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateWalking_30:
    dw $0001,$FFF9,$FFED,$0006,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateWalking_31:
    dw $0001,$FFF9,$FFED,$0006,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateWalking_32:
    dw $0001,$FFF9,$FFED,$0006,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateNinja_14:
    dw $0001,$FFF9,$0000,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateNinja_15:
    dw $0001,$FFF9,$0000,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateNinja_16:
    dw $0001,$FFF9,$0000,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateNinja_17:
    dw $0001,$FFF9,$0000,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateNinja_18:
    dw $0001,$FFF9,$0000,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateNinja_19:
    dw $0001,$FFF9,$0000,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateNinja_1A:
    dw $0001,$FFF9,$0000,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateNinja_1B:
    dw $0001,$FFF9,$0000,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateWalking_33_Ninja_1C:
    dw $0001,$FFF9,$FFED,$0006,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_GoldNinjaIsVulnerable 

Hitboxes_PirateWalking_34_Ninja_1D:
    dw $0001,$FFF9,$FFED,$0006,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible 

Hitboxes_PirateWalking_35_Ninja_1E:
    dw $0001,$FFF9,$FFED,$0006,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateWalking_36_Ninja_1F:
    dw $0001,$FFF9,$FFED,$0006,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateWalking_37_Ninja_20:
    dw $0001,$FFF9,$FFED,$0006,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible 

Hitboxes_PirateNinja_21:
    dw $0001,$FFF9,$FFED,$0006,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible 

Hitboxes_PirateNinja_22:
    dw $0001,$FFF9,$FFED,$0006,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible 

Hitboxes_PirateNinja_23:
    dw $0001,$FFF9,$FFED,$0006,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible 

Hitboxes_PirateNinja_24:
    dw $0001,$FFF9,$FFED,$0006,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible 

Hitboxes_PirateNinja_25:
    dw $0001,$FFF9,$FFED,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible 

Hitboxes_PirateNinja_26:
    dw $0001,$FFF9,$FFED,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible 

Hitboxes_PirateNinja_27:
    dw $0001,$FFF9,$FFED,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Hitboxes_SpacePirate_B29C08:
    dw $0001,$FFF9,$FFED,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B29C16:
    dw $0001,$FFF1,$FFED,$000B,$0019 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B29C24:
    dw $0001,$FFEE,$FFED,$0008,$0018 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B29C32:
    dw $0001,$FFF1,$FFED,$000B,$0010 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B29C40:
    dw $0001,$FFF0,$FFED,$000C,$0010 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B29C4E:
    dw $0001,$FFF0,$FFED,$000B,$0010 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 
endif ; !FEATURE_KEEP_UNREFERENCED

Hitboxes_PirateNinja_28:
    dw $0001,$FFF9,$FFED,$0006,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Hitboxes_SpacePirate_B29C6A:
    dw $0001,$FFF9,$FFF7,$0006,$0006 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 
endif ; !FEATURE_KEEP_UNREFERENCED

Hitboxes_PirateWalking_38:
    dw $0002,$FFF9,$FFED,$0006,$0017 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 
    dw $FFEE,$FFEE,$FFF9,$0002 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_GoldNinjaIsVulnerable 

Hitboxes_PirateNinja_29:
    dw $0002,$FFF9,$FFED,$0006,$0017 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible 
    dw $FFEE,$FFEE,$FFF9,$0002 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Hitboxes_SpacePirate_B29CAC:
    dw $0001,$FFF9,$FFED,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B29CBA:
    dw $0002,$FFF9,$FFED,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 
    dw $FFDE,$FFFB,$0003,$0003 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B29CD4:
    dw $0002,$FFF9,$FFED,$0006,$0010 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 
    dw $FFE0,$FFFA,$FFFE,$0004 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 
endif ; !FEATURE_KEEP_UNREFERENCED

Hitboxes_PirateNinja_2A:
    dw $0001,$FFF9,$0000,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateNinja_2B:
    dw $0001,$FFF9,$0000,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateNinja_2C:
    dw $0001,$FFF9,$0000,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateNinja_2D:
    dw $0001,$FFF9,$0000,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateNinja_2E:
    dw $0001,$FFF9,$0000,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateNinja_2F:
    dw $0001,$FFF9,$0000,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateNinja_30:
    dw $0001,$FFF9,$0000,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateNinja_31:
    dw $0001,$FFF9,$0000,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateWalking_39_Ninja_32:
    dw $0001,$FFF9,$FFED,$0006,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_GoldNinjaIsVulnerable 

Hitboxes_PirateNinja_33:
    dw $0001,$FFF9,$FFED,$0006,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible 

Hitboxes_PirateWalking_3A_Ninja_34:
    dw $0001,$FFF9,$FFED,$0006,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_GoldNinjaIsVulnerable 

Hitboxes_PirateWalking_3B_Ninja_35:
    dw $0001,$FFF9,$FFED,$0006,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_GoldNinjaIsVulnerable 

Hitboxes_PirateWalking_3C_Ninja_36:
    dw $0001,$FFF9,$FFED,$0006,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_GoldNinjaIsVulnerable 

Hitboxes_PirateNinja_37:
    dw $0001,$FFF9,$FFED,$0006,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible 

Hitboxes_PirateNinja_38:
    dw $0001,$FFF9,$FFED,$0006,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible 

Hitboxes_PirateNinja_39:
    dw $0001,$FFF9,$FFED,$0006,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible 

Hitboxes_PirateNinja_3A:
    dw $0001,$FFF9,$FFED,$0006,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible 

Hitboxes_PirateNinja_3B:
    dw $0001,$FFF9,$FFED,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible 

Hitboxes_PirateNinja_3C:
    dw $0001,$FFF9,$FFED,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible 

Hitboxes_PirateNinja_3D:
    dw $0001,$FFF9,$FFED,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Hitboxes_SpacePirate_B29E06:
    dw $0001,$FFF9,$FFED,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B29E14:
    dw $0001,$FFF9,$FFED,$0006,$0010 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B29E22:
    dw $0001,$FFF7,$FFED,$0010,$0014 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B29E30:
    dw $0001,$FFF5,$FFED,$000E,$0010 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B29E3E:
    dw $0001,$FFF5,$FFED,$000F,$0010 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B29E4C:
    dw $0001,$FFF5,$FFED,$000E,$0010 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 
endif ; !FEATURE_KEEP_UNREFERENCED

Hitboxes_PirateNinja_3E:
    dw $0001,$FFF9,$FFED,$0006,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible 

Hitboxes_PirateWalking_3D:
    dw $0002,$FFF9,$FFED,$0006,$0017 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 
    dw $0006,$FFED,$0011,$0001 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_GoldNinjaIsVulnerable 

Hitboxes_PirateNinja_3F:
    dw $0002,$FFF9,$FFED,$0006,$0017 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible 
    dw $0006,$FFED,$0011,$0001 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Hitboxes_SpacePirate_B29E9C:
    dw $0001,$FFF9,$FFED,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B29EAA:
    dw $0002,$FFF9,$FFED,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 
    dw $0006,$FFFB,$0020,$0004 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B29EC4:
    dw $0002,$FFF9,$FFED,$0006,$0010 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 
    dw $0006,$FFFA,$001F,$0004 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 
endif ; !FEATURE_KEEP_UNREFERENCED

Hitboxes_PirateNinja_40:
    dw $0001,$FFF5,$FFF3,$000A,$000A 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible 

Hitboxes_PirateNinja_41:
    dw $0001,$FFF5,$FFF3,$000A,$000A 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible 

Hitboxes_PirateNinja_42:
    dw $0001,$FFF5,$FFF3,$000A,$000A 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible 

Hitboxes_PirateNinja_43:
    dw $0001,$FFF5,$FFF3,$000A,$000A 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible 

Hitboxes_PirateNinja_44:
    dw $0001,$FFF5,$FFF3,$000A,$000A 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible 

Hitboxes_PirateNinja_45:
    dw $0001,$FFF5,$FFF3,$000A,$000A 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible 

Hitboxes_PirateNinja_46:
    dw $0001,$FFF5,$FFF3,$000A,$000A 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible 

Hitboxes_PirateNinja_47:
    dw $0001,$FFF5,$FFF3,$000A,$000A 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Hitboxes_SpacePirate_B29F4E:
    dw $0001,$FFF3,$FFEC,$000C,$0006 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B29F5C:
    dw $0001,$FFF1,$FFEC,$000D,$0006 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B29F6A:
    dw $0001,$FFF8,$FFEA,$000C,$0019 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 
endif ; !FEATURE_KEEP_UNREFERENCED

Hitboxes_PirateNinja_48:
    dw $0001,$FFF5,$FFF3,$000A,$000A 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible 

Hitboxes_PirateNinja_49:
    dw $0001,$FFF5,$FFF3,$000A,$000A 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible 

Hitboxes_PirateNinja_4A:
    dw $0001,$FFF5,$FFF3,$000A,$000A 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible 

Hitboxes_PirateNinja_4B:
    dw $0001,$FFF5,$FFF3,$000A,$000A 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible 

Hitboxes_PirateNinja_4C:
    dw $0001,$FFF5,$FFF3,$000A,$000A 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible 

Hitboxes_PirateNinja_4D:
    dw $0001,$FFF5,$FFF3,$000A,$000A 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible 

Hitboxes_PirateNinja_4E:
    dw $0001,$FFF5,$FFF3,$000A,$000A 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible 

Hitboxes_PirateNinja_4F:
    dw $0001,$FFF5,$FFF3,$000A,$000A 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Hitboxes_SpacePirate_B29FE8:
    dw $0001,$FFF9,$FFED,$0006,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B29FF6:
    dw $0001,$FFF9,$FFED,$0006,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A004:
    dw $0001,$FFF9,$FFED,$0006,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A012:
    dw $0001,$FFF9,$FFED,$0006,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A020:
    dw $0001,$FFF9,$FFED,$0006,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A02E:
    dw $0001,$FFF9,$0000,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A0C3:
    dw $0001,$FFF9,$0000,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A04A:
    dw $0001,$FFF9,$0000,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A058:
    dw $0001,$FFF9,$0000,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A066:
    dw $0001,$FFF9,$0000,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 
endif ; !FEATURE_KEEP_UNREFERENCED

Hitboxes_PirateNinja_50:
    dw $0001,$FFF9,$FFED,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Hitboxes_SpacePirate_B2A082:
    dw $0001,$FFF9,$FFED,$0006,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A090:
    dw $0001,$FFF9,$FFED,$0006,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A09E:
    dw $0001,$FFF9,$FFED,$0006,$0010 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A0AC:
    dw $0001,$FFF9,$FFED,$0006,$0010 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A0BA:
    dw $0001,$FFF9,$FFED,$0006,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A0C8:
    dw $0001,$FFF9,$FFED,$0006,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A0D6:
    dw $0001,$FFF9,$FFED,$0006,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A0E4:
    dw $0001,$FFF9,$FFED,$0006,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A0F2:
    dw $0001,$FFF9,$FFED,$0006,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A100:
    dw $0001,$FFF9,$0000,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A10E:
    dw $0001,$FFF9,$0000,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A11C:
    dw $0001,$FFF9,$0000,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A12A:
    dw $0001,$FFF9,$0000,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A138:
    dw $0001,$FFF9,$0000,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A146:
    dw $0001,$FFF9,$FFED,$0006,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A154:
    dw $0001,$FFF9,$FFED,$0006,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A162:
    dw $0001,$FFF9,$FFED,$0006,$0010 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A170:
    dw $0001,$FFF9,$FFED,$0006,$0010 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A17E:
    dw $0001,$FFF9,$FFFF,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A18C:
    dw $0001,$FFF9,$0000,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A19A:
    dw $0001,$FFF9,$0000,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A1A8:
    dw $0001,$FFF9,$0000,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A1B6:
    dw $0001,$FFF9,$0000,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A1C4:
    dw $0001,$FFF9,$0000,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A1D2:
    dw $0001,$FFF9,$0000,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A1E0:
    dw $0001,$FFF9,$0000,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 
endif ; !FEATURE_KEEP_UNREFERENCED

Hitboxes_PirateNinja_51:
    dw $0001,$FFF9,$0000,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Hitboxes_SpacePirate_B2A1FC:
    dw $0001,$FFF9,$0000,$0006,$0010 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A20A:
    dw $0001,$FFF9,$FFF7,$0006,$0006 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A218:
    dw $0001,$FFF9,$FFF7,$0006,$0006 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A226:
    dw $0001,$FFF9,$FFF7,$0006,$0006 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A234:
    dw $0001,$FFF9,$FFF7,$0006,$0006 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A242:
    dw $0001,$FFF9,$FFF7,$0006,$0006 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A250:
    dw $0001,$FFF9,$FFF7,$0006,$0006 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A25E:
    dw $0001,$FFF9,$FFF7,$0006,$0006 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A26C:
    dw $0001,$FFF9,$FFF7,$0006,$0006 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 
endif ; !FEATURE_KEEP_UNREFERENCED

Hitboxes_PirateNinja_52:
    dw $0001,$FFF9,$0000,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateNinja_53:
    dw $0001,$FFF9,$FFED,$0006,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible 

Hitboxes_PirateNinja_54:
    dw $0001,$FFF9,$FFED,$0006,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Hitboxes_SpacePirate_B2A2A4:
    dw $0001,$FFF9,$0000,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A2B2:
    dw $0001,$FFF9,$0000,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A2C0:
    dw $0001,$FFF9,$0000,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A2CE:
    dw $0001,$FFF9,$0000,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A2DC:
    dw $0001,$FFF9,$FFFF,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A2EA:
    dw $0001,$FFF9,$0000,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A2F8:
    dw $0001,$FFF9,$0000,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A306:
    dw $0001,$FFF9,$0000,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 
endif ; !FEATURE_KEEP_UNREFERENCED

Hitboxes_PirateNinja_55:
    dw $0001,$FFF9,$0000,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Hitboxes_SpacePirate_B2A322:
    dw $0001,$FFF9,$FFF7,$0006,$0006 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A330:
    dw $0001,$FFF9,$FFF7,$0006,$0006 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A33E:
    dw $0001,$FFF9,$FFF7,$0006,$0006 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A34C:
    dw $0001,$FFF9,$FFF7,$0006,$0006 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A35A:
    dw $0001,$FFF9,$FFF7,$0006,$0006 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A368:
    dw $0001,$FFF9,$FFF7,$0006,$0006 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A376:
    dw $0001,$FFF9,$FFF7,$0006,$0006 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A384:
    dw $0001,$FFF9,$FFF7,$0006,$0006 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 
endif ; !FEATURE_KEEP_UNREFERENCED

Hitboxes_PirateNinja_56:
    dw $0001,$FFF9,$0000,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateNinja_57:
    dw $0001,$FFF9,$FFED,$0006,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Hitboxes_SpacePirate_B2A3AE:
    dw $0001,$FFF9,$FFED,$0006,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A3BC:
    dw $0001,$FFF9,$FFED,$0006,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A3CA:
    dw $0001,$FFF9,$FFED,$0006,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A3D8:
    dw $0001,$FFF9,$FFED,$0006,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A3E6:
    dw $0001,$FFF9,$FFED,$0006,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 
endif ; !FEATURE_KEEP_UNREFERENCED

Hitboxes_PirateNinja_58:
    dw $0001,$FFF9,$FFED,$0006,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Hitboxes_SpacePirate_B2A402:
    dw $0001,$FFF9,$FFED,$0006,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A410:
    dw $0001,$FFF9,$FFED,$0006,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A41E:
    dw $0001,$FFF9,$FFED,$0006,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A42C:
    dw $0001,$FFF9,$FFED,$0006,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A43A:
    dw $0001,$FFF9,$FFED,$0006,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A448:
    dw $0001,$FFF9,$0000,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A456:
    dw $0001,$FFF9,$0000,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A464:
    dw $0001,$FFF9,$0000,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A472:
    dw $0001,$FFF9,$0000,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A480:
    dw $0001,$FFF9,$0000,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A48E:
    dw $0001,$FFF9,$0000,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A49C:
    dw $0001,$FFF9,$0000,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A4AA:
    dw $0001,$FFF9,$0000,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 
endif ; !FEATURE_KEEP_UNREFERENCED

Hitboxes_PirateNinja_59:
    dw $0001,$FFF9,$FFED,$0006,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Hitboxes_SpacePirate_B2A4C6:
    dw $0001,$FFF9,$FFED,$0006,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A4D4:
    dw $0001,$FFF9,$FFED,$0006,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A4E2:
    dw $0001,$FFF9,$FFED,$0006,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A4F0:
    dw $0001,$FFF9,$FFED,$0006,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A4FE:
    dw $0001,$FFF9,$FFED,$0006,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A50C:
    dw $0001,$FFF9,$FFED,$0006,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A51A:
    dw $0001,$FFF9,$FFED,$0006,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A528:
    dw $0001,$FFF9,$FFED,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A536:
    dw $0001,$FFF9,$FFED,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A544:
    dw $0001,$FFF9,$FFED,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A552:
    dw $0001,$FFF9,$FFED,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 
endif ; !FEATURE_KEEP_UNREFERENCED

Hitboxes_PirateNinja_5A:
    dw $0001,$FFF9,$FFED,$0006,$0010 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateNinja_5B:
    dw $0001,$FFF9,$FFED,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Hitboxes_SpacePirate_B2A57C:
    dw $0001,$FFF9,$FFED,$0006,$0010 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A58A:
    dw $0001,$FFF9,$FFED,$0006,$0010 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A598:
    dw $0001,$FFF9,$FFED,$0006,$0010 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A5A6:
    dw $0001,$FFF9,$FFED,$0006,$0010 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A5B4:
    dw $0001,$FFF9,$FFED,$0006,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A5C2:
    dw $0001,$FFF9,$FFF7,$0006,$0006 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A5D0:
    dw $0002,$FFF9,$FFED,$0006,$0017 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 
    dw $FFEE,$FFEE,$FFF9,$0002 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 
endif ; !FEATURE_KEEP_UNREFERENCED

Hitboxes_PirateNinja_5C:
    dw $0001,$FFF9,$FFED,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible 

Hitboxes_PirateNinja_5D:
    dw $0002,$FFF9,$FFED,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible 
    dw $FFDE,$FFFB,$0003,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible 

Hitboxes_PirateNinja_5E:
    dw $0002,$FFF9,$FFED,$0006,$0010 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 
    dw $FFDF,$0003,$FFF9,$0010 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Hitboxes_SpacePirate_B2A62C:
    dw $0001,$FFF9,$0000,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A63A:
    dw $0001,$FFF9,$0000,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A648:
    dw $0001,$FFF9,$0000,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A656:
    dw $0001,$FFF9,$0000,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A664:
    dw $0001,$FFF9,$0000,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A672:
    dw $0001,$FFF9,$0000,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A680:
    dw $0001,$FFF9,$0000,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A68E:
    dw $0001,$FFF9,$0000,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 
endif ; !FEATURE_KEEP_UNREFERENCED

Hitboxes_PirateNinja_5F:
    dw $0001,$FFF9,$FFED,$0006,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Hitboxes_SpacePirate_B2A6AA:
    dw $0001,$FFF9,$FFED,$0006,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A6B8:
    dw $0001,$FFF9,$FFED,$0006,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A6C6:
    dw $0001,$FFF9,$FFED,$0006,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A6D4:
    dw $0001,$FFF9,$FFED,$0006,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A6E2:
    dw $0001,$FFF9,$FFED,$0006,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A6F0:
    dw $0001,$FFF9,$FFED,$0006,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A6FE:
    dw $0001,$FFF9,$FFED,$0006,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A70C:
    dw $0001,$FFF9,$FFED,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A71A:
    dw $0001,$FFF9,$FFED,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A728:
    dw $0001,$FFF9,$FFED,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A736:
    dw $0001,$FFF9,$FFED,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 
endif ; !FEATURE_KEEP_UNREFERENCED

Hitboxes_PirateNinja_60:
    dw $0001,$FFF9,$FFED,$0006,$0010 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

Hitboxes_PirateNinja_61:
    dw $0001,$FFF9,$FFED,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Hitboxes_SpacePirate_B2A760:
    dw $0001,$FFF9,$FFED,$0006,$0010 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A76E:
    dw $0001,$FFF9,$FFED,$0006,$0010 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A77C:
    dw $0001,$FFF9,$FFED,$0006,$0010 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A78A:
    dw $0001,$FFF9,$FFED,$0006,$0010 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A798:
    dw $0001,$FFF9,$FFED,$0006,$0000 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A7A6:
    dw $0002,$FFF9,$FFED,$0006,$0017 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 
    dw $0006,$FFED,$0011,$0001 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 
endif ; !FEATURE_KEEP_UNREFERENCED

Hitboxes_PirateNinja_62:
    dw $0001,$FFF9,$FFED,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible 

Hitboxes_PirateNinja_63:
    dw $0002,$FFF9,$FFED,$0006,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible 
    dw $0006,$FFFA,$0020,$001E 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible 

Hitboxes_PirateNinja_64:
    dw $0002,$FFF9,$FFED,$0006,$0010 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 
    dw $0006,$0003,$001F,$0010 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Hitboxes_SpacePirate_B2A802:
    dw $0001,$FFF5,$FFF3,$000A,$000A 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A810:
    dw $0001,$FFF5,$FFF3,$000A,$000A 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A81E:
    dw $0001,$FFF5,$FFF3,$000A,$000A 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A82C:
    dw $0001,$FFF5,$FFF3,$000A,$000A 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A83A:
    dw $0001,$FFF5,$FFF3,$000A,$000A 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A848:
    dw $0001,$FFF5,$FFF3,$000A,$000A 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A856:
    dw $0001,$FFF5,$FFF3,$000A,$000A 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A864:
    dw $0001,$FFF5,$FFF3,$000A,$000A 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A872:
    dw $0001,$FFF5,$FFF3,$000A,$000A 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A880:
    dw $0001,$FFF5,$FFF3,$000A,$000A 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A88E:
    dw $0001,$FFF5,$FFF3,$000A,$000A 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A89C:
    dw $0001,$FFF5,$FFF3,$000A,$000A 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A8AA:
    dw $0001,$FFF5,$FFF3,$000A,$000A 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A8B8:
    dw $0001,$FFF5,$FFF3,$000A,$000A 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A8C6:
    dw $0001,$FFF5,$FFF3,$000A,$000A 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 

UNUSED_Hitboxes_SpacePirate_B2A8D4:
    dw $0001,$FFF5,$FFF3,$000A,$000A 
    dw EnemyTouch_SpacePirate 
    dw EnemyShot_SpacePirate_Normal 
endif ; !FEATURE_KEEP_UNREFERENCED

Spitemaps_PirateWall_0:
    dw $0008,$01EF 
    db $FD 
    dw $214D,$01EF 
    db $F5 
    dw $213D,$01EF 
    db $ED 
    dw $212D,$81F4 
    db $F3 
    dw $2100,$81F8 
    db $F0 
    dw $212E,$81F1 
    db $EA 
    dw $210E,$01EF 
    db $E6 
    dw $213D,$01EF 
    db $DE 
    dw $212D 

Spitemaps_PirateWall_1:
    dw $0009,$01FC 
    db $F3 
    dw $214F,$01F4 
    db $F4 
    dw $214E,$01EF 
    db $F9 
    dw $214D,$01EF 
    db $F1 
    dw $213D,$01EF 
    db $E9 
    dw $212D,$81F8 
    db $F0 
    dw $212E,$81F1 
    db $EA 
    dw $210E,$01EF 
    db $EA 
    dw $213D,$01EF 
    db $E2 
    dw $212D 

Spitemaps_PirateWall_2:
    dw $0008,$01EF 
    db $F3 
    dw $214D,$01EF 
    db $EB 
    dw $213D,$01EF 
    db $E3 
    dw $212D,$01FB 
    db $F3 
    dw $214F,$01F3 
    db $F3 
    dw $214E,$81F8 
    db $F0 
    dw $212E,$81F1 
    db $EA 
    dw $210E,$01EF 
    db $E1 
    dw $212D 

Spitemaps_PirateWall_3:
    dw $000A,$01FB 
    db $F1 
    dw $214F,$01F3 
    db $F0 
    dw $214E,$01EF 
    db $ED 
    dw $214D,$01EF 
    db $E5 
    dw $213D,$01EF 
    db $DD 
    dw $212D,$81F8 
    db $F0 
    dw $212E,$81F1 
    db $EA 
    dw $210E,$01EF 
    db $EF 
    dw $213D,$01EF 
    db $F7 
    dw $214D,$81F1 
    db $F0 
    dw $2100 

Spitemaps_PirateWall_4:
    dw $0009,$81F4 
    db $EB 
    dw $E105,$01EF 
    db $EB 
    dw $214D,$01EF 
    db $E3 
    dw $213D,$01EF 
    db $DB 
    dw $212D,$81F8 
    db $F0 
    dw $212E,$81F1 
    db $EA 
    dw $210E,$01EF 
    db $F1 
    dw $213D,$01EF 
    db $F9 
    dw $214D,$81F1 
    db $F2 
    dw $2100 

Spitemaps_PirateWall_5:
    dw $000A,$01F4 
    db $19 
    dw $2146,$01F7 
    db $13 
    dw $2119,$01F7 
    db $0B 
    dw $2109,$81F9 
    db $FE 
    dw $2107,$01EC 
    db $19 
    dw $2145,$01F5 
    db $FE 
    dw $2131,$01F5 
    db $F6 
    dw $2121,$81F6 
    db $F5 
    dw $E10C,$01F4 
    db $05 
    dw $2146,$01EC 
    db $05 
    dw $2145 

Spitemaps_PirateWall_6:
    dw $000C,$0000 
    db $FD 
    dw $2149,$01F8 
    db $FF 
    dw $2148,$01F4 
    db $14 
    dw $2146,$01EC 
    db $14 
    dw $2145,$0000 
    db $FB 
    dw $2149,$01F8 
    db $F9 
    dw $2148,$01F5 
    db $0D 
    dw $211A,$01F5 
    db $05 
    dw $210A,$01F5 
    db $02 
    dw $2131,$01F5 
    db $FA 
    dw $2121,$01F4 
    db $09 
    dw $2146,$01EC 
    db $09 
    dw $2145 

Spitemaps_PirateWall_7:
    dw $000C,$0000 
    db $F9 
    dw $2149,$01F8 
    db $FB 
    dw $2148,$01F4 
    db $10 
    dw $2146,$01EC 
    db $10 
    dw $2145,$0000 
    db $FB 
    dw $2149,$01F8 
    db $F9 
    dw $2148,$01F5 
    db $09 
    dw $211A,$01F5 
    db $01 
    dw $210A,$01F5 
    db $06 
    dw $2131,$01F5 
    db $FE 
    dw $2121,$01F4 
    db $0D 
    dw $2146,$01EC 
    db $0D 
    dw $2145 

Spitemaps_PirateWall_8:
    dw $000C,$01F3 
    db $03 
    dw $2131,$01F3 
    db $FB 
    dw $2121,$01F4 
    db $0A 
    dw $2146,$01EC 
    db $0A 
    dw $2145,$0000 
    db $FC 
    dw $2149,$01F8 
    db $FA 
    dw $2148,$0000 
    db $FE 
    dw $2149,$01F8 
    db $00 
    dw $2148,$01F4 
    db $12 
    dw $2146,$01EC 
    db $12 
    dw $2145,$01F5 
    db $0C 
    dw $211A,$01F5 
    db $04 
    dw $210A 

Spitemaps_PirateWall_9:
    dw $000A,$01F5 
    db $00 
    dw $2131,$01F5 
    db $F8 
    dw $2121,$81F7 
    db $F6 
    dw $E10C,$01F4 
    db $07 
    dw $2146,$01EC 
    db $07 
    dw $2145,$01F4 
    db $16 
    dw $2146,$01F6 
    db $10 
    dw $2119,$01F6 
    db $08 
    dw $2109,$81F8 
    db $FD 
    dw $2107,$01EC 
    db $16 
    dw $2145 

Spritemaps_PirateWalking_0:
    dw $0014,$0007 
    db $FE 
    dw $615D,$0007 
    db $F6 
    dw $615C,$0007 
    db $EE 
    dw $615B,$01FF 
    db $14 
    dw $615A,$01FF 
    db $FE 
    dw $6157,$01FF 
    db $0C 
    dw $6159,$01FF 
    db $06 
    dw $6158,$01FF 
    db $F8 
    dw $6156,$01FF 
    db $F0 
    dw $6155,$01FF 
    db $E8 
    dw $6154,$01F0 
    db $00 
    dw $215D,$01F0 
    db $F8 
    dw $215C,$01F0 
    db $F0 
    dw $215B,$01F8 
    db $18 
    dw $215A,$01F8 
    db $00 
    dw $2157,$01F8 
    db $10 
    dw $2159,$01F8 
    db $08 
    dw $2158,$01F8 
    db $F8 
    dw $2156,$01F8 
    db $F0 
    dw $2155,$01F8 
    db $E8 
    dw $2154 

Spitemaps_PirateWall_A:
    dw $000D,$81F9 
    db $FC 
    dw $2127,$8001 
    db $FC 
    dw $2128,$01F1 
    db $F7 
    dw $214D,$01F1 
    db $EF 
    dw $213D,$01F1 
    db $E7 
    dw $212D,$0006 
    db $FB 
    dw $6112,$0006 
    db $F3 
    dw $6102,$81FA 
    db $EB 
    dw $210E,$0003 
    db $F9 
    dw $6142,$01FB 
    db $F1 
    dw $6141,$0003 
    db $F1 
    dw $6140,$01FB 
    db $F9 
    dw $6147,$81F1 
    db $F0 
    dw $2100 

Spitemaps_PirateWall_B:
    dw $000E,$01F0 
    db $F7 
    dw $214D,$01F0 
    db $EF 
    dw $213D,$01F0 
    db $E7 
    dw $212D,$81FE 
    db $EB 
    dw $610E,$81F1 
    db $F0 
    dw $2100,$0003 
    db $F9 
    dw $6142,$01FB 
    db $F1 
    dw $6141,$0003 
    db $F1 
    dw $6140,$01FB 
    db $F9 
    dw $6147,$0008 
    db $FD 
    dw $A14D,$0008 
    db $05 
    dw $A13D,$0008 
    db $0D 
    dw $A12D,$0006 
    db $FB 
    dw $6112,$0006 
    db $F3 
    dw $6102 

Spitemaps_PirateWall_C:
    dw $0014,$0000 
    db $F2 
    dw $614F,$0008 
    db $F1 
    dw $614E,$000C 
    db $EE 
    dw $614D,$000C 
    db $E6 
    dw $613D,$000C 
    db $DE 
    dw $612D,$81FB 
    db $F1 
    dw $612E,$8002 
    db $EB 
    dw $610E,$000C 
    db $F0 
    dw $613D,$000C 
    db $F8 
    dw $614D,$8002 
    db $F1 
    dw $6100,$81F9 
    db $FF 
    dw $6107,$01F4 
    db $11 
    dw $6144,$01F4 
    db $09 
    dw $6143,$0001 
    db $09 
    dw $A149,$01F9 
    db $09 
    dw $A148,$81FC 
    db $FF 
    dw $6107,$0003 
    db $0B 
    dw $A149,$01FB 
    db $0B 
    dw $A148,$01FA 
    db $13 
    dw $6144,$01FA 
    db $0B 
    dw $6143 

Spitemaps_PirateWall_D:
    dw $0010,$0008 
    db $FC 
    dw $614D,$0009 
    db $F4 
    dw $613D,$000A 
    db $EC 
    dw $612D,$000B 
    db $FD 
    dw $614D,$000C 
    db $F5 
    dw $613D,$000D 
    db $ED 
    dw $612D,$81FD 
    db $F3 
    dw $6100,$81F9 
    db $F0 
    dw $612E,$8000 
    db $EA 
    dw $610E,$01FA 
    db $0B 
    dw $6144,$01FA 
    db $03 
    dw $6143,$01FE 
    db $09 
    dw $6146,$0006 
    db $09 
    dw $6145,$01FB 
    db $FE 
    dw $6149,$0003 
    db $FD 
    dw $6148,$81FD 
    db $FF 
    dw $6122 

Spitemaps_PirateWall_E:
    dw $0008,$0009 
    db $FD 
    dw $614D,$0009 
    db $F5 
    dw $613D,$0009 
    db $ED 
    dw $612D,$81FC 
    db $F3 
    dw $6100,$81F8 
    db $F0 
    dw $612E,$81FF 
    db $EA 
    dw $610E,$0009 
    db $E6 
    dw $613D,$0009 
    db $DE 
    dw $612D 

Spitemaps_PirateWall_F:
    dw $0009,$01FC 
    db $F3 
    dw $614F,$0004 
    db $F4 
    dw $614E,$0009 
    db $F9 
    dw $614D,$0009 
    db $F1 
    dw $613D,$0009 
    db $E9 
    dw $612D,$81F8 
    db $F0 
    dw $612E,$81FF 
    db $EA 
    dw $610E,$0009 
    db $EA 
    dw $613D,$0009 
    db $E2 
    dw $612D 

Spitemaps_PirateWall_10:
    dw $0008,$0009 
    db $F3 
    dw $614D,$0009 
    db $EB 
    dw $613D,$0009 
    db $E3 
    dw $612D,$01FD 
    db $F3 
    dw $614F,$0005 
    db $F3 
    dw $614E,$81F8 
    db $F0 
    dw $612E,$81FF 
    db $EA 
    dw $610E,$0009 
    db $E1 
    dw $612D 

Spitemaps_PirateWall_11:
    dw $000A,$01FD 
    db $F1 
    dw $614F,$0005 
    db $F0 
    dw $614E,$0009 
    db $ED 
    dw $614D,$0009 
    db $E5 
    dw $613D,$0009 
    db $DD 
    dw $612D,$81F8 
    db $F0 
    dw $612E,$81FF 
    db $EA 
    dw $610E,$0009 
    db $EF 
    dw $613D,$0009 
    db $F7 
    dw $614D,$81FF 
    db $F0 
    dw $6100 

Spitemaps_PirateWall_12:
    dw $0009,$81FC 
    db $EB 
    dw $A105,$0009 
    db $EB 
    dw $614D,$0009 
    db $E3 
    dw $613D,$0009 
    db $DB 
    dw $612D,$81F8 
    db $F0 
    dw $612E,$81FF 
    db $EA 
    dw $610E,$0009 
    db $F1 
    dw $613D,$0009 
    db $F9 
    dw $614D,$81FF 
    db $F2 
    dw $6100 

Spitemaps_PirateWall_13:
    dw $000A,$0004 
    db $19 
    dw $6146,$0001 
    db $13 
    dw $6119,$0001 
    db $0B 
    dw $6109,$81F7 
    db $FE 
    dw $6107,$000C 
    db $19 
    dw $6145,$0003 
    db $FE 
    dw $6131,$0003 
    db $F6 
    dw $6121,$81FA 
    db $F5 
    dw $A10C,$0004 
    db $05 
    dw $6146,$000C 
    db $05 
    dw $6145 

Spitemaps_PirateWall_14:
    dw $000C,$01F8 
    db $FD 
    dw $6149,$0000 
    db $FF 
    dw $6148,$0004 
    db $14 
    dw $6146,$000C 
    db $14 
    dw $6145,$01F8 
    db $FB 
    dw $6149,$0000 
    db $F9 
    dw $6148,$0003 
    db $0D 
    dw $611A,$0003 
    db $05 
    dw $610A,$0003 
    db $02 
    dw $6131,$0003 
    db $FA 
    dw $6121,$0004 
    db $09 
    dw $6146,$000C 
    db $09 
    dw $6145 

Spitemaps_PirateWall_15:
    dw $000C,$01F8 
    db $F9 
    dw $6149,$0000 
    db $FB 
    dw $6148,$0004 
    db $10 
    dw $6146,$000C 
    db $10 
    dw $6145,$01F8 
    db $FB 
    dw $6149,$0000 
    db $F9 
    dw $6148,$0003 
    db $09 
    dw $611A,$0003 
    db $01 
    dw $610A,$0003 
    db $06 
    dw $6131,$0003 
    db $FE 
    dw $6121,$0004 
    db $0D 
    dw $6146,$000C 
    db $0D 
    dw $6145 

Spitemaps_PirateWall_16:
    dw $000C,$0005 
    db $03 
    dw $6131,$0005 
    db $FB 
    dw $6121,$0004 
    db $0A 
    dw $6146,$000C 
    db $0A 
    dw $6145,$01F8 
    db $FC 
    dw $6149,$0000 
    db $FA 
    dw $6148,$01F8 
    db $FE 
    dw $6149,$0000 
    db $00 
    dw $6148,$0004 
    db $12 
    dw $6146,$000C 
    db $12 
    dw $6145,$0003 
    db $0C 
    dw $611A,$0003 
    db $04 
    dw $610A 

Spitemaps_PirateWall_17:
    dw $000A,$0003 
    db $00 
    dw $6131,$0003 
    db $F8 
    dw $6121,$81F9 
    db $F6 
    dw $A10C,$0004 
    db $07 
    dw $6146,$000C 
    db $07 
    dw $6145,$0004 
    db $16 
    dw $6146,$0002 
    db $10 
    dw $6119,$0002 
    db $08 
    dw $6109,$81F8 
    db $FD 
    dw $6107,$000C 
    db $16 
    dw $6145 

Spitemaps_PirateWall_18:
    dw $000D,$81F7 
    db $FC 
    dw $6127,$81EF 
    db $FC 
    dw $6128,$0007 
    db $F7 
    dw $614D,$0007 
    db $EF 
    dw $613D,$0007 
    db $E7 
    dw $612D,$01F2 
    db $FB 
    dw $2112,$01F2 
    db $F3 
    dw $2102,$81F6 
    db $EB 
    dw $610E,$01F5 
    db $F9 
    dw $2142,$01FD 
    db $F1 
    dw $2141,$01F5 
    db $F1 
    dw $2140,$01FD 
    db $F9 
    dw $2147,$81FF 
    db $F0 
    dw $6100 

Spitemaps_PirateWall_19:
    dw $000E,$0008 
    db $F7 
    dw $614D,$0008 
    db $EF 
    dw $613D,$0008 
    db $E7 
    dw $612D,$81F2 
    db $EB 
    dw $210E,$81FF 
    db $F0 
    dw $6100,$01F5 
    db $F9 
    dw $2142,$01FD 
    db $F1 
    dw $2141,$01F5 
    db $F1 
    dw $2140,$01FD 
    db $F9 
    dw $2147,$01F0 
    db $FD 
    dw $E14D,$01F0 
    db $05 
    dw $E13D,$01F0 
    db $0D 
    dw $E12D,$01F2 
    db $FB 
    dw $2112,$01F2 
    db $F3 
    dw $2102 

Spitemaps_PirateWall_1A:
    dw $0014,$01F8 
    db $F2 
    dw $214F,$01F0 
    db $F1 
    dw $214E,$01EC 
    db $EE 
    dw $214D,$01EC 
    db $E6 
    dw $213D,$01EC 
    db $DE 
    dw $212D,$81F5 
    db $F1 
    dw $212E,$81EE 
    db $EB 
    dw $210E,$01EC 
    db $F0 
    dw $213D,$01EC 
    db $F8 
    dw $214D,$81EE 
    db $F1 
    dw $2100,$81F7 
    db $FF 
    dw $2107,$0004 
    db $11 
    dw $2144,$0004 
    db $09 
    dw $2143,$01F7 
    db $09 
    dw $E149,$01FF 
    db $09 
    dw $E148,$81F4 
    db $FF 
    dw $2107,$01F5 
    db $0B 
    dw $E149,$01FD 
    db $0B 
    dw $E148,$01FE 
    db $13 
    dw $2144,$01FE 
    db $0B 
    dw $2143 

Spitemaps_PirateWall_1B:
    dw $0010,$01F0 
    db $FC 
    dw $214D,$01EF 
    db $F4 
    dw $213D,$01EE 
    db $EC 
    dw $212D,$01ED 
    db $FD 
    dw $214D,$01EC 
    db $F5 
    dw $213D,$01EB 
    db $ED 
    dw $212D,$81F3 
    db $F3 
    dw $2100,$81F7 
    db $F0 
    dw $212E,$81F0 
    db $EA 
    dw $210E,$01FE 
    db $0B 
    dw $2144,$01FE 
    db $03 
    dw $2143,$01FA 
    db $09 
    dw $2146,$01F2 
    db $09 
    dw $2145,$01FD 
    db $FE 
    dw $2149,$01F5 
    db $FD 
    dw $2148,$81F3 
    db $FF 
    dw $2122 

Spritemaps_PirateWalking_1:
    dw $000A,$01F5 
    db $13 
    dw $2130,$01F4 
    db $0B 
    dw $2120,$01F2 
    db $18 
    dw $2136,$01EB 
    db $18 
    dw $2135,$81F5 
    db $00 
    dw $2107,$0006 
    db $18 
    dw $2144,$0006 
    db $10 
    dw $2143,$81FE 
    db $0B 
    dw $2122,$01FD 
    db $08 
    dw $211B,$01FD 
    db $00 
    dw $210B 

Spritemaps_PirateWalking_2:
    dw $000B,$01F9 
    db $12 
    dw $2131,$01F9 
    db $0A 
    dw $2121,$01F7 
    db $18 
    dw $2126,$01EF 
    db $18 
    dw $2125,$01FA 
    db $06 
    dw $2119,$01FA 
    db $FE 
    dw $2109,$0005 
    db $17 
    dw $2144,$0005 
    db $0F 
    dw $2143,$81FA 
    db $08 
    dw $2122,$01FB 
    db $06 
    dw $211A,$01FB 
    db $FE 
    dw $210A 

Spritemaps_PirateWalking_3:
    dw $000C,$01FD 
    db $18 
    dw $2126,$01F5 
    db $18 
    dw $2125,$01FE 
    db $14 
    dw $2131,$01FE 
    db $0C 
    dw $2121,$01FC 
    db $06 
    dw $211A,$01FC 
    db $FE 
    dw $210A,$0004 
    db $18 
    dw $2144,$0004 
    db $10 
    dw $2143,$01FD 
    db $10 
    dw $211B,$01FD 
    db $08 
    dw $210B,$01FB 
    db $04 
    dw $2119,$01FB 
    db $FC 
    dw $2109 

Spritemaps_PirateWalking_4:
    dw $000B,$01FA 
    db $16 
    dw $2126,$01F2 
    db $16 
    dw $2125,$0004 
    db $18 
    dw $2146,$01FC 
    db $18 
    dw $2145,$0001 
    db $13 
    dw $2134,$0001 
    db $0B 
    dw $2124,$01FC 
    db $07 
    dw $211B,$01FD 
    db $FF 
    dw $210B,$81F4 
    db $00 
    dw $2107,$01F8 
    db $12 
    dw $2134,$01F8 
    db $0A 
    dw $2124 

Spritemaps_PirateWalking_5:
    dw $000A,$01FA 
    db $00 
    dw $210A,$01F2 
    db $18 
    dw $2136,$01EB 
    db $18 
    dw $2135,$0006 
    db $18 
    dw $2144,$0006 
    db $10 
    dw $2143,$81FB 
    db $0A 
    dw $2122,$01F9 
    db $08 
    dw $211B,$01F4 
    db $13 
    dw $2130,$01F3 
    db $0B 
    dw $2120,$81F4 
    db $00 
    dw $2107 

Spritemaps_PirateWalking_6:
    dw $000B,$01F7 
    db $13 
    dw $2131,$01F7 
    db $0B 
    dw $2121,$0005 
    db $17 
    dw $2144,$0005 
    db $0F 
    dw $2143,$81FA 
    db $08 
    dw $2122,$01FB 
    db $06 
    dw $211A,$01FB 
    db $FE 
    dw $210A,$01F6 
    db $18 
    dw $2126,$01EE 
    db $18 
    dw $2125,$01F8 
    db $07 
    dw $2119,$01F8 
    db $FF 
    dw $2109 

Spritemaps_PirateWalking_7:
    dw $000C,$01FB 
    db $06 
    dw $2119,$01FB 
    db $FE 
    dw $2109,$0002 
    db $19 
    dw $2144,$0002 
    db $11 
    dw $2143,$01FC 
    db $11 
    dw $211B,$01FC 
    db $09 
    dw $210B,$01FD 
    db $18 
    dw $2126,$01F5 
    db $18 
    dw $2125,$01FE 
    db $15 
    dw $2131,$01FE 
    db $0D 
    dw $2121,$01FC 
    db $08 
    dw $211A,$01FC 
    db $00 
    dw $210A 

Spritemaps_PirateWalking_8:
    dw $000B,$01FA 
    db $16 
    dw $2126,$01F2 
    db $16 
    dw $2125,$81F6 
    db $00 
    dw $2107,$01F8 
    db $12 
    dw $2134,$01F8 
    db $0A 
    dw $2124,$0004 
    db $18 
    dw $2146,$01FC 
    db $18 
    dw $2145,$0001 
    db $13 
    dw $2134,$0001 
    db $0B 
    dw $2124,$01FC 
    db $07 
    dw $211B,$01FD 
    db $FF 
    dw $210B 

Spitemaps_PirateWalking_9_Ninja_0:
    dw $000A,$01F8 
    db $11 
    dw $2134,$01FC 
    db $FE 
    dw $2109,$01FC 
    db $06 
    dw $2119,$0003 
    db $15 
    dw $2126,$01FC 
    db $15 
    dw $2125,$81F5 
    db $FF 
    dw $2107,$81FB 
    db $0A 
    dw $2122,$01FA 
    db $15 
    dw $2126,$01F2 
    db $15 
    dw $2125,$01F8 
    db $09 
    dw $2124 

Spitemaps_PirateWalking_A_Ninja_1:
    dw $000A,$81F7 
    db $FF 
    dw $2107,$0004 
    db $11 
    dw $2144,$0004 
    db $09 
    dw $2143,$01F7 
    db $09 
    dw $E149,$01FF 
    db $09 
    dw $E148,$81F4 
    db $FF 
    dw $2107,$01F5 
    db $0B 
    dw $E149,$01FD 
    db $0B 
    dw $E148,$01FE 
    db $13 
    dw $2144,$01FE 
    db $0B 
    dw $2143 

Spitemaps_PirateWalking_B_Ninja_2:
    dw $000A,$01FC 
    db $08 
    dw $2119,$01FC 
    db $00 
    dw $2109,$81F4 
    db $01 
    dw $2107,$01F6 
    db $09 
    dw $2124,$01F7 
    db $11 
    dw $2134,$0002 
    db $15 
    dw $2126,$01FC 
    db $15 
    dw $2125,$81FA 
    db $0B 
    dw $2122,$01F9 
    db $15 
    dw $2126,$01F2 
    db $15 
    dw $2125 

Spitemaps_PirateWalking_C:
    dw $0005,$81EA 
    db $00 
    dw $2127,$81F2 
    db $00 
    dw $2128,$01FB 
    db $FB 
    dw $2113,$01FB 
    db $F3 
    dw $2103,$81F8 
    db $F0 
    dw $212E 

Spitemaps_PirateWalking_D:
    dw $0005,$8006 
    db $00 
    dw $6127,$81FE 
    db $00 
    dw $6128,$01FD 
    db $FB 
    dw $6113,$01FD 
    db $F3 
    dw $6103,$81F8 
    db $F0 
    dw $612E 

Spitemaps_PirateWalking_E:
    dw $000A,$0003 
    db $13 
    dw $6130,$0004 
    db $0B 
    dw $6120,$0006 
    db $18 
    dw $6136,$000D 
    db $18 
    dw $6135,$81FB 
    db $00 
    dw $6107,$01F2 
    db $18 
    dw $6144,$01F2 
    db $10 
    dw $6143,$81F2 
    db $0B 
    dw $6122,$01FB 
    db $08 
    dw $611B,$01FB 
    db $00 
    dw $610B 

Spitemaps_PirateWalking_F:
    dw $000B,$01FF 
    db $12 
    dw $6131,$01FF 
    db $0A 
    dw $6121,$0001 
    db $18 
    dw $6126,$0009 
    db $18 
    dw $6125,$01FE 
    db $06 
    dw $6119,$01FE 
    db $FE 
    dw $6109,$01F3 
    db $17 
    dw $6144,$01F3 
    db $0F 
    dw $6143,$81F6 
    db $08 
    dw $6122,$01FD 
    db $06 
    dw $611A,$01FD 
    db $FE 
    dw $610A 

Spitemaps_PirateWalking_10:
    dw $000C,$01FB 
    db $18 
    dw $6126,$0003 
    db $18 
    dw $6125,$01FA 
    db $14 
    dw $6131,$01FA 
    db $0C 
    dw $6121,$01FC 
    db $06 
    dw $611A,$01FC 
    db $FE 
    dw $610A,$01F4 
    db $18 
    dw $6144,$01F4 
    db $10 
    dw $6143,$01FB 
    db $10 
    dw $611B,$01FB 
    db $08 
    dw $610B,$01FD 
    db $04 
    dw $6119,$01FD 
    db $FC 
    dw $6109 

Spitemaps_PirateWalking_11:
    dw $000B,$01FE 
    db $16 
    dw $6126,$0006 
    db $16 
    dw $6125,$01F4 
    db $18 
    dw $6146,$01FC 
    db $18 
    dw $6145,$01F7 
    db $13 
    dw $6134,$01F7 
    db $0B 
    dw $6124,$01FC 
    db $07 
    dw $611B,$01FB 
    db $FF 
    dw $610B,$81FC 
    db $00 
    dw $6107,$0000 
    db $12 
    dw $6134,$0000 
    db $0A 
    dw $6124 

Spitemaps_PirateWalking_12:
    dw $000A,$01FE 
    db $00 
    dw $610A,$0006 
    db $18 
    dw $6136,$000D 
    db $18 
    dw $6135,$01F2 
    db $18 
    dw $6144,$01F2 
    db $10 
    dw $6143,$81F5 
    db $0A 
    dw $6122,$01FF 
    db $08 
    dw $611B,$0004 
    db $13 
    dw $6130,$0005 
    db $0B 
    dw $6120,$81FC 
    db $00 
    dw $6107 

Spitemaps_PirateWalking_13:
    dw $000B,$0001 
    db $13 
    dw $6131,$0001 
    db $0B 
    dw $6121,$01F3 
    db $17 
    dw $6144,$01F3 
    db $0F 
    dw $6143,$81F6 
    db $08 
    dw $6122,$01FD 
    db $06 
    dw $611A,$01FD 
    db $FE 
    dw $610A,$0002 
    db $18 
    dw $6126,$000A 
    db $18 
    dw $6125,$0000 
    db $07 
    dw $6119,$0000 
    db $FF 
    dw $6109 

Spitemaps_PirateWalking_14:
    dw $000C,$01FD 
    db $06 
    dw $6119,$01FD 
    db $FE 
    dw $6109,$01F6 
    db $19 
    dw $6144,$01F6 
    db $11 
    dw $6143,$01FC 
    db $11 
    dw $611B,$01FC 
    db $09 
    dw $610B,$01FB 
    db $18 
    dw $6126,$0003 
    db $18 
    dw $6125,$01FA 
    db $15 
    dw $6131,$01FA 
    db $0D 
    dw $6121,$01FC 
    db $08 
    dw $611A,$01FC 
    db $00 
    dw $610A 

Spitemaps_PirateWalking_15:
    dw $000B,$01FE 
    db $16 
    dw $6126,$0006 
    db $16 
    dw $6125,$81FA 
    db $00 
    dw $6107,$0000 
    db $12 
    dw $6134,$0000 
    db $0A 
    dw $6124,$01F4 
    db $18 
    dw $6146,$01FC 
    db $18 
    dw $6145,$01F7 
    db $13 
    dw $6134,$01F7 
    db $0B 
    dw $6124,$01FC 
    db $07 
    dw $611B,$01FB 
    db $FF 
    dw $610B 

Spitemaps_PirateWalking_16_Ninja_3:
    dw $000A,$0000 
    db $11 
    dw $6134,$01FC 
    db $FE 
    dw $6109,$01FC 
    db $06 
    dw $6119,$01F5 
    db $15 
    dw $6126,$01FC 
    db $15 
    dw $6125,$81FB 
    db $FF 
    dw $6107,$81F5 
    db $0A 
    dw $6122,$01FE 
    db $15 
    dw $6126,$0006 
    db $15 
    dw $6125,$0000 
    db $09 
    dw $6124 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spitemaps_SpacePirate_B2B474:
    dw $000A,$81F9 
    db $FF 
    dw $6107,$01F4 
    db $11 
    dw $6144,$01F4 
    db $09 
    dw $6143,$0001 
    db $09 
    dw $A149,$01F9 
    db $09 
    dw $A148,$81FC 
    db $FF 
    dw $6107,$0003 
    db $0B 
    dw $A149,$01FB 
    db $0B 
    dw $A148,$01FA 
    db $13 
    dw $6144,$01FA 
    db $0B 
    dw $6143 
endif ; !FEATURE_KEEP_UNREFERENCED

Spitemaps_PirateWalking_17_Ninja_4:
    dw $000A,$01FC 
    db $08 
    dw $6119,$01FC 
    db $00 
    dw $6109,$81FC 
    db $01 
    dw $6107,$0002 
    db $09 
    dw $6124,$0001 
    db $11 
    dw $6134,$01F6 
    db $15 
    dw $6126,$01FC 
    db $15 
    dw $6125,$81F6 
    db $0B 
    dw $6122,$01FF 
    db $15 
    dw $6126,$0006 
    db $15 
    dw $6125 

Spitemaps_PirateWalking_18:
    dw $0004,$0000 
    db $00 
    dw $6151,$01F8 
    db $00 
    dw $2151,$0000 
    db $F8 
    dw $6150,$01F8 
    db $F8 
    dw $2150 

Spitemaps_PirateWalking_19:
    dw $0004,$0000 
    db $00 
    dw $6153,$0000 
    db $F8 
    dw $6152,$01F8 
    db $00 
    dw $2153,$01F8 
    db $F8 
    dw $2152 

Spitemaps_PirateWalking_1A:
    dw $0009,$01FB 
    db $FB 
    dw $2113,$01FB 
    db $F3 
    dw $2103,$0000 
    db $F8 
    dw $213F,$01F8 
    db $F8 
    dw $213E,$01FF 
    db $F0 
    dw $212F,$01F7 
    db $F0 
    dw $212E,$81EA 
    db $00 
    dw $2127,$81F2 
    db $00 
    dw $2128,$81F0 
    db $EB 
    dw $210E 

Spitemaps_PirateWalking_1B:
    dw $0009,$01FA 
    db $FB 
    dw $2113,$01FA 
    db $F3 
    dw $2103,$0000 
    db $F8 
    dw $213F,$01F8 
    db $F8 
    dw $213E,$01FE 
    db $F0 
    dw $212F,$01F6 
    db $F0 
    dw $212E,$81E9 
    db $00 
    dw $2127,$81F1 
    db $00 
    dw $2128,$81EE 
    db $EC 
    dw $210E 

Spitemaps_PirateWalking_1C:
    dw $000A,$01F8 
    db $00 
    dw $214C,$01F0 
    db $00 
    dw $214B,$01E8 
    db $00 
    dw $214A,$01F9 
    db $FB 
    dw $2113,$01F9 
    db $F3 
    dw $2103,$01FF 
    db $F8 
    dw $213F,$01F7 
    db $F8 
    dw $213E,$01FD 
    db $F0 
    dw $212F,$01F5 
    db $F0 
    dw $212E,$81EC 
    db $ED 
    dw $210E 

Spitemaps_PirateWalking_1D:
    dw $0009,$81EE 
    db $F8 
    dw $212B,$81E6 
    db $F8 
    dw $212A,$01F8 
    db $FB 
    dw $2113,$01F8 
    db $F3 
    dw $2103,$01FF 
    db $F8 
    dw $213F,$01F7 
    db $F8 
    dw $213E,$01FD 
    db $F0 
    dw $212F,$01F5 
    db $F0 
    dw $212E,$81EB 
    db $EE 
    dw $210E 

Spitemaps_PirateWalking_1E:
    dw $0009,$81EE 
    db $FA 
    dw $212B,$81E6 
    db $FA 
    dw $212A,$01F7 
    db $FA 
    dw $2113,$01F7 
    db $F3 
    dw $2103,$01FE 
    db $F8 
    dw $213F,$01F6 
    db $F8 
    dw $213E,$01FC 
    db $F0 
    dw $212F,$01F4 
    db $F0 
    dw $212E,$81EA 
    db $EF 
    dw $210E 

Spitemaps_PirateWalking_1F:
    dw $0009,$81EE 
    db $FB 
    dw $212B,$81E6 
    db $FB 
    dw $212A,$01F7 
    db $FB 
    dw $2113,$01F6 
    db $F4 
    dw $2103,$01FE 
    db $F8 
    dw $213F,$01F5 
    db $F9 
    dw $213E,$01FB 
    db $F1 
    dw $212F,$01F3 
    db $F1 
    dw $212E,$81EA 
    db $F0 
    dw $210E 

Spitemaps_PirateWalking_20:
    dw $0009,$01FD 
    db $FB 
    dw $6113,$01FD 
    db $F3 
    dw $6103,$01F8 
    db $F8 
    dw $613F,$0000 
    db $F8 
    dw $613E,$01F9 
    db $F0 
    dw $612F,$0001 
    db $F0 
    dw $612E,$8006 
    db $00 
    dw $6127,$81FE 
    db $00 
    dw $6128,$8000 
    db $EB 
    dw $610E 

Spitemaps_PirateWalking_21:
    dw $0009,$01FE 
    db $FB 
    dw $6113,$01FE 
    db $F3 
    dw $6103,$01F8 
    db $F8 
    dw $613F,$0000 
    db $F8 
    dw $613E,$01FA 
    db $F0 
    dw $612F,$0002 
    db $F0 
    dw $612E,$8007 
    db $00 
    dw $6127,$81FF 
    db $00 
    dw $6128,$8002 
    db $EC 
    dw $610E 

Spitemaps_PirateWalking_22:
    dw $000A,$0000 
    db $00 
    dw $614C,$0008 
    db $00 
    dw $614B,$0010 
    db $00 
    dw $614A,$01FF 
    db $FB 
    dw $6113,$01FF 
    db $F3 
    dw $6103,$01F9 
    db $F8 
    dw $613F,$0001 
    db $F8 
    dw $613E,$01FB 
    db $F0 
    dw $612F,$0003 
    db $F0 
    dw $612E,$8004 
    db $ED 
    dw $610E 

Spitemaps_PirateWalking_23:
    dw $0009,$8002 
    db $F8 
    dw $612B,$800A 
    db $F8 
    dw $612A,$0000 
    db $FB 
    dw $6113,$0000 
    db $F3 
    dw $6103,$01F9 
    db $F8 
    dw $613F,$0001 
    db $F8 
    dw $613E,$01FB 
    db $F0 
    dw $612F,$0003 
    db $F0 
    dw $612E,$8005 
    db $EE 
    dw $610E 

Spitemaps_PirateWalking_24:
    dw $0009,$8002 
    db $FA 
    dw $612B,$800A 
    db $FA 
    dw $612A,$0001 
    db $FA 
    dw $6113,$0001 
    db $F3 
    dw $6103,$01FA 
    db $F8 
    dw $613F,$0002 
    db $F8 
    dw $613E,$01FC 
    db $F0 
    dw $612F,$0004 
    db $F0 
    dw $612E,$8006 
    db $EF 
    dw $610E 

Spitemaps_PirateWalking_25:
    dw $0009,$8002 
    db $FB 
    dw $612B,$800A 
    db $FB 
    dw $612A,$0001 
    db $FB 
    dw $6113,$0002 
    db $F4 
    dw $6103,$01FA 
    db $F8 
    dw $613F,$0003 
    db $F9 
    dw $613E,$01FD 
    db $F1 
    dw $612F,$0005 
    db $F1 
    dw $612E,$8006 
    db $F0 
    dw $610E 

Spitemaps_PirateNinja_5:
    dw $000A,$81F4 
    db $00 
    dw $2107,$01FD 
    db $08 
    dw $211B,$01FD 
    db $00 
    dw $210B,$01ED 
    db $16 
    dw $2136,$8000 
    db $08 
    dw $217E,$01F1 
    db $13 
    dw $2130,$01F1 
    db $0B 
    dw $2120,$01E6 
    db $16 
    dw $2135,$000D 
    db $16 
    dw $2144,$000C 
    db $0E 
    dw $2143 

Spitemaps_PirateNinja_6:
    dw $000C,$000B 
    db $10 
    dw $218D,$000B 
    db $08 
    dw $217D,$0008 
    db $09 
    dw $216D,$0000 
    db $09 
    dw $216C,$01F9 
    db $12 
    dw $2131,$01F9 
    db $0A 
    dw $2121,$01F7 
    db $18 
    dw $2126,$01EF 
    db $18 
    dw $2125,$01FA 
    db $06 
    dw $2119,$01FA 
    db $FE 
    dw $2109,$01FC 
    db $06 
    dw $211A,$01FC 
    db $FE 
    dw $210A 

Spitemaps_PirateNinja_7:
    dw $000C,$01FC 
    db $06 
    dw $211A,$01FC 
    db $FE 
    dw $210A,$01F9 
    db $05 
    dw $2119,$01FD 
    db $18 
    dw $2126,$01FE 
    db $14 
    dw $2131,$01FE 
    db $0C 
    dw $2121,$01F9 
    db $FD 
    dw $2109,$01F5 
    db $18 
    dw $2125,$0001 
    db $09 
    dw $216F,$01F9 
    db $09 
    dw $216E,$0005 
    db $11 
    dw $2144,$0005 
    db $09 
    dw $2143 

Spitemaps_PirateNinja_8:
    dw $000B,$01FA 
    db $14 
    dw $2146,$01F2 
    db $14 
    dw $2145,$0006 
    db $18 
    dw $2146,$01FE 
    db $18 
    dw $2145,$0003 
    db $13 
    dw $2134,$0003 
    db $0B 
    dw $2124,$01FE 
    db $07 
    dw $211B,$01FF 
    db $FF 
    dw $210B,$81F5 
    db $FD 
    dw $2107,$01F9 
    db $0F 
    dw $2134,$01F9 
    db $07 
    dw $2124 

Spitemaps_PirateNinja_9:
    dw $000A,$01FC 
    db $08 
    dw $211B,$01FC 
    db $00 
    dw $210A,$01F0 
    db $12 
    dw $2130,$81FF 
    db $08 
    dw $217E,$01EB 
    db $16 
    dw $2136,$01E4 
    db $16 
    dw $2135,$000D 
    db $16 
    dw $2144,$000C 
    db $0E 
    dw $2143,$01F0 
    db $0A 
    dw $2120,$81F3 
    db $FF 
    dw $2107 

Spitemaps_PirateNinja_A:
    dw $000C,$000A 
    db $0F 
    dw $218D,$000A 
    db $07 
    dw $217D,$01F5 
    db $18 
    dw $2126,$01ED 
    db $18 
    dw $2125,$0006 
    db $09 
    dw $216D,$01FE 
    db $09 
    dw $216C,$01F6 
    db $13 
    dw $2131,$01F7 
    db $0B 
    dw $2121,$01FB 
    db $06 
    dw $211A,$01FB 
    db $FE 
    dw $210A,$01F8 
    db $07 
    dw $2119,$01F8 
    db $FF 
    dw $2109 

Spitemaps_PirateNinja_B:
    dw $000C,$0007 
    db $12 
    dw $2144,$0007 
    db $0A 
    dw $2143,$0002 
    db $0A 
    dw $216F,$01FA 
    db $0A 
    dw $216E,$01FA 
    db $06 
    dw $2119,$01FB 
    db $FE 
    dw $2109,$01FD 
    db $18 
    dw $2126,$01F5 
    db $18 
    dw $2125,$01FE 
    db $15 
    dw $2131,$01FE 
    db $0D 
    dw $2121,$01FC 
    db $08 
    dw $211A,$01FC 
    db $00 
    dw $210A 

Spitemaps_PirateNinja_C:
    dw $000B,$01FA 
    db $14 
    dw $2146,$01F2 
    db $14 
    dw $2145,$81F6 
    db $FC 
    dw $2107,$01F8 
    db $0E 
    dw $2134,$01F8 
    db $06 
    dw $2124,$0004 
    db $18 
    dw $2146,$01FC 
    db $18 
    dw $2145,$0001 
    db $13 
    dw $2134,$0001 
    db $0B 
    dw $2124,$01FC 
    db $07 
    dw $211B,$01FD 
    db $FF 
    dw $210B 

Spitemaps_PirateWalking_26_Ninja_D:
    dw $0009,$01FC 
    db $FC 
    dw $6112,$01FC 
    db $F4 
    dw $6102,$81EC 
    db $01 
    dw $2127,$81F4 
    db $01 
    dw $2128,$81F8 
    db $F0 
    dw $212E,$81F1 
    db $EA 
    dw $210E,$01F6 
    db $FE 
    dw $214C,$01EE 
    db $FE 
    dw $214B,$01E6 
    db $FE 
    dw $214A 

Spitemaps_PirateWalking_27_Ninja_E:
    dw $0009,$81EB 
    db $00 
    dw $2127,$81F3 
    db $00 
    dw $2128,$01FB 
    db $FB 
    dw $2113,$01FA 
    db $F3 
    dw $2103,$81F8 
    db $EF 
    dw $212E,$81F1 
    db $EA 
    dw $210E,$01F8 
    db $FD 
    dw $214C,$01F0 
    db $FD 
    dw $214B,$01E8 
    db $FD 
    dw $214A 

Spitemaps_PirateWalking_28_Ninja_F:
    dw $0008,$81E9 
    db $FE 
    dw $2127,$81F1 
    db $FE 
    dw $2128,$01FA 
    db $F8 
    dw $2113,$01FA 
    db $F0 
    dw $2103,$81F8 
    db $EE 
    dw $212E,$81F1 
    db $E8 
    dw $210E,$01F3 
    db $FC 
    dw $214B,$01EB 
    db $FD 
    dw $214A 

Spitemaps_PirateWalking_29_Ninja_10:
    dw $0008,$81E8 
    db $00 
    dw $2127,$81F0 
    db $00 
    dw $2128,$01FA 
    db $FA 
    dw $2113,$01FA 
    db $F2 
    dw $2103,$81F8 
    db $EF 
    dw $212E,$81F1 
    db $E9 
    dw $210E,$01F5 
    db $FE 
    dw $214B,$01ED 
    db $FF 
    dw $214A 

Spitemaps_PirateNinja_11:
    dw $0007,$01F6 
    db $FC 
    dw $214C,$01EE 
    db $FC 
    dw $214B,$01E6 
    db $FC 
    dw $214A,$01FB 
    db $FA 
    dw $2112,$01FB 
    db $F2 
    dw $2102,$81F8 
    db $EF 
    dw $212E,$81F1 
    db $E9 
    dw $210E 

Spitemaps_PirateNinja_12:
    dw $0007,$81F4 
    db $F2 
    dw $2100,$01E2 
    db $F3 
    dw $212A,$81EA 
    db $F3 
    dw $212B,$81F8 
    db $EF 
    dw $212E,$81F1 
    db $E9 
    dw $210E,$01F2 
    db $FD 
    dw $214B,$01EA 
    db $FD 
    dw $214A 

Spitemaps_PirateNinja_13:
    dw $0009,$01F1 
    db $FD 
    dw $214B,$01E9 
    db $FD 
    dw $214A,$01E0 
    db $E9 
    dw $212A,$81E8 
    db $E9 
    dw $212B,$01FB 
    db $F1 
    dw $214F,$01F3 
    db $F1 
    dw $214E,$81F8 
    db $EF 
    dw $212E,$81F1 
    db $E9 
    dw $210E,$01F6 
    db $FD 
    dw $214C 

Spitemaps_PirateNinja_14:
    dw $000A,$01F0 
    db $FD 
    dw $214B,$01E8 
    db $FD 
    dw $214A,$01FA 
    db $E4 
    dw $214D,$01FA 
    db $DC 
    dw $213D,$01FA 
    db $D4 
    dw $212D,$01FB 
    db $E8 
    dw $E113,$01FB 
    db $F0 
    dw $E103,$81F8 
    db $F0 
    dw $212E,$81F1 
    db $EA 
    dw $210E,$01F6 
    db $FD 
    dw $214C 

Spitemaps_PirateNinja_15:
    dw $0014,$01F6 
    db $12 
    dw $2134,$01F6 
    db $0A 
    dw $2124,$01F7 
    db $15 
    dw $2126,$01E2 
    db $F4 
    dw $212A,$81EA 
    db $F4 
    dw $212B,$01F7 
    db $FA 
    dw $2112,$01F8 
    db $F2 
    dw $2102,$0002 
    db $12 
    dw $2134,$01FD 
    db $16 
    dw $2125,$01FD 
    db $07 
    dw $211A,$01FE 
    db $FF 
    dw $210A,$0001 
    db $0A 
    dw $2124,$81F6 
    db $F0 
    dw $212E,$81F0 
    db $EA 
    dw $210E,$01EF 
    db $16 
    dw $2145,$81F3 
    db $FF 
    dw $2107,$01F6 
    db $FE 
    dw $214C,$01EE 
    db $FE 
    dw $214B,$01E6 
    db $FE 
    dw $214A,$0005 
    db $15 
    dw $2126 

Spitemaps_PirateNinja_16:
    dw $0013,$01F7 
    db $08 
    dw $2124,$0007 
    db $16 
    dw $2146,$01FF 
    db $05 
    dw $211A,$01FF 
    db $FD 
    dw $210A,$01E2 
    db $F3 
    dw $212A,$81EA 
    db $F3 
    dw $212B,$81F2 
    db $F1 
    dw $2100,$81F6 
    db $EF 
    dw $212E,$81EF 
    db $EA 
    dw $210E,$01F8 
    db $16 
    dw $2146,$01F0 
    db $15 
    dw $2145,$01FF 
    db $15 
    dw $2145,$0003 
    db $10 
    dw $2134,$0002 
    db $08 
    dw $2124,$81F4 
    db $FE 
    dw $2107,$01F7 
    db $10 
    dw $2134,$01F5 
    db $FD 
    dw $214C,$01ED 
    db $FD 
    dw $214B,$01E5 
    db $FD 
    dw $214A 

Spitemaps_PirateNinja_17:
    dw $0014,$01F7 
    db $09 
    dw $2124,$01F7 
    db $06 
    dw $2119,$01F7 
    db $FF 
    dw $2109,$01E0 
    db $F5 
    dw $212A,$81E8 
    db $F5 
    dw $212B,$81F1 
    db $F3 
    dw $2100,$81F5 
    db $F0 
    dw $212E,$81EE 
    db $EB 
    dw $210E,$01F8 
    db $16 
    dw $2146,$01F0 
    db $16 
    dw $2145,$0006 
    db $16 
    dw $2146,$01FE 
    db $16 
    dw $2145,$0003 
    db $11 
    dw $2134,$0003 
    db $09 
    dw $2124,$01FF 
    db $07 
    dw $211B,$01FF 
    db $FF 
    dw $210B,$01F8 
    db $11 
    dw $2134,$01F4 
    db $FE 
    dw $214C,$01EC 
    db $FE 
    dw $214B,$01E4 
    db $FE 
    dw $214A 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spitemaps_SpacePirate_B2BBA4:
    dw $000E,$81F4 
    db $FF 
    dw $2128,$81EC 
    db $FF 
    dw $2127,$0003 
    db $15 
    dw $2126,$81FA 
    db $0B 
    dw $2122,$01FB 
    db $FC 
    dw $2113,$01FB 
    db $F4 
    dw $2103,$81F2 
    db $EB 
    dw $210E,$81F7 
    db $F2 
    dw $212E,$01FB 
    db $15 
    dw $2125,$81F7 
    db $FF 
    dw $2107,$81F3 
    db $FF 
    dw $2107,$81F4 
    db $0A 
    dw $2122,$01FB 
    db $15 
    dw $2126,$01F3 
    db $15 
    dw $2125 

UNUSED_Spitemaps_SpacePirate_B2BBEC:
    dw $0012,$81F3 
    db $EC 
    dw $210E,$0008 
    db $FC 
    dw $E14D,$0009 
    db $04 
    dw $E13D,$0009 
    db $0C 
    dw $E12D,$81FE 
    db $F2 
    dw $2105,$81F9 
    db $F1 
    dw $212E,$81EE 
    db $F3 
    dw $212B,$81E6 
    db $F3 
    dw $212A,$81F7 
    db $FF 
    dw $2107,$0002 
    db $11 
    dw $2144,$0002 
    db $09 
    dw $2143,$01F7 
    db $09 
    dw $E149,$01FF 
    db $09 
    dw $E148,$81F4 
    db $FF 
    dw $2107,$01F5 
    db $0B 
    dw $E149,$01FD 
    db $0B 
    dw $E148,$01FE 
    db $13 
    dw $2144,$01FE 
    db $0B 
    dw $2143 

UNUSED_Spitemaps_SpacePirate_B2BC48:
    dw $0014,$01F8 
    db $F2 
    dw $214F,$01F0 
    db $F1 
    dw $214E,$01EC 
    db $EE 
    dw $214D,$01EC 
    db $E6 
    dw $213D,$01EC 
    db $DE 
    dw $212D,$81F5 
    db $F1 
    dw $212E,$81EE 
    db $EB 
    dw $210E,$01EC 
    db $F0 
    dw $213D,$01EC 
    db $F8 
    dw $214D,$81EE 
    db $F1 
    dw $2100,$81F7 
    db $FF 
    dw $2107,$0004 
    db $11 
    dw $2144,$0004 
    db $09 
    dw $2143,$01F7 
    db $09 
    dw $E149,$01FF 
    db $09 
    dw $E148,$81F4 
    db $FF 
    dw $2107,$01F5 
    db $0B 
    dw $E149,$01FD 
    db $0B 
    dw $E148,$01FE 
    db $13 
    dw $2144,$01FE 
    db $0B 
    dw $2143 

UNUSED_Spitemaps_SpacePirate_B2BCAE:
    dw $000F,$01E8 
    db $F7 
    dw $212A,$81F0 
    db $F7 
    dw $212B,$81F7 
    db $F6 
    dw $2100,$81FB 
    db $F2 
    dw $212E,$81F4 
    db $EC 
    dw $210E,$01FE 
    db $0B 
    dw $2146,$01F6 
    db $0B 
    dw $2145,$0001 
    db $00 
    dw $2149,$01F9 
    db $FF 
    dw $2148,$81F7 
    db $01 
    dw $2122,$01EF 
    db $F9 
    dw $214D,$01EE 
    db $F1 
    dw $213D,$01ED 
    db $E9 
    dw $212D,$0002 
    db $0D 
    dw $2144,$0002 
    db $05 
    dw $2143 

UNUSED_Spitemaps_SpacePirate_B2BCFB:
    dw $000E,$01F0 
    db $05 
    dw $E18D,$01F0 
    db $0D 
    dw $E17D,$01F6 
    db $0B 
    dw $2130,$01F6 
    db $03 
    dw $2120,$01E9 
    db $F4 
    dw $212A,$81F1 
    db $F4 
    dw $212B,$81F8 
    db $F3 
    dw $2100,$81FC 
    db $F0 
    dw $212E,$81F5 
    db $EA 
    dw $210E,$0001 
    db $FE 
    dw $2149,$01F9 
    db $FE 
    dw $2148,$01F1 
    db $F6 
    dw $214D,$01F0 
    db $EE 
    dw $213D,$01EF 
    db $E6 
    dw $212D 

UNUSED_Spitemaps_SpacePirate_B2BD43:
    dw $000E,$01F0 
    db $05 
    dw $E18D,$01F0 
    db $0D 
    dw $E17D,$01F5 
    db $0B 
    dw $2130,$01F5 
    db $03 
    dw $2120,$01E8 
    db $F3 
    dw $212A,$81F0 
    db $F3 
    dw $212B,$81F8 
    db $F2 
    dw $2100,$81FC 
    db $F1 
    dw $212E,$81F5 
    db $EB 
    dw $210E,$0001 
    db $FF 
    dw $2149,$01F9 
    db $FE 
    dw $2148,$01F0 
    db $F7 
    dw $214D,$01EF 
    db $EF 
    dw $213D,$01EE 
    db $E7 
    dw $212D 
endif ; !FEATURE_KEEP_UNREFERENCED

Spitemaps_PirateNinja_18:
    dw $0009,$01F9 
    db $00 
    dw $E14D,$01F9 
    db $08 
    dw $E13D,$01F9 
    db $10 
    dw $E12D,$01FA 
    db $FA 
    dw $2113,$01FA 
    db $F2 
    dw $2103,$81F8 
    db $EF 
    dw $212E,$81F1 
    db $E9 
    dw $210E,$01F5 
    db $FD 
    dw $214B,$01ED 
    db $FE 
    dw $214A 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spitemaps_SpacePirate_B2BDBA:
    dw $0003,$01FC 
    db $04 
    dw $214D,$01FC 
    db $FC 
    dw $213D,$01FC 
    db $F4 
    dw $212D 
endif ; !FEATURE_KEEP_UNREFERENCED

Spitemaps_PirateWalking_2A_Ninja_18:
    dw $0010,$81F9 
    db $FE 
    dw $2107,$01E4 
    db $F3 
    dw $212A,$81EC 
    db $F3 
    dw $212B,$81F6 
    db $F1 
    dw $2100,$81F2 
    db $EB 
    dw $210E,$81F9 
    db $F1 
    dw $212E,$01ED 
    db $F9 
    dw $214D,$01EC 
    db $F1 
    dw $213D,$01EB 
    db $E9 
    dw $212D,$81F4 
    db $FE 
    dw $2107,$01FC 
    db $10 
    dw $2125,$81F3 
    db $05 
    dw $2122,$0004 
    db $10 
    dw $2126,$81FB 
    db $07 
    dw $2122,$01FA 
    db $10 
    dw $2126,$01F2 
    db $10 
    dw $2125 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spitemaps_SpacePirate_B2BE1D:
    dw $0011,$81F3 
    db $FB 
    dw $2127,$81FB 
    db $FB 
    dw $2128,$01FE 
    db $0D 
    dw $2121,$01FE 
    db $15 
    dw $2131,$01FD 
    db $18 
    dw $2126,$01F5 
    db $18 
    dw $2125,$01FC 
    db $08 
    dw $211A,$01FC 
    db $00 
    dw $210A,$0007 
    db $12 
    dw $2144,$0007 
    db $0A 
    dw $2143,$01FA 
    db $06 
    dw $2119,$01FB 
    db $FE 
    dw $2109,$01FA 
    db $0A 
    dw $216E,$81FA 
    db $F0 
    dw $2105,$81F1 
    db $E6 
    dw $210E,$81F7 
    db $EF 
    dw $212E,$0002 
    db $0A 
    dw $216F 

UNUSED_Spitemaps_SpacePirate_B2BE74:
    dw $0013,$01FE 
    db $FF 
    dw $210A,$01E3 
    db $F0 
    dw $212A,$81EB 
    db $F0 
    dw $212B,$81F3 
    db $F1 
    dw $2100,$0006 
    db $F5 
    dw $E14D,$0007 
    db $FD 
    dw $E13D,$0008 
    db $05 
    dw $E12D,$81F3 
    db $E9 
    dw $210E,$81F7 
    db $F1 
    dw $212E,$01FD 
    db $07 
    dw $211A,$01E3 
    db $FD 
    dw $E16F,$01EB 
    db $FD 
    dw $E16E,$01FB 
    db $FE 
    dw $219F,$01F3 
    db $FE 
    dw $219E,$0008 
    db $16 
    dw $2126,$0000 
    db $17 
    dw $2125,$81FE 
    db $0A 
    dw $2122,$01DE 
    db $F4 
    dw $E18D,$01DD 
    db $FC 
    dw $E17D 

UNUSED_Spitemaps_SpacePirate_B2BED5:
    dw $0016,$0009 
    db $F4 
    dw $E14D,$000A 
    db $FC 
    dw $E13D,$000A 
    db $04 
    dw $E12D,$0006 
    db $F3 
    dw $215F,$01FE 
    db $F4 
    dw $215E,$01FF 
    db $00 
    dw $610A,$81F3 
    db $EC 
    dw $210E,$81F9 
    db $F2 
    dw $212E,$01EF 
    db $10 
    dw $618D,$01EF 
    db $08 
    dw $617D,$01F4 
    db $08 
    dw $616F,$01FC 
    db $09 
    dw $616E,$0000 
    db $08 
    dw $611A,$01F5 
    db $EA 
    dw $214D,$01F4 
    db $E2 
    dw $213D,$01F4 
    db $DA 
    dw $212D,$01E5 
    db $FD 
    dw $E16F,$01ED 
    db $FD 
    dw $E16E,$01FB 
    db $FD 
    dw $219F,$01F3 
    db $FD 
    dw $219E,$01DE 
    db $F5 
    dw $E18D,$01DE 
    db $FD 
    dw $E17D 
endif ; !FEATURE_KEEP_UNREFERENCED

Spitemaps_PirateNinja_19:
    dw $000A,$81FC 
    db $00 
    dw $6107,$01FB 
    db $08 
    dw $611B,$01FB 
    db $00 
    dw $610B,$000B 
    db $16 
    dw $6136,$81F0 
    db $08 
    dw $617E,$0007 
    db $13 
    dw $6130,$0007 
    db $0B 
    dw $6120,$0012 
    db $16 
    dw $6135,$01EB 
    db $16 
    dw $6144,$01EC 
    db $0E 
    dw $6143 

Spitemaps_PirateNinja_1A:
    dw $000C,$01ED 
    db $10 
    dw $618D,$01ED 
    db $08 
    dw $617D,$01F0 
    db $09 
    dw $616D,$01F8 
    db $09 
    dw $616C,$01FF 
    db $12 
    dw $6131,$01FF 
    db $0A 
    dw $6121,$0001 
    db $18 
    dw $6126,$0009 
    db $18 
    dw $6125,$01FE 
    db $06 
    dw $6119,$01FE 
    db $FE 
    dw $6109,$01FC 
    db $06 
    dw $611A,$01FC 
    db $FE 
    dw $610A 

Spitemaps_PirateNinja_1B:
    dw $000C,$01FC 
    db $06 
    dw $611A,$01FC 
    db $FE 
    dw $610A,$01FF 
    db $05 
    dw $6119,$01FB 
    db $18 
    dw $6126,$01FA 
    db $14 
    dw $6131,$01FA 
    db $0C 
    dw $6121,$01FF 
    db $FD 
    dw $6109,$0003 
    db $18 
    dw $6125,$01F7 
    db $09 
    dw $616F,$01FF 
    db $09 
    dw $616E,$01F3 
    db $11 
    dw $6144,$01F3 
    db $09 
    dw $6143 

Spitemaps_PirateNinja_1C:
    dw $000B,$01FE 
    db $14 
    dw $6146,$0006 
    db $14 
    dw $6145,$01F2 
    db $18 
    dw $6146,$01FA 
    db $18 
    dw $6145,$01F5 
    db $13 
    dw $6134,$01F5 
    db $0B 
    dw $6124,$01FA 
    db $07 
    dw $611B,$01F9 
    db $FF 
    dw $610B,$81FB 
    db $FD 
    dw $6107,$01FF 
    db $0F 
    dw $6134,$01FF 
    db $07 
    dw $6124 

Spitemaps_PirateNinja_1D:
    dw $000A,$01FC 
    db $08 
    dw $611B,$01FC 
    db $00 
    dw $610A,$0008 
    db $12 
    dw $6130,$81F1 
    db $08 
    dw $617E,$000D 
    db $16 
    dw $6136,$0014 
    db $16 
    dw $6135,$01EB 
    db $16 
    dw $6144,$01EC 
    db $0E 
    dw $6143,$0008 
    db $0A 
    dw $6120,$81FD 
    db $FF 
    dw $6107 

Spitemaps_PirateNinja_1E:
    dw $000C,$01EE 
    db $0F 
    dw $618D,$01EE 
    db $07 
    dw $617D,$0003 
    db $18 
    dw $6126,$000B 
    db $18 
    dw $6125,$01F2 
    db $09 
    dw $616D,$01FA 
    db $09 
    dw $616C,$0002 
    db $13 
    dw $6131,$0001 
    db $0B 
    dw $6121,$01FD 
    db $06 
    dw $611A,$01FD 
    db $FE 
    dw $610A,$0000 
    db $07 
    dw $6119,$0000 
    db $FF 
    dw $6109 

Spitemaps_PirateNinja_1F:
    dw $000C,$01F1 
    db $12 
    dw $6144,$01F1 
    db $0A 
    dw $6143,$01F6 
    db $0A 
    dw $616F,$01FE 
    db $0A 
    dw $616E,$01FE 
    db $06 
    dw $6119,$01FD 
    db $FE 
    dw $6109,$01FB 
    db $18 
    dw $6126,$0003 
    db $18 
    dw $6125,$01FA 
    db $15 
    dw $6131,$01FA 
    db $0D 
    dw $6121,$01FC 
    db $08 
    dw $611A,$01FC 
    db $00 
    dw $610A 

Spitemaps_PirateNinja_20:
    dw $000B,$01FE 
    db $14 
    dw $6146,$0006 
    db $14 
    dw $6145,$81FA 
    db $FC 
    dw $6107,$0000 
    db $0E 
    dw $6134,$0000 
    db $06 
    dw $6124,$01F4 
    db $18 
    dw $6146,$01FC 
    db $18 
    dw $6145,$01F7 
    db $13 
    dw $6134,$01F7 
    db $0B 
    dw $6124,$01FC 
    db $07 
    dw $611B,$01FB 
    db $FF 
    dw $610B 

Spitemaps_PirateWalking_2B_Ninja_21:
    dw $0009,$01FC 
    db $FC 
    dw $2112,$01FC 
    db $F4 
    dw $2102,$8004 
    db $01 
    dw $6127,$81FC 
    db $01 
    dw $6128,$81F8 
    db $F0 
    dw $612E,$81FF 
    db $EA 
    dw $610E,$0002 
    db $FE 
    dw $614C,$000A 
    db $FE 
    dw $614B,$0012 
    db $FE 
    dw $614A 

Spitemaps_PirateWalking_2C_Ninja_22:
    dw $0009,$8005 
    db $00 
    dw $6127,$81FD 
    db $00 
    dw $6128,$01FD 
    db $FB 
    dw $6113,$01FE 
    db $F3 
    dw $6103,$81F8 
    db $EF 
    dw $612E,$81FF 
    db $EA 
    dw $610E,$0000 
    db $FD 
    dw $614C,$0008 
    db $FD 
    dw $614B,$0010 
    db $FD 
    dw $614A 

Spitemaps_PirateWalking_2D_Ninja_23:
    dw $0008,$8007 
    db $FE 
    dw $6127,$81FF 
    db $FE 
    dw $6128,$01FE 
    db $F8 
    dw $6113,$01FE 
    db $F0 
    dw $6103,$81F8 
    db $EE 
    dw $612E,$81FF 
    db $E8 
    dw $610E,$0005 
    db $FC 
    dw $614B,$000D 
    db $FD 
    dw $614A 

Spitemaps_PirateWalking_2E_Ninja_24:
    dw $0008,$8008 
    db $00 
    dw $6127,$8000 
    db $00 
    dw $6128,$01FE 
    db $FA 
    dw $6113,$01FE 
    db $F2 
    dw $6103,$81F8 
    db $EF 
    dw $612E,$81FF 
    db $E9 
    dw $610E,$0003 
    db $FE 
    dw $614B,$000B 
    db $FF 
    dw $614A 

Spitemaps_PirateNinja_25:
    dw $0007,$0002 
    db $FC 
    dw $614C,$000A 
    db $FC 
    dw $614B,$0012 
    db $FC 
    dw $614A,$01FD 
    db $FA 
    dw $6112,$01FD 
    db $F2 
    dw $6102,$81F8 
    db $EF 
    dw $612E,$81FF 
    db $E9 
    dw $610E 

Spitemaps_PirateNinja_26:
    dw $0007,$81FC 
    db $F2 
    dw $6100,$0016 
    db $F3 
    dw $612A,$8006 
    db $F3 
    dw $612B,$81F8 
    db $EF 
    dw $612E,$81FF 
    db $E9 
    dw $610E,$0006 
    db $FD 
    dw $614B,$000E 
    db $FD 
    dw $614A 

Spitemaps_PirateNinja_27:
    dw $0009,$0007 
    db $FD 
    dw $614B,$000F 
    db $FD 
    dw $614A,$0018 
    db $E9 
    dw $612A,$8008 
    db $E9 
    dw $612B,$01FD 
    db $F1 
    dw $614F,$0005 
    db $F1 
    dw $614E,$81F8 
    db $EF 
    dw $612E,$81FF 
    db $E9 
    dw $610E,$0002 
    db $FD 
    dw $614C 

Spitemaps_PirateNinja_28:
    dw $000A,$0008 
    db $FD 
    dw $614B,$0010 
    db $FD 
    dw $614A,$01FE 
    db $E4 
    dw $614D,$01FE 
    db $DC 
    dw $613D,$01FE 
    db $D4 
    dw $612D,$01FD 
    db $E8 
    dw $A113,$01FD 
    db $F0 
    dw $A103,$81F8 
    db $F0 
    dw $612E,$81FF 
    db $EA 
    dw $610E,$0002 
    db $FD 
    dw $614C 

Spitemaps_PirateNinja_29:
    dw $0014,$0002 
    db $12 
    dw $6134,$0002 
    db $0A 
    dw $6124,$0001 
    db $15 
    dw $6126,$0016 
    db $F4 
    dw $612A,$8006 
    db $F4 
    dw $612B,$0001 
    db $FA 
    dw $6112,$0000 
    db $F2 
    dw $6102,$01F6 
    db $12 
    dw $6134,$01FB 
    db $16 
    dw $6125,$01FB 
    db $07 
    dw $611A,$01FA 
    db $FF 
    dw $610A,$01F7 
    db $0A 
    dw $6124,$81FA 
    db $F0 
    dw $612E,$8000 
    db $EA 
    dw $610E,$0009 
    db $16 
    dw $6145,$81FD 
    db $FF 
    dw $6107,$0002 
    db $FE 
    dw $614C,$000A 
    db $FE 
    dw $614B,$0012 
    db $FE 
    dw $614A,$01F3 
    db $15 
    dw $6126 

Spitemaps_PirateNinja_2A:
    dw $0013,$0001 
    db $08 
    dw $6124,$01F1 
    db $16 
    dw $6146,$01F9 
    db $05 
    dw $611A,$01F9 
    db $FD 
    dw $610A,$0016 
    db $F3 
    dw $612A,$8006 
    db $F3 
    dw $612B,$81FE 
    db $F1 
    dw $6100,$81FA 
    db $EF 
    dw $612E,$8001 
    db $EA 
    dw $610E,$0000 
    db $16 
    dw $6146,$0008 
    db $15 
    dw $6145,$01F9 
    db $15 
    dw $6145,$01F5 
    db $10 
    dw $6134,$01F6 
    db $08 
    dw $6124,$81FC 
    db $FE 
    dw $6107,$0001 
    db $10 
    dw $6134,$0003 
    db $FD 
    dw $614C,$000B 
    db $FD 
    dw $614B,$0013 
    db $FD 
    dw $614A 

Spitemaps_PirateNinja_2B:
    dw $0014,$0001 
    db $09 
    dw $6124,$0001 
    db $06 
    dw $6119,$0001 
    db $FF 
    dw $6109,$0018 
    db $F5 
    dw $612A,$8008 
    db $F5 
    dw $612B,$81FF 
    db $F3 
    dw $6100,$81FB 
    db $F0 
    dw $612E,$8002 
    db $EB 
    dw $610E,$0000 
    db $16 
    dw $6146,$0008 
    db $16 
    dw $6145,$01F2 
    db $16 
    dw $6146,$01FA 
    db $16 
    dw $6145,$01F5 
    db $11 
    dw $6134,$01F5 
    db $09 
    dw $6124,$01F9 
    db $07 
    dw $611B,$01F9 
    db $FF 
    dw $610B,$0000 
    db $11 
    dw $6134,$0004 
    db $FE 
    dw $614C,$000C 
    db $FE 
    dw $614B,$0014 
    db $FE 
    dw $614A 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spitemaps_SpacePirate_B2C3A3:
    dw $000E,$81FC 
    db $FF 
    dw $6128,$8004 
    db $FF 
    dw $6127,$01F5 
    db $15 
    dw $6126,$81F6 
    db $0B 
    dw $6122,$01FD 
    db $FC 
    dw $6113,$01FD 
    db $F4 
    dw $6103,$81FE 
    db $EB 
    dw $610E,$81F9 
    db $F2 
    dw $612E,$01FD 
    db $15 
    dw $6125,$81F9 
    db $FF 
    dw $6107,$81FD 
    db $FF 
    dw $6107,$81FC 
    db $0A 
    dw $6122,$01FD 
    db $15 
    dw $6126,$0005 
    db $15 
    dw $6125 

UNUSED_Spitemaps_SpacePirate_B2C3EB:
    dw $0012,$81FD 
    db $EC 
    dw $610E,$01F0 
    db $FC 
    dw $A14D,$01EF 
    db $04 
    dw $A13D,$01EF 
    db $0C 
    dw $A12D,$81F2 
    db $F2 
    dw $6105,$81F7 
    db $F1 
    dw $612E,$8002 
    db $F3 
    dw $612B,$800A 
    db $F3 
    dw $612A,$81F9 
    db $FF 
    dw $6107,$01F6 
    db $11 
    dw $6144,$01F6 
    db $09 
    dw $6143,$0001 
    db $09 
    dw $A149,$01F9 
    db $09 
    dw $A148,$81FC 
    db $FF 
    dw $6107,$0003 
    db $0B 
    dw $A149,$01FB 
    db $0B 
    dw $A148,$01FA 
    db $13 
    dw $6144,$01FA 
    db $0B 
    dw $6143 

UNUSED_Spitemaps_SpacePirate_B2C447:
    dw $0014,$0000 
    db $F2 
    dw $614F,$0008 
    db $F1 
    dw $614E,$000C 
    db $EE 
    dw $614D,$000C 
    db $E6 
    dw $613D,$000C 
    db $DE 
    dw $612D,$81FB 
    db $F1 
    dw $612E,$8002 
    db $EB 
    dw $610E,$000C 
    db $F0 
    dw $613D,$000C 
    db $F8 
    dw $614D,$8002 
    db $F1 
    dw $6100,$81F9 
    db $FF 
    dw $6107,$01F4 
    db $11 
    dw $6144,$01F4 
    db $09 
    dw $6143,$0001 
    db $09 
    dw $A149,$01F9 
    db $09 
    dw $A148,$81FC 
    db $FF 
    dw $6107,$0003 
    db $0B 
    dw $A149,$01FB 
    db $0B 
    dw $A148,$01FA 
    db $13 
    dw $6144,$01FA 
    db $0B 
    dw $6143 

UNUSED_Spitemaps_SpacePirate_B2C4AD:
    dw $000F,$0010 
    db $F7 
    dw $612A,$8000 
    db $F7 
    dw $612B,$81F9 
    db $F6 
    dw $6100,$81F5 
    db $F2 
    dw $612E,$81FC 
    db $EC 
    dw $610E,$01FA 
    db $0B 
    dw $6146,$0002 
    db $0B 
    dw $6145,$01F7 
    db $00 
    dw $6149,$01FF 
    db $FF 
    dw $6148,$81F9 
    db $01 
    dw $6122,$0009 
    db $F9 
    dw $614D,$000A 
    db $F1 
    dw $613D,$000B 
    db $E9 
    dw $612D,$01F6 
    db $0D 
    dw $6144,$01F6 
    db $05 
    dw $6143 

UNUSED_Spitemaps_SpacePirate_B2C4FA:
    dw $000E,$0008 
    db $05 
    dw $A18D,$0008 
    db $0D 
    dw $A17D,$0002 
    db $0B 
    dw $6130,$0002 
    db $03 
    dw $6120,$000F 
    db $F4 
    dw $612A,$81FF 
    db $F4 
    dw $612B,$81F8 
    db $F3 
    dw $6100,$81F4 
    db $F0 
    dw $612E,$81FB 
    db $EA 
    dw $610E,$01F7 
    db $FE 
    dw $6149,$01FF 
    db $FE 
    dw $6148,$0007 
    db $F6 
    dw $614D,$0008 
    db $EE 
    dw $613D,$0009 
    db $E6 
    dw $612D 

UNUSED_Spitemaps_SpacePirate_B2C542:
    dw $000E,$0008 
    db $05 
    dw $A18D,$0008 
    db $0D 
    dw $A17D,$0003 
    db $0B 
    dw $6130,$0003 
    db $03 
    dw $6120,$0010 
    db $F3 
    dw $612A,$8000 
    db $F3 
    dw $612B,$81F8 
    db $F2 
    dw $6100,$81F4 
    db $F1 
    dw $612E,$81FB 
    db $EB 
    dw $610E,$01F7 
    db $FF 
    dw $6149,$01FF 
    db $FE 
    dw $6148,$0008 
    db $F7 
    dw $614D,$0009 
    db $EF 
    dw $613D,$000A 
    db $E7 
    dw $612D 
endif ; !FEATURE_KEEP_UNREFERENCED

Spitemaps_PirateNinja_2C:
    dw $0009,$01FF 
    db $00 
    dw $A14D,$01FF 
    db $08 
    dw $A13D,$01FF 
    db $10 
    dw $A12D,$01FE 
    db $FA 
    dw $6113,$01FE 
    db $F2 
    dw $6103,$81F8 
    db $EF 
    dw $612E,$81FF 
    db $E9 
    dw $610E,$0003 
    db $FD 
    dw $614B,$000B 
    db $FE 
    dw $614A 

Spitemaps_PirateWalking_2F:
    dw $0010,$81F7 
    db $FE 
    dw $6107,$0014 
    db $F3 
    dw $612A,$8004 
    db $F3 
    dw $612B,$81FA 
    db $F1 
    dw $6100,$81FE 
    db $EB 
    dw $610E,$81F7 
    db $F1 
    dw $612E,$000B 
    db $F9 
    dw $614D,$000C 
    db $F1 
    dw $613D,$000D 
    db $E9 
    dw $612D,$81FC 
    db $FE 
    dw $6107,$01FC 
    db $10 
    dw $6125,$81FD 
    db $05 
    dw $6122,$01F4 
    db $10 
    dw $6126,$81F5 
    db $07 
    dw $6122,$01FE 
    db $10 
    dw $6126,$0006 
    db $10 
    dw $6125 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spitemaps_SpacePirate_B2C60B:
    dw $0011,$81FD 
    db $FB 
    dw $6127,$81F5 
    db $FB 
    dw $6128,$01FA 
    db $0D 
    dw $6121,$01FA 
    db $15 
    dw $6131,$01FB 
    db $18 
    dw $6126,$0003 
    db $18 
    dw $6125,$01FC 
    db $08 
    dw $611A,$01FC 
    db $00 
    dw $610A,$01F1 
    db $12 
    dw $6144,$01F1 
    db $0A 
    dw $6143,$01FE 
    db $06 
    dw $6119,$01FD 
    db $FE 
    dw $6109,$01FE 
    db $0A 
    dw $616E,$81F6 
    db $F0 
    dw $6105,$81FF 
    db $E6 
    dw $610E,$81F9 
    db $EF 
    dw $612E,$01F6 
    db $0A 
    dw $616F 

UNUSED_Spitemaps_SpacePirate_B2C662:
    dw $0013,$01FA 
    db $FF 
    dw $610A,$0015 
    db $F0 
    dw $612A,$8005 
    db $F0 
    dw $612B,$81FD 
    db $F1 
    dw $6100,$01F2 
    db $F5 
    dw $A14D,$01F1 
    db $FD 
    dw $A13D,$01F0 
    db $05 
    dw $A12D,$81FD 
    db $E9 
    dw $610E,$81F9 
    db $F1 
    dw $612E,$01FB 
    db $07 
    dw $611A,$0015 
    db $FD 
    dw $A16F,$000D 
    db $FD 
    dw $A16E,$01FD 
    db $FE 
    dw $619F,$0005 
    db $FE 
    dw $619E,$01F0 
    db $16 
    dw $6126,$01F8 
    db $17 
    dw $6125,$81F2 
    db $0A 
    dw $6122,$001A 
    db $F4 
    dw $A18D,$001B 
    db $FC 
    dw $A17D 

UNUSED_Spitemaps_SpacePirate_B2C6C3:
    dw $0016,$01EF 
    db $F4 
    dw $A14D,$01EE 
    db $FC 
    dw $A13D,$01EE 
    db $04 
    dw $A12D,$01F2 
    db $F3 
    dw $615F,$01FA 
    db $F4 
    dw $615E,$01F9 
    db $00 
    dw $210A,$81FD 
    db $EC 
    dw $610E,$81F7 
    db $F2 
    dw $612E,$0009 
    db $10 
    dw $218D,$0009 
    db $08 
    dw $217D,$0004 
    db $08 
    dw $216F,$01FC 
    db $09 
    dw $216E,$01F8 
    db $08 
    dw $211A,$0003 
    db $EA 
    dw $614D,$0004 
    db $E2 
    dw $613D,$0004 
    db $DA 
    dw $612D,$0013 
    db $FD 
    dw $A16F,$000B 
    db $FD 
    dw $A16E,$01FD 
    db $FD 
    dw $619F,$0005 
    db $FD 
    dw $619E,$001A 
    db $F5 
    dw $A18D,$001A 
    db $FD 
    dw $A17D 
endif ; !FEATURE_KEEP_UNREFERENCED

Spitemaps_PirateNinja_2D:
    dw $0004,$81FA 
    db $00 
    dw $2182,$81EA 
    db $00 
    dw $2180,$81FA 
    db $F0 
    dw $2162,$81EA 
    db $F0 
    dw $2160 

Spitemaps_PirateNinja_2E:
    dw $0006,$01F5 
    db $10 
    dw $21A5,$01FD 
    db $10 
    dw $21A6,$81FD 
    db $00 
    dw $2186,$81ED 
    db $00 
    dw $2184,$81FD 
    db $F0 
    dw $2166,$81ED 
    db $F0 
    dw $2164 

Spitemaps_PirateNinja_2E_miscount:
    dw $0005,$000C 
    db $FE 
    dw $217C,$81FC 
    db $06 
    dw $218A,$81EC 
    db $06 
    dw $2188,$81FC 
    db $F6 
    dw $216A,$81EC 
    db $F6 
    dw $2168 

Spitemaps_PirateNinja_2F:
    dw $0007,$0010 
    db $FA 
    dw $E1A7,$81F0 
    db $F2 
    dw $E1AA,$8000 
    db $F2 
    dw $E1A8,$01F0 
    db $02 
    dw $E1B4,$0008 
    db $02 
    dw $E1B1,$0010 
    db $02 
    dw $E1B0,$81F8 
    db $02 
    dw $E1A2 

Spitemaps_PirateNinja_30:
    dw $0004,$81F6 
    db $F0 
    dw $E182,$8006 
    db $F0 
    dw $E180,$81F6 
    db $00 
    dw $E162,$8006 
    db $00 
    dw $E160 

Spitemaps_PirateNinja_31:
    dw $0006,$0004 
    db $E8 
    dw $E1A5,$01FC 
    db $E8 
    dw $E1A6,$81F4 
    db $F0 
    dw $E186,$8004 
    db $F0 
    dw $E184,$81F4 
    db $00 
    dw $E166,$8004 
    db $00 
    dw $E164 

Spitemaps_PirateNinja_32:
    dw $0005,$01EC 
    db $FA 
    dw $E17C,$81F4 
    db $EA 
    dw $E18A,$8004 
    db $EA 
    dw $E188,$81F4 
    db $FA 
    dw $E16A,$8004 
    db $FA 
    dw $E168 

Spitemaps_PirateNinja_33:
    dw $0007,$01E9 
    db $FE 
    dw $21A7,$8001 
    db $FE 
    dw $21AA,$81F1 
    db $FE 
    dw $21A8,$0009 
    db $F6 
    dw $21B4,$01F1 
    db $F6 
    dw $21B1,$01E9 
    db $F6 
    dw $21B0,$81F9 
    db $EE 
    dw $21A2 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spitemaps_SpacePirate_B2C81F:
    dw $000D,$81F9 
    db $FC 
    dw $2127,$8001 
    db $FC 
    dw $2128,$01F1 
    db $F7 
    dw $214D,$01F1 
    db $EF 
    dw $213D,$01F1 
    db $E7 
    dw $212D,$0006 
    db $FB 
    dw $6112,$0006 
    db $F3 
    dw $6102,$81FA 
    db $EB 
    dw $210E,$0003 
    db $F9 
    dw $6142,$01FB 
    db $F1 
    dw $6141,$0003 
    db $F1 
    dw $6140,$01FB 
    db $F9 
    dw $6147,$81F1 
    db $F0 
    dw $2100 

UNUSED_Spitemaps_SpacePirate_B2C862:
    dw $000E,$01F0 
    db $F7 
    dw $214D,$01F0 
    db $EF 
    dw $213D,$01F0 
    db $E7 
    dw $212D,$81FE 
    db $EB 
    dw $610E,$81F1 
    db $F0 
    dw $2100,$0003 
    db $F9 
    dw $6142,$01FB 
    db $F1 
    dw $6141,$0003 
    db $F1 
    dw $6140,$01FB 
    db $F9 
    dw $6147,$0008 
    db $FD 
    dw $A14D,$0008 
    db $05 
    dw $A13D,$0008 
    db $0D 
    dw $A12D,$0006 
    db $FB 
    dw $6112,$0006 
    db $F3 
    dw $6102 

UNUSED_Spitemaps_SpacePirate_B2C8AA:
    dw $0014,$0000 
    db $F2 
    dw $614F,$0008 
    db $F1 
    dw $614E,$000C 
    db $EE 
    dw $614D,$000C 
    db $E6 
    dw $613D,$000C 
    db $DE 
    dw $612D,$81FB 
    db $F1 
    dw $612E,$8002 
    db $EB 
    dw $610E,$000C 
    db $F0 
    dw $613D,$000C 
    db $F8 
    dw $614D,$8002 
    db $F1 
    dw $6100,$81F9 
    db $FF 
    dw $6107,$01F4 
    db $11 
    dw $6144,$01F4 
    db $09 
    dw $6143,$0001 
    db $09 
    dw $A149,$01F9 
    db $09 
    dw $A148,$81FC 
    db $FF 
    dw $6107,$0003 
    db $0B 
    dw $A149,$01FB 
    db $0B 
    dw $A148,$01FA 
    db $13 
    dw $6144,$01FA 
    db $0B 
    dw $6143 
endif ; !FEATURE_KEEP_UNREFERENCED

Spitemaps_PirateNinja_34:
    dw $0004,$81F6 
    db $00 
    dw $6182,$8006 
    db $00 
    dw $6180,$81F6 
    db $F0 
    dw $6162,$8006 
    db $F0 
    dw $6160 

Spitemaps_PirateNinja_35:
    dw $0006,$0003 
    db $10 
    dw $61A5,$01FB 
    db $10 
    dw $61A6,$81F3 
    db $00 
    dw $6186,$8003 
    db $00 
    dw $6184,$81F3 
    db $F0 
    dw $6166,$8003 
    db $F0 
    dw $6164 

Spitemaps_PirateNinja_36:
    dw $0005,$01EC 
    db $FE 
    dw $617C,$81F4 
    db $06 
    dw $618A,$8004 
    db $06 
    dw $6188,$81F4 
    db $F6 
    dw $616A,$8004 
    db $F6 
    dw $6168 

Spitemaps_PirateNinja_37:
    dw $0007,$01E8 
    db $FA 
    dw $A1A7,$8000 
    db $F2 
    dw $A1AA,$81F0 
    db $F2 
    dw $A1A8,$0008 
    db $02 
    dw $A1B4,$01F0 
    db $02 
    dw $A1B1,$01E8 
    db $02 
    dw $A1B0,$81F8 
    db $02 
    dw $A1A2 

Spitemaps_PirateNinja_38:
    dw $0004,$81FA 
    db $F0 
    dw $A182,$81EA 
    db $F0 
    dw $A180,$81FA 
    db $00 
    dw $A162,$81EA 
    db $00 
    dw $A160 

Spitemaps_PirateNinja_39:
    dw $0006,$01F4 
    db $E8 
    dw $A1A5,$01FC 
    db $E8 
    dw $A1A6,$81FC 
    db $F0 
    dw $A186,$81EC 
    db $F0 
    dw $A184,$81FC 
    db $00 
    dw $A166,$81EC 
    db $00 
    dw $A164 

Spitemaps_PirateNinja_3A:
    dw $0005,$000C 
    db $FA 
    dw $A17C,$81FC 
    db $EA 
    dw $A18A,$81EC 
    db $EA 
    dw $A188,$81FC 
    db $FA 
    dw $A16A,$81EC 
    db $FA 
    dw $A168 

Spitemaps_PirateNinja_3B:
    dw $0007,$000F 
    db $FE 
    dw $61A7,$81EF 
    db $FE 
    dw $61AA,$81FF 
    db $FE 
    dw $61A8,$01EF 
    db $F6 
    dw $61B4,$0007 
    db $F6 
    dw $61B1,$000F 
    db $F6 
    dw $61B0,$81F7 
    db $EE 
    dw $61A2 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spitemaps_SpacePirate_B2C9FC:
    dw $0008,$01EF 
    db $FD 
    dw $214D,$01EF 
    db $F5 
    dw $213D,$01EF 
    db $ED 
    dw $212D,$81F4 
    db $F3 
    dw $2100,$81F8 
    db $F0 
    dw $212E,$81F1 
    db $EA 
    dw $210E,$01EF 
    db $E6 
    dw $213D,$01EF 
    db $DE 
    dw $212D 

UNUSED_Spitemaps_SpacePirate_B2CA26:
    dw $0009,$01FC 
    db $F3 
    dw $214F,$01F4 
    db $F4 
    dw $214E,$01EF 
    db $F9 
    dw $214D,$01EF 
    db $F1 
    dw $213D,$01EF 
    db $E9 
    dw $212D,$81F8 
    db $F0 
    dw $212E,$81F1 
    db $EA 
    dw $210E,$01EF 
    db $EA 
    dw $213D,$01EF 
    db $E2 
    dw $212D 

UNUSED_Spitemaps_SpacePirate_B2CA55:
    dw $0008,$01EF 
    db $F3 
    dw $214D,$01EF 
    db $EB 
    dw $213D,$01EF 
    db $E3 
    dw $212D,$01FB 
    db $F3 
    dw $214F,$01F3 
    db $F3 
    dw $214E,$81F8 
    db $F0 
    dw $212E,$81F1 
    db $EA 
    dw $210E,$01EF 
    db $E1 
    dw $212D 

UNUSED_Spitemaps_SpacePirate_B2CA7F:
    dw $000A,$01FB 
    db $F1 
    dw $214F,$01F3 
    db $F0 
    dw $214E,$01EF 
    db $ED 
    dw $214D,$01EF 
    db $E5 
    dw $213D,$01EF 
    db $DD 
    dw $212D,$81F8 
    db $F0 
    dw $212E,$81F1 
    db $EA 
    dw $210E,$01EF 
    db $EF 
    dw $213D,$01EF 
    db $F7 
    dw $214D,$81F1 
    db $F0 
    dw $2100 

UNUSED_Spitemaps_SpacePirate_B2CAB3:
    dw $0009,$81F4 
    db $EB 
    dw $E105,$01EF 
    db $EB 
    dw $214D,$01EF 
    db $E3 
    dw $213D,$01EF 
    db $DB 
    dw $212D,$81F8 
    db $F0 
    dw $212E,$81F1 
    db $EA 
    dw $210E,$01EF 
    db $F1 
    dw $213D,$01EF 
    db $F9 
    dw $214D,$81F1 
    db $F2 
    dw $2100 

UNUSED_Spitemaps_SpacePirate_B2CAE2:
    dw $000A,$01F4 
    db $19 
    dw $2146,$01F7 
    db $13 
    dw $2119,$01F7 
    db $0B 
    dw $2109,$81F9 
    db $FE 
    dw $2107,$01EC 
    db $19 
    dw $2145,$01F5 
    db $FE 
    dw $2131,$01F5 
    db $F6 
    dw $2121,$81F6 
    db $F5 
    dw $E10C,$01F4 
    db $05 
    dw $2146,$01EC 
    db $05 
    dw $2145 

UNUSED_Spitemaps_SpacePirate_B2CB16:
    dw $000C,$0000 
    db $FD 
    dw $2149,$01F8 
    db $FF 
    dw $2148,$01F4 
    db $14 
    dw $2146,$01EC 
    db $14 
    dw $2145,$0000 
    db $FB 
    dw $2149,$01F8 
    db $F9 
    dw $2148,$01F5 
    db $0D 
    dw $211A,$01F5 
    db $05 
    dw $210A,$01F5 
    db $02 
    dw $2131,$01F5 
    db $FA 
    dw $2121,$01F4 
    db $09 
    dw $2146,$01EC 
    db $09 
    dw $2145 

UNUSED_Spitemaps_SpacePirate_B2CB54:
    dw $000C,$0000 
    db $F9 
    dw $2149,$01F8 
    db $FB 
    dw $2148,$01F4 
    db $10 
    dw $2146,$01EC 
    db $10 
    dw $2145,$0000 
    db $FB 
    dw $2149,$01F8 
    db $F9 
    dw $2148,$01F5 
    db $09 
    dw $211A,$01F5 
    db $01 
    dw $210A,$01F5 
    db $06 
    dw $2131,$01F5 
    db $FE 
    dw $2121,$01F4 
    db $0D 
    dw $2146,$01EC 
    db $0D 
    dw $2145 

UNUSED_Spitemaps_SpacePirate_B2CB92:
    dw $000C,$01F3 
    db $03 
    dw $2131,$01F3 
    db $FB 
    dw $2121,$01F4 
    db $0A 
    dw $2146,$01EC 
    db $0A 
    dw $2145,$0000 
    db $FC 
    dw $2149,$01F8 
    db $FA 
    dw $2148,$0000 
    db $FE 
    dw $2149,$01F8 
    db $00 
    dw $2148,$01F4 
    db $12 
    dw $2146,$01EC 
    db $12 
    dw $2145,$01F5 
    db $0C 
    dw $211A,$01F5 
    db $04 
    dw $210A 

UNUSED_Spitemaps_SpacePirate_B2CBD0:
    dw $000A,$01F5 
    db $00 
    dw $2131,$01F5 
    db $F8 
    dw $2121,$81F7 
    db $F6 
    dw $E10C,$01F4 
    db $07 
    dw $2146,$01EC 
    db $07 
    dw $2145,$01F4 
    db $16 
    dw $2146,$01F6 
    db $10 
    dw $2119,$01F6 
    db $08 
    dw $2109,$81F8 
    db $FD 
    dw $2107,$01EC 
    db $16 
    dw $2145 
endif ; !FEATURE_KEEP_UNREFERENCED

Spitemaps_PirateNinja_3C:
    dw $0014,$0007 
    db $FE 
    dw $615D,$0007 
    db $F6 
    dw $615C,$0007 
    db $EE 
    dw $615B,$01FF 
    db $14 
    dw $615A,$01FF 
    db $FE 
    dw $6157,$01FF 
    db $0C 
    dw $6159,$01FF 
    db $06 
    dw $6158,$01FF 
    db $F8 
    dw $6156,$01FF 
    db $F0 
    dw $6155,$01FF 
    db $E8 
    dw $6154,$01F0 
    db $00 
    dw $215D,$01F0 
    db $F8 
    dw $215C,$01F0 
    db $F0 
    dw $215B,$01F8 
    db $18 
    dw $215A,$01F8 
    db $00 
    dw $2157,$01F8 
    db $10 
    dw $2159,$01F8 
    db $08 
    dw $2158,$01F8 
    db $F8 
    dw $2156,$01F8 
    db $F0 
    dw $2155,$01F8 
    db $E8 
    dw $2154 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spitemaps_SpacePirate_B2CC6A:
    dw $000D,$81F9 
    db $FC 
    dw $2127,$8001 
    db $FC 
    dw $2128,$01F1 
    db $F7 
    dw $214D,$01F1 
    db $EF 
    dw $213D,$01F1 
    db $E7 
    dw $212D,$0006 
    db $FB 
    dw $6112,$0006 
    db $F3 
    dw $6102,$81FA 
    db $EB 
    dw $210E,$0003 
    db $F9 
    dw $6142,$01FB 
    db $F1 
    dw $6141,$0003 
    db $F1 
    dw $6140,$01FB 
    db $F9 
    dw $6147,$81F1 
    db $F0 
    dw $2100 

UNUSED_Spitemaps_SpacePirate_B2CCAD:
    dw $000E,$01F0 
    db $F7 
    dw $214D,$01F0 
    db $EF 
    dw $213D,$01F0 
    db $E7 
    dw $212D,$81FE 
    db $EB 
    dw $610E,$81F1 
    db $F0 
    dw $2100,$0003 
    db $F9 
    dw $6142,$01FB 
    db $F1 
    dw $6141,$0003 
    db $F1 
    dw $6140,$01FB 
    db $F9 
    dw $6147,$0008 
    db $FD 
    dw $A14D,$0008 
    db $05 
    dw $A13D,$0008 
    db $0D 
    dw $A12D,$0006 
    db $FB 
    dw $6112,$0006 
    db $F3 
    dw $6102 

UNUSED_Spitemaps_SpacePirate_B2CCF5:
    dw $0014,$0000 
    db $F2 
    dw $614F,$0008 
    db $F1 
    dw $614E,$000C 
    db $EE 
    dw $614D,$000C 
    db $E6 
    dw $613D,$000C 
    db $DE 
    dw $612D,$81FB 
    db $F1 
    dw $612E,$8002 
    db $EB 
    dw $610E,$000C 
    db $F0 
    dw $613D,$000C 
    db $F8 
    dw $614D,$8002 
    db $F1 
    dw $6100,$81F9 
    db $FF 
    dw $6107,$01F4 
    db $11 
    dw $6144,$01F4 
    db $09 
    dw $6143,$0001 
    db $09 
    dw $A149,$01F9 
    db $09 
    dw $A148,$81FC 
    db $FF 
    dw $6107,$0003 
    db $0B 
    dw $A149,$01FB 
    db $0B 
    dw $A148,$01FA 
    db $13 
    dw $6144,$01FA 
    db $0B 
    dw $6143 

UNUSED_Spitemaps_SpacePirate_B2CD5B:
    dw $0010,$0008 
    db $FC 
    dw $614D,$0009 
    db $F4 
    dw $613D,$000A 
    db $EC 
    dw $612D,$000B 
    db $FD 
    dw $614D,$000C 
    db $F5 
    dw $613D,$000D 
    db $ED 
    dw $612D,$81FD 
    db $F3 
    dw $6100,$81F9 
    db $F0 
    dw $612E,$8000 
    db $EA 
    dw $610E,$01FA 
    db $0B 
    dw $6144,$01FA 
    db $03 
    dw $6143,$01FE 
    db $09 
    dw $6146,$0006 
    db $09 
    dw $6145,$01FB 
    db $FE 
    dw $6149,$0003 
    db $FD 
    dw $6148,$81FD 
    db $FF 
    dw $6122 

UNUSED_Spitemaps_SpacePirate_B2CDAD:
    dw $0008,$0009 
    db $FD 
    dw $614D,$0009 
    db $F5 
    dw $613D,$0009 
    db $ED 
    dw $612D,$81FC 
    db $F3 
    dw $6100,$81F8 
    db $F0 
    dw $612E,$81FF 
    db $EA 
    dw $610E,$0009 
    db $E6 
    dw $613D,$0009 
    db $DE 
    dw $612D 

UNUSED_Spitemaps_SpacePirate_B2CDD7:
    dw $0009,$01FC 
    db $F3 
    dw $614F,$0004 
    db $F4 
    dw $614E,$0009 
    db $F9 
    dw $614D,$0009 
    db $F1 
    dw $613D,$0009 
    db $E9 
    dw $612D,$81F8 
    db $F0 
    dw $612E,$81FF 
    db $EA 
    dw $610E,$0009 
    db $EA 
    dw $613D,$0009 
    db $E2 
    dw $612D 

UNUSED_Spitemaps_SpacePirate_B2CE06:
    dw $0008,$0009 
    db $F3 
    dw $614D,$0009 
    db $EB 
    dw $613D,$0009 
    db $E3 
    dw $612D,$01FD 
    db $F3 
    dw $614F,$0005 
    db $F3 
    dw $614E,$81F8 
    db $F0 
    dw $612E,$81FF 
    db $EA 
    dw $610E,$0009 
    db $E1 
    dw $612D 

UNUSED_Spitemaps_SpacePirate_B2CE30:
    dw $000A,$01FD 
    db $F1 
    dw $614F,$0005 
    db $F0 
    dw $614E,$0009 
    db $ED 
    dw $614D,$0009 
    db $E5 
    dw $613D,$0009 
    db $DD 
    dw $612D,$81F8 
    db $F0 
    dw $612E,$81FF 
    db $EA 
    dw $610E,$0009 
    db $EF 
    dw $613D,$0009 
    db $F7 
    dw $614D,$81FF 
    db $F0 
    dw $6100 

UNUSED_Spitemaps_SpacePirate_B2CE64:
    dw $0009,$81FC 
    db $EB 
    dw $A105,$0009 
    db $EB 
    dw $614D,$0009 
    db $E3 
    dw $613D,$0009 
    db $DB 
    dw $612D,$81F8 
    db $F0 
    dw $612E,$81FF 
    db $EA 
    dw $610E,$0009 
    db $F1 
    dw $613D,$0009 
    db $F9 
    dw $614D,$81FF 
    db $F2 
    dw $6100 

UNUSED_Spitemaps_SpacePirate_B2CE93:
    dw $000A,$0004 
    db $19 
    dw $6146,$0001 
    db $13 
    dw $6119,$0001 
    db $0B 
    dw $6109,$81F7 
    db $FE 
    dw $6107,$000C 
    db $19 
    dw $6145,$0003 
    db $FE 
    dw $6131,$0003 
    db $F6 
    dw $6121,$81FA 
    db $F5 
    dw $A10C,$0004 
    db $05 
    dw $6146,$000C 
    db $05 
    dw $6145 

UNUSED_Spitemaps_SpacePirate_B2CEC7:
    dw $000C,$01F8 
    db $FD 
    dw $6149,$0000 
    db $FF 
    dw $6148,$0004 
    db $14 
    dw $6146,$000C 
    db $14 
    dw $6145,$01F8 
    db $FB 
    dw $6149,$0000 
    db $F9 
    dw $6148,$0003 
    db $0D 
    dw $611A,$0003 
    db $05 
    dw $610A,$0003 
    db $02 
    dw $6131,$0003 
    db $FA 
    dw $6121,$0004 
    db $09 
    dw $6146,$000C 
    db $09 
    dw $6145 

UNUSED_Spitemaps_SpacePirate_B2CF05:
    dw $000C,$01F8 
    db $F9 
    dw $6149,$0000 
    db $FB 
    dw $6148,$0004 
    db $10 
    dw $6146,$000C 
    db $10 
    dw $6145,$01F8 
    db $FB 
    dw $6149,$0000 
    db $F9 
    dw $6148,$0003 
    db $09 
    dw $611A,$0003 
    db $01 
    dw $610A,$0003 
    db $06 
    dw $6131,$0003 
    db $FE 
    dw $6121,$0004 
    db $0D 
    dw $6146,$000C 
    db $0D 
    dw $6145 

UNUSED_Spitemaps_SpacePirate_B2CF43:
    dw $000C,$0005 
    db $03 
    dw $6131,$0005 
    db $FB 
    dw $6121,$0004 
    db $0A 
    dw $6146,$000C 
    db $0A 
    dw $6145,$01F8 
    db $FC 
    dw $6149,$0000 
    db $FA 
    dw $6148,$01F8 
    db $FE 
    dw $6149,$0000 
    db $00 
    dw $6148,$0004 
    db $12 
    dw $6146,$000C 
    db $12 
    dw $6145,$0003 
    db $0C 
    dw $611A,$0003 
    db $04 
    dw $610A 

UNUSED_Spitemaps_SpacePirate_B2CF81:
    dw $000A,$0003 
    db $00 
    dw $6131,$0003 
    db $F8 
    dw $6121,$81F9 
    db $F6 
    dw $A10C,$0004 
    db $07 
    dw $6146,$000C 
    db $07 
    dw $6145,$0004 
    db $16 
    dw $6146,$0002 
    db $10 
    dw $6119,$0002 
    db $08 
    dw $6109,$81F8 
    db $FD 
    dw $6107,$000C 
    db $16 
    dw $6145 

UNUSED_Spitemaps_SpacePirate_B2CFB5:
    dw $000D,$81F7 
    db $FC 
    dw $6127,$81EF 
    db $FC 
    dw $6128,$0007 
    db $F7 
    dw $614D,$0007 
    db $EF 
    dw $613D,$0007 
    db $E7 
    dw $612D,$01F2 
    db $FB 
    dw $2112,$01F2 
    db $F3 
    dw $2102,$81F6 
    db $EB 
    dw $610E,$01F5 
    db $F9 
    dw $2142,$01FD 
    db $F1 
    dw $2141,$01F5 
    db $F1 
    dw $2140,$01FD 
    db $F9 
    dw $2147,$81FF 
    db $F0 
    dw $6100 

UNUSED_Spitemaps_SpacePirate_B2CFF8:
    dw $000E,$0008 
    db $F7 
    dw $614D,$0008 
    db $EF 
    dw $613D,$0008 
    db $E7 
    dw $612D,$81F2 
    db $EB 
    dw $210E,$81FF 
    db $F0 
    dw $6100,$01F5 
    db $F9 
    dw $2142,$01FD 
    db $F1 
    dw $2141,$01F5 
    db $F1 
    dw $2140,$01FD 
    db $F9 
    dw $2147,$01F0 
    db $FD 
    dw $E14D,$01F0 
    db $05 
    dw $E13D,$01F0 
    db $0D 
    dw $E12D,$01F2 
    db $FB 
    dw $2112,$01F2 
    db $F3 
    dw $2102 

UNUSED_Spitemaps_SpacePirate_B2D040:
    dw $0014,$01F8 
    db $F2 
    dw $214F,$01F0 
    db $F1 
    dw $214E,$01EC 
    db $EE 
    dw $214D,$01EC 
    db $E6 
    dw $213D,$01EC 
    db $DE 
    dw $212D,$81F5 
    db $F1 
    dw $212E,$81EE 
    db $EB 
    dw $210E,$01EC 
    db $F0 
    dw $213D,$01EC 
    db $F8 
    dw $214D,$81EE 
    db $F1 
    dw $2100,$81F7 
    db $FF 
    dw $2107,$0004 
    db $11 
    dw $2144,$0004 
    db $09 
    dw $2143,$01F7 
    db $09 
    dw $E149,$01FF 
    db $09 
    dw $E148,$81F4 
    db $FF 
    dw $2107,$01F5 
    db $0B 
    dw $E149,$01FD 
    db $0B 
    dw $E148,$01FE 
    db $13 
    dw $2144,$01FE 
    db $0B 
    dw $2143 

UNUSED_Spitemaps_SpacePirate_B2D0A6:
    dw $0010,$01F0 
    db $FC 
    dw $214D,$01EF 
    db $F4 
    dw $213D,$01EE 
    db $EC 
    dw $212D,$01ED 
    db $FD 
    dw $214D,$01EC 
    db $F5 
    dw $213D,$01EB 
    db $ED 
    dw $212D,$81F3 
    db $F3 
    dw $2100,$81F7 
    db $F0 
    dw $212E,$81F0 
    db $EA 
    dw $210E,$01FE 
    db $0B 
    dw $2144,$01FE 
    db $03 
    dw $2143,$01FA 
    db $09 
    dw $2146,$01F2 
    db $09 
    dw $2145,$01FD 
    db $FE 
    dw $2149,$01F5 
    db $FD 
    dw $2148,$81F3 
    db $FF 
    dw $2122 

UNUSED_Spitemaps_SpacePirate_B2D0F8:
    dw $000A,$01F5 
    db $13 
    dw $2130,$01F4 
    db $0B 
    dw $2120,$01F2 
    db $18 
    dw $2136,$01EB 
    db $18 
    dw $2135,$81F5 
    db $00 
    dw $2107,$0006 
    db $18 
    dw $2144,$0006 
    db $10 
    dw $2143,$81FE 
    db $0B 
    dw $2122,$01FD 
    db $08 
    dw $211B,$01FD 
    db $00 
    dw $210B 

UNUSED_Spitemaps_SpacePirate_B2D12C:
    dw $000B,$01F9 
    db $12 
    dw $2131,$01F9 
    db $0A 
    dw $2121,$01F7 
    db $18 
    dw $2126,$01EF 
    db $18 
    dw $2125,$01FA 
    db $06 
    dw $2119,$01FA 
    db $FE 
    dw $2109,$0005 
    db $17 
    dw $2144,$0005 
    db $0F 
    dw $2143,$81FA 
    db $08 
    dw $2122,$01FB 
    db $06 
    dw $211A,$01FB 
    db $FE 
    dw $210A 

UNUSED_Spitemaps_SpacePirate_B2D165:
    dw $000C,$01FD 
    db $18 
    dw $2126,$01F5 
    db $18 
    dw $2125,$01FE 
    db $14 
    dw $2131,$01FE 
    db $0C 
    dw $2121,$01FC 
    db $06 
    dw $211A,$01FC 
    db $FE 
    dw $210A,$0004 
    db $18 
    dw $2144,$0004 
    db $10 
    dw $2143,$01FD 
    db $10 
    dw $211B,$01FD 
    db $08 
    dw $210B,$01FB 
    db $04 
    dw $2119,$01FB 
    db $FC 
    dw $2109 

UNUSED_Spitemaps_SpacePirate_B2D1A3:
    dw $000B,$01FA 
    db $16 
    dw $2126,$01F2 
    db $16 
    dw $2125,$0004 
    db $18 
    dw $2146,$01FC 
    db $18 
    dw $2145,$0001 
    db $13 
    dw $2134,$0001 
    db $0B 
    dw $2124,$01FC 
    db $07 
    dw $211B,$01FD 
    db $FF 
    dw $210B,$81F4 
    db $00 
    dw $2107,$01F8 
    db $12 
    dw $2134,$01F8 
    db $0A 
    dw $2124 

UNUSED_Spitemaps_SpacePirate_B2D1DC:
    dw $000A,$01FA 
    db $00 
    dw $210A,$01F2 
    db $18 
    dw $2136,$01EB 
    db $18 
    dw $2135,$0006 
    db $18 
    dw $2144,$0006 
    db $10 
    dw $2143,$81FB 
    db $0A 
    dw $2122,$01F9 
    db $08 
    dw $211B,$01F4 
    db $13 
    dw $2130,$01F3 
    db $0B 
    dw $2120,$81F4 
    db $00 
    dw $2107 

UNUSED_Spitemaps_SpacePirate_B2D210:
    dw $000B,$01F7 
    db $13 
    dw $2131,$01F7 
    db $0B 
    dw $2121,$0005 
    db $17 
    dw $2144,$0005 
    db $0F 
    dw $2143,$81FA 
    db $08 
    dw $2122,$01FB 
    db $06 
    dw $211A,$01FB 
    db $FE 
    dw $210A,$01F6 
    db $18 
    dw $2126,$01EE 
    db $18 
    dw $2125,$01F8 
    db $07 
    dw $2119,$01F8 
    db $FF 
    dw $2109 

UNUSED_Spitemaps_SpacePirate_B2D249:
    dw $000C,$01FB 
    db $06 
    dw $2119,$01FB 
    db $FE 
    dw $2109,$0002 
    db $19 
    dw $2144,$0002 
    db $11 
    dw $2143,$01FC 
    db $11 
    dw $211B,$01FC 
    db $09 
    dw $210B,$01FD 
    db $18 
    dw $2126,$01F5 
    db $18 
    dw $2125,$01FE 
    db $15 
    dw $2131,$01FE 
    db $0D 
    dw $2121,$01FC 
    db $08 
    dw $211A,$01FC 
    db $00 
    dw $210A 

UNUSED_Spitemaps_SpacePirate_B2D287:
    dw $000B,$01FA 
    db $16 
    dw $2126,$01F2 
    db $16 
    dw $2125,$81F6 
    db $00 
    dw $2107,$01F8 
    db $12 
    dw $2134,$01F8 
    db $0A 
    dw $2124,$0004 
    db $18 
    dw $2146,$01FC 
    db $18 
    dw $2145,$0001 
    db $13 
    dw $2134,$0001 
    db $0B 
    dw $2124,$01FC 
    db $07 
    dw $211B,$01FD 
    db $FF 
    dw $210B 
endif ; !FEATURE_KEEP_UNREFERENCED

Spitemaps_PirateNinja_3D:
    dw $000A,$01F8 
    db $11 
    dw $2134,$01FC 
    db $FE 
    dw $2109,$01FC 
    db $06 
    dw $2119,$0003 
    db $15 
    dw $2126,$01FC 
    db $15 
    dw $2125,$81F5 
    db $FF 
    dw $2107,$81FB 
    db $0A 
    dw $2122,$01FA 
    db $15 
    dw $2126,$01F2 
    db $15 
    dw $2125,$01F8 
    db $09 
    dw $2124 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spitemaps_SpacePirate_B2D2F4:
    dw $000A,$81F7 
    db $FF 
    dw $2107,$0004 
    db $11 
    dw $2144,$0004 
    db $09 
    dw $2143,$01F7 
    db $09 
    dw $E149,$01FF 
    db $09 
    dw $E148,$81F4 
    db $FF 
    dw $2107,$01F5 
    db $0B 
    dw $E149,$01FD 
    db $0B 
    dw $E148,$01FE 
    db $13 
    dw $2144,$01FE 
    db $0B 
    dw $2143 

UNUSED_Spitemaps_SpacePirate_B2D328:
    dw $0003,$0004 
    db $FC 
    dw $214C,$01FC 
    db $FC 
    dw $214B,$01F4 
    db $FC 
    dw $214A 

UNUSED_Spitemaps_SpacePirate_B2D339:
    dw $0002,$81FC 
    db $F8 
    dw $2128,$81F4 
    db $F8 
    dw $2127 

UNUSED_Spitemaps_SpacePirate_B2D345:
    dw $0003,$01FC 
    db $F4 
    dw $E14D,$01FC 
    db $FC 
    dw $E13D,$01FC 
    db $04 
    dw $E12D 

UNUSED_Spitemaps_SpacePirate_B2D356:
    dw $0002,$81F4 
    db $F8 
    dw $E12B,$81FC 
    db $F8 
    dw $E12A 

UNUSED_Spitemaps_SpacePirate_B2D362:
    dw $0003,$01F4 
    db $FC 
    dw $E14C,$01FC 
    db $FC 
    dw $E14B,$0004 
    db $FC 
    dw $E14A 

UNUSED_Spitemaps_SpacePirate_B2D373:
    dw $0002,$81F4 
    db $F8 
    dw $E128,$81FC 
    db $F8 
    dw $E127 

UNUSED_Spitemaps_SpacePirate_B2D37F:
    dw $0003,$01FC 
    db $04 
    dw $214D,$01FC 
    db $FC 
    dw $213D,$01FC 
    db $F4 
    dw $212D 

UNUSED_Spitemaps_SpacePirate_B2D390:
    dw $0002,$81FC 
    db $F8 
    dw $212B,$81F4 
    db $F8 
    dw $212A 
endif ; !FEATURE_KEEP_UNREFERENCED

Spitemaps_PirateNinja_3E:
    dw $000A,$01FC 
    db $08 
    dw $2119,$01FC 
    db $00 
    dw $2109,$81F4 
    db $01 
    dw $2107,$01F6 
    db $09 
    dw $2124,$01F7 
    db $11 
    dw $2134,$0002 
    db $15 
    dw $2126,$01FC 
    db $15 
    dw $2125,$81FA 
    db $0B 
    dw $2122,$01F9 
    db $15 
    dw $2126,$01F2 
    db $15 
    dw $2125 

Spitemaps_PirateNinja_3F:
    dw $0005,$81EA 
    db $00 
    dw $2127,$81F2 
    db $00 
    dw $2128,$01FB 
    db $FB 
    dw $2113,$01FB 
    db $F3 
    dw $2103,$81F8 
    db $F0 
    dw $212E 

Spitemaps_PirateNinja_40:
    dw $0005,$8006 
    db $00 
    dw $6127,$81FE 
    db $00 
    dw $6128,$01FD 
    db $FB 
    dw $6113,$01FD 
    db $F3 
    dw $6103,$81F8 
    db $F0 
    dw $612E 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spitemaps_SpacePirate_B2D406:
    dw $000A,$0003 
    db $13 
    dw $6130,$0004 
    db $0B 
    dw $6120,$0006 
    db $18 
    dw $6136,$000D 
    db $18 
    dw $6135,$81FB 
    db $00 
    dw $6107,$01F2 
    db $18 
    dw $6144,$01F2 
    db $10 
    dw $6143,$81F2 
    db $0B 
    dw $6122,$01FB 
    db $08 
    dw $611B,$01FB 
    db $00 
    dw $610B 

UNUSED_Spitemaps_SpacePirate_B2D43A:
    dw $000B,$01FF 
    db $12 
    dw $6131,$01FF 
    db $0A 
    dw $6121,$0001 
    db $18 
    dw $6126,$0009 
    db $18 
    dw $6125,$01FE 
    db $06 
    dw $6119,$01FE 
    db $FE 
    dw $6109,$01F3 
    db $17 
    dw $6144,$01F3 
    db $0F 
    dw $6143,$81F6 
    db $08 
    dw $6122,$01FD 
    db $06 
    dw $611A,$01FD 
    db $FE 
    dw $610A 

UNUSED_Spitemaps_SpacePirate_B2D473:
    dw $000C,$01FB 
    db $18 
    dw $6126,$0003 
    db $18 
    dw $6125,$01FA 
    db $14 
    dw $6131,$01FA 
    db $0C 
    dw $6121,$01FC 
    db $06 
    dw $611A,$01FC 
    db $FE 
    dw $610A,$01F4 
    db $18 
    dw $6144,$01F4 
    db $10 
    dw $6143,$01FB 
    db $10 
    dw $611B,$01FB 
    db $08 
    dw $610B,$01FD 
    db $04 
    dw $6119,$01FD 
    db $FC 
    dw $6109 

UNUSED_Spitemaps_SpacePirate_B2D4B1:
    dw $000B,$01FE 
    db $16 
    dw $6126,$0006 
    db $16 
    dw $6125,$01F4 
    db $18 
    dw $6146,$01FC 
    db $18 
    dw $6145,$01F7 
    db $13 
    dw $6134,$01F7 
    db $0B 
    dw $6124,$01FC 
    db $07 
    dw $611B,$01FB 
    db $FF 
    dw $610B,$81FC 
    db $00 
    dw $6107,$0000 
    db $12 
    dw $6134,$0000 
    db $0A 
    dw $6124 

UNUSED_Spitemaps_SpacePirate_B2D4EA:
    dw $000A,$01FE 
    db $00 
    dw $610A,$0006 
    db $18 
    dw $6136,$000D 
    db $18 
    dw $6135,$01F2 
    db $18 
    dw $6144,$01F2 
    db $10 
    dw $6143,$81F5 
    db $0A 
    dw $6122,$01FF 
    db $08 
    dw $611B,$0004 
    db $13 
    dw $6130,$0005 
    db $0B 
    dw $6120,$81FC 
    db $00 
    dw $6107 

UNUSED_Spitemaps_SpacePirate_B2D51E:
    dw $000B,$0001 
    db $13 
    dw $6131,$0001 
    db $0B 
    dw $6121,$01F3 
    db $17 
    dw $6144,$01F3 
    db $0F 
    dw $6143,$81F6 
    db $08 
    dw $6122,$01FD 
    db $06 
    dw $611A,$01FD 
    db $FE 
    dw $610A,$0002 
    db $18 
    dw $6126,$000A 
    db $18 
    dw $6125,$0000 
    db $07 
    dw $6119,$0000 
    db $FF 
    dw $6109 

UNUSED_Spitemaps_SpacePirate_B2D557:
    dw $000C,$01FD 
    db $06 
    dw $6119,$01FD 
    db $FE 
    dw $6109,$01F6 
    db $19 
    dw $6144,$01F6 
    db $11 
    dw $6143,$01FC 
    db $11 
    dw $611B,$01FC 
    db $09 
    dw $610B,$01FB 
    db $18 
    dw $6126,$0003 
    db $18 
    dw $6125,$01FA 
    db $15 
    dw $6131,$01FA 
    db $0D 
    dw $6121,$01FC 
    db $08 
    dw $611A,$01FC 
    db $00 
    dw $610A 

UNUSED_Spitemaps_SpacePirate_B2D595:
    dw $000B,$01FE 
    db $16 
    dw $6126,$0006 
    db $16 
    dw $6125,$81FA 
    db $00 
    dw $6107,$0000 
    db $12 
    dw $6134,$0000 
    db $0A 
    dw $6124,$01F4 
    db $18 
    dw $6146,$01FC 
    db $18 
    dw $6145,$01F7 
    db $13 
    dw $6134,$01F7 
    db $0B 
    dw $6124,$01FC 
    db $07 
    dw $611B,$01FB 
    db $FF 
    dw $610B 
endif ; !FEATURE_KEEP_UNREFERENCED

Spitemaps_PirateNinja_41:
    dw $000A,$0000 
    db $11 
    dw $6134,$01FC 
    db $FE 
    dw $6109,$01FC 
    db $06 
    dw $6119,$01F5 
    db $15 
    dw $6126,$01FC 
    db $15 
    dw $6125,$81FB 
    db $FF 
    dw $6107,$81F5 
    db $0A 
    dw $6122,$01FE 
    db $15 
    dw $6126,$0006 
    db $15 
    dw $6125,$0000 
    db $09 
    dw $6124 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spitemaps_SpacePirate_B2D602:
    dw $000A,$81F9 
    db $FF 
    dw $6107,$01F4 
    db $11 
    dw $6144,$01F4 
    db $09 
    dw $6143,$0001 
    db $09 
    dw $A149,$01F9 
    db $09 
    dw $A148,$81FC 
    db $FF 
    dw $6107,$0003 
    db $0B 
    dw $A149,$01FB 
    db $0B 
    dw $A148,$01FA 
    db $13 
    dw $6144,$01FA 
    db $0B 
    dw $6143 

UNUSED_Spitemaps_SpacePirate_B2D636:
    dw $0003,$01F4 
    db $FC 
    dw $614C,$01FC 
    db $FC 
    dw $614B,$0004 
    db $FC 
    dw $614A 

UNUSED_Spitemaps_SpacePirate_B2D647:
    dw $0002,$81F4 
    db $F8 
    dw $6128,$81FC 
    db $F8 
    dw $6127 

UNUSED_Spitemaps_SpacePirate_B2D653:
    dw $0003,$01FC 
    db $F4 
    dw $A14D,$01FC 
    db $FC 
    dw $A13D,$01FC 
    db $04 
    dw $A12D 

UNUSED_Spitemaps_SpacePirate_B2D664:
    dw $0002,$81FC 
    db $F8 
    dw $A12B,$81F4 
    db $F8 
    dw $A12A 

UNUSED_Spitemaps_SpacePirate_B2D670:
    dw $0003,$0004 
    db $FC 
    dw $A14C,$01FC 
    db $FC 
    dw $A14B,$01F4 
    db $FC 
    dw $A14A 

UNUSED_Spitemaps_SpacePirate_B2D681:
    dw $0002,$81FC 
    db $F8 
    dw $A128,$81F4 
    db $F8 
    dw $A127 

UNUSED_Spitemaps_SpacePirate_B2D68D:
    dw $0003,$01FC 
    db $04 
    dw $614D,$01FC 
    db $FC 
    dw $613D,$01FC 
    db $F4 
    dw $612D 

UNUSED_Spitemaps_SpacePirate_B2D69E:
    dw $0002,$81F4 
    db $F8 
    dw $612B,$81FC 
    db $F8 
    dw $612A 
endif ; !FEATURE_KEEP_UNREFERENCED

Spitemaps_PirateNinja_42:
    dw $000A,$01FC 
    db $08 
    dw $6119,$01FC 
    db $00 
    dw $6109,$81FC 
    db $01 
    dw $6107,$0002 
    db $09 
    dw $6124,$0001 
    db $11 
    dw $6134,$01F6 
    db $15 
    dw $6126,$01FC 
    db $15 
    dw $6125,$81F6 
    db $0B 
    dw $6122,$01FF 
    db $15 
    dw $6126,$0006 
    db $15 
    dw $6125 

Spitemaps_PirateNinja_43:
    dw $0004,$0000 
    db $00 
    dw $6151,$01F8 
    db $00 
    dw $2151,$0000 
    db $F8 
    dw $6150,$01F8 
    db $F8 
    dw $2150 

Spitemaps_PirateNinja_44:
    dw $0004,$0000 
    db $00 
    dw $6153,$0000 
    db $F8 
    dw $6152,$01F8 
    db $00 
    dw $2153,$01F8 
    db $F8 
    dw $2152 

Spitemaps_PirateNinja_45:
    dw $0009,$01FB 
    db $FB 
    dw $2113,$01FB 
    db $F3 
    dw $2103,$0000 
    db $F8 
    dw $213F,$01F8 
    db $F8 
    dw $213E,$01FF 
    db $F0 
    dw $212F,$01F7 
    db $F0 
    dw $212E,$81EA 
    db $00 
    dw $2127,$81F2 
    db $00 
    dw $2128,$81F0 
    db $EB 
    dw $210E 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spitemaps_SpacePirate_B2D739:
    dw $0009,$01FA 
    db $FB 
    dw $2113,$01FA 
    db $F3 
    dw $2103,$0000 
    db $F8 
    dw $213F,$01F8 
    db $F8 
    dw $213E,$01FE 
    db $F0 
    dw $212F,$01F6 
    db $F0 
    dw $212E,$81E9 
    db $00 
    dw $2127,$81F1 
    db $00 
    dw $2128,$81EE 
    db $EC 
    dw $210E 

UNUSED_Spitemaps_SpacePirate_B2D768:
    dw $000A,$01F8 
    db $00 
    dw $214C,$01F0 
    db $00 
    dw $214B,$01E8 
    db $00 
    dw $214A,$01F9 
    db $FB 
    dw $2113,$01F9 
    db $F3 
    dw $2103,$01FF 
    db $F8 
    dw $213F,$01F7 
    db $F8 
    dw $213E,$01FD 
    db $F0 
    dw $212F,$01F5 
    db $F0 
    dw $212E,$81EC 
    db $ED 
    dw $210E 

UNUSED_Spitemaps_SpacePirate_B2D79C:
    dw $0009,$81EE 
    db $F8 
    dw $212B,$81E6 
    db $F8 
    dw $212A,$01F8 
    db $FB 
    dw $2113,$01F8 
    db $F3 
    dw $2103,$01FF 
    db $F8 
    dw $213F,$01F7 
    db $F8 
    dw $213E,$01FD 
    db $F0 
    dw $212F,$01F5 
    db $F0 
    dw $212E,$81EB 
    db $EE 
    dw $210E 

UNUSED_Spitemaps_SpacePirate_B2D7CB:
    dw $0009,$81EE 
    db $FA 
    dw $212B,$81E6 
    db $FA 
    dw $212A,$01F7 
    db $FA 
    dw $2113,$01F7 
    db $F3 
    dw $2103,$01FE 
    db $F8 
    dw $213F,$01F6 
    db $F8 
    dw $213E,$01FC 
    db $F0 
    dw $212F,$01F4 
    db $F0 
    dw $212E,$81EA 
    db $EF 
    dw $210E 

UNUSED_Spitemaps_SpacePirate_B2D7FA:
    dw $0009,$81EE 
    db $FB 
    dw $212B,$81E6 
    db $FB 
    dw $212A,$01F7 
    db $FB 
    dw $2113,$01F6 
    db $F4 
    dw $2103,$01FE 
    db $F8 
    dw $213F,$01F5 
    db $F9 
    dw $213E,$01FB 
    db $F1 
    dw $212F,$01F3 
    db $F1 
    dw $212E,$81EA 
    db $F0 
    dw $210E 
endif ; !FEATURE_KEEP_UNREFERENCED

Spitemaps_PirateNinja_46:
    dw $0009,$01FD 
    db $FB 
    dw $6113,$01FD 
    db $F3 
    dw $6103,$01F8 
    db $F8 
    dw $613F,$0000 
    db $F8 
    dw $613E,$01F9 
    db $F0 
    dw $612F,$0001 
    db $F0 
    dw $612E,$8006 
    db $00 
    dw $6127,$81FE 
    db $00 
    dw $6128,$8000 
    db $EB 
    dw $610E 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spitemaps_SpacePirate_B2D858:
    dw $0009,$01FE 
    db $FB 
    dw $6113,$01FE 
    db $F3 
    dw $6103,$01F8 
    db $F8 
    dw $613F,$0000 
    db $F8 
    dw $613E,$01FA 
    db $F0 
    dw $612F,$0002 
    db $F0 
    dw $612E,$8007 
    db $00 
    dw $6127,$81FF 
    db $00 
    dw $6128,$8002 
    db $EC 
    dw $610E 

UNUSED_Spitemaps_SpacePirate_B2D887:
    dw $000A,$0000 
    db $00 
    dw $614C,$0008 
    db $00 
    dw $614B,$0010 
    db $00 
    dw $614A,$01FF 
    db $FB 
    dw $6113,$01FF 
    db $F3 
    dw $6103,$01F9 
    db $F8 
    dw $613F,$0001 
    db $F8 
    dw $613E,$01FB 
    db $F0 
    dw $612F,$0003 
    db $F0 
    dw $612E,$8004 
    db $ED 
    dw $610E 

UNUSED_Spitemaps_SpacePirate_B2D8BB:
    dw $0009,$8002 
    db $F8 
    dw $612B,$800A 
    db $F8 
    dw $612A,$0000 
    db $FB 
    dw $6113,$0000 
    db $F3 
    dw $6103,$01F9 
    db $F8 
    dw $613F,$0001 
    db $F8 
    dw $613E,$01FB 
    db $F0 
    dw $612F,$0003 
    db $F0 
    dw $612E,$8005 
    db $EE 
    dw $610E 

UNUSED_Spitemaps_SpacePirate_B2D8EA:
    dw $0009,$8002 
    db $FA 
    dw $612B,$800A 
    db $FA 
    dw $612A,$0001 
    db $FA 
    dw $6113,$0001 
    db $F3 
    dw $6103,$01FA 
    db $F8 
    dw $613F,$0002 
    db $F8 
    dw $613E,$01FC 
    db $F0 
    dw $612F,$0004 
    db $F0 
    dw $612E,$8006 
    db $EF 
    dw $610E 

UNUSED_Spitemaps_SpacePirate_B2D919:
    dw $0009,$8002 
    db $FB 
    dw $612B,$800A 
    db $FB 
    dw $612A,$0001 
    db $FB 
    dw $6113,$0002 
    db $F4 
    dw $6103,$01FA 
    db $F8 
    dw $613F,$0003 
    db $F9 
    dw $613E,$01FD 
    db $F1 
    dw $612F,$0005 
    db $F1 
    dw $612E,$8006 
    db $F0 
    dw $610E 

UNUSED_Spitemaps_SpacePirate_B2D948:
    dw $000A,$81F4 
    db $00 
    dw $2107,$01FD 
    db $08 
    dw $211B,$01FD 
    db $00 
    dw $210B,$01ED 
    db $16 
    dw $2136,$8000 
    db $08 
    dw $217E,$01F1 
    db $13 
    dw $2130,$01F1 
    db $0B 
    dw $2120,$01E6 
    db $16 
    dw $2135,$000D 
    db $16 
    dw $2144,$000C 
    db $0E 
    dw $2143 

UNUSED_Spitemaps_SpacePirate_B2D97C:
    dw $000C,$000B 
    db $10 
    dw $218D,$000B 
    db $08 
    dw $217D,$0008 
    db $09 
    dw $216D,$0000 
    db $09 
    dw $216C,$01F9 
    db $12 
    dw $2131,$01F9 
    db $0A 
    dw $2121,$01F7 
    db $18 
    dw $2126,$01EF 
    db $18 
    dw $2125,$01FA 
    db $06 
    dw $2119,$01FA 
    db $FE 
    dw $2109,$01FC 
    db $06 
    dw $211A,$01FC 
    db $FE 
    dw $210A 

UNUSED_Spitemaps_SpacePirate_B2D9BA:
    dw $000C,$01FC 
    db $06 
    dw $211A,$01FC 
    db $FE 
    dw $210A,$01F9 
    db $05 
    dw $2119,$01FD 
    db $18 
    dw $2126,$01FE 
    db $14 
    dw $2131,$01FE 
    db $0C 
    dw $2121,$01F9 
    db $FD 
    dw $2109,$01F5 
    db $18 
    dw $2125,$0001 
    db $09 
    dw $216F,$01F9 
    db $09 
    dw $216E,$0005 
    db $11 
    dw $2144,$0005 
    db $09 
    dw $2143 

UNUSED_Spitemaps_SpacePirate_B2D9F8:
    dw $000B,$01FA 
    db $14 
    dw $2146,$01F2 
    db $14 
    dw $2145,$0006 
    db $18 
    dw $2146,$01FE 
    db $18 
    dw $2145,$0003 
    db $13 
    dw $2134,$0003 
    db $0B 
    dw $2124,$01FE 
    db $07 
    dw $211B,$01FF 
    db $FF 
    dw $210B,$81F5 
    db $FD 
    dw $2107,$01F9 
    db $0F 
    dw $2134,$01F9 
    db $07 
    dw $2124 

UNUSED_Spitemaps_SpacePirate_B2DA31:
    dw $000A,$01FC 
    db $08 
    dw $211B,$01FC 
    db $00 
    dw $210A,$01F0 
    db $12 
    dw $2130,$81FF 
    db $08 
    dw $217E,$01EB 
    db $16 
    dw $2136,$01E4 
    db $16 
    dw $2135,$000D 
    db $16 
    dw $2144,$000C 
    db $0E 
    dw $2143,$01F0 
    db $0A 
    dw $2120,$81F3 
    db $FF 
    dw $2107 

UNUSED_Spitemaps_SpacePirate_B2DA65:
    dw $000C,$000A 
    db $0F 
    dw $218D,$000A 
    db $07 
    dw $217D,$01F5 
    db $18 
    dw $2126,$01ED 
    db $18 
    dw $2125,$0006 
    db $09 
    dw $216D,$01FE 
    db $09 
    dw $216C,$01F6 
    db $13 
    dw $2131,$01F7 
    db $0B 
    dw $2121,$01FB 
    db $06 
    dw $211A,$01FB 
    db $FE 
    dw $210A,$01F8 
    db $07 
    dw $2119,$01F8 
    db $FF 
    dw $2109 

UNUSED_Spitemaps_SpacePirate_B2DAA3:
    dw $000C,$0007 
    db $12 
    dw $2144,$0007 
    db $0A 
    dw $2143,$0002 
    db $0A 
    dw $216F,$01FA 
    db $0A 
    dw $216E,$01FA 
    db $06 
    dw $2119,$01FB 
    db $FE 
    dw $2109,$01FD 
    db $18 
    dw $2126,$01F5 
    db $18 
    dw $2125,$01FE 
    db $15 
    dw $2131,$01FE 
    db $0D 
    dw $2121,$01FC 
    db $08 
    dw $211A,$01FC 
    db $00 
    dw $210A 

UNUSED_Spitemaps_SpacePirate_B2DAE1:
    dw $000B,$01FA 
    db $14 
    dw $2146,$01F2 
    db $14 
    dw $2145,$81F6 
    db $FC 
    dw $2107,$01F8 
    db $0E 
    dw $2134,$01F8 
    db $06 
    dw $2124,$0004 
    db $18 
    dw $2146,$01FC 
    db $18 
    dw $2145,$0001 
    db $13 
    dw $2134,$0001 
    db $0B 
    dw $2124,$01FC 
    db $07 
    dw $211B,$01FD 
    db $FF 
    dw $210B 
endif ; !FEATURE_KEEP_UNREFERENCED

Spitemaps_PirateNinja_47:
    dw $0009,$01FC 
    db $FC 
    dw $6112,$01FC 
    db $F4 
    dw $6102,$81EC 
    db $01 
    dw $2127,$81F4 
    db $01 
    dw $2128,$81F8 
    db $F0 
    dw $212E,$81F1 
    db $EA 
    dw $210E,$01F6 
    db $FE 
    dw $214C,$01EE 
    db $FE 
    dw $214B,$01E6 
    db $FE 
    dw $214A 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spitemaps_SpacePirate_B2DB49:
    dw $0009,$81EB 
    db $00 
    dw $2127,$81F3 
    db $00 
    dw $2128,$01FB 
    db $FB 
    dw $2113,$01FA 
    db $F3 
    dw $2103,$81F8 
    db $EF 
    dw $212E,$81F1 
    db $EA 
    dw $210E,$01F8 
    db $FD 
    dw $214C,$01F0 
    db $FD 
    dw $214B,$01E8 
    db $FD 
    dw $214A 

UNUSED_Spitemaps_SpacePirate_B2DB78:
    dw $0008,$81E9 
    db $FE 
    dw $2127,$81F1 
    db $FE 
    dw $2128,$01FA 
    db $F8 
    dw $2113,$01FA 
    db $F0 
    dw $2103,$81F8 
    db $EE 
    dw $212E,$81F1 
    db $E8 
    dw $210E,$01F3 
    db $FC 
    dw $214B,$01EB 
    db $FD 
    dw $214A 

UNUSED_Spitemaps_SpacePirate_B2DBA2:
    dw $0008,$81E8 
    db $00 
    dw $2127,$81F0 
    db $00 
    dw $2128,$01FA 
    db $FA 
    dw $2113,$01FA 
    db $F2 
    dw $2103,$81F8 
    db $EF 
    dw $212E,$81F1 
    db $E9 
    dw $210E,$01F5 
    db $FE 
    dw $214B,$01ED 
    db $FF 
    dw $214A 

UNUSED_Spitemaps_SpacePirate_B2DBCC:
    dw $0007,$01F6 
    db $FC 
    dw $214C,$01EE 
    db $FC 
    dw $214B,$01E6 
    db $FC 
    dw $214A,$01FB 
    db $FA 
    dw $2112,$01FB 
    db $F2 
    dw $2102,$81F8 
    db $EF 
    dw $212E,$81F1 
    db $E9 
    dw $210E 

UNUSED_Spitemaps_SpacePirate_B2DBF1:
    dw $0007,$81F4 
    db $F2 
    dw $2100,$01E2 
    db $F3 
    dw $212A,$81EA 
    db $F3 
    dw $212B,$81F8 
    db $EF 
    dw $212E,$81F1 
    db $E9 
    dw $210E,$01F2 
    db $FD 
    dw $214B,$01EA 
    db $FD 
    dw $214A 

UNUSED_Spitemaps_SpacePirate_B2DC16:
    dw $0009,$01F1 
    db $FD 
    dw $214B,$01E9 
    db $FD 
    dw $214A,$01E0 
    db $E9 
    dw $212A,$81E8 
    db $E9 
    dw $212B,$01FB 
    db $F1 
    dw $214F,$01F3 
    db $F1 
    dw $214E,$81F8 
    db $EF 
    dw $212E,$81F1 
    db $E9 
    dw $210E,$01F6 
    db $FD 
    dw $214C 

UNUSED_Spitemaps_SpacePirate_B2DC45:
    dw $000A,$01F0 
    db $FD 
    dw $214B,$01E8 
    db $FD 
    dw $214A,$01FA 
    db $E4 
    dw $214D,$01FA 
    db $DC 
    dw $213D,$01FA 
    db $D4 
    dw $212D,$01FB 
    db $E8 
    dw $E113,$01FB 
    db $F0 
    dw $E103,$81F8 
    db $F0 
    dw $212E,$81F1 
    db $EA 
    dw $210E,$01F6 
    db $FD 
    dw $214C 

UNUSED_Spitemaps_SpacePirate_B2DC79:
    dw $0014,$01F6 
    db $12 
    dw $2134,$01F6 
    db $0A 
    dw $2124,$01F7 
    db $15 
    dw $2126,$01E2 
    db $F4 
    dw $212A,$81EA 
    db $F4 
    dw $212B,$01F7 
    db $FA 
    dw $2112,$01F8 
    db $F2 
    dw $2102,$0002 
    db $12 
    dw $2134,$01FD 
    db $16 
    dw $2125,$01FD 
    db $07 
    dw $211A,$01FE 
    db $FF 
    dw $210A,$0001 
    db $0A 
    dw $2124,$81F6 
    db $F0 
    dw $212E,$81F0 
    db $EA 
    dw $210E,$01EF 
    db $16 
    dw $2145,$81F3 
    db $FF 
    dw $2107,$01F6 
    db $FE 
    dw $214C,$01EE 
    db $FE 
    dw $214B,$01E6 
    db $FE 
    dw $214A,$0005 
    db $15 
    dw $2126 

UNUSED_Spitemaps_SpacePirate_B2DCDF:
    dw $0013,$01F7 
    db $08 
    dw $2124,$0007 
    db $16 
    dw $2146,$01FF 
    db $05 
    dw $211A,$01FF 
    db $FD 
    dw $210A,$01E2 
    db $F3 
    dw $212A,$81EA 
    db $F3 
    dw $212B,$81F2 
    db $F1 
    dw $2100,$81F6 
    db $EF 
    dw $212E,$81EF 
    db $EA 
    dw $210E,$01F8 
    db $16 
    dw $2146,$01F0 
    db $15 
    dw $2145,$01FF 
    db $15 
    dw $2145,$0003 
    db $10 
    dw $2134,$0002 
    db $08 
    dw $2124,$81F4 
    db $FE 
    dw $2107,$01F7 
    db $10 
    dw $2134,$01F5 
    db $FD 
    dw $214C,$01ED 
    db $FD 
    dw $214B,$01E5 
    db $FD 
    dw $214A 

UNUSED_Spitemaps_SpacePirate_B2DD40:
    dw $0014,$01F7 
    db $09 
    dw $2124,$01F7 
    db $06 
    dw $2119,$01F7 
    db $FF 
    dw $2109,$01E0 
    db $F5 
    dw $212A,$81E8 
    db $F5 
    dw $212B,$81F1 
    db $F3 
    dw $2100,$81F5 
    db $F0 
    dw $212E,$81EE 
    db $EB 
    dw $210E,$01F8 
    db $16 
    dw $2146,$01F0 
    db $16 
    dw $2145,$0006 
    db $16 
    dw $2146,$01FE 
    db $16 
    dw $2145,$0003 
    db $11 
    dw $2134,$0003 
    db $09 
    dw $2124,$01FF 
    db $07 
    dw $211B,$01FF 
    db $FF 
    dw $210B,$01F8 
    db $11 
    dw $2134,$01F4 
    db $FE 
    dw $214C,$01EC 
    db $FE 
    dw $214B,$01E4 
    db $FE 
    dw $214A 

UNUSED_Spitemaps_SpacePirate_B2DDA6:
    dw $000E,$81F4 
    db $FF 
    dw $2128,$81EC 
    db $FF 
    dw $2127,$0003 
    db $15 
    dw $2126,$81FA 
    db $0B 
    dw $2122,$01FB 
    db $FC 
    dw $2113,$01FB 
    db $F4 
    dw $2103,$81F2 
    db $EB 
    dw $210E,$81F7 
    db $F2 
    dw $212E,$01FB 
    db $15 
    dw $2125,$81F7 
    db $FF 
    dw $2107,$81F3 
    db $FF 
    dw $2107,$81F4 
    db $0A 
    dw $2122,$01FB 
    db $15 
    dw $2126,$01F3 
    db $15 
    dw $2125 
endif ; !FEATURE_KEEP_UNREFERENCED

Spitemaps_PirateNinja_48:
    dw $0012,$81F3 
    db $EC 
    dw $210E,$0008 
    db $FC 
    dw $E14D,$0009 
    db $04 
    dw $E13D,$0009 
    db $0C 
    dw $E12D,$81FE 
    db $F2 
    dw $2105,$81F9 
    db $F1 
    dw $212E,$81EE 
    db $F3 
    dw $212B,$81E6 
    db $F3 
    dw $212A,$81F7 
    db $FF 
    dw $2107,$0002 
    db $11 
    dw $2144,$0002 
    db $09 
    dw $2143,$01F7 
    db $09 
    dw $E149,$01FF 
    db $09 
    dw $E148,$81F4 
    db $FF 
    dw $2107,$01F5 
    db $0B 
    dw $E149,$01FD 
    db $0B 
    dw $E148,$01FE 
    db $13 
    dw $2144,$01FE 
    db $0B 
    dw $2143 

Spitemaps_PirateNinja_49:
    dw $0016,$01FE 
    db $15 
    dw $2134,$01FD 
    db $0D 
    dw $2124,$01FA 
    db $FB 
    dw $214C,$01F2 
    db $FB 
    dw $214B,$01EA 
    db $FB 
    dw $214A,$01FC 
    db $F9 
    dw $2113,$01FC 
    db $F1 
    dw $2103,$0000 
    db $18 
    dw $2126,$01F8 
    db $18 
    dw $2125,$01FB 
    db $08 
    dw $211A,$01FC 
    db $00 
    dw $210A,$81F3 
    db $E6 
    dw $210E,$81F9 
    db $EF 
    dw $212E,$01FA 
    db $FD 
    dw $2149,$01F2 
    db $FD 
    dw $2148,$01F4 
    db $0D 
    dw $2146,$01EC 
    db $0D 
    dw $2145,$01F3 
    db $09 
    dw $2134,$01F3 
    db $01 
    dw $2124,$0004 
    db $F9 
    dw $E14D,$0005 
    db $01 
    dw $E13D,$0006 
    db $09 
    dw $E12D 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spitemaps_SpacePirate_B2DEBA:
    dw $0014,$01F8 
    db $F2 
    dw $214F,$01F0 
    db $F1 
    dw $214E,$01EC 
    db $EE 
    dw $214D,$01EC 
    db $E6 
    dw $213D,$01EC 
    db $DE 
    dw $212D,$81F5 
    db $F1 
    dw $212E,$81EE 
    db $EB 
    dw $210E,$01EC 
    db $F0 
    dw $213D,$01EC 
    db $F8 
    dw $214D,$81EE 
    db $F1 
    dw $2100,$81F7 
    db $FF 
    dw $2107,$0004 
    db $11 
    dw $2144,$0004 
    db $09 
    dw $2143,$01F7 
    db $09 
    dw $E149,$01FF 
    db $09 
    dw $E148,$81F4 
    db $FF 
    dw $2107,$01F5 
    db $0B 
    dw $E149,$01FD 
    db $0B 
    dw $E148,$01FE 
    db $13 
    dw $2144,$01FE 
    db $0B 
    dw $2143 

UNUSED_Spitemaps_SpacePirate_B2DF20:
    dw $000F,$01E8 
    db $F7 
    dw $212A,$81F0 
    db $F7 
    dw $212B,$81F7 
    db $F6 
    dw $2100,$81FB 
    db $F2 
    dw $212E,$81F4 
    db $EC 
    dw $210E,$01FE 
    db $0B 
    dw $2146,$01F6 
    db $0B 
    dw $2145,$0001 
    db $00 
    dw $2149,$01F9 
    db $FF 
    dw $2148,$81F7 
    db $01 
    dw $2122,$01EF 
    db $F9 
    dw $214D,$01EE 
    db $F1 
    dw $213D,$01ED 
    db $E9 
    dw $212D,$0002 
    db $0D 
    dw $2144,$0002 
    db $05 
    dw $2143 

UNUSED_Spitemaps_SpacePirate_B2DF6D:
    dw $000E,$01F0 
    db $05 
    dw $E18D,$01F0 
    db $0D 
    dw $E17D,$01F6 
    db $0B 
    dw $2130,$01F6 
    db $03 
    dw $2120,$01E9 
    db $F4 
    dw $212A,$81F1 
    db $F4 
    dw $212B,$81F8 
    db $F3 
    dw $2100,$81FC 
    db $F0 
    dw $212E,$81F5 
    db $EA 
    dw $210E,$0001 
    db $FE 
    dw $2149,$01F9 
    db $FE 
    dw $2148,$01F1 
    db $F6 
    dw $214D,$01F0 
    db $EE 
    dw $213D,$01EF 
    db $E6 
    dw $212D 

UNUSED_Spitemaps_SpacePirate_B2DFB5:
    dw $000E,$01F0 
    db $05 
    dw $E18D,$01F0 
    db $0D 
    dw $E17D,$01F5 
    db $0B 
    dw $2130,$01F5 
    db $03 
    dw $2120,$01E8 
    db $F3 
    dw $212A,$81F0 
    db $F3 
    dw $212B,$81F8 
    db $F2 
    dw $2100,$81FC 
    db $F1 
    dw $212E,$81F5 
    db $EB 
    dw $210E,$0001 
    db $FF 
    dw $2149,$01F9 
    db $FE 
    dw $2148,$01F0 
    db $F7 
    dw $214D,$01EF 
    db $EF 
    dw $213D,$01EE 
    db $E7 
    dw $212D 

UNUSED_Spitemaps_SpacePirate_B2DFFD:
    dw $0009,$01F9 
    db $00 
    dw $E14D,$01F9 
    db $08 
    dw $E13D,$01F9 
    db $10 
    dw $E12D,$01FA 
    db $FA 
    dw $2113,$01FA 
    db $F2 
    dw $2103,$81F8 
    db $EF 
    dw $212E,$81F1 
    db $E9 
    dw $210E,$01F5 
    db $FD 
    dw $214B,$01ED 
    db $FE 
    dw $214A 

UNUSED_Spitemaps_SpacePirate_B2E02C:
    dw $0003,$01FC 
    db $04 
    dw $214D,$01FC 
    db $FC 
    dw $213D,$01FC 
    db $F4 
    dw $212D 

UNUSED_Spitemaps_SpacePirate_B2E03D:
    dw $0010,$81F9 
    db $FE 
    dw $2107,$01E4 
    db $F3 
    dw $212A,$81EC 
    db $F3 
    dw $212B,$81F6 
    db $F1 
    dw $2100,$81F2 
    db $EB 
    dw $210E,$81F9 
    db $F1 
    dw $212E,$01ED 
    db $F9 
    dw $214D,$01EC 
    db $F1 
    dw $213D,$01EB 
    db $E9 
    dw $212D,$81F4 
    db $FE 
    dw $2107,$01FC 
    db $10 
    dw $2125,$81F3 
    db $05 
    dw $2122,$0004 
    db $10 
    dw $2126,$81FB 
    db $07 
    dw $2122,$01FA 
    db $10 
    dw $2126,$01F2 
    db $10 
    dw $2125 
endif ; !FEATURE_KEEP_UNREFERENCED

Spitemaps_PirateNinja_4A:
    dw $0011,$81F3 
    db $FB 
    dw $2127,$81FB 
    db $FB 
    dw $2128,$01FE 
    db $0D 
    dw $2121,$01FE 
    db $15 
    dw $2131,$01FD 
    db $18 
    dw $2126,$01F5 
    db $18 
    dw $2125,$01FC 
    db $08 
    dw $211A,$01FC 
    db $00 
    dw $210A,$0007 
    db $12 
    dw $2144,$0007 
    db $0A 
    dw $2143,$01FA 
    db $06 
    dw $2119,$01FB 
    db $FE 
    dw $2109,$01FA 
    db $0A 
    dw $216E,$81FA 
    db $F0 
    dw $2105,$81F1 
    db $E6 
    dw $210E,$81F7 
    db $EF 
    dw $212E,$0002 
    db $0A 
    dw $216F 

Spitemaps_PirateNinja_4B:
    dw $0013,$01FE 
    db $FF 
    dw $210A,$01E8 
    db $EE 
    dw $212A,$81EE 
    db $ED 
    dw $212B,$81F6 
    db $EF 
    dw $2100,$000A 
    db $F5 
    dw $E14D,$000B 
    db $FD 
    dw $E13D,$000C 
    db $05 
    dw $E12D,$81F7 
    db $E9 
    dw $210E,$81FB 
    db $F1 
    dw $212E,$01FD 
    db $07 
    dw $211A,$01E3 
    db $FD 
    dw $E16F,$01EB 
    db $FE 
    dw $E16E,$01FB 
    db $FE 
    dw $219F,$01F3 
    db $FD 
    dw $219E,$0008 
    db $16 
    dw $2126,$0000 
    db $17 
    dw $2125,$81FE 
    db $0A 
    dw $2122,$01DE 
    db $F4 
    dw $E18D,$01DD 
    db $FC 
    dw $E17D 

Spitemaps_PirateNinja_4C:
    dw $0013,$01DE 
    db $0A 
    dw $219D,$81E2 
    db $01 
    dw $21AC,$81EF 
    db $FB 
    dw $21AE,$0009 
    db $F4 
    dw $E14D,$000A 
    db $FC 
    dw $E13D,$000A 
    db $04 
    dw $E12D,$0006 
    db $F3 
    dw $215F,$01FE 
    db $F4 
    dw $215E,$01FF 
    db $00 
    dw $610A,$81F3 
    db $EC 
    dw $210E,$81F9 
    db $F2 
    dw $212E,$01EF 
    db $10 
    dw $618D,$01EF 
    db $08 
    dw $617D,$01F4 
    db $08 
    dw $616F,$01FC 
    db $09 
    dw $616E,$0000 
    db $08 
    dw $611A,$01F5 
    db $EA 
    dw $214D,$01F4 
    db $E2 
    dw $213D,$01F4 
    db $DA 
    dw $212D 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spitemaps_SpacePirate_B2E1A8:
    dw $000A,$81FC 
    db $00 
    dw $6107,$01FB 
    db $08 
    dw $611B,$01FB 
    db $00 
    dw $610B,$000B 
    db $16 
    dw $6136,$81F0 
    db $08 
    dw $617E,$0007 
    db $13 
    dw $6130,$0007 
    db $0B 
    dw $6120,$0012 
    db $16 
    dw $6135,$01EB 
    db $16 
    dw $6144,$01EC 
    db $0E 
    dw $6143 

UNUSED_Spitemaps_SpacePirate_B2E1DC:
    dw $000C,$01ED 
    db $10 
    dw $618D,$01ED 
    db $08 
    dw $617D,$01F0 
    db $09 
    dw $616D,$01F8 
    db $09 
    dw $616C,$01FF 
    db $12 
    dw $6131,$01FF 
    db $0A 
    dw $6121,$0001 
    db $18 
    dw $6126,$0009 
    db $18 
    dw $6125,$01FE 
    db $06 
    dw $6119,$01FE 
    db $FE 
    dw $6109,$01FC 
    db $06 
    dw $611A,$01FC 
    db $FE 
    dw $610A 

UNUSED_Spitemaps_SpacePirate_B2E21A:
    dw $000C,$01FC 
    db $06 
    dw $611A,$01FC 
    db $FE 
    dw $610A,$01FF 
    db $05 
    dw $6119,$01FB 
    db $18 
    dw $6126,$01FA 
    db $14 
    dw $6131,$01FA 
    db $0C 
    dw $6121,$01FF 
    db $FD 
    dw $6109,$0003 
    db $18 
    dw $6125,$01F7 
    db $09 
    dw $616F,$01FF 
    db $09 
    dw $616E,$01F3 
    db $11 
    dw $6144,$01F3 
    db $09 
    dw $6143 

UNUSED_Spitemaps_SpacePirate_B2E258:
    dw $000B,$01FE 
    db $14 
    dw $6146,$0006 
    db $14 
    dw $6145,$01F2 
    db $18 
    dw $6146,$01FA 
    db $18 
    dw $6145,$01F5 
    db $13 
    dw $6134,$01F5 
    db $0B 
    dw $6124,$01FA 
    db $07 
    dw $611B,$01F9 
    db $FF 
    dw $610B,$81FB 
    db $FD 
    dw $6107,$01FF 
    db $0F 
    dw $6134,$01FF 
    db $07 
    dw $6124 

UNUSED_Spitemaps_SpacePirate_B2E291:
    dw $000A,$01FC 
    db $08 
    dw $611B,$01FC 
    db $00 
    dw $610A,$0008 
    db $12 
    dw $6130,$81F1 
    db $08 
    dw $617E,$000D 
    db $16 
    dw $6136,$0014 
    db $16 
    dw $6135,$01EB 
    db $16 
    dw $6144,$01EC 
    db $0E 
    dw $6143,$0008 
    db $0A 
    dw $6120,$81FD 
    db $FF 
    dw $6107 

UNUSED_Spitemaps_SpacePirate_B2E2C5:
    dw $000C,$01EE 
    db $0F 
    dw $618D,$01EE 
    db $07 
    dw $617D,$0003 
    db $18 
    dw $6126,$000B 
    db $18 
    dw $6125,$01F2 
    db $09 
    dw $616D,$01FA 
    db $09 
    dw $616C,$0002 
    db $13 
    dw $6131,$0001 
    db $0B 
    dw $6121,$01FD 
    db $06 
    dw $611A,$01FD 
    db $FE 
    dw $610A,$0000 
    db $07 
    dw $6119,$0000 
    db $FF 
    dw $6109 

UNUSED_Spitemaps_SpacePirate_B2E303:
    dw $000C,$01F1 
    db $12 
    dw $6144,$01F1 
    db $0A 
    dw $6143,$01F6 
    db $0A 
    dw $616F,$01FE 
    db $0A 
    dw $616E,$01FE 
    db $06 
    dw $6119,$01FD 
    db $FE 
    dw $6109,$01FB 
    db $18 
    dw $6126,$0003 
    db $18 
    dw $6125,$01FA 
    db $15 
    dw $6131,$01FA 
    db $0D 
    dw $6121,$01FC 
    db $08 
    dw $611A,$01FC 
    db $00 
    dw $610A 

UNUSED_Spitemaps_SpacePirate_B2E341:
    dw $000B,$01FE 
    db $14 
    dw $6146,$0006 
    db $14 
    dw $6145,$81FA 
    db $FC 
    dw $6107,$0000 
    db $0E 
    dw $6134,$0000 
    db $06 
    dw $6124,$01F4 
    db $18 
    dw $6146,$01FC 
    db $18 
    dw $6145,$01F7 
    db $13 
    dw $6134,$01F7 
    db $0B 
    dw $6124,$01FC 
    db $07 
    dw $611B,$01FB 
    db $FF 
    dw $610B 
endif ; !FEATURE_KEEP_UNREFERENCED

Spitemaps_PirateNinja_4D:
    dw $0009,$01FC 
    db $FC 
    dw $2112,$01FC 
    db $F4 
    dw $2102,$8004 
    db $01 
    dw $6127,$81FC 
    db $01 
    dw $6128,$81F8 
    db $F0 
    dw $612E,$81FF 
    db $EA 
    dw $610E,$0002 
    db $FE 
    dw $614C,$000A 
    db $FE 
    dw $614B,$0012 
    db $FE 
    dw $614A 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spitemaps_SpacePirate_B2E3A9:
    dw $0009,$8005 
    db $00 
    dw $6127,$81FD 
    db $00 
    dw $6128,$01FD 
    db $FB 
    dw $6113,$01FE 
    db $F3 
    dw $6103,$81F8 
    db $EF 
    dw $612E,$81FF 
    db $EA 
    dw $610E,$0000 
    db $FD 
    dw $614C,$0008 
    db $FD 
    dw $614B,$0010 
    db $FD 
    dw $614A 

UNUSED_Spitemaps_SpacePirate_B2E3D8:
    dw $0008,$8007 
    db $FE 
    dw $6127,$81FF 
    db $FE 
    dw $6128,$01FE 
    db $F8 
    dw $6113,$01FE 
    db $F0 
    dw $6103,$81F8 
    db $EE 
    dw $612E,$81FF 
    db $E8 
    dw $610E,$0005 
    db $FC 
    dw $614B,$000D 
    db $FD 
    dw $614A 

UNUSED_Spitemaps_SpacePirate_B2E402:
    dw $0008,$8008 
    db $00 
    dw $6127,$8000 
    db $00 
    dw $6128,$01FE 
    db $FA 
    dw $6113,$01FE 
    db $F2 
    dw $6103,$81F8 
    db $EF 
    dw $612E,$81FF 
    db $E9 
    dw $610E,$0003 
    db $FE 
    dw $614B,$000B 
    db $FF 
    dw $614A 

UNUSED_Spitemaps_SpacePirate_B2E42C:
    dw $0007,$0002 
    db $FC 
    dw $614C,$000A 
    db $FC 
    dw $614B,$0012 
    db $FC 
    dw $614A,$01FD 
    db $FA 
    dw $6112,$01FD 
    db $F2 
    dw $6102,$81F8 
    db $EF 
    dw $612E,$81FF 
    db $E9 
    dw $610E 

UNUSED_Spitemaps_SpacePirate_B2E451:
    dw $0007,$81FC 
    db $F2 
    dw $6100,$0016 
    db $F3 
    dw $612A,$8006 
    db $F3 
    dw $612B,$81F8 
    db $EF 
    dw $612E,$81FF 
    db $E9 
    dw $610E,$0006 
    db $FD 
    dw $614B,$000E 
    db $FD 
    dw $614A 

UNUSED_Spitemaps_SpacePirate_B2E476:
    dw $0009,$0007 
    db $FD 
    dw $614B,$000F 
    db $FD 
    dw $614A,$0018 
    db $E9 
    dw $612A,$8008 
    db $E9 
    dw $612B,$01FD 
    db $F1 
    dw $614F,$0005 
    db $F1 
    dw $614E,$81F8 
    db $EF 
    dw $612E,$81FF 
    db $E9 
    dw $610E,$0002 
    db $FD 
    dw $614C 

UNUSED_Spitemaps_SpacePirate_B2E4A5:
    dw $000A,$0008 
    db $FD 
    dw $614B,$0010 
    db $FD 
    dw $614A,$01FE 
    db $E4 
    dw $614D,$01FE 
    db $DC 
    dw $613D,$01FE 
    db $D4 
    dw $612D,$01FD 
    db $E8 
    dw $A113,$01FD 
    db $F0 
    dw $A103,$81F8 
    db $F0 
    dw $612E,$81FF 
    db $EA 
    dw $610E,$0002 
    db $FD 
    dw $614C 

UNUSED_Spitemaps_SpacePirate_B2E4D9:
    dw $0014,$0002 
    db $12 
    dw $6134,$0002 
    db $0A 
    dw $6124,$0001 
    db $15 
    dw $6126,$0016 
    db $F4 
    dw $612A,$8006 
    db $F4 
    dw $612B,$0001 
    db $FA 
    dw $6112,$0000 
    db $F2 
    dw $6102,$01F6 
    db $12 
    dw $6134,$01FB 
    db $16 
    dw $6125,$01FB 
    db $07 
    dw $611A,$01FA 
    db $FF 
    dw $610A,$01F7 
    db $0A 
    dw $6124,$81FA 
    db $F0 
    dw $612E,$8000 
    db $EA 
    dw $610E,$0009 
    db $16 
    dw $6145,$81FD 
    db $FF 
    dw $6107,$0002 
    db $FE 
    dw $614C,$000A 
    db $FE 
    dw $614B,$0012 
    db $FE 
    dw $614A,$01F3 
    db $15 
    dw $6126 

UNUSED_Spitemaps_SpacePirate_B2E53F:
    dw $0013,$0001 
    db $08 
    dw $6124,$01F1 
    db $16 
    dw $6146,$01F9 
    db $05 
    dw $611A,$01F9 
    db $FD 
    dw $610A,$0016 
    db $F3 
    dw $612A,$8006 
    db $F3 
    dw $612B,$81FE 
    db $F1 
    dw $6100,$81FA 
    db $EF 
    dw $612E,$8001 
    db $EA 
    dw $610E,$0000 
    db $16 
    dw $6146,$0008 
    db $15 
    dw $6145,$01F9 
    db $15 
    dw $6145,$01F5 
    db $10 
    dw $6134,$01F6 
    db $08 
    dw $6124,$81FC 
    db $FE 
    dw $6107,$0001 
    db $10 
    dw $6134,$0003 
    db $FD 
    dw $614C,$000B 
    db $FD 
    dw $614B,$0013 
    db $FD 
    dw $614A 

UNUSED_Spitemaps_SpacePirate_B2E5A0:
    dw $0014,$0001 
    db $09 
    dw $6124,$0001 
    db $06 
    dw $6119,$0001 
    db $FF 
    dw $6109,$0018 
    db $F5 
    dw $612A,$8008 
    db $F5 
    dw $612B,$81FF 
    db $F3 
    dw $6100,$81FB 
    db $F0 
    dw $612E,$8002 
    db $EB 
    dw $610E,$0000 
    db $16 
    dw $6146,$0008 
    db $16 
    dw $6145,$01F2 
    db $16 
    dw $6146,$01FA 
    db $16 
    dw $6145,$01F5 
    db $11 
    dw $6134,$01F5 
    db $09 
    dw $6124,$01F9 
    db $07 
    dw $611B,$01F9 
    db $FF 
    dw $610B,$0000 
    db $11 
    dw $6134,$0004 
    db $FE 
    dw $614C,$000C 
    db $FE 
    dw $614B,$0014 
    db $FE 
    dw $614A 

UNUSED_Spitemaps_SpacePirate_B2E606:
    dw $000E,$81FC 
    db $FF 
    dw $6128,$8004 
    db $FF 
    dw $6127,$01F5 
    db $15 
    dw $6126,$81F6 
    db $0B 
    dw $6122,$01FD 
    db $FC 
    dw $6113,$01FD 
    db $F4 
    dw $6103,$81FE 
    db $EB 
    dw $610E,$81F9 
    db $F2 
    dw $612E,$01FD 
    db $15 
    dw $6125,$81F9 
    db $FF 
    dw $6107,$81FD 
    db $FF 
    dw $6107,$81FC 
    db $0A 
    dw $6122,$01FD 
    db $15 
    dw $6126,$0005 
    db $15 
    dw $6125 
endif ; !FEATURE_KEEP_UNREFERENCED

Spitemaps_PirateNinja_4E:
    dw $0012,$81FD 
    db $EC 
    dw $610E,$01F0 
    db $FC 
    dw $A14D,$01EF 
    db $04 
    dw $A13D,$01EF 
    db $0C 
    dw $A12D,$81F2 
    db $F2 
    dw $6105,$81F7 
    db $F1 
    dw $612E,$8002 
    db $F3 
    dw $612B,$800A 
    db $F3 
    dw $612A,$81F9 
    db $FF 
    dw $6107,$01F6 
    db $11 
    dw $6144,$01F6 
    db $09 
    dw $6143,$0001 
    db $09 
    dw $A149,$01F9 
    db $09 
    dw $A148,$81FC 
    db $FF 
    dw $6107,$0003 
    db $0B 
    dw $A149,$01FB 
    db $0B 
    dw $A148,$01FA 
    db $13 
    dw $6144,$01FA 
    db $0B 
    dw $6143 

Spitemaps_PirateNinja_4F:
    dw $0016,$01FA 
    db $15 
    dw $6134,$01FB 
    db $0D 
    dw $6124,$01FE 
    db $FB 
    dw $614C,$0006 
    db $FB 
    dw $614B,$000E 
    db $FB 
    dw $614A,$01FC 
    db $F9 
    dw $6113,$01FC 
    db $F1 
    dw $6103,$01F8 
    db $18 
    dw $6126,$0000 
    db $18 
    dw $6125,$01FD 
    db $08 
    dw $611A,$01FC 
    db $00 
    dw $610A,$81FD 
    db $E6 
    dw $610E,$81F7 
    db $EF 
    dw $612E,$01FE 
    db $FD 
    dw $6149,$0006 
    db $FD 
    dw $6148,$0004 
    db $0D 
    dw $6146,$000C 
    db $0D 
    dw $6145,$0005 
    db $09 
    dw $6134,$0005 
    db $01 
    dw $6124,$01F4 
    db $F9 
    dw $A14D,$01F3 
    db $01 
    dw $A13D,$01F2 
    db $09 
    dw $A12D 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spitemaps_SpacePirate_B2E71A:
    dw $0014,$0000 
    db $F2 
    dw $614F,$0008 
    db $F1 
    dw $614E,$000C 
    db $EE 
    dw $614D,$000C 
    db $E6 
    dw $613D,$000C 
    db $DE 
    dw $612D,$81FB 
    db $F1 
    dw $612E,$8002 
    db $EB 
    dw $610E,$000C 
    db $F0 
    dw $613D,$000C 
    db $F8 
    dw $614D,$8002 
    db $F1 
    dw $6100,$81F9 
    db $FF 
    dw $6107,$01F4 
    db $11 
    dw $6144,$01F4 
    db $09 
    dw $6143,$0001 
    db $09 
    dw $A149,$01F9 
    db $09 
    dw $A148,$81FC 
    db $FF 
    dw $6107,$0003 
    db $0B 
    dw $A149,$01FB 
    db $0B 
    dw $A148,$01FA 
    db $13 
    dw $6144,$01FA 
    db $0B 
    dw $6143 

UNUSED_Spitemaps_SpacePirate_B2E780:
    dw $000F,$0010 
    db $F7 
    dw $612A,$8000 
    db $F7 
    dw $612B,$81F9 
    db $F6 
    dw $6100,$81F5 
    db $F2 
    dw $612E,$81FC 
    db $EC 
    dw $610E,$01FA 
    db $0B 
    dw $6146,$0002 
    db $0B 
    dw $6145,$01F7 
    db $00 
    dw $6149,$01FF 
    db $FF 
    dw $6148,$81F9 
    db $01 
    dw $6122,$0009 
    db $F9 
    dw $614D,$000A 
    db $F1 
    dw $613D,$000B 
    db $E9 
    dw $612D,$01F6 
    db $0D 
    dw $6144,$01F6 
    db $05 
    dw $6143 

UNUSED_Spitemaps_SpacePirate_B2E7CD:
    dw $000E,$0008 
    db $05 
    dw $A18D,$0008 
    db $0D 
    dw $A17D,$0002 
    db $0B 
    dw $6130,$0002 
    db $03 
    dw $6120,$000F 
    db $F4 
    dw $612A,$81FF 
    db $F4 
    dw $612B,$81F8 
    db $F3 
    dw $6100,$81F4 
    db $F0 
    dw $612E,$81FB 
    db $EA 
    dw $610E,$01F7 
    db $FE 
    dw $6149,$01FF 
    db $FE 
    dw $6148,$0007 
    db $F6 
    dw $614D,$0008 
    db $EE 
    dw $613D,$0009 
    db $E6 
    dw $612D 

UNUSED_Spitemaps_SpacePirate_B2E815:
    dw $000E,$0008 
    db $05 
    dw $A18D,$0008 
    db $0D 
    dw $A17D,$0003 
    db $0B 
    dw $6130,$0003 
    db $03 
    dw $6120,$0010 
    db $F3 
    dw $612A,$8000 
    db $F3 
    dw $612B,$81F8 
    db $F2 
    dw $6100,$81F4 
    db $F1 
    dw $612E,$81FB 
    db $EB 
    dw $610E,$01F7 
    db $FF 
    dw $6149,$01FF 
    db $FE 
    dw $6148,$0008 
    db $F7 
    dw $614D,$0009 
    db $EF 
    dw $613D,$000A 
    db $E7 
    dw $612D 

UNUSED_Spitemaps_SpacePirate_B2E85D:
    dw $0009,$01FF 
    db $00 
    dw $A14D,$01FF 
    db $08 
    dw $A13D,$01FF 
    db $10 
    dw $A12D,$01FE 
    db $FA 
    dw $6113,$01FE 
    db $F2 
    dw $6103,$81F8 
    db $EF 
    dw $612E,$81FF 
    db $E9 
    dw $610E,$0003 
    db $FD 
    dw $614B,$000B 
    db $FE 
    dw $614A 

UNUSED_Spitemaps_SpacePirate_B2E88C:
    dw $0010,$81F7 
    db $FE 
    dw $6107,$0014 
    db $F3 
    dw $612A,$8004 
    db $F3 
    dw $612B,$81FA 
    db $F1 
    dw $6100,$81FE 
    db $EB 
    dw $610E,$81F7 
    db $F1 
    dw $612E,$000B 
    db $F9 
    dw $614D,$000C 
    db $F1 
    dw $613D,$000D 
    db $E9 
    dw $612D,$81FC 
    db $FE 
    dw $6107,$01FC 
    db $10 
    dw $6125,$81FD 
    db $05 
    dw $6122,$01F4 
    db $10 
    dw $6126,$81F5 
    db $07 
    dw $6122,$01FE 
    db $10 
    dw $6126,$0006 
    db $10 
    dw $6125 
endif ; !FEATURE_KEEP_UNREFERENCED

Spitemaps_PirateNinja_50:
    dw $0011,$81FD 
    db $FB 
    dw $6127,$81F5 
    db $FB 
    dw $6128,$01FA 
    db $0D 
    dw $6121,$01FA 
    db $15 
    dw $6131,$01FB 
    db $18 
    dw $6126,$0003 
    db $18 
    dw $6125,$01FC 
    db $08 
    dw $611A,$01FC 
    db $00 
    dw $610A,$01F1 
    db $12 
    dw $6144,$01F1 
    db $0A 
    dw $6143,$01FE 
    db $06 
    dw $6119,$01FD 
    db $FE 
    dw $6109,$01FE 
    db $0A 
    dw $616E,$81F6 
    db $F0 
    dw $6105,$81FF 
    db $E6 
    dw $610E,$81F9 
    db $EF 
    dw $612E,$01F6 
    db $0A 
    dw $616F 

Spitemaps_PirateNinja_51:
    dw $0013,$01FA 
    db $FF 
    dw $610A,$0010 
    db $EE 
    dw $612A,$8002 
    db $ED 
    dw $612B,$81FA 
    db $EF 
    dw $6100,$01EE 
    db $F5 
    dw $A14D,$01ED 
    db $FD 
    dw $A13D,$01EC 
    db $05 
    dw $A12D,$81F9 
    db $E9 
    dw $610E,$81F5 
    db $F1 
    dw $612E,$01FB 
    db $07 
    dw $611A,$0015 
    db $FD 
    dw $A16F,$000D 
    db $FE 
    dw $A16E,$01FD 
    db $FE 
    dw $619F,$0005 
    db $FD 
    dw $619E,$01F0 
    db $16 
    dw $6126,$01F8 
    db $17 
    dw $6125,$81F2 
    db $0A 
    dw $6122,$001A 
    db $F4 
    dw $A18D,$001B 
    db $FC 
    dw $A17D 

Spitemaps_PirateNinja_52:
    dw $0013,$001A 
    db $0A 
    dw $619D,$800E 
    db $01 
    dw $61AC,$8001 
    db $FB 
    dw $61AE,$01EF 
    db $F4 
    dw $A14D,$01EE 
    db $FC 
    dw $A13D,$01EE 
    db $04 
    dw $A12D,$01F2 
    db $F3 
    dw $615F,$01FA 
    db $F4 
    dw $615E,$01F9 
    db $00 
    dw $210A,$81FD 
    db $EC 
    dw $610E,$81F7 
    db $F2 
    dw $612E,$0009 
    db $10 
    dw $218D,$0009 
    db $08 
    dw $217D,$0004 
    db $08 
    dw $216F,$01FC 
    db $09 
    dw $216E,$01F8 
    db $08 
    dw $211A,$0003 
    db $EA 
    dw $614D,$0004 
    db $E2 
    dw $613D,$0004 
    db $DA 
    dw $612D 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spitemaps_SpacePirate_B2E9F7:
    dw $0004,$81FA 
    db $00 
    dw $2182,$81EA 
    db $00 
    dw $2180,$81FA 
    db $F0 
    dw $2162,$81EA 
    db $F0 
    dw $2160 

UNUSED_Spitemaps_SpacePirate_B2EA0D:
    dw $0006,$01F5 
    db $10 
    dw $21A5,$01FD 
    db $10 
    dw $21A6,$81FD 
    db $00 
    dw $2186,$81ED 
    db $00 
    dw $2184,$81FD 
    db $F0 
    dw $2166,$81ED 
    db $F0 
    dw $2164 

UNUSED_Spitemaps_SpacePirate_B2EA2D:
    dw $0005,$000C 
    db $FE 
    dw $217C,$81FC 
    db $06 
    dw $218A,$81EC 
    db $06 
    dw $2188,$81FC 
    db $F6 
    dw $216A,$81EC 
    db $F6 
    dw $2168 

UNUSED_Spitemaps_SpacePirate_B2EA48:
    dw $0007,$0010 
    db $FA 
    dw $E1A7,$81F0 
    db $F2 
    dw $E1AA,$8000 
    db $F2 
    dw $E1A8,$01F0 
    db $02 
    dw $E1B4,$0008 
    db $02 
    dw $E1B1,$0010 
    db $02 
    dw $E1B0,$81F8 
    db $02 
    dw $E1A2 

UNUSED_Spitemaps_SpacePirate_B2EA6D:
    dw $0004,$81F6 
    db $F0 
    dw $E182,$8006 
    db $F0 
    dw $E180,$81F6 
    db $00 
    dw $E162,$8006 
    db $00 
    dw $E160 

UNUSED_Spitemaps_SpacePirate_B2EA83:
    dw $0006,$0004 
    db $E8 
    dw $E1A5,$01FC 
    db $E8 
    dw $E1A6,$81F4 
    db $F0 
    dw $E186,$8004 
    db $F0 
    dw $E184,$81F4 
    db $00 
    dw $E166,$8004 
    db $00 
    dw $E164 

UNUSED_Spitemaps_SpacePirate_B2EAA3:
    dw $0005,$01EC 
    db $FA 
    dw $E17C,$81F4 
    db $EA 
    dw $E18A,$8004 
    db $EA 
    dw $E188,$81F4 
    db $FA 
    dw $E16A,$8004 
    db $FA 
    dw $E168 

UNUSED_Spitemaps_SpacePirate_B2EABE:
    dw $0007,$01E9 
    db $FE 
    dw $21A7,$8001 
    db $FE 
    dw $21AA,$81F1 
    db $FE 
    dw $21A8,$0009 
    db $F6 
    dw $21B4,$01F1 
    db $F6 
    dw $21B1,$01E9 
    db $F6 
    dw $21B0,$81F9 
    db $EE 
    dw $21A2 

UNUSED_Spitemaps_SpacePirate_B2EAE3:
    dw $000D,$81F9 
    db $FC 
    dw $2127,$8001 
    db $FC 
    dw $2128,$01F1 
    db $F7 
    dw $214D,$01F1 
    db $EF 
    dw $213D,$01F1 
    db $E7 
    dw $212D,$0006 
    db $FB 
    dw $6112,$0006 
    db $F3 
    dw $6102,$81FA 
    db $EB 
    dw $210E,$0003 
    db $F9 
    dw $6142,$01FB 
    db $F1 
    dw $6141,$0003 
    db $F1 
    dw $6140,$01FB 
    db $F9 
    dw $6147,$81F1 
    db $F0 
    dw $2100 

UNUSED_Spitemaps_SpacePirate_B2EB26:
    dw $000E,$01F0 
    db $F7 
    dw $214D,$01F0 
    db $EF 
    dw $213D,$01F0 
    db $E7 
    dw $212D,$81FE 
    db $EB 
    dw $610E,$81F1 
    db $F0 
    dw $2100,$0003 
    db $F9 
    dw $6142,$01FB 
    db $F1 
    dw $6141,$0003 
    db $F1 
    dw $6140,$01FB 
    db $F9 
    dw $6147,$0008 
    db $FD 
    dw $A14D,$0008 
    db $05 
    dw $A13D,$0008 
    db $0D 
    dw $A12D,$0006 
    db $FB 
    dw $6112,$0006 
    db $F3 
    dw $6102 

UNUSED_Spitemaps_SpacePirate_B2EB6E:
    dw $0014,$0000 
    db $F2 
    dw $614F,$0008 
    db $F1 
    dw $614E,$000C 
    db $EE 
    dw $614D,$000C 
    db $E6 
    dw $613D,$000C 
    db $DE 
    dw $612D,$81FB 
    db $F1 
    dw $612E,$8002 
    db $EB 
    dw $610E,$000C 
    db $F0 
    dw $613D,$000C 
    db $F8 
    dw $614D,$8002 
    db $F1 
    dw $6100,$81F9 
    db $FF 
    dw $6107,$01F4 
    db $11 
    dw $6144,$01F4 
    db $09 
    dw $6143,$0001 
    db $09 
    dw $A149,$01F9 
    db $09 
    dw $A148,$81FC 
    db $FF 
    dw $6107,$0003 
    db $0B 
    dw $A149,$01FB 
    db $0B 
    dw $A148,$01FA 
    db $13 
    dw $6144,$01FA 
    db $0B 
    dw $6143 

UNUSED_Spitemaps_SpacePirate_B2EBD4:
    dw $0004,$81F6 
    db $00 
    dw $6182,$8006 
    db $00 
    dw $6180,$81F6 
    db $F0 
    dw $6162,$8006 
    db $F0 
    dw $6160 

UNUSED_Spitemaps_SpacePirate_B2EBEA:
    dw $0006,$0003 
    db $10 
    dw $61A5,$01FB 
    db $10 
    dw $61A6,$81F3 
    db $00 
    dw $6186,$8003 
    db $00 
    dw $6184,$81F3 
    db $F0 
    dw $6166,$8003 
    db $F0 
    dw $6164 

UNUSED_Spitemaps_SpacePirate_B2EC0A:
    dw $0005,$01EC 
    db $FE 
    dw $617C,$81F4 
    db $06 
    dw $618A,$8004 
    db $06 
    dw $6188,$81F4 
    db $F6 
    dw $616A,$8004 
    db $F6 
    dw $6168 

UNUSED_Spitemaps_SpacePirate_B2EC25:
    dw $0007,$01E8 
    db $FA 
    dw $A1A7,$8000 
    db $F2 
    dw $A1AA,$81F0 
    db $F2 
    dw $A1A8,$0008 
    db $02 
    dw $A1B4,$01F0 
    db $02 
    dw $A1B1,$01E8 
    db $02 
    dw $A1B0,$81F8 
    db $02 
    dw $A1A2 

UNUSED_Spitemaps_SpacePirate_B2EC4A:
    dw $0004,$81FA 
    db $F0 
    dw $A182,$81EA 
    db $F0 
    dw $A180,$81FA 
    db $00 
    dw $A162,$81EA 
    db $00 
    dw $A160 

UNUSED_Spitemaps_SpacePirate_B2EC60:
    dw $0006,$01F4 
    db $E8 
    dw $A1A5,$01FC 
    db $E8 
    dw $A1A6,$81FC 
    db $F0 
    dw $A186,$81EC 
    db $F0 
    dw $A184,$81FC 
    db $00 
    dw $A166,$81EC 
    db $00 
    dw $A164 

UNUSED_Spitemaps_SpacePirate_B2EC80:
    dw $0005,$000C 
    db $FA 
    dw $A17C,$81FC 
    db $EA 
    dw $A18A,$81EC 
    db $EA 
    dw $A188,$81FC 
    db $FA 
    dw $A16A,$81EC 
    db $FA 
    dw $A168 

UNUSED_Spitemaps_SpacePirate_B2EC9B:
    dw $0007,$000F 
    db $FE 
    dw $61A7,$81EF 
    db $FE 
    dw $61AA,$81FF 
    db $FE 
    dw $61A8,$01EF 
    db $F6 
    dw $61B4,$0007 
    db $F6 
    dw $61B1,$000F 
    db $F6 
    dw $61B0,$81F7 
    db $EE 
    dw $61A2 
endif ; !FEATURE_KEEP_UNREFERENCED

InstList_PirateWall_FireLaser_WallJumpLeft:
    dw Instruction_PirateWall_FunctionInY 
    dw RTS_B2F0E3 
    dw $0009 
    dw ExtendedSpritemaps_PirateWall_E 
    dw $000F 
    dw ExtendedSpritemaps_PirateWall_F 
    dw Instruction_PirateWall_FireLaserLeft 
    dw Instruction_Common_WaitYFrames 
    dw $0020 
    dw Instruction_PirateWall_PrepareWallJumpToLeft 
    dw Instruction_PirateWall_FunctionInY 
    dw Function_PirateWall_WallJumpingLeft 
    dw Instruction_PirateWall_QueueSpacePirateAttackSFX 
    dw $000A 
    dw ExtendedSpritemaps_PirateWall_10 
    dw $0001 
    dw ExtendedSpritemaps_PirateWall_11 
    dw Instruction_Common_Sleep 

InstList_PirateWall_LandedOnLeftWall:
    dw Instruction_PirateWall_FunctionInY 
    dw Function_PirateWall_ClimbingLeftWall 
    dw $000A 
    dw ExtendedSpritemaps_PirateWall_10 

InstList_PirateWall_MovingUpLeftWall_0:
    dw Instruction_PirateWall_FunctionInY 
    dw Function_PirateWall_ClimbingLeftWall 
    dw Instruction_Common_TimerInY 
    dw $0004 

InstList_PirateWall_MovingUpLeftWall_1:
    dw $000A 
    dw ExtendedSpritemaps_PirateWall_0 
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Left 
    dw $FFFD,$0008 
    dw ExtendedSpritemaps_PirateWall_1 
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Left 
    dw $FFFD,$0005 
    dw ExtendedSpritemaps_PirateWall_2 
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Left 
    dw $FFFD,$0008 
    dw ExtendedSpritemaps_PirateWall_3 
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Left 
    dw $FFFD,$000A 
    dw ExtendedSpritemaps_PirateWall_4 
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Left 
    dw $FFFD,$0008 
    dw ExtendedSpritemaps_PirateWall_3 
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Left 
    dw $FFFD,$0005 
    dw ExtendedSpritemaps_PirateWall_2 
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Left 
    dw $FFFD,$0008 
    dw ExtendedSpritemaps_PirateWall_1 
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate 
    dw InstList_PirateWall_MovingUpLeftWall_1 
    dw Instruction_PirateWall_RandomlyChooseADirection_LeftWall 

InstList_PirateWall_MovingDownLeftWall_0:
    dw Instruction_PirateWall_FunctionInY 
    dw Function_PirateWall_ClimbingLeftWall 
    dw Instruction_Common_TimerInY 
    dw $0004 

InstList_PirateWall_MovingDownLeftWall_1:
    dw $000A 
    dw ExtendedSpritemaps_PirateWall_0 
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Left 
    dw $0003,$0008 
    dw ExtendedSpritemaps_PirateWall_1 
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Left 
    dw $0003,$0005 
    dw ExtendedSpritemaps_PirateWall_2 
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Left 
    dw $0003,$0008 
    dw ExtendedSpritemaps_PirateWall_3 
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Left 
    dw $0003 
    dw $000A 
    dw ExtendedSpritemaps_PirateWall_4 
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Left 
    dw $0003,$0008 
    dw ExtendedSpritemaps_PirateWall_3 
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Left 
    dw $0003 
    dw $0005 
    dw ExtendedSpritemaps_PirateWall_2 
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Left 
    dw $0003,$0008 
    dw ExtendedSpritemaps_PirateWall_1 
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate 
    dw InstList_PirateWall_MovingDownLeftWall_1 
    dw Instruction_PirateWall_RandomlyChooseADirection_LeftWall 

InstList_PirateWall_FireLaser_WallJumpRight:
    dw Instruction_PirateWall_FunctionInY 
    dw RTS_B2F04F 
    dw $0009 
    dw ExtendedSpritemaps_PirateWall_5 
    dw $0001 
    dw ExtendedSpritemaps_PirateWall_6 
    dw Instruction_PirateWall_FireLaserRight 
    dw Instruction_Common_WaitYFrames 
    dw $0020 
    dw Instruction_PirateWall_PrepareWallJumpToRight 
    dw Instruction_PirateWall_FunctionInY 
    dw Function_PirateWall_WallJumpingRight 
    dw Instruction_PirateWall_QueueSpacePirateAttackSFX 
    dw $000A 
    dw ExtendedSpritemaps_PirateWall_7 
    dw $0001 
    dw ExtendedSpritemaps_PirateWall_8 
    dw Instruction_Common_Sleep 

InstList_PirateWall_LandingOnRightWall:
    dw Instruction_PirateWall_FunctionInY 
    dw Function_PirateWall_ClimbingRightWall 
    dw $000A 
    dw ExtendedSpritemaps_PirateWall_7 

InstList_PirateWall_MovingDownRightWall_0:
    dw Instruction_PirateWall_FunctionInY 
    dw Function_PirateWall_ClimbingRightWall 
    dw Instruction_Common_TimerInY 
    dw $0004 

InstList_PirateWall_MovingDownRightWall_1:
    dw $000A 
    dw ExtendedSpritemaps_PirateWall_9 
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Right 
    dw $0003,$0008 
    dw ExtendedSpritemaps_PirateWall_A 
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Right 
    dw $0003 
    dw $0005 
    dw ExtendedSpritemaps_PirateWall_B 
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Right 
    dw $0003,$0008 
    dw ExtendedSpritemaps_PirateWall_C 
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Right 
    dw $0003,$000A 
    dw ExtendedSpritemaps_PirateWall_D 
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Right 
    dw $0003,$0008 
    dw ExtendedSpritemaps_PirateWall_C 
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Right 
    dw $0003,$0005 
    dw ExtendedSpritemaps_PirateWall_B 
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Right 
    dw $0003,$0008 
    dw ExtendedSpritemaps_PirateWall_A 
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate 
    dw InstList_PirateWall_MovingDownRightWall_1 
    dw Instruction_PirateWall_RandomlyChooseADirection_RightWall 

InstList_PirateWall_MovingUpRightWall_0:
    dw Instruction_PirateWall_FunctionInY 
    dw Function_PirateWall_ClimbingRightWall 
    dw Instruction_Common_TimerInY 
    dw $0004 

InstList_PirateWall_MovingUpRightWall_1:
    dw $000A 
    dw ExtendedSpritemaps_PirateWall_9 
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Right 
    dw $FFFD,$0008 
    dw ExtendedSpritemaps_PirateWall_A 
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Right 
    dw $FFFD,$0005 
    dw ExtendedSpritemaps_PirateWall_B 
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Right 
    dw $FFFD,$0008 
    dw ExtendedSpritemaps_PirateWall_C 
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Right 
    dw $FFFD,$000A 
    dw ExtendedSpritemaps_PirateWall_D 
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Right 
    dw $FFFD,$0008 
    dw ExtendedSpritemaps_PirateWall_C 
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Right 
    dw $FFFD,$0005 
    dw ExtendedSpritemaps_PirateWall_B 
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Right 
    dw $FFFD,$0008 
    dw ExtendedSpritemaps_PirateWall_A 
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate 
    dw InstList_PirateWall_MovingUpRightWall_1 
    dw Instruction_PirateWall_RandomlyChooseADirection_RightWall 

Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Left:
    PHX 
    LDX.W $0E54 
    LDA.W #$0000 : STA.B $12 
    LDA.W $0000,Y : STA.B $14 
    PHY 
    PHX 
    JSL.L MoveEnemyDownBy_14_12 
    PLX 
    PLY 
    BCC .noCOllision 
    LDA.W $0FAC,X 
    EOR.W #$0001 
    STA.W $0FAC,X 
    LDY.W #InstList_PirateWall_MovingDownLeftWall_0 
    LDA.W $0FAC,X 
    BEQ .return 
    LDY.W #InstList_PirateWall_MovingUpLeftWall_0 

.return:
    PLX 
    RTL 


.noCOllision:
    PLX 
    INY #2
    RTL 


Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Right:
    PHX 
    LDX.W $0E54 
    LDA.W #$0000 : STA.B $12 
    LDA.W $0000,Y : STA.B $14 
    PHY 
    PHX 
    JSL.L MoveEnemyDownBy_14_12 
    PLX 
    PLY 
    BCC .noCollision 
    LDA.W $0FAC,X 
    EOR.W #$0001 
    STA.W $0FAC,X 
    LDY.W #InstList_PirateWall_MovingDownRightWall_0 
    LDA.W $0FAC,X 
    BEQ .return 
    LDY.W #InstList_PirateWall_MovingUpRightWall_0 

.return:
    PLX 
    RTL 


.noCollision:
    PLX 
    INY #2
    RTL 


Instruction_PirateWall_RandomlyChooseADirection_LeftWall:
    PHX 
    LDY.W #InstList_PirateWall_MovingDownLeftWall_0 
    LDX.W $0E54 
    JSL.L GenerateRandomNumber 
    AND.W #$0001 
    STA.W $0FAC,X 
    BEQ .return 
    LDY.W #InstList_PirateWall_MovingUpLeftWall_0 

.return:
    PLX 
    RTL 


Instruction_PirateWall_RandomlyChooseADirection_RightWall:
    PHX 
    LDY.W #InstList_PirateWall_MovingDownRightWall_0 
    LDX.W $0E54 
    JSL.L GenerateRandomNumber 
    AND.W #$0001 
    STA.W $0FAC,X 
    BEQ .return 
    LDY.W #InstList_PirateWall_MovingUpRightWall_0 

.return:
    PLX 
    RTL 


Instruction_PirateWall_PrepareWallJumpToRight:
    PHX 
    PHY 
    LDX.W $0E54 
    LDA.W $0FB6,X : CLC : ADC.W $0F7A,X : STA.W $0FAA,X 
    LDA.W $0FB6,X 
    LSR A 
    CLC : ADC.W $0F7A,X : STA.W $0FAE,X 
    LDA.W $0F7E,X : STA.W $0FB0,X 
    LDA.W #$0040 : STA.W $0FB2,X 
    PLY 
    PLX 
    RTL 


Instruction_PirateWall_PrepareWallJumpToLeft:
    PHX 
    PHY 
    LDX.W $0E54 
    LDA.W $0F7A,X : SEC : SBC.W $0FB6,X : STA.W $0FAA,X 
    LDA.W $0FB6,X 
    LSR A 
    STA.B $12 
    LDA.W $0F7A,X : SEC : SBC.B $12 : STA.W $0FAE,X 
    LDA.W $0F7E,X : STA.W $0FB0,X 
    LDA.W #$00C0 : STA.W $0FB2,X 
    PLY 
    PLX 
    RTL 


Instruction_PirateWall_FireLaserLeft:
    PHX 
    PHY 
    LDY.W $0E54 
    LDX.W $0F78,Y 
    LDA.L $A00006,X : STA.W $1993 
    LDX.W $0E54 
    LDA.W $0F7A,X : SEC : SBC.W #$0018 : STA.B $12 
    LDA.W $0F7E,X : SEC : SBC.W #$0010 : STA.B $14 
    LDA.W #$0000 : STA.B $16 
    LDY.W #EnemyProjectile_PirateMotherBrainLaser 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    PLY 
    PLX 
    RTL 


Instruction_PirateWall_FireLaserRight:
    PHX 
    PHY 
    LDX.W $0E54 
    LDA.W $0F7A,X : CLC : ADC.W #$0018 : STA.B $12 
    LDA.W $0F7E,X : SEC : SBC.W #$0010 : STA.B $14 
    LDA.W #$0001 : STA.B $16 
    LDY.W #EnemyProjectile_PirateMotherBrainLaser 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    PLY 
    PLX 
    RTL 


Instruction_PirateWall_FunctionInY:
    PHY 
    PHX 
    LDX.W $0E54 
    LDA.W $0000,Y : STA.W $0FA8,X 
    PLX 
    PLY 
    INY #2
    RTL 


Instruction_PirateWall_QueueSpacePirateAttackSFX:
    PHX 
    PHY 
    LDA.W #$0066 
    JSL.L QueueSound_Lib2_Max6 
    PLY 
    PLX 
    RTL 


InitAI_PirateWall:
    LDX.W $0E54 
    LDY.W #InstList_PirateWall_MovingDownLeftWall_0 
    LDA.W $0FB4,X 
    BIT.W #$0001 
    BEQ .zeroParam 
    LDY.W #InstList_PirateWall_MovingDownRightWall_0 

.zeroParam:
    TYA 
    STA.W $0F92,X 
    LDA.W #$00BE : STA.L $7E8000,X 
    LDA.W #$0042 : STA.L $7E8002,X 
    LDA.W #$0002 : STA.L $7E8004,X 
    LDA.W $0FB4,X 
    BIT.W #$8000 
    BNE .notFastJump 
    LDA.L $7E8000,X : CLC : ADC.W #$0002 : STA.L $7E8000,X 
    LDA.L $7E8002,X : SEC : SBC.W #$0002 : STA.L $7E8002,X 
    LDA.L $7E8004,X : CLC : ADC.W #$0002 : STA.L $7E8004,X 

.notFastJump:
    LDY.W #Function_PirateWall_ClimbingLeftWall 
    LDA.W $0FB4,X 
    BIT.W #$0001 
    BEQ + 
    LDY.W #Function_PirateWall_ClimbingRightWall 

  + TYA 
    STA.W $0FA8,X 
    LDA.W $0F7A,X 
    AND.W #$000F 
    CMP.W #$000B 
    BMI .lessThanB 
    LDA.W $0F7A,X 
    AND.W #$FFF0 
    CLC : ADC.W #$0010 : STA.W $0F7A,X 
    BRA .return 


.lessThanB:
    LDA.W $0F7A,X 
    AND.W #$FFF8 
    STA.W $0F7A,X 
    BRA .return ; >.<


.return:
    RTL 


MainAI_PirateWall:
    LDX.W $0E54 
    JSR.W ($0FA8,X) 
    RTL 


Function_PirateWall_ClimbingLeftWall:
    LDX.W $0E54 
    LDA.W #$0020 
    JSL.L IsSamusWithingAPixelRowsOfEnemy 
    BEQ RTS_B2F04D 
    LDA.W #InstList_PirateWall_FireLaser_WallJumpRight : STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    RTS 


RTS_B2F04D:
    RTS 


RTS_B2F04E:
    RTS 


RTS_B2F04F:
    RTS 


Function_PirateWall_WallJumpingRight:
    LDX.W $0E54 
    LDA.W $0FB6,X 
    LSR A 
    STA.W $0E32 
    LDA.W $0FB2,X 
    JSL.L EightBitNegativeSineMultiplication_A0B0C6 
    CLC : ADC.W $0FAE,X : STA.W $0F7A,X 
    LDA.W $0FB6,X 
    LSR #2
    STA.W $0E32 
    LDA.W $0FB2,X 
    JSL.L EightBitCosineMultiplication_A0B0B2 
    EOR.W #$FFFF 
    INC A 
    CLC : ADC.W $0FB0,X : STA.W $0F7E,X 
    LDA.W $0FB2,X : SEC : SBC.L $7E8004,X : AND.W #$00FF 
    STA.W $0FB2,X 
    CMP.L $7E8000,X 
    BNE .return 
    LDA.W #InstList_PirateWall_LandingOnRightWall : STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    LDA.W $0F7A,X 
    AND.W #$000F 
    CMP.W #$000B 
    BMI .lessThanB 
    LDA.W $0F7A,X 
    AND.W #$FFF0 
    CLC : ADC.W #$0010 : STA.W $0F7A,X 
    BRA .return 


.lessThanB:
    LDA.W $0F7A,X 
    AND.W #$FFF8 
    STA.W $0F7A,X 
    BRA .return ; >.<


.return:
    RTS 


Function_PirateWall_ClimbingRightWall:
    LDX.W $0E54 
    LDA.W #$0020 
    JSL.L IsSamusWithingAPixelRowsOfEnemy 
    BEQ RTS_B2F0E1 
    LDA.W #InstList_PirateWall_FireLaser_WallJumpLeft : STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    RTS 


RTS_B2F0E1:
    RTS 


RTS_B2F0E2:
    RTS 


RTS_B2F0E3:
    RTS 


Function_PirateWall_WallJumpingLeft:
    LDX.W $0E54 
    LDA.W $0FB6,X 
    LSR A 
    STA.W $0E32 
    LDA.W $0FB2,X 
    JSL.L EightBitNegativeSineMultiplication_A0B0C6 
    CLC : ADC.W $0FAE,X : STA.W $0F7A,X 
    LDA.W $0FB6,X 
    LSR #2
    STA.W $0E32 
    LDA.W $0FB2,X 
    JSL.L EightBitCosineMultiplication_A0B0B2 
    EOR.W #$FFFF 
    INC A 
    CLC : ADC.W $0FB0,X : STA.W $0F7E,X 
    LDA.W $0FB2,X : CLC : ADC.L $7E8004,X : AND.W #$00FF 
    STA.W $0FB2,X 
    CMP.L $7E8002,X 
    BNE .return 
    LDA.W #InstList_PirateWall_LandedOnLeftWall : STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    LDA.W $0F7A,X 
    AND.W #$000F 
    CMP.W #$000B 
    BMI .lessThanB 
    LDA.W $0F7A,X 
    AND.W #$FFF0 
    CLC : ADC.W #$0010 : STA.W $0F7A,X 
    BRA .return 


.lessThanB:
    LDA.W $0F7A,X 
    AND.W #$FFF8 
    STA.W $0F7A,X 
    BRA .return ; >.<


.return:
    RTS 


InstList_PirateNinja_ProjectileClawAttack_Left:
    dw Instruction_PirateWall_FunctionInY 
    dw RTS_A0804B 
    dw $0005 
    dw ExtendedSpritemaps_PirateNinja_0 
    dw $0005 
    dw ExtendedSpritemaps_PirateNinja_1 
    dw $0005 
    dw ExtendedSpritemaps_PirateNinja_2 
    dw $0005 
    dw ExtendedSpritemaps_PirateNinja_3 
    dw $0005 
    dw ExtendedSpritemaps_PirateNinja_4 
    dw $0002 
    dw ExtendedSpritemaps_PirateNinja_5 
    dw Instruction_PirateNinja_SpawnClawProjWithThrowDirSpawnOffset 
    dw $0000,$FFE0,$FFF8 
    dw Instruction_PirateNinja_QueueSoundInY_Lib2_Max6 
    dw $0066,$0002 
    dw ExtendedSpritemaps_PirateNinja_6 
    dw $0002 
    dw ExtendedSpritemaps_PirateNinja_7 
    dw $0002 
    dw ExtendedSpritemaps_PirateNinja_8 
    dw $0005 
    dw ExtendedSpritemaps_PirateNinja_0 
    dw $0005 
    dw ExtendedSpritemaps_PirateNinja_1 
    dw $0005 
    dw ExtendedSpritemaps_PirateNinja_2 
    dw $0005 
    dw ExtendedSpritemaps_PirateNinja_3 
    dw $0005 
    dw ExtendedSpritemaps_PirateNinja_4 
    dw $0002 
    dw ExtendedSpritemaps_PirateNinja_5 
    dw Instruction_PirateNinja_SpawnClawProjWithThrowDirSpawnOffset 
    dw $0000,$FFF0,$0008 
    dw Instruction_PirateNinja_QueueSoundInY_Lib2_Max6 
    dw $0066,$0002 
    dw ExtendedSpritemaps_PirateNinja_6 
    dw $0002 
    dw ExtendedSpritemaps_PirateNinja_7 
    dw $0002 
    dw ExtendedSpritemaps_PirateNinja_8 
    dw Instruction_Common_GotoY 
    dw InstList_PirateNinja_Active_FacingLeft_0 

InstList_PirateNinja_SpinJumpLeft_0:
    dw Instruction_PirateWall_FunctionInY 
    dw RTS_A0804B 
    dw $0005 
    dw ExtendedSpritemaps_PirateNinja_0 
    dw $0005 
    dw ExtendedSpritemaps_PirateNinja_1 
    dw $0005 
    dw ExtendedSpritemaps_PirateNinja_2 
    dw $0005 
    dw ExtendedSpritemaps_PirateNinja_3 
    dw $0005 
    dw ExtendedSpritemaps_PirateNinja_4 
    dw $0002 
    dw ExtendedSpritemaps_PirateNinja_5 
    dw Instruction_PirateNinja_SpawnClawProjWithThrowDirSpawnOffset 
    dw $0000,$FFE0,$FFF8 
    dw Instruction_PirateNinja_QueueSoundInY_Lib2_Max6 
    dw $0066,$0002 
    dw ExtendedSpritemaps_PirateNinja_6 
    dw $0002 
    dw ExtendedSpritemaps_PirateNinja_7 
    dw $0002 
    dw ExtendedSpritemaps_PirateNinja_8 
    dw Instruction_PirateNinja_ResetSpeed 
    dw Instruction_PirateWall_FunctionInY 
    dw RTS_A0804B 
    dw $0008 
    dw ExtendedSpritemaps_PirateNinja_0 
    dw Instruction_PirateWall_FunctionInY 
    dw Function_PirateNinja_SpinJumpleft_Rising 

InstList_PirateNinja_SpinJumpLeft_1:
    dw Instruction_PirateNinja_QueueSoundInY_Lib2_Max6 
    dw $003F,$0001 
    dw ExtendedSpritemaps_PirateNinja_12 
    dw $0001 
    dw ExtendedSpritemaps_PirateNinja_13 
    dw $0001 
    dw ExtendedSpritemaps_PirateNinja_14 
    dw $0001 
    dw ExtendedSpritemaps_PirateNinja_15 
    dw $0001 
    dw ExtendedSpritemaps_PirateNinja_16 
    dw $0001 
    dw ExtendedSpritemaps_PirateNinja_17 
    dw $0001 
    dw ExtendedSpritemaps_PirateNinja_18 
    dw $0001 
    dw ExtendedSpritemaps_PirateNinja_19 
    dw Instruction_Common_GotoY 
    dw InstList_PirateNinja_SpinJumpLeft_1 

InstList_PirateNinja_Active_FacingLeft_0:
    dw Instruction_PirateWall_FunctionInY 
    dw Function_PirateNinja_Active 

InstList_PirateNinja_Active_FacingLeft_1:
    dw $000A 
    dw ExtendedSpritemaps_PirateNinja_32 
    dw $000A 
    dw ExtendedSpritemaps_PirateNinja_33 
    dw $000A 
    dw ExtendedSpritemaps_PirateNinja_34 
    dw $000A 
    dw ExtendedSpritemaps_PirateNinja_33 
    dw Instruction_PirateWall_FunctionInY 
    dw RTS_A0804B 
    dw Instruction_PirateNinja_SetFunction0FAC_Active 
    dw Instruction_Common_GotoY 
    dw InstList_PirateNinja_Active_FacingLeft_1 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_PirateNinja_WalkingLeft_B2F24C:
    dw $0005 
    dw ExtendedSpritemaps_PirateNinja_22 
    dw $0005 
    dw ExtendedSpritemaps_PirateNinja_23 
    dw $0005 
    dw ExtendedSpritemaps_PirateNinja_24 
    dw $0005 
    dw ExtendedSpritemaps_PirateNinja_25 
    dw $0005 
    dw ExtendedSpritemaps_PirateNinja_26 
    dw $0005 
    dw ExtendedSpritemaps_PirateNinja_27 
    dw $0005 
    dw ExtendedSpritemaps_PirateNinja_28 
    dw $0005 
    dw ExtendedSpritemaps_PirateNinja_29 
    dw Instruction_Common_GotoY 
    dw UNUSED_InstList_PirateNinja_WalkingLeft_B2F24C 
endif ; !FEATURE_KEEP_UNREFERENCED

InstList_PirateNinja_Flinch_FacingLeft:
    dw Instruction_PirateWall_FunctionInY 
    dw RTS_A0804B 
    dw $0010 
    dw ExtendedSpritemaps_PirateNinja_38 
    dw Instruction_Common_GotoY 
    dw InstList_PirateNinja_Active_FacingLeft_0 

InstList_PirateNinja_DivekickLeft_Jump_0:
    dw Instruction_PirateWall_FunctionInY 
    dw RTS_B2804B 
    dw $0008 
    dw ExtendedSpritemaps_PirateNinja_42 
    dw Instruction_PirateNinja_SetLeftDivekickJumpInitialYSpeed 
    dw Instruction_PirateWall_FunctionInY 
    dw Instruction_PirateNinja_DivekickLeft_Jump 

InstList_PirateNinja_DivekickLeft_Jump_1:
    dw Instruction_PirateNinja_PaletteIndexInY 
    dw $0200,$0004 
    dw ExtendedSpritemaps_PirateNinja_3A 
    dw Instruction_PirateNinja_PaletteIndexInY 
    dw $0E00,$0004 
    dw ExtendedSpritemaps_PirateNinja_3A 
    dw Instruction_Common_GotoY 
    dw InstList_PirateNinja_DivekickLeft_Jump_1 
    dw Instruction_Common_Sleep 

InstList_PirateNinja_DivekickLeft_Divekick:
    dw Instruction_PirateNinja_PaletteIndexInY 
    dw $0E00 
    dw Instruction_PirateWall_FunctionInY 
    dw Instruction_PirateNinja_DivekickLeft_Divekick 
    dw Instruction_PirateNinja_QueueSoundInY_Lib2_Max6 
    dw $0066,$0001 
    dw ExtendedSpritemaps_PirateNinja_3B 
    dw Instruction_Common_Sleep 

InstList_PirateNinja_DivekickLeft_WalkToLeftPost_0:
    dw Instruction_PirateWall_FunctionInY 
    dw Instruction_PirateNinja_DivekickLeft_WalkToLeftPost 

InstList_PirateNinja_DivekickLeft_WalkToLeftPost_1:
    dw $0005 
    dw ExtendedSpritemaps_PirateNinja_22 
    dw $0005 
    dw ExtendedSpritemaps_PirateNinja_23 
    dw $0005 
    dw ExtendedSpritemaps_PirateNinja_24 
    dw $0005 
    dw ExtendedSpritemaps_PirateNinja_25 
    dw $0005 
    dw ExtendedSpritemaps_PirateNinja_26 
    dw $0005 
    dw ExtendedSpritemaps_PirateNinja_27 
    dw $0005 
    dw ExtendedSpritemaps_PirateNinja_28 
    dw $0005 
    dw ExtendedSpritemaps_PirateNinja_29 
    dw Instruction_Common_GotoY 
    dw InstList_PirateNinja_DivekickLeft_WalkToLeftPost_1 

InstList_PirateNinja_Initial_FacingLeft_0:
    dw Instruction_PirateWall_FunctionInY 
    dw Function_PirateNinja_Initial 

InstList_PirateNinja_Initial_FacingLeft_1:
    dw $0020 
    dw ExtendedSpritemaps_PirateNinja_46 
    dw $000A 
    dw ExtendedSpritemaps_PirateNinja_47 
    dw $0020 
    dw ExtendedSpritemaps_PirateNinja_48 
    dw $000A 
    dw ExtendedSpritemaps_PirateNinja_47 
    dw $0020 
    dw ExtendedSpritemaps_PirateNinja_46 
    dw Instruction_Common_GotoY 
    dw InstList_PirateNinja_Initial_FacingLeft_1 
    dw Instruction_CommonB2_Sleep 

InstList_PirateNinja_Land_FacingLeft_0:
    dw Instruction_PirateNinja_PaletteIndexInY 
    dw $0200 
    dw Instruction_PirateWall_FunctionInY 
    dw RTS_A0804B 
    dw $0004 
    dw ExtendedSpritemaps_PirateNinja_47 
    dw $0008 
    dw ExtendedSpritemaps_PirateNinja_46 
    dw $0004 
    dw ExtendedSpritemaps_PirateNinja_4C 
    dw $0004 
    dw ExtendedSpritemaps_PirateNinja_4A 
    dw Instruction_PirateWall_FunctionInY 
    dw Function_PirateNinja_ReadingToDivekick 

InstList_PirateNinja_Land_FacingLeft_1:
    dw $000A 
    dw ExtendedSpritemaps_PirateNinja_35 
    dw $000A 
    dw ExtendedSpritemaps_PirateNinja_36 
    dw $000A 
    dw ExtendedSpritemaps_PirateNinja_37 
    dw $000A 
    dw ExtendedSpritemaps_PirateNinja_36 
    dw Instruction_Common_GotoY 
    dw InstList_PirateNinja_Land_FacingLeft_1 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_PirateNinja_FacingForward_B2F328:
    dw $0008 
    dw ExtendedSpritemaps_PirateNinja_4C 
    dw Instruction_Common_Sleep 
endif ; !FEATURE_KEEP_UNREFERENCED

InstList_PirateNinja_StandingKick_FacingLeft:
    dw Instruction_PirateWall_FunctionInY 
    dw RTS_A0804B 
    dw $0004 
    dw ExtendedSpritemaps_PirateNinja_3E 
    dw Instruction_PirateNinja_QueueSoundInY_Lib2_Max6 
    dw $0066,$0004 
    dw ExtendedSpritemaps_PirateNinja_44 
    dw $0020 
    dw ExtendedSpritemaps_PirateNinja_3F 
    dw $0004 
    dw ExtendedSpritemaps_PirateNinja_44 
    dw Instruction_Common_GotoY 
    dw InstList_PirateNinja_Active_FacingLeft_0 

InstList_PirateNinja_ProjectileClawAttack_Right:
    dw Instruction_PirateWall_FunctionInY 
    dw RTS_B2804B 
    dw $0005 
    dw ExtendedSpritemaps_PirateNinja_9 
    dw $0005 
    dw ExtendedSpritemaps_PirateNinja_A 
    dw $0005 
    dw ExtendedSpritemaps_PirateNinja_B 
    dw $0005 
    dw ExtendedSpritemaps_PirateNinja_C 
    dw $0005 
    dw ExtendedSpritemaps_PirateNinja_D 
    dw $0002 
    dw ExtendedSpritemaps_PirateNinja_E 
    dw Instruction_PirateNinja_SpawnClawProjWithThrowDirSpawnOffset 
    dw $0001,$0020,$FFF8 
    dw Instruction_PirateNinja_QueueSoundInY_Lib2_Max6 
    dw $0066,$0002 
    dw ExtendedSpritemaps_PirateNinja_A 
    dw $0002 
    dw ExtendedSpritemaps_PirateNinja_F 
    dw $0002 
    dw ExtendedSpritemaps_PirateNinja_11 
    dw $0005 
    dw ExtendedSpritemaps_PirateNinja_9 
    dw $0005 
    dw ExtendedSpritemaps_PirateNinja_A 
    dw $0005 
    dw ExtendedSpritemaps_PirateNinja_B 
    dw $0005 
    dw ExtendedSpritemaps_PirateNinja_C 
    dw $0005 
    dw ExtendedSpritemaps_PirateNinja_D 
    dw $0002 
    dw ExtendedSpritemaps_PirateNinja_E 
    dw Instruction_PirateNinja_SpawnClawProjWithThrowDirSpawnOffset 
    dw $0001,$0010,$0008,$0002 
    dw ExtendedSpritemaps_PirateNinja_A 
    dw Instruction_PirateNinja_QueueSoundInY_Lib2_Max6 
    dw $0066,$0002 
    dw ExtendedSpritemaps_PirateNinja_F 
    dw $0002 
    dw ExtendedSpritemaps_PirateNinja_11 
    dw Instruction_Common_GotoY 
    dw InstList_PirateNinja_Active_FacingRight_0 

InstList_PirateNinja_SpinJumpRight_0:
    dw Instruction_PirateWall_FunctionInY 
    dw RTS_B2804B 
    dw $0005 
    dw ExtendedSpritemaps_PirateNinja_9 
    dw $0005 
    dw ExtendedSpritemaps_PirateNinja_A 
    dw $0005 
    dw ExtendedSpritemaps_PirateNinja_B 
    dw $0005 
    dw ExtendedSpritemaps_PirateNinja_C 
    dw $0005 
    dw ExtendedSpritemaps_PirateNinja_D 
    dw $0002 
    dw ExtendedSpritemaps_PirateNinja_E 
    dw Instruction_PirateNinja_SpawnClawProjWithThrowDirSpawnOffset 
    dw $0001,$0020,$FFF8 
    dw Instruction_PirateNinja_QueueSoundInY_Lib2_Max6 
    dw $0066,$0002 
    dw ExtendedSpritemaps_PirateNinja_A 
    dw $0002 
    dw ExtendedSpritemaps_PirateNinja_F 
    dw $0002 
    dw ExtendedSpritemaps_PirateNinja_11 
    dw Instruction_PirateNinja_ResetSpeed 
    dw Instruction_PirateWall_FunctionInY 
    dw RTS_A0804B 
    dw $0008 
    dw ExtendedSpritemaps_PirateNinja_9 
    dw Instruction_PirateWall_FunctionInY 
    dw Function_PirateNinja_SpinJumpRight_Rising 

InstList_PirateNinja_SpinJumpRight_1:
    dw Instruction_PirateNinja_QueueSoundInY_Lib2_Max6 
    dw $003F,$0001 
    dw ExtendedSpritemaps_PirateNinja_1A 
    dw $0001 
    dw ExtendedSpritemaps_PirateNinja_1B 
    dw $0001 
    dw ExtendedSpritemaps_PirateNinja_1C 
    dw $0001 
    dw ExtendedSpritemaps_PirateNinja_1D 
    dw $0001 
    dw ExtendedSpritemaps_PirateNinja_1E 
    dw $0001 
    dw ExtendedSpritemaps_PirateNinja_1F 
    dw $0001 
    dw ExtendedSpritemaps_PirateNinja_20 
    dw $0001 
    dw ExtendedSpritemaps_PirateNinja_21 
    dw Instruction_Common_GotoY 
    dw InstList_PirateNinja_SpinJumpRight_1 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_PirateNinja_B2F41C:
    dw $0010 
    dw ExtendedSpritemaps_PirateNinja_9 
endif ; !FEATURE_KEEP_UNREFERENCED

InstList_PirateNinja_Active_FacingRight_0:
    dw Instruction_PirateWall_FunctionInY 
    dw Function_PirateNinja_Active 

InstList_PirateNinja_Active_FacingRight_1:
    dw $000A 
    dw ExtendedSpritemaps_PirateNinja_35 
    dw $000A 
    dw ExtendedSpritemaps_PirateNinja_36 
    dw $000A 
    dw ExtendedSpritemaps_PirateNinja_37 
    dw $000A 
    dw ExtendedSpritemaps_PirateNinja_36 
    dw Instruction_PirateWall_FunctionInY 
    dw RTS_B2804B 
    dw Instruction_PirateNinja_SetFunction0FAC_Active 
    dw Instruction_Common_GotoY 
    dw InstList_PirateNinja_Active_FacingRight_1 

if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_PirateNinja_WalkingRight_B2F43E:
    dw $0005 
    dw ExtendedSpritemaps_PirateNinja_2A 
    dw $0005 
    dw ExtendedSpritemaps_PirateNinja_2B 
    dw $0005 
    dw ExtendedSpritemaps_PirateNinja_2C 
    dw $0005 
    dw ExtendedSpritemaps_PirateNinja_2D 
    dw $0005 
    dw ExtendedSpritemaps_PirateNinja_2E 
    dw $0005 
    dw ExtendedSpritemaps_PirateNinja_2F 
    dw $0005 
    dw ExtendedSpritemaps_PirateNinja_30 
    dw $0005 
    dw ExtendedSpritemaps_PirateNinja_31 
    dw Instruction_Common_GotoY 
    dw UNUSED_InstList_PirateNinja_WalkingRight_B2F43E 
endif ; !FEATURE_KEEP_UNREFERENCED

InstList_PirateNinja_Flinch_FacingRight:
    dw Instruction_PirateWall_FunctionInY 
    dw RTS_B2804B 
    dw $0010 
    dw ExtendedSpritemaps_PirateNinja_39 
    dw Instruction_Common_GotoY 
    dw InstList_PirateNinja_Active_FacingRight_0 

InstList_PirateNinja_DivekickRight_Jump_0:
    dw Instruction_PirateWall_FunctionInY 
    dw RTS_B2804B 
    dw $0008 
    dw ExtendedSpritemaps_PirateNinja_43 
    dw Instruction_PirateNinja_SetRightDivekickJumpInitialYSpeed 
    dw Instruction_PirateWall_FunctionInY 
    dw Instruction_PirateNinja_DivekickRight_Jump 

InstList_PirateNinja_DivekickRight_Jump_1:
    dw Instruction_PirateNinja_PaletteIndexInY 
    dw $0200,$0004 
    dw ExtendedSpritemaps_PirateNinja_3C 
    dw Instruction_PirateNinja_PaletteIndexInY 
    dw $0E00,$0004 
    dw ExtendedSpritemaps_PirateNinja_3C 
    dw Instruction_Common_GotoY 
    dw InstList_PirateNinja_DivekickRight_Jump_1 
    dw Instruction_Common_Sleep 

InstList_PirateNinja_DivekickRight_Divekick:
    dw Instruction_PirateNinja_PaletteIndexInY 
    dw $0E00 
    dw Instruction_PirateWall_FunctionInY 
    dw Instruction_PirateNinja_DivekickRight_Divekick 
    dw Instruction_PirateNinja_QueueSoundInY_Lib2_Max6 
    dw $0066,$0001 
    dw ExtendedSpritemaps_PirateNinja_3D 
    dw Instruction_Common_Sleep 

InstList_PirateNinja_DivekickRight_WalkToRightPost_0:
    dw Instruction_PirateWall_FunctionInY 
    dw Instruction_PirateNinja_DivekickRight_WalkToRightPost 

InstList_PirateNinja_DivekickRight_WalkToRightPost_1:
    dw $0005 
    dw ExtendedSpritemaps_PirateNinja_2A 
    dw $0005 
    dw ExtendedSpritemaps_PirateNinja_2B 
    dw $0005 
    dw ExtendedSpritemaps_PirateNinja_2C 
    dw $0005 
    dw ExtendedSpritemaps_PirateNinja_2D 
    dw $0005 
    dw ExtendedSpritemaps_PirateNinja_2E 
    dw $0005 
    dw ExtendedSpritemaps_PirateNinja_2F 
    dw $0005 
    dw ExtendedSpritemaps_PirateNinja_30 
    dw $0005 
    dw ExtendedSpritemaps_PirateNinja_31 
    dw Instruction_Common_GotoY 
    dw InstList_PirateNinja_DivekickRight_WalkToRightPost_1 

InstList_PirateNinja_Initial_FacingRight_0:
    dw Instruction_PirateWall_FunctionInY 
    dw Function_PirateNinja_Initial 

InstList_PirateNinja_Initial_FacingRight_1:
    dw $0020 
    dw ExtendedSpritemaps_PirateNinja_49 
    dw $000A 
    dw ExtendedSpritemaps_PirateNinja_4A 
    dw $0020 
    dw ExtendedSpritemaps_PirateNinja_4B 
    dw $000A 
    dw ExtendedSpritemaps_PirateNinja_4A 
    dw $0020 
    dw ExtendedSpritemaps_PirateNinja_49 
    dw Instruction_Common_GotoY 
    dw InstList_PirateNinja_Initial_FacingRight_1 
    dw Instruction_Common_Sleep 

InstList_PirateNinja_Land_FacingRight_0:
    dw Instruction_PirateNinja_PaletteIndexInY 
    dw $0200 
    dw Instruction_PirateWall_FunctionInY 
    dw RTS_A0804B 
    dw $0004 
    dw ExtendedSpritemaps_PirateNinja_4A 
    dw $0008 
    dw ExtendedSpritemaps_PirateNinja_49 
    dw $0004 
    dw ExtendedSpritemaps_PirateNinja_4C 
    dw $0004 
    dw ExtendedSpritemaps_PirateNinja_47 
    dw Instruction_PirateWall_FunctionInY 
    dw Function_PirateNinja_ReadingToDivekick 

InstList_PirateNinja_Land_FacingRight_1:
    dw $000A 
    dw ExtendedSpritemaps_PirateNinja_32 
    dw $000A 
    dw ExtendedSpritemaps_PirateNinja_33 
    dw $000A 
    dw ExtendedSpritemaps_PirateNinja_34 
    dw $000A 
    dw ExtendedSpritemaps_PirateNinja_33 
    dw Instruction_Common_GotoY 
    dw InstList_PirateNinja_Land_FacingRight_1 

InstList_PirateNinja_StandingKick_FacingRight:
    dw Instruction_PirateWall_FunctionInY 
    dw RTS_A0804B 
    dw $0004 
    dw ExtendedSpritemaps_PirateNinja_40 
    dw Instruction_PirateNinja_QueueSoundInY_Lib2_Max6 
    dw $0066,$0004 
    dw ExtendedSpritemaps_PirateNinja_45 
    dw $0020 
    dw ExtendedSpritemaps_PirateNinja_41 
    dw $0004 
    dw ExtendedSpritemaps_PirateNinja_45 
    dw Instruction_Common_GotoY 
    dw InstList_PirateNinja_Active_FacingRight_0 

Instruction_PirateNinja_PaletteIndexInY:
    PHX 
    PHY 
    LDX.W $0E54 
    LDA.W $0000,Y : STA.W $0F96,X 
    PLY 
    PLX 
    INY #2
    RTL 


Instruction_PirateNinja_QueueSoundInY_Lib2_Max6:
    PHX 
    PHY 
    LDA.W $0000,Y 
    JSL.L QueueSound_Lib2_Max6 
    PLY 
    PLX 
    INY #2
    RTL 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Instruction_PirateNinja_GotoFunction0FAC_B2F554:
    PHX 
    LDX.W $0E54 
    LDA.W #$0001 : STA.W $0F94,X 
    LDA.W $0FAC,X 
    TAY 
    PLX 
    RTL 
endif ; !FEATURE_KEEP_UNREFERENCED


Instruction_PirateNinja_SpawnClawProjWithThrowDirSpawnOffset:
    PHX 
    PHY 
    LDX.W $0E54 
    LDA.W $0002,Y : STA.B $16 
    LDA.W $0004,Y : STA.B $18 
    LDA.W $0F7A,X : STA.B $12 
    LDA.W $0F7E,X : STA.B $14 
    LDA.W $0000,Y 
    LDY.W #EnemyProjectile_PirateClaw 
    JSL.L SpawnEnemyProjectileY_ParameterA_XGraphics 
    PLY 
    PLX 
    INY #6
    RTL 


Instruction_PirateNinja_SetFunction0FAC_Active:
    PHX 
    LDX.W $0E54 
    LDA.W $0F7A,X : SEC : SBC.W $0AF6 : STA.B $12 
    LDA.W #$0001 : STA.W $0F94,X 
    LDY.W #InstList_PirateNinja_Active_FacingLeft_0 
    LDA.B $12 
    BPL .keepLeft 
    LDY.W #InstList_PirateNinja_Active_FacingRight_0 

.keepLeft:
    TYA 
    STA.W $0FAC,X 
    PLX 
    RTL 


if !FEATURE_KEEP_UNREFERENCED
UNUSED_Instruction_PirateNinja_Set0FAC_StandingKick_B2F5B3:
    PHX 
    LDX.W $0E54 
    LDA.W $0F7A,X : SEC : SBC.W $0AF6 : STA.B $12 
    LDA.W #$0001 : STA.W $0F94,X 
    LDY.W #InstList_PirateNinja_StandingKick_FacingLeft 
    LDA.B $12 
    BPL .keepLeft 
    LDY.W #InstList_PirateNinja_StandingKick_FacingRight 

.keepLeft:
    TYA 
    STA.W $0FAC,X 
    PLX 
    RTL 
endif ; !FEATURE_KEEP_UNREFERENCED


Instruction_PirateNinja_ResetSpeed:
    LDA.W #$0000 : STA.L $7E7800,X 
    RTL 


InitAI_PirateNinja:
    LDX.W $0E54 
    LDY.W #InstList_PirateNinja_Initial_FacingLeft_0 
    LDA.W $0FB4,X 
    BIT.W #$0001 
    BEQ .zeroParam1 
    LDY.W #InstList_PirateNinja_Initial_FacingRight_0 

.zeroParam1:
    TYA 
    STA.W $0F92,X 
    STA.W $0FAC,X 
    LDA.W $0FB4,X 
    BIT.W #$0001 
    BEQ .zeroParam1again 
    LDA.W $0F7A,X : STA.W $0FB0,X 
    CLC : ADC.W $0FB6,X : STA.W $0FB2,X 
    BRA + 


.zeroParam1again:
    LDA.W $0F7A,X : STA.W $0FB2,X 
    SEC : SBC.W $0FB6,X : STA.W $0FB0,X 

  + LDA.W $0FB2,X : SEC : SBC.W $0FB0,X : LSR A 
    STA.B $14 
    CLC : ADC.W $0FB0,X : STA.W $0FAE,X 
    LDA.W $0FAE,X ; >_<
    STZ.B $12 
    STZ.B $16 
    LDA.B $14 
    AND.W #$00FF 
    XBA 
    STA.B $14 

.loop:
    LDA.W #$0020 : CLC : ADC.B $12 : STA.B $12 
    CLC : ADC.B $16 : STA.B $16 
    CMP.B $14 
    BMI .loop 
    LDA.B $12 : STA.W $0FAA,X 
    LDA.B $16 
    AND.W #$FF00 
    XBA 
    STA.B $18 
    CLC : ADC.W $0FAE,X : STA.W $0FB2,X 
    LDA.W $0FAE,X : SEC : SBC.B $18 : STA.W $0FB0,X 
    LDY.W $0FB0,X 
    LDA.W $0FB4,X 
    BIT.W #$0001 
    BNE .zeroParam1again2 
    LDY.W $0FB2,X 

.zeroParam1again2:
    TYA 
    STA.W $0F7A,X 
    LDA.W #RTS_B2804B : STA.W $0FA8,X 
    LDA.W $0F7E,X : STA.L $7E7810,X 
    LDY.W #$0000 
    LDX.W #$0000 
    LDA.W #$000F : STA.B $12 

.loopPalette:
    LDA.W Palette_Pirate_Gold_NonNinja,Y : STA.L $7EC3E0,X 
    INY #2
    INX #2
    DEC.B $12 
    BPL .loopPalette 
    RTL 


MainAI_PirateNinja:
    LDX.W $0E54 
    JSR.W ($0FA8,X) 
    RTL 


Function_PirateNinja_Initial:
    LDX.W $0E54 
    LDA.W $0F7A,X : SEC : SBC.W $0AF6 : BPL + 
    EOR.W #$FFFF 
    INC A 

  + SEC : SBC.W #$0080 : BPL .tooFar 
    LDA.W $0F7A,X : SEC : SBC.W $0AF6 : STA.B $12 
    LDY.W #InstList_PirateNinja_Active_FacingLeft_0 
    LDA.B $12 
    BPL .keepLeft 
    LDY.W #InstList_PirateNinja_Active_FacingRight_0 

.keepLeft:
    TYA 
    STA.W $0F92,X 
    STA.W $0FAC,X 
    LDA.W #$0001 : STA.W $0F94,X 
    RTS 


.tooFar:
    JSR.W PirateNinja_FlinchTrigger 
    RTS 


Function_PirateNinja_Active:
    JSR.W PirateNinja_FlinchTrigger 
    BNE .return 
    JSR.W PirateNinja_StandingKickTrigger 
    BNE .return 
    JSR.W PirateNinja_SpinJumpTrigger 
    BNE .return 
    JSR.W PirateNinja_ProjectileClawAttackTrigger 

.return:
    RTS 


PirateNinja_ProjectileClawAttackTrigger:
    LDA.W $0FA4,X 
    AND.W #$003F 
    BNE .return 
    LDA.W $0F7A,X 
    CMP.W $0FB0,X 
    BEQ .reachedLeftPost 
    LDA.W $0F7A,X : SEC : SBC.W $0AF6 : BPL .return 
    LDA.W #InstList_PirateNinja_ProjectileClawAttack_Right : STA.W $0F92,X 
    BRA .set1Timer 


.reachedLeftPost:
    LDA.W $0F7A,X : SEC : SBC.W $0AF6 : BMI .return 
    LDA.W #InstList_PirateNinja_ProjectileClawAttack_Left : STA.W $0F92,X 

.set1Timer:
    LDA.W #$0001 : STA.W $0F94,X 

.return:
    RTS 


PirateNinja_FlinchTrigger:
    PHX 
    LDX.W $0E54 
    LDY.W #$0008 

.loop:
    LDA.W $0C18,Y 
    BNE .checkProjectile 
    DEY #2
    BPL .loop 
    BRA .returnNoFlinch 


.checkProjectile:
    LDA.W $0B64,Y : SEC : SBC.W $0F7A,X : BPL + 
    EOR.W #$FFFF 
    INC A 

  + SEC : SBC.W #$0020 : BPL .returnNoFlinch 
    LDA.W $0B78,Y : SEC : SBC.W $0F7E,X : BPL + 
    EOR.W #$FFFF 
    INC A 

  + SEC : SBC.W #$0020 : BPL .returnNoFlinch 
    LDA.W $0F7A,X : SEC : SBC.W $0AF6 : STA.B $12 
    LDY.W #InstList_PirateNinja_Flinch_FacingLeft 
    LDA.B $12 
    BPL .keepLeft 
    LDY.W #InstList_PirateNinja_Flinch_FacingRight 

.keepLeft:
    TYA 
    STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    PLX 
    LDA.W #$0001 
    RTS 


.returnNoFlinch:
    PLX 
    LDA.W #$0000 
    RTS 


PirateNinja_SpinJumpTrigger:
    PHX 
    LDX.W $0E54 
    LDA.W $0FAE,X : SEC : SBC.W $0AF6 : BPL + 
    EOR.W #$FFFF 
    INC A 

  + SEC : SBC.W #$0020 : BPL .returnNoSpinJump 
    LDY.W #InstList_PirateNinja_SpinJumpLeft_0 
    LDA.W $0F7A,X 
    CMP.W $0FB0,X 
    BNE .keepLeft 
    LDY.W #InstList_PirateNinja_SpinJumpRight_0 

.keepLeft:
    TYA 
    STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    PLX 
    LDA.W #$0001 
    RTS 


.returnNoSpinJump:
    PLX 
    LDA.W #$0000 
    RTS 


PirateNinja_StandingKickTrigger:
    PHX 
    LDX.W $0E54 
    LDA.W $0AF6 : SEC : SBC.W $0F7A,X : BPL + 
    EOR.W #$FFFF 
    INC A 

  + SEC : SBC.W #$0028 : BPL .returnNoStandingKick 
    LDA.W $0AFA : SEC : SBC.W $0F7E,X : BPL + 
    EOR.W #$FFFF 
    INC A 

  + SEC : SBC.W #$0028 : BPL .returnNoStandingKick 
    LDA.W $0F7A,X : SEC : SBC.W $0AF6 : STA.B $12 
    LDY.W #InstList_PirateNinja_StandingKick_FacingLeft 
    LDA.B $12 
    BPL .kepLeft 
    LDY.W #InstList_PirateNinja_StandingKick_FacingRight 

.kepLeft:
    TYA 
    STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    PLX 
    LDA.W #$0001 
    RTS 


.returnNoStandingKick:
    PLX 
    LDA.W #$0000 
    RTS 


Function_PirateNinja_SpinJumpleft_Rising:
    LDA.L $7E7800,X 
    AND.W #$FF00 
    XBA 
    STA.B $12 
    LDA.W $0F7A,X : SEC : SBC.B $12 : STA.W $0F7A,X 
    DEC.W $0F7E,X 
    DEC.W $0F7E,X 
    LDA.L $7E7800,X : CLC : ADC.W #$0020 : STA.L $7E7800,X 
    LDA.W $0F7A,X 
    CMP.W $0FAE,X 
    BMI .falling 
    RTS 


.falling:
    LDA.W #Function_PirateNinja_SpinJumpLeft_Falling : STA.W $0FA8,X 
    RTS 


Function_PirateNinja_SpinJumpLeft_Falling:
    LDA.L $7E7800,X 
    AND.W #$FF00 
    XBA 
    STA.B $12 
    LDA.W $0F7A,X : SEC : SBC.B $12 : STA.W $0F7A,X 
    INC.W $0F7E,X 
    INC.W $0F7E,X 
    LDA.L $7E7800,X : SEC : SBC.W #$0020 : STA.L $7E7800,X 
    BEQ .landing 
    RTS 


.landing:
    LDA.W #RTS_B2804B : STA.W $0FA8,X 
    LDA.W #InstList_PirateNinja_Land_FacingLeft_0 : STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    LDA.W $0FB0,X : STA.W $0F7A,X 
    JSR.W PirateNinja_SpawnLandingDustCloud 
    RTS 


Function_PirateNinja_SpinJumpRight_Rising:
    LDA.L $7E7800,X 
    AND.W #$FF00 
    XBA 
    STA.B $12 
    LDA.W $0F7A,X : CLC : ADC.B $12 : STA.W $0F7A,X 
    DEC.W $0F7E,X 
    DEC.W $0F7E,X 
    LDA.L $7E7800,X : CLC : ADC.W #$0020 : STA.L $7E7800,X 
    LDA.W $0F7A,X 
    CMP.W $0FAE,X 
    BPL .falling 
    RTS 


.falling:
    LDA.W #Function_PirateNinja_SpinJumpRight_Falling : STA.W $0FA8,X 
    RTS 


Function_PirateNinja_SpinJumpRight_Falling:
    LDA.L $7E7800,X 
    AND.W #$FF00 
    XBA 
    STA.B $12 
    LDA.W $0F7A,X : CLC : ADC.B $12 : STA.W $0F7A,X 
    INC.W $0F7E,X 
    INC.W $0F7E,X 
    LDA.L $7E7800,X : SEC : SBC.W #$0020 : STA.L $7E7800,X 
    BEQ .landing 
    RTS 


.landing:
    LDA.W #RTS_B2804B : STA.W $0FA8,X 
    LDA.W #InstList_PirateNinja_Land_FacingRight_0 : STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    LDA.W $0FB2,X : STA.W $0F7A,X 
    JSR.W PirateNinja_SpawnLandingDustCloud 
    RTS 


Function_PirateNinja_ReadingToDivekick:
    JSR.W PirateNinja_FlinchTrigger 
    BNE .return 
    JSR.W PirateNinja_StandingKickTrigger 
    BNE .return 
    JSR.W PirateNinja_DivekickTrigger 

.return:
    RTS 


PirateNinja_DivekickTrigger:
    LDX.W $0E54 
    LDA.W $0FAE,X : SEC : SBC.W $0AF6 : BPL + 
    EOR.W #$FFFF 
    INC A 

  + SEC : SBC.W #$0020 : BPL .return 

.loopRNG:
    JSL.L GenerateRandomNumber 
    AND.W #$0003 
    BEQ .loopRNG 
    STA.B $12 
    LDY.W #$0000 
    LDA.W $0F7A,X 
    CMP.W $0FB0,X 
    BNE .keepLeft 
    LDY.W #$0004 

.keepLeft:
    TYA 
    CLC : ADC.B $12 : ASL A 
    TAY 
    LDA.W .leftPointers,Y : STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 

.return:
    RTS 


.leftPointers:
    dw $0000 
    dw InstList_PirateNinja_DivekickLeft_Jump_0 
    dw InstList_PirateNinja_DivekickLeft_Jump_0 
    dw InstList_PirateNinja_DivekickLeft_Jump_0 

.rightPointers:
    dw $0000 
    dw InstList_PirateNinja_DivekickRight_Jump_0 
    dw InstList_PirateNinja_DivekickRight_Jump_0 
    dw InstList_PirateNinja_DivekickRight_Jump_0 

Instruction_PirateNinja_SetLeftDivekickJumpInitialYSpeed:
    PHX 
    PHY 
    LDA.W #$0600 : STA.L $7E7800,X 
    LDA.W $0FB2,X : SEC : SBC.W $0FAE,X : LSR A 
    CLC : ADC.W $0FAE,X : STA.L $7E7806,X 
    PLY 
    PLX 
    RTL 


Instruction_PirateNinja_DivekickLeft_Jump:
    LDA.L $7E7800,X 
    AND.W #$FF00 
    XBA 
    STA.B $12 
    LDA.W $0F7E,X : SEC : SBC.B $12 : STA.W $0F7E,X 
    LDA.L $7E7800,X : SEC : SBC.W #$0040 : STA.L $7E7800,X 
    BMI .negativeSpeed 
    RTS 


.negativeSpeed:
    LDA.W #Instruction_PirateNinja_DivekickLeft_Divekick : STA.W $0FA8,X 
    LDA.W #InstList_PirateNinja_DivekickLeft_Divekick : STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    LDA.W #$0600 : STA.L $7E7800,X 
    RTS 


Instruction_PirateNinja_DivekickLeft_Divekick:
    LDA.W $0F7A,X : SEC : SBC.W #$0005 : STA.W $0F7A,X 
    LDA.L $7E7800,X 
    AND.W #$FF00 
    XBA 
    STA.B $14 
    LDA.L $7E7800,X 
    AND.W #$00FF 
    STA.B $12 
    JSL.L MoveEnemyDownBy_14_12 
    BCS .collision 
    LDA.L $7E7800,X : SEC : SBC.W #$0040 : STA.L $7E7800,X 
    BMI .collision 
    BIT.W #$FF00 
    BEQ .collision 
    RTS 


.collision:
    LDA.W #Instruction_PirateNinja_DivekickLeft_WalkToLeftPost : STA.W $0FA8,X 
    LDA.W #InstList_PirateNinja_DivekickLeft_WalkToLeftPost_0 : STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    LDA.L $7E7810,X : STA.W $0F7E,X 
    JSR.W PirateNinja_SpawnLandingDustCloud 
    RTS 


Instruction_PirateNinja_DivekickLeft_WalkToLeftPost:
    LDA.W $0F7A,X : CLC : ADC.W #$FFFE : STA.W $0F7A,X 
    CMP.W $0FB0,X 
    BPL .return 
    LDA.W $0FB0,X : STA.W $0F7A,X 
    LDA.W #InstList_PirateNinja_Land_FacingLeft_0 : STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    LDA.W #RTS_B2804B : STA.W $0FA8,X 

.return:
    RTS 


Instruction_PirateNinja_SetRightDivekickJumpInitialYSpeed:
    PHX 
    PHY 
    LDA.W #$0600 : STA.L $7E7800,X 
    LDA.W $0FAE,X : SEC : SBC.W $0FB0,X : LSR A 
    CLC : ADC.W $0FB0,X : STA.L $7E7806,X 
    PLY 
    PLX 
    RTL 


Instruction_PirateNinja_DivekickRight_Jump:
    LDA.L $7E7800,X 
    AND.W #$FF00 
    XBA 
    STA.B $12 
    LDA.W $0F7E,X : SEC : SBC.B $12 : STA.W $0F7E,X 
    LDA.L $7E7800,X : SEC : SBC.W #$0040 : STA.L $7E7800,X 
    BMI .negativeSpeed 
    RTS 


.negativeSpeed:
    LDA.W #Instruction_PirateNinja_DivekickRight_Divekick : STA.W $0FA8,X 
    LDA.W #InstList_PirateNinja_DivekickRight_Divekick : STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    LDA.W #$0600 : STA.L $7E7800,X 
    RTS 


Instruction_PirateNinja_DivekickRight_Divekick:
    LDA.W $0F7A,X : CLC : ADC.W #$0005 : STA.W $0F7A,X 
    LDA.L $7E7800,X 
    AND.W #$FF00 
    XBA 
    STA.B $14 
    LDA.L $7E7800,X 
    AND.W #$00FF 
    STA.B $12 
    JSL.L MoveEnemyDownBy_14_12 
    BCS .landing 
    LDA.L $7E7800,X : SEC : SBC.W #$0040 : STA.L $7E7800,X 
    BMI .landing 
    BIT.W #$FF00 
    BEQ .landing 
    RTS 


.landing:
    LDA.W #Instruction_PirateNinja_DivekickRight_WalkToRightPost : STA.W $0FA8,X 
    LDA.W #InstList_PirateNinja_DivekickRight_WalkToRightPost_0 : STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    LDA.L $7E7810,X : STA.W $0F7E,X 
    JSR.W PirateNinja_SpawnLandingDustCloud 
    RTS 


Instruction_PirateNinja_DivekickRight_WalkToRightPost:
    LDA.W $0F7A,X : CLC : ADC.W #$0002 : STA.W $0F7A,X 
    CMP.W $0FB2,X 
    BMI .return 
    LDA.W $0FB2,X : STA.W $0F7A,X 
    LDA.W #InstList_PirateNinja_Land_FacingRight_0 : STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    LDA.W #RTS_B2804B : STA.W $0FA8,X 

.return:
    RTS 


PirateNinja_SpawnLandingDustCloud:
    LDA.W $0F7A,X : SEC : SBC.W #$0008 : STA.B $12 
    LDA.W $0F7E,X : CLC : ADC.W #$001C : STA.B $14 
    LDA.W #$000A : STA.B $16 
    STZ.B $18 
    JSL.L Create_Sprite_Object 
    LDA.W $0F7A,X : CLC : ADC.W #$0008 : STA.B $12 
    LDA.W $0F7E,X : CLC : ADC.W #$001C : STA.B $14 
    LDA.W #$000A : STA.B $16 
    STZ.B $18 
    JSL.L Create_Sprite_Object 
    RTS 


InstList_PirateWalking_Flinch_FacingLeft:
    dw Instruction_PirateWalking_FunctionInY 
    dw RTS_A0804B 
    dw $0010 
    dw ExtendedSpritemaps_PirateWalking_23 
    dw Instruction_Common_GotoY 
    dw InstList_PirateWalking_WalkingLeft_0 

InstList_PirateWalking_Flinch_FacingRight:
    dw Instruction_PirateWalking_FunctionInY 
    dw RTS_A0804B 
    dw $0010 
    dw ExtendedSpritemaps_PirateWalking_24 
    dw Instruction_Common_GotoY 
    dw InstList_PirateWalking_WalkingRight_0 

InstList_PirateWalking_WalkingLeft_0:
    dw Instruction_PirateWalking_FunctionInY 
    dw Function_PirateWalking_WalkingLeft 

InstList_PirateWalking_WalkingLeft_1:
    dw $000A 
    dw ExtendedSpritemaps_PirateWalking_0 
    dw $000A 
    dw ExtendedSpritemaps_PirateWalking_1 
    dw $000A 
    dw ExtendedSpritemaps_PirateWalking_2 
    dw $000A 
    dw ExtendedSpritemaps_PirateWalking_3 
    dw $000A 
    dw ExtendedSpritemaps_PirateWalking_4 
    dw $000A 
    dw ExtendedSpritemaps_PirateWalking_5 
    dw $000A 
    dw ExtendedSpritemaps_PirateWalking_6 
    dw $000A 
    dw ExtendedSpritemaps_PirateWalking_7 
    dw Instruction_Common_GotoY 
    dw InstList_PirateWalking_WalkingLeft_1 

InstList_PirateWalking_FireLasersLeft:
    dw Instruction_PirateWalking_FunctionInY 
    dw RTS_B2FE4A 
    dw $0018 
    dw ExtendedSpritemaps_PirateWalking_10 
    dw $0008 
    dw ExtendedSpritemaps_PirateWalking_11 
    dw $0008 
    dw ExtendedSpritemaps_PirateWalking_12 
    dw $0008 
    dw ExtendedSpritemaps_PirateWalking_13 
    dw Instruction_PirateWalking_FireLaserLeftWithYOffsetInY 
    dw $0008,$0008 
    dw ExtendedSpritemaps_PirateWalking_14 
    dw Instruction_PirateWalking_FireLaserLeftWithYOffsetInY 
    dw $0002,$0018 
    dw ExtendedSpritemaps_PirateWalking_15 
    dw Instruction_PirateWalking_FireLaserLeftWithYOffsetInY 
    dw $FFF8,$0008 
    dw ExtendedSpritemaps_PirateWalking_14 
    dw $0008 
    dw ExtendedSpritemaps_PirateWalking_13 
    dw $0008 
    dw ExtendedSpritemaps_PirateWalking_12 
    dw $0008 
    dw ExtendedSpritemaps_PirateWalking_11 
    dw Instruction_PirateWalking_ChooseAMovement 

InstList_PirateWalking_LookingAround_FacingLeft:
    dw Instruction_PirateWalking_FunctionInY 
    dw RTS_B2FE4A 
    dw $0020 
    dw ExtendedSpritemaps_PirateWalking_1C 
    dw $000A 
    dw ExtendedSpritemaps_PirateWalking_1D 
    dw $0020 
    dw ExtendedSpritemaps_PirateWalking_1E 
    dw $000A 
    dw ExtendedSpritemaps_PirateWalking_1D 
    dw $0020 
    dw ExtendedSpritemaps_PirateWalking_1C 
    dw $0008 
    dw ExtendedSpritemaps_PirateWalking_22 
    dw Instruction_Common_GotoY 
    dw InstList_PirateWalking_WalkingRight_0 

InstList_PirateWalking_WalkingRight_0:
    dw Instruction_PirateWalking_FunctionInY 
    dw Function_PirateWalking_WalkingRight 

InstList_PirateWalking_WalkingRight_1:
    dw $000A 
    dw ExtendedSpritemaps_PirateWalking_8 
    dw $000A 
    dw ExtendedSpritemaps_PirateWalking_9 
    dw $000A 
    dw ExtendedSpritemaps_PirateWalking_A 
    dw $000A 
    dw ExtendedSpritemaps_PirateWalking_B 
    dw $000A 
    dw ExtendedSpritemaps_PirateWalking_C 
    dw $000A 
    dw ExtendedSpritemaps_PirateWalking_D 
    dw $000A 
    dw ExtendedSpritemaps_PirateWalking_E 
    dw $000A 
    dw ExtendedSpritemaps_PirateWalking_F 
    dw Instruction_Common_GotoY 
    dw InstList_PirateWalking_WalkingRight_1 

InstList_PirateWalking_FireLasersRight:
    dw Instruction_PirateWalking_FunctionInY 
    dw RTS_B2FE4A 
    dw $0018 
    dw ExtendedSpritemaps_PirateWalking_16 
    dw $0008 
    dw ExtendedSpritemaps_PirateWalking_17 
    dw $0008 
    dw ExtendedSpritemaps_PirateWalking_18 
    dw $0008 
    dw ExtendedSpritemaps_PirateWalking_19 
    dw Instruction_PirateWalking_FireLaserRightWithYOffsetInY 
    dw $0008,$0008 
    dw ExtendedSpritemaps_PirateWalking_1A 
    dw Instruction_PirateWalking_FireLaserRightWithYOffsetInY 
    dw $0002,$0018 
    dw ExtendedSpritemaps_PirateWalking_1B 
    dw Instruction_PirateWalking_FireLaserRightWithYOffsetInY 
    dw $FFF8,$0008 
    dw ExtendedSpritemaps_PirateWalking_1A 
    dw $0008 
    dw ExtendedSpritemaps_PirateWalking_19 
    dw $0008 
    dw ExtendedSpritemaps_PirateWalking_18 
    dw $0008 
    dw ExtendedSpritemaps_PirateWalking_17 
    dw Instruction_PirateWalking_ChooseAMovement 

InstList_PirateWalking_LookingAround_FacingRight:
    dw Instruction_PirateWalking_FunctionInY 
    dw RTS_B2FE4A 
    dw $0020 
    dw ExtendedSpritemaps_PirateWalking_1F 
    dw $000A 
    dw ExtendedSpritemaps_PirateWalking_20 
    dw $0020 
    dw ExtendedSpritemaps_PirateWalking_21 
    dw $000A 
    dw ExtendedSpritemaps_PirateWalking_20 
    dw $0020 
    dw ExtendedSpritemaps_PirateWalking_1F 
    dw $0008 
    dw ExtendedSpritemaps_PirateWalking_22 
    dw Instruction_Common_GotoY 
    dw InstList_PirateWalking_WalkingLeft_0 

Instruction_PirateWalking_FireLaserLeftWithYOffsetInY:
    PHX 
    PHY 
    LDX.W $0E54 
    LDA.W $0F7A,X : SEC : SBC.W #$0018 : STA.B $12 
    LDA.W $0F7E,X : SEC : SBC.W $0000,Y : STA.B $14 
    LDA.W #$0000 : STA.B $16 
    LDY.W #EnemyProjectile_PirateMotherBrainLaser 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    PLY 
    PLX 
    INY #2
    RTL 


Instruction_PirateWalking_FireLaserRightWithYOffsetInY:
    PHX 
    PHY 
    LDX.W $0E54 
    LDA.W $0F7A,X : CLC : ADC.W #$0018 : STA.B $12 
    LDA.W $0F7E,X : SEC : SBC.W $0000,Y : STA.B $14 
    LDA.W #$0001 : STA.B $16 
    LDY.W #EnemyProjectile_PirateMotherBrainLaser 
    JSL.L SpawnEnemyProjectileY_ParameterA_RoomGraphics 
    PLY 
    PLX 
    INY #2
    RTL 


Instruction_PirateWalking_FunctionInY:
    PHY 
    PHX 
    LDX.W $0E54 
    LDA.W $0000,Y : STA.W $0FA8,X 
    PLX 
    PLY 
    INY #2
    RTL 


Instruction_PirateWalking_ChooseAMovement:
    PHX 
    LDX.W $0E54 
    LDA.W #$0010 
    PHY 
    JSL.L IsSamusWithingAPixelRowsOfEnemy 
    PLY 
    AND.W #$FFFF 
    BNE .verticalClose 
    LDX.W $0E54 
    LDY.W #InstList_PirateWalking_WalkingRight_0 
    LDA.W $0AF6 : SEC : SBC.W $0F7A,X : BMI .returnWalking 
    LDY.W #InstList_PirateWalking_WalkingLeft_0 

.returnWalking:
    PLX 
    RTL 


.verticalClose:
    LDX.W $0E54 
    LDY.W #InstList_PirateWalking_FireLasersLeft 
    LDA.W $0AF6 : SEC : SBC.W $0F7A,X : BMI .returnLasers 
    LDY.W #InstList_PirateWalking_FireLasersRight 

.returnLasers:
    PLX 
    RTL 


InitAI_PirateWalking:
    LDX.W $0E54 
    LDY.W #InstList_PirateWalking_WalkingLeft_0 
    LDA.W $0FB4,X 
    BIT.W #$0001 
    BEQ .keepLeft 
    LDY.W #InstList_PirateWalking_WalkingRight_0 

.keepLeft:
    TYA 
    STA.W $0F92,X 
    LDA.W #RTS_B2804B : STA.W $0FA8,X 
    LDA.W $0F7A,X : CLC : ADC.W $0FB6,X : STA.W $0FB2,X 
    LDA.W $0F7A,X : SEC : SBC.W $0FB6,X : STA.W $0FB0,X 
    RTL 


MainAI_PirateWalking:
    LDX.W $0E54 
    JSR.W ($0FA8,X) 
    LDA.W $0FB4,X 
    BIT.W #$8000 
    BEQ .return 
    JSR.W PirateWalking_FlinchTrigger 

.return:
    RTL 


Function_PirateWalking_WalkingLeft:
    LDX.W $0E54 
    LDA.W #$0010 
    JSL.L IsSamusWithingAPixelRowsOfEnemy 
    BEQ .walk 
    LDY.W #InstList_PirateWalking_FireLasersLeft 
    LDA.W $0AF6 : SEC : SBC.W $0F7A,X : BMI .keepLeft 
    LDY.W #InstList_PirateWalking_FireLasersRight 

.keepLeft:
    TYA 
    STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    RTS 


.walk:
    LDA.W #$0001 : STA.B $14 
    STZ.B $12 
    JSL.L MoveEnemyDownBy_14_12 
    BCC .return 
    LDA.W $0F7A,X : STA.L $7E7800,X 
    CLC : ADC.W #$FFEF : STA.W $0F7A,X 
    LDA.W #$0001 : STA.B $14 
    STZ.B $12 
    JSL.L MoveEnemyDownBy_14_12 
    PHP 
    LDA.L $7E7800,X : STA.W $0F7A,X 
    PLP 
    BCC .collision 
    LDA.W #$0000 : STA.B $12 
    LDA.W #$FFF7 : STA.B $14 
    JSL.L CheckForHorizontalSolidBlockCollision 
    LDA.W #$C7FF : STA.B $12 
    LDA.W #$FFFF : STA.B $14 
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes 
    BCS .collision 
    LDA.W $0F7A,X 
    CMP.W $0FB0,X 
    BPL .return 

.collision:
    LDA.W #InstList_PirateWalking_LookingAround_FacingLeft : STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 

.return:
    RTS 


Function_PirateWalking_WalkingRight:
    LDX.W $0E54 
    LDA.W #$0010 
    JSL.L IsSamusWithingAPixelRowsOfEnemy 
    BEQ .walk 
    LDY.W #InstList_PirateWalking_FireLasersLeft 
    LDA.W $0AF6 : SEC : SBC.W $0F7A,X : BMI .keepLeft 
    LDY.W #InstList_PirateWalking_FireLasersRight 

.keepLeft:
    TYA 
    STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    RTS 


.walk:
    LDA.W #$0001 : STA.B $14 
    STZ.B $12 
    JSL.L MoveEnemyDownBy_14_12 
    BCC .return 
    LDA.W $0F7A,X : STA.L $7E7800,X 
    CLC : ADC.W #$0010 : STA.W $0F7A,X 
    LDA.W #$0001 : STA.B $14 
    STZ.B $12 
    JSL.L MoveEnemyDownBy_14_12 
    PHP 
    LDA.L $7E7800,X : STA.W $0F7A,X 
    PLP 
    BCC .collision 
    LDA.W #$3800 : STA.B $12 
    LDA.W #$0000 : STA.B $14 
    JSL.L MoveEnemyRightBy_14_12_IgnoreSlopes 
    BCS .collision 
    LDA.W $0F7A,X 
    CMP.W $0FB2,X 
    BMI .return 

.collision:
    LDA.W #InstList_PirateWalking_LookingAround_FacingRight : STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 

.return:
    RTS 


RTS_B2FE4A:
    RTS 


PirateWalking_FlinchTrigger:
    PHX 
    LDX.W $0E54 
    LDY.W #$0008 

.loopProjectiles:
    LDA.W $0C18,Y 
    BNE .checkProjectile 
    DEY #2
    BPL .loopProjectiles 
    BRA .returnNoFlinch 


.checkProjectile:
    LDA.W $0B64,Y : SEC : SBC.W $0F7A,X : BPL + 
    EOR.W #$FFFF 
    INC A 

  + SEC : SBC.W #$0020 : BPL .returnNoFlinch 
    LDA.W $0B78,Y : SEC : SBC.W $0F7E,X : BPL + 
    EOR.W #$FFFF 
    INC A 

  + SEC : SBC.W #$0020 : BPL .returnNoFlinch 
    LDA.W $0F7A,X : SEC : SBC.W $0AF6 : STA.B $12 
    LDY.W #InstList_PirateWalking_Flinch_FacingLeft 
    LDA.B $12 
    BPL .keepLeft 
    LDY.W #InstList_PirateWalking_Flinch_FacingRight 

.keepLeft:
    TYA 
    STA.W $0F92,X 
    LDA.W #$0001 : STA.W $0F94,X 
    PLX 
    LDA.W #$0001 
    RTS 


.returnNoFlinch:
    PLX 
    LDA.W #$0000 
    RTS 


Freespace_BankB2_FEAA: 
; $156 bytes
