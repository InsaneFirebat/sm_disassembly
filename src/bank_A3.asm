
org $A38000


; Common to all enemy code banks

;;; $8000: Grapple AI - no interaction. Also unfreezes enemies(!) ;;;
CommonA3_GrappleAI_NoInteraction:
; Used by skultera, Draygon body, fire arc, Phantoon, etecoon, dachora and WS ghost
    JSL GrappleAI_SwitchEnemyAIToMainAI
    RTL


;;; $8005: Grapple AI - Samus latches on ;;;
CommonA3_GrappleAI_SamusLatchesOn:
; Used by gripper and Crocomire
    JSL GrappleAI_SamusLatchesOnWithGrapple
    RTL


;;; $800A: Grapple AI - kill enemy ;;;
CommonA3_GrappleAI_KillEnemy:
; Common
    JSL GrappleAI_EnemyGrappleDeath
    RTL


;;; $800F: Grapple AI - cancel grapple beam ;;;
CommonA3_GrappleAI_CancelGrappleBeam:
; Common
    JSL GrappleAI_SwitchToFrozenAI
    RTL


;;; $8014: Grapple AI - Samus latches on - no invincibility ;;;
CommonA3_GrappleAI_SamusLatchesOn_NoInvincibility:
; Used by powamp
    JSL GrappleAI_SamusLatchesOnWithGrapple_NoInvincibility
    RTL


;;; $8019: Unused. Grapple AI - Samus latches on - paralyse enemy ;;;
UNUSED_CommonA3_GrappleAI_SamusLatchesOn_ParalyzeEnemy_A38019:
    JSL GrappleAI_SamusLatchesOnWithGrapple_ParalyzeEnemy
    RTL


;;; $801E: Grapple AI - hurt Samus ;;;
CommonA3_GrappleAI_HurtSamus:
; Used by WS spark
; Hurt reaction happens in $9B:B932
    JSL GrappleAI_SwitchToFrozenAI_duplicate
    RTL


;;; $8023: Normal enemy touch AI ;;;
CommonA3_NormalEnemyTouchAI:
    JSL NormalEnemyTouchAI
    RTL


;;; $8028: Normal touch AI - no death check ;;;
CommonA3_NormalTouchAI_NoDeathCheck:
    JSL NormalEnemyTouchAI_NoDeathCheck_External
    RTL


;;; $802D: Normal enemy shot AI ;;;
CommonA3_NormalEnemyShotAI:
    JSL NormalEnemyShotAI
    RTL


;;; $8032: Normal enemy shot AI - no death check, no enemy shot graphic ;;;
CommonA3_NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic:
    JSL NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External
    RTL


;;; $8037: Normal enemy power bomb AI ;;;
CommonA3_NormalEnemyPowerBombAI:
    JSL NormalEnemyPowerBombAI
    RTL


;;; $803C: Normal enemy power bomb AI - no death check ;;;
CommonA3_NormalEnemyPowerBombAI_NoDeathCheck:
; Kraid's power bomb AI
    JSL NormalEnemyPowerBombAI_NoDeathCheck_External
    RTL


;;; $8041: Normal enemy frozen AI ;;;
CommonA3_NormalEnemyFrozenAI:
    JSL NormalEnemyFrozenAI
    RTL


;;; $8046: Creates a dud shot ;;;
CommonA3_CreateADudShot:
    JSL CreateADudShot
    RTL


;;; $804B: RTS ;;;
RTS_A3804B:
    RTS


;;; $804C: RTL ;;;
RTL_A3804C:
    RTL


;;; $804D: Spritemap - nothing ;;;
Spritemap_CommonA3_Nothing:
    dw $0000


;;; $804F: Extended spritemap - nothing ;;;
ExtendedSpritemap_CommonA3_Nothing:
    dw $0001
    dw $0000,$0000
    dw Spritemap_CommonA3_Nothing
    dw Hitbox_CommonA3_Nothing


;;; $8059: Hitbox - nothing ;;;
Hitbox_CommonA3_Nothing:
; [n entries] [[left offset] [top offset] [right offset] [bottom offset] [p touch] [p shot]]...
    dw $0001
    dw $0000,$0000,$0000,$0000
    dw CommonA3_NormalEnemyTouchAI
    dw CommonA3_NormalEnemyShotAI


;;; $8067: Instruction list - delete enemy ;;;
InstList_CommonA3_DeleteEnemy:
    dw Instruction_CommonA3_DeleteEnemy


;;; $8069: Two NOPs ;;;
NOPNOP_A38069:
; Used as palette by respawning enemy placeholder and Draygon's eye o_O
    NOP #2


;;; $806B: Instruction - Enemy.var5 = [[Y]] ;;;
Instruction_CommonA3_Enemy0FB2_InY:
; Used only by torizos (for enemy movement function) and escape etecoon (for enemy function)
    LDA.W $0000,Y : STA.W Enemy.var5,X
    INY #2
    RTL


;;; $8074: Instruction - Enemy.var5 = RTS ;;;
Instruction_CommonA3_SetEnemy0FB2ToRTS:
    LDA.W #RTS_A3807B : STA.W Enemy.var5,X
    RTL


RTS_A3807B:
    RTS


;;; $807C: Instruction - delete enemy ;;;
Instruction_CommonA3_DeleteEnemy:
    LDA.W Enemy.properties,X : ORA.W #$0200 : STA.W Enemy.properties,X
    PLA
    PEA.W ProcessEnemyInstructions_return-1
    RTL


;;; $808A: Instruction - call function [[Y]] ;;;
Instruction_CommonA3_CallFunctionInY:
    LDA.W $0000,Y : STA.B DP_Temp12
    PHY : PHX
    PEA .manualReturn-1
    JMP.W (DP_Temp12)

  .manualReturn:
    PLX : PLY
    INY #2
    RTL


;;; $809C: Instruction - call function [[Y]] with A = [[Y] + 2] ;;;
Instruction_CommonA3_CallFunctionInY_WithA:
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
UNUSED_Instruction_CommonA3_CallExternalFunctionInY_A380B5:
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
UNUSED_Inst_CommonA3_CallExternalFunctionInY_WithA_A380CE:
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
Instruction_CommonA3_GotoY:
    LDA.W $0000,Y : TAY
    RTL


;;; $80F2: Instruction - go to [[Y]] + ±[[Y]] ;;;
Instruction_CommonA3_GotoY_PlusY:
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
Instruction_CommonA3_DecrementTimer_GotoYIfNonZero:
    DEC.W Enemy.loopCounter,X : BNE Instruction_CommonA3_GotoY
    INY #2
    RTL


;;; $8110: Instruction - decrement timer and go to [[Y]] if non-zero ;;;
Instruction_CommonA3_DecrementTimer_GotoYIfNonZero_duplicate:
    DEC.W Enemy.loopCounter,X : BNE Instruction_CommonA3_GotoY
    INY #2
    RTL


;;; $8118: Instruction - decrement timer and go to [Y] + ±[[Y]] if non-zero ;;;
Instruction_CommonA3_DecrementTimer_GotoY_PlusY_IfNonZero:
    SEP #$20
    DEC.W Enemy.loopCounter,X
    REP #$20
    BNE Instruction_CommonA3_GotoY_PlusY
    INY
    RTL


;;; $8123: Instruction - timer = [[Y]] ;;;
Instruction_CommonA3_TimerInY:
    LDA.W $0000,Y : STA.W Enemy.loopCounter,X
    INY #2
    RTL


;;; $812C: Instruction - skip next instruction ;;;
Instruction_CommonA3_SkipNextInstruction:
    INY #2
    RTL


;;; $812F: Instruction - sleep ;;;
Instruction_CommonA3_Sleep:
    DEY #2
    TYA : STA.W Enemy.instList,X
    PLA
    PEA.W ProcessEnemyInstructions_return-1
    RTL


;;; $813A: Instruction - wait [[Y]] frames ;;;
Instruction_CommonA3_WaitYFrames:
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
Instruction_CommonA3_TransferYBytesInYToVRAM:
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
Instruction_CommonA3_EnableOffScreenProcessing:
    LDA.W Enemy.properties,X : ORA.W #$0800 : STA.W Enemy.properties,X
    RTL


;;; $817D: Instruction - disable off-screen processing ;;;
Instruction_CommonA3_DisableOffScreenProcessing:
    LDA.W Enemy.properties,X : AND.W #$F7FF : STA.W Enemy.properties,X
    RTL


;;; $8187: Common enemy speeds - linearly increasing ;;;
CommonA3EnemySpeeds_LinearlyIncreasing:
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
CommonA3EnemySpeeds_QuadraticallyIncreasing:
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


;;; $8687: Palette - enemy $D63F (waver) ;;;
Palette_Waver:
    dw $3800,$72FA,$55B0,$2845,$1801,$6210,$496B,$38C6
    dw $2C63,$241F,$1C17,$142F,$0C47,$3BE0,$2680,$1580


;;; $86A7: Instruction list - steady - facing left ;;;
InstList_Waver_Steady_FacingLeft:
    dw $0001,Spritemap_Waver_2
    dw Instruction_Common_Sleep


;;; $86AD: Instruction list - steady - facing right ;;;
InstList_Waver_Steady_FacingRight:
    dw $0001,Spritemap_Waver_7
    dw Instruction_Common_Sleep


;;; $86B3: Instruction list - spinning - facing left ;;;
InstList_Waver_Spinning_FacingLeft:
    dw $0008,Spritemap_Waver_3
    dw $0008,Spritemap_Waver_4
    dw $0008,Spritemap_Waver_0
    dw $0008,Spritemap_Waver_1
    dw Instruction_Waver_SetSpinFinishedFlag
    dw Instruction_Common_Sleep


;;; $86C7: Instruction list - spinning - facing right ;;;
InstList_Waver_Spinning_FacingRight:
    dw $0008,Spritemap_Waver_8
    dw $0008,Spritemap_Waver_9
    dw $0008,Spritemap_Waver_5
    dw $0008,Spritemap_Waver_6
    dw Instruction_Waver_SetSpinFinishedFlag
    dw Instruction_Common_Sleep


;;; $86DB: Instruction list pointers ;;;
InstListPointers_Waver:
; Indexed by Waver.instListIndex
    dw InstList_Waver_Steady_FacingLeft
    dw InstList_Waver_Steady_FacingRight
    dw InstList_Waver_Spinning_FacingLeft
    dw InstList_Waver_Spinning_FacingRight


;;; $86E3: Instruction - set spin finished flag ;;;
Instruction_Waver_SetSpinFinishedFlag:
    LDX.W EnemyIndex
    LDA.W #$0001 : STA.W Waver.spinFinishedFlag,X
    RTL


;;; $86ED: Initialisation AI - enemy $D63F (waver) ;;;
InitAI_Waver:
    LDX.W EnemyIndex
    LDA.W #$0180 : AND.W #$FF00 : XBA : STA.W Waver.XVelocity,X
    LDA.W #$0180 : AND.W #$00FF : XBA : STA.W Waver.XSubVelocity,X
    LDA.W Enemy.init0,X : AND.W #$0001 : BNE .facingLeft
    LDA.W #$0180 : EOR.W #$FFFF : INC : AND.W #$FF00 : XBA
    JSL Sign_Extend_A
    STA.W Waver.XVelocity,X
    LDA.W #$0180 : EOR.W #$FFFF : INC : AND.W #$00FF : XBA
    JSL Sign_Extend_A
    STA.W Waver.XSubVelocity,X

  .facingLeft:
    STZ.W Waver.newInstListIndex,X : STZ.W Waver.instListIndex,X
    STZ.W Waver.spinFinishedFlag,X
    LDA.W #InstList_Waver_Steady_FacingLeft : STA.W Enemy.instList,X
    LDA.W Enemy.init0,X : AND.W #$0001 : STA.W Waver.newInstListIndex,X
    JSR SetWaverInstList
    RTL


;;; $874C: Main AI - enemy $D63F (waver) ;;;
MainAI_Waver:
    LDX.W EnemyIndex
    LDA.W Waver.XSubVelocity,X : STA.B DP_Temp12
    LDA.W Waver.XVelocity,X : STA.B DP_Temp14
    JSL MoveEnemyRightBy_14_12_IgnoreSlopes
    BCC .noWallCollision
    LDA.W Enemy.var0+1,X : STA.B DP_Temp12
    EOR.W #$FFFF : INC : AND.W #$FF00 : XBA
    JSL Sign_Extend_A
    STA.W Waver.XVelocity,X
    LDA.B DP_Temp12 : EOR.W #$FFFF : INC : AND.W #$00FF : XBA
    JSL Sign_Extend_A
    STA.W Waver.XSubVelocity,X
    LDA.W Waver.newInstListIndex,X : EOR.W #$0001 : AND.W #$0001 : STA.W Waver.newInstListIndex,X
    JSR SetWaverInstList
    JMP .merge

  .noWallCollision:
    LDA.W #$0004 : STA.W Temp_Unknown0E32
    LDA.W Waver.angle,X : AND.W #$00FF
    JSL EightBitNegativeSineMultiplication_A0B0C6
    STA.B DP_Temp14
    STZ.B DP_Temp12
    JSL MoveEnemyDownBy_14_12
    BCC .noBlockCollision
    LDX.W EnemyIndex
    LDA.W Waver.angle,X : CLC : ADC.W #$0080 : AND.W #$00FF : STA.W Waver.angle,X
    BRA .merge

  .noBlockCollision:
    LDX.W EnemyIndex
    LDA.W Waver.angle,X : CLC : ADC.W #$0002 : STA.W Waver.angle,X

  .merge:
    LDX.W EnemyIndex
    LDA.W Waver.angle,X : AND.W #$007F : CMP.W #$0038 : BNE .notSpinning
    LDA.W Waver.newInstListIndex,X : ORA.W #$0002 : STA.W Waver.newInstListIndex,X
    JSR SetWaverInstList

  .notSpinning:
    LDA.W Waver.spinFinishedFlag,X : BEQ .return
    STZ.W Waver.spinFinishedFlag,X
    LDA.W Waver.newInstListIndex,X : AND.W #$0001 : STA.W Waver.newInstListIndex,X
    JSR SetWaverInstList

  .return:
    RTL


;;; $87FE: Set waver instruction list ;;;
SetWaverInstList:
    LDX.W EnemyIndex
    LDA.W Waver.newInstListIndex,X : CMP.W Waver.instListIndex,X : BEQ .return
    STA.W Waver.instListIndex,X
    ASL : TAY
    LDA.W InstListPointers_Waver,Y : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X

  .return:
    RTS


;;; $881E: Spritemaps - waver ;;;
Spritemap_Waver_0:
    dw $0004
    %spritemapEntry(0, $00, $08, 0, 0, 2, 0, $122)
    %spritemapEntry(0, $1F8, $08, 0, 0, 2, 0, $121)
    %spritemapEntry(1, $00, $F8, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F0, $F8, 0, 0, 2, 0, $100)

Spritemap_Waver_1:
    dw $0004
    %spritemapEntry(0, $1ED, $FC, 0, 0, 2, 0, $124)
    %spritemapEntry(0, $05, $00, 0, 0, 2, 0, $116)
    %spritemapEntry(0, $05, $F8, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $1F5, $F8, 0, 0, 2, 0, $104)

Spritemap_Waver_2:
    dw $0003
    %spritemapEntry(0, $1ED, $FD, 0, 0, 2, 0, $126)
    %spritemapEntry(0, $1F5, $FD, 0, 0, 2, 0, $127)
    %spritemapEntry(1, $1FD, $F8, 0, 0, 2, 0, $107)

Spritemap_Waver_3:
    dw $0004
    %spritemapEntry(0, $1EC, $FC, 0, 0, 2, 0, $129)
    %spritemapEntry(0, $04, $00, 0, 0, 2, 0, $11B)
    %spritemapEntry(0, $04, $F8, 0, 0, 2, 0, $10B)
    %spritemapEntry(1, $1F4, $F8, 0, 0, 2, 0, $109)

Spritemap_Waver_4:
    dw $0004
    %spritemapEntry(0, $00, $08, 0, 0, 2, 0, $12E)
    %spritemapEntry(0, $1F8, $08, 0, 0, 2, 0, $12D)
    %spritemapEntry(1, $00, $F8, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $1F0, $F8, 0, 0, 2, 0, $10C)

Spritemap_Waver_5:
    dw $0004
    %spritemapEntry(0, $1F8, $08, 0, 1, 2, 0, $122)
    %spritemapEntry(0, $00, $08, 0, 1, 2, 0, $121)
    %spritemapEntry(1, $1F0, $F8, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $00, $F8, 0, 1, 2, 0, $100)

Spritemap_Waver_6:
    dw $0004
    %spritemapEntry(0, $0B, $FC, 0, 1, 2, 0, $124)
    %spritemapEntry(0, $1F3, $00, 0, 1, 2, 0, $116)
    %spritemapEntry(0, $1F3, $F8, 0, 1, 2, 0, $106)
    %spritemapEntry(1, $1FB, $F8, 0, 1, 2, 0, $104)

Spritemap_Waver_7:
    dw $0003
    %spritemapEntry(0, $0B, $FD, 0, 1, 2, 0, $126)
    %spritemapEntry(0, $03, $FD, 0, 1, 2, 0, $127)
    %spritemapEntry(1, $1F3, $F8, 0, 1, 2, 0, $107)

Spritemap_Waver_8:
    dw $0004
    %spritemapEntry(0, $0C, $FC, 0, 1, 2, 0, $129)
    %spritemapEntry(0, $1F4, $00, 0, 1, 2, 0, $11B)
    %spritemapEntry(0, $1F4, $F8, 0, 1, 2, 0, $10B)
    %spritemapEntry(1, $1FC, $F8, 0, 1, 2, 0, $109)

Spritemap_Waver_9:
    dw $0004
    %spritemapEntry(0, $1F8, $08, 0, 1, 2, 0, $12E)
    %spritemapEntry(0, $00, $08, 0, 1, 2, 0, $12D)
    %spritemapEntry(1, $1F0, $F8, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $00, $F8, 0, 1, 2, 0, $10C)


;;; $88F0: Palette - enemy $D67F (metaree) ;;;
Palette_Metaree:
    dw $3800,$4D1F,$38B6,$246E,$1448,$47FF,$2EFA,$1616
    dw $0132,$6F39,$5A73,$41AD,$2D08,$1863,$7FFF,$0041


;;; $8910: Instruction list - idling ;;;
InstList_Metaree_Idling:
    dw $000A,Spritemap_Metaree_0
    dw $000A,Spritemap_Metaree_2
    dw $000A,Spritemap_Metaree_3
    dw $000A,Spritemap_Metaree_4
    dw Instruction_Common_GotoY
    dw InstList_Metaree_Idling


;;; $8924: Instruction list - prepare to launch attack ;;;
InstList_Metaree_PrepareToLaunchAttack:
    dw $0010,Spritemap_Metaree_0
    dw $0008,Spritemap_Metaree_1
    dw Instruction_Metaree_SetAttackReadyFlag
    dw Instruction_Common_Sleep


;;; $8930: Instruction list - launched attack ;;;
InstList_Metaree_LaunchedAttack_0:
    dw Instruction_Common_EnableOffScreenProcessing

InstList_Metaree_LaunchedAttack_1:
    dw $0002,Spritemap_Metaree_2
    dw $0002,Spritemap_Metaree_3
    dw $0002,Spritemap_Metaree_4
    dw $0002,Spritemap_Metaree_0
    dw Instruction_Common_GotoY
    dw InstList_Metaree_LaunchedAttack_1


;;; $8946: Unused. Instruction list - stop animating ;;;
UNUSED_InstList_Metaree_StopAnimating_A38946:
    dw Instruction_Common_DisableOffScreenProcessing
    dw $0001,Spritemap_Metaree_0
    dw Instruction_Common_Sleep


;;; $894E: Metaree instruction list pointers ;;;
InstListPointers_Metaree:
; Indexed by Metaree.instListIndex
    dw InstList_Metaree_Idling
    dw InstList_Metaree_PrepareToLaunchAttack
    dw InstList_Metaree_LaunchedAttack_0
    dw UNUSED_InstList_Metaree_StopAnimating_A38946


;;; $8956: Instruction - set attack ready flag ;;;
Instruction_Metaree_SetAttackReadyFlag:
    LDX.W EnemyIndex
    LDA.W #$0001 : STA.W Enemy.var4,X
    RTL


;;; $8960: Initialisation AI - enemy $D67F (metaree) ;;;
InitAI_Metaree:
    LDX.W EnemyIndex
    STZ.W Metaree.newInstListIndex,X : STZ.W Metaree.instListIndex,X
    STZ.W Enemy.var4,X
    LDA.W #InstList_Metaree_Idling : STA.W Enemy.instList,X
    LDA.W #Function_Metaree_Idling : STA.W Metaree.function,X
    RTL


;;; $8979: Main AI - enemy $D67F (metaree) ;;;
MainAI_Metaree:
    LDX.W EnemyIndex
    JMP.W (Metaree.function,X)


if !FEATURE_KEEP_UNREFERENCED
;;; $897F: Unused. Metaree function pointers ;;;
UNUSED_FunctionPointers_Metaree_A3897F:
    dw Function_Metaree_Idling
    dw Function_Metaree_PrepareToLaunchAttack
    dw Function_Metaree_LaunchedAttack
    dw Function_Metaree_Burrowing
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $8987: Metaree function - idling ;;;
Function_Metaree_Idling:
; BUG: This routine fails to check if the metaree is above Samus before activating it
;      Aside from launching the metaree when it arguably shouldn't, this causes the metaree to shoot off-screen / burrow in mid-air (see DetermineMetareeYVelocity)
    LDX.W EnemyIndex
    LDA.W Enemy.XPosition,X : SEC : SBC.W SamusXPosition : BPL +
    EOR.W #$FFFF : INC

+   CMP.W #$0048 : BCS .return
    JSR DetermineMetareeYVelocity
    INC.W Metaree.newInstListIndex,X
    JSR SetMetareeInstListPointer
    LDA.W #Function_Metaree_PrepareToLaunchAttack : STA.W Metaree.function,X

  .return:
    RTL


;;; $89AC: Determine metaree Y velocity ;;;
DetermineMetareeYVelocity:
; This subroutine assumes SamusYPosition >= Enemy.YPosition
; If this is not the case, then due to the unsigned nature of division,
; the resulting enemy velocity will be some large value (~AAh) that makes the metaree shoot off-screen in an instant and/or hit the ground from many tiles away
    LDA.W SamusYPosition : SEC : SBC.W Enemy.YPosition,X : STA.W $4204
    SEP #$20
    LDA.B #$18 : STA.W $4206
    REP #$20
    NOP #7
    LDA.W $4214 : AND.W #$00FF : CLC : ADC.W #$0004 : STA.W Metaree.YVelocity,X
    RTS


;;; $89D4: Metaree function - prepare to launch attack ;;;
Function_Metaree_PrepareToLaunchAttack:
    LDA.W Metaree.attackReadyFlag,X : BEQ .return
    STZ.W Metaree.attackReadyFlag,X
    LDX.W EnemyIndex
    INC.W Metaree.newInstListIndex,X
    JSR SetMetareeInstListPointer
    LDA.W #Function_Metaree_LaunchedAttack : STA.W Metaree.function,X
    LDA.W #$005B
    JSL QueueSound_Lib2_Max6

  .return:
    RTL


;;; $89F3: Metaree function - launched attack ;;;
Function_Metaree_LaunchedAttack:
    LDX.W EnemyIndex
    LDA.W #$0015 : STA.W Metaree.burrowTimer,X
    LDA.W Metaree.YVelocity,X : STA.B DP_Temp14
    STZ.B DP_Temp12
    LDA.W Enemy.properties,X : ORA.W #$0003 : STA.W Enemy.properties,X
    LDX.W EnemyIndex ; >.<
    JSL CheckForVerticalSolidBlockCollision_SkreeMetaree
    BCS .collision
    LDX.W EnemyIndex
    LDA.W Enemy.YPosition,X : CLC : ADC.W Metaree.YVelocity,X : STA.W Enemy.YPosition,X
    LDA.W #$0002 : STA.W Temp_XVelocity
    LDA.W Enemy.XPosition,X : CMP.W SamusXPosition : BMI .steerLeft
    LDA.W #$FFFE : STA.W Temp_XVelocity

  .steerLeft:
    LDA.W Enemy.XPosition,X : CLC : ADC.W Temp_XVelocity : STA.W Enemy.XPosition,X
    BRA .return

  .collision:
    LDX.W EnemyIndex
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    LDA.W #Function_Metaree_Burrowing : STA.W Metaree.function,X
    LDA.W #$005C
    JSL QueueSound_Lib2_Max6

  .return:
    RTL


;;; $8A5C: Metaree function - burrowing ;;;
Function_Metaree_Burrowing:
; I have no idea why .delete does any of those three assignments
    LDX.W EnemyIndex
    DEC.W Metaree.burrowTimer,X : BEQ .delete
    LDA.W Metaree.burrowTimer,X : CMP.W #$0008 : BNE .timerNot8
    LDX.W EnemyIndex ; >.<
    LDY.W #EnemyProjectile_MetalSkreeParticles_DownRight
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    LDY.W #EnemyProjectile_MetalSkreeParticles_UpRight
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    LDY.W #EnemyProjectile_MetalSkreeParticles_DownLeft
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    LDY.W #EnemyProjectile_MetalSkreeParticles_UpLeft
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics

  .timerNot8:
    LDX.W EnemyIndex
    INC.W Enemy.YPosition,X
    RTL

  .delete:
    LDX.W EnemyIndex ; >.<
    LDA.W Enemy.palette,X : ORA.W Enemy.GFXOffset,X : STA.L EnemySpawnData.VRAMTilesIndex,X
    LDA.W #$0A00 : STA.W Enemy.palette,X
    STZ.W Enemy.GFXOffset,X
    LDA.W Enemy.properties,X : ORA.W #$0200 : STA.W Enemy.properties,X
    RTL


;;; $8AB2: Set metaree instruction list pointer ;;;
SetMetareeInstListPointer:
    LDX.W EnemyIndex
    LDA.W Metaree.newInstListIndex,X : CMP.W Metaree.instListIndex,X : BEQ .return
    STA.W Metaree.instListIndex,X
    ASL : TAY
    LDA.W InstListPointers_Metaree,Y : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X

  .return:
    RTS


;;; $8AD2: Unused ;;;
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


;;; $8B0E: RTL ;;;
RTL_A38B0E:
    RTL


;;; $8B0F: Enemy shot - enemy $D67F (metaree) ;;;
EnemyShot_Metaree:
    LDX.W EnemyIndex
    LDA.W Enemy.GFXOffset,X : STA.W Temp_MetareeParticleVRAMTilesIndex
    LDA.W Enemy.palette,X : STA.W Temp_MetareeParticlePaletteIndex
    JSL CommonA3_NormalEnemyShotAI
    LDX.W EnemyIndex
    LDA.W Enemy.health,X : BNE .return
    LDX.W EnemyIndex ; >.<
    LDA.W Temp_MetareeParticleVRAMTilesIndex : STA.W Enemy.GFXOffset,X
    LDA.W Temp_MetareeParticlePaletteIndex : STA.W Enemy.palette,X
    LDA.W Metaree.burrowTimer,X
    LDX.W EnemyIndex ; >.<
    LDY.W #EnemyProjectile_MetalSkreeParticles_DownRight
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    LDY.W #EnemyProjectile_MetalSkreeParticles_UpRight
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    LDY.W #EnemyProjectile_MetalSkreeParticles_DownLeft
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    LDY.W #EnemyProjectile_MetalSkreeParticles_UpLeft
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    LDX.W EnemyIndex
    STZ.W Enemy.GFXOffset,X : STZ.W Enemy.palette,X

  .return:
    RTL


;;; $8B65: Metaree spritemaps ;;;
Spritemap_Metaree_0:
    dw $0009
    %spritemapEntry(0, $04, $F5, 0, 1, 2, 0, $122)
    %spritemapEntry(0, $04, $FD, 0, 1, 2, 0, $123)
    %spritemapEntry(0, $04, $05, 0, 1, 2, 0, $124)
    %spritemapEntry(0, $1F4, $05, 0, 0, 2, 0, $124)
    %spritemapEntry(0, $1F4, $FD, 0, 0, 2, 0, $123)
    %spritemapEntry(0, $1F4, $F5, 0, 0, 2, 0, $122)
    %spritemapEntry(0, $00, $03, 0, 0, 2, 0, $121)
    %spritemapEntry(0, $1F8, $03, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $1F8, $F3, 0, 0, 2, 0, $100)

Spritemap_Metaree_1:
    dw $0007
    %spritemapEntry(0, $05, $03, 0, 1, 2, 0, $127)
    %spritemapEntry(0, $1F3, $03, 0, 0, 2, 0, $127)
    %spritemapEntry(0, $05, $FB, 0, 1, 2, 0, $126)
    %spritemapEntry(0, $1F3, $FB, 0, 0, 2, 0, $126)
    %spritemapEntry(0, $05, $F3, 0, 1, 2, 0, $125)
    %spritemapEntry(0, $1F3, $F3, 0, 0, 2, 0, $125)
    %spritemapEntry(1, $1F8, $F3, 0, 0, 2, 0, $102)

Spritemap_Metaree_2:
    dw $0007
    %spritemapEntry(1, $1F5, $03, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $1F5, $F3, 0, 0, 2, 0, $104)
    %spritemapEntry(0, $00, $03, 0, 0, 2, 0, $121)
    %spritemapEntry(1, $1F8, $F3, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $00, $03, 0, 0, 2, 0, $12A)
    %spritemapEntry(0, $00, $FB, 0, 0, 2, 0, $129)
    %spritemapEntry(0, $00, $F3, 0, 0, 2, 0, $128)

Spritemap_Metaree_3:
    dw $0002
    %spritemapEntry(1, $1F8, $03, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $1F8, $F3, 0, 0, 2, 0, $10C)

Spritemap_Metaree_4:
    dw $0007
    %spritemapEntry(1, $1FB, $03, 0, 0, 2, 0, $10A)
    %spritemapEntry(1, $1FB, $F3, 0, 0, 2, 0, $108)
    %spritemapEntry(0, $1F8, $03, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $1F8, $F3, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $1F8, $03, 0, 1, 2, 0, $12A)
    %spritemapEntry(0, $1F8, $FB, 0, 1, 2, 0, $129)
    %spritemapEntry(0, $1F8, $F3, 0, 1, 2, 0, $128)


;;; $8C0F: Palette - enemy $D6BF (fireflea) ;;;
Palette_Fireflea:
    dw $3800,$02FF,$01BF,$000F,$0008,$01BF,$011B,$00BA
    dw $0011,$7F5A,$5D45,$40C3,$2462,$53E9,$3AC6,$1961


;;; $8C2F: Instruction list - fireflea ;;;
InstList_Fireflea:
    dw $0002,Spritemap_Fireflea_0
    dw $0001,Spritemap_Fireflea_1
    dw $0002,Spritemap_Fireflea_2
    dw $0001,Spritemap_Fireflea_1
    dw $0002,Spritemap_Fireflea_0
    dw $0001,Spritemap_Fireflea_1
    dw $0002,Spritemap_Fireflea_2
    dw $0001,Spritemap_Fireflea_1
    dw $0002,Spritemap_Fireflea_3
    dw $0001,Spritemap_Fireflea_4
    dw $0002,Spritemap_Fireflea_5
    dw $0001,Spritemap_Fireflea_4
    dw $0002,Spritemap_Fireflea_6
    dw $0001,Spritemap_Fireflea_7
    dw $0002,Spritemap_Fireflea_8
    dw $0001,Spritemap_Fireflea_7
    dw $0002,Spritemap_Fireflea_9
    dw $0001,Spritemap_Fireflea_A
    dw $0002,Spritemap_Fireflea_B
    dw $0001,Spritemap_Fireflea_A
    dw $0002,Spritemap_Fireflea_C
    dw $0001,Spritemap_Fireflea_D
    dw $0002,Spritemap_Fireflea_E
    dw $0001,Spritemap_Fireflea_D
    dw $0002,Spritemap_Fireflea_F
    dw $0001,Spritemap_Fireflea_10
    dw $0002,Spritemap_Fireflea_11
    dw $0001,Spritemap_Fireflea_10
    dw $0002,Spritemap_Fireflea_12
    dw $0001,Spritemap_Fireflea_13
    dw $0002,Spritemap_Fireflea_14
    dw $0001,Spritemap_Fireflea_13
    dw $0002,Spritemap_Fireflea_F
    dw $0001,Spritemap_Fireflea_10
    dw $0002,Spritemap_Fireflea_11
    dw $0001,Spritemap_Fireflea_10
    dw $0002,Spritemap_Fireflea_C
    dw $0001,Spritemap_Fireflea_D
    dw $0002,Spritemap_Fireflea_E
    dw $0001,Spritemap_Fireflea_D
    dw $0002,Spritemap_Fireflea_9
    dw $0001,Spritemap_Fireflea_A
    dw $0002,Spritemap_Fireflea_B
    dw $0001,Spritemap_Fireflea_A
    dw $0002,Spritemap_Fireflea_6
    dw $0001,Spritemap_Fireflea_7
    dw $0002,Spritemap_Fireflea_8
    dw $0001,Spritemap_Fireflea_7
    dw $0002,Spritemap_Fireflea_3
    dw $0001,Spritemap_Fireflea_4
    dw $0002,Spritemap_Fireflea_5
    dw $0001,Spritemap_Fireflea_4
    dw Instruction_Common_GotoY
    dw InstList_Fireflea


;;; $8D03: Fireflea data ;;;
if !FEATURE_KEEP_UNREFERENCED
UNUSED_Fireflea_Data_A38D03:
    dw $1000,$2000,$4000,$6000,$8000,$A000,$C000,$E000

UNUSED_Fireflea_Data_A38D13:
    dw $0001,$2001,$4001,$6001,$8001
endif ; !FEATURE_KEEP_UNREFERENCED

FirefleaMovementRadii:
; Movement radii. Indexed by [enemy parameter 2 high] * 2
    dw $0008,$0010,$0018,$0020,$0028,$0030,$0038,$0040


;;; $8D2D: Initialisation AI - enemy $D6BF (fireflea) ;;;
InitAI_Fireflea:
    LDX.W EnemyIndex
    LDA.W #InstList_Fireflea : STA.W Enemy.instList,X
    LDA.W Enemy.init0,X : AND.W #$00FF : STA.B DP_Temp12
    AND.W #$0002 : BNE .circleMovement
    JSR SetFirefleaSpeed
    JSR SetFirefleaRadius
    JSR SetFirefleaMinMaxYPositions
    RTL

  .circleMovement:
    JSR SetFirefleaCenter
    JSR SetInitialFirefleaAngle
    JSR SetFirefleaSpeed
    JSR SetFirefleaRadius
    JSR SetInitialCirclingFirefleaPosition
    RTL


;;; $8D5D: Set fireflea center ;;;
SetFirefleaCenter:
    LDA.W Enemy.XPosition,X : STA.W Fireflea.XCenter,X
    LDA.W Enemy.YPosition,X : STA.W Fireflea.YCenter,X
    RTS


;;; $8D6A: Set initial fireflea angle ;;;
SetInitialFirefleaAngle:
    LDA.W Enemy.init0+1,X : AND.W #$00FF : XBA : STA.W Fireflea.angle,X
    RTS


;;; $8D75: Set fireflea speed ;;;
SetFirefleaSpeed:
    LDA.W Enemy.init1,X : AND.W #$00FF : ASL #3 : TAY
    LDA.B DP_Temp12 : AND.W #$0001 : BNE +
    INY #4

+   TYA : STA.L Fireflea.speedTableIndex,X
    LDA.W CommonEnemySpeeds_LinearlyIncreasing,Y : STA.W Fireflea.angleDelta,X
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+2,Y : STA.W Fireflea.subAngleDelta,X
    RTS


;;; $8D9C: Set fireflea radius ;;;
SetFirefleaRadius:
    LDA.W Enemy.init1+1,X : AND.W #$00FF : ASL : TAY
    LDA.W FirefleaMovementRadii,Y : AND.W #$00FF : STA.W Fireflea.radius,X
    RTS


;;; $8DAE: Set initial circling fireflea position ;;;
SetInitialCirclingFirefleaPosition:
; This seems to be missing a division by 100h of the enemy angle,
; which is of little consequence as the main AI sets the position every frame anyway
    LDA.W Fireflea.radius,X : STA.W Temp_Unknown0E32
    LDA.W Enemy.var3,X
    JSL EightBitCosineMultiplication_A0B0B2
    CLC : ADC.W Fireflea.XCenter,X : STA.W Enemy.XPosition,X
    LDA.W Fireflea.radius,X : STA.W Temp_Unknown0E32
    LDA.W Enemy.var3,X
    JSL EightBitNegativeSineMultiplication_A0B0C6
    CLC : ADC.W Fireflea.YCenter,X : STA.W Enemy.YPosition,X
    RTS


;;; $8DD7: Set Y fireflea extrema ;;;
SetFirefleaMinMaxYPositions:
    LDA.W Enemy.YPosition,X : SEC : SBC.W Fireflea.radius,X : STA.L Fireflea.minimumYPosition,X
    LDA.W Enemy.YPosition,X : CLC : ADC.W Fireflea.radius,X : STA.L Fireflea.maximumYPosition,X
    RTS


;;; $8DEE: Main AI - enemy $D6BF (fireflea) ;;;
MainAI_Fireflea:
    LDX.W EnemyIndex
    LDA.W Enemy.init0,X : AND.W #$0002 : BEQ .verticalMovement
    LDA.W Fireflea.radius,X : STA.W Temp_Unknown0E32
    LDA.W Enemy.var3,X : AND.W #$FF00 : XBA
    JSL EightBitCosineMultiplication_A0B0B2
    CLC : ADC.W Fireflea.XCenter,X : STA.W Enemy.XPosition,X
    LDA.W Fireflea.radius,X : STA.W Temp_Unknown0E32
    LDA.W Enemy.var3,X : AND.W #$FF00 : XBA
    JSL EightBitNegativeSineMultiplication_A0B0C6
    CLC : ADC.W Fireflea.YCenter,X : STA.W Enemy.YPosition,X
    LDA.W Enemy.var3,X : CLC : ADC.W Enemy.var0+1,X : STA.W Enemy.var3,X
    RTL

  .verticalMovement:
    LDA.L Fireflea.speedTableIndex,X : TAY
    CLC
    LDA.W Enemy.YSubPosition,X : ADC.W CommonEnemySpeeds_LinearlyIncreasing+2,Y : STA.W Enemy.YSubPosition,X
    LDA.W Enemy.YPosition,X : ADC.W CommonEnemySpeeds_LinearlyIncreasing,Y : STA.W Enemy.YPosition,X
    LDA.W Enemy.YPosition,X : CMP.L Fireflea.minimumYPosition,X : BMI +
    LDA.W Enemy.YPosition,X : CMP.L Fireflea.maximumYPosition,X : BPL +
    RTL

+   LDA.L Fireflea.speedTableIndex,X : EOR.W #$0004 : STA.L Fireflea.speedTableIndex,X
    RTL


;;; $8E6B: Enemy touch - enemy $D6BF (fireflea) ;;;
EnemyTouch_Fireflea:
; This code is pretty buggy

; If the enemy is killed by CommonA3_NormalEnemyTouchAI, then it will run the enemy death routine, which clears enemy RAM
; The call to EnemyDeath then runs the enemy death routine *again*,
; where the enemy death explosion enemy projectile will be referencing this cleared enemy RAM,
; which will cause the explosion to spawn to position (0, 0) with garbage drop chances
; The number of enemies killed will also be incremented one extra time

; If the enemy is not killed by CommonA3_NormalEnemyTouchAI, then the enemy death routine will be run with A = [enemy health] (from $A0:A480),
; in death animation > 4, which gets corrected to 0 (small explosion), so that works out fine by chance

; FirefleaFlashing_DarknessLevel is used to index $88:B070 by FX code, the table is 6 entries long, so the max index should be Ah
; If you do place 6 fireflea in a room (which vanilla does not do) and kill them all,
; the screen will get bright again because it reads beyond the table,
; which happens to result in a large value that results in the backdrop colour not being solid white
    JSL CommonA3_NormalEnemyTouchAI
    JSL EnemyDeath
    LDA.W FirefleaFlashing_DarknessLevel : CLC : ADC.W #$0002 : CMP.W #$000E : BPL .return
    STA.W FirefleaFlashing_DarknessLevel

  .return:
    RTL


;;; $8E83: Power bomb reaction - enemy $D6BF (fireflea) ;;;
PowerBombReaction_Fireflea:
    JSL CommonA3_NormalEnemyPowerBombAI
    BRA ShotReaction_Fireflea_Common


;;; $8E89: Enemy shot - enemy $D6BF (fireflea) ;;;
EnemyShot_Fireflea:
    JSL CommonA3_NormalEnemyShotAI
; fallthrough to ShotReaction_Fireflea_Common


;;; $8E8D: Fireflea shared shot reaction ;;;
ShotReaction_Fireflea_Common:
; See EnemyTouch_Fireflea for note about fireflea darkness level
    LDX.W EnemyIndex
    LDA.W Enemy.health,X : BNE .return
    LDA.W FirefleaFlashing_DarknessLevel : CLC : ADC.W #$0002 : CMP.W #$000E : BPL .return
    STA.W FirefleaFlashing_DarknessLevel

  .return:
    RTL


;;; $8EA5: Fireflea spritemaps ;;;
Spritemap_Fireflea_0:
    dw $0003
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 0, $100)
    %spritemapEntry(0, $01, $F6, 0, 0, 3, 0, $121)
    %spritemapEntry(0, $1F7, $F6, 0, 0, 3, 0, $120)

Spritemap_Fireflea_1:
    dw $0003
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 0, $100)
    %spritemapEntry(0, $01, $F6, 0, 0, 3, 0, $123)
    %spritemapEntry(0, $1F7, $F6, 0, 0, 3, 0, $122)

Spritemap_Fireflea_2:
    dw $0003
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 0, $100)
    %spritemapEntry(0, $01, $F6, 0, 0, 3, 0, $125)
    %spritemapEntry(0, $1F7, $F6, 0, 0, 3, 0, $124)

Spritemap_Fireflea_3:
    dw $0003
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 0, $102)
    %spritemapEntry(0, $01, $F6, 0, 0, 3, 0, $121)
    %spritemapEntry(0, $1F7, $F6, 0, 0, 3, 0, $120)

Spritemap_Fireflea_4:
    dw $0003
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 0, $102)
    %spritemapEntry(0, $01, $F6, 0, 0, 3, 0, $123)
    %spritemapEntry(0, $1F7, $F6, 0, 0, 3, 0, $122)

Spritemap_Fireflea_5:
    dw $0003
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 0, $102)
    %spritemapEntry(0, $01, $F6, 0, 0, 3, 0, $125)
    %spritemapEntry(0, $1F7, $F6, 0, 0, 3, 0, $124)

Spritemap_Fireflea_6:
    dw $0003
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 0, $104)
    %spritemapEntry(0, $01, $F6, 0, 0, 3, 0, $127)
    %spritemapEntry(0, $1F7, $F6, 0, 0, 3, 0, $126)

Spritemap_Fireflea_7:
    dw $0003
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 0, $104)
    %spritemapEntry(0, $01, $F6, 0, 0, 3, 0, $129)
    %spritemapEntry(0, $1F7, $F6, 0, 0, 3, 0, $128)

Spritemap_Fireflea_8:
    dw $0003
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 0, $104)
    %spritemapEntry(0, $01, $F6, 0, 0, 3, 0, $12B)
    %spritemapEntry(0, $1F7, $F6, 0, 0, 3, 0, $12A)

Spritemap_Fireflea_9:
    dw $0003
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 0, $106)
    %spritemapEntry(0, $01, $F6, 0, 0, 3, 0, $127)
    %spritemapEntry(0, $1F7, $F6, 0, 0, 3, 0, $126)

Spritemap_Fireflea_A:
    dw $0003
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 0, $106)
    %spritemapEntry(0, $01, $F6, 0, 0, 3, 0, $129)
    %spritemapEntry(0, $1F7, $F6, 0, 0, 3, 0, $128)

Spritemap_Fireflea_B:
    dw $0003
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 0, $106)
    %spritemapEntry(0, $01, $F6, 0, 0, 3, 0, $12B)
    %spritemapEntry(0, $1F7, $F6, 0, 0, 3, 0, $12A)

Spritemap_Fireflea_C:
    dw $0003
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 0, $108)
    %spritemapEntry(0, $01, $F6, 0, 0, 3, 0, $127)
    %spritemapEntry(0, $1F7, $F6, 0, 0, 3, 0, $126)

Spritemap_Fireflea_D:
    dw $0003
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 0, $108)
    %spritemapEntry(0, $01, $F6, 0, 0, 3, 0, $129)
    %spritemapEntry(0, $1F7, $F6, 0, 0, 3, 0, $128)

Spritemap_Fireflea_E:
    dw $0003
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 0, $108)
    %spritemapEntry(0, $01, $F6, 0, 0, 3, 0, $12B)
    %spritemapEntry(0, $1F7, $F6, 0, 0, 3, 0, $12A)

Spritemap_Fireflea_F:
    dw $0003
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 0, $10A)
    %spritemapEntry(0, $01, $F6, 0, 0, 3, 0, $12D)
    %spritemapEntry(0, $1F7, $F6, 0, 0, 3, 0, $12C)

Spritemap_Fireflea_10:
    dw $0003
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 0, $10A)
    %spritemapEntry(0, $01, $F6, 0, 0, 3, 0, $12F)
    %spritemapEntry(0, $1F7, $F6, 0, 0, 3, 0, $12E)

Spritemap_Fireflea_11:
    dw $0003
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 0, $10A)
    %spritemapEntry(0, $01, $F6, 0, 0, 3, 0, $11F)
    %spritemapEntry(0, $1F7, $F6, 0, 0, 3, 0, $11E)

Spritemap_Fireflea_12:
    dw $0003
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 0, $10C)
    %spritemapEntry(0, $01, $F6, 0, 0, 3, 0, $12D)
    %spritemapEntry(0, $1F7, $F6, 0, 0, 3, 0, $12C)

Spritemap_Fireflea_13:
    dw $0003
    %spritemapEntry(0, $01, $F6, 0, 0, 3, 0, $12F)
    %spritemapEntry(0, $1F7, $F6, 0, 0, 3, 0, $12E)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 0, $10C)

Spritemap_Fireflea_14:
    dw $0003
    %spritemapEntry(0, $01, $F6, 0, 0, 3, 0, $11F)
    %spritemapEntry(0, $1F7, $F6, 0, 0, 3, 0, $11E)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 0, $10C)


;;; $900A: Palette - enemy $D6FF (skultera) ;;;
Palette_Skultera:
    dw $3800,$72FA,$55B0,$2845,$1801,$6210,$496B,$38C6
    dw $2C63,$241F,$1C17,$142F,$0C47,$03FF,$0237,$00D1


;;; $902A: Instruction list - swimming left ;;;
InstList_Skultera_SwimmingLeft_0:
    dw Instruction_Skultera_SetLayerTo2

InstList_Skultera_SwimmingLeft_1:
    dw $000E,Spritemap_Skultera_0
    dw $000E,Spritemap_Skultera_1
    dw $000E,Spritemap_Skultera_2
    dw Instruction_Common_GotoY
    dw InstList_Skultera_SwimmingLeft_1


;;; $903C: Instruction list - turning right ;;;
InstList_Skultera_TurningRight:
    dw $000D,Spritemap_Skultera_3
    dw $000A,Spritemap_Skultera_4
    dw $0008,Spritemap_Skultera_5
    dw $0006,Spritemap_Skultera_6
    dw $0006,Spritemap_Skultera_7
    dw $0008,Spritemap_Skultera_8
    dw $000A,Spritemap_Skultera_9
    dw $000D,Spritemap_Skultera_A
    dw Instruction_Skultera_SetTurnFinishedFlag
    dw Instruction_Common_Sleep


;;; $9060: Instruction list - swimming right ;;;
InstList_Skultera_SwimmingRight_0:
    dw Instruction_Skultera_SetLayerTo6

InstList_Skultera_SwimmingRight_1:
    dw $000E,Spritemap_Skultera_B
    dw $000E,Spritemap_Skultera_C
    dw $000E,Spritemap_Skultera_D
    dw Instruction_Common_GotoY
    dw InstList_Skultera_SwimmingRight_1


;;; $9072: Instruction list - turning left ;;;
InstList_Skultera_TurningLeft:
    dw $000D,Spritemap_Skultera_E
    dw $000A,Spritemap_Skultera_F
    dw $0008,Spritemap_Skultera_10
    dw $0006,Spritemap_Skultera_11
    dw $0006,Spritemap_Skultera_12
    dw $0008,Spritemap_Skultera_13
    dw $000A,Spritemap_Skultera_14
    dw $000D,Spritemap_Skultera_15
    dw Instruction_Skultera_SetTurnFinishedFlag
    dw Instruction_Common_Sleep


;;; $9096: Instruction - enemy layer = 6 ;;;
Instruction_Skultera_SetLayerTo6:
    LDX.W EnemyIndex
    LDA.W #$0006 : STA.W Enemy.layer,X
    RTL


;;; $90A0: Instruction - enemy layer = 2 ;;;
Instruction_Skultera_SetLayerTo2:
    LDX.W EnemyIndex
    LDA.W #$0002 : STA.W Enemy.layer,X
    RTL


;;; $90AA: Instruction - set turn finished flag ;;;
Instruction_Skultera_SetTurnFinishedFlag:
    LDX.W EnemyIndex
    LDA.W #$0001 : STA.L Skulltera.turnFinishedFlag,X
    RTL


;;; $90B5: Initialisation AI - enemy $D6FF (skultera) ;;;
InitAI_Skultera:
    LDX.W EnemyIndex
    LDA.W #InstList_Skultera_SwimmingLeft_0 : STA.W Enemy.instList,X
    LDA.W #Function_Skultera_SwimmingLeft : STA.W Skulltera.function,X
    LDA.W Enemy.init0+1,X : AND.W #$00FF : BNE .keepLeft
    LDA.W #InstList_Skultera_SwimmingRight_0 : STA.W Enemy.instList,X
    LDA.W #Function_Skultera_SwimmingRight : STA.W Skulltera.function,X

  .keepLeft:
    LDA.W Enemy.init0,X : AND.W #$00FF : ASL #3 : TAY
    LDA.W CommonEnemySpeeds_LinearlyIncreasing,Y : STA.W Skulltera.rightVelocity,X
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+2,Y : STA.W Skulltera.rightSubVelocity,X
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+4,Y : STA.W Skulltera.leftVelocity,X
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+6,Y : STA.W Skulltera.leftSubVelocity,X
    LDA.W Enemy.init1,X : AND.W #$00FF : STA.L Skulltera.radius,X
    LDA.W Enemy.init1+1,X : AND.W #$00FF : STA.L Skulltera.angleDelta,X
    LDA.W #$0000 : STA.W Skulltera.angle,X : STA.L Skulltera.turnFinishedFlag,X
    LDA.L Skulltera.radius,X : STA.W Temp_Unknown0E32
    LDA.W Skulltera.angle,X
    JSL EightBitNegativeSineMultiplication_A0B0C6
    STA.L Skulltera.previousYOffset,X
    RTL


;;; $912B: Main AI - enemy $D6FF (skultera) ;;;
MainAI_Skultera:
    LDX.W EnemyIndex
    JSR.W (Skulltera.function,X)
    RTL


;;; $9132: Skultera function - swimming left ;;;
Function_Skultera_SwimmingLeft:
    LDX.W EnemyIndex
    LDA.W Skulltera.leftSubVelocity,X : STA.B DP_Temp12
    LDA.W Skulltera.leftVelocity,X : STA.B DP_Temp14
    JSL MoveEnemyRightBy_14_12_IgnoreSlopes
    BCC .noWallCollision
    LDA.W #Function_Skultera_TurningRight : STA.W Skulltera.function,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    LDA.W #InstList_Skultera_TurningRight : STA.W Enemy.instList,X
    BRA .merge

  .noWallCollision:
    LDA.L Skulltera.radius,X : STA.W Temp_Unknown0E32
    LDA.W Skulltera.angle,X
    JSL EightBitNegativeSineMultiplication_A0B0C6
    STA.L Skulltera.YOffset,X
    SEC : SBC.L Skulltera.previousYOffset,X : STA.B DP_Temp14
    STZ.B DP_Temp12
    JSL MoveEnemyDownBy_14_12
    BCC .noBlockCollision
    LDA.W #Function_Skultera_TurningRight : STA.W Skulltera.function,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    LDA.W #InstList_Skultera_TurningRight : STA.W Enemy.instList,X
    BRA .merge

  .noBlockCollision:
    LDA.W Skulltera.angle,X : CLC : ADC.L Skulltera.angleDelta,X : AND.W #$00FF : STA.W Skulltera.angle,X

  .merge:
    LDA.L Skulltera.YOffset,X : STA.L Skulltera.previousYOffset,X
    RTS


;;; $91AB: Skultera function - swimming right ;;;
Function_Skultera_SwimmingRight:
    LDX.W EnemyIndex
    LDA.W Skulltera.rightSubVelocity,X : STA.B DP_Temp12
    LDA.W Skulltera.rightVelocity,X : STA.B DP_Temp14
    JSL MoveEnemyRightBy_14_12_IgnoreSlopes
    BCC .noWallCollision
    LDA.W #Function_Skultera_TurningLeft : STA.W Skulltera.function,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    LDA.W #InstList_Skultera_TurningLeft : STA.W Enemy.instList,X
    BRA .merge

  .noWallCollision:
    LDA.L Skulltera.radius,X : STA.W Temp_Unknown0E32
    LDA.W Skulltera.angle,X
    JSL EightBitNegativeSineMultiplication_A0B0C6
    STA.L Skulltera.YOffset,X
    SEC : SBC.L Skulltera.previousYOffset,X : STA.B DP_Temp14
    STZ.B DP_Temp12
    JSL MoveEnemyDownBy_14_12
    BCC .noBlockCollision
    LDA.W #Function_Skultera_TurningLeft : STA.W Skulltera.function,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    LDA.W #InstList_Skultera_TurningLeft : STA.W Enemy.instList,X
    BRA .merge

  .noBlockCollision:
    LDA.W Skulltera.angle,X : CLC : ADC.L Skulltera.angleDelta,X : AND.W #$00FF : STA.W Skulltera.angle,X

  .merge:
    LDA.L Skulltera.YOffset,X : STA.L Skulltera.previousYOffset,X
    RTS


;;; $9224: Skultera function - turning right ;;;
Function_Skultera_TurningRight:
    LDX.W EnemyIndex
    LDA.L Skulltera.turnFinishedFlag,X : BEQ .return
    LDA.W #$0000 : STA.L Skulltera.turnFinishedFlag,X
    LDA.W #Function_Skultera_SwimmingRight : STA.W Skulltera.function,X
    LDA.L Skulltera.angleDelta,X : EOR.W #$FFFF : INC : STA.L Skulltera.angleDelta,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    LDA.W #InstList_Skultera_SwimmingRight_0 : STA.W Enemy.instList,X

  .return:
    RTS


;;; $9256: Skultera function - turning left ;;;
Function_Skultera_TurningLeft:
    LDX.W EnemyIndex
    LDA.L Skulltera.turnFinishedFlag,X : BEQ .return
    LDA.W #$0000 : STA.L Skulltera.turnFinishedFlag,X
    LDA.W #Function_Skultera_SwimmingLeft : STA.W Skulltera.function,X
    LDA.L Skulltera.angleDelta,X : EOR.W #$FFFF : INC : STA.L Skulltera.angleDelta,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    LDA.W #InstList_Skultera_SwimmingLeft_0 : STA.W Enemy.instList,X

  .return:
    RTS


;;; $9288: RTL ;;;
RTL_A39288:
    RTL


;;; $9289: RTL ;;;
RTL_A39289:
    RTL


;;; $928A: Skultera spritemaps ;;;
Spritemap_Skultera_0:
    dw $0005
    %spritemapEntry(1, $43F2, $00, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $43F2, $F0, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $1FE, $FD, 0, 0, 2, 0, $120)
    %spritemapEntry(0, $03, $FE, 0, 0, 2, 0, $121)
    %spritemapEntry(0, $08, $FE, 0, 0, 2, 0, $123)

Spritemap_Skultera_1:
    dw $0005
    %spritemapEntry(1, $43F2, $00, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $43F2, $F0, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $1FE, $FE, 0, 0, 2, 0, $121)
    %spritemapEntry(0, $03, $00, 0, 0, 2, 0, $122)
    %spritemapEntry(0, $08, $FE, 0, 0, 2, 0, $124)

Spritemap_Skultera_2:
    dw $0005
    %spritemapEntry(1, $43F2, $00, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $43F2, $F0, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $1FE, $00, 0, 0, 2, 0, $122)
    %spritemapEntry(0, $03, $FD, 0, 0, 2, 0, $120)
    %spritemapEntry(0, $08, $FE, 0, 0, 2, 0, $125)

Spritemap_Skultera_3:
    dw $0005
    %spritemapEntry(0, $08, $FE, 0, 0, 2, 0, $123)
    %spritemapEntry(0, $03, $FE, 0, 0, 2, 0, $121)
    %spritemapEntry(0, $1FE, $FD, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $43F2, $00, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $43F2, $F0, 0, 0, 2, 0, $100)

Spritemap_Skultera_4:
    dw $0005
    %spritemapEntry(1, $43F2, $00, 0, 0, 2, 0, $108)
    %spritemapEntry(1, $43F2, $F0, 0, 0, 2, 0, $106)
    %spritemapEntry(0, $1FC, $FE, 0, 0, 2, 0, $121)
    %spritemapEntry(0, $01, $00, 0, 0, 2, 0, $122)
    %spritemapEntry(0, $06, $FE, 0, 0, 2, 0, $124)

Spritemap_Skultera_5:
    dw $0004
    %spritemapEntry(1, $43F2, $00, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $43F2, $F0, 0, 0, 2, 0, $10A)
    %spritemapEntry(0, $1FE, $FD, 0, 0, 2, 0, $120)
    %spritemapEntry(0, $03, $FE, 0, 0, 2, 0, $125)

Spritemap_Skultera_6:
    dw $0004
    %spritemapEntry(1, $43F0, $00, 0, 1, 2, 0, $108)
    %spritemapEntry(1, $43F0, $F0, 0, 1, 2, 0, $106)
    %spritemapEntry(0, $1EE, $FD, 0, 1, 2, 0, $120)
    %spritemapEntry(0, $1FD, $FE, 0, 0, 2, 0, $123)

Spritemap_Skultera_7:
    dw $0003
    %spritemapEntry(1, $43F2, $F0, 0, 1, 2, 0, $100)
    %spritemapEntry(1, $43F2, $00, 0, 1, 2, 0, $102)
    %spritemapEntry(0, $1EF, $FD, 0, 1, 2, 0, $121)

Spritemap_Skultera_8:
    dw $0004
    %spritemapEntry(1, $43F5, $00, 0, 1, 2, 0, $104)
    %spritemapEntry(1, $43F5, $F0, 0, 1, 2, 0, $100)
    %spritemapEntry(0, $1F1, $00, 0, 1, 2, 0, $122)
    %spritemapEntry(0, $1EF, $FD, 0, 1, 2, 0, $120)

Spritemap_Skultera_9:
    dw $0005
    %spritemapEntry(1, $43FB, $00, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $43FB, $F0, 0, 1, 2, 0, $100)
    %spritemapEntry(0, $1F7, $FD, 0, 1, 2, 0, $120)
    %spritemapEntry(0, $1F2, $00, 0, 1, 2, 0, $122)
    %spritemapEntry(0, $1F0, $FE, 0, 1, 2, 0, $124)

Spritemap_Skultera_A:
    dw $0005
    %spritemapEntry(1, $43FF, $00, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $43FF, $F0, 0, 1, 2, 0, $100)
    %spritemapEntry(0, $1FB, $00, 0, 1, 2, 0, $122)
    %spritemapEntry(0, $1F6, $FD, 0, 1, 2, 0, $120)
    %spritemapEntry(0, $1F1, $FE, 0, 1, 2, 0, $125)

Spritemap_Skultera_B:
    dw $0005
    %spritemapEntry(1, $43FE, $F0, 0, 1, 2, 0, $100)
    %spritemapEntry(1, $43FE, $00, 0, 1, 2, 0, $104)
    %spritemapEntry(0, $1FA, $FD, 0, 1, 2, 0, $120)
    %spritemapEntry(0, $1F5, $FE, 0, 1, 2, 0, $121)
    %spritemapEntry(0, $1F0, $FE, 0, 1, 2, 0, $123)

Spritemap_Skultera_C:
    dw $0005
    %spritemapEntry(1, $43FE, $00, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $43FE, $F0, 0, 1, 2, 0, $100)
    %spritemapEntry(0, $1FA, $FE, 0, 1, 2, 0, $121)
    %spritemapEntry(0, $1F5, $00, 0, 1, 2, 0, $122)
    %spritemapEntry(0, $1F0, $FE, 0, 1, 2, 0, $124)

Spritemap_Skultera_D:
    dw $0005
    %spritemapEntry(1, $43FE, $00, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $43FE, $F0, 0, 1, 2, 0, $100)
    %spritemapEntry(0, $1FA, $00, 0, 1, 2, 0, $122)
    %spritemapEntry(0, $1F5, $FD, 0, 1, 2, 0, $120)
    %spritemapEntry(0, $1F0, $FE, 0, 1, 2, 0, $125)

Spritemap_Skultera_E:
    dw $0005
    %spritemapEntry(0, $1F0, $FE, 0, 1, 2, 0, $123)
    %spritemapEntry(0, $1F5, $FE, 0, 1, 2, 0, $121)
    %spritemapEntry(0, $1FA, $FD, 0, 1, 2, 0, $120)
    %spritemapEntry(1, $43FE, $00, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $43FE, $F0, 0, 1, 2, 0, $100)

Spritemap_Skultera_F:
    dw $0005
    %spritemapEntry(1, $43FE, $00, 0, 1, 2, 0, $108)
    %spritemapEntry(1, $43FE, $F0, 0, 1, 2, 0, $106)
    %spritemapEntry(0, $1FC, $FE, 0, 1, 2, 0, $121)
    %spritemapEntry(0, $1F7, $00, 0, 1, 2, 0, $122)
    %spritemapEntry(0, $1F2, $FE, 0, 1, 2, 0, $124)

Spritemap_Skultera_10:
    dw $0004
    %spritemapEntry(1, $43FE, $00, 0, 1, 2, 0, $10C)
    %spritemapEntry(1, $43FE, $F0, 0, 1, 2, 0, $10A)
    %spritemapEntry(0, $1FA, $FD, 0, 1, 2, 0, $120)
    %spritemapEntry(0, $1F5, $FE, 0, 1, 2, 0, $125)

Spritemap_Skultera_11:
    dw $0004
    %spritemapEntry(1, $4200, $00, 0, 0, 2, 0, $108)
    %spritemapEntry(1, $4200, $F0, 0, 0, 2, 0, $106)
    %spritemapEntry(0, $0A, $FD, 0, 0, 2, 0, $120)
    %spritemapEntry(0, $1FB, $FE, 0, 1, 2, 0, $123)

Spritemap_Skultera_12:
    dw $0003
    %spritemapEntry(1, $43FE, $F0, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $43FE, $00, 0, 0, 2, 0, $102)
    %spritemapEntry(0, $09, $FD, 0, 0, 2, 0, $121)

Spritemap_Skultera_13:
    dw $0004
    %spritemapEntry(1, $43FB, $00, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $43FB, $F0, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $07, $00, 0, 0, 2, 0, $122)
    %spritemapEntry(0, $09, $FD, 0, 0, 2, 0, $120)

Spritemap_Skultera_14:
    dw $0005
    %spritemapEntry(1, $43F5, $00, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $43F5, $F0, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $01, $FD, 0, 0, 2, 0, $120)
    %spritemapEntry(0, $06, $00, 0, 0, 2, 0, $122)
    %spritemapEntry(0, $08, $FE, 0, 0, 2, 0, $124)

Spritemap_Skultera_15:
    dw $0005
    %spritemapEntry(1, $43F1, $00, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $43F1, $F0, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $1FD, $00, 0, 0, 2, 0, $122)
    %spritemapEntry(0, $02, $FD, 0, 0, 2, 0, $120)
    %spritemapEntry(0, $07, $FE, 0, 0, 2, 0, $125)


;;; $94AA: Unused. Skultera spritemap pointers ;;;
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


;;; $94D6: Instruction list - elevator ;;;
InstList_Elevator:
    dw $0002,Spritemap_Elevator_0
    dw $0002,Spritemap_Elevator_1
    dw Instruction_Common_GotoY
    dw InstList_Elevator


;;; $94E2: Elevator controller inputs ;;;
ElevatorControllerInputs:
; Indexed by parameter 1 (Speed in SMILE), which is multiplied by 2 in the init AI
; Down, Up
    dw $0400,$0800


;;; $94E6: Initialisation AI - enemy $D73F (elevator) ;;;
InitAI_Elevator:
    LDX.W EnemyIndex
    LDA.W #Spritemap_Common_Nothing : STA.W Enemy.spritemap,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    LDA.W #InstList_Elevator : STA.W Enemy.instList,X
    ASL.W Enemy.init0,X
    LDA.W Enemy.YPosition,X : STA.W Elevator.targetYPosition,X
    LDA.W ElevatorStatus : CMP.W #$0002 : BEQ .doorTransition
    STZ.W ElevatorProperties : STZ.W ElevatorStatus

  .doorTransition:
    LDA.W ElevatorProperties : ORA.W ElevatorStatus : BEQ .return
    LDX.W EnemyIndex ; >.<
    LDA.W Enemy.init1,X : STA.W Enemy.YPosition,X
    JSR PlaceSamusOnElevator

  .return:
    RTL


;;; $952A: Main AI / grapple AI / frozen AI - enemy $D73F (elevator) ;;;
MainAI_GrappleAI_FrozenAI_Elevator:
    LDA.W DoorTransitionFlagElevatorsZebetites : BNE .return
    LDA.W ElevatorProperties : ORA.W ElevatorStatus : BEQ .return
    LDA.W ElevatorStatus : ASL : TAX
    JSR.W (.pointers,X)

  .return:
    RTL

  .pointers:
    dw ElevatorAI_0_LeavingRoom
    dw ElevatorAI_1_LeavingRoom
    dw ElevatorAI_2_DoorTransition
    dw ElevatorAI_3_EnteringRoom


;;; $9548: Elevator AI - elevator status = 0: inactive ;;;
ElevatorAI_0_LeavingRoom:
    LDX.W EnemyIndex
    LDY.W Enemy.init0,X
    LDA.B DP_Controller1New : AND.W ElevatorControllerInputs,Y : BEQ .notRiding
    LDA.W #$000B
    JSL QueueSound_Lib3_Max6
    LDA.W #$0032
    JSL QueueSound_Lib1_Max6
    LDA.W #$0007
    JSL Run_Samus_Command
    JSL Reset_Projectile_Data
    JSR PlaceSamusOnElevator
    INC.W ElevatorStatus
    RTS

  .notRiding:
    STZ.W ElevatorProperties
    RTS


;;; $9579: Elevator AI - elevator status = 1: leaving room ;;;
ElevatorAI_1_LeavingRoom:
    LDX.W EnemyIndex
    LDA.W Enemy.init0,X : BNE .up
    LDA.W #$0000 : STA.W ElevatorDirection
    LDA.W Enemy.YSubPosition,X : CLC : ADC.W #$8000 : STA.W Enemy.YSubPosition,X
    LDA.W Enemy.YPosition,X : ADC.W #$0001 : STA.W Enemy.YPosition,X
    BRA +

  .up:
    LDA.W #$8000 : STA.W ElevatorDirection
    LDA.W Enemy.YSubPosition,X : SEC : SBC.W #$8000 : STA.W Enemy.YSubPosition,X
    LDA.W Enemy.YPosition,X : SBC.W #$0001 : STA.W Enemy.YPosition,X

+   JSR PlaceSamusOnElevator
    RTS


;;; $95B9: Elevator AI - elevator status = 2: door transition ;;;
ElevatorAI_2_DoorTransition:
    INC.W ElevatorStatus
; fallthrough to ElevatorAI_3_EnteringRoom


;;; $95BC: Elevator AI - elevator status = 3: entering room ;;;
ElevatorAI_3_EnteringRoom:
    LDX.W EnemyIndex
    LDA.W Enemy.init0,X : BEQ .down
    LDA.W Enemy.YSubPosition,X : CLC : ADC.W #$8000 : STA.W Enemy.YSubPosition,X
    LDA.W Enemy.YPosition,X : ADC.W #$0001 : STA.W Enemy.YPosition,X
    CMP.W Elevator.targetYPosition,X : BCS .reachedTarget
    BRA PlaceSamusOnElevator

  .down:
    LDA.W Enemy.YSubPosition,X : SEC : SBC.W #$8000 : STA.W Enemy.YSubPosition,X
    LDA.W Enemy.YPosition,X : SBC.W #$0001 : STA.W Enemy.YPosition,X
    CMP.W Elevator.targetYPosition,X : BCC .reachedTarget
    BRA PlaceSamusOnElevator

  .reachedTarget:
    STZ.W ElevatorStatus : STZ.W ElevatorProperties
    LDA.W #$0025
    JSL QueueSound_Lib3_Max6
    LDA.W Elevator.targetYPosition,X : STA.W Enemy.YPosition,X
    LDA.W #$000B
    JSL Run_Samus_Command
; fallthrough to PlaceSamusOnElevator


;;; $9612: Place Samus on top of elevator ;;;
PlaceSamusOnElevator:
    LDX.W EnemyIndex
    LDA.W Enemy.YPosition,X : SEC : SBC.W #$001A : STA.W SamusYPosition
    STZ.W SamusYSubPosition
    LDA.W Enemy.XPosition,X : STA.W SamusXPosition
    STZ.W SamusYSpeed : STZ.W SamusYSubSpeed
    RTS


;;; $962F: Spritemaps - elevator ;;;
Spritemap_Elevator_0:
    dw $0004
    %spritemapEntry(0, $1F2, $FC, 0, 1, 2, 5, $6C)
    %spritemapEntry(0, $06, $FC, 0, 1, 2, 5, $6C)
    %spritemapEntry(0, $00, $FC, 0, 1, 2, 5, $6C)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 5, $6C)

Spritemap_Elevator_1:
    dw $0004
    %spritemapEntry(0, $00, $FC, 0, 1, 2, 5, $6E)
    %spritemapEntry(0, $08, $FC, 0, 1, 2, 5, $6D)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 5, $6E)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 5, $6D)


;;; $965B: Palette - enemy $D77F (sciser) ;;;
Palette_Sciser:
    dw $3800,$3EDF,$0018,$000F,$0005,$01DD,$0118,$0093
    dw $002F,$7FE0,$7DA0,$48E0,$30A0,$3BE0,$2680,$1580


;;; $967B: Instruction list - sciser - upside right ;;;
InstList_Sciser_UpsideRight_0:
    dw Instruction_Crawlers_FunctionInY
    dw Function_Crawlers_CrawlingVertically

InstList_Sciser_UpsideRight_1:
    dw $0008,Spritemap_Sciser_UpsideRight_0
    dw $0008,Spritemap_Sciser_UpsideRight_1
    dw $0008,Spritemap_Sciser_UpsideRight_2
    dw $0008,Spritemap_Sciser_UpsideRight_1
    dw Instruction_Common_GotoY
    dw InstList_Sciser_UpsideRight_1


;;; $9693: Instruction list - sciser - upside left ;;;
InstList_Sciser_UpsideLeft_0:
    dw Instruction_Crawlers_FunctionInY
    dw Function_Crawlers_CrawlingVertically

InstList_Sciser_UpsideLeft_1:
    dw $0008,Spritemap_Sciser_UpsideLeft_0
    dw $0008,Spritemap_Sciser_UpsideLeft_1
    dw $0008,Spritemap_Sciser_UpsideLeft_2
    dw $0008,Spritemap_Sciser_UpsideLeft_1
    dw Instruction_Common_GotoY
    dw InstList_Sciser_UpsideLeft_1


;;; $96AB: Instruction list - sciser - upside down ;;;
InstList_Sciser_UpsideDown_0:
    dw Instruction_Crawlers_FunctionInY
    dw Function_Crawlers_CrawlingHorizontally

InstList_Sciser_UpsideDown_1:
    dw $0008,Spritemap_Sciser_UpsideDown_0
    dw $0008,Spritemap_Sciser_UpsideDown_1
    dw $0008,Spritemap_Sciser_UpsideDown_2
    dw $0008,Spritemap_Sciser_UpsideDown_1
    dw Instruction_Common_GotoY
    dw InstList_Sciser_UpsideDown_1


;;; $96C3: Instruction list - sciser - upside up ;;;
InstList_Sciser_UpsideUp_0:
    dw Instruction_Crawlers_FunctionInY
    dw Function_Crawlers_CrawlingHorizontally

InstList_Sciser_UpsideUp_1:
    dw $0008,Spritemap_Sciser_UpsideUp_0
    dw $0008,Spritemap_Sciser_UpsideUp_1
    dw $0008,Spritemap_Sciser_UpsideUp_2
    dw $0008,Spritemap_Sciser_UpsideUp_1
    dw Instruction_Common_GotoY
    dw InstList_Sciser_UpsideUp_1


;;; $96DB: Sciser initial instruction list pointers ;;;
InstListPointers_Sciser:
; Indexed by [enemy initialisation parameter] * 2
    dw InstList_Sciser_UpsideRight_0
    dw InstList_Sciser_UpsideLeft_0
    dw InstList_Sciser_UpsideDown_0
    dw InstList_Sciser_UpsideUp_0


;;; $96E3: Initialisation AI - enemy $D77F (sciser) ;;;
InitAI_Sciser:
    LDX.W EnemyIndex
    LDA.W #$0008 : STA.W Enemy.init1,X
    LDA.W Enemy.instList,X : AND.W #$0003 : ASL : TAY
    LDA.W InstListPointers_Sciser,Y : STA.W Enemy.instList,X
    JMP InitAI_Crawlers_Common


if !FEATURE_KEEP_UNREFERENCED
;;; $96FD: Unused. RTL ;;;
UNUSED_GetEnemyIndex_A396FD:
    LDX.W EnemyIndex
    RTL
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $9701: Unused. RTL ;;;
RTL_A39701:
    RTL


;;; $9702: Unused. RTL ;;;
RTL_A39702:
    RTL


;;; $9703: Sciser spritemaps ;;;
Spritemap_Sciser_UpsideUp_0:
    dw $0004
    %spritemapEntry(1, $1FF, $F3, 0, 1, 2, 0, $106)
    %spritemapEntry(1, $1F3, $F4, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $00, $FC, 0, 1, 2, 0, $104)
    %spritemapEntry(1, $1F0, $FC, 0, 0, 2, 0, $100)

Spritemap_Sciser_UpsideUp_1:
    dw $0004
    %spritemapEntry(1, $1FE, $F3, 0, 1, 2, 0, $106)
    %spritemapEntry(1, $1F2, $F3, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $00, $FB, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $1F0, $FB, 0, 0, 2, 0, $102)

Spritemap_Sciser_UpsideUp_2:
    dw $0004
    %spritemapEntry(1, $1FD, $F4, 0, 1, 2, 0, $106)
    %spritemapEntry(1, $1F1, $F3, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $00, $FC, 0, 1, 2, 0, $100)
    %spritemapEntry(1, $1F0, $FC, 0, 0, 2, 0, $104)

Spritemap_Sciser_UpsideRight_0:
    dw $0004
    %spritemapEntry(1, $1FD, $FF, 1, 0, 2, 0, $10E)
    %spritemapEntry(1, $1FC, $F3, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $1F4, $00, 1, 0, 2, 0, $10C)
    %spritemapEntry(1, $1F4, $F0, 0, 0, 2, 0, $108)

Spritemap_Sciser_UpsideRight_1:
    dw $0004
    %spritemapEntry(1, $1FD, $FE, 1, 0, 2, 0, $10E)
    %spritemapEntry(1, $1FD, $F2, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $1F5, $00, 1, 0, 2, 0, $10A)
    %spritemapEntry(1, $1F5, $F0, 0, 0, 2, 0, $10A)

Spritemap_Sciser_UpsideRight_2:
    dw $0004
    %spritemapEntry(1, $1FC, $FD, 1, 0, 2, 0, $10E)
    %spritemapEntry(1, $1FD, $F1, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $1F4, $00, 1, 0, 2, 0, $108)
    %spritemapEntry(1, $1F4, $F0, 0, 0, 2, 0, $10C)

Spritemap_Sciser_UpsideDown_0:
    dw $0004
    %spritemapEntry(1, $1FF, $FD, 1, 1, 2, 0, $106)
    %spritemapEntry(1, $1F3, $FC, 1, 0, 2, 0, $106)
    %spritemapEntry(1, $00, $F4, 1, 1, 2, 0, $104)
    %spritemapEntry(1, $1F0, $F4, 1, 0, 2, 0, $100)

Spritemap_Sciser_UpsideDown_1:
    dw $0004
    %spritemapEntry(1, $1FE, $FD, 1, 1, 2, 0, $106)
    %spritemapEntry(1, $1F2, $FD, 1, 0, 2, 0, $106)
    %spritemapEntry(1, $00, $F5, 1, 1, 2, 0, $102)
    %spritemapEntry(1, $1F0, $F5, 1, 0, 2, 0, $102)

Spritemap_Sciser_UpsideDown_2:
    dw $0004
    %spritemapEntry(1, $1FD, $FC, 1, 1, 2, 0, $106)
    %spritemapEntry(1, $1F1, $FD, 1, 0, 2, 0, $106)
    %spritemapEntry(1, $00, $F4, 1, 1, 2, 0, $100)
    %spritemapEntry(1, $1F0, $F4, 1, 0, 2, 0, $104)

Spritemap_Sciser_UpsideLeft_0:
    dw $0004
    %spritemapEntry(1, $1F3, $FF, 1, 1, 2, 0, $10E)
    %spritemapEntry(1, $1F4, $F3, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $1FC, $00, 1, 1, 2, 0, $10C)
    %spritemapEntry(1, $1FC, $F0, 0, 1, 2, 0, $108)

Spritemap_Sciser_UpsideLeft_1:
    dw $0004
    %spritemapEntry(1, $1F3, $FE, 1, 1, 2, 0, $10E)
    %spritemapEntry(1, $1F3, $F2, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $1FB, $00, 1, 1, 2, 0, $10A)
    %spritemapEntry(1, $1FB, $F0, 0, 1, 2, 0, $10A)

Spritemap_Sciser_UpsideLeft_2:
    dw $0004
    %spritemapEntry(1, $1F4, $FD, 1, 1, 2, 0, $10E)
    %spritemapEntry(1, $1F3, $F1, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $1FC, $00, 1, 1, 2, 0, $108)
    %spritemapEntry(1, $1FC, $F0, 0, 1, 2, 0, $10C)


;;; $980B: Palette - enemy $D7BF (zero) ;;;
Palette_Zero:
    dw $3800,$57F5,$4AEF,$1182,$00C0,$5752,$3EAD,$2E08
    dw $25C6,$03FD,$02D5,$020F,$0149,$3EDF,$0018,$000F


;;; $982B: Unused. Instruction list - zero - upside right - facing up ;;;
UNUSED_InstList_Zero_UpsideRight_FacingUp_A3982B:
    dw Instruction_Crawlers_FunctionInY
    dw Function_Crawlers_CrawlingVertically

UNUSED_InstList_Zero_UpsideRight_FacingUp_A3982F:
    dw $0004,Spritemap_Zero_UpsideRight_FacingUp_0
    dw $0004,Spritemap_Zero_UpsideRight_FacingUp_1
    dw $0004,Spritemap_Zero_UpsideRight_FacingUp_2
    dw $0004,Spritemap_Zero_UpsideRight_FacingUp_3
    dw $0004,Spritemap_Zero_UpsideRight_FacingUp_2
    dw $0004,Spritemap_Zero_UpsideRight_FacingUp_1
    dw Instruction_Common_GotoY
    dw UNUSED_InstList_Zero_UpsideRight_FacingUp_A3982F


;;; $984B: Instruction list - zero - upside right - facing down ;;;
InstList_Zero_UpsideRight_FacingDown_0:
    dw Instruction_Crawlers_FunctionInY
    dw Function_Crawlers_CrawlingVertically

InstList_Zero_UpsideRight_FacingDown_1:
    dw $0004,Spritemap_Zero_UpsideRight_FacingDown_0
    dw $0004,Spritemap_Zero_UpsideRight_FacingDown_1
    dw $0004,Spritemap_Zero_UpsideRight_FacingDown_2
    dw $0004,Spritemap_Zero_UpsideRight_FacingDown_3
    dw $0004,Spritemap_Zero_UpsideRight_FacingDown_2
    dw $0004,Spritemap_Zero_UpsideRight_FacingDown_1
    dw Instruction_Common_GotoY
    dw InstList_Zero_UpsideRight_FacingDown_1


;;; $986B: Unused. Instruction list - zero - upside left - facing down ;;;
UNUSED_InstList_Zero_UpsideLeft_FacingDown_A3986B:
    dw Instruction_Crawlers_FunctionInY
    dw Function_Crawlers_CrawlingVertically

UNUSED_InstList_Zero_UpsideLeft_FacingDown_A3986F:
    dw $0004,Spritemap_Zero_UpsideLeft_FacingDown_0
    dw $0004,Spritemap_Zero_UpsideLeft_FacingDown_1
    dw $0004,Spritemap_Zero_UpsideLeft_FacingDown_2
    dw $0004,Spritemap_Zero_UpsideLeft_FacingDown_3
    dw $0004,Spritemap_Zero_UpsideLeft_FacingDown_2
    dw $0004,Spritemap_Zero_UpsideLeft_FacingDown_1
    dw Instruction_Common_GotoY
    dw UNUSED_InstList_Zero_UpsideLeft_FacingDown_A3986F


;;; $988B: Instruction list - zero - upside left - facing up ;;;
InstList_Zero_UpsideLeft_FacingUp_0:
    dw Instruction_Crawlers_FunctionInY
    dw Function_Crawlers_CrawlingVertically

InstList_Zero_UpsideLeft_FacingUp_1:
    dw $0004,Spritemap_Zero_UpsideLeft_FacingUp_0
    dw $0004,Spritemap_Zero_UpsideLeft_FacingUp_1
    dw $0004,Spritemap_Zero_UpsideLeft_FacingUp_2
    dw $0004,Spritemap_Zero_UpsideLeft_FacingUp_3
    dw $0004,Spritemap_Zero_UpsideLeft_FacingUp_2
    dw $0004,Spritemap_Zero_UpsideLeft_FacingUp_1
    dw Instruction_Common_GotoY
    dw InstList_Zero_UpsideLeft_FacingUp_1


;;; $98AB: Instruction list - zero - upside down - facing left ;;;
InstList_Zero_UpsideDown_FacingLeft_0:
    dw Instruction_Crawlers_FunctionInY
    dw Function_Crawlers_CrawlingHorizontally

InstList_Zero_UpsideDown_FacingLeft_1:
    dw $0004,Spritemap_Zero_UpsideDown_FacingLeft_0
    dw $0004,Spritemap_Zero_UpsideDown_FacingLeft_1
    dw $0004,Spritemap_Zero_UpsideDown_FacingLeft_2
    dw $0004,Spritemap_Zero_UpsideDown_FacingLeft_3
    dw $0004,Spritemap_Zero_UpsideDown_FacingLeft_2
    dw $0004,Spritemap_Zero_UpsideDown_FacingLeft_1
    dw Instruction_Common_GotoY
    dw InstList_Zero_UpsideDown_FacingLeft_1


;;; $98CB: Unused. Instruction list - zero - upside up - facing left ;;;
UNUSED_InstList_Zero_UpsideUp_FacingLeft_A398CB:
    dw Instruction_Crawlers_FunctionInY
    dw Function_Crawlers_CrawlingHorizontally

UNUSED_InstList_Zero_UpsideUp_FacingLeft_A398CF:
    dw $0004,Spritemap_Zero_UpsideUp_FacingLeft_0
    dw $0004,Spritemap_Zero_UpsideUp_FacingLeft_1
    dw $0004,Spritemap_Zero_UpsideUp_FacingLeft_2
    dw $0004,Spritemap_Zero_UpsideUp_FacingLeft_3
    dw $0004,Spritemap_Zero_UpsideUp_FacingLeft_2
    dw $0004,Spritemap_Zero_UpsideUp_FacingLeft_1
    dw Instruction_Common_GotoY
    dw UNUSED_InstList_Zero_UpsideUp_FacingLeft_A398CF


;;; $98EB: Unused. Instruction list - zero - upside down - facing right ;;;
UNUSED_InstList_Zero_UpsideDown_FacingRight_A398EB:
    dw Instruction_Crawlers_FunctionInY
    dw Function_Crawlers_CrawlingHorizontally

UNUSED_InstList_Zero_UpsideDown_FacingRight_A398EF:
    dw $0004,Spritemap_Zero_UpsideDown_FacingRight_0
    dw $0004,Spritemap_Zero_UpsideDown_FacingRight_1
    dw $0004,Spritemap_Zero_UpsideDown_FacingRight_2
    dw $0004,Spritemap_Zero_UpsideDown_FacingRight_3
    dw $0004,Spritemap_Zero_UpsideDown_FacingRight_2
    dw $0004,Spritemap_Zero_UpsideDown_FacingRight_1
    dw Instruction_Common_GotoY
    dw UNUSED_InstList_Zero_UpsideDown_FacingRight_A398EF


;;; $990B: Instruction list - zero - upside up - facing right ;;;
UNUSED_InstList_Zero_UpsideUp_FacingRight_A3990B:
    dw Instruction_Crawlers_FunctionInY
    dw Function_Crawlers_CrawlingHorizontally

UNUSED_InstList_Zero_UpsideUp_FacingRight_A3990F:
    dw $0004,Spritemap_Zero_UpsideUp_FacingRight_0
    dw $0004,Spritemap_Zero_UpsideUp_FacingRight_1
    dw $0004,Spritemap_Zero_UpsideUp_FacingRight_2
    dw $0004,Spritemap_Zero_UpsideUp_FacingRight_3
    dw $0004,Spritemap_Zero_UpsideUp_FacingRight_2
    dw $0004,Spritemap_Zero_UpsideUp_FacingRight_1
    dw Instruction_Common_GotoY
    dw UNUSED_InstList_Zero_UpsideUp_FacingRight_A3990F


;;; $992B: Zero initial instruction list pointers ;;;
InitialInstListPointers_Zero:
    dw InstList_Zero_UpsideRight_FacingDown_0
    dw InstList_Zero_UpsideLeft_FacingUp_0
    dw InstList_Zero_UpsideDown_FacingLeft_0
    dw UNUSED_InstList_Zero_UpsideUp_FacingRight_A3990B
    dw UNUSED_InstList_Zero_UpsideRight_FacingUp_A3982B
    dw UNUSED_InstList_Zero_UpsideLeft_FacingDown_A3986B
    dw UNUSED_InstList_Zero_UpsideUp_FacingLeft_A398CB
    dw UNUSED_InstList_Zero_UpsideDown_FacingRight_A398EB


;;; $993B: Initialisation AI - enemy $D7BF (zero) ;;;
InitAI_Zero:
    LDX.W EnemyIndex
    LDA.W #$000A : STA.W Enemy.init1,X
    LDA.W Enemy.instList,X : AND.W #$0003 : ASL : TAY
    LDA.W InitialInstListPointers_Zero,Y : STA.W Enemy.instList,X
    JMP InitAI_Crawlers_Common


if !FEATURE_KEEP_UNREFERENCED
;;; $9955: Unused. RTL ;;;
UNUSED_GetEnemyIndex_A39955:
    LDX.W EnemyIndex
    RTL
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $9959: Unused. RTL ;;;
RTL_A39959:
    RTL


;;; $995A: Unused. RTL ;;;
RTL_A3995A:
    RTL


;;; $995B: Zero spritemaps ;;;
Spritemap_Zero_UpsideUp_FacingRight_0:
    dw $0003
    %spritemapEntry(1, $00, $F8, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $1FA, $F8, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F1, $F8, 0, 0, 2, 0, $100)

Spritemap_Zero_UpsideUp_FacingRight_1:
    dw $0003
    %spritemapEntry(1, $00, $F8, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $1FA, $F8, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F0, $F8, 0, 0, 2, 0, $100)

Spritemap_Zero_UpsideUp_FacingRight_2:
    dw $0003
    %spritemapEntry(1, $01, $F8, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $1FA, $F8, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1EF, $F8, 0, 0, 2, 0, $100)

Spritemap_Zero_UpsideUp_FacingRight_3:
    dw $0003
    %spritemapEntry(1, $02, $F8, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $1FA, $F8, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1EE, $F8, 0, 0, 2, 0, $100)

Spritemap_Zero_UpsideLeft_FacingUp_0:
    dw $0003
    %spritemapEntry(1, $1F8, $00, 0, 1, 2, 0, $10A)
    %spritemapEntry(1, $1F8, $FA, 0, 1, 2, 0, $108)
    %spritemapEntry(1, $1F8, $F1, 0, 1, 2, 0, $106)

Spritemap_Zero_UpsideLeft_FacingUp_1:
    dw $0003
    %spritemapEntry(1, $1F8, $00, 0, 1, 2, 0, $10A)
    %spritemapEntry(1, $1F8, $FA, 0, 1, 2, 0, $108)
    %spritemapEntry(1, $1F8, $F0, 0, 1, 2, 0, $106)

Spritemap_Zero_UpsideLeft_FacingUp_2:
    dw $0003
    %spritemapEntry(1, $1F8, $01, 0, 1, 2, 0, $10A)
    %spritemapEntry(1, $1F8, $FA, 0, 1, 2, 0, $108)
    %spritemapEntry(1, $1F8, $EF, 0, 1, 2, 0, $106)

Spritemap_Zero_UpsideLeft_FacingUp_3:
    dw $0003
    %spritemapEntry(1, $1F8, $02, 0, 1, 2, 0, $10A)
    %spritemapEntry(1, $1F8, $FA, 0, 1, 2, 0, $108)
    %spritemapEntry(1, $1F8, $EE, 0, 1, 2, 0, $106)

Spritemap_Zero_UpsideDown_FacingLeft_0:
    dw $0003
    %spritemapEntry(1, $1F0, $F8, 1, 1, 2, 0, $104)
    %spritemapEntry(1, $1F6, $F8, 1, 1, 2, 0, $102)
    %spritemapEntry(1, $1FF, $F8, 1, 1, 2, 0, $100)

Spritemap_Zero_UpsideDown_FacingLeft_1:
    dw $0003
    %spritemapEntry(1, $1F0, $F8, 1, 1, 2, 0, $104)
    %spritemapEntry(1, $1F6, $F8, 1, 1, 2, 0, $102)
    %spritemapEntry(1, $00, $F8, 1, 1, 2, 0, $100)

Spritemap_Zero_UpsideDown_FacingLeft_2:
    dw $0003
    %spritemapEntry(1, $1EF, $F8, 1, 1, 2, 0, $104)
    %spritemapEntry(1, $1F6, $F8, 1, 1, 2, 0, $102)
    %spritemapEntry(1, $01, $F8, 1, 1, 2, 0, $100)

Spritemap_Zero_UpsideDown_FacingLeft_3:
    dw $0003
    %spritemapEntry(1, $1EE, $F8, 1, 1, 2, 0, $104)
    %spritemapEntry(1, $1F6, $F8, 1, 1, 2, 0, $102)
    %spritemapEntry(1, $02, $F8, 1, 1, 2, 0, $100)

Spritemap_Zero_UpsideLeft_FacingDown_0:
    dw $0003
    %spritemapEntry(1, $1F8, $F0, 1, 1, 2, 0, $10A)
    %spritemapEntry(1, $1F8, $F6, 1, 1, 2, 0, $108)
    %spritemapEntry(1, $1F8, $FF, 1, 1, 2, 0, $106)

Spritemap_Zero_UpsideLeft_FacingDown_1:
    dw $0003
    %spritemapEntry(1, $1F8, $F0, 1, 1, 2, 0, $10A)
    %spritemapEntry(1, $1F8, $F6, 1, 1, 2, 0, $108)
    %spritemapEntry(1, $1F8, $00, 1, 1, 2, 0, $106)

Spritemap_Zero_UpsideLeft_FacingDown_2:
    dw $0003
    %spritemapEntry(1, $1F8, $EF, 1, 1, 2, 0, $10A)
    %spritemapEntry(1, $1F8, $F6, 1, 1, 2, 0, $108)
    %spritemapEntry(1, $1F8, $01, 1, 1, 2, 0, $106)

Spritemap_Zero_UpsideLeft_FacingDown_3:
    dw $0003
    %spritemapEntry(1, $1F8, $EE, 1, 1, 2, 0, $10A)
    %spritemapEntry(1, $1F8, $F6, 1, 1, 2, 0, $108)
    %spritemapEntry(1, $1F8, $02, 1, 1, 2, 0, $106)

Spritemap_Zero_UpsideUp_FacingLeft_0:
    dw $0003
    %spritemapEntry(1, $00, $F8, 1, 0, 2, 0, $104)
    %spritemapEntry(1, $1FA, $F8, 1, 0, 2, 0, $102)
    %spritemapEntry(1, $1F1, $F8, 1, 0, 2, 0, $100)

Spritemap_Zero_UpsideUp_FacingLeft_1:
    dw $0003
    %spritemapEntry(1, $00, $F8, 1, 0, 2, 0, $104)
    %spritemapEntry(1, $1FA, $F8, 1, 0, 2, 0, $102)
    %spritemapEntry(1, $1F0, $F8, 1, 0, 2, 0, $100)

Spritemap_Zero_UpsideUp_FacingLeft_2:
    dw $0003
    %spritemapEntry(1, $01, $F8, 1, 0, 2, 0, $104)
    %spritemapEntry(1, $1FA, $F8, 1, 0, 2, 0, $102)
    %spritemapEntry(1, $1EF, $F8, 1, 0, 2, 0, $100)

Spritemap_Zero_UpsideUp_FacingLeft_3:
    dw $0003
    %spritemapEntry(1, $02, $F8, 1, 0, 2, 0, $104)
    %spritemapEntry(1, $1FA, $F8, 1, 0, 2, 0, $102)
    %spritemapEntry(1, $1EE, $F8, 1, 0, 2, 0, $100)

Spritemap_Zero_UpsideRight_FacingUp_0:
    dw $0003
    %spritemapEntry(1, $1F8, $00, 0, 0, 2, 0, $10A)
    %spritemapEntry(1, $1F8, $FA, 0, 0, 2, 0, $108)
    %spritemapEntry(1, $1F8, $F1, 0, 0, 2, 0, $106)

Spritemap_Zero_UpsideRight_FacingUp_1:
    dw $0003
    %spritemapEntry(1, $1F8, $00, 0, 0, 2, 0, $10A)
    %spritemapEntry(1, $1F8, $FA, 0, 0, 2, 0, $108)
    %spritemapEntry(1, $1F8, $F0, 0, 0, 2, 0, $106)

Spritemap_Zero_UpsideRight_FacingUp_2:
    dw $0003
    %spritemapEntry(1, $1F8, $01, 0, 0, 2, 0, $10A)
    %spritemapEntry(1, $1F8, $FA, 0, 0, 2, 0, $108)
    %spritemapEntry(1, $1F8, $EF, 0, 0, 2, 0, $106)

Spritemap_Zero_UpsideRight_FacingUp_3:
    dw $0003
    %spritemapEntry(1, $1F8, $02, 0, 0, 2, 0, $10A)
    %spritemapEntry(1, $1F8, $FA, 0, 0, 2, 0, $108)
    %spritemapEntry(1, $1F8, $EE, 0, 0, 2, 0, $106)

Spritemap_Zero_UpsideDown_FacingRight_0:
    dw $0003
    %spritemapEntry(1, $1F0, $F8, 0, 1, 2, 0, $104)
    %spritemapEntry(1, $1F6, $F8, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $1FF, $F8, 0, 1, 2, 0, $100)

Spritemap_Zero_UpsideDown_FacingRight_1:
    dw $0003
    %spritemapEntry(1, $1F0, $F8, 0, 1, 2, 0, $104)
    %spritemapEntry(1, $1F6, $F8, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $00, $F8, 0, 1, 2, 0, $100)

Spritemap_Zero_UpsideDown_FacingRight_2:
    dw $0003
    %spritemapEntry(1, $1EF, $F8, 0, 1, 2, 0, $104)
    %spritemapEntry(1, $1F6, $F8, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $01, $F8, 0, 1, 2, 0, $100)

Spritemap_Zero_UpsideDown_FacingRight_3:
    dw $0003
    %spritemapEntry(1, $1EE, $F8, 0, 1, 2, 0, $104)
    %spritemapEntry(1, $1F6, $F8, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $02, $F8, 0, 1, 2, 0, $100)

Spritemap_Zero_UpsideRight_FacingDown_0:
    dw $0003
    %spritemapEntry(1, $1F8, $F0, 1, 0, 2, 0, $10A)
    %spritemapEntry(1, $1F8, $F6, 1, 0, 2, 0, $108)
    %spritemapEntry(1, $1F8, $FF, 1, 0, 2, 0, $106)

Spritemap_Zero_UpsideRight_FacingDown_1:
    dw $0003
    %spritemapEntry(1, $1F8, $F0, 1, 0, 2, 0, $10A)
    %spritemapEntry(1, $1F8, $F6, 1, 0, 2, 0, $108)
    %spritemapEntry(1, $1F8, $00, 1, 0, 2, 0, $106)

Spritemap_Zero_UpsideRight_FacingDown_2:
    dw $0003
    %spritemapEntry(1, $1F8, $EF, 1, 0, 2, 0, $10A)
    %spritemapEntry(1, $1F8, $F6, 1, 0, 2, 0, $108)
    %spritemapEntry(1, $1F8, $01, 1, 0, 2, 0, $106)

Spritemap_Zero_UpsideRight_FacingDown_3:
    dw $0003
    %spritemapEntry(1, $1F8, $EE, 1, 0, 2, 0, $10A)
    %spritemapEntry(1, $1F8, $F6, 1, 0, 2, 0, $108)
    %spritemapEntry(1, $1F8, $02, 1, 0, 2, 0, $106)


;;; $9B7B: Palette - enemy $D7FF (tripper) ;;;
Palette_Tripper:
    dw $3800,$3F57,$2E4D,$00E2,$0060,$3AB0,$220B,$1166
    dw $0924,$7F5A,$7EC0,$6DE0,$54E0,$03FF,$0237,$00D1


;;; $9B9B: Palette - enemy $D83F (suspensor platform) ;;;
Palette_Kamer2:
    dw $3800,$7F5A,$3BE0,$2680,$0920,$4F5A,$36B5,$2610
    dw $1DCE,$5294,$39CE,$2108,$1084,$033B,$0216,$0113


;;; $9BBB: Instruction list - suspensor platform - vertically moving - moving left ;;;
InstList_Kamer2_VerticallyMoving_Left_0:
    dw Instruction_Tripper_Kamer2_SetMovingLeftXMovement_duplicate

InstList_Kamer2_VerticallyMoving_Left_1:
    dw $000A,Spritemap_Kamer2_0
    dw $000A,Spritemap_Kamer2_1
    dw $000A,Spritemap_Kamer2_2
    dw $000A,Spritemap_Kamer2_3
    dw Instruction_Common_GotoY
    dw InstList_Kamer2_VerticallyMoving_Left_1


;;; $9BD1: Instruction list - suspensor platform - vertically moving - moving right ;;;
InstList_Kamer2_VerticallyMoving_Right_0:
    dw Instruction_Tripper_Kamer2_SetMovingRightXMovement_duplicate

InstList_Kamer2_VerticallyMoving_Right_1:
    dw $000A,Spritemap_Kamer2_0
    dw $000A,Spritemap_Kamer2_1
    dw $000A,Spritemap_Kamer2_2
    dw $000A,Spritemap_Kamer2_3
    dw Instruction_Common_GotoY
    dw InstList_Kamer2_VerticallyMoving_Right_1


;;; $9BE7: Instruction list - suspensor platform - vertically still - moving left ;;;
InstList_Kamer2_VerticallyStill_Left_0:
    dw Instruction_Tripper_Kamer2_SetMovingLeftXMovement

InstList_Kamer2_VerticallyStill_Left_1:
    dw $000A,Spritemap_Kamer2_0
    dw $000A,Spritemap_Kamer2_1
    dw $000A,Spritemap_Kamer2_2
    dw $000A,Spritemap_Kamer2_3
    dw Instruction_Common_GotoY
    dw InstList_Kamer2_VerticallyStill_Left_1


;;; $9BFD: Instruction list - suspensor platform - vertically still - moving right ;;;
InstList_Kamer2_VerticallyStill_Right_0:
    dw Instruction_Tripper_Kamer2_SetMovingRightXMovement

InstList_Kamer2_VerticallyStill_Right_1:
    dw $000A,Spritemap_Kamer2_0
    dw $000A,Spritemap_Kamer2_1
    dw $000A,Spritemap_Kamer2_2
    dw $000A,Spritemap_Kamer2_3
    dw Instruction_Common_GotoY
    dw InstList_Kamer2_VerticallyStill_Right_1


;;; $9C13: Instruction list - tripper - vertically moving - moving left ;;;
InstList_Tripper_VerticallyMoving_Left_0:
    dw Instruction_Tripper_Kamer2_SetMovingLeftXMovement_duplicate

InstList_Tripper_VerticallyMoving_Left_1:
    dw $0007,Spritemap_Tripper_VerticallyMoving_Left_0
    dw $0008,Spritemap_Tripper_VerticallyMoving_Left_1
    dw $0007,Spritemap_Tripper_VerticallyMoving_Left_0
    dw $0008,Spritemap_Tripper_VerticallyMoving_Left_2
    dw Instruction_Common_GotoY
    dw InstList_Tripper_VerticallyMoving_Left_1


;;; $9C29: Instruction list - tripper - vertically moving - moving right ;;;
InstList_Tripper_VerticallyMoving_Right_0:
    dw Instruction_Tripper_Kamer2_SetMovingRightXMovement_duplicate

InstList_Tripper_VerticallyMoving_Right_1:
    dw $0007,Spritemap_Tripper_VerticallyMoving_Right_0
    dw $0008,Spritemap_Tripper_VerticallyMoving_Right_1
    dw $0007,Spritemap_Tripper_VerticallyMoving_Right_0
    dw $0008,Spritemap_Tripper_VerticallyMoving_Right_2
    dw Instruction_Common_GotoY
    dw InstList_Tripper_VerticallyMoving_Right_1


;;; $9C3F: Instruction list - tripper - vertically still - moving right ;;;
InstList_Tripper_VerticallyStill_Right_0:
    dw Instruction_Tripper_Kamer2_SetMovingLeftXMovement

InstList_Tripper_VerticallyStill_Right_1:
    dw $0007,Spritemap_Tripper_VerticallyStill_Right_0
    dw $0008,Spritemap_Tripper_VerticallyStill_Right_1
    dw $0007,Spritemap_Tripper_VerticallyStill_Right_0
    dw $0008,Spritemap_Tripper_VerticallyStill_Right_2
    dw Instruction_Common_GotoY
    dw InstList_Tripper_VerticallyStill_Right_1


;;; $9C55: Instruction list - tripper - vertically still - moving left ;;;
InstList_Tripper_VerticallyStill_Left_0:
    dw Instruction_Tripper_Kamer2_SetMovingRightXMovement

InstList_Tripper_VerticallyStill_Left_1:
    dw $0007,Spritemap_Tripper_VerticallyStill_Left_0
    dw $0008,Spritemap_Tripper_VerticallyStill_Left_1
    dw $0007,Spritemap_Tripper_VerticallyStill_Left_0
    dw $0008,Spritemap_Tripper_VerticallyStill_Left_2
    dw Instruction_Common_GotoY
    dw InstList_Tripper_VerticallyStill_Left_1


;;; $9C6B: Instruction - set moving left X movement ;;;
Instruction_Tripper_Kamer2_SetMovingLeftXMovement:
    LDX.W EnemyIndex
    LDA.W #$0000 : STA.L Platform.XMovementFunctionIndex,X
    RTL


;;; $9C76: Instruction - set moving right X movement ;;;
Instruction_Tripper_Kamer2_SetMovingRightXMovement:
    LDX.W EnemyIndex
    LDA.W #$0001 : STA.L Platform.XMovementFunctionIndex,X
    RTL


;;; $9C81: Instruction - set moving left X movement ;;;
Instruction_Tripper_Kamer2_SetMovingLeftXMovement_duplicate:
; Clone of Instruction_Tripper_Kamer2_SetMovingLeftXMovement
    LDX.W EnemyIndex
    LDA.W #$0000 : STA.L Platform.XMovementFunctionIndex,X
    RTL


;;; $9C8C: Instruction - set moving right X movement ;;;
Instruction_Tripper_Kamer2_SetMovingRightXMovement_duplicate:
; Clone of Instruction_Tripper_Kamer2_SetMovingRightXMovement
    LDX.W EnemyIndex
    LDA.W #$0001 : STA.L Platform.XMovementFunctionIndex,X
    RTL


;;; $9C97: Tripper / suspensor platform movement function pointers ;;;
FunctionPointers_Tripper_Kamer2:
  .XMovement:
; X movement function pointers
    dw Function_Tripper_Kamer2_XMovement_0_MovingLeft
    dw Function_Tripper_Kamer2_XMovement_1_MovingRight

  .YMovement:
; Y movement function pointers
    dw Function_Tripper_Kamer2_YMovement_Rising
    dw Function_Tripper_Kamer2_YMovement_1_Sinking


;;; $9C9F: Initialisation AI - enemy $D83F (suspensor platform) ;;;
InitAI_Kamer2:
    LDX.W EnemyIndex
    LDA.W #$FFFF : STA.L Platform.suspensorPlatformFlag,X
    LDY.W #InstList_Kamer2_VerticallyStill_Left_0
    LDA.W Enemy.init0,X : STA.L Platform.XMovementFunctionIndex,X : BEQ InitAI_Tripper_Kamer2_Common
    LDY.W #InstList_Kamer2_VerticallyStill_Right_0
    BRA InitAI_Tripper_Kamer2_Common


;;; $9CBA: Initialisation AI - enemy $D7FF (tripper) ;;;
InitAI_Tripper:
    LDX.W EnemyIndex
    LDY.W #InstList_Tripper_VerticallyStill_Right_0
    LDA.W Enemy.init0,X : STA.L Platform.XMovementFunctionIndex,X : BEQ InitAI_Tripper_Kamer2_Common
    LDY.W #InstList_Tripper_VerticallyStill_Left_0                
       ; fallthrough to InitAI_Tripper_Kamer2_Common


;;; $9CCC: Tripper / suspensor platform common initialisation AI ;;;
InitAI_Tripper_Kamer2_Common:
    TYA : STA.W Enemy.instList,X
    LDA.W Enemy.init1,X : AND.W #$00FF : ASL #3 : TAY
    LDA.W CommonEnemySpeeds_LinearlyIncreasing,Y : STA.W Platform.rightVelocity,X
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+2,Y : STA.W Platform.rightSubVelocity,X
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+4,Y : STA.W Platform.leftVelocity,X
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+6,Y : STA.W Platform.leftSubVelocity,X
    LDA.W #$0000 : STA.L Platform.YMovementFunctionIndex,X
    STA.L Platform.verticallyMovingFlag,X : STA.L Platform.verticallyStillFlag,X
    LDA.W Enemy.YPosition,X : INC : STA.W Platform.targetYPosition,X
    STZ.W Platform.YSpeedTableIndex,X
    LDA.W Enemy.init1+1,X : AND.W #$00FF : STA.L Platform.maximumYSpeedTableIndex,X
    RTL


;;; $9D16: Main AI - enemy $D7FF/$D83F (tripper / suspensor platform) ;;;
MainAI_Tripper_Kamer2:
    LDX.W EnemyIndex
    LDA.W #$0000 : STA.L Platform.YMovementFunctionIndex,X
    JSL CheckIfEnemyIsTouchingSamusFromBelow
    BEQ .SamusNotRiding
    LDA.W #$0001 : STA.L Platform.YMovementFunctionIndex,X

  .SamusNotRiding:
    LDX.W EnemyIndex
    LDA.L Platform.XMovementFunctionIndex,X : ASL : TAX
    JSR.W (FunctionPointers_Tripper_Kamer2_XMovement,X)
    LDX.W EnemyIndex
    LDA.L Platform.YMovementFunctionIndex,X : ASL : TAX
    JSR.W (FunctionPointers_Tripper_Kamer2_YMovement,X)
    LDX.W EnemyIndex
    LDA.L Platform.YMovementFunctionIndex,X : CMP.L Platform.previousYMovementFunctionIndex,X : BEQ .noChange
    STZ.W Platform.YSpeedTableIndex,X

  .noChange:
    LDA.L Platform.YMovementFunctionIndex,X : STA.L Platform.previousYMovementFunctionIndex,X
    RTL


;;; $9D5E: Tripper / suspensor platform X movement function - index 0: moving left ;;;
Function_Tripper_Kamer2_XMovement_0_MovingLeft:
    LDX.W EnemyIndex
    LDA.W Enemy.XPosition,X : STA.L Platform.previousPosition,X
    LDA.W Platform.leftSubVelocity,X : STA.B DP_Temp12
    LDA.W Platform.leftVelocity,X : STA.B DP_Temp14
    JSL MoveEnemyRightBy_14_12_IgnoreSlopes
    BCC .return
    LDA.W #$0001 : STA.L Platform.XMovementFunctionIndex,X
    JSR SetPlatformInstList_VerticallyStill_MovingRight

  .return:
    RTS


;;; $9D83: Tripper / suspensor platform X movement function - index 1: moving right ;;;
Function_Tripper_Kamer2_XMovement_1_MovingRight:
    LDX.W EnemyIndex
    LDA.W Enemy.XPosition,X : STA.L Platform.previousPosition,X
    LDA.W Platform.rightSubVelocity,X : STA.B DP_Temp12
    LDA.W Platform.rightVelocity,X : STA.B DP_Temp14
    JSL MoveEnemyRightBy_14_12_IgnoreSlopes
    BCC .return
    LDA.W #$0000 : STA.L Platform.XMovementFunctionIndex,X
    JSR SetPlatformInstList_VerticallyStill_MovingLeft

  .return:
    RTS


;;; $9DA8: Tripper / suspensor platform Y movement function - index 0: rising ;;;
Function_Tripper_Kamer2_YMovement_Rising:
    LDX.W EnemyIndex
    LDA.W Enemy.YPosition,X : CMP.W Platform.targetYPosition,X : BMI .notMoving
    JSR SetPlatformInstList_VerticallyMoving
    INC.W Platform.YSpeedTableIndex,X
    LDA.W Platform.YSpeedTableIndex,X : CMP.L Platform.maximumYSpeedTableIndex,X : BMI +
    LDA.L Platform.maximumYSpeedTableIndex,X : STA.W Platform.YSpeedTableIndex,X

+   ASL #3 : TAY
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing+4,Y : STA.B DP_Temp12
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing+6,Y : STA.B DP_Temp14
    JSL MoveEnemyDownBy_14_12
    BCC .return

  .notMoving:
    STZ.W Platform.YSpeedTableIndex,X
    JSR SetPlatformInstList_VerticallyStill

  .return:
    RTS


;;; $9DE4: Tripper / suspensor platform Y movement function - index 1: sinking ;;;
Function_Tripper_Kamer2_YMovement_1_Sinking:
    LDX.W EnemyIndex
    LDA.W Enemy.YPosition,X : CMP.W Platform.targetYPosition,X ; >_<
    JSR RTS_A39E46 ; >_<
    INC.W Platform.YSpeedTableIndex,X
    LDA.W Platform.YSpeedTableIndex,X : CMP.L Platform.maximumYSpeedTableIndex,X : BMI +
    LDA.L Platform.maximumYSpeedTableIndex,X : STA.W Platform.YSpeedTableIndex,X

+   LDA.W Enemy.XPosition,X : SEC : SBC.L Platform.previousPosition,X
    CLC : ADC.W ExtraSamusXDisplacement : STA.W ExtraSamusXDisplacement
    LDA.W Enemy.YPosition,X : STA.L Platform.previousPosition,X
    LDA.W Platform.YSpeedTableIndex,X : ASL #3 : TAY
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing,Y : STA.B DP_Temp12
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing+2,Y : STA.B DP_Temp14
    JSL MoveEnemyDownBy_14_12
    BCC .notCollidedWithBlock
    STZ.W Platform.YSpeedTableIndex,X
    JSR SetPlatformInstList_VerticallyStill

  .notCollidedWithBlock:
    LDA.W Enemy.YPosition,X : SEC : SBC.L Platform.previousPosition,X
    CLC : ADC.W ExtraSamusYDisplacement : STA.W ExtraSamusYDisplacement
    RTS


;;; $9E46: RTS ;;;
RTS_A39E46:
    RTS


;;; $9E47: Set tripper / suspensor platform instruction list - vertically moving - moving left ;;;
SetPlatformInstList_VerticallyMoving_MovingLeft:
    LDX.W EnemyIndex
    LDY.W #InstList_Tripper_VerticallyMoving_Left_0
    LDA.L Platform.suspensorPlatformFlag,X : BPL .Tripper
    LDY.W #InstList_Kamer2_VerticallyMoving_Left_0

  .Tripper:
    TYA : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    RTS


;;; $9E64: Set tripper / suspensor platform instruction list - vertically moving - moving right ;;;
SetPlatformInstList_VerticallyMoving_MovingRight:
    LDX.W EnemyIndex
    LDY.W #InstList_Tripper_VerticallyMoving_Right_0
    LDA.L Platform.suspensorPlatformFlag,X : BPL .Tripper
    LDY.W #InstList_Kamer2_VerticallyMoving_Right_0

  .Tripper:
    TYA : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    RTS


;;; $9E81: Set vertically moving instruction list - vertically still - moving left ;;;
SetPlatformInstList_VerticallyStill_MovingLeft:
    LDX.W EnemyIndex
    LDY.W #InstList_Tripper_VerticallyStill_Right_0
    LDA.L Platform.suspensorPlatformFlag,X : BPL .Tripper
    LDY.W #InstList_Kamer2_VerticallyStill_Left_0

  .Tripper:
    TYA : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    RTS


;;; $9E9E: Set vertically moving instruction list - vertically still - moving right ;;;
SetPlatformInstList_VerticallyStill_MovingRight:
    LDX.W EnemyIndex
    LDY.W #InstList_Tripper_VerticallyStill_Left_0
    LDA.L Platform.suspensorPlatformFlag,X : BPL .Tripper
    LDY.W #InstList_Kamer2_VerticallyStill_Right_0

  .Tripper:
    TYA : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    RTS


;;; $9EBB: Set tripper / suspensor platform instruction list - vertically moving ;;;
SetPlatformInstList_VerticallyMoving:
    LDX.W EnemyIndex
    LDA.L Platform.verticallyMovingFlag,X : BNE .merge
    LDA.W #$0001 : STA.L Platform.verticallyMovingFlag,X
    LDA.L Platform.XMovementFunctionIndex,X : BEQ .movingLeft
    JSR SetPlatformInstList_VerticallyMoving_MovingRight
    BRA .merge

  .movingLeft:
    JSR SetPlatformInstList_VerticallyMoving_MovingLeft

  .merge:
    LDA.W #$0000 : STA.L Platform.verticallyStillFlag,X
    RTS


;;; $9EE1: Set tripper / suspensor platform instruction list - vertically still ;;;
SetPlatformInstList_VerticallyStill:
    LDX.W EnemyIndex
    LDA.L Platform.verticallyStillFlag,X : BNE .merge
    LDA.W #$0001 : STA.L Platform.verticallyStillFlag,X
    LDA.L Platform.XMovementFunctionIndex,X : BEQ .movingLeft
    JSR SetPlatformInstList_VerticallyStill_MovingRight
    BRA .merge

  .movingLeft:
    JSR SetPlatformInstList_VerticallyStill_MovingLeft

  .merge:
    LDA.W #$0000 : STA.L Platform.verticallyMovingFlag,X
    RTS


;;; $9F07: RTL. Enemy touch - enemy $D7FF/$D83F (tripper / suspensor platform) ;;;
RTL_A39F07:
    RTL


;;; $9F08: Enemy shot - enemy $D7FF (tripper) ;;;
EnemyShot_Tripper:
    JSL CommonA3_NormalEnemyShotAI
    LDX.W EnemyIndex
    LDA.W Enemy.freezeTimer,X : BEQ .return
    LDA.L Platform.XMovementFunctionIndex,X : BEQ .movingLeft
    LDA.W #Spritemap_Tripper_Frozen_MovingRight : STA.W Enemy.spritemap,X
    BRA .return


  .movingLeft:
    LDA.W #Spritemap_Tripper_Frozen_MovingLeft : STA.W Enemy.spritemap,X

  .return:
    RTL


;;; $9F29: Tripper / suspensor platform spritemaps ;;;
Spritemap_Tripper_VerticallyMoving_Left_0:
    dw $0003
    %spritemapEntry(0, $1F9, $08, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $4200, $F8, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $43F0, $F8, 0, 0, 2, 0, $100)

Spritemap_Tripper_VerticallyMoving_Left_1:
    dw $0003
    %spritemapEntry(1, $4200, $F8, 0, 0, 2, 0, $102)
    %spritemapEntry(0, $1F9, $08, 0, 0, 2, 0, $10F)
    %spritemapEntry(1, $43F0, $F8, 0, 0, 2, 0, $108)

Spritemap_Tripper_VerticallyMoving_Left_2:
    dw $0003
    %spritemapEntry(1, $4200, $F8, 0, 0, 2, 0, $102)
    %spritemapEntry(0, $1F9, $08, 0, 0, 2, 0, $10F)
    %spritemapEntry(1, $43F0, $F8, 0, 0, 2, 0, $104)

Spritemap_Tripper_VerticallyMoving_Right_0:
    dw $0003
    %spritemapEntry(0, $1FF, $08, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $43F0, $F8, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $4200, $F8, 0, 1, 2, 0, $100)

Spritemap_Tripper_VerticallyMoving_Right_1:
    dw $0003
    %spritemapEntry(1, $43F0, $F8, 0, 1, 2, 0, $102)
    %spritemapEntry(0, $1FF, $08, 0, 1, 2, 0, $10F)
    %spritemapEntry(1, $4200, $F8, 0, 1, 2, 0, $108)

Spritemap_Tripper_VerticallyMoving_Right_2:
    dw $0003
    %spritemapEntry(1, $43F0, $F8, 0, 1, 2, 0, $102)
    %spritemapEntry(0, $1FF, $08, 0, 1, 2, 0, $10F)
    %spritemapEntry(1, $4200, $F8, 0, 1, 2, 0, $104)

Spritemap_Tripper_VerticallyStill_Right_0:
    dw $0004
    %spritemapEntry(1, $4200, $F8, 0, 0, 2, 0, $102)
    %spritemapEntry(0, $0B, $02, 0, 0, 2, 0, $11D)
    %spritemapEntry(0, $03, $02, 0, 0, 2, 0, $11C)
    %spritemapEntry(1, $43F0, $F8, 0, 0, 2, 0, $100)

Spritemap_Tripper_VerticallyStill_Right_1:
    dw $0003
    %spritemapEntry(1, $4200, $F8, 0, 0, 2, 0, $102)
    %spritemapEntry(0, $02, $02, 0, 0, 2, 0, $11E)
    %spritemapEntry(1, $43F0, $F8, 0, 0, 2, 0, $104)

Spritemap_Tripper_VerticallyStill_Right_2:
    dw $0004
    %spritemapEntry(1, $4200, $F8, 0, 0, 2, 0, $102)
    %spritemapEntry(0, $0B, $02, 0, 0, 2, 0, $10D)
    %spritemapEntry(0, $03, $02, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $43F0, $F8, 0, 0, 2, 0, $108)

Spritemap_Tripper_VerticallyStill_Left_0:
    dw $0004
    %spritemapEntry(1, $43F0, $F8, 0, 1, 2, 0, $102)
    %spritemapEntry(0, $1ED, $02, 0, 1, 2, 0, $11D)
    %spritemapEntry(0, $1F5, $02, 0, 1, 2, 0, $11C)
    %spritemapEntry(1, $4200, $F8, 0, 1, 2, 0, $100)

Spritemap_Tripper_VerticallyStill_Left_1:
    dw $0003
    %spritemapEntry(1, $43F0, $F8, 0, 1, 2, 0, $102)
    %spritemapEntry(0, $1F6, $02, 0, 1, 2, 0, $11E)
    %spritemapEntry(1, $4200, $F8, 0, 1, 2, 0, $104)

Spritemap_Tripper_VerticallyStill_Left_2:
    dw $0004
    %spritemapEntry(1, $43F0, $F8, 0, 1, 2, 0, $102)
    %spritemapEntry(0, $1ED, $02, 0, 1, 2, 0, $10D)
    %spritemapEntry(0, $1F5, $02, 0, 1, 2, 0, $10C)
    %spritemapEntry(1, $4200, $F8, 0, 1, 2, 0, $108)

Spritemap_Tripper_Frozen_MovingLeft:
    dw $0002
    %spritemapEntry(1, $00, $F8, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F0, $F8, 0, 0, 2, 0, $108)

Spritemap_Tripper_Frozen_MovingRight:
    dw $0002
    %spritemapEntry(1, $1F0, $F8, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $00, $F8, 0, 1, 2, 0, $108)

Spritemap_Kamer2_0:
    dw $0002
    %spritemapEntry(1, $00, $F8, 0, 1, 2, 0, $100)
    %spritemapEntry(1, $1F0, $F8, 0, 0, 2, 0, $100)

Spritemap_Kamer2_1:
    dw $0002
    %spritemapEntry(1, $00, $F8, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $1F0, $F8, 0, 0, 2, 0, $102)

Spritemap_Kamer2_2:
    dw $0002
    %spritemapEntry(1, $00, $F8, 0, 1, 2, 0, $104)
    %spritemapEntry(1, $1F0, $F8, 0, 0, 2, 0, $104)

Spritemap_Kamer2_3:
    dw $0002
    %spritemapEntry(1, $00, $F8, 0, 1, 2, 0, $106)
    %spritemapEntry(1, $1F0, $F8, 0, 0, 2, 0, $106)


;;; $A051: Palette - enemy $D87F/$D8BF (roach) ;;;
Palette_Sbug:
    dw $3800,$3F57,$2E4D,$00E2,$0060,$3AB0,$220B,$1166
    dw $0924,$435A,$3694,$15AD,$0508,$03FF,$0237,$00D1


;;; $A071: Instruction list - facing up ;;;
InstList_Sbug_FacingUp:
    dw $0005,Spritemap_Sbug_FacingUp_0
    dw $0005,Spritemap_Sbug_FacingUp_1
    dw $0005,Spritemap_Sbug_FacingUp_0
    dw $0005,Spritemap_Sbug_FacingUp_2
    dw Instruction_Common_GotoY
    dw InstList_Sbug_FacingUp


;;; $A085: Instruction list - facing up-left ;;;
InstList_Sbug_FacingUpLeft:
    dw $0005,Spritemap_Sbug_FacingUpLeft_0
    dw $0005,Spritemap_Sbug_FacingUpLeft_1
    dw $0005,Spritemap_Sbug_FacingUpLeft_0
    dw $0005,Spritemap_Sbug_FacingUpLeft_2
    dw Instruction_Common_GotoY
    dw InstList_Sbug_FacingUpLeft


;;; $A099: Instruction list - facing left ;;;
InstList_Sbug_FacingLeft:
    dw $0005,Spritemap_Sbug_FacingLeft_0
    dw $0005,Spritemap_Sbug_FacingLeft_1
    dw $0005,Spritemap_Sbug_FacingLeft_0
    dw $0005,Spritemap_Sbug_FacingLeft_2
    dw Instruction_Common_GotoY
    dw InstList_Sbug_FacingLeft


;;; $A0AD: Instruction list - facing down-left ;;;
InstList_Sbug_FacingDownLeft:
    dw $0005,Spritemap_Sbug_FacingDownLeft_0
    dw $0005,Spritemap_Sbug_FacingDownLeft_1
    dw $0005,Spritemap_Sbug_FacingDownLeft_0
    dw $0005,Spritemap_Sbug_FacingDownLeft_2
    dw Instruction_Common_GotoY
    dw InstList_Sbug_FacingDownLeft


;;; $A0C1: Instruction list - facing down ;;;
InstList_Sbug_FacingDown:
    dw $0005,Spritemap_Sbug_FacingDown_0
    dw $0005,Spritemap_Sbug_FacingDown_1
    dw $0005,Spritemap_Sbug_FacingDown_0
    dw $0005,Spritemap_Sbug_FacingDown_2
    dw Instruction_Common_GotoY
    dw InstList_Sbug_FacingDown


;;; $A0D5: Instruction list - facing down-right ;;;
InstList_Sbug_FacingDownRight:
    dw $0005,Spritemap_Sbug_FacingDownRight_0
    dw $0005,Spritemap_Sbug_FacingDownRight_1
    dw $0005,Spritemap_Sbug_FacingDownRight_0
    dw $0005,Spritemap_Sbug_FacingDownRight_2
    dw Instruction_Common_GotoY
    dw InstList_Sbug_FacingDownRight


;;; $A0E9: Instruction list - facing right ;;;
InstList_Sbug_FacingRight:
    dw $0005,Spritemap_Sbug_FacingRight_0
    dw $0005,Spritemap_Sbug_FacingRight_1
    dw $0005,Spritemap_Sbug_FacingRight_0
    dw $0005,Spritemap_Sbug_FacingRight_2
    dw Instruction_Common_GotoY
    dw InstList_Sbug_FacingRight


;;; $A0FD: Instruction list - facing up-right ;;;
InstList_Sbug_FacingUpRight:
    dw $0005,Spritemap_Sbug_FacingUpRight_0
    dw $0005,Spritemap_Sbug_FacingUpRight_1
    dw $0005,Spritemap_Sbug_FacingUpRight_0
    dw $0005,Spritemap_Sbug_FacingUpRight_2
    dw Instruction_Common_GotoY
    dw InstList_Sbug_FacingUpRight


;;; $A111: Roach instruction list pointers ;;;
InstListPointers_Sbug:
    dw InstList_Sbug_FacingUp
    dw InstList_Sbug_FacingUpLeft
    dw InstList_Sbug_FacingLeft
    dw InstList_Sbug_FacingDownLeft
    dw InstList_Sbug_FacingDown
    dw InstList_Sbug_FacingDownRight
    dw InstList_Sbug_FacingRight
    dw InstList_Sbug_FacingUpRight


;;; $A121: Roach activate function pointers ;;;
ActivateFunctionPointers_Sbug:
; Indexed by [enemy parameter 2 high]
    dw Function_Sbug_Activate_0_MoveForwards
    dw Function_Sbug_Activate_1_MoveForwardsInAZigZag
    dw Function_Sbug_Activate_2_MoveAlong45DegreeAngleTowardsSamus
    dw Function_Sbug_Activate_3_MoveRandomly_WaitForSamusIfHitBlock
    dw Function_Sbug_Activate_4_MoveRandomly_ReverseUntil6BlockAway
    dw Function_Sbug_Activate_5_MoveForwards_WaitForSamus
    dw Function_Sbug_Activate_6_MoveAlong45DegreeAngleAwayFromSamus


;;; $A12F: Set roach instruction list ;;;
SetSbugInstList:
    LDX.W EnemyIndex
    LDA.L Sbug.newInstList,X : CMP.L Sbug.instList,X : BEQ .return
    STA.L Sbug.instList,X : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X

  .return:
    RTS


;;; $A14D: Initialisation AI - enemy $D87F/$D8BF (roach) ;;;
InitAI_Sbug:
    LDX.W EnemyIndex
    LDA.W #$0000 : STA.L Sbug.instList,X : STA.L Sbug.newInstList,X
    JSR CalculateMovingForwardSpeeds
    JSR CalculateMovingLeftVelocities
    JSR CalculateMovingRightVelocities
    JSR DetermineFacingForwardInstListIndex
    JSR DetermineFacingLeftInstListIndex
    JSR DetermineFacingRightInstListIndex
    LDA.L Sbug.movingForwardInstListIndex,X : TAY
    LDA.W InstListPointers_Sbug,Y : STA.L Sbug.newInstList,X
    JSR SetSbugInstList
    LDA.W #Function_Sbug_WaitForSamusToGetNear : STA.W Sbug.function,X
    RTL


;;; $A183: Calculate moving forward speeds ;;;
CalculateMovingForwardSpeeds:
    LDA.W Enemy.init0,X : AND.W #$00FF : STA.B DP_Temp14
    LDA.W Enemy.init0+1,X : AND.W #$00FF : STA.B DP_Temp12
    JSL Do_Some_Math_With_Sine_Cosine_Terrible_Label_Name ; ($16.$18, $1A.$1C) = ([$14] * |cos([$12] * pi / 80h)|, [$14] * |sin([$12] * pi / 80h)|)
    LDA.B DP_Temp16 : STA.L Sbug.movingForwardXSpeed,X
    LDA.B DP_Temp18 : STA.L Sbug.movingForwardXSubSpeed,X
    LDA.B DP_Temp1A : STA.L Sbug.movingForwardYSpeed,X
    LDA.B DP_Temp1C : STA.L Sbug.movingForwardYSubSpeed,X
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $A1B0: Unused. Calculate moving forward velocities ;;;
UNUSED_CalculateMovingForwardVelocities_A3A1B0:
; Not sure why, but moving forward calculations are done with CalculateMovingForwardSpeeds instead
    LDA.W Enemy.init0,X : AND.W #$00FF : STA.W Temp_Unknown0E32
    LDA.W Enemy.init0+1,X : AND.W #$00FF
    JSL EightBitCosineMultiplication_A0B0B2
    LDA.W Temp_Unknown0E36 : STA.L Sbug.movingForwardXSpeed,X
    LDA.W Temp_Unknown0E38 : STA.L Sbug.movingForwardXSubSpeed,X
    LDA.W Enemy.init0,X : AND.W #$00FF : STA.W Temp_Unknown0E32
    LDA.W Enemy.init0+1,X : AND.W #$00FF
    JSL EightBitNegativeSineMultiplication_A0B0C6
    LDA.W Temp_Unknown0E36 : STA.L Sbug.movingForwardYSpeed,X
    LDA.W Temp_Unknown0E38 : STA.L Sbug.movingForwardYSubSpeed,X
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $A1F3: Calculate moving left velocities ;;;
CalculateMovingLeftVelocities:
    LDA.W Enemy.init0,X : AND.W #$00FF : STA.W Temp_Unknown0E32
    LDA.W Enemy.init0+1,X : SEC : SBC.W #$0020 : AND.W #$00FF
    JSL EightBitCosineMultiplication_A0B0B2
    LDA.W Temp_Unknown0E36 : STA.L Sbug.movingLeftXVelocity,X
    LDA.W Temp_Unknown0E38 : STA.L Sbug.movingLeftXSubVelocity,X
    LDA.W Enemy.init0,X : AND.W #$00FF : STA.W Temp_Unknown0E32
    LDA.W Enemy.init0+1,X : SEC : SBC.W #$0020 : AND.W #$00FF
    JSL EightBitNegativeSineMultiplication_A0B0C6
    LDA.W Temp_Unknown0E36 : STA.L Sbug.movingLeftYVelocity,X
    LDA.W Temp_Unknown0E38 : STA.L Sbug.movingLeftYSubVelocity,X
    RTS


;;; $A23E: Calculate moving right velocities ;;;
CalculateMovingRightVelocities:
    LDA.W Enemy.init0,X : AND.W #$00FF : STA.W Temp_Unknown0E32
    LDA.W Enemy.init0+1,X : CLC : ADC.W #$0020 : AND.W #$00FF
    JSL EightBitCosineMultiplication_A0B0B2
    LDA.W Temp_Unknown0E36 : STA.L Sbug.movingRightXVelocity,X
    LDA.W Temp_Unknown0E38 : STA.L Sbug.movingRightXSubVelocity,X
    LDA.W Enemy.init0,X : AND.W #$00FF : STA.W Temp_Unknown0E32
    LDA.W Enemy.init0+1,X : CLC : ADC.W #$0020 : AND.W #$00FF
    JSL EightBitNegativeSineMultiplication_A0B0C6
    LDA.W Temp_Unknown0E36 : STA.L Sbug.movingRightYVelocity,X
    LDA.W Temp_Unknown0E38 : STA.L Sbug.movingRightYSubVelocity,X
    RTS


;;; $A289: Determine facing forward instruction list index ;;;
DetermineFacingForwardInstListIndex:
    LDA.W Enemy.init0+1,X : SEC : SBC.W #$0030 : AND.W #$00FF
    LSR #5 : ASL : STA.L Sbug.movingForwardInstListIndex,X
    RTS


;;; $A29E: Determine facing left instruction list index ;;;
DetermineFacingLeftInstListIndex:
    LDA.W Enemy.init0+1,X : SEC
    SBC.W #$0030 : SEC : SBC.W #$0020 : AND.W #$00FF
    LSR #5 : ASL : STA.L Sbug.movingLeftInstListIndex,X
    RTS


;;; $A2B7: Determine facing right instruction list index ;;;
DetermineFacingRightInstListIndex:
    LDA.W Enemy.init0+1,X : SEC : SBC.W #$0030 : CLC : ADC.W #$0020
    AND.W #$00FF : LSR #5 : ASL : STA.L Sbug.movingRightInstListIndex,X
    RTS


;;; $A2D0: Main AI - enemy $D87F/$D8BF (roach) ;;;
MainAI_Sbug:
    LDX.W EnemyIndex
    JSR.W (Sbug.function,X)
    RTL


;;; $A2D7: Roach function - wait for Samus to get near ;;;
Function_Sbug_WaitForSamusToGetNear:
    LDX.W EnemyIndex
    LDA.W Enemy.init1,X : AND.W #$00FF
    JSL IsSamusWithinAPixelColumnsOfEnemy
    BEQ .return
    LDA.W Enemy.init1,X : AND.W #$00FF
    JSL IsSamusWithingAPixelRowsOfEnemy
    BEQ .return
    LDA.W Enemy.init1+1,X : AND.W #$00FF : ASL : TAY
    LDA.W ActivateFunctionPointers_Sbug,Y : STA.W Sbug.function,X

  .return:
    RTS


;;; $A301: Roach function - activate - index 0 (move forwards) ;;;
Function_Sbug_Activate_0_MoveForwards:
    LDX.W EnemyIndex
    LDA.W #Function_Sbug_Activated_0_MoveForwards : STA.W Sbug.function,X
    RTS


;;; $A30B: Roach function - activate - index 1 (move forwards in a zigzag) ;;;
Function_Sbug_Activate_1_MoveForwardsInAZigZag:
    LDX.W EnemyIndex
    LDA.W #Function_Sbug_Activated_1_MoveForwardsInAZigZag : STA.W Sbug.function,X
    RTS


;;; $A315: Roach function - activate - index 3 (move randomly and wait for Samus if hit block) ;;;
Function_Sbug_Activate_3_MoveRandomly_WaitForSamusIfHitBlock:
    LDX.W EnemyIndex
    LDA.W #$000B : STA.W RandomNumberSeed
    LDA.W #Function_Sbug_Activated_3_MoveRandomly_WaitForSamusIfHitBlock : STA.W Sbug.function,X
    RTS


;;; $A325: Roach function - activate - index 4 (move in a random direction then reverse until 6 blocks away from Samus) ;;;
Function_Sbug_Activate_4_MoveRandomly_ReverseUntil6BlockAway:
    LDX.W EnemyIndex
    LDA.W #$0200 : STA.W Sbug.straightMovementTimer,X
    LDA.W #$000B : STA.W RandomNumberSeed
    LDA.W #Function_Sbug_Activated_4_MoveRandomly_ReverseUntil6BlocksAway : STA.W Sbug.function,X
    RTS


;;; $A33B: Roach function - activate - index 5 (move forwards then wait for Samus) ;;;
Function_Sbug_Activate_5_MoveForwards_WaitForSamus:
    LDX.W EnemyIndex
    LDA.W #$0020 : STA.W Sbug.movementTimer,X
    LDA.W #Function_Sbug_Activated_5_MoveForwards_WaitForSamus : STA.W Sbug.function,X
    RTS


;;; $A34B: Roach function - activate - index 2 (move towards Samus) ;;;
Function_Sbug_Activate_2_MoveAlong45DegreeAngleTowardsSamus:
    LDX.W EnemyIndex
    JSL CalculateAngleOfSamusFromEnemy
    SEC : SBC.W #$0040 : EOR.W #$FFFF : INC
    CLC : ADC.W #$0100 : AND.W #$00FF : STA.W Sbug.customAngle,X
    JSR CalculateCustomVelocities
    JSR DetermineCustomInstListIndex
    LDA.L Sbug.customInstListIndex,X : TAY
    LDA.W InstListPointers_Sbug,Y : STA.L Sbug.newInstList,X
    JSR SetSbugInstList
    LDA.W #Function_Sbug_Activated_2_MoveAlong45DegreeAngleTowardsSamus : STA.W Sbug.function,X
    RTS


;;; $A380: Roach function - activate - index 6 (away from Samus) ;;;
Function_Sbug_Activate_6_MoveAlong45DegreeAngleAwayFromSamus:
    LDX.W EnemyIndex
    JSL CalculateAngleOfSamusFromEnemy
    SEC : SBC.W #$0040 : EOR.W #$FFFF : INC
    CLC : ADC.W #$0080 : AND.W #$00FF : STA.W Sbug.customAngle,X
    JSR CalculateCustomVelocities
    JSR DetermineCustomInstListIndex
    LDA.L Sbug.customInstListIndex,X : TAY
    LDA.W InstListPointers_Sbug,Y : STA.L Sbug.newInstList,X
    JSR SetSbugInstList
    LDA.W #Function_Sbug_Activated_6_MoveAlong45DegAngleAwayFromSamus : STA.W Sbug.function,X
    RTS


;;; $A3B5: Determine custom instruction list index ;;;
DetermineCustomInstListIndex:
    LDA.W Sbug.customAngle,X : SEC : SBC.W #$0030 : AND.W #$00FF
    LSR #5 : ASL : STA.L Sbug.customInstListIndex,X
    RTS


;;; $A3CA: Calculate custom velocities ;;;
CalculateCustomVelocities:
    LDA.W Enemy.init0,X : AND.W #$00FF : STA.W Temp_Unknown0E32
    LDA.W Sbug.customAngle,X
    JSL EightBitCosineMultiplication_A0B0B2
    LDA.W Temp_Unknown0E36 : STA.L Sbug.customXVelocity,X
    LDA.W Temp_Unknown0E38 : STA.L Sbug.customXSubVelocity,X
    LDA.W Enemy.init0,X : AND.W #$00FF : STA.W Temp_Unknown0E32
    LDA.W Sbug.customAngle,X
    JSL EightBitNegativeSineMultiplication_A0B0C6
    LDA.W Temp_Unknown0E36 : STA.L Sbug.customYVelocity,X
    LDA.W Temp_Unknown0E38 : STA.L Sbug.customYSubVelocity,X
    RTS


;;; $A407: Roach function - activated - index 0 (move forwards) ;;;
Function_Sbug_Activated_0_MoveForwards:
    LDX.W EnemyIndex
    JSR MoveSbugForward
    RTS


;;; $A40E: Roach function - activated - index 1 (move forwards in a zigzag) ;;;
Function_Sbug_Activated_1_MoveForwardsInAZigZag:
    LDX.W EnemyIndex
    LDA.W Enemy.frameCounter,X : AND.W #$0010 : BNE .right
    LDA.L Sbug.movingLeftInstListIndex,X : TAY
    LDA.W InstListPointers_Sbug,Y : STA.L Sbug.newInstList,X
    JSR SetSbugInstList
    JSR MoveSbugLeft
    BRA .return

  .right:
    LDA.L Sbug.movingRightInstListIndex,X : TAY
    LDA.W InstListPointers_Sbug,Y : STA.L Sbug.newInstList,X
    JSR SetSbugInstList
    JSR MoveSbugRight

  .return:
    RTS


;;; $A440: Roach function - activated - index 2 (move towards Samus) ;;;
Function_Sbug_Activated_2_MoveAlong45DegreeAngleTowardsSamus:
    LDX.W EnemyIndex
    JSR MoveSbugAlongCustomAngle
    RTS


;;; $A447: Roach function - activated - index 6 (move away from Samus) ;;;
Function_Sbug_Activated_6_MoveAlong45DegAngleAwayFromSamus:
    LDX.W EnemyIndex
    JSR MoveSbugAlongCustomAngle
    RTS


;;; $A44E: Roach function - activated - index 5 (move forwards then wait for Samus) ;;;
Function_Sbug_Activated_5_MoveForwards_WaitForSamus:
    LDX.W EnemyIndex
    DEC.W Sbug.movementTimer,X : BMI .wait
    JSR MoveSbugForward
    BRA .return

  .wait:
    LDA.W #Function_Sbug_WaitForSamusToGetNear : STA.W Sbug.function,X

  .return:
    RTS


;;; $A462: Roach function - move along custom angle and wait for Samus if hit block ;;;
Function_Sbug_MoveAlongCustomAngle_WaitForSamusIfHitBlock:
    LDX.W EnemyIndex
    DEC.W Sbug.movementTimer,X : BMI .timerExpired
    JSR MoveSbugAlongCustomAngle_WaitForSamusIfHitBlock
    BRA .return

  .timerExpired:
    LDA.W #Function_Sbug_Activated_3_MoveRandomly_WaitForSamusIfHitBlock : STA.W Sbug.function,X

  .return:
    RTS


;;; $A476: Roach function - move straight along custom angle then reverse until 6 blocks away from Samus ;;;
Function_Sbug_MoveStraightAlongAngle_ReverseUntil6BlocksAway:
    LDX.W EnemyIndex
    DEC.W Sbug.straightMovementTimer,X : BMI .move
    DEC.W Sbug.movementTimer,X : BMI .done
    LDA.W Enemy.XPosition,X : SEC : SBC.W SamusXPosition
    JSL NegateA_A0B067
    CMP.W #$0060 : BPL +
    BRA .move

+   LDA.W Enemy.YPosition,X : SEC : SBC.W SamusYPosition
    JSL NegateA_A0B067
    CMP.W #$0060 : BPL .reverse
    BRA .move

  .reverse:
    JSR ReverseSbugCustomAngle

  .move:
    JSR MoveSbugAlongCustomAngle
    BRA .return

  .done:
    LDA.W #Function_Sbug_Activated_4_MoveRandomly_ReverseUntil6BlocksAway : STA.W Sbug.function,X

  .return:
    RTS


;;; $A4B6: Roach function - activated - index 4 (move in a random direction then reverse until 6 blocks away from Samus) ;;;
Function_Sbug_Activated_4_MoveRandomly_ReverseUntil6BlocksAway:
    LDX.W EnemyIndex
    JSL GenerateRandomNumber
    AND.W #$00FF : SEC : SBC.W #$0040 : AND.W #$00FF
    CLC : ADC.W Sbug.customAngle,X : STA.W Sbug.customAngle,X
    JSR CalculateCustomVelocities
    JSR DetermineCustomInstListIndex
    LDA.L Sbug.customInstListIndex,X : TAY
    LDA.W InstListPointers_Sbug,Y : STA.L Sbug.newInstList,X
    JSR SetSbugInstList
    LDA.W #$0020 : STA.W Sbug.movementTimer,X
    LDA.W #Function_Sbug_MoveStraightAlongAngle_ReverseUntil6BlocksAway : STA.W Sbug.function,X
    RTS


;;; $A4F0: Roach function - activated - index 3 (move randomly and wait for Samus if hit block) ;;;
Function_Sbug_Activated_3_MoveRandomly_WaitForSamusIfHitBlock:
    LDX.W EnemyIndex
    JSL GenerateRandomNumber
    AND.W #$00FF : SEC : SBC.W #$0040 : AND.W #$00FF
    CLC : ADC.W Sbug.customAngle,X : STA.W Sbug.customAngle,X
    JSR CalculateCustomVelocities
    JSR DetermineCustomInstListIndex
    LDA.L Sbug.customInstListIndex,X : TAY
    LDA.W InstListPointers_Sbug,Y : STA.L Sbug.newInstList,X
    JSR SetSbugInstList
    LDA.W #$0020 : STA.W Sbug.movementTimer,X
    LDA.W #Function_Sbug_MoveAlongCustomAngle_WaitForSamusIfHitBlock : STA.W Sbug.function,X
    RTS


;;; $A52A: Reverse roach custom angle ;;;
ReverseSbugCustomAngle:
; Note these fixed point negations are all off by 1.0 if the low word is non-zero
    LDX.W EnemyIndex
    LDA.L Sbug.customXVelocity,X : EOR.W #$FFFF : INC : STA.L Sbug.customXVelocity,X
    LDA.L Sbug.customXSubVelocity,X : EOR.W #$FFFF : INC : STA.L Sbug.customXSubVelocity,X
    LDA.L Sbug.customYVelocity,X : EOR.W #$FFFF : INC : STA.L Sbug.customYVelocity,X
    LDA.L Sbug.customYSubVelocity,X : EOR.W #$FFFF : INC : STA.L Sbug.customYSubVelocity,X
    LDA.L Sbug.customInstListIndex,X : CLC : ADC.W #$0004 : AND.W #$0007 : STA.L Sbug.customInstListIndex,X
    TAY
    LDA.W InstListPointers_Sbug,Y : STA.L Sbug.newInstList,X
    JSR SetSbugInstList
    RTS


;;; $A578: Move roach forward ;;;
MoveSbugForward:
    LDA.L Sbug.movingForwardXSpeed,X : STA.W Temp_XSpeed
    LDA.L Sbug.movingForwardXSubSpeed,X : STA.W Temp_XSubSpeed
    LDA.L Sbug.movingForwardYSpeed,X : STA.W Temp_YSpeed
    LDA.L Sbug.movingForwardYSubSpeed,X : STA.W Temp_YSubSpeed
    LDA.W Enemy.init0+1,X : AND.W #$00FF : STA.W Temp_EnemyProjectileInitParam
    JSL MoveEnemyAccordingToAngleAndXYSpeeds
    RTS


;;; $A5A2: Unused. RTS ;;;
RTS_A3A5A2:
    RTS


;;; $A5A3: Move roach left ;;;
MoveSbugLeft:
    LDA.W Enemy.XPosition,X : CLC : ADC.L Sbug.movingLeftXVelocity,X : STA.W Enemy.XPosition,X
    LDA.W Enemy.XSubPosition,X : CLC : ADC.L Sbug.movingLeftXSubVelocity,X : BCC +
    INC.W Enemy.XPosition,X

+   STA.W Enemy.XSubPosition,X
    LDA.W Enemy.YPosition,X : CLC : ADC.L Sbug.movingLeftYVelocity,X : STA.W Enemy.YPosition,X
    LDA.W Enemy.YSubPosition,X : CLC : ADC.L Sbug.movingLeftYSubVelocity,X : BCC +
    INC.W Enemy.YPosition,X

+   STA.W Enemy.YSubPosition,X
    RTS


;;; $A5DA: Move roach right ;;;
MoveSbugRight:
    LDA.W Enemy.XPosition,X : CLC : ADC.L Sbug.movingRightXVelocity,X : STA.W Enemy.XPosition,X
    LDA.W Enemy.XSubPosition,X : CLC : ADC.L Sbug.movingRightXSubVelocity,X : BCC +
    INC.W Enemy.XPosition,X

+   STA.W Enemy.XSubPosition,X
    LDA.W Enemy.YPosition,X : CLC : ADC.L Sbug.movingRightYVelocity,X : STA.W Enemy.YPosition,X
    LDA.W Enemy.YSubPosition,X : CLC : ADC.L Sbug.movingRightYSubVelocity,X : BCC +
    INC.W Enemy.YPosition,X

+   STA.W Enemy.YSubPosition,X
    RTS


;;; $A611: Move enemy along custom angle ;;;
MoveSbugAlongCustomAngle:
    LDA.W Enemy.XPosition,X : CLC : ADC.L Sbug.customXVelocity,X : STA.W Enemy.XPosition,X
    LDA.W Enemy.XSubPosition,X : CLC : ADC.L Sbug.customXSubVelocity,X : BCC +
    INC.W Enemy.XPosition,X

+   STA.W Enemy.XSubPosition,X
    LDA.W Enemy.YPosition,X : CLC : ADC.L Sbug.customYVelocity,X : STA.W Enemy.YPosition,X
    LDA.W Enemy.YSubPosition,X : CLC : ADC.L Sbug.customYSubVelocity,X : BCC +
    INC.W Enemy.YPosition,X

+   STA.W Enemy.YSubPosition,X
    RTS


;;; $A648: Move enemy along custom angle and wait for Samus if hit block ;;;
MoveSbugAlongCustomAngle_WaitForSamusIfHitBlock:
    LDA.L Sbug.customXSubVelocity,X : STA.B DP_Temp12
    LDA.L Sbug.customXVelocity,X : STA.B DP_Temp14
    JSL MoveEnemyRightBy_14_12_IgnoreSlopes
    BCC .notCollidedWithWall
    LDA.W #Function_Sbug_WaitForSamusToGetNear : STA.W Sbug.function,X
    BRA .return

  .notCollidedWithWall:
    LDA.L Sbug.customYSubVelocity,X : STA.B DP_Temp12
    LDA.L Sbug.customYVelocity,X : STA.B DP_Temp14
    JSL MoveEnemyDownBy_14_12
    BCC .return
    LDA.W #Function_Sbug_WaitForSamusToGetNear : STA.W Sbug.function,X

  .return:
    RTS


;;; $A67B: RTL ;;;
RTL_A3A67B:
    RTL


;;; $A67C: RTL ;;;
RTL_A3A67C:
    RTL


;;; $A67D: Roach spritemaps ;;;
Spritemap_Sbug_FacingUp_0:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $100)

Spritemap_Sbug_FacingUp_1:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $101)

Spritemap_Sbug_FacingUp_2:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $102)

Spritemap_Sbug_FacingUpLeft_0:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $103)

Spritemap_Sbug_FacingUpLeft_1:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $104)

Spritemap_Sbug_FacingUpLeft_2:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $105)

Spritemap_Sbug_FacingLeft_0:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $106)

Spritemap_Sbug_FacingLeft_1:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $107)

Spritemap_Sbug_FacingLeft_2:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $108)

Spritemap_Sbug_FacingDownLeft_0:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 1, 0, 3, 0, $103)

Spritemap_Sbug_FacingDownLeft_1:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 1, 0, 3, 0, $104)

Spritemap_Sbug_FacingDownLeft_2:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 1, 0, 3, 0, $105)

Spritemap_Sbug_FacingDown_0:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 1, 0, 3, 0, $100)

Spritemap_Sbug_FacingDown_1:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 1, 0, 3, 0, $101)

Spritemap_Sbug_FacingDown_2:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 1, 0, 3, 0, $102)

Spritemap_Sbug_FacingDownRight_0:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 1, 1, 3, 0, $103)

Spritemap_Sbug_FacingDownRight_1:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 1, 1, 3, 0, $104)

Spritemap_Sbug_FacingDownRight_2:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 1, 1, 3, 0, $105)

Spritemap_Sbug_FacingRight_0:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 1, 3, 0, $106)

Spritemap_Sbug_FacingRight_1:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 1, 3, 0, $107)

Spritemap_Sbug_FacingRight_2:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 1, 3, 0, $108)

Spritemap_Sbug_FacingUpRight_0:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 1, 3, 0, $103)

Spritemap_Sbug_FacingUpRight_1:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 1, 3, 0, $104)

Spritemap_Sbug_FacingUpRight_2:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 1, 3, 0, $105)


;;; $A725: Palette - enemy $D8FF (mochtroid) ;;;
Palette_Mochtroid:
    dw $3800,$3FB7,$2EAD,$0142,$0060,$3B10,$226B,$11C6
    dw $0984,$72FF,$2CDF,$24B9,$1CAF,$2A9D,$19D6,$0D10


;;; $A745: Instruction list - not touching Samus ;;;
InstList_Mochtroid_NotTouchingSamus:
    dw $000E,Spritemap_Mochtroid_NotTouchingSamus_0
    dw $000E,Spritemap_Mochtroid_NotTouchingSamus_1
    dw $000E,Spritemap_Mochtroid_NotTouchingSamus_2
    dw $000E,Spritemap_Mochtroid_NotTouchingSamus_1
    dw Instruction_Common_GotoY
    dw InstList_Mochtroid_NotTouchingSamus


;;; $A759: Instruction list - touching Samus ;;;
InstList_Mochtroid_TouchingSamus:
    dw $0005,Spritemap_Mochtroid_TouchingSamus_0
    dw $0005,Spritemap_Mochtroid_TouchingSamus_1
    dw $0005,Spritemap_Mochtroid_TouchingSamus_2
    dw $0005,Spritemap_Mochtroid_TouchingSamus_1
    dw Instruction_Common_GotoY
    dw InstList_Mochtroid_TouchingSamus


;;; $A76D: Mochtroid shake velocity table ;;;
MocktroidShakeVelocityTable:
; Velocities for UNUSED_Function_Mochtroid_2_Shaking_A3A88F
; Indexed by Mochtroid.shakeTimer
  .X:
    dw $0002,$0000,$FFFE,$0000
  .Y:
    dw $0000,$FFFE,$0000,$0002


;;; $A77D: Initialisation AI - enemy $D8FF (mochtroid) ;;;
InitAI_Mochtroid:
; Note respawn crash bug in SetMochtroidInstList, can fix by replacing `JSR SetMochtroidInstList` with `JSR $A942`
    LDX.W EnemyIndex
    LDA.W #$0002 : STA.W Enemy.layer,X
    LDA.W #InstList_Mochtroid_NotTouchingSamus
    JSR SetMochtroidInstList
    STZ.W Mochtroid.functionIndex,X
    RTL


;;; $A790: Main AI - enemy $D8FF (mochtroid) ;;;
MainAI_Mochtroid:
    LDX.W EnemyIndex
    LDA.W Mochtroid.functionIndex,X : ASL : TAX
    PHX ; >.<
    LDX.W EnemyIndex ; >.<
    STZ.W Mochtroid.functionIndex,X
    PLX ; >.<
    JSR.W (.pointers,X)
    RTL

  .pointers:
    dw Function_Mochtroid_0_NotTouchingSamus
    dw Function_Mochtroid_1_TouchingSamus
    dw UNUSED_Function_Mochtroid_2_Shaking_A3A88F


;;; $A7AA: Mochtroid function index 0 - not touching Samus ;;;
Function_Mochtroid_0_NotTouchingSamus:
    LDX.W EnemyIndex
    STZ.B DP_Temp12 : STZ.B DP_Temp14
    LDA.W Enemy.YPosition,X : SEC : SBC.W SamusYPosition : LSR #2 : STA.B DP_Temp13
    AND.W #$2000 : BEQ +
    LDA.B DP_Temp14 : ORA.W #$FFC0 : STA.B DP_Temp14

+   LDA.W Mochtroid.YSubVelocity,X : SEC : SBC.B DP_Temp12 : STA.W Mochtroid.YSubVelocity,X
    LDA.W Mochtroid.YVelocity,X : SBC.B DP_Temp14 : STA.W Mochtroid.YVelocity,X : BMI .negativeY
    CMP.W #$0003 : BCC +
    LDA.W #$0003
    BRA .storeYVelocity

  .negativeY:
    CMP.W #$FFFD : BCS +
    LDA.W #$FFFD

  .storeYVelocity:
    STA.W Mochtroid.YVelocity,X
    STZ.W Mochtroid.YSubVelocity,X

+   LDA.W Mochtroid.YSubVelocity,X : BNE +
    LDA.W Mochtroid.YVelocity,X : BNE +
    STZ.W Mochtroid.YSubVelocity,X : STZ.W Mochtroid.YVelocity,X

+   LDA.W Mochtroid.YSubVelocity,X : STA.B DP_Temp12
    LDA.W Mochtroid.YVelocity,X : STA.B DP_Temp14
    JSL MoveEnemyDownBy_14_12
    BCC .notCollidedWithBlock
    STZ.W Mochtroid.YSubVelocity,X : STZ.W Mochtroid.YVelocity,X

  .notCollidedWithBlock:
    LDX.W EnemyIndex
    STZ.B DP_Temp12 : STZ.B DP_Temp14
    LDA.W Enemy.XPosition,X : SEC : SBC.W SamusXPosition : LSR #2 : STA.B DP_Temp13
    AND.W #$2000 : BEQ +
    LDA.B DP_Temp14 : ORA.W #$FFC0 : STA.B DP_Temp14

+   LDA.W Mochtroid.XSubVelocity,X : SEC : SBC.B DP_Temp12 : STA.W Mochtroid.XSubVelocity,X
    LDA.W Mochtroid.XVelocity,X : SBC.B DP_Temp14 : STA.W Mochtroid.XVelocity,X : BMI .negativeX
    CMP.W #$0003 : BCC +
    LDA.W #$0003
    BRA .storeXVelocity

  .negativeX:
    CMP.W #$FFFD : BCS +
    LDA.W #$FFFD

  .storeXVelocity:
    STA.W Mochtroid.XVelocity,X
    STZ.W Mochtroid.XSubVelocity,X

+   LDA.W Mochtroid.XSubVelocity,X : BNE +
    LDA.W Mochtroid.XVelocity,X : BNE +
    STZ.W Mochtroid.XSubVelocity,X : STZ.W Mochtroid.XVelocity,X

+   LDA.W Mochtroid.XSubVelocity,X : STA.B DP_Temp12
    LDA.W Mochtroid.XVelocity,X : STA.B DP_Temp14
    JSL MoveEnemyRightBy_14_12_IgnoreSlopes
    BCC .noBlockCollision
    STZ.W Mochtroid.XSubVelocity,X : STZ.W Mochtroid.XVelocity,X

  .noBlockCollision:
    LDA.W #InstList_Mochtroid_NotTouchingSamus
    JSR SetMochtroidInstList
    RTS


;;; $A88F: Unused. Mochtroid function index 2 - shaking ;;;
UNUSED_Function_Mochtroid_2_Shaking_A3A88F:
    LDX.W EnemyIndex
    LDA.W Mochtroid.shakeTimer,X : AND.W #$0006 : TAY
    LDA.W Enemy.XPosition,X : CLC : ADC.W MocktroidShakeVelocityTable_X,Y : STA.W Enemy.XPosition,X
    LDA.W Enemy.YPosition,X : CLC : ADC.W MocktroidShakeVelocityTable_Y,Y : STA.W Enemy.YPosition,X
    STZ.W Mochtroid.XSubVelocity,X : STZ.W Mochtroid.XVelocity,X
    STZ.W Mochtroid.YSubVelocity,X : STZ.W Mochtroid.YVelocity,X
    DEC.W Mochtroid.shakeTimer,X : BNE .shaking
    STZ.W Mochtroid.functionIndex,X

  .shaking:
    LDA.W #InstList_Mochtroid_NotTouchingSamus
    JSR SetMochtroidInstList
    RTS


;;; $A8C8: Mochtroid function index 1 - touching Samus ;;;
Function_Mochtroid_1_TouchingSamus:
    LDX.W EnemyIndex
    LDA.W Enemy.XPosition,X : CMP.W SamusXPosition : BEQ .centeredX
    BPL .moveLeft
    BMI .moveRight

  .centeredX:
    STZ.W Mochtroid.XSubVelocity,X : STZ.W Mochtroid.XVelocity,X
    BRA .moveX

  .moveLeft:
    STZ.W Mochtroid.XSubVelocity,X
    LDA.W #$FFFF : STA.W Mochtroid.XVelocity,X
    BRA .moveX

  .moveRight:
    STZ.W Mochtroid.XSubVelocity,X
    LDA.W #$0001 : STA.W Mochtroid.XVelocity,X
    BRA .moveX

  .moveX:
    LDA.W Mochtroid.XSubVelocity,X : STA.B DP_Temp12
    LDA.W Mochtroid.XVelocity,X : STA.B DP_Temp14
    JSL MoveEnemyRightBy_14_12_IgnoreSlopes
    LDA.W Enemy.YPosition,X : CMP.W SamusYPosition : BEQ .centeredY
    BPL .moveUp
    BMI .moveDown

  .centeredY:
    STZ.W Mochtroid.YSubVelocity,X : STZ.W Mochtroid.YVelocity,X
    BRA .moveY

  .moveUp:
    STZ.W Mochtroid.YSubVelocity,X
    LDA.W #$FFFF : STA.W Mochtroid.YVelocity,X
    BRA .moveY

  .moveDown:
    STZ.W Mochtroid.YSubVelocity,X
    LDA.W #$0001 : STA.W Mochtroid.YVelocity,X
    BRA .moveY

  .moveY:
    LDA.W Mochtroid.YSubVelocity,X : STA.B DP_Temp12
    LDA.W Mochtroid.YVelocity,X : STA.B DP_Temp14
    JSL MoveEnemyDownBy_14_12
    RTS


;;; $A93C: Set mochtroid instruction list ;;;
SetMochtroidInstList:
; Mochtroid respawn crash: if mochtroid is set to respawn,
; then [enemy $7E:7802] is likely already set to [A],
; so the enemy instruction list pointer never gets set,
; meaning it will be 0 when enemy instruction processing takes place,
; causing garbage instructions to be processed.
    CMP.L Mochtroid.movingForwardXSpeed,X : BEQ .return
    STA.L Mochtroid.movingForwardXSpeed,X : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X : STZ.W Enemy.loopCounter,X

  .return:
    RTS


;;; $A953: Enemy touch - enemy $D8FF (mochtroid) ;;;
EnemyTouch_Mochtroid:
    LDX.W EnemyIndex
    LDA.W #$0001 : STA.W Mochtroid.functionIndex,X
    LDA.W #InstList_Mochtroid_TouchingSamus
    JSR SetMochtroidInstList
    LDA.L Mochtroid.damageTimer,X : INC : STA.L Mochtroid.damageTimer,X
    LDA.W ContactDamageIndex : BNE .damage
    LDA.W NumberOfTimesMainEnemyRoutineExecuted : AND.W #$0007 : CMP.W #$0007 : BNE .skipSFX
    LDA.W Energy : CMP.W #$001E : BMI .skipSFX
    LDA.W #$002D
    JSL QueueSound_Lib3_Max6

  .skipSFX:
    LDA.L Mochtroid.damageTimer,X : CMP.W #$0050 : BMI .return
    LDA.W #$0000 : STA.L Mochtroid.damageTimer,X

  .damage:
    JSL CommonA3_NormalEnemyTouchAI
    LDA.W #$0000 : STA.W SamusInvincibilityTimer : STA.W SamusKnockbackTimer ; >.< STZ

  .return:
    RTL


;;; $A9A8: Enemy shot - enemy $D8FF (mochtroid) ;;;
EnemyShot_Mochtroid:
    LDX.W EnemyIndex
    JSL CommonA3_NormalEnemyShotAI
    RTL


;;; $A9B0: Mochtroid spritemaps ;;;
Spritemap_Mochtroid_NotTouchingSamus_0:
    dw $0006
    %spritemapEntry(1, $00, $F4, 0, 1, 2, 0, $100)
    %spritemapEntry(1, $1F0, $F4, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $06, $04, 0, 1, 2, 0, $11C)
    %spritemapEntry(0, $1FE, $04, 0, 1, 2, 0, $11D)
    %spritemapEntry(0, $1FA, $04, 0, 0, 2, 0, $11D)
    %spritemapEntry(0, $1F2, $04, 0, 0, 2, 0, $11C)

Spritemap_Mochtroid_NotTouchingSamus_1:
    dw $0006
    %spritemapEntry(1, $00, $F4, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $1F0, $F4, 0, 0, 2, 0, $102)
    %spritemapEntry(0, $07, $04, 0, 1, 2, 0, $10C)
    %spritemapEntry(0, $1FF, $04, 0, 1, 2, 0, $10D)
    %spritemapEntry(0, $1F9, $04, 0, 0, 2, 0, $10D)
    %spritemapEntry(0, $1F1, $04, 0, 0, 2, 0, $10C)

Spritemap_Mochtroid_NotTouchingSamus_2:
    dw $0004
    %spritemapEntry(1, $00, $F2, 0, 1, 2, 0, $104)
    %spritemapEntry(1, $1F0, $F2, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $1F8, $02, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $1F8, $02, 0, 0, 2, 0, $10E)

Spritemap_Mochtroid_TouchingSamus_0:
    dw $0004
    %spritemapEntry(1, $1F9, $02, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $00, $F2, 0, 1, 2, 0, $106)
    %spritemapEntry(1, $1F0, $F2, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $1F7, $02, 0, 0, 2, 0, $10E)

Spritemap_Mochtroid_TouchingSamus_1:
    dw $0004
    %spritemapEntry(1, $1F0, $F1, 0, 0, 2, 0, $108)
    %spritemapEntry(1, $1FA, $01, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $1F6, $01, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $00, $F1, 0, 1, 2, 0, $108)

Spritemap_Mochtroid_TouchingSamus_2:
    dw $0004
    %spritemapEntry(1, $1F9, $02, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $1F7, $02, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $00, $F2, 0, 1, 2, 0, $10A)
    %spritemapEntry(1, $1F0, $F2, 0, 0, 2, 0, $10A)


;;; $AA48: Palette - enemy $D93F (sidehopper) ;;;
Palette_Sidehopper:
    dw $3800,$57FF,$42F7,$0D4A,$0063,$4F5A,$36B5,$2610
    dw $1DCE,$4EDA,$3A35,$2990,$14EB,$5FE0,$32A0,$1940


;;; $AA68: Instruction - queue sound [[Y]], sound library 2, max queued sounds allowed = 3 ;;;
Instruction_Sidehopper_QueueSoundInY_Lib2_Max3:
    PHY : PHX
    LDA.W $0000,Y
    JSL QueueSound_Lib2_Max3
    PLX : PLY
    INY #2
    RTL


;;; $AA76: Instruction list - sidehopper - hopping - upside up ;;;
InstList_Sidehopper_Hopping_UpsideUp:
    dw Instruction_Common_EnableOffScreenProcessing
    dw Instruction_Sidehopper_QueueSoundInY_Lib2_Max3,$005D
    dw $0001,Spritemap_Sidehopper_2
    dw Instruction_Common_Sleep


;;; $AA82: Instruction list - sidehopper - landed - upside up ;;;
InstList_Sidehopper_Landed_UpsideUp:
    dw Instruction_Common_DisableOffScreenProcessing
    dw Instruction_Sidehopper_QueueSoundInY_Lib2_Max3,$005E
    dw $0002,Spritemap_Sidehopper_0
    dw $0005,Spritemap_Sidehopper_1
    dw $0002,Spritemap_Sidehopper_0
    dw $0003,Spritemap_Sidehopper_1
    dw Instruction_Hopper_ReadyToHop
    dw Instruction_Common_Sleep


;;; $AA9C: Instruction list - sidehopper - hopping - upside down ;;;
InstList_Sidehopper_Hopping_UpsideDown:
    dw Instruction_Common_EnableOffScreenProcessing
    dw Instruction_Sidehopper_QueueSoundInY_Lib2_Max3,$005D
    dw $0001,Spritemap_Sidehopper_5
    dw Instruction_Common_Sleep


;;; $AAA8: Instruction list - sidehopper - landed - upside down ;;;
InstList_Sidehopper_Landed_UpsideDown:
    dw Instruction_Common_DisableOffScreenProcessing
    dw Instruction_Sidehopper_QueueSoundInY_Lib2_Max3,$005E
    dw $0002,Spritemap_Sidehopper_3
    dw $0005,Spritemap_Sidehopper_4
    dw $0002,Spritemap_Sidehopper_3
    dw $0003,Spritemap_Sidehopper_4
    dw Instruction_Hopper_ReadyToHop
    dw Instruction_Common_Sleep


;;; $AAC2: Sidehopper data ;;;
; Instruction list pointers. Indexed by [$A0:002A + [enemy ID]] * 2
InstListPointers_Sidehopper_Landed_UpsideUp:
    dw InstList_Sidehopper_Landed_UpsideUp
    dw InstList_SidehopperLarge_Landed_UpsideUp
    dw InstList_DessgeegaLarge_Landed_UpsideUp
    dw InstList_Dessgeega_Landed_UpsideUp

InstListPointers_Sidehopper_Landed_UpsideDown:
    dw InstList_Sidehopper_Landed_UpsideDown
    dw InstList_SidehopperLarge_Landed_UpsideDown
    dw InstList_DessgeegaLarge_Landed_UpsideDown
    dw InstList_Dessgeega_Landed_UpsideDown

InstListPointers_Sidehopper_Hopping_UpsideUp:
    dw InstList_Sidehopper_Hopping_UpsideUp
    dw InstList_SidehopperLarge_Hopping_UpsideUp
    dw InstList_DessgeegaLarge_Hopping_UpsideUp
    dw InstList_Dessgeega_Hopping_UpsideUp

InstListPointers_Sidehopper_Hopping_UpsideDown:
    dw InstList_Sidehopper_Hopping_UpsideDown
    dw InstList_SidehopperLarge_Hopping_UpsideDown
    dw InstList_DessgeegaLarge_Hopping_UpsideDown
    dw InstList_Dessgeega_Hopping_UpsideDown

HopFunctionPointers_Sidehopper:
    dw Function_Hopper_SmallHop
    dw Function_Hopper_BigHop


HopTable_Small:
; Hop table. Indexed by [enemy $7E:800A]
;       __________ Sidehopper
;      |       ___ Desgeega / super-sidehopper / super-desgeega
;      |      |
  .YSpeedTableIndexDelta:
    dw $0003,$0003 ; Small hop - Y speed table index delta
  .XSpeed:
    dw $0003,$0003 ; Small hop - X speed
  .JumpHeight:
    dw $1000,$1000 ; Small hop - jump height

HopTable_Big:
  .YSpeedTableIndexDelta:
    dw $0004,$0004 ; Big hop - Y speed table index delta
  .XSpeed:
    dw $0003,$0003 ; Big hop - X speed
  .JumpHeight:
    dw $3000,$3000 ; Big hop - jump height


;;; $AAFE: Instruction - ready to hop ;;;
Instruction_Hopper_ReadyToHop:
    LDX.W EnemyIndex
    LDA.W #$0001 : STA.L Hopper.readyToHopFlag,X
    RTL


;;; $AB09: Initialisation AI - enemy $D93F/$D97F/$D9BF/$D9FF/$DA3F (sidehopper / desgeega / super-sidehopper / super-desgeega) ;;;
InitAI_Hopper:
    LDX.W EnemyIndex
    LDA.W #$0025 : STA.W RandomNumberSeed
    JSL GenerateRandomNumber
    LDA.W #$0000 : STA.L Hopper.fallingFlag,X
    STA.L Hopper.readyToHopFlag,X : STA.L Hopper.hopTableIndex,X
    LDA.W Enemy.ID,X : TAX
    LDA.L EnemyHeaders_sidehopperVariantIndex,X : ASL
    LDX.W EnemyIndex ; >.<
    STA.L Hopper.variantIndex,X : LDA.W Enemy.init0,X : BNE .upsideDown
    LDA.L Hopper.variantIndex,X : TAY
    LDA.W InstListPointers_Sidehopper_Landed_UpsideUp,Y
    BRA +

  .upsideDown:
    LDA.L Hopper.variantIndex,X : TAY
    LDA.W InstListPointers_Sidehopper_Landed_UpsideDown,Y

+   STA.L Hopper.instList,X
    JSR SetSidehopperInstList
    LDA.W Enemy.ID,X : TAX
    LDA.L EnemyHeaders_sidehopperVariantIndex,X : BEQ .sidehopper
    LDA.W #$0002
    LDX.W EnemyIndex
    STA.L Hopper.hopTableIndex,X

  .sidehopper:
    LDX.W EnemyIndex
    LDA.L Hopper.hopTableIndex,X : TAY
    LDA.W HopTable_Small_JumpHeight,Y : STA.B DP_Temp16
    LDA.W HopTable_Small_YSpeedTableIndexDelta,Y : STA.B DP_Temp18
    JSR Hoppers_CalculateInitialHopSpeed
    STA.L Hopper.smallHopInitialYSpeedTableIndex,X
    LDA.L Hopper.hopTableIndex,X : TAY
    LDA.W HopTable_Big_JumpHeight,Y : STA.B DP_Temp16
    LDA.W HopTable_Big_YSpeedTableIndexDelta,Y : STA.B DP_Temp18
    JSR Hoppers_CalculateInitialHopSpeed
    STA.L Hopper.bigHopInitialYSpeedTableIndex,X
    LDA.W #Function_Hopper_Hop : STA.W Hopper.function,X
    RTL


;;; $AB9D: Calculate initial hop speed ;;;
Hoppers_CalculateInitialHopSpeed:
;; Parameters:
;;     $16: Jump height. Unit 1/100h px
;;     $18: Y speed table index delta
;; Returns:
;;     A: Initial Y speed table index

; Calculates the initial quadratic speed table index required to make a jump
    STZ.B DP_Temp12 : STZ.B DP_Temp14

  .loop:
    LDA.B DP_Temp12 : CLC : ADC.B DP_Temp18 : STA.B DP_Temp12
    ASL #3 : TAY
    LDA.B DP_Temp14 : CLC : ADC.W CommonEnemySpeeds_QuadraticallyIncreasing+1,Y : STA.B DP_Temp14
    CMP.B DP_Temp16 : BMI .loop
    LDA.B DP_Temp12
    RTS


;;; $ABBB: Set sidehopper enemy instruction list ;;;
SetSidehopperInstList:
    LDX.W EnemyIndex
    LDA.L Hopper.instList,X : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    RTS


;;; $ABCF: Main AI - enemy $D93F/$D97F/$D9BF/$D9FF/$DA3F (sidehopper / desgeega / super-sidehopper / super-desgeega) ;;;
MainAI_Hopper:
    LDX.W EnemyIndex
    JSR.W (Hopper.function,X)
    RTL


;;; $ABD6: Sidehopper function - hop ;;;
Function_Hopper_Hop:
    JSL GenerateRandomNumber
    AND.W #$0001 : ASL : TAY
    LDA.W HopFunctionPointers_Sidehopper,Y : STA.W Hopper.function,X
    RTS


;;; $ABE6: Sidehopper function - small hop ;;;
Function_Hopper_SmallHop:
    LDX.W EnemyIndex
    LDA.L Hopper.hopTableIndex,X : TAY
    LDA.W HopTable_Small_YSpeedTableIndexDelta,Y : STA.W Hopper.XSpeedTableIndexDelta,X
    LDA.W HopTable_Small_XSpeed,Y : STA.W Hopper.XVelocity,X
    LDA.L Hopper.smallHopInitialYSpeedTableIndex,X : STA.W Hopper.YSpeedTableIndex,X
    LDA.W #Function_Hopper_Hop_UpsideUp : STA.W Hopper.function,X
    LDA.W Enemy.init0,X : BEQ .return
    LDA.W #Function_Hopper_Hop_UpsideDown : STA.W Hopper.function,X

  .return:
    RTS


;;; $AC13: Sidehopper function - big hop ;;;
Function_Hopper_BigHop:
    LDX.W EnemyIndex
    LDA.L Hopper.hopTableIndex,X : TAY
    LDA.W HopTable_Big_YSpeedTableIndexDelta,Y : STA.W Hopper.XSpeedTableIndexDelta,X
    LDA.W HopTable_Big_XSpeed,Y : STA.W Hopper.XVelocity,X
    LDA.L Hopper.bigHopInitialYSpeedTableIndex,X : STA.W Hopper.YSpeedTableIndex,X
    LDA.W #Function_Hopper_Hop_UpsideUp : STA.W Hopper.function,X
    LDA.W Enemy.init0,X : BEQ .return
    LDA.W #Function_Hopper_Hop_UpsideDown : STA.W Hopper.function,X

  .return:
    RTS


;;; $AC40: Sidehopper function - hop - upside up ;;;
Function_Hopper_Hop_UpsideUp:
    LDX.W EnemyIndex
    LDA.W #Function_Hopper_HopBackwards_UpsideUp : STA.W Hopper.function,X
    JSL Get_SamusX_minus_EnemyX
    BMI .return
    LDA.W #Function_Hopper_HopForwards_UpsideUp : STA.W Hopper.function,X

  .return:
    RTS


;;; $AC56: Sidehopper function - hop - upside down ;;;
Function_Hopper_Hop_UpsideDown:
    LDX.W EnemyIndex
    LDA.W #Function_Hopper_HopBackwards_UpsideDown : STA.W Hopper.function,X
    JSL Get_SamusX_minus_EnemyX
    BMI .return
    LDA.W #Function_Hopper_HopForwards_UpsideDown : STA.W Hopper.function,X

  .return:
    RTS


;;; $AC6C: Sidehopper function - hop backwards - upside up ;;;
Function_Hopper_HopBackwards_UpsideUp:
    LDX.W EnemyIndex
    LDA.W Hopper.XVelocity,X : EOR.W #$FFFF : INC : STA.W Hopper.XVelocity,X
    LDA.L Hopper.variantIndex,X : TAY
    LDA.W InstListPointers_Sidehopper_Hopping_UpsideUp,Y : STA.L Hopper.instList,X
    JSR SetSidehopperInstList
    LDA.W #Function_Hopper_Jumping_UpsideUp : STA.W Hopper.function,X
    RTS


;;; $AC8F: Sidehopper function - hop forwards - upside up ;;;
Function_Hopper_HopForwards_UpsideUp:
    LDX.W EnemyIndex
    LDA.L Hopper.variantIndex,X : TAY
    LDA.W InstListPointers_Sidehopper_Hopping_UpsideUp,Y : STA.L Hopper.instList,X
    JSR SetSidehopperInstList
    LDA.W #Function_Hopper_Jumping_UpsideUp_duplicate : STA.W Hopper.function,X
    RTS


;;; $ACA8: Sidehopper function - hop backwards - upside down ;;;
Function_Hopper_HopBackwards_UpsideDown:
    LDX.W EnemyIndex
    LDA.W Hopper.XVelocity,X : EOR.W #$FFFF : INC : STA.W Hopper.XVelocity,X
    LDA.L Hopper.variantIndex,X : TAY
    LDA.W InstListPointers_Sidehopper_Hopping_UpsideDown,Y : STA.L Hopper.instList,X
    JSR SetSidehopperInstList
    LDA.W #Function_Hopper_Jumping_UpsideDown : STA.W Hopper.function,X
    RTS


;;; $ACCB: Sidehopper function - hop forwards - upside down ;;;
Function_Hopper_HopForwards_UpsideDown:
    LDX.W EnemyIndex
    LDA.L Hopper.variantIndex,X : TAY
    LDA.W InstListPointers_Sidehopper_Hopping_UpsideDown,Y : STA.L Hopper.instList,X
    JSR SetSidehopperInstList
    LDA.W #Function_Hopper_Jumping_UpsideDown_duplicate : STA.W Hopper.function,X
    RTS


;;; $ACE4: Sidehopper function - landed ;;;
Function_Hopper_Landed:
    LDX.W EnemyIndex
    LDA.L Hopper.variantIndex,X : TAY
    LDA.W InstListPointers_Sidehopper_Landed_UpsideUp,Y : STA.L Hopper.instList,X
    LDA.W Enemy.init0,X : BEQ .upsideDown
    LDA.L Hopper.variantIndex,X : TAY
    LDA.W InstListPointers_Sidehopper_Landed_UpsideDown,Y : STA.L Hopper.instList,X

  .upsideDown:
    JSR SetSidehopperInstList
    LDA.W #Function_Hopper_WaitToHop : STA.W Hopper.function,X
    RTS


;;; $AD0E: Sidehopper function - jumping - upside up ;;;
Function_Hopper_Jumping_UpsideUp:
    LDX.W EnemyIndex
    LDA.L Hopper.fallingFlag,X : BNE .falling
    JSR HopperMovement_Jumping_UpsideUp
    BRA .return

  .falling:
    JSR HopperMovement_Falling_UpsideUp

  .return:
    RTS


;;; $AD20: Sidehopper function - jumping - upside up ;;;
Function_Hopper_Jumping_UpsideUp_duplicate:
; Clone of Function_Hopper_Jumping_UpsideUp
    LDX.W EnemyIndex
    LDA.L Hopper.fallingFlag,X : BNE .falling
    JSR HopperMovement_Jumping_UpsideUp
    BRA .return

  .falling:
    JSR HopperMovement_Falling_UpsideUp

  .return:
    RTS


;;; $AD32: Sidehopper function - jumping - upside down ;;;
Function_Hopper_Jumping_UpsideDown:
    LDX.W EnemyIndex
    LDA.L Hopper.fallingFlag,X : BNE .falling
    JSR HopperMovement_Jumping_UpsideDown
    BRA .return

  .falling:
    JSR HopperMovement_Falling_UpsideDown

  .return:
    RTS


;;; $AD44: Sidehopper function - jumping - upside down ;;;
Function_Hopper_Jumping_UpsideDown_duplicate:
; Clone of Function_Hopper_Jumping_UpsideDown
    LDX.W EnemyIndex
    LDA.L Hopper.fallingFlag,X : BNE .falling
    JSR HopperMovement_Jumping_UpsideDown
    BRA .return

  .falling:
    JSR HopperMovement_Falling_UpsideDown

  .return:
    RTS


;;; $AD56: Sidehopper function - wait to hop ;;;
Function_Hopper_WaitToHop:
    LDX.W EnemyIndex
    LDA.L Hopper.readyToHopFlag,X : BEQ .return
    LDA.W #$0000 : STA.L Hopper.readyToHopFlag,X
    LDA.W #Function_Hopper_Hop : STA.W Hopper.function,X

  .return:
    RTS


;;; $AD6D: Sidehopper movement - jumping - upside up ;;;
HopperMovement_Jumping_UpsideUp:
    LDX.W EnemyIndex
    LDA.W Hopper.YSpeedTableIndex,X : ASL #3 : TAY
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing+6,Y : STA.B DP_Temp14
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing+4,Y : STA.B DP_Temp12
    JSL MoveEnemyDownBy_14_12
    BCC .notCollidedWithBlock
    LDA.W Hopper.XVelocity,X : EOR.W #$FFFF : INC : STA.W Hopper.XVelocity,X
    LDA.W #$0001 : STA.L Hopper.fallingFlag,X
    BRA .return

  .notCollidedWithBlock:
    LDA.W Hopper.XVelocity,X : STA.B DP_Temp14
    STZ.B DP_Temp12
    JSL MoveEnemyRightBy_14_12_IgnoreSlopes
    BCC .notCollidedWithWall
    LDA.W Hopper.XVelocity,X : EOR.W #$FFFF : INC : STA.W Hopper.XVelocity,X
    LDA.W #$0001 : STA.L Hopper.fallingFlag,X
    BRA .return

  .notCollidedWithWall:
    LDA.W Hopper.YSpeedTableIndex,X : SEC : SBC.W Hopper.XSpeedTableIndexDelta,X : STA.W Hopper.YSpeedTableIndex,X : BPL .return
    LDA.W #$0001 : STA.L Hopper.fallingFlag,X
    LDA.W #$0000 : STA.W Hopper.YSpeedTableIndex,X

  .return:
    RTS


;;; $ADD4: Sidehopper movement - falling - upside up ;;;
HopperMovement_Falling_UpsideUp:
    LDX.W EnemyIndex
    LDA.W Hopper.YSpeedTableIndex,X : ASL #3 : TAY
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing+2,Y : STA.B DP_Temp14
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing,Y : STA.B DP_Temp12
    JSL MoveEnemyDownBy_14_12
    BCC .notCollidedWithBlock
    LDA.W #$0000 : STA.L Hopper.fallingFlag,X
    LDA.W #Function_Hopper_Landed : STA.W Hopper.function,X
    BRA .return

  .notCollidedWithBlock:
    LDA.W Hopper.XVelocity,X : STA.B DP_Temp14
    STZ.B DP_Temp12
    JSL MoveEnemyRightBy_14_12_IgnoreSlopes
    BCC .notCollidedWithWall
    LDA.W Hopper.XVelocity,X : EOR.W #$FFFF : INC : STA.W Hopper.XVelocity,X

  .notCollidedWithWall:
    LDA.W Hopper.YSpeedTableIndex,X : CLC : ADC.W Hopper.XSpeedTableIndexDelta,X : CMP.W #$0040 : BMI +
    LDA.W #$0040

+   STA.W Hopper.YSpeedTableIndex,X

  .return:
    RTS


;;; $AE27: Sidehopper movement - jumping - upside down ;;;
HopperMovement_Jumping_UpsideDown:
    LDX.W EnemyIndex
    LDA.W Hopper.YSpeedTableIndex,X : ASL #3 : TAY
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing+2,Y : STA.B DP_Temp14
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing,Y : STA.B DP_Temp12
    JSL MoveEnemyDownBy_14_12
    BCC .notCollidedWithBlock
    LDA.W Hopper.XVelocity,X : EOR.W #$FFFF : INC : STA.W Hopper.XVelocity,X
    LDA.W #$0001 : STA.L Hopper.fallingFlag,X
    BRA .return

  .notCollidedWithBlock:
    LDA.W Hopper.XVelocity,X : STA.B DP_Temp14
    STZ.B DP_Temp12
    JSL MoveEnemyRightBy_14_12_IgnoreSlopes
    BCC .notCollidedWithWall
    LDA.W Hopper.XVelocity,X : EOR.W #$FFFF : INC : STA.W Hopper.XVelocity,X
    LDA.W #$0001 : STA.L Hopper.fallingFlag,X
    BRA .return

  .notCollidedWithWall:
    LDA.W Hopper.YSpeedTableIndex,X : SEC : SBC.W Hopper.XSpeedTableIndexDelta,X : STA.W Hopper.YSpeedTableIndex,X : BPL .return
    LDA.W #$0001 : STA.L Hopper.fallingFlag,X
    LDA.W #$0000 : STA.W Hopper.YSpeedTableIndex,X

  .return:
    RTS


;;; $AE8E: Sidehopper movement - falling - upside down ;;;
HopperMovement_Falling_UpsideDown:
    LDX.W EnemyIndex
    LDA.W Hopper.YSpeedTableIndex,X : ASL #3 : TAY
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing+6,Y : STA.B DP_Temp14
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing+4,Y : STA.B DP_Temp12
    JSL MoveEnemyDownBy_14_12
    BCC .notCollidedWithBlock
    LDA.W #$0000 : STA.L Hopper.fallingFlag,X
    LDA.W #Function_Hopper_Landed : STA.W Hopper.function,X
    BRA .return

  .notCollidedWithBlock:
    LDA.W Hopper.XVelocity,X : STA.B DP_Temp14
    STZ.B DP_Temp12
    JSL MoveEnemyRightBy_14_12_IgnoreSlopes
    BCC .notCollidedWithWall
    LDA.W Hopper.XVelocity,X : EOR.W #$FFFF : INC : STA.W Hopper.XVelocity,X

  .notCollidedWithWall:
    LDA.W Hopper.YSpeedTableIndex,X : CLC : ADC.W Hopper.XSpeedTableIndexDelta,X : CMP.W #$0040 : BMI +
    LDA.W #$0040

+   STA.W Hopper.YSpeedTableIndex,X

  .return:
    RTS


;;; $AEE1: RTL ;;;
RTL_A3AEE1:
    RTL


;;; $AEE2: RTL ;;;
RTL_A3AEE2:
    RTL


;;; $AEE3: Sidehopper spritemaps ;;;
Spritemap_Sidehopper_0:
    dw $0005
    %spritemapEntry(1, $1F8, $F3, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $04, $EC, 0, 1, 2, 0, $106)
    %spritemapEntry(1, $04, $FC, 0, 1, 2, 0, $104)
    %spritemapEntry(1, $1EC, $EC, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $1EC, $FC, 0, 0, 2, 0, $104)

Spritemap_Sidehopper_1:
    dw $0005
    %spritemapEntry(1, $1F8, $F5, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $04, $EC, 0, 1, 2, 0, $10A)
    %spritemapEntry(1, $1EC, $EC, 0, 0, 2, 0, $10A)
    %spritemapEntry(1, $04, $FC, 0, 1, 2, 0, $108)
    %spritemapEntry(1, $1EC, $FC, 0, 0, 2, 0, $108)

Spritemap_Sidehopper_2:
    dw $0005
    %spritemapEntry(1, $1F8, $EF, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $04, $04, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $04, $F4, 0, 1, 2, 0, $10C)
    %spritemapEntry(1, $1EC, $04, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $1EC, $F4, 0, 0, 2, 0, $10C)

Spritemap_Sidehopper_3:
    dw $0005
    %spritemapEntry(1, $1F8, $FD, 1, 0, 2, 0, $100)
    %spritemapEntry(1, $04, $04, 1, 1, 2, 0, $106)
    %spritemapEntry(1, $04, $F4, 1, 1, 2, 0, $104)
    %spritemapEntry(1, $1EC, $04, 1, 0, 2, 0, $106)
    %spritemapEntry(1, $1EC, $F4, 1, 0, 2, 0, $104)

Spritemap_Sidehopper_4:
    dw $0005
    %spritemapEntry(1, $1F8, $FB, 1, 0, 2, 0, $102)
    %spritemapEntry(1, $04, $04, 1, 1, 2, 0, $10A)
    %spritemapEntry(1, $1EC, $04, 1, 0, 2, 0, $10A)
    %spritemapEntry(1, $04, $F4, 1, 1, 2, 0, $108)
    %spritemapEntry(1, $1EC, $F4, 1, 0, 2, 0, $108)

Spritemap_Sidehopper_5:
    dw $0005
    %spritemapEntry(1, $1F8, $01, 1, 0, 2, 0, $100)
    %spritemapEntry(1, $04, $EC, 1, 1, 2, 0, $10E)
    %spritemapEntry(1, $04, $FC, 1, 1, 2, 0, $10C)
    %spritemapEntry(1, $1EC, $EC, 1, 0, 2, 0, $10E)
    %spritemapEntry(1, $1EC, $FC, 1, 0, 2, 0, $10C)


;;; $AF85: Palette - enemy $D97F (desgeega) ;;;
Palette_Dessgeega:
    dw $3800,$72FA,$55B0,$2845,$1801,$6210,$496B,$38C6
    dw $2C63,$241F,$1C17,$142F,$0C47,$03E0,$02A0,$0140


;;; $AFA5: Instruction list - desgeega - hopping - upside up ;;;
InstList_Dessgeega_Hopping_UpsideUp:
    dw Instruction_Common_EnableOffScreenProcessing
    dw $0001,Spritemap_Dessgeega_2
    dw Instruction_Common_Sleep


;;; $AFAD: Instruction list - desgeega - landed - upside up ;;;
InstList_Dessgeega_Landed_UpsideUp:
    dw Instruction_Common_DisableOffScreenProcessing
    dw $0002,Spritemap_Dessgeega_0
    dw $0005,Spritemap_Dessgeega_1
    dw $0002,Spritemap_Dessgeega_0
    dw $0003,Spritemap_Dessgeega_1
    dw Instruction_Hopper_ReadyToHop
    dw Instruction_Common_Sleep


;;; $AFC3: Instruction list - desgeega - hopping - upside down ;;;
InstList_Dessgeega_Hopping_UpsideDown:
    dw Instruction_Common_EnableOffScreenProcessing
    dw $0001,Spritemap_Dessgeega_5
    dw Instruction_Common_Sleep


;;; $AFCB: Instruction list - desgeega - landed - upside down ;;;
InstList_Dessgeega_Landed_UpsideDown:
    dw Instruction_Common_DisableOffScreenProcessing
    dw $0002,Spritemap_Dessgeega_3
    dw $0005,Spritemap_Dessgeega_4
    dw $0002,Spritemap_Dessgeega_3
    dw $0003,Spritemap_Dessgeega_4
    dw Instruction_Hopper_ReadyToHop
    dw Instruction_Common_Sleep


;;; $AFE1: RTL ;;;
RTL_A3AFE1:
    RTL


;;; $AFE2: RTL ;;;
RTL_A3AFE2:
    RTL


;;; $AFE3: Desgeega spritemaps ;;;
Spritemap_Dessgeega_0:
    dw $0005
    %spritemapEntry(1, $1F8, $F3, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $04, $EC, 0, 1, 2, 0, $106)
    %spritemapEntry(1, $04, $FC, 0, 1, 2, 0, $104)
    %spritemapEntry(1, $1EC, $EC, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $1EC, $FC, 0, 0, 2, 0, $104)

Spritemap_Dessgeega_1:
    dw $0005
    %spritemapEntry(1, $1F8, $F5, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $04, $EC, 0, 1, 2, 0, $10A)
    %spritemapEntry(1, $1EC, $EC, 0, 0, 2, 0, $10A)
    %spritemapEntry(1, $04, $FC, 0, 1, 2, 0, $108)
    %spritemapEntry(1, $1EC, $FC, 0, 0, 2, 0, $108)

Spritemap_Dessgeega_2:
    dw $0005
    %spritemapEntry(1, $1F8, $EF, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $04, $04, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $04, $F4, 0, 1, 2, 0, $10C)
    %spritemapEntry(1, $1EC, $04, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $1EC, $F4, 0, 0, 2, 0, $10C)

Spritemap_Dessgeega_3:
    dw $0005
    %spritemapEntry(1, $1F8, $FD, 1, 0, 2, 0, $100)
    %spritemapEntry(1, $04, $04, 1, 1, 2, 0, $106)
    %spritemapEntry(1, $04, $F4, 1, 1, 2, 0, $104)
    %spritemapEntry(1, $1EC, $04, 1, 0, 2, 0, $106)
    %spritemapEntry(1, $1EC, $F4, 1, 0, 2, 0, $104)

Spritemap_Dessgeega_4:
    dw $0005
    %spritemapEntry(1, $1F8, $FB, 1, 0, 2, 0, $102)
    %spritemapEntry(1, $04, $04, 1, 1, 2, 0, $10A)
    %spritemapEntry(1, $1EC, $04, 1, 0, 2, 0, $10A)
    %spritemapEntry(1, $04, $F4, 1, 1, 2, 0, $108)
    %spritemapEntry(1, $1EC, $F4, 1, 0, 2, 0, $108)

Spritemap_Dessgeega_5:
    dw $0005
    %spritemapEntry(1, $1F8, $01, 1, 0, 2, 0, $100)
    %spritemapEntry(1, $04, $EC, 1, 1, 2, 0, $10E)
    %spritemapEntry(1, $04, $FC, 1, 1, 2, 0, $10C)
    %spritemapEntry(1, $1EC, $EC, 1, 0, 2, 0, $10E)
    %spritemapEntry(1, $1EC, $FC, 1, 0, 2, 0, $10C)


;;; $B085: Palette - enemy $D9BF (super-sidehopper) ;;;
Palette_SidehopperLarge:
    dw $3800,$57FF,$42F7,$0D4A,$0063,$4F5A,$36B5,$2610
    dw $1DCE,$4EDA,$3A35,$2990,$14EB,$5FE0,$32A0,$1940


;;; $B0A5: Palette - enemy $D9FF (Tourian super-sidehopper) ;;;
Palette_SidehopperTourian:
    dw $3800,$7FFF,$56E0,$3180,$18C0,$6BC0,$5EC0,$4A20
    dw $35A0,$7FFF,$039C,$0237,$00D1,$03FF,$0237,$00D1


;;; $B0C5: Instruction list - super-sidehopper - hopping - upside up ;;;
InstList_SidehopperLarge_Hopping_UpsideUp:
    dw Instruction_Common_EnableOffScreenProcessing
    dw Instruction_Sidehopper_QueueSoundInY_Lib2_Max3,$005D
    dw $0001,Spritemap_SidehopperTourian_2
    dw Instruction_Common_Sleep


;;; $B0D1: Instruction list - super-sidehopper - landed - upside up ;;;
InstList_SidehopperLarge_Landed_UpsideUp:
    dw Instruction_Common_DisableOffScreenProcessing
    dw Instruction_Sidehopper_QueueSoundInY_Lib2_Max3,$005E
    dw $0002,Spritemap_SidehopperTourian_0
    dw $0005,Spritemap_SidehopperTourian_1
    dw $0002,Spritemap_SidehopperTourian_0
    dw $0003,Spritemap_SidehopperTourian_1
    dw Instruction_Hopper_ReadyToHop
    dw Instruction_Common_Sleep


;;; $B0EB: Instruction list - super-sidehopper - hopping - upside down ;;;
InstList_SidehopperLarge_Hopping_UpsideDown:
    dw Instruction_Common_EnableOffScreenProcessing
    dw Instruction_Sidehopper_QueueSoundInY_Lib2_Max3,$005D
    dw $0001,Spritemap_SidehopperTourian_5
    dw Instruction_Common_Sleep


;;; $B0F7: Instruction list - super-sidehopper - landed - upside down ;;;
InstList_SidehopperLarge_Landed_UpsideDown:
    dw Instruction_Common_DisableOffScreenProcessing
    dw Instruction_Sidehopper_QueueSoundInY_Lib2_Max3,$005E
    dw $0002,Spritemap_SidehopperTourian_3
    dw $0005,Spritemap_SidehopperTourian_4
    dw $0002,Spritemap_SidehopperTourian_3
    dw $0003,Spritemap_SidehopperTourian_4
    dw Instruction_Hopper_ReadyToHop
    dw Instruction_Common_Sleep


;;; $B111: Tourian super-sidehopper spritemaps ;;;
Spritemap_SidehopperTourian_0:
    dw $0007
    %spritemapEntry(0, $00, $EC, 0, 0, 2, 0, $101)
    %spritemapEntry(0, $1F8, $EC, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $420C, $04, 0, 1, 2, 0, $106)
    %spritemapEntry(1, $43E4, $04, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $4208, $F4, 0, 1, 2, 0, $104)
    %spritemapEntry(1, $43E8, $F4, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $43F8, $F4, 0, 0, 2, 0, $110)

Spritemap_SidehopperTourian_1:
    dw $0007
    %spritemapEntry(1, $43F8, $F6, 0, 0, 2, 0, $112)
    %spritemapEntry(1, $420D, $04, 0, 1, 2, 0, $10A)
    %spritemapEntry(1, $43E3, $04, 0, 0, 2, 0, $10A)
    %spritemapEntry(1, $4208, $F4, 0, 1, 2, 0, $108)
    %spritemapEntry(1, $43E8, $F4, 0, 0, 2, 0, $108)
    %spritemapEntry(0, $00, $EE, 0, 0, 2, 0, $101)
    %spritemapEntry(0, $1F8, $EE, 0, 0, 2, 0, $100)

Spritemap_SidehopperTourian_2:
    dw $000B
    %spritemapEntry(0, $10, $0C, 0, 1, 2, 0, $102)
    %spritemapEntry(0, $08, $0C, 0, 1, 2, 0, $103)
    %spritemapEntry(0, $1F0, $0C, 0, 0, 2, 0, $103)
    %spritemapEntry(0, $1E8, $0C, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $4208, $FC, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $43E8, $FC, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $4208, $EC, 0, 1, 2, 0, $10C)
    %spritemapEntry(1, $43E8, $EC, 0, 0, 2, 0, $10C)
    %spritemapEntry(0, $00, $E3, 0, 0, 2, 0, $101)
    %spritemapEntry(0, $1F8, $E3, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $43F8, $EB, 0, 0, 2, 0, $110)

Spritemap_SidehopperTourian_3:
    dw $0007
    %spritemapEntry(0, $00, $0C, 1, 0, 2, 0, $101)
    %spritemapEntry(0, $1F8, $0C, 1, 0, 2, 0, $100)
    %spritemapEntry(1, $420C, $EC, 1, 1, 2, 0, $106)
    %spritemapEntry(1, $43E4, $EC, 1, 0, 2, 0, $106)
    %spritemapEntry(1, $4208, $FC, 1, 1, 2, 0, $104)
    %spritemapEntry(1, $43E8, $FC, 1, 0, 2, 0, $104)
    %spritemapEntry(1, $43F8, $FC, 1, 0, 2, 0, $110)

Spritemap_SidehopperTourian_4:
    dw $0007
    %spritemapEntry(1, $43F8, $FA, 1, 0, 2, 0, $112)
    %spritemapEntry(1, $420D, $EC, 1, 1, 2, 0, $10A)
    %spritemapEntry(1, $43E3, $EC, 1, 0, 2, 0, $10A)
    %spritemapEntry(1, $4208, $FC, 1, 1, 2, 0, $108)
    %spritemapEntry(1, $43E8, $FC, 1, 0, 2, 0, $108)
    %spritemapEntry(0, $00, $0A, 1, 0, 2, 0, $101)
    %spritemapEntry(0, $1F8, $0A, 1, 0, 2, 0, $100)

Spritemap_SidehopperTourian_5:
    dw $000B
    %spritemapEntry(0, $10, $EC, 1, 1, 2, 0, $102)
    %spritemapEntry(0, $08, $EC, 1, 1, 2, 0, $103)
    %spritemapEntry(0, $1F0, $EC, 1, 0, 2, 0, $103)
    %spritemapEntry(0, $1E8, $EC, 1, 0, 2, 0, $102)
    %spritemapEntry(1, $4208, $F4, 1, 1, 2, 0, $10E)
    %spritemapEntry(1, $43E8, $F4, 1, 0, 2, 0, $10E)
    %spritemapEntry(1, $4208, $04, 1, 1, 2, 0, $10C)
    %spritemapEntry(1, $43E8, $04, 1, 0, 2, 0, $10C)
    %spritemapEntry(0, $00, $15, 1, 0, 2, 0, $101)
    %spritemapEntry(0, $1F8, $15, 1, 0, 2, 0, $100)
    %spritemapEntry(1, $43F8, $05, 1, 0, 2, 0, $110)


;;; $B217: Palette - enemy $DA3F (super-desgeega) ;;;
Palette_DessgeegaLarge:
    dw $3800,$72FA,$55B0,$2845,$1801,$6210,$496B,$38C6
    dw $2C63,$241F,$1C17,$142F,$0C47,$03E0,$02A0,$0140


;;; $B237: Instruction list - super-desgeega - hopping - upside up ;;;
InstList_DessgeegaLarge_Hopping_UpsideUp:
    dw Instruction_Common_EnableOffScreenProcessing
    dw $0001,Spritemap_DessgeegaLarge_2
    dw Instruction_Common_Sleep


;;; $B23F: Instruction list - super-desgeega - landed - upside up ;;;
InstList_DessgeegaLarge_Landed_UpsideUp:
    dw Instruction_Common_DisableOffScreenProcessing
    dw $0002,Spritemap_DessgeegaLarge_0
    dw $0005,Spritemap_DessgeegaLarge_1
    dw $0002,Spritemap_DessgeegaLarge_0
    dw $0003,Spritemap_DessgeegaLarge_1
    dw Instruction_Hopper_ReadyToHop
    dw Instruction_Common_Sleep


;;; $B255: Instruction list - super-desgeega - hopping - upside down ;;;
InstList_DessgeegaLarge_Hopping_UpsideDown:
    dw Instruction_Common_EnableOffScreenProcessing
    dw $0001,Spritemap_DessgeegaLarge_5
    dw Instruction_Common_Sleep


;;; $B25D: Instruction list - super-desgeega - landed - upside down ;;;
InstList_DessgeegaLarge_Landed_UpsideDown:
    dw Instruction_Common_DisableOffScreenProcessing
    dw $0002,Spritemap_DessgeegaLarge_3
    dw $0005,Spritemap_DessgeegaLarge_4
    dw $0002,Spritemap_DessgeegaLarge_3
    dw $0003,Spritemap_DessgeegaLarge_4
    dw Instruction_Hopper_ReadyToHop
    dw Instruction_Common_Sleep


;;; $B273: Super-desgeega spritemaps ;;;
Spritemap_DessgeegaLarge_0:
    dw $0009
    %spritemapEntry(1, $43F8, $F5, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $43E5, $F4, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $420B, $F4, 0, 1, 2, 0, $104)
    %spritemapEntry(0, $06, $F5, 0, 1, 2, 0, $11A)
    %spritemapEntry(0, $1F2, $F5, 0, 0, 2, 0, $11A)
    %spritemapEntry(1, $420B, $04, 0, 1, 2, 0, $106)
    %spritemapEntry(1, $43E5, $04, 0, 0, 2, 0, $106)
    %spritemapEntry(0, $00, $ED, 0, 0, 2, 0, $10D)
    %spritemapEntry(0, $1F8, $ED, 0, 0, 2, 0, $10C)

Spritemap_DessgeegaLarge_1:
    dw $0009
    %spritemapEntry(1, $43F8, $F6, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $420A, $F4, 0, 1, 2, 0, $104)
    %spritemapEntry(1, $43E6, $F4, 0, 0, 2, 0, $104)
    %spritemapEntry(0, $06, $F6, 0, 1, 2, 0, $11C)
    %spritemapEntry(0, $1F2, $F6, 0, 0, 2, 0, $11C)
    %spritemapEntry(1, $420B, $04, 0, 1, 2, 0, $106)
    %spritemapEntry(1, $43E5, $04, 0, 0, 2, 0, $106)
    %spritemapEntry(0, $00, $EE, 0, 0, 2, 0, $10B)
    %spritemapEntry(0, $1F8, $EE, 0, 0, 2, 0, $10A)

Spritemap_DessgeegaLarge_2:
    dw $000B
    %spritemapEntry(1, $43F8, $F0, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $420B, $F4, 0, 1, 2, 0, $104)
    %spritemapEntry(1, $43E5, $F4, 0, 0, 2, 0, $104)
    %spritemapEntry(0, $07, $F4, 0, 1, 2, 0, $11B)
    %spritemapEntry(0, $1F1, $F4, 0, 0, 2, 0, $11B)
    %spritemapEntry(0, $00, $E8, 0, 0, 2, 0, $10D)
    %spritemapEntry(0, $1F8, $E8, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $420A, $14, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $43E6, $14, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $420A, $04, 0, 1, 2, 0, $108)
    %spritemapEntry(1, $43E6, $04, 0, 0, 2, 0, $108)

Spritemap_DessgeegaLarge_3:
    dw $0009
    %spritemapEntry(1, $43F8, $FB, 1, 0, 2, 0, $100)
    %spritemapEntry(1, $43E5, $FC, 1, 0, 2, 0, $104)
    %spritemapEntry(1, $420B, $FC, 1, 1, 2, 0, $104)
    %spritemapEntry(0, $06, $03, 1, 1, 2, 0, $11A)
    %spritemapEntry(0, $1F2, $03, 1, 0, 2, 0, $11A)
    %spritemapEntry(1, $420B, $EC, 1, 1, 2, 0, $106)
    %spritemapEntry(1, $43E5, $EC, 1, 0, 2, 0, $106)
    %spritemapEntry(0, $00, $0B, 1, 0, 2, 0, $10D)
    %spritemapEntry(0, $1F8, $0B, 1, 0, 2, 0, $10C)

Spritemap_DessgeegaLarge_4:
    dw $0009
    %spritemapEntry(1, $43F8, $FA, 1, 0, 2, 0, $102)
    %spritemapEntry(1, $420A, $FC, 1, 1, 2, 0, $104)
    %spritemapEntry(1, $43E6, $FC, 1, 0, 2, 0, $104)
    %spritemapEntry(0, $06, $02, 1, 1, 2, 0, $11C)
    %spritemapEntry(0, $1F2, $02, 1, 0, 2, 0, $11C)
    %spritemapEntry(1, $420B, $EC, 1, 1, 2, 0, $106)
    %spritemapEntry(1, $43E5, $EC, 1, 0, 2, 0, $106)
    %spritemapEntry(0, $00, $0A, 1, 0, 2, 0, $10B)
    %spritemapEntry(0, $1F8, $0A, 1, 0, 2, 0, $10A)

Spritemap_DessgeegaLarge_5:
    dw $000B
    %spritemapEntry(1, $43F8, $04, 1, 0, 2, 0, $100)
    %spritemapEntry(1, $420B, $00, 1, 1, 2, 0, $104)
    %spritemapEntry(1, $43E5, $00, 1, 0, 2, 0, $104)
    %spritemapEntry(0, $07, $08, 1, 1, 2, 0, $11B)
    %spritemapEntry(0, $1F1, $08, 1, 0, 2, 0, $11B)
    %spritemapEntry(0, $00, $14, 1, 0, 2, 0, $10D)
    %spritemapEntry(0, $1F8, $14, 1, 0, 2, 0, $10C)
    %spritemapEntry(1, $420A, $E0, 1, 1, 2, 0, $10E)
    %spritemapEntry(1, $43E6, $E0, 1, 0, 2, 0, $10E)
    %spritemapEntry(1, $420A, $F0, 1, 1, 2, 0, $108)
    %spritemapEntry(1, $43E6, $F0, 1, 0, 2, 0, $108)


;;; $B3A1: Palette - enemy $DA7F (zoa) ;;;
Palette_Zoa:
    dw $3800,$72FA,$55B0,$2845,$1801,$6210,$496B,$38C6
    dw $2C63,$1D79,$1933,$150E,$10C8,$3BE0,$2680,$1580


;;; $B3C1: Instruction list - facing left - shooting ;;;
InstList_Zoa_FacingLeft_Shooting:
    dw Instruction_Zoa_SetXSpeedTableIndexTo4
    dw $0040,Spritemap_Zoa_0
    dw Instruction_Zoa_SetXSpeedTableIndexTo8
    dw $0008,Spritemap_Zoa_1
    dw Instruction_Zoa_SetXSpeedTableIndexToC
    dw $0030,Spritemap_Zoa_2
    dw Instruction_Common_GotoY
    dw InstList_Zoa_FacingLeft_Shooting


;;; $B3D7: Instruction list - facing left - rising ;;;
InstList_Zoa_FacingLeft_Rising:
    dw $0004,Spritemap_Zoa_4
    dw $0004,Spritemap_Zoa_3
    dw $0004,Spritemap_Zoa_5
    dw Instruction_Common_GotoY
    dw InstList_Zoa_FacingLeft_Rising


;;; $B3E7: Instruction list - facing right - shooting ;;;
InstList_Zoa_FacingRight_Shooting:
    dw Instruction_Zoa_SetXSpeedTableIndexTo4
    dw $0040,Spritemap_Zoa_6
    dw Instruction_Zoa_SetXSpeedTableIndexTo8
    dw $0008,Spritemap_Zoa_7
    dw Instruction_Zoa_SetXSpeedTableIndexToC
    dw $0030,Spritemap_Zoa_8
    dw Instruction_Common_GotoY
    dw InstList_Zoa_FacingRight_Shooting


;;; $B3FD: Instruction list - facing right - rising ;;;
InstList_Zoa_FacingRight_Rising:
    dw $0004,Spritemap_Zoa_A
    dw $0004,Spritemap_Zoa_9
    dw $0004,Spritemap_Zoa_B
    dw Instruction_Common_GotoY
    dw InstList_Zoa_FacingRight_Rising


;;; $B40D: Zoa instruction list pointers ;;;
InstListPointers_Zoa:
    dw InstList_Zoa_FacingLeft_Shooting
    dw InstList_Zoa_FacingLeft_Rising
    dw InstList_Zoa_FacingRight_Shooting
    dw InstList_Zoa_FacingRight_Rising


;;; $B415: Zoa X speed table ;;;
ZoaXSpeedTable:
; Indexed by enemy $7E:7800
;        _________ X speed
;       |      ___ X subspeed
;       |     |
  .speed:
    dw $0000
  .subSpeed:
    dw       $0000
    dw $0000,$8000
    dw $0000,$A000
    dw $0002,$0000
    dw $0000,$0000


;;; $B429: Instruction - enemy X speed table index = 4 ;;;
Instruction_Zoa_SetXSpeedTableIndexTo4:
    LDX.W EnemyIndex
    LDA.W #$0004 : STA.L Zoa.XSpeedTableIndex,X
    RTL


;;; $B434: Instruction - enemy X speed table index = 8 ;;;
Instruction_Zoa_SetXSpeedTableIndexTo8:
    LDX.W EnemyIndex
    LDA.W #$0008 : STA.L Zoa.XSpeedTableIndex,X
    RTL


;;; $B43F: Instruction - enemy X speed table index = Ch ;;;
Instruction_Zoa_SetXSpeedTableIndexToC:
    LDX.W EnemyIndex
    LDA.W #$000C : STA.L Zoa.XSpeedTableIndex,X
    RTL


;;; $B44A: Initialisation AI - enemy $DA7F (zoa) ;;;
InitAI_Zoa:
    LDX.W EnemyIndex
    LDA.W #Function_Zoa_WaitForSamusToGetNear : STA.W Zoa.function,X
    LDA.W #$0000 : STA.W Zoa.instListTableIndex,X
    STA.W Zoa.previousInstListTableIndex,X : STA.L Zoa.XSpeedTableIndex,X
    LDA.W #InstList_Zoa_FacingLeft_Shooting : STA.W Enemy.instList,X
    LDA.W Enemy.properties,X : ORA.W #$0100 : STA.W Enemy.properties,X
    LDA.W Enemy.XPosition,X : STA.W Zoa.spawnXPosition,X
    LDA.W Enemy.YPosition,X : STA.W Zoa.spawnYPosition,X
    RTL


;;; $B47C: Main AI - enemy $DA7F (zoa) ;;;
MainAI_Zoa:
    LDX.W EnemyIndex
    JMP.W (Zoa.function,X)


;;; $B482: Zoa function - wait for Samus to get near ;;;
Function_Zoa_WaitForSamusToGetNear:
    LDX.W EnemyIndex ; >.<
    LDA.W #$0080
    JSL IsSamusWithinAPixelColumnsOfEnemy
    BEQ .return
    LDY.W #$0001
    JSL Get_SamusX_minus_EnemyX
    BMI .keepLeft
    LDY.W #$0003

  .keepLeft:
    TYA : STA.W Zoa.instListTableIndex,X
    JSR SetZoaInstList
    LDA.W #Function_Zoa_Rising : STA.W Zoa.function,X

  .return:
    RTL


;;; $B4A8: Zoa function - rising ;;;
Function_Zoa_Rising:
    LDA.W Enemy.properties,X : AND.W #$FEFF : STA.W Enemy.properties,X
    JSL Get_SamusY_minus_EnemyY
    BMI .rising
    DEC.W Zoa.instListTableIndex,X
    JSR SetZoaInstList
    STZ.W Enemy.var5,X
    LDA.W #Function_Zoa_Shooting : STA.W Zoa.function,X
    RTL

  .rising:
    LDA.W #$0000 : STA.B DP_Temp14
    LDA.W #$8000 : STA.B DP_Temp12
    JSL MoveEnemyY_minus_12_14
    RTL


;;; $B4D6: Zoa function - shooting ;;;
Function_Zoa_Shooting:
    LDA.W Zoa.instListTableIndex,X : BEQ .right
    LDA.L Zoa.XSpeedTableIndex,X : TAY
    LDA.W ZoaXSpeedTable_speed,Y : STA.B DP_Temp14
    LDA.W ZoaXSpeedTable_subSpeed,Y : STA.B DP_Temp12
    JSL MoveEnemyX_plus_12_14
    JSL CheckIfEnemyCenterIsOnScreen
    BNE .offScreen
    JSR SetZoaInstList
    RTL

  .right:
    LDA.L Zoa.XSpeedTableIndex,X : TAY
    LDA.W ZoaXSpeedTable_speed,Y : STA.B DP_Temp14
    LDA.W ZoaXSpeedTable_subSpeed,Y : STA.B DP_Temp12
    JSL MoveEnemyX_minus_12_14
    JSL CheckIfEnemyCenterIsOnScreen
    BNE .offScreen
    JSR SetZoaInstList
    RTL

  .offScreen:
    LDA.W Enemy.properties,X : ORA.W #$0100 : STA.W Enemy.properties,X
    LDA.W Zoa.spawnXPosition,X : STA.W Enemy.XPosition,X
    LDA.W Zoa.spawnYPosition,X : STA.W Enemy.YPosition,X
    STZ.W Zoa.instListTableIndex,X
    JSR SetZoaInstList
    LDA.W #Function_Zoa_WaitForSamusToGetNear : STA.W Zoa.function,X
    RTL


;;; $B537: Set zoa instruction list ;;;
SetZoaInstList:
    LDX.W EnemyIndex
    LDA.W Zoa.instListTableIndex,X : CMP.W Zoa.previousInstListTableIndex,X : BEQ .return
    STA.W Zoa.previousInstListTableIndex,X
    ASL : TAY
    LDA.W InstListPointers_Zoa,Y : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X

  .return:
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $B557: RTL ;;;
UNUSED_GetEnemyIndex_A3B557:
    LDX.W EnemyIndex
    RTL


;;; $B55B: RTL ;;;
UNUSED_GetEnemyIndex_A3B55B:
    LDX.W EnemyIndex
    RTL
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $B55F: Zoa spritemaps ;;;
Spritemap_Zoa_0:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $100)

Spritemap_Zoa_1:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $102)

Spritemap_Zoa_2:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $104)

Spritemap_Zoa_3:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $106)

Spritemap_Zoa_4:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $108)

Spritemap_Zoa_5:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $10A)

Spritemap_Zoa_6:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $100)

Spritemap_Zoa_7:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $102)

Spritemap_Zoa_8:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $104)

Spritemap_Zoa_9:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $106)

Spritemap_Zoa_A:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $108)

Spritemap_Zoa_B:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $10A)


;;; $B5B3: Palette - enemy $DABF (viola) ;;;
Palette_Viola:
    dw $3800,$7FFF,$56E0,$3180,$18C0,$6BC0,$5EC0,$4A20
    dw $35A0,$241F,$1C17,$142F,$0C47,$03E0,$02A0,$0140


;;; $B5D3: Instruction list - viola - upside down ;;;
InstList_Viola_UpsideDown:
    dw Instruction_Crawlers_FunctionInY
    dw Function_Crawlers_CrawlingHorizontally
    dw Instruction_Common_GotoY
    dw InstList_Viola_Normal


;;; $B5DB: Instruction list - viola - upside up ;;;
InstList_Viola_UpsideUp:
    dw Instruction_Crawlers_FunctionInY
    dw Function_Crawlers_CrawlingHorizontally
    dw Instruction_Common_GotoY
    dw InstList_Viola_Normal


;;; $B5E3: Instruction list - viola - upside right ;;;
InstList_Viola_UpsideRight:
    dw Instruction_Crawlers_FunctionInY
    dw Function_Crawlers_CrawlingVertically
    dw Instruction_Common_GotoY
    dw InstList_Viola_Normal


;;; $B5EB: Instruction list - viola - upside left ;;;
InstList_Viola_UpsideLeft:
    dw Instruction_Crawlers_FunctionInY
    dw Function_Crawlers_CrawlingVertically


;;; $B5EF: Instruction list - viola - normal ;;;
InstList_Viola_Normal:
    dw $000A,Spritemap_Viola_Normal_0
    dw $000A,Spritemap_Viola_Normal_1
    dw $000A,Spritemap_Viola_Normal_2
    dw $000A,Spritemap_Viola_Normal_3
    dw $000A,Spritemap_Viola_Normal_4
    dw $000A,Spritemap_Viola_Normal_5
    dw $000A,Spritemap_Viola_Normal_6
    dw $000A,Spritemap_Viola_Normal_7
    dw $000A,Spritemap_Viola_Normal_6
    dw $000A,Spritemap_Viola_Normal_5
    dw $000A,Spritemap_Viola_Normal_4
    dw $000A,Spritemap_Viola_Normal_3
    dw $000A,Spritemap_Viola_Normal_2
    dw $000A,Spritemap_Viola_Normal_1
    dw Instruction_Common_GotoY
    dw InstList_Viola_Normal


if !FEATURE_KEEP_UNREFERENCED
;;; $B62B: Unused. Instruction list - viola - X flipped ;;;
UNUSED_InstList_Viola_XFlipped_A3B62B:
    dw $0006,UNUSED_Spritemap_Viola_XFlipped_A3B6C1
    dw $0006,UNUSED_Spritemap_Viola_XFlipped_A3B6C8
    dw $0006,UNUSED_Spritemap_Viola_XFlipped_A3B6CF
    dw $0006,UNUSED_Spritemap_Viola_XFlipped_A3B6D6
    dw $0006,UNUSED_Spritemap_Viola_XFlipped_A3B6DD
    dw $0006,UNUSED_Spritemap_Viola_XFlipped_A3B6E4
    dw $0006,UNUSED_Spritemap_Viola_XFlipped_A3B6EB
    dw $0006,UNUSED_Spritemap_Viola_XFlipped_A3B6F2
    dw $0006,UNUSED_Spritemap_Viola_XFlipped_A3B6EB
    dw $0006,UNUSED_Spritemap_Viola_XFlipped_A3B6E4
    dw $0006,UNUSED_Spritemap_Viola_XFlipped_A3B6DD
    dw $0006,UNUSED_Spritemap_Viola_XFlipped_A3B6D6
    dw $0006,UNUSED_Spritemap_Viola_XFlipped_A3B6CF
    dw $0006,UNUSED_Spritemap_Viola_XFlipped_A3B6C8
    dw Instruction_Common_GotoY
    dw UNUSED_InstList_Viola_XFlipped_A3B62B
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $B667: Viola initial instruction list pointers ;;;
InitialInstListPointers_Viola:
; Indexed by [enemy initialisation parameter] * 2
    dw InstList_Viola_UpsideRight
    dw InstList_Viola_UpsideLeft
    dw InstList_Viola_UpsideDown
    dw InstList_Viola_UpsideUp


;;; $B66F: Initialisation AI - enemy $DABF (viola) ;;;
InitAI_Viola:
    LDX.W EnemyIndex
    LDA.W #$0006 : STA.W Enemy.init1,X
    LDA.W Enemy.properties,X : AND.W #$0003 : ASL : TAY
    LDA.W InitialInstListPointers_Viola,Y : STA.W Enemy.instList,X
    JMP InitAI_Crawlers_Common


;;; $B689: Viola spritemaps ;;;
Spritemap_Viola_Normal_0:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $100)

Spritemap_Viola_Normal_1:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $102)

Spritemap_Viola_Normal_2:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $104)

Spritemap_Viola_Normal_3:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $106)

Spritemap_Viola_Normal_4:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $108)

Spritemap_Viola_Normal_5:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $10A)

Spritemap_Viola_Normal_6:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $10C)

Spritemap_Viola_Normal_7:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $10E)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Viola_XFlipped_A3B6C1:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $100)

UNUSED_Spritemap_Viola_XFlipped_A3B6C8:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $102)

UNUSED_Spritemap_Viola_XFlipped_A3B6CF:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $104)

UNUSED_Spritemap_Viola_XFlipped_A3B6D6:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $106)

UNUSED_Spritemap_Viola_XFlipped_A3B6DD:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $108)

UNUSED_Spritemap_Viola_XFlipped_A3B6E4:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $10A)

UNUSED_Spritemap_Viola_XFlipped_A3B6EB:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $10C)

UNUSED_Spritemap_Viola_XFlipped_A3B6F2:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $10E)


;;; $B6F9: Unused. Crash if enemy initialisation parameter is non-zero ;;;
UNUSED_CrashIfEnemyInitParamIsNonZero_A3B6F9:
    LDX.W EnemyIndex
    LDA.W Enemy.instList,X

  .crash:
    BNE .crash
    RTL
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $B702: Palette - enemy $DB3F (bang) ;;;
Palette_Bang:
    dw $3800,$013F,$00D8,$0091,$002B,$7F12,$5B13,$2B15
    dw $0318,$6A03,$5DA2,$40E1,$2C60,$2020,$7FFF,$0842


;;; $B722: Instruction list pointers ;;;
InstListPointers_Bang:
; Core
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
; Electricity
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
; Shell
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


;;; $B75E: Instruction list - core - growth level 0 - idling ;;;
InstList_Bang_Core_Growth0_Idling:
    dw $0020,Spritemap_Bang_Growth0_Idling_0
    dw $000D,Spritemap_Bang_Growth0_Idling_2
    dw $0010,Spritemap_Bang_Growth0_Idling_4
    dw $000D,Spritemap_Bang_Growth0_Idling_2
    dw Instruction_Common_GotoY
    dw InstList_Bang_Core_Growth0_Idling


;;; $B772: Instruction list - core - growth level 0 - growing ;;;
InstList_Bang_Core_Growth0_Growing:
    dw Instruction_Bang_PlayAcquiredSuitSFX
    dw $0004,Spritemap_Bang_Growth0_Growing_0
    dw $0008,Spritemap_Bang_Growth0_Growing_1
    dw $0004,Spritemap_Bang_Growth0_Growing_0
    dw $0002,Spritemap_Bang_Growth0_Growing_2
    dw $0004,Spritemap_Bang_Growth0_Growing_4
    dw $0010,Spritemap_Bang_Growth0_Growing_6
    dw Instruction_Bang_SetFinishedGrowingFlagTo1
    dw Instruction_Common_Sleep


;;; $B790: Instruction list - core - growth level 1 - idling ;;;
InstList_Bang_Core_Growth1_Idling:
    dw $0010,Spritemap_Bang_Growth1_Idling_0
    dw $0008,Spritemap_Bang_Growth1_Idling_2
    dw $000D,Spritemap_Bang_Growth1_Idling_4
    dw $0008,Spritemap_Bang_Growth1_Idling_2
    dw Instruction_Common_GotoY
    dw InstList_Bang_Core_Growth1_Idling


;;; $B7A4: Instruction list - core - growth level 1 - growing ;;;
InstList_Bang_Core_Growth1_Growing:
    dw Instruction_Bang_PlayAcquiredSuitSFX
    dw $0004,Spritemap_Bang_Growth1_Growing_0
    dw $0008,Spritemap_Bang_Growth1_Growing_1
    dw $0004,Spritemap_Bang_Growth1_Growing_0
    dw $0002,Spritemap_Bang_Growth1_Growing_2
    dw $0004,Spritemap_Bang_Growth1_Growing_4
    dw $0010,Spritemap_Bang_Growth1_Growing_6
    dw Instruction_Bang_SetFinishedGrowingFlagTo1
    dw Instruction_Common_Sleep


;;; $B7C2: Instruction list - core - growth level 2 - idling ;;;
InstList_Bang_Core_Growth2_Idling:
    dw $000C,Spritemap_Bang_Growth2_Idling_0
    dw $0006,Spritemap_Bang_Growth2_Idling_2
    dw $0004,Spritemap_Bang_Growth2_Idling_4
    dw $0006,Spritemap_Bang_Growth2_Idling_2
    dw Instruction_Common_GotoY
    dw InstList_Bang_Core_Growth2_Idling


;;; $B7D6: Instruction list - core - growth level 2 - growing ;;;
InstList_Bang_Core_Growth2_Growing:
    dw Instruction_Bang_PlayAcquiredSuitSFX
    dw $0004,Spritemap_Bang_Growth2_Growing_0
    dw $0008,Spritemap_Bang_Growth2_Growing_2
    dw $0004,Spritemap_Bang_Growth2_Growing_0
    dw $0002,Spritemap_Bang_Growth2_Growing_4
    dw $0004,Spritemap_Bang_Growth2_Growing_6
    dw $0010,Spritemap_Bang_Growth2_Growing_8
    dw Instruction_Bang_SetFinishedGrowingFlagTo1
    dw Instruction_Common_Sleep


;;; $B7F4: Instruction list - core - growth level 3 - idling ;;;
InstList_Bang_Core_Growth3_Idling:
    dw $0008,Spritemap_Bang_Growth3_Idling_0
    dw $0003,Spritemap_Bang_Growth3_Idling_2
    dw $0002,Spritemap_Bang_Growth3_Idling_4
    dw $0003,Spritemap_Bang_Growth3_Idling_2
    dw $0008,Spritemap_Bang_Growth3_Idling_6
    dw $0003,Spritemap_Bang_Growth3_Idling_8
    dw $0002,Spritemap_Bang_Growth3_Idling_A
    dw $0003,Spritemap_Bang_Growth3_Idling_8
    dw $0008,Spritemap_Bang_Growth3_Idling_0
    dw $0003,Spritemap_Bang_Growth3_Idling_2
    dw $0002,Spritemap_Bang_Growth3_Idling_4
    dw $0003,Spritemap_Bang_Growth3_Idling_2
    dw $0008,Spritemap_Bang_Growth3_Idling_C
    dw $0003,Spritemap_Bang_Growth3_Idling_E
    dw $0002,Spritemap_Bang_Growth3_Idling_10
    dw $0003,Spritemap_Bang_Growth3_Idling_E
    dw Instruction_Common_GotoY
    dw InstList_Bang_Core_Growth3_Idling


;;; $B838: Instruction list - core - growth level 3 - growing ;;;
InstList_Bang_Core_Growth3_Growing:
    dw Instruction_Bang_PlayAcquiredSuitSFX
    dw $0004,Spritemap_Bang_Growth3_Growing_0
    dw $0008,Spritemap_Bang_Growth3_Growing_2
    dw $0004,Spritemap_Bang_Growth3_Growing_0
    dw $0002,Spritemap_Bang_Growth3_Growing_4
    dw $0004,Spritemap_Bang_Growth3_Growing_6
    dw $0004,Spritemap_Bang_Growth3_Growing_8
    dw $0010,Spritemap_Bang_Growth3_Growing_A
    dw Instruction_Bang_SetFinishedGrowingFlagTo1
    dw Instruction_Common_Sleep


;;; $B85A: Instruction list - core - growth level 4 - idling ;;;
InstList_Bang_Core_Growth4_Idling:
    dw $0006,Spritemap_Bang_Growth4_Idling_0
    dw $0002,Spritemap_Bang_Growth4_Idling_2
    dw $0001,Spritemap_Bang_Growth4_Idling_4
    dw $0002,Spritemap_Bang_Growth4_Idling_2
    dw $0006,Spritemap_Bang_Growth4_Idling_6
    dw $0001,Spritemap_Bang_Growth4_Idling_4
    dw $0002,Spritemap_Bang_Growth4_Idling_2
    dw $0006,Spritemap_Bang_Growth4_Idling_8
    dw $0002,Spritemap_Bang_Growth4_Idling_A
    dw $0001,Spritemap_Bang_Growth4_Idling_C
    dw $0002,Spritemap_Bang_Growth4_Idling_A
    dw Instruction_Common_GotoY
    dw InstList_Bang_Core_Growth4_Idling


;;; $B88A: Instruction list - core - growth level 4 - growing ;;;
InstList_Bang_Core_Growth4_Growing:
    dw Instruction_Bang_PlayAcquiredSuitSFX
    dw $0004,Spritemap_Bang_Growth4_Growing_0
    dw $0008,Spritemap_Bang_Growth4_Growing_2
    dw $0004,Spritemap_Bang_Growth4_Growing_0
    dw $0002,Spritemap_Bang_Growth4_Growing_4
    dw $0004,Spritemap_Bang_Growth4_Growing_6
    dw $0004,Spritemap_Bang_Growth4_Growing_8
    dw $0010,Spritemap_Bang_Growth4_Growing_A
    dw Instruction_Bang_SetFinishedGrowingFlagTo1
    dw Instruction_Common_Sleep


;;; $B8AC: Instruction list - shell - growth level 0 - idling ;;;
InstList_Bang_Shell_Growth0_Idling:
    dw $0020,Spritemap_Bang_Growth0_Idling_1
    dw $000D,Spritemap_Bang_Growth0_Idling_3
    dw $0010,Spritemap_Bang_Growth0_Idling_5
    dw $000D,Spritemap_Bang_Growth0_Idling_3
    dw Instruction_Common_GotoY
    dw InstList_Bang_Shell_Growth0_Idling


;;; $B8C0: Instruction list - shell - growth level 0 - growing ;;;
InstList_Bang_Shell_Growth0_Growing:
    dw Instruction_Bang_PlayAcquiredSuitSFX
    dw $0004,Spritemap_Common_Nothing
    dw $0008,Spritemap_Common_Nothing
    dw $0004,Spritemap_Common_Nothing
    dw $0002,Spritemap_Bang_Growth0_Growing_3
    dw $0004,Spritemap_Bang_Growth0_Growing_5
    dw $0010,Spritemap_Bang_Growth0_Growing_7
    dw Instruction_Bang_SetFinishedGrowingFlagTo1
    dw Instruction_Common_Sleep


;;; $B8DE: Instruction list - shell - growth level 1 - idling ;;;
InstList_Bang_Shell_Growth1_Idling:
    dw $0010,Spritemap_Bang_Growth1_Idling_1
    dw $0008,Spritemap_Bang_Growth1_Idling_3
    dw $000D,Spritemap_Bang_Growth1_Idling_5
    dw $0008,Spritemap_Bang_Growth1_Idling_3
    dw Instruction_Common_GotoY
    dw InstList_Bang_Shell_Growth1_Idling


;;; $B8F2: Instruction list - shell - growth level 1 - growing ;;;
InstList_Bang_Shell_Growth1_Growing:
    dw Instruction_Bang_PlayAcquiredSuitSFX
    dw $0004,Spritemap_Common_Nothing
    dw $0008,Spritemap_Common_Nothing
    dw $0004,Spritemap_Common_Nothing
    dw $0002,Spritemap_Bang_Growth1_Growing_3
    dw $0004,Spritemap_Bang_Growth1_Growing_5
    dw $0010,Spritemap_Bang_Growth1_Growing_7
    dw Instruction_Bang_SetFinishedGrowingFlagTo1
    dw Instruction_Common_Sleep


;;; $B910: Instruction list - shell - growth level 2 - idling ;;;
InstList_Bang_Shell_Growth2_Idling:
    dw $000C,Spritemap_Bang_Growth2_Idling_1
    dw $0006,Spritemap_Bang_Growth2_Idling_3
    dw $0004,Spritemap_Bang_Growth2_Idling_5
    dw $0006,Spritemap_Bang_Growth2_Idling_3
    dw Instruction_Common_GotoY
    dw InstList_Bang_Shell_Growth2_Idling


;;; $B924: Instruction list - shell - growth level 2 - growing ;;;
InstList_Bang_Shell_Growth2_Growing:
    dw Instruction_Bang_PlayAcquiredSuitSFX
    dw $0004,Spritemap_Bang_Growth2_Growing_1
    dw $0008,Spritemap_Bang_Growth2_Growing_3
    dw $0004,Spritemap_Bang_Growth2_Growing_1
    dw $0002,Spritemap_Bang_Growth2_Growing_5
    dw $0004,Spritemap_Bang_Growth2_Growing_7
    dw $0010,Spritemap_Bang_Growth2_Growing_9
    dw Instruction_Bang_SetFinishedGrowingFlagTo1
    dw Instruction_Common_Sleep


;;; $B942: Instruction list - shell - growth level 3 - idling ;;;
InstList_Bang_Shell_Growth3_Idling:
    dw $0008,Spritemap_Bang_Growth3_Idling_1
    dw $0003,Spritemap_Bang_Growth3_Idling_3
    dw $0002,Spritemap_Bang_Growth3_Idling_5
    dw $0003,Spritemap_Bang_Growth3_Idling_3
    dw $0008,Spritemap_Bang_Growth3_Idling_7
    dw $0003,Spritemap_Bang_Growth3_Idling_9
    dw $0002,Spritemap_Bang_Growth3_Idling_B
    dw $0003,Spritemap_Bang_Growth3_Idling_9
    dw $0008,Spritemap_Bang_Growth3_Idling_1
    dw $0003,Spritemap_Bang_Growth3_Idling_3
    dw $0002,Spritemap_Bang_Growth3_Idling_5
    dw $0003,Spritemap_Bang_Growth3_Idling_3
    dw $0008,Spritemap_Bang_Growth3_Idling_D
    dw $0003,Spritemap_Bang_Growth3_Idling_F
    dw $0002,Spritemap_Bang_Growth3_Idling_11
    dw $0003,Spritemap_Bang_Growth3_Idling_F
    dw Instruction_Common_GotoY
    dw InstList_Bang_Shell_Growth3_Idling


;;; $B986: Instruction list - shell - growth level 3 - growing ;;;
InstList_Bang_Shell_Growth3_Growing:
    dw Instruction_Bang_PlayAcquiredSuitSFX
    dw $0004,Spritemap_Bang_Growth3_Growing_1
    dw $0008,Spritemap_Bang_Growth3_Growing_3
    dw $0004,Spritemap_Bang_Growth3_Growing_1
    dw $0002,Spritemap_Bang_Growth3_Growing_5
    dw $0004,Spritemap_Bang_Growth3_Growing_7
    dw $0004,Spritemap_Bang_Growth3_Growing_9
    dw $0010,Spritemap_Bang_Growth3_Growing_B
    dw Instruction_Bang_SetFinishedGrowingFlagTo1
    dw Instruction_Common_Sleep


;;; $B9A8: Instruction list - shell - growth level 4 - idling ;;;
InstList_Bang_Shell_Growth4_Idling:
    dw $0006,Spritemap_Bang_Growth4_Idling_1
    dw $0002,Spritemap_Bang_Growth4_Idling_3
    dw $0001,Spritemap_Bang_Growth4_Idling_5
    dw $0002,Spritemap_Bang_Growth4_Idling_3
    dw $0006,Spritemap_Bang_Growth4_Idling_7
    dw $0001,Spritemap_Bang_Growth4_Idling_5
    dw $0002,Spritemap_Bang_Growth4_Idling_3
    dw $0006,Spritemap_Bang_Growth4_Idling_9
    dw $0002,Spritemap_Bang_Growth4_Idling_B
    dw $0001,Spritemap_Bang_Growth4_Idling_D
    dw $0002,Spritemap_Bang_Growth4_Idling_B
    dw Instruction_Common_GotoY
    dw InstList_Bang_Shell_Growth4_Idling


;;; $B9D8: Instruction list - shell - growth level 4 - growing ;;;
InstList_Bang_Shell_Growth4_Growing:
    dw Instruction_Bang_PlayAcquiredSuitSFX
    dw $0004,Spritemap_Bang_Growth4_Growing_1
    dw $0008,Spritemap_Bang_Growth4_Growing_3
    dw $0004,Spritemap_Bang_Growth4_Growing_1
    dw $0002,Spritemap_Bang_Growth4_Growing_5
    dw $0004,Spritemap_Bang_Growth4_Growing_7
    dw $0004,Spritemap_Bang_Growth4_Growing_9
    dw $0010,Spritemap_Common_Nothing
    dw Instruction_Bang_SetFinishedGrowingFlagTo1
    dw Instruction_Common_Sleep


;;; $B9FA: Instruction list - electricity - none ;;;
InstList_Bang_Electricity_None:
    dw $0001,Spritemap_Common_Nothing
    dw Instruction_Common_Sleep


;;; $BA00: Instruction list - electricity - growth level 3/4 - growing ;;;
InstList_Bang_Electricity_Growth3_4_Growing:
    dw $0002,Spritemap_Bang_Electricity_Growth3_4_Growing_0
    dw $0003,Spritemap_Bang_Electricity_Growth3_4_Growing_1
    dw $0004,Spritemap_Bang_Electricity_Growth3_4_Growing_2
    dw $0002,Spritemap_Common_Nothing
    dw $0004,Spritemap_Bang_Electricity_Growth3_4_Growing_3
    dw $0002,Spritemap_Bang_Electricity_Growth3_4_Growing_4
    dw $0003,Spritemap_Bang_Electricity_Growth3_4_Growing_5
    dw $0002,Spritemap_Bang_Electricity_Growth3_4_Growing_6
    dw $0004,Spritemap_Bang_Electricity_Growth3_4_Growing_7
    dw $0003,Spritemap_Bang_Electricity_Growth3_4_Growing_8
    dw $000A,Spritemap_Common_Nothing
    dw $0003,Spritemap_Bang_Electricity_Growth3_4_Growing_9
    dw $0002,Spritemap_Bang_Electricity_Growth3_4_Growing_A
    dw $0004,Spritemap_Bang_Electricity_Growth3_4_Growing_B
    dw Instruction_Common_GotoY
    dw InstList_Bang_Electricity_Growth3_4_Growing


if !FEATURE_KEEP_UNREFERENCED
;;; $BA3C: Unused. Instruction list - electricity - growing ;;;
UNSUED_InstList_Bang_Electricity_Growing_A3BA3C:
; Probably intended to be growth level 4 - growing
    dw $0002,UNUSED_Spritemap_Bang_Electricity_A3C5AE
    dw $0003,UNUSED_Spritemap_Bang_Electricity_A3C5BA
    dw $0004,UNUSED_Spritemap_Bang_Electricity_A3C5C6
    dw $0002,Spritemap_Common_Nothing
    dw $0004,UNUSED_Spritemap_Bang_Electricity_A3C5D2
    dw $0002,UNUSED_Spritemap_Bang_Electricity_A3C5DE
    dw $0003,UNUSED_Spritemap_Bang_Electricity_A3C5EA
    dw $0002,UNUSED_Spritemap_Bang_Electricity_A3C5F6
    dw $0004,UNUSED_Spritemap_Bang_Electricity_A3C602
    dw $0003,UNUSED_Spritemap_Bang_Electricity_A3C60E
    dw $000A,Spritemap_Common_Nothing
    dw $0003,UNUSED_Spritemap_Bang_Electricity_A3C61A
    dw $0002,UNUSED_Spritemap_Bang_Electricity_A3C626
    dw $0004,UNUSED_Spritemap_Bang_Electricity_A3C632
    dw Instruction_Common_GotoY
    dw UNSUED_InstList_Bang_Electricity_Growing_A3BA3C
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $BA78: Instruction - queue acquired suit sound effect ;;;
Instruction_Bang_PlayAcquiredSuitSFX:
    PHY : PHX
    LDA.W #$0056
    JSL QueueSound_Lib2_Max6
    PLX : PLY
    RTL


;;; $BA84: Bang max speeds ;;;
BangMaxSpeeds:
    dw $02FF,$03FF,$04FF,$05FF,$06FF,$07FF,$08FF,$09FF


;;; $BA94: Bang angles ;;;
BangAngles:
    dw $00C0 ; 0: Up, facing right
    dw $00E0 ; 1: Up-right
    dw $0000 ; 2: Right
    dw $0020 ; 3: Down-right
    dw $0040 ; 4: Down, facing right
    dw $0040 ; 5: Down, facing left
    dw $0060 ; 6: Down-left
    dw $0080 ; 7: Left
    dw $00A0 ; 8: Up-left
    dw $00C0 ; 9: Up, facing left


;;; $BAA8: Instruction - enemy finished growing flag = 1 ;;;
Instruction_Bang_SetFinishedGrowingFlagTo1:
    LDX.W EnemyIndex
    LDA.W #$0001 : STA.L Bang.finishedGrowingFlag,X
    RTL


;;; $BAB3: Initialisation AI - enemy $DB3F (bang) ;;;
InitAI_Bang:
    LDX.W EnemyIndex
    LDA.W Enemy.palette,X : STA.W Bang.idlePaletteIndex,X
    LDA.W Enemy.properties,X : ORA.W #$1000 : STA.W Enemy.properties,X
    LDA.W #Function_Bang_Movement_MovementDelay : STA.W Bang.movementFunction,X
    LDA.W #$0010 : STA.L Bang.movementDelayTimer,X
    LDA.W #$0000 : STA.L Bang.angle,X
    STA.L Bang.angleToSamus,X : STA.L Bang.newInstListIndex,X
    STA.L Bang.instListIndex,X : STA.L Bang.finishedGrowingFlag,X
    LDA.W Enemy.init1,X : AND.W #$00FF : ASL : TAY
    LDA.W BangMaxSpeeds,Y : STA.L Bang.maxSpeed,X
    LDA.W Enemy.init1+1,X : AND.W #$00FF : ASL #2 : TAY
    LDA.W BangAccelerationIntervalTimeResetValues_accel,Y : STA.L Bang.accelerationIntervalTimer,X : STA.L Bang.accelerationIntervalTimerResetValue,X
    LDA.W BangAccelerationIntervalTimeResetValues_decel,Y : STA.L Bang.decelerationIntervalTimerResetValue,X
    LDA.W Enemy.instList,X : BNE .idling
    LDA.W #Function_Bang_Movement_GetEnemyIndex : STA.W Bang.movementFunction,X

  .idling:
    LDA.W #InstList_Bang_Core_Growth0_Idling : STA.W Enemy.instList,X
    RTL


;;; $BB25: Main AI - enemy $DB3F (bang) ;;;
MainAI_Bang:
    LDX.W EnemyIndex
    JMP.W (Enemy.init0,X)


;;; $BB2B: Bang AI - electricity ;;;
BangAI_Electricity:
; Pointed to by parameter 1 of debug enemy population data $B4:E309
    LDX.W EnemyIndex
    LDA.L ExtraEnemy8000+$40,X : CLC : ADC.W #$000A : STA.L Bang.newInstListIndex,X
    JSR SetBangInstList
    LDX.W EnemyIndex ; >.<
    LDA.W Enemy.properties,X : ORA.W #$0400 : STA.W Enemy.properties,X
    RTL


;;; $BB4A: Bang AI - shell ;;;
BangAI_Shell:
; Pointed to by parameter 1 of debug enemy population data $B4:E309
    LDX.W EnemyIndex
    LDA.L ExtraEnemy8000-$40,X : CLC : ADC.W #$0014 : STA.L Bang.newInstListIndex,X
    JSR SetBangInstList
    LDA.W Enemy.properties,X : ORA.W #$0400 : STA.W Enemy.properties,X
    RTL


;;; $BB66: Bang AI - core ;;;
BangAI_Core:
; Pointed to by parameter 1 of debug enemy population data $B4:E309
    LDX.W EnemyIndex
    JSR ExecuteBangeMovementFunction
    LDA.W Enemy.XPosition,X : STA.W Enemy[-1].XPosition,X : STA.W Enemy[1].XPosition,X
    LDA.W Enemy.YPosition,X : STA.W Enemy[-1].YPosition,X : STA.W Enemy[1].YPosition,X
    LDY.W Bang.idlePaletteIndex,X
    LDA.L Bang.newInstListIndex,X : AND.W #$0001 : BEQ +
    LDY.W #$0C00

+   TYA : STA.W Enemy.palette,X
    JSR SetBangInstList
    LDA.L Bang.finishedGrowingFlag,X : BNE +
    RTL

+   LDA.W #$0000 : STA.L Bang.finishedGrowingFlag,X
    LDA.L Bang.newInstListIndex,X : CMP.W #$0009 : BNE +
    LDA.W #$0010 : STA.W Enemy.invincibilityTimer,X
    LDA.W Enemy.properties,X : ORA.W #$0400 : STA.W Enemy.properties,X
    JSL DetermineDirectionOfSamusFromEnemy
    JSR FireChargedBeamAtSamus
    JSL EnemyDeath
    LDX.W EnemyIndex
    LDA.W Enemy[1].properties,X : ORA.W #$0200 : STA.W Enemy[1].properties,X
    LDA.W Enemy[-1].properties,X : ORA.W #$0200 : STA.W Enemy[-1].properties,X
    RTL

+   LDX.W EnemyIndex ; >.<
    LDA.L Bang.newInstListIndex,X : INC : STA.L Bang.newInstListIndex,X
    JSR SetBangInstList
    RTL


;;; $BBEB: Fire charged beam at Samus ;;;
FireChargedBeamAtSamus:
;; Parameters:
;;     A: Direction of Samus from enemy
;; Returns:
;;     A: Death animation
    STA.W EnemyBottomBoundaryForEnemyVsProjectileCollisions
    LDX.W EnemyIndex
    LDA.W SamusProjectile_ProjectileCounter : CMP.W #$0005 : BPL .fail
    LDA.W #$0000 : TAY

  .loop:
    LDA.W SamusProjectile_Damages,Y : BEQ .zeroDamage
    INY #2
    BRA .loop

  .zeroDamage:
    LDA.W Enemy.XPosition,X : STA.W SamusProjectile_XPositions,Y
    LDA.W Enemy.YPosition,X : STA.W SamusProjectile_YPositions,Y
    LDA.W EnemyBottomBoundaryForEnemyVsProjectileCollisions : STA.W SamusProjectile_Directions,Y
    LDA.W EquippedBeams : AND.W #$000F : ORA.W #$0010 : STA.W SamusProjectile_Types,Y
    INC.W SamusProjectile_ProjectileCounter
    STY.B DP_Temp14
    JSL ProjectileReflection
    LDA.W Bang.damage,X : STA.W SamusProjectile_Damages,Y
    LDA.W SamusProjectile_Types,Y : AND.W #$000F : ASL : TAX
    LDA.W .beamTypes,X
    JSL QueueSound_Lib1_Max6
    LDA.W #$0000
    RTS

  .fail:
    LDA.W #$0001
    RTS

  .beamTypes:
    dw $0017  ; Charged power beam
    dw $0019  ; Charged wave beam
    dw $0018  ; Charged ice beam
    dw $001A  ; Charged ice + wave beam
              ; <-- Missing charged spazer beam
    dw $001E  ; Charged spazer + wave beam
    dw $001C  ; Charged spazer + ice beam
    dw $001D  ; Charged spazer + ice + wave beam
    dw $001F  ; Charged plasma beam
    dw $0022  ; Charged plasma + wave beam
    dw $0020  ; Charged plasma + ice beam
    dw $0021  ; Charged plasma + ice + wave beam
    dw $0000,$0000,$0000,$0000,$0000


;;; $BC6A: Bang acceleration interval time reset values ;;;
BangAccelerationIntervalTimeResetValues:
;        _________ Acceleration interval timer
;       |      ___ Deceleration interval timer
;       |     |
  .accel:
    dw $0003
  .decel:
    dw       $0001
    dw $0004,$0001
    dw $0005,$0002
    dw $0006,$0002
    dw $0007,$0002
    dw $0008,$0003
    dw $0009,$0003
    dw $000A,$0004
    dw $000B,$0004
    dw $000C,$0005
    dw $000D,$0005
    dw $000E,$0006
    dw $000F,$0006


;;; $BC9E: Execute bang movement function ;;;
ExecuteBangeMovementFunction:
    LDX.W EnemyIndex
    JSR.W (Bang.movementFunction,X)
    RTS


;;; $BCA5: Bang movement function - movement delay ;;;
Function_Bang_Movement_MovementDelay:
    LDX.W EnemyIndex ; >.<
    LDA.L Bang.movementDelayTimer,X : DEC : STA.L Bang.movementDelayTimer,X : BNE .return
    LDA.W #$0010 : STA.L Bang.movementDelayTimer,X
    LDA.W #Function_Bang_Movement_TargetSamus : STA.W Bang.movementFunction,X

  .return:
    RTS


;;; $BCC1: RTS. Bang movement function - no movement ;;;
Function_Bang_Movement_GetEnemyIndex:
    LDX.W EnemyIndex ; >.<
    RTS


;;; $BCC5: Bang movement function - target Samus ;;;
Function_Bang_Movement_TargetSamus:
    LDX.W EnemyIndex ; >.<
    JSL CalculateAngleOfSamusFromEnemy
    SEC : SBC.W #$0040 : AND.W #$00FF : STA.L Bang.angle,X
    LDA.W #Function_Bang_Movement_Accelerating : STA.W Bang.movementFunction,X
    LDA.W #$0000 : STA.L Bang.movingLeftFlag,X : STA.L Bang.movingUpFlag,X
    STA.L Bang.acceleration,X : STA.L Bang.speed,X
    RTS


;;; $BCF1: Trigger bang deceleration if too far off target ;;;
TriggerBangDecelerationIfTooFarOffTarget:
    LDX.W EnemyIndex
    JSL CalculateAngleOfSamusFromEnemy
    SEC : SBC.W #$0040 : AND.W #$00FF : STA.L Bang.angleToSamus,X
    SEC : SBC.L Bang.angle,X
    JSL Sign_Extend_A
    JSL NegateA_A0B067
    CMP.W #$0030 : BMI .return
    LDA.W #Function_Bang_Movement_Decelerating : STA.W Bang.movementFunction,X

  .return:
    RTS


;;; $BD1C: Bang movement function - accelerating ;;;
Function_Bang_Movement_Accelerating:
    LDX.W EnemyIndex ; >.<
    JSR BangXMovement
    JSR BangYMovement
    JSR AccelerateBang
    JSR TriggerBangDecelerationIfTooFarOffTarget
    RTS


;;; $BD2C: Bang movement function - decelerating ;;;
Function_Bang_Movement_Decelerating:
    LDX.W EnemyIndex ; >.<
    JSR BangXMovement
    JSR BangYMovement
    JSR DecelerateBang
    LDA.L Bang.speed,X : BNE .delay
    BMI .delay
    LDA.L Bang.acceleration,X : BEQ .delay
    BPL .return

  .delay:
    LDA.W #Function_Bang_Movement_MovementDelay : STA.W Bang.movementFunction,X

  .return:
    RTS


;;; $BD4F: Accelerate bang ;;;
AccelerateBang:
    LDX.W EnemyIndex
    LDA.L Bang.accelerationIntervalTimer,X : DEC : STA.L Bang.accelerationIntervalTimer,X : BPL .return
    LDA.L Bang.accelerationIntervalTimerResetValue,X : STA.L Bang.accelerationIntervalTimer,X
    LDA.L Bang.speed,X : CMP.L Bang.maxSpeed,X : BPL .return
    LDA.L Bang.acceleration,X : CLC : ADC.W #$0016 : STA.L Bang.acceleration,X
    LDA.L Bang.speed,X : CLC : ADC.L Bang.acceleration,X : STA.L Bang.speed,X

  .return:
    RTS


;;; $BD89: Decelerate bang ;;;
DecelerateBang:
    LDX.W EnemyIndex
    LDA.L Bang.accelerationIntervalTimer,X : DEC : STA.L Bang.accelerationIntervalTimer,X : BPL .return
    LDA.L Bang.decelerationIntervalTimerResetValue,X : STA.L Bang.accelerationIntervalTimer,X
    LDA.L Bang.acceleration,X : SEC : SBC.W #$0016 : STA.L Bang.acceleration,X
    LDA.L Bang.speed,X : SEC : SBC.L Bang.acceleration,X : STA.L Bang.speed,X

  .return:
    RTS


;;; $BDB9: Bang X movement ;;;
BangXMovement:
; Looks like enemy moving left flag was supposed to be cleared before the branch at $BDD3 >_<;
    LDX.W EnemyIndex
    LDA.L Bang.angle,X
    PHX
    CLC : ADC.W #$0040 : AND.W #$00FF : ASL : TAX
    LDA.L SineCosineTables_16bitSine,X : STA.B DP_Temp12
    PLX
    LDA.B DP_Temp12 : BPL +
    LDA.W #$0001 : STA.L Bang.movingLeftFlag,X

+   LDA.B DP_Temp12
    JSL NegateA_A0B067
    AND.W #$FF00 : XBA : STA.B DP_Temp16
    LDA.L Bang.speed,X : STA.B DP_Temp18
    JSR UnsignedMultiplication_24bit_A3BE7B
    LDA.B DP_Temp1C : STA.B DP_Temp16
    LDA.B DP_Temp1E : STA.B DP_Temp18
    LDA.L Bang.movingLeftFlag,X : BEQ +
    JSR StrugglingWithMultiWordNegation
    LDA.B DP_Temp1C : STA.B DP_Temp16
    LDA.B DP_Temp1E : STA.B DP_Temp18

+   CLC
    LDA.W Enemy.XSubPosition,X : ADC.B DP_Temp16 : STA.W Enemy.XSubPosition,X
    LDA.W Enemy.XPosition,X : ADC.B DP_Temp18 : STA.W Enemy.XPosition,X
    RTS


;;; $BE1C: Bang Y movement ;;;
BangYMovement:
; Looks like enemy moving up flag was supposed to be cleared before the branch at $BE32 >_<;
    LDX.W EnemyIndex
    LDA.L Bang.angle,X
    PHX
    AND.W #$00FF : ASL : TAX
    LDA.L SineCosineTables_16bitSine,X : STA.B DP_Temp12
    PLX
    LDA.B DP_Temp12 : BPL +
    LDA.W #$0001 : STA.L Bang.movingUpFlag,X

+   LDA.B DP_Temp12
    JSL NegateA_A0B067
    AND.W #$FF00 : XBA : STA.B DP_Temp16
    LDA.L Bang.speed,X : STA.B DP_Temp18
    JSR UnsignedMultiplication_24bit_A3BE7B
    LDA.B DP_Temp1C : STA.B DP_Temp16
    LDA.B DP_Temp1E : STA.B DP_Temp18
    LDA.L Bang.movingUpFlag,X : BEQ +
    JSR StrugglingWithMultiWordNegation
    LDA.B DP_Temp1C : STA.B DP_Temp16
    LDA.B DP_Temp1E : STA.B DP_Temp18

+   CLC
    LDA.W Enemy.YSubPosition,X : ADC.B DP_Temp16 : STA.W Enemy.YSubPosition,X
    LDA.W Enemy.YPosition,X : ADC.B DP_Temp18 : STA.W Enemy.YPosition,X
    RTS


;;; $BE7B: $1E.$1C = [$16] * [$18] / 10000h (24-bit unsigned multiplication) ;;;
UnsignedMultiplication_24bit_A3BE7B:
    PHP
    SEP #$20
    LDA.B DP_Temp16 : STA.W $4202
    LDA.B DP_Temp18 : STA.W $4203
    NOP #3
    REP #$20
    LDA.W $4216 : STA.B DP_Temp1C
    SEP #$20
    LDA.B DP_Temp16 : STA.W $4202
    LDA.B DP_Temp19 : STA.W $4203
    NOP #3
    REP #$20
    LDA.W $4216 : AND.W #$FF00 : XBA : STA.B DP_Temp1E
    LDA.W $4216 : AND.W #$00FF : XBA
    CLC : ADC.B DP_Temp1C : STA.B DP_Temp1C : BCC .return
    INC.B DP_Temp1E

  .return:
    PLP
    RTS


;;; $BEBE: $1E.$1C = -[$18].[$16] ;;;
StrugglingWithMultiWordNegation:
; The devs *really* struggled with multi-word negation >_<;

; Actual result is as follows:
;     If [$18].[$16] = 0.0:
;        Return
;
;     If [$16] != 0:
;         $1E.$1C = -[$18].[$16]
;     Else ([$16] = 0):
;         $1E.$1C = -1 - [$18].[$16]
    LDA.B DP_Temp16 : BNE +
    LDA.B DP_Temp18 : BNE +
    BRA .return

+   LDA.B DP_Temp16 ; >.<
    LDA.W #$0000 : SEC : SBC.B DP_Temp16 : STA.B DP_Temp1C
    LDA.B DP_Temp18 : EOR.W #$FFFF : STA.B DP_Temp1E

  .return:
    RTS


;;; $BEDA: Set bang instruction list ;;;
SetBangInstList:
    LDX.W EnemyIndex
    LDA.L Bang.newInstListIndex,X : CMP.L Bang.instListIndex,X : BEQ .return
    STA.L Bang.instListIndex,X
    ASL : TAY
    LDA.W InstListPointers_Bang,Y : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X

  .return:
    RTS


;;; $BEFD: Enemy shot - enemy $DB3F (bang) ;;;
EnemyShot_Bang:
    LDX.W EnemyIndex
    LDA.W Bang.movementFunction,X : CMP.W #Function_Bang_Movement_GetEnemyIndex : BEQ .RTSFunction
    LDA.W CollisionIndex : ASL : TAY
    LDA.W SamusProjectile_Directions,Y : AND.W #$000F : ASL : TAY
    LDA.W BangAngles,Y : STA.L Bang.angle,X
    LDA.W #Function_Bang_Movement_Decelerating : STA.W Bang.movementFunction,X
    LDA.W #$0000 : STA.L Bang.movingLeftFlag,X : STA.L Bang.movingUpFlag,X
    LDA.W #$0100 : STA.L Bang.acceleration,X
    LDA.W #$0600 : STA.L Bang.speed,X

  .RTSFunction:
    LDA.L Bang.newInstListIndex,X : CMP.W #$0009 : BNE .notIndex9
    RTL

  .notIndex9:
    LDA.L Bang.newInstListIndex,X : INC : STA.L Bang.newInstListIndex,X
    JSR SetBangInstList
    LDA.W CollisionIndex : ASL : TAY
    LDA.W SamusProjectile_Damages,Y : CLC : ADC.W Bang.damage,X : STA.W Bang.damage,X
    LDA.W SamusProjectile_Directions,Y : ORA.W #$0010 : STA.W SamusProjectile_Directions,Y
    LDX.W EnemyIndex ; >.<
    LDA.L Bang.newInstListIndex,X : CMP.W #$0009 : BEQ +
    RTL

+   LDA.W #$0001 : STA.W Enemy.var3,X
    RTL


;;; $BF7D: Bang spritemaps ;;;
Spritemap_Bang_Growth0_Idling_0:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $113)

Spritemap_Bang_Growth0_Idling_1:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $110)

Spritemap_Bang_Growth0_Idling_2:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $114)

Spritemap_Bang_Growth0_Idling_3:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $111)

Spritemap_Bang_Growth0_Idling_4:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $115)

Spritemap_Bang_Growth0_Idling_5:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $112)

Spritemap_Bang_Growth0_Growing_0:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $170)

Spritemap_Bang_Growth0_Growing_1:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $160)

Spritemap_Bang_Growth0_Growing_2:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $116)

Spritemap_Bang_Growth0_Growing_3:
    dw $0004
    %spritemapEntry(0, $1F9, $FF, 1, 1, 3, 0, $101)
    %spritemapEntry(0, $1FF, $FF, 1, 0, 3, 0, $101)
    %spritemapEntry(0, $1FF, $F9, 0, 0, 3, 0, $101)
    %spritemapEntry(0, $1F9, $F9, 0, 0, 3, 0, $100)

Spritemap_Bang_Growth0_Growing_4:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $116)

Spritemap_Bang_Growth0_Growing_5:
    dw $0004
    %spritemapEntry(0, $1F8, $FF, 1, 1, 3, 0, $101)
    %spritemapEntry(0, $00, $FF, 1, 0, 3, 0, $101)
    %spritemapEntry(0, $00, $F9, 0, 0, 3, 0, $101)
    %spritemapEntry(0, $1F8, $F9, 0, 0, 3, 0, $100)

Spritemap_Bang_Growth0_Growing_6:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $116)

Spritemap_Bang_Growth0_Growing_7:
    dw $0004
    %spritemapEntry(0, $1F8, $00, 1, 1, 3, 0, $101)
    %spritemapEntry(0, $00, $00, 1, 0, 3, 0, $101)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 0, $101)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $100)

Spritemap_Bang_Growth1_Idling_0:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $116)

Spritemap_Bang_Growth1_Idling_1:
    dw $0004
    %spritemapEntry(0, $1F8, $00, 1, 1, 3, 0, $101)
    %spritemapEntry(0, $00, $00, 1, 0, 3, 0, $101)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 0, $101)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $100)

Spritemap_Bang_Growth1_Idling_2:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $117)

Spritemap_Bang_Growth1_Idling_3:
    dw $0004
    %spritemapEntry(0, $1F8, $00, 1, 1, 3, 0, $103)
    %spritemapEntry(0, $00, $00, 1, 0, 3, 0, $103)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 0, $103)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $102)

Spritemap_Bang_Growth1_Idling_4:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $118)

Spritemap_Bang_Growth1_Idling_5:
    dw $0004
    %spritemapEntry(0, $1F8, $00, 1, 1, 3, 0, $105)
    %spritemapEntry(0, $00, $00, 1, 0, 3, 0, $105)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 0, $105)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $104)

Spritemap_Bang_Growth1_Growing_0:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 3, 0, $172)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 0, $172)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 0, $172)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $172)

Spritemap_Bang_Growth1_Growing_1:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 3, 0, $171)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 0, $171)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 0, $171)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $171)

Spritemap_Bang_Growth1_Growing_2:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $119)

Spritemap_Bang_Growth1_Growing_3:
    dw $0004
    %spritemapEntry(0, $1F9, $FF, 1, 1, 3, 0, $107)
    %spritemapEntry(0, $1FF, $FF, 1, 0, 3, 0, $107)
    %spritemapEntry(0, $1FF, $F9, 0, 0, 3, 0, $107)
    %spritemapEntry(0, $1F9, $F9, 0, 0, 3, 0, $106)

Spritemap_Bang_Growth1_Growing_4:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $119)

Spritemap_Bang_Growth1_Growing_5:
    dw $0004
    %spritemapEntry(0, $1F9, $00, 1, 1, 3, 0, $107)
    %spritemapEntry(0, $1FF, $00, 1, 0, 3, 0, $107)
    %spritemapEntry(0, $1FF, $F8, 0, 0, 3, 0, $107)
    %spritemapEntry(0, $1F9, $F8, 0, 0, 3, 0, $106)

Spritemap_Bang_Growth1_Growing_6:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $119)

Spritemap_Bang_Growth1_Growing_7:
    dw $0004
    %spritemapEntry(0, $1F8, $00, 1, 1, 3, 0, $107)
    %spritemapEntry(0, $00, $00, 1, 0, 3, 0, $107)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 0, $107)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $106)

Spritemap_Bang_Growth2_Idling_0:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $119)

Spritemap_Bang_Growth2_Idling_1:
    dw $0004
    %spritemapEntry(0, $1F8, $00, 1, 1, 3, 0, $107)
    %spritemapEntry(0, $00, $00, 1, 0, 3, 0, $107)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 0, $107)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $106)

Spritemap_Bang_Growth2_Idling_2:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $11A)

Spritemap_Bang_Growth2_Idling_3:
    dw $0004
    %spritemapEntry(0, $1F8, $00, 1, 1, 3, 0, $109)
    %spritemapEntry(0, $00, $00, 1, 0, 3, 0, $109)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 0, $109)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $108)

Spritemap_Bang_Growth2_Idling_4:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $11B)

Spritemap_Bang_Growth2_Idling_5:
    dw $0004
    %spritemapEntry(0, $1F8, $00, 1, 1, 3, 0, $10B)
    %spritemapEntry(0, $00, $00, 1, 0, 3, 0, $10B)
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 0, $10B)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $10A)

Spritemap_Bang_Growth2_Growing_0:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $119)

Spritemap_Bang_Growth2_Growing_1:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 3, 0, $177)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 0, $177)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 0, $177)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $177)

Spritemap_Bang_Growth2_Growing_2:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 0, $119)

Spritemap_Bang_Growth2_Growing_3:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 3, 0, $167)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 0, $167)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 0, $167)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $167)

Spritemap_Bang_Growth2_Growing_4:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $10C)

Spritemap_Bang_Growth2_Growing_5:
    dw $0004
    %spritemapEntry(1, $43F2, $FE, 1, 1, 3, 0, $122)
    %spritemapEntry(1, $43FE, $FE, 1, 0, 3, 0, $122)
    %spritemapEntry(1, $43FE, $F2, 0, 0, 3, 0, $122)
    %spritemapEntry(1, $43F2, $F2, 0, 0, 3, 0, $120)

Spritemap_Bang_Growth2_Growing_6:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $10C)

Spritemap_Bang_Growth2_Growing_7:
    dw $0004
    %spritemapEntry(1, $43FF, $F1, 0, 0, 3, 0, $122)
    %spritemapEntry(1, $43F1, $F1, 0, 0, 3, 0, $120)
    %spritemapEntry(1, $43F1, $FF, 1, 1, 3, 0, $122)
    %spritemapEntry(1, $43FF, $FF, 1, 0, 3, 0, $122)

Spritemap_Bang_Growth2_Growing_8:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $10C)

Spritemap_Bang_Growth2_Growing_9:
    dw $0004
    %spritemapEntry(1, $43F0, $00, 1, 1, 3, 0, $122)
    %spritemapEntry(1, $4200, $00, 1, 0, 3, 0, $122)
    %spritemapEntry(1, $4200, $F0, 0, 0, 3, 0, $122)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 3, 0, $120)

Spritemap_Bang_Growth3_Idling_0:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $10C)

Spritemap_Bang_Growth3_Idling_1:
    dw $0004
    %spritemapEntry(1, $4200, $F0, 0, 0, 3, 0, $122)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 3, 0, $120)
    %spritemapEntry(1, $43F0, $00, 1, 1, 3, 0, $122)
    %spritemapEntry(1, $4200, $00, 1, 0, 3, 0, $122)

Spritemap_Bang_Growth3_Idling_2:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $12C)

Spritemap_Bang_Growth3_Idling_3:
    dw $0004
    %spritemapEntry(1, $43F0, $00, 1, 1, 3, 0, $126)
    %spritemapEntry(1, $4200, $00, 1, 0, 3, 0, $126)
    %spritemapEntry(1, $4200, $F0, 0, 0, 3, 0, $126)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 3, 0, $124)

Spritemap_Bang_Growth3_Idling_4:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $14C)

Spritemap_Bang_Growth3_Idling_5:
    dw $0004
    %spritemapEntry(1, $4200, $F0, 0, 0, 3, 0, $12A)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 3, 0, $128)
    %spritemapEntry(1, $43F0, $00, 1, 1, 3, 0, $12A)
    %spritemapEntry(1, $4200, $00, 1, 0, 3, 0, $12A)

Spritemap_Bang_Growth3_Idling_6:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $10C)

Spritemap_Bang_Growth3_Idling_7:
    dw $0004
    %spritemapEntry(1, $4200, $FF, 1, 0, 3, 0, $122)
    %spritemapEntry(1, $43F0, $FF, 1, 1, 3, 0, $122)
    %spritemapEntry(1, $4200, $F1, 0, 0, 3, 0, $122)
    %spritemapEntry(1, $43F0, $F1, 0, 0, 3, 0, $120)

Spritemap_Bang_Growth3_Idling_8:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $12C)

Spritemap_Bang_Growth3_Idling_9:
    dw $0004
    %spritemapEntry(1, $4200, $FF, 1, 0, 3, 0, $126)
    %spritemapEntry(1, $43F0, $FF, 1, 1, 3, 0, $126)
    %spritemapEntry(1, $4200, $F1, 0, 0, 3, 0, $126)
    %spritemapEntry(1, $43F0, $F1, 0, 0, 3, 0, $124)

Spritemap_Bang_Growth3_Idling_A:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $14C)

Spritemap_Bang_Growth3_Idling_B:
    dw $0004
    %spritemapEntry(1, $4200, $FF, 1, 0, 3, 0, $12A)
    %spritemapEntry(1, $43F0, $FF, 1, 1, 3, 0, $12A)
    %spritemapEntry(1, $4200, $F1, 0, 0, 3, 0, $12A)
    %spritemapEntry(1, $43F0, $F1, 0, 0, 3, 0, $128)

Spritemap_Bang_Growth3_Idling_C:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $10C)

Spritemap_Bang_Growth3_Idling_D:
    dw $0004
    %spritemapEntry(1, $43FF, $00, 1, 0, 3, 0, $122)
    %spritemapEntry(1, $43F1, $00, 1, 1, 3, 0, $122)
    %spritemapEntry(1, $43FF, $F0, 0, 0, 3, 0, $122)
    %spritemapEntry(1, $43F1, $F0, 0, 0, 3, 0, $120)

Spritemap_Bang_Growth3_Idling_E:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $12C)

Spritemap_Bang_Growth3_Idling_F:
    dw $0004
    %spritemapEntry(1, $43FF, $00, 1, 0, 3, 0, $126)
    %spritemapEntry(1, $43F1, $00, 1, 1, 3, 0, $126)
    %spritemapEntry(1, $43FF, $F0, 0, 0, 3, 0, $126)
    %spritemapEntry(1, $43F1, $F0, 0, 0, 3, 0, $124)

Spritemap_Bang_Growth3_Idling_10:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $14C)

Spritemap_Bang_Growth3_Idling_11:
    dw $0004
    %spritemapEntry(1, $43FF, $00, 1, 0, 3, 0, $12A)
    %spritemapEntry(1, $43F1, $00, 1, 1, 3, 0, $12A)
    %spritemapEntry(1, $43FF, $F0, 0, 0, 3, 0, $12A)
    %spritemapEntry(1, $43F1, $F0, 0, 0, 3, 0, $128)

Spritemap_Bang_Growth3_Growing_0:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $16A)

Spritemap_Bang_Growth3_Growing_1:
    dw $0004
    %spritemapEntry(1, $43F0, $00, 1, 1, 3, 0, $122)
    %spritemapEntry(1, $4200, $00, 1, 0, 3, 0, $122)
    %spritemapEntry(1, $4200, $F0, 0, 0, 3, 0, $122)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 3, 0, $120)

Spritemap_Bang_Growth3_Growing_2:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $168)

Spritemap_Bang_Growth3_Growing_3:
    dw $0004
    %spritemapEntry(1, $43F0, $00, 1, 1, 3, 0, $122)
    %spritemapEntry(1, $4200, $00, 1, 0, 3, 0, $122)
    %spritemapEntry(1, $4200, $F0, 0, 0, 3, 0, $122)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 3, 0, $120)

Spritemap_Bang_Growth3_Growing_4:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $16C)

Spritemap_Bang_Growth3_Growing_5:
    dw $0004
    %spritemapEntry(1, $43F2, $FE, 1, 1, 3, 0, $142)
    %spritemapEntry(1, $43FE, $FE, 1, 0, 3, 0, $142)
    %spritemapEntry(1, $43FE, $F2, 0, 0, 3, 0, $142)
    %spritemapEntry(1, $43F2, $F2, 0, 0, 3, 0, $140)

Spritemap_Bang_Growth3_Growing_6:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $16E)

Spritemap_Bang_Growth3_Growing_7:
    dw $0004
    %spritemapEntry(1, $43F1, $FF, 1, 1, 3, 0, $142)
    %spritemapEntry(1, $43FF, $FF, 1, 0, 3, 0, $142)
    %spritemapEntry(1, $43FF, $F1, 0, 0, 3, 0, $142)
    %spritemapEntry(1, $43F1, $F1, 0, 0, 3, 0, $140)

Spritemap_Bang_Growth3_Growing_8:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $16C)

Spritemap_Bang_Growth3_Growing_9:
    dw $0004
    %spritemapEntry(1, $4200, $00, 1, 0, 3, 0, $142)
    %spritemapEntry(1, $43F0, $00, 1, 1, 3, 0, $142)
    %spritemapEntry(1, $4200, $F0, 0, 0, 3, 0, $142)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 3, 0, $140)

Spritemap_Bang_Growth3_Growing_A:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $10E)

Spritemap_Bang_Growth3_Growing_B:
    dw $0004
    %spritemapEntry(1, $4200, $00, 1, 0, 3, 0, $142)
    %spritemapEntry(1, $43F0, $00, 1, 1, 3, 0, $142)
    %spritemapEntry(1, $4200, $F0, 0, 0, 3, 0, $142)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 3, 0, $140)

Spritemap_Bang_Electricity_Growth3_4_Growing_0:
    dw $0002
    %spritemapEntry(0, $04, $FC, 0, 0, 3, 0, $164)
    %spritemapEntry(0, $1F6, $F6, 0, 0, 3, 0, $161)

Spritemap_Bang_Electricity_Growth3_4_Growing_1:
    dw $0002
    %spritemapEntry(0, $04, $FC, 0, 0, 3, 0, $165)
    %spritemapEntry(0, $1F6, $F6, 0, 0, 3, 0, $162)

Spritemap_Bang_Electricity_Growth3_4_Growing_2:
    dw $0002
    %spritemapEntry(0, $04, $FC, 0, 0, 3, 0, $166)
    %spritemapEntry(0, $1F6, $F6, 0, 0, 3, 0, $163)

Spritemap_Bang_Electricity_Growth3_4_Growing_3:
    dw $0002
    %spritemapEntry(0, $02, $F6, 0, 1, 3, 0, $161)
    %spritemapEntry(0, $1F4, $FD, 0, 0, 3, 0, $164)

Spritemap_Bang_Electricity_Growth3_4_Growing_4:
    dw $0002
    %spritemapEntry(0, $02, $F6, 0, 1, 3, 0, $162)
    %spritemapEntry(0, $1F4, $FD, 0, 0, 3, 0, $165)

Spritemap_Bang_Electricity_Growth3_4_Growing_5:
    dw $0002
    %spritemapEntry(0, $1F4, $FD, 0, 0, 3, 0, $166)
    %spritemapEntry(0, $02, $F6, 0, 1, 3, 0, $163)

Spritemap_Bang_Electricity_Growth3_4_Growing_6:
    dw $0002
    %spritemapEntry(0, $1FA, $03, 0, 0, 3, 0, $176)
    %spritemapEntry(0, $1FC, $F5, 0, 0, 3, 0, $174)

Spritemap_Bang_Electricity_Growth3_4_Growing_7:
    dw $0002
    %spritemapEntry(0, $1FA, $03, 0, 0, 3, 0, $175)
    %spritemapEntry(0, $1FC, $F5, 0, 0, 3, 0, $175)

Spritemap_Bang_Electricity_Growth3_4_Growing_8:
    dw $0002
    %spritemapEntry(0, $1FB, $03, 0, 0, 3, 0, $174)
    %spritemapEntry(0, $1FC, $F5, 0, 0, 3, 0, $176)

Spritemap_Bang_Electricity_Growth3_4_Growing_9:
    dw $0002
    %spritemapEntry(0, $02, $02, 0, 0, 3, 0, $163)
    %spritemapEntry(0, $1F6, $02, 0, 1, 3, 0, $161)

Spritemap_Bang_Electricity_Growth3_4_Growing_A:
    dw $0002
    %spritemapEntry(0, $02, $02, 0, 0, 3, 0, $162)
    %spritemapEntry(0, $1F6, $02, 0, 1, 3, 0, $162)

Spritemap_Bang_Electricity_Growth3_4_Growing_B:
    dw $0002
    %spritemapEntry(0, $02, $02, 0, 0, 3, 0, $161)
    %spritemapEntry(0, $1F6, $02, 0, 1, 3, 0, $163)

Spritemap_Bang_Growth4_Idling_0:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $10E)

Spritemap_Bang_Growth4_Idling_1:
    dw $0004
    %spritemapEntry(1, $4200, $00, 1, 0, 3, 0, $142)
    %spritemapEntry(1, $43F0, $00, 1, 1, 3, 0, $142)
    %spritemapEntry(1, $4200, $F0, 0, 0, 3, 0, $142)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 3, 0, $140)

Spritemap_Bang_Growth4_Idling_2:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $12E)

Spritemap_Bang_Growth4_Idling_3:
    dw $0004
    %spritemapEntry(1, $4200, $00, 1, 0, 3, 0, $146)
    %spritemapEntry(1, $43F0, $00, 1, 1, 3, 0, $146)
    %spritemapEntry(1, $4200, $F0, 0, 0, 3, 0, $146)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 3, 0, $144)

Spritemap_Bang_Growth4_Idling_4:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $14E)

Spritemap_Bang_Growth4_Idling_5:
    dw $0004
    %spritemapEntry(1, $4200, $00, 1, 0, 3, 0, $14A)
    %spritemapEntry(1, $43F0, $00, 1, 1, 3, 0, $14A)
    %spritemapEntry(1, $4200, $F0, 0, 0, 3, 0, $14A)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 3, 0, $148)

Spritemap_Bang_Growth4_Idling_6:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $10E)

Spritemap_Bang_Growth4_Idling_7:
    dw $0004
    %spritemapEntry(1, $43F0, $FF, 1, 1, 3, 0, $142)
    %spritemapEntry(1, $4200, $FF, 1, 0, 3, 0, $142)
    %spritemapEntry(1, $4200, $F1, 0, 0, 3, 0, $142)
    %spritemapEntry(1, $43F0, $F1, 0, 0, 3, 0, $140)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Bang_Growth4_Idling_A3C485:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $12E)

UNUSED_Spritemap_Bang_Growth4_Idling_A3C48C:
    dw $0004
    %spritemapEntry(1, $43F0, $FF, 1, 1, 3, 0, $146)
    %spritemapEntry(1, $4200, $FF, 1, 0, 3, 0, $146)
    %spritemapEntry(1, $4200, $F1, 0, 0, 3, 0, $146)
    %spritemapEntry(1, $43F0, $F1, 0, 0, 3, 0, $144)

UNUSED_Spritemap_Bang_Growth4_Idling_A3C4A2:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $14E)

UNUSED_Spritemap_Bang_Growth4_Idling_A3C4A9:
    dw $0004
    %spritemapEntry(1, $43F0, $FF, 1, 1, 3, 0, $14A)
    %spritemapEntry(1, $4200, $FF, 1, 0, 3, 0, $14A)
    %spritemapEntry(1, $4200, $F1, 0, 0, 3, 0, $14A)
    %spritemapEntry(1, $43F0, $F1, 0, 0, 3, 0, $148)
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_Bang_Growth4_Idling_8:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $10E)

Spritemap_Bang_Growth4_Idling_9:
    dw $0004
    %spritemapEntry(1, $43FF, $00, 1, 0, 3, 0, $142)
    %spritemapEntry(1, $43F1, $00, 1, 1, 3, 0, $142)
    %spritemapEntry(1, $43FF, $F0, 0, 0, 3, 0, $142)
    %spritemapEntry(1, $43F1, $F0, 0, 0, 3, 0, $140)

Spritemap_Bang_Growth4_Idling_A:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $12E)

Spritemap_Bang_Growth4_Idling_B:
    dw $0004
    %spritemapEntry(1, $43FF, $00, 1, 0, 3, 0, $146)
    %spritemapEntry(1, $43F1, $00, 1, 1, 3, 0, $146)
    %spritemapEntry(1, $43FF, $F0, 0, 0, 3, 0, $146)
    %spritemapEntry(1, $43F1, $F0, 0, 0, 3, 0, $144)

Spritemap_Bang_Growth4_Idling_C:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $14E)

Spritemap_Bang_Growth4_Idling_D:
    dw $0004
    %spritemapEntry(1, $43FF, $00, 1, 0, 3, 0, $14A)
    %spritemapEntry(1, $43F1, $00, 1, 1, 3, 0, $14A)
    %spritemapEntry(1, $43FF, $F0, 0, 0, 3, 0, $14A)
    %spritemapEntry(1, $43F1, $F0, 0, 0, 3, 0, $148)

Spritemap_Bang_Growth4_Growing_0:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $16E)

Spritemap_Bang_Growth4_Growing_1:
    dw $0004
    %spritemapEntry(1, $43F0, $00, 1, 1, 3, 0, $142)
    %spritemapEntry(1, $4200, $00, 1, 0, 3, 0, $142)
    %spritemapEntry(1, $4200, $F0, 0, 0, 3, 0, $142)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 3, 0, $140)

Spritemap_Bang_Growth4_Growing_2:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $16C)

Spritemap_Bang_Growth4_Growing_3:
    dw $0004
    %spritemapEntry(1, $4200, $00, 1, 0, 3, 0, $142)
    %spritemapEntry(1, $43F0, $00, 1, 1, 3, 0, $142)
    %spritemapEntry(1, $4200, $F0, 0, 0, 3, 0, $142)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 3, 0, $140)

Spritemap_Bang_Growth4_Growing_4:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $16E)

Spritemap_Bang_Growth4_Growing_5:
    dw $0004
    %spritemapEntry(1, $43EF, $EF, 0, 1, 3, 0, $142)
    %spritemapEntry(1, $43EF, $01, 1, 1, 3, 0, $142)
    %spritemapEntry(1, $4201, $01, 1, 0, 3, 0, $142)
    %spritemapEntry(1, $4201, $EF, 0, 0, 3, 0, $142)

Spritemap_Bang_Growth4_Growing_6:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $16C)

Spritemap_Bang_Growth4_Growing_7:
    dw $0004
    %spritemapEntry(1, $43EE, $EE, 0, 1, 3, 0, $146)
    %spritemapEntry(1, $43EE, $02, 1, 1, 3, 0, $146)
    %spritemapEntry(1, $4202, $02, 1, 0, 3, 0, $146)
    %spritemapEntry(1, $4202, $EE, 0, 0, 3, 0, $146)

Spritemap_Bang_Growth4_Growing_8:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $16E)

Spritemap_Bang_Growth4_Growing_9:
    dw $0004
    %spritemapEntry(1, $43ED, $ED, 0, 1, 3, 0, $14A)
    %spritemapEntry(1, $43ED, $03, 1, 1, 3, 0, $14A)
    %spritemapEntry(1, $4203, $03, 1, 0, 3, 0, $14A)
    %spritemapEntry(1, $4203, $ED, 0, 0, 3, 0, $14A)

Spritemap_Bang_Growth4_Growing_A:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $16C)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Bang_Electricity_A3C5AE:
    dw $0002
    %spritemapEntry(0, $06, $FC, 0, 0, 3, 0, $164)
    %spritemapEntry(0, $1F5, $F5, 0, 0, 3, 0, $161)

UNUSED_Spritemap_Bang_Electricity_A3C5BA:
    dw $0002
    %spritemapEntry(0, $06, $FC, 0, 0, 3, 0, $165)
    %spritemapEntry(0, $1F5, $F5, 0, 0, 3, 0, $162)

UNUSED_Spritemap_Bang_Electricity_A3C5C6:
    dw $0002
    %spritemapEntry(0, $06, $FC, 0, 0, 3, 0, $166)
    %spritemapEntry(0, $1F5, $F5, 0, 0, 3, 0, $163)

UNUSED_Spritemap_Bang_Electricity_A3C5D2:
    dw $0002
    %spritemapEntry(0, $03, $F5, 0, 1, 3, 0, $161)
    %spritemapEntry(0, $1F2, $FD, 0, 0, 3, 0, $164)

UNUSED_Spritemap_Bang_Electricity_A3C5DE:
    dw $0002
    %spritemapEntry(0, $03, $F5, 0, 1, 3, 0, $162)
    %spritemapEntry(0, $1F2, $FD, 0, 0, 3, 0, $165)

UNUSED_Spritemap_Bang_Electricity_A3C5EA:
    dw $0002
    %spritemapEntry(0, $1F2, $FD, 0, 0, 3, 0, $166)
    %spritemapEntry(0, $03, $F5, 0, 1, 3, 0, $163)

UNUSED_Spritemap_Bang_Electricity_A3C5F6:
    dw $0002
    %spritemapEntry(0, $1FA, $05, 0, 0, 3, 0, $176)
    %spritemapEntry(0, $1FC, $F3, 0, 0, 3, 0, $174)

UNUSED_Spritemap_Bang_Electricity_A3C602:
    dw $0002
    %spritemapEntry(0, $1FA, $05, 0, 0, 3, 0, $175)
    %spritemapEntry(0, $1FC, $F3, 0, 0, 3, 0, $175)

UNUSED_Spritemap_Bang_Electricity_A3C60E:
    dw $0002
    %spritemapEntry(0, $1FB, $05, 0, 0, 3, 0, $174)
    %spritemapEntry(0, $1FC, $F3, 0, 0, 3, 0, $176)

UNUSED_Spritemap_Bang_Electricity_A3C61A:
    dw $0002
    %spritemapEntry(0, $03, $03, 0, 0, 3, 0, $163)
    %spritemapEntry(0, $1F5, $03, 0, 1, 3, 0, $161)

UNUSED_Spritemap_Bang_Electricity_A3C626:
    dw $0002
    %spritemapEntry(0, $03, $03, 0, 0, 3, 0, $162)
    %spritemapEntry(0, $1F5, $03, 0, 1, 3, 0, $162)

UNUSED_Spritemap_Bang_Electricity_A3C632:
    dw $0002
    %spritemapEntry(0, $03, $03, 0, 0, 3, 0, $161)
    %spritemapEntry(0, $1F5, $03, 0, 1, 3, 0, $163)
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $C63E: Palette - enemy $DB7F (skree) ;;;
Palette_Skree:
    dw $3800,$3F57,$2E4D,$00E2,$0060,$3AB0,$220B,$1166
    dw $0924,$7FFF,$039C,$0237,$00D1,$61BF,$38B6,$1448


;;; $C65E: Instruction list - idling ;;;
InstList_Skree_Idling:
    dw $000A,Spritemap_Skree_0
    dw $000A,Spritemap_Skree_2
    dw $000A,Spritemap_Skree_3
    dw $000A,Spritemap_Skree_4
    dw Instruction_Common_GotoY
    dw InstList_Skree_Idling


;;; $C672: Instruction list - prepare to launch attack ;;;
InstList_Skree_PrepareToLaunchAttack:
    dw $0010,Spritemap_Skree_0
    dw $0008,Spritemap_Skree_1
    dw Instruction_Skree_SetAttackReadyFlag
    dw Instruction_Common_Sleep


;;; $C67E: Instruction list - launched attack ;;;
InstList_Skree_LaunchedAttack_0:
    dw Instruction_Common_EnableOffScreenProcessing

InstList_Skree_LaunchedAttack_1:
    dw $0002,Spritemap_Skree_2
    dw $0002,Spritemap_Skree_3
    dw $0002,Spritemap_Skree_4
    dw $0002,Spritemap_Skree_0
    dw Instruction_Common_GotoY
    dw InstList_Skree_LaunchedAttack_1


;;; $C694: Unused. Instruction list - stop animating ;;;
UNUSED_InstList_Skree_StopAnimating_A3C694:
    dw Instruction_Common_DisableOffScreenProcessing
    dw $0001,Spritemap_Skree_0
    dw Instruction_Common_Sleep


;;; $C69C: Skree instruction list pointers ;;;
InstListPointers_Skree:
; Indexed by [enemy Enemy.var3]
    dw InstList_Skree_Idling
    dw InstList_Skree_PrepareToLaunchAttack
    dw InstList_Skree_LaunchedAttack_0
    dw UNUSED_InstList_Skree_StopAnimating_A3C694


;;; $C6A4: Instruction - set attack ready flag ;;;
Instruction_Skree_SetAttackReadyFlag:
    LDX.W EnemyIndex
    LDA.W #$0001 : STA.W Skree.attackReadyFlag,X
    RTL


;;; $C6AE: Initialisation AI - enemy $DB7F (skree) ;;;
InitAI_Skree:
    LDX.W EnemyIndex
    STZ.W Skree.newInstListIndex,X : STZ.W Skree.instListIndex,X
    STZ.W Skree.attackReadyFlag,X
    LDA.W #InstList_Skree_Idling : STA.W Enemy.instList,X
    LDA.W #Function_Skree_Idling : STA.W Skree.function,X
    RTL


;;; $C6C7: Main AI - enemy $DB7F (skree) ;;;
MainAI_Skree:
    LDX.W EnemyIndex
    JMP.W (Skree.function,X)


if !FEATURE_KEEP_UNREFERENCED
;;; $C6CD: Unused. Skree function pointers ;;;
UNUSED_FunctionPointers_Skree_A3C6CD:
    dw Function_Skree_Idling
    dw Function_Skree_PrepareToLaunchAttack
    dw Function_Skree_LaunchedAttack
    dw Function_Skree_Burrowing
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $C6D5: Skree function - idling ;;;
Function_Skree_Idling:
    LDX.W EnemyIndex ; >.<
    LDA.W Enemy.XPosition,X : SEC : SBC.W SamusXPosition : BPL +
    EOR.W #$FFFF : INC

+   CMP.W #$0030 : BCS .return
    INC.W Skree.newInstListIndex,X
    JSR SetSkreeInstListPointer
    LDA.W #Function_Skree_PrepareToLaunchAttack : STA.W Skree.function,X

  .return:
    RTL


;;; $C6F7: Skree function - prepare to launch attack ;;;
Function_Skree_PrepareToLaunchAttack:
    LDA.W Skree.attackReadyFlag,X : BEQ .return
    STZ.W Skree.attackReadyFlag,X
    LDX.W EnemyIndex ; >.<
    INC.W Skree.newInstListIndex,X
    JSR SetSkreeInstListPointer
    LDA.W #Function_Skree_LaunchedAttack : STA.W Skree.function,X
    LDA.W #$005B
    JSL QueueSound_Lib2_Max6

  .return:
    RTL


;;; $C716: Skree function - launched attack ;;;
Function_Skree_LaunchedAttack:
    LDX.W EnemyIndex ; >.<
    LDA.W #$0015 : STA.W Skree.burrowTimer,X
    LDA.W #$0006 : STA.B DP_Temp14
    STZ.B DP_Temp12
    LDA.W Enemy.properties,X : ORA.W #$0003 : STA.W Enemy.properties,X
    LDX.W EnemyIndex ; >.<
    JSL CheckForVerticalSolidBlockCollision_SkreeMetaree
    BCS .collision
    LDX.W EnemyIndex
    LDA.W Enemy.YPosition,X : CLC : ADC.W #$0006 : STA.W Enemy.YPosition,X
    LDA.W #$0001 : STA.W Temp_XVelocity
    LDA.W Enemy.XPosition,X : CMP.W SamusXPosition : BMI .steerRight
    LDA.W #$FFFF : STA.W Temp_XVelocity

  .steerRight:
    LDA.W Enemy.XPosition,X : CLC : ADC.W Temp_XVelocity : STA.W Enemy.XPosition,X
    BRA .return

  .collision:
    LDX.W EnemyIndex
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    LDA.W #Function_Skree_Burrowing : STA.W Skree.function,X
    LDA.W #$005C
    JSL QueueSound_Lib2_Max6

  .return:
    RTL


;;; $C77F: Skree function - burrowing ;;;
Function_Skree_Burrowing:
; I have no idea why .delete does any of those three assignments
    LDX.W EnemyIndex ; >.<
    DEC.W Skree.burrowTimer,X : BEQ .delete
    LDA.W Skree.burrowTimer,X : CMP.W #$0008 : BNE .timerNot8
    LDX.W EnemyIndex ; >.<
    LDY.W #EnemyProjectile_SkreeParticles_DownRight
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    LDY.W #EnemyProjectile_SkreeParticles_UpRight
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    LDY.W #EnemyProjectile_SkreeParticles_DownLeft
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    LDY.W #EnemyProjectile_SkreeParticles_UpLeft
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics

  .timerNot8:
    LDX.W EnemyIndex ; >.<
    INC.W Enemy.YPosition,X
    RTL

  .delete:
    LDX.W EnemyIndex ; >.<
    LDA.W Enemy.palette,X : ORA.W Enemy.GFXOffset,X : STA.L EnemySpawnData.VRAMTilesIndex,X
    LDA.W #$0A00 : STA.W Enemy.palette,X
    STZ.W Enemy.GFXOffset,X
    LDA.W Enemy.properties,X : ORA.W #$0200 : STA.W Enemy.properties,X
    RTL


;;; $C7D5: Set skree instruction list pointer ;;;
SetSkreeInstListPointer:
    LDX.W EnemyIndex
    LDA.W Skree.newInstListIndex,X : CMP.W Skree.instListIndex,X : BEQ .return
    STA.W Skree.instListIndex,X
    ASL : TAY
    LDA.W InstListPointers_Skree,Y : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X

  .return:
    RTS


;;; $C7F5: Enemy shot - enemy $DB7F (skree) ;;;
EnemyShot_Skree:
    LDX.W EnemyIndex
    JSL CommonA3_NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic
    LDX.W EnemyIndex
    LDA.W Enemy.health,X : BNE .return
    LDA.W Skree.burrowTimer,X
    LDX.W EnemyIndex ; >.<
    LDY.W #EnemyProjectile_SkreeParticles_DownRight
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    LDY.W #EnemyProjectile_SkreeParticles_UpRight
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    LDY.W #EnemyProjectile_SkreeParticles_DownLeft
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    LDY.W #EnemyProjectile_SkreeParticles_UpLeft
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    LDY.W #$0002
    LDA.W CollisionIndex : ASL : TAX
    LDA.W SamusProjectile_Types,X : AND.W #$0F00 : CMP.W #$0200 : BEQ .superMissile
    LDY.W #$0000

  .superMissile:
    TYA
    JSL EnemyDeath

  .return:
    RTL


;;; $C842: Skree spritemaps ;;;
Spritemap_Skree_0:
    dw $0006
    %spritemapEntry(0, $00, $0C, 0, 1, 2, 0, $112)
    %spritemapEntry(0, $00, $04, 0, 1, 2, 0, $102)
    %spritemapEntry(0, $1F8, $0C, 0, 0, 2, 0, $112)
    %spritemapEntry(0, $1F8, $04, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $00, $F4, 0, 1, 2, 0, $100)
    %spritemapEntry(1, $1F0, $F4, 0, 0, 2, 0, $100)

Spritemap_Skree_1:
    dw $0004
    %spritemapEntry(0, $04, $04, 0, 1, 2, 0, $105)
    %spritemapEntry(0, $1F4, $04, 0, 0, 2, 0, $105)
    %spritemapEntry(1, $00, $F4, 0, 1, 2, 0, $103)
    %spritemapEntry(1, $1F0, $F4, 0, 0, 2, 0, $103)

Spritemap_Skree_2:
    dw $0002
    %spritemapEntry(1, $1F8, $04, 0, 0, 2, 0, $108)
    %spritemapEntry(1, $1F8, $F4, 0, 0, 2, 0, $106)

Spritemap_Skree_3:
    dw $0004
    %spritemapEntry(0, $1FC, $0C, 0, 0, 2, 0, $11B)
    %spritemapEntry(0, $1FC, $04, 0, 0, 2, 0, $10B)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 0, $11A)
    %spritemapEntry(0, $1FC, $F4, 0, 0, 2, 0, $10A)

Spritemap_Skree_4:
    dw $0002
    %spritemapEntry(1, $1F8, $04, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $1F8, $F4, 0, 0, 2, 0, $10C)


;;; $C8A6: Palette - enemy $DBBF (yard) ;;;
Palette_Yard:
    dw $3800,$57FF,$42F7,$158C,$00A5,$4F5A,$36B5,$2610
    dw $1DCE,$77FF,$62B5,$314A,$1063,$4D1F,$38B6,$246E


;;; $C8C6: Instruction list - outside turn - upside right - moving up ;;;
InstList_Yard_OutsideTurn_UpsideRight_MovingUp:
    dw Instruction_Yard_MovementFunctionInY
    dw RTL_A3CF5F
    dw Instruction_Yard_HidingInstListInY
    dw RTL_A3CF5F
    dw $0007,Spritemap_Yard_15
    dw $0004,Spritemap_Yard_16
    dw $0007,Spritemap_Yard_17
    dw Instruction_Yard_MoveByPixelsInY,$FFFC,$FFF8


;;; $C8E0: Instruction list - crawling - upside up - moving left ;;;
InstList_Yard_Crawling_UpsideUp_MovingLeft:
    dw Instruction_Yard_MovementFunctionInY
    dw Function_Yard_Movement_Crawling_UpsideUp_MovingLeft
    dw Instruction_Yard_HidingInstListInY
    dw InstList_Yard_Hiding_UpsideUp_MovingLeft
    dw Instruction_Yard_DirectionInY,$0006
    dw $0009,Spritemap_Yard_0
    dw $000D,Spritemap_Yard_1
    dw $0009,Spritemap_Yard_2
    dw Instruction_Common_GotoY
    dw InstList_Yard_Crawling_UpsideUp_MovingLeft


;;; $C8FC: Instruction list - outside turn - upside up - moving left ;;;
InstList_Yard_OutsideTurn_UpsideUp_MovingLeft:
    dw Instruction_Yard_MovementFunctionInY
    dw RTL_A3CF5F
    dw Instruction_Yard_HidingInstListInY
    dw RTL_A3CF5F
    dw $0007,Spritemap_Yard_3
    dw $0004,Spritemap_Yard_4
    dw $0007,Spritemap_Yard_5
    dw Instruction_Yard_MoveByPixelsInY,$FFF8,$0004


;;; $C916: Instruction list - crawling - upside left - moving down ;;;
InstList_Yard_Crawling_UpsideLeft_MovingDown:
    dw Instruction_Yard_MovementFunctionInY
    dw Function_Yard_Movement_Crawling_UpsideLeft_MovingDown
    dw Instruction_Yard_HidingInstListInY
    dw InstList_Yard_Hiding_UpsideLeft_MovingDown
    dw Instruction_Yard_DirectionInY,$0003
    dw $0009,Spritemap_Yard_6
    dw $000D,Spritemap_Yard_7
    dw $0009,Spritemap_Yard_8
    dw Instruction_Common_GotoY
    dw InstList_Yard_Crawling_UpsideLeft_MovingDown


;;; $C932: Instruction list - outside turn - upside left - moving down ;;;
InstList_Yard_OutsideTurn_UpsideLeft_MovingDown:
    dw Instruction_Yard_MovementFunctionInY
    dw RTL_A3CF5F
    dw Instruction_Yard_HidingInstListInY
    dw RTL_A3CF5F
    dw $0007,Spritemap_Yard_9
    dw $0004,Spritemap_Yard_A
    dw $0007,Spritemap_Yard_B
    dw Instruction_Yard_MoveByPixelsInY,$0004,$0008


;;; $C94C: Instruction list - crawling - upside down - moving right ;;;
InstList_Yard_Crawling_UpsideDown_MovingRight:
    dw Instruction_Yard_MovementFunctionInY
    dw Function_Yard_Movement_Crawling_UpsideDown_MovingRight
    dw Instruction_Yard_HidingInstListInY
    dw InstList_Yard_Hiding_UpsideDown_MovingRight
    dw Instruction_Yard_DirectionInY,$0005
    dw $0009,Spritemap_Yard_C
    dw $000D,Spritemap_Yard_D
    dw $0009,Spritemap_Yard_E
    dw Instruction_Common_GotoY
    dw InstList_Yard_Crawling_UpsideDown_MovingRight


;;; $C968: Instruction list - outside turn - upside down - moving right ;;;
InstList_Yard_OutsideTurn_UpsideDown_MovingRight:
    dw Instruction_Yard_MovementFunctionInY
    dw RTL_A3CF5F
    dw Instruction_Yard_HidingInstListInY
    dw RTL_A3CF5F
    dw $0007,Spritemap_Yard_F
    dw $0004,Spritemap_Yard_10
    dw $0007,Spritemap_Yard_11
    dw Instruction_Yard_MoveByPixelsInY,$0008,$FFFC


;;; $C982: Instruction list - crawling - upside right - moving up ;;;
InstList_Yard_Crawling_UpsideRight_MovingUp:
    dw Instruction_Yard_MovementFunctionInY
    dw Function_Yard_Movement_Crawling_UpsideRight_MovingUp
    dw Instruction_Yard_HidingInstListInY
    dw InstList_Yard_Hiding_UpsideRight_MovingUp
    dw Instruction_Yard_DirectionInY,$0000
    dw $0009,Spritemap_Yard_12
    dw $000D,Spritemap_Yard_13
    dw $0009,Spritemap_Yard_14
    dw Instruction_Common_GotoY
    dw InstList_Yard_Crawling_UpsideRight_MovingUp


;;; $C99E: Instruction list - outside turn - upside left - moving up ;;;
InstList_Yard_OutsideTurn_UpsideLeft_MovingUp:
    dw Instruction_Yard_MovementFunctionInY
    dw RTL_A3CF5F
    dw Instruction_Yard_HidingInstListInY
    dw RTL_A3CF5F
    dw $0007,Spritemap_Yard_35
    dw $0004,Spritemap_Yard_36
    dw $0007,Spritemap_Yard_37
    dw Instruction_Yard_MoveByPixelsInY,$0004,$FFF8


;;; $C9B8: Instruction list - crawling - upside up - moving right ;;;
InstList_Yard_Crawling_UpsideUp_MovingRight:
    dw Instruction_Yard_MovementFunctionInY
    dw Function_Yard_Movement_Crawling_UpsideUp_MovingRight
    dw Instruction_Yard_HidingInstListInY
    dw InstList_Yard_Hiding_UpsideUp_MovingRight
    dw Instruction_Yard_DirectionInY,$0007
    dw $0009,Spritemap_Yard_20
    dw $000D,Spritemap_Yard_21
    dw $0009,Spritemap_Yard_22
    dw Instruction_Common_GotoY
    dw InstList_Yard_Crawling_UpsideUp_MovingRight


;;; $C9D4: Instruction list - outside turn - upside up - moving right ;;;
InstList_Yard_OutsideTurn_UpsideUp_MovingRight:
    dw Instruction_Yard_MovementFunctionInY
    dw RTL_A3CF5F
    dw Instruction_Yard_HidingInstListInY
    dw RTL_A3CF5F
    dw $0007,Spritemap_Yard_23
    dw $0004,Spritemap_Yard_24
    dw $0007,Spritemap_Yard_25
    dw Instruction_Yard_MoveByPixelsInY,$0008,$0004


;;; $C9EE: Instruction list - crawling - upside right - moving down ;;;
InstList_Yard_Crawling_UpsideRight_MovingDown:
    dw Instruction_Yard_MovementFunctionInY
    dw Function_Yard_Movement_Crawling_UpsideRight_MovingDown
    dw Instruction_Yard_HidingInstListInY
    dw InstList_Yard_Hiding_UpsideRight_MovingDown
    dw Instruction_Yard_DirectionInY,$0001
    dw $0009,Spritemap_Yard_26
    dw $000D,Spritemap_Yard_27
    dw $0009,Spritemap_Yard_28
    dw Instruction_Common_GotoY
    dw InstList_Yard_Crawling_UpsideRight_MovingDown


;;; $CA0A: Instruction list - outside turn - upside right - moving down ;;;
InstList_Yard_OutsideTurn_UpsideRight_MovingDown:
    dw Instruction_Yard_MovementFunctionInY
    dw RTL_A3CF5F
    dw Instruction_Yard_HidingInstListInY
    dw RTL_A3CF5F
    dw $0007,Spritemap_Yard_29
    dw $0004,Spritemap_Yard_2A
    dw $0007,Spritemap_Yard_2B
    dw Instruction_Yard_MoveByPixelsInY,$FFFC,$0008


;;; $CA24: Instruction list - crawling - upside down - moving left ;;;
InstList_Yard_Crawling_UpsideDown_MovingLeft:
    dw Instruction_Yard_MovementFunctionInY
    dw Function_Yard_Movement_Crawling_UpsideDown_MovingLeft
    dw Instruction_Yard_HidingInstListInY
    dw InstList_Yard_Hiding_UpsideDown_MovingLeft
    dw Instruction_Yard_DirectionInY,$0004
    dw $0009,Spritemap_Yard_2C
    dw $000D,Spritemap_Yard_2D
    dw $0009,Spritemap_Yard_2E
    dw Instruction_Common_GotoY
    dw InstList_Yard_Crawling_UpsideDown_MovingLeft


;;; $CA40: Instruction list - outside turn - upside down - moving left ;;;
InstList_Yard_OutsideTurn_UpsideDown_MovingLeft:
    dw Instruction_Yard_MovementFunctionInY
    dw RTL_A3CF5F
    dw Instruction_Yard_HidingInstListInY
    dw RTL_A3CF5F
    dw $0007,Spritemap_Yard_2F
    dw $0004,Spritemap_Yard_30
    dw $0007,Spritemap_Yard_31
    dw Instruction_Yard_MoveByPixelsInY,$FFF8,$FFFC


;;; $CA5A: Instruction list - crawling - upside left - moving up ;;;
InstList_Yard_Crawling_UpsideLeft_MovingUp:
    dw Instruction_Yard_MovementFunctionInY
    dw Function_Yard_Movement_Crawling_UpsideLeft_MovingUp
    dw Instruction_Yard_HidingInstListInY
    dw InstList_Yard_Hiding_UpsideLeft_MovingUp
    dw Instruction_Yard_DirectionInY,$0002
    dw $0009,Spritemap_Yard_32
    dw $000D,Spritemap_Yard_33
    dw $0009,Spritemap_Yard_34
    dw Instruction_Common_GotoY
    dw InstList_Yard_Crawling_UpsideLeft_MovingUp


;;; $CA76: Instruction list - inside turn - upside up - moving left ;;;
InstList_Yard_InsideTurn_UpsideUp_MovingLeft:
    dw Instruction_Yard_MovementFunctionInY
    dw RTL_A3CF5F
    dw Instruction_Yard_HidingInstListInY
    dw RTL_A3CF5F
    dw $0007,Spritemap_Yard_40
    dw $0004,Spritemap_Yard_41
    dw $0007,Spritemap_Yard_42
    dw Instruction_Common_GotoY
    dw InstList_Yard_Crawling_UpsideRight_MovingUp


;;; $CA8E: Instruction list - inside turn - upside right - moving up ;;;
InstList_Yard_InsideTurn_UpsideRight_MovingUp:
    dw Instruction_Yard_MovementFunctionInY
    dw RTL_A3CF5F
    dw Instruction_Yard_HidingInstListInY
    dw RTL_A3CF5F
    dw $0007,Spritemap_Yard_43
    dw $0004,Spritemap_Yard_44
    dw $0007,Spritemap_Yard_45
    dw Instruction_Common_GotoY
    dw InstList_Yard_Crawling_UpsideDown_MovingRight


;;; $CAA6: Instruction list - inside turn - upside down - moving right ;;;
InstList_Yard_InsideTurn_UpsideDown_MovingRight:
    dw Instruction_Yard_MovementFunctionInY
    dw RTL_A3CF5F
    dw Instruction_Yard_HidingInstListInY
    dw RTL_A3CF5F
    dw $0007,Spritemap_Yard_46
    dw $0004,Spritemap_Yard_47
    dw $0007,Spritemap_Yard_48
    dw Instruction_Common_GotoY
    dw InstList_Yard_Crawling_UpsideLeft_MovingDown


;;; $CABE: Instruction list - inside turn - upside left - moving down ;;;
InstList_Yard_InsideTurn_UpsideLeft_MovingDown:
    dw Instruction_Yard_MovementFunctionInY
    dw RTL_A3CF5F
    dw Instruction_Yard_HidingInstListInY
    dw RTL_A3CF5F
    dw $0007,Spritemap_Yard_49
    dw $0004,Spritemap_Yard_4A
    dw $0007,Spritemap_Yard_4B
    dw Instruction_Common_GotoY
    dw InstList_Yard_Crawling_UpsideUp_MovingLeft


;;; $CAD6: Instruction list - inside turn - upside up - moving right ;;;
InstList_Yard_InsideTurn_UpsideUp_MovingRight:
    dw Instruction_Yard_MovementFunctionInY
    dw RTL_A3CF5F
    dw Instruction_Yard_HidingInstListInY
    dw RTL_A3CF5F
    dw $0007,Spritemap_Yard_54
    dw $0004,Spritemap_Yard_55
    dw $0007,Spritemap_Yard_56
    dw Instruction_Common_GotoY
    dw InstList_Yard_Crawling_UpsideLeft_MovingUp


;;; $CAEE: Instruction list - inside turn - upside left - moving up ;;;
InstList_Yard_InsideTurn_UpsideLeft_MovingUp:
    dw Instruction_Yard_MovementFunctionInY
    dw RTL_A3CF5F
    dw Instruction_Yard_HidingInstListInY
    dw RTL_A3CF5F
    dw $0007,Spritemap_Yard_57
    dw $0004,Spritemap_Yard_58
    dw $0007,Spritemap_Yard_59
    dw Instruction_Common_GotoY
    dw InstList_Yard_Crawling_UpsideDown_MovingLeft


;;; $CB06: Instruction list - inside turn - upside down - moving left ;;;
InstList_Yard_InsideTurn_UpsideDown_MovingLeft:
    dw Instruction_Yard_MovementFunctionInY
    dw RTL_A3CF5F
    dw Instruction_Yard_HidingInstListInY
    dw RTL_A3CF5F
    dw $0007,Spritemap_Yard_5A
    dw $0004,Spritemap_Yard_5B
    dw $0007,Spritemap_Yard_5C
    dw Instruction_Common_GotoY
    dw InstList_Yard_Crawling_UpsideRight_MovingDown


;;; $CB1E: Instruction list - inside turn - upside right - moving down ;;;
InstList_Yard_InsideTurn_UpsideRight_MovingDown:
    dw Instruction_Yard_MovementFunctionInY
    dw RTL_A3CF5F
    dw Instruction_Yard_HidingInstListInY
    dw RTL_A3CF5F
    dw $0007,Spritemap_Yard_5D
    dw $0004,Spritemap_Yard_5E
    dw $0007,Spritemap_Yard_5F
    dw Instruction_Common_GotoY
    dw InstList_Yard_Crawling_UpsideUp_MovingRight


;;; $CB36: Instruction list - hiding - upside up - moving left ;;;
InstList_Yard_Hiding_UpsideUp_MovingLeft:
    dw Instruction_Yard_MovementFunctionInY
    dw Function_Yard_Movement_Hiding
    dw $0005,Spritemap_Yard_18
    dw $0001,Spritemap_Yard_19
    dw Instruction_Yard_GoBack4BytesIfHidingOr50PercentChance


;;; $CB44: Instruction list - hidden - upside up - moving left ;;;
InstList_Yard_Hidden_UpsideUp_MovingLeft:
    dw $0030,Spritemap_Yard_4C
    dw $0010,Spritemap_Yard_4D
    dw Instruction_Common_GotoY
    dw InstList_Yard_Crawling_UpsideUp_MovingLeft


;;; $CB50: Instruction list - hiding - upside down - moving left ;;;
InstList_Yard_Hiding_UpsideDown_MovingLeft:
    dw Instruction_Yard_MovementFunctionInY
    dw Function_Yard_Movement_Hiding
    dw $0005,Spritemap_Yard_3C
    dw $0001,Spritemap_Yard_3D
    dw Instruction_Yard_GoBack4BytesIfHidingOr50PercentChance
    dw $0030,Spritemap_Yard_64
    dw $0010,Spritemap_Yard_65
    dw Instruction_Common_GotoY
    dw InstList_Yard_Crawling_UpsideDown_MovingLeft


;;; $CB6A: Instruction list - hiding - upside down - moving right ;;;
InstList_Yard_Hiding_UpsideDown_MovingRight:
    dw Instruction_Yard_MovementFunctionInY
    dw Function_Yard_Movement_Hiding
    dw $0005,Spritemap_Yard_1C
    dw $0001,Spritemap_Yard_1D
    dw Instruction_Yard_GoBack4BytesIfHidingOr50PercentChance
    dw $0030,Spritemap_Yard_50
    dw $0010,Spritemap_Yard_51
    dw Instruction_Common_GotoY
    dw InstList_Yard_Crawling_UpsideDown_MovingRight


;;; $CB84: Instruction list - hiding - upside up - moving right ;;;
InstList_Yard_Hiding_UpsideUp_MovingRight:
    dw Instruction_Yard_MovementFunctionInY
    dw Function_Yard_Movement_Hiding
    dw $0005,Spritemap_Yard_38
    dw $0001,Spritemap_Yard_39
    dw Instruction_Yard_GoBack4BytesIfHidingOr50PercentChance


;;; $CB92: Instruction list - hidden - upside up - moving right ;;;
InstList_Yard_Hidden_UpsideUp_MovingRight:
    dw $0030,Spritemap_Yard_60
    dw $0010,Spritemap_Yard_61
    dw Instruction_Common_GotoY
    dw InstList_Yard_Crawling_UpsideUp_MovingRight


;;; $CB9E: Instruction list - hiding - upside right - moving up ;;;
InstList_Yard_Hiding_UpsideRight_MovingUp:
    dw Instruction_Yard_MovementFunctionInY
    dw Function_Yard_Movement_Hiding
    dw $0005,Spritemap_Yard_1E
    dw $0001,Spritemap_Yard_1F
    dw Instruction_Yard_GoBack4BytesIfHidingOr50PercentChance
    dw $0030,Spritemap_Yard_4E
    dw $0010,Spritemap_Yard_4F
    dw Instruction_Common_GotoY
    dw InstList_Yard_Crawling_UpsideRight_MovingUp


;;; $CBB8: Instruction list - hiding - upside left - moving up ;;;
InstList_Yard_Hiding_UpsideLeft_MovingUp:
    dw Instruction_Yard_MovementFunctionInY
    dw Function_Yard_Movement_Hiding
    dw $0005,Spritemap_Yard_3E
    dw $0001,Spritemap_Yard_3F
    dw Instruction_Yard_GoBack4BytesIfHidingOr50PercentChance
    dw $0030,Spritemap_Yard_62
    dw $0010,Spritemap_Yard_63
    dw Instruction_Common_GotoY
    dw InstList_Yard_Crawling_UpsideLeft_MovingUp


;;; $CBD2: Instruction list - hiding - upside left - moving down ;;;
InstList_Yard_Hiding_UpsideLeft_MovingDown:
    dw Instruction_Yard_MovementFunctionInY
    dw Function_Yard_Movement_Hiding
    dw $0005,Spritemap_Yard_1A
    dw $0001,Spritemap_Yard_1B
    dw Instruction_Yard_GoBack4BytesIfHidingOr50PercentChance
    dw $0030,Spritemap_Yard_52
    dw $0010,Spritemap_Yard_53
    dw Instruction_Common_GotoY
    dw InstList_Yard_Crawling_UpsideLeft_MovingDown


;;; $CBEC: Instruction list - hiding - upside right - moving down ;;;
InstList_Yard_Hiding_UpsideRight_MovingDown:
    dw Instruction_Yard_MovementFunctionInY
    dw Function_Yard_Movement_Hiding
    dw $0005,Spritemap_Yard_3A
    dw $0001,Spritemap_Yard_3B
    dw Instruction_Yard_GoBack4BytesIfHidingOr50PercentChance
    dw $0030,Spritemap_Yard_66
    dw $0010,Spritemap_Yard_67
    dw Instruction_Common_GotoY
    dw InstList_Yard_Crawling_UpsideRight_MovingDown


;;; $CC06: Instruction list - airborne - facing left ;;;
InstList_Yard_Airborne_FacingLeft_0:
    dw Instruction_Yard_MovementFunctionInY
    dw Function_Yard_Movement_Airborne
    dw $0003,Spritemap_Yard_1F

InstList_Yard_Airborne_FacingLeft_1:
    dw $0003,Spritemap_Yard_1B
    dw $0003,Spritemap_Yard_1D
    dw $0003,Spritemap_Yard_1F
    dw Instruction_Common_GotoY
    dw InstList_Yard_Airborne_FacingLeft_1


;;; $CC1E: Instruction list - airborne - facing right ;;;
InstList_Yard_Airborne_FacingRight_0:
    dw Instruction_Yard_MovementFunctionInY
    dw Function_Yard_Movement_Airborne
    dw $0003,Spritemap_Yard_3F

InstList_Yard_Airborne_FacingRight_1:
    dw $0003,Spritemap_Yard_3B
    dw $0003,Spritemap_Yard_3D
    dw $0003,Spritemap_Yard_3F
    dw Instruction_Common_GotoY
    dw InstList_Yard_Airborne_FacingRight_1


;;; $CC36: Instruction - enemy movement function = [[Y]] ;;;
Instruction_Yard_MovementFunctionInY:
    LDA.W $0000,Y : STA.W Yard.movementFunction,X
    INY #2
    RTL


;;; $CC3F: Instruction - enemy hiding instruction list = [[Y]] ;;;
Instruction_Yard_HidingInstListInY:
    LDA.W $0000,Y : STA.W Yard.hidingInstList,X
    INY #2
    RTL


;;; $CC48: Instruction - set enemy direction to [[Y]] ;;;
Instruction_Yard_DirectionInY:
    PHY
    LDA.W $0000,Y : STA.L Yard.direction,X
    ASL #3 : TAY
    LDA.W YardDirectionData_airborneFacingDirection,Y : STA.L Enemy.var2,X
    PLY : INY #2
    RTL


;;; $CC5F: Instruction - move ([[Y]], [[Y] + 2]) pixels ;;;
Instruction_Yard_MoveByPixelsInY:
    LDA.W $0000,Y : CLC : ADC.W Enemy.XPosition,X : STA.W Enemy.XPosition,X
    LDA.W $0002,Y : CLC : ADC.W Enemy.YPosition,X : STA.W Enemy.YPosition,X
    INY #4
    RTL


;;; $CC78: Instruction - go back 4 bytes if hiding or with 50% chance ;;;
Instruction_Yard_GoBack4BytesIfHidingOr50PercentChance:
    LDA.L Yard.behavior,X : CMP.W #$0002 : BEQ .goBack
    JSL GenerateRandomNumber
    BIT.W #$0001 : BNE .goBack
    RTL

  .goBack:
    TYA : SEC : SBC.W #$0006 : TAY
    RTL


if !FEATURE_KEEP_UNREFERENCED
;;; $CC92: Unused. Instruction - make yard face Samus ;;;
UNUSED_Instruction_Yard_A3CC92:
; Wild NOP appears!
    NOP
    PHY
    JSL UNUSED_MakeYardFaceSamus_A3D315
    BCC .notTurningAround
    PLY
    LDA.W Enemy.instList,X : TAY
    RTL

  .notTurningAround:
    PLY
    RTL
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $CCA2: Yard crawling speeds ;;;
YardCrawlingSpeeds:
; Unit 1/100h px/frame. Indexed by [enemy parameter 1] * 2
    dw $0040,$0080,$00C0,$0100,$0140,$0180,$01C0,$0200
    dw $0240,$0280,$02C0,$0300,$0340,$0380,$0400,$0440
    dw $0540,$0580,$05C0,$0600,$0640,$0680,$06C0,$0700
    dw $0740,$0780,$07C0,$0800,$0840,$0880,$0800,$0000


;;; $CCE2: Yard turn data ;;;
YardTurnData:
;        ___________ Outside turn lookahead X offset
;       |      _____ Outside turn lookahead Y offset
;       |     |
  .upsideUp_movingLeft:
    dw $FFF9,$0000
    dw InstList_Yard_OutsideTurn_UpsideUp_MovingLeft
    dw InstList_Yard_InsideTurn_UpsideUp_MovingLeft

  .upsideLeft_movingDown:
    dw $0000,$0007
    dw InstList_Yard_OutsideTurn_UpsideLeft_MovingDown
    dw InstList_Yard_InsideTurn_UpsideLeft_MovingDown

  .upsideDown_movingRight:
    dw $0007,$0000
    dw InstList_Yard_OutsideTurn_UpsideDown_MovingRight
    dw InstList_Yard_InsideTurn_UpsideDown_MovingRight

  .upsideRight_movingUp:
    dw $0000,$FFF9
    dw InstList_Yard_OutsideTurn_UpsideRight_MovingUp
    dw InstList_Yard_InsideTurn_UpsideRight_MovingUp

  .upsideUp_movingRight:
    dw $0007,$0000
    dw InstList_Yard_OutsideTurn_UpsideUp_MovingRight
    dw InstList_Yard_InsideTurn_UpsideUp_MovingRight

  .upsideRight_movingDown:
    dw $0000,$0007
    dw InstList_Yard_OutsideTurn_UpsideRight_MovingDown
    dw InstList_Yard_InsideTurn_UpsideRight_MovingDown

  .upsideDown_movingLeft:
    dw $FFF9,$0000
    dw InstList_Yard_OutsideTurn_UpsideDown_MovingLeft
    dw InstList_Yard_InsideTurn_UpsideDown_MovingLeft

  .upsideLeft_movingUp:
    dw $0000,$FFF9
    dw InstList_Yard_OutsideTurn_UpsideLeft_MovingUp
    dw InstList_Yard_InsideTurn_UpsideLeft_MovingUp

  .upsideUp_movingLeft_noTurnTransition:
    dw $0000,$0000
    dw InstList_Yard_Crawling_UpsideLeft_MovingDown
    dw InstList_Yard_Crawling_UpsideRight_MovingUp

  .upsideDown_movingRight_noTurnTransition:
    dw $0000,$0000
    dw InstList_Yard_Crawling_UpsideRight_MovingUp
    dw InstList_Yard_Crawling_UpsideLeft_MovingDown

  .upsideUp_movingRight_noTurnTransition:
    dw $0000,$0000
    dw InstList_Yard_Crawling_UpsideRight_MovingDown
    dw InstList_Yard_Crawling_UpsideLeft_MovingUp

  .upsideDown_movingLeft_noTurnTransition:
    dw $0000,$0000
    dw InstList_Yard_Crawling_UpsideLeft_MovingUp
    dw InstList_Yard_Crawling_UpsideRight_MovingDown


;;; $CD42: Yard direction data ;;;
YardDirectionData:
; Indexed by [enemy direction] * 8

;              _______________ Movement direction. Not meaningfully used
;             |            ___ Airborne facing direction
;             |           |
  .crawlingInstList:
    dw InstList_Yard_Crawling_UpsideRight_MovingUp
  .movementDirection:
    dw       $0002
  .hidingInstList:
    dw InstList_Yard_Hiding_UpsideRight_MovingUp
  .airborneFacingDirection:
    dw                    $0000

    dw InstList_Yard_Crawling_UpsideRight_MovingDown
    dw       $0003
    dw InstList_Yard_Hiding_UpsideRight_MovingDown
    dw                    $0001

    dw InstList_Yard_Crawling_UpsideLeft_MovingUp
    dw       $0002
    dw InstList_Yard_Hiding_UpsideLeft_MovingUp
    dw                    $0001

    dw InstList_Yard_Crawling_UpsideLeft_MovingDown
    dw       $0003
    dw InstList_Yard_Hiding_UpsideLeft_MovingDown
    dw                    $0000

    dw InstList_Yard_Crawling_UpsideDown_MovingLeft
    dw       $0000
    dw InstList_Yard_Hiding_UpsideDown_MovingLeft
    dw                    $0001

    dw InstList_Yard_Crawling_UpsideDown_MovingRight
    dw       $0001
    dw InstList_Yard_Hiding_UpsideDown_MovingRight
    dw                    $0000

    dw InstList_Yard_Crawling_UpsideUp_MovingLeft
    dw       $0000
    dw InstList_Yard_Hiding_UpsideUp_MovingLeft
    dw                    $0000

    dw InstList_Yard_Crawling_UpsideUp_MovingRight
    dw       $0001
    dw InstList_Yard_Hiding_UpsideUp_MovingRight
    dw                    $0001


;;; $CD82: Yard crawling velocity signs ;;;
YardCrawlingVelocitySigns:
; 0000,0000 = positive
; FFFF,0001 = negative

;        ____________________ X velocity
;       |            ________ Y velocity
;       |           |
  .X:
    dw $FFFF,$0001
  .Y:
    dw             $FFFF,$0001
    dw $FFFF,$0001,$0000,$0000
    dw $0000,$0000,$FFFF,$0001
    dw $0000,$0000,$0000,$0000
    dw $FFFF,$0001,$FFFF,$0001
    dw $0000,$0000,$FFFF,$0001
    dw $FFFF,$0001,$0000,$0000
    dw $0000,$0000,$0000,$0000


;;; $CDC2: Yard opposite directions ;;;
YardOppositeDirection:
    dw $0001 ; 0: Upside right - moving up
    dw $0000 ; 1: Upside right - moving down
    dw $0003 ; 2: Upside left-   moving up
    dw $0002 ; 3: Upside left-   moving down
    dw $0005 ; 4: Upside down-   moving left
    dw $0004 ; 5: Upside down-   moving right
    dw $0007 ; 6: Upside up  -   moving left
    dw $0006 ; 7: Upside up  -   moving right


;;; $CDD2: Yard crawling movement functions ;;;
YardCrawlingMovementFunctions:
; Indexed by [enemy $7E:780E] * 2
    dw Function_Yard_Movement_Crawling_UpsideDown_MovingLeft
    dw Function_Yard_Movement_Crawling_UpsideRight_MovingDown
    dw Function_Yard_Movement_Crawling_UpsideLeft_MovingUp
    dw Function_Yard_Movement_Crawling_UpsideLeft_MovingDown             ; <-- points to upside right - moving up
    dw Function_Yard_Movement_Crawling_UpsideRight_MovingUp
    dw Function_Yard_Movement_Crawling_UpsideDown_MovingRight
    dw Function_Yard_Movement_Crawling_UpsideUp_MovingLeft               ; <-- points to upside down - moving left
    dw Function_Yard_Movement_Crawling_UpsideUp_MovingRight


;;; $CDE2: Initialisation AI - enemy $DBBF (yard) ;;;
InitAI_Yard:
    LDX.W EnemyIndex
    LDA.W #RTL_A3CF5F : STA.W Yard.movementFunction,X
    LDA.W #Spritemap_Common_Nothing : STA.W Enemy.spritemap,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDA.W Enemy.instList,X : ASL #3 : TAY
    LDA.W YardDirectionData_crawlingInstList,Y : STA.W Enemy.instList,X
    LDA.W YardDirectionData_movementDirection,Y : ORA.W Enemy.properties,X : STA.W Enemy.properties,X
    LDA.W YardDirectionData_hidingInstList,Y : STA.W Yard.hidingInstList,X
    LDA.W YardDirectionData_airborneFacingDirection,Y : STA.W Yard.airborneFacingDirection,X
    LDA.W #$0000 : STA.L Yard.behavior,X
    LDA.W Yard.crawlingSpeedTableIndex,X : STA.L Yard.idleCrawlingSpeedTableIndex,X
; fallthrough to SetYardCrawlingVelocities


;;; $CE27: Set yard crawling velocities ;;;
SetYardCrawlingVelocities:
;; Parameters:
;;     Y: Direction * 8
    LDA.W YardCrawlingVelocitySigns_X,Y : STA.B DP_Temp12
    LDA.W YardCrawlingVelocitySigns_X+2,Y : STA.B DP_Temp14
    LDA.W YardCrawlingVelocitySigns_Y,Y : STA.B DP_Temp16
    LDA.W YardCrawlingVelocitySigns_Y+2,Y : STA.B DP_Temp18
    LDA.W Yard.crawlingSpeedTableIndex,X : ASL : TAY
    LDA.W YardCrawlingSpeeds,Y : EOR.B DP_Temp12 : CLC : ADC.B DP_Temp14 : STA.W Yard.crawlingXVelocity,X
    LDA.W YardCrawlingSpeeds,Y : EOR.B DP_Temp16 : CLC : ADC.B DP_Temp18 : STA.W Yard.crawlingYVelocity,X
    RTL


;;; $CE57: Set yard crawling movement function ;;;
SetYardCrawlingMovementFunction:
    LDA.L Yard.direction,X : ASL : TAY
    LDA.W YardCrawlingMovementFunctions,Y : STA.W Yard.movementFunction,X
    RTL


;;; $CE64: Main AI - enemy $DBBF (yard) ;;;
MainAI_Yard:
    LDX.W EnemyIndex
    JSR DropYardIfSuperMissileQuake
    JSR HandleYardHiding
    JSR DetermineIfYardHitboxIsSolidToSamus
    JMP.W (Yard.movementFunction,X)


;;; $CE73: Drop yard if super missile quake ;;;
DropYardIfSuperMissileQuake:
    LDA.L Yard.behavior,X : CMP.W #$0003 : BEQ .return
    CMP.W #$0004 : BEQ .return
    CMP.W #$0005 : BEQ .return
    LDA.W EarthquakeTimer : CMP.W #$001E : BNE .return
    LDA.W EarthquakeType : CMP.W #$0014 : BNE .return
    JSR DropYard

  .return:
    RTS


;;; $CE9A: Handle yard hiding ;;;
HandleYardHiding:
    LDA.L Yard.behavior,X : CMP.W #$0001 : BEQ .return1
    CMP.W #$0003 : BEQ .return1
    CMP.W #$0004 : BEQ .return1
    CMP.W #$0005 : BEQ .return1
    LDA.W Enemy.YPosition,X : SEC : SBC.W SamusYPosition : CMP.W #$FFA0 : BMI .crawl
    LDA.W Enemy.XPosition,X : CMP.W SamusXPosition : BMI .leftOfSamus
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0008 : BNE .crawl
    BRA +

  .leftOfSamus:
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0004 : BNE .crawl

+   LDA.L Yard.behavior,X : CMP.W #$0002 : BEQ .return0
    LDA.W Yard.hidingInstList,X : CMP.W #RTL_A3CF5F : BEQ .crawl
    STA.W Enemy.instList,X
    LDA.W #Spritemap_Common_Nothing : STA.W Enemy.spritemap,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    LDA.W #$0002 : STA.L Yard.behavior,X

  .return0:
    RTS

  .crawl:
    LDA.W #$0000 : STA.L Yard.behavior,X

  .return1:
    RTS


;;; $CF11: Determine if yard hitbox is solid to Samus ;;;
DetermineIfYardHitboxIsSolidToSamus:
    LDA.W Yard.movementFunction,X : CMP.W #Function_Yard_Movement_Airborne : BEQ .notSolid
    LDA.L Yard.behavior,X : CMP.W #$0001 : BEQ .aggressivelyCrawling
    LDA.W SamusRunningMomentumFlag : BNE .notSolid
    LDA.L Yard.behavior,X : CMP.W #$0002 : BEQ .solid
    CMP.W #$0003 : BEQ .notSolid
    CMP.W #$0005 : BNE .solid
    BRA .notSolid

  .aggressivelyCrawling:
    LDA.W SamusRunningMomentumFlag : BNE .notSolid
    LDA.W Yard.movementFunction,X : CMP.W #RTL_A3CF5F : BEQ .solid
    BRA .notSolid

  .solid:
    LDA.W Enemy.properties,X : ORA.W #$8000 : STA.W Enemy.properties,X
    RTS

  .notSolid:
    LDA.W Enemy.properties,X : AND.W #$7FFF : STA.W Enemy.properties,X
    RTS


;;; $CF5F: RTL ;;;
RTL_A3CF5F:
; Also used as dummy hiding instruction list pointer
    RTL


;;; $CF60: Yard movement function - hiding ;;;
Function_Yard_Movement_Hiding:
    LDA.L Yard.direction,X : CMP.W #$0004 : BCS .notMovingVertically
    STZ.B DP_Temp12 : STZ.B DP_Temp14
    LDA.W Yard.crawlingXVelocity,X
    JSR SignedMath_A3CF8F
    JSL CheckForHorizontalSolidBlockCollision
    BCC .noCollision
    RTL

  .notMovingVertically:
    STZ.B DP_Temp12 : STZ.B DP_Temp14
    LDA.W Yard.crawlingYVelocity,X
    JSR SignedMath_A3CF8F
    JSL CheckForVerticalSolidBlockCollision
    BCC .noCollision
    RTL

  .noCollision:
    JSR DropYard
    RTL


;;; $CF8F: $14.$12 = ±[A] / 100h + 7 * sgn([A]) ;;;
SignedMath_A3CF8F:
; Requires $14.$12 to be set to 0.0 first
    BPL +
    DEC.B DP_Temp14

+   STA.B DP_Temp13
    LDA.B DP_Temp14 : BPL .add7
    SEC : SBC.W #$0007
    BRA +

  .add7:
    CLC : ADC.W #$0007

+   STA.B DP_Temp14
    RTS


;;; $CFA6: Yard movement function - crawling - upside up - moving left ;;;
Function_Yard_Movement_Crawling_UpsideUp_MovingLeft:
    LDA.L Yard.turnTransitionDisableFlag,X : BNE .upsideUpMovingLeftNoTurnTransition
    LDY.W #YardTurnData_upsideUp_movingLeft
    BRA .gotoCrawlingMovementHorizontal

  .upsideUpMovingLeftNoTurnTransition:
    LDY.W #YardTurnData_upsideUp_movingLeft_noTurnTransition

  .gotoCrawlingMovementHorizontal:
    JMP YardCrawlingMovement_Horizontal


;;; $CFB7: Yard movement function - crawling - upside left - moving down ;;;
Function_Yard_Movement_Crawling_UpsideLeft_MovingDown:
    LDY.W #YardTurnData_upsideLeft_movingDown
    JMP YardCrawlingMovement_Vertical


;;; $CFBD: Yard movement function - crawling - upside down - moving right ;;;
Function_Yard_Movement_Crawling_UpsideDown_MovingRight:
    LDA.L Yard.turnTransitionDisableFlag,X : BNE .upsideDownMovingRightNoTurnTransition
    LDY.W #YardTurnData_upsideDown_movingRight
    BRA .gotoCrawlingMovementHorizontal

  .upsideDownMovingRightNoTurnTransition:
    LDY.W #YardTurnData_upsideDown_movingRight_noTurnTransition

  .gotoCrawlingMovementHorizontal:
    JMP YardCrawlingMovement_Horizontal


;;; $CFCE: Yard movement function - crawling - upside right - moving up ;;;
Function_Yard_Movement_Crawling_UpsideRight_MovingUp:
    LDY.W #YardTurnData_upsideRight_movingUp
    JMP YardCrawlingMovement_Vertical


;;; $CFD4: Yard movement function - crawling - upside up - moving right ;;;
Function_Yard_Movement_Crawling_UpsideUp_MovingRight:
    LDA.L Yard.turnTransitionDisableFlag,X : BNE .upsideUpMovingRightNoTurnTransition
    LDY.W #YardTurnData_upsideUp_movingRight
    BRA .gotoCrawlingMovementHorizontal

  .upsideUpMovingRightNoTurnTransition:
    LDY.W #YardTurnData_upsideUp_movingRight_noTurnTransition

  .gotoCrawlingMovementHorizontal:
    JMP YardCrawlingMovement_Horizontal


;;; $CFE5: Yard movement function - crawling - upside right - moving down ;;;
Function_Yard_Movement_Crawling_UpsideRight_MovingDown:
    LDY.W #YardTurnData_upsideRight_movingDown
    JMP YardCrawlingMovement_Vertical


;;; $CFEB: Yard movement function - crawling - upside down - moving left ;;;
Function_Yard_Movement_Crawling_UpsideDown_MovingLeft:
    LDA.L Yard.turnTransitionDisableFlag,X : BNE .upsideDownMovingLeftNoTurnTransition
    LDY.W #YardTurnData_upsideDown_movingLeft
    BRA .gotoCrawlingMovementHorizontal

  .upsideDownMovingLeftNoTurnTransition:
    LDY.W #YardTurnData_upsideDown_movingLeft_noTurnTransition

  .gotoCrawlingMovementHorizontal:
    JMP YardCrawlingMovement_Horizontal


;;; $CFFC: Yard movement function - crawling - upside left - moving up ;;;
Function_Yard_Movement_Crawling_UpsideLeft_MovingUp:
    LDY.W #YardTurnData_upsideLeft_movingUp
    JMP YardCrawlingMovement_Vertical


;;; $D002: Yard crawling movement - vertical ;;;
YardCrawlingMovement_Vertical:
;; Parameters:
;;     Y: Pointer to turn data entry (see YardTurnData)
    JSR MoveYardAheadForOutsideTurnCheck
    STZ.B DP_Temp12 : STZ.B DP_Temp14
    LDA.W Yard.crawlingXVelocity,X : BPL +
    DEC.B DP_Temp14

+   STA.B DP_Temp13
    LDA.B DP_Temp14 : BPL .inc
    DEC
    BRA +

  .inc:
    INC

+   STA.B DP_Temp14
    PHY
    JSL MoveEnemyRightBy_14_12_ProcessSlopes
    PLY
    JSR MoveYardBackForOutsideTurnCheck
    BCC .outsideTurn
    LDA.W #$0000 : STA.W Yard.consequtiveTurnCounter,X
    PHY
    JSL AlignEnemyYPositionWIthNonSquareSlope
    PLY
    JSR HandleTurnTransitionDisabling
    STZ.B DP_Temp12 : STZ.B DP_Temp14
    LDA.W Yard.crawlingYVelocity,X : BPL +
    DEC.B DP_Temp14

+   STA.B DP_Temp13
    PHY
    JSL MoveEnemyDownBy_14_12
    PLY
    BCS .insideTurn
    RTL

  .insideTurn:
    LDA.W Yard.crawlingXVelocity,X : EOR.W #$FFFF : INC : STA.W Yard.crawlingXVelocity,X
    LDA.W $0006,Y
    JSR SetYardInstList_DisableTurnTransition
    RTL

  .outsideTurn:
    LDA.W Yard.consequtiveTurnCounter,X : INC : STA.W Yard.consequtiveTurnCounter,X
    CMP.W #$0004 : BMI .lessThan4Turns
    JSR DropYard
    RTL

  .lessThan4Turns:
    LDA.W Yard.crawlingYVelocity,X : EOR.W #$FFFF : INC : STA.W Yard.crawlingYVelocity,X
    LDA.W $0004,Y
    JSR SetYardInstList_DisableTurnTransition
    RTL


;;; $D07E: Yard crawling movement - horizontal ;;;
YardCrawlingMovement_Horizontal:
;; Parameters:
;;     Y: Pointer to turn data entry (see YardTurnData)
    JSR MoveYardAheadForOutsideTurnCheck
    STZ.B DP_Temp12 : STZ.B DP_Temp14
    LDA.W Yard.crawlingYVelocity,X : BPL +
    DEC.B DP_Temp14

+   STA.B DP_Temp13
    LDA.B DP_Temp14 : BPL .inc
    DEC
    BRA +

  .inc:
    INC

+   STA.B DP_Temp14
    PHY
    JSL MoveEnemyDownBy_14_12
    PLY
    JSR MoveYardBackForOutsideTurnCheck
    BCC .outsideTurn
    LDA.W #$0000 : STA.W Yard.consequtiveTurnCounter,X
    STZ.B DP_Temp12 : STZ.B DP_Temp14
    LDA.W Yard.crawlingXVelocity,X : BPL +
    DEC.B DP_Temp14

+   STA.B DP_Temp13
    PHY
    JSL MoveEnemyRightBy_14_12_ProcessSlopes
    PLY
    BCS .insideTurn
    JSL AlignEnemyYPositionWIthNonSquareSlope
    JSR HandleTurnTransitionDisabling
    RTL

  .insideTurn:
    LDA.W Yard.crawlingYVelocity,X : EOR.W #$FFFF : INC : STA.W Yard.crawlingYVelocity,X
    LDA.W $0006,Y
    JSR SetYardInstList_DisableTurnTransition
    RTL

  .outsideTurn:
    LDA.W Yard.consequtiveTurnCounter,X : INC : STA.W Yard.consequtiveTurnCounter,X : CMP.W #$0004 : BMI .lessThan4Turns
    JSR DropYard
    RTL

  .lessThan4Turns:
    LDA.W Yard.crawlingXVelocity,X : EOR.W #$FFFF : INC : STA.W Yard.crawlingXVelocity,X
    LDA.W $0004,Y
    JSR SetYardInstList_DisableTurnTransition
    RTL


;;; $D0F8: Move enemy ahead for outside turn check ;;;
MoveYardAheadForOutsideTurnCheck:
;; Parameters:
;;     Y: Pointer to turn data entry (see YardTurnData)
    LDA.W Enemy.XPosition,X : CLC : ADC.W $0000,Y : STA.W Enemy.XPosition,X
    LDA.W Enemy.YPosition,X : CLC : ADC.W $0002,Y : STA.W Enemy.YPosition,X
    RTS


;;; $D10D: Move enemy back from outside turn check ;;;
MoveYardBackForOutsideTurnCheck:
;; Parameters:
;;     Y: Pointer to turn data entry (see YardTurnData)
; Important that the carry flag is preserved here
    PHP
    LDA.W Enemy.XPosition,X : SEC : SBC.W $0000,Y : STA.W Enemy.XPosition,X
    LDA.W Enemy.YPosition,X : SEC : SBC.W $0002,Y : STA.W Enemy.YPosition,X
    PLP
    RTS


;;; $D124: Handle turn transition disabling ;;;
HandleTurnTransitionDisabling:
;; Parameters:
;;     Carry: Set if position was adjusted by slope, otherwise clear
    BCS .resetTurnTransitionDisableCounter
    LDA.L Yard.turnTransitionDisableCounter,X : INC : CMP.W #$0010 : BCS .enableTurnTransition
    STA.L Yard.turnTransitionDisableCounter,X
    RTS

  .resetTurnTransitionDisableCounter:
    LDA.W #$0001 : STA.L Yard.turnTransitionDisableFlag,X
    LDA.W #$0000 : STA.L Yard.turnTransitionDisableCounter,X
    RTS

  .enableTurnTransition:
    LDA.W #$0000 : STA.L Yard.turnTransitionDisableFlag,X
    RTS


;;; $D14C: Set enemy instruction list and disable turn transition ;;;
SetYardInstList_DisableTurnTransition:
    STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDA.W #$0001 : STA.L Yard.turnTransitionDisableFlag,X
    LDA.W #$0000 : STA.L Yard.turnTransitionDisableCounter,X
    RTS


;;; $D164: Drop yard ;;;
DropYard:
    PHY
    LDA.L Yard.behavior,X : CMP.W #$0003 : BEQ .return
    LDA.W #$0003 : STA.L Yard.behavior,X
    LDA.W #Function_Yard_Movement_Airborne : STA.W Yard.movementFunction,X
    LDA.W Yard.airborneFacingDirection,X : ASL #2 : TAY
    LDA.W .airbornePointers,Y : STA.W Enemy.instList,X
    LDA.W .hidingPointers,Y : STA.W Yard.hidingInstList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    LDA.W #$0000 : STA.L Yard.airborneXSubVelocity,X : STA.L Yard.airborneXVelocity,X
    STA.L Yard.airborneYSubVelocity,X : STA.L Yard.airborneYVelocity,X

  .return:
    PLY
    RTS

  .airbornePointers:
    dw InstList_Yard_Airborne_FacingLeft_0

  .hidingPointers:
    dw InstList_Yard_Hidden_UpsideUp_MovingLeft
    dw InstList_Yard_Airborne_FacingRight_0
    dw InstList_Yard_Hidden_UpsideUp_MovingRight


;;; $D1B3: Yard movement function - airborne ;;;
Function_Yard_Movement_Airborne:
; Note the two fixed point negation operations at .hitWall and $D26D are off by 1.0 when the low word is zero
    LDA.L Yard.behavior,X : CMP.W #$0003 : BEQ .XMovementEnd
    LDA.L Yard.airborneXSubVelocity,X : STA.B DP_Temp12
    LDA.L Yard.airborneXVelocity,X : STA.B DP_Temp14
    JSL MoveEnemyRightBy_14_12_IgnoreSlopes
    BCS .hitWall
    LDA.L Yard.airborneXVelocity,X : BMI .right
    LDA.W #$1000 : EOR.W #$FFFF : INC : STA.B DP_Temp16
    LDA.W #$0000 : EOR.W #$FFFF : STA.B DP_Temp18
    BRA +

  .right:
    LDA.W #$1000 : STA.B DP_Temp16
    LDA.W #$0000 : STA.B DP_Temp18

+   CLC
    LDA.L Yard.airborneXSubVelocity,X : ADC.B DP_Temp16 : STA.L Yard.airborneXSubVelocity,X
    LDA.L Yard.airborneXVelocity,X : ADC.B DP_Temp18 : BEQ .gotoXMovementEnd
    STA.L Yard.airborneXVelocity,X

  .gotoXMovementEnd:
    BRA .XMovementEnd

  .hitWall:
    LDA.L Yard.airborneXSubVelocity,X : EOR.W #$FFFF : INC : STA.L Yard.airborneXSubVelocity,X
    LDA.L Yard.airborneXVelocity,X : EOR.W #$FFFF : INC : STA.L Yard.airborneXVelocity,X
    LDA.W #$0001 : STA.L ExtraEnemy8000,X
    LDA.W #$0070
    JSL QueueSound_Lib2_Max3
    JMP .XMovementEnd ; >_<

  .XMovementEnd:
    LDA.L Yard.airborneYSubVelocity,X : STA.B DP_Temp12
    LDA.L Yard.airborneYVelocity,X : STA.B DP_Temp14
    JSL MoveEnemyDownBy_14_12
    BCS .collidedVertically
    CLC
    LDA.L Yard.airborneYSubVelocity,X : ADC.W #$2000 : STA.L Yard.airborneYSubVelocity,X
    LDA.L Yard.airborneYVelocity,X : ADC.W #$0000 : CMP.W #$0004 : BPL .return
    STA.L Yard.airborneYVelocity,X

  .return:
    RTL

  .collidedVertically:
    LDA.L Yard.airborneYVelocity,X : BMI +
    CMP.W #$0003 : BMI .land

+   LDA.L Yard.airborneYSubVelocity,X : EOR.W #$FFFF : INC : STA.L Yard.airborneYSubVelocity,X
    LDA.L Yard.airborneYVelocity,X : EOR.W #$FFFF : INC : STA.L Yard.airborneYVelocity,X
    LDA.W #$0000 : STA.L ExtraEnemy8000,X
    RTL

  .land:
    LDA.W #$0000 : STA.L Yard.airborneXVelocity,X : STA.L Yard.airborneXSubVelocity,X
    STA.L Yard.airborneYVelocity,X : STA.L Yard.airborneYSubVelocity,X
    STA.W Yard.consequtiveTurnCounter,X : STA.L Yard.turnTransitionDisableCounter,X
    LDA.W #$0001 : STA.L Yard.turnTransitionDisableFlag,X
    LDA.L Yard.behavior,X : CMP.W #$0003 : BEQ .dropped
    LDA.W #$0001 : STA.L Yard.behavior,X
    LDA.W #$0008 : STA.W Yard.crawlingSpeedTableIndex,X
    JSL MakeYardFaceSamusHorizontally
    JSR SetYardAirborneInstList
    BRA +

  .dropped:
    LDA.W #$0000 : STA.L Yard.behavior,X

+   LDA.W Enemy.properties,X : AND.W #$FFFC : ORA.W Yard.airborneFacingDirection,X : STA.W Enemy.properties,X
    JSL InitAI_Crawlers_Common
    LDA.W #RTL_A3CF5F : STA.W Yard.movementFunction,X
    LDA.W Yard.hidingInstList,X : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    RTL


;;; $D2FA: Set yard airborne instruction list ;;;
SetYardAirborneInstList:
    LDA.W Yard.airborneFacingDirection,X : ASL #2 : TAY
    LDA.W .airbornePointers,Y : STA.W Enemy.instList,X
    LDA.W .hidingPointers,Y : STA.W Yard.hidingInstList,X
    RTS

  .airbornePointers:
    dw InstList_Yard_Airborne_FacingLeft_0

  .hidingPointers:
    dw InstList_Yard_Hidden_UpsideUp_MovingLeft
    dw InstList_Yard_Airborne_FacingRight_0
    dw InstList_Yard_Hidden_UpsideUp_MovingRight


if !FEATURE_KEEP_UNREFERENCED
;;; $D315: Unused. Make yard face Samus ;;;
UNUSED_MakeYardFaceSamus_A3D315:
;; Returns:
;;     Carry: Set if yard was turned around
    LDA.L Yard.turnTransitionDisableFlag,X : BEQ .turningEnabled
    CLC
    RTL

  .turningEnabled:
    LDA.L Yard.direction,X : CMP.W #$0004 : BCS MakeYardFaceSamusHorizontally
    BIT.W #$0001 : BNE .movingDown
    LDA.W Enemy.YPosition,X : CMP.W SamusYPosition : BCC TurnYardAround
    CLC
    RTL

  .movingDown:
    LDA.W Enemy.YPosition,X : CMP.W SamusYPosition : BCS TurnYardAround
    RTL
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $D33E: Make yard face Samus horizontally ;;;
MakeYardFaceSamusHorizontally:
;; Returns:
;;     Carry: Set if yard was turned around

; Carry is only used by unused caller UNUSED_MakeYardFaceSamus_A3D315 (for UNUSED_Instruction_Yard_A3CC92)
    LDA.W Yard.airborneFacingDirection,X : BNE .facingRight
    LDA.W Enemy.XPosition,X : CMP.W SamusXPosition : BCC TurnYardAround
    CLC
    RTL

  .facingRight:
    LDA.W Enemy.XPosition,X : CMP.W SamusXPosition : BCS TurnYardAround
    RTL


;;; $D356: Turn yard around ;;;
;; Returns:
;;     Carry: Set if yard was turned around

; Carry is only used by unused caller UNUSED_MakeYardFaceSamus_A3D315 (for UNUSED_Instruction_Yard_A3CC92)
TurnYardAround:
    LDA.L Yard.behavior,X : CMP.W #$0002 : BEQ .failed
    LDA.W Yard.movementFunction,X : CMP.W #RTL_A3CF5F : BEQ .failed
    LDA.L Yard.direction,X : ASL : TAY
    LDA.W YardOppositeDirection,Y : STA.L Yard.direction,X
    ASL #3 : TAY
    LDA.W YardDirectionData_crawlingInstList,Y : STA.W Enemy.instList,X
    LDA.W Enemy.properties,X : AND.W #$FFFC : ORA.W YardDirectionData_movementDirection,Y : STA.W Enemy.properties,X
    LDA.W YardDirectionData_hidingInstList,Y : STA.W Yard.hidingInstList,X
    LDA.W YardDirectionData_airborneFacingDirection,Y : STA.W Yard.airborneFacingDirection,X
    JSL SetYardCrawlingVelocities
    JSL SetYardCrawlingMovementFunction
    LDA.W #$0001 : STA.L Yard.turnTransitionDisableFlag,X
    LDA.W #$0000 : STA.L Yard.turnTransitionDisableCounter,X
    SEC
    RTL

  .failed:
    CLC
    RTL


;;; $D3B0: Enemy touch - enemy $DBBF (yard) ;;;
EnemyTouch_Yard:
    LDX.W EnemyIndex
    LDA.L Yard.behavior,X : CMP.W #$0001 : BNE .notAggressiveCrawling
    LDA.W Yard.movementFunction,X : CMP.W #RTL_A3CF5F : BEQ .notAggressiveCrawling
    JSR CheckIfSamusIsDirectingTowardsYard
    BCC .notAggressiveCrawling
    BRA .notKicked

  .notAggressiveCrawling:
    LDA.W Yard.movementFunction,X : CMP.W #Function_Yard_Movement_Airborne : BEQ .kicked
    LDA.W SamusRunningMomentumFlag : BEQ .notKicked

  .kicked:
    JSR KickYardIntoAir
    LDA.W Yard.movementFunction,X : CMP.W #Function_Yard_Movement_Airborne : BNE .returnUpper
    LDA.W #$0070
    JSL QueueSound_Lib2_Max3

  .returnUpper:
    RTL

  .notKicked:
    LDA.W Yard.movementFunction,X : CMP.W #RTL_A3CF5F : BEQ .returnLower
    LDA.L Yard.behavior,X : CMP.W #$0004 : BEQ .returnLower
    CMP.W #$0003 : BEQ .returnLower
    JSL CommonA3_NormalEnemyTouchAI
    LDA.L Yard.idleCrawlingSpeedTableIndex,X : STA.W Yard.crawlingSpeedTableIndex,X
    LDA.L Yard.behavior,X : CMP.W #$0000 : BEQ .setIdleCrawling
    JSL TurnYardAround

  .setIdleCrawling:
    LDA.W #$0000 : STA.L Yard.behavior,X

  .returnLower:
    RTL


;;; $D421: Check if player is directing towards enemy ;;;
CheckIfSamusIsDirectingTowardsYard:
;; Returns:
;;     Carry: Set if player is directing towards enemy, clear otherwise

; Return carry clear if pressing right and enemy is "facing" right, or not pressing right and enemy is "facing" left
    LDA.B DP_Controller1Input : AND.W #$0300 : XBA : DEC : STA.B DP_Temp12
    LDA.W Yard.airborneFacingDirection,X : AND.W #$0001 : STA.B DP_Temp14
    LDA.B DP_Temp12 : BNE .notPressingRight
    LDA.B DP_Temp14 : BEQ .towardsYard
    BRA .awayFromYard

  .notPressingRight:
    LDA.B DP_Temp14 : BEQ .awayFromYard
    BRA .towardsYard

  .awayFromYard:
    CLC
    RTS

  .towardsYard:
    SEC
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $D446: Unused. Check if enemy is moving the direction Samus is facing ;;;
UNUSED_CheckIfYardIsMovingTheDirectionSamusIsFacing_A3D446:
;; Returns:
;;     Carry: Clear if enemy is moving the direction Samus is facing, set otherwise
    LDA.W Yard.crawlingXVelocity,X : BPL .positiveXVelocity
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0008 : BNE .movingDirectionSamusFacing
    BRA .movingOppositeDirection

  .positiveXVelocity:
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0004 : BNE .movingDirectionSamusFacing
    BRA .movingOppositeDirection

  .movingDirectionSamusFacing:
    CLC
    RTS

  .movingOppositeDirection:
    SEC
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $D469: Enemy shot - enemy $DBBF (yard) ;;;
EnemyShot_Yard:
    LDX.W EnemyIndex
    LDA.W CollisionIndex : ASL : TAY
    LDA.W SamusProjectile_Types,Y : AND.W #$FF00 : CMP.W #$0300 : BEQ .normalShotAI
    CMP.W #$0500 : BNE .shot

  .normalShotAI:
    JSL CommonA3_NormalEnemyShotAI
    RTL

  .shot:
    LDA.L Yard.behavior,X : CMP.W #$0003 : BEQ .playSFX
    CMP.W #$0004 : BEQ .playSFX
    JSR ShootYardIntoAir

  .playSFX:
    LDA.W #$0070
    JSL QueueSound_Lib2_Max3
    RTL


;;; $D49F: Kick yard into air ;;;
KickYardIntoAir:
; Note the fixed point negation operation at $D4F6 is off by 1.0 when the low word is zero
    LDA.W #$0004 : STA.L Yard.behavior,X
    LDA.W #Function_Yard_Movement_Airborne : STA.W Yard.movementFunction,X
    LDA.W Yard.airborneFacingDirection,X : ASL #2 : TAY
    LDA.W .airbornePointers,Y : STA.W Enemy.instList,X
    LDA.W .hidingPointers,Y : STA.W Yard.hidingInstList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    LDA.W CameraXSubSpeed : STA.L Yard.airborneXSubVelocity,X
    LDA.W CameraXSpeed : STA.L Yard.airborneXVelocity,X
    CMP.W #$0010 : BCC +
    LDA.W #$000F

+   ASL #2 : TAY
    LDA.W .YSubVelocity,Y : STA.L Yard.airborneYSubVelocity,X
    LDA.W .YVelocity,Y : STA.L Yard.airborneYVelocity,X
    LDA.W PoseXDirection : BIT.W #$0004 : BEQ .return
    LDA.L Yard.airborneXSubVelocity,X : EOR.W #$FFFF : INC : STA.L Yard.airborneXSubVelocity,X
    LDA.L Yard.airborneXVelocity,X : EOR.W #$FFFF : INC : STA.L Yard.airborneXVelocity,X

  .return:
    RTS

  .airbornePointers:
    dw InstList_Yard_Airborne_FacingLeft_0

  .hidingPointers:
    dw InstList_Yard_Hidden_UpsideUp_MovingLeft
    dw InstList_Yard_Airborne_FacingRight_0
    dw InstList_Yard_Hidden_UpsideUp_MovingRight

; Y velocities. Indexed by X velocity
; Y subvelocity, Y velocity
  .YSubVelocity:
    dw $0000
  .YVelocity:
    dw       $FFFD, $A000,$FFFD, $4000,$FFFD, $0000,$FFFC
    dw $A000,$FFFC, $4000,$FFFC, $0000,$FFFB, $A000,$FFFB
    dw $4000,$FFFB, $0000,$FFFA, $A000,$FFFA, $4000,$FFFA
    dw $0000,$FFF9, $A000,$FFF9, $4000,$FFF9, $0000,$FFF8


;;; $D557: Shoot yard into air ;;;
ShootYardIntoAir:
    PHY
    LDA.W #$0005 : STA.L Yard.behavior,X
    LDA.W #Function_Yard_Movement_Airborne : STA.W Yard.movementFunction,X
    LDA.W Yard.airborneFacingDirection,X : ASL #2 : TAY
    LDA.W .airbornePointers,Y : STA.W Enemy.instList,X
    LDA.W .hidingPointers,Y : STA.W Yard.hidingInstList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    LDA.W #$FFFF : STA.L Yard.airborneYVelocity,X
    LDA.W PoseXDirection : AND.W #$00FF : CMP.W #$0004 : BNE .SamusFacingRight
    LDA.W #$FFFF : STA.L Yard.airborneXVelocity,X
    BRA .return

  .SamusFacingRight:
    LDA.W #$0001 : STA.L Yard.airborneXVelocity,X

  .return:
    PLY
    RTS

  .airbornePointers:
    dw InstList_Yard_Airborne_FacingLeft_0

  .hidingPointers:
    dw InstList_Yard_Hidden_UpsideUp_MovingLeft
    dw InstList_Yard_Airborne_FacingRight_0
    dw InstList_Yard_Hidden_UpsideUp_MovingRight


;;; $D5AC: Yard spritemaps ;;;
Spritemap_Yard_0:
    dw $0002
    %spritemapEntry(1, $43FB, $F6, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $43F5, $F8, 0, 0, 2, 0, $100)

Spritemap_Yard_1:
    dw $0002
    %spritemapEntry(1, $43FC, $F6, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $43F4, $F8, 0, 0, 2, 0, $102)

Spritemap_Yard_2:
    dw $0002
    %spritemapEntry(1, $43FB, $F5, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $43F5, $F8, 0, 0, 2, 0, $104)

Spritemap_Yard_3:
    dw $0002
    %spritemapEntry(1, $43F9, $F6, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $43F4, $FE, 0, 0, 2, 0, $106)

Spritemap_Yard_4:
    dw $0002
    %spritemapEntry(1, $43F2, $F6, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $43F0, $01, 0, 0, 2, 0, $108)

Spritemap_Yard_5:
    dw $0002
    %spritemapEntry(1, $43EE, $F8, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $43F0, $00, 0, 0, 2, 0, $108)

Spritemap_Yard_6:
    dw $0002
    %spritemapEntry(1, $43F6, $F5, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $43F8, $FB, 0, 0, 2, 0, $108)

Spritemap_Yard_7:
    dw $0002
    %spritemapEntry(1, $43F6, $F4, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $43F8, $FC, 0, 0, 2, 0, $10A)

Spritemap_Yard_8:
    dw $0002
    %spritemapEntry(1, $43F5, $F5, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $43F8, $FB, 0, 0, 2, 0, $10C)

Spritemap_Yard_9:
    dw $0002
    %spritemapEntry(1, $43F6, $F7, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $43FE, $FC, 0, 0, 2, 0, $10E)

Spritemap_Yard_A:
    dw $0002
    %spritemapEntry(1, $43F6, $FE, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $4201, $00, 1, 1, 2, 0, $100)

Spritemap_Yard_B:
    dw $0002
    %spritemapEntry(1, $43F8, $02, 1, 1, 2, 0, $120)
    %spritemapEntry(1, $4200, $00, 1, 1, 2, 0, $100)

Spritemap_Yard_C:
    dw $0002
    %spritemapEntry(1, $43F5, $FA, 1, 1, 2, 0, $120)
    %spritemapEntry(1, $43FB, $F8, 1, 1, 2, 0, $100)

Spritemap_Yard_D:
    dw $0002
    %spritemapEntry(1, $43F4, $FA, 1, 1, 2, 0, $120)
    %spritemapEntry(1, $43FC, $F8, 1, 1, 2, 0, $102)

Spritemap_Yard_E:
    dw $0002
    %spritemapEntry(1, $43F5, $FB, 1, 1, 2, 0, $120)
    %spritemapEntry(1, $43FB, $F8, 1, 1, 2, 0, $104)

Spritemap_Yard_F:
    dw $0002
    %spritemapEntry(1, $43F7, $FA, 1, 1, 2, 0, $120)
    %spritemapEntry(1, $43FC, $F2, 1, 1, 2, 0, $106)

Spritemap_Yard_10:
    dw $0002
    %spritemapEntry(1, $43FE, $FA, 1, 1, 2, 0, $122)
    %spritemapEntry(1, $4200, $EF, 1, 1, 2, 0, $108)

Spritemap_Yard_11:
    dw $0002
    %spritemapEntry(1, $4202, $F8, 1, 1, 2, 0, $124)
    %spritemapEntry(1, $4200, $F0, 1, 1, 2, 0, $108)

Spritemap_Yard_12:
    dw $0002
    %spritemapEntry(1, $43FA, $FB, 1, 1, 2, 0, $124)
    %spritemapEntry(1, $43F8, $F5, 1, 1, 2, 0, $108)

Spritemap_Yard_13:
    dw $0002
    %spritemapEntry(1, $43FA, $FC, 1, 1, 2, 0, $124)
    %spritemapEntry(1, $43F8, $F4, 1, 1, 2, 0, $10A)

Spritemap_Yard_14:
    dw $0002
    %spritemapEntry(1, $43FB, $FB, 1, 1, 2, 0, $124)
    %spritemapEntry(1, $43F8, $F5, 1, 1, 2, 0, $10C)

Spritemap_Yard_15:
    dw $0002
    %spritemapEntry(1, $43FA, $F9, 1, 1, 2, 0, $124)
    %spritemapEntry(1, $43F2, $F4, 1, 1, 2, 0, $10E)

Spritemap_Yard_16:
    dw $0002
    %spritemapEntry(1, $43FA, $F2, 1, 1, 2, 0, $126)
    %spritemapEntry(1, $43EF, $F0, 0, 0, 2, 0, $100)

Spritemap_Yard_17:
    dw $0002
    %spritemapEntry(1, $43F8, $EE, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 2, 0, $100)

Spritemap_Yard_18:
    dw $0002
    %spritemapEntry(1, $43FB, $F7, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $43F9, $F8, 0, 0, 2, 0, $100)

Spritemap_Yard_19:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 0, $122)

Spritemap_Yard_1A:
    dw $0002
    %spritemapEntry(1, $43F7, $F6, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 0, $108)

Spritemap_Yard_1B:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 0, $126)

Spritemap_Yard_1C:
    dw $0002
    %spritemapEntry(1, $43F6, $F9, 1, 1, 2, 0, $120)
    %spritemapEntry(1, $43F8, $F8, 1, 1, 2, 0, $100)

Spritemap_Yard_1D:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 1, 1, 2, 0, $122)

Spritemap_Yard_1E:
    dw $0002
    %spritemapEntry(1, $43F9, $FA, 0, 1, 2, 0, $124)
    %spritemapEntry(1, $43F8, $F8, 1, 1, 2, 0, $108)

Spritemap_Yard_1F:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 1, 1, 2, 0, $126)

Spritemap_Yard_20:
    dw $0002
    %spritemapEntry(1, $43F5, $F6, 0, 1, 2, 0, $120)
    %spritemapEntry(1, $43FB, $F8, 0, 1, 2, 0, $100)

Spritemap_Yard_21:
    dw $0002
    %spritemapEntry(1, $43F4, $F6, 0, 1, 2, 0, $120)
    %spritemapEntry(1, $43FC, $F8, 0, 1, 2, 0, $102)

Spritemap_Yard_22:
    dw $0002
    %spritemapEntry(1, $43F5, $F5, 0, 1, 2, 0, $120)
    %spritemapEntry(1, $43FB, $F8, 0, 1, 2, 0, $104)

Spritemap_Yard_23:
    dw $0002
    %spritemapEntry(1, $43F7, $F6, 0, 1, 2, 0, $120)
    %spritemapEntry(1, $43FC, $FE, 0, 1, 2, 0, $106)

Spritemap_Yard_24:
    dw $0002
    %spritemapEntry(1, $43FE, $F6, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $4200, $01, 0, 1, 2, 0, $108)

Spritemap_Yard_25:
    dw $0002
    %spritemapEntry(1, $4202, $F8, 0, 1, 2, 0, $124)
    %spritemapEntry(1, $4200, $00, 0, 1, 2, 0, $108)

Spritemap_Yard_26:
    dw $0002
    %spritemapEntry(1, $43FA, $F5, 0, 1, 2, 0, $124)
    %spritemapEntry(1, $43F8, $FB, 0, 1, 2, 0, $108)

Spritemap_Yard_27:
    dw $0002
    %spritemapEntry(1, $43FA, $F4, 0, 1, 2, 0, $124)
    %spritemapEntry(1, $43F8, $FC, 0, 1, 2, 0, $10A)

Spritemap_Yard_28:
    dw $0002
    %spritemapEntry(1, $43FB, $F5, 0, 1, 2, 0, $124)
    %spritemapEntry(1, $43F8, $FB, 0, 1, 2, 0, $10C)

Spritemap_Yard_29:
    dw $0002
    %spritemapEntry(1, $43FA, $F7, 0, 1, 2, 0, $124)
    %spritemapEntry(1, $43F2, $FC, 0, 1, 2, 0, $10E)

Spritemap_Yard_2A:
    dw $0002
    %spritemapEntry(1, $43FA, $FE, 0, 1, 2, 0, $126)
    %spritemapEntry(1, $43EF, $00, 1, 0, 2, 0, $100)

Spritemap_Yard_2B:
    dw $0002
    %spritemapEntry(1, $43F8, $02, 1, 0, 2, 0, $120)
    %spritemapEntry(1, $43F0, $00, 1, 0, 2, 0, $100)

Spritemap_Yard_2C:
    dw $0002
    %spritemapEntry(1, $43FB, $FA, 1, 0, 2, 0, $120)
    %spritemapEntry(1, $43F5, $F8, 1, 0, 2, 0, $100)

Spritemap_Yard_2D:
    dw $0002
    %spritemapEntry(1, $43FC, $FA, 1, 0, 2, 0, $120)
    %spritemapEntry(1, $43F4, $F8, 1, 0, 2, 0, $102)

Spritemap_Yard_2E:
    dw $0002
    %spritemapEntry(1, $43FB, $FB, 1, 0, 2, 0, $120)
    %spritemapEntry(1, $43F5, $F8, 1, 0, 2, 0, $104)

Spritemap_Yard_2F:
    dw $0002
    %spritemapEntry(1, $43F9, $FA, 1, 0, 2, 0, $120)
    %spritemapEntry(1, $43F4, $F2, 1, 0, 2, 0, $106)

Spritemap_Yard_30:
    dw $0002
    %spritemapEntry(1, $43F2, $FA, 1, 0, 2, 0, $122)
    %spritemapEntry(1, $43F0, $EF, 1, 0, 2, 0, $108)

Spritemap_Yard_31:
    dw $0002
    %spritemapEntry(1, $43EE, $F8, 1, 0, 2, 0, $124)
    %spritemapEntry(1, $43F0, $F0, 1, 0, 2, 0, $108)

Spritemap_Yard_32:
    dw $0002
    %spritemapEntry(1, $43F6, $FB, 1, 0, 2, 0, $124)
    %spritemapEntry(1, $43F8, $F5, 1, 0, 2, 0, $108)

Spritemap_Yard_33:
    dw $0002
    %spritemapEntry(1, $43F6, $FC, 1, 0, 2, 0, $124)
    %spritemapEntry(1, $43F8, $F4, 1, 0, 2, 0, $10A)

Spritemap_Yard_34:
    dw $0002
    %spritemapEntry(1, $43F5, $FB, 1, 0, 2, 0, $124)
    %spritemapEntry(1, $43F8, $F5, 1, 0, 2, 0, $10C)

Spritemap_Yard_35:
    dw $0002
    %spritemapEntry(1, $43F7, $F9, 1, 0, 2, 0, $124)
    %spritemapEntry(1, $43FF, $F4, 1, 0, 2, 0, $10E)

Spritemap_Yard_36:
    dw $0002
    %spritemapEntry(1, $43F6, $F2, 1, 0, 2, 0, $126)
    %spritemapEntry(1, $4201, $F0, 0, 1, 2, 0, $100)

Spritemap_Yard_37:
    dw $0002
    %spritemapEntry(1, $43F8, $EE, 0, 1, 2, 0, $120)
    %spritemapEntry(1, $4200, $F0, 0, 1, 2, 0, $100)

Spritemap_Yard_38:
    dw $0002
    %spritemapEntry(1, $43F5, $F7, 0, 1, 2, 0, $120)
    %spritemapEntry(1, $43F7, $F8, 0, 1, 2, 0, $100)

Spritemap_Yard_39:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 1, 2, 0, $122)

Spritemap_Yard_3A:
    dw $0002
    %spritemapEntry(1, $43F9, $F6, 0, 1, 2, 0, $124)
    %spritemapEntry(1, $43F8, $F8, 0, 1, 2, 0, $108)

Spritemap_Yard_3B:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 1, 2, 0, $126)

Spritemap_Yard_3C:
    dw $0002
    %spritemapEntry(1, $43FA, $F9, 1, 0, 2, 0, $120)
    %spritemapEntry(1, $43F8, $F8, 1, 0, 2, 0, $100)

Spritemap_Yard_3D:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 1, 0, 2, 0, $122)

Spritemap_Yard_3E:
    dw $0002
    %spritemapEntry(1, $43F7, $FA, 1, 0, 2, 0, $124)
    %spritemapEntry(1, $43F8, $F8, 1, 0, 2, 0, $108)

Spritemap_Yard_3F:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 1, 0, 2, 0, $126)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Yard_A3D884:
    dw $0002
    %spritemapEntry(1, $43FB, $F6, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $43F5, $F8, 0, 0, 2, 0, $100)
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_Yard_40:
    dw $0002
    %spritemapEntry(1, $43F5, $F8, 0, 0, 2, 0, $128)
    %spritemapEntry(1, $43FB, $F7, 0, 0, 2, 0, $120)

Spritemap_Yard_41:
    dw $0002
    %spritemapEntry(1, $43FA, $FA, 1, 1, 2, 0, $126)
    %spritemapEntry(1, $43F8, $F7, 1, 1, 2, 0, $108)

Spritemap_Yard_42:
    dw $0002
    %spritemapEntry(1, $43FA, $FA, 1, 1, 2, 0, $124)
    %spritemapEntry(1, $43F8, $F6, 1, 1, 2, 0, $108)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Yard_A3D8B4:
    dw $0002
    %spritemapEntry(1, $43FA, $FB, 1, 1, 2, 0, $124)
    %spritemapEntry(1, $43F8, $F5, 1, 1, 2, 0, $108)
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_Yard_43:
    dw $0002
    %spritemapEntry(1, $43F8, $F5, 1, 1, 2, 0, $12A)
    %spritemapEntry(1, $43F9, $FB, 1, 1, 2, 0, $124)

Spritemap_Yard_44:
    dw $0002
    %spritemapEntry(1, $43F6, $FA, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $43F9, $F8, 1, 1, 2, 0, $100)

Spritemap_Yard_45:
    dw $0002
    %spritemapEntry(1, $43F6, $FA, 1, 1, 2, 0, $120)
    %spritemapEntry(1, $43FA, $F8, 1, 1, 2, 0, $100)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Yard_A3D8E4:
    dw $0002
    %spritemapEntry(1, $43F5, $FA, 1, 1, 2, 0, $120)
    %spritemapEntry(1, $43FB, $F8, 1, 1, 2, 0, $100)
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_Yard_46:
    dw $0002
    %spritemapEntry(1, $43FB, $F8, 1, 1, 2, 0, $128)
    %spritemapEntry(1, $43F5, $F9, 1, 1, 2, 0, $120)

Spritemap_Yard_47:
    dw $0002
    %spritemapEntry(1, $43F6, $F6, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $43F8, $F9, 0, 0, 2, 0, $108)

Spritemap_Yard_48:
    dw $0002
    %spritemapEntry(1, $43F6, $F6, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $43F8, $FA, 0, 0, 2, 0, $108)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Yard_A3D914:
    dw $0002
    %spritemapEntry(1, $43F6, $F5, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $43F8, $FB, 0, 0, 2, 0, $108)
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_Yard_49:
    dw $0002
    %spritemapEntry(1, $43F8, $FB, 0, 0, 2, 0, $12A)
    %spritemapEntry(1, $43F7, $F5, 0, 0, 2, 0, $124)

Spritemap_Yard_4A:
    dw $0002
    %spritemapEntry(1, $43FA, $F6, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $43F7, $F8, 0, 0, 2, 0, $100)

Spritemap_Yard_4B:
    dw $0002
    %spritemapEntry(1, $43FB, $F6, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $43F7, $F8, 0, 0, 2, 0, $100)

Spritemap_Yard_4C:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 0, $122)

Spritemap_Yard_4D:
    dw $0002
    %spritemapEntry(1, $43F8, $F7, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $43F6, $F8, 0, 0, 2, 0, $100)

Spritemap_Yard_4E:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 1, 1, 2, 0, $126)

Spritemap_Yard_4F:
    dw $0002
    %spritemapEntry(1, $43F9, $F8, 1, 1, 2, 0, $124)
    %spritemapEntry(1, $43F8, $F6, 1, 1, 2, 0, $108)

Spritemap_Yard_50:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 1, 1, 2, 0, $122)

Spritemap_Yard_51:
    dw $0002
    %spritemapEntry(1, $43F8, $F9, 1, 1, 2, 0, $120)
    %spritemapEntry(1, $43FA, $F8, 1, 1, 2, 0, $100)

Spritemap_Yard_52:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 0, $126)

Spritemap_Yard_53:
    dw $0002
    %spritemapEntry(1, $43F7, $F8, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $43F8, $FA, 0, 0, 2, 0, $108)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Yard_A3D990:
    dw $0002
    %spritemapEntry(1, $43F5, $F6, 0, 1, 2, 0, $120)
    %spritemapEntry(1, $43FB, $F8, 0, 1, 2, 0, $100)
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_Yard_54:
    dw $0002
    %spritemapEntry(1, $43FB, $F8, 0, 1, 2, 0, $128)
    %spritemapEntry(1, $43F5, $F7, 0, 1, 2, 0, $120)

Spritemap_Yard_55:
    dw $0002
    %spritemapEntry(1, $43F6, $FA, 1, 0, 2, 0, $126)
    %spritemapEntry(1, $43F8, $F7, 1, 0, 2, 0, $108)

Spritemap_Yard_56:
    dw $0002
    %spritemapEntry(1, $43F6, $FA, 1, 0, 2, 0, $124)
    %spritemapEntry(1, $43F8, $F6, 1, 0, 2, 0, $108)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Yard_A3D9C0:
    dw $0002
    %spritemapEntry(1, $43F6, $FB, 1, 0, 2, 0, $124)
    %spritemapEntry(1, $43F8, $F5, 1, 0, 2, 0, $108)
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_Yard_57:
    dw $0002
    %spritemapEntry(1, $43F8, $F5, 1, 0, 2, 0, $12A)
    %spritemapEntry(1, $43F7, $FB, 1, 0, 2, 0, $124)

Spritemap_Yard_58:
    dw $0002
    %spritemapEntry(1, $43FA, $FA, 0, 1, 2, 0, $126)
    %spritemapEntry(1, $43F7, $F8, 1, 0, 2, 0, $100)

Spritemap_Yard_59:
    dw $0002
    %spritemapEntry(1, $43FA, $FA, 1, 0, 2, 0, $120)
    %spritemapEntry(1, $43F6, $F8, 1, 0, 2, 0, $100)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Yard_A3D9F0:
    dw $0002
    %spritemapEntry(1, $43FB, $FA, 1, 0, 2, 0, $120)
    %spritemapEntry(1, $43F5, $F8, 1, 0, 2, 0, $100)
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_Yard_5A:
    dw $0002
    %spritemapEntry(1, $43F5, $F8, 1, 0, 2, 0, $128)
    %spritemapEntry(1, $43FB, $F9, 1, 0, 2, 0, $120)

Spritemap_Yard_5B:
    dw $0002
    %spritemapEntry(1, $43FA, $F6, 0, 1, 2, 0, $126)
    %spritemapEntry(1, $43F8, $F9, 0, 1, 2, 0, $108)

Spritemap_Yard_5C:
    dw $0002
    %spritemapEntry(1, $43FA, $F6, 0, 1, 2, 0, $124)
    %spritemapEntry(1, $43F8, $FA, 0, 1, 2, 0, $108)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Yard_A3DA20:
    dw $0002
    %spritemapEntry(1, $43FA, $F5, 0, 1, 2, 0, $124)
    %spritemapEntry(1, $43F8, $FB, 0, 1, 2, 0, $108)
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_Yard_5D:
    dw $0002
    %spritemapEntry(1, $43F8, $FB, 0, 1, 2, 0, $12A)
    %spritemapEntry(1, $43F9, $F5, 0, 1, 2, 0, $124)

Spritemap_Yard_5E:
    dw $0002
    %spritemapEntry(1, $43F6, $F6, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $43F9, $F8, 0, 1, 2, 0, $100)

Spritemap_Yard_5F:
    dw $0002
    %spritemapEntry(1, $43F5, $F6, 0, 1, 2, 0, $120)
    %spritemapEntry(1, $43F9, $F8, 0, 1, 2, 0, $100)

Spritemap_Yard_60:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 1, 2, 0, $122)

Spritemap_Yard_61:
    dw $0002
    %spritemapEntry(1, $43F8, $F7, 0, 1, 2, 0, $120)
    %spritemapEntry(1, $43FA, $F8, 0, 1, 2, 0, $100)

Spritemap_Yard_62:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 1, 0, 2, 0, $126)

Spritemap_Yard_63:
    dw $0002
    %spritemapEntry(1, $43F7, $F8, 1, 0, 2, 0, $124)
    %spritemapEntry(1, $43F8, $F6, 1, 0, 2, 0, $108)

Spritemap_Yard_64:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 1, 0, 2, 0, $122)

Spritemap_Yard_65:
    dw $0002
    %spritemapEntry(1, $43F8, $F9, 1, 0, 2, 0, $120)
    %spritemapEntry(1, $43F6, $F8, 1, 0, 2, 0, $100)

Spritemap_Yard_66:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 1, 2, 0, $126)

Spritemap_Yard_67:
    dw $0002
    %spritemapEntry(1, $43F9, $F8, 0, 1, 2, 0, $124)
    %spritemapEntry(1, $43F8, $FA, 0, 1, 2, 0, $108)


;;; $DA9C: Palette - enemy $DBFF (reflec) ;;;
Palette_Reflec:
    dw $3800,$7FBD,$5EB5,$1884,$0800,$777B,$5EB5,$45EF
    dw $2D29,$241F,$1C17,$142F,$0C47,$06E1,$6BF5,$05A1


;;; $DABC: Reflec palette cycle colours ;;;
ReflecPaletteCycleColors:
    dw $241F,$1C17,$142F,$0C47
    dw $211F,$18D8,$10B1,$086A
    dw $221F,$1999,$1113,$08AD
    dw $1EFF,$163A,$0D95,$04D0
    dw $1BFF,$12FB,$09F7,$00F3
    dw $1BFF,$12FB,$09F7,$00F3
    dw $1EFF,$163A,$0D95,$04D0
    dw $221F,$1999,$1113,$08AD
    dw $211F,$18D8,$10B1,$086A
    dw $241F,$1C17,$142F,$0C47


;;; $DB0C: Enemy graphics drawn hook - reflec - periodically cycle between palettes ;;;
EnemyGraphicsDrawnHook_Reflec_PeriodicallyCyclePalettes:
    LDA.W DoorTransitionFlagEnemiesPause : BNE .return
    LDA.W EnemyPaletteCycle_Timer : DEC : STA.W EnemyPaletteCycle_Timer : BNE .return
    LDA.W #$0010 : STA.W EnemyPaletteCycle_Timer
    LDA.W EnemyPaletteCycle_PaletteIndex : TAX
    LDA.W EnemyPaletteCycle_ColorSetIndex : ASL #3 : TAY
    LDA.W #$0004 : STA.W RemainingEnemySpritemapEntries

  .loop:
    LDA.W ReflecPaletteCycleColors,Y : STA.L Palettes_SpriteP0+$12,X
    INY #2
    INX #2
    DEC.W RemainingEnemySpritemapEntries : BNE .loop
    LDA.W EnemyPaletteCycle_ColorSetIndex : INC : AND.W #$0007 : STA.W EnemyPaletteCycle_ColorSetIndex

  .return:
    RTL


;;; $DB4C: Instruction list - facing left ;;;
InstList_Reflec_FacingLeft:
    dw Instruction_Reflec_Param2InY,$0000
    dw $0040,Spritemap_Reflec_FacingLeft
    dw Instruction_Common_GotoY
    dw InstList_Reflec_FacingLeft


;;; $DB58: Instruction list - facing up-left ;;;
InstList_Reflec_FacingUpLeft:
    dw Instruction_Reflec_Param2InY,$0001
    dw $0040,Spritemap_Reflec_FacingUpLeft
    dw Instruction_Common_GotoY
    dw InstList_Reflec_FacingUpLeft


;;; $DB64: Instruction list - facing up ;;;
InstList_Reflec_FacingUp:
    dw Instruction_Reflec_Param2InY,$0002
    dw $0040,Spritemap_Reflec_FacingUp
    dw Instruction_Common_Sleep


;;; $DB6E: Instruction list - facing up-right ;;;
InstList_Reflec_FacingUpRight:
    dw Instruction_Reflec_Param2InY,$0003
    dw $0040,Spritemap_Reflec_FacingUpRight
    dw Instruction_Common_Sleep


;;; $DB78: Instruction list - facing right ;;;
InstList_Reflec_FacingRight:
    dw Instruction_Reflec_Param2InY,$0000
    dw $0040,Spritemap_Reflec_FacingRight
    dw Instruction_Common_Sleep


;;; $DB82: Instruction list - facing down-right ;;;
InstList_Reflec_FacingDownRight:
    dw Instruction_Reflec_Param2InY,$0001
    dw $0040,Spritemap_Reflec_FacingDownRight
    dw Instruction_Common_Sleep


;;; $DB8C: Instruction list - facing down ;;;
InstList_Reflec_FacingDown:
    dw Instruction_Reflec_Param2InY,$0002
    dw $0040,Spritemap_Reflec_FacingDown
    dw Instruction_Common_Sleep


;;; $DB96: Instruction list - facing down-left ;;;
InstList_Reflec_FacingDownLeft:
    dw Instruction_Reflec_Param2InY,$0003
    dw $0040,Spritemap_Reflec_FacingDownLeft
    dw Instruction_Common_Sleep


;;; $DBA0: Instruction list - health reached zero - facing left ;;;
InstList_Reflec_ZeroHealth_FacingLeft:
    dw Instruction_Reflec_Param2InY,$0000
    dw $0001,Spritemap_Reflec_FacingLeft
    dw Instruction_Common_Sleep


;;; $DBAA: Instruction list - health reached zero - facing up-left ;;;
InstList_Reflec_ZeroHealth_FacingUpLeft:
    dw Instruction_Reflec_Param2InY,$0001
    dw $0001,Spritemap_Reflec_FacingUpLeft
    dw Instruction_Common_Sleep


;;; $DBB4: Instruction list - health reached zero - facing up ;;;
InstList_Reflec_ZeroHealth_FacingUp:
    dw Instruction_Reflec_Param2InY,$0002
    dw $0001,Spritemap_Reflec_FacingUp
    dw Instruction_Common_Sleep


;;; $DBBE: Instruction list - health reached zero - facing up-right ;;;
InstList_Reflec_ZeroHealth_FacingUpRight:
    dw Instruction_Reflec_Param2InY,$0003
    dw $0001,Spritemap_Reflec_FacingUpRight
    dw Instruction_Common_Sleep


;;; $DBC8: Instruction - enemy reflection axis = [[Y]] ;;;
Instruction_Reflec_Param2InY:
    PHY
    LDA.W $0000,Y : STA.W Reflect.reflectionAxis,X
    PLY
    INY #2
    RTL


;;; $DBD3: Initialisation AI - enemy $DBFF (reflec) ;;;
InitAI_Reflec:
    LDX.W EnemyIndex
    LDA.W Enemy.properties,X : ORA.W #$1000 : STA.W Enemy.properties,X
    LDA.W Enemy.init0,X : ASL : TAY
    LDA.W .pointers,Y : STA.W Enemy.instList,X
    LDA.W #EnemyGraphicsDrawnHook_Reflec_PeriodicallyCyclePalettes : STA.W EnemyGraphicsDrawnHook
    LDA.W #EnemyGraphicsDrawnHook_Reflec_PeriodicallyCyclePalettes>>16 : STA.W EnemyGraphicsDrawnHook+2
    LDA.W Enemy.palette,X : ASL #4 : AND.W #$FF00 : XBA : STA.W EnemyPaletteCycle_PaletteIndex
    LDA.W #$0010 : STA.W EnemyPaletteCycle_Timer
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


;;; $DC1B: RTL. Main AI - enemy $DBFF (reflec) ;;;
RTL_A3DC1B:
    RTL


;;; $DC1C: Enemy shot - enemy $DBFF (reflec) ;;;
EnemyShot_Reflec:
    LDX.W EnemyIndex
    LDA.W CollisionIndex : ASL : TAY
    LDA.W #$000A : STA.W Enemy.invincibilityTimer,X
    LDA.W Reflect.reflectionAxis,X : ASL #5 : STA.W Temp_Unknown0E32
    LDA.W SamusProjectile_Directions,Y : AND.W #$000F : ASL
    CLC : ADC.W Temp_Unknown0E32 : TAX
    STA.W Temp_Unknown0E32
    LDA.W .reflectedDirectionTable,X : CMP.W #$8000 : BEQ +
    LDA.W .reflectedDirectionTable,X : BMI .executeFunction
    BRA .skipFunction

  .executeFunction:
    JSR.W (.reflectedDirectionTable_offsetNegatives,X)
    LDX.W Temp_Unknown0E32
    LDA.W .reflectedDirectionTable,X : EOR.W #$FFFF : INC

  .skipFunction:
    STA.W SamusProjectile_Directions,Y
    LDA.W SamusProjectile_Types,Y : AND.W #$7FFF : STA.W SamusProjectile_Types,Y
    STY.B DP_Temp14
    JSL ProjectileReflection
    LDA.W #$0057
    JSL QueueSound_Lib2_Max6
    RTL

+   LDA.W SamusProjectile_Directions,Y : ORA.W #$0010 : STA.W SamusProjectile_Directions,Y
    LDA.W Enemy.health,X : BEQ .return
    JSL CommonA3_NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic
    LDA.W Enemy.health,X : BNE .return
    LDA.W Reflect.reflectionAxis,X : ASL : TAY
    LDA.W .pointers,Y : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X

  .return:
    RTL

  .pointers:
; Instruction lists for when health reaches zero...
    dw InstList_Reflec_ZeroHealth_FacingLeft
    dw InstList_Reflec_ZeroHealth_FacingUpLeft
    dw InstList_Reflec_ZeroHealth_FacingUp
    dw InstList_Reflec_ZeroHealth_FacingUpRight

  .reflectedDirectionTable:
; Reflected direction table
; 8000h = no reflected projectile
; Negative = reflection projectile position is offset
;        _______________________________________________________ Up, facing right
;       |      _________________________________________________ Up-right
;       |     |      ___________________________________________ Right
;       |     |     |      _____________________________________ Down-right
;       |     |     |     |      _______________________________ Down, facing right
;       |     |     |     |     |      _________________________ Down, facing left
;       |     |     |     |     |     |      ___________________ Down-left
;       |     |     |     |     |     |     |      _____________ Left
;       |     |     |     |     |     |     |     |      _______ Up-left
;       |     |     |     |     |     |     |     |     |      _ Up, facing left
;       |     |     |     |     |     |     |     |     |     |
    dw $8000,$FFF8,$0007,$FFFA,$8000,$8000,$FFFD,$0002,$FFFF,$8000, $0000,$0000,$0000,$0000,$0000,$0000 ; 0: Vertical
    dw $FFFE,$8000,$FFF7,$0008,$FFF9,$FFF9,$8000,$FFFB,$0003,$FFFE, $0000,$0000,$0000,$0000,$0000,$0000 ; 1: Up-right diagonal
    dw $0004,$FFFD,$8000,$FFFF,$0000,$0009,$FFF8,$8000,$FFFA,$0005, $0000,$0000,$0000,$0000,$0000,$0000 ; 2: Horizontal
    dw $FFF9,$0006,$FFFC,$8000,$FFFE,$FFFE,$0001,$FFF7,$8000,$FFF9, $0000,$0000,$0000,$0000,$0000,$0000 ; 3: Down-right diagonal

  .reflectedDirectionTable_offsetNegatives:
; Offset function for negative entries of above table
;        _______________________________________________________ Up, facing right
;       |      _________________________________________________ Up-right
;       |     |      ___________________________________________ Right
;       |     |     |      _____________________________________ Down-right
;       |     |     |     |      _______________________________ Down, facing right
;       |     |     |     |     |      _________________________ Down, facing left
;       |     |     |     |     |     |      ___________________ Down-left
;       |     |     |     |     |     |     |      _____________ Left
;       |     |     |     |     |     |     |     |      _______ Up-left
;       |     |     |     |     |     |     |     |     |      _ Up, facing left
;       |     |     |     |     |     |     |     |     |     |
    dw $0000,$DDAE,$0000,$DDAE,$0000,$0000,$DDCF,$0000,$DDCF,$0000, $0000,$0000,$0000,$0000,$0000,$0000 ; 0: Vertical
    dw $DDF0,$0000,$DE0D,$0000,$DE2A,$DE2A,$0000,$DE47,$0000,$DDF0, $0000,$0000,$0000,$0000,$0000,$0000 ; 1: Up-right diagonal
    dw $0000,$DE64,$0000,$DE85,$0000,$0000,$DE85,$0000,$DE64,$0000, $0000,$0000,$0000,$0000,$0000,$0000 ; 2: Horizontal
    dw $DEA6,$0000,$DEC3,$0000,$DEE0,$DEE0,$0000,$DEFD,$0000,$DEA6, $0000,$0000,$0000,$0000,$0000,$0000 ; 3: Down-right diagonal


;;; $DDAE: Reflection offset function - vertical - up-right / down-right ;;;
Function_Reflec_ReflectionOffset_Vertical_UpRight_DownRight:
    LDX.W EnemyIndex
    LDA.W Enemy.XPosition,X : SEC : SBC.W #$0008 : STA.W Temp_Unknown0E36
    LDA.W SamusProjectile_XPositions,Y : CLC : ADC.W SamusProjectile_XRadii,Y : CMP.W Temp_Unknown0E36 : BPL .return1
    LDA.W #$0000
    RTS

  .return1:
    LDA.W #$0001
    RTS


;;; $DDCF: Reflection offset function - vertical - up-left / down-left ;;;
Function_Reflec_ReflectionOffset_Vertical_UpLeft_DownLeft:
    LDX.W EnemyIndex
    LDA.W Enemy.XPosition,X : CLC : ADC.W #$0008 : STA.W Temp_Unknown0E36
    LDA.W SamusProjectile_XPositions,Y : SEC : SBC.W SamusProjectile_XRadii,Y : CMP.W Temp_Unknown0E36 : BMI .return1
    LDA.W #$0000
    RTS

  .return1:
    LDA.W #$0001
    RTS


;;; $DDF0: Reflection offset function - up-right diagonal - up ;;;
Function_Reflec_ReflectionOffset_UpRightDiagonal_Up:
    LDX.W EnemyIndex
    LDA.W Enemy.XPosition,X : STA.W Temp_Unknown0E36
    LDA.W SamusProjectile_XPositions,Y : CLC : ADC.W SamusProjectile_XRadii,Y : CMP.W Temp_Unknown0E36 : BMI .return1
    LDA.W #$0000
    RTS

  .return1:
    LDA.W #$0001
    RTS


;;; $DE0D: Reflection offset function - up-right diagonal - right ;;;
Function_Reflec_ReflectionOffset_UpRightDiagonal_Right:
    LDX.W EnemyIndex
    LDA.W Enemy.YPosition,X : STA.W Temp_Unknown0E36
    LDA.W SamusProjectile_YPositions,Y : SEC : SBC.W SamusProjectile_YRadii,Y : CMP.W Temp_Unknown0E36 : BPL .return1
    LDA.W #$0000
    RTS

  .return1:
    LDA.W #$0001
    RTS


;;; $DE2A: Reflection offset function - up-right diagonal - down ;;;
Function_Reflec_ReflectionOffset_UpRightDiagonal_Down:
    LDX.W EnemyIndex
    LDA.W Enemy.XPosition,X : STA.W Temp_Unknown0E36
    LDA.W SamusProjectile_XPositions,Y : SEC : SBC.W SamusProjectile_XRadii,Y : CMP.W Temp_Unknown0E36 : BPL .return1
    LDA.W #$0000
    RTS

  .return1:
    LDA.W #$0001
    RTS


;;; $DE47: Reflection offset function - up-right diagonal - left ;;;
Function_Reflec_ReflectionOffset_UpRightDiagonal_Left:
    LDX.W EnemyIndex
    LDA.W Enemy.YPosition,X : STA.W Temp_Unknown0E36
    LDA.W SamusProjectile_YPositions,Y : CLC : ADC.W SamusProjectile_YRadii,Y : CMP.W Temp_Unknown0E36 : BMI .return1
    LDA.W #$0000
    RTS

  .return1:
    LDA.W #$0001
    RTS


;;; $DE64: Reflection offset function - horizontal - up-right / up-left ;;;
Function_Reflec_ReflectionOffset_Horizontal_UpRight_UpLeft:
    LDX.W EnemyIndex
    LDA.W Enemy.YPosition,X : CLC : ADC.W #$0008 : STA.W Temp_Unknown0E36
    LDA.W SamusProjectile_YPositions,Y : SEC : SBC.W SamusProjectile_YRadii,Y : CMP.W Temp_Unknown0E36 : BMI .return1
    LDA.W #$0000
    RTS

  .return1:
    LDA.W #$0001
    RTS


;;; $DE85: Reflection offset function - horizontal - down-right / down-left ;;;
Func_Reflec_ReflectionOffset_Horizontal_DownRight_DownLeft:
    LDX.W EnemyIndex
    LDA.W Enemy.YPosition,X : SEC : SBC.W #$0008 : STA.W Temp_Unknown0E36
    LDA.W SamusProjectile_YPositions,Y : CLC : ADC.W SamusProjectile_YRadii,Y : CMP.W Temp_Unknown0E36 : BPL .return1
    LDA.W #$0000
    RTS

  .return1:
    LDA.W #$0001
    RTS


;;; $DEA6: Reflection offset function - down-right diagonal - up ;;;
Function_Reflec_ReflectionOffset_DownRightDiagonal_Up:
    LDX.W EnemyIndex
    LDA.W Enemy.XPosition,X : STA.W Temp_Unknown0E36
    LDA.W SamusProjectile_XPositions,Y : SEC : SBC.W SamusProjectile_XRadii,Y : CMP.W Temp_Unknown0E36 : BMI .return1
    LDA.W #$0000
    RTS

  .return1:
    LDA.W #$0001
    RTS


;;; $DEC3: Reflection offset function - down-right diagonal - right ;;;
Function_Reflec_ReflectionOffset_DownRightDiagonal_Right:
    LDX.W EnemyIndex
    LDA.W Enemy.YPosition,X : STA.W Temp_Unknown0E36
    LDA.W SamusProjectile_YPositions,Y : CLC : ADC.W SamusProjectile_YRadii,Y : CMP.W Temp_Unknown0E36 : BPL .return0
    LDA.W #$0001
    RTS

  .return0:
    LDA.W #$0000
    RTS


;;; $DEE0: Reflection offset function - down-right diagonal - down ;;;
Function_Reflec_ReflectionOffset_DownRightDiagonal_Down:
    LDX.W EnemyIndex
    LDA.W Enemy.XPosition,X : STA.W Temp_Unknown0E36
    LDA.W SamusProjectile_XPositions,Y : SEC : SBC.W SamusProjectile_XRadii,Y : CMP.W Temp_Unknown0E36 : BMI .return1
    LDA.W #$0000
    RTS

  .return1:
    LDA.W #$0001
    RTS


;;; $DEFD: Reflection offset function - down-right diagonal - left ;;;
Function_Reflec_ReflectionOffset_DownRightDiagonal_Left:
    LDX.W EnemyIndex
    LDA.W Enemy.YPosition,X : STA.W Temp_Unknown0E36
    LDA.W SamusProjectile_YPositions,Y : SEC : SBC.W SamusProjectile_YRadii,Y : CMP.W Temp_Unknown0E36 : BPL .return1
    LDA.W #$0000
    RTS

  .return1:
    LDA.W #$0001
    RTS


;;; $DF1A: Reflec spritemaps ;;;
Spritemap_Reflec_FacingLeft:
    dw $0003
    %spritemapEntry(1, $1F0, $00, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 2, 0, $10D)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $100)

Spritemap_Reflec_FacingUpLeft:
    dw $0003
    %spritemapEntry(1, $1EA, $F3, 0, 0, 2, 0, $11A)
    %spritemapEntry(1, $1F2, $EB, 0, 0, 2, 0, $10B)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $102)

Spritemap_Reflec_FacingUp:
    dw $0003
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $00, $F1, 1, 0, 2, 0, $118)
    %spritemapEntry(1, $1F0, $F1, 0, 0, 2, 0, $108)

Spritemap_Reflec_FacingUpRight:
    dw $0003
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $06, $F3, 0, 1, 2, 0, $11A)
    %spritemapEntry(1, $1FE, $EB, 0, 1, 2, 0, $10B)

Spritemap_Reflec_FacingRight:
    dw $0003
    %spritemapEntry(1, $00, $00, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $00, $F0, 0, 1, 2, 0, $10D)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $100)

Spritemap_Reflec_FacingDownRight:
    dw $0003
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $06, $FD, 1, 1, 2, 0, $11A)
    %spritemapEntry(1, $1FE, $05, 1, 1, 2, 0, $10B)

Spritemap_Reflec_FacingDown:
    dw $0003
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $00, $FF, 0, 0, 2, 0, $118)
    %spritemapEntry(1, $1F0, $FF, 1, 0, 2, 0, $108)

Spritemap_Reflec_FacingDownLeft:
    dw $0003
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $1EA, $FD, 1, 0, 2, 0, $11A)
    %spritemapEntry(1, $1F2, $05, 1, 0, 2, 0, $10B)


;;; $DFA2: Palette - enemy $DC3F (Wrecked Ship orange zoomer) ;;;
Palette_HZoomer:
    dw $3800,$7F5A,$3BE0,$2680,$0920,$4F5A,$36B5,$2610
    dw $1DCE,$5294,$39CE,$2108,$1084,$033B,$0216,$0113


;;; $DFC2: Instruction - enemy function = [[Y]] ;;;
Instruction_HZoomer_FunctionInY:
    LDA.W $0000,Y : STA.W Crawler.function,X
    INY #2
    RTL


;;; $DFCB: Instruction list - Wrecked Ship orange zoomer - upside right ;;;
InstList_HZoomer_UpsideRight_0:
    dw Instruction_HZoomer_FunctionInY
    dw Function_HZoomer_CrawlingVertically

InstList_HZoomer_UpsideRight_1:
    dw $0003,Spritemap_Crawlers_UpsideRight_0
    dw $0003,Spritemap_Crawlers_UpsideRight_1
    dw $0003,Spritemap_Crawlers_UpsideRight_2
    dw $0003,Spritemap_Crawlers_UpsideRight_3
    dw $0003,Spritemap_Crawlers_UpsideRight_4
    dw Instruction_Common_GotoY
    dw InstList_HZoomer_UpsideRight_1


;;; $DFE7: Instruction list - Wrecked Ship orange zoomer - upside left ;;;
InstList_HZoomer_UpsideLeft_0:
    dw Instruction_HZoomer_FunctionInY
    dw Function_HZoomer_CrawlingVertically

InstList_HZoomer_UpsideLeft_1:
    dw $0003,Spritemap_Crawlers_UpsideLeft_0
    dw $0003,Spritemap_Crawlers_UpsideLeft_1
    dw $0003,Spritemap_Crawlers_UpsideLeft_2
    dw $0003,Spritemap_Crawlers_UpsideLeft_3
    dw $0003,Spritemap_Crawlers_UpsideLeft_4
    dw Instruction_Common_GotoY
    dw InstList_HZoomer_UpsideLeft_1


;;; $E003: Instruction list - Wrecked Ship orange zoomer - upside down ;;;
InstList_HZoomer_UpsideDown_0:
    dw Instruction_HZoomer_FunctionInY
    dw Function_HZoomer_CrawlingHorizontally

InstList_HZoomer_UpsideDown_1:
    dw $0003,Spritemap_Crawlers_UpsideDown_FacingLeft_0
    dw $0003,Spritemap_Crawlers_UpsideDown_FacingLeft_1
    dw $0003,Spritemap_Crawlers_UpsideDown_FacingLeft_2
    dw $0003,Spritemap_Crawlers_UpsideDown_FacingLeft_3
    dw $0003,Spritemap_Crawlers_UpsideDown_FacingLeft_4
    dw Instruction_Common_GotoY
    dw InstList_HZoomer_UpsideDown_1


;;; $E01F: Instruction list - Wrecked Ship orange zoomer - upside up ;;;
InstList_HZoomer_UpsideUp_0:
    dw Instruction_HZoomer_FunctionInY
    dw Function_HZoomer_CrawlingHorizontally

InstList_HZoomer_UpsideUp_1:
    dw $0003,Spritemap_Crawlers_UpsideUp_FacingRight_0
    dw $0003,Spritemap_Crawlers_UpsideUp_FacingRight_1
    dw $0003,Spritemap_Crawlers_UpsideUp_FacingRight_2
    dw $0003,Spritemap_Crawlers_UpsideUp_FacingRight_3
    dw $0003,Spritemap_Crawlers_UpsideUp_FacingRight_4
    dw Instruction_Common_GotoY
    dw InstList_HZoomer_UpsideUp_1


;;; $E03B: Wrecked Ship orange zoomer initial instruction list pointers ;;;
HZoomerInitialInstListPointers:
; Indexed by [enemy initialisation parameter] * 2
    dw InstList_HZoomer_UpsideRight_0                                    ; 0: Upside right
    dw InstList_HZoomer_UpsideLeft_0                                     ; 1: Upside left
    dw InstList_HZoomer_UpsideDown_0                                     ; 2: Upside down
    dw InstList_HZoomer_UpsideUp_0                                       ; 3: Upside up


;;; $E043: Initialisation AI - enemy $DC3F (Wrecked Ship orange zoomer) ;;;
InitAI_HZoomer:
; Not sure why the devs didn't use the common init AI $E67A like the other creepy crawlies
    LDX.W EnemyIndex
    LDA.W Enemy.instList,X : AND.W #$0003 : ASL : TAY
    LDA.W HZoomerInitialInstListPointers,Y : STA.W Enemy.instList,X
    LDA.W #.return : STA.W Crawler.function,X
    LDA.W Enemy.init0,X : ASL : TAY
    LDA.W CrawlersSpeedTable,Y : STA.W Crawler.XVelocity,X : STA.W Crawler.YVelocity,X
    LDA.W Enemy.properties,X : AND.W #$0003 : BNE +
    LDA.W Crawler.XVelocity,X : EOR.W #$FFFF : INC : STA.W Crawler.XVelocity,X
    RTL

+   CMP.W #$0002 : BNE .return
    LDA.W Crawler.YVelocity,X : EOR.W #$FFFF : INC : STA.W Crawler.YVelocity,X

  .return:
    RTL


;;; $E08B: Main AI - enemy $DC3F (Wrecked Ship orange zoomer) ;;;
MainAI_HZoomer:
    LDX.W EnemyIndex
    JMP.W (Crawler.function,X)


;;; $E091: Wrecked Ship orange zoomer function - crawling vertically ;;;
Function_HZoomer_CrawlingVertically:
    LDA.W EarthquakeTimer : CMP.W #$001E : BNE .noQuake
    LDA.W EarthquakeType : CMP.W #$0014 : BNE .noQuake
    LDA.W Crawler.function,X : STA.L Crawler.nonFallingFunction,X
    LDA.W #Function_Crawlers_Falling : STA.W Crawler.function,X

  .noQuake:
    STZ.B DP_Temp12 : STZ.B DP_Temp14
    LDA.W Crawler.XVelocity,X : BPL +
    DEC.B DP_Temp14

+   STA.B DP_Temp13
    LDA.B DP_Temp14 : BPL .inc
    DEC
    BRA .moveRight

  .inc:
    INC

  .moveRight:
    STA.B DP_Temp14
    JSL MoveEnemyRightBy_14_12_ProcessSlopes
    BCC .outsideTurn
    LDA.W #$0000 : STA.L Crawler.consecutiveTurnCounter,X
    JSL AlignEnemyYPositionWIthNonSquareSlope
    STZ.B DP_Temp12 : STZ.B DP_Temp14
    LDA.W Crawler.YVelocity,X : BPL .moveDown
    DEC.B DP_Temp14

  .moveDown:
    STA.B DP_Temp13
    JSL MoveEnemyDownBy_14_12
    BCS .insideTurn
    LDX.W EnemyIndex
    LDA.W SamusYPosition : SEC : SBC.W Enemy.YPosition,X : BPL .SamusRightOfZHoomer
    LDA.W Crawler.YVelocity,X : BMI .return
    BRA .negateY

  .SamusRightOfZHoomer:
    LDA.W Crawler.YVelocity,X : BPL .return

  .negateY:
    EOR.W #$FFFF : INC

  .return:
    STA.W Crawler.YVelocity,X
    RTL

  .insideTurn:
    LDA.W Crawler.XVelocity,X : EOR.W #$FFFF : INC : STA.W Crawler.XVelocity,X
    LDY.W #InstList_HZoomer_UpsideUp_0 : LDY.W #InstList_HZoomer_UpsideUp_0 ; >.<
    LDA.W Crawler.YVelocity,X : BPL ..keepUp
    LDY.W #InstList_HZoomer_UpsideDown_0

  ..keepUp:
    TYA : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    RTL

  .outsideTurn:
    LDA.L Crawler.consecutiveTurnCounter,X : INC : STA.L Crawler.consecutiveTurnCounter,X : CMP.W #$0004 : BMI .notFalling
    LDA.W Crawler.function,X : STA.L Crawler.nonFallingFunction,X
    LDA.W #Function_Crawlers_Falling : STA.W Crawler.function,X
    RTL

  .notFalling:
    LDA.W Crawler.YVelocity,X : EOR.W #$FFFF : INC : STA.W Crawler.YVelocity,X
    LDY.W #InstList_HZoomer_UpsideUp_0
    LDA.W Crawler.YVelocity,X : BPL .keepUp
    LDY.W #InstList_HZoomer_UpsideDown_0

  .keepUp:
    TYA : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    RTL


;;; $E168: Wrecked Ship orange zoomer function - crawling horizontally ;;;
Function_HZoomer_CrawlingHorizontally:
    LDA.W EarthquakeTimer : CMP.W #$001E : BNE .noQuake
    LDA.W EarthquakeType : CMP.W #$0014 : BNE .noQuake
    LDA.W Crawler.function,X : STA.L Crawler.nonFallingFunction,X
    LDA.W #Function_Crawlers_Falling : STA.W Crawler.function,X

  .noQuake:
    STZ.B DP_Temp12 : STZ.B DP_Temp14
    LDA.W Crawler.YVelocity,X : BPL +
    DEC.B DP_Temp14

+   STA.B DP_Temp13
    LDA.B DP_Temp14 : BPL .inc
    DEC
    BRA .moveDown

  .inc:
    INC

  .moveDown:
    STA.B DP_Temp14
    JSL MoveEnemyDownBy_14_12
    BCC .outsideTurn
    LDA.W #$0000 : STA.L Crawler.consecutiveTurnCounter,X
    STZ.B DP_Temp12 : STZ.B DP_Temp14
    LDA.W Crawler.XVelocity,X : BPL .moveRight
    DEC.B DP_Temp14

  .moveRight:
    STA.B DP_Temp13
    JSL MoveEnemyRightBy_14_12_ProcessSlopes
    BCS .insideTurn
    JSL AlignEnemyYPositionWIthNonSquareSlope
    LDX.W EnemyIndex
    LDA.W SamusXPosition : SEC : SBC.W Enemy.XPosition,X : BPL .SamusToTheRight
    LDA.W Crawler.XVelocity,X : BMI .return
    BRA .negate

  .SamusToTheRight:
    LDA.W Crawler.XVelocity,X : BPL .return

  .negate:
    EOR.W #$FFFF : INC

  .return:
    STA.W Crawler.XVelocity,X
    RTL

  .insideTurn:
    LDA.W Crawler.YVelocity,X : EOR.W #$FFFF : INC : STA.W Crawler.YVelocity,X
    LDY.W #InstList_HZoomer_UpsideLeft_0
    LDA.W Crawler.XVelocity,X : BPL .keepLeft
    LDY.W #InstList_HZoomer_UpsideRight_0

  .keepLeft:
    TYA : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    RTL

  .outsideTurn:
    LDA.L Crawler.consecutiveTurnCounter,X : INC : STA.L Crawler.consecutiveTurnCounter,X : CMP.W #$0004 : BMI .notFalling
    LDA.W Crawler.function,X : STA.L Crawler.nonFallingFunction,X
    LDA.W #Function_Crawlers_Falling : STA.W Crawler.function,X
    RTL

  .notFalling:
    LDA.W Crawler.XVelocity,X : EOR.W #$FFFF : INC : STA.W Crawler.XVelocity,X
    LDY.W #InstList_HZoomer_UpsideLeft_0
    LDA.W Crawler.XVelocity,X : BPL ..keepLeft
    LDY.W #InstList_HZoomer_UpsideRight_0

  ..keepLeft:
    TYA : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    RTL


;;; $E23C: Palette - enemy $DC7F (zeela) ;;;
Palette_Zeela:
    dw $3800,$3F5A,$2E50,$00E5,$0063,$3AB3,$220E,$1169
    dw $0927,$03FF,$02F7,$0210,$0108,$7FFF,$0299,$0170


;;; $E25C: Instruction list - zeela / zoomer - upside right ;;;
InstList_Zeela_Zoomer_UpsideRight_0:
    dw Instruction_Crawlers_FunctionInY
    dw Function_Crawlers_CrawlingVertically

InstList_Zeela_Zoomer_UpsideRight_1:
    dw $0003,Spritemap_Crawlers_UpsideRight_0
    dw $0003,Spritemap_Crawlers_UpsideRight_1
    dw $0003,Spritemap_Crawlers_UpsideRight_2
    dw $0003,Spritemap_Crawlers_UpsideRight_3
    dw $0003,Spritemap_Crawlers_UpsideRight_4
    dw Instruction_Common_GotoY
    dw InstList_Zeela_Zoomer_UpsideRight_1


;;; $E278: Instruction list - zeela / zoomer - upside left ;;;
InstList_Zeela_Zoomer_UpsideLeft_0:
    dw Instruction_Crawlers_FunctionInY
    dw Function_Crawlers_CrawlingVertically

InstList_Zeela_Zoomer_UpsideLeft_1:
    dw $0003,Spritemap_Crawlers_UpsideLeft_0
    dw $0003,Spritemap_Crawlers_UpsideLeft_1
    dw $0003,Spritemap_Crawlers_UpsideLeft_2
    dw $0003,Spritemap_Crawlers_UpsideLeft_3
    dw $0003,Spritemap_Crawlers_UpsideLeft_4
    dw Instruction_Common_GotoY
    dw InstList_Zeela_Zoomer_UpsideLeft_1


;;; $E294: Instruction list - zeela / zoomer - upside down ;;;
InstList_Zeela_Zoomer_UpsideDown_0:
    dw Instruction_Crawlers_FunctionInY
    dw Function_Crawlers_CrawlingHorizontally

InstList_Zeela_Zoomer_UpsideDown_1:
    dw $0003,Spritemap_Crawlers_UpsideDown_FacingLeft_0
    dw $0003,Spritemap_Crawlers_UpsideDown_FacingLeft_1
    dw $0003,Spritemap_Crawlers_UpsideDown_FacingLeft_2
    dw $0003,Spritemap_Crawlers_UpsideDown_FacingLeft_3
    dw $0003,Spritemap_Crawlers_UpsideDown_FacingLeft_4
    dw Instruction_Common_GotoY
    dw InstList_Zeela_Zoomer_UpsideDown_1


;;; $E2B0: Instruction list - zeela / zoomer - upside up ;;;
InstList_Zeela_Zoomer_UpsideUp_0:
    dw Instruction_Crawlers_FunctionInY
    dw Function_Crawlers_CrawlingHorizontally

InstList_Zeela_Zoomer_UpsideUp_1:
    dw $0003,Spritemap_Crawlers_UpsideUp_FacingRight_0
    dw $0003,Spritemap_Crawlers_UpsideUp_FacingRight_1
    dw $0003,Spritemap_Crawlers_UpsideUp_FacingRight_2
    dw $0003,Spritemap_Crawlers_UpsideUp_FacingRight_3
    dw $0003,Spritemap_Crawlers_UpsideUp_FacingRight_4
    dw Instruction_Common_GotoY
    dw InstList_Zeela_Zoomer_UpsideUp_1


;;; $E2CC: Zeela / zoomer initial instruction list pointers ;;;
InitialInstListPointers_Crawlers:
; Used by: zeela, zoomer, stone zoomer, sova

; Indexed by [enemy initialisation parameter] * 2
    dw InstList_Zeela_Zoomer_UpsideRight_0
    dw InstList_Zeela_Zoomer_UpsideLeft_0
    dw InstList_Zeela_Zoomer_UpsideDown_0
    dw InstList_Zeela_Zoomer_UpsideUp_0


;;; $E2D4: Initialisation AI - enemy $DC7F (zeela) ;;;
InitAI_Zeela:
    LDX.W EnemyIndex
    LDA.W Enemy.instList,X : AND.W #$0003 : ASL : TAY
    LDA.W InitialInstListPointers_Crawlers,Y : STA.W Enemy.instList,X
    JMP InitAI_Crawlers_Common


;;; $E2E8: Zeela / zoomer spritemaps ;;;
; Used by: zeela, zoomer, stone zoomer, sova, Wrecked Ship orange zoomer
Spritemap_Crawlers_UpsideUp_FacingRight_0:
    dw $0004
    %spritemapEntry(0, $02, $00, 0, 0, 2, 0, $121)
    %spritemapEntry(0, $1F6, $00, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $00, $F8, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F0, $F8, 0, 0, 2, 0, $100)

Spritemap_Crawlers_UpsideUp_FacingRight_1:
    dw $0004
    %spritemapEntry(0, $02, $00, 0, 0, 2, 0, $123)
    %spritemapEntry(0, $1F6, $00, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $00, $F7, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F0, $F7, 0, 0, 2, 0, $100)

Spritemap_Crawlers_UpsideUp_FacingRight_2:
    dw $0004
    %spritemapEntry(0, $02, $00, 0, 0, 2, 0, $125)
    %spritemapEntry(0, $1F6, $00, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $1F0, $F7, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $00, $F7, 0, 1, 2, 0, $100)

Spritemap_Crawlers_UpsideUp_FacingRight_3:
    dw $0004
    %spritemapEntry(0, $02, $00, 0, 0, 2, 0, $127)
    %spritemapEntry(0, $1F6, $00, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $1F0, $F7, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $00, $F7, 0, 1, 2, 0, $100)

Spritemap_Crawlers_UpsideUp_FacingRight_4:
    dw $0004
    %spritemapEntry(0, $02, $00, 0, 0, 2, 0, $129)
    %spritemapEntry(0, $1F6, $00, 0, 0, 2, 0, $128)
    %spritemapEntry(1, $00, $F8, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F0, $F8, 0, 0, 2, 0, $100)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Crawlers_UpsideUp_FacingLeft_A3E356:
    dw $0004
    %spritemapEntry(0, $1F5, $00, 0, 1, 2, 0, $121)
    %spritemapEntry(0, $01, $00, 0, 1, 2, 0, $120)
    %spritemapEntry(1, $1EF, $F8, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $1FF, $F8, 0, 1, 2, 0, $100)

UNUSED_Spritemap_Crawlers_UpsideUp_FacingLeft_A3E36C:
    dw $0004
    %spritemapEntry(0, $1F5, $00, 0, 1, 2, 0, $123)
    %spritemapEntry(0, $01, $00, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $1EF, $F7, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $1FF, $F7, 0, 1, 2, 0, $100)

UNUSED_Spritemap_Crawlers_UpsideUp_FacingLeft_A3E382:
    dw $0004
    %spritemapEntry(0, $1F5, $00, 0, 1, 2, 0, $125)
    %spritemapEntry(0, $01, $00, 0, 1, 2, 0, $124)
    %spritemapEntry(1, $1FF, $F7, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1EF, $F7, 0, 0, 2, 0, $100)

UNUSED_Spritemap_Crawlers_UpsideUp_FacingLeft_A3E398:
    dw $0004
    %spritemapEntry(0, $1F5, $00, 0, 1, 2, 0, $127)
    %spritemapEntry(0, $01, $00, 0, 1, 2, 0, $126)
    %spritemapEntry(1, $1FF, $F7, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1EF, $F7, 0, 0, 2, 0, $100)

UNUSED_Spritemap_Crawlers_UpsideUp_FacingLeft_A3E3AE:
    dw $0004
    %spritemapEntry(0, $1F5, $00, 0, 1, 2, 0, $129)
    %spritemapEntry(0, $01, $00, 0, 1, 2, 0, $128)
    %spritemapEntry(1, $1EF, $F8, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $1FF, $F8, 0, 1, 2, 0, $100)
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_Crawlers_UpsideLeft_0:
    dw $0004
    %spritemapEntry(0, $00, $F6, 0, 0, 2, 0, $108)
    %spritemapEntry(0, $00, $02, 0, 0, 2, 0, $118)
    %spritemapEntry(1, $1F8, $00, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $1F8, $F0, 0, 0, 2, 0, $104)

Spritemap_Crawlers_UpsideLeft_1:
    dw $0004
    %spritemapEntry(0, $00, $F6, 0, 0, 2, 0, $109)
    %spritemapEntry(0, $00, $02, 0, 0, 2, 0, $119)
    %spritemapEntry(1, $1F7, $00, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $1F7, $F0, 0, 0, 2, 0, $104)

Spritemap_Crawlers_UpsideLeft_2:
    dw $0004
    %spritemapEntry(0, $00, $F6, 0, 0, 2, 0, $10A)
    %spritemapEntry(0, $00, $02, 0, 0, 2, 0, $11A)
    %spritemapEntry(1, $1F7, $F0, 1, 0, 2, 0, $106)
    %spritemapEntry(1, $1F7, $00, 1, 0, 2, 0, $104)

Spritemap_Crawlers_UpsideLeft_3:
    dw $0004
    %spritemapEntry(0, $00, $F6, 0, 0, 2, 0, $10B)
    %spritemapEntry(0, $00, $02, 0, 0, 2, 0, $11B)
    %spritemapEntry(1, $1F7, $F0, 1, 0, 2, 0, $106)
    %spritemapEntry(1, $1F7, $00, 1, 0, 2, 0, $104)

Spritemap_Crawlers_UpsideLeft_4:
    dw $0004
    %spritemapEntry(0, $00, $F6, 0, 0, 2, 0, $10C)
    %spritemapEntry(0, $00, $02, 0, 0, 2, 0, $11C)
    %spritemapEntry(1, $1F8, $00, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $1F8, $F0, 0, 0, 2, 0, $104)

Spritemap_Crawlers_UpsideDown_FacingLeft_0:
    dw $0004
    %spritemapEntry(0, $02, $F8, 1, 0, 2, 0, $121)
    %spritemapEntry(0, $1F6, $F8, 1, 0, 2, 0, $120)
    %spritemapEntry(1, $00, $F8, 1, 0, 2, 0, $102)
    %spritemapEntry(1, $1F0, $F8, 1, 0, 2, 0, $100)

Spritemap_Crawlers_UpsideDown_FacingLeft_1:
    dw $0004
    %spritemapEntry(0, $02, $F7, 1, 0, 2, 0, $123)
    %spritemapEntry(0, $1F6, $F7, 1, 0, 2, 0, $122)
    %spritemapEntry(1, $00, $F9, 1, 0, 2, 0, $102)
    %spritemapEntry(1, $1F0, $F9, 1, 0, 2, 0, $100)

Spritemap_Crawlers_UpsideDown_FacingLeft_2:
    dw $0004
    %spritemapEntry(0, $02, $F7, 1, 0, 2, 0, $125)
    %spritemapEntry(0, $1F6, $F7, 1, 0, 2, 0, $124)
    %spritemapEntry(1, $1F0, $F9, 1, 1, 2, 0, $102)
    %spritemapEntry(1, $00, $F9, 1, 1, 2, 0, $100)

Spritemap_Crawlers_UpsideDown_FacingLeft_3:
    dw $0004
    %spritemapEntry(0, $02, $F7, 1, 0, 2, 0, $127)
    %spritemapEntry(0, $1F6, $F7, 1, 0, 2, 0, $126)
    %spritemapEntry(1, $1F0, $F9, 1, 1, 2, 0, $102)
    %spritemapEntry(1, $00, $F9, 1, 1, 2, 0, $100)

Spritemap_Crawlers_UpsideDown_FacingLeft_4:
    dw $0004
    %spritemapEntry(0, $02, $F8, 1, 0, 2, 0, $129)
    %spritemapEntry(0, $1F6, $F8, 1, 0, 2, 0, $128)
    %spritemapEntry(1, $00, $F8, 1, 0, 2, 0, $102)
    %spritemapEntry(1, $1F0, $F8, 1, 0, 2, 0, $100)

Spritemap_Crawlers_UpsideDown_FacingRight_0:
    dw $0004
    %spritemapEntry(0, $1F5, $F8, 1, 1, 2, 0, $121)
    %spritemapEntry(0, $01, $F8, 1, 1, 2, 0, $120)
    %spritemapEntry(1, $1EF, $F8, 1, 1, 2, 0, $102)
    %spritemapEntry(1, $1FF, $F8, 1, 1, 2, 0, $100)

Spritemap_Crawlers_UpsideDown_FacingRight_1:
    dw $0004
    %spritemapEntry(0, $1F5, $F7, 1, 1, 2, 0, $123)
    %spritemapEntry(0, $01, $F7, 1, 1, 2, 0, $122)
    %spritemapEntry(1, $1EF, $F9, 1, 1, 2, 0, $102)
    %spritemapEntry(1, $1FF, $F9, 1, 1, 2, 0, $100)

Spritemap_Crawlers_UpsideDown_FacingRight_2:
    dw $0004
    %spritemapEntry(0, $1F5, $F7, 1, 1, 2, 0, $125)
    %spritemapEntry(0, $01, $F7, 1, 1, 2, 0, $124)
    %spritemapEntry(1, $1FF, $F9, 1, 0, 2, 0, $102)
    %spritemapEntry(1, $1EF, $F9, 1, 0, 2, 0, $100)

Spritemap_Crawlers_UpsideDown_FacingRight_3:
    dw $0004
    %spritemapEntry(0, $1F5, $F7, 1, 1, 2, 0, $127)
    %spritemapEntry(0, $01, $F7, 1, 1, 2, 0, $126)
    %spritemapEntry(1, $1FF, $F9, 1, 0, 2, 0, $102)
    %spritemapEntry(1, $1EF, $F9, 1, 0, 2, 0, $100)

Spritemap_Crawlers_UpsideDown_FacingRight_4:
    dw $0004
    %spritemapEntry(0, $1F5, $F8, 1, 1, 2, 0, $129)
    %spritemapEntry(0, $01, $F8, 1, 1, 2, 0, $128)
    %spritemapEntry(1, $1EF, $F8, 1, 1, 2, 0, $102)
    %spritemapEntry(1, $1FF, $F8, 1, 1, 2, 0, $100)

Spritemap_Crawlers_UpsideRight_0:
    dw $0004
    %spritemapEntry(0, $1F8, $F6, 0, 1, 2, 0, $108)
    %spritemapEntry(0, $1F8, $02, 0, 1, 2, 0, $118)
    %spritemapEntry(1, $1F8, $00, 0, 1, 2, 0, $106)
    %spritemapEntry(1, $1F8, $F0, 0, 1, 2, 0, $104)

Spritemap_Crawlers_UpsideRight_1:
    dw $0004
    %spritemapEntry(0, $1F7, $F6, 0, 1, 2, 0, $109)
    %spritemapEntry(0, $1F7, $02, 0, 1, 2, 0, $119)
    %spritemapEntry(1, $1F9, $00, 0, 1, 2, 0, $106)
    %spritemapEntry(1, $1F9, $F0, 0, 1, 2, 0, $104)

Spritemap_Crawlers_UpsideRight_2:
    dw $0004
    %spritemapEntry(0, $1F7, $F6, 0, 1, 2, 0, $10A)
    %spritemapEntry(0, $1F7, $02, 0, 1, 2, 0, $11A)
    %spritemapEntry(1, $1F9, $F0, 1, 1, 2, 0, $106)
    %spritemapEntry(1, $1F9, $00, 1, 1, 2, 0, $104)

Spritemap_Crawlers_UpsideRight_3:
    dw $0004
    %spritemapEntry(0, $1F7, $F6, 0, 1, 2, 0, $10B)
    %spritemapEntry(0, $1F7, $02, 0, 1, 2, 0, $11B)
    %spritemapEntry(1, $1F9, $F0, 1, 1, 2, 0, $106)
    %spritemapEntry(1, $1F9, $00, 1, 1, 2, 0, $104)

Spritemap_Crawlers_UpsideRight_4:
    dw $0004
    %spritemapEntry(0, $1F8, $F6, 0, 1, 2, 0, $10C)
    %spritemapEntry(0, $1F8, $02, 0, 1, 2, 0, $11C)
    %spritemapEntry(1, $1F8, $00, 0, 1, 2, 0, $106)
    %spritemapEntry(1, $1F8, $F0, 0, 1, 2, 0, $104)


;;; $E57C: Palette - enemy $DCBF (sova) ;;;
Palette_Sova:
    dw $3800,$02FF,$01BF,$000F,$0008,$01BF,$011B,$00BA
    dw $0011,$7FFF,$039C,$0237,$00D1,$3BE0,$2680,$1580


;;; $E59C: Initialisation AI - enemy $DCBF (sova) ;;;
InitAI_Sova:
    LDX.W EnemyIndex
    LDA.W Enemy.instList,X : AND.W #$0003 : ASL : TAY
    LDA.W InitialInstListPointers_Crawlers,Y : STA.W Enemy.instList,X
    JMP InitAI_Crawlers_Common


;;; $E5B0: Palette - enemy $DCFF (zoomer) ;;;
Palette_Zoomer:
    dw $3800,$72FA,$55B0,$2845,$1801,$6210,$496B,$38C6
    dw $2C63,$7FE0,$7DA0,$48E0,$30A0,$03FF,$0237,$00D1


;;; $E5D0: Palette - enemy $DD3F (stone zoomer) ;;;
Palette_MZoomer:
    dw $3800,$7FFF,$4ED3,$1926,$0481,$5F57,$4691,$360D
    dw $2DCB,$6BBA,$56B2,$2947,$18C3,$7FFF,$4ED3,$1926


;;; $E5F0: Creepy crawly speed table ;;;
CrawlersSpeedTable:
; Speed. Unit is 1/100h px/frame. Indexed by [enemy parameter 1] * 2
    dw $0040,$0080,$00C0,$0100,$0140,$0180,$01C0,$0200
    dw $0240,$0280,$02C0,$0300,$0340,$0380,$0400,$0440
    dw $0540,$0580,$05C0,$0600,$0640,$0680,$06C0,$0700
    dw $0740,$0780,$07C0,$0800,$0840,$0880,$0800,$0000


;;; $E630: Creepy crawly instruction list pointer table ;;;
; Instruction list pointers. Indexed by [enemy parameter 2]
CrawlersInstListPointerTable_upsideDown:
    dw InstList_Zeela_Zoomer_UpsideDown_0                                ; 0: (Stone) zoomer
    dw InstList_Zeela_Zoomer_UpsideDown_0                                ; 2: Zeela
    dw InstList_Zeela_Zoomer_UpsideDown_0                                ; 4: Sova
    dw InstList_Viola_UpsideDown                                         ; 6: Viola
    dw InstList_Sciser_UpsideDown_0                                      ; 8: Sciser
    dw InstList_Zero_UpsideDown_FacingLeft_0                             ; Ah: Zero

CrawlersInstListPointerTable_upsideUp:
    dw InstList_Zeela_Zoomer_UpsideUp_0                                  ; 0: (Stone) zoomer
    dw InstList_Zeela_Zoomer_UpsideUp_0                                  ; 2: Zeela
    dw InstList_Zeela_Zoomer_UpsideUp_0                                  ; 4: Sova
    dw InstList_Viola_UpsideUp                                           ; 6: Viola
    dw InstList_Sciser_UpsideUp_0                                        ; 8: Sciser
    dw UNUSED_InstList_Zero_UpsideUp_FacingRight_A3990B                  ; Ah: Zero

CrawlersInstListPointerTable_upsideRight:
    dw InstList_Zeela_Zoomer_UpsideRight_0                               ; 0: (Stone) zoomer
    dw InstList_Zeela_Zoomer_UpsideRight_0                               ; 2: Zeela
    dw InstList_Zeela_Zoomer_UpsideRight_0                               ; 4: Sova
    dw InstList_Viola_UpsideRight                                        ; 6: Viola
    dw InstList_Sciser_UpsideRight_0                                     ; 8: Sciser
    dw InstList_Zero_UpsideRight_FacingDown_0                            ; Ah: Zero

CrawlersInstListPointerTable_upsideLeft:
    dw InstList_Zeela_Zoomer_UpsideLeft_0                                ; 0: (Stone) zoomer
    dw InstList_Zeela_Zoomer_UpsideLeft_0                                ; 2: Zeela
    dw InstList_Zeela_Zoomer_UpsideLeft_0                                ; 4: Sova
    dw InstList_Viola_UpsideLeft                                         ; 6: Viola
    dw InstList_Sciser_UpsideLeft_0                                      ; 8: Sciser
    dw InstList_Zero_UpsideLeft_FacingUp_0                               ; Ah: Zero


;;; $E660: Instruction - enemy function = [[Y]] ;;;
Instruction_Crawlers_FunctionInY:
    LDA.W $0000,Y : STA.W Crawler.function,X
    INY #2
    RTL


;;; $E669: Initialisation AI - enemy $DCFF/$DD3F (zoomer / stone zoomer) ;;;
InitAI_Zoomer_MZoomer:
    LDX.W EnemyIndex
    LDA.W Enemy.instList,X : AND.W #$0003 : ASL : TAY
    LDA.W InitialInstListPointers_Crawlers,Y : STA.W Enemy.instList,X
; fallthrough to InitAI_Crawlers_Common


;;; $E67A: Creepy crawly common initialisation AI ;;;
InitAI_Crawlers_Common:
; Used by: sciser, zero, viola, yard, zeela, zoomer, sova, stone zoomer
    LDA.W #Spritemap_Common_Nothing : STA.W Enemy.spritemap,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDA.W #.return : STA.W Crawler.function,X
    LDA.W Enemy.init0,X : CMP.W #$00FF : BEQ .skipSpeedTable
    ASL : TAY
    LDA.W CrawlersSpeedTable,Y : STA.W Crawler.XVelocity,X : STA.W Crawler.YVelocity,X

  .skipSpeedTable:
    LDA.W Enemy.properties,X : AND.W #$0003 : BNE .properties
    LDA.W Crawler.XVelocity,X : EOR.W #$FFFF : INC : STA.W Crawler.XVelocity,X
    RTL

  .properties:
    CMP.W #$0002 : BNE .return
    LDA.W Crawler.YVelocity,X : EOR.W #$FFFF : INC : STA.W Crawler.YVelocity,X

  .return:
    RTL


;;; $E6C2: Main AI - enemy $D77F/$D7BF/$DABF/$DC7F/$DCBF/$DCFF/$DD3F (sciser / zero / viola / zeela / zoomer) ;;;
MainAI_Crawlers:
    LDX.W EnemyIndex
    JMP.W (Crawler.function,X)


;;; $E6C8: Creepy crawly function - crawling vertically ;;;
Function_Crawlers_CrawlingVertically:
    LDA.W EarthquakeTimer : CMP.W #$001E : BNE .noQuake
    LDA.W EarthquakeType : CMP.W #$0014 : BNE .noQuake
    LDA.W Crawler.function,X : STA.L Crawler.nonFallingFunction,X
    LDA.W #Function_Crawlers_Falling : STA.W Crawler.function,X

  .noQuake:
    STZ.B DP_Temp12 : STZ.B DP_Temp14
    LDA.W Crawler.XVelocity,X : BPL .positive
    DEC.B DP_Temp14

  .positive:
    STA.B DP_Temp13
    LDA.B DP_Temp14 : BPL .inc
    DEC
    BRA .moveRight

  .inc:
    INC

  .moveRight:
    STA.B DP_Temp14
    JSL MoveEnemyRightBy_14_12_IgnoreSlopes
    BCC .outsideTurn
    LDA.W #$0000 : STA.L Crawler.consecutiveTurnCounter,X
    JSL AlignEnemyYPositionWIthNonSquareSlope
    STZ.B DP_Temp12 : STZ.B DP_Temp14
    LDA.W Crawler.YVelocity,X : BPL .moveDown
    DEC.B DP_Temp14

  .moveDown:
    STA.B DP_Temp13
    JSL MoveEnemyDownBy_14_12
    BCS .insideTurn
    RTL

  .insideTurn:
    LDA.W Crawler.XVelocity,X : EOR.W #$FFFF : INC : STA.W Crawler.XVelocity,X
    LDY.W Enemy.init1,X
    LDA.W Crawler.YVelocity,X : BPL .insideTurn_up
    LDA.W CrawlersInstListPointerTable_upsideDown,Y
    BRA +

  .insideTurn_up:
    LDA.W CrawlersInstListPointerTable_upsideUp,Y

+   STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    RTL

  .outsideTurn:
    LDA.L Crawler.consecutiveTurnCounter,X : INC : STA.L Crawler.consecutiveTurnCounter,X : CMP.W #$0004 : BMI .negate
    LDA.W Crawler.function,X : STA.L Crawler.nonFallingFunction,X
    LDA.W #Function_Crawlers_Falling : STA.W Crawler.function,X
    RTL

  .negate:
    LDA.W Crawler.YVelocity,X : EOR.W #$FFFF : INC : STA.W Crawler.YVelocity,X
    LDY.W Enemy.init1,X
    LDA.W Crawler.YVelocity,X : BPL .positiveYVelocity
    LDA.W CrawlersInstListPointerTable_upsideDown,Y
    BRA .outsideTurn_up

  .positiveYVelocity:
    LDA.W CrawlersInstListPointerTable_upsideUp,Y

  .outsideTurn_up:
    STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    RTL


;;; $E785: Creepy crawly function - falling ;;;
Function_Crawlers_Falling:
    LDA.L Crawler.fallingYSubVelocity,X : STA.B DP_Temp12
    LDA.L Crawler.fallingYVelocity,X : STA.B DP_Temp14
    JSL MoveEnemyDownBy_14_12
    BCC .noCollision
    LDA.W Enemy.init0,X : CMP.W #$00FF : BNE .skipSpeed
    LDA.W #$0080 : STA.W Crawler.XVelocity,X : STA.W Crawler.YVelocity,X

  .skipSpeed:
    LDA.W #$0000 : STA.L Crawler.fallingYSubVelocity,X
    STA.L Crawler.fallingYVelocity,X : STA.L Crawler.consecutiveTurnCounter,X
    LDA.L Crawler.nonFallingFunction,X : STA.W Crawler.function,X
    RTL

  .noCollision:
    LDA.L Crawler.fallingYVelocity,X : CMP.W #$0004 : BPL .fallSpeedCapped
    LDA.L Crawler.fallingYSubVelocity,X : CLC : ADC.W #$8000 : STA.L Crawler.fallingYSubVelocity,X
    LDA.L Crawler.fallingYVelocity,X : ADC.W #$0000 : STA.L Crawler.fallingYVelocity,X

  .fallSpeedCapped:
    LDA.L Crawler.fallingYSubVelocity,X : BNE .return
    LDA.L Crawler.fallingYVelocity,X : BNE .return
    LDA.W #Function_Crawlers_CrawlingVertically : STA.W Crawler.function,X

  .return:
    RTL


;;; $E7F2: Creepy crawly function - crawling horizontally ;;;
Function_Crawlers_CrawlingHorizontally:
    LDA.W EarthquakeTimer : CMP.W #$001E : BNE .noQuake
    LDA.W EarthquakeType : CMP.W #$0014 : BNE .noQuake
    LDA.W Crawler.function,X : STA.L Crawler.nonFallingFunction,X
    LDA.W #Function_Crawlers_Falling : STA.W Crawler.function,X

  .noQuake:
    STZ.B DP_Temp12 : STZ.B DP_Temp14
    LDA.W Crawler.YVelocity,X : BPL .positive
    DEC.B DP_Temp14

  .positive:
    STA.B DP_Temp13
    LDA.B DP_Temp14 : BPL .inc
    DEC
    BRA .moveDown

  .inc:
    INC

  .moveDown:
    STA.B DP_Temp14
    JSL MoveEnemyDownBy_14_12
    BCC .outsideTurn
    LDA.W #$0000 : STA.L Crawler.consecutiveTurnCounter,X
    JSR AdjustEnemyXVelocityForSlopes
    JSL MoveEnemyRightBy_14_12_IgnoreSlopes
    BCS .insideTurn
    JSL AlignEnemyYPositionWIthNonSquareSlope
    RTL

  .insideTurn:
    LDA.W Crawler.YVelocity,X : EOR.W #$FFFF : INC : STA.W Crawler.YVelocity,X
    LDY.W Enemy.init1,X
    LDA.W Crawler.XVelocity,X : BPL ..left
    LDA.W CrawlersInstListPointerTable_upsideRight,Y
    BRA +

  ..left:
    LDA.W CrawlersInstListPointerTable_upsideLeft,Y

+   STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    RTL

  .outsideTurn:
    LDA.L Crawler.consecutiveTurnCounter,X : INC : STA.L Crawler.consecutiveTurnCounter,X
    CMP.W #$0004 : BMI .notFalling
    LDA.W Crawler.function,X : STA.L Crawler.nonFallingFunction,X
    LDA.W #Function_Crawlers_Falling : STA.W Crawler.function,X
    RTL

  .notFalling:
    LDA.W Crawler.XVelocity,X : EOR.W #$FFFF : INC : STA.W Crawler.XVelocity,X
    LDY.W Enemy.init1,X
    LDA.W Crawler.XVelocity,X : BPL .outsideTurn_left
    LDA.W CrawlersInstListPointerTable_upsideRight,Y
    BRA +

  .outsideTurn_left:
    LDA.W CrawlersInstListPointerTable_upsideLeft,Y

+   STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    RTL


;;; $E8A5: Adjust enemy X velocity for slopes ;;;
AdjustEnemyXVelocityForSlopes:
    LDA.W Enemy.XPosition,X : PHA
    LDA.W Enemy.YPosition,X : BIT.W Crawler.YVelocity,X : BPL .negativeYVelocity
    SEC : SBC.W Enemy.YHitboxRadius,X
    BRA .positiveYVelocity

  .negativeYVelocity:
    CLC : ADC.W Enemy.YHitboxRadius,X : DEC

  .positiveYVelocity:
    PHA
    JSL CalculateTheBlockContainingAPixelPosition
    LDA.W CurrentBlockIndex : ASL : TAX
    LDA.L LevelData,X : AND.W #$F000 : CMP.W #$1000 : BNE .normalSpeed
    LDX.W CurrentBlockIndex
    LDA.L BTS,X : AND.W #$001F : CMP.W #$0005 : BCC .normalSpeed
    ASL #2 : TAX
    LDY.W .adjustedSpeedMultiplier,X
    LDX.W EnemyIndex
    LDA.W Crawler.XVelocity,X : BPL .multiply
    EOR.W #$FFFF : INC
    JSL A_Y_16bit_UnsignedMultiplication
    LDA.W MultiplicationResult : EOR.W #$FFFF : CLC : ADC.W #$0001 : STA.B DP_Temp12
    LDA.W MultiplicationResult+2 : EOR.W #$FFFF : ADC.W #$0000 : STA.B DP_Temp14
    RTS

  .multiply:
    JSL A_Y_16bit_UnsignedMultiplication
    LDA.W MultiplicationResult : STA.B DP_Temp12
    LDA.W MultiplicationResult+2 : STA.B DP_Temp14
    RTS

  .normalSpeed:
    LDX.W EnemyIndex
    STZ.B DP_Temp12 : STZ.B DP_Temp14
    LDA.W Crawler.XVelocity,X : BPL +
    DEC.B DP_Temp14

+   STA.B DP_Temp13
    RTS

;        _________ Unused. Seem to be additive speed modifiers in the SamusBlockCollisionDetection_Horizontal_Slope_NonSquare version of this table
;       |      ___ Adjusted speed multiplier * 100h
;       |     |
  .additiveSpeedMultiplier:
    dw $0000

  .adjustedSpeedMultiplier:
    dw       $0100
    dw $0000,$0100
    dw $0000,$0100
    dw $0000,$0100
    dw $0000,$0100
    dw $0000,$0100 ; 5: Unused. Half height isosceles triangle
    dw $0000,$0100 ; 6: Unused. Isosceles triangle
    dw $0000,$0100 ; 7: Half height rectangle
    dw $0000,$0100 ; 8: Unused. Rectangle
    dw $0000,$0100 ; 9: Unused. Rectangle
    dw $0000,$0100 ; Ah: Unused. Rectangle
    dw $0000,$0100 ; Bh: Unused. Rectangle
    dw $0000,$0100 ; Ch: Unused. Rectangle
    dw $0000,$0100 ; Dh: Unused. Rectangle
    dw $1000,$00B0 ; Eh: Unused. Very bumpy triangle
    dw $1000,$00B0 ; Fh: Bumpy triangle
    dw $0000,$0100 ; 10h: Unused
    dw $0000,$0100 ; 11h: Unused
    dw $1000,$00C0 ; 12h: Triangle
    dw $0000,$0100 ; 13h: Rectangle
    dw $1000,$00C0 ; 14h: Quarter triangle
    dw $1000,$00C0 ; 15h: Three quarter triangle
    dw $0800,$00D8 ; 16h: Lower half-height triangle
    dw $0800,$00D8 ; 17h: Upper half-height triangle
    dw $0600,$00F0 ; 18h: Unused. Lower third-height triangle
    dw $0600,$00F0 ; 19h: Unused. Middle third-height triangle
    dw $0600,$00F0 ; 1Ah: Unused. Upper third-height triangle
    dw $4000,$0080 ; 1Bh: Upper half-width triangle
    dw $4000,$0080 ; 1Ch: Lower half-width triangle
    dw $6000,$0050 ; 1Dh: Unused. Upper third-width triangle
    dw $6000,$0050 ; 1Eh: Unused. Middle third-width triangle
    dw $6000,$0050 ; 1Fh: Unused. Lower third-width triangle


;;; $E9AF: Palette - enemy $DD7F (metroid) ;;;
Palette_Metroid:
    dw $3800,$6BF5,$06E1,$0641,$05A1,$5E5F,$183F,$1014
    dw $080A,$0404,$4F9F,$3ED8,$2E12,$6F70,$7FFF,$5EE0


;;; $E9CF: Instruction list - metroid - chasing Samus ;;;
InstList_Metroid_ChasingSamus:
    dw $0010,Spritemap_Metroid_Insides_0
    dw $0010,Spritemap_Metroid_Insides_1
    dw $0006,Spritemap_Metroid_Insides_2
    dw $000A,Spritemap_Metroid_Insides_3
    dw $0010,Spritemap_Metroid_Insides_1
    dw $0010,Spritemap_Metroid_Insides_0
    dw $0010,Spritemap_Metroid_Insides_1
    dw $0006,Spritemap_Metroid_Insides_2
    dw $000A,Spritemap_Metroid_Insides_3
    dw $0010,Spritemap_Metroid_Insides_1
    dw $0010,Spritemap_Metroid_Insides_0
    dw $0010,Spritemap_Metroid_Insides_1
    dw $0006,Spritemap_Metroid_Insides_2
    dw $000A,Spritemap_Metroid_Insides_3
    dw $0010,Spritemap_Metroid_Insides_1
    dw $0010,Spritemap_Metroid_Insides_0
    dw $0010,Spritemap_Metroid_Insides_1
    dw $0006,Spritemap_Metroid_Insides_2
    dw $000A,Spritemap_Metroid_Insides_3
    dw $0010,Spritemap_Metroid_Insides_1
    dw Instruction_Metroid_PlayRandomMetroidSFX
    dw Instruction_Common_GotoY
    dw InstList_Metroid_ChasingSamus


;;; $EA25: Instruction list - metroid - draining Samus ;;;
InstList_Metroid_DrainingSamus:
    dw $0010,Spritemap_Metroid_Insides_0
    dw $0010,Spritemap_Metroid_Insides_1
    dw $0006,Spritemap_Metroid_Insides_2
    dw $000A,Spritemap_Metroid_Insides_3
    dw $0010,Spritemap_Metroid_Insides_1
    dw Instruction_Metroid_PlayDrainingSamusSFX
    dw Instruction_Common_GotoY
    dw InstList_Metroid_DrainingSamus


;;; $EA3F: Bombed off X velocities ;;;
BombedOffVelocities:
;        _____________________ Frame 0
;       |      _______________ Frame 3
;       |     |      _________ Frame 2
;       |     |     |      ___ Frame 1
;       |     |     |     |
  .X:
    dw $0002,$0000,$FFFE,$0000
  .Y:
    dw $0000,$FFFE,$0000,$0002


;;; $EA4F: Initialisation AI - enemy $DD7F (metroid) ;;;
InitAI_Metroid:
    LDX.W EnemyIndex
    LDA.W #InstList_Metroid_ChasingSamus : STA.W Enemy.instList,X
    LDA.W Enemy.palette,X : ORA.W Enemy.GFXOffset,X : STA.B DP_Temp18
    LDA.W Enemy.XPosition,X : STA.B DP_Temp12
    LDA.W Enemy.YPosition,X : STA.B DP_Temp14
    LDA.W #$0032 : STA.B DP_Temp16
    JSL Create_Sprite_Object
    LDA.B DP_Temp12 : STA.L Metroid.electricitySpriteObjectIndex,X
    LDX.W EnemyIndex
    LDA.W Enemy.palette,X : ORA.W Enemy.GFXOffset,X : STA.B DP_Temp18
    LDA.W Enemy.XPosition,X : STA.B DP_Temp12
    LDA.W Enemy.YPosition,X : STA.B DP_Temp14
    LDA.W #$0034 : STA.B DP_Temp16
    JSL Create_Sprite_Object
    LDA.B DP_Temp12 : STA.L Metroid.shellSpriteObjectIndex,X
    LDA.W #$0000 : STA.L Metroid.SamusSubEnergy,X
    RTL


;;; $EAA5: Instruction - play Metroid draining Samus ;;;
Instruction_Metroid_PlayDrainingSamusSFX:
    PHX : PHY
    LDA.W #$0050
    JSL QueueSound_Lib2_Max6
    PLY : PLX
    RTL


;;; $EAB1: Instruction - play random Metroid cry ;;;
Instruction_Metroid_PlayRandomMetroidSFX:
    PHX : PHY
    JSL GenerateRandomNumber
    AND.W #$0007 : ASL : TAX
    LDA.W .SFX,X
    JSL QueueSound_Lib2_Max6
    PLY : PLX
    RTL

if !FEATURE_KEEP_UNREFERENCED
  .unused:
; Unused. 180..250 in steps of 10, unsure of significance
    dw $00B4,$00BE,$00C8,$00D2,$00DC,$00E6,$00F0,$00FA
endif ; !FEATURE_KEEP_UNREFERENCED

  .SFX:
    dw $0050,$0058,$005A,$0050,$0058,$005A,$0058,$005A


;;; $EAE6: Frozen AI - enemy $DD7F (metroid) ;;;
FrozenAI_Metroid:
    JSL CommonA3_NormalEnemyFrozenAI
    LDX.W EnemyIndex
    LDA.W Metroid.bombedOffSamusCooldownTimer,X : BEQ .timerExpired
    DEC.W Metroid.bombedOffSamusCooldownTimer,X
    LDA.W #$0002 : STA.W Enemy.flashTimer,X

  .timerExpired:
    LDA.L Metroid.electricitySpriteObjectIndex,X : TAX
    LDA.W #$0C00 : STA.L SpriteObjects_VRAMIndices,X
    LDA.W #$0001 : STA.L SpriteObjects_DisableFlags,X
    LDA.W #InstList_SpriteObject_32_MetroidElectricity : STA.L SpriteObjects_InstListPointers,X
    LDX.W EnemyIndex
    LDA.L Metroid.shellSpriteObjectIndex,X : TAX
    LDA.W #$0C00 : STA.L SpriteObjects_VRAMIndices,X
    LDA.W #$0001 : STA.L SpriteObjects_DisableFlags,X
    LDA.W #InstList_SpriteObject_34_MetroidShell : STA.L SpriteObjects_InstListPointers,X
    RTL


;;; $EB33: Hurt AI - enemy $DD7F (metroid) ;;;
HurtAI_Metroid:
; Synch flashing with sprite objects
    LDX.W EnemyIndex
    LDY.W #$F1FF ; >.<
    LDA.W Enemy.flashTimer,X : BIT.W #$0002 : BEQ .flash
    LDA.W Enemy.palette,X : STA.B DP_Temp12
    LDX.W EnemyIndex ; >.<
    LDA.L Metroid.electricitySpriteObjectIndex,X : TAX
    LDA.L SpriteObjects_VRAMIndices,X : AND.W #$F1FF : ORA.B DP_Temp12 : STA.L SpriteObjects_VRAMIndices,X
    LDX.W EnemyIndex
    LDA.L Metroid.shellSpriteObjectIndex,X : TAX
    LDA.L SpriteObjects_VRAMIndices,X : AND.W #$F1FF : ORA.B DP_Temp12 : STA.L SpriteObjects_VRAMIndices,X
    RTL

  .flash:
    LDX.W EnemyIndex ; >.<
    LDA.L Metroid.electricitySpriteObjectIndex,X : TAX
    LDA.L SpriteObjects_VRAMIndices,X : AND.W #$F1FF : STA.L SpriteObjects_VRAMIndices,X
    LDX.W EnemyIndex
    LDA.L Metroid.shellSpriteObjectIndex,X : TAX
    LDA.L SpriteObjects_VRAMIndices,X : AND.W #$F1FF : STA.L SpriteObjects_VRAMIndices,X
    RTL


;;; $EB98: Main AI - enemy $DD7F (metroid) ;;;
MainAI_Metroid:
    LDX.W EnemyIndex
    LDA.W SamusYPosition : SEC : SBC.W #$0008 : STA.W Temp_TargetYPosition
    LDA.W Metroid.functionIndex,X : ASL : TAX
    JSR.W (.pointers,X)
    LDA.W Enemy.palette,X : ORA.W Enemy.GFXOffset,X : STA.B DP_Temp18
    LDA.W Enemy.XPosition,X : STA.B DP_Temp12
    LDA.W Enemy.YPosition,X : STA.B DP_Temp14
    LDA.L Metroid.electricitySpriteObjectIndex,X : TAX
    LDA.B DP_Temp12 : STA.L SpriteObjects_XPositions,X
    LDA.B DP_Temp14 : STA.L SpriteObjects_YPositions,X
    LDA.B DP_Temp18 : STA.L SpriteObjects_VRAMIndices,X
    LDA.W #$0000 : STA.L SpriteObjects_DisableFlags,X
    LDX.W EnemyIndex
    LDA.W Enemy.XPosition,X : STA.B DP_Temp12
    LDA.W Enemy.YPosition,X : STA.B DP_Temp14
    LDA.L Metroid.shellSpriteObjectIndex,X : TAX
    LDA.B DP_Temp12 : STA.L SpriteObjects_XPositions,X
    LDA.B DP_Temp14 : STA.L SpriteObjects_YPositions,X
    LDA.B DP_Temp18 : STA.L SpriteObjects_VRAMIndices,X
    LDA.W #$0000 : STA.L SpriteObjects_DisableFlags,X
    RTL

  .pointers:
    dw Function_Metroid_0_ChaseSamus
    dw Function_Metroid_1_LatchOntoSamus
    dw Function_Metroid_2_LatchedOntoSamus
    dw Function_Metroid_3_BombedOffSamus


;;; $EC11: Metroid function index 0 - chase Samus ;;;
Function_Metroid_0_ChaseSamus:
;; Parameter:
;;     Temp_TargetYPosition: [Samus Y position] - 8
    LDX.W EnemyIndex
    STZ.B DP_Temp12 : STZ.B DP_Temp14
    LDA.W Enemy.YPosition,X : SEC : SBC.W Temp_TargetYPosition : LSR #2 : STA.B DP_Temp13
    AND.W #$2000 : BEQ +
    LDA.B DP_Temp14 : ORA.W #$FFC0 : STA.B DP_Temp14

+   LDA.W Metroid.YSubVelocity,X : SEC : SBC.B DP_Temp12 : STA.W Metroid.YSubVelocity,X
    LDA.W Metroid.YVelocity,X : SBC.B DP_Temp14 : STA.W Metroid.YVelocity,X : BMI .negativeY
    CMP.W #$0003 : BCC .moveDown
    LDA.W #$0003
    BRA .storeYVelocity

  .negativeY:
    CMP.W #$FFFD : BCS .moveDown
    LDA.W #$FFFD

  .storeYVelocity:
    STA.W Metroid.YVelocity,X
    STZ.W Metroid.YSubVelocity,X

  .moveDown:
    LDA.W Metroid.YSubVelocity,X : STA.B DP_Temp12
    LDA.W Metroid.YVelocity,X : STA.B DP_Temp14
    LDX.W EnemyIndex
    JSL MoveEnemyDownBy_14_12
    BCC .notCollidedWithBlock
    LDX.W EnemyIndex
    STZ.W Metroid.YSubVelocity,X : STZ.W Metroid.YVelocity,X

  .notCollidedWithBlock:
    LDX.W EnemyIndex
    STZ.B DP_Temp12 : STZ.B DP_Temp14
    LDA.W Enemy.XPosition,X : SEC : SBC.W SamusXPosition : LSR #2 : STA.B DP_Temp13
    AND.W #$2000 : BEQ +
    LDA.B DP_Temp14 : ORA.W #$FFC0 : STA.B DP_Temp14

+   LDA.W Metroid.XSubVelocity,X : SEC : SBC.B DP_Temp12 : STA.W Metroid.XSubVelocity,X
    LDA.W Metroid.XVelocity,X : SBC.B DP_Temp14 : STA.W Metroid.XVelocity,X : BMI .negativeX
    CMP.W #$0003 : BCC .moveRight
    LDA.W #$0003
    BRA .storeXVelocity

  .negativeX:
    CMP.W #$FFFD : BCS .moveRight
    LDA.W #$FFFD

  .storeXVelocity:
    STA.W Metroid.XVelocity,X
    STZ.W Metroid.XSubVelocity,X

  .moveRight:
    LDA.W Metroid.XSubVelocity,X : STA.B DP_Temp12
    LDA.W Metroid.XVelocity,X : STA.B DP_Temp14
    LDX.W EnemyIndex
    JSL MoveEnemyRightBy_14_12_IgnoreSlopes
    BCC .return
    LDX.W EnemyIndex
    STZ.W Metroid.XSubVelocity,X : STZ.W Metroid.XVelocity,X

  .return:
    RTS


;;; $ECDC: Metroid function index 1 - latch onto Samus ;;;
Function_Metroid_1_LatchOntoSamus:
;; Parameter:
;;     Temp_TargetYPosition: [Samus Y position] - 8

; This calculation of $14 = ((Samus position) - (metroid position)) * 20h is strange,
; the result if non-zero will always be a huge value that has to be clamped to ±3
; Hard to believe it's the intentional operation, possibly the intended destination of the calculation was $13,
; though the sign extension code would have to be modified in that case too...
    LDX.W EnemyIndex
    STZ.B DP_Temp12 : STZ.B DP_Temp14
    LDA.W Temp_TargetYPosition : SEC : SBC.W Enemy.YPosition,X
    XBA : AND.W #$FF00 : LSR #3 : STA.B DP_Temp14
    AND.W #$1000 : BEQ +
    LDA.B DP_Temp14 : ORA.W #$E000 : STA.B DP_Temp14

+   LDA.B DP_Temp14 : BMI .negativeY
    CMP.W #$0003 : BCC .moveDown
    LDA.W #$0003
    BRA .alwaysClamped

  .negativeY:
    CMP.W #$FFFD : BCS .moveDown
    LDA.W #$FFFD

  .alwaysClamped:
    STA.B DP_Temp14
    STZ.B DP_Temp12

  .moveDown:
    LDA.B DP_Temp12 : STA.W Metroid.YSubVelocity,X
    LDA.B DP_Temp14 : STA.W Metroid.YVelocity,X
    LDX.W EnemyIndex
    JSL MoveEnemyDownBy_14_12
    BCC .notCollidedWithBlock
    LDX.W EnemyIndex
    STZ.W Metroid.YSubVelocity,X : STZ.W Metroid.YVelocity,X

  .notCollidedWithBlock:
    LDX.W EnemyIndex
    STZ.B DP_Temp12 : STZ.B DP_Temp14
    LDA.W SamusXPosition : SEC : SBC.W Enemy.XPosition,X
    XBA : AND.W #$FF00 : LSR #3 : STA.B DP_Temp14
    AND.W #$1000 : BEQ +
    LDA.B DP_Temp14 : ORA.W #$E000 : STA.B DP_Temp14

+   LDA.B DP_Temp14 : BMI .negativeX
    CMP.W #$0003 : BCC .moveRight
    LDA.W #$0003
    BRA .storeXVelocity

  .negativeX:
    CMP.W #$FFFD : BCS .moveRight
    LDA.W #$FFFD

  .storeXVelocity:
    STA.B DP_Temp14
    STZ.B DP_Temp12

  .moveRight:
    LDA.B DP_Temp12 : STA.W Metroid.XSubVelocity,X
    LDA.B DP_Temp14 : STA.W Metroid.XVelocity,X
    LDX.W EnemyIndex
    JSL MoveEnemyRightBy_14_12_IgnoreSlopes
    BCC .return
    LDX.W EnemyIndex
    STZ.W Metroid.XSubVelocity,X : STZ.W Metroid.XVelocity,X

  .return:
    RTS


;;; $ED8F: Metroid function index 2 - latched onto Samus ;;;
Function_Metroid_2_LatchedOntoSamus:
;; Parameter:
;;     Temp_TargetYPosition: [Samus Y position] - 8
    LDX.W EnemyIndex
    LDA.W SamusXPosition : STA.W Enemy.XPosition,X
    LDA.W Temp_TargetYPosition : STA.W Enemy.YPosition,X
    STZ.W Metroid.XSubVelocity,X : STZ.W Metroid.XVelocity,X
    STZ.W Metroid.YSubVelocity,X : STZ.W Metroid.YVelocity,X
    RTS


;;; $EDAB: Metroid function index 3 - bombed off Samus ;;;
Function_Metroid_3_BombedOffSamus:
    LDX.W EnemyIndex
    LDA.W Metroid.bombedOffSamusCooldownTimer,X : AND.W #$0003 : ASL : TAY
    LDA.W Enemy.XPosition,X : CLC : ADC.W BombedOffVelocities_X,Y : STA.W Enemy.XPosition,X
    LDA.W Enemy.YPosition,X : CLC : ADC.W BombedOffVelocities_Y,Y : STA.W Enemy.YPosition,X
    STZ.W Metroid.XSubVelocity,X : STZ.W Metroid.XVelocity,X
    STZ.W Metroid.YSubVelocity,X : STZ.W Metroid.YVelocity,X
    DEC.W Metroid.bombedOffSamusCooldownTimer,X : BNE .return
    STZ.W Metroid.functionIndex,X
    LDA.W #InstList_Metroid_ChasingSamus : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X

  .return:
    RTS


;;; $EDEB: Enemy touch - enemy $DD7F (metroid) ;;;
EnemyTouch_Metroid:
    LDA.W SamusYPosition : SEC : SBC.W #$0008 : STA.W Temp_TargetYPosition
    LDA.W ContactDamageIndex : BEQ .normal
    LDX.W EnemyIndex
    LDA.W Metroid.functionIndex,X : CMP.W #$0002 : BEQ .return
    STZ.W Metroid.XSubVelocity,X : STZ.W Metroid.YSubVelocity,X
    LDY.W #$0000
    LDA.W Enemy.XPosition,X : SEC : SBC.W SamusXPosition : BPL +
    LDY.W #$FF00

+   PHA
    TYA : STA.W Metroid.XVelocity,X
    PLA : ASL #6 : STA.W Enemy.var0+1,X
    LDY.W #$0000
    LDA.W Enemy.YPosition,X : SEC : SBC.W Temp_TargetYPosition : BPL +
    LDY.W #$FF00

+   PHA
    TYA : STA.W Metroid.YVelocity,X
    PLA : ASL #6 : STA.W Enemy.var2+1,X
    STZ.W Metroid.functionIndex,X
    LDA.W #InstList_Metroid_ChasingSamus : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X

  .return:
    RTL

  .normal:
    LDX.W EnemyIndex
    LDA.W Metroid.functionIndex,X : CMP.W #$0003 : BEQ +
    LDA.W NumberOfTimesMainEnemyRoutineExecuted : AND.W #$0007 : CMP.W #$0007 : BNE .skipSFX
    LDA.W Energy : CMP.W #$001E : BMI .skipSFX
    LDA.W #$002D
    JSL QueueSound_Lib3_Max6

  .skipSFX:
    JSR DealMetroidContactDamageToSamus

+   LDA.W Metroid.functionIndex,X : CMP.W #$0002 : BCS .return
    LDY.W #$0001
    LDA.W Enemy.XPosition,X : SEC : SBC.W SamusXPosition : BPL +
    EOR.W #$FFFF : INC

+   CMP.W #$0008 : BCS .setFunction
    LDA.W Enemy.YPosition,X : SEC : SBC.W Temp_TargetYPosition : BPL +
    EOR.W #$FFFF : INC

+   CMP.W #$0008 : BCS .setFunction
    LDY.W #$0002
    LDA.W #$0012
    JSL Run_Samus_Command

  .setFunction:
    TYA : STA.W Metroid.functionIndex,X : CMP.W #$0002 : BNE .return
    LDA.W #InstList_Metroid_DrainingSamus : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    RTL


;;; $EECE: Deal metroid contact damage to Samus ;;;
DealMetroidContactDamageToSamus:
    LDA.W SamusYPosition : SEC : SBC.W #$0008 : STA.W Temp_TargetYPosition
    LDA.W EquippedItems : BIT.W #$0020 : BNE .gravitySuit
    LSR : BCC .powerSuit
    LDA.W #$6000
    BRA .merge

  .gravitySuit:
    LDA.W #$3000
    BRA .merge

  .powerSuit:
    LDA.W #$C000

  .merge:
    STA.B DP_Temp12
    LDA.L Metroid.SamusSubEnergy,X : SEC : SBC.B DP_Temp12 : STA.L Metroid.SamusSubEnergy,X : BCS .return
    LDA.W #$0001
    JSL Deal_A_Damage_to_Samus

  .return:
    RTS


;;; $EF07: Enemy shot - enemy $DD7F (metroid) ;;;
EnemyShot_Metroid:
    LDA.W SamusYPosition : SEC : SBC.W #$0008 : STA.W Temp_TargetYPosition
    LDA.W CollisionIndex : ASL : TAY
    LDX.W EnemyIndex
    LDA.W Enemy.freezeTimer,X : BEQ .notFrozen
    LDA.W SamusProjectile_Types,Y : AND.W #$0F00 : CMP.W #$0100 : BEQ .missile
    CMP.W #$0200 : BNE .returnUpper

  .missile:
    LDA.W Enemy.XPosition,X : STA.L EnemyProjectileData_SpecialDeathItemDropXOriginPosition
    LDA.W Enemy.YPosition,X : STA.L EnemyProjectileData_SpecialDeathItemDropYOriginPosition
    JSL CommonA3_NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic
    LDA.W Enemy.health,X : BNE .returnUpper
    STZ.W Metroid.XVelocity,X
    LDA.W #$0004
    JSL EnemyDeath
    LDA.W #$0013
    JSL Run_Samus_Command
    LDX.W EnemyIndex
    LDA.L Metroid.electricitySpriteObjectIndex,X : TAX
    LDA.W #$0000 : STA.L SpriteObjects_InstListPointers,X
    LDX.W EnemyIndex
    LDA.L Metroid.shellSpriteObjectIndex,X : TAX
    LDA.W #$0000 : STA.L SpriteObjects_InstListPointers,X
    JSL MetroidDeathItemDropRoutine

  .returnUpper:
    RTL

  .notFrozen:
    LDA.W Metroid.functionIndex,X : CMP.W #$0002 : BNE .notLatched
    LDA.W SamusProjectile_Types,Y : AND.W #$0F00 : CMP.W #$0500 : BNE .returnLower
    LDA.W #$0004 : STA.W Metroid.bombedOffSamusCooldownTimer,X
    LDA.W #$0003 : STA.W Metroid.functionIndex,X
    LDA.W #InstList_Metroid_ChasingSamus : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDA.W #$0013
    JSL Run_Samus_Command

  .returnLower:
    RTL

  .notLatched:
    STZ.W Metroid.XSubVelocity,X : STZ.W Metroid.YSubVelocity,X
    LDY.W #$0000
    LDA.W Enemy.XPosition,X : SEC : SBC.W SamusProjectile_XPositions,Y : BPL +
    LDY.W #$FF00

+   PHA
    TYA : STA.W Metroid.XVelocity,X
    PLA : ASL #5 : STA.W Enemy.var0+1,X
    LDY.W #$0000
    LDA.W Enemy.YPosition,X : SEC : SBC.W SamusProjectile_YPositions,Y : BPL +
    LDY.W #$FF00

+   PHA
    TYA : STA.W Metroid.YVelocity,X
    PLA : ASL #5 : STA.W Enemy.var2+1,X
    STZ.W Metroid.functionIndex,X
    LDA.W #InstList_Metroid_ChasingSamus : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDA.W CollisionIndex : ASL : TAY
    LDA.W SamusProjectile_Types,Y : AND.W #$0002 : BEQ .notIceBeam
    LDA.W #$000A
    JSL QueueSound_Lib3_Max6
    LDA.W SamusProjectile_Damages,Y : STA.B DP_Temp12
    LDA.W #$0004 : STA.W Enemy.flashTimer,X
    LDA.W Metroid.freezeHealthThreshold,X : SEC : SBC.B DP_Temp12 : BEQ .freeze
    BCS .noFreeze

  .freeze:
    STZ.W Metroid.freezeHealthThreshold,X
    LDA.W #$0190 : STA.W Enemy.freezeTimer,X
    LDA.W Enemy.AI,X : ORA.W #$0004 : STA.W Enemy.AI,X
    RTL

  .noFreeze:
    STA.W Metroid.freezeHealthThreshold,X

  .notIceBeam:
    LDA.W #$005A
    JSL QueueSound_Lib2_Max6
    RTL


;;; $F042: Power bomb reaction - enemy $DD7F (metroid) ;;;
PowerBombReaction_Metroid:
    JSL NormalEnemyPowerBombAI
    LDA.W Enemy.health,X : BNE .return
    LDA.W #$0013
    JSL Run_Samus_Command
    LDX.W EnemyIndex
    LDA.L Metroid.electricitySpriteObjectIndex,X : TAX
    LDA.W #$0000 : STA.L SpriteObjects_InstListPointers,X
    LDX.W EnemyIndex
    LDA.L Metroid.shellSpriteObjectIndex,X : TAX
    LDA.W #$0000 : STA.L SpriteObjects_InstListPointers,X

  .return:
    RTL


;;; $F071: Metroid spritemaps ;;;
if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Metroid_Shell_A3F071:
    dw $000A
    %spritemapEntry(0, $10, $04, 0, 1, 2, 0, $130)
    %spritemapEntry(0, $10, $FC, 0, 1, 2, 0, $120)
    %spritemapEntry(0, $10, $F4, 0, 1, 2, 0, $110)
    %spritemapEntry(0, $1E8, $04, 0, 0, 2, 0, $130)
    %spritemapEntry(0, $1E8, $FC, 0, 0, 2, 0, $120)
    %spritemapEntry(0, $1E8, $F4, 0, 0, 2, 0, $110)
    %spritemapEntry(1, $00, $FC, 0, 1, 2, 0, $121)
    %spritemapEntry(1, $00, $EC, 0, 0, 2, 0, $103)
    %spritemapEntry(1, $1F0, $FC, 0, 0, 2, 0, $121)
    %spritemapEntry(1, $1F0, $EC, 0, 0, 2, 0, $101)

UNUSED_Spritemap_Metroid_Shell_A3F0A5:
    dw $000A
    %spritemapEntry(0, $10, $FC, 0, 1, 2, 0, $12A)
    %spritemapEntry(0, $10, $04, 0, 1, 2, 0, $13A)
    %spritemapEntry(0, $10, $F4, 0, 0, 2, 0, $11F)
    %spritemapEntry(0, $1E8, $04, 0, 0, 2, 0, $13A)
    %spritemapEntry(0, $1E8, $FC, 0, 0, 2, 0, $12A)
    %spritemapEntry(0, $1E8, $F4, 0, 0, 2, 0, $11A)
    %spritemapEntry(1, $00, $EC, 0, 0, 2, 0, $10D)
    %spritemapEntry(1, $00, $FC, 0, 1, 2, 0, $12B)
    %spritemapEntry(1, $1F0, $FC, 0, 0, 2, 0, $12B)
    %spritemapEntry(1, $1F0, $EC, 0, 0, 2, 0, $10B)

UNUSED_Spritemap_Metroid_Shell_A3F0D9:
    dw $000A
    %spritemapEntry(0, $1E8, $FC, 0, 0, 2, 0, $125)
    %spritemapEntry(0, $10, $04, 0, 1, 2, 0, $135)
    %spritemapEntry(0, $10, $FC, 0, 1, 2, 0, $125)
    %spritemapEntry(0, $10, $F4, 0, 1, 2, 0, $115)
    %spritemapEntry(0, $1E8, $04, 0, 0, 2, 0, $135)
    %spritemapEntry(0, $1E8, $F4, 0, 0, 2, 0, $115)
    %spritemapEntry(1, $00, $FC, 0, 1, 2, 0, $126)
    %spritemapEntry(1, $00, $EC, 0, 0, 2, 0, $108)
    %spritemapEntry(1, $1F0, $FC, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $1F0, $EC, 0, 0, 2, 0, $106)
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_Metroid_Insides_0:
    dw $0008
    %spritemapEntry(0, $10, $00, 0, 1, 2, 0, $160)
    %spritemapEntry(0, $10, $F8, 0, 1, 2, 0, $150)
    %spritemapEntry(0, $1E8, $00, 0, 0, 2, 0, $160)
    %spritemapEntry(0, $1E8, $F8, 0, 0, 2, 0, $150)
    %spritemapEntry(1, $00, $00, 0, 1, 2, 0, $161)
    %spritemapEntry(1, $00, $F0, 0, 1, 2, 0, $141)
    %spritemapEntry(1, $1F0, $00, 0, 0, 2, 0, $161)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 2, 0, $141)

Spritemap_Metroid_Insides_1:
    dw $0006
    %spritemapEntry(0, $10, $00, 0, 1, 2, 0, $163)
    %spritemapEntry(0, $1E8, $00, 0, 0, 2, 0, $163)
    %spritemapEntry(1, $00, $00, 0, 1, 2, 0, $164)
    %spritemapEntry(1, $00, $F0, 0, 1, 2, 0, $144)
    %spritemapEntry(1, $1F0, $00, 0, 0, 2, 0, $164)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 2, 0, $144)

Spritemap_Metroid_Insides_2:
    dw $0008
    %spritemapEntry(0, $10, $00, 0, 1, 2, 0, $166)
    %spritemapEntry(0, $10, $F8, 0, 1, 2, 0, $156)
    %spritemapEntry(0, $1E8, $00, 0, 0, 2, 0, $166)
    %spritemapEntry(0, $1E8, $F8, 0, 0, 2, 0, $156)
    %spritemapEntry(1, $00, $00, 0, 1, 2, 0, $167)
    %spritemapEntry(1, $00, $F0, 0, 1, 2, 0, $147)
    %spritemapEntry(1, $1F0, $00, 0, 0, 2, 0, $167)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 2, 0, $147)

Spritemap_Metroid_Insides_3:
    dw $0008
    %spritemapEntry(0, $10, $00, 0, 1, 2, 0, $169)
    %spritemapEntry(0, $10, $F8, 0, 1, 2, 0, $159)
    %spritemapEntry(0, $1E8, $00, 0, 0, 2, 0, $169)
    %spritemapEntry(0, $1E8, $F8, 0, 0, 2, 0, $159)
    %spritemapEntry(1, $00, $00, 0, 1, 2, 0, $16A)
    %spritemapEntry(1, $00, $F0, 0, 1, 2, 0, $14A)
    %spritemapEntry(1, $1F0, $00, 0, 0, 2, 0, $16A)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 2, 0, $14A)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Metroid_Electricity_A3F1AB:
    dw $0003
    %spritemapEntry(0, $00, $EC, 0, 0, 2, 0, $17C)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 0, $14D)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 0, $14C)

UNUSED_Spritemap_Metroid_Electricity_A3F1BC:
    dw $0003
    %spritemapEntry(0, $00, $EC, 0, 0, 2, 0, $17D)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 0, $15D)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 0, $15C)

UNUSED_Spritemap_Metroid_Electricity_A3F1CD:
    dw $0003
    %spritemapEntry(0, $00, $EC, 0, 0, 2, 0, $17E)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 0, $16D)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 0, $16C)

UNUSED_Spritemap_Metroid_Electricity_A3F1DE:
    dw $0004
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 0, $14F)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 0, $14E)
    %spritemapEntry(0, $1F8, $F4, 0, 0, 2, 0, $13D)
    %spritemapEntry(0, $1F8, $EC, 0, 0, 2, 0, $12D)

UNUSED_Spritemap_Metroid_Electricity_A3F1F4:
    dw $0004
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 0, $15F)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 0, $15E)
    %spritemapEntry(0, $1F8, $F4, 0, 0, 2, 0, $13E)
    %spritemapEntry(0, $1F8, $EC, 0, 0, 2, 0, $12E)

UNUSED_Spritemap_Metroid_Electricity_A3F20A:
    dw $0004
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 0, $16F)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 0, $16E)
    %spritemapEntry(0, $1F8, $F4, 0, 0, 2, 0, $13F)
    %spritemapEntry(0, $1F8, $EC, 0, 0, 2, 0, $12F)

UNUSED_Spritemap_Metroid_Electricity_A3F220:
    dw $0003
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 0, $14D)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 0, $14C)
    %spritemapEntry(0, $1F8, $EC, 0, 1, 2, 0, $17C)

UNUSED_Spritemap_Metroid_Electricity_A3F231:
    dw $0003
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 0, $15D)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 0, $15C)
    %spritemapEntry(0, $1F8, $EC, 0, 1, 2, 0, $17D)

UNUSED_Spritemap_Metroid_Electricity_A3F242:
    dw $0003
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 0, $16D)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 0, $16C)
    %spritemapEntry(0, $1F8, $EC, 0, 1, 2, 0, $17E)

UNUSED_Spritemap_Metroid_Electricity_A3F253:
    dw $0004
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 0, $14F)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 0, $14E)
    %spritemapEntry(0, $00, $F4, 0, 1, 2, 0, $13D)
    %spritemapEntry(0, $00, $EC, 0, 1, 2, 0, $12D)

UNUSED_Spritemap_Metroid_Electricity_A3F269:
    dw $0004
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 0, $16F)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 0, $16E)
    %spritemapEntry(0, $00, $F4, 0, 1, 2, 0, $13E)
    %spritemapEntry(0, $00, $EC, 0, 1, 2, 0, $12E)

UNUSED_Spritemap_Metroid_Electricity_A3F27F:
    dw $0004
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 0, $15F)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 0, $15E)
    %spritemapEntry(0, $00, $F4, 0, 1, 2, 0, $13F)
    %spritemapEntry(0, $00, $EC, 0, 1, 2, 0, $12F)

UNUSED_Spritemap_Metroid_Electricity_A3F295:
    dw $0002
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 0, $14D)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 0, $14C)

UNUSED_Spritemap_Metroid_Electricity_A3F2A1:
    dw $0001
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 0, $15C)

UNUSED_Spritemap_Metroid_Electricity_A3F2A8:
    dw $0002
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 0, $16D)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 0, $16C)

UNUSED_Spritemap_Metroid_Electricity_A3F2B4:
    dw $0002
    %spritemapEntry(0, $1F8, $F4, 0, 0, 2, 0, $13D)
    %spritemapEntry(0, $1F8, $EC, 0, 0, 2, 0, $12D)

UNUSED_Spritemap_Metroid_Electricity_A3F2C0:
    dw $0002
    %spritemapEntry(0, $1F8, $F4, 0, 0, 2, 0, $13E)
    %spritemapEntry(0, $1F8, $EC, 0, 0, 2, 0, $12E)

UNUSED_Spritemap_Metroid_Electricity_A3F2CC:
    dw $0002
    %spritemapEntry(0, $1F8, $F4, 0, 0, 2, 0, $13F)
    %spritemapEntry(0, $1F8, $EC, 0, 0, 2, 0, $12F)

UNUSED_Spritemap_Metroid_Electricity_A3F2D8:
    dw $0002
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 0, $14D)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 0, $14C)

UNUSED_Spritemap_Metroid_Electricity_A3F2E4:
    dw $0002
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 0, $15D)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 0, $15C)

UNUSED_Spritemap_Metroid_Electricity_A3F2F0:
    dw $0002
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 0, $16D)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 0, $16C)

UNUSED_Spritemap_Metroid_Electricity_A3F2FC:
    dw $0001
    %spritemapEntry(0, $00, $EC, 0, 0, 2, 0, $17C)

UNUSED_Spritemap_Metroid_Electricity_A3F303:
    dw $0001
    %spritemapEntry(0, $00, $EC, 0, 0, 2, 0, $17D)

UNUSED_Spritemap_Metroid_Electricity_A3F30A:
    dw $0001
    %spritemapEntry(0, $00, $EC, 0, 0, 2, 0, $17E)
endif ; !FEATURE_KEEP_UNREFERENCED


Freespace_BankA3_F311:
; $CEF bytes
