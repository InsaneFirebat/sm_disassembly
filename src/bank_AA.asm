
org $AA8000


; Common to all enemy code banks

;;; $8000: Grapple AI - no interaction. Also unfreezes enemies(!) ;;;
CommonAA_GrappleAI_NoInteraction:
; Used by skultera, Draygon body, fire arc, Phantoon, etecoon, dachora and WS ghost
    JSL GrappleAI_SwitchEnemyAIToMainAI
    RTL


;;; $8005: Grapple AI - Samus latches on ;;;
CommonAA_GrappleAI_SamusLatchesOn:
; Used by gripper and Crocomire
    JSL GrappleAI_SamusLatchesOnWithGrapple
    RTL


;;; $800A: Grapple AI - kill enemy ;;;
CommonAA_GrappleAI_KillEnemy:
; Common
    JSL GrappleAI_EnemyGrappleDeath
    RTL


;;; $800F: Grapple AI - cancel grapple beam ;;;
CommonAA_GrappleAI_CancelGrappleBeam:
; Common
    JSL GrappleAI_SwitchToFrozenAI
    RTL


;;; $8014: Grapple AI - Samus latches on - no invincibility ;;;
CommonAA_GrappleAI_SamusLatchesOn_NoInvincibility:
; Used by powamp
    JSL GrappleAI_SamusLatchesOnWithGrapple_NoInvincibility
    RTL


;;; $8019: Unused. Grapple AI - Samus latches on - paralyse enemy ;;;
UNUSED_CommonAA_GrappleAI_SamusLatchesOn_ParalyzeEnemy_AA8019:
    JSL GrappleAI_SamusLatchesOnWithGrapple_ParalyzeEnemy
    RTL


;;; $801E: Grapple AI - hurt Samus ;;;
CommonAA_GrappleAI_HurtSamus:
; Used by WS spark
; Hurt reaction happens in $9B:B932
    JSL GrappleAI_SwitchToFrozenAI_duplicate
    RTL


;;; $8023: Normal enemy touch AI ;;;
CommonAA_NormalEnemyTouchAI:
    JSL NormalEnemyTouchAI
    RTL


;;; $8028: Normal touch AI - no death check ;;;
CommonAA_NormalTouchAI_NoDeathCheck:
    JSL NormalEnemyTouchAI_NoDeathCheck_External
    RTL


;;; $802D: Normal enemy shot AI ;;;
CommonAA_NormalEnemyShotAI:
    JSL NormalEnemyShotAI
    RTL


;;; $8032: Normal enemy shot AI - no death check, no enemy shot graphic ;;;
CommonAA_NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic:
    JSL NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External
    RTL


;;; $8037: Normal enemy power bomb AI ;;;
CommonAA_NormalEnemyPowerBombAI:
    JSL NormalEnemyPowerBombAI
    RTL


;;; $803C: Normal enemy power bomb AI - no death check ;;;
CommonAA_NormalEnemyPowerBombAI_NoDeathCheck:
; Kraid's power bomb AI
    JSL NormalEnemyPowerBombAI_NoDeathCheck_External
    RTL


;;; $8041: Normal enemy frozen AI ;;;
CommonAA_NormalEnemyFrozenAI:
    JSL NormalEnemyFrozenAI
    RTL


;;; $8046: Creates a dud shot ;;;
CommonAA_CreateADudShot:
    JSL CreateADudShot
    RTL


;;; $804B: RTS ;;;
RTS_AA804B:
    RTS


;;; $804C: RTL ;;;
RTL_AA804C:
    RTL


;;; $804D: Spritemap - nothing ;;;
Spritemap_CommonAA_Nothing:
    dw $0000


;;; $804F: Extended spritemap - nothing ;;;
ExtendedSpritemap_CommonAA_Nothing:
    dw $0001
    dw $0000,$0000
    dw Spritemap_CommonAA_Nothing
    dw Hitbox_CommonAA_Nothing


;;; $8059: Hitbox - nothing ;;;
Hitbox_CommonAA_Nothing:
; [n entries] [[left offset] [top offset] [right offset] [bottom offset] [p touch] [p shot]]...
    dw $0001
    dw $0000,$0000,$0000,$0000
    dw CommonAA_NormalEnemyTouchAI
    dw CommonAA_NormalEnemyShotAI


;;; $8067: Instruction list - delete enemy ;;;
InstList_CommonAA_DeleteEnemy:
    dw Instruction_CommonAA_DeleteEnemy


;;; $8069: Two NOPs ;;;
NOPNOP_AA8069:
; Used as palette by respawning enemy placeholder and Draygon's eye o_O
    NOP #2


;;; $806B: Instruction - Enemy.var5 = [[Y]] ;;;
Instruction_CommonAA_Enemy0FB2_InY:
; Used only by torizos (for enemy movement function) and escape etecoon (for enemy function)
    LDA.W $0000,Y : STA.W Enemy.var5,X
    INY #2
    RTL


;;; $8074: Instruction - Enemy.var5 = RTS ;;;
Instruction_CommonAA_SetEnemy0FB2ToRTS:
    LDA.W #RTS_AA807B : STA.W Enemy.var5,X
    RTL


RTS_AA807B:
    RTS


;;; $807C: Instruction - delete enemy ;;;
Instruction_CommonAA_DeleteEnemy:
    LDA.W Enemy.properties,X : ORA.W #$0200 : STA.W Enemy.properties,X
    PLA
    PEA.W ProcessEnemyInstructions_return-1
    RTL


;;; $808A: Instruction - call function [[Y]] ;;;
Instruction_CommonAA_CallFunctionInY:
    LDA.W $0000,Y : STA.B DP_Temp12
    PHY : PHX
    PEA .manualReturn-1
    JMP.W (DP_Temp12)

  .manualReturn:
    PLX : PLY
    INY #2
    RTL


;;; $809C: Instruction - call function [[Y]] with A = [[Y] + 2] ;;;
Instruction_CommonAA_CallFunctionInY_WithA:
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
UNUSED_Instruction_CommonAA_CallExternalFunctionInY_AA80B5:
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
UNUSED_Inst_CommonAA_CallExternalFunctionInY_WithA_AA80CE:
    LDA.W $0000,Y : STA.B DP_Temp12
    LDA.W $0001,Y : STA.B DP_Temp13
    LDA.W $0003,Y
    PHX : PHY
    JSL .externalFunction
    PLY : PLX
    TYA : CLC : ADC.W #$0005 : TAY
    RTL

  .externalFunction:
    JML.W [DP_Temp12]
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $80ED: Instruction - go to [[Y]] ;;;
Instruction_CommonAA_GotoY:
    LDA.W $0000,Y : TAY
    RTL


;;; $80F2: Instruction - go to [[Y]] + ±[[Y]] ;;;
Instruction_CommonAA_GotoY_PlusY:
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
Instruction_CommonAA_DecrementTimer_GotoYIfNonZero:
    DEC.W Enemy.loopCounter,X : BNE Instruction_CommonAA_GotoY
    INY #2
    RTL


;;; $8110: Instruction - decrement timer and go to [[Y]] if non-zero ;;;
Instruction_CommonAA_DecrementTimer_GotoYIfNonZero_duplicate:
    DEC.W Enemy.loopCounter,X : BNE Instruction_CommonAA_GotoY
    INY #2
    RTL


;;; $8118: Instruction - decrement timer and go to [Y] + ±[[Y]] if non-zero ;;;
Instruction_CommonAA_DecrementTimer_GotoY_PlusY_IfNonZero:
    SEP #$20
    DEC.W Enemy.loopCounter,X
    REP #$20
    BNE Instruction_CommonAA_GotoY_PlusY
    INY
    RTL


;;; $8123: Instruction - timer = [[Y]] ;;;
Instruction_CommonAA_TimerInY:
    LDA.W $0000,Y : STA.W Enemy.loopCounter,X
    INY #2
    RTL


;;; $812C: Instruction - skip next instruction ;;;
Instruction_CommonAA_SkipNextInstruction:
    INY #2
    RTL


;;; $812F: Instruction - sleep ;;;
Instruction_CommonAA_Sleep:
    DEY #2
    TYA : STA.W Enemy.instList,X
    PLA
    PEA.W ProcessEnemyInstructions_return-1
    RTL


;;; $813A: Instruction - wait [[Y]] frames ;;;
Instruction_CommonAA_WaitYFrames:
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
Instruction_CommonAA_TransferYBytesInYToVRAM:
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
Instruction_CommonAA_EnableOffScreenProcessing:
    LDA.W Enemy.properties,X : ORA.W #$0800 : STA.W Enemy.properties,X
    RTL


;;; $817D: Instruction - disable off-screen processing ;;;
Instruction_CommonAA_DisableOffScreenProcessing:
    LDA.W Enemy.properties,X : AND.W #$F7FF : STA.W Enemy.properties,X
    RTL


;;; $8187: Common enemy speeds - linearly increasing ;;;
CommonAAEnemySpeeds_LinearlyIncreasing:
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
CommonAAEnemySpeeds_QuadraticallyIncreasing:
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


;;; $8687: Torizo palettes ;;;
Palette_Torizo_OrbProjectile:
; Orb projectile
    dw $3800,$03FF,$033B,$0216,$0113,$6B1E,$4A16,$3591 ; Sprite palette 3
    dw $20E9,$1580,$1580,$1580,$1580,$1580,$1580,$1580

Palette_Torizo_BombTorizoStatue:
; Bomb Torizo statue
    dw $3800,$02DF,$01D7,$00AC,$5A73,$41AD,$2D08,$1863 ; Sprite palette 7
    dw $1486,$0145,$0145,$0145,$7FFF,$0145,$0145,$0000

; Initial Bomb Torizo
Palette_Torizo_InitialBombTorizo_SpritePalette1:
    dw $3800,$679F,$5299,$252E,$14AA,$5EFC,$4657,$35B2
    dw $2D70,$5B7F,$3DF8,$2D0E,$5F5F,$5E1A,$5D35,$0C63

Palette_Torizo_InitialBombTorizo_SpritePalette2:
    dw $3800,$4ABA,$35B2,$0847,$0003,$4215,$2970,$18CB
    dw $1089,$463A,$28B3,$1809,$6F7F,$51FD,$4113,$0C63

; Normal Torizo (Bomb Torizo after coming to life, Golden Torizo transitions to this from damage, the hatched Golden Torizo egg)
Palette_Torizo_Normal_SpritePalette1:
    dw $3800,$56BA,$41B2,$1447,$0403,$4E15,$3570,$24CB
    dw $1868,$6F7F,$51F8,$410E,$031F,$01DA,$00F5,$0C63

Palette_Torizo_Normal_SpritePalette2:
    dw $3800,$4215,$2D0D,$0002,$0000,$3970,$20CB,$0C26
    dw $0403,$463A,$28B3,$1809,$6F7F,$51FD,$4113,$0C63

; Initial Golden Torizo
Palette_Torizo_InitialGoldenTorizo_SpritePalette1:
    dw $3800,$6AB5,$49B0,$1C45,$0C01,$5613,$416D,$2CC9
    dw $2066,$5714,$31CC,$14E3,$5630,$3569,$1883,$0C66

Palette_Torizo_InitialGoldenTorizo_SpritePalette2:
    dw $3800,$5610,$350B,$0800,$0000,$416E,$2CC8,$1823
    dw $0C01,$6A31,$4CAA,$2406,$7F7B,$75F4,$4D10,$0C63

; Golden Torizo (after coming to life)
Palette_Torizo_GoldenTorizo_SpritePalette1:
    dw $3800,$4BBE,$06B9,$00A8,$0000,$173A,$0276,$01F2
    dw $014D,$73E0,$4F20,$2A20,$7FE0,$5AA0,$5920,$0043

Palette_Torizo_GoldenTorizo_SpritePalette2:
    dw $3800,$3719,$0214,$0003,$0000,$0295,$01D1,$014D
    dw $00A8,$4B40,$25E0,$00E0,$6B40,$4600,$4480,$0000


;;; $87C7: Torizo hitbox - blank ;;;
Hitboxes_Torizo_Blank:
    dw $0000


;;; $87C9: Torizo spritemap - blank ;;;
Spritemap_Torizo_Blank:
    dw $0001
    %spritemapEntry(0, $100, $00, 0, 1, 0, 1, $00)


;;; $87D0: Torizo extended spritemap - blank ;;;
ExtendedSpritemap_Torizo_Blank:
    dw $0001
    dw $0000,$0000
    dw Spritemap_Torizo_Blank
    dw Hitboxes_Torizo_Blank


;;; $87DA: Torizo hitboxes ;;;
if !FEATURE_KEEP_UNREFERENCED
UNUSED_Hitboxes_Torizo_AA87DA:
    dw $0001
    dw $FFF5,$FFD6,$000A,$0003
    dw EnemyTouch_Torizo
    dw EnemyShot_Torizo_Normal
endif ; !FEATURE_KEEP_UNREFERENCED

Hitboxes_Torizo_StandUp_SitDown_FacingLeft_0:
    dw $0001
    dw $FFF0,$FFE5,$0010,$001B
    dw EnemyTouch_Torizo
    dw EnemyShot_Torizo_StandUp_SitDown

Hitboxes_Torizo_StandUp_SitDown_FacingLeft_1:
    dw $0001
    dw $FFF2,$FFE5,$000D,$001B
    dw EnemyTouch_Torizo
    dw EnemyShot_Torizo_StandUp_SitDown

Hitboxes_Torizo_StandUp_SitDown_FacingLeft_2:
    dw $0001
    dw $FFF3,$FFDE,$0009,$0021
    dw EnemyTouch_Torizo
    dw EnemyShot_Torizo_StandUp_SitDown

Hitboxes_Torizo_StandUp_SitDown_FacingLeft_3:
    dw $0001
    dw $FFF5,$FFDA,$000B,$0027
    dw EnemyTouch_Torizo
    dw EnemyShot_Torizo_StandUp_SitDown

Hitboxes_Torizo_StandUp_SitDown_FacingLeft_4:
    dw $0001
    dw $FFF1,$FFD4,$0008,$002F
    dw EnemyTouch_Torizo
    dw EnemyShot_Torizo_StandUp_SitDown

Hitboxes_Torizo_StandUp_SitDown_FacingLeft_5:
    dw $0001
    dw $FFEE,$FFD5,$0003,$0018
    dw EnemyTouch_Torizo
    dw EnemyShot_Torizo_StandUp_SitDown

Hitboxes_Torizo_StandUp_SitDown_FacingLeft_6:
    dw $0001
    dw $FFEF,$FFD6,$0005,$000F
    dw EnemyTouch_Torizo
    dw EnemyShot_Torizo_StandUp_SitDown

Hitboxes_Torizo_StandUp_SitDown_FacingLeft_7:
    dw $0001
    dw $FFF1,$FFD9,$0007,$0015
    dw EnemyTouch_Torizo
    dw EnemyShot_Torizo_Normal

Hitboxes_Torizo_StandUp_SitDown_FacingLeft_8:
    dw $0000

Hitboxes_Torizo_StandUp_SitDown_FacingLeft_9:
    dw $0000

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Hitboxes_Torizo_StandUp_SitDown_FacingLeft_AA885C:
    dw $0001
    dw $FFF0,$0027,$FFFF,$0037
    dw EnemyTouch_Torizo
    dw RTL_AAC9C1
endif ; !FEATURE_KEEP_UNREFERENCED

Hitboxes_Torizo_StandUp_SitDown_FacingLeft_A:
    dw $0000

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Hitboxes_Torizo_StandUp_SitDown_FacingLeft_AA886C:
    dw $0001
    dw $FFE0,$0029,$FFF3,$0040
    dw EnemyTouch_Torizo
    dw RTL_AAC9C1
endif ; !FEATURE_KEEP_UNREFERENCED

Hitboxes_Torizo_StandUp_SitDown_FacingLeft_B:
    dw $0000

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Hitboxes_Torizo_StandUp_SitDown_FacingLeft_AA887C:
    dw $0001
    dw $FFD8,$001C,$FFEC,$0030
    dw EnemyTouch_Torizo
    dw RTL_AAC9C1
endif ; !FEATURE_KEEP_UNREFERENCED

Hitboxes_Torizo_StandUp_SitDown_FacingLeft_C:
    dw $0000

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Hitboxes_Torizo_StandUp_SitDown_FacingLeft_AA888C:
    dw $0001
    dw $FFC8,$0009,$FFEB,$0014
    dw EnemyTouch_Torizo
    dw RTL_AAC9C1
endif ; !FEATURE_KEEP_UNREFERENCED

Hitboxes_Torizo_StandUp_SitDown_FacingLeft_D:
    dw $0000

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Hitboxes_Torizo_StandUp_SitDown_FacingLeft_AA889C:
    dw $0001
    dw $FFD3,$FFF3,$FFE5,$0003
    dw EnemyTouch_Torizo
    dw RTL_AAC9C1
endif ; !FEATURE_KEEP_UNREFERENCED

Hitboxes_Torizo_StandUp_SitDown_FacingLeft_E:
    dw $0000

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Hitboxes_Torizo_StandUp_SitDown_FacingLeft_AA88AC:
    dw $0001
    dw $FFE3,$FFDB,$FFF0,$FFF1
    dw EnemyTouch_Torizo
    dw RTL_AAC9C1
endif ; !FEATURE_KEEP_UNREFERENCED

Hitboxes_Torizo_StandUp_SitDown_FacingLeft_F:
    dw $0000

Hitboxes_Torizo_StandUp_SitDown_FacingLeft_10:
    dw $0000

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Hitboxes_Torizo_StandUp_SitDown_FacingLeft_AA88BE:
    dw $0001
    dw $FFEF,$0028,$0000,$0039
    dw EnemyTouch_Torizo
    dw RTL_AAC9C1
endif ; !FEATURE_KEEP_UNREFERENCED

Hitboxes_Torizo_StandUp_SitDown_FacingLeft_11:
    dw $0000

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Hitboxes_Torizo_StandUp_SitDown_FacingLeft_AA88CE:
    dw $0001
    dw $FFE6,$0021,$FFF4,$0032
    dw EnemyTouch_Torizo
    dw RTL_AAC9C1
endif ; !FEATURE_KEEP_UNREFERENCED

Hitboxes_Torizo_StandUp_SitDown_FacingLeft_12:
    dw $0000

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Hitboxes_Torizo_StandUp_SitDown_FacingLeft_AA88DE:
    dw $0001
    dw $FFDD,$0018,$FFEA,$0025
    dw EnemyTouch_Torizo
    dw RTL_AAC9C1
endif ; !FEATURE_KEEP_UNREFERENCED

Hitboxes_Torizo_StandUp_SitDown_FacingLeft_13:
    dw $0000

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Hitboxes_Torizo_StandUp_SitDown_FacingLeft_AA88EE:
    dw $0001
    dw $FFCA,$0008,$FFE9,$0012
    dw EnemyTouch_Torizo
    dw RTL_AAC9C1
endif ; !FEATURE_KEEP_UNREFERENCED

Hitboxes_Torizo_StandUp_SitDown_FacingLeft_14:
    dw $0000

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Hitboxes_Torizo_StandUp_SitDown_FacingLeft_AA88FE:
    dw $0001
    dw $FFD3,$FFF3,$FFE3,$0000
    dw EnemyTouch_Torizo
    dw RTL_AAC9C1
endif ; !FEATURE_KEEP_UNREFERENCED

Hitboxes_Torizo_StandUp_SitDown_FacingLeft_15:
    dw $0000

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Hitboxes_Torizo_StandUp_SitDown_FacingLeft_AA890E:
    dw $0001
    dw $FFE4,$FFDA,$FFEF,$FFEE
    dw EnemyTouch_Torizo
    dw RTL_AAC9C1
endif ; !FEATURE_KEEP_UNREFERENCED

Hitboxes_Torizo_StandUp_SitDown_FacingLeft_16:
    dw $0001
    dw $FFEE,$FFDA,$0007,$0009
    dw EnemyTouch_Torizo
    dw EnemyShot_Torizo_Normal

Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17:
    dw $0001
    dw $FFEE,$FFDB,$0007,$0012
    dw EnemyTouch_Torizo
    dw EnemyShot_Torizo_Normal

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Hitboxes_Torizo_StandUp_SitDown_FacingLeft_AA8938:
    dw $0001
    dw $FFF5,$FFD6,$000A,$0007
    dw EnemyTouch_Torizo
    dw EnemyShot_Torizo_Normal
endif ; !FEATURE_KEEP_UNREFERENCED

Hitboxes_Torizo_StandUp_SitDown_FacingRight_0:
    dw $0001
    dw $FFF1,$FFE5,$000D,$001B
    dw EnemyTouch_Torizo
    dw EnemyShot_Torizo_StandUp_SitDown

Hitboxes_Torizo_StandUp_SitDown_FacingRight_1:
    dw $0001
    dw $FFF3,$FFE5,$000D,$001B
    dw EnemyTouch_Torizo
    dw EnemyShot_Torizo_StandUp_SitDown

Hitboxes_Torizo_StandUp_SitDown_FacingRight_2:
    dw $0001
    dw $FFF2,$FFE0,$000D,$0021
    dw EnemyTouch_Torizo
    dw EnemyShot_Torizo_StandUp_SitDown

Hitboxes_Torizo_StandUp_SitDown_FacingRight_3:
    dw $0001
    dw $FFF2,$FFDD,$000B,$0027
    dw EnemyTouch_Torizo
    dw EnemyShot_Torizo_StandUp_SitDown

Hitboxes_Torizo_StandUp_SitDown_FacingRight_4:
    dw $0001
    dw $FFFA,$FFD6,$000D,$002F
    dw EnemyTouch_Torizo
    dw EnemyShot_Torizo_StandUp_SitDown

Hitboxes_Torizo_StandUp_SitDown_FacingRight_5:
    dw $0001
    dw $FFF9,$FFD7,$000B,$002F
    dw EnemyTouch_Torizo
    dw EnemyShot_Torizo_StandUp_SitDown

Hitboxes_Torizo_StandUp_SitDown_FacingRight_6:
    dw $0001
    dw $FFF8,$FFD7,$0016,$002F
    dw EnemyTouch_Torizo
    dw EnemyShot_Torizo_StandUp_SitDown

Hitboxes_Torizo_StandUp_SitDown_FacingRight_7:
    dw $0001
    dw $FFF6,$FFDA,$000D,$0017
    dw EnemyTouch_Torizo
    dw EnemyShot_Torizo_Normal

Hitboxes_Torizo_StandUp_SitDown_FacingRight_8:
    dw $0000

Hitboxes_Torizo_StandUp_SitDown_FacingRight_9:
    dw $0000

UNSUED_Hitboxes_Torizo_StandUp_SitDown_FacingRight_AA89BA:
    dw $0001
    dw $0000,$002B,$0016,$0040
    dw EnemyTouch_Torizo
    dw RTL_AAC9C1

Hitboxes_Torizo_StandUp_SitDown_FacingRight_A:
    dw $0000

UNSUED_Hitboxes_Torizo_StandUp_SitDown_FacingRight_AA89CA:
    dw $0001
    dw $000A,$0026,$001F,$003C
    dw EnemyTouch_Torizo
    dw RTL_AAC9C1

Hitboxes_Torizo_StandUp_SitDown_FacingRight_B:
    dw $0000

UNSUED_Hitboxes_Torizo_StandUp_SitDown_FacingRight_AA89DA:
    dw $0001
    dw $0014,$0018,$0022,$0025
    dw EnemyTouch_Torizo
    dw RTL_AAC9C1

Hitboxes_Torizo_StandUp_SitDown_FacingRight_C:
    dw $0000

UNSUED_Hitboxes_Torizo_StandUp_SitDown_FacingRight_AA89EA:
    dw $0001
    dw $0015,$0008,$003B,$0014
    dw EnemyTouch_Torizo
    dw RTL_AAC9C1

Hitboxes_Torizo_StandUp_SitDown_FacingRight_D:
    dw $0000

UNSUED_Hitboxes_Torizo_StandUp_SitDown_FacingRight_AA89FA:
    dw $0001
    dw $0017,$FFF9,$002D,$0004
    dw EnemyTouch_Torizo
    dw RTL_AAC9C1

Hitboxes_Torizo_StandUp_SitDown_FacingRight_E:
    dw $0000

UNSUED_Hitboxes_Torizo_StandUp_SitDown_FacingRight_AA8A0A:
    dw $0001
    dw $000F,$FFDB,$001C,$FFED
    dw EnemyTouch_Torizo
    dw RTL_AAC9C1

Hitboxes_Torizo_StandUp_SitDown_FacingRight_F:
    dw $0000

Hitboxes_Torizo_StandUp_SitDown_FacingRight_10:
    dw $0000

UNSUED_Hitboxes_Torizo_StandUp_SitDown_FacingRight_AA8A1C:
    dw $0001
    dw $FFFF,$0027,$000F,$003B
    dw EnemyTouch_Torizo
    dw RTL_AAC9C1

Hitboxes_Torizo_StandUp_SitDown_FacingRight_11:
    dw $0000

UNSUED_Hitboxes_Torizo_StandUp_SitDown_FacingRight_AA8A2C:
    dw $0001
    dw $0009,$0023,$001A,$0034
    dw EnemyTouch_Torizo
    dw RTL_AAC9C1

Hitboxes_Torizo_StandUp_SitDown_FacingRight_12:
    dw $0000

UNSUED_Hitboxes_Torizo_StandUp_SitDown_FacingRight_AA8A3C:
    dw $0001
    dw $0016,$0018,$0023,$0024
    dw EnemyTouch_Torizo
    dw RTL_AAC9C1

Hitboxes_Torizo_StandUp_SitDown_FacingRight_13:
    dw $0000

UNSUED_Hitboxes_Torizo_StandUp_SitDown_FacingRight_AA8A4C:
    dw $0001
    dw $0016,$0007,$0034,$0012
    dw EnemyTouch_Torizo
    dw RTL_AAC9C1

Hitboxes_Torizo_StandUp_SitDown_FacingRight_14:
    dw $0000

UNSUED_Hitboxes_Torizo_StandUp_SitDown_FacingRight_AA8A5C:
    dw $0001
    dw $0018,$FFF6,$002C,$0005
    dw EnemyTouch_Torizo
    dw RTL_AAC9C1

Hitboxes_Torizo_StandUp_SitDown_FacingRight_15:
    dw $0000

UNSUED_Hitboxes_Torizo_StandUp_SitDown_FacingRight_AA8A6C:
    dw $0001
    dw $000F,$FFDA,$001C,$FFF1
    dw EnemyTouch_Torizo
    dw RTL_AAC9C1

Hitboxes_Torizo_StandUp_SitDown_FacingRight_16:
    dw $0001
    dw $FFF8,$FFDB,$000F,$000E
    dw EnemyTouch_Torizo
    dw EnemyShot_Torizo_Normal

Hitboxes_Torizo_StandUp_SitDown_FacingRight_17:
    dw $0001
    dw $FFF7,$FFD8,$0010,$0019
    dw EnemyTouch_Torizo
    dw EnemyShot_Torizo_Normal


;;; $8A96: Torizo spritemaps ;;;
Spritemaps_Torizo_0:
    dw $0004
    %spritemapEntry(0, $0C, $F4, 0, 0, 2, 1, $1CB)
    %spritemapEntry(0, $04, $F4, 0, 0, 2, 1, $1CA)
    %spritemapEntry(1, $1F4, $F4, 0, 0, 2, 1, $1C8)
    %spritemapEntry(1, $1F4, $04, 0, 0, 2, 1, $1E8)

Spritemaps_Torizo_1:
    dw $0004
    %spritemapEntry(0, $1F8, $04, 0, 0, 2, 1, $1DB)
    %spritemapEntry(0, $1F0, $04, 0, 0, 2, 1, $1DA)
    %spritemapEntry(1, $00, $F4, 0, 0, 2, 1, $1C6)
    %spritemapEntry(1, $1F0, $F4, 0, 0, 2, 1, $1C4)

Spritemaps_Torizo_2:
    dw $0003
    %spritemapEntry(1, $1E8, $FC, 0, 0, 2, 1, $1C0)
    %spritemapEntry(1, $00, $F4, 0, 0, 2, 1, $1C6)
    %spritemapEntry(1, $1F0, $F4, 0, 0, 2, 1, $1C4)

Spritemaps_Torizo_3:
    dw $0003
    %spritemapEntry(1, $1E8, $FC, 0, 0, 2, 1, $1C2)
    %spritemapEntry(1, $00, $F4, 0, 0, 2, 1, $1C6)
    %spritemapEntry(1, $1F0, $F4, 0, 0, 2, 1, $1C4)

Spritemaps_Torizo_4:
    dw $0003
    %spritemapEntry(1, $1E8, $FC, 0, 0, 2, 1, $1E0)
    %spritemapEntry(1, $00, $F4, 0, 0, 2, 1, $1C6)
    %spritemapEntry(1, $1F0, $F4, 0, 0, 2, 1, $1C4)

Spritemaps_Torizo_5:
    dw $0008
    %spritemapEntry(0, $1E0, $F4, 0, 0, 2, 1, $172)
    %spritemapEntry(0, $1E8, $F4, 0, 0, 2, 1, $171)
    %spritemapEntry(0, $1F0, $0C, 0, 0, 2, 1, $1F2)
    %spritemapEntry(0, $1F0, $04, 0, 0, 2, 1, $1F3)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 1, $1E3)
    %spritemapEntry(0, $1E8, $FC, 0, 0, 2, 1, $1E2)
    %spritemapEntry(1, $00, $F4, 0, 0, 2, 1, $1C6)
    %spritemapEntry(1, $1F0, $F4, 0, 0, 2, 1, $1C4)

Spritemaps_Torizo_6:
    dw $0013
    %spritemapEntry(0, $1F5, $18, 0, 0, 2, 1, $14C)
    %spritemapEntry(0, $03, $18, 0, 1, 2, 1, $14C)
    %spritemapEntry(0, $1FC, $00, 0, 1, 2, 1, $15F)
    %spritemapEntry(0, $1F8, $D8, 0, 0, 2, 1, $19F)
    %spritemapEntry(0, $1F5, $28, 0, 0, 2, 1, $1DF)
    %spritemapEntry(0, $1F5, $20, 0, 0, 2, 1, $1CF)
    %spritemapEntry(0, $1F5, $10, 0, 0, 2, 1, $19E)
    %spritemapEntry(0, $1F6, $08, 0, 0, 2, 1, $1DE)
    %spritemapEntry(0, $1F7, $00, 0, 0, 2, 1, $1CE)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 2, 1, $1E6)
    %spritemapEntry(1, $1F0, $E0, 0, 0, 2, 1, $1E4)
    %spritemapEntry(0, $00, $D8, 0, 1, 2, 1, $19F)
    %spritemapEntry(0, $03, $28, 0, 1, 2, 1, $1DF)
    %spritemapEntry(0, $03, $20, 0, 1, 2, 1, $1CF)
    %spritemapEntry(0, $03, $10, 0, 1, 2, 1, $19E)
    %spritemapEntry(0, $02, $08, 0, 1, 2, 1, $1DE)
    %spritemapEntry(0, $01, $00, 0, 1, 2, 1, $1CE)
    %spritemapEntry(1, $00, $F0, 0, 1, 2, 1, $1E6)
    %spritemapEntry(1, $00, $E0, 0, 1, 2, 1, $1E4)

Spritemaps_Torizo_7:
    dw $001B
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 1, $1DC)
    %spritemapEntry(0, $00, $F0, 0, 1, 2, 1, $1CC)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 1, $1DC)
    %spritemapEntry(0, $1F8, $F0, 0, 0, 2, 1, $1CC)
    %spritemapEntry(0, $03, $18, 0, 1, 2, 1, $14C)
    %spritemapEntry(0, $1F5, $18, 0, 0, 2, 1, $14C)
    %spritemapEntry(0, $1F0, $E8, 0, 0, 2, 1, $1F4)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 2, 1, $1E4)
    %spritemapEntry(0, $00, $E8, 0, 1, 2, 1, $1DD)
    %spritemapEntry(0, $00, $E0, 0, 1, 2, 1, $1CD)
    %spritemapEntry(0, $1F8, $E8, 0, 0, 2, 1, $1DD)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 2, 1, $1CD)
    %spritemapEntry(0, $08, $E8, 0, 1, 2, 1, $1F4)
    %spritemapEntry(0, $08, $E0, 0, 1, 2, 1, $1E4)
    %spritemapEntry(0, $1FC, $00, 0, 1, 2, 1, $15F)
    %spritemapEntry(0, $1F5, $28, 0, 0, 2, 1, $1DF)
    %spritemapEntry(0, $1F5, $20, 0, 0, 2, 1, $1CF)
    %spritemapEntry(0, $1F5, $10, 0, 0, 2, 1, $19E)
    %spritemapEntry(0, $1F6, $08, 0, 0, 2, 1, $1DE)
    %spritemapEntry(0, $1F7, $00, 0, 0, 2, 1, $1CE)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 2, 1, $1E6)
    %spritemapEntry(0, $03, $28, 0, 1, 2, 1, $1DF)
    %spritemapEntry(0, $03, $20, 0, 1, 2, 1, $1CF)
    %spritemapEntry(0, $03, $10, 0, 1, 2, 1, $19E)
    %spritemapEntry(0, $02, $08, 0, 1, 2, 1, $1DE)
    %spritemapEntry(0, $01, $00, 0, 1, 2, 1, $1CE)
    %spritemapEntry(1, $00, $F0, 0, 1, 2, 1, $1E6)

Spritemaps_Torizo_8:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 1, 2, 5, $170)

Spritemaps_Torizo_9:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 1, 2, 5, $163)

Spritemaps_Torizo_A:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 1, 2, 5, $167)

Spritemaps_Torizo_B:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 1, 2, 5, $16A)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemaps_Torizo_AA8C25:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 5, $12E)

UNUSED_Spritemaps_Torizo_AA8C2C:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 1, $104)
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemaps_Torizo_C:
    dw $001A
    %spritemapEntry(0, $1E9, $FA, 0, 0, 2, 1, $1FB)
    %spritemapEntry(0, $1E1, $FA, 0, 0, 2, 1, $1FA)
    %spritemapEntry(1, $1FC, $EE, 0, 0, 2, 1, $128)
    %spritemapEntry(1, $1F8, $FB, 0, 1, 2, 1, $108)
    %spritemapEntry(0, $1F2, $15, 0, 0, 2, 1, $162)
    %spritemapEntry(0, $1EA, $15, 0, 0, 2, 1, $161)
    %spritemapEntry(0, $1E2, $15, 0, 0, 2, 1, $160)
    %spritemapEntry(1, $1E7, $F7, 1, 1, 2, 1, $158)
    %spritemapEntry(1, $1EF, $FF, 1, 1, 2, 1, $147)
    %spritemapEntry(0, $1F9, $12, 0, 0, 2, 1, $194)
    %spritemapEntry(0, $1F1, $12, 0, 0, 2, 1, $193)
    %spritemapEntry(1, $1F1, $02, 0, 0, 2, 1, $173)
    %spritemapEntry(0, $05, $16, 0, 0, 2, 1, $1EF)
    %spritemapEntry(0, $0D, $16, 0, 0, 2, 1, $1FC)
    %spritemapEntry(0, $0D, $0E, 0, 0, 2, 1, $1FF)
    %spritemapEntry(1, $1FD, $06, 0, 0, 2, 1, $1ED)
    %spritemapEntry(0, $07, $E3, 0, 0, 2, 1, $1CB)
    %spritemapEntry(0, $1FF, $E3, 0, 0, 2, 1, $1CA)
    %spritemapEntry(1, $1EF, $E3, 0, 0, 2, 1, $1C8)
    %spritemapEntry(1, $1EF, $F3, 0, 0, 2, 1, $1E8)
    %spritemapEntry(1, $08, $06, 0, 0, 2, 1, $142)
    %spritemapEntry(1, $1F8, $06, 0, 0, 2, 1, $140)
    %spritemapEntry(1, $08, $F6, 0, 0, 2, 1, $122)
    %spritemapEntry(1, $1F8, $F6, 0, 0, 2, 1, $120)
    %spritemapEntry(1, $08, $E6, 0, 0, 2, 1, $102)
    %spritemapEntry(1, $1F8, $E6, 0, 0, 2, 1, $100)

Spritemaps_Torizo_D:
    dw $001A
    %spritemapEntry(1, $1FD, $F9, 0, 0, 2, 1, $106)
    %spritemapEntry(1, $1FD, $EC, 0, 0, 2, 1, $126)
    %spritemapEntry(0, $1E3, $03, 0, 1, 2, 1, $18F)
    %spritemapEntry(0, $1EB, $03, 0, 1, 2, 1, $18E)
    %spritemapEntry(0, $1EF, $04, 0, 1, 2, 1, $14F)
    %spritemapEntry(0, $1F7, $04, 0, 1, 2, 1, $14E)
    %spritemapEntry(0, $1FF, $04, 0, 1, 2, 1, $14D)
    %spritemapEntry(0, $1FB, $10, 0, 0, 2, 1, $196)
    %spritemapEntry(0, $1F3, $10, 0, 0, 2, 1, $195)
    %spritemapEntry(1, $1F3, $00, 0, 0, 2, 1, $175)
    %spritemapEntry(0, $02, $01, 1, 0, 2, 1, $1AE)
    %spritemapEntry(0, $1FA, $01, 1, 0, 2, 1, $1AD)
    %spritemapEntry(1, $1FA, $09, 1, 0, 2, 1, $1A6)
    %spritemapEntry(0, $1FB, $15, 0, 0, 2, 1, $162)
    %spritemapEntry(0, $1F3, $15, 0, 0, 2, 1, $161)
    %spritemapEntry(0, $1EB, $15, 0, 0, 2, 1, $160)
    %spritemapEntry(0, $06, $E4, 0, 0, 2, 1, $1CB)
    %spritemapEntry(0, $1FE, $E4, 0, 0, 2, 1, $1CA)
    %spritemapEntry(1, $1EE, $E4, 0, 0, 2, 1, $1C8)
    %spritemapEntry(1, $1EE, $F4, 0, 0, 2, 1, $1E8)
    %spritemapEntry(1, $07, $07, 0, 0, 2, 1, $142)
    %spritemapEntry(1, $1F7, $07, 0, 0, 2, 1, $140)
    %spritemapEntry(1, $07, $F7, 0, 0, 2, 1, $122)
    %spritemapEntry(1, $1F7, $F7, 0, 0, 2, 1, $120)
    %spritemapEntry(1, $07, $E7, 0, 0, 2, 1, $102)
    %spritemapEntry(1, $1F7, $E7, 0, 0, 2, 1, $100)

Spritemaps_Torizo_E:
    dw $001B
    %spritemapEntry(1, $1E7, $0D, 0, 1, 2, 1, $16C)
    %spritemapEntry(1, $1FA, $F4, 0, 0, 2, 1, $106)
    %spritemapEntry(1, $1FA, $E7, 0, 0, 2, 1, $126)
    %spritemapEntry(1, $1EE, $07, 0, 1, 2, 1, $158)
    %spritemapEntry(1, $1F5, $FF, 0, 1, 2, 1, $147)
    %spritemapEntry(0, $1FB, $16, 0, 0, 2, 1, $198)
    %spritemapEntry(0, $1F3, $16, 0, 0, 2, 1, $197)
    %spritemapEntry(1, $1F3, $06, 0, 0, 2, 1, $177)
    %spritemapEntry(0, $01, $1B, 0, 0, 2, 1, $162)
    %spritemapEntry(0, $1F9, $1B, 0, 0, 2, 1, $161)
    %spritemapEntry(0, $1F1, $1B, 0, 0, 2, 1, $160)
    %spritemapEntry(0, $07, $0B, 1, 0, 2, 1, $1EC)
    %spritemapEntry(0, $1FF, $0B, 1, 0, 2, 1, $1EB)
    %spritemapEntry(0, $1F7, $0B, 1, 0, 2, 1, $1EA)
    %spritemapEntry(0, $07, $03, 0, 0, 2, 1, $1EC)
    %spritemapEntry(0, $1FF, $03, 0, 0, 2, 1, $1EB)
    %spritemapEntry(0, $1F7, $03, 0, 0, 2, 1, $1EA)
    %spritemapEntry(0, $06, $DE, 0, 0, 2, 1, $1CB)
    %spritemapEntry(0, $1FE, $DE, 0, 0, 2, 1, $1CA)
    %spritemapEntry(1, $1EE, $DE, 0, 0, 2, 1, $1C8)
    %spritemapEntry(1, $1EE, $EE, 0, 0, 2, 1, $1E8)
    %spritemapEntry(1, $07, $01, 0, 0, 2, 1, $142)
    %spritemapEntry(1, $1F7, $01, 0, 0, 2, 1, $140)
    %spritemapEntry(1, $07, $F1, 0, 0, 2, 1, $122)
    %spritemapEntry(1, $1F7, $F1, 0, 0, 2, 1, $120)
    %spritemapEntry(1, $07, $E1, 0, 0, 2, 1, $102)
    %spritemapEntry(1, $1F7, $E1, 0, 0, 2, 1, $100)

Spritemaps_Torizo_E_miscount:
    dw $0019
    %spritemapEntry(1, $1FB, $F1, 0, 0, 2, 1, $106)
    %spritemapEntry(1, $1FB, $E4, 0, 0, 2, 1, $126)
    %spritemapEntry(1, $1E6, $0A, 0, 1, 2, 1, $16C)
    %spritemapEntry(1, $1ED, $05, 0, 1, 2, 1, $158)
    %spritemapEntry(1, $1F4, $FD, 0, 1, 2, 1, $147)
    %spritemapEntry(1, $02, $FB, 0, 0, 2, 1, $1A9)
    %spritemapEntry(0, $02, $0B, 0, 0, 2, 1, $1BB)
    %spritemapEntry(0, $1FA, $0B, 0, 0, 2, 1, $1AF)
    %spritemapEntry(1, $1FA, $FB, 0, 0, 2, 1, $1A8)
    %spritemapEntry(0, $06, $D9, 0, 0, 2, 1, $1CB)
    %spritemapEntry(0, $1FE, $D9, 0, 0, 2, 1, $1CA)
    %spritemapEntry(1, $1EE, $D9, 0, 0, 2, 1, $1C8)
    %spritemapEntry(1, $1EE, $E9, 0, 0, 2, 1, $1E8)
    %spritemapEntry(1, $07, $FC, 0, 0, 2, 1, $142)
    %spritemapEntry(1, $1F7, $FC, 0, 0, 2, 1, $140)
    %spritemapEntry(1, $07, $EC, 0, 0, 2, 1, $122)
    %spritemapEntry(1, $1F7, $EC, 0, 0, 2, 1, $120)
    %spritemapEntry(1, $07, $DC, 0, 0, 2, 1, $102)
    %spritemapEntry(1, $1F7, $DC, 0, 0, 2, 1, $100)
    %spritemapEntry(0, $01, $1B, 0, 0, 2, 1, $198)
    %spritemapEntry(0, $1F9, $1B, 0, 0, 2, 1, $197)
    %spritemapEntry(1, $1F9, $0B, 0, 0, 2, 1, $177)
    %spritemapEntry(0, $08, $21, 0, 0, 2, 1, $162)
    %spritemapEntry(0, $00, $21, 0, 0, 2, 1, $161)
    %spritemapEntry(0, $1F8, $21, 0, 0, 2, 1, $160)

Spritemaps_Torizo_F:
    dw $0019
    %spritemapEntry(0, $1FD, $D3, 0, 0, 2, 1, $1CB)
    %spritemapEntry(0, $1F5, $D3, 0, 0, 2, 1, $1CA)
    %spritemapEntry(1, $1E5, $E3, 0, 0, 2, 1, $1E8)
    %spritemapEntry(1, $1E5, $D3, 0, 0, 2, 1, $1C8)
    %spritemapEntry(0, $01, $0F, 0, 0, 2, 1, $1AC)
    %spritemapEntry(0, $1F9, $0F, 0, 0, 2, 1, $1AB)
    %spritemapEntry(1, $1F9, $FF, 0, 0, 2, 1, $1A4)
    %spritemapEntry(0, $03, $28, 0, 0, 2, 1, $162)
    %spritemapEntry(0, $1FB, $28, 0, 0, 2, 1, $161)
    %spritemapEntry(0, $1F3, $28, 0, 0, 2, 1, $160)
    %spritemapEntry(0, $02, $21, 0, 0, 2, 1, $196)
    %spritemapEntry(0, $1FA, $21, 0, 0, 2, 1, $195)
    %spritemapEntry(1, $1FA, $11, 0, 0, 2, 1, $175)
    %spritemapEntry(0, $1FB, $0E, 0, 0, 2, 2, $1AE)
    %spritemapEntry(0, $1F3, $0E, 0, 0, 2, 2, $1AD)
    %spritemapEntry(1, $1F3, $FE, 0, 0, 2, 2, $1A6)
    %spritemapEntry(1, $1FD, $15, 0, 0, 2, 2, $18A)
    %spritemapEntry(1, $1F5, $0D, 0, 0, 2, 2, $179)
    %spritemapEntry(1, $1FF, $1F, 0, 0, 2, 2, $1A2)
    %spritemapEntry(1, $1FE, $F7, 0, 0, 2, 1, $142)
    %spritemapEntry(1, $1EE, $F7, 0, 0, 2, 1, $140)
    %spritemapEntry(1, $1FE, $E7, 0, 0, 2, 1, $122)
    %spritemapEntry(1, $1EE, $E7, 0, 0, 2, 1, $120)
    %spritemapEntry(1, $1FE, $D7, 0, 0, 2, 1, $102)
    %spritemapEntry(1, $1EE, $D7, 0, 0, 2, 1, $100)

Spritemaps_Torizo_10:
    dw $001A
    %spritemapEntry(0, $1FD, $D4, 0, 0, 2, 1, $1CB)
    %spritemapEntry(0, $1F5, $D4, 0, 0, 2, 1, $1CA)
    %spritemapEntry(1, $1E5, $E4, 0, 0, 2, 1, $1E8)
    %spritemapEntry(1, $1E5, $D4, 0, 0, 2, 1, $1C8)
    %spritemapEntry(0, $1FC, $0E, 0, 1, 2, 1, $1AE)
    %spritemapEntry(0, $04, $0E, 0, 1, 2, 1, $1AD)
    %spritemapEntry(1, $1FC, $FE, 0, 1, 2, 1, $1A6)
    %spritemapEntry(0, $13, $28, 0, 0, 2, 1, $162)
    %spritemapEntry(0, $0B, $28, 0, 0, 2, 1, $161)
    %spritemapEntry(0, $03, $28, 0, 0, 2, 1, $160)
    %spritemapEntry(0, $0D, $22, 0, 0, 2, 1, $198)
    %spritemapEntry(0, $05, $22, 0, 0, 2, 1, $197)
    %spritemapEntry(1, $05, $12, 0, 0, 2, 1, $177)
    %spritemapEntry(1, $1F6, $FC, 0, 0, 2, 2, $1A9)
    %spritemapEntry(0, $1F6, $0C, 0, 0, 2, 2, $1BB)
    %spritemapEntry(0, $1EE, $0C, 0, 0, 2, 2, $1AF)
    %spritemapEntry(1, $1EE, $FC, 0, 0, 2, 2, $1A8)
    %spritemapEntry(1, $1F2, $1F, 0, 0, 2, 2, $1A2)
    %spritemapEntry(0, $1EF, $1F, 0, 0, 2, 2, $197)
    %spritemapEntry(1, $1EF, $0F, 0, 0, 2, 2, $177)
    %spritemapEntry(1, $1FE, $F8, 0, 0, 2, 1, $142)
    %spritemapEntry(1, $1EE, $F8, 0, 0, 2, 1, $140)
    %spritemapEntry(1, $1FE, $E8, 0, 0, 2, 1, $122)
    %spritemapEntry(1, $1EE, $E8, 0, 0, 2, 1, $120)
    %spritemapEntry(1, $1FE, $D8, 0, 0, 2, 1, $102)
    %spritemapEntry(1, $1EE, $D8, 0, 0, 2, 1, $100)

Spritemaps_Torizo_12:
    dw $001C
    %spritemapEntry(0, $1FD, $D5, 0, 0, 2, 1, $1CB)
    %spritemapEntry(0, $1F5, $D5, 0, 0, 2, 1, $1CA)
    %spritemapEntry(1, $1E5, $E5, 0, 0, 2, 1, $1E8)
    %spritemapEntry(1, $1E5, $D5, 0, 0, 2, 1, $1C8)
    %spritemapEntry(0, $1A, $28, 0, 0, 2, 1, $162)
    %spritemapEntry(0, $12, $28, 0, 0, 2, 1, $161)
    %spritemapEntry(0, $0A, $28, 0, 0, 2, 1, $160)
    %spritemapEntry(0, $1FD, $10, 0, 1, 2, 1, $1AE)
    %spritemapEntry(0, $05, $10, 0, 1, 2, 1, $1AD)
    %spritemapEntry(1, $1FD, $00, 0, 1, 2, 1, $1A6)
    %spritemapEntry(1, $0F, $1C, 0, 0, 2, 1, $18A)
    %spritemapEntry(1, $07, $14, 0, 0, 2, 1, $179)
    %spritemapEntry(0, $1EB, $28, 0, 0, 2, 2, $162)
    %spritemapEntry(0, $1E3, $28, 0, 0, 2, 2, $161)
    %spritemapEntry(0, $1DB, $28, 0, 0, 2, 2, $160)
    %spritemapEntry(1, $1F7, $FE, 0, 0, 2, 2, $1A9)
    %spritemapEntry(0, $1F7, $0E, 0, 0, 2, 2, $1BB)
    %spritemapEntry(0, $1EF, $0E, 0, 0, 2, 2, $1AF)
    %spritemapEntry(1, $1EF, $FE, 0, 0, 2, 2, $1A8)
    %spritemapEntry(0, $1EF, $22, 0, 0, 2, 2, $194)
    %spritemapEntry(0, $1E7, $22, 0, 0, 2, 2, $193)
    %spritemapEntry(1, $1E7, $12, 0, 0, 2, 2, $173)
    %spritemapEntry(1, $1FE, $F9, 0, 0, 2, 1, $142)
    %spritemapEntry(1, $1EE, $F9, 0, 0, 2, 1, $140)
    %spritemapEntry(1, $1FE, $E9, 0, 0, 2, 1, $122)
    %spritemapEntry(1, $1EE, $E9, 0, 0, 2, 1, $120)
    %spritemapEntry(1, $1FE, $D9, 0, 0, 2, 1, $102)
    %spritemapEntry(1, $1EE, $D9, 0, 0, 2, 1, $100)

Spritemaps_Torizo_13:
    dw $0016
    %spritemapEntry(0, $1EB, $28, 0, 0, 2, 1, $162)
    %spritemapEntry(0, $1E3, $28, 0, 0, 2, 1, $161)
    %spritemapEntry(0, $1DB, $28, 0, 0, 2, 1, $160)
    %spritemapEntry(1, $1F7, $FE, 0, 0, 2, 1, $1A9)
    %spritemapEntry(0, $1F7, $0E, 0, 0, 2, 1, $1BB)
    %spritemapEntry(0, $1EF, $0E, 0, 0, 2, 1, $1AF)
    %spritemapEntry(1, $1EF, $FE, 0, 0, 2, 1, $1A8)
    %spritemapEntry(0, $1EF, $22, 0, 0, 2, 1, $194)
    %spritemapEntry(0, $1E7, $22, 0, 0, 2, 1, $193)
    %spritemapEntry(1, $1E7, $12, 0, 0, 2, 1, $173)
    %spritemapEntry(0, $1FC, $0D, 0, 1, 2, 2, $1AE)
    %spritemapEntry(0, $04, $0D, 0, 1, 2, 2, $1AD)
    %spritemapEntry(1, $1FC, $FD, 0, 1, 2, 2, $1A6)
    %spritemapEntry(1, $0D, $16, 0, 0, 2, 2, $18A)
    %spritemapEntry(1, $05, $0E, 0, 0, 2, 2, $179)
    %spritemapEntry(1, $13, $1F, 0, 0, 2, 2, $1A0)
    %spritemapEntry(1, $1FE, $F9, 0, 0, 2, 1, $142)
    %spritemapEntry(1, $1EE, $F9, 0, 0, 2, 1, $140)
    %spritemapEntry(1, $1FE, $E9, 0, 0, 2, 1, $122)
    %spritemapEntry(1, $1EE, $E9, 0, 0, 2, 1, $120)
    %spritemapEntry(1, $1FE, $D9, 0, 0, 2, 1, $102)
    %spritemapEntry(1, $1EE, $D9, 0, 0, 2, 1, $100)

Spritemaps_Torizo_14:
    dw $0015
    %spritemapEntry(0, $1FB, $0F, 0, 0, 2, 1, $1AE)
    %spritemapEntry(0, $1F3, $0F, 0, 0, 2, 1, $1AD)
    %spritemapEntry(1, $1F3, $FF, 0, 0, 2, 1, $1A6)
    %spritemapEntry(0, $1F0, $28, 0, 0, 2, 1, $162)
    %spritemapEntry(0, $1E8, $28, 0, 0, 2, 1, $161)
    %spritemapEntry(0, $1E0, $28, 0, 0, 2, 1, $160)
    %spritemapEntry(0, $1F4, $23, 0, 0, 2, 1, $194)
    %spritemapEntry(0, $1EC, $23, 0, 0, 2, 1, $193)
    %spritemapEntry(1, $1EC, $13, 0, 0, 2, 1, $173)
    %spritemapEntry(1, $09, $1E, 0, 0, 2, 2, $1A0)
    %spritemapEntry(0, $1FF, $10, 0, 0, 2, 2, $1AC)
    %spritemapEntry(0, $1F7, $10, 0, 0, 2, 2, $1AB)
    %spritemapEntry(1, $1F7, $00, 0, 0, 2, 2, $1A4)
    %spritemapEntry(1, $05, $18, 0, 0, 2, 2, $18A)
    %spritemapEntry(1, $1FD, $10, 0, 0, 2, 2, $179)
    %spritemapEntry(1, $1FE, $F8, 0, 0, 2, 1, $142)
    %spritemapEntry(1, $1EE, $F8, 0, 0, 2, 1, $140)
    %spritemapEntry(1, $1FE, $E8, 0, 0, 2, 1, $122)
    %spritemapEntry(1, $1EE, $E8, 0, 0, 2, 1, $120)
    %spritemapEntry(1, $1FE, $D8, 0, 0, 2, 1, $102)
    %spritemapEntry(1, $1EE, $D8, 0, 0, 2, 1, $100)

Spritemaps_Torizo_15:
    dw $0015
    %spritemapEntry(0, $01, $0F, 0, 0, 2, 1, $1AC)
    %spritemapEntry(0, $1F9, $0F, 0, 0, 2, 1, $1AB)
    %spritemapEntry(1, $1F9, $FF, 0, 0, 2, 1, $1A4)
    %spritemapEntry(0, $03, $28, 0, 0, 2, 1, $162)
    %spritemapEntry(0, $1FB, $28, 0, 0, 2, 1, $161)
    %spritemapEntry(0, $1F3, $28, 0, 0, 2, 1, $160)
    %spritemapEntry(0, $02, $21, 0, 0, 2, 1, $196)
    %spritemapEntry(0, $1FA, $21, 0, 0, 2, 1, $195)
    %spritemapEntry(1, $1FA, $11, 0, 0, 2, 1, $175)
    %spritemapEntry(0, $1FB, $0E, 0, 0, 2, 2, $1AE)
    %spritemapEntry(0, $1F3, $0E, 0, 0, 2, 2, $1AD)
    %spritemapEntry(1, $1F3, $FE, 0, 0, 2, 2, $1A6)
    %spritemapEntry(1, $1FD, $15, 0, 0, 2, 2, $18A)
    %spritemapEntry(1, $1F5, $0D, 0, 0, 2, 2, $179)
    %spritemapEntry(1, $1FF, $1F, 0, 0, 2, 2, $1A2)
    %spritemapEntry(1, $1FE, $F7, 0, 0, 2, 1, $142)
    %spritemapEntry(1, $1EE, $F7, 0, 0, 2, 1, $140)
    %spritemapEntry(1, $1FE, $E7, 0, 0, 2, 1, $122)
    %spritemapEntry(1, $1EE, $E7, 0, 0, 2, 1, $120)
    %spritemapEntry(1, $1FE, $D7, 0, 0, 2, 1, $102)
    %spritemapEntry(1, $1EE, $D7, 0, 0, 2, 1, $100)

Spritemaps_Torizo_16:
    dw $0016
    %spritemapEntry(0, $1FC, $0E, 0, 1, 2, 1, $1AE)
    %spritemapEntry(0, $04, $0E, 0, 1, 2, 1, $1AD)
    %spritemapEntry(1, $1FC, $FE, 0, 1, 2, 1, $1A6)
    %spritemapEntry(0, $13, $28, 0, 0, 2, 1, $162)
    %spritemapEntry(0, $0B, $28, 0, 0, 2, 1, $161)
    %spritemapEntry(0, $03, $28, 0, 0, 2, 1, $160)
    %spritemapEntry(0, $0D, $22, 0, 0, 2, 1, $198)
    %spritemapEntry(0, $05, $22, 0, 0, 2, 1, $197)
    %spritemapEntry(1, $05, $12, 0, 0, 2, 1, $177)
    %spritemapEntry(1, $1F6, $FC, 0, 0, 2, 2, $1A9)
    %spritemapEntry(0, $1F6, $0C, 0, 0, 2, 2, $1BB)
    %spritemapEntry(0, $1EE, $0C, 0, 0, 2, 2, $1AF)
    %spritemapEntry(1, $1EE, $FC, 0, 0, 2, 2, $1A8)
    %spritemapEntry(1, $1F2, $1F, 0, 0, 2, 2, $1A2)
    %spritemapEntry(0, $1EF, $1F, 0, 0, 2, 2, $197)
    %spritemapEntry(1, $1EF, $0F, 0, 0, 2, 2, $177)
    %spritemapEntry(1, $1FE, $F8, 0, 0, 2, 1, $142)
    %spritemapEntry(1, $1EE, $F8, 0, 0, 2, 1, $140)
    %spritemapEntry(1, $1FE, $E8, 0, 0, 2, 1, $122)
    %spritemapEntry(1, $1EE, $E8, 0, 0, 2, 1, $120)
    %spritemapEntry(1, $1FE, $D8, 0, 0, 2, 1, $102)
    %spritemapEntry(1, $1EE, $D8, 0, 0, 2, 1, $100)

Spritemaps_Torizo_17:
    dw $0016
    %spritemapEntry(0, $1FC, $0E, 0, 1, 2, 1, $1AE)
    %spritemapEntry(0, $04, $0E, 0, 1, 2, 1, $1AD)
    %spritemapEntry(1, $1FC, $FE, 0, 1, 2, 1, $1A6)
    %spritemapEntry(1, $0D, $17, 0, 0, 2, 1, $18A)
    %spritemapEntry(1, $05, $0F, 0, 0, 2, 1, $179)
    %spritemapEntry(1, $13, $20, 0, 0, 2, 1, $1A0)
    %spritemapEntry(0, $1EB, $28, 0, 0, 2, 2, $162)
    %spritemapEntry(0, $1E3, $28, 0, 0, 2, 2, $161)
    %spritemapEntry(0, $1DB, $28, 0, 0, 2, 2, $160)
    %spritemapEntry(1, $1F7, $FE, 0, 0, 2, 2, $1A9)
    %spritemapEntry(0, $1F7, $0E, 0, 0, 2, 2, $1BB)
    %spritemapEntry(0, $1EF, $0E, 0, 0, 2, 2, $1AF)
    %spritemapEntry(1, $1EF, $FE, 0, 0, 2, 2, $1A8)
    %spritemapEntry(0, $1EF, $22, 0, 0, 2, 2, $194)
    %spritemapEntry(0, $1E7, $22, 0, 0, 2, 2, $193)
    %spritemapEntry(1, $1E7, $12, 0, 0, 2, 2, $173)
    %spritemapEntry(1, $1FE, $F9, 0, 0, 2, 1, $142)
    %spritemapEntry(1, $1EE, $F9, 0, 0, 2, 1, $140)
    %spritemapEntry(1, $1FE, $E9, 0, 0, 2, 1, $122)
    %spritemapEntry(1, $1EE, $E9, 0, 0, 2, 1, $120)
    %spritemapEntry(1, $1FE, $D9, 0, 0, 2, 1, $102)
    %spritemapEntry(1, $1EE, $D9, 0, 0, 2, 1, $100)

Spritemaps_Torizo_18:
    dw $0015
    %spritemapEntry(1, $0A, $1D, 0, 0, 2, 1, $1A0)
    %spritemapEntry(0, $00, $0F, 0, 0, 2, 1, $1AC)
    %spritemapEntry(0, $1F8, $0F, 0, 0, 2, 1, $1AB)
    %spritemapEntry(1, $1F8, $FF, 0, 0, 2, 1, $1A4)
    %spritemapEntry(1, $06, $17, 0, 0, 2, 1, $18A)
    %spritemapEntry(1, $1FE, $0F, 0, 0, 2, 1, $179)
    %spritemapEntry(0, $1FD, $0F, 0, 0, 2, 2, $1AE)
    %spritemapEntry(0, $1F5, $0F, 0, 0, 2, 2, $1AD)
    %spritemapEntry(1, $1F5, $FF, 0, 0, 2, 2, $1A6)
    %spritemapEntry(0, $1F2, $28, 0, 0, 2, 2, $162)
    %spritemapEntry(0, $1EA, $28, 0, 0, 2, 2, $161)
    %spritemapEntry(0, $1E2, $28, 0, 0, 2, 2, $160)
    %spritemapEntry(0, $1F6, $23, 0, 0, 2, 2, $194)
    %spritemapEntry(0, $1EE, $23, 0, 0, 2, 2, $193)
    %spritemapEntry(1, $1EE, $13, 0, 0, 2, 2, $173)
    %spritemapEntry(1, $1FE, $F8, 0, 0, 2, 1, $142)
    %spritemapEntry(1, $1EE, $F8, 0, 0, 2, 1, $140)
    %spritemapEntry(1, $1FE, $E8, 0, 0, 2, 1, $122)
    %spritemapEntry(1, $1EE, $E8, 0, 0, 2, 1, $120)
    %spritemapEntry(1, $1FE, $D8, 0, 0, 2, 1, $102)
    %spritemapEntry(1, $1EE, $D8, 0, 0, 2, 1, $100)

Spritemaps_Torizo_19:
    dw $0015
    %spritemapEntry(0, $1FB, $0E, 0, 0, 2, 1, $1AE)
    %spritemapEntry(0, $1F3, $0E, 0, 0, 2, 1, $1AD)
    %spritemapEntry(1, $1F3, $FE, 0, 0, 2, 1, $1A6)
    %spritemapEntry(1, $1FD, $15, 0, 0, 2, 1, $18A)
    %spritemapEntry(1, $1F5, $0D, 0, 0, 2, 1, $179)
    %spritemapEntry(1, $1FF, $1F, 0, 0, 2, 1, $1A2)
    %spritemapEntry(0, $01, $0F, 0, 0, 2, 2, $1AC)
    %spritemapEntry(0, $1F9, $0F, 0, 0, 2, 2, $1AB)
    %spritemapEntry(1, $1F9, $FF, 0, 0, 2, 2, $1A4)
    %spritemapEntry(0, $03, $28, 0, 0, 2, 2, $162)
    %spritemapEntry(0, $1FB, $28, 0, 0, 2, 2, $161)
    %spritemapEntry(0, $1F3, $28, 0, 0, 2, 2, $160)
    %spritemapEntry(0, $02, $21, 0, 0, 2, 2, $196)
    %spritemapEntry(0, $1FA, $21, 0, 0, 2, 2, $195)
    %spritemapEntry(1, $1FA, $11, 0, 0, 2, 2, $175)
    %spritemapEntry(1, $1FE, $F7, 0, 0, 2, 1, $142)
    %spritemapEntry(1, $1EE, $F7, 0, 0, 2, 1, $140)
    %spritemapEntry(1, $1FE, $E7, 0, 0, 2, 1, $122)
    %spritemapEntry(1, $1EE, $E7, 0, 0, 2, 1, $120)
    %spritemapEntry(1, $1FE, $D7, 0, 0, 2, 1, $102)
    %spritemapEntry(1, $1EE, $D7, 0, 0, 2, 1, $100)

Spritemaps_Torizo_1A:
    dw $0016
    %spritemapEntry(1, $1F7, $FC, 0, 0, 2, 1, $1A9)
    %spritemapEntry(0, $1F7, $0C, 0, 0, 2, 1, $1BB)
    %spritemapEntry(0, $1EF, $0C, 0, 0, 2, 1, $1AF)
    %spritemapEntry(1, $1EF, $FC, 0, 0, 2, 1, $1A8)
    %spritemapEntry(1, $1F3, $1F, 0, 0, 2, 1, $1A2)
    %spritemapEntry(0, $1F0, $1F, 0, 0, 2, 1, $197)
    %spritemapEntry(1, $1F0, $0F, 0, 0, 2, 1, $177)
    %spritemapEntry(0, $1FE, $0E, 0, 1, 2, 2, $1AE)
    %spritemapEntry(0, $06, $0E, 0, 1, 2, 2, $1AD)
    %spritemapEntry(1, $1FE, $FE, 0, 1, 2, 2, $1A6)
    %spritemapEntry(0, $15, $28, 0, 0, 2, 2, $162)
    %spritemapEntry(0, $0D, $28, 0, 0, 2, 2, $161)
    %spritemapEntry(0, $05, $28, 0, 0, 2, 2, $160)
    %spritemapEntry(0, $0F, $22, 0, 0, 2, 2, $198)
    %spritemapEntry(0, $07, $22, 0, 0, 2, 2, $197)
    %spritemapEntry(1, $07, $12, 0, 0, 2, 2, $177)
    %spritemapEntry(1, $1FE, $F8, 0, 0, 2, 1, $142)
    %spritemapEntry(1, $1EE, $F8, 0, 0, 2, 1, $140)
    %spritemapEntry(1, $1FE, $E8, 0, 0, 2, 1, $122)
    %spritemapEntry(1, $1EE, $E8, 0, 0, 2, 1, $120)
    %spritemapEntry(1, $1FE, $D8, 0, 0, 2, 1, $102)
    %spritemapEntry(1, $1EE, $D8, 0, 0, 2, 1, $100)

Spritemaps_Torizo_1B:
    dw $0007
    %spritemapEntry(0, $10, $25, 0, 1, 2, 1, $17B)
    %spritemapEntry(0, $10, $1D, 0, 1, 2, 1, $16B)
    %spritemapEntry(1, $05, $FB, 0, 0, 2, 1, $10C)
    %spritemapEntry(0, $10, $16, 0, 0, 2, 1, $164)
    %spritemapEntry(0, $10, $0E, 0, 0, 2, 1, $154)
    %spritemapEntry(0, $10, $06, 0, 0, 2, 1, $144)
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 1, $12A)

Spritemaps_Torizo_1C:
    dw $0005
    %spritemapEntry(1, $1FA, $23, 0, 0, 2, 1, $16C)
    %spritemapEntry(1, $01, $02, 0, 0, 2, 1, $10A)
    %spritemapEntry(0, $02, $1F, 0, 1, 2, 1, $166)
    %spritemapEntry(1, $02, $0F, 0, 1, 2, 1, $145)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 1, $124)

Spritemaps_Torizo_1D:
    dw $0005
    %spritemapEntry(1, $1F0, $28, 0, 0, 2, 1, $16C)
    %spritemapEntry(0, $1F9, $24, 0, 1, 2, 1, $166)
    %spritemapEntry(1, $1F9, $14, 0, 1, 2, 1, $145)
    %spritemapEntry(1, $1FC, $05, 0, 0, 2, 1, $108)
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 1, $128)

Spritemaps_Torizo_1E:
    dw $0005
    %spritemapEntry(1, $1E7, $24, 0, 0, 2, 1, $16C)
    %spritemapEntry(1, $1F8, $06, 0, 0, 2, 1, $106)
    %spritemapEntry(1, $1EC, $1B, 0, 1, 2, 1, $158)
    %spritemapEntry(1, $1F4, $13, 0, 1, 2, 1, $147)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 1, $126)

Spritemaps_Torizo_1F:
    dw $0005
    %spritemapEntry(1, $1DE, $19, 0, 0, 2, 1, $16C)
    %spritemapEntry(1, $1F4, $05, 0, 1, 2, 1, $108)
    %spritemapEntry(0, $1E4, $16, 0, 1, 2, 1, $15C)
    %spritemapEntry(1, $1EC, $0E, 0, 1, 2, 1, $14A)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 1, $128)

Spritemaps_Torizo_20:
    dw $0007
    %spritemapEntry(1, $1EF, $02, 0, 1, 2, 1, $10A)
    %spritemapEntry(0, $1CE, $0B, 0, 1, 2, 1, $18F)
    %spritemapEntry(0, $1D6, $0B, 0, 1, 2, 1, $18E)
    %spritemapEntry(0, $1DA, $0B, 0, 1, 2, 1, $14F)
    %spritemapEntry(0, $1E2, $0B, 0, 1, 2, 1, $14E)
    %spritemapEntry(0, $1EA, $0B, 0, 1, 2, 1, $14D)
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 1, $124)

Spritemaps_Torizo_21:
    dw $0005
    %spritemapEntry(1, $1D4, $F6, 1, 1, 2, 1, $16E)
    %spritemapEntry(1, $1EF, $02, 0, 1, 2, 1, $10A)
    %spritemapEntry(1, $1DB, $FA, 1, 1, 2, 1, $158)
    %spritemapEntry(1, $1E3, $02, 1, 1, 2, 1, $147)
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 1, $124)

Spritemaps_Torizo_22:
    dw $0007
    %spritemapEntry(0, $1E6, $DD, 1, 0, 2, 1, $17B)
    %spritemapEntry(0, $1E6, $E5, 1, 0, 2, 1, $16B)
    %spritemapEntry(1, $1EA, $F8, 0, 1, 2, 1, $10E)
    %spritemapEntry(0, $1E6, $EB, 1, 1, 2, 1, $164)
    %spritemapEntry(0, $1E6, $F3, 1, 1, 2, 1, $154)
    %spritemapEntry(0, $1E6, $FB, 1, 1, 2, 1, $144)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 1, $12A)

Spritemaps_Torizo_23:
    dw $0007
    %spritemapEntry(0, $0F, $25, 0, 1, 2, 2, $17B)
    %spritemapEntry(0, $0F, $1D, 0, 1, 2, 2, $16B)
    %spritemapEntry(1, $05, $FB, 0, 0, 2, 2, $10C)
    %spritemapEntry(0, $10, $16, 0, 0, 2, 2, $164)
    %spritemapEntry(0, $10, $0E, 0, 0, 2, 2, $154)
    %spritemapEntry(0, $10, $06, 0, 0, 2, 2, $144)
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 2, $12A)

Spritemaps_Torizo_24:
    dw $0005
    %spritemapEntry(1, $1FA, $23, 0, 0, 2, 2, $16C)
    %spritemapEntry(1, $01, $02, 0, 0, 2, 2, $10A)
    %spritemapEntry(0, $02, $1F, 0, 1, 2, 2, $166)
    %spritemapEntry(1, $02, $0F, 0, 1, 2, 2, $145)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 2, $124)

Spritemaps_Torizo_25:
    dw $0005
    %spritemapEntry(1, $1F0, $28, 0, 0, 2, 2, $16C)
    %spritemapEntry(0, $1F9, $24, 0, 1, 2, 2, $166)
    %spritemapEntry(1, $1F9, $14, 0, 1, 2, 2, $145)
    %spritemapEntry(1, $1FC, $05, 0, 0, 2, 2, $108)
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 2, $128)

Spritemaps_Torizo_26:
    dw $0005
    %spritemapEntry(1, $1E6, $23, 0, 0, 2, 2, $16C)
    %spritemapEntry(1, $1F8, $06, 0, 0, 2, 2, $106)
    %spritemapEntry(1, $1EC, $1B, 0, 1, 2, 2, $158)
    %spritemapEntry(1, $1F4, $13, 0, 1, 2, 2, $147)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 2, $126)

Spritemaps_Torizo_27:
    dw $0005
    %spritemapEntry(1, $1DC, $19, 0, 0, 2, 2, $16C)
    %spritemapEntry(1, $1F4, $05, 0, 1, 2, 2, $108)
    %spritemapEntry(0, $1E4, $16, 0, 1, 2, 2, $15C)
    %spritemapEntry(1, $1EC, $0E, 0, 1, 2, 2, $14A)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 2, $128)

Spritemaps_Torizo_28:
    dw $0007
    %spritemapEntry(1, $1EF, $02, 0, 1, 2, 2, $10A)
    %spritemapEntry(0, $1CB, $0B, 0, 1, 2, 2, $18F)
    %spritemapEntry(0, $1D3, $0B, 0, 1, 2, 2, $18E)
    %spritemapEntry(0, $1DA, $0B, 0, 1, 2, 2, $14F)
    %spritemapEntry(0, $1E2, $0B, 0, 1, 2, 2, $14E)
    %spritemapEntry(0, $1EA, $0B, 0, 1, 2, 2, $14D)
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 2, $124)

Spritemaps_Torizo_29:
    dw $0005
    %spritemapEntry(1, $1D3, $F4, 1, 1, 2, 2, $16E)
    %spritemapEntry(1, $1EF, $02, 0, 1, 2, 2, $10A)
    %spritemapEntry(1, $1DB, $FA, 1, 1, 2, 2, $158)
    %spritemapEntry(1, $1E3, $02, 1, 1, 2, 2, $147)
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 2, $124)

Spritemaps_Torizo_2A:
    dw $0007
    %spritemapEntry(0, $1E6, $DD, 1, 0, 2, 2, $17B)
    %spritemapEntry(0, $1E6, $E5, 1, 0, 2, 2, $16B)
    %spritemapEntry(1, $1EA, $F8, 0, 1, 2, 2, $10E)
    %spritemapEntry(0, $1E6, $EB, 1, 1, 2, 2, $164)
    %spritemapEntry(0, $1E6, $F3, 1, 1, 2, 2, $154)
    %spritemapEntry(0, $1E6, $FB, 1, 1, 2, 2, $144)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 2, $12A)

Spritemaps_Torizo_2B:
    dw $0018
    %spritemapEntry(1, $1EE, $F3, 0, 0, 2, 1, $130)
    %spritemapEntry(1, $1F9, $FD, 0, 0, 2, 1, $1A9)
    %spritemapEntry(0, $1F9, $0D, 0, 0, 2, 1, $1BB)
    %spritemapEntry(0, $1F1, $0D, 0, 0, 2, 1, $1AF)
    %spritemapEntry(1, $1F1, $FD, 0, 0, 2, 1, $1A8)
    %spritemapEntry(1, $1FA, $15, 0, 0, 2, 1, $18A)
    %spritemapEntry(1, $1F2, $0D, 0, 0, 2, 1, $179)
    %spritemapEntry(0, $05, $20, 0, 0, 2, 1, $162)
    %spritemapEntry(0, $1FD, $20, 0, 0, 2, 1, $161)
    %spritemapEntry(0, $1F5, $20, 0, 0, 2, 1, $160)
    %spritemapEntry(1, $1F5, $FD, 0, 0, 2, 2, $1A9)
    %spritemapEntry(0, $1F5, $0D, 0, 0, 2, 2, $1BB)
    %spritemapEntry(0, $1ED, $0D, 0, 0, 2, 2, $1AF)
    %spritemapEntry(1, $1ED, $FD, 0, 0, 2, 2, $1A8)
    %spritemapEntry(1, $1F6, $15, 0, 0, 2, 2, $18A)
    %spritemapEntry(1, $1EE, $0D, 0, 0, 2, 2, $179)
    %spritemapEntry(0, $01, $20, 0, 0, 2, 2, $162)
    %spritemapEntry(0, $1F9, $20, 0, 0, 2, 2, $161)
    %spritemapEntry(0, $1F1, $20, 0, 0, 2, 2, $160)
    %spritemapEntry(1, $1EE, $E3, 0, 0, 2, 1, $110)
    %spritemapEntry(1, $1FE, $FB, 0, 0, 2, 1, $142)
    %spritemapEntry(1, $1FE, $EB, 0, 0, 2, 1, $122)
    %spritemapEntry(1, $1FE, $DB, 0, 0, 2, 1, $102)
    %spritemapEntry(1, $1EE, $DB, 0, 0, 2, 1, $100)

Spritemaps_Torizo_2C:
    dw $0013
    %spritemapEntry(1, $1EE, $F2, 0, 0, 2, 1, $130)
    %spritemapEntry(0, $1FC, $0F, 0, 0, 2, 1, $1AE)
    %spritemapEntry(0, $1F4, $0F, 0, 0, 2, 1, $1AD)
    %spritemapEntry(1, $1F4, $FF, 0, 0, 2, 1, $1A6)
    %spritemapEntry(1, $02, $22, 0, 0, 2, 1, $1A0)
    %spritemapEntry(1, $1FD, $19, 0, 0, 2, 1, $18A)
    %spritemapEntry(1, $1F5, $11, 0, 0, 2, 1, $179)
    %spritemapEntry(1, $1EE, $FA, 0, 0, 2, 1, $140)
    %spritemapEntry(1, $1EE, $E2, 0, 0, 2, 1, $110)
    %spritemapEntry(1, $1FE, $FA, 0, 0, 2, 1, $142)
    %spritemapEntry(1, $1FE, $EA, 0, 0, 2, 1, $122)
    %spritemapEntry(1, $1FE, $DA, 0, 0, 2, 1, $102)
    %spritemapEntry(1, $1EE, $DA, 0, 0, 2, 1, $100)
    %spritemapEntry(0, $1F8, $10, 0, 1, 2, 2, $1AC)
    %spritemapEntry(0, $00, $10, 0, 1, 2, 2, $1AB)
    %spritemapEntry(1, $1F8, $00, 0, 1, 2, 2, $1A4)
    %spritemapEntry(1, $09, $24, 0, 0, 2, 2, $1A0)
    %spritemapEntry(1, $04, $1B, 0, 0, 2, 2, $18A)
    %spritemapEntry(1, $1FC, $13, 0, 0, 2, 2, $179)

Spritemaps_Torizo_2D:
    dw $0015
    %spritemapEntry(1, $1EE, $F2, 0, 0, 2, 1, $130)
    %spritemapEntry(1, $03, $27, 0, 0, 2, 1, $1A2)
    %spritemapEntry(1, $06, $27, 0, 0, 2, 1, $1A2)
    %spritemapEntry(0, $1F8, $10, 0, 0, 2, 1, $1AB)
    %spritemapEntry(0, $00, $10, 0, 0, 2, 1, $1AC)
    %spritemapEntry(1, $1F8, $00, 0, 0, 2, 1, $1A4)
    %spritemapEntry(1, $1FD, $13, 0, 0, 2, 1, $177)
    %spritemapEntry(0, $05, $23, 0, 0, 2, 1, $198)
    %spritemapEntry(0, $1FD, $23, 0, 0, 2, 1, $197)
    %spritemapEntry(0, $1FB, $10, 0, 0, 2, 2, $1AB)
    %spritemapEntry(0, $03, $10, 0, 0, 2, 2, $1AC)
    %spritemapEntry(1, $1FB, $00, 0, 0, 2, 2, $1A4)
    %spritemapEntry(1, $00, $13, 0, 0, 2, 2, $177)
    %spritemapEntry(0, $08, $23, 0, 0, 2, 2, $198)
    %spritemapEntry(0, $00, $23, 0, 0, 2, 2, $197)
    %spritemapEntry(1, $1EE, $FA, 0, 0, 2, 1, $140)
    %spritemapEntry(1, $1EE, $E2, 0, 0, 2, 1, $110)
    %spritemapEntry(1, $1FE, $FA, 0, 0, 2, 1, $142)
    %spritemapEntry(1, $1FE, $EA, 0, 0, 2, 1, $122)
    %spritemapEntry(1, $1FE, $DA, 0, 0, 2, 1, $102)
    %spritemapEntry(1, $1EE, $DA, 0, 0, 2, 1, $100)

Spritemaps_Torizo_2E:
    dw $0018
    %spritemapEntry(0, $1A, $28, 0, 0, 2, 2, $162)
    %spritemapEntry(0, $12, $28, 0, 0, 2, 2, $161)
    %spritemapEntry(0, $0A, $28, 0, 0, 2, 2, $160)
    %spritemapEntry(0, $1EB, $28, 0, 0, 2, 1, $162)
    %spritemapEntry(0, $1E3, $28, 0, 0, 2, 1, $161)
    %spritemapEntry(0, $1DB, $28, 0, 0, 2, 1, $160)
    %spritemapEntry(1, $1F7, $FE, 0, 0, 2, 1, $1A9)
    %spritemapEntry(0, $1F7, $0E, 0, 0, 2, 1, $1BB)
    %spritemapEntry(0, $1EF, $0E, 0, 0, 2, 1, $1AF)
    %spritemapEntry(1, $1EF, $FE, 0, 0, 2, 1, $1A8)
    %spritemapEntry(0, $1EF, $22, 0, 0, 2, 1, $194)
    %spritemapEntry(0, $1E7, $22, 0, 0, 2, 1, $193)
    %spritemapEntry(1, $1E7, $12, 0, 0, 2, 1, $173)
    %spritemapEntry(0, $1FD, $10, 0, 1, 2, 2, $1AE)
    %spritemapEntry(0, $05, $10, 0, 1, 2, 2, $1AD)
    %spritemapEntry(1, $1FD, $00, 0, 1, 2, 2, $1A6)
    %spritemapEntry(1, $0F, $1C, 0, 0, 2, 2, $18A)
    %spritemapEntry(1, $07, $14, 0, 0, 2, 2, $179)
    %spritemapEntry(1, $1FE, $F9, 0, 0, 2, 1, $142)
    %spritemapEntry(1, $1EE, $F9, 0, 0, 2, 1, $140)
    %spritemapEntry(1, $1FE, $E9, 0, 0, 2, 1, $122)
    %spritemapEntry(1, $1EE, $E9, 0, 0, 2, 1, $120)
    %spritemapEntry(1, $1FE, $D9, 0, 0, 2, 1, $102)
    %spritemapEntry(1, $1EE, $D9, 0, 0, 2, 1, $100)

Spritemaps_Torizo_2F:
    dw $0018
    %spritemapEntry(0, $1A, $28, 0, 0, 2, 1, $162)
    %spritemapEntry(0, $12, $28, 0, 0, 2, 1, $161)
    %spritemapEntry(0, $0A, $28, 0, 0, 2, 1, $160)
    %spritemapEntry(0, $1FD, $10, 0, 1, 2, 1, $1AE)
    %spritemapEntry(0, $05, $10, 0, 1, 2, 1, $1AD)
    %spritemapEntry(1, $1FD, $00, 0, 1, 2, 1, $1A6)
    %spritemapEntry(1, $0F, $1C, 0, 0, 2, 1, $18A)
    %spritemapEntry(1, $07, $14, 0, 0, 2, 1, $179)
    %spritemapEntry(0, $1EB, $28, 0, 0, 2, 2, $162)
    %spritemapEntry(0, $1E3, $28, 0, 0, 2, 2, $161)
    %spritemapEntry(0, $1DB, $28, 0, 0, 2, 2, $160)
    %spritemapEntry(1, $1F7, $FE, 0, 0, 2, 2, $1A9)
    %spritemapEntry(0, $1F7, $0E, 0, 0, 2, 2, $1BB)
    %spritemapEntry(0, $1EF, $0E, 0, 0, 2, 2, $1AF)
    %spritemapEntry(1, $1EF, $FE, 0, 0, 2, 2, $1A8)
    %spritemapEntry(0, $1EF, $22, 0, 0, 2, 2, $194)
    %spritemapEntry(0, $1E7, $22, 0, 0, 2, 2, $193)
    %spritemapEntry(1, $1E7, $12, 0, 0, 2, 2, $173)
    %spritemapEntry(1, $1FE, $F9, 0, 0, 2, 1, $142)
    %spritemapEntry(1, $1EE, $F9, 0, 0, 2, 1, $140)
    %spritemapEntry(1, $1FE, $E9, 0, 0, 2, 1, $122)
    %spritemapEntry(1, $1EE, $E9, 0, 0, 2, 1, $120)
    %spritemapEntry(1, $1FE, $D9, 0, 0, 2, 1, $102)
    %spritemapEntry(1, $1EE, $D9, 0, 0, 2, 1, $100)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemaps_Torizo_AA9766:
    dw $0006
    %spritemapEntry(1, $00, $0C, 0, 0, 2, 1, $142)
    %spritemapEntry(1, $1F0, $0C, 0, 0, 2, 1, $140)
    %spritemapEntry(1, $00, $FC, 0, 0, 2, 1, $122)
    %spritemapEntry(1, $1F0, $FC, 0, 0, 2, 1, $120)
    %spritemapEntry(1, $00, $EC, 0, 0, 2, 1, $102)
    %spritemapEntry(1, $1F0, $EC, 0, 0, 2, 1, $100)
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemaps_Torizo_30:
    dw $0004
    %spritemapEntry(0, $1EC, $F4, 0, 1, 2, 1, $1CB)
    %spritemapEntry(0, $1F4, $F4, 0, 1, 2, 1, $1CA)
    %spritemapEntry(1, $1FC, $F4, 0, 1, 2, 1, $1C8)
    %spritemapEntry(1, $1FC, $04, 0, 1, 2, 1, $1E8)

Spritemaps_Torizo_31:
    dw $0004
    %spritemapEntry(0, $00, $04, 0, 1, 2, 1, $1DB)
    %spritemapEntry(0, $08, $04, 0, 1, 2, 1, $1DA)
    %spritemapEntry(1, $1F0, $F4, 0, 1, 2, 1, $1C6)
    %spritemapEntry(1, $00, $F4, 0, 1, 2, 1, $1C4)

Spritemaps_Torizo_32:
    dw $0003
    %spritemapEntry(1, $08, $FC, 0, 1, 2, 1, $1C0)
    %spritemapEntry(1, $1F0, $F4, 0, 1, 2, 1, $1C6)
    %spritemapEntry(1, $00, $F4, 0, 1, 2, 1, $1C4)

Spritemaps_Torizo_33:
    dw $0003
    %spritemapEntry(1, $08, $FC, 0, 1, 2, 1, $1C2)
    %spritemapEntry(1, $1F0, $F4, 0, 1, 2, 1, $1C6)
    %spritemapEntry(1, $00, $F4, 0, 1, 2, 1, $1C4)

Spritemaps_Torizo_34:
    dw $0003
    %spritemapEntry(1, $08, $FC, 0, 1, 2, 1, $1E0)
    %spritemapEntry(1, $1F0, $F4, 0, 1, 2, 1, $1C6)
    %spritemapEntry(1, $00, $F4, 0, 1, 2, 1, $1C4)

Spritemaps_Torizo_35:
    dw $0008
    %spritemapEntry(0, $18, $F4, 0, 1, 2, 1, $172)
    %spritemapEntry(0, $10, $F4, 0, 1, 2, 1, $171)
    %spritemapEntry(0, $08, $0C, 0, 1, 2, 1, $1F2)
    %spritemapEntry(0, $08, $04, 0, 1, 2, 1, $1F3)
    %spritemapEntry(0, $08, $FC, 0, 1, 2, 1, $1E3)
    %spritemapEntry(0, $10, $FC, 0, 1, 2, 1, $1E2)
    %spritemapEntry(1, $1F0, $F4, 0, 1, 2, 1, $1C6)
    %spritemapEntry(1, $00, $F4, 0, 1, 2, 1, $1C4)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemaps_Torizo_AA980F:
    dw $0013
    %spritemapEntry(0, $1F5, $10, 0, 0, 2, 1, $14C)
    %spritemapEntry(0, $03, $10, 0, 1, 2, 1, $14C)
    %spritemapEntry(0, $1FC, $F8, 0, 1, 2, 1, $15F)
    %spritemapEntry(0, $1F8, $D0, 0, 0, 2, 1, $19F)
    %spritemapEntry(0, $1F5, $20, 0, 0, 2, 1, $1DF)
    %spritemapEntry(0, $1F5, $18, 0, 0, 2, 1, $1CF)
    %spritemapEntry(0, $1F5, $08, 0, 0, 2, 1, $19E)
    %spritemapEntry(0, $1F6, $00, 0, 0, 2, 1, $1DE)
    %spritemapEntry(0, $1F7, $F8, 0, 0, 2, 1, $1CE)
    %spritemapEntry(1, $1F0, $E8, 0, 0, 2, 1, $1E6)
    %spritemapEntry(1, $1F0, $D8, 0, 0, 2, 1, $1E4)
    %spritemapEntry(0, $00, $D0, 0, 1, 2, 1, $19F)
    %spritemapEntry(0, $03, $20, 0, 1, 2, 1, $1DF)
    %spritemapEntry(0, $03, $18, 0, 1, 2, 1, $1CF)
    %spritemapEntry(0, $03, $08, 0, 1, 2, 1, $19E)
    %spritemapEntry(0, $02, $00, 0, 1, 2, 1, $1DE)
    %spritemapEntry(0, $01, $F8, 0, 1, 2, 1, $1CE)
    %spritemapEntry(1, $00, $E8, 0, 1, 2, 1, $1E6)
    %spritemapEntry(1, $00, $D8, 0, 1, 2, 1, $1E4)

UNUSED_Spritemaps_Torizo_AA9870:
    dw $001B
    %spritemapEntry(0, $00, $F0, 0, 1, 2, 1, $1DC)
    %spritemapEntry(0, $00, $E8, 0, 1, 2, 1, $1CC)
    %spritemapEntry(0, $1F8, $F0, 0, 0, 2, 1, $1DC)
    %spritemapEntry(0, $1F8, $E8, 0, 0, 2, 1, $1CC)
    %spritemapEntry(0, $03, $10, 0, 1, 2, 1, $14C)
    %spritemapEntry(0, $1F5, $10, 0, 0, 2, 1, $14C)
    %spritemapEntry(0, $1F0, $E0, 0, 0, 2, 1, $1F4)
    %spritemapEntry(0, $1F0, $D8, 0, 0, 2, 1, $1E4)
    %spritemapEntry(0, $00, $E0, 0, 1, 2, 1, $1DD)
    %spritemapEntry(0, $00, $D8, 0, 1, 2, 1, $1CD)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 2, 1, $1DD)
    %spritemapEntry(0, $1F8, $D8, 0, 0, 2, 1, $1CD)
    %spritemapEntry(0, $08, $E0, 0, 1, 2, 1, $1F4)
    %spritemapEntry(0, $08, $D8, 0, 1, 2, 1, $1E4)
    %spritemapEntry(0, $1FC, $F8, 0, 1, 2, 1, $15F)
    %spritemapEntry(0, $1F5, $20, 0, 0, 2, 1, $1DF)
    %spritemapEntry(0, $1F5, $18, 0, 0, 2, 1, $1CF)
    %spritemapEntry(0, $1F5, $08, 0, 0, 2, 1, $19E)
    %spritemapEntry(0, $1F6, $00, 0, 0, 2, 1, $1DE)
    %spritemapEntry(0, $1F7, $F8, 0, 0, 2, 1, $1CE)
    %spritemapEntry(1, $1F0, $E8, 0, 0, 2, 1, $1E6)
    %spritemapEntry(0, $03, $20, 0, 1, 2, 1, $1DF)
    %spritemapEntry(0, $03, $18, 0, 1, 2, 1, $1CF)
    %spritemapEntry(0, $03, $08, 0, 1, 2, 1, $19E)
    %spritemapEntry(0, $02, $00, 0, 1, 2, 1, $1DE)
    %spritemapEntry(0, $01, $F8, 0, 1, 2, 1, $1CE)
    %spritemapEntry(1, $00, $E8, 0, 1, 2, 1, $1E6)

UNUSED_Spritemaps_Torizo_AA98F9:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 1, 2, 5, $170)

UNUSED_Spritemaps_Torizo_AA9900:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 1, 2, 5, $163)

UNUSED_Spritemaps_Torizo_AA9907:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 1, 2, 5, $167)

UNUSED_Spritemaps_Torizo_AA990E:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 1, 2, 5, $16A)

UNUSED_Spritemaps_Torizo_AA9915:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 3, $12C)

UNUSED_Spritemaps_Torizo_AA991C:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 5, $12E)

UNUSED_Spritemaps_Torizo_AA9923:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 1, $104)

UNUSED_Spritemaps_Torizo_AA992A:
    dw $0006
    %spritemapEntry(0, $1F8, $08, 1, 1, 2, 5, $152)
    %spritemapEntry(0, $00, $08, 1, 0, 2, 5, $152)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 5, $192)
    %spritemapEntry(0, $1F8, $F0, 0, 0, 2, 5, $182)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 5, $192)
    %spritemapEntry(0, $00, $F0, 0, 1, 2, 5, $182)
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemaps_Torizo_36:
    dw $001A
    %spritemapEntry(0, $0F, $FA, 0, 1, 2, 1, $1FB)
    %spritemapEntry(0, $17, $FA, 0, 1, 2, 1, $1FA)
    %spritemapEntry(0, $17, $FA, 0, 1, 2, 1, $1FA)
    %spritemapEntry(1, $1F4, $EE, 0, 1, 2, 1, $128)
    %spritemapEntry(1, $1F8, $FB, 0, 0, 2, 1, $108)
    %spritemapEntry(0, $06, $15, 0, 1, 2, 1, $162)
    %spritemapEntry(0, $0E, $15, 0, 1, 2, 1, $161)
    %spritemapEntry(0, $16, $15, 0, 1, 2, 1, $160)
    %spritemapEntry(1, $09, $F7, 1, 0, 2, 1, $158)
    %spritemapEntry(1, $01, $FF, 1, 0, 2, 1, $147)
    %spritemapEntry(0, $1FF, $12, 0, 1, 2, 1, $194)
    %spritemapEntry(0, $07, $12, 0, 1, 2, 1, $193)
    %spritemapEntry(1, $1FF, $02, 0, 1, 2, 1, $173)
    %spritemapEntry(0, $1F3, $16, 0, 1, 2, 1, $1EF)
    %spritemapEntry(0, $1EB, $16, 0, 1, 2, 1, $1FC)
    %spritemapEntry(0, $1EB, $0E, 0, 1, 2, 1, $1FF)
    %spritemapEntry(1, $1F3, $06, 0, 1, 2, 1, $1ED)
    %spritemapEntry(0, $1F1, $E3, 0, 1, 2, 1, $1CB)
    %spritemapEntry(0, $1F9, $E3, 0, 1, 2, 1, $1CA)
    %spritemapEntry(1, $01, $E3, 0, 1, 2, 1, $1C8)
    %spritemapEntry(1, $01, $F3, 0, 1, 2, 1, $1E8)
    %spritemapEntry(1, $1E8, $06, 0, 1, 2, 1, $142)
    %spritemapEntry(1, $1F8, $06, 0, 1, 2, 1, $140)
    %spritemapEntry(1, $1E8, $F6, 0, 1, 2, 1, $122)
    %spritemapEntry(1, $1F8, $F6, 0, 1, 2, 1, $120)
    %spritemapEntry(1, $1E8, $E6, 0, 1, 2, 1, $102)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemaps_Torizo_UnusedEntry_AA99CE:
; Missing count
    dw $81F8
    db $E6
    dw $6300
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemaps_Torizo_37:
    dw $001A
    %spritemapEntry(1, $1F3, $F9, 0, 1, 2, 1, $106)
    %spritemapEntry(1, $1F3, $EC, 0, 1, 2, 1, $126)
    %spritemapEntry(0, $15, $03, 0, 0, 2, 1, $18F)
    %spritemapEntry(0, $0D, $03, 0, 0, 2, 1, $18E)
    %spritemapEntry(0, $09, $04, 0, 0, 2, 1, $14F)
    %spritemapEntry(0, $01, $04, 0, 0, 2, 1, $14E)
    %spritemapEntry(0, $1F9, $04, 0, 0, 2, 1, $14D)
    %spritemapEntry(0, $1FD, $10, 0, 1, 2, 1, $196)
    %spritemapEntry(0, $05, $10, 0, 1, 2, 1, $195)
    %spritemapEntry(1, $1FD, $00, 0, 1, 2, 1, $175)
    %spritemapEntry(0, $1F6, $01, 1, 1, 2, 1, $1AE)
    %spritemapEntry(0, $1FE, $01, 1, 1, 2, 1, $1AD)
    %spritemapEntry(1, $1F6, $09, 1, 1, 2, 1, $1A6)
    %spritemapEntry(0, $1FD, $15, 0, 1, 2, 1, $162)
    %spritemapEntry(0, $05, $15, 0, 1, 2, 1, $161)
    %spritemapEntry(0, $0D, $15, 0, 1, 2, 1, $160)
    %spritemapEntry(0, $1F2, $E4, 0, 1, 2, 1, $1CB)
    %spritemapEntry(0, $1FA, $E4, 0, 1, 2, 1, $1CA)
    %spritemapEntry(1, $02, $E4, 0, 1, 2, 1, $1C8)
    %spritemapEntry(1, $02, $F4, 0, 1, 2, 1, $1E8)
    %spritemapEntry(1, $1E9, $07, 0, 1, 2, 1, $142)
    %spritemapEntry(1, $1F9, $07, 0, 1, 2, 1, $140)
    %spritemapEntry(1, $1E9, $F7, 0, 1, 2, 1, $122)
    %spritemapEntry(1, $1F9, $F7, 0, 1, 2, 1, $120)
    %spritemapEntry(1, $1E9, $E7, 0, 1, 2, 1, $102)
    %spritemapEntry(1, $1F9, $E7, 0, 1, 2, 1, $100)

Spritemaps_Torizo_38:
    dw $001B
    %spritemapEntry(1, $09, $0D, 0, 0, 2, 1, $16C)
    %spritemapEntry(1, $1F6, $F4, 0, 1, 2, 1, $106)
    %spritemapEntry(1, $1F6, $E7, 0, 1, 2, 1, $126)
    %spritemapEntry(1, $02, $07, 0, 0, 2, 1, $158)
    %spritemapEntry(1, $1FB, $FF, 0, 0, 2, 1, $147)
    %spritemapEntry(0, $1FD, $16, 0, 1, 2, 1, $198)
    %spritemapEntry(0, $05, $16, 0, 1, 2, 1, $197)
    %spritemapEntry(1, $1FD, $06, 0, 1, 2, 1, $177)
    %spritemapEntry(0, $1F7, $1B, 0, 1, 2, 1, $162)
    %spritemapEntry(0, $1FF, $1B, 0, 1, 2, 1, $161)
    %spritemapEntry(0, $07, $1B, 0, 1, 2, 1, $160)
    %spritemapEntry(0, $1F1, $0B, 1, 1, 2, 1, $1EC)
    %spritemapEntry(0, $1F9, $0B, 1, 1, 2, 1, $1EB)
    %spritemapEntry(0, $01, $0B, 1, 1, 2, 1, $1EA)
    %spritemapEntry(0, $1F1, $03, 0, 1, 2, 1, $1EC)
    %spritemapEntry(0, $1F9, $03, 0, 1, 2, 1, $1EB)
    %spritemapEntry(0, $01, $03, 0, 1, 2, 1, $1EA)
    %spritemapEntry(0, $1F2, $DE, 0, 1, 2, 1, $1CB)
    %spritemapEntry(0, $1FA, $DE, 0, 1, 2, 1, $1CA)
    %spritemapEntry(1, $02, $DE, 0, 1, 2, 1, $1C8)
    %spritemapEntry(1, $02, $EE, 0, 1, 2, 1, $1E8)
    %spritemapEntry(1, $1E9, $01, 0, 1, 2, 1, $142)
    %spritemapEntry(1, $1F9, $01, 0, 1, 2, 1, $140)
    %spritemapEntry(1, $1E9, $F1, 0, 1, 2, 1, $122)
    %spritemapEntry(1, $1F9, $F1, 0, 1, 2, 1, $120)
    %spritemapEntry(1, $1E9, $E1, 0, 1, 2, 1, $102)
    %spritemapEntry(1, $1F9, $E1, 0, 1, 2, 1, $100)

Spritemaps_Torizo_39:
    dw $0019
    %spritemapEntry(1, $1F5, $F1, 0, 1, 2, 1, $106)
    %spritemapEntry(1, $1F5, $E4, 0, 1, 2, 1, $126)
    %spritemapEntry(1, $0A, $0A, 0, 0, 2, 1, $16C)
    %spritemapEntry(1, $03, $05, 0, 0, 2, 1, $158)
    %spritemapEntry(1, $1FC, $FD, 0, 0, 2, 1, $147)
    %spritemapEntry(1, $1EE, $FB, 0, 1, 2, 1, $1A9)
    %spritemapEntry(0, $1F6, $0B, 0, 1, 2, 1, $1BB)
    %spritemapEntry(0, $1FE, $0B, 0, 1, 2, 1, $1AF)
    %spritemapEntry(1, $1F6, $FB, 0, 1, 2, 1, $1A8)
    %spritemapEntry(0, $1F2, $D9, 0, 1, 2, 1, $1CB)
    %spritemapEntry(0, $1FA, $D9, 0, 1, 2, 1, $1CA)
    %spritemapEntry(1, $02, $D9, 0, 1, 2, 1, $1C8)
    %spritemapEntry(1, $02, $E9, 0, 1, 2, 1, $1E8)
    %spritemapEntry(1, $1E9, $FC, 0, 1, 2, 1, $142)
    %spritemapEntry(1, $1F9, $FC, 0, 1, 2, 1, $140)
    %spritemapEntry(1, $1E9, $EC, 0, 1, 2, 1, $122)
    %spritemapEntry(1, $1F9, $EC, 0, 1, 2, 1, $120)
    %spritemapEntry(1, $1E9, $DC, 0, 1, 2, 1, $102)
    %spritemapEntry(1, $1F9, $DC, 0, 1, 2, 1, $100)
    %spritemapEntry(0, $1F7, $1B, 0, 1, 2, 1, $198)
    %spritemapEntry(0, $1FF, $1B, 0, 1, 2, 1, $197)
    %spritemapEntry(1, $1F7, $0B, 0, 1, 2, 1, $177)
    %spritemapEntry(0, $1F0, $21, 0, 1, 2, 1, $162)
    %spritemapEntry(0, $1F8, $21, 0, 1, 2, 1, $161)
    %spritemapEntry(0, $00, $21, 0, 1, 2, 1, $160)

Spritemaps_Torizo_3A:
    dw $0019
    %spritemapEntry(0, $1FB, $D3, 0, 1, 2, 1, $1CB)
    %spritemapEntry(0, $03, $D3, 0, 1, 2, 1, $1CA)
    %spritemapEntry(1, $0B, $E3, 0, 1, 2, 1, $1E8)
    %spritemapEntry(1, $0B, $D3, 0, 1, 2, 1, $1C8)
    %spritemapEntry(0, $1F7, $0F, 0, 1, 2, 1, $1AC)
    %spritemapEntry(0, $1FF, $0F, 0, 1, 2, 1, $1AB)
    %spritemapEntry(1, $1F7, $FF, 0, 1, 2, 1, $1A4)
    %spritemapEntry(0, $1F5, $28, 0, 1, 2, 1, $162)
    %spritemapEntry(0, $1FD, $28, 0, 1, 2, 1, $161)
    %spritemapEntry(0, $05, $28, 0, 1, 2, 1, $160)
    %spritemapEntry(0, $1F6, $21, 0, 1, 2, 1, $196)
    %spritemapEntry(0, $1FE, $21, 0, 1, 2, 1, $195)
    %spritemapEntry(1, $1F6, $11, 0, 1, 2, 1, $175)
    %spritemapEntry(0, $1FD, $0E, 0, 1, 2, 2, $1AE)
    %spritemapEntry(0, $05, $0E, 0, 1, 2, 2, $1AD)
    %spritemapEntry(1, $1FD, $FE, 0, 1, 2, 2, $1A6)
    %spritemapEntry(1, $1F3, $15, 0, 1, 2, 2, $18A)
    %spritemapEntry(1, $1FB, $0D, 0, 1, 2, 2, $179)
    %spritemapEntry(1, $1F1, $1F, 0, 1, 2, 2, $1A2)
    %spritemapEntry(1, $1F2, $F7, 0, 1, 2, 1, $142)
    %spritemapEntry(1, $02, $F7, 0, 1, 2, 1, $140)
    %spritemapEntry(1, $1F2, $E7, 0, 1, 2, 1, $122)
    %spritemapEntry(1, $02, $E7, 0, 1, 2, 1, $120)
    %spritemapEntry(1, $1F2, $D7, 0, 1, 2, 1, $102)
    %spritemapEntry(1, $02, $D7, 0, 1, 2, 1, $100)

Spritemaps_Torizo_3B:
    dw $001A
    %spritemapEntry(0, $1FB, $D4, 0, 1, 2, 1, $1CB)
    %spritemapEntry(0, $03, $D4, 0, 1, 2, 1, $1CA)
    %spritemapEntry(1, $0B, $E4, 0, 1, 2, 1, $1E8)
    %spritemapEntry(1, $0B, $D4, 0, 1, 2, 1, $1C8)
    %spritemapEntry(0, $1FC, $0E, 0, 0, 2, 1, $1AE)
    %spritemapEntry(0, $1F4, $0E, 0, 0, 2, 1, $1AD)
    %spritemapEntry(1, $1F4, $FE, 0, 0, 2, 1, $1A6)
    %spritemapEntry(0, $1E5, $28, 0, 1, 2, 1, $162)
    %spritemapEntry(0, $1ED, $28, 0, 1, 2, 1, $161)
    %spritemapEntry(0, $1F5, $28, 0, 1, 2, 1, $160)
    %spritemapEntry(0, $1EB, $22, 0, 1, 2, 1, $198)
    %spritemapEntry(0, $1F3, $22, 0, 1, 2, 1, $197)
    %spritemapEntry(1, $1EB, $12, 0, 1, 2, 1, $177)
    %spritemapEntry(1, $1FA, $FC, 0, 1, 2, 2, $1A9)
    %spritemapEntry(0, $02, $0C, 0, 1, 2, 2, $1BB)
    %spritemapEntry(0, $0A, $0C, 0, 1, 2, 2, $1AF)
    %spritemapEntry(1, $02, $FC, 0, 1, 2, 2, $1A8)
    %spritemapEntry(1, $1FE, $1F, 0, 1, 2, 2, $1A2)
    %spritemapEntry(0, $09, $1F, 0, 1, 2, 2, $197)
    %spritemapEntry(1, $01, $0F, 0, 1, 2, 2, $177)
    %spritemapEntry(1, $1F2, $F8, 0, 1, 2, 1, $142)
    %spritemapEntry(1, $02, $F8, 0, 1, 2, 1, $140)
    %spritemapEntry(1, $1F2, $E8, 0, 1, 2, 1, $122)
    %spritemapEntry(1, $02, $E8, 0, 1, 2, 1, $120)
    %spritemapEntry(1, $1F2, $D8, 0, 1, 2, 1, $102)
    %spritemapEntry(1, $02, $D8, 0, 1, 2, 1, $100)

Spritemaps_Torizo_3C:
    dw $001C
    %spritemapEntry(0, $1FB, $D5, 0, 1, 2, 1, $1CB)
    %spritemapEntry(0, $03, $D5, 0, 1, 2, 1, $1CA)
    %spritemapEntry(1, $0B, $E5, 0, 1, 2, 1, $1E8)
    %spritemapEntry(1, $0B, $D5, 0, 1, 2, 1, $1C8)
    %spritemapEntry(0, $1DE, $28, 0, 1, 2, 1, $162)
    %spritemapEntry(0, $1E6, $28, 0, 1, 2, 1, $161)
    %spritemapEntry(0, $1EE, $28, 0, 1, 2, 1, $160)
    %spritemapEntry(0, $1FB, $10, 0, 0, 2, 1, $1AE)
    %spritemapEntry(0, $1F3, $10, 0, 0, 2, 1, $1AD)
    %spritemapEntry(1, $1F3, $00, 0, 0, 2, 1, $1A6)
    %spritemapEntry(1, $1E1, $1C, 0, 1, 2, 1, $18A)
    %spritemapEntry(1, $1E9, $14, 0, 1, 2, 1, $179)
    %spritemapEntry(0, $0D, $28, 0, 1, 2, 2, $162)
    %spritemapEntry(0, $15, $28, 0, 1, 2, 2, $161)
    %spritemapEntry(0, $1D, $28, 0, 1, 2, 2, $160)
    %spritemapEntry(1, $1F9, $FE, 0, 1, 2, 2, $1A9)
    %spritemapEntry(0, $01, $0E, 0, 1, 2, 2, $1BB)
    %spritemapEntry(0, $09, $0E, 0, 1, 2, 2, $1AF)
    %spritemapEntry(1, $01, $FE, 0, 1, 2, 2, $1A8)
    %spritemapEntry(0, $09, $22, 0, 1, 2, 2, $194)
    %spritemapEntry(0, $11, $22, 0, 1, 2, 2, $193)
    %spritemapEntry(1, $09, $12, 0, 1, 2, 2, $173)
    %spritemapEntry(1, $1F2, $F9, 0, 1, 2, 1, $142)
    %spritemapEntry(1, $02, $F9, 0, 1, 2, 1, $140)
    %spritemapEntry(1, $1F2, $E9, 0, 1, 2, 1, $122)
    %spritemapEntry(1, $02, $E9, 0, 1, 2, 1, $120)
    %spritemapEntry(1, $1F2, $D9, 0, 1, 2, 1, $102)
    %spritemapEntry(1, $02, $D9, 0, 1, 2, 1, $100)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemaps_Torizo_AA9CF0:
    dw $0002
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 5, $180)
    %spritemapEntry(0, $00, $FC, 0, 1, 2, 5, $180)

UNUSED_Spritemaps_Torizo_AA9CFC:
    dw $0004
    %spritemapEntry(0, $1F8, $00, 0, 0, 2, 5, $190)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 5, $180)
    %spritemapEntry(0, $00, $00, 0, 1, 2, 5, $190)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 5, $180)

UNUSED_Spritemaps_Torizo_AA9D12:
    dw $0003
    %spritemapEntry(1, $1F8, $F4, 0, 1, 2, 5, $180)
    %spritemapEntry(0, $1F8, $04, 0, 0, 2, 5, $199)
    %spritemapEntry(0, $00, $04, 0, 1, 2, 5, $199)

UNUSED_Spritemaps_Torizo_AA9D23:
    dw $0003
    %spritemapEntry(0, $00, $06, 0, 1, 2, 5, $180)
    %spritemapEntry(0, $1F8, $06, 0, 0, 2, 5, $180)
    %spritemapEntry(1, $1F8, $F2, 0, 0, 2, 5, $12E)
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemaps_Torizo_3D:
    dw $0016
    %spritemapEntry(0, $0D, $28, 0, 1, 2, 1, $162)
    %spritemapEntry(0, $15, $28, 0, 1, 2, 1, $161)
    %spritemapEntry(0, $1D, $28, 0, 1, 2, 1, $160)
    %spritemapEntry(1, $1F9, $FE, 0, 1, 2, 1, $1A9)
    %spritemapEntry(0, $01, $0E, 0, 1, 2, 1, $1BB)
    %spritemapEntry(0, $09, $0E, 0, 1, 2, 1, $1AF)
    %spritemapEntry(1, $01, $FE, 0, 1, 2, 1, $1A8)
    %spritemapEntry(0, $09, $22, 0, 1, 2, 1, $194)
    %spritemapEntry(0, $11, $22, 0, 1, 2, 1, $193)
    %spritemapEntry(1, $09, $12, 0, 1, 2, 1, $173)
    %spritemapEntry(0, $1FC, $0D, 0, 0, 2, 2, $1AE)
    %spritemapEntry(0, $1F4, $0D, 0, 0, 2, 2, $1AD)
    %spritemapEntry(1, $1F4, $FD, 0, 0, 2, 2, $1A6)
    %spritemapEntry(1, $1E3, $16, 0, 1, 2, 2, $18A)
    %spritemapEntry(1, $1EB, $0E, 0, 1, 2, 2, $179)
    %spritemapEntry(1, $1DD, $1F, 0, 1, 2, 2, $1A0)
    %spritemapEntry(1, $1F2, $F9, 0, 1, 2, 1, $142)
    %spritemapEntry(1, $02, $F9, 0, 1, 2, 1, $140)
    %spritemapEntry(1, $1F2, $E9, 0, 1, 2, 1, $122)
    %spritemapEntry(1, $02, $E9, 0, 1, 2, 1, $120)
    %spritemapEntry(1, $1F2, $D9, 0, 1, 2, 1, $102)
    %spritemapEntry(1, $02, $D9, 0, 1, 2, 1, $100)

Spritemaps_Torizo_3E:
    dw $0015
    %spritemapEntry(0, $1FD, $0F, 0, 1, 2, 1, $1AE)
    %spritemapEntry(0, $05, $0F, 0, 1, 2, 1, $1AD)
    %spritemapEntry(1, $1FD, $FF, 0, 1, 2, 1, $1A6)
    %spritemapEntry(0, $08, $28, 0, 1, 2, 1, $162)
    %spritemapEntry(0, $10, $28, 0, 1, 2, 1, $161)
    %spritemapEntry(0, $18, $28, 0, 1, 2, 1, $160)
    %spritemapEntry(0, $04, $23, 0, 1, 2, 1, $194)
    %spritemapEntry(0, $0C, $23, 0, 1, 2, 1, $193)
    %spritemapEntry(1, $04, $13, 0, 1, 2, 1, $173)
    %spritemapEntry(1, $1E7, $1E, 0, 1, 2, 2, $1A0)
    %spritemapEntry(0, $1F9, $10, 0, 1, 2, 2, $1AC)
    %spritemapEntry(0, $01, $10, 0, 1, 2, 2, $1AB)
    %spritemapEntry(1, $1F9, $00, 0, 1, 2, 2, $1A4)
    %spritemapEntry(1, $1EB, $18, 0, 1, 2, 2, $18A)
    %spritemapEntry(1, $1F3, $10, 0, 1, 2, 2, $179)
    %spritemapEntry(1, $1F2, $F8, 0, 1, 2, 1, $142)
    %spritemapEntry(1, $02, $F8, 0, 1, 2, 1, $140)
    %spritemapEntry(1, $1F2, $E8, 0, 1, 2, 1, $122)
    %spritemapEntry(1, $02, $E8, 0, 1, 2, 1, $120)
    %spritemapEntry(1, $1F2, $D8, 0, 1, 2, 1, $102)
    %spritemapEntry(1, $02, $D8, 0, 1, 2, 1, $100)

Spritemaps_Torizo_3F:
    dw $0015
    %spritemapEntry(0, $1F7, $0F, 0, 1, 2, 1, $1AC)
    %spritemapEntry(0, $1FF, $0F, 0, 1, 2, 1, $1AB)
    %spritemapEntry(1, $1F7, $FF, 0, 1, 2, 1, $1A4)
    %spritemapEntry(0, $1F5, $28, 0, 1, 2, 1, $162)
    %spritemapEntry(0, $1FD, $28, 0, 1, 2, 1, $161)
    %spritemapEntry(0, $05, $28, 0, 1, 2, 1, $160)
    %spritemapEntry(0, $1F6, $21, 0, 1, 2, 1, $196)
    %spritemapEntry(0, $1FE, $21, 0, 1, 2, 1, $195)
    %spritemapEntry(1, $1F6, $11, 0, 1, 2, 1, $175)
    %spritemapEntry(0, $1FD, $0E, 0, 1, 2, 2, $1AE)
    %spritemapEntry(0, $05, $0E, 0, 1, 2, 2, $1AD)
    %spritemapEntry(1, $1FD, $FE, 0, 1, 2, 2, $1A6)
    %spritemapEntry(1, $1F3, $15, 0, 1, 2, 2, $18A)
    %spritemapEntry(1, $1FB, $0D, 0, 1, 2, 2, $179)
    %spritemapEntry(1, $1F1, $1F, 0, 1, 2, 2, $1A2)
    %spritemapEntry(1, $1F2, $F7, 0, 1, 2, 1, $142)
    %spritemapEntry(1, $02, $F7, 0, 1, 2, 1, $140)
    %spritemapEntry(1, $1F2, $E7, 0, 1, 2, 1, $122)
    %spritemapEntry(1, $02, $E7, 0, 1, 2, 1, $120)
    %spritemapEntry(1, $1F2, $D7, 0, 1, 2, 1, $102)
    %spritemapEntry(1, $02, $D7, 0, 1, 2, 1, $100)

Spritemaps_Torizo_40:
    dw $0016
    %spritemapEntry(0, $1FC, $0E, 0, 0, 2, 1, $1AE)
    %spritemapEntry(0, $1F4, $0E, 0, 0, 2, 1, $1AD)
    %spritemapEntry(1, $1F4, $FE, 0, 0, 2, 1, $1A6)
    %spritemapEntry(0, $1E5, $28, 0, 1, 2, 1, $162)
    %spritemapEntry(0, $1ED, $28, 0, 1, 2, 1, $161)
    %spritemapEntry(0, $1F5, $28, 0, 1, 2, 1, $160)
    %spritemapEntry(0, $1EB, $22, 0, 1, 2, 1, $198)
    %spritemapEntry(0, $1F3, $22, 0, 1, 2, 1, $197)
    %spritemapEntry(1, $1EB, $12, 0, 1, 2, 1, $177)
    %spritemapEntry(1, $1FA, $FC, 0, 1, 2, 2, $1A9)
    %spritemapEntry(0, $02, $0C, 0, 1, 2, 2, $1BB)
    %spritemapEntry(0, $0A, $0C, 0, 1, 2, 2, $1AF)
    %spritemapEntry(1, $02, $FC, 0, 1, 2, 2, $1A8)
    %spritemapEntry(1, $1FE, $1F, 0, 1, 2, 2, $1A2)
    %spritemapEntry(0, $09, $1F, 0, 1, 2, 2, $197)
    %spritemapEntry(1, $01, $0F, 0, 1, 2, 2, $177)
    %spritemapEntry(1, $1F2, $F8, 0, 1, 2, 1, $142)
    %spritemapEntry(1, $02, $F8, 0, 1, 2, 1, $140)
    %spritemapEntry(1, $1F2, $E8, 0, 1, 2, 1, $122)
    %spritemapEntry(1, $02, $E8, 0, 1, 2, 1, $120)
    %spritemapEntry(1, $1F2, $D8, 0, 1, 2, 1, $102)
    %spritemapEntry(1, $02, $D8, 0, 1, 2, 1, $100)

Spritemaps_Torizo_41:
    dw $0016
    %spritemapEntry(0, $1FC, $0E, 0, 0, 2, 1, $1AE)
    %spritemapEntry(0, $1F4, $0E, 0, 0, 2, 1, $1AD)
    %spritemapEntry(1, $1F4, $FE, 0, 0, 2, 1, $1A6)
    %spritemapEntry(1, $1E3, $17, 0, 1, 2, 1, $18A)
    %spritemapEntry(1, $1EB, $0F, 0, 1, 2, 1, $179)
    %spritemapEntry(1, $1DD, $20, 0, 1, 2, 1, $1A0)
    %spritemapEntry(0, $0D, $28, 0, 1, 2, 2, $162)
    %spritemapEntry(0, $15, $28, 0, 1, 2, 2, $161)
    %spritemapEntry(0, $1D, $28, 0, 1, 2, 2, $160)
    %spritemapEntry(1, $1F9, $FE, 0, 1, 2, 2, $1A9)
    %spritemapEntry(0, $01, $0E, 0, 1, 2, 2, $1BB)
    %spritemapEntry(0, $09, $0E, 0, 1, 2, 2, $1AF)
    %spritemapEntry(1, $01, $FE, 0, 1, 2, 2, $1A8)
    %spritemapEntry(0, $09, $22, 0, 1, 2, 2, $194)
    %spritemapEntry(0, $11, $22, 0, 1, 2, 2, $193)
    %spritemapEntry(1, $09, $12, 0, 1, 2, 2, $173)
    %spritemapEntry(1, $1F2, $F9, 0, 1, 2, 1, $142)
    %spritemapEntry(1, $02, $F9, 0, 1, 2, 1, $140)
    %spritemapEntry(1, $1F2, $E9, 0, 1, 2, 1, $122)
    %spritemapEntry(1, $02, $E9, 0, 1, 2, 1, $120)
    %spritemapEntry(1, $1F2, $D9, 0, 1, 2, 1, $102)
    %spritemapEntry(1, $02, $D9, 0, 1, 2, 1, $100)

Spritemaps_Torizo_42:
    dw $0015
    %spritemapEntry(1, $1E6, $1D, 0, 1, 2, 1, $1A0)
    %spritemapEntry(0, $1F8, $0F, 0, 1, 2, 1, $1AC)
    %spritemapEntry(0, $00, $0F, 0, 1, 2, 1, $1AB)
    %spritemapEntry(1, $1F8, $FF, 0, 1, 2, 1, $1A4)
    %spritemapEntry(1, $1EA, $17, 0, 1, 2, 1, $18A)
    %spritemapEntry(1, $1F2, $0F, 0, 1, 2, 1, $179)
    %spritemapEntry(0, $1FB, $0F, 0, 1, 2, 2, $1AE)
    %spritemapEntry(0, $03, $0F, 0, 1, 2, 2, $1AD)
    %spritemapEntry(1, $1FB, $FF, 0, 1, 2, 2, $1A6)
    %spritemapEntry(0, $06, $28, 0, 1, 2, 2, $162)
    %spritemapEntry(0, $0E, $28, 0, 1, 2, 2, $161)
    %spritemapEntry(0, $16, $28, 0, 1, 2, 2, $160)
    %spritemapEntry(0, $02, $23, 0, 1, 2, 2, $194)
    %spritemapEntry(0, $0A, $23, 0, 1, 2, 2, $193)
    %spritemapEntry(1, $02, $13, 0, 1, 2, 2, $173)
    %spritemapEntry(1, $1F2, $F8, 0, 1, 2, 1, $142)
    %spritemapEntry(1, $02, $F8, 0, 1, 2, 1, $140)
    %spritemapEntry(1, $1F2, $E8, 0, 1, 2, 1, $122)
    %spritemapEntry(1, $02, $E8, 0, 1, 2, 1, $120)
    %spritemapEntry(1, $1F2, $D8, 0, 1, 2, 1, $102)
    %spritemapEntry(1, $02, $D8, 0, 1, 2, 1, $100)

Spritemaps_Torizo_43:
    dw $0015
    %spritemapEntry(0, $1FD, $0E, 0, 1, 2, 1, $1AE)
    %spritemapEntry(0, $05, $0E, 0, 1, 2, 1, $1AD)
    %spritemapEntry(1, $1FD, $FE, 0, 1, 2, 1, $1A6)
    %spritemapEntry(1, $1F3, $15, 0, 1, 2, 1, $18A)
    %spritemapEntry(1, $1FB, $0D, 0, 1, 2, 1, $179)
    %spritemapEntry(1, $1F1, $1F, 0, 1, 2, 1, $1A2)
    %spritemapEntry(0, $1F7, $0F, 0, 1, 2, 2, $1AC)
    %spritemapEntry(0, $1FF, $0F, 0, 1, 2, 2, $1AB)
    %spritemapEntry(1, $1F7, $FF, 0, 1, 2, 2, $1A4)
    %spritemapEntry(0, $1F5, $28, 0, 1, 2, 2, $162)
    %spritemapEntry(0, $1FD, $28, 0, 1, 2, 2, $161)
    %spritemapEntry(0, $05, $28, 0, 1, 2, 2, $160)
    %spritemapEntry(0, $1F6, $21, 0, 1, 2, 2, $196)
    %spritemapEntry(0, $1FE, $21, 0, 1, 2, 2, $195)
    %spritemapEntry(1, $1F6, $11, 0, 1, 2, 2, $175)
    %spritemapEntry(1, $1F2, $F7, 0, 1, 2, 1, $142)
    %spritemapEntry(1, $02, $F7, 0, 1, 2, 1, $140)
    %spritemapEntry(1, $1F2, $E7, 0, 1, 2, 1, $122)
    %spritemapEntry(1, $02, $E7, 0, 1, 2, 1, $120)
    %spritemapEntry(1, $1F2, $D7, 0, 1, 2, 1, $102)
    %spritemapEntry(1, $02, $D7, 0, 1, 2, 1, $100)

Spritemaps_Torizo_44:
    dw $0016
    %spritemapEntry(1, $1F9, $FC, 0, 1, 2, 1, $1A9)
    %spritemapEntry(0, $01, $0C, 0, 1, 2, 1, $1BB)
    %spritemapEntry(0, $09, $0C, 0, 1, 2, 1, $1AF)
    %spritemapEntry(1, $01, $FC, 0, 1, 2, 1, $1A8)
    %spritemapEntry(1, $1FD, $1F, 0, 1, 2, 1, $1A2)
    %spritemapEntry(0, $08, $1F, 0, 1, 2, 1, $197)
    %spritemapEntry(1, $00, $0F, 0, 1, 2, 1, $177)
    %spritemapEntry(0, $1FA, $0E, 0, 0, 2, 2, $1AE)
    %spritemapEntry(0, $1F2, $0E, 0, 0, 2, 2, $1AD)
    %spritemapEntry(1, $1F2, $FE, 0, 0, 2, 2, $1A6)
    %spritemapEntry(0, $1E3, $28, 0, 1, 2, 2, $162)
    %spritemapEntry(0, $1EB, $28, 0, 1, 2, 2, $161)
    %spritemapEntry(0, $1F3, $28, 0, 1, 2, 2, $160)
    %spritemapEntry(0, $1E9, $22, 0, 1, 2, 2, $198)
    %spritemapEntry(0, $1F1, $22, 0, 1, 2, 2, $197)
    %spritemapEntry(1, $1E9, $12, 0, 1, 2, 2, $177)
    %spritemapEntry(1, $1F2, $F8, 0, 1, 2, 1, $142)
    %spritemapEntry(1, $02, $F8, 0, 1, 2, 1, $140)
    %spritemapEntry(1, $1F2, $E8, 0, 1, 2, 1, $122)
    %spritemapEntry(1, $02, $E8, 0, 1, 2, 1, $120)
    %spritemapEntry(1, $1F2, $D8, 0, 1, 2, 1, $102)
    %spritemapEntry(1, $02, $D8, 0, 1, 2, 1, $100)

Spritemaps_Torizo_45:
    dw $0007
    %spritemapEntry(0, $1E8, $25, 0, 0, 2, 1, $17B)
    %spritemapEntry(0, $1E8, $1D, 0, 0, 2, 1, $16B)
    %spritemapEntry(1, $1EB, $FB, 0, 1, 2, 1, $10C)
    %spritemapEntry(0, $1E8, $16, 0, 1, 2, 1, $164)
    %spritemapEntry(0, $1E8, $0E, 0, 1, 2, 1, $154)
    %spritemapEntry(0, $1E8, $06, 0, 1, 2, 1, $144)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 1, $12A)

Spritemaps_Torizo_46:
    dw $0005
    %spritemapEntry(1, $1F6, $23, 0, 1, 2, 1, $16C)
    %spritemapEntry(1, $1EF, $02, 0, 1, 2, 1, $10A)
    %spritemapEntry(0, $1F6, $1F, 0, 0, 2, 1, $166)
    %spritemapEntry(1, $1EE, $0F, 0, 0, 2, 1, $145)
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 1, $124)

Spritemaps_Torizo_47:
    dw $0005
    %spritemapEntry(1, $00, $28, 0, 1, 2, 1, $16C)
    %spritemapEntry(0, $1FF, $24, 0, 0, 2, 1, $166)
    %spritemapEntry(1, $1F7, $14, 0, 0, 2, 1, $145)
    %spritemapEntry(1, $1F4, $05, 0, 1, 2, 1, $108)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 1, $128)

Spritemaps_Torizo_48:
    dw $0005
    %spritemapEntry(1, $09, $24, 0, 1, 2, 1, $16C)
    %spritemapEntry(1, $1F8, $06, 0, 1, 2, 1, $106)
    %spritemapEntry(1, $04, $1B, 0, 0, 2, 1, $158)
    %spritemapEntry(1, $1FC, $13, 0, 0, 2, 1, $147)
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 1, $126)

Spritemaps_Torizo_49:
    dw $0005
    %spritemapEntry(1, $12, $19, 0, 1, 2, 1, $16C)
    %spritemapEntry(1, $1FC, $05, 0, 0, 2, 1, $108)
    %spritemapEntry(0, $14, $16, 0, 0, 2, 1, $15C)
    %spritemapEntry(1, $04, $0E, 0, 0, 2, 1, $14A)
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 1, $128)

Spritemaps_Torizo_4A:
    dw $0007
    %spritemapEntry(1, $01, $02, 0, 0, 2, 1, $10A)
    %spritemapEntry(0, $2A, $0B, 0, 0, 2, 1, $18F)
    %spritemapEntry(0, $22, $0B, 0, 0, 2, 1, $18E)
    %spritemapEntry(0, $1E, $0B, 0, 0, 2, 1, $14F)
    %spritemapEntry(0, $16, $0B, 0, 0, 2, 1, $14E)
    %spritemapEntry(0, $0E, $0B, 0, 0, 2, 1, $14D)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 1, $124)

Spritemaps_Torizo_4B:
    dw $0005
    %spritemapEntry(1, $1C, $F6, 1, 0, 2, 1, $16E)
    %spritemapEntry(1, $01, $02, 0, 0, 2, 1, $10A)
    %spritemapEntry(1, $15, $FA, 1, 0, 2, 1, $158)
    %spritemapEntry(1, $0D, $02, 1, 0, 2, 1, $147)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 1, $124)

Spritemaps_Torizo_4C:
    dw $0007
    %spritemapEntry(0, $12, $DD, 1, 1, 2, 1, $17B)
    %spritemapEntry(0, $12, $E5, 1, 1, 2, 1, $16B)
    %spritemapEntry(1, $06, $F8, 0, 0, 2, 1, $10E)
    %spritemapEntry(0, $12, $EB, 1, 0, 2, 1, $164)
    %spritemapEntry(0, $12, $F3, 1, 0, 2, 1, $154)
    %spritemapEntry(0, $12, $FB, 1, 0, 2, 1, $144)
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 1, $12A)

Spritemaps_Torizo_4D:
    dw $0007
    %spritemapEntry(0, $1E9, $25, 0, 0, 2, 2, $17B)
    %spritemapEntry(0, $1E9, $1D, 0, 0, 2, 2, $16B)
    %spritemapEntry(1, $1EB, $FB, 0, 1, 2, 2, $10C)
    %spritemapEntry(0, $1E8, $16, 0, 1, 2, 2, $164)
    %spritemapEntry(0, $1E8, $0E, 0, 1, 2, 2, $154)
    %spritemapEntry(0, $1E8, $06, 0, 1, 2, 2, $144)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 2, $12A)

Spritemaps_Torizo_4E:
    dw $0005
    %spritemapEntry(1, $1F6, $23, 0, 1, 2, 2, $16C)
    %spritemapEntry(1, $1EF, $02, 0, 1, 2, 2, $10A)
    %spritemapEntry(0, $1F6, $1F, 0, 0, 2, 2, $166)
    %spritemapEntry(1, $1EE, $0F, 0, 0, 2, 2, $145)
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 2, $124)

Spritemaps_Torizo_4F:
    dw $0005
    %spritemapEntry(1, $00, $28, 0, 1, 2, 2, $16C)
    %spritemapEntry(0, $1FF, $24, 0, 0, 2, 2, $166)
    %spritemapEntry(1, $1F7, $14, 0, 0, 2, 2, $145)
    %spritemapEntry(1, $1F4, $05, 0, 1, 2, 2, $108)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 2, $128)

Spritemaps_Torizo_50:
    dw $0005
    %spritemapEntry(1, $0A, $23, 0, 1, 2, 2, $16C)
    %spritemapEntry(1, $1F8, $06, 0, 1, 2, 2, $106)
    %spritemapEntry(1, $04, $1B, 0, 0, 2, 2, $158)
    %spritemapEntry(1, $1FC, $13, 0, 0, 2, 2, $147)
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 2, $126)

Spritemaps_Torizo_51:
    dw $0005
    %spritemapEntry(1, $14, $19, 0, 1, 2, 2, $16C)
    %spritemapEntry(1, $1FC, $05, 0, 0, 2, 2, $108)
    %spritemapEntry(0, $14, $16, 0, 0, 2, 2, $15C)
    %spritemapEntry(1, $04, $0E, 0, 0, 2, 2, $14A)
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 2, $128)

Spritemaps_Torizo_52:
    dw $0007
    %spritemapEntry(1, $01, $02, 0, 0, 2, 2, $10A)
    %spritemapEntry(0, $2D, $0B, 0, 0, 2, 2, $18F)
    %spritemapEntry(0, $25, $0B, 0, 0, 2, 2, $18E)
    %spritemapEntry(0, $1E, $0B, 0, 0, 2, 2, $14F)
    %spritemapEntry(0, $16, $0B, 0, 0, 2, 2, $14E)
    %spritemapEntry(0, $0E, $0B, 0, 0, 2, 2, $14D)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 2, $124)

Spritemaps_Torizo_53:
    dw $0005
    %spritemapEntry(1, $1D, $F4, 1, 0, 2, 2, $16E)
    %spritemapEntry(1, $01, $02, 0, 0, 2, 2, $10A)
    %spritemapEntry(1, $15, $FA, 1, 0, 2, 2, $158)
    %spritemapEntry(1, $0D, $02, 1, 0, 2, 2, $147)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 2, $124)

Spritemaps_Torizo_54:
    dw $0007
    %spritemapEntry(0, $12, $DD, 1, 1, 2, 2, $17B)
    %spritemapEntry(0, $12, $E5, 1, 1, 2, 2, $16B)
    %spritemapEntry(1, $06, $F8, 0, 0, 2, 2, $10E)
    %spritemapEntry(0, $12, $EB, 1, 0, 2, 2, $164)
    %spritemapEntry(0, $12, $F3, 1, 0, 2, 2, $154)
    %spritemapEntry(0, $12, $FB, 1, 0, 2, 2, $144)
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 2, $12A)

Spritemaps_Torizo_55:
    dw $0018
    %spritemapEntry(1, $02, $F3, 0, 1, 2, 1, $130)
    %spritemapEntry(1, $1F7, $FD, 0, 1, 2, 1, $1A9)
    %spritemapEntry(0, $1FF, $0D, 0, 1, 2, 1, $1BB)
    %spritemapEntry(0, $07, $0D, 0, 1, 2, 1, $1AF)
    %spritemapEntry(1, $1FF, $FD, 0, 1, 2, 1, $1A8)
    %spritemapEntry(1, $1F6, $15, 0, 1, 2, 1, $18A)
    %spritemapEntry(1, $1FE, $0D, 0, 1, 2, 1, $179)
    %spritemapEntry(0, $1F3, $20, 0, 1, 2, 1, $162)
    %spritemapEntry(0, $1FB, $20, 0, 1, 2, 1, $161)
    %spritemapEntry(0, $03, $20, 0, 1, 2, 1, $160)
    %spritemapEntry(1, $1FB, $FD, 0, 1, 2, 2, $1A9)
    %spritemapEntry(0, $03, $0D, 0, 1, 2, 2, $1BB)
    %spritemapEntry(0, $0B, $0D, 0, 1, 2, 2, $1AF)
    %spritemapEntry(1, $03, $FD, 0, 1, 2, 2, $1A8)
    %spritemapEntry(1, $1FA, $15, 0, 1, 2, 2, $18A)
    %spritemapEntry(1, $02, $0D, 0, 1, 2, 2, $179)
    %spritemapEntry(0, $1F7, $20, 0, 1, 2, 2, $162)
    %spritemapEntry(0, $1FF, $20, 0, 1, 2, 2, $161)
    %spritemapEntry(0, $07, $20, 0, 1, 2, 2, $160)
    %spritemapEntry(1, $02, $E3, 0, 1, 2, 1, $110)
    %spritemapEntry(1, $1F2, $FB, 0, 1, 2, 1, $142)
    %spritemapEntry(1, $1F2, $EB, 0, 1, 2, 1, $122)
    %spritemapEntry(1, $1F2, $DB, 0, 1, 2, 1, $102)
    %spritemapEntry(1, $02, $DB, 0, 1, 2, 1, $100)

Spritemaps_Torizo_56:
    dw $0013
    %spritemapEntry(1, $02, $F2, 0, 1, 2, 1, $130)
    %spritemapEntry(0, $1FC, $0F, 0, 1, 2, 1, $1AE)
    %spritemapEntry(0, $04, $0F, 0, 1, 2, 1, $1AD)
    %spritemapEntry(1, $1FC, $FF, 0, 1, 2, 1, $1A6)
    %spritemapEntry(1, $1EE, $22, 0, 1, 2, 1, $1A0)
    %spritemapEntry(1, $1F3, $19, 0, 1, 2, 1, $18A)
    %spritemapEntry(1, $1FB, $11, 0, 1, 2, 1, $179)
    %spritemapEntry(1, $02, $FA, 0, 1, 2, 1, $140)
    %spritemapEntry(1, $02, $E2, 0, 1, 2, 1, $110)
    %spritemapEntry(1, $1F2, $FA, 0, 1, 2, 1, $142)
    %spritemapEntry(1, $1F2, $EA, 0, 1, 2, 1, $122)
    %spritemapEntry(1, $1F2, $DA, 0, 1, 2, 1, $102)
    %spritemapEntry(1, $02, $DA, 0, 1, 2, 1, $100)
    %spritemapEntry(0, $00, $10, 0, 0, 2, 2, $1AC)
    %spritemapEntry(0, $1F8, $10, 0, 0, 2, 2, $1AB)
    %spritemapEntry(1, $1F8, $00, 0, 0, 2, 2, $1A4)
    %spritemapEntry(1, $1E7, $24, 0, 1, 2, 2, $1A0)
    %spritemapEntry(1, $1EC, $1B, 0, 1, 2, 2, $18A)
    %spritemapEntry(1, $1F4, $13, 0, 1, 2, 2, $179)

Spritemaps_Torizo_57:
    dw $0015
    %spritemapEntry(1, $02, $F2, 0, 1, 2, 1, $130)
    %spritemapEntry(1, $1ED, $27, 0, 1, 2, 1, $1A2)
    %spritemapEntry(1, $1EA, $27, 0, 1, 2, 1, $1A2)
    %spritemapEntry(0, $00, $10, 0, 1, 2, 1, $1AB)
    %spritemapEntry(0, $1F8, $10, 0, 1, 2, 1, $1AC)
    %spritemapEntry(1, $1F8, $00, 0, 1, 2, 1, $1A4)
    %spritemapEntry(1, $1F3, $13, 0, 1, 2, 1, $177)
    %spritemapEntry(0, $1F3, $23, 0, 1, 2, 1, $198)
    %spritemapEntry(0, $1FB, $23, 0, 1, 2, 1, $197)
    %spritemapEntry(0, $1FD, $10, 0, 1, 2, 2, $1AB)
    %spritemapEntry(0, $1F5, $10, 0, 1, 2, 2, $1AC)
    %spritemapEntry(1, $1F5, $00, 0, 1, 2, 2, $1A4)
    %spritemapEntry(1, $1F0, $13, 0, 1, 2, 2, $177)
    %spritemapEntry(0, $1F0, $23, 0, 1, 2, 2, $198)
    %spritemapEntry(0, $1F8, $23, 0, 1, 2, 2, $197)
    %spritemapEntry(1, $02, $FA, 0, 1, 2, 1, $140)
    %spritemapEntry(1, $02, $E2, 0, 1, 2, 1, $110)
    %spritemapEntry(1, $1F2, $FA, 0, 1, 2, 1, $142)
    %spritemapEntry(1, $1F2, $EA, 0, 1, 2, 1, $122)
    %spritemapEntry(1, $1F2, $DA, 0, 1, 2, 1, $102)
    %spritemapEntry(1, $02, $DA, 0, 1, 2, 1, $100)

Spritemaps_Torizo_58:
    dw $0018
    %spritemapEntry(0, $1DE, $28, 0, 1, 2, 2, $162)
    %spritemapEntry(0, $1E6, $28, 0, 1, 2, 2, $161)
    %spritemapEntry(0, $1EE, $28, 0, 1, 2, 2, $160)
    %spritemapEntry(0, $0D, $28, 0, 1, 2, 1, $162)
    %spritemapEntry(0, $15, $28, 0, 1, 2, 1, $161)
    %spritemapEntry(0, $1D, $28, 0, 1, 2, 1, $160)
    %spritemapEntry(1, $1F9, $FE, 0, 1, 2, 1, $1A9)
    %spritemapEntry(0, $01, $0E, 0, 1, 2, 1, $1BB)
    %spritemapEntry(0, $09, $0E, 0, 1, 2, 1, $1AF)
    %spritemapEntry(1, $01, $FE, 0, 1, 2, 1, $1A8)
    %spritemapEntry(0, $09, $22, 0, 1, 2, 1, $194)
    %spritemapEntry(0, $11, $22, 0, 1, 2, 1, $193)
    %spritemapEntry(1, $09, $12, 0, 1, 2, 1, $173)
    %spritemapEntry(0, $1FB, $10, 0, 0, 2, 2, $1AE)
    %spritemapEntry(0, $1F3, $10, 0, 0, 2, 2, $1AD)
    %spritemapEntry(1, $1F3, $00, 0, 0, 2, 2, $1A6)
    %spritemapEntry(1, $1E1, $1C, 0, 1, 2, 2, $18A)
    %spritemapEntry(1, $1E9, $14, 0, 1, 2, 2, $179)
    %spritemapEntry(1, $1F2, $F9, 0, 1, 2, 1, $142)
    %spritemapEntry(1, $02, $F9, 0, 1, 2, 1, $140)
    %spritemapEntry(1, $1F2, $E9, 0, 1, 2, 1, $122)
    %spritemapEntry(1, $02, $E9, 0, 1, 2, 1, $120)
    %spritemapEntry(1, $1F2, $D9, 0, 1, 2, 1, $102)
    %spritemapEntry(1, $02, $D9, 0, 1, 2, 1, $100)

Spritemaps_Torizo_59:
    dw $0018
    %spritemapEntry(0, $1DE, $28, 0, 1, 2, 1, $162)
    %spritemapEntry(0, $1E6, $28, 0, 1, 2, 1, $161)
    %spritemapEntry(0, $1EE, $28, 0, 1, 2, 1, $160)
    %spritemapEntry(0, $1FB, $10, 0, 0, 2, 1, $1AE)
    %spritemapEntry(0, $1F3, $10, 0, 0, 2, 1, $1AD)
    %spritemapEntry(1, $1F3, $00, 0, 0, 2, 1, $1A6)
    %spritemapEntry(1, $1E1, $1C, 0, 1, 2, 1, $18A)
    %spritemapEntry(1, $1E9, $14, 0, 1, 2, 1, $179)
    %spritemapEntry(0, $0D, $28, 0, 1, 2, 2, $162)
    %spritemapEntry(0, $15, $28, 0, 1, 2, 2, $161)
    %spritemapEntry(0, $1D, $28, 0, 1, 2, 2, $160)
    %spritemapEntry(1, $1F9, $FE, 0, 1, 2, 2, $1A9)
    %spritemapEntry(0, $01, $0E, 0, 1, 2, 2, $1BB)
    %spritemapEntry(0, $09, $0E, 0, 1, 2, 2, $1AF)
    %spritemapEntry(1, $01, $FE, 0, 1, 2, 2, $1A8)
    %spritemapEntry(0, $09, $22, 0, 1, 2, 2, $194)
    %spritemapEntry(0, $11, $22, 0, 1, 2, 2, $193)
    %spritemapEntry(1, $09, $12, 0, 1, 2, 2, $173)
    %spritemapEntry(1, $1F2, $F9, 0, 1, 2, 1, $142)
    %spritemapEntry(1, $02, $F9, 0, 1, 2, 1, $140)
    %spritemapEntry(1, $1F2, $E9, 0, 1, 2, 1, $122)
    %spritemapEntry(1, $02, $E9, 0, 1, 2, 1, $120)
    %spritemapEntry(1, $1F2, $D9, 0, 1, 2, 1, $102)
    %spritemapEntry(1, $02, $D9, 0, 1, 2, 1, $100)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemaps_Torizo_AAA4C6:
    dw $0006
    %spritemapEntry(1, $1F0, $0C, 0, 1, 2, 1, $142)
    %spritemapEntry(1, $00, $0C, 0, 1, 2, 1, $140)
    %spritemapEntry(1, $1F0, $FC, 0, 1, 2, 1, $122)
    %spritemapEntry(1, $00, $FC, 0, 1, 2, 1, $120)
    %spritemapEntry(1, $1F0, $EC, 0, 1, 2, 1, $102)
    %spritemapEntry(1, $00, $EC, 0, 1, 2, 1, $100)


;;; $A4E6: Torizo extended spritemaps ;;;
UNUSED_ExtendedSpritemaps_Torizo_AAA4E6:
    dw $0001
    dw $0000,$0000
    dw Spritemaps_Torizo_7
    dw UNUSED_Hitboxes_Torizo_AA87DA
endif ; !FEATURE_KEEP_UNREFERENCED

ExtendedSpritemaps_Torizo_FacingScreen_Turning_Dodging:
    dw $0001
    dw $0000,$0000
    dw Spritemaps_Torizo_6
    dw Hitboxes_Torizo_Blank

ExtendedSpritemaps_Torizo_WalkingLeft_RightLegMoving_0:
    dw $0004
    dw $FFF1,$FFE2
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
    dw $0004
    dw $FFF1,$FFE2
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
    dw $0004
    dw $FFF1,$FFE1
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
    dw $0004
    dw $FFF1,$FFE0
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
    dw $0004
    dw $FFF1,$FFE0
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
    dw $0004
    dw $FFF1,$FFE2
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
    dw $0004
    dw $FFF1,$FFE1
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
    dw $0004
    dw $FFF1,$FFE1
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
    dw $0004
    dw $FFF1,$FFE0
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
    dw $0004
    dw $FFF1,$FFE1
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
    dw $0003
    dw $FFF1,$FFE1
    dw Spritemaps_Torizo_0
    dw Hitboxes_Torizo_Blank
    dw $FFFC,$FFE7
    dw Spritemaps_Torizo_1D
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_9
    dw $0000,$0000
    dw Spritemaps_Torizo_2F
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17

ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_RightFootForward_0:
    dw $0003
    dw $FFF7,$FFE1
    dw Spritemaps_Torizo_1
    dw Hitboxes_Torizo_Blank
    dw $FFFC,$FFE7
    dw Spritemaps_Torizo_1E
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_A
    dw $0000,$0000
    dw Spritemaps_Torizo_2F
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17

ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_RightFootForward_1:
    dw $0003
    dw $FFF7,$FFE1
    dw Spritemaps_Torizo_2
    dw Hitboxes_Torizo_Blank
    dw $FFFC,$FFE7
    dw Spritemaps_Torizo_1F
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_B
    dw $0000,$0000
    dw Spritemaps_Torizo_2F
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17

ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_RightFootForward_2:
    dw $0003
    dw $FFF7,$FFE1
    dw Spritemaps_Torizo_3
    dw Hitboxes_Torizo_Blank
    dw $FFFC,$FFE7
    dw Spritemaps_Torizo_20
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_C
    dw $0000,$0000
    dw Spritemaps_Torizo_2F
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17

ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_RightFootForward_3:
    dw $0003
    dw $FFFC,$FFE7
    dw Spritemaps_Torizo_21
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_D
    dw $FFF7,$FFE1
    dw Spritemaps_Torizo_4
    dw Hitboxes_Torizo_Blank
    dw $0000,$0000
    dw Spritemaps_Torizo_2F
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17

ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_RightFootForward_4:
    dw $0003
    dw $FFFC,$FFE7
    dw Spritemaps_Torizo_21
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_D
    dw $FFF7,$FFE1
    dw Spritemaps_Torizo_5
    dw Hitboxes_Torizo_Blank
    dw $0000,$0000
    dw Spritemaps_Torizo_2F
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17

ExtendedSpritemaps_Torizo_Attacks_FaceLeft_LeftFootForward:
    dw $0003
    dw $FFF1,$FFE1
    dw Spritemaps_Torizo_0
    dw Hitboxes_Torizo_Blank
    dw $FFFC,$FFE7
    dw Spritemaps_Torizo_1C
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_8
    dw $0000,$0000
    dw Spritemaps_Torizo_2E
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17

ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_LeftFootForward_0:
    dw $0003
    dw $FFF7,$FFE1
    dw Spritemaps_Torizo_1
    dw Hitboxes_Torizo_Blank
    dw $FFFC,$FFE7
    dw Spritemaps_Torizo_1E
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_A
    dw $0000,$0000
    dw Spritemaps_Torizo_2E
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17

ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_LeftFootForward_1:
    dw $0003
    dw $FFF7,$FFE1
    dw Spritemaps_Torizo_2
    dw Hitboxes_Torizo_Blank
    dw $FFFC,$FFE7
    dw Spritemaps_Torizo_1F
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_B
    dw $0000,$0000
    dw Spritemaps_Torizo_2E
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17

ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_LeftFootForward_2:
    dw $0003
    dw $FFF7,$FFE1
    dw Spritemaps_Torizo_3
    dw Hitboxes_Torizo_Blank
    dw $FFFC,$FFE7
    dw Spritemaps_Torizo_20
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_C
    dw $0000,$0000
    dw Spritemaps_Torizo_2E
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17

ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_LeftFootForward_3:
    dw $0003
    dw $FFFC,$FFE7
    dw Spritemaps_Torizo_21
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_D
    dw $FFF7,$FFE1
    dw Spritemaps_Torizo_4
    dw Hitboxes_Torizo_Blank
    dw $0000,$0000
    dw Spritemaps_Torizo_2E
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17

ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_LeftFootForward_4:
    dw $0003
    dw $FFFC,$FFE7
    dw Spritemaps_Torizo_21
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_D
    dw $FFF7,$FFE1
    dw Spritemaps_Torizo_5
    dw Hitboxes_Torizo_Blank
    dw $0000,$0000
    dw Spritemaps_Torizo_2E
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17

ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_0:
    dw $0003
    dw $FFF1,$FFE1
    dw Spritemaps_Torizo_0
    dw Hitboxes_Torizo_Blank
    dw $FFFC,$FFE7
    dw Spritemaps_Torizo_1E
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_A
    dw $0000,$0000
    dw Spritemaps_Torizo_2F
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17

ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_1:
    dw $0004
    dw $FFF1,$FFE1
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
    dw $0004
    dw $FFFC,$FFE7
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
    dw $0004
    dw $FFFC,$FFE7
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
    dw $0004
    dw $FFFC,$FFE7
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
    dw $0004
    dw $FFF1,$FFE1
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
    dw $0004
    dw $FFF1,$FFE1
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
    dw $0004
    dw $FFF1,$FFE1
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
    dw $0004
    dw $FFFC,$FFE7
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
    dw $0004
    dw $FFFC,$FFE7
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
    dw $0003
    dw $FFF1,$FFE1
    dw Spritemaps_Torizo_0
    dw Hitboxes_Torizo_Blank
    dw $FFFC,$FFE7
    dw Spritemaps_Torizo_1E
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_A
    dw $0000,$0000
    dw Spritemaps_Torizo_2E
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17

ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_1:
    dw $0003
    dw $FFF1,$FFE1
    dw Spritemaps_Torizo_0
    dw Hitboxes_Torizo_Blank
    dw $FFFC,$FFE7
    dw Spritemaps_Torizo_1F
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_B
    dw $0000,$0000
    dw Spritemaps_Torizo_2E
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17

ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_2:
    dw $0003
    dw $FFFC,$FFE7
    dw Spritemaps_Torizo_20
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_C
    dw $FFF1,$FFE1
    dw Spritemaps_Torizo_0
    dw Hitboxes_Torizo_Blank
    dw $0000,$0000
    dw Spritemaps_Torizo_2E
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17

ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_3:
    dw $0003
    dw $FFFC,$FFE7
    dw Spritemaps_Torizo_21
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_D
    dw $FFF1,$FFE1
    dw Spritemaps_Torizo_0
    dw Hitboxes_Torizo_Blank
    dw $0000,$0000
    dw Spritemaps_Torizo_2E
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17

ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_4:
    dw $0003
    dw $FFFC,$FFE7
    dw Spritemaps_Torizo_22
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_E
    dw $FFF1,$FFE1
    dw Spritemaps_Torizo_0
    dw Hitboxes_Torizo_Blank
    dw $0000,$0000
    dw Spritemaps_Torizo_2E
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_17

ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_5:
    dw $0004
    dw $FFF1,$FFE1
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
    dw $0004
    dw $FFF1,$FFE1
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
    dw $0004
    dw $FFF1,$FFE1
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
    dw $0004
    dw $FFFC,$FFE7
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
    dw $0004
    dw $FFFC,$FFE7
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
    dw $0001
    dw $0000,$0008
    dw Spritemaps_Torizo_6
    dw UNUSED_Hitboxes_Torizo_AA87DA

UNUSED_ExtendedSpritemaps_Torizo_AAAA08:
    dw $0001
    dw $0000,$0008
    dw Spritemaps_Torizo_7
    dw UNUSED_Hitboxes_Torizo_AA87DA
endif ; !FEATURE_KEEP_UNREFERENCED

ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_0:
    dw $0001
    dw $0000,$0000
    dw Spritemaps_Torizo_C
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_0

ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_1:
    dw $0001
    dw $0000,$0000
    dw Spritemaps_Torizo_D
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_1

ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_2:
    dw $0001
    dw $0000,$0000
    dw Spritemaps_Torizo_E
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_2

ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_3:
    dw $0001
    dw $0000,$0000
    dw Spritemaps_Torizo_E_miscount
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_3

ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_4:
    dw $0002
    dw $FFFB,$FFE8
    dw Spritemaps_Torizo_1D
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_9
    dw $0000,$0000
    dw Spritemaps_Torizo_F
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_4

ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_5:
    dw $0002
    dw $FFFB,$FFE8
    dw Spritemaps_Torizo_1E
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_A
    dw $0000,$0000
    dw Spritemaps_Torizo_10
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_5

ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_6:
    dw $0002
    dw $FFFB,$FFE8
    dw Spritemaps_Torizo_1E
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_A
    dw $0000,$0000
    dw Spritemaps_Torizo_12
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_6

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ExtendedSpritemaps_Torizo_AAAA70:
    dw $0001
    dw $0000,$0000
    dw Spritemaps_Torizo_8
    dw Hitboxes_Torizo_Blank

UNUSED_ExtendedSpritemaps_Torizo_AAAA7A:
    dw $0001
    dw $0000,$0000
    dw Spritemaps_Torizo_9
    dw Hitboxes_Torizo_Blank

UNUSED_ExtendedSpritemaps_Torizo_AAAA84:
    dw $0001
    dw $0000,$0000
    dw Spritemaps_Torizo_A
    dw Hitboxes_Torizo_Blank

UNUSED_ExtendedSpritemaps_Torizo_AAAA8E:
    dw $0001
    dw $0000,$0000
    dw Spritemaps_Torizo_B
    dw Hitboxes_Torizo_Blank
endif ; !FEATURE_KEEP_UNREFERENCED

ExtendedSpritemaps_Torizo_WalkingRight_LeftLegMoving_0:
    dw $0004
    dw $000F,$FFE2
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
    dw $0004
    dw $000F,$FFE2
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
    dw $0004
    dw $000F,$FFE1
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
    dw $0004
    dw $000F,$FFE0
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
    dw $0004
    dw $000F,$FFE0
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
    dw $0004
    dw $000F,$FFE2
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
    dw $0004
    dw $000F,$FFE1
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
    dw $0004
    dw $000F,$FFE1
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
    dw $0004
    dw $000F,$FFE0
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
    dw $0004
    dw $000F,$FFE1
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
    dw $0003
    dw $000F,$FFE1
    dw Spritemaps_Torizo_30
    dw Hitboxes_Torizo_Blank
    dw $0004,$FFE7
    dw Spritemaps_Torizo_47
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_9
    dw $0000,$0000
    dw Spritemaps_Torizo_59
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17

ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_LeftFootForward_0:
    dw $0003
    dw $0009,$FFE1
    dw Spritemaps_Torizo_31
    dw Hitboxes_Torizo_Blank
    dw $0004,$FFE7
    dw Spritemaps_Torizo_48
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_A
    dw $0000,$0000
    dw Spritemaps_Torizo_59
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17

ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_LeftFootForward_1:
    dw $0003
    dw $0009,$FFE1
    dw Spritemaps_Torizo_32
    dw Hitboxes_Torizo_Blank
    dw $0004,$FFE7
    dw Spritemaps_Torizo_49
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_B
    dw $0000,$0000
    dw Spritemaps_Torizo_59
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17

ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_LeftFootForward_2:
    dw $0003
    dw $0009,$FFE1
    dw Spritemaps_Torizo_33
    dw Hitboxes_Torizo_Blank
    dw $0004,$FFE7
    dw Spritemaps_Torizo_4A
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_C
    dw $0000,$0000
    dw Spritemaps_Torizo_59
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17

ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_LeftFootForward_3:
    dw $0003
    dw $0004,$FFE7
    dw Spritemaps_Torizo_4B
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_D
    dw $0009,$FFE1
    dw Spritemaps_Torizo_34
    dw Hitboxes_Torizo_Blank
    dw $0000,$0000
    dw Spritemaps_Torizo_59
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17

ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_LeftFootForward_4:
    dw $0003
    dw $0004,$FFE7
    dw Spritemaps_Torizo_4B
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_D
    dw $0009,$FFE1
    dw Spritemaps_Torizo_35
    dw Hitboxes_Torizo_Blank
    dw $0000,$0000
    dw Spritemaps_Torizo_59
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17

ExtendedSpritemaps_Torizo_Attacks_FaceRight_RightFootForward:
    dw $0003
    dw $000F,$FFE1
    dw Spritemaps_Torizo_30
    dw Hitboxes_Torizo_Blank
    dw $0004,$FFE7
    dw Spritemaps_Torizo_46
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_8
    dw $0000,$0000
    dw Spritemaps_Torizo_58
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17

ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_RightFootForward_0:
    dw $0003
    dw $0009,$FFE1
    dw Spritemaps_Torizo_31
    dw Hitboxes_Torizo_Blank
    dw $0004,$FFE7
    dw Spritemaps_Torizo_48
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_A
    dw $0000,$0000
    dw Spritemaps_Torizo_58
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17

ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_RightFootForward_1:
    dw $0003
    dw $0009,$FFE1
    dw Spritemaps_Torizo_32
    dw Hitboxes_Torizo_Blank
    dw $0004,$FFE7
    dw Spritemaps_Torizo_49
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_B
    dw $0000,$0000
    dw Spritemaps_Torizo_58
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17

ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_RightFootForward_2:
    dw $0003
    dw $0009,$FFE1
    dw Spritemaps_Torizo_33
    dw Hitboxes_Torizo_Blank
    dw $0004,$FFE7
    dw Spritemaps_Torizo_4A
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_C
    dw $0000,$0000
    dw Spritemaps_Torizo_58
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17

ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_RightFootForward_3:
    dw $0003
    dw $0004,$FFE7
    dw Spritemaps_Torizo_4B
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_D
    dw $0009,$FFE1
    dw Spritemaps_Torizo_34
    dw Hitboxes_Torizo_Blank
    dw $0000,$0000
    dw Spritemaps_Torizo_58
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17

ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_RightFootForward_4:
    dw $0003
    dw $0004,$FFE7
    dw Spritemaps_Torizo_4B
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_D
    dw $0009,$FFE1
    dw Spritemaps_Torizo_35
    dw Hitboxes_Torizo_Blank
    dw $0000,$0000
    dw Spritemaps_Torizo_58
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17

ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_0:
    dw $0003
    dw $000F,$FFE1
    dw Spritemaps_Torizo_30
    dw Hitboxes_Torizo_Blank
    dw $0004,$FFE7
    dw Spritemaps_Torizo_48
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_A
    dw $0000,$0000
    dw Spritemaps_Torizo_59
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17

ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_1:
    dw $0004
    dw $000F,$FFE1
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
    dw $0004
    dw $0004,$FFE7
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
    dw $0004
    dw $0004,$FFE7
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
    dw $0004
    dw $0004,$FFE7
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
    dw $0004
    dw $000F,$FFE1
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
    dw $0004
    dw $000F,$FFE1
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
    dw $0004
    dw $000F,$FFE1
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
    dw $0004
    dw $0004,$FFE7
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
    dw $0004
    dw $0004,$FFE7
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
    dw $0003
    dw $000F,$FFE1
    dw Spritemaps_Torizo_30
    dw Hitboxes_Torizo_Blank
    dw $0004,$FFE7
    dw Spritemaps_Torizo_48
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_A
    dw $0000,$0000
    dw Spritemaps_Torizo_58
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17

ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_1:
    dw $0003
    dw $000F,$FFE1
    dw Spritemaps_Torizo_30
    dw Hitboxes_Torizo_Blank
    dw $0004,$FFE7
    dw Spritemaps_Torizo_49
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_B
    dw $0000,$0000
    dw Spritemaps_Torizo_58
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17

ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_2:
    dw $0003
    dw $0004,$FFE7
    dw Spritemaps_Torizo_4A
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_C
    dw $000F,$FFE1
    dw Spritemaps_Torizo_30
    dw Hitboxes_Torizo_Blank
    dw $0000,$0000
    dw Spritemaps_Torizo_58
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17

ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_3:
    dw $0003
    dw $0004,$FFE7
    dw Spritemaps_Torizo_4B
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_D
    dw $000F,$FFE1
    dw Spritemaps_Torizo_30
    dw Hitboxes_Torizo_Blank
    dw $0000,$0000
    dw Spritemaps_Torizo_58
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17

ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_4:
    dw $0003
    dw $0004,$FFE7
    dw Spritemaps_Torizo_4C
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_E
    dw $000F,$FFE1
    dw Spritemaps_Torizo_30
    dw Hitboxes_Torizo_Blank
    dw $0000,$0000
    dw Spritemaps_Torizo_58
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_17

ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_5:
    dw $0004
    dw $000F,$FFE1
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
    dw $0004
    dw $000F,$FFE1
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
    dw $0004
    dw $000F,$FFE1
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
    dw $0004
    dw $0004,$FFE7
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
    dw $0004
    dw $0004,$FFE7
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
    dw $0001
    dw $0000,$0000
    dw Spritemaps_Torizo_36
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_0

ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingRight_1:
    dw $0001
    dw $0000,$0000
    dw Spritemaps_Torizo_37
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_1

ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingRight_2:
    dw $0001
    dw $0000,$0000
    dw Spritemaps_Torizo_38
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_2

ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingRight_3:
    dw $0001
    dw $0000,$0000
    dw Spritemaps_Torizo_39
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_3

ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingRight_4:
    dw $0002
    dw $0005,$FFE8
    dw Spritemaps_Torizo_47
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_9
    dw $0000,$0000
    dw Spritemaps_Torizo_3A
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_4

ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingRight_5:
    dw $0002
    dw $0005,$FFE8
    dw Spritemaps_Torizo_48
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_A
    dw $0000,$0000
    dw Spritemaps_Torizo_3B
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_5

ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingRight_6:
    dw $0002
    dw $0005,$FFE8
    dw Spritemaps_Torizo_48
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_A
    dw $0000,$0000
    dw Spritemaps_Torizo_3C
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_6

ExtendedSpritemaps_Torizo_Jumping_Falling_FacingLeft_0:
    dw $0003
    dw $FFF0,$FFE3
    dw Spritemaps_Torizo_0
    dw Hitboxes_Torizo_Blank
    dw $FFFC,$FFEA
    dw Spritemaps_Torizo_1D
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_9
    dw $0000,$0000
    dw Spritemaps_Torizo_2B
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_16

ExtendedSpritemaps_Torizo_Jumping_Falling_FacingLeft_1:
    dw $0003
    dw $FFF0,$FFE2
    dw Spritemaps_Torizo_0
    dw Hitboxes_Torizo_Blank
    dw $FFFC,$FFE8
    dw Spritemaps_Torizo_1C
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_8
    dw $0000,$0000
    dw Spritemaps_Torizo_2C
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_16

ExtendedSpritemaps_Torizo_Jumping_Falling_FacingLeft_2:
    dw $0003
    dw $FFF0,$FFE2
    dw Spritemaps_Torizo_0
    dw Hitboxes_Torizo_Blank
    dw $FFFD,$FFE8
    dw Spritemaps_Torizo_1B
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_8
    dw $0000,$0000
    dw Spritemaps_Torizo_2D
    dw Hitboxes_Torizo_StandUp_SitDown_FacingLeft_16

ExtendedSpritemaps_Torizo_Jumping_Falling_FacingRight_0:
    dw $0003
    dw $000F,$FFE4
    dw Spritemaps_Torizo_30
    dw Hitboxes_Torizo_Blank
    dw $0004,$FFEA
    dw Spritemaps_Torizo_47
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_9
    dw $0000,$0000
    dw Spritemaps_Torizo_55
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_16

ExtendedSpritemaps_Torizo_Jumping_Falling_FacingRight_1:
    dw $0003
    dw $000F,$FFE3
    dw Spritemaps_Torizo_30
    dw Hitboxes_Torizo_Blank
    dw $0004,$FFE8
    dw Spritemaps_Torizo_46
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_8
    dw $0000,$0000
    dw Spritemaps_Torizo_56
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_16

ExtendedSpritemaps_Torizo_Jumping_Falling_FacingRight_2:
    dw $0003
    dw $000F,$FFE3
    dw Spritemaps_Torizo_30
    dw Hitboxes_Torizo_Blank
    dw $0003,$FFE8
    dw Spritemaps_Torizo_45
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_8
    dw $0000,$0000
    dw Spritemaps_Torizo_57
    dw Hitboxes_Torizo_StandUp_SitDown_FacingRight_16


;;; $B096: Torizo music tracks ;;;
TorizoMusicTracks:
  .song1:
; Song 1 - pre-fight music. Music track to queue when Bomb Torizo is revealed
    dw $0006
  .song0:
; Song 0 - fight music. Music track to queue when Bomb Torizo fight starts
    dw $0005
  .elevator:
; Elevator. Music track to queue when torizo dies
    dw $0003


;;; $B09C: Instruction - enemy function = [[Y]] ;;;
Instruction_Torizo_FunctionInY:
    LDA.W $0000,Y : STA.W Torizo.function,X
    INY #2
    RTL


;;; $B0A5: Blank tiles ;;;
Tiles_Blank:
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$00


;;; $B0E5: Instruction list - special callable - blow up Bomb Torizo's gut ;;;
InstList_Torizo_SpecialCallable_BlowUpBombTorizosGut:
; "special" because the usual link instruction isn't being used for returning
    dw Instruction_Torizo_FunctionInY
    dw RTS_AAC6AB
    dw Instruction_Torizo_SetAnimationLock
    dw Instruction_Torizo_Spawn5LowHealthExplosion_SleepFor28Frames,$0000
    dw Instruction_Torizo_MarkBTGutBlownUp_Spawn6BTDroolProjectiles
    dw Instruction_Common_TransferYBytesInYToVRAM
    dw $0040 : dl Tiles_Torizo+$200 : dw $7300
    dw Instruction_Common_TransferYBytesInYToVRAM
    dw $0040 : dl Tiles_Torizo+$400 : dw $7400
    dw Instruction_Common_TransferYBytesInYToVRAM
    dw $0020 : dl Tiles_Torizo+$240 : dw $7E70
    dw Instruction_Common_TransferYBytesInYToVRAM
    dw $0020 : dl Tiles_Torizo+$440 : dw $7F70
    dw Instruction_Torizo_FunctionInY
    dw Function_Torizo_NormalMovement
    dw Instruction_Torizo_ClearAnimationLock
    dw Instruction_Torizo_GotoGutExplosionLinkInstruction


;;; $B11D: Instruction - mark Bomb Torizo gut blown up and spawn 6 Bomb Torizo low-health continuous drool enemy projectiles ;;;
Instruction_Torizo_MarkBTGutBlownUp_Spawn6BTDroolProjectiles:
    LDA.W Torizo.behavioralProperties,X : ORA.W #$8000 : STA.W Torizo.behavioralProperties,X
    PHX : PHY
    LDY.W #EnemyProjectile_BombTorizoContinuousDrool
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    LDY.W #EnemyProjectile_BombTorizoContinuousDrool
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    LDY.W #EnemyProjectile_BombTorizoContinuousDrool
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    LDY.W #EnemyProjectile_BombTorizoContinuousDrool
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    LDY.W #EnemyProjectile_BombTorizoContinuousDrool
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    LDY.W #EnemyProjectile_BombTorizoContinuousDrool
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    PLY : PLX
    RTL


;;; $B155: Instruction list - callable - blow up Bomb Torizo's face ;;;
InstList_Torizo_Callable_BlowUpBombTorizosFace:
    dw Instruction_Torizo_FunctionInY
    dw RTS_AAC6AB
    dw Instruction_Torizo_SetAnimationLock
    dw Instruction_Torizo_Spawn5LowHealthExplosion_SleepFor28Frames,$0006
    dw Instruction_Torizo_MarkBombTorizoFaceBlownUp
    dw Instruction_Common_TransferYBytesInYToVRAM
    dw $0020 : dl Tiles_Torizo+$260 : dw $7E50
    dw Instruction_Common_TransferYBytesInYToVRAM
    dw $0020 : dl Tiles_Torizo+$460 : dw $7F50
    dw Instruction_Common_TransferYBytesInYToVRAM
    dw $0040 : dl Tiles_Blank : dw $7C80
    dw Instruction_Common_TransferYBytesInYToVRAM
    dw $0040 : dl Tiles_Blank : dw $7CA0
    dw Instruction_Common_WaitYFrames,$0001
    dw Instruction_Common_TransferYBytesInYToVRAM
    dw $0040 : dl Tiles_Blank : dw $7D80
    dw Instruction_Common_TransferYBytesInYToVRAM
    dw $0040 : dl Tiles_Blank : dw $7DA0
    dw Instruction_Common_TransferYBytesInYToVRAM
    dw $0040 : dl Tiles_Blank : dw $7E80
    dw Instruction_Common_TransferYBytesInYToVRAM
    dw $0040 : dl Tiles_Blank : dw $7F80
    dw Instruction_Common_TransferYBytesInYToVRAM
    dw $0020 : dl Tiles_Blank : dw $79F0
    dw Instruction_Torizo_FunctionInY
    dw Function_Torizo_NormalMovement
    dw Instruction_Torizo_ClearAnimationLock
    dw Instruction_Torizo_Return


;;; $B1BE: Instruction - mark Bomb Torizo face blown up ;;;
Instruction_Torizo_MarkBombTorizoFaceBlownUp:
    LDA.W Torizo.behavioralProperties,X : ORA.W #$4000 : STA.W Torizo.behavioralProperties,X
    RTL


;;; $B1C8: Instruction list - torizo death sequence ;;;
InstList_Torizo_DeathSequence_0:
    dw Instruction_Torizo_FunctionInY
    dw RTS_AAC6AB
    dw Instruction_Torizo_SetAnimationLock
    dw Instruction_Common_TimerInY,$0008

InstList_Torizo_DeathSequence_1:
    dw Instruction_Torizo_SpawnTorizoDeathExplosion_SleepFor1IFrame
    dw Instruction_Common_WaitYFrames,$0006
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate
    dw InstList_Torizo_DeathSequence_1
    dw Instruction_Torizo_SetupPaletteTransitionToBlack
    dw Instruction_Common_TimerInY,$000E

InstList_Torizo_DeathSequence_2:
    dw Instruction_Torizo_SpawnTorizoDeathExplosion_SleepFor1IFrame
    dw Instruction_Torizo_SetAsVisible
    dw Instruction_Common_WaitYFrames,$0002
    dw Instruction_Torizo_SetAsInvisible
    dw Instruction_Common_WaitYFrames,$0002
    dw Instruction_Torizo_SpawnTorizoDeathExplosion_SleepFor1IFrame
    dw Instruction_Torizo_SetAsVisible
    dw Instruction_Common_WaitYFrames,$0002
    dw Instruction_Torizo_SetAsInvisible
    dw Instruction_Common_WaitYFrames,$0002
    dw Instruction_Torizo_SetAsVisible
    dw Instruction_Common_WaitYFrames,$0002
    dw Instruction_Torizo_SetAsInvisible
    dw Instruction_Common_WaitYFrames,$0002
    dw Instruction_Torizo_SetAsVisible
    dw Instruction_Common_WaitYFrames,$0002
    dw Instruction_Torizo_SetAsInvisible
    dw Instruction_Common_WaitYFrames,$0002
    dw Instruction_Torizo_AdvanceGradualColorChange
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate
    dw InstList_Torizo_DeathSequence_2
    dw Instruction_Common_WaitYFrames,$0040
    dw Instruction_Torizo_SetBossBit_QueueElevatorMusic_SpawnDrops
    dw Instruction_Common_DeleteEnemy


;;; $B224: Instruction - set enemy as visible ;;;
Instruction_Torizo_SetAsVisible:
    LDA.W Enemy.properties,X : AND.W #$FEFF : STA.W Enemy.properties,X
    RTL


;;; $B22E: Instruction - set enemy as invisible ;;;
Instruction_Torizo_SetAsInvisible:
    LDA.W Enemy.properties,X : ORA.W #$0100 : STA.W Enemy.properties,X
    RTL


;;; $B238: Instruction - set up palette transition to black ;;;
Instruction_Torizo_SetupPaletteTransitionToBlack:
; Target sprite palettes 1/2 = 0
    PHX
    LDX.W #$001E
    LDA.W #$0000

  .loop:
    STA.L TargetPalettes_SpriteP2,X : STA.L TargetPalettes_SpriteP1,X
    DEX #2 : BPL .loop
    PLX
    RTL


;;; $B24D: Instruction - set boss bit, queue elevator music, spawn item drops ;;;
Instruction_Torizo_SetBossBit_QueueElevatorMusic_SpawnDrops:
    LDA.W #$0004
    JSL SetBossBitsInAForCurrentArea
    LDA.W TorizoMusicTracks_elevator
    JSL QueueMusicDataOrTrack_8FrameDelay
    PHY : PHX : PHP
    LDA.W AreaIndex : BNE .notCrateria
    JSL BombTorizoDeathItemDropRoutine
    BRA .return

  .notCrateria:
    JSL GoldenTorizoDeathItemDropRoutine

  .return:
    PLP : PLX : PLY
    RTL


;;; $B271: Instruction - advance gradual colour change ;;;
Instruction_Torizo_AdvanceGradualColorChange:
    LDA.W #$0600
    JSL Advance_GradualColorChange_ofPalettesInA_Denominator_C
    RTL


;;; $B279: Torizo tiles ;;;
Tiles_Torizo:
; Torizo eyes opening / blinking
; Bomb Torizo gut blown up
; Bomb Torizo face blown up
; Golden Torizo releasing eggs
incbin "../data/Tiles_Torizo.bin"


;;; $B879: Instruction list - Bomb Torizo - initial ;;;
InstList_Torizo_BombTorizo_Initial_0:
    dw Instruction_Torizo_SetSteppedLeftWithRightFootState
    dw Instruction_Torizo_SetAnimationLock
    dw $0001,ExtendedSpritemap_Torizo_Blank
    dw Instruction_Torizo_FunctionInY
    dw Function_Torizo_WakeWhenBombTorizoChozoFinishesCrumbling
    dw Instruction_Common_Sleep
    dw Instruction_Torizo_FunctionInY
    dw Function_Torizo_SimpleMovement
    dw $0030,ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_0
    dw Instruction_Common_TransferYBytesInYToVRAM
    dw $0040 : dl Tiles_Torizo : dw $7D80
    dw $0020,ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_0
    dw Instruction_Common_TransferYBytesInYToVRAM
    dw $0040 : dl Tiles_Torizo+$40 : dw $7D80
    dw $0010,ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_0
    dw Instruction_Common_TransferYBytesInYToVRAM
    dw $0040 : dl Tiles_Torizo+$80 : dw $7D80
    dw $0008,ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_0
    dw Instruction_Common_TransferYBytesInYToVRAM
    dw $0040 : dl Tiles_Torizo+$C0 : dw $7D80
    dw $0020,ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_0
    dw Instruction_Common_TimerInY,$0002

InstList_Torizo_BombTorizo_Initial_1:
    dw $0004,ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_0
    dw Instruction_Common_TransferYBytesInYToVRAM
    dw $0040 : dl Tiles_Torizo : dw $7D80
    dw $0004,ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_0
    dw Instruction_Common_TransferYBytesInYToVRAM
    dw $0040 : dl Tiles_Torizo+$40 : dw $7D80
    dw $0004,ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_0
    dw Instruction_Common_TransferYBytesInYToVRAM
    dw $0040 : dl Tiles_Torizo+$80 : dw $7D80
    dw $0004,ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_0
    dw Instruction_Common_TransferYBytesInYToVRAM
    dw $0040 : dl Tiles_Torizo+$C0 : dw $7D80
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate
    dw InstList_Torizo_BombTorizo_Initial_1
    dw $0030,ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_0
    dw Instruction_Torizo_StandingUpMovement_IndexInY,$0000
    dw $0010,ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_1
    dw Instruction_Torizo_StandingUpMovement_IndexInY,$0002
    dw $0008,ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_2
    dw Instruction_Torizo_StandingUpMovement_IndexInY,$0004
    dw $0008,ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_3
    dw Instruction_Torizo_StandingUpMovement_IndexInY,$0006
    dw $0008,ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_4
    dw Instruction_Torizo_StandingUpMovement_IndexInY,$0008
    dw $0008,ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_5
    dw Instruction_Torizo_StandingUpMovement_IndexInY,$000A
    dw Instruction_Torizo_SetupPaletteTransitionToNormalTorizo
    dw Instruction_Common_TimerInY,$0010

InstList_Torizo_BombTorizo_Initial_2:
    dw $0004,ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_6
    dw Instruction_Torizo_AdvanceGradualColorChange
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate
    dw InstList_Torizo_BombTorizo_Initial_2
    dw RTL_AAC2C8
    dw Instruction_Torizo_ClearAnimationLock
    dw Instruction_Torizo_StartFightMusic_BombTorizoBellyPaletteFX
    dw $0010,ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_6
    dw Instruction_Common_GotoY
    dw InstList_Torizo_FacingLeft_Walking_LeftLegMoving


;;; $B94D: Instruction - set up palette transition to normal torizo ;;;
Instruction_Torizo_SetupPaletteTransitionToNormalTorizo:
    JSR LoadNormalTorizoTargetPalettes
    RTL


;;; $B951: Instruction - start fight music and Bomb Torizo belly palette FX ;;;
Instruction_Torizo_StartFightMusic_BombTorizoBellyPaletteFX:
    LDA.W TorizoMusicTracks_song0
    JSL QueueMusicDataOrTrack_8FrameDelay
    PHY
    LDY.W #PaletteFXObjects_BombTorizoBelly
    JSL Spawn_PaletteFXObject
    PLY
    RTL


;;; $B962: Instruction list - turning left ;;;
InstList_Torizo_FacingLeft_TurningLeft:
    dw Instruction_Torizo_FunctionInY
    dw Function_Torizo_SimpleMovement
    dw Instruction_Torizo_SetTorizoTurningAroundFlag
    dw $0018,ExtendedSpritemaps_Torizo_FacingScreen_Turning_Dodging


;;; $B96C: Instruction list - walking left - right leg moving ;;;
InstList_Torizo_FacingLeft_Walking_RightLegMoving:
    dw Instruction_Torizo_SetSteppedLeftWithLeftFootState
    dw Instruction_Torizo_FunctionInY
    dw Function_Torizo_NormalMovement
    dw Instruction_Common_Enemy0FB2_InY
    dw Function_Torizo_Movement_Walking
    dw Instruction_Torizo_SpawnLowHealthInitialDroolIfHealthIsLow
    dw Instruction_Torizo_PlayTorizoFootstepsSFX
    dw $000A,ExtendedSpritemaps_Torizo_WalkingLeft_RightLegMoving_0
    dw Instruction_Torizo_CallYIfSamusIsLessThan38PixelsInFront
    dw InstList_Torizo_FacingLeft_ExplosiveSwipe_LeftFootForward
    dw Instruction_Torizo_GotoYAndJumpBackwardsIfLessThan20Pixels
    dw InstList_Torizo_FacingLeft_JumpingBackward_LandLeftFootFwd_0
    dw Instruction_Torizo_BombTorizoWalkingMovement_Normal_IndexInY,$0002
    dw $0006,ExtendedSpritemaps_Torizo_WalkingLeft_RightLegMoving_1
    dw Instruction_Torizo_GotoYAndJumpBackwardsIfLessThan20Pixels
    dw InstList_Torizo_FacingLeft_JumpingBackward_LandLeftFootFwd_0
    dw Instruction_Torizo_BombTorizoWalkingMovement_Normal_IndexInY,$0004
    dw $0006,ExtendedSpritemaps_Torizo_WalkingLeft_RightLegMoving_2
    dw Instruction_Torizo_GotoYAndJumpBackwardsIfLessThan20Pixels
    dw InstList_Torizo_FacingLeft_JumpingBackward_LandLeftFootFwd_0
    dw Instruction_Torizo_BombTorizoWalkingMovement_Normal_IndexInY,$0006
    dw $0006,ExtendedSpritemaps_Torizo_WalkingLeft_RightLegMoving_3
    dw Instruction_Torizo_GotoYAndJumpBackwardsIfLessThan20Pixels
    dw InstList_Torizo_FacingLeft_JumpingBackward_LandLeftFootFwd_0
    dw Instruction_Torizo_BombTorizoWalkingMovement_Normal_IndexInY,$0008
    dw $0006,ExtendedSpritemaps_Torizo_WalkingLeft_RightLegMoving_4
    dw Instruction_Torizo_BombTorizoWalkingMovement_Normal_IndexInY,$000A


;;; $B9B6: Instruction list - walking left - left leg moving ;;;
InstList_Torizo_FacingLeft_Walking_LeftLegMoving:
    dw Instruction_Torizo_SetSteppedLeftWithRightFootState
    dw Instruction_Torizo_FunctionInY
    dw Function_Torizo_NormalMovement
    dw Instruction_Common_Enemy0FB2_InY
    dw Function_Torizo_Movement_Walking
    dw Instruction_Torizo_SpawnLowHealthInitialDroolIfHealthIsLow
    dw Instruction_Torizo_PlayTorizoFootstepsSFX
    dw $000A,ExtendedSpritemaps_Torizo_WalkingLeft_LeftLegMoving_0
    dw Instruction_Torizo_CallYIfSamusIsLessThan38PixelsInFront
    dw InstList_Torizo_FacingLeft_ExplosiveSwipe_RightFootForward
    dw Instruction_Torizo_GotoYAndJumpBackwardsIfLessThan20Pixels
    dw InstList_Torizo_FacingLeft_JumpingBackward_RightFootFwd_0
    dw Instruction_Torizo_BombTorizoWalkingMovement_Normal_IndexInY,$000C
    dw $0006,ExtendedSpritemaps_Torizo_WalkingLeft_LeftLegMoving_1
    dw Instruction_Torizo_GotoYAndJumpBackwardsIfLessThan20Pixels
    dw InstList_Torizo_FacingLeft_JumpingBackward_RightFootFwd_0
    dw Instruction_Torizo_BombTorizoWalkingMovement_Normal_IndexInY,$000E
    dw $0006,ExtendedSpritemaps_Torizo_WalkingLeft_LeftLegMoving_2
    dw Instruction_Torizo_GotoYAndJumpBackwardsIfLessThan20Pixels
    dw InstList_Torizo_FacingLeft_JumpingBackward_RightFootFwd_0
    dw Instruction_Torizo_BombTorizoWalkingMovement_Normal_IndexInY,$0010
    dw $0006,ExtendedSpritemaps_Torizo_WalkingLeft_LeftLegMoving_3
    dw Instruction_Torizo_GotoYAndJumpBackwardsIfLessThan20Pixels
    dw InstList_Torizo_FacingLeft_JumpingBackward_RightFootFwd_0
    dw Instruction_Torizo_BombTorizoWalkingMovement_Normal_IndexInY,$0012
    dw $0006,ExtendedSpritemaps_Torizo_WalkingLeft_LeftLegMoving_4
    dw Instruction_Torizo_BombTorizoWalkingMovement_Normal_IndexInY,$0000
    dw Instruction_Common_GotoY
    dw InstList_Torizo_FacingLeft_Walking_RightLegMoving


;;; $BA04: Instruction list - callable - spewing chozo orbs - facing left - right foot forward ;;;
InstList_Torizo_FacingLeft_SpewingChozoOrbs_RightFootFwd_0:
    dw Instruction_Common_Enemy0FB2_InY
    dw Function_Torizo_Movement_Attacking
    dw $0010,ExtendedSpritemaps_Torizo_Attacks_FaceLeft_RightFootForward
    dw $0008,ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_RightFootForward_0
    dw $0008,ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_RightFootForward_1
    dw $0008,ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_RightFootForward_2
    dw $0008,ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_RightFootForward_3
    dw $0010,ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_RightFootForward_4
    dw Instruction_Torizo_PlayShotTorizoSFX
    dw Instruction_Common_TimerInY,$0003

InstList_Torizo_FacingLeft_SpewingChozoOrbs_RightFootFwd_1:
    dw Instruction_Torizo_SpawnBombTorizosChozoOrbs
    dw Instruction_Common_WaitYFrames,$0010
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate
    dw InstList_Torizo_FacingLeft_SpewingChozoOrbs_RightFootFwd_1
    dw $0008,ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_RightFootForward_3
    dw $0008,ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_RightFootForward_2
    dw $0008,ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_RightFootForward_1
    dw $0048,ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_RightFootForward_0
    dw Instruction_Common_Enemy0FB2_InY
    dw Function_Torizo_Movement_Walking
    dw Instruction_Torizo_Return


;;; $BA46: Instruction list - callable - spewing chozo orbs - facing left - left foot forward ;;;
InstList_Torizo_FacingLeft_SpewingChozoOrbs_LeftFootFwd_0:
    dw Instruction_Common_Enemy0FB2_InY
    dw Function_Torizo_Movement_Attacking
    dw $0010,ExtendedSpritemaps_Torizo_Attacks_FaceLeft_LeftFootForward
    dw $0008,ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_LeftFootForward_0
    dw $0008,ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_LeftFootForward_1
    dw $0008,ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_LeftFootForward_2
    dw $0008,ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_LeftFootForward_3
    dw $0010,ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_LeftFootForward_4
    dw Instruction_Torizo_PlayShotTorizoSFX
    dw Instruction_Common_TimerInY,$0003

InstList_Torizo_FacingLeft_SpewingChozoOrbs_LeftFootFwd_1:
    dw Instruction_Torizo_SpawnBombTorizosChozoOrbs
    dw Instruction_Common_WaitYFrames,$0010
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate
    dw InstList_Torizo_FacingLeft_SpewingChozoOrbs_LeftFootFwd_1
    dw $0008,ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_LeftFootForward_3
    dw $0008,ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_LeftFootForward_2
    dw $0008,ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_LeftFootForward_1
    dw $0048,ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_LeftFootForward_0
    dw Instruction_Common_Enemy0FB2_InY
    dw Function_Torizo_Movement_Walking
    dw Instruction_Torizo_Return


;;; $BA88: Instruction list - callable - sonic booms - facing left - right foot forward ;;;
InstList_Torizo_FacingLeft_SonicBooms_RightFootForward_0:
    dw Instruction_Common_Enemy0FB2_InY
    dw Function_Torizo_Movement_Attacking
    dw Instruction_Common_TimerInY,$0004

InstList_Torizo_FacingLeft_SonicBooms_RightFootForward_1:
    dw $0006,ExtendedSpritemaps_Torizo_Attacks_FaceLeft_RightFootForward
    dw $0006,ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_0
    dw $0006,ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_1
    dw $0006,ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_2
    dw $0006,ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_3
    dw $0006,ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_4
    dw $0002,ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_3
    dw $0002,ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_2
    dw Instruction_Torizo_SpawnBombTorizoSonicBoomWithParameterY,$0000
    dw $0002,ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_1
    dw $0018,ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_0
    dw $0006,ExtendedSpritemaps_Torizo_Attacks_FaceLeft_RightFootForward
    dw $0006,ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_5
    dw $0006,ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_RightFootForward_0
    dw $0006,ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_RightFootForward_1
    dw $0006,ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_RightFootForward_2
    dw $0006,ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_RightFootForward_3
    dw $0002,ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_RightFootForward_2
    dw $0002,ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_RightFootForward_1
    dw Instruction_Torizo_SpawnBombTorizoSonicBoomWithParameterY,$0001
    dw $0002,ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_RightFootForward_0
    dw $0038,ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_5
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate
    dw InstList_Torizo_FacingLeft_SonicBooms_RightFootForward_1
    dw Instruction_Common_Enemy0FB2_InY
    dw Function_Torizo_Movement_Walking
    dw Instruction_Torizo_Return


;;; $BAF2: Instruction list - callable - sonic booms - facing left - left foot forward ;;;
InstList_Torizo_FacingLeft_SonicBooms_LeftFootForward_0:
    dw Instruction_Common_Enemy0FB2_InY
    dw Function_Torizo_Movement_Attacking
    dw Instruction_Common_TimerInY,$0004

InstList_Torizo_FacingLeft_SonicBooms_LeftFootForward_1:
    dw $0006,ExtendedSpritemaps_Torizo_Attacks_FaceLeft_LeftFootForward
    dw $0006,ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_0
    dw $0006,ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_1
    dw $0006,ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_2
    dw $0006,ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_3
    dw $0006,ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_4
    dw $0002,ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_3
    dw $0002,ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_2
    dw Instruction_Torizo_SpawnBombTorizoSonicBoomWithParameterY,$0000
    dw $0002,ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_1
    dw $0018,ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_0
    dw $0006,ExtendedSpritemaps_Torizo_Attacks_FaceLeft_LeftFootForward
    dw $0006,ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_5
    dw $0006,ExtSpritemap_Torizo_SonicBoom_Swipe_FaceLeft_LeftFootFwd_0
    dw $0006,ExtSpritemap_Torizo_SonicBoom_Swipe_FaceLeft_LeftFootFwd_1
    dw $0006,ExtSpritemap_Torizo_SonicBoom_Swipe_FaceLeft_LeftFootFwd_2
    dw $0006,ExtSpritemap_Torizo_SonicBoom_Swipe_FaceLeft_LeftFootFwd_3
    dw $0002,ExtSpritemap_Torizo_SonicBoom_Swipe_FaceLeft_LeftFootFwd_2
    dw $0002,ExtSpritemap_Torizo_SonicBoom_Swipe_FaceLeft_LeftFootFwd_1
    dw Instruction_Torizo_SpawnBombTorizoSonicBoomWithParameterY,$0001
    dw $0002,ExtSpritemap_Torizo_SonicBoom_Swipe_FaceLeft_LeftFootFwd_0
    dw $0038,ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_5
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate
    dw InstList_Torizo_FacingLeft_SonicBooms_LeftFootForward_1
    dw Instruction_Common_Enemy0FB2_InY
    dw Function_Torizo_Movement_Walking
    dw Instruction_Torizo_Return


;;; $BB5C: Instruction list - callable - explosive swipe - facing left - right foot forward ;;;
InstList_Torizo_FacingLeft_ExplosiveSwipe_RightFootForward:
    dw Instruction_Common_Enemy0FB2_InY
    dw Function_Torizo_Movement_Attacking
    dw $0003,ExtendedSpritemaps_Torizo_Attacks_FaceLeft_RightFootForward
    dw $0003,ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_0
    dw $0003,ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_1
    dw $0003,ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_2
    dw $0003,ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_3
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY,$0000
    dw $0003,ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_4
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY,$0002
    dw $0001,ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_3
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY,$0004
    dw $0001,ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_2
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY,$0006
    dw $0001,ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_1
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY,$0008
    dw $0001,ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_0
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY,$000A
    dw $0003,ExtendedSpritemaps_Torizo_Attacks_FaceLeft_RightFootForward
    dw $0003,ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_5
    dw $0003,ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_RightFootForward_0
    dw $0003,ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_RightFootForward_1
    dw $0003,ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_RightFootForward_2
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY,$000C
    dw $0003,ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_RightFootForward_3
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY,$000E
    dw $0001,ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_RightFootForward_2
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY,$0010
    dw $0001,ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_RightFootForward_1
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY,$0012
    dw $0001,ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_RightFootForward_0
    dw $0010,ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_5
    dw Instruction_Common_Enemy0FB2_InY
    dw Function_Torizo_Movement_Walking
    dw Instruction_Torizo_Return


;;; $BBDE: Instruction list - callable - explosive swipe - facing left - left foot forward ;;;
InstList_Torizo_FacingLeft_ExplosiveSwipe_LeftFootForward:
    dw Instruction_Common_Enemy0FB2_InY
    dw Function_Torizo_Movement_Attacking
    dw $0003,ExtendedSpritemaps_Torizo_Attacks_FaceLeft_LeftFootForward
    dw $0003,ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_0
    dw $0003,ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_1
    dw $0003,ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_2
    dw $0003,ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_3
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY,$0000
    dw $0003,ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_4
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY,$0002
    dw $0001,ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_3
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY,$0004
    dw $0001,ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_2
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY,$0006
    dw $0001,ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_1
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY,$0008
    dw $0001,ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_0
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY,$000A
    dw $0003,ExtendedSpritemaps_Torizo_Attacks_FaceLeft_LeftFootForward
    dw $0003,ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_5
    dw $0003,ExtSpritemap_Torizo_SonicBoom_Swipe_FaceLeft_LeftFootFwd_0
    dw $0003,ExtSpritemap_Torizo_SonicBoom_Swipe_FaceLeft_LeftFootFwd_1
    dw $0003,ExtSpritemap_Torizo_SonicBoom_Swipe_FaceLeft_LeftFootFwd_2
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY,$000C
    dw $0003,ExtSpritemap_Torizo_SonicBoom_Swipe_FaceLeft_LeftFootFwd_3
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY,$000E
    dw $0001,ExtSpritemap_Torizo_SonicBoom_Swipe_FaceLeft_LeftFootFwd_2
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY,$0010
    dw $0001,ExtSpritemap_Torizo_SonicBoom_Swipe_FaceLeft_LeftFootFwd_1
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY,$0012
    dw $0001,ExtSpritemap_Torizo_SonicBoom_Swipe_FaceLeft_LeftFootFwd_0
    dw $0010,ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_5
    dw Instruction_Common_Enemy0FB2_InY
    dw Function_Torizo_Movement_Walking
    dw Instruction_Torizo_Return


;;; $BC60: Instruction list - jumping forwards - facing left ;;;
InstList_Torizo_FacingLeft_JumpingForwards_0:
    dw Instruction_Common_Enemy0FB2_InY
    dw Function_Torizo_Movement_Jumping_Falling
    dw Instruction_Torizo_LinkInstructionInY
    dw InstList_Torizo_FacingLeft_Falling_0
    dw $0005,ExtendedSpritemaps_Torizo_Jumping_Falling_FacingLeft_0
    dw $0005,ExtendedSpritemaps_Torizo_Jumping_Falling_FacingLeft_1

InstList_Torizo_FacingLeft_JumpingForwards_1:
    dw $0001,ExtendedSpritemaps_Torizo_Jumping_Falling_FacingLeft_2
    dw Instruction_Torizo_GotoY_IfRising
    dw InstList_Torizo_FacingLeft_JumpingForwards_1


;;; $BC78: Instruction list - falling - facing left ;;;
InstList_Torizo_FacingLeft_Falling_0:
    dw Instruction_Common_Enemy0FB2_InY
    dw Function_Torizo_Movement_Jumping_Falling
    dw Instruction_Torizo_LinkInstructionInY
    dw InstList_Torizo_FacingLeft_Falling_2

InstList_Torizo_FacingLeft_Falling_1:
    dw $0005,ExtendedSpritemaps_Torizo_Jumping_Falling_FacingLeft_1
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


;;; $BC96: Instruction list - jumping backwards - facing left - landing left foot forward ;;;
InstList_Torizo_FacingLeft_JumpingBackward_LandLeftFootFwd_0:
    dw Instruction_Common_Enemy0FB2_InY
    dw Function_Torizo_Movement_Jumping_Falling
    dw Instruction_Torizo_LinkInstructionInY
    dw InstList_Torizo_FacingLeft_JumpingBackward_LandLeftFootFwd_2
    dw $0005,ExtendedSpritemaps_Torizo_Jumping_Falling_FacingLeft_0
    dw $0005,ExtendedSpritemaps_Torizo_Jumping_Falling_FacingLeft_1

InstList_Torizo_FacingLeft_JumpingBackward_LandLeftFootFwd_1:
    dw $0001,ExtendedSpritemaps_Torizo_Jumping_Falling_FacingLeft_2
    dw Instruction_Torizo_GotoY_IfRising
    dw InstList_Torizo_FacingLeft_JumpingBackward_LandLeftFootFwd_1

InstList_Torizo_FacingLeft_JumpingBackward_LandLeftFootFwd_2:
    dw Instruction_Common_Enemy0FB2_InY
    dw Function_Torizo_Movement_Jumping_Falling
    dw Instruction_Torizo_LinkInstructionInY
    dw InstList_Torizo_FacingLeft_JumpingBackward_LandLeftFootFwd_4

InstList_Torizo_FacingLeft_JumpingBackward_LandLeftFootFwd_3:
    dw $0005,ExtendedSpritemaps_Torizo_Jumping_Falling_FacingLeft_1
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


;;; $BCD2: Instruction list - jumping backwards - facing left - landing right foot forward ;;;
InstList_Torizo_FacingLeft_JumpingBackward_RightFootFwd_0:
    dw Instruction_Common_Enemy0FB2_InY
    dw Function_Torizo_Movement_Jumping_Falling
    dw Instruction_Torizo_LinkInstructionInY
    dw InstList_Torizo_FacingLeft_JumpingBackward_RightFootFwd_2
    dw $0005,ExtendedSpritemaps_Torizo_Jumping_Falling_FacingLeft_0
    dw $0005,ExtendedSpritemaps_Torizo_Jumping_Falling_FacingLeft_1

InstList_Torizo_FacingLeft_JumpingBackward_RightFootFwd_1:
    dw $0001,ExtendedSpritemaps_Torizo_Jumping_Falling_FacingLeft_2
    dw Instruction_Torizo_GotoY_IfRising
    dw InstList_Torizo_FacingLeft_JumpingBackward_RightFootFwd_1

InstList_Torizo_FacingLeft_JumpingBackward_RightFootFwd_2:
    dw Instruction_Common_Enemy0FB2_InY
    dw Function_Torizo_Movement_Jumping_Falling
    dw Instruction_Torizo_LinkInstructionInY
    dw InstList_Torizo_FacingLeft_JumpingBackward_RightFootFwd_4

InstList_Torizo_FacingLeft_JumpingBackward_RightFootFwd_3:
    dw $0005,ExtendedSpritemaps_Torizo_Jumping_Falling_FacingLeft_1
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


;;; $BD0E: Instruction list - faceless - turning left ;;;
InstList_Torizo_FacingLeft_Faceless_TurningLeft:
    dw Instruction_Torizo_FunctionInY
    dw Function_Torizo_SimpleMovement
    dw Instruction_Torizo_SetTorizoTurningAroundFlag
    dw $0008,ExtendedSpritemaps_Torizo_FacingScreen_Turning_Dodging


;;; $BD18: Instruction list - faceless - walking left - right leg moving ;;;
InstList_Torizo_FacingLeft_Faceless_Walking_RightLegMoving:
    dw Instruction_Torizo_SetSteppedLeftWithLeftFootState
    dw Instruction_Torizo_FunctionInY
    dw Function_Torizo_NormalMovement
    dw Instruction_Common_Enemy0FB2_InY
    dw Function_Torizo_Movement_Walking
    dw Instruction_Torizo_SpawnLowHealthInitialDroolIfHealthIsLow
    dw Instruction_Torizo_PlayTorizoFootstepsSFX
    dw $0001,ExtendedSpritemaps_Torizo_WalkingLeft_RightLegMoving_0
    dw Instruction_Torizo_CallYIfSamusIsLessThan38PixelsInFront
    dw InstList_Torizo_FacingLeft_ExplosiveSwipe_LeftFootForward
    dw Instruction_Torizo_BTWalkingMovement_Faceless_IndexInY,$0002
    dw $0005,ExtendedSpritemaps_Torizo_WalkingLeft_RightLegMoving_1
    dw Instruction_Torizo_BTWalkingMovement_Faceless_IndexInY,$0004
    dw $0005,ExtendedSpritemaps_Torizo_WalkingLeft_RightLegMoving_2
    dw Instruction_Torizo_BTWalkingMovement_Faceless_IndexInY,$0006
    dw $0005,ExtendedSpritemaps_Torizo_WalkingLeft_RightLegMoving_3
    dw Instruction_Torizo_BTWalkingMovement_Faceless_IndexInY,$0008
    dw $0005,ExtendedSpritemaps_Torizo_WalkingLeft_RightLegMoving_4
    dw Instruction_Torizo_BTWalkingMovement_Faceless_IndexInY,$000A


;;; $BD52: Instruction list - faceless - walking left - left leg moving ;;;
InstList_Torizo_FacingLeft_Faceless_Walking_LeftLegMoving:
    dw Instruction_Torizo_SetSteppedLeftWithRightFootState
    dw Instruction_Torizo_FunctionInY
    dw Function_Torizo_NormalMovement
    dw Instruction_Common_Enemy0FB2_InY
    dw Function_Torizo_Movement_Walking
    dw Instruction_Torizo_SpawnLowHealthInitialDroolIfHealthIsLow
    dw Instruction_Torizo_PlayTorizoFootstepsSFX
    dw $0001,ExtendedSpritemaps_Torizo_WalkingLeft_LeftLegMoving_0
    dw Instruction_Torizo_CallYIfSamusIsLessThan38PixelsInFront
    dw InstList_Torizo_FacingLeft_ExplosiveSwipe_RightFootForward
    dw Instruction_Torizo_BTWalkingMovement_Faceless_IndexInY,$000C
    dw $0005,ExtendedSpritemaps_Torizo_WalkingLeft_LeftLegMoving_1
    dw Instruction_Torizo_BTWalkingMovement_Faceless_IndexInY,$000E
    dw $0005,ExtendedSpritemaps_Torizo_WalkingLeft_LeftLegMoving_2
    dw Instruction_Torizo_BTWalkingMovement_Faceless_IndexInY,$0010
    dw $0005,ExtendedSpritemaps_Torizo_WalkingLeft_LeftLegMoving_3
    dw Instruction_Torizo_BTWalkingMovement_Faceless_IndexInY,$0012
    dw $0005,ExtendedSpritemaps_Torizo_WalkingLeft_LeftLegMoving_4
    dw Instruction_Torizo_BTWalkingMovement_Faceless_IndexInY,$0000
    dw Instruction_Common_GotoY
    dw InstList_Torizo_FacingLeft_Faceless_Walking_RightLegMoving


if !FEATURE_KEEP_UNREFERENCED
;;; $BD90: Unused. Instruction list - stand up - facing right ;;;
UNUSED_InstList_Torizo_FacingRight_StandUp_AABD90:
    dw Instruction_Torizo_SetSteppedRightWithLeftFootState
    dw $0001
    dw ExtendedSpritemap_Torizo_Blank
    dw Instruction_Torizo_FunctionInY
    dw Function_Torizo_WakeWhenBombTorizoChozoFinishesCrumbling
    dw Instruction_Common_Sleep
    dw Instruction_Torizo_FunctionInY
    dw Function_Torizo_SimpleMovement
    dw $0020,ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingRight_0
    dw Instruction_Torizo_StandingUpMovement_IndexInY,$0010
    dw $0010,ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingRight_1
    dw Instruction_Torizo_StandingUpMovement_IndexInY,$0012
    dw $0008,ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingRight_2
    dw Instruction_Torizo_StandingUpMovement_IndexInY,$0014
    dw $0008,ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingRight_3
    dw Instruction_Torizo_StandingUpMovement_IndexInY,$0016
    dw $0008,ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingRight_4
    dw Instruction_Torizo_StandingUpMovement_IndexInY,$0018
    dw $0008,ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingRight_5
    dw Instruction_Torizo_StandingUpMovement_IndexInY,$001A
    dw $0008,ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingRight_6
    dw Instruction_Common_GotoY
    dw InstList_Torizo_FacingRight_Walking_RightLegMoving
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $BDD8: Instruction list - turning right ;;;
InstList_Torizo_FacingRight_TurningRight:
    dw Instruction_Torizo_FunctionInY
    dw Function_Torizo_SimpleMovement
    dw Instruction_Torizo_SetTorizoTurningAroundFlag
    dw $0018,ExtendedSpritemaps_Torizo_FacingScreen_Turning_Dodging


;;; $BDE2: Instruction list - walking right - left leg moving ;;;
InstList_Torizo_FacingRight_Walking_LeftLegMoving:
    dw Instruction_Torizo_SetSteppedRightWithRightFootState
    dw Instruction_Torizo_FunctionInY
    dw Function_Torizo_NormalMovement
    dw Instruction_Common_Enemy0FB2_InY
    dw Function_Torizo_Movement_Walking
    dw Instruction_Torizo_SpawnLowHealthInitialDroolIfHealthIsLow
    dw Instruction_Torizo_PlayTorizoFootstepsSFX
    dw $000A,ExtendedSpritemaps_Torizo_WalkingRight_LeftLegMoving_0
    dw Instruction_Torizo_CallYIfSamusIsLessThan38PixelsInFront
    dw InstList_Torizo_FacingRight_ExplosiveSwipe_RightFootForward
    dw Instruction_Torizo_GotoYAndJumpBackwardsIfLessThan20Pixels
    dw InstList_Torizo_FacingRight_JumpBackward_LandRightFootFwd_0
    dw Instruction_Torizo_BombTorizoWalkingMovement_Normal_IndexInY,$0016
    dw $0006,ExtendedSpritemaps_Torizo_WalkingRight_LeftLegMoving_1
    dw Instruction_Torizo_GotoYAndJumpBackwardsIfLessThan20Pixels
    dw InstList_Torizo_FacingRight_JumpBackward_LandRightFootFwd_0
    dw Instruction_Torizo_BombTorizoWalkingMovement_Normal_IndexInY,$0018
    dw $0006,ExtendedSpritemaps_Torizo_WalkingRight_LeftLegMoving_2
    dw Instruction_Torizo_GotoYAndJumpBackwardsIfLessThan20Pixels
    dw InstList_Torizo_FacingRight_JumpBackward_LandRightFootFwd_0
    dw Instruction_Torizo_BombTorizoWalkingMovement_Normal_IndexInY,$001A
    dw $0006,ExtendedSpritemaps_Torizo_WalkingRight_LeftLegMoving_3
    dw Instruction_Torizo_GotoYAndJumpBackwardsIfLessThan20Pixels
    dw InstList_Torizo_FacingRight_JumpBackward_LandRightFootFwd_0
    dw Instruction_Torizo_BombTorizoWalkingMovement_Normal_IndexInY,$001C
    dw $0006,ExtendedSpritemaps_Torizo_WalkingRight_LeftLegMoving_4
    dw Instruction_Torizo_GotoYAndJumpBackwardsIfLessThan20Pixels
    dw InstList_Torizo_FacingRight_JumpBackward_LandRightFootFwd_0
    dw Instruction_Torizo_BombTorizoWalkingMovement_Normal_IndexInY,$001E


;;; $BE30: Instruction list - walking right - right leg moving ;;;
InstList_Torizo_FacingRight_Walking_RightLegMoving:
    dw Instruction_Torizo_SetSteppedRightWithLeftFootState
    dw Instruction_Torizo_FunctionInY
    dw Function_Torizo_NormalMovement
    dw Instruction_Common_Enemy0FB2_InY
    dw Function_Torizo_Movement_Walking
    dw Instruction_Torizo_SpawnLowHealthInitialDroolIfHealthIsLow
    dw Instruction_Torizo_PlayTorizoFootstepsSFX
    dw $000A,ExtendedSpritemaps_Torizo_WalkingRight_RightLegMoving_0
    dw Instruction_Torizo_CallYIfSamusIsLessThan38PixelsInFront
    dw InstList_Torizo_FacingRight_ExplosiveSwipe_LeftFootForward
    dw Instruction_Torizo_GotoYAndJumpBackwardsIfLessThan20Pixels
    dw InstList_Torizo_FacingRight_JumpBackwards_LandLeftFootFwd_0
    dw Instruction_Torizo_BombTorizoWalkingMovement_Normal_IndexInY,$0020
    dw $0006,ExtendedSpritemaps_Torizo_WalkingRight_RightLegMoving_1
    dw Instruction_Torizo_GotoYAndJumpBackwardsIfLessThan20Pixels
    dw InstList_Torizo_FacingRight_JumpBackwards_LandLeftFootFwd_0
    dw Instruction_Torizo_BombTorizoWalkingMovement_Normal_IndexInY,$0022
    dw $0006,ExtendedSpritemaps_Torizo_WalkingRight_RightLegMoving_2
    dw Instruction_Torizo_GotoYAndJumpBackwardsIfLessThan20Pixels
    dw InstList_Torizo_FacingRight_JumpBackwards_LandLeftFootFwd_0
    dw Instruction_Torizo_BombTorizoWalkingMovement_Normal_IndexInY,$0024
    dw $0006,ExtendedSpritemaps_Torizo_WalkingRight_RightLegMoving_3
    dw Instruction_Torizo_GotoYAndJumpBackwardsIfLessThan20Pixels
    dw InstList_Torizo_FacingRight_JumpBackwards_LandLeftFootFwd_0
    dw Instruction_Torizo_BombTorizoWalkingMovement_Normal_IndexInY,$0026
    dw $0006,ExtendedSpritemaps_Torizo_WalkingRight_RightLegMoving_4
    dw Instruction_Torizo_BombTorizoWalkingMovement_Normal_IndexInY,$0014
    dw Instruction_Common_GotoY
    dw InstList_Torizo_FacingRight_Walking_LeftLegMoving


;;; $BE7E: Instruction list - callable - spewing chozo orbs - facing right - left foot forward ;;;
InstList_Torizo_FacingRight_SpewingChozoOrbs_LeftFootFwd_0:
    dw Instruction_Common_Enemy0FB2_InY
    dw Function_Torizo_Movement_Attacking
    dw $0010,ExtendedSpritemaps_Torizo_Attacks_FaceRight_LeftFootForward
    dw $0008,ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_LeftFootForward_0
    dw $0008,ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_LeftFootForward_1
    dw $0008,ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_LeftFootForward_2
    dw $0008,ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_LeftFootForward_3
    dw $0010,ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_LeftFootForward_4
    dw Instruction_Torizo_PlayShotTorizoSFX
    dw Instruction_Common_TimerInY,$0003

InstList_Torizo_FacingRight_SpewingChozoOrbs_LeftFootFwd_1:
    dw Instruction_Torizo_SpawnBombTorizosChozoOrbs
    dw Instruction_Common_WaitYFrames,$0010
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate
    dw InstList_Torizo_FacingRight_SpewingChozoOrbs_LeftFootFwd_1
    dw $0008,ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_LeftFootForward_3
    dw $0008,ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_LeftFootForward_2
    dw $0008,ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_LeftFootForward_1
    dw $0048,ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_LeftFootForward_0
    dw Instruction_Common_Enemy0FB2_InY
    dw Function_Torizo_Movement_Walking
    dw Instruction_Torizo_Return


;;; $BEC0: Instruction list - callable - spewing chozo orbs - facing right - right foot forward ;;;
InstList_Torizo_FacingRight_SpewingChozoOrbs_RightFootFwd_0:
    dw Instruction_Common_Enemy0FB2_InY
    dw Function_Torizo_Movement_Attacking
    dw $0010,ExtendedSpritemaps_Torizo_Attacks_FaceRight_RightFootForward
    dw $0008,ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_RightFootForward_0
    dw $0008,ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_RightFootForward_1
    dw $0008,ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_RightFootForward_2
    dw $0008,ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_RightFootForward_3
    dw $0010,ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_RightFootForward_4
    dw Instruction_Torizo_PlayShotTorizoSFX
    dw Instruction_Common_TimerInY,$0003

InstList_Torizo_FacingRight_SpewingChozoOrbs_RightFootFwd_1:
    dw Instruction_Torizo_SpawnBombTorizosChozoOrbs
    dw Instruction_Common_WaitYFrames,$0010
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate
    dw InstList_Torizo_FacingRight_SpewingChozoOrbs_RightFootFwd_1
    dw $0008,ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_RightFootForward_3
    dw $0008,ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_RightFootForward_2
    dw $0008,ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_RightFootForward_1
    dw $0048,ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_RightFootForward_0
    dw Instruction_Common_Enemy0FB2_InY
    dw Function_Torizo_Movement_Walking
    dw Instruction_Torizo_Return


;;; $BF02: Instruction list - callable - sonic booms - facing right - left foot forward ;;;
InstList_Torizo_FacingRight_SonicBooms_LeftFootForward_0:
    dw Instruction_Common_Enemy0FB2_InY
    dw Function_Torizo_Movement_Attacking
    dw Instruction_Common_TimerInY,$0004

InstList_Torizo_FacingRight_SonicBooms_LeftFootForward_1:
    dw $0006,ExtendedSpritemaps_Torizo_Attacks_FaceRight_LeftFootForward
    dw $0006,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_0
    dw $0006,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_1
    dw $0006,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_2
    dw $0006,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_3
    dw $0006,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_4
    dw $0002,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_3
    dw $0002,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_2
    dw Instruction_Torizo_SpawnBombTorizoSonicBoomWithParameterY,$0000
    dw $0002,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_1
    dw $0018,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_0
    dw $0006,ExtendedSpritemaps_Torizo_Attacks_FaceRight_LeftFootForward
    dw $0006,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_5
    dw $0006,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_6
    dw $0006,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_7
    dw $0006,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_8
    dw $0006,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_9
    dw $0002,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_8
    dw $0002,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_7
    dw Instruction_Torizo_SpawnBombTorizoSonicBoomWithParameterY,$0001
    dw $0002,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_6
    dw $0038,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_5
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate
    dw InstList_Torizo_FacingRight_SonicBooms_LeftFootForward_1
    dw Instruction_Common_Enemy0FB2_InY
    dw Function_Torizo_Movement_Walking
    dw Instruction_Torizo_Return


;;; $BF6C: Instruction list - callable - sonic booms - facing right - right foot forward ;;;
InstList_Torizo_FacingRight_SonicBooms_RightFootForward_0:
    dw Instruction_Common_Enemy0FB2_InY
    dw Function_Torizo_Movement_Attacking
    dw Instruction_Common_TimerInY,$0004

InstList_Torizo_FacingRight_SonicBooms_RightFootForward_1:
    dw $0006,ExtendedSpritemaps_Torizo_Attacks_FaceRight_RightFootForward
    dw $0006,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_0
    dw $0006,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_1
    dw $0006,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_2
    dw $0006,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_3
    dw $0006,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_4
    dw $0002,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_3
    dw $0002,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_2
    dw Instruction_Torizo_SpawnBombTorizoSonicBoomWithParameterY,$0000
    dw $0002,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_1
    dw $0018,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_0
    dw $0006,ExtendedSpritemaps_Torizo_Attacks_FaceRight_RightFootForward
    dw $0006,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_5
    dw $0006,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_6
    dw $0006,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_7
    dw $0006,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_8
    dw $0006,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_9
    dw $0002,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_8
    dw $0002,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_7
    dw Instruction_Torizo_SpawnBombTorizoSonicBoomWithParameterY,$0001
    dw $0002,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_6
    dw $0038,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_5
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate
    dw InstList_Torizo_FacingRight_SonicBooms_RightFootForward_1
    dw Instruction_Common_Enemy0FB2_InY
    dw Function_Torizo_Movement_Walking
    dw Instruction_Torizo_Return


;;; $BFD6: Instruction list - callable - explosive swipe - facing right - left foot forward ;;;
InstList_Torizo_FacingRight_ExplosiveSwipe_LeftFootForward:
    dw Instruction_Common_Enemy0FB2_InY
    dw Function_Torizo_Movement_Attacking
    dw $0003,ExtendedSpritemaps_Torizo_Attacks_FaceRight_LeftFootForward
    dw $0003,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_0
    dw $0003,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_1
    dw $0003,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_2
    dw $0003,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_3
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY,$0000
    dw $0003,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_4
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY,$0002
    dw $0001,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_3
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY,$0004
    dw $0001,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_2
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY,$0006
    dw $0001,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_1
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY,$0008
    dw $0001,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_0
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY,$000A
    dw $0003,ExtendedSpritemaps_Torizo_Attacks_FaceRight_LeftFootForward
    dw $0003,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_5
    dw $0003,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_6
    dw $0003,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_7
    dw $0003,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_8
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY,$000C
    dw $0003,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_9
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY,$000E
    dw $0001,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_8
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY,$0010
    dw $0001,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_7
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY,$0012
    dw $0001,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_6
    dw $0010,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_5
    dw Instruction_Common_Enemy0FB2_InY
    dw Function_Torizo_Movement_Walking
    dw Instruction_Torizo_Return


;;; $C058: Instruction list - callable - explosive swipe - facing right - right foot forward ;;;
InstList_Torizo_FacingRight_ExplosiveSwipe_RightFootForward:
    dw Instruction_Common_Enemy0FB2_InY
    dw Function_Torizo_Movement_Attacking
    dw $0003,ExtendedSpritemaps_Torizo_Attacks_FaceRight_RightFootForward
    dw $0003,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_0
    dw $0003,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_1
    dw $0003,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_2
    dw $0003,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_3
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY,$0000
    dw $0003,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_4
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY,$0002
    dw $0001,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_3
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY,$0004
    dw $0001,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_2
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY,$0006
    dw $0001,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_1
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY,$0008
    dw $0001,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_0
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY,$000A
    dw $0003,ExtendedSpritemaps_Torizo_Attacks_FaceRight_RightFootForward
    dw $0003,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_5
    dw $0003,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_6
    dw $0003,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_7
    dw $0003,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_8
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY,$000C
    dw $0003,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_9
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY,$000E
    dw $0001,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_8
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY,$0010
    dw $0001,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_7
    dw Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY,$0012
    dw $0001,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_6
    dw $0010,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_5
    dw Instruction_Common_Enemy0FB2_InY
    dw Function_Torizo_Movement_Walking
    dw Instruction_Torizo_Return


;;; $C0DA: Instruction list - jumping forwards - facing right ;;;
InstList_Torizo_FacingRight_JumpingForwards_0:
    dw Instruction_Common_Enemy0FB2_InY
    dw Function_Torizo_Movement_Jumping_Falling
    dw Instruction_Torizo_LinkInstructionInY
    dw InstList_Torizo_FacingRight_Falling_0
    dw $0005,ExtendedSpritemaps_Torizo_Jumping_Falling_FacingRight_0
    dw $0005,ExtendedSpritemaps_Torizo_Jumping_Falling_FacingRight_1

InstList_Torizo_FacingRight_JumpingForwards_1:
    dw $0001,ExtendedSpritemaps_Torizo_Jumping_Falling_FacingRight_2
    dw Instruction_Torizo_GotoY_IfRising
    dw InstList_Torizo_FacingRight_JumpingForwards_1


;;; $C0F2: Instruction list - falling - facing right ;;;
InstList_Torizo_FacingRight_Falling_0:
    dw Instruction_Common_Enemy0FB2_InY
    dw Function_Torizo_Movement_Jumping_Falling
    dw Instruction_Torizo_LinkInstructionInY
    dw InstList_Torizo_FacingRight_Falling_2

InstList_Torizo_FacingRight_Falling_1:
    dw $0005,ExtendedSpritemaps_Torizo_Jumping_Falling_FacingRight_1
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


;;; $C110: Instruction list - jumping backwards - facing right - landing right foot forward ;;;
InstList_Torizo_FacingRight_JumpBackward_LandRightFootFwd_0:
    dw Instruction_Common_Enemy0FB2_InY
    dw Function_Torizo_Movement_Jumping_Falling
    dw Instruction_Torizo_LinkInstructionInY
    dw InstList_Torizo_FacingRight_JumpBackward_LandRightFootFwd_2
    dw $0005,ExtendedSpritemaps_Torizo_Jumping_Falling_FacingRight_0
    dw $0005,ExtendedSpritemaps_Torizo_Jumping_Falling_FacingRight_1

InstList_Torizo_FacingRight_JumpBackward_LandRightFootFwd_1:
    dw $0001,ExtendedSpritemaps_Torizo_Jumping_Falling_FacingRight_2
    dw Instruction_Torizo_GotoY_IfRising
    dw InstList_Torizo_FacingRight_JumpBackward_LandRightFootFwd_1

InstList_Torizo_FacingRight_JumpBackward_LandRightFootFwd_2:
    dw Instruction_Common_Enemy0FB2_InY
    dw Function_Torizo_Movement_Jumping_Falling
    dw Instruction_Torizo_LinkInstructionInY
    dw InstList_Torizo_FacingRight_JumpBackward_LandRightFootFwd_4

InstList_Torizo_FacingRight_JumpBackward_LandRightFootFwd_3:
    dw $0005,ExtendedSpritemaps_Torizo_Jumping_Falling_FacingRight_1
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


;;; $C14C: Instruction list - jumping backwards - facing right - landing left foot forward ;;;
InstList_Torizo_FacingRight_JumpBackwards_LandLeftFootFwd_0:
    dw Instruction_Common_Enemy0FB2_InY
    dw Function_Torizo_Movement_Jumping_Falling
    dw Instruction_Torizo_LinkInstructionInY
    dw InstList_Torizo_FacingRight_JumpBackwards_LandLeftFootFwd_2
    dw $0005,ExtendedSpritemaps_Torizo_Jumping_Falling_FacingRight_0
    dw $0005,ExtendedSpritemaps_Torizo_Jumping_Falling_FacingRight_1

InstList_Torizo_FacingRight_JumpBackwards_LandLeftFootFwd_1:
    dw $0001,ExtendedSpritemaps_Torizo_Jumping_Falling_FacingRight_2
    dw Instruction_Torizo_GotoY_IfRising
    dw InstList_Torizo_FacingRight_JumpBackwards_LandLeftFootFwd_1

InstList_Torizo_FacingRight_JumpBackwards_LandLeftFootFwd_2:
    dw Instruction_Common_Enemy0FB2_InY
    dw Function_Torizo_Movement_Jumping_Falling
    dw Instruction_Torizo_LinkInstructionInY
    dw InstList_Torizo_FacingRight_JumpBackwards_LandLeftFootFwd_4

InstList_Torizo_FacingRight_JumpBackwards_LandLeftFootFwd_3:
    dw $0005,ExtendedSpritemaps_Torizo_Jumping_Falling_FacingRight_1
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


;;; $C188: Instruction list - faceless - turning right ;;;
InstList_Torizo_FacingRight_Faceless_TurningRight:
    dw Instruction_Torizo_FunctionInY
    dw Function_Torizo_SimpleMovement
    dw Instruction_Torizo_SetTorizoTurningAroundFlag
    dw $0008,ExtendedSpritemaps_Torizo_FacingScreen_Turning_Dodging


;;; $C192: Instruction list - faceless - walking right - left leg moving ;;;
InstList_Torizo_FacingRight_Faceless_Walking_LeftLegMoving:
    dw Instruction_Torizo_SetSteppedRightWithRightFootState
    dw Instruction_Torizo_FunctionInY
    dw Function_Torizo_NormalMovement
    dw Instruction_Common_Enemy0FB2_InY
    dw Function_Torizo_Movement_Walking
    dw Instruction_Torizo_SpawnLowHealthInitialDroolIfHealthIsLow
    dw Instruction_Torizo_PlayTorizoFootstepsSFX
    dw $0001,ExtendedSpritemaps_Torizo_WalkingRight_LeftLegMoving_0
    dw Instruction_Torizo_CallYIfSamusIsLessThan38PixelsInFront
    dw InstList_Torizo_FacingRight_ExplosiveSwipe_RightFootForward
    dw Instruction_Torizo_BTWalkingMovement_Faceless_IndexInY,$0016
    dw $0005,ExtendedSpritemaps_Torizo_WalkingRight_LeftLegMoving_1
    dw Instruction_Torizo_BTWalkingMovement_Faceless_IndexInY,$0018
    dw $0005,ExtendedSpritemaps_Torizo_WalkingRight_LeftLegMoving_2
    dw Instruction_Torizo_BTWalkingMovement_Faceless_IndexInY,$001A
    dw $0005,ExtendedSpritemaps_Torizo_WalkingRight_LeftLegMoving_3
    dw Instruction_Torizo_BTWalkingMovement_Faceless_IndexInY,$001C
    dw $0005,ExtendedSpritemaps_Torizo_WalkingRight_LeftLegMoving_4
    dw Instruction_Torizo_BTWalkingMovement_Faceless_IndexInY,$001E


;;; $C1CC: Instruction list - faceless - walking right - right leg moving ;;;
InstList_Torizo_FacingRight_Faceless_Walking_RightLegMoving:
    dw Instruction_Torizo_SetSteppedRightWithLeftFootState
    dw Instruction_Torizo_FunctionInY
    dw Function_Torizo_NormalMovement
    dw Instruction_Common_Enemy0FB2_InY
    dw Function_Torizo_Movement_Walking
    dw Instruction_Torizo_SpawnLowHealthInitialDroolIfHealthIsLow
    dw Instruction_Torizo_PlayTorizoFootstepsSFX
    dw $0001,ExtendedSpritemaps_Torizo_WalkingRight_RightLegMoving_0
    dw Instruction_Torizo_CallYIfSamusIsLessThan38PixelsInFront
    dw InstList_Torizo_FacingRight_ExplosiveSwipe_LeftFootForward
    dw Instruction_Torizo_BTWalkingMovement_Faceless_IndexInY,$0020
    dw $0005,ExtendedSpritemaps_Torizo_WalkingRight_RightLegMoving_1
    dw Instruction_Torizo_BTWalkingMovement_Faceless_IndexInY,$0022
    dw $0005,ExtendedSpritemaps_Torizo_WalkingRight_RightLegMoving_2
    dw Instruction_Torizo_BTWalkingMovement_Faceless_IndexInY,$0024
    dw $0005,ExtendedSpritemaps_Torizo_WalkingRight_RightLegMoving_3
    dw Instruction_Torizo_BTWalkingMovement_Faceless_IndexInY,$0026
    dw $0005,ExtendedSpritemaps_Torizo_WalkingRight_RightLegMoving_4
    dw Instruction_Torizo_BTWalkingMovement_Faceless_IndexInY,$0014
    dw Instruction_Common_GotoY
    dw InstList_Torizo_FacingRight_Faceless_Walking_LeftLegMoving


;;; $C20A: Make torizo jump forwards ;;;
MakeTorizoJumpForwards:
    LDA.W Torizo.graphicalProperties,X : BMI .facingRight
    LDA.W #$FE00
    BRA +

  .facingRight:
    LDA.W #$0200

+   STA.W Torizo.XVelocity,X
    LDA.W #$FA40 : STA.W Torizo.YVelocity,X
    LDA.W #$0028 : STA.W Torizo.YAcceleration,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    RTS


;;; $C22D: Make torizo jump backwards ;;;
MakeTorizoJumpBackwards:
    LDA.W Torizo.graphicalProperties,X : BMI .facingRight
    LDA.W #$0300
    BRA +

  .facingRight:
    LDA.W #$FD00

+   STA.W Torizo.XVelocity,X
    LDA.W #$FB80 : STA.W Torizo.YVelocity,X
    LDA.W #$0028 : STA.W Torizo.YAcceleration,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    RTS


;;; $C250: Load initial Bomb Torizo palettes ;;;
LoadInitialBombTorizoPalettes:
    PHX
    LDX.W #$001E

  .loop:
    LDA.W Palette_Torizo_InitialBombTorizo_SpritePalette2,X : STA.L TargetPalettes_SpriteP2,X
    LDA.W Palette_Torizo_InitialBombTorizo_SpritePalette1,X : STA.L TargetPalettes_SpriteP1,X
    DEX #2 : BPL .loop
    PLX
    RTS


;;; $C268: Load normal torizo target palettes ;;;
LoadNormalTorizoTargetPalettes:
    PHX
    LDX.W #$001E

  .loop:
    LDA.W Palette_Torizo_Normal_SpritePalette2,X : STA.L TargetPalettes_SpriteP2,X
    LDA.W Palette_Torizo_Normal_SpritePalette1,X : STA.L TargetPalettes_SpriteP1,X
    DEX #2 : BPL .loop
    PLX
    RTS


;;; $C280: Load initial Golden Torizo palettes ;;;
LoadInitialGoldenTorizoPalettes:
    PHX
    LDX.W #$001E

  .loop:
    LDA.W Palette_Torizo_InitialGoldenTorizo_SpritePalette2,X : STA.L TargetPalettes_SpriteP2,X
    LDA.W Palette_Torizo_InitialGoldenTorizo_SpritePalette1,X : STA.L TargetPalettes_SpriteP1,X
    DEX #2 : BPL .loop
    PLX
    RTS


;;; $C298: Load Golden Torizo palettes ;;;
LoadGoldenTorizoPalettes:
    PHX
    LDX.W #$001E

  .loop:
    LDA.W Palette_Torizo_GoldenTorizo_SpritePalette2,X : STA.L TargetPalettes_SpriteP2,X
    LDA.W Palette_Torizo_GoldenTorizo_SpritePalette1,X : STA.L TargetPalettes_SpriteP1,X
    DEX #2 : BPL .loop
    PLX
    RTS


;;; $C2B0: Load normal torizo palettes ;;;
LoadNormalTorizoPalettes:
    PHX
    LDX.W #$001E

  .loop:
    LDA.W Palette_Torizo_Normal_SpritePalette2,X : STA.L Palettes_SpriteP2,X
    LDA.W Palette_Torizo_Normal_SpritePalette1,X : STA.L Palettes_SpriteP1,X
    DEX #2 : BPL .loop
    PLX
    RTS


;;; $C2C8: RTL. Instruction - NOP ;;;
RTL_AAC2C8:
    RTL


;;; $C2C9: Instruction - set animation lock ;;;
Instruction_Torizo_SetAnimationLock:
    LDA.W #$7777 : STA.L Torizo.animationLockFlag,X
    RTL


;;; $C2D1: Instruction - clear animation lock ;;;
Instruction_Torizo_ClearAnimationLock:
    LDA.W #$0000 : STA.L Torizo.animationLockFlag,X
    RTL


;;; $C2D9: Instruction - go to [[Y]] if face blown up, else go to [[Y] + 2] if Golden Torizo ;;;
Instruction_Torizo_GotoY_IfFaceBlownUp_ElseGotoY2_IfGolden:
    BIT.W Torizo.behavioralProperties,X : BVS .faceBlownUp
    INY #2
    LDA.W AreaIndex : BNE .faceBlownUp
    INY #2
    RTL

  .faceBlownUp:
    LDA.W $0000,Y : TAY
    RTL


;;; $C2ED: Instruction - enemy link instruction = [[Y]] ;;;
Instruction_Torizo_LinkInstructionInY:
    LDA.W $0000,Y : STA.L Torizo.linkInstruction,X
    INY #2
    RTL


;;; $C2F7: Instruction - return ;;;
Instruction_Torizo_Return:
    LDA.L Torizo.linkInstruction,X : TAY
    RTL


;;; $C2FD: Instruction - go to [enemy gut explosion link instruction] ;;;
Instruction_Torizo_GotoGutExplosionLinkInstruction:
    LDA.L Torizo.gutExplosionLinkInstruction,X : TAY
    RTL


;;; $C303: Instruction - spawn 5 Bomb Torizo low-health explosions with parameter [[Y]] and sleep for 28h i-frames ;;;
Instruction_Torizo_Spawn5LowHealthExplosion_SleepFor28Frames:
    PHY
    LDA.W $0000,Y : PHA
    LDY.W #$0005

  .loop:
    PHY
    LDA.B $03,S
    LDY.W #EnemyProjectile_BombTorizoLowHealthExplosion
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    PLY : DEY : BPL .loop
    PLA : PLY
    INY #2
    TYA : STA.W Enemy.instList,X
    LDA.W #$0028 : STA.W Enemy.flashTimer,X : STA.W Enemy.instTimer,X
    PLA
    PEA.W ProcessEnemyInstructions_return-1
    RTL


;;; $C32F: Instruction - spawn torizo death explosion and sleep for 1 i-frame ;;;
Instruction_Torizo_SpawnTorizoDeathExplosion_SleepFor1IFrame:
    PHY
    LDY.W #EnemyProjectile_BombTorizoDeathExplosion
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    PLY
    TYA : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.flashTimer,X : STA.W Enemy.instTimer,X
    PLA
    PEA.W ProcessEnemyInstructions_return-1
    RTL


;;; $C34A: Instruction - spawn torizo landing dust clouds ;;;
Instruction_Torizo_SpawnTorizoLandingDustClouds:
    PHY
    LDY.W #EnemyProjectile_TorizoLandingDustCloud_RightFoot
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    LDY.W #EnemyProjectile_TorizoLandingDustCloud_LeftFoot
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    PLY
    RTL


;;; $C35B: Instruction - spawn low-health initial drool if health is low ;;;
Instruction_Torizo_SpawnLowHealthInitialDroolIfHealthIsLow:
    LDA.W Enemy.health,X : CMP.W #$015E : BCS .return
    PHY
    LDY.W #EnemyProjectile_BombTorizoInitialDrool
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    PLY

  .return:
    RTL


;;; $C36D: Instruction - set torizo turning around flag ;;;
Instruction_Torizo_SetTorizoTurningAroundFlag:
    LDA.W Torizo.graphicalProperties,X : ORA.W #$4000 : STA.W Torizo.graphicalProperties,X
    RTL


;;; $C377: Instruction - set stepped left with left foot state ;;;
Instruction_Torizo_SetSteppedLeftWithLeftFootState:
    LDA.W Torizo.graphicalProperties,X : AND.W #$1FFF : STA.W Torizo.graphicalProperties,X
    LDA.L Torizo.stepCounter,X : INC : STA.L Torizo.stepCounter,X
    RTL


;;; $C38A: Instruction - set stepped right with right foot state ;;;
Instruction_Torizo_SetSteppedRightWithRightFootState:
    LDA.W Torizo.graphicalProperties,X : AND.W #$1FFF : ORA.W #$8000 : STA.W Torizo.graphicalProperties,X
    LDA.L Torizo.stepCounter,X : INC : STA.L Torizo.stepCounter,X
    RTL


;;; $C3A0: Instruction - set stepped left with right foot state ;;;
Instruction_Torizo_SetSteppedLeftWithRightFootState:
    LDA.W Torizo.graphicalProperties,X : AND.W #$1FFF : ORA.W #$2000 : STA.W Torizo.graphicalProperties,X
    LDA.L Torizo.stepCounter,X : INC : STA.L Torizo.stepCounter,X
    RTL


;;; $C3B6: Instruction - set stepped right with left foot state ;;;
Instruction_Torizo_SetSteppedRightWithLeftFootState:
    LDA.W Torizo.graphicalProperties,X : AND.W #$1FFF : ORA.W #$A000 : STA.W Torizo.graphicalProperties,X
    LDA.L Torizo.stepCounter,X : INC : STA.L Torizo.stepCounter,X
    RTL


;;; $C3CC: Instruction - standing up movement - index [[Y]] ;;;
Instruction_Torizo_StandingUpMovement_IndexInY:
    PHY
    LDA.W $0000,Y : TAY
    LDA.W Enemy.XPosition,X : CLC : ADC.W .XVelocities,Y : STA.W Enemy.XPosition,X
    TYA : AND.W #$000F : TAY
    LDA.W Enemy.YPosition,X : CLC : ADC.W .YVelocities,Y : STA.W Enemy.YPosition,X
    PLY : INY #2
    RTL

  .XVelocities:
    dw $FFF7,$FFFA,$FFF9,$0005,$FFF0,$FFF9, $0000,$0000 ; 0..Ah: Facing left
    dw $0009,$0006,$0007,$FFFB,$0010,$0007, $0000,$0000 ; 10h..1Ah: Facing right

  .YVelocities:
    dw $0000,$FFFA,$FFFA,$FFF9,$0000,$0000, $0000,$0000


;;; $C41E: Instruction - sitting down movement - index [[Y]] ;;;
Instruction_Torizo_SittingDownMovement_IndexInY:
    PHY
    LDA.W $0000,Y : TAY
    LDA.W Enemy.XPosition,X : SEC : SBC.W .negatedXVelocities,Y : STA.W Enemy.XPosition,X
    TYA : AND.W #$000F : TAY
    LDA.W Enemy.YPosition,X : SEC : SBC.W .negatedYVelocities,Y : STA.W Enemy.YPosition,X
    PLY
    INY #2
    RTL

  .negatedXVelocities:
    dw $FFF7,$FFFA,$FFF9,$0005,$FFF0,$FFF9, $0000,$0000 ; 0..Ah: Facing left
    dw $0009,$0006,$0007,$FFFB,$0010,$0007, $0000,$0000 ; 10h..1Ah: Facing right

  .negatedYVelocities:
    dw $0000,$FFFA,$FFFA,$FFF9,$0000,$0000, $0000,$0000


;;; $C470: Instruction - Bomb Torizo walking movement - normal - index [[Y]] ;;;
Instruction_Torizo_BombTorizoWalkingMovement_Normal_IndexInY:
    PHY
    STZ.B DP_Temp12
    LDA.W $0000,Y : TAY
    LDA.W .velocities,Y : STA.B DP_Temp14 : STA.W Torizo.XVelocity,X
    JSL MoveEnemyRightBy_14_12_IgnoreSlopes
    PLY
    BCC .noCollision
    LDA.W #$0000 : STA.L Torizo.turnAroundTimer,X
    LDA.W Torizo.graphicalProperties,X : BMI .turningLeft
    LDY.W #InstList_Torizo_FacingRight_TurningRight
    RTL

  .turningLeft:
    LDY.W #InstList_Torizo_FacingLeft_TurningLeft
    RTL

  .noCollision:
    JSL AlignEnemyYPositionWIthNonSquareSlope
    LDA.W SamusXPosition : SEC : SBC.W Enemy.XPosition,X
    EOR.W Torizo.graphicalProperties,X : BPL .facingAway
    INY #2
    RTL

  .facingAway:
    LDA.L Torizo.turnAroundTimer,X : BNE .return
    LDA.W #$0048 : STA.L Torizo.turnAroundTimer,X

  .return:
    INY #2
    RTL

  .velocities:
    dw $FFFB,$0000,$FFFB,$FFED,$FFF0,$FFF9,$0000,$FFF9,$FFEF,$FFEE       ; 0..12h: Moving left
    dw $0005,$0000,$0005,$0013,$0010,$0007,$0000,$0007,$0011,$0012       ; 14h..26h: Moving right


;;; $C4E5: Instruction - Bomb Torizo walking movement - faceless - index [[Y]] ;;;
Instruction_Torizo_BTWalkingMovement_Faceless_IndexInY:
    PHY
    STZ.B DP_Temp12
    LDA.W $0000,Y : TAY
    LDA.W .velocities,Y : STA.B DP_Temp14 : STA.W Torizo.XVelocity,X
    JSL MoveEnemyRightBy_14_12_IgnoreSlopes
    PLY
    BCC .noCollision
    LDA.W #$0000 : STA.L Torizo.turnAroundTimer,X
    LDA.W Torizo.graphicalProperties,X : BMI .turningLeft
    LDY.W #InstList_Torizo_FacingRight_Faceless_TurningRight
    RTL

  .turningLeft:
    LDY.W #InstList_Torizo_FacingLeft_Faceless_TurningLeft
    RTL

  .noCollision:
    JSL AlignEnemyYPositionWIthNonSquareSlope
    LDA.W SamusXPosition : SEC : SBC.W Enemy.XPosition,X
    EOR.W Torizo.graphicalProperties,X : BPL .facingAway
    INY #2
    RTL

  .facingAway:
    LDA.L Torizo.turnAroundTimer,X : BNE .return
    LDA.W #$0048 : STA.L Torizo.turnAroundTimer,X

  .return:
    INY #2
    RTL

  .velocities:
    dw $FFFB,$0000,$FFFB,$FFED,$FFF0,$FFF9,$0000,$FFF9
    dw $FFEF,$FFEE,$0005,$0000,$0005,$0013,$0010,$0007
    dw $0000,$0007,$0011,$0012


;;; $C55A: Instruction - go to [[Y]] if rising ;;;
Instruction_Torizo_GotoY_IfRising:
    LDA.W Torizo.YVelocity,X : BMI .rising
    INY #2
    RTL

  .rising:
    LDA.W $0000,Y : TAY
    RTL


;;; $C567: Instruction - call [[Y]] if Samus is less than 38h pixels in front of torizo ;;;
Instruction_Torizo_CallYIfSamusIsLessThan38PixelsInFront:
    LDA.W #$0038
    JSL CheckIfXDistanceBetweenEnemyAndSamusIsAtLeastA
    BCC .near

  .return:
    INY #2
    RTL

  .near:
    LDA.W SamusXPosition : SEC : SBC.W Enemy.XPosition,X
    EOR.W Torizo.graphicalProperties,X : BPL .return
    TYA : INC #2 : STA.L Torizo.linkInstruction,X
    LDA.W $0000,Y : TAY
    RTL


;;; $C58B: Instruction - go to [[Y]] and jump backwards if Samus is less 20h pixels in front of Bomb Torizo ;;;
Instruction_Torizo_GotoYAndJumpBackwardsIfLessThan20Pixels:
    LDA.W #$0020
    JSL CheckIfXDistanceBetweenEnemyAndSamusIsAtLeastA
    BCS .return
    JSR CheckIfTorizoIsFacingSamus
    BMI .return
    JSR MakeTorizoJumpBackwards
    LDA.W $0000,Y : TAY
    RTL

  .return:
    INY #2
    RTL


;;; $C5A4: Instruction - call [[Y]] or [[Y] + 2] for Bomb Torizo attack ;;;
Instruction_Torizo_CallY_OrY2_ForBombTorizoAttack:
    TYA : INC #4 : STA.L Torizo.linkInstruction,X
    LDA.W Missiles : CMP.W #$0005 : BCC .spewOrbs
    LDA.W SamusXPosition : LSR : ADC.W NMI_FrameCounter : BIT.W #$0008 : BEQ .sonicBooms

  .spewOrbs:
    LDA.W $0000,Y
    BRA .return

  .sonicBooms:
    LDA.W $0002,Y

  .return:
    TAY
    RTL


;;; $C5CB: Instruction - spawn Bomb Torizo's chozo orbs ;;;
Instruction_Torizo_SpawnBombTorizosChozoOrbs:
    PHY
    LDY.W #EnemyProjectile_BombTorizoChozoOrbs
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    LDY.W #EnemyProjectile_BombTorizoChozoOrbs
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    LDY.W #EnemyProjectile_BombTorizoChozoOrbs
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    PLY
    RTL


;;; $C5E3: Instruction - spawn Bomb Torizo sonic boom with parameter [[Y]] ;;;
Instruction_Torizo_SpawnBombTorizoSonicBoomWithParameterY:
    PHY
    LDA.W $0000,Y
    LDY.W #EnemyProjectile_BombTorizoSonicBoom
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    PLY
    INY #2
    RTL


;;; $C5F2: Instruction - spawn Golden Torizo sonic boom with parameter [[Y]] ;;;
Instruction_Torizo_SpawnGoldenTorizoSonicBoomWithParameterY:
    PHY
    LDA.W $0000,Y
    LDY.W #EnemyProjectile_GoldenTorizoSonicBoom
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    PLY
    INY #2
    RTL


;;; $C601: Instruction - spawn Bomb Torizo explosive swipe with parameter [[Y]] ;;;
Instruction_Torizo_SpawnBombTorizoExplosiveSwipeWithParamY:
    PHY
    LDA.W $0000,Y
    LDY.W #EnemyProjectile_BombTorizoExplosiveSwipe
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    PLY
    INY #2
    RTL


;;; $C610: Instruction - queue shot torizo sound effect ;;;
Instruction_Torizo_PlayShotTorizoSFX:
    LDA.W #$0027
    JSL QueueSound_Lib2_Max6
    RTL


;;; $C618: Instruction - queue torizo footsteps sound effect ;;;
Instruction_Torizo_PlayTorizoFootstepsSFX:
    LDA.W #$004B
    JSL QueueSound_Lib2_Max6
    RTL


;;; $C620: Handle low-health initial drool ;;;
HandleLowHealthInitialDrool:
    LDA.W AreaIndex : BEQ .crateria
    JMP .returnNotCrateria ; >.<

  .crateria:
    ; If [random number] & 8142h = 0: (1/16 chance)
    LDA.W RandomNumberSeed : AND.W #$8142 : BNE .return
    LDA.W Enemy.health,X : BEQ .return
    CMP.W #$015E : BCS .return
    LDY.W #EnemyProjectile_BombTorizoInitialDrool
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics

  .return:
    RTS

  .returnNotCrateria:
    RTS ; >.<


;;; $C643: Handle falling ;;;
HandleFalling:
    STZ.B DP_Temp12 : STZ.B DP_Temp14
    LDA.W Torizo.YVelocity,X : BPL +
    DEC.B DP_Temp14

+   STA.B DP_Temp13
    JSL MoveEnemyDownBy_14_12
    BCS .collision
    LDA.W Torizo.YVelocity,X : CLC : ADC.W #$0028 : STA.W Torizo.YVelocity,X
    RTS

  .collision:
    LDA.W Torizo.YVelocity,X : BMI .return
    CMP.W #$0100 : BEQ .return
    LDA.W #$0004 : STA.W EarthquakeType
    LDA.W #$0020 : STA.W EarthquakeTimer
    LDA.W #$0100 : STA.W Torizo.YVelocity,X

  .return:
    RTS


;;; $C67E: Hurt AI - enemy $EEFF/$EF3F (Bomb Torizo) ;;;
HurtAI_BombTorizo:
    LDX.W EnemyIndex
    JSR HandleLowHealthInitialDrool
    LDA.W Enemy.flashTimer,X : LSR : BCS .flash
    JSR LoadNormalTorizoPalettes
    BRA .return

  .flash:
    PHX
    LDX.W #$001E

  .loop:
    LDA.W #$7FFF : STA.L Palettes_SpriteP2,X : STA.L Palettes_SpriteP1,X
    DEX #2 : BPL .loop
    PLX

  .return:
    RTL


;;; $C6A4: Main AI - enemy $EEFF/$EF3F (Bomb Torizo) ;;;
MainAI_BombTorizo:
    LDX.W EnemyIndex
    JSR.W (Torizo.function,X)
    RTL


;;; $C6AB: RTS ;;;
RTS_AAC6AB:
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $C6AC: Unused ;;;
UNUSED_Torizo_AAC6AC:
    JSR HandleFalling
    LDA.W #$0600
    JSL Advance_GradualColorChange_ofPalettesInA_Denominator_C
    BCS .return
    LDA.W #RTS_AAC6AB : STA.W Torizo.function,X

  .return:
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $C6BF: Torizo function - simple movement ;;;
Function_Torizo_SimpleMovement:
; Used for
;     Bomb Torizo after statue finishes crumbling and before walking starts
;     Golden Torizo when falling from ceiling
;     Turning
    JSR HandleLowHealthInitialDrool
    JSR HandleFalling
    RTS


;;; $C6C6: Torizo function - wake enemy when Bomb Torizo chozo finishes crumbling ;;;
Function_Torizo_WakeWhenBombTorizoChozoFinishesCrumbling:
    LDA.W Enemy.properties,X : ORA.W #$0400 : STA.W Enemy.properties,X
    PHX
    LDX.W #$004E

  .loop:
    LDA.W PLM_IDs,X : CMP.W #PLMEntries_BombTorizosCrumblingChozo : BEQ .return
    DEX #2 : BPL .loop
    PLX
    LDA.W TorizoMusicTracks_song1
    JSL QueueMusicDataOrTrack_8FrameDelay
    LDA.W Enemy.properties,X : AND.W #$FBFF : STA.W Enemy.properties,X
    INC.W Enemy.instList,X : INC.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    RTS

  .return:
    PLX
    RTS


;;; $C6FF: Torizo function - normal movement ;;;
Function_Torizo_NormalMovement:
    JSR HandleLowHealthInitialDrool
    BIT.W Torizo.behavioralProperties,X : BMI .notLowHealth
    LDA.W Enemy.health,X : CMP.W #$015E : BCS .notLowHealth
    LDA.W Enemy.instList,X : STA.L Torizo.gutExplosionLinkInstruction,X
    LDA.W #InstList_Torizo_SpecialCallable_BlowUpBombTorizosGut : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    RTS

  .notLowHealth:
    BIT.W Torizo.behavioralProperties,X : BVS .noChange
    LDA.W Enemy.health,X : CMP.W #$0064 : BCS .noChange
    LDA.W Torizo.graphicalProperties,X : BMI .facingRight
    LDA.W #InstList_Torizo_FacingRight_Faceless_TurningRight
    BRA +

  .facingRight:
    LDA.W #InstList_Torizo_FacingLeft_Faceless_TurningLeft

+   STA.L Torizo.linkInstruction,X
    LDA.W #InstList_Torizo_Callable_BlowUpBombTorizosFace : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    RTS

  .noChange:
    JSR.W (Torizo.movementFunction,X)
    RTS


;;; $C752: Torizo movement function - walking ;;;
Function_Torizo_Movement_Walking:
    BIT.W Torizo.behavioralProperties,X : BVC .notFaceless
    JMP .faceless

  .notFaceless:
    LDA.L Torizo.turnAroundTimer,X : BEQ .notTurning
    DEC : STA.L Torizo.turnAroundTimer,X : BNE .notTurning
    LDA.W #$0000 : STA.L Torizo.turnAroundTimer,X
    LDA.W Torizo.graphicalProperties,X : BMI .facingRight
    LDA.W #InstList_Torizo_FacingRight_TurningRight
    BRA +

  .facingRight:
    LDA.W #InstList_Torizo_FacingLeft_TurningLeft

+   STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    RTS

  .notTurning:
    STZ.B DP_Temp12
    LDA.W Torizo.XVelocity,X : BPL +
    EOR.W #$FFFF : INC

+   INC : CMP.W #$0010 : BCC +
    LDA.W #$000F

+   STA.B DP_Temp14
    JSL MoveEnemyDownBy_14_12
    BCS .returnUpper
    LDA.W Torizo.graphicalProperties,X : BMI ..facingRight
    LDA.W #InstList_Torizo_FacingLeft_Falling_0
    BRA +

  ..facingRight:
    LDA.W #InstList_Torizo_FacingRight_Falling_0

+   STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDA.W #$0100 : STA.W Torizo.YVelocity,X
    STZ.W Torizo.XVelocity,X

  .returnUpper:
    RTS

  .faceless:
    LDA.L Torizo.turnAroundTimer,X : BEQ .facelessNotTurning
    DEC : STA.L Torizo.turnAroundTimer,X : BNE .facelessNotTurning
    LDA.W #$0000 : STA.L Torizo.turnAroundTimer,X
    LDA.W Torizo.graphicalProperties,X : BMI ..facingRight
    LDA.W #InstList_Torizo_FacingRight_Faceless_TurningRight
    BRA +

  ..facingRight:
    LDA.W #InstList_Torizo_FacingLeft_Faceless_TurningLeft

+   STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    RTS

  .facelessNotTurning:
    STZ.B DP_Temp12
    LDA.W Torizo.XVelocity,X : BPL +
    EOR.W #$FFFF : INC

+   INC : CMP.W #$0010 : BCC +
    LDA.W #$000F

+   STA.B DP_Temp14
    JSL MoveEnemyDownBy_14_12
    BCS .returnLower
    LDA.W Torizo.graphicalProperties,X : BMI ..facingRight
    LDA.W #InstList_Torizo_FacingLeft_Falling_0
    BRA +

  ..facingRight:
    LDA.W #InstList_Torizo_FacingRight_Falling_0

+   STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDA.W #$0100 : STA.W Torizo.YVelocity,X
    STZ.W Torizo.XVelocity,X

  .returnLower:
    RTS


;;; $C828: Torizo movement function - attacking ;;;
Function_Torizo_Movement_Attacking:
    JSR HandleFalling
    RTS


;;; $C82C: Torizo movement function - jumping/falling ;;;
Function_Torizo_Movement_Jumping_Falling:
    STZ.B DP_Temp12 : STZ.B DP_Temp14
    LDA.W Torizo.XVelocity,X : BPL +
    DEC.B DP_Temp14

+   STA.B DP_Temp13
    JSL MoveEnemyRightBy_14_12_IgnoreSlopes
    JSL AlignEnemyYPositionWIthNonSquareSlope
    STZ.B DP_Temp12 : STZ.B DP_Temp14
    LDA.W Torizo.YVelocity,X : BPL +
    DEC.B DP_Temp14

+   STA.B DP_Temp13
    JSL MoveEnemyDownBy_14_12
    BCS .collision
    LDA.W Torizo.YVelocity,X : CLC : ADC.W Torizo.YAcceleration,X : STA.W Torizo.YVelocity,X
    RTS

  .collision:
    LDA.L Torizo.linkInstruction,X : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDA.W #$0100 : STA.W Torizo.YVelocity,X
    LDA.W #$0004 : STA.W EarthquakeType
    LDA.W #$0020 : STA.W EarthquakeTimer
    RTS


;;; $C87F: Initialisation AI - enemy $EEFF/$EF3F/$EF7F/$EFBF (torizos) ;;;
InitAI_Torizo:
; .GTCode is the GT code
; The torizo orb enemies ($EF3F/$EFBF) are never spawned, they're only used for drop chances (see torizo chozo orb shot instruction list $86:AB68)
    LDA.W #$0004
    JSL CheckIfBossBitsForCurrentAreaMatchAnyBitsInA
    BCC .notDead
    LDX.W EnemyIndex
    LDA.W Enemy.properties,X : ORA.W #$0200 : STA.W Enemy.properties,X
    RTL

  .notDead:
    LDY.W AreaIndex
    LDX.W EnemyIndex
    LDA.W Enemy.properties,X : ORA.W TorizoInitial_properties,Y : STA.W Enemy.properties,X
    LDA.W Enemy.properties2,X : ORA.W #$0004 : STA.W Enemy.properties2,X
    LDA.W TorizoInitial_XRadius,Y : STA.W Enemy.XHitboxRadius,X
    LDA.W TorizoInitial_YRadius,Y : STA.W Enemy.YHitboxRadius,X
    LDA.W #Function_Torizo_SimpleMovement : STA.W Torizo.function,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X : STZ.W Enemy.palette,X
    LDA.W #.return2 : STA.W Torizo.movementFunction,X
    LDA.W TorizoInitial_instListPointer,Y : STA.W Enemy.instList,X
    LDA.W #ExtendedSpritemap_Torizo_Blank : STA.W Enemy.spritemap,X
    LDA.W TorizoInitial_XPosition,Y : STA.W Enemy.XPosition,X
    LDA.W TorizoInitial_YPosition,Y : STA.W Enemy.YPosition,X
    STZ.W Torizo.XVelocity,X
    LDA.W #$0100 : STA.W Torizo.YVelocity,X
    LDX.W #$001E

  .loopTargetPalettes:
    LDA.W Palette_Torizo_BombTorizoStatue,X : STA.L TargetPalettes_SpriteP7,X
    LDA.W Palette_Torizo_OrbProjectile,X : STA.L TargetPalettes_SpriteP3,X
    DEX #2 : BPL .loopTargetPalettes
    LDA.W AreaIndex : BNE .GTCode
    JSR LoadInitialBombTorizoPalettes
    JSL Spawn_BombTorizoHaze
    RTL

  .GTCode:
    JSR LoadInitialGoldenTorizoPalettes
    LDA.B DP_Controller1Input : CMP.W #$C0C0 : BNE .return ; ABXY inputs
    LDA.W #$02BC : STA.W Energy : STA.W MaxEnergy
    LDA.W #$012C : STA.W MaxReserveEnergy : STA.W ReserveEnergy
    LDA.W #$0064 : STA.W Missiles : STA.W MaxMissiles
    LDA.W #$0014 : STA.W SuperMissiles : STA.W MaxSuperMissiles
    LDA.W #$0014 : STA.W PowerBombs : STA.W MaxPowerBombs
    LDA.W #$F337 : STA.W EquippedItems : STA.W CollectedItems
    LDA.W #$100F : STA.W EquippedBeams : STA.W CollectedBeams

  .return:
    RTL

  .return2:
    RTS


TorizoInitial:
;        _________ Crateria
;       |      ___ Norfair
;       |     |
  .XPosition:
    dw $00DB,$01A8

  .YPosition:
    dw $00B3,$0090

  .instListPointer:
    dw InstList_Torizo_BombTorizo_Initial_0 ; Crateria
    dw InstList_GoldenTorizo_Initial_0 ; Norfair

  .properties:
    dw $2800,$2800

  .XRadius:
    dw $0012,$0012

  .YRadius:
    dw $0030,$0029


;;; $C977: Enemy touch - enemy $EEFF/$EF3F/$EF7F/$EFBF (torizos) ;;;
EnemyTouch_Torizo:
    JSL NormalEnemyTouchAI_NoDeathCheck_External
    RTL


;;; $C97C: Enemy shot - torizo - normal ;;;
EnemyShot_Torizo_Normal:
    LDA.W AreaIndex : BEQ .crateria
    JMP ShotReaction_GoldenTorizo_Normal

  .crateria:
    LDX.W EnemyIndex
    LDA.W Enemy.flashTimer,X : ORA.L Torizo.animationLockFlag,X : BNE .return
    JSL NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External
    LDX.W EnemyIndex
    LDA.W Enemy.health,X : BNE .return
    LDA.W #RTS_AAC6AB : STA.W Torizo.function,X
    LDA.W #InstList_Torizo_DeathSequence_0 : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDA.W Torizo.behavioralProperties,X : ORA.W #$C000 : STA.W Torizo.behavioralProperties,X
    LDA.W Enemy.properties,X : ORA.W #$0400 : STA.W Enemy.properties,X

  .return:
    RTL


;;; $C9C1: RTL ;;;
RTL_AAC9C1:
    RTL


;;; $C9C2: Enemy shot - torizo - stand up / sit down ;;;
EnemyShot_Torizo_StandUp_SitDown:
    LDA.W AreaIndex : BEQ .return
    JMP ShotReaction_GoldenTorizo_StandUp_SitDown

  .return:
    RTL


;;; $C9CB: Instruction list - Golden Torizo - initial ;;;
InstList_GoldenTorizo_Initial_0:
    dw Instruction_Common_TransferYBytesInYToVRAM
    dw $0600 : dl Tiles_GoldenTorizoEgg : dw $6D00
    dw Instruction_Torizo_SetSteppedLeftWithRightFootState
    dw Instruction_Torizo_SetAnimationLock
    dw Instruction_Torizo_FunctionInY
    dw Function_GoldenTorizo_WakeIfSamusIsBelowAndRightOfTargetPos
    dw $0001,ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_3
    dw Instruction_Common_Sleep
    dw Instruction_Torizo_FunctionInY
    dw Function_Torizo_SimpleMovement

InstList_GoldenTorizo_Initial_1:
    dw $0001,ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_3
    dw Instruction_Torizo_GotoY_IfNotHitGround
    dw InstList_GoldenTorizo_Initial_1
    dw Instruction_Torizo_PlayTorizoFootstepsSFX
    dw $0003,ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_3
    dw Instruction_Torizo_SittingDownMovement_IndexInY,$0004
    dw $0004,ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_2
    dw Instruction_Torizo_SittingDownMovement_IndexInY,$0002
    dw $0005,ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_1
    dw Instruction_Torizo_SittingDownMovement_IndexInY,$0000
    dw Instruction_Torizo_FunctionInY
    dw RTS_AAC6AB
    dw $0030,ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_0
    dw Instruction_Common_TransferYBytesInYToVRAM
    dw $0040 : dl Tiles_Torizo : dw $7D80
    dw $0020,ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_0
    dw Instruction_Common_TransferYBytesInYToVRAM
    dw $0040 : dl Tiles_Torizo+$40 : dw $7D80
    dw $0010,ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_0
    dw Instruction_Common_TransferYBytesInYToVRAM
    dw $0040 : dl Tiles_Torizo+$80 : dw $7D80
    dw $0008,ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_0
    dw Instruction_Common_TransferYBytesInYToVRAM
    dw $0040 : dl Tiles_Torizo+$C0 : dw $7D80
    dw $0020,ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_0
    dw Instruction_Common_TimerInY,$0002

InstList_GoldenTorizo_Initial_2:
    dw $0004,ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_0
    dw Instruction_Common_TransferYBytesInYToVRAM
    dw $0040 : dl Tiles_Torizo : dw $7D80
    dw $0004,ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_0
    dw Instruction_Common_TransferYBytesInYToVRAM
    dw $0040 : dl Tiles_Torizo+$40 : dw $7D80
    dw $0004,ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_0
    dw Instruction_Common_TransferYBytesInYToVRAM
    dw $0040 : dl Tiles_Torizo+$80 : dw $7D80
    dw $0004,ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_0
    dw Instruction_Common_TransferYBytesInYToVRAM
    dw $0040 : dl Tiles_Torizo+$C0 : dw $7D80
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate
    dw InstList_GoldenTorizo_Initial_2
    dw $0020,ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_0
    dw Instruction_Torizo_StandingUpMovement_IndexInY,$0000
    dw $000C,ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_1
    dw Instruction_Torizo_StandingUpMovement_IndexInY,$0002
    dw $0008,ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_2
    dw Instruction_Torizo_StandingUpMovement_IndexInY,$0004
    dw $0008,ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_3
    dw Instruction_Torizo_StandingUpMovement_IndexInY,$0006
    dw $0008,ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_4
    dw Instruction_Torizo_StandingUpMovement_IndexInY,$0008
    dw $0008,ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_5
    dw Instruction_Torizo_StandingUpMovement_IndexInY,$000A
    dw Instruction_Torizo_LoadGoldenTorizoPalettes
    dw Instruction_Common_TimerInY,$0010

InstList_GoldenTorizo_Initial_3:
    dw $0004,ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_6
    dw Instruction_Torizo_AdvanceGradualColorChange
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate
    dw InstList_GoldenTorizo_Initial_3
    dw RTL_AAC2C8
    dw Instruction_Torizo_ClearAnimationLock
    dw Inst_Torizo_StartFightMusic_GoldenTorizoBellyPaletteFX
    dw $0010,ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_6
    dw Instruction_Common_GotoY
    dw InstList_GoldenTorizo_WalkingLeft_LeftLegMoving


;;; $CACE: Instruction - go to [[Y]] if not hit ground ;;;
Instruction_Torizo_GotoY_IfNotHitGround:
    LDA.W Enemy.YPosition,X : CMP.W #$0177 : BEQ .notHitGround
    LDA.W $0000,Y : TAY
    RTL

  .notHitGround:
    INY #2
    RTL


;;; $CADE: Instruction - load Golden Torizo palettes ;;;
Instruction_Torizo_LoadGoldenTorizoPalettes:
    JSR LoadGoldenTorizoPalettes
    RTL


;;; $CAE2: Instruction - start fight music and Golden Torizo belly palette FX ;;;
Inst_Torizo_StartFightMusic_GoldenTorizoBellyPaletteFX:
    LDA.W #$0005
    JSL QueueMusicDataOrTrack_8FrameDelay
    LDA.W #$0012 : STA.W Enemy.XHitboxRadius,X
    LDA.W #$0030 : STA.W Enemy.YHitboxRadius,X
    PHY
    LDY.W #PaletteFXObjects_GoldenTorizoBelly
    JSL Spawn_PaletteFXObject
    PLY
    RTL


;;; $CAFF: Instruction list - callable - Golden Torizo - spewing chozo orbs - facing left - right foot forward ;;;
InstList_GoldenTorizo_SpewChozoOrbs_FaceLeft_RightFootFwd_0:
    dw Instruction_Common_Enemy0FB2_InY
    dw Function_GoldenTorizo_Movement_Attacking
    dw $0006,ExtendedSpritemaps_Torizo_Attacks_FaceLeft_RightFootForward
    dw $0003,ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_RightFootForward_0
    dw $0003,ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_RightFootForward_1
    dw $0003,ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_RightFootForward_2
    dw $0003,ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_RightFootForward_3
    dw $0006,ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_RightFootForward_4
    dw Instruction_Common_TimerInY,$0006

InstList_GoldenTorizo_SpewChozoOrbs_FaceLeft_RightFootFwd_1:
    dw Instruction_Torizo_PlayShotTorizoSFX
    dw Instruction_GoldenTorizo_SpawnChozoOrbs
    dw Instruction_Common_WaitYFrames,$0006
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate
    dw InstList_GoldenTorizo_SpewChozoOrbs_FaceLeft_RightFootFwd_1
    dw $0003,ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_RightFootForward_3
    dw $0003,ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_RightFootForward_2
    dw $0003,ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_RightFootForward_1
    dw $0003,ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_RightFootForward_0
    dw Instruction_Common_Enemy0FB2_InY
    dw Function_GoldenTorizo_Movement_Walking
    dw Instruction_Torizo_Return


;;; $CB41: Instruction list - callable - Golden Torizo - spewing chozo orbs - facing left - left foot forward ;;;
InstList_GoldenTorizo_SpewChozoOrbs_FacingLeft_LeftFootFwd_0:
    dw Instruction_Common_Enemy0FB2_InY
    dw Function_GoldenTorizo_Movement_Attacking
    dw $0006,ExtendedSpritemaps_Torizo_Attacks_FaceLeft_LeftFootForward
    dw $0003,ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_LeftFootForward_0
    dw $0003,ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_LeftFootForward_1
    dw $0003,ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_LeftFootForward_2
    dw $0003,ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_LeftFootForward_3
    dw $0006,ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_LeftFootForward_4
    dw Instruction_Common_TimerInY,$0006

InstList_GoldenTorizo_SpewChozoOrbs_FacingLeft_LeftFootFwd_1:
    dw Instruction_Torizo_PlayShotTorizoSFX
    dw Instruction_GoldenTorizo_SpawnChozoOrbs
    dw Instruction_Common_WaitYFrames,$0006
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate
    dw InstList_GoldenTorizo_SpewChozoOrbs_FacingLeft_LeftFootFwd_1
    dw $0003,ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_LeftFootForward_3
    dw $0003,ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_LeftFootForward_2
    dw $0003,ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_LeftFootForward_1
    dw $0003,ExtSpritemaps_Torizo_ChozoOrbs_FaceLeft_LeftFootForward_0
    dw Instruction_Common_Enemy0FB2_InY
    dw Function_GoldenTorizo_Movement_Walking
    dw Instruction_Torizo_Return


;;; $CB83: Instruction list - callable - Golden Torizo - sonic booms - facing left - right foot forward ;;;
InstList_GoldenTorizo_SonicBooms_FacingLeft_RightFootFwd_0:
    dw Instruction_Common_Enemy0FB2_InY
    dw Function_GoldenTorizo_Movement_Attacking
    dw Instruction_Common_TimerInY,$0004

InstList_GoldenTorizo_SonicBooms_FacingLeft_RightFootFwd_1:
    dw $0003,ExtendedSpritemaps_Torizo_Attacks_FaceLeft_RightFootForward
    dw $0003,ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_0
    dw $0003,ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_1
    dw $0003,ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_2
    dw $0003,ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_3
    dw $0003,ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_4
    dw $0001,ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_3
    dw $0001,ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_2
    dw Instruction_Torizo_SpawnGoldenTorizoSonicBoomWithParameterY,$0000
    dw $0001,ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_1
    dw $0004,ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_0
    dw $0003,ExtendedSpritemaps_Torizo_Attacks_FaceLeft_RightFootForward
    dw $0003,ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_5
    dw $0003,ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_RightFootForward_0
    dw $0003,ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_RightFootForward_1
    dw $0003,ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_RightFootForward_2
    dw $0003,ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_RightFootForward_3
    dw $0001,ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_RightFootForward_2
    dw $0001,ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_RightFootForward_1
    dw Instruction_Torizo_SpawnGoldenTorizoSonicBoomWithParameterY,$0001
    dw $0001,ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_RightFootForward_0
    dw $0004,ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_5
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate
    dw InstList_GoldenTorizo_SonicBooms_FacingLeft_RightFootFwd_1
    dw Instruction_Common_Enemy0FB2_InY
    dw Function_GoldenTorizo_Movement_Walking
    dw Instruction_Torizo_Return


;;; $CBED: Instruction list - callable - Golden Torizo - sonic booms - facing left - left foot forward ;;;
InstList_GoldenTorizo_SonicBooms_FacingLeft_LeftFootFwd_0:
    dw Instruction_Common_Enemy0FB2_InY
    dw Function_GoldenTorizo_Movement_Attacking
    dw Instruction_Common_TimerInY,$0004

InstList_GoldenTorizo_SonicBooms_FacingLeft_LeftFootFwd_1:
    dw $0003,ExtendedSpritemaps_Torizo_Attacks_FaceLeft_LeftFootForward
    dw $0003,ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_0
    dw $0003,ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_1
    dw $0003,ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_2
    dw $0003,ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_3
    dw $0003,ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_4
    dw $0001,ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_3
    dw $0001,ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_2
    dw Instruction_Torizo_SpawnGoldenTorizoSonicBoomWithParameterY,$0000
    dw $0001,ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_1
    dw $0004,ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_0
    dw $0003,ExtendedSpritemaps_Torizo_Attacks_FaceLeft_LeftFootForward
    dw $0003,ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_5
    dw $0003,ExtSpritemap_Torizo_SonicBoom_Swipe_FaceLeft_LeftFootFwd_0
    dw $0003,ExtSpritemap_Torizo_SonicBoom_Swipe_FaceLeft_LeftFootFwd_1
    dw $0003,ExtSpritemap_Torizo_SonicBoom_Swipe_FaceLeft_LeftFootFwd_2
    dw $0003,ExtSpritemap_Torizo_SonicBoom_Swipe_FaceLeft_LeftFootFwd_3
    dw $0001,ExtSpritemap_Torizo_SonicBoom_Swipe_FaceLeft_LeftFootFwd_2
    dw $0001,ExtSpritemap_Torizo_SonicBoom_Swipe_FaceLeft_LeftFootFwd_1
    dw Instruction_Torizo_SpawnGoldenTorizoSonicBoomWithParameterY,$0001
    dw $0001,ExtSpritemap_Torizo_SonicBoom_Swipe_FaceLeft_LeftFootFwd_0
    dw $0004,ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_5
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate
    dw InstList_GoldenTorizo_SonicBooms_FacingLeft_LeftFootFwd_1
    dw Instruction_Common_Enemy0FB2_InY
    dw Function_GoldenTorizo_Movement_Walking
    dw Instruction_Torizo_Return


;;; $CC57: Instruction list - callable - Golden Torizo - spewing chozo orbs - facing right - left foot forward ;;;
InstList_GoldenTorizo_SpewChozoOrb_FacingLeft_LeftFootFwd_0:
    dw Instruction_Common_Enemy0FB2_InY
    dw Function_GoldenTorizo_Movement_Attacking
    dw $0006,ExtendedSpritemaps_Torizo_Attacks_FaceRight_LeftFootForward
    dw $0003,ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_LeftFootForward_0
    dw $0003,ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_LeftFootForward_1
    dw $0003,ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_LeftFootForward_2
    dw $0003,ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_LeftFootForward_3
    dw $0006,ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_LeftFootForward_4
    dw Instruction_Common_TimerInY,$0006

InstList_GoldenTorizo_SpewChozoOrb_FacingLeft_LeftFootFwd_1:
    dw Instruction_Torizo_PlayShotTorizoSFX
    dw Instruction_GoldenTorizo_SpawnChozoOrbs
    dw Instruction_Common_WaitYFrames,$0006
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate
    dw InstList_GoldenTorizo_SpewChozoOrb_FacingLeft_LeftFootFwd_1
    dw $0003,ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_LeftFootForward_3
    dw $0003,ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_LeftFootForward_2
    dw $0003,ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_LeftFootForward_1
    dw $0003,ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_LeftFootForward_0
    dw Instruction_Common_Enemy0FB2_InY
    dw Function_GoldenTorizo_Movement_Walking
    dw Instruction_Torizo_Return


;;; $CC99: Instruction list - callable - Golden Torizo - spewing chozo orbs - facing right - right foot forward ;;;
InstList_GoldenTorizo_SpewChozoOrb_FacingLeft_RightFootFwd_0:
    dw Instruction_Common_Enemy0FB2_InY
    dw Function_GoldenTorizo_Movement_Attacking
    dw $0006,ExtendedSpritemaps_Torizo_Attacks_FaceRight_RightFootForward
    dw $0003,ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_RightFootForward_0
    dw $0003,ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_RightFootForward_1
    dw $0003,ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_RightFootForward_2
    dw $0003,ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_RightFootForward_3
    dw $0006,ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_RightFootForward_4
    dw Instruction_Common_TimerInY,$0006

InstList_GoldenTorizo_SpewChozoOrb_FacingLeft_RightFootFwd_1:
    dw Instruction_Torizo_PlayShotTorizoSFX
    dw Instruction_GoldenTorizo_SpawnChozoOrbs
    dw Instruction_Common_WaitYFrames,$0006
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate
    dw InstList_GoldenTorizo_SpewChozoOrb_FacingLeft_RightFootFwd_1
    dw $0003,ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_RightFootForward_3
    dw $0003,ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_RightFootForward_2
    dw $0003,ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_RightFootForward_1
    dw $0003,ExtSpritemaps_Torizo_ChozoOrbs_FaceRight_RightFootForward_0
    dw Instruction_Common_Enemy0FB2_InY
    dw Function_GoldenTorizo_Movement_Walking
    dw Instruction_Torizo_Return


;;; $CCDB: Instruction list - callable - Golden Torizo - sonic booms - facing right - left foot forward ;;;
InstList_GoldenTorizo_SonicBooms_FacingRight_LeftFootFwd_0:
    dw Instruction_Common_Enemy0FB2_InY
    dw Function_GoldenTorizo_Movement_Attacking
    dw Instruction_Common_TimerInY,$0004

InstList_GoldenTorizo_SonicBooms_FacingRight_LeftFootFwd_1:
    dw $0003,ExtendedSpritemaps_Torizo_Attacks_FaceRight_LeftFootForward
    dw $0003,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_0
    dw $0003,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_1
    dw $0003,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_2
    dw $0003,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_3
    dw $0003,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_4
    dw $0001,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_3
    dw $0001,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_2
    dw Instruction_Torizo_SpawnGoldenTorizoSonicBoomWithParameterY,$0000
    dw $0001,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_1
    dw $0004,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_0
    dw $0003,ExtendedSpritemaps_Torizo_Attacks_FaceRight_LeftFootForward
    dw $0003,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_5
    dw $0003,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_6
    dw $0003,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_7
    dw $0003,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_8
    dw $0003,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_9
    dw $0001,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_8
    dw $0001,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_7
    dw Instruction_Torizo_SpawnGoldenTorizoSonicBoomWithParameterY,$0001
    dw $0001,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_6
    dw $0004,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_5
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate
    dw InstList_GoldenTorizo_SonicBooms_FacingRight_LeftFootFwd_1
    dw Instruction_Common_Enemy0FB2_InY
    dw Function_GoldenTorizo_Movement_Walking
    dw Instruction_Torizo_Return


;;; $CD45: Instruction list - callable - Golden Torizo - sonic booms - facing right - right foot forward ;;;
InstList_GoldenTorizo_SonicBooms_FacingRight_RightFootFwd_0:
    dw Instruction_Common_Enemy0FB2_InY
    dw Function_GoldenTorizo_Movement_Attacking
    dw Instruction_Common_TimerInY,$0004

InstList_GoldenTorizo_SonicBooms_FacingRight_RightFootFwd_1:
    dw $0003,ExtendedSpritemaps_Torizo_Attacks_FaceRight_RightFootForward
    dw $0003,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_0
    dw $0003,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_1
    dw $0003,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_2
    dw $0003,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_3
    dw $0003,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_4
    dw $0001,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_3
    dw $0001,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_2
    dw Instruction_Torizo_SpawnGoldenTorizoSonicBoomWithParameterY,$0000
    dw $0001,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_1
    dw $0004,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_0
    dw $0003,ExtendedSpritemaps_Torizo_Attacks_FaceRight_RightFootForward
    dw $0003,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_5
    dw $0003,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_6
    dw $0003,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_7
    dw $0003,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_8
    dw $0003,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_9
    dw $0001,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_8
    dw $0001,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_7
    dw Instruction_Torizo_SpawnGoldenTorizoSonicBoomWithParameterY,$0001
    dw $0001,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_6
    dw $0004,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_5
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate
    dw InstList_GoldenTorizo_SonicBooms_FacingRight_RightFootFwd_1
    dw Instruction_Common_Enemy0FB2_InY
    dw Function_GoldenTorizo_Movement_Walking
    dw Instruction_Torizo_Return


;;; $CDAF: Instruction list - Golden Torizo - landed from backwards jump - facing left - left foot forward ;;;
InstList_GT_LandedFromBackwardsJump_FacingLeft_LeftFootFwd:
    dw Instruction_GoldenTorizo_CallY_OrY2_ForAttack
    dw InstList_GoldenTorizo_SpewChozoOrbs_FacingLeft_LeftFootFwd_0
    dw InstList_GoldenTorizo_SonicBooms_FacingLeft_LeftFootFwd_0
    dw Instruction_Common_GotoY
    dw InstList_GoldenTorizo_WalkingLeft_RightLegMoving


;;; $CDB9: Instruction list - Golden Torizo - landed from backwards jump - facing left - right foot forward ;;;
InstList_GT_LandedFromBackwardsJump_FacingLeft_RightFootFwd:
    dw Instruction_GoldenTorizo_CallY_OrY2_ForAttack
    dw InstList_GoldenTorizo_SpewChozoOrbs_FaceLeft_RightFootFwd_0
    dw InstList_GoldenTorizo_SonicBooms_FacingLeft_RightFootFwd_0
    dw Instruction_Common_GotoY
    dw InstList_GoldenTorizo_WalkingLeft_LeftLegMoving


;;; $CDC3: Instruction list - Golden Torizo - landed from backwards jump - facing right - right foot forward ;;;
InstList_GT_LandedFromBackwardsJump_FacingRight_RightFootFwd:
    dw Instruction_GoldenTorizo_CallY_OrY2_ForAttack
    dw InstList_GoldenTorizo_SpewChozoOrb_FacingLeft_RightFootFwd_0
    dw InstList_GoldenTorizo_SonicBooms_FacingRight_RightFootFwd_0
    dw Instruction_Common_GotoY
    dw InstList_GoldenTorizo_WalkingRight_LeftLegMoving


;;; $CDCD: Instruction list - Golden Torizo - landed from backwards jump - facing right - left foot forward ;;;
InstList_GT_LandedFromBackwardsJump_FacingRight_LeftFootFwd:
    dw Instruction_GoldenTorizo_CallY_OrY2_ForAttack
    dw InstList_GoldenTorizo_SpewChozoOrb_FacingLeft_LeftFootFwd_0
    dw InstList_GoldenTorizo_SonicBooms_FacingRight_LeftFootFwd_0
    dw Instruction_Common_GotoY
    dw InstList_GoldenTorizo_WalkingRight_RightLegMoving


;;; $CDD7: Instruction - clear torizo caught super missile flag ;;;
Instruction_GoldenTorizo_ClearCaughtSuperMissileFlag:
    LDA.W Torizo.behavioralProperties,X : AND.W #$EFFF : STA.W Torizo.behavioralProperties,X
    RTL


;;; $CDE1: Instruction list - caught super missile - facing left - left leg forward ;;;
InstList_GoldenTorizo_CaughtSuper_FacingLeft_LeftLegFwd:
    dw Instruction_Torizo_QueueSonicBoomSFX
    dw Instruction_Torizo_FunctionInY
    dw Function_GoldenTorizo_SimpleMovement
    dw $0001,ExtendedSpritemaps_Torizo_Attacks_FaceLeft_LeftFootForward
    dw $0001,ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_0
    dw $0001,ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_1
    dw $0001,ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_2
    dw $0001,ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_3
    dw $0001,ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_4
    dw $0001,ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_3
    dw $0001,ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_2
    dw $0001,ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_1
    dw $0001,ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_0
    dw $0002,ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_0
    dw $0002,ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_1
    dw $0002,ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_2
    dw $0002,ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_3
    dw Instruction_GoldenTorizo_SpawnSuperMissile
    dw $0030,ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_4
    dw $0002,ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_3
    dw $0002,ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_2
    dw $0002,ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_1
    dw $0002,ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_0
    dw $0002,ExtendedSpritemaps_Torizo_Attacks_FaceLeft_LeftFootForward
    dw $0010,ExtSpritemap_Torizo_NonOrbAttack_FaceLeft_LeftFootForward_5
    dw Instruction_GoldenTorizo_ClearCaughtSuperMissileFlag
    dw Instruction_Common_GotoY
    dw InstList_GoldenTorizo_WalkingLeft_RightLegMoving


;;; $CE43: Instruction list - caught super missile - facing left - right leg forward ;;;
InstList_GoldenTorizo_CaughtSuper_FacingLeft_RightLegFwd:
    dw Instruction_Torizo_QueueSonicBoomSFX
    dw Instruction_Torizo_FunctionInY
    dw Function_GoldenTorizo_SimpleMovement
    dw $0001,ExtendedSpritemaps_Torizo_Attacks_FaceLeft_RightFootForward
    dw $0001,ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_0
    dw $0001,ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_1
    dw $0001,ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_2
    dw $0001,ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_3
    dw $0001,ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_4
    dw $0001,ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_3
    dw $0001,ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_2
    dw $0001,ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_1
    dw $0001,ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_0
    dw $0002,ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_0
    dw $0002,ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_1
    dw $0002,ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_2
    dw $0002,ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_3
    dw Instruction_GoldenTorizo_SpawnSuperMissile
    dw $0030,ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_4
    dw $0002,ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_3
    dw $0002,ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_2
    dw $0002,ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_1
    dw $0002,ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_0
    dw $0002,ExtendedSpritemaps_Torizo_Attacks_FaceLeft_RightFootForward
    dw $0010,ExtSpritemap_Torizo_NonOrbAttacks_FaceLeft_LeftFootForward_5
    dw Instruction_GoldenTorizo_ClearCaughtSuperMissileFlag
    dw Instruction_Common_GotoY
    dw InstList_GoldenTorizo_WalkingLeft_LeftLegMoving


;;; $CEA5: Instruction list - caught super missile - facing right - right leg forward ;;;
InstList_GoldenTorizo_CaughtSuper_FacingRight_RightLegFwd:
    dw Instruction_Torizo_QueueSonicBoomSFX
    dw Instruction_Torizo_FunctionInY
    dw Function_GoldenTorizo_SimpleMovement
    dw $0001,ExtendedSpritemaps_Torizo_Attacks_FaceRight_RightFootForward
    dw $0001,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_0
    dw $0001,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_1
    dw $0001,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_2
    dw $0001,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_3
    dw $0001,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_4
    dw $0001,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_3
    dw $0001,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_2
    dw $0001,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_1
    dw $0002,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_1
    dw $0002,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_2
    dw $0002,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_3
    dw Instruction_GoldenTorizo_SpawnSuperMissile
    dw $0030,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_4
    dw $0002,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_3
    dw $0002,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_2
    dw $0002,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_1
    dw $0002,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_0
    dw $0002,ExtendedSpritemaps_Torizo_Attacks_FaceRight_RightFootForward
    dw $0010,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_RightFootFwd_5
    dw Instruction_GoldenTorizo_ClearCaughtSuperMissileFlag
    dw Instruction_Common_GotoY
    dw InstList_GoldenTorizo_WalkingRight_LeftLegMoving


;;; $CEFF: Instruction list - caught super missile - facing right - left leg forward ;;;
InstList_GoldenTorizo_CaughtSuper_FacingRight_LeftLegFwd:
    dw Instruction_Torizo_QueueSonicBoomSFX
    dw Instruction_Torizo_FunctionInY
    dw Function_GoldenTorizo_SimpleMovement
    dw $0001,ExtendedSpritemaps_Torizo_Attacks_FaceRight_LeftFootForward
    dw $0001,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_0
    dw $0001,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_1
    dw $0001,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_2
    dw $0001,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_3
    dw $0001,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_4
    dw $0001,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_3
    dw $0001,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_2
    dw $0001,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_1
    dw $0002,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_1
    dw $0002,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_2
    dw $0002,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_3
    dw Instruction_GoldenTorizo_SpawnSuperMissile
    dw $0030,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_4
    dw $0002,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_3
    dw $0002,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_2
    dw $0002,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_1
    dw $0002,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_0
    dw $0002,ExtendedSpritemaps_Torizo_Attacks_FaceRight_LeftFootForward
    dw $0010,ExtSpritemap_Torizo_NonOrbAttacks_FaceRight_LeftFootFwd_5
    dw Instruction_GoldenTorizo_ClearCaughtSuperMissileFlag
    dw Instruction_Common_GotoY
    dw InstList_GoldenTorizo_WalkingRight_RightLegMoving


;;; $CF59: Instruction list - sit down attack - facing left ;;;
InstList_GoldenTorizo_SitDownAttack_FacingLeft:
    dw Instruction_Common_Enemy0FB2_InY
    dw Function_GoldenTorizo_Movement_Attacking
    dw $0008,ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_6
    dw Instruction_Torizo_SittingDownMovement_IndexInY,$000A
    dw $0008,ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_5
    dw Instruction_Torizo_SittingDownMovement_IndexInY,$0008
    dw $0006,ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_4
    dw Instruction_Torizo_SittingDownMovement_IndexInY,$0006
    dw $0006,ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_3
    dw Instruction_Torizo_SittingDownMovement_IndexInY,$0004
    dw $0004,ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_2
    dw Instruction_Torizo_SittingDownMovement_IndexInY,$0002
    dw $0004,ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_1
    dw Instruction_Torizo_SittingDownMovement_IndexInY,$0000
    dw $0008,ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_0
    dw Instruction_Torizo_StandingUpMovement_IndexInY,$0000
    dw $0008,ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_1
    dw Instruction_Torizo_StandingUpMovement_IndexInY,$0002
    dw $0008,ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_2
    dw Instruction_Torizo_StandingUpMovement_IndexInY,$0004
    dw $0008,ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_3
    dw Instruction_Torizo_StandingUpMovement_IndexInY,$0006
    dw $000A,ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_4
    dw Instruction_Torizo_StandingUpMovement_IndexInY,$0008
    dw $000A,ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingLeft_5
    dw Instruction_Torizo_StandingUpMovement_IndexInY,$000A
    dw Instruction_Common_Enemy0FB2_InY
    dw Function_GoldenTorizo_Movement_Walking
    dw Instruction_Common_GotoY
    dw InstList_GoldenTorizo_WalkingLeft_LeftLegMoving


;;; $CFC5: Instruction list - sit down attack - facing right ;;;
InstList_GoldenTorizo_SitDownAttack_FacingRight:
    dw Instruction_Common_Enemy0FB2_InY
    dw Function_GoldenTorizo_Movement_Attacking
    dw $0008,ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingRight_6
    dw Instruction_Torizo_SittingDownMovement_IndexInY,$001A
    dw $0008,ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingRight_5
    dw Instruction_Torizo_SittingDownMovement_IndexInY,$0018
    dw $0006,ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingRight_4
    dw Instruction_Torizo_SittingDownMovement_IndexInY,$0016
    dw $0006,ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingRight_3
    dw Instruction_Torizo_SittingDownMovement_IndexInY,$0014
    dw $0004,ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingRight_2
    dw Instruction_Torizo_SittingDownMovement_IndexInY,$0012
    dw $0004,ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingRight_1
    dw Instruction_Torizo_SittingDownMovement_IndexInY,$0010
    dw $0008,ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingRight_0
    dw Instruction_Torizo_StandingUpMovement_IndexInY,$0010
    dw $0008,ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingRight_1
    dw Instruction_Torizo_StandingUpMovement_IndexInY,$0012
    dw $0008,ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingRight_2
    dw Instruction_Torizo_StandingUpMovement_IndexInY,$0014
    dw $0008,ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingRight_3
    dw Instruction_Torizo_StandingUpMovement_IndexInY,$0016
    dw $000A,ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingRight_4
    dw Instruction_Torizo_StandingUpMovement_IndexInY,$0018
    dw $000A,ExtendedSpritemaps_Torizo_StandUp_SitDown_FacingRight_5
    dw Instruction_Torizo_StandingUpMovement_IndexInY,$001A
    dw Instruction_Common_Enemy0FB2_InY
    dw Function_GoldenTorizo_Movement_Walking
    dw Instruction_Common_GotoY
    dw InstList_GoldenTorizo_WalkingRight_RightLegMoving


;;; $D031: Instruction list - callable - release Golden Torizo eggs ;;;
InstList_GoldenTorizo_ReleaseGoldenTorizoEggs_0:
    dw Instruction_Common_Enemy0FB2_InY
    dw Function_GoldenTorizo_Movement_Attacking
    dw Instruction_Common_TransferYBytesInYToVRAM
    dw $0040 : dl Tiles_Torizo+$280 : dw $7300
    dw Instruction_Common_TransferYBytesInYToVRAM
    dw $0040 : dl Tiles_Torizo+$480 : dw $7400
    dw Instruction_Common_WaitYFrames,$0008
    dw Instruction_Common_TransferYBytesInYToVRAM
    dw $0040 : dl Tiles_Torizo+$2C0 : dw $7300
    dw Instruction_Common_TransferYBytesInYToVRAM
    dw $0040 : dl Tiles_Torizo+$4C0 : dw $7400
    dw Instruction_Common_WaitYFrames,$0008
    dw Instruction_Common_TransferYBytesInYToVRAM
    dw $0040 : dl Tiles_Torizo+$300 : dw $7300
    dw Instruction_Common_TransferYBytesInYToVRAM
    dw $0040 : dl Tiles_Torizo+$500 : dw $7400
    dw Instruction_Common_WaitYFrames,$0010
    dw Instruction_Common_TimerInY,$0006

InstList_GoldenTorizo_ReleaseGoldenTorizoEggs_1:
    dw Instruction_GoldenTorizo_QueueEggReleasedSFX
    dw Instruction_GoldenTorizo_SpawnGoldenTorizoEgg
    dw Instruction_Common_WaitYFrames,$0008
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate
    dw InstList_GoldenTorizo_ReleaseGoldenTorizoEggs_1

InstList_GoldenTorizo_ReleaseGoldenTorizoEggs_2:
    dw Instruction_Common_WaitYFrames,$0001
    dw Instruction_GoldenTorizo_EyeBeamAttack_0
    dw InstList_GoldenTorizo_ReleaseGoldenTorizoEggs_2
    dw Instruction_Common_TransferYBytesInYToVRAM
    dw $0040 : dl Tiles_Torizo+$300 : dw $7300
    dw Instruction_Common_TransferYBytesInYToVRAM
    dw $0040 : dl Tiles_Torizo+$500 : dw $7400
    dw Instruction_Common_WaitYFrames,$0008
    dw Instruction_Common_TransferYBytesInYToVRAM
    dw $0040 : dl Tiles_Torizo+$2C0 : dw $7300
    dw Instruction_Common_TransferYBytesInYToVRAM
    dw $0040 : dl Tiles_Torizo+$4C0 : dw $7400
    dw Instruction_Common_WaitYFrames,$0008
    dw Instruction_Common_TransferYBytesInYToVRAM
    dw $0040 : dl Tiles_Torizo+$280 : dw $7300
    dw Instruction_Common_TransferYBytesInYToVRAM
    dw $0040 : dl Tiles_Torizo+$480 : dw $7400
    dw Instruction_Common_WaitYFrames,$0008
    dw Instruction_Common_TransferYBytesInYToVRAM
    dw $0040 : dl Tiles_BombTorizo_GoldenTorizo+$600 : dw $7300
    dw Instruction_Common_TransferYBytesInYToVRAM
    dw $0040 : dl Tiles_BombTorizo_GoldenTorizo+$800 : dw $7400
    dw Instruction_Common_Enemy0FB2_InY
    dw Function_GoldenTorizo_Movement_Walking
    dw Instruction_Torizo_Return


;;; $D0E9: Instruction - spawn Golden Torizo egg ;;;
Instruction_GoldenTorizo_SpawnGoldenTorizoEgg:
    PHY
    LDY.W #EnemyProjectile_GoldenTorizoEgg
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    PLY
    RTL


;;; $D0F3: Instruction - go to [[Y]] if Golden Torizo egg is active ;;;
Instruction_GoldenTorizo_EyeBeamAttack_0:
    PHX
    LDX.W #$0022

  .loop:
    LDA.W EnemyProjectile_ID,X : CMP.W #EnemyProjectile_GoldenTorizoEgg : BEQ .gotoY
    DEX #2 : BPL .loop
    PLX
    INY #2
    RTL

  .gotoY:
    PLX
    LDA.W $0000,Y : TAY
    RTL


;;; $D10D: Instruction list - callable - Golden Torizo eye beam attack ;;;
InstList_GoldenTorizo_EyeBeamAttack_0:
    dw Instruction_Torizo_FunctionInY
    dw Function_GoldenTorizo_SimpleMovement
    dw Instruction_GoldenTorizo_DisableEyeBeamExplosions
    dw Instruction_Torizo_SetAnimationLock
    dw Instruction_Common_WaitYFrames,$0008
    dw Instruction_Common_TimerInY,$0004
    dw Instruction_GoldenTorizo_QueueLaserSFX

InstList_GoldenTorizo_EyeBeamAttack_1:
    dw Instruction_GoldenTorizo_SpawnEyeBeam,$0000
    dw Instruction_Common_WaitYFrames,$0004
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate
    dw InstList_GoldenTorizo_EyeBeamAttack_1
    dw Instruction_Common_WaitYFrames,$0008
    dw Instruction_Common_TimerInY,$0002

InstList_GoldenTorizo_EyeBeamAttack_2:
    dw Instruction_Common_WaitYFrames,$0003
    dw Instruction_Common_TransferYBytesInYToVRAM
    dw $0040 : dl Tiles_Torizo : dw $7D80
    dw Instruction_Common_WaitYFrames,$0003
    dw Instruction_Common_TransferYBytesInYToVRAM
    dw $0040 : dl Tiles_Torizo+$40 : dw $7D80
    dw Instruction_Common_WaitYFrames,$0003
    dw Instruction_Common_TransferYBytesInYToVRAM
    dw $0040 : dl Tiles_Torizo+$80 : dw $7D80
    dw Instruction_Common_WaitYFrames,$0003
    dw Instruction_Common_TransferYBytesInYToVRAM
    dw $0040 : dl Tiles_Torizo+$C0 : dw $7D80
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate
    dw InstList_GoldenTorizo_EyeBeamAttack_2
    dw Instruction_GoldenTorizo_EnableEyeBeamExplosions
    dw Instruction_Common_WaitYFrames,$0008
    dw Instruction_GoldenTorizo_DisableEyeBeamExplosions
    dw Instruction_Torizo_ClearAnimationLock
    dw Instruction_Torizo_FunctionInY
    dw Function_GoldenTorizo_NormalMovement
    dw Instruction_Torizo_Return


;;; $D17B: Instruction - disable eye beam explosions ;;;
Instruction_GoldenTorizo_DisableEyeBeamExplosions:
    LDA.L Torizo.eyeBeamExplosionsFlag,X : AND.W #$7FFF : STA.L Torizo.eyeBeamExplosionsFlag,X
    RTL


;;; $D187: Instruction - enable eye beam explosions ;;;
Instruction_GoldenTorizo_EnableEyeBeamExplosions:
    LDA.L Torizo.eyeBeamExplosionsFlag,X : ORA.W #$8000 : STA.L Torizo.eyeBeamExplosionsFlag,X
    RTL


;;; $D193: Instruction list - callable - stunned ;;;
InstList_Torizo_Stunned_0:
    dw Instruction_Common_Enemy0FB2_InY
    dw Function_GoldenTorizo_Movement_Attacking
    dw Instruction_Torizo_SetAnimationLock
    dw Instruction_Common_WaitYFrames,$0018
    dw Instruction_Common_TimerInY,$0002

InstList_Torizo_Stunned_1:
    dw Instruction_Common_WaitYFrames,$0003
    dw Instruction_Common_TransferYBytesInYToVRAM
    dw $0040 : dl Tiles_Torizo : dw $7D80
    dw Instruction_Common_WaitYFrames,$0003
    dw Instruction_Common_TransferYBytesInYToVRAM
    dw $0040 : dl Tiles_Torizo+$40 : dw $7D80
    dw Instruction_Common_WaitYFrames,$0003
    dw Instruction_Common_TransferYBytesInYToVRAM
    dw $0040 : dl Tiles_Torizo+$80 : dw $7D80
    dw Instruction_Common_WaitYFrames,$0003
    dw Instruction_Common_TransferYBytesInYToVRAM
    dw $0040 : dl Tiles_Torizo+$C0 : dw $7D80
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate
    dw InstList_Torizo_Stunned_1
    dw Instruction_Common_WaitYFrames,$0010
    dw Instruction_Torizo_ClearAnimationLock
    dw Instruction_GoldenTorizo_UnmarkStunned
    dw Instruction_Common_Enemy0FB2_InY
    dw Function_GoldenTorizo_Movement_Walking
    dw Instruction_Torizo_Return


;;; $D1E7: Instruction - unmark Golden Torizo stunned ;;;
Instruction_GoldenTorizo_UnmarkStunned:
    LDA.W Torizo.behavioralProperties,X : AND.W #$DFFF : STA.W Torizo.behavioralProperties,X
    RTL


;;; $D1F1: Instruction list - Golden Torizo - dodge - turning left ;;;
InstList_GoldenTorizo_Dodge_TurningLeft:
    dw Instruction_Torizo_FunctionInY
    dw Function_Torizo_SimpleMovement
    dw Instruction_Torizo_SetAnimationLock
    dw Instruction_Torizo_SetTorizoTurningAroundFlag
    dw $0018,ExtendedSpritemaps_Torizo_FacingScreen_Turning_Dodging
    dw Instruction_Torizo_ClearAnimationLock
    dw Instruction_Common_GotoY
    dw InstList_GoldenTorizo_WalkingLeft_RightLegMoving


;;; $D203: Instruction list - Golden Torizo - turning left ;;;
InstList_GoldenTorizo_TurningLeft:
    dw Instruction_Torizo_FunctionInY
    dw Function_Torizo_SimpleMovement
    dw Instruction_Torizo_SetTorizoTurningAroundFlag
    dw $0008,ExtendedSpritemaps_Torizo_FacingScreen_Turning_Dodging


;;; $D20D: Instruction list - Golden Torizo - walking left - right leg moving ;;;
InstList_GoldenTorizo_WalkingLeft_RightLegMoving:
    dw Instruction_Torizo_SetSteppedLeftWithLeftFootState
    dw Instruction_Torizo_FunctionInY
    dw Function_GoldenTorizo_NormalMovement
    dw Instruction_Common_Enemy0FB2_InY
    dw Function_GoldenTorizo_Movement_Walking
    dw Instruction_Torizo_PlayTorizoFootstepsSFX
    dw $0008,ExtendedSpritemaps_Torizo_WalkingLeft_RightLegMoving_0
    dw Instruction_GoldenTorizo_GotoY_JumpForwards_IfAtLeast70Pixel
    dw InstList_Torizo_FacingLeft_JumpingForwards_0
    dw Instruction_GoldenTorizo_GotoY_JumpBack_IfLessThan20Pixels
    dw InstList_Torizo_FacingLeft_JumpingBackward_LandLeftFootFwd_0
    dw Instruction_GoldenTorizo_CallY_IfStunHealthGreaterThan2A31
    dw InstList_Torizo_Stunned_0
    dw Instruction_GT_CallY_25Chance_IfSamusMorphedInFrontOfTorizo
    dw InstList_GoldenTorizo_EyeBeamAttack_0
    dw Instruction_GoldenTorizo_WalkingMovement_IndexInY,$0002
    dw $0004,ExtendedSpritemaps_Torizo_WalkingLeft_RightLegMoving_1
    dw Instruction_GoldenTorizo_WalkingMovement_IndexInY,$0004
    dw $0004,ExtendedSpritemaps_Torizo_WalkingLeft_RightLegMoving_2
    dw Instruction_GoldenTorizo_CallY_25Chance_IfHealthLessThan789
    dw InstList_GoldenTorizo_ReleaseGoldenTorizoEggs_0
    dw Instruction_GoldenTorizo_GotoY_JumpBack_IfLessThan20Pixels
    dw InstList_Torizo_FacingLeft_JumpingBackward_LandLeftFootFwd_0
    dw Instruction_GoldenTorizo_WalkingMovement_IndexInY,$0006
    dw $0004,ExtendedSpritemaps_Torizo_WalkingLeft_RightLegMoving_3
    dw Instruction_GoldenTorizo_WalkingMovement_IndexInY,$0008
    dw $0004,ExtendedSpritemaps_Torizo_WalkingLeft_RightLegMoving_4
    dw Instruction_GoldenTorizo_WalkingMovement_IndexInY,$000A


;;; $D259: Instruction list - Golden Torizo - walking left - left leg moving ;;;
InstList_GoldenTorizo_WalkingLeft_LeftLegMoving:
    dw Instruction_Torizo_SetSteppedLeftWithRightFootState
    dw Instruction_Torizo_FunctionInY
    dw Function_GoldenTorizo_NormalMovement
    dw Instruction_Common_Enemy0FB2_InY
    dw Function_GoldenTorizo_Movement_Walking
    dw Instruction_Torizo_PlayTorizoFootstepsSFX
    dw $0008,ExtendedSpritemaps_Torizo_WalkingLeft_LeftLegMoving_0
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
    dw Instruction_GoldenTorizo_WalkingMovement_IndexInY,$000C
    dw $0004,ExtendedSpritemaps_Torizo_WalkingLeft_LeftLegMoving_1
    dw Instruction_GoldenTorizo_WalkingMovement_IndexInY,$000E
    dw $0004,ExtendedSpritemaps_Torizo_WalkingLeft_LeftLegMoving_2
    dw Instruction_GoldenTorizo_CallY_25Chance_IfHealthLessThan789
    dw InstList_GoldenTorizo_ReleaseGoldenTorizoEggs_0
    dw Instruction_GoldenTorizo_GotoY_JumpBack_IfLessThan20Pixels
    dw InstList_Torizo_FacingLeft_JumpingBackward_RightFootFwd_0
    dw Instruction_GoldenTorizo_WalkingMovement_IndexInY,$0010
    dw $0004,ExtendedSpritemaps_Torizo_WalkingLeft_LeftLegMoving_3
    dw Instruction_GoldenTorizo_WalkingMovement_IndexInY,$0012
    dw $0004,ExtendedSpritemaps_Torizo_WalkingLeft_LeftLegMoving_4
    dw Instruction_GoldenTorizo_WalkingMovement_IndexInY,$0000
    dw Instruction_Common_GotoY
    dw InstList_GoldenTorizo_WalkingLeft_RightLegMoving


;;; $D2AD: Instruction list - Golden Torizo - dodge - turning right ;;;
InstList_GoldenTorizo_Dodge_TurningRight:
    dw Instruction_Torizo_FunctionInY
    dw Function_Torizo_SimpleMovement
    dw Instruction_Torizo_SetAnimationLock
    dw Instruction_Torizo_SetTorizoTurningAroundFlag
    dw $0018,ExtendedSpritemaps_Torizo_FacingScreen_Turning_Dodging
    dw Instruction_Torizo_ClearAnimationLock
    dw Instruction_Common_GotoY
    dw InstList_GoldenTorizo_WalkingRight_LeftLegMoving


;;; $D2BF: Instruction list - Golden Torizo - turning right ;;;
InstList_GoldenTorizo_TurningRight:
    dw Instruction_Torizo_FunctionInY
    dw Function_Torizo_SimpleMovement
    dw Instruction_Torizo_SetTorizoTurningAroundFlag
    dw $0008,ExtendedSpritemaps_Torizo_FacingScreen_Turning_Dodging


;;; $D2C9: Instruction list - Golden Torizo - walking right - left leg moving ;;;
InstList_GoldenTorizo_WalkingRight_LeftLegMoving:
    dw Instruction_Torizo_SetSteppedRightWithRightFootState
    dw Instruction_Torizo_FunctionInY
    dw Function_GoldenTorizo_NormalMovement
    dw Instruction_Common_Enemy0FB2_InY
    dw Function_GoldenTorizo_Movement_Walking
    dw Instruction_Torizo_PlayTorizoFootstepsSFX
    dw $0008,ExtendedSpritemaps_Torizo_WalkingRight_LeftLegMoving_0
    dw Instruction_GoldenTorizo_GotoY_JumpForwards_IfAtLeast70Pixel
    dw InstList_Torizo_FacingRight_JumpingForwards_0
    dw Instruction_GoldenTorizo_GotoY_JumpBack_IfLessThan20Pixels
    dw InstList_Torizo_FacingRight_JumpBackward_LandRightFootFwd_0
    dw Instruction_GoldenTorizo_CallY_IfStunHealthGreaterThan2A31
    dw InstList_Torizo_Stunned_0
    dw Instruction_GT_CallY_25Chance_IfSamusMorphedInFrontOfTorizo
    dw InstList_GoldenTorizo_EyeBeamAttack_0
    dw Instruction_GoldenTorizo_WalkingMovement_IndexInY,$0016
    dw $0004,ExtendedSpritemaps_Torizo_WalkingRight_LeftLegMoving_1
    dw Instruction_GoldenTorizo_WalkingMovement_IndexInY,$0018
    dw $0004,ExtendedSpritemaps_Torizo_WalkingRight_LeftLegMoving_2
    dw Instruction_GoldenTorizo_CallY_25Chance_IfHealthLessThan789
    dw InstList_GoldenTorizo_ReleaseGoldenTorizoEggs_0
    dw Instruction_GoldenTorizo_WalkingMovement_IndexInY,$001A
    dw $0004,ExtendedSpritemaps_Torizo_WalkingRight_LeftLegMoving_3
    dw Instruction_GoldenTorizo_GotoY_JumpBack_IfLessThan20Pixels
    dw InstList_Torizo_FacingRight_JumpBackward_LandRightFootFwd_0
    dw Instruction_GoldenTorizo_WalkingMovement_IndexInY,$001C
    dw $0004,ExtendedSpritemaps_Torizo_WalkingRight_LeftLegMoving_4
    dw Instruction_GoldenTorizo_WalkingMovement_IndexInY,$001E


;;; $D315: Instruction list - Golden Torizo - walking right - right leg moving ;;;
InstList_GoldenTorizo_WalkingRight_RightLegMoving:
    dw Instruction_Torizo_SetSteppedRightWithLeftFootState
    dw Instruction_Torizo_FunctionInY
    dw Function_GoldenTorizo_NormalMovement
    dw Instruction_Common_Enemy0FB2_InY
    dw Function_GoldenTorizo_Movement_Walking
    dw Instruction_Torizo_PlayTorizoFootstepsSFX
    dw $0008,ExtendedSpritemaps_Torizo_WalkingRight_RightLegMoving_0
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
    dw Instruction_GoldenTorizo_WalkingMovement_IndexInY,$0020
    dw $0004,ExtendedSpritemaps_Torizo_WalkingRight_RightLegMoving_1
    dw Instruction_GoldenTorizo_WalkingMovement_IndexInY,$0022
    dw $0004,ExtendedSpritemaps_Torizo_WalkingRight_RightLegMoving_2
    dw Instruction_GoldenTorizo_CallY_25Chance_IfHealthLessThan789
    dw InstList_GoldenTorizo_ReleaseGoldenTorizoEggs_0
    dw Instruction_GoldenTorizo_GotoY_JumpBack_IfLessThan20Pixels
    dw InstList_Torizo_FacingRight_JumpBackwards_LandLeftFootFwd_0
    dw Instruction_GoldenTorizo_WalkingMovement_IndexInY,$0024
    dw $0004,ExtendedSpritemaps_Torizo_WalkingRight_RightLegMoving_3
    dw Instruction_GoldenTorizo_WalkingMovement_IndexInY,$0026
    dw $0004,ExtendedSpritemaps_Torizo_WalkingRight_RightLegMoving_4
    dw Instruction_GoldenTorizo_WalkingMovement_IndexInY,$0014
    dw Instruction_Common_GotoY
    dw InstList_GoldenTorizo_WalkingRight_LeftLegMoving


;;; $D369: Main AI - enemy $EF7F/$EFBF (Gold Torizo) ;;;
MainAI_GoldenTorizo:
    LDX.W EnemyIndex
    LDA.W Pose : CMP.W #$001B : BEQ .spaceJump
    CMP.W #$001C : BEQ .spaceJump
    LDA.W #$0000 : STA.L Torizo.spaceJumpCounter,X
    BRA .executeFunction

  .spaceJump:
    LDA.L Torizo.spaceJumpCounter,X : INC : STA.L Torizo.spaceJumpCounter,X

  .executeFunction:
    JSR.W (Torizo.function,X)
    RTL


;;; $D38F: Instruction - queue Golden Torizo egg released sound effect ;;;
Instruction_GoldenTorizo_QueueEggReleasedSFX:
    LDA.W #$0034
    JSL QueueSound_Lib2_Max6
    RTL


;;; $D397: Instruction - queue laser sound effect ;;;
Instruction_GoldenTorizo_QueueLaserSFX:
    LDA.W #$0067
    JSL QueueSound_Lib2_Max6
    RTL


;;; $D39F: Instruction - queue torizo sonic boom sound effect ;;;
Instruction_Torizo_QueueSonicBoomSFX:
    LDA.W #$0048
    JSL QueueSound_Lib2_Max6
    RTL


;;; $D3A7: Check if torizo is facing Samus ;;;
CheckIfTorizoIsFacingSamus:
;; Returns:
;;     Negative: Set if torizo is facing away from Samus, clear otherwise

; Facing right: [Torizo.graphicalProperties] & 8000h != 0
    LDA.W Enemy.XPosition,X : SEC : SBC.W SamusXPosition : EOR.W Torizo.graphicalProperties,X
    RTS


;;; $D3B2: Golden Torizo health-based palette handling ;;;
Goto_GoldenTorizoHealthBasedPaletteHandling:
    LDA.W Enemy.health,X
    JSL GoldenTorizo_HealthBasedPalette_Handling
    RTS


;;; $D3BA: Hurt AI - enemy $EF7F/$EFBF (Golden Torizo) ;;;
HurtAI_GoldenTorizo:
    LDX.W EnemyIndex
    JSR HandleLowHealthInitialDrool
    LDA.W Enemy.flashTimer,X : LSR : BCS .flash
    JSR Goto_GoldenTorizoHealthBasedPaletteHandling
    BRA .return

  .flash:
    PHX
    LDX.W #$001E

  .loopPalettes:
    LDA.W #$7FFF : STA.L Palettes_SpriteP2,X : STA.L Palettes_SpriteP1,X
    DEX #2 : BPL .loopPalettes
    PLX

  .return:
    RTL


;;; $D3E0: Instruction - spawn Golden Torizo super missile ;;;
Instruction_GoldenTorizo_SpawnSuperMissile:
    PHY
    LDY.W #EnemyProjectile_GoldenTorizoSuperMissile
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    PLY
    RTL


;;; $D3EA: Instruction - go to [[Y]] if Samus is a medium distance behind torizo and morphed ;;;
Instruction_GoldenTorizo_GotoY_IfSamusIsMorphedBehindTorizo:
; Pose checklist is missing 41h (facing left - morph ball - no springball - on ground) >_<;
    JSR CheckIfTorizoIsFacingSamus
    BPL .noGo
    LDA.W #$0004
    JSL CheckIfXDistanceBetweenEnemyAndSamusIsAtLeastA
    BCC .noGo
    LDA.W #$0028
    JSL CheckIfXDistanceBetweenEnemyAndSamusIsAtLeastA
    BCS .noGo
    LDA.W Pose : CMP.W #$001D : BEQ .gotoY
    CMP.W #$001E : BEQ .gotoY
    CMP.W #$001F : BEQ .gotoY
    CMP.W #$0079 : BEQ .gotoY
    CMP.W #$007A : BEQ .gotoY
    CMP.W #$007B : BEQ .gotoY
    CMP.W #$007C : BNE .noGo

  .gotoY:
    LDA.W #$0000 : STA.L Torizo.stepCounter,X
    LDA.W $0000,Y : TAY
    RTL

  .noGo:
    INY #2
    RTL


;;; $D436: Instruction - spawn Golden Torizo eye beam ;;;
Instruction_GoldenTorizo_SpawnEyeBeam:
    PHY
    LDA.W $0000,Y
    LDY.W #EnemyProjectile_GoldenTorizoEyeBeam
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    PLY
    INY #2
    RTL


;;; $D445: Instruction - call [[Y]] with 25% chance if Samus is a medium distance in front of torizo ;;;
Instruction_GT_CallY_25Chance_IfSamusMorphedInFrontOfTorizo:
    JSR CheckIfTorizoIsFacingSamus
    BMI .noGo
    LDA.W #$0020
    JSL CheckIfXDistanceBetweenEnemyAndSamusIsAtLeastA
    BCC .noGo
    LDA.W #$0060
    JSL CheckIfXDistanceBetweenEnemyAndSamusIsAtLeastA
    BCS .noGo
    JSL GenerateRandomNumber
    AND.W #$0110 : BNE .noGo
    TYA : INC #2 : STA.L Torizo.linkInstruction,X
    LDA.W $0000,Y : TAY
    RTL

  .noGo:
    INY #2
    RTL


;;; $D474: Instruction - call [[Y]] with 25% chance if health <= 1928 ;;;
Instruction_GoldenTorizo_CallY_25Chance_IfHealthLessThan789:
    LDA.W #$0788 : CMP.W Enemy.health,X : BCC .noGo
    JSL GenerateRandomNumber
    AND.W #$0102 : BNE .noGo
    LDA.W #$0000 : STA.L Torizo.stepCounter,X
    TYA : INC #2 : STA.L Torizo.linkInstruction,X
    LDA.W $0000,Y : TAY
    RTL

  .noGo:
    INY #2
    RTL


;;; $D49B: Instruction - call [[Y]] if health >= 10800 and stunned ;;;
Instruction_GoldenTorizo_CallY_IfStunHealthGreaterThan2A31:
    LDA.W #$2A30 : CMP.W Enemy.health,X : BCS .noGo
    LDA.W Torizo.behavioralProperties,X : BIT.W #$2000 : BEQ .noGo
    TYA : INC #2 : STA.L Torizo.linkInstruction,X
    LDA.W $0000,Y : TAY
    RTL

  .noGo:
    INY #2
    RTL


;;; $D4BA: Instruction - go to [[Y]] and jump forwards if Samus is at least 70h pixels in front of Golden Torizo ;;;
Instruction_GoldenTorizo_GotoY_JumpForwards_IfAtLeast70Pixel:
; Jump at Samus if at least 7 blocks away and:
;     She's been space jumping for over 6 seconds
;     Or the player is pressing left or right with a 75% chance
    LDA.W #$0070
    JSL CheckIfXDistanceBetweenEnemyAndSamusIsAtLeastA
    BCC .noGo
    JSR CheckIfTorizoIsFacingSamus
    BMI .noGo
    LDA.W #$0168 : CMP.L Torizo.spaceJumpCounter,X : BCC .jump
    LDA.B DP_Controller1Input : AND.W #$0300 : BEQ .noGo
    JSL GenerateRandomNumber
    AND.W #$0101 : BEQ .noGo

  .jump:
    LDA.W #$0000 : STA.L Torizo.stepCounter,X
    JSR MakeTorizoJumpForwards
    LDA.W $0000,Y : TAY
    RTL

  .noGo:
    INY #2
    RTL


;;; $D4F3: Instruction - spawn Golden Torizo's chozo orbs ;;;
Instruction_GoldenTorizo_SpawnChozoOrbs:
    PHY
    LDY.W #EnemyProjectile_GoldenTorizoChozoOrbs
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    PLY
    RTL


;;; $D4FD: Instruction - go to [[Y]] and jump backwards if Samus is less than 20h pixels in front of Golden Torizo ;;;
Instruction_GoldenTorizo_GotoY_JumpBack_IfLessThan20Pixels:
    LDA.L Torizo.stepCounter,X : CMP.W #$0008 : BCS .jump
    LDA.W #$0020
    JSL CheckIfXDistanceBetweenEnemyAndSamusIsAtLeastA
    BCS .noGo
    JSR CheckIfTorizoIsFacingSamus
    BMI .noGo

  .jump:
    LDA.W #$0000 : STA.L Torizo.stepCounter,X
    JSR MakeTorizoJumpBackwards
    LDA.W $0000,Y : TAY
    RTL

  .noGo:
    INY #2
    RTL


;;; $D526: Instruction - call [[Y]] or [[Y] + 2] for Golden Torizo attack ;;;
Instruction_GoldenTorizo_CallY_OrY2_ForAttack:
    TYA : INC #4 : STA.L Torizo.linkInstruction,X
    LDA.W Missiles : CMP.W #$0020 : BCC .spewOrbs
    LDA.W SamusXPosition : LSR : ADC.W NMI_FrameCounter : AND.W #$0008 : BEQ .sonicBooms

  .spewOrbs:
    LDA.W $0000,Y
    BRA .return

  .sonicBooms:
    LDA.W $0002,Y

  .return:
    TAY
    RTL


;;; $D54D: Instruction - Golden Torizo walking movement - index [[Y]] ;;;
Instruction_GoldenTorizo_WalkingMovement_IndexInY:
    PHY
    STZ.B DP_Temp12
    LDA.W $0000,Y : TAY
    LDA.W .velocities,Y : STA.B DP_Temp14 : STA.W Torizo.XVelocity,X
    JSL MoveEnemyRightBy_14_12_IgnoreSlopes
    PLY
    BCC .noCollision
    LDA.W #$0000 : STA.L Torizo.turnAroundTimer,X
    LDA.W Torizo.graphicalProperties,X : BMI .facingRight
    LDY.W #InstList_GoldenTorizo_TurningRight
    RTL

  .facingRight:
    LDY.W #InstList_GoldenTorizo_TurningLeft
    RTL

  .noCollision:
    JSL AlignEnemyYPositionWIthNonSquareSlope
    LDA.W SamusXPosition : SEC : SBC.W Enemy.XPosition,X : EOR.W Torizo.graphicalProperties,X : BPL .facingAway
    INY #2
    RTL

  .facingAway:
    LDA.L Torizo.turnAroundTimer,X : BNE .return
    LDA.W #$0010 : STA.L Torizo.turnAroundTimer,X

  .return:
    INY #2
    RTL

  .velocities:
    dw $FFFB,$0000,$FFFB,$FFED,$FFF0,$FFF9,$0000,$FFF9
    dw $FFEF,$FFEE,$0005,$0000,$0005,$0013,$0010,$0007
    dw $0000,$0007,$0011,$0012


;;; $D5C2: Torizo function - Golden Torizo - wake enemy if Samus is below and right of target position ;;;
Function_GoldenTorizo_WakeIfSamusIsBelowAndRightOfTargetPos:
    LDA.W #$0140 : CMP.W SamusYPosition : BCS .return
    LDA.W #$0170 : CMP.W SamusXPosition : BCS .return
    INC.W Enemy.instList,X : INC.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X

  .return:
    RTS


;;; $D5DF: Torizo function - Golden Torizo - simple movement ;;;
Function_GoldenTorizo_SimpleMovement:
; Clone of Function_Torizo_SimpleMovement
    JSR HandleLowHealthInitialDrool
    JSR HandleFalling
    RTS


;;; $D5E6: Torizo function - Golden Torizo - normal movement ;;;
Function_GoldenTorizo_NormalMovement:
    JSR HandleLowHealthInitialDrool
    JSR.W (Torizo.movementFunction,X)
    RTS


;;; $D5ED: Torizo movement function - Golden Torizo - attacking ;;;
Function_GoldenTorizo_Movement_Attacking:
; Clone of Function_Torizo_Movement_Attacking
    JSR HandleFalling
    RTS


;;; $D5F1: Torizo movement function - Golden Torizo - walking ;;;
Function_GoldenTorizo_Movement_Walking:
    LDA.L Torizo.turnAroundTimer,X : BEQ .notTurning
    DEC : STA.L Torizo.turnAroundTimer,X : BNE .notTurning
    LDA.W #$0000 : STA.L Torizo.turnAroundTimer,X
    LDA.W Torizo.graphicalProperties,X : BMI .facingRight
    LDA.W #InstList_GoldenTorizo_TurningRight
    BRA +

  .facingRight:
    LDA.W #InstList_GoldenTorizo_TurningLeft

+   STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    RTS

  .notTurning:
    STZ.B DP_Temp12
    LDA.W Torizo.XVelocity,X : BPL +
    EOR.W #$FFFF : INC

+   INC : CMP.W #$0010 : BCC +
    LDA.W #$000F

+   STA.B DP_Temp14
    JSL MoveEnemyDownBy_14_12
    BCS .return
    LDA.W Torizo.graphicalProperties,X : BMI ..facingRight
    LDA.W #InstList_Torizo_FacingLeft_Falling_0
    BRA +

  ..facingRight:
    LDA.W #InstList_Torizo_FacingRight_Falling_0

+   STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDA.W #$0100 : STA.W Torizo.YVelocity,X
    STZ.W Torizo.XVelocity,X

  .return:
    RTS


;;; $D658: Golden Torizo shot reaction - stand up / sit down ;;;
ShotReaction_GoldenTorizo_StandUp_SitDown:
    LDX.W EnemyIndex
    LDA.W Enemy.flashTimer,X : BNE .return
    LDA.L Torizo.animationLockFlag,X : BEQ ShotReaction_GoldenTorizo_Damaged

  .return:
    RTL


;;; $D667: Golden Torizo shot reaction - normal ;;;
ShotReaction_GoldenTorizo_Normal:
    LDX.W EnemyIndex
    LDA.W Enemy.flashTimer,X : BNE .return
    LDA.L Torizo.animationLockFlag,X : BEQ .gotoFlashOrAnimLock
    JMP ShotReaction_GoldenTorizo_Damaged

  .gotoFlashOrAnimLock:
    JMP .flashOrAnimLock ; >.<

  .return:
    RTL

  .flashOrAnimLock:
    LDA.W Torizo.behavioralProperties,X : BIT.W #$1000 : BNE .stun
    LDA.W CollisionIndex : ASL : TAY
    LDA.W SamusProjectile_Types,Y : AND.W #$0F00 : STA.L ExtraEnemy7800+$A,X
    CMP.W #$0100 : BEQ ShotReaction_GoldenTorizo_Normal_Missile
    CMP.W #$0200 : BEQ ShotReaction_GoldenTorizo_Normal_SuperMissile

  .stun:
    LDA.W Torizo.behavioralProperties,X : ORA.W #$2000 : STA.W Torizo.behavioralProperties,X
; fallthrough to ShotReaction_GoldenTorizo_Damaged


;;; $D6A6: Golden Torizo shot reaction - damaged ;;;
ShotReaction_GoldenTorizo_Damaged:
    JSL NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External
    LDX.W EnemyIndex
    LDA.W Enemy.health,X : BNE .return
    LDA.W #InstList_Torizo_DeathSequence_0 : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDA.W Torizo.behavioralProperties,X : ORA.W #$C000 : STA.W Torizo.behavioralProperties,X
    LDA.W Enemy.properties,X : ORA.W #$0400 : STA.W Enemy.properties,X

  .return:
    RTL


;;; $D6D1: Golden Torizo shot reaction - normal - missile ;;;
ShotReaction_GoldenTorizo_Normal_Missile:
    LDA.W SamusProjectile_Directions,Y : AND.W #$FFEF : STA.W SamusProjectile_Directions,Y
    LDA.W #RTS_AAC6AB : STA.W Torizo.function,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    BIT.W Torizo.graphicalProperties,X : BMI .keepRight
    LDA.W #InstList_GoldenTorizo_Dodge_TurningLeft
    BRA +

  .keepRight:
    LDA.W #InstList_GoldenTorizo_Dodge_TurningRight

+   STA.W Enemy.instList,X
    RTL


;;; $D6F7: Golden Torizo shot reaction - normal - super missile ;;;
ShotReaction_GoldenTorizo_Normal_SuperMissile:
    JSR CheckIfTorizoIsFacingSamus
    BPL .facingSamus
    JMP ShotReaction_GoldenTorizo_Damaged

  .facingSamus:
    LDA.W Torizo.behavioralProperties,X : ORA.W #$1000 : STA.W Torizo.behavioralProperties,X
    LDA.W #RTS_AAC6AB : STA.W Torizo.function,X
    LDA.W SamusProjectile_Directions,Y : ORA.W #$0010 : STA.W SamusProjectile_Directions,Y
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDA.W Torizo.graphicalProperties,X : BIT.W #$2000 : BNE .backgroundLegForward
    BIT.W Torizo.graphicalProperties,X : BMI .facingRight
    LDA.W #InstList_GoldenTorizo_CaughtSuper_FacingLeft_LeftLegFwd
    BRA +

  .facingRight:
    LDA.W #InstList_GoldenTorizo_CaughtSuper_FacingRight_RightLegFwd
    BRA +

  .backgroundLegForward:
    BIT.W Torizo.graphicalProperties,X : BMI ..facingRight
    LDA.W #InstList_GoldenTorizo_CaughtSuper_FacingLeft_RightLegFwd
    BRA +

  ..facingRight:
    LDA.W #InstList_GoldenTorizo_CaughtSuper_FacingRight_LeftLegFwd

+   STA.W Enemy.instList,X
    RTL


;;; $D745: Tourian entrance statue palettes ;;;
Palettes_TourianStatue_Ridley:
; Initial. (Sprite palette 1)
    dw $3800,$57FF,$2BFF,$1F3C,$0278,$01B0,$010B,$0087
    dw $0044,$001F,$0012,$0009,$7FFF,$7FFF,$7FFF,$0000

Palettes_TourianStatue_Phantoon:
; Sprite palette 2
    dw $3800,$57FF,$2BFF,$1F3C,$0278,$01B0,$010B,$0087
    dw $0044,$7FFF,$7FFF,$7FFF,$03FF,$0252,$0129,$0000

Palettes_TourianStatue_BaseDecoration:
; Sprite palette 7
    dw $3800,$27F9,$2375,$1AD2,$164E,$11AB,$0D27,$0484
    dw $0000,$7F5F,$7C1F,$5816,$300C,$5294,$39CE,$2108


;;; $D7A5: Instruction list - Tourian entrance statue - Ridley ;;;
InstList_TourianStatue_Ridley_0:
    dw Instruction_Common_DeleteEnemy

InstList_TourianStatue_Ridley_1:
    dw $7777,UNUSED_Spritemaps_TourianStatue_Ridley_AAD83B
    dw Instruction_Common_GotoY
    dw InstList_TourianStatue_Ridley_1


;;; $D7AF: Instruction list - Tourian entrance statue - Phantoon ;;;
InstList_TourianStatue_Phantoon_0:
    dw Instruction_Common_DeleteEnemy

InstList_TourianStatue_Phantoon_1:
    dw $7777,UNUSED_Spritemaps_TourianStatue_Phantoon_AAD8B0
    dw Instruction_Common_GotoY
    dw InstList_TourianStatue_Phantoon_1


;;; $D7B9: Instruction list - Tourian entrance statue - base decoration ;;;
InstList_TourianStatue_BaseDecoration_0:
    dw Instruction_Common_DeleteEnemy
    dw $0100,UNUSED_Spritemaps_TourianStatue_BaseDecoration_AAD816

InstList_TourianStatue_BaseDecoration_1:
    dw $7777,UNUSED_Spritemaps_TourianStatue_BaseDecoration_AAD816
    dw Instruction_Common_GotoY
    dw InstList_TourianStatue_BaseDecoration_1


;;; $D7C7: RTL. Main AI - enemy $EFFF (Tourian entrance statue) ;;;
MainAI_TourianStatue:
    RTL


;;; $D7C8: Initialisation AI - enemy $EFFF (Tourian entrance statue) ;;;
InitAI_TourianStatue:
; All the instruction lists this enemy use lead with a delete instruction
; I would have to guess that this statue was originally implemented with enemies and then later moved to enemy projectiles
; The remnant instruction lists and spritemaps are leftover, see $86:B85A / $8D:916D for the real deal
    LDX.W EnemyIndex
    STZ.W Enemy.palette,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    LDY.W Enemy.init0,X
    LDA.W .pointers,Y : STA.W Enemy.instList,X
    LDY.W Enemy.init0,X : BNE .nonZeroParam1
    LDY.W #EnemyProjectile_TourianStatueBaseDecoration
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    LDY.W #EnemyProjectile_TourianStatueRidley
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    LDY.W #EnemyProjectile_TourianStatuePhantoon
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics

  .nonZeroParam1:
    LDX.W #$001E

  .loopPalettes:
    LDA.W Palettes_TourianStatue_BaseDecoration,X : STA.L TargetPalettes_SpriteP7,X
    LDA.W Palettes_TourianStatue_Phantoon,X : STA.L TargetPalettes_SpriteP2,X
    DEX #2 : BPL .loopPalettes
    RTL

  .pointers:
    dw InstList_TourianStatue_BaseDecoration_0
    dw InstList_TourianStatue_Ridley_0
    dw InstList_TourianStatue_Phantoon_0


;;; $D816: Unused. Spritemaps - Tourian entrance statue ;;;
UNUSED_Spritemaps_TourianStatue_BaseDecoration_AAD816:
    dw $0007
    %spritemapEntry(1, $4228, $F8, 0, 0, 1, 7, $19C)
    %spritemapEntry(1, $4218, $F8, 0, 0, 1, 7, $19A)
    %spritemapEntry(1, $4208, $F8, 0, 0, 1, 7, $198)
    %spritemapEntry(1, $43F8, $F8, 0, 0, 1, 7, $196)
    %spritemapEntry(1, $43E8, $F8, 0, 0, 1, 7, $194)
    %spritemapEntry(1, $43D8, $F8, 0, 0, 1, 7, $192)
    %spritemapEntry(1, $43C8, $F8, 0, 0, 1, 7, $190)

UNUSED_Spritemaps_TourianStatue_Ridley_AAD83B:
    dw $0017
    %spritemapEntry(1, $43E5, $18, 0, 0, 2, 1, $144)
    %spritemapEntry(1, $43E5, $08, 0, 0, 2, 1, $12C)
    %spritemapEntry(1, $43F5, $18, 0, 0, 2, 1, $146)
    %spritemapEntry(0, $0D, $20, 0, 0, 2, 1, $17D)
    %spritemapEntry(0, $0D, $18, 0, 0, 2, 1, $16D)
    %spritemapEntry(0, $05, $18, 0, 0, 2, 1, $148)
    %spritemapEntry(1, $4215, $08, 0, 0, 2, 1, $142)
    %spritemapEntry(1, $4205, $08, 0, 0, 2, 1, $140)
    %spritemapEntry(1, $43F5, $08, 0, 0, 2, 1, $12E)
    %spritemapEntry(1, $43D5, $08, 0, 0, 2, 1, $12A)
    %spritemapEntry(1, $4215, $F8, 0, 0, 2, 1, $128)
    %spritemapEntry(1, $4205, $F8, 0, 0, 2, 1, $126)
    %spritemapEntry(1, $43F5, $F8, 0, 0, 2, 1, $124)
    %spritemapEntry(1, $43E5, $F8, 0, 0, 2, 1, $122)
    %spritemapEntry(1, $43D5, $F8, 0, 0, 2, 1, $120)
    %spritemapEntry(1, $4215, $E8, 0, 0, 2, 1, $10E)
    %spritemapEntry(1, $4205, $E8, 0, 0, 2, 1, $10C)
    %spritemapEntry(1, $43F5, $E8, 0, 0, 2, 1, $10A)
    %spritemapEntry(1, $43E5, $E8, 0, 0, 2, 1, $108)
    %spritemapEntry(1, $4215, $D8, 0, 0, 2, 1, $106)
    %spritemapEntry(1, $4205, $D8, 0, 0, 2, 1, $104)
    %spritemapEntry(1, $43F5, $D8, 0, 0, 2, 1, $102)
    %spritemapEntry(1, $43E5, $D8, 0, 0, 2, 1, $100)

UNUSED_Spritemaps_TourianStatue_Phantoon_AAD8B0:
    dw $0013
    %spritemapEntry(0, $08, $1C, 0, 0, 2, 2, $187)
    %spritemapEntry(0, $00, $1C, 0, 0, 2, 2, $186)
    %spritemapEntry(0, $1F8, $1C, 0, 0, 2, 2, $185)
    %spritemapEntry(0, $1F0, $1C, 0, 0, 2, 2, $184)
    %spritemapEntry(0, $00, $04, 0, 0, 2, 2, $183)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 2, $181)
    %spritemapEntry(0, $1F8, $04, 0, 0, 2, 2, $182)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 2, $180)
    %spritemapEntry(1, $4208, $EC, 0, 0, 2, 2, $161)
    %spritemapEntry(1, $43E8, $EC, 0, 0, 2, 2, $14D)
    %spritemapEntry(1, $4208, $FC, 0, 0, 2, 2, $165)
    %spritemapEntry(1, $4208, $0C, 0, 0, 2, 2, $16B)
    %spritemapEntry(1, $43F8, $0C, 0, 0, 2, 2, $169)
    %spritemapEntry(1, $43E8, $0C, 0, 0, 2, 2, $167)
    %spritemapEntry(1, $43E8, $FC, 0, 0, 2, 2, $163)
    %spritemapEntry(1, $4200, $EC, 0, 0, 2, 2, $160)
    %spritemapEntry(1, $43F0, $EC, 0, 0, 2, 2, $14E)
    %spritemapEntry(1, $4200, $DC, 0, 0, 2, 2, $14B)
    %spritemapEntry(1, $43F0, $DC, 0, 0, 2, 2, $149)


;;; $D911: Palette - enemy $F07F (Shaktool) ;;;
Palette_Shaktool:
    dw $3800,$5755,$4A4F,$1CE4,$0C60,$56B2,$3E0D,$2D68
    dw $2526,$03FF,$02F7,$0210,$0108,$001F,$0018,$000E


;;; $D931: Unused. Instruction - lower enemy 1px away from enemy projectile ;;;
UNUSED_Instruction_Shaktool_Lower1PixelAwayFromProj_AAD931:
    PHY
    LDY.W Shaktool.primaryPieceEnemyIndex,X
    LDA.W Enemy[3].var3,Y : EOR.W #$0080
    PLY
    JMP MoveShaktoolPiece1Pixel


;;; $D93F: Unused. Instruction - raise enemy 1px towards enemy projectile ;;;
UNUSED_Instruction_Shaktool_Raise1PixelTowardsProj_AAD93F:
    PHY
    LDY.W Shaktool.primaryPieceEnemyIndex,X
    LDA.W Enemy[3].var3,Y
    PLY
    JMP MoveShaktoolPiece1Pixel


;;; $D94A: Instruction - lower enemy 1px ;;;
Instruction_Shaktool_Lower1Pixel:
    LDA.W Enemy.var0+1,X : EOR.W #$0080
    JMP MoveShaktoolPiece1Pixel


;;; $D953: Instruction - raise enemy 1px ;;;
Instruction_Shaktool_Raise1Pixel:
    LDA.W Enemy.var0+1,X
; fallthrough to MoveShaktoolPiece1Pixel


;;; $D956: Move Shaktool piece 1px ;;;
MoveShaktoolPiece1Pixel:
;; Parameters:
;;     A: Angle
    PHX : PHY
    TXY
    AND.W #$00FF : ASL : TAX
    STZ.B DP_Temp12 : STZ.B DP_Temp14
    LDA.L SineCosineTables_8bitSine_SignExtended,X : BPL +
    DEC.B DP_Temp14

+   STA.B DP_Temp13
    LDA.W Enemy.XSubPosition,Y : CLC : ADC.B DP_Temp12 : STA.W Enemy.XSubPosition,Y
    LDA.W Enemy.XPosition,Y : ADC.B DP_Temp14 : STA.W Enemy.XPosition,Y
    STZ.B DP_Temp12 : STZ.B DP_Temp14
    LDA.L SineCosineTables_NegativeCosine_SignExtended,X : BPL +
    DEC.B DP_Temp14

+   STA.B DP_Temp13
    LDA.W Enemy.YSubPosition,Y : CLC : ADC.B DP_Temp12 : STA.W Enemy.YSubPosition,Y
    LDA.W Enemy.YPosition,Y : ADC.B DP_Temp14 : STA.W Enemy.YPosition,Y
    PLY : PLX
    RTL


;;; $D99F: RTL. Instruction - NOP (disabled - spawn Shaktool attack enemy projectiles) ;;;
RTL_AAD99F:
; This is RTL'd out, but the instruction list that calls this instruction is never used due to RTS_AADAE4 being RTS'd out anyway
    RTL

    PHY ; dead code
    LDY.W #EnemyProjectile_ShaktoolFrontCircle
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    PHA
    LDY.W #EnemyProjectile_ShaktoolMiddleCircle
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    PLA
    LDY.W #EnemyProjectile_ShaktoolBackCircle
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    PLY
    RTL


;;; $D9BA: Instruction - reset Shaktool functions ;;;
Instruction_Shaktool_ResetShaktoolFunctions:
    PHY
    LDY.W Shaktool.primaryPieceEnemyIndex,X
    LDA.W ShaktoolPieceData_functionPointer : STA.W Shaktool.function,Y
    LDA.W ShaktoolPieceData_functionPointer_rightArm : STA.W Enemy[1].var5,Y
    LDA.W ShaktoolPieceData_functionPointer_centerRightArm : STA.W Enemy[2].var5,Y
    LDA.W ShaktoolPieceData_functionPointer_head : STA.W Enemy[3].var5,Y
    LDA.W ShaktoolPieceData_functionPointer_centerLeftArm : STA.W Enemy[4].var5,Y
    LDA.W ShaktoolPieceData_functionPointer_leftArm : STA.W Enemy[5].var5,Y
    LDA.W ShaktoolPieceData_functionPointer_leftSaw : STA.W Enemy[6].var5,Y
    PLY
    RTL


;;; $D9EA: Unused. Instruction list - Shaktool saw hand - attack - primary piece ;;;
UNUSED_InstList_Shaktool_SawHand_Attack_PrimaryPiece_AAD9EA:
    dw Instruction_Common_WaitYFrames,$0240
    dw Instruction_Common_GotoY
    dw InstList_Shaktool_SawHand_PrimaryPiece


;;; $D9F2: Unused. Instruction list - Shaktool saw hand - attack - final piece ;;;
UNUSED_InstList_Shaktool_SawHand_Attack_FinalPiece_AAD9F2:
    dw Instruction_Common_WaitYFrames,$0240
    dw Instruction_Shaktool_ResetShaktoolFunctions
    dw Instruction_Common_GotoY
    dw InstList_Shaktool_SawHand_FinalPiece


;;; $D9FC: Instruction list - Shaktool saw hand - head bob - primary piece ;;;
InstList_Shaktool_SawHand_HeadBob_PrimaryPiece:
    dw Instruction_Common_WaitYFrames,$0014
    dw Instruction_Common_GotoY
    dw InstList_Shaktool_SawHand_PrimaryPiece


;;; $DA04: Instruction list - Shaktool saw hand - head bob - final piece ;;;
InstList_Shaktool_SawHand_HeadBob_FinalPiece:
    dw Instruction_Common_WaitYFrames,$0014
    dw Instruction_Shaktool_ResetShaktoolFunctions
    dw Instruction_Common_GotoY
    dw InstList_Shaktool_SawHand_FinalPiece


;;; $DA0E: Instruction list - Shaktool saw hand - primary piece ;;;
InstList_Shaktool_SawHand_PrimaryPiece:
; Also used for the final piece before the first collision
    dw $000A,Spritemaps_Shaktool_SawHand_PrimaryPiece_0
    dw $000A,Spritemaps_Shaktool_SawHand_PrimaryPiece_1
    dw $000A,Spritemaps_Shaktool_SawHand_PrimaryPiece_2
    dw Instruction_Common_GotoY
    dw InstList_Shaktool_SawHand_PrimaryPiece


;;; $DA1E: Instruction list - Shaktool saw hand - final piece ;;;
InstList_Shaktool_SawHand_FinalPiece:
    dw $0003,Spritemaps_Shaktool_SawHand_FinalPiece_0
    dw $0003,Spritemaps_Shaktool_SawHand_FinalPiece_1
    dw $0003,Spritemaps_Shaktool_SawHand_FinalPiece_2
    dw Instruction_Common_GotoY
    dw InstList_Shaktool_SawHand_FinalPiece


;;; $DA2E: Unused. Instruction list - Shaktool arm piece - attack - back ;;;
UNUSED_InstList_Shaktool_ArmPiece_Attack_Back_AADA2E:
    dw Instruction_Common_WaitYFrames,$00C0
    dw UNUSED_Instruction_Shaktool_Lower1PixelAwayFromProj_AAD931
    dw Instruction_Common_WaitYFrames,$0080
    dw UNUSED_Instruction_Shaktool_Raise1PixelTowardsProj_AAD93F
    dw Instruction_Common_WaitYFrames,$0100
    dw Instruction_Common_GotoY
    dw InstList_Shaktool_ArmPiece_Normal


;;; $DA42: Unused. Instruction list - Shaktool arm piece - attack - front ;;;
UNUSED_InstList_Shaktool_ArmPiece_Attack_Front_AADA42:
    dw Instruction_Common_WaitYFrames,$0100
    dw UNUSED_Instruction_Shaktool_Lower1PixelAwayFromProj_AAD931
    dw Instruction_Common_WaitYFrames,$0080
    dw UNUSED_Instruction_Shaktool_Raise1PixelTowardsProj_AAD93F
    dw Instruction_Common_WaitYFrames,$00C0
    dw Instruction_Common_GotoY
    dw InstList_Shaktool_ArmPiece_Normal


;;; $DA56: Instruction list - Shaktool arm piece - head bob - back ;;;
InstList_Shaktool_ArmPiece_HeadBob_Back:
    dw Instruction_Shaktool_Lower1Pixel
    dw Instruction_Common_WaitYFrames,$0014
    dw Instruction_Shaktool_Raise1Pixel
    dw Instruction_Common_GotoY
    dw InstList_Shaktool_ArmPiece_Normal


;;; $DA62: Instruction list - Shaktool arm piece - head bob - front ;;;
InstList_Shaktool_ArmPiece_HeadBob_Front:
    dw Instruction_Common_WaitYFrames,$0004
    dw Instruction_Shaktool_Lower1Pixel
    dw Instruction_Common_WaitYFrames,$000C
    dw Instruction_Shaktool_Raise1Pixel
    dw Instruction_Common_WaitYFrames,$0004


;;; $DA72: Instruction list - Shaktool arm piece - normal ;;;
InstList_Shaktool_ArmPiece_Normal:
    dw $0077,Spritemaps_Shaktool_ArmPiece
    dw Instruction_Common_GotoY
    dw InstList_Shaktool_ArmPiece_Normal


;;; $DA7A: Unused. Instruction list - Shaktool head - attack ;;;
UNUSED_InstList_Shaktool_Head_Attack_AADA7A:
    dw Instruction_Common_WaitYFrames,$0080
    dw UNUSED_Instruction_Shaktool_Lower1PixelAwayFromProj_AAD931
    dw RTL_AAD99F
    dw Instruction_Common_WaitYFrames,$0080
    dw UNUSED_Instruction_Shaktool_Raise1PixelTowardsProj_AAD93F
    dw Instruction_Common_WaitYFrames,$0140
    dw Instruction_Common_WaitYFrames,$0001


;;; $DA90: Instruction list - Shaktool head - head bob ;;;
InstList_Shaktool_Head_HeadBob:
    dw Instruction_Common_WaitYFrames,$0008
    dw Instruction_Shaktool_Lower1Pixel
    dw Instruction_Common_WaitYFrames,$0004
    dw Instruction_Shaktool_Raise1Pixel
    dw Instruction_Common_WaitYFrames,$0008
    dw Instruction_Common_WaitYFrames,$0001


;;; $DAA4: Instruction list - Shaktool head - aiming left ;;;
InstList_Shaktool_Head_AimingLeft:
; Useless observation: the graphical instruction delay is increasing by one for each of these instruction lists ^^;
    dw $0774,Spritemaps_Shaktool_Head_0
    dw Instruction_Common_GotoY
    dw InstList_Shaktool_Head_AimingLeft


;;; $DAAC: Instruction list - Shaktool head - aiming up-left ;;;
InstList_Shaktool_Head_AimingUpLeft:
    dw $0775,Spritemaps_Shaktool_Head_1
    dw Instruction_Common_GotoY
    dw InstList_Shaktool_Head_AimingUpLeft


;;; $DAB4: Instruction list - Shaktool head - aiming up ;;;
InstList_Shaktool_Head_AimingUp:
    dw $0776,Spritemaps_Shaktool_Head_2
    dw Instruction_Common_GotoY
    dw InstList_Shaktool_Head_AimingUp


;;; $DABC: Instruction list - Shaktool head - aiming up-right ;;;
InstList_Shaktool_Head_AimingUpRight:
    dw $0777,Spritemaps_Shaktool_Head_3
    dw Instruction_Common_GotoY
    dw InstList_Shaktool_Head_AimingUpRight


;;; $DAC4: Instruction list - Shaktool head - aiming right ;;;
InstList_Shaktool_Head_AimingRight:
    dw $0778,Spritemaps_Shaktool_Head_4
    dw Instruction_Common_GotoY
    dw InstList_Shaktool_Head_AimingRight


;;; $DACC: Instruction list - Shaktool head - aiming down-right ;;;
InstList_Shaktool_Head_AimingDownRight:
    dw $0779,Spritemaps_Shaktool_Head_5
    dw Instruction_Common_GotoY
    dw InstList_Shaktool_Head_AimingDownRight


;;; $DAD4: Instruction list - Shaktool head - aiming down ;;;
InstList_Shaktool_Head_AimingDown:
    dw $077A,Spritemaps_Shaktool_Head_6
    dw Instruction_Common_GotoY
    dw InstList_Shaktool_Head_AimingDown


;;; $DADC: Instruction list - Shaktool head - aiming down-left ;;;
InstList_Shaktool_Head_AimingDownLeft:
    dw $077B,Spritemaps_Shaktool_Head_7
    dw Instruction_Common_GotoY
    dw InstList_Shaktool_Head_AimingDownLeft


;;; $DAE4: RTS. Maybe make Shaktool attack ;;;
RTS_AADAE4:
; RTS'd out
    RTS

    JSL GenerateRandomNumber ; dead code
    BIT.W #$8431 : BNE .return
    LDY.W #$000C

  .loop:
    LDA.W #RTS_AADCAA : STA.W Shaktool.function,X
    LDA.W ShaktoolPieceData_unusedAttackInstListPointer,Y : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    TXA : SEC : SBC.W #$0040 : TAX
    DEY #2 : BPL .loop

  .return:
    RTS


;;; $DB0E: Shaktool pieces movement options = [A] ;;;
ShaktoolPiecesMovementOptionsInA:
    LDY.W Shaktool.primaryPieceEnemyIndex,X
    STA.W Shaktool.movementOptions,Y
    STA.W Enemy[1].init0,Y : STA.W Enemy[2].init0,Y
    STA.W Enemy[3].init0,Y : STA.W Enemy[4].init0,Y
    STA.W Enemy[5].init0,Y : STA.W Enemy[6].init0,Y
    RTS


;;; $DB27: Shaktool pieces facing angle = [A] ;;;
ShaktoolPiecesFacingAngleInA:
    LDY.W Shaktool.primaryPieceEnemyIndex,X
    STA.W Shaktool.facingAngle,Y
    STA.W Enemy[1].var0,Y : STA.W Enemy[2].var0,Y
    STA.W Enemy[3].var0,Y : STA.W Enemy[4].var0,Y
    STA.W Enemy[5].var0,Y : STA.W Enemy[6].var0,Y
    RTS


;;; $DB40: Shaktool pieces neighbour angle = [A] ;;;
ShaktoolPiecesNeighborAngleInA:
    LDY.W Shaktool.primaryPieceEnemyIndex,X
    STA.W Shaktool.neighborAngle,Y
    STA.W Enemy[1].var1,Y : STA.W Enemy[2].var1,Y
    STA.W Enemy[3].var1,Y : STA.W Enemy[4].var1,Y
    STA.W Enemy[5].var1,Y : STA.W Enemy[6].var1,Y
    RTS


;;; $DB59: Flip Shaktool ;;;
FlipShaktool:
    LDY.W Shaktool.primaryPieceEnemyIndex,X
    LDA.W Enemy[3].var3,Y : EOR.W #$8000 : STA.W Enemy[3].var3,Y
    LDX.W Enemy[6].var1,Y
    LDA.W Enemy[1].var1,Y : EOR.W #$8000 : AND.W #$FF00 : STA.W Enemy[6].var1,Y
    TXA : EOR.W #$8000 : AND.W #$FF00 : STA.W Enemy[1].var1,Y
    LDX.W Enemy[5].var1,Y
    LDA.W Enemy[2].var1,Y : EOR.W #$8000 : AND.W #$FF00 : STA.W Enemy[5].var1,Y
    TXA : EOR.W #$8000 : AND.W #$FF00 : STA.W Enemy[2].var1,Y
    LDX.W Enemy[4].var1,Y
    LDA.W Enemy[3].var1,Y : EOR.W #$8000 : AND.W #$FF00 : STA.W Enemy[4].var1,Y
    TXA : EOR.W #$8000 : AND.W #$FF00 : STA.W Enemy[3].var1,Y
    LDX.W Enemy[6].XSubPosition,Y
    LDA.W Enemy.XSubPosition,Y : STA.W Enemy[6].XSubPosition,Y
    TXA : STA.W Enemy.XSubPosition,Y
    LDX.W Enemy[6].YSubPosition,Y
    LDA.W Enemy.YSubPosition,Y : STA.W Enemy[6].YSubPosition,Y
    TXA : STA.W Enemy.YSubPosition,Y
    LDX.W Enemy[6].XPosition,Y
    LDA.W Enemy.XPosition,Y : STA.W Enemy[6].XPosition,Y
    TXA : STA.W Enemy.XPosition,Y
    LDX.W Enemy[6].YPosition,Y
    LDA.W Enemy.YPosition,Y : STA.W Enemy[6].YPosition,Y
    TXA : STA.W Enemy.YPosition,Y
    TYX
    LDA.W #$8000 : STA.W Enemy[1].XSubPosition,X : STA.W Enemy[2].XSubPosition,X
    STA.W Enemy[3].XSubPosition,X : STA.W Enemy[4].XSubPosition,X : STA.W Enemy[5].XSubPosition,X
    STA.W Enemy[1].YSubPosition,X : STA.W Enemy[2].YSubPosition,X
    STA.W Enemy[3].YSubPosition,X : STA.W Enemy[4].YSubPosition,X : STA.W Enemy[5].YSubPosition,X
    RTS


;;; $DC07: Set Shaktool piece neighbour angle delta due to block collision ;;;
SetShaktoolPieceNeighborAngleDeltaDueToBlockCollision:
    LDA.W #$0000 : SEC : BIT.W Shaktool.movementOptions,X : BMI .antiClockwise
    SBC.W Shaktool.neighborAngle,X : CLC : ADC.W Shaktool.facingAngle,X
    BRA +

  .antiClockwise:
    SBC.W Shaktool.facingAngle,X : CLC : ADC.W Shaktool.neighborAngle,X

+   XBA : AND.W #$00FF : ASL #2 : STA.W Shaktool.neighborAngleDelta,X
    RTS


;;; $DC2A: Position Shaktool piece relative to previous piece ;;;
PositionShaktoolPieceRelativeToPreviousPiece:
    LDA.W Enemy.var1+1,X : AND.W #$00FF : ASL : TAY
    STZ.B DP_Temp12 : STZ.B DP_Temp14
    LDA.W SineCosineTables_sine,Y : BPL +
    DEC.B DP_Temp14

+   STA.B DP_Temp13
    LDA.B DP_Temp12 : CLC : ADC.W Enemy[-1].XSubPosition,X : STA.W Enemy.XSubPosition,X
    LDA.B DP_Temp14 : ADC.W Enemy[-1].XPosition,X : STA.W Enemy.XPosition,X
    STZ.B DP_Temp12 : STZ.B DP_Temp14
    LDA.W SineCosineTables_negativeCosine,Y : BPL +
    DEC.B DP_Temp14

+   STA.B DP_Temp13
    LDA.B DP_Temp12 : CLC : ADC.W Enemy[-1].YSubPosition,X : STA.W Enemy.YSubPosition,X
    LDA.B DP_Temp14 : ADC.W Enemy[-1].YPosition,X : STA.W Enemy.YPosition,X
    RTS


;;; $DC6F: Set Shaktool pieces neighbour angle and angle delta for curling ;;;
SetShaktoolPiecesNeighborAngleAndAngleDeltaForCurling:
    LDA.W Shaktool.facingAngle,X
    JSR ShaktoolPiecesNeighborAngleInA
    LDY.W Shaktool.primaryPieceEnemyIndex,X
    LDA.W ShaktoolPieceData_initialCurlingNeighborAngleDelta : STA.W Shaktool.neighborAngleDelta,Y
    LDA.W ShaktoolPieceData_initialCurlingNeighborAngleDelta_rightArm : STA.W Enemy[1].var2,Y
    LDA.W ShaktoolPieceData_initialCurlingNeighborAngleDelta_centerRightArm : STA.W Enemy[2].var2,Y
    LDA.W ShaktoolPieceData_initialCurlingNeighborAngleDelta_head : STA.W Enemy[3].var2,Y
    LDA.W ShaktoolPieceData_initialCurlingNeighborAngleDelta_centerLeftArm : STA.W Enemy[4].var2,Y
    LDA.W ShaktoolPieceData_initialCurlingNeighborAngleDelta_leftArm : STA.W Enemy[5].var2,Y
    LDA.W ShaktoolPieceData_initialCurlingNeighborAngleDelta_leftSaw : STA.W Enemy[6].var2,Y
    RTS


;;; $DCA3: Main AI / hurt AI - enemy $F07F (Shaktool) ;;;
MainAI_HurtAI_Shaktool:
    LDX.W EnemyIndex
    JSR.W (Shaktool.function,X)
    RTL


;;; $DCAA: RTS ;;;
RTS_AADCAA:
    RTS


;;; $DCAB: RTS. Shaktool function - primary piece ;;;
RTS_AADCAB:
    RTS


;;; $DCAC: Shaktool function - arm piece. Set position and handle curling ;;;
Function_Shaktool_ArmPiece_SetPosition_HandleCurling:
    JSR PositionShaktoolPieceRelativeToPreviousPiece
    BIT.W Shaktool.movementOptions,X : BVC .notFullyCurled
    LDA.W #$0100 : CLC : ADC.W Shaktool.facingAngle,X : STA.W Shaktool.facingAngle,X
    LDA.W #$0100
    BRA +

  .notFullyCurled:
    LDA.W Shaktool.neighborAngleDelta,X

+   BIT.W Shaktool.movementOptions,X : BPL .clockwise
    EOR.W #$FFFF : INC

  .clockwise:
    CLC : ADC.W Shaktool.neighborAngle,X : STA.W Shaktool.neighborAngle,X
    RTS


;;; $DCD7: Shaktool function - head ;;;
Function_Shaktool_Head:
    JSR Function_Shaktool_ArmPiece_SetPosition_HandleCurling
    LDA.W Shaktool.neighborAngle,X : EOR.W #$8000 : STA.B DP_Temp12
    LDA.W Enemy[1].var1,X : SEC : SBC.B DP_Temp12
    LSR : CLC : ADC.B DP_Temp12
    BIT.W Shaktool.headDirection,X : BPL +
    EOR.W #$8000

+   XBA : CLC : ADC.W #$0008 : AND.W #$00E0
    SEP #$20
    STA.W Shaktool.headDirection,X
    REP #$20
    LSR #4 : TAY
    LDA.W .pointers,Y : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
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


;;; $DD25: Shaktool function - final piece ;;;
Function_Shaktool_FinalPiece:
    LDA.W Enemy.YPosition,X : PHA
    LDA.W Enemy.XPosition,X : PHA
    JSR Function_Shaktool_ArmPiece_SetPosition_HandleCurling
    LDA.W Enemy.YPosition,X : PHA
    LDA.W Enemy.XPosition,X : PHA
    LDA.B $05,S : STA.W Enemy.XPosition,X
    LDA.B $07,S : STA.W Enemy.YPosition,X
    STZ.B DP_Temp12
    LDA.B $01,S : SEC : SBC.B $05,S : STA.B DP_Temp14
    JSL MoveEnemyRightBy_14_12_IgnoreSlopes
    BCS .collision
    LDA.B $07,S : STA.W Enemy.YPosition,X
    STZ.B DP_Temp12
    LDA.B $03,S : SEC : SBC.B $07,S : STA.B DP_Temp14
    JSL MoveEnemyDownBy_14_12
    BCS .collision
    PLA : STA.W Enemy.XPosition,X
    PLA : STA.W Enemy.YPosition,X
    PLA : PLA
    BIT.W Shaktool.movementOptions,X : BVC .notFullyCurled
    LDA.W #$0100 : CLC : ADC.W Shaktool.facingAngle,X : STA.W Shaktool.facingAngle,X
    RTS

  .notFullyCurled:
    LDA.W Shaktool.neighborAngle,X : EOR.W Shaktool.facingAngle,X : AND.W #$FF00 : BNE +
    JSR SetShaktoolPiecesNeighborAngleAndAngleDeltaForCurling
    LDA.W #$7800 : STA.W Shaktool.finalPieceAngleCurled,X
    LDA.W Shaktool.movementOptions,X : AND.W #$DFFF
    JSR ShaktoolPiecesMovementOptionsInA
    LDA.W Shaktool.finalPieceAngleCurled,X : AND.W #$FF00 : STA.W Shaktool.finalPieceAngleCurled,X

+   LDA.W Shaktool.neighborAngleDelta,X : CLC : ADC.W Shaktool.finalPieceAngleCurled,X : STA.W Shaktool.finalPieceAngleCurled,X
    CMP.W #$F000 : BCC .return
    LDY.W Shaktool.primaryPieceEnemyIndex,X
    LDA.W Shaktool.movementOptions,X : ORA.W #$4000
    JSR ShaktoolPiecesMovementOptionsInA

  .return:
    JSR RTS_AADAE4
    RTS

  .collision:
    LDA.W Shaktool.movementOptions,X : BIT.W #$2000 : BEQ .curling
    PLA : PLA : PLA : PLA
    LDA.W Shaktool.movementOptions,X : EOR.W #$8000 : AND.W #$8FFF
    JSR ShaktoolPiecesMovementOptionsInA
    BRA +

  .curling:
    PLA : PLA
    PLA : STA.W Enemy.XPosition,X
    PLA : STA.W Enemy.YPosition,X
    JSR FlipShaktool
    LDX.W EnemyIndex
    LDA.W Shaktool.movementOptions,X : ORA.W #$2000
    JSR ShaktoolPiecesMovementOptionsInA
    LDA.W Shaktool.movementOptions,X : AND.W #$BFFF
    JSR ShaktoolPiecesMovementOptionsInA

+   STZ.W Shaktool.finalPieceAngleCurled,X
    LDY.W Shaktool.primaryPieceEnemyIndex,X
    JSL CalculateAngleOfEnemyYFromEnemyX
    XBA : AND.W #$FF00 : BIT.W Shaktool.movementOptions,X : BMI .antiClockwise
    CLC : ADC.W #$4000
    BRA +

  .antiClockwise:
    SEC : SBC.W #$4000

+   JSR ShaktoolPiecesFacingAngleInA
    LDY.W #$000C

  .loop:
    JSR SetShaktoolPieceNeighborAngleDeltaDueToBlockCollision
    LDA.W #RTS_AADCAA : STA.W Shaktool.function,X
    LDA.W ShaktoolPieceData_headBobInstListPointer,Y : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    TXA : SEC : SBC.W #$0040 : TAX
    DEY #2 : BPL .loop
    RTS


;;; $DE43: Initialisation AI - enemy $F07F (Shaktool) ;;;
InitAI_Shaktool:
; Parameter 2 is used for piece index (multiple of 2). Range 0..Ch
; Index identifies pieces starting from the initial rightmost piece and increasing to the initial leftmost piece
    LDX.W EnemyIndex
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    LDA.W #$0000 : STA.W Shaktool.facingAngle,X : STA.W Shaktool.headDirection,X
    LDY.W Enemy.init1,X
    LDA.W Enemy.properties,X : ORA.W ShaktoolPieceData_properties,Y : STA.W Enemy.properties,X
    TXA : SEC : SBC.W ShaktoolPieceData_RAMOffset,Y : STA.W Shaktool.primaryPieceEnemyIndex,X
    LDA.W ShaktoolPieceData_functionPointer,Y : STA.W Shaktool.function,X
    LDA.W ShaktoolPieceData_initialCurlingNeighborAngleDelta,Y : SEC : SBC.W ShaktoolPieceData_zero,Y : STA.W Shaktool.neighborAngleDelta,X
    LDA.W ShaktoolPieceData_initialNeighborAngle,Y : STA.W Shaktool.neighborAngle,X
    LDA.W ShaktoolPieceData_initialInstListPointer,Y : STA.W Enemy.instList,X
    LDA.W ShaktoolPieceData_layerControl,Y : STA.W Enemy.layer,X
    TYA : BEQ .return
    JSR PositionShaktoolPieceRelativeToPreviousPiece

  .return:
    RTL


;;; $DE95: Shaktool piece data ;;;
ShaktoolPieceData:
;        _______________________________________ Initially right saw hand (primary piece)
;       |      _________________________________ Initially rightmost arm piece
;       |     |      ___________________________ Initially center right arm piece
;       |     |     |      _____________________ Head
;       |     |     |     |      _______________ Initially center left arm piece
;       |     |     |     |     |      _________ Initially leftmost arm piece
;       |     |     |     |     |     |      ___ Initially left saw hand (final piece)
;       |     |     |     |     |     |     |
  .properties:
    dw $2800,$2C00,$2C00,$2C00,$2C00,$2C00,$2800
  .RAMOffset:
    dw $0000,$0040,$0080,$00C0,$0100,$0140,$0180
  .initialNeighborAngle:
    dw $0000,$F800,$E800,$D000,$B000,$9800,$8800
  .initialInstListPointer:
    dw InstList_Shaktool_SawHand_PrimaryPiece ; Initially right saw hand (primary piece)
    dw InstList_Shaktool_ArmPiece_Normal ; Initially rightmost arm piece
    dw InstList_Shaktool_ArmPiece_Normal ; Initially center right arm piece
    dw InstList_Shaktool_Head_AimingDown ; Head
    dw InstList_Shaktool_ArmPiece_Normal ; Initially center left arm piece
    dw InstList_Shaktool_ArmPiece_Normal ; Initially leftmost arm piece
    dw InstList_Shaktool_SawHand_PrimaryPiece ; Initially left saw hand (final piece)
  .layerControl:
    dw $0002,$0004,$0004,$0002,$0004,$0004,$0002
  .functionPointer:
    dw RTS_AADCAB
  .functionPointer_rightArm:
    dw Function_Shaktool_ArmPiece_SetPosition_HandleCurling
  .functionPointer_centerRightArm:
    dw Function_Shaktool_ArmPiece_SetPosition_HandleCurling
  .functionPointer_head:
    dw Function_Shaktool_Head
  .functionPointer_centerLeftArm:
    dw Function_Shaktool_ArmPiece_SetPosition_HandleCurling
  .functionPointer_leftArm:
    dw Function_Shaktool_ArmPiece_SetPosition_HandleCurling
  .functionPointer_leftSaw:
    dw Function_Shaktool_FinalPiece
  .initialCurlingNeighborAngleDelta:
    dw $0000
  .initialCurlingNeighborAngleDelta_rightArm:
    dw $0020
  .initialCurlingNeighborAngleDelta_centerRightArm:
    dw $0060
  .initialCurlingNeighborAngleDelta_head:
    dw $00C0
  .initialCurlingNeighborAngleDelta_centerLeftArm:
    dw $0140
  .initialCurlingNeighborAngleDelta_leftArm:
    dw $01A0
  .initialCurlingNeighborAngleDelta_leftSaw:
    dw $01E0
  .zero:
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000

if !FEATURE_KEEP_UNREFERENCED
  .unused:
    dw $0000,$0000,$0002,$0004,$0006,$0008,$000A
endif ; !FEATURE_KEEP_UNREFERENCED

  .headBobInstListPointer:
    dw InstList_Shaktool_SawHand_HeadBob_PrimaryPiece ; Initially right saw hand (primary piece)
    dw InstList_Shaktool_ArmPiece_HeadBob_Back ; Initially rightmost arm piece
    dw InstList_Shaktool_ArmPiece_HeadBob_Front ; Initially center right arm piece
    dw InstList_Shaktool_Head_HeadBob ; Head
    dw InstList_Shaktool_ArmPiece_HeadBob_Front ; Initially center left arm piece
    dw InstList_Shaktool_ArmPiece_HeadBob_Back ; Initially leftmost arm piece
    dw InstList_Shaktool_SawHand_HeadBob_FinalPiece ; Initially left saw hand (final piece)
  .unusedAttackInstListPointer:
    dw UNUSED_InstList_Shaktool_SawHand_Attack_PrimaryPiece_AAD9EA ; Initially right saw hand (primary piece)
    dw UNUSED_InstList_Shaktool_ArmPiece_Attack_Back_AADA2E ; Initially rightmost arm piece
    dw UNUSED_InstList_Shaktool_ArmPiece_Attack_Front_AADA42 ; Initially center right arm piece
    dw UNUSED_InstList_Shaktool_Head_Attack_AADA7A ; Head
    dw UNUSED_InstList_Shaktool_ArmPiece_Attack_Front_AADA42 ; Initially center left arm piece
    dw UNUSED_InstList_Shaktool_ArmPiece_Attack_Back_AADA2E ; Initially leftmost arm piece
    dw UNUSED_InstList_Shaktool_SawHand_Attack_FinalPiece_AAD9F2 ; Initially left saw hand (final piece)


;;; $DF2F: Enemy touch - enemy $F07F (Shaktool) ;;;
EnemyTouch_Shaktool:
    JSL NormalEnemyTouchAI
    RTL


;;; $DF34: Enemy shot - enemy $F07F (Shaktool) ;;;
EnemyShot_Shaktool:
; Bug: when an enemy dies and goes through its death animation, its enemy RAM is cleared,
; so the LDY always loads 0, meaning this only works out if Shaktool is the first enemy in the room
    JSL NormalEnemyShotAI
    LDX.W EnemyIndex
    LDA.W Enemy.health,X : BNE .return
    LDY.W Shaktool.primaryPieceEnemyIndex,X
    LDA.W #$0200 : STA.W Enemy.properties,Y
    STA.W Enemy[1].properties,Y : STA.W Enemy[2].properties,Y
    STA.W Enemy[3].properties,Y : STA.W Enemy[4].properties,Y
    STA.W Enemy[5].properties,Y : STA.W Enemy[6].properties,Y

  .return:
    RTL


;;; $DF5C: Spritemaps - Shaktool ;;;
Spritemaps_Shaktool_SawHand_FinalPiece_0:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $100)

Spritemaps_Shaktool_SawHand_FinalPiece_1:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $102)

Spritemaps_Shaktool_SawHand_FinalPiece_2:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $104)

Spritemaps_Shaktool_ArmPiece:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $106)

Spritemaps_Shaktool_Head_0:
    dw $0004
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $108)
    %spritemapEntry(0, $01, $F6, 0, 0, 2, 0, $11F)
    %spritemapEntry(0, $01, $02, 0, 0, 2, 0, $11F)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 0, $10E)

Spritemaps_Shaktool_Head_1:
    dw $0004
    %spritemapEntry(0, $1F4, $F4, 0, 0, 2, 0, $10F)
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $10C)
    %spritemapEntry(0, $04, $FC, 0, 0, 2, 0, $11F)
    %spritemapEntry(0, $1FC, $04, 0, 0, 2, 0, $11F)

Spritemaps_Shaktool_Head_2:
    dw $0004
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $10A)
    %spritemapEntry(0, $02, $01, 0, 0, 2, 0, $11F)
    %spritemapEntry(0, $1F6, $01, 0, 0, 2, 0, $11F)
    %spritemapEntry(0, $1FC, $F0, 0, 0, 2, 0, $11E)

Spritemaps_Shaktool_Head_3:
    dw $0004
    %spritemapEntry(0, $04, $F4, 0, 1, 2, 0, $10F)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $10C)
    %spritemapEntry(0, $1FC, $04, 0, 0, 2, 0, $11F)
    %spritemapEntry(0, $1F4, $FC, 0, 0, 2, 0, $11F)

Spritemaps_Shaktool_Head_4:
    dw $0004
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $108)
    %spritemapEntry(0, $1F7, $02, 0, 0, 2, 0, $11F)
    %spritemapEntry(0, $1F7, $F6, 0, 0, 2, 0, $11F)
    %spritemapEntry(0, $08, $FC, 0, 1, 2, 0, $10E)

Spritemaps_Shaktool_Head_5:
    dw $0004
    %spritemapEntry(0, $04, $04, 1, 1, 2, 0, $10F)
    %spritemapEntry(1, $1F8, $F8, 1, 0, 2, 0, $10C)
    %spritemapEntry(0, $1F4, $FC, 0, 0, 2, 0, $11F)
    %spritemapEntry(0, $1FC, $F4, 0, 0, 2, 0, $11F)

Spritemaps_Shaktool_Head_6:
    dw $0004
    %spritemapEntry(1, $1F8, $F8, 1, 0, 2, 0, $10A)
    %spritemapEntry(0, $02, $F7, 0, 0, 2, 0, $11F)
    %spritemapEntry(0, $1F6, $F7, 0, 0, 2, 0, $11F)
    %spritemapEntry(0, $1FC, $08, 1, 0, 2, 0, $11E)

Spritemaps_Shaktool_Head_7:
    dw $0004
    %spritemapEntry(0, $1F4, $04, 1, 0, 2, 0, $10F)
    %spritemapEntry(1, $1F8, $F8, 1, 1, 2, 0, $10C)
    %spritemapEntry(0, $04, $FC, 0, 0, 2, 0, $11F)
    %spritemapEntry(0, $1FC, $F4, 0, 0, 2, 0, $11F)

Spritemaps_Shaktool_SawHand_PrimaryPiece_0:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $100)

Spritemaps_Shaktool_SawHand_PrimaryPiece_1:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $102)

Spritemaps_Shaktool_SawHand_PrimaryPiece_2:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $104)


;;; $E03D: Sine/cosine tables ;;;
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


;;; $E2BD: n00b tube cracks palettes ;;;
; Wow, three copies of the same palette
Palette_NoobTubeCrack_Initial:
; Sprite palette 7
    dw $3800,$7F9C,$7F17,$6E72,$59EE,$456A,$3528,$28E6
    dw $777F,$66FB,$5676,$45F2,$358D,$2509,$1484,$0400

Palette_NoobTubeCrack_SpritePalette1:
    dw $3800,$7F9C,$7F17,$6E72,$59EE,$456A,$3528,$28E6
    dw $777F,$66FB,$5676,$45F2,$358D,$2509,$1484,$0400

Palette_NoobTubeCrack_SpritePalette2:
    dw $3800,$7F9C,$7F17,$6E72,$59EE,$456A,$3528,$28E6
    dw $777F,$66FB,$5676,$45F2,$358D,$2509,$1484,$0400


;;; $E31D: Chozo statue palettes ;;;
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


;;; $E39D: Instruction list - chozo statue - Lower Norfair - initial ;;;
InstList_Chozo_LowerNorfair_Initial:
    dw Instruction_Common_Enemy0FB2_InY
    dw Function_Chozo_LowerNorfair
    dw $0001,Spritemaps_Chozo_13
    dw Instruction_Common_Sleep


;;; $E3A7: Instruction list - chozo statue - Lower Norfair - activated ;;;
InstList_Chozo_LowerNorfair_Activated_0:
    dw Instruction_Common_SetEnemy0FB2ToRTS
    dw Instruction_Chozo_Movement_IndexInY,$0020
    dw $0020,Spritemaps_Chozo_13
    dw Instruction_Chozo_Movement_IndexInY,$0022
    dw $0008,Spritemaps_Chozo_14
    dw Instruction_Chozo_Movement_IndexInY,$0024
    dw $0030,Spritemaps_Chozo_15
    dw Instruction_Chozo_PlayChozoGrabsSamusSFX
    dw Instruction_Chozo_Movement_IndexInY,$0026
    dw $0040,Spritemaps_Chozo_16
    dw $0006,Spritemaps_Chozo_1F
    dw $0008,Spritemaps_Chozo_20
    dw $000A,Spritemaps_Chozo_21
    dw $000C,Spritemaps_Chozo_22
    dw $0060,Spritemaps_Chozo_23
    dw Instruction_Chozo_StartLoweringAcid
    dw Instruction_Common_TimerInY,$0005

InstList_Chozo_LowerNorfair_Activated_1:
    dw $000B,Spritemaps_Chozo_20
    dw $0008,Spritemaps_Chozo_21
    dw $0006,Spritemaps_Chozo_22
    dw $0008,Spritemaps_Chozo_23
    dw $0006,Spritemaps_Chozo_22
    dw $0008,Spritemaps_Chozo_21
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate
    dw InstList_Chozo_LowerNorfair_Activated_1
    dw Instruction_Common_SetEnemy0FB2ToRTS
    dw Instruction_Chozo_Movement_IndexInY,$0026
    dw $0080,Spritemaps_Chozo_16
    dw Instruction_Chozo_Movement_IndexInY,$0024
    dw $0050,Spritemaps_Chozo_15
    dw Instruction_Chozo_Movement_IndexInY,$0022
    dw $0008,Spritemaps_Chozo_14
    dw Instruction_Chozo_Movement_IndexInY,$0020
    dw $0020,Spritemaps_Chozo_13
    dw Instruction_Chozo_UnlockSamus
    dw Instruction_Chozo_SetLoweredAcidPosition
    dw Instruction_Common_Sleep


;;; $E429: Instruction - start lowering acid ;;;
Instruction_Chozo_StartLoweringAcid:
    LDA.W #$0020 : STA.W FX_Timer
    LDA.W #$0040 : STA.W FX_YSubVelocity
    RTL


;;; $E436: Instruction - set lowered acid position ;;;
Instruction_Chozo_SetLoweredAcidPosition:
    LDA.W #$02D2 : STA.W FX_BaseYPosition
    RTL


;;; $E43D: Instruction - unlock Samus ;;;
Instruction_Chozo_UnlockSamus:
    LDA.W #$0001
    JSL Run_Samus_Command
    RTL


;;; $E445: Chozo statue function - Lower Norfair ;;;
Function_Chozo_LowerNorfair:
    LDA.W Chozo.activationFlag,X : BEQ .return
    LDA.W #InstList_Chozo_LowerNorfair_Activated_0 : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X

  .return:
    RTS


;;; $E457: Instruction list - chozo statue - Wrecked Ship - initial ;;;
InstList_Chozo_WreckedShip_Initial:
    dw Instruction_Common_Enemy0FB2_InY
    dw Function_Chozo_WreckedShip
    dw $0001,Spritemaps_Chozo_0
    dw Instruction_Common_Sleep


;;; $E461: Instruction list - chozo statue - Wrecked Ship - activated ;;;
InstList_Chozo_WreckedShip_Activated_0:
    dw Instruction_Common_SetEnemy0FB2ToRTS
    dw Instruction_Chozo_Movement_IndexInY,$0000
    dw $0020,Spritemaps_Chozo_0
    dw Instruction_Chozo_Movement_IndexInY,$0002
    dw $0008,Spritemaps_Chozo_1
    dw Instruction_Chozo_Movement_IndexInY,$0004
    dw $0050,Spritemaps_Chozo_2
    dw Instruction_Chozo_PlayChozoGrabsSamusSFX
    dw Instruction_Chozo_Movement_IndexInY,$0006
    dw $0080,Spritemaps_Chozo_3
    dw $0006,Spritemaps_Chozo_C
    dw $0008,Spritemaps_Chozo_D
    dw $000A,Spritemaps_Chozo_E
    dw $000C,Spritemaps_Chozo_F
    dw $0080,Spritemaps_Chozo_10
    dw Instruction_Common_TimerInY,$0004

InstList_Chozo_WreckedShip_Activated_1:
    dw $000B,Spritemaps_Chozo_D
    dw $0008,Spritemaps_Chozo_E
    dw $0006,Spritemaps_Chozo_F
    dw $0008,Spritemaps_Chozo_10
    dw $0006,Spritemaps_Chozo_F
    dw $0008,Spritemaps_Chozo_E
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate
    dw InstList_Chozo_WreckedShip_Activated_1
    dw Instruction_Common_Enemy0FB2_InY
    dw RTS_AAE7DA
    dw Instruction_Common_TimerInY,$0010

InstList_Chozo_WreckedShip_Activated_2:
    dw Instruction_Chozo_Movement_IndexInY,$0016
    dw Instruction_Chozo_SpawnChozoSpikeClearingFootstepProjectile,$FFF8
    dw $0008,Spritemaps_Chozo_B
    dw Instruction_Chozo_PlayChozoFootstepsSFX
    dw Instruction_Chozo_Movement_IndexInY,$0008
    dw Instruction_Chozo_SpawnChozoSpikeClearingFootstepProjectile,$FFEC
    dw $000B,Spritemaps_Chozo_4
    dw Instruction_Chozo_Movement_IndexInY,$000A
    dw Instruction_Chozo_SpawnChozoSpikeClearingFootstepProjectile,$FFF0
    dw $0008,Spritemaps_Chozo_5
    dw Instruction_Chozo_Movement_IndexInY,$000C
    dw Instruction_Chozo_SpawnChozoSpikeClearingFootstepProjectile,$0000
    dw $0006,Spritemaps_Chozo_6
    dw Instruction_Chozo_Movement_IndexInY,$000E
    dw Instruction_Chozo_SpawnChozoSpikeClearingFootstepProjectile,$FFF8
    dw $0008,Spritemaps_Chozo_7
    dw Instruction_Chozo_PlayChozoFootstepsSFX
    dw Instruction_Chozo_Movement_IndexInY,$0010
    dw Instruction_Chozo_SpawnChozoSpikeClearingFootstepProjectile,$FFEC
    dw $000B,Spritemaps_Chozo_8
    dw Instruction_Chozo_Movement_IndexInY,$0012
    dw Instruction_Chozo_SpawnChozoSpikeClearingFootstepProjectile,$FFF0
    dw $0008,Spritemaps_Chozo_9
    dw Instruction_Chozo_Movement_IndexInY,$0014
    dw Instruction_Chozo_SpawnChozoSpikeClearingFootstepProjectile,$0000
    dw $0006,Spritemaps_Chozo_A
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate
    dw InstList_Chozo_WreckedShip_Activated_2
    dw Instruction_Chozo_Movement_IndexInY,$0016
    dw Instruction_Chozo_SpawnChozoSpikeClearingFootstepProjectile,$FFF8
    dw $0008,Spritemaps_Chozo_B
    dw Instruction_Chozo_Movement_IndexInY,$0008
    dw Instruction_Chozo_SpawnChozoSpikeClearingFootstepProjectile,$FFEC
    dw $000B,Spritemaps_Chozo_4
    dw Instruction_Chozo_Movement_IndexInY,$000A
    dw Instruction_Chozo_SpawnChozoSpikeClearingFootstepProjectile,$FFF0
    dw $0008,Spritemaps_Chozo_5
    dw Instruction_Chozo_Movement_IndexInY,$000C
    dw Instruction_Chozo_SpawnChozoSpikeClearingFootstepProjectile,$0000
    dw $0006,Spritemaps_Chozo_6
    dw Instruction_Common_SetEnemy0FB2ToRTS
    dw Instruction_Chozo_Movement_IndexInY,$0006
    dw $0080,Spritemaps_Chozo_3
    dw Instruction_Chozo_Movement_IndexInY,$0004
    dw $0050,Spritemaps_Chozo_2
    dw Instruction_Chozo_Movement_IndexInY,$0002
    dw $0008,Spritemaps_Chozo_1
    dw Instruction_Chozo_Movement_IndexInY,$0000
    dw $0020,Spritemaps_Chozo_0
    dw Instruction_Chozo_ReleaseSamus_BlockSlopeAccess
    dw Instruction_Common_Sleep


;;; $E57F: Instruction - queue chozo grabs Samus sound effect ;;;
Instruction_Chozo_PlayChozoGrabsSamusSFX:
    LDA.W #$001C
    JSL QueueSound_Lib2_Max6
    RTL


;;; $E587: Instruction - queue chozo footsteps sound effect ;;;
Instruction_Chozo_PlayChozoFootstepsSFX:
    LDA.W #$004B
    JSL QueueSound_Lib2_Max6
    RTL


;;; $E58F: Instruction - spawn chozo spike clearing footstep enemy projectile with X offset [[Y]] ;;;
Instruction_Chozo_SpawnChozoSpikeClearingFootstepProjectile:
    PHX : PHY
    LDA.W Enemy.XPosition,X : CLC : ADC.W $0000,Y : PHA
    LDA.W Enemy.YPosition,X : CLC : ADC.W #$001C : PHA
    JSL CalculateTheBlockContainingAPixelPosition
    LDA.W CurrentBlockIndex : CLC : ADC.W RoomWidthBlocks : ASL : TAX
    LDA.L LevelData,X : AND.W #$F000 : CMP.W #$A000 : BNE .return
    TXA : SEC : SBC.W RoomWidthBlocks : TAX
    LDA.W #PLMEntries_CrumbleLowerNorfairChozoRoomPlug
    JSL Spawn_PLM_to_CurrentBlockIndex
    PLY : PHY
    LDA.W $0000,Y
    LDY.W #EnemyProjectile_WreckedShipChozoSpikeClearingFootsteps
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics

  .return:
    PLY : PLX
    INY #2
    RTL


;;; $E5D8: Instruction - chozo statue movement - index [[Y]] ;;;
Instruction_Chozo_Movement_IndexInY:
    LDA.W $0000,Y : STA.W Chozo.movementIndex,X
    PHY
    STZ.B DP_Temp12 : STZ.B DP_Temp14
    LDY.W Chozo.movementIndex,X
    LDA.W .XVelocity,Y : BPL +
    DEC.B DP_Temp14

+   STA.B DP_Temp13
    JSL MoveEnemyRightBy_14_12_IgnoreSlopes
    BCS .goingNowhere ; >_<

  .goingNowhere:
    STZ.B DP_Temp12 : STZ.B DP_Temp14
    LDY.W Chozo.movementIndex,X
    LDA.W .XVelocity,Y : BPL +
    EOR.W #$FFFF : INC

+   BPL +
    DEC.B DP_Temp14

+   STA.B DP_Temp13
    JSL MoveEnemyDownBy_14_12
    BCS .move

  .move:
    JSL AlignEnemyYPositionWIthNonSquareSlope
    LDY.W Chozo.movementIndex,X
    LDA.W Enemy.XPosition,X : CLC : ADC.W .XOffsets,Y : STA.W SamusXPosition
    LDA.W Enemy.YPosition,X : CLC : ADC.W .YOffsets,Y : STA.W SamusYPosition
    PLY
    INY #2
    RTL

  .XVelocity:
; Enemy X velocity. Unit 1/100h px/frame. Absolute value used for Y velocity
    dw $0000,$0000,$0000,$0000,$FE00,$FD00,$F200,$F800 ; 0..1Eh: Wrecked Ship. Only 0..16h used
    dw $FE00,$FD00,$F200,$F800,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0200,$0300,$0E00,$0800 ; 20h..3Eh: Lower Norfair. Only 0..6h used
    dw $0200,$0300,$0E00,$0800,$0000,$0000,$0000,$0000

  .XOffsets:
; Samus X offsets from enemy
    dw $FFE4,$FFE2,$FFE0,$FFE0,$FFE0,$FFE0,$FFE0,$FFE0 ; 0..1Eh: Wrecked Ship. Only 0..16h used
    dw $FFE0,$FFE0,$FFE0,$FFE0,$FFE0,$FFE0,$FFE0,$FFE0
    dw $001C,$001E,$0020,$0020,$0020,$0020,$0020,$0020 ; 20h..3Eh: Lower Norfair. Only 0..6h used
    dw $0020,$0020,$0020,$0020,$0020,$0020,$0020,$0020

  .YOffsets:
; Samus Y offsets from enemy
    dw $FFE0,$FFE7,$FFE9,$FFE9,$FFE9,$FFE8,$FFE7,$FFE8 ; 0..1Eh: Wrecked Ship. Only 0..16h used
    dw $FFE9,$FFE8,$FFE7,$FFE8,$FFE9,$FFE9,$FFE9,$FFE9
    dw $FFE0,$FFE7,$FFE9,$FFE9,$FFE9,$FFE8,$FFE7,$FFE8 ; 20h..3Eh: Lower Norfair. Only 0..6h used
    dw $FFE9,$FFE8,$FFE7,$FFE8,$FFE9,$FFE9,$FFE9,$FFE9


;;; $E6F0: Instruction - release Samus and block slope access ;;;
Instruction_Chozo_ReleaseSamus_BlockSlopeAccess:
    LDA.W #$0001
    JSL Run_Samus_Command
    LDA.W #$0000 : STA.L Scrolls+6
    STA.L Scrolls+8 : STA.L Scrolls+9
    LDA.W #$0001 : STA.L Scrolls+$D
    JSL Spawn_Hardcoded_PLM
    db $17,$1D
    dw PLMEntries_BlockSlopeAccessForWreckedShipChozo
    RTL


;;; $E716: Initialisation AI - enemy $F0BF (n00b tube cracks) ;;;
InitAI_NoobTubeCrack:
    LDX.W #$003E

  .loop:
    LDA.W Palette_NoobTubeCrack_SpritePalette1,X : STA.L TargetPalettes_SpriteP1,X
    DEX #2 : BPL .loop
    RTL


;;; $E725: Initialisation AI - enemy $F0FF (chozo statue) ;;;
InitAI_Chozo:
    LDX.W EnemyIndex
    LDA.W Enemy.properties,X : ORA.W #$A800 : STA.W Enemy.properties,X
    LDA.W #Spritemap_Common_Nothing : STA.W Enemy.spritemap,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    LDA.W #RTS_AAE7A6 : STA.W Chozo.function,X
    LDA.W #$0000 : STA.W Chozo.activationFlag,X
    STZ.W Enemy.palette,X : STZ.W Enemy.layer
    LDY.W Enemy.init1,X
    LDA.W .instListPointers,Y : STA.W Enemy.instList,X
    TYA : BNE .lowerNorfair
    LDX.W #$001E

  .loopWreckedShip:
    LDA.W Palette_Chozo_WreckedShip_SpritePalette2,X : STA.L TargetPalettes_SpriteP2,X
    LDA.W Palette_Chozo_WreckedShip_SpritePalette1,X : STA.L TargetPalettes_SpriteP1,X
    DEX #2 : BPL .loopWreckedShip
    JSL Spawn_Hardcoded_PLM
    db $4A,$17
    dw PLMEntries_WreckedShipChozoHand
    JSL Spawn_Hardcoded_PLM
    db $17,$1D
    dw PLMEntries_BlockSlopeAccessForWreckedShipChozo
    RTL

  .lowerNorfair:
    LDX.W #$001E

  .loop:
    LDA.W Palette_Chozo_LowerNorfair_SpritePalette2,X : STA.L TargetPalettes_SpriteP2,X
    LDA.W Palette_Chozo_LowerNorfair_SpritePalette1,X : STA.L TargetPalettes_SpriteP1,X
    DEX #2 : BPL .loop
    JSL Spawn_Hardcoded_PLM
    db $0C,$1D
    dw PLMEntries_LowerNorfairChozoHand
    RTL

  .instListPointers:
; Enemy instruction list pointers
    dw InstList_Chozo_WreckedShip_Initial
    dw InstList_Chozo_LowerNorfair_Initial


;;; $E7A6: RTS ;;;
RTS_AAE7A6:
    RTS


;;; $E7A7: Main AI - enemy $F0FF (chozo statue) ;;;
MainAI_Chozo:
    LDX.W EnemyIndex
    JSR.W (Chozo.function,X)
    RTL


;;; $E7AE: Chozo statue function - Wrecked Ship ;;;
Function_Chozo_WreckedShip:
    PHX
    LDX.W AreaIndex
    LDA.L SRAMMirror_Boss,X
    PLX
    AND.W #$0001 : BEQ .return
    LDA.W Chozo.activationFlag,X : BEQ .return
    LDA.W #InstList_Chozo_WreckedShip_Activated_0 : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDA.W #$FF00 : STA.W Enemy.var0,X
    LDA.W #$0100 : STA.W Enemy.var1,X

  .return:
    RTS


;;; $E7DA: RTS ;;;
RTS_AAE7DA:
    RTS


;;; $E7DB: RTL. Enemy touch - enemy $F0FF (chozo statue) ;;;
RTL_AAE7DB:
    RTL


;;; $E7DC: RTL. Enemy shot - enemy $F0FF (chozo statue) ;;;
RTL_AAE7DC:
    RTL


;;; $E7DD: Chozo statue spritemaps ;;;
Spritemaps_Chozo_0:
    dw $0012
    %spritemapEntry(0, $1FA, $DF, 0, 0, 2, 1, $17D)
    %spritemapEntry(1, $43D6, $E7, 0, 0, 2, 1, $120)
    %spritemapEntry(0, $1E6, $E7, 0, 0, 2, 1, $10F)
    %spritemapEntry(1, $43E6, $EF, 0, 0, 2, 1, $122)
    %spritemapEntry(1, $43ED, $EC, 0, 0, 2, 1, $10D)
    %spritemapEntry(1, $43F5, $E4, 0, 0, 2, 1, $10B)
    %spritemapEntry(1, $43F2, $1F, 0, 0, 2, 1, $170)
    %spritemapEntry(1, $43FA, $1F, 0, 0, 2, 1, $171)
    %spritemapEntry(1, $43FA, $0D, 0, 0, 2, 1, $14C)
    %spritemapEntry(1, $43FA, $15, 0, 0, 2, 1, $15C)
    %spritemapEntry(1, $43F9, $05, 0, 0, 2, 1, $150)
    %spritemapEntry(1, $43F9, $FD, 0, 0, 2, 1, $140)
    %spritemapEntry(1, $43F4, $F7, 0, 0, 2, 1, $108)
    %spritemapEntry(1, $43FC, $F7, 0, 0, 2, 1, $109)
    %spritemapEntry(1, $43FC, $E7, 0, 0, 2, 1, $106)
    %spritemapEntry(1, $43EC, $E7, 0, 0, 2, 1, $104)
    %spritemapEntry(1, $43FC, $D7, 0, 0, 2, 1, $102)
    %spritemapEntry(1, $43EC, $D7, 0, 0, 2, 1, $100)

Spritemaps_Chozo_1:
    dw $0011
    %spritemapEntry(0, $1FA, $DF, 0, 0, 2, 1, $17D)
    %spritemapEntry(1, $43E9, $ED, 0, 0, 2, 1, $12A)
    %spritemapEntry(1, $43D9, $ED, 0, 0, 2, 1, $128)
    %spritemapEntry(1, $43ED, $EC, 0, 0, 2, 1, $10D)
    %spritemapEntry(1, $43F5, $E4, 0, 0, 2, 1, $10B)
    %spritemapEntry(1, $43F2, $1F, 0, 0, 2, 1, $170)
    %spritemapEntry(1, $43FA, $1F, 0, 0, 2, 1, $171)
    %spritemapEntry(1, $43FA, $0D, 0, 0, 2, 1, $14C)
    %spritemapEntry(1, $43FA, $15, 0, 0, 2, 1, $15C)
    %spritemapEntry(1, $43F9, $05, 0, 0, 2, 1, $150)
    %spritemapEntry(1, $43F9, $FD, 0, 0, 2, 1, $140)
    %spritemapEntry(1, $43F4, $F7, 0, 0, 2, 1, $108)
    %spritemapEntry(1, $43FC, $F7, 0, 0, 2, 1, $109)
    %spritemapEntry(1, $43FC, $E7, 0, 0, 2, 1, $106)
    %spritemapEntry(1, $43EC, $E7, 0, 0, 2, 1, $104)
    %spritemapEntry(1, $43FC, $D7, 0, 0, 2, 1, $102)
    %spritemapEntry(1, $43EC, $D7, 0, 0, 2, 1, $100)

Spritemaps_Chozo_2:
    dw $0011
    %spritemapEntry(1, $43E8, $ED, 0, 0, 2, 1, $126)
    %spritemapEntry(1, $43D8, $ED, 0, 0, 2, 1, $124)
    %spritemapEntry(0, $1FA, $DF, 0, 0, 2, 1, $17D)
    %spritemapEntry(1, $43ED, $EC, 0, 0, 2, 1, $10D)
    %spritemapEntry(1, $43F5, $E4, 0, 0, 2, 1, $10B)
    %spritemapEntry(1, $43F2, $1F, 0, 0, 2, 1, $170)
    %spritemapEntry(1, $43FA, $1F, 0, 0, 2, 1, $171)
    %spritemapEntry(1, $43FA, $0D, 0, 0, 2, 1, $14C)
    %spritemapEntry(1, $43FA, $15, 0, 0, 2, 1, $15C)
    %spritemapEntry(1, $43F9, $05, 0, 0, 2, 1, $150)
    %spritemapEntry(1, $43F9, $FD, 0, 0, 2, 1, $140)
    %spritemapEntry(1, $43F4, $F7, 0, 0, 2, 1, $108)
    %spritemapEntry(1, $43FC, $F7, 0, 0, 2, 1, $109)
    %spritemapEntry(1, $43FC, $E7, 0, 0, 2, 1, $106)
    %spritemapEntry(1, $43EC, $E7, 0, 0, 2, 1, $104)
    %spritemapEntry(1, $43FC, $D7, 0, 0, 2, 1, $102)
    %spritemapEntry(1, $43EC, $D7, 0, 0, 2, 1, $100)

Spritemaps_Chozo_3:
    dw $0012
    %spritemapEntry(1, $43E8, $ED, 0, 0, 2, 1, $126)
    %spritemapEntry(1, $43D8, $E9, 0, 0, 2, 1, $12C)
    %spritemapEntry(0, $1E0, $F9, 0, 0, 2, 1, $11F)
    %spritemapEntry(0, $1FA, $DF, 0, 0, 2, 1, $17D)
    %spritemapEntry(1, $43ED, $EC, 0, 0, 2, 1, $10D)
    %spritemapEntry(1, $43F5, $E4, 0, 0, 2, 1, $10B)
    %spritemapEntry(1, $43F2, $1F, 0, 0, 2, 1, $170)
    %spritemapEntry(1, $43FA, $1F, 0, 0, 2, 1, $171)
    %spritemapEntry(1, $43FA, $0D, 0, 0, 2, 1, $14C)
    %spritemapEntry(1, $43FA, $15, 0, 0, 2, 1, $15C)
    %spritemapEntry(1, $43F9, $05, 0, 0, 2, 1, $150)
    %spritemapEntry(1, $43F9, $FD, 0, 0, 2, 1, $140)
    %spritemapEntry(1, $43F4, $F7, 0, 0, 2, 1, $108)
    %spritemapEntry(1, $43FC, $F7, 0, 0, 2, 1, $109)
    %spritemapEntry(1, $43FC, $E7, 0, 0, 2, 1, $106)
    %spritemapEntry(1, $43EC, $E7, 0, 0, 2, 1, $104)
    %spritemapEntry(1, $43FC, $D7, 0, 0, 2, 1, $102)
    %spritemapEntry(1, $43EC, $D7, 0, 0, 2, 1, $100)

Spritemaps_Chozo_4:
    dw $0015
    %spritemapEntry(0, $1E0, $F9, 0, 0, 2, 1, $11F)
    %spritemapEntry(1, $43E8, $ED, 0, 0, 2, 1, $126)
    %spritemapEntry(0, $1FA, $DF, 0, 0, 2, 1, $179)
    %spritemapEntry(1, $43E9, $1B, 0, 0, 2, 1, $171)
    %spritemapEntry(1, $43E1, $1B, 0, 0, 2, 1, $170)
    %spritemapEntry(1, $43EE, $10, 0, 0, 2, 1, $158)
    %spritemapEntry(1, $43EE, $08, 0, 0, 2, 1, $148)
    %spritemapEntry(1, $43F4, $FD, 0, 0, 2, 1, $144)
    %spritemapEntry(1, $43F4, $F7, 0, 0, 2, 1, $108)
    %spritemapEntry(1, $43FC, $F7, 0, 0, 2, 1, $109)
    %spritemapEntry(1, $4210, $15, 0, 0, 2, 2, $175)
    %spritemapEntry(1, $4204, $09, 0, 0, 2, 2, $14E)
    %spritemapEntry(1, $43FB, $FD, 0, 1, 2, 2, $142)
    %spritemapEntry(1, $43FB, $05, 0, 1, 2, 2, $152)
    %spritemapEntry(1, $43D8, $E9, 0, 0, 2, 1, $12C)
    %spritemapEntry(1, $43ED, $EC, 0, 0, 2, 1, $10D)
    %spritemapEntry(1, $43F5, $E4, 0, 0, 2, 1, $10B)
    %spritemapEntry(1, $43FC, $E7, 0, 0, 2, 1, $106)
    %spritemapEntry(1, $43EC, $E7, 0, 0, 2, 1, $104)
    %spritemapEntry(1, $43FC, $D7, 0, 0, 2, 1, $102)
    %spritemapEntry(1, $43EC, $D7, 0, 0, 2, 1, $100)

Spritemaps_Chozo_5:
    dw $0016
    %spritemapEntry(0, $1E0, $F8, 0, 0, 2, 1, $11F)
    %spritemapEntry(1, $43E8, $EC, 0, 0, 2, 1, $126)
    %spritemapEntry(0, $1FA, $DE, 0, 0, 2, 1, $17A)
    %spritemapEntry(1, $43EC, $1C, 0, 0, 2, 1, $171)
    %spritemapEntry(1, $43E4, $1C, 0, 0, 2, 1, $170)
    %spritemapEntry(1, $43F1, $11, 0, 0, 2, 1, $158)
    %spritemapEntry(1, $43F1, $09, 0, 0, 2, 1, $148)
    %spritemapEntry(1, $43F7, $04, 0, 0, 2, 1, $152)
    %spritemapEntry(1, $43F7, $FC, 0, 0, 2, 1, $142)
    %spritemapEntry(1, $43F4, $F6, 0, 0, 2, 1, $108)
    %spritemapEntry(1, $43FC, $F6, 0, 0, 2, 1, $109)
    %spritemapEntry(1, $4209, $16, 0, 0, 2, 2, $175)
    %spritemapEntry(1, $43FC, $09, 0, 0, 2, 2, $14E)
    %spritemapEntry(1, $43F9, $04, 0, 0, 2, 2, $150)
    %spritemapEntry(1, $43F9, $FC, 0, 0, 2, 2, $140)
    %spritemapEntry(1, $43D8, $E8, 0, 0, 2, 1, $12C)
    %spritemapEntry(1, $43ED, $EB, 0, 0, 2, 1, $10D)
    %spritemapEntry(1, $43F5, $E3, 0, 0, 2, 1, $10B)
    %spritemapEntry(1, $43FC, $E6, 0, 0, 2, 1, $106)
    %spritemapEntry(1, $43EC, $E6, 0, 0, 2, 1, $104)
    %spritemapEntry(1, $43FC, $D6, 0, 0, 2, 1, $102)
    %spritemapEntry(1, $43EC, $D6, 0, 0, 2, 1, $100)

Spritemaps_Chozo_6:
    dw $0016
    %spritemapEntry(1, $43E8, $EB, 0, 0, 2, 1, $126)
    %spritemapEntry(0, $1E0, $F7, 0, 0, 2, 1, $11F)
    %spritemapEntry(0, $1FA, $DD, 0, 0, 2, 1, $17B)
    %spritemapEntry(1, $43FA, $1E, 0, 0, 2, 1, $171)
    %spritemapEntry(1, $43F2, $1E, 0, 0, 2, 1, $170)
    %spritemapEntry(1, $43FA, $13, 0, 0, 2, 1, $15C)
    %spritemapEntry(1, $43FA, $0B, 0, 0, 2, 1, $14C)
    %spritemapEntry(1, $43FD, $17, 0, 0, 2, 2, $173)
    %spritemapEntry(1, $43F9, $03, 0, 0, 2, 1, $150)
    %spritemapEntry(1, $43F9, $FB, 0, 0, 2, 1, $140)
    %spritemapEntry(1, $43FA, $08, 0, 0, 2, 2, $14E)
    %spritemapEntry(1, $43F4, $F5, 0, 0, 2, 1, $108)
    %spritemapEntry(1, $43FC, $F5, 0, 0, 2, 1, $109)
    %spritemapEntry(1, $43F7, $03, 0, 0, 2, 2, $152)
    %spritemapEntry(1, $43F7, $FB, 0, 0, 2, 2, $142)
    %spritemapEntry(1, $43D8, $E7, 0, 0, 2, 1, $12C)
    %spritemapEntry(1, $43ED, $EA, 0, 0, 2, 1, $10D)
    %spritemapEntry(1, $43F5, $E2, 0, 0, 2, 1, $10B)
    %spritemapEntry(1, $43FC, $E5, 0, 0, 2, 1, $106)
    %spritemapEntry(1, $43EC, $E5, 0, 0, 2, 1, $104)
    %spritemapEntry(1, $43FC, $D5, 0, 0, 2, 1, $102)
    %spritemapEntry(1, $43EC, $D5, 0, 0, 2, 1, $100)

Spritemaps_Chozo_7:
    dw $0016
    %spritemapEntry(0, $1E0, $F8, 0, 0, 2, 1, $11F)
    %spritemapEntry(1, $43E8, $EC, 0, 0, 2, 1, $126)
    %spritemapEntry(0, $1FA, $DE, 0, 0, 2, 1, $17C)
    %spritemapEntry(1, $4201, $1D, 0, 0, 2, 1, $171)
    %spritemapEntry(1, $43F9, $1D, 0, 0, 2, 1, $170)
    %spritemapEntry(1, $4201, $12, 0, 0, 2, 1, $156)
    %spritemapEntry(1, $4201, $0A, 0, 0, 2, 1, $146)
    %spritemapEntry(1, $43FB, $04, 0, 1, 2, 1, $152)
    %spritemapEntry(1, $43FB, $FC, 0, 1, 2, 1, $142)
    %spritemapEntry(1, $43F2, $1B, 0, 0, 2, 2, $173)
    %spritemapEntry(1, $43F3, $10, 0, 0, 2, 2, $156)
    %spritemapEntry(1, $43F3, $08, 0, 0, 2, 2, $146)
    %spritemapEntry(1, $43F4, $F6, 0, 0, 2, 1, $108)
    %spritemapEntry(1, $43FC, $F6, 0, 0, 2, 1, $109)
    %spritemapEntry(1, $43F4, $FC, 0, 0, 2, 2, $144)
    %spritemapEntry(1, $43D8, $E8, 0, 0, 2, 1, $12C)
    %spritemapEntry(1, $43ED, $EB, 0, 0, 2, 1, $10D)
    %spritemapEntry(1, $43F5, $E3, 0, 0, 2, 1, $10B)
    %spritemapEntry(1, $43FC, $E6, 0, 0, 2, 1, $106)
    %spritemapEntry(1, $43EC, $E6, 0, 0, 2, 1, $104)
    %spritemapEntry(1, $43FC, $D6, 0, 0, 2, 1, $102)
    %spritemapEntry(1, $43EC, $D6, 0, 0, 2, 1, $100)

Spritemaps_Chozo_8:
    dw $0015
    %spritemapEntry(1, $43E8, $ED, 0, 0, 2, 1, $126)
    %spritemapEntry(0, $1E0, $F9, 0, 0, 2, 1, $11F)
    %spritemapEntry(0, $1FA, $DF, 0, 0, 2, 1, $179)
    %spritemapEntry(1, $4210, $15, 0, 0, 2, 1, $175)
    %spritemapEntry(1, $4204, $09, 0, 0, 2, 1, $14E)
    %spritemapEntry(1, $43FB, $05, 0, 1, 2, 1, $152)
    %spritemapEntry(1, $43FB, $FD, 0, 1, 2, 1, $142)
    %spritemapEntry(1, $43F4, $F7, 0, 0, 2, 1, $108)
    %spritemapEntry(1, $43FC, $F7, 0, 0, 2, 1, $109)
    %spritemapEntry(1, $43E1, $1B, 0, 0, 2, 2, $170)
    %spritemapEntry(1, $43E9, $1B, 0, 0, 2, 2, $171)
    %spritemapEntry(1, $43EE, $10, 0, 0, 2, 2, $158)
    %spritemapEntry(1, $43EE, $08, 0, 0, 2, 2, $148)
    %spritemapEntry(1, $43F4, $FD, 0, 0, 2, 2, $144)
    %spritemapEntry(1, $43D8, $E9, 0, 0, 2, 1, $12C)
    %spritemapEntry(1, $43ED, $EC, 0, 0, 2, 1, $10D)
    %spritemapEntry(1, $43F5, $E4, 0, 0, 2, 1, $10B)
    %spritemapEntry(1, $43FC, $E7, 0, 0, 2, 1, $106)
    %spritemapEntry(1, $43EC, $E7, 0, 0, 2, 1, $104)
    %spritemapEntry(1, $43FC, $D7, 0, 0, 2, 1, $102)
    %spritemapEntry(1, $43EC, $D7, 0, 0, 2, 1, $100)

Spritemaps_Chozo_9:
    dw $0016
    %spritemapEntry(0, $1E0, $F8, 0, 0, 2, 1, $11F)
    %spritemapEntry(1, $43E8, $EC, 0, 0, 2, 1, $126)
    %spritemapEntry(0, $1FA, $DE, 0, 0, 2, 1, $17A)
    %spritemapEntry(1, $4209, $16, 0, 0, 2, 1, $175)
    %spritemapEntry(1, $43FC, $09, 0, 0, 2, 1, $14E)
    %spritemapEntry(1, $43F9, $04, 0, 0, 2, 1, $150)
    %spritemapEntry(1, $43F9, $FC, 0, 0, 2, 1, $140)
    %spritemapEntry(1, $43D8, $E8, 0, 0, 2, 1, $12C)
    %spritemapEntry(1, $43F5, $E3, 0, 0, 2, 1, $10B)
    %spritemapEntry(1, $43ED, $EB, 0, 0, 2, 1, $10D)
    %spritemapEntry(1, $43F4, $F6, 0, 0, 2, 1, $108)
    %spritemapEntry(1, $43FC, $F6, 0, 0, 2, 1, $109)
    %spritemapEntry(1, $43FC, $E6, 0, 0, 2, 1, $106)
    %spritemapEntry(1, $43EC, $E6, 0, 0, 2, 1, $104)
    %spritemapEntry(1, $43FC, $D6, 0, 0, 2, 1, $102)
    %spritemapEntry(1, $43EC, $D6, 0, 0, 2, 1, $100)
    %spritemapEntry(1, $43E4, $1C, 0, 0, 2, 2, $170)
    %spritemapEntry(1, $43EC, $1C, 0, 0, 2, 2, $171)
    %spritemapEntry(1, $43F1, $11, 0, 0, 2, 2, $158)
    %spritemapEntry(1, $43F1, $09, 0, 0, 2, 2, $148)
    %spritemapEntry(1, $43F7, $04, 0, 0, 2, 2, $152)
    %spritemapEntry(1, $43F7, $FC, 0, 0, 2, 2, $142)

Spritemaps_Chozo_A:
    dw $0016
    %spritemapEntry(1, $43E8, $EB, 0, 0, 2, 1, $126)
    %spritemapEntry(0, $1E0, $F7, 0, 0, 2, 1, $11F)
    %spritemapEntry(0, $1FA, $DD, 0, 0, 2, 1, $17B)
    %spritemapEntry(1, $43FD, $17, 0, 0, 2, 1, $173)
    %spritemapEntry(1, $43FA, $08, 0, 0, 2, 1, $14E)
    %spritemapEntry(1, $43F7, $03, 0, 0, 2, 1, $152)
    %spritemapEntry(1, $43F7, $FB, 0, 0, 2, 1, $142)
    %spritemapEntry(1, $43F2, $1E, 0, 0, 2, 2, $170)
    %spritemapEntry(1, $43FA, $1E, 0, 0, 2, 2, $171)
    %spritemapEntry(1, $43FA, $13, 0, 0, 2, 2, $15C)
    %spritemapEntry(1, $43FA, $0B, 0, 0, 2, 2, $14C)
    %spritemapEntry(1, $43F9, $03, 0, 0, 2, 2, $150)
    %spritemapEntry(1, $43F9, $FB, 0, 0, 2, 2, $140)
    %spritemapEntry(1, $43D8, $E7, 0, 0, 2, 1, $12C)
    %spritemapEntry(1, $43ED, $EA, 0, 0, 2, 1, $10D)
    %spritemapEntry(1, $43F5, $E2, 0, 0, 2, 1, $10B)
    %spritemapEntry(1, $43F4, $F5, 0, 0, 2, 1, $108)
    %spritemapEntry(1, $43FC, $F5, 0, 0, 2, 1, $109)
    %spritemapEntry(1, $43FC, $E5, 0, 0, 2, 1, $106)
    %spritemapEntry(1, $43EC, $E5, 0, 0, 2, 1, $104)
    %spritemapEntry(1, $43FC, $D5, 0, 0, 2, 1, $102)
    %spritemapEntry(1, $43EC, $D5, 0, 0, 2, 1, $100)

Spritemaps_Chozo_B:
    dw $0016
    %spritemapEntry(0, $1E0, $F8, 0, 0, 2, 1, $11F)
    %spritemapEntry(1, $43E8, $EC, 0, 0, 2, 1, $126)
    %spritemapEntry(0, $1FA, $DE, 0, 0, 2, 1, $17C)
    %spritemapEntry(1, $43F2, $1B, 0, 0, 2, 1, $173)
    %spritemapEntry(1, $43F3, $10, 0, 0, 2, 1, $156)
    %spritemapEntry(1, $43F3, $08, 0, 0, 2, 1, $146)
    %spritemapEntry(1, $43F4, $FC, 0, 0, 2, 1, $144)
    %spritemapEntry(1, $43F9, $1D, 0, 0, 2, 2, $170)
    %spritemapEntry(1, $4201, $1D, 0, 0, 2, 2, $171)
    %spritemapEntry(1, $4201, $12, 0, 0, 2, 2, $156)
    %spritemapEntry(1, $4201, $0A, 0, 0, 2, 2, $146)
    %spritemapEntry(1, $43F4, $F6, 0, 0, 2, 1, $108)
    %spritemapEntry(1, $43FC, $F6, 0, 0, 2, 1, $109)
    %spritemapEntry(1, $43FB, $FC, 0, 1, 2, 2, $142)
    %spritemapEntry(1, $43FB, $04, 0, 1, 2, 2, $152)
    %spritemapEntry(1, $43D8, $E8, 0, 0, 2, 1, $12C)
    %spritemapEntry(1, $43ED, $EB, 0, 0, 2, 1, $10D)
    %spritemapEntry(1, $43F5, $E3, 0, 0, 2, 1, $10B)
    %spritemapEntry(1, $43FC, $E6, 0, 0, 2, 1, $106)
    %spritemapEntry(1, $43EC, $E6, 0, 0, 2, 1, $104)
    %spritemapEntry(1, $43FC, $D6, 0, 0, 2, 1, $102)
    %spritemapEntry(1, $43EC, $D6, 0, 0, 2, 1, $100)

Spritemaps_Chozo_C:
    dw $0012
    %spritemapEntry(1, $43E8, $ED, 0, 0, 2, 1, $126)
    %spritemapEntry(0, $1E0, $F9, 0, 0, 2, 1, $11F)
    %spritemapEntry(0, $1FA, $DF, 0, 0, 2, 1, $17D)
    %spritemapEntry(1, $43D8, $E9, 0, 0, 2, 1, $12C)
    %spritemapEntry(1, $43ED, $EC, 0, 0, 2, 1, $10D)
    %spritemapEntry(1, $43F5, $E4, 0, 0, 2, 1, $10B)
    %spritemapEntry(1, $43F2, $1F, 0, 0, 2, 1, $170)
    %spritemapEntry(1, $43FA, $1F, 0, 0, 2, 1, $171)
    %spritemapEntry(1, $43FA, $0D, 0, 0, 2, 1, $14C)
    %spritemapEntry(1, $43FA, $15, 0, 0, 2, 1, $15C)
    %spritemapEntry(1, $43F9, $05, 0, 0, 2, 1, $150)
    %spritemapEntry(1, $43F9, $FD, 0, 0, 2, 1, $140)
    %spritemapEntry(1, $43F4, $F7, 0, 0, 2, 1, $108)
    %spritemapEntry(1, $43FC, $F7, 0, 0, 2, 1, $109)
    %spritemapEntry(1, $43FC, $E7, 0, 0, 2, 1, $106)
    %spritemapEntry(1, $43EC, $E7, 0, 0, 2, 1, $104)
    %spritemapEntry(1, $43FC, $D7, 0, 0, 2, 1, $102)
    %spritemapEntry(1, $43EC, $D7, 0, 0, 2, 1, $100)

Spritemaps_Chozo_D:
    dw $0012
    %spritemapEntry(0, $1E0, $F9, 0, 0, 2, 1, $11F)
    %spritemapEntry(1, $43E8, $ED, 0, 0, 2, 1, $126)
    %spritemapEntry(0, $1FA, $DF, 0, 0, 2, 1, $17C)
    %spritemapEntry(1, $43D8, $E9, 0, 0, 2, 1, $12C)
    %spritemapEntry(1, $43ED, $EC, 0, 0, 2, 1, $10D)
    %spritemapEntry(1, $43F5, $E4, 0, 0, 2, 1, $10B)
    %spritemapEntry(1, $43F2, $1F, 0, 0, 2, 1, $170)
    %spritemapEntry(1, $43FA, $1F, 0, 0, 2, 1, $171)
    %spritemapEntry(1, $43FA, $0D, 0, 0, 2, 1, $14C)
    %spritemapEntry(1, $43FA, $15, 0, 0, 2, 1, $15C)
    %spritemapEntry(1, $43F9, $05, 0, 0, 2, 1, $150)
    %spritemapEntry(1, $43F9, $FD, 0, 0, 2, 1, $140)
    %spritemapEntry(1, $43F4, $F7, 0, 0, 2, 1, $108)
    %spritemapEntry(1, $43FC, $F7, 0, 0, 2, 1, $109)
    %spritemapEntry(1, $43FC, $E7, 0, 0, 2, 1, $106)
    %spritemapEntry(1, $43EC, $E7, 0, 0, 2, 1, $104)
    %spritemapEntry(1, $43FC, $D7, 0, 0, 2, 1, $102)
    %spritemapEntry(1, $43EC, $D7, 0, 0, 2, 1, $100)

Spritemaps_Chozo_E:
    dw $0012
    %spritemapEntry(1, $43D8, $E9, 0, 0, 2, 1, $12C)
    %spritemapEntry(1, $43E8, $ED, 0, 0, 2, 1, $126)
    %spritemapEntry(0, $1E0, $F9, 0, 0, 2, 1, $11F)
    %spritemapEntry(0, $1FA, $DF, 0, 0, 2, 1, $17B)
    %spritemapEntry(1, $43ED, $EC, 0, 0, 2, 1, $10D)
    %spritemapEntry(1, $43F5, $E4, 0, 0, 2, 1, $10B)
    %spritemapEntry(1, $43F2, $1F, 0, 0, 2, 1, $170)
    %spritemapEntry(1, $43FA, $1F, 0, 0, 2, 1, $171)
    %spritemapEntry(1, $43FA, $0D, 0, 0, 2, 1, $14C)
    %spritemapEntry(1, $43FA, $15, 0, 0, 2, 1, $15C)
    %spritemapEntry(1, $43F9, $05, 0, 0, 2, 1, $150)
    %spritemapEntry(1, $43F9, $FD, 0, 0, 2, 1, $140)
    %spritemapEntry(1, $43F4, $F7, 0, 0, 2, 1, $108)
    %spritemapEntry(1, $43FC, $F7, 0, 0, 2, 1, $109)
    %spritemapEntry(1, $43FC, $E7, 0, 0, 2, 1, $106)
    %spritemapEntry(1, $43EC, $E7, 0, 0, 2, 1, $104)
    %spritemapEntry(1, $43FC, $D7, 0, 0, 2, 1, $102)
    %spritemapEntry(1, $43EC, $D7, 0, 0, 2, 1, $100)

Spritemaps_Chozo_F:
    dw $0012
    %spritemapEntry(0, $1E0, $F9, 0, 0, 2, 1, $11F)
    %spritemapEntry(1, $43E8, $ED, 0, 0, 2, 1, $126)
    %spritemapEntry(0, $1FA, $DF, 0, 0, 2, 1, $17A)
    %spritemapEntry(1, $43D8, $E9, 0, 0, 2, 1, $12C)
    %spritemapEntry(1, $43ED, $EC, 0, 0, 2, 1, $10D)
    %spritemapEntry(1, $43F5, $E4, 0, 0, 2, 1, $10B)
    %spritemapEntry(1, $43F2, $1F, 0, 0, 2, 1, $170)
    %spritemapEntry(1, $43FA, $1F, 0, 0, 2, 1, $171)
    %spritemapEntry(1, $43FA, $0D, 0, 0, 2, 1, $14C)
    %spritemapEntry(1, $43FA, $15, 0, 0, 2, 1, $15C)
    %spritemapEntry(1, $43F9, $05, 0, 0, 2, 1, $150)
    %spritemapEntry(1, $43F9, $FD, 0, 0, 2, 1, $140)
    %spritemapEntry(1, $43F4, $F7, 0, 0, 2, 1, $108)
    %spritemapEntry(1, $43FC, $F7, 0, 0, 2, 1, $109)
    %spritemapEntry(1, $43FC, $E7, 0, 0, 2, 1, $106)
    %spritemapEntry(1, $43EC, $E7, 0, 0, 2, 1, $104)
    %spritemapEntry(1, $43FC, $D7, 0, 0, 2, 1, $102)
    %spritemapEntry(1, $43EC, $D7, 0, 0, 2, 1, $100)

Spritemaps_Chozo_10:
    dw $0012
    %spritemapEntry(1, $43D8, $E9, 0, 0, 2, 1, $12C)
    %spritemapEntry(0, $1E0, $F9, 0, 0, 2, 1, $11F)
    %spritemapEntry(1, $43E8, $ED, 0, 0, 2, 1, $126)
    %spritemapEntry(0, $1FA, $DF, 0, 0, 2, 1, $179)
    %spritemapEntry(1, $43ED, $EC, 0, 0, 2, 1, $10D)
    %spritemapEntry(1, $43F5, $E4, 0, 0, 2, 1, $10B)
    %spritemapEntry(1, $43F2, $1F, 0, 0, 2, 1, $170)
    %spritemapEntry(1, $43FA, $1F, 0, 0, 2, 1, $171)
    %spritemapEntry(1, $43FA, $0D, 0, 0, 2, 1, $14C)
    %spritemapEntry(1, $43FA, $15, 0, 0, 2, 1, $15C)
    %spritemapEntry(1, $43F9, $05, 0, 0, 2, 1, $150)
    %spritemapEntry(1, $43F9, $FD, 0, 0, 2, 1, $140)
    %spritemapEntry(1, $43F4, $F7, 0, 0, 2, 1, $108)
    %spritemapEntry(1, $43FC, $F7, 0, 0, 2, 1, $109)
    %spritemapEntry(1, $43FC, $E7, 0, 0, 2, 1, $106)
    %spritemapEntry(1, $43EC, $E7, 0, 0, 2, 1, $104)
    %spritemapEntry(1, $43FC, $D7, 0, 0, 2, 1, $102)
    %spritemapEntry(1, $43EC, $D7, 0, 0, 2, 1, $100)

Spritemaps_Chozo_11:
    dw $002A
    %spritemapEntry(1, $43E0, $98, 0, 0, 2, 1, $144)
    %spritemapEntry(1, $4242, $98, 0, 0, 2, 1, $14A)
    %spritemapEntry(1, $4232, $A0, 0, 0, 2, 1, $158)
    %spritemapEntry(1, $4232, $98, 0, 0, 2, 1, $148)
    %spritemapEntry(1, $4222, $A0, 0, 0, 2, 1, $15C)
    %spritemapEntry(1, $4222, $98, 0, 0, 2, 1, $14C)
    %spritemapEntry(1, $4202, $98, 0, 0, 2, 1, $14E)
    %spritemapEntry(1, $4212, $A0, 0, 0, 2, 1, $156)
    %spritemapEntry(1, $4212, $98, 0, 0, 2, 1, $146)
    %spritemapEntry(1, $4201, $B8, 0, 0, 2, 2, $14E)
    %spritemapEntry(1, $4211, $C0, 0, 0, 2, 2, $156)
    %spritemapEntry(1, $4211, $B8, 0, 0, 2, 2, $146)
    %spritemapEntry(1, $4241, $B8, 0, 0, 2, 2, $14A)
    %spritemapEntry(1, $4231, $C0, 0, 0, 2, 2, $158)
    %spritemapEntry(1, $4231, $B8, 0, 0, 2, 2, $148)
    %spritemapEntry(1, $4221, $C0, 0, 0, 2, 2, $15C)
    %spritemapEntry(1, $4221, $B8, 0, 0, 2, 2, $14C)
    %spritemapEntry(1, $43D8, $F0, 0, 0, 2, 2, $177)
    %spritemapEntry(1, $43C8, $F0, 0, 0, 2, 2, $175)
    %spritemapEntry(1, $43B8, $F0, 0, 0, 2, 2, $173)
    %spritemapEntry(1, $43A0, $F0, 0, 0, 2, 2, $170)
    %spritemapEntry(1, $43A8, $F0, 0, 0, 2, 2, $171)
    %spritemapEntry(1, $43D8, $E0, 0, 0, 2, 1, $177)
    %spritemapEntry(1, $43C8, $E0, 0, 0, 2, 1, $175)
    %spritemapEntry(1, $43B8, $E0, 0, 0, 2, 1, $173)
    %spritemapEntry(1, $43A8, $E0, 0, 0, 2, 1, $171)
    %spritemapEntry(1, $43A0, $E0, 0, 0, 2, 1, $170)
    %spritemapEntry(1, $43D0, $A0, 0, 0, 2, 1, $152)
    %spritemapEntry(1, $43D0, $98, 0, 0, 2, 1, $142)
    %spritemapEntry(1, $43B0, $A0, 0, 1, 2, 1, $152)
    %spritemapEntry(1, $43B0, $98, 0, 1, 2, 1, $142)
    %spritemapEntry(1, $43C0, $A0, 0, 0, 2, 1, $150)
    %spritemapEntry(1, $43C0, $98, 0, 0, 2, 1, $140)
    %spritemapEntry(1, $43A0, $98, 0, 1, 2, 1, $144)
    %spritemapEntry(1, $43A1, $B8, 0, 1, 2, 2, $144)
    %spritemapEntry(1, $43B0, $B8, 0, 1, 2, 2, $142)
    %spritemapEntry(1, $43B0, $C0, 0, 1, 2, 2, $152)
    %spritemapEntry(1, $43D0, $C0, 0, 0, 2, 2, $152)
    %spritemapEntry(1, $43C0, $C0, 0, 0, 2, 2, $150)
    %spritemapEntry(1, $43E0, $B8, 0, 0, 2, 2, $144)
    %spritemapEntry(1, $43D0, $B8, 0, 0, 2, 2, $142)
    %spritemapEntry(1, $43C0, $B8, 0, 0, 2, 2, $140)

Spritemaps_Chozo_12:
    dw $0019
    %spritemapEntry(1, $4238, $88, 0, 0, 2, 1, $10D)
    %spritemapEntry(1, $4240, $80, 0, 0, 2, 1, $10B)
    %spritemapEntry(0, $3E, $EF, 0, 0, 2, 1, $139)
    %spritemapEntry(1, $4236, $DF, 0, 0, 2, 1, $12C)
    %spritemapEntry(1, $4246, $E7, 0, 0, 2, 1, $12A)
    %spritemapEntry(1, $4220, $DB, 0, 0, 2, 1, $12A)
    %spritemapEntry(1, $4210, $DB, 0, 0, 2, 1, $128)
    %spritemapEntry(1, $4245, $C8, 0, 0, 2, 1, $126)
    %spritemapEntry(0, $45, $C0, 0, 0, 2, 1, $11F)
    %spritemapEntry(1, $4235, $C0, 0, 0, 2, 1, $124)
    %spritemapEntry(1, $4211, $C0, 0, 0, 2, 1, $120)
    %spritemapEntry(0, $21, $C0, 0, 0, 2, 1, $10F)
    %spritemapEntry(1, $4221, $C8, 0, 0, 2, 1, $122)
    %spritemapEntry(1, $43B7, $BD, 0, 0, 2, 1, $14C)
    %spritemapEntry(1, $43B7, $C5, 0, 0, 2, 1, $15C)
    %spritemapEntry(1, $4399, $D7, 0, 0, 2, 1, $150)
    %spritemapEntry(1, $4399, $CF, 0, 0, 2, 1, $140)
    %spritemapEntry(1, $43DA, $CA, 0, 0, 2, 1, $170)
    %spritemapEntry(1, $43E2, $CA, 0, 0, 2, 1, $171)
    %spritemapEntry(1, $43F1, $A8, 0, 0, 2, 1, $108)
    %spritemapEntry(1, $43F9, $A8, 0, 0, 2, 1, $109)
    %spritemapEntry(1, $43F9, $98, 0, 0, 2, 1, $106)
    %spritemapEntry(1, $43E9, $98, 0, 0, 2, 1, $104)
    %spritemapEntry(1, $43F9, $88, 0, 0, 2, 1, $102)
    %spritemapEntry(1, $43E9, $88, 0, 0, 2, 1, $100)

Spritemaps_Chozo_13:
    dw $0012
    %spritemapEntry(0, $1FE, $DF, 0, 1, 2, 1, $17D)
    %spritemapEntry(1, $421A, $E7, 0, 1, 2, 1, $120)
    %spritemapEntry(0, $12, $E7, 0, 1, 2, 1, $10F)
    %spritemapEntry(1, $420A, $EF, 0, 1, 2, 1, $122)
    %spritemapEntry(1, $4203, $EC, 0, 1, 2, 1, $10D)
    %spritemapEntry(1, $43FB, $E4, 0, 1, 2, 1, $10B)
    %spritemapEntry(1, $43FE, $1F, 0, 1, 2, 1, $170)
    %spritemapEntry(1, $43F6, $1F, 0, 1, 2, 1, $171)
    %spritemapEntry(1, $43F6, $0D, 0, 1, 2, 1, $14C)
    %spritemapEntry(1, $43F6, $15, 0, 1, 2, 1, $15C)
    %spritemapEntry(1, $43F7, $05, 0, 1, 2, 1, $150)
    %spritemapEntry(1, $43F7, $FD, 0, 1, 2, 1, $140)
    %spritemapEntry(1, $43FC, $F7, 0, 1, 2, 1, $108)
    %spritemapEntry(1, $43F4, $F7, 0, 1, 2, 1, $109)
    %spritemapEntry(1, $43F4, $E7, 0, 1, 2, 1, $106)
    %spritemapEntry(1, $4204, $E7, 0, 1, 2, 1, $104)
    %spritemapEntry(1, $43F4, $D7, 0, 1, 2, 1, $102)
    %spritemapEntry(1, $4204, $D7, 0, 1, 2, 1, $100)

Spritemaps_Chozo_14:
    dw $0011
    %spritemapEntry(0, $1FE, $DF, 0, 1, 2, 1, $17D)
    %spritemapEntry(1, $4207, $ED, 0, 1, 2, 1, $12A)
    %spritemapEntry(1, $4217, $ED, 0, 1, 2, 1, $128)
    %spritemapEntry(1, $4203, $EC, 0, 1, 2, 1, $10D)
    %spritemapEntry(1, $43FB, $E4, 0, 1, 2, 1, $10B)
    %spritemapEntry(1, $43FE, $1F, 0, 1, 2, 1, $170)
    %spritemapEntry(1, $43F6, $1F, 0, 1, 2, 1, $171)
    %spritemapEntry(1, $43F6, $0D, 0, 1, 2, 1, $14C)
    %spritemapEntry(1, $43F6, $15, 0, 1, 2, 1, $15C)
    %spritemapEntry(1, $43F7, $05, 0, 1, 2, 1, $150)
    %spritemapEntry(1, $43F7, $FD, 0, 1, 2, 1, $140)
    %spritemapEntry(1, $43FC, $F7, 0, 1, 2, 1, $108)
    %spritemapEntry(1, $43F4, $F7, 0, 1, 2, 1, $109)
    %spritemapEntry(1, $43F4, $E7, 0, 1, 2, 1, $106)
    %spritemapEntry(1, $4204, $E7, 0, 1, 2, 1, $104)
    %spritemapEntry(1, $43F4, $D7, 0, 1, 2, 1, $102)
    %spritemapEntry(1, $4204, $D7, 0, 1, 2, 1, $100)

Spritemaps_Chozo_15:
    dw $0011
    %spritemapEntry(1, $4208, $ED, 0, 1, 2, 1, $126)
    %spritemapEntry(1, $4218, $ED, 0, 1, 2, 1, $124)
    %spritemapEntry(0, $1FE, $DF, 0, 1, 2, 1, $17D)
    %spritemapEntry(1, $4203, $EC, 0, 1, 2, 1, $10D)
    %spritemapEntry(1, $43FB, $E4, 0, 1, 2, 1, $10B)
    %spritemapEntry(1, $43FE, $1F, 0, 1, 2, 1, $170)
    %spritemapEntry(1, $43F6, $1F, 0, 1, 2, 1, $171)
    %spritemapEntry(1, $43F6, $0D, 0, 1, 2, 1, $14C)
    %spritemapEntry(1, $43F6, $15, 0, 1, 2, 1, $15C)
    %spritemapEntry(1, $43F7, $05, 0, 1, 2, 1, $150)
    %spritemapEntry(1, $43F7, $FD, 0, 1, 2, 1, $140)
    %spritemapEntry(1, $43FC, $F7, 0, 1, 2, 1, $108)
    %spritemapEntry(1, $43F4, $F7, 0, 1, 2, 1, $109)
    %spritemapEntry(1, $43F4, $E7, 0, 1, 2, 1, $106)
    %spritemapEntry(1, $4204, $E7, 0, 1, 2, 1, $104)
    %spritemapEntry(1, $43F4, $D7, 0, 1, 2, 1, $102)
    %spritemapEntry(1, $4204, $D7, 0, 1, 2, 1, $100)

Spritemaps_Chozo_16:
    dw $0012
    %spritemapEntry(1, $4208, $ED, 0, 1, 2, 1, $126)
    %spritemapEntry(1, $4218, $E9, 0, 1, 2, 1, $12C)
    %spritemapEntry(0, $18, $F9, 0, 1, 2, 1, $11F)
    %spritemapEntry(0, $1FE, $DF, 0, 1, 2, 1, $17D)
    %spritemapEntry(1, $4203, $EC, 0, 1, 2, 1, $10D)
    %spritemapEntry(1, $43FB, $E4, 0, 1, 2, 1, $10B)
    %spritemapEntry(1, $43FE, $1F, 0, 1, 2, 1, $170)
    %spritemapEntry(1, $43F6, $1F, 0, 1, 2, 1, $171)
    %spritemapEntry(1, $43F6, $0D, 0, 1, 2, 1, $14C)
    %spritemapEntry(1, $43F6, $15, 0, 1, 2, 1, $15C)
    %spritemapEntry(1, $43F7, $05, 0, 1, 2, 1, $150)
    %spritemapEntry(1, $43F7, $FD, 0, 1, 2, 1, $140)
    %spritemapEntry(1, $43FC, $F7, 0, 1, 2, 1, $108)
    %spritemapEntry(1, $43F4, $F7, 0, 1, 2, 1, $109)
    %spritemapEntry(1, $43F4, $E7, 0, 1, 2, 1, $106)
    %spritemapEntry(1, $4204, $E7, 0, 1, 2, 1, $104)
    %spritemapEntry(1, $43F4, $D7, 0, 1, 2, 1, $102)
    %spritemapEntry(1, $4204, $D7, 0, 1, 2, 1, $100)

Spritemaps_Chozo_17:
    dw $0015
    %spritemapEntry(0, $1E0, $F9, 0, 0, 2, 1, $11F)
    %spritemapEntry(1, $43E8, $ED, 0, 0, 2, 1, $126)
    %spritemapEntry(0, $1FA, $DF, 0, 0, 2, 1, $179)
    %spritemapEntry(1, $43E9, $1B, 0, 0, 2, 1, $171)
    %spritemapEntry(1, $43E1, $1B, 0, 0, 2, 1, $170)
    %spritemapEntry(1, $43EE, $10, 0, 0, 2, 1, $158)
    %spritemapEntry(1, $43EE, $08, 0, 0, 2, 1, $148)
    %spritemapEntry(1, $43F4, $FD, 0, 0, 2, 1, $144)
    %spritemapEntry(1, $43F4, $F7, 0, 0, 2, 1, $108)
    %spritemapEntry(1, $43FC, $F7, 0, 0, 2, 1, $109)
    %spritemapEntry(1, $4210, $15, 0, 0, 2, 2, $175)
    %spritemapEntry(1, $4204, $09, 0, 0, 2, 2, $14E)
    %spritemapEntry(1, $43FB, $FD, 0, 1, 2, 2, $142)
    %spritemapEntry(1, $43FB, $05, 0, 1, 2, 2, $152)
    %spritemapEntry(1, $43D8, $E9, 0, 0, 2, 1, $12C)
    %spritemapEntry(1, $43ED, $EC, 0, 0, 2, 1, $10D)
    %spritemapEntry(1, $43F5, $E4, 0, 0, 2, 1, $10B)
    %spritemapEntry(1, $43FC, $E7, 0, 0, 2, 1, $106)
    %spritemapEntry(1, $43EC, $E7, 0, 0, 2, 1, $104)
    %spritemapEntry(1, $43FC, $D7, 0, 0, 2, 1, $102)
    %spritemapEntry(1, $43EC, $D7, 0, 0, 2, 1, $100)

Spritemaps_Chozo_18:
    dw $0016
    %spritemapEntry(0, $1E0, $F8, 0, 0, 2, 1, $11F)
    %spritemapEntry(1, $43E8, $EC, 0, 0, 2, 1, $126)
    %spritemapEntry(0, $1FA, $DE, 0, 0, 2, 1, $17A)
    %spritemapEntry(1, $43EC, $1C, 0, 0, 2, 1, $171)
    %spritemapEntry(1, $43E4, $1C, 0, 0, 2, 1, $170)
    %spritemapEntry(1, $43F1, $11, 0, 0, 2, 1, $158)
    %spritemapEntry(1, $43F1, $09, 0, 0, 2, 1, $148)
    %spritemapEntry(1, $43F7, $04, 0, 0, 2, 1, $152)
    %spritemapEntry(1, $43F7, $FC, 0, 0, 2, 1, $142)
    %spritemapEntry(1, $43F4, $F6, 0, 0, 2, 1, $108)
    %spritemapEntry(1, $43FC, $F6, 0, 0, 2, 1, $109)
    %spritemapEntry(1, $4209, $16, 0, 0, 2, 2, $175)
    %spritemapEntry(1, $43FC, $09, 0, 0, 2, 2, $14E)
    %spritemapEntry(1, $43F9, $04, 0, 0, 2, 2, $150)
    %spritemapEntry(1, $43F9, $FC, 0, 0, 2, 2, $140)
    %spritemapEntry(1, $43D8, $E8, 0, 0, 2, 1, $12C)
    %spritemapEntry(1, $43ED, $EB, 0, 0, 2, 1, $10D)
    %spritemapEntry(1, $43F5, $E3, 0, 0, 2, 1, $10B)
    %spritemapEntry(1, $43FC, $E6, 0, 0, 2, 1, $106)
    %spritemapEntry(1, $43EC, $E6, 0, 0, 2, 1, $104)
    %spritemapEntry(1, $43FC, $D6, 0, 0, 2, 1, $102)
    %spritemapEntry(1, $43EC, $D6, 0, 0, 2, 1, $100)

Spritemaps_Chozo_19:
    dw $0016
    %spritemapEntry(1, $43E8, $EB, 0, 0, 2, 1, $126)
    %spritemapEntry(0, $1E0, $F7, 0, 0, 2, 1, $11F)
    %spritemapEntry(0, $1FA, $DD, 0, 0, 2, 1, $17B)
    %spritemapEntry(1, $43FA, $1E, 0, 0, 2, 1, $171)
    %spritemapEntry(1, $43F2, $1E, 0, 0, 2, 1, $170)
    %spritemapEntry(1, $43FA, $13, 0, 0, 2, 1, $15C)
    %spritemapEntry(1, $43FA, $0B, 0, 0, 2, 1, $14C)
    %spritemapEntry(1, $43FD, $17, 0, 0, 2, 2, $173)
    %spritemapEntry(1, $43F9, $03, 0, 0, 2, 1, $150)
    %spritemapEntry(1, $43F9, $FB, 0, 0, 2, 1, $140)
    %spritemapEntry(1, $43FA, $08, 0, 0, 2, 2, $14E)
    %spritemapEntry(1, $43F4, $F5, 0, 0, 2, 1, $108)
    %spritemapEntry(1, $43FC, $F5, 0, 0, 2, 1, $109)
    %spritemapEntry(1, $43F7, $03, 0, 0, 2, 2, $152)
    %spritemapEntry(1, $43F7, $FB, 0, 0, 2, 2, $142)
    %spritemapEntry(1, $43D8, $E7, 0, 0, 2, 1, $12C)
    %spritemapEntry(1, $43ED, $EA, 0, 0, 2, 1, $10D)
    %spritemapEntry(1, $43F5, $E2, 0, 0, 2, 1, $10B)
    %spritemapEntry(1, $43FC, $E5, 0, 0, 2, 1, $106)
    %spritemapEntry(1, $43EC, $E5, 0, 0, 2, 1, $104)
    %spritemapEntry(1, $43FC, $D5, 0, 0, 2, 1, $102)
    %spritemapEntry(1, $43EC, $D5, 0, 0, 2, 1, $100)

Spritemaps_Chozo_1A:
    dw $0016
    %spritemapEntry(0, $1E0, $F8, 0, 0, 2, 1, $11F)
    %spritemapEntry(1, $43E8, $EC, 0, 0, 2, 1, $126)
    %spritemapEntry(0, $1FA, $DE, 0, 0, 2, 1, $17C)
    %spritemapEntry(1, $4201, $1D, 0, 0, 2, 1, $171)
    %spritemapEntry(1, $43F9, $1D, 0, 0, 2, 1, $170)
    %spritemapEntry(1, $4201, $12, 0, 0, 2, 1, $156)
    %spritemapEntry(1, $4201, $0A, 0, 0, 2, 1, $146)
    %spritemapEntry(1, $43FB, $04, 0, 1, 2, 1, $152)
    %spritemapEntry(1, $43FB, $FC, 0, 1, 2, 1, $142)
    %spritemapEntry(1, $43F2, $1B, 0, 0, 2, 2, $173)
    %spritemapEntry(1, $43F3, $10, 0, 0, 2, 2, $156)
    %spritemapEntry(1, $43F3, $08, 0, 0, 2, 2, $146)
    %spritemapEntry(1, $43F4, $F6, 0, 0, 2, 1, $108)
    %spritemapEntry(1, $43FC, $F6, 0, 0, 2, 1, $109)
    %spritemapEntry(1, $43F4, $FC, 0, 0, 2, 2, $144)
    %spritemapEntry(1, $43D8, $E8, 0, 0, 2, 1, $12C)
    %spritemapEntry(1, $43ED, $EB, 0, 0, 2, 1, $10D)
    %spritemapEntry(1, $43F5, $E3, 0, 0, 2, 1, $10B)
    %spritemapEntry(1, $43FC, $E6, 0, 0, 2, 1, $106)
    %spritemapEntry(1, $43EC, $E6, 0, 0, 2, 1, $104)
    %spritemapEntry(1, $43FC, $D6, 0, 0, 2, 1, $102)
    %spritemapEntry(1, $43EC, $D6, 0, 0, 2, 1, $100)

Spritemaps_Chozo_1B:
    dw $0015
    %spritemapEntry(1, $43E8, $ED, 0, 0, 2, 1, $126)
    %spritemapEntry(0, $1E0, $F9, 0, 0, 2, 1, $11F)
    %spritemapEntry(0, $1FA, $DF, 0, 0, 2, 1, $179)
    %spritemapEntry(1, $4210, $15, 0, 0, 2, 1, $175)
    %spritemapEntry(1, $4204, $09, 0, 0, 2, 1, $14E)
    %spritemapEntry(1, $43FB, $05, 0, 1, 2, 1, $152)
    %spritemapEntry(1, $43FB, $FD, 0, 1, 2, 1, $142)
    %spritemapEntry(1, $43F4, $F7, 0, 0, 2, 1, $108)
    %spritemapEntry(1, $43FC, $F7, 0, 0, 2, 1, $109)
    %spritemapEntry(1, $43E1, $1B, 0, 0, 2, 2, $170)
    %spritemapEntry(1, $43E9, $1B, 0, 0, 2, 2, $171)
    %spritemapEntry(1, $43EE, $10, 0, 0, 2, 2, $158)
    %spritemapEntry(1, $43EE, $08, 0, 0, 2, 2, $148)
    %spritemapEntry(1, $43F4, $FD, 0, 0, 2, 2, $144)
    %spritemapEntry(1, $43D8, $E9, 0, 0, 2, 1, $12C)
    %spritemapEntry(1, $43ED, $EC, 0, 0, 2, 1, $10D)
    %spritemapEntry(1, $43F5, $E4, 0, 0, 2, 1, $10B)
    %spritemapEntry(1, $43FC, $E7, 0, 0, 2, 1, $106)
    %spritemapEntry(1, $43EC, $E7, 0, 0, 2, 1, $104)
    %spritemapEntry(1, $43FC, $D7, 0, 0, 2, 1, $102)
    %spritemapEntry(1, $43EC, $D7, 0, 0, 2, 1, $100)

Spritemaps_Chozo_1C:
    dw $0016
    %spritemapEntry(0, $1E0, $F8, 0, 0, 2, 1, $11F)
    %spritemapEntry(1, $43E8, $EC, 0, 0, 2, 1, $126)
    %spritemapEntry(0, $1FA, $DE, 0, 0, 2, 1, $17A)
    %spritemapEntry(1, $4209, $16, 0, 0, 2, 1, $175)
    %spritemapEntry(1, $43FC, $09, 0, 0, 2, 1, $14E)
    %spritemapEntry(1, $43F9, $04, 0, 0, 2, 1, $150)
    %spritemapEntry(1, $43F9, $FC, 0, 0, 2, 1, $140)
    %spritemapEntry(1, $43D8, $E8, 0, 0, 2, 1, $12C)
    %spritemapEntry(1, $43F5, $E3, 0, 0, 2, 1, $10B)
    %spritemapEntry(1, $43ED, $EB, 0, 0, 2, 1, $10D)
    %spritemapEntry(1, $43F4, $F6, 0, 0, 2, 1, $108)
    %spritemapEntry(1, $43FC, $F6, 0, 0, 2, 1, $109)
    %spritemapEntry(1, $43FC, $E6, 0, 0, 2, 1, $106)
    %spritemapEntry(1, $43EC, $E6, 0, 0, 2, 1, $104)
    %spritemapEntry(1, $43FC, $D6, 0, 0, 2, 1, $102)
    %spritemapEntry(1, $43EC, $D6, 0, 0, 2, 1, $100)
    %spritemapEntry(1, $43E4, $1C, 0, 0, 2, 2, $170)
    %spritemapEntry(1, $43EC, $1C, 0, 0, 2, 2, $171)
    %spritemapEntry(1, $43F1, $11, 0, 0, 2, 2, $158)
    %spritemapEntry(1, $43F1, $09, 0, 0, 2, 2, $148)
    %spritemapEntry(1, $43F7, $04, 0, 0, 2, 2, $152)
    %spritemapEntry(1, $43F7, $FC, 0, 0, 2, 2, $142)

Spritemaps_Chozo_1D:
    dw $0016
    %spritemapEntry(1, $43E8, $EB, 0, 0, 2, 1, $126)
    %spritemapEntry(0, $1E0, $F7, 0, 0, 2, 1, $11F)
    %spritemapEntry(0, $1FA, $DD, 0, 0, 2, 1, $17B)
    %spritemapEntry(1, $43FD, $17, 0, 0, 2, 1, $173)
    %spritemapEntry(1, $43FA, $08, 0, 0, 2, 1, $14E)
    %spritemapEntry(1, $43F7, $03, 0, 0, 2, 1, $152)
    %spritemapEntry(1, $43F7, $FB, 0, 0, 2, 1, $142)
    %spritemapEntry(1, $43F2, $1E, 0, 0, 2, 2, $170)
    %spritemapEntry(1, $43FA, $1E, 0, 0, 2, 2, $171)
    %spritemapEntry(1, $43FA, $13, 0, 0, 2, 2, $15C)
    %spritemapEntry(1, $43FA, $0B, 0, 0, 2, 2, $14C)
    %spritemapEntry(1, $43F9, $03, 0, 0, 2, 2, $150)
    %spritemapEntry(1, $43F9, $FB, 0, 0, 2, 2, $140)
    %spritemapEntry(1, $43D8, $E7, 0, 0, 2, 1, $12C)
    %spritemapEntry(1, $43ED, $EA, 0, 0, 2, 1, $10D)
    %spritemapEntry(1, $43F5, $E2, 0, 0, 2, 1, $10B)
    %spritemapEntry(1, $43F4, $F5, 0, 0, 2, 1, $108)
    %spritemapEntry(1, $43FC, $F5, 0, 0, 2, 1, $109)
    %spritemapEntry(1, $43FC, $E5, 0, 0, 2, 1, $106)
    %spritemapEntry(1, $43EC, $E5, 0, 0, 2, 1, $104)
    %spritemapEntry(1, $43FC, $D5, 0, 0, 2, 1, $102)
    %spritemapEntry(1, $43EC, $D5, 0, 0, 2, 1, $100)

Spritemaps_Chozo_1E:
    dw $0016
    %spritemapEntry(0, $1E0, $F8, 0, 0, 2, 1, $11F)
    %spritemapEntry(1, $43E8, $EC, 0, 0, 2, 1, $126)
    %spritemapEntry(0, $1FA, $DE, 0, 0, 2, 1, $17C)
    %spritemapEntry(1, $43F2, $1B, 0, 0, 2, 1, $173)
    %spritemapEntry(1, $43F3, $10, 0, 0, 2, 1, $156)
    %spritemapEntry(1, $43F3, $08, 0, 0, 2, 1, $146)
    %spritemapEntry(1, $43F4, $FC, 0, 0, 2, 1, $144)
    %spritemapEntry(1, $43F9, $1D, 0, 0, 2, 2, $170)
    %spritemapEntry(1, $4201, $1D, 0, 0, 2, 2, $171)
    %spritemapEntry(1, $4201, $12, 0, 0, 2, 2, $156)
    %spritemapEntry(1, $4201, $0A, 0, 0, 2, 2, $146)
    %spritemapEntry(1, $43F4, $F6, 0, 0, 2, 1, $108)
    %spritemapEntry(1, $43FC, $F6, 0, 0, 2, 1, $109)
    %spritemapEntry(1, $43FB, $FC, 0, 1, 2, 2, $142)
    %spritemapEntry(1, $43FB, $04, 0, 1, 2, 2, $152)
    %spritemapEntry(1, $43D8, $E8, 0, 0, 2, 1, $12C)
    %spritemapEntry(1, $43ED, $EB, 0, 0, 2, 1, $10D)
    %spritemapEntry(1, $43F5, $E3, 0, 0, 2, 1, $10B)
    %spritemapEntry(1, $43FC, $E6, 0, 0, 2, 1, $106)
    %spritemapEntry(1, $43EC, $E6, 0, 0, 2, 1, $104)
    %spritemapEntry(1, $43FC, $D6, 0, 0, 2, 1, $102)
    %spritemapEntry(1, $43EC, $D6, 0, 0, 2, 1, $100)

Spritemaps_Chozo_1F:
    dw $0012
    %spritemapEntry(1, $4208, $ED, 0, 1, 2, 1, $126)
    %spritemapEntry(0, $18, $F9, 0, 1, 2, 1, $11F)
    %spritemapEntry(0, $1FE, $DF, 0, 1, 2, 1, $17D)
    %spritemapEntry(1, $4218, $E9, 0, 1, 2, 1, $12C)
    %spritemapEntry(1, $4203, $EC, 0, 1, 2, 1, $10D)
    %spritemapEntry(1, $43FB, $E4, 0, 1, 2, 1, $10B)
    %spritemapEntry(1, $43FE, $1F, 0, 1, 2, 1, $170)
    %spritemapEntry(1, $43F6, $1F, 0, 1, 2, 1, $171)
    %spritemapEntry(1, $43F6, $0D, 0, 1, 2, 1, $14C)
    %spritemapEntry(1, $43F6, $15, 0, 1, 2, 1, $15C)
    %spritemapEntry(1, $43F7, $05, 0, 1, 2, 1, $150)
    %spritemapEntry(1, $43F7, $FD, 0, 1, 2, 1, $140)
    %spritemapEntry(1, $43FC, $F7, 0, 1, 2, 1, $108)
    %spritemapEntry(1, $43F4, $F7, 0, 1, 2, 1, $109)
    %spritemapEntry(1, $43F4, $E7, 0, 1, 2, 1, $106)
    %spritemapEntry(1, $4204, $E7, 0, 1, 2, 1, $104)
    %spritemapEntry(1, $43F4, $D7, 0, 1, 2, 1, $102)
    %spritemapEntry(1, $4204, $D7, 0, 1, 2, 1, $100)

Spritemaps_Chozo_20:
    dw $0012
    %spritemapEntry(0, $18, $F9, 0, 1, 2, 1, $11F)
    %spritemapEntry(1, $4208, $ED, 0, 1, 2, 1, $126)
    %spritemapEntry(0, $1FE, $DF, 0, 1, 2, 1, $17C)
    %spritemapEntry(1, $4218, $E9, 0, 1, 2, 1, $12C)
    %spritemapEntry(1, $4203, $EC, 0, 1, 2, 1, $10D)
    %spritemapEntry(1, $43FB, $E4, 0, 1, 2, 1, $10B)
    %spritemapEntry(1, $43FE, $1F, 0, 1, 2, 1, $170)
    %spritemapEntry(1, $43F6, $1F, 0, 1, 2, 1, $171)
    %spritemapEntry(1, $43F6, $0D, 0, 1, 2, 1, $14C)
    %spritemapEntry(1, $43F6, $15, 0, 1, 2, 1, $15C)
    %spritemapEntry(1, $43F7, $05, 0, 1, 2, 1, $150)
    %spritemapEntry(1, $43F7, $FD, 0, 1, 2, 1, $140)
    %spritemapEntry(1, $43FC, $F7, 0, 1, 2, 1, $108)
    %spritemapEntry(1, $43F4, $F7, 0, 1, 2, 1, $109)
    %spritemapEntry(1, $43F4, $E7, 0, 1, 2, 1, $106)
    %spritemapEntry(1, $4204, $E7, 0, 1, 2, 1, $104)
    %spritemapEntry(1, $43F4, $D7, 0, 1, 2, 1, $102)
    %spritemapEntry(1, $4204, $D7, 0, 1, 2, 1, $100)

Spritemaps_Chozo_21:
    dw $0012
    %spritemapEntry(1, $4218, $E9, 0, 1, 2, 1, $12C)
    %spritemapEntry(1, $4208, $ED, 0, 1, 2, 1, $126)
    %spritemapEntry(0, $18, $F9, 0, 1, 2, 1, $11F)
    %spritemapEntry(0, $1FE, $DF, 0, 1, 2, 1, $17B)
    %spritemapEntry(1, $4203, $EC, 0, 1, 2, 1, $10D)
    %spritemapEntry(1, $43FB, $E4, 0, 1, 2, 1, $10B)
    %spritemapEntry(1, $43FE, $1F, 0, 1, 2, 1, $170)
    %spritemapEntry(1, $43F6, $1F, 0, 1, 2, 1, $171)
    %spritemapEntry(1, $43F6, $0D, 0, 1, 2, 1, $14C)
    %spritemapEntry(1, $43F6, $15, 0, 1, 2, 1, $15C)
    %spritemapEntry(1, $43F7, $05, 0, 1, 2, 1, $150)
    %spritemapEntry(1, $43F7, $FD, 0, 1, 2, 1, $140)
    %spritemapEntry(1, $43FC, $F7, 0, 1, 2, 1, $108)
    %spritemapEntry(1, $43F4, $F7, 0, 1, 2, 1, $109)
    %spritemapEntry(1, $43F4, $E7, 0, 1, 2, 1, $106)
    %spritemapEntry(1, $4204, $E7, 0, 1, 2, 1, $104)
    %spritemapEntry(1, $43F4, $D7, 0, 1, 2, 1, $102)
    %spritemapEntry(1, $4204, $D7, 0, 1, 2, 1, $100)

Spritemaps_Chozo_22:
    dw $0012
    %spritemapEntry(0, $18, $F9, 0, 1, 2, 1, $11F)
    %spritemapEntry(1, $4208, $ED, 0, 1, 2, 1, $126)
    %spritemapEntry(0, $1FE, $DF, 0, 1, 2, 1, $17A)
    %spritemapEntry(1, $4218, $E9, 0, 1, 2, 1, $12C)
    %spritemapEntry(1, $4203, $EC, 0, 1, 2, 1, $10D)
    %spritemapEntry(1, $43FB, $E4, 0, 1, 2, 1, $10B)
    %spritemapEntry(1, $43FE, $1F, 0, 1, 2, 1, $170)
    %spritemapEntry(1, $43F6, $1F, 0, 1, 2, 1, $171)
    %spritemapEntry(1, $43F6, $0D, 0, 1, 2, 1, $14C)
    %spritemapEntry(1, $43F6, $15, 0, 1, 2, 1, $15C)
    %spritemapEntry(1, $43F7, $05, 0, 1, 2, 1, $150)
    %spritemapEntry(1, $43F7, $FD, 0, 1, 2, 1, $140)
    %spritemapEntry(1, $43FC, $F7, 0, 1, 2, 1, $108)
    %spritemapEntry(1, $43F4, $F7, 0, 1, 2, 1, $109)
    %spritemapEntry(1, $43F4, $E7, 0, 1, 2, 1, $106)
    %spritemapEntry(1, $4204, $E7, 0, 1, 2, 1, $104)
    %spritemapEntry(1, $43F4, $D7, 0, 1, 2, 1, $102)
    %spritemapEntry(1, $4204, $D7, 0, 1, 2, 1, $100)

Spritemaps_Chozo_23:
    dw $0012
    %spritemapEntry(1, $4218, $E9, 0, 1, 2, 1, $12C)
    %spritemapEntry(0, $18, $F9, 0, 1, 2, 1, $11F)
    %spritemapEntry(1, $4208, $ED, 0, 1, 2, 1, $126)
    %spritemapEntry(0, $1FE, $DF, 0, 1, 2, 1, $179)
    %spritemapEntry(1, $4203, $EC, 0, 1, 2, 1, $10D)
    %spritemapEntry(1, $43FB, $E4, 0, 1, 2, 1, $10B)
    %spritemapEntry(1, $43FE, $1F, 0, 1, 2, 1, $170)
    %spritemapEntry(1, $43F6, $1F, 0, 1, 2, 1, $171)
    %spritemapEntry(1, $43F6, $0D, 0, 1, 2, 1, $14C)
    %spritemapEntry(1, $43F6, $15, 0, 1, 2, 1, $15C)
    %spritemapEntry(1, $43F7, $05, 0, 1, 2, 1, $150)
    %spritemapEntry(1, $43F7, $FD, 0, 1, 2, 1, $140)
    %spritemapEntry(1, $43FC, $F7, 0, 1, 2, 1, $108)
    %spritemapEntry(1, $43F4, $F7, 0, 1, 2, 1, $109)
    %spritemapEntry(1, $43F4, $E7, 0, 1, 2, 1, $106)
    %spritemapEntry(1, $4204, $E7, 0, 1, 2, 1, $104)
    %spritemapEntry(1, $43F4, $D7, 0, 1, 2, 1, $102)
    %spritemapEntry(1, $4204, $D7, 0, 1, 2, 1, $100)

Spritemaps_Chozo_24:
    dw $002A
    %spritemapEntry(1, $43E0, $98, 0, 0, 2, 1, $144)
    %spritemapEntry(1, $4242, $98, 0, 0, 2, 1, $14A)
    %spritemapEntry(1, $4232, $A0, 0, 0, 2, 1, $158)
    %spritemapEntry(1, $4232, $98, 0, 0, 2, 1, $148)
    %spritemapEntry(1, $4222, $A0, 0, 0, 2, 1, $15C)
    %spritemapEntry(1, $4222, $98, 0, 0, 2, 1, $14C)
    %spritemapEntry(1, $4202, $98, 0, 0, 2, 1, $14E)
    %spritemapEntry(1, $4212, $A0, 0, 0, 2, 1, $156)
    %spritemapEntry(1, $4212, $98, 0, 0, 2, 1, $146)
    %spritemapEntry(1, $4201, $B8, 0, 0, 2, 2, $14E)
    %spritemapEntry(1, $4211, $C0, 0, 0, 2, 2, $156)
    %spritemapEntry(1, $4211, $B8, 0, 0, 2, 2, $146)
    %spritemapEntry(1, $4241, $B8, 0, 0, 2, 2, $14A)
    %spritemapEntry(1, $4231, $C0, 0, 0, 2, 2, $158)
    %spritemapEntry(1, $4231, $B8, 0, 0, 2, 2, $148)
    %spritemapEntry(1, $4221, $C0, 0, 0, 2, 2, $15C)
    %spritemapEntry(1, $4221, $B8, 0, 0, 2, 2, $14C)
    %spritemapEntry(1, $43D8, $F0, 0, 0, 2, 2, $177)
    %spritemapEntry(1, $43C8, $F0, 0, 0, 2, 2, $175)
    %spritemapEntry(1, $43B8, $F0, 0, 0, 2, 2, $173)
    %spritemapEntry(1, $43A0, $F0, 0, 0, 2, 2, $170)
    %spritemapEntry(1, $43A8, $F0, 0, 0, 2, 2, $171)
    %spritemapEntry(1, $43D8, $E0, 0, 0, 2, 1, $177)
    %spritemapEntry(1, $43C8, $E0, 0, 0, 2, 1, $175)
    %spritemapEntry(1, $43B8, $E0, 0, 0, 2, 1, $173)
    %spritemapEntry(1, $43A8, $E0, 0, 0, 2, 1, $171)
    %spritemapEntry(1, $43A0, $E0, 0, 0, 2, 1, $170)
    %spritemapEntry(1, $43D0, $A0, 0, 0, 2, 1, $152)
    %spritemapEntry(1, $43D0, $98, 0, 0, 2, 1, $142)
    %spritemapEntry(1, $43B0, $A0, 0, 1, 2, 1, $152)
    %spritemapEntry(1, $43B0, $98, 0, 1, 2, 1, $142)
    %spritemapEntry(1, $43C0, $A0, 0, 0, 2, 1, $150)
    %spritemapEntry(1, $43C0, $98, 0, 0, 2, 1, $140)
    %spritemapEntry(1, $43A0, $98, 0, 1, 2, 1, $144)
    %spritemapEntry(1, $43A1, $B8, 0, 1, 2, 2, $144)
    %spritemapEntry(1, $43B0, $B8, 0, 1, 2, 2, $142)
    %spritemapEntry(1, $43B0, $C0, 0, 1, 2, 2, $152)
    %spritemapEntry(1, $43D0, $C0, 0, 0, 2, 2, $152)
    %spritemapEntry(1, $43C0, $C0, 0, 0, 2, 2, $150)
    %spritemapEntry(1, $43E0, $B8, 0, 0, 2, 2, $144)
    %spritemapEntry(1, $43D0, $B8, 0, 0, 2, 2, $142)
    %spritemapEntry(1, $43C0, $B8, 0, 0, 2, 2, $140)

Spritemaps_Chozo_25:
    dw $0019
    %spritemapEntry(1, $4238, $88, 0, 0, 2, 1, $10D)
    %spritemapEntry(1, $4240, $80, 0, 0, 2, 1, $10B)
    %spritemapEntry(0, $3E, $EF, 0, 0, 2, 1, $139)
    %spritemapEntry(1, $4236, $DF, 0, 0, 2, 1, $12C)
    %spritemapEntry(1, $4246, $E7, 0, 0, 2, 1, $12A)
    %spritemapEntry(1, $4220, $DB, 0, 0, 2, 1, $12A)
    %spritemapEntry(1, $4210, $DB, 0, 0, 2, 1, $128)
    %spritemapEntry(1, $4245, $C8, 0, 0, 2, 1, $126)
    %spritemapEntry(0, $45, $C0, 0, 0, 2, 1, $11F)
    %spritemapEntry(1, $4235, $C0, 0, 0, 2, 1, $124)
    %spritemapEntry(1, $4211, $C0, 0, 0, 2, 1, $120)
    %spritemapEntry(0, $21, $C0, 0, 0, 2, 1, $10F)
    %spritemapEntry(1, $4221, $C8, 0, 0, 2, 1, $122)
    %spritemapEntry(1, $43B7, $BD, 0, 0, 2, 1, $14C)
    %spritemapEntry(1, $43B7, $C5, 0, 0, 2, 1, $15C)
    %spritemapEntry(1, $4399, $D7, 0, 0, 2, 1, $150)
    %spritemapEntry(1, $4399, $CF, 0, 0, 2, 1, $140)
    %spritemapEntry(1, $43DA, $CA, 0, 0, 2, 1, $170)
    %spritemapEntry(1, $43E2, $CA, 0, 0, 2, 1, $171)
    %spritemapEntry(1, $43F1, $A8, 0, 0, 2, 1, $108)
    %spritemapEntry(1, $43F9, $A8, 0, 0, 2, 1, $109)
    %spritemapEntry(1, $43F9, $98, 0, 0, 2, 1, $106)
    %spritemapEntry(1, $43E9, $98, 0, 0, 2, 1, $104)
    %spritemapEntry(1, $43F9, $88, 0, 0, 2, 1, $102)
    %spritemapEntry(1, $43E9, $88, 0, 0, 2, 1, $100)


Freespace_BankAA_F7D3:
; $82D bytes
