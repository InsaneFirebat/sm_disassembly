
org $B28000


; Common to all enemy code banks

;;; $8000: Grapple AI - no interaction. Also unfreezes enemies(!) ;;;
CommonB2_GrappleAI_NoInteraction:
; Used by skultera, Draygon body, fire arc, Phantoon, etecoon, dachora and WS ghost
    JSL GrappleAI_SwitchEnemyAIToMainAI
    RTL


;;; $8005: Grapple AI - Samus latches on ;;;
CommonB2_GrappleAI_SamusLatchesOn:
; Used by gripper and Crocomire
    JSL GrappleAI_SamusLatchesOnWithGrapple
    RTL


;;; $800A: Grapple AI - kill enemy ;;;
CommonB2_GrappleAI_KillEnemy:
; Common
    JSL GrappleAI_EnemyGrappleDeath
    RTL


;;; $800F: Grapple AI - cancel grapple beam ;;;
CommonB2_GrappleAI_CancelGrappleBeam:
; Common
    JSL GrappleAI_SwitchToFrozenAI
    RTL


;;; $8014: Grapple AI - Samus latches on - no invincibility ;;;
CommonB2_GrappleAI_SamusLatchesOn_NoInvincibility:
; Used by powamp
    JSL GrappleAI_SamusLatchesOnWithGrapple_NoInvincibility
    RTL


;;; $8019: Unused. Grapple AI - Samus latches on - paralyse enemy ;;;
UNUSED_CommonB2_GrappleAI_SamusLatchesOn_ParalyzeEnemy_B28019:
    JSL GrappleAI_SamusLatchesOnWithGrapple_ParalyzeEnemy
    RTL


;;; $801E: Grapple AI - hurt Samus ;;;
CommonB2_GrappleAI_HurtSamus:
; Used by WS spark
; Hurt reaction happens in $9B:B932
    JSL GrappleAI_SwitchToFrozenAI_duplicate
    RTL


;;; $8023: Normal enemy touch AI ;;;
CommonB2_NormalEnemyTouchAI:
    JSL NormalEnemyTouchAI
    RTL


;;; $8028: Normal touch AI - no death check ;;;
CommonB2_NormalTouchAI_NoDeathCheck:
    JSL NormalEnemyTouchAI_NoDeathCheck_External
    RTL


;;; $802D: Normal enemy shot AI ;;;
CommonB2_NormalEnemyShotAI:
    JSL NormalEnemyShotAI
    RTL


;;; $8032: Normal enemy shot AI - no death check, no enemy shot graphic ;;;
CommonB2_NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic:
    JSL NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External
    RTL


;;; $8037: Normal enemy power bomb AI ;;;
CommonB2_NormalEnemyPowerBombAI:
    JSL NormalEnemyPowerBombAI
    RTL


;;; $803C: Normal enemy power bomb AI - no death check ;;;
CommonB2_NormalEnemyPowerBombAI_NoDeathCheck:
; Kraid's power bomb AI
    JSL NormalEnemyPowerBombAI_NoDeathCheck_External
    RTL


;;; $8041: Normal enemy frozen AI ;;;
CommonB2_NormalEnemyFrozenAI:
    JSL NormalEnemyFrozenAI
    RTL


;;; $8046: Creates a dud shot ;;;
CommonB2_CreateADudShot:
    JSL CreateADudShot
    RTL


;;; $804B: RTS ;;;
RTS_B2804B:
    RTS


;;; $804C: RTL ;;;
RTL_B2804C:
    RTL


;;; $804D: Spritemap - nothing ;;;
Spritemap_CommonB2_Nothing:
    dw $0000


;;; $804F: Extended spritemap - nothing ;;;
ExtendedSpritemap_CommonB2_Nothing:
    dw $0001
    dw $0000,$0000
    dw Spritemap_CommonB2_Nothing
    dw Hitbox_CommonB2_Nothing


;;; $8059: Hitbox - nothing ;;;
Hitbox_CommonB2_Nothing:
; [n entries] [[left offset] [top offset] [right offset] [bottom offset] [p touch] [p shot]]...
    dw $0001
    dw $0000,$0000,$0000,$0000
    dw CommonB2_NormalEnemyTouchAI
    dw CommonB2_NormalEnemyShotAI


;;; $8067: Instruction list - delete enemy ;;;
InstList_CommonB2_DeleteEnemy:
    dw Instruction_CommonB2_DeleteEnemy


;;; $8069: Two NOPs ;;;
NOPNOP_B28069:
; Used as palette by respawning enemy placeholder and Draygon's eye o_O
    NOP #2


;;; $806B: Instruction - Enemy.var5 = [[Y]] ;;;
Instruction_CommonB2_Enemy0FB2_InY:
; Used only by torizos (for enemy movement function) and escape etecoon (for enemy function)
    LDA.W $0000,Y : STA.W Enemy.var5,X
    INY #2
    RTL


;;; $8074: Instruction - Enemy.var5 = RTS ;;;
Instruction_CommonB2_SetEnemy0FB2ToRTS:
    LDA.W #RTS_B2807B : STA.W Enemy.var5,X
    RTL


RTS_B2807B:
    RTS


;;; $807C: Instruction - delete enemy ;;;
Instruction_CommonB2_DeleteEnemy:
    LDA.W Enemy.properties,X : ORA.W #$0200 : STA.W Enemy.properties,X
    PLA
    PEA.W ProcessEnemyInstructions_return-1
    RTL


;;; $808A: Instruction - call function [[Y]] ;;;
Instruction_CommonB2_CallFunctionInY:
    LDA.W $0000,Y : STA.B DP_Temp12
    PHY : PHX
    PEA .manualReturn-1
    JMP.W (DP_Temp12)

  .manualReturn:
    PLX : PLY
    INY #2
    RTL


;;; $809C: Instruction - call function [[Y]] with A = [[Y] + 2] ;;;
Instruction_CommonB2_CallFunctionInY_WithA:
    LDA.W $0000,Y : STA.B DP_Temp12
    LDA.W $0002,Y
    PHY : PHX
    PEA .manualReturn-1
    JMP.W (DP_Temp12)

  .manualReturn:
    PLX : PLY
    TYA : CLC : ADC.W #$0004 : TAY
    RTL


if !FEATURE_KEEP_UNREFERENCED
;;; $80B5: Unused. Instruction - call external function [[Y]] ;;;
UNUSED_Instruction_CommonB2_CallExternalFunctionInY_B280B5:
    LDA.W $0000,Y : STA.B DP_Temp12
    LDA.W $0001,Y : STA.B DP_Temp13
    PHX : PHY
    JSL .externalFunction
    PLY : PLX
    INY #3
    RTL

  .externalFunction:
    JML.W [DP_Temp12]


;;; $80CE: Unused. Instruction - call external function [[Y]] with A = [[Y] + 3] ;;;
UNUSED_Inst_CommonB2_CallExternalFunctionInY_WithA_B280CE:
    LDA.W $0000,Y : STA.B DP_Temp12
    LDA.W $0001,Y : STA.B DP_Temp13
    LDA.W $0003,Y : PHX
    PHY
    JSL .externalFunction
    PLY : PLX
    TYA : CLC : ADC.W #$0005 : TAY
    RTL

  .externalFunction:
    JML.W [DP_Temp12]
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $80ED: Instruction - go to [[Y]] ;;;
Instruction_CommonB2_GotoY:
    LDA.W $0000,Y : TAY
    RTL


;;; $80F2: Instruction - go to [[Y]] + ±[[Y]] ;;;
Instruction_CommonB2_GotoY_PlusY:
    STY.B DP_Temp12
    DEY
    LDA.W $0000,Y : XBA : BMI .highByte
    AND.W #$00FF
    BRA +

  .highByte:
    ORA.W #$FF00

+   CLC : ADC.B DP_Temp12 : TAY
    RTL


;;; $8108: Instruction - decrement timer and go to [[Y]] if non-zero ;;;
Instruction_CommonB2_DecrementTimer_GotoYIfNonZero:
    DEC.W Enemy.loopCounter,X : BNE Instruction_CommonB2_GotoY
    INY #2
    RTL


;;; $8110: Instruction - decrement timer and go to [[Y]] if non-zero ;;;
Instruction_CommonB2_DecrementTimer_GotoYIfNonZero_duplicate:
    DEC.W Enemy.loopCounter,X : BNE Instruction_CommonB2_GotoY
    INY #2
    RTL


;;; $8118: Instruction - decrement timer and go to [Y] + ±[[Y]] if non-zero ;;;
Instruction_CommonB2_DecrementTimer_GotoY_PlusY_IfNonZero:
    SEP #$20
    DEC.W Enemy.loopCounter,X
    REP #$20
    BNE Instruction_CommonB2_GotoY_PlusY
    INY
    RTL


;;; $8123: Instruction - timer = [[Y]] ;;;
Instruction_CommonB2_TimerInY:
    LDA.W $0000,Y : STA.W Enemy.loopCounter,X
    INY #2
    RTL


;;; $812C: Instruction - skip next instruction ;;;
Instruction_CommonB2_SkipNextInstruction:
    INY #2
    RTL


;;; $812F: Instruction - sleep ;;;
Instruction_CommonB2_Sleep:
    DEY #2
    TYA : STA.W Enemy.instList,X
    PLA
    PEA.W ProcessEnemyInstructions_return-1
    RTL


;;; $813A: Instruction - wait [[Y]] frames ;;;
Instruction_CommonB2_WaitYFrames:
; Set instruction timer and terminate processing enemy instructions
; Used for running a delay that doesn't update graphics,
; useful for e.g. GT eye beam attack ($AA:D10D), implemented by an instruction list that has no graphical instructions,
; which allows it to be called from multiple different poses
    LDA.W $0000,Y : STA.W Enemy.instTimer,X
    INY #2
    TYA : STA.W Enemy.instList,X
    PLA
    PEA.W ProcessEnemyInstructions_return-1
    RTL


;;; $814B: Instruction - transfer [[Y]] bytes from [[Y] + 2] to VRAM [[Y] + 5] ;;;
Instruction_CommonB2_TransferYBytesInYToVRAM:
    PHX
    LDX.W VRAMWriteStack
    LDA.W $0000,Y : STA.B VRAMWrite.size,X
    LDA.W $0002,Y : STA.B VRAMWrite.src,X
    LDA.W $0003,Y : STA.B VRAMWrite.src+1,X
    LDA.W $0005,Y : STA.B VRAMWrite.dest,X
    TXA : CLC : ADC.W #$0007 : STA.W VRAMWriteStack
    TYA : CLC : ADC.W #$0007 : TAY
    PLX
    RTL


;;; $8173: Instruction - enable off-screen processing ;;;
Instruction_CommonB2_EnableOffScreenProcessing:
    LDA.W Enemy.properties,X : ORA.W #$0800 : STA.W Enemy.properties,X
    RTL


;;; $817D: Instruction - disable off-screen processing ;;;
Instruction_CommonB2_DisableOffScreenProcessing:
    LDA.W Enemy.properties,X : AND.W #$F7FF : STA.W Enemy.properties,X
    RTL


;;; $8187: Common enemy speeds - linearly increasing ;;;
CommonB2EnemySpeeds_LinearlyIncreasing:
;        _____________________ Speed
;       |      _______________ Subspeed
;       |     |      _________ Negated speed
;       |     |     |      ___ Negated subspeed
;       |     |     |     |
  .speed:
    dw $0000
  .subspeed:
    dw       $0000
  .negatedSpeed:
    dw             $0000
  .negatedSubspeed:
    dw                   $0000
    dw $0000,$1000,$FFFF,$F000
    dw $0000,$2000,$FFFF,$E000
    dw $0000,$3000,$FFFF,$D000
    dw $0000,$4000,$FFFF,$C000
    dw $0000,$5000,$FFFF,$B000
    dw $0000,$6000,$FFFF,$A000
    dw $0000,$7000,$FFFF,$9000
    dw $0000,$8000,$FFFF,$8000
    dw $0000,$9000,$FFFF,$7000
    dw $0000,$A000,$FFFF,$6000
    dw $0000,$B000,$FFFF,$5000
    dw $0000,$C000,$FFFF,$4000
    dw $0000,$D000,$FFFF,$3000
    dw $0000,$E000,$FFFF,$2000
    dw $0000,$F000,$FFFF,$1000
    dw $0001,$0000,$FFFF,$0000
    dw $0001,$1000,$FFFE,$F000
    dw $0001,$2000,$FFFE,$E000
    dw $0001,$3000,$FFFE,$D000
    dw $0001,$4000,$FFFE,$C000
    dw $0001,$5000,$FFFE,$B000
    dw $0001,$6000,$FFFE,$A000
    dw $0001,$7000,$FFFE,$9000
    dw $0001,$8000,$FFFE,$8000
    dw $0001,$9000,$FFFE,$7000
    dw $0001,$A000,$FFFE,$6000
    dw $0001,$B000,$FFFE,$5000
    dw $0001,$C000,$FFFE,$4000
    dw $0001,$D000,$FFFE,$3000
    dw $0001,$E000,$FFFE,$2000
    dw $0001,$F000,$FFFE,$1000
    dw $0002,$0000,$FFFE,$0000
    dw $0002,$1000,$FFFD,$F000
    dw $0002,$2000,$FFFD,$E000
    dw $0002,$3000,$FFFD,$D000
    dw $0002,$4000,$FFFD,$C000
    dw $0002,$5000,$FFFD,$B000
    dw $0002,$6000,$FFFD,$A000
    dw $0002,$7000,$FFFD,$9000
    dw $0002,$8000,$FFFD,$8000
    dw $0002,$9000,$FFFD,$7000
    dw $0002,$A000,$FFFD,$6000
    dw $0002,$B000,$FFFD,$5000
    dw $0002,$C000,$FFFD,$4000
    dw $0002,$D000,$FFFD,$3000
    dw $0002,$E000,$FFFD,$2000
    dw $0002,$F000,$FFFD,$1000
    dw $0003,$0000,$FFFD,$0000
    dw $0003,$1000,$FFFC,$F000
    dw $0003,$2000,$FFFC,$E000
    dw $0003,$3000,$FFFC,$D000
    dw $0003,$4000,$FFFC,$C000
    dw $0003,$5000,$FFFC,$B000
    dw $0003,$6000,$FFFC,$A000
    dw $0003,$7000,$FFFC,$9000
    dw $0003,$8000,$FFFC,$8000
    dw $0003,$9000,$FFFC,$7000
    dw $0003,$A000,$FFFC,$6000
    dw $0003,$B000,$FFFC,$5000
    dw $0003,$C000,$FFFC,$4000
    dw $0003,$D000,$FFFC,$3000
    dw $0003,$E000,$FFFC,$2000
    dw $0003,$F000,$FFFC,$1000
    dw $0004,$0000,$FFFC,$0000


;;; $838F: Common enemy speeds - quadratically increasing ;;;
CommonB2EnemySpeeds_QuadraticallyIncreasing:
; I.e. gravity
; Used by e.g. Botwoon when dying and falling to the floor
;        _____________________ Subspeed
;       |      _______________ Speed
;       |     |      _________ Negated subspeed
;       |     |     |      ___ Negated speed
;       |     |     |     |
  .subspeed:
    dw $0000
  .speed:
    dw       $0000
  .negatedSubspeed:
    dw             $0000
  .negatedSpeed:
    dw                   $0000
    dw $0109,$0000,$FEF7,$FFFF
    dw $031B,$0000,$FCE5,$FFFF
    dw $0636,$0000,$F9CA,$FFFF
    dw $0A5A,$0000,$F5A6,$FFFF
    dw $0F87,$0000,$F079,$FFFF
    dw $15BD,$0000,$EA43,$FFFF
    dw $1CFC,$0000,$E304,$FFFF
    dw $2544,$0000,$DABC,$FFFF
    dw $2E95,$0000,$D16B,$FFFF
    dw $38EF,$0000,$C711,$FFFF
    dw $4452,$0000,$BBAE,$FFFF
    dw $50BE,$0000,$AF42,$FFFF
    dw $5E33,$0000,$A1CD,$FFFF
    dw $6CB1,$0000,$934F,$FFFF
    dw $7C38,$0000,$83C8,$FFFF
    dw $8CC8,$0000,$7338,$FFFF
    dw $9E61,$0000,$619F,$FFFF
    dw $B103,$0000,$4EFD,$FFFF
    dw $C4AE,$0000,$3B52,$FFFF
    dw $D962,$0000,$269E,$FFFF
    dw $EF1F,$0000,$10E1,$FFFF
    dw $05E5,$0000,$FA1B,$FFFF
    dw $14B4,$0001,$EB4C,$FFFE
    dw $2D8C,$0001,$D274,$FFFE
    dw $476D,$0001,$B893,$FFFE
    dw $6257,$0001,$9DA9,$FFFE
    dw $7E4A,$0001,$81B6,$FFFE
    dw $9B46,$0001,$64BA,$FFFE
    dw $B94B,$0001,$46B5,$FFFE
    dw $D859,$0001,$27A7,$FFFE
    dw $F870,$0001,$0790,$FFFE
    dw $1090,$0002,$EF70,$FFFD
    dw $32B9,$0002,$CD47,$FFFD
    dw $55EB,$0002,$AA15,$FFFD
    dw $7A26,$0002,$85DA,$FFFD
    dw $9F6A,$0002,$6096,$FFFD
    dw $C5B7,$0002,$3A49,$FFFD
    dw $ED0D,$0002,$12F3,$FFFD
    dw $0C6C,$0003,$F394,$FFFC
    dw $35D4,$0003,$CA2C,$FFFC
    dw $6045,$0003,$9FBB,$FFFC
    dw $8BBF,$0003,$7441,$FFFC
    dw $B842,$0003,$47BE,$FFFC
    dw $E5CE,$0003,$1A32,$FFFC
    dw $0B63,$0004,$F49D,$FFFB
    dw $3B01,$0004,$C4FF,$FFFB
    dw $6BA8,$0004,$9458,$FFFB
    dw $9D58,$0004,$62A8,$FFFB
    dw $D011,$0004,$2FEF,$FFFB
    dw $03D3,$0004,$FC2D,$FFFB
    dw $2F9E,$0005,$D062,$FFFA
    dw $6572,$0005,$9A8E,$FFFA
    dw $9C4F,$0005,$63B1,$FFFA
    dw $D435,$0005,$2BCB,$FFFA
    dw $0424,$0006,$FBDC,$FFF9
    dw $3E1C,$0006,$C1E4,$FFF9
    dw $791D,$0006,$86E3,$FFF9
    dw $B527,$0006,$4AD9,$FFF9
    dw $F23A,$0006,$0DC6,$FFF9
    dw $2756,$0007,$D8AA,$FFF8
    dw $667B,$0007,$9985,$FFF8
    dw $A6A9,$0007,$5957,$FFF8
    dw $E7E0,$0007,$1820,$FFF8
    dw $2120,$0008,$DEE0,$FFF7
    dw $6469,$0008,$9B97,$FFF7
    dw $A8BB,$0008,$5745,$FFF7
    dw $EE16,$0008,$11EA,$FFF7
    dw $2B7A,$0009,$D486,$FFF6
    dw $72E7,$0009,$8D19,$FFF6
    dw $BB5D,$0009,$44A3,$FFF6
    dw $04DC,$0009,$FB24,$FFF6
    dw $4664,$000A,$B99C,$FFF5
    dw $91F5,$000A,$6E0B,$FFF5
    dw $DE8F,$000A,$2171,$FFF5
    dw $2332,$000B,$DCCE,$FFF4
    dw $71DE,$000B,$8E22,$FFF4
    dw $C193,$000B,$3E6D,$FFF4
    dw $0951,$000C,$F6AF,$FFF3
    dw $5B18,$000C,$A4E8,$FFF3
    dw $ADE8,$000C,$5218,$FFF3
    dw $01C1,$000C,$FE3F,$FFF3
    dw $4DA3,$000D,$B25D,$FFF2
    dw $A38E,$000D,$5C72,$FFF2
    dw $FA82,$000D,$057E,$FFF2
    dw $497F,$000E,$B681,$FFF1
    dw $A285,$000E,$5D7B,$FFF1
    dw $FC94,$000E,$036C,$FFF1
    dw $4EAC,$000F,$B154,$FFF0
    dw $AACD,$000F,$5533,$FFF0
    dw $07F7,$000F,$F809,$FFF0
    dw $5D2A,$0010,$A2D6,$FFEF
    dw $BC66,$0010,$439A,$FFEF
    dw $13AB,$0011,$EC55,$FFEE
    dw $74F9,$0011,$8B07,$FFEE


;;; $8687: Palette - enemy $F353/$F4D3/$F653 (grey space pirate) ;;;
Palette_Pirate_Grey:
    dw $3800,$5755,$4A4F,$1CE4,$0C60,$56B2,$3E0D,$2D68
    dw $2526,$5EBB,$3DB3,$292E,$1486,$033B,$0216,$0113


;;; $86A7: Palette - enemy $F393/$F513/$F693 (green space pirate) ;;;
Palette_Pirate_Green:
    dw $3800,$3F57,$2E4D,$00E2,$0060,$3AB0,$220B,$1166
    dw $0924,$5EBB,$3DB3,$292E,$1486,$033B,$0216,$0113


;;; $86C7: Palette - enemy $F453/$F5D3/$F753 (magenta space pirate) ;;;
Palette_Pirate_Magenta:
    dw $3800,$4EBF,$4D9E,$1009,$0C04,$49DE,$555D,$30B0
    dw $1C4D,$5EBB,$3DB3,$292E,$1486,$033B,$0216,$0113


;;; $86E7: Palette - enemy $F3D3/$F553/$F6D3 (red space pirate) ;;;
Palette_Pirate_Red:
    dw $3800,$02FD,$013E,$006C,$0066,$021E,$005F,$0059
    dw $0073,$5EBB,$3DB3,$292E,$1486,$033B,$0216,$0113


;;; $8707: Palette - enemy $F493/$F593/$F613/$F793 (silver space pirate / gold ninja space pirate) ;;;
Palette_Pirate_Silver_GoldNinja:
    dw $3800,$6BFF,$4ED6,$14A4,$0420,$5B7B,$3E52,$31CD
    dw $2149,$5EBB,$3DB3,$292E,$1486,$033B,$0216,$0113


;;; $8727: Palette - enemy $F413/$F713 (gold non-ninja space pirate) ;;;
Palette_Pirate_Gold_NonNinja:
    dw $3800,$4BBE,$06B9,$00EA,$0065,$173A,$0276,$01F2
    dw $014D,$5EBB,$3DB3,$292E,$1486,$033B,$0216,$0113


if !FEATURE_KEEP_UNREFERENCED
;;; $8747: Unused. Palette ;;;
UNUSED_Palette_Pirate_Silver_GoldNinja_B28747:
; Clone of Palette_Pirate_Silver_GoldNinja
    dw $3800,$6BFF,$4ED6,$14A4,$0420,$5B7B,$3E52,$31CD
    dw $2149,$5EBB,$3DB3,$292E,$1486,$033B,$0216,$0113
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $8767: Power bomb reaction - enemy $F353/$F4D3/$F513/$F553/$F593/$F5D3/$F613/$F653/$F693/$F6D3/$F713/$F753/$F793 (grey wall space pirate / ninja space pirates / walking space pirates) ;;;
PowerBombReaction_Ninja_Walking_GreyWall:
    JSL NormalEnemyPowerBombAI
    RTL


;;; $876C: Enemy touch - enemy $F353/$F393/$F3D3/$F413/$F453/$F493/$F4D3/$F513/$F553/$F593/$F5D3/$F613/$F653/$F693/$F6D3/$F713/$F753/$F793 (space pirates) ;;;
EnemyTouch_SpacePirate:
    LDX.W EnemyIndex
    LDA.W Enemy.freezeTimer,X : BNE .return
    JSL NormalEnemyTouchAI

  .return:
    RTL


;;; $8779: Enemy shot - space pirate - normal ;;;
EnemyShot_SpacePirate_Normal:
    LDX.W EnemyIndex
    LDA.W Enemy.ID,X : CMP.W #EnemyHeaders_PirateGoldNinja : BEQ NormalPirateShot
    JSL NormalEnemyShotAI
    RTL


;;; $8789: Normal pirate shot ;;;
NormalPirateShot:
    LDX.W EnemyIndex
    LDA.W Enemy.XPosition,X : STA.L $7EF434
    LDA.W Enemy.YPosition,X : STA.L $7EF436
    JSL NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External
    LDA.W Enemy.health,X : BNE .return
    LDX.W EnemyIndex
    LDA.W Enemy.ID,X : CMP.W #EnemyHeaders_PirateGoldNinja : BNE .notGold
    STZ.W Enemy.var1,X
    LDA.W #$0004
    JSL EnemyDeath
    JSL MetalNinjaPirateDeathItemDropRoutine

  .return:
    RTL

  .notGold:
    STZ.W Enemy.var1,X
    LDA.W #$0004
    JSL EnemyDeath
    RTL


;;; $87C8: Enemy shot - space pirate - gold ninja space pirate is vulnerable ;;;
EnemyShot_SpacePirate_GoldNinjaIsVulnerable:
; Note how the vulnerability check here doesn't take beam charge into account
    LDX.W EnemyIndex
    LDA.W Enemy.ID,X : CMP.W #EnemyHeaders_PirateGoldNinja : BEQ .goldNinja
    JMP NormalPirateShot

  .goldNinja:
    LDA.W CollisionIndex : ASL : TAY
    LDA.W SamusProjectile_Types,Y : STA.B DP_Temp12
    AND.W #$0F00 : CMP.W #$0300 : BMI .beamMissileSuper
    RTL

  .beamMissileSuper:
    LDX.W EnemyIndex
    LDA.W Enemy.ID,X : TAX
    LDA.L EnemyHeaders_vulnerabilities,X : BNE .zeroVuln
    LDA.W #EnemyVulnerabilities_Default

  .zeroVuln:
    STA.B DP_Temp14
    LDA.B DP_Temp12 : BIT.W #$0F00 : BNE .notBeam
    LDA.B DP_Temp12 : AND.W #$000F : CLC : ADC.B DP_Temp14 : TAX
    LDA.L EnemyVulnerabilities_power,X : AND.W #$000F : BEQ EnemyShot_SpacePirate_GoldNinjaIsInvincible
    CMP.W #$000F : BEQ EnemyShot_SpacePirate_GoldNinjaIsInvincible

  .gotoNormal:
    JMP NormalPirateShot

  .notBeam:
    AND.W #$0F00 : CMP.W #$0100 : BEQ .missile
    CMP.W #$0200 : BNE .gotoNormal

  .missile:
    XBA : CLC : ADC.B DP_Temp14 : TAX
    LDA.L EnemyVulnerabilities_plasmaIceWave,X : AND.W #$000F : BEQ EnemyShot_SpacePirate_GoldNinjaIsInvincible
    CMP.W #$000F : BEQ EnemyShot_SpacePirate_GoldNinjaIsInvincible
    BRA .gotoNormal


;;; $883E: Enemy shot - space pirate - gold ninja space pirate is invincible ;;;
EnemyShot_SpacePirate_GoldNinjaIsInvincible:
    LDX.W EnemyIndex
    LDA.W Enemy.ID,X : CMP.W #EnemyHeaders_PirateGoldNinja : BEQ .gold
    JMP NormalPirateShot

  .gold:
    LDX.W EnemyIndex
    LDA.W CollisionIndex : ASL : TAY
    LDA.W SamusProjectile_Types,Y : STA.B DP_Temp12
    AND.W #$0F00 : CMP.W #$0200 : BEQ .super
    CMP.W #$0300 : BMI .reflect
    RTL

  .super:
    LDA.W SamusProjectile_Variables,Y : BEQ .return

  .reflect:
    LDA.W #$000A : STA.W Enemy.invincibilityTimer,X
    LDA.W SamusProjectile_Directions,Y : AND.W #$000F : CMP.W #$0007 : BNE .notLeft
    LDA.W #$0001
    BRA .merge

  .notLeft:
    CMP.W #$0002 : BNE .downFacingLeft
    LDA.W #$0008
    BRA .merge

  .downFacingLeft:
    LDA.W #$0005

  .merge:
    STA.W SamusProjectile_Directions,Y
    STY.B DP_Temp14
    JSL ProjectileReflection
    LDA.W #$0066
    JSL QueueSound_Lib2_Max6

  .return:
    RTL


;;; $88A0: Extended spritemaps ;;;
; [n entries] [[X offset] [Y offset] [p spritemap] [p hitbox]]...
ExtendedSpritemaps_PirateWall_0:
    dw $0002
    dw $0000,$0000
    dw Spitemaps_PirateWall_9
    dw Hitboxes_PirateWall_9
    dw $0000,$0000
    dw Spitemaps_PirateWall_0
    dw Hitboxes_PirateWall_0

ExtendedSpritemaps_PirateWall_1:
    dw $0002
    dw $0000,$0000
    dw Spitemaps_PirateWall_8
    dw Hitboxes_PirateWall_8
    dw $0000,$0000
    dw Spitemaps_PirateWall_1
    dw Hitboxes_PirateWall_1

ExtendedSpritemaps_PirateWall_2:
    dw $0002
    dw $0000,$0000
    dw Spitemaps_PirateWall_7
    dw Hitboxes_PirateWall_7
    dw $0000,$0000
    dw Spitemaps_PirateWall_2
    dw Hitboxes_PirateWall_2

ExtendedSpritemaps_PirateWall_3:
    dw $0002
    dw $0000,$0000
    dw Spitemaps_PirateWall_3
    dw Hitboxes_PirateWall_3
    dw $0000,$0000
    dw Spitemaps_PirateWall_6
    dw Hitboxes_PirateWall_6

ExtendedSpritemaps_PirateWall_4:
    dw $0002
    dw $0000,$0000
    dw Spitemaps_PirateWall_4
    dw Hitboxes_PirateWall_4
    dw $0000,$0000
    dw Spitemaps_PirateWall_5
    dw Hitboxes_PirateWall_5

ExtendedSpritemaps_PirateWall_5:
    dw $0002
    dw $0000,$FFFE
    dw Spitemaps_PirateWall_A
    dw Hitboxes_PirateWall_A
    dw $0000,$0000
    dw Spitemaps_PirateWall_9
    dw Hitboxes_PirateWall_9

ExtendedSpritemaps_PirateWall_6:
    dw $0002
    dw $0001,$FFFE
    dw Spitemaps_PirateWall_B
    dw Hitboxes_PirateWall_B
    dw $0000,$0000
    dw Spitemaps_PirateWall_5
    dw Hitboxes_PirateWall_5

ExtendedSpritemaps_PirateWall_7:
    dw $0001
    dw $0000,$0000
    dw Spitemaps_PirateWall_C
    dw Hitboxes_PirateWall_C

ExtendedSpritemaps_PirateWall_8:
    dw $0001
    dw $0000,$0000
    dw Spitemaps_PirateWall_D
    dw Hitboxes_PirateWall_D

ExtendedSpritemaps_PirateWall_9:
    dw $0002
    dw $0000,$0000
    dw Spitemaps_PirateWall_17
    dw Hitboxes_PirateWall_17
    dw $0000,$0000
    dw Spitemaps_PirateWall_E
    dw Hitboxes_PirateWall_E

ExtendedSpritemaps_PirateWall_A:
    dw $0002
    dw $0000,$0000
    dw Spitemaps_PirateWall_16
    dw Hitboxes_PirateWall_16
    dw $0000,$0000
    dw Spitemaps_PirateWall_F
    dw Hitboxes_PirateWall_F

ExtendedSpritemaps_PirateWall_B:
    dw $0002
    dw $0000,$0000
    dw Spitemaps_PirateWall_15
    dw Hitboxes_PirateWall_15
    dw $0000,$0000
    dw Spitemaps_PirateWall_10
    dw Hitboxes_PirateWall_10

ExtendedSpritemaps_PirateWall_C:
    dw $0002
    dw $0000,$0000
    dw Spitemaps_PirateWall_11
    dw Hitboxes_PirateWall_11
    dw $0000,$0000
    dw Spitemaps_PirateWall_14
    dw Hitboxes_PirateWall_14

ExtendedSpritemaps_PirateWall_D:
    dw $0002
    dw $0000,$0000
    dw Spitemaps_PirateWall_12
    dw Hitboxes_PirateWall_12
    dw $0000,$0000
    dw Spitemaps_PirateWall_13
    dw Hitboxes_PirateWall_13

ExtendedSpritemaps_PirateWall_E:
    dw $0002
    dw $0000,$0000
    dw Spitemaps_PirateWall_18
    dw Hitboxes_PirateWall_18
    dw $0000,$0002
    dw Spitemaps_PirateWall_13
    dw Hitboxes_PirateWall_13

ExtendedSpritemaps_PirateWall_F:
    dw $0002
    dw $0000,$0000
    dw Spitemaps_PirateWall_19
    dw Hitboxes_PirateWall_19
    dw $0000,$0002
    dw Spitemaps_PirateWall_13
    dw Hitboxes_PirateWall_13

ExtendedSpritemaps_PirateWall_10:
    dw $0001
    dw $0000,$0000
    dw Spitemaps_PirateWall_1A
    dw Hitboxes_PirateWall_1A

ExtendedSpritemaps_PirateWall_11:
    dw $0001
    dw $0000,$0000
    dw Spitemaps_PirateWall_1B
    dw Hitboxes_PirateWall_1B

ExtendedSpritemaps_PirateWalking_0:
    dw $0002
    dw $FFFB,$0003
    dw Spitemaps_PirateWalking_26_Ninja_D
    dw Hitboxes_PirateWalking_33_Ninja_1C
    dw $0000,$0000
    dw Spritemaps_PirateWalking_1
    dw Hitboxes_PirateWalking_1

ExtendedSpritemaps_PirateWalking_1:
    dw $0002
    dw $FFFB,$0003
    dw Spitemaps_PirateWalking_27_Ninja_E
    dw Hitboxes_PirateWalking_35_Ninja_1E
    dw $0000,$0000
    dw Spritemaps_PirateWalking_2
    dw Hitboxes_PirateWalking_2

ExtendedSpritemaps_PirateWalking_2:
    dw $0002
    dw $FFFB,$0003
    dw Spitemaps_PirateWalking_28_Ninja_F
    dw Hitboxes_PirateWalking_36_Ninja_1F
    dw $0000,$0000
    dw Spritemaps_PirateWalking_3
    dw Hitboxes_PirateWalking_3

ExtendedSpritemaps_PirateWalking_3:
    dw $0002
    dw $FFFB,$0003
    dw Spitemaps_PirateWalking_29_Ninja_10
    dw Hitboxes_PirateWalking_37_Ninja_20
    dw $0002,$0000
    dw Spritemaps_PirateWalking_4
    dw Hitboxes_PirateWalking_4

ExtendedSpritemaps_PirateWalking_4:
    dw $0002
    dw $FFFB,$0003
    dw Spitemaps_PirateWalking_29_Ninja_10
    dw Hitboxes_PirateWalking_37_Ninja_20
    dw $0002,$0000
    dw Spritemaps_PirateWalking_5
    dw Hitboxes_PirateWalking_5

ExtendedSpritemaps_PirateWalking_5:
    dw $0002
    dw $FFFB,$0003
    dw Spitemaps_PirateWalking_28_Ninja_F
    dw Hitboxes_PirateWalking_36_Ninja_1F
    dw $0002,$0000
    dw Spritemaps_PirateWalking_6
    dw Hitboxes_PirateWalking_6

ExtendedSpritemaps_PirateWalking_6:
    dw $0002
    dw $FFFB,$0003
    dw Spitemaps_PirateWalking_27_Ninja_E
    dw Hitboxes_PirateWalking_35_Ninja_1E
    dw $0000,$0000
    dw Spritemaps_PirateWalking_7
    dw Hitboxes_PirateWalking_7

ExtendedSpritemaps_PirateWalking_7:
    dw $0002
    dw $FFFB,$0003
    dw Spitemaps_PirateWalking_26_Ninja_D
    dw Hitboxes_PirateWalking_33_Ninja_1C
    dw $0000,$0000
    dw Spritemaps_PirateWalking_8
    dw Hitboxes_PirateWalking_8

ExtendedSpritemaps_PirateNinja_0:
    dw $0002
    dw $0000,$0005
    dw Spitemaps_PirateWalking_26_Ninja_D
    dw Hitboxes_PirateWalking_34_Ninja_1D
    dw $0000,$0003
    dw Spitemaps_PirateWalking_B_Ninja_2
    dw Hitboxes_PirateWalking_12_Ninja_A

ExtendedSpritemaps_PirateNinja_1:
    dw $0002
    dw $0000,$0005
    dw Spitemaps_PirateNinja_11
    dw Hitboxes_PirateNinja_21
    dw $0000,$0003
    dw Spitemaps_PirateWalking_9_Ninja_0
    dw Hitboxes_PirateWalking_9_Ninja_0

ExtendedSpritemaps_PirateNinja_2:
    dw $0002
    dw $0000,$0005
    dw Spitemaps_PirateNinja_12
    dw Hitboxes_PirateNinja_22
    dw $0000,$0003
    dw Spitemaps_PirateWalking_9_Ninja_0
    dw Hitboxes_PirateWalking_9_Ninja_0

ExtendedSpritemaps_PirateNinja_3:
    dw $0002
    dw $0000,$0004
    dw Spitemaps_PirateNinja_13
    dw Hitboxes_PirateNinja_23
    dw $0000,$0003
    dw Spitemaps_PirateWalking_9_Ninja_0
    dw Hitboxes_PirateWalking_9_Ninja_0

ExtendedSpritemaps_PirateNinja_4:
    dw $0002
    dw $0000,$0003
    dw Spitemaps_PirateNinja_14
    dw Hitboxes_PirateNinja_24
    dw $0000,$0003
    dw Spitemaps_PirateWalking_9_Ninja_0
    dw Hitboxes_PirateWalking_9_Ninja_0

ExtendedSpritemaps_PirateNinja_5:
    dw $0002
    dw $0000,$0005
    dw Spitemaps_PirateNinja_13
    dw Hitboxes_PirateNinja_23
    dw $0000,$0003
    dw Spitemaps_PirateWalking_9_Ninja_0
    dw Hitboxes_PirateWalking_9_Ninja_0

ExtendedSpritemaps_PirateNinja_6:
    dw $0002
    dw $0000,$0005
    dw Spitemaps_PirateNinja_11
    dw Hitboxes_PirateNinja_21
    dw $0000,$0003
    dw Spitemaps_PirateWalking_9_Ninja_0
    dw Hitboxes_PirateWalking_9_Ninja_0

ExtendedSpritemaps_PirateNinja_7:
    dw $0002
    dw $0000,$0006
    dw Spitemaps_PirateWalking_29_Ninja_10
    dw Hitboxes_PirateWalking_37_Ninja_20
    dw $0000,$0003
    dw Spitemaps_PirateWalking_9_Ninja_0
    dw Hitboxes_PirateWalking_9_Ninja_0

ExtendedSpritemaps_PirateNinja_8:
    dw $0002
    dw $0000,$0007
    dw Spitemaps_PirateNinja_18
    dw Hitboxes_PirateNinja_28
    dw $0000,$0003
    dw Spitemaps_PirateWalking_B_Ninja_2
    dw Hitboxes_PirateWalking_12_Ninja_A

ExtendedSpritemaps_PirateWalking_8:
    dw $0002
    dw $0005,$0003
    dw Spitemaps_PirateWalking_2B_Ninja_21
    dw Hitboxes_PirateWalking_39_Ninja_32
    dw $0000,$0000
    dw Spitemaps_PirateWalking_E
    dw Hitboxes_PirateWalking_15

ExtendedSpritemaps_PirateWalking_9:
    dw $0002
    dw $0005,$0003
    dw Spitemaps_PirateWalking_2C_Ninja_22
    dw Hitboxes_PirateWalking_3A_Ninja_34
    dw $0000,$0000
    dw Spitemaps_PirateWalking_F
    dw Hitboxes_PirateWalking_16

ExtendedSpritemaps_PirateWalking_A:
    dw $0002
    dw $0005,$0003
    dw Spitemaps_PirateWalking_2D_Ninja_23
    dw Hitboxes_PirateWalking_3B_Ninja_35
    dw $0000,$0000
    dw Spitemaps_PirateWalking_10
    dw Hitboxes_PirateWalking_17

ExtendedSpritemaps_PirateWalking_B:
    dw $0002
    dw $0005,$0003
    dw Spitemaps_PirateWalking_2E_Ninja_24
    dw Hitboxes_PirateWalking_3C_Ninja_36
    dw $0000,$0000
    dw Spitemaps_PirateWalking_11
    dw Hitboxes_PirateWalking_18

ExtendedSpritemaps_PirateWalking_C:
    dw $0002
    dw $0005,$0003
    dw Spitemaps_PirateWalking_2E_Ninja_24
    dw Hitboxes_PirateWalking_3C_Ninja_36
    dw $FFFF,$0000
    dw Spitemaps_PirateWalking_12
    dw Hitboxes_PirateWalking_19

ExtendedSpritemaps_PirateWalking_D:
    dw $0002
    dw $0005,$0003
    dw Spitemaps_PirateWalking_2D_Ninja_23
    dw Hitboxes_PirateWalking_3B_Ninja_35
    dw $0000,$0000
    dw Spitemaps_PirateWalking_13
    dw Hitboxes_PirateWalking_1A

ExtendedSpritemaps_PirateWalking_E:
    dw $0002
    dw $0005,$0003
    dw Spitemaps_PirateWalking_2C_Ninja_22
    dw Hitboxes_PirateWalking_3A_Ninja_34
    dw $0001,$0000
    dw Spitemaps_PirateWalking_14
    dw Hitboxes_PirateWalking_1B

ExtendedSpritemaps_PirateWalking_F:
    dw $0002
    dw $0005,$0003
    dw Spitemaps_PirateWalking_2B_Ninja_21
    dw Hitboxes_PirateWalking_39_Ninja_32
    dw $0001,$0000
    dw Spitemaps_PirateWalking_15
    dw Hitboxes_PirateWalking_1C

ExtendedSpritemaps_PirateNinja_9:
    dw $0002
    dw $0000,$0005
    dw Spitemaps_PirateWalking_2B_Ninja_21
    dw Hitboxes_PirateNinja_33
    dw $0000,$0003
    dw Spitemaps_PirateWalking_17_Ninja_4
    dw Hitboxes_PirateWalking_26_Ninja_13

ExtendedSpritemaps_PirateNinja_A:
    dw $0002
    dw $0000,$0005
    dw Spitemaps_PirateNinja_25
    dw Hitboxes_PirateNinja_37
    dw $0000,$0003
    dw Spitemaps_PirateWalking_16_Ninja_3
    dw Hitboxes_PirateWalking_1D_Ninja_A

ExtendedSpritemaps_PirateNinja_B:
    dw $0002
    dw $0000,$0005
    dw Spitemaps_PirateNinja_26
    dw Hitboxes_PirateNinja_38
    dw $0000,$0003
    dw Spitemaps_PirateWalking_16_Ninja_3
    dw Hitboxes_PirateWalking_1D_Ninja_A

ExtendedSpritemaps_PirateNinja_C:
    dw $0002
    dw $0000,$0004
    dw Spitemaps_PirateNinja_27
    dw Hitboxes_PirateNinja_39
    dw $0000,$0003
    dw Spitemaps_PirateWalking_16_Ninja_3
    dw Hitboxes_PirateWalking_1D_Ninja_A

ExtendedSpritemaps_PirateNinja_D:
    dw $0002
    dw $0000,$0003
    dw Spitemaps_PirateNinja_28
    dw Hitboxes_PirateNinja_3A
    dw $0000,$0003
    dw Spitemaps_PirateWalking_16_Ninja_3
    dw Hitboxes_PirateWalking_1D_Ninja_A

ExtendedSpritemaps_PirateNinja_E:
    dw $0002
    dw $0000,$0005
    dw Spitemaps_PirateNinja_27
    dw Hitboxes_PirateNinja_39
    dw $0000,$0003
    dw Spitemaps_PirateWalking_16_Ninja_3
    dw Hitboxes_PirateWalking_1D_Ninja_A

ExtendedSpritemaps_PirateNinja_F:
    dw $0002
    dw $0000,$0005
    dw Spitemaps_PirateWalking_2E_Ninja_24
    dw Hitboxes_PirateWalking_3C_Ninja_36
    dw $0000,$0003
    dw Spitemaps_PirateWalking_16_Ninja_3
    dw Hitboxes_PirateWalking_1D_Ninja_A

ExtendedSpritemaps_PirateNinja_10:
    dw $0002
    dw $0000,$0006
    dw Spitemaps_PirateNinja_2C
    dw Hitboxes_PirateNinja_3E
    dw $0000,$0003
    dw Spitemaps_PirateWalking_16_Ninja_3
    dw Hitboxes_PirateWalking_1D_Ninja_A

ExtendedSpritemaps_PirateNinja_11:
    dw $0002
    dw $0000,$0007
    dw Spitemaps_PirateNinja_2C
    dw Hitboxes_PirateNinja_3E
    dw $0000,$0003
    dw Spitemaps_PirateWalking_17_Ninja_4
    dw Hitboxes_PirateWalking_26_Ninja_13

ExtendedSpritemaps_PirateWalking_10:
    dw $0002
    dw $0000,$0003
    dw Spitemaps_PirateWalking_1A
    dw Hitboxes_PirateWalking_27
    dw $0000,$0003
    dw Spitemaps_PirateWalking_9_Ninja_0
    dw Hitboxes_PirateWalking_9_Ninja_0

ExtendedSpritemaps_PirateWalking_11:
    dw $0002
    dw $0000,$0003
    dw Spitemaps_PirateWalking_1B
    dw Hitboxes_PirateWalking_28
    dw $0000,$0003
    dw Spitemaps_PirateWalking_9_Ninja_0
    dw Hitboxes_PirateWalking_9_Ninja_0

ExtendedSpritemaps_PirateWalking_12:
    dw $0002
    dw $0000,$0003
    dw Spitemaps_PirateWalking_1C
    dw Hitboxes_PirateWalking_29
    dw $0000,$0003
    dw Spitemaps_PirateWalking_9_Ninja_0
    dw Hitboxes_PirateWalking_9_Ninja_0

ExtendedSpritemaps_PirateWalking_13:
    dw $0002
    dw $0000,$0003
    dw Spitemaps_PirateWalking_1D
    dw Hitboxes_PirateWalking_2A
    dw $0000,$0003
    dw Spitemaps_PirateWalking_9_Ninja_0
    dw Hitboxes_PirateWalking_9_Ninja_0

ExtendedSpritemaps_PirateWalking_14:
    dw $0002
    dw $FFFF,$0004
    dw Spitemaps_PirateWalking_1E
    dw Hitboxes_PirateWalking_2B
    dw $0000,$0003
    dw Spitemaps_PirateWalking_9_Ninja_0
    dw Hitboxes_PirateWalking_9_Ninja_0

ExtendedSpritemaps_PirateWalking_15:
    dw $0002
    dw $FFFE,$0006
    dw Spitemaps_PirateWalking_1F
    dw Hitboxes_PirateWalking_2C
    dw $0000,$0003
    dw Spitemaps_PirateWalking_B_Ninja_2
    dw Hitboxes_PirateWalking_12_Ninja_A

ExtendedSpritemaps_PirateWalking_16:
    dw $0002
    dw $0000,$0003
    dw Spitemaps_PirateWalking_20
    dw Hitboxes_PirateWalking_2D
    dw $0000,$0003
    dw Spitemaps_PirateWalking_16_Ninja_3
    dw Hitboxes_PirateWalking_1D_Ninja_A

ExtendedSpritemaps_PirateWalking_17:
    dw $0002
    dw $0000,$0003
    dw Spitemaps_PirateWalking_21
    dw Hitboxes_PirateWalking_2E
    dw $0000,$0003
    dw Spitemaps_PirateWalking_16_Ninja_3
    dw Hitboxes_PirateWalking_1D_Ninja_A

ExtendedSpritemaps_PirateWalking_18:
    dw $0002
    dw $0000,$0003
    dw Spitemaps_PirateWalking_22
    dw Hitboxes_PirateWalking_2F
    dw $0000,$0003
    dw Spitemaps_PirateWalking_16_Ninja_3
    dw Hitboxes_PirateWalking_1D_Ninja_A

ExtendedSpritemaps_PirateWalking_19:
    dw $0002
    dw $0000,$0003
    dw Spitemaps_PirateWalking_23
    dw Hitboxes_PirateWalking_30
    dw $0000,$0003
    dw Spitemaps_PirateWalking_16_Ninja_3
    dw Hitboxes_PirateWalking_1D_Ninja_A

ExtendedSpritemaps_PirateWalking_1A:
    dw $0002
    dw $0001,$0004
    dw Spitemaps_PirateWalking_24
    dw Hitboxes_PirateWalking_31
    dw $0000,$0003
    dw Spitemaps_PirateWalking_16_Ninja_3
    dw Hitboxes_PirateWalking_1D_Ninja_A

ExtendedSpritemaps_PirateWalking_1B:
    dw $0002
    dw $0002,$0006
    dw Spitemaps_PirateWalking_25
    dw Hitboxes_PirateWalking_32
    dw $0000,$0003
    dw Spitemaps_PirateWalking_17_Ninja_4
    dw Hitboxes_PirateWalking_26_Ninja_13

ExtendedSpritemaps_PirateWalking_1C:
    dw $0003
    dw $FFFB,$FFF4
    dw Spitemaps_PirateWalking_18
    dw Hitboxes_PirateWalking_27
    dw $0000,$0003
    dw Spitemaps_PirateWalking_C
    dw Hitboxes_PirateWalking_13
    dw $0000,$0003
    dw Spitemaps_PirateWalking_9_Ninja_0
    dw Hitboxes_PirateWalking_9_Ninja_0

ExtendedSpritemaps_PirateWalking_1D:
    dw $0002
    dw $0000,$0003
    dw Spitemaps_PirateWalking_1A
    dw Hitboxes_PirateWalking_27
    dw $0000,$0003
    dw Spitemaps_PirateWalking_9_Ninja_0
    dw Hitboxes_PirateWalking_9_Ninja_0

ExtendedSpritemaps_PirateWalking_1E:
    dw $0003
    dw $FFFB,$FFF5
    dw Spitemaps_PirateWalking_19
    dw Hitboxes_PirateWalking_27
    dw $0000,$0003
    dw Spitemaps_PirateWalking_C
    dw Hitboxes_PirateWalking_13
    dw $0000,$0003
    dw Spitemaps_PirateWalking_9_Ninja_0
    dw Hitboxes_PirateWalking_9_Ninja_0

ExtendedSpritemaps_PirateWalking_1F:
    dw $0003
    dw $0005,$FFF4
    dw Spitemaps_PirateWalking_18
    dw Hitboxes_PirateWalking_27
    dw $0000,$0003
    dw Spitemaps_PirateWalking_D
    dw Hitboxes_PirateWalking_14
    dw $0000,$0003
    dw Spitemaps_PirateWalking_16_Ninja_3
    dw Hitboxes_PirateWalking_1D_Ninja_A

ExtendedSpritemaps_PirateWalking_20:
    dw $0002
    dw $0000,$0003
    dw Spitemaps_PirateWalking_20
    dw Hitboxes_PirateWalking_2D
    dw $0000,$0003
    dw Spitemaps_PirateWalking_16_Ninja_3
    dw Hitboxes_PirateWalking_1D_Ninja_A

ExtendedSpritemaps_PirateWalking_21:
    dw $0003
    dw $0005,$FFF5
    dw Spitemaps_PirateWalking_19
    dw Hitboxes_PirateWalking_27
    dw $0000,$0003
    dw Spitemaps_PirateWalking_D
    dw Hitboxes_PirateWalking_14
    dw $0000,$0003
    dw Spitemaps_PirateWalking_16_Ninja_3
    dw Hitboxes_PirateWalking_1D_Ninja_A

ExtendedSpritemaps_PirateWalking_22:
    dw $0001
    dw $0000,$0001
    dw Spritemaps_PirateWalking_0
    dw Hitboxes_PirateWalking_0

ExtendedSpritemaps_PirateNinja_12:
    dw $0001
    dw $0000,$0000
    dw Spitemaps_PirateNinja_2D
    dw Hitboxes_PirateNinja_40

ExtendedSpritemaps_PirateNinja_13:
    dw $0001
    dw $0000,$0000
    dw Spitemaps_PirateNinja_2E
    dw Hitboxes_PirateNinja_41

ExtendedSpritemaps_PirateNinja_14:
    dw $0001
    dw $0000,$0000
    dw Spitemaps_PirateNinja_2E_miscount
    dw Hitboxes_PirateNinja_42

ExtendedSpritemaps_PirateNinja_15:
    dw $0001
    dw $0000,$0000
    dw Spitemaps_PirateNinja_2F
    dw Hitboxes_PirateNinja_43

ExtendedSpritemaps_PirateNinja_16:
    dw $0001
    dw $0000,$0000
    dw Spitemaps_PirateNinja_30
    dw Hitboxes_PirateNinja_44

ExtendedSpritemaps_PirateNinja_17:
    dw $0001
    dw $0000,$0000
    dw Spitemaps_PirateNinja_31
    dw Hitboxes_PirateNinja_45

ExtendedSpritemaps_PirateNinja_18:
    dw $0001
    dw $0000,$0000
    dw Spitemaps_PirateNinja_32
    dw Hitboxes_PirateNinja_46

ExtendedSpritemaps_PirateNinja_19:
    dw $0001
    dw $0000,$0000
    dw Spitemaps_PirateNinja_33
    dw Hitboxes_PirateNinja_47

ExtendedSpritemaps_PirateNinja_1A:
    dw $0001
    dw $0000,$0000
    dw Spitemaps_PirateNinja_34
    dw Hitboxes_PirateNinja_48

ExtendedSpritemaps_PirateNinja_1B:
    dw $0001
    dw $0000,$0000
    dw Spitemaps_PirateNinja_35
    dw Hitboxes_PirateNinja_49

ExtendedSpritemaps_PirateNinja_1C:
    dw $0001
    dw $0000,$0000
    dw Spitemaps_PirateNinja_36
    dw Hitboxes_PirateNinja_4A

ExtendedSpritemaps_PirateNinja_1D:
    dw $0001
    dw $0000,$0000
    dw Spitemaps_PirateNinja_37
    dw Hitboxes_PirateNinja_4B

ExtendedSpritemaps_PirateNinja_1E:
    dw $0001
    dw $0000,$0000
    dw Spitemaps_PirateNinja_38
    dw Hitboxes_PirateNinja_4C

ExtendedSpritemaps_PirateNinja_1F:
    dw $0001
    dw $0000,$0000
    dw Spitemaps_PirateNinja_39
    dw Hitboxes_PirateNinja_4D

ExtendedSpritemaps_PirateNinja_20:
    dw $0001
    dw $0000,$0000
    dw Spitemaps_PirateNinja_3A
    dw Hitboxes_PirateNinja_4E

ExtendedSpritemaps_PirateNinja_21:
    dw $0001
    dw $0000,$0000
    dw Spitemaps_PirateNinja_3B
    dw Hitboxes_PirateNinja_4F

ExtendedSpritemaps_PirateNinja_22:
    dw $0002
    dw $FFFB,$0001
    dw Spitemaps_PirateWalking_26_Ninja_D
    dw Hitboxes_PirateWalking_33_Ninja_1C
    dw $0000,$FFFE
    dw Spitemaps_PirateNinja_5
    dw Hitboxes_PirateNinja_14

ExtendedSpritemaps_PirateNinja_23:
    dw $0002
    dw $FFFB,$0003
    dw Spitemaps_PirateWalking_27_Ninja_E
    dw Hitboxes_PirateWalking_35_Ninja_1E
    dw $FFFF,$0000
    dw Spitemaps_PirateNinja_6
    dw Hitboxes_PirateNinja_15

ExtendedSpritemaps_PirateNinja_24:
    dw $0002
    dw $FFFB,$0004
    dw Spitemaps_PirateWalking_28_Ninja_F
    dw Hitboxes_PirateWalking_36_Ninja_1F
    dw $0000,$0000
    dw Spitemaps_PirateNinja_7
    dw Hitboxes_PirateNinja_16

ExtendedSpritemaps_PirateNinja_25:
    dw $0002
    dw $FFFB,$0002
    dw Spitemaps_PirateWalking_29_Ninja_10
    dw Hitboxes_PirateWalking_37_Ninja_20
    dw $FFFF,$0000
    dw Spitemaps_PirateNinja_8
    dw Hitboxes_PirateNinja_17

ExtendedSpritemaps_PirateNinja_26:
    dw $0002
    dw $FFFB,$0001
    dw Spitemaps_PirateWalking_29_Ninja_10
    dw Hitboxes_PirateWalking_37_Ninja_20
    dw $0002,$FFFE
    dw Spitemaps_PirateNinja_9
    dw Hitboxes_PirateNinja_18

ExtendedSpritemaps_PirateNinja_27:
    dw $0002
    dw $FFFB,$0003
    dw Spitemaps_PirateWalking_28_Ninja_F
    dw Hitboxes_PirateWalking_36_Ninja_1F
    dw $0002,$0000
    dw Spitemaps_PirateNinja_A
    dw Hitboxes_PirateNinja_19

ExtendedSpritemaps_PirateNinja_28:
    dw $0002
    dw $FFFB,$0003
    dw Spitemaps_PirateWalking_27_Ninja_E
    dw Hitboxes_PirateWalking_35_Ninja_1E
    dw $0000,$0000
    dw Spitemaps_PirateNinja_B
    dw Hitboxes_PirateNinja_1A

ExtendedSpritemaps_PirateNinja_29:
    dw $0002
    dw $FFFB,$0001
    dw Spitemaps_PirateWalking_26_Ninja_D
    dw Hitboxes_PirateWalking_33_Ninja_1C
    dw $0000,$0000
    dw Spitemaps_PirateNinja_C
    dw Hitboxes_PirateNinja_1B

ExtendedSpritemaps_PirateNinja_2A:
    dw $0002
    dw $0005,$0001
    dw Spitemaps_PirateWalking_2B_Ninja_21
    dw Hitboxes_PirateWalking_39_Ninja_32
    dw $0000,$FFFE
    dw Spitemaps_PirateNinja_19
    dw Hitboxes_PirateNinja_2A

ExtendedSpritemaps_PirateNinja_2B:
    dw $0002
    dw $0005,$0003
    dw Spitemaps_PirateWalking_2C_Ninja_22
    dw Hitboxes_PirateWalking_3A_Ninja_34
    dw $0000,$0000
    dw Spitemaps_PirateNinja_1A
    dw Hitboxes_PirateNinja_2B

ExtendedSpritemaps_PirateNinja_2C:
    dw $0002
    dw $0005,$0004
    dw Spitemaps_PirateWalking_2D_Ninja_23
    dw Hitboxes_PirateWalking_3B_Ninja_35
    dw $0000,$0000
    dw Spitemaps_PirateNinja_1B
    dw Hitboxes_PirateNinja_2C

ExtendedSpritemaps_PirateNinja_2D:
    dw $0002
    dw $0005,$0002
    dw Spitemaps_PirateWalking_2E_Ninja_24
    dw Hitboxes_PirateWalking_3C_Ninja_36
    dw $0000,$0000
    dw Spitemaps_PirateNinja_1C
    dw Hitboxes_PirateNinja_2D

ExtendedSpritemaps_PirateNinja_2E:
    dw $0002
    dw $0005,$0001
    dw Spitemaps_PirateWalking_2E_Ninja_24
    dw Hitboxes_PirateWalking_3C_Ninja_36
    dw $FFFF,$FFFF
    dw Spitemaps_PirateNinja_1D
    dw Hitboxes_PirateNinja_2E

ExtendedSpritemaps_PirateNinja_2F:
    dw $0002
    dw $0005,$0003
    dw Spitemaps_PirateWalking_2D_Ninja_23
    dw Hitboxes_PirateWalking_3B_Ninja_35
    dw $0000,$0000
    dw Spitemaps_PirateNinja_1E
    dw Hitboxes_PirateNinja_2F

ExtendedSpritemaps_PirateNinja_30:
    dw $0002
    dw $0005,$0003
    dw Spitemaps_PirateWalking_2C_Ninja_22
    dw Hitboxes_PirateWalking_3A_Ninja_34
    dw $0001,$0000
    dw Spitemaps_PirateNinja_1F
    dw Hitboxes_PirateNinja_30

ExtendedSpritemaps_PirateNinja_31:
    dw $0002
    dw $0005,$0001
    dw Spitemaps_PirateWalking_2B_Ninja_21
    dw Hitboxes_PirateWalking_39_Ninja_32
    dw $0001,$0000
    dw Spitemaps_PirateNinja_20
    dw Hitboxes_PirateNinja_31

ExtendedSpritemaps_PirateNinja_32:
    dw $0001
    dw $0000,$0003
    dw Spitemaps_PirateNinja_15
    dw Hitboxes_PirateNinja_25

ExtendedSpritemaps_PirateNinja_33:
    dw $0001
    dw $0000,$0003
    dw Spitemaps_PirateNinja_16
    dw Hitboxes_PirateNinja_26

ExtendedSpritemaps_PirateNinja_34:
    dw $0001
    dw $0000,$0003
    dw Spitemaps_PirateNinja_17
    dw Hitboxes_PirateNinja_27

ExtendedSpritemaps_PirateNinja_35:
    dw $0001
    dw $0000,$0003
    dw Spitemaps_PirateNinja_29
    dw Hitboxes_PirateNinja_3B

ExtendedSpritemaps_PirateNinja_36:
    dw $0001
    dw $0000,$0003
    dw Spitemaps_PirateNinja_2A
    dw Hitboxes_PirateNinja_3C

ExtendedSpritemaps_PirateNinja_37:
    dw $0001
    dw $0000,$0003
    dw Spitemaps_PirateNinja_2B
    dw Hitboxes_PirateNinja_3D

ExtendedSpritemaps_PirateWalking_23:
    dw $0001
    dw $0000,$0008
    dw Spitemaps_PirateWalking_2A_Ninja_18
    dw Hitboxes_PirateWalking_38

ExtendedSpritemaps_PirateNinja_38:
    dw $0001
    dw $0000,$0008
    dw Spitemaps_PirateWalking_2A_Ninja_18
    dw Hitboxes_PirateNinja_29

ExtendedSpritemaps_PirateWalking_24:
    dw $0001
    dw $0000,$0008
    dw Spitemaps_PirateWalking_2F
    dw Hitboxes_PirateWalking_3D

ExtendedSpritemaps_PirateNinja_39:
    dw $0001
    dw $0000,$0008
    dw Spitemaps_PirateWalking_2F
    dw Hitboxes_PirateNinja_3F

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ExtendedSpritemaps_SpacePirate_B28FBA:
    dw $0001
    dw $0000,$0000
    dw UNUSED_Spitemaps_SpacePirate_B2DEBA
    dw UNUSED_Hitboxes_SpacePirate_B2A57C

UNUSED_ExtendedSpritemaps_SpacePirate_B28FC4:
    dw $0001
    dw $0000,$0000
    dw UNUSED_Spitemaps_SpacePirate_B2DF20
    dw UNUSED_Hitboxes_SpacePirate_B2A58A

UNUSED_ExtendedSpritemaps_SpacePirate_B28FCE:
    dw $0001
    dw $0000,$0000
    dw UNUSED_Spitemaps_SpacePirate_B2DF6D
    dw UNUSED_Hitboxes_SpacePirate_B2A598

UNUSED_ExtendedSpritemaps_SpacePirate_B28FD8:
    dw $0001
    dw $0000,$0000
    dw UNUSED_Spitemaps_SpacePirate_B2DFB5
    dw UNUSED_Hitboxes_SpacePirate_B2A5A6

UNUSED_ExtendedSpritemaps_SpacePirate_B28FE2:
    dw $0001
    dw $0000,$0000
    dw UNUSED_Spitemaps_SpacePirate_B2E71A
    dw UNUSED_Hitboxes_SpacePirate_B2A760

UNUSED_ExtendedSpritemaps_SpacePirate_B28FEC:
    dw $0001
    dw $0000,$0000
    dw UNUSED_Spitemaps_SpacePirate_B2E780
    dw UNUSED_Hitboxes_SpacePirate_B2A76E

UNUSED_ExtendedSpritemaps_SpacePirate_B28FF6:
    dw $0001
    dw $0000,$0000
    dw UNUSED_Spitemaps_SpacePirate_B2E7CD
    dw UNUSED_Hitboxes_SpacePirate_B2A77C

UNUSED_ExtendedSpritemaps_SpacePirate_B29000:
    dw $0001
    dw $0000,$0000
    dw UNUSED_Spitemaps_SpacePirate_B2E815
    dw UNUSED_Hitboxes_SpacePirate_B2A78A
endif ; !FEATURE_KEEP_UNREFERENCED

ExtendedSpritemaps_PirateNinja_3A:
    dw $0001
    dw $0000,$0000
    dw Spitemaps_PirateNinja_48
    dw Hitboxes_PirateNinja_5A

ExtendedSpritemaps_PirateNinja_3B:
    dw $0001
    dw $0000,$0000
    dw Spitemaps_PirateNinja_4C
    dw Hitboxes_PirateNinja_5E

ExtendedSpritemaps_PirateNinja_3C:
    dw $0001
    dw $0000,$0000
    dw Spitemaps_PirateNinja_4E
    dw Hitboxes_PirateNinja_60

ExtendedSpritemaps_PirateNinja_3D:
    dw $0001
    dw $0000,$0000
    dw Spitemaps_PirateNinja_52
    dw Hitboxes_PirateNinja_64

ExtendedSpritemaps_PirateNinja_3E:
    dw $0001
    dw $0005,$0000
    dw Spitemaps_PirateNinja_4A
    dw Hitboxes_PirateNinja_5C

ExtendedSpritemaps_PirateNinja_3F:
    dw $0001
    dw $FFFB,$0001
    dw Spitemaps_PirateNinja_4B
    dw Hitboxes_PirateNinja_5D

ExtendedSpritemaps_PirateNinja_40:
    dw $0001
    dw $FFFB,$0000
    dw Spitemaps_PirateNinja_50
    dw Hitboxes_PirateNinja_62

ExtendedSpritemaps_PirateNinja_41:
    dw $0001
    dw $0005,$0001
    dw Spitemaps_PirateNinja_51
    dw Hitboxes_PirateNinja_63

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ExtendedSpritemaps_SpacePirate_B2905A:
    dw $0001
    dw $0000,$0000
    dw UNUSED_Spitemaps_SpacePirate_B2C9FC
    dw UNUSED_Hitboxes_SpacePirate_B29FE8

UNUSED_ExtendedSpritemaps_SpacePirate_B29064:
    dw $0001
    dw $0000,$0000
    dw UNUSED_Spitemaps_SpacePirate_B2C9FC
    dw UNUSED_Hitboxes_SpacePirate_B29FE8

UNUSED_ExtendedSpritemaps_SpacePirate_B2906E:
    dw $0002
    dw $FFFB,$0003
    dw Spitemaps_PirateNinja_47
    dw Hitboxes_PirateNinja_59
    dw $0000,$0000
    dw UNUSED_Spitemaps_SpacePirate_B2D0F8
    dw UNUSED_Hitboxes_SpacePirate_B2A17E

UNUSED_ExtendedSpritemaps_SpacePirate_B29080:
    dw $0002
    dw $FFFB,$0003
    dw UNUSED_Spitemaps_SpacePirate_B2DB49
    dw UNUSED_Hitboxes_SpacePirate_B2A4C6
    dw $0000,$0000
    dw UNUSED_Spitemaps_SpacePirate_B2D12C
    dw UNUSED_Hitboxes_SpacePirate_B2A18C

UNUSED_ExtendedSpritemaps_SpacePirate_B29092:
    dw $0002
    dw $FFFB,$0003
    dw UNUSED_Spitemaps_SpacePirate_B2DB78
    dw UNUSED_Hitboxes_SpacePirate_B2A4D4
    dw $0000,$0000
    dw UNUSED_Spitemaps_SpacePirate_B2D165
    dw UNUSED_Hitboxes_SpacePirate_B2A19A

UNUSED_ExtendedSpritemaps_SpacePirate_B290A4:
    dw $0002
    dw $FFFB,$0003
    dw UNUSED_Spitemaps_SpacePirate_B2DBA2
    dw UNUSED_Hitboxes_SpacePirate_B2A4E2
    dw $0002,$0000
    dw UNUSED_Spitemaps_SpacePirate_B2D1A3
    dw UNUSED_Hitboxes_SpacePirate_B2A1A8

UNUSED_ExtendedSpritemaps_SpacePirate_B290B6:
    dw $0002
    dw $FFFB,$0003
    dw UNUSED_Spitemaps_SpacePirate_B2DBA2
    dw UNUSED_Hitboxes_SpacePirate_B2A4E2
    dw $0002,$0000
    dw UNUSED_Spitemaps_SpacePirate_B2D1DC
    dw UNUSED_Hitboxes_SpacePirate_B2A1B6

UNUSED_ExtendedSpritemaps_SpacePirate_B290C8:
    dw $0002
    dw $FFFB,$0003
    dw UNUSED_Spitemaps_SpacePirate_B2DB78
    dw UNUSED_Hitboxes_SpacePirate_B2A4D4
    dw $0002,$0000
    dw UNUSED_Spitemaps_SpacePirate_B2D210
    dw UNUSED_Hitboxes_SpacePirate_B2A1C4

UNUSED_ExtendedSpritemaps_SpacePirate_B290DA:
    dw $0002
    dw $FFFB,$0003
    dw UNUSED_Spitemaps_SpacePirate_B2DB49
    dw UNUSED_Hitboxes_SpacePirate_B2A4C6
    dw $0000,$0000
    dw UNUSED_Spitemaps_SpacePirate_B2D249
    dw UNUSED_Hitboxes_SpacePirate_B2A1D2

UNUSED_ExtendedSpritemaps_SpacePirate_B290EC:
    dw $0002
    dw $FFFB,$0003
    dw Spitemaps_PirateNinja_47
    dw Hitboxes_PirateNinja_59
    dw $0000,$0000
    dw UNUSED_Spitemaps_SpacePirate_B2D287
    dw UNUSED_Hitboxes_SpacePirate_B2A1E0
endif ; !FEATURE_KEEP_UNREFERENCED

ExtendedSpritemaps_PirateNinja_42:
    dw $0002
    dw $0000,$0005
    dw Spitemaps_PirateNinja_47
    dw Hitboxes_PirateNinja_59
    dw $0000,$0003
    dw Spitemaps_PirateNinja_3E
    dw Hitboxes_PirateNinja_52

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ExtendedSpritemaps_SpacePirate_B29110:
    dw $0002
    dw $0000,$0005
    dw UNUSED_Spitemaps_SpacePirate_B2DBCC
    dw UNUSED_Hitboxes_SpacePirate_B2A4F0
    dw $0000,$0003
    dw Spitemaps_PirateNinja_3D
    dw Hitboxes_PirateNinja_51

UNUSED_ExtendedSpritemaps_SpacePirate_B29122:
    dw $0002
    dw $0000,$0005
    dw UNUSED_Spitemaps_SpacePirate_B2DBF1
    dw UNUSED_Hitboxes_SpacePirate_B2A4FE
    dw $0000,$0003
    dw Spitemaps_PirateNinja_3D
    dw Hitboxes_PirateNinja_51

UNUSED_ExtendedSpritemaps_SpacePirate_B29134:
    dw $0002
    dw $0000,$0004
    dw UNUSED_Spitemaps_SpacePirate_B2DC16
    dw UNUSED_Hitboxes_SpacePirate_B2A50C
    dw $0000,$0003
    dw Spitemaps_PirateNinja_3D
    dw Hitboxes_PirateNinja_51

UNUSED_ExtendedSpritemaps_SpacePirate_B29146:
    dw $0002
    dw $0000,$0003
    dw UNUSED_Spitemaps_SpacePirate_B2DC45
    dw UNUSED_Hitboxes_SpacePirate_B2A51A
    dw $0000,$0003
    dw Spitemaps_PirateNinja_3D
    dw Hitboxes_PirateNinja_51

UNUSED_ExtendedSpritemaps_SpacePirate_B29158:
    dw $0002
    dw $0000,$0005
    dw UNUSED_Spitemaps_SpacePirate_B2DC16
    dw UNUSED_Hitboxes_SpacePirate_B2A50C
    dw $0000,$0003
    dw Spitemaps_PirateNinja_3D
    dw Hitboxes_PirateNinja_51

UNUSED_ExtendedSpritemaps_SpacePirate_B2916A:
    dw $0002
    dw $0000,$0005
    dw UNUSED_Spitemaps_SpacePirate_B2DBCC
    dw UNUSED_Hitboxes_SpacePirate_B2A4F0
    dw $0000,$0003
    dw Spitemaps_PirateNinja_3D
    dw Hitboxes_PirateNinja_51

UNUSED_ExtendedSpritemaps_SpacePirate_B2917C:
    dw $0002
    dw $0000,$0006
    dw UNUSED_Spitemaps_SpacePirate_B2DBA2
    dw UNUSED_Hitboxes_SpacePirate_B2A4E2
    dw $0000,$0003
    dw Spitemaps_PirateNinja_3D
    dw Hitboxes_PirateNinja_51

UNUSED_ExtendedSpritemaps_SpacePirate_B2918E:
    dw $0002
    dw $0000,$0007
    dw UNUSED_Spitemaps_SpacePirate_B2DFFD
    dw UNUSED_Hitboxes_SpacePirate_B2A5B4
    dw $0000,$0003
    dw Spitemaps_PirateNinja_3E
    dw Hitboxes_PirateNinja_52

UNUSED_ExtendedSpritemaps_SpacePirate_B291A0:
    dw $0001
    dw $0000,$0003
    dw UNUSED_Spitemaps_SpacePirate_B2D328
    dw UNUSED_Hitboxes_SpacePirate_B2A20A

UNUSED_ExtendedSpritemaps_SpacePirate_B291AA:
    dw $0001
    dw $0000,$0003
    dw UNUSED_Spitemaps_SpacePirate_B2D339
    dw UNUSED_Hitboxes_SpacePirate_B2A218

UNUSED_ExtendedSpritemaps_SpacePirate_B291B4:
    dw $0001
    dw $0000,$0003
    dw UNUSED_Spitemaps_SpacePirate_B2D345
    dw UNUSED_Hitboxes_SpacePirate_B2A226

UNUSED_ExtendedSpritemaps_SpacePirate_B291BE:
    dw $0001
    dw $0000,$0003
    dw UNUSED_Spitemaps_SpacePirate_B2D356
    dw UNUSED_Hitboxes_SpacePirate_B2A234

UNUSED_ExtendedSpritemaps_SpacePirate_B291C8:
    dw $0001
    dw $0000,$0003
    dw UNUSED_Spitemaps_SpacePirate_B2D362
    dw UNUSED_Hitboxes_SpacePirate_B2A242

UNUSED_ExtendedSpritemaps_SpacePirate_B291D2:
    dw $0001
    dw $0000,$0003
    dw UNUSED_Spitemaps_SpacePirate_B2D373
    dw UNUSED_Hitboxes_SpacePirate_B2A250

UNUSED_ExtendedSpritemaps_SpacePirate_B291DC:
    dw $0001
    dw $0000,$0003
    dw UNUSED_Spitemaps_SpacePirate_B2D37F
    dw UNUSED_Hitboxes_SpacePirate_B2A25E

UNUSED_ExtendedSpritemaps_SpacePirate_B291E6:
    dw $0001
    dw $0000,$0003
    dw UNUSED_Spitemaps_SpacePirate_B2D390
    dw UNUSED_Hitboxes_SpacePirate_B2A26C

UNUSED_ExtendedSpritemaps_SpacePirate_B291F0:
    dw $0002
    dw $0005,$0003
    dw Spitemaps_PirateNinja_4D
    dw Hitboxes_PirateNinja_5F
    dw $0000,$0000
    dw UNUSED_Spitemaps_SpacePirate_B2D406
    dw UNUSED_Hitboxes_SpacePirate_B2A2A4

UNUSED_ExtendedSpritemaps_SpacePirate_B29202:
    dw $0002
    dw $0005,$0003
    dw UNUSED_Spitemaps_SpacePirate_B2E3A9
    dw UNUSED_Hitboxes_SpacePirate_B2A6AA
    dw $0000,$0000
    dw UNUSED_Spitemaps_SpacePirate_B2D43A
    dw UNUSED_Hitboxes_SpacePirate_B2A2B2

UNUSED_ExtendedSpritemaps_SpacePirate_B29214:
    dw $0002
    dw $0005,$0003
    dw UNUSED_Spitemaps_SpacePirate_B2E3D8
    dw UNUSED_Hitboxes_SpacePirate_B2A6B8
    dw $0000,$0000
    dw UNUSED_Spitemaps_SpacePirate_B2D473
    dw UNUSED_Hitboxes_SpacePirate_B2A2C0

UNUSED_ExtendedSpritemaps_SpacePirate_B29226:
    dw $0002
    dw $0005,$0003
    dw UNUSED_Spitemaps_SpacePirate_B2E402
    dw UNUSED_Hitboxes_SpacePirate_B2A6C6
    dw $0000,$0000
    dw UNUSED_Spitemaps_SpacePirate_B2D4B1
    dw UNUSED_Hitboxes_SpacePirate_B2A2CE

UNUSED_ExtendedSpritemaps_SpacePirate_B29238:
    dw $0002
    dw $0005,$0003
    dw UNUSED_Spitemaps_SpacePirate_B2E402
    dw UNUSED_Hitboxes_SpacePirate_B2A6C6
    dw $FFFF,$0000
    dw UNUSED_Spitemaps_SpacePirate_B2D4EA
    dw UNUSED_Hitboxes_SpacePirate_B2A2DC

UNUSED_ExtendedSpritemaps_SpacePirate_B2924A:
    dw $0002
    dw $0005,$0003
    dw UNUSED_Spitemaps_SpacePirate_B2E3D8
    dw UNUSED_Hitboxes_SpacePirate_B2A6B8
    dw $0000,$0000
    dw UNUSED_Spitemaps_SpacePirate_B2D51E
    dw UNUSED_Hitboxes_SpacePirate_B2A2EA

UNUSED_ExtendedSpritemaps_SpacePirate_B2925C:
    dw $0002
    dw $0005,$0003
    dw UNUSED_Spitemaps_SpacePirate_B2E3A9
    dw UNUSED_Hitboxes_SpacePirate_B2A6AA
    dw $0001,$0000
    dw UNUSED_Spitemaps_SpacePirate_B2D557
    dw UNUSED_Hitboxes_SpacePirate_B2A2F8

UNUSED_ExtendedSpritemaps_SpacePirate_B2926E:
    dw $0002
    dw $0005,$0003
    dw Spitemaps_PirateNinja_4D
    dw Hitboxes_PirateNinja_5F
    dw $0001,$0000
    dw UNUSED_Spitemaps_SpacePirate_B2D595
    dw UNUSED_Hitboxes_SpacePirate_B2A306
endif ; !FEATURE_KEEP_UNREFERENCED

ExtendedSpritemaps_PirateNinja_43:
    dw $0002
    dw $0000,$0005
    dw Spitemaps_PirateNinja_4D
    dw Hitboxes_PirateNinja_5F
    dw $0000,$0003
    dw Spitemaps_PirateNinja_42
    dw Hitboxes_PirateNinja_56

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ExtendedSpritemaps_SpacePirate_B29292:
    dw $0002
    dw $0000,$0005
    dw UNUSED_Spitemaps_SpacePirate_B2E42C
    dw UNUSED_Hitboxes_SpacePirate_B2A6D4
    dw $0000,$0003
    dw Spitemaps_PirateNinja_41
    dw Hitboxes_PirateNinja_55

UNUSED_ExtendedSpritemaps_SpacePirate_B292A4:
    dw $0002
    dw $0000,$0005
    dw UNUSED_Spitemaps_SpacePirate_B2E451
    dw UNUSED_Hitboxes_SpacePirate_B2A6E2
    dw $0000,$0003
    dw Spitemaps_PirateNinja_41
    dw Hitboxes_PirateNinja_55

UNUSED_ExtendedSpritemaps_SpacePirate_B292B6:
    dw $0002
    dw $0000,$0004
    dw UNUSED_Spitemaps_SpacePirate_B2E476
    dw UNUSED_Hitboxes_SpacePirate_B2A6F0
    dw $0000,$0003
    dw Spitemaps_PirateNinja_41
    dw Hitboxes_PirateNinja_55

UNUSED_ExtendedSpritemaps_SpacePirate_B292C8:
    dw $0002
    dw $0000,$0003
    dw UNUSED_Spitemaps_SpacePirate_B2E4A5
    dw UNUSED_Hitboxes_SpacePirate_B2A6FE
    dw $0000,$0003
    dw Spitemaps_PirateNinja_41
    dw Hitboxes_PirateNinja_55

UNUSED_ExtendedSpritemaps_SpacePirate_B292DA:
    dw $0002
    dw $0000,$0005
    dw UNUSED_Spitemaps_SpacePirate_B2E476
    dw UNUSED_Hitboxes_SpacePirate_B2A6F0
    dw $0000,$0003
    dw Spitemaps_PirateNinja_41
    dw Hitboxes_PirateNinja_55

UNUSED_ExtendedSpritemaps_SpacePirate_B292EC:
    dw $0002
    dw $0000,$0005
    dw UNUSED_Spitemaps_SpacePirate_B2E402
    dw UNUSED_Hitboxes_SpacePirate_B2A6C6
    dw $0000,$0003
    dw Spitemaps_PirateNinja_41
    dw Hitboxes_PirateNinja_55

UNUSED_ExtendedSpritemaps_SpacePirate_B292FE:
    dw $0002
    dw $0000,$0006
    dw UNUSED_Spitemaps_SpacePirate_B2E85D
    dw UNUSED_Hitboxes_SpacePirate_B2A798
    dw $0000,$0003
    dw Spitemaps_PirateNinja_41
    dw Hitboxes_PirateNinja_55

UNUSED_ExtendedSpritemaps_SpacePirate_B29310:
    dw $0002
    dw $0000,$0007
    dw UNUSED_Spitemaps_SpacePirate_B2E85D
    dw UNUSED_Hitboxes_SpacePirate_B2A798
    dw $0000,$0003
    dw Spitemaps_PirateNinja_42
    dw Hitboxes_PirateNinja_56

UNUSED_ExtendedSpritemaps_SpacePirate_B29322:
    dw $0001
    dw $0000,$0000
    dw UNUSED_Spitemaps_SpacePirate_B2D636
    dw UNUSED_Hitboxes_SpacePirate_B2A322

UNUSED_ExtendedSpritemaps_SpacePirate_B2932C:
    dw $0001
    dw $0000,$0000
    dw UNUSED_Spitemaps_SpacePirate_B2D647
    dw UNUSED_Hitboxes_SpacePirate_B2A330

UNUSED_ExtendedSpritemaps_SpacePirate_B29336:
    dw $0001
    dw $0000,$0000
    dw UNUSED_Spitemaps_SpacePirate_B2D653
    dw UNUSED_Hitboxes_SpacePirate_B2A33E

UNUSED_ExtendedSpritemaps_SpacePirate_B29340:
    dw $0001
    dw $0000,$0000
    dw UNUSED_Spitemaps_SpacePirate_B2D664
    dw UNUSED_Hitboxes_SpacePirate_B2A34C

UNUSED_ExtendedSpritemaps_SpacePirate_B2934A:
    dw $0001
    dw $0000,$0000
    dw UNUSED_Spitemaps_SpacePirate_B2D670
    dw UNUSED_Hitboxes_SpacePirate_B2A35A

UNUSED_ExtendedSpritemaps_SpacePirate_B29354:
    dw $0001
    dw $0000,$0000
    dw UNUSED_Spitemaps_SpacePirate_B2D681
    dw UNUSED_Hitboxes_SpacePirate_B2A368

UNUSED_ExtendedSpritemaps_SpacePirate_B2935E:
    dw $0001
    dw $0000,$0000
    dw UNUSED_Spitemaps_SpacePirate_B2D68D
    dw UNUSED_Hitboxes_SpacePirate_B2A376

UNUSED_ExtendedSpritemaps_SpacePirate_B29368:
    dw $0001
    dw $0000,$0004
    dw UNUSED_Spitemaps_SpacePirate_B2D69E
    dw UNUSED_Hitboxes_SpacePirate_B2A384
endif ; !FEATURE_KEEP_UNREFERENCED

ExtendedSpritemaps_PirateNinja_44:
    dw $0001
    dw $0002,$0000
    dw Spitemaps_PirateNinja_49
    dw Hitboxes_PirateNinja_5B

ExtendedSpritemaps_PirateNinja_45:
    dw $0001
    dw $FFFE,$0000
    dw Spitemaps_PirateNinja_4F
    dw Hitboxes_PirateNinja_61

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ExtendedSpritemaps_SpacePirate_B29386:
    dw $0001
    dw $0000,$0003
    dw UNUSED_Spitemaps_SpacePirate_B2C9FC
    dw UNUSED_Hitboxes_SpacePirate_B29FE8

UNUSED_ExtendedSpritemaps_SpacePirate_B29390:
    dw $0001
    dw $0000,$0003
    dw UNUSED_Spitemaps_SpacePirate_B2C9FC
    dw UNUSED_Hitboxes_SpacePirate_B29FE8

UNUSED_ExtendedSpritemaps_SpacePirate_B2939A:
    dw $0001
    dw $FFFF,$0004
    dw UNUSED_Spitemaps_SpacePirate_B2C9FC
    dw UNUSED_Hitboxes_SpacePirate_B29FE8

UNUSED_ExtendedSpritemaps_SpacePirate_B293A4:
    dw $0001
    dw $FFFE,$0006
    dw UNUSED_Spitemaps_SpacePirate_B2C9FC
    dw UNUSED_Hitboxes_SpacePirate_B29FE8

UNUSED_ExtendedSpritemaps_SpacePirate_B293AE:
    dw $0001
    dw $0000,$0003
    dw UNUSED_Spitemaps_SpacePirate_B2C9FC
    dw UNUSED_Hitboxes_SpacePirate_B29FE8

UNUSED_ExtendedSpritemaps_SpacePirate_B293B8:
    dw $0001
    dw $0000,$0003
    dw UNUSED_Spitemaps_SpacePirate_B2C9FC
    dw UNUSED_Hitboxes_SpacePirate_B29FE8

UNUSED_ExtendedSpritemaps_SpacePirate_B293C2:
    dw $0001
    dw $0000,$0003
    dw UNUSED_Spitemaps_SpacePirate_B2C9FC
    dw UNUSED_Hitboxes_SpacePirate_B29FE8

UNUSED_ExtendedSpritemaps_SpacePirate_B293CC:
    dw $0001
    dw $0000,$0003
    dw UNUSED_Spitemaps_SpacePirate_B2C9FC
    dw UNUSED_Hitboxes_SpacePirate_B29FE8

UNUSED_ExtendedSpritemaps_SpacePirate_B293D6:
    dw $0001
    dw $0001,$0004
    dw UNUSED_Spitemaps_SpacePirate_B2C9FC
    dw UNUSED_Hitboxes_SpacePirate_B29FE8

UNUSED_ExtendedSpritemaps_SpacePirate_B293E0:
    dw $0001
    dw $0002,$0006
    dw UNUSED_Spitemaps_SpacePirate_B2C9FC
    dw UNUSED_Hitboxes_SpacePirate_B29FE8
endif ; !FEATURE_KEEP_UNREFERENCED

ExtendedSpritemaps_PirateNinja_46:
    dw $0003
    dw $FFFB,$FFF4
    dw Spitemaps_PirateNinja_43
    dw Hitboxes_PirateNinja_57
    dw $0000,$0003
    dw Spitemaps_PirateNinja_3F
    dw Hitboxes_PirateNinja_53
    dw $0000,$0003
    dw Spitemaps_PirateNinja_3D
    dw Hitboxes_PirateNinja_51

ExtendedSpritemaps_PirateNinja_47:
    dw $0002
    dw $0000,$0003
    dw Spitemaps_PirateNinja_45
    dw Hitboxes_PirateNinja_57
    dw $0000,$0003
    dw Spitemaps_PirateNinja_3D
    dw Hitboxes_PirateNinja_51

ExtendedSpritemaps_PirateNinja_48:
    dw $0003
    dw $FFFB,$FFF5
    dw Spitemaps_PirateNinja_44
    dw Hitboxes_PirateNinja_57
    dw $0000,$0003
    dw Spitemaps_PirateNinja_3F
    dw Hitboxes_PirateNinja_53
    dw $0000,$0003
    dw Spitemaps_PirateNinja_3D
    dw Hitboxes_PirateNinja_51

ExtendedSpritemaps_PirateNinja_49:
    dw $0003
    dw $0005,$FFF4
    dw Spitemaps_PirateNinja_43
    dw Hitboxes_PirateNinja_57
    dw $0000,$0003
    dw Spitemaps_PirateNinja_40
    dw Hitboxes_PirateNinja_54
    dw $0000,$0003
    dw Spitemaps_PirateNinja_41
    dw Hitboxes_PirateNinja_55

ExtendedSpritemaps_PirateNinja_4A:
    dw $0002
    dw $0000,$0003
    dw Spitemaps_PirateNinja_46
    dw Hitboxes_PirateNinja_58
    dw $0000,$0003
    dw Spitemaps_PirateNinja_41
    dw Hitboxes_PirateNinja_55

ExtendedSpritemaps_PirateNinja_4B:
    dw $0003
    dw $0005,$FFF5
    dw Spitemaps_PirateNinja_44
    dw Hitboxes_PirateNinja_57
    dw $0000,$0003
    dw Spitemaps_PirateNinja_40
    dw Hitboxes_PirateNinja_54
    dw $0000,$0003
    dw Spitemaps_PirateNinja_41
    dw Hitboxes_PirateNinja_55

ExtendedSpritemaps_PirateNinja_4C:
    dw $0001
    dw $0000,$0001
    dw Spitemaps_PirateNinja_3C
    dw Hitboxes_PirateNinja_50

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ExtendedSpritemaps_SpacePirate_B29480:
    dw $0001
    dw $0000,$0000
    dw UNUSED_Spitemaps_SpacePirate_B2E9F7
    dw UNUSED_Hitboxes_SpacePirate_B2A802

UNUSED_ExtendedSpritemaps_SpacePirate_B2948A:
    dw $0001
    dw $0000,$0000
    dw UNUSED_Spitemaps_SpacePirate_B2EA0D
    dw UNUSED_Hitboxes_SpacePirate_B2A810

UNUSED_ExtendedSpritemaps_SpacePirate_B29494:
    dw $0001
    dw $0000,$0000
    dw UNUSED_Spitemaps_SpacePirate_B2EA2D
    dw UNUSED_Hitboxes_SpacePirate_B2A81E

UNUSED_ExtendedSpritemaps_SpacePirate_B2949E:
    dw $0001
    dw $0000,$0000
    dw UNUSED_Spitemaps_SpacePirate_B2EA48
    dw UNUSED_Hitboxes_SpacePirate_B2A82C

UNUSED_ExtendedSpritemaps_SpacePirate_B294A8:
    dw $0001
    dw $0000,$0000
    dw UNUSED_Spitemaps_SpacePirate_B2EA6D
    dw UNUSED_Hitboxes_SpacePirate_B2A83A

UNUSED_ExtendedSpritemaps_SpacePirate_B294B2:
    dw $0001
    dw $0000,$0000
    dw UNUSED_Spitemaps_SpacePirate_B2EA83
    dw UNUSED_Hitboxes_SpacePirate_B2A848

UNUSED_ExtendedSpritemaps_SpacePirate_B294BC:
    dw $0001
    dw $0000,$0000
    dw UNUSED_Spitemaps_SpacePirate_B2EAA3
    dw UNUSED_Hitboxes_SpacePirate_B2A856

UNUSED_ExtendedSpritemaps_SpacePirate_B294C6:
    dw $0001
    dw $0000,$0000
    dw UNUSED_Spitemaps_SpacePirate_B2EABE
    dw UNUSED_Hitboxes_SpacePirate_B2A864

UNUSED_ExtendedSpritemaps_SpacePirate_B294D0:
    dw $0001
    dw $0000,$0000
    dw UNUSED_Spitemaps_SpacePirate_B2EBD4
    dw UNUSED_Hitboxes_SpacePirate_B2A872

UNUSED_ExtendedSpritemaps_SpacePirate_B294DA:
    dw $0001
    dw $0000,$0000
    dw UNUSED_Spitemaps_SpacePirate_B2EBEA
    dw UNUSED_Hitboxes_SpacePirate_B2A880

UNUSED_ExtendedSpritemaps_SpacePirate_B294E4:
    dw $0001
    dw $0000,$0000
    dw UNUSED_Spitemaps_SpacePirate_B2EC0A
    dw UNUSED_Hitboxes_SpacePirate_B2A88E

UNUSED_ExtendedSpritemaps_SpacePirate_B294EE:
    dw $0001
    dw $0000,$0000
    dw UNUSED_Spitemaps_SpacePirate_B2EC25
    dw UNUSED_Hitboxes_SpacePirate_B2A89C

UNUSED_ExtendedSpritemaps_SpacePirate_B294F8:
    dw $0001
    dw $0000,$0000
    dw UNUSED_Spitemaps_SpacePirate_B2EC4A
    dw UNUSED_Hitboxes_SpacePirate_B2A8AA

UNUSED_ExtendedSpritemaps_SpacePirate_B29502:
    dw $0001
    dw $0000,$0000
    dw UNUSED_Spitemaps_SpacePirate_B2EC60
    dw UNUSED_Hitboxes_SpacePirate_B2A8B8

UNUSED_ExtendedSpritemaps_SpacePirate_B2950C:
    dw $0001
    dw $0000,$0000
    dw UNUSED_Spitemaps_SpacePirate_B2EC80
    dw UNUSED_Hitboxes_SpacePirate_B2A8C6

UNUSED_ExtendedSpritemaps_SpacePirate_B29516:
    dw $0001
    dw $0000,$0000
    dw UNUSED_Spitemaps_SpacePirate_B2EC9B
    dw UNUSED_Hitboxes_SpacePirate_B2A8D4

UNUSED_ExtendedSpritemaps_SpacePirate_B29520:
    dw $0002
    dw $FFFB,$0001
    dw Spitemaps_PirateNinja_47
    dw Hitboxes_PirateNinja_59
    dw $0000,$FFFE
    dw UNUSED_Spitemaps_SpacePirate_B2D948
    dw UNUSED_Hitboxes_SpacePirate_B2A448

UNUSED_ExtendedSpritemaps_SpacePirate_B29532:
    dw $0002
    dw $FFFB,$0003
    dw UNUSED_Spitemaps_SpacePirate_B2DB49
    dw UNUSED_Hitboxes_SpacePirate_B2A4C6
    dw $FFFF,$0000
    dw UNUSED_Spitemaps_SpacePirate_B2D97C
    dw UNUSED_Hitboxes_SpacePirate_B2A456

UNUSED_ExtendedSpritemaps_SpacePirate_B29544:
    dw $0002
    dw $FFFB,$0004
    dw UNUSED_Spitemaps_SpacePirate_B2DB78
    dw UNUSED_Hitboxes_SpacePirate_B2A4D4
    dw $0000,$0000
    dw UNUSED_Spitemaps_SpacePirate_B2D9BA
    dw UNUSED_Hitboxes_SpacePirate_B2A464

UNUSED_ExtendedSpritemaps_SpacePirate_B29556:
    dw $0002
    dw $FFFB,$0002
    dw UNUSED_Spitemaps_SpacePirate_B2DBA2
    dw UNUSED_Hitboxes_SpacePirate_B2A4E2
    dw $FFFF,$0000
    dw UNUSED_Spitemaps_SpacePirate_B2D9F8
    dw UNUSED_Hitboxes_SpacePirate_B2A472

UNUSED_ExtendedSpritemaps_SpacePirate_B29568:
    dw $0002
    dw $FFFB,$0001
    dw UNUSED_Spitemaps_SpacePirate_B2DBA2
    dw UNUSED_Hitboxes_SpacePirate_B2A4E2
    dw $0002,$FFFE
    dw UNUSED_Spitemaps_SpacePirate_B2DA31
    dw UNUSED_Hitboxes_SpacePirate_B2A480

UNUSED_ExtendedSpritemaps_SpacePirate_B2957A:
    dw $0002
    dw $FFFB,$0003
    dw UNUSED_Spitemaps_SpacePirate_B2DB78
    dw UNUSED_Hitboxes_SpacePirate_B2A4D4
    dw $0002,$0000
    dw UNUSED_Spitemaps_SpacePirate_B2DA65
    dw UNUSED_Hitboxes_SpacePirate_B2A48E

UNUSED_ExtendedSpritemaps_SpacePirate_B2958C:
    dw $0002
    dw $FFFB,$0003
    dw UNUSED_Spitemaps_SpacePirate_B2DB49
    dw UNUSED_Hitboxes_SpacePirate_B2A4C6
    dw $0000,$0000
    dw UNUSED_Spitemaps_SpacePirate_B2DAA3
    dw UNUSED_Hitboxes_SpacePirate_B2A49C

UNUSED_ExtendedSpritemaps_SpacePirate_B2959E:
    dw $0002
    dw $FFFB,$0001
    dw Spitemaps_PirateNinja_47
    dw Hitboxes_PirateNinja_59
    dw $0000,$0000
    dw UNUSED_Spitemaps_SpacePirate_B2DAE1
    dw UNUSED_Hitboxes_SpacePirate_B2A4AA

UNUSED_ExtendedSpritemaps_SpacePirate_B295B0:
    dw $0002
    dw $0005,$0001
    dw Spitemaps_PirateNinja_4D
    dw Hitboxes_PirateNinja_5F
    dw $0000,$FFFE
    dw UNUSED_Spitemaps_SpacePirate_B2E1A8
    dw UNUSED_Hitboxes_SpacePirate_B2A62C

UNUSED_ExtendedSpritemaps_SpacePirate_B295C2:
    dw $0002
    dw $0005,$0003
    dw UNUSED_Spitemaps_SpacePirate_B2E3A9
    dw UNUSED_Hitboxes_SpacePirate_B2A6AA
    dw $0000,$0000
    dw UNUSED_Spitemaps_SpacePirate_B2E1DC
    dw UNUSED_Hitboxes_SpacePirate_B2A63A

UNUSED_ExtendedSpritemaps_SpacePirate_B295D4:
    dw $0002
    dw $0005,$0004
    dw UNUSED_Spitemaps_SpacePirate_B2E3D8
    dw UNUSED_Hitboxes_SpacePirate_B2A6B8
    dw $0000,$0000
    dw UNUSED_Spitemaps_SpacePirate_B2E21A
    dw UNUSED_Hitboxes_SpacePirate_B2A648

UNUSED_ExtendedSpritemaps_SpacePirate_B295E6:
    dw $0002
    dw $0005,$0002
    dw UNUSED_Spitemaps_SpacePirate_B2E402
    dw UNUSED_Hitboxes_SpacePirate_B2A6C6
    dw $0000,$0000
    dw UNUSED_Spitemaps_SpacePirate_B2E258
    dw UNUSED_Hitboxes_SpacePirate_B2A656

UNUSED_ExtendedSpritemaps_SpacePirate_B295F8:
    dw $0002
    dw $0005,$0001
    dw UNUSED_Spitemaps_SpacePirate_B2E402
    dw UNUSED_Hitboxes_SpacePirate_B2A6C6
    dw $FFFF,$FFFF
    dw UNUSED_Spitemaps_SpacePirate_B2E291
    dw UNUSED_Hitboxes_SpacePirate_B2A664

UNUSED_ExtendedSpritemaps_SpacePirate_B2960A:
    dw $0002
    dw $0005,$0003
    dw UNUSED_Spitemaps_SpacePirate_B2E3D8
    dw UNUSED_Hitboxes_SpacePirate_B2A6B8
    dw $0000,$0000
    dw UNUSED_Spitemaps_SpacePirate_B2E2C5
    dw UNUSED_Hitboxes_SpacePirate_B2A672

UNUSED_ExtendedSpritemaps_SpacePirate_B2961C:
    dw $0002
    dw $0005,$0003
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
    dw $0001
    dw $0000,$0003
    dw UNUSED_Spitemaps_SpacePirate_B2DCDF
    dw UNUSED_Hitboxes_SpacePirate_B2A536

UNUSED_ExtendedSpritemaps_SpacePirate_B29654:
    dw $0001
    dw $0000,$0003
    dw UNUSED_Spitemaps_SpacePirate_B2DD40
    dw UNUSED_Hitboxes_SpacePirate_B2A544

UNUSED_ExtendedSpritemaps_SpacePirate_B2965E:
    dw $0001
    dw $0000,$0003
    dw UNUSED_Spitemaps_SpacePirate_B2E4D9
    dw UNUSED_Hitboxes_SpacePirate_B2A70C

UNUSED_ExtendedSpritemaps_SpacePirate_B29668:
    dw $0001
    dw $0000,$0003
    dw UNUSED_Spitemaps_SpacePirate_B2E53F
    dw UNUSED_Hitboxes_SpacePirate_B2A71A

UNUSED_ExtendedSpritemaps_SpacePirate_B29672:
    dw $0001
    dw $0000,$0003
    dw UNUSED_Spitemaps_SpacePirate_B2E5A0
    dw UNUSED_Hitboxes_SpacePirate_B2A728

UNUSED_ExtendedSpritemaps_SpacePirate_B2967C:
    dw $0001
    dw $0000,$0008
    dw UNUSED_Spitemaps_SpacePirate_B2E03D
    dw UNUSED_Hitboxes_SpacePirate_B2A5D0

UNUSED_ExtendedSpritemaps_SpacePirate_B29686:
    dw $0001
    dw $0000,$0008
    dw UNUSED_Spitemaps_SpacePirate_B2E88C
    dw UNUSED_Hitboxes_SpacePirate_B2A7A6
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $9690: Hitboxes ;;;
; [n entries] [[left offset] [top offset] [right offset] [bottom offset] [p touch] [p shot]]...
Hitboxes_PirateWall_0:
    dw $0001
    dw $FFEE,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateWall_1:
    dw $0001
    dw $FFEE,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateWall_2:
    dw $0001
    dw $FFEE,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateWall_3:
    dw $0001
    dw $FFEE,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateWall_4:
    dw $0001
    dw $FFEE,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateWall_5:
    dw $0001
    dw $FFF2,$0000,$0004,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateWall_6:
    dw $0001
    dw $FFF1,$0000,$FFFF,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateWall_7:
    dw $0001
    dw $FFF1,$FFFA,$0000,$0017
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateWall_8:
    dw $0001
    dw $FFF0,$FFFB,$FFFF,$0019
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateWall_9:
    dw $0001
    dw $FFEF,$FFF8,$0000,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateWalking_0:
    dw $0001
    dw $FFF3,$FFED,$000A,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateWall_A:
    dw $0001
    dw $FFF1,$FFED,$000E,$0006
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateWall_B:
    dw $0001
    dw $FFF0,$FFED,$000E,$0003
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateWall_C:
    dw $0001
    dw $FFF6,$FFEB,$0013,$0016
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateWall_D:
    dw $0001
    dw $FFF8,$FFED,$0012,$0010
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateWall_E:
    dw $0001
    dw $FFF7,$FFE9,$0011,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateWall_F:
    dw $0001
    dw $FFF7,$FFED,$0010,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateWall_10:
    dw $0001
    dw $FFF7,$FFED,$0011,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateWall_11:
    dw $0001
    dw $FFF7,$FFED,$0010,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateWall_12:
    dw $0001
    dw $FFF7,$FFED,$0011,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateWall_13:
    dw $0001
    dw $FFF9,$0000,$000F,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateWall_14:
    dw $0001
    dw $FFFE,$0000,$000F,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateWall_15:
    dw $0001
    dw $FFFE,$0000,$000F,$0017
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateWall_16:
    dw $0001
    dw $0000,$0000,$000F,$0019
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateWall_17:
    dw $0001
    dw $FFFF,$0000,$000F,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateWall_18:
    dw $0001
    dw $FFF1,$FFED,$000F,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateWall_19:
    dw $0001
    dw $FFF1,$FFED,$000E,$0003
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateWall_1A:
    dw $0001
    dw $FFEC,$FFED,$000A,$0019
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateWall_1B:
    dw $0001
    dw $FFEC,$FFED,$0006,$0010
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateWalking_1:
    dw $0001
    dw $FFF5,$0000,$0008,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateWalking_2:
    dw $0001
    dw $FFF5,$0000,$0008,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateWalking_3:
    dw $0001
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateWalking_4:
    dw $0001
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateWalking_5:
    dw $0001
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateWalking_6:
    dw $0001
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateWalking_7:
    dw $0001
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateWalking_8:
    dw $0001
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateWalking_9_Ninja_0:
    dw $0001
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible

Hitboxes_PirateWalking_A_Ninja_1:
    dw $0001
    dw $FFF9,$0000,$0006,$0010
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateWalking_A_Ninja_2:
    dw $0001
    dw $FFF9,$FFF7,$0006,$0006
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateWalking_B_Ninja_3:
    dw $0001
    dw $FFF9,$FFF7,$0006,$0006
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateWalking_C_Ninja_4:
    dw $0001
    dw $FFF9,$FFF7,$0006,$0006
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateWalking_D_Ninja_5:
    dw $0001
    dw $FFF9,$FFF7,$0006,$0006
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateWalking_E_Ninja_6:
    dw $0001
    dw $FFF9,$FFF7,$0006,$0006
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateWalking_F_Ninja_7:
    dw $0001
    dw $FFF9,$FFF7,$0006,$0006
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateWalking_10_Ninja_8:
    dw $0001
    dw $FFF9,$FFF7,$0006,$0006
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateWalking_11_Ninja_9:
    dw $0001
    dw $FFF9,$FFF7,$0006,$0006
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateWalking_12_Ninja_A:
    dw $0001
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible

Hitboxes_PirateWalking_13:
    dw $0001
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateWalking_14:
    dw $0001
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateWalking_15:
    dw $0001
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateWalking_16:
    dw $0001
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateWalking_17:
    dw $0001
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateWalking_18:
    dw $0001
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateWalking_19:
    dw $0001
    dw $FFF9,$FFFF,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateWalking_1A:
    dw $0001
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateWalking_1B:
    dw $0001
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateWalking_1C:
    dw $0001
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateWalking_1D_Ninja_A:
    dw $0001
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible

Hitboxes_PirateWalking_1E_Ninja_B:
    dw $0001
    dw $FFF9,$FFF7,$0006,$0006
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateWalking_1F_Ninja_C:
    dw $0001
    dw $FFF9,$FFF7,$0006,$0006
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateWalking_20_Ninja_D:
    dw $0001
    dw $FFF9,$FFF7,$0006,$0006
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateWalking_21_Ninja_E:
    dw $0001
    dw $FFF9,$FFF7,$0006,$0006
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateWalking_22_Ninja_F:
    dw $0001
    dw $FFF9,$FFF7,$0006,$0006
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateWalking_23_Ninja_10:
    dw $0001
    dw $FFF9,$FFF7,$0006,$0006
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateWalking_24_Ninja_11:
    dw $0001
    dw $FFF9,$FFF7,$0006,$0006
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateWalking_25_Ninja_12:
    dw $0001
    dw $FFF9,$FFF7,$0006,$0006
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateWalking_26_Ninja_13:
    dw $0001
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible

Hitboxes_PirateWalking_27:
    dw $0001
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateWalking_28:
    dw $0001
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateWalking_29:
    dw $0001
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateWalking_2A:
    dw $0001
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateWalking_2B:
    dw $0001
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateWalking_2C:
    dw $0001
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateWalking_2D:
    dw $0001
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateWalking_2E:
    dw $0001
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateWalking_2F:
    dw $0001
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateWalking_30:
    dw $0001
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateWalking_31:
    dw $0001
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateWalking_32:
    dw $0001
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateNinja_14:
    dw $0001
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateNinja_15:
    dw $0001
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateNinja_16:
    dw $0001
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateNinja_17:
    dw $0001
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateNinja_18:
    dw $0001
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateNinja_19:
    dw $0001
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateNinja_1A:
    dw $0001
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateNinja_1B:
    dw $0001
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateWalking_33_Ninja_1C:
    dw $0001
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_GoldNinjaIsVulnerable

Hitboxes_PirateWalking_34_Ninja_1D:
    dw $0001
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible

Hitboxes_PirateWalking_35_Ninja_1E:
    dw $0001
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateWalking_36_Ninja_1F:
    dw $0001
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateWalking_37_Ninja_20:
    dw $0001
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible

Hitboxes_PirateNinja_21:
    dw $0001
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible

Hitboxes_PirateNinja_22:
    dw $0001
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible

Hitboxes_PirateNinja_23:
    dw $0001
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible

Hitboxes_PirateNinja_24:
    dw $0001
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible

Hitboxes_PirateNinja_25:
    dw $0001
    dw $FFF9,$FFED,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible

Hitboxes_PirateNinja_26:
    dw $0001
    dw $FFF9,$FFED,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible

Hitboxes_PirateNinja_27:
    dw $0001
    dw $FFF9,$FFED,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Hitboxes_SpacePirate_B29C08:
    dw $0001
    dw $FFF9,$FFED,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B29C16:
    dw $0001
    dw $FFF1,$FFED,$000B,$0019
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B29C24:
    dw $0001
    dw $FFEE,$FFED,$0008,$0018
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B29C32:
    dw $0001
    dw $FFF1,$FFED,$000B,$0010
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B29C40:
    dw $0001
    dw $FFF0,$FFED,$000C,$0010
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B29C4E:
    dw $0001
    dw $FFF0,$FFED,$000B,$0010
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal
endif ; !FEATURE_KEEP_UNREFERENCED

Hitboxes_PirateNinja_28:
    dw $0001
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Hitboxes_SpacePirate_B29C6A:
    dw $0001
    dw $FFF9,$FFF7,$0006,$0006
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal
endif ; !FEATURE_KEEP_UNREFERENCED

Hitboxes_PirateWalking_38:
    dw $0002
    dw $FFF9,$FFED,$0006,$0017
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal
    dw $FFEE,$FFEE,$FFF9,$0002
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_GoldNinjaIsVulnerable

Hitboxes_PirateNinja_29:
    dw $0002
    dw $FFF9,$FFED,$0006,$0017
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible
    dw $FFEE,$FFEE,$FFF9,$0002
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Hitboxes_SpacePirate_B29CAC:
    dw $0001
    dw $FFF9,$FFED,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B29CBA:
    dw $0002
    dw $FFF9,$FFED,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal
    dw $FFDE,$FFFB,$0003,$0003
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B29CD4:
    dw $0002
    dw $FFF9,$FFED,$0006,$0010
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal
    dw $FFE0,$FFFA,$FFFE,$0004
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal
endif ; !FEATURE_KEEP_UNREFERENCED

Hitboxes_PirateNinja_2A:
    dw $0001
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateNinja_2B:
    dw $0001
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateNinja_2C:
    dw $0001
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateNinja_2D:
    dw $0001
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateNinja_2E:
    dw $0001
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateNinja_2F:
    dw $0001
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateNinja_30:
    dw $0001
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateNinja_31:
    dw $0001
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateWalking_39_Ninja_32:
    dw $0001
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_GoldNinjaIsVulnerable

Hitboxes_PirateNinja_33:
    dw $0001
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible

Hitboxes_PirateWalking_3A_Ninja_34:
    dw $0001
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_GoldNinjaIsVulnerable

Hitboxes_PirateWalking_3B_Ninja_35:
    dw $0001
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_GoldNinjaIsVulnerable

Hitboxes_PirateWalking_3C_Ninja_36:
    dw $0001
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_GoldNinjaIsVulnerable

Hitboxes_PirateNinja_37:
    dw $0001
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible

Hitboxes_PirateNinja_38:
    dw $0001
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible

Hitboxes_PirateNinja_39:
    dw $0001
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible

Hitboxes_PirateNinja_3A:
    dw $0001
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible

Hitboxes_PirateNinja_3B:
    dw $0001
    dw $FFF9,$FFED,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible

Hitboxes_PirateNinja_3C:
    dw $0001
    dw $FFF9,$FFED,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible

Hitboxes_PirateNinja_3D:
    dw $0001
    dw $FFF9,$FFED,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Hitboxes_SpacePirate_B29E06:
    dw $0001
    dw $FFF9,$FFED,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B29E14:
    dw $0001
    dw $FFF9,$FFED,$0006,$0010
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B29E22:
    dw $0001
    dw $FFF7,$FFED,$0010,$0014
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B29E30:
    dw $0001
    dw $FFF5,$FFED,$000E,$0010
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B29E3E:
    dw $0001
    dw $FFF5,$FFED,$000F,$0010
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B29E4C:
    dw $0001
    dw $FFF5,$FFED,$000E,$0010
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal
endif ; !FEATURE_KEEP_UNREFERENCED

Hitboxes_PirateNinja_3E:
    dw $0001
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible

Hitboxes_PirateWalking_3D:
    dw $0002
    dw $FFF9,$FFED,$0006,$0017
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal
    dw $0006,$FFED,$0011,$0001
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_GoldNinjaIsVulnerable

Hitboxes_PirateNinja_3F:
    dw $0002
    dw $FFF9,$FFED,$0006,$0017
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible
    dw $0006,$FFED,$0011,$0001
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Hitboxes_SpacePirate_B29E9C:
    dw $0001
    dw $FFF9,$FFED,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B29EAA:
    dw $0002
    dw $FFF9,$FFED,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal
    dw $0006,$FFFB,$0020,$0004
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B29EC4:
    dw $0002
    dw $FFF9,$FFED,$0006,$0010
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal
    dw $0006,$FFFA,$001F,$0004
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal
endif ; !FEATURE_KEEP_UNREFERENCED

Hitboxes_PirateNinja_40:
    dw $0001
    dw $FFF5,$FFF3,$000A,$000A
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible

Hitboxes_PirateNinja_41:
    dw $0001
    dw $FFF5,$FFF3,$000A,$000A
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible

Hitboxes_PirateNinja_42:
    dw $0001
    dw $FFF5,$FFF3,$000A,$000A
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible

Hitboxes_PirateNinja_43:
    dw $0001
    dw $FFF5,$FFF3,$000A,$000A
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible

Hitboxes_PirateNinja_44:
    dw $0001
    dw $FFF5,$FFF3,$000A,$000A
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible

Hitboxes_PirateNinja_45:
    dw $0001
    dw $FFF5,$FFF3,$000A,$000A
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible

Hitboxes_PirateNinja_46:
    dw $0001
    dw $FFF5,$FFF3,$000A,$000A
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible

Hitboxes_PirateNinja_47:
    dw $0001
    dw $FFF5,$FFF3,$000A,$000A
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Hitboxes_SpacePirate_B29F4E:
    dw $0001
    dw $FFF3,$FFEC,$000C,$0006
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B29F5C:
    dw $0001
    dw $FFF1,$FFEC,$000D,$0006
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B29F6A:
    dw $0001
    dw $FFF8,$FFEA,$000C,$0019
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal
endif ; !FEATURE_KEEP_UNREFERENCED

Hitboxes_PirateNinja_48:
    dw $0001
    dw $FFF5,$FFF3,$000A,$000A
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible

Hitboxes_PirateNinja_49:
    dw $0001
    dw $FFF5,$FFF3,$000A,$000A
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible

Hitboxes_PirateNinja_4A:
    dw $0001
    dw $FFF5,$FFF3,$000A,$000A
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible

Hitboxes_PirateNinja_4B:
    dw $0001
    dw $FFF5,$FFF3,$000A,$000A
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible

Hitboxes_PirateNinja_4C:
    dw $0001
    dw $FFF5,$FFF3,$000A,$000A
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible

Hitboxes_PirateNinja_4D:
    dw $0001
    dw $FFF5,$FFF3,$000A,$000A
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible

Hitboxes_PirateNinja_4E:
    dw $0001
    dw $FFF5,$FFF3,$000A,$000A
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible

Hitboxes_PirateNinja_4F:
    dw $0001
    dw $FFF5,$FFF3,$000A,$000A
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Hitboxes_SpacePirate_B29FE8:
    dw $0001
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B29FF6:
    dw $0001
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A004:
    dw $0001
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A012:
    dw $0001
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A020:
    dw $0001
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A02E:
    dw $0001
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A0C3:
    dw $0001
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A04A:
    dw $0001
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A058:
    dw $0001
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A066:
    dw $0001
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal
endif ; !FEATURE_KEEP_UNREFERENCED

Hitboxes_PirateNinja_50:
    dw $0001
    dw $FFF9,$FFED,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Hitboxes_SpacePirate_B2A082:
    dw $0001
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A090:
    dw $0001
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A09E:
    dw $0001
    dw $FFF9,$FFED,$0006,$0010
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A0AC:
    dw $0001
    dw $FFF9,$FFED,$0006,$0010
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A0BA:
    dw $0001
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A0C8:
    dw $0001
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A0D6:
    dw $0001
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A0E4:
    dw $0001
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A0F2:
    dw $0001
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A100:
    dw $0001
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A10E:
    dw $0001
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A11C:
    dw $0001
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A12A:
    dw $0001
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A138:
    dw $0001
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A146:
    dw $0001
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A154:
    dw $0001
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A162:
    dw $0001
    dw $FFF9,$FFED,$0006,$0010
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A170:
    dw $0001
    dw $FFF9,$FFED,$0006,$0010
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A17E:
    dw $0001
    dw $FFF9,$FFFF,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A18C:
    dw $0001
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A19A:
    dw $0001
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A1A8:
    dw $0001
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A1B6:
    dw $0001
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A1C4:
    dw $0001
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A1D2:
    dw $0001
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A1E0:
    dw $0001
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal
endif ; !FEATURE_KEEP_UNREFERENCED

Hitboxes_PirateNinja_51:
    dw $0001
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Hitboxes_SpacePirate_B2A1FC:
    dw $0001
    dw $FFF9,$0000,$0006,$0010
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A20A:
    dw $0001
    dw $FFF9,$FFF7,$0006,$0006
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A218:
    dw $0001
    dw $FFF9,$FFF7,$0006,$0006
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A226:
    dw $0001
    dw $FFF9,$FFF7,$0006,$0006
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A234:
    dw $0001
    dw $FFF9,$FFF7,$0006,$0006
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A242:
    dw $0001
    dw $FFF9,$FFF7,$0006,$0006
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A250:
    dw $0001
    dw $FFF9,$FFF7,$0006,$0006
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A25E:
    dw $0001
    dw $FFF9,$FFF7,$0006,$0006
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A26C:
    dw $0001
    dw $FFF9,$FFF7,$0006,$0006
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal
endif ; !FEATURE_KEEP_UNREFERENCED

Hitboxes_PirateNinja_52:
    dw $0001
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateNinja_53:
    dw $0001
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible

Hitboxes_PirateNinja_54:
    dw $0001
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Hitboxes_SpacePirate_B2A2A4:
    dw $0001
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A2B2:
    dw $0001
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A2C0:
    dw $0001
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A2CE:
    dw $0001
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A2DC:
    dw $0001
    dw $FFF9,$FFFF,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A2EA:
    dw $0001
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A2F8:
    dw $0001
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A306:
    dw $0001
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal
endif ; !FEATURE_KEEP_UNREFERENCED

Hitboxes_PirateNinja_55:
    dw $0001
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Hitboxes_SpacePirate_B2A322:
    dw $0001
    dw $FFF9,$FFF7,$0006,$0006
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A330:
    dw $0001
    dw $FFF9,$FFF7,$0006,$0006
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A33E:
    dw $0001
    dw $FFF9,$FFF7,$0006,$0006
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A34C:
    dw $0001
    dw $FFF9,$FFF7,$0006,$0006
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A35A:
    dw $0001
    dw $FFF9,$FFF7,$0006,$0006
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A368:
    dw $0001
    dw $FFF9,$FFF7,$0006,$0006
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A376:
    dw $0001
    dw $FFF9,$FFF7,$0006,$0006
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A384:
    dw $0001
    dw $FFF9,$FFF7,$0006,$0006
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal
endif ; !FEATURE_KEEP_UNREFERENCED

Hitboxes_PirateNinja_56:
    dw $0001
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateNinja_57:
    dw $0001
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Hitboxes_SpacePirate_B2A3AE:
    dw $0001
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A3BC:
    dw $0001
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A3CA:
    dw $0001
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A3D8:
    dw $0001
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A3E6:
    dw $0001
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal
endif ; !FEATURE_KEEP_UNREFERENCED

Hitboxes_PirateNinja_58:
    dw $0001
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Hitboxes_SpacePirate_B2A402:
    dw $0001
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A410:
    dw $0001
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A41E:
    dw $0001
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A42C:
    dw $0001
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A43A:
    dw $0001
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A448:
    dw $0001
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A456:
    dw $0001
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A464:
    dw $0001
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A472:
    dw $0001
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A480:
    dw $0001
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A48E:
    dw $0001
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A49C:
    dw $0001
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A4AA:
    dw $0001
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal
endif ; !FEATURE_KEEP_UNREFERENCED

Hitboxes_PirateNinja_59:
    dw $0001
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Hitboxes_SpacePirate_B2A4C6:
    dw $0001
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A4D4:
    dw $0001
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A4E2:
    dw $0001
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A4F0:
    dw $0001
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A4FE:
    dw $0001
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A50C:
    dw $0001
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A51A:
    dw $0001
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A528:
    dw $0001
    dw $FFF9,$FFED,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A536:
    dw $0001
    dw $FFF9,$FFED,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A544:
    dw $0001
    dw $FFF9,$FFED,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A552:
    dw $0001
    dw $FFF9,$FFED,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal
endif ; !FEATURE_KEEP_UNREFERENCED

Hitboxes_PirateNinja_5A:
    dw $0001
    dw $FFF9,$FFED,$0006,$0010
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateNinja_5B:
    dw $0001
    dw $FFF9,$FFED,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Hitboxes_SpacePirate_B2A57C:
    dw $0001
    dw $FFF9,$FFED,$0006,$0010
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A58A:
    dw $0001
    dw $FFF9,$FFED,$0006,$0010
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A598:
    dw $0001
    dw $FFF9,$FFED,$0006,$0010
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A5A6:
    dw $0001
    dw $FFF9,$FFED,$0006,$0010
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A5B4:
    dw $0001
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A5C2:
    dw $0001
    dw $FFF9,$FFF7,$0006,$0006
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A5D0:
    dw $0002
    dw $FFF9,$FFED,$0006,$0017
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal
    dw $FFEE,$FFEE,$FFF9,$0002
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal
endif ; !FEATURE_KEEP_UNREFERENCED

Hitboxes_PirateNinja_5C:
    dw $0001
    dw $FFF9,$FFED,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible

Hitboxes_PirateNinja_5D:
    dw $0002
    dw $FFF9,$FFED,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible
    dw $FFDE,$FFFB,$0003,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible

Hitboxes_PirateNinja_5E:
    dw $0002
    dw $FFF9,$FFED,$0006,$0010
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal
    dw $FFDF,$0003,$FFF9,$0010
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Hitboxes_SpacePirate_B2A62C:
    dw $0001
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A63A:
    dw $0001
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A648:
    dw $0001
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A656:
    dw $0001
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A664:
    dw $0001
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A672:
    dw $0001
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A680:
    dw $0001
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A68E:
    dw $0001
    dw $FFF9,$0000,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal
endif ; !FEATURE_KEEP_UNREFERENCED

Hitboxes_PirateNinja_5F:
    dw $0001
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Hitboxes_SpacePirate_B2A6AA:
    dw $0001
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A6B8:
    dw $0001
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A6C6:
    dw $0001
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A6D4:
    dw $0001
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A6E2:
    dw $0001
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A6F0:
    dw $0001
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A6FE:
    dw $0001
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A70C:
    dw $0001
    dw $FFF9,$FFED,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A71A:
    dw $0001
    dw $FFF9,$FFED,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A728:
    dw $0001
    dw $FFF9,$FFED,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A736:
    dw $0001
    dw $FFF9,$FFED,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal
endif ; !FEATURE_KEEP_UNREFERENCED

Hitboxes_PirateNinja_60:
    dw $0001
    dw $FFF9,$FFED,$0006,$0010
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

Hitboxes_PirateNinja_61:
    dw $0001
    dw $FFF9,$FFED,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Hitboxes_SpacePirate_B2A760:
    dw $0001
    dw $FFF9,$FFED,$0006,$0010
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A76E:
    dw $0001
    dw $FFF9,$FFED,$0006,$0010
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A77C:
    dw $0001
    dw $FFF9,$FFED,$0006,$0010
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A78A:
    dw $0001
    dw $FFF9,$FFED,$0006,$0010
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A798:
    dw $0001
    dw $FFF9,$FFED,$0006,$0000
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A7A6:
    dw $0002
    dw $FFF9,$FFED,$0006,$0017
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal
    dw $0006,$FFED,$0011,$0001
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal
endif ; !FEATURE_KEEP_UNREFERENCED

Hitboxes_PirateNinja_62:
    dw $0001
    dw $FFF9,$FFED,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible

Hitboxes_PirateNinja_63:
    dw $0002
    dw $FFF9,$FFED,$0006,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible
    dw $0006,$FFFA,$0020,$001E
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_GoldNinjaIsInvincible

Hitboxes_PirateNinja_64:
    dw $0002
    dw $FFF9,$FFED,$0006,$0010
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal
    dw $0006,$0003,$001F,$0010
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Hitboxes_SpacePirate_B2A802:
    dw $0001
    dw $FFF5,$FFF3,$000A,$000A
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A810:
    dw $0001
    dw $FFF5,$FFF3,$000A,$000A
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A81E:
    dw $0001
    dw $FFF5,$FFF3,$000A,$000A
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A82C:
    dw $0001
    dw $FFF5,$FFF3,$000A,$000A
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A83A:
    dw $0001
    dw $FFF5,$FFF3,$000A,$000A
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A848:
    dw $0001
    dw $FFF5,$FFF3,$000A,$000A
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A856:
    dw $0001
    dw $FFF5,$FFF3,$000A,$000A
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A864:
    dw $0001
    dw $FFF5,$FFF3,$000A,$000A
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A872:
    dw $0001
    dw $FFF5,$FFF3,$000A,$000A
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A880:
    dw $0001
    dw $FFF5,$FFF3,$000A,$000A
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A88E:
    dw $0001
    dw $FFF5,$FFF3,$000A,$000A
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A89C:
    dw $0001
    dw $FFF5,$FFF3,$000A,$000A
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A8AA:
    dw $0001
    dw $FFF5,$FFF3,$000A,$000A
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A8B8:
    dw $0001
    dw $FFF5,$FFF3,$000A,$000A
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A8C6:
    dw $0001
    dw $FFF5,$FFF3,$000A,$000A
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal

UNUSED_Hitboxes_SpacePirate_B2A8D4:
    dw $0001
    dw $FFF5,$FFF3,$000A,$000A
    dw EnemyTouch_SpacePirate
    dw EnemyShot_SpacePirate_Normal
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $A8E2: Spritemaps ;;;
Spitemaps_PirateWall_0:
    dw $0008
    %spritemapEntry(0, $1EF, $FD, 0, 0, 2, 0, $14D)
    %spritemapEntry(0, $1EF, $F5, 0, 0, 2, 0, $13D)
    %spritemapEntry(0, $1EF, $ED, 0, 0, 2, 0, $12D)
    %spritemapEntry(1, $1F4, $F3, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $1F8, $F0, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1F1, $EA, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $1EF, $E6, 0, 0, 2, 0, $13D)
    %spritemapEntry(0, $1EF, $DE, 0, 0, 2, 0, $12D)

Spitemaps_PirateWall_1:
    dw $0009
    %spritemapEntry(0, $1FC, $F3, 0, 0, 2, 0, $14F)
    %spritemapEntry(0, $1F4, $F4, 0, 0, 2, 0, $14E)
    %spritemapEntry(0, $1EF, $F9, 0, 0, 2, 0, $14D)
    %spritemapEntry(0, $1EF, $F1, 0, 0, 2, 0, $13D)
    %spritemapEntry(0, $1EF, $E9, 0, 0, 2, 0, $12D)
    %spritemapEntry(1, $1F8, $F0, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1F1, $EA, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $1EF, $EA, 0, 0, 2, 0, $13D)
    %spritemapEntry(0, $1EF, $E2, 0, 0, 2, 0, $12D)

Spitemaps_PirateWall_2:
    dw $0008
    %spritemapEntry(0, $1EF, $F3, 0, 0, 2, 0, $14D)
    %spritemapEntry(0, $1EF, $EB, 0, 0, 2, 0, $13D)
    %spritemapEntry(0, $1EF, $E3, 0, 0, 2, 0, $12D)
    %spritemapEntry(0, $1FB, $F3, 0, 0, 2, 0, $14F)
    %spritemapEntry(0, $1F3, $F3, 0, 0, 2, 0, $14E)
    %spritemapEntry(1, $1F8, $F0, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1F1, $EA, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $1EF, $E1, 0, 0, 2, 0, $12D)

Spitemaps_PirateWall_3:
    dw $000A
    %spritemapEntry(0, $1FB, $F1, 0, 0, 2, 0, $14F)
    %spritemapEntry(0, $1F3, $F0, 0, 0, 2, 0, $14E)
    %spritemapEntry(0, $1EF, $ED, 0, 0, 2, 0, $14D)
    %spritemapEntry(0, $1EF, $E5, 0, 0, 2, 0, $13D)
    %spritemapEntry(0, $1EF, $DD, 0, 0, 2, 0, $12D)
    %spritemapEntry(1, $1F8, $F0, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1F1, $EA, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $1EF, $EF, 0, 0, 2, 0, $13D)
    %spritemapEntry(0, $1EF, $F7, 0, 0, 2, 0, $14D)
    %spritemapEntry(1, $1F1, $F0, 0, 0, 2, 0, $100)

Spitemaps_PirateWall_4:
    dw $0009
    %spritemapEntry(1, $1F4, $EB, 1, 1, 2, 0, $105)
    %spritemapEntry(0, $1EF, $EB, 0, 0, 2, 0, $14D)
    %spritemapEntry(0, $1EF, $E3, 0, 0, 2, 0, $13D)
    %spritemapEntry(0, $1EF, $DB, 0, 0, 2, 0, $12D)
    %spritemapEntry(1, $1F8, $F0, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1F1, $EA, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $1EF, $F1, 0, 0, 2, 0, $13D)
    %spritemapEntry(0, $1EF, $F9, 0, 0, 2, 0, $14D)
    %spritemapEntry(1, $1F1, $F2, 0, 0, 2, 0, $100)

Spitemaps_PirateWall_5:
    dw $000A
    %spritemapEntry(0, $1F4, $19, 0, 0, 2, 0, $146)
    %spritemapEntry(0, $1F7, $13, 0, 0, 2, 0, $119)
    %spritemapEntry(0, $1F7, $0B, 0, 0, 2, 0, $109)
    %spritemapEntry(1, $1F9, $FE, 0, 0, 2, 0, $107)
    %spritemapEntry(0, $1EC, $19, 0, 0, 2, 0, $145)
    %spritemapEntry(0, $1F5, $FE, 0, 0, 2, 0, $131)
    %spritemapEntry(0, $1F5, $F6, 0, 0, 2, 0, $121)
    %spritemapEntry(1, $1F6, $F5, 1, 1, 2, 0, $10C)
    %spritemapEntry(0, $1F4, $05, 0, 0, 2, 0, $146)
    %spritemapEntry(0, $1EC, $05, 0, 0, 2, 0, $145)

Spitemaps_PirateWall_6:
    dw $000C
    %spritemapEntry(0, $00, $FD, 0, 0, 2, 0, $149)
    %spritemapEntry(0, $1F8, $FF, 0, 0, 2, 0, $148)
    %spritemapEntry(0, $1F4, $14, 0, 0, 2, 0, $146)
    %spritemapEntry(0, $1EC, $14, 0, 0, 2, 0, $145)
    %spritemapEntry(0, $00, $FB, 0, 0, 2, 0, $149)
    %spritemapEntry(0, $1F8, $F9, 0, 0, 2, 0, $148)
    %spritemapEntry(0, $1F5, $0D, 0, 0, 2, 0, $11A)
    %spritemapEntry(0, $1F5, $05, 0, 0, 2, 0, $10A)
    %spritemapEntry(0, $1F5, $02, 0, 0, 2, 0, $131)
    %spritemapEntry(0, $1F5, $FA, 0, 0, 2, 0, $121)
    %spritemapEntry(0, $1F4, $09, 0, 0, 2, 0, $146)
    %spritemapEntry(0, $1EC, $09, 0, 0, 2, 0, $145)

Spitemaps_PirateWall_7:
    dw $000C
    %spritemapEntry(0, $00, $F9, 0, 0, 2, 0, $149)
    %spritemapEntry(0, $1F8, $FB, 0, 0, 2, 0, $148)
    %spritemapEntry(0, $1F4, $10, 0, 0, 2, 0, $146)
    %spritemapEntry(0, $1EC, $10, 0, 0, 2, 0, $145)
    %spritemapEntry(0, $00, $FB, 0, 0, 2, 0, $149)
    %spritemapEntry(0, $1F8, $F9, 0, 0, 2, 0, $148)
    %spritemapEntry(0, $1F5, $09, 0, 0, 2, 0, $11A)
    %spritemapEntry(0, $1F5, $01, 0, 0, 2, 0, $10A)
    %spritemapEntry(0, $1F5, $06, 0, 0, 2, 0, $131)
    %spritemapEntry(0, $1F5, $FE, 0, 0, 2, 0, $121)
    %spritemapEntry(0, $1F4, $0D, 0, 0, 2, 0, $146)
    %spritemapEntry(0, $1EC, $0D, 0, 0, 2, 0, $145)

Spitemaps_PirateWall_8:
    dw $000C
    %spritemapEntry(0, $1F3, $03, 0, 0, 2, 0, $131)
    %spritemapEntry(0, $1F3, $FB, 0, 0, 2, 0, $121)
    %spritemapEntry(0, $1F4, $0A, 0, 0, 2, 0, $146)
    %spritemapEntry(0, $1EC, $0A, 0, 0, 2, 0, $145)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 0, $149)
    %spritemapEntry(0, $1F8, $FA, 0, 0, 2, 0, $148)
    %spritemapEntry(0, $00, $FE, 0, 0, 2, 0, $149)
    %spritemapEntry(0, $1F8, $00, 0, 0, 2, 0, $148)
    %spritemapEntry(0, $1F4, $12, 0, 0, 2, 0, $146)
    %spritemapEntry(0, $1EC, $12, 0, 0, 2, 0, $145)
    %spritemapEntry(0, $1F5, $0C, 0, 0, 2, 0, $11A)
    %spritemapEntry(0, $1F5, $04, 0, 0, 2, 0, $10A)

Spitemaps_PirateWall_9:
    dw $000A
    %spritemapEntry(0, $1F5, $00, 0, 0, 2, 0, $131)
    %spritemapEntry(0, $1F5, $F8, 0, 0, 2, 0, $121)
    %spritemapEntry(1, $1F7, $F6, 1, 1, 2, 0, $10C)
    %spritemapEntry(0, $1F4, $07, 0, 0, 2, 0, $146)
    %spritemapEntry(0, $1EC, $07, 0, 0, 2, 0, $145)
    %spritemapEntry(0, $1F4, $16, 0, 0, 2, 0, $146)
    %spritemapEntry(0, $1F6, $10, 0, 0, 2, 0, $119)
    %spritemapEntry(0, $1F6, $08, 0, 0, 2, 0, $109)
    %spritemapEntry(1, $1F8, $FD, 0, 0, 2, 0, $107)
    %spritemapEntry(0, $1EC, $16, 0, 0, 2, 0, $145)

Spritemaps_PirateWalking_0:
    dw $0014
    %spritemapEntry(0, $07, $FE, 0, 1, 2, 0, $15D)
    %spritemapEntry(0, $07, $F6, 0, 1, 2, 0, $15C)
    %spritemapEntry(0, $07, $EE, 0, 1, 2, 0, $15B)
    %spritemapEntry(0, $1FF, $14, 0, 1, 2, 0, $15A)
    %spritemapEntry(0, $1FF, $FE, 0, 1, 2, 0, $157)
    %spritemapEntry(0, $1FF, $0C, 0, 1, 2, 0, $159)
    %spritemapEntry(0, $1FF, $06, 0, 1, 2, 0, $158)
    %spritemapEntry(0, $1FF, $F8, 0, 1, 2, 0, $156)
    %spritemapEntry(0, $1FF, $F0, 0, 1, 2, 0, $155)
    %spritemapEntry(0, $1FF, $E8, 0, 1, 2, 0, $154)
    %spritemapEntry(0, $1F0, $00, 0, 0, 2, 0, $15D)
    %spritemapEntry(0, $1F0, $F8, 0, 0, 2, 0, $15C)
    %spritemapEntry(0, $1F0, $F0, 0, 0, 2, 0, $15B)
    %spritemapEntry(0, $1F8, $18, 0, 0, 2, 0, $15A)
    %spritemapEntry(0, $1F8, $00, 0, 0, 2, 0, $157)
    %spritemapEntry(0, $1F8, $10, 0, 0, 2, 0, $159)
    %spritemapEntry(0, $1F8, $08, 0, 0, 2, 0, $158)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $156)
    %spritemapEntry(0, $1F8, $F0, 0, 0, 2, 0, $155)
    %spritemapEntry(0, $1F8, $E8, 0, 0, 2, 0, $154)

Spitemaps_PirateWall_A:
    dw $000D
    %spritemapEntry(1, $1F9, $FC, 0, 0, 2, 0, $127)
    %spritemapEntry(1, $01, $FC, 0, 0, 2, 0, $128)
    %spritemapEntry(0, $1F1, $F7, 0, 0, 2, 0, $14D)
    %spritemapEntry(0, $1F1, $EF, 0, 0, 2, 0, $13D)
    %spritemapEntry(0, $1F1, $E7, 0, 0, 2, 0, $12D)
    %spritemapEntry(0, $06, $FB, 0, 1, 2, 0, $112)
    %spritemapEntry(0, $06, $F3, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $1FA, $EB, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $03, $F9, 0, 1, 2, 0, $142)
    %spritemapEntry(0, $1FB, $F1, 0, 1, 2, 0, $141)
    %spritemapEntry(0, $03, $F1, 0, 1, 2, 0, $140)
    %spritemapEntry(0, $1FB, $F9, 0, 1, 2, 0, $147)
    %spritemapEntry(1, $1F1, $F0, 0, 0, 2, 0, $100)

Spitemaps_PirateWall_B:
    dw $000E
    %spritemapEntry(0, $1F0, $F7, 0, 0, 2, 0, $14D)
    %spritemapEntry(0, $1F0, $EF, 0, 0, 2, 0, $13D)
    %spritemapEntry(0, $1F0, $E7, 0, 0, 2, 0, $12D)
    %spritemapEntry(1, $1FE, $EB, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $1F1, $F0, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $03, $F9, 0, 1, 2, 0, $142)
    %spritemapEntry(0, $1FB, $F1, 0, 1, 2, 0, $141)
    %spritemapEntry(0, $03, $F1, 0, 1, 2, 0, $140)
    %spritemapEntry(0, $1FB, $F9, 0, 1, 2, 0, $147)
    %spritemapEntry(0, $08, $FD, 1, 0, 2, 0, $14D)
    %spritemapEntry(0, $08, $05, 1, 0, 2, 0, $13D)
    %spritemapEntry(0, $08, $0D, 1, 0, 2, 0, $12D)
    %spritemapEntry(0, $06, $FB, 0, 1, 2, 0, $112)
    %spritemapEntry(0, $06, $F3, 0, 1, 2, 0, $102)

Spitemaps_PirateWall_C:
    dw $0014
    %spritemapEntry(0, $00, $F2, 0, 1, 2, 0, $14F)
    %spritemapEntry(0, $08, $F1, 0, 1, 2, 0, $14E)
    %spritemapEntry(0, $0C, $EE, 0, 1, 2, 0, $14D)
    %spritemapEntry(0, $0C, $E6, 0, 1, 2, 0, $13D)
    %spritemapEntry(0, $0C, $DE, 0, 1, 2, 0, $12D)
    %spritemapEntry(1, $1FB, $F1, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $02, $EB, 0, 1, 2, 0, $10E)
    %spritemapEntry(0, $0C, $F0, 0, 1, 2, 0, $13D)
    %spritemapEntry(0, $0C, $F8, 0, 1, 2, 0, $14D)
    %spritemapEntry(1, $02, $F1, 0, 1, 2, 0, $100)
    %spritemapEntry(1, $1F9, $FF, 0, 1, 2, 0, $107)
    %spritemapEntry(0, $1F4, $11, 0, 1, 2, 0, $144)
    %spritemapEntry(0, $1F4, $09, 0, 1, 2, 0, $143)
    %spritemapEntry(0, $01, $09, 1, 0, 2, 0, $149)
    %spritemapEntry(0, $1F9, $09, 1, 0, 2, 0, $148)
    %spritemapEntry(1, $1FC, $FF, 0, 1, 2, 0, $107)
    %spritemapEntry(0, $03, $0B, 1, 0, 2, 0, $149)
    %spritemapEntry(0, $1FB, $0B, 1, 0, 2, 0, $148)
    %spritemapEntry(0, $1FA, $13, 0, 1, 2, 0, $144)
    %spritemapEntry(0, $1FA, $0B, 0, 1, 2, 0, $143)

Spitemaps_PirateWall_D:
    dw $0010
    %spritemapEntry(0, $08, $FC, 0, 1, 2, 0, $14D)
    %spritemapEntry(0, $09, $F4, 0, 1, 2, 0, $13D)
    %spritemapEntry(0, $0A, $EC, 0, 1, 2, 0, $12D)
    %spritemapEntry(0, $0B, $FD, 0, 1, 2, 0, $14D)
    %spritemapEntry(0, $0C, $F5, 0, 1, 2, 0, $13D)
    %spritemapEntry(0, $0D, $ED, 0, 1, 2, 0, $12D)
    %spritemapEntry(1, $1FD, $F3, 0, 1, 2, 0, $100)
    %spritemapEntry(1, $1F9, $F0, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $00, $EA, 0, 1, 2, 0, $10E)
    %spritemapEntry(0, $1FA, $0B, 0, 1, 2, 0, $144)
    %spritemapEntry(0, $1FA, $03, 0, 1, 2, 0, $143)
    %spritemapEntry(0, $1FE, $09, 0, 1, 2, 0, $146)
    %spritemapEntry(0, $06, $09, 0, 1, 2, 0, $145)
    %spritemapEntry(0, $1FB, $FE, 0, 1, 2, 0, $149)
    %spritemapEntry(0, $03, $FD, 0, 1, 2, 0, $148)
    %spritemapEntry(1, $1FD, $FF, 0, 1, 2, 0, $122)

Spitemaps_PirateWall_E:
    dw $0008
    %spritemapEntry(0, $09, $FD, 0, 1, 2, 0, $14D)
    %spritemapEntry(0, $09, $F5, 0, 1, 2, 0, $13D)
    %spritemapEntry(0, $09, $ED, 0, 1, 2, 0, $12D)
    %spritemapEntry(1, $1FC, $F3, 0, 1, 2, 0, $100)
    %spritemapEntry(1, $1F8, $F0, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $1FF, $EA, 0, 1, 2, 0, $10E)
    %spritemapEntry(0, $09, $E6, 0, 1, 2, 0, $13D)
    %spritemapEntry(0, $09, $DE, 0, 1, 2, 0, $12D)

Spitemaps_PirateWall_F:
    dw $0009
    %spritemapEntry(0, $1FC, $F3, 0, 1, 2, 0, $14F)
    %spritemapEntry(0, $04, $F4, 0, 1, 2, 0, $14E)
    %spritemapEntry(0, $09, $F9, 0, 1, 2, 0, $14D)
    %spritemapEntry(0, $09, $F1, 0, 1, 2, 0, $13D)
    %spritemapEntry(0, $09, $E9, 0, 1, 2, 0, $12D)
    %spritemapEntry(1, $1F8, $F0, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $1FF, $EA, 0, 1, 2, 0, $10E)
    %spritemapEntry(0, $09, $EA, 0, 1, 2, 0, $13D)
    %spritemapEntry(0, $09, $E2, 0, 1, 2, 0, $12D)

Spitemaps_PirateWall_10:
    dw $0008
    %spritemapEntry(0, $09, $F3, 0, 1, 2, 0, $14D)
    %spritemapEntry(0, $09, $EB, 0, 1, 2, 0, $13D)
    %spritemapEntry(0, $09, $E3, 0, 1, 2, 0, $12D)
    %spritemapEntry(0, $1FD, $F3, 0, 1, 2, 0, $14F)
    %spritemapEntry(0, $05, $F3, 0, 1, 2, 0, $14E)
    %spritemapEntry(1, $1F8, $F0, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $1FF, $EA, 0, 1, 2, 0, $10E)
    %spritemapEntry(0, $09, $E1, 0, 1, 2, 0, $12D)

Spitemaps_PirateWall_11:
    dw $000A
    %spritemapEntry(0, $1FD, $F1, 0, 1, 2, 0, $14F)
    %spritemapEntry(0, $05, $F0, 0, 1, 2, 0, $14E)
    %spritemapEntry(0, $09, $ED, 0, 1, 2, 0, $14D)
    %spritemapEntry(0, $09, $E5, 0, 1, 2, 0, $13D)
    %spritemapEntry(0, $09, $DD, 0, 1, 2, 0, $12D)
    %spritemapEntry(1, $1F8, $F0, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $1FF, $EA, 0, 1, 2, 0, $10E)
    %spritemapEntry(0, $09, $EF, 0, 1, 2, 0, $13D)
    %spritemapEntry(0, $09, $F7, 0, 1, 2, 0, $14D)
    %spritemapEntry(1, $1FF, $F0, 0, 1, 2, 0, $100)

Spitemaps_PirateWall_12:
    dw $0009
    %spritemapEntry(1, $1FC, $EB, 1, 0, 2, 0, $105)
    %spritemapEntry(0, $09, $EB, 0, 1, 2, 0, $14D)
    %spritemapEntry(0, $09, $E3, 0, 1, 2, 0, $13D)
    %spritemapEntry(0, $09, $DB, 0, 1, 2, 0, $12D)
    %spritemapEntry(1, $1F8, $F0, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $1FF, $EA, 0, 1, 2, 0, $10E)
    %spritemapEntry(0, $09, $F1, 0, 1, 2, 0, $13D)
    %spritemapEntry(0, $09, $F9, 0, 1, 2, 0, $14D)
    %spritemapEntry(1, $1FF, $F2, 0, 1, 2, 0, $100)

Spitemaps_PirateWall_13:
    dw $000A
    %spritemapEntry(0, $04, $19, 0, 1, 2, 0, $146)
    %spritemapEntry(0, $01, $13, 0, 1, 2, 0, $119)
    %spritemapEntry(0, $01, $0B, 0, 1, 2, 0, $109)
    %spritemapEntry(1, $1F7, $FE, 0, 1, 2, 0, $107)
    %spritemapEntry(0, $0C, $19, 0, 1, 2, 0, $145)
    %spritemapEntry(0, $03, $FE, 0, 1, 2, 0, $131)
    %spritemapEntry(0, $03, $F6, 0, 1, 2, 0, $121)
    %spritemapEntry(1, $1FA, $F5, 1, 0, 2, 0, $10C)
    %spritemapEntry(0, $04, $05, 0, 1, 2, 0, $146)
    %spritemapEntry(0, $0C, $05, 0, 1, 2, 0, $145)

Spitemaps_PirateWall_14:
    dw $000C
    %spritemapEntry(0, $1F8, $FD, 0, 1, 2, 0, $149)
    %spritemapEntry(0, $00, $FF, 0, 1, 2, 0, $148)
    %spritemapEntry(0, $04, $14, 0, 1, 2, 0, $146)
    %spritemapEntry(0, $0C, $14, 0, 1, 2, 0, $145)
    %spritemapEntry(0, $1F8, $FB, 0, 1, 2, 0, $149)
    %spritemapEntry(0, $00, $F9, 0, 1, 2, 0, $148)
    %spritemapEntry(0, $03, $0D, 0, 1, 2, 0, $11A)
    %spritemapEntry(0, $03, $05, 0, 1, 2, 0, $10A)
    %spritemapEntry(0, $03, $02, 0, 1, 2, 0, $131)
    %spritemapEntry(0, $03, $FA, 0, 1, 2, 0, $121)
    %spritemapEntry(0, $04, $09, 0, 1, 2, 0, $146)
    %spritemapEntry(0, $0C, $09, 0, 1, 2, 0, $145)

Spitemaps_PirateWall_15:
    dw $000C
    %spritemapEntry(0, $1F8, $F9, 0, 1, 2, 0, $149)
    %spritemapEntry(0, $00, $FB, 0, 1, 2, 0, $148)
    %spritemapEntry(0, $04, $10, 0, 1, 2, 0, $146)
    %spritemapEntry(0, $0C, $10, 0, 1, 2, 0, $145)
    %spritemapEntry(0, $1F8, $FB, 0, 1, 2, 0, $149)
    %spritemapEntry(0, $00, $F9, 0, 1, 2, 0, $148)
    %spritemapEntry(0, $03, $09, 0, 1, 2, 0, $11A)
    %spritemapEntry(0, $03, $01, 0, 1, 2, 0, $10A)
    %spritemapEntry(0, $03, $06, 0, 1, 2, 0, $131)
    %spritemapEntry(0, $03, $FE, 0, 1, 2, 0, $121)
    %spritemapEntry(0, $04, $0D, 0, 1, 2, 0, $146)
    %spritemapEntry(0, $0C, $0D, 0, 1, 2, 0, $145)

Spitemaps_PirateWall_16:
    dw $000C
    %spritemapEntry(0, $05, $03, 0, 1, 2, 0, $131)
    %spritemapEntry(0, $05, $FB, 0, 1, 2, 0, $121)
    %spritemapEntry(0, $04, $0A, 0, 1, 2, 0, $146)
    %spritemapEntry(0, $0C, $0A, 0, 1, 2, 0, $145)
    %spritemapEntry(0, $1F8, $FC, 0, 1, 2, 0, $149)
    %spritemapEntry(0, $00, $FA, 0, 1, 2, 0, $148)
    %spritemapEntry(0, $1F8, $FE, 0, 1, 2, 0, $149)
    %spritemapEntry(0, $00, $00, 0, 1, 2, 0, $148)
    %spritemapEntry(0, $04, $12, 0, 1, 2, 0, $146)
    %spritemapEntry(0, $0C, $12, 0, 1, 2, 0, $145)
    %spritemapEntry(0, $03, $0C, 0, 1, 2, 0, $11A)
    %spritemapEntry(0, $03, $04, 0, 1, 2, 0, $10A)

Spitemaps_PirateWall_17:
    dw $000A
    %spritemapEntry(0, $03, $00, 0, 1, 2, 0, $131)
    %spritemapEntry(0, $03, $F8, 0, 1, 2, 0, $121)
    %spritemapEntry(1, $1F9, $F6, 1, 0, 2, 0, $10C)
    %spritemapEntry(0, $04, $07, 0, 1, 2, 0, $146)
    %spritemapEntry(0, $0C, $07, 0, 1, 2, 0, $145)
    %spritemapEntry(0, $04, $16, 0, 1, 2, 0, $146)
    %spritemapEntry(0, $02, $10, 0, 1, 2, 0, $119)
    %spritemapEntry(0, $02, $08, 0, 1, 2, 0, $109)
    %spritemapEntry(1, $1F8, $FD, 0, 1, 2, 0, $107)
    %spritemapEntry(0, $0C, $16, 0, 1, 2, 0, $145)

Spitemaps_PirateWall_18:
    dw $000D
    %spritemapEntry(1, $1F7, $FC, 0, 1, 2, 0, $127)
    %spritemapEntry(1, $1EF, $FC, 0, 1, 2, 0, $128)
    %spritemapEntry(0, $07, $F7, 0, 1, 2, 0, $14D)
    %spritemapEntry(0, $07, $EF, 0, 1, 2, 0, $13D)
    %spritemapEntry(0, $07, $E7, 0, 1, 2, 0, $12D)
    %spritemapEntry(0, $1F2, $FB, 0, 0, 2, 0, $112)
    %spritemapEntry(0, $1F2, $F3, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F6, $EB, 0, 1, 2, 0, $10E)
    %spritemapEntry(0, $1F5, $F9, 0, 0, 2, 0, $142)
    %spritemapEntry(0, $1FD, $F1, 0, 0, 2, 0, $141)
    %spritemapEntry(0, $1F5, $F1, 0, 0, 2, 0, $140)
    %spritemapEntry(0, $1FD, $F9, 0, 0, 2, 0, $147)
    %spritemapEntry(1, $1FF, $F0, 0, 1, 2, 0, $100)

Spitemaps_PirateWall_19:
    dw $000E
    %spritemapEntry(0, $08, $F7, 0, 1, 2, 0, $14D)
    %spritemapEntry(0, $08, $EF, 0, 1, 2, 0, $13D)
    %spritemapEntry(0, $08, $E7, 0, 1, 2, 0, $12D)
    %spritemapEntry(1, $1F2, $EB, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $1FF, $F0, 0, 1, 2, 0, $100)
    %spritemapEntry(0, $1F5, $F9, 0, 0, 2, 0, $142)
    %spritemapEntry(0, $1FD, $F1, 0, 0, 2, 0, $141)
    %spritemapEntry(0, $1F5, $F1, 0, 0, 2, 0, $140)
    %spritemapEntry(0, $1FD, $F9, 0, 0, 2, 0, $147)
    %spritemapEntry(0, $1F0, $FD, 1, 1, 2, 0, $14D)
    %spritemapEntry(0, $1F0, $05, 1, 1, 2, 0, $13D)
    %spritemapEntry(0, $1F0, $0D, 1, 1, 2, 0, $12D)
    %spritemapEntry(0, $1F2, $FB, 0, 0, 2, 0, $112)
    %spritemapEntry(0, $1F2, $F3, 0, 0, 2, 0, $102)

Spitemaps_PirateWall_1A:
    dw $0014
    %spritemapEntry(0, $1F8, $F2, 0, 0, 2, 0, $14F)
    %spritemapEntry(0, $1F0, $F1, 0, 0, 2, 0, $14E)
    %spritemapEntry(0, $1EC, $EE, 0, 0, 2, 0, $14D)
    %spritemapEntry(0, $1EC, $E6, 0, 0, 2, 0, $13D)
    %spritemapEntry(0, $1EC, $DE, 0, 0, 2, 0, $12D)
    %spritemapEntry(1, $1F5, $F1, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1EE, $EB, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $1EC, $F0, 0, 0, 2, 0, $13D)
    %spritemapEntry(0, $1EC, $F8, 0, 0, 2, 0, $14D)
    %spritemapEntry(1, $1EE, $F1, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $1F7, $FF, 0, 0, 2, 0, $107)
    %spritemapEntry(0, $04, $11, 0, 0, 2, 0, $144)
    %spritemapEntry(0, $04, $09, 0, 0, 2, 0, $143)
    %spritemapEntry(0, $1F7, $09, 1, 1, 2, 0, $149)
    %spritemapEntry(0, $1FF, $09, 1, 1, 2, 0, $148)
    %spritemapEntry(1, $1F4, $FF, 0, 0, 2, 0, $107)
    %spritemapEntry(0, $1F5, $0B, 1, 1, 2, 0, $149)
    %spritemapEntry(0, $1FD, $0B, 1, 1, 2, 0, $148)
    %spritemapEntry(0, $1FE, $13, 0, 0, 2, 0, $144)
    %spritemapEntry(0, $1FE, $0B, 0, 0, 2, 0, $143)

Spitemaps_PirateWall_1B:
    dw $0010
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 0, $14D)
    %spritemapEntry(0, $1EF, $F4, 0, 0, 2, 0, $13D)
    %spritemapEntry(0, $1EE, $EC, 0, 0, 2, 0, $12D)
    %spritemapEntry(0, $1ED, $FD, 0, 0, 2, 0, $14D)
    %spritemapEntry(0, $1EC, $F5, 0, 0, 2, 0, $13D)
    %spritemapEntry(0, $1EB, $ED, 0, 0, 2, 0, $12D)
    %spritemapEntry(1, $1F3, $F3, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $1F7, $F0, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1F0, $EA, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $1FE, $0B, 0, 0, 2, 0, $144)
    %spritemapEntry(0, $1FE, $03, 0, 0, 2, 0, $143)
    %spritemapEntry(0, $1FA, $09, 0, 0, 2, 0, $146)
    %spritemapEntry(0, $1F2, $09, 0, 0, 2, 0, $145)
    %spritemapEntry(0, $1FD, $FE, 0, 0, 2, 0, $149)
    %spritemapEntry(0, $1F5, $FD, 0, 0, 2, 0, $148)
    %spritemapEntry(1, $1F3, $FF, 0, 0, 2, 0, $122)

Spritemaps_PirateWalking_1:
    dw $000A
    %spritemapEntry(0, $1F5, $13, 0, 0, 2, 0, $130)
    %spritemapEntry(0, $1F4, $0B, 0, 0, 2, 0, $120)
    %spritemapEntry(0, $1F2, $18, 0, 0, 2, 0, $136)
    %spritemapEntry(0, $1EB, $18, 0, 0, 2, 0, $135)
    %spritemapEntry(1, $1F5, $00, 0, 0, 2, 0, $107)
    %spritemapEntry(0, $06, $18, 0, 0, 2, 0, $144)
    %spritemapEntry(0, $06, $10, 0, 0, 2, 0, $143)
    %spritemapEntry(1, $1FE, $0B, 0, 0, 2, 0, $122)
    %spritemapEntry(0, $1FD, $08, 0, 0, 2, 0, $11B)
    %spritemapEntry(0, $1FD, $00, 0, 0, 2, 0, $10B)

Spritemaps_PirateWalking_2:
    dw $000B
    %spritemapEntry(0, $1F9, $12, 0, 0, 2, 0, $131)
    %spritemapEntry(0, $1F9, $0A, 0, 0, 2, 0, $121)
    %spritemapEntry(0, $1F7, $18, 0, 0, 2, 0, $126)
    %spritemapEntry(0, $1EF, $18, 0, 0, 2, 0, $125)
    %spritemapEntry(0, $1FA, $06, 0, 0, 2, 0, $119)
    %spritemapEntry(0, $1FA, $FE, 0, 0, 2, 0, $109)
    %spritemapEntry(0, $05, $17, 0, 0, 2, 0, $144)
    %spritemapEntry(0, $05, $0F, 0, 0, 2, 0, $143)
    %spritemapEntry(1, $1FA, $08, 0, 0, 2, 0, $122)
    %spritemapEntry(0, $1FB, $06, 0, 0, 2, 0, $11A)
    %spritemapEntry(0, $1FB, $FE, 0, 0, 2, 0, $10A)

Spritemaps_PirateWalking_3:
    dw $000C
    %spritemapEntry(0, $1FD, $18, 0, 0, 2, 0, $126)
    %spritemapEntry(0, $1F5, $18, 0, 0, 2, 0, $125)
    %spritemapEntry(0, $1FE, $14, 0, 0, 2, 0, $131)
    %spritemapEntry(0, $1FE, $0C, 0, 0, 2, 0, $121)
    %spritemapEntry(0, $1FC, $06, 0, 0, 2, 0, $11A)
    %spritemapEntry(0, $1FC, $FE, 0, 0, 2, 0, $10A)
    %spritemapEntry(0, $04, $18, 0, 0, 2, 0, $144)
    %spritemapEntry(0, $04, $10, 0, 0, 2, 0, $143)
    %spritemapEntry(0, $1FD, $10, 0, 0, 2, 0, $11B)
    %spritemapEntry(0, $1FD, $08, 0, 0, 2, 0, $10B)
    %spritemapEntry(0, $1FB, $04, 0, 0, 2, 0, $119)
    %spritemapEntry(0, $1FB, $FC, 0, 0, 2, 0, $109)

Spritemaps_PirateWalking_4:
    dw $000B
    %spritemapEntry(0, $1FA, $16, 0, 0, 2, 0, $126)
    %spritemapEntry(0, $1F2, $16, 0, 0, 2, 0, $125)
    %spritemapEntry(0, $04, $18, 0, 0, 2, 0, $146)
    %spritemapEntry(0, $1FC, $18, 0, 0, 2, 0, $145)
    %spritemapEntry(0, $01, $13, 0, 0, 2, 0, $134)
    %spritemapEntry(0, $01, $0B, 0, 0, 2, 0, $124)
    %spritemapEntry(0, $1FC, $07, 0, 0, 2, 0, $11B)
    %spritemapEntry(0, $1FD, $FF, 0, 0, 2, 0, $10B)
    %spritemapEntry(1, $1F4, $00, 0, 0, 2, 0, $107)
    %spritemapEntry(0, $1F8, $12, 0, 0, 2, 0, $134)
    %spritemapEntry(0, $1F8, $0A, 0, 0, 2, 0, $124)

Spritemaps_PirateWalking_5:
    dw $000A
    %spritemapEntry(0, $1FA, $00, 0, 0, 2, 0, $10A)
    %spritemapEntry(0, $1F2, $18, 0, 0, 2, 0, $136)
    %spritemapEntry(0, $1EB, $18, 0, 0, 2, 0, $135)
    %spritemapEntry(0, $06, $18, 0, 0, 2, 0, $144)
    %spritemapEntry(0, $06, $10, 0, 0, 2, 0, $143)
    %spritemapEntry(1, $1FB, $0A, 0, 0, 2, 0, $122)
    %spritemapEntry(0, $1F9, $08, 0, 0, 2, 0, $11B)
    %spritemapEntry(0, $1F4, $13, 0, 0, 2, 0, $130)
    %spritemapEntry(0, $1F3, $0B, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $1F4, $00, 0, 0, 2, 0, $107)

Spritemaps_PirateWalking_6:
    dw $000B
    %spritemapEntry(0, $1F7, $13, 0, 0, 2, 0, $131)
    %spritemapEntry(0, $1F7, $0B, 0, 0, 2, 0, $121)
    %spritemapEntry(0, $05, $17, 0, 0, 2, 0, $144)
    %spritemapEntry(0, $05, $0F, 0, 0, 2, 0, $143)
    %spritemapEntry(1, $1FA, $08, 0, 0, 2, 0, $122)
    %spritemapEntry(0, $1FB, $06, 0, 0, 2, 0, $11A)
    %spritemapEntry(0, $1FB, $FE, 0, 0, 2, 0, $10A)
    %spritemapEntry(0, $1F6, $18, 0, 0, 2, 0, $126)
    %spritemapEntry(0, $1EE, $18, 0, 0, 2, 0, $125)
    %spritemapEntry(0, $1F8, $07, 0, 0, 2, 0, $119)
    %spritemapEntry(0, $1F8, $FF, 0, 0, 2, 0, $109)

Spritemaps_PirateWalking_7:
    dw $000C
    %spritemapEntry(0, $1FB, $06, 0, 0, 2, 0, $119)
    %spritemapEntry(0, $1FB, $FE, 0, 0, 2, 0, $109)
    %spritemapEntry(0, $02, $19, 0, 0, 2, 0, $144)
    %spritemapEntry(0, $02, $11, 0, 0, 2, 0, $143)
    %spritemapEntry(0, $1FC, $11, 0, 0, 2, 0, $11B)
    %spritemapEntry(0, $1FC, $09, 0, 0, 2, 0, $10B)
    %spritemapEntry(0, $1FD, $18, 0, 0, 2, 0, $126)
    %spritemapEntry(0, $1F5, $18, 0, 0, 2, 0, $125)
    %spritemapEntry(0, $1FE, $15, 0, 0, 2, 0, $131)
    %spritemapEntry(0, $1FE, $0D, 0, 0, 2, 0, $121)
    %spritemapEntry(0, $1FC, $08, 0, 0, 2, 0, $11A)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 0, $10A)

Spritemaps_PirateWalking_8:
    dw $000B
    %spritemapEntry(0, $1FA, $16, 0, 0, 2, 0, $126)
    %spritemapEntry(0, $1F2, $16, 0, 0, 2, 0, $125)
    %spritemapEntry(1, $1F6, $00, 0, 0, 2, 0, $107)
    %spritemapEntry(0, $1F8, $12, 0, 0, 2, 0, $134)
    %spritemapEntry(0, $1F8, $0A, 0, 0, 2, 0, $124)
    %spritemapEntry(0, $04, $18, 0, 0, 2, 0, $146)
    %spritemapEntry(0, $1FC, $18, 0, 0, 2, 0, $145)
    %spritemapEntry(0, $01, $13, 0, 0, 2, 0, $134)
    %spritemapEntry(0, $01, $0B, 0, 0, 2, 0, $124)
    %spritemapEntry(0, $1FC, $07, 0, 0, 2, 0, $11B)
    %spritemapEntry(0, $1FD, $FF, 0, 0, 2, 0, $10B)

Spitemaps_PirateWalking_9_Ninja_0:
    dw $000A
    %spritemapEntry(0, $1F8, $11, 0, 0, 2, 0, $134)
    %spritemapEntry(0, $1FC, $FE, 0, 0, 2, 0, $109)
    %spritemapEntry(0, $1FC, $06, 0, 0, 2, 0, $119)
    %spritemapEntry(0, $03, $15, 0, 0, 2, 0, $126)
    %spritemapEntry(0, $1FC, $15, 0, 0, 2, 0, $125)
    %spritemapEntry(1, $1F5, $FF, 0, 0, 2, 0, $107)
    %spritemapEntry(1, $1FB, $0A, 0, 0, 2, 0, $122)
    %spritemapEntry(0, $1FA, $15, 0, 0, 2, 0, $126)
    %spritemapEntry(0, $1F2, $15, 0, 0, 2, 0, $125)
    %spritemapEntry(0, $1F8, $09, 0, 0, 2, 0, $124)

Spitemaps_PirateWalking_A_Ninja_1:
    dw $000A
    %spritemapEntry(1, $1F7, $FF, 0, 0, 2, 0, $107)
    %spritemapEntry(0, $04, $11, 0, 0, 2, 0, $144)
    %spritemapEntry(0, $04, $09, 0, 0, 2, 0, $143)
    %spritemapEntry(0, $1F7, $09, 1, 1, 2, 0, $149)
    %spritemapEntry(0, $1FF, $09, 1, 1, 2, 0, $148)
    %spritemapEntry(1, $1F4, $FF, 0, 0, 2, 0, $107)
    %spritemapEntry(0, $1F5, $0B, 1, 1, 2, 0, $149)
    %spritemapEntry(0, $1FD, $0B, 1, 1, 2, 0, $148)
    %spritemapEntry(0, $1FE, $13, 0, 0, 2, 0, $144)
    %spritemapEntry(0, $1FE, $0B, 0, 0, 2, 0, $143)

Spitemaps_PirateWalking_B_Ninja_2:
    dw $000A
    %spritemapEntry(0, $1FC, $08, 0, 0, 2, 0, $119)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 0, $109)
    %spritemapEntry(1, $1F4, $01, 0, 0, 2, 0, $107)
    %spritemapEntry(0, $1F6, $09, 0, 0, 2, 0, $124)
    %spritemapEntry(0, $1F7, $11, 0, 0, 2, 0, $134)
    %spritemapEntry(0, $02, $15, 0, 0, 2, 0, $126)
    %spritemapEntry(0, $1FC, $15, 0, 0, 2, 0, $125)
    %spritemapEntry(1, $1FA, $0B, 0, 0, 2, 0, $122)
    %spritemapEntry(0, $1F9, $15, 0, 0, 2, 0, $126)
    %spritemapEntry(0, $1F2, $15, 0, 0, 2, 0, $125)

Spitemaps_PirateWalking_C:
    dw $0005
    %spritemapEntry(1, $1EA, $00, 0, 0, 2, 0, $127)
    %spritemapEntry(1, $1F2, $00, 0, 0, 2, 0, $128)
    %spritemapEntry(0, $1FB, $FB, 0, 0, 2, 0, $113)
    %spritemapEntry(0, $1FB, $F3, 0, 0, 2, 0, $103)
    %spritemapEntry(1, $1F8, $F0, 0, 0, 2, 0, $12E)

Spitemaps_PirateWalking_D:
    dw $0005
    %spritemapEntry(1, $06, $00, 0, 1, 2, 0, $127)
    %spritemapEntry(1, $1FE, $00, 0, 1, 2, 0, $128)
    %spritemapEntry(0, $1FD, $FB, 0, 1, 2, 0, $113)
    %spritemapEntry(0, $1FD, $F3, 0, 1, 2, 0, $103)
    %spritemapEntry(1, $1F8, $F0, 0, 1, 2, 0, $12E)

Spitemaps_PirateWalking_E:
    dw $000A
    %spritemapEntry(0, $03, $13, 0, 1, 2, 0, $130)
    %spritemapEntry(0, $04, $0B, 0, 1, 2, 0, $120)
    %spritemapEntry(0, $06, $18, 0, 1, 2, 0, $136)
    %spritemapEntry(0, $0D, $18, 0, 1, 2, 0, $135)
    %spritemapEntry(1, $1FB, $00, 0, 1, 2, 0, $107)
    %spritemapEntry(0, $1F2, $18, 0, 1, 2, 0, $144)
    %spritemapEntry(0, $1F2, $10, 0, 1, 2, 0, $143)
    %spritemapEntry(1, $1F2, $0B, 0, 1, 2, 0, $122)
    %spritemapEntry(0, $1FB, $08, 0, 1, 2, 0, $11B)
    %spritemapEntry(0, $1FB, $00, 0, 1, 2, 0, $10B)

Spitemaps_PirateWalking_F:
    dw $000B
    %spritemapEntry(0, $1FF, $12, 0, 1, 2, 0, $131)
    %spritemapEntry(0, $1FF, $0A, 0, 1, 2, 0, $121)
    %spritemapEntry(0, $01, $18, 0, 1, 2, 0, $126)
    %spritemapEntry(0, $09, $18, 0, 1, 2, 0, $125)
    %spritemapEntry(0, $1FE, $06, 0, 1, 2, 0, $119)
    %spritemapEntry(0, $1FE, $FE, 0, 1, 2, 0, $109)
    %spritemapEntry(0, $1F3, $17, 0, 1, 2, 0, $144)
    %spritemapEntry(0, $1F3, $0F, 0, 1, 2, 0, $143)
    %spritemapEntry(1, $1F6, $08, 0, 1, 2, 0, $122)
    %spritemapEntry(0, $1FD, $06, 0, 1, 2, 0, $11A)
    %spritemapEntry(0, $1FD, $FE, 0, 1, 2, 0, $10A)

Spitemaps_PirateWalking_10:
    dw $000C
    %spritemapEntry(0, $1FB, $18, 0, 1, 2, 0, $126)
    %spritemapEntry(0, $03, $18, 0, 1, 2, 0, $125)
    %spritemapEntry(0, $1FA, $14, 0, 1, 2, 0, $131)
    %spritemapEntry(0, $1FA, $0C, 0, 1, 2, 0, $121)
    %spritemapEntry(0, $1FC, $06, 0, 1, 2, 0, $11A)
    %spritemapEntry(0, $1FC, $FE, 0, 1, 2, 0, $10A)
    %spritemapEntry(0, $1F4, $18, 0, 1, 2, 0, $144)
    %spritemapEntry(0, $1F4, $10, 0, 1, 2, 0, $143)
    %spritemapEntry(0, $1FB, $10, 0, 1, 2, 0, $11B)
    %spritemapEntry(0, $1FB, $08, 0, 1, 2, 0, $10B)
    %spritemapEntry(0, $1FD, $04, 0, 1, 2, 0, $119)
    %spritemapEntry(0, $1FD, $FC, 0, 1, 2, 0, $109)

Spitemaps_PirateWalking_11:
    dw $000B
    %spritemapEntry(0, $1FE, $16, 0, 1, 2, 0, $126)
    %spritemapEntry(0, $06, $16, 0, 1, 2, 0, $125)
    %spritemapEntry(0, $1F4, $18, 0, 1, 2, 0, $146)
    %spritemapEntry(0, $1FC, $18, 0, 1, 2, 0, $145)
    %spritemapEntry(0, $1F7, $13, 0, 1, 2, 0, $134)
    %spritemapEntry(0, $1F7, $0B, 0, 1, 2, 0, $124)
    %spritemapEntry(0, $1FC, $07, 0, 1, 2, 0, $11B)
    %spritemapEntry(0, $1FB, $FF, 0, 1, 2, 0, $10B)
    %spritemapEntry(1, $1FC, $00, 0, 1, 2, 0, $107)
    %spritemapEntry(0, $00, $12, 0, 1, 2, 0, $134)
    %spritemapEntry(0, $00, $0A, 0, 1, 2, 0, $124)

Spitemaps_PirateWalking_12:
    dw $000A
    %spritemapEntry(0, $1FE, $00, 0, 1, 2, 0, $10A)
    %spritemapEntry(0, $06, $18, 0, 1, 2, 0, $136)
    %spritemapEntry(0, $0D, $18, 0, 1, 2, 0, $135)
    %spritemapEntry(0, $1F2, $18, 0, 1, 2, 0, $144)
    %spritemapEntry(0, $1F2, $10, 0, 1, 2, 0, $143)
    %spritemapEntry(1, $1F5, $0A, 0, 1, 2, 0, $122)
    %spritemapEntry(0, $1FF, $08, 0, 1, 2, 0, $11B)
    %spritemapEntry(0, $04, $13, 0, 1, 2, 0, $130)
    %spritemapEntry(0, $05, $0B, 0, 1, 2, 0, $120)
    %spritemapEntry(1, $1FC, $00, 0, 1, 2, 0, $107)

Spitemaps_PirateWalking_13:
    dw $000B
    %spritemapEntry(0, $01, $13, 0, 1, 2, 0, $131)
    %spritemapEntry(0, $01, $0B, 0, 1, 2, 0, $121)
    %spritemapEntry(0, $1F3, $17, 0, 1, 2, 0, $144)
    %spritemapEntry(0, $1F3, $0F, 0, 1, 2, 0, $143)
    %spritemapEntry(1, $1F6, $08, 0, 1, 2, 0, $122)
    %spritemapEntry(0, $1FD, $06, 0, 1, 2, 0, $11A)
    %spritemapEntry(0, $1FD, $FE, 0, 1, 2, 0, $10A)
    %spritemapEntry(0, $02, $18, 0, 1, 2, 0, $126)
    %spritemapEntry(0, $0A, $18, 0, 1, 2, 0, $125)
    %spritemapEntry(0, $00, $07, 0, 1, 2, 0, $119)
    %spritemapEntry(0, $00, $FF, 0, 1, 2, 0, $109)

Spitemaps_PirateWalking_14:
    dw $000C
    %spritemapEntry(0, $1FD, $06, 0, 1, 2, 0, $119)
    %spritemapEntry(0, $1FD, $FE, 0, 1, 2, 0, $109)
    %spritemapEntry(0, $1F6, $19, 0, 1, 2, 0, $144)
    %spritemapEntry(0, $1F6, $11, 0, 1, 2, 0, $143)
    %spritemapEntry(0, $1FC, $11, 0, 1, 2, 0, $11B)
    %spritemapEntry(0, $1FC, $09, 0, 1, 2, 0, $10B)
    %spritemapEntry(0, $1FB, $18, 0, 1, 2, 0, $126)
    %spritemapEntry(0, $03, $18, 0, 1, 2, 0, $125)
    %spritemapEntry(0, $1FA, $15, 0, 1, 2, 0, $131)
    %spritemapEntry(0, $1FA, $0D, 0, 1, 2, 0, $121)
    %spritemapEntry(0, $1FC, $08, 0, 1, 2, 0, $11A)
    %spritemapEntry(0, $1FC, $00, 0, 1, 2, 0, $10A)

Spitemaps_PirateWalking_15:
    dw $000B
    %spritemapEntry(0, $1FE, $16, 0, 1, 2, 0, $126)
    %spritemapEntry(0, $06, $16, 0, 1, 2, 0, $125)
    %spritemapEntry(1, $1FA, $00, 0, 1, 2, 0, $107)
    %spritemapEntry(0, $00, $12, 0, 1, 2, 0, $134)
    %spritemapEntry(0, $00, $0A, 0, 1, 2, 0, $124)
    %spritemapEntry(0, $1F4, $18, 0, 1, 2, 0, $146)
    %spritemapEntry(0, $1FC, $18, 0, 1, 2, 0, $145)
    %spritemapEntry(0, $1F7, $13, 0, 1, 2, 0, $134)
    %spritemapEntry(0, $1F7, $0B, 0, 1, 2, 0, $124)
    %spritemapEntry(0, $1FC, $07, 0, 1, 2, 0, $11B)
    %spritemapEntry(0, $1FB, $FF, 0, 1, 2, 0, $10B)

Spitemaps_PirateWalking_16_Ninja_3:
    dw $000A
    %spritemapEntry(0, $00, $11, 0, 1, 2, 0, $134)
    %spritemapEntry(0, $1FC, $FE, 0, 1, 2, 0, $109)
    %spritemapEntry(0, $1FC, $06, 0, 1, 2, 0, $119)
    %spritemapEntry(0, $1F5, $15, 0, 1, 2, 0, $126)
    %spritemapEntry(0, $1FC, $15, 0, 1, 2, 0, $125)
    %spritemapEntry(1, $1FB, $FF, 0, 1, 2, 0, $107)
    %spritemapEntry(1, $1F5, $0A, 0, 1, 2, 0, $122)
    %spritemapEntry(0, $1FE, $15, 0, 1, 2, 0, $126)
    %spritemapEntry(0, $06, $15, 0, 1, 2, 0, $125)
    %spritemapEntry(0, $00, $09, 0, 1, 2, 0, $124)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spitemaps_SpacePirate_B2B474:
    dw $000A
    %spritemapEntry(1, $1F9, $FF, 0, 1, 2, 0, $107)
    %spritemapEntry(0, $1F4, $11, 0, 1, 2, 0, $144)
    %spritemapEntry(0, $1F4, $09, 0, 1, 2, 0, $143)
    %spritemapEntry(0, $01, $09, 1, 0, 2, 0, $149)
    %spritemapEntry(0, $1F9, $09, 1, 0, 2, 0, $148)
    %spritemapEntry(1, $1FC, $FF, 0, 1, 2, 0, $107)
    %spritemapEntry(0, $03, $0B, 1, 0, 2, 0, $149)
    %spritemapEntry(0, $1FB, $0B, 1, 0, 2, 0, $148)
    %spritemapEntry(0, $1FA, $13, 0, 1, 2, 0, $144)
    %spritemapEntry(0, $1FA, $0B, 0, 1, 2, 0, $143)
endif ; !FEATURE_KEEP_UNREFERENCED

Spitemaps_PirateWalking_17_Ninja_4:
    dw $000A
    %spritemapEntry(0, $1FC, $08, 0, 1, 2, 0, $119)
    %spritemapEntry(0, $1FC, $00, 0, 1, 2, 0, $109)
    %spritemapEntry(1, $1FC, $01, 0, 1, 2, 0, $107)
    %spritemapEntry(0, $02, $09, 0, 1, 2, 0, $124)
    %spritemapEntry(0, $01, $11, 0, 1, 2, 0, $134)
    %spritemapEntry(0, $1F6, $15, 0, 1, 2, 0, $126)
    %spritemapEntry(0, $1FC, $15, 0, 1, 2, 0, $125)
    %spritemapEntry(1, $1F6, $0B, 0, 1, 2, 0, $122)
    %spritemapEntry(0, $1FF, $15, 0, 1, 2, 0, $126)
    %spritemapEntry(0, $06, $15, 0, 1, 2, 0, $125)

Spitemaps_PirateWalking_18:
    dw $0004
    %spritemapEntry(0, $00, $00, 0, 1, 2, 0, $151)
    %spritemapEntry(0, $1F8, $00, 0, 0, 2, 0, $151)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 0, $150)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $150)

Spitemaps_PirateWalking_19:
    dw $0004
    %spritemapEntry(0, $00, $00, 0, 1, 2, 0, $153)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 0, $152)
    %spritemapEntry(0, $1F8, $00, 0, 0, 2, 0, $153)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $152)

Spitemaps_PirateWalking_1A:
    dw $0009
    %spritemapEntry(0, $1FB, $FB, 0, 0, 2, 0, $113)
    %spritemapEntry(0, $1FB, $F3, 0, 0, 2, 0, $103)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 0, $13F)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $13E)
    %spritemapEntry(0, $1FF, $F0, 0, 0, 2, 0, $12F)
    %spritemapEntry(0, $1F7, $F0, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1EA, $00, 0, 0, 2, 0, $127)
    %spritemapEntry(1, $1F2, $00, 0, 0, 2, 0, $128)
    %spritemapEntry(1, $1F0, $EB, 0, 0, 2, 0, $10E)

Spitemaps_PirateWalking_1B:
    dw $0009
    %spritemapEntry(0, $1FA, $FB, 0, 0, 2, 0, $113)
    %spritemapEntry(0, $1FA, $F3, 0, 0, 2, 0, $103)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 0, $13F)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $13E)
    %spritemapEntry(0, $1FE, $F0, 0, 0, 2, 0, $12F)
    %spritemapEntry(0, $1F6, $F0, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1E9, $00, 0, 0, 2, 0, $127)
    %spritemapEntry(1, $1F1, $00, 0, 0, 2, 0, $128)
    %spritemapEntry(1, $1EE, $EC, 0, 0, 2, 0, $10E)

Spitemaps_PirateWalking_1C:
    dw $000A
    %spritemapEntry(0, $1F8, $00, 0, 0, 2, 0, $14C)
    %spritemapEntry(0, $1F0, $00, 0, 0, 2, 0, $14B)
    %spritemapEntry(0, $1E8, $00, 0, 0, 2, 0, $14A)
    %spritemapEntry(0, $1F9, $FB, 0, 0, 2, 0, $113)
    %spritemapEntry(0, $1F9, $F3, 0, 0, 2, 0, $103)
    %spritemapEntry(0, $1FF, $F8, 0, 0, 2, 0, $13F)
    %spritemapEntry(0, $1F7, $F8, 0, 0, 2, 0, $13E)
    %spritemapEntry(0, $1FD, $F0, 0, 0, 2, 0, $12F)
    %spritemapEntry(0, $1F5, $F0, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1EC, $ED, 0, 0, 2, 0, $10E)

Spitemaps_PirateWalking_1D:
    dw $0009
    %spritemapEntry(1, $1EE, $F8, 0, 0, 2, 0, $12B)
    %spritemapEntry(1, $1E6, $F8, 0, 0, 2, 0, $12A)
    %spritemapEntry(0, $1F8, $FB, 0, 0, 2, 0, $113)
    %spritemapEntry(0, $1F8, $F3, 0, 0, 2, 0, $103)
    %spritemapEntry(0, $1FF, $F8, 0, 0, 2, 0, $13F)
    %spritemapEntry(0, $1F7, $F8, 0, 0, 2, 0, $13E)
    %spritemapEntry(0, $1FD, $F0, 0, 0, 2, 0, $12F)
    %spritemapEntry(0, $1F5, $F0, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1EB, $EE, 0, 0, 2, 0, $10E)

Spitemaps_PirateWalking_1E:
    dw $0009
    %spritemapEntry(1, $1EE, $FA, 0, 0, 2, 0, $12B)
    %spritemapEntry(1, $1E6, $FA, 0, 0, 2, 0, $12A)
    %spritemapEntry(0, $1F7, $FA, 0, 0, 2, 0, $113)
    %spritemapEntry(0, $1F7, $F3, 0, 0, 2, 0, $103)
    %spritemapEntry(0, $1FE, $F8, 0, 0, 2, 0, $13F)
    %spritemapEntry(0, $1F6, $F8, 0, 0, 2, 0, $13E)
    %spritemapEntry(0, $1FC, $F0, 0, 0, 2, 0, $12F)
    %spritemapEntry(0, $1F4, $F0, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1EA, $EF, 0, 0, 2, 0, $10E)

Spitemaps_PirateWalking_1F:
    dw $0009
    %spritemapEntry(1, $1EE, $FB, 0, 0, 2, 0, $12B)
    %spritemapEntry(1, $1E6, $FB, 0, 0, 2, 0, $12A)
    %spritemapEntry(0, $1F7, $FB, 0, 0, 2, 0, $113)
    %spritemapEntry(0, $1F6, $F4, 0, 0, 2, 0, $103)
    %spritemapEntry(0, $1FE, $F8, 0, 0, 2, 0, $13F)
    %spritemapEntry(0, $1F5, $F9, 0, 0, 2, 0, $13E)
    %spritemapEntry(0, $1FB, $F1, 0, 0, 2, 0, $12F)
    %spritemapEntry(0, $1F3, $F1, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1EA, $F0, 0, 0, 2, 0, $10E)

Spitemaps_PirateWalking_20:
    dw $0009
    %spritemapEntry(0, $1FD, $FB, 0, 1, 2, 0, $113)
    %spritemapEntry(0, $1FD, $F3, 0, 1, 2, 0, $103)
    %spritemapEntry(0, $1F8, $F8, 0, 1, 2, 0, $13F)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 0, $13E)
    %spritemapEntry(0, $1F9, $F0, 0, 1, 2, 0, $12F)
    %spritemapEntry(0, $01, $F0, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $06, $00, 0, 1, 2, 0, $127)
    %spritemapEntry(1, $1FE, $00, 0, 1, 2, 0, $128)
    %spritemapEntry(1, $00, $EB, 0, 1, 2, 0, $10E)

Spitemaps_PirateWalking_21:
    dw $0009
    %spritemapEntry(0, $1FE, $FB, 0, 1, 2, 0, $113)
    %spritemapEntry(0, $1FE, $F3, 0, 1, 2, 0, $103)
    %spritemapEntry(0, $1F8, $F8, 0, 1, 2, 0, $13F)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 0, $13E)
    %spritemapEntry(0, $1FA, $F0, 0, 1, 2, 0, $12F)
    %spritemapEntry(0, $02, $F0, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $07, $00, 0, 1, 2, 0, $127)
    %spritemapEntry(1, $1FF, $00, 0, 1, 2, 0, $128)
    %spritemapEntry(1, $02, $EC, 0, 1, 2, 0, $10E)

Spitemaps_PirateWalking_22:
    dw $000A
    %spritemapEntry(0, $00, $00, 0, 1, 2, 0, $14C)
    %spritemapEntry(0, $08, $00, 0, 1, 2, 0, $14B)
    %spritemapEntry(0, $10, $00, 0, 1, 2, 0, $14A)
    %spritemapEntry(0, $1FF, $FB, 0, 1, 2, 0, $113)
    %spritemapEntry(0, $1FF, $F3, 0, 1, 2, 0, $103)
    %spritemapEntry(0, $1F9, $F8, 0, 1, 2, 0, $13F)
    %spritemapEntry(0, $01, $F8, 0, 1, 2, 0, $13E)
    %spritemapEntry(0, $1FB, $F0, 0, 1, 2, 0, $12F)
    %spritemapEntry(0, $03, $F0, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $04, $ED, 0, 1, 2, 0, $10E)

Spitemaps_PirateWalking_23:
    dw $0009
    %spritemapEntry(1, $02, $F8, 0, 1, 2, 0, $12B)
    %spritemapEntry(1, $0A, $F8, 0, 1, 2, 0, $12A)
    %spritemapEntry(0, $00, $FB, 0, 1, 2, 0, $113)
    %spritemapEntry(0, $00, $F3, 0, 1, 2, 0, $103)
    %spritemapEntry(0, $1F9, $F8, 0, 1, 2, 0, $13F)
    %spritemapEntry(0, $01, $F8, 0, 1, 2, 0, $13E)
    %spritemapEntry(0, $1FB, $F0, 0, 1, 2, 0, $12F)
    %spritemapEntry(0, $03, $F0, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $05, $EE, 0, 1, 2, 0, $10E)

Spitemaps_PirateWalking_24:
    dw $0009
    %spritemapEntry(1, $02, $FA, 0, 1, 2, 0, $12B)
    %spritemapEntry(1, $0A, $FA, 0, 1, 2, 0, $12A)
    %spritemapEntry(0, $01, $FA, 0, 1, 2, 0, $113)
    %spritemapEntry(0, $01, $F3, 0, 1, 2, 0, $103)
    %spritemapEntry(0, $1FA, $F8, 0, 1, 2, 0, $13F)
    %spritemapEntry(0, $02, $F8, 0, 1, 2, 0, $13E)
    %spritemapEntry(0, $1FC, $F0, 0, 1, 2, 0, $12F)
    %spritemapEntry(0, $04, $F0, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $06, $EF, 0, 1, 2, 0, $10E)

Spitemaps_PirateWalking_25:
    dw $0009
    %spritemapEntry(1, $02, $FB, 0, 1, 2, 0, $12B)
    %spritemapEntry(1, $0A, $FB, 0, 1, 2, 0, $12A)
    %spritemapEntry(0, $01, $FB, 0, 1, 2, 0, $113)
    %spritemapEntry(0, $02, $F4, 0, 1, 2, 0, $103)
    %spritemapEntry(0, $1FA, $F8, 0, 1, 2, 0, $13F)
    %spritemapEntry(0, $03, $F9, 0, 1, 2, 0, $13E)
    %spritemapEntry(0, $1FD, $F1, 0, 1, 2, 0, $12F)
    %spritemapEntry(0, $05, $F1, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $06, $F0, 0, 1, 2, 0, $10E)

Spitemaps_PirateNinja_5:
    dw $000A
    %spritemapEntry(1, $1F4, $00, 0, 0, 2, 0, $107)
    %spritemapEntry(0, $1FD, $08, 0, 0, 2, 0, $11B)
    %spritemapEntry(0, $1FD, $00, 0, 0, 2, 0, $10B)
    %spritemapEntry(0, $1ED, $16, 0, 0, 2, 0, $136)
    %spritemapEntry(1, $00, $08, 0, 0, 2, 0, $17E)
    %spritemapEntry(0, $1F1, $13, 0, 0, 2, 0, $130)
    %spritemapEntry(0, $1F1, $0B, 0, 0, 2, 0, $120)
    %spritemapEntry(0, $1E6, $16, 0, 0, 2, 0, $135)
    %spritemapEntry(0, $0D, $16, 0, 0, 2, 0, $144)
    %spritemapEntry(0, $0C, $0E, 0, 0, 2, 0, $143)

Spitemaps_PirateNinja_6:
    dw $000C
    %spritemapEntry(0, $0B, $10, 0, 0, 2, 0, $18D)
    %spritemapEntry(0, $0B, $08, 0, 0, 2, 0, $17D)
    %spritemapEntry(0, $08, $09, 0, 0, 2, 0, $16D)
    %spritemapEntry(0, $00, $09, 0, 0, 2, 0, $16C)
    %spritemapEntry(0, $1F9, $12, 0, 0, 2, 0, $131)
    %spritemapEntry(0, $1F9, $0A, 0, 0, 2, 0, $121)
    %spritemapEntry(0, $1F7, $18, 0, 0, 2, 0, $126)
    %spritemapEntry(0, $1EF, $18, 0, 0, 2, 0, $125)
    %spritemapEntry(0, $1FA, $06, 0, 0, 2, 0, $119)
    %spritemapEntry(0, $1FA, $FE, 0, 0, 2, 0, $109)
    %spritemapEntry(0, $1FC, $06, 0, 0, 2, 0, $11A)
    %spritemapEntry(0, $1FC, $FE, 0, 0, 2, 0, $10A)

Spitemaps_PirateNinja_7:
    dw $000C
    %spritemapEntry(0, $1FC, $06, 0, 0, 2, 0, $11A)
    %spritemapEntry(0, $1FC, $FE, 0, 0, 2, 0, $10A)
    %spritemapEntry(0, $1F9, $05, 0, 0, 2, 0, $119)
    %spritemapEntry(0, $1FD, $18, 0, 0, 2, 0, $126)
    %spritemapEntry(0, $1FE, $14, 0, 0, 2, 0, $131)
    %spritemapEntry(0, $1FE, $0C, 0, 0, 2, 0, $121)
    %spritemapEntry(0, $1F9, $FD, 0, 0, 2, 0, $109)
    %spritemapEntry(0, $1F5, $18, 0, 0, 2, 0, $125)
    %spritemapEntry(0, $01, $09, 0, 0, 2, 0, $16F)
    %spritemapEntry(0, $1F9, $09, 0, 0, 2, 0, $16E)
    %spritemapEntry(0, $05, $11, 0, 0, 2, 0, $144)
    %spritemapEntry(0, $05, $09, 0, 0, 2, 0, $143)

Spitemaps_PirateNinja_8:
    dw $000B
    %spritemapEntry(0, $1FA, $14, 0, 0, 2, 0, $146)
    %spritemapEntry(0, $1F2, $14, 0, 0, 2, 0, $145)
    %spritemapEntry(0, $06, $18, 0, 0, 2, 0, $146)
    %spritemapEntry(0, $1FE, $18, 0, 0, 2, 0, $145)
    %spritemapEntry(0, $03, $13, 0, 0, 2, 0, $134)
    %spritemapEntry(0, $03, $0B, 0, 0, 2, 0, $124)
    %spritemapEntry(0, $1FE, $07, 0, 0, 2, 0, $11B)
    %spritemapEntry(0, $1FF, $FF, 0, 0, 2, 0, $10B)
    %spritemapEntry(1, $1F5, $FD, 0, 0, 2, 0, $107)
    %spritemapEntry(0, $1F9, $0F, 0, 0, 2, 0, $134)
    %spritemapEntry(0, $1F9, $07, 0, 0, 2, 0, $124)

Spitemaps_PirateNinja_9:
    dw $000A
    %spritemapEntry(0, $1FC, $08, 0, 0, 2, 0, $11B)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 0, $10A)
    %spritemapEntry(0, $1F0, $12, 0, 0, 2, 0, $130)
    %spritemapEntry(1, $1FF, $08, 0, 0, 2, 0, $17E)
    %spritemapEntry(0, $1EB, $16, 0, 0, 2, 0, $136)
    %spritemapEntry(0, $1E4, $16, 0, 0, 2, 0, $135)
    %spritemapEntry(0, $0D, $16, 0, 0, 2, 0, $144)
    %spritemapEntry(0, $0C, $0E, 0, 0, 2, 0, $143)
    %spritemapEntry(0, $1F0, $0A, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $1F3, $FF, 0, 0, 2, 0, $107)

Spitemaps_PirateNinja_A:
    dw $000C
    %spritemapEntry(0, $0A, $0F, 0, 0, 2, 0, $18D)
    %spritemapEntry(0, $0A, $07, 0, 0, 2, 0, $17D)
    %spritemapEntry(0, $1F5, $18, 0, 0, 2, 0, $126)
    %spritemapEntry(0, $1ED, $18, 0, 0, 2, 0, $125)
    %spritemapEntry(0, $06, $09, 0, 0, 2, 0, $16D)
    %spritemapEntry(0, $1FE, $09, 0, 0, 2, 0, $16C)
    %spritemapEntry(0, $1F6, $13, 0, 0, 2, 0, $131)
    %spritemapEntry(0, $1F7, $0B, 0, 0, 2, 0, $121)
    %spritemapEntry(0, $1FB, $06, 0, 0, 2, 0, $11A)
    %spritemapEntry(0, $1FB, $FE, 0, 0, 2, 0, $10A)
    %spritemapEntry(0, $1F8, $07, 0, 0, 2, 0, $119)
    %spritemapEntry(0, $1F8, $FF, 0, 0, 2, 0, $109)

Spitemaps_PirateNinja_B:
    dw $000C
    %spritemapEntry(0, $07, $12, 0, 0, 2, 0, $144)
    %spritemapEntry(0, $07, $0A, 0, 0, 2, 0, $143)
    %spritemapEntry(0, $02, $0A, 0, 0, 2, 0, $16F)
    %spritemapEntry(0, $1FA, $0A, 0, 0, 2, 0, $16E)
    %spritemapEntry(0, $1FA, $06, 0, 0, 2, 0, $119)
    %spritemapEntry(0, $1FB, $FE, 0, 0, 2, 0, $109)
    %spritemapEntry(0, $1FD, $18, 0, 0, 2, 0, $126)
    %spritemapEntry(0, $1F5, $18, 0, 0, 2, 0, $125)
    %spritemapEntry(0, $1FE, $15, 0, 0, 2, 0, $131)
    %spritemapEntry(0, $1FE, $0D, 0, 0, 2, 0, $121)
    %spritemapEntry(0, $1FC, $08, 0, 0, 2, 0, $11A)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 0, $10A)

Spitemaps_PirateNinja_C:
    dw $000B
    %spritemapEntry(0, $1FA, $14, 0, 0, 2, 0, $146)
    %spritemapEntry(0, $1F2, $14, 0, 0, 2, 0, $145)
    %spritemapEntry(1, $1F6, $FC, 0, 0, 2, 0, $107)
    %spritemapEntry(0, $1F8, $0E, 0, 0, 2, 0, $134)
    %spritemapEntry(0, $1F8, $06, 0, 0, 2, 0, $124)
    %spritemapEntry(0, $04, $18, 0, 0, 2, 0, $146)
    %spritemapEntry(0, $1FC, $18, 0, 0, 2, 0, $145)
    %spritemapEntry(0, $01, $13, 0, 0, 2, 0, $134)
    %spritemapEntry(0, $01, $0B, 0, 0, 2, 0, $124)
    %spritemapEntry(0, $1FC, $07, 0, 0, 2, 0, $11B)
    %spritemapEntry(0, $1FD, $FF, 0, 0, 2, 0, $10B)

Spitemaps_PirateWalking_26_Ninja_D:
    dw $0009
    %spritemapEntry(0, $1FC, $FC, 0, 1, 2, 0, $112)
    %spritemapEntry(0, $1FC, $F4, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $1EC, $01, 0, 0, 2, 0, $127)
    %spritemapEntry(1, $1F4, $01, 0, 0, 2, 0, $128)
    %spritemapEntry(1, $1F8, $F0, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1F1, $EA, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $1F6, $FE, 0, 0, 2, 0, $14C)
    %spritemapEntry(0, $1EE, $FE, 0, 0, 2, 0, $14B)
    %spritemapEntry(0, $1E6, $FE, 0, 0, 2, 0, $14A)

Spitemaps_PirateWalking_27_Ninja_E:
    dw $0009
    %spritemapEntry(1, $1EB, $00, 0, 0, 2, 0, $127)
    %spritemapEntry(1, $1F3, $00, 0, 0, 2, 0, $128)
    %spritemapEntry(0, $1FB, $FB, 0, 0, 2, 0, $113)
    %spritemapEntry(0, $1FA, $F3, 0, 0, 2, 0, $103)
    %spritemapEntry(1, $1F8, $EF, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1F1, $EA, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $1F8, $FD, 0, 0, 2, 0, $14C)
    %spritemapEntry(0, $1F0, $FD, 0, 0, 2, 0, $14B)
    %spritemapEntry(0, $1E8, $FD, 0, 0, 2, 0, $14A)

Spitemaps_PirateWalking_28_Ninja_F:
    dw $0008
    %spritemapEntry(1, $1E9, $FE, 0, 0, 2, 0, $127)
    %spritemapEntry(1, $1F1, $FE, 0, 0, 2, 0, $128)
    %spritemapEntry(0, $1FA, $F8, 0, 0, 2, 0, $113)
    %spritemapEntry(0, $1FA, $F0, 0, 0, 2, 0, $103)
    %spritemapEntry(1, $1F8, $EE, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1F1, $E8, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $1F3, $FC, 0, 0, 2, 0, $14B)
    %spritemapEntry(0, $1EB, $FD, 0, 0, 2, 0, $14A)

Spitemaps_PirateWalking_29_Ninja_10:
    dw $0008
    %spritemapEntry(1, $1E8, $00, 0, 0, 2, 0, $127)
    %spritemapEntry(1, $1F0, $00, 0, 0, 2, 0, $128)
    %spritemapEntry(0, $1FA, $FA, 0, 0, 2, 0, $113)
    %spritemapEntry(0, $1FA, $F2, 0, 0, 2, 0, $103)
    %spritemapEntry(1, $1F8, $EF, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1F1, $E9, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $1F5, $FE, 0, 0, 2, 0, $14B)
    %spritemapEntry(0, $1ED, $FF, 0, 0, 2, 0, $14A)

Spitemaps_PirateNinja_11:
    dw $0007
    %spritemapEntry(0, $1F6, $FC, 0, 0, 2, 0, $14C)
    %spritemapEntry(0, $1EE, $FC, 0, 0, 2, 0, $14B)
    %spritemapEntry(0, $1E6, $FC, 0, 0, 2, 0, $14A)
    %spritemapEntry(0, $1FB, $FA, 0, 0, 2, 0, $112)
    %spritemapEntry(0, $1FB, $F2, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F8, $EF, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1F1, $E9, 0, 0, 2, 0, $10E)

Spitemaps_PirateNinja_12:
    dw $0007
    %spritemapEntry(1, $1F4, $F2, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $1E2, $F3, 0, 0, 2, 0, $12A)
    %spritemapEntry(1, $1EA, $F3, 0, 0, 2, 0, $12B)
    %spritemapEntry(1, $1F8, $EF, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1F1, $E9, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $1F2, $FD, 0, 0, 2, 0, $14B)
    %spritemapEntry(0, $1EA, $FD, 0, 0, 2, 0, $14A)

Spitemaps_PirateNinja_13:
    dw $0009
    %spritemapEntry(0, $1F1, $FD, 0, 0, 2, 0, $14B)
    %spritemapEntry(0, $1E9, $FD, 0, 0, 2, 0, $14A)
    %spritemapEntry(0, $1E0, $E9, 0, 0, 2, 0, $12A)
    %spritemapEntry(1, $1E8, $E9, 0, 0, 2, 0, $12B)
    %spritemapEntry(0, $1FB, $F1, 0, 0, 2, 0, $14F)
    %spritemapEntry(0, $1F3, $F1, 0, 0, 2, 0, $14E)
    %spritemapEntry(1, $1F8, $EF, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1F1, $E9, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $1F6, $FD, 0, 0, 2, 0, $14C)

Spitemaps_PirateNinja_14:
    dw $000A
    %spritemapEntry(0, $1F0, $FD, 0, 0, 2, 0, $14B)
    %spritemapEntry(0, $1E8, $FD, 0, 0, 2, 0, $14A)
    %spritemapEntry(0, $1FA, $E4, 0, 0, 2, 0, $14D)
    %spritemapEntry(0, $1FA, $DC, 0, 0, 2, 0, $13D)
    %spritemapEntry(0, $1FA, $D4, 0, 0, 2, 0, $12D)
    %spritemapEntry(0, $1FB, $E8, 1, 1, 2, 0, $113)
    %spritemapEntry(0, $1FB, $F0, 1, 1, 2, 0, $103)
    %spritemapEntry(1, $1F8, $F0, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1F1, $EA, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $1F6, $FD, 0, 0, 2, 0, $14C)

Spitemaps_PirateNinja_15:
    dw $0014
    %spritemapEntry(0, $1F6, $12, 0, 0, 2, 0, $134)
    %spritemapEntry(0, $1F6, $0A, 0, 0, 2, 0, $124)
    %spritemapEntry(0, $1F7, $15, 0, 0, 2, 0, $126)
    %spritemapEntry(0, $1E2, $F4, 0, 0, 2, 0, $12A)
    %spritemapEntry(1, $1EA, $F4, 0, 0, 2, 0, $12B)
    %spritemapEntry(0, $1F7, $FA, 0, 0, 2, 0, $112)
    %spritemapEntry(0, $1F8, $F2, 0, 0, 2, 0, $102)
    %spritemapEntry(0, $02, $12, 0, 0, 2, 0, $134)
    %spritemapEntry(0, $1FD, $16, 0, 0, 2, 0, $125)
    %spritemapEntry(0, $1FD, $07, 0, 0, 2, 0, $11A)
    %spritemapEntry(0, $1FE, $FF, 0, 0, 2, 0, $10A)
    %spritemapEntry(0, $01, $0A, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $1F6, $F0, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1F0, $EA, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $1EF, $16, 0, 0, 2, 0, $145)
    %spritemapEntry(1, $1F3, $FF, 0, 0, 2, 0, $107)
    %spritemapEntry(0, $1F6, $FE, 0, 0, 2, 0, $14C)
    %spritemapEntry(0, $1EE, $FE, 0, 0, 2, 0, $14B)
    %spritemapEntry(0, $1E6, $FE, 0, 0, 2, 0, $14A)
    %spritemapEntry(0, $05, $15, 0, 0, 2, 0, $126)

Spitemaps_PirateNinja_16:
    dw $0013
    %spritemapEntry(0, $1F7, $08, 0, 0, 2, 0, $124)
    %spritemapEntry(0, $07, $16, 0, 0, 2, 0, $146)
    %spritemapEntry(0, $1FF, $05, 0, 0, 2, 0, $11A)
    %spritemapEntry(0, $1FF, $FD, 0, 0, 2, 0, $10A)
    %spritemapEntry(0, $1E2, $F3, 0, 0, 2, 0, $12A)
    %spritemapEntry(1, $1EA, $F3, 0, 0, 2, 0, $12B)
    %spritemapEntry(1, $1F2, $F1, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $1F6, $EF, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1EF, $EA, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $1F8, $16, 0, 0, 2, 0, $146)
    %spritemapEntry(0, $1F0, $15, 0, 0, 2, 0, $145)
    %spritemapEntry(0, $1FF, $15, 0, 0, 2, 0, $145)
    %spritemapEntry(0, $03, $10, 0, 0, 2, 0, $134)
    %spritemapEntry(0, $02, $08, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $1F4, $FE, 0, 0, 2, 0, $107)
    %spritemapEntry(0, $1F7, $10, 0, 0, 2, 0, $134)
    %spritemapEntry(0, $1F5, $FD, 0, 0, 2, 0, $14C)
    %spritemapEntry(0, $1ED, $FD, 0, 0, 2, 0, $14B)
    %spritemapEntry(0, $1E5, $FD, 0, 0, 2, 0, $14A)

Spitemaps_PirateNinja_17:
    dw $0014
    %spritemapEntry(0, $1F7, $09, 0, 0, 2, 0, $124)
    %spritemapEntry(0, $1F7, $06, 0, 0, 2, 0, $119)
    %spritemapEntry(0, $1F7, $FF, 0, 0, 2, 0, $109)
    %spritemapEntry(0, $1E0, $F5, 0, 0, 2, 0, $12A)
    %spritemapEntry(1, $1E8, $F5, 0, 0, 2, 0, $12B)
    %spritemapEntry(1, $1F1, $F3, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $1F5, $F0, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1EE, $EB, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $1F8, $16, 0, 0, 2, 0, $146)
    %spritemapEntry(0, $1F0, $16, 0, 0, 2, 0, $145)
    %spritemapEntry(0, $06, $16, 0, 0, 2, 0, $146)
    %spritemapEntry(0, $1FE, $16, 0, 0, 2, 0, $145)
    %spritemapEntry(0, $03, $11, 0, 0, 2, 0, $134)
    %spritemapEntry(0, $03, $09, 0, 0, 2, 0, $124)
    %spritemapEntry(0, $1FF, $07, 0, 0, 2, 0, $11B)
    %spritemapEntry(0, $1FF, $FF, 0, 0, 2, 0, $10B)
    %spritemapEntry(0, $1F8, $11, 0, 0, 2, 0, $134)
    %spritemapEntry(0, $1F4, $FE, 0, 0, 2, 0, $14C)
    %spritemapEntry(0, $1EC, $FE, 0, 0, 2, 0, $14B)
    %spritemapEntry(0, $1E4, $FE, 0, 0, 2, 0, $14A)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spitemaps_SpacePirate_B2BBA4:
    dw $000E
    %spritemapEntry(1, $1F4, $FF, 0, 0, 2, 0, $128)
    %spritemapEntry(1, $1EC, $FF, 0, 0, 2, 0, $127)
    %spritemapEntry(0, $03, $15, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $1FA, $0B, 0, 0, 2, 0, $122)
    %spritemapEntry(0, $1FB, $FC, 0, 0, 2, 0, $113)
    %spritemapEntry(0, $1FB, $F4, 0, 0, 2, 0, $103)
    %spritemapEntry(1, $1F2, $EB, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $1F7, $F2, 0, 0, 2, 0, $12E)
    %spritemapEntry(0, $1FB, $15, 0, 0, 2, 0, $125)
    %spritemapEntry(1, $1F7, $FF, 0, 0, 2, 0, $107)
    %spritemapEntry(1, $1F3, $FF, 0, 0, 2, 0, $107)
    %spritemapEntry(1, $1F4, $0A, 0, 0, 2, 0, $122)
    %spritemapEntry(0, $1FB, $15, 0, 0, 2, 0, $126)
    %spritemapEntry(0, $1F3, $15, 0, 0, 2, 0, $125)

UNUSED_Spitemaps_SpacePirate_B2BBEC:
    dw $0012
    %spritemapEntry(1, $1F3, $EC, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $08, $FC, 1, 1, 2, 0, $14D)
    %spritemapEntry(0, $09, $04, 1, 1, 2, 0, $13D)
    %spritemapEntry(0, $09, $0C, 1, 1, 2, 0, $12D)
    %spritemapEntry(1, $1FE, $F2, 0, 0, 2, 0, $105)
    %spritemapEntry(1, $1F9, $F1, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1EE, $F3, 0, 0, 2, 0, $12B)
    %spritemapEntry(1, $1E6, $F3, 0, 0, 2, 0, $12A)
    %spritemapEntry(1, $1F7, $FF, 0, 0, 2, 0, $107)
    %spritemapEntry(0, $02, $11, 0, 0, 2, 0, $144)
    %spritemapEntry(0, $02, $09, 0, 0, 2, 0, $143)
    %spritemapEntry(0, $1F7, $09, 1, 1, 2, 0, $149)
    %spritemapEntry(0, $1FF, $09, 1, 1, 2, 0, $148)
    %spritemapEntry(1, $1F4, $FF, 0, 0, 2, 0, $107)
    %spritemapEntry(0, $1F5, $0B, 1, 1, 2, 0, $149)
    %spritemapEntry(0, $1FD, $0B, 1, 1, 2, 0, $148)
    %spritemapEntry(0, $1FE, $13, 0, 0, 2, 0, $144)
    %spritemapEntry(0, $1FE, $0B, 0, 0, 2, 0, $143)

UNUSED_Spitemaps_SpacePirate_B2BC48:
    dw $0014
    %spritemapEntry(0, $1F8, $F2, 0, 0, 2, 0, $14F)
    %spritemapEntry(0, $1F0, $F1, 0, 0, 2, 0, $14E)
    %spritemapEntry(0, $1EC, $EE, 0, 0, 2, 0, $14D)
    %spritemapEntry(0, $1EC, $E6, 0, 0, 2, 0, $13D)
    %spritemapEntry(0, $1EC, $DE, 0, 0, 2, 0, $12D)
    %spritemapEntry(1, $1F5, $F1, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1EE, $EB, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $1EC, $F0, 0, 0, 2, 0, $13D)
    %spritemapEntry(0, $1EC, $F8, 0, 0, 2, 0, $14D)
    %spritemapEntry(1, $1EE, $F1, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $1F7, $FF, 0, 0, 2, 0, $107)
    %spritemapEntry(0, $04, $11, 0, 0, 2, 0, $144)
    %spritemapEntry(0, $04, $09, 0, 0, 2, 0, $143)
    %spritemapEntry(0, $1F7, $09, 1, 1, 2, 0, $149)
    %spritemapEntry(0, $1FF, $09, 1, 1, 2, 0, $148)
    %spritemapEntry(1, $1F4, $FF, 0, 0, 2, 0, $107)
    %spritemapEntry(0, $1F5, $0B, 1, 1, 2, 0, $149)
    %spritemapEntry(0, $1FD, $0B, 1, 1, 2, 0, $148)
    %spritemapEntry(0, $1FE, $13, 0, 0, 2, 0, $144)
    %spritemapEntry(0, $1FE, $0B, 0, 0, 2, 0, $143)

UNUSED_Spitemaps_SpacePirate_B2BCAE:
    dw $000F
    %spritemapEntry(0, $1E8, $F7, 0, 0, 2, 0, $12A)
    %spritemapEntry(1, $1F0, $F7, 0, 0, 2, 0, $12B)
    %spritemapEntry(1, $1F7, $F6, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $1FB, $F2, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1F4, $EC, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $1FE, $0B, 0, 0, 2, 0, $146)
    %spritemapEntry(0, $1F6, $0B, 0, 0, 2, 0, $145)
    %spritemapEntry(0, $01, $00, 0, 0, 2, 0, $149)
    %spritemapEntry(0, $1F9, $FF, 0, 0, 2, 0, $148)
    %spritemapEntry(1, $1F7, $01, 0, 0, 2, 0, $122)
    %spritemapEntry(0, $1EF, $F9, 0, 0, 2, 0, $14D)
    %spritemapEntry(0, $1EE, $F1, 0, 0, 2, 0, $13D)
    %spritemapEntry(0, $1ED, $E9, 0, 0, 2, 0, $12D)
    %spritemapEntry(0, $02, $0D, 0, 0, 2, 0, $144)
    %spritemapEntry(0, $02, $05, 0, 0, 2, 0, $143)

UNUSED_Spitemaps_SpacePirate_B2BCFB:
    dw $000E
    %spritemapEntry(0, $1F0, $05, 1, 1, 2, 0, $18D)
    %spritemapEntry(0, $1F0, $0D, 1, 1, 2, 0, $17D)
    %spritemapEntry(0, $1F6, $0B, 0, 0, 2, 0, $130)
    %spritemapEntry(0, $1F6, $03, 0, 0, 2, 0, $120)
    %spritemapEntry(0, $1E9, $F4, 0, 0, 2, 0, $12A)
    %spritemapEntry(1, $1F1, $F4, 0, 0, 2, 0, $12B)
    %spritemapEntry(1, $1F8, $F3, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $1FC, $F0, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1F5, $EA, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $01, $FE, 0, 0, 2, 0, $149)
    %spritemapEntry(0, $1F9, $FE, 0, 0, 2, 0, $148)
    %spritemapEntry(0, $1F1, $F6, 0, 0, 2, 0, $14D)
    %spritemapEntry(0, $1F0, $EE, 0, 0, 2, 0, $13D)
    %spritemapEntry(0, $1EF, $E6, 0, 0, 2, 0, $12D)

UNUSED_Spitemaps_SpacePirate_B2BD43:
    dw $000E
    %spritemapEntry(0, $1F0, $05, 1, 1, 2, 0, $18D)
    %spritemapEntry(0, $1F0, $0D, 1, 1, 2, 0, $17D)
    %spritemapEntry(0, $1F5, $0B, 0, 0, 2, 0, $130)
    %spritemapEntry(0, $1F5, $03, 0, 0, 2, 0, $120)
    %spritemapEntry(0, $1E8, $F3, 0, 0, 2, 0, $12A)
    %spritemapEntry(1, $1F0, $F3, 0, 0, 2, 0, $12B)
    %spritemapEntry(1, $1F8, $F2, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $1FC, $F1, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1F5, $EB, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $01, $FF, 0, 0, 2, 0, $149)
    %spritemapEntry(0, $1F9, $FE, 0, 0, 2, 0, $148)
    %spritemapEntry(0, $1F0, $F7, 0, 0, 2, 0, $14D)
    %spritemapEntry(0, $1EF, $EF, 0, 0, 2, 0, $13D)
    %spritemapEntry(0, $1EE, $E7, 0, 0, 2, 0, $12D)
endif ; !FEATURE_KEEP_UNREFERENCED

Spitemaps_PirateNinja_18:
    dw $0009
    %spritemapEntry(0, $1F9, $00, 1, 1, 2, 0, $14D)
    %spritemapEntry(0, $1F9, $08, 1, 1, 2, 0, $13D)
    %spritemapEntry(0, $1F9, $10, 1, 1, 2, 0, $12D)
    %spritemapEntry(0, $1FA, $FA, 0, 0, 2, 0, $113)
    %spritemapEntry(0, $1FA, $F2, 0, 0, 2, 0, $103)
    %spritemapEntry(1, $1F8, $EF, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1F1, $E9, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $1F5, $FD, 0, 0, 2, 0, $14B)
    %spritemapEntry(0, $1ED, $FE, 0, 0, 2, 0, $14A)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spitemaps_SpacePirate_B2BDBA:
    dw $0003
    %spritemapEntry(0, $1FC, $04, 0, 0, 2, 0, $14D)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 0, $13D)
    %spritemapEntry(0, $1FC, $F4, 0, 0, 2, 0, $12D)
endif ; !FEATURE_KEEP_UNREFERENCED

Spitemaps_PirateWalking_2A_Ninja_18:
    dw $0010
    %spritemapEntry(1, $1F9, $FE, 0, 0, 2, 0, $107)
    %spritemapEntry(0, $1E4, $F3, 0, 0, 2, 0, $12A)
    %spritemapEntry(1, $1EC, $F3, 0, 0, 2, 0, $12B)
    %spritemapEntry(1, $1F6, $F1, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $1F2, $EB, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $1F9, $F1, 0, 0, 2, 0, $12E)
    %spritemapEntry(0, $1ED, $F9, 0, 0, 2, 0, $14D)
    %spritemapEntry(0, $1EC, $F1, 0, 0, 2, 0, $13D)
    %spritemapEntry(0, $1EB, $E9, 0, 0, 2, 0, $12D)
    %spritemapEntry(1, $1F4, $FE, 0, 0, 2, 0, $107)
    %spritemapEntry(0, $1FC, $10, 0, 0, 2, 0, $125)
    %spritemapEntry(1, $1F3, $05, 0, 0, 2, 0, $122)
    %spritemapEntry(0, $04, $10, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $1FB, $07, 0, 0, 2, 0, $122)
    %spritemapEntry(0, $1FA, $10, 0, 0, 2, 0, $126)
    %spritemapEntry(0, $1F2, $10, 0, 0, 2, 0, $125)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spitemaps_SpacePirate_B2BE1D:
    dw $0011
    %spritemapEntry(1, $1F3, $FB, 0, 0, 2, 0, $127)
    %spritemapEntry(1, $1FB, $FB, 0, 0, 2, 0, $128)
    %spritemapEntry(0, $1FE, $0D, 0, 0, 2, 0, $121)
    %spritemapEntry(0, $1FE, $15, 0, 0, 2, 0, $131)
    %spritemapEntry(0, $1FD, $18, 0, 0, 2, 0, $126)
    %spritemapEntry(0, $1F5, $18, 0, 0, 2, 0, $125)
    %spritemapEntry(0, $1FC, $08, 0, 0, 2, 0, $11A)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 0, $10A)
    %spritemapEntry(0, $07, $12, 0, 0, 2, 0, $144)
    %spritemapEntry(0, $07, $0A, 0, 0, 2, 0, $143)
    %spritemapEntry(0, $1FA, $06, 0, 0, 2, 0, $119)
    %spritemapEntry(0, $1FB, $FE, 0, 0, 2, 0, $109)
    %spritemapEntry(0, $1FA, $0A, 0, 0, 2, 0, $16E)
    %spritemapEntry(1, $1FA, $F0, 0, 0, 2, 0, $105)
    %spritemapEntry(1, $1F1, $E6, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $1F7, $EF, 0, 0, 2, 0, $12E)
    %spritemapEntry(0, $02, $0A, 0, 0, 2, 0, $16F)

UNUSED_Spitemaps_SpacePirate_B2BE74:
    dw $0013
    %spritemapEntry(0, $1FE, $FF, 0, 0, 2, 0, $10A)
    %spritemapEntry(0, $1E3, $F0, 0, 0, 2, 0, $12A)
    %spritemapEntry(1, $1EB, $F0, 0, 0, 2, 0, $12B)
    %spritemapEntry(1, $1F3, $F1, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $06, $F5, 1, 1, 2, 0, $14D)
    %spritemapEntry(0, $07, $FD, 1, 1, 2, 0, $13D)
    %spritemapEntry(0, $08, $05, 1, 1, 2, 0, $12D)
    %spritemapEntry(1, $1F3, $E9, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $1F7, $F1, 0, 0, 2, 0, $12E)
    %spritemapEntry(0, $1FD, $07, 0, 0, 2, 0, $11A)
    %spritemapEntry(0, $1E3, $FD, 1, 1, 2, 0, $16F)
    %spritemapEntry(0, $1EB, $FD, 1, 1, 2, 0, $16E)
    %spritemapEntry(0, $1FB, $FE, 0, 0, 2, 0, $19F)
    %spritemapEntry(0, $1F3, $FE, 0, 0, 2, 0, $19E)
    %spritemapEntry(0, $08, $16, 0, 0, 2, 0, $126)
    %spritemapEntry(0, $00, $17, 0, 0, 2, 0, $125)
    %spritemapEntry(1, $1FE, $0A, 0, 0, 2, 0, $122)
    %spritemapEntry(0, $1DE, $F4, 1, 1, 2, 0, $18D)
    %spritemapEntry(0, $1DD, $FC, 1, 1, 2, 0, $17D)

UNUSED_Spitemaps_SpacePirate_B2BED5:
    dw $0016
    %spritemapEntry(0, $09, $F4, 1, 1, 2, 0, $14D)
    %spritemapEntry(0, $0A, $FC, 1, 1, 2, 0, $13D)
    %spritemapEntry(0, $0A, $04, 1, 1, 2, 0, $12D)
    %spritemapEntry(0, $06, $F3, 0, 0, 2, 0, $15F)
    %spritemapEntry(0, $1FE, $F4, 0, 0, 2, 0, $15E)
    %spritemapEntry(0, $1FF, $00, 0, 1, 2, 0, $10A)
    %spritemapEntry(1, $1F3, $EC, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $1F9, $F2, 0, 0, 2, 0, $12E)
    %spritemapEntry(0, $1EF, $10, 0, 1, 2, 0, $18D)
    %spritemapEntry(0, $1EF, $08, 0, 1, 2, 0, $17D)
    %spritemapEntry(0, $1F4, $08, 0, 1, 2, 0, $16F)
    %spritemapEntry(0, $1FC, $09, 0, 1, 2, 0, $16E)
    %spritemapEntry(0, $00, $08, 0, 1, 2, 0, $11A)
    %spritemapEntry(0, $1F5, $EA, 0, 0, 2, 0, $14D)
    %spritemapEntry(0, $1F4, $E2, 0, 0, 2, 0, $13D)
    %spritemapEntry(0, $1F4, $DA, 0, 0, 2, 0, $12D)
    %spritemapEntry(0, $1E5, $FD, 1, 1, 2, 0, $16F)
    %spritemapEntry(0, $1ED, $FD, 1, 1, 2, 0, $16E)
    %spritemapEntry(0, $1FB, $FD, 0, 0, 2, 0, $19F)
    %spritemapEntry(0, $1F3, $FD, 0, 0, 2, 0, $19E)
    %spritemapEntry(0, $1DE, $F5, 1, 1, 2, 0, $18D)
    %spritemapEntry(0, $1DE, $FD, 1, 1, 2, 0, $17D)
endif ; !FEATURE_KEEP_UNREFERENCED

Spitemaps_PirateNinja_19:
    dw $000A
    %spritemapEntry(1, $1FC, $00, 0, 1, 2, 0, $107)
    %spritemapEntry(0, $1FB, $08, 0, 1, 2, 0, $11B)
    %spritemapEntry(0, $1FB, $00, 0, 1, 2, 0, $10B)
    %spritemapEntry(0, $0B, $16, 0, 1, 2, 0, $136)
    %spritemapEntry(1, $1F0, $08, 0, 1, 2, 0, $17E)
    %spritemapEntry(0, $07, $13, 0, 1, 2, 0, $130)
    %spritemapEntry(0, $07, $0B, 0, 1, 2, 0, $120)
    %spritemapEntry(0, $12, $16, 0, 1, 2, 0, $135)
    %spritemapEntry(0, $1EB, $16, 0, 1, 2, 0, $144)
    %spritemapEntry(0, $1EC, $0E, 0, 1, 2, 0, $143)

Spitemaps_PirateNinja_1A:
    dw $000C
    %spritemapEntry(0, $1ED, $10, 0, 1, 2, 0, $18D)
    %spritemapEntry(0, $1ED, $08, 0, 1, 2, 0, $17D)
    %spritemapEntry(0, $1F0, $09, 0, 1, 2, 0, $16D)
    %spritemapEntry(0, $1F8, $09, 0, 1, 2, 0, $16C)
    %spritemapEntry(0, $1FF, $12, 0, 1, 2, 0, $131)
    %spritemapEntry(0, $1FF, $0A, 0, 1, 2, 0, $121)
    %spritemapEntry(0, $01, $18, 0, 1, 2, 0, $126)
    %spritemapEntry(0, $09, $18, 0, 1, 2, 0, $125)
    %spritemapEntry(0, $1FE, $06, 0, 1, 2, 0, $119)
    %spritemapEntry(0, $1FE, $FE, 0, 1, 2, 0, $109)
    %spritemapEntry(0, $1FC, $06, 0, 1, 2, 0, $11A)
    %spritemapEntry(0, $1FC, $FE, 0, 1, 2, 0, $10A)

Spitemaps_PirateNinja_1B:
    dw $000C
    %spritemapEntry(0, $1FC, $06, 0, 1, 2, 0, $11A)
    %spritemapEntry(0, $1FC, $FE, 0, 1, 2, 0, $10A)
    %spritemapEntry(0, $1FF, $05, 0, 1, 2, 0, $119)
    %spritemapEntry(0, $1FB, $18, 0, 1, 2, 0, $126)
    %spritemapEntry(0, $1FA, $14, 0, 1, 2, 0, $131)
    %spritemapEntry(0, $1FA, $0C, 0, 1, 2, 0, $121)
    %spritemapEntry(0, $1FF, $FD, 0, 1, 2, 0, $109)
    %spritemapEntry(0, $03, $18, 0, 1, 2, 0, $125)
    %spritemapEntry(0, $1F7, $09, 0, 1, 2, 0, $16F)
    %spritemapEntry(0, $1FF, $09, 0, 1, 2, 0, $16E)
    %spritemapEntry(0, $1F3, $11, 0, 1, 2, 0, $144)
    %spritemapEntry(0, $1F3, $09, 0, 1, 2, 0, $143)

Spitemaps_PirateNinja_1C:
    dw $000B
    %spritemapEntry(0, $1FE, $14, 0, 1, 2, 0, $146)
    %spritemapEntry(0, $06, $14, 0, 1, 2, 0, $145)
    %spritemapEntry(0, $1F2, $18, 0, 1, 2, 0, $146)
    %spritemapEntry(0, $1FA, $18, 0, 1, 2, 0, $145)
    %spritemapEntry(0, $1F5, $13, 0, 1, 2, 0, $134)
    %spritemapEntry(0, $1F5, $0B, 0, 1, 2, 0, $124)
    %spritemapEntry(0, $1FA, $07, 0, 1, 2, 0, $11B)
    %spritemapEntry(0, $1F9, $FF, 0, 1, 2, 0, $10B)
    %spritemapEntry(1, $1FB, $FD, 0, 1, 2, 0, $107)
    %spritemapEntry(0, $1FF, $0F, 0, 1, 2, 0, $134)
    %spritemapEntry(0, $1FF, $07, 0, 1, 2, 0, $124)

Spitemaps_PirateNinja_1D:
    dw $000A
    %spritemapEntry(0, $1FC, $08, 0, 1, 2, 0, $11B)
    %spritemapEntry(0, $1FC, $00, 0, 1, 2, 0, $10A)
    %spritemapEntry(0, $08, $12, 0, 1, 2, 0, $130)
    %spritemapEntry(1, $1F1, $08, 0, 1, 2, 0, $17E)
    %spritemapEntry(0, $0D, $16, 0, 1, 2, 0, $136)
    %spritemapEntry(0, $14, $16, 0, 1, 2, 0, $135)
    %spritemapEntry(0, $1EB, $16, 0, 1, 2, 0, $144)
    %spritemapEntry(0, $1EC, $0E, 0, 1, 2, 0, $143)
    %spritemapEntry(0, $08, $0A, 0, 1, 2, 0, $120)
    %spritemapEntry(1, $1FD, $FF, 0, 1, 2, 0, $107)

Spitemaps_PirateNinja_1E:
    dw $000C
    %spritemapEntry(0, $1EE, $0F, 0, 1, 2, 0, $18D)
    %spritemapEntry(0, $1EE, $07, 0, 1, 2, 0, $17D)
    %spritemapEntry(0, $03, $18, 0, 1, 2, 0, $126)
    %spritemapEntry(0, $0B, $18, 0, 1, 2, 0, $125)
    %spritemapEntry(0, $1F2, $09, 0, 1, 2, 0, $16D)
    %spritemapEntry(0, $1FA, $09, 0, 1, 2, 0, $16C)
    %spritemapEntry(0, $02, $13, 0, 1, 2, 0, $131)
    %spritemapEntry(0, $01, $0B, 0, 1, 2, 0, $121)
    %spritemapEntry(0, $1FD, $06, 0, 1, 2, 0, $11A)
    %spritemapEntry(0, $1FD, $FE, 0, 1, 2, 0, $10A)
    %spritemapEntry(0, $00, $07, 0, 1, 2, 0, $119)
    %spritemapEntry(0, $00, $FF, 0, 1, 2, 0, $109)

Spitemaps_PirateNinja_1F:
    dw $000C
    %spritemapEntry(0, $1F1, $12, 0, 1, 2, 0, $144)
    %spritemapEntry(0, $1F1, $0A, 0, 1, 2, 0, $143)
    %spritemapEntry(0, $1F6, $0A, 0, 1, 2, 0, $16F)
    %spritemapEntry(0, $1FE, $0A, 0, 1, 2, 0, $16E)
    %spritemapEntry(0, $1FE, $06, 0, 1, 2, 0, $119)
    %spritemapEntry(0, $1FD, $FE, 0, 1, 2, 0, $109)
    %spritemapEntry(0, $1FB, $18, 0, 1, 2, 0, $126)
    %spritemapEntry(0, $03, $18, 0, 1, 2, 0, $125)
    %spritemapEntry(0, $1FA, $15, 0, 1, 2, 0, $131)
    %spritemapEntry(0, $1FA, $0D, 0, 1, 2, 0, $121)
    %spritemapEntry(0, $1FC, $08, 0, 1, 2, 0, $11A)
    %spritemapEntry(0, $1FC, $00, 0, 1, 2, 0, $10A)

Spitemaps_PirateNinja_20:
    dw $000B
    %spritemapEntry(0, $1FE, $14, 0, 1, 2, 0, $146)
    %spritemapEntry(0, $06, $14, 0, 1, 2, 0, $145)
    %spritemapEntry(1, $1FA, $FC, 0, 1, 2, 0, $107)
    %spritemapEntry(0, $00, $0E, 0, 1, 2, 0, $134)
    %spritemapEntry(0, $00, $06, 0, 1, 2, 0, $124)
    %spritemapEntry(0, $1F4, $18, 0, 1, 2, 0, $146)
    %spritemapEntry(0, $1FC, $18, 0, 1, 2, 0, $145)
    %spritemapEntry(0, $1F7, $13, 0, 1, 2, 0, $134)
    %spritemapEntry(0, $1F7, $0B, 0, 1, 2, 0, $124)
    %spritemapEntry(0, $1FC, $07, 0, 1, 2, 0, $11B)
    %spritemapEntry(0, $1FB, $FF, 0, 1, 2, 0, $10B)

Spitemaps_PirateWalking_2B_Ninja_21:
    dw $0009
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 0, $112)
    %spritemapEntry(0, $1FC, $F4, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $04, $01, 0, 1, 2, 0, $127)
    %spritemapEntry(1, $1FC, $01, 0, 1, 2, 0, $128)
    %spritemapEntry(1, $1F8, $F0, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $1FF, $EA, 0, 1, 2, 0, $10E)
    %spritemapEntry(0, $02, $FE, 0, 1, 2, 0, $14C)
    %spritemapEntry(0, $0A, $FE, 0, 1, 2, 0, $14B)
    %spritemapEntry(0, $12, $FE, 0, 1, 2, 0, $14A)

Spitemaps_PirateWalking_2C_Ninja_22:
    dw $0009
    %spritemapEntry(1, $05, $00, 0, 1, 2, 0, $127)
    %spritemapEntry(1, $1FD, $00, 0, 1, 2, 0, $128)
    %spritemapEntry(0, $1FD, $FB, 0, 1, 2, 0, $113)
    %spritemapEntry(0, $1FE, $F3, 0, 1, 2, 0, $103)
    %spritemapEntry(1, $1F8, $EF, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $1FF, $EA, 0, 1, 2, 0, $10E)
    %spritemapEntry(0, $00, $FD, 0, 1, 2, 0, $14C)
    %spritemapEntry(0, $08, $FD, 0, 1, 2, 0, $14B)
    %spritemapEntry(0, $10, $FD, 0, 1, 2, 0, $14A)

Spitemaps_PirateWalking_2D_Ninja_23:
    dw $0008
    %spritemapEntry(1, $07, $FE, 0, 1, 2, 0, $127)
    %spritemapEntry(1, $1FF, $FE, 0, 1, 2, 0, $128)
    %spritemapEntry(0, $1FE, $F8, 0, 1, 2, 0, $113)
    %spritemapEntry(0, $1FE, $F0, 0, 1, 2, 0, $103)
    %spritemapEntry(1, $1F8, $EE, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $1FF, $E8, 0, 1, 2, 0, $10E)
    %spritemapEntry(0, $05, $FC, 0, 1, 2, 0, $14B)
    %spritemapEntry(0, $0D, $FD, 0, 1, 2, 0, $14A)

Spitemaps_PirateWalking_2E_Ninja_24:
    dw $0008
    %spritemapEntry(1, $08, $00, 0, 1, 2, 0, $127)
    %spritemapEntry(1, $00, $00, 0, 1, 2, 0, $128)
    %spritemapEntry(0, $1FE, $FA, 0, 1, 2, 0, $113)
    %spritemapEntry(0, $1FE, $F2, 0, 1, 2, 0, $103)
    %spritemapEntry(1, $1F8, $EF, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $1FF, $E9, 0, 1, 2, 0, $10E)
    %spritemapEntry(0, $03, $FE, 0, 1, 2, 0, $14B)
    %spritemapEntry(0, $0B, $FF, 0, 1, 2, 0, $14A)

Spitemaps_PirateNinja_25:
    dw $0007
    %spritemapEntry(0, $02, $FC, 0, 1, 2, 0, $14C)
    %spritemapEntry(0, $0A, $FC, 0, 1, 2, 0, $14B)
    %spritemapEntry(0, $12, $FC, 0, 1, 2, 0, $14A)
    %spritemapEntry(0, $1FD, $FA, 0, 1, 2, 0, $112)
    %spritemapEntry(0, $1FD, $F2, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $1F8, $EF, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $1FF, $E9, 0, 1, 2, 0, $10E)

Spitemaps_PirateNinja_26:
    dw $0007
    %spritemapEntry(1, $1FC, $F2, 0, 1, 2, 0, $100)
    %spritemapEntry(0, $16, $F3, 0, 1, 2, 0, $12A)
    %spritemapEntry(1, $06, $F3, 0, 1, 2, 0, $12B)
    %spritemapEntry(1, $1F8, $EF, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $1FF, $E9, 0, 1, 2, 0, $10E)
    %spritemapEntry(0, $06, $FD, 0, 1, 2, 0, $14B)
    %spritemapEntry(0, $0E, $FD, 0, 1, 2, 0, $14A)

Spitemaps_PirateNinja_27:
    dw $0009
    %spritemapEntry(0, $07, $FD, 0, 1, 2, 0, $14B)
    %spritemapEntry(0, $0F, $FD, 0, 1, 2, 0, $14A)
    %spritemapEntry(0, $18, $E9, 0, 1, 2, 0, $12A)
    %spritemapEntry(1, $08, $E9, 0, 1, 2, 0, $12B)
    %spritemapEntry(0, $1FD, $F1, 0, 1, 2, 0, $14F)
    %spritemapEntry(0, $05, $F1, 0, 1, 2, 0, $14E)
    %spritemapEntry(1, $1F8, $EF, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $1FF, $E9, 0, 1, 2, 0, $10E)
    %spritemapEntry(0, $02, $FD, 0, 1, 2, 0, $14C)

Spitemaps_PirateNinja_28:
    dw $000A
    %spritemapEntry(0, $08, $FD, 0, 1, 2, 0, $14B)
    %spritemapEntry(0, $10, $FD, 0, 1, 2, 0, $14A)
    %spritemapEntry(0, $1FE, $E4, 0, 1, 2, 0, $14D)
    %spritemapEntry(0, $1FE, $DC, 0, 1, 2, 0, $13D)
    %spritemapEntry(0, $1FE, $D4, 0, 1, 2, 0, $12D)
    %spritemapEntry(0, $1FD, $E8, 1, 0, 2, 0, $113)
    %spritemapEntry(0, $1FD, $F0, 1, 0, 2, 0, $103)
    %spritemapEntry(1, $1F8, $F0, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $1FF, $EA, 0, 1, 2, 0, $10E)
    %spritemapEntry(0, $02, $FD, 0, 1, 2, 0, $14C)

Spitemaps_PirateNinja_29:
    dw $0014
    %spritemapEntry(0, $02, $12, 0, 1, 2, 0, $134)
    %spritemapEntry(0, $02, $0A, 0, 1, 2, 0, $124)
    %spritemapEntry(0, $01, $15, 0, 1, 2, 0, $126)
    %spritemapEntry(0, $16, $F4, 0, 1, 2, 0, $12A)
    %spritemapEntry(1, $06, $F4, 0, 1, 2, 0, $12B)
    %spritemapEntry(0, $01, $FA, 0, 1, 2, 0, $112)
    %spritemapEntry(0, $00, $F2, 0, 1, 2, 0, $102)
    %spritemapEntry(0, $1F6, $12, 0, 1, 2, 0, $134)
    %spritemapEntry(0, $1FB, $16, 0, 1, 2, 0, $125)
    %spritemapEntry(0, $1FB, $07, 0, 1, 2, 0, $11A)
    %spritemapEntry(0, $1FA, $FF, 0, 1, 2, 0, $10A)
    %spritemapEntry(0, $1F7, $0A, 0, 1, 2, 0, $124)
    %spritemapEntry(1, $1FA, $F0, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $00, $EA, 0, 1, 2, 0, $10E)
    %spritemapEntry(0, $09, $16, 0, 1, 2, 0, $145)
    %spritemapEntry(1, $1FD, $FF, 0, 1, 2, 0, $107)
    %spritemapEntry(0, $02, $FE, 0, 1, 2, 0, $14C)
    %spritemapEntry(0, $0A, $FE, 0, 1, 2, 0, $14B)
    %spritemapEntry(0, $12, $FE, 0, 1, 2, 0, $14A)
    %spritemapEntry(0, $1F3, $15, 0, 1, 2, 0, $126)

Spitemaps_PirateNinja_2A:
    dw $0013
    %spritemapEntry(0, $01, $08, 0, 1, 2, 0, $124)
    %spritemapEntry(0, $1F1, $16, 0, 1, 2, 0, $146)
    %spritemapEntry(0, $1F9, $05, 0, 1, 2, 0, $11A)
    %spritemapEntry(0, $1F9, $FD, 0, 1, 2, 0, $10A)
    %spritemapEntry(0, $16, $F3, 0, 1, 2, 0, $12A)
    %spritemapEntry(1, $06, $F3, 0, 1, 2, 0, $12B)
    %spritemapEntry(1, $1FE, $F1, 0, 1, 2, 0, $100)
    %spritemapEntry(1, $1FA, $EF, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $01, $EA, 0, 1, 2, 0, $10E)
    %spritemapEntry(0, $00, $16, 0, 1, 2, 0, $146)
    %spritemapEntry(0, $08, $15, 0, 1, 2, 0, $145)
    %spritemapEntry(0, $1F9, $15, 0, 1, 2, 0, $145)
    %spritemapEntry(0, $1F5, $10, 0, 1, 2, 0, $134)
    %spritemapEntry(0, $1F6, $08, 0, 1, 2, 0, $124)
    %spritemapEntry(1, $1FC, $FE, 0, 1, 2, 0, $107)
    %spritemapEntry(0, $01, $10, 0, 1, 2, 0, $134)
    %spritemapEntry(0, $03, $FD, 0, 1, 2, 0, $14C)
    %spritemapEntry(0, $0B, $FD, 0, 1, 2, 0, $14B)
    %spritemapEntry(0, $13, $FD, 0, 1, 2, 0, $14A)

Spitemaps_PirateNinja_2B:
    dw $0014
    %spritemapEntry(0, $01, $09, 0, 1, 2, 0, $124)
    %spritemapEntry(0, $01, $06, 0, 1, 2, 0, $119)
    %spritemapEntry(0, $01, $FF, 0, 1, 2, 0, $109)
    %spritemapEntry(0, $18, $F5, 0, 1, 2, 0, $12A)
    %spritemapEntry(1, $08, $F5, 0, 1, 2, 0, $12B)
    %spritemapEntry(1, $1FF, $F3, 0, 1, 2, 0, $100)
    %spritemapEntry(1, $1FB, $F0, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $02, $EB, 0, 1, 2, 0, $10E)
    %spritemapEntry(0, $00, $16, 0, 1, 2, 0, $146)
    %spritemapEntry(0, $08, $16, 0, 1, 2, 0, $145)
    %spritemapEntry(0, $1F2, $16, 0, 1, 2, 0, $146)
    %spritemapEntry(0, $1FA, $16, 0, 1, 2, 0, $145)
    %spritemapEntry(0, $1F5, $11, 0, 1, 2, 0, $134)
    %spritemapEntry(0, $1F5, $09, 0, 1, 2, 0, $124)
    %spritemapEntry(0, $1F9, $07, 0, 1, 2, 0, $11B)
    %spritemapEntry(0, $1F9, $FF, 0, 1, 2, 0, $10B)
    %spritemapEntry(0, $00, $11, 0, 1, 2, 0, $134)
    %spritemapEntry(0, $04, $FE, 0, 1, 2, 0, $14C)
    %spritemapEntry(0, $0C, $FE, 0, 1, 2, 0, $14B)
    %spritemapEntry(0, $14, $FE, 0, 1, 2, 0, $14A)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spitemaps_SpacePirate_B2C3A3:
    dw $000E
    %spritemapEntry(1, $1FC, $FF, 0, 1, 2, 0, $128)
    %spritemapEntry(1, $04, $FF, 0, 1, 2, 0, $127)
    %spritemapEntry(0, $1F5, $15, 0, 1, 2, 0, $126)
    %spritemapEntry(1, $1F6, $0B, 0, 1, 2, 0, $122)
    %spritemapEntry(0, $1FD, $FC, 0, 1, 2, 0, $113)
    %spritemapEntry(0, $1FD, $F4, 0, 1, 2, 0, $103)
    %spritemapEntry(1, $1FE, $EB, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $1F9, $F2, 0, 1, 2, 0, $12E)
    %spritemapEntry(0, $1FD, $15, 0, 1, 2, 0, $125)
    %spritemapEntry(1, $1F9, $FF, 0, 1, 2, 0, $107)
    %spritemapEntry(1, $1FD, $FF, 0, 1, 2, 0, $107)
    %spritemapEntry(1, $1FC, $0A, 0, 1, 2, 0, $122)
    %spritemapEntry(0, $1FD, $15, 0, 1, 2, 0, $126)
    %spritemapEntry(0, $05, $15, 0, 1, 2, 0, $125)

UNUSED_Spitemaps_SpacePirate_B2C3EB:
    dw $0012
    %spritemapEntry(1, $1FD, $EC, 0, 1, 2, 0, $10E)
    %spritemapEntry(0, $1F0, $FC, 1, 0, 2, 0, $14D)
    %spritemapEntry(0, $1EF, $04, 1, 0, 2, 0, $13D)
    %spritemapEntry(0, $1EF, $0C, 1, 0, 2, 0, $12D)
    %spritemapEntry(1, $1F2, $F2, 0, 1, 2, 0, $105)
    %spritemapEntry(1, $1F7, $F1, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $02, $F3, 0, 1, 2, 0, $12B)
    %spritemapEntry(1, $0A, $F3, 0, 1, 2, 0, $12A)
    %spritemapEntry(1, $1F9, $FF, 0, 1, 2, 0, $107)
    %spritemapEntry(0, $1F6, $11, 0, 1, 2, 0, $144)
    %spritemapEntry(0, $1F6, $09, 0, 1, 2, 0, $143)
    %spritemapEntry(0, $01, $09, 1, 0, 2, 0, $149)
    %spritemapEntry(0, $1F9, $09, 1, 0, 2, 0, $148)
    %spritemapEntry(1, $1FC, $FF, 0, 1, 2, 0, $107)
    %spritemapEntry(0, $03, $0B, 1, 0, 2, 0, $149)
    %spritemapEntry(0, $1FB, $0B, 1, 0, 2, 0, $148)
    %spritemapEntry(0, $1FA, $13, 0, 1, 2, 0, $144)
    %spritemapEntry(0, $1FA, $0B, 0, 1, 2, 0, $143)

UNUSED_Spitemaps_SpacePirate_B2C447:
    dw $0014
    %spritemapEntry(0, $00, $F2, 0, 1, 2, 0, $14F)
    %spritemapEntry(0, $08, $F1, 0, 1, 2, 0, $14E)
    %spritemapEntry(0, $0C, $EE, 0, 1, 2, 0, $14D)
    %spritemapEntry(0, $0C, $E6, 0, 1, 2, 0, $13D)
    %spritemapEntry(0, $0C, $DE, 0, 1, 2, 0, $12D)
    %spritemapEntry(1, $1FB, $F1, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $02, $EB, 0, 1, 2, 0, $10E)
    %spritemapEntry(0, $0C, $F0, 0, 1, 2, 0, $13D)
    %spritemapEntry(0, $0C, $F8, 0, 1, 2, 0, $14D)
    %spritemapEntry(1, $02, $F1, 0, 1, 2, 0, $100)
    %spritemapEntry(1, $1F9, $FF, 0, 1, 2, 0, $107)
    %spritemapEntry(0, $1F4, $11, 0, 1, 2, 0, $144)
    %spritemapEntry(0, $1F4, $09, 0, 1, 2, 0, $143)
    %spritemapEntry(0, $01, $09, 1, 0, 2, 0, $149)
    %spritemapEntry(0, $1F9, $09, 1, 0, 2, 0, $148)
    %spritemapEntry(1, $1FC, $FF, 0, 1, 2, 0, $107)
    %spritemapEntry(0, $03, $0B, 1, 0, 2, 0, $149)
    %spritemapEntry(0, $1FB, $0B, 1, 0, 2, 0, $148)
    %spritemapEntry(0, $1FA, $13, 0, 1, 2, 0, $144)
    %spritemapEntry(0, $1FA, $0B, 0, 1, 2, 0, $143)

UNUSED_Spitemaps_SpacePirate_B2C4AD:
    dw $000F
    %spritemapEntry(0, $10, $F7, 0, 1, 2, 0, $12A)
    %spritemapEntry(1, $00, $F7, 0, 1, 2, 0, $12B)
    %spritemapEntry(1, $1F9, $F6, 0, 1, 2, 0, $100)
    %spritemapEntry(1, $1F5, $F2, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $1FC, $EC, 0, 1, 2, 0, $10E)
    %spritemapEntry(0, $1FA, $0B, 0, 1, 2, 0, $146)
    %spritemapEntry(0, $02, $0B, 0, 1, 2, 0, $145)
    %spritemapEntry(0, $1F7, $00, 0, 1, 2, 0, $149)
    %spritemapEntry(0, $1FF, $FF, 0, 1, 2, 0, $148)
    %spritemapEntry(1, $1F9, $01, 0, 1, 2, 0, $122)
    %spritemapEntry(0, $09, $F9, 0, 1, 2, 0, $14D)
    %spritemapEntry(0, $0A, $F1, 0, 1, 2, 0, $13D)
    %spritemapEntry(0, $0B, $E9, 0, 1, 2, 0, $12D)
    %spritemapEntry(0, $1F6, $0D, 0, 1, 2, 0, $144)
    %spritemapEntry(0, $1F6, $05, 0, 1, 2, 0, $143)

UNUSED_Spitemaps_SpacePirate_B2C4FA:
    dw $000E
    %spritemapEntry(0, $08, $05, 1, 0, 2, 0, $18D)
    %spritemapEntry(0, $08, $0D, 1, 0, 2, 0, $17D)
    %spritemapEntry(0, $02, $0B, 0, 1, 2, 0, $130)
    %spritemapEntry(0, $02, $03, 0, 1, 2, 0, $120)
    %spritemapEntry(0, $0F, $F4, 0, 1, 2, 0, $12A)
    %spritemapEntry(1, $1FF, $F4, 0, 1, 2, 0, $12B)
    %spritemapEntry(1, $1F8, $F3, 0, 1, 2, 0, $100)
    %spritemapEntry(1, $1F4, $F0, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $1FB, $EA, 0, 1, 2, 0, $10E)
    %spritemapEntry(0, $1F7, $FE, 0, 1, 2, 0, $149)
    %spritemapEntry(0, $1FF, $FE, 0, 1, 2, 0, $148)
    %spritemapEntry(0, $07, $F6, 0, 1, 2, 0, $14D)
    %spritemapEntry(0, $08, $EE, 0, 1, 2, 0, $13D)
    %spritemapEntry(0, $09, $E6, 0, 1, 2, 0, $12D)

UNUSED_Spitemaps_SpacePirate_B2C542:
    dw $000E
    %spritemapEntry(0, $08, $05, 1, 0, 2, 0, $18D)
    %spritemapEntry(0, $08, $0D, 1, 0, 2, 0, $17D)
    %spritemapEntry(0, $03, $0B, 0, 1, 2, 0, $130)
    %spritemapEntry(0, $03, $03, 0, 1, 2, 0, $120)
    %spritemapEntry(0, $10, $F3, 0, 1, 2, 0, $12A)
    %spritemapEntry(1, $00, $F3, 0, 1, 2, 0, $12B)
    %spritemapEntry(1, $1F8, $F2, 0, 1, 2, 0, $100)
    %spritemapEntry(1, $1F4, $F1, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $1FB, $EB, 0, 1, 2, 0, $10E)
    %spritemapEntry(0, $1F7, $FF, 0, 1, 2, 0, $149)
    %spritemapEntry(0, $1FF, $FE, 0, 1, 2, 0, $148)
    %spritemapEntry(0, $08, $F7, 0, 1, 2, 0, $14D)
    %spritemapEntry(0, $09, $EF, 0, 1, 2, 0, $13D)
    %spritemapEntry(0, $0A, $E7, 0, 1, 2, 0, $12D)
endif ; !FEATURE_KEEP_UNREFERENCED

Spitemaps_PirateNinja_2C:
    dw $0009
    %spritemapEntry(0, $1FF, $00, 1, 0, 2, 0, $14D)
    %spritemapEntry(0, $1FF, $08, 1, 0, 2, 0, $13D)
    %spritemapEntry(0, $1FF, $10, 1, 0, 2, 0, $12D)
    %spritemapEntry(0, $1FE, $FA, 0, 1, 2, 0, $113)
    %spritemapEntry(0, $1FE, $F2, 0, 1, 2, 0, $103)
    %spritemapEntry(1, $1F8, $EF, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $1FF, $E9, 0, 1, 2, 0, $10E)
    %spritemapEntry(0, $03, $FD, 0, 1, 2, 0, $14B)
    %spritemapEntry(0, $0B, $FE, 0, 1, 2, 0, $14A)

Spitemaps_PirateWalking_2F:
    dw $0010
    %spritemapEntry(1, $1F7, $FE, 0, 1, 2, 0, $107)
    %spritemapEntry(0, $14, $F3, 0, 1, 2, 0, $12A)
    %spritemapEntry(1, $04, $F3, 0, 1, 2, 0, $12B)
    %spritemapEntry(1, $1FA, $F1, 0, 1, 2, 0, $100)
    %spritemapEntry(1, $1FE, $EB, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $1F7, $F1, 0, 1, 2, 0, $12E)
    %spritemapEntry(0, $0B, $F9, 0, 1, 2, 0, $14D)
    %spritemapEntry(0, $0C, $F1, 0, 1, 2, 0, $13D)
    %spritemapEntry(0, $0D, $E9, 0, 1, 2, 0, $12D)
    %spritemapEntry(1, $1FC, $FE, 0, 1, 2, 0, $107)
    %spritemapEntry(0, $1FC, $10, 0, 1, 2, 0, $125)
    %spritemapEntry(1, $1FD, $05, 0, 1, 2, 0, $122)
    %spritemapEntry(0, $1F4, $10, 0, 1, 2, 0, $126)
    %spritemapEntry(1, $1F5, $07, 0, 1, 2, 0, $122)
    %spritemapEntry(0, $1FE, $10, 0, 1, 2, 0, $126)
    %spritemapEntry(0, $06, $10, 0, 1, 2, 0, $125)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spitemaps_SpacePirate_B2C60B:
    dw $0011
    %spritemapEntry(1, $1FD, $FB, 0, 1, 2, 0, $127)
    %spritemapEntry(1, $1F5, $FB, 0, 1, 2, 0, $128)
    %spritemapEntry(0, $1FA, $0D, 0, 1, 2, 0, $121)
    %spritemapEntry(0, $1FA, $15, 0, 1, 2, 0, $131)
    %spritemapEntry(0, $1FB, $18, 0, 1, 2, 0, $126)
    %spritemapEntry(0, $03, $18, 0, 1, 2, 0, $125)
    %spritemapEntry(0, $1FC, $08, 0, 1, 2, 0, $11A)
    %spritemapEntry(0, $1FC, $00, 0, 1, 2, 0, $10A)
    %spritemapEntry(0, $1F1, $12, 0, 1, 2, 0, $144)
    %spritemapEntry(0, $1F1, $0A, 0, 1, 2, 0, $143)
    %spritemapEntry(0, $1FE, $06, 0, 1, 2, 0, $119)
    %spritemapEntry(0, $1FD, $FE, 0, 1, 2, 0, $109)
    %spritemapEntry(0, $1FE, $0A, 0, 1, 2, 0, $16E)
    %spritemapEntry(1, $1F6, $F0, 0, 1, 2, 0, $105)
    %spritemapEntry(1, $1FF, $E6, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $1F9, $EF, 0, 1, 2, 0, $12E)
    %spritemapEntry(0, $1F6, $0A, 0, 1, 2, 0, $16F)

UNUSED_Spitemaps_SpacePirate_B2C662:
    dw $0013
    %spritemapEntry(0, $1FA, $FF, 0, 1, 2, 0, $10A)
    %spritemapEntry(0, $15, $F0, 0, 1, 2, 0, $12A)
    %spritemapEntry(1, $05, $F0, 0, 1, 2, 0, $12B)
    %spritemapEntry(1, $1FD, $F1, 0, 1, 2, 0, $100)
    %spritemapEntry(0, $1F2, $F5, 1, 0, 2, 0, $14D)
    %spritemapEntry(0, $1F1, $FD, 1, 0, 2, 0, $13D)
    %spritemapEntry(0, $1F0, $05, 1, 0, 2, 0, $12D)
    %spritemapEntry(1, $1FD, $E9, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $1F9, $F1, 0, 1, 2, 0, $12E)
    %spritemapEntry(0, $1FB, $07, 0, 1, 2, 0, $11A)
    %spritemapEntry(0, $15, $FD, 1, 0, 2, 0, $16F)
    %spritemapEntry(0, $0D, $FD, 1, 0, 2, 0, $16E)
    %spritemapEntry(0, $1FD, $FE, 0, 1, 2, 0, $19F)
    %spritemapEntry(0, $05, $FE, 0, 1, 2, 0, $19E)
    %spritemapEntry(0, $1F0, $16, 0, 1, 2, 0, $126)
    %spritemapEntry(0, $1F8, $17, 0, 1, 2, 0, $125)
    %spritemapEntry(1, $1F2, $0A, 0, 1, 2, 0, $122)
    %spritemapEntry(0, $1A, $F4, 1, 0, 2, 0, $18D)
    %spritemapEntry(0, $1B, $FC, 1, 0, 2, 0, $17D)

UNUSED_Spitemaps_SpacePirate_B2C6C3:
    dw $0016
    %spritemapEntry(0, $1EF, $F4, 1, 0, 2, 0, $14D)
    %spritemapEntry(0, $1EE, $FC, 1, 0, 2, 0, $13D)
    %spritemapEntry(0, $1EE, $04, 1, 0, 2, 0, $12D)
    %spritemapEntry(0, $1F2, $F3, 0, 1, 2, 0, $15F)
    %spritemapEntry(0, $1FA, $F4, 0, 1, 2, 0, $15E)
    %spritemapEntry(0, $1F9, $00, 0, 0, 2, 0, $10A)
    %spritemapEntry(1, $1FD, $EC, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $1F7, $F2, 0, 1, 2, 0, $12E)
    %spritemapEntry(0, $09, $10, 0, 0, 2, 0, $18D)
    %spritemapEntry(0, $09, $08, 0, 0, 2, 0, $17D)
    %spritemapEntry(0, $04, $08, 0, 0, 2, 0, $16F)
    %spritemapEntry(0, $1FC, $09, 0, 0, 2, 0, $16E)
    %spritemapEntry(0, $1F8, $08, 0, 0, 2, 0, $11A)
    %spritemapEntry(0, $03, $EA, 0, 1, 2, 0, $14D)
    %spritemapEntry(0, $04, $E2, 0, 1, 2, 0, $13D)
    %spritemapEntry(0, $04, $DA, 0, 1, 2, 0, $12D)
    %spritemapEntry(0, $13, $FD, 1, 0, 2, 0, $16F)
    %spritemapEntry(0, $0B, $FD, 1, 0, 2, 0, $16E)
    %spritemapEntry(0, $1FD, $FD, 0, 1, 2, 0, $19F)
    %spritemapEntry(0, $05, $FD, 0, 1, 2, 0, $19E)
    %spritemapEntry(0, $1A, $F5, 1, 0, 2, 0, $18D)
    %spritemapEntry(0, $1A, $FD, 1, 0, 2, 0, $17D)
endif ; !FEATURE_KEEP_UNREFERENCED

Spitemaps_PirateNinja_2D:
    dw $0004
    %spritemapEntry(1, $1FA, $00, 0, 0, 2, 0, $182)
    %spritemapEntry(1, $1EA, $00, 0, 0, 2, 0, $180)
    %spritemapEntry(1, $1FA, $F0, 0, 0, 2, 0, $162)
    %spritemapEntry(1, $1EA, $F0, 0, 0, 2, 0, $160)

Spitemaps_PirateNinja_2E:
    dw $0006
    %spritemapEntry(0, $1F5, $10, 0, 0, 2, 0, $1A5)
    %spritemapEntry(0, $1FD, $10, 0, 0, 2, 0, $1A6)
    %spritemapEntry(1, $1FD, $00, 0, 0, 2, 0, $186)
    %spritemapEntry(1, $1ED, $00, 0, 0, 2, 0, $184)
    %spritemapEntry(1, $1FD, $F0, 0, 0, 2, 0, $166)
    %spritemapEntry(1, $1ED, $F0, 0, 0, 2, 0, $164)

Spitemaps_PirateNinja_2E_miscount:
    dw $0005
    %spritemapEntry(0, $0C, $FE, 0, 0, 2, 0, $17C)
    %spritemapEntry(1, $1FC, $06, 0, 0, 2, 0, $18A)
    %spritemapEntry(1, $1EC, $06, 0, 0, 2, 0, $188)
    %spritemapEntry(1, $1FC, $F6, 0, 0, 2, 0, $16A)
    %spritemapEntry(1, $1EC, $F6, 0, 0, 2, 0, $168)

Spitemaps_PirateNinja_2F:
    dw $0007
    %spritemapEntry(0, $10, $FA, 1, 1, 2, 0, $1A7)
    %spritemapEntry(1, $1F0, $F2, 1, 1, 2, 0, $1AA)
    %spritemapEntry(1, $00, $F2, 1, 1, 2, 0, $1A8)
    %spritemapEntry(0, $1F0, $02, 1, 1, 2, 0, $1B4)
    %spritemapEntry(0, $08, $02, 1, 1, 2, 0, $1B1)
    %spritemapEntry(0, $10, $02, 1, 1, 2, 0, $1B0)
    %spritemapEntry(1, $1F8, $02, 1, 1, 2, 0, $1A2)

Spitemaps_PirateNinja_30:
    dw $0004
    %spritemapEntry(1, $1F6, $F0, 1, 1, 2, 0, $182)
    %spritemapEntry(1, $06, $F0, 1, 1, 2, 0, $180)
    %spritemapEntry(1, $1F6, $00, 1, 1, 2, 0, $162)
    %spritemapEntry(1, $06, $00, 1, 1, 2, 0, $160)

Spitemaps_PirateNinja_31:
    dw $0006
    %spritemapEntry(0, $04, $E8, 1, 1, 2, 0, $1A5)
    %spritemapEntry(0, $1FC, $E8, 1, 1, 2, 0, $1A6)
    %spritemapEntry(1, $1F4, $F0, 1, 1, 2, 0, $186)
    %spritemapEntry(1, $04, $F0, 1, 1, 2, 0, $184)
    %spritemapEntry(1, $1F4, $00, 1, 1, 2, 0, $166)
    %spritemapEntry(1, $04, $00, 1, 1, 2, 0, $164)

Spitemaps_PirateNinja_32:
    dw $0005
    %spritemapEntry(0, $1EC, $FA, 1, 1, 2, 0, $17C)
    %spritemapEntry(1, $1F4, $EA, 1, 1, 2, 0, $18A)
    %spritemapEntry(1, $04, $EA, 1, 1, 2, 0, $188)
    %spritemapEntry(1, $1F4, $FA, 1, 1, 2, 0, $16A)
    %spritemapEntry(1, $04, $FA, 1, 1, 2, 0, $168)

Spitemaps_PirateNinja_33:
    dw $0007
    %spritemapEntry(0, $1E9, $FE, 0, 0, 2, 0, $1A7)
    %spritemapEntry(1, $01, $FE, 0, 0, 2, 0, $1AA)
    %spritemapEntry(1, $1F1, $FE, 0, 0, 2, 0, $1A8)
    %spritemapEntry(0, $09, $F6, 0, 0, 2, 0, $1B4)
    %spritemapEntry(0, $1F1, $F6, 0, 0, 2, 0, $1B1)
    %spritemapEntry(0, $1E9, $F6, 0, 0, 2, 0, $1B0)
    %spritemapEntry(1, $1F9, $EE, 0, 0, 2, 0, $1A2)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spitemaps_SpacePirate_B2C81F:
    dw $000D
    %spritemapEntry(1, $1F9, $FC, 0, 0, 2, 0, $127)
    %spritemapEntry(1, $01, $FC, 0, 0, 2, 0, $128)
    %spritemapEntry(0, $1F1, $F7, 0, 0, 2, 0, $14D)
    %spritemapEntry(0, $1F1, $EF, 0, 0, 2, 0, $13D)
    %spritemapEntry(0, $1F1, $E7, 0, 0, 2, 0, $12D)
    %spritemapEntry(0, $06, $FB, 0, 1, 2, 0, $112)
    %spritemapEntry(0, $06, $F3, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $1FA, $EB, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $03, $F9, 0, 1, 2, 0, $142)
    %spritemapEntry(0, $1FB, $F1, 0, 1, 2, 0, $141)
    %spritemapEntry(0, $03, $F1, 0, 1, 2, 0, $140)
    %spritemapEntry(0, $1FB, $F9, 0, 1, 2, 0, $147)
    %spritemapEntry(1, $1F1, $F0, 0, 0, 2, 0, $100)

UNUSED_Spitemaps_SpacePirate_B2C862:
    dw $000E
    %spritemapEntry(0, $1F0, $F7, 0, 0, 2, 0, $14D)
    %spritemapEntry(0, $1F0, $EF, 0, 0, 2, 0, $13D)
    %spritemapEntry(0, $1F0, $E7, 0, 0, 2, 0, $12D)
    %spritemapEntry(1, $1FE, $EB, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $1F1, $F0, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $03, $F9, 0, 1, 2, 0, $142)
    %spritemapEntry(0, $1FB, $F1, 0, 1, 2, 0, $141)
    %spritemapEntry(0, $03, $F1, 0, 1, 2, 0, $140)
    %spritemapEntry(0, $1FB, $F9, 0, 1, 2, 0, $147)
    %spritemapEntry(0, $08, $FD, 1, 0, 2, 0, $14D)
    %spritemapEntry(0, $08, $05, 1, 0, 2, 0, $13D)
    %spritemapEntry(0, $08, $0D, 1, 0, 2, 0, $12D)
    %spritemapEntry(0, $06, $FB, 0, 1, 2, 0, $112)
    %spritemapEntry(0, $06, $F3, 0, 1, 2, 0, $102)

UNUSED_Spitemaps_SpacePirate_B2C8AA:
    dw $0014
    %spritemapEntry(0, $00, $F2, 0, 1, 2, 0, $14F)
    %spritemapEntry(0, $08, $F1, 0, 1, 2, 0, $14E)
    %spritemapEntry(0, $0C, $EE, 0, 1, 2, 0, $14D)
    %spritemapEntry(0, $0C, $E6, 0, 1, 2, 0, $13D)
    %spritemapEntry(0, $0C, $DE, 0, 1, 2, 0, $12D)
    %spritemapEntry(1, $1FB, $F1, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $02, $EB, 0, 1, 2, 0, $10E)
    %spritemapEntry(0, $0C, $F0, 0, 1, 2, 0, $13D)
    %spritemapEntry(0, $0C, $F8, 0, 1, 2, 0, $14D)
    %spritemapEntry(1, $02, $F1, 0, 1, 2, 0, $100)
    %spritemapEntry(1, $1F9, $FF, 0, 1, 2, 0, $107)
    %spritemapEntry(0, $1F4, $11, 0, 1, 2, 0, $144)
    %spritemapEntry(0, $1F4, $09, 0, 1, 2, 0, $143)
    %spritemapEntry(0, $01, $09, 1, 0, 2, 0, $149)
    %spritemapEntry(0, $1F9, $09, 1, 0, 2, 0, $148)
    %spritemapEntry(1, $1FC, $FF, 0, 1, 2, 0, $107)
    %spritemapEntry(0, $03, $0B, 1, 0, 2, 0, $149)
    %spritemapEntry(0, $1FB, $0B, 1, 0, 2, 0, $148)
    %spritemapEntry(0, $1FA, $13, 0, 1, 2, 0, $144)
    %spritemapEntry(0, $1FA, $0B, 0, 1, 2, 0, $143)
endif ; !FEATURE_KEEP_UNREFERENCED

Spitemaps_PirateNinja_34:
    dw $0004
    %spritemapEntry(1, $1F6, $00, 0, 1, 2, 0, $182)
    %spritemapEntry(1, $06, $00, 0, 1, 2, 0, $180)
    %spritemapEntry(1, $1F6, $F0, 0, 1, 2, 0, $162)
    %spritemapEntry(1, $06, $F0, 0, 1, 2, 0, $160)

Spitemaps_PirateNinja_35:
    dw $0006
    %spritemapEntry(0, $03, $10, 0, 1, 2, 0, $1A5)
    %spritemapEntry(0, $1FB, $10, 0, 1, 2, 0, $1A6)
    %spritemapEntry(1, $1F3, $00, 0, 1, 2, 0, $186)
    %spritemapEntry(1, $03, $00, 0, 1, 2, 0, $184)
    %spritemapEntry(1, $1F3, $F0, 0, 1, 2, 0, $166)
    %spritemapEntry(1, $03, $F0, 0, 1, 2, 0, $164)

Spitemaps_PirateNinja_36:
    dw $0005
    %spritemapEntry(0, $1EC, $FE, 0, 1, 2, 0, $17C)
    %spritemapEntry(1, $1F4, $06, 0, 1, 2, 0, $18A)
    %spritemapEntry(1, $04, $06, 0, 1, 2, 0, $188)
    %spritemapEntry(1, $1F4, $F6, 0, 1, 2, 0, $16A)
    %spritemapEntry(1, $04, $F6, 0, 1, 2, 0, $168)

Spitemaps_PirateNinja_37:
    dw $0007
    %spritemapEntry(0, $1E8, $FA, 1, 0, 2, 0, $1A7)
    %spritemapEntry(1, $00, $F2, 1, 0, 2, 0, $1AA)
    %spritemapEntry(1, $1F0, $F2, 1, 0, 2, 0, $1A8)
    %spritemapEntry(0, $08, $02, 1, 0, 2, 0, $1B4)
    %spritemapEntry(0, $1F0, $02, 1, 0, 2, 0, $1B1)
    %spritemapEntry(0, $1E8, $02, 1, 0, 2, 0, $1B0)
    %spritemapEntry(1, $1F8, $02, 1, 0, 2, 0, $1A2)

Spitemaps_PirateNinja_38:
    dw $0004
    %spritemapEntry(1, $1FA, $F0, 1, 0, 2, 0, $182)
    %spritemapEntry(1, $1EA, $F0, 1, 0, 2, 0, $180)
    %spritemapEntry(1, $1FA, $00, 1, 0, 2, 0, $162)
    %spritemapEntry(1, $1EA, $00, 1, 0, 2, 0, $160)

Spitemaps_PirateNinja_39:
    dw $0006
    %spritemapEntry(0, $1F4, $E8, 1, 0, 2, 0, $1A5)
    %spritemapEntry(0, $1FC, $E8, 1, 0, 2, 0, $1A6)
    %spritemapEntry(1, $1FC, $F0, 1, 0, 2, 0, $186)
    %spritemapEntry(1, $1EC, $F0, 1, 0, 2, 0, $184)
    %spritemapEntry(1, $1FC, $00, 1, 0, 2, 0, $166)
    %spritemapEntry(1, $1EC, $00, 1, 0, 2, 0, $164)

Spitemaps_PirateNinja_3A:
    dw $0005
    %spritemapEntry(0, $0C, $FA, 1, 0, 2, 0, $17C)
    %spritemapEntry(1, $1FC, $EA, 1, 0, 2, 0, $18A)
    %spritemapEntry(1, $1EC, $EA, 1, 0, 2, 0, $188)
    %spritemapEntry(1, $1FC, $FA, 1, 0, 2, 0, $16A)
    %spritemapEntry(1, $1EC, $FA, 1, 0, 2, 0, $168)

Spitemaps_PirateNinja_3B:
    dw $0007
    %spritemapEntry(0, $0F, $FE, 0, 1, 2, 0, $1A7)
    %spritemapEntry(1, $1EF, $FE, 0, 1, 2, 0, $1AA)
    %spritemapEntry(1, $1FF, $FE, 0, 1, 2, 0, $1A8)
    %spritemapEntry(0, $1EF, $F6, 0, 1, 2, 0, $1B4)
    %spritemapEntry(0, $07, $F6, 0, 1, 2, 0, $1B1)
    %spritemapEntry(0, $0F, $F6, 0, 1, 2, 0, $1B0)
    %spritemapEntry(1, $1F7, $EE, 0, 1, 2, 0, $1A2)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spitemaps_SpacePirate_B2C9FC:
    dw $0008
    %spritemapEntry(0, $1EF, $FD, 0, 0, 2, 0, $14D)
    %spritemapEntry(0, $1EF, $F5, 0, 0, 2, 0, $13D)
    %spritemapEntry(0, $1EF, $ED, 0, 0, 2, 0, $12D)
    %spritemapEntry(1, $1F4, $F3, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $1F8, $F0, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1F1, $EA, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $1EF, $E6, 0, 0, 2, 0, $13D)
    %spritemapEntry(0, $1EF, $DE, 0, 0, 2, 0, $12D)

UNUSED_Spitemaps_SpacePirate_B2CA26:
    dw $0009
    %spritemapEntry(0, $1FC, $F3, 0, 0, 2, 0, $14F)
    %spritemapEntry(0, $1F4, $F4, 0, 0, 2, 0, $14E)
    %spritemapEntry(0, $1EF, $F9, 0, 0, 2, 0, $14D)
    %spritemapEntry(0, $1EF, $F1, 0, 0, 2, 0, $13D)
    %spritemapEntry(0, $1EF, $E9, 0, 0, 2, 0, $12D)
    %spritemapEntry(1, $1F8, $F0, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1F1, $EA, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $1EF, $EA, 0, 0, 2, 0, $13D)
    %spritemapEntry(0, $1EF, $E2, 0, 0, 2, 0, $12D)

UNUSED_Spitemaps_SpacePirate_B2CA55:
    dw $0008
    %spritemapEntry(0, $1EF, $F3, 0, 0, 2, 0, $14D)
    %spritemapEntry(0, $1EF, $EB, 0, 0, 2, 0, $13D)
    %spritemapEntry(0, $1EF, $E3, 0, 0, 2, 0, $12D)
    %spritemapEntry(0, $1FB, $F3, 0, 0, 2, 0, $14F)
    %spritemapEntry(0, $1F3, $F3, 0, 0, 2, 0, $14E)
    %spritemapEntry(1, $1F8, $F0, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1F1, $EA, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $1EF, $E1, 0, 0, 2, 0, $12D)

UNUSED_Spitemaps_SpacePirate_B2CA7F:
    dw $000A
    %spritemapEntry(0, $1FB, $F1, 0, 0, 2, 0, $14F)
    %spritemapEntry(0, $1F3, $F0, 0, 0, 2, 0, $14E)
    %spritemapEntry(0, $1EF, $ED, 0, 0, 2, 0, $14D)
    %spritemapEntry(0, $1EF, $E5, 0, 0, 2, 0, $13D)
    %spritemapEntry(0, $1EF, $DD, 0, 0, 2, 0, $12D)
    %spritemapEntry(1, $1F8, $F0, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1F1, $EA, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $1EF, $EF, 0, 0, 2, 0, $13D)
    %spritemapEntry(0, $1EF, $F7, 0, 0, 2, 0, $14D)
    %spritemapEntry(1, $1F1, $F0, 0, 0, 2, 0, $100)

UNUSED_Spitemaps_SpacePirate_B2CAB3:
    dw $0009
    %spritemapEntry(1, $1F4, $EB, 1, 1, 2, 0, $105)
    %spritemapEntry(0, $1EF, $EB, 0, 0, 2, 0, $14D)
    %spritemapEntry(0, $1EF, $E3, 0, 0, 2, 0, $13D)
    %spritemapEntry(0, $1EF, $DB, 0, 0, 2, 0, $12D)
    %spritemapEntry(1, $1F8, $F0, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1F1, $EA, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $1EF, $F1, 0, 0, 2, 0, $13D)
    %spritemapEntry(0, $1EF, $F9, 0, 0, 2, 0, $14D)
    %spritemapEntry(1, $1F1, $F2, 0, 0, 2, 0, $100)

UNUSED_Spitemaps_SpacePirate_B2CAE2:
    dw $000A
    %spritemapEntry(0, $1F4, $19, 0, 0, 2, 0, $146)
    %spritemapEntry(0, $1F7, $13, 0, 0, 2, 0, $119)
    %spritemapEntry(0, $1F7, $0B, 0, 0, 2, 0, $109)
    %spritemapEntry(1, $1F9, $FE, 0, 0, 2, 0, $107)
    %spritemapEntry(0, $1EC, $19, 0, 0, 2, 0, $145)
    %spritemapEntry(0, $1F5, $FE, 0, 0, 2, 0, $131)
    %spritemapEntry(0, $1F5, $F6, 0, 0, 2, 0, $121)
    %spritemapEntry(1, $1F6, $F5, 1, 1, 2, 0, $10C)
    %spritemapEntry(0, $1F4, $05, 0, 0, 2, 0, $146)
    %spritemapEntry(0, $1EC, $05, 0, 0, 2, 0, $145)

UNUSED_Spitemaps_SpacePirate_B2CB16:
    dw $000C
    %spritemapEntry(0, $00, $FD, 0, 0, 2, 0, $149)
    %spritemapEntry(0, $1F8, $FF, 0, 0, 2, 0, $148)
    %spritemapEntry(0, $1F4, $14, 0, 0, 2, 0, $146)
    %spritemapEntry(0, $1EC, $14, 0, 0, 2, 0, $145)
    %spritemapEntry(0, $00, $FB, 0, 0, 2, 0, $149)
    %spritemapEntry(0, $1F8, $F9, 0, 0, 2, 0, $148)
    %spritemapEntry(0, $1F5, $0D, 0, 0, 2, 0, $11A)
    %spritemapEntry(0, $1F5, $05, 0, 0, 2, 0, $10A)
    %spritemapEntry(0, $1F5, $02, 0, 0, 2, 0, $131)
    %spritemapEntry(0, $1F5, $FA, 0, 0, 2, 0, $121)
    %spritemapEntry(0, $1F4, $09, 0, 0, 2, 0, $146)
    %spritemapEntry(0, $1EC, $09, 0, 0, 2, 0, $145)

UNUSED_Spitemaps_SpacePirate_B2CB54:
    dw $000C
    %spritemapEntry(0, $00, $F9, 0, 0, 2, 0, $149)
    %spritemapEntry(0, $1F8, $FB, 0, 0, 2, 0, $148)
    %spritemapEntry(0, $1F4, $10, 0, 0, 2, 0, $146)
    %spritemapEntry(0, $1EC, $10, 0, 0, 2, 0, $145)
    %spritemapEntry(0, $00, $FB, 0, 0, 2, 0, $149)
    %spritemapEntry(0, $1F8, $F9, 0, 0, 2, 0, $148)
    %spritemapEntry(0, $1F5, $09, 0, 0, 2, 0, $11A)
    %spritemapEntry(0, $1F5, $01, 0, 0, 2, 0, $10A)
    %spritemapEntry(0, $1F5, $06, 0, 0, 2, 0, $131)
    %spritemapEntry(0, $1F5, $FE, 0, 0, 2, 0, $121)
    %spritemapEntry(0, $1F4, $0D, 0, 0, 2, 0, $146)
    %spritemapEntry(0, $1EC, $0D, 0, 0, 2, 0, $145)

UNUSED_Spitemaps_SpacePirate_B2CB92:
    dw $000C
    %spritemapEntry(0, $1F3, $03, 0, 0, 2, 0, $131)
    %spritemapEntry(0, $1F3, $FB, 0, 0, 2, 0, $121)
    %spritemapEntry(0, $1F4, $0A, 0, 0, 2, 0, $146)
    %spritemapEntry(0, $1EC, $0A, 0, 0, 2, 0, $145)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 0, $149)
    %spritemapEntry(0, $1F8, $FA, 0, 0, 2, 0, $148)
    %spritemapEntry(0, $00, $FE, 0, 0, 2, 0, $149)
    %spritemapEntry(0, $1F8, $00, 0, 0, 2, 0, $148)
    %spritemapEntry(0, $1F4, $12, 0, 0, 2, 0, $146)
    %spritemapEntry(0, $1EC, $12, 0, 0, 2, 0, $145)
    %spritemapEntry(0, $1F5, $0C, 0, 0, 2, 0, $11A)
    %spritemapEntry(0, $1F5, $04, 0, 0, 2, 0, $10A)

UNUSED_Spitemaps_SpacePirate_B2CBD0:
    dw $000A
    %spritemapEntry(0, $1F5, $00, 0, 0, 2, 0, $131)
    %spritemapEntry(0, $1F5, $F8, 0, 0, 2, 0, $121)
    %spritemapEntry(1, $1F7, $F6, 1, 1, 2, 0, $10C)
    %spritemapEntry(0, $1F4, $07, 0, 0, 2, 0, $146)
    %spritemapEntry(0, $1EC, $07, 0, 0, 2, 0, $145)
    %spritemapEntry(0, $1F4, $16, 0, 0, 2, 0, $146)
    %spritemapEntry(0, $1F6, $10, 0, 0, 2, 0, $119)
    %spritemapEntry(0, $1F6, $08, 0, 0, 2, 0, $109)
    %spritemapEntry(1, $1F8, $FD, 0, 0, 2, 0, $107)
    %spritemapEntry(0, $1EC, $16, 0, 0, 2, 0, $145)
endif ; !FEATURE_KEEP_UNREFERENCED

Spitemaps_PirateNinja_3C:
    dw $0014
    %spritemapEntry(0, $07, $FE, 0, 1, 2, 0, $15D)
    %spritemapEntry(0, $07, $F6, 0, 1, 2, 0, $15C)
    %spritemapEntry(0, $07, $EE, 0, 1, 2, 0, $15B)
    %spritemapEntry(0, $1FF, $14, 0, 1, 2, 0, $15A)
    %spritemapEntry(0, $1FF, $FE, 0, 1, 2, 0, $157)
    %spritemapEntry(0, $1FF, $0C, 0, 1, 2, 0, $159)
    %spritemapEntry(0, $1FF, $06, 0, 1, 2, 0, $158)
    %spritemapEntry(0, $1FF, $F8, 0, 1, 2, 0, $156)
    %spritemapEntry(0, $1FF, $F0, 0, 1, 2, 0, $155)
    %spritemapEntry(0, $1FF, $E8, 0, 1, 2, 0, $154)
    %spritemapEntry(0, $1F0, $00, 0, 0, 2, 0, $15D)
    %spritemapEntry(0, $1F0, $F8, 0, 0, 2, 0, $15C)
    %spritemapEntry(0, $1F0, $F0, 0, 0, 2, 0, $15B)
    %spritemapEntry(0, $1F8, $18, 0, 0, 2, 0, $15A)
    %spritemapEntry(0, $1F8, $00, 0, 0, 2, 0, $157)
    %spritemapEntry(0, $1F8, $10, 0, 0, 2, 0, $159)
    %spritemapEntry(0, $1F8, $08, 0, 0, 2, 0, $158)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $156)
    %spritemapEntry(0, $1F8, $F0, 0, 0, 2, 0, $155)
    %spritemapEntry(0, $1F8, $E8, 0, 0, 2, 0, $154)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spitemaps_SpacePirate_B2CC6A:
    dw $000D
    %spritemapEntry(1, $1F9, $FC, 0, 0, 2, 0, $127)
    %spritemapEntry(1, $01, $FC, 0, 0, 2, 0, $128)
    %spritemapEntry(0, $1F1, $F7, 0, 0, 2, 0, $14D)
    %spritemapEntry(0, $1F1, $EF, 0, 0, 2, 0, $13D)
    %spritemapEntry(0, $1F1, $E7, 0, 0, 2, 0, $12D)
    %spritemapEntry(0, $06, $FB, 0, 1, 2, 0, $112)
    %spritemapEntry(0, $06, $F3, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $1FA, $EB, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $03, $F9, 0, 1, 2, 0, $142)
    %spritemapEntry(0, $1FB, $F1, 0, 1, 2, 0, $141)
    %spritemapEntry(0, $03, $F1, 0, 1, 2, 0, $140)
    %spritemapEntry(0, $1FB, $F9, 0, 1, 2, 0, $147)
    %spritemapEntry(1, $1F1, $F0, 0, 0, 2, 0, $100)

UNUSED_Spitemaps_SpacePirate_B2CCAD:
    dw $000E
    %spritemapEntry(0, $1F0, $F7, 0, 0, 2, 0, $14D)
    %spritemapEntry(0, $1F0, $EF, 0, 0, 2, 0, $13D)
    %spritemapEntry(0, $1F0, $E7, 0, 0, 2, 0, $12D)
    %spritemapEntry(1, $1FE, $EB, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $1F1, $F0, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $03, $F9, 0, 1, 2, 0, $142)
    %spritemapEntry(0, $1FB, $F1, 0, 1, 2, 0, $141)
    %spritemapEntry(0, $03, $F1, 0, 1, 2, 0, $140)
    %spritemapEntry(0, $1FB, $F9, 0, 1, 2, 0, $147)
    %spritemapEntry(0, $08, $FD, 1, 0, 2, 0, $14D)
    %spritemapEntry(0, $08, $05, 1, 0, 2, 0, $13D)
    %spritemapEntry(0, $08, $0D, 1, 0, 2, 0, $12D)
    %spritemapEntry(0, $06, $FB, 0, 1, 2, 0, $112)
    %spritemapEntry(0, $06, $F3, 0, 1, 2, 0, $102)

UNUSED_Spitemaps_SpacePirate_B2CCF5:
    dw $0014
    %spritemapEntry(0, $00, $F2, 0, 1, 2, 0, $14F)
    %spritemapEntry(0, $08, $F1, 0, 1, 2, 0, $14E)
    %spritemapEntry(0, $0C, $EE, 0, 1, 2, 0, $14D)
    %spritemapEntry(0, $0C, $E6, 0, 1, 2, 0, $13D)
    %spritemapEntry(0, $0C, $DE, 0, 1, 2, 0, $12D)
    %spritemapEntry(1, $1FB, $F1, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $02, $EB, 0, 1, 2, 0, $10E)
    %spritemapEntry(0, $0C, $F0, 0, 1, 2, 0, $13D)
    %spritemapEntry(0, $0C, $F8, 0, 1, 2, 0, $14D)
    %spritemapEntry(1, $02, $F1, 0, 1, 2, 0, $100)
    %spritemapEntry(1, $1F9, $FF, 0, 1, 2, 0, $107)
    %spritemapEntry(0, $1F4, $11, 0, 1, 2, 0, $144)
    %spritemapEntry(0, $1F4, $09, 0, 1, 2, 0, $143)
    %spritemapEntry(0, $01, $09, 1, 0, 2, 0, $149)
    %spritemapEntry(0, $1F9, $09, 1, 0, 2, 0, $148)
    %spritemapEntry(1, $1FC, $FF, 0, 1, 2, 0, $107)
    %spritemapEntry(0, $03, $0B, 1, 0, 2, 0, $149)
    %spritemapEntry(0, $1FB, $0B, 1, 0, 2, 0, $148)
    %spritemapEntry(0, $1FA, $13, 0, 1, 2, 0, $144)
    %spritemapEntry(0, $1FA, $0B, 0, 1, 2, 0, $143)

UNUSED_Spitemaps_SpacePirate_B2CD5B:
    dw $0010
    %spritemapEntry(0, $08, $FC, 0, 1, 2, 0, $14D)
    %spritemapEntry(0, $09, $F4, 0, 1, 2, 0, $13D)
    %spritemapEntry(0, $0A, $EC, 0, 1, 2, 0, $12D)
    %spritemapEntry(0, $0B, $FD, 0, 1, 2, 0, $14D)
    %spritemapEntry(0, $0C, $F5, 0, 1, 2, 0, $13D)
    %spritemapEntry(0, $0D, $ED, 0, 1, 2, 0, $12D)
    %spritemapEntry(1, $1FD, $F3, 0, 1, 2, 0, $100)
    %spritemapEntry(1, $1F9, $F0, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $00, $EA, 0, 1, 2, 0, $10E)
    %spritemapEntry(0, $1FA, $0B, 0, 1, 2, 0, $144)
    %spritemapEntry(0, $1FA, $03, 0, 1, 2, 0, $143)
    %spritemapEntry(0, $1FE, $09, 0, 1, 2, 0, $146)
    %spritemapEntry(0, $06, $09, 0, 1, 2, 0, $145)
    %spritemapEntry(0, $1FB, $FE, 0, 1, 2, 0, $149)
    %spritemapEntry(0, $03, $FD, 0, 1, 2, 0, $148)
    %spritemapEntry(1, $1FD, $FF, 0, 1, 2, 0, $122)

UNUSED_Spitemaps_SpacePirate_B2CDAD:
    dw $0008
    %spritemapEntry(0, $09, $FD, 0, 1, 2, 0, $14D)
    %spritemapEntry(0, $09, $F5, 0, 1, 2, 0, $13D)
    %spritemapEntry(0, $09, $ED, 0, 1, 2, 0, $12D)
    %spritemapEntry(1, $1FC, $F3, 0, 1, 2, 0, $100)
    %spritemapEntry(1, $1F8, $F0, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $1FF, $EA, 0, 1, 2, 0, $10E)
    %spritemapEntry(0, $09, $E6, 0, 1, 2, 0, $13D)
    %spritemapEntry(0, $09, $DE, 0, 1, 2, 0, $12D)

UNUSED_Spitemaps_SpacePirate_B2CDD7:
    dw $0009
    %spritemapEntry(0, $1FC, $F3, 0, 1, 2, 0, $14F)
    %spritemapEntry(0, $04, $F4, 0, 1, 2, 0, $14E)
    %spritemapEntry(0, $09, $F9, 0, 1, 2, 0, $14D)
    %spritemapEntry(0, $09, $F1, 0, 1, 2, 0, $13D)
    %spritemapEntry(0, $09, $E9, 0, 1, 2, 0, $12D)
    %spritemapEntry(1, $1F8, $F0, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $1FF, $EA, 0, 1, 2, 0, $10E)
    %spritemapEntry(0, $09, $EA, 0, 1, 2, 0, $13D)
    %spritemapEntry(0, $09, $E2, 0, 1, 2, 0, $12D)

UNUSED_Spitemaps_SpacePirate_B2CE06:
    dw $0008
    %spritemapEntry(0, $09, $F3, 0, 1, 2, 0, $14D)
    %spritemapEntry(0, $09, $EB, 0, 1, 2, 0, $13D)
    %spritemapEntry(0, $09, $E3, 0, 1, 2, 0, $12D)
    %spritemapEntry(0, $1FD, $F3, 0, 1, 2, 0, $14F)
    %spritemapEntry(0, $05, $F3, 0, 1, 2, 0, $14E)
    %spritemapEntry(1, $1F8, $F0, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $1FF, $EA, 0, 1, 2, 0, $10E)
    %spritemapEntry(0, $09, $E1, 0, 1, 2, 0, $12D)

UNUSED_Spitemaps_SpacePirate_B2CE30:
    dw $000A
    %spritemapEntry(0, $1FD, $F1, 0, 1, 2, 0, $14F)
    %spritemapEntry(0, $05, $F0, 0, 1, 2, 0, $14E)
    %spritemapEntry(0, $09, $ED, 0, 1, 2, 0, $14D)
    %spritemapEntry(0, $09, $E5, 0, 1, 2, 0, $13D)
    %spritemapEntry(0, $09, $DD, 0, 1, 2, 0, $12D)
    %spritemapEntry(1, $1F8, $F0, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $1FF, $EA, 0, 1, 2, 0, $10E)
    %spritemapEntry(0, $09, $EF, 0, 1, 2, 0, $13D)
    %spritemapEntry(0, $09, $F7, 0, 1, 2, 0, $14D)
    %spritemapEntry(1, $1FF, $F0, 0, 1, 2, 0, $100)

UNUSED_Spitemaps_SpacePirate_B2CE64:
    dw $0009
    %spritemapEntry(1, $1FC, $EB, 1, 0, 2, 0, $105)
    %spritemapEntry(0, $09, $EB, 0, 1, 2, 0, $14D)
    %spritemapEntry(0, $09, $E3, 0, 1, 2, 0, $13D)
    %spritemapEntry(0, $09, $DB, 0, 1, 2, 0, $12D)
    %spritemapEntry(1, $1F8, $F0, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $1FF, $EA, 0, 1, 2, 0, $10E)
    %spritemapEntry(0, $09, $F1, 0, 1, 2, 0, $13D)
    %spritemapEntry(0, $09, $F9, 0, 1, 2, 0, $14D)
    %spritemapEntry(1, $1FF, $F2, 0, 1, 2, 0, $100)

UNUSED_Spitemaps_SpacePirate_B2CE93:
    dw $000A
    %spritemapEntry(0, $04, $19, 0, 1, 2, 0, $146)
    %spritemapEntry(0, $01, $13, 0, 1, 2, 0, $119)
    %spritemapEntry(0, $01, $0B, 0, 1, 2, 0, $109)
    %spritemapEntry(1, $1F7, $FE, 0, 1, 2, 0, $107)
    %spritemapEntry(0, $0C, $19, 0, 1, 2, 0, $145)
    %spritemapEntry(0, $03, $FE, 0, 1, 2, 0, $131)
    %spritemapEntry(0, $03, $F6, 0, 1, 2, 0, $121)
    %spritemapEntry(1, $1FA, $F5, 1, 0, 2, 0, $10C)
    %spritemapEntry(0, $04, $05, 0, 1, 2, 0, $146)
    %spritemapEntry(0, $0C, $05, 0, 1, 2, 0, $145)

UNUSED_Spitemaps_SpacePirate_B2CEC7:
    dw $000C
    %spritemapEntry(0, $1F8, $FD, 0, 1, 2, 0, $149)
    %spritemapEntry(0, $00, $FF, 0, 1, 2, 0, $148)
    %spritemapEntry(0, $04, $14, 0, 1, 2, 0, $146)
    %spritemapEntry(0, $0C, $14, 0, 1, 2, 0, $145)
    %spritemapEntry(0, $1F8, $FB, 0, 1, 2, 0, $149)
    %spritemapEntry(0, $00, $F9, 0, 1, 2, 0, $148)
    %spritemapEntry(0, $03, $0D, 0, 1, 2, 0, $11A)
    %spritemapEntry(0, $03, $05, 0, 1, 2, 0, $10A)
    %spritemapEntry(0, $03, $02, 0, 1, 2, 0, $131)
    %spritemapEntry(0, $03, $FA, 0, 1, 2, 0, $121)
    %spritemapEntry(0, $04, $09, 0, 1, 2, 0, $146)
    %spritemapEntry(0, $0C, $09, 0, 1, 2, 0, $145)

UNUSED_Spitemaps_SpacePirate_B2CF05:
    dw $000C
    %spritemapEntry(0, $1F8, $F9, 0, 1, 2, 0, $149)
    %spritemapEntry(0, $00, $FB, 0, 1, 2, 0, $148)
    %spritemapEntry(0, $04, $10, 0, 1, 2, 0, $146)
    %spritemapEntry(0, $0C, $10, 0, 1, 2, 0, $145)
    %spritemapEntry(0, $1F8, $FB, 0, 1, 2, 0, $149)
    %spritemapEntry(0, $00, $F9, 0, 1, 2, 0, $148)
    %spritemapEntry(0, $03, $09, 0, 1, 2, 0, $11A)
    %spritemapEntry(0, $03, $01, 0, 1, 2, 0, $10A)
    %spritemapEntry(0, $03, $06, 0, 1, 2, 0, $131)
    %spritemapEntry(0, $03, $FE, 0, 1, 2, 0, $121)
    %spritemapEntry(0, $04, $0D, 0, 1, 2, 0, $146)
    %spritemapEntry(0, $0C, $0D, 0, 1, 2, 0, $145)

UNUSED_Spitemaps_SpacePirate_B2CF43:
    dw $000C
    %spritemapEntry(0, $05, $03, 0, 1, 2, 0, $131)
    %spritemapEntry(0, $05, $FB, 0, 1, 2, 0, $121)
    %spritemapEntry(0, $04, $0A, 0, 1, 2, 0, $146)
    %spritemapEntry(0, $0C, $0A, 0, 1, 2, 0, $145)
    %spritemapEntry(0, $1F8, $FC, 0, 1, 2, 0, $149)
    %spritemapEntry(0, $00, $FA, 0, 1, 2, 0, $148)
    %spritemapEntry(0, $1F8, $FE, 0, 1, 2, 0, $149)
    %spritemapEntry(0, $00, $00, 0, 1, 2, 0, $148)
    %spritemapEntry(0, $04, $12, 0, 1, 2, 0, $146)
    %spritemapEntry(0, $0C, $12, 0, 1, 2, 0, $145)
    %spritemapEntry(0, $03, $0C, 0, 1, 2, 0, $11A)
    %spritemapEntry(0, $03, $04, 0, 1, 2, 0, $10A)

UNUSED_Spitemaps_SpacePirate_B2CF81:
    dw $000A
    %spritemapEntry(0, $03, $00, 0, 1, 2, 0, $131)
    %spritemapEntry(0, $03, $F8, 0, 1, 2, 0, $121)
    %spritemapEntry(1, $1F9, $F6, 1, 0, 2, 0, $10C)
    %spritemapEntry(0, $04, $07, 0, 1, 2, 0, $146)
    %spritemapEntry(0, $0C, $07, 0, 1, 2, 0, $145)
    %spritemapEntry(0, $04, $16, 0, 1, 2, 0, $146)
    %spritemapEntry(0, $02, $10, 0, 1, 2, 0, $119)
    %spritemapEntry(0, $02, $08, 0, 1, 2, 0, $109)
    %spritemapEntry(1, $1F8, $FD, 0, 1, 2, 0, $107)
    %spritemapEntry(0, $0C, $16, 0, 1, 2, 0, $145)

UNUSED_Spitemaps_SpacePirate_B2CFB5:
    dw $000D
    %spritemapEntry(1, $1F7, $FC, 0, 1, 2, 0, $127)
    %spritemapEntry(1, $1EF, $FC, 0, 1, 2, 0, $128)
    %spritemapEntry(0, $07, $F7, 0, 1, 2, 0, $14D)
    %spritemapEntry(0, $07, $EF, 0, 1, 2, 0, $13D)
    %spritemapEntry(0, $07, $E7, 0, 1, 2, 0, $12D)
    %spritemapEntry(0, $1F2, $FB, 0, 0, 2, 0, $112)
    %spritemapEntry(0, $1F2, $F3, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F6, $EB, 0, 1, 2, 0, $10E)
    %spritemapEntry(0, $1F5, $F9, 0, 0, 2, 0, $142)
    %spritemapEntry(0, $1FD, $F1, 0, 0, 2, 0, $141)
    %spritemapEntry(0, $1F5, $F1, 0, 0, 2, 0, $140)
    %spritemapEntry(0, $1FD, $F9, 0, 0, 2, 0, $147)
    %spritemapEntry(1, $1FF, $F0, 0, 1, 2, 0, $100)

UNUSED_Spitemaps_SpacePirate_B2CFF8:
    dw $000E
    %spritemapEntry(0, $08, $F7, 0, 1, 2, 0, $14D)
    %spritemapEntry(0, $08, $EF, 0, 1, 2, 0, $13D)
    %spritemapEntry(0, $08, $E7, 0, 1, 2, 0, $12D)
    %spritemapEntry(1, $1F2, $EB, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $1FF, $F0, 0, 1, 2, 0, $100)
    %spritemapEntry(0, $1F5, $F9, 0, 0, 2, 0, $142)
    %spritemapEntry(0, $1FD, $F1, 0, 0, 2, 0, $141)
    %spritemapEntry(0, $1F5, $F1, 0, 0, 2, 0, $140)
    %spritemapEntry(0, $1FD, $F9, 0, 0, 2, 0, $147)
    %spritemapEntry(0, $1F0, $FD, 1, 1, 2, 0, $14D)
    %spritemapEntry(0, $1F0, $05, 1, 1, 2, 0, $13D)
    %spritemapEntry(0, $1F0, $0D, 1, 1, 2, 0, $12D)
    %spritemapEntry(0, $1F2, $FB, 0, 0, 2, 0, $112)
    %spritemapEntry(0, $1F2, $F3, 0, 0, 2, 0, $102)

UNUSED_Spitemaps_SpacePirate_B2D040:
    dw $0014
    %spritemapEntry(0, $1F8, $F2, 0, 0, 2, 0, $14F)
    %spritemapEntry(0, $1F0, $F1, 0, 0, 2, 0, $14E)
    %spritemapEntry(0, $1EC, $EE, 0, 0, 2, 0, $14D)
    %spritemapEntry(0, $1EC, $E6, 0, 0, 2, 0, $13D)
    %spritemapEntry(0, $1EC, $DE, 0, 0, 2, 0, $12D)
    %spritemapEntry(1, $1F5, $F1, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1EE, $EB, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $1EC, $F0, 0, 0, 2, 0, $13D)
    %spritemapEntry(0, $1EC, $F8, 0, 0, 2, 0, $14D)
    %spritemapEntry(1, $1EE, $F1, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $1F7, $FF, 0, 0, 2, 0, $107)
    %spritemapEntry(0, $04, $11, 0, 0, 2, 0, $144)
    %spritemapEntry(0, $04, $09, 0, 0, 2, 0, $143)
    %spritemapEntry(0, $1F7, $09, 1, 1, 2, 0, $149)
    %spritemapEntry(0, $1FF, $09, 1, 1, 2, 0, $148)
    %spritemapEntry(1, $1F4, $FF, 0, 0, 2, 0, $107)
    %spritemapEntry(0, $1F5, $0B, 1, 1, 2, 0, $149)
    %spritemapEntry(0, $1FD, $0B, 1, 1, 2, 0, $148)
    %spritemapEntry(0, $1FE, $13, 0, 0, 2, 0, $144)
    %spritemapEntry(0, $1FE, $0B, 0, 0, 2, 0, $143)

UNUSED_Spitemaps_SpacePirate_B2D0A6:
    dw $0010
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 0, $14D)
    %spritemapEntry(0, $1EF, $F4, 0, 0, 2, 0, $13D)
    %spritemapEntry(0, $1EE, $EC, 0, 0, 2, 0, $12D)
    %spritemapEntry(0, $1ED, $FD, 0, 0, 2, 0, $14D)
    %spritemapEntry(0, $1EC, $F5, 0, 0, 2, 0, $13D)
    %spritemapEntry(0, $1EB, $ED, 0, 0, 2, 0, $12D)
    %spritemapEntry(1, $1F3, $F3, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $1F7, $F0, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1F0, $EA, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $1FE, $0B, 0, 0, 2, 0, $144)
    %spritemapEntry(0, $1FE, $03, 0, 0, 2, 0, $143)
    %spritemapEntry(0, $1FA, $09, 0, 0, 2, 0, $146)
    %spritemapEntry(0, $1F2, $09, 0, 0, 2, 0, $145)
    %spritemapEntry(0, $1FD, $FE, 0, 0, 2, 0, $149)
    %spritemapEntry(0, $1F5, $FD, 0, 0, 2, 0, $148)
    %spritemapEntry(1, $1F3, $FF, 0, 0, 2, 0, $122)

UNUSED_Spitemaps_SpacePirate_B2D0F8:
    dw $000A
    %spritemapEntry(0, $1F5, $13, 0, 0, 2, 0, $130)
    %spritemapEntry(0, $1F4, $0B, 0, 0, 2, 0, $120)
    %spritemapEntry(0, $1F2, $18, 0, 0, 2, 0, $136)
    %spritemapEntry(0, $1EB, $18, 0, 0, 2, 0, $135)
    %spritemapEntry(1, $1F5, $00, 0, 0, 2, 0, $107)
    %spritemapEntry(0, $06, $18, 0, 0, 2, 0, $144)
    %spritemapEntry(0, $06, $10, 0, 0, 2, 0, $143)
    %spritemapEntry(1, $1FE, $0B, 0, 0, 2, 0, $122)
    %spritemapEntry(0, $1FD, $08, 0, 0, 2, 0, $11B)
    %spritemapEntry(0, $1FD, $00, 0, 0, 2, 0, $10B)

UNUSED_Spitemaps_SpacePirate_B2D12C:
    dw $000B
    %spritemapEntry(0, $1F9, $12, 0, 0, 2, 0, $131)
    %spritemapEntry(0, $1F9, $0A, 0, 0, 2, 0, $121)
    %spritemapEntry(0, $1F7, $18, 0, 0, 2, 0, $126)
    %spritemapEntry(0, $1EF, $18, 0, 0, 2, 0, $125)
    %spritemapEntry(0, $1FA, $06, 0, 0, 2, 0, $119)
    %spritemapEntry(0, $1FA, $FE, 0, 0, 2, 0, $109)
    %spritemapEntry(0, $05, $17, 0, 0, 2, 0, $144)
    %spritemapEntry(0, $05, $0F, 0, 0, 2, 0, $143)
    %spritemapEntry(1, $1FA, $08, 0, 0, 2, 0, $122)
    %spritemapEntry(0, $1FB, $06, 0, 0, 2, 0, $11A)
    %spritemapEntry(0, $1FB, $FE, 0, 0, 2, 0, $10A)

UNUSED_Spitemaps_SpacePirate_B2D165:
    dw $000C
    %spritemapEntry(0, $1FD, $18, 0, 0, 2, 0, $126)
    %spritemapEntry(0, $1F5, $18, 0, 0, 2, 0, $125)
    %spritemapEntry(0, $1FE, $14, 0, 0, 2, 0, $131)
    %spritemapEntry(0, $1FE, $0C, 0, 0, 2, 0, $121)
    %spritemapEntry(0, $1FC, $06, 0, 0, 2, 0, $11A)
    %spritemapEntry(0, $1FC, $FE, 0, 0, 2, 0, $10A)
    %spritemapEntry(0, $04, $18, 0, 0, 2, 0, $144)
    %spritemapEntry(0, $04, $10, 0, 0, 2, 0, $143)
    %spritemapEntry(0, $1FD, $10, 0, 0, 2, 0, $11B)
    %spritemapEntry(0, $1FD, $08, 0, 0, 2, 0, $10B)
    %spritemapEntry(0, $1FB, $04, 0, 0, 2, 0, $119)
    %spritemapEntry(0, $1FB, $FC, 0, 0, 2, 0, $109)

UNUSED_Spitemaps_SpacePirate_B2D1A3:
    dw $000B
    %spritemapEntry(0, $1FA, $16, 0, 0, 2, 0, $126)
    %spritemapEntry(0, $1F2, $16, 0, 0, 2, 0, $125)
    %spritemapEntry(0, $04, $18, 0, 0, 2, 0, $146)
    %spritemapEntry(0, $1FC, $18, 0, 0, 2, 0, $145)
    %spritemapEntry(0, $01, $13, 0, 0, 2, 0, $134)
    %spritemapEntry(0, $01, $0B, 0, 0, 2, 0, $124)
    %spritemapEntry(0, $1FC, $07, 0, 0, 2, 0, $11B)
    %spritemapEntry(0, $1FD, $FF, 0, 0, 2, 0, $10B)
    %spritemapEntry(1, $1F4, $00, 0, 0, 2, 0, $107)
    %spritemapEntry(0, $1F8, $12, 0, 0, 2, 0, $134)
    %spritemapEntry(0, $1F8, $0A, 0, 0, 2, 0, $124)

UNUSED_Spitemaps_SpacePirate_B2D1DC:
    dw $000A
    %spritemapEntry(0, $1FA, $00, 0, 0, 2, 0, $10A)
    %spritemapEntry(0, $1F2, $18, 0, 0, 2, 0, $136)
    %spritemapEntry(0, $1EB, $18, 0, 0, 2, 0, $135)
    %spritemapEntry(0, $06, $18, 0, 0, 2, 0, $144)
    %spritemapEntry(0, $06, $10, 0, 0, 2, 0, $143)
    %spritemapEntry(1, $1FB, $0A, 0, 0, 2, 0, $122)
    %spritemapEntry(0, $1F9, $08, 0, 0, 2, 0, $11B)
    %spritemapEntry(0, $1F4, $13, 0, 0, 2, 0, $130)
    %spritemapEntry(0, $1F3, $0B, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $1F4, $00, 0, 0, 2, 0, $107)

UNUSED_Spitemaps_SpacePirate_B2D210:
    dw $000B
    %spritemapEntry(0, $1F7, $13, 0, 0, 2, 0, $131)
    %spritemapEntry(0, $1F7, $0B, 0, 0, 2, 0, $121)
    %spritemapEntry(0, $05, $17, 0, 0, 2, 0, $144)
    %spritemapEntry(0, $05, $0F, 0, 0, 2, 0, $143)
    %spritemapEntry(1, $1FA, $08, 0, 0, 2, 0, $122)
    %spritemapEntry(0, $1FB, $06, 0, 0, 2, 0, $11A)
    %spritemapEntry(0, $1FB, $FE, 0, 0, 2, 0, $10A)
    %spritemapEntry(0, $1F6, $18, 0, 0, 2, 0, $126)
    %spritemapEntry(0, $1EE, $18, 0, 0, 2, 0, $125)
    %spritemapEntry(0, $1F8, $07, 0, 0, 2, 0, $119)
    %spritemapEntry(0, $1F8, $FF, 0, 0, 2, 0, $109)

UNUSED_Spitemaps_SpacePirate_B2D249:
    dw $000C
    %spritemapEntry(0, $1FB, $06, 0, 0, 2, 0, $119)
    %spritemapEntry(0, $1FB, $FE, 0, 0, 2, 0, $109)
    %spritemapEntry(0, $02, $19, 0, 0, 2, 0, $144)
    %spritemapEntry(0, $02, $11, 0, 0, 2, 0, $143)
    %spritemapEntry(0, $1FC, $11, 0, 0, 2, 0, $11B)
    %spritemapEntry(0, $1FC, $09, 0, 0, 2, 0, $10B)
    %spritemapEntry(0, $1FD, $18, 0, 0, 2, 0, $126)
    %spritemapEntry(0, $1F5, $18, 0, 0, 2, 0, $125)
    %spritemapEntry(0, $1FE, $15, 0, 0, 2, 0, $131)
    %spritemapEntry(0, $1FE, $0D, 0, 0, 2, 0, $121)
    %spritemapEntry(0, $1FC, $08, 0, 0, 2, 0, $11A)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 0, $10A)

UNUSED_Spitemaps_SpacePirate_B2D287:
    dw $000B
    %spritemapEntry(0, $1FA, $16, 0, 0, 2, 0, $126)
    %spritemapEntry(0, $1F2, $16, 0, 0, 2, 0, $125)
    %spritemapEntry(1, $1F6, $00, 0, 0, 2, 0, $107)
    %spritemapEntry(0, $1F8, $12, 0, 0, 2, 0, $134)
    %spritemapEntry(0, $1F8, $0A, 0, 0, 2, 0, $124)
    %spritemapEntry(0, $04, $18, 0, 0, 2, 0, $146)
    %spritemapEntry(0, $1FC, $18, 0, 0, 2, 0, $145)
    %spritemapEntry(0, $01, $13, 0, 0, 2, 0, $134)
    %spritemapEntry(0, $01, $0B, 0, 0, 2, 0, $124)
    %spritemapEntry(0, $1FC, $07, 0, 0, 2, 0, $11B)
    %spritemapEntry(0, $1FD, $FF, 0, 0, 2, 0, $10B)
endif ; !FEATURE_KEEP_UNREFERENCED

Spitemaps_PirateNinja_3D:
    dw $000A
    %spritemapEntry(0, $1F8, $11, 0, 0, 2, 0, $134)
    %spritemapEntry(0, $1FC, $FE, 0, 0, 2, 0, $109)
    %spritemapEntry(0, $1FC, $06, 0, 0, 2, 0, $119)
    %spritemapEntry(0, $03, $15, 0, 0, 2, 0, $126)
    %spritemapEntry(0, $1FC, $15, 0, 0, 2, 0, $125)
    %spritemapEntry(1, $1F5, $FF, 0, 0, 2, 0, $107)
    %spritemapEntry(1, $1FB, $0A, 0, 0, 2, 0, $122)
    %spritemapEntry(0, $1FA, $15, 0, 0, 2, 0, $126)
    %spritemapEntry(0, $1F2, $15, 0, 0, 2, 0, $125)
    %spritemapEntry(0, $1F8, $09, 0, 0, 2, 0, $124)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spitemaps_SpacePirate_B2D2F4:
    dw $000A
    %spritemapEntry(1, $1F7, $FF, 0, 0, 2, 0, $107)
    %spritemapEntry(0, $04, $11, 0, 0, 2, 0, $144)
    %spritemapEntry(0, $04, $09, 0, 0, 2, 0, $143)
    %spritemapEntry(0, $1F7, $09, 1, 1, 2, 0, $149)
    %spritemapEntry(0, $1FF, $09, 1, 1, 2, 0, $148)
    %spritemapEntry(1, $1F4, $FF, 0, 0, 2, 0, $107)
    %spritemapEntry(0, $1F5, $0B, 1, 1, 2, 0, $149)
    %spritemapEntry(0, $1FD, $0B, 1, 1, 2, 0, $148)
    %spritemapEntry(0, $1FE, $13, 0, 0, 2, 0, $144)
    %spritemapEntry(0, $1FE, $0B, 0, 0, 2, 0, $143)

UNUSED_Spitemaps_SpacePirate_B2D328:
    dw $0003
    %spritemapEntry(0, $04, $FC, 0, 0, 2, 0, $14C)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 0, $14B)
    %spritemapEntry(0, $1F4, $FC, 0, 0, 2, 0, $14A)

UNUSED_Spitemaps_SpacePirate_B2D339:
    dw $0002
    %spritemapEntry(1, $1FC, $F8, 0, 0, 2, 0, $128)
    %spritemapEntry(1, $1F4, $F8, 0, 0, 2, 0, $127)

UNUSED_Spitemaps_SpacePirate_B2D345:
    dw $0003
    %spritemapEntry(0, $1FC, $F4, 1, 1, 2, 0, $14D)
    %spritemapEntry(0, $1FC, $FC, 1, 1, 2, 0, $13D)
    %spritemapEntry(0, $1FC, $04, 1, 1, 2, 0, $12D)

UNUSED_Spitemaps_SpacePirate_B2D356:
    dw $0002
    %spritemapEntry(1, $1F4, $F8, 1, 1, 2, 0, $12B)
    %spritemapEntry(1, $1FC, $F8, 1, 1, 2, 0, $12A)

UNUSED_Spitemaps_SpacePirate_B2D362:
    dw $0003
    %spritemapEntry(0, $1F4, $FC, 1, 1, 2, 0, $14C)
    %spritemapEntry(0, $1FC, $FC, 1, 1, 2, 0, $14B)
    %spritemapEntry(0, $04, $FC, 1, 1, 2, 0, $14A)

UNUSED_Spitemaps_SpacePirate_B2D373:
    dw $0002
    %spritemapEntry(1, $1F4, $F8, 1, 1, 2, 0, $128)
    %spritemapEntry(1, $1FC, $F8, 1, 1, 2, 0, $127)

UNUSED_Spitemaps_SpacePirate_B2D37F:
    dw $0003
    %spritemapEntry(0, $1FC, $04, 0, 0, 2, 0, $14D)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 0, $13D)
    %spritemapEntry(0, $1FC, $F4, 0, 0, 2, 0, $12D)

UNUSED_Spitemaps_SpacePirate_B2D390:
    dw $0002
    %spritemapEntry(1, $1FC, $F8, 0, 0, 2, 0, $12B)
    %spritemapEntry(1, $1F4, $F8, 0, 0, 2, 0, $12A)
endif ; !FEATURE_KEEP_UNREFERENCED

Spitemaps_PirateNinja_3E:
    dw $000A
    %spritemapEntry(0, $1FC, $08, 0, 0, 2, 0, $119)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 0, $109)
    %spritemapEntry(1, $1F4, $01, 0, 0, 2, 0, $107)
    %spritemapEntry(0, $1F6, $09, 0, 0, 2, 0, $124)
    %spritemapEntry(0, $1F7, $11, 0, 0, 2, 0, $134)
    %spritemapEntry(0, $02, $15, 0, 0, 2, 0, $126)
    %spritemapEntry(0, $1FC, $15, 0, 0, 2, 0, $125)
    %spritemapEntry(1, $1FA, $0B, 0, 0, 2, 0, $122)
    %spritemapEntry(0, $1F9, $15, 0, 0, 2, 0, $126)
    %spritemapEntry(0, $1F2, $15, 0, 0, 2, 0, $125)

Spitemaps_PirateNinja_3F:
    dw $0005
    %spritemapEntry(1, $1EA, $00, 0, 0, 2, 0, $127)
    %spritemapEntry(1, $1F2, $00, 0, 0, 2, 0, $128)
    %spritemapEntry(0, $1FB, $FB, 0, 0, 2, 0, $113)
    %spritemapEntry(0, $1FB, $F3, 0, 0, 2, 0, $103)
    %spritemapEntry(1, $1F8, $F0, 0, 0, 2, 0, $12E)

Spitemaps_PirateNinja_40:
    dw $0005
    %spritemapEntry(1, $06, $00, 0, 1, 2, 0, $127)
    %spritemapEntry(1, $1FE, $00, 0, 1, 2, 0, $128)
    %spritemapEntry(0, $1FD, $FB, 0, 1, 2, 0, $113)
    %spritemapEntry(0, $1FD, $F3, 0, 1, 2, 0, $103)
    %spritemapEntry(1, $1F8, $F0, 0, 1, 2, 0, $12E)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spitemaps_SpacePirate_B2D406:
    dw $000A
    %spritemapEntry(0, $03, $13, 0, 1, 2, 0, $130)
    %spritemapEntry(0, $04, $0B, 0, 1, 2, 0, $120)
    %spritemapEntry(0, $06, $18, 0, 1, 2, 0, $136)
    %spritemapEntry(0, $0D, $18, 0, 1, 2, 0, $135)
    %spritemapEntry(1, $1FB, $00, 0, 1, 2, 0, $107)
    %spritemapEntry(0, $1F2, $18, 0, 1, 2, 0, $144)
    %spritemapEntry(0, $1F2, $10, 0, 1, 2, 0, $143)
    %spritemapEntry(1, $1F2, $0B, 0, 1, 2, 0, $122)
    %spritemapEntry(0, $1FB, $08, 0, 1, 2, 0, $11B)
    %spritemapEntry(0, $1FB, $00, 0, 1, 2, 0, $10B)

UNUSED_Spitemaps_SpacePirate_B2D43A:
    dw $000B
    %spritemapEntry(0, $1FF, $12, 0, 1, 2, 0, $131)
    %spritemapEntry(0, $1FF, $0A, 0, 1, 2, 0, $121)
    %spritemapEntry(0, $01, $18, 0, 1, 2, 0, $126)
    %spritemapEntry(0, $09, $18, 0, 1, 2, 0, $125)
    %spritemapEntry(0, $1FE, $06, 0, 1, 2, 0, $119)
    %spritemapEntry(0, $1FE, $FE, 0, 1, 2, 0, $109)
    %spritemapEntry(0, $1F3, $17, 0, 1, 2, 0, $144)
    %spritemapEntry(0, $1F3, $0F, 0, 1, 2, 0, $143)
    %spritemapEntry(1, $1F6, $08, 0, 1, 2, 0, $122)
    %spritemapEntry(0, $1FD, $06, 0, 1, 2, 0, $11A)
    %spritemapEntry(0, $1FD, $FE, 0, 1, 2, 0, $10A)

UNUSED_Spitemaps_SpacePirate_B2D473:
    dw $000C
    %spritemapEntry(0, $1FB, $18, 0, 1, 2, 0, $126)
    %spritemapEntry(0, $03, $18, 0, 1, 2, 0, $125)
    %spritemapEntry(0, $1FA, $14, 0, 1, 2, 0, $131)
    %spritemapEntry(0, $1FA, $0C, 0, 1, 2, 0, $121)
    %spritemapEntry(0, $1FC, $06, 0, 1, 2, 0, $11A)
    %spritemapEntry(0, $1FC, $FE, 0, 1, 2, 0, $10A)
    %spritemapEntry(0, $1F4, $18, 0, 1, 2, 0, $144)
    %spritemapEntry(0, $1F4, $10, 0, 1, 2, 0, $143)
    %spritemapEntry(0, $1FB, $10, 0, 1, 2, 0, $11B)
    %spritemapEntry(0, $1FB, $08, 0, 1, 2, 0, $10B)
    %spritemapEntry(0, $1FD, $04, 0, 1, 2, 0, $119)
    %spritemapEntry(0, $1FD, $FC, 0, 1, 2, 0, $109)

UNUSED_Spitemaps_SpacePirate_B2D4B1:
    dw $000B
    %spritemapEntry(0, $1FE, $16, 0, 1, 2, 0, $126)
    %spritemapEntry(0, $06, $16, 0, 1, 2, 0, $125)
    %spritemapEntry(0, $1F4, $18, 0, 1, 2, 0, $146)
    %spritemapEntry(0, $1FC, $18, 0, 1, 2, 0, $145)
    %spritemapEntry(0, $1F7, $13, 0, 1, 2, 0, $134)
    %spritemapEntry(0, $1F7, $0B, 0, 1, 2, 0, $124)
    %spritemapEntry(0, $1FC, $07, 0, 1, 2, 0, $11B)
    %spritemapEntry(0, $1FB, $FF, 0, 1, 2, 0, $10B)
    %spritemapEntry(1, $1FC, $00, 0, 1, 2, 0, $107)
    %spritemapEntry(0, $00, $12, 0, 1, 2, 0, $134)
    %spritemapEntry(0, $00, $0A, 0, 1, 2, 0, $124)

UNUSED_Spitemaps_SpacePirate_B2D4EA:
    dw $000A
    %spritemapEntry(0, $1FE, $00, 0, 1, 2, 0, $10A)
    %spritemapEntry(0, $06, $18, 0, 1, 2, 0, $136)
    %spritemapEntry(0, $0D, $18, 0, 1, 2, 0, $135)
    %spritemapEntry(0, $1F2, $18, 0, 1, 2, 0, $144)
    %spritemapEntry(0, $1F2, $10, 0, 1, 2, 0, $143)
    %spritemapEntry(1, $1F5, $0A, 0, 1, 2, 0, $122)
    %spritemapEntry(0, $1FF, $08, 0, 1, 2, 0, $11B)
    %spritemapEntry(0, $04, $13, 0, 1, 2, 0, $130)
    %spritemapEntry(0, $05, $0B, 0, 1, 2, 0, $120)
    %spritemapEntry(1, $1FC, $00, 0, 1, 2, 0, $107)

UNUSED_Spitemaps_SpacePirate_B2D51E:
    dw $000B
    %spritemapEntry(0, $01, $13, 0, 1, 2, 0, $131)
    %spritemapEntry(0, $01, $0B, 0, 1, 2, 0, $121)
    %spritemapEntry(0, $1F3, $17, 0, 1, 2, 0, $144)
    %spritemapEntry(0, $1F3, $0F, 0, 1, 2, 0, $143)
    %spritemapEntry(1, $1F6, $08, 0, 1, 2, 0, $122)
    %spritemapEntry(0, $1FD, $06, 0, 1, 2, 0, $11A)
    %spritemapEntry(0, $1FD, $FE, 0, 1, 2, 0, $10A)
    %spritemapEntry(0, $02, $18, 0, 1, 2, 0, $126)
    %spritemapEntry(0, $0A, $18, 0, 1, 2, 0, $125)
    %spritemapEntry(0, $00, $07, 0, 1, 2, 0, $119)
    %spritemapEntry(0, $00, $FF, 0, 1, 2, 0, $109)

UNUSED_Spitemaps_SpacePirate_B2D557:
    dw $000C
    %spritemapEntry(0, $1FD, $06, 0, 1, 2, 0, $119)
    %spritemapEntry(0, $1FD, $FE, 0, 1, 2, 0, $109)
    %spritemapEntry(0, $1F6, $19, 0, 1, 2, 0, $144)
    %spritemapEntry(0, $1F6, $11, 0, 1, 2, 0, $143)
    %spritemapEntry(0, $1FC, $11, 0, 1, 2, 0, $11B)
    %spritemapEntry(0, $1FC, $09, 0, 1, 2, 0, $10B)
    %spritemapEntry(0, $1FB, $18, 0, 1, 2, 0, $126)
    %spritemapEntry(0, $03, $18, 0, 1, 2, 0, $125)
    %spritemapEntry(0, $1FA, $15, 0, 1, 2, 0, $131)
    %spritemapEntry(0, $1FA, $0D, 0, 1, 2, 0, $121)
    %spritemapEntry(0, $1FC, $08, 0, 1, 2, 0, $11A)
    %spritemapEntry(0, $1FC, $00, 0, 1, 2, 0, $10A)

UNUSED_Spitemaps_SpacePirate_B2D595:
    dw $000B
    %spritemapEntry(0, $1FE, $16, 0, 1, 2, 0, $126)
    %spritemapEntry(0, $06, $16, 0, 1, 2, 0, $125)
    %spritemapEntry(1, $1FA, $00, 0, 1, 2, 0, $107)
    %spritemapEntry(0, $00, $12, 0, 1, 2, 0, $134)
    %spritemapEntry(0, $00, $0A, 0, 1, 2, 0, $124)
    %spritemapEntry(0, $1F4, $18, 0, 1, 2, 0, $146)
    %spritemapEntry(0, $1FC, $18, 0, 1, 2, 0, $145)
    %spritemapEntry(0, $1F7, $13, 0, 1, 2, 0, $134)
    %spritemapEntry(0, $1F7, $0B, 0, 1, 2, 0, $124)
    %spritemapEntry(0, $1FC, $07, 0, 1, 2, 0, $11B)
    %spritemapEntry(0, $1FB, $FF, 0, 1, 2, 0, $10B)
endif ; !FEATURE_KEEP_UNREFERENCED

Spitemaps_PirateNinja_41:
    dw $000A
    %spritemapEntry(0, $00, $11, 0, 1, 2, 0, $134)
    %spritemapEntry(0, $1FC, $FE, 0, 1, 2, 0, $109)
    %spritemapEntry(0, $1FC, $06, 0, 1, 2, 0, $119)
    %spritemapEntry(0, $1F5, $15, 0, 1, 2, 0, $126)
    %spritemapEntry(0, $1FC, $15, 0, 1, 2, 0, $125)
    %spritemapEntry(1, $1FB, $FF, 0, 1, 2, 0, $107)
    %spritemapEntry(1, $1F5, $0A, 0, 1, 2, 0, $122)
    %spritemapEntry(0, $1FE, $15, 0, 1, 2, 0, $126)
    %spritemapEntry(0, $06, $15, 0, 1, 2, 0, $125)
    %spritemapEntry(0, $00, $09, 0, 1, 2, 0, $124)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spitemaps_SpacePirate_B2D602:
    dw $000A
    %spritemapEntry(1, $1F9, $FF, 0, 1, 2, 0, $107)
    %spritemapEntry(0, $1F4, $11, 0, 1, 2, 0, $144)
    %spritemapEntry(0, $1F4, $09, 0, 1, 2, 0, $143)
    %spritemapEntry(0, $01, $09, 1, 0, 2, 0, $149)
    %spritemapEntry(0, $1F9, $09, 1, 0, 2, 0, $148)
    %spritemapEntry(1, $1FC, $FF, 0, 1, 2, 0, $107)
    %spritemapEntry(0, $03, $0B, 1, 0, 2, 0, $149)
    %spritemapEntry(0, $1FB, $0B, 1, 0, 2, 0, $148)
    %spritemapEntry(0, $1FA, $13, 0, 1, 2, 0, $144)
    %spritemapEntry(0, $1FA, $0B, 0, 1, 2, 0, $143)

UNUSED_Spitemaps_SpacePirate_B2D636:
    dw $0003
    %spritemapEntry(0, $1F4, $FC, 0, 1, 2, 0, $14C)
    %spritemapEntry(0, $1FC, $FC, 0, 1, 2, 0, $14B)
    %spritemapEntry(0, $04, $FC, 0, 1, 2, 0, $14A)

UNUSED_Spitemaps_SpacePirate_B2D647:
    dw $0002
    %spritemapEntry(1, $1F4, $F8, 0, 1, 2, 0, $128)
    %spritemapEntry(1, $1FC, $F8, 0, 1, 2, 0, $127)

UNUSED_Spitemaps_SpacePirate_B2D653:
    dw $0003
    %spritemapEntry(0, $1FC, $F4, 1, 0, 2, 0, $14D)
    %spritemapEntry(0, $1FC, $FC, 1, 0, 2, 0, $13D)
    %spritemapEntry(0, $1FC, $04, 1, 0, 2, 0, $12D)

UNUSED_Spitemaps_SpacePirate_B2D664:
    dw $0002
    %spritemapEntry(1, $1FC, $F8, 1, 0, 2, 0, $12B)
    %spritemapEntry(1, $1F4, $F8, 1, 0, 2, 0, $12A)

UNUSED_Spitemaps_SpacePirate_B2D670:
    dw $0003
    %spritemapEntry(0, $04, $FC, 1, 0, 2, 0, $14C)
    %spritemapEntry(0, $1FC, $FC, 1, 0, 2, 0, $14B)
    %spritemapEntry(0, $1F4, $FC, 1, 0, 2, 0, $14A)

UNUSED_Spitemaps_SpacePirate_B2D681:
    dw $0002
    %spritemapEntry(1, $1FC, $F8, 1, 0, 2, 0, $128)
    %spritemapEntry(1, $1F4, $F8, 1, 0, 2, 0, $127)

UNUSED_Spitemaps_SpacePirate_B2D68D:
    dw $0003
    %spritemapEntry(0, $1FC, $04, 0, 1, 2, 0, $14D)
    %spritemapEntry(0, $1FC, $FC, 0, 1, 2, 0, $13D)
    %spritemapEntry(0, $1FC, $F4, 0, 1, 2, 0, $12D)

UNUSED_Spitemaps_SpacePirate_B2D69E:
    dw $0002
    %spritemapEntry(1, $1F4, $F8, 0, 1, 2, 0, $12B)
    %spritemapEntry(1, $1FC, $F8, 0, 1, 2, 0, $12A)
endif ; !FEATURE_KEEP_UNREFERENCED

Spitemaps_PirateNinja_42:
    dw $000A
    %spritemapEntry(0, $1FC, $08, 0, 1, 2, 0, $119)
    %spritemapEntry(0, $1FC, $00, 0, 1, 2, 0, $109)
    %spritemapEntry(1, $1FC, $01, 0, 1, 2, 0, $107)
    %spritemapEntry(0, $02, $09, 0, 1, 2, 0, $124)
    %spritemapEntry(0, $01, $11, 0, 1, 2, 0, $134)
    %spritemapEntry(0, $1F6, $15, 0, 1, 2, 0, $126)
    %spritemapEntry(0, $1FC, $15, 0, 1, 2, 0, $125)
    %spritemapEntry(1, $1F6, $0B, 0, 1, 2, 0, $122)
    %spritemapEntry(0, $1FF, $15, 0, 1, 2, 0, $126)
    %spritemapEntry(0, $06, $15, 0, 1, 2, 0, $125)

Spitemaps_PirateNinja_43:
    dw $0004
    %spritemapEntry(0, $00, $00, 0, 1, 2, 0, $151)
    %spritemapEntry(0, $1F8, $00, 0, 0, 2, 0, $151)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 0, $150)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $150)

Spitemaps_PirateNinja_44:
    dw $0004
    %spritemapEntry(0, $00, $00, 0, 1, 2, 0, $153)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 0, $152)
    %spritemapEntry(0, $1F8, $00, 0, 0, 2, 0, $153)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $152)

Spitemaps_PirateNinja_45:
    dw $0009
    %spritemapEntry(0, $1FB, $FB, 0, 0, 2, 0, $113)
    %spritemapEntry(0, $1FB, $F3, 0, 0, 2, 0, $103)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 0, $13F)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $13E)
    %spritemapEntry(0, $1FF, $F0, 0, 0, 2, 0, $12F)
    %spritemapEntry(0, $1F7, $F0, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1EA, $00, 0, 0, 2, 0, $127)
    %spritemapEntry(1, $1F2, $00, 0, 0, 2, 0, $128)
    %spritemapEntry(1, $1F0, $EB, 0, 0, 2, 0, $10E)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spitemaps_SpacePirate_B2D739:
    dw $0009
    %spritemapEntry(0, $1FA, $FB, 0, 0, 2, 0, $113)
    %spritemapEntry(0, $1FA, $F3, 0, 0, 2, 0, $103)
    %spritemapEntry(0, $00, $F8, 0, 0, 2, 0, $13F)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $13E)
    %spritemapEntry(0, $1FE, $F0, 0, 0, 2, 0, $12F)
    %spritemapEntry(0, $1F6, $F0, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1E9, $00, 0, 0, 2, 0, $127)
    %spritemapEntry(1, $1F1, $00, 0, 0, 2, 0, $128)
    %spritemapEntry(1, $1EE, $EC, 0, 0, 2, 0, $10E)

UNUSED_Spitemaps_SpacePirate_B2D768:
    dw $000A
    %spritemapEntry(0, $1F8, $00, 0, 0, 2, 0, $14C)
    %spritemapEntry(0, $1F0, $00, 0, 0, 2, 0, $14B)
    %spritemapEntry(0, $1E8, $00, 0, 0, 2, 0, $14A)
    %spritemapEntry(0, $1F9, $FB, 0, 0, 2, 0, $113)
    %spritemapEntry(0, $1F9, $F3, 0, 0, 2, 0, $103)
    %spritemapEntry(0, $1FF, $F8, 0, 0, 2, 0, $13F)
    %spritemapEntry(0, $1F7, $F8, 0, 0, 2, 0, $13E)
    %spritemapEntry(0, $1FD, $F0, 0, 0, 2, 0, $12F)
    %spritemapEntry(0, $1F5, $F0, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1EC, $ED, 0, 0, 2, 0, $10E)

UNUSED_Spitemaps_SpacePirate_B2D79C:
    dw $0009
    %spritemapEntry(1, $1EE, $F8, 0, 0, 2, 0, $12B)
    %spritemapEntry(1, $1E6, $F8, 0, 0, 2, 0, $12A)
    %spritemapEntry(0, $1F8, $FB, 0, 0, 2, 0, $113)
    %spritemapEntry(0, $1F8, $F3, 0, 0, 2, 0, $103)
    %spritemapEntry(0, $1FF, $F8, 0, 0, 2, 0, $13F)
    %spritemapEntry(0, $1F7, $F8, 0, 0, 2, 0, $13E)
    %spritemapEntry(0, $1FD, $F0, 0, 0, 2, 0, $12F)
    %spritemapEntry(0, $1F5, $F0, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1EB, $EE, 0, 0, 2, 0, $10E)

UNUSED_Spitemaps_SpacePirate_B2D7CB:
    dw $0009
    %spritemapEntry(1, $1EE, $FA, 0, 0, 2, 0, $12B)
    %spritemapEntry(1, $1E6, $FA, 0, 0, 2, 0, $12A)
    %spritemapEntry(0, $1F7, $FA, 0, 0, 2, 0, $113)
    %spritemapEntry(0, $1F7, $F3, 0, 0, 2, 0, $103)
    %spritemapEntry(0, $1FE, $F8, 0, 0, 2, 0, $13F)
    %spritemapEntry(0, $1F6, $F8, 0, 0, 2, 0, $13E)
    %spritemapEntry(0, $1FC, $F0, 0, 0, 2, 0, $12F)
    %spritemapEntry(0, $1F4, $F0, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1EA, $EF, 0, 0, 2, 0, $10E)

UNUSED_Spitemaps_SpacePirate_B2D7FA:
    dw $0009
    %spritemapEntry(1, $1EE, $FB, 0, 0, 2, 0, $12B)
    %spritemapEntry(1, $1E6, $FB, 0, 0, 2, 0, $12A)
    %spritemapEntry(0, $1F7, $FB, 0, 0, 2, 0, $113)
    %spritemapEntry(0, $1F6, $F4, 0, 0, 2, 0, $103)
    %spritemapEntry(0, $1FE, $F8, 0, 0, 2, 0, $13F)
    %spritemapEntry(0, $1F5, $F9, 0, 0, 2, 0, $13E)
    %spritemapEntry(0, $1FB, $F1, 0, 0, 2, 0, $12F)
    %spritemapEntry(0, $1F3, $F1, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1EA, $F0, 0, 0, 2, 0, $10E)
endif ; !FEATURE_KEEP_UNREFERENCED

Spitemaps_PirateNinja_46:
    dw $0009
    %spritemapEntry(0, $1FD, $FB, 0, 1, 2, 0, $113)
    %spritemapEntry(0, $1FD, $F3, 0, 1, 2, 0, $103)
    %spritemapEntry(0, $1F8, $F8, 0, 1, 2, 0, $13F)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 0, $13E)
    %spritemapEntry(0, $1F9, $F0, 0, 1, 2, 0, $12F)
    %spritemapEntry(0, $01, $F0, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $06, $00, 0, 1, 2, 0, $127)
    %spritemapEntry(1, $1FE, $00, 0, 1, 2, 0, $128)
    %spritemapEntry(1, $00, $EB, 0, 1, 2, 0, $10E)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spitemaps_SpacePirate_B2D858:
    dw $0009
    %spritemapEntry(0, $1FE, $FB, 0, 1, 2, 0, $113)
    %spritemapEntry(0, $1FE, $F3, 0, 1, 2, 0, $103)
    %spritemapEntry(0, $1F8, $F8, 0, 1, 2, 0, $13F)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 0, $13E)
    %spritemapEntry(0, $1FA, $F0, 0, 1, 2, 0, $12F)
    %spritemapEntry(0, $02, $F0, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $07, $00, 0, 1, 2, 0, $127)
    %spritemapEntry(1, $1FF, $00, 0, 1, 2, 0, $128)
    %spritemapEntry(1, $02, $EC, 0, 1, 2, 0, $10E)

UNUSED_Spitemaps_SpacePirate_B2D887:
    dw $000A
    %spritemapEntry(0, $00, $00, 0, 1, 2, 0, $14C)
    %spritemapEntry(0, $08, $00, 0, 1, 2, 0, $14B)
    %spritemapEntry(0, $10, $00, 0, 1, 2, 0, $14A)
    %spritemapEntry(0, $1FF, $FB, 0, 1, 2, 0, $113)
    %spritemapEntry(0, $1FF, $F3, 0, 1, 2, 0, $103)
    %spritemapEntry(0, $1F9, $F8, 0, 1, 2, 0, $13F)
    %spritemapEntry(0, $01, $F8, 0, 1, 2, 0, $13E)
    %spritemapEntry(0, $1FB, $F0, 0, 1, 2, 0, $12F)
    %spritemapEntry(0, $03, $F0, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $04, $ED, 0, 1, 2, 0, $10E)

UNUSED_Spitemaps_SpacePirate_B2D8BB:
    dw $0009
    %spritemapEntry(1, $02, $F8, 0, 1, 2, 0, $12B)
    %spritemapEntry(1, $0A, $F8, 0, 1, 2, 0, $12A)
    %spritemapEntry(0, $00, $FB, 0, 1, 2, 0, $113)
    %spritemapEntry(0, $00, $F3, 0, 1, 2, 0, $103)
    %spritemapEntry(0, $1F9, $F8, 0, 1, 2, 0, $13F)
    %spritemapEntry(0, $01, $F8, 0, 1, 2, 0, $13E)
    %spritemapEntry(0, $1FB, $F0, 0, 1, 2, 0, $12F)
    %spritemapEntry(0, $03, $F0, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $05, $EE, 0, 1, 2, 0, $10E)

UNUSED_Spitemaps_SpacePirate_B2D8EA:
    dw $0009
    %spritemapEntry(1, $02, $FA, 0, 1, 2, 0, $12B)
    %spritemapEntry(1, $0A, $FA, 0, 1, 2, 0, $12A)
    %spritemapEntry(0, $01, $FA, 0, 1, 2, 0, $113)
    %spritemapEntry(0, $01, $F3, 0, 1, 2, 0, $103)
    %spritemapEntry(0, $1FA, $F8, 0, 1, 2, 0, $13F)
    %spritemapEntry(0, $02, $F8, 0, 1, 2, 0, $13E)
    %spritemapEntry(0, $1FC, $F0, 0, 1, 2, 0, $12F)
    %spritemapEntry(0, $04, $F0, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $06, $EF, 0, 1, 2, 0, $10E)

UNUSED_Spitemaps_SpacePirate_B2D919:
    dw $0009
    %spritemapEntry(1, $02, $FB, 0, 1, 2, 0, $12B)
    %spritemapEntry(1, $0A, $FB, 0, 1, 2, 0, $12A)
    %spritemapEntry(0, $01, $FB, 0, 1, 2, 0, $113)
    %spritemapEntry(0, $02, $F4, 0, 1, 2, 0, $103)
    %spritemapEntry(0, $1FA, $F8, 0, 1, 2, 0, $13F)
    %spritemapEntry(0, $03, $F9, 0, 1, 2, 0, $13E)
    %spritemapEntry(0, $1FD, $F1, 0, 1, 2, 0, $12F)
    %spritemapEntry(0, $05, $F1, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $06, $F0, 0, 1, 2, 0, $10E)

UNUSED_Spitemaps_SpacePirate_B2D948:
    dw $000A
    %spritemapEntry(1, $1F4, $00, 0, 0, 2, 0, $107)
    %spritemapEntry(0, $1FD, $08, 0, 0, 2, 0, $11B)
    %spritemapEntry(0, $1FD, $00, 0, 0, 2, 0, $10B)
    %spritemapEntry(0, $1ED, $16, 0, 0, 2, 0, $136)
    %spritemapEntry(1, $00, $08, 0, 0, 2, 0, $17E)
    %spritemapEntry(0, $1F1, $13, 0, 0, 2, 0, $130)
    %spritemapEntry(0, $1F1, $0B, 0, 0, 2, 0, $120)
    %spritemapEntry(0, $1E6, $16, 0, 0, 2, 0, $135)
    %spritemapEntry(0, $0D, $16, 0, 0, 2, 0, $144)
    %spritemapEntry(0, $0C, $0E, 0, 0, 2, 0, $143)

UNUSED_Spitemaps_SpacePirate_B2D97C:
    dw $000C
    %spritemapEntry(0, $0B, $10, 0, 0, 2, 0, $18D)
    %spritemapEntry(0, $0B, $08, 0, 0, 2, 0, $17D)
    %spritemapEntry(0, $08, $09, 0, 0, 2, 0, $16D)
    %spritemapEntry(0, $00, $09, 0, 0, 2, 0, $16C)
    %spritemapEntry(0, $1F9, $12, 0, 0, 2, 0, $131)
    %spritemapEntry(0, $1F9, $0A, 0, 0, 2, 0, $121)
    %spritemapEntry(0, $1F7, $18, 0, 0, 2, 0, $126)
    %spritemapEntry(0, $1EF, $18, 0, 0, 2, 0, $125)
    %spritemapEntry(0, $1FA, $06, 0, 0, 2, 0, $119)
    %spritemapEntry(0, $1FA, $FE, 0, 0, 2, 0, $109)
    %spritemapEntry(0, $1FC, $06, 0, 0, 2, 0, $11A)
    %spritemapEntry(0, $1FC, $FE, 0, 0, 2, 0, $10A)

UNUSED_Spitemaps_SpacePirate_B2D9BA:
    dw $000C
    %spritemapEntry(0, $1FC, $06, 0, 0, 2, 0, $11A)
    %spritemapEntry(0, $1FC, $FE, 0, 0, 2, 0, $10A)
    %spritemapEntry(0, $1F9, $05, 0, 0, 2, 0, $119)
    %spritemapEntry(0, $1FD, $18, 0, 0, 2, 0, $126)
    %spritemapEntry(0, $1FE, $14, 0, 0, 2, 0, $131)
    %spritemapEntry(0, $1FE, $0C, 0, 0, 2, 0, $121)
    %spritemapEntry(0, $1F9, $FD, 0, 0, 2, 0, $109)
    %spritemapEntry(0, $1F5, $18, 0, 0, 2, 0, $125)
    %spritemapEntry(0, $01, $09, 0, 0, 2, 0, $16F)
    %spritemapEntry(0, $1F9, $09, 0, 0, 2, 0, $16E)
    %spritemapEntry(0, $05, $11, 0, 0, 2, 0, $144)
    %spritemapEntry(0, $05, $09, 0, 0, 2, 0, $143)

UNUSED_Spitemaps_SpacePirate_B2D9F8:
    dw $000B
    %spritemapEntry(0, $1FA, $14, 0, 0, 2, 0, $146)
    %spritemapEntry(0, $1F2, $14, 0, 0, 2, 0, $145)
    %spritemapEntry(0, $06, $18, 0, 0, 2, 0, $146)
    %spritemapEntry(0, $1FE, $18, 0, 0, 2, 0, $145)
    %spritemapEntry(0, $03, $13, 0, 0, 2, 0, $134)
    %spritemapEntry(0, $03, $0B, 0, 0, 2, 0, $124)
    %spritemapEntry(0, $1FE, $07, 0, 0, 2, 0, $11B)
    %spritemapEntry(0, $1FF, $FF, 0, 0, 2, 0, $10B)
    %spritemapEntry(1, $1F5, $FD, 0, 0, 2, 0, $107)
    %spritemapEntry(0, $1F9, $0F, 0, 0, 2, 0, $134)
    %spritemapEntry(0, $1F9, $07, 0, 0, 2, 0, $124)

UNUSED_Spitemaps_SpacePirate_B2DA31:
    dw $000A
    %spritemapEntry(0, $1FC, $08, 0, 0, 2, 0, $11B)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 0, $10A)
    %spritemapEntry(0, $1F0, $12, 0, 0, 2, 0, $130)
    %spritemapEntry(1, $1FF, $08, 0, 0, 2, 0, $17E)
    %spritemapEntry(0, $1EB, $16, 0, 0, 2, 0, $136)
    %spritemapEntry(0, $1E4, $16, 0, 0, 2, 0, $135)
    %spritemapEntry(0, $0D, $16, 0, 0, 2, 0, $144)
    %spritemapEntry(0, $0C, $0E, 0, 0, 2, 0, $143)
    %spritemapEntry(0, $1F0, $0A, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $1F3, $FF, 0, 0, 2, 0, $107)

UNUSED_Spitemaps_SpacePirate_B2DA65:
    dw $000C
    %spritemapEntry(0, $0A, $0F, 0, 0, 2, 0, $18D)
    %spritemapEntry(0, $0A, $07, 0, 0, 2, 0, $17D)
    %spritemapEntry(0, $1F5, $18, 0, 0, 2, 0, $126)
    %spritemapEntry(0, $1ED, $18, 0, 0, 2, 0, $125)
    %spritemapEntry(0, $06, $09, 0, 0, 2, 0, $16D)
    %spritemapEntry(0, $1FE, $09, 0, 0, 2, 0, $16C)
    %spritemapEntry(0, $1F6, $13, 0, 0, 2, 0, $131)
    %spritemapEntry(0, $1F7, $0B, 0, 0, 2, 0, $121)
    %spritemapEntry(0, $1FB, $06, 0, 0, 2, 0, $11A)
    %spritemapEntry(0, $1FB, $FE, 0, 0, 2, 0, $10A)
    %spritemapEntry(0, $1F8, $07, 0, 0, 2, 0, $119)
    %spritemapEntry(0, $1F8, $FF, 0, 0, 2, 0, $109)

UNUSED_Spitemaps_SpacePirate_B2DAA3:
    dw $000C
    %spritemapEntry(0, $07, $12, 0, 0, 2, 0, $144)
    %spritemapEntry(0, $07, $0A, 0, 0, 2, 0, $143)
    %spritemapEntry(0, $02, $0A, 0, 0, 2, 0, $16F)
    %spritemapEntry(0, $1FA, $0A, 0, 0, 2, 0, $16E)
    %spritemapEntry(0, $1FA, $06, 0, 0, 2, 0, $119)
    %spritemapEntry(0, $1FB, $FE, 0, 0, 2, 0, $109)
    %spritemapEntry(0, $1FD, $18, 0, 0, 2, 0, $126)
    %spritemapEntry(0, $1F5, $18, 0, 0, 2, 0, $125)
    %spritemapEntry(0, $1FE, $15, 0, 0, 2, 0, $131)
    %spritemapEntry(0, $1FE, $0D, 0, 0, 2, 0, $121)
    %spritemapEntry(0, $1FC, $08, 0, 0, 2, 0, $11A)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 0, $10A)

UNUSED_Spitemaps_SpacePirate_B2DAE1:
    dw $000B
    %spritemapEntry(0, $1FA, $14, 0, 0, 2, 0, $146)
    %spritemapEntry(0, $1F2, $14, 0, 0, 2, 0, $145)
    %spritemapEntry(1, $1F6, $FC, 0, 0, 2, 0, $107)
    %spritemapEntry(0, $1F8, $0E, 0, 0, 2, 0, $134)
    %spritemapEntry(0, $1F8, $06, 0, 0, 2, 0, $124)
    %spritemapEntry(0, $04, $18, 0, 0, 2, 0, $146)
    %spritemapEntry(0, $1FC, $18, 0, 0, 2, 0, $145)
    %spritemapEntry(0, $01, $13, 0, 0, 2, 0, $134)
    %spritemapEntry(0, $01, $0B, 0, 0, 2, 0, $124)
    %spritemapEntry(0, $1FC, $07, 0, 0, 2, 0, $11B)
    %spritemapEntry(0, $1FD, $FF, 0, 0, 2, 0, $10B)
endif ; !FEATURE_KEEP_UNREFERENCED

Spitemaps_PirateNinja_47:
    dw $0009
    %spritemapEntry(0, $1FC, $FC, 0, 1, 2, 0, $112)
    %spritemapEntry(0, $1FC, $F4, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $1EC, $01, 0, 0, 2, 0, $127)
    %spritemapEntry(1, $1F4, $01, 0, 0, 2, 0, $128)
    %spritemapEntry(1, $1F8, $F0, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1F1, $EA, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $1F6, $FE, 0, 0, 2, 0, $14C)
    %spritemapEntry(0, $1EE, $FE, 0, 0, 2, 0, $14B)
    %spritemapEntry(0, $1E6, $FE, 0, 0, 2, 0, $14A)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spitemaps_SpacePirate_B2DB49:
    dw $0009
    %spritemapEntry(1, $1EB, $00, 0, 0, 2, 0, $127)
    %spritemapEntry(1, $1F3, $00, 0, 0, 2, 0, $128)
    %spritemapEntry(0, $1FB, $FB, 0, 0, 2, 0, $113)
    %spritemapEntry(0, $1FA, $F3, 0, 0, 2, 0, $103)
    %spritemapEntry(1, $1F8, $EF, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1F1, $EA, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $1F8, $FD, 0, 0, 2, 0, $14C)
    %spritemapEntry(0, $1F0, $FD, 0, 0, 2, 0, $14B)
    %spritemapEntry(0, $1E8, $FD, 0, 0, 2, 0, $14A)

UNUSED_Spitemaps_SpacePirate_B2DB78:
    dw $0008
    %spritemapEntry(1, $1E9, $FE, 0, 0, 2, 0, $127)
    %spritemapEntry(1, $1F1, $FE, 0, 0, 2, 0, $128)
    %spritemapEntry(0, $1FA, $F8, 0, 0, 2, 0, $113)
    %spritemapEntry(0, $1FA, $F0, 0, 0, 2, 0, $103)
    %spritemapEntry(1, $1F8, $EE, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1F1, $E8, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $1F3, $FC, 0, 0, 2, 0, $14B)
    %spritemapEntry(0, $1EB, $FD, 0, 0, 2, 0, $14A)

UNUSED_Spitemaps_SpacePirate_B2DBA2:
    dw $0008
    %spritemapEntry(1, $1E8, $00, 0, 0, 2, 0, $127)
    %spritemapEntry(1, $1F0, $00, 0, 0, 2, 0, $128)
    %spritemapEntry(0, $1FA, $FA, 0, 0, 2, 0, $113)
    %spritemapEntry(0, $1FA, $F2, 0, 0, 2, 0, $103)
    %spritemapEntry(1, $1F8, $EF, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1F1, $E9, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $1F5, $FE, 0, 0, 2, 0, $14B)
    %spritemapEntry(0, $1ED, $FF, 0, 0, 2, 0, $14A)

UNUSED_Spitemaps_SpacePirate_B2DBCC:
    dw $0007
    %spritemapEntry(0, $1F6, $FC, 0, 0, 2, 0, $14C)
    %spritemapEntry(0, $1EE, $FC, 0, 0, 2, 0, $14B)
    %spritemapEntry(0, $1E6, $FC, 0, 0, 2, 0, $14A)
    %spritemapEntry(0, $1FB, $FA, 0, 0, 2, 0, $112)
    %spritemapEntry(0, $1FB, $F2, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F8, $EF, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1F1, $E9, 0, 0, 2, 0, $10E)

UNUSED_Spitemaps_SpacePirate_B2DBF1:
    dw $0007
    %spritemapEntry(1, $1F4, $F2, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $1E2, $F3, 0, 0, 2, 0, $12A)
    %spritemapEntry(1, $1EA, $F3, 0, 0, 2, 0, $12B)
    %spritemapEntry(1, $1F8, $EF, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1F1, $E9, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $1F2, $FD, 0, 0, 2, 0, $14B)
    %spritemapEntry(0, $1EA, $FD, 0, 0, 2, 0, $14A)

UNUSED_Spitemaps_SpacePirate_B2DC16:
    dw $0009
    %spritemapEntry(0, $1F1, $FD, 0, 0, 2, 0, $14B)
    %spritemapEntry(0, $1E9, $FD, 0, 0, 2, 0, $14A)
    %spritemapEntry(0, $1E0, $E9, 0, 0, 2, 0, $12A)
    %spritemapEntry(1, $1E8, $E9, 0, 0, 2, 0, $12B)
    %spritemapEntry(0, $1FB, $F1, 0, 0, 2, 0, $14F)
    %spritemapEntry(0, $1F3, $F1, 0, 0, 2, 0, $14E)
    %spritemapEntry(1, $1F8, $EF, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1F1, $E9, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $1F6, $FD, 0, 0, 2, 0, $14C)

UNUSED_Spitemaps_SpacePirate_B2DC45:
    dw $000A
    %spritemapEntry(0, $1F0, $FD, 0, 0, 2, 0, $14B)
    %spritemapEntry(0, $1E8, $FD, 0, 0, 2, 0, $14A)
    %spritemapEntry(0, $1FA, $E4, 0, 0, 2, 0, $14D)
    %spritemapEntry(0, $1FA, $DC, 0, 0, 2, 0, $13D)
    %spritemapEntry(0, $1FA, $D4, 0, 0, 2, 0, $12D)
    %spritemapEntry(0, $1FB, $E8, 1, 1, 2, 0, $113)
    %spritemapEntry(0, $1FB, $F0, 1, 1, 2, 0, $103)
    %spritemapEntry(1, $1F8, $F0, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1F1, $EA, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $1F6, $FD, 0, 0, 2, 0, $14C)

UNUSED_Spitemaps_SpacePirate_B2DC79:
    dw $0014
    %spritemapEntry(0, $1F6, $12, 0, 0, 2, 0, $134)
    %spritemapEntry(0, $1F6, $0A, 0, 0, 2, 0, $124)
    %spritemapEntry(0, $1F7, $15, 0, 0, 2, 0, $126)
    %spritemapEntry(0, $1E2, $F4, 0, 0, 2, 0, $12A)
    %spritemapEntry(1, $1EA, $F4, 0, 0, 2, 0, $12B)
    %spritemapEntry(0, $1F7, $FA, 0, 0, 2, 0, $112)
    %spritemapEntry(0, $1F8, $F2, 0, 0, 2, 0, $102)
    %spritemapEntry(0, $02, $12, 0, 0, 2, 0, $134)
    %spritemapEntry(0, $1FD, $16, 0, 0, 2, 0, $125)
    %spritemapEntry(0, $1FD, $07, 0, 0, 2, 0, $11A)
    %spritemapEntry(0, $1FE, $FF, 0, 0, 2, 0, $10A)
    %spritemapEntry(0, $01, $0A, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $1F6, $F0, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1F0, $EA, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $1EF, $16, 0, 0, 2, 0, $145)
    %spritemapEntry(1, $1F3, $FF, 0, 0, 2, 0, $107)
    %spritemapEntry(0, $1F6, $FE, 0, 0, 2, 0, $14C)
    %spritemapEntry(0, $1EE, $FE, 0, 0, 2, 0, $14B)
    %spritemapEntry(0, $1E6, $FE, 0, 0, 2, 0, $14A)
    %spritemapEntry(0, $05, $15, 0, 0, 2, 0, $126)

UNUSED_Spitemaps_SpacePirate_B2DCDF:
    dw $0013
    %spritemapEntry(0, $1F7, $08, 0, 0, 2, 0, $124)
    %spritemapEntry(0, $07, $16, 0, 0, 2, 0, $146)
    %spritemapEntry(0, $1FF, $05, 0, 0, 2, 0, $11A)
    %spritemapEntry(0, $1FF, $FD, 0, 0, 2, 0, $10A)
    %spritemapEntry(0, $1E2, $F3, 0, 0, 2, 0, $12A)
    %spritemapEntry(1, $1EA, $F3, 0, 0, 2, 0, $12B)
    %spritemapEntry(1, $1F2, $F1, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $1F6, $EF, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1EF, $EA, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $1F8, $16, 0, 0, 2, 0, $146)
    %spritemapEntry(0, $1F0, $15, 0, 0, 2, 0, $145)
    %spritemapEntry(0, $1FF, $15, 0, 0, 2, 0, $145)
    %spritemapEntry(0, $03, $10, 0, 0, 2, 0, $134)
    %spritemapEntry(0, $02, $08, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $1F4, $FE, 0, 0, 2, 0, $107)
    %spritemapEntry(0, $1F7, $10, 0, 0, 2, 0, $134)
    %spritemapEntry(0, $1F5, $FD, 0, 0, 2, 0, $14C)
    %spritemapEntry(0, $1ED, $FD, 0, 0, 2, 0, $14B)
    %spritemapEntry(0, $1E5, $FD, 0, 0, 2, 0, $14A)

UNUSED_Spitemaps_SpacePirate_B2DD40:
    dw $0014
    %spritemapEntry(0, $1F7, $09, 0, 0, 2, 0, $124)
    %spritemapEntry(0, $1F7, $06, 0, 0, 2, 0, $119)
    %spritemapEntry(0, $1F7, $FF, 0, 0, 2, 0, $109)
    %spritemapEntry(0, $1E0, $F5, 0, 0, 2, 0, $12A)
    %spritemapEntry(1, $1E8, $F5, 0, 0, 2, 0, $12B)
    %spritemapEntry(1, $1F1, $F3, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $1F5, $F0, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1EE, $EB, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $1F8, $16, 0, 0, 2, 0, $146)
    %spritemapEntry(0, $1F0, $16, 0, 0, 2, 0, $145)
    %spritemapEntry(0, $06, $16, 0, 0, 2, 0, $146)
    %spritemapEntry(0, $1FE, $16, 0, 0, 2, 0, $145)
    %spritemapEntry(0, $03, $11, 0, 0, 2, 0, $134)
    %spritemapEntry(0, $03, $09, 0, 0, 2, 0, $124)
    %spritemapEntry(0, $1FF, $07, 0, 0, 2, 0, $11B)
    %spritemapEntry(0, $1FF, $FF, 0, 0, 2, 0, $10B)
    %spritemapEntry(0, $1F8, $11, 0, 0, 2, 0, $134)
    %spritemapEntry(0, $1F4, $FE, 0, 0, 2, 0, $14C)
    %spritemapEntry(0, $1EC, $FE, 0, 0, 2, 0, $14B)
    %spritemapEntry(0, $1E4, $FE, 0, 0, 2, 0, $14A)

UNUSED_Spitemaps_SpacePirate_B2DDA6:
    dw $000E
    %spritemapEntry(1, $1F4, $FF, 0, 0, 2, 0, $128)
    %spritemapEntry(1, $1EC, $FF, 0, 0, 2, 0, $127)
    %spritemapEntry(0, $03, $15, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $1FA, $0B, 0, 0, 2, 0, $122)
    %spritemapEntry(0, $1FB, $FC, 0, 0, 2, 0, $113)
    %spritemapEntry(0, $1FB, $F4, 0, 0, 2, 0, $103)
    %spritemapEntry(1, $1F2, $EB, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $1F7, $F2, 0, 0, 2, 0, $12E)
    %spritemapEntry(0, $1FB, $15, 0, 0, 2, 0, $125)
    %spritemapEntry(1, $1F7, $FF, 0, 0, 2, 0, $107)
    %spritemapEntry(1, $1F3, $FF, 0, 0, 2, 0, $107)
    %spritemapEntry(1, $1F4, $0A, 0, 0, 2, 0, $122)
    %spritemapEntry(0, $1FB, $15, 0, 0, 2, 0, $126)
    %spritemapEntry(0, $1F3, $15, 0, 0, 2, 0, $125)
endif ; !FEATURE_KEEP_UNREFERENCED

Spitemaps_PirateNinja_48:
    dw $0012
    %spritemapEntry(1, $1F3, $EC, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $08, $FC, 1, 1, 2, 0, $14D)
    %spritemapEntry(0, $09, $04, 1, 1, 2, 0, $13D)
    %spritemapEntry(0, $09, $0C, 1, 1, 2, 0, $12D)
    %spritemapEntry(1, $1FE, $F2, 0, 0, 2, 0, $105)
    %spritemapEntry(1, $1F9, $F1, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1EE, $F3, 0, 0, 2, 0, $12B)
    %spritemapEntry(1, $1E6, $F3, 0, 0, 2, 0, $12A)
    %spritemapEntry(1, $1F7, $FF, 0, 0, 2, 0, $107)
    %spritemapEntry(0, $02, $11, 0, 0, 2, 0, $144)
    %spritemapEntry(0, $02, $09, 0, 0, 2, 0, $143)
    %spritemapEntry(0, $1F7, $09, 1, 1, 2, 0, $149)
    %spritemapEntry(0, $1FF, $09, 1, 1, 2, 0, $148)
    %spritemapEntry(1, $1F4, $FF, 0, 0, 2, 0, $107)
    %spritemapEntry(0, $1F5, $0B, 1, 1, 2, 0, $149)
    %spritemapEntry(0, $1FD, $0B, 1, 1, 2, 0, $148)
    %spritemapEntry(0, $1FE, $13, 0, 0, 2, 0, $144)
    %spritemapEntry(0, $1FE, $0B, 0, 0, 2, 0, $143)

Spitemaps_PirateNinja_49:
    dw $0016
    %spritemapEntry(0, $1FE, $15, 0, 0, 2, 0, $134)
    %spritemapEntry(0, $1FD, $0D, 0, 0, 2, 0, $124)
    %spritemapEntry(0, $1FA, $FB, 0, 0, 2, 0, $14C)
    %spritemapEntry(0, $1F2, $FB, 0, 0, 2, 0, $14B)
    %spritemapEntry(0, $1EA, $FB, 0, 0, 2, 0, $14A)
    %spritemapEntry(0, $1FC, $F9, 0, 0, 2, 0, $113)
    %spritemapEntry(0, $1FC, $F1, 0, 0, 2, 0, $103)
    %spritemapEntry(0, $00, $18, 0, 0, 2, 0, $126)
    %spritemapEntry(0, $1F8, $18, 0, 0, 2, 0, $125)
    %spritemapEntry(0, $1FB, $08, 0, 0, 2, 0, $11A)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 0, $10A)
    %spritemapEntry(1, $1F3, $E6, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $1F9, $EF, 0, 0, 2, 0, $12E)
    %spritemapEntry(0, $1FA, $FD, 0, 0, 2, 0, $149)
    %spritemapEntry(0, $1F2, $FD, 0, 0, 2, 0, $148)
    %spritemapEntry(0, $1F4, $0D, 0, 0, 2, 0, $146)
    %spritemapEntry(0, $1EC, $0D, 0, 0, 2, 0, $145)
    %spritemapEntry(0, $1F3, $09, 0, 0, 2, 0, $134)
    %spritemapEntry(0, $1F3, $01, 0, 0, 2, 0, $124)
    %spritemapEntry(0, $04, $F9, 1, 1, 2, 0, $14D)
    %spritemapEntry(0, $05, $01, 1, 1, 2, 0, $13D)
    %spritemapEntry(0, $06, $09, 1, 1, 2, 0, $12D)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spitemaps_SpacePirate_B2DEBA:
    dw $0014
    %spritemapEntry(0, $1F8, $F2, 0, 0, 2, 0, $14F)
    %spritemapEntry(0, $1F0, $F1, 0, 0, 2, 0, $14E)
    %spritemapEntry(0, $1EC, $EE, 0, 0, 2, 0, $14D)
    %spritemapEntry(0, $1EC, $E6, 0, 0, 2, 0, $13D)
    %spritemapEntry(0, $1EC, $DE, 0, 0, 2, 0, $12D)
    %spritemapEntry(1, $1F5, $F1, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1EE, $EB, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $1EC, $F0, 0, 0, 2, 0, $13D)
    %spritemapEntry(0, $1EC, $F8, 0, 0, 2, 0, $14D)
    %spritemapEntry(1, $1EE, $F1, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $1F7, $FF, 0, 0, 2, 0, $107)
    %spritemapEntry(0, $04, $11, 0, 0, 2, 0, $144)
    %spritemapEntry(0, $04, $09, 0, 0, 2, 0, $143)
    %spritemapEntry(0, $1F7, $09, 1, 1, 2, 0, $149)
    %spritemapEntry(0, $1FF, $09, 1, 1, 2, 0, $148)
    %spritemapEntry(1, $1F4, $FF, 0, 0, 2, 0, $107)
    %spritemapEntry(0, $1F5, $0B, 1, 1, 2, 0, $149)
    %spritemapEntry(0, $1FD, $0B, 1, 1, 2, 0, $148)
    %spritemapEntry(0, $1FE, $13, 0, 0, 2, 0, $144)
    %spritemapEntry(0, $1FE, $0B, 0, 0, 2, 0, $143)

UNUSED_Spitemaps_SpacePirate_B2DF20:
    dw $000F
    %spritemapEntry(0, $1E8, $F7, 0, 0, 2, 0, $12A)
    %spritemapEntry(1, $1F0, $F7, 0, 0, 2, 0, $12B)
    %spritemapEntry(1, $1F7, $F6, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $1FB, $F2, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1F4, $EC, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $1FE, $0B, 0, 0, 2, 0, $146)
    %spritemapEntry(0, $1F6, $0B, 0, 0, 2, 0, $145)
    %spritemapEntry(0, $01, $00, 0, 0, 2, 0, $149)
    %spritemapEntry(0, $1F9, $FF, 0, 0, 2, 0, $148)
    %spritemapEntry(1, $1F7, $01, 0, 0, 2, 0, $122)
    %spritemapEntry(0, $1EF, $F9, 0, 0, 2, 0, $14D)
    %spritemapEntry(0, $1EE, $F1, 0, 0, 2, 0, $13D)
    %spritemapEntry(0, $1ED, $E9, 0, 0, 2, 0, $12D)
    %spritemapEntry(0, $02, $0D, 0, 0, 2, 0, $144)
    %spritemapEntry(0, $02, $05, 0, 0, 2, 0, $143)

UNUSED_Spitemaps_SpacePirate_B2DF6D:
    dw $000E
    %spritemapEntry(0, $1F0, $05, 1, 1, 2, 0, $18D)
    %spritemapEntry(0, $1F0, $0D, 1, 1, 2, 0, $17D)
    %spritemapEntry(0, $1F6, $0B, 0, 0, 2, 0, $130)
    %spritemapEntry(0, $1F6, $03, 0, 0, 2, 0, $120)
    %spritemapEntry(0, $1E9, $F4, 0, 0, 2, 0, $12A)
    %spritemapEntry(1, $1F1, $F4, 0, 0, 2, 0, $12B)
    %spritemapEntry(1, $1F8, $F3, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $1FC, $F0, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1F5, $EA, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $01, $FE, 0, 0, 2, 0, $149)
    %spritemapEntry(0, $1F9, $FE, 0, 0, 2, 0, $148)
    %spritemapEntry(0, $1F1, $F6, 0, 0, 2, 0, $14D)
    %spritemapEntry(0, $1F0, $EE, 0, 0, 2, 0, $13D)
    %spritemapEntry(0, $1EF, $E6, 0, 0, 2, 0, $12D)

UNUSED_Spitemaps_SpacePirate_B2DFB5:
    dw $000E
    %spritemapEntry(0, $1F0, $05, 1, 1, 2, 0, $18D)
    %spritemapEntry(0, $1F0, $0D, 1, 1, 2, 0, $17D)
    %spritemapEntry(0, $1F5, $0B, 0, 0, 2, 0, $130)
    %spritemapEntry(0, $1F5, $03, 0, 0, 2, 0, $120)
    %spritemapEntry(0, $1E8, $F3, 0, 0, 2, 0, $12A)
    %spritemapEntry(1, $1F0, $F3, 0, 0, 2, 0, $12B)
    %spritemapEntry(1, $1F8, $F2, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $1FC, $F1, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1F5, $EB, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $01, $FF, 0, 0, 2, 0, $149)
    %spritemapEntry(0, $1F9, $FE, 0, 0, 2, 0, $148)
    %spritemapEntry(0, $1F0, $F7, 0, 0, 2, 0, $14D)
    %spritemapEntry(0, $1EF, $EF, 0, 0, 2, 0, $13D)
    %spritemapEntry(0, $1EE, $E7, 0, 0, 2, 0, $12D)

UNUSED_Spitemaps_SpacePirate_B2DFFD:
    dw $0009
    %spritemapEntry(0, $1F9, $00, 1, 1, 2, 0, $14D)
    %spritemapEntry(0, $1F9, $08, 1, 1, 2, 0, $13D)
    %spritemapEntry(0, $1F9, $10, 1, 1, 2, 0, $12D)
    %spritemapEntry(0, $1FA, $FA, 0, 0, 2, 0, $113)
    %spritemapEntry(0, $1FA, $F2, 0, 0, 2, 0, $103)
    %spritemapEntry(1, $1F8, $EF, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $1F1, $E9, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $1F5, $FD, 0, 0, 2, 0, $14B)
    %spritemapEntry(0, $1ED, $FE, 0, 0, 2, 0, $14A)

UNUSED_Spitemaps_SpacePirate_B2E02C:
    dw $0003
    %spritemapEntry(0, $1FC, $04, 0, 0, 2, 0, $14D)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 0, $13D)
    %spritemapEntry(0, $1FC, $F4, 0, 0, 2, 0, $12D)

UNUSED_Spitemaps_SpacePirate_B2E03D:
    dw $0010
    %spritemapEntry(1, $1F9, $FE, 0, 0, 2, 0, $107)
    %spritemapEntry(0, $1E4, $F3, 0, 0, 2, 0, $12A)
    %spritemapEntry(1, $1EC, $F3, 0, 0, 2, 0, $12B)
    %spritemapEntry(1, $1F6, $F1, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $1F2, $EB, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $1F9, $F1, 0, 0, 2, 0, $12E)
    %spritemapEntry(0, $1ED, $F9, 0, 0, 2, 0, $14D)
    %spritemapEntry(0, $1EC, $F1, 0, 0, 2, 0, $13D)
    %spritemapEntry(0, $1EB, $E9, 0, 0, 2, 0, $12D)
    %spritemapEntry(1, $1F4, $FE, 0, 0, 2, 0, $107)
    %spritemapEntry(0, $1FC, $10, 0, 0, 2, 0, $125)
    %spritemapEntry(1, $1F3, $05, 0, 0, 2, 0, $122)
    %spritemapEntry(0, $04, $10, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $1FB, $07, 0, 0, 2, 0, $122)
    %spritemapEntry(0, $1FA, $10, 0, 0, 2, 0, $126)
    %spritemapEntry(0, $1F2, $10, 0, 0, 2, 0, $125)
endif ; !FEATURE_KEEP_UNREFERENCED

Spitemaps_PirateNinja_4A:
    dw $0011
    %spritemapEntry(1, $1F3, $FB, 0, 0, 2, 0, $127)
    %spritemapEntry(1, $1FB, $FB, 0, 0, 2, 0, $128)
    %spritemapEntry(0, $1FE, $0D, 0, 0, 2, 0, $121)
    %spritemapEntry(0, $1FE, $15, 0, 0, 2, 0, $131)
    %spritemapEntry(0, $1FD, $18, 0, 0, 2, 0, $126)
    %spritemapEntry(0, $1F5, $18, 0, 0, 2, 0, $125)
    %spritemapEntry(0, $1FC, $08, 0, 0, 2, 0, $11A)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 0, $10A)
    %spritemapEntry(0, $07, $12, 0, 0, 2, 0, $144)
    %spritemapEntry(0, $07, $0A, 0, 0, 2, 0, $143)
    %spritemapEntry(0, $1FA, $06, 0, 0, 2, 0, $119)
    %spritemapEntry(0, $1FB, $FE, 0, 0, 2, 0, $109)
    %spritemapEntry(0, $1FA, $0A, 0, 0, 2, 0, $16E)
    %spritemapEntry(1, $1FA, $F0, 0, 0, 2, 0, $105)
    %spritemapEntry(1, $1F1, $E6, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $1F7, $EF, 0, 0, 2, 0, $12E)
    %spritemapEntry(0, $02, $0A, 0, 0, 2, 0, $16F)

Spitemaps_PirateNinja_4B:
    dw $0013
    %spritemapEntry(0, $1FE, $FF, 0, 0, 2, 0, $10A)
    %spritemapEntry(0, $1E8, $EE, 0, 0, 2, 0, $12A)
    %spritemapEntry(1, $1EE, $ED, 0, 0, 2, 0, $12B)
    %spritemapEntry(1, $1F6, $EF, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $0A, $F5, 1, 1, 2, 0, $14D)
    %spritemapEntry(0, $0B, $FD, 1, 1, 2, 0, $13D)
    %spritemapEntry(0, $0C, $05, 1, 1, 2, 0, $12D)
    %spritemapEntry(1, $1F7, $E9, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $1FB, $F1, 0, 0, 2, 0, $12E)
    %spritemapEntry(0, $1FD, $07, 0, 0, 2, 0, $11A)
    %spritemapEntry(0, $1E3, $FD, 1, 1, 2, 0, $16F)
    %spritemapEntry(0, $1EB, $FE, 1, 1, 2, 0, $16E)
    %spritemapEntry(0, $1FB, $FE, 0, 0, 2, 0, $19F)
    %spritemapEntry(0, $1F3, $FD, 0, 0, 2, 0, $19E)
    %spritemapEntry(0, $08, $16, 0, 0, 2, 0, $126)
    %spritemapEntry(0, $00, $17, 0, 0, 2, 0, $125)
    %spritemapEntry(1, $1FE, $0A, 0, 0, 2, 0, $122)
    %spritemapEntry(0, $1DE, $F4, 1, 1, 2, 0, $18D)
    %spritemapEntry(0, $1DD, $FC, 1, 1, 2, 0, $17D)

Spitemaps_PirateNinja_4C:
    dw $0013
    %spritemapEntry(0, $1DE, $0A, 0, 0, 2, 0, $19D)
    %spritemapEntry(1, $1E2, $01, 0, 0, 2, 0, $1AC)
    %spritemapEntry(1, $1EF, $FB, 0, 0, 2, 0, $1AE)
    %spritemapEntry(0, $09, $F4, 1, 1, 2, 0, $14D)
    %spritemapEntry(0, $0A, $FC, 1, 1, 2, 0, $13D)
    %spritemapEntry(0, $0A, $04, 1, 1, 2, 0, $12D)
    %spritemapEntry(0, $06, $F3, 0, 0, 2, 0, $15F)
    %spritemapEntry(0, $1FE, $F4, 0, 0, 2, 0, $15E)
    %spritemapEntry(0, $1FF, $00, 0, 1, 2, 0, $10A)
    %spritemapEntry(1, $1F3, $EC, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $1F9, $F2, 0, 0, 2, 0, $12E)
    %spritemapEntry(0, $1EF, $10, 0, 1, 2, 0, $18D)
    %spritemapEntry(0, $1EF, $08, 0, 1, 2, 0, $17D)
    %spritemapEntry(0, $1F4, $08, 0, 1, 2, 0, $16F)
    %spritemapEntry(0, $1FC, $09, 0, 1, 2, 0, $16E)
    %spritemapEntry(0, $00, $08, 0, 1, 2, 0, $11A)
    %spritemapEntry(0, $1F5, $EA, 0, 0, 2, 0, $14D)
    %spritemapEntry(0, $1F4, $E2, 0, 0, 2, 0, $13D)
    %spritemapEntry(0, $1F4, $DA, 0, 0, 2, 0, $12D)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spitemaps_SpacePirate_B2E1A8:
    dw $000A
    %spritemapEntry(1, $1FC, $00, 0, 1, 2, 0, $107)
    %spritemapEntry(0, $1FB, $08, 0, 1, 2, 0, $11B)
    %spritemapEntry(0, $1FB, $00, 0, 1, 2, 0, $10B)
    %spritemapEntry(0, $0B, $16, 0, 1, 2, 0, $136)
    %spritemapEntry(1, $1F0, $08, 0, 1, 2, 0, $17E)
    %spritemapEntry(0, $07, $13, 0, 1, 2, 0, $130)
    %spritemapEntry(0, $07, $0B, 0, 1, 2, 0, $120)
    %spritemapEntry(0, $12, $16, 0, 1, 2, 0, $135)
    %spritemapEntry(0, $1EB, $16, 0, 1, 2, 0, $144)
    %spritemapEntry(0, $1EC, $0E, 0, 1, 2, 0, $143)

UNUSED_Spitemaps_SpacePirate_B2E1DC:
    dw $000C
    %spritemapEntry(0, $1ED, $10, 0, 1, 2, 0, $18D)
    %spritemapEntry(0, $1ED, $08, 0, 1, 2, 0, $17D)
    %spritemapEntry(0, $1F0, $09, 0, 1, 2, 0, $16D)
    %spritemapEntry(0, $1F8, $09, 0, 1, 2, 0, $16C)
    %spritemapEntry(0, $1FF, $12, 0, 1, 2, 0, $131)
    %spritemapEntry(0, $1FF, $0A, 0, 1, 2, 0, $121)
    %spritemapEntry(0, $01, $18, 0, 1, 2, 0, $126)
    %spritemapEntry(0, $09, $18, 0, 1, 2, 0, $125)
    %spritemapEntry(0, $1FE, $06, 0, 1, 2, 0, $119)
    %spritemapEntry(0, $1FE, $FE, 0, 1, 2, 0, $109)
    %spritemapEntry(0, $1FC, $06, 0, 1, 2, 0, $11A)
    %spritemapEntry(0, $1FC, $FE, 0, 1, 2, 0, $10A)

UNUSED_Spitemaps_SpacePirate_B2E21A:
    dw $000C
    %spritemapEntry(0, $1FC, $06, 0, 1, 2, 0, $11A)
    %spritemapEntry(0, $1FC, $FE, 0, 1, 2, 0, $10A)
    %spritemapEntry(0, $1FF, $05, 0, 1, 2, 0, $119)
    %spritemapEntry(0, $1FB, $18, 0, 1, 2, 0, $126)
    %spritemapEntry(0, $1FA, $14, 0, 1, 2, 0, $131)
    %spritemapEntry(0, $1FA, $0C, 0, 1, 2, 0, $121)
    %spritemapEntry(0, $1FF, $FD, 0, 1, 2, 0, $109)
    %spritemapEntry(0, $03, $18, 0, 1, 2, 0, $125)
    %spritemapEntry(0, $1F7, $09, 0, 1, 2, 0, $16F)
    %spritemapEntry(0, $1FF, $09, 0, 1, 2, 0, $16E)
    %spritemapEntry(0, $1F3, $11, 0, 1, 2, 0, $144)
    %spritemapEntry(0, $1F3, $09, 0, 1, 2, 0, $143)

UNUSED_Spitemaps_SpacePirate_B2E258:
    dw $000B
    %spritemapEntry(0, $1FE, $14, 0, 1, 2, 0, $146)
    %spritemapEntry(0, $06, $14, 0, 1, 2, 0, $145)
    %spritemapEntry(0, $1F2, $18, 0, 1, 2, 0, $146)
    %spritemapEntry(0, $1FA, $18, 0, 1, 2, 0, $145)
    %spritemapEntry(0, $1F5, $13, 0, 1, 2, 0, $134)
    %spritemapEntry(0, $1F5, $0B, 0, 1, 2, 0, $124)
    %spritemapEntry(0, $1FA, $07, 0, 1, 2, 0, $11B)
    %spritemapEntry(0, $1F9, $FF, 0, 1, 2, 0, $10B)
    %spritemapEntry(1, $1FB, $FD, 0, 1, 2, 0, $107)
    %spritemapEntry(0, $1FF, $0F, 0, 1, 2, 0, $134)
    %spritemapEntry(0, $1FF, $07, 0, 1, 2, 0, $124)

UNUSED_Spitemaps_SpacePirate_B2E291:
    dw $000A
    %spritemapEntry(0, $1FC, $08, 0, 1, 2, 0, $11B)
    %spritemapEntry(0, $1FC, $00, 0, 1, 2, 0, $10A)
    %spritemapEntry(0, $08, $12, 0, 1, 2, 0, $130)
    %spritemapEntry(1, $1F1, $08, 0, 1, 2, 0, $17E)
    %spritemapEntry(0, $0D, $16, 0, 1, 2, 0, $136)
    %spritemapEntry(0, $14, $16, 0, 1, 2, 0, $135)
    %spritemapEntry(0, $1EB, $16, 0, 1, 2, 0, $144)
    %spritemapEntry(0, $1EC, $0E, 0, 1, 2, 0, $143)
    %spritemapEntry(0, $08, $0A, 0, 1, 2, 0, $120)
    %spritemapEntry(1, $1FD, $FF, 0, 1, 2, 0, $107)

UNUSED_Spitemaps_SpacePirate_B2E2C5:
    dw $000C
    %spritemapEntry(0, $1EE, $0F, 0, 1, 2, 0, $18D)
    %spritemapEntry(0, $1EE, $07, 0, 1, 2, 0, $17D)
    %spritemapEntry(0, $03, $18, 0, 1, 2, 0, $126)
    %spritemapEntry(0, $0B, $18, 0, 1, 2, 0, $125)
    %spritemapEntry(0, $1F2, $09, 0, 1, 2, 0, $16D)
    %spritemapEntry(0, $1FA, $09, 0, 1, 2, 0, $16C)
    %spritemapEntry(0, $02, $13, 0, 1, 2, 0, $131)
    %spritemapEntry(0, $01, $0B, 0, 1, 2, 0, $121)
    %spritemapEntry(0, $1FD, $06, 0, 1, 2, 0, $11A)
    %spritemapEntry(0, $1FD, $FE, 0, 1, 2, 0, $10A)
    %spritemapEntry(0, $00, $07, 0, 1, 2, 0, $119)
    %spritemapEntry(0, $00, $FF, 0, 1, 2, 0, $109)

UNUSED_Spitemaps_SpacePirate_B2E303:
    dw $000C
    %spritemapEntry(0, $1F1, $12, 0, 1, 2, 0, $144)
    %spritemapEntry(0, $1F1, $0A, 0, 1, 2, 0, $143)
    %spritemapEntry(0, $1F6, $0A, 0, 1, 2, 0, $16F)
    %spritemapEntry(0, $1FE, $0A, 0, 1, 2, 0, $16E)
    %spritemapEntry(0, $1FE, $06, 0, 1, 2, 0, $119)
    %spritemapEntry(0, $1FD, $FE, 0, 1, 2, 0, $109)
    %spritemapEntry(0, $1FB, $18, 0, 1, 2, 0, $126)
    %spritemapEntry(0, $03, $18, 0, 1, 2, 0, $125)
    %spritemapEntry(0, $1FA, $15, 0, 1, 2, 0, $131)
    %spritemapEntry(0, $1FA, $0D, 0, 1, 2, 0, $121)
    %spritemapEntry(0, $1FC, $08, 0, 1, 2, 0, $11A)
    %spritemapEntry(0, $1FC, $00, 0, 1, 2, 0, $10A)

UNUSED_Spitemaps_SpacePirate_B2E341:
    dw $000B
    %spritemapEntry(0, $1FE, $14, 0, 1, 2, 0, $146)
    %spritemapEntry(0, $06, $14, 0, 1, 2, 0, $145)
    %spritemapEntry(1, $1FA, $FC, 0, 1, 2, 0, $107)
    %spritemapEntry(0, $00, $0E, 0, 1, 2, 0, $134)
    %spritemapEntry(0, $00, $06, 0, 1, 2, 0, $124)
    %spritemapEntry(0, $1F4, $18, 0, 1, 2, 0, $146)
    %spritemapEntry(0, $1FC, $18, 0, 1, 2, 0, $145)
    %spritemapEntry(0, $1F7, $13, 0, 1, 2, 0, $134)
    %spritemapEntry(0, $1F7, $0B, 0, 1, 2, 0, $124)
    %spritemapEntry(0, $1FC, $07, 0, 1, 2, 0, $11B)
    %spritemapEntry(0, $1FB, $FF, 0, 1, 2, 0, $10B)
endif ; !FEATURE_KEEP_UNREFERENCED

Spitemaps_PirateNinja_4D:
    dw $0009
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 0, $112)
    %spritemapEntry(0, $1FC, $F4, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $04, $01, 0, 1, 2, 0, $127)
    %spritemapEntry(1, $1FC, $01, 0, 1, 2, 0, $128)
    %spritemapEntry(1, $1F8, $F0, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $1FF, $EA, 0, 1, 2, 0, $10E)
    %spritemapEntry(0, $02, $FE, 0, 1, 2, 0, $14C)
    %spritemapEntry(0, $0A, $FE, 0, 1, 2, 0, $14B)
    %spritemapEntry(0, $12, $FE, 0, 1, 2, 0, $14A)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spitemaps_SpacePirate_B2E3A9:
    dw $0009
    %spritemapEntry(1, $05, $00, 0, 1, 2, 0, $127)
    %spritemapEntry(1, $1FD, $00, 0, 1, 2, 0, $128)
    %spritemapEntry(0, $1FD, $FB, 0, 1, 2, 0, $113)
    %spritemapEntry(0, $1FE, $F3, 0, 1, 2, 0, $103)
    %spritemapEntry(1, $1F8, $EF, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $1FF, $EA, 0, 1, 2, 0, $10E)
    %spritemapEntry(0, $00, $FD, 0, 1, 2, 0, $14C)
    %spritemapEntry(0, $08, $FD, 0, 1, 2, 0, $14B)
    %spritemapEntry(0, $10, $FD, 0, 1, 2, 0, $14A)

UNUSED_Spitemaps_SpacePirate_B2E3D8:
    dw $0008
    %spritemapEntry(1, $07, $FE, 0, 1, 2, 0, $127)
    %spritemapEntry(1, $1FF, $FE, 0, 1, 2, 0, $128)
    %spritemapEntry(0, $1FE, $F8, 0, 1, 2, 0, $113)
    %spritemapEntry(0, $1FE, $F0, 0, 1, 2, 0, $103)
    %spritemapEntry(1, $1F8, $EE, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $1FF, $E8, 0, 1, 2, 0, $10E)
    %spritemapEntry(0, $05, $FC, 0, 1, 2, 0, $14B)
    %spritemapEntry(0, $0D, $FD, 0, 1, 2, 0, $14A)

UNUSED_Spitemaps_SpacePirate_B2E402:
    dw $0008
    %spritemapEntry(1, $08, $00, 0, 1, 2, 0, $127)
    %spritemapEntry(1, $00, $00, 0, 1, 2, 0, $128)
    %spritemapEntry(0, $1FE, $FA, 0, 1, 2, 0, $113)
    %spritemapEntry(0, $1FE, $F2, 0, 1, 2, 0, $103)
    %spritemapEntry(1, $1F8, $EF, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $1FF, $E9, 0, 1, 2, 0, $10E)
    %spritemapEntry(0, $03, $FE, 0, 1, 2, 0, $14B)
    %spritemapEntry(0, $0B, $FF, 0, 1, 2, 0, $14A)

UNUSED_Spitemaps_SpacePirate_B2E42C:
    dw $0007
    %spritemapEntry(0, $02, $FC, 0, 1, 2, 0, $14C)
    %spritemapEntry(0, $0A, $FC, 0, 1, 2, 0, $14B)
    %spritemapEntry(0, $12, $FC, 0, 1, 2, 0, $14A)
    %spritemapEntry(0, $1FD, $FA, 0, 1, 2, 0, $112)
    %spritemapEntry(0, $1FD, $F2, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $1F8, $EF, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $1FF, $E9, 0, 1, 2, 0, $10E)

UNUSED_Spitemaps_SpacePirate_B2E451:
    dw $0007
    %spritemapEntry(1, $1FC, $F2, 0, 1, 2, 0, $100)
    %spritemapEntry(0, $16, $F3, 0, 1, 2, 0, $12A)
    %spritemapEntry(1, $06, $F3, 0, 1, 2, 0, $12B)
    %spritemapEntry(1, $1F8, $EF, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $1FF, $E9, 0, 1, 2, 0, $10E)
    %spritemapEntry(0, $06, $FD, 0, 1, 2, 0, $14B)
    %spritemapEntry(0, $0E, $FD, 0, 1, 2, 0, $14A)

UNUSED_Spitemaps_SpacePirate_B2E476:
    dw $0009
    %spritemapEntry(0, $07, $FD, 0, 1, 2, 0, $14B)
    %spritemapEntry(0, $0F, $FD, 0, 1, 2, 0, $14A)
    %spritemapEntry(0, $18, $E9, 0, 1, 2, 0, $12A)
    %spritemapEntry(1, $08, $E9, 0, 1, 2, 0, $12B)
    %spritemapEntry(0, $1FD, $F1, 0, 1, 2, 0, $14F)
    %spritemapEntry(0, $05, $F1, 0, 1, 2, 0, $14E)
    %spritemapEntry(1, $1F8, $EF, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $1FF, $E9, 0, 1, 2, 0, $10E)
    %spritemapEntry(0, $02, $FD, 0, 1, 2, 0, $14C)

UNUSED_Spitemaps_SpacePirate_B2E4A5:
    dw $000A
    %spritemapEntry(0, $08, $FD, 0, 1, 2, 0, $14B)
    %spritemapEntry(0, $10, $FD, 0, 1, 2, 0, $14A)
    %spritemapEntry(0, $1FE, $E4, 0, 1, 2, 0, $14D)
    %spritemapEntry(0, $1FE, $DC, 0, 1, 2, 0, $13D)
    %spritemapEntry(0, $1FE, $D4, 0, 1, 2, 0, $12D)
    %spritemapEntry(0, $1FD, $E8, 1, 0, 2, 0, $113)
    %spritemapEntry(0, $1FD, $F0, 1, 0, 2, 0, $103)
    %spritemapEntry(1, $1F8, $F0, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $1FF, $EA, 0, 1, 2, 0, $10E)
    %spritemapEntry(0, $02, $FD, 0, 1, 2, 0, $14C)

UNUSED_Spitemaps_SpacePirate_B2E4D9:
    dw $0014
    %spritemapEntry(0, $02, $12, 0, 1, 2, 0, $134)
    %spritemapEntry(0, $02, $0A, 0, 1, 2, 0, $124)
    %spritemapEntry(0, $01, $15, 0, 1, 2, 0, $126)
    %spritemapEntry(0, $16, $F4, 0, 1, 2, 0, $12A)
    %spritemapEntry(1, $06, $F4, 0, 1, 2, 0, $12B)
    %spritemapEntry(0, $01, $FA, 0, 1, 2, 0, $112)
    %spritemapEntry(0, $00, $F2, 0, 1, 2, 0, $102)
    %spritemapEntry(0, $1F6, $12, 0, 1, 2, 0, $134)
    %spritemapEntry(0, $1FB, $16, 0, 1, 2, 0, $125)
    %spritemapEntry(0, $1FB, $07, 0, 1, 2, 0, $11A)
    %spritemapEntry(0, $1FA, $FF, 0, 1, 2, 0, $10A)
    %spritemapEntry(0, $1F7, $0A, 0, 1, 2, 0, $124)
    %spritemapEntry(1, $1FA, $F0, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $00, $EA, 0, 1, 2, 0, $10E)
    %spritemapEntry(0, $09, $16, 0, 1, 2, 0, $145)
    %spritemapEntry(1, $1FD, $FF, 0, 1, 2, 0, $107)
    %spritemapEntry(0, $02, $FE, 0, 1, 2, 0, $14C)
    %spritemapEntry(0, $0A, $FE, 0, 1, 2, 0, $14B)
    %spritemapEntry(0, $12, $FE, 0, 1, 2, 0, $14A)
    %spritemapEntry(0, $1F3, $15, 0, 1, 2, 0, $126)

UNUSED_Spitemaps_SpacePirate_B2E53F:
    dw $0013
    %spritemapEntry(0, $01, $08, 0, 1, 2, 0, $124)
    %spritemapEntry(0, $1F1, $16, 0, 1, 2, 0, $146)
    %spritemapEntry(0, $1F9, $05, 0, 1, 2, 0, $11A)
    %spritemapEntry(0, $1F9, $FD, 0, 1, 2, 0, $10A)
    %spritemapEntry(0, $16, $F3, 0, 1, 2, 0, $12A)
    %spritemapEntry(1, $06, $F3, 0, 1, 2, 0, $12B)
    %spritemapEntry(1, $1FE, $F1, 0, 1, 2, 0, $100)
    %spritemapEntry(1, $1FA, $EF, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $01, $EA, 0, 1, 2, 0, $10E)
    %spritemapEntry(0, $00, $16, 0, 1, 2, 0, $146)
    %spritemapEntry(0, $08, $15, 0, 1, 2, 0, $145)
    %spritemapEntry(0, $1F9, $15, 0, 1, 2, 0, $145)
    %spritemapEntry(0, $1F5, $10, 0, 1, 2, 0, $134)
    %spritemapEntry(0, $1F6, $08, 0, 1, 2, 0, $124)
    %spritemapEntry(1, $1FC, $FE, 0, 1, 2, 0, $107)
    %spritemapEntry(0, $01, $10, 0, 1, 2, 0, $134)
    %spritemapEntry(0, $03, $FD, 0, 1, 2, 0, $14C)
    %spritemapEntry(0, $0B, $FD, 0, 1, 2, 0, $14B)
    %spritemapEntry(0, $13, $FD, 0, 1, 2, 0, $14A)

UNUSED_Spitemaps_SpacePirate_B2E5A0:
    dw $0014
    %spritemapEntry(0, $01, $09, 0, 1, 2, 0, $124)
    %spritemapEntry(0, $01, $06, 0, 1, 2, 0, $119)
    %spritemapEntry(0, $01, $FF, 0, 1, 2, 0, $109)
    %spritemapEntry(0, $18, $F5, 0, 1, 2, 0, $12A)
    %spritemapEntry(1, $08, $F5, 0, 1, 2, 0, $12B)
    %spritemapEntry(1, $1FF, $F3, 0, 1, 2, 0, $100)
    %spritemapEntry(1, $1FB, $F0, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $02, $EB, 0, 1, 2, 0, $10E)
    %spritemapEntry(0, $00, $16, 0, 1, 2, 0, $146)
    %spritemapEntry(0, $08, $16, 0, 1, 2, 0, $145)
    %spritemapEntry(0, $1F2, $16, 0, 1, 2, 0, $146)
    %spritemapEntry(0, $1FA, $16, 0, 1, 2, 0, $145)
    %spritemapEntry(0, $1F5, $11, 0, 1, 2, 0, $134)
    %spritemapEntry(0, $1F5, $09, 0, 1, 2, 0, $124)
    %spritemapEntry(0, $1F9, $07, 0, 1, 2, 0, $11B)
    %spritemapEntry(0, $1F9, $FF, 0, 1, 2, 0, $10B)
    %spritemapEntry(0, $00, $11, 0, 1, 2, 0, $134)
    %spritemapEntry(0, $04, $FE, 0, 1, 2, 0, $14C)
    %spritemapEntry(0, $0C, $FE, 0, 1, 2, 0, $14B)
    %spritemapEntry(0, $14, $FE, 0, 1, 2, 0, $14A)

UNUSED_Spitemaps_SpacePirate_B2E606:
    dw $000E
    %spritemapEntry(1, $1FC, $FF, 0, 1, 2, 0, $128)
    %spritemapEntry(1, $04, $FF, 0, 1, 2, 0, $127)
    %spritemapEntry(0, $1F5, $15, 0, 1, 2, 0, $126)
    %spritemapEntry(1, $1F6, $0B, 0, 1, 2, 0, $122)
    %spritemapEntry(0, $1FD, $FC, 0, 1, 2, 0, $113)
    %spritemapEntry(0, $1FD, $F4, 0, 1, 2, 0, $103)
    %spritemapEntry(1, $1FE, $EB, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $1F9, $F2, 0, 1, 2, 0, $12E)
    %spritemapEntry(0, $1FD, $15, 0, 1, 2, 0, $125)
    %spritemapEntry(1, $1F9, $FF, 0, 1, 2, 0, $107)
    %spritemapEntry(1, $1FD, $FF, 0, 1, 2, 0, $107)
    %spritemapEntry(1, $1FC, $0A, 0, 1, 2, 0, $122)
    %spritemapEntry(0, $1FD, $15, 0, 1, 2, 0, $126)
    %spritemapEntry(0, $05, $15, 0, 1, 2, 0, $125)
endif ; !FEATURE_KEEP_UNREFERENCED

Spitemaps_PirateNinja_4E:
    dw $0012
    %spritemapEntry(1, $1FD, $EC, 0, 1, 2, 0, $10E)
    %spritemapEntry(0, $1F0, $FC, 1, 0, 2, 0, $14D)
    %spritemapEntry(0, $1EF, $04, 1, 0, 2, 0, $13D)
    %spritemapEntry(0, $1EF, $0C, 1, 0, 2, 0, $12D)
    %spritemapEntry(1, $1F2, $F2, 0, 1, 2, 0, $105)
    %spritemapEntry(1, $1F7, $F1, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $02, $F3, 0, 1, 2, 0, $12B)
    %spritemapEntry(1, $0A, $F3, 0, 1, 2, 0, $12A)
    %spritemapEntry(1, $1F9, $FF, 0, 1, 2, 0, $107)
    %spritemapEntry(0, $1F6, $11, 0, 1, 2, 0, $144)
    %spritemapEntry(0, $1F6, $09, 0, 1, 2, 0, $143)
    %spritemapEntry(0, $01, $09, 1, 0, 2, 0, $149)
    %spritemapEntry(0, $1F9, $09, 1, 0, 2, 0, $148)
    %spritemapEntry(1, $1FC, $FF, 0, 1, 2, 0, $107)
    %spritemapEntry(0, $03, $0B, 1, 0, 2, 0, $149)
    %spritemapEntry(0, $1FB, $0B, 1, 0, 2, 0, $148)
    %spritemapEntry(0, $1FA, $13, 0, 1, 2, 0, $144)
    %spritemapEntry(0, $1FA, $0B, 0, 1, 2, 0, $143)

Spitemaps_PirateNinja_4F:
    dw $0016
    %spritemapEntry(0, $1FA, $15, 0, 1, 2, 0, $134)
    %spritemapEntry(0, $1FB, $0D, 0, 1, 2, 0, $124)
    %spritemapEntry(0, $1FE, $FB, 0, 1, 2, 0, $14C)
    %spritemapEntry(0, $06, $FB, 0, 1, 2, 0, $14B)
    %spritemapEntry(0, $0E, $FB, 0, 1, 2, 0, $14A)
    %spritemapEntry(0, $1FC, $F9, 0, 1, 2, 0, $113)
    %spritemapEntry(0, $1FC, $F1, 0, 1, 2, 0, $103)
    %spritemapEntry(0, $1F8, $18, 0, 1, 2, 0, $126)
    %spritemapEntry(0, $00, $18, 0, 1, 2, 0, $125)
    %spritemapEntry(0, $1FD, $08, 0, 1, 2, 0, $11A)
    %spritemapEntry(0, $1FC, $00, 0, 1, 2, 0, $10A)
    %spritemapEntry(1, $1FD, $E6, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $1F7, $EF, 0, 1, 2, 0, $12E)
    %spritemapEntry(0, $1FE, $FD, 0, 1, 2, 0, $149)
    %spritemapEntry(0, $06, $FD, 0, 1, 2, 0, $148)
    %spritemapEntry(0, $04, $0D, 0, 1, 2, 0, $146)
    %spritemapEntry(0, $0C, $0D, 0, 1, 2, 0, $145)
    %spritemapEntry(0, $05, $09, 0, 1, 2, 0, $134)
    %spritemapEntry(0, $05, $01, 0, 1, 2, 0, $124)
    %spritemapEntry(0, $1F4, $F9, 1, 0, 2, 0, $14D)
    %spritemapEntry(0, $1F3, $01, 1, 0, 2, 0, $13D)
    %spritemapEntry(0, $1F2, $09, 1, 0, 2, 0, $12D)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spitemaps_SpacePirate_B2E71A:
    dw $0014
    %spritemapEntry(0, $00, $F2, 0, 1, 2, 0, $14F)
    %spritemapEntry(0, $08, $F1, 0, 1, 2, 0, $14E)
    %spritemapEntry(0, $0C, $EE, 0, 1, 2, 0, $14D)
    %spritemapEntry(0, $0C, $E6, 0, 1, 2, 0, $13D)
    %spritemapEntry(0, $0C, $DE, 0, 1, 2, 0, $12D)
    %spritemapEntry(1, $1FB, $F1, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $02, $EB, 0, 1, 2, 0, $10E)
    %spritemapEntry(0, $0C, $F0, 0, 1, 2, 0, $13D)
    %spritemapEntry(0, $0C, $F8, 0, 1, 2, 0, $14D)
    %spritemapEntry(1, $02, $F1, 0, 1, 2, 0, $100)
    %spritemapEntry(1, $1F9, $FF, 0, 1, 2, 0, $107)
    %spritemapEntry(0, $1F4, $11, 0, 1, 2, 0, $144)
    %spritemapEntry(0, $1F4, $09, 0, 1, 2, 0, $143)
    %spritemapEntry(0, $01, $09, 1, 0, 2, 0, $149)
    %spritemapEntry(0, $1F9, $09, 1, 0, 2, 0, $148)
    %spritemapEntry(1, $1FC, $FF, 0, 1, 2, 0, $107)
    %spritemapEntry(0, $03, $0B, 1, 0, 2, 0, $149)
    %spritemapEntry(0, $1FB, $0B, 1, 0, 2, 0, $148)
    %spritemapEntry(0, $1FA, $13, 0, 1, 2, 0, $144)
    %spritemapEntry(0, $1FA, $0B, 0, 1, 2, 0, $143)

UNUSED_Spitemaps_SpacePirate_B2E780:
    dw $000F
    %spritemapEntry(0, $10, $F7, 0, 1, 2, 0, $12A)
    %spritemapEntry(1, $00, $F7, 0, 1, 2, 0, $12B)
    %spritemapEntry(1, $1F9, $F6, 0, 1, 2, 0, $100)
    %spritemapEntry(1, $1F5, $F2, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $1FC, $EC, 0, 1, 2, 0, $10E)
    %spritemapEntry(0, $1FA, $0B, 0, 1, 2, 0, $146)
    %spritemapEntry(0, $02, $0B, 0, 1, 2, 0, $145)
    %spritemapEntry(0, $1F7, $00, 0, 1, 2, 0, $149)
    %spritemapEntry(0, $1FF, $FF, 0, 1, 2, 0, $148)
    %spritemapEntry(1, $1F9, $01, 0, 1, 2, 0, $122)
    %spritemapEntry(0, $09, $F9, 0, 1, 2, 0, $14D)
    %spritemapEntry(0, $0A, $F1, 0, 1, 2, 0, $13D)
    %spritemapEntry(0, $0B, $E9, 0, 1, 2, 0, $12D)
    %spritemapEntry(0, $1F6, $0D, 0, 1, 2, 0, $144)
    %spritemapEntry(0, $1F6, $05, 0, 1, 2, 0, $143)

UNUSED_Spitemaps_SpacePirate_B2E7CD:
    dw $000E
    %spritemapEntry(0, $08, $05, 1, 0, 2, 0, $18D)
    %spritemapEntry(0, $08, $0D, 1, 0, 2, 0, $17D)
    %spritemapEntry(0, $02, $0B, 0, 1, 2, 0, $130)
    %spritemapEntry(0, $02, $03, 0, 1, 2, 0, $120)
    %spritemapEntry(0, $0F, $F4, 0, 1, 2, 0, $12A)
    %spritemapEntry(1, $1FF, $F4, 0, 1, 2, 0, $12B)
    %spritemapEntry(1, $1F8, $F3, 0, 1, 2, 0, $100)
    %spritemapEntry(1, $1F4, $F0, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $1FB, $EA, 0, 1, 2, 0, $10E)
    %spritemapEntry(0, $1F7, $FE, 0, 1, 2, 0, $149)
    %spritemapEntry(0, $1FF, $FE, 0, 1, 2, 0, $148)
    %spritemapEntry(0, $07, $F6, 0, 1, 2, 0, $14D)
    %spritemapEntry(0, $08, $EE, 0, 1, 2, 0, $13D)
    %spritemapEntry(0, $09, $E6, 0, 1, 2, 0, $12D)

UNUSED_Spitemaps_SpacePirate_B2E815:
    dw $000E
    %spritemapEntry(0, $08, $05, 1, 0, 2, 0, $18D)
    %spritemapEntry(0, $08, $0D, 1, 0, 2, 0, $17D)
    %spritemapEntry(0, $03, $0B, 0, 1, 2, 0, $130)
    %spritemapEntry(0, $03, $03, 0, 1, 2, 0, $120)
    %spritemapEntry(0, $10, $F3, 0, 1, 2, 0, $12A)
    %spritemapEntry(1, $00, $F3, 0, 1, 2, 0, $12B)
    %spritemapEntry(1, $1F8, $F2, 0, 1, 2, 0, $100)
    %spritemapEntry(1, $1F4, $F1, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $1FB, $EB, 0, 1, 2, 0, $10E)
    %spritemapEntry(0, $1F7, $FF, 0, 1, 2, 0, $149)
    %spritemapEntry(0, $1FF, $FE, 0, 1, 2, 0, $148)
    %spritemapEntry(0, $08, $F7, 0, 1, 2, 0, $14D)
    %spritemapEntry(0, $09, $EF, 0, 1, 2, 0, $13D)
    %spritemapEntry(0, $0A, $E7, 0, 1, 2, 0, $12D)

UNUSED_Spitemaps_SpacePirate_B2E85D:
    dw $0009
    %spritemapEntry(0, $1FF, $00, 1, 0, 2, 0, $14D)
    %spritemapEntry(0, $1FF, $08, 1, 0, 2, 0, $13D)
    %spritemapEntry(0, $1FF, $10, 1, 0, 2, 0, $12D)
    %spritemapEntry(0, $1FE, $FA, 0, 1, 2, 0, $113)
    %spritemapEntry(0, $1FE, $F2, 0, 1, 2, 0, $103)
    %spritemapEntry(1, $1F8, $EF, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $1FF, $E9, 0, 1, 2, 0, $10E)
    %spritemapEntry(0, $03, $FD, 0, 1, 2, 0, $14B)
    %spritemapEntry(0, $0B, $FE, 0, 1, 2, 0, $14A)

UNUSED_Spitemaps_SpacePirate_B2E88C:
    dw $0010
    %spritemapEntry(1, $1F7, $FE, 0, 1, 2, 0, $107)
    %spritemapEntry(0, $14, $F3, 0, 1, 2, 0, $12A)
    %spritemapEntry(1, $04, $F3, 0, 1, 2, 0, $12B)
    %spritemapEntry(1, $1FA, $F1, 0, 1, 2, 0, $100)
    %spritemapEntry(1, $1FE, $EB, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $1F7, $F1, 0, 1, 2, 0, $12E)
    %spritemapEntry(0, $0B, $F9, 0, 1, 2, 0, $14D)
    %spritemapEntry(0, $0C, $F1, 0, 1, 2, 0, $13D)
    %spritemapEntry(0, $0D, $E9, 0, 1, 2, 0, $12D)
    %spritemapEntry(1, $1FC, $FE, 0, 1, 2, 0, $107)
    %spritemapEntry(0, $1FC, $10, 0, 1, 2, 0, $125)
    %spritemapEntry(1, $1FD, $05, 0, 1, 2, 0, $122)
    %spritemapEntry(0, $1F4, $10, 0, 1, 2, 0, $126)
    %spritemapEntry(1, $1F5, $07, 0, 1, 2, 0, $122)
    %spritemapEntry(0, $1FE, $10, 0, 1, 2, 0, $126)
    %spritemapEntry(0, $06, $10, 0, 1, 2, 0, $125)
endif ; !FEATURE_KEEP_UNREFERENCED

Spitemaps_PirateNinja_50:
    dw $0011
    %spritemapEntry(1, $1FD, $FB, 0, 1, 2, 0, $127)
    %spritemapEntry(1, $1F5, $FB, 0, 1, 2, 0, $128)
    %spritemapEntry(0, $1FA, $0D, 0, 1, 2, 0, $121)
    %spritemapEntry(0, $1FA, $15, 0, 1, 2, 0, $131)
    %spritemapEntry(0, $1FB, $18, 0, 1, 2, 0, $126)
    %spritemapEntry(0, $03, $18, 0, 1, 2, 0, $125)
    %spritemapEntry(0, $1FC, $08, 0, 1, 2, 0, $11A)
    %spritemapEntry(0, $1FC, $00, 0, 1, 2, 0, $10A)
    %spritemapEntry(0, $1F1, $12, 0, 1, 2, 0, $144)
    %spritemapEntry(0, $1F1, $0A, 0, 1, 2, 0, $143)
    %spritemapEntry(0, $1FE, $06, 0, 1, 2, 0, $119)
    %spritemapEntry(0, $1FD, $FE, 0, 1, 2, 0, $109)
    %spritemapEntry(0, $1FE, $0A, 0, 1, 2, 0, $16E)
    %spritemapEntry(1, $1F6, $F0, 0, 1, 2, 0, $105)
    %spritemapEntry(1, $1FF, $E6, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $1F9, $EF, 0, 1, 2, 0, $12E)
    %spritemapEntry(0, $1F6, $0A, 0, 1, 2, 0, $16F)

Spitemaps_PirateNinja_51:
    dw $0013
    %spritemapEntry(0, $1FA, $FF, 0, 1, 2, 0, $10A)
    %spritemapEntry(0, $10, $EE, 0, 1, 2, 0, $12A)
    %spritemapEntry(1, $02, $ED, 0, 1, 2, 0, $12B)
    %spritemapEntry(1, $1FA, $EF, 0, 1, 2, 0, $100)
    %spritemapEntry(0, $1EE, $F5, 1, 0, 2, 0, $14D)
    %spritemapEntry(0, $1ED, $FD, 1, 0, 2, 0, $13D)
    %spritemapEntry(0, $1EC, $05, 1, 0, 2, 0, $12D)
    %spritemapEntry(1, $1F9, $E9, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $1F5, $F1, 0, 1, 2, 0, $12E)
    %spritemapEntry(0, $1FB, $07, 0, 1, 2, 0, $11A)
    %spritemapEntry(0, $15, $FD, 1, 0, 2, 0, $16F)
    %spritemapEntry(0, $0D, $FE, 1, 0, 2, 0, $16E)
    %spritemapEntry(0, $1FD, $FE, 0, 1, 2, 0, $19F)
    %spritemapEntry(0, $05, $FD, 0, 1, 2, 0, $19E)
    %spritemapEntry(0, $1F0, $16, 0, 1, 2, 0, $126)
    %spritemapEntry(0, $1F8, $17, 0, 1, 2, 0, $125)
    %spritemapEntry(1, $1F2, $0A, 0, 1, 2, 0, $122)
    %spritemapEntry(0, $1A, $F4, 1, 0, 2, 0, $18D)
    %spritemapEntry(0, $1B, $FC, 1, 0, 2, 0, $17D)

Spitemaps_PirateNinja_52:
    dw $0013
    %spritemapEntry(0, $1A, $0A, 0, 1, 2, 0, $19D)
    %spritemapEntry(1, $0E, $01, 0, 1, 2, 0, $1AC)
    %spritemapEntry(1, $01, $FB, 0, 1, 2, 0, $1AE)
    %spritemapEntry(0, $1EF, $F4, 1, 0, 2, 0, $14D)
    %spritemapEntry(0, $1EE, $FC, 1, 0, 2, 0, $13D)
    %spritemapEntry(0, $1EE, $04, 1, 0, 2, 0, $12D)
    %spritemapEntry(0, $1F2, $F3, 0, 1, 2, 0, $15F)
    %spritemapEntry(0, $1FA, $F4, 0, 1, 2, 0, $15E)
    %spritemapEntry(0, $1F9, $00, 0, 0, 2, 0, $10A)
    %spritemapEntry(1, $1FD, $EC, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $1F7, $F2, 0, 1, 2, 0, $12E)
    %spritemapEntry(0, $09, $10, 0, 0, 2, 0, $18D)
    %spritemapEntry(0, $09, $08, 0, 0, 2, 0, $17D)
    %spritemapEntry(0, $04, $08, 0, 0, 2, 0, $16F)
    %spritemapEntry(0, $1FC, $09, 0, 0, 2, 0, $16E)
    %spritemapEntry(0, $1F8, $08, 0, 0, 2, 0, $11A)
    %spritemapEntry(0, $03, $EA, 0, 1, 2, 0, $14D)
    %spritemapEntry(0, $04, $E2, 0, 1, 2, 0, $13D)
    %spritemapEntry(0, $04, $DA, 0, 1, 2, 0, $12D)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spitemaps_SpacePirate_B2E9F7:
    dw $0004
    %spritemapEntry(1, $1FA, $00, 0, 0, 2, 0, $182)
    %spritemapEntry(1, $1EA, $00, 0, 0, 2, 0, $180)
    %spritemapEntry(1, $1FA, $F0, 0, 0, 2, 0, $162)
    %spritemapEntry(1, $1EA, $F0, 0, 0, 2, 0, $160)

UNUSED_Spitemaps_SpacePirate_B2EA0D:
    dw $0006
    %spritemapEntry(0, $1F5, $10, 0, 0, 2, 0, $1A5)
    %spritemapEntry(0, $1FD, $10, 0, 0, 2, 0, $1A6)
    %spritemapEntry(1, $1FD, $00, 0, 0, 2, 0, $186)
    %spritemapEntry(1, $1ED, $00, 0, 0, 2, 0, $184)
    %spritemapEntry(1, $1FD, $F0, 0, 0, 2, 0, $166)
    %spritemapEntry(1, $1ED, $F0, 0, 0, 2, 0, $164)

UNUSED_Spitemaps_SpacePirate_B2EA2D:
    dw $0005
    %spritemapEntry(0, $0C, $FE, 0, 0, 2, 0, $17C)
    %spritemapEntry(1, $1FC, $06, 0, 0, 2, 0, $18A)
    %spritemapEntry(1, $1EC, $06, 0, 0, 2, 0, $188)
    %spritemapEntry(1, $1FC, $F6, 0, 0, 2, 0, $16A)
    %spritemapEntry(1, $1EC, $F6, 0, 0, 2, 0, $168)

UNUSED_Spitemaps_SpacePirate_B2EA48:
    dw $0007
    %spritemapEntry(0, $10, $FA, 1, 1, 2, 0, $1A7)
    %spritemapEntry(1, $1F0, $F2, 1, 1, 2, 0, $1AA)
    %spritemapEntry(1, $00, $F2, 1, 1, 2, 0, $1A8)
    %spritemapEntry(0, $1F0, $02, 1, 1, 2, 0, $1B4)
    %spritemapEntry(0, $08, $02, 1, 1, 2, 0, $1B1)
    %spritemapEntry(0, $10, $02, 1, 1, 2, 0, $1B0)
    %spritemapEntry(1, $1F8, $02, 1, 1, 2, 0, $1A2)

UNUSED_Spitemaps_SpacePirate_B2EA6D:
    dw $0004
    %spritemapEntry(1, $1F6, $F0, 1, 1, 2, 0, $182)
    %spritemapEntry(1, $06, $F0, 1, 1, 2, 0, $180)
    %spritemapEntry(1, $1F6, $00, 1, 1, 2, 0, $162)
    %spritemapEntry(1, $06, $00, 1, 1, 2, 0, $160)

UNUSED_Spitemaps_SpacePirate_B2EA83:
    dw $0006
    %spritemapEntry(0, $04, $E8, 1, 1, 2, 0, $1A5)
    %spritemapEntry(0, $1FC, $E8, 1, 1, 2, 0, $1A6)
    %spritemapEntry(1, $1F4, $F0, 1, 1, 2, 0, $186)
    %spritemapEntry(1, $04, $F0, 1, 1, 2, 0, $184)
    %spritemapEntry(1, $1F4, $00, 1, 1, 2, 0, $166)
    %spritemapEntry(1, $04, $00, 1, 1, 2, 0, $164)

UNUSED_Spitemaps_SpacePirate_B2EAA3:
    dw $0005
    %spritemapEntry(0, $1EC, $FA, 1, 1, 2, 0, $17C)
    %spritemapEntry(1, $1F4, $EA, 1, 1, 2, 0, $18A)
    %spritemapEntry(1, $04, $EA, 1, 1, 2, 0, $188)
    %spritemapEntry(1, $1F4, $FA, 1, 1, 2, 0, $16A)
    %spritemapEntry(1, $04, $FA, 1, 1, 2, 0, $168)

UNUSED_Spitemaps_SpacePirate_B2EABE:
    dw $0007
    %spritemapEntry(0, $1E9, $FE, 0, 0, 2, 0, $1A7)
    %spritemapEntry(1, $01, $FE, 0, 0, 2, 0, $1AA)
    %spritemapEntry(1, $1F1, $FE, 0, 0, 2, 0, $1A8)
    %spritemapEntry(0, $09, $F6, 0, 0, 2, 0, $1B4)
    %spritemapEntry(0, $1F1, $F6, 0, 0, 2, 0, $1B1)
    %spritemapEntry(0, $1E9, $F6, 0, 0, 2, 0, $1B0)
    %spritemapEntry(1, $1F9, $EE, 0, 0, 2, 0, $1A2)

UNUSED_Spitemaps_SpacePirate_B2EAE3:
    dw $000D
    %spritemapEntry(1, $1F9, $FC, 0, 0, 2, 0, $127)
    %spritemapEntry(1, $01, $FC, 0, 0, 2, 0, $128)
    %spritemapEntry(0, $1F1, $F7, 0, 0, 2, 0, $14D)
    %spritemapEntry(0, $1F1, $EF, 0, 0, 2, 0, $13D)
    %spritemapEntry(0, $1F1, $E7, 0, 0, 2, 0, $12D)
    %spritemapEntry(0, $06, $FB, 0, 1, 2, 0, $112)
    %spritemapEntry(0, $06, $F3, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $1FA, $EB, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $03, $F9, 0, 1, 2, 0, $142)
    %spritemapEntry(0, $1FB, $F1, 0, 1, 2, 0, $141)
    %spritemapEntry(0, $03, $F1, 0, 1, 2, 0, $140)
    %spritemapEntry(0, $1FB, $F9, 0, 1, 2, 0, $147)
    %spritemapEntry(1, $1F1, $F0, 0, 0, 2, 0, $100)

UNUSED_Spitemaps_SpacePirate_B2EB26:
    dw $000E
    %spritemapEntry(0, $1F0, $F7, 0, 0, 2, 0, $14D)
    %spritemapEntry(0, $1F0, $EF, 0, 0, 2, 0, $13D)
    %spritemapEntry(0, $1F0, $E7, 0, 0, 2, 0, $12D)
    %spritemapEntry(1, $1FE, $EB, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $1F1, $F0, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $03, $F9, 0, 1, 2, 0, $142)
    %spritemapEntry(0, $1FB, $F1, 0, 1, 2, 0, $141)
    %spritemapEntry(0, $03, $F1, 0, 1, 2, 0, $140)
    %spritemapEntry(0, $1FB, $F9, 0, 1, 2, 0, $147)
    %spritemapEntry(0, $08, $FD, 1, 0, 2, 0, $14D)
    %spritemapEntry(0, $08, $05, 1, 0, 2, 0, $13D)
    %spritemapEntry(0, $08, $0D, 1, 0, 2, 0, $12D)
    %spritemapEntry(0, $06, $FB, 0, 1, 2, 0, $112)
    %spritemapEntry(0, $06, $F3, 0, 1, 2, 0, $102)

UNUSED_Spitemaps_SpacePirate_B2EB6E:
    dw $0014
    %spritemapEntry(0, $00, $F2, 0, 1, 2, 0, $14F)
    %spritemapEntry(0, $08, $F1, 0, 1, 2, 0, $14E)
    %spritemapEntry(0, $0C, $EE, 0, 1, 2, 0, $14D)
    %spritemapEntry(0, $0C, $E6, 0, 1, 2, 0, $13D)
    %spritemapEntry(0, $0C, $DE, 0, 1, 2, 0, $12D)
    %spritemapEntry(1, $1FB, $F1, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $02, $EB, 0, 1, 2, 0, $10E)
    %spritemapEntry(0, $0C, $F0, 0, 1, 2, 0, $13D)
    %spritemapEntry(0, $0C, $F8, 0, 1, 2, 0, $14D)
    %spritemapEntry(1, $02, $F1, 0, 1, 2, 0, $100)
    %spritemapEntry(1, $1F9, $FF, 0, 1, 2, 0, $107)
    %spritemapEntry(0, $1F4, $11, 0, 1, 2, 0, $144)
    %spritemapEntry(0, $1F4, $09, 0, 1, 2, 0, $143)
    %spritemapEntry(0, $01, $09, 1, 0, 2, 0, $149)
    %spritemapEntry(0, $1F9, $09, 1, 0, 2, 0, $148)
    %spritemapEntry(1, $1FC, $FF, 0, 1, 2, 0, $107)
    %spritemapEntry(0, $03, $0B, 1, 0, 2, 0, $149)
    %spritemapEntry(0, $1FB, $0B, 1, 0, 2, 0, $148)
    %spritemapEntry(0, $1FA, $13, 0, 1, 2, 0, $144)
    %spritemapEntry(0, $1FA, $0B, 0, 1, 2, 0, $143)

UNUSED_Spitemaps_SpacePirate_B2EBD4:
    dw $0004
    %spritemapEntry(1, $1F6, $00, 0, 1, 2, 0, $182)
    %spritemapEntry(1, $06, $00, 0, 1, 2, 0, $180)
    %spritemapEntry(1, $1F6, $F0, 0, 1, 2, 0, $162)
    %spritemapEntry(1, $06, $F0, 0, 1, 2, 0, $160)

UNUSED_Spitemaps_SpacePirate_B2EBEA:
    dw $0006
    %spritemapEntry(0, $03, $10, 0, 1, 2, 0, $1A5)
    %spritemapEntry(0, $1FB, $10, 0, 1, 2, 0, $1A6)
    %spritemapEntry(1, $1F3, $00, 0, 1, 2, 0, $186)
    %spritemapEntry(1, $03, $00, 0, 1, 2, 0, $184)
    %spritemapEntry(1, $1F3, $F0, 0, 1, 2, 0, $166)
    %spritemapEntry(1, $03, $F0, 0, 1, 2, 0, $164)

UNUSED_Spitemaps_SpacePirate_B2EC0A:
    dw $0005
    %spritemapEntry(0, $1EC, $FE, 0, 1, 2, 0, $17C)
    %spritemapEntry(1, $1F4, $06, 0, 1, 2, 0, $18A)
    %spritemapEntry(1, $04, $06, 0, 1, 2, 0, $188)
    %spritemapEntry(1, $1F4, $F6, 0, 1, 2, 0, $16A)
    %spritemapEntry(1, $04, $F6, 0, 1, 2, 0, $168)

UNUSED_Spitemaps_SpacePirate_B2EC25:
    dw $0007
    %spritemapEntry(0, $1E8, $FA, 1, 0, 2, 0, $1A7)
    %spritemapEntry(1, $00, $F2, 1, 0, 2, 0, $1AA)
    %spritemapEntry(1, $1F0, $F2, 1, 0, 2, 0, $1A8)
    %spritemapEntry(0, $08, $02, 1, 0, 2, 0, $1B4)
    %spritemapEntry(0, $1F0, $02, 1, 0, 2, 0, $1B1)
    %spritemapEntry(0, $1E8, $02, 1, 0, 2, 0, $1B0)
    %spritemapEntry(1, $1F8, $02, 1, 0, 2, 0, $1A2)

UNUSED_Spitemaps_SpacePirate_B2EC4A:
    dw $0004
    %spritemapEntry(1, $1FA, $F0, 1, 0, 2, 0, $182)
    %spritemapEntry(1, $1EA, $F0, 1, 0, 2, 0, $180)
    %spritemapEntry(1, $1FA, $00, 1, 0, 2, 0, $162)
    %spritemapEntry(1, $1EA, $00, 1, 0, 2, 0, $160)

UNUSED_Spitemaps_SpacePirate_B2EC60:
    dw $0006
    %spritemapEntry(0, $1F4, $E8, 1, 0, 2, 0, $1A5)
    %spritemapEntry(0, $1FC, $E8, 1, 0, 2, 0, $1A6)
    %spritemapEntry(1, $1FC, $F0, 1, 0, 2, 0, $186)
    %spritemapEntry(1, $1EC, $F0, 1, 0, 2, 0, $184)
    %spritemapEntry(1, $1FC, $00, 1, 0, 2, 0, $166)
    %spritemapEntry(1, $1EC, $00, 1, 0, 2, 0, $164)

UNUSED_Spitemaps_SpacePirate_B2EC80:
    dw $0005
    %spritemapEntry(0, $0C, $FA, 1, 0, 2, 0, $17C)
    %spritemapEntry(1, $1FC, $EA, 1, 0, 2, 0, $18A)
    %spritemapEntry(1, $1EC, $EA, 1, 0, 2, 0, $188)
    %spritemapEntry(1, $1FC, $FA, 1, 0, 2, 0, $16A)
    %spritemapEntry(1, $1EC, $FA, 1, 0, 2, 0, $168)

UNUSED_Spitemaps_SpacePirate_B2EC9B:
    dw $0007
    %spritemapEntry(0, $0F, $FE, 0, 1, 2, 0, $1A7)
    %spritemapEntry(1, $1EF, $FE, 0, 1, 2, 0, $1AA)
    %spritemapEntry(1, $1FF, $FE, 0, 1, 2, 0, $1A8)
    %spritemapEntry(0, $1EF, $F6, 0, 1, 2, 0, $1B4)
    %spritemapEntry(0, $07, $F6, 0, 1, 2, 0, $1B1)
    %spritemapEntry(0, $0F, $F6, 0, 1, 2, 0, $1B0)
    %spritemapEntry(1, $1F7, $EE, 0, 1, 2, 0, $1A2)
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $ECC0: Instruction list - fire laser and wall-jump left ;;;
InstList_PirateWall_FireLaser_WallJumpLeft:
    dw Instruction_PirateWall_FunctionInY
    dw RTS_B2F0E3
    dw $0009,ExtendedSpritemaps_PirateWall_E
    dw $000F,ExtendedSpritemaps_PirateWall_F
    dw Instruction_PirateWall_FireLaserLeft
    dw Instruction_Common_WaitYFrames,$0020
    dw Instruction_PirateWall_PrepareWallJumpToLeft
    dw Instruction_PirateWall_FunctionInY
    dw Function_PirateWall_WallJumpingLeft
    dw Instruction_PirateWall_QueueSpacePirateAttackSFX
    dw $000A,ExtendedSpritemaps_PirateWall_10
    dw $0001,ExtendedSpritemaps_PirateWall_11
    dw Instruction_Common_Sleep


;;; $ECE4: Instruction list - landed on left wall ;;;
InstList_PirateWall_LandedOnLeftWall:
    dw Instruction_PirateWall_FunctionInY
    dw Function_PirateWall_ClimbingLeftWall
    dw $000A,ExtendedSpritemaps_PirateWall_10


;;; $ECEC: Instruction list - moving up left wall ;;;
InstList_PirateWall_MovingUpLeftWall_0:
    dw Instruction_PirateWall_FunctionInY
    dw Function_PirateWall_ClimbingLeftWall
    dw Instruction_Common_TimerInY,$0004

InstList_PirateWall_MovingUpLeftWall_1:
    dw $000A,ExtendedSpritemaps_PirateWall_0
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Left,$FFFD
    dw $0008,ExtendedSpritemaps_PirateWall_1
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Left,$FFFD
    dw $0005,ExtendedSpritemaps_PirateWall_2
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Left,$FFFD
    dw $0008,ExtendedSpritemaps_PirateWall_3
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Left,$FFFD
    dw $000A,ExtendedSpritemaps_PirateWall_4
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Left,$FFFD
    dw $0008,ExtendedSpritemaps_PirateWall_3
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Left,$FFFD
    dw $0005,ExtendedSpritemaps_PirateWall_2
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Left,$FFFD
    dw $0008,ExtendedSpritemaps_PirateWall_1
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate
    dw InstList_PirateWall_MovingUpLeftWall_1
    dw Instruction_PirateWall_RandomlyChooseADirection_LeftWall


;;; $ED36: Instruction list - moving down left wall ;;;
InstList_PirateWall_MovingDownLeftWall_0:
    dw Instruction_PirateWall_FunctionInY
    dw Function_PirateWall_ClimbingLeftWall
    dw Instruction_Common_TimerInY,$0004

InstList_PirateWall_MovingDownLeftWall_1:
    dw $000A,ExtendedSpritemaps_PirateWall_0
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Left,$0003
    dw $0008,ExtendedSpritemaps_PirateWall_1
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Left,$0003
    dw $0005,ExtendedSpritemaps_PirateWall_2
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Left,$0003
    dw $0008,ExtendedSpritemaps_PirateWall_3
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Left,$0003
    dw $000A,ExtendedSpritemaps_PirateWall_4
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Left,$0003
    dw $0008,ExtendedSpritemaps_PirateWall_3
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Left,$0003
    dw $0005,ExtendedSpritemaps_PirateWall_2
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Left,$0003
    dw $0008,ExtendedSpritemaps_PirateWall_1
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate
    dw InstList_PirateWall_MovingDownLeftWall_1
    dw Instruction_PirateWall_RandomlyChooseADirection_LeftWall


;;; $ED80: Instruction list - fire laser and wall-jump right ;;;
InstList_PirateWall_FireLaser_WallJumpRight:
    dw Instruction_PirateWall_FunctionInY
    dw RTS_B2F04F
    dw $0009,ExtendedSpritemaps_PirateWall_5
    dw $0001,ExtendedSpritemaps_PirateWall_6
    dw Instruction_PirateWall_FireLaserRight
    dw Instruction_Common_WaitYFrames,$0020
    dw Instruction_PirateWall_PrepareWallJumpToRight
    dw Instruction_PirateWall_FunctionInY
    dw Function_PirateWall_WallJumpingRight
    dw Instruction_PirateWall_QueueSpacePirateAttackSFX
    dw $000A,ExtendedSpritemaps_PirateWall_7
    dw $0001,ExtendedSpritemaps_PirateWall_8
    dw Instruction_Common_Sleep


;;; $EDA4: Instruction list - landed on right wall ;;;
InstList_PirateWall_LandingOnRightWall:
    dw Instruction_PirateWall_FunctionInY
    dw Function_PirateWall_ClimbingRightWall
    dw $000A,ExtendedSpritemaps_PirateWall_7


;;; $EDAC: Instruction list - moving down right wall ;;;
InstList_PirateWall_MovingDownRightWall_0:
    dw Instruction_PirateWall_FunctionInY
    dw Function_PirateWall_ClimbingRightWall
    dw Instruction_Common_TimerInY,$0004

InstList_PirateWall_MovingDownRightWall_1:
    dw $000A,ExtendedSpritemaps_PirateWall_9
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Right,$0003
    dw $0008,ExtendedSpritemaps_PirateWall_A
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Right,$0003
    dw $0005,ExtendedSpritemaps_PirateWall_B
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Right,$0003
    dw $0008,ExtendedSpritemaps_PirateWall_C
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Right,$0003
    dw $000A,ExtendedSpritemaps_PirateWall_D
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Right,$0003
    dw $0008,ExtendedSpritemaps_PirateWall_C
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Right,$0003
    dw $0005,ExtendedSpritemaps_PirateWall_B
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Right,$0003
    dw $0008,ExtendedSpritemaps_PirateWall_A
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate
    dw InstList_PirateWall_MovingDownRightWall_1
    dw Instruction_PirateWall_RandomlyChooseADirection_RightWall


;;; $EDF6: Instruction list - moving up right wall ;;;
InstList_PirateWall_MovingUpRightWall_0:
    dw Instruction_PirateWall_FunctionInY
    dw Function_PirateWall_ClimbingRightWall
    dw Instruction_Common_TimerInY,$0004

InstList_PirateWall_MovingUpRightWall_1:
    dw $000A,ExtendedSpritemaps_PirateWall_9
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Right,$FFFD
    dw $0008,ExtendedSpritemaps_PirateWall_A
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Right,$FFFD
    dw $0005,ExtendedSpritemaps_PirateWall_B
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Right,$FFFD
    dw $0008,ExtendedSpritemaps_PirateWall_C
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Right,$FFFD
    dw $000A,ExtendedSpritemaps_PirateWall_D
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Right,$FFFD
    dw $0008,ExtendedSpritemaps_PirateWall_C
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Right,$FFFD
    dw $0005,ExtendedSpritemaps_PirateWall_B
    dw Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Right,$FFFD
    dw $0008,ExtendedSpritemaps_PirateWall_A
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate
    dw InstList_PirateWall_MovingUpRightWall_1
    dw Instruction_PirateWall_RandomlyChooseADirection_RightWall


;;; $EE40: Instruction - move [[Y]] pixels down and change direction on collision - left wall ;;;
Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Left:
    PHX
    LDX.W EnemyIndex
    LDA.W #$0000 : STA.B DP_Temp12
    LDA.W $0000,Y : STA.B DP_Temp14
    PHY : PHX
    JSL MoveEnemyDownBy_14_12
    PLX : PLY
    BCC .noCOllision
    LDA.W PirateWall.direction,X : EOR.W #$0001 : STA.W PirateWall.direction,X
    LDY.W #InstList_PirateWall_MovingDownLeftWall_0
    LDA.W PirateWall.direction,X : BEQ .return
    LDY.W #InstList_PirateWall_MovingUpLeftWall_0

  .return:
    PLX
    RTL

  .noCOllision:
    PLX
    INY #2
    RTL


;;; $EE72: Instruction - move enemy [[Y]] pixels down and change direction on collision - right wall ;;;
Inst_PirateWall_MoveYPixelsDown_ChangeDirOnCollision_Right:
    PHX
    LDX.W EnemyIndex
    LDA.W #$0000 : STA.B DP_Temp12
    LDA.W $0000,Y : STA.B DP_Temp14
    PHY : PHX
    JSL MoveEnemyDownBy_14_12
    PLX : PLY
    BCC .noCollision
    LDA.W PirateWall.direction,X : EOR.W #$0001 : STA.W PirateWall.direction,X
    LDY.W #InstList_PirateWall_MovingDownRightWall_0
    LDA.W PirateWall.direction,X : BEQ .return
    LDY.W #InstList_PirateWall_MovingUpRightWall_0

  .return:
    PLX
    RTL

  .noCollision:
    PLX
    INY #2
    RTL


;;; $EEA4: Instruction - randomly choose a direction - left wall ;;;
Instruction_PirateWall_RandomlyChooseADirection_LeftWall:
    PHX
    LDY.W #InstList_PirateWall_MovingDownLeftWall_0
    LDX.W EnemyIndex
    JSL GenerateRandomNumber
    AND.W #$0001 : STA.W PirateWall.direction,X : BEQ .return
    LDY.W #InstList_PirateWall_MovingUpLeftWall_0

  .return:
    PLX
    RTL


;;; $EEBC: Instruction - randomly choose a direction - right wall ;;;
Instruction_PirateWall_RandomlyChooseADirection_RightWall:
    PHX
    LDY.W #InstList_PirateWall_MovingDownRightWall_0
    LDX.W EnemyIndex
    JSL GenerateRandomNumber
    AND.W #$0001 : STA.W PirateWall.direction,X : BEQ .return
    LDY.W #InstList_PirateWall_MovingUpRightWall_0

  .return:
    PLX
    RTL


;;; $EED4: Instruction - prepare wall-jump to right ;;;
Instruction_PirateWall_PrepareWallJumpToRight:
    PHX : PHY
    LDX.W EnemyIndex
    LDA.W Enemy.init1,X : CLC : ADC.W Enemy.XPosition,X : STA.W Enemy.var1,X
    LDA.W Enemy.init1,X : LSR : CLC : ADC.W Enemy.XPosition,X : STA.W PirateWall.wallJumpArcCenterXPosition,X
    LDA.W Enemy.YPosition,X : STA.W PirateWall.wallJumpArcCenterYPosition,X
    LDA.W #$0040 : STA.W PirateWall.wallJumpArcAngle,X
    PLY : PLX
    RTL


;;; $EEFD: Instruction - prepare wall-jump to left ;;;
Instruction_PirateWall_PrepareWallJumpToLeft:
    PHX : PHY
    LDX.W EnemyIndex
    LDA.W Enemy.XPosition,X : SEC : SBC.W Enemy.init1,X : STA.W Enemy.var1,X
    LDA.W Enemy.init1,X : LSR : STA.B DP_Temp12
    LDA.W Enemy.XPosition,X : SEC : SBC.B DP_Temp12 : STA.W PirateWall.wallJumpArcCenterXPosition,X
    LDA.W Enemy.YPosition,X : STA.W PirateWall.wallJumpArcCenterYPosition,X
    LDA.W #$00C0 : STA.W PirateWall.wallJumpArcAngle,X
    PLY : PLX
    RTL


;;; $EF2A: Instruction - fire laser left ;;;
Instruction_PirateWall_FireLaserLeft:
    PHX : PHY
    LDY.W EnemyIndex
    LDX.W Enemy.ID,Y
    LDA.L EnemyHeaders_damage,X : STA.W EnemyProjectile_InitParam0
    LDX.W EnemyIndex
    LDA.W Enemy.XPosition,X : SEC : SBC.W #$0018 : STA.B DP_Temp12
    LDA.W Enemy.YPosition,X : SEC : SBC.W #$0010 : STA.B DP_Temp14
    LDA.W #$0000 : STA.B DP_Temp16
    LDY.W #EnemyProjectile_PirateMotherBrainLaser
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    PLY : PLX
    RTL


;;; $EF5D: Instruction - fire laser right ;;;
Instruction_PirateWall_FireLaserRight:
    PHX : PHY
    LDX.W EnemyIndex
    LDA.W Enemy.XPosition,X : CLC : ADC.W #$0018 : STA.B DP_Temp12
    LDA.W Enemy.YPosition,X : SEC : SBC.W #$0010 : STA.B DP_Temp14
    LDA.W #$0001 : STA.B DP_Temp16
    LDY.W #EnemyProjectile_PirateMotherBrainLaser
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    PLY : PLX
    RTL


;;; $EF83: Instruction - enemy function = [[Y]] ;;;
Instruction_PirateWall_FunctionInY:
    PHY : PHX
    LDX.W EnemyIndex
    LDA.W $0000,Y : STA.W PirateWall.function,X
    PLX : PLY
    INY #2
    RTL


;;; $EF93: Instruction - queue space pirate attack sound effect ;;;
Instruction_PirateWall_QueueSpacePirateAttackSFX:
    PHX : PHY
    LDA.W #$0066
    JSL QueueSound_Lib2_Max6
    PLY : PLX
    RTL


;;; $EF9F: Initialisation AI - enemy $F353/$F393/$F3D3/$F413/$F453/$F493 (wall space pirates) ;;;
InitAI_PirateWall:
    LDX.W EnemyIndex
    LDY.W #InstList_PirateWall_MovingDownLeftWall_0
    LDA.W Enemy.init0,X : BIT.W #$0001 : BEQ .zeroParam
    LDY.W #InstList_PirateWall_MovingDownRightWall_0

  .zeroParam:
    TYA : STA.W Enemy.instList,X
    LDA.W #$00BE : STA.L PirateWall.wallJumpArcRightTargetAngle,X
    LDA.W #$0042 : STA.L PirateWall.wallJumpArcLeftTargetAngle,X
    LDA.W #$0002 : STA.L PirateWall.wallJumpArcAngleDelta,X
    LDA.W Enemy.init0,X : BIT.W #$8000 : BNE .notFastJump
    LDA.L PirateWall.wallJumpArcRightTargetAngle,X : CLC : ADC.W #$0002 : STA.L PirateWall.wallJumpArcRightTargetAngle,X
    LDA.L PirateWall.wallJumpArcLeftTargetAngle,X : SEC : SBC.W #$0002 : STA.L PirateWall.wallJumpArcLeftTargetAngle,X
    LDA.L PirateWall.wallJumpArcAngleDelta,X : CLC : ADC.W #$0002 : STA.L PirateWall.wallJumpArcAngleDelta,X

  .notFastJump:
    LDY.W #Function_PirateWall_ClimbingLeftWall
    LDA.W Enemy.init0,X : BIT.W #$0001 : BEQ +
    LDY.W #Function_PirateWall_ClimbingRightWall

+   TYA : STA.W PirateWall.function,X
    LDA.W Enemy.XPosition,X : AND.W #$000F : CMP.W #$000B : BMI .lessThanB
    LDA.W Enemy.XPosition,X : AND.W #$FFF0 : CLC : ADC.W #$0010 : STA.W Enemy.XPosition,X
    BRA .return

  .lessThanB:
    LDA.W Enemy.XPosition,X : AND.W #$FFF8 : STA.W Enemy.XPosition,X
    BRA .return ; >.<

  .return:
    RTL


;;; $F02D: Main AI - enemy $F353/$F393/$F3D3/$F413/$F453/$F493 (wall space pirates) ;;;
MainAI_PirateWall:
    LDX.W EnemyIndex
    JSR.W (PirateWall.function,X)
    RTL


;;; $F034: Wall space pirate function - climbing left wall ;;;
Function_PirateWall_ClimbingLeftWall:
    LDX.W EnemyIndex
    LDA.W #$0020
    JSL IsSamusWithingAPixelRowsOfEnemy
    BEQ .return
    LDA.W #InstList_PirateWall_FireLaser_WallJumpRight : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    RTS

  .return:
    RTS ; >.<


;;; $F04E: Unused. RTS ;;;
RTS_B2F04E:
    RTS


;;; $F04F: RTS ;;;
RTS_B2F04F:
    RTS


;;; $F050: Wall space pirate function - wall-jumping right ;;;
Function_PirateWall_WallJumpingRight:
    LDX.W EnemyIndex
    LDA.W Enemy.init1,X : LSR : STA.W Temp_Unknown0E32
    LDA.W PirateWall.wallJumpArcAngle,X
    JSL EightBitNegativeSineMultiplication_A0B0C6
    CLC : ADC.W PirateWall.wallJumpArcCenterXPosition,X : STA.W Enemy.XPosition,X
    LDA.W Enemy.init1,X : LSR #2 : STA.W Temp_Unknown0E32
    LDA.W PirateWall.wallJumpArcAngle,X
    JSL EightBitCosineMultiplication_A0B0B2
    EOR.W #$FFFF : INC
    CLC : ADC.W PirateWall.wallJumpArcCenterYPosition,X : STA.W Enemy.YPosition,X
    LDA.W PirateWall.wallJumpArcAngle,X : SEC : SBC.L PirateWall.wallJumpArcAngleDelta,X : AND.W #$00FF : STA.W PirateWall.wallJumpArcAngle,X
    CMP.L PirateWall.wallJumpArcRightTargetAngle,X : BNE .return
    LDA.W #InstList_PirateWall_LandingOnRightWall : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDA.W Enemy.XPosition,X : AND.W #$000F : CMP.W #$000B : BMI .lessThanB
    LDA.W Enemy.XPosition,X : AND.W #$FFF0 : CLC : ADC.W #$0010 : STA.W Enemy.XPosition,X
    BRA .return

  .lessThanB:
    LDA.W Enemy.XPosition,X : AND.W #$FFF8 : STA.W Enemy.XPosition,X
    BRA .return ; >.<

  .return:
    RTS


;;; $F0C8: Wall space pirate function - climbing right wall ;;;
Function_PirateWall_ClimbingRightWall:
    LDX.W EnemyIndex
    LDA.W #$0020
    JSL IsSamusWithingAPixelRowsOfEnemy
    BEQ .return
    LDA.W #InstList_PirateWall_FireLaser_WallJumpLeft : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    RTS

  .return:
    RTS


;;; $F0E2: Unused. RTS ;;;
RTS_B2F0E2:
    RTS


;;; $F0E3: RTS ;;;
RTS_B2F0E3:
    RTS


;;; $F0E4: Wall space pirate function - wall-jumping left ;;;
Function_PirateWall_WallJumpingLeft:
    LDX.W EnemyIndex
    LDA.W Enemy.init1,X : LSR : STA.W Temp_Unknown0E32
    LDA.W PirateWall.wallJumpArcAngle,X
    JSL EightBitNegativeSineMultiplication_A0B0C6
    CLC : ADC.W PirateWall.wallJumpArcCenterXPosition,X : STA.W Enemy.XPosition,X
    LDA.W Enemy.init1,X : LSR #2 : STA.W Temp_Unknown0E32
    LDA.W PirateWall.wallJumpArcAngle,X
    JSL EightBitCosineMultiplication_A0B0B2
    EOR.W #$FFFF : INC
    CLC : ADC.W PirateWall.wallJumpArcCenterYPosition,X : STA.W Enemy.YPosition,X
    LDA.W PirateWall.wallJumpArcAngle,X : CLC : ADC.L PirateWall.wallJumpArcAngleDelta,X : AND.W #$00FF : STA.W PirateWall.wallJumpArcAngle,X
    CMP.L PirateWall.wallJumpArcLeftTargetAngle,X : BNE .return
    LDA.W #InstList_PirateWall_LandedOnLeftWall : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDA.W Enemy.XPosition,X : AND.W #$000F : CMP.W #$000B : BMI .lessThanB
    LDA.W Enemy.XPosition,X : AND.W #$FFF0 : CLC : ADC.W #$0010 : STA.W Enemy.XPosition,X
    BRA .return

  .lessThanB:
    LDA.W Enemy.XPosition,X : AND.W #$FFF8 : STA.W Enemy.XPosition,X
    BRA .return ; >.<

  .return:
    RTS


;;; $F15C: Instruction list - projectile claw attack left ;;;
InstList_PirateNinja_ProjectileClawAttack_Left:
    dw Instruction_PirateWall_FunctionInY
    dw RTS_A0804B
    dw $0005,ExtendedSpritemaps_PirateNinja_0
    dw $0005,ExtendedSpritemaps_PirateNinja_1
    dw $0005,ExtendedSpritemaps_PirateNinja_2
    dw $0005,ExtendedSpritemaps_PirateNinja_3
    dw $0005,ExtendedSpritemaps_PirateNinja_4
    dw $0002,ExtendedSpritemaps_PirateNinja_5
    dw Instruction_PirateNinja_SpawnClawProjWithThrowDirSpawnOffset
    dw $0000,$FFE0,$FFF8
    dw Instruction_PirateNinja_QueueSoundInY_Lib2_Max6,$0066
    dw $0002,ExtendedSpritemaps_PirateNinja_6
    dw $0002,ExtendedSpritemaps_PirateNinja_7
    dw $0002,ExtendedSpritemaps_PirateNinja_8
    dw $0005,ExtendedSpritemaps_PirateNinja_0
    dw $0005,ExtendedSpritemaps_PirateNinja_1
    dw $0005,ExtendedSpritemaps_PirateNinja_2
    dw $0005,ExtendedSpritemaps_PirateNinja_3
    dw $0005,ExtendedSpritemaps_PirateNinja_4
    dw $0002,ExtendedSpritemaps_PirateNinja_5
    dw Instruction_PirateNinja_SpawnClawProjWithThrowDirSpawnOffset
    dw $0000,$FFF0,$0008
    dw Instruction_PirateNinja_QueueSoundInY_Lib2_Max6,$0066
    dw $0002,ExtendedSpritemaps_PirateNinja_6
    dw $0002,ExtendedSpritemaps_PirateNinja_7
    dw $0002,ExtendedSpritemaps_PirateNinja_8
    dw Instruction_Common_GotoY
    dw InstList_PirateNinja_Active_FacingLeft_0


;;; $F1C4: Instruction list - spin jump left ;;;
InstList_PirateNinja_SpinJumpLeft_0:
    dw Instruction_PirateWall_FunctionInY
    dw RTS_A0804B
    dw $0005,ExtendedSpritemaps_PirateNinja_0
    dw $0005,ExtendedSpritemaps_PirateNinja_1
    dw $0005,ExtendedSpritemaps_PirateNinja_2
    dw $0005,ExtendedSpritemaps_PirateNinja_3
    dw $0005,ExtendedSpritemaps_PirateNinja_4
    dw $0002,ExtendedSpritemaps_PirateNinja_5
    dw Instruction_PirateNinja_SpawnClawProjWithThrowDirSpawnOffset
    dw $0000,$FFE0,$FFF8
    dw Instruction_PirateNinja_QueueSoundInY_Lib2_Max6,$0066
    dw $0002,ExtendedSpritemaps_PirateNinja_6
    dw $0002,ExtendedSpritemaps_PirateNinja_7
    dw $0002,ExtendedSpritemaps_PirateNinja_8
    dw Instruction_PirateNinja_ResetSpeed
    dw Instruction_PirateWall_FunctionInY
    dw RTS_A0804B
    dw $0008,ExtendedSpritemaps_PirateNinja_0
    dw Instruction_PirateWall_FunctionInY
    dw Function_PirateNinja_SpinJumpleft_Rising

InstList_PirateNinja_SpinJumpLeft_1:
    dw Instruction_PirateNinja_QueueSoundInY_Lib2_Max6,$003F
    dw $0001,ExtendedSpritemaps_PirateNinja_12
    dw $0001,ExtendedSpritemaps_PirateNinja_13
    dw $0001,ExtendedSpritemaps_PirateNinja_14
    dw $0001,ExtendedSpritemaps_PirateNinja_15
    dw $0001,ExtendedSpritemaps_PirateNinja_16
    dw $0001,ExtendedSpritemaps_PirateNinja_17
    dw $0001,ExtendedSpritemaps_PirateNinja_18
    dw $0001,ExtendedSpritemaps_PirateNinja_19
    dw Instruction_Common_GotoY
    dw InstList_PirateNinja_SpinJumpLeft_1


;;; $F22E: Instruction list - active - facing left ;;;
InstList_PirateNinja_Active_FacingLeft_0:
    dw Instruction_PirateWall_FunctionInY
    dw Function_PirateNinja_Active

InstList_PirateNinja_Active_FacingLeft_1:
    dw $000A,ExtendedSpritemaps_PirateNinja_32
    dw $000A,ExtendedSpritemaps_PirateNinja_33
    dw $000A,ExtendedSpritemaps_PirateNinja_34
    dw $000A,ExtendedSpritemaps_PirateNinja_33
    dw Instruction_PirateWall_FunctionInY
    dw RTS_A0804B
    dw Instruction_PirateNinja_SetFunction0FAC_Active
    dw Instruction_Common_GotoY
    dw InstList_PirateNinja_Active_FacingLeft_1


if !FEATURE_KEEP_UNREFERENCED
;;; $F24C: Unused. Instruction list - walking left ;;;
UNUSED_InstList_PirateNinja_WalkingLeft_B2F24C:
    dw $0005,ExtendedSpritemaps_PirateNinja_22
    dw $0005,ExtendedSpritemaps_PirateNinja_23
    dw $0005,ExtendedSpritemaps_PirateNinja_24
    dw $0005,ExtendedSpritemaps_PirateNinja_25
    dw $0005,ExtendedSpritemaps_PirateNinja_26
    dw $0005,ExtendedSpritemaps_PirateNinja_27
    dw $0005,ExtendedSpritemaps_PirateNinja_28
    dw $0005,ExtendedSpritemaps_PirateNinja_29
    dw Instruction_Common_GotoY
    dw UNUSED_InstList_PirateNinja_WalkingLeft_B2F24C
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $F270: Instruction list - flinch - facing left ;;;
InstList_PirateNinja_Flinch_FacingLeft:
    dw Instruction_PirateWall_FunctionInY
    dw RTS_A0804B
    dw $0010,ExtendedSpritemaps_PirateNinja_38
    dw Instruction_Common_GotoY
    dw InstList_PirateNinja_Active_FacingLeft_0


;;; $F27C: Instruction list - divekick left - jump ;;;
InstList_PirateNinja_DivekickLeft_Jump_0:
    dw Instruction_PirateWall_FunctionInY
    dw RTS_B2804B
    dw $0008,ExtendedSpritemaps_PirateNinja_42
    dw Instruction_PirateNinja_SetLeftDivekickJumpInitialYSpeed
    dw Instruction_PirateWall_FunctionInY
    dw Instruction_PirateNinja_DivekickLeft_Jump

InstList_PirateNinja_DivekickLeft_Jump_1:
    dw Instruction_PirateNinja_PaletteIndexInY,$0200
    dw $0004,ExtendedSpritemaps_PirateNinja_3A
    dw Instruction_PirateNinja_PaletteIndexInY,$0E00
    dw $0004,ExtendedSpritemaps_PirateNinja_3A
    dw Instruction_Common_GotoY
    dw InstList_PirateNinja_DivekickLeft_Jump_1
    dw Instruction_Common_Sleep


;;; $F2A0: Instruction list - divekick left - divekick ;;;
InstList_PirateNinja_DivekickLeft_Divekick:
    dw Instruction_PirateNinja_PaletteIndexInY,$0E00
    dw Instruction_PirateWall_FunctionInY
    dw Instruction_PirateNinja_DivekickLeft_Divekick
    dw Instruction_PirateNinja_QueueSoundInY_Lib2_Max6,$0066
    dw $0001,ExtendedSpritemaps_PirateNinja_3B
    dw Instruction_Common_Sleep


;;; $F2B2: Instruction list - divekick left - walk to left post ;;;
InstList_PirateNinja_DivekickLeft_WalkToLeftPost_0:
    dw Instruction_PirateWall_FunctionInY
    dw Instruction_PirateNinja_DivekickLeft_WalkToLeftPost

InstList_PirateNinja_DivekickLeft_WalkToLeftPost_1:
    dw $0005,ExtendedSpritemaps_PirateNinja_22
    dw $0005,ExtendedSpritemaps_PirateNinja_23
    dw $0005,ExtendedSpritemaps_PirateNinja_24
    dw $0005,ExtendedSpritemaps_PirateNinja_25
    dw $0005,ExtendedSpritemaps_PirateNinja_26
    dw $0005,ExtendedSpritemaps_PirateNinja_27
    dw $0005,ExtendedSpritemaps_PirateNinja_28
    dw $0005,ExtendedSpritemaps_PirateNinja_29
    dw Instruction_Common_GotoY
    dw InstList_PirateNinja_DivekickLeft_WalkToLeftPost_1


;;; $F2DA: Instruction list - initial - facing left ;;;
InstList_PirateNinja_Initial_FacingLeft_0:
    dw Instruction_PirateWall_FunctionInY
    dw Function_PirateNinja_Initial

InstList_PirateNinja_Initial_FacingLeft_1:
    dw $0020,ExtendedSpritemaps_PirateNinja_46
    dw $000A,ExtendedSpritemaps_PirateNinja_47
    dw $0020,ExtendedSpritemaps_PirateNinja_48
    dw $000A,ExtendedSpritemaps_PirateNinja_47
    dw $0020,ExtendedSpritemaps_PirateNinja_46
    dw Instruction_Common_GotoY
    dw InstList_PirateNinja_Initial_FacingLeft_1
    dw Instruction_Common_Sleep


;;; $F2F8: Instruction list - land - facing left ;;;
InstList_PirateNinja_Land_FacingLeft_0:
    dw Instruction_PirateNinja_PaletteIndexInY,$0200
    dw Instruction_PirateWall_FunctionInY
    dw RTS_A0804B
    dw $0004,ExtendedSpritemaps_PirateNinja_47
    dw $0008,ExtendedSpritemaps_PirateNinja_46
    dw $0004,ExtendedSpritemaps_PirateNinja_4C
    dw $0004,ExtendedSpritemaps_PirateNinja_4A
    dw Instruction_PirateWall_FunctionInY
    dw Function_PirateNinja_ReadingToDivekick

InstList_PirateNinja_Land_FacingLeft_1:
    dw $000A,ExtendedSpritemaps_PirateNinja_35
    dw $000A,ExtendedSpritemaps_PirateNinja_36
    dw $000A,ExtendedSpritemaps_PirateNinja_37
    dw $000A,ExtendedSpritemaps_PirateNinja_36
    dw Instruction_Common_GotoY
    dw InstList_PirateNinja_Land_FacingLeft_1


if !FEATURE_KEEP_UNREFERENCED
;;; $F328: Unused. Instruction list - facing forward ;;;
UNUSED_InstList_PirateNinja_FacingForward_B2F328:
    dw $0008,ExtendedSpritemaps_PirateNinja_4C
    dw Instruction_Common_Sleep
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $F32E: Instruction list - standing kick - facing left ;;;
InstList_PirateNinja_StandingKick_FacingLeft:
    dw Instruction_PirateWall_FunctionInY
    dw RTS_A0804B
    dw $0004,ExtendedSpritemaps_PirateNinja_3E
    dw Instruction_PirateNinja_QueueSoundInY_Lib2_Max6,$0066
    dw $0004,ExtendedSpritemaps_PirateNinja_44
    dw $0020,ExtendedSpritemaps_PirateNinja_3F
    dw $0004,ExtendedSpritemaps_PirateNinja_44
    dw Instruction_Common_GotoY
    dw InstList_PirateNinja_Active_FacingLeft_0


;;; $F34A: Instruction list - projectile claw attack right ;;;
InstList_PirateNinja_ProjectileClawAttack_Right:
    dw Instruction_PirateWall_FunctionInY
    dw RTS_B2804B
    dw $0005,ExtendedSpritemaps_PirateNinja_9
    dw $0005,ExtendedSpritemaps_PirateNinja_A
    dw $0005,ExtendedSpritemaps_PirateNinja_B
    dw $0005,ExtendedSpritemaps_PirateNinja_C
    dw $0005,ExtendedSpritemaps_PirateNinja_D
    dw $0002,ExtendedSpritemaps_PirateNinja_E
    dw Instruction_PirateNinja_SpawnClawProjWithThrowDirSpawnOffset
    dw $0001,$0020,$FFF8
    dw Instruction_PirateNinja_QueueSoundInY_Lib2_Max6,$0066
    dw $0002,ExtendedSpritemaps_PirateNinja_A
    dw $0002,ExtendedSpritemaps_PirateNinja_F
    dw $0002,ExtendedSpritemaps_PirateNinja_11
    dw $0005,ExtendedSpritemaps_PirateNinja_9
    dw $0005,ExtendedSpritemaps_PirateNinja_A
    dw $0005,ExtendedSpritemaps_PirateNinja_B
    dw $0005,ExtendedSpritemaps_PirateNinja_C
    dw $0005,ExtendedSpritemaps_PirateNinja_D
    dw $0002,ExtendedSpritemaps_PirateNinja_E
    dw Instruction_PirateNinja_SpawnClawProjWithThrowDirSpawnOffset
    dw $0001,$0010,$0008
    dw $0002,ExtendedSpritemaps_PirateNinja_A
    dw Instruction_PirateNinja_QueueSoundInY_Lib2_Max6,$0066
    dw $0002,ExtendedSpritemaps_PirateNinja_F
    dw $0002,ExtendedSpritemaps_PirateNinja_11
    dw Instruction_Common_GotoY
    dw InstList_PirateNinja_Active_FacingRight_0


;;; $F3B2: Instruction list - spin jump right ;;;
InstList_PirateNinja_SpinJumpRight_0:
    dw Instruction_PirateWall_FunctionInY
    dw RTS_B2804B
    dw $0005,ExtendedSpritemaps_PirateNinja_9
    dw $0005,ExtendedSpritemaps_PirateNinja_A
    dw $0005,ExtendedSpritemaps_PirateNinja_B
    dw $0005,ExtendedSpritemaps_PirateNinja_C
    dw $0005,ExtendedSpritemaps_PirateNinja_D
    dw $0002,ExtendedSpritemaps_PirateNinja_E
    dw Instruction_PirateNinja_SpawnClawProjWithThrowDirSpawnOffset
    dw $0001,$0020,$FFF8
    dw Instruction_PirateNinja_QueueSoundInY_Lib2_Max6,$0066
    dw $0002,ExtendedSpritemaps_PirateNinja_A
    dw $0002,ExtendedSpritemaps_PirateNinja_F
    dw $0002,ExtendedSpritemaps_PirateNinja_11
    dw Instruction_PirateNinja_ResetSpeed
    dw Instruction_PirateWall_FunctionInY
    dw RTS_A0804B
    dw $0008,ExtendedSpritemaps_PirateNinja_9
    dw Instruction_PirateWall_FunctionInY
    dw Function_PirateNinja_SpinJumpRight_Rising

InstList_PirateNinja_SpinJumpRight_1:
    dw Instruction_PirateNinja_QueueSoundInY_Lib2_Max6,$003F
    dw $0001,ExtendedSpritemaps_PirateNinja_1A
    dw $0001,ExtendedSpritemaps_PirateNinja_1B
    dw $0001,ExtendedSpritemaps_PirateNinja_1C
    dw $0001,ExtendedSpritemaps_PirateNinja_1D
    dw $0001,ExtendedSpritemaps_PirateNinja_1E
    dw $0001,ExtendedSpritemaps_PirateNinja_1F
    dw $0001,ExtendedSpritemaps_PirateNinja_20
    dw $0001,ExtendedSpritemaps_PirateNinja_21
    dw Instruction_Common_GotoY
    dw InstList_PirateNinja_SpinJumpRight_1


if !FEATURE_KEEP_UNREFERENCED
;;; $F41C: Unused. Instruction list ;;;
UNUSED_InstList_PirateNinja_B2F41C:
    dw $0010,ExtendedSpritemaps_PirateNinja_9
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $F420: Instruction list - active - facing right ;;;
InstList_PirateNinja_Active_FacingRight_0:
    dw Instruction_PirateWall_FunctionInY
    dw Function_PirateNinja_Active

InstList_PirateNinja_Active_FacingRight_1:
    dw $000A,ExtendedSpritemaps_PirateNinja_35
    dw $000A,ExtendedSpritemaps_PirateNinja_36
    dw $000A,ExtendedSpritemaps_PirateNinja_37
    dw $000A,ExtendedSpritemaps_PirateNinja_36
    dw Instruction_PirateWall_FunctionInY
    dw RTS_B2804B
    dw Instruction_PirateNinja_SetFunction0FAC_Active
    dw Instruction_Common_GotoY
    dw InstList_PirateNinja_Active_FacingRight_1


if !FEATURE_KEEP_UNREFERENCED
;;; $F43E: Unused. Instruction list - walking right ;;;
UNUSED_InstList_PirateNinja_WalkingRight_B2F43E:
    dw $0005,ExtendedSpritemaps_PirateNinja_2A
    dw $0005,ExtendedSpritemaps_PirateNinja_2B
    dw $0005,ExtendedSpritemaps_PirateNinja_2C
    dw $0005,ExtendedSpritemaps_PirateNinja_2D
    dw $0005,ExtendedSpritemaps_PirateNinja_2E
    dw $0005,ExtendedSpritemaps_PirateNinja_2F
    dw $0005,ExtendedSpritemaps_PirateNinja_30
    dw $0005,ExtendedSpritemaps_PirateNinja_31
    dw Instruction_Common_GotoY
    dw UNUSED_InstList_PirateNinja_WalkingRight_B2F43E
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $F462: Instruction list - flinch - facing right ;;;
InstList_PirateNinja_Flinch_FacingRight:
    dw Instruction_PirateWall_FunctionInY
    dw RTS_B2804B
    dw $0010,ExtendedSpritemaps_PirateNinja_39
    dw Instruction_Common_GotoY
    dw InstList_PirateNinja_Active_FacingRight_0


;;; $F46E: Instruction list - divekick right - jump ;;;
InstList_PirateNinja_DivekickRight_Jump_0:
    dw Instruction_PirateWall_FunctionInY
    dw RTS_B2804B
    dw $0008,ExtendedSpritemaps_PirateNinja_43
    dw Instruction_PirateNinja_SetRightDivekickJumpInitialYSpeed
    dw Instruction_PirateWall_FunctionInY
    dw Instruction_PirateNinja_DivekickRight_Jump

InstList_PirateNinja_DivekickRight_Jump_1:
    dw Instruction_PirateNinja_PaletteIndexInY,$0200
    dw $0004,ExtendedSpritemaps_PirateNinja_3C
    dw Instruction_PirateNinja_PaletteIndexInY,$0E00
    dw $0004,ExtendedSpritemaps_PirateNinja_3C
    dw Instruction_Common_GotoY
    dw InstList_PirateNinja_DivekickRight_Jump_1
    dw Instruction_Common_Sleep


;;; $F492: Instruction list - divekick right - divekick ;;;
InstList_PirateNinja_DivekickRight_Divekick:
    dw Instruction_PirateNinja_PaletteIndexInY,$0E00
    dw Instruction_PirateWall_FunctionInY
    dw Instruction_PirateNinja_DivekickRight_Divekick
    dw Instruction_PirateNinja_QueueSoundInY_Lib2_Max6,$0066
    dw $0001,ExtendedSpritemaps_PirateNinja_3D
    dw Instruction_Common_Sleep


;;; $F4A4: Instruction list - divekick right - walk to right post ;;;
InstList_PirateNinja_DivekickRight_WalkToRightPost_0:
    dw Instruction_PirateWall_FunctionInY
    dw Instruction_PirateNinja_DivekickRight_WalkToRightPost

InstList_PirateNinja_DivekickRight_WalkToRightPost_1:
    dw $0005,ExtendedSpritemaps_PirateNinja_2A
    dw $0005,ExtendedSpritemaps_PirateNinja_2B
    dw $0005,ExtendedSpritemaps_PirateNinja_2C
    dw $0005,ExtendedSpritemaps_PirateNinja_2D
    dw $0005,ExtendedSpritemaps_PirateNinja_2E
    dw $0005,ExtendedSpritemaps_PirateNinja_2F
    dw $0005,ExtendedSpritemaps_PirateNinja_30
    dw $0005,ExtendedSpritemaps_PirateNinja_31
    dw Instruction_Common_GotoY
    dw InstList_PirateNinja_DivekickRight_WalkToRightPost_1


;;; $F4CC: Instruction list - initial - facing right ;;;
InstList_PirateNinja_Initial_FacingRight_0:
    dw Instruction_PirateWall_FunctionInY
    dw Function_PirateNinja_Initial

InstList_PirateNinja_Initial_FacingRight_1:
    dw $0020,ExtendedSpritemaps_PirateNinja_49
    dw $000A,ExtendedSpritemaps_PirateNinja_4A
    dw $0020,ExtendedSpritemaps_PirateNinja_4B
    dw $000A,ExtendedSpritemaps_PirateNinja_4A
    dw $0020,ExtendedSpritemaps_PirateNinja_49
    dw Instruction_Common_GotoY
    dw InstList_PirateNinja_Initial_FacingRight_1
    dw Instruction_Common_Sleep


;;; $F4EA: Instruction list - land - facing right ;;;
InstList_PirateNinja_Land_FacingRight_0:
    dw Instruction_PirateNinja_PaletteIndexInY,$0200
    dw Instruction_PirateWall_FunctionInY
    dw RTS_A0804B
    dw $0004,ExtendedSpritemaps_PirateNinja_4A
    dw $0008,ExtendedSpritemaps_PirateNinja_49
    dw $0004,ExtendedSpritemaps_PirateNinja_4C
    dw $0004,ExtendedSpritemaps_PirateNinja_47
    dw Instruction_PirateWall_FunctionInY
    dw Function_PirateNinja_ReadingToDivekick

InstList_PirateNinja_Land_FacingRight_1:
    dw $000A,ExtendedSpritemaps_PirateNinja_32
    dw $000A,ExtendedSpritemaps_PirateNinja_33
    dw $000A,ExtendedSpritemaps_PirateNinja_34
    dw $000A,ExtendedSpritemaps_PirateNinja_33
    dw Instruction_Common_GotoY
    dw InstList_PirateNinja_Land_FacingRight_1


;;; $F51A: Instruction list - standing kick - facing right ;;;
InstList_PirateNinja_StandingKick_FacingRight:
    dw Instruction_PirateWall_FunctionInY
    dw RTS_A0804B
    dw $0004,ExtendedSpritemaps_PirateNinja_40
    dw Instruction_PirateNinja_QueueSoundInY_Lib2_Max6,$0066
    dw $0004,ExtendedSpritemaps_PirateNinja_45
    dw $0020,ExtendedSpritemaps_PirateNinja_41
    dw $0004,ExtendedSpritemaps_PirateNinja_45
    dw Instruction_Common_GotoY
    dw InstList_PirateNinja_Active_FacingRight_0


;;; $F536: Instruction - enemy palette index = [[Y]] ;;;
Instruction_PirateNinja_PaletteIndexInY:
    PHX : PHY
    LDX.W EnemyIndex
    LDA.W $0000,Y : STA.W Enemy.palette,X
    PLY : PLX
    INY #2
    RTL


;;; $F546: Instruction - queue sound [[Y]], sound library 2, max queued sounds allowed = 6 ;;;
Instruction_PirateNinja_QueueSoundInY_Lib2_Max6:
    PHX : PHY
    LDA.W $0000,Y
    JSL QueueSound_Lib2_Max6
    PLY : PLX
    INY #2
    RTL


if !FEATURE_KEEP_UNREFERENCED
;;; $F554: Unused. Instruction - go to Enemy.var2 ;;;
UNUSED_Instruction_PirateNinja_GotoFunction0FAC_B2F554:
    PHX
    LDX.W EnemyIndex
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDA.W Enemy.var2,X : TAY
    PLX
    RTL
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $F564: Instruction - spawn space pirate claw enemy projectile with throw direction [[Y]] and spawn offset ([[Y] + 2], [[Y] + 4]) ;;;
Instruction_PirateNinja_SpawnClawProjWithThrowDirSpawnOffset:
    PHX : PHY
    LDX.W EnemyIndex
    LDA.W $0002,Y : STA.B DP_Temp16
    LDA.W $0004,Y : STA.B DP_Temp18
    LDA.W Enemy.XPosition,X : STA.B DP_Temp12
    LDA.W Enemy.YPosition,X : STA.B DP_Temp14
    LDA.W $0000,Y
    LDY.W #EnemyProjectile_PirateClaw
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    PLY : PLX
    INY #6
    RTL


;;; $F590: Instruction - set Enemy.var2 - active ;;;
Instruction_PirateNinja_SetFunction0FAC_Active:
    PHX
    LDX.W EnemyIndex
    LDA.W Enemy.XPosition,X : SEC : SBC.W SamusXPosition : STA.B DP_Temp12
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDY.W #InstList_PirateNinja_Active_FacingLeft_0
    LDA.B DP_Temp12 : BPL .keepLeft
    LDY.W #InstList_PirateNinja_Active_FacingRight_0

  .keepLeft:
    TYA : STA.W Enemy.var2,X
    PLX
    RTL


if !FEATURE_KEEP_UNREFERENCED
;;; $F5B3: Unused. Instruction - set Enemy.var2 - standing kick ;;;
UNUSED_Instruction_PirateNinja_Set0FAC_StandingKick_B2F5B3:
    PHX
    LDX.W EnemyIndex
    LDA.W Enemy.XPosition,X : SEC : SBC.W SamusXPosition : STA.B DP_Temp12
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDY.W #InstList_PirateNinja_StandingKick_FacingLeft
    LDA.B DP_Temp12 : BPL .keepLeft
    LDY.W #InstList_PirateNinja_StandingKick_FacingRight

  .keepLeft:
    TYA : STA.W Enemy.var2,X
    PLX
    RTL
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $F5D6: Instruction - enemy speed = 0 ;;;
Instruction_PirateNinja_ResetSpeed:
    LDA.W #$0000 : STA.L PirateNinja.speed,X
    RTL


;;; $F5DE: Initialisation AI - enemy $F4D3/$F513/$F553/$F593/$F5D3/$F613 (ninja space pirates) ;;;
InitAI_PirateNinja:
    LDX.W EnemyIndex
    LDY.W #InstList_PirateNinja_Initial_FacingLeft_0
    LDA.W Enemy.init0,X : BIT.W #$0001 : BEQ .zeroParam1
    LDY.W #InstList_PirateNinja_Initial_FacingRight_0

  .zeroParam1:
    TYA : STA.W Enemy.instList,X : STA.W Enemy.var2,X
    LDA.W Enemy.init0,X : BIT.W #$0001 : BEQ .zeroParam1again
    LDA.W Enemy.XPosition,X : STA.W PirateNinja.leftPostXPosition,X
    CLC : ADC.W Enemy.init1,X : STA.W PirateNinja.rightPostXPosition,X
    BRA +

  .zeroParam1again:
    LDA.W Enemy.XPosition,X : STA.W PirateNinja.rightPostXPosition,X
    SEC : SBC.W Enemy.init1,X : STA.W PirateNinja.leftPostXPosition,X

+   LDA.W PirateNinja.rightPostXPosition,X : SEC : SBC.W PirateNinja.leftPostXPosition,X : LSR : STA.B DP_Temp14
    CLC : ADC.W PirateNinja.leftPostXPosition,X : STA.W PirateNinja.postsMidpointXPosition,X
    LDA.W PirateNinja.postsMidpointXPosition,X ; >_<
    STZ.B DP_Temp12 : STZ.B DP_Temp16
    LDA.B DP_Temp14 : AND.W #$00FF : XBA : STA.B DP_Temp14

  .loop:
    LDA.W #$0020 : CLC : ADC.B DP_Temp12 : STA.B DP_Temp12
    CLC : ADC.B DP_Temp16 : STA.B DP_Temp16
    CMP.B DP_Temp14 : BMI .loop
    LDA.B DP_Temp12 : STA.W Enemy.var1,X
    LDA.B DP_Temp16 : AND.W #$FF00 : XBA : STA.B DP_Temp18
    CLC : ADC.W PirateNinja.postsMidpointXPosition,X : STA.W PirateNinja.rightPostXPosition,X
    LDA.W PirateNinja.postsMidpointXPosition,X : SEC : SBC.B DP_Temp18 : STA.W PirateNinja.leftPostXPosition,X
    LDY.W PirateNinja.leftPostXPosition,X
    LDA.W Enemy.init0,X : BIT.W #$0001 : BNE .zeroParam1again2
    LDY.W PirateNinja.rightPostXPosition,X

  .zeroParam1again2:
    TYA : STA.W Enemy.XPosition,X
    LDA.W #RTS_B2804B : STA.W PirateNinja.function,X
    LDA.W Enemy.YPosition,X : STA.L PirateNinja.spawnYPosition,X
    LDY.W #$0000
    LDX.W #$0000
    LDA.W #$000F : STA.B DP_Temp12

  .loopPalette:
    LDA.W Palette_Pirate_Gold_NonNinja,Y : STA.L TargetPalettes_SpriteP7,X
    INY #2
    INX #2
    DEC.B DP_Temp12 : BPL .loopPalette
    RTL


;;; $F6A2: Main AI - enemy $F4D3/$F513/$F553/$F593/$F5D3/$F613 (ninja space pirates) ;;;
MainAI_PirateNinja:
    LDX.W EnemyIndex
    JSR.W (PirateNinja.function,X)
    RTL


;;; $F6A9: Ninja space pirate function - initial ;;;
Function_PirateNinja_Initial:
    LDX.W EnemyIndex ; >.<
    LDA.W Enemy.XPosition,X : SEC : SBC.W SamusXPosition : BPL +
    EOR.W #$FFFF : INC

+   SEC : SBC.W #$0080 : BPL .tooFar
    LDA.W Enemy.XPosition,X : SEC : SBC.W SamusXPosition : STA.B DP_Temp12
    LDY.W #InstList_PirateNinja_Active_FacingLeft_0
    LDA.B DP_Temp12 : BPL .keepLeft
    LDY.W #InstList_PirateNinja_Active_FacingRight_0

  .keepLeft:
    TYA : STA.W Enemy.instList,X : STA.W Enemy.var2,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    RTS

  .tooFar:
    JSR PirateNinja_FlinchTrigger
    RTS


;;; $F6E4: Ninja space pirate function - active ;;;
Function_PirateNinja_Active:
    JSR PirateNinja_FlinchTrigger
    BNE .return
    JSR PirateNinja_StandingKickTrigger
    BNE .return
    JSR PirateNinja_SpinJumpTrigger
    BNE .return
    JSR PirateNinja_ProjectileClawAttackTrigger

  .return:
    RTS


;;; $F6F7: Ninja space pirate projectile claw attack trigger ;;;
PirateNinja_ProjectileClawAttackTrigger:
    LDA.W Enemy.frameCounter,X : AND.W #$003F : BNE .return
    LDA.W Enemy.XPosition,X : CMP.W PirateNinja.leftPostXPosition,X : BEQ .reachedLeftPost
    LDA.W Enemy.XPosition,X : SEC : SBC.W SamusXPosition : BPL .return
    LDA.W #InstList_PirateNinja_ProjectileClawAttack_Right : STA.W Enemy.instList,X
    BRA .set1Timer

  .reachedLeftPost:
    LDA.W Enemy.XPosition,X : SEC : SBC.W SamusXPosition : BMI .return
    LDA.W #InstList_PirateNinja_ProjectileClawAttack_Left : STA.W Enemy.instList,X

  .set1Timer:
    LDA.W #$0001 : STA.W Enemy.instTimer,X

  .return:
    RTS


;;; $F72E: Ninja space pirate flinch trigger ;;;
PirateNinja_FlinchTrigger:
;; Returns:
;;     A: 1 if flinch triggered, 0 otherwise
    PHX ; >.<
    LDX.W EnemyIndex ; >.<
    LDY.W #$0008

  .loop:
    LDA.W SamusProjectile_Types,Y : BNE .checkProjectile
    DEY #2 : BPL .loop
    BRA .returnNoFlinch

  .checkProjectile:
    LDA.W SamusProjectile_XPositions,Y : SEC : SBC.W Enemy.XPosition,X : BPL +
    EOR.W #$FFFF : INC

+   SEC : SBC.W #$0020 : BPL .returnNoFlinch
    LDA.W SamusProjectile_YPositions,Y : SEC : SBC.W Enemy.YPosition,X : BPL +
    EOR.W #$FFFF : INC

+   SEC : SBC.W #$0020 : BPL .returnNoFlinch
    LDA.W Enemy.XPosition,X : SEC : SBC.W SamusXPosition : STA.B DP_Temp12
    LDY.W #InstList_PirateNinja_Flinch_FacingLeft
    LDA.B DP_Temp12 : BPL .keepLeft
    LDY.W #InstList_PirateNinja_Flinch_FacingRight

  .keepLeft:
    TYA : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    PLX
    LDA.W #$0001
    RTS

  .returnNoFlinch:
    PLX
    LDA.W #$0000
    RTS


;;; $F78D: Ninja space pirate spin jump trigger ;;;
PirateNinja_SpinJumpTrigger:
;; Returns:
;;     A: 1 if spin jump triggered, 0 otherwise
    PHX ; >.<
    LDX.W EnemyIndex ; >.<
    LDA.W PirateNinja.postsMidpointXPosition,X : SEC : SBC.W SamusXPosition : BPL +
    EOR.W #$FFFF : INC

+   SEC : SBC.W #$0020 : BPL .returnNoSpinJump
    LDY.W #InstList_PirateNinja_SpinJumpLeft_0
    LDA.W Enemy.XPosition,X : CMP.W PirateNinja.leftPostXPosition,X : BNE .keepLeft
    LDY.W #InstList_PirateNinja_SpinJumpRight_0

  .keepLeft:
    TYA : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    PLX
    LDA.W #$0001
    RTS

  .returnNoSpinJump:
    PLX
    LDA.W #$0000
    RTS


;;; $F7C6: Ninja space pirate standing kick trigger ;;;
PirateNinja_StandingKickTrigger:
;; Returns:
;;     A: 1 if kick triggered, 0 otherwise
    PHX ; >.<
    LDX.W EnemyIndex ; >.<
    LDA.W SamusXPosition : SEC : SBC.W Enemy.XPosition,X : BPL +
    EOR.W #$FFFF : INC

+   SEC : SBC.W #$0028 : BPL .returnNoStandingKick
    LDA.W SamusYPosition : SEC : SBC.W Enemy.YPosition,X : BPL +
    EOR.W #$FFFF : INC

+   SEC : SBC.W #$0028 : BPL .returnNoStandingKick
    LDA.W Enemy.XPosition,X : SEC : SBC.W SamusXPosition : STA.B DP_Temp12
    LDY.W #InstList_PirateNinja_StandingKick_FacingLeft
    LDA.B DP_Temp12 : BPL .kepLeft
    LDY.W #InstList_PirateNinja_StandingKick_FacingRight

  .kepLeft:
    TYA : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    PLX
    LDA.W #$0001
    RTS

  .returnNoStandingKick:
    PLX
    LDA.W #$0000
    RTS


;;; $F817: Ninja space pirate function - spin jump left - rising ;;;
Function_PirateNinja_SpinJumpleft_Rising:
    LDA.L PirateNinja.speed,X : AND.W #$FF00 : XBA : STA.B DP_Temp12
    LDA.W Enemy.XPosition,X : SEC : SBC.B DP_Temp12 : STA.W Enemy.XPosition,X
    DEC.W Enemy.YPosition,X : DEC.W Enemy.YPosition,X
    LDA.L PirateNinja.speed,X : CLC : ADC.W #$0020 : STA.L PirateNinja.speed,X
    LDA.W Enemy.XPosition,X : CMP.W PirateNinja.postsMidpointXPosition,X : BMI .falling
    RTS

  .falling:
    LDA.W #Function_PirateNinja_SpinJumpLeft_Falling : STA.W PirateNinja.function,X
    RTS


;;; $F84C: Ninja space pirate function - spin jump left - falling ;;;
Function_PirateNinja_SpinJumpLeft_Falling:
    LDA.L PirateNinja.speed,X : AND.W #$FF00 : XBA : STA.B DP_Temp12
    LDA.W Enemy.XPosition,X : SEC : SBC.B DP_Temp12 : STA.W Enemy.XPosition,X
    INC.W Enemy.YPosition,X : INC.W Enemy.YPosition,X
    LDA.L PirateNinja.speed,X : SEC : SBC.W #$0020 : STA.L PirateNinja.speed,X : BEQ .landing
    RTS

  .landing:
    LDA.W #RTS_B2804B : STA.W PirateNinja.function,X
    LDA.W #InstList_PirateNinja_Land_FacingLeft_0 : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDA.W PirateNinja.leftPostXPosition,X : STA.W Enemy.XPosition,X
    JSR PirateNinja_SpawnLandingDustCloud
    RTS


;;; $F890: Ninja space pirate function - spin jump right - rising ;;;
Function_PirateNinja_SpinJumpRight_Rising:
    LDA.L PirateNinja.speed,X : AND.W #$FF00 : XBA : STA.B DP_Temp12
    LDA.W Enemy.XPosition,X : CLC : ADC.B DP_Temp12 : STA.W Enemy.XPosition,X
    DEC.W Enemy.YPosition,X : DEC.W Enemy.YPosition,X
    LDA.L PirateNinja.speed,X : CLC : ADC.W #$0020 : STA.L PirateNinja.speed,X
    LDA.W Enemy.XPosition,X : CMP.W PirateNinja.postsMidpointXPosition,X : BPL .falling
    RTS

  .falling:
    LDA.W #Function_PirateNinja_SpinJumpRight_Falling : STA.W PirateNinja.function,X
    RTS


;;; $F8C5: Ninja space pirate function - spin jump right - falling ;;;
Function_PirateNinja_SpinJumpRight_Falling:
    LDA.L PirateNinja.speed,X : AND.W #$FF00 : XBA : STA.B DP_Temp12
    LDA.W Enemy.XPosition,X : CLC : ADC.B DP_Temp12 : STA.W Enemy.XPosition,X
    INC.W Enemy.YPosition,X : INC.W Enemy.YPosition,X
    LDA.L PirateNinja.speed,X : SEC : SBC.W #$0020 : STA.L PirateNinja.speed,X : BEQ .landing
    RTS

  .landing:
    LDA.W #RTS_B2804B : STA.W PirateNinja.function,X
    LDA.W #InstList_PirateNinja_Land_FacingRight_0 : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDA.W PirateNinja.rightPostXPosition,X : STA.W Enemy.XPosition,X
    JSR PirateNinja_SpawnLandingDustCloud
    RTS


;;; $F909: Ninja space pirate function - ready to divekick ;;;
Function_PirateNinja_ReadingToDivekick:
    JSR PirateNinja_FlinchTrigger
    BNE .return
    JSR PirateNinja_StandingKickTrigger
    BNE .return
    JSR PirateNinja_DivekickTrigger

  .return:
    RTS


;;; $F917: Ninja space pirate divekick trigger ;;;
PirateNinja_DivekickTrigger:
    LDX.W EnemyIndex ; >.<
    LDA.W PirateNinja.postsMidpointXPosition,X : SEC : SBC.W SamusXPosition : BPL +
    EOR.W #$FFFF : INC

+   SEC : SBC.W #$0020 : BPL .return

  .loopRNG:
    JSL GenerateRandomNumber
    AND.W #$0003 : BEQ .loopRNG
    STA.B DP_Temp12
    LDY.W #$0000
    LDA.W Enemy.XPosition,X : CMP.W PirateNinja.leftPostXPosition,X : BNE .keepLeft
    LDY.W #$0004

  .keepLeft:
    TYA : CLC : ADC.B DP_Temp12 : ASL : TAY
    LDA.W .leftPointers,Y : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X

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


;;; $F969: Instruction - set left divekick jump initial Y speed ;;;
Instruction_PirateNinja_SetLeftDivekickJumpInitialYSpeed:
    PHX : PHY
    LDA.W #$0600 : STA.L PirateNinja.speed,X
    LDA.W PirateNinja.rightPostXPosition,X : SEC : SBC.W PirateNinja.postsMidpointXPosition,X : LSR
    CLC : ADC.W PirateNinja.postsMidpointXPosition,X : STA.L ExtraEnemy7800+6,X
    PLY : PLX
    RTL


;;; $F985: Ninja space pirate function - divekick left - jump ;;;
Instruction_PirateNinja_DivekickLeft_Jump:
    LDA.L PirateNinja.speed,X : AND.W #$FF00 : XBA : STA.B DP_Temp12
    LDA.W Enemy.YPosition,X : SEC : SBC.B DP_Temp12 : STA.W Enemy.YPosition,X
    LDA.L PirateNinja.speed,X : SEC : SBC.W #$0040 : STA.L PirateNinja.speed,X : BMI .negativeSpeed
    RTS

  .negativeSpeed:
    LDA.W #Instruction_PirateNinja_DivekickLeft_Divekick : STA.W PirateNinja.function,X
    LDA.W #InstList_PirateNinja_DivekickLeft_Divekick : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDA.W #$0600 : STA.L PirateNinja.speed,X
    RTS


;;; $F9C1: Ninja space pirate function - divekick left - divekick ;;;
Instruction_PirateNinja_DivekickLeft_Divekick:
    LDA.W Enemy.XPosition,X : SEC : SBC.W #$0005 : STA.W Enemy.XPosition,X
    LDA.L PirateNinja.speed,X : AND.W #$FF00 : XBA : STA.B DP_Temp14
    LDA.L PirateNinja.speed,X : AND.W #$00FF : STA.B DP_Temp12
    JSL MoveEnemyDownBy_14_12
    BCS .collision
    LDA.L PirateNinja.speed,X : SEC : SBC.W #$0040 : STA.L PirateNinja.speed,X : BMI .collision
    BIT.W #$FF00 : BEQ .collision
    RTS

  .collision:
    LDA.W #Instruction_PirateNinja_DivekickLeft_WalkToLeftPost : STA.W PirateNinja.function,X
    LDA.W #InstList_PirateNinja_DivekickLeft_WalkToLeftPost_0 : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDA.L PirateNinja.spawnYPosition,X : STA.W Enemy.YPosition,X
    JSR PirateNinja_SpawnLandingDustCloud
    RTS


;;; $FA15: Ninja space pirate function - divekick left - walk to left post ;;;
Instruction_PirateNinja_DivekickLeft_WalkToLeftPost:
    LDA.W Enemy.XPosition,X : CLC : ADC.W #$FFFE : STA.W Enemy.XPosition,X
    CMP.W PirateNinja.leftPostXPosition,X : BPL .return
    LDA.W PirateNinja.leftPostXPosition,X : STA.W Enemy.XPosition,X
    LDA.W #InstList_PirateNinja_Land_FacingLeft_0 : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDA.W #RTS_B2804B : STA.W PirateNinja.function,X

  .return:
    RTS


;;; $FA3D: Instruction - set right divekick jump initial Y speed ;;;
Instruction_PirateNinja_SetRightDivekickJumpInitialYSpeed:
    PHX : PHY
    LDA.W #$0600 : STA.L PirateNinja.speed,X
    LDA.W PirateNinja.postsMidpointXPosition,X : SEC : SBC.W PirateNinja.leftPostXPosition,X : LSR
    CLC : ADC.W PirateNinja.leftPostXPosition,X : STA.L ExtraEnemy7800+6,X
    PLY : PLX
    RTL


;;; $FA59: Ninja space pirate function - divekick right - jump ;;;
Instruction_PirateNinja_DivekickRight_Jump:
    LDA.L PirateNinja.speed,X : AND.W #$FF00 : XBA : STA.B DP_Temp12
    LDA.W Enemy.YPosition,X : SEC : SBC.B DP_Temp12 : STA.W Enemy.YPosition,X
    LDA.L PirateNinja.speed,X : SEC : SBC.W #$0040 : STA.L PirateNinja.speed,X : BMI .negativeSpeed
    RTS

  .negativeSpeed:
    LDA.W #Instruction_PirateNinja_DivekickRight_Divekick : STA.W PirateNinja.function,X
    LDA.W #InstList_PirateNinja_DivekickRight_Divekick : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDA.W #$0600 : STA.L PirateNinja.speed,X
    RTS


;;; $FA95: Ninja space pirate function - divekick right - divekick ;;;
Instruction_PirateNinja_DivekickRight_Divekick:
    LDA.W Enemy.XPosition,X : CLC : ADC.W #$0005 : STA.W Enemy.XPosition,X
    LDA.L PirateNinja.speed,X : AND.W #$FF00 : XBA : STA.B DP_Temp14
    LDA.L PirateNinja.speed,X : AND.W #$00FF : STA.B DP_Temp12
    JSL MoveEnemyDownBy_14_12
    BCS .landing
    LDA.L PirateNinja.speed,X : SEC : SBC.W #$0040 : STA.L PirateNinja.speed,X : BMI .landing
    BIT.W #$FF00 : BEQ .landing
    RTS

  .landing:
    LDA.W #Instruction_PirateNinja_DivekickRight_WalkToRightPost : STA.W PirateNinja.function,X
    LDA.W #InstList_PirateNinja_DivekickRight_WalkToRightPost_0 : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDA.L PirateNinja.spawnYPosition,X : STA.W Enemy.YPosition,X
    JSR PirateNinja_SpawnLandingDustCloud
    RTS


;;; $FAE9: Ninja space pirate function - divekick right - walk to right post ;;;
Instruction_PirateNinja_DivekickRight_WalkToRightPost:
    LDA.W Enemy.XPosition,X : CLC : ADC.W #$0002 : STA.W Enemy.XPosition,X
    CMP.W PirateNinja.rightPostXPosition,X : BMI .return
    LDA.W PirateNinja.rightPostXPosition,X : STA.W Enemy.XPosition,X
    LDA.W #InstList_PirateNinja_Land_FacingRight_0 : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDA.W #RTS_B2804B : STA.W PirateNinja.function,X

  .return:
    RTS


;;; $FB11: Spawn ninja space pirate landing dust cloud ;;;
PirateNinja_SpawnLandingDustCloud:
    LDA.W Enemy.XPosition,X : SEC : SBC.W #$0008 : STA.B DP_Temp12
    LDA.W Enemy.YPosition,X : CLC : ADC.W #$001C : STA.B DP_Temp14
    LDA.W #$000A : STA.B DP_Temp16
    STZ.B DP_Temp18
    JSL Create_Sprite_Object
    LDA.W Enemy.XPosition,X : CLC : ADC.W #$0008 : STA.B DP_Temp12
    LDA.W Enemy.YPosition,X : CLC : ADC.W #$001C : STA.B DP_Temp14
    LDA.W #$000A : STA.B DP_Temp16
    STZ.B DP_Temp18
    JSL Create_Sprite_Object
    RTS


;;; $FB4C: Instruction list - flinch - facing left ;;;
InstList_PirateWalking_Flinch_FacingLeft:
    dw Instruction_PirateWalking_FunctionInY
    dw RTS_A0804B
    dw $0010,ExtendedSpritemaps_PirateWalking_23
    dw Instruction_Common_GotoY
    dw InstList_PirateWalking_WalkingLeft_0


;;; $FB58: Instruction list - flinch - facing right ;;;
InstList_PirateWalking_Flinch_FacingRight:
    dw Instruction_PirateWalking_FunctionInY
    dw RTS_A0804B
    dw $0010,ExtendedSpritemaps_PirateWalking_24
    dw Instruction_Common_GotoY
    dw InstList_PirateWalking_WalkingRight_0


;;; $FB64: Instruction list - walking left ;;;
InstList_PirateWalking_WalkingLeft_0:
    dw Instruction_PirateWalking_FunctionInY
    dw Function_PirateWalking_WalkingLeft

InstList_PirateWalking_WalkingLeft_1:
    dw $000A,ExtendedSpritemaps_PirateWalking_0
    dw $000A,ExtendedSpritemaps_PirateWalking_1
    dw $000A,ExtendedSpritemaps_PirateWalking_2
    dw $000A,ExtendedSpritemaps_PirateWalking_3
    dw $000A,ExtendedSpritemaps_PirateWalking_4
    dw $000A,ExtendedSpritemaps_PirateWalking_5
    dw $000A,ExtendedSpritemaps_PirateWalking_6
    dw $000A,ExtendedSpritemaps_PirateWalking_7
    dw Instruction_Common_GotoY
    dw InstList_PirateWalking_WalkingLeft_1


;;; $FB8C: Instruction list - fire lasers left ;;;
InstList_PirateWalking_FireLasersLeft:
    dw Instruction_PirateWalking_FunctionInY
    dw RTS_B2FE4A
    dw $0018,ExtendedSpritemaps_PirateWalking_10
    dw $0008,ExtendedSpritemaps_PirateWalking_11
    dw $0008,ExtendedSpritemaps_PirateWalking_12
    dw $0008,ExtendedSpritemaps_PirateWalking_13
    dw Instruction_PirateWalking_FireLaserLeftWithYOffsetInY,$0008
    dw $0008,ExtendedSpritemaps_PirateWalking_14
    dw Instruction_PirateWalking_FireLaserLeftWithYOffsetInY,$0002
    dw $0018,ExtendedSpritemaps_PirateWalking_15
    dw Instruction_PirateWalking_FireLaserLeftWithYOffsetInY,$FFF8
    dw $0008,ExtendedSpritemaps_PirateWalking_14
    dw $0008,ExtendedSpritemaps_PirateWalking_13
    dw $0008,ExtendedSpritemaps_PirateWalking_12
    dw $0008,ExtendedSpritemaps_PirateWalking_11
    dw Instruction_PirateWalking_ChooseAMovement


;;; $FBC6: Instruction list - look around - facing left ;;;
InstList_PirateWalking_LookingAround_FacingLeft:
    dw Instruction_PirateWalking_FunctionInY
    dw RTS_B2FE4A
    dw $0020,ExtendedSpritemaps_PirateWalking_1C
    dw $000A,ExtendedSpritemaps_PirateWalking_1D
    dw $0020,ExtendedSpritemaps_PirateWalking_1E
    dw $000A,ExtendedSpritemaps_PirateWalking_1D
    dw $0020,ExtendedSpritemaps_PirateWalking_1C
    dw $0008,ExtendedSpritemaps_PirateWalking_22
    dw Instruction_Common_GotoY
    dw InstList_PirateWalking_WalkingRight_0


;;; $FBE6: Instruction list - walking right ;;;
InstList_PirateWalking_WalkingRight_0:
    dw Instruction_PirateWalking_FunctionInY
    dw Function_PirateWalking_WalkingRight

InstList_PirateWalking_WalkingRight_1:
    dw $000A,ExtendedSpritemaps_PirateWalking_8
    dw $000A,ExtendedSpritemaps_PirateWalking_9
    dw $000A,ExtendedSpritemaps_PirateWalking_A
    dw $000A,ExtendedSpritemaps_PirateWalking_B
    dw $000A,ExtendedSpritemaps_PirateWalking_C
    dw $000A,ExtendedSpritemaps_PirateWalking_D
    dw $000A,ExtendedSpritemaps_PirateWalking_E
    dw $000A,ExtendedSpritemaps_PirateWalking_F
    dw Instruction_Common_GotoY
    dw InstList_PirateWalking_WalkingRight_1


;;; $FC0E: Instruction list - fire lasers right ;;;
InstList_PirateWalking_FireLasersRight:
    dw Instruction_PirateWalking_FunctionInY
    dw RTS_B2FE4A
    dw $0018,ExtendedSpritemaps_PirateWalking_16
    dw $0008,ExtendedSpritemaps_PirateWalking_17
    dw $0008,ExtendedSpritemaps_PirateWalking_18
    dw $0008,ExtendedSpritemaps_PirateWalking_19
    dw Instruction_PirateWalking_FireLaserRightWithYOffsetInY,$0008
    dw $0008,ExtendedSpritemaps_PirateWalking_1A
    dw Instruction_PirateWalking_FireLaserRightWithYOffsetInY,$0002
    dw $0018,ExtendedSpritemaps_PirateWalking_1B
    dw Instruction_PirateWalking_FireLaserRightWithYOffsetInY,$FFF8
    dw $0008,ExtendedSpritemaps_PirateWalking_1A
    dw $0008,ExtendedSpritemaps_PirateWalking_19
    dw $0008,ExtendedSpritemaps_PirateWalking_18
    dw $0008,ExtendedSpritemaps_PirateWalking_17
    dw Instruction_PirateWalking_ChooseAMovement


;;; $FC48: Instruction list - look around - facing right ;;;
InstList_PirateWalking_LookingAround_FacingRight:
    dw Instruction_PirateWalking_FunctionInY
    dw RTS_B2FE4A
    dw $0020,ExtendedSpritemaps_PirateWalking_1F
    dw $000A,ExtendedSpritemaps_PirateWalking_20
    dw $0020,ExtendedSpritemaps_PirateWalking_21
    dw $000A,ExtendedSpritemaps_PirateWalking_20
    dw $0020,ExtendedSpritemaps_PirateWalking_1F
    dw $0008,ExtendedSpritemaps_PirateWalking_22
    dw Instruction_Common_GotoY
    dw InstList_PirateWalking_WalkingLeft_0


;;; $FC68: Instruction - fire laser left with Y offset [[Y]] ;;;
Instruction_PirateWalking_FireLaserLeftWithYOffsetInY:
    PHX : PHY
    LDX.W EnemyIndex
    LDA.W Enemy.XPosition,X : SEC : SBC.W #$0018 : STA.B DP_Temp12
    LDA.W Enemy.YPosition,X : SEC : SBC.W $0000,Y : STA.B DP_Temp14
    LDA.W #$0000 : STA.B DP_Temp16
    LDY.W #EnemyProjectile_PirateMotherBrainLaser
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    PLY : PLX
    INY #2
    RTL


;;; $FC90: Instruction - fire laser right with Y offset [[Y]] ;;;
Instruction_PirateWalking_FireLaserRightWithYOffsetInY:
    PHX : PHY
    LDX.W EnemyIndex
    LDA.W Enemy.XPosition,X : CLC : ADC.W #$0018 : STA.B DP_Temp12
    LDA.W Enemy.YPosition,X : SEC : SBC.W $0000,Y : STA.B DP_Temp14
    LDA.W #$0001 : STA.B DP_Temp16
    LDY.W #EnemyProjectile_PirateMotherBrainLaser
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    PLY : PLX
    INY #2
    RTL


;;; $FCB8: Instruction - enemy function = [[Y]] ;;;
Instruction_PirateWalking_FunctionInY:
    PHY : PHX
    LDX.W EnemyIndex
    LDA.W $0000,Y : STA.W PirateWalking.function,X
    PLX : PLY
    INY #2
    RTL


;;; $FCC8: Instruction - choose a movement ;;;
Instruction_PirateWalking_ChooseAMovement:
    PHX
    LDX.W EnemyIndex
    LDA.W #$0010
    PHY
    JSL IsSamusWithingAPixelRowsOfEnemy
    PLY
    AND.W #$FFFF : BNE .verticalClose
    LDX.W EnemyIndex
    LDY.W #InstList_PirateWalking_WalkingRight_0
    LDA.W SamusXPosition : SEC : SBC.W Enemy.XPosition,X : BMI .returnWalking
    LDY.W #InstList_PirateWalking_WalkingLeft_0

  .returnWalking:
    PLX
    RTL

  .verticalClose:
    LDX.W EnemyIndex
    LDY.W #InstList_PirateWalking_FireLasersLeft
    LDA.W SamusXPosition : SEC : SBC.W Enemy.XPosition,X : BMI .returnLasers
    LDY.W #InstList_PirateWalking_FireLasersRight

  .returnLasers:
    PLX
    RTL


;;; $FD02: Initialisation AI - enemy $F653/$F693/$F6D3/$F713/$F753/$F793 (walking space pirates) ;;;
InitAI_PirateWalking:
    LDX.W EnemyIndex
    LDY.W #InstList_PirateWalking_WalkingLeft_0
    LDA.W Enemy.init0,X : BIT.W #$0001 : BEQ .keepLeft
    LDY.W #InstList_PirateWalking_WalkingRight_0

  .keepLeft:
    TYA : STA.W Enemy.instList,X
    LDA.W #RTS_B2804B : STA.W PirateWalking.function,X
    LDA.W Enemy.XPosition,X : CLC : ADC.W Enemy.init1,X : STA.W PirateWalking.rightPostXPosition,X
    LDA.W Enemy.XPosition,X : SEC : SBC.W Enemy.init1,X : STA.W PirateWalking.leftPostXPosition,X
    RTL


;;; $FD32: Main AI - enemy $F653/$F693/$F6D3/$F713/$F753/$F793 (walking space pirates) ;;;
MainAI_PirateWalking:
    LDX.W EnemyIndex
    JSR.W (PirateWalking.function,X)
    LDA.W Enemy.init0,X : BIT.W #$8000 : BEQ .return
    JSR PirateWalking_FlinchTrigger

  .return:
    RTL


;;; $FD44: Walking space pirate function - walking left ;;;
Function_PirateWalking_WalkingLeft:
    LDX.W EnemyIndex
    LDA.W #$0010
    JSL IsSamusWithingAPixelRowsOfEnemy
    BEQ .walk
    LDY.W #InstList_PirateWalking_FireLasersLeft
    LDA.W SamusXPosition : SEC : SBC.W Enemy.XPosition,X : BMI .keepLeft
    LDY.W #InstList_PirateWalking_FireLasersRight

  .keepLeft:
    TYA : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    RTS

  .walk:
    LDA.W #$0001 : STA.B DP_Temp14
    STZ.B DP_Temp12
    JSL MoveEnemyDownBy_14_12
    BCC .return
    LDA.W Enemy.XPosition,X : STA.L PirateWalking.backupXPosition,X
    CLC : ADC.W #$FFEF : STA.W Enemy.XPosition,X
    LDA.W #$0001 : STA.B DP_Temp14
    STZ.B DP_Temp12
    JSL MoveEnemyDownBy_14_12
    PHP
    LDA.L PirateWalking.backupXPosition,X : STA.W Enemy.XPosition,X
    PLP
    BCC .collision
    LDA.W #$0000 : STA.B DP_Temp12
    LDA.W #$FFF7 : STA.B DP_Temp14
    JSL CheckForHorizontalSolidBlockCollision
    LDA.W #$C7FF : STA.B DP_Temp12
    LDA.W #$FFFF : STA.B DP_Temp14
    JSL MoveEnemyRightBy_14_12_IgnoreSlopes
    BCS .collision
    LDA.W Enemy.XPosition,X : CMP.W PirateWalking.leftPostXPosition,X : BPL .return

  .collision:
    LDA.W #InstList_PirateWalking_LookingAround_FacingLeft : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X

  .return:
    RTS


;;; $FDCE: Walking space pirate function - walking right ;;;
Function_PirateWalking_WalkingRight:
    LDX.W EnemyIndex ; >.<
    LDA.W #$0010
    JSL IsSamusWithingAPixelRowsOfEnemy
    BEQ .walk
    LDY.W #InstList_PirateWalking_FireLasersLeft
    LDA.W SamusXPosition : SEC : SBC.W Enemy.XPosition,X : BMI .keepLeft
    LDY.W #InstList_PirateWalking_FireLasersRight

  .keepLeft:
    TYA : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    RTS

  .walk:
    LDA.W #$0001 : STA.B DP_Temp14
    STZ.B DP_Temp12
    JSL MoveEnemyDownBy_14_12
    BCC .return
    LDA.W Enemy.XPosition,X : STA.L PirateWalking.backupXPosition,X
    CLC : ADC.W #$0010 : STA.W Enemy.XPosition,X
    LDA.W #$0001 : STA.B DP_Temp14
    STZ.B DP_Temp12
    JSL MoveEnemyDownBy_14_12
    PHP
    LDA.L PirateWalking.backupXPosition,X : STA.W Enemy.XPosition,X
    PLP
    BCC .collision
    LDA.W #$3800 : STA.B DP_Temp12
    LDA.W #$0000 : STA.B DP_Temp14
    JSL MoveEnemyRightBy_14_12_IgnoreSlopes
    BCS .collision
    LDA.W Enemy.XPosition,X : CMP.W PirateWalking.rightPostXPosition,X : BMI .return

  .collision:
    LDA.W #InstList_PirateWalking_LookingAround_FacingRight : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X

  .return:
    RTS


;;; $FE4A: RTS ;;;
RTS_B2FE4A:
    RTS


;;; $FE4B: Walking space pirate flinch trigger ;;;
PirateWalking_FlinchTrigger:
; Return value is ignored by caller. Probably left over from PirateNinja_FlinchTrigger copy+paste
    PHX
    LDX.W EnemyIndex
    LDY.W #$0008

  .loopProjectiles:
    LDA.W SamusProjectile_Types,Y : BNE .checkProjectile
    DEY #2 : BPL .loopProjectiles
    BRA .returnNoFlinch

  .checkProjectile:
    LDA.W SamusProjectile_XPositions,Y : SEC : SBC.W Enemy.XPosition,X : BPL +
    EOR.W #$FFFF : INC

+   SEC : SBC.W #$0020 : BPL .returnNoFlinch
    LDA.W SamusProjectile_YPositions,Y : SEC : SBC.W Enemy.YPosition,X : BPL +
    EOR.W #$FFFF : INC

+   SEC : SBC.W #$0020 : BPL .returnNoFlinch
    LDA.W Enemy.XPosition,X : SEC : SBC.W SamusXPosition : STA.B DP_Temp12
    LDY.W #InstList_PirateWalking_Flinch_FacingLeft
    LDA.B DP_Temp12 : BPL .keepLeft
    LDY.W #InstList_PirateWalking_Flinch_FacingRight

  .keepLeft:
    TYA : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    PLX
    LDA.W #$0001
    RTS

  .returnNoFlinch:
    PLX
    LDA.W #$0000
    RTS


Freespace_BankB2_FEAA:
; $156 bytes
