
org $A28000


; Common to all enemy code banks

;;; $8000: Grapple AI - no interaction. Also unfreezes enemies(!) ;;;
CommonA2_GrappleAI_NoInteraction:
; Used by skultera, Draygon body, fire arc, Phantoon, etecoon, dachora and WS ghost
    JSL GrappleAI_SwitchEnemyAIToMainAI
    RTL


;;; $8005: Grapple AI - Samus latches on ;;;
CommonA2_GrappleAI_SamusLatchesOn:
; Used by gripper and Crocomire
    JSL GrappleAI_SamusLatchesOnWithGrapple
    RTL


;;; $800A: Grapple AI - kill enemy ;;;
CommonA2_GrappleAI_KillEnemy:
; Common
    JSL GrappleAI_EnemyGrappleDeath
    RTL


;;; $800F: Grapple AI - cancel grapple beam ;;;
CommonA2_GrappleAI_CancelGrappleBeam:
; Common
    JSL GrappleAI_SwitchToFrozenAI
    RTL


;;; $8014: Grapple AI - Samus latches on - no invincibility ;;;
CommonA2_GrappleAI_SamusLatchesOn_NoInvincibility:
; Used by powamp
    JSL GrappleAI_SamusLatchesOnWithGrapple_NoInvincibility
    RTL


;;; $8019: Unused. Grapple AI - Samus latches on - paralyse enemy ;;;
UNUSED_CommonA2_GrappleAI_SamusLatchesOn_ParalyzeEnemy_A28019:
    JSL GrappleAI_SamusLatchesOnWithGrapple_ParalyzeEnemy
    RTL


;;; $801E: Grapple AI - hurt Samus ;;;
CommonA2_GrappleAI_HurtSamus:
; Used by WS spark
; Hurt reaction happens in $9B:B932
    JSL GrappleAI_SwitchToFrozenAI_duplicate
    RTL


;;; $8023: Normal enemy touch AI ;;;
CommonA2_NormalEnemyTouchAI:
    JSL NormalEnemyTouchAI
    RTL


;;; $8028: Normal touch AI - no death check ;;;
CommonA2_NormalTouchAI_NoDeathCheck:
    JSL NormalEnemyTouchAI_NoDeathCheck_External
    RTL


;;; $802D: Normal enemy shot AI ;;;
CommonA2_NormalEnemyShotAI:
    JSL NormalEnemyShotAI
    RTL


;;; $8032: Normal enemy shot AI - no death check, no enemy shot graphic ;;;
CommonA2_NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic:
    JSL NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External
    RTL


;;; $8037: Normal enemy power bomb AI ;;;
CommonA2_NormalEnemyPowerBombAI:
    JSL NormalEnemyPowerBombAI
    RTL


;;; $803C: Normal enemy power bomb AI - no death check ;;;
CommonA2_NormalEnemyPowerBombAI_NoDeathCheck:
; Kraid's power bomb AI
    JSL NormalEnemyPowerBombAI_NoDeathCheck_External
    RTL


;;; $8041: Normal enemy frozen AI ;;;
CommonA2_NormalEnemyFrozenAI:
    JSL NormalEnemyFrozenAI
    RTL


;;; $8046: Creates a dud shot ;;;
CommonA2_CreateADudShot_JSL:
    JSL CreateADudShot
    RTL


;;; $804B: RTS ;;;
RTS_A2804B:
    RTS


;;; $804C: RTL ;;;
RTL_A2804C:
    RTL


;;; $804D: Spritemap - nothing ;;;
Spritemap_CommonA2_Nothing:
    dw $0000


;;; $804F: Extended spritemap - nothing ;;;
ExtendedSpritemap_CommonA2_Nothing:
    dw $0001
    dw $0000,$0000
    dw Spritemap_CommonA2_Nothing
    dw Hitbox_CommonA2_Nothing


;;; $8059: Hitbox - nothing ;;;
Hitbox_CommonA2_Nothing:
; [n entries] [[left offset] [top offset] [right offset] [bottom offset] [p touch] [p shot]]...
    dw $0001
    dw $0000,$0000,$0000,$0000
    dw CommonA2_NormalEnemyTouchAI
    dw CommonA2_NormalEnemyShotAI


;;; $8067: Instruction list - delete enemy ;;;
InstList_CommonA2_DeleteEnemy:
    dw Instruction_CommonA2_DeleteEnemy


;;; $8069: Two NOPs ;;;
NOPNOP_A28069:
; Used as palette by respawning enemy placeholder and Draygon's eye o_O
    NOP #2


;;; $806B: Instruction - Enemy.var5 = [[Y]] ;;;
Instruction_CommonA2_Enemy0FB2_InY:
; Used only by torizos (for enemy movement function) and escape etecoon (for enemy function)
    LDA.W $0000,Y : STA.W Enemy.var5,X
    INY #2
    RTL


;;; $8074: Instruction - Enemy.var5 = RTS ;;;
Instruction_CommonA2_SetEnemy0FB2ToRTS:
    LDA.W #RTS_A2807B : STA.W Enemy.var5,X
    RTL


RTS_A2807B:
    RTS


;;; $807C: Instruction - delete enemy ;;;
Instruction_CommonA2_DeleteEnemy:
    LDA.W Enemy.properties,X : ORA.W #$0200 : STA.W Enemy.properties,X
    PLA
    PEA.W ProcessEnemyInstructions_return-1
    RTL


;;; $808A: Instruction - call function [[Y]] ;;;
Instruction_CommonA2_CallFunctionInY:
    LDA.W $0000,Y : STA.B DP_Temp12
    PHY : PHX
    PEA .manualReturn-1
    JMP.W (DP_Temp12)

  .manualReturn:
    PLX : PLY
    INY #2
    RTL


;;; $809C: Instruction - call function [[Y]] with A = [[Y] + 2] ;;;
Instruction_CommonA2_CallFunctionInY_WithA:
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
UNUSED_Instruction_CommonA2_CallExternalFunctionInY_A280B5:
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
UNUSED_Inst_CommonA2_CallExternalFunctionInY_WithA_A280CE:
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
Instruction_CommonA2_GotoY:
    LDA.W $0000,Y : TAY
    RTL


;;; $80F2: Instruction - go to [[Y]] + ±[[Y]] ;;;
Instruction_CommonA2_GotoY_PlusY:
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
Instruction_CommonA2_DecrementTimer_GotoYIfNonZero:
    DEC.W Enemy.loopCounter,X : BNE Instruction_CommonA2_GotoY
    INY #2
    RTL


;;; $8110: Instruction - decrement timer and go to [[Y]] if non-zero ;;;
Instruction_CommonA2_DecrementTimer_GotoYIfNonZero_duplicate:
    DEC.W Enemy.loopCounter,X : BNE Instruction_CommonA2_GotoY
    INY #2
    RTL


;;; $8118: Instruction - decrement timer and go to [Y] + ±[[Y]] if non-zero ;;;
Instruction_CommonA2_DecrementTimer_GotoY_PlusY_IfNonZero:
    SEP #$20
    DEC.W Enemy.loopCounter,X
    REP #$20
    BNE Instruction_CommonA2_GotoY_PlusY
    INY
    RTL


;;; $8123: Instruction - timer = [[Y]] ;;;
Instruction_CommonA2_TimerInY:
    LDA.W $0000,Y : STA.W Enemy.loopCounter,X
    INY #2
    RTL


;;; $812C: Instruction - skip next instruction ;;;
Instruction_CommonA2_SkipNextInstruction:
    INY #2
    RTL


;;; $812F: Instruction - sleep ;;;
Instruction_CommonA2_Sleep:
    DEY #2
    TYA : STA.W Enemy.instList,X
    PLA
    PEA.W ProcessEnemyInstructions_return-1
    RTL


;;; $813A: Instruction - wait [[Y]] frames ;;;
Instruction_CommonA2_WaitYFrames:
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
Instruction_CommonA2_TransferYBytesInYToVRAM:
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
Instruction_CommonA2_EnableOffScreenProcessing:
    LDA.W Enemy.properties,X : ORA.W #$0800 : STA.W Enemy.properties,X
    RTL


;;; $817D: Instruction - disable off-screen processing ;;;
Instruction_CommonA2_DisableOffScreenProcessing:
    LDA.W Enemy.properties,X : AND.W #$F7FF : STA.W Enemy.properties,X
    RTL


;;; $8187: Common enemy speeds - linearly increasing ;;;
CommonA2EnemySpeeds_LinearlyIncreasing:
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
CommonA2EnemySpeeds_QuadraticallyIncreasing:
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


;;; $8687: Palette - enemy $CEBF (boyon) ;;;
Palette_Boyon:
    dw $3800,$4BBE,$06B9,$00EA,$0065,$173A,$0276,$01F2
    dw $014D,$0000,$0000,$0000,$0000,$0000,$0000,$0000


;;; $86A7: Instruction list - idle ;;;
InstList_Boyon_Idle_0:
    dw Instruction_Common_DisableOffScreenProcessing
    dw RTL_A288C5

InstList_Boyon_Idle_1:
    dw $000A,Spritemap_Boyon_Idle_0
    dw $000A,Spritemap_Boyon_Idle_1
    dw $000A,Spritemap_Boyon_Idle_2
    dw $000A,Spritemap_Boyon_Idle_1
    dw Instruction_Common_GotoY
    dw InstList_Boyon_Idle_1


;;; $86BF: Instruction list - bouncing ;;;
InstList_Boyon_Bouncing_0:
    dw Instruction_Common_EnableOffScreenProcessing
    dw Instruction_Boyon_StartBounce

InstList_Boyon_Bouncing_1:
    dw $0005,Spritemap_Boyon_Bouncing_0
    dw $0005,Spritemap_Boyon_Bouncing_1
    dw $0005,Spritemap_Boyon_Bouncing_2
    dw $0005,Spritemap_Boyon_Bouncing_3
    dw $0005,Spritemap_Boyon_Bouncing_2
    dw $0005,Spritemap_Boyon_Bouncing_1
    dw Instruction_Common_GotoY
    dw InstList_Boyon_Bouncing_1


;;; $86DF: Boyon data ;;;
BoyonData:
  .speedMultipliers:
; Speed multipliers. Indexed by [enemy parameter 1 low] * 2
    dw $0001,$0002,$0004,$0008,$000A,$000D,$0010,$0014

  .jumpHeights:
; Jump heights. Unit 1/100h px. Indexed by [enemy parameter 1 high] * 2
    dw $3000,$4000,$5000,$6000,$7000,$8000,$9000,$A000
    dw $B000

  .speedTable:
; Speed table. k (k+1) / 2 (sum of 0..k)
    db $00,$01,$03,$06,$0A,$0F,$15,$1C,$24,$2D,$37,$42,$4E,$5B,$69,$78
    db $88,$99,$AB,$BE,$D2,$E7,$FD

  .bounceFunctionPointers:
; Bounce movement functions
    dw Function_Boyon_Falling
    dw Function_Boyon_Rising


;;; $871C: Initialisation AI - enemy $CEBF (boyon) ;;;
InitAI_Boyon:
    LDX.W EnemyIndex
    LDA.W #Spritemap_Common_Nothing : STA.W Enemy.spritemap,X
    JSR SetBoyonInstList
    LDA.W #$0001 : STA.L Boyon.bounceMovementIndex,X
    LDA.W Enemy.init0,X : AND.W #$00FF : ASL : TAY
    LDA.W BoyonData_speedMultipliers,Y : STA.W Boyon.speedMultiplier,X
    LDA.W Enemy.init0+1,X : AND.W #$00FF : ASL : TAY
    LDA.W BoyonData_jumpHeights,Y : STA.W Boyon.jumpHeight,X
    STZ.W Boyon.distanceAccumulator,X : STZ.W Boyon.speedTableIndex,X : STZ.W Boyon.bouncingIndex,X
    RTL


;;; $8755: Calculate initial bounce speed ;;;
CalculateInitialBounceSpeed:
    PHP

  .loop:
    LDY.W Boyon.speedTableIndex,X
    SEP #$20
    LDA.W BoyonData_speedTable,Y
    CPY.W #$0017 : BMI +
    LDA.B #$FF

+   STA.W $4202
    LDA.W Boyon.speedMultiplier,X : STA.W $4203
    NOP #3
    REP #$20
    LDA.W $4216 : STA.W Boyon.speed,X
    CLC : ADC.W Boyon.distanceAccumulator,X : STA.W Boyon.distanceAccumulator,X
    INC.W Boyon.speedTableIndex,X
    CMP.W Boyon.jumpHeight,X : BMI .loop
    LDA.W Boyon.speedTableIndex,X : STA.L Boyon.initialBounceSpeedTableIndex,X
    LDA.W #$0001 : STA.L Boyon.bounceDisableFlag,X : STA.L Boyon.idleDisableFlag,X
    PLP
    RTS


;;; $879C: Main AI - enemy $CEBF (boyon) ;;;
MainAI_Boyon:
    LDX.W EnemyIndex
    LDA.L Boyon.bounceSpeedCalculatedFlag,X : BNE .notJumping
    JSR CalculateInitialBounceSpeed
    LDA.W #$0001 : STA.L Boyon.bounceSpeedCalculatedFlag,X
    RTL

  .notJumping:
    LDA.W Boyon.speedMultiplier,X : STA.L Boyon.speedMultiplierMirror,X
    JSR CheckIfSamusIsInProximity
    BNE .SamusInProximity
    LDA.L Boyon.bounceDisableFlag,X : BEQ .bouncing
    LDA.L Boyon.idleDisableFlag,X : BNE .return
    LDA.W #$0001 : STA.L Boyon.idleDisableFlag,X
    JSR SetBoyonInstList
    BRA .return

  .SamusInProximity:
    LDA.W #$0000 : STA.L Boyon.bounceDisableFlag,X : STA.L Boyon.idleDisableFlag,X
    LDA.W Boyon.bouncingIndex,X : BNE .bouncing
    LDA.W #$0001 : STA.W Boyon.bouncingIndex,X
    JSR SetBoyonBouncingInstList

  .bouncing:
    LDX.W EnemyIndex
    LDA.L Boyon.speedMultiplierMirror,X : STA.W Boyon.speedMultiplier,X
    LDA.L Boyon.bounceMovementIndex,X : ASL : TAX
    JSR.W (BoyonData_bounceFunctionPointers,X)

  .return:
    RTL


;;; $8801: Boyon bounce movement - falling ;;;
Function_Boyon_Falling:
    LDX.W EnemyIndex
    INC.W Boyon.speedTableIndex,X
    LDY.W Boyon.speedTableIndex,X
    SEP #$20
    LDA.W BoyonData_speedTable,Y
    CPY.W #$0017 : BMI .lessThan17
    LDA.B #$FF

  .lessThan17:
    STA.W $4202
    LDA.W Boyon.speedMultiplier,X : STA.W $4203
    NOP #3
    REP #$20
    LDA.W $4216 : STA.W Boyon.speed,X
    XBA : AND.W #$00FF : CLC : ADC.W Enemy.YPosition,X : STA.W Enemy.YPosition,X
    LDA.W Boyon.speedTableIndex,X : CMP.L Boyon.initialBounceSpeedTableIndex,X : BMI .return
    LDA.W #$0001 : STA.L Boyon.bounceMovementIndex,X
    LDA.W #$0001 : STA.L Boyon.bounceDisableFlag,X
    STZ.W Boyon.bouncingIndex,X

  .return:
    RTS


;;; $8850: Boyon bounce movement - rising ;;;
Function_Boyon_Rising:
    LDX.W EnemyIndex
    LDY.W Boyon.speedTableIndex,X
    SEP #$20
    LDA.W BoyonData_speedTable,Y
    CPY.W #$0017 : BMI .lessThan17
    LDA.B #$FF

  .lessThan17:
    STA.W $4202
    LDA.W Boyon.speedMultiplier,X : STA.W $4203
    NOP #3
    REP #$20
    LDA.W $4216 : STA.W Boyon.speed,X
    XBA : AND.W #$00FF : EOR.W #$FFFF : INC
    CLC : ADC.W Enemy.YPosition,X : STA.W Enemy.YPosition,X
    DEC.W Boyon.speedTableIndex,X : BMI .doneJumping
    BRA .return

  .doneJumping:
    LDA.W #$0000 : STA.L Boyon.bounceMovementIndex,X

  .return:
    RTS


;;; $8894: Check if Samus is in proximity ;;;
CheckIfSamusIsInProximity:
;; Returns:
;;     Zero: Clear if Samus is in proximity, set otherwise
    LDX.W EnemyIndex
    LDA.W Enemy.init1,X
    JSL IsSamusWithinAPixelColumnsOfEnemy
    RTS


;;; $889F: Set boyon idle instruction list ;;;
SetBoyonInstList:
    LDX.W EnemyIndex
    LDA.W #InstList_Boyon_Idle_0 : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    RTS


;;; $88B2: Set boyon bouncing instruction list ;;;
SetBoyonBouncingInstList:
    LDX.W EnemyIndex
    LDA.W #InstList_Boyon_Bouncing_0 : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    RTS


;;; $88C5: RTL. Instruction - nothing ;;;
RTL_A288C5:
    RTL


;;; $88C6: Instruction - start bounce ;;;
Instruction_Boyon_StartBounce:
    LDX.W EnemyIndex
    LDA.W #$0000 : STA.L Boyon.bounceDisableFlag,X
    LDA.W #$000E
    JSL QueueSound_Lib2_Max6
    RTL


;;; $88D8: RTL ;;;
RTL_A288D8:
    RTL


;;; $88D9: RTL ;;;
RTL_A288D9:
    RTL


;;; $88DA: Spritemaps - boyon ;;;
Spritemap_Boyon_Idle_0:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 0, $100)

Spritemap_Boyon_Idle_1:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 0, $102)

Spritemap_Boyon_Idle_2:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 0, $104)

Spritemap_Boyon_Bouncing_0:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 0, $106)

Spritemap_Boyon_Bouncing_1:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 0, $108)

Spritemap_Boyon_Bouncing_2:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 0, $10A)

Spritemap_Boyon_Bouncing_3:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 0, $10C)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Boyon_A2890B:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 0, $10E)
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $8912: Palette - enemy $CEFF (mini-Crocomire) ;;;
Palette_Stoke:
    dw $3800,$3DB3,$292E,$1486,$1840,$3D92,$38CA,$1C61
    dw $24A7,$24A7,$2063,$1840,$0800,$0000,$0000,$0000


;;; $8932: Instruction list - moving left ;;;
InstList_Stoke_MovingLeft_0:
    dw Instruction_Stoke_SetMovingLeft

InstList_Stoke_MovingLeft_1:
    dw $0008,Spritemap_Stoke_MovingLeft_0
    dw $0010,Spritemap_Stoke_MovingLeft_1
    dw $0008,Spritemap_Stoke_MovingLeft_2
    dw $0008,Spritemap_Stoke_MovingLeft_3
    dw Instruction_Common_GotoY
    dw InstList_Stoke_MovingLeft_1


;;; $8948: Instruction list - attacking left ;;;
InstList_Stoke_AttackingLeft:
    dw $0010,Spritemap_Stoke_MovingLeft_2
    dw Instruction_Stoke_SpawnProjectileWithDirectionInY,$0000
    dw $0010,Spritemap_Stoke_AttackingLeft
    dw Instruction_Common_GotoY
    dw InstList_Stoke_MovingLeft_0


;;; $8958: Instruction list - moving right ;;;
InstList_Stoke_MovingRight_0:
    dw Instruction_Stoke_SetMovingRight

InstList_Stoke_MovingRight_1:
    dw $0008,Spritemap_Stoke_MovingRight_0
    dw $0010,Spritemap_Stoke_MovingRight_1
    dw $0008,Spritemap_Stoke_MovingRight_2
    dw $0008,Spritemap_Stoke_MovingRight_3
    dw Instruction_Common_GotoY
    dw InstList_Stoke_MovingRight_1


;;; $896E: Instruction list - attacking right ;;;
InstList_Stoke_AttackingRight:
    dw $0010,Spritemap_Stoke_MovingRight_2
    dw Instruction_Stoke_SpawnProjectileWithDirectionInY,$0001
    dw $0010,Spritemap_Stoke_AttackingRight
    dw Instruction_Common_GotoY
    dw InstList_Stoke_MovingRight_0


;;; $897E: Instruction - spawn mini-Crocomire projectile with direction [[Y]] ;;;
Instruction_Stoke_SpawnProjectileWithDirectionInY:
    PHY
    LDA.W $0000,Y
    LDX.W EnemyIndex
    LDY.W #UNUSED_EnemyProjectile_Stoke_86DBF2
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    PLY : INY #2
    RTL


;;; $8990: Instruction - set moving left ;;;
Instruction_Stoke_SetMovingLeft:
    LDX.W EnemyIndex
    LDA.W #Function_Stoke_MovingLeft : STA.W Stoke.function,X
    STZ.W Stoke.direction,X
    RTL


;;; $899D: Instruction - set moving right ;;;
Instruction_Stoke_SetMovingRight:
    LDX.W EnemyIndex
    LDA.W #Function_Stoke_MovingRight : STA.W Stoke.function,X
    LDA.W #$0001 : STA.W Stoke.direction,X
    RTL


;;; $89AD: Initialisation AI - enemy $CEFF (mini-Crocomire) ;;;
InitAI_Stoke:
    LDX.W EnemyIndex
    LDA.W #Spritemap_Common_Nothing : STA.W Enemy.spritemap,X
    LDA.W Enemy.init1,X : ASL #3 : TAY
    LDA.W CommonEnemySpeeds_LinearlyIncreasing,Y : STA.W Stoke.rightVelocity,X
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+2,Y : STA.W Stoke.rightSubVelocity,X
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+4,Y : STA.W Stoke.leftVelocity,X
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+6,Y : STA.W Stoke.leftSubVelocity,X
    JSR SetStokeMovingLeftInstList
    LDA.W #Function_Stoke_MovingLeft : STA.W Stoke.function,X
    LDA.W Enemy.init0,X : STA.W Stoke.direction,X : BEQ .return
    JSR SetStokeMovingRightInstList
    LDA.W #Function_Stoke_MovingRight : STA.W Stoke.function,X

  .return:
    RTL


;;; $89F0: Main AI - enemy $CEFF (mini-Crocomire) ;;;
MainAI_Stoke:
    LDX.W EnemyIndex
    JSR.W (Stoke.function,X)
    RTL


;;; $89F7: Set mini-Crocomire moving left instruction list ;;;
SetStokeMovingLeftInstList:
    LDX.W EnemyIndex
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    LDA.W #InstList_Stoke_MovingLeft_0 : STA.W Enemy.instList,X
    RTS


;;; $8A0A: Set mini-Crocomire attacking left instruction list ;;;
SetStokeAttackingLeftInstList:
    LDX.W EnemyIndex
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    LDA.W #InstList_Stoke_AttackingLeft : STA.W Enemy.instList,X
    RTS


;;; $8A1D: Set mini-Crocomire moving right instruction list ;;;
SetStokeMovingRightInstList:
    LDX.W EnemyIndex
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    LDA.W #InstList_Stoke_MovingRight_0 : STA.W Enemy.instList,X
    RTS


;;; $8A30: Set mini-Crocomire attacking right instruction list ;;;
SetStokeAttackingRightInstList:
    LDX.W EnemyIndex
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    LDA.W #InstList_Stoke_AttackingRight : STA.W Enemy.instList,X
    RTS


;;; $8A43: Mini-Crocomire function - moving left ;;;
Function_Stoke_MovingLeft:
    LDX.W EnemyIndex
    LDA.W Stoke.leftVelocity,X : STA.B DP_Temp14
    LDA.W Stoke.leftSubVelocity,X : STA.B DP_Temp12
    JSR StokeMovement
    JSR DecideWhetherToAttack
    BCC .return
    JSR SetStokeAttackingLeftInstList

  .return:
    RTS


;;; $8A5C: Mini-Crocomire function - moving right ;;;
Function_Stoke_MovingRight:
    LDX.W EnemyIndex
    LDA.W Stoke.rightVelocity,X : STA.B DP_Temp14
    LDA.W Stoke.rightSubVelocity,X : STA.B DP_Temp12
    JSR StokeMovement
    JSR DecideWhetherToAttack
    BCC .return
    JSR SetStokeAttackingRightInstList

  .return:
    RTS


;;; $8A75: RTS ;;;
RTS_A28A75:
    RTS


;;; $8A76: Mini-Crocomire movement ;;;
StokeMovement:
;; Parameters:
;;     $14.$12: X velocity
    LDX.W EnemyIndex
    JSL MoveEnemyRightBy_14_12_IgnoreSlopes
    BCC .notCollidedWithWall
    JSR TurnStokeAround
    BRA .return

  .notCollidedWithWall:
    LDA.W #$0002 : STA.B DP_Temp14
    STZ.B DP_Temp12
    JSL CheckForVerticalSolidBlockCollision
    BCS .return
    JSR TurnStokeAround

  .return:
    RTS


;;; $8A95: Turn mini-Crocomire around ;;;
TurnStokeAround:
    LDX.W EnemyIndex
    JSR SetStokeMovingLeftInstList
    LDA.W Stoke.direction,X : EOR.W #$0001 : BEQ .return
    JSR SetStokeMovingRightInstList

  .return:
    RTS


;;; $8AA7: Decide whether to attack ;;;
DecideWhetherToAttack:
;; Returns:
;;     Carry: Set if decided attack, clear otherwise
    LDX.W EnemyIndex
    JSL GenerateRandomNumber
    LDA.W RandomNumberSeed : CLC : ADC.W Enemy.frameCounter,X
    AND.W #$00FF : CMP.W #$0002 : BPL .returnNoAttack
    LDA.W #RTS_A28A75 : STA.W Stoke.function,X
    SEC
    BRA .return

  .returnNoAttack:
    CLC

  .return:
    RTS


;;; $8AC8: RTL ;;;
RTL_A28AC8:
    RTL


;;; $8AC9: RTL ;;;
RTL_A28AC9:
    RTL


;;; $8ACA: Spritemaps - mini-Crocomire ;;;
Spritemap_Stoke_MovingLeft_0:
    dw $0002
    %spritemapEntry(1, $43FE, $F8, 0, 0, 2, 0, $101)
    %spritemapEntry(1, $43F6, $F8, 0, 0, 2, 0, $100)

Spritemap_Stoke_MovingLeft_1:
    dw $0003
    %spritemapEntry(0, $1FE, $F0, 0, 0, 2, 0, $10F)
    %spritemapEntry(1, $43FE, $F8, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $43F6, $F8, 0, 0, 2, 0, $103)

Spritemap_Stoke_MovingLeft_2:
    dw $0002
    %spritemapEntry(1, $43F6, $F8, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $43FE, $F8, 0, 0, 2, 0, $101)

Spritemap_Stoke_MovingLeft_3:
    dw $0002
    %spritemapEntry(1, $43FE, $F8, 0, 0, 2, 0, $101)
    %spritemapEntry(1, $43F6, $F8, 0, 0, 2, 0, $108)

Spritemap_Stoke_AttackingLeft:
    dw $0004
    %spritemapEntry(0, $1FE, $F0, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $1F6, $F0, 0, 0, 2, 0, $10D)
    %spritemapEntry(1, $43FE, $F8, 0, 0, 2, 0, $10B)
    %spritemapEntry(1, $43F6, $F8, 0, 0, 2, 0, $10A)

Spritemap_Stoke_MovingRight_0:
    dw $0002
    %spritemapEntry(1, $43F2, $F8, 0, 1, 2, 0, $101)
    %spritemapEntry(1, $43FA, $F8, 0, 1, 2, 0, $100)

Spritemap_Stoke_MovingRight_1:
    dw $0003
    %spritemapEntry(0, $1FA, $F0, 0, 1, 2, 0, $10F)
    %spritemapEntry(1, $43F2, $F8, 0, 1, 2, 0, $104)
    %spritemapEntry(1, $43FA, $F8, 0, 1, 2, 0, $103)

Spritemap_Stoke_MovingRight_2:
    dw $0002
    %spritemapEntry(1, $43FA, $F8, 0, 1, 2, 0, $106)
    %spritemapEntry(1, $43F2, $F8, 0, 1, 2, 0, $101)

Spritemap_Stoke_MovingRight_3:
    dw $0002
    %spritemapEntry(1, $43F2, $F8, 0, 1, 2, 0, $101)
    %spritemapEntry(1, $43FA, $F8, 0, 1, 2, 0, $108)

Spritemap_Stoke_AttackingRight:
    dw $0004
    %spritemapEntry(0, $1FA, $F0, 0, 1, 2, 0, $10E)
    %spritemapEntry(0, $02, $F0, 0, 1, 2, 0, $10D)
    %spritemapEntry(1, $43F2, $F8, 0, 1, 2, 0, $10B)
    %spritemapEntry(1, $43FA, $F8, 0, 1, 2, 0, $10A)


;;; $8B60: Palette - enemy $CF3F/$CF7F (tatori) ;;;
Palette_MamaTurtle_BabyTurtle:
    dw $3800,$4B9C,$3694,$08E7,$0884,$42F7,$2A52,$19AD
    dw $1129,$7FFF,$033B,$0216,$0113,$7FFF,$03FF,$000D


;;; $8B80: Instruction list - mini-tatori - crawling left ;;;
InstList_BabyTurtle_CrawlingLeft:
    dw Instruction_BabyTurtle_Crawl
    dw $000A,Spritemap_BabyTurtle_FacingLeft_0
    dw $000A,Spritemap_BabyTurtle_FacingLeft_1
    dw Instruction_BabyTurtle_Crawl
    dw $000A,Spritemap_BabyTurtle_FacingLeft_2
    dw $000A,Spritemap_BabyTurtle_FacingLeft_3
    dw Instruction_BabyTurtle_Crawl
    dw $000A,Spritemap_BabyTurtle_FacingLeft_0
    dw $000A,Spritemap_BabyTurtle_FacingLeft_1
    dw Instruction_BabyTurtle_Crawl
    dw $000A,Spritemap_BabyTurtle_FacingLeft_2
    dw $000A,Spritemap_BabyTurtle_FacingLeft_3
    dw Instruction_BabyTurtle_Crawl
    dw $000A,Spritemap_BabyTurtle_FacingLeft_0
    dw $000A,Spritemap_BabyTurtle_FacingLeft_1
    dw Instruction_BabyTurtle_Crawl
    dw $000A,Spritemap_BabyTurtle_FacingLeft_5
    dw $000A,Spritemap_BabyTurtle_FacingLeft_6
    dw Instruction_BabyTurtle_Crawl
    dw $000A,Spritemap_BabyTurtle_FacingLeft_0
    dw $000A,Spritemap_BabyTurtle_FacingLeft_4
    dw Instruction_BabyTurtle_Crawl
    dw $000A,Spritemap_BabyTurtle_FacingLeft_5
    dw $000A,Spritemap_BabyTurtle_FacingLeft_6
    dw Instruction_BabyTurtle_LoopOrTurnAroundIfMovedTooFar


;;; $8BD2: Instruction list - mini-tatori - spinning ;;;
InstList_BabyTurtle_Spinning:
    dw $0001,Spritemap_BabyTurtle_FacingLeft_7
    dw Instruction_MamaTurtle_PlaySpinningSFX
    dw $0004,Spritemap_BabyTurtle_FacingLeft_7
    dw $0005,Spritemap_BabyTurtle_FacingLeft_8
    dw $0005,Spritemap_BabyTurtle_FacingLeft_9
    dw $0005,Spritemap_BabyTurtle_FacingLeft_A
    dw Instruction_BabyTurtle_Set_Spinning_Stoppable
    dw Instruction_Common_GotoY
    dw InstList_BabyTurtle_Spinning


if !FEATURE_KEEP_UNREFERENCED
;;; $8BEE: Unused. Instruction list ;;;
UNUSED_InstList_A28BEE:
    dw $0010,Spritemap_MamaTurtle_FacingLeft_3
    dw $0010,Spritemap_MamaTurtle_FacingLeft_4
    dw $0010,Spritemap_MamaTurtle_FacingLeft_5
    dw $0010,Spritemap_MamaTurtle_FacingLeft_6
    dw Instruction_Common_GotoY
    dw UNUSED_InstList_A28BEE
endif ; !FEATURE_KEEP_UNREFERENCED


InstList_MamaTurtle_Spinning:
;;; $8C02: Instruction list - tatori - spinning ;;;
    dw $0001,Spritemap_MamaTurtle_FacingLeft_0
    dw Instruction_MamaTurtle_PlaySpinningSFX
    dw $0004,Spritemap_MamaTurtle_FacingLeft_0
    dw $0005,Spritemap_MamaTurtle_FacingLeft_8
    dw $0005,Spritemap_MamaTurtle_FacingLeft_7
    dw $0005,Spritemap_MamaTurtle_FacingLeft_8
    dw Instruction_Common_GotoY
    dw InstList_MamaTurtle_Spinning


;;; $8C1C: Instruction list - tatori - facing left - enter shell ;;;
InstList_MamaTurtle_FacingLeft_EnterShell:
    dw $0020,Spritemap_MamaTurtle_FacingLeft_3
    dw $0005,Spritemap_MamaTurtle_FacingLeft_2
    dw $0005,Spritemap_MamaTurtle_FacingLeft_1
    dw Instruction_MamaTurtle_RiseToHoverRightwards
    dw $7FFF,Spritemap_MamaTurtle_FacingLeft_0
    dw Instruction_Common_Sleep


;;; $8C30: Instruction list - mini-tatori - facing left - hiding ;;;
InstList_BabyTurtle_FacingLeft_Hiding:
    dw $0005,Spritemap_BabyTurtle_FacingLeft_4
    dw $0005,Spritemap_BabyTurtle_FacingLeft_5
    dw $0040,Spritemap_BabyTurtle_FacingLeft_7
    dw Instruction_BabyTurtle_LeaveShell
    dw $7FFF,Spritemap_BabyTurtle_FacingLeft_7
    dw Instruction_Common_Sleep


;;; $8C44: Instruction list - tatori - asleep ;;;
InstList_MamaTurtle_Asleep:
    dw $7FFF,Spritemap_MamaTurtle_FacingLeft_0
    dw Instruction_Common_Sleep


;;; $8C4A: Instruction list - tatori - facing left - leave shell ;;;
InstList_MamaTurtle_FacingLeft_LeaveShell:
    dw $0010,Spritemap_MamaTurtle_FacingLeft_0
    dw $0005,Spritemap_MamaTurtle_FacingLeft_1
    dw $0005,Spritemap_MamaTurtle_FacingLeft_2
    dw $0060,Spritemap_MamaTurtle_FacingLeft_3
    dw Instruction_MamaTurtle_EnterShell
    dw $7FFF,Spritemap_MamaTurtle_FacingLeft_3
    dw Instruction_Common_Sleep


;;; $8C62: Instruction list - mini-tatori - facing left - leave shell ;;;
InstList_BabyTurtle_FacingLeft_LeaveShell:
    dw $0005,Spritemap_BabyTurtle_FacingLeft_5
    dw $002F,Spritemap_BabyTurtle_FacingLeft_4
    dw Instruction_BabyTurtle_LeftShell
    dw $002F,Spritemap_BabyTurtle_FacingLeft_4
    dw Instruction_Common_Sleep


;;; $8C72: Instruction list - mini-tatori - crawling right ;;;
InstList_BabyTurtle_CrawlingRight:
    dw Instruction_BabyTurtle_Crawl
    dw $000A,Spritemap_BabyTurtle_FacingRight_B
    dw $000A,Spritemap_BabyTurtle_FacingRight_C
    dw Instruction_BabyTurtle_Crawl
    dw $000A,Spritemap_BabyTurtle_FacingRight_D
    dw $000A,Spritemap_BabyTurtle_FacingRight_E
    dw Instruction_BabyTurtle_Crawl
    dw $000A,Spritemap_BabyTurtle_FacingRight_B
    dw $000A,Spritemap_BabyTurtle_FacingRight_C
    dw Instruction_BabyTurtle_Crawl
    dw $000A,Spritemap_BabyTurtle_FacingRight_D
    dw $000A,Spritemap_BabyTurtle_FacingRight_E
    dw Instruction_BabyTurtle_Crawl
    dw $000A,Spritemap_BabyTurtle_FacingRight_B
    dw $000A,Spritemap_BabyTurtle_FacingRight_C
    dw Instruction_BabyTurtle_Crawl
    dw $000A,Spritemap_BabyTurtle_FacingRight_10
    dw $000A,Spritemap_BabyTurtle_FacingRight_11
    dw Instruction_BabyTurtle_Crawl
    dw $000A,Spritemap_BabyTurtle_FacingRight_B
    dw $000A,Spritemap_BabyTurtle_FacingRight_F
    dw Instruction_BabyTurtle_Crawl
    dw $000A,Spritemap_BabyTurtle_FacingRight_10
    dw $000A,Spritemap_BabyTurtle_FacingRight_11
    dw Instruction_BabyTurtle_LoopOrTurnAroundIfMovedTooFar


if !FEATURE_KEEP_UNREFERENCED
;;; $8CC4: Unused. Instruction list ;;;
UNUSED_InstList_A28CC4:
    dw $0005,Spritemap_BabyTurtle_FacingRight_12
    dw $0005,Spritemap_BabyTurtle_FacingRight_13
    dw $0005,Spritemap_BabyTurtle_FacingRight_14
    dw $0005,Spritemap_BabyTurtle_FacingRight_15
    dw Instruction_Common_GotoY
    dw UNUSED_InstList_A28CC4


;;; $8CD8: Unused. Instruction list ;;;
UNUSED_InstList_A28CD8:
    dw $0010,Spritemap_MamaTurtle_FacingRight_C
    dw $0010,Spritemap_MamaTurtle_FacingRight_D
    dw $0010,Spritemap_MamaTurtle_FacingRight_E
    dw $0010,Spritemap_MamaTurtle_FacingRight_F
    dw Instruction_Common_GotoY
    dw UNUSED_InstList_A28CD8


;;; $8CEC: Unused. Instruction list ;;;
UNUSED_InstList_A28CEC:
    dw $0005,Spritemap_MamaTurtle_FacingRight_9
    dw $0005,Spritemap_MamaTurtle_FacingRight_11
    dw $0005,Spritemap_MamaTurtle_FacingRight_10
    dw $0005,Spritemap_MamaTurtle_FacingRight_11
    dw Instruction_Common_GotoY
    dw UNUSED_InstList_A28CEC
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $8D00: Instruction list - tatori - facing right - enter shell ;;;
InstList_MamaTurtle_FacingRight_EnterShell:
    dw $0001,Spritemap_MamaTurtle_FacingRight_C
    dw $0005,Spritemap_MamaTurtle_FacingRight_B
    dw $0005,Spritemap_MamaTurtle_FacingRight_A
    dw Instruction_MamaTurtle_RiseToHoverLeftwards
    dw $7FFF,Spritemap_MamaTurtle_FacingRight_9
    dw Instruction_Common_Sleep


;;; $8D14: Instruction list - mini-tatori - facing right - hiding ;;;
InstList_BabyTurtle_FacingRight_Hiding:
    dw $0005,Spritemap_BabyTurtle_FacingRight_F
    dw $0005,Spritemap_BabyTurtle_FacingRight_10
    dw $0040,Spritemap_BabyTurtle_FacingRight_12
    dw Instruction_BabyTurtle_LeaveShell
    dw $7FFF,Spritemap_BabyTurtle_FacingRight_12
    dw Instruction_Common_Sleep


;;; $8D28: Instruction list - tatori - facing right - leave shell ;;;
InstList_MamaTurtle_FacingRight_LeaveShell:
    dw $0010,Spritemap_MamaTurtle_FacingRight_9
    dw $0005,Spritemap_MamaTurtle_FacingRight_A
    dw $0005,Spritemap_MamaTurtle_FacingRight_B
    dw $0060,Spritemap_MamaTurtle_FacingRight_C
    dw Instruction_MamaTurtle_EnterShell
    dw $7FFF,Spritemap_MamaTurtle_FacingRight_C
    dw Instruction_Common_Sleep


;;; $8D40: Instruction list - mini-tatori - facing right - leave shell ;;;
InstList_BabyTurtle_FacingRight_LeaveShell:
    dw $0005,Spritemap_BabyTurtle_FacingLeft_5
    dw $002F,Spritemap_BabyTurtle_FacingLeft_4
    dw Instruction_BabyTurtle_LeftShell
    dw $002F,Spritemap_BabyTurtle_FacingLeft_4
    dw Instruction_Common_Sleep


;;; $8D50: Tatori data ;;;
BabyTurtleConstants_travelDistance:
    dw $0030 ; Max mini-tatori travel distance

MamaTurtleConstants:
  .asleepFlag:
    dw $0001 ; 1. Used as value to set asleep flag to
  .unknown:
    dw $0020 ; Unknown. Used as value for a bugged store operation
  .HoveringXAcceleration_subAcceleration:
    dw $F000 ; Hovering X acceleration
  .HoveringXAcceleration_acceleration:
    dw       $FFFF ; Moving left
    dw $1000,$0000 ; Moving right
  .maxHoveringXSpeed:
    dw $0003 ; Max hovering X speed
  .peakYPosition:
    dw $01E8 ; Peak Y position
  .risingToPeakSpeed:
    dw $0007 ; Rising to peak speed
  .hoveringAtPeakPosition:
    dw $001E ; Hovering at peak duration
  .maxFallingYSpeed:
    dw $0004 ; Max falling Y speed

BabyTurtleConstants_maxSpinningLeftVelocity:
    dw $FFFD ; Mini-tatori max spinning left velocity

BabyTurtleConstants_maxSpinningRightVelocity:
    dw $0003 ; Mini-tatori max spinning right velocity


;;; $8D6C: Initialisation AI - enemy $CF3F (tatori) ;;;
InitAI_MamaTurtle:
    LDX.W EnemyIndex
    LDA.W Enemy.properties,X : ORA.W #$2000 : STA.W Enemy.properties,X
    LDA.W #Spritemap_Common_Nothing : STA.W Enemy.spritemap,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X : STZ.W Enemy.YHitboxRadius,X
    LDA.W #InstList_MamaTurtle_Asleep : STA.W Enemy.instList,X
    LDA.W #Function_MamaTurtle_Initial : STA.W MamaTurtle.function,X
    LDA.W MamaTurtleConstants_asleepFlag : STA.W MamaTurtle.asleepFlag,X
    RTL


;;; $8D9D: Initialisation AI - enemy $CF7F (mini-tatori) ;;;
InitAI_BabyTurtle:
    LDX.W EnemyIndex
    LDA.W Enemy.XPosition,X : STA.W BabyTurtle.spawnXPosition,X
    LDA.W Enemy.YPosition,X : SEC : SBC.W Enemy.YHitboxRadius,X : STA.W BabyTurtle.spawnTopBoundary,X
    LDA.W #Function_BabyTurtle_Crawling_NotCarryingSamus : STA.W MamaTurtle.function,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    LDY.W #InstList_BabyTurtle_CrawlingLeft
    LDA.W Enemy.init0,X : STA.W MamaTurtle.XVelocity,X : BMI .keepPointer
    LDY.W #InstList_BabyTurtle_CrawlingRight

  .keepPointer:
    TYA : STA.W Enemy.instList,X
    RTL


;;; $8DD2: Main AI - enemy $CF3F (tatori) ;;;
MainAI_MamaTurtle:
    LDX.W EnemyIndex
    JMP.W (MamaTurtle.function,X)


;;; $8DD8: Tatori function - initial ;;;
Function_MamaTurtle_Initial:
    LDA.W Enemy.palette,X
    STA.W Enemy[1].palette,X : STA.W Enemy[2].palette,X
    STA.W Enemy[3].palette,X : STA.W Enemy[4].palette,X
    LDA.W Enemy.GFXOffset,X
    STA.W Enemy[1].GFXOffset,X : STA.W Enemy[2].GFXOffset,X
    STA.W Enemy[3].GFXOffset,X : STA.W Enemy[4].GFXOffset,X
    TXA
    STA.W Enemy[1].var1,X : STA.W Enemy[2].var1,X
    STA.W Enemy[3].var1,X : STA.W Enemy[4].var1,X
    LDA.W #Function_MamaTurtle_Asleep : STA.W MamaTurtle.function,X
; fallthrough to RTL_A28E09


RTL_A28E09:
    RTL


;;; $8E0A: Tatori function - asleep ;;;
Function_MamaTurtle_Asleep:
    LDA.W MamaTurtle.asleepFlag,X : BNE .asleep
    LDA.W #Function_MamaTurtle_LeaveShell : STA.W MamaTurtle.function,X
    LDA.W Enemy.properties,X : AND.W #$FBFF : STA.W Enemy.properties,X
    RTL

  .asleep:
    STZ.W Enemy.YHitboxRadius,X
    LDA.W Enemy.XPosition,X : SEC : SBC.W SamusXPosition : PHP : BPL +
    EOR.W #$FFFF : INC

+   CMP.W #$0018 : BPL .returnPLP
    PLP : BPL .SamusToTheRight
    CLC : ADC.W #$0018

  .SamusToTheRight:
    ASL : TAX
    LDA.W SleepingMamaTurtleShellShape,X
    LDX.W EnemyIndex
    EOR.W #$FFFF : INC : STA.W Enemy.YHitboxRadius,X
    LDA.W Enemy.properties,X : ORA.W #$8000 : STA.W Enemy.properties,X
    JSL CheckIfEnemyIsTouchingSamusFromBelow
    AND.W #$FFFF : BEQ .return
    LDA.W Enemy.YPosition,X : SEC : SBC.W Enemy.YHitboxRadius,X : STA.B DP_Temp12
    LDA.W SamusYPosition : CLC : ADC.W SamusYRadius
    SEC : SBC.B DP_Temp12 : BMI .return
    EOR.W #$FFFF : INC
    CLC : ADC.W ExtraSamusYDisplacement : STA.W ExtraSamusYDisplacement

  .return:
    RTL

  .returnPLP:
    PLP
    RTL


;;; $8E80: Sleeping tatori shell shape ;;;
SleepingMamaTurtleShellShape:
; Y pixel offsets from center. Indexed by X distance from center
    dw $FFF0,$FFF0,$FFF0,$FFF0,$FFF1,$FFF1,$FFF1,$FFF1
    dw $FFF1,$FFF2,$FFF3,$FFF3,$FFF4,$FFF5,$FFF6,$FFF7
    dw $FFF8,$FFF9,$FFFA,$FFFB,$FFFC,$FFFC,$0000,$0000
    dw $FFF0,$FFF0,$FFF0,$FFF1,$FFF1,$FFF1,$FFF2,$FFF3
    dw $FFF4,$FFF5,$FFF6,$FFF7,$FFF8,$FFF9,$FFFA,$FFFB
    dw $FFFC,$FFFD,$FFFD,$FFFE,$0000,$0000,$0000,$0000


;;; $8EE0: Tatori function - leave shell ;;;
Function_MamaTurtle_LeaveShell:
; I don't understand these small position adjustments
    JSR MamaTurtle_vs_Samus_CollisionDetection
    LDA.W NMI_8bitFrameCounter : AND.W #$0001 : BNE .return
    PHX
    JSL CheckIfEnemyIsTouchingSamusFromBelow
    PLX
    AND.W #$FFFF : BEQ .notTouchingSamusFromBelow
    LDA.W ExtraSamusXDisplacement : SEC : SBC.W #$0001 : STA.W ExtraSamusXDisplacement

  .notTouchingSamusFromBelow:
    DEC.W Enemy.YPosition,X
    STZ.B DP_Temp12
    LDA.W #$0010 : STA.W Enemy.YHitboxRadius,X
    LDA.W Enemy.YPosition,X : BIT.W #$0001 : BNE .odd
    INC.W Enemy.XPosition,X
    BRA +

  .odd:
    DEC.W Enemy.XPosition,X

+   LDA.W #$0001 : STA.B DP_Temp14
    JSL MoveEnemyRightBy_14_12_IgnoreSlopes
    BCS .return
    LDA.W #InstList_MamaTurtle_FacingLeft_LeaveShell : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDA.W MamaTurtleConstants_unknown : STA.W $0006,X
    LDA.W #RTL_A28E09 : STA.W MamaTurtle.function,X

  .return:
    RTL


;;; $8F3F: Tatori function - enter shell ;;;
Function_MamaTurtle_EnterShell:
    LDY.W #InstList_MamaTurtle_FacingLeft_EnterShell
    LDA.W Enemy.XPosition,X : SEC : SBC.W SamusXPosition : BPL .keepLeft
    LDY.W #InstList_MamaTurtle_FacingRight_EnterShell

  .keepLeft:
    TYA : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDA.W #RTL_A28E09 : STA.W MamaTurtle.function,X
    RTL


;;; $8F5F: Handle Samus landing on hovering tatori ;;;
HandleSamusLandingOnHoveringTatori:
    PHX
    JSL CheckIfEnemyIsTouchingSamusFromBelow
    PLX
    AND.W #$FFFF : BEQ .return
    LDA.W #Function_MamaTurtle_RisingToPeak : STA.W MamaTurtle.function,X
    LDA.W ExtraSamusXSubDisplacement : SEC : SBC.L MamaTurtle.XSubVelocity,X : STA.W ExtraSamusXSubDisplacement
    LDA.W ExtraSamusXDisplacement : SBC.W MamaTurtle.XVelocity,X : CMP.W #$FFF0 : BPL +
    LDA.W #$FFF0

+   STA.W ExtraSamusXDisplacement

  .return:
    RTS


;;; $8F8D: Tatori function - rise to hover ;;;
Function_MamaTurtle_RiseToHover:
    JSR MamaTurtle_vs_Samus_CollisionDetection
    LDA.W #$FFFF : STA.B DP_Temp14
    STZ.B DP_Temp12
    JSL MoveEnemyDownBy_14_12
    BCS .return
    PHX
    JSL CheckIfEnemyIsTouchingSamusFromBelow
    PLX
    AND.W #$FFFF : BEQ .notTouchingSamusFromBelow
    LDA.W ExtraSamusYDisplacement : SEC : SBC.W #$0001 : STA.W ExtraSamusYDisplacement

  .notTouchingSamusFromBelow:
    LDA.L MamaTurtle.functionTimer,X : DEC : STA.L MamaTurtle.functionTimer,X : BNE .return
    LDY.W #$0000
    LDA.W Enemy.XPosition,X : SEC : SBC.W SamusXPosition : BPL +
    LDY.W #$0004

+   LDA.W MamaTurtleConstants_HoveringXAcceleration_subAcceleration,Y : STA.L MamaTurtle.XSubAcceleration,X
    LDA.W MamaTurtleConstants_HoveringXAcceleration_acceleration,Y : STA.L MamaTurtle.XAcceleration,X
    LDA.W #$0000 : STA.W MamaTurtle.XVelocity,X : STA.L MamaTurtle.XSubVelocity,X
    LDA.W #Function_MamaTurtle_Hovering : STA.W MamaTurtle.function,X

  .return:
    RTL


;;; $8FEB: Tatori function - hovering ;;;
Function_MamaTurtle_Hovering:
; Looks like buggy fixed point negations at .hitWall
; The dev must have thought that INC affected the carry flag
    JSR MamaTurtle_vs_Samus_CollisionDetection
    LDA.W MamaTurtle.XVelocity,X : STA.B DP_Temp14
    LDA.L MamaTurtle.XSubVelocity,X : STA.B DP_Temp12
    JSL MoveEnemyRightBy_14_12_IgnoreSlopes
    BCS .hitWall
    JSR HandleSamusLandingOnHoveringTatori
    LDA.L MamaTurtle.XSubVelocity,X : CLC : ADC.L MamaTurtle.XSubAcceleration,X : STA.L MamaTurtle.XSubVelocity,X
    LDA.W MamaTurtle.XVelocity,X : ADC.L MamaTurtle.XAcceleration,X : PHA : BPL +
    EOR.W #$FFFF : INC

+   CMP.W MamaTurtleConstants_maxHoveringXSpeed : BMI .pullA
    PLA
    LDY.W MamaTurtleConstants_maxHoveringXSpeed
    LDA.W MamaTurtle.XVelocity,X : BIT.W #$8000 : BEQ +
    LDA.W MamaTurtleConstants_maxHoveringXSpeed : EOR.W #$FFFF : INC : TAY

+   PHY

  .pullA:
    PLA : STA.W MamaTurtle.XVelocity,X
    RTL

  .hitWall:
    LDA.L MamaTurtle.XSubVelocity,X : EOR.W #$FFFF : INC : STA.L MamaTurtle.XSubVelocity,X
    LDA.W MamaTurtle.XVelocity,X : ADC.W #$0000 : EOR.W #$FFFF : INC : STA.W MamaTurtle.XVelocity,X
    LDA.L MamaTurtle.XSubAcceleration,X : EOR.W #$FFFF : INC : STA.L MamaTurtle.XSubAcceleration,X
    LDA.L MamaTurtle.XAcceleration,X : ADC.W #$0000 : EOR.W #$FFFF : STA.L MamaTurtle.XAcceleration,X
    LDA.W #$0000 : STA.W EarthquakeType
    LDA.W #$0010 : STA.W EarthquakeTimer
    LDA.W #$001B
    JSL QueueSound_Lib2_Max6
    RTL


;;; $9083: Tatori function - rising to peak ;;;
Function_MamaTurtle_RisingToPeak:
    JSR MamaTurtle_vs_Samus_CollisionDetection
    LDA.W Enemy.YPosition,X : CMP.W MamaTurtleConstants_peakYPosition : BMI +
    PHX
    JSL CheckIfEnemyIsTouchingSamusFromBelow
    PLX
    AND.W #$FFFF : BEQ .notTouchingSamus
    LDA.W Enemy.YPosition,X : SEC : SBC.W MamaTurtleConstants_risingToPeakSpeed : STA.W Enemy.YPosition,X
    LDA.W ExtraSamusYDisplacement : SEC : SBC.W MamaTurtleConstants_risingToPeakSpeed : STA.W ExtraSamusYDisplacement
    RTL

+   LDA.W MamaTurtleConstants_hoveringAtPeakPosition : STA.L MamaTurtle.functionTimer,X
    LDA.W #Function_MamaTurtle_HoveringAtPeak

  .merge:
    STA.W MamaTurtle.function,X
    LDA.W #$0000 : STA.L MamaTurtle.YSubVelocity,X : STA.L MamaTurtle.YVelocity,X
    RTL

  .notTouchingSamus:
    LDA.W #Function_MamaTurtle_Falling
    BRA .merge


;;; $90CC: Tatori function - hovering at peak ;;;
Function_MamaTurtle_HoveringAtPeak:
    JSR MamaTurtle_vs_Samus_CollisionDetection
    LDA.L MamaTurtle.functionTimer,X : DEC : STA.L MamaTurtle.functionTimer,X : BNE .return
    LDA.W #Function_MamaTurtle_Falling : STA.W MamaTurtle.function,X

  .return:
    RTL


;;; $90E1: Tatori function - falling ;;;
Function_MamaTurtle_Falling:
    JSR MamaTurtle_vs_Samus_CollisionDetection
    LDA.L MamaTurtle.YVelocity : CMP.W MamaTurtleConstants_maxFallingYSpeed : BPL .maxVelocity
    LDA.L MamaTurtle.YSubVelocity,X : CLC : ADC.W #$2000 : STA.L MamaTurtle.YSubVelocity,X
    LDA.L MamaTurtle.YVelocity,X : ADC.W #$0000 : STA.L MamaTurtle.YVelocity,X

  .maxVelocity:
    STZ.B DP_Temp12
    LDA.L MamaTurtle.YVelocity,X : STA.B DP_Temp14
    JSL MoveEnemyDownBy_14_12
    BCC .return
    LDY.W #InstList_MamaTurtle_FacingLeft_LeaveShell
    LDA.W MamaTurtle.XVelocity,X : BMI .keepLeft
    LDY.W #InstList_MamaTurtle_FacingRight_LeaveShell

  .keepLeft:
    TYA : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDA.W #RTL_A28E09 : STA.W MamaTurtle.function,X

  .return:
    RTL


;;; $912E: Main AI - enemy $CF7F (mini-tatori) ;;;
MainAI_BabyTurtle:
    LDX.W EnemyIndex
    LDA.W BabyTurtle.turtleIndex,X : TAX
    LDA.W #$0000 : STA.L ExtraEnemy7800+$C,X
    LDX.W EnemyIndex
    JMP.W (BabyTurtle.function,X)


;;; $9142: Mini-tatori function - crawling - not carrying Samus ;;;
Function_BabyTurtle_Crawling_NotCarryingSamus:
    JSL CheckIfEnemyIsTouchingSamusFromBelow
    AND.W #$FFFF : BEQ .return
    LDA.W #Function_BabyTurtle_Hiding_CarryingSamus : STA.W BabyTurtle.function,X
    LDA.W #$0004 : STA.L BabyTurtle.notCarryingSamusReactionTimer,X
    LDY.W #InstList_BabyTurtle_FacingLeft_Hiding
    LDA.W BabyTurtle.XVelocity,X : BMI .keepLeft
    LDY.W #InstList_BabyTurtle_FacingRight_Hiding

  .keepLeft:
    TYA : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X

  .return:
    RTL


;;; $916E: Mini-tatori function - hiding - carrying Samus ;;;
Function_BabyTurtle_Hiding_CarryingSamus:
    JSL CheckIfEnemyIsTouchingSamusFromBelow
    AND.W #$FFFF : BEQ .notTouchingSamus
    LDA.W #$0004 : STA.L BabyTurtle.notCarryingSamusReactionTimer,X

  .return:
    RTL

  .notTouchingSamus:
    LDA.L BabyTurtle.notCarryingSamusReactionTimer,X : DEC : STA.L BabyTurtle.notCarryingSamusReactionTimer,X : BNE .return
    LDA.W #Function_BabyTurtle_Hiding_NotCarryingSamus : STA.W BabyTurtle.function,X
    LDA.W #$003C : STA.L MamaTurtle.functionTimer,X
    RTL


;;; $9198: Mini-tatori function - hiding - not carrying Samus ;;;
Function_BabyTurtle_Hiding_NotCarryingSamus:
    JSL CheckIfEnemyIsTouchingSamusFromBelow
    AND.W #$FFFF : BEQ .notTouchingSamus
    LDA.W #Function_BabyTurtle_Spinning_Unstoppable : STA.W BabyTurtle.function,X
    LDA.W #InstList_BabyTurtle_Spinning : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDA.W #$0001 : STA.L BabyTurtle.YVelocity,X
    LDA.W PoseXDirection : AND.W #$000F
    LDY.W BabyTurtleConstants_maxSpinningLeftVelocity
    CMP.W #$0008 : BNE .keepLeft
    LDY.W BabyTurtleConstants_maxSpinningRightVelocity

  .keepLeft:
    TYA : STA.W BabyTurtle.XVelocity,X
    RTL

  .notTouchingSamus:
    LDA.L MamaTurtle.functionTimer,X : DEC : STA.L MamaTurtle.functionTimer,X : BEQ .timerExpired
    RTL

  .timerExpired:
    LDY.W #InstList_BabyTurtle_CrawlingLeft
    LDA.W BabyTurtle.XVelocity,X : BMI ..keepLeft
    LDY.W #InstList_BabyTurtle_CrawlingRight

  ..keepLeft:
    TYA : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDA.W #Function_BabyTurtle_Crawling_NotCarryingSamus : STA.W BabyTurtle.function,X
    RTL


;;; $91F8: Mini-tatori function - spinning - unstoppable ;;;
Function_BabyTurtle_Spinning_Unstoppable:
    STZ.B DP_Temp12
    LDA.W BabyTurtle.XVelocity,X : STA.B DP_Temp14
    JSL MoveEnemyRightBy_14_12_IgnoreSlopes
    BCS .collidedWithWall
    STZ.B DP_Temp12
    LDA.L BabyTurtle.YVelocity,X : STA.B DP_Temp14
    JSL MoveEnemyDownBy_14_12
    RTL

  .collidedWithWall:
    LDA.W BabyTurtle.XVelocity,X : EOR.W #$FFFF : INC : STA.W BabyTurtle.XVelocity,X
    RTL


if !FEATURE_KEEP_UNREFERENCED
;;; $921D: Unused ;;;
UNUSED_A2921D:
; Clone of Function_BabyTurtle_Hiding_NotCarryingSamus_timerExpired. Possibly an RTL'd out section of the above function
    LDY.W #InstList_BabyTurtle_CrawlingLeft
    LDA.W BabyTurtle.XVelocity,X : BMI .keepLeft
    LDY.W #InstList_BabyTurtle_CrawlingRight

  .keepLeft:
    TYA : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDA.W #Function_BabyTurtle_Crawling_NotCarryingSamus : STA.W BabyTurtle.function,X
    RTL
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $9239: Mini-tatori function - spinning - stoppable ;;;
Function_BabyTurtle_Spinning_Stoppable:
    JSL CheckIfEnemyIsTouchingSamusFromBelow
    AND.W #$FFFF : BEQ Function_BabyTurtle_Spinning_Unstoppable
    LDY.W #InstList_BabyTurtle_CrawlingLeft
    LDA.W BabyTurtle.XVelocity,X : BMI .keepLeft
    LDY.W #InstList_BabyTurtle_CrawlingRight

  .keepLeft:
    TYA : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDA.W #Function_BabyTurtle_Crawling_NotCarryingSamus : STA.W BabyTurtle.function,X
    RTL


;;; $925E: Mini-tatori function - crawling - carrying Samus ;;;
Function_BabyTurtle_Crawling_CarryingSamus:
    LDX.W EnemyIndex
    LDA.W Enemy.YHitboxRadius,X : PHA
    LDA.W BabyTurtle.turtleIndex,X : TAX
    PLA : STA.L ExtraEnemy7800+$C,X
    LDX.W EnemyIndex
    JSL CheckIfEnemyIsTouchingSamusFromBelow
    AND.W #$FFFF : BNE .return
    LDA.W #Function_BabyTurtle_Crawling_NotCarryingSamus : STA.W BabyTurtle.function,X

  .return:
    RTL


;;; $9281: Enemy touch - enemy $CF3F (tatori) ;;;
EnemyTouch_MamaTurtle:
; The solid enemy hitbox check here is useless, enemy touch reactions aren't called on solid enemies
    LDX.W EnemyIndex
    LDA.W Enemy.properties,X : BIT.W #$8000 : BNE .return
    JSL CommonA2_NormalEnemyTouchAI
    LDA.W #Function_MamaTurtle_Falling : STA.W MamaTurtle.function,X
    LDA.W #$0002 : STA.L MamaTurtle.YVelocity,X

  .return:
    RTL


;;; $929E: RTL ;;;
RTL_A2929E:
    RTL


;;; $929F: Enemy touch - enemy $CF7F (mini-tatori) ;;;
EnemyTouch_BabyTurtle:
    LDX.W EnemyIndex
    LDA.W BabyTurtle.function,X : CMP.W #Function_BabyTurtle_Crawling_CarryingSamus : BNE +
    RTL

+   LDA.W BabyTurtle.XVelocity,X : BMI .negative
    LDA.W #InstList_BabyTurtle_CrawlingLeft : STA.W Enemy.instList,X
    LDA.W #$FFFF
    BRA +

  .negative:
    LDA.W #InstList_BabyTurtle_CrawlingRight : STA.W Enemy.instList,X
    LDA.W #$0001

+   STA.W BabyTurtle.XVelocity,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDA.W Enemy.XPosition,X : CMP.W SamusXPosition : BPL .SamusToTheLeft
    LDA.W SamusXPosition : SEC : SBC.W SamusXRadius : SBC.W Enemy.XHitboxRadius,X
    BRA +

  .SamusToTheLeft:
    LDA.W SamusXPosition : CLC : ADC.W SamusXRadius : ADC.W Enemy.XHitboxRadius,X

+   STA.W Enemy.XPosition,X
    LDA.W #Function_BabyTurtle_Crawling_NotCarryingSamus : STA.W BabyTurtle.function,X
    STZ.B DP_Temp12
    LDA.W BabyTurtle.XVelocity,X : STA.B DP_Temp14
    JSL MoveEnemyRightBy_14_12_IgnoreSlopes
; fallthrough to AwakenTurtle


;;; $92FF: Awaken tatori ;;;
AwakenTurtle:
    LDX.W EnemyIndex
    LDA.W BabyTurtle.turtleIndex,X : TAX
    LDA.W MamaTurtle.asleepFlag,X : BEQ .return
    DEC.W MamaTurtle.asleepFlag,X

  .return:
    RTL


;;; $930F: Enemy shot - enemy $CF7F (mini-tatori) ;;;
EnemyShot_BabyTurtle:
    JSL NormalEnemyShotAI
    BRA AwakenTurtle


;;; $9315: Tatori / Samus collision detection ;;;
MamaTurtle_vs_Samus_CollisionDetection:
    LDA.W Enemy.XPosition : SEC : SBC.W Enemy.XHitboxRadius
    SEC : SBC.W #$0008 : STA.B DP_Temp12
    LDA.W Enemy.XPosition : CLC : ADC.W Enemy.XHitboxRadius
    CLC : ADC.W #$0008 : STA.B DP_Temp14
    LDA.W Enemy.YPosition : SEC : SBC.W Enemy.YHitboxRadius
    CLC : ADC.W #$0004 : STA.B DP_Temp16
    LDA.W Enemy.YPosition : CLC : ADC.W Enemy.YHitboxRadius
    SEC : SBC.W #$0004 : STA.B DP_Temp18
    LDA.W SamusXPosition : SEC : SBC.W SamusXRadius
    DEC : CMP.B DP_Temp14 : BPL .return
    LDA.W SamusXPosition : CLC : ADC.W SamusXRadius
    CMP.B DP_Temp12 : BMI .return
    LDA.W SamusYPosition : SEC : SBC.W SamusYRadius : INC
    CMP.B DP_Temp18 : BPL .return
    LDA.W SamusYPosition : CLC : ADC.W SamusYRadius : CMP.B DP_Temp16 : BMI .return
    LDA.W SamusInvincibilityTimer : BNE .return
    JSL NormalEnemyTouchAI

  .return:
    RTS


;;; $9381: Instruction - mini-tatori - crawl ;;;
Instruction_BabyTurtle_Crawl:
    PHX : PHY
    LDA.W #$0000 : STA.B DP_Temp30
    LDX.W EnemyIndex
    JSL CheckIfEnemyIsTouchingSamusFromBelow
    AND.W #$FFFF : BEQ .notTouchingSamusFromBelow
    LDA.W BabyTurtle.XVelocity,X : CLC : ADC.W ExtraSamusXDisplacement : STA.W ExtraSamusXDisplacement
    LDA.W #$0001 : STA.B DP_Temp30

  .notTouchingSamusFromBelow:
    LDA.W Enemy.YPosition,X : STA.B DP_Temp32
    LDA.W BabyTurtle.spawnTopBoundary,X : STA.W Enemy.YPosition,X
    STZ.B DP_Temp12
    LDA.W BabyTurtle.XVelocity,X : STA.B DP_Temp14
    JSL MoveEnemyRightBy_14_12_IgnoreSlopes
    LDA.W BabyTurtle.turtleIndex,X : TAX
    LDA.W BabyTurtle.function,X : CMP.W #Function_MamaTurtle_Asleep : BNE .return
    LDX.W EnemyIndex
    PHX
    LDA.W BabyTurtle.turtleIndex,X : TAX
    LDA.W Enemy.XPosition,X
    PLX
    SEC : SBC.W Enemy.XPosition,X : PHP : BPL +
    EOR.W #$FFFF : INC

+   CMP.W #$0018 : BPL .notOnMama
    PLP : BPL .rightOfMama
    CLC : ADC.W #$0018

  .rightOfMama:
    ASL : TAX
    LDA.W SleepingMamaTurtleShellShape,X

  .merge:
    STA.B DP_Temp14
    STZ.B DP_Temp12
    LDX.W EnemyIndex
    JSL MoveEnemyDownBy_14_12
    LDA.B DP_Temp30 : BEQ .return
    LDA.W Enemy.YPosition,X : SEC : SBC.B DP_Temp32
    CLC : ADC.W ExtraSamusYDisplacement : STA.W ExtraSamusYDisplacement

  .return:
    PLY : PLX
    RTL

  .notOnMama:
    PLP
    LDA.W #$0001
    BRA .merge


;;; $9412: Instruction - mini-tatori - loop or turn around if moved too far ;;;
Instruction_BabyTurtle_LoopOrTurnAroundIfMovedTooFar:
    PHX
    LDX.W EnemyIndex
    LDA.W BabyTurtle.spawnXPosition,X : SEC : SBC.W Enemy.XPosition,X : PHP : BPL +
    EOR.W #$FFFF : INC

+   CMP.W BabyTurtleConstants_travelDistance : BMI .noTurn
    PLP : BMI .rightOfSpawn
    LDA.W #$0001
    BRA +

  .rightOfSpawn:
    LDA.W #$FFFF

+   STA.W BabyTurtle.XVelocity,X

  .merge:
    LDY.W #InstList_BabyTurtle_CrawlingRight
    LDA.W BabyTurtle.XVelocity,X : BPL .return
    LDY.W #InstList_BabyTurtle_CrawlingLeft

  .return:
    PLX
    RTL

  .noTurn:
    PLP
    BRA .merge


;;; $9447: Instruction - tatori - enter shell ;;;
Instruction_MamaTurtle_EnterShell:
    LDX.W EnemyIndex
    LDA.W #Function_MamaTurtle_EnterShell : STA.W MamaTurtle.function,X
    RTL


;;; $9451: Instruction - tatori - rise to hover rightwards, go to InstList_MamaTurtle_Spinning ;;;
Instruction_MamaTurtle_RiseToHoverRightwards:
    LDX.W EnemyIndex
    LDA.W #Function_MamaTurtle_RiseToHover : STA.W MamaTurtle.function,X
    LDA.W #$FFFF : STA.W MamaTurtle.XVelocity,X
    LDA.W #$0010 : STA.L MamaTurtle.functionTimer,X
    LDY.W #InstList_MamaTurtle_Spinning
    RTL


;;; $946B: Instruction - tatori - rise to hover leftwards, go to InstList_MamaTurtle_Spinning ;;;
Instruction_MamaTurtle_RiseToHoverLeftwards:
    LDX.W EnemyIndex
    LDA.W #Function_MamaTurtle_RiseToHover : STA.W MamaTurtle.function,X
    LDA.W #$0001 : STA.W MamaTurtle.XVelocity,X
    LDA.W #$0010 : STA.L MamaTurtle.functionTimer,X
    LDY.W #InstList_MamaTurtle_Spinning
    RTL


;;; $9485: Instruction - mini-tatori - leave shell ;;;
Instruction_BabyTurtle_LeaveShell:
    PHY
    LDX.W EnemyIndex
    JSL CheckIfEnemyIsTouchingSamusFromBelow
    AND.W #$FFFF : BEQ .returnPLY
    PLY
    LDY.W #InstList_BabyTurtle_FacingLeft_LeaveShell
    LDA.W BabyTurtle.XVelocity,X : BMI .return
    LDY.W #InstList_BabyTurtle_FacingRight_LeaveShell

  .return:
    RTL

  .returnPLY:
    PLY
    RTL


;;; $94A1: Instruction - mini-tatori - left shell ;;;
Instruction_BabyTurtle_LeftShell:
    LDX.W EnemyIndex
    JSL CheckIfEnemyIsTouchingSamusFromBelow
    AND.W #$FFFF : BEQ .notTouchingSamusFromBelow
    LDA.W #Function_BabyTurtle_Crawling_CarryingSamus : STA.W BabyTurtle.function,X

  .chooseDirection:
    LDY.W #InstList_BabyTurtle_CrawlingLeft
    LDA.W BabyTurtle.XVelocity,X : BMI .return
    LDY.W #InstList_BabyTurtle_CrawlingRight

  .return:
    RTL

  .notTouchingSamusFromBelow:
    LDA.W #Function_BabyTurtle_Crawling_NotCarryingSamus : STA.W BabyTurtle.function,X
    BRA .chooseDirection


;;; $94C7: Instruction - mini-tatori - enemy function = spinning - stoppable ;;;
Instruction_BabyTurtle_Set_Spinning_Stoppable:
    LDX.W EnemyIndex
    LDA.W #Function_BabyTurtle_Spinning_Stoppable : STA.W BabyTurtle.function,X
    RTL


;;; $94D1: Instruction - queue tatori spinning sound effect ;;;
Instruction_MamaTurtle_PlaySpinningSFX:
    LDA.W #$003A
    JSL QueueSound_Lib2_Max6
    RTL


;;; $94D9: Spritemaps - tatori ;;;
Spritemap_BabyTurtle_FacingLeft_0:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 0, $104)

Spritemap_BabyTurtle_FacingLeft_1:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 0, $106)

Spritemap_BabyTurtle_FacingLeft_2:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 0, $108)

Spritemap_BabyTurtle_FacingLeft_3:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 0, $10A)

Spritemap_BabyTurtle_FacingLeft_4:
    dw $0002
    %spritemapEntry(0, $1F8, $FF, 0, 0, 2, 0, $14D)
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 0, $106)

Spritemap_BabyTurtle_FacingLeft_5:
    dw $0002
    %spritemapEntry(0, $1F8, $00, 0, 0, 2, 0, $14E)
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 0, $108)

Spritemap_BabyTurtle_FacingLeft_6:
    dw $0002
    %spritemapEntry(0, $1F8, $FF, 0, 0, 2, 0, $14F)
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 0, $10A)

Spritemap_BabyTurtle_FacingLeft_7:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 0, $102)

Spritemap_BabyTurtle_FacingLeft_8:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 0, $100)

Spritemap_BabyTurtle_FacingLeft_9:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 1, 2, 0, $102)

Spritemap_BabyTurtle_FacingLeft_A:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 1, 2, 0, $100)

Spritemap_MamaTurtle_FacingLeft_0:
    dw $0006
    %spritemapEntry(1, $4208, $00, 0, 0, 2, 0, $12A)
    %spritemapEntry(1, $43F8, $00, 0, 0, 2, 0, $128)
    %spritemapEntry(1, $43E8, $00, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $4208, $F0, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $43F8, $F0, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $43E8, $F0, 0, 0, 2, 0, $120)

Spritemap_MamaTurtle_FacingLeft_1:
    dw $000E
    %spritemapEntry(0, $08, $08, 0, 0, 2, 0, $14B)
    %spritemapEntry(0, $00, $08, 0, 0, 2, 0, $14A)
    %spritemapEntry(0, $1F8, $08, 0, 0, 2, 0, $149)
    %spritemapEntry(0, $1F0, $08, 0, 0, 2, 0, $148)
    %spritemapEntry(0, $1E8, $08, 0, 0, 2, 0, $157)
    %spritemapEntry(0, $1E8, $00, 0, 0, 2, 0, $147)
    %spritemapEntry(0, $10, $00, 0, 0, 2, 0, $12B)
    %spritemapEntry(0, $08, $00, 0, 0, 2, 0, $12A)
    %spritemapEntry(0, $00, $00, 0, 0, 2, 0, $129)
    %spritemapEntry(0, $1F8, $00, 0, 0, 2, 0, $128)
    %spritemapEntry(0, $1F0, $00, 0, 0, 2, 0, $127)
    %spritemapEntry(1, $4208, $F0, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $43F8, $F0, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $43E8, $F0, 0, 0, 2, 0, $120)

Spritemap_MamaTurtle_FacingLeft_2:
    dw $000E
    %spritemapEntry(0, $08, $08, 0, 0, 2, 0, $15B)
    %spritemapEntry(0, $00, $08, 0, 0, 2, 0, $15A)
    %spritemapEntry(0, $1F8, $08, 0, 0, 2, 0, $159)
    %spritemapEntry(0, $1F0, $08, 0, 0, 2, 0, $158)
    %spritemapEntry(0, $1E8, $08, 0, 0, 2, 0, $156)
    %spritemapEntry(0, $1E8, $00, 0, 0, 2, 0, $146)
    %spritemapEntry(0, $10, $00, 0, 0, 2, 0, $12B)
    %spritemapEntry(0, $08, $00, 0, 0, 2, 0, $12A)
    %spritemapEntry(0, $00, $00, 0, 0, 2, 0, $129)
    %spritemapEntry(0, $1F8, $00, 0, 0, 2, 0, $128)
    %spritemapEntry(0, $1F0, $00, 0, 0, 2, 0, $127)
    %spritemapEntry(1, $4208, $F0, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $43F8, $F0, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $43E8, $F0, 0, 0, 2, 0, $120)

Spritemap_MamaTurtle_FacingLeft_3:
    dw $000B
    %spritemapEntry(1, $4201, $01, 0, 0, 2, 0, $144)
    %spritemapEntry(1, $43F3, $00, 0, 0, 2, 0, $142)
    %spritemapEntry(1, $43E8, $01, 0, 0, 2, 0, $140)
    %spritemapEntry(1, $4208, $FB, 0, 0, 2, 0, $12A)
    %spritemapEntry(1, $420C, $01, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $43DD, $FA, 0, 0, 2, 0, $12C)
    %spritemapEntry(1, $43F8, $FB, 0, 0, 2, 0, $128)
    %spritemapEntry(1, $43E8, $FB, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $4208, $EB, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $43F8, $EB, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $43E8, $EB, 0, 0, 2, 0, $120)

Spritemap_MamaTurtle_FacingLeft_4:
    dw $000B
    %spritemapEntry(1, $4201, $00, 0, 0, 2, 0, $142)
    %spritemapEntry(1, $43EF, $01, 0, 0, 2, 0, $140)
    %spritemapEntry(1, $43EA, $00, 0, 0, 2, 0, $142)
    %spritemapEntry(1, $4208, $FA, 0, 0, 2, 0, $12A)
    %spritemapEntry(1, $420B, $01, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $43DD, $FB, 0, 0, 2, 0, $12C)
    %spritemapEntry(1, $43F8, $FA, 0, 0, 2, 0, $128)
    %spritemapEntry(1, $43E8, $FA, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $4208, $EA, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $43F8, $EA, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $43E8, $EA, 0, 0, 2, 0, $120)

Spritemap_MamaTurtle_FacingLeft_5:
    dw $000B
    %spritemapEntry(1, $43FF, $01, 0, 0, 2, 0, $140)
    %spritemapEntry(1, $43F3, $00, 0, 0, 2, 0, $142)
    %spritemapEntry(1, $43EA, $01, 0, 0, 2, 0, $144)
    %spritemapEntry(1, $4208, $F9, 0, 0, 2, 0, $12A)
    %spritemapEntry(1, $420C, $01, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $43DD, $FC, 0, 0, 2, 0, $12C)
    %spritemapEntry(1, $43F8, $F9, 0, 0, 2, 0, $128)
    %spritemapEntry(1, $43E8, $F9, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $4208, $E9, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $43F8, $E9, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $43E8, $E9, 0, 0, 2, 0, $120)

Spritemap_MamaTurtle_FacingLeft_6:
    dw $000B
    %spritemapEntry(1, $4201, $00, 0, 0, 2, 0, $142)
    %spritemapEntry(1, $43F3, $01, 0, 0, 2, 0, $144)
    %spritemapEntry(1, $43EA, $00, 0, 0, 2, 0, $142)
    %spritemapEntry(1, $4208, $FA, 0, 0, 2, 0, $12A)
    %spritemapEntry(1, $420D, $01, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $43DD, $FB, 0, 0, 2, 0, $12C)
    %spritemapEntry(1, $43F8, $FA, 0, 0, 2, 0, $128)
    %spritemapEntry(1, $43E8, $FA, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $4208, $EA, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $43F8, $EA, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $43E8, $EA, 0, 0, 2, 0, $120)

Spritemap_MamaTurtle_FacingLeft_7:
    dw $0006
    %spritemapEntry(1, $43E8, $00, 0, 1, 2, 0, $12A)
    %spritemapEntry(1, $43F8, $00, 0, 1, 2, 0, $128)
    %spritemapEntry(1, $4208, $00, 0, 1, 2, 0, $126)
    %spritemapEntry(1, $43E8, $F0, 0, 1, 2, 0, $124)
    %spritemapEntry(1, $43F8, $F0, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $4208, $F0, 0, 1, 2, 0, $120)

Spritemap_MamaTurtle_FacingLeft_8:
    dw $0004
    %spritemapEntry(1, $4200, $00, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $4200, $F0, 0, 1, 2, 0, $10C)
    %spritemapEntry(1, $43F0, $00, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 2, 0, $10C)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_MamaTurtle_FacingLeft_A296FF:
    dw $000A
    %spritemapEntry(0, $00, $08, 0, 1, 2, 0, $15F)
    %spritemapEntry(0, $00, $00, 0, 1, 2, 0, $15E)
    %spritemapEntry(0, $1F8, $08, 0, 0, 2, 0, $15F)
    %spritemapEntry(0, $1F8, $00, 0, 0, 2, 0, $15E)
    %spritemapEntry(1, $4206, $00, 0, 1, 2, 0, $140)
    %spritemapEntry(1, $43EA, $00, 0, 0, 2, 0, $140)
    %spritemapEntry(1, $4200, $FA, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $43F0, $FA, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $4200, $EA, 0, 1, 2, 0, $10C)
    %spritemapEntry(1, $43F0, $EA, 0, 0, 2, 0, $10C)
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_BabyTurtle_FacingRight_B:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 1, 2, 0, $104)

Spritemap_BabyTurtle_FacingRight_C:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 1, 2, 0, $106)

Spritemap_BabyTurtle_FacingRight_D:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 1, 2, 0, $108)

Spritemap_BabyTurtle_FacingRight_E:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 1, 2, 0, $10A)

Spritemap_BabyTurtle_FacingRight_F:
    dw $0002
    %spritemapEntry(0, $00, $FF, 0, 1, 2, 0, $14D)
    %spritemapEntry(1, $43F8, $F8, 0, 1, 2, 0, $106)

Spritemap_BabyTurtle_FacingRight_10:
    dw $0002
    %spritemapEntry(0, $00, $00, 0, 1, 2, 0, $14E)
    %spritemapEntry(1, $43F8, $F8, 0, 1, 2, 0, $108)

Spritemap_BabyTurtle_FacingRight_11:
    dw $0002
    %spritemapEntry(0, $00, $FF, 0, 1, 2, 0, $14F)
    %spritemapEntry(1, $43F8, $F8, 0, 1, 2, 0, $10A)

Spritemap_BabyTurtle_FacingRight_12:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 1, 2, 0, $102)

Spritemap_BabyTurtle_FacingRight_13:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 1, 2, 0, $100)

Spritemap_BabyTurtle_FacingRight_14:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 0, $102)

Spritemap_BabyTurtle_FacingRight_15:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 0, $100)

Spritemap_MamaTurtle_FacingRight_9:
    dw $0006
    %spritemapEntry(1, $43E8, $00, 0, 1, 2, 0, $12A)
    %spritemapEntry(1, $43F8, $00, 0, 1, 2, 0, $128)
    %spritemapEntry(1, $4208, $00, 0, 1, 2, 0, $126)
    %spritemapEntry(1, $43E8, $F0, 0, 1, 2, 0, $124)
    %spritemapEntry(1, $43F8, $F0, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $4208, $F0, 0, 1, 2, 0, $120)

Spritemap_MamaTurtle_FacingRight_A:
    dw $000E
    %spritemapEntry(0, $1F0, $08, 0, 1, 2, 0, $14B)
    %spritemapEntry(0, $1F8, $08, 0, 1, 2, 0, $14A)
    %spritemapEntry(0, $00, $08, 0, 1, 2, 0, $149)
    %spritemapEntry(0, $08, $08, 0, 1, 2, 0, $148)
    %spritemapEntry(0, $10, $08, 0, 1, 2, 0, $157)
    %spritemapEntry(0, $10, $00, 0, 1, 2, 0, $147)
    %spritemapEntry(0, $1E8, $00, 0, 1, 2, 0, $12B)
    %spritemapEntry(0, $1F0, $00, 0, 1, 2, 0, $12A)
    %spritemapEntry(0, $1F8, $00, 0, 1, 2, 0, $129)
    %spritemapEntry(0, $00, $00, 0, 1, 2, 0, $128)
    %spritemapEntry(0, $08, $00, 0, 1, 2, 0, $127)
    %spritemapEntry(1, $43E8, $F0, 0, 1, 2, 0, $124)
    %spritemapEntry(1, $43F8, $F0, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $4208, $F0, 0, 1, 2, 0, $120)

Spritemap_MamaTurtle_FacingRight_B:
    dw $000E
    %spritemapEntry(0, $1F0, $08, 0, 1, 2, 0, $15B)
    %spritemapEntry(0, $1F8, $08, 0, 1, 2, 0, $15A)
    %spritemapEntry(0, $00, $08, 0, 1, 2, 0, $159)
    %spritemapEntry(0, $08, $08, 0, 1, 2, 0, $158)
    %spritemapEntry(0, $10, $08, 0, 1, 2, 0, $156)
    %spritemapEntry(0, $10, $00, 0, 1, 2, 0, $146)
    %spritemapEntry(0, $1E8, $00, 0, 1, 2, 0, $12B)
    %spritemapEntry(0, $1F0, $00, 0, 1, 2, 0, $12A)
    %spritemapEntry(0, $1F8, $00, 0, 1, 2, 0, $129)
    %spritemapEntry(0, $00, $00, 0, 1, 2, 0, $128)
    %spritemapEntry(0, $08, $00, 0, 1, 2, 0, $127)
    %spritemapEntry(1, $43E8, $F0, 0, 1, 2, 0, $124)
    %spritemapEntry(1, $43F8, $F0, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $4208, $F0, 0, 1, 2, 0, $120)

Spritemap_MamaTurtle_FacingRight_C:
    dw $000B
    %spritemapEntry(1, $43EF, $01, 0, 1, 2, 0, $144)
    %spritemapEntry(1, $43FD, $00, 0, 1, 2, 0, $142)
    %spritemapEntry(1, $4208, $01, 0, 1, 2, 0, $140)
    %spritemapEntry(1, $43E8, $FB, 0, 1, 2, 0, $12A)
    %spritemapEntry(1, $43E4, $01, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $4213, $FA, 0, 1, 2, 0, $12C)
    %spritemapEntry(1, $43F8, $FB, 0, 1, 2, 0, $128)
    %spritemapEntry(1, $4208, $FB, 0, 1, 2, 0, $126)
    %spritemapEntry(1, $43E8, $EB, 0, 1, 2, 0, $124)
    %spritemapEntry(1, $43F8, $EB, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $4208, $EB, 0, 1, 2, 0, $120)

Spritemap_MamaTurtle_FacingRight_D:
    dw $000B
    %spritemapEntry(1, $43EF, $00, 0, 1, 2, 0, $142)
    %spritemapEntry(1, $4201, $01, 0, 1, 2, 0, $140)
    %spritemapEntry(1, $4206, $00, 0, 1, 2, 0, $142)
    %spritemapEntry(1, $43E8, $FA, 0, 1, 2, 0, $12A)
    %spritemapEntry(1, $43E5, $01, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $4213, $FB, 0, 1, 2, 0, $12C)
    %spritemapEntry(1, $43F8, $FA, 0, 1, 2, 0, $128)
    %spritemapEntry(1, $4208, $FA, 0, 1, 2, 0, $126)
    %spritemapEntry(1, $43E8, $EA, 0, 1, 2, 0, $124)
    %spritemapEntry(1, $43F8, $EA, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $4208, $EA, 0, 1, 2, 0, $120)

Spritemap_MamaTurtle_FacingRight_E:
    dw $000B
    %spritemapEntry(1, $43F1, $01, 0, 1, 2, 0, $140)
    %spritemapEntry(1, $43FD, $00, 0, 1, 2, 0, $142)
    %spritemapEntry(1, $4206, $01, 0, 1, 2, 0, $144)
    %spritemapEntry(1, $43E8, $F9, 0, 1, 2, 0, $12A)
    %spritemapEntry(1, $43E4, $01, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $4213, $FC, 0, 1, 2, 0, $12C)
    %spritemapEntry(1, $43F8, $F9, 0, 1, 2, 0, $128)
    %spritemapEntry(1, $4208, $F9, 0, 1, 2, 0, $126)
    %spritemapEntry(1, $43E8, $E9, 0, 1, 2, 0, $124)
    %spritemapEntry(1, $43F8, $E9, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $4208, $E9, 0, 1, 2, 0, $120)

Spritemap_MamaTurtle_FacingRight_F:
    dw $000B
    %spritemapEntry(1, $43EF, $00, 0, 1, 2, 0, $142)
    %spritemapEntry(1, $43FD, $01, 0, 1, 2, 0, $144)
    %spritemapEntry(1, $4206, $00, 0, 1, 2, 0, $142)
    %spritemapEntry(1, $43E8, $FA, 0, 1, 2, 0, $12A)
    %spritemapEntry(1, $43E3, $01, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $4213, $FB, 0, 1, 2, 0, $12C)
    %spritemapEntry(1, $43F8, $FA, 0, 1, 2, 0, $128)
    %spritemapEntry(1, $4208, $FA, 0, 1, 2, 0, $126)
    %spritemapEntry(1, $43E8, $EA, 0, 1, 2, 0, $124)
    %spritemapEntry(1, $43F8, $EA, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $4208, $EA, 0, 1, 2, 0, $120)

Spritemap_MamaTurtle_FacingRight_10:
    dw $0006
    %spritemapEntry(1, $4208, $00, 0, 0, 2, 0, $12A)
    %spritemapEntry(1, $43F8, $00, 0, 0, 2, 0, $128)
    %spritemapEntry(1, $43E8, $00, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $4208, $F0, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $43F8, $F0, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $43E8, $F0, 0, 0, 2, 0, $120)

Spritemap_MamaTurtle_FacingRight_11:
    dw $0004
    %spritemapEntry(1, $43F0, $00, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $43F0, $F0, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $4200, $00, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $4200, $F0, 0, 1, 2, 0, $10C)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_MamaTurtle_FacingRight_A29959:
    dw $000A
    %spritemapEntry(0, $1F8, $08, 0, 0, 2, 0, $15F)
    %spritemapEntry(0, $1F8, $00, 0, 0, 2, 0, $15E)
    %spritemapEntry(0, $00, $08, 0, 1, 2, 0, $15F)
    %spritemapEntry(0, $00, $00, 0, 1, 2, 0, $15E)
    %spritemapEntry(1, $43EA, $00, 0, 0, 2, 0, $140)
    %spritemapEntry(1, $4206, $00, 0, 1, 2, 0, $140)
    %spritemapEntry(1, $43F0, $FA, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $4200, $FA, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $43F0, $EA, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $4200, $EA, 0, 1, 2, 0, $10C)
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $998D: Palette - enemy $CFBF (puyo) ;;;
Palette_Puyo:
    dw $3800,$4B9C,$2610,$0CC6,$0C63,$42F7,$2A52,$19AD
    dw $0D29,$5617,$3D72,$1C48,$0C05,$033B,$0216,$0113


;;; $99AD: Instruction list - grounded/dropping - fast ;;;
InstList_Puyo_GroundedDropping_Fast:
    dw $0005,Spritemap_Puyo_0
    dw $0005,Spritemap_Puyo_1
    dw $0005,Spritemap_Puyo_2
    dw $0005,Spritemap_Puyo_1
    dw Instruction_Common_GotoY
    dw InstList_Puyo_GroundedDropping_Fast


;;; $99C1: Instruction list - grounded/dropping - medium ;;;
InstList_Puyo_GroundedDropping_Medium:
    dw $0008,Spritemap_Puyo_0
    dw $0008,Spritemap_Puyo_1
    dw $0008,Spritemap_Puyo_2
    dw $0008,Spritemap_Puyo_1
    dw Instruction_Common_GotoY
    dw InstList_Puyo_GroundedDropping_Medium


;;; $99D5: Instruction list - grounded/dropping - slow ;;;
InstList_Puyo_GroundedDropping_Slow:
    dw $000A,Spritemap_Puyo_0
    dw $000A,Spritemap_Puyo_1
    dw $000A,Spritemap_Puyo_2
    dw $000A,Spritemap_Puyo_1
    dw Instruction_Common_GotoY
    dw InstList_Puyo_GroundedDropping_Slow


;;; $99E9: Instruction list - hopping right frame 0 / hopping left frame 4 ;;;
InstList_Puyo_HoppingRight_0_HoppingLeft_4:
    dw $0001,Spritemap_Puyo_7
    dw Instruction_Common_Sleep


;;; $99EF: Instruction list - hopping right frame 1 / hopping left frame 3 ;;;
InstList_Puyo_HoppingRight_1_HoppingLeft_3:
    dw $0001,Spritemap_Puyo_6
    dw Instruction_Common_Sleep


;;; $99F5: Instruction list - hopping frame 2 ;;;
InstList_Puyo_Hopping_2:
    dw $0001,Spritemap_Puyo_5
    dw Instruction_Common_Sleep


;;; $99FB: Instruction list - hopping right frame 3 / hopping left frame 1 ;;;
InstList_Puyo_HoppingRight_3_HoppingLeft_1:
    dw $0001,Spritemap_Puyo_4
    dw Instruction_Common_Sleep


;;; $9A01: Instruction list - hopping right frame 4 / hopping left frame 0 ;;;
InstList_Puyo_HoppingRight_4_HoppingLeft_0:
    dw $0001,Spritemap_Puyo_3
    dw Instruction_Common_Sleep


;;; $9A07: Hop table ;;;
PuyoHopTable:
;        _____________________ 0: Jump height
;       |      _______________ 2: X speed. Unit of 1/100h px/frame
;       |     |      _________ 4: Y speed table index delta. Also used for dropping speed, unit of 1/100h px/frame
;       |     |     |      ___ 6: Airborne function
;       |     |     |     |
  .jumpHeight:
    dw $0010 ; 0: Normal - small hop
  .XSpeed:
    dw       $0100
  .YSpeedTableIndexDelta:
    dw             $0200
  .airborneFunction:
    dw Function_Puyo_Airborne_Normal_ShortHop
    dw $0020,$0100,$0200 ; 1: Normal - big hop
    dw Function_Puyo_Airborne_Normal_BigHop
    dw $0020,$0200,$0300 ; 2: Unused. Normal - long hop
    dw Function_Puyo_Airborne_Normal_LongHop
    dw $0080,$0140,$0200 ; 3: Giant hop
    dw Function_Puyo_Airborne_GiantHop
    dw $0000,$0000,$0100 ; 4: Dropping
    dw Function_Puyo_Airborne_Dropping
    dw $0010,$0100,$01C0 ; 5: Dropped - small hop
    dw Function_Puyo_Airborne_Dropped
    dw $0015,$0100,$01C0 ; 6: Dropped - big hop
    dw Function_Puyo_Airborne_Dropped


;;; $9A3F: Initialisation AI - enemy $CFBF (puyo) ;;;
InitAI_Puyo:
    LDX.W EnemyIndex
    LDA.W #Spritemap_Common_Nothing : STA.W Enemy.spritemap,X
    STZ.W Enemy.var0,X
    LDA.W #InstList_Puyo_GroundedDropping_Fast
    JSR SetPuyoInstList
    LDA.W #$0000 : STA.L Puyo.hopType,X
    LDA.W #Function_Puyo_Grounded : STA.W Puyo.function,X
    LDA.W Enemy.init0,X : STA.W Puyo.hopCooldownTimer,X
    LDA.W #$0000 : STA.L Puyo.invertDirectionFlag,X
    RTL


;;; $9A6C: Set enemy instruction list ;;;
SetPuyoInstList:
    LDX.W EnemyIndex
    STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    RTS


;;; $9A7C: RTS ;;;
RTS_A29A7C:
    RTS


;;; $9A7D: Main AI - enemy $CFBF (puyo) ;;;
MainAI_Puyo:
    LDX.W EnemyIndex
    JSR.W (Puyo.function,X)
    RTL


;;; $9A84: Initiate hop ;;;
InitiateHop:
    LDA.L Puyo.hopType,X : CMP.W #$0003 : BPL .hop
    JSR Puyo_CheckIfSamusIsInProximity
    LDA.L Puyo.hopType,X

  .hop:
    JSR ChooseHopType
    JSR Puyo_CalculateInitialHopSpeed
    RTS


;;; $9A9B: Check if Samus is in proximity ;;;
Puyo_CheckIfSamusIsInProximity:
    LDX.W EnemyIndex
    LDA.W Enemy.init1,X
    JSL IsSamusWithinAPixelColumnsOfEnemy
    STA.L Puyo.hopType,X
    RTS


;;; $9AAA: Choose hop type ;;;
ChooseHopType:
    LDX.W EnemyIndex
    LDA.W #$0001 : STA.L Puyo.direction,X
    JSL Get_SamusX_minus_EnemyX
    BMI .checkInverted
    LDA.W #$0000 : STA.L Puyo.direction,X

  .checkInverted:
    LDA.L Puyo.invertDirectionFlag,X : BEQ .notInverted
    LDA.L Puyo.invertedDirection,X : STA.L Puyo.direction,X

  .notInverted:
    LDA.W #$0000 : STA.L Puyo.invertDirectionFlag,X
    JSR GetRandomNumber0_7
    LDA.L Puyo.hopType,X : CMP.W #$0003 : BPL .greaterThan2
    CMP.W #$0000 : BNE .nonZeroHopType
    LDA.B DP_Temp1C : AND.W #$0001 : STA.B DP_Temp1C

  .nonZeroHopType:
    LDA.B DP_Temp1C : CMP.W #$0002 : BMI .greaterThan2
    LDA.W #$0002

  .greaterThan2:
    ASL #3 : STA.W Puyo.hopTableIndex,X
    TAY
    LDA.W PuyoHopTable_airborneFunction,Y : STA.W Puyo.airborneFunction,X
    RTS


;;; $9B06: $1C = random number in 0..7 ;;;
GetRandomNumber0_7:
    LDX.W EnemyIndex
    JSL GenerateRandomNumber
    LDA.W RandomNumberSeed : CLC : ADC.W Enemy.frameCounter,X : AND.W #$0007 : STA.B DP_Temp1C ; >.< LDA
    RTS


;;; $9B1A: Calculate initial hop speed ;;;
Puyo_CalculateInitialHopSpeed:
; Calculates how long it will take for enemy to fall [PuyoHopTable_jumpHeight + [enemy hop table index]] pixels
    LDX.W EnemyIndex
    LDY.W Puyo.hopTableIndex,X
    STZ.B DP_Temp16 : STZ.B DP_Temp18

  .loop:
    LDA.B DP_Temp16 : CLC : ADC.W PuyoHopTable_XSpeed,Y : STA.B DP_Temp16
    AND.W #$FF00 : XBA : ASL #3 : TAY
    LDA.B DP_Temp18 : CLC : ADC.W CommonEnemySpeeds_QuadraticallyIncreasing+1,Y : STA.B DP_Temp18
    LDY.W Puyo.hopTableIndex,X
    LDA.W PuyoHopTable_jumpHeight,Y : XBA : CMP.B DP_Temp18 : BPL .loop
    LDA.B DP_Temp16 : STA.W Puyo.YSpeedTableIndex,X
    LDA.W #$0000 : STA.L Puyo.fallingFlag,X
    LDA.B DP_Temp16 : LSR : STA.L Puyo.initialYSpeedTableIndex_1_2,X
    LSR : CLC : ADC.L Puyo.initialYSpeedTableIndex_1_2,X : STA.L Puyo.initialYSpeedTableIndex_3_4,X
    RTS


;;; $9B65: Puyo function - grounded ;;;
Function_Puyo_Grounded:
    DEC.W Puyo.hopCooldownTimer,X : BPL .return
    LDA.W #Function_Puyo_Airborne : STA.W Puyo.function,X
    LDA.W Enemy.init0,X : STA.W Puyo.hopCooldownTimer,X
    LDA.W #$0001 : STA.L Puyo.hoppingAnimationFlag,X
    JSR InitiateHop

  .return:
    RTS


;;; $9B81: Puyo function - airborne ;;;
Function_Puyo_Airborne:
    LDX.W EnemyIndex
    JSR.W (Puyo.airborneFunction,X)
    RTS


;;; $9B88: Puyo movement ;;;
PuyoMovement:
    LDX.W EnemyIndex
    LDA.W Puyo.YSpeedTableIndex,X : CMP.W #$4000 : BMI +
    LDA.W #$4000

+   AND.W #$FF00 : XBA : ASL #3 : TAY
    LDA.L Puyo.fallingFlag,X : BEQ .notFalling
    DEY #4

  .notFalling:
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing+4,Y : STA.B DP_Temp12
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing+6,Y : STA.B DP_Temp14
    CLC
    JSL MoveEnemyDownBy_14_12
    BCC .noCollision
    LDA.L Puyo.fallingFlag,X : BNE .falling
    LDA.B DP_Temp01 : STA.L Puyo.invertDirectionFlag,X
    LDA.L Puyo.direction,X : EOR.W #$0001 : STA.L Puyo.invertedDirection,X
    LDA.W #$0004 : STA.L Puyo.hopType,X
    LDA.W #Function_Puyo_Airborne_Dropping : STA.W Puyo.airborneFunction,X
    LDA.W #$0000 : STA.L Puyo.hoppingAnimationFlag,X
    BRA .gotoReturn

  .falling:
    LDA.W #Function_Puyo_Grounded : STA.W Puyo.function,X
    LDA.W #$0000 : STA.L Puyo.hoppingAnimationFlag,X

  .gotoReturn:
    BRA .return ; >.<

  .noCollision:
    LDY.W Puyo.hopTableIndex,X
    LDA.L Puyo.fallingFlag,X : BNE ..falling
    JSR SetRisingInstList
    LDA.W Puyo.YSpeedTableIndex,X : SEC : SBC.W PuyoHopTable_YSpeedTableIndexDelta,Y : STA.W Puyo.YSpeedTableIndex,X
    BRA +

  ..falling:
    JSR SetFallingInstList
    LDA.W Puyo.YSpeedTableIndex,X : CLC : ADC.W PuyoHopTable_YSpeedTableIndexDelta,Y : STA.W Puyo.YSpeedTableIndex,X

+   BPL .positiveIndex
    LDA.W #$0001 : STA.L Puyo.fallingFlag,X
    STZ.W Puyo.YSpeedTableIndex,X

  .positiveIndex:
    LDY.W Puyo.hopTableIndex,X
    LDA.W PuyoHopTable_XSpeed,Y : AND.W #$FF00 : XBA : STA.B DP_Temp14
    STZ.B DP_Temp12
    LDA.L Puyo.direction,X : BEQ .moveRight
    LDA.B DP_Temp14 : EOR.W #$FFFF : INC : STA.B DP_Temp14

  .moveRight:
    JSL MoveEnemyRightBy_14_12_IgnoreSlopes
    BCC .return
    LDA.W #$0001 : STA.L Puyo.invertDirectionFlag,X
    LDA.L Puyo.direction,X : EOR.W #$0001 : STA.L Puyo.invertedDirection,X
    LDA.W #$0000 : STA.L Puyo.hoppingAnimationFlag,X
    LDA.W #$0004 : STA.L Puyo.hopType,X
    LDA.W #Function_Puyo_Airborne_Dropping : STA.W Puyo.airborneFunction,X
    BRA .return ; >.<

  .return:
    RTS


;;; $9C71: Set rising instruction list ;;;
SetRisingInstList:
    LDX.W EnemyIndex
    LDA.L Puyo.direction,X : BNE .left
    LDA.W Puyo.YSpeedTableIndex,X : CMP.L Puyo.initialYSpeedTableIndex_3_4,X : BPL .rightFrame0
    CMP.L Puyo.initialYSpeedTableIndex_1_2,X : BPL .rightFrame1
    BRA .rightFrame2

  .rightFrame0:
    LDA.W #InstList_Puyo_HoppingRight_0_HoppingLeft_4
    BRA .return

  .rightFrame1:
    LDA.W #InstList_Puyo_HoppingRight_1_HoppingLeft_3
    BRA .return

  .rightFrame2:
    LDA.W #InstList_Puyo_Hopping_2
    BRA .return

  .left:
    LDA.W Puyo.YSpeedTableIndex,X : CMP.L Puyo.initialYSpeedTableIndex_3_4,X : BPL .leftFrame0
    CMP.L Puyo.initialYSpeedTableIndex_1_2,X : BPL .leftFrame1
    BRA .leftFrame2

  .leftFrame0:
    LDA.W #InstList_Puyo_HoppingRight_4_HoppingLeft_0
    BRA .return

  .leftFrame1:
    LDA.W #InstList_Puyo_HoppingRight_3_HoppingLeft_1
    BRA .return

  .leftFrame2:
    LDA.W #InstList_Puyo_Hopping_2
    BRA .return

  .return:
    JSR SetPuyoInstList
    RTS


;;; $9CBE: Set falling instruction list ;;;
SetFallingInstList:
    LDX.W EnemyIndex
    LDA.L Puyo.direction,X : BNE .left
    LDA.W Puyo.YSpeedTableIndex,X : CMP.L Puyo.initialYSpeedTableIndex_1_2,X : BMI .rightFrame2
    CMP.L Puyo.initialYSpeedTableIndex_3_4,X : BMI .rightFrame3
    BRA .rightFrame4

  .rightFrame2:
    LDA.W #InstList_Puyo_Hopping_2
    BRA .return

  .rightFrame3:
    LDA.W #InstList_Puyo_HoppingRight_3_HoppingLeft_1
    BRA .return

  .rightFrame4:
    LDA.W #InstList_Puyo_HoppingRight_4_HoppingLeft_0
    BRA .return

  .left:
    LDA.W Puyo.YSpeedTableIndex,X : CMP.L Puyo.initialYSpeedTableIndex_1_2,X : BMI .leftFrame2
    CMP.L Puyo.initialYSpeedTableIndex_3_4,X : BMI .leftFrame3
    BRA .leftFrame4

  .leftFrame2:
    LDA.W #InstList_Puyo_Hopping_2
    BRA .return

  .leftFrame3:
    LDA.W #InstList_Puyo_HoppingRight_1_HoppingLeft_3
    BRA .return

  .leftFrame4:
    LDA.W #InstList_Puyo_HoppingRight_0_HoppingLeft_4
    BRA .return

  .return:
    JSR SetPuyoInstList
    RTS


;;; $9D0B: Puyo airborne function - normal - short hop ;;;
Function_Puyo_Airborne_Normal_ShortHop:
    LDX.W EnemyIndex
    JSR PuyoMovement
    LDA.L Puyo.invertDirectionFlag,X : BNE .inverted
    LDA.L Puyo.hoppingAnimationFlag,X : BNE .return

  .inverted:
    LDA.W #$0000 : STA.L Puyo.hoppingAnimationFlag,X
    LDA.W #InstList_Puyo_GroundedDropping_Slow
    JSR SetPuyoInstList

  .return:
    RTS


;;; $9D2B: Puyo airborne function - normal - big hop ;;;
Function_Puyo_Airborne_Normal_BigHop:
    LDX.W EnemyIndex
    JSR PuyoMovement
    LDA.L Puyo.invertDirectionFlag,X : BNE .inverted
    LDA.L Puyo.hoppingAnimationFlag,X : BNE .return

  .inverted:
    LDA.W #$0000 : STA.L Puyo.hoppingAnimationFlag,X
    LDA.W #InstList_Puyo_GroundedDropping_Medium
    JSR SetPuyoInstList

  .return:
    RTS


;;; $9D4B: Puyo airborne function - normal - long hop ;;;
Function_Puyo_Airborne_Normal_LongHop:
    LDX.W EnemyIndex
    JSR PuyoMovement
    LDA.L Puyo.invertDirectionFlag,X : BNE .inverted
    LDA.L Puyo.hoppingAnimationFlag,X : BNE .return

  .inverted:
    LDA.W #$0000 : STA.L Puyo.hoppingAnimationFlag,X
    LDA.W #InstList_Puyo_GroundedDropping_Fast
    JSR SetPuyoInstList

  .return:
    RTS


;;; $9D6B: Puyo airborne function - giant hop ;;;
Function_Puyo_Airborne_GiantHop:
    LDX.W EnemyIndex
    JSR PuyoMovement
    LDA.L Puyo.invertDirectionFlag,X : BNE .inverted
    LDA.L Puyo.hoppingAnimationFlag,X : BNE .return
    LDA.W #$0000 : STA.L Puyo.hopType,X
    LDA.W #Function_Puyo_Grounded : STA.W Puyo.function,X

  .inverted:
    LDA.W #$0000 : STA.L Puyo.hoppingAnimationFlag,X
    LDA.W #InstList_Puyo_GroundedDropping_Slow
    JSR SetPuyoInstList

  .return:
    RTS


;;; $9D98: Puyo airborne function - dropping ;;;
Function_Puyo_Airborne_Dropping:
    LDX.W EnemyIndex
    LDY.W Puyo.hopTableIndex,X
    LDA.W PuyoHopTable_YSpeedTableIndexDelta,Y : AND.W #$FF00 : XBA : STA.B DP_Temp14
    LDA.W PuyoHopTable_YSpeedTableIndexDelta,Y : AND.W #$00FF : XBA : STA.B DP_Temp12
    JSL MoveEnemyDownBy_14_12
    BCC .return
    JSR GetRandomNumber0_7
    LDA.B DP_Temp1C : AND.W #$0001 : CLC : ADC.W #$0005 : STA.L Puyo.hopType,X
    LDA.W #Function_Puyo_Grounded : STA.W Puyo.function,X

  .return:
    RTS


;;; $9DCD: Puyo airborne function - dropped ;;;
Function_Puyo_Airborne_Dropped:
    LDX.W EnemyIndex
    JSR PuyoMovement
    LDA.L Puyo.hoppingAnimationFlag,X : BNE .return
    LDA.W #$0000 : STA.L Puyo.hoppingAnimationFlag,X
    LDA.W #$0003 : STA.L Puyo.hopType,X
    LDA.W #Function_Puyo_Grounded : STA.W Puyo.function,X
    LDA.W #InstList_Puyo_GroundedDropping_Slow
    JSR SetPuyoInstList

  .return:
    RTS


;;; $9DF4: RTL ;;;
RTL_A29DF4:
    RTL


;;; $9DF5: RTL ;;;
RTL_A29DF5:
    RTL


;;; $9DF6: Spritemaps - puyo ;;;
Spritemap_Puyo_0:
    dw $0002
    %spritemapEntry(0, $00, $FC, 0, 1, 2, 0, $100)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 0, $100)

Spritemap_Puyo_1:
    dw $0002
    %spritemapEntry(0, $00, $FC, 0, 1, 2, 0, $101)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 0, $101)

Spritemap_Puyo_2:
    dw $0002
    %spritemapEntry(0, $00, $FC, 0, 1, 2, 0, $102)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 0, $102)

Spritemap_Puyo_3:
    dw $0002
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 0, $108)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 0, $107)

Spritemap_Puyo_4:
    dw $0003
    %spritemapEntry(0, $04, $FC, 0, 0, 2, 0, $10B)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 0, $10A)
    %spritemapEntry(0, $1F4, $FC, 0, 0, 2, 0, $109)

Spritemap_Puyo_5:
    dw $0004
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 0, $10F)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 0, $10D)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 0, $10C)

Spritemap_Puyo_6:
    dw $0003
    %spritemapEntry(0, $1F4, $FC, 0, 1, 2, 0, $10B)
    %spritemapEntry(0, $1FC, $FC, 0, 1, 2, 0, $10A)
    %spritemapEntry(0, $04, $FC, 0, 1, 2, 0, $109)

Spritemap_Puyo_7:
    dw $0002
    %spritemapEntry(0, $1F8, $FC, 0, 1, 2, 0, $108)
    %spritemapEntry(0, $00, $FC, 0, 1, 2, 0, $107)


;;; $9E6A: Palette - enemy $CFFF (cacatac) ;;;
Palette_Cacatac:
    dw $3800,$3F57,$2E4D,$00E2,$0060,$3AB0,$220B,$1166
    dw $0924,$57FF,$42F7,$2610,$158C,$017F,$0016,$300A


;;; $9E8A: Instruction list - upside up - idling ;;;
InstList_Cacatac_UpsideUp_Idling:
    dw Instruction_Cacatac_SetFunction_MovingLeftRight
    dw $0008,Spritemap_Cacatac_0
    dw $0008,Spritemap_Cacatac_1
    dw $0008,Spritemap_Cacatac_2
    dw $0008,Spritemap_Cacatac_3
    dw $0008,Spritemap_Cacatac_4
    dw $0008,Spritemap_Cacatac_5
    dw $0008,Spritemap_Cacatac_6
    dw $0008,Spritemap_Cacatac_7
    dw Instruction_Common_GotoY
    dw InstList_Cacatac_UpsideUp_Idling


;;; $9EB0: Instruction list - upside up - attacking ;;;
InstList_Cacatac_UpsideUp_Attacking:
    dw $0015,Spritemap_Cacatac_0
    dw $0005,Spritemap_Cacatac_8
    dw $0015,Spritemap_Cacatac_9
    dw $0005,Spritemap_Cacatac_8
    dw Instruction_Cacatac_PlaySpikesSFX
    dw Instruction_Cacatac_SpawnSpikeProjectileWithParameterInY,$0000
    dw Instruction_Cacatac_SpawnSpikeProjectileWithParameterInY,$000C
    dw Instruction_Cacatac_SpawnSpikeProjectileWithParameterInY,$0002
    dw Instruction_Cacatac_SpawnSpikeProjectileWithParameterInY,$000E
    dw Instruction_Cacatac_SpawnSpikeProjectileWithParameterInY,$0004
    dw Instruction_Common_GotoY
    dw InstList_Cacatac_UpsideUp_Idling


;;; $9EDA: Instruction list - upside down - idling ;;;
InstList_Cacatac_UpsideDown_Idling_0:
    dw Instruction_Cacatac_SetFunction_MovingLeftRight

InstList_Cacatac_UpsideDown_Idling_1:
    dw $0008,Spritemap_Cacatac_A
    dw $0008,Spritemap_Cacatac_B
    dw $0008,Spritemap_Cacatac_C
    dw $0008,Spritemap_Cacatac_D
    dw $0008,Spritemap_Cacatac_E
    dw $0008,Spritemap_Cacatac_F
    dw $0008,Spritemap_Cacatac_10
    dw $0008,Spritemap_Cacatac_11
    dw Instruction_Common_GotoY
    dw InstList_Cacatac_UpsideDown_Idling_1


;;; $9F00: Instruction list - upside down - attacking ;;;
InstList_Cacatac_UpsideDown_Attacking:
    dw $0015,Spritemap_Cacatac_A
    dw $0005,Spritemap_Cacatac_12
    dw $0015,Spritemap_Cacatac_13
    dw $0005,Spritemap_Cacatac_12
    dw Instruction_Cacatac_PlaySpikesSFX
    dw Instruction_Cacatac_SpawnSpikeProjectileWithParameterInY,$0006
    dw Instruction_Cacatac_SpawnSpikeProjectileWithParameterInY,$0010
    dw Instruction_Cacatac_SpawnSpikeProjectileWithParameterInY,$0008
    dw Instruction_Cacatac_SpawnSpikeProjectileWithParameterInY,$0012
    dw Instruction_Cacatac_SpawnSpikeProjectileWithParameterInY,$000A
    dw Instruction_Common_GotoY
    dw InstList_Cacatac_UpsideDown_Idling_0


;;; $9F2A: Instruction - play cacatac spikes effect ;;;
Instruction_Cacatac_PlaySpikesSFX:
    PHX : PHY
    LDA.W #$0034
    JSL QueueSound_Lib2_Max6
    PLY : PLX
    RTL


;;; $9F36: Cacatac max travel distances ;;;
CacatacMaxTravelDistances:
; Indexed by enemy parameter 2 low
    dw $0010,$0040,$0050,$0060,$0070,$0080


;;; $9F42: Cacatac function pointers ;;;
CacatacFunctionPointers:
; Indexed by enemy parameter 1 low
    dw Function_Cacatac_MovingLeft
    dw Function_Cacatac_MovingRight
    dw RTS_A2A01B


;;; $9F48: Initialisation AI - enemy $CFFF (cacatac) ;;;
InitAI_Cacatac:
    LDX.W EnemyIndex
    LDA.W #Spritemap_Common_Nothing : STA.W Enemy.spritemap,X
    LDA.W Enemy.init0+1,X : AND.W #$00FF : BEQ .upsideDown
    JSR SetCacatacInstList_UpsideUp_Idling
    BRA +

  .upsideDown:
    JSR SetCacatacInstList_UpsideDown_Idling

+   LDA.W Enemy.init0,X : AND.W #$00FF : STA.W Cacatac.direction,X
    ASL : TAY
    LDA.W CacatacFunctionPointers,Y : STA.W Cacatac.function,X
    LDA.W Enemy.init1,X : AND.W #$00FF : ASL : TAY
    LDA.W Enemy.XPosition,X : CLC : ADC.W CacatacMaxTravelDistances,Y : STA.L Cacatac.maximumXPosition,X
    LDA.W Enemy.XPosition,X : SEC : SBC.W CacatacMaxTravelDistances,Y : STA.L Cacatac.minimumXPosition,X
    LDA.W Enemy.init1+1,X : AND.W #$00FF : ASL #3 : TAY
    LDA.W CommonEnemySpeeds_LinearlyIncreasing,Y : STA.W Cacatac.rightVelocity,X
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+2,Y : STA.W Cacatac.rightSubVelocity,X
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+4,Y : STA.W Cacatac.leftVelocity,X
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+6,Y : STA.W Cacatac.leftSubVelocity,X
    RTL


;;; $9FB3: Main AI - enemy $CFFF (cacatac) ;;;
MainAI_Cacatac:
    LDX.W EnemyIndex
    JSR.W (Cacatac.function,X)
    RTL


;;; $9FBA: Cacatac function - moving left ;;;
Function_Cacatac_MovingLeft:
    LDX.W EnemyIndex
    LDA.W Enemy.XSubPosition,X : CLC : ADC.W Cacatac.leftSubVelocity,X : BCC +
    INC.W Enemy.XPosition,X

+   STA.W Enemy.XSubPosition,X
    LDA.W Enemy.XPosition,X : CLC : ADC.W Cacatac.leftVelocity,X : STA.W Enemy.XPosition,X
    CMP.L Cacatac.minimumXPosition,X : BPL .attack
    LDA.W #Function_Cacatac_MovingRight : STA.W Cacatac.function,X
    LDA.W #$0001 : STA.W Cacatac.direction,X

  .attack:
    JSR MaybeMakeCacatacAttack
    RTS


;;; $9FEC: Cacatac function - moving right ;;;
Function_Cacatac_MovingRight:
    LDX.W EnemyIndex
    LDA.W Enemy.XSubPosition,X : CLC : ADC.W Cacatac.rightSubVelocity,X : BCC +
    INC.W Enemy.XPosition,X

+   STA.W Enemy.XSubPosition,X
    LDA.W Enemy.XPosition,X : CLC : ADC.W Cacatac.rightVelocity,X : STA.W Enemy.XPosition,X
    CMP.L Cacatac.maximumXPosition,X : BMI .attack
    LDA.W #Function_Cacatac_MovingLeft : STA.W Cacatac.function,X
    STZ.W Cacatac.direction,X

  .attack:
    JSR MaybeMakeCacatacAttack
    RTS


;;; $A01B: RTS ;;;
RTS_A2A01B:
    RTS


;;; $A01C: Maybe make cacatac attack ;;;
MaybeMakeCacatacAttack:
    LDX.W EnemyIndex
    JSL GenerateRandomNumber
    LDA.W RandomNumberSeed : CLC : ADC.W Enemy.frameCounter,X
    AND.W #$00FF : CMP.W #$0003 : BPL .return
    LDA.W #RTS_A2A01B : STA.W Cacatac.function,X
    LDA.W Enemy.init0+1,X : AND.W #$00FF : BEQ .keepUpsideUp
    JSR SetCacatacInstList_UpsideUp_Attacking
    BRA .return

  .keepUpsideUp:
    JSR SetCacatacInstList_UpsideDown_Attacking

  .return:
    RTS


;;; $A049: Set cacatac instruction list - upside up - idling ;;;
SetCacatacInstList_UpsideUp_Idling:
    LDX.W EnemyIndex
    LDA.W #InstList_Cacatac_UpsideUp_Idling : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    RTS


;;; $A05C: Set cacatac instruction list - upside up - attacking ;;;
SetCacatacInstList_UpsideUp_Attacking:
    LDX.W EnemyIndex
    LDA.W #InstList_Cacatac_UpsideUp_Attacking : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    RTS


;;; $A06F: Set cacatac instruction list - upside down - idling ;;;
SetCacatacInstList_UpsideDown_Idling:
    LDX.W EnemyIndex
    LDA.W #InstList_Cacatac_UpsideDown_Idling_0 : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    RTS


;;; $A082: Set cacatac instruction list - upside down - attacking ;;;
SetCacatacInstList_UpsideDown_Attacking:
    LDX.W EnemyIndex
    LDA.W #InstList_Cacatac_UpsideDown_Attacking : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    RTS


;;; $A095: Instruction - function = moving left/right ;;;
Instruction_Cacatac_SetFunction_MovingLeftRight:
    LDA.W #Function_Cacatac_MovingLeft : STA.W Cacatac.function,X
    LDA.W Cacatac.direction,X : BEQ .return
    LDA.W #Function_Cacatac_MovingRight : STA.W Cacatac.function,X

  .return:
    RTL


;;; $A0A7: Instruction - spawn cacatac spike enemy projectile with parameter [[Y]] ;;;
Instruction_Cacatac_SpawnSpikeProjectileWithParameterInY:
    PHY
    LDA.W $0000,Y
    LDX.W EnemyIndex
    LDY.W #EnemyProjectile_Cacatac
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    PLY
    INY #2
    RTL


;;; $A0B9: RTL ;;;
RTL_A2A0B9:
    RTL


;;; $A0BA: RTL ;;;
RTL_A2A0BA:
    RTL


;;; $A0BB: Spritemaps - cacatac ;;;
Spritemap_Cacatac_0:
    dw $0006
    %spritemapEntry(0, $00, $04, 0, 1, 2, 0, $10C)
    %spritemapEntry(0, $04, $04, 0, 1, 2, 0, $10B)
    %spritemapEntry(0, $1F8, $04, 0, 0, 2, 0, $10C)
    %spritemapEntry(0, $1F4, $04, 0, 0, 2, 0, $10B)
    %spritemapEntry(0, $1FC, $EF, 0, 0, 2, 0, $11C)
    %spritemapEntry(1, $43F8, $F7, 0, 0, 2, 0, $100)

Spritemap_Cacatac_1:
    dw $0006
    %spritemapEntry(0, $1F8, $04, 0, 0, 2, 0, $10C)
    %spritemapEntry(0, $1F4, $05, 0, 0, 2, 0, $10C)
    %spritemapEntry(0, $00, $04, 0, 1, 2, 0, $10C)
    %spritemapEntry(0, $04, $04, 0, 1, 2, 0, $10B)
    %spritemapEntry(0, $1FC, $F0, 0, 0, 2, 0, $11C)
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 0, $100)

Spritemap_Cacatac_2:
    dw $0006
    %spritemapEntry(0, $1FA, $05, 0, 0, 2, 0, $10D)
    %spritemapEntry(0, $1F4, $04, 0, 0, 2, 0, $10C)
    %spritemapEntry(0, $00, $04, 0, 1, 2, 0, $10C)
    %spritemapEntry(0, $04, $04, 0, 1, 2, 0, $10B)
    %spritemapEntry(0, $1FC, $F0, 0, 0, 2, 0, $11C)
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 0, $100)

Spritemap_Cacatac_3:
    dw $0006
    %spritemapEntry(0, $00, $05, 0, 1, 2, 0, $10B)
    %spritemapEntry(0, $1FA, $04, 0, 0, 2, 0, $10D)
    %spritemapEntry(0, $1F4, $04, 0, 0, 2, 0, $10C)
    %spritemapEntry(0, $04, $04, 0, 1, 2, 0, $10B)
    %spritemapEntry(0, $1FC, $F1, 0, 0, 2, 0, $11C)
    %spritemapEntry(1, $43F8, $F9, 0, 0, 2, 0, $100)

Spritemap_Cacatac_4:
    dw $0006
    %spritemapEntry(0, $00, $04, 0, 1, 2, 0, $10B)
    %spritemapEntry(0, $04, $05, 0, 1, 2, 0, $10C)
    %spritemapEntry(0, $1FA, $04, 0, 0, 2, 0, $10D)
    %spritemapEntry(0, $1F4, $04, 0, 0, 2, 0, $10C)
    %spritemapEntry(0, $1FC, $F1, 0, 0, 2, 0, $11C)
    %spritemapEntry(1, $43F8, $F9, 0, 0, 2, 0, $100)

Spritemap_Cacatac_5:
    dw $0006
    %spritemapEntry(0, $00, $05, 0, 1, 2, 0, $10C)
    %spritemapEntry(0, $04, $04, 0, 1, 2, 0, $10C)
    %spritemapEntry(0, $1FA, $04, 0, 0, 2, 0, $10D)
    %spritemapEntry(0, $1F4, $04, 0, 0, 2, 0, $10C)
    %spritemapEntry(0, $1FC, $F0, 0, 0, 2, 0, $11C)
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 0, $100)

Spritemap_Cacatac_6:
    dw $0006
    %spritemapEntry(0, $00, $04, 0, 1, 2, 0, $10C)
    %spritemapEntry(0, $04, $04, 0, 1, 2, 0, $10C)
    %spritemapEntry(0, $1F8, $05, 0, 0, 2, 0, $10C)
    %spritemapEntry(0, $1F4, $04, 0, 0, 2, 0, $10C)
    %spritemapEntry(0, $1FC, $F0, 0, 0, 2, 0, $11C)
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 0, $100)

Spritemap_Cacatac_7:
    dw $0006
    %spritemapEntry(0, $00, $04, 0, 1, 2, 0, $10C)
    %spritemapEntry(0, $04, $04, 0, 1, 2, 0, $10C)
    %spritemapEntry(0, $1F8, $04, 0, 0, 2, 0, $10C)
    %spritemapEntry(0, $1F4, $05, 0, 0, 2, 0, $10B)
    %spritemapEntry(0, $1FC, $EF, 0, 0, 2, 0, $11C)
    %spritemapEntry(1, $43F8, $F7, 0, 0, 2, 0, $100)

Spritemap_Cacatac_8:
    dw $000A
    %spritemapEntry(0, $1FC, $ED, 0, 0, 2, 0, $11C)
    %spritemapEntry(0, $00, $04, 0, 1, 2, 0, $10C)
    %spritemapEntry(0, $04, $04, 0, 1, 2, 0, $10B)
    %spritemapEntry(0, $1F8, $04, 0, 0, 2, 0, $10C)
    %spritemapEntry(0, $1F4, $04, 0, 0, 2, 0, $10B)
    %spritemapEntry(0, $04, $02, 0, 0, 2, 0, $10A)
    %spritemapEntry(0, $1FC, $02, 0, 0, 2, 0, $109)
    %spritemapEntry(0, $1F4, $02, 0, 0, 2, 0, $108)
    %spritemapEntry(1, $43FC, $F2, 0, 0, 2, 0, $103)
    %spritemapEntry(1, $43F4, $F2, 0, 0, 2, 0, $102)

Spritemap_Cacatac_9:
    dw $000A
    %spritemapEntry(0, $1FC, $E9, 0, 0, 2, 0, $11C)
    %spritemapEntry(0, $00, $04, 0, 1, 2, 0, $10C)
    %spritemapEntry(0, $04, $04, 0, 1, 2, 0, $10B)
    %spritemapEntry(0, $1F8, $04, 0, 0, 2, 0, $10C)
    %spritemapEntry(0, $1F4, $04, 0, 0, 2, 0, $10B)
    %spritemapEntry(0, $04, $00, 0, 0, 2, 0, $11A)
    %spritemapEntry(0, $1FC, $00, 0, 0, 2, 0, $119)
    %spritemapEntry(0, $1F4, $00, 0, 0, 2, 0, $118)
    %spritemapEntry(1, $43FC, $F0, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $43F4, $F0, 0, 0, 2, 0, $105)

Spritemap_Cacatac_A:
    dw $0006
    %spritemapEntry(0, $00, $F4, 1, 1, 2, 0, $10C)
    %spritemapEntry(0, $04, $F4, 1, 1, 2, 0, $10B)
    %spritemapEntry(0, $1F8, $F4, 1, 0, 2, 0, $10C)
    %spritemapEntry(0, $1F4, $F4, 1, 0, 2, 0, $10B)
    %spritemapEntry(0, $1FC, $09, 1, 0, 2, 0, $11C)
    %spritemapEntry(1, $43F8, $F9, 1, 0, 2, 0, $100)

Spritemap_Cacatac_B:
    dw $0006
    %spritemapEntry(0, $1F8, $F4, 1, 0, 2, 0, $10C)
    %spritemapEntry(0, $1F4, $F3, 1, 0, 2, 0, $10C)
    %spritemapEntry(0, $00, $F4, 1, 1, 2, 0, $10C)
    %spritemapEntry(0, $04, $F4, 1, 1, 2, 0, $10B)
    %spritemapEntry(0, $1FC, $08, 1, 0, 2, 0, $11C)
    %spritemapEntry(1, $43F8, $F8, 1, 0, 2, 0, $100)

Spritemap_Cacatac_C:
    dw $0006
    %spritemapEntry(0, $1FA, $F3, 1, 0, 2, 0, $10D)
    %spritemapEntry(0, $1F4, $F4, 1, 0, 2, 0, $10C)
    %spritemapEntry(0, $00, $F4, 1, 1, 2, 0, $10C)
    %spritemapEntry(0, $04, $F4, 1, 1, 2, 0, $10B)
    %spritemapEntry(0, $1FC, $08, 1, 0, 2, 0, $11C)
    %spritemapEntry(1, $43F8, $F8, 1, 0, 2, 0, $100)

Spritemap_Cacatac_D:
    dw $0006
    %spritemapEntry(0, $00, $F3, 1, 1, 2, 0, $10B)
    %spritemapEntry(0, $1FA, $F4, 1, 0, 2, 0, $10D)
    %spritemapEntry(0, $1F4, $F4, 1, 0, 2, 0, $10C)
    %spritemapEntry(0, $04, $F4, 1, 1, 2, 0, $10B)
    %spritemapEntry(0, $1FC, $07, 1, 0, 2, 0, $11C)
    %spritemapEntry(1, $43F8, $F7, 1, 0, 2, 0, $100)

Spritemap_Cacatac_E:
    dw $0006
    %spritemapEntry(0, $00, $F4, 1, 1, 2, 0, $10B)
    %spritemapEntry(0, $04, $F3, 1, 1, 2, 0, $10C)
    %spritemapEntry(0, $1FA, $F4, 1, 0, 2, 0, $10D)
    %spritemapEntry(0, $1F4, $F4, 1, 0, 2, 0, $10C)
    %spritemapEntry(0, $1FC, $07, 1, 0, 2, 0, $11C)
    %spritemapEntry(1, $43F8, $F7, 1, 0, 2, 0, $100)

Spritemap_Cacatac_F:
    dw $0006
    %spritemapEntry(0, $00, $F3, 1, 1, 2, 0, $10C)
    %spritemapEntry(0, $04, $F4, 1, 1, 2, 0, $10C)
    %spritemapEntry(0, $1FA, $F4, 1, 0, 2, 0, $10D)
    %spritemapEntry(0, $1F4, $F4, 1, 0, 2, 0, $10C)
    %spritemapEntry(0, $1FC, $08, 1, 0, 2, 0, $11C)
    %spritemapEntry(1, $43F8, $F8, 1, 0, 2, 0, $100)

Spritemap_Cacatac_10:
    dw $0006
    %spritemapEntry(0, $00, $F4, 1, 1, 2, 0, $10C)
    %spritemapEntry(0, $04, $F4, 1, 1, 2, 0, $10C)
    %spritemapEntry(0, $1F8, $F3, 1, 0, 2, 0, $10C)
    %spritemapEntry(0, $1F4, $F4, 1, 0, 2, 0, $10C)
    %spritemapEntry(0, $1FC, $08, 1, 0, 2, 0, $11C)
    %spritemapEntry(1, $43F8, $F8, 1, 0, 2, 0, $100)

Spritemap_Cacatac_11:
    dw $0006
    %spritemapEntry(0, $00, $F4, 1, 1, 2, 0, $10C)
    %spritemapEntry(0, $04, $F4, 1, 1, 2, 0, $10C)
    %spritemapEntry(0, $1F8, $F4, 1, 0, 2, 0, $10C)
    %spritemapEntry(0, $1F4, $F3, 1, 0, 2, 0, $10B)
    %spritemapEntry(0, $1FC, $09, 1, 0, 2, 0, $11C)
    %spritemapEntry(1, $43F8, $F9, 1, 0, 2, 0, $100)

Spritemap_Cacatac_12:
    dw $000A
    %spritemapEntry(0, $1FC, $0B, 1, 0, 2, 0, $11C)
    %spritemapEntry(0, $00, $F4, 1, 1, 2, 0, $10C)
    %spritemapEntry(0, $04, $F4, 1, 1, 2, 0, $10B)
    %spritemapEntry(0, $1F8, $F4, 1, 0, 2, 0, $10C)
    %spritemapEntry(0, $1F4, $F4, 1, 0, 2, 0, $10B)
    %spritemapEntry(0, $04, $F6, 1, 0, 2, 0, $10A)
    %spritemapEntry(0, $1FC, $F6, 1, 0, 2, 0, $109)
    %spritemapEntry(0, $1F4, $F6, 1, 0, 2, 0, $108)
    %spritemapEntry(1, $43FC, $FE, 1, 0, 2, 0, $103)
    %spritemapEntry(1, $43F4, $FE, 1, 0, 2, 0, $102)

Spritemap_Cacatac_13:
    dw $000A
    %spritemapEntry(0, $1FC, $0F, 1, 0, 2, 0, $11C)
    %spritemapEntry(0, $00, $F4, 1, 1, 2, 0, $10C)
    %spritemapEntry(0, $04, $F4, 1, 1, 2, 0, $10B)
    %spritemapEntry(0, $1F8, $F4, 1, 0, 2, 0, $10C)
    %spritemapEntry(0, $1F4, $F4, 1, 0, 2, 0, $10B)
    %spritemapEntry(0, $04, $F8, 1, 0, 2, 0, $11A)
    %spritemapEntry(0, $1FC, $F8, 1, 0, 2, 0, $119)
    %spritemapEntry(0, $1F4, $F8, 1, 0, 2, 0, $118)
    %spritemapEntry(1, $43FC, $00, 1, 0, 2, 0, $106)
    %spritemapEntry(1, $43F4, $00, 1, 0, 2, 0, $105)


;;; $A38B: Palette - enemy $D03F (owtch) ;;;
Palette_Owtch:
    dw $3800,$4B9C,$2610,$0CC6,$0C63,$42F7,$2A52,$19AD
    dw $0D29,$5E59,$3D72,$2CEE,$1447,$033B,$0216,$0113


;;; $A3AB: Instruction list - moving left ;;;
InstList_Owtch_MovingLeft_0:
    dw Instruction_Owtch_0

InstList_Owtch_MovingLeft_1:
    dw $0008,Spritemap_Owtch_0
    dw $0008,Spritemap_Owtch_1
    dw $0008,Spritemap_Owtch_2
    dw Instruction_Common_GotoY
    dw InstList_Owtch_MovingLeft_1


;;; $A3BD: Instruction list - moving right ;;;
InstList_Owtch_MovingRight_0:
    dw Instruction_Owtch_1

InstList_Owtch_MovingRight_1:
    dw $0008,Spritemap_Owtch_2
    dw $0008,Spritemap_Owtch_1
    dw $0008,Spritemap_Owtch_0
    dw Instruction_Common_GotoY
    dw InstList_Owtch_MovingRight_1


;;; $A3CF: Owtch data ;;;
OwtchConstants:
  .initAIPointers:
; Initialisation AI pointers
    dw SetOwtchInitialInstListPointer_MovingLeft
    dw SetOwtchInitialInstListPointer_MovingRight

  .functionPointers:
; Functions pointers
    dw Function_Owtch_0_MovingLeft
    dw Function_Owtch_1_MovingRight
    dw Function_Owtch_2_Underground
    dw Function_Owtch_3_Sinking
    dw Function_Owtch_4_Rising

  .XDistanceRanges:
; X distance ranges
    dw $0010,$0020,$0030,$0040,$0050,$0060,$0070,$0080

  .undergroundTimers:
; Underground timers
    dw $0020,$0040,$0060,$0080,$00A0,$00C0


;;; $A3F9: Initialisation AI - enemy $D03F (owtch) ;;;
InitAI_Owtch:
    LDX.W EnemyIndex
    LDA.W #Spritemap_Common_Nothing : STA.W Enemy.spritemap,X
    LDA.W Enemy.init0,X : AND.W #$00FF : STA.W Owtch.direction,X
    AND.W #$0001 : ASL : TAX
    JSR.W (OwtchConstants_initAIPointers,X)
    LDX.W EnemyIndex
    LDA.W Enemy.init1,X : AND.W #$00FF : ASL #3 : TAY
    LDA.W CommonEnemySpeeds_LinearlyIncreasing,Y : STA.W Owtch.rightVelocity,X
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+2,Y : STA.W Owtch.rightSubVelocity,X
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+4,Y : STA.W Owtch.leftVelocity,X
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+6,Y : STA.W Cacatac.leftSubVelocity,X
    LDA.W Enemy.init1+1,X : AND.W #$00FF : ASL : TAY
    LDA.W Enemy.XPosition,X : CLC : ADC.W OwtchConstants_XDistanceRanges,Y : STA.L Owtch.maximumXPosition,X
    LDA.W Enemy.XPosition,X : SEC : SBC.W OwtchConstants_XDistanceRanges,Y : STA.L Owtch.minimumXPosition,X
    LDA.W Enemy.init0+1,X : AND.W #$00FF : ASL : TAY
    LDA.W OwtchConstants_undergroundTimers,Y : STA.L Owtch.undergroundTimer,X
    STZ.W Owtch.sinkYOffset,X
    LDA.W Owtch.direction,X : CMP.W #$0002 : BNE .return
    LDA.W #$0010 : STA.W Owtch.sinkYOffset,X
    CLC : ADC.W Enemy.YPosition,X : STA.W Enemy.YPosition,X

  .return:
    RTL


;;; $A47E: Main AI - enemy $D03F (owtch) ;;;
MainAI_Owtch:
    LDX.W EnemyIndex
    LDA.W Owtch.direction,X : ASL : TAX
    JSR.W (OwtchConstants_functionPointers,X)
    RTL


;;; $A48A: Set owtch instruction list pointer - moving left ;;;
SetOwtchInitialInstListPointer_MovingLeft:
    LDX.W EnemyIndex
    LDA.W #InstList_Owtch_MovingLeft_0 : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    RTS


;;; $A49D: Owtch function index -1 / set owtch instruction list pointer - moving right ;;;
SetOwtchInitialInstListPointer_MovingRight:
    LDX.W EnemyIndex
    LDA.W #InstList_Owtch_MovingRight_0 : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    RTS


;;; $A4B0: Owtch function index 0 - moving left ;;;
Function_Owtch_0_MovingLeft:
; The decrement at $A4D2 is almost certainly supposed to be an increment
; It just about works out though, with SetOwtchInitialInstListPointer_MovingRight being called as a result,
; and the instruction list that gets issued immediately sets the function index to 1 as it should be
    LDX.W EnemyIndex
    LDA.W Enemy.XSubPosition,X : CLC : ADC.W Owtch.leftSubVelocity,X : BCC +
    INC.W Enemy.XPosition,X

+   STA.W Enemy.XSubPosition,X
    LDA.W Enemy.XPosition,X : CLC : ADC.W Owtch.leftVelocity,X : STA.W Enemy.XPosition,X
    CMP.L Owtch.minimumXPosition,X : BPL +
    DEC.W Owtch.direction,X

+   JSR MaybeMakeOwtchSink
    RTS


;;; $A4D9: Owtch function index 1 - moving right ;;;
Function_Owtch_1_MovingRight:
    LDX.W EnemyIndex
    LDA.W Enemy.XSubPosition,X : CLC : ADC.W Owtch.rightSubVelocity,X : BCC +
    INC.W Enemy.XPosition,X

+   STA.W Enemy.XSubPosition,X
    LDA.W Enemy.XPosition,X : CLC : ADC.W Owtch.rightVelocity,X : STA.W Enemy.XPosition,X
    CMP.L Owtch.maximumXPosition,X : BMI +
    STZ.W Owtch.direction,X

+   JSR MaybeMakeOwtchSink
    RTS


;;; $A502: Owtch function index 2 - underground ;;;
Function_Owtch_2_Underground:
    LDX.W EnemyIndex
    LDA.L Owtch.undergroundTimer,X : DEC : STA.L Owtch.undergroundTimer,X : BNE .return
    LDA.W #$0004 : STA.W Owtch.direction,X

  .return:
    RTS


;;; $A517: Owtch function index 3 - sinking ;;;
Function_Owtch_3_Sinking:
    LDX.W EnemyIndex
    INC.W Enemy.YPosition,X
    INC.W Owtch.sinkYOffset,X
    LDA.W Owtch.sinkYOffset,X : CMP.W #$0010 : BMI .return
    LDA.W #$0002 : STA.W Owtch.direction,X
    LDA.W Enemy.init0+1,X : AND.W #$00FF : ASL : TAY
    LDA.W OwtchConstants_undergroundTimers,Y : STA.L Owtch.undergroundTimer,X

  .return:
    RTS


;;; $A53E: Owtch function index 4 - rising ;;;
Function_Owtch_4_Rising:
    LDX.W EnemyIndex
    DEC.W Enemy.YPosition,X
    DEC.W Owtch.sinkYOffset,X : BNE .return
    LDA.W RandomNumberSeed+1 : AND.W #$0001 : STA.W Owtch.direction,X

  .return:
    RTS


;;; $A553: Maybe make owtch sink ;;;
MaybeMakeOwtchSink:
    JSL GenerateRandomNumber
    LDA.W RandomNumberSeed : CLC : ADC.W Enemy.frameCounter,X
    AND.W #$00FF : CMP.W #$0006 : BPL .return
    LDA.W #$0003 : STA.W Owtch.direction,X

  .return:
    RTS


;;; $A56D: Instruction - enemy function index = 0 ;;;
Instruction_Owtch_0:
    STZ.W Owtch.direction,X
    RTL


;;; $A571: Instruction - enemy function index = 1 ;;;
Instruction_Owtch_1:
    LDA.W #$0001 : STA.W Owtch.direction,X
    RTL


;;; $A578: RTL ;;;
RTL_A2A578:
    RTL


;;; $A579: Enemy shot - enemy $D03F (owtch) ;;;
EnemyShot_Owtch:
    LDX.W EnemyIndex
    LDA.W Owtch.direction,X : CMP.W #$0001 : BPL .return
    JSL CommonA2_NormalEnemyShotAI

  .return:
    RTL


;;; $A589: Spritemaps - owtch ;;;
Spritemap_Owtch_0:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 0, $100)

Spritemap_Owtch_1:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 0, $102)

Spritemap_Owtch_2:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 0, $104)


;;; $A59E: Palette - enemy $D07F/$D0BF (gunship) ;;;
Palette_Ship:
    dw $3800,$0295,$0190,$0403,$0001,$0211,$014D,$00C9
    dw $0024,$3BE0,$2680,$1580,$24C6,$1442,$0000,$0000


;;; $A5BE: Instruction list - gunship entrance pad - opening ;;;
InstList_ShipEntrancePad_Opening_0:
    dw $0028,Spritemap_Ship_C
    dw $0008,Spritemap_Ship_B
    dw $0008,Spritemap_Ship_2
    dw $0008,Spritemap_Ship_3
    dw $0018,Spritemap_Ship_4
    dw $0008,Spritemap_Ship_5
    dw $0007,Spritemap_Ship_6
    dw $0006,Spritemap_Ship_7
    dw $0005,Spritemap_Ship_8
    dw $0004,Spritemap_Ship_9

InstList_ShipEntrancePad_Opening_1:
    dw $0004,Spritemap_Ship_A
    dw Instruction_Common_GotoY
    dw InstList_ShipEntrancePad_Opening_1


;;; $A5EE: Instruction list - gunship entrance pad - closing ;;;
InstList_ShipEntrancePad_Closing:
    dw $0004,Spritemap_Ship_9
    dw $0005,Spritemap_Ship_8
    dw $0006,Spritemap_Ship_7
    dw $0007,Spritemap_Ship_6
    dw $0008,Spritemap_Ship_5
    dw $0018,Spritemap_Ship_4
    dw $0008,Spritemap_Ship_3
    dw $0008,Spritemap_Ship_B


;;; $A60E: Instruction list - gunship entrance pad - closed ;;;
InstList_ShipEntrancePad_Closed:
    dw $0008,Spritemap_Ship_C
    dw Instruction_Common_GotoY
    dw InstList_ShipEntrancePad_Closed


;;; $A616: Instruction list - gunship top ;;;
InstList_ShipTop:
    dw $0001,Spritemap_Ship_0
    dw Instruction_Common_Sleep


;;; $A61C: Instruction list - gunship bottom ;;;
InstList_ShipBottom:
    dw $0001,Spritemap_Ship_1
    dw Instruction_Common_Sleep


;;; $A622: Gunship brakes movement data ;;;
ShipBrakesMovementData:
; Y velocities, indexed by enemy ShipTop.brakesTimer in Function_Ship_LandingOnZebes_ApplyBrakes
    dw $0001,$0001,$0001,$0001,$0001,$0001
    dw $0000,$0000,$0000,$0000,$0000
    dw $FFFF,$FFFF,$FFFF,$FFFF,$FFFF,$FFFF


;;; $A644: Initialisation AI - enemy $D07F (gunship top) ;;;
InitAI_ShipTop:
    LDX.W EnemyIndex
    LDA.W Enemy.properties,X : ORA.W #$2400 : STA.W Enemy.properties,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    LDA.W #InstList_ShipTop : STA.W Enemy.instList,X
    LDA.W #$0E00 : STA.W Enemy.palette,X
    LDA.W GameState : CMP.W #$0028 : BEQ .demoTransition

  .landingOnZebes:
    LDA.L SRAMMirror_LoadingGameState : CMP.W #$0022 : BNE .notLandingOnZebes
    LDA.W SamusYPosition : SEC : SBC.W #$0011 : STA.W Enemy.YPosition,X
    LDA.W #Function_Ship_LandingOnZebes_Descending : STA.W ShipTop.function,X
    BRA .merge

  .notLandingOnZebes:
    LDA.W Enemy.YPosition,X : SEC : SBC.W #$0019 : STA.W Enemy.YPosition,X : STA.W ShipTop.brakesTimer,X
    LDA.W #Function_Ship_Idle_HandleLettingSamusEnter : STA.W ShipTop.function,X
    BRA .merge

  .demoTransition:
    LDA.W DemoSet : BNE .landingOnZebes
    LDA.W #$0472 : STA.W SamusYPosition
    LDA.W Enemy.YPosition,X : SEC : SBC.W #$0019 : STA.W Enemy.YPosition,X : STA.W ShipTop.brakesTimer,X
    LDA.W #Function_Ship_SamusExiting_WaitForEntrancePadToOpen : STA.W ShipTop.function,X
    LDA.W #$0090 : STA.W ShipTop.functionTimer

  .merge:
    LDY.W #PaletteFXObjects_GunshipGlow
    JSL Spawn_PaletteFXObject
    LDA.W #$0001 : STA.W ShipTop.hoverTimer,X
    STZ.W ShipTop.hoverIndex
    RTL


;;; $A6D2: Initialisation AI - enemy $D0BF (gunship bottom / entrance pad) ;;;
InitAI_ShipBottomEntrance:
; Enemy parameter 2 = 0: gunship bottom
; Enemy parameter 2 != 0: gunship entrance pad
    LDX.W EnemyIndex
    LDA.W Enemy.properties,X : ORA.W #$2400 : STA.W Enemy.properties,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    LDA.W Enemy.init1,X : BEQ .shipBottom
    LDA.W #InstList_ShipEntrancePad_Closed : STA.W Enemy.instList,X
    BRA +

  .shipBottom:
    LDA.W #InstList_ShipBottom : STA.W Enemy.instList,X

+   LDA.W Enemy[-1].GFXOffset,X : STA.W Enemy.GFXOffset,X
    LDA.W #$0E00 : STA.W Enemy.palette,X
    LDA.W Enemy.init1,X : BNE .entrancePad
    LDA.L SRAMMirror_LoadingGameState : CMP.W #$0022 : BNE .notLandingOnZebes
    LDA.W SamusYPosition : CLC : ADC.W #$0017 : STA.W Enemy.YPosition,X
    BRA .merge

  .notLandingOnZebes:
    LDA.W Enemy.YPosition,X : CLC : ADC.W #$000F : STA.W Enemy.YPosition,X
    LDA.W #$0047 : STA.W ShipBottomEntrance.hoverSFXTimer,X
    BRA .merge

  .entrancePad:
    LDA.W Enemy[-2].YPosition,X : DEC : STA.W Enemy.YPosition,X
    LDA.W GameState : CMP.W #$0028 : BNE .merge
    LDA.W DemoSet : BNE .merge
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDA.W #InstList_ShipEntrancePad_Opening_0 : STA.W Enemy.instList,X

  .merge:
    LDA.W #RTL_A2A7D7 : STA.W ShipBottomEntrance.YVelocity,X
    RTL


;;; $A759: Main AI - enemy $D07F (gunship top) ;;;
MainAI_ShipTop:
    LDX.W EnemyIndex
    DEC.W Enemy[1].var3,X : BEQ .SFX
    BPL .noSFX

  .SFX:
    LDA.W #$004D
    JSL QueueSound_Lib2_Max6
    LDA.W #$0046 : STA.W Enemy[1].var3,X

  .noSFX:
    LDA.W ShipTop.function,X : CMP.W #Function_Ship_LandingOnZebes_WaitForShipEntranceToOpen : BMI .function
    CMP.W #Function_Ship_Liftoff_FireUpEngines_SpawnDustClouds : BPL .function
    JSR ProcessShipHover

  .function:
    JMP.W (ShipTop.function,X)


;;; $A783: RTL ;;;
RTL_A2A783:
    RTL


;;; $A784: Process gunship hover ;;;
ProcessShipHover:
    DEC.W ShipTop.hoverTimer,X : BEQ .timerExpired
    BPL .return

  .timerExpired:
    LDA.W ShipTop.hoverIndex,X : ASL : TAY
    LDA.W .timer,Y : AND.W #$00FF : STA.W ShipTop.hoverTimer,X
    LDA.W .YVelocity,Y : AND.W #$00FF : BIT.W #$0080 : BEQ +
    ORA.W #$FF00

+   STA.B DP_Temp12
    LDA.W Enemy.YPosition,X : CLC : ADC.B DP_Temp12 : STA.W Enemy.YPosition,X
    LDA.W Enemy[1].YPosition,X : CLC : ADC.B DP_Temp12 : STA.W Enemy[1].YPosition,X
    LDA.W Enemy[2].YPosition,X : CLC : ADC.B DP_Temp12 : STA.W Enemy[2].YPosition,X
    LDA.W ShipTop.hoverIndex,X : INC : AND.W #$0003 : STA.W ShipTop.hoverIndex,X

  .return:
    RTS

;        ______ Timer
;       |    __ Y velocity
;       |   |
  .timer:
    db $10
  .YVelocity:
    db     $01
    db $10,$FF
    db $10,$FF
    db $10,$01


;;; $A7D7: RTL ;;;
RTL_A2A7D7:
    RTL


if !FEATURE_KEEP_UNREFERENCED
;;; $A7D8: Unused. Gunship function - rise to Y position 80h and then descend ;;;
UNUSED_Function_Ship_RiseToYPosition80_Descend:
; Probably a little debug function for testing the landing sequence
    LDA.W SamusYPosition : SEC : SBC.W #$0008 : STA.W SamusYPosition
    LDA.W Enemy[2].YPosition,X : SEC : SBC.W #$0008 : STA.W Enemy[2].YPosition,X
    LDA.W Enemy[1].YPosition,X : SEC : SBC.W #$0008 : STA.W Enemy[1].YPosition,X
    LDA.W Enemy.YPosition,X : SEC : SBC.W #$0008 : STA.W Enemy.YPosition,X
    CMP.W #$0080 : BPL .return
    LDA.W #Function_Ship_LandingOnZebes_Descending : STA.W ShipTop.function,X

  .return:
    RTL
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $A80C: Gunship function - landing on Zebes - descending ;;;
Function_Ship_LandingOnZebes_Descending:
    LDA.W Enemy.YPosition,X : CMP.W #$0300 : BPL .slowDown
    LDA.W SamusYSubPosition : CLC : ADC.W #$8000 : STA.W SamusYSubPosition
    LDA.W SamusYPosition : ADC.W #$0004 : STA.W SamusYPosition
    LDA.W Enemy[2].YSubPosition,X : CLC : ADC.W #$8000 : STA.W Enemy[2].YSubPosition,X
    LDA.W Enemy[2].YPosition,X : ADC.W #$0004 : STA.W Enemy[2].YPosition,X
    LDA.W Enemy[1].YSubPosition,X : CLC : ADC.W #$8000 : STA.W Enemy[1].YSubPosition,X
    LDA.W Enemy[1].YPosition,X : ADC.W #$0004 : STA.W Enemy[1].YPosition,X
    LDA.W Enemy.YSubPosition,X : CLC : ADC.W #$8000 : STA.W Enemy.YSubPosition,X
    LDA.W Enemy.YPosition,X : ADC.W #$0004 : STA.W Enemy.YPosition,X
    RTL

  .slowDown:
    LDA.W SamusYSubPosition : CLC : ADC.W #$8000 : STA.W SamusYSubPosition
    LDA.W SamusYPosition : ADC.W #$0002 : STA.W SamusYPosition
    LDA.W Enemy[2].YSubPosition,X : CLC : ADC.W #$8000 : STA.W Enemy[2].YSubPosition,X
    LDA.W Enemy[2].YPosition,X : ADC.W #$0002 : STA.W Enemy[2].YPosition,X
    LDA.W Enemy[1].YSubPosition,X : CLC : ADC.W #$8000 : STA.W Enemy[1].YSubPosition,X
    LDA.W Enemy[1].YPosition,X : ADC.W #$0002 : STA.W Enemy[1].YPosition,X
    LDA.W Enemy.YSubPosition,X : CLC : ADC.W #$8000 : STA.W Enemy.YSubPosition,X
    LDA.W Enemy.YPosition,X : ADC.W #$0002 : STA.W Enemy.YPosition,X
    CMP.W #$045F : BMI .return
    LDA.W #$045F : STA.W Enemy.YPosition,X
    CLC : ADC.W #$0028 : STA.W Enemy[1].YPosition,X
    LDA.W Enemy.YPosition,X : DEC : STA.W Enemy[2].YPosition,X
    LDA.W #Function_Ship_LandingOnZebes_ApplyBrakes : STA.W ShipTop.function,X
    STZ.W ShipTop.brakesTimer,X

  .return:
    RTL


;;; $A8D0: Gunship function - landing on Zebes - apply brakes ;;;
Function_Ship_LandingOnZebes_ApplyBrakes:
; The increment at $A921 is kinda random,
; causes a slight visual discrepancy when entering the ship immediately after landing
    LDA.W ShipTop.brakesTimer,X : ASL : TAY
    LDA.W SamusYPosition : CLC : ADC.W ShipBrakesMovementData,Y : STA.W SamusYPosition
    LDA.W Enemy[2].YPosition,X : CLC : ADC.W ShipBrakesMovementData,Y : STA.W Enemy[2].YPosition,X
    LDA.W Enemy[1].YPosition,X : CLC : ADC.W ShipBrakesMovementData,Y : STA.W Enemy[1].YPosition,X
    LDA.W Enemy.YPosition,X : CLC : ADC.W ShipBrakesMovementData,Y : STA.W Enemy.YPosition,X
    LDA.W ShipTop.brakesTimer,X : INC : STA.W ShipTop.brakesTimer,X
    CMP.W #$0011 : BMI .return
    LDA.W #Function_Ship_LandingOnZebes_WaitForShipEntranceToOpen : STA.W ShipTop.function,X
    LDA.W Enemy.YPosition,X : STA.W ShipTop.brakesTimer,X
    LDA.W #$0001 : STA.W ShipTop.hoverTimer,X
    STZ.W ShipTop.hoverIndex
    LDA.W Enemy.XPosition,X : INC : STA.W SamusXPosition : STA.W SamusPreviousXPosition
    LDA.W #$0001 : STA.W Enemy[2].instTimer,X
    LDA.W #InstList_ShipEntrancePad_Opening_0 : STA.W Enemy[2].instList,X
    LDA.W #$0090 : STA.W ShipTop.functionTimer
    LDA.W #$0014
    JSL QueueSound_Lib3_Max6

  .return:
    RTL


;;; $A942: Gunship function - landing on Zebes - wait for gunship entrance to open ;;;
Function_Ship_LandingOnZebes_WaitForShipEntranceToOpen:
    DEC.W ShipTop.functionTimer : BEQ .timerExpired
    BPL .return

  .timerExpired:
    LDA.W #Function_Ship_LandingOnZebes_EjectSamus : STA.W ShipTop.function,X

  .return:
    RTL


;;; $A950: Gunship function - landing on Zebes - eject Samus ;;;
Function_Ship_LandingOnZebes_EjectSamus:
    LDA.W ShipTop.fixedYPosition,X : SEC : SBC.W #$001E : STA.B DP_Temp12
    LDA.W SamusYPosition : SEC : SBC.W #$0001 : STA.W SamusYPosition
    CMP.B DP_Temp12 : BPL .return
    LDA.W #Function_Ship_LandOnZebes_WaitForShipEntranceToClose_UnlockSamus : STA.W ShipTop.function,X
    LDA.W #$0001 : STA.W Enemy[2].instTimer,X
    LDA.W #InstList_ShipEntrancePad_Closing : STA.W Enemy[2].instList,X
    LDA.W #$0090 : STA.W ShipTop.functionTimer
    LDA.W #$0015
    JSL QueueSound_Lib3_Max6

  .return:
    RTL


;;; $A987: Gunship function - landing on Zebes - wait for gunship entrance to close, then unlock Samus and save ;;;
Function_Ship_LandOnZebes_WaitForShipEntranceToClose_UnlockSamus:
    DEC.W ShipTop.functionTimer : BEQ .timerExpired
    BPL .return

  .timerExpired:
    LDA.W #Function_Ship_Idle_HandleLettingSamusEnter : STA.W ShipTop.function,X
    LDA.W #SamusCurrentStateHandler_Normal : STA.W CurrentStateHandler
    LDA.W #SamusNewStateHandler_Normal : STA.W NewStateHandler
    LDA.W #$0005 : STA.L SRAMMirror_LoadingGameState
    LDA.L SRAMMirror_UsedSaveStationsElevators : ORA.W #$0001 : STA.L SRAMMirror_UsedSaveStationsElevators
    STZ.W LoadStationIndex
    LDA.W SaveSlotSelected
    JSL SaveToSRAM

  .return:
    RTL


;;; $A9BD: Gunship function - idle - handle letting Samus enter ;;;
Function_Ship_Idle_HandleLettingSamusEnter:
    LDA.W GameState : CMP.W #$0008 : BNE .return
    LDA.W CurrentStateHandler : CMP.W #SamusCurrentStateHandler_Normal : BNE .return
    LDA.W Enemy.XPosition,X : SEC : SBC.W #$0008 : CMP.W SamusXPosition : BPL .return
    LDA.W Enemy.XPosition,X : CLC : ADC.W #$0008 : CMP.W SamusXPosition : BMI .return
    LDA.W Enemy.YPosition,X : SEC : SBC.W #$0040 : CMP.W SamusYPosition : BPL .return
    LDA.W Enemy.YPosition,X : CMP.W SamusYPosition : BMI .return
    LDA.W MovementType : AND.W #$00FF : BNE .return
    LDA.B DP_Controller1New : BIT.W #$0400 : BNE .enterShip

  .return:
    RTL

  .enterShip:
    LDA.W #Function_Ship_SamusEntering_WaitForEntrancePadToOpen : STA.W ShipTop.function,X
    LDA.W SamusXPosition : CMP.W #$0480 : BEQ .skipMovingSamus
    LDA.W Enemy.XPosition,X : STA.W SamusXPosition : STA.W SamusPreviousXPosition

  .skipMovingSamus:
    JSL MakeSamusFaceForward
    LDA.W #$001A
    JSL Run_Samus_Command
    STZ.W ElevatorStatus
    LDA.W Enemy.YPosition,X : DEC : STA.W Enemy[2].YPosition,X
    LDA.W #$0001 : STA.W Enemy[2].instTimer,X
    LDA.W #InstList_ShipEntrancePad_Opening_0 : STA.W Enemy[2].instList,X
    LDA.W #$0090 : STA.W ShipTop.functionTimer
    LDA.W #$0014
    JSL QueueSound_Lib3_Max6
    RTL


;;; $AA4F: Gunship function - Samus entering - wait for entrance pad to open ;;;
Function_Ship_SamusEntering_WaitForEntrancePadToOpen:
    DEC.W ShipTop.functionTimer : BEQ .timerExpired
    BPL .return

  .timerExpired:
    LDA.W #Function_Ship_SamusEntering_LowerSamus : STA.W ShipTop.function,X

  .return:
    RTL


;;; $AA5D: Gunship function - Samus entering - lower Samus ;;;
Function_Ship_SamusEntering_LowerSamus:
    LDA.W ShipTop.fixedYPosition,X : CLC
    ADC.W #$0012 : STA.B DP_Temp12
    LDA.W SamusYPosition : CLC : ADC.W #$0002 : STA.W SamusYPosition
    CMP.B DP_Temp12 : BMI .return
    LDA.W #Function_Ship_SamusEntering_WaitForEntrancePadToClose : STA.W ShipTop.function,X
    LDA.W #$0001 : STA.W Enemy[2].instTimer,X
    LDA.W #InstList_ShipEntrancePad_Closing : STA.W Enemy[2].instList,X
    LDA.W #$0090 : STA.W ShipTop.functionTimer
    LDA.W #$0015
    JSL QueueSound_Lib3_Max6

  .return:
    RTL


;;; $AA94: Gunship function - Samus entering - wait for entrance pad to close ;;;
Function_Ship_SamusEntering_WaitForEntrancePadToClose:
    DEC.W ShipTop.functionTimer : BEQ .timerExpired
    BPL .return

  .timerExpired:
    LDA.W #Function_Ship_SamusEntered_LiftoffOrRestoreSamusEnergyAmmo : STA.W ShipTop.function,X

  .return:
    RTL


;;; $AAA2: Gunship function - Samus entered - go to liftoff or restore Samus health / ammo ;;;
Function_Ship_SamusEntered_LiftoffOrRestoreSamusEnergyAmmo:
; The unconditional branch at $AAEF was most likely added to disable the liftoff debug feature
; (although debug mode has to be enabled to allow controller 2 input)
    LDA.W #$000E
    JSL CheckIfEvent_inA_HasHappened
    BCS .liftoff
    LDA.W #$0002
    JSL Restore_A_Energy_ToSamus
    LDA.W #$0002
    JSL Restore_A_Missiles_ToSamus
    LDA.W #$0002
    JSL Restore_A_SuperMissiles_ToSamus
    LDA.W #$0002
    JSL Restore_A_PowerBombs_ToSamus
    LDA.W ReserveEnergy : CMP.W MaxReserveEnergy : BMI .return
    LDA.W Energy : CMP.W MaxEnergy : BMI .return
    LDA.W Missiles : CMP.W MaxMissiles : BMI .return
    LDA.W SuperMissiles : CMP.W MaxSuperMissiles : BMI .return
    LDA.W PowerBombs : CMP.W MaxPowerBombs : BMI .return
    BRA .continue

    LDA.B DP_Controller2Input : BIT.W #$8000 : BEQ .continue

  .liftoff:
    LDA.W #Function_Ship_Liftoff_LoadDustCloudTiles : STA.W ShipTop.function,X
    STZ.W Enemy[1].var5,X : STZ.W Enemy[1].var4,X
    STZ.W EndingClearTime_HoursTens : STZ.W EndingClearTime_HoursUnits
    STZ.W EndingClearTime_MinutesTens : STZ.W EndingClearTime_MinutesUnits
    LDA.W #$000A
    JSL Run_Samus_Command
    RTL

  .continue:
    LDA.W #Function_Ship_SamusEntered_HandleSaveConfirmation : STA.W ShipTop.function,X

  .return:
    RTL


;;; $AB1F: Gunship function - Samus entered - handle save confirmation ;;;
Function_Ship_SamusEntered_HandleSaveConfirmation:
    LDA.W #$001C
    JSL MessageBox_Routine
    CMP.W #$0002 : BEQ .selectedNo
    LDA.L SRAMMirror_UsedSaveStationsElevators : ORA.W #$0001 : STA.L SRAMMirror_UsedSaveStationsElevators
    STZ.W LoadStationIndex
    LDA.W SaveSlotSelected
    JSL SaveToSRAM

  .selectedNo:
    LDA.W #Function_Ship_SamusExiting_WaitForEntrancePadToOpen : STA.W ShipTop.function,X
    LDA.W #$0001 : STA.W Enemy[2].instTimer,X
    LDA.W #InstList_ShipEntrancePad_Opening_0 : STA.W Enemy[2].instList,X
    LDA.W #$0090 : STA.W ShipTop.functionTimer
    LDA.W #$0014
    JSL QueueSound_Lib3_Max6
    RTL


;;; $AB60: Gunship function - Samus exiting - wait for entrance pad to open ;;;
Function_Ship_SamusExiting_WaitForEntrancePadToOpen:
; Set by initialisation AI if demo set 0 is playing
    DEC.W ShipTop.functionTimer : BEQ .timerExpired
    BPL .return

  .timerExpired:
    LDA.W #Function_Ship_SamusExiting_RaiseSamus : STA.W ShipTop.function,X

  .return:
    RTL


;;; $AB6E: Gunship function - Samus exiting - raise Samus ;;;
Function_Ship_SamusExiting_RaiseSamus:
    LDA.W ShipTop.fixedYPosition,X : SEC : SBC.W #$001E : STA.B DP_Temp12
    LDA.W SamusYPosition : SEC : SBC.W #$0002 : STA.W SamusYPosition
    CMP.B DP_Temp12 : BPL .return
    LDA.W #Function_Ship_SamusExiting_WaitForEntrancePadToClose : STA.W ShipTop.function,X
    LDA.W #$0001 : STA.W Enemy[2].instTimer,X
    LDA.W #InstList_ShipEntrancePad_Closing : STA.W Enemy[2].instList,X
    LDA.W #$0090 : STA.W ShipTop.functionTimer
    LDA.W #$0015
    JSL QueueSound_Lib3_Max6

  .return:
    RTL


;;; $ABA5: Gunship function - Samus exiting - wait for entrance pad to close, then unlock Samus ;;;
Function_Ship_SamusExiting_WaitForEntrancePadToClose:
    DEC.W ShipTop.functionTimer : BEQ .timerExpired
    BPL .return

  .timerExpired:
    LDA.W #Function_Ship_Idle_HandleLettingSamusEnter : STA.W ShipTop.function,X
    LDA.W GameState : CMP.W #$0028 : BPL .return
    LDA.W #SamusCurrentStateHandler_Normal : STA.W CurrentStateHandler
    LDA.W #SamusNewStateHandler_Normal : STA.W NewStateHandler

  .return:
    RTL


;;; $ABC7: Gunship function - liftoff - load dust cloud tiles ;;;
Function_Ship_Liftoff_LoadDustCloudTiles:
    LDY.W EndingClearTime_HoursTens
    PHX
    LDX.W VRAMWriteStack
    LDA.W #$0400 : STA.B VRAMWrite.size,X
    INX #2
    LDA.W .src,Y : STA.B VRAMWrite.size,X
    INX #2
    SEP #$20
    LDA.B #Tiles_GunshipLiftoffDustClouds>>16 : STA.B VRAMWrite.size,X
    REP #$20
    INX
    LDA.W .dest,Y : STA.B VRAMWrite.size,X
    INX #2 : STX.W VRAMWriteStack
    PLX
    LDA.W EndingClearTime_HoursTens : INC #2 : STA.W EndingClearTime_HoursTens
    CMP.W #$000A : BMI .return
    LDA.W #Function_Ship_Liftoff_FireUpEngines_SpawnDustClouds : STA.W ShipTop.function,X
    STZ.W EndingClearTime_HoursTens

  .return:
    RTL

  .src:
; Source addresses (bank $94)
    dw Tiles_GunshipLiftoffDustClouds
    dw Tiles_GunshipLiftoffDustClouds+$400
    dw Tiles_GunshipLiftoffDustClouds+$800
    dw Tiles_GunshipLiftoffDustClouds+$C00
    dw Tiles_GunshipLiftoffDustClouds+$1000

  .dest:
; Destination VRAM addresses
    dw $7600,$7800,$7A00,$7C00,$7E00


;;; $AC1B: Gunship function - liftoff - fire up engines and spawn dust clouds ;;;
Function_Ship_Liftoff_FireUpEngines_SpawnDustClouds:
    LDA.W Enemy[1].var4,X : CMP.W #$0040 : BPL .rumbleIntensifies
    BIT.W #$0001 : BEQ +
    LDA.W SamusYPosition : CLC : ADC.W #$0001 : STA.W SamusYPosition : STA.W SamusPreviousYPosition
    BRA .merge

+   LDA.W SamusYPosition : SEC : SBC.W #$0001 : STA.W SamusYPosition : STA.W SamusPreviousYPosition
    BRA .merge

  .rumbleIntensifies:
    BIT.W #$0001 : BEQ +
    LDA.W SamusYPosition : CLC : ADC.W #$0002 : STA.W SamusYPosition : STA.W SamusPreviousYPosition
    BRA .merge

+   LDA.W SamusYPosition : SEC : SBC.W #$0002 : STA.W SamusYPosition : STA.W SamusPreviousYPosition

  .merge:
    LDA.W SamusYPosition : SEC : SBC.W #$0011 : STA.W Enemy.YPosition,X
    DEC : STA.W Enemy[2].YPosition,X
    LDA.W SamusYPosition : CLC : ADC.W #$0017 : STA.W Enemy[1].YPosition,X
    LDA.W Enemy[1].var4,X : INC : STA.W Enemy[1].var4,X
    CMP.W #$0080 : BMI .spawnDustClouds
    LDA.W #Function_Ship_Liftoff_SteadyRise : STA.W ShipTop.function,X
    STZ.W ShipTop.functionTimer
    RTL

  .spawnDustClouds:
    CMP.W #$0040 : BNE .return
    LDA.W #$0000
    LDY.W #EnemyProjectile_GunShipLiftoffDustClouds
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    LDA.W #$0002
    LDY.W #EnemyProjectile_GunShipLiftoffDustClouds
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    LDA.W #$0004
    LDY.W #EnemyProjectile_GunShipLiftoffDustClouds
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    LDA.W #$0006
    LDY.W #EnemyProjectile_GunShipLiftoffDustClouds
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    LDA.W #$0008
    LDY.W #EnemyProjectile_GunShipLiftoffDustClouds
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    LDA.W #$000A
    LDY.W #EnemyProjectile_GunShipLiftoffDustClouds
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics

  .return:
    RTL


;;; $ACD7: Gunship function - liftoff - steady rise ;;;
Function_Ship_Liftoff_SteadyRise:
    LDA.W SamusYPosition : SEC : SBC.W #$0002 : STA.W SamusYPosition
    LDA.W SamusYPosition : SEC : SBC.W #$0011 : STA.W Enemy.YPosition,X
    DEC : STA.W Enemy[2].YPosition,X
    LDA.W SamusYPosition : CLC : ADC.W #$0017 : STA.W Enemy[1].YPosition,X
    LDA.W Enemy.YPosition,X : CMP.W #$0380 : BPL .return
    LDA.W #Function_Ship_Liftoff_Accelerating_SetGameState : STA.W ShipTop.function,X
    LDA.W #$0200 : STA.W Enemy[1].var5,X

  .return:
    RTL


;;; $AD0E: Gunship function - liftoff - accelerating / set game state ;;;
Function_Ship_Liftoff_Accelerating_SetGameState:
    JSL Function_Ship_Liftoff_Accelerating
    LDA.W Enemy.YPosition,X : CMP.W #$0100 : BPL .return
    LDA.W #Function_Ship_Liftoff_Accelerating : STA.W ShipTop.function,X
    LDA.W #$0026 : STA.W GameState
    STZ.W ScreenFadeDelay : STZ.W ScreenFadeCounter

  .return:
    RTL


;;; $AD2D: Gunship function - liftoff - accelerating ;;;
Function_Ship_Liftoff_Accelerating:
    LDA.W Enemy[1].var5,X : CLC : ADC.W #$0040 : STA.W Enemy[1].var5,X
    AND.W #$FF00 : CMP.W #$0A00 : BMI +
    LDA.W #$0900 : STA.W Enemy[1].var5,X

+   LDA.W Enemy[1].var5,X : XBA : PHA
    AND.W #$FF00 : STA.B DP_Temp14
    PLA : AND.W #$00FF : STA.B DP_Temp12
    LDA.W SamusYSubPosition : SEC : SBC.B DP_Temp14 : STA.W SamusYSubPosition
    LDA.W SamusYPosition : SBC.B DP_Temp12 : STA.W SamusYPosition
    LDA.W SamusYPosition : SEC : SBC.W #$0011 : STA.W Enemy.YPosition,X
    DEC : STA.W Enemy[2].YPosition,X
    LDA.W SamusYPosition : CLC : ADC.W #$0017 : STA.W Enemy[1].YPosition,X
    RTL


;;; $AD7F: RTL ;;;
RTL_A2AD7F:
    RTL


;;; $AD80: RTL ;;;
RTL_A2AD80:
    RTL


;;; $AD81: Spritemaps - gunship ;;;
Spritemap_Ship_0:
    dw $0012
    %spritemapEntry(1, $4201, $FE, 0, 1, 3, 7, $120)
    %spritemapEntry(1, $4211, $FE, 0, 1, 3, 7, $10E)
    %spritemapEntry(1, $4221, $FE, 0, 1, 3, 7, $10C)
    %spritemapEntry(1, $4231, $FE, 0, 1, 3, 7, $10A)
    %spritemapEntry(1, $4241, $FE, 0, 1, 3, 7, $108)
    %spritemapEntry(1, $4201, $EE, 0, 1, 3, 7, $106)
    %spritemapEntry(1, $4211, $EE, 0, 1, 3, 7, $104)
    %spritemapEntry(1, $4221, $EE, 0, 1, 3, 7, $102)
    %spritemapEntry(1, $4231, $EE, 0, 1, 3, 7, $100)
    %spritemapEntry(1, $43F1, $FE, 0, 0, 3, 7, $120)
    %spritemapEntry(1, $43E1, $FE, 0, 0, 3, 7, $10E)
    %spritemapEntry(1, $43D1, $FE, 0, 0, 3, 7, $10C)
    %spritemapEntry(1, $43C1, $FE, 0, 0, 3, 7, $10A)
    %spritemapEntry(1, $43B1, $FE, 0, 0, 3, 7, $108)
    %spritemapEntry(1, $43F1, $EE, 0, 0, 3, 7, $106)
    %spritemapEntry(1, $43E1, $EE, 0, 0, 3, 7, $104)
    %spritemapEntry(1, $43D1, $EE, 0, 0, 3, 7, $102)
    %spritemapEntry(1, $43C1, $EE, 0, 0, 3, 7, $100)

Spritemap_Ship_1:
    dw $0022
    %spritemapEntry(1, $4201, $06, 0, 1, 3, 7, $162)
    %spritemapEntry(1, $4211, $06, 0, 1, 3, 7, $160)
    %spritemapEntry(1, $4221, $06, 0, 1, 3, 7, $14E)
    %spritemapEntry(1, $4231, $06, 0, 1, 3, 7, $14C)
    %spritemapEntry(1, $4241, $06, 0, 1, 3, 7, $14A)
    %spritemapEntry(1, $4201, $F6, 0, 1, 3, 7, $148)
    %spritemapEntry(1, $4211, $F6, 0, 1, 3, 7, $146)
    %spritemapEntry(1, $4221, $F6, 0, 1, 3, 7, $144)
    %spritemapEntry(1, $4231, $F6, 0, 1, 3, 7, $142)
    %spritemapEntry(1, $4241, $F6, 0, 1, 3, 7, $140)
    %spritemapEntry(1, $4251, $F6, 0, 1, 3, 7, $12E)
    %spritemapEntry(1, $4201, $E6, 0, 1, 3, 7, $12C)
    %spritemapEntry(1, $4211, $E6, 0, 1, 3, 7, $12A)
    %spritemapEntry(1, $4221, $E6, 0, 1, 3, 7, $128)
    %spritemapEntry(1, $4231, $E6, 0, 1, 3, 7, $126)
    %spritemapEntry(1, $4241, $E6, 0, 1, 3, 7, $124)
    %spritemapEntry(1, $4251, $E6, 0, 1, 3, 7, $122)
    %spritemapEntry(1, $43F1, $06, 0, 0, 3, 7, $162)
    %spritemapEntry(1, $43E1, $06, 0, 0, 3, 7, $160)
    %spritemapEntry(1, $43D1, $06, 0, 0, 3, 7, $14E)
    %spritemapEntry(1, $43C1, $06, 0, 0, 3, 7, $14C)
    %spritemapEntry(1, $43B1, $06, 0, 0, 3, 7, $14A)
    %spritemapEntry(1, $43F1, $F6, 0, 0, 3, 7, $148)
    %spritemapEntry(1, $43E1, $F6, 0, 0, 3, 7, $146)
    %spritemapEntry(1, $43D1, $F6, 0, 0, 3, 7, $144)
    %spritemapEntry(1, $43C1, $F6, 0, 0, 3, 7, $142)
    %spritemapEntry(1, $43B1, $F6, 0, 0, 3, 7, $140)
    %spritemapEntry(1, $43A1, $F6, 0, 0, 3, 7, $12E)
    %spritemapEntry(1, $43F1, $E6, 0, 0, 3, 7, $12C)
    %spritemapEntry(1, $43E1, $E6, 0, 0, 3, 7, $12A)
    %spritemapEntry(1, $43D1, $E6, 0, 0, 3, 7, $128)
    %spritemapEntry(1, $43C1, $E6, 0, 0, 3, 7, $126)
    %spritemapEntry(1, $43B1, $E6, 0, 0, 3, 7, $124)
    %spritemapEntry(1, $43A1, $E6, 0, 0, 3, 7, $122)

Spritemap_Ship_2:
    dw $0004
    %spritemapEntry(0, $00, $F6, 0, 1, 3, 7, $165)
    %spritemapEntry(0, $08, $F6, 0, 1, 3, 7, $164)
    %spritemapEntry(0, $1F8, $F6, 0, 0, 3, 7, $165)
    %spritemapEntry(0, $1F0, $F6, 0, 0, 3, 7, $164)

Spritemap_Ship_3:
    dw $0004
    %spritemapEntry(0, $00, $F4, 0, 1, 3, 7, $165)
    %spritemapEntry(0, $08, $F4, 0, 1, 3, 7, $164)
    %spritemapEntry(0, $1F8, $F4, 0, 0, 3, 7, $165)
    %spritemapEntry(0, $1F0, $F4, 0, 0, 3, 7, $164)

Spritemap_Ship_4:
    dw $0004
    %spritemapEntry(0, $00, $F2, 0, 1, 3, 7, $165)
    %spritemapEntry(0, $08, $F3, 0, 1, 3, 7, $164)
    %spritemapEntry(0, $1F8, $F2, 0, 0, 3, 7, $165)
    %spritemapEntry(0, $1F0, $F3, 0, 0, 3, 7, $164)

Spritemap_Ship_5:
    dw $0008
    %spritemapEntry(0, $1F6, $F2, 0, 0, 3, 7, $165)
    %spritemapEntry(0, $1EE, $F3, 0, 0, 3, 7, $164)
    %spritemapEntry(0, $02, $F2, 0, 1, 3, 7, $165)
    %spritemapEntry(0, $0A, $F3, 0, 1, 3, 7, $164)
    %spritemapEntry(0, $00, $F5, 0, 1, 3, 7, $167)
    %spritemapEntry(0, $08, $F5, 0, 1, 3, 7, $166)
    %spritemapEntry(0, $1F8, $F5, 0, 0, 3, 7, $167)
    %spritemapEntry(0, $1F0, $F5, 0, 0, 3, 7, $166)

Spritemap_Ship_6:
    dw $0008
    %spritemapEntry(0, $04, $F2, 0, 1, 3, 7, $165)
    %spritemapEntry(0, $0C, $F4, 0, 1, 3, 7, $164)
    %spritemapEntry(0, $1F4, $F2, 0, 0, 3, 7, $165)
    %spritemapEntry(0, $1EC, $F4, 0, 0, 3, 7, $164)
    %spritemapEntry(0, $00, $F4, 0, 1, 3, 7, $167)
    %spritemapEntry(0, $08, $F4, 0, 1, 3, 7, $166)
    %spritemapEntry(0, $1F8, $F4, 0, 0, 3, 7, $167)
    %spritemapEntry(0, $1F0, $F4, 0, 0, 3, 7, $166)

Spritemap_Ship_7:
    dw $0008
    %spritemapEntry(0, $06, $F2, 0, 1, 3, 7, $165)
    %spritemapEntry(0, $0E, $F4, 0, 1, 3, 7, $164)
    %spritemapEntry(0, $1F2, $F2, 0, 0, 3, 7, $165)
    %spritemapEntry(0, $1EA, $F4, 0, 0, 3, 7, $164)
    %spritemapEntry(0, $00, $F3, 0, 1, 3, 7, $167)
    %spritemapEntry(0, $08, $F3, 0, 1, 3, 7, $166)
    %spritemapEntry(0, $1F8, $F3, 0, 0, 3, 7, $167)
    %spritemapEntry(0, $1F0, $F3, 0, 0, 3, 7, $166)

Spritemap_Ship_8:
    dw $0008
    %spritemapEntry(0, $08, $F2, 0, 1, 3, 7, $165)
    %spritemapEntry(0, $10, $F4, 0, 1, 3, 7, $164)
    %spritemapEntry(0, $1F0, $F2, 0, 0, 3, 7, $165)
    %spritemapEntry(0, $1E8, $F4, 0, 0, 3, 7, $164)
    %spritemapEntry(0, $00, $F3, 0, 1, 3, 7, $167)
    %spritemapEntry(0, $08, $F3, 0, 1, 3, 7, $166)
    %spritemapEntry(0, $1F8, $F3, 0, 0, 3, 7, $167)
    %spritemapEntry(0, $1F0, $F3, 0, 0, 3, 7, $166)

Spritemap_Ship_9:
    dw $0008
    %spritemapEntry(0, $0A, $F3, 0, 1, 3, 7, $165)
    %spritemapEntry(0, $12, $F6, 0, 1, 3, 7, $164)
    %spritemapEntry(0, $1EE, $F3, 0, 0, 3, 7, $165)
    %spritemapEntry(0, $1E6, $F6, 0, 0, 3, 7, $164)
    %spritemapEntry(0, $00, $F3, 0, 1, 3, 7, $167)
    %spritemapEntry(0, $08, $F3, 0, 1, 3, 7, $166)
    %spritemapEntry(0, $1F8, $F3, 0, 0, 3, 7, $167)
    %spritemapEntry(0, $1F0, $F3, 0, 0, 3, 7, $166)

Spritemap_Ship_A:
    dw $0008
    %spritemapEntry(0, $0C, $F3, 0, 1, 3, 7, $165)
    %spritemapEntry(0, $14, $F6, 0, 1, 3, 7, $164)
    %spritemapEntry(0, $1EC, $F3, 0, 0, 3, 7, $165)
    %spritemapEntry(0, $1E4, $F6, 0, 0, 3, 7, $164)
    %spritemapEntry(0, $00, $F3, 0, 1, 3, 7, $167)
    %spritemapEntry(0, $08, $F3, 0, 1, 3, 7, $166)
    %spritemapEntry(0, $1F8, $F3, 0, 0, 3, 7, $167)
    %spritemapEntry(0, $1F0, $F3, 0, 0, 3, 7, $166)

Spritemap_Ship_B:
    dw $0004
    %spritemapEntry(0, $00, $F7, 0, 1, 3, 7, $165)
    %spritemapEntry(0, $08, $F7, 0, 1, 3, 7, $164)
    %spritemapEntry(0, $1F8, $F7, 0, 0, 3, 7, $165)
    %spritemapEntry(0, $1F0, $F7, 0, 0, 3, 7, $164)

Spritemap_Ship_C:
    dw $0004
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 7, $165)
    %spritemapEntry(0, $08, $F8, 0, 1, 3, 7, $164)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 7, $165)
    %spritemapEntry(0, $1F0, $F8, 0, 0, 3, 7, $164)


;;; $AFF3: Palette - enemy $D0FF (mellow) ;;;
Palette_Mellow:
    dw $3800,$72FA,$55B0,$2845,$1801,$6210,$496B,$38C6
    dw $2C63,$2FEF,$030D,$0209,$0145,$183F,$1014,$080A


;;; $B013: Instruction list ;;;
InstList_Mellow_Mella_Menu:
    dw $0002,Spritemap_Mellow_Mella_Menu_0
    dw $0002,Spritemap_Mellow_Mella_Menu_1
    dw $0002,Spritemap_Mellow_Mella_Menu_2
    dw $0002,Spritemap_Mellow_Mella_Menu_3
    dw Instruction_Common_GotoY
    dw InstList_Mellow_Mella_Menu


if !FEATURE_KEEP_UNREFERENCED
;;; $B027: Unused. Old movement data? ;;;
UNUSED_OldMovementData_A2B027:
    dw $0002,$FFFC,$FFFE,$0004,$0002,$FFFE,$0002,$0004
    dw $0002,$FFFE,$FFFE,$0002,$FFFC,$FFFE,$0002,$0002
    dw $FFFE,$FFFE,$0004,$0002,$FFFC,$FFFE,$0002,$FFFE
    dw $FFFC,$FFFE,$0002,$0002,$FFFE,$0004,$0002,$FFFE
    dw $FFFE,$0002
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $B06B: Initialisation AI - enemy $D0FF/$D13F/$D17F (flies) ;;;
InitAI_Mellow_Mella_Menu:
    LDX.W EnemyIndex
    STZ.W Flies.angle,X
    LDA.W #Function_Flies_IdleMovement_ClockwiseCircle : STA.W Flies.function,X
    LDA.W #InstList_Mellow_Mella_Menu : STA.W Enemy.instList,X
    LDA.W #Spritemap_Common_Nothing : STA.W Enemy.spritemap,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDA.W #Spritemap_Common_Nothing : STA.W Enemy.spritemap,X
    RTL


;;; $B090: Move fly according to angle ;;;
MoveFlyAccordingToAngle:
    TXY
    LDX.W Flies.angle,Y
    LDA.L SineCosineTables_8bitSine_SignExtended-1,X : AND.W #$FF00 : CLC : ADC.W Enemy.XSubPosition,Y : STA.W Enemy.XSubPosition,Y
    LDA.L SineCosineTables_8bitSine_SignExtended,X : XBA : BPL .lowByteX
    ORA.W #$FF00
    BRA +

  .lowByteX:
    AND.W #$00FF

+   ADC.W Enemy.XPosition,Y : STA.W Enemy.XPosition,Y
    LDA.L SineCosineTables_NegativeCosine_SignExtended-1,X : AND.W #$FF00
    CLC : ADC.W Enemy.YSubPosition,Y : STA.W Enemy.YSubPosition,Y
    LDA.L SineCosineTables_NegativeCosine_SignExtended,X : XBA : BPL .lowByteY
    ORA.W #$FF00
    BRA +

  .lowByteY:
    AND.W #$00FF

+   ADC.W Enemy.YPosition,Y : STA.W Enemy.YPosition,Y
    TYX
    RTS


;;; $B0DC: Move fly according to velocities ;;;
MoveFlyAccordingToVelocities:
;; Returns:
;;     A: Enemy Y position
    LDA.W Enemy.var0+1,X : AND.W #$FF00 : CLC : ADC.W Enemy.XSubPosition,X : STA.W Enemy.XSubPosition,X
    LDA.W Flies.XVelocity,X : XBA : BPL .lowByteX
    ORA.W #$FF00
    BRA +

  .lowByteX:
    AND.W #$00FF

+   ADC.W Enemy.XPosition,X : STA.W Enemy.XPosition,X
    LDA.W Enemy.var1+1,X : AND.W #$FF00 : CLC : ADC.W Enemy.YSubPosition,X : STA.W Enemy.YSubPosition,X
    LDA.W Flies.YVelocity,X : XBA : BPL .lowByteY
    ORA.W #$FF00
    BRA +

  .lowByteY:
    AND.W #$00FF

+   ADC.W Enemy.YPosition,X : STA.W Enemy.YPosition,X
    RTS


;;; $B11F: Main AI - enemy $D0FF/$D13F/$D17F (flies) ;;;
MainAI_Mellow_Mella_Menu:
    JSL GenerateRandomNumber
    LDX.W EnemyIndex
    JMP.W (Flies.function,X)


;;; $B129: Set fly to attack Samus ;;;
SetFlyToAttackSamus:
; Sets up X/Y velocity to direct fly towards midpoint between Samus and enemy
    JSL CalculateAngleOfSamusFromEnemy
    ASL
    TXY
    TAX
    LDA.L SineCosineTables_8bitSine_SignExtended,X : ASL : STA.W Flies.XVelocity,Y
    LDA.L SineCosineTables_NegativeCosine_SignExtended,X : ASL #2 : STA.W Flies.YVelocity,Y
    LDA.W SamusYPosition : STA.W Flies.targetYPosition,Y
    LDA.W #Function_Flies_AttackSamus : STA.W Flies.function,Y
    RTL


;;; $B14E: Fly function - idle movement - clockwise circle ;;;
Function_Flies_IdleMovement_ClockwiseCircle:
    LDA.W Flies.retreatTimer,X : BEQ .retreatTimerExpired
    DEC : STA.W Flies.retreatTimer,X
    BRA .move

  .retreatTimerExpired:
    LDA.W #$0070
    JSL CheckIfXDistanceBetweenEnemyAndSamusIsAtLeastA
    BCC SetFlyToAttackSamus

  .move:
    JSR MoveFlyAccordingToAngle
    LDA.W Flies.angle,X : CLC : ADC.W #$0020 : AND.W #$01FF : STA.W Flies.angle,X : BEQ .antiClockwise
    RTL

  .antiClockwise:
    LDA.W #Function_Flies_IdleMovement_AntiClockwiseCircle : STA.W Flies.function,X
    RTL


;;; $B17C: Fly function - idle movement - anti-clockwise circle ;;;
Function_Flies_IdleMovement_AntiClockwiseCircle:
    LDA.W Flies.retreatTimer,X : BEQ .retreatTimerExpired
    DEC : STA.W Flies.retreatTimer,X
    BRA .move

  .retreatTimerExpired:
    LDA.W #$0070
    JSL CheckIfXDistanceBetweenEnemyAndSamusIsAtLeastA
    BCC SetFlyToAttackSamus

  .move:
    JSR MoveFlyAccordingToAngle
    LDA.W Flies.angle,X : SEC : SBC.W #$0020 : AND.W #$01FF : STA.W Flies.angle,X : BEQ .clockwise
    RTL

  .clockwise:
    LDA.W #Function_Flies_IdleMovement_ClockwiseCircle : STA.W Flies.function,X
    RTL


;;; $B1AA: Fly function - attack Samus ;;;
Function_Flies_AttackSamus:
    JSR MoveFlyAccordingToVelocities
    INC.W Flies.retreatTimer,X
    BIT.W Flies.YVelocity,X : BPL .positiveYVelocity
    CMP.W Flies.targetYPosition,X : BCC .aboveTarget
    RTL

  .positiveYVelocity:
    CMP.W Flies.targetYPosition,X : BCS .aboveTarget
    RTL

  .aboveTarget:
    LDA.W Flies.YVelocity,X : EOR.W #$FFFF : INC : STA.W Flies.YVelocity,X
    LDA.W #Function_Flies_Retreat : STA.W Flies.function,X
    RTL


;;; $B1D2: Fly function - retreat ;;;
Function_Flies_Retreat:
    JSR MoveFlyAccordingToVelocities
    DEC.W Flies.retreatTimer,X : BMI .retreatTimerExpired
    RTL

  .retreatTimerExpired:
    LDA.W #$0018 : STA.W Flies.retreatTimer,X
    LDA.W #Function_Flies_IdleMovement_ClockwiseCircle : STA.W Flies.function,X
    RTL


;;; $B1E8: Spritemaps - flies ;;;
Spritemap_Mellow_Mella_Menu_0:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 0, $100)

Spritemap_Mellow_Mella_Menu_1:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 0, $102)

Spritemap_Mellow_Mella_Menu_2:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 0, $104)

Spritemap_Mellow_Mella_Menu_3:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 0, $106)


;;; $B204: Unused. Fly spritemap pointers ;;;
UNUSED_FlySpritemapPointers_A2B204:
; referenced by enemy header
    dw Spritemap_Mellow_Mella_Menu_0
    dw Spritemap_Mellow_Mella_Menu_1
    dw Spritemap_Mellow_Mella_Menu_2
    dw Spritemap_Mellow_Mella_Menu_3


;;; $B20C: Palette - enemy $D13F (mella) ;;;
Palette_Mella:
    dw $3800,$039F,$01BF,$000F,$0005,$021F,$015B,$00BA
    dw $0011,$4F72,$36AD,$1DC8,$0925,$7E1F,$5415,$280A


;;; $B22C: Unused ;;;
UNUSED_PointerToUnusedData_A2B22C:
    dw UNUSED_Data_A2B22E

UNUSED_Data_A2B22E:
    dw $0000,$000E,$0001,$000B,$0002,$000A,$0003,$0009
    dw $FFFE


;;; $B240: Unused. Mella spritemaps ;;;
UNUSED_Spritemap_Mella_A2B240:
    dw $0001
    %spritemapEntry(1, $43F8, $F4, 0, 0, 2, 0, $100)

UNUSED_Spritemap_Mella_A2B247:
    dw $0001
    %spritemapEntry(1, $43F8, $F4, 0, 0, 2, 0, $102)

UNUSED_Spritemap_Mella_A2B24E:
    dw $0001
    %spritemapEntry(1, $43F8, $F4, 0, 0, 2, 0, $104)

UNUSED_Spritemap_Mella_A2B255:
    dw $0001
    %spritemapEntry(1, $43F8, $F4, 0, 0, 2, 0, $106)


;;; $B25C: Unused. Mella spritemap pointers ;;;
UNUSED_SpritemapPointers_Mella_A2B25C:
    dw UNUSED_Spritemap_Mella_A2B240
    dw UNUSED_Spritemap_Mella_A2B247
    dw UNUSED_Spritemap_Mella_A2B24E
    dw UNUSED_Spritemap_Mella_A2B255


;;; $B264: Palette - enemy $D17F (memu) ;;;
Palette_Menu:
    dw $3800,$72FA,$55B0,$2845,$1801,$6210,$496B,$38C6
    dw $2C63,$2F5A,$2294,$01AD,$0108,$7FFF,$56B5,$294A


;;; $B284: Unused ;;;
UNUSED_DataPointer_A2B284:
    dw UNUSED_Data_A2B286

UNUSED_Data_A2B286:
    dw $0000,$000E,$0001,$000B,$0002,$000A,$0003,$0009
    dw $FFFE


;;; $B298: Unused. Memu spritemaps ;;;
UNUSED_Spritemap_Menu_A2B298:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 0, $100)

UNUSED_Spritemap_Menu_A2B29F:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 0, $102)

UNUSED_Spritemap_Menu_A2B2A6:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 0, $104)

UNUSED_Spritemap_Menu_A2B2AD:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 0, $106)


;;; $B2B4: Unused. Memu spritemap pointers ;;;
UNUSED_SpritemapPointers_Menu_A2B2B4:
    dw UNUSED_Spritemap_Menu_A2B298
    dw UNUSED_Spritemap_Menu_A2B29F
    dw UNUSED_Spritemap_Menu_A2B2A6
    dw UNUSED_Spritemap_Menu_A2B2AD


;;; $B2BC: Palette - enemy $D1BF (multiviola) ;;;
Palette_Multiviola:
    dw $3800,$02FF,$01BF,$000F,$0008,$01BF,$011B,$0015
    dw $0011,$241F,$1C17,$142F,$0C47,$03E0,$02A0,$0140


;;; $B2DC: Instruction list ;;;
InstList_Multiviola:
    dw $000A,Spritemap_Multiviola_0
    dw $000A,Spritemap_Multiviola_1
    dw $000A,Spritemap_Multiviola_2
    dw $000A,Spritemap_Multiviola_3
    dw $000A,Spritemap_Multiviola_4
    dw $000A,Spritemap_Multiviola_5
    dw $000A,Spritemap_Multiviola_6
    dw $000A,Spritemap_Multiviola_7
    dw $000A,Spritemap_Multiviola_6
    dw $000A,Spritemap_Multiviola_5
    dw $000A,Spritemap_Multiviola_4
    dw $000A,Spritemap_Multiviola_3
    dw $000A,Spritemap_Multiviola_2
    dw $000A,Spritemap_Multiviola_1
    dw Instruction_Common_GotoY
    dw InstList_Multiviola


if !FEATURE_KEEP_UNREFERENCED
;;; $B318: Unused. Instruction list ;;;
UNUSED_InstList_Multiviola_A2B318:
; The spritemaps here have no associated graphics
    dw $0002,UNUSED_Spritemap_Multiviola_A2B4E2
    dw $0001,Spritemap_Common_Nothing
    dw $0002,UNUSED_Spritemap_Multiviola_A2B4E2
    dw $0001,Spritemap_Common_Nothing
    dw $0002,UNUSED_Spritemap_Multiviola_A2B4E9
    dw $0001,Spritemap_Common_Nothing
    dw $0002,UNUSED_Spritemap_Multiviola_A2B4E9
    dw $0001,Spritemap_Common_Nothing
    dw $0002,UNUSED_Spritemap_Multiviola_A2B4F0
    dw $0001,Spritemap_Common_Nothing
    dw $0002,UNUSED_Spritemap_Multiviola_A2B4F0
    dw $0001,Spritemap_Common_Nothing
    dw $0002,UNUSED_Spritemap_Multiviola_A2B4F7
    dw $0001,Spritemap_Common_Nothing
    dw $0002,UNUSED_Spritemap_Multiviola_A2B4F7
    dw $0001,Spritemap_Common_Nothing
    dw $0002,UNUSED_Spritemap_Multiviola_A2B4F0
    dw $0001,Spritemap_Common_Nothing
    dw $0002,UNUSED_Spritemap_Multiviola_A2B4F0
    dw $0001,Spritemap_Common_Nothing
    dw $0002,UNUSED_Spritemap_Multiviola_A2B4E9
    dw $0001,Spritemap_Common_Nothing
    dw $0002,UNUSED_Spritemap_Multiviola_A2B4E9
    dw $0001,Spritemap_Common_Nothing
    dw Instruction_Common_GotoY
    dw UNUSED_InstList_Multiviola_A2B318


;;; $B37C: Unused. Instruction list ;;;
UNUSED_InstList_Multiviola_A2B37C:
; The spritemaps here have no associated graphics
    dw $0002,UNUSED_Spritemap_Multiviola_A2B4FE
    dw $0001,Spritemap_Common_Nothing
    dw $0002,UNUSED_Spritemap_Multiviola_A2B4FE
    dw $0001,Spritemap_Common_Nothing
    dw $0002,UNUSED_Spritemap_Multiviola_B2B505
    dw $0001,Spritemap_Common_Nothing
    dw $0002,UNUSED_Spritemap_Multiviola_B2B505
    dw $0001,Spritemap_Common_Nothing
    dw $0002,UNUSED_Spritemap_Multiviola_A2B50C
    dw $0001,Spritemap_Common_Nothing
    dw $0002,UNUSED_Spritemap_Multiviola_A2B50C
    dw $0001,Spritemap_Common_Nothing
    dw $0002,UNUSED_Spritemap_Multiviola_A2B513
    dw $0001,Spritemap_Common_Nothing
    dw $0002,UNUSED_Spritemap_Multiviola_A2B513
    dw $0001,Spritemap_Common_Nothing
    dw $0002,UNUSED_Spritemap_Multiviola_A2B50C
    dw $0001,Spritemap_Common_Nothing
    dw $0002,UNUSED_Spritemap_Multiviola_A2B50C
    dw $0001,Spritemap_Common_Nothing
    dw $0002,UNUSED_Spritemap_Multiviola_B2B505
    dw $0001,Spritemap_Common_Nothing
    dw $0002,UNUSED_Spritemap_Multiviola_B2B505
    dw $0001,Spritemap_Common_Nothing
    dw Instruction_Common_GotoY
    dw UNUSED_InstList_Multiviola_A2B37C
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $B3E0: Initialisation AI - enemy $D1BF (multiviola) ;;;
InitAI_Multiviola:
; Everything but the instruction list pointer assignment is done in the main AI, making it completely redundant to do here
    LDX.W EnemyIndex
    LDA.W Enemy.init0,X : STA.B DP_Temp12
    LDA.W Enemy.init1,X : AND.W #$00FF : STA.B DP_Temp14
    JSL Do_Some_Math_With_Sine_Cosine_Terrible_Label_Name ; ($16.$18, $1A.$1C) = ([$14] * |cos([$12] * pi / 80h)|, [$14] * |sin([$12] * pi / 80h)|)
    LDA.B DP_Temp16 : STA.W Multiviola.XVelocity,X
    LDA.B DP_Temp18 : STA.W Multiviola.XSubVelocity,X
    LDA.B DP_Temp1A : STA.W Multiviola.YVelocity,X
    LDA.B DP_Temp1C : STA.W Multiviola.YSubVelocity,X
    LDA.W #InstList_Multiviola : STA.W Enemy.instList,X
    RTL


;;; $B40F: Main AI - enemy $D1BF (multiviola) ;;;
MainAI_Multiviola:
; Note the two fixed point negation operations at $B443 and $B47D are off by 1.0 when the low word is zero
    LDX.W EnemyIndex
    LDA.W Enemy.init0,X : STA.B DP_Temp12
    LDA.W Enemy.init1,X : AND.W #$00FF : STA.B DP_Temp14
    JSL Do_Some_Math_With_Sine_Cosine_Terrible_Label_Name ; ($16.$18, $1A.$1C) = ([$14] * |cos([$12] * pi / 80h)|, [$14] * |sin([$12] * pi / 80h)|)
    LDA.B DP_Temp16 : STA.W Multiviola.XVelocity,X
    LDA.B DP_Temp18 : STA.W Multiviola.XSubVelocity,X
    LDA.B DP_Temp1A : STA.W Multiviola.YVelocity,X
    LDA.B DP_Temp1C : STA.W Multiviola.YSubVelocity,X
    LDA.W Enemy.init0,X : CLC : ADC.W #$0040 : BIT.W #$0080 : BNE +
    LDA.W Multiviola.XVelocity,X : EOR.W #$FFFF : STA.W Multiviola.XVelocity,X
    LDA.W Multiviola.XSubVelocity,X : EOR.W #$FFFF : INC : STA.W Multiviola.XSubVelocity,X

+   LDA.W Multiviola.XVelocity,X : STA.B DP_Temp14
    LDA.W Multiviola.XSubVelocity,X : STA.B DP_Temp12
    JSL MoveEnemyRightBy_14_12_IgnoreSlopes
    BCC .notCollidedWithWall
    LDA.W Enemy.init0,X : EOR.W #$0040 : STA.W Enemy.init0,X
    BRA .return

  .notCollidedWithWall:
    LDA.W Enemy.init0,X : CLC : ADC.W #$0080 : BIT.W #$0080 : BNE +
    LDA.W Multiviola.YVelocity,X : EOR.W #$FFFF : STA.W Multiviola.YVelocity,X
    LDA.W Multiviola.YSubVelocity,X : EOR.W #$FFFF : INC : STA.W Multiviola.YSubVelocity,X

+   LDA.W Multiviola.YVelocity,X : STA.B DP_Temp14
    LDA.W Multiviola.YSubVelocity,X : STA.B DP_Temp12
    JSL MoveEnemyDownBy_14_12
    BCC .return
    LDA.W Enemy.init0,X : EOR.W #$00C0 : STA.W Enemy.init0,X

  .return:
    RTL


;;; $B4AA: Spritemaps - multiviola ;;;
; Used instruction list
Spritemap_Multiviola_0:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $100)

Spritemap_Multiviola_1:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $102)

Spritemap_Multiviola_2:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $104)

Spritemap_Multiviola_3:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $106)

Spritemap_Multiviola_4:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $108)

Spritemap_Multiviola_5:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $10A)

Spritemap_Multiviola_6:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $10C)

Spritemap_Multiviola_7:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $10E)

; Unused instruction list
if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Multiviola_A2B4E2:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $120)

UNUSED_Spritemap_Multiviola_A2B4E9:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $122)

UNUSED_Spritemap_Multiviola_A2B4F0:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $124)

UNUSED_Spritemap_Multiviola_A2B4F7:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $126)

; Unused instruction list
UNUSED_Spritemap_Multiviola_A2B4FE:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $128)

UNUSED_Spritemap_Multiviola_B2B505:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $12A)

UNUSED_Spritemap_Multiviola_A2B50C:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $12C)

UNUSED_Spritemap_Multiviola_A2B513:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $12E)
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $B51A: Instruction list - polyp ;;;
InstList_Polyp:
    dw $0001,Spritemap_Polyp
    dw Instruction_Common_Sleep


;;; $B520: Polyp data ;;;
PolypData:
  .cooldownTimer:
; Cooldown time
    dw $0010,$0018,$0020,$0028,$0030,$0038,$0040,$0048

  .projectileInitialYSpeedTableIndex:
; Enemy projectile initial Y speed table index
    dw $001C,$001D,$001E,$001F,$0020,$0021,$0022,$0023
    dw $0024,$0025,$0026,$0027,$0028,$0029,$002A,$002B

  .projectileXVelocity:
; Enemy projectile X velocity
    dw $0060,$0070,$0080,$0090,$00A0,$00B0,$00C0,$00D0
    dw $FFA0,$FF90,$FF80,$FF70,$FF60,$FF50,$FF40,$FF30


;;; $B570: Initialisation AI - enemy $D1FF (polyp) ;;;
InitAI_Polyp:
    LDX.W EnemyIndex
    LDA.W #InstList_Polyp : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    LDA.W #Function_Polyp_WaitForSamusToGetNear : STA.W Polyp.function,X
    LDA.W #$0011 : STA.W RandomNumberSeed
    RTL


;;; $B58F: Main AI - enemy $D1FF (polyp) ;;;
MainAI_Polyp:
    LDX.W EnemyIndex
    JSR.W (Polyp.function,X)
    RTL


;;; $B596: Polyp function - wait for Samus to get near ;;;
Function_Polyp_WaitForSamusToGetNear:
    LDX.W EnemyIndex
    LDA.W #$0040
    JSL IsSamusWithinAPixelColumnsOfEnemy
    BEQ .return
    LDA.W #$0040
    JSL IsSamusWithingAPixelRowsOfEnemy
    BEQ .return
    LDA.W #Function_Polyp_ShootRock : STA.W Polyp.function,X

  .return:
    RTS


;;; $B5B2: Polyp function - shoot rock ;;;
Function_Polyp_ShootRock:
    LDX.W EnemyIndex
    JSL GenerateRandomNumber
    AND.W #$001E : TAY
    LDA.W PolypData_projectileXVelocity,Y : STA.W EnemyProjectile_InitParam1
    JSL GenerateRandomNumber
    AND.W #$001E : TAY
    LDA.W PolypData_projectileInitialYSpeedTableIndex,Y
    LDY.W #EnemyProjectile_LavaquakeRocks
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    LDA.W #Function_Polyp_Cooldown : STA.W Polyp.function,X
    JSL GenerateRandomNumber
    AND.W #$000E : TAY
    LDA.W PolypData_cooldownTimer,Y : STA.W Polyp.cooldownTimer,X
    RTS


;;; $B5EA: Polyp function - cooldown ;;;
Function_Polyp_Cooldown:
    LDX.W EnemyIndex
    DEC.W Polyp.cooldownTimer,X : BPL .return
    LDA.W #Function_Polyp_WaitForSamusToGetNear : STA.W Polyp.function,X

  .return:
    RTS


;;; $B5F9: RTL ;;;
RTL_B5FAF9:
    RTL


;;; $B5FA: RTL ;;;
RTL_B5FAFA:
    RTL


;;; $B5FB: Spritemap - polyp ;;;
Spritemap_Polyp:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 0, $10A)


;;; $B602: Initialisation AI - enemy $D23F (rinka) ;;;
InitAI_Rinka:
    LDX.W EnemyIndex
    LDA.W Enemy.init0,X : BEQ .notMBRoom
    JSR SpawnMotherBrainsRoomRinka
    LDA.L MotherBrainBody.deleteTurretsRinkasFlag ; >.<
    LDA.W Enemy.properties,X : ORA.W #$2C00 : AND.W #$BFFF : STA.W Enemy.properties,X
    BRA .propertiesSet

; Nothing points here, dead code
    LDA.W Enemy.properties,X : ORA.W #$2C00 : STA.W Enemy.properties,X
    BRA .propertiesSet

  .notMBRoom:
    LDA.W Enemy.properties,X : ORA.W #$6400 : AND.W #$F7FF : STA.W Enemy.properties,X

  .propertiesSet:
    LDA.W #$0400 : STA.W Enemy.palette,X
    BRA ResetRinka


;;; $B63E: Respawn rinka ;;;
RespawnRinka:
    LDA.W Enemy.init0,X : BEQ .notMBRoom
    JSR SpawnMotherBrainsRoomRinka

  .notMBRoom:
    LDA.L EnemySpawnData.XPosition,X : STA.W Enemy.XPosition,X
    LDA.L EnemySpawnData.YPosition,X : STA.W Enemy.YPosition,X
; fallthrough to ResetRinka


;;; $B654: Reset rinka ;;;
ResetRinka:
    LDA.W #Function_Rinka_WaitingToFire : STA.W Rinka.function,X
    LDA.W #$001A : STA.W Rinka.functionTimer,X
    STZ.W Rinka.XVelocity,X : STZ.W Rinka.YVelocity,X
    LDA.W Enemy.init0,X : BNE .MBRoom
    LDA.W #InstList_Rinka_NotMotherBrainsRoom_0 : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    RTL

  .MBRoom:
    LDA.L MotherBrainBody.deleteTurretsRinkasFlag : BEQ .MBPhase1
    LDA.W Enemy.properties,X : ORA.W #$0200 : STA.W Enemy.properties,X
    RTL

  .MBPhase1:
    LDA.W #InstList_Rinka_MotherBrainsRoom_0 : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    RTL


;;; $B69B: Spawn Mother Brain's room rinka ;;;
SpawnMotherBrainsRoomRinka:
; Spawn a rinka to one of the predefined spawn points in the room that's currently available
; The spawn point is selected as follows:
;     If it's on screen, the spawn point the rinka was previously spawned from
;     Otherwise, any on screen spawn point
;     Otherwise, any spawn point
    LDA.L EnemySpawnData.XPosition,X : STA.B DP_Temp12
    LDA.L EnemySpawnData.YPosition,X : STA.B DP_Temp14
    JSL CheckIfPositionIsOnScreen
    BCS +
    JSR GetAvailabilityIndexOfEnemySpawnPosition
    TAY
    PHX
    TAX
    LDA.L ExtraEnemy8800-2,X : LSR
    PLX
    BCS +
    TYA : STA.W Rinka.spawnPointAvailabilityTableIndex,X
    PHX
    TAX
    LDA.W #$FFFF : STA.L ExtraEnemy8800-2,X
    PLX
    RTS

+   LDY.W #$0000

  .loopOnScreen:
    LDA.W MotherBrainsRoomRinkaSpawnData_XPosition,Y : STA.B DP_Temp12
    LDA.W MotherBrainsRoomRinkaSpawnData_YPosition,Y : STA.B DP_Temp14
    JSL CheckIfPositionIsOnScreen
    BCS .next
    PHX
    LDX.W MotherBrainsRoomRinkaSpawnData_spawnPointAvailabilityIndex,Y
    LDA.L ExtraEnemy8800-2,X : LSR
    PLX
    BCC .found

  .next:
    INY #6 : CPY.W #$0042 : BMI .loopOnScreen
    JMP .notFound

    RTS ; >.<

  .found:
    LDA.B DP_Temp12 : STA.L EnemySpawnData.XPosition,X : STA.W Enemy.XPosition,X
    LDA.B DP_Temp14 : STA.L EnemySpawnData.YPosition,X : STA.W Enemy.YPosition,X
    PHX
    LDX.W MotherBrainsRoomRinkaSpawnData_spawnPointAvailabilityIndex,Y
    LDA.W #$FFFF : STA.L ExtraEnemy8800-2,X
    TXA
    PLX
    STA.W Rinka.spawnPointAvailabilityTableIndex,X
    RTS

  .notFound:
    LDY.W #$0000

  .loopAny:
    PHX
    LDX.W MotherBrainsRoomRinkaSpawnData_spawnPointAvailabilityIndex,Y
    LDA.L ExtraEnemy8800-2,X
    PLX
    LSR : BCC .spawn
    INY #6 : CPY.W #$0042 : BMI .loopAny
    RTS

  .spawn:
    LDA.W MotherBrainsRoomRinkaSpawnData_XPosition,Y : STA.L EnemySpawnData.XPosition,X : STA.W Enemy.XPosition,X
    LDA.W MotherBrainsRoomRinkaSpawnData_YPosition,Y : STA.L EnemySpawnData.YPosition,X : STA.W Enemy.YPosition,X
    LDA.W MotherBrainsRoomRinkaSpawnData_spawnPointAvailabilityIndex,Y : STA.W Rinka.spawnPointAvailabilityTableIndex,X
    PHX
    TAX
    LDA.W #$FFFF : STA.L ExtraEnemy8800-2,X
    PLX
    RTS


;;; $B75B: Mother Brain's room rinka spawn data ;;;
MotherBrainsRoomRinkaSpawnData:
;        _______________ X position
;       |      _________ Y position
;       |     |      ___ Index into spawn point availability table + 2
;       |     |     |
  .XPosition:
    dw $03E7
  .YPosition:
    dw       $0026
  .spawnPointAvailabilityIndex:
    dw             $0002
    dw $03E7,$00A6,$0004
    dw $0337,$0036,$0006
    dw $0337,$00A6,$0008
    dw $0277,$001C,$000A
    dw $0277,$00B6,$000C
    dw $01B7,$0036,$000E
    dw $01B7,$00A6,$0010
    dw $00F7,$001C,$0012
    dw $00F7,$00B6,$0014
    dw $0080,$00A8,$0016


;;; $B79D: Get availability index of enemy spawn position ;;;
GetAvailabilityIndexOfEnemySpawnPosition:
    LDY.W #$0000

  .loop:
    LDA.W MotherBrainsRoomRinkaSpawnData_XPosition,Y : CMP.L EnemySpawnData.XPosition,X : BNE .next
    LDA.W MotherBrainsRoomRinkaSpawnData_YPosition,Y : CMP.L EnemySpawnData.YPosition,X : BEQ .found

  .next:
    TYA : CLC : ADC.W #$0006 : TAY
    CMP.W #$0042 : BMI .loop
    LDY.W #$0000

  .found:
    LDA.W MotherBrainsRoomRinkaSpawnData_spawnPointAvailabilityIndex,Y
    RTS


;;; $B7C4: Main AI - enemy $D23F (rinka) ;;;
MainAI_Rinka:
    LDX.W EnemyIndex
    LDA.W Enemy.init0,X : BEQ .function
    LDA.L MotherBrainBody.deleteTurretsRinkasFlag : BEQ .function
    JSR DecrementRinkaCounter
    JSR MarkRinkaSpawnPointAvailable
    JML RinkaDeath

  .function:
    JMP.W (Rinka.function,X)


;;; $B7DF: Rinka function - fire ;;;
Function_Rinka_Fire:
    DEC.W Rinka.functionTimer,X : BPL Function_Rinka_Fire_return
    LDA.W #Function_Rinka_Moving : STA.W Rinka.function,X
    LDA.W Enemy.init0,X : BEQ .notMBRoom
    LDA.W Enemy.properties,X : AND.W #$FBFF : STA.W Enemy.properties,X
    BRA +

  .notMBRoom:
    LDA.W Enemy.properties,X : ORA.W #$0800 : AND.W #$FBFF : STA.W Enemy.properties,X

+   LDA.W SamusXPosition : SEC : SBC.W Enemy.XPosition,X : STA.B DP_Temp12
    LDA.W SamusYPosition : SEC : SBC.W Enemy.YPosition,X : STA.B DP_Temp14
    JSL CalculateAngleOf_12_14_Offset
    SEC : SBC.W #$0080 : EOR.W #$FFFF : INC
    AND.W #$00FF : STA.B DP_Temp12
    LDA.W #$0120
    JSL CalculateXVelocityFromSpeedAndAngle
    LDX.W EnemyIndex
    STA.W Rinka.XVelocity,X
    LDA.W #$0120
    JSL CalculateYVelocityFromSpeedAndAngle
    LDX.W EnemyIndex
    STA.W Rinka.YVelocity,X

  .return:
    RTL


;;; $B844: Rinka function - killed ;;;
Function_Rinka_Killed:
    DEC.W Rinka.functionTimer,X : BPL Function_Rinka_Fire_return
    LDA.W #$000A : STA.W Enemy.health,X
    JMP RespawnRinka


;;; $B852: Rinka function - waiting to fire ;;;
Function_Rinka_WaitingToFire:
    JSL CheckIfRinkaIsOnScreen
    BCC Function_Rinka_Fire_return
    JMP DeleteAndRespawnRinka


;;; $B85B: Rinka function - moving ;;;
Function_Rinka_Moving:
    JSL MoveEnemyAccordingToVelocity
    JSL CheckIfRinkaIsOnScreen
    BCC Function_Rinka_Fire_return
; fallthrough to DeleteAndRespawnRinka


;;; $B865: Delete and respawn rinka ;;;
DeleteAndRespawnRinka:
    LDA.W Enemy.init0,X : BEQ .notMBRoom
    JSR MarkRinkaSpawnPointAvailable
    LDA.L MotherBrainBody.deleteTurretsRinkasFlag : BEQ .notMBRoom
    JSR DecrementRinkaCounter
    JML DeleteEnemyAndAnyConnectedEnemies

  .notMBRoom:
    JSR DecrementRinkaCounter
    JMP RespawnRinka


;;; $B880: Decrement rinka counter ;;;
DecrementRinkaCounter:
    LDA.W Enemy.init0,X : BEQ .return
    LDA.W Enemy.properties,X : AND.W #$0100 : BNE .return
    LDA.L MotherBrainBody.RinkaCounter : DEC : BPL .storeRinkaCounter
    LDA.W #$0000

  .storeRinkaCounter:
    STA.L MotherBrainBody.RinkaCounter

  .return:
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $B89C: Unused ;;;
UNUSED_Rinka_A2B89C:
    LDA.W NumberOfTimesMainEnemyRoutineExecuted : AND.W #$0003 : CMP.W Enemy.init0,X : BNE .setAsIntangible
    LDA.W Enemy.properties,X : AND.W #$FBFF : STA.W Enemy.properties,X
    RTS

  .setAsIntangible:
    LDA.W Enemy.properties,X : ORA.W #$0400 : STA.W Enemy.properties,X
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $B8BB: Mark rinka spawn point available ;;;
MarkRinkaSpawnPointAvailable:
    LDA.W Enemy.init0,X : BEQ .return
    LDA.W Rinka.spawnPointAvailabilityTableIndex,X : BEQ .return
    PHX
    TAX
    LDA.W #$0000 : STA.L ExtraEnemy8800-2,X
    PLX
    STA.W Rinka.spawnPointAvailabilityTableIndex,X

  .return:
    RTS


;;; $B8D3: Check if rinka is on screen ;;;
CheckIfRinkaIsOnScreen:
;; Returns:
;;     Carry: Clear if rinka is on screen, set otherwise
    LDA.W Enemy.YPosition,X : BMI .returnOffScreen
    CLC : ADC.W #$0010
    SEC : SBC.W Layer1YPosition : BMI .returnOffScreen
    CMP.W #$0100 : BPL .returnOffScreen
    LDA.W Enemy.XPosition,X : BMI .returnOffScreen
    CLC : ADC.W #$0010
    SEC : SBC.W Layer1XPosition : BMI .returnOffScreen
    CMP.W #$0120 : BPL .returnOffScreen
    CLC
    RTL

  .returnOffScreen:
    SEC
    RTL


;;; $B8FF: Check if position is on screen ;;;
CheckIfPositionIsOnScreen:
;; Parameters:
;;     $12: X position
;;     $14: Y position
;; Returns:
;;     Carry: Clear if position is on screen, set otherwise
    LDA.B DP_Temp14 : BMI .returnOffScreen
    CLC : ADC.W #$0000
    SEC : SBC.W Layer1YPosition : BMI .returnOffScreen
    CMP.W #$00E0 : BPL .returnOffScreen
    LDA.B DP_Temp12 : BMI .returnOffScreen
    CLC : ADC.W #$0000
    SEC : SBC.W Layer1XPosition : BMI .returnOffScreen
    CMP.W #$0100 : BPL .returnOffScreen
    CLC
    RTL

  .returnOffScreen:
    SEC
    RTL


;;; $B929: Frozen AI - enemy $D23F (rinka) ;;;
FrozenAI_Rinka:
    JSL CheckIfRinkaIsOnScreen
    BCC .onScreen
    STZ.W Enemy.freezeTimer,X

  .onScreen:
    JSL NormalEnemyFrozenAI
    LDA.L MotherBrainBody.deleteTurretsRinkasFlag : BNE .delete
    RTL

  .delete:
    JSR DecrementRinkaCounter
    JSR MarkRinkaSpawnPointAvailable
    JML RinkaDeath


;;; $B947: Enemy touch - enemy $D23F (rinka) ;;;
EnemyTouch_Rinka:
    JSL NormalEnemyTouchAI_NoDeathCheck_External
    BRA ContactReaction_Rinka_Common


;;; $B94D: Enemy shot - enemy $D23F (rinka) ;;;
EnemyShot_Rinka:
    JSL NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External
    BRA ContactReaction_Rinka_Common


;;; $B953: Power bomb reaction - enemy $D23F (rinka) ;;;
PowerBombReaction_Rinka:
    LDA.W Enemy.properties,X : AND.W #$0100 : BEQ .notInvisible
    RTL

  .notInvisible:
    JSL NormalEnemyPowerBombAI_NoDeathCheck_External
; fallthrough to ContactReaction_Rinka_Common


;;; $B960: Rinka shared contact reaction ;;;
ContactReaction_Rinka_Common:
    LDA.W Enemy.health,X : BEQ .dead
    RTL

  .dead:
    JSR DecrementRinkaCounter
    JSR MarkRinkaSpawnPointAvailable
    LDA.W Enemy.init0,X : BNE .MBRoom
    LDA.W #$0000
    JML RinkaDeath

  .MBRoom:
    LDA.W Enemy.properties,X : ORA.W #$0500 : STA.W Enemy.properties,X
    LDA.W Enemy.XPosition,X : STA.B DP_Temp12
    LDA.W Enemy.YPosition,X : STA.B DP_Temp14
    LDY.W #EnemyProjectile_MiscDust
    LDA.W #$0003
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    LDA.W #Function_Rinka_Killed : STA.W Rinka.function,X
    LDA.W #$0001 : STA.W Rinka.functionTimer,X
    RTL


if !FEATURE_KEEP_UNREFERENCED
;;; $B9A2: Unused. Instruction - go to [[Y]] if [rinka counter] >= 3 ;;;
UNUSED_Instruction_Rinka_GotoYIfCounterGreaterThan2_A2B9A2:
    LDA.L MotherBrainBody.RinkaCounter : CMP.W #$0003 : BPL .gotoY
    INY #2
    RTL

  .gotoY:
    LDA.W $0000,Y : TAY
    RTL
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $B9B3: Instruction - set enemy as intangible and invisible ;;;
Instruction_Rinka_SetAsIntangibleAndInvisible:
    LDA.W Enemy.properties,X : ORA.W #$0500 : STA.W Enemy.properties,X
    RTL


;;; $B9BD: Instruction - set enemy as intangible, invisible and active off-screen ;;;
Instruction_Rinka_SetAsIntangibleInvisibleAndActiveOffScreen:
    LDA.W Enemy.properties,X : ORA.W #$0D00 : STA.W Enemy.properties,X
    RTL


;;; $B9C7: Instruction - fire rinka ;;;
Instruction_Rinka_FireRinka:
    LDA.W Enemy.properties,X : AND.W #$FAFF : STA.W Enemy.properties,X
    LDA.W #Function_Rinka_Fire : STA.W Rinka.function,X
    LDA.L MotherBrainBody.RinkaCounter : INC : STA.L MotherBrainBody.RinkaCounter
    RTL


;;; $B9E0: Instruction list - not Mother Brain's room ;;;
InstList_Rinka_NotMotherBrainsRoom_0:
    dw Instruction_Rinka_SetAsIntangibleAndInvisible
    dw $0040,Spritemap_Rinka_0
    dw Instruction_Rinka_FireRinka

InstList_Rinka_NotMotherBrainsRoom_1:
    dw $0010,Spritemap_Rinka_0
    dw $0008,Spritemap_Rinka_1
    dw $0007,Spritemap_Rinka_2
    dw $0006,Spritemap_Rinka_3
    dw $0005,Spritemap_Rinka_4
    dw $0006,Spritemap_Rinka_3
    dw $0007,Spritemap_Rinka_2
    dw $0008,Spritemap_Rinka_1
    dw Instruction_Common_GotoY
    dw InstList_Rinka_NotMotherBrainsRoom_1


;;; $BA0C: Instruction list - Mother Brain's room ;;;
InstList_Rinka_MotherBrainsRoom_0:
    dw Instruction_Rinka_SetAsIntangibleInvisibleAndActiveOffScreen
    dw $0040,Spritemap_Rinka_0
    dw Instruction_Rinka_FireRinka

InstList_Rinka_MotherBrainsRoom_1:
    dw $0010,Spritemap_Rinka_0
    dw $0008,Spritemap_Rinka_1
    dw $0007,Spritemap_Rinka_2
    dw $0006,Spritemap_Rinka_3
    dw $0005,Spritemap_Rinka_4
    dw $0006,Spritemap_Rinka_3
    dw $0007,Spritemap_Rinka_2
    dw $0008,Spritemap_Rinka_1
    dw Instruction_Common_GotoY
    dw InstList_Rinka_MotherBrainsRoom_1


;;; $BA38: Spritemaps - rinka ;;;
Spritemap_Rinka_0:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $100)

Spritemap_Rinka_1:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $102)

Spritemap_Rinka_2:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $104)

Spritemap_Rinka_3:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $106)

Spritemap_Rinka_4:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 3, 0, $108)


;;; $BA5B: Palette - enemy $D1FF/$D23F (polyp / rinka) ;;;
Palette_Polyp_Rinka:
    dw $3800,$5739,$4273,$2DAD,$14C6,$19DA,$1174,$0D0F
    dw $08AA,$0FDE,$02DF,$019F,$005F,$0037,$6FDF,$0006


;;; $BA7B: Palette - enemy $D27F (rio) ;;;
Palette_Rio:
    dw $3800,$2FFF,$1AF7,$014A,$0063,$275A,$0EB5,$0210
    dw $01CE,$03E0,$02E0,$0200,$0100,$7F00,$6DE0,$54E0


if !FEATURE_KEEP_UNREFERENCED
;;; $BA9B: Unused. Instruction list ;;;
UNUSED_InstList_Rio_Idle_A2BB9B:
; Clone of InstList_Rio_Idle
    dw $0004,Spritemap_Rio_0
    dw $0004,Spritemap_Rio_1
    dw $0004,Spritemap_Rio_0
    dw $0004,Spritemap_Rio_1
    dw $0004,Spritemap_Rio_0
    dw $0004,Spritemap_Rio_1
    dw $0004,Spritemap_Rio_0
    dw $0004,Spritemap_Rio_1
    dw $0004,Spritemap_Rio_2
    dw $0004,Spritemap_Rio_3
    dw $0004,Spritemap_Rio_2
    dw $0004,Spritemap_Rio_3
    dw Instruction_Common_GotoY
    dw UNUSED_InstList_Rio_Idle_A2BB9B


;;; $BACF: Unused. Instruction list ;;;
UNUSED_InstList_Rio_Swooping_A2BACF:
; Combination of the two swooping instruction lists
    dw $0003,Spritemap_Rio_2
    dw $0003,Spritemap_Rio_3
    dw $0003,Spritemap_Rio_4
    dw $0003,Spritemap_Rio_5
    dw $0003,Spritemap_Rio_6
    dw $0003,Spritemap_Rio_7
    dw $0003,Spritemap_Rio_6
    dw $0003,Spritemap_Rio_7
    dw $0003,Spritemap_Rio_6
    dw $0003,Spritemap_Rio_7
    dw $0003,Spritemap_Rio_6
    dw $0003,Spritemap_Rio_7
    dw $0003,Spritemap_Rio_6
    dw $0003,Spritemap_Rio_7
    dw $0003,Spritemap_Rio_6
    dw $0003,Spritemap_Rio_7
    dw $0003,Spritemap_Rio_6
    dw $0003,Spritemap_Rio_7
    dw $0003,Spritemap_Rio_6
    dw $0003,Spritemap_Rio_7
    dw $0003,Spritemap_Rio_6
    dw $0003,Spritemap_Rio_7
    dw $0003,Spritemap_Rio_6
    dw $0003,Spritemap_Rio_7
    dw $0003,Spritemap_Rio_6
    dw $0003,Spritemap_Rio_7
    dw $0003,Spritemap_Rio_6
    dw $0003,Spritemap_Rio_7
    dw $0003,Spritemap_Rio_6
    dw $0003,Spritemap_Rio_7
    dw Instruction_Common_GotoY
    dw UNUSED_InstList_Rio_Swooping_A2BACF
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $BB4B: Instruction list - idle ;;;
InstList_Rio_Idle:
    dw $0004,Spritemap_Rio_0
    dw $0004,Spritemap_Rio_1


;;; $BB53: Instruction list - post-swoop idle ;;;
InstList_Rio_PostSwoopIdle:
    dw $0004,Spritemap_Rio_0
    dw $0004,Spritemap_Rio_1
    dw $0004,Spritemap_Rio_0
    dw $0004,Spritemap_Rio_1
    dw $0004,Spritemap_Rio_0
    dw $0004,Spritemap_Rio_1
    dw $0004,Spritemap_Rio_2
    dw $0004,Spritemap_Rio_3
    dw $0004,Spritemap_Rio_2
    dw $0004,Spritemap_Rio_3
    dw Instruction_Common_GotoY
    dw InstList_Rio_Idle


;;; $BB7F: Instruction list - swooping - part 1 ;;;
InstList_Rio_Swooping_Part1:
    dw $0003,Spritemap_Rio_2
    dw $0003,Spritemap_Rio_3
    dw $0003,Spritemap_Rio_4
    dw $0003,Spritemap_Rio_5
    dw $0003,Spritemap_Rio_6
    dw Instruction_Rio_SetAnimationFinishedFlag
    dw Instruction_Common_Sleep


;;; $BB97: Instruction list - swooping - part 2 ;;;
InstList_Rio_Swooping_Part2:
    dw $0003,Spritemap_Rio_7
    dw $0003,Spritemap_Rio_6
    dw Instruction_Common_GotoY
    dw InstList_Rio_Swooping_Part2


;;; $BBA3: Instruction list - swoop cooldown ;;;
InstList_Rio_SwoopCooldown:
    dw $0003,Spritemap_Rio_6
    dw $0003,Spritemap_Rio_5
    dw $0003,Spritemap_Rio_4
    dw $0003,Spritemap_Rio_3
    dw $0003,Spritemap_Rio_2
    dw Instruction_Rio_SetAnimationFinishedFlag
    dw Instruction_Common_Sleep


;;; $BBBB: Rio constants ;;;
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


;;; $BBC3: Instruction - set animation finished flag ;;;
Instruction_Rio_SetAnimationFinishedFlag:
    LDX.W EnemyIndex
    LDA.W #$0001 : STA.W Rio.animationFinishedFlag,X
    RTL


;;; $BBCD: Initialisation AI - enemy $D27F (rio) ;;;
InitAI_Rio:
    LDX.W EnemyIndex
    STZ.W Rio.animationFinishedFlag,X : STZ.W Rio.instList,X
    LDA.W #InstList_Rio_Idle : STA.W Enemy.instList,X
    LDA.W #Function_Rio_WaitForSamusToGetNear : STA.W Rio.function,X
    RTL


;;; $BBE3: Main AI - enemy $D27F (rio) ;;;
MainAI_Rio:
    JSL GenerateRandomNumber
    LDX.W EnemyIndex
    JMP.W (Rio.function,X)


;;; $BBED: Rio function - wait for Samus to get near ;;;
Function_Rio_WaitForSamusToGetNear:
    LDA.W #$00A0
    JSL CheckIfXDistanceBetweenEnemyAndSamusIsAtLeastA
    BCC .SamusNear
    RTL

  .SamusNear:
    LDA.W RioConstants_YVelocity : STA.W Rio.YVelocity,X
    LDA.W RioConstants_XVelocity : STA.W Rio.XVelocity,X
    LDA.W SamusXPosition : CMP.W Enemy.XPosition,X : BPL +
    LDA.W Rio.XVelocity,X : EOR.W #$FFFF : INC : STA.W Rio.XVelocity,X

+   LDA.W #InstList_Rio_Swooping_Part1
    JSR SetRioInstList
    LDA.W #Function_Rio_Swoop_Descending : STA.W Rio.function,X
    JSL CheckIfEnemyCenterIsOnScreen
    AND.W #$FFFF : BNE .return
    LDA.W #$0065
    JSL QueueSound_Lib2_Max6

  .return:
    RTL


;;; $BC32: Rio function - swoop cooldown ;;;
Function_Rio_SwoopCooldown:
    LDA.W Rio.animationFinishedFlag,X : BNE .finishedAnimation
    RTL

  .finishedAnimation:
    STZ.W Rio.animationFinishedFlag,X
    LDA.W #InstList_Rio_PostSwoopIdle
    JSR SetRioInstList
    LDA.W #Function_Rio_WaitForSamusToGetNear : STA.W Rio.function,X
    RTL


;;; $BC48: Rio function - swoop - descending ;;;
Function_Rio_Swoop_Descending:
    STZ.B DP_Temp12 : STZ.B DP_Temp14
    LDA.W Rio.XVelocity,X : BPL +
    DEC.B DP_Temp14

+   STA.B DP_Temp13
    JSL MoveEnemyRightBy_14_12_IgnoreSlopes
    BCS .collidedHorizontally
    STZ.B DP_Temp12 : STZ.B DP_Temp14
    LDA.W Rio.YVelocity,X : BPL +
    DEC.B DP_Temp14

+   STA.B DP_Temp13
    JSL MoveEnemyDownBy_14_12
    BCS .collidedVertically
    LDA.W Rio.YVelocity,X : SEC : SBC.W #$0018 : STA.W Rio.YVelocity,X : BMI .homing
    LDA.W Rio.animationFinishedFlag,X : BEQ .return
    STZ.W Rio.animationFinishedFlag,X
    LDA.W #InstList_Rio_Swooping_Part2
    JSR SetRioInstList

  .return:
    RTL

  .homing:
    LDA.W Rio.XVelocity,X : STA.W Rio.backupSwoopXVelocity,X
    STZ.W Rio.XVelocity,X : STZ.W Rio.YVelocity,X
    LDA.W #Function_Rio_Homing : STA.W Rio.function,X
    RTL

  .collidedHorizontally:
    LDA.W Rio.XVelocity,X : EOR.W #$FFFF : INC : STA.W Rio.XVelocity,X

  .collidedVertically:
    LDA.W Rio.YVelocity,X : EOR.W #$FFFF : INC : STA.W Rio.YVelocity,X
    LDA.W #Function_Rio_Swoop_Ascending : STA.W Rio.function,X
    RTL


;;; $BCB7: Rio function - swoop - ascending ;;;
Function_Rio_Swoop_Ascending:
    STZ.B DP_Temp12 : STZ.B DP_Temp14
    LDA.W Rio.XVelocity,X : BPL +
    DEC.B DP_Temp14

+   STA.B DP_Temp13
    JSL MoveEnemyRightBy_14_12_IgnoreSlopes
    BCC .notCollidedWithWall
    LDA.W Rio.XVelocity,X : EOR.W #$FFFF : INC : STA.W Rio.XVelocity,X

  .notCollidedWithWall:
    STZ.B DP_Temp12 : STZ.B DP_Temp14
    LDA.W Rio.YVelocity,X : BPL +
    DEC.B DP_Temp14

+   STA.B DP_Temp13
    JSL MoveEnemyDownBy_14_12
    BCS .notCollidedWithBlock
    LDA.W Rio.YVelocity,X : SEC : SBC.W #$0018 : STA.W Rio.YVelocity,X
    RTL

  .notCollidedWithBlock:
    LDA.W #InstList_Rio_SwoopCooldown
    JSR SetRioInstList
    LDA.W #Function_Rio_SwoopCooldown : STA.W Rio.function,X
    RTL


;;; $BCFF: Rio function - homing ;;;
Function_Rio_Homing:
    LDA.W Enemy.YPosition,X : SEC : SBC.W SamusYPosition : BPL .resumeSwoop
    JSL CalculateAngleOfSamusFromEnemy
    TXY
    ASL : TAX
    LDA.L SineCosineTables_8bitSine_SignExtended,X : STA.W Rio.XVelocity,Y
    LDA.L SineCosineTables_NegativeCosine_SignExtended,X : STA.W Rio.YVelocity,Y
    TYX
    STZ.B DP_Temp12 : STZ.B DP_Temp14
    LDA.W Rio.XVelocity,X : BPL +
    DEC.B DP_Temp14

+   STA.B DP_Temp13
    JSL MoveEnemyRightBy_14_12_IgnoreSlopes
    STZ.B DP_Temp12 : STZ.B DP_Temp14
    LDA.W Rio.YVelocity,X : BPL +
    DEC.B DP_Temp14

+   STA.B DP_Temp13
    JSL MoveEnemyDownBy_14_12
    RTL

  .resumeSwoop:
    LDA.W Rio.backupSwoopXVelocity,X : STA.W Rio.XVelocity,X
    LDA.W #$FFFF : STA.W Rio.YVelocity,X
    LDA.W #Function_Rio_Swoop_Ascending : STA.W Rio.function,X
    RTL


;;; $BD54: Set rio instruction list ;;;
SetRioInstList:
;; Parameters:
;;     A: Instruction list pointer
    LDX.W EnemyIndex
    CMP.W Rio.instList,X : BEQ .return
    STA.W Rio.instList,X : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X

  .return:
    RTS


;;; $BD6C: Spritemaps - rio ;;;
Spritemap_Rio_0:
    dw $0004
    %spritemapEntry(1, $1FF, $F0, 0, 1, 2, 0, $100)
    %spritemapEntry(1, $1FF, $00, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $1F0, $00, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 2, 0, $100)

Spritemap_Rio_1:
    dw $0004
    %spritemapEntry(1, $1F0, $00, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1FF, $00, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $1FF, $F8, 1, 1, 2, 0, $104)
    %spritemapEntry(1, $1F0, $F8, 1, 0, 2, 0, $104)

Spritemap_Rio_2:
    dw $0004
    %spritemapEntry(1, $1FF, $00, 0, 1, 2, 0, $106)
    %spritemapEntry(1, $1F0, $00, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $1FF, $F0, 0, 1, 2, 0, $100)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 2, 0, $100)

Spritemap_Rio_3:
    dw $0004
    %spritemapEntry(1, $1FF, $00, 0, 1, 2, 0, $106)
    %spritemapEntry(1, $1F0, $00, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $1FF, $F8, 1, 1, 2, 0, $104)
    %spritemapEntry(1, $1F0, $F8, 1, 0, 2, 0, $104)

Spritemap_Rio_4:
    dw $0004
    %spritemapEntry(1, $1FF, $00, 0, 1, 2, 0, $108)
    %spritemapEntry(1, $1F0, $00, 0, 0, 2, 0, $108)
    %spritemapEntry(1, $1FF, $F0, 0, 1, 2, 0, $100)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 2, 0, $100)

Spritemap_Rio_5:
    dw $0004
    %spritemapEntry(1, $1FF, $00, 0, 1, 2, 0, $108)
    %spritemapEntry(1, $1F0, $00, 0, 0, 2, 0, $108)
    %spritemapEntry(1, $1FF, $F8, 1, 1, 2, 0, $104)
    %spritemapEntry(1, $1F0, $F8, 1, 0, 2, 0, $104)

Spritemap_Rio_6:
    dw $0004
    %spritemapEntry(1, $1FF, $00, 0, 1, 2, 0, $10A)
    %spritemapEntry(1, $1F0, $00, 0, 0, 2, 0, $10A)
    %spritemapEntry(1, $1FF, $F0, 0, 1, 2, 0, $100)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 2, 0, $100)

Spritemap_Rio_7:
    dw $0004
    %spritemapEntry(1, $1FF, $00, 0, 1, 2, 0, $10A)
    %spritemapEntry(1, $1F0, $00, 0, 0, 2, 0, $10A)
    %spritemapEntry(1, $1FF, $F8, 1, 1, 2, 0, $104)
    %spritemapEntry(1, $1F0, $F8, 1, 0, 2, 0, $104)


;;; $BE1C: Palette - enemy $D2BF (squeept) ;;;
Palette_Squeept:
    dw $3800,$021D,$0015,$0008,$0003,$00BD,$0013,$000E
    dw $000B,$7FFF,$039C,$0237,$00D1,$03A0,$02C0,$05E0


;;; $BE3C: Instruction list - rising ;;;
InstList_Squeept_Rising:
    dw $0001,Spritemap_Squeept_0
    dw Instruction_Common_Sleep


;;; $BE42: Instruction list - flipping / falling ;;;
InstList_Squeept_Flipping_Falling:
    dw $0001,Spritemap_Squeept_0
    dw $0005,Spritemap_Squeept_1
    dw $0009,Spritemap_Squeept_2
    dw $0007,Spritemap_Squeept_3
    dw $0003,Spritemap_Squeept_4
    dw $000A,Spritemap_Squeept_5
    dw $0001,Spritemap_Squeept_6
    dw Instruction_Squeept_SetAnimationFinishedFlag
    dw Instruction_Common_Sleep


;;; $BE62: Instruction list - flame ;;;
InstList_Squeept_Flame_0:
    dw $0001,Spritemap_Squeept_7
    dw $0001,Spritemap_Common_Nothing
    dw Instruction_Common_TimerInY,$0001

InstList_Squeept_Flame_1:
    dw $0001,Spritemap_Squeept_9
    dw $0001,Spritemap_Common_Nothing
    dw $0001,Spritemap_Squeept_8
    dw $0001,Spritemap_Common_Nothing
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate
    dw InstList_Squeept_Flame_1
    dw Instruction_Common_GotoY
    dw InstList_Squeept_Flame_0


;;; $BE86: Squeept initial Y velocities ;;;
SqueeptInitialYVelocities:
; Unit 1/100h px/frame
    dw $F7FF,$F8FE,$F9BF,$FAFF


;;; $BE8E: Instruction - set animation finished flag ;;;
Instruction_Squeept_SetAnimationFinishedFlag:
    LDX.W EnemyIndex
    LDA.W #$0001 : STA.L Squeept.animationFinishedFlag,X
    RTL


;;; $BE99: Initialisation AI - enemy $D2BF (squeept) ;;;
InitAI_Squeept:
    LDX.W EnemyIndex
    LDA.W #$0000 : STA.L Squeept.animationFinishedFlag,X : STA.L Squeept.instList,X
    LDA.W Geruta.part,X : BMI .flame
    LDA.W Enemy.XPosition,X : STA.W Squeept.spawnXPosition,X
    LDA.W Enemy.YPosition,X : STA.W Squeept.spawnYPosition,X
    LDA.W #InstList_Squeept_Rising : STA.W Enemy.instList,X
    LDA.W #Function_Squeept_Jump : STA.W Squeept.function,X
    RTL

  .flame:
    LDA.W #InstList_Squeept_Flame_0 : STA.W Enemy.instList,X
    LDA.W #Function_Squeept_Flame : STA.W Squeept.function,X
    RTL


;;; $BED2: Main AI - enemy $D2BF (squeept) ;;;
MainAI_Squeept:
    JSL GenerateRandomNumber
    LDX.W EnemyIndex
    JMP.W (Squeept.function,X)


;;; $BEDC: Squeept function - flame ;;;
Function_Squeept_Flame:
    LDA.W Enemy[-1].health,X : BNE .notDead
    LDA.W Enemy.properties,X : ORA.W #$0200 : STA.W Enemy.properties,X
    RTL

  .notDead:
    LDA.W Enemy[-1].freezeTimer,X : STA.W Enemy.freezeTimer,X : BEQ .frozen
    BRA .invisible

  .frozen:
    BIT.W Enemy[-1].var2,X : BMI .visible

  .invisible:
    LDA.W Enemy.properties,X : ORA.W #$0100 : STA.W Enemy.properties,X
    RTL

  .visible:
    LDA.W Enemy.properties,X : AND.W #$FEFF : STA.W Enemy.properties,X
    LDA.W Enemy[-1].YPosition,X : STA.W Enemy.YPosition,X
    LDA.W Enemy[-1].YPosition,X : STA.W Enemy.YPosition,X ; >_<
    RTL


;;; $BF1A: Squeept function - jump ;;;
Function_Squeept_Jump:
    LDA.W RandomNumberSeed+1 : AND.W #$0006 : TAY
    LDA.W SqueeptInitialYVelocities,Y : STA.W Squeept.YVelocity,X
    LDA.W #Function_Squeept_Rising : STA.W Squeept.function,X
    LDA.W Enemy.properties,X : ORA.W #$0800 : STA.W Enemy.properties,X
    LDA.W #$000D
    JSL QueueSound_Lib2_Max6
    RTL


;;; $BF3E: Squeept function - rising ;;;
Function_Squeept_Rising:
    LDA.W Enemy.var1+1,X : AND.W #$FF00 : CLC : ADC.W Enemy.YSubPosition,X : STA.W Enemy.YSubPosition,X
    LDA.W Squeept.YVelocity,X : XBA : BPL .lowByte
    ORA.W #$FF00
    BRA +

  .lowByte:
    AND.W #$00FF

+   ADC.W Enemy.YPosition,X : STA.W Enemy.YPosition,X
    LDA.W Squeept.YVelocity,X : CLC : ADC.W #$0038 : STA.W Squeept.YVelocity,X
    CMP.W #$FC00 : BCS .maxHeight
    RTL

  .maxHeight:
    LDA.W #InstList_Squeept_Flipping_Falling
    JSR SetSqueeptInstList
    LDA.W #Function_Squeept_Flipping : STA.W Squeept.function,X
    RTL


;;; $BF7C: Squeept function - flipping ;;;
Function_Squeept_Flipping:
    LDA.W Enemy.var1+1,X : AND.W #$FF00 : CLC : ADC.W Enemy.YSubPosition,X : STA.W Enemy.YSubPosition,X
    LDA.W Squeept.YVelocity,X : XBA : BPL .lowByte
    ORA.W #$FF00
    BRA +

  .lowByte:
    AND.W #$00FF

+   ADC.W Enemy.YPosition,X : STA.W Enemy.YPosition,X
    LDA.W Squeept.YVelocity,X : CLC : ADC.W #$0038 : STA.W Squeept.YVelocity,X
    LDA.L Squeept.animationFinishedFlag,X : BNE .animationFinished
    RTL

  .animationFinished:
    LDA.W #$0000 : STA.L Squeept.animationFinishedFlag,X
    LDA.W #Function_Squeept_Falling : STA.W Squeept.function,X
    RTL


;;; $BFBC: Squeept function - falling ;;;
Function_Squeept_Falling:
    LDA.W Enemy.var1+1,X : AND.W #$FF00 : CLC : ADC.W Enemy.YSubPosition,X : STA.W Enemy.YSubPosition,X
    LDA.W Squeept.YVelocity,X : XBA : BPL .lowByte
    ORA.W #$FF00
    BRA +

  .lowByte:
    AND.W #$00FF

+   ADC.W Enemy.YPosition,X : STA.W Enemy.YPosition,X
    AND.W #$00F0 : CMP.W #$00F0 : BEQ .nextJump
    LDA.W Squeept.YVelocity,X : CLC : ADC.W #$0038 : STA.W Squeept.YVelocity,X
    RTL

  .nextJump:
    LDA.W Squeept.spawnXPosition,X : STA.W Enemy.XPosition,X
    LDA.W Squeept.spawnYPosition,X : STA.W Enemy.YPosition,X
    LDA.W #InstList_Squeept_Rising
    JSR SetSqueeptInstList
    LDA.W #Function_Squeept_Jump : STA.W Squeept.function,X
    LDA.W Enemy.properties,X : AND.W #$F7FF : STA.W Enemy.properties,X
    RTL


;;; $C012: Set squeept instruction list ;;;
SetSqueeptInstList:
;; Parameters:
;;     A: Instruction list pointer
    LDX.W EnemyIndex
    CMP.L Squeept.instList,X : BEQ .return
    STA.L Squeept.instList,X : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X

  .return:
    RTS


;;; $C02C: Spritemaps - squeept ;;;
Spritemap_Squeept_0:
    dw $0004
    %spritemapEntry(1, $1FF, $F3, 0, 1, 2, 0, $100)
    %spritemapEntry(1, $1FF, $03, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $1F0, $03, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F0, $F3, 0, 0, 2, 0, $100)

Spritemap_Squeept_1:
    dw $0004
    %spritemapEntry(0, $07, $03, 0, 1, 2, 0, $10C)
    %spritemapEntry(0, $1F0, $03, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1FF, $F3, 0, 1, 2, 0, $104)
    %spritemapEntry(1, $1F0, $F3, 0, 0, 2, 0, $104)

Spritemap_Squeept_2:
    dw $0002
    %spritemapEntry(1, $00, $F4, 0, 1, 2, 0, $106)
    %spritemapEntry(1, $1F0, $F4, 0, 0, 2, 0, $106)

Spritemap_Squeept_3:
    dw $0002
    %spritemapEntry(1, $00, $F8, 1, 1, 2, 0, $106)
    %spritemapEntry(1, $1F0, $F8, 1, 0, 2, 0, $106)

Spritemap_Squeept_4:
    dw $0004
    %spritemapEntry(0, $07, $EF, 1, 1, 2, 0, $10C)
    %spritemapEntry(0, $1F0, $EF, 1, 0, 2, 0, $10C)
    %spritemapEntry(1, $1FF, $F7, 1, 1, 2, 0, $104)
    %spritemapEntry(1, $1F0, $F7, 1, 0, 2, 0, $104)

Spritemap_Squeept_5:
    dw $0004
    %spritemapEntry(1, $1FF, $FC, 1, 1, 2, 0, $100)
    %spritemapEntry(1, $1FF, $EC, 1, 1, 2, 0, $102)
    %spritemapEntry(1, $1F0, $EC, 1, 0, 2, 0, $102)
    %spritemapEntry(1, $1F0, $FC, 1, 0, 2, 0, $100)

Spritemap_Squeept_6:
    dw $0003
    %spritemapEntry(1, $1FF, $FC, 0, 1, 2, 0, $10A)
    %spritemapEntry(1, $1F0, $FC, 0, 0, 2, 0, $10A)
    %spritemapEntry(1, $1F8, $EC, 0, 0, 2, 0, $108)

Spritemap_Squeept_7:
    dw $0002
    %spritemapEntry(0, $00, $04, 0, 1, 2, 0, $11C)
    %spritemapEntry(0, $1F9, $04, 0, 0, 2, 0, $11C)

Spritemap_Squeept_8:
    dw $0002
    %spritemapEntry(0, $1FC, $0C, 0, 0, 2, 0, $11D)
    %spritemapEntry(0, $1FC, $04, 0, 0, 2, 0, $10D)

Spritemap_Squeept_9:
    dw $0002
    %spritemapEntry(0, $1FC, $0C, 0, 0, 2, 0, $11E)
    %spritemapEntry(0, $1FC, $04, 0, 0, 2, 0, $10E)


;;; $C0D1: Palette - enemy $D2FF (geruta) ;;;
Palette_Geruta:
    dw $3800,$4E7F,$3975,$0C0A,$0006,$45D8,$2D33,$1C8E
    dw $102B,$5347,$5624,$5962,$5CA0,$1BBD,$0DFD,$009D


;;; $C0F1: Instruction list - main - idle ;;;
InstList_Geruta_Main_Idle:
    dw Instruction_Geruta_SetFlamesYOffset_8_duplicate
    dw $000D,Spritemap_Geruta_1
    dw $0012,Spritemap_Geruta_0
    dw $000D,Spritemap_Geruta_1
    dw $0012,Spritemap_Geruta_2
    dw Instruction_Common_GotoY
    dw InstList_Geruta_Main_Idle


;;; $C107: Instruction list - main - swoop - start descending ;;;
InstList_Geruta_Main_Swoop_StartDescending:
    dw Instruction_Geruta_SetFlamesYOffset_8
    dw $0001,Spritemap_Geruta_0
    dw Instruction_Geruta_SetFlamesYOffset_4
    dw $0001,Spritemap_Geruta_A
    dw Instruction_Geruta_SetFlamesYOffset_0
    dw $0001,Spritemap_Geruta_B
    dw Instruction_Geruta_SetFlamesYOffset_negative4
    dw $0001,Spritemap_Geruta_C
    dw Instruction_Geruta_SetFlamesYOffset_negativeC_duplicate
    dw $0001,Spritemap_Geruta_D
    dw Instruction_Geruta_SetFlamesYOffset_negative10
    dw $0001,Spritemap_Geruta_E
    dw Instruction_Geruta_SetFinishedSwoopStartAnimationFlag
    dw Instruction_Common_Sleep


;;; $C12F: Instruction list - main - swoop - descending ;;;
InstList_Geruta_Main_Swoop_Descending:
    dw Instruction_Geruta_SetFlamesYOffset_negativeC
    dw $0006,Spritemap_Geruta_7
    dw $0005,Spritemap_Geruta_8
    dw $0008,Spritemap_Geruta_9
    dw $0006,Spritemap_Geruta_8
    dw Instruction_Common_GotoY
    dw InstList_Geruta_Main_Swoop_Descending


;;; $C145: Instruction list - main - swoop - start ascending ;;;
InstList_Geruta_Main_Swoop_StartAscending:
    dw Instruction_Geruta_SetFlamesYOffset_negative10
    dw $0001,Spritemap_Geruta_E
    dw Instruction_Geruta_SetFlamesYOffset_negativeC_duplicate
    dw $0001,Spritemap_Geruta_D
    dw Instruction_Geruta_SetFlamesYOffset_negative4
    dw $0001,Spritemap_Geruta_C
    dw Instruction_Geruta_SetFlamesYOffset_0
    dw $0001,Spritemap_Geruta_B
    dw Instruction_Geruta_SetFlamesYOffset_4
    dw $0001,Spritemap_Geruta_A
    dw Instruction_Geruta_SetFlamesYOffset_8
    dw $0001,Spritemap_Geruta_0
    dw Instruction_Geruta_SetFlamesYOffset_8_duplicate
    dw $0001,Spritemap_Geruta_1
    dw Instruction_Geruta_SetFlamesYOffset_C
    dw $0001,Spritemap_Geruta_2
    dw Instruction_Geruta_SetFinishedSwoopStartAnimationFlag
    dw Instruction_Common_Sleep


;;; $C179: Instruction list - main - swoop - ascending ;;;
InstList_Geruta_Main_Swoop_Ascending:
    dw Instruction_Geruta_SetFlamesYOffset_C_duplicate
    dw $0006,Spritemap_Geruta_F
    dw $0005,Spritemap_Geruta_10
    dw $0008,Spritemap_Geruta_11
    dw $0006,Spritemap_Geruta_10
    dw Instruction_Common_GotoY
    dw InstList_Geruta_Main_Swoop_Ascending


;;; $C18F: Instruction list - flames - ascending ;;;
InstList_Geruta_Flames_Ascending:
    dw $0006,Spritemap_Geruta_4
    dw $0005,Spritemap_Geruta_5
    dw $0008,Spritemap_Geruta_6
    dw $0006,Spritemap_Geruta_5
    dw Instruction_Common_GotoY
    dw InstList_Geruta_Flames_Ascending


;;; $C1A3: Instruction list - flames - descending ;;;
InstList_Geruta_Flames_Descending:
    dw $0006,Spritemap_Geruta_12
    dw $0005,Spritemap_Geruta_13
    dw $0008,Spritemap_Geruta_14
    dw $0006,Spritemap_Geruta_13
    dw Instruction_Common_GotoY
    dw InstList_Geruta_Flames_Descending


;;; $C1B7: Geruta constants ;;;
UNSUED_GerutaConstants_A2C1B7:
    dw $0000,$000E,$000C,$000E,$0010

GerutaConstants:
  .swoopYSpeeds:
; Swoop Y speeds
    dw $0700,$05C0

  .swoopXSpeed:
; Swoop X speed
    dw $0100

if !FEATURE_KEEP_UNREFERENCED
UNUSED_GerutaConstants_maybeLeftoverSwoopXSpeed_A2C1C7:
; Unused. Probably leftover swoop X speed
    dw $0100
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $C1C9: Instruction - set enemy finished swoop start animation flag ;;;
Instruction_Geruta_SetFinishedSwoopStartAnimationFlag:
    LDX.W EnemyIndex
    LDA.W #$0001 : STA.L Geruta.finishedSwoopStartAnimationFlag,X
    RTL


;;; $C1D4: Instruction - flames Y offset = 8 ;;;
Instruction_Geruta_SetFlamesYOffset_8:
    LDX.W EnemyIndex
    LDA.W #$0008 : STA.L Geruta.flamesYOffset,X
    RTL


;;; $C1DF: Instruction - flames Y offset = 8 ;;;
Instruction_Geruta_SetFlamesYOffset_8_duplicate:
    LDX.W EnemyIndex
    LDA.W #$0008 : STA.L Geruta.flamesYOffset,X
    RTL


;;; $C1EA: Instruction - flames Y offset = Ch ;;;
Instruction_Geruta_SetFlamesYOffset_C:
    LDX.W EnemyIndex
    LDA.W #$000C : STA.L Geruta.flamesYOffset,X
    RTL


;;; $C1F5: Instruction - flames Y offset = -Ch ;;;
Instruction_Geruta_SetFlamesYOffset_negativeC:
    LDX.W EnemyIndex
    LDA.W #$FFF4 : STA.L Geruta.flamesYOffset,X
    RTL


;;; $C200: Instruction - flames Y offset = 4 ;;;
Instruction_Geruta_SetFlamesYOffset_4:
    LDX.W EnemyIndex
    LDA.W #$0004 : STA.L Geruta.flamesYOffset,X
    RTL


;;; $C20B: Instruction - flames Y offset = 0 ;;;
Instruction_Geruta_SetFlamesYOffset_0:
    LDX.W EnemyIndex
    LDA.W #$0000 : STA.L Geruta.flamesYOffset,X
    RTL


;;; $C216: Instruction - flames Y offset = -4 ;;;
Instruction_Geruta_SetFlamesYOffset_negative4:
    LDX.W EnemyIndex
    LDA.W #$FFFC : STA.L Geruta.flamesYOffset,X
    RTL


;;; $C221: Instruction - flames Y offset = -Ch ;;;
Instruction_Geruta_SetFlamesYOffset_negativeC_duplicate:
    LDX.W EnemyIndex
    LDA.W #$FFF4 : STA.L Geruta.flamesYOffset,X
    RTL


;;; $C22C: Instruction - flames Y offset = -10h ;;;
Instruction_Geruta_SetFlamesYOffset_negative10:
    LDX.W EnemyIndex
    LDA.W #$FFF0 : STA.L Geruta.flamesYOffset,X
    RTL


;;; $C237: Instruction - flames Y offset = Ch ;;;
Instruction_Geruta_SetFlamesYOffset_C_duplicate:
    LDX.W EnemyIndex
    LDA.W #$000C : STA.L Geruta.flamesYOffset,X
    RTL


;;; $C242: Initialisation AI - enemy $D2FF (geruta) ;;;
InitAI_Geruta:
    LDX.W EnemyIndex
    LDA.W #$0000 : STA.L Geruta.finishedSwoopStartAnimationFlag,X : STA.L Geruta.flamesYOffset,X
    LDA.W Geruta.part,X : BMI .flames
    LDA.W #InstList_Geruta_Main_Idle : STA.L Geruta.instList,X : STA.W Enemy.instList,X
    LDA.W #Function_Geruta_Idle : STA.W Geruta.function,X
    RTL

  .flames:
    LDA.W #InstList_Geruta_Flames_Ascending : STA.L Geruta.instList,X : STA.W Enemy.instList,X
    LDA.W #Function_Geruta_Flames : STA.W Geruta.function,X
    RTL


;;; $C277: Main AI - enemy $D2FF (geruta) ;;;
MainAI_Geruta:
    JSL GenerateRandomNumber
    LDX.W EnemyIndex
    JMP.W (Geruta.function,X)


;;; $C281: Geruta function - flames ;;;
Function_Geruta_Flames:
    LDA.W Enemy[-1].health,X : BNE .notDead
    LDA.W Enemy.properties,X : ORA.W #$0200 : STA.W Enemy.properties,X
    RTL

  .notDead:
    LDA.W Enemy[-1].freezeTimer,X : STA.W Enemy.freezeTimer,X : BEQ .notFrozen
    BRA .frozen

    RTL ; >_<

  .notFrozen:
    LDA.W Enemy.properties,X : AND.W #$FEFF : STA.W Enemy.properties,X
    LDA.L Geruta.instList-$40,X : CMP.W #InstList_Geruta_Main_Idle : BNE .swooping

  .frozen:
    LDA.W Enemy.properties,X : ORA.W #$0100 : STA.W Enemy.properties,X
    RTL

  .swooping:
    LDA.W #InstList_Geruta_Flames_Ascending : STA.B DP_Temp12
    LDA.L Geruta.flamesYOffset-$40,X : BPL +
    LDA.W #InstList_Geruta_Flames_Descending : STA.B DP_Temp12

+   LDA.B DP_Temp12
    JSR SetGerutaInstList
    LDA.W Enemy.properties,X : AND.W #$FEFF : STA.W Enemy.properties,X
    LDA.W Enemy[-1].XPosition,X : STA.W Enemy.XPosition,X
    LDA.W Enemy[-1].YPosition,X : CLC : ADC.L Geruta.flamesYOffset-$40,X : STA.W Enemy.YPosition,X
    RTL


;;; $C2E7: Geruta function - idle ;;;
Function_Geruta_Idle:
    LDA.W RandomNumberSeed : AND.W #$0101 : BEQ +
    LDA.W #$00C0
    JSL CheckIfXDistanceBetweenEnemyAndSamusIsAtLeastA
    BCC .swoop

+   LDA.L Geruta.finishedSwoopStartAnimationFlag,X : BEQ .return
    LDA.W #$0000 : STA.L Geruta.finishedSwoopStartAnimationFlag,X
    LDA.W #InstList_Geruta_Main_Idle
    JSR SetGerutaInstList

  .return:
    RTL

  .swoop:
    LDA.W RandomNumberSeed : LSR : AND.W #$0002 : TAY
    LDA.W GerutaConstants_swoopYSpeeds,Y : STA.W Geruta.YVelocity,X
    LDA.W GerutaConstants_swoopXSpeed : STA.W Geruta.XVelocity,X
    LDA.W SamusXPosition : CMP.W Enemy.XPosition,X : BPL .SamusToTheLeft
    LDA.W Geruta.XVelocity,X : EOR.W #$FFFF : INC : STA.W Geruta.XVelocity,X

  .SamusToTheLeft:
    LDA.W #InstList_Geruta_Main_Swoop_StartDescending
    JSR SetGerutaInstList
    LDA.W #Function_Geruta_StartSwoop : STA.W Geruta.function,X
    RTL


;;; $C33F: Geruta function - start swoop ;;;
Function_Geruta_StartSwoop:
    LDA.L Geruta.finishedSwoopStartAnimationFlag,X : BNE .finishedStartAnimation
    RTL

  .finishedStartAnimation:
    LDA.W #$0000 : STA.L Geruta.finishedSwoopStartAnimationFlag,X
    LDA.W #InstList_Geruta_Main_Swoop_Descending
    JSR SetGerutaInstList
    LDA.W #Function_Geruta_Swoop_Descending : STA.W Geruta.function,X
    LDA.W #$0065
    JSL QueueSound_Lib2_Max6
    RTL


;;; $C361: Geruta function - swoop - descending ;;;
Function_Geruta_Swoop_Descending:
    STZ.B DP_Temp12 : STZ.B DP_Temp14
    LDA.W Geruta.XVelocity,X : BPL +
    DEC.B DP_Temp14

+   STA.B DP_Temp13
    JSL MoveEnemyRightBy_14_12_IgnoreSlopes
    BCC .notCollidedWithWall
    LDA.W Geruta.XVelocity,X : EOR.W #$FFFF : INC : STA.W Geruta.XVelocity,X

  .notCollidedWithWall:
    STZ.B DP_Temp12 : STZ.B DP_Temp14
    LDA.W Geruta.YVelocity,X : BPL +
    DEC.B DP_Temp14

+   STA.B DP_Temp13
    JSL MoveEnemyDownBy_14_12
    BCS .collidedWithBlock
    LDA.W Geruta.YVelocity,X : SEC : SBC.W #$0020 : STA.W Geruta.YVelocity,X : BMI .collidedWithBlock
    RTL

  .collidedWithBlock:
    LDA.W #$FFFF : STA.W Geruta.YVelocity,X
    LDA.W #InstList_Geruta_Main_Swoop_StartAscending
    JSR SetGerutaInstList
    LDA.W #Function_Geruta_Swoop_Ascending : STA.W Geruta.function,X
    RTL


;;; $C3B1: Geruta function - swoop - ascending ;;;
Function_Geruta_Swoop_Ascending:
    STZ.B DP_Temp12 : STZ.B DP_Temp14
    LDA.W Geruta.XVelocity,X : BPL +
    DEC.B DP_Temp14

+   STA.B DP_Temp13
    JSL MoveEnemyRightBy_14_12_IgnoreSlopes
    BCC .notCollidedWithWall
    LDA.W Geruta.XVelocity,X : EOR.W #$FFFF : INC : STA.W Geruta.XVelocity,X

  .notCollidedWithWall:
    STZ.B DP_Temp12 : STZ.B DP_Temp14
    LDA.W Geruta.YVelocity,X : BPL +
    DEC.B DP_Temp14

+   STA.B DP_Temp13
    JSL MoveEnemyDownBy_14_12
    BCS .collidedVertically
    LDA.W Geruta.YVelocity,X : SEC : SBC.W #$0020 : STA.W Geruta.YVelocity,X
    LDA.L Geruta.finishedSwoopStartAnimationFlag,X : BEQ .return
    LDA.W #$0000 : STA.L Geruta.finishedSwoopStartAnimationFlag,X
    LDA.W #InstList_Geruta_Main_Swoop_Ascending
    JSR SetGerutaInstList

  .return:
    RTL

  .collidedVertically:
    LDA.W #Function_Geruta_FinishSwoop : STA.W Geruta.function,X
    RTL


;;; $C406: Geruta function - finish swoop ;;;
Function_Geruta_FinishSwoop:
    LDA.W #Function_Geruta_Idle : STA.W Geruta.function,X
    RTL


;;; $C40D: Set geruta instruction list ;;;
SetGerutaInstList:
;; Parameters:
;;     A: Instruction list pointer
    LDX.W EnemyIndex
    CMP.L Geruta.instList,X : BEQ .return
    STA.L Geruta.instList,X : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X

  .return:
    RTS


;;; $C427: Geruta spritemaps ;;;
Spritemap_Geruta_0:
    dw $0005
    %spritemapEntry(1, $1F8, $F6, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $1FE, $02, 0, 1, 2, 0, $10C)
    %spritemapEntry(1, $1F1, $02, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $06, $F5, 0, 1, 2, 0, $106)
    %spritemapEntry(1, $1E9, $F5, 0, 0, 2, 0, $106)

Spritemap_Geruta_1:
    dw $0005
    %spritemapEntry(1, $1F8, $F6, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1FE, $04, 0, 1, 2, 0, $10C)
    %spritemapEntry(1, $1F1, $04, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $06, $F6, 0, 1, 2, 0, $108)
    %spritemapEntry(1, $1E9, $F6, 0, 0, 2, 0, $108)

Spritemap_Geruta_2:
    dw $0005
    %spritemapEntry(1, $06, $F7, 0, 1, 2, 0, $10A)
    %spritemapEntry(1, $1E9, $F7, 0, 0, 2, 0, $10A)
    %spritemapEntry(1, $1FE, $06, 0, 1, 2, 0, $10C)
    %spritemapEntry(1, $1F1, $06, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1F8, $F6, 0, 0, 2, 0, $104)

Spritemap_Geruta_3:
    dw $0005
    %spritemapEntry(1, $1FE, $04, 0, 1, 2, 0, $10C)
    %spritemapEntry(1, $1F1, $04, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $06, $F6, 0, 1, 2, 0, $10A)
    %spritemapEntry(1, $1E9, $F6, 0, 0, 2, 0, $10A)
    %spritemapEntry(1, $1F8, $F6, 0, 0, 2, 0, $102)

Spritemap_Geruta_4:
    dw $0002
    %spritemapEntry(0, $02, $FC, 0, 0, 2, 0, $10E)
    %spritemapEntry(0, $1F6, $FC, 0, 0, 2, 0, $10E)

Spritemap_Geruta_5:
    dw $0002
    %spritemapEntry(0, $02, $FC, 0, 0, 2, 0, $10F)
    %spritemapEntry(0, $1F6, $FC, 0, 0, 2, 0, $10F)

Spritemap_Geruta_6:
    dw $0002
    %spritemapEntry(0, $02, $FC, 0, 0, 2, 0, $11E)
    %spritemapEntry(0, $1F6, $FC, 0, 0, 2, 0, $11E)

Spritemap_Geruta_7:
    dw $0005
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $1FE, $EA, 1, 1, 2, 0, $10C)
    %spritemapEntry(1, $1F1, $EA, 1, 0, 2, 0, $10C)
    %spritemapEntry(1, $06, $F8, 0, 1, 2, 0, $10A)
    %spritemapEntry(1, $1E9, $F8, 0, 0, 2, 0, $10A)

Spritemap_Geruta_8:
    dw $0005
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $1FE, $EA, 1, 1, 2, 0, $10C)
    %spritemapEntry(1, $1F1, $EA, 1, 0, 2, 0, $10C)
    %spritemapEntry(1, $06, $F8, 0, 1, 2, 0, $10A)
    %spritemapEntry(1, $1E9, $F8, 0, 0, 2, 0, $10A)

Spritemap_Geruta_9:
    dw $0005
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $1FE, $EA, 1, 1, 2, 0, $10C)
    %spritemapEntry(1, $1F1, $EA, 1, 0, 2, 0, $10C)
    %spritemapEntry(1, $06, $F8, 0, 1, 2, 0, $10A)
    %spritemapEntry(1, $1E9, $F8, 0, 0, 2, 0, $10A)

Spritemap_Geruta_A:
    dw $0005
    %spritemapEntry(1, $1F8, $F6, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $1FE, $FF, 0, 1, 2, 0, $10C)
    %spritemapEntry(1, $1F1, $FF, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $06, $F6, 0, 1, 2, 0, $106)
    %spritemapEntry(1, $1E9, $F6, 0, 0, 2, 0, $106)

Spritemap_Geruta_B:
    dw $0003
    %spritemapEntry(1, $05, $F7, 0, 1, 2, 0, $10A)
    %spritemapEntry(1, $1EA, $F7, 0, 0, 2, 0, $10A)
    %spritemapEntry(1, $1F8, $F6, 0, 0, 2, 0, $100)

Spritemap_Geruta_C:
    dw $0005
    %spritemapEntry(1, $1F8, $F6, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $05, $F8, 0, 1, 2, 0, $10A)
    %spritemapEntry(1, $1FE, $ED, 1, 1, 2, 0, $10C)
    %spritemapEntry(1, $1F1, $ED, 1, 0, 2, 0, $10C)
    %spritemapEntry(1, $1EA, $F8, 0, 0, 2, 0, $10A)

Spritemap_Geruta_D:
    dw $0005
    %spritemapEntry(1, $1F8, $F6, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $1FE, $EA, 1, 1, 2, 0, $10C)
    %spritemapEntry(1, $1F1, $EA, 1, 0, 2, 0, $10C)
    %spritemapEntry(1, $05, $F8, 0, 1, 2, 0, $10A)
    %spritemapEntry(1, $1EA, $F8, 0, 0, 2, 0, $10A)

Spritemap_Geruta_E:
    dw $0005
    %spritemapEntry(1, $1F8, $F6, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $1FE, $E8, 1, 1, 2, 0, $10C)
    %spritemapEntry(1, $1F1, $E8, 1, 0, 2, 0, $10C)
    %spritemapEntry(1, $05, $F8, 0, 1, 2, 0, $10A)
    %spritemapEntry(1, $1EA, $F8, 0, 0, 2, 0, $10A)

Spritemap_Geruta_F:
    dw $0005
    %spritemapEntry(1, $1FE, $06, 0, 1, 2, 0, $10C)
    %spritemapEntry(1, $1F1, $06, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $06, $F7, 0, 1, 2, 0, $108)
    %spritemapEntry(1, $1E9, $F7, 0, 0, 2, 0, $108)
    %spritemapEntry(1, $1F8, $F6, 0, 0, 2, 0, $104)

Spritemap_Geruta_10:
    dw $0005
    %spritemapEntry(1, $1FE, $06, 0, 1, 2, 0, $10C)
    %spritemapEntry(1, $1F1, $06, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $06, $F7, 0, 1, 2, 0, $108)
    %spritemapEntry(1, $1E9, $F7, 0, 0, 2, 0, $108)
    %spritemapEntry(1, $1F8, $F6, 0, 0, 2, 0, $104)

Spritemap_Geruta_11:
    dw $0005
    %spritemapEntry(1, $1FE, $06, 0, 1, 2, 0, $10C)
    %spritemapEntry(1, $1F1, $06, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $06, $F7, 0, 1, 2, 0, $108)
    %spritemapEntry(1, $1E9, $F7, 0, 0, 2, 0, $108)
    %spritemapEntry(1, $1F8, $F6, 0, 0, 2, 0, $104)

Spritemap_Geruta_12:
    dw $0002
    %spritemapEntry(0, $02, $FC, 1, 0, 2, 0, $10E)
    %spritemapEntry(0, $1F6, $FC, 1, 0, 2, 0, $10E)

Spritemap_Geruta_13:
    dw $0002
    %spritemapEntry(0, $02, $FC, 1, 0, 2, 0, $10F)
    %spritemapEntry(0, $1F6, $FC, 1, 0, 2, 0, $10F)

Spritemap_Geruta_14:
    dw $0002
    %spritemapEntry(0, $02, $FC, 1, 0, 2, 0, $11E)
    %spritemapEntry(0, $1F6, $FC, 1, 0, 2, 0, $11E)


;;; $C5FA: Palette - enemy $D33F (holtz) ;;;
Palette_Holtz:
    dw $3800,$72FA,$55B0,$2845,$1801,$6210,$496B,$38C6
    dw $2C63,$7D7F,$54D5,$384D,$2007,$021F,$1014,$080A


;;; $C61A: Instruction list - idle ;;;
InstList_Holtz_Idle_0:
    dw Instruction_Holtz_HideFlames

InstList_Holtz_Idle_1:
    dw $000B,Spritemap_Holtz_0
    dw $000B,Spritemap_Holtz_1
    dw $000B,Spritemap_Holtz_2
    dw $000B,Spritemap_Holtz_1
    dw Instruction_Common_GotoY
    dw InstList_Holtz_Idle_1


;;; $C630: Instruction list - prepare to swoop ;;;
InstList_Holtz_PrepareToSwoop:
    dw Instruction_Holtz_HideFlames
    dw $0003,Spritemap_Holtz_2
    dw $0003,Spritemap_Holtz_3
    dw $0003,Spritemap_Holtz_4
    dw $0003,Spritemap_Holtz_5
    dw $0002,Spritemap_Holtz_6
    dw $0001,Spritemap_Holtz_7
    dw $0002,Spritemap_Holtz_8
    dw $0003,Spritemap_Holtz_9
    dw $0003,Spritemap_Holtz_A
    dw Instruction_Holtz_SetAnimationFinishedFlag
    dw Instruction_Common_Sleep


;;; $C65A: Instruction list - swoop - descending ;;;
InstList_Holtz_Swoop_Descending:
    dw Instruction_Holtz_HideFlames
    dw $0001,Spritemap_Holtz_A
    dw Instruction_Common_Sleep


;;; $C662: Instruction list - swoop - ascending - part 1 ;;;
InstList_Holtz_Swoop_Ascending_Part1:
    dw Instruction_Holtz_HideFlames
    dw $0003,Spritemap_Holtz_A
    dw $0003,Spritemap_Holtz_9
    dw $0003,Spritemap_Holtz_B
    dw Instruction_Holtz_SetAnimationFinishedFlag
    dw Instruction_Common_Sleep


;;; $C674: Instruction list - swoop - ascending - part 2 ;;;
InstList_Holtz_Swoop_Part2_0:
    dw Instruction_Holtz_ShowFlames

InstList_Holtz_Swoop_Part2_1:
    dw $0002,Spritemap_Holtz_E
    dw $0002,Spritemap_Holtz_C
    dw $0002,Spritemap_Holtz_D
    dw Instruction_Common_GotoY
    dw InstList_Holtz_Swoop_Part2_1


;;; $C686: Instruction list - swoop cooldown ;;;
InstList_Holtz_SwoopCooldown:
    dw Instruction_Holtz_ShowFlames
    dw $0003,Spritemap_Holtz_B
    dw $0003,Spritemap_Holtz_9
    dw $0002,Spritemap_Holtz_8
    dw $0001,Spritemap_Holtz_7
    dw $0002,Spritemap_Holtz_6
    dw $0003,Spritemap_Holtz_5
    dw $0001,Spritemap_Holtz_4
    dw $0001,Spritemap_Holtz_3
    dw $0001,Spritemap_Holtz_2
    dw Instruction_Holtz_SetAnimationFinishedFlag
    dw Instruction_Common_Sleep


;;; $C6B0: Instruction list - flames ;;;
InstList_Holtz_Flames:
    dw $0006,Spritemap_Holtz_F
    dw $0004,Spritemap_Holtz_10
    dw $0003,Spritemap_Holtz_11
    dw Instruction_Common_GotoY
    dw InstList_Holtz_Flames


;;; $C6C0: Holtz constants ;;;
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


;;; $C6D2: Instruction - set animation finished flag ;;;
Instruction_Holtz_SetAnimationFinishedFlag:
    LDX.W EnemyIndex
    LDA.W #$0001 : STA.L Holtz.animationFinishedFlag,X
    RTL


;;; $C6DD: Instruction - hide flames ;;;
Instruction_Holtz_HideFlames:
    LDX.W EnemyIndex
    LDA.W #$0000 : STA.L Holtz.flamesVisibleFlag,X
    RTL


;;; $C6E8: Instruction - show flames ;;;
Instruction_Holtz_ShowFlames:
    LDX.W EnemyIndex
    LDA.W #$0001 : STA.L Holtz.flamesVisibleFlag,X
    RTL


;;; $C6F3: Initialisation AI - enemy $D33F (holtz) ;;;
InitAI_Holtz:
    LDX.W EnemyIndex
    LDA.W #$0000 : STA.L Holtz.animationFinishedFlag,X
    LDA.W Enemy.init0,X : BPL .idle
    LDA.W #Function_Holtz_Flames : STA.W Holtz.function,X
    LDA.W #InstList_Holtz_Flames : STA.L Holtz.instList,X : STA.W Enemy.instList,X
    RTL

  .idle:
    LDA.W #Function_Holtz_Idle : STA.W Holtz.function,X
    LDA.W #InstList_Holtz_Idle_0 : STA.L Holtz.instList,X : STA.W Enemy.instList,X
    RTL


;;; $C724: Main AI - enemy $D33F (holtz) ;;;
MainAI_Holtz:
    JSL GenerateRandomNumber
    LDX.W EnemyIndex
    JMP.W (Holtz.function,X)


;;; $C72E: Holtz function - flames ;;;
Function_Holtz_Flames:
    LDA.W Enemy[-1].health,X : BNE .notDead
    LDA.W Enemy.properties,X : ORA.W #$0200 : STA.W Enemy.properties,X
    RTL

  .notDead:
    LDA.W Enemy[-1].freezeTimer,X : STA.W Enemy.freezeTimer,X : BEQ .frozen
    BRA .invisible

  .frozen:
    LDA.L Holtz.flamesVisibleFlag-$40,X : BNE .visible

  .invisible:
    LDA.W Enemy.properties,X : ORA.W #$0100 : STA.W Enemy.properties,X
    RTL

  .visible:
    LDA.W Enemy.properties,X : AND.W #$FEFF : STA.W Enemy.properties,X
    LDA.W Enemy[-1].XPosition,X : STA.W Enemy.XPosition,X
    LDA.W Enemy[-1].YPosition,X : CLC : ADC.W #$000C : STA.W Enemy.YPosition,X
    RTL


;;; $C771: Holtz function - idle ;;;
Function_Holtz_Idle:
    LDA.W RandomNumberSeed : AND.W #$0101 : BEQ .quarterChancestayIdle
    LDA.W #$0070
    JSL CheckIfXDistanceBetweenEnemyAndSamusIsAtLeastA
    BCC .triggered

  .quarterChancestayIdle:
    LDA.W #$0000 : STA.L Holtz.animationFinishedFlag,X
    LDA.W #InstList_Holtz_Idle_0
    JSR SetHoltzInstList
    RTL

  .triggered:
    LDA.W HoltzConstants_initialYVelocity : STA.W Holtz.YVelocity,X
    LDA.W HoltzConstants_XSpeed : STA.W Holtz.XVelocity,X
    LDA.W SamusXPosition : CMP.W Enemy.XPosition,X : BPL +
    LDA.W Holtz.XVelocity,X : EOR.W #$FFFF : INC : STA.W Holtz.XVelocity,X

+   LDA.W #InstList_Holtz_PrepareToSwoop
    JSR SetHoltzInstList
    LDA.W #Function_Holtz_PrepareToSwoop : STA.W Holtz.function,X
    RTL


;;; $C7BB: Holtz function - prepare to swoop ;;;
Function_Holtz_PrepareToSwoop:
    LDA.L Holtz.animationFinishedFlag,X : BNE .animationFinished
    RTL

  .animationFinished:
    LDA.W #$0000 : STA.L Holtz.animationFinishedFlag,X
    LDA.W #InstList_Holtz_Swoop_Descending
    JSR SetHoltzInstList
    LDA.W #Function_Holtz_Swoop_Descending : STA.W Holtz.function,X
    RTL


;;; $C7D6: Holtz function - swoop - descending ;;;
Function_Holtz_Swoop_Descending:
    STZ.B DP_Temp12 : STZ.B DP_Temp14
    LDA.W Holtz.XVelocity,X : BPL +
    DEC.B DP_Temp14

+   STA.B DP_Temp13
    JSL MoveEnemyRightBy_14_12_IgnoreSlopes
    BCC .notCollidedWithWall
    LDA.W Holtz.XVelocity,X : EOR.W #$FFFF : INC : STA.W Holtz.XVelocity,X

  .notCollidedWithWall:
    STZ.B DP_Temp12 : STZ.B DP_Temp14
    LDA.W Holtz.YVelocity,X : BPL +
    DEC.B DP_Temp14

+   STA.B DP_Temp13
    JSL MoveEnemyDownBy_14_12
    BCS .notCollidedWithBlock
    LDA.W Holtz.YVelocity,X : SEC : SBC.W #$0020 : STA.W Holtz.YVelocity,X : BMI .notCollidedWithBlock
    RTL

  .notCollidedWithBlock:
    LDA.W #$FFFF : STA.W Holtz.YVelocity,X
    LDA.W #InstList_Holtz_Swoop_Ascending_Part1
    JSR SetHoltzInstList
    LDA.W #Function_Holtz_Swoop_Ascending : STA.W Holtz.function,X
    LDA.W #$0064
    JSL QueueSound_Lib2_Max6
    RTL


;;; $C82D: Holtz function - swoop - ascending ;;;
Function_Holtz_Swoop_Ascending:
    STZ.B DP_Temp12 : STZ.B DP_Temp14
    LDA.W Holtz.XVelocity,X : BPL +
    DEC.B DP_Temp14

+   STA.B DP_Temp13
    JSL MoveEnemyRightBy_14_12_IgnoreSlopes
    BCC .notCollidedWithWall
    LDA.W Holtz.XVelocity,X : EOR.W #$FFFF : INC : STA.W Holtz.XVelocity,X

  .notCollidedWithWall:
    STZ.B DP_Temp12 : STZ.B DP_Temp14
    LDA.W Holtz.YVelocity,X : BPL +
    DEC.B DP_Temp14

+   STA.B DP_Temp13
    JSL MoveEnemyDownBy_14_12
    BCS .collidedVertically
    LDA.W Holtz.YVelocity,X : SEC : SBC.W #$0020 : STA.W Holtz.YVelocity,X
    LDA.L Holtz.animationFinishedFlag,X : BEQ .return
    LDA.W #$0000 : STA.L Holtz.animationFinishedFlag,X
    LDA.W #InstList_Holtz_Swoop_Part2_0
    JSR SetHoltzInstList

  .return:
    RTL

  .collidedVertically:
    LDA.W #InstList_Holtz_SwoopCooldown
    JSR SetHoltzInstList
    LDA.W #Function_Holtz_SwoopCooldown : STA.W Holtz.function,X
    RTL


;;; $C888: Holtz function - swoop cooldown ;;;
Function_Holtz_SwoopCooldown:
    LDA.L Holtz.animationFinishedFlag,X : BNE .animationFinished
    RTL

  .animationFinished:
    LDA.W #$0000 : STA.L Holtz.animationFinishedFlag,X
    LDA.W #InstList_Holtz_SwoopCooldown
    JSR SetHoltzInstList
    LDA.W #Function_Holtz_Idle : STA.W Holtz.function,X
    RTL


;;; $C8A3: Set holtz instruction list ;;;
SetHoltzInstList:
;; Parameters:
;;     A: Instruction list pointer
    LDX.W EnemyIndex
    CMP.L Holtz.instList,X : BEQ .return
    STA.L Holtz.instList,X : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X

  .return:
    RTS


;;; $C8BD: Holtz spritemaps ;;;
Spritemap_Holtz_0:
    dw $0004
    %spritemapEntry(1, $1F8, $04, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $08, $F4, 0, 1, 2, 0, $100)
    %spritemapEntry(1, $1F8, $F4, 0, 0, 2, 0, $10A)
    %spritemapEntry(1, $1E8, $F4, 0, 0, 2, 0, $100)

Spritemap_Holtz_1:
    dw $0004
    %spritemapEntry(1, $08, $F5, 0, 1, 2, 0, $100)
    %spritemapEntry(1, $1E8, $F5, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $1F8, $F5, 0, 0, 2, 0, $10A)
    %spritemapEntry(1, $1F8, $05, 0, 0, 2, 0, $128)

Spritemap_Holtz_2:
    dw $0004
    %spritemapEntry(1, $1F8, $06, 0, 0, 2, 0, $128)
    %spritemapEntry(1, $08, $F6, 0, 1, 2, 0, $100)
    %spritemapEntry(1, $1F8, $F6, 0, 0, 2, 0, $10A)
    %spritemapEntry(1, $1E8, $F6, 0, 0, 2, 0, $100)

Spritemap_Holtz_3:
    dw $0004
    %spritemapEntry(1, $1F8, $06, 0, 0, 2, 0, $128)
    %spritemapEntry(1, $1F8, $F6, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $08, $F6, 0, 1, 2, 0, $100)
    %spritemapEntry(1, $1E8, $F6, 0, 0, 2, 0, $100)

Spritemap_Holtz_4:
    dw $0004
    %spritemapEntry(1, $1F8, $06, 0, 0, 2, 0, $128)
    %spritemapEntry(1, $1F8, $F6, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $08, $F6, 0, 1, 2, 0, $100)
    %spritemapEntry(1, $1E8, $F6, 0, 0, 2, 0, $100)

Spritemap_Holtz_5:
    dw $0004
    %spritemapEntry(1, $1F8, $06, 0, 0, 2, 0, $128)
    %spritemapEntry(1, $1F8, $F6, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $08, $F6, 0, 1, 2, 0, $100)
    %spritemapEntry(1, $1E8, $F6, 0, 0, 2, 0, $100)

Spritemap_Holtz_6:
    dw $0004
    %spritemapEntry(1, $1F8, $06, 0, 0, 2, 0, $128)
    %spritemapEntry(1, $08, $F6, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $1E8, $F6, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F8, $F6, 0, 0, 2, 0, $120)

Spritemap_Holtz_7:
    dw $0004
    %spritemapEntry(1, $1F8, $06, 0, 0, 2, 0, $128)
    %spritemapEntry(1, $08, $F6, 0, 1, 2, 0, $104)
    %spritemapEntry(1, $1E8, $F6, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $1F8, $F6, 0, 0, 2, 0, $120)

Spritemap_Holtz_8:
    dw $0004
    %spritemapEntry(1, $1F8, $06, 0, 0, 2, 0, $128)
    %spritemapEntry(1, $08, $F6, 0, 1, 2, 0, $106)
    %spritemapEntry(1, $1E8, $F6, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $1F8, $F6, 0, 0, 2, 0, $120)

Spritemap_Holtz_9:
    dw $0004
    %spritemapEntry(1, $1F8, $06, 0, 0, 2, 0, $128)
    %spritemapEntry(1, $08, $F6, 0, 1, 2, 0, $108)
    %spritemapEntry(1, $1E8, $F6, 0, 0, 2, 0, $108)
    %spritemapEntry(1, $1F8, $F6, 0, 0, 2, 0, $120)

Spritemap_Holtz_A:
    dw $0004
    %spritemapEntry(1, $1F8, $06, 0, 0, 2, 0, $128)
    %spritemapEntry(1, $08, $F6, 0, 1, 2, 0, $108)
    %spritemapEntry(1, $1E8, $F6, 0, 0, 2, 0, $108)
    %spritemapEntry(1, $1F8, $F6, 0, 0, 2, 0, $124)

Spritemap_Holtz_B:
    dw $0004
    %spritemapEntry(1, $1F8, $06, 0, 0, 2, 0, $128)
    %spritemapEntry(1, $08, $F6, 0, 1, 2, 0, $108)
    %spritemapEntry(1, $1E8, $F6, 0, 0, 2, 0, $108)
    %spritemapEntry(1, $1F8, $F6, 0, 0, 2, 0, $122)

Spritemap_Holtz_C:
    dw $0004
    %spritemapEntry(1, $1F8, $06, 0, 0, 2, 0, $128)
    %spritemapEntry(1, $08, $F6, 0, 1, 2, 0, $108)
    %spritemapEntry(1, $1E8, $F6, 0, 0, 2, 0, $108)
    %spritemapEntry(1, $1F8, $F6, 0, 0, 2, 0, $122)

Spritemap_Holtz_D:
    dw $0004
    %spritemapEntry(1, $1F8, $06, 0, 0, 2, 0, $128)
    %spritemapEntry(1, $08, $F6, 0, 1, 2, 0, $108)
    %spritemapEntry(1, $1E8, $F6, 0, 0, 2, 0, $108)
    %spritemapEntry(1, $1F8, $F6, 0, 0, 2, 0, $122)

Spritemap_Holtz_E:
    dw $0004
    %spritemapEntry(1, $1F8, $06, 0, 0, 2, 0, $128)
    %spritemapEntry(1, $08, $F6, 0, 1, 2, 0, $108)
    %spritemapEntry(1, $1E8, $F6, 0, 0, 2, 0, $108)
    %spritemapEntry(1, $1F8, $F6, 0, 0, 2, 0, $122)

Spritemap_Holtz_F:
    dw $0002
    %spritemapEntry(0, $04, $FC, 0, 1, 2, 0, $12A)
    %spritemapEntry(0, $1F4, $FC, 0, 0, 2, 0, $12A)

Spritemap_Holtz_10:
    dw $0002
    %spritemapEntry(0, $04, $FC, 0, 1, 2, 0, $12B)
    %spritemapEntry(0, $1F4, $FC, 0, 0, 2, 0, $12B)

Spritemap_Holtz_11:
    dw $0002
    %spritemapEntry(0, $04, $FC, 0, 1, 2, 0, $12C)
    %spritemapEntry(0, $1F4, $FC, 0, 0, 2, 0, $12C)


;;; $CA2B: Palette - enemy $D37F (oum) ;;;
Palette_Oum:
    dw $3800,$3F57,$2E4D,$00E2,$0060,$3AB0,$220B,$1166
    dw $0924,$21B9,$1533,$0CCE,$0448,$03E0,$02A0,$0140


;;; $CA4B: Instruction list - facing left - idle ;;;
InstList_Oum_FacingLeft_Idle:
    dw $0001,ExtendedSpritemap_Oum_FacingLeft_0
    dw Instruction_Common_Sleep


;;; $CA51: Instruction list - facing left - attacking ;;;
InstList_Oum_FacingLeft_Attacking:
    dw $0010,ExtendedSpritemap_Oum_FacingLeft_0
    dw $0010,ExtendedSpritemap_Oum_FacingLeft_1
    dw Instruction_Oum_PlaySplashedOutOfWaterSFX
    dw $0010,ExtendedSpritemap_Oum_FacingLeft_2
    dw $0002,ExtendedSpritemap_Oum_FacingLeft_3
    dw $0003,ExtendedSpritemap_Oum_FacingLeft_4
    dw $0004,ExtendedSpritemap_Oum_FacingLeft_5
    dw $0002,ExtendedSpritemap_Oum_FacingLeft_6
    dw $0003,ExtendedSpritemap_Oum_FacingLeft_7
    dw $0001,ExtendedSpritemap_Oum_FacingLeft_6
    dw $0003,ExtendedSpritemap_Oum_FacingLeft_5
    dw $0002,ExtendedSpritemap_Oum_FacingLeft_4
    dw $0001,ExtendedSpritemap_Oum_FacingLeft_3
    dw $0012,ExtendedSpritemap_Oum_FacingLeft_2
    dw Instruction_Oum_SetAnimationFinishedFlag
    dw Instruction_Common_Sleep


;;; $CA8B: Instruction list - facing left - rolling forwards ;;;
InstList_Oum_FacingLeft_RollingForwards:
    dw $0007,ExtendedSpritemap_Oum_FacingLeft_2
    dw Instruction_Oum_SetAttackAllowingRotationFlag
    dw $0007,ExtendedSpritemap_Oum_FacingLeft_8
    dw Instruction_Oum_ResetAttackAllowingRotationFlag
    dw $0007,ExtendedSpritemap_Oum_FacingLeft_9
    dw $0007,ExtendedSpritemap_Oum_FacingLeft_A
    dw $0007,ExtendedSpritemap_Oum_FacingLeft_B
    dw $0007,ExtendedSpritemap_Oum_FacingLeft_C
    dw $0007,ExtendedSpritemap_Oum_FacingLeft_D
    dw $0007,ExtendedSpritemap_Oum_FacingLeft_E
    dw Instruction_Common_GotoY
    dw InstList_Oum_FacingLeft_RollingForwards


;;; $CAB3: Instruction list - facing left - rolling backwards ;;;
InstList_Oum_FacingLeft_RollingBackwards:
    dw $0007,ExtendedSpritemap_Oum_FacingLeft_E
    dw $0007,ExtendedSpritemap_Oum_FacingLeft_D
    dw $0007,ExtendedSpritemap_Oum_FacingLeft_C
    dw $0007,ExtendedSpritemap_Oum_FacingLeft_B
    dw $0007,ExtendedSpritemap_Oum_FacingLeft_A
    dw $0007,ExtendedSpritemap_Oum_FacingLeft_9
    dw $0007,ExtendedSpritemap_Oum_FacingLeft_8
    dw Instruction_Oum_SetAttackAllowingRotationFlag
    dw $0007,ExtendedSpritemap_Oum_FacingLeft_2
    dw Instruction_Oum_ResetAttackAllowingRotationFlag
    dw Instruction_Common_GotoY
    dw InstList_Oum_FacingLeft_RollingBackwards


;;; $CADB: Instruction list - facing right - idle ;;;
InstList_Oum_FacingRight_Idle:
    dw $0001,ExtendedSpritemap_Oum_FacingRight_0
    dw Instruction_Common_Sleep


;;; $CAE1: Instruction list - facing right - attacking ;;;
InstList_Oum_FacingRight_Attacking:
    dw $0010,ExtendedSpritemap_Oum_FacingRight_0
    dw $0010,ExtendedSpritemap_Oum_FacingRight_1
    dw $0010,ExtendedSpritemap_Oum_FacingRight_2
    dw Instruction_Oum_PlaySplashedOutOfWaterSFX
    dw $0002,ExtendedSpritemap_Oum_FacingRight_3
    dw $0003,ExtendedSpritemap_Oum_FacingRight_4
    dw $0004,ExtendedSpritemap_Oum_FacingRight_5
    dw $0002,ExtendedSpritemap_Oum_FacingRight_6
    dw $0003,ExtendedSpritemap_Oum_FacingRight_7
    dw $0001,ExtendedSpritemap_Oum_FacingRight_6
    dw $0003,ExtendedSpritemap_Oum_FacingRight_5
    dw $0002,ExtendedSpritemap_Oum_FacingRight_4
    dw $0001,ExtendedSpritemap_Oum_FacingRight_3
    dw $0012,ExtendedSpritemap_Oum_FacingRight_2
    dw Instruction_Oum_SetAnimationFinishedFlag
    dw Instruction_Common_Sleep


;;; $CB1B: Instruction list - facing right - rolling forwards ;;;
InstList_Oum_FacingRight_RollingForwards:
    dw $0007,ExtendedSpritemap_Oum_FacingRight_2
    dw Instruction_Oum_SetAttackAllowingRotationFlag
    dw $0007,ExtendedSpritemap_Oum_FacingRight_8
    dw Instruction_Oum_ResetAttackAllowingRotationFlag
    dw $0007,ExtendedSpritemap_Oum_FacingRight_9
    dw $0007,ExtendedSpritemap_Oum_FacingRight_A
    dw $0007,ExtendedSpritemap_Oum_FacingRight_B
    dw $0007,ExtendedSpritemap_Oum_FacingRight_C
    dw $0007,ExtendedSpritemap_Oum_FacingRight_D
    dw $0007,ExtendedSpritemap_Oum_FacingRight_E
    dw Instruction_Common_GotoY
    dw InstList_Oum_FacingRight_RollingForwards


;;; $CB43: Instruction list - facing right - rolling backwards ;;;
InstList_Oum_FacingRight_RollingBackwards:
    dw $0007,ExtendedSpritemap_Oum_FacingRight_E
    dw $0007,ExtendedSpritemap_Oum_FacingRight_D
    dw $0007,ExtendedSpritemap_Oum_FacingRight_C
    dw $0007,ExtendedSpritemap_Oum_FacingRight_B
    dw $0007,ExtendedSpritemap_Oum_FacingRight_A
    dw $0007,ExtendedSpritemap_Oum_FacingRight_9
    dw $0007,ExtendedSpritemap_Oum_FacingRight_8
    dw Instruction_Oum_SetAttackAllowingRotationFlag
    dw $0007,ExtendedSpritemap_Oum_FacingRight_2
    dw Instruction_Oum_ResetAttackAllowingRotationFlag
    dw Instruction_Common_GotoY
    dw InstList_Oum_FacingRight_RollingBackwards


;;; $CB6B: Instruction - queue splashed out of water sound effect ;;;
Instruction_Oum_PlaySplashedOutOfWaterSFX:
    PHX : PHY
    LDA.W #$000E
    JSL QueueSound_Lib2_Max6
    PLY : PLX
    RTL


;;; $CB77: Instruction list pointers ;;;
InstListPointers_Oum:
; Indexed by [enemy $7E:7802] * 2
    dw InstList_Oum_FacingRight_Idle
    dw InstList_Oum_FacingLeft_Idle
    dw InstList_Oum_FacingRight_RollingForwards
    dw InstList_Oum_FacingLeft_RollingForwards
    dw InstList_Oum_FacingRight_Attacking
    dw InstList_Oum_FacingLeft_Attacking
    dw InstList_Oum_FacingRight_RollingBackwards
    dw InstList_Oum_FacingLeft_RollingBackwards


;;; $CB87: Oum extended spritemaps ;;;
ExtendedSpritemap_Oum_FacingLeft_0:
    dw $0001
    dw $0000,$0000
    dw Spritemap_Oum_FacingLeft_0
    dw Hitbox_Oum_FacingLeft_0

ExtendedSpritemap_Oum_FacingLeft_1:
    dw $0001
    dw $0000,$0000
    dw Spritemap_Oum_FacingLeft_1
    dw Hitbox_Oum_FacingLeft_1

ExtendedSpritemap_Oum_FacingLeft_2:
    dw $0001
    dw $0000,$0000
    dw Spritemap_Oum_FacingLeft_2
    dw Hitbox_Oum_FacingLeft_2

ExtendedSpritemap_Oum_FacingLeft_3:
    dw $0001
    dw $0000,$0000
    dw Spritemap_Oum_3
    dw Hitbox_Oum_FacingLeft_3

ExtendedSpritemap_Oum_FacingLeft_4:
    dw $0001
    dw $0000,$0000
    dw Spritemap_Oum_FacingLeft_4
    dw Hitbox_Oum_FacingLeft_4

ExtendedSpritemap_Oum_FacingLeft_5:
    dw $0001
    dw $0000,$0000
    dw Spritemap_Oum_FacingLeft_5
    dw Hitbox_Oum_FacingLeft_5

ExtendedSpritemap_Oum_FacingLeft_6:
    dw $0001
    dw $0000,$0000
    dw Spritemap_Oum_FacingLeft_6
    dw Hitbox_Oum_FacingLeft_6

ExtendedSpritemap_Oum_FacingLeft_7:
    dw $0001
    dw $0000,$0000
    dw Spritemap_Oum_FacingLeft_7
    dw Hitbox_Oum_FacingLeft_7

ExtendedSpritemap_Oum_FacingLeft_8:
    dw $0001
    dw $0000,$0000
    dw Spritemap_Oum_FacingLeft_8
    dw Hitbox_Oum_FacingLeft_8

ExtendedSpritemap_Oum_FacingLeft_9:
    dw $0001
    dw $0000,$0000
    dw Spritemap_Oum_FacingLeft_9
    dw Hitbox_Oum_FacingLeft_9

ExtendedSpritemap_Oum_FacingLeft_A:
    dw $0001
    dw $0000,$0000
    dw Spritemap_Oum_FacingLeft_A
    dw Hitbox_Oum_FacingLeft_A

ExtendedSpritemap_Oum_FacingLeft_B:
    dw $0001
    dw $0000,$0000
    dw Spritemap_Oum_FacingLeft_B
    dw Hitbox_Oum_FacingLeft_B

ExtendedSpritemap_Oum_FacingLeft_C:
    dw $0001
    dw $0000,$0000
    dw Spritemap_Oum_FacingLeft_C
    dw Hitbox_Oum_FacingLeft_C

ExtendedSpritemap_Oum_FacingLeft_D:
    dw $0001
    dw $0000,$0000
    dw Spritemap_Oum_FacingLeft_D
    dw Hitbox_Oum_FacingLeft_D

ExtendedSpritemap_Oum_FacingLeft_E:
    dw $0001
    dw $0000,$0000
    dw Spritemap_Oum_FacingLeft_E
    dw Hitbox_Oum_FacingLeft_E

ExtendedSpritemap_Oum_FacingRight_0:
    dw $0001
    dw $0000,$0000
    dw Spritemap_Oum_FacingRight_0
    dw Hitbox_Oum_FacingRight_0

ExtendedSpritemap_Oum_FacingRight_1:
    dw $0001
    dw $0000,$0000
    dw Spritemap_Oum_FacingRight_1
    dw Hitbox_Oum_FacingRight_1

ExtendedSpritemap_Oum_FacingRight_2:
    dw $0001
    dw $0000,$0000
    dw Spritemap_Oum_FacingRight_2
    dw Hitbox_Oum_FacingRight_2

ExtendedSpritemap_Oum_FacingRight_3:
    dw $0001
    dw $0000,$0000
    dw Spritemap_Oum_FacingRight_3
    dw Hitbox_Oum_FacingRight_3

ExtendedSpritemap_Oum_FacingRight_4:
    dw $0001
    dw $0000,$0000
    dw Spritemap_Oum_FacingRight_4
    dw Hitbox_Oum_FacingRight_4

ExtendedSpritemap_Oum_FacingRight_5:
    dw $0001
    dw $0000,$0000
    dw Spritemap_Oum_FacingRight_5
    dw Hitbox_Oum_FacingRight_5

ExtendedSpritemap_Oum_FacingRight_6:
    dw $0001
    dw $0000,$0000
    dw Spritemap_Oum_FacingRight_6
    dw Hitbox_Oum_FacingRight_6

ExtendedSpritemap_Oum_FacingRight_7:
    dw $0001
    dw $0000,$0000
    dw Spritemap_Oum_FacingRight_7
    dw Hitbox_Oum_FacingRight_7

ExtendedSpritemap_Oum_FacingRight_8:
    dw $0001
    dw $0000,$0000
    dw Spritemap_Oum_FacingRight_8
    dw Hitbox_Oum_FacingRight_8

ExtendedSpritemap_Oum_FacingRight_9:
    dw $0001
    dw $0000,$0000
    dw Spritemap_Oum_FacingRight_9
    dw Hitbox_Oum_FacingRight_9

ExtendedSpritemap_Oum_FacingRight_A:
    dw $0001
    dw $0000,$0000
    dw Spritemap_Oum_FacingRight_A
    dw Hitbox_Oum_FacingRight_A

ExtendedSpritemap_Oum_FacingRight_B:
    dw $0001
    dw $0000,$0000
    dw Spritemap_Oum_FacingRight_B
    dw Hitbox_Oum_FacingRight_B

ExtendedSpritemap_Oum_FacingRight_C:
    dw $0001
    dw $0000,$0000
    dw Spritemap_Oum_FacingRight_C
    dw Hitbox_Oum_FacingRight_C

ExtendedSpritemap_Oum_FacingRight_D:
    dw $0001
    dw $0000,$0000
    dw Spritemap_Oum_FacingRight_D
    dw Hitbox_Oum_FacingRight_D

ExtendedSpritemap_Oum_FacingRight_E:
    dw $0001
    dw $0000,$0000
    dw Spritemap_Oum_FacingRight_E
    dw Hitbox_Oum_FacingRight_E


;;; $CCB3: Instruction - set animation finished flag ;;;
Instruction_Oum_SetAnimationFinishedFlag:
    LDX.W EnemyIndex
    LDA.W #$0001 : STA.L Oum.animationFinishedFlag,X
    RTL


;;; $CCBE: Instruction - enemy attack allowing rotation flag = 1 ;;;
Instruction_Oum_SetAttackAllowingRotationFlag:
    LDX.W EnemyIndex
    LDA.W #$0001 : STA.L Oum.attackAllowingRotationFlag,X
    RTL


;;; $CCC9: Instruction - enemy attack allowing rotation flag = 0 ;;;
Instruction_Oum_ResetAttackAllowingRotationFlag:
    LDX.W EnemyIndex
    LDA.W #$0000 : STA.L Oum.attackAllowingRotationFlag,X
    RTL


;;; $CCD4: Initialisation AI - enemy $D37F (oum) ;;;
InitAI_Oum:
    LDX.W EnemyIndex
    LDA.W #$0000 : STA.W Oum.YSpeedTableIndex,X
    STA.W Oum.movementDirection,X : STA.L Oum.newInstListIndex,X
    STA.L Oum.instListIndex,X : STA.L Oum.animationFinishedFlag,X
    STA.L Oum.attackAllowingRotationFlag,X : STA.L ExtraEnemy7800+$14,X
    LDA.W #$0003 : STA.W Oum.bounceCounter,X
    LDA.W #$0080 : STA.W Oum.timeUntilAttackIsAllowed,X
    LDA.W #InstList_Oum_FacingLeft_Idle : STA.W Enemy.instList,X
    LDA.W #Function_Oum_Idle : STA.W Oum.function,X
    LDA.W #Function_Oum_Falling : STA.W Oum.bounceFunction,X
    RTL


;;; $CD13: Main AI - enemy $D37F (oum) ;;;
MainAI_Oum:
    LDX.W EnemyIndex
    JSR CheckIfTouchingSamus_UpdatePreviousPositions
    JSR.W (Oum.function,X)
    JSR HandlePushingSamus
    JSR StopIfSamusIsPressingTowardsOum
    RTL


;;; $CD23: Check if touching Samus and update previous position ;;;
CheckIfTouchingSamus_UpdatePreviousPositions:
    JSR CheckIfTouchingSamus
    LDA.W Enemy.XPosition,X : STA.L Oum.previousXPosition,X
    LDA.W Enemy.YPosition,X : STA.L Oum.previousYPosition,X
    RTS


;;; $CD35: Handle pushing Samus ;;;
HandlePushingSamus:
    LDA.W #$0000 : STA.L Oum.stopFlag,X
    JSL CheckIfEnemyIsTouchingSamusFromBelow
    BEQ .notTouchingSamusFromBelow
    LDA.W Enemy.YPosition,X : SEC : SBC.L Oum.previousYPosition,X : STA.W ExtraSamusYDisplacement

  .notTouchingSamusFromBelow:
    LDA.L Oum.touchingSamusFlag,X : BEQ .return
    LDA.W Enemy.XPosition,X : SEC : SBC.L Oum.previousXPosition,X : STA.B DP_Temp12 : BMI .movedLeft
    LDA.L Oum.directionToSamus,X : BNE .return
    BRA +

  .movedLeft:
    LDA.L Oum.directionToSamus,X : BEQ .return

+   LDA.W ExtraSamusXDisplacement : CLC : ADC.B DP_Temp12 : STA.W ExtraSamusXDisplacement

  .return:
    RTS


;;; $CD77: Stop if player is pressing towards oum ;;;
StopIfSamusIsPressingTowardsOum:
    LDA.L Oum.touchingSamusFlag,X : BEQ .return
    LDA.W Enemy.XPosition,X : SEC : SBC.L Oum.previousXPosition,X : BEQ .stationary
    BMI .checkPressingRight
    LDA.B DP_Controller1Input : AND.W #$0200 : BEQ .return
    LDA.W #$0001 : STA.L Oum.stopFlag,X
    LDA.L Oum.previousXPosition,X : STA.W Enemy.XPosition,X
    BRA .return

  .checkPressingRight:
    LDA.B DP_Controller1Input : AND.W #$0100 : BEQ .return
    LDA.W #$0001 : STA.L Oum.stopFlag,X
    LDA.L Oum.previousXPosition,X : STA.W Enemy.XPosition,X
    BRA .return

  .stationary:
    LDA.L Oum.directionToSamus,X : BEQ .SamusIsToTheRight
    LDA.W Oum.movementDirection,X : BEQ .return
    LDA.B DP_Controller1Input : AND.W #$0100 : BEQ .return
    BRA +

  .SamusIsToTheRight:
    LDA.W Oum.movementDirection,X : BNE .return
    LDA.B DP_Controller1Input : AND.W #$0200 : BEQ .return
+   LDA.W #$0001 : STA.L Oum.stopFlag,X
    LDA.L Oum.previousXPosition,X : STA.W Enemy.XPosition,X

  .return:
    RTS


;;; $CDE6: Oum function - idle ;;;
Function_Oum_Idle:
    LDX.W EnemyIndex
    LDA.W Oum.bounceCounter,X : BEQ .noBounce
    JSR.W (Oum.bounceFunction,X)
    BRA .return

  .noBounce:
    LDA.W #$0000 : STA.L Oum.newInstListIndex,X
    JSL Get_SamusX_minus_EnemyX
    BPL .SamusToTheLeft
    LDA.W #$0001 : STA.W Oum.movementDirection,X : STA.L Oum.newInstListIndex,X

  .SamusToTheLeft:
    JSR SetOumInstList
    LDA.W #$0018
    JSL IsSamusWithinAPixelColumnsOfEnemy
    BEQ .return
    LDA.L Oum.newInstListIndex,X : ORA.W #$0002 : STA.L Oum.newInstListIndex,X
    JSR SetOumInstList
    LDA.W #Function_Oum_Rolling : STA.W Oum.function,X

  .return:
    RTS


;;; $CE2B: Oum function - rolling ;;;
Function_Oum_Rolling:
    LDX.W EnemyIndex
    LDA.W Oum.bounceCounter,X : BEQ .noBounce
    JSR.W (Oum.bounceFunction,X)
    BRA .collidedWithBlock

  .noBounce:
    STZ.B DP_Temp12
    LDA.W #$0001 : STA.B DP_Temp14
    JSL MoveEnemyDownBy_14_12
    BCS .collidedWithBlock
    STZ.W Oum.YSpeedTableIndex,X
    LDA.W #Function_Oum_Falling : STA.W Oum.bounceFunction,X
    LDA.W #$0003 : STA.W Oum.bounceCounter,X

  .collidedWithBlock:
    LDA.L Oum.stopFlag,X : BEQ .notStopped
    JMP .return

  .notStopped:
    STZ.B DP_Temp24
    DEC.W Oum.timeUntilAttackIsAllowed,X : BPL .noAttack
    STZ.W Oum.timeUntilAttackIsAllowed,X
    LDA.W #$0020
    JSL IsSamusWithinAPixelColumnsOfEnemy
    BEQ .noAttack
    LDA.L Oum.attackAllowingRotationFlag,X : BEQ .noAttack
    LDA.W Oum.bounceCounter,X : BNE .noAttack
    LDA.W #$0000 : STA.L Oum.newInstListIndex,X : STA.W Oum.movementDirection,X
    JSL Get_SamusX_minus_EnemyX
    BPL .SamusToTheRight
    LDA.W #$0001 : STA.L Oum.newInstListIndex,X : STA.W Oum.movementDirection,X

  .SamusToTheRight:
    LDA.W #$0080 : STA.W Oum.timeUntilAttackIsAllowed,X
    LDA.L Oum.newInstListIndex,X : AND.W #$0001 : ORA.W #$0004 : STA.L Oum.newInstListIndex,X
    JSR SetOumInstList
    LDA.W #Function_Oum_Attacking : STA.W Oum.function,X
    JMP .return

  .noAttack:
    LDA.W #$0080 : TAY
    LDA.W Oum.movementDirection,X : BEQ .notLeft
    INY #4

  .notLeft:
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+2,Y : STA.B DP_Temp12
    LDA.W CommonEnemySpeeds_LinearlyIncreasing,Y : STA.B DP_Temp14
    LDA.L Oum.touchingSamusFlag,X : BEQ .noAdjustForSamus
    LDA.W Oum.movementDirection,X : CMP.L Oum.directionToSamus,X : BNE .noAdjustForSamus
    LDA.W Oum.movementDirection,X : BEQ .right
    LDA.B DP_Temp14 : SEC : SBC.W #$0010 : STA.B DP_Temp14
    BRA .noAdjustForSamus

  .right:
    LDA.B DP_Temp14 : CLC : ADC.W #$0010 : STA.B DP_Temp14

  .noAdjustForSamus:
    JSL MoveEnemyRightBy_14_12_TreatSlopesAsWalls
    BCC .notCollidedWithWall
    INC.B DP_Temp24

  .notCollidedWithWall:
    LDA.L Oum.touchingSamusFlag,X : BEQ .noUnadjustForSamus
    LDA.W Oum.movementDirection,X : CMP.L Oum.directionToSamus,X : BNE .noUnadjustForSamus
    LDA.W Oum.movementDirection,X : BEQ .movingRight
    LDA.W Enemy.XPosition,X : CLC : ADC.W #$0010 : STA.W Enemy.XPosition,X
    BRA .noUnadjustForSamus

  .movingRight:
    LDA.W Enemy.XPosition,X : SEC : SBC.W #$0010 : STA.W Enemy.XPosition,X

  .noUnadjustForSamus:
    LDA.B DP_Temp24 : BEQ .return
    LDA.W Oum.movementDirection,X : EOR.W #$0001 : STA.W Oum.movementDirection,X
    LDA.L Oum.newInstListIndex,X : EOR.W #$0004 : STA.L Oum.newInstListIndex,X
    JSR SetOumInstList

  .return:
    RTS


;;; $CF40: Oum function - attacking ;;;
Function_Oum_Attacking:
    LDX.W EnemyIndex
    LDA.L Oum.animationFinishedFlag,X : BEQ .return
    LDA.W #$0000 : STA.L Oum.animationFinishedFlag,X
    LDA.L Oum.newInstListIndex,X : SEC : SBC.W #$0002 : STA.L Oum.newInstListIndex,X
    JSR SetOumInstList
    LDA.W #Function_Oum_Rolling : STA.W Oum.function,X

  .return:
    RTS


;;; $CF66: Oum bounce function - falling ;;;
Function_Oum_Falling:
    LDA.W Oum.YSpeedTableIndex,X : CLC : ADC.W #$0180 : CMP.W #$4000 : BMI +
    LDA.W #$4000

+   STA.W Oum.YSpeedTableIndex,X
    AND.W #$FF00 : XBA : ASL #3 : TAY
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing,Y : STA.B DP_Temp12
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing+2,Y : STA.B DP_Temp14
    JSL MoveEnemyDownBy_14_12
    BCC .return
    DEC.W Oum.bounceCounter,X
    LDA.W Oum.YSpeedTableIndex,X : SEC : SBC.W #$1000 : BPL .notNegative
    STZ.W Oum.bounceCounter,X

  .notNegative:
    STA.W Oum.YSpeedTableIndex,X
    LDA.W #Function_Oum_Rising : STA.W Oum.bounceFunction,X

  .return:
    RTS


;;; $CFA9: Oum bounce function - rising ;;;
Function_Oum_Rising:
    LDA.W Oum.YSpeedTableIndex,X : SEC : SBC.W #$0180 : STA.W Oum.YSpeedTableIndex,X : BPL .notNegative
    STZ.W Oum.YSpeedTableIndex,X
    LDA.W #Function_Oum_Falling : STA.W Oum.bounceFunction,X
    BRA .return

  .notNegative:
    AND.W #$FF00 : XBA : ASL #3 : TAY
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing+4,Y : STA.B DP_Temp12
    LDA.W CommonEnemySpeeds_QuadraticallyIncreasing+6,Y : STA.B DP_Temp14
    JSL MoveEnemyDownBy_14_12

  .return:
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $CFD7: Unused ;;;
UNUSED_PlayKetchupBeamSFX_A2CFD7:
    LDA.W #$0063
    JSL QueueSound_Lib2_Max6
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $CFDF: Set oum instruction list ;;;
SetOumInstList:
    LDA.L Oum.newInstListIndex,X : CMP.L Oum.instListIndex,X : BEQ .return
    STA.L Oum.instListIndex,X
    ASL : TAY
    LDA.W InstListPointers_Oum,Y : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X

  .return:
    RTS


;;; $CFFF: Check if touching Samus ;;;
CheckIfTouchingSamus:
    LDX.W EnemyIndex
    LDA.W #$0000 : STA.L Oum.touchingSamusFlag,X : STA.L Oum.directionToSamus,X
    LDA.W #$0020
    JSL IsSamusWithingAPixelRowsOfEnemy
    BEQ .return
    LDA.W #$0018
    JSL IsSamusWithinAPixelColumnsOfEnemy
    BEQ .return
    LDA.W #$0001 : STA.L Oum.touchingSamusFlag,X
    JSL Get_SamusX_minus_EnemyX
    BPL .return
    LDA.W #$0001 : STA.L Oum.directionToSamus,X

  .return:
    RTS


;;; $D034: Oum hitboxes ;;;
Hitbox_Oum_FacingLeft_0:
    dw $0002
    dw $FFF0,$FFEF,$FFF8,$0010
    dw EnemyTouch_Oum_DoesNotHurtSamus
    dw EnemyShot_Oum
    dw $FFF8,$FFEF,$000E,$0010
    dw EnemyTouch_Oum_DoesNotHurtSamus
    dw RTL_A2804C

Hitbox_Oum_FacingLeft_1:
    dw $0001
    dw $FFF0,$FFEF,$000E,$0010
    dw EnemyTouch_Oum_DoesNotHurtSamus
    dw RTL_A2804C

Hitbox_Oum_FacingLeft_2:
    dw $0002
    dw $FFFF,$FFEF,$000E,$0010
    dw EnemyTouch_Oum_DoesNotHurtSamus
    dw RTL_A2804C
    dw $FFEF,$FFEF,$0000,$0010
    dw EnemyTouch_Oum_DoesNotHurtSamus
    dw EnemyShot_Oum

Hitbox_Oum_FacingLeft_3:
    dw $0002
    dw $FFEC,$FFF8,$0000,$0008
    dw EnemyTouch_Oum_HurtsSamus
    dw EnemyShot_Oum
    dw $0000,$FFEF,$000D,$0010
    dw EnemyTouch_Oum_HurtsSamus
    dw RTL_A2804C

Hitbox_Oum_FacingLeft_4:
    dw $0002
    dw $FFEA,$FFF8,$0000,$0007
    dw EnemyTouch_Oum_HurtsSamus
    dw EnemyShot_Oum
    dw $0000,$FFEF,$000E,$0010
    dw EnemyTouch_Oum_HurtsSamus
    dw RTL_A2804C

Hitbox_Oum_FacingLeft_5:
    dw $0002
    dw $FFE7,$FFF7,$0000,$0008
    dw EnemyTouch_Oum_HurtsSamus
    dw EnemyShot_Oum
    dw $0000,$FFEE,$000E,$0010
    dw EnemyTouch_Oum_HurtsSamus
    dw RTL_A2804C

Hitbox_Oum_FacingLeft_6:
    dw $0002
    dw $FFE8,$FFF8,$0000,$0009
    dw EnemyTouch_Oum_HurtsSamus
    dw EnemyShot_Oum
    dw $0000,$FFEE,$000F,$0010
    dw EnemyTouch_Oum_HurtsSamus
    dw RTL_A2804C

Hitbox_Oum_FacingLeft_7:
    dw $0002
    dw $FFE5,$FFF8,$0000,$0008
    dw EnemyTouch_Oum_HurtsSamus
    dw EnemyShot_Oum
    dw $0000,$FFEE,$000F,$0010
    dw EnemyTouch_Oum_HurtsSamus
    dw RTL_A2804C

Hitbox_Oum_FacingLeft_8:
    dw $0003
    dw $FFF0,$0000,$0000,$0010
    dw EnemyTouch_Oum_DoesNotHurtSamus
    dw EnemyShot_Oum
    dw $FFF0,$FFF0,$0000,$0000
    dw EnemyTouch_Oum_DoesNotHurtSamus
    dw RTL_A2804C
    dw $0000,$FFF0,$000E,$0010
    dw EnemyTouch_Oum_DoesNotHurtSamus
    dw RTL_A2804C

Hitbox_Oum_FacingLeft_9:
    dw $0002
    dw $FFF1,$FFEF,$000F,$0000
    dw EnemyTouch_Oum_DoesNotHurtSamus
    dw RTL_A2804C
    dw $FFF1,$0000,$000F,$0010
    dw EnemyTouch_Oum_DoesNotHurtSamus
    dw EnemyShot_Oum

Hitbox_Oum_FacingLeft_A:
    dw $0003
    dw $FFF1,$FFEF,$0000,$0010
    dw EnemyTouch_Oum_DoesNotHurtSamus
    dw RTL_A2804C
    dw $0000,$FFEF,$000F,$0000
    dw EnemyTouch_Oum_DoesNotHurtSamus
    dw RTL_A2804C
    dw $0000,$0000,$000F,$0010
    dw EnemyTouch_Oum_DoesNotHurtSamus
    dw EnemyShot_Oum

Hitbox_Oum_FacingLeft_B:
    dw $0002
    dw $FFF0,$FFEF,$0000,$0010
    dw EnemyTouch_Oum_DoesNotHurtSamus
    dw RTL_A2804C
    dw $0000,$FFEF,$000F,$0010
    dw EnemyTouch_Oum_DoesNotHurtSamus
    dw EnemyShot_Oum

Hitbox_Oum_FacingLeft_C:
    dw $0003
    dw $FFF1,$FFEF,$0000,$0010
    dw EnemyTouch_Oum_DoesNotHurtSamus
    dw RTL_A2804C
    dw $0000,$FFEF,$000F,$0000
    dw EnemyTouch_Oum_DoesNotHurtSamus
    dw EnemyShot_Oum
    dw $0000,$0000,$000F,$0010
    dw EnemyTouch_Oum_DoesNotHurtSamus
    dw RTL_A2804C

Hitbox_Oum_FacingLeft_D:
    dw $0002
    dw $FFF0,$FFEE,$000F,$0000
    dw EnemyTouch_Oum_DoesNotHurtSamus
    dw EnemyShot_Oum
    dw $FFF0,$0000,$000F,$0010
    dw EnemyTouch_Oum_DoesNotHurtSamus
    dw RTL_A2804C

Hitbox_Oum_FacingLeft_E:
    dw $0003
    dw $FFF0,$0000,$0000,$0010
    dw EnemyTouch_Oum_DoesNotHurtSamus
    dw RTL_A2804C
    dw $FFF0,$FFEF,$0000,$0000
    dw EnemyTouch_Oum_DoesNotHurtSamus
    dw EnemyShot_Oum
    dw $0000,$FFEF,$000E,$0010
    dw EnemyTouch_Oum_DoesNotHurtSamus
    dw RTL_A2804C

Hitbox_Oum_FacingRight_0:
    dw $0002
    dw $FFF0,$FFEF,$0008,$0010
    dw EnemyTouch_Oum_DoesNotHurtSamus
    dw RTL_A2804C
    dw $0008,$FFEF,$0010,$0010
    dw EnemyTouch_Oum_DoesNotHurtSamus
    dw EnemyShot_Oum

Hitbox_Oum_FacingRight_1:
    dw $0001
    dw $FFF0,$FFEF,$0010,$0010
    dw EnemyTouch_Oum_DoesNotHurtSamus
    dw RTL_A2804C

Hitbox_Oum_FacingRight_2:
    dw $0002
    dw $FFF0,$FFEF,$0000,$0010
    dw EnemyTouch_Oum_DoesNotHurtSamus
    dw RTL_A2804C
    dw $0000,$FFEF,$0010,$0010
    dw EnemyTouch_Oum_DoesNotHurtSamus
    dw EnemyShot_Oum

Hitbox_Oum_FacingRight_3:
    dw $0002
    dw $FFF0,$FFEF,$0000,$0010
    dw EnemyTouch_Oum_HurtsSamus
    dw RTL_A2804C
    dw $0000,$FFF8,$0014,$0008
    dw EnemyTouch_Oum_HurtsSamus
    dw EnemyShot_Oum

Hitbox_Oum_FacingRight_4:
    dw $0002
    dw $FFF0,$FFEF,$FFFF,$0010
    dw EnemyTouch_Oum_HurtsSamus
    dw RTL_A2804C
    dw $0000,$FFF8,$0016,$0008
    dw EnemyTouch_Oum_HurtsSamus
    dw EnemyShot_Oum

Hitbox_Oum_FacingRight_5:
    dw $0002
    dw $FFF0,$FFEE,$0000,$0010
    dw EnemyTouch_Oum_HurtsSamus
    dw RTL_A2804C
    dw $0000,$FFF8,$0018,$0008
    dw EnemyTouch_Oum_HurtsSamus
    dw EnemyShot_Oum

Hitbox_Oum_FacingRight_6:
    dw $0002
    dw $FFF1,$FFEF,$0000,$0010
    dw EnemyTouch_Oum_HurtsSamus
    dw RTL_A2804C
    dw $0000,$FFF8,$0018,$0008
    dw EnemyTouch_Oum_HurtsSamus
    dw EnemyShot_Oum

Hitbox_Oum_FacingRight_7:
    dw $0002
    dw $FFF0,$FFEF,$0000,$0010
    dw EnemyTouch_Oum_HurtsSamus
    dw RTL_A2804C
    dw $0000,$FFF8,$0019,$0008
    dw EnemyTouch_Oum_HurtsSamus
    dw EnemyShot_Oum

Hitbox_Oum_FacingRight_8:
    dw $0003
    dw $FFF1,$FFF0,$0000,$0010
    dw EnemyTouch_Oum_DoesNotHurtSamus
    dw RTL_A2804C
    dw $0000,$FFF0,$0010,$0000
    dw EnemyTouch_Oum_DoesNotHurtSamus
    dw RTL_A2804C
    dw $0000,$0000,$0010,$0010
    dw EnemyTouch_Oum_DoesNotHurtSamus
    dw EnemyShot_Oum

Hitbox_Oum_FacingRight_9:
    dw $0002
    dw $FFF1,$FFEF,$000F,$0000
    dw EnemyTouch_Oum_DoesNotHurtSamus
    dw RTL_A2804C
    dw $FFF1,$0000,$000F,$0010
    dw EnemyTouch_Oum_DoesNotHurtSamus
    dw EnemyShot_Oum

Hitbox_Oum_FacingRight_A:
    dw $0003
    dw $FFF0,$0000,$0000,$0011
    dw EnemyTouch_Oum_DoesNotHurtSamus
    dw EnemyShot_Oum
    dw $FFF0,$FFEF,$0000,$0000
    dw EnemyTouch_Oum_DoesNotHurtSamus
    dw RTL_A2804C
    dw $0000,$FFEF,$000E,$0011
    dw EnemyTouch_Oum_DoesNotHurtSamus
    dw RTL_A2804C

Hitbox_Oum_FacingRight_B:
    dw $0002
    dw $FFF0,$FFEF,$0000,$0010
    dw EnemyTouch_Oum_DoesNotHurtSamus
    dw EnemyShot_Oum
    dw $0000,$FFEF,$000E,$0010
    dw EnemyTouch_Oum_DoesNotHurtSamus
    dw RTL_A2804C

Hitbox_Oum_FacingRight_C:
    dw $0003
    dw $FFF0,$FFEF,$0000,$0000
    dw EnemyTouch_Oum_DoesNotHurtSamus
    dw EnemyShot_Oum
    dw $FFF0,$0000,$0000,$0010
    dw EnemyTouch_Oum_DoesNotHurtSamus
    dw RTL_A2804C
    dw $0000,$FFEF,$000E,$0010
    dw EnemyTouch_Oum_DoesNotHurtSamus
    dw RTL_A2804C

Hitbox_Oum_FacingRight_D:
    dw $0002
    dw $FFF0,$FFEF,$000F,$0000
    dw EnemyTouch_Oum_DoesNotHurtSamus
    dw EnemyShot_Oum
    dw $FFF0,$0000,$000F,$0010
    dw EnemyTouch_Oum_DoesNotHurtSamus
    dw RTL_A2804C

Hitbox_Oum_FacingRight_E:
    dw $0003
    dw $FFF1,$FFEF,$0000,$0010
    dw EnemyTouch_Oum_DoesNotHurtSamus
    dw RTL_A2804C
    dw $0000,$FFEF,$0010,$0000
    dw EnemyTouch_Oum_DoesNotHurtSamus
    dw EnemyShot_Oum
    dw $0000,$0000,$0010,$0010
    dw EnemyTouch_Oum_DoesNotHurtSamus
    dw RTL_A2804C


;;; $D388: Enemy touch - oum - hurts Samus ;;;
EnemyTouch_Oum_HurtsSamus:
    JSL CommonA2_NormalEnemyTouchAI
; fallthrough to EnemyTouch_Oum_DoesNotHurtSamus


;;; $D38C: Enemy touch - oum - doesn't hurt Samus ;;;
EnemyTouch_Oum_DoesNotHurtSamus:
    JSL CheckIfEnemyIsTouchingSamusFromBelow
    BNE .return
    LDX.W EnemyIndex
    LDA.W SamusXPosition : SEC : SBC.W Enemy.XPosition,X : BMI .rightOfSamus
    LDA.W ExtraSamusXDisplacement : CLC : ADC.W #$0004 : STA.W ExtraSamusXDisplacement
    RTL

  .rightOfSamus:
    LDA.W ExtraSamusXDisplacement : CLC : ADC.W #$FFFC : STA.W ExtraSamusXDisplacement

  .return:
    RTL


;;; $D3B4: Enemy shot - enemy $D37F (oum) ;;;
EnemyShot_Oum:
    JSL NormalEnemyShotAI
    LDA.W #$0057
    JSL QueueSound_Lib2_Max6
    RTL


;;; $D3C0: Oum spritemaps ;;;
Spritemap_Oum_FacingLeft_0:
    dw $0006
    %spritemapEntry(0, $1F0, $00, 0, 0, 2, 0, $11E)
    %spritemapEntry(0, $1F0, $F8, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $00, $00, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $1F0, $00, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $00, $F0, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 2, 0, $100)

Spritemap_Oum_FacingLeft_1:
    dw $0006
    %spritemapEntry(0, $1F0, $00, 0, 0, 2, 0, $11F)
    %spritemapEntry(0, $1F0, $F8, 0, 0, 2, 0, $10F)
    %spritemapEntry(1, $00, $00, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $1F0, $00, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $00, $F0, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 2, 0, $100)

Spritemap_Oum_FacingLeft_2:
    dw $0007
    %spritemapEntry(1, $1F0, $F8, 0, 0, 2, 0, $110)
    %spritemapEntry(0, $1F8, $08, 0, 0, 2, 0, $131)
    %spritemapEntry(0, $1F0, $08, 0, 0, 2, 0, $130)
    %spritemapEntry(0, $1F8, $F0, 0, 0, 2, 0, $101)
    %spritemapEntry(0, $1F0, $F0, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $00, $00, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $00, $F0, 0, 0, 2, 0, $102)

Spritemap_Oum_3:
    dw $0009
    %spritemapEntry(0, $1EA, $FF, 0, 0, 2, 0, $12E)
    %spritemapEntry(0, $1F0, $00, 0, 0, 2, 0, $12F)
    %spritemapEntry(1, $1F0, $F8, 0, 0, 2, 0, $110)
    %spritemapEntry(0, $1F8, $F0, 0, 0, 2, 0, $101)
    %spritemapEntry(0, $1F0, $F0, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $1F8, $08, 0, 0, 2, 0, $131)
    %spritemapEntry(0, $1F0, $08, 0, 0, 2, 0, $130)
    %spritemapEntry(1, $00, $00, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $00, $F0, 0, 0, 2, 0, $102)

Spritemap_Oum_FacingLeft_4:
    dw $0009
    %spritemapEntry(0, $1F8, $08, 0, 0, 2, 0, $131)
    %spritemapEntry(0, $1F0, $08, 0, 0, 2, 0, $130)
    %spritemapEntry(0, $1F8, $F0, 0, 0, 2, 0, $101)
    %spritemapEntry(0, $1F0, $F0, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $1E8, $FE, 0, 0, 2, 0, $12E)
    %spritemapEntry(0, $1F0, $00, 0, 0, 2, 0, $12F)
    %spritemapEntry(1, $1F0, $F8, 0, 0, 2, 0, $110)
    %spritemapEntry(1, $00, $00, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $00, $F0, 0, 0, 2, 0, $102)

Spritemap_Oum_FacingLeft_5:
    dw $000A
    %spritemapEntry(0, $1F0, $00, 0, 0, 2, 0, $12F)
    %spritemapEntry(0, $1E3, $FE, 0, 0, 2, 0, $13E)
    %spritemapEntry(0, $1E9, $FF, 0, 0, 2, 0, $13F)
    %spritemapEntry(0, $1F8, $08, 0, 0, 2, 0, $131)
    %spritemapEntry(0, $1F0, $08, 0, 0, 2, 0, $130)
    %spritemapEntry(0, $1F8, $F0, 0, 0, 2, 0, $101)
    %spritemapEntry(0, $1F0, $F0, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $1F0, $F8, 0, 0, 2, 0, $110)
    %spritemapEntry(1, $00, $00, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $00, $F0, 0, 0, 2, 0, $102)

Spritemap_Oum_FacingLeft_6:
    dw $000A
    %spritemapEntry(0, $1F0, $00, 0, 0, 2, 0, $12F)
    %spritemapEntry(0, $1E2, $00, 0, 0, 2, 0, $13E)
    %spritemapEntry(0, $1E9, $00, 0, 0, 2, 0, $13F)
    %spritemapEntry(0, $1F8, $08, 0, 0, 2, 0, $131)
    %spritemapEntry(0, $1F0, $08, 0, 0, 2, 0, $130)
    %spritemapEntry(0, $1F8, $F0, 0, 0, 2, 0, $101)
    %spritemapEntry(0, $1F0, $F0, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $1F0, $F8, 0, 0, 2, 0, $110)
    %spritemapEntry(1, $00, $00, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $00, $F0, 0, 0, 2, 0, $102)

Spritemap_Oum_FacingLeft_7:
    dw $000A
    %spritemapEntry(0, $1F0, $00, 0, 0, 2, 0, $12F)
    %spritemapEntry(0, $1E0, $FF, 0, 0, 2, 0, $13E)
    %spritemapEntry(0, $1E8, $FF, 0, 0, 2, 0, $13F)
    %spritemapEntry(0, $1F8, $08, 0, 0, 2, 0, $131)
    %spritemapEntry(0, $1F0, $08, 0, 0, 2, 0, $130)
    %spritemapEntry(0, $1F8, $F0, 0, 0, 2, 0, $101)
    %spritemapEntry(0, $1F0, $F0, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $1F0, $F8, 0, 0, 2, 0, $110)
    %spritemapEntry(1, $00, $00, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $00, $F0, 0, 0, 2, 0, $102)

Spritemap_Oum_FacingLeft_8:
    dw $0004
    %spritemapEntry(1, $00, $F0, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $00, $00, 0, 0, 2, 0, $128)
    %spritemapEntry(1, $1F0, $00, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 2, 0, $106)

Spritemap_Oum_FacingLeft_9:
    dw $0007
    %spritemapEntry(0, $08, $08, 0, 0, 2, 0, $11B)
    %spritemapEntry(0, $08, $00, 0, 0, 2, 0, $10B)
    %spritemapEntry(0, $1F0, $08, 0, 0, 2, 0, $118)
    %spritemapEntry(0, $1F0, $00, 0, 0, 2, 0, $108)
    %spritemapEntry(1, $1F8, $00, 0, 0, 2, 0, $109)
    %spritemapEntry(1, $1F0, $F0, 1, 1, 2, 0, $122)
    %spritemapEntry(1, $00, $F0, 0, 0, 2, 0, $102)

Spritemap_Oum_FacingLeft_A:
    dw $0004
    %spritemapEntry(1, $1F0, $F0, 1, 1, 2, 0, $124)
    %spritemapEntry(1, $00, $F0, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $00, $00, 0, 0, 2, 0, $12C)
    %spritemapEntry(1, $1F0, $00, 0, 0, 2, 0, $12A)

Spritemap_Oum_FacingLeft_B:
    dw $0007
    %spritemapEntry(0, $08, $F0, 1, 1, 2, 0, $130)
    %spritemapEntry(0, $00, $F0, 1, 1, 2, 0, $131)
    %spritemapEntry(0, $00, $08, 1, 1, 2, 0, $101)
    %spritemapEntry(0, $08, $08, 1, 1, 2, 0, $100)
    %spritemapEntry(1, $00, $F8, 1, 1, 2, 0, $110)
    %spritemapEntry(1, $1F0, $F0, 1, 1, 2, 0, $122)
    %spritemapEntry(1, $1F0, $00, 1, 1, 2, 0, $102)

Spritemap_Oum_FacingLeft_C:
    dw $0004
    %spritemapEntry(1, $1F0, $00, 1, 1, 2, 0, $104)
    %spritemapEntry(1, $1F0, $F0, 1, 1, 2, 0, $128)
    %spritemapEntry(1, $00, $F0, 1, 1, 2, 0, $126)
    %spritemapEntry(1, $00, $00, 1, 1, 2, 0, $106)

Spritemap_Oum_FacingLeft_D:
    dw $0007
    %spritemapEntry(0, $1F0, $F8, 1, 1, 2, 0, $10B)
    %spritemapEntry(0, $1F0, $F0, 1, 1, 2, 0, $11B)
    %spritemapEntry(0, $08, $F8, 1, 1, 2, 0, $108)
    %spritemapEntry(0, $08, $F0, 1, 1, 2, 0, $118)
    %spritemapEntry(1, $1F8, $F0, 1, 1, 2, 0, $109)
    %spritemapEntry(1, $00, $00, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $1F0, $00, 1, 1, 2, 0, $102)

Spritemap_Oum_FacingLeft_E:
    dw $0004
    %spritemapEntry(1, $00, $00, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $1F0, $00, 1, 1, 2, 0, $10C)
    %spritemapEntry(1, $1F0, $F0, 1, 1, 2, 0, $12C)
    %spritemapEntry(1, $00, $F0, 1, 1, 2, 0, $12A)

Spritemap_Oum_FacingRight_0:
    dw $0006
    %spritemapEntry(0, $08, $00, 0, 1, 2, 0, $11E)
    %spritemapEntry(0, $08, $F8, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $1F0, $00, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $00, $00, 0, 1, 2, 0, $120)
    %spritemapEntry(1, $1F0, $F0, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $00, $F0, 0, 1, 2, 0, $100)

Spritemap_Oum_FacingRight_1:
    dw $0006
    %spritemapEntry(0, $08, $00, 0, 1, 2, 0, $11F)
    %spritemapEntry(0, $08, $F8, 0, 1, 2, 0, $10F)
    %spritemapEntry(1, $1F0, $00, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $00, $00, 0, 1, 2, 0, $120)
    %spritemapEntry(1, $1F0, $F0, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $00, $F0, 0, 1, 2, 0, $100)

Spritemap_Oum_FacingRight_2:
    dw $0007
    %spritemapEntry(1, $00, $F8, 0, 1, 2, 0, $110)
    %spritemapEntry(0, $00, $08, 0, 1, 2, 0, $131)
    %spritemapEntry(0, $08, $08, 0, 1, 2, 0, $130)
    %spritemapEntry(0, $00, $F0, 0, 1, 2, 0, $101)
    %spritemapEntry(0, $08, $F0, 0, 1, 2, 0, $100)
    %spritemapEntry(1, $1F0, $00, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $1F0, $F0, 0, 1, 2, 0, $102)

Spritemap_Oum_FacingRight_3:
    dw $0009
    %spritemapEntry(0, $0E, $FF, 0, 1, 2, 0, $12E)
    %spritemapEntry(0, $08, $00, 0, 1, 2, 0, $12F)
    %spritemapEntry(1, $00, $F8, 0, 1, 2, 0, $110)
    %spritemapEntry(0, $00, $F0, 0, 1, 2, 0, $101)
    %spritemapEntry(0, $08, $F0, 0, 1, 2, 0, $100)
    %spritemapEntry(0, $00, $08, 0, 1, 2, 0, $131)
    %spritemapEntry(0, $08, $08, 0, 1, 2, 0, $130)
    %spritemapEntry(1, $1F0, $00, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $1F0, $F0, 0, 1, 2, 0, $102)

Spritemap_Oum_FacingRight_4:
    dw $0009
    %spritemapEntry(0, $00, $08, 0, 1, 2, 0, $131)
    %spritemapEntry(0, $08, $08, 0, 1, 2, 0, $130)
    %spritemapEntry(0, $00, $F0, 0, 1, 2, 0, $101)
    %spritemapEntry(0, $08, $F0, 0, 1, 2, 0, $100)
    %spritemapEntry(0, $10, $FE, 0, 1, 2, 0, $12E)
    %spritemapEntry(0, $08, $00, 0, 1, 2, 0, $12F)
    %spritemapEntry(1, $00, $F8, 0, 1, 2, 0, $110)
    %spritemapEntry(1, $1F0, $00, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $1F0, $F0, 0, 1, 2, 0, $102)

Spritemap_Oum_FacingRight_5:
    dw $000A
    %spritemapEntry(0, $08, $00, 0, 1, 2, 0, $12F)
    %spritemapEntry(0, $15, $FE, 0, 1, 2, 0, $13E)
    %spritemapEntry(0, $0F, $FF, 0, 1, 2, 0, $13F)
    %spritemapEntry(0, $00, $08, 0, 1, 2, 0, $131)
    %spritemapEntry(0, $08, $08, 0, 1, 2, 0, $130)
    %spritemapEntry(0, $00, $F0, 0, 1, 2, 0, $101)
    %spritemapEntry(0, $08, $F0, 0, 1, 2, 0, $100)
    %spritemapEntry(1, $00, $F8, 0, 1, 2, 0, $110)
    %spritemapEntry(1, $1F0, $00, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $1F0, $F0, 0, 1, 2, 0, $102)

Spritemap_Oum_FacingRight_6:
    dw $000A
    %spritemapEntry(0, $08, $00, 0, 1, 2, 0, $12F)
    %spritemapEntry(0, $16, $00, 0, 1, 2, 0, $13E)
    %spritemapEntry(0, $0F, $00, 0, 1, 2, 0, $13F)
    %spritemapEntry(0, $00, $08, 0, 1, 2, 0, $131)
    %spritemapEntry(0, $08, $08, 0, 1, 2, 0, $130)
    %spritemapEntry(0, $00, $F0, 0, 1, 2, 0, $101)
    %spritemapEntry(0, $08, $F0, 0, 1, 2, 0, $100)
    %spritemapEntry(1, $00, $F8, 0, 1, 2, 0, $110)
    %spritemapEntry(1, $1F0, $00, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $1F0, $F0, 0, 1, 2, 0, $102)

Spritemap_Oum_FacingRight_7:
    dw $000A
    %spritemapEntry(0, $08, $00, 0, 1, 2, 0, $12F)
    %spritemapEntry(0, $18, $FF, 0, 1, 2, 0, $13E)
    %spritemapEntry(0, $10, $FF, 0, 1, 2, 0, $13F)
    %spritemapEntry(0, $00, $08, 0, 1, 2, 0, $131)
    %spritemapEntry(0, $08, $08, 0, 1, 2, 0, $130)
    %spritemapEntry(0, $00, $F0, 0, 1, 2, 0, $101)
    %spritemapEntry(0, $08, $F0, 0, 1, 2, 0, $100)
    %spritemapEntry(1, $00, $F8, 0, 1, 2, 0, $110)
    %spritemapEntry(1, $1F0, $00, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $1F0, $F0, 0, 1, 2, 0, $102)

Spritemap_Oum_FacingRight_8:
    dw $0004
    %spritemapEntry(1, $1F0, $F0, 0, 1, 2, 0, $104)
    %spritemapEntry(1, $1F0, $00, 0, 1, 2, 0, $128)
    %spritemapEntry(1, $00, $00, 0, 1, 2, 0, $126)
    %spritemapEntry(1, $00, $F0, 0, 1, 2, 0, $106)

Spritemap_Oum_FacingRight_9:
    dw $0007
    %spritemapEntry(0, $1F0, $08, 0, 1, 2, 0, $11B)
    %spritemapEntry(0, $1F0, $00, 0, 1, 2, 0, $10B)
    %spritemapEntry(0, $08, $08, 0, 1, 2, 0, $118)
    %spritemapEntry(0, $08, $00, 0, 1, 2, 0, $108)
    %spritemapEntry(1, $1F8, $00, 0, 1, 2, 0, $109)
    %spritemapEntry(1, $00, $F0, 1, 0, 2, 0, $122)
    %spritemapEntry(1, $1F0, $F0, 0, 1, 2, 0, $102)

Spritemap_Oum_FacingRight_A:
    dw $0004
    %spritemapEntry(1, $00, $F0, 1, 0, 2, 0, $124)
    %spritemapEntry(1, $1F0, $F0, 0, 1, 2, 0, $10C)
    %spritemapEntry(1, $1F0, $00, 0, 1, 2, 0, $12C)
    %spritemapEntry(1, $00, $00, 0, 1, 2, 0, $12A)

Spritemap_Oum_FacingRight_B:
    dw $0007
    %spritemapEntry(0, $1F0, $F0, 1, 0, 2, 0, $130)
    %spritemapEntry(0, $1F8, $F0, 1, 0, 2, 0, $131)
    %spritemapEntry(0, $1F8, $08, 1, 0, 2, 0, $101)
    %spritemapEntry(0, $1F0, $08, 1, 0, 2, 0, $100)
    %spritemapEntry(1, $1F0, $F8, 1, 0, 2, 0, $110)
    %spritemapEntry(1, $00, $F0, 1, 0, 2, 0, $122)
    %spritemapEntry(1, $00, $00, 1, 0, 2, 0, $102)

Spritemap_Oum_FacingRight_C:
    dw $0004
    %spritemapEntry(1, $00, $00, 1, 0, 2, 0, $104)
    %spritemapEntry(1, $00, $F0, 1, 0, 2, 0, $128)
    %spritemapEntry(1, $1F0, $F0, 1, 0, 2, 0, $126)
    %spritemapEntry(1, $1F0, $00, 1, 0, 2, 0, $106)

Spritemap_Oum_FacingRight_D:
    dw $0007
    %spritemapEntry(0, $08, $F8, 1, 0, 2, 0, $10B)
    %spritemapEntry(0, $08, $F0, 1, 0, 2, 0, $11B)
    %spritemapEntry(0, $1F0, $F8, 1, 0, 2, 0, $108)
    %spritemapEntry(0, $1F0, $F0, 1, 0, 2, 0, $118)
    %spritemapEntry(1, $1F8, $F0, 1, 0, 2, 0, $109)
    %spritemapEntry(1, $1F0, $00, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $00, $00, 1, 0, 2, 0, $102)

Spritemap_Oum_FacingRight_E:
    dw $0004
    %spritemapEntry(1, $1F0, $00, 0, 1, 2, 0, $124)
    %spritemapEntry(1, $00, $00, 1, 0, 2, 0, $10C)
    %spritemapEntry(1, $00, $F0, 1, 0, 2, 0, $12C)
    %spritemapEntry(1, $1F0, $F0, 1, 0, 2, 0, $12A)


;;; $D80C: Palette - enemy $D3BF (choot) ;;;
Palette_Choot:
    dw $3800,$4B9C,$2610,$0CC6,$0C63,$42F7,$2A52,$19AD
    dw $0D29,$5E59,$3D72,$2CEE,$1447,$033B,$0216,$0113


;;; $D82C: Instruction list - idle ;;;
InstList_Choot_Idle:
    dw Instruction_Common_DisableOffScreenProcessing
    dw $0001,Spritemap_Choot_0
    dw Instruction_Common_Sleep


;;; $D834: Instruction list - jumping ;;;
InstList_Choot_Jumping:
    dw Instruction_Common_EnableOffScreenProcessing
    dw $0008,Spritemap_Choot_1
    dw $0001,Spritemap_Choot_2
    dw Instruction_Common_Sleep


;;; $D840: Instruction list - falling ;;;
InstList_Choot_Falling:
    dw Instruction_Common_EnableOffScreenProcessing
    dw $0008,Spritemap_Choot_1
    dw $0001,Spritemap_Choot_3
    dw Instruction_Common_Sleep


;;; $D84C: Falling pattern data ;;;
; X,Y offsets from a fixed point. Terminated by X = 8000h
ChootFallingPatternData_0_Normal:
; Pattern 0 - normal. X radius 11h, Y distance 1Eh, 73 frames
    dw $0000,$0000, $0001,$0001, $0002,$0001, $0003,$0002
    dw $0004,$0002, $0005,$0002, $0006,$0003, $0007,$0003
    dw $0008,$0003, $0009,$0003, $000A,$0003, $000B,$0003
    dw $000C,$0003, $000C,$0003, $000D,$0003, $000D,$0003
    dw $000D,$0003, $000E,$0003, $000E,$0003, $000E,$0003
    dw $000F,$0003, $000F,$0003, $0010,$0003, $0010,$0003
    dw $0010,$0003, $0010,$0003, $0011,$0003, $0011,$0003
    dw $0010,$0005, $000F,$0006, $000E,$0008, $000C,$0009
    dw $000B,$000A, $000A,$000C, $0008,$000D, $0007,$000E
    dw $0006,$000E, $0004,$000F, $0003,$0010, $0002,$0010
    dw $0001,$0011, $0000,$0011, $FFFF,$0011, $FFFE,$0012
    dw $FFFC,$0012, $FFFC,$0012, $FFFB,$0012, $FFFA,$0012
    dw $FFF9,$0012, $FFF8,$0012, $FFF7,$0012, $FFF7,$0012
    dw $FFF7,$0012, $FFF6,$0012, $FFF6,$0012, $FFF5,$0012
    dw $FFF5,$0012, $FFF4,$0012, $FFF4,$0012, $FFF4,$0012
    dw $FFF3,$0012, $FFF3,$0012, $FFF3,$0012, $FFF4,$0014
    dw $FFF5,$0016, $FFF6,$0017, $FFF7,$0019, $FFF9,$001A
    dw $FFFA,$001B, $FFFB,$001C, $FFFD,$001D, $FFFE,$001E
    dw $FFFF,$001F, $8000,$8000

ChootFallingPatternData_0_Normal_YDistance:
    dw $001E

ChootFallingPatternData_1_Wide:
; Pattern 1 - wide. X radius 20h, Y distance 1Ch, 73 frames
    dw $0000,$0000, $0003,$0000, $0005,$0001, $0007,$0001
    dw $0009,$0002, $000B,$0002, $000D,$0002, $000E,$0002
    dw $0010,$0003, $0012,$0003, $0013,$0003, $0015,$0003
    dw $0016,$0003, $0017,$0003, $0018,$0003, $0019,$0003
    dw $0019,$0003, $001A,$0003, $001B,$0003, $001C,$0003
    dw $001D,$0003, $001E,$0003, $001E,$0003, $001F,$0003
    dw $001F,$0003, $0020,$0003, $0020,$0003, $0020,$0003
    dw $001E,$0004, $001C,$0006, $001A,$0007, $0017,$0008
    dw $0015,$000A, $0013,$000B, $0010,$000C, $000E,$000C
    dw $000B,$000D, $0009,$000E, $0007,$000E, $0005,$000F
    dw $0002,$000F, $0000,$0010, $FFFE,$0010, $FFFC,$0010
    dw $FFFA,$0010, $FFF9,$0011, $FFF7,$0011, $FFF5,$0011
    dw $FFF4,$0011, $FFF2,$0011, $FFF1,$0011, $FFF0,$0011
    dw $FFF0,$0011, $FFEF,$0011, $FFEE,$0011, $FFED,$0011
    dw $FFEC,$0011, $FFEB,$0011, $FFEA,$0011, $FFEA,$0011
    dw $FFE9,$0011, $FFE8,$0011, $FFE8,$0011, $FFEA,$0013
    dw $FFEC,$0014, $FFEE,$0016, $FFF0,$0017, $FFF2,$0018
    dw $FFF5,$0019, $FFF7,$001A, $FFFA,$001B, $FFFC,$001C
    dw $FFFE,$001D, $8000,$8000

ChootFallingPatternData_1_Wide_YDistance:
    dw $001C

ChootFallingPatternData_2_VeryWide:
; Pattern 2 - very wide. X radius 2Dh, Y distance 20h, 73 frames
    dw $0000,$0000, $0003,$0001, $0006,$0001, $0009,$0002
    dw $000C,$0002, $000F,$0003, $0011,$0003, $0014,$0003
    dw $0016,$0003, $0018,$0003, $001A,$0003, $001C,$0004
    dw $001E,$0004, $0020,$0004, $0022,$0004, $0023,$0004
    dw $0024,$0004, $0025,$0004, $0026,$0004, $0028,$0004
    dw $0029,$0004, $002A,$0004, $002A,$0004, $002B,$0004
    dw $002C,$0003, $002D,$0003, $002D,$0003, $002D,$0003
    dw $002A,$0005, $0027,$0007, $0024,$0009, $0021,$000A
    dw $001E,$000B, $001A,$000D, $0017,$000E, $0014,$000F
    dw $0010,$000F, $000D,$0010, $000A,$0011, $0006,$0011
    dw $0003,$0012, $0000,$0012, $FFFD,$0013, $FFFB,$0013
    dw $FFF8,$0013, $FFF6,$0013, $FFF3,$0013, $FFF1,$0014
    dw $FFEF,$0014, $FFED,$0014, $FFEB,$0014, $FFE9,$0014
    dw $FFE8,$0014, $FFE7,$0014, $FFE5,$0014, $FFE4,$0014
    dw $FFE3,$0014, $FFE2,$0014, $FFE1,$0013, $FFE0,$0013
    dw $FFDF,$0013, $FFDE,$0013, $FFDE,$0013, $FFE1,$0015
    dw $FFE4,$0017, $FFE7,$0018, $FFEA,$001A, $FFEE,$001B
    dw $FFF1,$001C, $FFF4,$001D, $FFF8,$001E, $FFFB,$001F
    dw $FFFE,$0020, $8000,$8000

ChootFallingPatternData_2_VeryWide_YDistance:
    dw $0020

ChootFallingPatternData_3_Slow:
; Pattern 3 - slow. X radius 11h, Y distance 1Eh, 93 frames
    dw $0000,$0000, $0001,$0001, $0002,$0001, $0003,$0002
    dw $0004,$0002, $0005,$0002, $0006,$0003, $0007,$0003
    dw $0008,$0003, $0009,$0003, $000A,$0003, $000B,$0003
    dw $000C,$0003, $000C,$0003, $000D,$0003, $000D,$0003
    dw $000D,$0003, $000E,$0003, $000E,$0003, $000E,$0003
    dw $000F,$0003, $000F,$0003, $0010,$0003, $0010,$0003
    dw $0010,$0003, $0010,$0003, $0011,$0003, $0011,$0003
    dw $0011,$0003, $0011,$0003, $0011,$0003, $0011,$0003
    dw $0011,$0003, $0011,$0003, $0011,$0003, $0011,$0003
    dw $0011,$0003, $0011,$0003, $0010,$0005, $000F,$0006
    dw $000E,$0008, $000C,$0009, $000B,$000A, $000A,$000C
    dw $0008,$000D, $0007,$000E, $0006,$000E, $0004,$000F
    dw $0003,$0010, $0002,$0010, $0001,$0011, $0000,$0011
    dw $FFFF,$0011, $FFFE,$0012, $FFFC,$0012, $FFFC,$0012
    dw $FFFB,$0012, $FFFA,$0012, $FFF9,$0012, $FFF8,$0012
    dw $FFF7,$0012, $FFF7,$0012, $FFF7,$0012, $FFF6,$0012
    dw $FFF6,$0012, $FFF5,$0012, $FFF5,$0012, $FFF4,$0012
    dw $FFF4,$0012, $FFF4,$0012, $FFF3,$0012, $FFF3,$0012
    dw $FFF3,$0012, $FFF3,$0012, $FFF3,$0012, $FFF3,$0012
    dw $FFF3,$0012, $FFF3,$0012, $FFF3,$0012, $FFF3,$0012
    dw $FFF3,$0012, $FFF3,$0012, $FFF3,$0012, $FFF4,$0014
    dw $FFF5,$0016, $FFF6,$0017, $FFF7,$0019, $FFF9,$001A
    dw $FFFA,$001B, $FFFB,$001C, $FFFD,$001D, $FFFE,$001E
    dw $FFFF,$001F, $8000,$8000

ChootFallingPatternData_3_Slow_YDistance:
    dw $001E

ChootFallingPatternData_4_VerySlow:
; Pattern 4 - very slow. X radius 11h, Y distance 1Eh, 133 frames
    dw $0000,$0000, $0001,$0001, $0002,$0001, $0003,$0002
    dw $0004,$0002, $0005,$0002, $0006,$0003, $0007,$0003
    dw $0008,$0003, $0009,$0003, $000A,$0003, $000B,$0003
    dw $000C,$0003, $000C,$0003, $000D,$0003, $000D,$0003
    dw $000D,$0003, $000E,$0003, $000E,$0003, $000E,$0003
    dw $000F,$0003, $000F,$0003, $0010,$0003, $0010,$0003
    dw $0010,$0003, $0010,$0003, $0011,$0003, $0011,$0003
    dw $0011,$0003, $0011,$0003, $0011,$0003, $0011,$0003
    dw $0011,$0003, $0011,$0003, $0011,$0003, $0011,$0003
    dw $0011,$0003, $0011,$0003, $0011,$0003, $0011,$0003
    dw $0011,$0003, $0011,$0003, $0011,$0003, $0011,$0003
    dw $0011,$0003, $0011,$0003, $0011,$0003, $0011,$0003
    dw $0011,$0003, $0011,$0003, $0011,$0003, $0011,$0003
    dw $0011,$0003, $0011,$0003, $0011,$0003, $0011,$0003
    dw $0011,$0003, $0011,$0003, $0010,$0005, $000F,$0006
    dw $000E,$0008, $000C,$0009, $000B,$000A, $000A,$000C
    dw $0008,$000D, $0007,$000E, $0006,$000E, $0004,$000F
    dw $0003,$0010, $0002,$0010, $0001,$0011, $0000,$0011
    dw $FFFF,$0011, $FFFE,$0012, $FFFC,$0012, $FFFC,$0012
    dw $FFFB,$0012, $FFFA,$0012, $FFF9,$0012, $FFF8,$0012
    dw $FFF7,$0012, $FFF7,$0012, $FFF7,$0012, $FFF6,$0012
    dw $FFF6,$0012, $FFF5,$0012, $FFF5,$0012, $FFF4,$0012
    dw $FFF4,$0012, $FFF4,$0012, $FFF3,$0012, $FFF3,$0012
    dw $FFF3,$0012, $FFF3,$0012, $FFF3,$0012, $FFF3,$0012
    dw $FFF3,$0012, $FFF3,$0012, $FFF3,$0012, $FFF3,$0012
    dw $FFF3,$0012, $FFF3,$0012, $FFF3,$0012, $FFF3,$0012
    dw $FFF3,$0012, $FFF3,$0012, $FFF3,$0012, $FFF3,$0012
    dw $FFF3,$0012, $FFF3,$0012, $FFF3,$0012, $FFF3,$0012
    dw $FFF3,$0012, $FFF3,$0012, $FFF3,$0012, $FFF3,$0012
    dw $FFF3,$0012, $FFF3,$0012, $FFF3,$0012, $FFF3,$0012
    dw $FFF3,$0012, $FFF3,$0012, $FFF3,$0012, $FFF4,$0014
    dw $FFF5,$0016, $FFF6,$0017, $FFF7,$0019, $FFF9,$001A
    dw $FFFA,$001B, $FFFB,$001C, $FFFD,$001D, $FFFE,$001E
    dw $FFFF,$001F, $8000,$8000

ChootFallingPatternData_4_VerySlow_YDistance:
    dw $001E


;;; $DF5E: Falling pattern pointers ;;;
ChootFallingPatternDataPointers:
; Last entries are garbage pointers
  .offsets:
    dw ChootFallingPatternData_0_Normal
    dw ChootFallingPatternData_1_Wide
    dw ChootFallingPatternData_2_VeryWide
    dw ChootFallingPatternData_3_Slow
    dw ChootFallingPatternData_4_VerySlow
    dw ChootFallingPatternDataPointers_offsets
  .YDistance:
    dw ChootFallingPatternData_0_Normal_YDistance
    dw ChootFallingPatternData_1_Wide_YDistance
    dw ChootFallingPatternData_2_VeryWide_YDistance
    dw ChootFallingPatternData_3_Slow_YDistance
    dw ChootFallingPatternData_4_VerySlow_YDistance
    dw ChootFallingPatternDataPointers_offsets


;;; $DF76: Initialisation AI - enemy $D3BF (choot) ;;;
InitAI_Choot:
    LDX.W EnemyIndex
    LDA.W #InstList_Choot_Idle
    JSR SetChootInstList
    LDA.W #Function_Choot_WaitForSamusToGetNear : STA.W Choot.function,X
    LDA.W Enemy.XPosition,X : STA.L Choot.spawnXPosition,X
    LDA.W Enemy.YPosition,X : STA.L Choot.spawnYPosition,X
    LDA.W Enemy.init0+1,X : AND.W #$00FF : ASL : TAY
    LDA.W ChootFallingPatternDataPointers_offsets,Y : STA.W Choot.fallingPatternPointer,X
    LDA.W ChootFallingPatternDataPointers_YDistance,Y : TAY
    LDA.W $0000,Y : STA.W Choot.fallingPatternYDistance,X
    JSR CalculateChootJumpHeight
    JSR CalculateChootInitialJumpSpeed
    LDA.B DP_Temp18 ; >_<
    LDA.L Choot.spawnYPosition,X : SEC : SBC.B DP_Temp12 : STA.L Choot.initialFallingYPosition,X
    LDA.L Choot.spawnXPosition,X : STA.L Choot.initialFallingXPosition,X
    LDA.L Choot.initialYSpeedTableIndex,X : STA.W Choot.YSpeedTableIndex,X
    RTL


;;; $DFCE: Calculate choot jump height ;;;
CalculateChootJumpHeight:
;; Returns:
;;     $12: [enemy parameter 1 low] (number of falling pattern loops) * [enemy falling pattern Y distance]
    PHP
    SEP #$20
    LDA.W Enemy.init0,X : STA.W $4202
    LDA.W Choot.fallingPatternYDistance,X : STA.W $4203
    NOP #3
    REP #$20
    LDA.W $4216 : STA.B DP_Temp12
    PLP
    RTS


;;; $DFE9: Calculate initial choot jump speed ;;;
CalculateChootInitialJumpSpeed:
;; Parameters:
;;     $12: Jump height. Unit px

; Calculates the initial quadratic speed table index required to make a jump
    STZ.B DP_Temp14 : STZ.B DP_Temp16 : STZ.B DP_Temp18

  .loop:
    LDA.B DP_Temp18 : CLC : ADC.W #$0200 : STA.B DP_Temp18
    AND.W #$FF00 : XBA : ASL #3 : TAY
    LDA.B DP_Temp14 : CLC : ADC.W CommonEnemySpeeds_QuadraticallyIncreasing,Y : BCC +
    INC.B DP_Temp16

+   STA.B DP_Temp14
    LDA.B DP_Temp16 : CLC : ADC.W CommonEnemySpeeds_QuadraticallyIncreasing+2,Y : STA.B DP_Temp16
    CMP.B DP_Temp12 : BMI .loop
    LDA.B DP_Temp18 : STA.L Choot.initialYSpeedTableIndex,X
    RTS


;;; $E01E: Set choot instruction list ;;;
SetChootInstList:
;; Parameters:
;;     A: Instruction list pointer
    LDX.W EnemyIndex
    STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    RTS


;;; $E02E: Main AI - enemy $D3BF (choot) ;;;
MainAI_Choot:
    LDX.W EnemyIndex
    JSR.W (Choot.function,X)
    RTL


;;; $E035: Choot function - wait for Samus to get near ;;;
Function_Choot_WaitForSamusToGetNear:
    LDX.W EnemyIndex
    LDA.W #$0050
    JSL IsSamusWithinAPixelColumnsOfEnemy
    BEQ .return
    LDA.W Enemy.init1,X : STA.L Choot.jumpDelayTimer,X
    LDA.W #Function_Choot_PrepareToJump : STA.W Choot.function,X

  .return:
    RTS


;;; $E04F: Choot function - prepare to jump ;;;
Function_Choot_PrepareToJump:
    LDX.W EnemyIndex
    LDA.L Choot.jumpDelayTimer,X : DEC : STA.L Choot.jumpDelayTimer,X : BPL .return
    LDA.W #InstList_Choot_Jumping
    JSR SetChootInstList
    LDA.W #Function_Choot_Jumping : STA.W Choot.function,X

  .return:
    RTS


;;; $E06A: Choot function - jumping ;;;
Function_Choot_Jumping:
    LDX.W EnemyIndex
    LDA.W Choot.YSpeedTableIndex,X : AND.W #$FF00 : XBA : ASL #3 : TAY
    LDA.W Enemy.YSubPosition,X : CLC : ADC.W CommonEnemySpeeds_QuadraticallyIncreasing+4,Y : BCC +
    INC.W Enemy.YPosition,X

+   STA.W Enemy.YSubPosition,X
    LDA.W Enemy.YPosition,X : CLC : ADC.W CommonEnemySpeeds_QuadraticallyIncreasing+6,Y : STA.W Enemy.YPosition,X
    LDA.W Choot.YSpeedTableIndex,X : SEC : SBC.W #$0200 : STA.W Choot.YSpeedTableIndex,X : BPL .return
    LDA.L Choot.initialFallingXPosition,X : STA.W Enemy.XPosition,X : STA.L Choot.fallingXOrigin,X
    LDA.L Choot.initialFallingYPosition,X : STA.W Enemy.YPosition,X : STA.L Choot.fallingYOrigin,X
    STZ.W Choot.fallingPatternIndex,X
    LDA.W Enemy.init0,X : AND.W #$00FF : DEC : STA.W Choot.fallingPatternLoopCounter,X
    LDA.W #InstList_Choot_Falling
    JSR SetChootInstList
    LDA.W #Function_Choot_Falling : STA.W Choot.function,X

  .return:
    RTS


;;; $E0CD: Choot function - falling ;;;
Function_Choot_Falling:
    LDX.W EnemyIndex
    LDA.W Choot.fallingPatternIndex,X : AND.W #$FF00 : XBA : ASL #2
    CLC : ADC.W Choot.fallingPatternPointer,X : TAY
    LDA.W $0000,Y : CMP.W #$8000 : BNE +
    LDA.L Choot.fallingYOrigin,X : CLC : ADC.W Choot.fallingPatternYDistance,X : STA.L Choot.fallingYOrigin,X
    STZ.W Choot.fallingPatternIndex,X
    DEC.W Choot.fallingPatternLoopCounter,X : BPL .return
    LDA.L Choot.initialYSpeedTableIndex,X : STA.W Choot.YSpeedTableIndex,X
    LDA.L Choot.spawnXPosition,X : STA.W Enemy.XPosition,X
    STZ.W Enemy.XSubPosition,X
    LDA.L Choot.spawnYPosition,X : STA.W Enemy.YPosition,X
    STZ.W Enemy.YSubPosition,X
    LDA.W #InstList_Choot_Idle
    JSR SetChootInstList
    LDA.W #Function_Choot_WaitForSamusToGetNear : STA.W Choot.function,X
    BRA .return

+   LDA.L Choot.fallingXOrigin,X : CLC : ADC.W $0000,Y : STA.W Enemy.XPosition,X
    LDA.L Choot.fallingYOrigin,X : CLC : ADC.W $0002,Y : STA.W Enemy.YPosition,X
    LDA.W Choot.fallingPatternIndex,X : CLC : ADC.W #$0100 : STA.W Choot.fallingPatternIndex,X

  .return:
    RTS


;;; $E144: RTL ;;;
RTL_A2E144:
    RTL


;;; $E145: RTL ;;;
RTL_A2E145:
    RTL


;;; $E146: Choot spritemaps ;;;
Spritemap_Choot_0:
    dw $0004
    %spritemapEntry(0, $1F0, $FC, 0, 1, 2, 0, $107)
    %spritemapEntry(0, $1F8, $FC, 0, 1, 2, 0, $106)
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 0, $107)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 0, $106)

Spritemap_Choot_1:
    dw $0002
    %spritemapEntry(1, $43F0, $F8, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $4200, $F8, 0, 0, 2, 0, $102)

Spritemap_Choot_2:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 0, $100)

Spritemap_Choot_3:
    dw $0002
    %spritemapEntry(1, $43F0, $F8, 0, 1, 2, 0, $104)
    %spritemapEntry(1, $4200, $F8, 0, 0, 2, 0, $104)


;;; $E17B: Palette - enemy $D3FF (gripper) ;;;
Palette_GRipper:
    dw $3800,$4B9C,$3694,$0929,$0042,$3B18,$2A52,$19AD
    dw $116B,$7F5A,$7EC0,$6DE0,$54E0,$001D,$0014,$000A


;;; $E19B: Instruction list - moving left ;;;
InstList_GRipper_MovingLeft:
    dw $0008,Spritemap_GRipper_Ripper2_MovingLeft_0
    dw $0007,Spritemap_GRipper_Ripper2_MovingLeft_1
    dw $0008,Spritemap_GRipper_Ripper2_MovingLeft_0
    dw $0007,Spritemap_GRipper_Ripper2_MovingLeft_2
    dw Instruction_Common_GotoY
    dw InstList_GRipper_MovingLeft


;;; $E1AF: Instruction list - moving right ;;;
InstList_GRipper_MovingRight:
    dw $0008,Spritemap_GRipper_Ripper2_MovingRight_0
    dw $0007,Spritemap_GRipper_Ripper2_MovingRight_1
    dw $0008,Spritemap_GRipper_Ripper2_MovingRight_0
    dw $0007,Spritemap_GRipper_Ripper2_MovingRight_2
    dw Instruction_Common_GotoY
    dw InstList_GRipper_MovingRight


if !FEATURE_KEEP_UNREFERENCED
;;; $E1C3: Unused. Instruction list - frozen - facing left ;;;
UNUSED_InstList_GRipper_FacingLeft_A2E1C3:
    dw $0010,Spritemap_GRipper_Ripper2_Frozen_FacingLeft
    dw Instruction_Common_GotoY
    dw UNUSED_InstList_GRipper_FacingLeft_A2E1C3


;;; $E1CB: Unused. Instruction list - frozen - facing right ;;;
UNUSED_InstList_GRipper_FacingRight_A2E1CB:
    dw $0010,Spritemap_GRipper_Ripper2_Frozen_FacingRight
    dw Instruction_Common_GotoY
    dw UNUSED_InstList_GRipper_FacingRight_A2E1CB
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $E1D3: Initialisation AI - enemy $D3FF (gripper) ;;;
InitAI_GRipper:
    LDX.W EnemyIndex
    LDA.W Enemy.instList,X : AND.W #$00FF : ASL #3 : STA.W Ripper.XSpeedTableIndex,X
    TAY
    LDA.W Enemy.instList,X : BIT.W #$FEFF : BEQ .negateSpeed
    LDA.W CommonEnemySpeeds_LinearlyIncreasing,Y : STA.W Ripper.XVelocity,X
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+2,Y : STA.W Ripper.XSubVelocity,X
    BRA +

  .negateSpeed:
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+4,Y : STA.W Ripper.XVelocity,X
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+6,Y : STA.W Ripper.XSubVelocity,X

+   LDY.W #InstList_GRipper_MovingLeft
    LDA.W Ripper.XVelocity,X : BMI .setMinMaxX
    LDY.W #InstList_GRipper_MovingRight

  .setMinMaxX:
    TYA : STA.W Enemy.instList,X
    LDA.W Enemy.init0,X : STA.W GRipper.minimumXPosition,X
    LDA.W Enemy.init1,X : STA.W GRipper.maximumXPosition,X
    RTL


;;; $E221: Main AI - enemy $D3FF (gripper) ;;;
MainAI_GRipper:
    LDX.W EnemyIndex
    LDA.W Ripper.XSubVelocity,X : STA.B DP_Temp12
    LDA.W Ripper.XVelocity,X : STA.B DP_Temp14
    JSL MoveEnemyRightBy_14_12_IgnoreSlopes
    BCS .collidedWithWall
    JSR CheckIfGRipperMovedLeftTooFar
    BCS .collidedWithWall
    JSR CheckIfGRipperMovedRightTooFar
    BCS .collidedWithWall
    RTL

  .collidedWithWall:
    LDX.W EnemyIndex
    LDA.W Ripper.XSpeedTableIndex,X : TAY
    LDA.W Ripper.XVelocity,X : BPL .movingLeft
    LDA.W CommonEnemySpeeds_LinearlyIncreasing,Y : STA.W Ripper.XVelocity,X
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+2,Y : STA.W Ripper.XSubVelocity,X
    LDY.W #InstList_GRipper_MovingRight
    BRA .setInstList

  .movingLeft:
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+4,Y : STA.W Ripper.XVelocity,X
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+6,Y : STA.W Ripper.XSubVelocity,X
    LDY.W #InstList_GRipper_MovingLeft

  .setInstList:
    TYA : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    RTL


;;; $E279: Check if moved left too far ;;;
CheckIfGRipperMovedLeftTooFar:
    LDA.W Ripper.XVelocity,X : BPL .notTooFar
    LDA.W Enemy.XPosition,X : CMP.W GRipper.minimumXPosition,X : BPL .notTooFar
    SEC
    RTS

  .notTooFar:
    CLC
    RTS


;;; $E28A: Check if moved right too far ;;;
CheckIfGRipperMovedRightTooFar:
    LDA.W Ripper.XVelocity,X : BMI .notTooFar
    LDA.W Enemy.XPosition,X : CMP.W GRipper.maximumXPosition,X : BMI .notTooFar
    SEC
    RTS

  .notTooFar:
    CLC
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $E29B: Unused. Frozen AI ;;;
UNUSED_FrozenAI_GRipper_A2E29B:
    LDX.W EnemyIndex
    JSL CommonA2_NormalEnemyFrozenAI
    RTL
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $E2A3: RTL ;;;
RTL_A2E2A3:
    RTL


if !FEATURE_KEEP_UNREFERENCED
;;; $E2A4: Unused. Enemy shot ;;;
UNUSED_EnemyShot_A2E2A4:
; Clone of EnemyShot_GRipper_Ripper2
    JSL NormalEnemyShotAI
    LDX.W EnemyIndex
    LDA.W Enemy.freezeTimer,X : BEQ .return
    LDY.W #Spritemap_GRipper_Ripper2_Frozen_FacingLeft
    LDA.W Ripper.XVelocity,X : BMI +
    LDY.W #Spritemap_GRipper_Ripper2_Frozen_FacingRight

+   TYA : STA.W Enemy.spritemap,X

  .return:
    RTL
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $E2C0: Palette - enemy $D43F (ripper ii) ;;;
Palette_Ripper2:
    dw $3800,$021D,$0015,$0008,$0003,$00BD,$0013,$000E
    dw $000B,$17BE,$1A9F,$0C53,$084B,$7EC0,$6DE0,$54E0


;;; $E2E0: Instruction list - moving right ;;;
InstList_Ripper2_MovingRight:
    dw $0008,Spritemap_GRipper_Ripper2_MovingLeft_0
    dw $0007,Spritemap_GRipper_Ripper2_MovingLeft_1
    dw $0008,Spritemap_GRipper_Ripper2_MovingLeft_0
    dw $0007,Spritemap_GRipper_Ripper2_MovingLeft_2
    dw Instruction_Common_GotoY
    dw InstList_Ripper2_MovingRight


;;; $E2F4: Instruction list - moving left ;;;
InstList_Ripper2_MovingLeft:
    dw $0008,Spritemap_GRipper_Ripper2_MovingRight_0
    dw $0007,Spritemap_GRipper_Ripper2_MovingRight_1
    dw $0008,Spritemap_GRipper_Ripper2_MovingRight_0
    dw $0007,Spritemap_GRipper_Ripper2_MovingRight_2
    dw Instruction_Common_GotoY
    dw InstList_Ripper2_MovingLeft


if !FEATURE_KEEP_UNREFERENCED
;;; $E308: Unused. Instruction list - frozen - facing left ;;;
UNUSED_InstList_Ripper2_FacingLeft_A2E308:
    dw $0010,Spritemap_GRipper_Ripper2_Frozen_FacingLeft
    dw Instruction_Common_GotoY
    dw UNUSED_InstList_Ripper2_FacingLeft_A2E308


;;; $E310: Unused. Instruction list - frozen - facing right ;;;
UNUSED_InstList_Ripper2_FacingRight_A2E310:
    dw $0010,Spritemap_GRipper_Ripper2_Frozen_FacingRight
    dw Instruction_Common_GotoY
    dw UNUSED_InstList_Ripper2_FacingRight_A2E310
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $E318: Initialisation AI - enemy $D43F (ripper ii) ;;;
InitAI_Ripper2:
    LDX.W EnemyIndex
    LDY.W #InstList_Ripper2_MovingRight
    LDA.W Enemy.init1,X : BEQ .keepLeft
    LDY.W #InstList_Ripper2_MovingLeft

  .keepLeft:
    TYA : STA.W Enemy.instList,X
    LDA.W Enemy.init0,X : ASL #3 : STA.W Ripper.XSpeedTableIndex,X
    TAY
    LDA.W Enemy.init1,X : BEQ +
    LDA.W CommonEnemySpeeds_LinearlyIncreasing,Y : STA.W Ripper.XVelocity,X
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+2,Y : STA.W Ripper.XSubVelocity,X
    RTL

+   LDA.W CommonEnemySpeeds_LinearlyIncreasing+4,Y
    STA.W Ripper.XVelocity,X
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+6,Y
    STA.W Ripper.XSubVelocity,X
    RTL


;;; $E353: Main AI - enemy $D43F (ripper ii) ;;;
MainAI_Ripper2:
    LDX.W EnemyIndex
    LDA.W Ripper.XSubVelocity,X : STA.B DP_Temp12
    LDA.W Ripper.XVelocity,X : STA.B DP_Temp14
    JSL MoveEnemyRightBy_14_12_IgnoreSlopes
    BCC .return
    LDX.W EnemyIndex
    LDA.W Ripper.XSpeedTableIndex,X : TAY
    LDA.W Ripper.XVelocity,X : BPL .movingLeft
    LDA.W CommonEnemySpeeds_LinearlyIncreasing,Y : STA.W Ripper.XVelocity,X
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+2,Y : STA.W Ripper.XSubVelocity,X
    LDY.W #InstList_Ripper2_MovingLeft
    BRA +

  .movingLeft:
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+4,Y : STA.W Ripper.XVelocity,X
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+6,Y : STA.W Ripper.XSubVelocity,X
    LDY.W #InstList_Ripper2_MovingRight

+   TYA : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X

  .return:
    RTL


if !FEATURE_KEEP_UNREFERENCED
;;; $E3A0: Unused. Frozen AI ;;;
UNUSED_FrozenAI_Ripper2_A2E3A0:
    LDX.W EnemyIndex
    JSL CommonA2_NormalEnemyFrozenAI
    RTL
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $E3A8: RTL ;;;
RTL_A2E3A8:
    RTL


;;; $E3A9: Enemy shot - enemy $D3FF/$D43F (gripper / ripper ii) ;;;
EnemyShot_GRipper_Ripper2:
    JSL NormalEnemyShotAI
    LDX.W EnemyIndex
    LDA.W Enemy.freezeTimer,X : BEQ .return
    LDY.W #Spritemap_GRipper_Ripper2_Frozen_FacingLeft
    LDA.W Ripper.XVelocity,X : BMI .setSpritemap
    LDY.W #Spritemap_GRipper_Ripper2_Frozen_FacingRight

  .setSpritemap:
    TYA : STA.W Enemy.spritemap,X

  .return:
    RTL


;;; $E3C5: Gripper / ripper ii spritemaps ;;;
Spritemap_GRipper_Ripper2_MovingLeft_0:
    dw $0004
    %spritemapEntry(0, $14, $FF, 0, 0, 2, 0, $119)
    %spritemapEntry(0, $0C, $FF, 0, 0, 2, 0, $118)
    %spritemapEntry(0, $1F4, $FD, 0, 0, 2, 0, $114)
    %spritemapEntry(1, $1FC, $F8, 0, 0, 2, 0, $105)

Spritemap_GRipper_Ripper2_MovingLeft_1:
    dw $0003
    %spritemapEntry(0, $0C, $FF, 0, 0, 2, 0, $11A)
    %spritemapEntry(0, $1F4, $FD, 0, 0, 2, 0, $107)
    %spritemapEntry(1, $1FC, $F8, 0, 0, 2, 0, $105)

Spritemap_GRipper_Ripper2_MovingLeft_2:
    dw $0004
    %spritemapEntry(0, $14, $FF, 0, 0, 2, 0, $109)
    %spritemapEntry(0, $0C, $FF, 0, 0, 2, 0, $108)
    %spritemapEntry(0, $1F4, $FD, 0, 0, 2, 0, $117)
    %spritemapEntry(1, $1FC, $F8, 0, 0, 2, 0, $105)

Spritemap_GRipper_Ripper2_MovingRight_0:
    dw $0004
    %spritemapEntry(0, $1E4, $FF, 0, 1, 2, 0, $119)
    %spritemapEntry(0, $1EC, $FF, 0, 1, 2, 0, $118)
    %spritemapEntry(0, $04, $FD, 0, 1, 2, 0, $114)
    %spritemapEntry(1, $1F4, $F8, 0, 1, 2, 0, $105)

Spritemap_GRipper_Ripper2_MovingRight_1:
    dw $0003
    %spritemapEntry(0, $1EC, $FF, 0, 1, 2, 0, $11A)
    %spritemapEntry(0, $04, $FD, 0, 1, 2, 0, $107)
    %spritemapEntry(1, $1F4, $F8, 0, 1, 2, 0, $105)

Spritemap_GRipper_Ripper2_MovingRight_2:
    dw $0004
    %spritemapEntry(0, $1EC, $FF, 0, 1, 2, 0, $108)
    %spritemapEntry(0, $1E4, $FF, 0, 1, 2, 0, $109)
    %spritemapEntry(0, $04, $FD, 0, 1, 2, 0, $117)
    %spritemapEntry(1, $1F4, $F8, 0, 1, 2, 0, $105)

Spritemap_GRipper_Ripper2_Frozen_FacingLeft:
    dw $0002
    %spritemapEntry(0, $1F4, $FD, 0, 0, 2, 0, $114)
    %spritemapEntry(1, $1FC, $F8, 0, 0, 2, 0, $105)

Spritemap_GRipper_Ripper2_Frozen_FacingRight:
    dw $0002
    %spritemapEntry(0, $04, $FD, 0, 1, 2, 0, $114)
    %spritemapEntry(1, $1F4, $F8, 0, 1, 2, 0, $105)


;;; $E457: Palette - enemy $D47F (ripper) ;;;
Palette_Ripper:
    dw $3800,$2F1F,$0932,$006A,$0003,$221C,$19B6,$1551
    dw $10EC,$17BE,$189F,$0C53,$084B,$3BE0,$2680,$1580


;;; $E477: Instruction list - moving right ;;;
InstList_Ripper_MovingRight:
    dw $0008,Spritemap_Ripper_MovingRight_0
    dw $0007,Spritemap_Ripper_MovingRight_1
    dw $0008,Spritemap_Ripper_MovingRight_0
    dw $0007,Spritemap_Ripper_MovingRight_2
    dw Instruction_Common_GotoY
    dw InstList_Ripper_MovingRight


;;; $E48B: Instruction list - moving left ;;;
InstList_Ripper_MovingLeft:
    dw $0008,Spritemap_Ripper_MovingLeft_0
    dw $0007,Spritemap_Ripper_MovingLeft_1
    dw $0008,Spritemap_Ripper_MovingLeft_0
    dw $0007,Spritemap_Ripper_MovingLeft_2
    dw Instruction_Common_GotoY
    dw InstList_Ripper_MovingLeft


;;; $E49F: Initialisation AI - enemy $D47F (ripper) ;;;
InitAI_Ripper:
    LDX.W EnemyIndex
    LDY.W #InstList_Ripper_MovingRight
    LDA.W Enemy.init1,X : BNE .keepRight
    LDY.W #InstList_Ripper_MovingLeft

  .keepRight:
    TYA : STA.W Enemy.instList,X
    LDA.W Enemy.init0,X : ASL #3 : STA.W Ripper.XSpeedTableIndex,X
    TAY
    LDA.W Enemy.init1,X : BEQ +
    LDA.W CommonEnemySpeeds_LinearlyIncreasing,Y : STA.W Ripper.XVelocity,X
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+2,Y : STA.W Ripper.XSubVelocity,X
    RTL

+   LDA.W CommonEnemySpeeds_LinearlyIncreasing+4,Y : STA.W Ripper.XVelocity,X
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+6,Y : STA.W Ripper.XSubVelocity,X
    RTL


;;; $E4DA: Main AI - enemy $D47F (ripper) ;;;
MainAI_Ripper:
    LDX.W EnemyIndex
    LDA.W Ripper.XSubVelocity,X : STA.B DP_Temp12
    LDA.W Ripper.XVelocity,X : STA.B DP_Temp14
    JSL MoveEnemyRightBy_14_12_IgnoreSlopes
    BCC .return
    LDX.W EnemyIndex
    LDA.W Ripper.XSpeedTableIndex,X : TAY
    LDA.W Ripper.XVelocity,X : BPL .movingLeft
    LDA.W CommonEnemySpeeds_LinearlyIncreasing,Y : STA.W Ripper.XVelocity,X
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+2,Y : STA.W Ripper.XSubVelocity,X
    LDY.W #InstList_Ripper_MovingRight
    BRA +

  .movingLeft:
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+4,Y : STA.W Ripper.XVelocity,X
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+6,Y : STA.W Ripper.XSubVelocity,X
    LDY.W #InstList_Ripper_MovingLeft

+   TYA : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X

  .return:
    RTL


;;; $E527: Ripper spritemaps ;;;
Spritemap_Ripper_MovingLeft_0:
    dw $0002
    %spritemapEntry(0, $1F4, $FD, 0, 0, 3, 0, $110)
    %spritemapEntry(1, $43FC, $F8, 0, 0, 3, 0, $101)

Spritemap_Ripper_MovingLeft_1:
    dw $0002
    %spritemapEntry(0, $1F4, $FD, 0, 0, 3, 0, $113)
    %spritemapEntry(1, $43FC, $F8, 0, 0, 3, 0, $101)

Spritemap_Ripper_MovingLeft_2:
    dw $0002
    %spritemapEntry(0, $1F4, $FD, 0, 0, 3, 0, $103)
    %spritemapEntry(1, $43FC, $F8, 0, 0, 3, 0, $101)

Spritemap_Ripper_MovingRight_0:
    dw $0002
    %spritemapEntry(0, $04, $FD, 0, 1, 3, 0, $110)
    %spritemapEntry(1, $43F4, $F8, 0, 1, 3, 0, $101)

Spritemap_Ripper_MovingRight_1:
    dw $0002
    %spritemapEntry(0, $04, $FD, 0, 1, 3, 0, $103)
    %spritemapEntry(1, $43F4, $F8, 0, 1, 3, 0, $101)

Spritemap_Ripper_MovingRight_2:
    dw $0002
    %spritemapEntry(0, $04, $FD, 0, 1, 3, 0, $113)
    %spritemapEntry(1, $43F4, $F8, 0, 1, 3, 0, $101)


;;; $E56F: Unused. Ripper spritemap pointers ;;;
SpritemapPointers_Ripper:
    dw Spritemap_Ripper_MovingLeft_0
    dw Spritemap_Ripper_MovingLeft_1
    dw Spritemap_Ripper_MovingLeft_2
    dw Spritemap_Ripper_MovingRight_0
    dw Spritemap_Ripper_MovingRight_1
    dw Spritemap_Ripper_MovingRight_2


;;; $E57B: Palette - enemy $D4BF (dragon) ;;;
Palette_Dragon:
    dw $3800,$02FF,$01BF,$000F,$0008,$01BF,$011B,$00BA
    dw $0011,$5A5C,$41B4,$290D,$1065,$03FF,$0237,$00D1


;;; $E59B: Instruction list - idle - facing left ;;;
InstList_Dragon_Idle_FacingLeft:
    dw $0001,Spritemap_Dragon_0
    dw Instruction_Common_Sleep


;;; $E5A1: Instruction list - wings - facing left ;;;
InstList_Dragon_Wings_FacingLeft:
    dw $0005,Spritemap_Dragon_4
    dw $0005,Spritemap_Dragon_5
    dw Instruction_Common_GotoY
    dw InstList_Dragon_Wings_FacingLeft


;;; $E5AD: Instruction list - idle - facing right ;;;
InstList_Dragon_Idle_FacingRight:
    dw $0001,Spritemap_Dragon_6
    dw Instruction_Common_Sleep


;;; $E5B3: Instruction list - wings - facing right ;;;
InstList_Dragon_Wings_FacingRight:
    dw $0005,Spritemap_Dragon_A
    dw $0005,Spritemap_Dragon_B
    dw Instruction_Common_GotoY
    dw InstList_Dragon_Wings_FacingRight


;;; $E5BF: Instruction list - attacking - facing left ;;;
InstList_Dragon_Attacking_FacingLeft:
    dw $0020,Spritemap_Dragon_1
    dw $0003,Spritemap_Dragon_2
    dw $0007,Spritemap_Dragon_3
    dw $0003,Spritemap_Dragon_2
    dw $0001,Spritemap_Dragon_1
    dw Instruction_Dragon_SetAnimationFinishedFlag
    dw Instruction_Common_Sleep


;;; $E5D7: Instruction list - attacking - facing right ;;;
InstList_Dragon_Attacking_FacingRight:
    dw $0020,Spritemap_Dragon_7
    dw $0003,Spritemap_Dragon_8
    dw $0007,Spritemap_Dragon_9
    dw $0003,Spritemap_Dragon_8
    dw $0001,Spritemap_Dragon_7
    dw Instruction_Dragon_SetAnimationFinishedFlag
    dw Instruction_Common_Sleep


;;; $E5EF: Instruction list pointers ;;;
InstListPointers_Dragon:
    dw InstList_Dragon_Idle_FacingLeft
    dw InstList_Dragon_Idle_FacingRight
    dw InstList_Dragon_Wings_FacingLeft
    dw InstList_Dragon_Wings_FacingRight
    dw InstList_Dragon_Attacking_FacingLeft
    dw InstList_Dragon_Attacking_FacingRight


;;; $E5FB: Instruction - set animation finished flag ;;;
Instruction_Dragon_SetAnimationFinishedFlag:
    LDX.W EnemyIndex
    LDA.W #$0001 : STA.L Dragon.animationFinishedFlag,X
    RTL


;;; $E606: Initialisation AI - enemy $D4BF (dragon) ;;;
InitAI_Dragon:
    LDX.W EnemyIndex
    LDA.W #$0000 : STA.L Dragon.animationFinishedFlag,X
    LDA.W Enemy.init0,X : BEQ .idle
    LDA.W #$0002 : STA.L Dragon.newInstListIndex,X : STA.L Dragon.instListIndex,X
    LDA.W #InstList_Dragon_Wings_FacingLeft : STA.W Enemy.instList,X
    LDA.W Enemy.properties,X : ORA.W #$0400 : STA.W Enemy.properties,X
    LDA.W #RTL_A2E781 : STA.W Dragon.function,X
    RTL

  .idle:
    LDA.W #$0000 : STA.L Dragon.newInstListIndex,X : STA.L Dragon.instListIndex,X
    LDA.W #InstList_Dragon_Idle_FacingLeft : STA.W Enemy.instList,X
    LDA.W #Function_Dragon_WaitToRise : STA.W Dragon.function,X
    RTL


;;; $E64E: Main AI - enemy $D4BF (dragon) ;;;
MainAI_Dragon:
    LDX.W EnemyIndex
    JMP.W (Dragon.function,X)


;;; $E654: Dragon function - wait to rise ;;;
Function_Dragon_WaitToRise:
; The comparison done at $E666..79 is crazy overengineered
    DEC.W Dragon.functionTimer,X : BMI .timerExpired
    RTL

  .timerExpired:
    LDA.W #$0030 : STA.W Dragon.functionTimer,X
    LDA.W #Function_Dragon_Rising : STA.W Dragon.function,X
    JSL Get_SamusX_minus_EnemyX
    TAY
    ROL.W Enemy.var0,X
    ROL
    ROR.W Enemy.var0,X
    TYA
    SEP #$20
    BIT.W Enemy.var0+1,X : BMI .facingLeft
    LDA.L Dragon.newInstListIndex,X : ORA.B #$01 : STA.L Dragon.newInstListIndex,X
    LDA.L Dragon.newInstListIndex+$40,X : ORA.B #$01 : STA.L Dragon.newInstListIndex+$40,X
    BRA +

  .facingLeft:
    LDA.L Dragon.newInstListIndex,X : AND.B #$FE : STA.L Dragon.newInstListIndex,X
    LDA.L Dragon.newInstListIndex+$40,X : AND.B #$FE : STA.L Dragon.newInstListIndex+$40,X

+   REP #$20
    JSR SetDragonInstList
    JSR SetDragonWingsInstList
    RTL


;;; $E6AD: Dragon function - rising ;;;
Function_Dragon_Rising:
    DEC.W Dragon.functionTimer,X : BPL .timerNotExpired
    LDA.L Dragon.newInstListIndex,X : CLC : ADC.W #$0004 : STA.L Dragon.newInstListIndex,X
    LDA.W #$0003 : STA.W Dragon.functionTimer,X
    LDA.W #Function_Dragon_Attacking : STA.W Dragon.function,X

  .timerNotExpired:
    LDA.W Enemy.YSubPosition,X : SEC : SBC.W #$0000 : STA.W Enemy.YSubPosition,X
    LDA.W Enemy.YPosition,X : SBC.W #$0001 : STA.W Enemy.YPosition,X
    LDA.W Enemy[1].YSubPosition,X : SEC : SBC.W #$0000 : STA.W Enemy[1].YSubPosition,X
    LDA.W Enemy[1].YPosition,X : SBC.W #$0001 : STA.W Enemy[1].YPosition,X
    RTL


;;; $E6F1: Dragon function - attacking ;;;
Function_Dragon_Attacking:
    JSR SetDragonInstList
    LDA.L Dragon.animationFinishedFlag,X : BEQ .return
    LDA.W #$0000 : STA.L Dragon.animationFinishedFlag,X
    LDA.W #$FFFF : STA.L Dragon.instListIndex,X
    LDY.W #EnemyProjectile_DragonFireball
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    LDA.W #$0061
    JSL QueueSound_Lib2_Max6
    DEC.W Dragon.attackCounter,X : BNE .return
    LDA.L Dragon.newInstListIndex,X : SEC : SBC.W #$0004 : STA.L Dragon.newInstListIndex,X
    LDA.W #$0060 : STA.W Dragon.functionTimer,X
    LDA.W #Function_Dragon_WaitToSink : STA.W Dragon.function,X

  .return:
    RTL


;;; $E734: Dragon function - wait to sink ;;;
Function_Dragon_WaitToSink:
    DEC.W Dragon.functionTimer,X : BNE .return
    LDA.W #$0030 : STA.W Dragon.functionTimer,X
    LDA.W #Function_Dragon_Sinking : STA.W Dragon.function,X
    JSR SetDragonInstList

  .return:
    RTL


;;; $E749: Dragon function - sinking ;;;
Function_Dragon_Sinking:
    DEC.W Dragon.functionTimer,X : BPL .timerNotExpired
    LDA.W #$0080 : STA.W Dragon.functionTimer,X
    LDA.W #Function_Dragon_WaitToRise : STA.W Dragon.function,X

  .timerNotExpired:
    LDA.W Enemy.YSubPosition,X : CLC : ADC.W #$0000 : STA.W Enemy.YSubPosition,X
    LDA.W Enemy.YPosition,X : ADC.W #$0001 : STA.W Enemy.YPosition,X
    LDA.W Enemy[1].YSubPosition,X : CLC : ADC.W #$0000 : STA.W Enemy[1].YSubPosition,X
    LDA.W Enemy[1].YPosition,X : ADC.W #$0001 : STA.W Enemy[1].YPosition,X
    RTL


;;; $E781: RTL ;;;
RTL_A2E781:
    RTL


;;; $E782: Set dragon instruction list ;;;
SetDragonInstList:
    LDX.W EnemyIndex
    LDA.L Dragon.newInstListIndex,X : CMP.L Dragon.instListIndex,X : BEQ .return
    STA.L Dragon.instListIndex,X
    ASL : TAY
    LDA.W InstListPointers_Dragon,Y : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X

  .return:
    RTS


;;; $E7A5: Set dragon wings instruction list ;;;
SetDragonWingsInstList:
    LDX.W EnemyIndex
    LDA.L Dragon.newInstListIndex+$40,X : CMP.L Dragon.instListIndex+$40,X : BEQ .return
    STA.L Dragon.instListIndex+$40,X
    ASL : TAY
    LDA.W InstListPointers_Dragon,Y : STA.W Enemy[1].instList,X
    LDA.W #$0001 : STA.W Enemy[1].instTimer,X
    STZ.W Enemy[1].loopCounter,X

  .return:
    RTS


;;; $E7C8: Enemy touch - enemy $D4BF (dragon) ;;;
EnemyTouch_Dragon:
    JSL CommonA2_NormalEnemyTouchAI
    BRA ContactReaction_Dragon_Common


;;; $E7CE: Enemy shot - enemy $D4BF (dragon) ;;;
EnemyShot_Dragon:
    JSL CommonA2_NormalEnemyShotAI
    BRA ContactReaction_Dragon_Common


;;; $E7D4: Power bomb reaction - enemy $D4BF (dragon) ;;;
PowerBombReaction_Dragon:
    JSL CommonA2_NormalEnemyPowerBombAI
    BRA ContactReaction_Dragon_Common ; >.<


;;; $E7DA: Dragon reaction ;;;
ContactReaction_Dragon_Common:
    LDX.W EnemyIndex
    LDA.W Enemy.health,X : BNE .notDead
    LDA.W Enemy[1].properties,X : ORA.W #$0200 : STA.W Enemy[1].properties,X
    BRA .return

  .notDead:
    LDA.W Enemy.shakeTimer,X : STA.W Enemy[1].shakeTimer,X
    LDA.W Enemy.invincibilityTimer,X : STA.W Enemy[1].invincibilityTimer,X
    LDA.W Enemy.flashTimer,X : STA.W Enemy[1].flashTimer,X
    LDA.W Enemy.freezeTimer,X : STA.W Enemy[1].freezeTimer,X
    LDA.W Enemy.AI,X : STA.W Enemy[1].AI,X

  .return:
    RTL


;;; $E80C: Dragon spritemaps ;;;
Spritemap_Dragon_0:
    dw $0008
    %spritemapEntry(0, $08, $04, 0, 0, 2, 0, $11C)
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 0, $10C)
    %spritemapEntry(0, $1F0, $EC, 0, 0, 2, 0, $110)
    %spritemapEntry(0, $00, $04, 0, 0, 2, 0, $11D)
    %spritemapEntry(0, $1F8, $04, 0, 0, 2, 0, $10D)
    %spritemapEntry(1, $1F9, $0C, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $1F8, $F4, 0, 0, 2, 0, $10A)
    %spritemapEntry(1, $1F8, $E4, 0, 0, 2, 0, $101)

Spritemap_Dragon_1:
    dw $0008
    %spritemapEntry(0, $1F0, $E4, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $1F8, $E4, 0, 0, 2, 0, $103)
    %spritemapEntry(0, $08, $04, 0, 0, 2, 0, $11C)
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 0, $10C)
    %spritemapEntry(0, $00, $04, 0, 0, 2, 0, $11D)
    %spritemapEntry(0, $1F8, $04, 0, 0, 2, 0, $10D)
    %spritemapEntry(1, $1F9, $0C, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $1F8, $F4, 0, 0, 2, 0, $10A)

Spritemap_Dragon_2:
    dw $0008
    %spritemapEntry(0, $1F0, $E5, 0, 0, 2, 0, $105)
    %spritemapEntry(1, $1F8, $E4, 0, 0, 2, 0, $106)
    %spritemapEntry(0, $08, $04, 0, 0, 2, 0, $11C)
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 0, $10C)
    %spritemapEntry(0, $00, $04, 0, 0, 2, 0, $11D)
    %spritemapEntry(0, $1F8, $04, 0, 0, 2, 0, $10D)
    %spritemapEntry(1, $1F9, $0C, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $1F8, $F4, 0, 0, 2, 0, $10A)

Spritemap_Dragon_3:
    dw $0008
    %spritemapEntry(0, $1F0, $E5, 0, 0, 2, 0, $115)
    %spritemapEntry(1, $1F8, $E4, 0, 0, 2, 0, $108)
    %spritemapEntry(0, $08, $04, 0, 0, 2, 0, $11C)
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 0, $10C)
    %spritemapEntry(0, $00, $04, 0, 0, 2, 0, $11D)
    %spritemapEntry(0, $1F8, $04, 0, 0, 2, 0, $10D)
    %spritemapEntry(1, $1F9, $0C, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $1F8, $F4, 0, 0, 2, 0, $10A)

Spritemap_Dragon_4:
    dw $0001
    %spritemapEntry(0, $04, $F4, 0, 0, 2, 0, $120)

Spritemap_Dragon_5:
    dw $0001
    %spritemapEntry(0, $04, $F4, 0, 0, 2, 0, $121)

Spritemap_Dragon_6:
    dw $0008
    %spritemapEntry(0, $1F0, $04, 0, 1, 2, 0, $11C)
    %spritemapEntry(0, $1F0, $FC, 0, 1, 2, 0, $10C)
    %spritemapEntry(0, $08, $EC, 0, 1, 2, 0, $110)
    %spritemapEntry(0, $1F8, $04, 0, 1, 2, 0, $11D)
    %spritemapEntry(0, $00, $04, 0, 1, 2, 0, $10D)
    %spritemapEntry(1, $1F7, $0C, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $1F8, $F4, 0, 1, 2, 0, $10A)
    %spritemapEntry(1, $1F8, $E4, 0, 1, 2, 0, $101)

Spritemap_Dragon_7:
    dw $0008
    %spritemapEntry(0, $08, $E4, 0, 1, 2, 0, $100)
    %spritemapEntry(1, $1F8, $E4, 0, 1, 2, 0, $103)
    %spritemapEntry(0, $1F0, $04, 0, 1, 2, 0, $11C)
    %spritemapEntry(0, $1F0, $FC, 0, 1, 2, 0, $10C)
    %spritemapEntry(0, $1F8, $04, 0, 1, 2, 0, $11D)
    %spritemapEntry(0, $00, $04, 0, 1, 2, 0, $10D)
    %spritemapEntry(1, $1F7, $0C, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $1F8, $F4, 0, 1, 2, 0, $10A)

Spritemap_Dragon_8:
    dw $0008
    %spritemapEntry(0, $08, $E5, 0, 1, 2, 0, $105)
    %spritemapEntry(1, $1F8, $E4, 0, 1, 2, 0, $106)
    %spritemapEntry(0, $1F0, $04, 0, 1, 2, 0, $11C)
    %spritemapEntry(0, $1F0, $FC, 0, 1, 2, 0, $10C)
    %spritemapEntry(0, $1F8, $04, 0, 1, 2, 0, $11D)
    %spritemapEntry(0, $00, $04, 0, 1, 2, 0, $10D)
    %spritemapEntry(1, $1F7, $0C, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $1F8, $F4, 0, 1, 2, 0, $10A)

Spritemap_Dragon_9:
    dw $0008
    %spritemapEntry(0, $08, $E5, 0, 1, 2, 0, $115)
    %spritemapEntry(1, $1F8, $E4, 0, 1, 2, 0, $108)
    %spritemapEntry(0, $1F0, $04, 0, 1, 2, 0, $11C)
    %spritemapEntry(0, $1F0, $FC, 0, 1, 2, 0, $10C)
    %spritemapEntry(0, $1F8, $04, 0, 1, 2, 0, $11D)
    %spritemapEntry(0, $00, $04, 0, 1, 2, 0, $10D)
    %spritemapEntry(1, $1F7, $0C, 0, 1, 2, 0, $10E)
    %spritemapEntry(1, $1F8, $F4, 0, 1, 2, 0, $10A)

Spritemap_Dragon_A:
    dw $0001
    %spritemapEntry(0, $1F4, $F4, 0, 1, 2, 0, $120)

Spritemap_Dragon_B:
    dw $0001
    %spritemapEntry(0, $1F4, $F4, 0, 1, 2, 0, $121)


;;; $E978: Palette - enemy $D4FF/$D53F/$D57F/$D5BF (shutters) ;;;
Palette_Shutters:
    dw $3800,$4D1F,$38B6,$246E,$1448,$47FF,$2EFA,$1616
    dw $0132,$6F39,$5A73,$41AD,$2D08,$1863,$7FFF,$0041


;;; $E998: Instruction list - shutter - growth level 0 ;;;
InstList_Shutter_GrowthLevel0:
    dw $0001,Spritemap_Shutters_10px
    dw Instruction_Common_Sleep


;;; $E99E: Instruction list - shutter - growth level 1 ;;;
InstList_Shutter_GrowthLevel1:
    dw $0001,Spritemap_Shutters_20px
    dw Instruction_Common_Sleep


;;; $E9A4: Instruction list - shutter - growth level 2 ;;;
InstList_Shutter_GrowthLevel2:
    dw $0001,Spritemap_Shutters_30px
    dw Instruction_Common_Sleep


;;; $E9AA: Instruction list - shutter - growth level 3 ;;;
InstList_Shutter_GrowthLevel3:
    dw $0001,Spritemap_Shutters_40px
    dw Instruction_Common_Sleep


if !FEATURE_KEEP_UNREFERENCED
;;; $E9B0: Unused. Instruction list - shrinking loop ;;;
UNUSED_InstList_Shutter_ShrinkingLoop_A2E9B0:
; Debug/demo use probably
; Goes through all the vertical shutter spritemaps, including 8px offset sizes that are otherwise unused
    dw $0004,Spritemap_Shutters_40px
    dw $0004,UNUSED_Spritemap_Shutters_38px_A2ED85
    dw $0004,Spritemap_Shutters_30px
    dw $0004,UNUSED_Spritemap_Shutters_28px_A2ED63
    dw $0004,Spritemap_Shutters_20px
    dw $0004,UNUSED_Spritemap_Shutters_18px_A2ED4B
    dw $0004,Spritemap_Shutters_10px
    dw $0004,UNUSED_Spritemap_Shutters_8px_A2ED38
    dw Instruction_Common_GotoY
    dw UNUSED_InstList_Shutter_ShrinkingLoop_A2E9B0
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $E9D4: Instruction list - horizontal shutter ;;;
InstList_ShutterHorizontal:
    dw $0001,Spritemap_Shutters_Horizontal
    dw Instruction_Common_Sleep


;;; $E9DA: Initialisation AI - enemy $D4FF (growing shutter) ;;;
InitAI_ShutterGrowing:
    LDX.W EnemyIndex
    LDA.W Enemy.properties2,X : ASL : CLC : ADC.W Enemy.instList,X
    ASL : TAY
    LDA.W .functionPointers,Y : STA.W ShutterGrowing.function,X
    LDA.W Enemy.properties2,X : BEQ .movingDown
    LDA.W Enemy.YPosition,X : STA.W ShutterGrowing.growthLevel0YPosition,X
    SEC : SBC.W #$0008 : STA.W ShutterGrowing.growthLevel1YPosition,X
    SEC : SBC.W #$0008 : STA.W ShutterGrowing.growthLevel2YPosition,X
    SEC : SBC.W #$0008 : STA.W ShutterGrowing.growthLevel3YPosition,X
    BRA +

  .movingDown:
    LDA.W Enemy.YPosition,X : STA.W ShutterGrowing.growthLevel0YPosition,X
    CLC : ADC.W #$0008 : STA.W ShutterGrowing.growthLevel1YPosition,X
    CLC : ADC.W #$0008 : STA.W ShutterGrowing.growthLevel2YPosition,X
    CLC : ADC.W #$0008 : STA.W ShutterGrowing.growthLevel3YPosition,X

+   STZ.W Enemy.properties2,X : STZ.W ShutterGrowing.growthLevel,X
    LDA.W #InstList_Shutter_GrowthLevel0 : STA.W Enemy.instList,X
    LDA.W Enemy.init1,X : AND.W #$00FF : ASL #2 : TAY
    LDA.W .YSpeed,Y : STA.L ShutterGrowing.YSpeed,X
    LDA.W .YSubSpeed,Y : STA.L ShutterGrowing.YSubSpeed,X
    RTL

  .functionPointers:
    dw Function_ShutterGrowing_Initial_Downwards_WaitForTimer
    dw Func_ShutterGrowing_Initial_Downwards_WaitForSamusToGetNear
    dw Function_ShutterGrowing_Initial_Upwards_WaitForTimer
    dw Func_ShutterGrowing_Initial_Upwards_WaitForSamusToGetNear

  .YSpeed:
    dw $0000
  .YSubSpeed:
    dw       $1000, $0000,$2000, $0000,$3000, $0000,$4000
    dw $0000,$5000, $0000,$6000, $0000,$7000, $0000,$8000
    dw $0000,$9000, $0000,$A000, $0000,$B000, $0000,$C000
    dw $0000,$D000, $0000,$E000, $0000,$F000, $0001,$0000
    dw $0001,$1000, $0001,$2000, $0001,$3000, $0001,$4000
    dw $0001,$5000, $0001,$6000, $0001,$7000, $0001,$8000


;;; $EAB6: Main AI - enemy $D4FF (growing shutter) ;;;
MainAI_ShutterGrowing:
    LDX.W EnemyIndex
    JSR.W (ShutterGrowing.function,X)
    RTL


;;; $EABD: Growing shutter function - initial - upwards - wait for timer ;;;
Function_ShutterGrowing_Initial_Upwards_WaitForTimer:
    LDA.W Enemy.init0,X : BEQ +
    DEC : STA.W Enemy.init0,X
    RTS

+   JSR PlayGateOpeningClosingSFXIfOnScreen
    LDA.W #Function_ShutterGrowing_Growing_Upwards : STA.W ShutterGrowing.function,X
    RTS


;;; $EAD1: Growing shutter function - initial - upwards - wait for Samus to get near ;;;
Func_ShutterGrowing_Initial_Upwards_WaitForSamusToGetNear:
    LDA.W Enemy.init0,X
    JSL IsSamusWithinAPixelColumnsOfEnemy
    AND.W #$FFFF : BEQ .return
    JSR PlayGateOpeningClosingSFXIfOnScreen
    LDA.W #Function_ShutterGrowing_Growing_Upwards : STA.W ShutterGrowing.function,X

  .return:
    RTS


;;; $EAE7: Growing shutter function - initial - downwards - wait for Samus to get near ;;;
Func_ShutterGrowing_Initial_Downwards_WaitForSamusToGetNear:
    LDA.W Enemy.init0,X
    JSL IsSamusWithinAPixelColumnsOfEnemy
    AND.W #$FFFF : BEQ .return
    JSR PlayGateOpeningClosingSFXIfOnScreen
    LDA.W #Function_ShutterGrowing_Growing_Downwards : STA.W ShutterGrowing.function,X

  .return:
    RTS


;;; $EAFD: Growing shutter function - initial - downwards - wait for timer ;;;
Function_ShutterGrowing_Initial_Downwards_WaitForTimer:
    LDA.W Enemy.init0,X : BEQ +
    DEC : STA.W Enemy.init0,X
    RTS

+   JSR PlayGateOpeningClosingSFXIfOnScreen
    LDA.W #Function_ShutterGrowing_Growing_Downwards : STA.W ShutterGrowing.function,X
    RTS


;;; $EB11: Growing shutter function - growing - downwards ;;;
Function_ShutterGrowing_Growing_Downwards:
    LDA.W ShutterGrowing.growthLevel,X : ASL : TAX
    JSR.W (.pointers,X)
    RTS

  .pointers:
    dw Function_ShutterGrowing_Growing_Downwards_GrowthLevel0
    dw Function_ShutterGrowing_Growing_Downwards_GrowthLevel1
    dw Function_ShutterGrowing_Growing_Downwards_GrowthLevel2
    dw Function_ShutterGrowing_Growing_Downwards_GrowthLevel3
    dw RTS_A2EB24


;;; $EB24: RTS ;;;
RTS_A2EB24:
    RTS


;;; $EB25: Growing shutter growing function - downwards - growth level 0 ;;;
Function_ShutterGrowing_Growing_Downwards_GrowthLevel0:
    LDX.W EnemyIndex
    LDA.W Enemy.YSubPosition,X : CLC : ADC.L ShutterGrowing.YSubSpeed,X : STA.W Enemy.YSubPosition,X
    LDA.W Enemy.YPosition,X : ADC.L ShutterGrowing.YSpeed,X : STA.W Enemy.YPosition,X
    LDA.W ShutterGrowing.growthLevel0YPosition,X : CLC : ADC.W #$0010 : CMP.W Enemy.YPosition,X : BPL .return
    SEC : SBC.W #$0007 : STA.W Enemy.YPosition,X
    INC.W ShutterGrowing.growthLevel,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDA.W #InstList_Shutter_GrowthLevel1 : STA.W Enemy.instList,X
    LDA.W #$0010 : STA.W Enemy.YHitboxRadius,X

  .return:
    RTS


;;; $EB66: Growing shutter growing function - downwards - growth level 1 ;;;
Function_ShutterGrowing_Growing_Downwards_GrowthLevel1:
    LDX.W EnemyIndex
    LDA.W Enemy.YSubPosition,X : CLC : ADC.L ShutterGrowing.YSubSpeed,X : STA.W Enemy.YSubPosition,X
    LDA.W Enemy.YPosition,X : ADC.L ShutterGrowing.YSpeed,X : STA.W Enemy.YPosition,X
    LDA.W ShutterGrowing.growthLevel1YPosition,X : CLC : ADC.W #$0010 : CMP.W Enemy.YPosition,X : BPL .return
    SEC : SBC.W #$0007 : STA.W Enemy.YPosition,X
    INC.W ShutterGrowing.growthLevel,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDA.W #InstList_Shutter_GrowthLevel2 : STA.W Enemy.instList,X
    LDA.W #$0018 : STA.W Enemy.YHitboxRadius,X

  .return:
    RTS


;;; $EBA7: Growing shutter growing function - downwards - growth level 2 ;;;
Function_ShutterGrowing_Growing_Downwards_GrowthLevel2:
    LDX.W EnemyIndex
    LDA.W Enemy.YSubPosition,X : CLC : ADC.L ShutterGrowing.YSubSpeed,X : STA.W Enemy.YSubPosition,X
    LDA.W Enemy.YPosition,X : ADC.L ShutterGrowing.YSpeed,X : STA.W Enemy.YPosition,X
    LDA.W ShutterGrowing.growthLevel2YPosition,X : CLC : ADC.W #$0010 : CMP.W Enemy.YPosition,X : BPL .return
    SEC : SBC.W #$0007 : STA.W Enemy.YPosition,X
    INC.W ShutterGrowing.growthLevel,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDA.W #InstList_Shutter_GrowthLevel3 : STA.W Enemy.instList,X
    LDA.W #$0020 : STA.W Enemy.YHitboxRadius,X

  .return:
    RTS


;;; $EBE8: Growing shutter growing function - downwards - growth level 3 ;;;
Function_ShutterGrowing_Growing_Downwards_GrowthLevel3:
    LDX.W EnemyIndex
    LDA.W Enemy.YSubPosition,X : CLC : ADC.L ShutterGrowing.YSubSpeed,X : STA.W Enemy.YSubPosition,X
    LDA.W Enemy.YPosition,X : ADC.L ShutterGrowing.YSpeed,X : STA.W Enemy.YPosition,X
    LDA.W ShutterGrowing.growthLevel3YPosition,X : CLC : ADC.W #$0010 : CMP.W Enemy.YPosition,X : BPL .return
    STA.W Enemy.YPosition,X
    INC.W ShutterGrowing.growthLevel,X

  .return:
    RTS


;;; $EC13: Growing shutter function - growing - upwards ;;;
Function_ShutterGrowing_Growing_Upwards:
    LDA.W Enemy.YPosition,X : STA.L ShutterGrowing.previousYPosition,X
    LDA.W ShutterGrowing.growthLevel,X : ASL : TAX
    JSR.W (.pointers,X)
    JSL CheckIfEnemyIsTouchingSamusFromBelow
    BEQ .return
    LDA.W Enemy.YPosition,X : SEC : SBC.L ShutterGrowing.previousYPosition,X : BPL .return
    CLC : ADC.W ExtraSamusYDisplacement : STA.W ExtraSamusYDisplacement

  .return:
    RTS

  .pointers:
    dw Function_ShutterGrowing_Growing_Upwards_GrowthLevel0
    dw Function_ShutterGrowing_Growing_Upwards_GrowthLevel1
    dw Function_ShutterGrowing_Growing_Upwards_GrowthLevel2
    dw Function_ShutterGrowing_Growing_Upwards_GrowthLevel3
    dw RTS_A2EC44


;;; $EC44: RTS ;;;
RTS_A2EC44:
    RTS


;;; $EC45: Growing shutter growing function - upwards - growth level 0 ;;;
Function_ShutterGrowing_Growing_Upwards_GrowthLevel0:
    LDX.W EnemyIndex
    LDA.W Enemy.YSubPosition,X : SEC : SBC.L ShutterGrowing.YSubSpeed,X : STA.W Enemy.YSubPosition,X
    LDA.W Enemy.YPosition,X : SBC.L ShutterGrowing.YSpeed,X : STA.W Enemy.YPosition,X
    LDA.W ShutterGrowing.growthLevel0YPosition,X : SEC : SBC.W #$0010 : CMP.W Enemy.YPosition,X : BMI .return
    CLC : ADC.W #$0007 : STA.W Enemy.YPosition,X
    INC.W ShutterGrowing.growthLevel,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDA.W #InstList_Shutter_GrowthLevel1 : STA.W Enemy.instList,X
    LDA.W #$0010 : STA.W Enemy.YHitboxRadius,X

  .return:
    RTS


;;; $EC86: Growing shutter growing function - upwards - growth level 1 ;;;
Function_ShutterGrowing_Growing_Upwards_GrowthLevel1:
    LDX.W EnemyIndex
    LDA.W Enemy.YSubPosition,X : SEC : SBC.L ShutterGrowing.YSubSpeed,X : STA.W Enemy.YSubPosition,X
    LDA.W Enemy.YPosition,X : SBC.L ShutterGrowing.YSpeed,X : STA.W Enemy.YPosition,X
    LDA.W ShutterGrowing.growthLevel1YPosition,X : SEC : SBC.W #$0010 : CMP.W Enemy.YPosition,X : BMI .return
    CLC : ADC.W #$0007 : STA.W Enemy.YPosition,X
    INC.W ShutterGrowing.growthLevel,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDA.W #InstList_Shutter_GrowthLevel2 : STA.W Enemy.instList,X
    LDA.W #$0018 : STA.W Enemy.YHitboxRadius,X

  .return:
    RTS


;;; $ECC7: Growing shutter growing function - upwards - growth level 2 ;;;
Function_ShutterGrowing_Growing_Upwards_GrowthLevel2:
    LDX.W EnemyIndex
    LDA.W Enemy.YSubPosition,X : SEC : SBC.L ShutterGrowing.YSubSpeed,X : STA.W Enemy.YSubPosition,X
    LDA.W Enemy.YPosition,X : SBC.L ShutterGrowing.YSpeed,X : STA.W Enemy.YPosition,X
    LDA.W ShutterGrowing.growthLevel2YPosition,X : SEC : SBC.W #$0010 : CMP.W Enemy.YPosition,X : BMI .return
    CLC : ADC.W #$0007 : STA.W Enemy.YPosition,X
    INC.W ShutterGrowing.growthLevel,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDA.W #InstList_Shutter_GrowthLevel3 : STA.W Enemy.instList,X
    LDA.W #$0020 : STA.W Enemy.YHitboxRadius,X

  .return:
    RTS


;;; $ED08: Growing shutter growing function - upwards - growth level 3 ;;;
Function_ShutterGrowing_Growing_Upwards_GrowthLevel3:
    LDX.W EnemyIndex
    LDA.W Enemy.YSubPosition,X : SEC : SBC.L ShutterGrowing.YSubSpeed,X : STA.W Enemy.YSubPosition,X
    LDA.W Enemy.YPosition,X : SBC.L ShutterGrowing.YSpeed,X : STA.W Enemy.YPosition,X
    LDA.W ShutterGrowing.growthLevel3YPosition,X : SEC : SBC.W #$0010 : CMP.W Enemy.YPosition,X : BMI .return
    STA.W Enemy.YPosition,X
    INC.W ShutterGrowing.growthLevel,X

  .return:
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $ED33: Unused. A = 5 ;;;
UNUSED_Load5_A2ED33:
    LDA.W #$0005
    RTL
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $ED37: RTL ;;;
RTL_A2ED37:
    RTL


;;; $ED38: Shutters spritemaps ;;;
if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Shutters_8px_A2ED38:
    dw $0002
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 0, $101)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 0, $100)
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_Shutters_10px:
    dw $0001
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 0, $100)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Shutters_18px_A2ED4B:
    dw $0002
    %spritemapEntry(1, $43F8, $FC, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $43F8, $F4, 0, 0, 2, 0, $100)
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_Shutters_20px:
    dw $0002
    %spritemapEntry(1, $43F8, $00, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $43F8, $F0, 0, 0, 2, 0, $100)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Shutters_28px_A2ED63:
    dw $0003
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $43F8, $04, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $43F8, $EC, 0, 0, 2, 0, $100)
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_Shutters_30px:
    dw $0003
    %spritemapEntry(1, $43F8, $08, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $43F8, $E8, 0, 0, 2, 0, $100)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Shutters_38px_A2ED85:
    dw $0004
    %spritemapEntry(1, $43F8, $0C, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $43F8, $00, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $43F8, $F0, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $43F8, $E4, 0, 0, 2, 0, $100)
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_Shutters_40px:
    dw $0004
    %spritemapEntry(1, $43F8, $10, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $43F8, $00, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $43F8, $F0, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $43F8, $E0, 0, 0, 2, 0, $100)

Spritemap_Shutters_Horizontal:
    dw $0004
    %spritemapEntry(1, $1E0, $F8, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $10, $F8, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $00, $F8, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F0, $F8, 0, 0, 2, 0, $102)


;;; $EDC7: Palette - enemy $D5FF (up/down mover platform) ;;;
Palette_Kamer:
    dw $3800,$7F5A,$3BE0,$2680,$0920,$4F5A,$36B5,$2610
    dw $1DCE,$5294,$39CE,$2108,$1084,$033B,$0216,$0113


;;; $EDE7: Instruction list - up/down mover platform ;;;
InstList_Kamer:
    dw $000A,Spritemap_Kamer_0
    dw $000A,Spritemap_Kamer_1
    dw $000A,Spritemap_Kamer_2
    dw $000A,Spritemap_Kamer_3
    dw Instruction_Common_GotoY
    dw InstList_Kamer


;;; $EDFB: Initial up/down mover function pointers ;;;
KamerInitialFunctionPointers:
    dw Function_Shutter_Kamer_WaitForTimer
    dw Function_Shutter_Kamer_WaitForSamusToGetNear
    dw Function_Shutter_Kamer_Activate
    dw Function_Shutter_Kamer_GetEnemyIndex
    dw Function_Shutter_Kamer_GetEnemyIndex


;;; $EE05: Initialisation AI - enemy $D5FF (up/down mover platform) ;;;
InitAI_Kamer:
    LDX.W EnemyIndex
    JSR Init_Shutter_Kamer_Common
    LDA.W #InstList_Kamer : STA.W Enemy.instList,X
    RTL


;;; $EE12: Initialisation AI - enemy $D53F/$D5BF (shootable shutter / destroyable shutter) ;;;
InitAI_ShutterShootable_ShutterDestroyable:
    LDX.W EnemyIndex
    JSR Init_Shutter_Kamer_Common
    LDA.W #InstList_Shutter_GrowthLevel3 : STA.W Enemy.instList,X
    RTL


;;; $EE1F: Initialise up/down mover ;;;
Init_Shutter_Kamer_Common:
    LDA.W Enemy.instList,X : AND.W #$00FF : STA.L Shutters.YSpeedTableIndex,X
    ASL #3 : TAY
    LDA.W CommonEnemySpeeds_LinearlyIncreasing,Y : STA.W Shutters.downVelocity,X
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+2,Y : STA.W Shutters.downSubVelocity,X
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+4,Y : STA.W Shutters.upVelocity,X
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+6,Y : STA.W Shutters.upSubVelocity,X
    LDA.W Enemy.instList+1,X : AND.W #$00FF : STA.L Shutters.primaryDirection,X : STA.L Shutters.reactionDirection,X
    LDA.W Enemy.properties2,X : AND.W #$00FF : STA.L Shutters.movedUpRestTimerParam,X
    ASL #4 : STA.L Shutters.movedUpRestTime,X
    LDA.W Enemy.properties2+1,X : AND.W #$00FF : STA.L Shutters.movedDownRestTimeParam,X
    ASL #4 : STA.L Shutters.movedDownRestTime,X
    LDA.W Enemy.init0,X : AND.W #$00FF : STA.L Shutters.triggerMode,X
    ASL : STA.L Shutters.initialFunctionIndex,X
    LDA.W Enemy.init0+1,X : AND.W #$00FF : STA.L Shutters.YDistance,X
    LDA.W Enemy.init1,X : STA.L Shutters.XProximityWaitTime,X : STA.W Shutters.functionTimer,X
    LDA.W Enemy.YPosition,X : STA.L Shutters.minimumYPosition,X
    CLC : ADC.L Shutters.YDistance,X : STA.L Shutters.maximumYPosition,X
    LDA.L Shutters.primaryDirection,X : BNE .keep20
    LDA.W Enemy.YPosition,X : STA.L Shutters.maximumYPosition,X
    SEC : SBC.L Shutters.YDistance,X : STA.L Shutters.minimumYPosition,X

  .keep20:
    LDA.W #Function_Shutter_Kamer_Initial : STA.W Shutters.function,X
    LDA.W #$0000 : STA.W Enemy.properties2,X : STA.L Shutters.movingSamusFlag,X
    RTS


;;; $EED1: Main AI - enemy $D53F/$D5BF/$D5FF (up/down mover) ;;;
MainAI_ShutterShootable_ShutterDestroyable_Kamer:
    LDX.W EnemyIndex
    JSR.W (Shutters.function,X)
    LDA.W Shutters.function,X : CMP.W #Function_Kamer_MovingUp : BNE +
    BRA .return

+   LDA.W Shutters.function,X : CMP.W #Function_Kamer_MovingDown : BEQ .return
    LDA.W EnemyIndexSamusCollidesLeft : AND.W EnemyIndexSamusCollidesRight
    AND.W EnemyIndexSamusCollidesUp : AND.W EnemyIndexSamusCollidesDown
    CMP.W #$FFFF : BEQ .return
    CMP.W EnemyIndex : BNE .return
    LDA.W ContactDamageIndex : BEQ .return
    JSL PowerBombReaction_ShutterShootable_ShutterDestroyable_Kamer

  .return:
    RTL


;;; $EF09: Up/down mover function - initial ;;;
Function_Shutter_Kamer_Initial:
    LDX.W EnemyIndex
    LDA.L Shutters.initialFunctionIndex,X : TAX
    JSR.W (KamerInitialFunctionPointers,X)
    RTS


;;; $EF15: Initial up/down mover function - wait for timer ;;;
Function_Shutter_Kamer_WaitForTimer:
    LDX.W EnemyIndex
    DEC.W Shutters.functionTimer,X : BNE .return
    LDA.L Shutters.XProximityWaitTime,X : STA.W Shutters.functionTimer,X
    JSR ActivateKamer

  .return:
    RTS


;;; $EF28: (Initial) up/down mover function - wait for Samus to get near ;;;
Function_Shutter_Kamer_WaitForSamusToGetNear:
    LDX.W EnemyIndex
    LDA.L Shutters.XProximityWaitTime,X
    JSL IsSamusWithinAPixelColumnsOfEnemy
    BEQ .return
    JSR ActivateKamer

  .return:
    RTS


;;; $EF39: Initial up/down mover function - activate ;;;
Function_Shutter_Kamer_Activate:
    LDX.W EnemyIndex
    JSR ActivateKamer
    RTS


;;; $EF40: Initial up/down mover function - nothing ;;;
Function_Shutter_Kamer_GetEnemyIndex:
    LDX.W EnemyIndex
    RTS


;;; $EF44: Activate up/down mover ;;;
ActivateKamer:
    LDA.W #Function_Kamer_MovingUp : STA.W Shutters.function,X
    LDA.L Shutters.primaryDirection,X : BEQ .keepUp
    LDA.W #Function_Kamer_MovingDown : STA.W Shutters.function,X

  .keepUp:
    JSR PlayGateOpeningClosingSFXIfOnScreen
    RTS


;;; $EF5A: Play gate opening/closing sound effect if on-screen ;;;
PlayGateOpeningClosingSFXIfOnScreen:
    JSL CheckIfEnemyCenterIsOnScreen
    BNE .return
    LDA.W #$000E
    JSL QueueSound_Lib3_Max6

  .return:
    RTS


;;; $EF68: Up/down mover function - moving up ;;;
Function_Kamer_MovingUp:
    LDX.W EnemyIndex
    LDA.W Enemy.YPosition,X : STA.L Shutters.previousYPosition,X
    LDA.W #$0000 : STA.L Shutters.movingSamusFlag,X
    JSL CheckIfEnemyIsTouchingSamusFromBelow
    BEQ .notTouchingSamusFromBelow
    LDA.W #$0001 : STA.L Shutters.movingSamusFlag,X

  .notTouchingSamusFromBelow:
    LDA.W Enemy.YSubPosition,X : CLC : ADC.W Shutters.upSubVelocity,X : BCC +
    INC.W Enemy.YPosition,X

+   STA.W Enemy.YSubPosition,X
    LDA.W Enemy.YPosition,X : CLC : ADC.W Shutters.upVelocity,X : STA.W Enemy.YPosition,X
    LDA.L Shutters.movingSamusFlag,X : BEQ .notMovingSamus
    LDA.W Enemy.YPosition,X : SEC : SBC.L Shutters.previousYPosition,X : STA.W ExtraSamusYDisplacement

  .notMovingSamus:
    LDA.L Shutters.minimumYPosition,X : CMP.W Enemy.YPosition,X : BMI .return
    LDA.L Shutters.movedUpRestTime,X : CMP.W #Enemy[1].var4 : BEQ .setFunction
    STA.W Shutters.functionTimer,X
    LDA.W #Function_Kamer_StoppedMovingUp : STA.W Shutters.function,X
    BRA .return

  .setFunction:
    LDA.W #Function_Shutter_Kamer_GetEnemyIndex_duplicate : STA.W Shutters.function,X

  .return:
    RTS


;;; $EFD4: Up/down mover function - moving down ;;;
Function_Kamer_MovingDown:
    LDX.W EnemyIndex
    LDA.W Enemy.YPosition,X : STA.L Shutters.previousYPosition,X
    LDA.W #$0000 : STA.L Shutters.movingSamusFlag,X
    JSL CheckIfEnemyIsTouchingSamusFromBelow
    BEQ .notTouchingSamusFromBelow
    LDA.W #$0001 : STA.L Shutters.movingSamusFlag,X

  .notTouchingSamusFromBelow:
    LDA.W Enemy.YSubPosition,X : CLC : ADC.W Shutters.downSubVelocity,X : BCC +
    INC.W Enemy.YPosition,X

+   STA.W Enemy.YSubPosition,X
    LDA.W Enemy.YPosition,X : CLC : ADC.W Shutters.downVelocity,X : STA.W Enemy.YPosition,X
    LDA.L Shutters.movingSamusFlag,X : BEQ .notMovingSamus
    LDA.W Enemy.YPosition,X : SEC : SBC.L Shutters.previousYPosition,X : STA.W ExtraSamusYDisplacement

  .notMovingSamus:
    LDA.W Enemy.YPosition,X : CMP.L Shutters.maximumYPosition,X : BMI .return
    LDA.L Shutters.movedDownRestTime,X : CMP.W #Enemy[1].var4 : BEQ .setFunction
    STA.W Shutters.functionTimer,X
    LDA.W #Function_Kamer_StoppedMovingDown : STA.W Shutters.function,X
    BRA .return

  .setFunction:
    LDA.W #Function_Shutter_Kamer_GetEnemyIndex_duplicate : STA.W Shutters.function,X

  .return:
    RTS


;;; $F040: Up/down mover function - stopped moving up ;;;
Function_Kamer_StoppedMovingUp:
    LDX.W EnemyIndex
    DEC.W Shutters.functionTimer,X : BPL .return
    LDA.W #Function_Kamer_MovingDown : STA.W Shutters.function,X
    LDA.L Shutters.triggerMode,X : CMP.W #$0001 : BNE .upwards
    LDA.L Shutters.primaryDirection,X : BEQ .upwards
    LDA.W #Function_Shutter_Kamer_WaitForSamusToGetNear : STA.W Shutters.function,X

  .upwards:
    LDX.W EnemyIndex
    LDA.W Enemy.ID,X : CMP.W #EnemyHeaders_Kamer2 : BEQ .return
    JSR PlayGateOpeningClosingSFXIfOnScreen

  .return:
    RTS


;;; $F072: Up/down mover function - stopped moving down ;;;
Function_Kamer_StoppedMovingDown:
    LDX.W EnemyIndex
    DEC.W Shutters.functionTimer,X : BPL .return
    JSR PlayGateOpeningClosingSFXIfOnScreen
    LDA.W #Function_Kamer_MovingUp : STA.W Shutters.function,X
    LDA.L Shutters.triggerMode,X : CMP.W #$0001 : BNE .return
    LDA.L Shutters.primaryDirection,X : BNE .return
    LDA.W #Function_Shutter_Kamer_WaitForSamusToGetNear : STA.W Shutters.function,X

  .return:
    RTS


;;; $F099: Up/down mover function - nothing ;;;
Function_Shutter_Kamer_GetEnemyIndex_duplicate:
    LDX.W EnemyIndex
    RTS


;;; $F09D: Enemy touch - enemy $D53F/$D5BF/$D5FF (up/down mover) ;;;
EnemyTouch_ShutterShootable_ShutterDestroyable_Kamer:
    JSL PowerBombReaction_ShutterShootable_ShutterDestroyable_Kamer
    RTL


;;; $F0A2: Enemy shot - enemy $D53F/$D5FF (shootable shutter / up/down mover platform) ;;;
EnemyShot_ShutterShootable_Kamer:
    LDX.W EnemyIndex
    JSL PowerBombReaction_ShutterShootable_ShutterDestroyable_Kamer
    RTL


;;; $F0AA: Enemy shot - enemy $B5BF (destroyable shutter) ;;;
EnemyTouch_ShutterDestroyable:
    LDX.W EnemyIndex
    JSL NormalEnemyShotAI
    JSL PowerBombReaction_ShutterShootable_ShutterDestroyable_Kamer
    RTL


;;; $F0B6: Up/down mover reaction ;;;
PowerBombReaction_ShutterShootable_ShutterDestroyable_Kamer:
; Power bomb reaction for enemy $D53F/$D5BF/$D5FF (up/down mover)
    LDX.W EnemyIndex
    LDA.L Shutters.initialFunctionIndex,X : CMP.W #$0006 : BMI .nonShootable
    CMP.W #$0008 : BEQ .function8
    LDA.L Shutters.shotActivatedFlag,X : BNE .return
    LDA.W #$0001 : STA.L Shutters.shotActivatedFlag,X

  .function8:
    LDA.W Shutters.function,X : CMP.W #Function_Kamer_MovingUp : BNE .notMovingUp
    BRA .return

  .notMovingUp:
    LDA.W Shutters.function,X : CMP.W #Function_Kamer_MovingDown : BEQ .return
    LDA.W #Function_Kamer_MovingUp : STA.W Shutters.function,X
    LDA.L Shutters.reactionDirection,X : BEQ .upwards
    LDA.W #Function_Kamer_MovingDown : STA.W Shutters.function,X

  .upwards:
    LDA.L Shutters.reactionDirection,X : EOR.W #$0001 : STA.L Shutters.reactionDirection,X

  .nonShootable:
    JSR PlayGateOpeningClosingSFXIfOnScreen

  .return:
    RTL


;;; $F107: Initial horizontal shutter function pointers ;;;
InitialHorizontalShutterFunctionPointers:
    dw Function_HorizontalShutter_Initial_WaitForTimer
    dw Function_HorizontalShutter_Initial_WaitForSamusToGetNear
    dw Function_HorizontalShutter_Initial_Activate
    dw Function_HorizontalShutter_Initial_Nothing
    dw Function_HorizontalShutter_Initial_Nothing


;;; $F111: Initialisation AI - enemy $D57F (horizontal shutter) ;;;
InitAI_ShutterHorizShootable:
    LDX.W EnemyIndex
    JSR InitializeHorizontalShutter
    LDA.W #InstList_ShutterHorizontal : STA.W Enemy.instList,X
    RTL


;;; $F11E: Initialise horizontal shutter ;;;
InitializeHorizontalShutter:
    LDA.W Enemy.instList,X : AND.W #$00FF : STA.L ShutterHorizShootable.YSpeedTableIndex,X
    ASL #3 : TAY
    LDA.W CommonEnemySpeeds_LinearlyIncreasing,Y : STA.W ShutterHorizShootable.rightVelocity,X
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+2,Y : STA.W ShutterHorizShootable.rightSubVelocity,X
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+4,Y : STA.W ShutterHorizShootable.leftVelocity,X
    LDA.W CommonEnemySpeeds_LinearlyIncreasing+6,Y : STA.W ShutterHorizShootable.leftSubVelocity,X
    LDA.W Enemy.instList+1,X : AND.W #$00FF : STA.L ShutterHorizShootable.primaryDirection,X
    EOR.W #$0001 : STA.L ShutterHorizShootable.reactionDirection,X
    LDA.W Enemy.properties2,X : AND.W #$00FF : STA.L ShutterHorizShootable.movedLeftRestTimerParam,X
    ASL #4 : STA.L ShutterHorizShootable.movedLeftRestTime,X
    LDA.W Enemy.properties2+1,X : AND.W #$00FF : STA.L ShutterHorizShootable.movedRightRestTimeParam,X
    ASL #4 : STA.L ShutterHorizShootable.movedRightRestTime,X
    LDA.W Enemy.init0,X : AND.W #$00FF : STA.L ShutterHorizShootable.triggerMode,X
    ASL : STA.L ShutterHorizShootable.initialFunctionIndex,X
    LDA.W Enemy.init0+1,X : AND.W #$00FF : STA.L ShutterHorizShootable.YDistance,X
    LDA.W Enemy.init1,X : STA.L ShutterHorizShootable.XProximityWaitTime,X : STA.W ShutterHorizShootable.functionTimer,X
    LDA.W Enemy.XPosition,X : STA.L ShutterHorizShootable.minimumXPosition,X
    CLC : ADC.L ShutterHorizShootable.YDistance,X : STA.L ShutterHorizShootable.maximumXPosition,X
    LDA.L ShutterHorizShootable.primaryDirection,X : BNE .notLeftwards
    LDA.W Enemy.XPosition,X : STA.L ShutterHorizShootable.maximumXPosition,X
    SEC : SBC.L ShutterHorizShootable.YDistance,X : STA.L ShutterHorizShootable.minimumXPosition,X

  .notLeftwards:
    LDA.W #Function_HorizontalShutter_Initial : STA.W ShutterHorizShootable.function,X
    LDA.W SamusXPosition : STA.L ExtraEnemy7800+$2A,X
    LDA.W #$0000 : STA.W Enemy.properties2,X
    STA.L Shutters.movingSamusFlag,X : STA.L ExtraEnemy7800+$16,X
    RTS


;;; $F1DE: Main AI - enemy $D57F (horizontal shutter) ;;;
MainAI_ShutterHorizShootable:
    LDX.W EnemyIndex
    JSR.W (ShutterHorizShootable.function,X)
    LDA.W ShutterHorizShootable.function,X : CMP.W #Function_HorizontalShutter_MovingLeft : BNE .notMovingLeft
    BRA +

  .notMovingLeft:
    LDA.W ShutterHorizShootable.function,X : CMP.W #Function_HorizontalShutter_MovingRight : BEQ +
    LDA.W EnemyIndexSamusCollidesLeft : AND.W EnemyIndexSamusCollidesRight
    AND.W EnemyIndexSamusCollidesUp : AND.W EnemyIndexSamusCollidesDown
    CMP.W #$FFFF : BEQ +
    CMP.W EnemyIndex : BNE +
    LDA.W ContactDamageIndex : BEQ +
    JSL PowerBombReaction_CommonReaction_HorizontalShutter

+   LDA.W SamusXPosition : STA.L ExtraEnemy7800+$2A,X
    LDA.W SamusXSubPosition : STA.L ExtraEnemy7800+$2C,X
    RTL


;;; $F224: Horizontal shutter function - initial ;;;
Function_HorizontalShutter_Initial:
    LDX.W EnemyIndex
    LDA.L ShutterHorizShootable.initialFunctionIndex,X : TAX
    JSR.W (InitialHorizontalShutterFunctionPointers,X)
    RTS


;;; $F230: Initial horizontal shutter function - wait for timer ;;;
Function_HorizontalShutter_Initial_WaitForTimer:
    LDX.W EnemyIndex
    DEC.W ShutterHorizShootable.functionTimer,X : BNE .return
    LDA.L ShutterHorizShootable.XProximityWaitTime,X : STA.W ShutterHorizShootable.functionTimer,X
    JSR ActivateHorizontalShutter

  .return:
    RTS


;;; $F243: (Initial) horizontal shutter function - wait for Samus to get near ;;;
Function_HorizontalShutter_Initial_WaitForSamusToGetNear:
    LDX.W EnemyIndex
    LDA.L ShutterHorizShootable.XProximityWaitTime,X
    JSL IsSamusWithinAPixelColumnsOfEnemy
    BEQ .return
    JSR ActivateHorizontalShutter

  .return:
    RTS


;;; $F254: Initial horizontal shutter function - activate ;;;
Function_HorizontalShutter_Initial_Activate:
    LDX.W EnemyIndex
    JSR ActivateHorizontalShutter
    RTS


;;; $F25B: Initial horizontal shutter function - nothing ;;;
Function_HorizontalShutter_Initial_Nothing:
    LDX.W EnemyIndex
    RTS


;;; $F25F: Activate horizontal shutter ;;;
ActivateHorizontalShutter:
    LDA.W #Function_HorizontalShutter_MovingLeft : STA.W ShutterHorizShootable.function,X
    LDA.L ShutterHorizShootable.primaryDirection,X : BEQ .return
    LDA.W #Function_HorizontalShutter_MovingRight : STA.W ShutterHorizShootable.function,X

  .return:
    RTS


;;; $F272: Horizontal shutter function - moving left ;;;
Function_HorizontalShutter_MovingLeft:
    LDX.W EnemyIndex
    LDA.W Enemy.XPosition,X : STA.L ShutterHorizShootable.previousXPosition,X
    LDA.W #$0000 : STA.L ShutterHorizShootable.movingSamusFlag,X
    JSL CheckIfEnemyIsTouchingSamus
    BEQ .notTouchingSamus
    LDA.W SamusXPosition : CMP.W Enemy.XPosition,X : BPL .notTouchingSamus
    LDA.W #$0001 : STA.L ShutterHorizShootable.movingSamusFlag,X

  .notTouchingSamus:
    CLC
    LDA.W Enemy.XSubPosition,X : ADC.W ShutterHorizShootable.leftSubVelocity,X : STA.W Enemy.XSubPosition,X
    LDA.W Enemy.XPosition,X : ADC.W ShutterHorizShootable.leftVelocity,X : STA.W Enemy.XPosition,X
    LDA.L ShutterHorizShootable.movingSamusFlag,X : BEQ .notMovingSamus
    LDA.W ShutterHorizShootable.leftSubVelocity,X : STA.W ExtraSamusXSubDisplacement
    LDA.W ShutterHorizShootable.leftVelocity,X : STA.W ExtraSamusXDisplacement
    JSR EjectSamusIfPressingRight

  .notMovingSamus:
    LDA.L ShutterHorizShootable.minimumXPosition,X : CMP.W Enemy.XPosition,X : BMI .return
    LDA.L ShutterHorizShootable.movedLeftRestTime,X : CMP.W #Enemy[1].var4 : BEQ +
    STA.W ShutterHorizShootable.functionTimer,X
    LDA.W #Function_HorizontalShutter_StoppedMovingLeft : STA.W ShutterHorizShootable.function,X
    BRA .return
+   LDA.W #RTS_A2F3D4 : STA.W ShutterHorizShootable.function,X

  .return:
    RTS


;;; $F2E4: Horizontal shutter function - moving right ;;;
Function_HorizontalShutter_MovingRight:
    LDX.W EnemyIndex
    LDA.W Enemy.XPosition,X : STA.L ShutterHorizShootable.previousXPosition,X
    LDA.W #$0000 : STA.L ShutterHorizShootable.movingSamusFlag,X
    JSL CheckIfEnemyIsTouchingSamus
    BEQ .notTouchingSamus
    LDA.W SamusXPosition : CMP.W Enemy.XPosition,X : BMI .notTouchingSamus
    LDA.W #$0001 : STA.L ShutterHorizShootable.movingSamusFlag,X

  .notTouchingSamus:
    CLC
    LDA.W Enemy.XSubPosition,X : ADC.W ShutterHorizShootable.rightSubVelocity,X : STA.W Enemy.XSubPosition,X
    LDA.W Enemy.XPosition,X : ADC.W ShutterHorizShootable.rightVelocity,X : STA.W Enemy.XPosition,X
    LDA.L ShutterHorizShootable.movingSamusFlag,X : BEQ .notMovingSamus
    LDA.W ShutterHorizShootable.rightSubVelocity,X : STA.W ExtraSamusXSubDisplacement
    LDA.W ShutterHorizShootable.rightVelocity,X : STA.W ExtraSamusXDisplacement
    JSR EjectSamusIfPressingLeft

  .notMovingSamus:
    LDA.W Enemy.XPosition,X : CMP.L ShutterHorizShootable.maximumXPosition,X : BMI .return
    LDA.L ShutterHorizShootable.movedRightRestTime,X : CMP.W #Enemy[1].var4 : BEQ +
    STA.W ShutterHorizShootable.functionTimer,X
    LDA.W #Function_HorizontalShutter_StoppedMovingRight : STA.W ShutterHorizShootable.function,X
    BRA .return

+   LDA.W #RTS_A2F3D4 : STA.W ShutterHorizShootable.function,X

  .return:
    RTS


;;; $F356: Eject Samus if pressing right ;;;
EjectSamusIfPressingRight:
    LDA.L ShutterHorizShootable.movingSamusFlag,X : BEQ .return
    LDA.B DP_Controller1Input : AND.W #$0100 : BEQ .return
    LDA.W ExtraSamusXDisplacement : CLC : ADC.W #$FFFC : STA.W ExtraSamusXDisplacement
    STZ.W ExtraSamusYSubDisplacement

  .return:
    RTS


;;; $F371: Eject Samus if pressing left ;;;
EjectSamusIfPressingLeft:
    LDA.L ShutterHorizShootable.movingSamusFlag,X : BEQ .return
    LDA.B DP_Controller1Input : AND.W #$0200 : BEQ .return
    LDA.W ExtraSamusXDisplacement : CLC : ADC.W #$0004 : STA.W ExtraSamusXDisplacement
    STZ.W ExtraSamusYSubDisplacement

  .return:
    RTS


;;; $F38C: Horizontal shutter function - stopped moving left ;;;
Function_HorizontalShutter_StoppedMovingLeft:
    LDX.W EnemyIndex
    DEC.W ShutterHorizShootable.functionTimer,X : BPL .return
    LDA.W #Function_HorizontalShutter_MovingRight : STA.W ShutterHorizShootable.function,X
    LDA.L ShutterHorizShootable.triggerMode,X : CMP.W #$0001 : BNE .return
    LDA.L ShutterHorizShootable.primaryDirection,X : BEQ .return
    LDA.W #Function_HorizontalShutter_Initial_WaitForSamusToGetNear : STA.W ShutterHorizShootable.function,X

  .return:
    RTS


;;; $F3B0: Horizontal shutter function - stopped moving right ;;;
Function_HorizontalShutter_StoppedMovingRight:
    LDX.W EnemyIndex
    DEC.W ShutterHorizShootable.functionTimer,X : BPL .return
    LDA.W #Function_HorizontalShutter_MovingLeft : STA.W ShutterHorizShootable.function,X
    LDA.L ShutterHorizShootable.triggerMode,X : CMP.W #$0001 : BNE .return
    LDA.L ShutterHorizShootable.primaryDirection,X : BNE .return
    LDA.W #Function_HorizontalShutter_Initial_WaitForSamusToGetNear : STA.W ShutterHorizShootable.function,X

  .return:
    RTS


;;; $F3D4: Horizontal shutter function - nothing ;;;
RTS_A2F3D4:
    LDX.W EnemyIndex
    RTS


;;; $F3D8: Enemy touch - enemy $D57F (horizontal shutter) ;;;
EnemyTouch_ShutterHorizShootable:
    LDX.W EnemyIndex
    LDA.W ShutterHorizShootable.function,X : CMP.W #RTS_A2F3D4 : BNE .return
    LDA.W SamusXPosition : CMP.W Enemy.XPosition,X : BPL .checkPressingLeft
    LDA.B DP_Controller1Input : AND.W #$0100 : BEQ .return
    LDA.W #$FFFC : STA.W ExtraSamusXDisplacement
    STZ.W ExtraSamusYSubDisplacement
    BRA .return

  .checkPressingLeft:
    LDA.B DP_Controller1Input : AND.W #$0200 : BEQ .return
    LDA.W #$0004 : STA.W ExtraSamusXDisplacement
    STZ.W ExtraSamusYSubDisplacement

  .return:
    RTL


;;; $F40E: Enemy shot - enemy $D57F (horizontal shutter) ;;;
EnemyShot_ShutterHorizShootable:
    LDX.W EnemyIndex
    JSL NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External
    JSL PowerBombReaction_CommonReaction_HorizontalShutter
    RTL


;;; $F41A: Horizontal shutter reaction ;;;
PowerBombReaction_CommonReaction_HorizontalShutter:
; Power bomb reaction for enemy $D57F (horizontal shutter)
    LDX.W EnemyIndex
    LDA.L ShutterHorizShootable.initialFunctionIndex,X : CMP.W #$0006 : BMI .return
    CMP.W #$0008 : BEQ .function8
    LDA.L ShutterHorizShootable.shotActivatedFlag,X : BNE .return
    LDA.W #$0001 : STA.L ShutterHorizShootable.shotActivatedFlag,X

  .function8:
    LDA.W ShutterHorizShootable.function,X : CMP.W #Function_HorizontalShutter_MovingLeft : BNE .notMovingLeft
    BRA .return

  .notMovingLeft:
    LDA.W ShutterHorizShootable.function,X : CMP.W #Function_HorizontalShutter_MovingRight : BEQ .return
    LDA.L ShutterHorizShootable.reactionDirection,X : EOR.W #$0001 : STA.L ShutterHorizShootable.reactionDirection,X
    LDA.W #Function_HorizontalShutter_MovingLeft : STA.W ShutterHorizShootable.function,X
    LDA.L ShutterHorizShootable.reactionDirection,X : BEQ .return
    LDA.W #Function_HorizontalShutter_MovingRight : STA.W ShutterHorizShootable.function,X

  .return:
    RTL


;;; $F468: Spritemaps - up/down mover platform ;;;
Spritemap_Kamer_0:
    dw $0002
    %spritemapEntry(1, $00, $F8, 0, 1, 2, 0, $100)
    %spritemapEntry(1, $1F0, $F8, 0, 0, 2, 0, $100)

Spritemap_Kamer_1:
    dw $0002
    %spritemapEntry(1, $00, $F8, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $1F0, $F8, 0, 0, 2, 0, $102)

Spritemap_Kamer_2:
    dw $0002
    %spritemapEntry(1, $00, $F8, 0, 1, 2, 0, $104)
    %spritemapEntry(1, $1F0, $F8, 0, 0, 2, 0, $104)

Spritemap_Kamer_3:
    dw $0002
    %spritemapEntry(1, $00, $F8, 0, 1, 2, 0, $106)
    %spritemapEntry(1, $1F0, $F8, 0, 0, 2, 0, $106)


Freespace_BankA2_F498:
; $B68 bytes
