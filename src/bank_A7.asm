
org $A78000


; Common to all enemy code banks

;;; $8000: Grapple AI - no interaction. Also unfreezes enemies(!) ;;;
CommonA7_GrappleAI_NoInteraction:
; Used by skultera, Draygon body, fire arc, Phantoon, etecoon, dachora and WS ghost
    JSL GrappleAI_SwitchEnemyAIToMainAI
    RTL


;;; $8005: Grapple AI - Samus latches on ;;;
CommonA7_GrappleAI_SamusLatchesOn:
; Used by gripper and Crocomire
    JSL GrappleAI_SamusLatchesOnWithGrapple
    RTL


;;; $800A: Grapple AI - kill enemy ;;;
CommonA7_GrappleAI_KillEnemy:
; Common
    JSL GrappleAI_EnemyGrappleDeath
    RTL


;;; $800F: Grapple AI - cancel grapple beam ;;;
CommonA7_GrappleAI_CancelGrappleBeam:
; Common
    JSL GrappleAI_SwitchToFrozenAI
    RTL


;;; $8014: Grapple AI - Samus latches on - no invincibility ;;;
CommonA7_GrappleAI_SamusLatchesOn_NoInvincibility:
; Used by powamp
    JSL GrappleAI_SamusLatchesOnWithGrapple_NoInvincibility
    RTL


;;; $8019: Unused. Grapple AI - Samus latches on - paralyse enemy ;;;
UNUSED_CommonA7_GrappleAI_SamusLatchesOn_ParalyzeEnemy_A78019:
    JSL GrappleAI_SamusLatchesOnWithGrapple_ParalyzeEnemy
    RTL


;;; $801E: Grapple AI - hurt Samus ;;;
CommonA7_GrappleAI_HurtSamus:
; Used by WS spark
; Hurt reaction happens in $9B:B932
    JSL GrappleAI_SwitchToFrozenAI_duplicate
    RTL


;;; $8023: Normal enemy touch AI ;;;
CommonA7_NormalEnemyTouchAI:
    JSL NormalEnemyTouchAI
    RTL


;;; $8028: Normal touch AI - no death check ;;;
CommonA7_NormalTouchAI_NoDeathCheck:
    JSL NormalEnemyTouchAI_NoDeathCheck_External
    RTL


;;; $802D: Normal enemy shot AI ;;;
CommonA7_NormalEnemyShotAI:
    JSL NormalEnemyShotAI
    RTL


;;; $8032: Normal enemy shot AI - no death check, no enemy shot graphic ;;;
CommonA7_NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic:
    JSL NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External
    RTL


;;; $8037: Normal enemy power bomb AI ;;;
CommonA7_NormalEnemyPowerBombAI:
    JSL NormalEnemyPowerBombAI
    RTL


;;; $803C: Normal enemy power bomb AI - no death check ;;;
CommonA7_NormalEnemyPowerBombAI_NoDeathCheck:
; Kraid's power bomb AI
    JSL NormalEnemyPowerBombAI_NoDeathCheck_External
    RTL


;;; $8041: Normal enemy frozen AI ;;;
CommonA7_NormalEnemyFrozenAI:
    JSL NormalEnemyFrozenAI
    RTL


;;; $8046: Creates a dud shot ;;;
CommonA7_CreateADudShot:
    JSL CreateADudShot
    RTL


;;; $804B: RTS ;;;
RTS_A7804B:
    RTS


;;; $804C: RTL ;;;
RTL_A7804C:
    RTL


;;; $804D: Spritemap - nothing ;;;
Spritemap_CommonA7_Nothing:
    dw $0000


;;; $804F: Extended spritemap - nothing ;;;
ExtendedSpritemap_CommonA7_Nothing:
    dw $0001
    dw $0000,$0000
    dw Spritemap_CommonA7_Nothing
    dw Hitbox_CommonA7_Nothing


;;; $8059: Hitbox - nothing ;;;
Hitbox_CommonA7_Nothing:
; [n entries] [[left offset] [top offset] [right offset] [bottom offset] [p touch] [p shot]]...
    dw $0001
    dw $0000,$0000,$0000,$0000
    dw CommonA7_NormalEnemyTouchAI
    dw CommonA7_NormalEnemyShotAI


;;; $8067: Instruction list - delete enemy ;;;
InstList_CommonA7_DeleteEnemy:
    dw Instruction_CommonA7_DeleteEnemy


;;; $8069: Two NOPs ;;;
NOPNOP_A78069:
; Used as palette by respawning enemy placeholder and Draygon's eye o_O
    NOP : NOP


;;; $806B: Instruction - Enemy.var5 = [[Y]] ;;;
Instruction_CommonA7_Enemy0FB2_InY:
; Used only by torizos (for enemy movement function) and escape etecoon (for enemy function)
    LDA.W $0000,Y : STA.W Enemy.var5,X
    INY #2
    RTL


;;; $8074: Instruction - Enemy.var5 = RTS ;;;
Instruction_CommonA7_SetEnemy0FB2ToRTS:
    LDA.W #RTS_A7807B : STA.W Enemy.var5,X
    RTL


RTS_A7807B:
    RTS


;;; $807C: Instruction - delete enemy ;;;
Instruction_CommonA7_DeleteEnemy:
    LDA.W Enemy.properties,X : ORA.W #$0200 : STA.W Enemy.properties,X
    PLA
    PEA.W ProcessEnemyInstructions_return-1
    RTL


;;; $808A: Instruction - call function [[Y]] ;;;
Instruction_CommonA7_CallFunctionInY:
    LDA.W $0000,Y : STA.B DP_Temp12
    PHY : PHX
    PEA .manualReturn-1
    JMP.W (DP_Temp12)

  .manualReturn:
    PLX : PLY
    INY #2
    RTL


;;; $809C: Instruction - call function [[Y]] with A = [[Y] + 2] ;;;
Instruction_CommonA7_CallFunctionInY_WithA:
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
UNUSED_Instruction_CommonA7_CallExternalFunctionInY_A780B5:
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
UNUSED_Inst_CommonA7_CallExternalFunctionInY_WithA_A780CE:
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
Instruction_CommonA7_GotoY:
    LDA.W $0000,Y : TAY
    RTL


;;; $80F2: Instruction - go to [[Y]] + ±[[Y]] ;;;
Instruction_CommonA7_GotoY_PlusY:
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
Instruction_CommonA7_DecrementTimer_GotoYIfNonZero:
    DEC.W Enemy.loopCounter,X : BNE Instruction_CommonA7_GotoY
    INY #2
    RTL


;;; $8110: Instruction - decrement timer and go to [[Y]] if non-zero ;;;
Instruction_CommonA7_DecrementTimer_GotoYIfNonZero_duplicate:
    DEC.W Enemy.loopCounter,X : BNE Instruction_CommonA7_GotoY
    INY #2
    RTL


;;; $8118: Instruction - decrement timer and go to [Y] + ±[[Y]] if non-zero ;;;
Instruction_CommonA7_DecrementTimer_GotoY_PlusY_IfNonZero:
    SEP #$20
    DEC.W Enemy.loopCounter,X
    REP #$20
    BNE Instruction_CommonA7_GotoY_PlusY
    INY
    RTL


;;; $8123: Instruction - timer = [[Y]] ;;;
Instruction_CommonA7_TimerInY:
    LDA.W $0000,Y : STA.W Enemy.loopCounter,X
    INY #2
    RTL


;;; $812C: Instruction - skip next instruction ;;;
Instruction_CommonA7_SkipNextInstruction:
    INY #2
    RTL


;;; $812F: Instruction - sleep ;;;
Instruction_CommonA7_Sleep:
    DEY #2
    TYA : STA.W Enemy.instList,X
    PLA
    PEA.W ProcessEnemyInstructions_return-1
    RTL


;;; $813A: Instruction - wait [[Y]] frames ;;;
Instruction_CommonA7_WaitYFrames:
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
Instruction_CommonA7_TransferYBytesInYToVRAM:
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
Instruction_CommonA7_EnableOffScreenProcessing:
    LDA.W Enemy.properties,X : ORA.W #$0800 : STA.W Enemy.properties,X
    RTL


;;; $817D: Instruction - disable off-screen processing ;;;
Instruction_CommonA7_DisableOffScreenProcessing:
    LDA.W Enemy.properties,X : AND.W #$F7FF : STA.W Enemy.properties,X
    RTL


;;; $8187: Common enemy speeds - linearly increasing ;;;
CommonA7EnemySpeeds_LinearlyIncreasing:
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
CommonA7EnemySpeeds_QuadraticallyIncreasing:
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


;;; $8687: Palette - enemy $E2BF/$E2FF/$E33F/$E37F/$E3BF/$E3FF/$E43F/$E47F (Kraid) ;;;
Palette_Kraid:
    dw $3800,$559D,$1816,$100D,$4B9F,$3F37,$36D0,$2E69
    dw $2608,$1DA6,$1125,$08C5,$0003,$6318,$7FFF,$0000


if !FEATURE_KEEP_UNREFERENCED
;;; $86A7: Unused. Palette ;;;
UNUSED_Palette_Kraid_A786A7:
; Clone of Palette_Kraid
    dw $3800,$559D,$1816,$100D,$4B9F,$3F37,$36D0,$2E69
    dw $2608,$1DA6,$1125,$08C5,$0003,$6318,$7FFF,$0000
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $86C7: Kraid room background palette ;;;
Palette_KraidRoomBackground:
; BG palette 6
    dw $0400,$2D6B,$2D6B,$2D6B,$1986,$14C2,$0840,$0400
    dw $31ED,$18C6,$10C3,$0420,$0252,$2D6B,$4A52,$0000


;;; $86E7: Instruction list - Kraid foot - initial ;;;
InstList_KraidFoot_Initial:
    dw $7FFF,ExtendedSpritemap_KraidFoot_Initial
    dw Instruction_Common_Sleep


;;; $86ED: Instruction list - Kraid foot - Kraid is big - neutral ;;;
InstList_KraidFoot_KraidIsBig_Neutral:
    dw $7FFF,ExtendedSpritemap_KraidFoot_0
    dw Instruction_Common_Sleep


;;; $86F3: Instruction list - Kraid foot - Kraid is big - walking forwards ;;;
InstList_KraidFoot_KraidIsBig_WalkingForward_0:
    dw Instruction_Kraid_NOP_A7B633
    dw $0004,ExtendedSpritemap_KraidFoot_0
    dw $0004,ExtendedSpritemap_KraidFoot_1
    dw $0004,ExtendedSpritemap_KraidFoot_2
    dw $0004,ExtendedSpritemap_KraidFoot_3
    dw $0004,ExtendedSpritemap_KraidFoot_4
    dw $0004,ExtendedSpritemap_KraidFoot_5
    dw $0004,ExtendedSpritemap_KraidFoot_6
    dw $0004,ExtendedSpritemap_KraidFoot_7
    dw $0004,ExtendedSpritemap_KraidFoot_8
    dw $0004,ExtendedSpritemap_KraidFoot_9
    dw $0004,ExtendedSpritemap_KraidFoot_A
    dw $0003,ExtendedSpritemap_KraidFoot_B
    dw $0001,ExtendedSpritemap_KraidFoot_C
    dw $0001,ExtendedSpritemap_KraidFoot_D
    dw $0001,ExtendedSpritemap_KraidFoot_E
    dw $0001,ExtendedSpritemap_KraidFoot_F
    dw $0001,ExtendedSpritemap_KraidFoot_10
    dw $0010,ExtendedSpritemap_KraidFoot_11
    dw Instruction_Kraid_DecrementYPosition
    dw Instruction_Kraid_XPositionMinus3
    dw $0001,ExtendedSpritemap_KraidFoot_12
    dw Instruction_Kraid_DecrementYPosition
    dw Instruction_Kraid_XPositionMinus3
    dw $0001,ExtendedSpritemap_KraidFoot_13
    dw Instruction_Kraid_NOP_A7B633
    dw $0003,ExtendedSpritemap_KraidFoot_13
    dw Instruction_Kraid_DecrementYPosition
    dw Instruction_Kraid_XPositionMinus3
    dw $0001,ExtendedSpritemap_KraidFoot_13
    dw Instruction_Kraid_NOP_A7B633
    dw $0003,ExtendedSpritemap_KraidFoot_13
    dw Instruction_Kraid_DecrementYPosition
    dw Instruction_Kraid_XPositionMinus3
    dw $0001,ExtendedSpritemap_KraidFoot_15
    dw Instruction_Kraid_NOP_A7B633
    dw $0003,ExtendedSpritemap_KraidFoot_15
    dw Instruction_Kraid_IncrementYPosition_SetScreenShaking
    dw Instruction_Kraid_XPositionMinus3
    dw $0001,ExtendedSpritemap_KraidFoot_16
    dw Instruction_Kraid_IncrementYPosition_SetScreenShaking
    dw Instruction_Kraid_XPositionMinus3
    dw $0001,ExtendedSpritemap_KraidFoot_17
    dw Instruction_Kraid_IncrementYPosition_SetScreenShaking
    dw Instruction_Kraid_XPositionMinus3
    dw $0001,ExtendedSpritemap_KraidFoot_18
    dw Instruction_Kraid_IncrementYPosition_SetScreenShaking
    dw Instruction_Kraid_XPositionMinus3
    dw Instruction_Kraid_QueueSFX76_Lib2_Max6
    dw $0001,ExtendedSpritemap_KraidFoot_19
    dw Instruction_Kraid_NOP_A7B633
    dw Instruction_Kraid_XPositionMinus3
    dw $0001,ExtendedSpritemap_KraidFoot_1A
    dw Instruction_Kraid_XPositionMinus3
    dw $0001,ExtendedSpritemap_KraidFoot_1B
    dw Instruction_Kraid_XPositionMinus3
    dw $0001,ExtendedSpritemap_KraidFoot_1C
    dw Instruction_Kraid_XPositionMinus3
    dw $0001,ExtendedSpritemap_KraidFoot_1D
    dw Instruction_Kraid_XPositionMinus3
    dw $0001,ExtendedSpritemap_KraidFoot_1E
    dw Instruction_Kraid_XPositionMinus3
    dw $0001,ExtendedSpritemap_KraidFoot_1F
    dw $0001,ExtendedSpritemap_KraidFoot_0

InstList_KraidFoot_KraidIsBig_WalkingForward_1:
    dw Instruction_Common_Sleep


;;; $87BD: Instruction list - Kraid foot - lunge forward ;;;
InstList_KraidFoot_LungeForward_0:
; This is just InstList_KraidFoot_KraidIsBig_WalkingForward_0 but faster
    dw Instruction_Kraid_NOP_A7B633
    dw $0001,ExtendedSpritemap_KraidFoot_0
    dw $0001,ExtendedSpritemap_KraidFoot_1
    dw $0001,ExtendedSpritemap_KraidFoot_2
    dw $0001,ExtendedSpritemap_KraidFoot_3
    dw $0001,ExtendedSpritemap_KraidFoot_4
    dw $0001,ExtendedSpritemap_KraidFoot_5
    dw $0001,ExtendedSpritemap_KraidFoot_6
    dw $0001,ExtendedSpritemap_KraidFoot_7
    dw $0001,ExtendedSpritemap_KraidFoot_8
    dw $0001,ExtendedSpritemap_KraidFoot_9
    dw $0001,ExtendedSpritemap_KraidFoot_A
    dw $0001,ExtendedSpritemap_KraidFoot_B
    dw $0001,ExtendedSpritemap_KraidFoot_C
    dw $0001,ExtendedSpritemap_KraidFoot_D
    dw $0001,ExtendedSpritemap_KraidFoot_E
    dw $0001,ExtendedSpritemap_KraidFoot_F
    dw $0001,ExtendedSpritemap_KraidFoot_10
    dw $0004,ExtendedSpritemap_KraidFoot_11
    dw Instruction_Kraid_DecrementYPosition
    dw Instruction_Kraid_XPositionMinus3_duplicate
    dw $0001,ExtendedSpritemap_KraidFoot_12
    dw Instruction_Kraid_DecrementYPosition
    dw Instruction_Kraid_XPositionMinus3_duplicate
    dw $0001,ExtendedSpritemap_KraidFoot_13
    dw Instruction_Kraid_NOP_A7B633
    dw $0001,ExtendedSpritemap_KraidFoot_13
    dw Instruction_Kraid_DecrementYPosition
    dw Instruction_Kraid_XPositionMinus3_duplicate
    dw $0001,ExtendedSpritemap_KraidFoot_13
    dw Instruction_Kraid_NOP_A7B633
    dw $0001,ExtendedSpritemap_KraidFoot_13
    dw Instruction_Kraid_DecrementYPosition
    dw Instruction_Kraid_XPositionMinus3_duplicate
    dw $0001,ExtendedSpritemap_KraidFoot_15
    dw Instruction_Kraid_NOP_A7B633
    dw $0001,ExtendedSpritemap_KraidFoot_15
    dw Instruction_Kraid_IncrementYPosition_SetScreenShaking
    dw Instruction_Kraid_XPositionMinus3_duplicate
    dw $0001,ExtendedSpritemap_KraidFoot_16
    dw Instruction_Kraid_IncrementYPosition_SetScreenShaking
    dw Instruction_Kraid_XPositionMinus3_duplicate
    dw $0001,ExtendedSpritemap_KraidFoot_17
    dw Instruction_Kraid_IncrementYPosition_SetScreenShaking
    dw Instruction_Kraid_XPositionMinus3_duplicate
    dw $0001,ExtendedSpritemap_KraidFoot_18
    dw Instruction_Kraid_IncrementYPosition_SetScreenShaking
    dw Instruction_Kraid_XPositionMinus3_duplicate
    dw Instruction_Kraid_QueueSFX76_Lib2_Max6
    dw $0001,ExtendedSpritemap_KraidFoot_19
    dw Instruction_Kraid_NOP_A7B633
    dw Instruction_Kraid_XPositionMinus3_duplicate
    dw $0001,ExtendedSpritemap_KraidFoot_1A
    dw Instruction_Kraid_XPositionMinus3_duplicate
    dw $0001,ExtendedSpritemap_KraidFoot_1B
    dw Instruction_Kraid_XPositionMinus3_duplicate
    dw $0001,ExtendedSpritemap_KraidFoot_1C
    dw Instruction_Kraid_XPositionMinus3_duplicate
    dw $0001,ExtendedSpritemap_KraidFoot_1D
    dw Instruction_Kraid_XPositionMinus3_duplicate
    dw $0001,ExtendedSpritemap_KraidFoot_1E
    dw $0001,ExtendedSpritemap_KraidFoot_1F
    dw Instruction_Kraid_XPositionMinus3_duplicate
    dw $0001,ExtendedSpritemap_KraidFoot_0

InstList_KraidFoot_LungeForward_1:
    dw Instruction_Common_Sleep


;;; $8887: Instruction list - Kraid foot - Kraid is big - walking backwards ;;;
InstList_KraidFoot_KraidIsBig_WalkingBackwards_0:
    dw Instruction_Kraid_NOP_A7B633
    dw Instruction_Kraid_XPositionPlus3
    dw $0004,ExtendedSpritemap_KraidFoot_22
    dw Instruction_Kraid_XPositionPlus3
    dw $0001,ExtendedSpritemap_KraidFoot_20
    dw Instruction_Kraid_XPositionPlus3
    dw $0001,ExtendedSpritemap_KraidFoot_1E
    dw Instruction_Kraid_XPositionPlus3
    dw $0001,ExtendedSpritemap_KraidFoot_1D
    dw Instruction_Kraid_XPositionPlus3
    dw $0001,ExtendedSpritemap_KraidFoot_1C
    dw Instruction_Kraid_XPositionPlus3
    dw $0001,ExtendedSpritemap_KraidFoot_1B
    dw Instruction_Kraid_XPositionPlus3
    dw $0001,ExtendedSpritemap_KraidFoot_1A
    dw Instruction_Kraid_DecrementYPosition
    dw Instruction_Kraid_XPositionPlus3
    dw $0001,ExtendedSpritemap_KraidFoot_19
    dw Instruction_Kraid_DecrementYPosition
    dw Instruction_Kraid_XPositionPlus3
    dw $0001,ExtendedSpritemap_KraidFoot_18
    dw Instruction_Kraid_DecrementYPosition
    dw Instruction_Kraid_XPositionPlus3
    dw $0001,ExtendedSpritemap_KraidFoot_17
    dw Instruction_Kraid_DecrementYPosition
    dw Instruction_Kraid_XPositionPlus3
    dw $0001,ExtendedSpritemap_KraidFoot_16
    dw Instruction_Kraid_IncrementYPosition_SetScreenShaking
    dw Instruction_Kraid_XPositionPlus3
    dw $0001,ExtendedSpritemap_KraidFoot_15
    dw Instruction_Kraid_IncrementYPosition_SetScreenShaking
    dw Instruction_Kraid_XPositionPlus3
    dw $0001,ExtendedSpritemap_KraidFoot_14
    dw Instruction_Kraid_IncrementYPosition_SetScreenShaking
    dw Instruction_Kraid_XPositionPlus3
    dw $0001,ExtendedSpritemap_KraidFoot_13
    dw Instruction_Kraid_IncrementYPosition_SetScreenShaking
    dw Instruction_Kraid_QueueSFX76_Lib2_Max6
    dw $0001,ExtendedSpritemap_KraidFoot_12
    dw Instruction_Kraid_NOP_A7B633
    dw $0014,ExtendedSpritemap_KraidFoot_11
    dw $0004,ExtendedSpritemap_KraidFoot_10
    dw $0004,ExtendedSpritemap_KraidFoot_F
    dw $0004,ExtendedSpritemap_KraidFoot_E
    dw $0004,ExtendedSpritemap_KraidFoot_D
    dw $0004,ExtendedSpritemap_KraidFoot_C
    dw $0004,ExtendedSpritemap_KraidFoot_B
    dw $0004,ExtendedSpritemap_KraidFoot_A
    dw $0004,ExtendedSpritemap_KraidFoot_9
    dw $0001,ExtendedSpritemap_KraidFoot_8
    dw $0001,ExtendedSpritemap_KraidFoot_7
    dw $0001,ExtendedSpritemap_KraidFoot_6
    dw $0001,ExtendedSpritemap_KraidFoot_5
    dw $0001,ExtendedSpritemap_KraidFoot_4
    dw $0001,ExtendedSpritemap_KraidFoot_3
    dw $0001,ExtendedSpritemap_KraidFoot_2
    dw $0001,ExtendedSpritemap_KraidFoot_1

InstList_KraidFoot_KraidIsBig_WalkingBackwards_1:
    dw Instruction_Common_GotoY
    dw InstList_KraidFoot_KraidIsBig_WalkingBackwards_0


if !FEATURE_KEEP_UNREFERENCED
;;; $893D: Unused. Instruction list - Kraid foot - walking backwards - fast ;;;
UNUSED_InstList_KraidFoot_WalkingBackwards_Fast_A7893D:
    dw Instruction_Kraid_NOP_A7B633
    dw UNUSED_Instruction_Kraid_MoveRight_A7B683
    dw $0004,ExtendedSpritemap_KraidFoot_22
    dw UNUSED_Instruction_Kraid_MoveRight_A7B683
    dw $0001,ExtendedSpritemap_KraidFoot_20
    dw UNUSED_Instruction_Kraid_MoveRight_A7B683
    dw $0001,ExtendedSpritemap_KraidFoot_1E
    dw UNUSED_Instruction_Kraid_MoveRight_A7B683
    dw $0001,ExtendedSpritemap_KraidFoot_1D
    dw UNUSED_Instruction_Kraid_MoveRight_A7B683
    dw $0001,ExtendedSpritemap_KraidFoot_1C
    dw UNUSED_Instruction_Kraid_MoveRight_A7B683
    dw $0001,ExtendedSpritemap_KraidFoot_1B
    dw UNUSED_Instruction_Kraid_MoveRight_A7B683
    dw $0001,ExtendedSpritemap_KraidFoot_1A
    dw Instruction_Kraid_DecrementYPosition
    dw UNUSED_Instruction_Kraid_MoveRight_A7B683
    dw $0001,ExtendedSpritemap_KraidFoot_19
    dw Instruction_Kraid_DecrementYPosition
    dw UNUSED_Instruction_Kraid_MoveRight_A7B683
    dw $0001,ExtendedSpritemap_KraidFoot_18
    dw Instruction_Kraid_DecrementYPosition
    dw UNUSED_Instruction_Kraid_MoveRight_A7B683
    dw $0001,ExtendedSpritemap_KraidFoot_17
    dw Instruction_Kraid_DecrementYPosition
    dw UNUSED_Instruction_Kraid_MoveRight_A7B683
    dw $0001,ExtendedSpritemap_KraidFoot_16
    dw Instruction_Kraid_IncrementYPosition_SetScreenShaking
    dw UNUSED_Instruction_Kraid_MoveRight_A7B683
    dw $0001,ExtendedSpritemap_KraidFoot_15
    dw Instruction_Kraid_IncrementYPosition_SetScreenShaking
    dw UNUSED_Instruction_Kraid_MoveRight_A7B683
    dw $0001,ExtendedSpritemap_KraidFoot_14
    dw Instruction_Kraid_IncrementYPosition_SetScreenShaking
    dw UNUSED_Instruction_Kraid_MoveRight_A7B683
    dw $0001,ExtendedSpritemap_KraidFoot_13
    dw Instruction_Kraid_IncrementYPosition_SetScreenShaking
    dw Instruction_Kraid_QueueSFX76_Lib2_Max6
    dw $0001,ExtendedSpritemap_KraidFoot_12
    dw Instruction_Kraid_NOP_A7B633
    dw $0014,ExtendedSpritemap_KraidFoot_11
    dw $0004,ExtendedSpritemap_KraidFoot_10
    dw $0004,ExtendedSpritemap_KraidFoot_F
    dw $0004,ExtendedSpritemap_KraidFoot_E
    dw $0004,ExtendedSpritemap_KraidFoot_D
    dw $0004,ExtendedSpritemap_KraidFoot_C
    dw $0004,ExtendedSpritemap_KraidFoot_B
    dw $0004,ExtendedSpritemap_KraidFoot_A
    dw $0004,ExtendedSpritemap_KraidFoot_9
    dw $0001,ExtendedSpritemap_KraidFoot_8
    dw $0001,ExtendedSpritemap_KraidFoot_7
    dw $0001,ExtendedSpritemap_KraidFoot_6
    dw $0001,ExtendedSpritemap_KraidFoot_5
    dw $0001,ExtendedSpritemap_KraidFoot_4
    dw $0001,ExtendedSpritemap_KraidFoot_3
    dw $0001,ExtendedSpritemap_KraidFoot_2
    dw $0001,ExtendedSpritemap_KraidFoot_1
    dw Instruction_Common_GotoY
    dw UNUSED_InstList_KraidFoot_WalkingBackwards_Fast_A7893D
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $89F3: Instruction list - Kraid arm - normal ;;;
InstList_KraidArm_Normal_0:
    dw $0006,ExtendedSpritemap_KraidArm_General_0
    dw $0006,ExtendedSpritemap_KraidArm_General_1
    dw $0006,ExtendedSpritemap_KraidArm_General_2
    dw $0006,ExtendedSpritemap_KraidArm_General_3
    dw $0006,ExtendedSpritemap_KraidArm_General_4
    dw $0006,ExtendedSpritemap_KraidArm_General_5
    dw $0006,ExtendedSpritemap_KraidArm_General_6
    dw $0006,ExtendedSpritemap_KraidArm_General_7
    dw $0006,ExtendedSpritemap_KraidArm_General_8
    dw $0006,ExtendedSpritemap_KraidArm_General_9
    dw $0006,ExtendedSpritemap_KraidArm_General_7
    dw $0006,ExtendedSpritemap_KraidArm_General_6
    dw $0006,ExtendedSpritemap_KraidArm_General_5
    dw $0006,ExtendedSpritemap_KraidArm_General_4
    dw $0006,ExtendedSpritemap_KraidArm_General_3
    dw $0006,ExtendedSpritemap_KraidArm_General_2
    dw $0006,ExtendedSpritemap_KraidArm_General_1

InstList_KraidArm_Normal_1:
    dw $0020,ExtendedSpritemap_KraidArm_General_0
    dw Instruction_KraidArm_SlowArmIfLessThanHalfHealth
    dw Instruction_Common_GotoY
    dw InstList_KraidArm_Normal_0


;;; $8A41: Instruction list - Kraid arm - slow ;;;
InstList_KraidArm_Slow:
    dw $0008,ExtendedSpritemap_KraidArm_General_0
    dw $0008,ExtendedSpritemap_KraidArm_General_1
    dw $0008,ExtendedSpritemap_KraidArm_General_2
    dw $0008,ExtendedSpritemap_KraidArm_General_3
    dw $0008,ExtendedSpritemap_KraidArm_General_4
    dw $0008,ExtendedSpritemap_KraidArm_General_5
    dw $0008,ExtendedSpritemap_KraidArm_General_6
    dw $0008,ExtendedSpritemap_KraidArm_General_7
    dw $0008,ExtendedSpritemap_KraidArm_General_8
    dw $0008,ExtendedSpritemap_KraidArm_General_9
    dw $0008,ExtendedSpritemap_KraidArm_General_7
    dw $0008,ExtendedSpritemap_KraidArm_General_6
    dw $0008,ExtendedSpritemap_KraidArm_General_5
    dw $0008,ExtendedSpritemap_KraidArm_General_4
    dw $0008,ExtendedSpritemap_KraidArm_General_3
    dw $0008,ExtendedSpritemap_KraidArm_General_2
    dw $0008,ExtendedSpritemap_KraidArm_General_1
    dw $0030,ExtendedSpritemap_KraidArm_General_0
    dw Instruction_KraidArm_SlowArmIfLessThanHalfHealth
    dw Instruction_Common_GotoY
    dw InstList_KraidArm_Slow


;;; $8A8F: Instruction - slow Kraid arm if Kraid has less than half health ;;;
Instruction_KraidArm_SlowArmIfLessThanHalfHealth:
    LDA.W Enemy.health : CMP.L Kraid.maxHealth_4_8 : BPL .return
    LDA.W Enemy[1].instList : CMP.W #InstList_KraidArm_Slow : BPL .return
    LDY.W #InstList_KraidArm_Slow

  .return:
    RTL


;;; $8AA4: Instruction list - Kraid arm - rising/sinking ;;;
InstList_KraidArm_RisingSinking:
; Same as InstList_KraidArm_Normal_0, but the spritemaps all have lower priority sprites
    dw $0006,ExtendedSpritemap_KraidArm_RisingSinking_0
    dw $0006,ExtendedSpritemap_KraidArm_RisingSinking_1
    dw $0006,ExtendedSpritemap_KraidArm_RisingSinking_2
    dw $0006,ExtendedSpritemap_KraidArm_RisingSinking_3
    dw $0006,ExtendedSpritemap_KraidArm_RisingSinking_4
    dw $0006,ExtendedSpritemap_KraidArm_RisingSinking_5
    dw $0006,ExtendedSpritemap_KraidArm_RisingSinking_6
    dw $0006,ExtendedSpritemap_KraidArm_RisingSinking_7
    dw $0006,ExtendedSpritemap_KraidArm_RisingSinking_8
    dw $0006,ExtendedSpritemap_KraidArm_RisingSinking_9
    dw $0006,ExtendedSpritemap_KraidArm_RisingSinking_7
    dw $0006,ExtendedSpritemap_KraidArm_RisingSinking_6
    dw $0006,ExtendedSpritemap_KraidArm_RisingSinking_5
    dw $0006,ExtendedSpritemap_KraidArm_RisingSinking_4
    dw $0006,ExtendedSpritemap_KraidArm_RisingSinking_3
    dw $0006,ExtendedSpritemap_KraidArm_RisingSinking_2
    dw $0006,ExtendedSpritemap_KraidArm_RisingSinking_1
    dw $0020,ExtendedSpritemap_KraidArm_RisingSinking_0
    dw Instruction_Common_GotoY
    dw InstList_KraidArm_RisingSinking


;;; $8AF0: Instruction list - Kraid arm - dying / preparing to lunge forward ;;;
InstList_KraidArm_Dying_PreparingToLungeForward:
    dw $0006,ExtendedSpritemap_KraidArm_General_0
    dw $0006,ExtendedSpritemap_KraidArm_Dying_PreparingToLungeForward_0
    dw $7FFF,ExtendedSpritemap_KraidArm_Dying_PreparingToLungeForward_1
    dw Instruction_Common_Sleep


;;; $8AFE: Instruction list - Kraid lint - initial ;;;
InstList_KraidLint_Initial:
    dw $7FFF,Spritemap_KraidLint_Initial
    dw Instruction_Common_Sleep


;;; $8B04: Instruction list - Kraid lint - Kraid is big ;;;
InstList_KraidLint_KraidIsBig:
    dw $7FFF,Spritemap_KraidLint_KraidIsBig
    dw Instruction_Common_Sleep


;;; $8B0A: Instruction list - fingernail ;;;
InstList_KraidNail:
    dw $0003,Spritemap_KraidNail_0
    dw $0003,Spritemap_KraidNail_1
    dw $0003,Spritemap_KraidNail_2
    dw $0003,Spritemap_KraidNail_3
    dw $0003,Spritemap_KraidNail_4
    dw $0003,Spritemap_KraidNail_5
    dw $0003,Spritemap_KraidNail_6
    dw $0003,Spritemap_KraidNail_7
    dw Instruction_Common_GotoY
    dw InstList_KraidNail


;;; $8B2E: Unused. Extended spritemaps - Kraid arm ;;;
if !FEATURE_KEEP_UNREFERENCED
UNUSED_ExtendedSpritemap_KraidArm_A78B2E:
    dw $0002
    dw $0000,$0000
    dw Spritemap_KraidArm_General_A
    dw Hitbox_KraidArm_F
    dw $FFF7,$FFF6
    dw Spritemap_KraidArm_General_0
    dw Hitbox_KraidArm_0

UNUSED_ExtendedSpritemap_KraidArm_A78B40:
    dw $0002
    dw $FFF9,$FFF8
    dw Spritemap_KraidArm_General_1
    dw Hitbox_KraidArm_1
    dw $0001,$0000
    dw Spritemap_KraidArm_General_A
    dw Hitbox_KraidArm_F

UNUSED_ExtendedSpritemap_KraidArm_A78B52:
    dw $0002
    dw $FFF8,$FFF8
    dw Spritemap_KraidArm_General_2
    dw Hitbox_KraidArm_2
    dw $0000,$0000
    dw Spritemap_KraidArm_General_A
    dw Hitbox_KraidArm_F

UNUSED_ExtendedSpritemap_KraidArm_A78B64:
    dw $0002
    dw $FFF8,$FFF8
    dw Spritemap_KraidArm_General_3
    dw Hitbox_KraidArm_3
    dw $0000,$0000
    dw Spritemap_KraidArm_General_A
    dw Hitbox_KraidArm_F

UNUSED_ExtendedSpritemap_KraidArm_A78B76:
    dw $0002
    dw $FFF6,$0001
    dw Spritemap_KraidArm_General_1
    dw Hitbox_KraidArm_1
    dw $0000,$0000
    dw Spritemap_KraidArm_General_7
    dw Hitbox_KraidArm_8

UNUSED_ExtendedSpritemap_KraidArm_A78B88:
    dw $0002
    dw $FFF6,$0000
    dw Spritemap_KraidArm_General_2
    dw Hitbox_KraidArm_2
    dw $0000,$0000
    dw Spritemap_KraidArm_General_7
    dw Hitbox_KraidArm_8

UNUSED_ExtendedSpritemap_KraidArm_A78B9A:
    dw $0002
    dw $FFF6,$0000
    dw Spritemap_KraidArm_General_3
    dw Hitbox_KraidArm_3
    dw $0000,$0000
    dw Spritemap_KraidArm_General_7
    dw Hitbox_KraidArm_8

UNUSED_ExtendedSpritemap_KraidArm_A78BAC:
    dw $0002
    dw $FFF6,$0000
    dw Spritemap_KraidArm_General_4
    dw Hitbox_KraidArm_4
    dw $0000,$0000
    dw Spritemap_KraidArm_General_7
    dw Hitbox_KraidArm_8

UNUSED_ExtendedSpritemap_KraidArm_A78BBE:
    dw $0002
    dw $FFFA,$0006
    dw Spritemap_KraidArm_General_2
    dw Hitbox_KraidArm_2
    dw $0000,$0000
    dw Spritemap_KraidArm_General_8
    dw Hitbox_KraidArm_9

UNUSED_ExtendedSpritemap_KraidArm_A78BD0:
    dw $0002
    dw $FFFA,$0006
    dw Spritemap_KraidArm_General_3
    dw Hitbox_KraidArm_3
    dw $0000,$0000
    dw Spritemap_KraidArm_General_8
    dw Hitbox_KraidArm_9

UNUSED_ExtendedSpritemap_KraidArm_A78BE2:
    dw $0002
    dw $FFF8,$0006
    dw Spritemap_KraidArm_General_4
    dw Hitbox_KraidArm_4
    dw $0000,$0000
    dw Spritemap_KraidArm_General_8
    dw Hitbox_KraidArm_9

UNUSED_ExtendedSpritemap_KraidArm_A78BF4:
    dw $0002
    dw $FFF8,$0006
    dw Spritemap_KraidArm_General_5
    dw Hitbox_KraidArm_5
    dw $0000,$0000
    dw Spritemap_KraidArm_General_8
    dw Hitbox_KraidArm_9

UNUSED_ExtendedSpritemap_KraidArm_A78C06:
    dw $0002
    dw $0001,$000A
    dw Spritemap_KraidArm_General_3
    dw Hitbox_KraidArm_3
    dw $0000,$0000
    dw Spritemap_KraidArm_General_9
    dw Hitbox_KraidArm_A

UNUSED_ExtendedSpritemap_KraidArm_A78C18:
    dw $0002
    dw $0000,$000A
    dw Spritemap_KraidArm_General_4
    dw Hitbox_KraidArm_4
    dw $0000,$0000
    dw Spritemap_KraidArm_General_9
    dw Hitbox_KraidArm_A

UNUSED_ExtendedSpritemap_KraidArm_A78C2A:
    dw $0002
    dw $FFFF,$000C
    dw Spritemap_KraidArm_General_5
    dw Hitbox_KraidArm_5
    dw $0000,$0000
    dw Spritemap_KraidArm_General_9
    dw Hitbox_KraidArm_A

UNUSED_ExtendedSpritemap_KraidArm_A78C3C:
    dw $0002
    dw $0000,$000B
    dw Spritemap_KraidArm_General_6
    dw Hitbox_KraidArm_6
    dw $0000,$0000
    dw Spritemap_KraidArm_General_9
    dw Hitbox_KraidArm_A

UNUSED_ExtendedSpritemap_KraidArm_A78C4E:
    dw $0001
    dw $0000,$0000
    dw Spritemap_KraidArm_General_D
    dw Hitbox_KraidArm_12

UNUSED_ExtendedSpritemap_KraidArm_A78C58:
    dw $0001
    dw $0000,$0000
    dw Spritemap_KraidArm_General_C
    dw Hitbox_KraidArm_11

UNUSED_ExtendedSpritemap_KraidArm_A78C62:
    dw $0001
    dw $0000,$0000
    dw Spritemap_KraidArm_General_B
    dw Hitbox_KraidArm_10
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $8C6C: Spritemap - Kraid lint - Kraid is big ;;;
Spritemap_KraidLint_KraidIsBig:
    dw $0005
    %spritemapEntry(0, $1F4, $08, 0, 0, 2, 0, $1C2)
    %spritemapEntry(1, $1E4, $00, 0, 0, 2, 0, $1B0)
    %spritemapEntry(1, $1F4, $F8, 0, 0, 2, 0, $1A2)
    %spritemapEntry(1, $1E4, $F8, 0, 0, 2, 0, $1A0)
    %spritemapEntry(1, $04, $F8, 0, 0, 2, 0, $1A9)


;;; $8C87: Unused. Extended spritemaps - Kraid foot ;;;
if !FEATURE_KEEP_UNREFERENCED
UNUSED_ExtendedSpritemap_KraidFoot_A78C87:
    dw $0001
    dw $0000,$0000
    dw UNUSED_Spritemap_KraidFoot_A794DA
    dw UNUSED_Hitbox_KraidFoot

UNUSED_ExtendedSpritemap_KraidFoot_A78C91:
    dw $0002
    dw $0000,$0000
    dw Spritemap_KraidFoot_0
    dw UNUSED_Hitbox_KraidFoot
    dw $000C,$0030
    dw Spritemap_KraidFoot_4
    dw UNUSED_Hitbox_KraidFoot

UNUSED_ExtendedSpritemap_KraidFoot_A78CA3:
    dw $0002
    dw $0000,$0000
    dw Spritemap_KraidFoot_1
    dw UNUSED_Hitbox_KraidFoot
    dw $0000,$0039
    dw Spritemap_KraidFoot_4
    dw UNUSED_Hitbox_KraidFoot

UNUSED_ExtendedSpritemap_KraidFoot_A78CB5:
    dw $0002
    dw $0000,$0000
    dw Spritemap_KraidFoot_2
    dw UNUSED_Hitbox_KraidFoot
    dw $FFF0,$003F
    dw Spritemap_KraidFoot_4
    dw UNUSED_Hitbox_KraidFoot

UNUSED_ExtendedSpritemap_KraidFoot_A78CC7:
    dw $0002
    dw $0000,$0000
    dw Spritemap_KraidFoot_3
    dw UNUSED_Hitbox_KraidFoot
    dw $FFDF,$003D
    dw Spritemap_KraidFoot_4
    dw UNUSED_Hitbox_KraidFoot

UNUSED_ExtendedSpritemap_KraidFoot_A78CD9:
    dw $0001
    dw $0000,$0000
    dw UNUSED_Spritemap_KraidFoot_A796CB
    dw UNUSED_Hitbox_KraidFoot_A79461
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $8CE3: Extended spritemaps - Kraid foot ;;;
ExtendedSpritemap_KraidFoot_0:
    dw $0002
    dw $0008,$0028
    dw Spritemap_KraidFoot_4
    dw Hitbox_KraidFoot
    dw $0000,$0000
    dw Spritemap_KraidFoot_0
    dw Hitbox_KraidFoot

ExtendedSpritemap_KraidFoot_1:
    dw $0002
    dw $0006,$0027
    dw Spritemap_KraidFoot_4
    dw Hitbox_KraidFoot
    dw $FFFE,$FFFF
    dw Spritemap_KraidFoot_0
    dw Hitbox_KraidFoot

ExtendedSpritemap_KraidFoot_2:
    dw $0002
    dw $0004,$0026
    dw Spritemap_KraidFoot_4
    dw Hitbox_KraidFoot
    dw $FFFC,$FFFE
    dw Spritemap_KraidFoot_0
    dw Hitbox_KraidFoot

ExtendedSpritemap_KraidFoot_3:
    dw $0002
    dw $0002,$0025
    dw Spritemap_KraidFoot_4
    dw Hitbox_KraidFoot
    dw $FFFA,$FFFD
    dw Spritemap_KraidFoot_0
    dw Hitbox_KraidFoot

ExtendedSpritemap_KraidFoot_4:
    dw $0002
    dw $0000,$0024
    dw Spritemap_KraidFoot_4
    dw Hitbox_KraidFoot
    dw $FFF8,$FFFC
    dw Spritemap_KraidFoot_0
    dw Hitbox_KraidFoot

ExtendedSpritemap_KraidFoot_5:
    dw $0002
    dw $FFFE,$0023
    dw Spritemap_KraidFoot_4
    dw Hitbox_KraidFoot
    dw $0005,$FFF1
    dw Spritemap_KraidFoot_1
    dw Hitbox_KraidFoot

ExtendedSpritemap_KraidFoot_6:
    dw $0002
    dw $FFFC,$0022
    dw Spritemap_KraidFoot_4
    dw Hitbox_KraidFoot
    dw $0003,$FFF0
    dw Spritemap_KraidFoot_1
    dw Hitbox_KraidFoot

ExtendedSpritemap_KraidFoot_7:
    dw $0002
    dw $FFFA,$0021
    dw Spritemap_KraidFoot_4
    dw Hitbox_KraidFoot
    dw $0001,$FFEF
    dw Spritemap_KraidFoot_1
    dw Hitbox_KraidFoot

ExtendedSpritemap_KraidFoot_8:
    dw $0002
    dw $FFF8,$0020
    dw Spritemap_KraidFoot_4
    dw Hitbox_KraidFoot
    dw $FFFF,$FFEE
    dw Spritemap_KraidFoot_1
    dw Hitbox_KraidFoot

ExtendedSpritemap_KraidFoot_9:
    dw $0002
    dw $FFF6,$001F
    dw Spritemap_KraidFoot_4
    dw Hitbox_KraidFoot
    dw $FFFD,$FFED
    dw Spritemap_KraidFoot_1
    dw Hitbox_KraidFoot

ExtendedSpritemap_KraidFoot_A:
    dw $0002
    dw $FFF4,$001D
    dw Spritemap_KraidFoot_4
    dw Hitbox_KraidFoot
    dw $000C,$FFE6
    dw Spritemap_KraidFoot_2
    dw Hitbox_KraidFoot

ExtendedSpritemap_KraidFoot_B:
    dw $0002
    dw $FFF2,$001C
    dw Spritemap_KraidFoot_4
    dw Hitbox_KraidFoot
    dw $001A,$FFE9
    dw Spritemap_KraidFoot_3
    dw Hitbox_KraidFoot

ExtendedSpritemap_KraidFoot_C:
    dw $0002
    dw $FFF0,$001E
    dw Spritemap_KraidFoot_4
    dw Hitbox_KraidFoot
    dw $0018,$FFEB
    dw Spritemap_KraidFoot_3
    dw Hitbox_KraidFoot

ExtendedSpritemap_KraidFoot_D:
    dw $0002
    dw $FFEE,$0020
    dw Spritemap_KraidFoot_4
    dw Hitbox_KraidFoot
    dw $0016,$FFED
    dw Spritemap_KraidFoot_3
    dw Hitbox_KraidFoot

ExtendedSpritemap_KraidFoot_E:
    dw $0002
    dw $FFEC,$0022
    dw Spritemap_KraidFoot_4
    dw Hitbox_KraidFoot
    dw $0014,$FFEF
    dw Spritemap_KraidFoot_3
    dw Hitbox_KraidFoot

ExtendedSpritemap_KraidFoot_F:
    dw $0002
    dw $FFEA,$0024
    dw Spritemap_KraidFoot_4
    dw Hitbox_KraidFoot
    dw $0012,$FFF1
    dw Spritemap_KraidFoot_3
    dw Hitbox_KraidFoot

ExtendedSpritemap_KraidFoot_10:
    dw $0002
    dw $FFE8,$0026
    dw Spritemap_KraidFoot_4
    dw Hitbox_KraidFoot
    dw $0010,$FFF3
    dw Spritemap_KraidFoot_3
    dw Hitbox_KraidFoot

ExtendedSpritemap_KraidFoot_11:
    dw $0002
    dw $FFE6,$0028
    dw Spritemap_KraidFoot_4
    dw Hitbox_KraidFoot
    dw $000E,$FFF5
    dw Spritemap_KraidFoot_3
    dw Hitbox_KraidFoot

ExtendedSpritemap_KraidFoot_12:
    dw $0002
    dw $FFE8,$0028
    dw Spritemap_KraidFoot_4
    dw Hitbox_KraidFoot
    dw $0010,$FFF6
    dw Spritemap_KraidFoot_3
    dw Hitbox_KraidFoot

ExtendedSpritemap_KraidFoot_13:
    dw $0002
    dw $FFEA,$0028
    dw Spritemap_KraidFoot_4
    dw Hitbox_KraidFoot
    dw $0012,$FFF6
    dw Spritemap_KraidFoot_3
    dw Hitbox_KraidFoot

ExtendedSpritemap_KraidFoot_14:
    dw $0002
    dw $FFEC,$0028
    dw Spritemap_KraidFoot_4
    dw Hitbox_KraidFoot
    dw $0014,$FFF6
    dw Spritemap_KraidFoot_3
    dw Hitbox_KraidFoot

ExtendedSpritemap_KraidFoot_15:
    dw $0002
    dw $FFEE,$0028
    dw Spritemap_KraidFoot_4
    dw Hitbox_KraidFoot
    dw $0006,$FFF1
    dw Spritemap_KraidFoot_2
    dw Hitbox_KraidFoot

ExtendedSpritemap_KraidFoot_16:
    dw $0002
    dw $FFF0,$0028
    dw Spritemap_KraidFoot_4
    dw Hitbox_KraidFoot
    dw $0008,$FFF1
    dw Spritemap_KraidFoot_2
    dw Hitbox_KraidFoot

ExtendedSpritemap_KraidFoot_17:
    dw $0002
    dw $FFF2,$0028
    dw Spritemap_KraidFoot_4
    dw Hitbox_KraidFoot
    dw $FFF9,$FFF6
    dw Spritemap_KraidFoot_1
    dw Hitbox_KraidFoot

ExtendedSpritemap_KraidFoot_18:
    dw $0002
    dw $FFF4,$0028
    dw Spritemap_KraidFoot_4
    dw Hitbox_KraidFoot
    dw $FFFB,$FFF6
    dw Spritemap_KraidFoot_1
    dw Hitbox_KraidFoot

ExtendedSpritemap_KraidFoot_19:
    dw $0002
    dw $FFF6,$0028
    dw Spritemap_KraidFoot_4
    dw Hitbox_KraidFoot
    dw $FFFD,$FFF6
    dw Spritemap_KraidFoot_1
    dw Hitbox_KraidFoot

ExtendedSpritemap_KraidFoot_1A:
    dw $0002
    dw $FFF8,$0028
    dw Spritemap_KraidFoot_4
    dw Hitbox_KraidFoot
    dw $FFFF,$FFF6
    dw Spritemap_KraidFoot_1
    dw Hitbox_KraidFoot

ExtendedSpritemap_KraidFoot_1B:
    dw $0002
    dw $FFFA,$0028
    dw Spritemap_KraidFoot_4
    dw Hitbox_KraidFoot
    dw $0001,$FFF6
    dw Spritemap_KraidFoot_1
    dw Hitbox_KraidFoot

ExtendedSpritemap_KraidFoot_1C:
    dw $0002
    dw $FFFC,$0028
    dw Spritemap_KraidFoot_4
    dw Hitbox_KraidFoot
    dw $0003,$FFF6
    dw Spritemap_KraidFoot_1
    dw Hitbox_KraidFoot

ExtendedSpritemap_KraidFoot_1D:
    dw $0002
    dw $FFFE,$0028
    dw Spritemap_KraidFoot_4
    dw Hitbox_KraidFoot
    dw $0005,$FFF6
    dw Spritemap_KraidFoot_1
    dw Hitbox_KraidFoot

ExtendedSpritemap_KraidFoot_1E:
    dw $0002
    dw $0000,$0028
    dw Spritemap_KraidFoot_4
    dw Hitbox_KraidFoot
    dw $0007,$FFF6
    dw Spritemap_KraidFoot_1
    dw Hitbox_KraidFoot

ExtendedSpritemap_KraidFoot_1F:
    dw $0002
    dw $0002,$0028
    dw Spritemap_KraidFoot_4
    dw Hitbox_KraidFoot
    dw $FFFA,$0000
    dw Spritemap_KraidFoot_0
    dw Hitbox_KraidFoot

ExtendedSpritemap_KraidFoot_20:
    dw $0002
    dw $0004,$0028
    dw Spritemap_KraidFoot_4
    dw Hitbox_KraidFoot
    dw $FFFC,$0000
    dw Spritemap_KraidFoot_0
    dw Hitbox_KraidFoot

ExtendedSpritemap_KraidFoot_21:
    dw $0002
    dw $0006,$0028
    dw Spritemap_KraidFoot_4
    dw Hitbox_KraidFoot
    dw $FFFE,$0000
    dw Spritemap_KraidFoot_0
    dw Hitbox_KraidFoot

ExtendedSpritemap_KraidFoot_22:
    dw $0002
    dw $0008,$0028
    dw Spritemap_KraidFoot_4
    dw Hitbox_KraidFoot
    dw $0000,$0000
    dw Spritemap_KraidFoot_0
    dw Hitbox_KraidFoot


;;; $8F59: Extended spritemaps - Kraid arm ;;;
; General
ExtendedSpritemap_KraidArm_General_0:
    dw $0005
    dw $FFDC,$FFDF
    dw Spritemap_KraidArm_General_0
    dw Hitbox_KraidArm_0
    dw $FFE4,$FFE8
    dw Spritemap_KraidArm_General_A
    dw Hitbox_KraidArm_F
    dw $0000,$0000
    dw Spritemap_KraidArm_General_D
    dw Hitbox_KraidArm_12
    dw $FFDC,$FFD8
    dw Spritemap_KraidArm_General_0
    dw Hitbox_KraidArm_0
    dw $FFE4,$FFE1
    dw Spritemap_KraidArm_General_A
    dw Hitbox_KraidArm_F

ExtendedSpritemap_KraidArm_General_1:
    dw $0005
    dw $FFDA,$FFDF
    dw Spritemap_KraidArm_General_1
    dw Hitbox_KraidArm_1
    dw $FFE2,$FFE6
    dw Spritemap_KraidArm_General_A
    dw Hitbox_KraidArm_F
    dw $0000,$0000
    dw Spritemap_KraidArm_General_D
    dw Hitbox_KraidArm_12
    dw $FFDC,$FFD8
    dw Spritemap_KraidArm_General_0
    dw Hitbox_KraidArm_0
    dw $FFE4,$FFE1
    dw Spritemap_KraidArm_General_A
    dw Hitbox_KraidArm_F

ExtendedSpritemap_KraidArm_General_2:
    dw $0005
    dw $FFD0,$FFF3
    dw Spritemap_KraidArm_General_2
    dw Hitbox_KraidArm_2
    dw $FFDA,$FFF3
    dw Spritemap_KraidArm_General_7
    dw Hitbox_KraidArm_8
    dw $0000,$0000
    dw Spritemap_KraidArm_General_C
    dw Hitbox_KraidArm_11
    dw $FFD3,$FFE5
    dw Spritemap_KraidArm_General_1
    dw Hitbox_KraidArm_1
    dw $FFDB,$FFED
    dw Spritemap_KraidArm_General_A
    dw Hitbox_KraidArm_F

ExtendedSpritemap_KraidArm_General_3:
    dw $0005
    dw $FFD2,$FFF3
    dw Spritemap_KraidArm_General_3
    dw Hitbox_KraidArm_3
    dw $FFDB,$FFF3
    dw Spritemap_KraidArm_General_7
    dw Hitbox_KraidArm_8
    dw $0000,$0000
    dw Spritemap_KraidArm_General_C
    dw Hitbox_KraidArm_11
    dw $FFD3,$FFED
    dw Spritemap_KraidArm_General_2
    dw Hitbox_KraidArm_2
    dw $FFDC,$FFEE
    dw Spritemap_KraidArm_General_7
    dw Hitbox_KraidArm_8

ExtendedSpritemap_KraidArm_General_4:
    dw $0005
    dw $FFD3,$0008
    dw Spritemap_KraidArm_General_4
    dw Hitbox_KraidArm_4
    dw $FFDA,$0002
    dw Spritemap_KraidArm_General_8
    dw Hitbox_KraidArm_9
    dw $0000,$0000
    dw Spritemap_KraidArm_General_B
    dw Hitbox_KraidArm_10
    dw $FFD2,$0003
    dw Spritemap_KraidArm_General_3
    dw Hitbox_KraidArm_3
    dw $FFD9,$FFFD
    dw Spritemap_KraidArm_General_8
    dw Hitbox_KraidArm_9

ExtendedSpritemap_KraidArm_General_5:
    dw $0005
    dw $FFD4,$0008
    dw Spritemap_KraidArm_General_4
    dw Hitbox_KraidArm_4
    dw $FFDB,$0002
    dw Spritemap_KraidArm_General_8
    dw Hitbox_KraidArm_9
    dw $0000,$0000
    dw Spritemap_KraidArm_General_B
    dw Hitbox_KraidArm_10
    dw $FFD2,$0004
    dw Spritemap_KraidArm_General_4
    dw Hitbox_KraidArm_4
    dw $FFD9,$FFFE
    dw Spritemap_KraidArm_General_8
    dw Hitbox_KraidArm_9

ExtendedSpritemap_KraidArm_General_6:
    dw $0005
    dw $FFD9,$000A
    dw Spritemap_KraidArm_General_5
    dw Hitbox_KraidArm_5
    dw $FFDA,$0000
    dw Spritemap_KraidArm_General_9
    dw Hitbox_KraidArm_A
    dw $0000,$0000
    dw Spritemap_KraidArm_General_B
    dw Hitbox_KraidArm_10
    dw $FFD5,$000A
    dw Spritemap_KraidArm_General_5
    dw Hitbox_KraidArm_5
    dw $FFD7,$FFFE
    dw Spritemap_KraidArm_General_9
    dw Hitbox_KraidArm_A

ExtendedSpritemap_KraidArm_General_7:
    dw $0005
    dw $FFD9,$000A
    dw Spritemap_KraidArm_General_5
    dw Hitbox_KraidArm_5
    dw $FFDA,$0000
    dw Spritemap_KraidArm_General_9
    dw Hitbox_KraidArm_A
    dw $0000,$0000
    dw Spritemap_KraidArm_General_B
    dw Hitbox_KraidArm_10
    dw $FFD5,$0009
    dw Spritemap_KraidArm_General_5
    dw Hitbox_KraidArm_5
    dw $FFD7,$FFFE
    dw Spritemap_KraidArm_General_9
    dw Hitbox_KraidArm_A

ExtendedSpritemap_KraidArm_General_8:
    dw $0005
    dw $FFD9,$000A
    dw Spritemap_KraidArm_General_6
    dw Hitbox_KraidArm_6
    dw $FFDA,$0000
    dw Spritemap_KraidArm_General_9
    dw Hitbox_KraidArm_A
    dw $0000,$0000
    dw Spritemap_KraidArm_General_B
    dw Hitbox_KraidArm_10
    dw $FFD5,$0009
    dw Spritemap_KraidArm_General_5
    dw Hitbox_KraidArm_5
    dw $FFD7,$FFFE
    dw Spritemap_KraidArm_General_9
    dw Hitbox_KraidArm_A

ExtendedSpritemap_KraidArm_General_9:
    dw $0005
    dw $FFD9,$000A
    dw Spritemap_KraidArm_General_6
    dw Hitbox_KraidArm_6
    dw $FFDA,$0000
    dw Spritemap_KraidArm_General_9
    dw Hitbox_KraidArm_A
    dw $0000,$0000
    dw Spritemap_KraidArm_General_B
    dw Hitbox_KraidArm_10
    dw $FFD6,$0009
    dw Spritemap_KraidArm_General_6
    dw Hitbox_KraidArm_6
    dw $FFD6,$FFFE
    dw Spritemap_KraidArm_General_9
    dw Hitbox_KraidArm_A

; Rising/sinking
ExtendedSpritemap_KraidArm_RisingSinking_0:
    dw $0005
    dw $FFDC,$FFDF
    dw Spritemap_KraidArm_RisingSinking_0
    dw Hitbox_KraidArm_0
    dw $FFE4,$FFE8
    dw Spritemap_KraidArm_RisingSinking_A
    dw Hitbox_KraidArm_F
    dw $0000,$0000
    dw Spritemap_KraidArm_RisingSinking_D
    dw Hitbox_KraidArm_12
    dw $FFDC,$FFD8
    dw Spritemap_KraidArm_RisingSinking_0
    dw Hitbox_KraidArm_0
    dw $FFE4,$FFE1
    dw Spritemap_KraidArm_RisingSinking_A
    dw Hitbox_KraidArm_F

ExtendedSpritemap_KraidArm_RisingSinking_1:
    dw $0005
    dw $FFDA,$FFDF
    dw Spritemap_KraidArm_RisingSinking_1
    dw Hitbox_KraidArm_1
    dw $FFE2,$FFE6
    dw Spritemap_KraidArm_RisingSinking_A
    dw Hitbox_KraidArm_F
    dw $0000,$0000
    dw Spritemap_KraidArm_RisingSinking_D
    dw Hitbox_KraidArm_12
    dw $FFDC,$FFD8
    dw Spritemap_KraidArm_RisingSinking_0
    dw Hitbox_KraidArm_0
    dw $FFE4,$FFE1
    dw Spritemap_KraidArm_RisingSinking_A
    dw Hitbox_KraidArm_F

ExtendedSpritemap_KraidArm_RisingSinking_2:
    dw $0005
    dw $FFD0,$FFF3
    dw Spritemap_KraidArm_RisingSinking_2
    dw Hitbox_KraidArm_2
    dw $FFDA,$FFF3
    dw Spritemap_KraidArm_RisingSinking_7
    dw Hitbox_KraidArm_8
    dw $0000,$0000
    dw Spritemap_KraidArm_RisingSinking_C
    dw Hitbox_KraidArm_11
    dw $FFD3,$FFE5
    dw Spritemap_KraidArm_RisingSinking_1
    dw Hitbox_KraidArm_1
    dw $FFDB,$FFED
    dw Spritemap_KraidArm_RisingSinking_A
    dw Hitbox_KraidArm_F

ExtendedSpritemap_KraidArm_RisingSinking_3:
    dw $0005
    dw $FFD2,$FFF3
    dw Spritemap_KraidArm_RisingSinking_3
    dw Hitbox_KraidArm_3
    dw $FFDB,$FFF3
    dw Spritemap_KraidArm_RisingSinking_7
    dw Hitbox_KraidArm_8
    dw $0000,$0000
    dw Spritemap_KraidArm_RisingSinking_C
    dw Hitbox_KraidArm_11
    dw $FFD3,$FFED
    dw Spritemap_KraidArm_RisingSinking_2
    dw Hitbox_KraidArm_2
    dw $FFDC,$FFEE
    dw Spritemap_KraidArm_RisingSinking_7
    dw Hitbox_KraidArm_8

ExtendedSpritemap_KraidArm_RisingSinking_4:
    dw $0005
    dw $FFD3,$0008
    dw Spritemap_KraidArm_RisingSinking_4
    dw Hitbox_KraidArm_4
    dw $FFDA,$0002
    dw Spritemap_KraidArm_RisingSinking_8
    dw Hitbox_KraidArm_9
    dw $0000,$0000
    dw Spritemap_KraidArm_RisingSinking_B
    dw Hitbox_KraidArm_10
    dw $FFD2,$0003
    dw Spritemap_KraidArm_RisingSinking_3
    dw Hitbox_KraidArm_3
    dw $FFD9,$FFFD
    dw Spritemap_KraidArm_RisingSinking_8
    dw Hitbox_KraidArm_9

ExtendedSpritemap_KraidArm_RisingSinking_5:
    dw $0005
    dw $FFD4,$0008
    dw Spritemap_KraidArm_RisingSinking_4
    dw Hitbox_KraidArm_4
    dw $FFDB,$0002
    dw Spritemap_KraidArm_RisingSinking_8
    dw Hitbox_KraidArm_9
    dw $0000,$0000
    dw Spritemap_KraidArm_RisingSinking_B
    dw Hitbox_KraidArm_10
    dw $FFD2,$0004
    dw Spritemap_KraidArm_RisingSinking_4
    dw Hitbox_KraidArm_4
    dw $FFD9,$FFFE
    dw Spritemap_KraidArm_RisingSinking_8
    dw Hitbox_KraidArm_9

ExtendedSpritemap_KraidArm_RisingSinking_6:
    dw $0005
    dw $FFD9,$000A
    dw Spritemap_KraidArm_RisingSinking_5
    dw Hitbox_KraidArm_5
    dw $FFDA,$0000
    dw Spritemap_KraidArm_RisingSinking_9
    dw Hitbox_KraidArm_A
    dw $0000,$0000
    dw Spritemap_KraidArm_RisingSinking_B
    dw Hitbox_KraidArm_10
    dw $FFD5,$000A
    dw Spritemap_KraidArm_RisingSinking_5
    dw Hitbox_KraidArm_5
    dw $FFD7,$FFFE
    dw Spritemap_KraidArm_RisingSinking_9
    dw Hitbox_KraidArm_A

ExtendedSpritemap_KraidArm_RisingSinking_7:
    dw $0005
    dw $FFD9,$000A
    dw Spritemap_KraidArm_RisingSinking_5
    dw Hitbox_KraidArm_5
    dw $FFDA,$0000
    dw Spritemap_KraidArm_RisingSinking_9
    dw Hitbox_KraidArm_A
    dw $0000,$0000
    dw Spritemap_KraidArm_RisingSinking_B
    dw Hitbox_KraidArm_10
    dw $FFD5,$0009
    dw Spritemap_KraidArm_RisingSinking_5
    dw Hitbox_KraidArm_5
    dw $FFD7,$FFFE
    dw Spritemap_KraidArm_RisingSinking_9
    dw Hitbox_KraidArm_A

ExtendedSpritemap_KraidArm_RisingSinking_8:
    dw $0005
    dw $FFD9,$000A
    dw Spritemap_KraidArm_RisingSinking_6
    dw Hitbox_KraidArm_6
    dw $FFDA,$0000
    dw Spritemap_KraidArm_RisingSinking_9
    dw Hitbox_KraidArm_A
    dw $0000,$0000
    dw Spritemap_KraidArm_RisingSinking_B
    dw Hitbox_KraidArm_10
    dw $FFD5,$0009
    dw Spritemap_KraidArm_RisingSinking_5
    dw Hitbox_KraidArm_5
    dw $FFD7,$FFFE
    dw Spritemap_KraidArm_RisingSinking_9
    dw Hitbox_KraidArm_A

ExtendedSpritemap_KraidArm_RisingSinking_9:
    dw $0005
    dw $FFD9,$000A
    dw Spritemap_KraidArm_RisingSinking_6
    dw Hitbox_KraidArm_6
    dw $FFDA,$0000
    dw Spritemap_KraidArm_RisingSinking_9
    dw Hitbox_KraidArm_A
    dw $0000,$0000
    dw Spritemap_KraidArm_RisingSinking_B
    dw Hitbox_KraidArm_10
    dw $FFD6,$0009
    dw Spritemap_KraidArm_RisingSinking_6
    dw Hitbox_KraidArm_6
    dw $FFD6,$FFFE
    dw Spritemap_KraidArm_RisingSinking_9
    dw Hitbox_KraidArm_A

; Dying / preparing to lunge forward
ExtendedSpritemap_KraidArm_Dying_PreparingToLungeForward_0:
    dw $0001
    dw $0000,$0000
    dw Spritemap_KraidArm_Dying_PreparingToLunge_0
    dw Hitbox_KraidArm_Dying_PreparingToLungeForward_0

ExtendedSpritemap_KraidArm_Dying_PreparingToLungeForward_1:
    dw $0001
    dw $0000,$0000
    dw Spritemap_KraidArm_Dying_PreparingToLunge_1
    dw Hitbox_KraidArm_Dying_PreparingToLungeForward_1


;;; $92B5: Hitbox - Kraid lint ;;;
Hitbox_KraidLint:
    dw $0001
    dw $FFE8,$FFFC,$0004,$0006
    dw EnemyTouch_KraidArm_KraidFoot_Normal
    dw RTL_A794B5


if !FEATURE_KEEP_UNREFERENCED
;;; $92C3: Unused. Hitbox - Kraid foot ;;;
UNUSED_Hitbox_KraidFoot:
    dw $0001
    dw $FFF8,$FFF8,$0007,$0007
    dw EnemyTouch_KraidArm_KraidFoot_Normal
    dw RTL_A794B5
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $92D1: Hitboxes - Kraid arm ;;;
Hitbox_KraidArm_0:
    dw $0002
    dw $FFF3,$FFF5,$FFFD,$FFFB
    dw EnemyTouch_KraidArm
    dw EnemyShot_KraidArm
    dw $FFF7,$FFFB,$0001,$0002
    dw EnemyTouch_KraidArm
    dw EnemyShot_KraidArm

Hitbox_KraidArm_1:
    dw $0001
    dw $FFF0,$FFFB,$0001,$0002
    dw EnemyTouch_KraidArm
    dw EnemyShot_KraidArm

Hitbox_KraidArm_2:
    dw $0002
    dw $FFF7,$FFFE,$0001,$0007
    dw EnemyTouch_KraidArm
    dw EnemyShot_KraidArm
    dw $FFF4,$0003,$FFFA,$000C
    dw EnemyTouch_KraidArm
    dw EnemyShot_KraidArm

Hitbox_KraidArm_3:
    dw $0001
    dw $FFFA,$FFFF,$0001,$000E
    dw EnemyTouch_KraidArm
    dw EnemyShot_KraidArm

Hitbox_KraidArm_4:
    dw $0002
    dw $FFFD,$FFFE,$0006,$0009
    dw EnemyTouch_KraidArm
    dw EnemyShot_KraidArm
    dw $0002,$0007,$000B,$000B
    dw EnemyTouch_KraidArm
    dw EnemyShot_KraidArm

Hitbox_KraidArm_5:
    dw $0001
    dw $FFFF,$FFFC,$000E,$0004
    dw EnemyTouch_KraidArm
    dw EnemyShot_KraidArm

Hitbox_KraidArm_6:
    dw $0002
    dw $FFFD,$FFF9,$0006,$0002
    dw EnemyTouch_KraidArm
    dw EnemyShot_KraidArm
    dw $0004,$FFF4,$000A,$FFFF
    dw EnemyTouch_KraidArm
    dw EnemyShot_KraidArm

Hitbox_KraidArm_7:
    dw $0001
    dw $FFFC,$FFF2,$0003,$0001
    dw EnemyTouch_KraidArm_KraidFoot_Normal
    dw EnemyShot_KraidArm

Hitbox_KraidArm_8:
    dw $0001
    dw $FFF1,$FFFB,$0002,$0004
    dw EnemyTouch_KraidArm
    dw EnemyShot_KraidArm

Hitbox_KraidArm_9:
    dw $0002
    dw $FFF5,$0002,$FFFC,$000A
    dw EnemyTouch_KraidArm
    dw EnemyShot_KraidArm
    dw $FFFA,$FFFD,$0003,$0005
    dw EnemyTouch_KraidArm
    dw EnemyShot_KraidArm

Hitbox_KraidArm_A:
    dw $0001
    dw $FFFC,$FFFE,$0003,$000D
    dw EnemyTouch_KraidArm
    dw EnemyShot_KraidArm

Hitbox_KraidArm_B:
    dw $0002
    dw $0003,$0002,$000A,$000B
    dw EnemyTouch_KraidArm_KraidFoot_Normal
    dw EnemyShot_KraidArm
    dw $FFFD,$FFFD,$0005,$0005
    dw EnemyTouch_KraidArm_KraidFoot_Normal
    dw EnemyShot_KraidArm

Hitbox_KraidArm_C:
    dw $0001
    dw $FFFD,$FFFB,$000E,$0004
    dw EnemyTouch_KraidArm_KraidFoot_Normal
    dw EnemyShot_KraidArm

Hitbox_KraidArm_D:
    dw $0002
    dw $0002,$FFF4,$000B,$FFFC
    dw EnemyTouch_KraidArm_KraidFoot_Normal
    dw EnemyShot_KraidArm
    dw $FFFD,$FFF9,$0004,$0002
    dw EnemyTouch_KraidArm_KraidFoot_Normal
    dw EnemyShot_KraidArm

Hitbox_KraidArm_E:
    dw $0001
    dw $FFFC,$FFF1,$0005,$0002
    dw EnemyTouch_KraidArm_KraidFoot_Normal
    dw EnemyShot_KraidArm

Hitbox_KraidArm_F:
    dw $0002
    dw $FFF4,$FFF4,$FFFD,$FFFD
    dw EnemyTouch_KraidArm
    dw EnemyShot_KraidArm
    dw $FFFA,$FFFA,$0003,$0002
    dw EnemyTouch_KraidArm
    dw EnemyShot_KraidArm

Hitbox_KraidArm_10:
    dw $0001
    dw $FFD3,$FFF7,$0004,$0008
    dw EnemyTouch_KraidArm_KraidFoot_Normal
    dw EnemyShot_KraidArm

Hitbox_KraidArm_11:
    dw $0002
    dw $FFE4,$FFEF,$FFF4,$0000
    dw EnemyTouch_KraidArm_KraidFoot_Normal
    dw EnemyShot_KraidArm
    dw $FFD6,$FFE9,$FFE4,$FFFA
    dw EnemyTouch_KraidArm_KraidFoot_Normal
    dw EnemyShot_KraidArm

Hitbox_KraidArm_12:
    dw $0002
    dw $FFEA,$FFE7,$FFF8,$FFFB
    dw EnemyTouch_KraidArm_KraidFoot_Normal
    dw EnemyShot_KraidArm
    dw $FFDD,$FFDD,$FFED,$FFEF
    dw EnemyTouch_KraidArm_KraidFoot_Normal
    dw EnemyShot_KraidArm


;;; $9453: Hitbox - Kraid foot ;;;
Hitbox_KraidFoot:
    dw $0001
    dw $FFFA,$FFFA,$0006,$0006
    dw EnemyTouch_KraidArm_KraidFoot_Normal
    dw RTL_A794B5


if !FEATURE_KEEP_UNREFERENCED
;;; $9461: Unused. Hitbox - Kraid foot ;;;
UNUSED_Hitbox_KraidFoot_A79461:
    dw $0001
    dw $FFFE,$FFFD,$0002,$0003
    dw EnemyTouch_KraidArm_KraidFoot_Normal
    dw RTL_A794B5
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $946F: Hitboxes - Kraid arm - dying / preparing to lunge forward ;;;
Hitbox_KraidArm_Dying_PreparingToLungeForward_0:
    dw $0001
    dw $FFC0,$FFD0,$FFE0,$FFF0
    dw EnemyTouch_KraidArm_KraidFoot_Normal
    dw EnemyShot_KraidArm

Hitbox_KraidArm_Dying_PreparingToLungeForward_1:
    dw $0001
    dw $FFC0,$FFFC,$0000,$0004
    dw EnemyTouch_KraidArm_KraidFoot_Normal
    dw EnemyShot_KraidArm


;;; $948B: Enemy touch - Kraid arm/foot - normal ;;;
EnemyTouch_KraidArm_KraidFoot_Normal:
    JSL NormalEnemyTouchAI                                             ; fallthrough to RTL_A7948F


RTL_A7948F:
    RTL


;;; $9490: Enemy touch - enemy $E2FF (Kraid arm) ;;;
EnemyTouch_KraidArm:
    LDA.W SamusInvincibilityTimer : BEQ .SamusInvincible
    RTL

  .SamusInvincible:
    JSR PushSamusBack
    LDA.W #Function_KraidLint_FireLint : STA.W Enemy[4].var0
; fallthrough to EnemyTouch_Kraid


;;; $949F: Enemy touch - enemy $E2BF (Kraid) ;;;
EnemyTouch_Kraid:
    JSL NormalEnemyTouchAI_NoDeathCheck_External
    RTL


;;; $94A4: Push Samus back ;;;
PushSamusBack:
    LDA.W #$0004 : STA.W ExtraSamusXDisplacement
    LDA.W #$FFF8 : STA.W ExtraSamusYDisplacement
    RTS


;;; $94B1: Normal enemy shot ;;;
NormalEnemyShot:
    JSL NormalEnemyShotAI
; fallthrough to RTL_A794B5


RTL_A794B5:
    RTL


;;; $94B6: Enemy shot - Kraid arm ;;;
EnemyShot_KraidArm:
    TYX
    JSR SpawnExplosionProjectile
    LDA.W SamusProjectile_Directions,Y : ORA.W #$0010 : STA.W SamusProjectile_Directions,Y
    RTL


if !FEATURE_KEEP_UNREFERENCED
;;; $94C4: Unused. Spritemap - Kraid lint ;;;
UNUSED_Spritemap_KraidLint_A794C4:
    dw $0004
    %spritemapEntry(0, $00, $08, 0, 0, 2, 0, $1C2)
    %spritemapEntry(1, $1F0, $00, 0, 0, 2, 0, $1B0)
    %spritemapEntry(1, $00, $F8, 0, 0, 2, 0, $1A2)
    %spritemapEntry(1, $1F0, $F8, 0, 0, 2, 0, $1A0)


;;; $94DA: Unused. Spritemap - Kraid foot ;;;
UNUSED_Spritemap_KraidFoot_A794DA:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $1A9)
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $94E1: Spritemaps - Kraid arm - general ;;;
Spritemap_KraidArm_General_0:
    dw $0001
    %spritemapEntry(1, $1F2, $F4, 0, 0, 3, 0, $126)

Spritemap_KraidArm_General_1:
    dw $0002
    %spritemapEntry(0, $1F9, $FB, 0, 0, 3, 0, $129)
    %spritemapEntry(0, $1F1, $FB, 0, 0, 3, 0, $128)

Spritemap_KraidArm_General_2:
    dw $0001
    %spritemapEntry(1, $1F2, $FD, 0, 0, 3, 0, $12A)

Spritemap_KraidArm_General_3:
    dw $0002
    %spritemapEntry(0, $1FA, $07, 0, 0, 3, 0, $139)
    %spritemapEntry(0, $1FA, $FF, 0, 0, 3, 0, $138)

Spritemap_KraidArm_General_4:
    dw $0001
    %spritemapEntry(1, $1FD, $FD, 1, 1, 3, 0, $126)

Spritemap_KraidArm_General_5:
    dw $0002
    %spritemapEntry(0, $1FF, $FD, 1, 1, 3, 0, $129)
    %spritemapEntry(0, $07, $FD, 1, 1, 3, 0, $128)

Spritemap_KraidArm_General_6:
    dw $0001
    %spritemapEntry(1, $1FD, $F4, 1, 1, 3, 0, $12A)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_KraidArm_General_A79521:
    dw $0002
    %spritemapEntry(0, $1FC, $F2, 1, 1, 3, 0, $139)
    %spritemapEntry(0, $1FC, $FA, 1, 1, 3, 0, $138)
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_KraidArm_General_7:
    dw $0002
    %spritemapEntry(0, $1FA, $FC, 1, 1, 3, 0, $12E)
    %spritemapEntry(0, $1F2, $FC, 1, 0, 3, 0, $12E)

Spritemap_KraidArm_General_8:
    dw $0001
    %spritemapEntry(1, $1F4, $FC, 1, 0, 3, 0, $12C)

Spritemap_KraidArm_General_9:
    dw $0002
    %spritemapEntry(0, $1FC, $06, 1, 0, 3, 0, $13E)
    %spritemapEntry(0, $1FC, $FE, 0, 0, 3, 0, $13E)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_KraidArm_General_A7954C:
    dw $0001
    %spritemapEntry(1, $1FC, $FC, 0, 0, 3, 0, $12C)

UNUSED_Spritemap_KraidArm_General_A79553:
    dw $0002
    %spritemapEntry(0, $06, $FC, 0, 1, 3, 0, $12E)
    %spritemapEntry(0, $1FE, $FC, 0, 0, 3, 0, $12E)

UNUSED_Spritemap_KraidArm_General_A7955F:
    dw $0001
    %spritemapEntry(1, $1FC, $F4, 0, 1, 3, 0, $12C)

UNUSED_Spritemap_KraidArm_General_A79566:
    dw $0002
    %spritemapEntry(0, $1FD, $FA, 1, 1, 3, 0, $13E)
    %spritemapEntry(0, $1FD, $F2, 0, 1, 3, 0, $13E)
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_KraidArm_General_A:
    dw $0001
    %spritemapEntry(1, $1F4, $F4, 0, 0, 3, 0, $12C)

Spritemap_KraidArm_General_B:
    dw $0003
    %spritemapEntry(1, $1F4, $F8, 0, 0, 3, 0, $104)
    %spritemapEntry(1, $1E4, $F8, 0, 0, 3, 0, $102)
    %spritemapEntry(1, $1D4, $F8, 0, 0, 3, 0, $100)

Spritemap_KraidArm_General_C:
    dw $0008
    %spritemapEntry(0, $1EC, $00, 0, 0, 3, 0, $11C)
    %spritemapEntry(0, $1FC, $F0, 0, 0, 3, 0, $10F)
    %spritemapEntry(0, $1F4, $F0, 0, 0, 3, 0, $10E)
    %spritemapEntry(0, $1E4, $E8, 0, 0, 3, 0, $10D)
    %spritemapEntry(0, $1DC, $F8, 0, 0, 3, 0, $10C)
    %spritemapEntry(1, $1F4, $F8, 0, 0, 3, 0, $10A)
    %spritemapEntry(1, $1E4, $F0, 0, 0, 3, 0, $108)
    %spritemapEntry(1, $1D4, $E8, 0, 0, 3, 0, $106)

Spritemap_KraidArm_General_D:
    dw $0008
    %spritemapEntry(0, $1FC, $ED, 0, 0, 3, 0, $13F)
    %spritemapEntry(0, $1EC, $FD, 0, 0, 3, 0, $12F)
    %spritemapEntry(0, $1EC, $F5, 0, 0, 3, 0, $11F)
    %spritemapEntry(0, $1EC, $DD, 0, 0, 3, 0, $11E)
    %spritemapEntry(0, $1E4, $ED, 0, 0, 3, 0, $11D)
    %spritemapEntry(1, $1F4, $F5, 0, 0, 3, 0, $124)
    %spritemapEntry(1, $1EC, $E5, 0, 0, 3, 0, $122)
    %spritemapEntry(1, $1DC, $DD, 0, 0, 3, 0, $120)


;;; $95DE: Spritemaps - Kraid foot ;;;
Spritemap_KraidFoot_0:
    dw $0008
    %spritemapEntry(1, $20, $1C, 0, 0, 3, 0, $15A)
    %spritemapEntry(1, $20, $14, 0, 0, 3, 0, $14A)
    %spritemapEntry(1, $10, $1C, 0, 0, 3, 0, $148)
    %spritemapEntry(0, $1F8, $0C, 0, 0, 3, 0, $14C)
    %spritemapEntry(1, $10, $0C, 0, 0, 3, 0, $146)
    %spritemapEntry(1, $00, $0C, 0, 0, 3, 0, $144)
    %spritemapEntry(1, $08, $FC, 0, 0, 3, 0, $142)
    %spritemapEntry(1, $1F8, $FC, 0, 0, 3, 0, $140)

Spritemap_KraidFoot_1:
    dw $0008
    %spritemapEntry(1, $12, $28, 0, 0, 3, 0, $168)
    %spritemapEntry(1, $0A, $28, 0, 0, 3, 0, $167)
    %spritemapEntry(1, $10, $18, 0, 0, 3, 0, $182)
    %spritemapEntry(1, $00, $18, 0, 0, 3, 0, $180)
    %spritemapEntry(1, $08, $08, 0, 0, 3, 0, $165)
    %spritemapEntry(1, $1F8, $08, 0, 0, 3, 0, $163)
    %spritemapEntry(1, $00, $F8, 0, 0, 3, 0, $161)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 0, $160)

Spritemap_KraidFoot_2:
    dw $0008
    %spritemapEntry(1, $1F9, $2C, 0, 0, 3, 0, $1AD)
    %spritemapEntry(1, $1F8, $1C, 0, 0, 3, 0, $18D)
    %spritemapEntry(1, $1F8, $0C, 0, 0, 3, 0, $16D)
    %spritemapEntry(1, $1F8, $FC, 0, 0, 3, 0, $14D)
    %spritemapEntry(1, $01, $2C, 0, 0, 3, 0, $1AE)
    %spritemapEntry(1, $00, $1C, 0, 0, 3, 0, $18E)
    %spritemapEntry(1, $00, $0C, 0, 0, 3, 0, $16E)
    %spritemapEntry(1, $00, $FC, 0, 0, 3, 0, $14E)

Spritemap_KraidFoot_3:
    dw $0008
    %spritemapEntry(1, $1F0, $2C, 0, 0, 3, 0, $1A5)
    %spritemapEntry(1, $1E8, $2C, 0, 0, 3, 0, $1A4)
    %spritemapEntry(1, $1F8, $1C, 0, 0, 3, 0, $1CE)
    %spritemapEntry(1, $1E8, $1C, 0, 0, 3, 0, $1CC)
    %spritemapEntry(1, $00, $0C, 0, 0, 3, 0, $17A)
    %spritemapEntry(1, $1F0, $0C, 0, 0, 3, 0, $188)
    %spritemapEntry(1, $00, $FC, 0, 0, 3, 0, $186)
    %spritemapEntry(1, $1F0, $FC, 0, 0, 3, 0, $184)

Spritemap_KraidFoot_4:
    dw $000C
    %spritemapEntry(0, $1D8, $F4, 0, 0, 3, 0, $1C3)
    %spritemapEntry(0, $18, $F4, 0, 0, 3, 0, $19A)
    %spritemapEntry(1, $00, $F4, 0, 0, 3, 0, $1C8)
    %spritemapEntry(1, $1F0, $F4, 0, 0, 3, 0, $1C6)
    %spritemapEntry(1, $1E0, $F4, 0, 0, 3, 0, $1C4)
    %spritemapEntry(1, $1D0, $FC, 0, 0, 3, 0, $1A7)
    %spritemapEntry(1, $20, $FC, 0, 0, 3, 0, $1AB)
    %spritemapEntry(1, $20, $F4, 0, 0, 3, 0, $19B)
    %spritemapEntry(1, $10, $FC, 0, 0, 3, 0, $1DA)
    %spritemapEntry(1, $00, $FC, 0, 0, 3, 0, $1D8)
    %spritemapEntry(1, $1F0, $FC, 0, 0, 3, 0, $1D6)
    %spritemapEntry(1, $1E0, $FC, 0, 0, 3, 0, $1D4)


;;; $96C4: Unused. Spritemaps - Kraid foot ;;;
if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_KraidFoot_A796C4:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $1D0)

UNUSED_Spritemap_KraidFoot_A796CB:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 0, $1D2)
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $96D2: Kraid instruction list - roar ;;;
InstList_Kraid_Roar_0:
    dw $000A                                                             ; Timer
    dw Tilemap_KraidHead_0                                               ; Tilemap
    dw Hitbox_KraidMouth_0                                               ; Vulnerable mouth hitbox
    dw $FFFF                                                             ; Invulnerable mouth hitbox

InstList_Kraid_Roar_1:
    dw $000A                                                             ; Timer
    dw Tilemap_KraidHead_1                                               ; Tilemap
    dw Hitbox_KraidMouth_1                                               ; Vulnerable mouth hitbox
    dw Hitbox_KraidMouth_5                                               ; Invulnerable mouth hitbox

InstList_Kraid_Roar_2:
    dw $000A                                                             ; Timer
    dw Tilemap_KraidHead_2                                               ; Tilemap
    dw Hitbox_KraidMouth_2                                               ; Vulnerable mouth hitbox
    dw Hitbox_KraidMouth_6                                               ; Invulnerable mouth hitbox

InstList_Kraid_Roar_3:
    dw Instruction_Kraid_PlayRoarSFX

InstList_Kraid_Roar_4:
    dw $0040                                                             ; Timer
    dw Tilemap_KraidHead_3                                               ; Tilemap
    dw Hitbox_KraidMouth_3                                               ; Vulnerable mouth hitbox
    dw Hitbox_KraidMouth_7                                               ; Invulnerable mouth hitbox

InstList_Kraid_Roar_5:
    dw $000A                                                             ; Timer
    dw Tilemap_KraidHead_2                                               ; Tilemap
    dw Hitbox_KraidMouth_2                                               ; Vulnerable mouth hitbox
    dw Hitbox_KraidMouth_6                                               ; Invulnerable mouth hitbox

InstList_Kraid_Roar_6:
    dw $000A                                                             ; Timer
    dw Tilemap_KraidHead_1                                               ; Tilemap
    dw Hitbox_KraidMouth_1                                               ; Vulnerable mouth hitbox
    dw Hitbox_KraidMouth_5                                               ; Invulnerable mouth hitbox

InstList_Kraid_Roar_7:
    dw $000A                                                             ; Timer
    dw Tilemap_KraidHead_0                                               ; Tilemap
    dw Hitbox_KraidMouth_0                                               ; Vulnerable mouth hitbox
    dw $FFFF                                                             ; Invulnerable mouth hitbox

InstList_Kraid_Roar_8:
    dw $FFFF


;;; $970E: Kraid instruction list - dying roar ;;;
InstList_Kraid_DyingRoar_0:
    dw $0014                                                             ; Timer
    dw Tilemap_KraidHead_0                                               ; Tilemap
    dw Hitbox_KraidMouth_0                                               ; Vulnerable mouth hitbox
    dw $FFFF                                                             ; Invulnerable mouth hitbox

InstList_Kraid_DyingRoar_1:
    dw $0014                                                             ; Timer
    dw Tilemap_KraidHead_1                                               ; Tilemap
    dw Hitbox_KraidMouth_1                                               ; Vulnerable mouth hitbox
    dw Hitbox_KraidMouth_5                                               ; Invulnerable mouth hitbox
    dw $0014                                                             ; Timer
    dw Tilemap_KraidHead_2                                               ; Tilemap
    dw Hitbox_KraidMouth_2                                               ; Vulnerable mouth hitbox
    dw Hitbox_KraidMouth_6                                               ; Invulnerable mouth hitbox
    dw Instruction_Kraid_PlayRoarSFX
    dw $00C0                                                             ; Timer
    dw Tilemap_KraidHead_3                                               ; Tilemap
    dw Hitbox_KraidMouth_3                                               ; Vulnerable mouth hitbox
    dw Hitbox_KraidMouth_7                                               ; Invulnerable mouth hitbox
    dw $0014                                                             ; Timer
    dw Tilemap_KraidHead_2                                               ; Tilemap
    dw Hitbox_KraidMouth_2                                               ; Vulnerable mouth hitbox
    dw Hitbox_KraidMouth_6                                               ; Invulnerable mouth hitbox
    dw $0014                                                             ; Timer
    dw Tilemap_KraidHead_1                                               ; Tilemap
    dw Hitbox_KraidMouth_1                                               ; Vulnerable mouth hitbox
    dw Hitbox_KraidMouth_5                                               ; Invulnerable mouth hitbox
    dw $0014                                                             ; Timer
    dw Tilemap_KraidHead_0                                               ; Tilemap
    dw Hitbox_KraidMouth_0                                               ; Vulnerable mouth hitbox
    dw $FFFF                                                             ; Invulnerable mouth hitbox
    dw $FFFF


;;; $974A: Kraid instruction list - eye glowing ;;;
InstList_Kraid_EyeGlowing_0:
    dw $0005                                                             ; Timer
    dw Tilemap_KraidHead_0                                               ; Tilemap
    dw Hitbox_KraidMouth_0                                               ; Vulnerable mouth hitbox
    dw $FFFF                                                             ; Invulnerable mouth hitbox

InstList_Kraid_EyeGlowing_1:
    dw $000A                                                             ; Timer
    dw Tilemap_KraidHead_1                                               ; Tilemap
    dw Hitbox_KraidMouth_1                                               ; Vulnerable mouth hitbox
    dw Hitbox_KraidMouth_5                                               ; Invulnerable mouth hitbox
    dw $0005                                                             ; Timer
    dw Tilemap_KraidHead_0                                               ; Tilemap
    dw Hitbox_KraidMouth_0                                               ; Vulnerable mouth hitbox
    dw $FFFF                                                             ; Invulnerable mouth hitbox
    dw $FFFF


;;; $9764: Kraid instruction list - dying ;;;
InstList_Kraid_Dying_0:
    dw $0019                                                             ; Timer
    dw Tilemap_KraidHead_0                                               ; Tilemap
    dw Hitbox_KraidMouth_0                                               ; Vulnerable mouth hitbox
    dw $FFFF                                                             ; Invulnerable mouth hitbox

InstList_Kraid_Dying_1:
    dw $0019                                                             ; Timer
    dw Tilemap_KraidHead_1                                               ; Tilemap
    dw Hitbox_KraidMouth_1                                               ; Vulnerable mouth hitbox
    dw Hitbox_KraidMouth_5                                               ; Invulnerable mouth hitbox
    dw $0019                                                             ; Timer
    dw Tilemap_KraidHead_2                                               ; Tilemap
    dw Hitbox_KraidMouth_2                                               ; Vulnerable mouth hitbox
    dw Hitbox_KraidMouth_6                                               ; Invulnerable mouth hitbox
    dw Instruction_Kraid_PlayDyingSFX
    dw $0040                                                             ; Timer
    dw Tilemap_KraidHead_3                                               ; Tilemap
    dw Hitbox_KraidMouth_3                                               ; Vulnerable mouth hitbox
    dw Hitbox_KraidMouth_7                                               ; Invulnerable mouth hitbox
    dw $FFFF


;;; $9788: Kraid mouth hitboxes ;;;
;        _____________________ Left
;       |      _______________ Top
;       |     |      _________ Right
;       |     |     |      ___ Bottom
;       |     |     |     |
Hitbox_KraidMouth_0:
    dw $0010,$FF88,$0028,$FFA8

Hitbox_KraidMouth_1:
    dw $0010,$FF88,$0028,$FF98

Hitbox_KraidMouth_2:
    dw $0010,$FF80,$0028,$FF90

Hitbox_KraidMouth_3:
    dw $0010,$FF80,$0028,$FF88

Hitbox_KraidMouth_4:
    dw $0000,$0000,$0000,$0000 ; <-- Unused

Hitbox_KraidMouth_5:
    dw $0006,$FFA0,$0020,$FFB0

Hitbox_KraidMouth_6:
    dw $0000,$FF98,$0020,$FFB0

Hitbox_KraidMouth_7:
    dw $0000,$FF90,$0020,$FFB0


;;; $97C8: Kraid head tilemaps ;;;
; The last row of each of these tilemaps isn't actually drawn
Tilemap_KraidHead_0:
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$3C00,$3C01,$3C02,$3C03
    dw $3C04,$3C05,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$3C06,$3C07,$3C08,$3C09,$3C0A,$3C0B
    dw $3C0C,$3C0D,$3C0E,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$3C0F,$3C10,$3C11,$3C12,$3C13,$3C14
    dw $3C15,$3C16,$3C17,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$3C18,$3C19,$3C1A,$3C1B,$3C1C,$3C1D,$3C1E
    dw $3C1F,$3C20,$3C21,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$3C22,$3C23,$3C24,$3C25,$3C26,$3C27,$3C28
    dw $3C29,$3C2A,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $3C2B,$3C2C,$3C2D,$3C2E,$3C2F,$3C30,$3C31,$3C32
    dw $3C33,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$3C34,$3C35,$3C36,$3C37,$3C38,$3C39,$3C3A
    dw $3C3B,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$3C3C
    dw $3C3D,$3C3E,$3C3F,$3C40,$3C41,$3C42,$3C43,$3C44
    dw $3C45,$3C46,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$3C47
    dw $3C48,$3C49,$3C4A,$3C4B,$3C4C,$3C4D,$3C4E,$3C4F
    dw $3C50,$3C51,$3C52,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$3C53
    dw $3C54,$3C55,$3C56,$3C57,$3C58,$3C59,$3C5A,$3C5B
    dw $3C5C,$3C5D,$3C5E,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$3C5F
    dw $3C60,$3C61,$3D50,$3D50,$3C62,$3C63,$3C64,$3C65
    dw $3C66,$3C67,$3C68,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$3C69,$3C6A
    dw $3D50,$3D50,$3D50,$3C6B,$3C6C,$3C6D,$3C6E,$3C6F
    dw $3C70,$3C71,$3C72,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338

Tilemap_KraidHead_1:
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$3C73,$3C74,$3C75,$3C76
    dw $3C77,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$3C78,$3C79,$3C7A,$3C7B,$3C7C
    dw $3C7D,$3C7E,$3C7F,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$3C80,$3C81,$3C82,$3C83,$3C84,$3C85
    dw $3C86,$3C87,$3C88,$3C89,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$3C8A,$3C8B,$3C8C,$3C8D,$3C8E,$3C8F,$3C90
    dw $3C91,$3C92,$3C93,$3C94,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$3C95
    dw $0338,$3C96,$3C97,$3C98,$3C99,$3C9A,$3C9B,$3C9C
    dw $3C9D,$3C9E,$3C9F,$3CA0,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$3CA1
    dw $3CA2,$3CA3,$3CA4,$3CA5,$3CA6,$3CA7,$3CA8,$3CA9
    dw $3CAA,$3CAB,$3CAC,$3CAD,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$3CAE
    dw $3CAF,$3CB0,$3CB1,$3CB2,$3CB3,$3CB4,$3C43,$3C44
    dw $3C45,$3C46,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $3CB5,$3CB6,$3CB7,$3CB8,$3C4C,$3C4D,$3C4E,$3C4F
    dw $3C50,$3C51,$3C52,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$3CB9
    dw $3CBA,$3CBB,$3C56,$3C57,$3C58,$3C59,$3C5A,$3C5B
    dw $3C5C,$3C5D,$3C5E,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$3C5F
    dw $3C60,$3C61,$3D50,$3D50,$3C62,$3C63,$3C64,$3C65
    dw $3C66,$3C67,$3C68,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$3C69,$3C6A
    dw $3D50,$3D50,$3D50,$3C6B,$3C6C,$3C6D,$3C6E,$3C6F
    dw $3C70,$3C71,$3C72,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338

Tilemap_KraidHead_2:
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$3CBC,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$3CBD,$3CBE,$3CBF,$3CC0
    dw $3CC1,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$3CC2,$3CC3,$3CC4,$3CC5,$3CC6,$3CC7
    dw $3CC8,$3CC9,$3CCA,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $3CCB,$3CCC,$3CCD,$3CCE,$3CCF,$3CD0,$3CD1,$3CD2
    dw $3CD3,$3CD4,$3D43,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$3CD5
    dw $3CD6,$3CD7,$3CD8,$3CD9,$3CDA,$3CDB,$3CDC,$3CDD
    dw $3CDE,$3CDF,$3CE0,$3CE1,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$3CE2
    dw $3CE3,$3CE4,$3CE5,$3CE6,$3CE7,$3CE8,$3CE9,$3CEA
    dw $3CEB,$3CEC,$3CED,$3CEE,$3CEF,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$3CF0,$3CF1,$3CF2,$3CF3,$3CF4,$3CF5
    dw $3CF6,$3CF7,$3CF8,$3CF9,$3CFA,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $3CFB,$3CFC,$3CB7,$3CFD,$3CFE,$3C4D,$3C4E,$3C4F
    dw $3C50,$3C51,$3CFF,$3D00,$3D44,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$3CB9
    dw $3CBA,$3CBB,$3C56,$3C57,$3C58,$3C59,$3C5A,$3C5B
    dw $3C5C,$3C5D,$3C5E,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$3C5F
    dw $3C60,$3C61,$3D50,$3D50,$3C62,$3C63,$3C64,$3C65
    dw $3C66,$3C67,$3C68,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$3C69,$3C6A
    dw $3D50,$3D50,$3D50,$3C6B,$3C6C,$3C6D,$3C6E,$3C6F
    dw $3C70,$3C71,$3C72,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338

Tilemap_KraidHead_3:
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $3D01,$3D02,$0338,$3D03,$3D04,$3D05,$3D06,$3D07
    dw $3D08,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $3D09,$3D0A,$3D0B,$3D0C,$3D0D,$3D0E,$3D0F,$3D10
    dw $3D11,$3D12,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $3D13,$3D14,$3D15,$3D16,$3D17,$3D18,$3D19,$3D1A
    dw $3D1B,$3D1C,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$3D1D,$3D1E,$3D1F,$3D20,$3D21,$3D22
    dw $3D23,$3D24,$3D25,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$3D26,$3D27,$3D28,$3D29,$3D2A,$3D2B
    dw $3D2C,$3D2D,$3D2E,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $3D2F,$3D30,$3CB7,$3D31,$3D32,$3D33,$3D34,$3D35
    dw $3D36,$3C51,$3D37,$3D38,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$3CB9
    dw $3CBA,$3CBB,$3C56,$3C57,$3C58,$3C59,$3D39,$3D3A
    dw $3D3B,$3D3C,$3D3D,$3D3E,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$3C5F
    dw $3C60,$3C61,$3D50,$3D50,$3C62,$3C63,$3C64,$3C65
    dw $3C66,$3D3F,$3D40,$3D41,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$3C69,$3C6A
    dw $3D50,$3D50,$3D50,$3C6B,$3C6C,$3C6D,$3C6E,$3C6F
    dw $3C70,$3C71,$3D42,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338


;;; $A3C8: Unused. Extended spritemaps - Kraid arm ;;;
if !FEATURE_KEEP_UNREFERENCED
UNUSED_ExtendedSpritemap_KraidArm_A7A3C8:
    dw $0002
    dw $0000,$0000
    dw Spritemap_KraidArm_RisingSinking_A
    dw Hitbox_KraidArm_F
    dw $FFF7,$FFF6
    dw Spritemap_KraidArm_RisingSinking_0
    dw Hitbox_KraidArm_0

UNUSED_ExtendedSpritemap_KraidArm_A7A3DA:
    dw $0002
    dw $FFF9,$FFF8
    dw Spritemap_KraidArm_RisingSinking_1
    dw Hitbox_KraidArm_1
    dw $0001,$0000
    dw Spritemap_KraidArm_RisingSinking_A
    dw Hitbox_KraidArm_F

UNUSED_ExtendedSpritemap_KraidArm_A7A3EC:
    dw $0002
    dw $FFF6,$0001
    dw Spritemap_KraidArm_RisingSinking_1
    dw Hitbox_KraidArm_1
    dw $0000,$0000
    dw Spritemap_KraidArm_RisingSinking_7
    dw Hitbox_KraidArm_8

UNUSED_ExtendedSpritemap_KraidArm_A7A3FE:
    dw $0002
    dw $FFF6,$0000
    dw Spritemap_KraidArm_RisingSinking_2
    dw Hitbox_KraidArm_2
    dw $0000,$0000
    dw Spritemap_KraidArm_RisingSinking_7
    dw Hitbox_KraidArm_8

UNUSED_ExtendedSpritemap_KraidArm_A7A410:
    dw $0002
    dw $FFF6,$0000
    dw Spritemap_KraidArm_RisingSinking_3
    dw Hitbox_KraidArm_3
    dw $0000,$0000
    dw Spritemap_KraidArm_RisingSinking_7
    dw Hitbox_KraidArm_8

UNUSED_ExtendedSpritemap_KraidArm_A7A422:
    dw $0002
    dw $FFFA,$0006
    dw Spritemap_KraidArm_RisingSinking_3
    dw Hitbox_KraidArm_3
    dw $0000,$0000
    dw Spritemap_KraidArm_RisingSinking_8
    dw Hitbox_KraidArm_9

UNUSED_ExtendedSpritemap_KraidArm_A7A434:
    dw $0002
    dw $FFF8,$0006
    dw Spritemap_KraidArm_RisingSinking_4
    dw Hitbox_KraidArm_4
    dw $0000,$0000
    dw Spritemap_KraidArm_RisingSinking_8
    dw Hitbox_KraidArm_9

UNUSED_ExtendedSpritemap_KraidArm_A7A446:
    dw $0002
    dw $FFF8,$0006
    dw Spritemap_KraidArm_RisingSinking_5
    dw Hitbox_KraidArm_5
    dw $0000,$0000
    dw Spritemap_KraidArm_RisingSinking_8
    dw Hitbox_KraidArm_9

UNUSED_ExtendedSpritemap_KraidArm_A7A458:
    dw $0002
    dw $FFFF,$000C
    dw Spritemap_KraidArm_RisingSinking_5
    dw Hitbox_KraidArm_5
    dw $0000,$0000
    dw Spritemap_KraidArm_RisingSinking_9
    dw Hitbox_KraidArm_A

UNUSED_ExtendedSpritemap_KraidArm_A7A46A:
    dw $0002
    dw $0000,$000B
    dw Spritemap_KraidArm_RisingSinking_6
    dw Hitbox_KraidArm_6
    dw $0000,$0000
    dw Spritemap_KraidArm_RisingSinking_9
    dw Hitbox_KraidArm_A
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $A47C: Spritemaps - Kraid arm - rising/sinking ;;;
Spritemap_KraidArm_RisingSinking_0:
    dw $0001
    %spritemapEntry(1, $1F2, $F4, 0, 0, 2, 0, $126)

Spritemap_KraidArm_RisingSinking_1:
    dw $0002
    %spritemapEntry(0, $1F9, $FB, 0, 0, 2, 0, $129)
    %spritemapEntry(0, $1F1, $FB, 0, 0, 2, 0, $128)

Spritemap_KraidArm_RisingSinking_2:
    dw $0001
    %spritemapEntry(1, $1F2, $FD, 0, 0, 2, 0, $12A)

Spritemap_KraidArm_RisingSinking_3:
    dw $0002
    %spritemapEntry(0, $1FA, $07, 0, 0, 2, 0, $139)
    %spritemapEntry(0, $1FA, $FF, 0, 0, 2, 0, $138)

Spritemap_KraidArm_RisingSinking_4:
    dw $0001
    %spritemapEntry(1, $1FD, $FD, 1, 1, 2, 0, $126)

Spritemap_KraidArm_RisingSinking_5:
    dw $0002
    %spritemapEntry(0, $1FF, $FD, 1, 1, 2, 0, $129)
    %spritemapEntry(0, $07, $FD, 1, 1, 2, 0, $128)

Spritemap_KraidArm_RisingSinking_6:
    dw $0001
    %spritemapEntry(1, $1FD, $F4, 1, 1, 2, 0, $12A)

Spritemap_KraidArm_RisingSinking_7:
    dw $0002
    %spritemapEntry(0, $1FA, $FC, 1, 1, 2, 0, $12E)
    %spritemapEntry(0, $1F2, $FC, 1, 0, 2, 0, $12E)

Spritemap_KraidArm_RisingSinking_8:
    dw $0001
    %spritemapEntry(1, $1F4, $FC, 1, 0, 2, 0, $12C)

Spritemap_KraidArm_RisingSinking_9:
    dw $0002
    %spritemapEntry(0, $1FC, $06, 1, 0, 2, 0, $13E)
    %spritemapEntry(0, $1FC, $FE, 0, 0, 2, 0, $13E)

Spritemap_KraidArm_RisingSinking_A:
    dw $0001
    %spritemapEntry(1, $1F4, $F4, 0, 0, 2, 0, $12C)


;;; $A4E2: Unused. Extended spritemaps - Kraid arm ;;;
UNUSED_ExtendedSpritemap_KraidArm_A7A4E2:
    dw $0001
    dw $0000,$0000
    dw Spritemap_KraidArm_RisingSinking_D
    dw Hitbox_KraidArm_12

UNUSED_ExtendedSpritemap_KraidArm_A7A4EC:
    dw $0001
    dw $0000,$0000
    dw Spritemap_KraidArm_RisingSinking_C
    dw Hitbox_KraidArm_11

UNUSED_ExtendedSpritemap_KraidArm_A7A4F6:
    dw $0001
    dw $0000,$0000
    dw Spritemap_KraidArm_RisingSinking_B
    dw Hitbox_KraidArm_10


;;; $A500: Spritemaps - Kraid arm - rising/sinking ;;;
Spritemap_KraidArm_RisingSinking_B:
    dw $0003
    %spritemapEntry(1, $1F4, $F8, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $1E4, $F8, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1D4, $F8, 0, 0, 2, 0, $100)

Spritemap_KraidArm_RisingSinking_C:
    dw $0008
    %spritemapEntry(0, $1EC, $00, 0, 0, 2, 0, $11C)
    %spritemapEntry(0, $1FC, $F0, 0, 0, 2, 0, $10F)
    %spritemapEntry(0, $1F4, $F0, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $1E4, $E8, 0, 0, 2, 0, $10D)
    %spritemapEntry(0, $1DC, $F8, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1F4, $F8, 0, 0, 2, 0, $10A)
    %spritemapEntry(1, $1E4, $F0, 0, 0, 2, 0, $108)
    %spritemapEntry(1, $1D4, $E8, 0, 0, 2, 0, $106)

Spritemap_KraidArm_RisingSinking_D:
    dw $0008
    %spritemapEntry(0, $1FC, $ED, 0, 0, 2, 0, $13F)
    %spritemapEntry(0, $1EC, $FD, 0, 0, 2, 0, $12F)
    %spritemapEntry(0, $1EC, $F5, 0, 0, 2, 0, $11F)
    %spritemapEntry(0, $1EC, $DD, 0, 0, 2, 0, $11E)
    %spritemapEntry(0, $1E4, $ED, 0, 0, 2, 0, $11D)
    %spritemapEntry(1, $1F4, $F5, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $1EC, $E5, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $1DC, $DD, 0, 0, 2, 0, $120)


;;; $A565: Extended spritemap - Kraid foot - initial ;;;
ExtendedSpritemap_KraidFoot_Initial:
    dw $0002
    dw $0008,$0028
    dw Spritemap_KraidFoot_6
    dw Hitbox_KraidFoot
    dw $0000,$0000
    dw Spritemap_KraidFoot_5
    dw Hitbox_KraidFoot


;;; $A577: Spritemaps - Kraid foot ;;;
Spritemap_KraidFoot_5:
    dw $0008
    %spritemapEntry(1, $20, $1C, 0, 0, 2, 0, $15A)
    %spritemapEntry(1, $20, $14, 0, 0, 2, 0, $14A)
    %spritemapEntry(1, $10, $1C, 0, 0, 2, 0, $148)
    %spritemapEntry(0, $1F8, $0C, 0, 0, 2, 0, $14C)
    %spritemapEntry(1, $10, $0C, 0, 0, 2, 0, $146)
    %spritemapEntry(1, $00, $0C, 0, 0, 2, 0, $144)
    %spritemapEntry(1, $08, $FC, 0, 0, 2, 0, $142)
    %spritemapEntry(1, $1F8, $FC, 0, 0, 2, 0, $140)

Spritemap_KraidFoot_6:
    dw $000C
    %spritemapEntry(0, $1D8, $F4, 0, 0, 2, 0, $1C3)
    %spritemapEntry(0, $18, $F4, 0, 0, 2, 0, $19A)
    %spritemapEntry(1, $00, $F4, 0, 0, 2, 0, $1C8)
    %spritemapEntry(1, $1F0, $F4, 0, 0, 2, 0, $1C6)
    %spritemapEntry(1, $1E0, $F4, 0, 0, 2, 0, $1C4)
    %spritemapEntry(1, $1D0, $FC, 0, 0, 2, 0, $1A7)
    %spritemapEntry(1, $20, $FC, 0, 0, 2, 0, $1AB)
    %spritemapEntry(1, $20, $F4, 0, 0, 2, 0, $19B)
    %spritemapEntry(1, $10, $FC, 0, 0, 2, 0, $1DA)
    %spritemapEntry(1, $00, $FC, 0, 0, 2, 0, $1D8)
    %spritemapEntry(1, $1F0, $FC, 0, 0, 2, 0, $1D6)
    %spritemapEntry(1, $1E0, $FC, 0, 0, 2, 0, $1D4)


;;; $A5DF: Spritemap - Kraid lint - initial ;;;
Spritemap_KraidLint_Initial:
    dw $0005
    %spritemapEntry(0, $00, $08, 0, 0, 1, 0, $1C2)
    %spritemapEntry(1, $1F0, $00, 0, 0, 1, 0, $1B0)
    %spritemapEntry(1, $00, $F8, 0, 0, 1, 0, $1A2)
    %spritemapEntry(1, $1F0, $F8, 0, 0, 1, 0, $1A0)
    %spritemapEntry(1, $00, $08, 0, 0, 1, 0, $1A9)


;;; $A5FA: Unused. Spritemaps - Kraid lint ;;;
if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_KraidLint_A7A5FA:
    dw $0004
    %spritemapEntry(0, $00, $08, 0, 0, 1, 0, $1C2)
    %spritemapEntry(1, $1F0, $00, 0, 0, 1, 0, $1B0)
    %spritemapEntry(1, $00, $F8, 0, 0, 1, 0, $1A2)
    %spritemapEntry(1, $1F0, $F8, 0, 0, 1, 0, $1A0)

UNUSED_Spritemap_KraidLint_A7A610:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 1, 0, $1A9)
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $A617: Spritemaps - Kraid fingernail ;;;
Spritemap_KraidNail_0:
    dw $0002
    %spritemapEntry(1, $43F4, $F8, 0, 0, 2, 0, $12A)
    %spritemapEntry(1, $43FC, $F8, 0, 0, 2, 0, $12C)

Spritemap_KraidNail_1:
    dw $0004
    %spritemapEntry(0, $1F9, $FB, 0, 0, 2, 0, $138)
    %spritemapEntry(0, $1F9, $03, 0, 0, 2, 0, $139)
    %spritemapEntry(0, $02, $F9, 0, 1, 2, 0, $12E)
    %spritemapEntry(0, $1FA, $F9, 0, 0, 2, 0, $12E)

Spritemap_KraidNail_2:
    dw $0002
    %spritemapEntry(1, $43F9, $FB, 1, 1, 2, 0, $126)
    %spritemapEntry(1, $43F9, $F4, 0, 1, 2, 0, $12C)

Spritemap_KraidNail_3:
    dw $0004
    %spritemapEntry(0, $1FC, $FF, 1, 1, 2, 0, $129)
    %spritemapEntry(0, $04, $FF, 1, 1, 2, 0, $128)
    %spritemapEntry(0, $1F9, $FE, 1, 1, 2, 0, $13E)
    %spritemapEntry(0, $1F9, $F6, 0, 1, 2, 0, $13E)

Spritemap_KraidNail_4:
    dw $0002
    %spritemapEntry(1, $43FC, $F8, 1, 1, 2, 0, $12A)
    %spritemapEntry(1, $43F4, $F8, 0, 0, 2, 0, $12C)

Spritemap_KraidNail_5:
    dw $0004
    %spritemapEntry(0, $1FF, $FD, 1, 1, 2, 0, $138)
    %spritemapEntry(0, $1FF, $F5, 1, 1, 2, 0, $139)
    %spritemapEntry(0, $1FD, $FF, 1, 1, 2, 0, $12E)
    %spritemapEntry(0, $1F5, $FF, 1, 0, 2, 0, $12E)

Spritemap_KraidNail_6:
    dw $0002
    %spritemapEntry(1, $43F7, $F4, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $43F7, $FC, 1, 0, 2, 0, $12C)

Spritemap_KraidNail_7:
    dw $0004
    %spritemapEntry(0, $1FD, $F9, 0, 0, 2, 0, $129)
    %spritemapEntry(0, $1F5, $F9, 0, 0, 2, 0, $128)
    %spritemapEntry(0, $1FF, $03, 1, 0, 2, 0, $13E)
    %spritemapEntry(0, $1FF, $FB, 0, 0, 2, 0, $13E)


;;; $A69F: Spritemaps - Kraid arm - dying / preparing to lunge ;;;
Spritemap_KraidArm_Dying_PreparingToLunge_0:
    dw $000C
    %spritemapEntry(1, $43C1, $D8, 0, 0, 3, 1, $126)
    %spritemapEntry(1, $43CE, $E3, 0, 0, 3, 1, $12C)
    %spritemapEntry(1, $43C2, $D2, 0, 0, 3, 1, $126)
    %spritemapEntry(1, $43CF, $DD, 0, 0, 3, 1, $12C)
    %spritemapEntry(0, $1FF, $EF, 0, 0, 3, 1, $10F)
    %spritemapEntry(0, $1F7, $EF, 0, 0, 3, 1, $10E)
    %spritemapEntry(0, $1EF, $FF, 0, 0, 3, 1, $11C)
    %spritemapEntry(0, $1DF, $F7, 0, 0, 3, 1, $10C)
    %spritemapEntry(0, $1E7, $E7, 0, 0, 3, 1, $10D)
    %spritemapEntry(1, $43F7, $F7, 0, 0, 3, 1, $10A)
    %spritemapEntry(1, $43E7, $EF, 0, 0, 3, 1, $108)
    %spritemapEntry(1, $43D7, $E7, 0, 0, 3, 1, $106)

Spritemap_KraidArm_Dying_PreparingToLunge_1:
    dw $000B
    %spritemapEntry(0, $1BD, $FE, 0, 0, 3, 1, $128)
    %spritemapEntry(0, $1C5, $FE, 0, 0, 3, 1, $129)
    %spritemapEntry(0, $1D4, $FE, 0, 1, 3, 1, $12E)
    %spritemapEntry(0, $1CC, $FE, 0, 0, 3, 1, $12E)
    %spritemapEntry(0, $1B9, $F9, 0, 0, 3, 1, $128)
    %spritemapEntry(0, $1C1, $F9, 0, 0, 3, 1, $129)
    %spritemapEntry(0, $1D0, $F9, 0, 1, 3, 1, $12E)
    %spritemapEntry(0, $1C8, $F9, 0, 0, 3, 1, $12E)
    %spritemapEntry(1, $43F4, $F8, 0, 0, 3, 1, $104)
    %spritemapEntry(1, $43E4, $F8, 0, 0, 3, 1, $102)
    %spritemapEntry(1, $43D4, $F8, 0, 0, 3, 1, $100)


;;; $A716: Kraid's room background ;;;
Tiles_KraidRoomBackground:
incbin "../data/Tiles_KraidRoomBackground.bin"


;;; $A916: Kraid constants ;;;
KraidLint_InitialFunctionTimers:
  .top:
    dw $0120
  .middle:
    dw $00A0
  .bottom:
    dw $0040

KraidForwardsSpeed:
    dw $0003

if !FEATURE_KEEP_UNREFERENCED
UNUSED_KraidConstant_A7A91E:
    dw $0005
endif ; !FEATURE_KEEP_UNREFERENCED

KraidBackwardsSpeed:
    dw $0003

if !FEATURE_KEEP_UNREFERENCED
UNUSED_KraidBackwardsFastSpeed_A7A922:
    dw $0004

UNUSED_KraidConstant_A7A924:
    dw $0110
endif ; !FEATURE_KEEP_UNREFERENCED

KraidLint:
  .XSubSpeed:
    dw $8000
  .XSpeed:
    dw $0003


if !FEATURE_KEEP_UNREFERENCED
;;; $A92A: Unused. REP #$30 ;;;
UNUSED_REP30_A7A92A:
    REP #$30
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $A92C: Check if Kraid has died ;;;
CheckIfKraidHasDied:
;; Returns:
;;     A: 0 if Kraid is alive, 1 if Kraid is dead
    PHX
    LDX.W AreaIndex
    LDA.L SRAMMirror_Boss,X : BIT.W #$0001 : BEQ .returnAlive
    PLX
    LDA.W #$0001
    RTS

  .returnAlive:
    PLX
    LDA.W #$0000
    RTS


;;; $A943: Set enemy properties to dead ;;;
SetEnemyPropertiesToDead:
; Set enemy as intangible, flagged for deletion, invisible,
; not processed off-screen, not processing instructions and non-solid hitbox
    LDX.W EnemyIndex
    LDA.W Enemy.properties,X : ORA.W #$0700
    AND.W #$F7FF : AND.W #$DFFF : AND.W #$7FFF ; >.< $57FF
    STA.W Enemy.properties,X
    RTS


;;; $A959: Initialisation AI - enemy $E2BF (Kraid) ;;;
InitAI_Kraid:
; Note that BG1 tiles base address = (DP_BGTilesAddr & Fh) * 1000h, whereas this routine is using (DP_BGTilesAddr & Fh) * 100h,
; i.e. this routine only works because BG1 tiles base address = $0000
    SEP #$20
    LDA.B #UnpauseHook_KraidIsAlive>>16 : STA.W PauseHook_Unpause+2
    LDA.B #PauseHook_Kraid>>16 : STA.W PauseHook_Pause+2
    REP #$20
    LDA.W #UnpauseHook_KraidIsAlive : STA.W PauseHook_Unpause
    LDA.W #PauseHook_Kraid : STA.W PauseHook_Pause
    JSR CheckIfKraidHasDied
    BNE .dead
    JMP .alive

  .dead:
    LDX.W #$00C0
    LDY.W #$0000

  .loopBGPalette6:
    LDA.W Palette_KraidRoomBackground,Y : STA.L TargetPalettes_BGP0,X
    INX #2
    INY #2 : CPY.W #$0020 : BMI .loopBGPalette6
    LDX.W #$07FE
    LDA.W #$0338

  .loopBG2Tilemap:
    STA.L EnemyBG2Tilemap,X
    DEX #2 : BPL .loopBG2Tilemap
    LDA.W #$0000 : STA.L ExtraEnemy7800+4
    LDX.W VRAMWriteStack
    LDA.W #$0200 : STA.B VRAMWrite.size,X
    LDA.W #Tiles_KraidRoomBackground : STA.B VRAMWrite.src,X
    SEP #$20
    LDA.B #Tiles_KraidRoomBackground>>16 : STA.B VRAMWrite.src+2,X
    REP #$20
    LDA.B DP_BGTilesAddr : AND.W #$000F : XBA
    CLC : ADC.W #$3F00 : STA.B VRAMWrite.dest,X
    TXA : CLC : ADC.W #$0007 : STA.W VRAMWriteStack
    JSR SpawnPLMToClearTheCeiling
    JSR SpawnPLMToClearTheSpikes
    LDA.W #Function_Kraid_FadeInRegularBG_ClearBG2TilemapTopHalf : STA.W Kraid.function
    RTL

  .alive:
    SEP #$20
    LDA.B #$43 : STA.B DP_BG2TilemapAddrSize
    REP #$20
    LDA.W #$0002 : STA.W CameraDistanceIndex
    LDA.W #$0000 : STA.L Scrolls
    LDA.W #$0001 : STA.L Scrolls+2
    LDA.W #$0144 : STA.L Kraid.minimumSamusEjectionYPosition
    LDX.W #$0000
    LDA.W Enemy.health : LSR #3 : STA.B DP_Temp12

  .loopKraidHealth:
    STA.L Kraid.maxHealth_1_8,X
    CLC : ADC.B DP_Temp12
    INX #2 : CPX.W #$0010 : BMI .loopKraidHealth
    LDA.W #$DFFF : STA.B DP_Temp12
    LDX.W EnemyIndex
    JSR SetupKraidGFXWithTheTilePriorityCleared
    LDA.W Enemy.health : LSR #2 : STA.L Kraid.maxHealth_1_4
    CLC : ADC.L Kraid.maxHealth_1_4 : STA.L Kraid.maxHealth_2_4
    CLC : ADC.L Kraid.maxHealth_1_4 : STA.L Kraid.maxHealth_3_4
    CLC : ADC.L Kraid.maxHealth_1_4 : STA.L Kraid.maxHealth_4_4
    LDA.W #$0000 : STA.L ExtraEnemy7800+$3E
    LDA.W #$00B0 : STA.W Enemy.XPosition
    LDA.W #$0250 : STA.W Enemy.YPosition
    LDA.W Enemy.properties : ORA.W #$0400 : STA.W Enemy.properties
    LDA.W #Function_Kraid_RestrictSamusXPositionToFirstScreen : STA.W Kraid.function
    LDA.W #$012C : STA.W Kraid.functionTimer
    LDA.W #Function_Kraid_RaiseThruFloor_LoadTilemapTopHalf : STA.L Kraid.nextFunction
    LDA.W #$0040 : STA.W Kraid.instructionTimer
    JSL DisableMinimap_MarkBossRoomTilesExplored
    LDX.W #$003E
    LDA.W #$0338

  .loopKraidGFX:
    STA.L EnemyBG2Tilemap+$FC0,X
    DEX #2 : BPL .loopKraidGFX
    LDA.W #$0005 : STA.W EarthquakeType
    LDX.W #$0000

  .loopSpritePalette3:
    LDA.W .spritePalette3,X : STA.L TargetPalettes_SpriteP3,X
    INX #2 : CPX.W #$0020 : BMI .loopSpritePalette3
    RTL

  .spritePalette3:
; Sprite palette 3 - Kraid rocks
    dw $0000,$0000,$0000,$0000,$0000,$0DF6,$0D92,$0CEC
    dw $0CA9,$0000,$0000,$0000,$0000,$0000,$0000,$0000


;;; $AAC6: Set up Kraid graphics with the tile priority cleared ;;;
SetupKraidGFXWithTheTilePriorityCleared:
; $7E:2000..27FF = BG2 tilemap - Kraid top half
; $7E:2800..2DFF = BG2 tilemap - Kraid bottom half
    SEP #$20
    LDA.B #Background_Brinstar_1A_Kraid_Upper : STA.L DP_DecompSrc ; >.<
    LDA.B #(Background_Brinstar_1A_Kraid_Upper>>8) : STA.L DP_DecompSrc+1 ; >.<
    LDA.B #(Background_Brinstar_1A_Kraid_Upper>>16) : STA.L DP_DecompSrc+2 ; >.<
    LDA.B #$00 : STA.L DP_DecompDest ; >.<
    LDA.B #$40 : STA.L DP_DecompDest+1 ; >.<
    JSL Decompression_VariableDestination
    LDA.B #Background_Brinstar_1A_Kraid_Lower_0 : STA.L DP_DecompSrc ; >.<
    LDA.B #(Background_Brinstar_1A_Kraid_Lower_0>>8) : STA.L DP_DecompSrc+1 ; >.<
    LDA.B #(Background_Brinstar_1A_Kraid_Lower_0>>16) : STA.L DP_DecompSrc+2 ; >.<
    LDA.B #$00 : STA.L DP_DecompDest ; >.<
    LDA.B #$20 : STA.L DP_DecompDest+1 ; >.<
    JSL Decompression_VariableDestination
    REP #$20
    LDA.W #$0000 : STA.L Kraid.hurtFrame : STA.L Kraid.hurtFrameTimer
    LDX.W #$0000

  .loop0:
    LDA.L EnemyBG2Tilemap,X : AND.W #$DFFF : STA.L EnemyBG2Tilemap+$800,X
    INX #2 : CPX.W #$0600 : BMI .loop0
    LDX.W #$0000

  .loop1:
    LDA.L BG2Tilemap,X : AND.B DP_Temp12 : STA.L EnemyBG2Tilemap,X
    INX #2 : CPX.W #$0800 : BMI .loop1
    RTS


;;; $AB43: Initialisation AI - enemy $E2FF (Kraid arm) ;;;
InitAI_KraidArm:
    JSR CheckIfKraidHasDied
    BNE .dead
    LDA.W Enemy.palette : STA.W Enemy[1].palette
    LDA.W #RTL_A7BA2D : STA.W Enemy[1].var0
    LDA.W #InstList_KraidArm_RisingSinking : STA.W Enemy[1].instList
    LDA.W #$0001 : STA.W Enemy[1].instTimer
    STZ.W Enemy[1].var1
    RTL

  .dead:
    JSR SetEnemyPropertiesToDead
    RTL


;;; $AB68: Initialisation AI - enemy $E33F (Kraid top lint) ;;;
InitAI_KraidLintTop:
    JSR CheckIfKraidHasDied
    BNE .dead
    LDA.W Enemy.palette : STA.W Enemy[2].palette
    LDA.W #$7FFF : STA.W Enemy[2].instTimer
    LDA.W #InstList_KraidLint_Initial : STA.W Enemy[2].instList
    LDA.W #Spritemap_KraidLint_Initial : STA.W Enemy[2].spritemap
    LDA.W #RTL_A7B831 : STA.W Enemy[2].var0
    LDA.W #$7FFF : STA.W Enemy[2].var5
    LDA.W #$0000 : STA.W Enemy[2].var2
    RTL

  .dead:
    JSR SetEnemyPropertiesToDead
    RTL


;;; $AB9C: Initialisation AI - enemy $E37F (Kraid middle lint) ;;;
InitAI_KraidLintMiddle:
    JSR CheckIfKraidHasDied
    BNE .dead
    LDA.W Enemy.palette : STA.W Enemy[3].palette
    LDA.W #$7FFF : STA.W Enemy[3].instTimer
    LDA.W #InstList_KraidLint_Initial : STA.W Enemy[3].instList
    LDA.W #Spritemap_KraidLint_Initial : STA.W Enemy[3].spritemap
    LDA.W #RTL_A7B831 : STA.W Enemy[3].var0
    LDA.W #$FFF0 : STA.W Enemy[3].var2
    RTL

  .dead:
    JSR SetEnemyPropertiesToDead
    RTL


;;; $ABCA: Initialisation AI - enemy $E3BF (Kraid bottom lint) ;;;
InitAI_KraidLintBottom:
    JSR CheckIfKraidHasDied
    BNE .dead
    LDA.W Enemy.palette : STA.W Enemy[4].palette
    LDA.W #$7FFF : STA.W Enemy[4].instTimer
    LDA.W #InstList_KraidLint_Initial : STA.W Enemy[4].instList
    LDA.W #Spritemap_KraidLint_Initial : STA.W Enemy[4].spritemap
    LDA.W #RTL_A7B831 : STA.W Enemy[4].var0
    LDA.W #$FFF0 : STA.W Enemy[4].var2
    RTL

  .dead:
    JSR SetEnemyPropertiesToDead
    RTL


;;; $ABF8: Initialisation AI - enemy $E3FF (Kraid foot) ;;;
InitAI_KraidFoot:
    JSR CheckIfKraidHasDied
    BNE .dead
    LDA.W Enemy.palette : STA.W Enemy[5].palette
    LDA.W #InstList_KraidFoot_Initial : STA.W Enemy[5].instList
    LDA.W #$0001 : STA.W Enemy[5].instTimer
    LDA.W #RTL_A7BA2D : STA.W Enemy[5].var0
    LDA.W #$0000 : STA.L ExtraEnemy7800+$140
    RTL

  .dead:
    JSR SetEnemyPropertiesToDead
    RTL


;;; $AC21: Main AI - enemy $E2BF (Kraid) ;;;
MainAI_Kraid:
    JSR KraidsMouth_vs_Projectile_CollisionHandling
    JSR KraidPaletteHandling
    JSR KraidBody_vs_Projectile_CollisionHandling
    JSR KraidBody_vs_Samus_CollisionHandling
    LDX.W EnemyIndex
    LDA.B DP_BG1XScroll : SEC : SBC.W BG1XOffset : SBC.W Enemy.XPosition
    ADC.W Enemy.XHitboxRadius : STA.B DP_BG2XScroll
    LDA.W Layer1YPosition : SEC : SBC.W Enemy.YPosition : ADC.W #$0098 : STA.B DP_BG2YScroll
    JMP.W (Kraid.function)


;;; $AC4D: Kraid function - Kraid gets big - break ceiling into platforms ;;;
Function_Kraid_KraidGetsBig_BreakCeilingIntoPlatforms:
    LDA.W NMI_FrameCounter : AND.W #$0007 : BNE .nonZeroCounter
    JSR SpawnRandomEarthquakeProjectile

  .nonZeroCounter:
    LDY.W #$0001
    LDA.W Enemy.YPosition : BIT.W #$0002 : BEQ +
    LDY.W #$FFFF

+   STY.B DP_Temp12
    LDA.W Enemy.XPosition : CLC : ADC.B DP_Temp12 : STA.W Enemy.XPosition
    DEC.W Enemy.YPosition
    LDA.W Enemy.YPosition : AND.W #$0003 : BNE .done
    LDX.W Kraid.functionTimer : CPX.W #$0012 : BPL .done
    LDA.W .XPositions,X
    LDY.W #EnemyProjectile_KraidCeilingRocks
    LDX.W EnemyIndex
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    LDX.W Kraid.functionTimer
    LDA.W .functionPointers,X : STA.B DP_Temp12
    JMP.W (DP_Temp12)

  .manualReturn:
; Manual return point for PLM spawning functions
    LDX.W Kraid.functionTimer : INX #2 : STX.W Kraid.functionTimer

  .done:
    LDA.W Enemy.YPosition : CMP.W #$0128 : BPL .return
    LDA.W #Function_Kraid_KraidGetsBig_SetBG2TilemapPriorityBits : STA.W Kraid.function

  .return:
    RTL

  .XPositions:
; Falling rocks X positions
    dw $0068,$00D8,$0028,$00A8,$0058,$00C8,$0038,$00B8,$0048

  .functionPointers:
; Ceiling break PLM spawning function pointers
    dw .spawnPLM4
    dw .spawnPLM8
    dw .spawnPLM0
    dw .spawnPLM5
    dw .spawnPLM3
    dw .spawnPLM7
    dw .spawnPLM1
    dw .spawnPLM6
    dw .spawnPLM2

  .spawnPLM0:
    JSL Spawn_Hardcoded_PLM
    db $02,$12
    dw PLMEntries_crumbleKraidCeilingBlockIntoBackground1
    JMP .manualReturn

  .spawnPLM1:
    JSL Spawn_Hardcoded_PLM
    db $03,$12
    dw PLMEntries_crumbleKraidCeilingBlockIntoBackground2
    JMP .manualReturn

  .spawnPLM2:
    JSL Spawn_Hardcoded_PLM
    db $04,$12
    dw PLMEntries_crumbleKraidCeilingBlockIntoBackground3
    JMP .manualReturn

  .spawnPLM3:
    JSL Spawn_Hardcoded_PLM
    db $05,$12
    dw PLMEntries_crumbleKraidCeilingBlockIntoBackground2
    JMP .manualReturn

  .spawnPLM4:
    JSL Spawn_Hardcoded_PLM
    db $06,$12
    dw PLMEntries_crumbleKraidCeilingBlockIntoBackground3
    JMP .manualReturn

  .spawnPLM5:
    JSL Spawn_Hardcoded_PLM
    db $0A,$12
    dw PLMEntries_crumbleKraidCeilingBlockIntoBackground3
    JMP .manualReturn

  .spawnPLM6:
    JSL Spawn_Hardcoded_PLM
    db $0B,$12
    dw PLMEntries_crumbleKraidCeilingBlockIntoBackground2
    JMP .manualReturn

  .spawnPLM7:
    JSL Spawn_Hardcoded_PLM
    db $0C,$12
    dw PLMEntries_crumbleKraidCeilingBlockIntoBackground3
    JMP .manualReturn

  .spawnPLM8:
    JSL Spawn_Hardcoded_PLM
    db $0D,$12
    dw PLMEntries_crumbleKraidCeilingBlockIntoBackground2
    JMP .manualReturn


;;; $AD3A: Kraid function - Kraid gets big - set BG2 tilemap priority bits ;;;
Function_Kraid_KraidGetsBig_SetBG2TilemapPriorityBits:
    LDX.W #$0000

  .loop:
    LDA.L EnemyBG2Tilemap,X : ORA.W #$2000 : STA.L EnemyBG2Tilemap,X
    INX #2 : CPX.W #$1000 : BMI .loop
    LDA.W Enemy[1].properties : AND.W #$FBFF : STA.W Enemy[1].properties
    LDA.W #Function_Kraid_KraidGetsBig_FinishUpdatingBG2Tilemap : STA.W Kraid.function
    JMP UpdateBG2TilemapTopHalf


;;; $AD61: Kraid function - Kraid gets big - finish updating BG2 tilemap ;;;
Function_Kraid_KraidGetsBig_FinishUpdatingBG2Tilemap:
    LDA.W #Function_Kraid_KraidGetsBig_DrawRoomBackground : STA.W Kraid.function
    LDA.W #$0001 : STA.W Enemy[5].instTimer
    LDA.W #InstList_KraidFoot_KraidIsBig_Neutral : STA.W Enemy[5].instList
    LDA.W #InstList_KraidLint_KraidIsBig : STA.W Enemy[2].instList
    STA.W Enemy[3].instList : STA.W Enemy[4].instList
    LDA.W #Spritemap_KraidLint_KraidIsBig : STA.W Enemy[2].spritemap
    STA.W Enemy[3].spritemap : STA.W Enemy[4].spritemap
    JMP UpdateBG2TilemapBottomHalf


;;; $AD8E: Kraid function - Kraid gets big - draw room background ;;;
Function_Kraid_KraidGetsBig_DrawRoomBackground:
; Note that BG1 tiles base address = (DP_BGTilesAddr & Fh) * 1000h, whereas this routine is using (DP_BGTilesAddr & Fh) * 100h,
; i.e. this routine only works because BG1 tiles base address = $0000
    LDA.W #Function_Kraid_KraidGetsBig_FadeInRoomBackground : STA.W Kraid.function
    STZ.W Enemy.var4 : STZ.W Kraid.functionTimer
; fallthrough to DrawKraidsRoomBackground


;;; $AD9A: Draw Kraid's room background ;;;
DrawKraidsRoomBackground:
    LDX.W #$00C0
    LDY.W #$0000

  .loop:
    LDA.W Palette_KraidRoomBackground,Y : STA.L TargetPalettes_BGP0,X
    INX #2
    INY #2 : CPY.W #$0020 : BMI .loop
    LDA.W #$0000 : STA.L PaletteChangeNumerator
    LDX.W VRAMWriteStack
    LDA.W #$0200 : STA.B VRAMWrite.size,X
    LDA.W #Tiles_KraidRoomBackground : STA.B VRAMWrite.src,X
    SEP #$20
    LDA.B #Tiles_KraidRoomBackground>>16 : STA.B VRAMWrite.src+2,X
    REP #$20
    LDA.B DP_BGTilesAddr : AND.W #$000F : XBA
    CLC : ADC.W #$3F00 : STA.B VRAMWrite.dest,X
    TXA : CLC : ADC.W #$0007 : STA.W VRAMWriteStack
    RTL


;;; $ADE1: Set up Kraid gets big - thinking ;;;
SetupKraidGetsBig_Thinking:
    LDA.W #Function_Kraid_KraidGetsBig_Thinking
    STA.W Kraid.function
    BRA SetLintYPositionsAndRandomThinkingTimer


;;; $ADE9: Set up Kraid main loop - thinking ;;;
SetupKraidMainLoop_Thinking:
    LDA.W #Function_Kraid_MainLoop_Thinking : STA.W Kraid.function
; fallthrough to SetLintYPositionsAndRandomThinkingTimer


;;; $ADEF: Set lint Y positions and random thinking timer ;;;
SetLintYPositionsAndRandomThinkingTimer:
    LDA.W Enemy.YPosition : SEC : SBC.W #$0014 : STA.W Enemy[2].YPosition
    LDA.W Enemy.YPosition : CLC : ADC.W #$002E : STA.W Enemy[3].YPosition
    LDA.W Enemy.YPosition : CLC : ADC.W #$0070 : STA.W Enemy[4].YPosition
    LDA.W RandomNumberSeed : AND.W #$0007 : BNE .multiplyBy40
    LDA.W #$0002

  .multiplyBy40:
    ASL #6 : STA.L Kraid.thinkingTimer
    RTS


;;; $AE23: Kraid function - Kraid gets big - fade in room background ;;;
Function_Kraid_KraidGetsBig_FadeInRoomBackground:
    REP #$30
    JSL Advance_GradualColorChange_ofBGPalette6
    BCS .reachedTargetColor
    RTL

  .reachedTargetColor:
    JSR SetupKraidGetsBig_Thinking
    LDX.W #$0080
    LDA.W KraidLint_InitialFunctionTimers_top
    JSR EnableKraidLints
    LDX.W #$00C0
    LDA.W KraidLint_InitialFunctionTimers_middle
    JSR EnableKraidLints
    LDX.W #$0100
    LDA.W KraidLint_InitialFunctionTimers_bottom
    JSR EnableKraidLints
    LDA.W #Function_KraidNail_Initialize : STA.L ExtraEnemy7800+$180 : STA.L ExtraEnemy7800+$1C0
    LDA.W #Function_Kraid_HandleFunctionTimer : STA.W Enemy[6].var0 : STA.W Enemy[7].var0
    LDA.W #$0040 : STA.W Enemy[6].var5
    LDA.W #$0080 : STA.W Enemy[7].var5
    LDA.W #$0001 : STA.W Enemy[1].var2
    LDA.W #InstList_Kraid_Roar_1 : STA.W Kraid.instListPointer
    LDA.W #$0120 : STA.L Kraid.targetXPosition
    LDA.W #Function_KraidFoot_Phase2Setup_WalkToStartingPoint : STA.W Enemy[5].var0
    LDA.W #$0001 : STA.W Enemy[5].instTimer
    LDA.W #InstList_KraidFoot_KraidIsBig_WalkingBackwards_0 : STA.W Enemy[5].instList
    RTL


;;; $AE90: Enable Kraid lints ;;;
EnableKraidLints:
    STA.W Kraid.functionTimer,X
    LDA.W #Function_KraidNail_HorizontallyAlignEnemyToKraid : STA.W Kraid.function,X
    LDA.W #Function_KraidLint_ProduceLint : STA.L Kraid.nextFunction,X
    STZ.W Kraid.instListPointer,X
    RTS


;;; $AEA4: Kraid function - Kraid main loop - thinking ;;;
Function_Kraid_MainLoop_Thinking:
; This is the function for which Kraid can be shot to trigger his mouth opening
    LDA.L Kraid.thinkingTimer : BEQ .return
    DEC : STA.L Kraid.thinkingTimer : BNE .return
    LDA.W #Function_KraidMainLoop_AttackingWithMouthOpen : STA.W Kraid.function
    LDA.W #InstList_Kraid_Roar_1 : STA.W Kraid.instListPointer
    LDA.W InstList_Kraid_Roar_0 : STA.W Kraid.instructionTimer

  .return:
    RTL


;;; $AEC4: Kraid function - Kraid gets big - thinking ;;;
Function_Kraid_KraidGetsBig_Thinking:
    LDA.L Kraid.thinkingTimer : BEQ .return
    DEC : STA.L Kraid.thinkingTimer : BNE .return
    LDA.W #Function_Kraid_KraidShot_KraidsMouthIsOpen : STA.W Kraid.function
    LDA.W #InstList_Kraid_Roar_1 : STA.W Kraid.instListPointer
    LDA.W InstList_Kraid_Roar_0 : STA.W Kraid.instructionTimer

  .return:
    RTL


;;; $AEE4: Kraid function - Kraid shot - Kraid's mouth is open ;;;
Function_Kraid_KraidShot_KraidsMouthIsOpen:
    JSR KraidInstListHandling
    CMP.W #$FFFF : BNE .return
    LDA.W #Function_Kraid_MainLoop_Thinking : STA.W Kraid.function
    LDA.W #$005A : STA.W Kraid.instructionTimer
    LDA.L Kraid.mouthReopenFlags : BIT.W #$0004 : BEQ .done
    SEC : SBC.W #$0100 : STA.L Kraid.mouthReopenFlags
    AND.W #$FF00 : BEQ .done
    LDA.W #Function_Kraid_HandleFunctionTimer : STA.W Kraid.function
    LDA.W #$0040 : STA.W Kraid.functionTimer
    LDA.W #Function_Kraid_KraidShot_InitializeEyeGlowing : STA.L Kraid.nextFunction
    LDA.W #$0002 : STA.L ExtraEnemy7800+2

  .return:
    RTL

  .done:
    LDA.W #$0000 : STA.L Kraid.mouthReopenFlags
    BRA .return


;;; $AF32: Kraid instruction list handling ;;;
KraidInstListHandling:
    LDA.W Kraid.instructionTimer : BEQ .return
    DEC.W Kraid.instructionTimer : BEQ ProcessKraidInstList

  .return:
    RTS


;;; $AF3D: Process Kraid instruction list ;;;
ProcessKraidInstList:
; Kraid instruction format
; If t & 8000h = 0:
;     tttt TTTT pppp mmmm
;     t: Timer
;     T: Tilemap pointer, fixed 2C0h bytes
;     p: Kraid projectile hitbox
;     m: Kraid's mouth projectile hitbox
; If p & 8000h != 0:
;     pppp
;     p: If FFFFh, terminator, otherwise pointer to function
    LDX.W Kraid.instListPointer
    LDA.W $0000,X : CMP.W #$FFFF : BEQ .return
    BMI .ASMInstruction
    STA.W Kraid.instructionTimer
    TXA : CLC : ADC.W #$0008 : STA.W Kraid.instListPointer
    LDA.W $0002,X : TAY
    PHX
    LDX.W VRAMWriteStack
    LDA.W #$02C0 : STA.B VRAMWrite.size,X
    INX #2
    STY.B VRAMWrite.size,X
    INX #2
    SEP #$20
    LDA.B #Tilemap_KraidHead_0>>16 : STA.B VRAMWrite.size,X
    REP #$20
    INX
    LDA.B DP_BG2TilemapAddrSize : AND.W #$00FC : XBA : STA.B VRAMWrite.size,X
    INX #2 : STX.W VRAMWriteStack
    PLX
    LDA.W #$0001

  .return:
    RTS

  .ASMInstruction:
    STA.B DP_Temp12
    JMP.W (DP_Temp12)


;;; $AF88: Process next Kraid instruction ;;;
ProcessNextKraidInstruction:
    LDA.W Kraid.instListPointer : CLC : ADC.W #$0002 : STA.W Kraid.instListPointer
    BRA ProcessKraidInstList


;;; $AF94: Kraid instruction - queue Kraid roar sound effect ;;;
Instruction_Kraid_PlayRoarSFX:
    PHX
    LDA.W #$002D
    JSL QueueSound_Lib2_Max6
    PLX
    BRA ProcessNextKraidInstruction


;;; $AF9F: Kraid instruction - queue Kraid dying sound effect ;;;
Instruction_Kraid_PlayDyingSFX:
    PHX
    LDA.W #$002E
    JSL QueueSound_Lib2_Max15
    PLX
    BRA ProcessNextKraidInstruction


;;; $AFAA: Kraid's mouth / projectile collision handling ;;;
KraidsMouth_vs_Projectile_CollisionHandling:
; The loop over projectiles is pretty wrong
; Just because there are n active projectiles, that doesn't mean they're in the first n slots,
; so it is possible for Kraid to detect a collision with an early slot inactive projectile and miss a collision with a late slot active projectile
; The initial index is one slot beyond the supposed last projectile,
; so even if using the projectile counter made sense, this would erroneously consider an inactive projectile
; This routine has no handling for bombs, but if all 5 projectile slots are active, this will read the first bomb slot,
; making it technically possible to get a bomb interaction from Kraid (trigger mouth to open and kill projectile)
    REP #$30
    PHX
    LDA.W Kraid.function : CMP.W #KraidDeath_SinkThroughFloor : BMI .notDying
    PLX
    RTS

  .notDying:
    LDA.W Kraid.instListPointer : SEC : SBC.W #$0008 : TAX
    LDA.W $0006,X : CMP.W #$FFFF : BNE .notTerminator
    LDY.W #$0000
    JMP .noProjectiles

  .notTerminator:
    TAX
    LDA.W #$0001 : STA.W Enemy.var4
    LDY.W #$0000
    LDA.W $0000,X : CLC : ADC.W Enemy.XPosition : STA.B DP_Temp16
    LDA.W $0002,X : CLC : ADC.W Enemy.YPosition : STA.B DP_Temp14
    LDA.W $0006,X : CLC : ADC.W Enemy.YPosition : STA.B DP_Temp12
    LDA.W SamusProjectile_ProjectileCounter : BEQ .noProjectiles
    ASL : TAX

  .loop:
    LDA.W SamusProjectile_YPositions,X : SEC : SBC.W SamusProjectile_YRadii,X
    DEC : CMP.B DP_Temp12 : BPL .next
    LDA.W SamusProjectile_YPositions,X : CLC : ADC.W SamusProjectile_YRadii,X
    CMP.B DP_Temp14 : BMI .next
    LDA.W SamusProjectile_XPositions,X : CLC : ADC.W SamusProjectile_XRadii,X
    CMP.B DP_Temp16 : BMI .next
    LDA.W SamusProjectile_Types,X : BIT.W #$0F00 : BNE .notBeam
    BIT.W #$0010 : BEQ .next
    LDA.L Kraid.mouthReopenFlags : ORA.W #$0001 : STA.L Kraid.mouthReopenFlags

  .notBeam:
    PHX
    TXA : LSR : STA.W CollisionIndex
    PHP
    JSL NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External
    PLP : PLX
    LDA.W SamusProjectile_Directions,X : ORA.W #$0010 : STA.W SamusProjectile_Directions,X
    LDY.W #$0001

  .next:
    DEX #2 : BPL .loop

  .noProjectiles:
    PLX
    CPY.W #$0000 : BNE .collision
    RTS

  .collision:
    LDA.W #$0006 : STA.L Kraid.hurtFrame
    LDA.W #$0002 : STA.L Kraid.hurtFrameTimer
    LDA.L Kraid.mouthReopenFlags : BIT.W #$0002 : BEQ .notChargedBeam
    ORA.W #$0004 : STA.L Kraid.mouthReopenFlags

  .notChargedBeam:
    LDA.W Enemy.health : CMP.W #$0001 : BMI .dead
    RTS

  .dead:
    LDA.W Kraid.function : CMP.W #KraidDeath_Initialize : BPL .return
    LDA.W #KraidDeath_Initialize : STA.W Kraid.function
    LDA.W #$0000 : STA.L Kraid.mouthReopenFlags
    LDA.W Enemy.properties : ORA.W #$0400 : STA.W Enemy.properties
    LDA.W #$DFFF : STA.B DP_Temp12
    JSR SetupKraidGFXWithTheTilePriorityCleared
    LDX.W #$0000

  .loopSetIntangible:
    LDA.W Enemy.properties,X : ORA.W #$0400 : STA.W Enemy.properties,X
    TXA : CLC : ADC.W #$0040 : TAX
    CPX.W #$0180 : BMI .loopSetIntangible
    LDA.W Kraid.instListPointer : CMP.W #InstList_Kraid_DyingRoar_0 : BPL .return
    CLC : ADC.W #$003C : STA.W Kraid.instListPointer

  .return:
    RTS


;;; $B0CB: Spawn explosion enemy projectile ;;;
SpawnExplosionProjectile:
    LDA.W SamusProjectile_XPositions,X : STA.B DP_Temp12
    LDA.W SamusProjectile_YPositions,X : STA.B DP_Temp14
    LDA.W SamusProjectile_Types,X
    LDY.W #$001D
    BIT.W #$0200 : BNE .superMissile
    LDY.W #$0006

  .superMissile:
    TYA
    LDY.W #EnemyProjectile_MiscDust
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    LDA.W #$003D
    JSL QueueSound_Lib1_Max6
    RTS


;;; $B0F3: Kraid body / Samus collision handling ;;;
KraidBody_vs_Samus_CollisionHandling:
    LDA.W Kraid.function : CMP.W #KraidDeath_Initialize : BPL .return0
    LDA.W SamusXPosition : CLC : ADC.W SamusXRadius : STA.B DP_Temp12
    LDA.W SamusYPosition : SEC : SBC.W Enemy.YPosition
    LDX.W #$0000

  .loop:
    CMP.W HitboxDefinitionTable_KraidBody_bottom,X : BPL +
    CMP.W HitboxDefinitionTable_KraidBody_top,X : BPL +
    INX #4
    BRA .loop

+   LDA.W HitboxDefinitionTable_KraidBody_left,X : CLC : ADC.W Enemy.XPosition
    SEC : SBC.B DP_Temp12 : BPL .return1
    LDA.W SamusXPosition : CMP.W #$0028 : BMI .lessThan28
    SEC : SBC.W #$0008 : STA.W SamusXPosition : STA.W SamusPreviousXPosition

  .lessThan28:
    LDA.W SamusYPosition : SEC : SBC.W #$0008 : CMP.L Kraid.minimumSamusEjectionYPosition : BPL +
    LDA.L Kraid.minimumSamusEjectionYPosition

+   STA.W SamusYPosition : STA.W SamusPreviousYPosition
    JSR PushSamusBack
    LDA.W SamusInvincibilityTimer : BNE .return1
    JSL NormalEnemyTouchAI

  .return0:
    RTS

  .return1:
    RTS ; >.<


;;; $B161: Kraid body hitbox definition table ;;;
HitboxDefinitionTable_KraidBody:
;        _________ Bottom boundary offset (following entry used as top)
;       |      ___ Left boundary offset
;       |     |
  .bottom:
    dw $03FF
  .left:
    dw       $FFD0
  .top:
    dw $0010,$FFD0
    dw $0000,$FFE0
    dw $FFE0,$FFE8
    dw $FFD0,$FFF8
    dw $FFB0,$0000
    dw $FF90,$0008
    dw $8000,$0008


;;; $B181: Kraid body / projectile collision handling ;;;
KraidBody_vs_Projectile_CollisionHandling:
; See projectile loop note in KraidsMouth_vs_Projectile_CollisionHandling
    PHX
    LDA.W Kraid.function : CMP.W #KraidDeath_SinkThroughFloor : BMI .lessThanC537
    PLX
    RTS

  .lessThanC537:
    STZ.W Enemy.var4
    LDA.L Kraid.mouthReopenFlags : AND.W #$FFFE : STA.L Kraid.mouthReopenFlags
    STZ.B $30
    LDA.W Kraid.instListPointer : SEC : SBC.W #$0008 : TAX
    LDA.W $0004,X : TAX
    LDA.W $0000,X : CLC : ADC.W Enemy.XPosition : STA.B DP_Temp16
    LDA.W $0002,X : CLC : ADC.W Enemy.YPosition : STA.B DP_Temp14
    LDA.W $0006,X : CLC : ADC.W Enemy.YPosition : STA.B DP_Temp12
    LDA.W SamusProjectile_ProjectileCounter : BEQ .noProjectiles
    ASL : TAX

  .loop:
    LDA.W SamusProjectile_YPositions,X : SEC : SBC.W SamusProjectile_YRadii,X
    DEC : CMP.B DP_Temp12 : BPL .body
    LDA.W SamusProjectile_YPositions,X : CLC : ADC.W SamusProjectile_YRadii,X
    CMP.B DP_Temp14 : BMI .next
    LDA.W SamusProjectile_XPositions,X : CLC : ADC.W SamusProjectile_XRadii,X : CMP.B DP_Temp16 : BMI .next

  .hit:
    JSR SpawnExplosionProjectile
    LDA.W SamusProjectile_Directions,X : ORA.W #$0010 : STA.W SamusProjectile_Directions,X
    LDA.W SamusProjectile_Types,X : BIT.W #$0010 : BEQ +
    LDA.L Kraid.mouthReopenFlags : ORA.W #$0001 : STA.L Kraid.mouthReopenFlags

+   INC.B DP_Temp30

  .next:
    DEX #2 : BPL .loop

  .noProjectiles:
    PLX
    LDY.B DP_Temp30 : CPY.W #$0000 : BEQ .return
    LDA.W Kraid.function : CMP.W #Function_Kraid_MainLoop_Thinking : BNE .return
    LDA.W #Function_Kraid_KraidShot_InitializeEyeGlowing : STA.W Kraid.function
    LDA.L Kraid.mouthReopenFlags : BIT.W #$0001 : BEQ .return
    ORA.W #$0302 : STA.L Kraid.mouthReopenFlags

  .return:
    RTS

  .body:
    LDA.W SamusProjectile_XPositions,X : CLC : ADC.W SamusProjectile_XRadii,X : STA.B DP_Temp12
    LDA.W SamusProjectile_YPositions,X : SEC : SBC.W Enemy.YPosition
    LDY.W #$0000

  .loopBody:
    CMP.W HitboxDefinitionTable_KraidBody_bottom,Y : BPL +
    CMP.W HitboxDefinitionTable_KraidBody_top,Y : BPL +
    INY #4
    BRA .loopBody

+   LDA.W HitboxDefinitionTable_KraidBody_left,Y : CLC : ADC.W Enemy.XPosition
    SEC : SBC.B DP_Temp12 : BPL .next
    BRA .hit


if !FEATURE_KEEP_UNREFERENCED
;;; $B269: Unused. Handle projectile damage and sound ;;;
UNUSED_HandleProjectileDamageAndSound:
; This is like a cut-down or custom version of $A0:A6DE (handles beam damage, freezing, and sound) for enemy 0 (probably Kraid) specifically.
; There's no freeze handling, bomb and power bomb vulnerabilities are swapped, and Enemy.var4 is a triple damage flag
    PHX : PHY
    TXY
    LDX.W EnemyIndex
    LDA.W SamusProjectile_Damages,Y : STA.W EnemySpritemapEntryXPositionDuringCollision
    LDA.W SamusProjectile_Types,Y : STA.B DP_Temp12
    LDA.W SamusProjectile_Types,Y : BIT.W #$0018 : BEQ .notPlasmaOrCharge
    LDA.W #$0010 : STA.W Enemy.invincibilityTimer

  .notPlasmaOrCharge:
    LDX.W Enemy.ID
    LDA.L EnemyHeaders_vulnerabilities,X : BNE .vulnerabilities
    LDA.W #EnemyVulnerabilities_Default

  .vulnerabilities:
    STA.B DP_Temp14
    LDA.B DP_Temp12 : BIT.W #$0F00 : BNE .notBeam
    AND.W #$00FF : CLC : ADC.B DP_Temp14 : TAX
    LDA.L EnemyVulnerabilities_power,X
    BRA .determinedVulnerability

  .notBeam:
    AND.W #$0F00 : CMP.W #$0100 : BEQ .superMissile
    CMP.W #$0200 : BNE .missileEnd

  .superMissile:
    XBA : CLC : ADC.B DP_Temp14 : TAX
    LDA.L EnemyVulnerabilities_plasmaIceWave,X
    BRA .determinedVulnerability

  .missileEnd:
    CMP.W #$0300 : BNE .notPowerBomb
    LDX.B DP_Temp14
    LDA.L EnemyVulnerabilities_bomb,X
    BRA .determinedVulnerability

  .notPowerBomb:
    CMP.W #$0500 : BNE .return
    LDX.B DP_Temp14
    LDA.L EnemyVulnerabilities_powerBomb,X

  .determinedVulnerability:
    AND.W #$00FF : STA.W Temp_Unknown0E32 : BEQ .return
    LDA.W EnemySpritemapEntryXPositionDuringCollision : LSR : STA.W $4202
    SEP #$20
    LDA.W Temp_Unknown0E32 : STA.W $4203
    NOP #5
    REP #$20
    LDA.W $4216 : BEQ .return
    STA.W EnemySpritemapEntryXPositionDuringCollision
    LDA.W Enemy.health : SEC : SBC.W EnemySpritemapEntryXPositionDuringCollision ; >.<
    LDA.W Enemy.health : SEC : SBC.W EnemySpritemapEntryXPositionDuringCollision : STA.W Enemy.health
    LDA.W Enemy.var4 : BEQ .tripleDamageEnd
    LDA.W Enemy.health : SEC : SBC.W EnemySpritemapEntryXPositionDuringCollision
    SEC : SBC.W EnemySpritemapEntryXPositionDuringCollision : BPL .storeHealth
    LDA.W #$0000

  .storeHealth:
    STA.W Enemy.health

  .tripleDamageEnd:
    LDX.W Enemy.ID
    LDA.L EnemyHeaders_cry,X
    JSL QueueSound_Lib2_Max6

  .return:
    PLY : PLX
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $B337: Kraid palette handling ;;;
KraidPaletteHandling:
    PHX : PHY
    LDA.W Enemy.health : CMP.W #$0001 : BPL .alive
    STA.L Kraid.hurtFrame
    BRA +

  .alive:
    LDA.L Kraid.hurtFrame : BEQ .return
    LDA.L Kraid.hurtFrameTimer : DEC : STA.L Kraid.hurtFrameTimer : BNE .return
    LDA.W #$0002 : STA.L Kraid.hurtFrameTimer
    LDA.L Kraid.hurtFrame : DEC : STA.L Kraid.hurtFrame

+   JSR KraidHurtFlashHandling
    JSR KraidHealthBasedPaletteHandling

  .return:
    PLY : PLX
    RTS


;;; $B371: Kraid hurt flash handling ;;;
KraidHurtFlashHandling:
; This routine is redundant/incorrect, KraidHealthBasedPaletteHandling handles the flash frames properly
    LDY.W #$0000
    LDA.L Kraid.hurtFrame : BIT.W #$0001 : BNE .loopSetup
    LDY.W #$0020

  .loopSetup:
    LDX.W #$0000

  .loop:
    LDA.W Palette_Kraid_Sprite_HurtFlash,Y : STA.L Palettes_SpriteP7,X
    INX #2
    INY #2
    CPX.W #$0020 : BMI .loop
    RTS


;;; $B394: Kraid health-based palette handling ;;;
KraidHealthBasedPaletteHandling:
    LDY.W #$0000
    LDA.L Kraid.hurtFrame : BIT.W #$0001 : BNE .hurtFlashFrame
    LDX.W #$000E
    LDA.W Enemy.health

  .loop:
    CMP.L Kraid.maxHealth_1_8,X : BPL .getIndex
    DEX #2 : BNE .loop

  .getIndex:
    INX #2
    TXA : ASL #4 : TAY

  .hurtFlashFrame:
    LDX.W #$0000

  .loopPalette:
    LDA.W Palette_Kraid_BG_HurtFlash,Y : STA.L Palettes_BG12P7,X
    LDA.W Palette_Kraid_Sprite_HurtFlash,Y : STA.L Palettes_SpriteP7,X
    INY #2
    INX #2 : CPX.W #$0020 : BMI .loopPalette
    RTS


;;; $B3D3: Kraid BG palette 7 ;;;
Palette_Kraid_BG_HurtFlash:
; [Kraid hurt frame] is odd
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF

Palette_Kraid_BG_1_8:
; [Kraid health] < [Kraid max health * 2/8]
    dw $0000,$559D,$1816,$100D,$127A,$0E17,$0DD3,$0970
    dw $092D,$04CA,$0486,$0023,$0443,$3E52,$4AD5,$0000

Palette_Kraid_BG_2_8:
; [Kraid health] >= [Kraid max health * 2/8]
    dw $3800,$559D,$1816,$100D,$1A9B,$1637,$11F3,$0D8F
    dw $0D4C,$08E9,$04A6,$0043,$0443,$4273,$52F6,$0000

Palette_Kraid_BG_3_8:
; [Kraid health] >= [Kraid max health * 3/8]
    dw $3800,$559D,$1816,$100D,$22DB,$1A77,$1A12,$15AE
    dw $116C,$0D09,$08A6,$0444,$0423,$4A94,$5B38,$0000

Palette_Kraid_BG_4_8:
; [Kraid health] >= [Kraid max health * 4/8]
    dw $3800,$559D,$1816,$100D,$2AFC,$2297,$1E32,$19CD
    dw $158B,$1128,$08C6,$0464,$0423,$4EB5,$6359,$0000

Palette_Kraid_BG_5_8:
; [Kraid health] >= [Kraid max health * 5/8]
    dw $3800,$559D,$1816,$100D,$331D,$2AB7,$2A91,$1E0C
    dw $19AA,$1148,$0CE5,$0484,$0023,$52B5,$677B,$0000

Palette_Kraid_BG_6_8:
; [Kraid health] >= [Kraid max health * 6/8]
    dw $3800,$559D,$1816,$100D,$3B3E,$32D7,$32B0,$222B
    dw $1DC9,$1567,$0D05,$04A4,$0023,$56D6,$6F9C,$0000

Palette_Kraid_BG_7_8:
; [Kraid health] >= [Kraid max health * 7/8]
    dw $3800,$559D,$1816,$100D,$437E,$3717,$32B0,$2A4A
    dw $21E9,$1987,$1105,$08A5,$0003,$5EF7,$77DE,$0000

Palette_Kraid_BG_8_8:
; [Kraid health] >= [Kraid max health * 8/8]
    dw $3800,$559D,$1816,$100D,$4B9F,$3F37,$36D0,$2E69
    dw $2608,$1DA6,$1125,$08C5,$0003,$6318,$7FFF,$0000

Palette_Kraid_Death:
    dw $3800,$0807,$0404,$0000,$127A,$0E17,$0DD3,$0970
    dw $092D,$04CA,$0486,$0023,$0443,$3E52,$4AD5,$0000


;;; $B513: Kraid sprite palette 7 ;;;
Palette_Kraid_Sprite_HurtFlash:
; [Kraid hurt frame] is odd
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF

Palette_Kraid_Sprite_1_8:
; [Kraid health] < [Kraid max health * 2/8]
    dw $0000,$559D,$1816,$100D,$127A,$0E17,$0DD3,$0970
    dw $092D,$04CA,$0486,$0023,$0443,$3E52,$4AD5,$0000

Palette_Kraid_Sprite_2_8:
; [Kraid health] >= [Kraid max health * 2/8]
    dw $3800,$559D,$1816,$100D,$1A9B,$1637,$11F3,$0D8F
    dw $0D4C,$08E9,$04A6,$0043,$0443,$4273,$52F6,$0000

Palette_Kraid_Sprite_3_8:
; [Kraid health] >= [Kraid max health * 3/8]
    dw $3800,$559D,$1816,$100D,$22DB,$1A77,$1A12,$15AE
    dw $116C,$0D09,$08A6,$0444,$0423,$4A94,$5B38,$0000

Palette_Kraid_Sprite_4_8:
; [Kraid health] >= [Kraid max health * 4/8]
    dw $3800,$559D,$1816,$100D,$2AFC,$2297,$1E32,$19CD
    dw $158B,$1128,$08C6,$0464,$0423,$4EB5,$6359,$0000

Palette_Kraid_Sprite_5_8:
; [Kraid health] >= [Kraid max health * 5/8]
    dw $3800,$559D,$1816,$100D,$331D,$2AB7,$2A91,$1E0C
    dw $19AA,$1148,$0CE5,$0484,$0023,$52B5,$677B,$0000

Palette_Kraid_Sprite_6_8:
; [Kraid health] >= [Kraid max health * 6/8]
    dw $3800,$559D,$1816,$100D,$3B3E,$32D7,$32B0,$222B
    dw $1DC9,$1567,$0D05,$04A4,$0023,$56D6,$6F9C,$0000

Palette_Kraid_Sprite_7_8:
; [Kraid health] >= [Kraid max health * 7/8]
    dw $3800,$559D,$1816,$100D,$437E,$3717,$32B0,$2A4A
    dw $21E9,$1987,$1105,$08A5,$0003,$5EF7,$77DE,$0000

Palette_Kraid_Sprite_8_8:
; [Kraid health] >= [Kraid max health * 8/8]
    dw $3800,$559D,$1816,$100D,$4B9F,$3F37,$36D0,$2E69
    dw $2608,$1DA6,$1125,$08C5,$0003,$6318,$7FFF,$0000


;;; $B633: Instruction - NOP ;;;
Instruction_Kraid_NOP_A7B633:
    PHX : PLX ; >.<
    RTL


;;; $B636: Instruction - decrement Kraid Y position ;;;
Instruction_Kraid_DecrementYPosition:
    PHX ; >.<
    DEC.W Enemy.YPosition
    PLX
    RTL


;;; $B63C: Instruction - increment Kraid Y position, set screen shaking ;;;
Instruction_Kraid_IncrementYPosition_SetScreenShaking:
    PHX ; >.<
    INC.W Enemy.YPosition
    LDA.W #$0001 : STA.W EarthquakeType
    LDA.W #$000A : STA.W EarthquakeTimer
    PLX
    RTL


;;; $B64E: Instruction - queue quake sound effect ;;;
Instruction_Kraid_QueueSFX76_Lib2_Max6:
    PHX : PHY
    LDA.W #$0076
    JSL QueueSound_Lib2_Max6
    PLY : PLX
    RTL


;;; $B65A: Instruction - Kraid X position -= 3 ;;;
Instruction_Kraid_XPositionMinus3:
    PHX ; >.<
    LDA.W Enemy.XPosition : SEC : SBC.W KraidForwardsSpeed : STA.W Enemy.XPosition
    PLX
    RTL


;;; $B667: Instruction - Kraid X position -= 3 ;;;
Instruction_Kraid_XPositionMinus3_duplicate:
    PHX ; >.<
    LDA.W Enemy.XPosition : SEC : SBC.W KraidForwardsSpeed : STA.W Enemy.XPosition
    PLX
    RTL


;;; $B674: Instruction - Kraid X position += 3 ;;;
Instruction_Kraid_XPositionPlus3:
    PHX : PHY ; >.<
    LDA.W KraidBackwardsSpeed : CLC : ADC.W Enemy.XPosition : STA.W Enemy.XPosition
    PLY : PLX
    RTL


if !FEATURE_KEEP_UNREFERENCED
;;; $B683: Unused. Instruction - move Kraid right ;;;
UNUSED_Instruction_Kraid_MoveRight_A7B683:
    PHX : PHY
    LDA.W Enemy.XPosition : CMP.W #$0140 : BMI .leftScreen
    LDA.L Kraid.targetXPosition : DEC : STA.L Kraid.targetXPosition : BNE .return

  .leftScreen:
    LDX.W #$0000
    STZ.B DP_Temp12
    LDA.W UNUSED_KraidBackwardsFastSpeed_A7A922 : STA.B DP_Temp14
    JSL MoveEnemyRightBy_14_12_IgnoreSlopes
    BCS .collision

  .return:
    PLY : PLX
    RTL

  .collision:
    LDA.W #$0000 : STA.W EarthquakeType
    LDA.W #$0007 : STA.W EarthquakeTimer
    LDA.W Enemy.XPosition : STA.W Enemy[5].XPosition
    BRA .return
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $B6BF: Kraid function - Kraid shot - initialise Kraid eye glowing ;;;
Function_Kraid_KraidShot_InitializeEyeGlowing:
    LDA.W #Function_Kraid_KraidShot_KraidsMouthIsOpen : STA.W Kraid.function
    LDA.W #Function_Kraid_KraidShot_GlowEye : STA.W Kraid.function
    LDA.W #InstList_Kraid_EyeGlowing_1 : STA.W Kraid.instListPointer
    LDA.W InstList_Kraid_EyeGlowing_0 : STA.W Kraid.instructionTimer
; fallthrough to Function_Kraid_KraidShot_GlowEye


;;; $B6D7: Kraid function - Kraid shot - glow Kraid's eye ;;;
Function_Kraid_KraidShot_GlowEye:
    PHX : PHY
    JSR KraidInstListHandling
    CMP.W #$FFFF : BNE .notTerminator
    LDA.W #$0100 ; >.<
    LDA.W Kraid.instructionTimer ; >.< meant to be STA?

  .notTerminator:
    LDX.W #$00E2
    LDY.W #$0000

  .loop:
    LDA.L Palettes,X : AND.W #$001F : CLC : ADC.W #$0001 : CMP.W #$001F : BMI +
    INY
    LDA.W #$001F

+   STA.B DP_Temp12
    LDA.L Palettes,X : AND.W #$03E0 : CLC : ADC.W #$0020 : CMP.W #$03E0 : BMI +
    INY
    LDA.W #$03E0

+   STA.B DP_Temp14
    LDA.L Palettes,X : AND.W #$FC00 : ORA.B DP_Temp12 : ORA.B DP_Temp14 : STA.L Palettes,X
    INX #2 : CPX.W #$00E8 : BMI .loop
    CPY.W #$0006 : BMI .return
    LDA.W #Function_Kraid_KraidShot_UnglowEye : STA.W Kraid.function

  .return:
    PLY : PLX
    RTL


;;; $B73D: Kraid function - Kraid shot - unglow Kraid's eye ;;;
Function_Kraid_KraidShot_UnglowEye:
    PHX : PHY
    LDX.W #$000E
    LDA.W Enemy.health

  .loopHealth:
    CMP.L Kraid.maxHealth_1_8,X : BPL .getIndexY
    DEX #2 : BNE .loopHealth

  .getIndexY:
    INX #2
    TXA : ASL #4 : TAY
    LDX.W #$00E2
    STZ.B DP_Temp14

  .loop:
    LDA.L Palettes,X : AND.W #$001F : STA.B DP_Temp12
    LDA.W Palette_Kraid_BG_HurtFlash+2,Y : AND.W #$001F : CMP.B DP_Temp12 : BEQ +
    INC.B DP_Temp14
    LDA.L Palettes,X : DEC : STA.L Palettes,X

+   LDA.L Palettes,X : AND.W #$03E0 : STA.B DP_Temp12
    LDA.W Palette_Kraid_BG_HurtFlash+2,Y : AND.W #$03E0 : CMP.B DP_Temp12 : BEQ .next
    INC.B DP_Temp14
    LDA.L Palettes,X : SEC : SBC.W #$0020 : STA.L Palettes,X

  .next:
    INX #2
    INY #2
    CPX.W #$00E8 : BMI .loop
    LDA.B DP_Temp14 : BNE .return
    LDA.W #Function_Kraid_KraidShot_KraidsMouthIsOpen : STA.W Kraid.function
    LDA.W #InstList_Kraid_Roar_1 : STA.W Kraid.instListPointer
    LDA.W InstList_Kraid_Roar_0 : STA.W Kraid.instructionTimer

  .return:
    PLY : PLX
    RTL


;;; $B7BD: Main AI - enemy $E2FF (Kraid arm) ;;;
MainAI_KraidArm:
    LDA.W Layer1YPosition : CLC : ADC.W #$00E0 : STA.B DP_Temp12
    LDA.W Enemy.YPosition : SEC : SBC.W #$002C : STA.W Enemy[1].YPosition
    TAY
    LDA.W Enemy[1].properties : ORA.W #$0100
    CPY.W Layer1YPosition : BMI +
    CPY.B DP_Temp12 : BPL +
    AND.W #$FEFF

+   STA.W Enemy[1].properties
    LDA.W Enemy.XPosition : CLC : ADC.W #$0000 : STA.W Enemy[1].XPosition
    LDA.L Kraid.mouthReopenFlags : BIT.W #$FF00 : BEQ .return
    LDA.W Enemy[1].instTimer : INC : STA.W Enemy[1].instTimer

  .return:
    RTL


;;; $B801: Main AI - enemy $E33F (Kraid top lint) ;;;
MainAI_KraidLintTop:
    LDX.W #$0080
    LDA.W #$7FFF : STA.W Enemy.instTimer,X
    JMP MainAI_KraidLintCommon


;;; $B80D: Main AI - enemy $E37F (Kraid middle lint) ;;;
MainAI_KraidLintMiddle:
    LDX.W #$00C0
    LDA.W #$7FFF : STA.W Enemy.instTimer,X
    JMP MainAI_KraidLintCommon


;;; $B819: Main AI - enemy $E3BF (Kraid bottom lint) ;;;
MainAI_KraidLintBottom:
    LDX.W #$0100
    LDA.W #$7FFF : STA.W Enemy.instTimer,X
; fallthrough to MainAI_KraidLintCommon


;;; $B822: Kraid lint main AI ;;;
MainAI_KraidLintCommon:
    JSR KraidLint_vs_Samus_CollisionHandling
    LDA.W Layer1YPosition : CLC : ADC.W #$00E0 : STA.B DP_Temp12
    JMP.W (Kraid.function,X)


RTL_A7B831:
    RTL


;;; $B832: Kraid lint function - produce lint ;;;
Function_KraidLint_ProduceLint:
    LDA.W Enemy.properties,X : AND.W #$FEFF : AND.W #$FBFF : STA.W Enemy.properties,X ; >.< #$FAFF
    LDA.W Enemy.XPosition : CLC : ADC.W Kraid.instructionTimer,X
    SEC : SBC.W Kraid.instListPointer,X : STA.W Enemy.XPosition,X
    LDA.W Kraid.instListPointer,X : CLC : ADC.W #$0001 : STA.W Kraid.instListPointer,X
    CMP.W #$0020 : BMI .return
    LDA.W #Function_KraidLint_ChargeLint : STA.W Kraid.function,X
    LDA.W #$001E : STA.W Kraid.functionTimer,X

  .return:
    RTL


;;; $B868: Kraid lint function - charge lint ;;;
Function_KraidLint_ChargeLint:
    LDY.W #$0000
    LDA.W Kraid.functionTimer,X : BIT.W #$0001
    BEQ .zeroTimer
    LDY.W #$0E00

  .zeroTimer:
    TYA : STA.W Enemy.palette,X
    LDA.W Enemy.XPosition : CLC : ADC.W Kraid.instructionTimer,X
    SEC : SBC.W Kraid.instListPointer,X : STA.W Enemy.XPosition,X
    DEC.W Kraid.functionTimer,X : BNE .return
    LDA.W #Function_KraidLint_FireLint : STA.W Kraid.function,X
    LDA.W #$001F
    JSL QueueSound_Lib3_Max6

  .return:
    RTL


;;; $B89B: Kraid lint function - fire lint ;;;
Function_KraidLint_FireLint:
    LDA.W Enemy.XSubPosition,X : SEC : SBC.W KraidLint_XSubSpeed : STA.W Enemy.XSubPosition,X
    LDA.W Enemy.XPosition,X : SBC.W KraidLint_XSpeed : STA.W Enemy.XPosition,X
    CMP.W #$0038 : BPL .greaterThanEqualTo38
    PHA
    LDA.W Enemy.properties,X : ORA.W #$0400 : STA.W Enemy.properties,X
    PLA

  .greaterThanEqualTo38:
    CMP.W #$0020 : BPL .greaterThanEqualTo20
    LDA.W Enemy.properties,X : ORA.W #$0100 : STA.W Enemy.properties,X
    LDA.W #Function_KraidNail_HorizontallyAlignEnemyToKraid : STA.W Kraid.function,X
    LDA.W #$012C : STA.W Kraid.functionTimer,X
    LDA.W #Function_KraidLint_ProduceLint : STA.L Kraid.nextFunction,X
    STZ.W Kraid.instListPointer,X

  .greaterThanEqualTo20:
    JSL CheckIfEnemyIsTouchingSamusFromBelow
    AND.W #$FFFF : BEQ .return
    LDA.W ExtraSamusXSubDisplacement : SEC : SBC.W KraidLint_XSubSpeed : STA.W ExtraSamusXSubDisplacement
    LDA.W ExtraSamusXDisplacement : SBC.W KraidLint_XSpeed : CMP.W #$FFF0 : BPL .storeExtraDisplacement
    LDA.W #$FFF0

  .storeExtraDisplacement:
    STA.W ExtraSamusXDisplacement

  .return:
    RTL


;;; $B907: Kraid fingernail function - wait until top lint X position >= 100h ;;;
Function_KraidNail_WaitUntilTopLintXPosition100Plus:
    LDA.W Enemy[2].XPosition : CMP.W #$0100 : BMI .return
    LDA.L Kraid.nextFunction,X : STA.W Kraid.function,X
    LDA.W Enemy.properties,X : AND.W #$FEFF : AND.W #$FBFF : STA.W Enemy.properties,X ; >.< #$FAFF

  .return:
    RTL


;;; $B923: Kraid lint function - horizontally align enemy to Kraid ;;;
Function_KraidNail_HorizontallyAlignEnemyToKraid:
    LDA.W Enemy.XPosition : SEC : SBC.W Enemy.XHitboxRadius,X : STA.W Enemy.XPosition,X
; fallthrough to Function_Kraid_HandleFunctionTimer


;;; $B92D: Kraid enemy function - handle Kraid enemy function timer ;;;
Function_Kraid_HandleFunctionTimer:
    LDA.W Kraid.functionTimer,X : BEQ .return
    DEC.W Kraid.functionTimer,X : BNE .return
    LDA.L Kraid.nextFunction,X : STA.W Kraid.function,X

  .return:
    RTL


;;; $B93F: Kraid foot function - start retreat ;;;
Function_KraidFoot_StartRetreat:
    LDX.W EnemyIndex
    LDA.W Kraid.functionTimer,X : BEQ .return
    DEC.W Kraid.functionTimer,X : BNE .return
    LDA.L Kraid.nextFunction,X : STA.W Kraid.function,X
    LDA.W #InstList_KraidFoot_KraidIsBig_WalkingBackwards_0 : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X

  .return:
    RTL


;;; $B960: Kraid foot function - first phase - thinking ;;;
Function_KraidFoot_Phase1_Thinking:
    JSR HandleKraidPhase1
    BRA Function_Kraid_HandleFunctionTimer


;;; $B965: Kraid function - process Kraid instruction ;;;
Function_Kraid_ProcessKraidInstruction:
    JSR KraidInstListHandling
    BRA Function_Kraid_HandleFunctionTimer


;;; $B96A: Kraid lint / Samus collision handling ;;;
KraidLint_vs_Samus_CollisionHandling:
    LDA.W Enemy.properties,X : BIT.W #$0400 : BEQ .notIntangible
    RTS

  .notIntangible:
    LDA.W SamusInvincibilityTimer : BNE .return
    LDA.W Enemy.XPosition,X : CLC : ADC.W Hitbox_KraidLint+2
    SEC : SBC.W #$0002 : STA.B DP_Temp12
    LDA.W SamusXPosition : CLC : ADC.W SamusXRadius
    CMP.B DP_Temp12 : BMI .return
    LDA.W SamusXPosition : SEC : SBC.W SamusXRadius
    CMP.B DP_Temp12 : BPL .return
    LDA.W Enemy.YPosition,X : CLC : ADC.W Hitbox_KraidLint+4
    CLC : ADC.W #$0002 : STA.B DP_Temp16
    LDA.W SamusYPosition : CLC : ADC.W SamusYRadius : CMP.B DP_Temp16 : BMI .return
    LDA.W Enemy.YPosition,X : CLC : ADC.W Hitbox_KraidLint+8
    SEC : SBC.W #$0002 : STA.B DP_Temp18
    LDA.W SamusYPosition : SEC : SBC.W SamusYRadius : CMP.B DP_Temp18 : BPL .return
    LDA.W SamusXRadius : CLC : ADC.W #$0010
    EOR.W #$FFFF : CLC : ADC.W ExtraSamusXDisplacement : CMP.W #$0010 : BMI +
    LDA.W #$0010

+   STA.W ExtraSamusXDisplacement
    PHX : PHP
    JSL NormalEnemyTouchAI
    PLP : PLX
    LDA.W Enemy.properties,X : ORA.W #$0400 : STA.W Enemy.properties,X

  .return:
    RTS


;;; $B9F6: Main AI - enemy $E3FF (Kraid foot) ;;;
MainAI_KraidFoot:
    LDA.W Enemy.XPosition : STA.W Enemy[5].XPosition
    LDA.W Enemy.YPosition : CLC : ADC.W #$0064 : STA.W Enemy[5].YPosition
    TAY : SEC : SBC.W #$00E0 : TAX
    LDA.W Enemy[5].properties : AND.W #$FEFF : CPY.W Layer1YPosition : BPL .offScreen
    ORA.W #$0100
    BRA +

  .offScreen:
    CPX.W Layer1YPosition : BMI +
    ORA.W #$0100

+   STA.W Enemy[5].properties
    LDX.W EnemyIndex
    JMP.W (Enemy[5].var0)


;;; $BA2D: RTL. Kraid foot function ;;;
RTL_A7BA2D:
    RTL


;;; $BA2E: Kraid foot function - second phase - thinking ;;;
Function_KraidFoot_Phase2_Thinking:
    LDA.L ExtraEnemy7800+$140 : DEC : STA.L ExtraEnemy7800+$140 : BNE .return
    LDX.W #$0000

  .loopXPositions:
    LDA.W Enemy.XPosition : CMP.W .XPosition,X : BEQ +
    INX #4 : CPX.W #$0018 : BMI .loopXPositions
    LDX.W #$0004

+   LDA.W RandomNumberSeed : AND.W #$001C : CMP.W #$0010 : BMI +
    LDA.W #$0010

+   CLC : ADC.W .movementDataPointer,X : TAX
    LDA.W $0002,X : TAY
    LDA.W $0000,X : CMP.W Enemy.XPosition : BPL .backwards
    LDA.W $0000,X
    JSR SetKraidWalkingForwards
    RTL

  .backwards:
    LDA.W $0000,X
    JSR SetKraidWalkingBackwards

  .return:
    RTL

; Movement table
; If Kraid is at a listed X position, that entry is used, otherwise the default entry is used
; One of 5 corresponding movements is selected at random with chances 1/8, 1/8, 1/8, 1/8, 1/2

;        _________ Kraid X position
;       |      ___ Kraid movement data
;       |     |
  .XPosition:
    dw $00F0
  .movementDataPointer:
    dw       .movementData0
    dw $0160,.movementData1
    dw $0180,.movementData2
    dw $00D0,.movementData3
    dw $0140,.movementData4
    dw $0170,.movementData5

;        _________ Kraid target X position
;       |      ___ Thinking timer
;       |     |
  .movementData0:
    dw $0180,$0158, $0180,$0158, $00D0,$002C, $0170,$002C, $0170,$002C
  .movementData1:
    dw $00F0,$0100, $0180,$0158, $00D0,$002C, $0140,$002C, $0170,$002C
  .movementData2:
    dw $00F0,$0100, $0160,$0158, $00D0,$002C, $0140,$002C, $0170,$002C
  .movementData3:
    dw $00F0,$0100, $0160,$0158, $0180,$0158, $0140,$002C, $0170,$002C
  .movementData4:
    dw $00F0,$0100, $0160,$0158, $0180,$0158, $00D0,$002C, $0170,$002C
  .movementData5:
    dw $00F0,$0100, $0180,$0158, $0170,$0158, $00D0,$002C, $0140,$002C


;;; $BB0D: Set Kraid walking backwards ;;;
SetKraidWalkingBackwards:
    STA.L Kraid.targetXPosition
    TYA : STA.L ExtraEnemy7800+$140
    LDA.W #Function_KraidFoot_Phase2_WalkingBackward : STA.W Enemy[5].var0
    LDA.W #$0001 : STA.W Enemy[5].instTimer
    LDA.W #InstList_KraidFoot_KraidIsBig_WalkingBackwards_0 : STA.W Enemy[5].instList
    RTS


;;; $BB29: Set Kraid walking forwards ;;;
SetKraidWalkingForwards:
    STA.L Kraid.targetXPosition
    TYA : STA.L ExtraEnemy7800+$140
    LDA.W #Function_KraidFoot_Phase2_WalkingForward : STA.W Enemy[5].var0
    LDA.W #$0001 : STA.W Enemy[5].instTimer
    LDA.W #InstList_KraidFoot_KraidIsBig_WalkingForward_0 : STA.W Enemy[5].instList
    RTS


;;; $BB45: Kraid foot function - second phase - walking backwards ;;;
Function_KraidFoot_Phase2_WalkingBackward:
    LDA.L Kraid.targetXPosition : CMP.W Enemy.XPosition : BEQ .walking
    BPL .return
    STA.W Enemy.XPosition

  .walking:
    LDA.W Enemy[5].instList : CMP.W #InstList_KraidFoot_KraidIsBig_WalkingBackwards_1 : BMI .return
    LDA.W #Function_KraidFoot_Phase2_Thinking : STA.W Enemy[5].var0
    LDA.W #$0001 : STA.W Enemy[5].instTimer
    LDA.W #InstList_KraidFoot_KraidIsBig_Neutral : STA.W Enemy[5].instList

  .return:
    RTL


;;; $BB6E: Kraid foot function - second phase setup - walk to starting spot ;;;
Function_KraidFoot_Phase2Setup_WalkToStartingPoint:
    LDA.L Kraid.targetXPosition : CMP.W Enemy.XPosition : BEQ .walking
    BPL .return
    STA.W Enemy.XPosition

  .walking:
    LDA.W Enemy[5].instList : CMP.W #InstList_KraidFoot_KraidIsBig_WalkingBackwards_1 : BMI .return
    LDA.W #Function_Kraid_HandleFunctionTimer : STA.W Enemy[5].var0
    LDA.W #$00B4 : STA.W Enemy[5].var5
    LDA.W #Function_KraidFoot_Phase2Setup_InitializePhase2 : STA.L ExtraEnemy7800+$140
    LDA.W #$0001 : STA.W Enemy[5].instTimer
    LDA.W #InstList_KraidFoot_KraidIsBig_Neutral : STA.W Enemy[5].instList

  .return:
    RTL


;;; $BBA4: Kraid foot function - second phase setup - initialise second phase ;;;
Function_KraidFoot_Phase2Setup_InitializePhase2:
    LDA.W #$0160
    LDY.W #$00B4
    JSR SetKraidWalkingBackwards
    RTL


;;; $BBAE: Kraid foot function - second phase - walking forwards ;;;
Function_KraidFoot_Phase2_WalkingForward:
    LDA.L Kraid.targetXPosition : CMP.W Enemy.XPosition : BMI .forwards
    STA.W Enemy.XPosition
    LDA.W Enemy[5].instList : CMP.W #InstList_KraidFoot_KraidIsBig_WalkingForward_1 : BNE .return
    LDA.W #Function_KraidFoot_Phase2_Thinking : STA.W Enemy[5].var0
    LDA.W #$0001 : STA.W Enemy[5].instTimer
    LDA.W #InstList_KraidFoot_KraidIsBig_Neutral : STA.W Enemy[5].instList

  .return:
    RTL

  .forwards:
    LDA.W Enemy[5].instList : CMP.W #InstList_KraidFoot_KraidIsBig_WalkingForward_1 : BNE .return
    LDA.W #InstList_KraidFoot_KraidIsBig_WalkingForward_0 : STA.W Enemy[5].instList
    LDA.W #$0001 : STA.W Enemy[5].instTimer
    RTL


;;; $BBEA: Kraid function - Kraid main loop - attacking with mouth open ;;;
Function_KraidMainLoop_AttackingWithMouthOpen:
    JSR KraidInstListHandling
    CMP.W #$FFFF : BEQ .finishedInstructions
    LDA.W Kraid.instListPointer : SEC : SBC.W #$0008 : TAX
    LDA.W $0002,X : CMP.W #Tilemap_KraidHead_3 : BNE .return
    LDA.W Kraid.instructionTimer : AND.W #$000F : BNE .return
    LDY.W #EnemyProjectile_KraidRockSpit
    LDA.W RandomNumberSeed : AND.W #$000E : TAX
    LDA.W .rockSpitXVelocities,X
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    LDA.W #$001E
    JSL QueueSound_Lib3_Max6

  .return:
    RTL

  .finishedInstructions:
    JSR SetupKraidMainLoop_Thinking
    LDA.W #$005A : STA.W Kraid.instructionTimer
    LDA.L Kraid.mouthReopenFlags : BIT.W #$0004 : BEQ .done
    SEC : SBC.W #$0100 : STA.L Kraid.mouthReopenFlags
    AND.W #$FF00 : BEQ .done
    LDA.W #Function_Kraid_HandleFunctionTimer : STA.W Kraid.function
    LDA.W #$0040 : STA.W Kraid.functionTimer
    LDA.W #Function_Kraid_KraidShot_InitializeEyeGlowing : STA.L Kraid.nextFunction
    LDA.W #$0002 : STA.L ExtraEnemy7800+2
    RTL

  .done:
    LDA.W #$0000 : STA.L Kraid.mouthReopenFlags
    RTL

  .rockSpitXVelocities:
; Rock spit X velocities. Unit 1/100h px/frame
    dw $FC00,$FC40,$FB40,$FB80,$FB40,$FC00,$FB80,$FC40


if !FEATURE_KEEP_UNREFERENCED
;;; $BC75: Unused. Lunge forward if Samus is not invincible ;;;
UNUSED_KraidFoot_LungeForwardIfSamusIsNotInvincible_A7BC75:
; Possibly an old Samus / Kraid foot collision reaction
    LDA.W Enemy[5].instList : CMP.W #InstList_KraidFoot_LungeForward_1 : BMI .return
    LDA.W SamusInvincibilityTimer : BEQ .lunge
    LDA.W #Function_KraidFoot_Phase2_WalkingBackward : STA.W Enemy[5].var0
    LDA.W Layer1XPosition : CLC : ADC.W #$0120 : CMP.W #$0120 : BMI +
    LDA.W #$0120

+   STA.L Kraid.targetXPosition
    LDA.W #$0001 : STA.W Enemy[5].instTimer
    LDA.W #InstList_KraidFoot_KraidIsBig_WalkingBackwards_0 : STA.W Enemy[5].instList

  .return:
    RTL

  .lunge:
    LDA.W #$0001 : STA.W Enemy[5].instTimer
    LDA.W #InstList_KraidFoot_LungeForward_0 : STA.W Enemy[5].instList
    RTL


;;; $BCB5: Unused. Fire lint after [A] frames ;;;
UNUSED_Kraid_FireLintAfterAFrames_A7BCB5:
    STA.W Kraid.functionTimer,X
    LDA.W #Function_KraidNail_HorizontallyAlignEnemyToKraid : STA.W Kraid.function,X
    LDA.W #Function_KraidLint_FireLint : STA.L Kraid.nextFunction,X
    LDA.W Enemy.properties,X : ORA.W #$0100 : STA.W Enemy.properties,X
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $BCCF: Enemy touch - enemy $E43F (Kraid good fingernail) ;;;
EnemyTouch_KraidNail:
    JSL NormalEnemyTouchAI
    LDX.W EnemyIndex
    JSL EnemyDeath
    LDX.W EnemyIndex
    RTL


;;; $BCDE: Enemy touch - enemy $E47F (Kraid bad fingernail) ;;;
EnemyTouch_KraidNailBad:
    JSL NormalEnemyTouchAI
    LDX.W EnemyIndex
    JSL EnemyDeath
    LDX.W EnemyIndex
    RTL


;;; $BCED: RTL ;;;
RTL_A7BCED:
    RTL


;;; $BCEE: RTL ;;;
RTL_A7BCEE:
    RTL


;;; $BCEF: Initialisation AI - enemy $E43F (Kraid good fingernail) ;;;
InitAI_KraidNail:
    LDX.W EnemyIndex
; fallthrough to InitAI_KraidNail_WithoutLoadingEnemyIndex


;;; $BCF2: Kraid's fingernails initialisation AI ;;;
InitAI_KraidNail_Common:
    LDA.W Enemy.palette : STA.W Enemy.palette,X
    LDA.W #$0028 : STA.W Kraid.instListPointer,X
    LDA.W Enemy.properties,X : ORA.W #$0100 : STA.W Enemy.properties,X
    LDA.W #$7FFF : STA.W Enemy.instTimer,X
    LDA.W #InstList_KraidNail : STA.W Enemy.instList,X
    LDA.W InstList_KraidNail+2 : STA.W Enemy.spritemap,X
    LDA.W #Function_KraidNail_Initialize : STA.L Kraid.nextFunction,X
    LDA.W #Function_Kraid_HandleFunctionTimer : STA.W Kraid.function,X
    LDA.W #$0040 : STA.W Kraid.functionTimer,X
    RTL


;;; $BD2D: Initialisation AI - enemy $E47F (Kraid bad fingernail) ;;;
InitAI_KraidNailBad:
    LDX.W EnemyIndex
    BRA InitAI_KraidNail_Common


;;; $BD32: Main AI - enemy $E43F (Kraid good fingernail) ;;;
MainAI_KraidNail:
    REP #$30
    LDA.W Enemy.health : CMP.W #$0001 : BMI .delete
    JMP.W (Enemy[6].var0)

  .delete:
    LDA.W Enemy[6].properties : ORA.W #$0300 : STA.W Enemy[6].properties
    RTL


;;; $BD49: Main AI - enemy $E47F (Kraid bad fingernail) ;;;
MainAI_KraidNailBad:
    REP #$30
    LDA.W Enemy.health : CMP.W #$0001 : BMI .delete
    JMP.W (Enemy[7].var0)

  .delete:
    LDA.W Enemy[7].properties : ORA.W #$0300 : STA.W Enemy[7].properties
    RTL


;;; $BD60: Kraid fingernail function - initialise fingernail ;;;
Function_KraidNail_Initialize:
    LDA.W RandomNumberSeed : AND.W #$0006 : TAY
    LDA.W Enemy[6].var4
    LDX.W EnemyIndex : CPX.W #$0180 : BNE +
    LDA.W Enemy[7].var4

+   CMP.W #$0000 : BPL .positiveYVelocity
    LDA.W .upwardsVelocityPointers,Y
    BRA +

  .positiveYVelocity:
    LDA.W .downwardsVelocityPointers,Y

+   TAY
    LDA.W $0000,Y : STA.W Kraid.instListPointer,X
    LDA.W $0002,Y : STA.W Kraid.instructionTimer,X
    LDA.W $0004,Y : STA.W Enemy.var3,X
    LDA.W $0006,Y : STA.W Enemy.var4,X
    LDA.W #$0001 : STA.W Enemy.init0,X
    LDA.W Enemy.properties,X : AND.W #$FEFF : AND.W #$FBFF : STA.W Enemy.properties,X ; >.< #$FAFF
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDA.W #InstList_KraidNail : STA.W Enemy.instList,X
    LDA.W #Function_KraidNail_Fire : STA.W Kraid.function,X
    LDA.W RandomNumberSeed : BIT.W #$0001 : BNE .horizontal

  .diagonal:
    LDA.W #$0000 : STA.L Kraid.maxHealth_2_8,X
    LDA.W Enemy.XPosition : SEC : SBC.W Enemy.XHitboxRadius
    SEC : SBC.W Enemy.XHitboxRadius,X : AND.W #$FFF0 : STA.W Enemy.XPosition,X
    LDA.W Enemy[1].YPosition : CLC : ADC.W #$0080 : STA.W Enemy.YPosition,X
    RTL

  .horizontal:
    LDA.L ExtraEnemy7800+$18E
    CPX.W #$01C0 : BEQ .notKraidNailBad
    LDA.L ExtraEnemy7800+$1CE

  .notKraidNailBad:
    CMP.W #$0001 : BEQ .diagonal
    LDA.W #$0001 : STA.L Kraid.maxHealth_2_8,X
    LDA.W #$0032 : STA.W Enemy.XPosition,X
    LDA.W #$00F0 : STA.W Enemy.YPosition,X
    LDA.W #$0000 : STA.W Kraid.instListPointer,X
    LDA.W #$0001 : STA.W Kraid.instructionTimer,X
    LDA.W #$0000 : STA.W Enemy.var3,X
    LDA.W #$0000 : STA.W Enemy.var4,X
    LDA.W #Function_KraidNail_WaitUntilTopLintXPosition100Plus : STA.W Kraid.function,X
    LDA.W #Function_KraidNail_Fire : STA.L Kraid.nextFunction,X
    LDA.W Enemy.properties,X : ORA.W #$0500 : STA.W Enemy.properties,X
    RTL

  .upwardsVelocityPointers:
; Table of Kraid fingernail upwards velocities
    dw .upwards0
    dw .upwards1
    dw .upwards2
    dw .upwards3

  .downwardsVelocityPointers:
; Table of Kraid fingernail downwards velocities
    dw .downwards0
    dw .downwards1
    dw .downwards2
    dw .downwards3

;        _____________________ X subvelocity
;       |      _______________ X velocity
;       |     |      _________ Y subvelocity
;       |     |     |      ___ Y velocity
;       |     |     |     |
  .upwards0:
    dw $0000,$FFFF,$0000,$0001
  .downwards0:
    dw $0000,$FFFF,$0000,$FFFF
  .upwards1:
    dw $0000,$FFFF,$0000,$0001
  .downwards1:
    dw $0000,$FFFF,$0000,$FFFF
  .upwards2:
    dw $0000,$FFFF,$0000,$0001
  .downwards2:
    dw $0000,$FFFF,$0000,$FFFF
  .upwards3:
    dw $0000,$FFFF,$0000,$0001
  .downwards3:
    dw $0000,$FFFF,$0000,$FFFF


;;; $BE8E: Kraid fingernail function - fire fingernail ;;;
Function_KraidNail_Fire:
; Note the three fixed point negation operations at $BE9E, $BEE2 and $BF06 are off by 1.0 when the low word is zero
    LDA.W Kraid.instListPointer,X : STA.B DP_Temp12
    LDA.W Kraid.instructionTimer,X : STA.B DP_Temp14
    JSL MoveEnemyRightBy_14_12_IgnoreSlopes
    BCC .loopSetup
    LDA.W Kraid.instListPointer,X : EOR.W #$FFFF : INC : STA.W Kraid.instListPointer,X
    LDA.W Kraid.instructionTimer,X : EOR.W #$FFFF : INC : STA.W Kraid.instructionTimer,X
    BRA .bounced

  .loopSetup:
    LDY.W #$0000

  .loop:
    LDA.W Enemy.YPosition : CLC : ADC.W .topBoundaryOffset,Y : CMP.W Enemy.YPosition,X : BMI +
    INY #4
    BRA .loop

+   LDA.W Enemy.XPosition : CLC : ADC.W .leftBoundaryOffset,Y : STA.B DP_Temp12
    LDA.W Enemy.XPosition,X : CLC : ADC.W Enemy.XHitboxRadius,X : CMP.B DP_Temp12 : BMI .bounced
    LDA.W Kraid.instructionTimer,X : BMI .bounced
    LDA.W Kraid.instListPointer,X : EOR.W #$FFFF : INC : STA.W Kraid.instListPointer,X
    LDA.W Kraid.instructionTimer,X : EOR.W #$FFFF : INC : STA.W Kraid.instructionTimer,X

  .bounced:
    LDA.W Enemy.var3,X : STA.B DP_Temp12
    LDA.W Enemy.var4,X : STA.B DP_Temp14
    JSL MoveEnemyDownBy_14_12
    BCC .return
    LDA.W Enemy.var3,X : EOR.W #$FFFF : INC : STA.W Enemy.var3,X
    LDA.W Enemy.var4,X : EOR.W #$FFFF : ADC.W #$0000 : STA.W Enemy.var4,X

  .return:
    RTL

;        _________ Left boundary offset
;       |      ___ Top boundary offset
;       |     |
  .leftBoundaryOffset:
    dw $FFC0
  .topBoundaryOffset:
    dw       $0010
    dw $FFD8,$FFD8
    dw $FFF0,$FFA0
    dw $0008,$FF80


;;; $BF2D: Kraid foot function - first phase - prepare to lunge forward ;;;
Function_KraidFoot_Phase1_PrepareToLungeForward:
    JSR HandleKraidPhase1
    LDA.W Enemy[1].instList : CMP.W #InstList_KraidArm_Normal_1 : BMI .return
    LDA.W #InstList_KraidArm_Dying_PreparingToLungeForward : STA.W Enemy[1].instList
    LDA.W #$0001 : STA.W Enemy[1].instTimer
    LDA.W #$0001 : STA.W Enemy[5].instTimer
    LDA.W #InstList_KraidFoot_LungeForward_0 : STA.W Enemy[5].instList
    LDA.W #Function_KraidFoot_Phase1_LungeForward : STA.W Enemy[5].var0
    LDA.W #$0000 : STA.W Enemy[5].var5

  .return:
    RTL


;;; $BF5D: Kraid foot function - first phase - lunge forward ;;;
Function_KraidFoot_Phase1_LungeForward:
    JSR HandleKraidPhase1
    LDA.W Enemy.XPosition : CMP.W #$005C : BPL +
    LDA.W #$005C : STA.W Enemy.XPosition

+   LDA.W Enemy[5].instList : CMP.W #InstList_KraidFoot_LungeForward_1 : BNE .return
    LDA.W Enemy.XPosition : CMP.W #$005C : BEQ .done
    LDA.W #$0001 : STA.W Enemy[5].instTimer
    LDA.W #InstList_KraidFoot_LungeForward_0 : STA.W Enemy[5].instList
    RTL

  .done:
    LDA.W #Function_KraidFoot_Phase1_RetreatFromLunge : STA.L ExtraEnemy7800+$140
    LDA.W #Function_KraidFoot_StartRetreat : STA.W Enemy[5].var0
    LDA.W #$0001 : STA.W Enemy[5].var5
    LDA.W #$0001 : STA.W Enemy[5].instTimer
    LDA.W #InstList_KraidFoot_KraidIsBig_Neutral : STA.W Enemy[5].instList

  .return:
    RTL


;;; $BFAB: Kraid foot function - first phase - retreat from lunge ;;;
Function_KraidFoot_Phase1_RetreatFromLunge:
    JSR HandleKraidPhase1
    LDA.W Enemy.XPosition : CMP.W #$00B0 : BMI +
    LDA.W #$00B0 : STA.W Enemy.XPosition

+   LDA.W Enemy[5].instList : CMP.W #InstList_KraidFoot_KraidIsBig_WalkingBackwards_1 : BMI .return
    LDA.W Enemy.XPosition : CMP.W #$00B0 : BEQ .done
    LDA.W #InstList_KraidFoot_KraidIsBig_WalkingBackwards_0 : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    RTL

  .done:
    LDA.W #InstList_KraidArm_Normal_0 : STA.W Enemy[1].instList
    LDA.W #$0001 : STA.W Enemy[1].instTimer
    LDA.W #$0001 : STA.W Enemy[5].instTimer
    LDA.W #InstList_KraidFoot_KraidIsBig_Neutral : STA.W Enemy[5].instList
    LDA.W #Function_KraidFoot_Phase1_Thinking : STA.W Enemy[5].var0
    LDA.W #$012C : STA.W Enemy[5].var5
    LDA.W #Function_KraidFoot_Phase1_PrepareToLungeForward : STA.L ExtraEnemy7800+$140

  .return:
    RTL


;;; $C005: Handle Kraid's first phase ;;;
HandleKraidPhase1:
; This routine contains the cause of the Kraid quick kill.

; In order to close Kraid's mouth once he's sustained enough damage,
; this routine is setting Kraid's instruction list pointer to one of his roar instructions where his mouth is closing
; ($96F4/$96FC/$9704/$970C) depending on what tilemap pointer he's set to have.

; When Kraid is shot and his instruction list pointer is $96EA/$96EC (the magic animation frame),
; his instruction list pointer is set to $96F4 accordingly,
; the instruction timer being set to 40h (as specified by the previous instruction),
; which is the cause of the animation freeze that allows Samus to quickly kill Kraid.

; The 40h frame delay makes sense in the usual context of the roar instruction list,
; as $96EC is the instruction list pointer used for keeping Kraid's mouth open during the roar sound effect.

; Easiest way to fix this is to set the Kraid instruction timer to Ah unconditionally (instead of hoping it's Ah from instruction list lookup).
; I.e. $C04C = LDA #$000A
    LDA.W Enemy.health : CMP.L Kraid.maxHealth_7_8 : BMI .getBig
    RTS

  .getBig:
    LDA.W #Function_Kraid_ProcessKraidInstruction : STA.W Kraid.function
    LDA.W #$00B4 : STA.W Kraid.functionTimer
    LDA.W #Function_Kraid_GetBig_ReleaseCamera : STA.L Kraid.nextFunction
    LDA.W Kraid.instListPointer : TAX
    LDA.W $0002,X
    LDY.W #$0032
    CMP.W #Tilemap_KraidHead_0 : BEQ +
    LDY.W #$002A
    CMP.W #Tilemap_KraidHead_1 : BEQ +
    LDY.W #$0022
    CMP.W #Tilemap_KraidHead_2 : BEQ +
    LDY.W #$001A

+   TYA : CLC : ADC.W #InstList_Kraid_Roar_1 : STA.W Kraid.instListPointer
    LDA.W InstList_Kraid_Roar_0,Y : STA.W Kraid.instructionTimer
    LDA.W #$0004 : STA.W EarthquakeType
    LDA.W #$0154 : STA.W EarthquakeTimer
    LDA.W #InstList_KraidFoot_Initial : STA.W Enemy[5].instList
    LDA.W #$0001 : STA.W Enemy[5].instTimer
    LDA.W #RTL_A7BA2D : STA.W Enemy[5].var0
    LDA.W #InstList_KraidArm_Normal_0 : STA.W Enemy[1].instList
    LDA.W #$0001 : STA.W Enemy[1].instTimer
    LDA.W Enemy[2].properties : ORA.W #$0100 : STA.W Enemy[2].properties
    LDA.W Enemy[3].properties : ORA.W #$0100 : STA.W Enemy[3].properties
    LDA.W Enemy[4].properties : ORA.W #$0100 : STA.W Enemy[4].properties
    LDA.W Enemy[1].properties : ORA.W #$0400 : STA.W Enemy[1].properties
    RTS


;;; $C0A1: Kraid function - Kraid gets big - release camera ;;;
Function_Kraid_GetBig_ReleaseCamera:
    LDA.W #Function_Kraid_KraidGetsBig_BreakCeilingIntoPlatforms : STA.W Kraid.function
    LDA.W #$0202 : STA.L Scrolls
    LDA.W #$0101 : STA.L Scrolls+2
    LDA.W #$00A4 : STA.L Kraid.minimumSamusEjectionYPosition
    RTL


if !FEATURE_KEEP_UNREFERENCED
;;; $C0BD: Unused. Crumble first section of Kraid's spike floor ;;;
UNUSED_CrumbleFirstSectionOfKraidsSpikeFloor_A7C0BD:
; Assuming PLMEntries_crumbleKraidSpikeBlocks used to be a PLM that only crumbled one block
    JSL Spawn_Hardcoded_PLM
    db $06,$1B
    dw PLMEntries_crumbleKraidSpikeBlocks
    JSL Spawn_Hardcoded_PLM
    db $07,$1B
    dw PLMEntries_crumbleKraidSpikeBlocks
    JSL Spawn_Hardcoded_PLM
    db $08,$1B
    dw PLMEntries_crumbleKraidSpikeBlocks
    JSL Spawn_Hardcoded_PLM
    db $09,$1B
    dw PLMEntries_crumbleKraidSpikeBlocks
    JSL Spawn_Hardcoded_PLM
    db $0A,$1B
    dw PLMEntries_crumbleKraidSpikeBlocks
    JSL Spawn_Hardcoded_PLM
    db $0B,$1B
    dw PLMEntries_crumbleKraidSpikeBlocks
    JSL Spawn_Hardcoded_PLM
    db $0C,$1B
    dw PLMEntries_crumbleKraidSpikeBlocks
    JSL Spawn_Hardcoded_PLM
    db $0D,$1B
    dw PLMEntries_crumbleKraidSpikeBlocks
    JSL Spawn_Hardcoded_PLM
    db $0E,$1B
    dw PLMEntries_crumbleKraidSpikeBlocks
    RTS


;;; $C106: Unused. Crumble second section of Kraid's spike floor ;;;
UNUSED_CrumbleFirstSectionOfKraidsSpikeFloor_A7C106:
; Assuming PLMEntries_crumbleKraidSpikeBlocks used to be a PLM that only crumbled one block
    JSL Spawn_Hardcoded_PLM
    db $0F,$1B
    dw PLMEntries_crumbleKraidSpikeBlocks
    JSL Spawn_Hardcoded_PLM
    db $10,$1B
    dw PLMEntries_crumbleKraidSpikeBlocks
    JSL Spawn_Hardcoded_PLM
    db $11,$1B
    dw PLMEntries_crumbleKraidSpikeBlocks
    JSL Spawn_Hardcoded_PLM
    db $12,$1B
    dw PLMEntries_crumbleKraidSpikeBlocks
    JSL Spawn_Hardcoded_PLM
    db $13,$1B
    dw PLMEntries_crumbleKraidSpikeBlocks
    RTS


;;; $C12F: Unused. Crumble third section of Kraid's spike floor ;;;
UNUSED_CrumbleFirstSectionOfKraidsSpikeFloor_A7C12F:
; Assuming PLMEntries_crumbleKraidSpikeBlocks used to be a PLM that only crumbled one block
    JSL Spawn_Hardcoded_PLM
    db $14,$1B
    dw PLMEntries_crumbleKraidSpikeBlocks
    JSL Spawn_Hardcoded_PLM
    db $15,$1B
    dw PLMEntries_crumbleKraidSpikeBlocks
    JSL Spawn_Hardcoded_PLM
    db $16,$1B
    dw PLMEntries_crumbleKraidSpikeBlocks
    JSL Spawn_Hardcoded_PLM
    db $17,$1B
    dw PLMEntries_crumbleKraidSpikeBlocks
    JSL Spawn_Hardcoded_PLM
    db $18,$1B
    dw PLMEntries_crumbleKraidSpikeBlocks
    JSL Spawn_Hardcoded_PLM
    db $19,$1B
    dw PLMEntries_crumbleKraidSpikeBlocks
    JSL Spawn_Hardcoded_PLM
    db $1A,$1B
    dw PLMEntries_crumbleKraidSpikeBlocks
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $C168: Spawn PLM to clear the ceiling ;;;
SpawnPLMToClearTheCeiling:
    JSL Spawn_Hardcoded_PLM
    db $02,$12
    dw PLMEntries_clearKraidCeilingBlocks
    RTS


;;; $C171: Spawn PLM to clear the spikes ;;;
SpawnPLMToClearTheSpikes:
    JSL Spawn_Hardcoded_PLM
    db $05,$1B
    dw PLMEntries_clearKraidSpikeBlocks
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $C17A: Unused. Clear some of the spikes ;;;
UNUSED_ClearSomeOfTheSpikeBlocks_A7C17A:
; Assuming PLMEntries_clearKraidSpikeBlocks used to be a PLM that only crumbled one block
    JSL Spawn_Hardcoded_PLM
    db $0B,$1B
    dw PLMEntries_clearKraidSpikeBlocks
    JSL Spawn_Hardcoded_PLM
    db $0C,$1B
    dw PLMEntries_clearKraidSpikeBlocks
    JSL Spawn_Hardcoded_PLM
    db $0D,$1B
    dw PLMEntries_clearKraidSpikeBlocks
    JSL Spawn_Hardcoded_PLM
    db $0E,$1B
    dw PLMEntries_clearKraidSpikeBlocks
    JSL Spawn_Hardcoded_PLM
    db $0F,$1B
    dw PLMEntries_clearKraidSpikeBlocks
    JSL Spawn_Hardcoded_PLM
    db $10,$1B
    dw PLMEntries_clearKraidSpikeBlocks
    JSL Spawn_Hardcoded_PLM
    db $11,$1B
    dw PLMEntries_clearKraidSpikeBlocks
    JSL Spawn_Hardcoded_PLM
    db $12,$1B
    dw PLMEntries_clearKraidSpikeBlocks
    JSL Spawn_Hardcoded_PLM
    db $13,$1B
    dw PLMEntries_clearKraidSpikeBlocks
    JSL Spawn_Hardcoded_PLM
    db $14,$1B
    dw PLMEntries_clearKraidSpikeBlocks
    JSL Spawn_Hardcoded_PLM
    db $15,$1B
    dw PLMEntries_clearKraidSpikeBlocks
    JSL Spawn_Hardcoded_PLM
    db $16,$1B
    dw PLMEntries_clearKraidSpikeBlocks
    JSL Spawn_Hardcoded_PLM
    db $17,$1B
    dw PLMEntries_clearKraidSpikeBlocks
    JSL Spawn_Hardcoded_PLM
    db $18,$1B
    dw PLMEntries_clearKraidSpikeBlocks
    JSL Spawn_Hardcoded_PLM
    db $19,$1B
    dw PLMEntries_clearKraidSpikeBlocks
    JSL Spawn_Hardcoded_PLM
    db $1A,$1B
    dw PLMEntries_clearKraidSpikeBlocks
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $C1FB: Unpause hook - Kraid is dead ;;;
UnpauseHook_KraidIsDead:
    PHP
    SEP #$20
    JSL SetForceBlankAndWaitForNMI
    LDA.B #$00 : STA.W $2116
    LDA.B DP_BGTilesAddr : AND.B #$0F : ASL #4
    CLC : ADC.B #$3F : STA.W $2117
    LDA.B #$80 : STA.W $2115
    JSL SetupHDMATransfer
    db $01,$01,$18
    dl Tiles_KraidRoomBackground
    dw $0200
    LDA.B #$02 : STA.W $420B
    LDA.B #$00 : STA.W $2116
    LDA.B #$40 : STA.W $2117
    LDA.B #$80 : STA.W $2115
    JSL SetupHDMATransfer
    db $01,$01,$18
    dl Tiles_Standard_BG3
    dw $0800
    LDA.B #$02 : STA.W $420B
    JMP TransferKraidTopHalfTilemapToVRAM


;;; $C24E: Unpause hook - Kraid is alive ;;;
UnpauseHook_KraidIsAlive:
; DP_BGTilesAddr isn't being masked, so this code only works because BG1 tiles base address = $0000
    PHP
    SEP #$20
    JSL SetForceBlankAndWaitForNMI
    LDA.B #$00 : STA.W $2116
    LDA.B DP_BGTilesAddr : CLC : ADC.B #$3E : STA.W $2117
    LDA.B #$80 : STA.W $2115
    JSL SetupHDMATransfer
    db $01,$01,$18
    dl CopyOfVRAMDuringPauseMenuKraidRoom
    dw $0400
    LDA.B #$02 : STA.W $420B
; fallthrough to TransferKraidTopHalfTilemapToVRAM


;;; $C278: Transfer Kraid top half tilemap to VRAM ;;;
TransferKraidTopHalfTilemapToVRAM:
    LDA.B #$00 : STA.W $2116
    LDA.B DP_BG2TilemapAddrSize : AND.B #$FC : STA.W $2117
    LDA.B #$80 : STA.W $2115
    JSL SetupHDMATransfer
    db $01,$01,$18
    dl EnemyBG2Tilemap
    dw $0800
    LDA.B #$02 : STA.W $420B
    JSL ClearForceBlankAndWaitForNMI
    PLP
    RTL


;;; $C2A0: Unpause hook - Kraid is sinking ;;;
UnpauseHook_KraidIsSinking:
; DP_BGTilesAddr isn't being masked, so this code only works because BG1 tiles base address = $0000
; Note that this routine is spending a frame on each row of Kraid it erases (worst case, 28 frames),
; the forced blank isn't even being used to transfer the tilemap on demand... and only one transfer is being queued per frame...
; Also note that VRAMWriteStack is being loaded for no reason (guaranteed to be 0), in fact, if it wasn't guaranteed to be 0,
; this loading procedure would end up repeating every transfer that was requested before this routine was started.
    PHP
    SEP #$20
    JSL SetForceBlankAndWaitForNMI
    LDA.B #$00 : STA.W $2116
    LDA.B DP_BGTilesAddr : CLC : ADC.B #$3E : STA.W $2117
    LDA.B #$80 : STA.W $2115
    JSL SetupHDMATransfer
    db $01,$01,$18
    dl CopyOfVRAMDuringPauseMenuKraidRoom
    dw $0400
    LDA.B #$02 : STA.W $420B
    REP #$30
    PHB
    PHK : PLB
    LDA.W Enemy.YPosition : CMP.W ShrinkingKraidTable_KraidYPosition : BMI .return
    LDY.W #$0000
    LDX.W VRAMWriteStack

  .loop:
    REP #$30
    LDA.W ShrinkingKraidTable_KraidYPosition,Y : CMP.W #$FFFF : BEQ .return
    LDA.W Enemy.YPosition : CMP.W ShrinkingKraidTable_KraidYPosition,Y : BMI .return
    LDA.W #$0040 : STA.B VRAMWrite.size,X
    LDA.W #EnemyBG2Tilemap+$FC0 : STA.B VRAMWrite.src,X
    LDA.W #EnemyBG2Tilemap>>16 : STA.B VRAMWrite.src+2,X
    LDA.B DP_BG2TilemapAddrSize : AND.W #$00FC : XBA
    CLC : ADC.W ShrinkingKraidTable_VRAMBG2TilemapOffset,Y : STA.B VRAMWrite.dest,X
    TXA : CLC : ADC.W #$0007 : STA.W VRAMWriteStack
    JSL WaitForNMI
    TYA : CLC : ADC.W #$0006 : TAY
    BRA .loop

  .return:
    PLB
    JSL SetForceBlankAndWaitForNMI
    PLP
    RTL


;;; $C325: Pause hook - Kraid ;;;
PauseHook_Kraid:
; DP_BGTilesAddr is being masked as if its a tilemap register (completely wrong), so this code only works because BG1/2 tiles base address = $0000
    PHP
    REP #$30
    LDX.W VRAMReadStack
    LDA.B DP_BGTilesAddr : AND.W #$00FC : XBA
    CLC : ADC.W #$3E00 : STA.W VRAMRead.src,X
    LDA.W #$0081 : STA.W VRAMRead.control,X
    LDA.W #$0039 : STA.W VRAMRead.target,X
    LDA.W #CopyOfVRAMDuringPauseMenuKraidRoom : STA.W VRAMRead.dest,X
    LDA.W #CopyOfVRAMDuringPauseMenuKraidRoom>>16 : STA.W VRAMRead.dest+2,X
    LDA.W #$0400 : STA.W VRAMRead.size,X
    TXA : CLC : ADC.W #$0009 : STA.W VRAMReadStack
    PLP
    RTL


;;; $C360: Kraid death - initialise death ;;;
KraidDeath_Initialize:
    LDA.L Kraid.hurtFrame : BEQ .notHurtFrame
    RTL

  .notHurtFrame:
    LDX.W #$00C0
    LDA.W #$0000

  .loopPalette6:
    STA.L TargetPalettes_BGP0,X
    INX #2 : CPX.W #$00E0 : BMI .loopPalette6
    LDX.W #$001E

  .loopPalette7:
    LDA.W Palette_Kraid_Death,X : STA.L Palettes_BG12P7,X
    DEX #2 : BPL .loopPalette7
    LDA.W #InstList_KraidArm_Dying_PreparingToLungeForward : STA.W Enemy[1].instList
    LDA.W #$0001 : STA.W Enemy[1].instTimer
    LDA.W #KraidDeath_FadeOutBackground : STA.W Kraid.function
    LDA.W #InstList_Kraid_Dying_1 : STA.W Kraid.instListPointer
    LDA.W InstList_Kraid_Dying_0 : STA.W Kraid.instructionTimer
    LDX.W EnemyIndex : PHX
    LDA.W Enemy[6].properties : AND.W #$BFFF : STA.W Enemy[6].properties
    LDA.W #$0180 : STA.W EnemyIndex
    JSL EnemyDeath
    LDA.W Enemy[7].properties : AND.W #$BFFF : STA.W Enemy[7].properties
    LDA.W #$01C0 : STA.W EnemyIndex
    JSL EnemyDeath
    LDA.W #$0080 : STA.W EnemyIndex
    JSL EnemyDeath
    LDA.W #$00C0 : STA.W EnemyIndex
    JSL EnemyDeath
    LDA.W #$0100 : STA.W EnemyIndex
    JSL EnemyDeath
    PLA : STA.W EnemyIndex
    JSL Spawn_Hardcoded_PLM
    db $05,$1B
    dw PLMEntries_crumbleKraidSpikeBlocks
    RTL


;;; $C3F9: Kraid death - fade out background ;;;
KraidDeath_FadeOutBackground:
; Note that BG1 tiles base address = (DP_BGTilesAddr & Fh) * 1000h, whereas this routine is using (DP_BGTilesAddr & Fh) * 100h,
; i.e. this routine only works because BG1 tiles base address = $0000
    JSR KraidInstListHandling
    JSL Advance_GradualColorChange_ofBGPalette6
    BCC .return
    LDA.W #KraidDeath_UpdateBG2TilemapTopHalf : STA.W Kraid.function
    LDA.W #$0001 : STA.L Kraid.hurtFrameTimer : STA.L Kraid.hurtFrame
    JSR KraidPaletteHandling
    LDX.W #$0000
    LDA.W #$0000

  .loopClearRoomBackground:
    STA.L BG2Tilemap,X : STA.L BG2Tilemap+2,X
    INX #4 : CPX.W #$0200 : BMI .loopClearRoomBackground
    LDX.W VRAMWriteStack
    LDA.W #$0200 : STA.B VRAMWrite.size,X
    LDA.W #BG2Tilemap : STA.B VRAMWrite.src,X
    SEP #$20
    LDA.B #BG2Tilemap>>16 : STA.B VRAMWrite.src+2,X
    REP #$20
    LDA.B DP_BGTilesAddr : AND.W #$000F : XBA
    CLC : ADC.W #$3F00 : STA.B VRAMWrite.dest,X
    TXA : CLC : ADC.W #$0007 : STA.W VRAMWriteStack

  .return:
    RTL


if !FEATURE_KEEP_UNREFERENCED
;;; $C457: Unused. Process Kraid instruction, except there's no ASM instructions ;;;
UNUSED_ProcessKraidInstruction_WithNoASMInstructions_A7C457:
    LDA.W Kraid.instructionTimer : BEQ .return
    DEC.W Kraid.instructionTimer : BNE .return
    LDX.W Kraid.instListPointer
    LDA.W $0000,X : BPL .timer
    LDA.W #$0000 : STA.W Kraid.instructionTimer
    RTS

  .timer:
    STA.W Kraid.instructionTimer
    TXA : CLC : ADC.W #$0008 : STA.W Kraid.instListPointer
    LDA.W $0002,X : TAY
    LDX.W VRAMWriteStack
    LDA.W #$02C0 : STA.B VRAMWrite.size,X
    INX #2
    STY.B VRAMWrite.size,X
    INX #2
    SEP #$20
    LDA.B #Tilemap_KraidHead_0>>16 : STA.B VRAMWrite.size,X
    REP #$20
    INX
    LDA.B DP_BG2TilemapAddrSize : AND.W #$00FC : XBA : STA.B VRAMWrite.size,X
    INX #2 : STX.W VRAMWriteStack

  .return:
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $C4A4: Kraid death - update BG2 tilemap top half ;;;
KraidDeath_UpdateBG2TilemapTopHalf:
    JSR KraidInstListHandling
    LDA.W #KraidDeath_UpdateBG2TilemapBottomHalf : STA.W Kraid.function
    LDA.W #Function_KraidNail_HorizontallyAlignEnemyToKraid : STA.W Enemy[2].var0
    STA.W Enemy[3].var0 : STA.W Enemy[4].var0
    LDA.W #$7FFF : STA.W Enemy[2].var5
    STA.W Enemy[3].var5 : STA.W Enemy[4].var5
    JMP UpdateBG2TilemapTopHalf


;;; $C4C8: Kraid death - update BG2 tilemap bottom half ;;;
KraidDeath_UpdateBG2TilemapBottomHalf:
    JSR KraidInstListHandling
    SEP #$20
    LDA.B #UnpauseHook_KraidIsSinking>>16 : STA.W PauseHook_Unpause+2
    REP #$20
    LDA.W #UnpauseHook_KraidIsSinking : STA.W PauseHook_Unpause
    LDA.W #KraidDeath_SinkThroughFloor : STA.W Kraid.function
    LDA.W #$002B : STA.L KraidDeathSequenceQuakeSoundTimer
    LDA.W Enemy.properties : ORA.W #$8000 : STA.W Enemy.properties
    LDA.W #$0001 : STA.W EarthquakeType
    LDA.W #$0100 : STA.W EarthquakeTimer
    LDA.W #InstList_KraidArm_RisingSinking : STA.W Enemy[1].instList
    LDA.W #$0001 : STA.W Enemy[1].instTimer
    LDA.W #InstList_KraidFoot_Initial : STA.W Enemy[5].instList
    LDA.W #$0001 : STA.W Enemy[5].instTimer
    LDA.W #RTL_A7BA2D : STA.W Enemy[5].var0
    JMP UpdateBG2TilemapBottomHalf


;;; $C51D: Play sound every half second ;;;
PlaySoundEveryHalfSecond:
    LDA.L KraidDeathSequenceQuakeSoundTimer : DEC : STA.L KraidDeathSequenceQuakeSoundTimer : BNE .return
    LDA.W #$001E
    JSL QueueSound_Lib3_Max6
    LDA.W #$001E : STA.L KraidDeathSequenceQuakeSoundTimer

  .return:
    RTS


;;; $C537: Kraid death - Kraid sinks through floor ;;;
KraidDeath_SinkThroughFloor:
    JSR KraidInstListHandling
    JSR PlaySoundEveryHalfSecond
    JSR HandleKraidSinking
    INC.W Enemy.YPosition
    LDA.W Enemy.YPosition : CMP.W #$0260 : BMI .return
    LDA.W Enemy.properties : AND.W #$FBFF : STA.W Enemy.properties
    LDA.W #$0002
    STA.W EnemyBG2TilemapSize
    LDY.W EnemyIndex
    LDX.W Enemy.ID,Y
    LDA.W #RTL_A7804C
    STA.L EnemyHeaders_enemyShot,X
    LDA.W Enemy[1].properties : ORA.W #$0200 : ORA.W #$0400 : STA.W Enemy[1].properties ; >.< #$0600
    ORA.W #$0200 : ORA.W #$0400 ; >.< #$0600
    AND.W #$F7FF : AND.W #$DFFF : AND.W #$7FFF ; >.< #$57FF
    STA.W Enemy[2].properties : STA.W Enemy[3].properties
    STA.W Enemy[4].properties : STA.W Enemy[5].properties
    LDA.W #Function_Kraid_FadeInRegularBG_ClearBG2TilemapTopHalf : STA.W Kraid.function
    STZ.W CameraDistanceIndex
    JSL KraidDeathItemDropRoutine
    JMP DrawKraidsRoomBackground

  .return:
    RTL


;;; $C59F: Handle Kraid sinking ;;;
HandleKraidSinking:
; Note that Kraid *does* need to be cleared as he's sinking, otherwise he will wrap around from the ceiling
    LDY.W #$0000

  .loop:
    LDA.W ShrinkingKraidTable_KraidYPosition,Y : BMI .return
    CMP.W Enemy.YPosition : BEQ .found
    TYA : CLC : ADC.W #$0006 : TAY
    BRA .loop

  .found:
    LDA.W ShrinkingKraidTable_VRAMBG2TilemapOffset,Y : BMI .executeFunction
    LDX.W VRAMWriteStack
    LDA.W #$0040 : STA.B VRAMWrite.size,X
    LDA.W #EnemyBG2Tilemap+$FC0 : STA.B VRAMWrite.src,X
    SEP #$20
    LDA.B #EnemyBG2Tilemap>>16 : STA.B VRAMWrite.src+2,X
    REP #$20
    LDA.B DP_BG2TilemapAddrSize : AND.W #$00FC : XBA
    CLC : ADC.W ShrinkingKraidTable_VRAMBG2TilemapOffset,Y : STA.B VRAMWrite.dest,X
    TXA : CLC : ADC.W #$0007 : STA.W VRAMWriteStack

  .executeFunction:
    TYX
    JSR.W (ShrinkingKraidTable_functionPointer,X)

  .return:
    RTS


;;; $C5E7: Sinking Kraid table ;;;
ShrinkingKraidTable:
;        _______________ Kraid Y position
;       |      _________ VRAM BG2 tilemap offset (from which to clear 20h words)
;       |     |      ___ Function
;       |     |     |
  .KraidYPosition:
    dw $0130 ; Crumble left platform - left
  .VRAMBG2TilemapOffset:
    dw       $08A0
  .functionPointer:
    dw             CrumbleLeftPlatform_Left
    dw $0138,$0880
    dw             RTS_A7C6A6
    dw $0140,$0860
    dw             RTS_A7C6A6
    dw $0148,$0840 ; Crumble right platform - middle
    dw             CrumbleRightPlatform_Middle
    dw $0150,$0820
    dw             RTS_A7C6A6
    dw $0158,$0800
    dw             RTS_A7C6A6
    dw $0160,$03E0 ; Crumble right platform - left
    dw             CrumbleRightPlatform_Left
    dw $0168,$03C0
    dw             RTS_A7C6A6
    dw $0170,$03A0
    dw             RTS_A7C6A6
    dw $0178,$0380
    dw             RTS_A7C6A6
    dw $0180,$0360 ; Crumble left platform - right
    dw             CrumbleLeftPlatform_Right
    dw $0188,$0340
    dw             RTS_A7C6A6
    dw $0190,$0320
    dw             RTS_A7C6A6
    dw $0198,$0300 ; Crumble left platform - middle
    dw             CrumbleLeftPlatform_Middle
    dw $01A0,$02E0
    dw             RTS_A7C6A6
    dw $01A8,$02C0
    dw             RTS_A7C6A6
    dw $01B0,$02A0 ; Crumble right platform - right
    dw             CrumbleRightPlatform_Right
    dw $01B8,$0280
    dw             RTS_A7C6A6
    dw $01C0,$0260
    dw             RTS_A7C6A6
    dw $01C8,$0240
    dw             RTS_A7C6A6
    dw $01D0,$0220
    dw             RTS_A7C6A6
    dw $01D8,$0200
    dw             RTS_A7C6A6
    dw $01E0,$01E0
    dw             RTS_A7C6A6
    dw $01E8,$01C0
    dw             RTS_A7C6A6
    dw $01F0,$01A0
    dw             RTS_A7C6A6
    dw $01F8,$0180
    dw             RTS_A7C6A6
    dw $0200,$0160
    dw             RTS_A7C6A6
    dw $0208,$0140
    dw             RTS_A7C6A6
    dw $FFFF


;;; $C691: Crumble left platform - left ;;;
CrumbleLeftPlatform_Left:
    LDA.W #$0070
    LDY.W #EnemyProjectile_KraidCeilingRocks
    LDX.W EnemyIndex
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    JSL Spawn_Hardcoded_PLM
    db $07,$12
    dw PLMEntries_setKraidCeilingBlockToBackground2
 ; fallthrough to RTS_A7C6A6

RTS_A7C6A6:
    RTS


;;; $C6A7: Crumble right platform - middle ;;;
CrumbleRightPlatform_Middle:
    LDA.W #$00F0
    LDY.W #EnemyProjectile_KraidCeilingRocks
    LDX.W EnemyIndex
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    JSL Spawn_Hardcoded_PLM
    db $0F,$12
    dw PLMEntries_setKraidCeilingBlockToBackground2
    RTS


;;; $C6BD: Crumble right platform - left ;;;
CrumbleRightPlatform_Left:
    LDA.W #$00E0
    LDY.W #EnemyProjectile_KraidCeilingRocks
    LDX.W EnemyIndex
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    JSL Spawn_Hardcoded_PLM
    db $0E,$12
    dw PLMEntries_SetKraidCeilingBlockToBackground3
    RTS


;;; $C6D3: Crumble left platform - right ;;;
CrumbleLeftPlatform_Right:
    LDA.W #$0090
    LDY.W #EnemyProjectile_KraidCeilingRocks
    LDX.W EnemyIndex
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    JSL Spawn_Hardcoded_PLM
    db $09,$12
    dw PLMEntries_setKraidCeilingBlockToBackground2
    RTS


;;; $C6E9: Crumble left platform - middle ;;;
CrumbleLeftPlatform_Middle:
    LDA.W #$0080
    LDY.W #EnemyProjectile_KraidCeilingRocks
    LDX.W EnemyIndex
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    JSL Spawn_Hardcoded_PLM
    db $08,$12
    dw PLMEntries_SetKraidCeilingBlockToBackground3
    RTS


;;; $C6FF: Crumble right platform - right ;;;
CrumbleRightPlatform_Right:
    LDA.W #$0100
    LDY.W #EnemyProjectile_KraidCeilingRocks
    LDX.W EnemyIndex
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    JSL Spawn_Hardcoded_PLM
    db $10,$12
    dw PLMEntries_SetKraidCeilingBlockToBackground3
    RTS


;;; $C715: Kraid function - fade in regular background - clear BG2 tilemap top half ;;;
Function_Kraid_FadeInRegularBG_ClearBG2TilemapTopHalf:
    SEP #$20
    LDA.B #$48 : STA.B DP_BG2TilemapAddrSize
    REP #$20
    LDX.W #$07FE
    LDA.W #$0338

  .loop:
    STA.L EnemyBG2Tilemap,X
    DEX #2 : BPL .loop
    LDX.W VRAMWriteStack
    LDA.W #$0400 : STA.B VRAMWrite.size,X
    LDA.W #EnemyBG2Tilemap : STA.B VRAMWrite.src,X
    LDA.W #EnemyBG2Tilemap>>16 : STA.B VRAMWrite.src+2,X
    LDA.W #$4800 : STA.B VRAMWrite.dest,X
    TXA : CLC : ADC.W #$0007 : STA.W VRAMWriteStack
    LDA.W #Function_Kraid_FadeInRegularBG_ClearBG2TilemapBottomHalf : STA.W Kraid.function
    RTL


;;; $C751: Kraid function - fade in regular background - clear BG2 tilemap bottom half ;;;
Function_Kraid_FadeInRegularBG_ClearBG2TilemapBottomHalf:
    LDX.W VRAMWriteStack
    LDA.W #$0400 : STA.B VRAMWrite.size,X
    LDA.W #EnemyBG2Tilemap : STA.B VRAMWrite.src,X
    LDA.W #EnemyBG2Tilemap>>16 : STA.B VRAMWrite.src+2,X
    LDA.W #$4A00 : STA.B VRAMWrite.dest,X
    TXA : CLC : ADC.W #$0007 : STA.W VRAMWriteStack
    LDA.W #Function_Kraid_FadeInRegularBG_LoadStandardBG3Tiles_0 : STA.W Kraid.function
    RTL


;;; $C777: Kraid function - fade in regular background - load standard BG3 tiles 1/4 ;;;
Function_Kraid_FadeInRegularBG_LoadStandardBG3Tiles_0:
    LDA.W #UnpauseHook_KraidIsDead : STA.W PauseHook_Unpause
    LDA.W #Function_Kraid_FadeInRegularBG_LoadStandardBG3Tiles_1 : STA.W Kraid.function
    LDX.W VRAMWriteStack
    LDA.W #$0400 : STA.B VRAMWrite.size,X
    LDA.W #Tiles_Standard_BG3 : STA.B VRAMWrite.src,X
    LDA.W #Tiles_Standard_BG3>>16 : STA.B VRAMWrite.src+2,X
    LDA.W #$4000 : STA.B VRAMWrite.dest,X
    TXA : CLC : ADC.W #$0007 : STA.W VRAMWriteStack
    RTL


;;; $C7A3: Kraid function - fade in regular background - load standard BG3 tiles 2/4 ;;;
Function_Kraid_FadeInRegularBG_LoadStandardBG3Tiles_1:
    LDA.W #Function_Kraid_FadeInRegularBG_LoadStandardBG3Tiles_2 : STA.W Kraid.function
    LDX.W VRAMWriteStack
    LDA.W #$0400 : STA.B VRAMWrite.size,X
    LDA.W #Tiles_Standard_BG3+$400 : STA.B VRAMWrite.src,X
    LDA.W #Tiles_Standard_BG3>>16 : STA.B VRAMWrite.src+2,X
    LDA.W #$4200 : STA.B VRAMWrite.dest,X
    TXA : CLC : ADC.W #$0007 : STA.W VRAMWriteStack
    RTL


;;; $C7C9: Kraid function - fade in regular background - load standard BG3 tiles 3/4 ;;;
Function_Kraid_FadeInRegularBG_LoadStandardBG3Tiles_2:
    LDA.W #Function_Kraid_FadeInRegularBG_LoadStandardBG3Tiles_3 : STA.W Kraid.function
    LDX.W VRAMWriteStack
    LDA.W #$0400 : STA.B VRAMWrite.size,X
    LDA.W #Tiles_Standard_BG3+$800 : STA.B VRAMWrite.src,X
    LDA.W #Tiles_Standard_BG3>>16 : STA.B VRAMWrite.src+2,X
    LDA.W #$4400 : STA.B VRAMWrite.dest,X
    TXA : CLC : ADC.W #$0007 : STA.W VRAMWriteStack
    RTL


;;; $C7EF: Kraid function - fade in regular background - load standard BG3 tiles 4/4 ;;;
Function_Kraid_FadeInRegularBG_LoadStandardBG3Tiles_3:
    LDA.W #Function_Kraid_FadeInRegularBG_FadeInBGPalette6 : STA.W Kraid.function
    LDX.W VRAMWriteStack
    LDA.W #$0400 : STA.B VRAMWrite.size,X
    LDA.W #Tiles_Standard_BG3+$C00 : STA.B VRAMWrite.src,X
    LDA.W #Tiles_Standard_BG3>>16 : STA.B VRAMWrite.src+2,X
    LDA.W #$4600 : STA.B VRAMWrite.dest,X
    TXA : CLC : ADC.W #$0007 : STA.W VRAMWriteStack
    RTL


;;; $C815: Kraid function - fade in regular background - fade in BG palette 6 ;;;
Function_Kraid_FadeInRegularBG_FadeInBGPalette6:
    JSL Advance_GradualColorChange_ofBGPalette6
    BCC .return
    LDA.W #$0003
    JSL QueueMusicDataOrTrack_8FrameDelay
    LDX.W AreaIndex
    LDA.L SRAMMirror_Boss,X : BIT.W #$0001 : BNE .KraidIsDead
    ORA.W #$0001 : STA.L SRAMMirror_Boss,X
    LDA.W #Function_Kraid_FadeInRegularBG_SetToDead_KraidWasAlive : STA.W Kraid.function

  .return:
    RTL

  .KraidIsDead:
    LDA.W #Function_Kraid_FadeInRegularBG_SetToDead_KraidWasDead : STA.W Kraid.function
    RTL


;;; $C843: Kraid function - fade in regular background - set enemy properties to dead - Kraid was alive ;;;
Function_Kraid_FadeInRegularBG_SetToDead_KraidWasAlive:
; Not entirely sure why this function exists
    JSR CheckIfKraidHasDied
    BEQ .setToDead
    LDA.W Layer1XPosition : BEQ .return

  .setToDead:
    JSR SetEnemyPropertiesToDead

  .return:
    RTL


;;; $C851: Kraid function - fade in regular background - set enemy properties to dead - Kraid was dead ;;;
Function_Kraid_FadeInRegularBG_SetToDead_KraidWasDead:
; Not entirely sure why this function exists
    JSR CheckIfKraidHasDied
    BEQ .setToDead
    LDA.W Layer1XPosition : BEQ .return

  .setToDead:
    JSR SetEnemyPropertiesToDead

  .return:
    LDA.W #$FFFF : STA.W PreviousLayer1XBlock
    RTL


;;; $C865: Kraid function - restrict Samus X position to first screen ;;;
Function_Kraid_RestrictSamusXPositionToFirstScreen:
    JSR RestrictSamusXPositionToFirstScreen
    JMP Function_Kraid_HandleFunctionTimer


;;; $C86B: Kraid function - raise Kraid through floor - load tilemap top half ;;;
Function_Kraid_RaiseThruFloor_LoadTilemapTopHalf:
    JSR RestrictSamusXPositionToFirstScreen
    LDA.W #Function_Kraid_RaiseThruFloor_LoadTilemapBottomHalf_ShakeScn : STA.W Kraid.function
; fallthrough to UpdateBG2TilemapTopHalf


;;; $C874: Update BG2 tilemap top half ;;;
UpdateBG2TilemapTopHalf:
    LDX.W VRAMWriteStack
    LDA.W #$0800 : STA.B VRAMWrite.size,X
    LDA.W #EnemyBG2Tilemap : STA.B VRAMWrite.src,X
    SEP #$20
    LDA.B #EnemyBG2Tilemap>>16 : STA.B VRAMWrite.src+2,X
    REP #$20
    LDA.B DP_BG2TilemapAddrSize : AND.W #$00FC : XBA : STA.B VRAMWrite.dest,X
    TXA : CLC : ADC.W #$0007 : STA.W VRAMWriteStack
    RTL


;;; $C89A: Kraid function - raise Kraid through floor - load tilemap bottom half and shake screen ;;;
Function_Kraid_RaiseThruFloor_LoadTilemapBottomHalf_ShakeScn:
    JSR RestrictSamusXPositionToFirstScreen
    LDA.W #Function_Kraid_RaiseThruFloor_SpawnRNGEarthquakeProjEvery10f : STA.W Kraid.function
    LDA.W #$0078 : STA.W Kraid.functionTimer
    LDA.W #$01F0 : STA.W EarthquakeTimer
    LDA.W #$0005
    JSL QueueMusicDataOrTrack_8FrameDelay
; fallthrough to UpdateBG2TilemapBottomHalf


;;; $C8B6: Update BG2 tilemap bottom half ;;;
UpdateBG2TilemapBottomHalf:
    LDX.W VRAMWriteStack
    LDA.W #$0800 : STA.B VRAMWrite.size,X
    LDA.W #EnemyBG2Tilemap+$800 : STA.B VRAMWrite.src,X
    SEP #$20
    LDA.B #EnemyBG2Tilemap>>16 : STA.B VRAMWrite.src+2,X
    REP #$20
    LDA.B DP_BG2TilemapAddrSize : AND.W #$00FC : XBA
    CLC : ADC.W #$0800 : STA.B VRAMWrite.dest,X
    TXA : CLC : ADC.W #$0007 : STA.W VRAMWriteStack
    RTL


;;; $C8E0: Kraid function - raise Kraid through floor - spawn random earthquake projectiles every 10h frames ;;;
Function_Kraid_RaiseThruFloor_SpawnRNGEarthquakeProjEvery10f:
    JSR RestrictSamusXPositionToFirstScreen
    LDA.W Kraid.functionTimer : DEC : STA.W Kraid.functionTimer : BNE .timerNotExpired
    LDA.W #Function_Kraid_RaiseThruFloor_SpawnRNGEarthquakeProjEvery8f : STA.W Kraid.function
    LDA.W #$0060 : STA.W Kraid.functionTimer
    RTL

  .timerNotExpired:
    AND.W #$000F : BNE .return
    JSR SpawnRandomEarthquakeProjectile

  .return:
    RTL


;;; $C902: Kraid function - raise Kraid through floor - spawn random earthquake projectiles every 8 frames ;;;
Function_Kraid_RaiseThruFloor_SpawnRNGEarthquakeProjEvery8f:
    JSR RestrictSamusXPositionToFirstScreen
    LDA.W Kraid.functionTimer : DEC : STA.W Kraid.functionTimer : BNE .timerNotExpired
    LDA.W #Function_Kraid_RaiseThruFloor_RaiseKraid : STA.W Kraid.function
    LDA.W #$0120 : STA.W Kraid.functionTimer
    RTL

  .timerNotExpired:
    AND.W #$0007 : BNE .return
    JSR SpawnRandomEarthquakeProjectile

  .return:
    RTL


;;; $C924: Kraid function - raise Kraid through floor - raise Kraid ;;;
Function_Kraid_RaiseThruFloor_RaiseKraid:
    JSR RestrictSamusXPositionToFirstScreen
    LDA.W EarthquakeTimer : BIT.W #$0005 : BNE +
    JSR SpawnRandomEarthquakeProjectile

+   LDY.W #$0001
    LDA.W Enemy.YPosition : BIT.W #$0002 : BNE +
    LDY.W #$FFFF

+   STY.B DP_Temp12
    LDA.W Enemy.XPosition : CLC : ADC.B DP_Temp12 : STA.W Enemy.XPosition
    LDA.W Enemy.YSubPosition : SEC : SBC.W #$8000 : STA.W Enemy.YSubPosition
    LDA.W Enemy.YPosition : SBC.W #$0000 : STA.W Enemy.YPosition
    LDA.W Enemy.YPosition : CMP.W #$01C9 : BPL .return
    LDA.W #$00B0 : STA.W Enemy.XPosition
    LDA.W #Function_KraidFoot_Phase1_Thinking : STA.W Enemy[5].var0
    LDA.W #$012C : STA.W Enemy[5].var5
    LDA.W #Function_KraidFoot_Phase1_PrepareToLungeForward : STA.L ExtraEnemy7800+$140
    LDA.W #InstList_Kraid_Roar_1 : STA.W Kraid.instListPointer
    JSR SetupKraidMainLoop_Thinking
    LDA.W #InstList_KraidArm_Normal_0 : STA.W Enemy[1].instList
    LDA.W #$0001 : STA.W Enemy[1].instTimer

  .return:
    RTL


;;; $C995: Spawn random earthquake projectile ;;;
SpawnRandomEarthquakeProjectile:
; This first part is dreadful, here's my optimisation:
; LDA $05E5 : AND #$003F : BIT #$0002 : BNE $03 : EOR #$FFFF
; CLC : ADC $0F7A : STA $12
; This generates a random number from:
; 3F, 3E, -3E, -3D, 3B, 3A, -3A, -39, 37, 36, -36, -35, 33, 32, -32, -31, 2F, 2E, -2E, -2D, 2B, 2A, -2A, -29, 27, 26, -26, -25, 23, 22, -22, -21, 1F, 1E, -1E, -1D, 1B, 1A, -1A, -19, 17, 16, -16, -15, 13, 12, -12, -11, 0F, 0E, -0E, -0D, 0B, 0A, -0A, -09, 07, 06, -06, -05, 03, 02, -02, -01
    LDA.W NMI_8bitFrameCounter : BIT.W #$0002
    LDA.W RandomNumberSeed : AND.W #$003F : TAX
    LDA.W RandomNumberSeed : BIT.W #$0002 : BNE +
    TXA : EOR.W #$FFFF : TAX

+   TXA : CLC : ADC.W Enemy.XPosition : STA.B DP_Temp12
    LDA.W RandomNumberSeed : AND.W #$3F00 : XBA : STA.B DP_Temp14
    LDA.W #$01C0 : SEC : SBC.B DP_Temp14 : STA.B DP_Temp14
    LDA.W #$0015 : STA.B DP_Temp16
    STZ.B DP_Temp18
    JSL Create_Sprite_Object
    LDY.W #EnemyProjectile_KraidFloorRocks_Left
    LDA.W RandomNumberSeed : BIT.W #$0010 : BEQ .keepLeft
    LDY.W #EnemyProjectile_KraidFloorRocks_Right

  .keepLeft:
    LDX.W EnemyIndex
    LDA.W RandomNumberSeed : AND.W #$03F0
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    RTS


;;; $C9EE: Restrict Samus X position to first screen ;;;
RestrictSamusXPositionToFirstScreen:
    LDA.W SamusXPosition : SEC : SBC.W #$0100 : BMI .return
    LDA.W #$0100 : STA.W SamusXPosition : STA.W SamusPreviousXPosition

  .return:
    RTS


;;; $CA01: Palette - enemy $E4BF/$E4FF/$E53F/$E57F (Phantoon) ;;;
Palette_Phantoon:
    dw $3800,$7FFF,$7EC0,$6DE0,$54E0,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000


;;; $CA21: Palettes ;;;
if !FEATURE_KEEP_UNREFERENCED
UNUSED_Palette_Phantoon_A7CA21:
; Unused. Clone of Palette_Phantoon_HealthBased_7
    dw $0000,$477B,$2E52,$00C6,$0063,$3AB5,$2210,$116B
    dw $0508,$7FFF,$36B5,$19AD,$0929,$381D,$1814,$000A
endif ; !FEATURE_KEEP_UNREFERENCED

Palette_Phantoon_FadeOutTarget:
; Fade out target palette
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000
    dw $0000,$0000,$0000,$0000,$0000,$0000,$0000,$0000

Palette_WreckedShipPoweredOn:
; Wrecked Ship powered on BG1/2 target palettes 0..6 (same as SCE)
    dw $0000,$02DF,$01D7,$00AC,$5EBB,$3DB3,$292E,$1486
    dw $0BB1,$48FB,$7FFF,$0000,$7FFF,$44E5,$7FFF,$0000
    dw $2003,$0BB1,$1EA9,$0145,$5EBB,$3DB3,$292E,$1486
    dw $6318,$1CE7,$1084,$0000,$7FFF,$02DF,$001F,$0000
    dw $2003,$72BC,$48FB,$1816,$6318,$6318,$6318,$6318
    dw $6318,$6318,$6318,$6318,$6318,$6318,$7FFF,$0000
    dw $0000,$72B2,$71C7,$4D03,$6318,$6318,$6318,$6318
    dw $6318,$6318,$6318,$6318,$6318,$6318,$7FFF,$0000
    dw $0000,$3EF4,$262E,$0D68,$3E94,$25CE,$0D08,$1484
    dw $6E94,$55CE,$3D08,$2C84,$1EA9,$0BB1,$7FFF,$0000
    dw $0000,$1246,$0145,$00C0,$3652,$1D8C,$04C6,$0484
    dw $6231,$496B,$30A5,$2021,$0015,$025B,$7FFF,$0000
    dw $0000,$6318,$6318,$6318,$6318,$6318,$6318,$6318
    dw $6318,$6318,$6318,$6318,$6318,$6318,$7FFF,$0000

; Health based palettes
Palette_Phantoon_HealthBased_0:
; Health <= 312
    dw $000E,$25DC,$1538,$0071,$0030,$1D79,$1117,$08B4
    dw $0092,$421F,$1D79,$0CF5,$0493,$1C1D,$0C19,$0013

Palette_Phantoon_HealthBased_1:
; Health > 312
    dw $000C,$2A1C,$1957,$0070,$002E,$2199,$1136,$08D3
    dw $0091,$4A5F,$1D99,$0CF4,$04B1,$201D,$0C18,$0012

Palette_Phantoon_HealthBased_2:
; Health > 624
    dw $000A,$2E5C,$1D96,$008E,$004C,$25D8,$1555,$08F1
    dw $00AF,$529F,$21D8,$1113,$04D0,$241D,$1017,$0011

Palette_Phantoon_HealthBased_3:
; Health > 936
    dw $0008,$327C,$21B5,$008C,$004A,$29F7,$1574,$0D10
    dw $00AE,$5ADF,$25F7,$1131,$04CE,$281D,$1016,$000F

Palette_Phantoon_HealthBased_4:
; Health > 1248
    dw $0006,$36BB,$21D4,$008B,$0048,$2E17,$1993,$0D0F
    dw $00CC,$631F,$2A17,$1150,$04ED,$2C1D,$1016,$000E

Palette_Phantoon_HealthBased_5:
; Health > 1560
    dw $0004,$3AFB,$25F3,$00A9,$0046,$3256,$1DB2,$0D2D
    dw $00EB,$6B5F,$2E56,$156F,$04EB,$301D,$1415,$000C

Palette_Phantoon_HealthBased_6:
; Health > 1872
    dw $0002,$3F3B,$2A12,$00A7,$0044,$3675,$1DF1,$0D4C
    dw $04E9,$77BF,$3275,$158E,$050A,$341D,$1414,$000B

Palette_Phantoon_HealthBased_7:
; Health > 2184
    dw $0000,$477B,$2E52,$00C6,$0063,$3AB5,$2210,$116B
    dw $0508,$7FFF,$36B5,$19AD,$0929,$381D,$1814,$000A


;;; $CC41: Instruction list - body - invulnerable ;;;
InstList_Phantoon_Body_Invulnerable:
    dw $0001,ExtendedSpritemap_Phantoon_Body_Invulnerable
    dw Instruction_Common_Sleep


;;; $CC47: Instruction list - body - full hitbox ;;;
InstList_Phantoon_Body_FullHitbox:
    dw $0001,ExtendedSpritemap_Phantoon_Body_FullHitbox
    dw Instruction_Common_Sleep


;;; $CC4D: Instruction list - body - eye hitbox only ;;;
InstList_Phantoon_Body_EyeHitboxOnly:
    dw $0001,ExtendedSpritemap_Phantoon_Body_EyeHitbox
    dw Instruction_Common_Sleep


;;; $CC53: Instruction list - eye - open ;;;
InstList_Phantoon_Eye_Open:
    dw $000A,ExtendedSpritemap_Phantoon_Eye_Opening
    dw $000A,ExtendedSpritemap_Phantoon_Eye_OpeningClosing
    dw $0001,ExtendedSpritemap_Phantoon_Eye_Open
    dw Instruction_Common_CallFunctionInY
    dw PlayPhantoonMaterializationSFX
    dw Instruction_Common_CallFunctionInY
    dw SetupEyeOpenPhantoonState
    dw Instruction_Common_Sleep


if !FEATURE_KEEP_UNREFERENCED
;;; $CC69: Unused. Instruction list - open (ignoring Samus) ;;;
UNUSED_InstList_Phantoon_Eye_Open_IgnoringSamus_A7CC69:
    dw $000A,ExtendedSpritemap_Phantoon_Eye_Opening
    dw $000A,ExtendedSpritemap_Phantoon_Eye_OpeningClosing
    dw $0001,ExtendedSpritemap_Phantoon_Eye_Open
    dw Instruction_Common_CallFunctionInY
    dw PlayPhantoonMaterializationSFX
    dw Instruction_Common_Sleep
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $CC7B: Instruction list - eye - closed ;;;
InstList_Phantoon_Eye_Closed:
    dw $0001,ExtendedSpritemap_Phantoon_Eye_Closed
    dw Instruction_Common_Sleep


;;; $CC81: Instruction list - eye - close and pick new pattern ;;;
InstList_Phantoon_Eye_Close_PickNewPattern:
    dw $0001,ExtendedSpritemap_Phantoon_Eye_Open
    dw $000A,ExtendedSpritemap_Phantoon_Eye_OpeningClosing
    dw Instruction_Common_CallFunctionInY
    dw PickNewPhantoonPattern
    dw Instruction_Common_GotoY
    dw InstList_Phantoon_Eye_Closed


;;; $CC91: Instruction list - eye - close ;;;
InstList_Phantoon_Eye_Close:
    dw $0001,ExtendedSpritemap_Phantoon_Eye_Open
    dw $000A,ExtendedSpritemap_Phantoon_Eye_OpeningClosing
    dw Instruction_Common_GotoY
    dw InstList_Phantoon_Eye_Closed


;;; $CC9D: Instruction list - eyeball - centred ;;;
InstList_Phantoon_Eyeball_Centered:
    dw $0001,ExtendedSpritemap_Phantoon_Eyeball_Centered
    dw Instruction_Common_CallFunctionInY
    dw PlayPhantoonMaterializationSFX
    dw Instruction_Common_Sleep


;;; $CCA7: Instruction list - eyeball - looking up ;;;
InstList_Phantoon_Eyeball_LookingUp:
    dw $0001,ExtendedSpritemap_Phantoon_Eyeball_LookingUp
    dw Instruction_Common_Sleep


;;; $CCAD: Instruction list - eyeball - looking up-right ;;;
InstList_Phantoon_Eyeball_LookingUpRight:
    dw $0001,ExtendedSpritemap_Phantoon_Eyeball_LookingUpRight
    dw Instruction_Common_Sleep


;;; $CCB3: Instruction list - eyeball - looking right ;;;
InstList_Phantoon_Eyeball_LookingRight:
    dw $0001,ExtendedSpritemap_Phantoon_Eyeball_LookingRight
    dw Instruction_Common_Sleep


;;; $CCB9: Instruction list - eyeball - looking down-right ;;;
InstList_Phantoon_Eyeball_LookingDownRight:
    dw $0001,ExtendedSpritemap_Phantoon_Eyeball_LookingDownRight
    dw Instruction_Common_Sleep


;;; $CCBF: Instruction list - eyeball - looking down ;;;
InstList_Phantoon_Eyeball_LookingDown:
    dw $0001,ExtendedSpritemap_Phantoon_Eyeball_LookingDown
    dw Instruction_Common_Sleep


;;; $CCC5: Instruction list - eyeball - looking down-left ;;;
InstList_Phantoon_Eyeball_LookingDownLeft:
    dw $0001,ExtendedSpritemap_Phantoon_Eyeball_LookingDownLeft
    dw Instruction_Common_Sleep


;;; $CCCB: Instruction list - eyeball - looking left ;;;
InstList_Phantoon_Eyeball_LookingLeft:
    dw $0001,ExtendedSpritemap_Phantoon_Eyeball_LookingLeft
    dw Instruction_Common_Sleep


;;; $CCD1: Instruction list - eyeball - looking up-left ;;;
InstList_Phantoon_Eyeball_LookingUpLeft:
    dw $0001,ExtendedSpritemap_Phantoon_Eyeball_LookingUpLeft
    dw Instruction_Common_Sleep


;;; $CCD7: Instruction list - tentacles ;;;
InstList_Phantoon_Tentacles:
    dw $0008,ExtendedSpritemap_Phantoon_Tentacles_0
    dw $0008,ExtendedSpritemap_Phantoon_Tentacles_1
    dw $0008,ExtendedSpritemap_Phantoon_Tentacles_2
    dw $0008,ExtendedSpritemap_Phantoon_Tentacles_1
    dw Instruction_Common_GotoY
    dw InstList_Phantoon_Tentacles


;;; $CCEB: Instruction list - mouth - spawn flame ;;;
InstList_Phantoon_Mouth_SpawnFlame:
    dw $0005,ExtendedSpritemap_Phantoon_Mouth_SpawningFlame_1
    dw $0005,ExtendedSpritemap_Phantoon_Mouth_SpawningFlame_0
    dw Instruction_Common_CallFunctionInY
    dw SpawnCasualFlame


;;; $CCF7: Instruction list - mouth - initial ;;;
InstList_Phantoon_Mouth_Initial:
    dw $0001,ExtendedSpritemap_Phantoon_Mouth_Normal
    dw Instruction_Common_Sleep


;;; $CCFD: Casual flame timers ;;;
CasualFlameTimers:
  .pointers:
; List of pattern pointers
    dw CasualFlameTimers_pattern0
    dw CasualFlameTimers_pattern1
    dw CasualFlameTimers_pattern2
    dw CasualFlameTimers_pattern3

;        ________ Number of flames (length of pattern)
;       |       _ Timers. List is read backwards
;       |      |
  .pattern0:
    dw $0005, $00B4,$0020,$0020,$0020,$0020,$0020
  .pattern1:
    dw $0003, $00B4,$0010,$0010,$0010
  .pattern2:
    dw $0007, $00B4,$0030,$0030,$0030,$0030,$0030,$0030,$0030
  .pattern3:
    dw $0007, $00B4,$0010,$0040,$0020,$0040,$0020,$0010,$0020


;;; $CD41: Phantoon figure-8 vulnerable window timers ;;;
Phantoon_Figure8_VulnerableWindowTimers:
    dw $003C,$001E,$000F,$001E,$003C,$001E,$000F,$003C


;;; $CD51: Empty HDMA table ;;;
EmptyHDMATable:
    db $00,$00


;;; $CD53: Phantoon eye closed timers ;;;
Phantoon_EyeClosedTimers:
    dw $02D0,$003C,$0168,$02D0,$0168,$003C,$0168,$02D0


;;; $CD63: Flame rain Phantoon hiding timers ;;;
Phantoon_FlameRain_HidingTimers:
    dw $003C,$0078,$001E,$003C,$001E,$003C,$001E,$001E


;;; $CD73: Figure-8 Phantoon acceleration ;;;
Phantoon_Figure8_SubAcceleration_SlowStage:
    dw $0600
Phantoon_Figure8_Acceleration_SlowStage:
    dw $0000
Phantoon_Figure8_SubAcceleration_FastStages:
    dw $1000
Phantoon_Figure8_Acceleration_FastStages:
    dw $0000


;;; $CD7B: Figure-8 speed caps ;;;
Phantoon_Figure8_SpeedCaps_Stage0Max:
    dw $0002
Phantoon_Figure8_SpeedCaps_Stage1Max:
    dw $0007
Phantoon_Figure8_SpeedCaps_Stage2Min:
    dw $0000


;;; $CD81: Reverse figure-8 Phantoon acceleration ;;;
; Clone of Phantoon_Figure8_SubAcceleration_SlowStage
Phantoon_ReverseFigure8_SubAcceleration_SlowStage:
    dw $0600
Phantoon_ReverseFigure8_Acceleration_SlowStage:
    dw $0000
Phantoon_ReverseFigure8_SubAcceleration_FastStages:
    dw $1000
Phantoon_ReverseFigure8_Acceleration_FastStages:
    dw $0000


;;; $CD89: Reverse figure-8 speed caps ;;;
Phantoon_ReverseFigure8_SpeedCaps_Stage0Max:
    dw $FFFE
Phantoon_ReverseFigure8_SpeedCaps_Stage1Max:
    dw $FFF9
Phantoon_ReverseFigure8_SpeedCaps_Stage2Min:
    dw $0000


if !FEATURE_KEEP_UNREFERENCED
;;; $CD8F: Unused ;;;
UNUSED_Phantoon_A7CD8F:
    dw $8000,$0000,$000B,$8000,$0000,$FFF5
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $CD9B: Wavy Phantoon constants ;;;
WavyPhantoonConstants_Intro_amplitudeDelta:
; Amplitude delta - intro wavy Phantoon
    dw $0040

WavyPhantoonConstants_Intro_maxAmplitude:
; Max amplitude - intro wavy Phantoon
    dw $0C00

WavyPhantoonConstants_Dying_amplitudeDelta:
; Amplitude delta - dying wavy Phantoon
    dw $0100

WavyPhantoonConstants_Dying_maxAmplitude:
; Max amplitude - dying wavy Phantoon
    dw $F000

WavyPhantoonConstants_phaseDelta:
; Wavy Phantoon phase delta
    dw $0008


;;; $CDA5: Values for Enemy[1].var1 ;;;
Phantoon_Unknown0FEAValues_A7CDA5:
; Unknown purpose, Enemy[1].var1 is never read, written by Phantoon enemy shot
    db $06,$06,$08,$08,$06,$08,$06,$08


;;; $CDAD: Phantoon position table for flame rain ;;;
Phantoon_FlameRain_PositionTable:
;        _____________________ Phantoon figure-8 movement index
;       |      _______________ X position
;       |     |      _________ Y position
;       |     |     |
  .index:
    dw $0001
  .XPosition:
    dw       $0080
  .YPosition:
    dw             $0060,$0000
    dw $0047,$00A8,$0040,$0000
    dw $0088,$00D0,$0060,$0000
    dw $00C9,$00A8,$0080,$0000
    dw $0001,$0080,$0060,$0000
    dw $014E,$0058,$0040,$0000
    dw $018F,$0030,$0060,$0000
    dw $01D1,$0058,$0080,$0000


;;; $CDED: Materialisation sound effects ;;;
Phantoon_MaterializationSFX:
; Sound library 2
; Indexed by [$7E:9032] * 2
    dw $0079,$007A,$007B


;;; $CDF3: Initialisation AI - enemy $E4BF (Phantoon body) ;;;
InitAI_PhantoonBody:
    LDX.W #$0FFE
    LDA.W #$0338

  .loopBG2Tilemap:
    STA.L EnemyBG2Tilemap,X
    DEX #2
    BPL .loopBG2Tilemap
    LDX.W #$07FE
    LDA.W #$0000

  .loop9000:
    STA.L WavyPhantoonBG2XScrollIndirectHDMATable,X
    DEX #2 : BPL .loop9000
    LDX.W #$001E
    LDA.W #$0000

  .loopBGPalette:
    STA.L TargetPalettes_BGP7,X
    DEX #2 : BPL .loopBGPalette
    LDA.W #$0360 : STA.L EnemyBG2TilemapSize ; >.<
    JSL DisableMinimap_MarkBossRoomTilesExplored
    LDX.W EnemyIndex
    LDA.W #$0078 : STA.W Phantoon.functionTimer,X
    STZ.W Phantoon.flameCounter,X : STZ.W Phantoon.startingFlamesActivationFlag,X
    LDA.W #$0000 : STA.L PhantoonMaterializationSFXIndex
    STZ.W Phantoon.wavyPhantoonMode : STZ.W Enemy[1].init1
    LDA.W Enemy.properties : ORA.W #$0400 : STA.W Enemy.properties
    JSL Spawn_HDMAObject
    db $01,$14
    dw HDMAObjectInstList_Phantoon_SemiTransparency
; fallthrough to InitAI_Phantoon_Eye_Tentacles_Mouth


;;; $CE55: Initialisation AI - enemy $E4FF/$E53F/$E57F (Phantoon eye / tentacles / mouth) ;;;
InitAI_Phantoon_Eye_Tentacles_Mouth:
; Phantoon body also executes this as part of initialisation AI, so all Phantoon parts are doing this
    LDX.W EnemyIndex
    LDA.W #Spritemap_Common_Nothing : STA.W Enemy.spritemap,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    LDA.W Enemy.palette : STA.W Enemy.palette,X
    LDA.W Enemy.GFXOffset : STA.W Enemy.GFXOffset,X
    LDA.W Phantoon.flameRainTriggeredFlag,X : ASL : TAY
    LDA.W .instListPointers,Y : STA.W Enemy.instList,X
    LDA.W #Function_Phantoon_FightIntro_SpawnCircleOfFlames : STA.W Phantoon.function,X
    STZ.W Phantoon.semiTransparencyHDMAObjectControl
    LDA.W #$FFFF : STA.W Phantoon.casualFlamePatternIndex
    RTL

  .instListPointers:
    dw InstList_Phantoon_Body_Invulnerable
    dw InstList_Phantoon_Eye_Closed
    dw InstList_Phantoon_Tentacles
    dw InstList_Phantoon_Mouth_Initial


;;; $CE96: HDMA object instruction list - Phantoon semi-transparency ;;;
HDMAObjectInstList_Phantoon_SemiTransparency:
    dw Instruction_HDMAObject_HDMATableBank : db $A7
    dw $0001,EmptyHDMATable
    dw Instruction_HDMAObject_PreInstructionInY
    dl PreInstruction_PhantoonSemiTransparency
    dw Instruction_HDMAObject_Sleep
    dw Instruction_HDMAObject_Delete


;;; $CEA6: Main AI - enemy $E4BF (Phantoon) ;;;
MainAI_Phantoon:
; Phantoon code is making a trend of returning if the current enemy index is not 0, then using indexed addressing anyway,
; and these routines are only called for enemy 0 in the first place >_<;
    LDX.W EnemyIndex
    JSR Phantoon_BrokenNothingness
    PEA .manualReturn-1
    JMP.W (Phantoon.function,X)

  .manualReturn:
    TXA : BNE .return
    LDA.W Enemy.XPosition,X : STA.W Enemy[1].XPosition,X
    STA.W Enemy[2].XPosition,X : STA.W Enemy[3].XPosition,X
    LDA.W Enemy.YPosition,X : STA.W Enemy[1].YPosition,X
    STA.W Enemy[2].YPosition,X : STA.W Enemy[3].YPosition,X
    LDA.W Phantoon.wavyPhantoonMode : BNE .return
    LDA.W Layer1XPosition : SEC : SBC.W Enemy.XPosition,X
    SEC : SBC.W #$FFD8 : STA.B DP_BG2XScroll
    LDA.W Layer1YPosition : SEC : SBC.W Enemy.YPosition,X
    SEC : SBC.W #$FFD8 : STA.B DP_BG2YScroll

  .return:
    RTL


;;; $CEED: Play Phantoon materialisation sound effect ;;;
PlayPhantoonMaterializationSFX:
    LDA.L PhantoonMaterializationSFXIndex : ASL : TAY
    LDA.W Phantoon_MaterializationSFX,Y
    JSL QueueSound_Lib2_Max6
    LDA.L PhantoonMaterializationSFXIndex : INC : CMP.W #$0003 : BMI .storeIndex
    LDA.W #$0000

  .storeIndex:
    STA.L PhantoonMaterializationSFXIndex
    RTS


;;; $CF0C: Broken nothingness ;;;
Phantoon_BrokenNothingness:
; This code doesn't do anything, it tries to modify $7E:9030 and forgot the $7E bit... and $7E:9030 is never read anywhere anyway
    TXA : BNE .return
    LDA.B DP_Controller1New : BIT.W #$4000 : BEQ .return
    LDA.W $9030,X : BNE .nonZero ; >.<
    LDA.W #$0001 : STA.W $9030,X ; >.<
    BRA .return

  .nonZero:
    STZ.W $9030,X ; >.<

  .return:
    RTS


;;; $CF27: Grow/shrink Phantoon wave amplitude ;;;
GrowShrinkPhantoonWaveAmplitude:
;; Parameters:
;;     $12: Amplitude delta
;;     $14: Max amplitude
;; Returns:
;;     Carry: Set if completed wave cycle (amplitude has decreased below 0)
    LDA.W Phantoon.wavyPhantoonPhaseDeltaDirection : BNE .shrinking
    LDA.B DP_Temp14 : AND.W #$FF00 : XBA : STA.B DP_Temp16
    LDA.W Phantoon.wavyPhantoonPhaseAmplitude : CLC : ADC.B DP_Temp12 : STA.W Phantoon.wavyPhantoonPhaseAmplitude
    AND.W #$FF00 : XBA : CMP.B DP_Temp16 : BMI .returnNotCompletedCycle
    LDA.B DP_Temp14 : STA.W Phantoon.wavyPhantoonPhaseAmplitude
    BRA .returnNotCompletedCycle

  .shrinking:
    LDA.W Phantoon.wavyPhantoonPhaseAmplitude : SEC : SBC.B DP_Temp12 : STA.W Phantoon.wavyPhantoonPhaseAmplitude : BCS .returnNotCompletedCycle
    STZ.W Phantoon.wavyPhantoonPhaseAmplitude
    SEC
    RTS

  .returnNotCompletedCycle:
    CLC
    RTS


;;; $CF5E: Spawn casual flame ;;;
SpawnCasualFlame:
    LDA.W #$0000
    LDY.W #EnemyProjectile_PhantoonDestroyableFlames
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    LDA.W #$001D
    JSL QueueSound_Lib3_Max6
    RTS


;;; $CF70: Phantoon materialisation flame spiral ;;;
PhantoonMaterializationFlameSpiral:
    LDY.W #$0007

  .loop:
    PHY
    TYA : ORA.W #$0600
    LDY.W #EnemyProjectile_PhantoonDestroyableFlames
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    PLY
    DEY : BPL .loop
    LDA.W #$0028
    JSL QueueSound_Lib3_Max6
    RTS


;;; $CF8B: Spawn flame rain enemy projectiles ;;;
SpawnFlameRainProjectiles:
;; Parameter:
;;     A: Pattern index. Range 0..7. Decides the placement of the first flame

; Uses a lookup table ($CFC2) to determine where to leave a gap.
;
; When called from $D7F7, the following patterns result:
;
; [A] | Value | Fireball pattern
; ----+-------+-----------------
; 0   | 5     | @@@@@@.@@
; 1   | 7     | @@@@@@@@.
; 2   | 0     | .@@@@@@@@
; 3   | 7     | @@@@@@@@.
; 4   | 5     | @@@@@@.@@
; 5   | 3     | @@@@.@@@@
; 6   | 1     | @@.@@@@@@
; 7   | 3     | @@@@.@@@@
    TAY
    LDA.W .firstFlamePositions,Y : AND.W #$00FF : TAY
    LDA.W #$0007 : STA.B DP_Temp12
    LDA.W #$0010 : STA.B DP_Temp14

  .loop:
    TYA : ORA.W #$0400 : ORA.B DP_Temp14
    PHY
    LDY.W #EnemyProjectile_PhantoonDestroyableFlames
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    PLY : INY : CPY.W #$0009 : BMI +
    LDY.W #$0000

+   LDA.B DP_Temp14 : CLC : ADC.W #$0010 : STA.B DP_Temp14
    DEC.B DP_Temp12 : BPL .loop
    RTS

  .firstFlamePositions:
; Position of first flame
    db $05,$07,$00,$07,$05,$03,$01,$03


;;; $CFCA: Handle casual flames ;;;
HandleCasualFlames:
    DEC.W Phantoon.casualFlameTimer,X : BEQ .timerExpired
    BPL .return

  .timerExpired:
    LDA.W Phantoon.casualFlamePatternIndex,X : BPL .positiveIndex
    JSL GenerateRandomNumber
    AND.W #$0003 : STA.W Phantoon.casualFlamePattern,X
    ASL : TAY
    LDA.W CasualFlameTimers_pointers,Y : TAY
    LDA.W $0000,Y : STA.W Phantoon.casualFlamePatternIndex,X
    ASL : STA.B DP_Temp12
    TYA : CLC : ADC.B DP_Temp12 : TAY
    LDA.W $0002,Y : STA.W Phantoon.casualFlameTimer,X
    BRA .return

  .positiveIndex:
    DEC.W Phantoon.casualFlamePatternIndex,X : BEQ .indexReachedZero
    BPL .nonZeroTimer

  .indexReachedZero:
    LDA.W #$FFFF : STA.W Phantoon.casualFlamePatternIndex,X
    LDA.W Phantoon.casualFlamePattern,X : ASL : TAY
    LDA.W CasualFlameTimers_pointers,Y : TAY
    LDA.W $0002,Y : STA.W Phantoon.casualFlameTimer,X
    BRA +

  .nonZeroTimer:
    LDA.W Phantoon.casualFlamePatternIndex,X : ASL : STA.B DP_Temp12
    LDA.W Phantoon.casualFlamePattern,X : ASL : TAY
    LDA.W CasualFlameTimers_pointers,Y : CLC : ADC.B DP_Temp12 : TAY
    LDA.W $0002,Y : STA.W Phantoon.casualFlameTimer,X

+   LDA.W #$0001 : STA.W Enemy[3].instTimer,X
    LDA.W #InstList_Phantoon_Mouth_SpawnFlame : STA.W Enemy[3].instList,X

  .return:
    RTS


;;; $D03F: Set up eye open Phantoon state ;;;
SetupEyeOpenPhantoonState:
    STZ.W Phantoon.swoopingTriggeredFlag
    LDA.W #$0001 : STA.W Enemy.instTimer : STA.W Enemy[1].instTimer
    LDA.W #InstList_Phantoon_Body_EyeHitboxOnly : STA.W Enemy.instList
    LDA.W #InstList_Phantoon_Eyeball_Centered : STA.W Enemy[1].instList
    LDA.W Enemy.properties : AND.W #$FBFF : STA.W Enemy.properties
    JSL GenerateRandomNumber
    AND.W #$0007 : ASL : TAY
    LDA.W Phantoon_Figure8_VulnerableWindowTimers,Y : STA.W Phantoon.functionTimer
    LDA.W #Function_Phantoon_Figure8_VulnerableWindow : STA.W Phantoon.function
    RTS


;;; $D076: Pick new Phantoon pattern ;;;
PickNewPhantoonPattern:
; When called by Function_Phantoon_HidingBeforeFigure8_PlacePhantoon, the Phantoon function set here is ignored,
; it is only used by the call from the Phantoon eye instruction list InstList_Phantoon_Eye_Close_PickNewPattern
    LDA.W #$003C : STA.W Phantoon.functionTimer
    JSL GenerateRandomNumber
    AND.W #$0007 : ASL : TAY
    LDA.W Phantoon_EyeClosedTimers,Y : STA.W Enemy[1].var0
    LDA.W NMI_FrameCounter : BIT.W #$0001 : BNE .reversed
    LDA.W Phantoon.reversedMovementFlag : BEQ +
    LDA.W Phantoon.movementIndex : INC : STA.W Phantoon.movementIndex
    CMP.W #$0216 : BMI +
    STZ.W Phantoon.movementIndex

+   LDA.W #$0001 : STA.W Phantoon.speed
    STZ.W Phantoon.subSpeed : STZ.W Phantoon.movementFlags : STZ.W Phantoon.reversedMovementFlag
    BRA .merge

  .reversed:
    LDA.W Phantoon.reversedMovementFlag : BNE +
    LDA.W Phantoon.movementIndex : DEC : STA.W Phantoon.movementIndex : BPL +
    LDA.W #$0215 : STA.W Phantoon.movementIndex

+   STZ.W Phantoon.speed : STZ.W Phantoon.subSpeed : STZ.W Phantoon.movementFlags
    LDA.W #$0001 : STA.W Phantoon.reversedMovementFlag

  .merge:
    LDA.W Phantoon.flameRainTriggeredFlag : BNE +
    LDA.W #Function_Phantoon_Figure8_Moving : STA.W Phantoon.function
    RTS

+   STZ.W Phantoon.fadeCompleteFlag
    LDA.W #Function_Phantoon_FlameRain_InitialFlameRain : STA.W Phantoon.function
    RTS


;;; $D0F1: Adjust speed and move Phantoon in figure-8 ;;;
AdjustSpeedAndMovePhantoonInFigure8:
    LDA.W Phantoon.reversedMovementFlag : BNE .reversed
    JSR UpdateFigure8PhantoonSpeed
    LDY.W #PhantoonMovementData
    LDA.W #$0216 : STA.B DP_Temp14
    JSR MovePhantoonInFigure8
    RTS

  .reversed:
    JSR UpdateReversedFigure8PhantoonSpeed
    LDY.W #PhantoonMovementData
    LDA.W #$0215 : STA.B DP_Temp14
    JSR MovePhantoonInReverseFigure8
    RTS


;;; $D114: Update figure-8 Phantoon speed ;;;
UpdateFigure8PhantoonSpeed:
    LDA.W Phantoon.movementFlags : BEQ .stage0
    BIT.W #$0001 : BNE .stage1
    BRA .stage2

  .stage0:
    LDA.W Phantoon.subSpeed : CLC : ADC.W Phantoon_Figure8_SubAcceleration_SlowStage : STA.W Phantoon.subSpeed
    LDA.W Phantoon.speed : ADC.W Phantoon_Figure8_Acceleration_SlowStage : STA.W Phantoon.speed
    CMP.W Phantoon_Figure8_SpeedCaps_Stage0Max : BMI ..return
    LDA.W Phantoon_Figure8_SpeedCaps_Stage0Max : DEC : STA.W Phantoon.speed
    STZ.W Phantoon.subSpeed
    INC.W Phantoon.movementFlags

  ..return:
    RTS

  .stage1:
    LDA.W Phantoon.subSpeed : CLC : ADC.W Phantoon_Figure8_SubAcceleration_FastStages : STA.W Phantoon.subSpeed
    LDA.W Phantoon.speed : ADC.W Phantoon_Figure8_Acceleration_FastStages : STA.W Phantoon.speed
    CMP.W Phantoon_Figure8_SpeedCaps_Stage1Max : BMI ..return
    LDA.W Phantoon_Figure8_SpeedCaps_Stage1Max : STA.W Phantoon.speed
    STZ.W Phantoon.subSpeed
    INC.W Phantoon.movementFlags

  ..return:
    RTS

  .stage2:
    LDA.W Phantoon.subSpeed : SEC : SBC.W Phantoon_Figure8_SubAcceleration_FastStages : STA.W Phantoon.subSpeed
    LDA.W Phantoon.speed : SBC.W Phantoon_Figure8_Acceleration_FastStages : STA.W Phantoon.speed
    CMP.W Phantoon_Figure8_SpeedCaps_Stage2Min : BEQ .negativeSpeed
    BPL .return

  .negativeSpeed:
    LDA.W Phantoon_Figure8_SpeedCaps_Stage2Min : INC : STA.W Phantoon.speed
    STZ.W Phantoon.subSpeed : STZ.W Phantoon.movementFlags

  .return:
    RTS


;;; $D193: Update reversed figure-8 Phantoon speed ;;;
UpdateReversedFigure8PhantoonSpeed:
    LDA.W Phantoon.movementFlags : BEQ .stage0
    BIT.W #$0001 : BNE .stage1
    BRA .stage2

  .stage0:
    LDA.W Phantoon.subSpeed : SEC : SBC.W Phantoon_ReverseFigure8_SubAcceleration_SlowStage : STA.W Phantoon.subSpeed
    LDA.W Phantoon.speed : SBC.W Phantoon_ReverseFigure8_Acceleration_SlowStage : STA.W Phantoon.speed
    CMP.W Phantoon_ReverseFigure8_SpeedCaps_Stage0Max : BEQ +
    BPL .stage0_return

+   LDA.W Phantoon_ReverseFigure8_SpeedCaps_Stage0Max : INC #2 : STA.W Phantoon.speed
    STZ.W Phantoon.subSpeed
    INC.W Phantoon.movementFlags

  .stage0_return:
    RTS

  .stage1:
    LDA.W Phantoon.subSpeed : SEC : SBC.W Phantoon_ReverseFigure8_SubAcceleration_FastStages : STA.W Phantoon.subSpeed
    LDA.W Phantoon.speed : SBC.W Phantoon_ReverseFigure8_Acceleration_FastStages : STA.W Phantoon.speed
    CMP.W Phantoon_ReverseFigure8_SpeedCaps_Stage1Max : BEQ +
    BPL .stage1_return

+   LDA.W Phantoon_ReverseFigure8_SpeedCaps_Stage1Max : INC : STA.W Phantoon.speed
    STZ.W Phantoon.subSpeed
    INC.W Phantoon.movementFlags

  .stage1_return:
    RTS

  .stage2:
    LDA.W Phantoon.subSpeed : CLC : ADC.W Phantoon_ReverseFigure8_SubAcceleration_FastStages : STA.W Phantoon.subSpeed
    LDA.W Phantoon.speed : ADC.W Phantoon_ReverseFigure8_Acceleration_FastStages : STA.W Phantoon.speed
    CMP.W Phantoon_ReverseFigure8_SpeedCaps_Stage2Min : BMI ..return
    LDA.W Phantoon_ReverseFigure8_SpeedCaps_Stage2Min : STA.W Phantoon.speed
    STZ.W Phantoon.subSpeed : STZ.W Phantoon.movementFlags

  ..return:
    RTS


;;; $D215: Move Phantoon in figure-8 ;;;
MovePhantoonInFigure8:
;; Parameters:
;;     Y: PhantoonMovementData
;;     $14: 216h (size of Phantoon movement data)
    LDA.W Phantoon.speed : STA.B DP_Temp16 : BNE .loop
    RTS

  .loop:
    PHY
    LDA.W Phantoon.movementIndex : ASL : STA.B DP_Temp12
    TYA : CLC : ADC.B DP_Temp12 : TAY
    LDA.W $0000,Y : AND.W #$00FF : BIT.W #$0080 : BEQ +
    ORA.W #$FF00

+   STA.B DP_Temp12
    LDA.W Enemy.XPosition : CLC : ADC.B DP_Temp12 : STA.W Enemy.XPosition
    LDA.W $0001,Y : AND.W #$00FF : BIT.W #$0080 : BEQ +
    ORA.W #$FF00

+   STA.B DP_Temp12
    LDA.W Enemy.YPosition : CLC : ADC.B DP_Temp12 : STA.W Enemy.YPosition
    LDA.W Phantoon.movementIndex : INC : STA.W Phantoon.movementIndex
    CMP.B DP_Temp14 : BMI +
    STZ.W Phantoon.movementIndex

+   PLY
    DEC.B DP_Temp16 : BEQ .return
    BRA .loop

  .return:
    RTS


;;; $D271: Move Phantoon in reverse figure-8 ;;;
MovePhantoonInReverseFigure8:
;; Parameters:
;;     Y: PhantoonMovementData
;;     $14: 215h (last index of Phantoon movement data)
    LDA.W Phantoon.speed : EOR.W #$FFFF : INC : STA.B DP_Temp16 : BNE .loop
    RTS

  .loop:
    PHY
    LDA.W Phantoon.movementIndex : ASL : STA.B DP_Temp12
    TYA : CLC : ADC.B DP_Temp12 : TAY
    LDA.W $0000,Y : AND.W #$00FF : BIT.W #$0080 : BEQ +
    ORA.W #$FF00

+   STA.B DP_Temp12
    LDA.W Enemy.XPosition : SEC : SBC.B DP_Temp12 : STA.W Enemy.XPosition
    LDA.W $0001,Y : AND.W #$00FF : BIT.W #$0080 : BEQ +
    ORA.W #$FF00

+   STA.B DP_Temp12
    LDA.W Enemy.YPosition : SEC : SBC.B DP_Temp12 : STA.W Enemy.YPosition
    LDA.W Phantoon.movementIndex : DEC : STA.W Phantoon.movementIndex : BPL +
    LDA.B DP_Temp14 : STA.W Phantoon.movementIndex

+   PLY
    DEC.B DP_Temp16 : BEQ .return
    BRA .loop

  .return:
    RTS


;;; $D2D1: Move Phantoon in swooping pattern ;;;
MovePhantoonInSwoopingPattern:
    LDA.W Phantoon.swoopingTargetXPosition : BMI .targetXNegative
    CLC : ADC.W #$0002 : STA.W Phantoon.swoopingTargetXPosition
    CMP.W #$0100 : BMI .targetCalculated
    ORA.W #$8000 : STA.W Phantoon.swoopingTargetXPosition
    AND.W #$7FFF
    BRA .targetCalculated

  .targetXNegative:
    SEC : SBC.W #$0002 : STA.W Phantoon.swoopingTargetXPosition
    AND.W #$7FFF : BEQ +
    BPL .targetCalculated

+   LDA.W #$0000 : STA.W Phantoon.swoopingTargetXPosition

  .targetCalculated:
    CMP.W Enemy.XPosition : BMI .lessThanX
    LDA.W Phantoon.swoopingXVelocity : CMP.W #$0800 : BPL +
    CLC : ADC.W #$0020 : STA.W Phantoon.swoopingXVelocity
    BRA +

  .lessThanX:
    LDA.W Phantoon.swoopingXVelocity : CMP.W #$F801 : BMI +
    SEC : SBC.W #$0020 : STA.W Phantoon.swoopingXVelocity

+   LDA.W Phantoon.swoopingXVelocity : XBA : PHA
    AND.W #$FF00 : STA.B DP_Temp14
    PLA : AND.W #$00FF : BIT.W #$0080 : BEQ +
    ORA.W #$FF00

+   STA.B DP_Temp12
    LDA.W Enemy.XSubPosition : CLC : ADC.B DP_Temp14 : STA.W Enemy.XSubPosition
    LDA.W Enemy.XPosition : ADC.B DP_Temp12 : STA.W Enemy.XPosition
    CMP.W #$FFC0 : BPL +
    LDA.W #$FFC0 : STA.W Enemy.XPosition
    BRA .checkDead

+   CMP.W #$01C0 : BMI .checkDead
    LDA.W #$01C0 : STA.W Enemy.XPosition

  .checkDead:
    LDA.W Phantoon.function,X : CMP.W #Function_Phantoon_Swooping_FatalDamage : BNE .notDeathSwoop
    LDA.W #$0070
    BRA +

  .notDeathSwoop:
    LDA.W SamusYPosition : SEC : SBC.W #$0030

+   CMP.W Enemy.YPosition : BMI .lessThanY
    LDA.W Phantoon.swoopingYVelocity : CMP.W #$0600 : BPL +
    CLC : ADC.W #$0040 : STA.W Phantoon.swoopingYVelocity
    BRA +

  .lessThanY:
    LDA.W Phantoon.swoopingYVelocity : CMP.W #$FA01 : BMI +
    SEC : SBC.W #$0040 : STA.W Phantoon.swoopingYVelocity

+   LDA.W Phantoon.swoopingYVelocity : XBA : PHA
    AND.W #$FF00 : STA.B DP_Temp14
    PLA : AND.W #$00FF : BIT.W #$0080 : BEQ +
    ORA.W #$FF00

+   STA.B DP_Temp12
    LDA.W Enemy.YSubPosition : CLC : ADC.B DP_Temp14 : STA.W Enemy.YSubPosition
    LDA.W Enemy.YPosition : ADC.B DP_Temp12 : STA.W Enemy.YPosition
    CMP.W #$0040 : BPL +
    LDA.W #$0040 : STA.W Enemy.YPosition
    RTS

+   CMP.W #$00D8 : BMI .return
    LDA.W #$00D8 : STA.W Enemy.YPosition

  .return:
    RTS


;;; $D3E1: Start Phantoon swooping pattern ;;;
StartPhantoonSwoopingPattern:
    LDA.W #$0400 : STA.W Phantoon.swoopingXVelocity : STA.W Phantoon.swoopingYVelocity
    STZ.W Phantoon.swoopingTargetXPosition
    LDA.W #Function_Phantoon_Swooping_Opaque : STA.W Phantoon.function,X
    LDA.W #$0168 : STA.W Phantoon.functionTimer,X
    RTS


;;; $D3FA: Make Phantoon look towards Samus ;;;
MakePhantoonLookTowardsSamus:
    JSL DetermineDirectionOfSamusFromEnemy
    ASL : TAY
    LDA.W #$0001 : STA.W Enemy[1].instTimer
    LDA.W .directionPointers,Y : STA.W Enemy[1].instList
    RTS

  .directionPointers:
    dw InstList_Phantoon_Eyeball_LookingUp ; Up
    dw InstList_Phantoon_Eyeball_LookingUpRight ; Up-right
    dw InstList_Phantoon_Eyeball_LookingRight ; Right
    dw InstList_Phantoon_Eyeball_LookingDownRight ; Down-right
    dw InstList_Phantoon_Eyeball_LookingDown ; Down
    dw InstList_Phantoon_Eyeball_LookingDown
    dw InstList_Phantoon_Eyeball_LookingDownLeft ; Down-left
    dw InstList_Phantoon_Eyeball_LookingLeft ; Left
    dw InstList_Phantoon_Eyeball_LookingUpLeft ; Up-left
    dw InstList_Phantoon_Eyeball_LookingUp


;;; $D421: Start Phantoon death sequence ;;;
StartPhantoonDeathSequence:
    PHX
    LDA.W Phantoon.function,X : CMP.W #Function_Phantoon_Swooping_Opaque : BEQ .swooping
    CMP.W #Function_Phantoon_Swooping_FadeOut : BEQ .swooping
    LDA.W #Function_Phantoon_DeathSequence_FadingInAndOut : STA.W Phantoon.function,X
    BRA +

  .swooping:
    LDA.W #Function_Phantoon_Swooping_FatalDamage : STA.W Phantoon.function,X

+   STZ.W Phantoon.reversedMovementFlag : STZ.W Phantoon.fadeCompleteFlag
    JSR MakePhantoonLookTowardsSamus
    LDX.W #$01FE
    LDA.B DP_BG2XScroll

  .loopBG2XScroll:
    STA.L WavyPhantoonBG2XScrollHDMADataTable,X
    DEX #2 : BPL .loopBG2XScroll
    LDA.W LayerBlending_PhantoonSemiTransparencyFlag : ORA.W #$4000 : STA.W LayerBlending_PhantoonSemiTransparencyFlag
    LDA.W #$0001 : STA.W Enemy[3].init1
    PLX
    RTS


;;; $D464: Advance Phantoon fade out ;;;
AdvancePhantoonFadeOut_DenominatorInA:
;; Parameters:
;;     A: Palette change denominator
    PHX
    STA.B DP_Temp12
    LDA.W NMI_FrameCounter : BIT.W #$0001 : BNE .return
    LDA.W Phantoon.fadeCompleteFlag : BNE .return
    LDA.B DP_Temp12 : STA.W Phantoon.paletteChangeDenominator
    JSR AdvancePhantoonFadeOut
    BCC .return
    LDA.W #$0001 : STA.W Phantoon.fadeCompleteFlag

  .return:
    PLX
    RTS


;;; $D486: Advance Phantoon fade in ;;;
AdvancePhantoonFadeIn_DenominatorInA:
;; Parameters:
;;     A: Palette change denominator
    PHX
    STA.B DP_Temp12
    LDA.W NMI_FrameCounter : BIT.W #$0001 : BNE .return
    LDA.W Phantoon.fadeCompleteFlag : BNE .return
    LDA.B DP_Temp12 : STA.W Phantoon.paletteChangeDenominator
    JSR AdvancePhantoonFadeIn
    BCC .return
    LDA.W #$0001 : STA.W Phantoon.fadeCompleteFlag

  .return:
    PLX
    RTS


;;; $D4A8: RTS ;;;
RTS_A7D4A8:
    RTS


;;; $D4A9: Phantoon function - fight intro - spawn circle of flames ;;;
Function_Phantoon_FightIntro_SpawnCircleOfFlames:
    DEC.W Phantoon.functionTimer,X : BEQ .timerExpired
    BPL .return

  .timerExpired:
    LDA.W Phantoon.flameCounter
    LDY.W #EnemyProjectile_PhantoonStartingFlames
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    LDA.W #$001D
    JSL QueueSound_Lib3_Max6
    LDA.W #$001E : STA.W Phantoon.functionTimer,X
    LDA.W Phantoon.flameCounter : INC : STA.W Phantoon.flameCounter
    CMP.W #$0008 : BMI .return
    STZ.W Phantoon.flameCounter : STZ.W Phantoon.roundDamage,X
    LDA.W #Function_Phantoon_FightIntro_SpinCircleOfFlames : STA.W Phantoon.function,X
    LDA.W #$001E : STA.W Phantoon.functionTimer,X
    JSL Spawn_Hardcoded_PLM
    db $00,$06
    dw PLMEntries_drawPhantoonsDoorDuringBossFight

  .return:
    RTS


;;; $D4EE: Phantoon function - fight intro - spin circle of flames ;;;
Function_Phantoon_FightIntro_SpinCircleOfFlames:
    DEC.W Phantoon.functionTimer,X : BEQ .timerExpired
    BPL .return

  .timerExpired:
    LDA.W #$00F0 : STA.W Phantoon.functionTimer,X
    LDA.W #$0001 : STA.W Phantoon.startingFlamesActivationFlag,X
    LDA.W #Function_Phantoon_FightIntro_StartWavyFadeIn : STA.W Phantoon.function,X

  .return:
    RTS


;;; $D508: Phantoon function - fight intro - start wavy fade in ;;;
Function_Phantoon_FightIntro_StartWavyFadeIn:
    DEC.W Phantoon.functionTimer,X : BEQ .timerExpired
    BPL .return

  .timerExpired:
    STZ.W Phantoon.startingFlamesActivationFlag,X
    LDA.W LayerBlending_PhantoonSemiTransparencyFlag : ORA.W #$4000 : STA.W LayerBlending_PhantoonSemiTransparencyFlag
    LDA.W #Function_Phantoon_FightIntro_WavyFadeIn : STA.W Phantoon.function,X
    LDA.W #$8001 : STA.W Phantoon.semiTransparencyHDMAObjectControl
    LDA.W #$0078 : STA.W Phantoon.functionTimer,X
    LDA.W WavyPhantoonConstants_phaseDelta : STA.B DP_Temp16
    LDA.W #$0002
    JSL Spawn_WavyPhantoon_HDMAObject
    LDA.W WavyPhantoonConstants_Intro_maxAmplitude : STA.W Phantoon.wavyPhantoonPhaseAmplitude
    STZ.W Phantoon.fadeCompleteFlag
    LDA.W #$0005
    JSL QueueMusicDataOrTrack_8FrameDelay

  .return:
    RTS


;;; $D54A: Phantoon function - fight intro - wavy fade-in ;;;
Function_Phantoon_FightIntro_WavyFadeIn:
    LDA.W #$000C
    JSR AdvancePhantoonFadeIn_DenominatorInA
    LDA.W WavyPhantoonConstants_Intro_amplitudeDelta : STA.B DP_Temp12
    LDA.W WavyPhantoonConstants_Intro_maxAmplitude : STA.B DP_Temp14
    JSR GrowShrinkPhantoonWaveAmplitude
    BCS .done
    DEC.W Phantoon.functionTimer,X : BEQ .shrinking
    BPL .return

  .shrinking:
    LDA.W #$0001 : STA.W Phantoon.wavyPhantoonPhaseDeltaDirection
    BRA .return

  .done:
    LDA.W #Function_Phantoon_FightIntro_PickFirstPattern : STA.W Phantoon.function,X
    LDA.W #$0001 : STA.W Phantoon.semiTransparencyHDMAObjectControl
    LDA.W #$001E : STA.W Phantoon.functionTimer,X

  .return:
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $D581: Unused ;;;
UNUSED_Function_Phantoon_FightIntro_A7D581:
    LDX.W #$01FE
    LDA.W #$0000

  .loop:
    STA.L WavyPhantoonBG2XScrollHDMADataTable,X
    DEX #2 : BPL .loop
    LDA.W #Function_Phantoon_FightIntro_PickFirstPattern : STA.W Phantoon.function,X
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $D596: Phantoon function - fight intro - pick first pattern ;;;
Function_Phantoon_FightIntro_PickFirstPattern:
    DEC.W Phantoon.functionTimer,X : BEQ .timerExpired
    BPL .return

  .timerExpired:
    STZ.W Phantoon.wavyPhantoonMode
    LDA.W #Function_Phantoon_Figure8_Moving : STA.W Phantoon.function,X
    LDA.W NMI_FrameCounter : LSR : AND.W #$0003 : ASL : TAY
    LDA.W Phantoon_EyeClosedTimers,Y : STA.W Enemy[1].var0
    JSL GenerateRandomNumber
    BIT.W #$0001 : BNE .reversed
    LDA.W #$0001 : STA.W Phantoon.speed
    STZ.W Phantoon.subSpeed : STZ.W Phantoon.movementFlags
    STZ.W Phantoon.fadeCounter : STZ.W Phantoon.movementIndex
    RTS

  .reversed:
    STZ.W Phantoon.speed : STZ.W Phantoon.subSpeed : STZ.W Phantoon.movementFlags
    LDA.W #$0001 : STA.W Phantoon.fadeCounter
    LDA.W #$0215 : STA.W Phantoon.movementIndex

  .return:
    RTS


;;; $D5E7: Phantoon function - figure-8 - moving ;;;
Function_Phantoon_Figure8_Moving:
    JSR AdjustSpeedAndMovePhantoonInFigure8
    JSR HandleCasualFlames
    DEC.W Enemy[1].var0 : BEQ .timerExpired
    BPL .return

  .timerExpired:
    LDA.W #RTS_A7D4A8 : STA.W Phantoon.function,X
    LDA.W #$0001 : STA.W Enemy[1].instTimer
    LDA.W #InstList_Phantoon_Eye_Open : STA.W Enemy[1].instList
    STZ.W Phantoon.flameRainTriggeredFlag
    JSR PhantoonMaterializationFlameSpiral

  .return:
    RTS


;;; $D60D: Phantoon function - figure-8 - vulnerable window ;;;
Function_Phantoon_Figure8_VulnerableWindow:
    DEC.W Phantoon.functionTimer,X : BEQ .timerExpired
    BPL .waiting

  .timerExpired:
    STZ.W Phantoon.roundDamage,X
    LDA.W Phantoon.swoopingTriggeredFlag : BEQ .swoopingNotTriggered
    STZ.W Phantoon.swoopingTriggeredFlag
    LDA.W #$003C : STA.W Phantoon.functionTimer,X
    LDA.W #Function_Phantoon_Figure8_SwoopingTriggered : STA.W Phantoon.function,X
    BRA .waiting

  .swoopingNotTriggered:
    LDA.W #RTS_A7D4A8 : STA.W Phantoon.function,X
    LDA.W #$0001 : STA.W Enemy.instTimer : STA.W Enemy[1].instTimer
    LDA.W #InstList_Phantoon_Body_Invulnerable : STA.W Enemy.instList
    LDA.W #InstList_Phantoon_Eye_Close_PickNewPattern : STA.W Enemy[1].instList
    LDA.W Enemy.properties : ORA.W #$0400 : STA.W Enemy.properties
    LDA.W #$0001 : STA.W Phantoon.flameRainTriggeredFlag
    RTS

  .waiting:
    JSR MakePhantoonLookTowardsSamus
    RTS


;;; $D65C: Phantoon function - figure-8 - swooping triggered ;;;
Function_Phantoon_Figure8_SwoopingTriggered:
    JSR MakePhantoonLookTowardsSamus
    LDA.W LayerBlending_PhantoonSemiTransparencyFlag : AND.W #$BFFF : STA.W LayerBlending_PhantoonSemiTransparencyFlag
    JSR StartPhantoonSwoopingPattern
    LDA.W #$0001 : STA.W Enemy.instTimer
    LDA.W #InstList_Phantoon_Body_FullHitbox : STA.W Enemy.instList
    RTS


;;; $D678: Phantoon function - swooping - opaque ;;;
Function_Phantoon_Swooping_Opaque:
    JSR MakePhantoonLookTowardsSamus
    JSR MovePhantoonInSwoopingPattern
    DEC.W Phantoon.functionTimer,X : BEQ .timerExpired
    BPL .return

  .timerExpired:
    LDA.W #Function_Phantoon_Swooping_FadeOut : STA.W Phantoon.function,X
    LDA.W LayerBlending_PhantoonSemiTransparencyFlag : ORA.W #$4000 : STA.W LayerBlending_PhantoonSemiTransparencyFlag
    LDA.W #$0001 : STA.W Enemy.instTimer : STA.W Enemy[1].instTimer
    LDA.W #InstList_Phantoon_Body_Invulnerable : STA.W Enemy.instList
    LDA.W #InstList_Phantoon_Eye_Close : STA.W Enemy[1].instList
    LDA.W Enemy.properties : ORA.W #$0400 : STA.W Enemy.properties
    STZ.W Phantoon.fadeCompleteFlag : STZ.W Phantoon.roundDamage,X

  .return:
    RTS


;;; $D6B9: Phantoon function - swooping - fading out ;;;
Function_Phantoon_Swooping_FadeOut:
    JSR MovePhantoonInSwoopingPattern
    LDA.W #$000C
    JSR AdvancePhantoonFadeOut_DenominatorInA
    LDA.W Phantoon.fadeCompleteFlag : BEQ .return
    LDA.W #Function_Phantoon_HidingBeforeFigure8_Hiding : STA.W Phantoon.function,X
    LDA.W #$0078 : STA.W Phantoon.functionTimer,X

  .return:
    RTS


;;; $D6D4: Phantoon function - hiding before figure-8 - hiding ;;;
Function_Phantoon_HidingBeforeFigure8_Hiding:
    DEC.W Phantoon.functionTimer,X : BEQ .timerExpired
    BPL .return

  .timerExpired:
    LDA.W #Function_Phantoon_HidingBeforeFigure8_PlacePhantoon : STA.W Phantoon.function,X

  .return:
    RTS


;;; $D6E2: Phantoon function - hiding before figure-8 - place Phantoon ;;;
Function_Phantoon_HidingBeforeFigure8_PlacePhantoon:
    JSL GenerateRandomNumber
    BIT.W #$0001 : BEQ .leftSidePattern
    LDA.W #$0088 : STA.W Phantoon.movementIndex
    LDA.W #$00D0 : STA.W Enemy.XPosition
    LDA.W #$0060 : STA.W Enemy.YPosition
    BRA +

  .leftSidePattern:
    LDA.W #$018F : STA.W Phantoon.movementIndex
    LDA.W #$0030 : STA.W Enemy.XPosition
    LDA.W #$0060 : STA.W Enemy.YPosition

+   STZ.W Phantoon.fadeCounter
    LDA.W #$0001 : STA.W Phantoon.speed
    STZ.W Phantoon.subSpeed : STZ.W Phantoon.flameRainTriggeredFlag
    JSR PickNewPhantoonPattern
    LDA.W #Function_Phantoon_HidingBeforeFigure8_FadingIn : STA.W Phantoon.function,X
    STZ.W Phantoon.fadeCompleteFlag
    RTS


;;; $D72D: Phantoon function - hiding before figure-8 - fading in ;;;
Function_Phantoon_HidingBeforeFigure8_FadingIn:
    LDA.W #$000C
    JSR AdvancePhantoonFadeIn_DenominatorInA
    LDA.W Phantoon.fadeCompleteFlag : BEQ .return
    LDA.W #Function_Phantoon_Figure8_Moving : STA.W Phantoon.function

  .return:
    RTS


;;; $D73F: Phantoon function - flame rain - show Phantoon ;;;
Function_Phantoon_FlameRain_ShowPhantoon:
    STZ.W Phantoon.fadeCompleteFlag
    LDA.W LayerBlending_PhantoonSemiTransparencyFlag : AND.W #$BFFF : STA.W LayerBlending_PhantoonSemiTransparencyFlag
    LDA.W #$0001 : STA.W Enemy.instTimer : STA.W Enemy[1].instTimer
    LDA.W #InstList_Phantoon_Body_FullHitbox : STA.W Enemy.instList
    LDA.W #InstList_Phantoon_Eyeball_Centered : STA.W Enemy[1].instList
    LDA.W #Function_Phantoon_FlameRain_MakePhantoonVulnerable : STA.W Phantoon.function,X
    RTS


;;; $D767: Phantoon function - flame rain - make Phantoon vulnerable ;;;
Function_Phantoon_FlameRain_MakePhantoonVulnerable:
    LDA.W #$0001
    JSR AdvancePhantoonFadeIn_DenominatorInA
    LDA.W Phantoon.fadeCompleteFlag : BEQ .waiting
    LDA.W Enemy.properties : AND.W #$FBFF : STA.W Enemy.properties
    LDA.W #Function_Phantoon_FlameRain_VulnerableWindow : STA.W Phantoon.function,X
    LDA.W #$005A : STA.W Phantoon.functionTimer

  .waiting:
    RTS


;;; $D788: Phantoon function - flame rain - vulnerable window ;;;
Function_Phantoon_FlameRain_VulnerableWindow:
    DEC.W Phantoon.functionTimer,X : BEQ .timerExpired
    BPL .return

  .timerExpired:
    STZ.W Phantoon.roundDamage,X
    LDA.W Phantoon.swoopingTriggeredFlag : BEQ .endVulnerableWindow
    STZ.W Phantoon.swoopingTriggeredFlag
    LDA.W #$0001 : STA.W Phantoon.flameRainTriggeredFlag
    JSR StartPhantoonSwoopingPattern
    RTS

  .endVulnerableWindow:
    LDA.W #Function_Phantoon_FlameRain_FadingOut : STA.W Phantoon.function,X
    STZ.W Phantoon.fadeCompleteFlag
    LDA.W #$0001 : STA.W Enemy.instTimer : STA.W Enemy[1].instTimer
    LDA.W #InstList_Phantoon_Body_Invulnerable : STA.W Enemy.instList
    LDA.W #InstList_Phantoon_Eye_Close : STA.W Enemy[1].instList
    LDA.W Enemy.properties : ORA.W #$0400 : STA.W Enemy.properties
    LDA.W LayerBlending_PhantoonSemiTransparencyFlag : ORA.W #$4000 : STA.W LayerBlending_PhantoonSemiTransparencyFlag

  .return:
    RTS


;;; $D7D5: Phantoon function - flame rain - fading out ;;;
Function_Phantoon_FlameRain_FadingOut:
    LDA.W #$000C
    JSR AdvancePhantoonFadeOut_DenominatorInA
    LDA.W Phantoon.fadeCompleteFlag : BNE .fadeComplete
    RTS

  .fadeComplete:
    LDA.W #Function_Phantoon_FlameRain_SubsequentFlameRain : STA.W Phantoon.function,X
    JSL GenerateRandomNumber
    AND.W #$0007 : ASL : TAY
    LDA.W Phantoon_FlameRain_HidingTimers,Y : STA.W Phantoon.functionTimer,X
    RTS


;;; $D7F7: Phantoon function - flame rain - subsequent flame rain ;;;
Function_Phantoon_FlameRain_SubsequentFlameRain:
    DEC.W Phantoon.functionTimer,X : BEQ .timerExpired
    BPL .return

  .timerExpired:
    JSL GenerateRandomNumber
    AND.W #$0007 : PHA
    ASL #3 : TAY
    LDA.W Phantoon_FlameRain_PositionTable_index,Y : STA.W Phantoon.movementIndex
    LDA.W Phantoon_FlameRain_PositionTable_XPosition,Y : STA.W Enemy.XPosition
    LDA.W Phantoon_FlameRain_PositionTable_YPosition,Y : STA.W Enemy.YPosition
    STZ.W Phantoon.fadeCounter
    LDA.W #Function_Phantoon_FlameRain_ShowPhantoon : STA.W Phantoon.function,X
    PLA
    JSR SpawnFlameRainProjectiles

  .return:
    RTS


;;; $D82A: Phantoon function - flame rain - initial flame rain ;;;
Function_Phantoon_FlameRain_InitialFlameRain:
    LDA.W #$000C
    JSR AdvancePhantoonFadeOut_DenominatorInA
    JSR AdjustSpeedAndMovePhantoonInFigure8
    JSR HandleCasualFlames
    DEC.W Enemy[1].var0 : BEQ .timerExpired
    BPL .return

  .timerExpired:
    STZ.W Phantoon.swoopingTriggeredFlag
    LDA.W #Function_Phantoon_FlameRain_ShowPhantoon : STA.W Phantoon.function,X
    LDA.W Enemy.XPosition : CMP.W #$0080 : BMI .pattern0
    LDA.W #$0002
    JSR SpawnFlameRainProjectiles
    RTS

  .pattern0:
    LDA.W #$0000
    JSR SpawnFlameRainProjectiles

  .return:
    RTS


;;; $D85C: Phantoon function - enraged - fading out before rage ;;;
Function_Phantoon_Enraged_FadingOutBeforeRage:
    LDA.W #$000C
    JSR AdvancePhantoonFadeOut_DenominatorInA
    LDA.W Phantoon.fadeCompleteFlag : BEQ .return
    LDA.W #Function_Phantoon_Enraged_Hiding : STA.W Phantoon.function,X
    LDA.W #$0078 : STA.W Phantoon.functionTimer,X

  .return:
    RTS


;;; $D874: Phantoon function - enraged - hiding ;;;
Function_Phantoon_Enraged_Hiding:
    DEC.W Phantoon.functionTimer,X : BEQ .timerExpired
    BPL .return

  .timerExpired:
    LDA.W #Function_Phantoon_Enraged_FadingIn : STA.W Phantoon.function,X
    LDA.W #$0080 : STA.W Enemy.XPosition
    LDA.W #$0020 : STA.W Enemy.YPosition
    STZ.W Phantoon.fadeCompleteFlag

  .return:
    RTS


;;; $D891: Phantoon function - enraged - fading in ;;;
Function_Phantoon_Enraged_FadingIn:
    LDA.W #$000C
    JSR AdvancePhantoonFadeIn_DenominatorInA
    LDA.W Phantoon.fadeCompleteFlag : BEQ .return
    LDA.W #Function_Phantoon_Enraged_Rage : STA.W Phantoon.function
    LDA.W #$0004 : STA.W Phantoon.functionTimer,X
    STZ.W Phantoon.fadeCompleteFlag

  .return:
    RTS


;;; $D8AC: Phantoon function - enraged - rage ;;;
Function_Phantoon_Enraged_Rage:
    DEC.W Phantoon.functionTimer,X : BEQ .timerExpired
    BPL .return

  .timerExpired:
    LDA.W Phantoon.rageRoundCounter : BIT.W #$0001 : BNE .oddWave
    LDY.W #$0006

  .loopEvenWave:
    PHY
    TYA : ORA.W #$0200
    LDY.W #EnemyProjectile_PhantoonDestroyableFlames
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    PLY : DEY : BPL .loopEvenWave
    BRA .merge

  .oddWave:
    LDY.W #$000F

  .loopOddWave:
    PHY
    TYA : ORA.W #$0200
    LDY.W #EnemyProjectile_PhantoonDestroyableFlames
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    PLY : DEY : CPY.W #$0008 : BPL .loopOddWave

  .merge:
    LDA.W #$0029
    JSL QueueSound_Lib3_Max6
    LDA.W Phantoon.rageRoundCounter : INC : STA.W Phantoon.rageRoundCounter
    CMP.W #$0008 : BPL .doneRaging
    LDA.W #$0080 : STA.W Phantoon.functionTimer,X
    RTS

  .doneRaging:
    LDA.W #$0001 : STA.W Enemy[1].instTimer
    LDA.W #InstList_Phantoon_Eye_Close : STA.W Enemy[1].instList
    STZ.W Phantoon.fadeCompleteFlag
    LDA.W #Function_Phantoon_Enraged_FadingOutAfterRage : STA.W Phantoon.function,X

  .return:
    RTS


;;; $D916: Phantoon function - enraged - fading out after rage ;;;
Function_Phantoon_Enraged_FadingOutAfterRage:
    LDA.W #$000C
    JSR AdvancePhantoonFadeOut_DenominatorInA
    LDA.W Phantoon.fadeCompleteFlag : BEQ .return
    LDA.W #Function_Phantoon_HidingBeforeFigure8_Hiding : STA.W Phantoon.function,X
    LDA.W #$0078 : STA.W Phantoon.functionTimer,X

  .return:
    RTS


;;; $D92E: Phantoon function - swooping - fatal damage ;;;
Function_Phantoon_Swooping_FatalDamage:
    JSR MakePhantoonLookTowardsSamus
    JSR MovePhantoonInSwoopingPattern
    LDA.W Enemy.XPosition : CMP.W #$0060 : BMI .return
    CMP.W #$00A0 : BPL .return
    LDA.W #Function_Phantoon_DeathSequence_FadingInAndOut : STA.W Phantoon.function,X

  .return:
    RTS


;;; $D948: Phantoon function - death sequence - fading in and out ;;;
Function_Phantoon_DeathSequence_FadingInAndOut:
    NOP ; >.<
    LDA.W Phantoon.fadeCounter : BIT.W #$0001 : BNE .advanceFade
    LDA.W #$000C
    JSR AdvancePhantoonFadeOut_DenominatorInA
    LDA.W Phantoon.fadeCompleteFlag : BNE .fadeComplete
    BRA .return

  .advanceFade:
    LDA.W #$000C
    JSR AdvancePhantoonFadeIn_DenominatorInA
    LDA.W Phantoon.fadeCompleteFlag : BEQ .return

  .fadeComplete:
    STZ.W Phantoon.fadeCompleteFlag
    LDA.W Phantoon.fadeCounter : INC : STA.W Phantoon.fadeCounter
    CMP.W #$000A : BMI .return
    LDA.W #Function_Phantoon_DeathSequence_Exploding : STA.W Phantoon.function,X
    LDA.W #$000F : STA.W Phantoon.functionTimer,X
    STZ.W Phantoon.explosionIndex : STZ.W Phantoon.explosionLoopCounter

  .return:
    RTS


;;; $D98B: Phantoon function - death sequence - exploding ;;;
Function_Phantoon_DeathSequence_Exploding:
    DEC.W Phantoon.functionTimer,X : BEQ .timerExpired
    BMI .timerExpired
    RTS

  .timerExpired:
    LDA.W Phantoon.explosionIndex : ASL #2 : TAY
    LDA.W .XOffset,Y : AND.W #$00FF : BIT.W #$0080 : BEQ +
    ORA.W #$FF00

+   STA.B DP_Temp12
    LDA.W Enemy.XPosition : CLC : ADC.B DP_Temp12 : STA.B DP_Temp12
    LDA.W .YOffset,Y : AND.W #$00FF : BIT.W #$0080 : BEQ +
    ORA.W #$FF00

+   STA.B DP_Temp14
    LDA.W Enemy.YPosition : CLC : ADC.B DP_Temp14 : STA.B DP_Temp14
    PHY
    LDA.W .explosionType,Y : AND.W #$00FF
    PHA
    LDY.W #EnemyProjectile_MiscDust
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    PLA : CMP.W #$001D : BNE .PhantoonExplosion
    LDA.W #$0024
    JSL QueueSound_Lib2_Max6
    BRA +

  .PhantoonExplosion:
    LDA.W #$002B
    JSL QueueSound_Lib2_Max6

+   PLY
    LDA.W .timer,Y : AND.W #$00FF : STA.W Phantoon.functionTimer,X
    LDA.W Phantoon.explosionIndex : INC : STA.W Phantoon.explosionIndex
    CMP.W #$000D : BMI .return
    LDA.W #$0005 : STA.W Phantoon.explosionIndex
    LDA.W Phantoon.explosionLoopCounter : INC : STA.W Phantoon.explosionLoopCounter
    CMP.W #$0003 : BMI .return
    LDA.W #Function_Phantoon_DeathSequence_SetupWavyMosaicPhantoon : STA.W Phantoon.function,X

  .return:
    RTS

;        _______________ X offset
;       |    ___________ Y offset
;       |   |    _______ Explosion type. 3 = small, 1Dh = big
;       |   |   |    ___ Timer
;       |   |   |   |
  .XOffset:
    db $00
  .YOffset:
    db     $00
  .explosionType:
    db         $1D
  .timer:
    db             $10 ;\
    db $20,$E0,$1D,$10 ;|
    db $E0,$20,$1D,$10 ;} Once
    db $E0,$E0,$1D,$10 ;|
    db $20,$20,$1D,$20 ;/
    db $E0,$F8,$1D,$08 ;\
    db $00,$00,$03,$08 ;|
    db $20,$F8,$1D,$08 ;|
    db $00,$00,$03,$08 ;|
    db $00,$18,$03,$08 ;} 3 times
    db $00,$30,$1D,$08 ;|
    db $E8,$18,$03,$08 ;|
    db $18,$18,$03,$08 ;/


;;; $DA51: Phantoon function - death sequence - set up wavy mosaic Phantoon ;;;
Function_Phantoon_DeathSequence_SetupWavyMosaicPhantoon:
    LDA.W WavyPhantoonConstants_phaseDelta : STA.B DP_Temp16
    LDA.W #$0001
    JSL Spawn_WavyPhantoon_HDMAObject
    STZ.W Phantoon.wavyPhantoonPhaseAmplitude
    LDA.W #Function_Phantoon_DeathSequence_WavyMosaicPhantoon : STA.W Phantoon.function,X
    LDA.W #$0002 : STA.W Phantoon.mosaicOptions
    LDA.W Enemy.properties : AND.W #$DFFF : ORA.W #$0500
    STA.W Enemy[1].properties : STA.W Enemy[2].properties : STA.W Enemy[3].properties
    LDA.W #$007E
    JSL QueueSound_Lib2_Max6
    RTS


;;; $DA86: Phantoon function - death sequence - wavy mosaic Phantoon ;;;
Function_Phantoon_DeathSequence_WavyMosaicPhantoon:
    LDA.W WavyPhantoonConstants_Dying_amplitudeDelta : STA.B DP_Temp12
    LDA.W WavyPhantoonConstants_Dying_maxAmplitude : STA.B DP_Temp14
    JSR GrowShrinkPhantoonWaveAmplitude
    LDA.W Phantoon.mosaicOptions : CMP.W #$FFFF : BEQ .doneMosaic
    LDA.W NMI_FrameCounter : BIT.W #$000F : BNE .return
    SEP #$20
    LDA.W Phantoon.mosaicOptions : CMP.B #$F2 : BEQ .mosaicF2
    CLC : ADC.B #$10 : STA.W Phantoon.mosaicOptions : STA.B DP_Mosaic
    REP #$20
    BRA .return

  .mosaicF2:
    REP #$20
    LDA.W #$FFFF : STA.W Phantoon.mosaicOptions
    STZ.W Phantoon.fadeCompleteFlag
    BRA .return

  .doneMosaic:
    LDA.W #$000C
    JSR AdvancePhantoonFadeOut_DenominatorInA
    LDA.W Phantoon.fadeCompleteFlag : BEQ .return
    LDA.W #Function_Phantoon_DeathSequence_ClearGraphics : STA.W Phantoon.function,X

  .return:
    RTS


;;; $DAD7: Phantoon function - death sequence - clear graphics ;;;
Function_Phantoon_DeathSequence_ClearGraphics:
    SEP #$20
    STZ.B DP_Mosaic
    REP #$20
    STZ.W Phantoon.wavyPhantoonMode
    LDA.W LayerBlending_PhantoonSemiTransparencyFlag : AND.W #$BFFF : STA.W LayerBlending_PhantoonSemiTransparencyFlag
    LDA.W #$FFFF : STA.W Phantoon.semiTransparencyHDMAObjectControl
    LDA.W #Function_Phantoon_DeathSequence_ActivateWreckedShip : STA.W Phantoon.function,X
    LDA.W #$003C : STA.W Phantoon.functionTimer,X
    STZ.W Phantoon.fadeCompleteFlag
    LDA.W #$0180 : STA.W Enemy.XPosition
    LDA.W #$0080 : STA.W Enemy.YPosition
    LDX.W #$03FE
    LDA.W #$0338

  .loop:
    STA.L EnemyBG2Tilemap,X
    DEX #2 : BPL .loop
    LDX.W VRAMWriteStack
    LDA.W #$0400 : STA.B VRAMWrite.size,X
    INX #2
    LDA.W #EnemyBG2Tilemap : STA.B VRAMWrite.size,X
    INX #2
    SEP #$20
    LDA.B #EnemyBG2Tilemap>>16 : STA.B VRAMWrite.size,X
    REP #$20
    INX
    LDA.W #$4800 : STA.B VRAMWrite.size,X
    INX #2 : STX.W VRAMWriteStack
    RTS


;;; $DB3D: Phantoon function - death sequence - activate Wrecked Ship ;;;
Function_Phantoon_DeathSequence_ActivateWreckedShip:
    PHX
    LDA.W Phantoon.functionTimer,X : BEQ .timerExpired
    DEC.W Phantoon.functionTimer,X
    PLX
    RTS

  .timerExpired:
    LDA.W NMI_FrameCounter : BIT.W #$0003 : BNE .return
    LDA.W #$000C : STA.W Phantoon.paletteChangeDenominator
    JSR AdvanceWreckedShipPowerOnPaletteTransition
    BCC .return
    SEP #$20
    LDA.B DP_MainScreenLayers : ORA.B #$02 : STA.B DP_MainScreenLayers
    REP #$20
    JSL PhantoonDeathItemDropRoutine
    LDA.W Enemy.properties : ORA.W #$0200 : STA.W Enemy.properties
    STA.W Enemy[1].properties : STA.W Enemy[2].properties : STA.W Enemy[3].properties
    LDX.W AreaIndex
    LDA.L SRAMMirror_Boss,X : ORA.W #$0001 : STA.L SRAMMirror_Boss,X
    JSL Spawn_Hardcoded_PLM
    db $00,$06
    dw PLMEntries_restorePhantoonsDoorDuringBossFight
    LDA.W #$0003
    JSL QueueMusicDataOrTrack_8FrameDelay

  .return:
    PLX
    RTS


;;; $DB9A: Advance Phantoon fade out ;;;
AdvancePhantoonFadeOut:
;; Returns:
;;     Carry: Set if reached target colour, clear otherwise
    REP #$30
    LDA.W Phantoon.paletteChangeDenominator : INC : CMP.W Phantoon.paletteChangeNumerator : BCS .advance
    LDA.W #$0000 : STA.W Phantoon.paletteChangeNumerator
    SEC
    RTS

  .advance:
    LDX.W #$0000

  .loop:
    PHX
    LDA.W Palette_Phantoon_FadeOutTarget,X : TAY
    LDA.L Palettes_BG12P7,X : TAX
    LDA.W Phantoon.paletteChangeNumerator
    JSR CalculateAthTransitionalColorFromXToY
    PLX
    STA.L Palettes_BG12P7,X
    INX #2 : CPX.W #$0020 : BCC .loop
    LDA.W Phantoon.paletteChangeNumerator : INC : STA.W Phantoon.paletteChangeNumerator
    CLC
    RTS


;;; $DBD5: Advance Phantoon fade in ;;;
AdvancePhantoonFadeIn:
;; Returns:
;;     Carry: Set if reached target colour, clear otherwise
    REP #$30
    LDA.W Phantoon.paletteChangeDenominator : INC : CMP.W Phantoon.paletteChangeNumerator : BCS .advance
    LDA.W #$0000 : STA.W Phantoon.paletteChangeNumerator
    SEC
    RTS

  .advance:
    LDX.W #$0000

  .loop:
    PHX
    JSR GetPhantoonHealthBasedPaletteColor
    LDA.L Palettes_BG12P7,X : TAX
    LDA.W Phantoon.paletteChangeNumerator
    JSR CalculateAthTransitionalColorFromXToY
    PLX
    STA.L Palettes_BG12P7,X
    INX #2 : CPX.W #$0020 : BCC .loop
    LDA.W Phantoon.paletteChangeNumerator : INC : STA.W Phantoon.paletteChangeNumerator
    CLC
    RTS


;;; $DC0F: Get Phantoon health-based palette colour [X] / 2 ;;;
GetPhantoonHealthBasedPaletteColor:
;; Returns:
;;     Y: [Palette_Phantoon_HealthBased_0 + clamp(([enemy health] - 1) / 312, 0, 7) * 20h + [X]]
    STX.B DP_Temp18
    LDX.W EnemyIndex
    LDA.W #$09C4 : LSR #3 : STA.B DP_Temp12 : STA.B DP_Temp14 ; >.<
    STZ.B DP_Temp16

  .loop:
    LDA.B DP_Temp14 : CMP.W Enemy.health,X : BPL .getPointer
    LDA.B DP_Temp14 : CLC : ADC.B DP_Temp12 : STA.B DP_Temp14
    LDA.B DP_Temp16 : INC : STA.B DP_Temp16
    CMP.W #$0007 : BMI .loop

  .getPointer:
    LDA.B DP_Temp16 : ASL : TAY
    LDA.W .palettePointers,Y : CLC : ADC.B DP_Temp18 : TAY
    LDA.W $0000,Y : TAY
    LDX.B DP_Temp18
    RTS

  .palettePointers:
    dw Palette_Phantoon_HealthBased_0
    dw Palette_Phantoon_HealthBased_1
    dw Palette_Phantoon_HealthBased_2
    dw Palette_Phantoon_HealthBased_3
    dw Palette_Phantoon_HealthBased_4
    dw Palette_Phantoon_HealthBased_5
    dw Palette_Phantoon_HealthBased_6
    dw Palette_Phantoon_HealthBased_7


;;; $DC5A: Advance Wrecked Ship power on palette transition ;;;
AdvanceWreckedShipPowerOnPaletteTransition:
;; Returns:
;;     Carry: Set if reached target colour, clear otherwise
    REP #$30
    LDA.W Phantoon.paletteChangeDenominator : INC : CMP.W Phantoon.paletteChangeNumerator : BCS .advance
    LDA.W #$0000 : STA.W Phantoon.paletteChangeNumerator
    SEC
    RTS

  .advance:
    LDX.W #$0000

  .loop:
    PHX
    LDA.W Palette_WreckedShipPoweredOn,X : TAY
    LDA.L Palettes,X : TAX
    LDA.W Phantoon.paletteChangeNumerator
    JSR CalculateAthTransitionalColorFromXToY
    PLX
    STA.L Palettes,X
    INX #2 : CPX.W #$00E0 : BCC .loop
    LDA.W Phantoon.paletteChangeNumerator : INC : STA.W Phantoon.paletteChangeNumerator
    CLC
    RTS


;;; $DC95: Calculate the [A]th transitional colour from [X] to [Y] ;;;
CalculateAthTransitionalColorFromXToY:
;; Returns:
;;     A: Result colour

; Same as $82:DAA6, except palette change denominator is Phantoon.paletteChangeDenominator instead of $C402
    PHA : PHA : PHX : PHY
    LDA.B $01,S : AND.W #$001F : TAY
    LDA.B $03,S : AND.W #$001F : TAX
    LDA.B $05,S
    JSR CalculateTheAthTransitionalColorComponentFromXToY
    STA.B $07,S
    LDA.B $01,S : ASL #3 : XBA : AND.W #$001F : TAY
    LDA.B $03,S : ASL #3 : XBA : AND.W #$001F : TAX
    LDA.B $05,S
    JSR CalculateTheAthTransitionalColorComponentFromXToY
    ASL #5 : ORA.B $07,S : STA.B $07,S
    LDA.B $01,S : LSR #2 : XBA : AND.W #$001F : TAY
    LDA.B $03,S : LSR #2 : XBA : AND.W #$001F : TAX
    LDA.B $05,S
    JSR CalculateTheAthTransitionalColorComponentFromXToY
    ASL #2 : XBA : ORA.B $07,S : STA.B $07,S
    PLY : PLX : PLA : PLA
    RTS


;;; $DCF1: Calculate the [A]th transitional colour component from [X] to [Y] ;;;
CalculateTheAthTransitionalColorComponentFromXToY:
;; Returns:
;;     If [A] = 0:
;;         A = [X]
;;     If [A] = [Phantoon palette change denominator] + 1:
;;         A = [Y]
;;     Otherwise:
;;         A = [X] + ([Y] - [X]) / ([Phantoon palette change denominator] + 1 - [A])

; Same as $82:DAA6, except palette change denominator is Phantoon.paletteChangeDenominator instead of $C402
    CMP.W #$0000 : BNE .notZero
    TXA
    RTS

  .notZero:
    DEC : CMP.W Phantoon.paletteChangeDenominator : BNE +
    TYA
    RTS

+   PHX
    INC : STA.B DP_Temp14
    TYA : SEC : SBC.B $01,S : STA.B DP_Temp12 : BPL +
    EOR.W #$FFFF : INC

+   SEP #$21 ; set carry
    STZ.W $4204
    STA.W $4205
    LDA.W Phantoon.paletteChangeDenominator : SBC.B DP_Temp14 : INC : STA.W $4206
    REP #$20
    NOP #5
    LDA.W $4214 : BIT.B DP_Temp12 : BPL +
    EOR.W #$FFFF : INC

+   STA.B DP_Temp12
    PLA : XBA : CLC : ADC.B DP_Temp12
    XBA : AND.W #$00FF
    RTS


;;; $DD3F: Hurt AI - enemy $E4BF (Phantoon) ;;;
HurtAI_Phantoon:
    PHP
    REP #$30
    LDA.W Enemy.flashTimer : CMP.W #$0008 : BEQ .healthBased
    LDA.W Enemy.frameCounter : BIT.W #$0002 : BNE .white
    LDA.W Enemy[2].init1 : BIT.W #$FF00 : BEQ .return

  .healthBased:
    LDX.W #$001E

  .loopPalette:
    JSR GetPhantoonHealthBasedPaletteColor
    TYA
    STA.L Palettes_BG12P7,X
    DEX #2 : BPL .loopPalette
    LDA.W Enemy[2].init1 : AND.W #$00FF : STA.W Enemy[2].init1
    BRA .return

  .white:
    LDA.W Enemy[2].init1 : BIT.W #$FF00 : BNE .return
    LDX.W #$001E

  .loopWhite:
    LDA.W #$7FFF : STA.L Palettes_BG12P7,X
    DEX #2 : BPL .loopWhite
    LDA.W Enemy[2].init1 : ORA.W #$0100 : STA.W Enemy[2].init1

  .return:
    PLP
    RTL


;;; $DD95: Enemy touch - enemy $E4BF (Phantoon) ;;;
EnemyTouch_Phantoon:
    JSL NormalEnemyTouchAI_NoDeathCheck_External
    RTL


;;; $DD9A: RTL. Power bomb reaction - enemy $E4BF (Phantoon) ;;;
RTL_A7DD9A:
    RTL


;;; $DD9B: Enemy shot - enemy $E4BF (Phantoon) ;;;
EnemyShot_Phantoon:
    PHB
    LDA.W Phantoon.function : CMP.W #Function_Phantoon_DeathSequence_FadingInAndOut : BMI .notDead
    PLB
    RTL

  .notDead:
    LDX.W EnemyIndex
    LDA.W Enemy.health,X : PHA
    JSL NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External
    PLA : STA.B DP_Temp12
    LDA.W Enemy.health,X : BNE .alive
    LDA.W #$0073
    JSL QueueSound_Lib2_Max6
    LDA.W #$0001 : STA.W Enemy[2].init1
    LDA.W Enemy.properties : ORA.W #$0400 : STA.W Enemy.properties
    JSR StartPhantoonDeathSequence

  .returnUpper:
    PLB
    RTL

  .alive:
    LDA.W Enemy.AI,X : BIT.W #$0002 : BEQ .returnUpper
    LDA.W #$0073
    JSL QueueSound_Lib2_Max6
    LDA.W Phantoon.function,X : CMP.W #Function_Phantoon_Figure8_VulnerableWindow : BEQ .vulnerableWindow
    CMP.W #Function_Phantoon_FlameRain_VulnerableWindow : BEQ .vulnerableWindow
    CMP.W #Function_Phantoon_Swooping_Opaque : BEQ .swooping
    JMP .return1036_2

  .swooping:
    LDA.B DP_Temp12 : SEC : SBC.W Enemy.health,X : STA.B DP_Temp12
    CMP.W #$012C : BMI .overDamaged
    LDA.W CollisionIndex : ASL : TAY
    LDA.W SamusProjectile_Types,Y : AND.W #$0F00 : CMP.W #$0200 : BNE .overDamaged
    JMP .enraged

  .overDamaged:
    LDA.W Phantoon.roundDamage,X : CLC : ADC.B DP_Temp12 : STA.W Phantoon.roundDamage,X
    CMP.W #$012C : BMI .return1036_2
    LDA.W #$0001 : STA.W Phantoon.functionTimer,X
    BRA .return1036_2

  .vulnerableWindow:
    LDA.B DP_Temp12 : SEC : SBC.W Enemy.health,X : STA.B DP_Temp12
    CMP.W #$012C : BMI +
    LDA.W CollisionIndex : ASL : TAY
    LDA.W SamusProjectile_Types,Y : AND.W #$0F00 : CMP.W #$0200 : BNE +
    JMP .enraged

+   LDA.W Phantoon.roundDamage,X : CLC : ADC.B DP_Temp12 : STA.W Phantoon.roundDamage,X
    CMP.W #$012C : BPL .nextRound
    JSL GenerateRandomNumber
    AND.W #$0007 : TAY
    LDA.W Phantoon_Unknown0FEAValues_A7CDA5,Y : AND.W #$00FF : STA.W Enemy[1].var1
    TYA : STA.W Enemy[3].init1
    LDA.W #$0001 : STA.W Enemy[2].init1
    LDA.W Phantoon.swoopingTriggeredFlag : BNE .returnLower
    LDA.W #$0001 : STA.W Phantoon.swoopingTriggeredFlag
    LDA.W Phantoon.functionTimer,X : CMP.W #$0010 : BMI .returnLower
    LDA.W #$0010 : STA.W Phantoon.functionTimer,X

  .returnLower:
    PLB
    RTL

  .return1036_2:
    LDA.W #$0002 : STA.W Enemy[2].init1
    PLB
    RTL

  .nextRound:
    LDA.W #Function_Phantoon_Swooping_FadeOut : STA.W Phantoon.function,X

  .nextRoundOrEnraged:
    STZ.W Phantoon.functionTimer,X : STZ.W Phantoon.swoopingTriggeredFlag : STZ.W Phantoon.roundDamage,X
    LDA.W LayerBlending_PhantoonSemiTransparencyFlag : ORA.W #$4000 : STA.W LayerBlending_PhantoonSemiTransparencyFlag
    LDA.W #$0001 : STA.W Enemy.instTimer : STA.W Enemy[1].instTimer
    LDA.W #InstList_Phantoon_Body_Invulnerable : STA.W Enemy.instList
    LDA.W #InstList_Phantoon_Eye_Close : STA.W Enemy[1].instList
    LDA.W Enemy.properties : ORA.W #$0400 : STA.W Enemy.properties
    STZ.W Phantoon.fadeCompleteFlag
    BRA .return1036_2

  .enraged:
    LDA.W #Function_Phantoon_Enraged_FadingOutBeforeRage : STA.W Phantoon.function,X
    BRA .nextRoundOrEnraged


;;; $DEDD: Extended spritemaps ;;;
ExtendedSpritemap_Phantoon_Body_Invulnerable:
    dw $0001
    dw $0000,$0000
    dw ExtendedTilemap_Phantoon_Body
    dw Hitbox_Phantoon_0

ExtendedSpritemap_Phantoon_Body_FullHitbox:
    dw $0001
    dw $0000,$0000
    dw ExtendedTilemap_Phantoon_Body
    dw Hitbox_Phantoon_1

ExtendedSpritemap_Phantoon_Body_EyeHitbox:
    dw $0001
    dw $0000,$0000
    dw ExtendedTilemap_Phantoon_Body
    dw Hitbox_Phantoon_2

ExtendedSpritemap_Phantoon_Eye_Closed:
    dw $0001
    dw $0000,$0000
    dw ExtendedTilemap_Phantoon_Eye_Closed
    dw Hitbox_Phantoon_0

ExtendedSpritemap_Phantoon_Eye_Opening:
    dw $0001
    dw $0000,$0000
    dw ExtendedTilemap_Phantoon_Eye_Closed
    dw Hitbox_Phantoon_0

ExtendedSpritemap_Phantoon_Eye_OpeningClosing:
    dw $0001
    dw $0000,$0000
    dw ExtendedTilemap_Phantoon_Eye_OpeningClosing
    dw Hitbox_Phantoon_0

ExtendedSpritemap_Phantoon_Eye_Open:
    dw $0001
    dw $0000,$0000
    dw ExtendedTilemap_Phantoon_Eye_Open
    dw Hitbox_Phantoon_0

ExtendedSpritemap_Phantoon_Eyeball_Centered:
    dw $0001
    dw $0000,$0000
    dw ExtendedTilemap_Phantoon_Eyeball_Centered
    dw Hitbox_Phantoon_0

ExtendedSpritemap_Phantoon_Eyeball_LookingUp:
    dw $0001
    dw $0000,$0000
    dw ExtendedTilemap_Phantoon_Eyeball_LookingUp
    dw Hitbox_Phantoon_0

ExtendedSpritemap_Phantoon_Eyeball_LookingDown:
    dw $0001
    dw $0000,$0000
    dw ExtendedTilemap_Phantoon_Eyeball_LookingDown
    dw Hitbox_Phantoon_0

ExtendedSpritemap_Phantoon_Eyeball_LookingLeft:
    dw $0001
    dw $0000,$0000
    dw ExtendedTilemap_Phantoon_Eyeball_LookingLeft
    dw Hitbox_Phantoon_0

ExtendedSpritemap_Phantoon_Eyeball_LookingRight:
    dw $0001
    dw $0000,$0000
    dw ExtendedTilemap_Phantoon_Eyeball_LookingRight
    dw Hitbox_Phantoon_0

ExtendedSpritemap_Phantoon_Eyeball_LookingDownLeft:
    dw $0001
    dw $0000,$0000
    dw ExtendedTilemap_Phantoon_Eyeball_LookingDownLeft
    dw Hitbox_Phantoon_0

ExtendedSpritemap_Phantoon_Eyeball_LookingDownRight:
    dw $0001
    dw $0000,$0000
    dw ExtendedTilemap_Phantoon_Eyeball_LookingDownRight
    dw Hitbox_Phantoon_0

ExtendedSpritemap_Phantoon_Eyeball_LookingUpLeft:
    dw $0001
    dw $0000,$0000
    dw ExtendedTilemap_Phantoon_Eyeball_LookingUpLeft
    dw Hitbox_Phantoon_0

ExtendedSpritemap_Phantoon_Eyeball_LookingUpRight:
    dw $0001
    dw $0000,$0000
    dw ExtendedTilemap_Phantoon_Eyeball_LookingUpRight
    dw Hitbox_Phantoon_0

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ExtendedSpritemap_Phantoon_Tentacles_A7DF7D:
; Unused clone of ExtendedSpritemap_Phantoon_Tentacles_0
    dw $0002
    dw $0000,$0000
    dw ExtendedTilemap_Phantoon_Tentacle_Left_0
    dw Hitbox_Phantoon_0
    dw $0000,$0000
    dw ExtendedTilemap_Phantoon_Tentacle_Right_0
    dw Hitbox_Phantoon_0

UNUSED_ExtendedSpritemap_Phantoon_Tentacles_A7DF8F:
; Unused clone of ExtendedSpritemap_Phantoon_Tentacles_1
    dw $0002
    dw $0000,$0000
    dw ExtendedTilemap_Phantoon_Tentacle_Left_1
    dw Hitbox_Phantoon_0
    dw $0000,$0000
    dw ExtendedTilemap_Phantoon_Tentacle_Right_1
    dw Hitbox_Phantoon_0

UNUSED_ExtendedSpritemap_Phantoon_Tentacles_A7DFA1:
; Unused clone of ExtendedSpritemap_Phantoon_Tentacles_2
    dw $0002
    dw $0000,$0000
    dw ExtendedTilemap_Phantoon_Tentacle_Left_2
    dw Hitbox_Phantoon_0
    dw $0000,$0000
    dw ExtendedTilemap_Phantoon_Tentacle_Right_2
    dw Hitbox_Phantoon_0
endif ; !FEATURE_KEEP_UNREFERENCED

ExtendedSpritemap_Phantoon_Tentacles_0:
    dw $0002
    dw $0000,$0000
    dw ExtendedTilemap_Phantoon_Tentacle_Left_0
    dw Hitbox_Phantoon_0
    dw $0000,$0000
    dw ExtendedTilemap_Phantoon_Tentacle_Right_0
    dw Hitbox_Phantoon_0

ExtendedSpritemap_Phantoon_Tentacles_1:
    dw $0002
    dw $0000,$0000
    dw ExtendedTilemap_Phantoon_Tentacle_Left_1
    dw Hitbox_Phantoon_0
    dw $0000,$0000
    dw ExtendedTilemap_Phantoon_Tentacle_Right_1
    dw Hitbox_Phantoon_0

ExtendedSpritemap_Phantoon_Tentacles_2:
    dw $0002
    dw $0000,$0000
    dw ExtendedTilemap_Phantoon_Tentacle_Left_2
    dw Hitbox_Phantoon_0
    dw $0000,$0000
    dw ExtendedTilemap_Phantoon_Tentacle_Right_2
    dw Hitbox_Phantoon_0

ExtendedSpritemap_Phantoon_Mouth_Normal:
    dw $0001
    dw $0000,$0000
    dw ExtendedTilemap_Phantoon_Mouth_0
    dw Hitbox_Phantoon_0

ExtendedSpritemap_Phantoon_Mouth_SpawningFlame_0:
    dw $0001
    dw $0000,$0000
    dw ExtendedTilemap_Phantoon_Mouth_1
    dw Hitbox_Phantoon_0

ExtendedSpritemap_Phantoon_Mouth_SpawningFlame_1:
    dw $0001
    dw $0000,$0000
    dw ExtendedTilemap_Phantoon_Mouth_2
    dw Hitbox_Phantoon_0

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ExtendedSpritemap_Phantoon_Mouth_SpawningFlame_A7E007:
    dw $0001
    dw $0000,$0000
    dw ExtendedTilemap_Phantoon_Mouth_0
    dw Hitbox_Phantoon_0
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $E011: RTL. Initialisation AI - enemy $E53F/$E57F (Phantoon) ;;;
RTL_A7E011:
    RTL


;;; $E012: Hitboxes ;;;
if !FEATURE_KEEP_UNREFERENCED
UNUSED_Hitbox_Phantoon_A7E012:
    dw $0001
    dw $FFF7,$FFF0,$0008,$0010
    dw EnemyTouch_Phantoon
    dw EnemyShot_Phantoon
endif ; !FEATURE_KEEP_UNREFERENCED

Hitbox_Phantoon_0:
    dw $0001
    dw $0000,$0000,$0000,$0000
    dw RTL_A7804C
    dw RTL_A7804C

Hitbox_Phantoon_1:
    dw $0005
    dw $FFDF,$FFD8,$0020,$0038
    dw EnemyTouch_Phantoon
    dw EnemyShot_Phantoon
    dw $FFF7,$0016,$0008,$0027
    dw EnemyTouch_Phantoon
    dw EnemyShot_Phantoon
    dw $FFE9,$0034,$FFF0,$0047
    dw EnemyTouch_Phantoon
    dw EnemyShot_Phantoon
    dw $000F,$0035,$0016,$0046
    dw EnemyTouch_Phantoon
    dw EnemyShot_Phantoon
    dw $FFF4,$0035,$000B,$0045
    dw EnemyTouch_Phantoon
    dw EnemyShot_Phantoon

Hitbox_Phantoon_2:
    dw $0001
    dw $FFF7,$0016,$0008,$0027
    dw EnemyTouch_Phantoon
    dw EnemyShot_Phantoon


;;; $E07A: Spritemaps / extended tilemaps ;;;
if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_PhantoonFlame_A7E07A:
    dw $0002
    %spritemapEntry(1, $1F8, $00, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $1F8, $F0, 0, 0, 2, 0, $100)

UNUSED_Spritemap_PhantoonFlame_A7E086:
    dw $0002
    %spritemapEntry(1, $1F8, $00, 0, 0, 2, 0, $108)
    %spritemapEntry(1, $1F8, $F0, 0, 0, 2, 0, $102)

UNUSED_Spritemap_PhantoonFlame_A7E092:
    dw $0002
    %spritemapEntry(1, $1F8, $00, 0, 0, 2, 0, $10A)
    %spritemapEntry(1, $1F8, $F0, 0, 0, 2, 0, $104)

UNUSED_Spritemap_PhantoonFlame_A7E09E:
    dw $0002
    %spritemapEntry(1, $00, $F8, 0, 1, 2, 0, $10C)
    %spritemapEntry(1, $1F0, $F8, 0, 0, 2, 0, $10C)
endif ; !FEATURE_KEEP_UNREFERENCED


ExtendedTilemap_Phantoon_Body:
    dw $FFFE
    dw $2000,$000A,$2338,$2338,$2338,$3D32,$3D33,$7D33,$7D32,$2338,$2338,$2338
    dw $2040,$000A,$2338,$3D40,$3D41,$3D42,$3D43,$7D43,$7D42,$7D41,$7D40,$2338
    dw $2080,$000A,$2338,$3D50,$3D51,$3D52,$3D53,$7D53,$7D52,$7D51,$7D50,$2338
    dw $20C0,$000A,$3D78,$3D60,$3D61,$3D62,$3D63,$7D63,$7D62,$7D61,$7D60,$7D78
    dw $2100,$000A,$3D79,$3D70,$3D71,$3D72,$3D73,$7D73,$7D72,$7D71,$7D70,$7D79
    dw $2140,$000A,$BD78,$3D34,$3D35,$3D36,$3D37,$7D37,$7D36,$7D35,$7D34,$FD78
    dw $2180,$000A,$2338,$3D44,$3D45,$3D46,$3D47,$7D47,$7D46,$7D45,$7D44,$2338
    dw $21C0,$000A,$2338,$3D54,$3D55,$3D56,$3D57,$7D57,$7D56,$7D55,$7D54,$2338
    dw $2200,$000A,$2338,$3D64,$3D65,$3D66,$2338,$2338,$7D66,$7D65,$7D64,$2338
    dw $2240,$000A,$2338,$3D74,$3D75,$3D76,$2338,$2338,$7D76,$7D75,$7D74,$2338
    dw $2280,$000A,$2338,$2338,$3D38,$3D39,$3D3A,$7D3A,$7D39,$7D38,$2338,$2338
    dw $22C0,$000A,$2338,$2338,$3D48,$3D49,$3D4A,$7D4A,$7D49,$7D48,$2338,$2338
    dw $FFFF

ExtendedTilemap_Phantoon_Eye_Open:
    dw $FFFE
    dw $21C6,$0004, $3D56,$3D57,$7D57,$7D56
    dw $2206,$0004, $3D66,$3D67,$3D3F,$7D66
    dw $2246,$0004, $3D76,$3D77,$3D4F,$7D76
    dw $2286,$0004, $3D39,$3D3A,$7D3A,$7D39
    dw $FFFF

ExtendedTilemap_Phantoon_Eye_OpeningClosing:
    dw $FFFE
    dw $21C6,$0004, $3D3D,$3D3E,$7D3E,$7D3D
    dw $2206,$0004, $3D4D,$3D4E,$3D5F,$7D4D
    dw $2246,$0004, $3D5D,$3D5E,$3D6F,$7D5D
    dw $2286,$0004, $3D6D,$3D6E,$7D6E,$7D6D
    dw $FFFF

ExtendedTilemap_Phantoon_Eye_Closed:
    dw $FFFE
    dw $21C6,$0004, $3D3B,$3D3C,$7D3C,$7D3B
    dw $2206,$0004, $3D4B,$3D4C,$7D4C,$7D4B
    dw $2246,$0004, $3D5B,$3D5C,$7D5C,$7D5B
    dw $2286,$0004, $3D6B,$3D6C,$7D6C,$7D6B
    dw $FFFF

ExtendedTilemap_Phantoon_Eyeball_Centered:
    dw $FFFE
    dw $2208,$0002, $3D67,$3D3F
    dw $2248,$0002, $3D77,$3D4F
    dw $FFFF

ExtendedTilemap_Phantoon_Eyeball_LookingUp:
    dw $FFFE
    dw $2208,$0002, $3D10,$3D11
    dw $2248,$0002, $3D20,$3D21
    dw $FFFF

ExtendedTilemap_Phantoon_Eyeball_LookingDown:
    dw $FFFE
    dw $2208,$0002, $3D12,$3D13
    dw $2248,$0002, $3D22,$3D23
    dw $FFFF

ExtendedTilemap_Phantoon_Eyeball_LookingLeft:
    dw $FFFE
    dw $2208,$0002, $3D14,$3D15
    dw $2248,$0002, $3D24,$3D25
    dw $FFFF

ExtendedTilemap_Phantoon_Eyeball_LookingRight:
    dw $FFFE
    dw $2208,$0002, $3D16,$3D17
    dw $2248,$0002, $3D26,$3D27
    dw $FFFF

ExtendedTilemap_Phantoon_Eyeball_LookingDownLeft:
    dw $FFFE
    dw $2208,$0002, $3D18,$3D19
    dw $2248,$0002, $3D28,$3D29
    dw $FFFF

ExtendedTilemap_Phantoon_Eyeball_LookingDownRight:
    dw $FFFE
    dw $2208,$0002, $3D1A,$3D1B
    dw $2248,$0002, $3D2A,$3D2B
    dw $FFFF

ExtendedTilemap_Phantoon_Eyeball_LookingUpLeft:
    dw $FFFE
    dw $2208,$0002, $3D1C,$3D1D
    dw $2248,$0002, $3D2C,$3D2D
    dw $FFFF

ExtendedTilemap_Phantoon_Eyeball_LookingUpRight:
    dw $FFFE
    dw $2208,$0002, $3D1E,$3D1F
    dw $2248,$0002, $3D2E,$3D2F
    dw $FFFF

ExtendedTilemap_Phantoon_Tentacle_Left_0:
    dw $FFFE
    dw $2304,$0001, $3D58
    dw $2344,$0001, $3D68
    dw $FFFF

ExtendedTilemap_Phantoon_Tentacle_Left_1:
    dw $FFFE
    dw $2304,$0001, $3D81
    dw $2344,$0001, $3D83
    dw $FFFF

ExtendedTilemap_Phantoon_Tentacle_Left_2:
    dw $FFFE
    dw $2304,$0001, $3D80
    dw $2344,$0001, $3D82
    dw $FFFF

ExtendedTilemap_Phantoon_Tentacle_Right_0:
    dw $FFFE
    dw $230E,$0001, $7D58
    dw $234E,$0001, $7D68
    dw $FFFF

ExtendedTilemap_Phantoon_Tentacle_Right_1:
    dw $FFFE
    dw $230E,$0001, $7D81
    dw $234E,$0001, $7D83
    dw $FFFF

ExtendedTilemap_Phantoon_Tentacle_Right_2:
    dw $FFFE
    dw $230E,$0001, $7D80
    dw $234E,$0001, $7D82
    dw $FFFF

ExtendedTilemap_Phantoon_Mouth_0:
    dw $FFFE
    dw $2306,$0004, $3D59,$3D5A,$7D5A,$7D59
    dw $2346,$0004, $3D69,$3D6A,$7D6A,$7D69
    dw $FFFF

ExtendedTilemap_Phantoon_Mouth_1:
    dw $FFFE
    dw $2306,$0004, $3D7A,$3D7B,$7D7B,$7D7A
    dw $2346,$0004, $3D7C,$3D7D,$7D7D,$7D7C
    dw $FFFF

ExtendedTilemap_Phantoon_Mouth_2:
    dw $FFFE
    dw $2306,$0004, $3D7E,$3D7F,$7D7F,$7D7E
    dw $2346,$0004, $3D30,$3D31,$7D31,$7D30
    dw $FFFF


;;; $E3D2: Phantoon movement data ;;;
PhantoonMovementData:
; List of (signed) X/Y offset pairs, 216h total
; Indexed by Phantoon.movementIndex
    db $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$FF, $00,$FF, $01,$00
    db $00,$FF, $01,$00, $00,$FF, $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF
    db $01,$00, $00,$FF, $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00
    db $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF, $00,$FF, $01,$00, $00,$FF
    db $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF
    db $01,$00, $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00
    db $00,$FF, $01,$00, $01,$00, $00,$FF, $01,$00, $01,$00, $00,$FF, $01,$00
    db $01,$00, $00,$FF, $01,$00, $01,$00, $00,$FF, $01,$00, $01,$00, $01,$00
    db $01,$00, $00,$FF, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00
    db $01,$00, $01,$00, $01,$00, $01,$00, $01,$01, $01,$00, $01,$00, $01,$00
    db $01,$00, $00,$01, $01,$00, $01,$00, $01,$00, $00,$01, $01,$00, $01,$00
    db $00,$01, $01,$00, $01,$00, $01,$01, $01,$00, $01,$01, $01,$00, $00,$01
    db $01,$00, $01,$00, $00,$01, $01,$00, $00,$01, $01,$00, $01,$00, $00,$01
    db $01,$00, $00,$01, $01,$00, $00,$01, $01,$00, $01,$01, $01,$01, $01,$01
    db $01,$01, $00,$01, $01,$00, $00,$01, $01,$00, $00,$01, $01,$00, $00,$01
    db $00,$01, $01,$00, $00,$01, $00,$01, $01,$00, $00,$01, $00,$01, $01,$00
    db $00,$01, $00,$01, $00,$01, $01,$00, $00,$01, $00,$01, $00,$01, $00,$01
    db $00,$01, $00,$01, $00,$01, $00,$01, $FF,$00, $00,$01, $00,$01, $00,$01
    db $FF,$00, $00,$01, $00,$01, $FF,$01, $00,$01, $FF,$00, $00,$01, $00,$01
    db $FF,$00, $00,$01, $FF,$00, $00,$01, $FF,$00, $00,$01, $FF,$01, $00,$01
    db $FF,$00, $FF,$01, $FF,$01, $FF,$00, $00,$01, $FF,$00, $00,$01, $FF,$00
    db $00,$01, $FF,$00, $FF,$00, $00,$01, $FF,$00, $00,$01, $FF,$00, $FF,$00
    db $00,$01, $FF,$00, $FF,$01, $FF,$00, $FF,$01, $FF,$00, $FF,$00, $00,$01
    db $FF,$00, $FF,$00, $00,$01, $FF,$00, $FF,$00, $FF,$00, $00,$01, $FF,$00
    db $FF,$00, $FF,$00, $FF,$00, $FF,$01, $FF,$00, $FF,$00, $FF,$00, $FF,$00
    db $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $00,$FF, $FF,$00
    db $FF,$00, $FF,$00, $FF,$00, $00,$FF, $FF,$00, $FF,$00, $00,$FF, $FF,$00
    db $FF,$00, $00,$FF, $FF,$00, $FF,$00, $00,$FF, $FF,$00, $FF,$FF, $FF,$00
    db $00,$FF, $FF,$00, $00,$FF, $FF,$00, $FF,$FF, $FF,$FF, $FF,$00, $00,$FF
    db $FF,$00, $00,$FF, $FF,$00, $00,$FF, $FF,$FF, $FF,$FF, $00,$FF, $FF,$00
    db $00,$FF, $FF,$00, $00,$FF, $FF,$00, $00,$FF, $FF,$00, $00,$FF, $FF,$FF
    db $00,$FF, $FF,$00, $00,$FF, $FF,$00, $00,$FF, $FF,$00, $00,$FF, $00,$FF
    db $FF,$00, $00,$FF, $FF,$00, $00,$FF, $00,$FF, $FF,$00, $00,$FF, $FF,$00
    db $00,$FF, $FF,$00, $00,$FF, $00,$FF, $FF,$00, $00,$FF, $FF,$00, $00,$FF
    db $FF,$FF, $00,$FF, $FF,$00, $00,$FF, $FF,$00, $00,$FF, $00,$FF, $FF,$00
    db $00,$FF, $FF,$00, $00,$FF, $FF,$00, $00,$FF, $FF,$FF, $00,$FF, $FF,$00
    db $00,$FF, $FF,$00, $00,$FF, $FF,$00, $00,$FF, $FF,$00, $00,$FF, $FF,$FF
    db $00,$FF, $FF,$00, $00,$FF, $FF,$00, $00,$FF, $FF,$00, $00,$FF, $FF,$00
    db $00,$FF, $FF,$00, $FF,$FF, $FF,$00, $00,$FF, $FF,$00, $00,$FF, $FF,$00
    db $FF,$FF, $FF,$00, $00,$FF, $FF,$00, $FF,$00, $00,$FF, $FF,$00, $FF,$00
    db $00,$FF, $FF,$00, $FF,$00, $00,$FF, $FF,$00, $FF,$00, $FF,$00, $FF,$00
    db $00,$FF, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00
    db $FF,$00, $FF,$00, $FF,$00, $FF,$01, $FF,$00, $FF,$00, $FF,$00, $FF,$00
    db $00,$01, $FF,$00, $FF,$00, $FF,$00, $00,$01, $FF,$00, $FF,$00, $00,$01
    db $FF,$00, $FF,$00, $FF,$01, $FF,$00, $FF,$01, $FF,$00, $00,$01, $FF,$00
    db $FF,$00, $00,$01, $FF,$00, $00,$01, $FF,$00, $FF,$00, $00,$01, $FF,$00
    db $00,$01, $FF,$00, $00,$01, $FF,$00, $00,$01, $FF,$00, $FF,$01, $FF,$01
    db $FF,$01, $00,$01, $FF,$00, $00,$01, $FF,$00, $00,$01, $FF,$00, $00,$01
    db $00,$01, $FF,$00, $00,$01, $FF,$01, $00,$01, $00,$01, $FF,$00, $00,$01
    db $00,$01, $00,$01, $FF,$00, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01
    db $00,$01, $00,$01, $00,$01, $01,$00, $00,$01, $00,$01, $00,$01, $01,$00
    db $00,$01, $00,$01, $01,$00, $00,$01, $00,$01, $01,$00, $00,$01, $00,$01
    db $01,$00, $00,$01, $01,$00, $00,$01, $01,$00, $00,$01, $01,$01, $01,$01
    db $00,$01, $01,$00, $01,$01, $01,$00, $00,$01, $01,$00, $00,$01, $01,$00
    db $00,$01, $01,$00, $01,$00, $00,$01, $01,$00, $00,$01, $01,$00, $01,$00
    db $00,$01, $01,$00, $01,$01, $01,$00, $01,$01, $01,$00, $01,$00, $00,$01
    db $01,$00, $01,$00, $00,$01, $01,$00, $01,$00, $01,$00, $00,$01, $01,$00
    db $01,$00, $01,$00, $01,$00, $01,$01, $01,$00, $01,$00, $01,$00, $01,$00
    db $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $00,$FF, $01,$00
    db $01,$00, $01,$00, $01,$00, $00,$FF, $01,$00, $01,$00, $00,$FF, $01,$00
    db $01,$00, $00,$FF, $01,$00, $01,$00, $00,$FF, $01,$00, $01,$00, $00,$FF
    db $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00, $01,$FF
    db $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF
    db $01,$00, $00,$FF, $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF, $01,$00
    db $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF, $00,$FF, $01,$00, $00,$FF
    db $01,$00, $00,$FF, $01,$FF, $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF
    db $01,$FF, $00,$FF, $01,$00, $00,$FF, $01,$00, $00,$FF


;;; $E7FE: Palette - enemy $E5BF (etecoon) ;;;
Palette_Etecoon:
    dw $3800,$5F97,$56F2,$2987,$00A0,$6355,$4AB0,$3A0B
    dw $31C9,$57FF,$42F7,$2610,$158C,$03FF,$0279,$0029


;;; $E81E: Instruction list - look right at Samus and run left ;;;
InstList_Etecoon_LookRightAtSamusAndRunLeft:
    dw $0005,Spritemap_Etecoon_C
    dw Instruction_Common_Sleep
    dw $0001,Spritemap_Etecoon_D


;;; $E828: Instruction list - running left ;;;
InstList_Etecoon_RunningLeft:
    dw $0005,Spritemap_Etecoon_0
    dw $0005,Spritemap_Etecoon_1
    dw $0005,Spritemap_Etecoon_2
    dw $0005,Spritemap_Etecoon_1
    dw Instruction_Common_GotoY
    dw InstList_Etecoon_RunningLeft


;;; $E83C: Instruction list - wall jump left ;;;
InstList_Etecoon_WallJump_0:
    dw $0008,Spritemap_Etecoon_7

InstList_Etecoon_WallJump_1:
    dw $0003,Spritemap_Etecoon_3
    dw $0003,Spritemap_Etecoon_4
    dw $0003,Spritemap_Etecoon_5
    dw $0003,Spritemap_Etecoon_6
    dw Instruction_Common_GotoY
    dw InstList_Etecoon_WallJump_1


;;; $E854: Instruction list - hopping - facing left ;;;
InstList_Etecoon_Hopping_FacingLeft:
    dw $0001,Spritemap_Etecoon_8
    dw Instruction_Common_Sleep
    dw $000C,Spritemap_Etecoon_9
    dw $000C,Spritemap_Etecoon_A


;;; $E862: Instruction list - hit ceiling ;;;
InstList_Etecoon_HitCeiling:
    dw $0006,Spritemap_Etecoon_B
    dw $000C,Spritemap_Etecoon_A
    dw $000C,Spritemap_Etecoon_9
    dw Instruction_Common_Sleep


;;; $E870: Instruction list - wall-jump left eligible ;;;
InstList_Etecoon_WallJumpLeftEligible:
    dw $0001,Spritemap_Etecoon_F
    dw Instruction_Common_Sleep


;;; $E876: Instruction list - look left at Samus and run right ;;;
InstList_Etecoon_LookLeftAtSamusAndRunRight:
    dw $0005,Spritemap_Etecoon_1E
    dw Instruction_Common_Sleep
    dw $0001,Spritemap_Etecoon_1D


;;; $E880: Instruction list - running right ;;;
InstList_Etecoon_RunningRight:
    dw $0005,Spritemap_Etecoon_10
    dw $0005,Spritemap_Etecoon_11
    dw $0005,Spritemap_Etecoon_12
    dw $0005,Spritemap_Etecoon_11
    dw Instruction_Common_GotoY
    dw InstList_Etecoon_RunningRight


;;; $E894: Instruction list - wall jump right ;;;
InstList_Etecoon_WallJumpRight:
    dw $0008,Spritemap_Etecoon_17


;;; $E898: Instruction list - jumping right ;;;
InstList_Etecoon_JumpingRight:
    dw $0003,Spritemap_Etecoon_13
    dw $0003,Spritemap_Etecoon_14
    dw $0003,Spritemap_Etecoon_15
    dw $0003,Spritemap_Etecoon_16
    dw Instruction_Common_GotoY
    dw InstList_Etecoon_JumpingRight


;;; $E8AC: Instruction list - hopping - facing right ;;;
InstList_Etecoon_Hopping_FacingRight:
    dw $0001,Spritemap_Etecoon_18
    dw Instruction_Common_Sleep
    dw $000C,Spritemap_Etecoon_19
    dw $000C,Spritemap_Etecoon_1A
    dw $0006,Spritemap_Etecoon_1B
    dw $000C,Spritemap_Etecoon_1A
    dw $000C,Spritemap_Etecoon_19
    dw Instruction_Common_Sleep


;;; $E8C8: Instruction list - wall-jump right eligible ;;;
InstList_Etecoon_WallJumpRightEligible:
    dw $0001,Spritemap_Etecoon_1F
    dw Instruction_Common_Sleep


;;; $E8CE: Instruction list - initial ;;;
InstList_Etecoon_Initial:
    dw $0008,Spritemap_Etecoon_18
    dw Instruction_Common_GotoY
    dw InstList_Etecoon_Initial


;;; $E8D6: Instruction list - flexing ;;;
InstList_Etecoon_Flexing_0:
    dw Instruction_Common_TimerInY
    dw $0004

InstList_Etecoon_Flexing_1:
    dw $0008,Spritemap_Etecoon_18
    dw $0008,Spritemap_Etecoon_19
    dw $0008,Spritemap_Etecoon_1A
    dw $0008,Spritemap_Etecoon_1B
    dw $0008,Spritemap_Etecoon_1A
    dw $0008,Spritemap_Etecoon_19
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate
    dw InstList_Etecoon_Flexing_1
    dw $0020,Spritemap_Etecoon_1C
    dw $0020,Spritemap_Etecoon_1E
    dw Instruction_Common_Sleep


;;; $E900: Etecoon constants ;;;
EtecoonConstants:
  .initialYVelocityOfHopsAndFailedJumps:
; Initial Y velocity of hops and failed jump
    dw $FFFD,$0000

  .initialYVelocityOfSuccessfulJump:
; Initial Y velocity of successful jump
    dw $FFFC,$0000

  .XVelocityRight:
; X velocity - right
    dw $0002,$0000

  .XVelocityLeft:
; X velocity - left
    dw $FFFE,$0000

  .SamusXProximityThresholdAtBottomOfRoom:
; Samus X proximity threshold at bottom of room
    dw $0040


;;; $E912: Initialisation AI - enemy $E5BF (etecoon) ;;;
InitAI_Etecoon:
    LDX.W EnemyIndex
    LDA.W Enemy.properties,X : ORA.W #$2000 : STA.W Enemy.properties,X
    LDA.W #Spritemap_Common_Nothing : STA.W Enemy.spritemap,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    LDA.W #InstList_Etecoon_Initial : STA.W Enemy.instList,X
    LDA.W #Function_Etecoon_Initial : STA.W Etecoon.function,X
    LDA.W #$FFFF : STA.W Etecoon.functionTimer,X
    RTL


;;; $E940: Main AI - enemy $E5BF (etecoon) ;;;
MainAI_Etecoon:
    LDX.W EnemyIndex
    LDA.W Etecoon.ID,X : BIT.W #$FF00 : BEQ .executeFunction
    SEC : SBC.W #$0100 : STA.W Etecoon.ID,X
    BRA .return

  .executeFunction:
    JMP.W (Etecoon.function,X)

  .return:
    RTL


;;; $E958: Freeze etecoon if quake active ;;;
FreezeEtecoonIfQuakeActive:
    LDA.W EarthquakeTimer : BEQ .return
    LDA.W Etecoon.ID,X : AND.W #$00FF : ORA.W #$8000 : STA.W Etecoon.ID,X
    LDA.W Enemy.instTimer,X : CLC : ADC.W #$0080 : STA.W Enemy.instTimer,X

  .return:
    RTS


;;; $E974: Etecoon horizontal movement ;;;
EtecoonHorizontalMovement:
;; Returns:
;;     Carry: Set if collision, clear otherwise
    LDA.W Etecoon.YVelocity,X : STA.B DP_Temp14
    LDA.W Etecoon.YSubVelocity,X : STA.B DP_Temp12
    JSL MoveEnemyRightBy_14_12_IgnoreSlopes
    RTS


;;; $E983: Etecoon vertical movement ;;;
EtecoonVerticalMovement:
;; Returns:
;;     Carry: Set if collision, clear otherwise
    LDA.W Etecoon.XVelocity,X : STA.B DP_Temp14
    LDA.W Etecoon.XSubVelocity,X : STA.B DP_Temp12
    LDA.W Etecoon.XVelocity,X : CMP.W #$0005 : BPL .move
    LDA.W Etecoon.XSubVelocity,X : CLC : ADC.L SamusYSubAcceleration : STA.W Etecoon.XSubVelocity,X ; >.<
    LDA.W Etecoon.XVelocity,X : ADC.L SamusYAcceleration : STA.W Etecoon.XVelocity,X ; >.<

  .move:
    JSL MoveEnemyDownBy_14_12
    RTS


;;; $E9AF: Etecoon function - initial ;;;
Function_Etecoon_Initial:
    LDA.W DoorTransitionFlagEnemiesPause : BEQ .notDoorTransition
    RTL

  .notDoorTransition:
    LDA.W Etecoon.functionTimer,X : BPL .positive
    LDA.W #$0080
    JSL IsSamusWithingAPixelRowsOfEnemy
    TAY : BEQ .return
    LDA.W Etecoon.ID,X : BIT.W #$0003 : BNE .flex
    LDA.W #$0035
    JSL QueueSound_Lib2_Max15

  .flex:
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDA.W #InstList_Etecoon_Flexing_0 : STA.W Enemy.instList,X
    LDA.W #$0100 : STA.W Etecoon.functionTimer,X
    RTL

  .positive:
    DEC.W Etecoon.functionTimer,X : BEQ .hop
    BPL .return

  .hop:
    LDA.W #InstList_Etecoon_Hopping_FacingLeft : STA.W Enemy.instList,X
    LDA.W #Function_Etecoon_StartHop_BottomOfRoom : STA.W Etecoon.function,X
    LDA.W #$000B : STA.W Etecoon.functionTimer,X

  .return:
    RTL


;;; $EA00: Etecoon function - start hop - bottom of room ;;;
Function_Etecoon_StartHop_BottomOfRoom:
    DEC.W Etecoon.functionTimer,X : BEQ .timerExpired
    BPL .return

  .timerExpired:
    LDA.W EtecoonConstants_initialYVelocityOfHopsAndFailedJumps : STA.W Etecoon.XVelocity,X
    LDA.W EtecoonConstants_initialYVelocityOfHopsAndFailedJumps+2 : STA.W Etecoon.XSubVelocity,X
    LDA.W Enemy.instList,X : INC #2 : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDA.W #Function_Etecoon_Hopping_BottomOfRoom : STA.W Etecoon.function,X
    LDA.W SamusXPosition : CMP.W #$0100 : BMI .return
    LDA.W #$0033
    JSL QueueSound_Lib2_Max6

  .return:
    RTL


;;; $EA37: Etecoon function - hopping - bottom of room ;;;
Function_Etecoon_Hopping_BottomOfRoom:
    JSR EtecoonVerticalMovement
    BCS .collision
    RTL

  .collision:
    LDA.W Etecoon.XVelocity,X : BPL .notRising
    STZ.W Etecoon.XVelocity,X : STZ.W Etecoon.XSubVelocity,X
    LDA.W #$0003 : STA.W Enemy.instTimer,X
    LDA.W #InstList_Etecoon_HitCeiling : STA.W Enemy.instList,X
    RTL

  .notRising:
    LDA.W #$0040
    JSL IsSamusWithingAPixelRowsOfEnemy
    TAY : BEQ .hopMore
    LDA.W EtecoonConstants_SamusXProximityThresholdAtBottomOfRoom
    JSL IsSamusWithinAPixelColumnsOfEnemy
    TAY : BEQ .hopMore
    JSL DetermineDirectionOfSamusFromEnemy
    CMP.W #$0005 : BPL .left
    LDA.W #InstList_Etecoon_LookRightAtSamusAndRunLeft : STA.W Enemy.instList,X
    STZ.W Etecoon.direction,X
    BRA +

  .left:
    LDA.W #InstList_Etecoon_LookLeftAtSamusAndRunRight : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Etecoon.direction,X

+   LDA.W #$0020 : STA.W Etecoon.functionTimer,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDA.W #Function_Etecoon_LookAtSamus : STA.W Etecoon.function,X
    RTL

  .hopMore:
    LDA.W #$000B : STA.W Etecoon.functionTimer,X
    LDA.W #Function_Etecoon_StartHop_BottomOfRoom : STA.W Etecoon.function,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDA.W #InstList_Etecoon_Hopping_FacingLeft : STA.W Enemy.instList,X
    RTL


;;; $EAB5: Etecoon function - look at Samus ;;;
Function_Etecoon_LookAtSamus:
    DEC.W Etecoon.functionTimer,X : BEQ .timerExpired
    BPL .return

  .timerExpired:
    LDA.W Enemy.instList,X : INC #2 : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDA.W Etecoon.direction,X : BEQ .left
    LDA.W EtecoonConstants_XVelocityRight : STA.W Etecoon.YVelocity,X
    LDA.W EtecoonConstants_XVelocityRight+2 : STA.W Etecoon.YSubVelocity,X
    LDA.W #Function_Etecoon_RunningRight : STA.W Etecoon.function,X
    BRA +

  .left:
    LDA.W EtecoonConstants_XVelocityLeft : STA.W Etecoon.YVelocity,X
    LDA.W EtecoonConstants_XVelocityLeft+2 : STA.W Etecoon.YSubVelocity,X
    LDA.W #Function_Etecoon_RunningLeft : STA.W Etecoon.function,X

+   LDA.W EtecoonConstants_initialYVelocityOfHopsAndFailedJumps : STA.W Etecoon.XVelocity,X
    LDA.W EtecoonConstants_initialYVelocityOfHopsAndFailedJumps+2 : STA.W Etecoon.XSubVelocity,X

  .return:
    RTL


;;; $EB02: Etecoon function - running left ;;;
Function_Etecoon_RunningLeft:
    JSR EtecoonHorizontalMovement
    BCC .return
    LDA.W EtecoonConstants_XVelocityRight : STA.W Etecoon.YVelocity,X
    LDA.W EtecoonConstants_XVelocityRight+2 : STA.W Etecoon.YSubVelocity,X
    LDA.W #Function_Etecoon_RunningRight : STA.W Etecoon.function,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDA.W #InstList_Etecoon_RunningRight : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Etecoon.direction,X

  .return:
    RTL


;;; $EB2C: Etecoon function - running right ;;;
Function_Etecoon_RunningRight:
    LDA.W #$0020 : STA.B DP_Temp14
    STZ.B DP_Temp12
    JSL CheckForHorizontalSolidBlockCollision
    BCC .move
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDA.W #InstList_Etecoon_JumpingRight : STA.W Enemy.instList,X
    LDA.W #Function_Etecoon_Jumping : STA.W Etecoon.function,X
    RTL

  .move:
    JSR EtecoonHorizontalMovement
    RTL


;;; $EB50: Etecoon function - jumping ;;;
Function_Etecoon_Jumping:
    JSR FreezeEtecoonIfQuakeActive
    JSR EtecoonHorizontalMovement
    BCC .noWall
    LDA.W Etecoon.direction,X : BNE .leftEligible
    LDA.W #InstList_Etecoon_WallJumpRightEligible : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Etecoon.direction,X
    BRA +

  .leftEligible:
    LDA.W #InstList_Etecoon_WallJumpLeftEligible : STA.W Enemy.instList,X
    STZ.W Etecoon.direction,X

+   LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDA.W #Function_Etecoon_WallJump : STA.W Etecoon.function,X
    LDA.W #$0008 : STA.W Etecoon.functionTimer,X
    LDA.W SamusXPosition : CMP.W #$0100 : BMI .returnUpper
    LDA.W #$0032
    JSL QueueSound_Lib2_Max6

  .returnUpper:
    RTL

  .noWall:
    JSR EtecoonVerticalMovement
    BCC .returnLower
    LDA.W Etecoon.direction,X : BNE .hopLeft
    LDA.W #InstList_Etecoon_Hopping_FacingRight : STA.W Enemy.instList,X
    BRA +

  .hopLeft:
    LDA.W #InstList_Etecoon_Hopping_FacingLeft : STA.W Enemy.instList,X

+   LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDA.W #$000B : STA.W Etecoon.functionTimer,X
    LDA.W #Function_Etecoon_LandedFromJump : STA.W Etecoon.function,X
    LDA.W EtecoonConstants_initialYVelocityOfHopsAndFailedJumps : STA.W Etecoon.XVelocity,X
    LDA.W EtecoonConstants_initialYVelocityOfHopsAndFailedJumps+2 : STA.W Etecoon.XSubVelocity,X

  .returnLower:
    RTL


;;; $EBCD: Etecoon function - wall jump ;;;
Function_Etecoon_WallJump:
    JSR FreezeEtecoonIfQuakeActive
    DEC.W Etecoon.functionTimer,X : BEQ .timerExpired
    BPL .return

  .timerExpired:
    LDA.W Etecoon.direction,X : BEQ .left
    LDA.W #InstList_Etecoon_WallJumpRight : STA.W Enemy.instList,X
    LDA.W EtecoonConstants_XVelocityRight : STA.W Etecoon.YVelocity,X
    LDA.W EtecoonConstants_XVelocityRight+2 : STA.W Etecoon.YSubVelocity,X
    BRA +

  .left:
    LDA.W #InstList_Etecoon_WallJump_0 : STA.W Enemy.instList,X
    LDA.W EtecoonConstants_XVelocityLeft : STA.W Etecoon.YVelocity,X
    LDA.W EtecoonConstants_XVelocityLeft+2 : STA.W Etecoon.YSubVelocity,X

+   LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDA.W #Function_Etecoon_Jumping : STA.W Etecoon.function,X
    LDA.W EtecoonConstants_initialYVelocityOfHopsAndFailedJumps : STA.W Etecoon.XVelocity,X
    LDA.W EtecoonConstants_initialYVelocityOfHopsAndFailedJumps+2 : STA.W Etecoon.XSubVelocity,X

  .return:
    RTL


;;; $EC1B: Etecoon function - landed from jump ;;;
Function_Etecoon_LandedFromJump:
    DEC.W Etecoon.functionTimer,X : BEQ .timerExpired
    BPL .return

  .timerExpired:
    LDA.W EtecoonConstants_initialYVelocityOfHopsAndFailedJumps : STA.W Etecoon.XVelocity,X
    LDA.W EtecoonConstants_initialYVelocityOfHopsAndFailedJumps+2 : STA.W Etecoon.XSubVelocity,X
    TXY
    LDA.W Etecoon.ID,X : AND.W #$00FF : ASL : TAX
    JSR.W (.pointers,X)
    LDA.W #$0001 : STA.W Enemy.instTimer,X

  .return:
    RTL

  .pointers:
    dw RunToLeftRunUpPoint
    dw RunToRightRunUpPoint
    dw HopAtCenterRunUpPoint


;;; $EC47: Run to left run-up point ;;;
RunToLeftRunUpPoint:
    TYX
    LDA.W #Function_Etecoon_RunToLeftRunUpPoint : STA.W Etecoon.function,X
    LDA.W #InstList_Etecoon_RunningLeft : STA.W Enemy.instList,X
    LDA.W EtecoonConstants_XVelocityLeft : STA.W Etecoon.YVelocity,X
    LDA.W EtecoonConstants_XVelocityLeft+2 : STA.W Etecoon.YSubVelocity,X
    RTS


;;; $EC61: Run to right run-up point ;;;
RunToRightRunUpPoint:
    TYX
    LDA.W #Function_Etecoon_RunToRightRunUpPoint : STA.W Etecoon.function,X
    LDA.W #InstList_Etecoon_RunningRight : STA.W Enemy.instList,X
    LDA.W EtecoonConstants_XVelocityRight : STA.W Etecoon.YVelocity,X
    LDA.W EtecoonConstants_XVelocityRight+2 : STA.W Etecoon.YSubVelocity,X
    RTS


;;; $EC7B: Hop at center run-up point ;;;
HopAtCenterRunUpPoint:
    TYX
    LDA.W #Function_Etecoon_Hopping_TopOfRoom : STA.W Etecoon.function,X
    LDA.W Enemy.instList,X : INC #2 : STA.W Enemy.instList,X
    LDA.W EtecoonConstants_XVelocityRight : STA.W Etecoon.YVelocity,X
    LDA.W EtecoonConstants_XVelocityRight+2 : STA.W Etecoon.YSubVelocity,X
    RTS


;;; $EC97: Etecoon function - run to left run-up point ;;;
Function_Etecoon_RunToLeftRunUpPoint:
    JSR EtecoonHorizontalMovement
    LDA.W Enemy.XPosition,X : CMP.W #$0219 : BPL .return
    LDA.W #$000B : STA.W Etecoon.functionTimer,X
    LDA.W #Function_Etecoon_StartHop_TopOfRoom : STA.W Etecoon.function,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDA.W #InstList_Etecoon_Hopping_FacingLeft : STA.W Enemy.instList,X

  .return:
    RTL


;;; $ECBB: Etecoon function - run to right run-up point ;;;
Function_Etecoon_RunToRightRunUpPoint:
    JSR EtecoonHorizontalMovement
    LDA.W Enemy.XPosition,X : CMP.W #$0258 : BMI .return
    LDA.W #$000B : STA.W Etecoon.functionTimer,X
    LDA.W #Function_Etecoon_StartHop_TopOfRoom : STA.W Etecoon.function,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDA.W #InstList_Etecoon_Hopping_FacingLeft : STA.W Enemy.instList,X

  .return:
    RTL


;;; $ECDF: Etecoon function - running for successful morph tunnel jump ;;;
Function_Etecoon_RunningForSuccessfulMorphTunnelJump:
    JSR EtecoonHorizontalMovement
    LDA.W Enemy.XPosition,X : CMP.W #$0258 : BMI .return
    LDA.W #Function_Etecoon_SuccessfulMorphTunnelJump : STA.W Etecoon.function,X
    LDA.W EtecoonConstants_initialYVelocityOfSuccessfulJump : STA.W Etecoon.XVelocity,X
    LDA.W EtecoonConstants_initialYVelocityOfSuccessfulJump+2 : STA.W Etecoon.XSubVelocity,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDA.W #InstList_Etecoon_JumpingRight : STA.W Enemy.instList,X

  .return:
    RTL


;;; $ED09: Etecoon function - successful morph tunnel jump ;;;
Function_Etecoon_SuccessfulMorphTunnelJump:
    JSR EtecoonHorizontalMovement
    JSR EtecoonVerticalMovement
    LDA.W Enemy.XPosition,X : CMP.W #$02A8 : BMI .return
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDA.W #InstList_Etecoon_RunningRight : STA.W Enemy.instList,X
    LDA.W #Function_Etecoon_RunningThroughMorphTunnel : STA.W Etecoon.function,X

  .return:
    RTL


;;; $ED2A: Etecoon function - running through morph tunnel ;;;
Function_Etecoon_RunningThroughMorphTunnel:
    JSR EtecoonHorizontalMovement
    LDA.W Enemy.XPosition,X : CMP.W #$0348 : BMI .return
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDA.W #InstList_Etecoon_JumpingRight : STA.W Enemy.instList,X
    LDA.W #Function_Etecoon_FallingFromMorphTunnelLedge : STA.W Etecoon.function,X
    LDA.W #$FFFF : STA.W Etecoon.XVelocity,X
    LDA.W EtecoonConstants_initialYVelocityOfSuccessfulJump+2 : STA.W Etecoon.XSubVelocity,X

  .return:
    RTL


;;; $ED54: Etecoon function - falling from morph tunnel ledge ;;;
Function_Etecoon_FallingFromMorphTunnelLedge:
    JSR EtecoonHorizontalMovement
    JSR EtecoonVerticalMovement
    BCC .return
    LDA.W #$000B : STA.W Etecoon.functionTimer,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDA.W #InstList_Etecoon_Hopping_FacingLeft : STA.W Enemy.instList,X
    LDA.W #Function_Etecoon_StartHop_TopOfRoom : STA.W Etecoon.function,X

  .return:
    RTL


;;; $ED75: Etecoon function - hopping - top of room ;;;
Function_Etecoon_Hopping_TopOfRoom:
    JSR FreezeEtecoonIfQuakeActive
    JSR EtecoonVerticalMovement
    BCS .collision
    RTL

  .collision:
    LDA.W Etecoon.XVelocity,X : BPL .rising
    STZ.W Etecoon.XVelocity,X : STZ.W Etecoon.XSubVelocity,X
    LDA.W #$0003 : STA.W Enemy.instTimer,X
    LDA.W #InstList_Etecoon_HitCeiling : STA.W Enemy.instList,X
    RTL

  .rising:
    LDA.W #$000B : STA.W Etecoon.functionTimer,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDA.W #InstList_Etecoon_Hopping_FacingLeft : STA.W Enemy.instList,X
    LDA.W Etecoon.ID,X : BIT.W #$0002 : BNE .successEtecoon

  .hop:
    LDA.W #Function_Etecoon_StartHop_TopOfRoom : STA.W Etecoon.function,X
    BRA .return

  .successEtecoon:
    LDA.W Enemy.XPosition,X : CMP.W #$0340 : BPL .hop
    LDA.W #Function_Etecoon_HopUntilSamusIsNear : STA.W Etecoon.function,X

  .return:
    RTL


;;; $EDC7: Etecoon function - start hop - top of room ;;;
Function_Etecoon_StartHop_TopOfRoom:
    JSR FreezeEtecoonIfQuakeActive
    DEC.W Etecoon.functionTimer,X : BEQ .timerExpired
    BPL .return

  .timerExpired:
    LDA.W Etecoon.direction,X : CLC : ADC.W #$0100 : STA.W Etecoon.direction,X
    AND.W #$FF00 : CMP.W #$0400 : BMI .notFailedJump
    LDA.W Etecoon.direction,X : AND.W #$00FF : STA.W Etecoon.direction,X
    LDA.W Etecoon.ID,X : BIT.W #$0002 : BNE .notFailedJump
    LDA.W #Function_Etecoon_RunningForFailedMorphTunnelJump : STA.W Etecoon.function,X
    LDA.W #InstList_Etecoon_RunningRight : STA.W Enemy.instList,X
    LDA.W EtecoonConstants_XVelocityRight : STA.W Etecoon.YVelocity,X
    LDA.W EtecoonConstants_XVelocityRight+2 : STA.W Etecoon.YSubVelocity,X
    BRA .merge

  .notFailedJump:
    LDA.W #Function_Etecoon_Hopping_TopOfRoom : STA.W Etecoon.function,X
    LDA.W Enemy.instList,X : INC #2 : STA.W Enemy.instList,X

  .merge:
    LDA.W EtecoonConstants_initialYVelocityOfHopsAndFailedJumps : STA.W Etecoon.XVelocity,X
    LDA.W EtecoonConstants_initialYVelocityOfHopsAndFailedJumps+2 : STA.W Etecoon.XSubVelocity,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDA.W SamusXPosition : CMP.W #$0100 : BMI .return
    LDA.W #$0033
    JSL QueueSound_Lib2_Max6

  .return:
    RTL


;;; $EE3E: Etecoon function - hop until Samus is near ;;;
Function_Etecoon_HopUntilSamusIsNear:
    JSR FreezeEtecoonIfQuakeActive
    DEC.W Etecoon.functionTimer,X : BEQ .timerExpired
    BPL .return

  .timerExpired:
    LDA.W #$0040
    JSL IsSamusWithingAPixelRowsOfEnemy
    TAY : BEQ .notClose
    LDA.W #$0030
    JSL IsSamusWithinAPixelColumnsOfEnemy
    TAY : BEQ .notClose
    LDA.W #InstList_Etecoon_RunningRight : STA.W Enemy.instList,X
    LDA.W #Function_Etecoon_RunningForSuccessfulMorphTunnelJump : STA.W Etecoon.function,X
    BRA .skipSFX

  .notClose:
    LDA.W EtecoonConstants_initialYVelocityOfHopsAndFailedJumps : STA.W Etecoon.XVelocity,X
    LDA.W EtecoonConstants_initialYVelocityOfHopsAndFailedJumps+2 : STA.W Etecoon.XSubVelocity,X
    LDA.W Enemy.instList,X : INC #2 : STA.W Enemy.instList,X
    LDA.W #Function_Etecoon_Hopping_TopOfRoom : STA.W Etecoon.function,X
    LDA.W SamusXPosition : CMP.W #$0100 : BMI .skipSFX
    LDA.W #$0033
    JSL QueueSound_Lib2_Max6

  .skipSFX:
    LDA.W #$0001 : STA.W Enemy.instTimer,X

  .return:
    RTL


;;; $EE9A: Etecoon function - running for failed morph tunnel jump ;;;
Function_Etecoon_RunningForFailedMorphTunnelJump:
    JSR EtecoonHorizontalMovement
    LDA.W Enemy.XPosition,X : CMP.W #$0258 : BMI .return
    LDA.W #Function_Etecoon_FailedTunnelJump : STA.W Etecoon.function,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDA.W #InstList_Etecoon_JumpingRight : STA.W Enemy.instList,X

  .return:
    RTL


;;; $EEB8: Etecoon function - failed tunnel jump ;;;
Function_Etecoon_FailedTunnelJump:
    JSR EtecoonHorizontalMovement
    JSR EtecoonVerticalMovement
    BCC .return
    LDA.W EtecoonConstants_XVelocityLeft : STA.W Etecoon.YVelocity,X
    LDA.W EtecoonConstants_XVelocityLeft+2 : STA.W Etecoon.YSubVelocity,X
    LDA.W #Function_Etecoon_RunningLeft : STA.W Etecoon.function,X
    LDA.W EtecoonConstants_initialYVelocityOfHopsAndFailedJumps : STA.W Etecoon.XVelocity,X
    LDA.W EtecoonConstants_initialYVelocityOfHopsAndFailedJumps+2 : STA.W Etecoon.XSubVelocity,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDA.W #InstList_Etecoon_RunningLeft : STA.W Enemy.instList,X

  .return:
    RTL


;;; $EEEB: RTL ;;;
RTL_A7EEEB:
    RTL


;;; $EEEC: RTL ;;;
RTL_A7EEEC:
    RTL


;;; $EEED: Spritemaps ;;;
Spritemap_Etecoon_0:
    dw $0003
    %spritemapEntry(0, $1F2, $FF, 0, 0, 3, 1, $129)
    %spritemapEntry(1, $43F5, $EF, 0, 0, 3, 1, $100)
    %spritemapEntry(1, $43FA, $F7, 0, 0, 3, 1, $102)

Spritemap_Etecoon_1:
    dw $0002
    %spritemapEntry(1, $43F5, $F0, 0, 0, 3, 1, $100)
    %spritemapEntry(1, $43FA, $F8, 0, 0, 3, 1, $104)

Spritemap_Etecoon_2:
    dw $0002
    %spritemapEntry(1, $43F5, $F1, 0, 0, 3, 1, $100)
    %spritemapEntry(1, $43FA, $F9, 0, 0, 3, 1, $106)

Spritemap_Etecoon_3:
    dw $0003
    %spritemapEntry(0, $00, $06, 0, 0, 3, 1, $126)
    %spritemapEntry(0, $1F8, $06, 0, 0, 3, 1, $125)
    %spritemapEntry(1, $43F8, $F6, 0, 0, 3, 1, $108)

Spritemap_Etecoon_4:
    dw $0003
    %spritemapEntry(0, $06, $F8, 0, 0, 3, 1, $127)
    %spritemapEntry(0, $06, $00, 0, 0, 3, 1, $128)
    %spritemapEntry(1, $43F6, $F8, 0, 0, 3, 1, $10A)

Spritemap_Etecoon_5:
    dw $0003
    %spritemapEntry(0, $00, $F2, 1, 0, 3, 1, $126)
    %spritemapEntry(0, $1F8, $F2, 1, 0, 3, 1, $125)
    %spritemapEntry(1, $43F8, $FA, 1, 1, 3, 1, $108)

Spritemap_Etecoon_6:
    dw $0003
    %spritemapEntry(0, $1F2, $F8, 0, 1, 3, 1, $127)
    %spritemapEntry(0, $1F2, $00, 0, 1, 3, 1, $128)
    %spritemapEntry(1, $43FA, $F8, 1, 1, 3, 1, $10A)

Spritemap_Etecoon_7:
    dw $0003
    %spritemapEntry(0, $08, $02, 0, 0, 3, 1, $12E)
    %spritemapEntry(1, $43F3, $F3, 0, 0, 3, 1, $100)
    %spritemapEntry(1, $43F8, $FA, 0, 0, 3, 1, $10E)

Spritemap_Etecoon_8:
    dw $0007
    %spritemapEntry(0, $01, $FE, 0, 1, 3, 1, $122)
    %spritemapEntry(0, $1F8, $FE, 0, 0, 3, 1, $122)
    %spritemapEntry(1, $43F8, $F2, 0, 1, 3, 1, $10C)
    %spritemapEntry(0, $1F9, $01, 0, 0, 3, 1, $124)
    %spritemapEntry(0, $00, $01, 0, 1, 3, 1, $124)
    %spritemapEntry(0, $1F9, $FA, 0, 0, 3, 1, $120)
    %spritemapEntry(0, $00, $FA, 0, 1, 3, 1, $120)

Spritemap_Etecoon_9:
    dw $0007
    %spritemapEntry(0, $1F7, $FC, 0, 0, 3, 1, $122)
    %spritemapEntry(0, $02, $FC, 0, 1, 3, 1, $122)
    %spritemapEntry(1, $43F8, $F1, 0, 1, 3, 1, $10C)
    %spritemapEntry(0, $1F9, $01, 0, 0, 3, 1, $123)
    %spritemapEntry(0, $00, $01, 0, 1, 3, 1, $123)
    %spritemapEntry(0, $1F9, $FA, 0, 0, 3, 1, $120)
    %spritemapEntry(0, $00, $FA, 0, 1, 3, 1, $120)

Spritemap_Etecoon_A:
    dw $0007
    %spritemapEntry(0, $1F9, $01, 0, 0, 3, 1, $123)
    %spritemapEntry(0, $00, $01, 0, 1, 3, 1, $123)
    %spritemapEntry(1, $43F8, $EF, 0, 1, 3, 1, $10C)
    %spritemapEntry(0, $1F9, $F9, 0, 0, 3, 1, $120)
    %spritemapEntry(0, $00, $F9, 0, 1, 3, 1, $120)
    %spritemapEntry(0, $1F5, $F9, 0, 0, 3, 1, $121)
    %spritemapEntry(0, $04, $F9, 0, 1, 3, 1, $121)

Spritemap_Etecoon_B:
    dw $0007
    %spritemapEntry(0, $1F9, $01, 0, 0, 3, 1, $123)
    %spritemapEntry(0, $00, $01, 0, 1, 3, 1, $123)
    %spritemapEntry(1, $43F8, $EF, 0, 1, 3, 1, $10C)
    %spritemapEntry(0, $1F9, $F9, 0, 0, 3, 1, $120)
    %spritemapEntry(0, $00, $F9, 0, 1, 3, 1, $120)
    %spritemapEntry(0, $1F5, $F7, 0, 0, 3, 1, $121)
    %spritemapEntry(0, $04, $F7, 0, 1, 3, 1, $121)

Spritemap_Etecoon_C:
    dw $0007
    %spritemapEntry(1, $43F8, $F0, 0, 0, 3, 1, $100)
    %spritemapEntry(0, $02, $FC, 0, 1, 3, 1, $122)
    %spritemapEntry(0, $1F7, $FC, 0, 0, 3, 1, $122)
    %spritemapEntry(0, $1F9, $02, 0, 0, 3, 1, $124)
    %spritemapEntry(0, $00, $02, 0, 1, 3, 1, $124)
    %spritemapEntry(0, $1F9, $FA, 0, 0, 3, 1, $120)
    %spritemapEntry(0, $00, $FA, 0, 1, 3, 1, $120)

Spritemap_Etecoon_D:
    dw $0007
    %spritemapEntry(0, $02, $FC, 0, 1, 3, 1, $122)
    %spritemapEntry(0, $1F7, $FC, 0, 0, 3, 1, $122)
    %spritemapEntry(1, $43F8, $F0, 0, 1, 3, 1, $10C)
    %spritemapEntry(0, $1F9, $02, 0, 0, 3, 1, $124)
    %spritemapEntry(0, $00, $02, 0, 1, 3, 1, $124)
    %spritemapEntry(0, $1F9, $FA, 0, 0, 3, 1, $120)
    %spritemapEntry(0, $00, $FA, 0, 1, 3, 1, $120)

Spritemap_Etecoon_E:
    dw $0007
    %spritemapEntry(1, $43F8, $F0, 0, 1, 3, 1, $100)
    %spritemapEntry(0, $02, $FC, 0, 1, 3, 1, $122)
    %spritemapEntry(0, $1F7, $FC, 0, 0, 3, 1, $122)
    %spritemapEntry(0, $1F9, $02, 0, 0, 3, 1, $124)
    %spritemapEntry(0, $00, $02, 0, 1, 3, 1, $124)
    %spritemapEntry(0, $1F9, $FA, 0, 0, 3, 1, $120)
    %spritemapEntry(0, $00, $FA, 0, 1, 3, 1, $120)

Spritemap_Etecoon_F:
    dw $0005
    %spritemapEntry(1, $43F6, $F2, 0, 0, 3, 1, $100)
    %spritemapEntry(0, $00, $00, 0, 0, 3, 1, $12D)
    %spritemapEntry(0, $1F8, $00, 0, 0, 3, 1, $12C)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 1, $12B)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 1, $12A)

Spritemap_Etecoon_10:
    dw $0003
    %spritemapEntry(0, $06, $FF, 0, 1, 3, 1, $129)
    %spritemapEntry(1, $43FB, $EF, 0, 1, 3, 1, $100)
    %spritemapEntry(1, $43F6, $F7, 0, 1, 3, 1, $102)

Spritemap_Etecoon_11:
    dw $0002
    %spritemapEntry(1, $43FB, $F0, 0, 1, 3, 1, $100)
    %spritemapEntry(1, $43F6, $F8, 0, 1, 3, 1, $104)

Spritemap_Etecoon_12:
    dw $0002
    %spritemapEntry(1, $43FB, $F1, 0, 1, 3, 1, $100)
    %spritemapEntry(1, $43F6, $F9, 0, 1, 3, 1, $106)

Spritemap_Etecoon_13:
    dw $0003
    %spritemapEntry(0, $1F8, $06, 0, 1, 3, 1, $126)
    %spritemapEntry(0, $00, $06, 0, 1, 3, 1, $125)
    %spritemapEntry(1, $43F8, $F6, 0, 1, 3, 1, $108)

Spritemap_Etecoon_14:
    dw $0003
    %spritemapEntry(0, $1F2, $F8, 0, 1, 3, 1, $127)
    %spritemapEntry(0, $1F2, $00, 0, 1, 3, 1, $128)
    %spritemapEntry(1, $43FA, $F8, 0, 1, 3, 1, $10A)

Spritemap_Etecoon_15:
    dw $0003
    %spritemapEntry(0, $1F8, $F2, 1, 1, 3, 1, $126)
    %spritemapEntry(0, $00, $F2, 1, 1, 3, 1, $125)
    %spritemapEntry(1, $43F8, $FA, 1, 0, 3, 1, $108)

Spritemap_Etecoon_16:
    dw $0003
    %spritemapEntry(0, $06, $F8, 0, 0, 3, 1, $127)
    %spritemapEntry(0, $06, $00, 0, 0, 3, 1, $128)
    %spritemapEntry(1, $43F6, $F8, 1, 0, 3, 1, $10A)

Spritemap_Etecoon_17:
    dw $0003
    %spritemapEntry(0, $1F0, $02, 0, 1, 3, 1, $12E)
    %spritemapEntry(1, $43FD, $F3, 0, 1, 3, 1, $100)
    %spritemapEntry(1, $43F8, $FA, 0, 1, 3, 1, $10E)

Spritemap_Etecoon_18:
    dw $0007
    %spritemapEntry(0, $1F7, $FE, 0, 0, 3, 1, $122)
    %spritemapEntry(0, $00, $FE, 0, 1, 3, 1, $122)
    %spritemapEntry(1, $43F8, $F2, 0, 0, 3, 1, $10C)
    %spritemapEntry(0, $1FF, $01, 0, 1, 3, 1, $124)
    %spritemapEntry(0, $1F8, $01, 0, 0, 3, 1, $124)
    %spritemapEntry(0, $1FF, $FA, 0, 1, 3, 1, $120)
    %spritemapEntry(0, $1F8, $FA, 0, 0, 3, 1, $120)

Spritemap_Etecoon_19:
    dw $0007
    %spritemapEntry(0, $01, $FC, 0, 1, 3, 1, $122)
    %spritemapEntry(0, $1F6, $FC, 0, 0, 3, 1, $122)
    %spritemapEntry(1, $43F8, $F1, 0, 0, 3, 1, $10C)
    %spritemapEntry(0, $1FF, $01, 0, 1, 3, 1, $123)
    %spritemapEntry(0, $1F8, $01, 0, 0, 3, 1, $123)
    %spritemapEntry(0, $1FF, $FA, 0, 1, 3, 1, $120)
    %spritemapEntry(0, $1F8, $FA, 0, 0, 3, 1, $120)

Spritemap_Etecoon_1A:
    dw $0007
    %spritemapEntry(0, $1FF, $01, 0, 1, 3, 1, $123)
    %spritemapEntry(0, $1F8, $01, 0, 0, 3, 1, $123)
    %spritemapEntry(1, $43F8, $EF, 0, 0, 3, 1, $10C)
    %spritemapEntry(0, $1FF, $F9, 0, 1, 3, 1, $120)
    %spritemapEntry(0, $1F8, $F9, 0, 0, 3, 1, $120)
    %spritemapEntry(0, $03, $F9, 0, 1, 3, 1, $121)
    %spritemapEntry(0, $1F4, $F9, 0, 0, 3, 1, $121)

Spritemap_Etecoon_1B:
    dw $0007
    %spritemapEntry(0, $1FF, $01, 0, 1, 3, 1, $123)
    %spritemapEntry(0, $1F8, $01, 0, 0, 3, 1, $123)
    %spritemapEntry(1, $43F8, $EF, 0, 0, 3, 1, $10C)
    %spritemapEntry(0, $1FF, $F9, 0, 1, 3, 1, $120)
    %spritemapEntry(0, $1F8, $F9, 0, 0, 3, 1, $120)
    %spritemapEntry(0, $03, $F7, 0, 1, 3, 1, $121)
    %spritemapEntry(0, $1F4, $F7, 0, 0, 3, 1, $121)

Spritemap_Etecoon_1C:
    dw $0007
    %spritemapEntry(1, $43F8, $F0, 0, 1, 3, 1, $100)
    %spritemapEntry(0, $1F6, $FC, 0, 0, 3, 1, $122)
    %spritemapEntry(0, $01, $FC, 0, 1, 3, 1, $122)
    %spritemapEntry(0, $1FF, $02, 0, 1, 3, 1, $124)
    %spritemapEntry(0, $1F8, $02, 0, 0, 3, 1, $124)
    %spritemapEntry(0, $1FF, $FA, 0, 1, 3, 1, $120)
    %spritemapEntry(0, $1F8, $FA, 0, 0, 3, 1, $120)

Spritemap_Etecoon_1D:
    dw $0007
    %spritemapEntry(0, $1F6, $FC, 0, 0, 3, 1, $122)
    %spritemapEntry(0, $01, $FC, 0, 1, 3, 1, $122)
    %spritemapEntry(1, $43F8, $F0, 0, 0, 3, 1, $10C)
    %spritemapEntry(0, $1FF, $02, 0, 1, 3, 1, $124)
    %spritemapEntry(0, $1F8, $02, 0, 0, 3, 1, $124)
    %spritemapEntry(0, $1FF, $FA, 0, 1, 3, 1, $120)
    %spritemapEntry(0, $1F8, $FA, 0, 0, 3, 1, $120)

Spritemap_Etecoon_1E:
    dw $0007
    %spritemapEntry(1, $43F8, $F0, 0, 0, 3, 1, $100)
    %spritemapEntry(0, $1F6, $FC, 0, 0, 3, 1, $122)
    %spritemapEntry(0, $01, $FC, 0, 1, 3, 1, $122)
    %spritemapEntry(0, $1FF, $02, 0, 1, 3, 1, $124)
    %spritemapEntry(0, $1F8, $02, 0, 0, 3, 1, $124)
    %spritemapEntry(0, $1FF, $FA, 0, 1, 3, 1, $120)
    %spritemapEntry(0, $1F8, $FA, 0, 0, 3, 1, $120)

Spritemap_Etecoon_1F:
    dw $0005
    %spritemapEntry(1, $43FA, $F2, 0, 1, 3, 1, $100)
    %spritemapEntry(0, $1F8, $00, 0, 1, 3, 1, $12D)
    %spritemapEntry(0, $00, $00, 0, 1, 3, 1, $12C)
    %spritemapEntry(0, $1F8, $F8, 0, 1, 3, 1, $12B)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 1, $12A)


;;; $F225: Palettes ;;;
; Default
Palette_Dachora:
    dw $3800,$3F57,$2E4D,$00E2,$0060,$3AB0,$220B,$1166
    dw $0924,$57FF,$42F7,$2610,$158C,$7C1F,$6018,$300A

; Speed boosting
Palette_Dachora_SpeedBoosting_0:
    dw $1580,$3F57,$2E4D,$00E2,$0060,$3AB0,$220B,$1166
    dw $0924,$57FF,$42F7,$2610,$158C,$7C1F,$6018,$300A

Palette_Dachora_SpeedBoosting_1:
    dw $3800,$5357,$424D,$14E2,$1460,$4EB0,$360B,$2566
    dw $1D24,$63FF,$56F7,$3A10,$298C,$7C1F,$6818,$440A

Palette_Dachora_SpeedBoosting_2:
    dw $3800,$6B57,$5A4D,$2CE2,$2C60,$66B0,$4E0B,$3D66
    dw $3524,$73FF,$6AF7,$5210,$418C,$7C1F,$7418,$5C0A

Palette_Dachora_SpeedBoosting_3:
    dw $3800,$7F57,$6E4D,$40E2,$4060,$7AB0,$620B,$5166
    dw $4924,$7FFF,$7EF7,$6610,$558C,$7C1F,$7C18,$700A

; Shine (both stored and shinespark)
Palette_Dachora_Shine_0:
    dw $3800,$3F57,$2E4D,$00E2,$0060,$3AB0,$220B,$1166
    dw $0924,$57FF,$42F7,$2610,$158C,$7C1F,$6018,$300A

Palette_Dachora_Shine_1:
    dw $3800,$4B78,$3E90,$1967,$1906,$46F3,$326F,$25EB
    dw $1DA9,$5FFF,$4F18,$3673,$29EF,$7CDF,$64D9,$3CCE

Palette_Dachora_Shine_2:
    dw $3800,$579A,$4EF4,$320D,$31CC,$5336,$46D3,$3A70
    dw $362E,$67FF,$5B5A,$46D6,$3E73,$7D9F,$699A,$4D92

Palette_Dachora_Shine_3:
    dw $3800,$63BB,$5F37,$4AB3,$4A72,$6379,$5737,$52F5
    dw $4ED4,$6FFF,$677B,$5B39,$52F7,$7E5F,$725C,$5E56


;;; $F345: Instruction list - running left ;;;
InstList_Dachora_RunningLeft:
    dw $0005,Spritemap_Dachora_0
    dw $0005,Spritemap_Dachora_1
    dw $0005,Spritemap_Dachora_2
    dw $0005,Spritemap_Dachora_3
    dw $0005,Spritemap_Dachora_4
    dw $0005,Spritemap_Dachora_5
    dw Instruction_Common_GotoY
    dw InstList_Dachora_RunningLeft

InstList_Dachora_RunningLeft_FastAnimation:
    dw $0003,Spritemap_Dachora_0
    dw $0003,Spritemap_Dachora_1
    dw $0003,Spritemap_Dachora_2
    dw $0003,Spritemap_Dachora_3
    dw $0003,Spritemap_Dachora_4
    dw $0003,Spritemap_Dachora_5
    dw Instruction_Common_GotoY
    dw InstList_Dachora_RunningLeft_FastAnimation

InstList_Dachora_RunningLeft_VeryFastAnimation:
    dw $0001,Spritemap_Dachora_0
    dw $0001,Spritemap_Dachora_1
    dw $0001,Spritemap_Dachora_2
    dw $0001,Spritemap_Dachora_3
    dw $0001,Spritemap_Dachora_4
    dw $0001,Spritemap_Dachora_5
    dw Instruction_Common_GotoY
    dw InstList_Dachora_RunningLeft_VeryFastAnimation


;;; $F399: Instruction list - idling - facing left ;;;
InstList_Dachora_Idling_FacingLeft:
    dw $0030,Spritemap_Dachora_8
    dw $000A,Spritemap_Dachora_B
    dw $0007,Spritemap_Dachora_C
    dw $0007,Spritemap_Dachora_D
    dw $0007,Spritemap_Dachora_E
    dw $0007,Spritemap_Dachora_D
    dw $0007,Spritemap_Dachora_C
    dw $0007,Spritemap_Dachora_D
    dw $0007,Spritemap_Dachora_E
    dw $0007,Spritemap_Dachora_D
    dw $000A,Spritemap_Dachora_B
    dw Instruction_Common_GotoY
    dw InstList_Dachora_Idling_FacingLeft


;;; $F3C9: Instruction list - blinking - facing left ;;;
InstList_Dachora_Blinking_FacingLeft:
    dw $000B,Spritemap_Dachora_8
    dw $0008,Spritemap_Dachora_9
    dw $0008,Spritemap_Dachora_A
    dw $0004,Spritemap_Dachora_8
    dw $0004,Spritemap_Dachora_9
    dw $0004,Spritemap_Dachora_A
    dw $000A,Spritemap_Dachora_8
    dw $0005,Spritemap_Dachora_9
    dw $000B,Spritemap_Dachora_A
    dw Instruction_Common_GotoY
    dw InstList_Dachora_Blinking_FacingLeft


if !FEATURE_KEEP_UNREFERENCED
;;; $F3F1: Unused. Instruction list - charge shinespark - facing left ;;;
UNUSED_InstList_Dachora_ChargeShinespark_FacingLeft_A7F3F1:
    dw $0001,Spritemap_Dachora_6
    dw Instruction_Common_Sleep
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $F3F7: Instruction list - echo - facing left ;;;
InstList_Dachora_Echo_FacingLeft:
    dw $000A,Spritemap_Dachora_7
    dw Instruction_Common_GotoY
    dw InstList_Dachora_Echo_FacingLeft


;;; $F3FF: Instruction list - falling - facing left ;;;
InstList_Dachora_Falling_FacingLeft:
    dw $0005,Spritemap_Dachora_4
    dw Instruction_Common_GotoY
    dw InstList_Dachora_Falling_FacingLeft


;;; $F407: Instruction list - running right ;;;
InstList_Dachora_RunningRight:
    dw $0005,Spritemap_Dachora_F
    dw $0005,Spritemap_Dachora_10
    dw $0005,Spritemap_Dachora_11
    dw $0005,Spritemap_Dachora_12
    dw $0005,Spritemap_Dachora_13
    dw $0005,Spritemap_Dachora_14
    dw Instruction_Common_GotoY
    dw InstList_Dachora_RunningRight

InstList_Dachora_RunningRight_FastAnimation:
    dw $0003,Spritemap_Dachora_F
    dw $0003,Spritemap_Dachora_10
    dw $0003,Spritemap_Dachora_11
    dw $0003,Spritemap_Dachora_12
    dw $0003,Spritemap_Dachora_13
    dw $0003,Spritemap_Dachora_14
    dw Instruction_Common_GotoY
    dw InstList_Dachora_RunningRight_FastAnimation

InstList_Dachora_RunningRight_VeryFastAnimation:
    dw $0001,Spritemap_Dachora_F
    dw $0001,Spritemap_Dachora_10
    dw $0001,Spritemap_Dachora_11
    dw $0001,Spritemap_Dachora_12
    dw $0001,Spritemap_Dachora_13
    dw $0001,Spritemap_Dachora_14
    dw Instruction_Common_GotoY
    dw InstList_Dachora_RunningRight_VeryFastAnimation


;;; $F45B: Instruction list - idling - facing right ;;;
InstList_Dachora_Idling_FacingRight:
    dw $0030,Spritemap_Dachora_17
    dw $000A,Spritemap_Dachora_1A
    dw $0007,Spritemap_Dachora_1B
    dw $0007,Spritemap_Dachora_1C
    dw $0007,Spritemap_Dachora_1D
    dw $0007,Spritemap_Dachora_1C
    dw $0007,Spritemap_Dachora_1B
    dw $0007,Spritemap_Dachora_1C
    dw $0007,Spritemap_Dachora_1D
    dw $0007,Spritemap_Dachora_1C
    dw $000A,Spritemap_Dachora_1A
    dw Instruction_Common_GotoY
    dw InstList_Dachora_Idling_FacingRight


;;; $F48B: Instruction list - blinking - facing right ;;;
InstList_Dachora_Blinking_FacingRight:
    dw $000B,Spritemap_Dachora_17
    dw $0008,Spritemap_Dachora_18
    dw $0008,Spritemap_Dachora_19
    dw $0004,Spritemap_Dachora_17
    dw $0004,Spritemap_Dachora_18
    dw $0004,Spritemap_Dachora_19
    dw $000A,Spritemap_Dachora_17
    dw $0005,Spritemap_Dachora_18
    dw $000B,Spritemap_Dachora_19
    dw Instruction_Common_GotoY
    dw InstList_Dachora_Blinking_FacingRight


;;; $F4B3: Instruction list - charge shinespark - facing right ;;;
InstList_Dachora_ChargeShinespark_FacingRight:
    dw $0001,Spritemap_Dachora_15
    dw Instruction_Common_Sleep


;;; $F4B9: Instruction list - echo - facing right ;;;
InstList_Dachora_Echo_FacingRight:
    dw $000A,Spritemap_Dachora_16
    dw Instruction_Common_GotoY
    dw InstList_Dachora_Echo_FacingRight


;;; $F4C1: Instruction list - falling - facing right ;;;
InstList_Dachora_Falling_FacingRight:
    dw $0005,Spritemap_Dachora_13
    dw Instruction_Common_GotoY
    dw InstList_Dachora_Falling_FacingRight


;;; $F4C9: Dachora constants ;;;
DachoraConstants_SamusProximityXThreshold:
; Max X distance between dachora and Samus before dachora starts running
    dw $0060

UNUSED_DachoraConstants_maxXDistanceFromSamusToStop_A7F4CB:
; Unused max X distance between dachora and Samus before dachora stops running
    dw $0060

DachoraConstants_blinkingDuration:
; Blinking duration, between dachora seeing Samus and starting to run
    dw $0078

DachoraConstants_delayBeforeActivatingShinespark:
; Delay before activating shinespark
    dw $003C

DachoraConstants_echoPositionUpdateInterval:
; Echo position update interval
    dw $0001

DachoraConstants_echoLifetime:
; Echo lifetime
    dw $0008

DachoraConstants_maxXSpeed:
; Max X speed
    dw $0008,$0000

DachoraConstants_XAcceleration:
; X acceleration
    dw $0000,$1000


;;; $F4DD: Initialisation AI - enemy $E5FF (dachora) ;;;
InitAI_Dachora:
    LDX.W EnemyIndex
    LDA.W Enemy.properties,X : ORA.W #$2000 : STA.W Enemy.properties,X
    LDA.W #Spritemap_Common_Nothing : STA.W Enemy.spritemap,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    LDA.W Dachora.direction,X : BMI .echo
    BEQ .left
    LDA.W #InstList_Dachora_Idling_FacingRight : STA.W Enemy.instList,X
    BRA +

  .left:
    LDA.W #InstList_Dachora_Idling_FacingLeft : STA.W Enemy.instList,X

+   LDA.W #Function_Dachora_WaitForSamusToBeNear : STA.W Dachora.function,X
    RTL

  .echo:
    BIT.W #$0001 : BEQ ..left
    LDA.W #InstList_Dachora_Echo_FacingRight : STA.W Enemy.instList,X
    BRA +

  ..left:
    LDA.W #InstList_Dachora_Echo_FacingLeft : STA.W Enemy.instList,X

+   LDA.W #Function_Dachora_Echo : STA.W Dachora.function,X
    RTL


;;; $F52E: Main AI - enemy $E5FF (dachora) ;;;
MainAI_Dachora:
    LDX.W EnemyIndex
    JMP.W (Dachora.function,X)


;;; $F534: Unused. RTL ;;;
RTL_A7F534:
    RTL


;;; $F535: Load dachora palette ;;;
LoadDachoraPalette:
;; Parameters:
;;     Y: Palette source address
    PHP
    REP #$30
    PHX
    LDA.W #Palettes_SpriteP0>>8&$FF00 : STA.B DP_Temp01
    LDA.W Enemy.palette,X : XBA : LSR : ASL : TAX
    LDA.W .pointers,X : STA.B DP_Temp00
    TYX
    LDY.W #$0000

  .loop:
    LDA.W $0000,X : STA.B [DP_Temp00],Y
    INX #2
    INY #2 : CPY.W #$0020 : BMI .loop
    PLX : PLP
    RTS

  .pointers:
; pointers to $7E
    dw Palettes_SpriteP0
    dw Palettes_SpriteP1
    dw Palettes_SpriteP2
    dw Palettes_SpriteP3
    dw Palettes_SpriteP4C0
    dw Palettes_SpriteP5
    dw Palettes_SpriteP6
    dw Palettes_SpriteP7


;;; $F56F: Unused. RTL ;;;
RTL_A7F56F:
    RTL


;;; $F570: Dachora function - wait for Samus to be near ;;;
Function_Dachora_WaitForSamusToBeNear:
    LDA.W #$0001 : STA.B DP_Temp14
    STZ.B DP_Temp12
    JSL MoveEnemyDownBy_14_12
    LDA.W #$0040
    JSL IsSamusWithingAPixelRowsOfEnemy
    TAY : BEQ .return
    LDA.W DachoraConstants_SamusProximityXThreshold
    JSL IsSamusWithinAPixelColumnsOfEnemy
    TAY : BEQ .return
    LDA.W Dachora.direction,X : BEQ .left
    LDA.W #InstList_Dachora_Blinking_FacingRight : STA.W Enemy.instList,X
    BRA +

  .left:
    LDA.W #InstList_Dachora_Blinking_FacingLeft : STA.W Enemy.instList,X

+   LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDA.W #Function_Dachora_StartRunning : STA.W Dachora.function,X
    LDA.W DachoraConstants_blinkingDuration : STA.W Dachora.functionTimer,X
    LDA.W #$001D
    JSL QueueSound_Lib2_Max15

  .return:
    RTL


;;; $F5BC: Dachora function - start running ;;;
Function_Dachora_StartRunning:
    DEC.W Dachora.functionTimer,X : BNE .return
    LDA.W Dachora.direction,X : BEQ .left
    LDA.W #InstList_Dachora_RunningRight : STA.W Enemy.instList,X
    LDA.W #Function_Dachora_RunningRight : STA.W Dachora.function,X
    BRA +

  .left:
    LDA.W #InstList_Dachora_RunningLeft : STA.W Enemy.instList,X
    LDA.W #Function_Dachora_RunningLeft : STA.W Dachora.function,X

+   LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDA.W #$0001 : STA.W Dachora.paletteAnimationTimer,X

  .return:
    RTL


;;; $F5ED: Dachora function - running left ;;;
Function_Dachora_RunningLeft:
    JSR AccelerateRunningDachora
    LDA.B DP_Temp14 : EOR.W #$FFFF : STA.B DP_Temp14
    LDA.B DP_Temp12 : EOR.W #$FFFF : INC : STA.B DP_Temp12 : BNE +
    INC.B DP_Temp14

+   JSL MoveEnemyRightBy_14_12_IgnoreSlopes
    BCS .stop
    JSL AlignEnemyYPositionWIthNonSquareSlope
    BRA .noWall

  .stop:
    LDA.W #InstList_Dachora_RunningRight : STA.W Enemy.instList,X
    LDA.W #Function_Dachora_RunningRight : STA.W Dachora.function,X
    LDA.W #$0001 : STA.W Dachora.paletteAnimationTimer,X

  .merge:
    LDA.W #$0001 : STA.W Dachora.direction,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Dachora.speed,X : STZ.W Dachora.subSpeed,X
    LDY.W #Palette_Dachora
    JSR LoadDachoraPalette
    RTL

  .noWall:
    LDA.W Enemy.XPosition,X : CMP.W #$0060 : BMI .stop
    RTL

; Unused branch, dead code
    LDA.W UNUSED_DachoraConstants_maxXDistanceFromSamusToStop_A7F4CB
    JSL IsSamusWithinAPixelColumnsOfEnemy
    TAY : BNE .stop
    LDA.W #InstList_Dachora_Idling_FacingRight : STA.W Enemy.instList,X
    LDA.W #Function_Dachora_WaitForSamusToBeNear : STA.W Dachora.function,X
    STZ.W Dachora.paletteAnimationTimer,X
    BRA .merge


;;; $F65E: Dachora function - running right ;;;
Function_Dachora_RunningRight:
    JSR AccelerateRunningDachora
    JSL MoveEnemyRightBy_14_12_IgnoreSlopes
    BCS .collision
    JSL AlignEnemyYPositionWIthNonSquareSlope
    BRA .noWall

  .collision:
    LDA.W #$0071
    JSL QueueSound_Lib2_Max15
    LDA.W #InstList_Dachora_RunningLeft : STA.W Enemy.instList,X
    LDA.W #Function_Dachora_RunningLeft : STA.W Dachora.function,X

  .merge:
    STZ.W Dachora.direction,X : STZ.W Dachora.speed,X
    LDY.W #Palette_Dachora
    JSR LoadDachoraPalette

  .newAnimation:
    STZ.W Dachora.paletteAnimationTimer,X : STZ.W Dachora.subSpeed,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    RTL

  .noWall:
    LDA.W Enemy.XPosition,X : CMP.W #$0480 : BPL +
    RTL

+   LDA.W #InstList_Dachora_ChargeShinespark_FacingRight : STA.W Enemy.instList,X
    LDA.W #Function_Dachora_ActivateShinespark : STA.W Dachora.function,X
    LDA.W DachoraConstants_delayBeforeActivatingShinespark : STA.W Dachora.speed,X
    LDA.W Enemy.YPosition,X : CLC : ADC.W #$0008 : STA.W Enemy.YPosition,X
    LDA.W #$003D
    JSL QueueSound_Lib2_Max6
    BRA .newAnimation

; Unused branch, dead code
    LDA.W #InstList_Dachora_Idling_FacingLeft : STA.W Enemy.instList,X
    LDA.W #Function_Dachora_WaitForSamusToBeNear : STA.W Dachora.function,X
    BRA .merge


;;; $F6D5: Accelerate running dachora ;;;
AccelerateRunningDachora:
;; Returns:
;;     $14.$12: X speed
    LDA.W Dachora.speed,X : CMP.W DachoraConstants_maxXSpeed : BMI .noPaletteChange
    LDA.W Dachora.paletteAnimationTimer,X : CMP.W #$0001 : BNE .animTimer
    LDA.W #$0039
    JSL QueueSound_Lib2_Max6

  .animTimer:
    LDA.W Dachora.paletteAnimationTimer,X : DEC : STA.W Dachora.paletteAnimationTimer,X
    AND.W #$00FF : BEQ .loadPalette
    BPL .noPaletteChange

  .loadPalette:
    LDA.W Dachora.paletteAnimationTimer,X : XBA : AND.W #$00FF : ASL : TAY
    LDA.W .pointers,Y : TAY
    JSR LoadDachoraPalette
    LDA.W Dachora.paletteAnimationTimer,X : CLC : ADC.W #$0110 : STA.W Dachora.paletteAnimationTimer,X
    CMP.W #$0410 : BMI .noPaletteChange
    LDA.W #$0310 : STA.W Dachora.paletteAnimationTimer,X

  .noPaletteChange:
    LDA.W #$0001 : STA.B DP_Temp14
    STZ.B DP_Temp12
    JSL MoveEnemyDownBy_14_12
    LDA.W Dachora.speed,X : CMP.W DachoraConstants_maxXSpeed : BMI .increaseSpeed
    LDA.W Dachora.subSpeed,X : CMP.W DachoraConstants_maxXSpeed+2 : BMI .increaseSpeed
    LDA.W DachoraConstants_maxXSpeed : STA.W Dachora.speed,X : STA.B DP_Temp14
    LDA.W DachoraConstants_maxXSpeed+2 : STA.W Dachora.subSpeed,X : STA.B DP_Temp12
    BRA .return

  .increaseSpeed:
    LDA.W Dachora.subSpeed,X : CLC : ADC.W DachoraConstants_XAcceleration+2 : STA.W Dachora.subSpeed,X : STA.B DP_Temp12
    LDA.W Dachora.speed,X : ADC.W DachoraConstants_XAcceleration : STA.W Dachora.speed,X : STA.B DP_Temp14
    CMP.W #$0004 : BNE .checkMaxSpeed
    LDA.B DP_Temp12 : CMP.W #$0000 : BNE .return

  .maxSpeed:
    LDA.W Enemy.instList,X : CLC : ADC.W #$001C : STA.W Enemy.instList,X
    RTS

  .checkMaxSpeed:
    CMP.W #$0008 : BNE .return
    LDA.B DP_Temp12 : CMP.W #$0000 : BEQ .maxSpeed

  .return:
    RTS

  .pointers:
    dw Palette_Dachora_SpeedBoosting_0
    dw Palette_Dachora_SpeedBoosting_1
    dw Palette_Dachora_SpeedBoosting_2
    dw Palette_Dachora_SpeedBoosting_3


;;; $F78F: Dachora function - activate shinespark ;;;
Function_Dachora_ActivateShinespark:
    JSR LoadDachoraShinePalette
    DEC.W Dachora.functionTimer,X : BNE .return
    LDA.W Enemy.instList,X : INC #2 : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDA.W #Function_Dachora_Shinesparking : STA.W Dachora.function,X
    STZ.W Enemy[1].var0,X : STZ.W Enemy[1].var3,X : STZ.W Enemy[2].var3,X
    STZ.W Enemy[3].var3,X : STZ.W Enemy[4].var3,X
    STZ.W Dachora.YAcceleration,X : STZ.W Dachora.YSubAcceleration,X
    LDA.W Enemy.YPosition,X : SEC : SBC.W #$0008 : STA.W Enemy.YPosition,X
    LDA.W #$003B
    JSL QueueSound_Lib2_Max6
    LDA.W Dachora.direction,X : BEQ .left
    LDA.W #InstList_Dachora_Echo_FacingRight
    STA.W Enemy[1].instList,X : STA.W Enemy[2].instList,X
    STA.W Enemy[3].instList,X : STA.W Enemy[4].instList,X
    BRA +

  .left:
    LDA.W #InstList_Dachora_Echo_FacingLeft
    STA.W Enemy[1].instList,X : STA.W Enemy[2].instList,X
    STA.W Enemy[3].instList,X : STA.W Enemy[4].instList,X

+   LDA.W #$0001
    STA.W Enemy[1].instTimer,X : STA.W Enemy[2].instTimer,X
    STA.W Enemy[3].instTimer,X : STA.W Enemy[4].instTimer,X

  .return:
    RTL


;;; $F806: Dachora function - shinesparking ;;;
Function_Dachora_Shinesparking:
    JSR LoadDachoraShinePalette
    JSR UpdateDachoraEchoPositions
    LDA.W Dachora.YSubAcceleration,X : CLC : ADC.L SamusYSubAcceleration : STA.W Dachora.YSubAcceleration,X
    LDA.W Dachora.YAcceleration,X : ADC.L SamusYAcceleration : STA.W Dachora.YAcceleration,X
    LDA.W Dachora.subSpeed,X : CLC : ADC.W Dachora.YSubAcceleration,X : STA.W Dachora.subSpeed,X : STA.B DP_Temp12
    LDA.W Dachora.speed,X : ADC.W Dachora.YAcceleration,X : STA.W Dachora.speed,X : STA.B DP_Temp14
    CMP.W #$000F : BMI +
    LDA.W #$000F : STA.B DP_Temp14

+   LDA.B DP_Temp14 : EOR.W #$FFFF : STA.B DP_Temp14
    LDA.B DP_Temp12 : EOR.W #$FFFF : INC : STA.B DP_Temp12 : BNE .move
    INC.B DP_Temp14

  .move:
    JSL MoveEnemyDownBy_14_12
    BCC .return
    LDA.W Dachora.direction,X : BNE .right
    LDA.W #InstList_Dachora_Falling_FacingRight : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Dachora.direction,X
    BRA +

  .right:
    LDA.W #InstList_Dachora_Falling_FacingLeft : STA.W Enemy.instList,X
    STZ.W Dachora.direction,X

+   LDA.W #Function_Dachora_Falling : STA.W Dachora.function,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Dachora.speed,X : STZ.W Dachora.subSpeed,X : STZ.W Dachora.paletteAnimationTimer,X
    LDY.W #Palette_Dachora
    JSR LoadDachoraPalette
    LDA.W #$003C
    JSL QueueSound_Lib2_Max6

  .return:
    RTL


;;; $F89A: Update echo positions ;;;
UpdateDachoraEchoPositions:
    LDA.W Enemy[1].var0,X : BEQ .timerExpired
    DEC : STA.W Enemy[1].var0,X
    RTS

  .timerExpired:
    LDA.W DachoraConstants_echoPositionUpdateInterval : STA.W Enemy[1].var0,X
    LDA.W Enemy[1].var3,X : BNE .echo1
    LDA.W Enemy.XPosition,X : STA.W Enemy[1].XPosition,X
    LDA.W Enemy.YPosition,X : STA.W Enemy[1].YPosition,X
    LDA.W DachoraConstants_echoLifetime : STA.W Enemy[1].var3,X
    RTS

  .echo1:
    LDA.W Enemy[2].var3,X : BNE .echo2
    LDA.W Enemy.XPosition,X : STA.W Enemy[2].XPosition,X
    LDA.W Enemy.YPosition,X : STA.W Enemy[2].YPosition,X
    LDA.W DachoraConstants_echoLifetime : STA.W Enemy[2].var3,X
    RTS

  .echo2:
    LDA.W Enemy[3].var3,X : BNE .echo3
    LDA.W Enemy.XPosition,X : STA.W Enemy[3].XPosition,X
    LDA.W Enemy.YPosition,X : STA.W Enemy[3].YPosition,X
    LDA.W DachoraConstants_echoLifetime : STA.W Enemy[3].var3,X
    RTS

  .echo3:
    LDA.W Enemy[4].var3,X : BNE .return
    LDA.W Enemy.XPosition,X : STA.W Enemy[4].XPosition,X
    LDA.W Enemy.YPosition,X : STA.W Enemy[4].YPosition,X
    LDA.W DachoraConstants_echoLifetime : STA.W Enemy[4].var3,X

  .return:
    RTS


;;; $F90A: Load dachora shine palette ;;;
LoadDachoraShinePalette:
    LDA.W Dachora.paletteAnimationTimer,X : XBA : AND.W #$00FF : ASL : TAY
    LDA.W .pointers,Y : TAY
    JSR LoadDachoraPalette
    LDA.W Dachora.paletteAnimationTimer,X : CLC : ADC.W #$0100 : STA.W Dachora.paletteAnimationTimer,X
    CMP.W #$0400 : BMI .return
    STZ.W Dachora.paletteAnimationTimer,X

  .return:
    RTS

  .pointers:
    dw Palette_Dachora_Shine_0
    dw Palette_Dachora_Shine_1
    dw Palette_Dachora_Shine_2
    dw Palette_Dachora_Shine_3


;;; $F935: Dachora function - falling ;;;
Function_Dachora_Falling:
    LDA.W Dachora.subSpeed,X : CLC : ADC.L SamusYSubAcceleration : STA.W Dachora.subSpeed,X : STA.B DP_Temp12
    LDA.W Dachora.speed,X : ADC.L SamusYAcceleration : STA.W Dachora.speed,X : STA.B DP_Temp14
    CMP.W #$000A : BMI +
    LDA.W #$000A : STA.B DP_Temp14
    STZ.B DP_Temp12

+   JSL MoveEnemyDownBy_14_12
    BCC .return
    LDA.W Dachora.direction,X : BEQ .left
    LDA.W #InstList_Dachora_RunningRight : STA.W Enemy.instList,X
    LDA.W #Function_Dachora_RunningRight : STA.W Dachora.function,X
    BRA +

  .left:
    LDA.W #InstList_Dachora_RunningLeft : STA.W Enemy.instList,X
    LDA.W #Function_Dachora_RunningLeft : STA.W Dachora.function,X

+   LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Dachora.speed,X : STZ.W Dachora.subSpeed,X

  .return:
    RTL


;;; $F98C: Dachora function - echo ;;;
Function_Dachora_Echo:
    LDA.W Dachora.visibilityTimer,X : BEQ .invisible
    DEC : STA.W Dachora.visibilityTimer,X
    TXA : BIT.W #$0040 : BEQ +
    LDA.W NMI_FrameCounter : BIT.W #$0001 : BNE .visible
    BRA .invisible

+   LDA.W NMI_FrameCounter : BIT.W #$0001 : BEQ .visible

  .invisible:
    LDA.W Enemy.properties,X : ORA.W #$0100 : STA.W Enemy.properties,X
    BRA .return

  .visible:
    LDA.W Enemy.properties,X : AND.W #$FEFF : STA.W Enemy.properties,X

  .return:
    RTL


;;; $F9C2: RTL ;;;
RTL_A7F9C2:
    RTL


;;; $F9C3: RTL ;;;
RTL_A7F9C3:
    RTL


;;; $F9C4: Spritemaps ;;;
Spritemap_Dachora_0:
    dw $0009
    %spritemapEntry(0, $1F0, $F2, 0, 0, 3, 1, $110)
    %spritemapEntry(1, $43F8, $EA, 0, 0, 3, 1, $101)
    %spritemapEntry(0, $02, $F7, 0, 0, 3, 1, $11E)
    %spritemapEntry(0, $1FA, $F7, 0, 0, 3, 1, $10E)
    %spritemapEntry(0, $1F2, $03, 0, 0, 3, 1, $11F)
    %spritemapEntry(0, $1F2, $FB, 0, 0, 3, 1, $10F)
    %spritemapEntry(0, $1F2, $0F, 0, 0, 3, 1, $122)
    %spritemapEntry(1, $43FA, $07, 0, 0, 3, 1, $113)
    %spritemapEntry(1, $43FA, $FF, 0, 0, 3, 1, $103)

Spritemap_Dachora_1:
    dw $0009
    %spritemapEntry(0, $1EF, $F3, 0, 0, 3, 1, $110)
    %spritemapEntry(1, $43F7, $EB, 0, 0, 3, 1, $101)
    %spritemapEntry(0, $02, $F8, 0, 0, 3, 1, $15F)
    %spritemapEntry(0, $1FA, $F8, 0, 0, 3, 1, $15E)
    %spritemapEntry(0, $1F2, $04, 0, 0, 3, 1, $11F)
    %spritemapEntry(0, $1F2, $FC, 0, 0, 3, 1, $10F)
    %spritemapEntry(1, $43FA, $08, 0, 0, 3, 1, $116)
    %spritemapEntry(0, $1F2, $08, 0, 0, 3, 1, $115)
    %spritemapEntry(1, $43FA, $00, 0, 0, 3, 1, $106)

Spritemap_Dachora_2:
    dw $000B
    %spritemapEntry(0, $1EE, $F1, 0, 0, 3, 1, $110)
    %spritemapEntry(1, $43F6, $E9, 0, 0, 3, 1, $101)
    %spritemapEntry(0, $1EA, $0E, 0, 0, 3, 1, $12D)
    %spritemapEntry(0, $02, $F6, 0, 0, 3, 1, $11E)
    %spritemapEntry(0, $1FA, $F6, 0, 0, 3, 1, $10E)
    %spritemapEntry(0, $1F2, $FA, 0, 0, 3, 1, $10F)
    %spritemapEntry(1, $43FA, $FE, 0, 0, 3, 1, $109)
    %spritemapEntry(1, $43F2, $FE, 0, 0, 3, 1, $108)
    %spritemapEntry(0, $0A, $0E, 0, 0, 3, 1, $12B)
    %spritemapEntry(0, $0A, $06, 0, 0, 3, 1, $11B)
    %spritemapEntry(1, $43F2, $06, 0, 0, 3, 1, $118)

Spritemap_Dachora_3:
    dw $0009
    %spritemapEntry(0, $1F0, $F2, 0, 0, 3, 1, $110)
    %spritemapEntry(1, $43F8, $EA, 0, 0, 3, 1, $101)
    %spritemapEntry(0, $02, $F7, 0, 0, 3, 1, $15F)
    %spritemapEntry(0, $1FA, $F7, 0, 0, 3, 1, $15E)
    %spritemapEntry(0, $1F2, $0F, 0, 0, 3, 1, $152)
    %spritemapEntry(0, $1F2, $03, 0, 0, 3, 1, $11F)
    %spritemapEntry(0, $1F2, $FB, 0, 0, 3, 1, $10F)
    %spritemapEntry(1, $43FA, $07, 0, 0, 3, 1, $143)
    %spritemapEntry(1, $43FA, $FF, 0, 0, 3, 1, $133)

Spritemap_Dachora_4:
    dw $0009
    %spritemapEntry(0, $1EF, $F3, 0, 0, 3, 1, $110)
    %spritemapEntry(1, $43F7, $EB, 0, 0, 3, 1, $101)
    %spritemapEntry(0, $1F4, $10, 0, 0, 3, 1, $152)
    %spritemapEntry(0, $1F2, $04, 0, 0, 3, 1, $11F)
    %spritemapEntry(0, $1F2, $FC, 0, 0, 3, 1, $10F)
    %spritemapEntry(0, $02, $F8, 0, 0, 3, 1, $11E)
    %spritemapEntry(0, $1FA, $F8, 0, 0, 3, 1, $10E)
    %spritemapEntry(1, $43FA, $08, 0, 0, 3, 1, $146)
    %spritemapEntry(1, $43FA, $00, 0, 0, 3, 1, $136)

Spritemap_Dachora_5:
    dw $000B
    %spritemapEntry(0, $1EE, $F1, 0, 0, 3, 1, $110)
    %spritemapEntry(1, $43F6, $E9, 0, 0, 3, 1, $101)
    %spritemapEntry(0, $02, $F6, 0, 0, 3, 1, $15F)
    %spritemapEntry(0, $1FA, $F6, 0, 0, 3, 1, $15E)
    %spritemapEntry(0, $1EA, $0E, 0, 0, 3, 1, $15A)
    %spritemapEntry(0, $1F2, $FA, 0, 0, 3, 1, $10F)
    %spritemapEntry(1, $43FA, $FE, 0, 0, 3, 1, $139)
    %spritemapEntry(1, $43F2, $06, 0, 0, 3, 1, $148)
    %spritemapEntry(0, $0A, $06, 0, 0, 3, 1, $14B)
    %spritemapEntry(0, $0A, $0E, 0, 0, 3, 1, $15B)
    %spritemapEntry(1, $43F2, $FE, 0, 0, 3, 1, $138)

Spritemap_Dachora_6:
    dw $0008
    %spritemapEntry(0, $1F6, $FD, 0, 0, 3, 1, $105)
    %spritemapEntry(0, $1ED, $FD, 0, 0, 3, 1, $110)
    %spritemapEntry(1, $43F5, $F5, 0, 0, 3, 1, $101)
    %spritemapEntry(0, $1F3, $08, 0, 0, 3, 1, $11F)
    %spritemapEntry(0, $1F3, $00, 0, 0, 3, 1, $10F)
    %spritemapEntry(0, $03, $FD, 0, 0, 3, 1, $11E)
    %spritemapEntry(0, $1FB, $FD, 0, 0, 3, 1, $10E)
    %spritemapEntry(1, $43FB, $05, 0, 0, 3, 1, $10C)

Spritemap_Dachora_7:
    dw $000A
    %spritemapEntry(0, $03, $F1, 0, 0, 3, 1, $11E)
    %spritemapEntry(0, $1FB, $F1, 0, 0, 3, 1, $10E)
    %spritemapEntry(0, $1F3, $FD, 0, 0, 3, 1, $11F)
    %spritemapEntry(0, $1F3, $F5, 0, 0, 3, 1, $10F)
    %spritemapEntry(1, $43FB, $F9, 0, 0, 3, 1, $13C)
    %spritemapEntry(0, $1FE, $DF, 1, 1, 3, 1, $141)
    %spritemapEntry(1, $43FE, $E7, 1, 1, 3, 1, $120)
    %spritemapEntry(0, $03, $09, 0, 0, 3, 1, $15D)
    %spritemapEntry(0, $1FB, $09, 0, 0, 3, 1, $150)
    %spritemapEntry(0, $1FB, $11, 0, 0, 3, 1, $125)

Spritemap_Dachora_8:
    dw $0009
    %spritemapEntry(0, $1F0, $F3, 0, 0, 3, 1, $110)
    %spritemapEntry(1, $43F8, $EB, 0, 0, 3, 1, $101)
    %spritemapEntry(0, $1F3, $10, 0, 0, 3, 1, $151)
    %spritemapEntry(0, $03, $F8, 0, 0, 3, 1, $11E)
    %spritemapEntry(0, $1FB, $F8, 0, 0, 3, 1, $10E)
    %spritemapEntry(0, $1F3, $04, 0, 0, 3, 1, $11F)
    %spritemapEntry(0, $1F3, $FC, 0, 0, 3, 1, $10F)
    %spritemapEntry(1, $43FB, $08, 0, 0, 3, 1, $14C)
    %spritemapEntry(1, $43FB, $00, 0, 0, 3, 1, $13C)

Spritemap_Dachora_9:
    dw $000A
    %spritemapEntry(0, $1F9, $F3, 0, 0, 3, 1, $140)
    %spritemapEntry(0, $1F0, $F3, 0, 0, 3, 1, $110)
    %spritemapEntry(1, $43F8, $EB, 0, 0, 3, 1, $101)
    %spritemapEntry(0, $1F3, $10, 0, 0, 3, 1, $151)
    %spritemapEntry(0, $03, $F8, 0, 0, 3, 1, $11E)
    %spritemapEntry(0, $1FB, $F8, 0, 0, 3, 1, $10E)
    %spritemapEntry(0, $1F3, $04, 0, 0, 3, 1, $11F)
    %spritemapEntry(0, $1F3, $FC, 0, 0, 3, 1, $10F)
    %spritemapEntry(1, $43FB, $08, 0, 0, 3, 1, $14C)
    %spritemapEntry(1, $43FB, $00, 0, 0, 3, 1, $13C)

Spritemap_Dachora_A:
    dw $000A
    %spritemapEntry(0, $1F9, $F3, 0, 0, 3, 1, $105)
    %spritemapEntry(0, $1F0, $F3, 0, 0, 3, 1, $110)
    %spritemapEntry(1, $43F8, $EB, 0, 0, 3, 1, $101)
    %spritemapEntry(0, $1F3, $10, 0, 0, 3, 1, $151)
    %spritemapEntry(0, $03, $F8, 0, 0, 3, 1, $11E)
    %spritemapEntry(0, $1FB, $F8, 0, 0, 3, 1, $10E)
    %spritemapEntry(0, $1F3, $04, 0, 0, 3, 1, $11F)
    %spritemapEntry(0, $1F3, $FC, 0, 0, 3, 1, $10F)
    %spritemapEntry(1, $43FB, $08, 0, 0, 3, 1, $14C)
    %spritemapEntry(1, $43FB, $00, 0, 0, 3, 1, $13C)

Spritemap_Dachora_B:
    dw $0009
    %spritemapEntry(0, $1E5, $09, 0, 0, 3, 1, $12A)
    %spritemapEntry(1, $43E3, $F9, 0, 0, 3, 1, $13E)
    %spritemapEntry(0, $03, $F8, 0, 0, 3, 1, $12F)
    %spritemapEntry(0, $1FB, $F8, 0, 0, 3, 1, $12E)
    %spritemapEntry(0, $1F3, $08, 0, 0, 3, 1, $145)
    %spritemapEntry(0, $1F3, $00, 0, 0, 3, 1, $135)
    %spritemapEntry(0, $1F3, $10, 0, 0, 3, 1, $151)
    %spritemapEntry(1, $43FB, $08, 0, 0, 3, 1, $14C)
    %spritemapEntry(1, $43FB, $00, 0, 0, 3, 1, $13C)

Spritemap_Dachora_C:
    dw $0009
    %spritemapEntry(0, $03, $F8, 0, 0, 3, 1, $12F)
    %spritemapEntry(0, $1FB, $F8, 0, 0, 3, 1, $12E)
    %spritemapEntry(0, $1EB, $11, 0, 0, 3, 1, $141)
    %spritemapEntry(1, $43E3, $01, 0, 0, 3, 1, $120)
    %spritemapEntry(0, $1F3, $08, 0, 0, 3, 1, $142)
    %spritemapEntry(0, $1F3, $00, 0, 0, 3, 1, $132)
    %spritemapEntry(0, $1F3, $10, 0, 0, 3, 1, $151)
    %spritemapEntry(1, $43FB, $08, 0, 0, 3, 1, $14C)
    %spritemapEntry(1, $43FB, $00, 0, 0, 3, 1, $13C)

Spritemap_Dachora_D:
    dw $0009
    %spritemapEntry(0, $03, $F8, 0, 0, 3, 1, $12F)
    %spritemapEntry(0, $1FB, $F8, 0, 0, 3, 1, $12E)
    %spritemapEntry(0, $1EB, $12, 0, 0, 3, 1, $141)
    %spritemapEntry(1, $43E3, $02, 0, 0, 3, 1, $120)
    %spritemapEntry(0, $1F3, $08, 0, 0, 3, 1, $142)
    %spritemapEntry(0, $1F3, $00, 0, 0, 3, 1, $132)
    %spritemapEntry(0, $1F3, $10, 0, 0, 3, 1, $151)
    %spritemapEntry(1, $43FB, $08, 0, 0, 3, 1, $14C)
    %spritemapEntry(1, $43FB, $00, 0, 0, 3, 1, $13C)

Spritemap_Dachora_E:
    dw $0009
    %spritemapEntry(0, $03, $F8, 0, 0, 3, 1, $12F)
    %spritemapEntry(0, $1FB, $F8, 0, 0, 3, 1, $12E)
    %spritemapEntry(0, $1EB, $13, 0, 0, 3, 1, $141)
    %spritemapEntry(1, $43E3, $03, 0, 0, 3, 1, $120)
    %spritemapEntry(0, $1F3, $08, 0, 0, 3, 1, $142)
    %spritemapEntry(0, $1F3, $00, 0, 0, 3, 1, $132)
    %spritemapEntry(0, $1F3, $10, 0, 0, 3, 1, $151)
    %spritemapEntry(1, $43FB, $08, 0, 0, 3, 1, $14C)
    %spritemapEntry(1, $43FB, $00, 0, 0, 3, 1, $13C)

Spritemap_Dachora_F:
    dw $0009
    %spritemapEntry(0, $08, $F2, 0, 1, 3, 1, $110)
    %spritemapEntry(1, $43F8, $EA, 0, 1, 3, 1, $101)
    %spritemapEntry(0, $1F6, $F7, 0, 1, 3, 1, $11E)
    %spritemapEntry(0, $1FE, $F7, 0, 1, 3, 1, $10E)
    %spritemapEntry(0, $06, $03, 0, 1, 3, 1, $11F)
    %spritemapEntry(0, $06, $FB, 0, 1, 3, 1, $10F)
    %spritemapEntry(0, $06, $0F, 0, 1, 3, 1, $122)
    %spritemapEntry(1, $43F6, $07, 0, 1, 3, 1, $113)
    %spritemapEntry(1, $43F6, $FF, 0, 1, 3, 1, $103)

Spritemap_Dachora_10:
    dw $0009
    %spritemapEntry(0, $09, $F3, 0, 1, 3, 1, $110)
    %spritemapEntry(1, $43F9, $EB, 0, 1, 3, 1, $101)
    %spritemapEntry(0, $1F6, $F8, 0, 1, 3, 1, $15F)
    %spritemapEntry(0, $1FE, $F8, 0, 1, 3, 1, $15E)
    %spritemapEntry(0, $06, $04, 0, 1, 3, 1, $11F)
    %spritemapEntry(0, $06, $FC, 0, 1, 3, 1, $10F)
    %spritemapEntry(1, $43F6, $08, 0, 1, 3, 1, $116)
    %spritemapEntry(0, $06, $08, 0, 1, 3, 1, $115)
    %spritemapEntry(1, $43F6, $00, 0, 1, 3, 1, $106)

Spritemap_Dachora_11:
    dw $000B
    %spritemapEntry(0, $0A, $F1, 0, 1, 3, 1, $110)
    %spritemapEntry(1, $43FA, $E9, 0, 1, 3, 1, $101)
    %spritemapEntry(0, $0E, $0E, 0, 1, 3, 1, $12D)
    %spritemapEntry(0, $1F6, $F6, 0, 1, 3, 1, $11E)
    %spritemapEntry(0, $1FE, $F6, 0, 1, 3, 1, $10E)
    %spritemapEntry(0, $06, $FA, 0, 1, 3, 1, $10F)
    %spritemapEntry(1, $43F6, $FE, 0, 1, 3, 1, $109)
    %spritemapEntry(1, $43FE, $FE, 0, 1, 3, 1, $108)
    %spritemapEntry(0, $1EE, $0E, 0, 1, 3, 1, $12B)
    %spritemapEntry(0, $1EE, $06, 0, 1, 3, 1, $11B)
    %spritemapEntry(1, $43FE, $06, 0, 1, 3, 1, $118)

Spritemap_Dachora_12:
    dw $0009
    %spritemapEntry(0, $08, $F2, 0, 1, 3, 1, $110)
    %spritemapEntry(1, $43F8, $EA, 0, 1, 3, 1, $101)
    %spritemapEntry(0, $1F6, $F7, 0, 1, 3, 1, $15F)
    %spritemapEntry(0, $1FE, $F7, 0, 1, 3, 1, $15E)
    %spritemapEntry(0, $06, $0F, 0, 1, 3, 1, $152)
    %spritemapEntry(0, $06, $03, 0, 1, 3, 1, $11F)
    %spritemapEntry(0, $06, $FB, 0, 1, 3, 1, $10F)
    %spritemapEntry(1, $43F6, $07, 0, 1, 3, 1, $143)
    %spritemapEntry(1, $43F6, $FF, 0, 1, 3, 1, $133)

Spritemap_Dachora_13:
    dw $0009
    %spritemapEntry(0, $09, $F3, 0, 1, 3, 1, $110)
    %spritemapEntry(1, $43F9, $EB, 0, 1, 3, 1, $101)
    %spritemapEntry(0, $04, $10, 0, 1, 3, 1, $152)
    %spritemapEntry(0, $06, $04, 0, 1, 3, 1, $11F)
    %spritemapEntry(0, $06, $FC, 0, 1, 3, 1, $10F)
    %spritemapEntry(0, $1F6, $F8, 0, 1, 3, 1, $11E)
    %spritemapEntry(0, $1FE, $F8, 0, 1, 3, 1, $10E)
    %spritemapEntry(1, $43F6, $08, 0, 1, 3, 1, $146)
    %spritemapEntry(1, $43F6, $00, 0, 1, 3, 1, $136)

Spritemap_Dachora_14:
    dw $000B
    %spritemapEntry(0, $0A, $F1, 0, 1, 3, 1, $110)
    %spritemapEntry(1, $43FA, $E9, 0, 1, 3, 1, $101)
    %spritemapEntry(0, $1F6, $F6, 0, 1, 3, 1, $15F)
    %spritemapEntry(0, $1FE, $F6, 0, 1, 3, 1, $15E)
    %spritemapEntry(0, $0E, $0E, 0, 1, 3, 1, $15A)
    %spritemapEntry(0, $06, $FA, 0, 1, 3, 1, $10F)
    %spritemapEntry(1, $43F6, $FE, 0, 1, 3, 1, $139)
    %spritemapEntry(1, $43FE, $06, 0, 1, 3, 1, $148)
    %spritemapEntry(0, $1EE, $06, 0, 1, 3, 1, $14B)
    %spritemapEntry(0, $1EE, $0E, 0, 1, 3, 1, $15B)
    %spritemapEntry(1, $43FE, $FE, 0, 1, 3, 1, $138)

Spritemap_Dachora_15:
    dw $0008
    %spritemapEntry(0, $02, $FD, 0, 1, 3, 1, $105)
    %spritemapEntry(0, $0B, $FD, 0, 1, 3, 1, $110)
    %spritemapEntry(1, $43FB, $F5, 0, 1, 3, 1, $101)
    %spritemapEntry(0, $05, $08, 0, 1, 3, 1, $11F)
    %spritemapEntry(0, $05, $00, 0, 1, 3, 1, $10F)
    %spritemapEntry(0, $1F5, $FD, 0, 1, 3, 1, $11E)
    %spritemapEntry(0, $1FD, $FD, 0, 1, 3, 1, $10E)
    %spritemapEntry(1, $43F5, $05, 0, 1, 3, 1, $10C)

Spritemap_Dachora_16:
    dw $000A
    %spritemapEntry(0, $1F5, $F1, 0, 1, 3, 1, $11E)
    %spritemapEntry(0, $1FD, $F1, 0, 1, 3, 1, $10E)
    %spritemapEntry(0, $05, $FD, 0, 1, 3, 1, $11F)
    %spritemapEntry(0, $05, $F5, 0, 1, 3, 1, $10F)
    %spritemapEntry(1, $43F5, $F9, 0, 1, 3, 1, $13C)
    %spritemapEntry(0, $1FA, $DF, 1, 0, 3, 1, $141)
    %spritemapEntry(1, $43F2, $E7, 1, 0, 3, 1, $120)
    %spritemapEntry(0, $1F5, $09, 0, 1, 3, 1, $15D)
    %spritemapEntry(0, $1FD, $09, 0, 1, 3, 1, $150)
    %spritemapEntry(0, $1FD, $11, 0, 1, 3, 1, $125)

Spritemap_Dachora_17:
    dw $0009
    %spritemapEntry(0, $08, $F3, 0, 1, 3, 1, $110)
    %spritemapEntry(1, $43F8, $EB, 0, 1, 3, 1, $101)
    %spritemapEntry(0, $05, $10, 0, 1, 3, 1, $151)
    %spritemapEntry(0, $1F5, $F8, 0, 1, 3, 1, $11E)
    %spritemapEntry(0, $1FD, $F8, 0, 1, 3, 1, $10E)
    %spritemapEntry(0, $05, $04, 0, 1, 3, 1, $11F)
    %spritemapEntry(0, $05, $FC, 0, 1, 3, 1, $10F)
    %spritemapEntry(1, $43F5, $08, 0, 1, 3, 1, $14C)
    %spritemapEntry(1, $43F5, $00, 0, 1, 3, 1, $13C)

Spritemap_Dachora_18:
    dw $000A
    %spritemapEntry(0, $1FF, $F3, 0, 1, 3, 1, $140)
    %spritemapEntry(0, $08, $F3, 0, 1, 3, 1, $110)
    %spritemapEntry(1, $43F8, $EB, 0, 1, 3, 1, $101)
    %spritemapEntry(0, $05, $10, 0, 1, 3, 1, $151)
    %spritemapEntry(0, $1F5, $F8, 0, 1, 3, 1, $11E)
    %spritemapEntry(0, $1FD, $F8, 0, 1, 3, 1, $10E)
    %spritemapEntry(0, $05, $04, 0, 1, 3, 1, $11F)
    %spritemapEntry(0, $05, $FC, 0, 1, 3, 1, $10F)
    %spritemapEntry(1, $43F5, $08, 0, 1, 3, 1, $14C)
    %spritemapEntry(1, $43F5, $00, 0, 1, 3, 1, $13C)

Spritemap_Dachora_19:
    dw $000A
    %spritemapEntry(0, $1FF, $F3, 0, 1, 3, 1, $105)
    %spritemapEntry(0, $08, $F3, 0, 1, 3, 1, $110)
    %spritemapEntry(1, $43F8, $EB, 0, 1, 3, 1, $101)
    %spritemapEntry(0, $05, $10, 0, 1, 3, 1, $151)
    %spritemapEntry(0, $1F5, $F8, 0, 1, 3, 1, $11E)
    %spritemapEntry(0, $1FD, $F8, 0, 1, 3, 1, $10E)
    %spritemapEntry(0, $05, $04, 0, 1, 3, 1, $11F)
    %spritemapEntry(0, $05, $FC, 0, 1, 3, 1, $10F)
    %spritemapEntry(1, $43F5, $08, 0, 1, 3, 1, $14C)
    %spritemapEntry(1, $43F5, $00, 0, 1, 3, 1, $13C)

Spritemap_Dachora_1A:
    dw $0009
    %spritemapEntry(0, $13, $09, 0, 1, 3, 1, $12A)
    %spritemapEntry(1, $420D, $F9, 0, 1, 3, 1, $13E)
    %spritemapEntry(0, $1F5, $F8, 0, 1, 3, 1, $12F)
    %spritemapEntry(0, $1FD, $F8, 0, 1, 3, 1, $12E)
    %spritemapEntry(0, $05, $08, 0, 1, 3, 1, $145)
    %spritemapEntry(0, $05, $00, 0, 1, 3, 1, $135)
    %spritemapEntry(0, $05, $10, 0, 1, 3, 1, $151)
    %spritemapEntry(1, $43F5, $08, 0, 1, 3, 1, $14C)
    %spritemapEntry(1, $43F5, $00, 0, 1, 3, 1, $13C)

Spritemap_Dachora_1B:
    dw $0009
    %spritemapEntry(0, $1F5, $F8, 0, 1, 3, 1, $12F)
    %spritemapEntry(0, $1FD, $F8, 0, 1, 3, 1, $12E)
    %spritemapEntry(0, $0D, $11, 0, 1, 3, 1, $141)
    %spritemapEntry(1, $420D, $01, 0, 1, 3, 1, $120)
    %spritemapEntry(0, $05, $08, 0, 1, 3, 1, $142)
    %spritemapEntry(0, $05, $00, 0, 1, 3, 1, $132)
    %spritemapEntry(0, $05, $10, 0, 1, 3, 1, $151)
    %spritemapEntry(1, $43F5, $08, 0, 1, 3, 1, $14C)
    %spritemapEntry(1, $43F5, $00, 0, 1, 3, 1, $13C)

Spritemap_Dachora_1C:
    dw $0009
    %spritemapEntry(0, $1F5, $F8, 0, 1, 3, 1, $12F)
    %spritemapEntry(0, $1FD, $F8, 0, 1, 3, 1, $12E)
    %spritemapEntry(0, $0D, $12, 0, 1, 3, 1, $141)
    %spritemapEntry(1, $420D, $02, 0, 1, 3, 1, $120)
    %spritemapEntry(0, $05, $08, 0, 1, 3, 1, $142)
    %spritemapEntry(0, $05, $00, 0, 1, 3, 1, $132)
    %spritemapEntry(0, $05, $10, 0, 1, 3, 1, $151)
    %spritemapEntry(1, $43F5, $08, 0, 1, 3, 1, $14C)
    %spritemapEntry(1, $43F5, $00, 0, 1, 3, 1, $13C)

Spritemap_Dachora_1D:
    dw $0009
    %spritemapEntry(0, $1F5, $F8, 0, 1, 3, 1, $12F)
    %spritemapEntry(0, $1FD, $F8, 0, 1, 3, 1, $12E)
    %spritemapEntry(0, $0D, $13, 0, 1, 3, 1, $141)
    %spritemapEntry(1, $420D, $03, 0, 1, 3, 1, $120)
    %spritemapEntry(0, $05, $08, 0, 1, 3, 1, $142)
    %spritemapEntry(0, $05, $00, 0, 1, 3, 1, $132)
    %spritemapEntry(0, $05, $10, 0, 1, 3, 1, $151)
    %spritemapEntry(1, $43F5, $08, 0, 1, 3, 1, $14C)
    %spritemapEntry(1, $43F5, $00, 0, 1, 3, 1, $13C)


Freespace_BankA7_FF82:
; $7E bytes
