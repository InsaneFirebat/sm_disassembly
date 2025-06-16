
org $A48000


; Common to all enemy code banks

;;; $8000: Grapple AI - no interaction. Also unfreezes enemies(!) ;;;
CommonA4_GrappleAI_NoInteraction:
; Used by skultera, Draygon body, fire arc, Phantoon, etecoon, dachora and WS ghost
    JSL GrappleAI_SwitchEnemyAIToMainAI
    RTL


;;; $8005: Grapple AI - Samus latches on ;;;
CommonA4_GrappleAI_SamusLatchesOn:
; Used by gripper and Crocomire
    JSL GrappleAI_SamusLatchesOnWithGrapple
    RTL


;;; $800A: Grapple AI - kill enemy ;;;
CommonA4_GrappleAI_KillEnemy:
; Common
    JSL GrappleAI_EnemyGrappleDeath
    RTL


;;; $800F: Grapple AI - cancel grapple beam ;;;
CommonA4_GrappleAI_CancelGrappleBeam:
; Common
    JSL GrappleAI_SwitchToFrozenAI
    RTL


;;; $8014: Grapple AI - Samus latches on - no invincibility ;;;
CommonA4_GrappleAI_SamusLatchesOn_NoInvincibility:
; Used by powamp
    JSL GrappleAI_SamusLatchesOnWithGrapple_NoInvincibility
    RTL


;;; $8019: Unused. Grapple AI - Samus latches on - paralyse enemy ;;;
UNUSED_CommonA4_GrappleAI_SamusLatchesOn_ParalyzeEnemy_A48019:
    JSL GrappleAI_SamusLatchesOnWithGrapple_ParalyzeEnemy
    RTL


;;; $801E: Grapple AI - hurt Samus ;;;
CommonA4_GrappleAI_HurtSamus:
; Used by WS spark
; Hurt reaction happens in $9B:B932
    JSL GrappleAI_SwitchToFrozenAI_duplicate
    RTL


;;; $8023: Normal enemy touch AI ;;;
CommonA4_NormalEnemyTouchAI:
    JSL NormalEnemyTouchAI
    RTL


;;; $8028: Normal touch AI - no death check ;;;
CommonA4_NormalTouchAI_NoDeathCheck:
    JSL NormalEnemyTouchAI_NoDeathCheck_External
    RTL


;;; $802D: Normal enemy shot AI ;;;
CommonA4_NormalEnemyShotAI:
    JSL NormalEnemyShotAI
    RTL


;;; $8032: Normal enemy shot AI - no death check, no enemy shot graphic ;;;
CommonA4_NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic:
    JSL NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External
    RTL


;;; $8037: Normal enemy power bomb AI ;;;
CommonA4_NormalEnemyPowerBombAI:
    JSL NormalEnemyPowerBombAI
    RTL


;;; $803C: Normal enemy power bomb AI - no death check ;;;
CommonA4_NormalEnemyPowerBombAI_NoDeathCheck:
; Kraid's power bomb AI
    JSL NormalEnemyPowerBombAI_NoDeathCheck_External
    RTL


;;; $8041: Normal enemy frozen AI ;;;
CommonA4_NormalEnemyFrozenAI:
    JSL NormalEnemyFrozenAI
    RTL


;;; $8046: Creates a dud shot ;;;
CommonA4_CreateADudShot:
    JSL CreateADudShot
    RTL


;;; $804B: RTS ;;;
RTS_A4804B:
    RTS


;;; $804C: RTL ;;;
RTL_A4804C:
    RTL


;;; $804D: Spritemap - nothing ;;;
Spritemap_CommonA4_Nothing:
    dw $0000


;;; $804F: Extended spritemap - nothing ;;;
ExtendedSpritemap_CommonA4_Nothing:
    dw $0001
    dw $0000,$0000
    dw Spritemap_CommonA4_Nothing
    dw Hitbox_CommonA4_Nothing


;;; $8059: Hitbox - nothing ;;;
Hitbox_CommonA4_Nothing:
; [n entries] [[left offset] [top offset] [right offset] [bottom offset] [p touch] [p shot]]...
    dw $0001
    dw $0000,$0000,$0000,$0000
    dw CommonA4_NormalEnemyTouchAI
    dw CommonA4_NormalEnemyShotAI


;;; $8067: Instruction list - delete enemy ;;;
InstList_CommonA4_DeleteEnemy:
    dw Instruction_CommonA4_DeleteEnemy


;;; $8069: Two NOPs ;;;
NOPNOP_A48069:
; Used as palette by respawning enemy placeholder and Draygon's eye o_O
    NOP #2


;;; $806B: Instruction - Enemy.var5 = [[Y]] ;;;
Instruction_CommonA4_Enemy0FB2_InY:
; Used only by torizos (for enemy movement function) and escape etecoon (for enemy function)
    LDA.W $0000,Y : STA.W Enemy.var5,X
    INY #2
    RTL


;;; $8074: Instruction - Enemy.var5 = RTS ;;;
Instruction_CommonA4_SetEnemy0FB2ToRTS:
    LDA.W #RTS_A4807B : STA.W Enemy.var5,X
    RTL


RTS_A4807B:
    RTS


;;; $807C: Instruction - delete enemy ;;;
Instruction_CommonA4_DeleteEnemy:
    LDA.W Enemy.properties,X : ORA.W #$0200 : STA.W Enemy.properties,X
    PLA
    PEA.W ProcessEnemyInstructions_return-1
    RTL


;;; $808A: Instruction - call function [[Y]] ;;;
Instruction_CommonA4_CallFunctionInY:
    LDA.W $0000,Y : STA.B DP_Temp12
    PHY : PHX
    PEA .manualReturn-1
    JMP.W (DP_Temp12)

  .manualReturn:
    PLX : PLY
    INY #2
    RTL


;;; $809C: Instruction - call function [[Y]] with A = [[Y] + 2] ;;;
Instruction_CommonA4_CallFunctionInY_WithA:
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
UNUSED_Instruction_CommonA4_CallExternalFunctionInY_A480B5:
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
UNUSED_Inst_CommonA4_CallExternalFunctionInY_WithA_A480CE:
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
Instruction_CommonA4_GotoY:
    LDA.W $0000,Y : TAY
    RTL


;;; $80F2: Instruction - go to [[Y]] + ±[[Y]] ;;;
Instruction_CommonA4_GotoY_PlusY:
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
Instruction_CommonA4_DecrementTimer_GotoYIfNonZero:
    DEC.W Enemy.loopCounter,X : BNE Instruction_CommonA4_GotoY
    INY #2
    RTL


;;; $8110: Instruction - decrement timer and go to [[Y]] if non-zero ;;;
Instruction_CommonA4_DecrementTimer_GotoYIfNonZero_duplicate:
    DEC.W Enemy.loopCounter,X : BNE Instruction_CommonA4_GotoY
    INY #2
    RTL


;;; $8118: Instruction - decrement timer and go to [Y] + ±[[Y]] if non-zero ;;;
Instruction_CommonA4_DecrementTimer_GotoY_PlusY_IfNonZero:
    SEP #$20
    DEC.W Enemy.loopCounter,X
    REP #$20
    BNE Instruction_CommonA4_GotoY_PlusY
    INY
    RTL


;;; $8123: Instruction - timer = [[Y]] ;;;
Instruction_CommonA4_TimerInY:
    LDA.W $0000,Y : STA.W Enemy.loopCounter,X
    INY #2
    RTL


;;; $812C: Instruction - skip next instruction ;;;
Instruction_CommonA4_SkipNextInstruction:
    INY #2
    RTL


;;; $812F: Instruction - sleep ;;;
Instruction_CommonA4_Sleep:
    DEY #2
    TYA : STA.W Enemy.instList,X
    PLA
    PEA.W ProcessEnemyInstructions_return-1
    RTL


;;; $813A: Instruction - wait [[Y]] frames ;;;
Instruction_CommonA4_WaitYFrames:
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
Instruction_CommonA4_TransferYBytesInYToVRAM:
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
Instruction_CommonA4_EnableOffScreenProcessing:
    LDA.W Enemy.properties,X : ORA.W #$0800 : STA.W Enemy.properties,X
    RTL


;;; $817D: Instruction - disable off-screen processing ;;;
Instruction_CommonA4_DisableOffScreenProcessing:
    LDA.W Enemy.properties,X : AND.W #$F7FF : STA.W Enemy.properties,X
    RTL


;;; $8187: Common enemy speeds - linearly increasing ;;;
CommonA4EnemySpeeds_LinearlyIncreasing:
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
CommonA4EnemySpeeds_QuadraticallyIncreasing:
;        _____________________ Subspeed
;       |      _______________ Speed
;       |     |      _________ Negated subspeed
;       |     |     |      ___ Negated speed
;       |     |     |     |
; I.e. gravity
; Used by e.g. Botwoon when dying and falling to the floor
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


;;; $8687: Hurt AI - enemy $DD8F (Crocomire) ;;;
HurtAI_Crocomire:
; No call to Crocomire_vs_Samus_CollisionHandling, I guess that's why charged plasma lets you roll over past Crocomire
    LDX.W EnemyIndex
    JSL UpdateCrocomireBG2Scroll
    JSR CrocomireHurtFlashHandling
    RTL


;;; $8692: Crocomire constants ;;;
CrocomireConstants:
  .mouthCloseDelayWhenDamaged_NotProjAttack:
; Mouth close delay when damaged not during projectile attack
    dw $0008

  .mouthCloseDelayWhenDamaged_ProjAttack:
; Mouth close delay when damaged during projectile attack
    dw $0008

  .index:
; Crocomire enemy index when leaving enemy shot when shot by uncharged beam whilst mouth is open. Not read meaningfully
    dw $0000

  .stepsWhenDamagedByChargeBeam:
; Number of steps taken back when damaged by charged beam
    dw $0002

  .stepsWhenDamagedByMissile:
; Number of steps taken back when damaged by missile
    dw $0001

  .stepsWhenDamagedBySuperMissile:
; Number of steps taken back when damaged by super missile
    dw $0003

  .powerBombReactionEnableFlag:
; Power bomb reaction enable flag
    dw $0003

  .mouthOpenInstructionTimer:
; Mouth open instruction timer when shot by uncharged beam
    dw $0008

  .XThresholdSpikeWall:
; Crocomire X position threshold being near spike wall (to start spike wall charge and finish backing away from spike wall)
    dw $0300

  .XThresholdBridge:
; Crocomire X position threshold for bridge to collapse
    dw $0640


;;; $86A6: Instruction - fight AI ;;;
Instruction_Crocomire_FightAI:
    PHX
    LDX.W EnemyIndex
    LDA.W Crocomire.fightFunctionIndex,X : TAX
    JSR.W (.pointers,X)
    PLX
    RTL

  .pointers:
    dw FightAI_Crocomire_0_LockUp_SetInitialInstList
    dw FightAI_Crocomire_2_StepForwardUntilOnScreen_StepForward
    dw FightAI_Crocomire_4_Asleep
    dw FightAI_Crocomire_6_SteppingForward
    dw FightAI_Crocomire_8_ProjectileAttack
    dw FightAI_Crocomire_A_NearSpikeWallCharge
    dw FightAI_Crocomire_C_SteppingBack
    dw FightAI_Crocomire_E_BackOffFromSpikeWall
    dw UNUSED_FightAI_Crocomire_10_RoarAndStepForwards_A487FB
    dw FightAI_Crocomire_12_WaitForFirstDamage
    dw FightAI_Crocomire_14_WaitForSecondDamage
    dw UNUSED_FightAI_Crocomire_16_WaitForSecondDamage_A4885A
    dw FightAI_Crocomire_18_PowerBombedCharge
    dw UNUSED_FightAI_Crocomire_1A_DoNearSpikeWallCharge_A4889A
    dw FightAI_Crocomire_1C_UnusedSequence_SetInitialInstList
    dw UNUSED_FightAI_Crocomire_1E_ChooseForwardMovingAttack_A4891B
    dw UNUSED_FightAI_Crocomire_20_DoNothingAndStepForward_A48940
    dw UNUSED_FightAI_Crocomire_22_MoveForwardUntilHitSamus_A4895E
    dw UNUSED_FightAI_Crocomire_24_MoveClaws_StepForward_A489A8
    dw UNUSED_FightAI_Crocomire_26_StepForward_A489DE
    dw UNUSED_FightAI_Crocomire_28_MovingClaws_A489F9


;;; $86DD: RTS ;;;
RTS_A486DD:
    RTS


;;; $86DE: Fight AI - index 0 - lock up (unused) / set initial Crocomire instruction list ;;;
FightAI_Crocomire_0_LockUp_SetInitialInstList:
;; Returns:
;;     Y: Instruction list pointer
    LDY.W #InstList_Crocomire_Initial
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    RTS


;;; $86E8: Fight AI - index 2 - step forward until on screen (unused) / step forward ;;;
FightAI_Crocomire_2_StepForwardUntilOnScreen_StepForward:
;; Returns:
;;     Y: Instruction list pointer

; Skips the "wait for damage" stage if Crocomire happens to perform a projectile attack during its stepping forward
    LDA.W #$0004 : STA.W Crocomire.fightFunctionIndex
    LDY.W #InstList_Crocomire_StepForward
    RTS


;;; $86F2: Fight AI - index 4 - asleep ;;;
FightAI_Crocomire_4_Asleep:
;; Returns:
;;     Y: Instruction list pointer
    LDA.W Enemy.XPosition : SEC : SBC.W SamusXPosition : BPL +
    EOR.W #$FFFF : INC

+   CMP.W #$00E0 : BPL .return
    LDA.W Crocomire.fightFlags : ORA.W #$8000 : STA.W Crocomire.fightFlags
    LDY.W #InstList_Crocomire_WaitForFirstSecondDamage
    LDA.W #$0012 : STA.W Crocomire.fightFunctionIndex

  .return:
    RTS


;;; $8717: Fight AI - index 6 - stepping forward ;;;
FightAI_Crocomire_6_SteppingForward:
;; Returns:
;;     Y: Instruction list pointer
    LDA.W Crocomire.fightFlags : BIT.W #$0800 : BEQ .step
    LDA.W Crocomire.fightFlags : AND.W #$F7FF : STA.W Crocomire.fightFlags
    LDA.W Crocomire.stepCounter : BEQ .step
    LDY.W #InstList_Crocomire_StepBack
    LDA.W #$000C : STA.W Crocomire.fightFunctionIndex
    RTS

  .step:
    LDA.W Enemy.XPosition : CMP.W CrocomireConstants_XThresholdSpikeWall : BMI .nearSpikeWall
    CPY.W #InstList_Crocomire_SteppingBack : BMI .return
    LDY.W #InstList_Crocomire_StepForward

  .return:
    RTS

  .nearSpikeWall:
    LDY.W #InstList_CrocomireTongue_NearSpikeWallCharge_0
    LDA.W #$000A : STA.W Crocomire.fightFunctionIndex
    RTS


;;; $8752: Instruction - maybe start projectile attack ;;;
Instruction_Crocomire_MaybeStartProjectileAttack:
    PHX
    LDA.W RandomNumberSeed : AND.W #$0FFF : CMP.W #$0400 : BPL .return
    LDA.W #$0008 : STA.W Crocomire.fightFunctionIndex
    STZ.W Crocomire.projectileCounter
    LDY.W #InstList_Crocomire_ProjectileAttack_0

  .return:
    PLX
    RTL


;;; $876C: Fight AI - index 8 - projectile attack ;;;
FightAI_Crocomire_8_ProjectileAttack:
;; Returns:
;;     Y: Instruction list pointer
    LDA.W Crocomire.fightFlags : BIT.W #$0800 : BEQ .notDamaged
    AND.W #$F7FF : STA.W Crocomire.fightFlags
    LDY.W #InstList_Crocomire_StepBack
    LDA.W #$000C : STA.W Crocomire.fightFunctionIndex
    RTS

  .notDamaged:
    LDA.W Crocomire.projectileCounter : CMP.W #$0012 : BPL .stepForward
    INC.W Crocomire.projectileCounter : INC.W Crocomire.projectileCounter
    PHX : PHY
    LDX.W EnemyIndex
    LDY.W #EnemyProjectile_CrocomiresProjectile
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    LDA.W #$001C
    JSL QueueSound_Lib3_Max6
    PLY : PLX
    RTS

  .stepForward:
    LDY.W #InstList_Crocomire_StepForwardAfterDelay
    LDA.W #$0006 : STA.W Crocomire.fightFunctionIndex
    RTS


;;; $87B2: Fight AI - index Ah - near spike wall charge ;;;
FightAI_Crocomire_A_NearSpikeWallCharge:
;; Returns:
;;     Y: Instruction list pointer
    LDA.W Crocomire.fightFlags : BIT.W #$0800 : BEQ .return
    AND.W #$F7FF : STA.W Crocomire.fightFlags
    LDY.W #InstList_Crocomire_StepBack
    LDA.W #$000C : STA.W Crocomire.fightFunctionIndex

  .return:
    RTS


;;; $87CA: Fight AI - index Ch - stepping back ;;;
FightAI_Crocomire_C_SteppingBack:
;; Returns:
;;     Y: Instruction list pointer
    LDA.W Crocomire.stepCounter : BEQ .stepForward
    DEC : STA.W Crocomire.stepCounter : BEQ .stepForward
    LDY.W #InstList_Crocomire_SteppingBack
    LDA.W #$000C : STA.W Crocomire.fightFunctionIndex
    RTS

  .stepForward:
    LDA.W #$0006 : STA.W Crocomire.fightFunctionIndex
    LDY.W #InstList_Crocomire_StepForward
    RTS


;;; $87E9: Fight AI - index Eh - back off from spike wall ;;;
FightAI_Crocomire_E_BackOffFromSpikeWall:
;; Returns:
;;     Y: Instruction list pointer
    LDA.W Enemy.XPosition : CMP.W CrocomireConstants_XThresholdSpikeWall : BMI .return
    LDA.W #$0006 : STA.W Crocomire.fightFunctionIndex
    LDY.W #InstList_Crocomire_StepForward

  .return:
    RTS


;;; $87FB: Fight AI - index 10h - roar and step forwards (unused) ;;;
UNUSED_FightAI_Crocomire_10_RoarAndStepForwards_A487FB:
;; Returns:
;;     Y: Instruction list pointer
    LDA.W #$0006 : STA.W Crocomire.fightFunctionIndex
    LDY.W #InstList_Crocomire_WaitForFirstSecondDamage_Roar
    RTS


;;; $8805: Set fight intro moving claws instruction list (unused) ;;;
UNUSED_SetFightIntroMovingClawsInstList_A48805:
    LDY.W #InstList_Crocomire_WaitForFirstSecondDamage_MovingClaws
    LDA.W Crocomire.fightFlags : AND.W #$FBFF : STA.W Crocomire.fightFlags
    RTS


;;; $8812: Fight AI - index 12h - wait for first damage ;;;
FightAI_Crocomire_12_WaitForFirstDamage:
;; Returns:
;;     Y: Instruction list pointer
    LDA.W Crocomire.fightFlags : BIT.W #$0800 : BEQ .notDamaged
    LDA.W Crocomire.fightFlags : AND.W #$F7FF : STA.W Crocomire.fightFlags
    LDY.W #InstList_Crocomire_StepBack
    LDA.W #$0014 : STA.W Crocomire.fightFunctionIndex
    RTS

  .notDamaged:
    CPY.W #InstList_Crocomire_WaitForFirstSecondDamage_RoarCloseMouth_1 : BMI .return
    LDY.W #InstList_Crocomire_WaitForFirstSecondDamage_Roar

  .return:
    RTS


;;; $8836: Fight AI - index 14h - wait for second damage ;;;
FightAI_Crocomire_14_WaitForSecondDamage:
;; Returns:
;;     Y: Instruction list pointer
    LDA.W Crocomire.fightFlags : BIT.W #$0800 : BEQ .notDamaged
    LDA.W Crocomire.fightFlags : AND.W #$F7FF : STA.W Crocomire.fightFlags
    LDY.W #InstList_Crocomire_StepBack
    LDA.W #$000C : STA.W Crocomire.fightFunctionIndex
    RTS

  .notDamaged:
    CPY.W #InstList_Crocomire_WaitForFirstSecondDamage_RoarCloseMouth_1 : BMI .return
    LDY.W #InstList_Crocomire_WaitForFirstSecondDamage_Roar

  .return:
    RTS


;;; $885A: Fight AI - index 16h - wait for second damage (unused) ;;;
UNUSED_FightAI_Crocomire_16_WaitForSecondDamage_A4885A:
;; Returns:
;;     Y: Instruction list pointer

; Clone of FightAI_Crocomire_14_WaitForSecondDamage
    LDA.W Crocomire.fightFlags : BIT.W #$0800 : BEQ .notDamaged
    LDA.W Crocomire.fightFlags : AND.W #$F7FF : STA.W Crocomire.fightFlags
    LDY.W #InstList_Crocomire_StepBack
    LDA.W #$000C : STA.W Crocomire.fightFunctionIndex
    RTS

  .notDamaged:
    CPY.W #InstList_Crocomire_WaitForFirstSecondDamage_RoarCloseMouth_1 : BMI .return
    LDY.W #InstList_Crocomire_WaitForFirstSecondDamage_Roar

  .return:
    RTS


;;; $887E: Fight AI - index 18h - power bombed charge ;;;
FightAI_Crocomire_18_PowerBombedCharge:
;; Returns:
;;     Y: Instruction list pointer
    LDX.W EnemyIndex
    LDA.W Crocomire.stepCounter : DEC : STA.W Crocomire.stepCounter : CMP.W #$0002 : BPL .return
    STZ.W Crocomire.stepCounter
    LDA.W #$0006 : STA.W Crocomire.fightFunctionIndex
    LDY.W #InstList_Crocomire_StepForward

  .return:
    RTS


;;; $889A: Fight AI - index 1Ah - do near spike wall charge unless damaged (unused) ;;;
UNUSED_FightAI_Crocomire_1A_DoNearSpikeWallCharge_A4889A:
;; Returns:
;;     Y: Instruction list pointer

; The sound effect played here sound a bit like skree (sound 5Bh)
    LDX.W EnemyIndex
    LDA.W Crocomire.fightFlags : BIT.W #$0800 : BNE .SamusNotHitByClaw
    LDA.W #$000A : STA.W Crocomire.fightFunctionIndex,X
    LDY.W #InstList_Crocomire_WaitForFirstSecondDamage_RoarCloseMouth_0
    RTS

  .SamusNotHitByClaw:
    AND.W #$BF00 : ORA.W #$A000 : STA.W Crocomire.fightFlags
    LDA.W #$0001 : STA.W Crocomire.stepCounter
    LDA.W #$000A : STA.W Crocomire.YVelocity
    LDA.W #$000C : STA.W Crocomire.fightFunctionIndex
    LDA.W #$0054
    JSL QueueSound_Lib2_Max6
    RTS


;;; $88D2: Fight AI - index 1Ch - unused sequence - set initial instruction list ;;;
FightAI_Crocomire_1C_UnusedSequence_SetInitialInstList:
;; Returns:
;;     Y: Instruction list pointer
    LDX.W EnemyIndex
    JSR FightAI_Crocomire_0_LockUp_SetInitialInstList
    LDA.W Crocomire.fightFlags : ORA.W #$0200 : STA.W Crocomire.fightFlags
    LDA.W #$0020 : STA.W Crocomire.timer
    LDA.W #$001E : STA.W Crocomire.fightFunctionIndex
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $88EE: Unused. Charge Crocomire forward one step after delay ;;;
UNUSED_ChargeCrocomireForwardOneStepAfterDelay_A488EE:
    LDX.W EnemyIndex
    JSR FightAI_Crocomire_0_LockUp_SetInitialInstList
    LDA.W Crocomire.timer : BEQ .timerExpired
    DEC.W Crocomire.timer : BNE .return

  .timerExpired:
    LDX.W EnemyIndex
    JSR ChargeCrocomireForwardOneStep
    LDA.W #$0020 : STA.W Crocomire.fightFunctionIndex

  .return:
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $890B: Charge Crocomire forward one step ;;;
ChargeCrocomireForwardOneStep:
; Both callers of this function (which are both unused) immediately overwrite Crocomire.fightFunctionIndex
    LDA.W #$0014 : STA.W Crocomire.fightFunctionIndex,X
    LDA.W Crocomire.fightFlags : STA.W Crocomire.fightFlags
    LDY.W #UNUSED_InstList_Crocomire_ChargeForwardOneStep_A4BAEA
    RTS


;;; $891B: Fight AI - index 1Eh - unused sequence - choose forward moving attack ;;;
UNUSED_FightAI_Crocomire_1E_ChooseForwardMovingAttack_A4891B:
;; Returns:
;;     Y: Instruction list pointer
    LDX.W EnemyIndex
    LDA.W Crocomire.fightFlags : BIT.W #$0100 : BNE .setInstList
    JSR ChargeCrocomireForwardOneStep
    LDA.W #$0020 : STA.W Crocomire.fightFunctionIndex
    RTS

  .setInstList:
    JSR FightAI_Crocomire_0_LockUp_SetInitialInstList
    LDA.W #$0010 : STA.W Crocomire.timer
    LDA.W #$0022 : STA.W Crocomire.fightFunctionIndex
    RTS


;;; $8940: Fight AI - index 20h - unused sequence - do nothing and step forward ;;;
UNUSED_FightAI_Crocomire_20_DoNothingAndStepForward_A48940:
;; Returns:
;;     Y: Instruction list pointer
    LDX.W EnemyIndex
    JSR FightAI_Crocomire_0_LockUp_SetInitialInstList
    LDA.W Crocomire.timer : BNE .return
    LDA.W Crocomire.fightFlags : ORA.W #$2000 : STA.W Crocomire.fightFlags
    JSR FightAI_Crocomire_2_StepForwardUntilOnScreen_StepForward
    LDA.W #$0024 : STA.W Crocomire.fightFunctionIndex

  .return:
    RTS


;;; $895E: Fight AI - index 22h - unused sequence - move forward until hit Samus with claw ;;;
UNUSED_FightAI_Crocomire_22_MoveForwardUntilHitSamus_A4895E:
;; Returns:
;;     Y: Instruction list pointer
    LDA.W Enemy.XPosition : CMP.W #$02A0 : BPL .notAgainstSpikes
    LDX.W EnemyIndex
    JSR FightAI_Crocomire_2_StepForwardUntilOnScreen_StepForward
    LDA.W #$0024 : STA.W Crocomire.fightFunctionIndex
    LDA.W #$0003 : STA.W Crocomire.stepCounter
    RTS

  .notAgainstSpikes:
    LDA.W Crocomire.fightFlags : BIT.W #$4000 : BNE .SamusHitByClaw
    LDA.W #$0026 : STA.W Crocomire.fightFunctionIndex
    JSR UNUSED_SetFightIntroMovingClawsInstList_A48805

  .SamusHitByClaw:
    LDA.W Crocomire.fightFlags : BIT.W #$4000 : BEQ .return
    LDA.W #$0005 : STA.W Crocomire.stepCounter
    LDY.W #InstList_Crocomire_WaitForFirstSecondDamage_MovingClaws
    LDA.W Crocomire.fightFunctionIndex : STA.W Crocomire.projectileCounter
    LDA.W #$002A : STA.W Crocomire.fightFunctionIndex

  .return:
    RTS


;;; $89A8: Fight AI - index 24h - unused sequence - move claws and step forward ;;;
UNUSED_FightAI_Crocomire_24_MoveClaws_StepForward_A489A8:
;; Returns:
;;     Y: Instruction list pointer

; Crocomire.stepCounter is remaining number of times to do moving claws action
    LDX.W EnemyIndex
    LDA.W Crocomire.stepCounter : BEQ .timerExpired
    DEC.W Crocomire.stepCounter : BEQ .timerExpired
    LDA.W #$0024 : STA.W Crocomire.fightFunctionIndex
    STZ.W Crocomire.rumblingYOffset
    LDA.W Crocomire.fightFlags : ORA.W #$0400 : STA.W Crocomire.fightFlags
    LDY.W #InstList_Crocomire_WaitForFirstSecondDamage_MovingClaws
    RTS

  .timerExpired:
    JSR FightAI_Crocomire_2_StepForwardUntilOnScreen_StepForward
    LDA.W #$0028 : STA.W Crocomire.fightFunctionIndex
    LDA.W Crocomire.fightFlags : AND.W #$FBFF : STA.W Crocomire.fightFlags
    RTS


;;; $89DE: Fight AI - index 26h - unused sequence - step forward ;;;
UNUSED_FightAI_Crocomire_26_StepForward_A489DE:
;; Returns:
;;     Y: Instruction list pointer
    LDA.W Crocomire.fightFlags : BIT.W #$2000 : BNE .stepForward
    AND.W #$FCFF : STA.W Crocomire.fightFlags

  .stepForward:
    LDX.W EnemyIndex
    JSR FightAI_Crocomire_2_StepForwardUntilOnScreen_StepForward
    LDA.W #$0028 : STA.W Crocomire.fightFunctionIndex
    RTS


;;; $89F9: Fight AI - index 28h - unused sequence - moving claws ;;;
UNUSED_FightAI_Crocomire_28_MovingClaws_A489F9:
;; Returns:
;;     Y: Instruction list pointer

; Crocomire.stepCounter is remaining number of times to do moving claws action
; Crocomire.projectileCounter is the fight function index to change to when done moving claws (set by index 22h handler before advancing to unwritten 2Ah index)
    LDA.W Crocomire.timer : BNE .timerNotExpired
    LDA.W Crocomire.fightFlags : AND.W #$BFFF : STA.W Crocomire.fightFlags
    LDA.W #$0001 : STA.W Enemy.instTimer
    LDA.W Crocomire.projectileCounter : STA.W Crocomire.fightFunctionIndex
    LDY.W #InstList_Crocomire_WaitForFirstSecondDamage_MovingClaws
    RTS

  .timerNotExpired:
    LDA.W Crocomire.fightFlags : BIT.W #$4000 : BEQ .steppingBack
    DEC.W Crocomire.timer
    LDA.W #$003B
    JSL QueueSound_Lib2_Max6
    LDY.W #InstList_Crocomire_WaitForFirstSecondDamage_MovingClaws
    RTS

  .steppingBack:
    AND.W #$BFFF : STA.W Crocomire.fightFlags
    LDA.W #$000C : STA.W Crocomire.fightFunctionIndex
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $8A3A: Unused. Palette ;;;
UNUSED_Palette_Crocomire_A48A3A:
    dw $3800,$7FFF,$6B40,$6A80,$6980,$68E0,$6800,$5294
    dw $39CE,$2108,$08BF,$0895,$039F,$023A,$0176,$0000
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $8A5A: Initialisation AI - enemy $DDBF (Crocomire) ;;;
InitAI_Crocomire:
    REP #$30
    LDA.W #$0006 : STA.W BossID
    LDX.W #$0000
    LDA.W #$0338

  .loopBG2Tilemap:
    STA.L EnemyBG2Tilemap,X
    INX #2 : CPX.W #$1000 : BMI .loopBG2Tilemap
    LDX.W AreaIndex
    LDA.L SRAMMirror_Boss,X : BIT.W #$0002 : BNE .dead
    JSL DisableMinimap_MarkBossRoomTilesExplored
    STZ.W CrocomireMelting_TilesLoadingTableIndex
    LDX.W EnemyIndex
    STZ.W Crocomire.deathSequenceIndex,X : STZ.W Crocomire.YVelocity,X
    LDA.W #$0000 : STA.L Scrolls
    LDX.W #$0020

  .loopTargetPalette:
    LDA.W Palette_Crocomire_Sprite2,X : STA.L TargetPalettes_SpriteP2,X
    LDA.W Palette_Crocomire_Sprite5,X : STA.L TargetPalettes_SpriteP5,X
    DEX #2 : BPL .loopTargetPalette
    LDX.W EnemyIndex
    LDA.W #$0004 : STA.W Crocomire.fightFunctionIndex,X
    LDA.W #$0010 : STA.W unused179E
    LDA.W #$0002 : STA.W CameraDistanceIndex
    LDA.W #$0400 : STA.W EnemyBG2TilemapSize
    LDA.W #InstList_Crocomire_Initial : STA.W Enemy.instList,X
    LDA.W Enemy.properties2,X : ORA.W #$0004 : STA.W Enemy.properties2,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    RTL

  .dead:
    LDA.W #$0101 : STA.L Scrolls : STA.L Scrolls+2
    STZ.W CrocomireMelting_SkeletonLoadingIndex
    LDA.W Enemy.properties : ORA.W #$0400 : AND.W #$7FFF : STA.W Enemy.properties
    JSL Spawn_Hardcoded_PLM
    db $20,$03
    dw PLMEntries_clearCrocomireInvisibleWall
    JSL Spawn_Hardcoded_PLM
    db $1E,$03
    dw PLMEntries_clearCrocomireInvisibleWall
    JSL Spawn_Hardcoded_PLM
    db $61,$0B
    dw PLMEntries_clearCrocomiresBridge
    LDA.W #$0054 : STA.W Crocomire.deathSequenceIndex
    LDA.W #InstList_CrocomireCorpse_Skeleton_Dead : STA.W Enemy.instList
    LDA.W #$0001 : STA.W Enemy.instTimer
    LDA.W #$0240 : STA.W Enemy.XPosition
    LDA.W #$0090 : STA.W Enemy.YPosition
    LDA.W #$001C : STA.W Enemy.YHitboxRadius
    LDA.W #$0028 : STA.W Enemy.XHitboxRadius
    LDX.W VRAMWriteStack
    LDA.W #$0800 : STA.B VRAMWrite.size,X
    LDA.W #EnemyBG2Tilemap : STA.B VRAMWrite.src,X
    LDA.W #EnemyBG2Tilemap>>16 : STA.B VRAMWrite.src+2,X
    LDA.B DP_BG2TilemapAddrSize : AND.W #$00FC : XBA : STA.B VRAMWrite.dest,X
    TXA : CLC : ADC.W #$0007 : STA.W VRAMWriteStack
    RTL


;;; $8B5B: Update Crocomire BG2 scroll ;;;
UpdateCrocomireBG2Scroll:
    LDA.W Enemy.YPosition,X : SEC : SBC.W #$0043
    EOR.W #$FFFF : INC : STA.B DP_BG2YScroll
    LDX.W #$0020

  .loop:
    LDA.W Enemy.spritemap : CMP.W .pointers,X : BEQ .found
    DEX #2 : BPL .loop
    BRA UpdateCrocomireBG2XScroll

  .pointers:
    dw ExtendedSpritemap_Crocomire_ChargeForward_StepBack_0
    dw ExtendedSpritemap_Crocomire_ChargeForward_StepBack_1
    dw ExtendedSpritemap_Crocomire_ChargeForward_StepBack_2
    dw ExtendedSpritemap_Crocomire_ChargeForward_StepBack_3
    dw ExtendedSpritemap_Crocomire_ChargeForward_StepBack_4
    dw ExtendedSpritemap_Crocomire_ChargeForward_StepBack_5
    dw ExtendedSpritemap_Crocomire_ChargeForward_StepBack_6
    dw ExtendedSpritemap_Crocomire_ChargeForward_StepBack_7
    dw ExtendedSpritemap_Crocomire_ChargeForward_StepBack_8
    dw ExtendedSpritemap_Crocomire_ChargeForward_StepBack_9
    dw ExtendedSpritemap_Crocomire_ChargeForward_StepBack_A
    dw ExtendedSpritemap_Crocomire_ChargeForward_StepBack_B
    dw ExtendedSpritemap_Crocomire_MovingClaws_0
    dw ExtendedSpritemap_Crocomire_MovingClaws_1
    dw ExtendedSpritemap_Crocomire_MovingClaws_2
    dw ExtendedSpritemap_Crocomire_MovingClaws_3
    dw ExtendedSpritemap_Crocomire_MovingClaws_4

  .found:
    TAY
    LDA.W $001C,Y : CLC : ADC.B DP_BG2YScroll : STA.B DP_BG2YScroll
; fallthrough to UpdateCrocomireBG2XScroll


;;; $8BA4: Update Crocomire BG2 X scroll ;;;
UpdateCrocomireBG2XScroll:
    LDX.W EnemyIndex
    LDA.W Enemy.XPosition,X : CLC : ADC.W Enemy[1].var0,X : STA.W Enemy[1].XPosition,X
    LDA.W Enemy.YPosition,X : STA.W Enemy[1].YPosition,X
    LDA.W Enemy.XPosition,X : CMP.W Layer1XPosition : BPL .rightOffScreenCheck
    CLC : ADC.W #$0080 : CMP.W Layer1XPosition : BMI .offScreen

  .onScreen:
    LDA.W Layer1XPosition : SEC : SBC.W Enemy.XPosition,X
    CLC : ADC.W #$0033 : PHA : BPL +
    EOR.W #$FFFF : INC

+   CMP.W #$011C : BMI +
    PLA
    LDA.W #$0100 : PHA

+   PLA : STA.B DP_BG2XScroll
    RTL

  .offScreen:
    LDA.W #$0100 : STA.B DP_BG2XScroll
    RTL

  .rightOffScreenCheck:
    LDA.W Layer1XPosition : CLC : ADC.W #$0100 : STA.B DP_Temp12
    LDA.W Enemy.XPosition,X : SEC : SBC.W #$0080 : CMP.B DP_Temp12 : BPL .offScreen
    BRA .onScreen


;;; $8C04: Main AI - enemy $DDBF (Crocomire) ;;;
MainAI_Crocomire:
    PHB
    LDA.W Crocomire.deathSequenceIndex : TAX
    JSR.W (.pointers,X)
    JSR Crocomire_vs_Samus_CollisionHandling
    JSR CrocomireHurtFlashHandling
    PLB
    RTL

  .pointers:
    dw MainAI_Crocomire_DeathSequence_0_NotStarted
    dw MainAI_Crocomire_DeathSequence_2_Falling
    dw MainAI_Crocomire_DeathSequence_4_A_Hop_1_2_Resting
    dw MainAI_Crocomire_DeathSequence_6_C_Hop_1_2_Rising
    dw MainAI_Crocomire_DeathSequence_8_E_Hop_1_2_Sinking
    dw MainAI_Crocomire_DeathSequence_4_A_Hop_1_2_Resting
    dw MainAI_Crocomire_DeathSequence_6_C_Hop_1_2_Rising
    dw MainAI_Crocomire_DeathSequence_8_E_Hop_1_2_Sinking
    dw MainAI_Crocomire_DeathSequence_10_Hop_3_LoadMeltingTilemap
    dw MainAI_Crocomire_DeathSequence_12_2E_Hop_3_4_LoadMeltTiles
    dw MainAI_Crocomire_DeathSequence_14_30_Hop_3_6_UploadingToVRAM
    dw MainAI_Crocomire_DeathSequence_16_22_28_Hop_3_4_5_Rising
    dw MainAI_Crocomire_DeathSequence_18_Hop_3_QueueCry_HDMAObject
    dw MainAI_Crocomire_DeathSequence_1A_38_Hop_3_6_Melting
    dw MainAI_Crocomire_DeathSequence_1C_3A_Hop_3_6_ClearTilemap
    dw MainAI_Crocomire_DeathSequence_1E_24_2A_Hop_3_4_5_Sinking
    dw MainAI_Crocomire_DeathSequence_20_26_Hop_4_5_Resting
    dw MainAI_Crocomire_DeathSequence_16_22_28_Hop_3_4_5_Rising
    dw MainAI_Crocomire_DeathSequence_1E_24_2A_Hop_3_4_5_Sinking
    dw MainAI_Crocomire_DeathSequence_20_26_Hop_4_5_Resting
    dw MainAI_Crocomire_DeathSequence_16_22_28_Hop_3_4_5_Rising
    dw MainAI_Crocomire_DeathSequence_1E_24_2A_Hop_3_4_5_Sinking
    dw MainAI_Crocomire_DeathSequence_2C_Hop_6_LoadMeltingTilemap
    dw MainAI_Crocomire_DeathSequence_12_2E_Hop_3_4_LoadMeltTiles
    dw MainAI_Crocomire_DeathSequence_14_30_Hop_3_6_UploadingToVRAM
    dw MainAI_Crocomire_DeathSequence_32_SetIndex34
    dw MainAI_Crocomire_DeathSequence_34_Hop_6_Rising
    dw MainAI_Crocomire_DeathSequence_36_Hop_6_QueueCry_HDMAObject
    dw MainAI_Crocomire_DeathSequence_1A_38_Hop_3_6_Melting
    dw MainAI_Crocomire_DeathSequence_1C_3A_Hop_3_6_ClearTilemap
    dw MainAI_Crocomire_DeathSequence_3C_Hop_6_Sinking
    dw MainAI_Crocomire_DeathSequence_3E_BehindWall_WaitForSamus
    dw MainAI_Crocomire_DeathSequence_40_BehindWall_Rumbling
    dw MainAI_Crocomire_DeathSequence_42_BehindWall_NoMoreRumbling
    dw MainAI_Crocomire_DeathSequence_44_BreaksDownWall
    dw MainAI_Crocomire_DeathSequence_46_SkeletonFalls
    dw MainAI_Crocomire_DeathSequence_48_SkeletonFallsApart
    dw MainAI_Crocomire_DeathSequence_4A_UnlockCamera
    dw MainAI_Crocomire_DeathSequence_4C_SetIndex4E
    dw MainAI_Crocomire_DeathSequence_4E_SetIndex50
    dw MainAI_Crocomire_DeathSequence_50_MarkEvent_PostDeathMusic
    dw RTS_A48C8F
    dw MainAI_Crocomire_DeathSequence_54_SetIndex56
    dw MainAI_Crocomire_DeathSequence_56_DeadDueToRoomEntry
    dw MainAI_Crocomire_DeathSequence_58_FlowingDownTheRiver


;;; $8C6E: Crocomire main AI - death sequence index 0 - death sequence not started ;;;
MainAI_Crocomire_DeathSequence_0_NotStarted:
    JSL HandleCrocomiresBridge
    LDA.W #$0101 : STA.L Scrolls+4
    LDA.W SamusXPosition : CMP.W #$0520 : BMI .bridgeNotInSight
    LDA.W #$0100 : STA.L Scrolls+4

  .bridgeNotInSight:
    LDX.W EnemyIndex
    JSL UpdateCrocomireBG2Scroll
; fallthrough to RTS_A48C8F


;;; $8C8F: RTS. Crocomire main AI - death sequence index 52h - dead (due to death sequence, final state) ;;;
RTS_A48C8F:
    RTS


;;; $8C90: Crocomire main AI - death sequence index 56h - dead (due to room entry, final state) ;;;
MainAI_Crocomire_DeathSequence_56_DeadDueToRoomEntry:
    STZ.B DP_BG2XScroll : STZ.B DP_BG2YScroll
    RTS


;;; $8C95: Crocomire / Samus collision handling ;;;
Crocomire_vs_Samus_CollisionHandling:
    LDA.W Crocomire.deathSequenceIndex : BNE .return
    LDA.W Enemy.XPosition : SEC : SBC.W Enemy.XHitboxRadius
    SBC.W SamusXRadius : SBC.W SamusXPosition : BPL .return
    JSL NormalEnemyTouchAI
    LDA.W Enemy.XPosition : SEC : SBC.W Enemy.XHitboxRadius
    SEC : SBC.W SamusXRadius : STA.W SamusXPosition : STA.W SamusPreviousXPosition
    LDA.W #$FFFC : STA.W ExtraSamusXDisplacement
    LDA.W #$FFFF : STA.W ExtraSamusYDisplacement

  .return:
    RTS


;;; $8CCB: Crocomire hurt flash handling ;;;
CrocomireHurtFlashHandling:
    LDA.W DoorTransitionFlagEnemiesPause : BNE .return
    LDA.W Enemy.flashTimer : BEQ .palette
    LDA.W NumberOfTimesMainEnemyRoutineExecuted : BIT.W #$0002 : BEQ .palette
    LDA.W #$7FFF
    LDX.W #$000E

  .loopWhite:
    STA.L Palettes_BG12P7,X
    DEX #2 : BPL .loopWhite
    RTS

  .palette:
    LDX.W #$000E

  .loopPalette:
    LDA.W Palette_Crocomire_BG12,X : STA.L Palettes_BG12P7,X
    DEX #2 : BPL .loopPalette

  .return:
    RTS


;;; $8CFB: Instruction - queue Crocomire's cry sound effect ;;;
Instruction_Crocomire_QueueCrySFX:
    PHX : PHY
    LDA.W #$0074
    JSL QueueSound_Lib2_Max6
    PLY : PLX
    RTL


;;; $8D07: Instruction - queue big explosion sound effect ;;;
Instruction_Crocomire_QueueBigExplosionSFX:
    PHX : PHY
    LDA.W #$0025
    JSL QueueSound_Lib2_Max6
    PLY : PLX
    RTL


;;; $8D13: Instruction - queue Crocomire's skeleton collapses sound effect ;;;
Instruction_Crocomire_QueueSkeletonCollapseSFX:
    PHX : PHY
    LDA.W #$0075
    JSL QueueSound_Lib2_Max6
    PLY : PLX
    RTL


;;; $8D1F: Handle playing Crocomire acid damage sound effect ;;;
HandlePlayingCrocomireAcidDamageSFX:
    PHX : PHY
    LDA.L Crocomire.acidDamageSFXTimer : BEQ .return
    DEC : STA.L Crocomire.acidDamageSFXTimer : BNE .return
    LDA.W #$0020 : STA.L Crocomire.acidDamageSFXTimer
    LDA.W #$0022
    JSL QueueSound_Lib3_Max6

  .return:
    PLY : PLX
    RTL


;;; $8D3F: Crocomire main AI - death sequence index 4/Ah - hop 1/2 - resting ;;;
MainAI_Crocomire_DeathSequence_4_A_Hop_1_2_Resting:
    JSL HandlePlayingCrocomireAcidDamageSFX
    JSL UpdateCrocomireBG2XScroll
; fallthrough to MainAI_Crocomire_DeathSequence_20_26_Hop_4_5_Resting


;;; $8D47: Crocomire main AI - death sequence index 20h/26h - hop 4/5 - resting ;;;
MainAI_Crocomire_DeathSequence_20_26_Hop_4_5_Resting:
    LDA.W Crocomire.timer : BEQ .timerExpired
    DEC : STA.W Crocomire.timer
    RTS

  .timerExpired:
    INC.W Crocomire.deathSequenceIndex : INC.W Crocomire.deathSequenceIndex
    LDA.W #$0300 : STA.W Crocomire.YVelocity
    RTS


;;; $8D5E: Handle Crocomire's bridge ;;;
HandleCrocomiresBridge:
    PHY
    LDA.W Enemy.XPosition : CMP.W #$0600 : BMI .notOnBridge
    CMP.W #$0610 : BPL .oneBlockDeep
    LDA.L CrocomireDeath_PreBridgeBlockDustCloudSpawnedFlag : BNE .returnUpper
    LDA.W #$0001 : STA.L CrocomireDeath_PreBridgeBlockDustCloudSpawnedFlag
    LDA.W #$0600 : STA.B DP_Temp12
    LDA.W #$00B0 : STA.B DP_Temp14
    LDA.W #$0015
    LDY.W #EnemyProjectile_MiscDust
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics

  .returnUpper:
    PLY
    RTL

  .notOnBridge:
    LDA.W #$0000 : STA.L CrocomireDeath_PreBridgeBlockDustCloudSpawnedFlag
    STA.L CrocomireDeath_BridgePart1CrumbledFlag : STA.L CrocomireDeath_BridgePart2CrumbledFlag
    STA.L neverRead900A
    PLY
    RTL

  .oneBlockDeep:
    LDA.W Enemy.XPosition : CMP.W #$0610 : BMI .deadCode
    CMP.W #$0620 : BPL .twoBlocksDeep
    LDA.L CrocomireDeath_BridgePart1CrumbledFlag : BNE .returnMiddle
    LDA.W #$0001 : STA.L CrocomireDeath_BridgePart1CrumbledFlag
    JSL Spawn_Hardcoded_PLM
    db $61,$0B
    dw PLMEntries_crumbleABlockOfCrocomiresBridge
    LDA.W #$0620 : STA.B DP_Temp12
    LDA.W #$00B0 : STA.B DP_Temp14
    LDA.W #$0015
    LDY.W #EnemyProjectile_MiscDust
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics

  .returnMiddle:
    PLY
    RTL

  .deadCode:
; This branch is never executed
    LDA.W #$0000 : STA.L CrocomireDeath_BridgePart1CrumbledFlag : STA.L CrocomireDeath_BridgePart2CrumbledFlag
    STA.L neverRead900A
    PLY
    RTL

  .twoBlocksDeep:
    LDA.W Enemy.XPosition : CMP.W #$0620 : BMI .deadCode2
    CMP.W #$0630 : BPL .threeBlocksDeep
    LDA.L CrocomireDeath_BridgePart2CrumbledFlag : BNE .returnLower
    LDA.W #$0001 : STA.L CrocomireDeath_BridgePart2CrumbledFlag
    JSL Spawn_Hardcoded_PLM
    db $62,$0B
    dw PLMEntries_crumbleABlockOfCrocomiresBridge
    JSL Spawn_Hardcoded_PLM
    db $63,$0B
    dw PLMEntries_crumbleABlockOfCrocomiresBridge
    LDA.W #$0630 : STA.B DP_Temp12
    LDA.W #$00B0 : STA.B DP_Temp14
    LDA.W #$0015
    LDY.W #EnemyProjectile_MiscDust
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics

  .returnLower:
    PLY
    RTL

  .deadCode2:
; This branch is never executed
    LDA.W #$0000 : STA.L CrocomireDeath_BridgePart2CrumbledFlag : STA.L neverRead900A
    PLY
    RTL

  .threeBlocksDeep:
    CMP.W CrocomireConstants_XThresholdBridge : BPL .collapseBridge
    PLY
    RTL

  .collapseBridge:
    JSR CollapseCrocomiresBridge
    LDA.W #$0001 : STA.L Crocomire.acidDamageSFXTimer
    LDA.W #$0001 : STA.L CrocomireDeath_AcidDamageSmokeTimer
    LDX.W EnemyIndex
    INC.W Crocomire.deathSequenceIndex,X : INC.W Crocomire.deathSequenceIndex,X
    LDA.W #$0002 : STA.L ExtraEnemy7800 : STA.L ExtraEnemy7800+$40
    STA.L ExtraEnemy7800+$80 : STA.L ExtraEnemy7800+$C0
    STA.L ExtraEnemy7800+$100 : STA.L ExtraEnemy7800+$140
    LDA.W #$0000 : STA.L ExtraEnemy7800+2 : STA.L ExtraEnemy7800+$42
    STA.L ExtraEnemy7800+$82 : STA.L ExtraEnemy7800+$C2
    STA.L ExtraEnemy7800+$102 : STA.L ExtraEnemy7800+$142
    LDA.W #$003B
    JSL QueueSound_Lib2_Max6
    LDA.W #$0000 : STA.L CrocomireDeath_CrumblingBridgeIndex
    JSL Spawn_Hardcoded_PLM
    db $4E,$03
    dw PLMEntries_createCrocomireInvisibleWall
    LDA.W #InstList_CrocomireTongue_BridgeCollapsed : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDA.W Enemy.properties,X : ORA.W #$0400 : STA.W Enemy.properties,X
    LDA.W #$7FFF : STA.W Enemy[1].instTimer,X
    LDA.W #InstList_Crocomire_Sleep : STA.W Enemy[1].instList,X
    LDA.W Enemy[1].properties : ORA.W #$0100 : STA.W Enemy[1].properties
    STZ.W Crocomire.YVelocity,X : STZ.W Crocomire.projectileCounter,X
    LDA.W #$0800 : STA.W Crocomire.YAcceleration,X
    LDA.W #$0010 : STA.W Enemy.YHitboxRadius
    PLY
    RTL


;;; $8EE5: Collapse Crocomire's bridge ;;;
CollapseCrocomiresBridge:
    JSL Spawn_Hardcoded_PLM
    db $61,$0B
    dw PLMEntries_clearABlockOfCrocomiresBridge
    JSL Spawn_Hardcoded_PLM
    db $62,$0B
    dw PLMEntries_clearABlockOfCrocomiresBridge
    JSL Spawn_Hardcoded_PLM
    db $63,$0B
    dw PLMEntries_clearABlockOfCrocomiresBridge
    JSL Spawn_Hardcoded_PLM
    db $64,$0B
    dw PLMEntries_clearABlockOfCrocomiresBridge
    JSL Spawn_Hardcoded_PLM
    db $65,$0B
    dw PLMEntries_clearABlockOfCrocomiresBridge
    JSL Spawn_Hardcoded_PLM
    db $66,$0B
    dw PLMEntries_clearABlockOfCrocomiresBridge
    JSL Spawn_Hardcoded_PLM
    db $67,$0B
    dw PLMEntries_clearABlockOfCrocomiresBridge
    JSL Spawn_Hardcoded_PLM
    db $68,$0B
    dw PLMEntries_clearABlockOfCrocomiresBridge
    JSL Spawn_Hardcoded_PLM
    db $69,$0B
    dw PLMEntries_clearABlockOfCrocomiresBridge
    JSL Spawn_Hardcoded_PLM
    db $6A,$0B
    dw PLMEntries_clearABlockOfCrocomiresBridge
    LDA.W #$0600 : STA.B DP_Temp12
    LDA.W #$00B0 : STA.B DP_Temp14
    LDA.W #$0015
    LDY.W #EnemyProjectile_MiscDust
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    LDA.W #$0610 : STA.B DP_Temp12
    LDA.W #$00C0 : STA.B DP_Temp14
    LDA.W #$0015
    LDY.W #EnemyProjectile_MiscDust
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    LDA.W #$0620 : STA.B DP_Temp12
    LDA.W #$00B0 : STA.B DP_Temp14
    LDA.W #$0015
    LDY.W #EnemyProjectile_MiscDust
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    LDA.W #$0630 : STA.B DP_Temp12
    LDA.W #$00C0 : STA.B DP_Temp14
    LDA.W #$0015
    LDY.W #EnemyProjectile_MiscDust
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    LDA.W #$0640 : STA.B DP_Temp12
    LDA.W #$00C0 : STA.B DP_Temp14
    LDA.W #$0015
    LDY.W #EnemyProjectile_MiscDust
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    LDA.W #$0650 : STA.B DP_Temp12
    LDA.W #$00C0 : STA.B DP_Temp14
    LDA.W #$0015
    LDY.W #EnemyProjectile_MiscDust
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    LDA.W #$0660 : STA.B DP_Temp12
    LDA.W #$00C0 : STA.B DP_Temp14
    LDA.W #$0015
    LDY.W #EnemyProjectile_MiscDust
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $8FC2: Unused. Move enemy down by [$14].[$12] ;;;
UNUSED_MoveEnemyDownBy14_12_A48FC2:
    JSL MoveEnemyDownBy_14_12
    RTL
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $8FC7: Instruction - shake screen ;;;
Instruction_Crocomire_ShakeScreen:
    PHX : PHY
    LDA.W #$0004 : STA.W EarthquakeType
    LDA.W #$0005 : STA.W EarthquakeTimer
    LDA.W #$0076
    JSL QueueSound_Lib2_Max6
    PLY : PLX
    RTL


;;; $8FDF: Instruction - move left 4px ;;;
Instruction_Crocomire_MoveLeft4Pixels:
    PHX : PHY
    LDX.W EnemyIndex
    LDA.W Crocomire.fightFlags : BIT.W #$0800 : BNE .return
    STZ.B DP_Temp12
    LDA.W #$FFFC : STA.B DP_Temp14
    JSL MoveEnemyRightBy_14_12_IgnoreSlopes

  .return:
    PLY : PLX
    RTL


;;; $8FFA: Instruction - move left 4px and spawn big dust cloud ;;;
Instruction_Crocomire_MoveLeft4Pixels_SpawnBigDustCloud:
    JSR SpawnBigDustCloudProjectileWithRandomXOffset
    BRA Instruction_Crocomire_MoveLeft4Pixels


;;; $8FFF: Instruction - move left 4px and spawn big dust cloud ;;;
Instruction_Crocomire_MoveLeft4Pixels_SpawnBigDustCloud_dup:
    JSR SpawnBigDustCloudProjectileWithRandomXOffset
    BRA Instruction_Crocomire_MoveLeft4Pixels


;;; $9004: Spawn big dust cloud enemy projectile with random X offset ;;;
SpawnBigDustCloudProjectileWithRandomXOffset:
    PHX
    LDA.W RandomNumberSeed : AND.W #$001F
    LDX.W RandomNumberSeed : CPX.W #$1000 : BMI .spawn
    EOR.W #$FFFF : INC

  .spawn:
    JSL SpawnBigDustCloudProjectile
    PLX
    RTS


;;; $901D: Instruction - move left 4px and spawn big dust cloud and handle spike wall collision ;;;
Instruction_Crocomire_MoveLeft_SpawnCloud_HandleSpikeWall:
    PHX : PHY
    LDX.W EnemyIndex
    STZ.B DP_Temp12
    LDA.W #$FFFC : STA.B DP_Temp14
    JSL MoveEnemyRightBy_14_12_IgnoreSlopes
    BCS .hitWall
    LDX.W #$0020
    LDA.W RandomNumberSeed : CMP.W #$0800 : BMI .spawnDustCloud
    LDX.W #$FFE0

  .spawnDustCloud:
    LDA.W RandomNumberSeed : AND.W #$000F
    STX.B DP_Temp12
    CLC : ADC.B DP_Temp12
    JSL SpawnBigDustCloudProjectile
    PLY : PLX
    RTL

  .hitWall:
    PLY
    LDY.W #InstList_Crocomire_BackOffFromSpikeWall
    LDA.W #$000E : STA.W Crocomire.fightFunctionIndex
    PLX
    RTL


;;; $905B: Instruction - move right 4px if on-screen ;;;
Instruction_Crocomire_MoveRight4PixelsIfOnScreen:
    PHX : PHY
    LDX.W EnemyIndex
    STZ.B DP_Temp12
    LDA.W #$0004 : STA.B DP_Temp14
    LDA.W Enemy.XPosition : SEC : SBC.W Enemy.XHitboxRadius
    SBC.W #$0100 : SBC.B DP_Temp14 : CMP.W Layer1XPosition : BPL .return
    JSL MoveEnemyRightBy_14_12_IgnoreSlopes

  .return:
    PLY : PLX
    RTL


;;; $907F: Instruction - move right 4px ;;;
Instruction_Crocomire_MoveRight4Pixels:
    PHX : PHY
    STZ.B DP_Temp12
    LDA.W #$0004 : STA.B DP_Temp14
    JSL MoveEnemyRightBy_14_12_IgnoreSlopes
    PLY : PLX
    RTL


;;; $908F: Instruction - move right 4px if on-screen and spawn big dust cloud ;;;
Instruction_Crocomire_MoveRight4PixelsIfOnScreen_SpawnCloud:
    JSR SpawnBigDustCloudProjectileWithRandomXOffset
    BRA Instruction_Crocomire_MoveRight4PixelsIfOnScreen


;;; $9094: Instruction - move right 4px and spawn big dust cloud ;;;
Instruction_Crocomire_MoveRight4Pixels_SpawnBigDustCloud:
    JSR SpawnBigDustCloudProjectileWithRandomXOffset
    BRA Instruction_Crocomire_MoveRight4Pixels


;;; $9099: Crocomire main AI - death sequence index 3Ch - hop 6 - sinking ;;;
MainAI_Crocomire_DeathSequence_3C_Hop_6_Sinking:
    JSR SetMelting2InstListPointer
    JSR HandleCrocomireAcidDamageSmoke
    JSR SinkCrocomireDown
    LDA.W Crocomire.deathSequenceIndex : CMP.W #$003E : BNE .return
    LDA.W #$0006
    JSL QueueMusicDataOrTrack_8FrameDelay
    LDA.W #$0058 : STA.W Crocomire.deathSequenceIndex
    LDA.W #InstList_CrocomireCorpse_Skeleton_FlowingDownTheRiver : STA.W Enemy.instList
    LDA.W #$0101 : STA.L Scrolls+4
    STZ.W DisableMinimap
    LDA.W Enemy[1].properties : ORA.W #$0200 : STA.W Enemy[1].properties
    JSL Spawn_Hardcoded_PLM
    db $4E,$03
    dw PLMEntries_clearCrocomireInvisibleWall
    STZ.W CameraDistanceIndex : STZ.W CrocomireMelting_SkeletonLoadingIndex

  .return:
    RTS


;;; $90DF: Set melting 2 instruction list pointer ;;;
SetMelting2InstListPointer:
    LDA.W Enemy.YPosition
    LDY.W #InstList_Crocomire_Melting2_TopRow
    CMP.W #$0118 : BPL .setInstList
    LDY.W #InstList_Crocomire_Melting2_Top2Rows
    CMP.W #$0108 : BPL .setInstList
    LDY.W #InstList_Crocomire_Melting2_Top3Rows
    CMP.W #$00F8 : BPL .setInstList
    LDY.W #InstList_Crocomire_Melting2_Top4Rows

  .setInstList:
    TYA : STA.W Enemy.instList
    LDA.W #$0001 : STA.W Enemy.instTimer
    RTS


;;; $9108: Crocomire main AI - death sequence index 1Eh/24h/2Ah - hop 3/4/5 - sinking ;;;
MainAI_Crocomire_DeathSequence_1E_24_2A_Hop_3_4_5_Sinking:
    JSR HandleCrocomireAcidDamageSmoke
    LDA.W Enemy.YPosition
    LDY.W #InstList_Crocomire_Melting1_TopRow
    CMP.W #$0118 : BPL .setInstList
    LDY.W #InstList_Crocomire_Melting1_Top2Rows
    CMP.W #$0108 : BPL .setInstList
    LDY.W #InstList_Crocomire_Melting1_Top3Rows
    CMP.W #$00F8 : BPL .setInstList
    LDY.W #InstList_Crocomire_Melting1_Top4Rows

  .setInstList:
    TYA : STA.W Enemy.instList
    LDA.W #$0001 : STA.W Enemy.instTimer
    JMP SinkCrocomireDown


;;; $9136: Crocomire main AI - death sequence index 2 - falling ;;;
MainAI_Crocomire_DeathSequence_2_Falling:
    LDA.L CrocomireDeath_CrumblingBridgeIndex : CMP.W #$0016 : BMI .indexLessThan16
    JMP MainAI_Crocomire_DeathSequence_8_E_Hop_1_2_Sinking

  .indexLessThan16:
    TAX
    INC #2 : STA.L CrocomireDeath_CrumblingBridgeIndex
    LDA.W .XPositions,X
    LDY.W #EnemyProjectile_CrocomireBridgeCrumbling
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    JMP MainAI_Crocomire_DeathSequence_8_E_Hop_1_2_Sinking

  .XPositions:
; Crocomire bridge crumbling enemy projectile X positions
; Note that these are all on the screen to the right of the one Crocomire dies on,
; and they use the normal floor graphics, not the bridge graphics
; I would guess that this is a leftover effect from a previous room design
    dw $0780,$0730,$0790,$0740,$07B0,$0760,$07A0,$0770
    dw $0710,$0750,$0720


;;; $916C: Handle Crocomire acid damage smoke ;;;
HandleCrocomireAcidDamageSmoke:
    LDA.L CrocomireDeath_AcidDamageSmokeTimer : DEC : STA.L CrocomireDeath_AcidDamageSmokeTimer : BNE .return
    LDA.W #$0006 : STA.L CrocomireDeath_AcidDamageSmokeTimer
    LDA.W RandomNumberSeed : AND.W #$003F : TAX
    LDA.W RandomNumberSeed : BIT.W #$0002 : BNE +
    TXA : EOR.W #$FFFF : TAX

+   TXA : CLC : ADC.W Enemy.XPosition : STA.B DP_Temp12
    LDA.W RandomNumberSeed : AND.W #$1F00 : XBA : STA.B DP_Temp14
    LDA.W FX_LavaAcidYPosition : CLC : ADC.W #$0010
    SEC : SBC.B DP_Temp14 : STA.B DP_Temp14
    LDA.W #$0015 : STA.B DP_Temp16
    STZ.B DP_Temp18
    JSL Create_Sprite_Object

  .return:
    RTS


;;; $91BA: Crocomire main AI - death sequence index 8/Eh - hop 1/2 - sinking ;;;
MainAI_Crocomire_DeathSequence_8_E_Hop_1_2_Sinking:
    JSL HandlePlayingCrocomireAcidDamageSFX
    JSR HandleCrocomireAcidDamageSmoke
; fallthrough to SinkCrocomireDown


;;; $91C1: Sink Crocomire down ;;;
SinkCrocomireDown:
; The tilemap row offset calculated at .reachedLeftLedge is 20h px into the vertically wrapped section of BG2 (recall that BG2 size = 64x32),
; i.e. where the bottom of Crocomire would start to appear below the HUD
    JSR ResetCrocomireBG2YScrollHDMADataTable
    LDA.W Crocomire.fightFlags : AND.W #$F7FF : STA.W Crocomire.fightFlags
    LDX.W EnemyIndex
    JSL UpdateCrocomireBG2Scroll
    LDA.W Enemy.YPosition,X : CMP.W #$0118 : BMI .reachedLeftLedge
    INC.W Crocomire.deathSequenceIndex,X : INC.W Crocomire.deathSequenceIndex,X
    LDA.W #$0030 : STA.W Crocomire.timer
    RTS

  .reachedLeftLedge:
    LDA.B DP_BG2YScroll : EOR.W #$FFFF : INC : STA.B DP_Temp12
    LDA.W #$0120 : SEC : SBC.B DP_Temp12 : AND.W #$FFF8 : ASL #3 : TAX
    LDA.W #$0020 : STA.B DP_Temp12
    LDA.W #$0338

  .loopTilemap:
    STA.L EnemyBG2Tilemap,X
    INX #2
    DEC.B DP_Temp12 : BNE .loopTilemap
    LDA.W #$0001 : STA.W RequestEnemyBG2TilemapTransferFlag
    LDA.W Enemy.properties2 : AND.W #$7FFF : STA.W Enemy.properties2
    LDX.W EnemyIndex
    SEP #$20
    LDA.W Crocomire.YAcceleration,X : CLC : ADC.B #$80 : STA.W Crocomire.YAcceleration,X
    LDA.W Crocomire.YAcceleration+1,X : ADC.B #$03 : CMP.B #$30 : BMI +
    LDA.B #$30

+   STA.W Crocomire.YAcceleration+1,X
    CLC : ADC.W Crocomire.YVelocity,X : STA.W Crocomire.YVelocity,X
    LDA.W Enemy.var4+1,X : ADC.B #$00 : CMP.B #$03 : BMI +
    LDA.B #$03

+   STA.W Enemy.var4+1,X
    LDA.W Crocomire.YVelocity,X : CLC : ADC.W Enemy.var5+1,X : STA.W Enemy.var5+1,X
    LDA.W Enemy.var4+1,X : ADC.W Enemy.YPosition,X : STA.W Enemy.YPosition,X
    LDA.W Enemy.YPosition+1,X : ADC.B #$00 : STA.W Enemy.YPosition+1,X
    REP #$20
    RTS


;;; $926E: Crocomire main AI - death sequence index 34h - hop 6 - rising ;;;
MainAI_Crocomire_DeathSequence_34_Hop_6_Rising:
    LDX.W EnemyIndex
    LDA.W Enemy.YPosition,X
    LDY.W #InstList_Crocomire_Melting2_TopRow
    CMP.W #$0118 : BPL .setInstListPointer
    LDY.W #InstList_Crocomire_Melting2_Top2Rows
    CMP.W #$0108 : BPL .setInstListPointer
    LDY.W #InstList_Crocomire_Melting2_Top3Rows
    CMP.W #$00F8 : BPL .setInstListPointer
    LDY.W #InstList_Crocomire_Melting2_Top4Rows

  .setInstListPointer:
    TYA : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    JSR HandleCrocomireAcidDamageSmoke
    BRA RaiseCrocomireUp


;;; $929E: Crocomire main AI - death sequence index 16h/22h/28h - hop 3/4/5 - rising ;;;
MainAI_Crocomire_DeathSequence_16_22_28_Hop_3_4_5_Rising:
    JSR HandleCrocomireAcidDamageSmoke
    LDX.W EnemyIndex
    LDA.W Enemy.YPosition,X
    LDY.W #InstList_Crocomire_Melting1_TopRow
    CMP.W #$0118 : BPL .setInstListPointer
    LDY.W #InstList_Crocomire_Melting1_Top2Rows
    CMP.W #$0108 : BPL .setInstListPointer
    LDY.W #InstList_Crocomire_Melting1_Top3Rows
    CMP.W #$00F8 : BPL .setInstListPointer
    LDY.W #InstList_Crocomire_Melting1_Top4Rows

  .setInstListPointer:
    TYA : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    BRA RaiseCrocomireUp


;;; $92CE: Crocomire main AI - death sequence index 6/Ch - hop 1/2 - rising ;;;
MainAI_Crocomire_DeathSequence_6_C_Hop_1_2_Rising:
    JSL HandlePlayingCrocomireAcidDamageSFX
    JSR HandleCrocomireAcidDamageSmoke
    LDX.W EnemyIndex
; fallthrough to RaiseCrocomireUp


;;; $92D8: Rise Crocomire up ;;;
RaiseCrocomireUp:
    JSR ResetCrocomireBG2YScrollHDMADataTable
    LDX.W EnemyIndex
    LDA.W Enemy.YPosition,X : CMP.W #$00DA : BPL .raised
    LDX.W EnemyIndex ; >.<
    INC.W Crocomire.deathSequenceIndex,X : INC.W Crocomire.deathSequenceIndex,X
    RTS

  .raised:
    JSL UpdateCrocomireBG2Scroll
    LDA.W Crocomire.YAcceleration : CLC : ADC.W #$0100 : CMP.W #$1F00 : BMI +
    LDA.W #$1F00

+   STA.W Crocomire.YAcceleration
    SEP #$20
    LDA.W Crocomire.YVelocity : SEC : SBC.W Enemy.var3+1 : STA.W Crocomire.YVelocity
    LDA.W Enemy.var4+1 : SBC.B #$00 : BPL .positiveYVelocity
    LDA.B #$FF : STA.W Crocomire.YVelocity
    LDA.B #$00

  .positiveYVelocity:
    STA.W Enemy.var4+1
    LDA.W Enemy.var5+1 : SEC : SBC.W Crocomire.YVelocity : STA.W Enemy.var5+1
    LDA.W Enemy.YPosition : SBC.W Enemy.var4+1 : STA.W Enemy.YPosition
    LDA.W Enemy.YPosition+1 : SBC.B #$00 : STA.W Enemy.YPosition+1
    REP #$20
    RTS


;;; $9341: Crocomire main AI - death sequence index 10h - hop 3 - load melting tilemap ;;;
MainAI_Crocomire_DeathSequence_10_Hop_3_LoadMeltingTilemap:
    LDA.W #$0030 : STA.W CrocomireMelting_PixelsToErasePerColumn : STA.W CrocomireMelting_SkeletonLoadingIndex
    LDX.W EnemyIndex
    INC.W Crocomire.deathSequenceIndex,X : INC.W Crocomire.deathSequenceIndex,X
    LDA.W #InstList_Crocomire_Melting1_TopRow : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDA.W #$0001 : STA.W RequestEnemyBG2TilemapTransferFlag
    LDA.W #InstList_CrocomireTongue_Melting : STA.W Enemy[1].instList,X
    LDA.W #$0001 : STA.W Enemy[1].instTimer,X
    LDA.W Enemy[1].properties,X : ORA.W #$2C00 : AND.W #$FEFF : STA.W Enemy[1].properties,X
    LDA.W Enemy.XPosition,X : STA.W Enemy[1].XPosition,X
    LDA.W Enemy.YPosition,X : CLC : ADC.W #$0010 : STA.W Enemy[1].YPosition,X
    LDX.W #$0000
    LDA.W #$0338

  .loopClearTilemap:
    STA.L EnemyBG2Tilemap,X : STA.L EnemyBG2Tilemap+2,X
    INX #4 : CPX.W #$0400 : BMI .loopClearTilemap
    LDX.W #$0000

  .loopMeltingTilemap:
    LDA.L MeltingCrocomireTilesLoadingTable_Tilemap_Melting1,X : CMP.W #$FFFF : BEQ .done
    STA.L EnemyBG2Tilemap+$40,X
    INX #2
    BRA .loopMeltingTilemap

  .done:
    TXA : CLC : ADC.W #$0400 : TAX
; fallthrough to WriteCrocomireBG2Tilemap


;;; $93BE: Write Crocomire BG2 tilemap ;;;
WriteCrocomireBG2Tilemap:
;; Parameters:
;;     X: BG2 tilemap size. 600h (little excessive...)
    TXY
    LDX.W VRAMWriteStack
    STY.B VRAMWrite.size,X
    LDA.W #EnemyBG2Tilemap : STA.B VRAMWrite.src,X
    LDA.W #EnemyBG2Tilemap>>16 : STA.B VRAMWrite.src+2,X
    LDA.B DP_BG2TilemapAddrSize : AND.W #$00FC : XBA : STA.B VRAMWrite.dest,X
    TXA : CLC : ADC.W #$0007 : STA.W VRAMWriteStack
    RTS


;;; $93DF: Reset Crocomire BG2 Y scroll HDMA data table ;;;
ResetCrocomireBG2YScrollHDMADataTable:
    LDA.B DP_BG2YScroll
    LDX.W #$01FE

  .loop:
    STA.L CrocomireBG2YScrollHDMADataTable,X
    DEX #2 : BPL .loop
    RTS


;;; $93ED: Crocomire main AI - death sequence index 2Ch - hop 6 - load melting tilemap ;;;
MainAI_Crocomire_DeathSequence_2C_Hop_6_LoadMeltingTilemap:
    JSR ResetCrocomireBG2YScrollHDMADataTable
    LDX.W EnemyIndex
    INC.W Crocomire.deathSequenceIndex,X : INC.W Crocomire.deathSequenceIndex,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDA.W #$0030 : STA.W CrocomireMelting_PixelsToErasePerColumn : STA.W CrocomireMelting_SkeletonLoadingIndex
    LDA.W #InstList_Crocomire_Melting2_TopRow : STA.W Enemy.instList,X
    LDX.W #$0000
    LDA.W #$0338

  .loopClearTilemap:
    STA.L EnemyBG2Tilemap,X
    INX #2 : CPX.W #$0800 : BMI .loopClearTilemap
    LDX.W #$0000

  .loopMeltingTilemap:
    LDA.L MeltingCrocomireTilesLoadingTable_Tilemap_Melting2,X : CMP.W #$FFFF : BEQ .done
    STA.L EnemyBG2Tilemap+$40,X
    INX #2
    BRA .loopMeltingTilemap

  .done:
    TXA : CLC : ADC.W #$0400 : TAX
    JMP WriteCrocomireBG2Tilemap


;;; $943C: RTL ;;;
RTL_A4943C:
    RTL


;;; $943D: Crocomire main AI - death sequence index 12h/2Eh - hop 3/6 - load melting tiles ;;;
MainAI_Crocomire_DeathSequence_12_2E_Hop_3_4_LoadMeltTiles:
; The loop at .loopYOffsets seems to accidentally clear the "transfer Samus' top half tiles to VRAM" flag,
; but this is harmless, as the Samus drawing code is executed after enemy AI is processed

; The loop that does the copying from ROM to WRAM seems to be copying twice as many bytes as it needs to (missing LSR before writing to $12)
    REP #$30
    PHB
    LDX.W EnemyIndex
    INC.W Crocomire.deathSequenceIndex,X : INC.W Crocomire.deathSequenceIndex,X
    LDA.W #$0100 : STA.W CrocomireMelting_DisplacementCoefficient
    STZ.W CrocomireMelting_XOffsetTableIndex
    LDX.W CrocomireMelting_TilesLoadingTableIndex
    LDA.W MeltingCrocomireTilesLoadingTable_Melting1_0,X : STA.W CrocomireMelting_MaxAdjustedDestYOffset : STA.W CrocomireMelting_InitialAdjustedDestYOffset
    LDA.W MeltingCrocomireTilesLoadingTable_Melting1_0+2,X : STA.W CrocomireMelting_NeverRead0696
    LDA.W MeltingCrocomireTilesLoadingTable_Melting1_0+4,X : STA.W CrocomireMelting_WordsToLoad
    STZ.B DP_Temp00
    LDA.W MeltingCrocomireTilesLoadingTable_Melting1_0+6,X : STA.B DP_Temp02
    TXA : CLC : ADC.W #$0008 : TAX

  .loop:
    LDY.W MeltingCrocomireTilesLoadingTable_Melting1_0,X : CPY.W #$FFFF : BEQ .done
    PHX
    LDA.W MeltingCrocomireTilesLoadingTable_Melting1_0+2,X : TAX
    LDA.W CrocomireMelting_WordsToLoad : STA.B DP_Temp12

  .loopInner:
    LDA.B [DP_Temp00],Y : STA.L CrocomireMeltingBG2Tiles&$FF0000,X
    INX #2
    INY #2
    DEC.B DP_Temp12 : BPL .loopInner
    PLX : INX #4
    BRA .loop

  .done:
    INX #2 : STX.W CrocomireMelting_TilesLoadingTableIndex : STX.W CrocomireMelting_TilesLoadingTable
    LDX.W #$0080

  .loopYOffsets:
    STZ.W CrocomireMelting_YOffsets,X
    DEX #2 : BPL .loopYOffsets
    PLB
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $94B2: Unused. Upload melting tiles to VRAM ;;;
UNUSED_UploadCrocomireMeltingTilesToVRAM_A494B2:
    JSR MainAI_Crocomire_DeathSequence_14_30_Hop_3_6_UploadingToVRAM
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $94B6: Crocomire main AI - death sequence index 14h/30h - hop 3/6 - uploading to VRAM ;;;
MainAI_Crocomire_DeathSequence_14_30_Hop_3_6_UploadingToVRAM:
    LDX.W CrocomireMelting_TilesLoadingTable
    LDY.W VRAMWriteStack
    LDA.W MeltingCrocomireTilesLoadingTable_Melting1_0,X : CMP.W #$FFFF : BEQ .terminator
    STA.W VRAMWrite.size,Y
    LDA.W MeltingCrocomireTilesLoadingTable_Melting1_0+6,X : STA.W VRAMWrite.src,Y
    LDA.W MeltingCrocomireTilesLoadingTable_Melting1_0+4,X : STA.W VRAMWrite.src+2,Y
    LDA.W MeltingCrocomireTilesLoadingTable_Melting1_0+2,X : STA.W VRAMWrite.dest,Y
    TYA : CLC : ADC.W #$0007 : TAY
    TXA : CLC : ADC.W #$0008 : STA.W CrocomireMelting_TilesLoadingTable
    STY.W VRAMWriteStack
    RTS

  .terminator:
    STY.W VRAMWriteStack
    LDX.W EnemyIndex
    INC.W Crocomire.deathSequenceIndex,X : INC.W Crocomire.deathSequenceIndex,X
    STZ.W CrocomireMelting_TilesLoadingTable
    RTS


;;; $94FB: Crocomire main AI - death sequence index 18h - hop 3 - queue cry and create Crocomire melting HDMA object ;;;
MainAI_Crocomire_DeathSequence_18_Hop_3_QueueCry_HDMAObject:
    REP #$30
    LDA.W #$0077
    JSL QueueSound_Lib2_Max6
    BRA CreateCrocomireMeltingHDMAObject


;;; $9506: Crocomire main AI - death sequence index 36h - hop 6 - queue cry and create Crocomire melting HDMA object ;;;
MainAI_Crocomire_DeathSequence_36_Hop_6_QueueCry_HDMAObject:
    REP #$30
    LDA.W #$002D
    JSL QueueSound_Lib2_Max6
; fallthrough to CreateCrocomireMeltingHDMAObject


;;; $950F: Create Crocomire melting HDMA object ;;;
CreateCrocomireMeltingHDMAObject:
    LDA.W Enemy[1].YPosition : SEC : SBC.W #$0048 : ASL : TAX
    LDA.B DP_BG2YScroll

  .loop:
    STA.L CrocomireBG2YScrollHDMADataTable,X
    DEX #2 : BPL .loop
    LDX.W EnemyIndex
    INC.W Crocomire.deathSequenceIndex,X : INC.W Crocomire.deathSequenceIndex,X
    LDA.W Enemy.XPosition : STA.W Crocomire.timer102E
    PHP
    LDA.W #$00FF : STA.L CrocomireBG2YScrollIndirectHDMATable
    LDA.W #CrocomireBG2YScrollHDMADataTable : STA.L CrocomireBG2YScrollIndirectHDMATable+1
    LDA.W #$00E1 : STA.L CrocomireBG2YScrollIndirectHDMATable+3
    LDA.W #$CBEE : STA.L CrocomireBG2YScrollIndirectHDMATable+4
    LDA.W #$0000 : STA.L CrocomireBG2YScrollIndirectHDMATable+6
    JSL Spawn_HDMAObject
    db $42,$10
    dw InstList_HDMAObject_CrocomireMelting_0
    STA.L Crocomire.meltingHDMAObjectIndex
    PLP
    RTS


;;; $9563: Crocomire melting HDMA object instruction list ;;;
InstList_HDMAObject_CrocomireMelting_0:
    dw Instruction_HDMAObject_HDMATableBank : db $7E
    dw Instruction_HDMAObject_IndirectHDMATableBank : db $7E
    dw Instruction_HDMAObject_PreInstructionInY
    dl RTL_A4943C

InstList_HDMAObject_CrocomireMelting_1:
    dw $7777,CrocomireBG2YScrollIndirectHDMATable
    dw Instruction_HDMAObject_GotoY
    dw InstList_HDMAObject_CrocomireMelting_1


;;; $9576: Crocomire main AI - death sequence index 32h - set index 34h ;;;
MainAI_Crocomire_DeathSequence_32_SetIndex34:
    LDX.W EnemyIndex
    INC.W Crocomire.deathSequenceIndex,X : INC.W Crocomire.deathSequenceIndex,X
    RTS


;;; $9580: Crocomire main AI - death sequence index 1Ah/38h - hop 3/6 - melting ;;;
MainAI_Crocomire_DeathSequence_1A_38_Hop_3_6_Melting:
; Copy+paste from RAM map:
;     CrocomireMelting_SrcYOffset: Adjusted source Y offset. CrocomireMelting_InitialAdjustedDestYOffset + y
;     CrocomireMelting_DisplacementCoefficient: Crocomire melting displacement coefficient. Displacement = y * [CrocomireMelting_DisplacementCoefficient] / 10000h. Initialised to 100h. Incremented by 180h up to 5000h, finishing the melting
;     CrocomireMelting_InitialAdjustedDestYOffset: Initial adjusted destination Y offset during melting. Initialised to 58h (MeltingCrocomireTilesLoadingTable_Melting1_0/MeltingCrocomireTilesLoadingTable_Melting2_0). Decremented by 3 until 10h
;     CrocomireMelting_MaxAdjustedDestYOffset: Max adjusted destination Y offset (58h) during melting. HDMA data table is processed until CrocomireMelting_InitialAdjustedDestYOffset + y - displacement(y) >= CrocomireMelting_MaxAdjustedDestYOffset
    REP #$30
    JSR HandleCrocomireAcidDamageSmoke
    LDX.W Crocomire.timer102E
    DEC.W Crocomire.rumblingYOffset
    LDA.W Crocomire.rumblingYOffset : AND.W #$0002 : BEQ +
    TXA : CLC : ADC.W #$0004 : TAX

+   STX.W Enemy.XPosition
    JSL EraseMeltingCrocomirePixelColumn
    CMP.W #$0000 : BNE .noError

  .finished:
    LDX.W EnemyIndex
    INC.W Crocomire.deathSequenceIndex,X : INC.W Crocomire.deathSequenceIndex,X
    LDX.W CrocomireMelting_TilesLoadingTableIndex

  .loopFindTerminator:
    LDA.W MeltingCrocomireTilesLoadingTable_Melting1_0,X : CMP.W #$FFFF : BEQ .terminator
    TXA : CLC : ADC.W #$0008 : TAX
    BRA .loopFindTerminator

  .terminator:
    INX #2 : STX.W CrocomireMelting_TilesLoadingTableIndex
    LDA.L Crocomire.meltingHDMAObjectIndex : TAX
    LDA.W #$0000 : STA.W HDMAObject_ChannelBitflags,X
    RTS

  .noError:
    LDX.W EnemyIndex
    JSL UpdateCrocomireBG2Scroll
    LDA.W CrocomireMelting_DisplacementCoefficient : TAX
    AND.W #$FF00 : XBA : STA.B DP_Temp12
    LDA.W CrocomireMelting_InitialAdjustedDestYOffset : SEC : SBC.W #$0003 : CMP.W #$0010 : BPL +
    CPX.W #$5000 : BPL .finished
    LDA.W #$0010

+   STA.W CrocomireMelting_InitialAdjustedDestYOffset
    LDA.W CrocomireMelting_DisplacementCoefficient : CLC : ADC.W #$0180 : CMP.W #$5000 : BMI +
    LDA.W #$5000

+   STA.W CrocomireMelting_DisplacementCoefficient
    STZ.B DP_Temp12
    LDA.W Enemy[1].YPosition : SEC : SBC.W #$0048 : ASL : TAX
    LDA.W CrocomireMelting_InitialAdjustedDestYOffset : TAY
    STA.W CrocomireMelting_SrcYOffset
    ASL

  .loopMeltingRows:
    TYA : SEC : SBC.W CrocomireMelting_SrcYOffset
    CLC : ADC.B DP_BG2YScroll : STA.L CrocomireBG2YScrollHDMADataTable,X
    LDA.B DP_Temp12 : CLC : ADC.W CrocomireMelting_DisplacementCoefficient : STA.B DP_Temp12 : BCS .carrySet
    INY

  .carrySet:
    INC.W CrocomireMelting_SrcYOffset
    INX #2
    CPY.W CrocomireMelting_MaxAdjustedDestYOffset : BMI .loopMeltingRows
    CPX.W #$0200 : BPL .return
    LDA.B DP_BG2YScroll

  .loopTablePadding:
    STA.L CrocomireBG2YScrollHDMADataTable,X
    INX #2 : CPX.W #$0200 : BMI .loopTablePadding

  .return:
    RTS


;;; $9653: Crocomire main AI - death sequence index 1Ch/3Ah - hop 3/6 - clear tilemap ;;;
MainAI_Crocomire_DeathSequence_1C_3A_Hop_3_6_ClearTilemap:
    REP #$30
    LDX.W EnemyIndex
    STZ.W Crocomire.YVelocity,X : STZ.W Crocomire.projectileCounter,X
    LDA.W #$0800 : STA.W Crocomire.YAcceleration,X
    LDA.W #$0338
    LDX.W #$0FFE

  .loop:
    STA.L EnemyBG2Tilemap,X
    DEX #2 : BPL .loop
    LDX.W VRAMWriteStack
    LDA.W #$0800 : STA.B VRAMWrite.size,X
    LDA.W #EnemyBG2Tilemap : STA.B VRAMWrite.src,X
    LDA.W #EnemyBG2Tilemap>>16 : STA.B VRAMWrite.src+2,X
    LDA.B DP_BG2TilemapAddrSize : AND.W #$00FE : XBA : STA.B VRAMWrite.dest,X
    TXA : CLC : ADC.W #$0007 : STA.W VRAMWriteStack
    JMP NextCrocomireDeathSequenceIndex


;;; $9697: Crocomire melting X offset table ;;;
CrocomireMeltingXOffsetTable:
; Indexed by CrocomireMelting_XOffsetTableIndex
; Provides the pixel X offsets of melting Crocomire to erase in chronological order
; Due (presumably) to a programming error, this table is only used to determine the tile to modify, but not the pixel within the tile
; This pixel within the tile that gets erased is instead determined by the table index % 8
;       0   1   2   3   4   5   6   7
    db $2B,$28,$21,$1F,$2C,$10,$16,$17
    db $0F,$00,$06,$07,$0B,$08,$01,$2A
    db $0C,$24,$2E,$2D,$1A,$14,$1D,$23
    db $1E,$29,$25,$22,$13,$19,$15,$12
    db $30,$03,$09,$02,$1B,$05,$18,$1C
    db $11,$0A,$04,$0D,$2F,$0E,$20,$26
    db $27


;;; $96C8: Erase melting Crocomire pixel column ;;;
EraseMeltingCrocomirePixelColumn:
;; Parameters:
;;     A: Bug flag. Buggy if non-zero
;; Returns:
;;     A: Success flag. 0 if error, 1 otherwise

; The Y-indexed loads at .loopFindColumnToErase and $9735 are buggy due to the A parameter of this function being put into the high byte of Y!
; This code is only working as intended if A = 0 coming into this function
; For the calculation of the X pixel placed into Y at $96FF, aside from the buggy high byte,
; it looks like it should be using [CrocomireMeltingXOffsetTable + [X]] % 8 (the X offset), not [X] % 8 (the table index)

; Looks like the melting effect was supposed to be able to melt some of the 30h pixels of a tile column and then resume melting that column later,
; or maybe even erase a different number of pixels per column, but with CrocomireMelting_SkeletonLoadingIndex and CrocomireMelting_PixelsToErasePerColumn always being 30h (and also the hardcoded 30h at $976A),
; seems like the idea was abandoned (I would guess due to these bugs)
    PHP
    SEP #$20 : REP #$10
    XBA
    LDA.W CrocomireMelting_PixelsToErasePerColumn : STA.B DP_Temp12
    STZ.B DP_Temp13 : STZ.B DP_Temp14
    STZ.B DP_Temp15 : STZ.B DP_Temp16 : STZ.B DP_Temp17
    LDX.W CrocomireMelting_XOffsetTableIndex

  .loopFindColumnToErase:
    LDA.W CrocomireMeltingXOffsetTable,X : TAY
    LDA.W CrocomireMelting_YOffsets,Y : CMP.W CrocomireMelting_SkeletonLoadingIndex : BMI +
    INX : CPX.W #$0080 : BMI .loopFindColumnToErase
    STZ.W CrocomireMelting_XOffsetTableIndex
    LDA.B #$00
    PLP
    RTL

+   STX.W CrocomireMelting_XOffsetTableIndex
    TXA : AND.B #$07 : TAY
    REP #$20

  .loopEraseColumn:
    LDX.W CrocomireMelting_XOffsetTableIndex
    LDA.W CrocomireMeltingXOffsetTable,X : AND.W #$00FF : TAX
    AND.W #$FFF8 : ASL #2 : STA.B DP_Temp14
    LDA.W CrocomireMelting_YOffsets,X : AND.W #$0007 : ASL
    CLC : ADC.B DP_Temp14 : STA.B DP_Temp14
    LDA.W CrocomireMelting_YOffsets,X : AND.W #$FFF8 : ASL #6
    CLC : ADC.B DP_Temp14 : TAX
    SEP #$20
    LDA.L CrocomireMeltingBG2Tiles,X : AND.W TilePixelColumnBitmasks,Y : STA.L CrocomireMeltingBG2Tiles,X
    LDA.L CrocomireMeltingBG2Tiles+1,X : AND.W TilePixelColumnBitmasks,Y : STA.L CrocomireMeltingBG2Tiles+1,X
    LDA.L CrocomireMeltingBG2Tiles+$10,X : AND.W TilePixelColumnBitmasks,Y : STA.L CrocomireMeltingBG2Tiles+$10,X
    LDA.L CrocomireMeltingBG2Tiles+$11,X : AND.W TilePixelColumnBitmasks,Y : STA.L CrocomireMeltingBG2Tiles+$11,X
    LDA.B #$00 : XBA
    LDX.W CrocomireMelting_XOffsetTableIndex
    LDA.W CrocomireMeltingXOffsetTable,X : TAX
    LDA.W CrocomireMelting_YOffsets,X : CMP.B #$30 : BEQ +
    REP #$20
    INC.W CrocomireMelting_YOffsets,X
    LDA.W CrocomireMelting_YOffsets,X : AND.W #$00FF : STA.B DP_Temp16
    DEC.B DP_Temp12 : BNE .loopEraseColumn

+   REP #$30

  .cycled:
    LDA.W CrocomireMelting_TilesLoadingTableIndex : CLC : ADC.W CrocomireMelting_TilesLoadingTable : TAX
    LDY.W VRAMWriteStack
    LDA.W MeltingCrocomireTilesLoadingTable_Melting1_0,X : CMP.W #$FFFF : BNE +
    STZ.W CrocomireMelting_TilesLoadingTable
    BRA .cycled

+   STA.W VRAMWrite.size,Y
    LDA.W MeltingCrocomireTilesLoadingTable_Melting1_0+6,X : STA.W VRAMWrite.src,Y
    LDA.W MeltingCrocomireTilesLoadingTable_Melting1_0+4,X : STA.W VRAMWrite.src+2,Y
    LDA.W MeltingCrocomireTilesLoadingTable_Melting1_0+2,X : STA.W VRAMWrite.dest,Y
    TYA : CLC : ADC.W #$0007 : STA.W VRAMWriteStack
    LDA.W CrocomireMelting_TilesLoadingTable : CLC : ADC.W #$0008 : STA.W CrocomireMelting_TilesLoadingTable
    LDA.W CrocomireMelting_XOffsetTableIndex : CMP.W #$0080 : BMI +
    STZ.W CrocomireMelting_XOffsetTableIndex

+   STA.W CrocomireMelting_XOffsetTableIndex
    LDA.W #$0001
    PLP
    RTL


;;; $97D3: Crocomire main AI - death sequence index 3Eh - behind wall - wait for Samus ;;;
MainAI_Crocomire_DeathSequence_3E_BehindWall_WaitForSamus:
; Setting the camera distance index has no effect because the screen is locked by the red scrolls on either side >_<;
    REP #$20
    LDA.W SamusXPosition : CMP.W #$0280 : BPL .return
    LDA.W #$0005
    JSL QueueMusicDataOrTrack_8FrameDelay
    LDA.W #$0100 : STA.L Scrolls+3
    JSL Spawn_Hardcoded_PLM
    db $30,$03
    dw PLMEntries_createCrocomireInvisibleWall
    LDA.W #$0006 : STA.W CameraDistanceIndex
    LDA.W Enemy.properties : AND.W #$7FFF : ORA.W #$0400 : STA.W Enemy.properties
    LDA.W Enemy[1].properties : ORA.W #$0500 : STA.W Enemy[1].properties
    LDA.W #$0004 : STA.W Crocomire.YAcceleration
    STZ.W Crocomire.rumblingYOffset
    LDA.W #$000A : STA.W Crocomire.timer102E
    LDA.W #$0001 : STA.W Crocomire.rumblingYOffsetDelta
    STZ.W Crocomire.fightFlags
    LDA.W #$0038 : STA.W Enemy.YHitboxRadius
    JMP NextCrocomireDeathSequenceIndex

  .return:
    RTS


;;; $9830: Crocomire main AI - death sequence index 58h - flowing down the river ;;;
MainAI_Crocomire_DeathSequence_58_FlowingDownTheRiver:
; Strangely, sequenced between 3Ch and 3Eh
    LDA.W Enemy.XPosition : SEC : SBC.W #$0002 : STA.W Enemy.XPosition
    CMP.W #$01E0 : BMI .leftOfFightArea
    LDA.W #$00DC : STA.W Enemy.YPosition
    RTS

  .leftOfFightArea:
    LDA.W #$01E0 : STA.W Enemy.XPosition
    LDA.W #$0036 : STA.W Enemy.YPosition
    LDA.W #$003E : STA.W Crocomire.deathSequenceIndex
    RTS


;;; $9859: Crocomire main AI - death sequence index 40h - behind wall - rumbling ;;;
MainAI_Crocomire_DeathSequence_40_BehindWall_Rumbling:
; Screen shaking is done by room main ASM ($8F:E8CD)
    LDX.W Crocomire.rumbleIndex
    LDA.W .targetYOffset,X : CMP.W #$8080 : BNE +
    STA.W Crocomire.rumblingYOffset
    LDA.W #$0080 : STA.W Crocomire.rumbleIndex
    LDX.W #$001E

  .loopSpritePalette:
    LDA.W Palette_Crocomire_Sprite3,X : STA.L Palettes_SpriteP3,X
    DEX #2 : BPL .loopSpritePalette
    JMP NextCrocomireDeathSequenceIndex

+   LDX.W Crocomire.rumbleIndex
    LDA.W Crocomire.rumblingYOffset : CMP.W .targetYOffset,X : BEQ .equal
    BPL +
    CLC : ADC.W Crocomire.rumblingYOffsetDelta

  .return:
    STA.W Crocomire.rumblingYOffset
    RTS

+   SEC : SBC.W Crocomire.rumblingYOffsetDelta
    BRA .return

  .equal:
    LDA.W .targetYOffset,X : BPL .positive
    LDA.W Crocomire.timer102E : BEQ .rumbleTimerExpired
    DEC : STA.W Crocomire.timer102E
    DEX #2 : STX.W Crocomire.rumbleIndex
    LDA.W #$002B
    JSL QueueSound_Lib2_Max6
    RTS

  .rumbleTimerExpired:
    INX #2
    LDA.W .targetYOffset,X : STA.W Crocomire.timer102E
    INX #2
    LDA.W .targetYOffset,X : STA.W Crocomire.rumblingYOffsetDelta

  .positive:
    INX #2 : STX.W Crocomire.rumbleIndex
    RTS

  .targetYOffset:
; Rumble table
;        _______________ Target Y offset. 8080h = terminator
;       |      _________ Rumble cooldown
;       |     |      ___ Y offset delta
;       |     |     |
    dw $0004
    dw $0001
    dw $0000
    dw $FFFF,$0008,$0001
    dw $0001
    dw $FFFF,$000C,$0001
    dw $0001
    dw $FFFE,$0010,$0002
    dw $0002
    dw $FFFE,$0010,$0002
    dw $0002
    dw $FFFC,$0008,$0001
    dw $0001
    dw $FFFE,$0003,$0001
    dw $0001
    dw $FFFF,$8080,$8080
    dw $8080,$8080


;;; $990A: Crocomire main AI - death sequence index 42h - behind wall - no more rumbling ;;;
MainAI_Crocomire_DeathSequence_42_BehindWall_NoMoreRumbling:
; Not sure why there's a call to spawn the PLM for clearing Crocomire's bridge here at $997A
; It spawns it Fh blocks to the right of where the bridge is, and the bridge was already cleared ages ago when Crocomire fell through it
    LDA.W Crocomire.timer : BEQ .zero
    DEC : STA.W Crocomire.timer
    LDY.W CrocomireMelting_SkeletonLoadingIndex
    LDA.W .VRAMSpriteTilesOffset,Y : CMP.W #$FFFF : BNE +
    RTS

+   LDX.W VRAMWriteStack
    LDA.W #$0200 : STA.B VRAMWrite.size,X
    LDA.W .skeletonSpriteTilesSourceAddress,Y : STA.B VRAMWrite.src,X
    LDA.W #Tiles_CrocomireSkeleton_0>>16 : STA.B VRAMWrite.src+2,X
    LDA.B DP_SpriteSizeAddr : AND.W #$0007 : XBA : ASL #5 : STA.B DP_Temp12
    CLC : ADC.W .VRAMSpriteTilesOffset,Y : STA.B VRAMWrite.dest,X
    TXA : CLC : ADC.W #$0007 : STA.W VRAMWriteStack
    INY #2 : STY.W CrocomireMelting_SkeletonLoadingIndex
    RTS

  .zero:
    LDA.W #$01E0 : STA.W Enemy.XPosition
    LDA.W #$0036 : STA.W Enemy.YPosition
    LDA.W #$0050 : STA.W Crocomire.timer102E
    STZ.W Crocomire.YVelocity : STZ.W Crocomire.projectileCounter
    JSL Spawn_Hardcoded_PLM
    db $20,$03
    dw PLMEntries_clearCrocomireInvisibleWall
    JSL Spawn_Hardcoded_PLM
    db $1E,$03
    dw PLMEntries_createCrocomireInvisibleWall
    JSL Spawn_Hardcoded_PLM
    db $70,$0B
    dw PLMEntries_clearCrocomiresBridge
    LDA.W #$0029
    JSL QueueSound_Lib2_Max6
    LDA.W #InstList_CrocomireCorpse_Skeleton_FallsApart_0 : STA.W Enemy.instList
    LDA.W #$0001 : STA.W Enemy.instTimer
    LDA.W #$0000 : STA.W Enemy.palette
    LDX.W #$001E

  .loopSpritePalette:
    LDA.W Palette_Crocomire_Sprite1,X : STA.L Palettes_SpriteP1,X
    DEX #2 : BPL .loopSpritePalette
    JSL Clear_Enemy_Projectiles
    LDA.W #$0008 : STA.B DP_Temp12

  .loop:
    LDX.W EnemyIndex
    LDY.W #EnemyProjectile_CrocomireSpikeWallPieces
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    DEC.B DP_Temp12 : BNE .loop
    LDA.W #$0030
    JSL QueueSound_Lib2_Max6
    JMP NextCrocomireDeathSequenceIndex

  .deadReturn:
; Nothing points here
    RTS

  .VRAMSpriteTilesOffset:
; VRAM sprite tiles offsets. FFFFh = terminator
    dw $1600,$1700,$1800,$1900,$1E00,$1F00,$FFFF

  .skeletonSpriteTilesSourceAddress:
; Skeleton sprite tiles source addresses. Bank $AD
    dw Tiles_CrocomireSkeleton_0
    dw Tiles_CrocomireSkeleton_1
    dw Tiles_CrocomireSkeleton_2
    dw Tiles_CrocomireSkeleton_3
    dw Tiles_CrocomireSkeleton_4
    dw Tiles_CrocomireSkeleton_5


;;; $99E5: Crocomire main AI - death sequence index 44h - breaks down wall ;;;
MainAI_Crocomire_DeathSequence_44_BreaksDownWall:
; Crocomire's X position coming into this function is 1E0h (set by MainAI_Crocomire_DeathSequence_58_FlowingDownTheRiver)
    LDA.W Enemy.XPosition : CMP.W #$00E0 : BPL .timer
    LDA.W Crocomire.YVelocity : CLC : ADC.W #$8000 : STA.W Crocomire.YVelocity
    LDA.W Crocomire.projectileCounter : ADC.W #$0000 : CMP.W #$0002 : BMI +
    LDA.W #$0002

+   STA.W Crocomire.projectileCounter
    LDA.W Enemy.XSubPosition : CLC : ADC.W Crocomire.YVelocity : STA.W Enemy.XSubPosition
    LDA.W Enemy.XPosition : ADC.W Crocomire.projectileCounter : STA.W Enemy.XPosition

  .timer:
    LDA.W Crocomire.timer102E : BEQ .return
    DEC.W Crocomire.timer102E : BNE .return
    STZ.W Crocomire.YVelocity
    LDA.W #InstList_CrocomireCorpse_Skeleton_Falling : STA.W Enemy.instList
    LDA.W #$0001 : STA.W Enemy.instTimer
    JMP NextCrocomireDeathSequenceIndex

  .return:
    RTS


;;; $9A38: Crocomire main AI - death sequence index 46h - skeleton falls ;;;
MainAI_Crocomire_DeathSequence_46_SkeletonFalls:
    LDA.W Crocomire.YVelocity : CLC : ADC.W #$0800 : STA.W Crocomire.YVelocity
    LDA.W Crocomire.projectileCounter : ADC.W #$0000 : CMP.W #$0005 : BMI +
    LDA.W #$0005

+   STA.W Crocomire.projectileCounter
    LDA.W #$E000 : CLC : ADC.W Enemy.YSubPosition : STA.W Enemy.YSubPosition
    LDA.W Enemy.YPosition : ADC.W #$0000 : STA.W Enemy.YPosition
    LDA.W Enemy.XSubPosition : CLC : ADC.W Crocomire.YVelocity : STA.W Enemy.XSubPosition
    LDA.W Enemy.XPosition : ADC.W Crocomire.projectileCounter : STA.W Enemy.XPosition
    CMP.W #$0240 : BMI .return
    LDA.W #$0025
    JSL QueueSound_Lib2_Max6
    LDA.W Enemy.palette : STA.W $0FD6
    LDA.W #InstList_CrocomireCorpse_Skeleton_FallsApart_0 : STA.W Enemy.instList
    LDA.W #$0001 : STA.W Enemy.instTimer
    JMP NextCrocomireDeathSequenceIndex

  .return:
    RTS


;;; $9A9B: Instruction - Spawn big dust cloud enemy projectile - X offset -20h ;;;
Instruction_Crocomire_SpawnBigDustCloudProjectile_Negative20:
    LDA.W #$FFE0
    BRA SpawnBigDustCloudProjectile


;;; $9AA0: Instruction - Spawn big dust cloud enemy projectile - X offset 0 ;;;
Instruction_Crocomire_SpawnBigDustCloudProjectile_0:
    LDA.W #$0000
    BRA SpawnBigDustCloudProjectile


;;; $9AA5: Instruction - Spawn big dust cloud enemy projectile - X offset -10h ;;;
Instruction_Crocomire_SpawnBigDustCloudProjectile_Negative10:
    LDA.W #$FFF0
    BRA SpawnBigDustCloudProjectile


;;; $9AAA: Instruction - Spawn big dust cloud enemy projectile - X offset 10h ;;;
Instruction_Crocomire_SpawnBigDustCloudProjectile_10:
    LDA.W #$0010
    BRA SpawnBigDustCloudProjectile


;;; $9AAF: Instruction - Spawn big dust cloud enemy projectile - X offset 0 ;;;
Instruction_Crocomire_SpawnBigDustCloudProjectile_0_dup:
    LDA.W #$0000
    BRA SpawnBigDustCloudProjectile


;;; $9AB4: Instruction - Spawn big dust cloud enemy projectile - X offset 8 ;;;
Instruction_Crocomire_SpawnBigDustCloudProjectile_8:
    LDA.W #$0008
    BRA SpawnBigDustCloudProjectile


;;; $9AB9: Instruction - Spawn big dust cloud enemy projectile - X offset 10h ;;;
Instruction_Crocomire_SpawnBigDustCloudProjectile_10_dup:
    LDA.W #$0010
    BRA SpawnBigDustCloudProjectile


;;; $9ABE: Instruction - Spawn big dust cloud enemy projectile - X offset 18h ;;;
Instruction_Crocomire_SpawnBigDustCloudProjectile_18:
    LDA.W #$0018
    BRA SpawnBigDustCloudProjectile


;;; $9AC3: Instruction - Spawn big dust cloud enemy projectile - X offset 20h ;;;
Instruction_Crocomire_SpawnBigDustCloudProjectile_20:
    LDA.W #$0020
    BRA SpawnBigDustCloudProjectile


;;; $9AC8: Instruction - Spawn big dust cloud enemy projectile - X offset 28h ;;;
Instruction_Crocomire_SpawnBigDustCloudProjectile_28:
    LDA.W #$0028
    BRA SpawnBigDustCloudProjectile


;;; $9ACD: Instruction - Spawn big dust cloud enemy projectile - X offset 30h ;;;
Instruction_Crocomire_SpawnBigDustCloudProjectile_30:
    LDA.W #$0030
    BRA SpawnBigDustCloudProjectile


;;; $9AD2: Instruction - Spawn big dust cloud enemy projectile - X offset 38h ;;;
Instruction_Crocomire_SpawnBigDustCloudProjectile_38:
    LDA.W #$0038
    BRA SpawnBigDustCloudProjectile


;;; $9AD7: Instruction - Spawn big dust cloud enemy projectile - X offset 40h ;;;
Instruction_Crocomire_SpawnBigDustCloudProjectile_40:
    LDA.W #$0040
; fallthrough to SpawnBigDustCloudProjectile


;;; $9ADA: Spawn big dust cloud enemy projectile ;;;
SpawnBigDustCloudProjectile:
;; Parameters:
;;     A: X offset
    PHX : PHY
    STA.B DP_Temp12
    LDA.W RandomNumberSeed : AND.W #$0007 : CLC : ADC.W Enemy.XPosition
    ADC.B DP_Temp12 : STA.B DP_Temp12
    LDA.W Enemy.YPosition : CLC : ADC.W Enemy.YHitboxRadius
    SEC : SBC.W #$0010 : STA.B DP_Temp14
    LDA.W #$0015
    LDY.W #EnemyProjectile_MiscDust
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    PLY : PLX
    RTL


;;; $9B06: Crocomire main AI - death sequence index 48h - skeleton falls apart ;;;
MainAI_Crocomire_DeathSequence_48_SkeletonFallsApart:
    LDA.W Enemy.instList : CMP.W #InstList_CrocomireCorpse_Skeleton_1 : BMI .notFallenApartYet
    LDA.W #InstList_CrocomireCorpse_Skeleton_Dead : STA.W Enemy.instList
    LDA.W #$0001 : STA.W Enemy.instTimer
    LDA.W Enemy.XPosition : CLC : ADC.W #$0040 : STA.W Enemy.XPosition
    LDA.W Enemy.YPosition : CLC : ADC.W #$0015 : STA.W Enemy.YPosition
    LDA.W #$001C : STA.W Enemy.YHitboxRadius
    LDA.W #$0028 : STA.W Enemy.XHitboxRadius
    JSL Spawn_Hardcoded_PLM
    db $30,$03
    dw PLMEntries_clearCrocomireInvisibleWall
    JSL CrocomireDeathItemDropRoutine
    JMP NextCrocomireDeathSequenceIndex

  .notFallenApartYet:
    LDA.W Crocomire.YVelocity : CLC : ADC.W #$1000 : STA.W Crocomire.YVelocity
    LDA.W Crocomire.projectileCounter : ADC.W #$0000 : CMP.W #$0006 : BMI +
    LDA.W #$0006

+   STA.W Crocomire.projectileCounter
    RTS


;;; $9B65: Crocomire main AI - death sequence index 4Ah - unlock camera ;;;
MainAI_Crocomire_DeathSequence_4A_UnlockCamera:
    LDA.W #$0101 : STA.L Scrolls : STA.L Scrolls+2
    JSL Spawn_Hardcoded_PLM
    db $1E,$03
    dw PLMEntries_clearCrocomireInvisibleWall
    JMP NextCrocomireDeathSequenceIndex


;;; $9B7B: Crocomire main AI - death sequence index 4Eh - set index 50h ;;;
MainAI_Crocomire_DeathSequence_4E_SetIndex50:
    BRA NextCrocomireDeathSequenceIndex
; >.<


;;; $9B7D: Crocomire main AI - death sequence index 4Ch - set index 4Eh ;;;
MainAI_Crocomire_DeathSequence_4C_SetIndex4E:
; Crocomire instruction list pointer coming into this function is $E1D0 (last set to InstList_CrocomireCorpse_Skeleton_Dead by MainAI_Crocomire_DeathSequence_48_SkeletonFallsApart)
    LDA.W Enemy.instList : CMP.W #InstList_CrocomireCorpse_Skeleton_1 : BPL NextCrocomireDeathSequenceIndex
    RTS


;;; $9B86: Crocomire main AI - death sequence index 50h - mark event and start post-death music ;;;
MainAI_Crocomire_DeathSequence_50_MarkEvent_PostDeathMusic:
    LDA.W #$0006
    JSL QueueMusicDataOrTrack_8FrameDelay
    STZ.W CameraDistanceIndex
    LDX.W AreaIndex
    LDA.L SRAMMirror_Boss,X : ORA.W #$0002 : STA.L SRAMMirror_Boss,X
    LDA.W #$0006
    JSL QueueMusicDataOrTrack_8FrameDelay
    LDA.W #$FFF0
    JSL SpawnBigDustCloudProjectile
    LDA.W #$0010
    JSL SpawnBigDustCloudProjectile
; fallthrough to NextCrocomireDeathSequenceIndex


;;; $9BB3: Crocomire death sequence index += 2 ;;;
NextCrocomireDeathSequenceIndex:
    INC.W Crocomire.deathSequenceIndex : INC.W Crocomire.deathSequenceIndex
    RTS


;;; $9BBA: Crocomire main AI - death sequence index 54h - set index 56h ;;;
MainAI_Crocomire_DeathSequence_54_SetIndex56:
    JMP NextCrocomireDeathSequenceIndex ; >.<


;;; $9BBD: Tile pixel column bitmasks ;;;
TilePixelColumnBitmasks:
; ~(1 << x)
    db $7F ; ~80h. Pixel column 0
    db $BF ; ~40h. Pixel column 1
    db $DF ; ~20h. Pixel column 2
    db $EF ; ~10h. Pixel column 3
    db $F7 ; ~8. Pixel column 4
    db $FB ; ~4. Pixel column 5
    db $FD ; ~2. Pixel column 6
    db $FE ; ~1. Pixel column 7


;;; $9BC5: Melting Crocomire tiles loading table ;;;
; Tables for loading Crocomire melting tiles

; Format:
;     mmmm,uuuu,nnnn,bbbb
;     ssss,dddd
;     [...]
;     FFFF
; where
;     m: Max adjusted destination Y offset (it's weird, see $9580)
;     u: Unused
;     n: Number of words to copy
;     b: Source bank
;     s: Source address
;     d: Destination address (bank $7E)

;     nnnn,dddd,bbbb,ssss
;     [...]
;     FFFF
; where
;     n: Number of bytes to copy
;     b: Source bank
;     s: Source address
;     d: VRAM destination address

; Melting 1
MeltingCrocomireTilesLoadingTable_Melting1_0:
    dw $0058,$0030,$0200,$00A4
    dw Tiles_Crocomire_Melting1,$4000
    dw Tiles_Crocomire_Melting1+$200,$4200
    dw Tiles_Crocomire_Melting1+$400,$4400
    dw Tiles_Crocomire_Melting1+$600,$4600
    dw Tiles_Crocomire_Melting1+$800,$4800
    dw Tiles_Crocomire_Melting1+$A00,$4A00
    dw $FFFF

MeltingCrocomireTilesLoadingTable_Melting1_1:
    dw $0160,$0000,$007E,$4000
    dw $0160,$0100,$007E,$4200
    dw $0160,$0200,$007E,$4400
    dw $0160,$0300,$007E,$4600
    dw $0160,$0400,$007E,$4800
    dw $0160,$0500,$007E,$4A00
    dw $FFFF

; Melting 2
MeltingCrocomireTilesLoadingTable_Melting2_0:
    dw $0058,$0030,$0200,$00A4
    dw Tiles_Crocomire_Melting2,$4000
    dw Tiles_Crocomire_Melting2+$200,$4200
    dw Tiles_Crocomire_Melting2+$400,$4400
    dw Tiles_Crocomire_Melting2+$600,$4600
    dw Tiles_Crocomire_Melting2+$800,$4800
    dw Tiles_Crocomire_Melting2+$A00,$4A00
    dw Palette_Crocomire,$4C00
    dw $FFFF

MeltingCrocomireTilesLoadingTable_Melting2_1:
    dw $0160,$0000,$007E,$4000
    dw $0160,$0100,$007E,$4200
    dw $0160,$0200,$007E,$4400
    dw $0160,$0300,$007E,$4600
    dw $0160,$0400,$007E,$4800
    dw $0160,$0500,$007E,$4A00
    dw $0160,$0600,$007E,$4C00
    dw $FFFF


;;; $9C79: Crocomire tilemap - melting 1 ;;;
MeltingCrocomireTilesLoadingTable_Tilemap_Melting1:
    dw $3C00,$3C20,$3C30,$3C40,$3C50,$3C01,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $3C10,$3C11,$3C04,$3C33,$3C43,$3C23,$3C41,$3C51
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$3C02,$3C14,$3C05,$3C44,$3C54,$3C24,$3C34
    dw $3C12,$3C22,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$3C53,$3C15,$3C06,$3C16,$3C26,$3C36
    dw $3C46,$3C13,$3C52,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$3C25,$3C56,$3C07,$3C17,$3C27
    dw $3C37,$3C47,$3C03,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$3C57,$3C08,$3C18,$3C28
    dw $3C38,$3C48,$3C35,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$3C32,$3C21,$3C45,$3C58,$3C09,$3C19,$3C29
    dw $3C29,$3C49,$3C59,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$3C42,$3C31,$3C55,$3C0A,$3C1A,$3C2A,$3C3A
    dw $3C4A,$3C5A,$3C0B,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $FFFF


;;; $9E7B: Crocomire tilemap - melting 2 ;;;
MeltingCrocomireTilesLoadingTable_Tilemap_Melting2:
    dw $3C00,$3C10,$3C20,$3C30,$0338,$0338,$0338,$0338
    dw $0338,$3C00,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $3C40,$3C11,$3C21,$3C50,$3C23,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$3C32,$3C42,$3C04,$3C54,$3C03,$0338,$0338
    dw $3C33,$3C01,$3C53,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$3C34,$3C44,$3C05,$3C24,$3C14
    dw $3C02,$3C12,$3C22,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$3C35,$3C45,$3C55,$3C06
    dw $3C16,$3C26,$3C36,$3C3A,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$3C46,$3C56,$3C07
    dw $3C17,$3C27,$3C37,$3C47,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$3C31,$3C41,$3C51,$3C57,$3C08,$3C18,$3C28
    dw $3C38,$3C48,$3C58,$3C09,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$3C43,$3C52,$3C19,$3C13,$3C39,$3C49,$3C59
    dw $3C0A,$3C1A,$3C2A,$3C3A,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $FFFF


;;; $A07D: Crocomire tiles - melting 1 ;;;
Tiles_Crocomire_Melting1:
incbin "../data/Tiles_Crocomire_Melting1.bin"


;;; $AC7D: Crocomire tiles - melting 2 ;;;
Tiles_Crocomire_Melting2:
; Pointed to by MeltingCrocomireTilesLoadingTable_Melting2_0
incbin "../data/Tiles_Crocomire_Melting2.bin"


;;; $B87D: Crocomire palettes ;;;
Palette_Crocomire:
; Tongue, arms, legs, skeleton (except arm)
; Initial. (Sprite palette 7)
    dw $3800,$7FFF,$0DFF,$08BF,$0895,$086C,$0447,$6B7E
    dw $571E,$3A58,$2171,$0CCB,$039F,$023A,$0176,$0000

Palette_Crocomire_BG12:
; Body/head
; BG1/2 palette 7
    dw $0000,$7FFF,$0DFF,$08BF,$0895,$086C,$0447,$6B7E
    dw $571E,$3A58,$2171,$0CCB,$039F,$023A,$0176,$0000

Palette_Crocomire_Sprite2:
; Breakable wall
; Sprite palette 2
    dw $3800,$571E,$6318,$6318,$6318,$6318,$6318,$4A7B
    dw $1C90,$1469,$1424,$0008,$24BF,$2495,$1C6C,$1045

Palette_Crocomire_Sprite5:
; Projectile
; Sprite palette 5. Changes colour Fh from 7D08h to 3E0h, no observable difference
    dw $3800,$7F5A,$033B,$0216,$0113,$7C1D,$5814,$300A
    dw $3BE0,$2680,$1580,$5294,$39CE,$2108,$2484,$03E0

Palette_Crocomire_Sprite1:
; Skeleton arm
; Sprite palette 1
    dw $3800,$7FFF,$6B7E,$571E,$3A58,$2171,$0CCB,$6B7E
    dw $571E,$3A58,$2171,$0CCB,$039F,$023A,$0176,$0000

Palette_Crocomire_Sprite3:
; Breakable wall spikes
; Sprite palette 3
    dw $3800,$02DF,$01D7,$00AC,$5A73,$41AD,$2D08,$1863
    dw $0BB1,$48FB,$7FFF,$0000,$7FFF,$44E5,$7FFF,$0000


;;; $B93D: Enemy touch - Crocomire - claws ;;;
EnemyTouch_Crocomire_Claws:
; Used for some other hitboxes, but those are placed behind Crocomire's invisible wall (Crocomire_vs_Samus_CollisionHandling)
    JSL NormalEnemyTouchAI
    LDA.W Crocomire.fightFlags : ORA.W #$4000 : STA.W Crocomire.fightFlags
    LDA.W #$FFFC : STA.W ExtraSamusXDisplacement
; fallthrough to RTL_A4B950


;;; $B950: RTL. Enemy touch - enemy $DDBF (Crocomire) ;;;
RTL_A4B950:
    RTL


;;; $B951: Enemy shot - Crocomire - nothing ;;;
EnemyShot_Crocomire_Nothing:
; Used for the claws during (most of) Crocomire's projectile attack, used for the lower half of Crocomire's body
; This function has no effect, as the low byte of Crocomire.fightFlags is never meaningfully read
; Looks like it was supposed to be a normal increment operation up to a cap of Fh,
; but fails to be one because it doesn't mask off the existing bits before doing the OR
    LDA.W Crocomire.fightFlags : AND.W #$000F : CMP.W #$000F : BPL +
    INC

+   STA.B DP_Temp12
    LDA.W Crocomire.fightFlags : ORA.B DP_Temp12 : STA.W Crocomire.fightFlags
    RTL


;;; $B968: Enemy shot - Crocomire - spawn shot explosion ;;;
EnemyShot_Crocomire_SpawnShotExplosion:
    PHX : PHY
    LDA.W CollisionIndex : ASL : TAX
    LDA.W SamusProjectile_XPositions,X : STA.B DP_Temp12
    LDA.W SamusProjectile_YPositions,X : STA.B DP_Temp14
    LDA.W SamusProjectile_Types,X
    LDY.W #$001D
    BIT.W #$0200 : BNE .notBeamMissileBomb
    LDY.W #$0006

  .notBeamMissileBomb:
    TYA
    LDY.W #EnemyProjectile_MiscDust
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    PLY : PLX
    RTL


;;; $B992: Power bomb reaction - enemy $DDBF (Crocomire) ;;;
PowerBombReaction_Crocomire:
    LDA.W Crocomire.deathSequenceIndex : BNE .return
    LDA.W CrocomireConstants_powerBombReactionEnableFlag : BEQ .return
    STA.W Crocomire.stepCounter
    LDA.W Crocomire.fightFunctionIndex : CMP.W #$0018 : BEQ .return
    LDA.W Crocomire.fightFlags : AND.W #$BFF0 : ORA.W #$8000 : STA.W Crocomire.fightFlags
    LDA.W #$000A : STA.W Crocomire.YVelocity
    LDA.W Enemy.flashTimer : CLC : ADC.W #$0004 : STA.W Enemy.flashTimer
    LDA.W Enemy.AI : ORA.W #$0002 : STA.W Enemy.AI
    LDA.W #$0018 : STA.W Crocomire.fightFunctionIndex
    LDX.W Enemy.spritemap
    LDA.W $0000,X : STA.B DP_Temp12

  .loop:
    LDA.W $0006,X
    LDY.W #InstList_Crocomire_PowerBombReaction_MouthFullyOpen
    CMP.W #ExtendedTilemap_Crocomire_1 : BEQ .mouthNotOpen
    LDY.W #InstList_Crocomire_PowerBombReaction_MouthPartiallyOpen
    CMP.W #ExtendedTilemap_Crocomire_0 : BEQ .mouthNotOpen
    TXA : CLC : ADC.W #$0008 : TAX
    DEC.B DP_Temp12 : BNE .loop
    LDY.W #InstList_Crocomire_PowerBombReaction_MouthNotOpen_0

  .mouthNotOpen:
    TYA : STA.W Enemy.instList
    LDA.W #$0001 : STA.W Enemy.instTimer

  .return:
    RTL


;;; $BA05: Enemy shot - Crocomire - open mouth ;;;
EnemyShot_Crocomire_OpenMouth:
    LDA.W #$0000 : STA.W Enemy.invincibilityTimer
    LDA.W Enemy.XPosition : SEC : SBC.W Enemy.XHitboxRadius
    SEC : SBC.W #$0100 : SEC : SBC.W Layer1XPosition : BPL .offScreen
    LDA.W CollisionIndex : ASL : TAX
    LDA.W SamusProjectile_Types,X : BIT.W #$0F00 : BNE .notBeam
    LDX.W CrocomireConstants_stepsWhenDamagedByChargeBeam
    BIT.W #$0010 : BNE .damage
    LDA.W CrocomireConstants_mouthOpenInstructionTimer : STA.W Enemy.instTimer
    LDX.W CrocomireConstants_index
    JMP EnemyShot_Crocomire_SpawnShotExplosion_duplicate

  .notBeam:
    AND.W #$0F00
    LDX.W CrocomireConstants_stepsWhenDamagedByMissile
    CMP.W #$0100 : BEQ .damage
    LDX.W CrocomireConstants_stepsWhenDamagedBySuperMissile
    CMP.W #$0200 : BEQ .damage
    LDX.W #$0000

  .damage:
    TXA : CMP.W #$0000 : BEQ .flash
    CLC : ADC.W Crocomire.stepCounter : STA.W Crocomire.stepCounter

  .offScreen:
    LDA.W Crocomire.fightFlags : AND.W #$000F : CMP.W #$000F : BPL +
    INC

+   STA.B DP_Temp12
    LDA.W Crocomire.fightFlags : BIT.W #$0800 : BNE .damaged
    LDX.W CrocomireConstants_mouthCloseDelayWhenDamaged_NotProjAttack
    LDA.W Crocomire.fightFunctionIndex : CMP.W #$0008 : BNE +
    LDX.W CrocomireConstants_mouthCloseDelayWhenDamaged_ProjAttack

+   TXA : CLC : ADC.W Enemy.instTimer : STA.W Enemy.instTimer

  .damaged:
    LDA.W Crocomire.fightFlags : AND.W #$BFF0 : ORA.W #$0800 : ORA.B DP_Temp12 : STA.W Crocomire.fightFlags
    LDA.W #$000A : STA.W Crocomire.YVelocity

  .flash:
    LDA.W Enemy.flashTimer : CLC : ADC.W #$000E : STA.W Enemy.flashTimer
    LDA.W Enemy.AI : ORA.W #$0002 : STA.W Enemy.AI
    RTL


;;; $BAB4: Enemy shot - Crocomire - spawn shot explosion ;;;
EnemyShot_Crocomire_SpawnShotExplosion_duplicate:
; Clone of EnemyShot_Crocomire_SpawnShotExplosion
; Used for claws
    PHX : PHY
    LDA.W CollisionIndex : ASL : TAX
    LDA.W SamusProjectile_XPositions,X : STA.B DP_Temp12
    LDA.W SamusProjectile_YPositions,X : STA.B DP_Temp14
    LDA.W SamusProjectile_Types,X
    LDY.W #$001D
    BIT.W #$0200 : BNE .notBeamMissileBomb
    LDY.W #$0006

  .notBeamMissileBomb:
    TYA
    LDY.W #EnemyProjectile_MiscDust
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    PLY : PLX
    RTL


;;; $BADE: Instruction list - Crocomire - initial ;;;
InstList_Crocomire_Initial:
    dw $0001,ExtendedSpritemap_Crocomire_0
    dw Instruction_Crocomire_FightAI
    dw Instruction_Common_GotoY
    dw InstList_Crocomire_Initial
    dw Instruction_Common_Sleep


;;; $BAEA: Instruction list - Crocomire - charge forward one step (unused) ;;;
UNUSED_InstList_Crocomire_ChargeForwardOneStep_A4BAEA:
    dw $0008,ExtendedSpritemap_Crocomire_ChargeForward_StepBack_0
    dw Instruction_Crocomire_ShakeScreen
    dw Instruction_Crocomire_MoveLeft4Pixels_SpawnBigDustCloud
    dw $0008,ExtendedSpritemap_Crocomire_ChargeForward_StepBack_1
    dw Instruction_Crocomire_MoveLeft4Pixels
    dw $0008,ExtendedSpritemap_Crocomire_ChargeForward_StepBack_2
    dw Instruction_Crocomire_MoveLeft4Pixels
    dw $0008,ExtendedSpritemap_Crocomire_ChargeForward_StepBack_3
    dw Instruction_Crocomire_MoveLeft4Pixels_SpawnBigDustCloud
    dw $0008,ExtendedSpritemap_Crocomire_ChargeForward_StepBack_4
    dw Instruction_Crocomire_MoveLeft4Pixels
    dw $0008,ExtendedSpritemap_Crocomire_ChargeForward_StepBack_5
    dw Instruction_Crocomire_MoveLeft4Pixels
    dw $0008,ExtendedSpritemap_Crocomire_ChargeForward_StepBack_6
    dw Instruction_Crocomire_ShakeScreen
    dw Instruction_Crocomire_MoveLeft4Pixels_SpawnBigDustCloud
    dw $0008,ExtendedSpritemap_Crocomire_ChargeForward_StepBack_7
    dw Instruction_Crocomire_MoveLeft4Pixels
    dw $0008,ExtendedSpritemap_Crocomire_ChargeForward_StepBack_8
    dw Instruction_Crocomire_MoveLeft4Pixels
    dw $0008,ExtendedSpritemap_Crocomire_ChargeForward_StepBack_9
    dw Instruction_Crocomire_MoveLeft4Pixels_SpawnBigDustCloud
    dw $0008,ExtendedSpritemap_Crocomire_ChargeForward_StepBack_A
    dw Instruction_Crocomire_MoveLeft4Pixels
    dw $0008,ExtendedSpritemap_Crocomire_ChargeForward_StepBack_B
    dw Instruction_Crocomire_FightAI


;;; $BB36: Instruction list - Crocomire - projectile attack ;;;
InstList_Crocomire_ProjectileAttack_0:
    dw Instruction_Crocomire_SpawnBigDustCloudProjectile_10
    dw $0005,ExtendedSpritemap_Crocomire_MovingClaws_0
    dw $0005,ExtendedSpritemap_Crocomire_MovingClaws_1
    dw Instruction_Crocomire_SpawnBigDustCloudProjectile_0
    dw $0005,ExtendedSpritemap_Crocomire_MovingClaws_2
    dw $0005,ExtendedSpritemap_Crocomire_MovingClaws_3
    dw $0005,ExtendedSpritemap_Crocomire_MovingClaws_4
    dw Instruction_Crocomire_QueueBigExplosionSFX
    dw Instruction_Crocomire_SpawnBigDustCloudProjectile_Negative20
    dw $0005,ExtendedSpritemap_Crocomire_MovingClaws_0
    dw $0005,ExtendedSpritemap_Crocomire_MovingClaws_1
    dw Instruction_Crocomire_SpawnBigDustCloudProjectile_Negative10
    dw $0005,ExtendedSpritemap_Crocomire_MovingClaws_2
    dw $0005,ExtendedSpritemap_Crocomire_MovingClaws_3
    dw $0005,ExtendedSpritemap_Crocomire_MovingClaws_4
    dw Instruction_Crocomire_QueueBigExplosionSFX
    dw Instruction_Crocomire_SpawnBigDustCloudProjectile_0
    dw $0005,ExtendedSpritemap_Crocomire_MovingClaws_0
    dw $0005,ExtendedSpritemap_Crocomire_MovingClaws_1
    dw Instruction_Crocomire_SpawnBigDustCloudProjectile_28
    dw $0005,ExtendedSpritemap_Crocomire_MovingClaws_2
    dw $0005,ExtendedSpritemap_Crocomire_MovingClaws_3
    dw $0005,ExtendedSpritemap_Crocomire_MovingClaws_4
    dw Instruction_Crocomire_QueueBigExplosionSFX
    dw Instruction_Crocomire_SpawnBigDustCloudProjectile_Negative10
    dw $0005,ExtendedSpritemap_Crocomire_7
    dw Instruction_Crocomire_QueueCrySFX
    dw $0005,ExtendedSpritemap_Crocomire_8
    dw $0005,ExtendedSpritemap_Crocomire_9

InstList_Crocomire_ProjectileAttack_1:
    dw Instruction_Crocomire_FightAI
    dw $0008,ExtendedSpritemap_Crocomire_20
    dw $0007,ExtendedSpritemap_Crocomire_21
    dw $0007,ExtendedSpritemap_Crocomire_22
    dw $0007,ExtendedSpritemap_Crocomire_23
    dw $0007,ExtendedSpritemap_Crocomire_24
    dw Instruction_Common_GotoY
    dw InstList_Crocomire_ProjectileAttack_1


if !FEATURE_KEEP_UNREFERENCED
;;; $BBAE: Unused. Instruction list - Crocomire ;;;
UNUSED_InstList_Crocomire_A4BBAE:
    dw $0004,ExtendedSpritemap_Crocomire_14
    dw Instruction_Crocomire_ShakeScreen
    dw Instruction_Crocomire_MoveLeft4Pixels_SpawnBigDustCloud
    dw Instruction_Crocomire_FightAI
    dw Instruction_Crocomire_MaybeStartProjectileAttack
    dw $0004,ExtendedSpritemap_Crocomire_15
    dw Instruction_Crocomire_MoveLeft4Pixels
    dw Instruction_Crocomire_FightAI
    dw $0004,ExtendedSpritemap_Crocomire_16
    dw Instruction_Crocomire_MoveLeft4Pixels_SpawnBigDustCloud
    dw Instruction_Crocomire_FightAI
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $BBCA: Instruction list - Crocomire - step forward after delay ;;;
InstList_Crocomire_StepForwardAfterDelay:
    dw $00B4,ExtendedSpritemap_Crocomire_14


;;; $BBCE: Instruction list - Crocomire - step forward ;;;
InstList_Crocomire_StepForward:
    dw Instruction_Crocomire_MaybeStartProjectileAttack
    dw $0005,ExtendedSpritemap_Crocomire_7
    dw Instruction_Crocomire_FightAI
    dw $0005,ExtendedSpritemap_Crocomire_8
    dw Instruction_Crocomire_QueueCrySFX
    dw Instruction_Crocomire_FightAI
    dw $0005,ExtendedSpritemap_Crocomire_9
    dw Instruction_Crocomire_FightAI
    dw $0010,ExtendedSpritemap_Crocomire_17
    dw Instruction_Crocomire_MoveLeft4Pixels_SpawnBigDustCloud
    dw Instruction_Crocomire_FightAI
    dw $0004,ExtendedSpritemap_Crocomire_18
    dw Instruction_Crocomire_MoveLeft4Pixels
    dw Instruction_Crocomire_FightAI
    dw $0004,ExtendedSpritemap_Crocomire_19
    dw Instruction_Crocomire_MoveLeft4Pixels
    dw Instruction_Crocomire_FightAI
    dw $0004,ExtendedSpritemap_Crocomire_1A
    dw Instruction_Crocomire_ShakeScreen
    dw Instruction_Crocomire_MoveLeft4Pixels_SpawnBigDustCloud
    dw Instruction_Crocomire_FightAI
    dw $0004,ExtendedSpritemap_Crocomire_1B
    dw Instruction_Crocomire_MoveLeft4Pixels
    dw Instruction_Crocomire_FightAI
    dw $0004,ExtendedSpritemap_Crocomire_1C
    dw Instruction_Crocomire_MoveLeft4Pixels
    dw Instruction_Crocomire_FightAI
    dw $0004,ExtendedSpritemap_Crocomire_1D
    dw Instruction_Crocomire_MoveLeft4Pixels_SpawnBigDustCloud
    dw Instruction_Crocomire_FightAI
    dw $0004,ExtendedSpritemap_Crocomire_1E
    dw Instruction_Crocomire_MoveLeft4Pixels
    dw Instruction_Crocomire_FightAI
    dw $0004,ExtendedSpritemap_Crocomire_1F
    dw Instruction_Crocomire_FightAI
    dw Instruction_Common_GotoY
    dw InstList_Crocomire_StepForward


;;; $BC30: Instruction list - Crocomire - step back ;;;
InstList_Crocomire_StepBack:
    dw $0002,ExtendedSpritemap_Crocomire_8


;;; $BC34: Instruction list - Crocomire - stepping back ;;;
InstList_Crocomire_SteppingBack:
    dw $0008,ExtendedSpritemap_Crocomire_ChargeForward_StepBack_B
    dw Instruction_Crocomire_MoveRight4PixelsIfOnScreen_SpawnCloud
    dw $0008,ExtendedSpritemap_Crocomire_ChargeForward_StepBack_A
    dw Instruction_Crocomire_MoveRight4PixelsIfOnScreen
    dw $0008,ExtendedSpritemap_Crocomire_ChargeForward_StepBack_9
    dw Instruction_Crocomire_MoveRight4PixelsIfOnScreen
    dw $0008,ExtendedSpritemap_Crocomire_ChargeForward_StepBack_8
    dw Instruction_Crocomire_MoveRight4PixelsIfOnScreen_SpawnCloud
    dw $0008,ExtendedSpritemap_Crocomire_ChargeForward_StepBack_7
    dw Instruction_Crocomire_ShakeScreen
    dw Instruction_Crocomire_MoveRight4PixelsIfOnScreen
    dw Instruction_Crocomire_FightAI


;;; $BC56: Instruction list - Crocomire - wait for first/second damage ;;;
InstList_Crocomire_WaitForFirstSecondDamage:
; Blinking in disbelief
    dw $0022,ExtendedSpritemap_Crocomire_6
    dw $0002,ExtendedSpritemap_Crocomire_5
    dw $0002,ExtendedSpritemap_Crocomire_4
    dw $0002,ExtendedSpritemap_Crocomire_3
    dw $0002,ExtendedSpritemap_Crocomire_2
    dw $0002,ExtendedSpritemap_Crocomire_1
    dw $0002,ExtendedSpritemap_Crocomire_0
    dw $0010,ExtendedSpritemap_Crocomire_0
    dw $0001,ExtendedSpritemap_Crocomire_1
    dw $0001,ExtendedSpritemap_Crocomire_2
    dw $0001,ExtendedSpritemap_Crocomire_3
    dw $0001,ExtendedSpritemap_Crocomire_4
    dw $0001,ExtendedSpritemap_Crocomire_5
    dw $0010,ExtendedSpritemap_Crocomire_6
    dw $0001,ExtendedSpritemap_Crocomire_5
    dw $0001,ExtendedSpritemap_Crocomire_4
    dw $0001,ExtendedSpritemap_Crocomire_3
    dw $0001,ExtendedSpritemap_Crocomire_2
    dw $0001,ExtendedSpritemap_Crocomire_1
    dw $0001,ExtendedSpritemap_Crocomire_0
    dw $0001,ExtendedSpritemap_Crocomire_1
    dw $0001,ExtendedSpritemap_Crocomire_2
    dw $0001,ExtendedSpritemap_Crocomire_3
    dw $0001,ExtendedSpritemap_Crocomire_4
    dw $0001,ExtendedSpritemap_Crocomire_5
    dw $0001,ExtendedSpritemap_Crocomire_6
    dw $0001,ExtendedSpritemap_Crocomire_5
    dw $0001,ExtendedSpritemap_Crocomire_4
    dw $0001,ExtendedSpritemap_Crocomire_3
    dw $0001,ExtendedSpritemap_Crocomire_2
    dw $0001,ExtendedSpritemap_Crocomire_1
    dw $0001,ExtendedSpritemap_Crocomire_0
    dw Instruction_Crocomire_FightAI


;;; $BCD8: Instruction list - Crocomire - wait for first/second damage - moving claws ;;;
InstList_Crocomire_WaitForFirstSecondDamage_MovingClaws:
    dw Instruction_Crocomire_SpawnBigDustCloudProjectile_10
    dw $0005,ExtendedSpritemap_Crocomire_MovingClaws_0
    dw $0005,ExtendedSpritemap_Crocomire_MovingClaws_1
    dw Instruction_Crocomire_SpawnBigDustCloudProjectile_0
    dw $0005,ExtendedSpritemap_Crocomire_MovingClaws_2
    dw $0005,ExtendedSpritemap_Crocomire_MovingClaws_3
    dw $0005,ExtendedSpritemap_Crocomire_MovingClaws_4
    dw Instruction_Crocomire_QueueBigExplosionSFX
    dw Instruction_Crocomire_SpawnBigDustCloudProjectile_Negative20
    dw $0005,ExtendedSpritemap_Crocomire_MovingClaws_0
    dw $0005,ExtendedSpritemap_Crocomire_MovingClaws_1
    dw Instruction_Crocomire_SpawnBigDustCloudProjectile_Negative10
    dw $0005,ExtendedSpritemap_Crocomire_MovingClaws_2
    dw $0005,ExtendedSpritemap_Crocomire_MovingClaws_3
    dw $0005,ExtendedSpritemap_Crocomire_MovingClaws_4
    dw Instruction_Crocomire_QueueBigExplosionSFX
    dw Instruction_Crocomire_SpawnBigDustCloudProjectile_0
    dw $0005,ExtendedSpritemap_Crocomire_MovingClaws_0
    dw $0005,ExtendedSpritemap_Crocomire_MovingClaws_1
    dw Instruction_Crocomire_SpawnBigDustCloudProjectile_28
    dw $0005,ExtendedSpritemap_Crocomire_MovingClaws_2
    dw $0005,ExtendedSpritemap_Crocomire_MovingClaws_3
    dw $0005,ExtendedSpritemap_Crocomire_MovingClaws_4
    dw Instruction_Crocomire_QueueBigExplosionSFX
    dw Instruction_Crocomire_SpawnBigDustCloudProjectile_Negative10
    dw Instruction_Crocomire_FightAI


;;; $BD2A: Instruction list - Crocomire - wait for first/second damage - roar ;;;
InstList_Crocomire_WaitForFirstSecondDamage_Roar:
; Rawr, open mouth
    dw $0030,ExtendedSpritemap_Crocomire_7
    dw Instruction_Crocomire_QueueCrySFX
    dw $0005,ExtendedSpritemap_Crocomire_8
    dw $0002,ExtendedSpritemap_Crocomire_9
    dw Instruction_Crocomire_FightAI
    dw $0002,ExtendedSpritemap_Crocomire_9
    dw Instruction_Crocomire_FightAI
    dw $0002,ExtendedSpritemap_Crocomire_9
    dw Instruction_Crocomire_FightAI
    dw $0002,ExtendedSpritemap_Crocomire_9
    dw Instruction_Crocomire_FightAI
    dw $0002,ExtendedSpritemap_Crocomire_9
    dw Instruction_Crocomire_FightAI
    dw $0002,ExtendedSpritemap_Crocomire_9
    dw Instruction_Crocomire_FightAI
    dw $0002,ExtendedSpritemap_Crocomire_9
    dw Instruction_Crocomire_FightAI
    dw $0002,ExtendedSpritemap_Crocomire_9
    dw Instruction_Crocomire_FightAI
    dw $0002,ExtendedSpritemap_Crocomire_9
    dw Instruction_Crocomire_FightAI
    dw $0002,ExtendedSpritemap_Crocomire_9
    dw Instruction_Crocomire_FightAI
    dw $0002,ExtendedSpritemap_Crocomire_9
    dw Instruction_Crocomire_FightAI
    dw $0002,ExtendedSpritemap_Crocomire_9
    dw Instruction_Crocomire_FightAI
    dw $0002,ExtendedSpritemap_Crocomire_9
    dw Instruction_Crocomire_FightAI
    dw $0020,ExtendedSpritemap_Crocomire_9
    dw Instruction_Crocomire_FightAI
    dw $0001,ExtendedSpritemap_Crocomire_9
    dw Instruction_Crocomire_FightAI


;;; $BD8E: Instruction list - Crocomire - wait for first/second damage - roar - close mouth ;;;
; Rawr, close mouth
InstList_Crocomire_WaitForFirstSecondDamage_RoarCloseMouth_0:
    dw $0020,ExtendedSpritemap_Crocomire_9
    dw Instruction_Crocomire_FightAI
    dw $0005,ExtendedSpritemap_Crocomire_8
    dw Instruction_Crocomire_FightAI
    dw $0008,ExtendedSpritemap_Crocomire_8
    dw $0002,ExtendedSpritemap_Crocomire_7

InstList_Crocomire_WaitForFirstSecondDamage_RoarCloseMouth_1:
    dw $0001,ExtendedSpritemap_Crocomire_7
    dw Instruction_Crocomire_FightAI
    dw $0001,ExtendedSpritemap_Crocomire_7
    dw Instruction_Crocomire_FightAI


;;; $BDAE: Instruction list - Crocomire - power bomb reaction - mouth fully open ;;;
InstList_Crocomire_PowerBombReaction_MouthFullyOpen:
    dw $0002,ExtendedSpritemap_Crocomire_8


;;; $BDB2: Instruction list - Crocomire - power bomb reaction - mouth partially open ;;;
InstList_Crocomire_PowerBombReaction_MouthPartiallyOpen:
    dw $0002,ExtendedSpritemap_Crocomire_7


;;; $BDB6: Instruction list - Crocomire - power bomb reaction - mouth not open ;;;
InstList_Crocomire_PowerBombReaction_MouthNotOpen_0:
    dw Instruction_Crocomire_SpawnBigDustCloudProjectile_10
    dw $0005,ExtendedSpritemap_Crocomire_MovingClaws_0
    dw $0005,ExtendedSpritemap_Crocomire_MovingClaws_1
    dw Instruction_Crocomire_SpawnBigDustCloudProjectile_0
    dw $0005,ExtendedSpritemap_Crocomire_MovingClaws_2
    dw $0005,ExtendedSpritemap_Crocomire_MovingClaws_3
    dw $0005,ExtendedSpritemap_Crocomire_MovingClaws_4
    dw Instruction_Crocomire_QueueBigExplosionSFX
    dw Instruction_Crocomire_SpawnBigDustCloudProjectile_Negative20
    dw $0005,ExtendedSpritemap_Crocomire_MovingClaws_0
    dw $0005,ExtendedSpritemap_Crocomire_MovingClaws_1
    dw Instruction_Crocomire_SpawnBigDustCloudProjectile_Negative10
    dw $0005,ExtendedSpritemap_Crocomire_MovingClaws_2
    dw $0005,ExtendedSpritemap_Crocomire_MovingClaws_3
    dw $0005,ExtendedSpritemap_Crocomire_MovingClaws_4
    dw Instruction_Crocomire_QueueBigExplosionSFX
    dw Instruction_Crocomire_SpawnBigDustCloudProjectile_0
    dw $0005,ExtendedSpritemap_Crocomire_MovingClaws_0
    dw $0005,ExtendedSpritemap_Crocomire_MovingClaws_1
    dw Instruction_Crocomire_SpawnBigDustCloudProjectile_28
    dw $0005,ExtendedSpritemap_Crocomire_MovingClaws_2
    dw $0005,ExtendedSpritemap_Crocomire_MovingClaws_3
    dw $0005,ExtendedSpritemap_Crocomire_MovingClaws_4
    dw Instruction_Crocomire_QueueBigExplosionSFX
    dw Instruction_Crocomire_SpawnBigDustCloudProjectile_Negative10

InstList_Crocomire_PowerBombReaction_MouthNotOpen_1:
    dw $0004,ExtendedSpritemap_Crocomire_ChargeForward_StepBack_0
    dw Instruction_Crocomire_ShakeScreen
    dw Instruction_Crocomire_MoveLeft4Pixels_SpawnBigDustCloud
    dw $0004,ExtendedSpritemap_Crocomire_ChargeForward_StepBack_1
    dw Instruction_Crocomire_MoveLeft4Pixels
    dw $0004,ExtendedSpritemap_Crocomire_ChargeForward_StepBack_2
    dw Instruction_Crocomire_MoveLeft4Pixels
    dw $0004,ExtendedSpritemap_Crocomire_ChargeForward_StepBack_3
    dw Instruction_Crocomire_MoveLeft4Pixels_SpawnBigDustCloud
    dw $0004,ExtendedSpritemap_Crocomire_ChargeForward_StepBack_4
    dw Instruction_Crocomire_MoveLeft4Pixels
    dw $0004,ExtendedSpritemap_Crocomire_ChargeForward_StepBack_5
    dw Instruction_Crocomire_MoveLeft4Pixels
    dw $0004,ExtendedSpritemap_Crocomire_ChargeForward_StepBack_6
    dw Instruction_Crocomire_ShakeScreen
    dw Instruction_Crocomire_MoveLeft4Pixels_SpawnBigDustCloud
    dw $0004,ExtendedSpritemap_Crocomire_ChargeForward_StepBack_7
    dw Instruction_Crocomire_MoveLeft4Pixels
    dw $0004,ExtendedSpritemap_Crocomire_ChargeForward_StepBack_8
    dw Instruction_Crocomire_MoveLeft4Pixels
    dw $0004,ExtendedSpritemap_Crocomire_ChargeForward_StepBack_9
    dw Instruction_Crocomire_MoveLeft4Pixels_SpawnBigDustCloud
    dw $0004,ExtendedSpritemap_Crocomire_ChargeForward_StepBack_A
    dw Instruction_Crocomire_MoveLeft4Pixels
    dw $0004,ExtendedSpritemap_Crocomire_ChargeForward_StepBack_B
    dw Instruction_Crocomire_FightAI
    dw Instruction_Common_GotoY
    dw InstList_Crocomire_PowerBombReaction_MouthNotOpen_1


;;; $BE56: Instruction list - Crocomire tongue - fight ;;;
InstList_CrocomireTongue_Fight:
    dw $0005,ExtendedSpritemap_Crocomire_10
    dw $0005,ExtendedSpritemap_Crocomire_11
    dw $0005,ExtendedSpritemap_Crocomire_12
    dw $0005,ExtendedSpritemap_Crocomire_13
    dw Instruction_Common_GotoY
    dw InstList_CrocomireTongue_Fight


if !FEATURE_KEEP_UNREFERENCED
;;; $BE6A: Unused. Instruction list - Crocomire tongue - reversed version of fight ;;;
UNUSED_InstList_CrocomireTongue_ReverseVersionOfFight_A4BE6A:
    dw $0005,ExtendedSpritemap_Crocomire_13
    dw $0005,ExtendedSpritemap_Crocomire_12
    dw $0005,ExtendedSpritemap_Crocomire_11
    dw $0005,ExtendedSpritemap_Crocomire_10
    dw Instruction_Common_GotoY
    dw InstList_CrocomireTongue_Fight
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $BE7E: Instruction list - Crocomire - near spike wall charge ;;;
InstList_CrocomireTongue_NearSpikeWallCharge_0:
    dw $0005,ExtendedSpritemap_Crocomire_7
    dw Instruction_Crocomire_QueueCrySFX
    dw Instruction_Crocomire_FightAI
    dw $0005,ExtendedSpritemap_Crocomire_8
    dw Instruction_Crocomire_FightAI
    dw $0002,ExtendedSpritemap_Crocomire_9
    dw Instruction_Crocomire_FightAI
    dw $0002,ExtendedSpritemap_Crocomire_9
    dw Instruction_Crocomire_FightAI
    dw $0002,ExtendedSpritemap_Crocomire_9
    dw Instruction_Crocomire_FightAI
    dw $0002,ExtendedSpritemap_Crocomire_9
    dw Instruction_Crocomire_FightAI
    dw $0002,ExtendedSpritemap_Crocomire_9
    dw Instruction_Crocomire_FightAI
    dw $0002,ExtendedSpritemap_Crocomire_9
    dw Instruction_Crocomire_FightAI
    dw $0002,ExtendedSpritemap_Crocomire_9
    dw Instruction_Crocomire_FightAI
    dw $0002,ExtendedSpritemap_Crocomire_9
    dw Instruction_Crocomire_FightAI
    dw $0002,ExtendedSpritemap_Crocomire_9
    dw Instruction_Crocomire_FightAI
    dw $0002,ExtendedSpritemap_Crocomire_9
    dw Instruction_Crocomire_FightAI
    dw $0002,ExtendedSpritemap_Crocomire_9
    dw Instruction_Crocomire_FightAI
    dw $0002,ExtendedSpritemap_Crocomire_9
    dw Instruction_Crocomire_FightAI
    dw $0002,ExtendedSpritemap_Crocomire_9
    dw Instruction_Crocomire_FightAI
    dw $0005,ExtendedSpritemap_Crocomire_8
    dw Instruction_Crocomire_FightAI
    dw $0008,ExtendedSpritemap_Crocomire_8
    dw Instruction_Crocomire_FightAI
    dw $0002,ExtendedSpritemap_Crocomire_7
    dw Instruction_Crocomire_FightAI

InstList_CrocomireTongue_NearSpikeWallCharge_1:
    dw $0003,ExtendedSpritemap_Crocomire_ChargeForward_StepBack_0
    dw Instruction_Crocomire_ShakeScreen
    dw Instruction_Crocomire_MoveLeft4Pixels_SpawnBigDustCloud_dup
    dw $0003,ExtendedSpritemap_Crocomire_ChargeForward_StepBack_1
    dw Instruction_Crocomire_MoveLeft_SpawnCloud_HandleSpikeWall
    dw $0003,ExtendedSpritemap_Crocomire_ChargeForward_StepBack_2
    dw Instruction_Crocomire_MoveLeft_SpawnCloud_HandleSpikeWall
    dw $0003,ExtendedSpritemap_Crocomire_ChargeForward_StepBack_3
    dw Instruction_Crocomire_MoveLeft4Pixels_SpawnBigDustCloud_dup
    dw $0003,ExtendedSpritemap_Crocomire_ChargeForward_StepBack_4
    dw Instruction_Crocomire_MoveLeft_SpawnCloud_HandleSpikeWall
    dw $0003,ExtendedSpritemap_Crocomire_ChargeForward_StepBack_5
    dw Instruction_Crocomire_MoveLeft_SpawnCloud_HandleSpikeWall
    dw $0003,ExtendedSpritemap_Crocomire_ChargeForward_StepBack_6
    dw Instruction_Crocomire_ShakeScreen
    dw Instruction_Crocomire_MoveLeft4Pixels_SpawnBigDustCloud_dup
    dw $0003,ExtendedSpritemap_Crocomire_ChargeForward_StepBack_7
    dw Instruction_Crocomire_MoveLeft_SpawnCloud_HandleSpikeWall
    dw $0003,ExtendedSpritemap_Crocomire_ChargeForward_StepBack_8
    dw Instruction_Crocomire_MoveLeft_SpawnCloud_HandleSpikeWall
    dw $0003,ExtendedSpritemap_Crocomire_ChargeForward_StepBack_9
    dw Instruction_Crocomire_MoveLeft4Pixels_SpawnBigDustCloud_dup
    dw $0003,ExtendedSpritemap_Crocomire_ChargeForward_StepBack_A
    dw Instruction_Crocomire_MoveLeft_SpawnCloud_HandleSpikeWall
    dw $0003,ExtendedSpritemap_Crocomire_ChargeForward_StepBack_B
    dw Instruction_Crocomire_FightAI
    dw Instruction_Common_GotoY
    dw InstList_CrocomireTongue_NearSpikeWallCharge_1


;;; $BF3C: Instruction list - Crocomire - back off from spike wall ;;;
InstList_Crocomire_BackOffFromSpikeWall:
    dw $0008,ExtendedSpritemap_Crocomire_ChargeForward_StepBack_B
    dw Instruction_Crocomire_MoveRight4Pixels_SpawnBigDustCloud
    dw $0008,ExtendedSpritemap_Crocomire_ChargeForward_StepBack_A
    dw Instruction_Crocomire_MoveRight4Pixels
    dw $0008,ExtendedSpritemap_Crocomire_ChargeForward_StepBack_9
    dw Instruction_Crocomire_MoveRight4Pixels
    dw $0008,ExtendedSpritemap_Crocomire_ChargeForward_StepBack_8
    dw Instruction_Crocomire_MoveRight4Pixels_SpawnBigDustCloud
    dw $0008,ExtendedSpritemap_Crocomire_ChargeForward_StepBack_7
    dw Instruction_Crocomire_ShakeScreen
    dw Instruction_Crocomire_MoveRight4Pixels
    dw Instruction_Crocomire_FightAI
    dw Instruction_Common_GotoY
    dw InstList_Crocomire_BackOffFromSpikeWall


;;; $BF62: Instruction list - sleep ;;;
InstList_Crocomire_Sleep:
    dw Instruction_Common_Sleep


;;; $BF64: Instruction list - Crocomire - melting 1 - top row ;;;
InstList_Crocomire_Melting1_TopRow:
    dw $7FFF,ExtendedSpritemap_Crocomire_25
    dw Instruction_Common_GotoY
    dw InstList_Crocomire_Melting1_TopRow


;;; $BF6C: Instruction list - Crocomire - melting 1 - top 2 rows ;;;
InstList_Crocomire_Melting1_Top2Rows:
    dw $7FFF,ExtendedSpritemap_Crocomire_26
    dw Instruction_Common_Sleep


;;; $BF72: Instruction list - Crocomire - melting 1 - top 3 rows ;;;
InstList_Crocomire_Melting1_Top3Rows:
    dw $7FFF,ExtendedSpritemap_Crocomire_27
    dw Instruction_Common_Sleep


;;; $BF78: Instruction list - Crocomire - melting 1 - top 4 rows ;;;
InstList_Crocomire_Melting1_Top4Rows:
    dw $7FFF,ExtendedSpritemap_Crocomire_28
    dw Instruction_Common_Sleep


;;; $BF7E: Instruction list - Crocomire - melting 2 - top row ;;;
InstList_Crocomire_Melting2_TopRow:
    dw $7FFF,ExtendedSpritemap_Crocomire_29
    dw Instruction_Common_GotoY
    dw InstList_Crocomire_Melting2_TopRow


;;; $BF86: Instruction list - Crocomire - melting 2 - top 2 rows ;;;
InstList_Crocomire_Melting2_Top2Rows:
    dw $7FFF,ExtendedSpritemap_Crocomire_2A
    dw Instruction_Common_Sleep


;;; $BF8C: Instruction list - Crocomire - melting 2 - top 3 rows ;;;
InstList_Crocomire_Melting2_Top3Rows:
    dw $7FFF,ExtendedSpritemap_Crocomire_2B
    dw Instruction_Common_Sleep


;;; $BF92: Instruction list - Crocomire - melting 2 - top 4 rows ;;;
InstList_Crocomire_Melting2_Top4Rows:
    dw $7FFF,ExtendedSpritemap_Crocomire_2C
    dw Instruction_Common_Sleep


;;; $BF98: Instruction list - Crocomire tongue - melting ;;;
InstList_CrocomireTongue_Melting:
    dw $0005,ExtendedSpritemap_Crocomire_2D
    dw $0005,ExtendedSpritemap_Crocomire_2E
    dw $0005,ExtendedSpritemap_Crocomire_2F
    dw $0005,ExtendedSpritemap_Crocomire_30
    dw $0005,ExtendedSpritemap_Crocomire_31
    dw Instruction_Common_GotoY
    dw InstList_CrocomireTongue_Melting


;;; $BFB0: Instruction list - Crocomire - bridge collapsed ;;;
InstList_CrocomireTongue_BridgeCollapsed:
    dw $0005,ExtendedSpritemap_Crocomire_8
    dw $0005,ExtendedSpritemap_Crocomire_7
    dw Instruction_Crocomire_QueueCrySFX
    dw $0005,ExtendedSpritemap_Crocomire_8
    dw $0005,ExtendedSpritemap_Crocomire_9
    dw Instruction_Common_Sleep


;;; $BFC4: Crocomire extended spritemaps ;;;
ExtendedSpritemap_Crocomire_ChargeForward_StepBack_0:
    dw $0006
    dw $0003,$000B
    dw Spritemap_Crocomire_3
    dw Hitbox_Crocomire_3
    dw $0000,$0026
    dw Spritemap_Crocomire_B
    dw Hitbox_Crocomire_5
    dw $FFE3,$0026
    dw Spritemap_Crocomire_5
    dw Hitbox_Crocomire_5
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_3
    dw Hitbox_Crocomire_F
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_9
    dw Hitbox_Crocomire_F
    dw $0000,$FFFF
    dw ExtendedTilemap_Crocomire_6
    dw Hitbox_Crocomire_F

ExtendedSpritemap_Crocomire_ChargeForward_StepBack_1:
    dw $0006
    dw $0001,$000B
    dw Spritemap_Crocomire_4
    dw Hitbox_Crocomire_4
    dw $0000,$0026
    dw Spritemap_Crocomire_C
    dw Hitbox_Crocomire_5
    dw $FFE3,$0026
    dw Spritemap_Crocomire_6
    dw Hitbox_Crocomire_5
    dw $0000,$FFFE
    dw ExtendedTilemap_Crocomire_4
    dw Hitbox_Crocomire_F
    dw $0000,$FFFE
    dw ExtendedTilemap_Crocomire_9
    dw Hitbox_Crocomire_F
    dw $0000,$FFFE
    dw ExtendedTilemap_Crocomire_7
    dw Hitbox_Crocomire_F

ExtendedSpritemap_Crocomire_ChargeForward_StepBack_2:
    dw $0006
    dw $0000,$0008
    dw Spritemap_Crocomire_1
    dw Hitbox_Crocomire_1
    dw $0000,$0026
    dw Spritemap_Crocomire_D
    dw Hitbox_Crocomire_5
    dw $FFE3,$0026
    dw Spritemap_Crocomire_7
    dw Hitbox_Crocomire_5
    dw $0000,$FFFE
    dw ExtendedTilemap_Crocomire_5
    dw Hitbox_Crocomire_F
    dw $0000,$FFFE
    dw ExtendedTilemap_Crocomire_9
    dw Hitbox_Crocomire_F
    dw $0000,$FFFE
    dw ExtendedTilemap_Crocomire_8
    dw Hitbox_Crocomire_F

ExtendedSpritemap_Crocomire_ChargeForward_StepBack_3:
    dw $0006
    dw $0001,$000B
    dw Spritemap_Crocomire_0
    dw Hitbox_Crocomire_0
    dw $0000,$0026
    dw Spritemap_Crocomire_E
    dw Hitbox_Crocomire_5
    dw $FFE3,$0026
    dw Spritemap_Crocomire_8
    dw Hitbox_Crocomire_5
    dw $0000,$FFFF
    dw ExtendedTilemap_Crocomire_4
    dw Hitbox_Crocomire_F
    dw $0000,$FFFF
    dw ExtendedTilemap_Crocomire_9
    dw Hitbox_Crocomire_F
    dw $0000,$FFFE
    dw ExtendedTilemap_Crocomire_7
    dw Hitbox_Crocomire_F

ExtendedSpritemap_Crocomire_ChargeForward_StepBack_4:
    dw $0006
    dw $0001,$000A
    dw Spritemap_Crocomire_0
    dw Hitbox_Crocomire_0
    dw $0000,$0026
    dw Spritemap_Crocomire_F
    dw Hitbox_Crocomire_5
    dw $FFE3,$0026
    dw Spritemap_Crocomire_9
    dw Hitbox_Crocomire_5
    dw $0000,$FFFE
    dw ExtendedTilemap_Crocomire_3
    dw Hitbox_Crocomire_F
    dw $0000,$FFFE
    dw ExtendedTilemap_Crocomire_9
    dw Hitbox_Crocomire_F
    dw $0000,$FFFE
    dw ExtendedTilemap_Crocomire_6
    dw Hitbox_Crocomire_F

ExtendedSpritemap_Crocomire_ChargeForward_StepBack_5:
    dw $0006
    dw $0001,$000A
    dw Spritemap_Crocomire_2
    dw Hitbox_Crocomire_2
    dw $0000,$0026
    dw Spritemap_Crocomire_10
    dw Hitbox_Crocomire_5
    dw $FFE3,$0026
    dw Spritemap_Crocomire_A
    dw Hitbox_Crocomire_5
    dw $0000,$FFFE
    dw ExtendedTilemap_Crocomire_4
    dw Hitbox_Crocomire_F
    dw $0000,$FFFE
    dw ExtendedTilemap_Crocomire_9
    dw Hitbox_Crocomire_F
    dw $0000,$FFFE
    dw ExtendedTilemap_Crocomire_7
    dw Hitbox_Crocomire_F

ExtendedSpritemap_Crocomire_ChargeForward_StepBack_6:
    dw $0006
    dw $0001,$000A
    dw Spritemap_Crocomire_3
    dw Hitbox_Crocomire_3
    dw $0000,$0026
    dw Spritemap_Crocomire_5
    dw Hitbox_Crocomire_5
    dw $FFE3,$0026
    dw Spritemap_Crocomire_B
    dw Hitbox_Crocomire_5
    dw $0000,$FFFF
    dw ExtendedTilemap_Crocomire_5
    dw Hitbox_Crocomire_F
    dw $0000,$FFFF
    dw ExtendedTilemap_Crocomire_9
    dw Hitbox_Crocomire_F
    dw $0000,$FFFF
    dw ExtendedTilemap_Crocomire_8
    dw Hitbox_Crocomire_F

ExtendedSpritemap_Crocomire_ChargeForward_StepBack_7:
    dw $0006
    dw $0001,$000A
    dw Spritemap_Crocomire_4
    dw Hitbox_Crocomire_4
    dw $0000,$0026
    dw Spritemap_Crocomire_6
    dw Hitbox_Crocomire_5
    dw $FFE3,$0026
    dw Spritemap_Crocomire_C
    dw Hitbox_Crocomire_5
    dw $0000,$FFFF
    dw ExtendedTilemap_Crocomire_4
    dw Hitbox_Crocomire_F
    dw $0000,$FFFF
    dw ExtendedTilemap_Crocomire_9
    dw Hitbox_Crocomire_F
    dw $0000,$FFFF
    dw ExtendedTilemap_Crocomire_7
    dw Hitbox_Crocomire_F

ExtendedSpritemap_Crocomire_ChargeForward_StepBack_8:
    dw $0006
    dw $0001,$000A
    dw Spritemap_Crocomire_1
    dw Hitbox_Crocomire_1
    dw $0000,$0026
    dw Spritemap_Crocomire_7
    dw Hitbox_Crocomire_5
    dw $FFE3,$0026
    dw Spritemap_Crocomire_D
    dw Hitbox_Crocomire_5
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_3
    dw Hitbox_Crocomire_F
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_9
    dw Hitbox_Crocomire_F
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_6
    dw Hitbox_Crocomire_F

ExtendedSpritemap_Crocomire_ChargeForward_StepBack_9:
    dw $0006
    dw $0001,$000C
    dw Spritemap_Crocomire_0
    dw Hitbox_Crocomire_0
    dw $0000,$0026
    dw Spritemap_Crocomire_8
    dw Hitbox_Crocomire_5
    dw $FFE3,$0026
    dw Spritemap_Crocomire_E
    dw Hitbox_Crocomire_5
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_4
    dw Hitbox_Crocomire_F
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_9
    dw Hitbox_Crocomire_F
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_7
    dw Hitbox_Crocomire_F

ExtendedSpritemap_Crocomire_ChargeForward_StepBack_A:
    dw $0006
    dw $0001,$000D
    dw Spritemap_Crocomire_0
    dw Hitbox_Crocomire_0
    dw $0000,$0026
    dw Spritemap_Crocomire_9
    dw Hitbox_Crocomire_5
    dw $FFE3,$0026
    dw Spritemap_Crocomire_F
    dw Hitbox_Crocomire_5
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_5
    dw Hitbox_Crocomire_F
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_9
    dw Hitbox_Crocomire_F
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_8
    dw Hitbox_Crocomire_F

ExtendedSpritemap_Crocomire_ChargeForward_StepBack_B:
    dw $0006
    dw $0001,$000B
    dw Spritemap_Crocomire_2
    dw Hitbox_Crocomire_2
    dw $0000,$0026
    dw Spritemap_Crocomire_A
    dw Hitbox_Crocomire_5
    dw $FFE3,$0026
    dw Spritemap_Crocomire_10
    dw Hitbox_Crocomire_5
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_4
    dw Hitbox_Crocomire_F
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_9
    dw Hitbox_Crocomire_F
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_7
    dw Hitbox_Crocomire_F

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ExtendedSpritemap_Crocomire_A4C21C:
    dw $0006
    dw $0001,$000A
    dw Spritemap_Crocomire_0
    dw Hitbox_Crocomire_0
    dw $0000,$0029
    dw Spritemap_Crocomire_11
    dw Hitbox_Crocomire_5
    dw $FFE3,$0029
    dw Spritemap_Crocomire_11
    dw Hitbox_Crocomire_5
    dw $0000,$FFFE
    dw ExtendedTilemap_Crocomire_3
    dw Hitbox_Crocomire_F
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_9
    dw Hitbox_Crocomire_F
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_6
    dw Hitbox_Crocomire_F

UNUSED_ExtendedSpritemap_Crocomire_A4C24E:
    dw $0006
    dw $0001,$0008
    dw Spritemap_Crocomire_0
    dw Hitbox_Crocomire_0
    dw $0000,$0029
    dw Spritemap_Crocomire_12
    dw Hitbox_Crocomire_5
    dw $FFE3,$0029
    dw Spritemap_Crocomire_12
    dw Hitbox_Crocomire_5
    dw $0000,$FFFC
    dw ExtendedTilemap_Crocomire_4
    dw Hitbox_Crocomire_F
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_9
    dw Hitbox_Crocomire_F
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_7
    dw Hitbox_Crocomire_F

UNUSED_ExtendedSpritemap_Crocomire_A4C280:
    dw $0006
    dw $0001,$0006
    dw Spritemap_Crocomire_0
    dw Hitbox_Crocomire_0
    dw $0000,$0029
    dw Spritemap_Crocomire_13
    dw Hitbox_Crocomire_5
    dw $FFE3,$0029
    dw Spritemap_Crocomire_13
    dw Hitbox_Crocomire_5
    dw $0000,$FFFA
    dw ExtendedTilemap_Crocomire_5
    dw Hitbox_Crocomire_F
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_9
    dw Hitbox_Crocomire_F
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_8
    dw Hitbox_Crocomire_F

UNUSED_ExtendedSpritemap_Crocomire_A4C2B2:
    dw $0007
    dw $0000,$000B
    dw Spritemap_Crocomire_2
    dw Hitbox_Crocomire_2
    dw $FFFD,$FFE4
    dw Spritemap_Crocomire_1D
    dw Hitbox_Crocomire_B
    dw $0000,$0029
    dw Spritemap_Crocomire_13
    dw Hitbox_Crocomire_5
    dw $FFE3,$0029
    dw Spritemap_Crocomire_13
    dw Hitbox_Crocomire_5
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_2
    dw Hitbox_Crocomire_E
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_A
    dw Hitbox_Crocomire_10
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_6
    dw Hitbox_Crocomire_F
endif ; !FEATURE_KEEP_UNREFERENCED

ExtendedSpritemap_Crocomire_0:
    dw $0007
    dw $0000,$000B
    dw Spritemap_Crocomire_2
    dw Hitbox_Crocomire_2
    dw $FFFD,$FFE4
    dw Spritemap_Crocomire_1C
    dw Hitbox_Crocomire_B
    dw $0000,$0029
    dw Spritemap_Crocomire_13
    dw Hitbox_Crocomire_5
    dw $FFE3,$0029
    dw Spritemap_Crocomire_13
    dw Hitbox_Crocomire_5
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_2
    dw Hitbox_Crocomire_E
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_A
    dw Hitbox_Crocomire_10
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_6
    dw Hitbox_Crocomire_F

ExtendedSpritemap_Crocomire_1:
    dw $0007
    dw $0000,$000B
    dw Spritemap_Crocomire_2
    dw Hitbox_Crocomire_2
    dw $FFFD,$FFE4
    dw Spritemap_Crocomire_1D
    dw Hitbox_Crocomire_B
    dw $0000,$0029
    dw Spritemap_Crocomire_13
    dw Hitbox_Crocomire_5
    dw $FFE3,$0029
    dw Spritemap_Crocomire_13
    dw Hitbox_Crocomire_5
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_2
    dw Hitbox_Crocomire_E
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_A
    dw Hitbox_Crocomire_10
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_6
    dw Hitbox_Crocomire_F

ExtendedSpritemap_Crocomire_2:
    dw $0007
    dw $0000,$000B
    dw Spritemap_Crocomire_2
    dw Hitbox_Crocomire_2
    dw $FFFD,$FFE4
    dw Spritemap_Crocomire_1E
    dw Hitbox_Crocomire_B
    dw $0000,$0029
    dw Spritemap_Crocomire_13
    dw Hitbox_Crocomire_5
    dw $FFE3,$0029
    dw Spritemap_Crocomire_13
    dw Hitbox_Crocomire_5
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_2
    dw Hitbox_Crocomire_E
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_A
    dw Hitbox_Crocomire_10
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_6
    dw Hitbox_Crocomire_F

ExtendedSpritemap_Crocomire_3:
    dw $0007
    dw $0000,$000B
    dw Spritemap_Crocomire_2
    dw Hitbox_Crocomire_2
    dw $FFFD,$FFE4
    dw Spritemap_Crocomire_1F
    dw Hitbox_Crocomire_B
    dw $0000,$0029
    dw Spritemap_Crocomire_13
    dw Hitbox_Crocomire_5
    dw $FFE3,$0029
    dw Spritemap_Crocomire_13
    dw Hitbox_Crocomire_5
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_2
    dw Hitbox_Crocomire_E
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_A
    dw Hitbox_Crocomire_10
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_6
    dw Hitbox_Crocomire_F

ExtendedSpritemap_Crocomire_4:
    dw $0007
    dw $0000,$000B
    dw Spritemap_Crocomire_2
    dw Hitbox_Crocomire_2
    dw $FFFD,$FFE4
    dw Spritemap_Crocomire_20
    dw Hitbox_Crocomire_B
    dw $0000,$0029
    dw Spritemap_Crocomire_13
    dw Hitbox_Crocomire_5
    dw $FFE3,$0029
    dw Spritemap_Crocomire_13
    dw Hitbox_Crocomire_5
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_2
    dw Hitbox_Crocomire_E
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_A
    dw Hitbox_Crocomire_10
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_6
    dw Hitbox_Crocomire_F

ExtendedSpritemap_Crocomire_5:
    dw $0007
    dw $0000,$000B
    dw Spritemap_Crocomire_2
    dw Hitbox_Crocomire_2
    dw $FFFD,$FFE4
    dw Spritemap_Crocomire_21
    dw Hitbox_Crocomire_B
    dw $0000,$0029
    dw Spritemap_Crocomire_13
    dw Hitbox_Crocomire_5
    dw $FFE3,$0029
    dw Spritemap_Crocomire_13
    dw Hitbox_Crocomire_5
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_2
    dw Hitbox_Crocomire_E
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_A
    dw Hitbox_Crocomire_10
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_6
    dw Hitbox_Crocomire_F

ExtendedSpritemap_Crocomire_6:
    dw $0006
    dw $0000,$000B
    dw Spritemap_Crocomire_2
    dw Hitbox_Crocomire_2
    dw $0000,$0029
    dw Spritemap_Crocomire_13
    dw Hitbox_Crocomire_5
    dw $FFE3,$0029
    dw Spritemap_Crocomire_13
    dw Hitbox_Crocomire_5
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_2
    dw Hitbox_Crocomire_E
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_A
    dw Hitbox_Crocomire_10
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_6
    dw Hitbox_Crocomire_F

ExtendedSpritemap_Crocomire_MovingClaws_0:
    dw $0006
    dw $0001,$000B
    dw Spritemap_Crocomire_15
    dw Hitbox_Crocomire_7
    dw $0000,$0025
    dw Spritemap_Crocomire_11
    dw Hitbox_Crocomire_5
    dw $FFE3,$0029
    dw Spritemap_Crocomire_13
    dw Hitbox_Crocomire_5
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_3
    dw Hitbox_Crocomire_F
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_9
    dw Hitbox_Crocomire_F
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_6
    dw Hitbox_Crocomire_F

ExtendedSpritemap_Crocomire_MovingClaws_1:
    dw $0006
    dw $0000,$0008
    dw Spritemap_Crocomire_16
    dw Hitbox_Crocomire_8
    dw $0000,$0027
    dw Spritemap_Crocomire_12
    dw Hitbox_Crocomire_5
    dw $FFE3,$0027
    dw Spritemap_Crocomire_12
    dw Hitbox_Crocomire_5
    dw $0000,$FFFE
    dw ExtendedTilemap_Crocomire_4
    dw Hitbox_Crocomire_F
    dw $0000,$FFFE
    dw ExtendedTilemap_Crocomire_9
    dw Hitbox_Crocomire_F
    dw $0000,$FFFE
    dw ExtendedTilemap_Crocomire_7
    dw Hitbox_Crocomire_F

ExtendedSpritemap_Crocomire_MovingClaws_2:
    dw $0006
    dw $0001,$0008
    dw Spritemap_Crocomire_14
    dw Hitbox_Crocomire_6
    dw $0000,$0029
    dw Spritemap_Crocomire_13
    dw Hitbox_Crocomire_5
    dw $FFE3,$0020
    dw Spritemap_Crocomire_11
    dw Hitbox_Crocomire_5
    dw $0000,$FFFC
    dw ExtendedTilemap_Crocomire_5
    dw Hitbox_Crocomire_F
    dw $0000,$FFFC
    dw ExtendedTilemap_Crocomire_9
    dw Hitbox_Crocomire_F
    dw $0000,$FFFC
    dw ExtendedTilemap_Crocomire_8
    dw Hitbox_Crocomire_F

ExtendedSpritemap_Crocomire_MovingClaws_3:
    dw $0006
    dw $0000,$000A
    dw Spritemap_Crocomire_1
    dw Hitbox_Crocomire_1
    dw $0000,$0027
    dw Spritemap_Crocomire_12
    dw Hitbox_Crocomire_5
    dw $FFE3,$0025
    dw Spritemap_Crocomire_12
    dw Hitbox_Crocomire_5
    dw $0000,$FFFE
    dw ExtendedTilemap_Crocomire_4
    dw Hitbox_Crocomire_F
    dw $0000,$FFFE
    dw ExtendedTilemap_Crocomire_9
    dw Hitbox_Crocomire_F
    dw $0000,$FFFE
    dw ExtendedTilemap_Crocomire_7
    dw Hitbox_Crocomire_F

ExtendedSpritemap_Crocomire_MovingClaws_4:
    dw $0006
    dw $0001,$000C
    dw Spritemap_Crocomire_0
    dw Hitbox_Crocomire_0
    dw $0000,$0025
    dw Spritemap_Crocomire_11
    dw Hitbox_Crocomire_5
    dw $FFE3,$0028
    dw Spritemap_Crocomire_13
    dw Hitbox_Crocomire_5
    dw $0000,$FFFF
    dw ExtendedTilemap_Crocomire_3
    dw Hitbox_Crocomire_F
    dw $0000,$FFFF
    dw ExtendedTilemap_Crocomire_9
    dw Hitbox_Crocomire_F
    dw $0000,$FFFF
    dw ExtendedTilemap_Crocomire_6
    dw Hitbox_Crocomire_F

ExtendedSpritemap_Crocomire_7:
    dw $0007
    dw $0001,$000B
    dw Spritemap_Crocomire_2
    dw Hitbox_Crocomire_2
    dw $0000,$0026
    dw Spritemap_Crocomire_A
    dw Hitbox_Crocomire_5
    dw $FFE3,$0026
    dw Spritemap_Crocomire_10
    dw Hitbox_Crocomire_5
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_2
    dw Hitbox_Crocomire_E
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_4
    dw Hitbox_Crocomire_F
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_A
    dw Hitbox_Crocomire_10
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_7
    dw Hitbox_Crocomire_F

ExtendedSpritemap_Crocomire_8:
    dw $0007
    dw $0001,$000B
    dw Spritemap_Crocomire_2
    dw Hitbox_Crocomire_2
    dw $0000,$0026
    dw Spritemap_Crocomire_A
    dw Hitbox_Crocomire_5
    dw $FFE3,$0026
    dw Spritemap_Crocomire_10
    dw Hitbox_Crocomire_5
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_0
    dw Hitbox_Crocomire_C
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_4
    dw Hitbox_Crocomire_F
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_A
    dw Hitbox_Crocomire_10
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_7
    dw Hitbox_Crocomire_F

ExtendedSpritemap_Crocomire_9:
    dw $0007
    dw $0001,$000B
    dw Spritemap_Crocomire_2
    dw Hitbox_Crocomire_2
    dw $0000,$0026
    dw Spritemap_Crocomire_A
    dw Hitbox_Crocomire_5
    dw $FFE3,$0026
    dw Spritemap_Crocomire_10
    dw Hitbox_Crocomire_5
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_1
    dw Hitbox_Crocomire_D
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_4
    dw Hitbox_Crocomire_F
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_A
    dw Hitbox_Crocomire_10
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_7
    dw Hitbox_Crocomire_F

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ExtendedSpritemap_Crocomire_A4C622:
    dw $0001
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_3
    dw Hitbox_Crocomire_F

UNUSED_ExtendedSpritemap_Crocomire_A4C62C:
    dw $0001
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_4
    dw Hitbox_Crocomire_F

UNUSED_ExtendedSpritemap_Crocomire_A4C636:
    dw $0001
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_5
    dw Hitbox_Crocomire_F

UNUSED_ExtendedSpritemap_Crocomire_A4C640:
    dw $0001
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_6
    dw Hitbox_Crocomire_F

UNUSED_ExtendedSpritemap_Crocomire_A4C64A:
    dw $0001
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_7
    dw Hitbox_Crocomire_F

UNUSED_ExtendedSpritemap_Crocomire_A4C654:
    dw $0001
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_8
    dw Hitbox_Crocomire_F
endif ; !FEATURE_KEEP_UNREFERENCED

ExtendedSpritemap_Crocomire_10:
    dw $0001
    dw $FFE0,$FFE8
    dw Spritemap_Crocomire_17
    dw Hitbox_Crocomire_9

ExtendedSpritemap_Crocomire_11:
    dw $0001
    dw $FFE0,$FFE8
    dw Spritemap_Crocomire_18
    dw Hitbox_Crocomire_9

ExtendedSpritemap_Crocomire_12:
    dw $0001
    dw $FFE0,$FFE8
    dw Spritemap_Crocomire_19
    dw Hitbox_Crocomire_9

ExtendedSpritemap_Crocomire_13:
    dw $0001
    dw $FFE0,$FFE8
    dw Spritemap_Crocomire_1A
    dw Hitbox_Crocomire_9

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ExtendedSpritemap_Crocomire_A4C686:
    dw $0001
    dw $0000,$0000
    dw Spritemap_Crocomire_1B
    dw Hitbox_Crocomire_A

UNUSED_ExtendedSpritemap_Crocomire_A4C690:
    dw $0001
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_9
    dw Hitbox_Crocomire_F

UNUSED_ExtendedSpritemap_Crocomire_A4C69A:
    dw $0001
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_A
    dw Hitbox_Crocomire_10
endif ; !FEATURE_KEEP_UNREFERENCED

ExtendedSpritemap_Crocomire_14:
    dw $0007
    dw $0003,$000B
    dw Spritemap_Crocomire_3
    dw Hitbox_Crocomire_3
    dw $0000,$0026
    dw Spritemap_Crocomire_B
    dw Hitbox_Crocomire_5
    dw $FFE3,$0026
    dw Spritemap_Crocomire_5
    dw Hitbox_Crocomire_5
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_2
    dw Hitbox_Crocomire_E
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_3
    dw Hitbox_Crocomire_F
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_A
    dw Hitbox_Crocomire_10
    dw $0000,$FFFF
    dw ExtendedTilemap_Crocomire_6
    dw Hitbox_Crocomire_F

ExtendedSpritemap_Crocomire_15:
    dw $0007
    dw $0001,$000B
    dw Spritemap_Crocomire_4
    dw Hitbox_Crocomire_4
    dw $0000,$0026
    dw Spritemap_Crocomire_C
    dw Hitbox_Crocomire_5
    dw $FFE3,$0026
    dw Spritemap_Crocomire_6
    dw Hitbox_Crocomire_5
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_4
    dw Hitbox_Crocomire_F
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_0
    dw Hitbox_Crocomire_C
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_A
    dw Hitbox_Crocomire_10
    dw $0000,$FFFE
    dw ExtendedTilemap_Crocomire_7
    dw Hitbox_Crocomire_F

ExtendedSpritemap_Crocomire_16:
    dw $0007
    dw $0000,$0008
    dw Spritemap_Crocomire_1
    dw Hitbox_Crocomire_1
    dw $0000,$0026
    dw Spritemap_Crocomire_D
    dw Hitbox_Crocomire_5
    dw $FFE3,$0026
    dw Spritemap_Crocomire_7
    dw Hitbox_Crocomire_5
    dw $0000,$FFFF
    dw ExtendedTilemap_Crocomire_5
    dw Hitbox_Crocomire_F
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_1
    dw Hitbox_Crocomire_D
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_A
    dw Hitbox_Crocomire_10
    dw $0000,$FFFE
    dw ExtendedTilemap_Crocomire_8
    dw Hitbox_Crocomire_F

ExtendedSpritemap_Crocomire_17:
    dw $0007
    dw $0001,$000B
    dw Spritemap_Crocomire_0
    dw Hitbox_Crocomire_0
    dw $0000,$0026
    dw Spritemap_Crocomire_E
    dw Hitbox_Crocomire_5
    dw $FFE3,$0026
    dw Spritemap_Crocomire_8
    dw Hitbox_Crocomire_5
    dw $0000,$FFFF
    dw ExtendedTilemap_Crocomire_4
    dw Hitbox_Crocomire_F
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_1
    dw Hitbox_Crocomire_D
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_A
    dw Hitbox_Crocomire_10
    dw $0000,$FFFE
    dw ExtendedTilemap_Crocomire_7
    dw Hitbox_Crocomire_F

ExtendedSpritemap_Crocomire_18:
    dw $0007
    dw $0001,$000A
    dw Spritemap_Crocomire_0
    dw Hitbox_Crocomire_0
    dw $0000,$0026
    dw Spritemap_Crocomire_F
    dw Hitbox_Crocomire_5
    dw $FFE3,$0026
    dw Spritemap_Crocomire_9
    dw Hitbox_Crocomire_5
    dw $0000,$FFFF
    dw ExtendedTilemap_Crocomire_3
    dw Hitbox_Crocomire_F
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_1
    dw Hitbox_Crocomire_D
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_A
    dw Hitbox_Crocomire_10
    dw $0000,$FFFE
    dw ExtendedTilemap_Crocomire_6
    dw Hitbox_Crocomire_F

ExtendedSpritemap_Crocomire_19:
    dw $0007
    dw $0001,$000A
    dw Spritemap_Crocomire_2
    dw Hitbox_Crocomire_2
    dw $0000,$0026
    dw Spritemap_Crocomire_10
    dw Hitbox_Crocomire_5
    dw $FFE3,$0026
    dw Spritemap_Crocomire_A
    dw Hitbox_Crocomire_5
    dw $0000,$FFFF
    dw ExtendedTilemap_Crocomire_4
    dw Hitbox_Crocomire_F
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_1
    dw Hitbox_Crocomire_D
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_A
    dw Hitbox_Crocomire_10
    dw $0000,$FFFE
    dw ExtendedTilemap_Crocomire_7
    dw Hitbox_Crocomire_F

ExtendedSpritemap_Crocomire_1A:
    dw $0007
    dw $0001,$000A
    dw Spritemap_Crocomire_3
    dw Hitbox_Crocomire_3
    dw $0000,$0026
    dw Spritemap_Crocomire_5
    dw Hitbox_Crocomire_5
    dw $FFE3,$0026
    dw Spritemap_Crocomire_B
    dw Hitbox_Crocomire_5
    dw $0000,$FFFF
    dw ExtendedTilemap_Crocomire_5
    dw Hitbox_Crocomire_F
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_1
    dw Hitbox_Crocomire_D
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_A
    dw Hitbox_Crocomire_10
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_8
    dw Hitbox_Crocomire_F

ExtendedSpritemap_Crocomire_1B:
    dw $0007
    dw $0001,$000A
    dw Spritemap_Crocomire_4
    dw Hitbox_Crocomire_4
    dw $0000,$0026
    dw Spritemap_Crocomire_6
    dw Hitbox_Crocomire_5
    dw $FFE3,$0026
    dw Spritemap_Crocomire_C
    dw Hitbox_Crocomire_5
    dw $0000,$FFFF
    dw ExtendedTilemap_Crocomire_4
    dw Hitbox_Crocomire_F
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_1
    dw Hitbox_Crocomire_D
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_A
    dw Hitbox_Crocomire_10
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_7
    dw Hitbox_Crocomire_F

ExtendedSpritemap_Crocomire_1C:
    dw $0007
    dw $0001,$000A
    dw Spritemap_Crocomire_1
    dw Hitbox_Crocomire_1
    dw $0000,$0026
    dw Spritemap_Crocomire_7
    dw Hitbox_Crocomire_5
    dw $FFE3,$0026
    dw Spritemap_Crocomire_D
    dw Hitbox_Crocomire_5
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_3
    dw Hitbox_Crocomire_F
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_1
    dw Hitbox_Crocomire_D
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_A
    dw Hitbox_Crocomire_10
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_6
    dw Hitbox_Crocomire_F

ExtendedSpritemap_Crocomire_1D:
    dw $0007
    dw $0001,$000C
    dw Spritemap_Crocomire_0
    dw Hitbox_Crocomire_0
    dw $0000,$0026
    dw Spritemap_Crocomire_8
    dw Hitbox_Crocomire_5
    dw $FFE3,$0026
    dw Spritemap_Crocomire_E
    dw Hitbox_Crocomire_5
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_4
    dw Hitbox_Crocomire_F
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_1
    dw Hitbox_Crocomire_D
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_A
    dw Hitbox_Crocomire_10
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_7
    dw Hitbox_Crocomire_F

ExtendedSpritemap_Crocomire_1E:
    dw $0007
    dw $0001,$000D
    dw Spritemap_Crocomire_0
    dw Hitbox_Crocomire_0
    dw $0000,$0026
    dw Spritemap_Crocomire_9
    dw Hitbox_Crocomire_5
    dw $FFE3,$0026
    dw Spritemap_Crocomire_F
    dw Hitbox_Crocomire_5
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_5
    dw Hitbox_Crocomire_F
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_0
    dw Hitbox_Crocomire_C
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_A
    dw Hitbox_Crocomire_10
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_8
    dw Hitbox_Crocomire_F

ExtendedSpritemap_Crocomire_1F:
    dw $0007
    dw $0001,$000B
    dw Spritemap_Crocomire_2
    dw Hitbox_Crocomire_2
    dw $0000,$0026
    dw Spritemap_Crocomire_A
    dw Hitbox_Crocomire_5
    dw $FFE3,$0026
    dw Spritemap_Crocomire_10
    dw Hitbox_Crocomire_5
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_5
    dw Hitbox_Crocomire_F
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_2
    dw Hitbox_Crocomire_E
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_A
    dw Hitbox_Crocomire_10
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_8
    dw Hitbox_Crocomire_F

ExtendedSpritemap_Crocomire_20:
    dw $0007
    dw $0001,$000B
    dw Spritemap_Crocomire_15
    dw Hitbox_Crocomire_7
    dw $0000,$0026
    dw Spritemap_Crocomire_A
    dw Hitbox_Crocomire_5
    dw $FFE3,$0026
    dw Spritemap_Crocomire_10
    dw Hitbox_Crocomire_5
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_1
    dw Hitbox_Crocomire_D
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_4
    dw Hitbox_Crocomire_F
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_A
    dw Hitbox_Crocomire_10
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_7
    dw Hitbox_Crocomire_F

ExtendedSpritemap_Crocomire_21:
    dw $0007
    dw $0000,$0006
    dw Spritemap_Crocomire_16
    dw Hitbox_Crocomire_8
    dw $0000,$0026
    dw Spritemap_Crocomire_A
    dw Hitbox_Crocomire_5
    dw $FFE3,$0026
    dw Spritemap_Crocomire_10
    dw Hitbox_Crocomire_5
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_1
    dw Hitbox_Crocomire_D
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_4
    dw Hitbox_Crocomire_F
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_A
    dw Hitbox_Crocomire_10
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_7
    dw Hitbox_Crocomire_F

ExtendedSpritemap_Crocomire_22:
    dw $0007
    dw $0001,$0004
    dw Spritemap_Crocomire_14
    dw Hitbox_Crocomire_6
    dw $0000,$0026
    dw Spritemap_Crocomire_A
    dw Hitbox_Crocomire_5
    dw $FFE3,$0026
    dw Spritemap_Crocomire_10
    dw Hitbox_Crocomire_5
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_1
    dw Hitbox_Crocomire_D
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_4
    dw Hitbox_Crocomire_F
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_A
    dw Hitbox_Crocomire_10
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_7
    dw Hitbox_Crocomire_F

ExtendedSpritemap_Crocomire_23:
    dw $0007
    dw $0000,$0008
    dw Spritemap_Crocomire_1
    dw Hitbox_Crocomire_1
    dw $0000,$0026
    dw Spritemap_Crocomire_A
    dw Hitbox_Crocomire_5
    dw $FFE3,$0026
    dw Spritemap_Crocomire_10
    dw Hitbox_Crocomire_5
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_1
    dw Hitbox_Crocomire_D
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_4
    dw Hitbox_Crocomire_F
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_A
    dw Hitbox_Crocomire_10
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_7
    dw Hitbox_Crocomire_F

ExtendedSpritemap_Crocomire_24:
    dw $0007
    dw $0001,$000B
    dw Spritemap_Crocomire_0
    dw Hitbox_Crocomire_0
    dw $0000,$0026
    dw Spritemap_Crocomire_A
    dw Hitbox_Crocomire_5
    dw $FFE3,$0026
    dw Spritemap_Crocomire_10
    dw Hitbox_Crocomire_5
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_1
    dw Hitbox_Crocomire_D
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_4
    dw Hitbox_Crocomire_F
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_A
    dw Hitbox_Crocomire_10
    dw $0000,$0000
    dw ExtendedTilemap_Crocomire_7
    dw Hitbox_Crocomire_F

ExtendedSpritemap_Crocomire_25:
    dw $0001
    dw $0000,$0000
    dw Spritemap_Crocomire_22
    dw Hitbox_Crocomire_1

ExtendedSpritemap_Crocomire_26:
    dw $0001
    dw $0000,$0000
    dw Spritemap_Crocomire_23
    dw Hitbox_Crocomire_1

ExtendedSpritemap_Crocomire_27:
    dw $0001
    dw $0000,$0000
    dw Spritemap_Crocomire_24
    dw Hitbox_Crocomire_1

ExtendedSpritemap_Crocomire_28:
    dw $0001
    dw $0000,$0000
    dw Spritemap_Crocomire_25
    dw Hitbox_Crocomire_1

ExtendedSpritemap_Crocomire_29:
    dw $0001
    dw $0000,$0000
    dw Spritemap_Crocomire_26
    dw Hitbox_Crocomire_1

ExtendedSpritemap_Crocomire_2A:
    dw $0001
    dw $0000,$0000
    dw Spritemap_Crocomire_27
    dw Hitbox_Crocomire_1

ExtendedSpritemap_Crocomire_2B:
    dw $0001
    dw $0000,$0000
    dw Spritemap_Crocomire_28
    dw Hitbox_Crocomire_1

ExtendedSpritemap_Crocomire_2C:
    dw $0001
    dw $0000,$0000
    dw Spritemap_Crocomire_29
    dw Hitbox_Crocomire_1

ExtendedSpritemap_Crocomire_2D:
    dw $0001
    dw $0001,$000B
    dw Spritemap_Crocomire_15
    dw Hitbox_Crocomire_11

ExtendedSpritemap_Crocomire_2E:
    dw $0001
    dw $0000,$0008
    dw Spritemap_Crocomire_16
    dw Hitbox_Crocomire_11

ExtendedSpritemap_Crocomire_2F:
    dw $0001
    dw $0001,$0008
    dw Spritemap_Crocomire_14
    dw Hitbox_Crocomire_11

ExtendedSpritemap_Crocomire_30:
    dw $0001
    dw $0000,$000A
    dw Spritemap_Crocomire_1
    dw Hitbox_Crocomire_11

ExtendedSpritemap_Crocomire_31:
    dw $0001
    dw $0001,$000C
    dw Spritemap_Crocomire_0
    dw Hitbox_Crocomire_11


;;; $CB00: RTL ;;;
RTL_A4CB00:
    RTL


;;; $CB01: RTL ;;;
RTL_A4CB01:
    LDX.W EnemyIndex
    RTL


;;; $CB05: Crocomire hitboxes ;;;
if !FEATURE_KEEP_UNREFERENCED
UNUSED_Hitbox_Crocomire_A4CB05:
    dw $0000
endif ; !FEATURE_KEEP_UNREFERENCED

Hitbox_Crocomire_0:
    dw $0001
    dw $FFB2,$0020,$FFF0,$002B
    dw EnemyTouch_Crocomire_Claws
    dw EnemyShot_Crocomire_SpawnShotExplosion_duplicate

Hitbox_Crocomire_1:
    dw $0001
    dw $FFA1,$000B,$FFF0,$000B
    dw EnemyTouch_Crocomire_Claws
    dw EnemyShot_Crocomire_SpawnShotExplosion_duplicate

Hitbox_Crocomire_2:
    dw $0001
    dw $FFBB,$001F,$FFF0,$002C
    dw EnemyTouch_Crocomire_Claws
    dw EnemyShot_Crocomire_SpawnShotExplosion_duplicate

Hitbox_Crocomire_3:
    dw $0001
    dw $FFC4,$0012,$FFF0,$0020
    dw EnemyTouch_Crocomire_Claws
    dw EnemyShot_Crocomire_SpawnShotExplosion_duplicate

Hitbox_Crocomire_4:
    dw $0001
    dw $FFB0,$000D,$FFF0,$001B
    dw EnemyTouch_Crocomire_Claws
    dw EnemyShot_Crocomire_SpawnShotExplosion_duplicate

Hitbox_Crocomire_5:
    dw $0000

Hitbox_Crocomire_6:
    dw $0001
    dw $FFA1,$FFFA,$FFF0,$001B
    dw EnemyTouch_Crocomire_Claws
    dw EnemyShot_Crocomire_Nothing

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Hitbox_Crocomire_A4CB5D:
    dw $0000
endif ; !FEATURE_KEEP_UNREFERENCED

Hitbox_Crocomire_7:
    dw $0001
    dw $FFC5,$FFF7,$FFF0,$0005
    dw EnemyTouch_Crocomire_Claws
    dw EnemyShot_Crocomire_Nothing

Hitbox_Crocomire_8:
    dw $0001
    dw $FFA3,$FFDC,$FFE2,$FFF3
    dw EnemyTouch_Crocomire_Claws
    dw EnemyShot_Crocomire_Nothing

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Hitbox_Crocomire_A4CB7B:
    dw $0001
    dw $FFFB,$FFFB,$0004,$0004
    dw EnemyTouch_Crocomire_Claws
    dw EnemyShot_Crocomire_Nothing

UNUSED_Hitbox_Crocomire_A4CB89:
    dw $0001
    dw $FFFA,$FFF9,$0005,$0006
    dw EnemyTouch_Crocomire_Claws
    dw EnemyShot_Crocomire_Nothing

UNUSED_Hitbox_Crocomire_A4CB97:
    dw $0001
    dw $FFF8,$FFF8,$0007,$0007
    dw EnemyTouch_Crocomire_Claws
    dw EnemyShot_Crocomire_Nothing

UNUSED_Hitbox_Crocomire_A4CBA5:
    dw $0001
    dw $FFF7,$FFF8,$0008,$0007
    dw EnemyTouch_Crocomire_Claws
    dw EnemyShot_Crocomire_Nothing
endif ; !FEATURE_KEEP_UNREFERENCED

Hitbox_Crocomire_9:
    dw $0000

Hitbox_Crocomire_A:
    dw $0001
    dw $FFF7,$FFF7,$0008,$0007
    dw EnemyTouch_Crocomire_Claws
    dw EnemyShot_Crocomire_Nothing

Hitbox_Crocomire_B:
    dw $0000

Hitbox_Crocomire_C:
    dw $0003
    dw $FFCE,$FFDB,$0028,$FFF0
    dw Common_NormalEnemyTouchAI
    dw EnemyShot_Crocomire_OpenMouth
    dw $FFCC,$FFC6,$002A,$FFDA
    dw Common_NormalEnemyTouchAI
    dw Common_NormalEnemyShotAI
    dw $FFE0,$FFF3,$0028,$0000
    dw Common_NormalEnemyTouchAI
    dw Common_NormalEnemyShotAI

Hitbox_Crocomire_D:
    dw $0003
    dw $FFD2,$FFCB,$000D,$FFF0
    dw Common_NormalEnemyTouchAI
    dw EnemyShot_Crocomire_OpenMouth
    dw $FFD7,$FFB6,$0010,$FFC7
    dw Common_NormalEnemyTouchAI
    dw Common_NormalEnemyShotAI
    dw $FFDB,$FFF0,$0010,$FFFD
    dw Common_NormalEnemyTouchAI
    dw Common_NormalEnemyShotAI

Hitbox_Crocomire_E:
    dw $0001
    dw $FFDB,$FFCE,$0026,$FFFC
    dw EnemyTouch_Crocomire_Claws
    dw Common_NormalEnemyShotAI

Hitbox_Crocomire_F:
    dw $0001
    dw $FFDA,$FFD0,$0025,$0034
    dw EnemyTouch_Crocomire_Claws
    dw EnemyShot_Crocomire_SpawnShotExplosion

Hitbox_Crocomire_10:
    dw $0001
    dw $FFDA,$FFFC,$002A,$0034
    dw EnemyTouch_Crocomire_Claws
    dw EnemyShot_Crocomire_Nothing

Hitbox_Crocomire_11:
    dw $0000


;;; $CC3D: Crocomire spritemaps / extended tilemaps ;;;
if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Crocomire_A4CC3D:
    dw $0011
    %spritemapEntry(0, $1E4, $18, 0, 0, 3, 0, $1A6)
    %spritemapEntry(0, $1F4, $18, 0, 0, 3, 0, $1BF)
    %spritemapEntry(0, $1EC, $18, 0, 0, 3, 0, $1AF)
    %spritemapEntry(1, $1C, $10, 0, 0, 3, 0, $1CA)
    %spritemapEntry(1, $0C, $10, 0, 0, 3, 0, $1C8)
    %spritemapEntry(1, $1FC, $10, 0, 0, 3, 0, $1C6)
    %spritemapEntry(1, $1C, $00, 0, 0, 3, 0, $1C4)
    %spritemapEntry(1, $0C, $00, 0, 0, 3, 0, $1C2)
    %spritemapEntry(1, $1FC, $00, 0, 0, 3, 0, $1C0)
    %spritemapEntry(0, $0C, $E8, 0, 0, 3, 0, $1B6)
    %spritemapEntry(1, $1C, $F0, 0, 0, 3, 0, $1AD)
    %spritemapEntry(1, $0C, $F0, 0, 0, 3, 0, $1AB)
    %spritemapEntry(1, $1FC, $F0, 0, 0, 3, 0, $1A9)
    %spritemapEntry(1, $1EC, $F0, 0, 0, 3, 0, $1A7)
    %spritemapEntry(1, $1FC, $E0, 0, 0, 3, 0, $1A4)
    %spritemapEntry(1, $1EC, $E0, 0, 0, 3, 0, $1A2)
    %spritemapEntry(1, $1DC, $E0, 0, 0, 3, 0, $1A0)

UNUSED_Spritemap_Crocomire_A4CC94:
    dw $0011
    %spritemapEntry(0, $14, $18, 0, 1, 3, 0, $1A6)
    %spritemapEntry(0, $04, $18, 0, 1, 3, 0, $1BF)
    %spritemapEntry(0, $0C, $18, 0, 1, 3, 0, $1AF)
    %spritemapEntry(1, $1D4, $10, 0, 1, 3, 0, $1CA)
    %spritemapEntry(1, $1E4, $10, 0, 1, 3, 0, $1C8)
    %spritemapEntry(1, $1F4, $10, 0, 1, 3, 0, $1C6)
    %spritemapEntry(1, $1D4, $00, 0, 1, 3, 0, $1C4)
    %spritemapEntry(1, $1E4, $00, 0, 1, 3, 0, $1C2)
    %spritemapEntry(1, $1F4, $00, 0, 1, 3, 0, $1C0)
    %spritemapEntry(0, $1EC, $E8, 0, 1, 3, 0, $1B6)
    %spritemapEntry(1, $1D4, $F0, 0, 1, 3, 0, $1AD)
    %spritemapEntry(1, $1E4, $F0, 0, 1, 3, 0, $1AB)
    %spritemapEntry(1, $1F4, $F0, 0, 1, 3, 0, $1A9)
    %spritemapEntry(1, $04, $F0, 0, 1, 3, 0, $1A7)
    %spritemapEntry(1, $1F4, $E0, 0, 1, 3, 0, $1A4)
    %spritemapEntry(1, $04, $E0, 0, 1, 3, 0, $1A2)
    %spritemapEntry(1, $14, $E0, 0, 1, 3, 0, $1A0)

UNUSED_Spritemap_Crocomire_A4CCEB:
    dw $000A
    %spritemapEntry(0, $18, $0C, 0, 0, 3, 0, $16B)
    %spritemapEntry(0, $10, $0C, 0, 0, 3, 0, $16A)
    %spritemapEntry(1, $10, $FC, 0, 0, 3, 0, $168)
    %spritemapEntry(1, $10, $EC, 0, 0, 3, 0, $166)
    %spritemapEntry(1, $00, $00, 0, 0, 3, 0, $164)
    %spritemapEntry(1, $1F0, $00, 0, 0, 3, 0, $162)
    %spritemapEntry(1, $00, $F0, 0, 0, 3, 0, $164)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 3, 0, $162)
    %spritemapEntry(1, $1E0, $FC, 0, 0, 3, 0, $180)
    %spritemapEntry(1, $1E0, $EC, 0, 0, 3, 0, $160)

UNUSED_Spritemap_Crocomire_A4CD1F:
    dw $000A
    %spritemapEntry(0, $1E0, $0C, 0, 1, 3, 0, $16B)
    %spritemapEntry(0, $1E8, $0C, 0, 1, 3, 0, $16A)
    %spritemapEntry(1, $1E0, $FC, 0, 1, 3, 0, $168)
    %spritemapEntry(1, $1E0, $EC, 0, 1, 3, 0, $166)
    %spritemapEntry(1, $1F0, $00, 0, 1, 3, 0, $164)
    %spritemapEntry(1, $00, $00, 0, 1, 3, 0, $162)
    %spritemapEntry(1, $1F0, $F0, 0, 1, 3, 0, $164)
    %spritemapEntry(1, $00, $F0, 0, 1, 3, 0, $162)
    %spritemapEntry(1, $10, $FC, 0, 1, 3, 0, $180)
    %spritemapEntry(1, $10, $EC, 0, 1, 3, 0, $160)

UNUSED_Spritemap_Crocomire_A4CD53:
    dw $000F
    %spritemapEntry(1, $20, $10, 0, 0, 3, 0, $18E)
    %spritemapEntry(1, $00, $10, 0, 0, 3, 0, $18A)
    %spritemapEntry(1, $10, $10, 0, 0, 3, 0, $18C)
    %spritemapEntry(0, $1F8, $18, 0, 0, 3, 0, $17B)
    %spritemapEntry(0, $1F0, $10, 0, 0, 3, 0, $10F)
    %spritemapEntry(0, $1F8, $10, 0, 0, 3, 0, $11F)
    %spritemapEntry(0, $1E7, $18, 0, 1, 3, 0, $17A)
    %spritemapEntry(0, $1E0, $18, 0, 0, 3, 0, $17A)
    %spritemapEntry(0, $1D0, $10, 0, 0, 3, 0, $188)
    %spritemapEntry(0, $1D8, $10, 0, 0, 3, 0, $189)
    %spritemapEntry(0, $1E0, $10, 0, 0, 3, 0, $198)
    %spritemapEntry(0, $1E8, $10, 0, 0, 3, 0, $199)
    %spritemapEntry(1, $1F0, $00, 0, 0, 3, 0, $186)
    %spritemapEntry(1, $1E0, $00, 0, 0, 3, 0, $184)
    %spritemapEntry(1, $1D0, $00, 0, 0, 3, 0, $182)

UNUSED_Spritemap_Crocomire_A4CDA0:
    dw $000F
    %spritemapEntry(1, $1D0, $10, 0, 1, 3, 0, $18E)
    %spritemapEntry(1, $1F0, $10, 0, 1, 3, 0, $18A)
    %spritemapEntry(1, $1E0, $10, 0, 1, 3, 0, $18C)
    %spritemapEntry(0, $00, $18, 0, 1, 3, 0, $17B)
    %spritemapEntry(0, $08, $10, 0, 1, 3, 0, $10F)
    %spritemapEntry(0, $00, $10, 0, 1, 3, 0, $11F)
    %spritemapEntry(0, $11, $18, 0, 0, 3, 0, $17A)
    %spritemapEntry(0, $18, $18, 0, 1, 3, 0, $17A)
    %spritemapEntry(0, $28, $10, 0, 1, 3, 0, $188)
    %spritemapEntry(0, $20, $10, 0, 1, 3, 0, $189)
    %spritemapEntry(0, $18, $10, 0, 1, 3, 0, $198)
    %spritemapEntry(0, $10, $10, 0, 1, 3, 0, $199)
    %spritemapEntry(1, $00, $00, 0, 1, 3, 0, $186)
    %spritemapEntry(1, $10, $00, 0, 1, 3, 0, $184)
    %spritemapEntry(1, $20, $00, 0, 1, 3, 0, $182)

UNUSED_Spritemap_Crocomire_A4CDED:
    dw $0002
    %spritemapEntry(1, $00, $F8, 0, 0, 3, 0, $16E)
    %spritemapEntry(1, $1F0, $F8, 0, 0, 3, 0, $16C)

UNUSED_Spritemap_Crocomire_A4CDF9:
    dw $0002
    %spritemapEntry(1, $1F0, $F8, 0, 1, 3, 0, $16E)
    %spritemapEntry(1, $00, $F8, 0, 1, 3, 0, $16C)

UNUSED_Spritemap_Crocomire_A4CE05:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 3, 0, $160)

UNUSED_Spritemap_Crocomire_A4CE0C:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 3, 0, $180)

UNUSED_Spritemap_Crocomire_A4CE13:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 3, 0, $162)

UNUSED_Spritemap_Crocomire_A4CE1A:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 3, 0, $164)

UNUSED_Spritemap_Crocomire_A4CE21:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 3, 0, $166)

UNUSED_Spritemap_Crocomire_A4CE28:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 3, 0, $168)

UNUSED_Spritemap_Crocomire_A4CE2F:
    dw $0002
    %spritemapEntry(0, $1F8, $FC, 0, 1, 3, 0, $16B)
    %spritemapEntry(0, $00, $FC, 0, 1, 3, 0, $16A)

UNUSED_Spritemap_Crocomire_A4CE3B:
    dw $0003
    %spritemapEntry(0, $00, $04, 0, 1, 3, 0, $188)
    %spritemapEntry(0, $1F8, $04, 0, 1, 3, 0, $189)
    %spritemapEntry(1, $1F8, $F4, 0, 1, 3, 0, $182)

UNUSED_Spritemap_Crocomire_A4CE4C:
    dw $0005
    %spritemapEntry(0, $1F9, $08, 0, 0, 3, 0, $17A)
    %spritemapEntry(0, $00, $08, 0, 1, 3, 0, $17A)
    %spritemapEntry(0, $00, $00, 0, 1, 3, 0, $198)
    %spritemapEntry(0, $1F8, $00, 0, 1, 3, 0, $199)
    %spritemapEntry(1, $1F8, $F0, 0, 1, 3, 0, $184)

UNUSED_Spritemap_Crocomire_A4CE67:
    dw $0004
    %spritemapEntry(0, $00, $05, 0, 1, 3, 0, $10F)
    %spritemapEntry(0, $1F8, $0D, 0, 1, 3, 0, $17B)
    %spritemapEntry(0, $1F8, $05, 0, 1, 3, 0, $11F)
    %spritemapEntry(1, $1F8, $F5, 0, 1, 3, 0, $186)

UNUSED_Spritemap_Crocomire_A4CE7D:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 3, 0, $18A)

UNUSED_Spritemap_Crocomire_A4CE84:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 3, 0, $18C)

UNUSED_Spritemap_Crocomire_A4CE8B:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 3, 0, $18E)
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_Crocomire_0:
    dw $0009
    %spritemapEntry(1, $1C3, $1A, 0, 0, 3, 0, $E4)
    %spritemapEntry(1, $1B3, $1E, 0, 0, 3, 0, $100)
    %spritemapEntry(0, $00, $07, 0, 0, 3, 0, $108)
    %spritemapEntry(0, $1F0, $FF, 0, 0, 3, 0, $F6)
    %spritemapEntry(1, $1F0, $07, 0, 0, 3, 0, $106)
    %spritemapEntry(1, $1F8, $F7, 0, 0, 3, 0, $E7)
    %spritemapEntry(1, $1EC, $0B, 0, 0, 3, 0, $E0)
    %spritemapEntry(1, $1DE, $12, 0, 0, 3, 0, $E0)
    %spritemapEntry(1, $1D0, $19, 0, 0, 3, 0, $E0)

Spritemap_Crocomire_1:
    dw $0009
    %spritemapEntry(1, $1B1, $13, 0, 0, 3, 0, $E4)
    %spritemapEntry(1, $1A1, $13, 0, 0, 3, 0, $100)
    %spritemapEntry(0, $1F8, $09, 0, 0, 3, 0, $FF)
    %spritemapEntry(0, $1F0, $F9, 0, 0, 3, 0, $EF)
    %spritemapEntry(1, $1E8, $01, 0, 0, 3, 0, $ED)
    %spritemapEntry(1, $1F8, $F9, 0, 0, 3, 0, $10D)
    %spritemapEntry(1, $1DE, $05, 0, 0, 3, 0, $102)
    %spritemapEntry(1, $1CE, $0F, 0, 0, 3, 0, $104)
    %spritemapEntry(1, $1C0, $0F, 0, 0, 3, 0, $102)

Spritemap_Crocomire_2:
    dw $0007
    %spritemapEntry(1, $1CC, $1C, 0, 0, 3, 0, $E4)
    %spritemapEntry(1, $1BC, $1E, 0, 0, 3, 0, $100)
    %spritemapEntry(1, $1F8, $08, 0, 0, 3, 0, $109)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 0, $E9)
    %spritemapEntry(1, $1F6, $0D, 0, 0, 3, 0, $E0)
    %spritemapEntry(1, $1E8, $14, 0, 0, 3, 0, $E0)
    %spritemapEntry(1, $1DA, $1B, 0, 0, 3, 0, $E0)

Spritemap_Crocomire_3:
    dw $0009
    %spritemapEntry(0, $00, $08, 0, 1, 3, 0, $FF)
    %spritemapEntry(0, $08, $F8, 0, 1, 3, 0, $EF)
    %spritemapEntry(1, $08, $00, 0, 1, 3, 0, $ED)
    %spritemapEntry(1, $1F8, $F8, 0, 1, 3, 0, $10D)
    %spritemapEntry(1, $1D5, $11, 0, 0, 3, 0, $E4)
    %spritemapEntry(1, $1C5, $11, 0, 0, 3, 0, $100)
    %spritemapEntry(1, $02, $03, 0, 0, 3, 0, $102)
    %spritemapEntry(1, $1F2, $0D, 0, 0, 3, 0, $104)
    %spritemapEntry(1, $1E4, $0D, 0, 0, 3, 0, $102)

Spritemap_Crocomire_4:
    dw $0007
    %spritemapEntry(1, $1C0, $0C, 0, 0, 3, 0, $E4)
    %spritemapEntry(1, $1B0, $0C, 0, 0, 3, 0, $100)
    %spritemapEntry(1, $1F8, $08, 0, 0, 3, 0, $109)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 0, $E9)
    %spritemapEntry(1, $1F0, $0C, 0, 0, 3, 0, $E2)
    %spritemapEntry(1, $1E0, $0C, 0, 0, 3, 0, $E2)
    %spritemapEntry(1, $1D0, $0C, 0, 0, 3, 0, $E2)

Spritemap_Crocomire_5:
    dw $0008
    %spritemapEntry(0, $02, $09, 0, 0, 3, 0, $DF)
    %spritemapEntry(0, $1FA, $09, 0, 0, 3, 0, $DE)
    %spritemapEntry(0, $1F2, $09, 0, 0, 3, 0, $DD)
    %spritemapEntry(0, $1EA, $09, 0, 0, 3, 0, $DC)
    %spritemapEntry(0, $1E2, $09, 0, 0, 3, 0, $DB)
    %spritemapEntry(1, $1F2, $F9, 0, 0, 3, 0, $12D)
    %spritemapEntry(1, $1F6, $F9, 0, 0, 3, 0, $14B)
    %spritemapEntry(1, $01, $F9, 0, 0, 3, 0, $12B)

Spritemap_Crocomire_6:
    dw $0008
    %spritemapEntry(0, $05, $09, 0, 0, 3, 0, $DF)
    %spritemapEntry(0, $1FD, $09, 0, 0, 3, 0, $DE)
    %spritemapEntry(0, $1F5, $09, 0, 0, 3, 0, $DD)
    %spritemapEntry(0, $1ED, $09, 0, 0, 3, 0, $DC)
    %spritemapEntry(0, $1E5, $09, 0, 0, 3, 0, $DB)
    %spritemapEntry(1, $1F5, $F9, 0, 0, 3, 0, $12D)
    %spritemapEntry(1, $1F7, $F9, 0, 0, 3, 0, $14B)
    %spritemapEntry(1, $01, $F9, 0, 0, 3, 0, $12B)

Spritemap_Crocomire_7:
    dw $0008
    %spritemapEntry(0, $08, $09, 0, 0, 3, 0, $DF)
    %spritemapEntry(0, $00, $09, 0, 0, 3, 0, $DE)
    %spritemapEntry(0, $1F8, $09, 0, 0, 3, 0, $DD)
    %spritemapEntry(0, $1F0, $09, 0, 0, 3, 0, $DC)
    %spritemapEntry(0, $1E8, $09, 0, 0, 3, 0, $DB)
    %spritemapEntry(1, $1F8, $F9, 0, 0, 3, 0, $12D)
    %spritemapEntry(1, $1F9, $F9, 0, 0, 3, 0, $14B)
    %spritemapEntry(1, $00, $F9, 0, 0, 3, 0, $12B)

Spritemap_Crocomire_8:
    dw $0008
    %spritemapEntry(0, $0C, $09, 0, 0, 3, 0, $DF)
    %spritemapEntry(0, $04, $09, 0, 0, 3, 0, $DE)
    %spritemapEntry(0, $1FC, $09, 0, 0, 3, 0, $DD)
    %spritemapEntry(0, $1F4, $09, 0, 0, 3, 0, $DC)
    %spritemapEntry(0, $1EC, $09, 0, 0, 3, 0, $DB)
    %spritemapEntry(1, $1FC, $F9, 0, 0, 3, 0, $12D)
    %spritemapEntry(1, $1FC, $F9, 0, 0, 3, 0, $14B)
    %spritemapEntry(1, $00, $F9, 0, 0, 3, 0, $12B)

Spritemap_Crocomire_9:
    dw $0008
    %spritemapEntry(1, $03, $F9, 0, 0, 3, 0, $12D)
    %spritemapEntry(1, $02, $F9, 0, 1, 3, 0, $14B)
    %spritemapEntry(0, $11, $09, 0, 0, 3, 0, $DF)
    %spritemapEntry(0, $09, $09, 0, 0, 3, 0, $DE)
    %spritemapEntry(0, $01, $09, 0, 0, 3, 0, $DD)
    %spritemapEntry(0, $1F9, $09, 0, 0, 3, 0, $DC)
    %spritemapEntry(0, $1F1, $09, 0, 0, 3, 0, $DB)
    %spritemapEntry(1, $01, $F9, 0, 1, 3, 0, $12B)

Spritemap_Crocomire_A:
    dw $0008
    %spritemapEntry(1, $09, $F9, 0, 0, 3, 0, $12D)
    %spritemapEntry(1, $06, $F9, 0, 1, 3, 0, $14B)
    %spritemapEntry(0, $18, $09, 0, 0, 3, 0, $DF)
    %spritemapEntry(0, $10, $09, 0, 0, 3, 0, $DE)
    %spritemapEntry(0, $08, $09, 0, 0, 3, 0, $DD)
    %spritemapEntry(0, $00, $09, 0, 0, 3, 0, $DC)
    %spritemapEntry(0, $1F8, $09, 0, 0, 3, 0, $DB)
    %spritemapEntry(1, $01, $F9, 0, 1, 3, 0, $12B)

Spritemap_Crocomire_B:
    dw $0008
    %spritemapEntry(1, $10, $F9, 0, 0, 3, 0, $12D)
    %spritemapEntry(1, $0B, $F9, 0, 1, 3, 0, $14B)
    %spritemapEntry(0, $20, $09, 0, 0, 3, 0, $DF)
    %spritemapEntry(0, $18, $09, 0, 0, 3, 0, $DE)
    %spritemapEntry(0, $10, $09, 0, 0, 3, 0, $DD)
    %spritemapEntry(0, $08, $09, 0, 0, 3, 0, $DC)
    %spritemapEntry(0, $00, $09, 0, 0, 3, 0, $DB)
    %spritemapEntry(1, $03, $F9, 0, 1, 3, 0, $12B)

Spritemap_Crocomire_C:
    dw $0008
    %spritemapEntry(1, $09, $F8, 0, 0, 3, 0, $12D)
    %spritemapEntry(1, $06, $F8, 0, 1, 3, 0, $14B)
    %spritemapEntry(0, $18, $09, 0, 0, 3, 0, $DF)
    %spritemapEntry(0, $10, $08, 0, 0, 3, 0, $DE)
    %spritemapEntry(0, $08, $08, 0, 0, 3, 0, $DD)
    %spritemapEntry(0, $00, $09, 0, 0, 3, 0, $DC)
    %spritemapEntry(0, $1F8, $09, 0, 0, 3, 0, $DB)
    %spritemapEntry(1, $01, $F9, 0, 1, 3, 0, $12B)

Spritemap_Crocomire_D:
    dw $0008
    %spritemapEntry(1, $03, $F5, 0, 0, 3, 0, $12D)
    %spritemapEntry(1, $02, $F5, 0, 1, 3, 0, $14B)
    %spritemapEntry(0, $11, $06, 0, 0, 3, 0, $DF)
    %spritemapEntry(0, $09, $05, 0, 0, 3, 0, $DE)
    %spritemapEntry(0, $01, $05, 0, 0, 3, 0, $DD)
    %spritemapEntry(0, $1F9, $07, 0, 0, 3, 0, $DC)
    %spritemapEntry(0, $1F1, $07, 0, 0, 3, 0, $DB)
    %spritemapEntry(1, $01, $F9, 0, 1, 3, 0, $12B)

Spritemap_Crocomire_E:
    dw $0008
    %spritemapEntry(0, $0C, $06, 0, 0, 3, 0, $DF)
    %spritemapEntry(0, $04, $05, 0, 0, 3, 0, $DE)
    %spritemapEntry(0, $1FC, $05, 0, 0, 3, 0, $DD)
    %spritemapEntry(0, $1F4, $07, 0, 0, 3, 0, $DC)
    %spritemapEntry(0, $1EC, $07, 0, 0, 3, 0, $DB)
    %spritemapEntry(1, $1FC, $F5, 0, 0, 3, 0, $12D)
    %spritemapEntry(1, $1FC, $F5, 0, 0, 3, 0, $14B)
    %spritemapEntry(1, $00, $F9, 0, 0, 3, 0, $12B)

Spritemap_Crocomire_F:
    dw $0008
    %spritemapEntry(0, $08, $06, 0, 0, 3, 0, $DF)
    %spritemapEntry(0, $00, $05, 0, 0, 3, 0, $DE)
    %spritemapEntry(0, $1F8, $05, 0, 0, 3, 0, $DD)
    %spritemapEntry(0, $1F0, $07, 0, 0, 3, 0, $DC)
    %spritemapEntry(0, $1E8, $07, 0, 0, 3, 0, $DB)
    %spritemapEntry(1, $1F8, $F5, 0, 0, 3, 0, $12D)
    %spritemapEntry(1, $1F9, $F5, 0, 0, 3, 0, $14B)
    %spritemapEntry(1, $00, $F9, 0, 0, 3, 0, $12B)

Spritemap_Crocomire_10:
    dw $0008
    %spritemapEntry(0, $05, $07, 0, 0, 3, 0, $DF)
    %spritemapEntry(0, $1FD, $06, 0, 0, 3, 0, $DE)
    %spritemapEntry(0, $1F5, $06, 0, 0, 3, 0, $DD)
    %spritemapEntry(0, $1ED, $08, 0, 0, 3, 0, $DC)
    %spritemapEntry(0, $1E5, $08, 0, 0, 3, 0, $DB)
    %spritemapEntry(1, $1F5, $F6, 0, 0, 3, 0, $12D)
    %spritemapEntry(1, $1F7, $F6, 0, 0, 3, 0, $14B)
    %spritemapEntry(1, $01, $F9, 0, 0, 3, 0, $12B)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Crocomire_A4D161:
    dw $0008
    %spritemapEntry(0, $02, $08, 0, 0, 3, 0, $DF)
    %spritemapEntry(0, $1FA, $07, 0, 0, 3, 0, $DE)
    %spritemapEntry(0, $1F2, $07, 0, 0, 3, 0, $DD)
    %spritemapEntry(0, $1EA, $08, 0, 0, 3, 0, $DC)
    %spritemapEntry(0, $1E2, $08, 0, 0, 3, 0, $DB)
    %spritemapEntry(1, $1F2, $F7, 0, 0, 3, 0, $12D)
    %spritemapEntry(1, $1F6, $F7, 0, 0, 3, 0, $14B)
    %spritemapEntry(1, $01, $F9, 0, 0, 3, 0, $12B)
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_Crocomire_11:
    dw $0008
    %spritemapEntry(0, $0C, $04, 0, 0, 3, 0, $DF)
    %spritemapEntry(0, $04, $05, 0, 0, 3, 0, $DE)
    %spritemapEntry(0, $1FC, $05, 0, 0, 3, 0, $DD)
    %spritemapEntry(0, $1F4, $05, 0, 0, 3, 0, $DC)
    %spritemapEntry(0, $1EC, $05, 0, 0, 3, 0, $DB)
    %spritemapEntry(1, $1FC, $F5, 0, 0, 3, 0, $12D)
    %spritemapEntry(1, $1FC, $F5, 0, 0, 3, 0, $14B)
    %spritemapEntry(1, $00, $F9, 0, 0, 3, 0, $12B)

Spritemap_Crocomire_12:
    dw $0008
    %spritemapEntry(0, $0C, $04, 0, 0, 3, 0, $DF)
    %spritemapEntry(0, $04, $05, 0, 0, 3, 0, $DE)
    %spritemapEntry(0, $1FC, $05, 0, 0, 3, 0, $DD)
    %spritemapEntry(0, $1F4, $05, 0, 0, 3, 0, $DC)
    %spritemapEntry(0, $1EC, $05, 0, 0, 3, 0, $DB)
    %spritemapEntry(1, $1FC, $F5, 0, 0, 3, 0, $12D)
    %spritemapEntry(1, $1FC, $F3, 0, 0, 3, 0, $14B)
    %spritemapEntry(1, $00, $F5, 0, 0, 3, 0, $12B)

Spritemap_Crocomire_13:
    dw $0008
    %spritemapEntry(0, $0C, $04, 0, 0, 3, 0, $DF)
    %spritemapEntry(0, $04, $05, 0, 0, 3, 0, $DE)
    %spritemapEntry(0, $1FC, $05, 0, 0, 3, 0, $DD)
    %spritemapEntry(0, $1F4, $05, 0, 0, 3, 0, $DC)
    %spritemapEntry(0, $1EC, $05, 0, 0, 3, 0, $DB)
    %spritemapEntry(1, $1FC, $F5, 0, 0, 3, 0, $12D)
    %spritemapEntry(1, $1FC, $F1, 0, 0, 3, 0, $14B)
    %spritemapEntry(1, $00, $F1, 0, 0, 3, 0, $12B)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Crocomire_A4D209:
    dw $0009
    %spritemapEntry(1, $2D, $1A, 0, 1, 3, 0, $E4)
    %spritemapEntry(1, $3D, $1E, 0, 1, 3, 0, $100)
    %spritemapEntry(0, $1F8, $07, 0, 1, 3, 0, $108)
    %spritemapEntry(0, $08, $FF, 0, 1, 3, 0, $F6)
    %spritemapEntry(1, $00, $07, 0, 1, 3, 0, $106)
    %spritemapEntry(1, $1F8, $F7, 0, 1, 3, 0, $E7)
    %spritemapEntry(1, $04, $0B, 0, 1, 3, 0, $E0)
    %spritemapEntry(1, $12, $12, 0, 1, 3, 0, $E0)
    %spritemapEntry(1, $20, $19, 0, 1, 3, 0, $E0)

UNUSED_Spritemap_Crocomire_A4D238:
    dw $0009
    %spritemapEntry(1, $3F, $13, 0, 1, 3, 0, $E4)
    %spritemapEntry(1, $4F, $13, 0, 1, 3, 0, $100)
    %spritemapEntry(0, $00, $09, 0, 1, 3, 0, $FF)
    %spritemapEntry(0, $08, $F9, 0, 1, 3, 0, $EF)
    %spritemapEntry(1, $08, $01, 0, 1, 3, 0, $ED)
    %spritemapEntry(1, $1F8, $F9, 0, 1, 3, 0, $10D)
    %spritemapEntry(1, $12, $05, 0, 1, 3, 0, $102)
    %spritemapEntry(1, $22, $0F, 0, 1, 3, 0, $104)
    %spritemapEntry(1, $30, $0F, 0, 1, 3, 0, $102)

UNUSED_Spritemap_Crocomire_A4D267:
    dw $0007
    %spritemapEntry(1, $24, $1C, 0, 1, 3, 0, $E4)
    %spritemapEntry(1, $34, $1E, 0, 1, 3, 0, $100)
    %spritemapEntry(1, $1F8, $08, 0, 1, 3, 0, $109)
    %spritemapEntry(1, $1F8, $F8, 0, 1, 3, 0, $E9)
    %spritemapEntry(1, $1FA, $0D, 0, 1, 3, 0, $E0)
    %spritemapEntry(1, $08, $14, 0, 1, 3, 0, $E0)
    %spritemapEntry(1, $16, $1B, 0, 1, 3, 0, $E0)

UNUSED_Spritemap_Crocomire_A4D28C:
    dw $0009
    %spritemapEntry(0, $1F8, $08, 0, 0, 3, 0, $FF)
    %spritemapEntry(0, $1F0, $F8, 0, 0, 3, 0, $EF)
    %spritemapEntry(1, $1E8, $00, 0, 0, 3, 0, $ED)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 0, $10D)
    %spritemapEntry(1, $1B, $11, 0, 1, 3, 0, $E4)
    %spritemapEntry(1, $2B, $11, 0, 1, 3, 0, $100)
    %spritemapEntry(1, $1EE, $03, 0, 1, 3, 0, $102)
    %spritemapEntry(1, $1FE, $0D, 0, 1, 3, 0, $104)
    %spritemapEntry(1, $0C, $0D, 0, 1, 3, 0, $102)
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_Crocomire_14:
    dw $0007
    %spritemapEntry(1, $1E6, $FA, 0, 0, 3, 0, $EB)
    %spritemapEntry(1, $1F6, $FA, 0, 0, 3, 0, $10B)
    %spritemapEntry(1, $1AD, $FA, 0, 0, 3, 0, $E4)
    %spritemapEntry(1, $19D, $FA, 0, 0, 3, 0, $100)
    %spritemapEntry(1, $1DD, $FA, 0, 0, 3, 0, $E2)
    %spritemapEntry(1, $1CD, $FA, 0, 0, 3, 0, $E2)
    %spritemapEntry(1, $1BD, $FA, 0, 0, 3, 0, $E2)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Crocomire_A4D2E0:
    dw $0009
    %spritemapEntry(0, $00, $F0, 1, 1, 3, 0, $FF)
    %spritemapEntry(0, $08, $00, 1, 1, 3, 0, $EF)
    %spritemapEntry(1, $08, $F0, 1, 1, 3, 0, $ED)
    %spritemapEntry(1, $1F8, $F8, 1, 1, 3, 0, $10D)
    %spritemapEntry(1, $3D, $DB, 0, 1, 3, 0, $E4)
    %spritemapEntry(1, $4D, $DB, 0, 1, 3, 0, $100)
    %spritemapEntry(1, $10, $EC, 1, 1, 3, 0, $102)
    %spritemapEntry(1, $20, $E2, 1, 1, 3, 0, $104)
    %spritemapEntry(1, $2E, $E2, 1, 1, 3, 0, $102)

UNUSED_Spritemap_Crocomire_A4D30F:
    dw $0007
    %spritemapEntry(1, $0A, $FA, 0, 1, 3, 0, $EB)
    %spritemapEntry(1, $1FA, $FA, 0, 1, 3, 0, $10B)
    %spritemapEntry(1, $43, $FA, 0, 1, 3, 0, $E4)
    %spritemapEntry(1, $53, $FA, 0, 1, 3, 0, $100)
    %spritemapEntry(1, $13, $FA, 0, 1, 3, 0, $E2)
    %spritemapEntry(1, $23, $FA, 0, 1, 3, 0, $E2)
    %spritemapEntry(1, $33, $FA, 0, 1, 3, 0, $E2)

UNUSED_Spritemap_Crocomire_A4D334:
    dw $0009
    %spritemapEntry(0, $1F8, $08, 0, 0, 3, 0, $FF)
    %spritemapEntry(0, $1F0, $F8, 0, 0, 3, 0, $EF)
    %spritemapEntry(1, $1E8, $00, 0, 0, 3, 0, $ED)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 0, $10D)
    %spritemapEntry(1, $1B, $F6, 0, 1, 3, 0, $E4)
    %spritemapEntry(1, $2B, $F6, 0, 1, 3, 0, $100)
    %spritemapEntry(1, $1EE, $07, 1, 1, 3, 0, $102)
    %spritemapEntry(1, $1FE, $FD, 1, 1, 3, 0, $104)
    %spritemapEntry(1, $0C, $FD, 1, 1, 3, 0, $102)

UNUSED_Spritemap_Crocomire_A4D363:
    dw $0007
    %spritemapEntry(1, $1F8, $08, 0, 1, 3, 0, $109)
    %spritemapEntry(1, $1F8, $F8, 0, 1, 3, 0, $E9)
    %spritemapEntry(1, $2A, $FA, 0, 1, 3, 0, $E4)
    %spritemapEntry(1, $3A, $FA, 0, 1, 3, 0, $100)
    %spritemapEntry(1, $1FD, $0B, 1, 1, 3, 0, $102)
    %spritemapEntry(1, $0D, $01, 1, 1, 3, 0, $104)
    %spritemapEntry(1, $1B, $01, 1, 1, 3, 0, $102)
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_Crocomire_15:
    dw $0009
    %spritemapEntry(0, $00, $08, 0, 1, 3, 0, $FF)
    %spritemapEntry(0, $08, $F8, 0, 1, 3, 0, $EF)
    %spritemapEntry(1, $08, $00, 0, 1, 3, 0, $ED)
    %spritemapEntry(1, $1F8, $F8, 0, 1, 3, 0, $10D)
    %spritemapEntry(1, $1D5, $F6, 0, 0, 3, 0, $E4)
    %spritemapEntry(1, $1C5, $F6, 0, 0, 3, 0, $100)
    %spritemapEntry(1, $02, $07, 1, 0, 3, 0, $102)
    %spritemapEntry(1, $1F2, $FD, 1, 0, 3, 0, $104)
    %spritemapEntry(1, $1E4, $FD, 1, 0, 3, 0, $102)

Spritemap_Crocomire_16:
    dw $0009
    %spritemapEntry(0, $1F8, $F0, 1, 0, 3, 0, $FF)
    %spritemapEntry(0, $1F0, $00, 1, 0, 3, 0, $EF)
    %spritemapEntry(1, $1E8, $F0, 1, 0, 3, 0, $ED)
    %spritemapEntry(1, $1F8, $F8, 1, 0, 3, 0, $10D)
    %spritemapEntry(1, $1B3, $DB, 0, 0, 3, 0, $E4)
    %spritemapEntry(1, $1A3, $DB, 0, 0, 3, 0, $100)
    %spritemapEntry(1, $1E0, $EC, 1, 0, 3, 0, $102)
    %spritemapEntry(1, $1D0, $E2, 1, 0, 3, 0, $104)
    %spritemapEntry(1, $1C2, $E2, 1, 0, 3, 0, $102)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Crocomire_A4D3E6:
    dw $0004
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 0, $D0)
    %spritemapEntry(0, $00, $00, 1, 1, 3, 0, $D0)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 0, $D0)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $D0)

UNUSED_Spritemap_Crocomire_A4D3FC:
    dw $0004
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 0, $D1)
    %spritemapEntry(0, $00, $00, 1, 1, 3, 0, $D1)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 0, $D1)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $D1)

UNUSED_Spritemap_Crocomire_A4D412:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 3, 0, $D2)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 0, $D2)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 0, $D2)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $D2)

UNUSED_Spritemap_Crocomire_A4D428:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 3, 0, $D3)
    %spritemapEntry(0, $00, $F8, 0, 1, 3, 0, $D3)
    %spritemapEntry(0, $1F8, $00, 1, 0, 3, 0, $D3)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 3, 0, $D3)
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_Crocomire_17:
    dw $0004
    %spritemapEntry(0, $08, $00, 0, 0, 2, 0, $D7)
    %spritemapEntry(0, $00, $00, 0, 0, 2, 0, $D6)
    %spritemapEntry(0, $1F8, $00, 0, 0, 2, 0, $D5)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $D4)

Spritemap_Crocomire_18:
    dw $0003
    %spritemapEntry(0, $08, $00, 0, 0, 2, 0, $DA)
    %spritemapEntry(0, $00, $00, 0, 0, 2, 0, $D9)
    %spritemapEntry(0, $1F8, $00, 0, 0, 2, 0, $D8)

Spritemap_Crocomire_19:
    dw $0004
    %spritemapEntry(0, $08, $F8, 1, 0, 2, 0, $D7)
    %spritemapEntry(0, $00, $F8, 1, 0, 2, 0, $D6)
    %spritemapEntry(0, $1F8, $F8, 1, 0, 2, 0, $D5)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 0, $D4)

Spritemap_Crocomire_1A:
    dw $0003
    %spritemapEntry(0, $08, $F8, 1, 0, 2, 0, $DA)
    %spritemapEntry(0, $00, $F8, 1, 0, 2, 0, $D9)
    %spritemapEntry(0, $1F8, $F8, 1, 0, 2, 0, $D8)

Spritemap_Crocomire_1B:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 0, $1CC)

Spritemap_Crocomire_1C:
    dw $0006
    %spritemapEntry(0, $1E0, $00, 0, 0, 3, 0, $1DE)
    %spritemapEntry(0, $1E0, $F8, 0, 0, 3, 0, $1CE)
    %spritemapEntry(0, $1E8, $00, 0, 0, 3, 0, $15D)
    %spritemapEntry(0, $1E8, $F8, 0, 0, 3, 0, $14D)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 3, 0, $1E6)
    %spritemapEntry(1, $00, $F0, 0, 0, 3, 0, $1E0)

Spritemap_Crocomire_1D:
    dw $0006
    %spritemapEntry(0, $1E0, $00, 0, 0, 3, 0, $1DF)
    %spritemapEntry(0, $1E0, $F8, 0, 0, 3, 0, $1CF)
    %spritemapEntry(0, $1E8, $00, 0, 0, 3, 0, $15D)
    %spritemapEntry(0, $1E8, $F8, 0, 0, 3, 0, $14D)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 3, 0, $1E6)
    %spritemapEntry(1, $00, $F0, 0, 0, 3, 0, $1E0)

Spritemap_Crocomire_1E:
    dw $0006
    %spritemapEntry(0, $1E8, $00, 0, 0, 3, 0, $15E)
    %spritemapEntry(0, $1E8, $F8, 0, 0, 3, 0, $14E)
    %spritemapEntry(0, $1E0, $00, 0, 0, 3, 0, $13F)
    %spritemapEntry(0, $1E0, $F8, 0, 0, 3, 0, $12F)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 3, 0, $1E6)
    %spritemapEntry(1, $00, $F0, 0, 0, 3, 0, $1E0)

Spritemap_Crocomire_1F:
    dw $0004
    %spritemapEntry(1, $00, $F0, 0, 0, 3, 0, $1E0)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 3, 0, $1E8)
    %spritemapEntry(0, $1E8, $00, 0, 0, 3, 0, $15F)
    %spritemapEntry(0, $1E8, $F8, 0, 0, 3, 0, $14F)

Spritemap_Crocomire_20:
    dw $0002
    %spritemapEntry(1, $00, $F0, 0, 0, 3, 0, $1E2)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 3, 0, $1EA)

Spritemap_Crocomire_21:
    dw $0001
    %spritemapEntry(1, $00, $F0, 0, 0, 3, 0, $1E4)

ExtendedTilemap_Crocomire_0:
    dw $FFFE
    dw $2000,$000C, $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $2040,$000C, $0338,$0338,$3CA2,$3CA3,$3CA4,$3CA5,$3CA6,$3CA7,$3CA8,$3CA9,$3CAA,$0338
    dw $2080,$000C, $3CB0,$3CB1,$3CB2,$3CB3,$3CB4,$3CB5,$3CB6,$3CB7,$3CB8,$3CB9,$3CBA,$3CBB
    dw $20C0,$000C, $3CAC,$3CAD,$3CAE,$3CAF,$3CC0,$3CC1,$3CC2,$3CC3,$3CC4,$3CC5,$3CC6,$3CC7
    dw $2100,$000C, $3CBC,$3CBD,$3CBE,$3CBF,$3CD0,$3CD1,$3CD2,$3CD3,$3CD4,$3CD5,$3CD6,$3CD7
    dw $2140,$000C, $0338,$0338,$0338,$0338,$3CCA,$3CCB,$3CCC,$3CCD,$3CCE,$3CCF,$3C8B,$3C8C
    dw $2180,$000C, $0338,$0338,$3CD8,$3CD9,$3CDA,$3CDB,$3CDC,$3CDD,$3CDE,$3CDF,$3C9B,$3C9C
    dw $21C0,$000C, $0338,$0338,$3C43,$3C44,$3C45,$3C46,$3C8D,$3C8E,$3C8F,$3C9D,$3C9E,$3C9F
    dw $FFFF

ExtendedTilemap_Crocomire_1:
    dw $FFFE
    dw $2000,$0008, $0338,$3CE0,$3CE1,$3CE2,$3CE3,$3CE4,$3CE5,$3CE6
    dw $2040,$000B, $0338,$3CF0,$3CF1,$3CF2,$3CF3,$3CF4,$3CF5,$3CF6,$3CF7,$3CF8,$0338
    dw $2080,$000C, $0338,$0338,$3CE9,$3CEA,$3CEB,$3CEC,$3CED,$3CEE,$3CEF,$3D00,$3D01,$0338
    dw $20C0,$000C, $0338,$0338,$0338,$3CFA,$3CFB,$3CFC,$3CFD,$3CFE,$3CFF,$3D10,$3D11,$3D12
    dw $2100,$000C, $0338,$0338,$0338,$0338,$3D03,$3D04,$3D05,$3D06,$3D07,$3D08,$3D09,$3D0A
    dw $2140,$000C, $0338,$0338,$0338,$0338,$0338,$3D14,$3D15,$3D16,$3D17,$3D18,$3D19,$3D1A
    dw $2180,$000C, $0338,$0338,$3D0C,$3D0D,$3D0E,$3D0F,$3D20,$3D21,$3D22,$3D23,$3D24,$3D25
    dw $21C0,$000C, $0338,$0338,$3D1C,$3D1D,$3D1E,$3D1F,$3D30,$3D31,$3D32,$3D33,$3D34,$3D35
    dw $FFFF

ExtendedTilemap_Crocomire_2:
    dw $FFFE
    dw $2000,$0008, $0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $2040,$000B, $0338,$0338,$0338,$0338,$0338,$3C02,$3C03,$3C04,$3C05,$3C06,$3C07
    dw $2080,$000C, $0338,$0338,$0338,$3C10,$3C11,$3C12,$3C13,$3C14,$3C15,$3C16,$3C17,$3C18
    dw $20C0,$000C, $0338,$3C0A,$3C0B,$3C0C,$3C0D,$3C0E,$3C0F,$3C20,$3C21,$3C22,$3C23,$3C24
    dw $2100,$000C, $3C19,$3C1A,$3C1B,$3C1C,$3C1D,$3C1E,$3C1F,$3C30,$3C31,$3C32,$3C33,$3C34
    dw $2140,$000C, $3C25,$3C26,$3C27,$3C28,$3C29,$3C2A,$3C2B,$3C2C,$3C2D,$3C2E,$3C2F,$3C40
    dw $2180,$000C, $3C35,$3C36,$3C37,$3C38,$3C39,$3C3A,$3C3B,$3C3C,$3C3D,$3C3E,$3C3F,$3C50
    dw $21C0,$0001, $3C00
    dw $21C4,$000A, $3C43,$3C44,$3C45,$3C46,$3C47,$3C48,$3C49,$3C4A,$3C4B,$3C4C
    dw $FFFF

ExtendedTilemap_Crocomire_3:
    dw $FFFE
    dw $2246,$0004, $3C4F,$3C60,$3C61,$3C62
    dw $2286,$0004, $3C5F,$3C70,$3C71,$3C72
    dw $22C6,$0004, $3C6A,$3C6B,$3C6C,$3C6D
    dw $2306,$0004, $3C7A,$3C7B,$3C7C,$3C7D
    dw $FFFF

ExtendedTilemap_Crocomire_4:
    dw $FFFE,$2246,$0004,$3D46,$3D47,$3D48,$3D49,$2286,$0004,$3D56,$3D57,$3D58,$3D59,$22C6,$0004,$3D4A,$3D4B,$3D4C,$3D4D,$2306,$0004,$3D5A,$3D5B,$3D5C,$3D5D,$FFFF

ExtendedTilemap_Crocomire_5:
    dw $FFFE,$2246,$0004,$3D4E,$3D4F,$3D02,$3D0B,$2286,$0004,$3D13,$3D1B,$3C42,$3C51,$22C6,$0004,$3CA0,$3CA1,$3CAB,$3CF9,$2306,$0004,$3C01,$3C08,$3C09,$3C41,$FFFF

ExtendedTilemap_Crocomire_6:
    dw $FFFE,$2354,$0006,$3D40,$3D41,$3D42,$3D43,$3D44,$3D45,$2394,$0006,$3D50,$3D51,$3D52,$3D53,$3D54,$3D55,$FFFF

ExtendedTilemap_Crocomire_7:
    dw $FFFE,$2354,$0006,$3D26,$3D27,$3D28,$3D29,$3D2A,$3D2B,$2394,$0006,$3D36,$3D37,$3D38,$3D39,$3D3A,$3D3B,$FFFF

ExtendedTilemap_Crocomire_8:
    dw $FFFE,$2354,$0006,$3D2C,$3D2D,$3D2E,$3D2F,$3CC8,$3CC9,$2394,$0006,$3D3C,$3D3D,$3D3E,$3D3F,$3CE7,$3CE8,$FFFF

ExtendedTilemap_Crocomire_9:
    dw $FFFE
    dw $2040,$000C, $0338,$0338,$0338,$0338,$0338,$3C02,$3C03,$3C04,$3C05,$3C06,$3C07,$0338
    dw $2080,$000C, $0338,$0338,$0338,$3C10,$3C11,$3C12,$3C13,$3C14,$3C15,$3C16,$3C17,$3C18
    dw $20C0,$000C, $0338,$3C0A,$3C0B,$3C0C,$3C0D,$3C0E,$3C0F,$3C20,$3C21,$3C22,$3C23,$3C24
    dw $2100,$000C, $3C19,$3C1A,$3C1B,$3C1C,$3C1D,$3C1E,$3C1F,$3C30,$3C31,$3C32,$3C33,$3C34
    dw $2140,$000C, $3C25,$3C26,$3C27,$3C28,$3C29,$3C2A,$3C2B,$3C2C,$3C2D,$3C2E,$3C2F,$3C40
    dw $2180,$000C, $3C35,$3C36,$3C37,$3C38,$3C39,$3C3A,$3C3B,$3C3C,$3C3D,$3C3E,$3C3F,$3C50
    dw $21C0,$000C, $3C00,$0338,$3C43,$3C44,$3C45,$3C46,$3C47,$3C48,$3C49,$3C4A,$3C4B,$3C4C
    dw $2200,$000C, $0338,$0338,$3C53,$3C54,$3C55,$3C56,$3C57,$3C58,$3C59,$3C5A,$3C5B,$3C5C
    dw $2240,$000C, $0338,$3C4D,$3C4E,$3C4F,$3C60,$3C61,$3C62,$3C63,$3C64,$3C65,$3C66,$3C67
    dw $2280,$000C, $0338,$3C5D,$3C5E,$3C5F,$3C70,$3C71,$3C72,$3C73,$3C74,$3C75,$3C76,$3C77
    dw $22C0,$000C, $0338,$3C68,$3C69,$3C6A,$3C6B,$3C6C,$3C6D,$3C6E,$3C6F,$3C80,$3C81,$0338
    dw $2300,$000C, $0338,$3C78,$3C79,$3C7A,$3C7B,$3C7C,$3C7D,$3C7E,$3C7F,$3C90,$3C91,$0338
    dw $2340,$000C, $0338,$3C82,$3C83,$3C84,$3C85,$3C86,$3C87,$3C88,$3C89,$3C8A,$3D40,$3D41
    dw $2380,$000C, $0338,$0338,$3C93,$3C94,$3C95,$3C96,$3C97,$3C98,$3C99,$3C9A,$3D50,$3D51
    dw $FFFF

ExtendedTilemap_Crocomire_A:
    dw $FFFE
    dw $2202,$000B, $0338,$3C53,$3C54,$3C55,$3C56,$3C57,$3C58,$3C59,$3C5A,$3C5B,$3C5C
    dw $2242,$000B, $3C4D,$3C4E,$3C4F,$3C60,$3C61,$3C62,$3C63,$3C64,$3C65,$3C66,$3C67
    dw $2282,$000B, $3C5D,$3C5E,$3C5F,$3C70,$3C71,$3C72,$3C73,$3C74,$3C75,$3C76,$3C77
    dw $22C2,$000B, $3C68,$3C69,$3C6A,$3C6B,$3C6C,$3C6D,$3C6E,$3C6F,$3C80,$3C81,$0338
    dw $2302,$000B, $3C78,$3C79,$3C7A,$3C7B,$3C7C,$3C7D,$3C7E,$3C7F,$3C90,$3C91,$0338
    dw $2342,$000B, $3C82,$3C83,$3C84,$3C85,$3C86,$3C87,$3C88,$3C89,$3C8A,$3D40,$3D41
    dw $2382,$000B, $0338,$3C93,$3C94,$3C95,$3C96,$3C97,$3C98,$3C99,$3C9A,$3D50,$3D51
    dw $FFFF

Spritemap_Crocomire_22:
    dw $0017
    %spritemapEntry(0, $1D8, $D8, 0, 0, 2, 7, $177)
    %spritemapEntry(0, $1E8, $E8, 0, 0, 2, 7, $166)
    %spritemapEntry(0, $1F0, $E8, 0, 0, 2, 7, $165)
    %spritemapEntry(0, $00, $D0, 0, 0, 2, 7, $176)
    %spritemapEntry(0, $1F8, $D0, 0, 0, 2, 7, $175)
    %spritemapEntry(0, $1F0, $D0, 0, 0, 2, 7, $174)
    %spritemapEntry(0, $1F0, $C8, 0, 0, 2, 7, $164)
    %spritemapEntry(1, $43E0, $C8, 0, 0, 2, 7, $162)
    %spritemapEntry(1, $43D0, $C8, 0, 0, 2, 7, $160)
    %spritemapEntry(1, $43E8, $D8, 0, 0, 2, 7, $168)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 2, 7, $177)
    %spritemapEntry(0, $1E0, $D8, 0, 0, 2, 7, $167)
    %spritemapEntry(1, $4218, $D8, 0, 0, 2, 7, $16E)
    %spritemapEntry(1, $4208, $D8, 0, 0, 2, 7, $16C)
    %spritemapEntry(1, $43F8, $D8, 0, 0, 2, 7, $16A)
    %spritemapEntry(1, $4218, $E8, 0, 0, 2, 7, $184)
    %spritemapEntry(1, $4208, $E8, 0, 0, 2, 7, $182)
    %spritemapEntry(1, $43F8, $E8, 0, 0, 2, 7, $180)
    %spritemapEntry(1, $4218, $F8, 0, 0, 2, 7, $18E)
    %spritemapEntry(1, $4208, $F8, 0, 0, 2, 7, $18C)
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 7, $18A)
    %spritemapEntry(1, $43E8, $F8, 0, 0, 2, 7, $188)
    %spritemapEntry(1, $43D8, $F8, 0, 0, 2, 7, $186)

Spritemap_Crocomire_23:
    dw $0022
    %spritemapEntry(0, $1D8, $D8, 0, 0, 2, 7, $177)
    %spritemapEntry(0, $1E8, $E8, 0, 0, 2, 7, $166)
    %spritemapEntry(0, $1F0, $E8, 0, 0, 2, 7, $165)
    %spritemapEntry(0, $00, $D0, 0, 0, 2, 7, $176)
    %spritemapEntry(0, $1F8, $D0, 0, 0, 2, 7, $175)
    %spritemapEntry(0, $1F0, $D0, 0, 0, 2, 7, $174)
    %spritemapEntry(0, $1F0, $C8, 0, 0, 2, 7, $164)
    %spritemapEntry(1, $43E0, $C8, 0, 0, 2, 7, $162)
    %spritemapEntry(1, $43D0, $C8, 0, 0, 2, 7, $160)
    %spritemapEntry(1, $43E8, $D8, 0, 0, 2, 7, $168)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 2, 7, $177)
    %spritemapEntry(0, $1E0, $D8, 0, 0, 2, 7, $167)
    %spritemapEntry(1, $4218, $D8, 0, 0, 2, 7, $16E)
    %spritemapEntry(1, $4208, $D8, 0, 0, 2, 7, $16C)
    %spritemapEntry(1, $43F8, $D8, 0, 0, 2, 7, $16A)
    %spritemapEntry(1, $4218, $E8, 0, 0, 2, 7, $184)
    %spritemapEntry(1, $4208, $E8, 0, 0, 2, 7, $182)
    %spritemapEntry(1, $43F8, $E8, 0, 0, 2, 7, $180)
    %spritemapEntry(1, $4218, $F8, 0, 0, 2, 7, $18E)
    %spritemapEntry(1, $4208, $F8, 0, 0, 2, 7, $18C)
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 7, $18A)
    %spritemapEntry(1, $43E8, $F8, 0, 0, 2, 7, $188)
    %spritemapEntry(1, $43D8, $F8, 0, 0, 2, 7, $186)
    %spritemapEntry(0, $20, $08, 0, 0, 2, 7, $13A)
    %spritemapEntry(0, $18, $08, 0, 0, 2, 7, $139)
    %spritemapEntry(0, $10, $08, 0, 0, 2, 7, $138)
    %spritemapEntry(0, $08, $08, 0, 0, 2, 7, $137)
    %spritemapEntry(0, $00, $08, 0, 0, 2, 7, $136)
    %spritemapEntry(0, $1F8, $08, 0, 0, 2, 7, $135)
    %spritemapEntry(0, $1F0, $08, 0, 0, 2, 7, $134)
    %spritemapEntry(0, $1E8, $08, 0, 0, 2, 7, $133)
    %spritemapEntry(0, $1E0, $08, 0, 0, 2, 7, $132)
    %spritemapEntry(0, $1D8, $08, 0, 0, 2, 7, $131)
    %spritemapEntry(0, $1D0, $08, 0, 0, 2, 7, $130)

Spritemap_Crocomire_24:
    dw $002D
    %spritemapEntry(0, $1D8, $D8, 0, 0, 2, 7, $177)
    %spritemapEntry(0, $1E8, $E8, 0, 0, 2, 7, $166)
    %spritemapEntry(0, $1F0, $E8, 0, 0, 2, 7, $165)
    %spritemapEntry(0, $00, $D0, 0, 0, 2, 7, $176)
    %spritemapEntry(0, $1F8, $D0, 0, 0, 2, 7, $175)
    %spritemapEntry(0, $1F0, $D0, 0, 0, 2, 7, $174)
    %spritemapEntry(0, $1F0, $C8, 0, 0, 2, 7, $164)
    %spritemapEntry(1, $43E0, $C8, 0, 0, 2, 7, $162)
    %spritemapEntry(1, $43D0, $C8, 0, 0, 2, 7, $160)
    %spritemapEntry(1, $43E8, $D8, 0, 0, 2, 7, $168)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 2, 7, $177)
    %spritemapEntry(0, $1E0, $D8, 0, 0, 2, 7, $167)
    %spritemapEntry(1, $4218, $D8, 0, 0, 2, 7, $16E)
    %spritemapEntry(1, $4208, $D8, 0, 0, 2, 7, $16C)
    %spritemapEntry(1, $43F8, $D8, 0, 0, 2, 7, $16A)
    %spritemapEntry(1, $4218, $E8, 0, 0, 2, 7, $184)
    %spritemapEntry(1, $4208, $E8, 0, 0, 2, 7, $182)
    %spritemapEntry(1, $43F8, $E8, 0, 0, 2, 7, $180)
    %spritemapEntry(1, $4218, $F8, 0, 0, 2, 7, $18E)
    %spritemapEntry(1, $4208, $F8, 0, 0, 2, 7, $18C)
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 7, $18A)
    %spritemapEntry(1, $43E8, $F8, 0, 0, 2, 7, $188)
    %spritemapEntry(1, $43D8, $F8, 0, 0, 2, 7, $186)
    %spritemapEntry(0, $20, $10, 0, 0, 2, 7, $14A)
    %spritemapEntry(0, $18, $10, 0, 0, 2, 7, $149)
    %spritemapEntry(0, $10, $10, 0, 0, 2, 7, $148)
    %spritemapEntry(0, $08, $10, 0, 0, 2, 7, $147)
    %spritemapEntry(0, $00, $10, 0, 0, 2, 7, $146)
    %spritemapEntry(0, $1F8, $10, 0, 0, 2, 7, $145)
    %spritemapEntry(0, $1F0, $10, 0, 0, 2, 7, $144)
    %spritemapEntry(0, $1E8, $10, 0, 0, 2, 7, $143)
    %spritemapEntry(0, $1E0, $10, 0, 0, 2, 7, $142)
    %spritemapEntry(0, $1D8, $10, 0, 0, 2, 7, $141)
    %spritemapEntry(0, $1D0, $10, 0, 0, 2, 7, $140)
    %spritemapEntry(0, $20, $08, 0, 0, 2, 7, $13A)
    %spritemapEntry(0, $18, $08, 0, 0, 2, 7, $139)
    %spritemapEntry(0, $10, $08, 0, 0, 2, 7, $138)
    %spritemapEntry(0, $08, $08, 0, 0, 2, 7, $137)
    %spritemapEntry(0, $00, $08, 0, 0, 2, 7, $136)
    %spritemapEntry(0, $1F8, $08, 0, 0, 2, 7, $135)
    %spritemapEntry(0, $1F0, $08, 0, 0, 2, 7, $134)
    %spritemapEntry(0, $1E8, $08, 0, 0, 2, 7, $133)
    %spritemapEntry(0, $1E0, $08, 0, 0, 2, 7, $132)
    %spritemapEntry(0, $1D8, $08, 0, 0, 2, 7, $131)
    %spritemapEntry(0, $1D0, $08, 0, 0, 2, 7, $130)

Spritemap_Crocomire_25:
    dw $0037
    %spritemapEntry(0, $1D8, $D8, 0, 0, 2, 7, $177)
    %spritemapEntry(0, $1E8, $E8, 0, 0, 2, 7, $166)
    %spritemapEntry(0, $1F0, $E8, 0, 0, 2, 7, $165)
    %spritemapEntry(0, $00, $D0, 0, 0, 2, 7, $176)
    %spritemapEntry(0, $1F8, $D0, 0, 0, 2, 7, $175)
    %spritemapEntry(0, $1F0, $D0, 0, 0, 2, 7, $174)
    %spritemapEntry(0, $1F0, $C8, 0, 0, 2, 7, $164)
    %spritemapEntry(1, $43E0, $C8, 0, 0, 2, 7, $162)
    %spritemapEntry(1, $43D0, $C8, 0, 0, 2, 7, $160)
    %spritemapEntry(1, $43E8, $D8, 0, 0, 2, 7, $168)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 2, 7, $177)
    %spritemapEntry(0, $1E0, $D8, 0, 0, 2, 7, $167)
    %spritemapEntry(1, $4218, $D8, 0, 0, 2, 7, $16E)
    %spritemapEntry(1, $4208, $D8, 0, 0, 2, 7, $16C)
    %spritemapEntry(1, $43F8, $D8, 0, 0, 2, 7, $16A)
    %spritemapEntry(1, $4218, $E8, 0, 0, 2, 7, $184)
    %spritemapEntry(1, $4208, $E8, 0, 0, 2, 7, $182)
    %spritemapEntry(1, $43F8, $E8, 0, 0, 2, 7, $180)
    %spritemapEntry(1, $4218, $F8, 0, 0, 2, 7, $18E)
    %spritemapEntry(1, $4208, $F8, 0, 0, 2, 7, $18C)
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 7, $18A)
    %spritemapEntry(1, $43E8, $F8, 0, 0, 2, 7, $188)
    %spritemapEntry(1, $43D8, $F8, 0, 0, 2, 7, $186)
    %spritemapEntry(0, $18, $18, 0, 0, 2, 7, $159)
    %spritemapEntry(0, $10, $18, 0, 0, 2, 7, $158)
    %spritemapEntry(0, $08, $18, 0, 0, 2, 7, $157)
    %spritemapEntry(0, $00, $18, 0, 0, 2, 7, $156)
    %spritemapEntry(0, $1F8, $18, 0, 0, 2, 7, $155)
    %spritemapEntry(0, $1F0, $18, 0, 0, 2, 7, $154)
    %spritemapEntry(0, $1E8, $18, 0, 0, 2, 7, $153)
    %spritemapEntry(0, $1E0, $18, 0, 0, 2, 7, $152)
    %spritemapEntry(0, $1D8, $18, 0, 0, 2, 7, $151)
    %spritemapEntry(0, $1D0, $18, 0, 0, 2, 7, $150)
    %spritemapEntry(0, $20, $10, 0, 0, 2, 7, $14A)
    %spritemapEntry(0, $18, $10, 0, 0, 2, 7, $149)
    %spritemapEntry(0, $10, $10, 0, 0, 2, 7, $148)
    %spritemapEntry(0, $08, $10, 0, 0, 2, 7, $147)
    %spritemapEntry(0, $00, $10, 0, 0, 2, 7, $146)
    %spritemapEntry(0, $1F8, $10, 0, 0, 2, 7, $145)
    %spritemapEntry(0, $1F0, $10, 0, 0, 2, 7, $144)
    %spritemapEntry(0, $1E8, $10, 0, 0, 2, 7, $143)
    %spritemapEntry(0, $1E0, $10, 0, 0, 2, 7, $142)
    %spritemapEntry(0, $1D8, $10, 0, 0, 2, 7, $141)
    %spritemapEntry(0, $1D0, $10, 0, 0, 2, 7, $140)
    %spritemapEntry(0, $20, $08, 0, 0, 2, 7, $13A)
    %spritemapEntry(0, $18, $08, 0, 0, 2, 7, $139)
    %spritemapEntry(0, $10, $08, 0, 0, 2, 7, $138)
    %spritemapEntry(0, $08, $08, 0, 0, 2, 7, $137)
    %spritemapEntry(0, $00, $08, 0, 0, 2, 7, $136)
    %spritemapEntry(0, $1F8, $08, 0, 0, 2, 7, $135)
    %spritemapEntry(0, $1F0, $08, 0, 0, 2, 7, $134)
    %spritemapEntry(0, $1E8, $08, 0, 0, 2, 7, $133)
    %spritemapEntry(0, $1E0, $08, 0, 0, 2, 7, $132)
    %spritemapEntry(0, $1D8, $08, 0, 0, 2, 7, $131)
    %spritemapEntry(0, $1D0, $08, 0, 0, 2, 7, $130)

Spritemap_Crocomire_26:
    dw $0018
    %spritemapEntry(0, $10, $F0, 0, 0, 2, 7, $1ED)
    %spritemapEntry(0, $08, $F0, 0, 0, 2, 7, $1EC)
    %spritemapEntry(0, $20, $F0, 0, 0, 2, 7, $1FD)
    %spritemapEntry(0, $18, $F0, 0, 0, 2, 7, $1FC)
    %spritemapEntry(1, $4218, $F8, 0, 0, 2, 7, $18E)
    %spritemapEntry(1, $4208, $F8, 0, 0, 2, 7, $18C)
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 7, $18A)
    %spritemapEntry(0, $01, $D0, 0, 0, 2, 7, $1B6)
    %spritemapEntry(0, $1D9, $00, 0, 0, 2, 7, $1A6)
    %spritemapEntry(0, $1E1, $00, 0, 0, 2, 7, $1AF)
    %spritemapEntry(0, $1E9, $00, 0, 0, 2, 7, $1BF)
    %spritemapEntry(1, $4211, $F8, 0, 0, 2, 7, $1CA)
    %spritemapEntry(1, $4201, $F8, 0, 0, 2, 7, $1C8)
    %spritemapEntry(1, $43F1, $F8, 0, 0, 2, 7, $1C6)
    %spritemapEntry(1, $4211, $E8, 0, 0, 2, 7, $1C4)
    %spritemapEntry(1, $4201, $E8, 0, 0, 2, 7, $1C2)
    %spritemapEntry(1, $43F1, $E8, 0, 0, 2, 7, $1C0)
    %spritemapEntry(1, $4211, $D8, 0, 0, 2, 7, $1AD)
    %spritemapEntry(1, $4201, $D8, 0, 0, 2, 7, $1AB)
    %spritemapEntry(1, $43F1, $D8, 0, 0, 2, 7, $1A9)
    %spritemapEntry(1, $43E1, $D8, 0, 0, 2, 7, $1A7)
    %spritemapEntry(1, $43F1, $C8, 0, 0, 2, 7, $1A4)
    %spritemapEntry(1, $43E1, $C8, 0, 0, 2, 7, $1A2)
    %spritemapEntry(1, $43D1, $C8, 0, 0, 2, 7, $1A0)

Spritemap_Crocomire_27:
    dw $0023
    %spritemapEntry(0, $10, $F0, 0, 0, 2, 7, $1ED)
    %spritemapEntry(0, $08, $F0, 0, 0, 2, 7, $1EC)
    %spritemapEntry(0, $20, $F0, 0, 0, 2, 7, $1FD)
    %spritemapEntry(0, $18, $F0, 0, 0, 2, 7, $1FC)
    %spritemapEntry(1, $4218, $F8, 0, 0, 2, 7, $18E)
    %spritemapEntry(1, $4208, $F8, 0, 0, 2, 7, $18C)
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 7, $18A)
    %spritemapEntry(0, $01, $D0, 0, 0, 2, 7, $1B6)
    %spritemapEntry(0, $1D9, $00, 0, 0, 2, 7, $1A6)
    %spritemapEntry(0, $1E1, $00, 0, 0, 2, 7, $1AF)
    %spritemapEntry(0, $1E9, $00, 0, 0, 2, 7, $1BF)
    %spritemapEntry(1, $4211, $F8, 0, 0, 2, 7, $1CA)
    %spritemapEntry(1, $4201, $F8, 0, 0, 2, 7, $1C8)
    %spritemapEntry(1, $43F1, $F8, 0, 0, 2, 7, $1C6)
    %spritemapEntry(1, $4211, $E8, 0, 0, 2, 7, $1C4)
    %spritemapEntry(1, $4201, $E8, 0, 0, 2, 7, $1C2)
    %spritemapEntry(1, $43F1, $E8, 0, 0, 2, 7, $1C0)
    %spritemapEntry(1, $4211, $D8, 0, 0, 2, 7, $1AD)
    %spritemapEntry(1, $4201, $D8, 0, 0, 2, 7, $1AB)
    %spritemapEntry(1, $43F1, $D8, 0, 0, 2, 7, $1A9)
    %spritemapEntry(1, $43E1, $D8, 0, 0, 2, 7, $1A7)
    %spritemapEntry(1, $43F1, $C8, 0, 0, 2, 7, $1A4)
    %spritemapEntry(1, $43E1, $C8, 0, 0, 2, 7, $1A2)
    %spritemapEntry(1, $43D1, $C8, 0, 0, 2, 7, $1A0)
    %spritemapEntry(0, $20, $08, 0, 0, 2, 7, $13A)
    %spritemapEntry(0, $18, $08, 0, 0, 2, 7, $139)
    %spritemapEntry(0, $10, $08, 0, 0, 2, 7, $138)
    %spritemapEntry(0, $08, $08, 0, 0, 2, 7, $137)
    %spritemapEntry(0, $00, $08, 0, 0, 2, 7, $136)
    %spritemapEntry(0, $1F8, $08, 0, 0, 2, 7, $135)
    %spritemapEntry(0, $1F0, $08, 0, 0, 2, 7, $134)
    %spritemapEntry(0, $1E8, $08, 0, 0, 2, 7, $133)
    %spritemapEntry(0, $1E0, $08, 0, 0, 2, 7, $132)
    %spritemapEntry(0, $1D8, $08, 0, 0, 2, 7, $131)
    %spritemapEntry(0, $1D0, $08, 0, 0, 2, 7, $130)

Spritemap_Crocomire_28:
    dw $002E
    %spritemapEntry(0, $10, $F0, 0, 0, 2, 7, $1ED)
    %spritemapEntry(0, $08, $F0, 0, 0, 2, 7, $1EC)
    %spritemapEntry(0, $20, $F0, 0, 0, 2, 7, $1FD)
    %spritemapEntry(0, $18, $F0, 0, 0, 2, 7, $1FC)
    %spritemapEntry(1, $4218, $F8, 0, 0, 2, 7, $18E)
    %spritemapEntry(1, $4208, $F8, 0, 0, 2, 7, $18C)
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 7, $18A)
    %spritemapEntry(0, $01, $D0, 0, 0, 2, 7, $1B6)
    %spritemapEntry(0, $1D9, $00, 0, 0, 2, 7, $1A6)
    %spritemapEntry(0, $1E1, $00, 0, 0, 2, 7, $1AF)
    %spritemapEntry(0, $1E9, $00, 0, 0, 2, 7, $1BF)
    %spritemapEntry(1, $4211, $F8, 0, 0, 2, 7, $1CA)
    %spritemapEntry(1, $4201, $F8, 0, 0, 2, 7, $1C8)
    %spritemapEntry(1, $43F1, $F8, 0, 0, 2, 7, $1C6)
    %spritemapEntry(1, $4211, $E8, 0, 0, 2, 7, $1C4)
    %spritemapEntry(1, $4201, $E8, 0, 0, 2, 7, $1C2)
    %spritemapEntry(1, $43F1, $E8, 0, 0, 2, 7, $1C0)
    %spritemapEntry(1, $4211, $D8, 0, 0, 2, 7, $1AD)
    %spritemapEntry(1, $4201, $D8, 0, 0, 2, 7, $1AB)
    %spritemapEntry(1, $43F1, $D8, 0, 0, 2, 7, $1A9)
    %spritemapEntry(1, $43E1, $D8, 0, 0, 2, 7, $1A7)
    %spritemapEntry(1, $43F1, $C8, 0, 0, 2, 7, $1A4)
    %spritemapEntry(1, $43E1, $C8, 0, 0, 2, 7, $1A2)
    %spritemapEntry(1, $43D1, $C8, 0, 0, 2, 7, $1A0)
    %spritemapEntry(0, $20, $10, 0, 0, 2, 7, $14A)
    %spritemapEntry(0, $18, $10, 0, 0, 2, 7, $149)
    %spritemapEntry(0, $10, $10, 0, 0, 2, 7, $148)
    %spritemapEntry(0, $08, $10, 0, 0, 2, 7, $147)
    %spritemapEntry(0, $00, $10, 0, 0, 2, 7, $146)
    %spritemapEntry(0, $1F8, $10, 0, 0, 2, 7, $145)
    %spritemapEntry(0, $1F0, $10, 0, 0, 2, 7, $144)
    %spritemapEntry(0, $1E8, $10, 0, 0, 2, 7, $143)
    %spritemapEntry(0, $1E0, $10, 0, 0, 2, 7, $142)
    %spritemapEntry(0, $1D8, $10, 0, 0, 2, 7, $141)
    %spritemapEntry(0, $1D0, $10, 0, 0, 2, 7, $140)
    %spritemapEntry(0, $20, $08, 0, 0, 2, 7, $13A)
    %spritemapEntry(0, $18, $08, 0, 0, 2, 7, $139)
    %spritemapEntry(0, $10, $08, 0, 0, 2, 7, $138)
    %spritemapEntry(0, $08, $08, 0, 0, 2, 7, $137)
    %spritemapEntry(0, $00, $08, 0, 0, 2, 7, $136)
    %spritemapEntry(0, $1F8, $08, 0, 0, 2, 7, $135)
    %spritemapEntry(0, $1F0, $08, 0, 0, 2, 7, $134)
    %spritemapEntry(0, $1E8, $08, 0, 0, 2, 7, $133)
    %spritemapEntry(0, $1E0, $08, 0, 0, 2, 7, $132)
    %spritemapEntry(0, $1D8, $08, 0, 0, 2, 7, $131)
    %spritemapEntry(0, $1D0, $08, 0, 0, 2, 7, $130)

Spritemap_Crocomire_29:
    dw $0038
    %spritemapEntry(0, $10, $F0, 0, 0, 2, 7, $1ED)
    %spritemapEntry(0, $08, $F0, 0, 0, 2, 7, $1EC)
    %spritemapEntry(0, $20, $F0, 0, 0, 2, 7, $1FD)
    %spritemapEntry(0, $18, $F0, 0, 0, 2, 7, $1FC)
    %spritemapEntry(1, $4218, $F8, 0, 0, 2, 7, $18E)
    %spritemapEntry(1, $4208, $F8, 0, 0, 2, 7, $18C)
    %spritemapEntry(1, $43F8, $F8, 0, 0, 2, 7, $18A)
    %spritemapEntry(0, $01, $D0, 0, 0, 2, 7, $1B6)
    %spritemapEntry(0, $1D9, $00, 0, 0, 2, 7, $1A6)
    %spritemapEntry(0, $1E1, $00, 0, 0, 2, 7, $1AF)
    %spritemapEntry(0, $1E9, $00, 0, 0, 2, 7, $1BF)
    %spritemapEntry(1, $4211, $F8, 0, 0, 2, 7, $1CA)
    %spritemapEntry(1, $4201, $F8, 0, 0, 2, 7, $1C8)
    %spritemapEntry(1, $43F1, $F8, 0, 0, 2, 7, $1C6)
    %spritemapEntry(1, $4211, $E8, 0, 0, 2, 7, $1C4)
    %spritemapEntry(1, $4201, $E8, 0, 0, 2, 7, $1C2)
    %spritemapEntry(1, $43F1, $E8, 0, 0, 2, 7, $1C0)
    %spritemapEntry(1, $4211, $D8, 0, 0, 2, 7, $1AD)
    %spritemapEntry(1, $4201, $D8, 0, 0, 2, 7, $1AB)
    %spritemapEntry(1, $43F1, $D8, 0, 0, 2, 7, $1A9)
    %spritemapEntry(1, $43E1, $D8, 0, 0, 2, 7, $1A7)
    %spritemapEntry(1, $43F1, $C8, 0, 0, 2, 7, $1A4)
    %spritemapEntry(1, $43E1, $C8, 0, 0, 2, 7, $1A2)
    %spritemapEntry(1, $43D1, $C8, 0, 0, 2, 7, $1A0)
    %spritemapEntry(0, $18, $18, 0, 0, 2, 7, $159)
    %spritemapEntry(0, $10, $18, 0, 0, 2, 7, $158)
    %spritemapEntry(0, $08, $18, 0, 0, 2, 7, $157)
    %spritemapEntry(0, $00, $18, 0, 0, 2, 7, $156)
    %spritemapEntry(0, $1F8, $18, 0, 0, 2, 7, $155)
    %spritemapEntry(0, $1F0, $18, 0, 0, 2, 7, $154)
    %spritemapEntry(0, $1E8, $18, 0, 0, 2, 7, $153)
    %spritemapEntry(0, $1E0, $18, 0, 0, 2, 7, $152)
    %spritemapEntry(0, $1D8, $18, 0, 0, 2, 7, $151)
    %spritemapEntry(0, $1D0, $18, 0, 0, 2, 7, $150)
    %spritemapEntry(0, $20, $10, 0, 0, 2, 7, $14A)
    %spritemapEntry(0, $18, $10, 0, 0, 2, 7, $149)
    %spritemapEntry(0, $10, $10, 0, 0, 2, 7, $148)
    %spritemapEntry(0, $08, $10, 0, 0, 2, 7, $147)
    %spritemapEntry(0, $00, $10, 0, 0, 2, 7, $146)
    %spritemapEntry(0, $1F8, $10, 0, 0, 2, 7, $145)
    %spritemapEntry(0, $1F0, $10, 0, 0, 2, 7, $144)
    %spritemapEntry(0, $1E8, $10, 0, 0, 2, 7, $143)
    %spritemapEntry(0, $1E0, $10, 0, 0, 2, 7, $142)
    %spritemapEntry(0, $1D8, $10, 0, 0, 2, 7, $141)
    %spritemapEntry(0, $1D0, $10, 0, 0, 2, 7, $140)
    %spritemapEntry(0, $20, $08, 0, 0, 2, 7, $13A)
    %spritemapEntry(0, $18, $08, 0, 0, 2, 7, $139)
    %spritemapEntry(0, $10, $08, 0, 0, 2, 7, $138)
    %spritemapEntry(0, $08, $08, 0, 0, 2, 7, $137)
    %spritemapEntry(0, $00, $08, 0, 0, 2, 7, $136)
    %spritemapEntry(0, $1F8, $08, 0, 0, 2, 7, $135)
    %spritemapEntry(0, $1F0, $08, 0, 0, 2, 7, $134)
    %spritemapEntry(0, $1E8, $08, 0, 0, 2, 7, $133)
    %spritemapEntry(0, $1E0, $08, 0, 0, 2, 7, $132)
    %spritemapEntry(0, $1D8, $08, 0, 0, 2, 7, $131)
    %spritemapEntry(0, $1D0, $08, 0, 0, 2, 7, $130)


;;; $E14A: Instruction list - Crocomire - skeleton - falling ;;;
InstList_CrocomireCorpse_Skeleton_Falling:
    dw $000A,ExtendedSpritemap_CrocomireCorpse_0
    dw $000A,ExtendedSpritemap_CrocomireCorpse_1
    dw $000A,ExtendedSpritemap_CrocomireCorpse_2
    dw Instruction_Common_Sleep


;;; $E158: Instruction list - Crocomire - skeleton - falls apart ;;;
InstList_CrocomireCorpse_Skeleton_FallsApart_0:
    dw $000A,ExtendedSpritemap_CrocomireCorpse_3
    dw Instruction_Crocomire_SpawnBigDustCloudProjectile_Negative20
    dw $0005,ExtendedSpritemap_CrocomireCorpse_4
    dw Instruction_Crocomire_SpawnBigDustCloudProjectile_0
    dw $0005,ExtendedSpritemap_CrocomireCorpse_4
    dw Instruction_Crocomire_SpawnBigDustCloudProjectile_Negative10
    dw $0005,ExtendedSpritemap_CrocomireCorpse_5
    dw Instruction_Crocomire_SpawnBigDustCloudProjectile_10
    dw $0005,ExtendedSpritemap_CrocomireCorpse_5
    dw $000A,ExtendedSpritemap_CrocomireCorpse_6
    dw $0020,ExtendedSpritemap_CrocomireCorpse_7
    dw $0010,ExtendedSpritemap_CrocomireCorpse_8
    dw Instruction_Crocomire_QueueSkeletonCollapseSFX
    dw $000A,ExtendedSpritemap_CrocomireCorpse_9
    dw $0009,ExtendedSpritemap_CrocomireCorpse_A
    dw $0009,ExtendedSpritemap_CrocomireCorpse_B
    dw Instruction_Crocomire_SpawnBigDustCloudProjectile_0_dup
    dw $0008,ExtendedSpritemap_CrocomireCorpse_C
    dw Instruction_Crocomire_SpawnBigDustCloudProjectile_8
    dw $0008,ExtendedSpritemap_CrocomireCorpse_D
    dw Instruction_Crocomire_SpawnBigDustCloudProjectile_10_dup
    dw $0007,ExtendedSpritemap_CrocomireCorpse_E
    dw Instruction_Crocomire_SpawnBigDustCloudProjectile_18
    dw $0007,ExtendedSpritemap_CrocomireCorpse_F
    dw Instruction_Crocomire_SpawnBigDustCloudProjectile_20
    dw $0006,ExtendedSpritemap_CrocomireCorpse_10
    dw Instruction_Crocomire_SpawnBigDustCloudProjectile_28
    dw $0006,ExtendedSpritemap_CrocomireCorpse_11
    dw Instruction_Crocomire_SpawnBigDustCloudProjectile_30
    dw $0006,ExtendedSpritemap_CrocomireCorpse_12
    dw Instruction_Crocomire_SpawnBigDustCloudProjectile_38
    dw $0005,ExtendedSpritemap_CrocomireCorpse_13
    dw Instruction_Crocomire_SpawnBigDustCloudProjectile_40
    dw Instruction_Crocomire_QueueBigExplosionSFX
    dw $0005,ExtendedSpritemap_CrocomireCorpse_14

InstList_CrocomireCorpse_Skeleton_1:
    dw $7FFF,ExtendedSpritemap_CrocomireCorpse_15
    dw Instruction_Common_Sleep


;;; $E1CC: Instruction list - Crocomire - dead ;;;
InstList_CrocomireCorpse_Skeleton_Dead:
    dw $7FFF,ExtendedSpritemap_CrocomireCorpse_16
    dw Instruction_Common_Sleep


;;; $E1D2: Instruction list - Crocomire - skeleton - flowing down the river ;;;
InstList_CrocomireCorpse_Skeleton_FlowingDownTheRiver:
    dw $0004,ExtendedSpritemap_CrocomireCorpse_17
    dw $0004,ExtendedSpritemap_CrocomireCorpse_18
    dw $0004,ExtendedSpritemap_CrocomireCorpse_19
    dw $0004,ExtendedSpritemap_CrocomireCorpse_1A
    dw $0004,ExtendedSpritemap_CrocomireCorpse_1B
    dw $0004,ExtendedSpritemap_CrocomireCorpse_1C
    dw $0004,ExtendedSpritemap_CrocomireCorpse_1D
    dw $0004,ExtendedSpritemap_CrocomireCorpse_1E
    dw $0004,ExtendedSpritemap_CrocomireCorpse_1F
    dw $0014,ExtendedSpritemap_CrocomireCorpse_20
    dw Instruction_Common_GotoY
    dw InstList_CrocomireCorpse_Skeleton_FlowingDownTheRiver


;;; $E1FE: Crocomire corpse extended spritemaps ;;;
ExtendedSpritemap_CrocomireCorpse_0:
    dw $0005
    dw $FFF0,$0007
    dw Spritemap_CrocomireCorpse_14
    dw Hitbox_CrocomireCorspe_Empty
    dw $FFFC,$FFD1
    dw Spritemap_CrocomireCorpse_0
    dw Hitbox_CrocomireCorspe
    dw $FFE7,$FFF8
    dw Spritemap_CrocomireCorpse_3
    dw Hitbox_CrocomireCorspe_Empty
    dw $FFFF,$0005
    dw Spritemap_CrocomireCorpse_1
    dw Hitbox_CrocomireCorspe_Empty
    dw $FFE4,$0014
    dw Spritemap_CrocomireCorpse_2
    dw Hitbox_CrocomireCorspe_Empty

ExtendedSpritemap_CrocomireCorpse_1:
    dw $0005
    dw $FFF0,$0004
    dw Spritemap_CrocomireCorpse_15
    dw Hitbox_CrocomireCorspe_Empty
    dw $FFFD,$FFCF
    dw Spritemap_CrocomireCorpse_0
    dw Hitbox_CrocomireCorspe
    dw $FFE7,$FFF8
    dw Spritemap_CrocomireCorpse_3
    dw Hitbox_CrocomireCorspe_Empty
    dw $FFFF,$0003
    dw Spritemap_CrocomireCorpse_1
    dw Hitbox_CrocomireCorspe_Empty
    dw $FFE2,$0014
    dw Spritemap_CrocomireCorpse_2
    dw Hitbox_CrocomireCorspe_Empty

ExtendedSpritemap_CrocomireCorpse_2:
    dw $0005
    dw $FFF5,$FFFF
    dw Spritemap_CrocomireCorpse_12
    dw Hitbox_CrocomireCorspe_Empty
    dw $FFFF,$FFCE
    dw Spritemap_CrocomireCorpse_0
    dw Hitbox_CrocomireCorspe
    dw $FFE7,$FFF6
    dw Spritemap_CrocomireCorpse_3
    dw Hitbox_CrocomireCorspe_Empty
    dw $FFFF,$0002
    dw Spritemap_CrocomireCorpse_1
    dw Hitbox_CrocomireCorspe_Empty
    dw $FFE1,$0014
    dw Spritemap_CrocomireCorpse_2
    dw Hitbox_CrocomireCorspe_Empty

ExtendedSpritemap_CrocomireCorpse_3:
    dw $0005
    dw $FFF0,$0003
    dw Spritemap_CrocomireCorpse_13
    dw Hitbox_CrocomireCorspe_Empty
    dw $0000,$FFCD
    dw Spritemap_CrocomireCorpse_0
    dw Hitbox_CrocomireCorspe
    dw $FFE7,$FFF8
    dw Spritemap_CrocomireCorpse_3
    dw Hitbox_CrocomireCorspe_Empty
    dw $FFFF,$0001
    dw Spritemap_CrocomireCorpse_1
    dw Hitbox_CrocomireCorspe_Empty
    dw $FFE0,$0014
    dw Spritemap_CrocomireCorpse_2
    dw Hitbox_CrocomireCorspe_Empty

ExtendedSpritemap_CrocomireCorpse_4:
    dw $0005
    dw $FFF4,$0007
    dw Spritemap_CrocomireCorpse_10
    dw Hitbox_CrocomireCorspe_Empty
    dw $0002,$FFD0
    dw Spritemap_CrocomireCorpse_0
    dw Hitbox_CrocomireCorspe
    dw $FFE7,$FFFB
    dw Spritemap_CrocomireCorpse_3
    dw Hitbox_CrocomireCorspe_Empty
    dw $FFFF,$0004
    dw Spritemap_CrocomireCorpse_1
    dw Hitbox_CrocomireCorspe_Empty
    dw $FFDF,$0014
    dw Spritemap_CrocomireCorpse_2
    dw Hitbox_CrocomireCorspe_Empty

ExtendedSpritemap_CrocomireCorpse_5:
    dw $0005
    dw $FFF4,$0006
    dw Spritemap_CrocomireCorpse_10
    dw Hitbox_CrocomireCorspe_Empty
    dw $0002,$FFD4
    dw Spritemap_CrocomireCorpse_0
    dw Hitbox_CrocomireCorspe
    dw $FFE7,$FFFB
    dw Spritemap_CrocomireCorpse_3
    dw Hitbox_CrocomireCorspe_Empty
    dw $FFFF,$0006
    dw Spritemap_CrocomireCorpse_1
    dw Hitbox_CrocomireCorspe_Empty
    dw $FFDE,$0014
    dw Spritemap_CrocomireCorpse_2
    dw Hitbox_CrocomireCorspe_Empty

ExtendedSpritemap_CrocomireCorpse_6:
    dw $0005
    dw $FFF5,$0004
    dw Spritemap_CrocomireCorpse_10
    dw Hitbox_CrocomireCorspe_Empty
    dw $0003,$FFD1
    dw Spritemap_CrocomireCorpse_0
    dw Hitbox_CrocomireCorspe
    dw $FFE7,$FFFB
    dw Spritemap_CrocomireCorpse_3
    dw Hitbox_CrocomireCorspe_Empty
    dw $FFFF,$0004
    dw Spritemap_CrocomireCorpse_1
    dw Hitbox_CrocomireCorspe_Empty
    dw $FFDE,$0014
    dw Spritemap_CrocomireCorpse_2
    dw Hitbox_CrocomireCorspe_Empty

ExtendedSpritemap_CrocomireCorpse_7:
    dw $0005
    dw $FFF4,$0005
    dw Spritemap_CrocomireCorpse_10
    dw Hitbox_CrocomireCorspe_Empty
    dw $0002,$FFD0
    dw Spritemap_CrocomireCorpse_0
    dw Hitbox_CrocomireCorspe
    dw $FFE7,$FFFB
    dw Spritemap_CrocomireCorpse_3
    dw Hitbox_CrocomireCorspe_Empty
    dw $FFFF,$0003
    dw Spritemap_CrocomireCorpse_1
    dw Hitbox_CrocomireCorspe_Empty
    dw $FFDD,$0014
    dw Spritemap_CrocomireCorpse_2
    dw Hitbox_CrocomireCorspe_Empty

ExtendedSpritemap_CrocomireCorpse_8:
    dw $0005
    dw $FFF0,$000E
    dw Spritemap_CrocomireCorpse_11
    dw Hitbox_CrocomireCorspe_Empty
    dw $0009,$FFD1
    dw Spritemap_CrocomireCorpse_0
    dw Hitbox_CrocomireCorspe
    dw $FFE7,$0000
    dw Spritemap_CrocomireCorpse_3
    dw Hitbox_CrocomireCorspe_Empty
    dw $0001,$0005
    dw Spritemap_CrocomireCorpse_1
    dw Hitbox_CrocomireCorspe_Empty
    dw $FFDA,$0014
    dw Spritemap_CrocomireCorpse_2
    dw Hitbox_CrocomireCorspe_Empty

ExtendedSpritemap_CrocomireCorpse_9:
    dw $0005
    dw $FFEB,$001A
    dw Spritemap_CrocomireCorpse_13
    dw Hitbox_CrocomireCorspe_Empty
    dw $0010,$FFD9
    dw Spritemap_CrocomireCorpse_0
    dw Hitbox_CrocomireCorspe
    dw $FFE7,$0007
    dw Spritemap_CrocomireCorpse_3
    dw Hitbox_CrocomireCorspe_Empty
    dw $0005,$000B
    dw Spritemap_CrocomireCorpse_1
    dw Hitbox_CrocomireCorspe_Empty
    dw $FFDA,$0014
    dw Spritemap_CrocomireCorpse_2
    dw Hitbox_CrocomireCorspe_Empty

ExtendedSpritemap_CrocomireCorpse_A:
    dw $0005
    dw $FFEA,$0023
    dw Spritemap_CrocomireCorpse_13
    dw Hitbox_CrocomireCorspe_Empty
    dw $0015,$FFDD
    dw Spritemap_CrocomireCorpse_0
    dw Hitbox_CrocomireCorspe
    dw $FFE6,$0013
    dw Spritemap_CrocomireCorpse_3
    dw Hitbox_CrocomireCorspe_Empty
    dw $0007,$000F
    dw Spritemap_CrocomireCorpse_1
    dw Hitbox_CrocomireCorspe_Empty
    dw $FFDA,$0014
    dw Spritemap_CrocomireCorpse_2
    dw Hitbox_CrocomireCorspe_Empty

ExtendedSpritemap_CrocomireCorpse_B:
    dw $0005
    dw $FFEA,$002F
    dw Spritemap_CrocomireCorpse_13
    dw Hitbox_CrocomireCorspe_Empty
    dw $001F,$FFEC
    dw Spritemap_CrocomireCorpse_0
    dw Hitbox_CrocomireCorspe
    dw $FFE7,$001E
    dw Spritemap_CrocomireCorpse_3
    dw Hitbox_CrocomireCorspe_Empty
    dw $000A,$0014
    dw Spritemap_CrocomireCorpse_1
    dw Hitbox_CrocomireCorspe_Empty
    dw $FFDA,$0014
    dw Spritemap_CrocomireCorpse_2
    dw Hitbox_CrocomireCorspe_Empty

ExtendedSpritemap_CrocomireCorpse_C:
    dw $0005
    dw $FFEA,$0036
    dw Spritemap_CrocomireCorpse_13
    dw Hitbox_CrocomireCorspe_Empty
    dw $0024,$FFF2
    dw Spritemap_CrocomireCorpse_0
    dw Hitbox_CrocomireCorspe
    dw $FFE7,$0023
    dw Spritemap_CrocomireCorpse_3
    dw Hitbox_CrocomireCorspe_Empty
    dw $000A,$0019
    dw Spritemap_CrocomireCorpse_1
    dw Hitbox_CrocomireCorspe_Empty
    dw $FFDA,$0014
    dw Spritemap_CrocomireCorpse_2
    dw Hitbox_CrocomireCorspe_Empty

ExtendedSpritemap_CrocomireCorpse_D:
    dw $0009
    dw $002E,$FFFC
    dw Spritemap_CrocomireCorpse_0
    dw Hitbox_CrocomireCorspe
    dw $FFE7,$002B
    dw Spritemap_CrocomireCorpse_3
    dw Hitbox_CrocomireCorspe_Empty
    dw $000C,$001E
    dw Spritemap_CrocomireCorpse_1
    dw Hitbox_CrocomireCorspe_Empty
    dw $0001,$0024
    dw Spritemap_CrocomireCorpse_A
    dw Hitbox_CrocomireCorspe_Empty
    dw $FFEB,$0020
    dw Spritemap_CrocomireCorpse_B
    dw Hitbox_CrocomireCorspe_Empty
    dw $FFD8,$0022
    dw Spritemap_CrocomireCorpse_C
    dw Hitbox_CrocomireCorspe_Empty
    dw $FFC6,$001E
    dw Spritemap_CrocomireCorpse_D
    dw Hitbox_CrocomireCorspe_Empty
    dw $FFB6,$0029
    dw Spritemap_CrocomireCorpse_E
    dw Hitbox_CrocomireCorspe_Empty
    dw $FFA3,$0029
    dw Spritemap_CrocomireCorpse_F
    dw Hitbox_CrocomireCorspe_Empty

ExtendedSpritemap_CrocomireCorpse_E:
    dw $000D
    dw $0037,$0007
    dw Spritemap_CrocomireCorpse_0
    dw Hitbox_CrocomireCorspe
    dw $0029,$0027
    dw Spritemap_CrocomireCorpse_4
    dw Hitbox_CrocomireCorspe_Empty
    dw $FFF9,$0014
    dw Spritemap_CrocomireCorpse_7
    dw Hitbox_CrocomireCorspe_Empty
    dw $0019,$002C
    dw Spritemap_CrocomireCorpse_5
    dw Hitbox_CrocomireCorspe_Empty
    dw $0019,$001C
    dw Spritemap_CrocomireCorpse_5
    dw Hitbox_CrocomireCorspe_Empty
    dw $FFF8,$0025
    dw Spritemap_CrocomireCorpse_8
    dw Hitbox_CrocomireCorspe_Empty
    dw $0008,$0019
    dw Spritemap_CrocomireCorpse_6
    dw Hitbox_CrocomireCorspe_Empty
    dw $0009,$002A
    dw Spritemap_CrocomireCorpse_6
    dw Hitbox_CrocomireCorspe_Empty
    dw $FFF7,$0031
    dw Spritemap_CrocomireCorpse_9
    dw Hitbox_CrocomireCorspe_Empty
    dw $FFE8,$0024
    dw Spritemap_CrocomireCorpse_B
    dw Hitbox_CrocomireCorspe_Empty
    dw $FFD3,$0028
    dw Spritemap_CrocomireCorpse_C
    dw Hitbox_CrocomireCorspe_Empty
    dw $FFC3,$001C
    dw Spritemap_CrocomireCorpse_D
    dw Hitbox_CrocomireCorspe_Empty
    dw $FFB4,$002B
    dw Spritemap_CrocomireCorpse_E
    dw Hitbox_CrocomireCorspe_Empty

ExtendedSpritemap_CrocomireCorpse_F:
    dw $000D
    dw $003C,$000C
    dw Spritemap_CrocomireCorpse_0
    dw Hitbox_CrocomireCorspe
    dw $0029,$002C
    dw Spritemap_CrocomireCorpse_4
    dw Hitbox_CrocomireCorspe_Empty
    dw $FFF9,$0019
    dw Spritemap_CrocomireCorpse_7
    dw Hitbox_CrocomireCorspe_Empty
    dw $001C,$0030
    dw Spritemap_CrocomireCorpse_5
    dw Hitbox_CrocomireCorspe_Empty
    dw $001A,$0020
    dw Spritemap_CrocomireCorpse_5
    dw Hitbox_CrocomireCorspe_Empty
    dw $FFFD,$0025
    dw Spritemap_CrocomireCorpse_8
    dw Hitbox_CrocomireCorspe_Empty
    dw $0009,$001E
    dw Spritemap_CrocomireCorpse_6
    dw Hitbox_CrocomireCorspe_Empty
    dw $000D,$002D
    dw Spritemap_CrocomireCorpse_6
    dw Hitbox_CrocomireCorspe_Empty
    dw $FFF8,$0033
    dw Spritemap_CrocomireCorpse_9
    dw Hitbox_CrocomireCorspe_Empty
    dw $FFE9,$002A
    dw Spritemap_CrocomireCorpse_B
    dw Hitbox_CrocomireCorspe_Empty
    dw $FFD0,$002A
    dw Spritemap_CrocomireCorpse_C
    dw Hitbox_CrocomireCorspe_Empty
    dw $FFC2,$0021
    dw Spritemap_CrocomireCorpse_D
    dw Hitbox_CrocomireCorspe_Empty
    dw $FFAE,$002F
    dw Spritemap_CrocomireCorpse_E
    dw Hitbox_CrocomireCorspe_Empty

ExtendedSpritemap_CrocomireCorpse_10:
    dw $000D
    dw $003E,$0011
    dw Spritemap_CrocomireCorpse_0
    dw Hitbox_CrocomireCorspe
    dw $0029,$0031
    dw Spritemap_CrocomireCorpse_4
    dw Hitbox_CrocomireCorspe_Empty
    dw $FFF8,$0020
    dw Spritemap_CrocomireCorpse_7
    dw Hitbox_CrocomireCorspe_Empty
    dw $001C,$0030
    dw Spritemap_CrocomireCorpse_5
    dw Hitbox_CrocomireCorspe_Empty
    dw $0018,$0025
    dw Spritemap_CrocomireCorpse_5
    dw Hitbox_CrocomireCorspe_Empty
    dw $FFFE,$0029
    dw Spritemap_CrocomireCorpse_8
    dw Hitbox_CrocomireCorspe_Empty
    dw $0009,$0023
    dw Spritemap_CrocomireCorpse_6
    dw Hitbox_CrocomireCorspe_Empty
    dw $000F,$0030
    dw Spritemap_CrocomireCorpse_6
    dw Hitbox_CrocomireCorspe_Empty
    dw $FFF6,$0036
    dw Spritemap_CrocomireCorpse_9
    dw Hitbox_CrocomireCorspe_Empty
    dw $FFE8,$002F
    dw Spritemap_CrocomireCorpse_B
    dw Hitbox_CrocomireCorspe_Empty
    dw $FFCE,$002D
    dw Spritemap_CrocomireCorpse_C
    dw Hitbox_CrocomireCorspe_Empty
    dw $FFC0,$0026
    dw Spritemap_CrocomireCorpse_D
    dw Hitbox_CrocomireCorspe_Empty
    dw $FFAC,$0033
    dw Spritemap_CrocomireCorpse_E
    dw Hitbox_CrocomireCorspe_Empty

ExtendedSpritemap_CrocomireCorpse_11:
    dw $000C
    dw $0040,$0016
    dw Spritemap_CrocomireCorpse_0
    dw Hitbox_CrocomireCorspe
    dw $0029,$0031
    dw Spritemap_CrocomireCorpse_4
    dw Hitbox_CrocomireCorspe_Empty
    dw $FFF7,$0026
    dw Spritemap_CrocomireCorpse_7
    dw Hitbox_CrocomireCorspe_Empty
    dw $001C,$002C
    dw Spritemap_CrocomireCorpse_5
    dw Hitbox_CrocomireCorspe_Empty
    dw $0016,$0028
    dw Spritemap_CrocomireCorpse_5
    dw Hitbox_CrocomireCorspe_Empty
    dw $0002,$002C
    dw Spritemap_CrocomireCorpse_8
    dw Hitbox_CrocomireCorspe_Empty
    dw $000C,$0027
    dw Spritemap_CrocomireCorpse_6
    dw Hitbox_CrocomireCorspe_Empty
    dw $000F,$0030
    dw Spritemap_CrocomireCorpse_6
    dw Hitbox_CrocomireCorspe_Empty
    dw $FFF6,$0036
    dw Spritemap_CrocomireCorpse_9
    dw Hitbox_CrocomireCorspe_Empty
    dw $FFE9,$0034
    dw Spritemap_CrocomireCorpse_B
    dw Hitbox_CrocomireCorspe_Empty
    dw $FFD2,$0032
    dw Spritemap_CrocomireCorpse_C
    dw Hitbox_CrocomireCorspe_Empty
    dw $FFBE,$002C
    dw Spritemap_CrocomireCorpse_D
    dw Hitbox_CrocomireCorspe_Empty

ExtendedSpritemap_CrocomireCorpse_12:
    dw $000A
    dw $0040,$0014
    dw Spritemap_CrocomireCorpse_0
    dw Hitbox_CrocomireCorspe
    dw $0029,$0036
    dw Spritemap_CrocomireCorpse_4
    dw Hitbox_CrocomireCorspe_Empty
    dw $FFF6,$002B
    dw Spritemap_CrocomireCorpse_7
    dw Hitbox_CrocomireCorspe_Empty
    dw $001C,$0031
    dw Spritemap_CrocomireCorpse_5
    dw Hitbox_CrocomireCorspe_Empty
    dw $0016,$002D
    dw Spritemap_CrocomireCorpse_5
    dw Hitbox_CrocomireCorspe_Empty
    dw $0002,$002C
    dw Spritemap_CrocomireCorpse_8
    dw Hitbox_CrocomireCorspe_Empty
    dw $000C,$002C
    dw Spritemap_CrocomireCorpse_6
    dw Hitbox_CrocomireCorspe_Empty
    dw $000F,$0035
    dw Spritemap_CrocomireCorpse_6
    dw Hitbox_CrocomireCorspe_Empty
    dw $FFEA,$0039
    dw Spritemap_CrocomireCorpse_B
    dw Hitbox_CrocomireCorspe_Empty
    dw $FFD2,$0037
    dw Spritemap_CrocomireCorpse_C
    dw Hitbox_CrocomireCorspe_Empty

ExtendedSpritemap_CrocomireCorpse_13:
    dw $0006
    dw $0040,$0013
    dw Spritemap_CrocomireCorpse_0
    dw Hitbox_CrocomireCorspe
    dw $FFF3,$002E
    dw Spritemap_CrocomireCorpse_7
    dw Hitbox_CrocomireCorspe_Empty
    dw $001D,$0033
    dw Spritemap_CrocomireCorpse_5
    dw Hitbox_CrocomireCorspe_Empty
    dw $0014,$002F
    dw Spritemap_CrocomireCorpse_5
    dw Hitbox_CrocomireCorspe_Empty
    dw $0002,$0031
    dw Spritemap_CrocomireCorpse_8
    dw Hitbox_CrocomireCorspe_Empty
    dw $000C,$002C
    dw Spritemap_CrocomireCorpse_6
    dw Hitbox_CrocomireCorspe_Empty

ExtendedSpritemap_CrocomireCorpse_14:
    dw $0003
    dw $0040,$0014
    dw Spritemap_CrocomireCorpse_0
    dw Hitbox_CrocomireCorspe
    dw $FFF3,$0031
    dw Spritemap_CrocomireCorpse_7
    dw Hitbox_CrocomireCorspe_Empty
    dw $000E,$0030
    dw Spritemap_CrocomireCorpse_6
    dw Hitbox_CrocomireCorspe_Empty

ExtendedSpritemap_CrocomireCorpse_15:
    dw $0001
    dw $0040,$0015
    dw Spritemap_CrocomireCorpse_0
    dw Hitbox_CrocomireCorspe

ExtendedSpritemap_CrocomireCorpse_16:
    dw $0001
    dw $0000,$0000
    dw Spritemap_CrocomireCorpse_0
    dw Hitbox_CrocomireCorspe

ExtendedSpritemap_CrocomireCorpse_17:
    dw $0001
    dw $0000,$0000
    dw Spritemap_CrocomireCorpse_16
    dw Hitbox_CrocomireCorspe_Empty

ExtendedSpritemap_CrocomireCorpse_18:
    dw $0001
    dw $0000,$0000
    dw Spritemap_CrocomireCorpse_17
    dw Hitbox_CrocomireCorspe_Empty

ExtendedSpritemap_CrocomireCorpse_19:
    dw $0001
    dw $0000,$0000
    dw Spritemap_CrocomireCorpse_18
    dw Hitbox_CrocomireCorspe_Empty

ExtendedSpritemap_CrocomireCorpse_1A:
    dw $0001
    dw $0000,$0000
    dw Spritemap_CrocomireCorpse_19
    dw Hitbox_CrocomireCorspe_Empty

ExtendedSpritemap_CrocomireCorpse_1B:
    dw $0001
    dw $0000,$0000
    dw Spritemap_CrocomireCorpse_1A
    dw Hitbox_CrocomireCorspe_Empty

ExtendedSpritemap_CrocomireCorpse_1C:
    dw $0001
    dw $0000,$0000
    dw Spritemap_CrocomireCorpse_1B
    dw Hitbox_CrocomireCorspe_Empty

ExtendedSpritemap_CrocomireCorpse_1D:
    dw $0001
    dw $0000,$0000
    dw Spritemap_CrocomireCorpse_1C
    dw Hitbox_CrocomireCorspe_Empty

ExtendedSpritemap_CrocomireCorpse_1E:
    dw $0001
    dw $0000,$0000
    dw Spritemap_CrocomireCorpse_1D
    dw Hitbox_CrocomireCorspe_Empty

ExtendedSpritemap_CrocomireCorpse_1F:
    dw $0001
    dw $0000,$0000
    dw Spritemap_CrocomireCorpse_1E
    dw Hitbox_CrocomireCorspe_Empty

ExtendedSpritemap_CrocomireCorpse_20:
    dw $0001
    dw $0020,$0020
    dw Spritemap_CrocomireCorpse_1F
    dw Hitbox_CrocomireCorspe_Empty


;;; $E720: Crocomire corpse hitboxes ;;;
if !FEATURE_KEEP_UNREFERENCED
UNUSED_Hitbox_CrocomireCorspe_A4E720:
    dw $0001
    dw $FFE6,$FFE2,$0026,$001D
    dw RTL_A4B950
    dw EnemyShot_Crocomire_SpawnShotExplosion
endif ; !FEATURE_KEEP_UNREFERENCED

Hitbox_CrocomireCorspe:
    dw $0002
    dw $FFDA,$FFF0,$0000,$001F
    dw RTL_A4B950
    dw EnemyShot_Crocomire_SpawnShotExplosion
    dw $0000,$FFE3,$001A,$001C
    dw RTL_A4B950
    dw EnemyShot_Crocomire_SpawnShotExplosion

Hitbox_CrocomireCorspe_Empty:
    dw $0000


;;; $E74A: Crocomire corpse spritemaps / extended tilemaps ;;;
if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_CrocomireCorpse_A4E74A:
    dw $0011
    %spritemapEntry(0, $1E4, $18, 0, 0, 2, 7, $1A6)
    %spritemapEntry(0, $1F4, $18, 0, 0, 2, 7, $1BF)
    %spritemapEntry(0, $1EC, $18, 0, 0, 2, 7, $1AF)
    %spritemapEntry(1, $1C, $10, 0, 0, 2, 7, $1CA)
    %spritemapEntry(1, $0C, $10, 0, 0, 2, 7, $1C8)
    %spritemapEntry(1, $1FC, $10, 0, 0, 2, 7, $1C6)
    %spritemapEntry(1, $1C, $00, 0, 0, 2, 7, $1C4)
    %spritemapEntry(1, $0C, $00, 0, 0, 2, 7, $1C2)
    %spritemapEntry(1, $1FC, $00, 0, 0, 2, 7, $1C0)
    %spritemapEntry(0, $0C, $E8, 0, 0, 2, 7, $1B6)
    %spritemapEntry(1, $1C, $F0, 0, 0, 2, 7, $1AD)
    %spritemapEntry(1, $0C, $F0, 0, 0, 2, 7, $1AB)
    %spritemapEntry(1, $1FC, $F0, 0, 0, 2, 7, $1A9)
    %spritemapEntry(1, $1EC, $F0, 0, 0, 2, 7, $1A7)
    %spritemapEntry(1, $1FC, $E0, 0, 0, 2, 7, $1A4)
    %spritemapEntry(1, $1EC, $E0, 0, 0, 2, 7, $1A2)
    %spritemapEntry(1, $1DC, $E0, 0, 0, 2, 7, $1A0)
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_CrocomireCorpse_0:
    dw $0011
    %spritemapEntry(0, $14, $18, 0, 1, 2, 7, $1A6)
    %spritemapEntry(0, $04, $18, 0, 1, 2, 7, $1BF)
    %spritemapEntry(0, $0C, $18, 0, 1, 2, 7, $1AF)
    %spritemapEntry(1, $1D4, $10, 0, 1, 2, 7, $1CA)
    %spritemapEntry(1, $1E4, $10, 0, 1, 2, 7, $1C8)
    %spritemapEntry(1, $1F4, $10, 0, 1, 2, 7, $1C6)
    %spritemapEntry(1, $1D4, $00, 0, 1, 2, 7, $1C4)
    %spritemapEntry(1, $1E4, $00, 0, 1, 2, 7, $1C2)
    %spritemapEntry(1, $1F4, $00, 0, 1, 2, 7, $1C0)
    %spritemapEntry(0, $1EC, $E8, 0, 1, 2, 7, $1B6)
    %spritemapEntry(1, $1D4, $F0, 0, 1, 2, 7, $1AD)
    %spritemapEntry(1, $1E4, $F0, 0, 1, 2, 7, $1AB)
    %spritemapEntry(1, $1F4, $F0, 0, 1, 2, 7, $1A9)
    %spritemapEntry(1, $04, $F0, 0, 1, 2, 7, $1A7)
    %spritemapEntry(1, $1F4, $E0, 0, 1, 2, 7, $1A4)
    %spritemapEntry(1, $04, $E0, 0, 1, 2, 7, $1A2)
    %spritemapEntry(1, $14, $E0, 0, 1, 2, 7, $1A0)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_CrocomireCorpse_A4E7F8:
    dw $000A
    %spritemapEntry(0, $18, $0C, 0, 0, 2, 7, $16B)
    %spritemapEntry(0, $10, $0C, 0, 0, 2, 7, $16A)
    %spritemapEntry(1, $10, $FC, 0, 0, 2, 7, $168)
    %spritemapEntry(1, $10, $EC, 0, 0, 2, 7, $166)
    %spritemapEntry(1, $00, $00, 0, 0, 2, 7, $164)
    %spritemapEntry(1, $1F0, $00, 0, 0, 2, 7, $162)
    %spritemapEntry(1, $00, $F0, 0, 0, 2, 7, $164)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 2, 7, $162)
    %spritemapEntry(1, $1E0, $FC, 0, 0, 2, 7, $180)
    %spritemapEntry(1, $1E0, $EC, 0, 0, 2, 7, $160)
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_CrocomireCorpse_1:
    dw $000A
    %spritemapEntry(0, $1E0, $0C, 0, 1, 2, 7, $16B)
    %spritemapEntry(0, $1E8, $0C, 0, 1, 2, 7, $16A)
    %spritemapEntry(1, $1E0, $FC, 0, 1, 2, 7, $168)
    %spritemapEntry(1, $1E0, $EC, 0, 1, 2, 7, $166)
    %spritemapEntry(1, $1F0, $00, 0, 1, 2, 7, $164)
    %spritemapEntry(1, $00, $00, 0, 1, 2, 7, $162)
    %spritemapEntry(1, $1F0, $F0, 0, 1, 2, 7, $164)
    %spritemapEntry(1, $00, $F0, 0, 1, 2, 7, $162)
    %spritemapEntry(1, $10, $FC, 0, 1, 2, 7, $180)
    %spritemapEntry(1, $10, $EC, 0, 1, 2, 7, $160)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_CrocomireCorpse_A4E860:
    dw $000F
    %spritemapEntry(1, $20, $10, 0, 0, 2, 7, $18E)
    %spritemapEntry(1, $00, $10, 0, 0, 2, 7, $18A)
    %spritemapEntry(1, $10, $10, 0, 0, 2, 7, $18C)
    %spritemapEntry(0, $1F8, $18, 0, 0, 2, 7, $17B)
    %spritemapEntry(0, $1F0, $10, 0, 0, 2, 7, $10F)
    %spritemapEntry(0, $1F8, $10, 0, 0, 2, 7, $11F)
    %spritemapEntry(0, $1E7, $18, 0, 1, 2, 7, $17A)
    %spritemapEntry(0, $1E0, $18, 0, 0, 2, 7, $17A)
    %spritemapEntry(0, $1D0, $10, 0, 0, 2, 7, $188)
    %spritemapEntry(0, $1D8, $10, 0, 0, 2, 7, $189)
    %spritemapEntry(0, $1E0, $10, 0, 0, 2, 7, $198)
    %spritemapEntry(0, $1E8, $10, 0, 0, 2, 7, $199)
    %spritemapEntry(1, $1F0, $00, 0, 0, 2, 7, $186)
    %spritemapEntry(1, $1E0, $00, 0, 0, 2, 7, $184)
    %spritemapEntry(1, $1D0, $00, 0, 0, 2, 7, $182)
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_CrocomireCorpse_2:
    dw $000F
    %spritemapEntry(1, $1D0, $10, 0, 1, 2, 7, $18E)
    %spritemapEntry(1, $1F0, $10, 0, 1, 2, 7, $18A)
    %spritemapEntry(1, $1E0, $10, 0, 1, 2, 7, $18C)
    %spritemapEntry(0, $00, $18, 0, 1, 2, 7, $17B)
    %spritemapEntry(0, $08, $10, 0, 1, 2, 7, $10F)
    %spritemapEntry(0, $00, $10, 0, 1, 2, 7, $11F)
    %spritemapEntry(0, $11, $18, 0, 0, 2, 7, $17A)
    %spritemapEntry(0, $18, $18, 0, 1, 2, 7, $17A)
    %spritemapEntry(0, $28, $10, 0, 1, 2, 7, $188)
    %spritemapEntry(0, $20, $10, 0, 1, 2, 7, $189)
    %spritemapEntry(0, $18, $10, 0, 1, 2, 7, $198)
    %spritemapEntry(0, $10, $10, 0, 1, 2, 7, $199)
    %spritemapEntry(1, $00, $00, 0, 1, 2, 7, $186)
    %spritemapEntry(1, $10, $00, 0, 1, 2, 7, $184)
    %spritemapEntry(1, $20, $00, 0, 1, 2, 7, $182)

Spritemap_CrocomireCorpse_3:
    dw $0002
    %spritemapEntry(1, $00, $F8, 0, 0, 2, 7, $16E)
    %spritemapEntry(1, $1F0, $F8, 0, 0, 2, 7, $16C)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_CrocomireCorpse_A4E906:
    dw $0002
    %spritemapEntry(1, $1F0, $F8, 0, 1, 2, 7, $16E)
    %spritemapEntry(1, $00, $F8, 0, 1, 2, 7, $16C)

UNUSED_Spritemap_CrocomireCorpse_A4E912:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 7, $160)
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_CrocomireCorpse_4:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 7, $180)

Spritemap_CrocomireCorpse_5:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 7, $162)

Spritemap_CrocomireCorpse_6:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 7, $164)

Spritemap_CrocomireCorpse_7:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 7, $166)

Spritemap_CrocomireCorpse_8:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 7, $168)

Spritemap_CrocomireCorpse_9:
    dw $0002
    %spritemapEntry(0, $1F8, $FC, 0, 1, 2, 7, $16B)
    %spritemapEntry(0, $00, $FC, 0, 1, 2, 7, $16A)

Spritemap_CrocomireCorpse_A:
    dw $0003
    %spritemapEntry(0, $00, $04, 0, 1, 2, 7, $188)
    %spritemapEntry(0, $1F8, $04, 0, 1, 2, 7, $189)
    %spritemapEntry(1, $1F8, $F4, 0, 1, 2, 7, $182)

Spritemap_CrocomireCorpse_B:
    dw $0005
    %spritemapEntry(0, $1F9, $08, 0, 0, 2, 7, $17A)
    %spritemapEntry(0, $00, $08, 0, 1, 2, 7, $17A)
    %spritemapEntry(0, $00, $00, 0, 1, 2, 7, $198)
    %spritemapEntry(0, $1F8, $00, 0, 1, 2, 7, $199)
    %spritemapEntry(1, $1F8, $F0, 0, 1, 2, 7, $184)

Spritemap_CrocomireCorpse_C:
    dw $0004
    %spritemapEntry(0, $00, $05, 0, 1, 2, 7, $10F)
    %spritemapEntry(0, $1F8, $0D, 0, 1, 2, 7, $17B)
    %spritemapEntry(0, $1F8, $05, 0, 1, 2, 7, $11F)
    %spritemapEntry(1, $1F8, $F5, 0, 1, 2, 7, $186)

Spritemap_CrocomireCorpse_D:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 7, $18A)

Spritemap_CrocomireCorpse_E:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 7, $18C)

Spritemap_CrocomireCorpse_F:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 7, $18E)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_CrocomireCorpse_A4E99F:
    dw $0009
    %spritemapEntry(1, $1C3, $1A, 0, 0, 2, 0, $E4)
    %spritemapEntry(1, $1B3, $1E, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $00, $07, 0, 0, 2, 0, $108)
    %spritemapEntry(0, $1F0, $FF, 0, 0, 2, 0, $F6)
    %spritemapEntry(1, $1F0, $07, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $1F8, $F7, 0, 0, 2, 0, $E7)
    %spritemapEntry(1, $1EC, $0B, 0, 0, 2, 0, $E0)
    %spritemapEntry(1, $1DE, $12, 0, 0, 2, 0, $E0)
    %spritemapEntry(1, $1D0, $19, 0, 0, 2, 0, $E0)

UNUSED_Spritemap_CrocomireCorpse_A4E9CE:
    dw $0009
    %spritemapEntry(1, $1B1, $13, 0, 0, 2, 0, $E4)
    %spritemapEntry(1, $1A1, $13, 0, 0, 2, 0, $100)
    %spritemapEntry(0, $1F8, $09, 0, 0, 2, 0, $FF)
    %spritemapEntry(0, $1F0, $F9, 0, 0, 2, 0, $EF)
    %spritemapEntry(1, $1E8, $01, 0, 0, 2, 0, $ED)
    %spritemapEntry(1, $1F8, $F9, 0, 0, 2, 0, $10D)
    %spritemapEntry(1, $1DE, $05, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1CE, $0F, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $1C0, $0F, 0, 0, 2, 0, $102)

UNUSED_Spritemap_CrocomireCorpse_A4E9FD:
    dw $0007
    %spritemapEntry(1, $1CC, $1C, 0, 0, 2, 0, $E4)
    %spritemapEntry(1, $1BC, $1E, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $1F8, $08, 0, 0, 2, 0, $109)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $E9)
    %spritemapEntry(1, $1F6, $0D, 0, 0, 2, 0, $E0)
    %spritemapEntry(1, $1E8, $14, 0, 0, 2, 0, $E0)
    %spritemapEntry(1, $1DA, $1B, 0, 0, 2, 0, $E0)

UNUSED_Spritemap_CrocomireCorpse_A4EA22:
    dw $0009
    %spritemapEntry(0, $00, $08, 0, 1, 2, 0, $FF)
    %spritemapEntry(0, $08, $F8, 0, 1, 2, 0, $EF)
    %spritemapEntry(1, $08, $00, 0, 1, 2, 0, $ED)
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $10D)
    %spritemapEntry(1, $1D5, $11, 0, 0, 2, 0, $E4)
    %spritemapEntry(1, $1C5, $11, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $02, $03, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F2, $0D, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $1E4, $0D, 0, 0, 2, 0, $102)

UNUSED_Spritemap_CrocomireCorpse_A4EA51:
    dw $0007
    %spritemapEntry(1, $1C0, $0C, 0, 0, 2, 0, $E4)
    %spritemapEntry(1, $1B0, $0C, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $1F8, $08, 0, 0, 2, 0, $109)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $E9)
    %spritemapEntry(1, $1F0, $0C, 0, 0, 2, 0, $E2)
    %spritemapEntry(1, $1E0, $0C, 0, 0, 2, 0, $E2)
    %spritemapEntry(1, $1D0, $0C, 0, 0, 2, 0, $E2)

UNUSED_Spritemap_CrocomireCorpse_A4EA76:
    dw $0008
    %spritemapEntry(0, $02, $09, 0, 0, 2, 0, $DF)
    %spritemapEntry(0, $1FA, $09, 0, 0, 2, 0, $DE)
    %spritemapEntry(0, $1F2, $09, 0, 0, 2, 0, $DD)
    %spritemapEntry(0, $1EA, $09, 0, 0, 2, 0, $DC)
    %spritemapEntry(0, $1E2, $09, 0, 0, 2, 0, $DB)
    %spritemapEntry(1, $1F2, $F9, 0, 0, 2, 0, $12D)
    %spritemapEntry(1, $1F6, $F9, 0, 0, 2, 0, $14B)
    %spritemapEntry(1, $01, $F9, 0, 0, 2, 0, $12B)

UNUSED_Spritemap_CrocomireCorpse_A4EAA0:
    dw $0008
    %spritemapEntry(0, $05, $09, 0, 0, 2, 0, $DF)
    %spritemapEntry(0, $1FD, $09, 0, 0, 2, 0, $DE)
    %spritemapEntry(0, $1F5, $09, 0, 0, 2, 0, $DD)
    %spritemapEntry(0, $1ED, $09, 0, 0, 2, 0, $DC)
    %spritemapEntry(0, $1E5, $09, 0, 0, 2, 0, $DB)
    %spritemapEntry(1, $1F5, $F9, 0, 0, 2, 0, $12D)
    %spritemapEntry(1, $1F7, $F9, 0, 0, 2, 0, $14B)
    %spritemapEntry(1, $01, $F9, 0, 0, 2, 0, $12B)

UNUSED_Spritemap_CrocomireCorpse_A4EACA:
    dw $0008
    %spritemapEntry(0, $08, $09, 0, 0, 2, 0, $DF)
    %spritemapEntry(0, $00, $09, 0, 0, 2, 0, $DE)
    %spritemapEntry(0, $1F8, $09, 0, 0, 2, 0, $DD)
    %spritemapEntry(0, $1F0, $09, 0, 0, 2, 0, $DC)
    %spritemapEntry(0, $1E8, $09, 0, 0, 2, 0, $DB)
    %spritemapEntry(1, $1F8, $F9, 0, 0, 2, 0, $12D)
    %spritemapEntry(1, $1F9, $F9, 0, 0, 2, 0, $14B)
    %spritemapEntry(1, $00, $F9, 0, 0, 2, 0, $12B)

UNUSED_Spritemap_CrocomireCorpse_A4EAF4:
    dw $0008
    %spritemapEntry(0, $0C, $09, 0, 0, 2, 0, $DF)
    %spritemapEntry(0, $04, $09, 0, 0, 2, 0, $DE)
    %spritemapEntry(0, $1FC, $09, 0, 0, 2, 0, $DD)
    %spritemapEntry(0, $1F4, $09, 0, 0, 2, 0, $DC)
    %spritemapEntry(0, $1EC, $09, 0, 0, 2, 0, $DB)
    %spritemapEntry(1, $1FC, $F9, 0, 0, 2, 0, $12D)
    %spritemapEntry(1, $1FC, $F9, 0, 0, 2, 0, $14B)
    %spritemapEntry(1, $00, $F9, 0, 0, 2, 0, $12B)

UNUSED_Spritemap_CrocomireCorpse_A4EB1E:
    dw $0008
    %spritemapEntry(1, $03, $F9, 0, 0, 2, 0, $12D)
    %spritemapEntry(1, $02, $F9, 0, 1, 2, 0, $14B)
    %spritemapEntry(0, $11, $09, 0, 0, 2, 0, $DF)
    %spritemapEntry(0, $09, $09, 0, 0, 2, 0, $DE)
    %spritemapEntry(0, $01, $09, 0, 0, 2, 0, $DD)
    %spritemapEntry(0, $1F9, $09, 0, 0, 2, 0, $DC)
    %spritemapEntry(0, $1F1, $09, 0, 0, 2, 0, $DB)
    %spritemapEntry(1, $01, $F9, 0, 1, 2, 0, $12B)

UNUSED_Spritemap_CrocomireCorpse_A4EB48:
    dw $0008
    %spritemapEntry(1, $09, $F9, 0, 0, 2, 0, $12D)
    %spritemapEntry(1, $06, $F9, 0, 1, 2, 0, $14B)
    %spritemapEntry(0, $18, $09, 0, 0, 2, 0, $DF)
    %spritemapEntry(0, $10, $09, 0, 0, 2, 0, $DE)
    %spritemapEntry(0, $08, $09, 0, 0, 2, 0, $DD)
    %spritemapEntry(0, $00, $09, 0, 0, 2, 0, $DC)
    %spritemapEntry(0, $1F8, $09, 0, 0, 2, 0, $DB)
    %spritemapEntry(1, $01, $F9, 0, 1, 2, 0, $12B)

UNUSED_Spritemap_CrocomireCorpse_A4EB72:
    dw $0008
    %spritemapEntry(1, $10, $F9, 0, 0, 2, 0, $12D)
    %spritemapEntry(1, $0B, $F9, 0, 1, 2, 0, $14B)
    %spritemapEntry(0, $20, $09, 0, 0, 2, 0, $DF)
    %spritemapEntry(0, $18, $09, 0, 0, 2, 0, $DE)
    %spritemapEntry(0, $10, $09, 0, 0, 2, 0, $DD)
    %spritemapEntry(0, $08, $09, 0, 0, 2, 0, $DC)
    %spritemapEntry(0, $00, $09, 0, 0, 2, 0, $DB)
    %spritemapEntry(1, $03, $F9, 0, 1, 2, 0, $12B)

UNUSED_Spritemap_CrocomireCorpse_A4EB9C:
    dw $0008
    %spritemapEntry(1, $09, $F8, 0, 0, 2, 0, $12D)
    %spritemapEntry(1, $06, $F8, 0, 1, 2, 0, $14B)
    %spritemapEntry(0, $18, $09, 0, 0, 2, 0, $DF)
    %spritemapEntry(0, $10, $08, 0, 0, 2, 0, $DE)
    %spritemapEntry(0, $08, $08, 0, 0, 2, 0, $DD)
    %spritemapEntry(0, $00, $09, 0, 0, 2, 0, $DC)
    %spritemapEntry(0, $1F8, $09, 0, 0, 2, 0, $DB)
    %spritemapEntry(1, $01, $F9, 0, 1, 2, 0, $12B)

UNUSED_Spritemap_CrocomireCorpse_A4EBC6:
    dw $0008
    %spritemapEntry(1, $03, $F5, 0, 0, 2, 0, $12D)
    %spritemapEntry(1, $02, $F5, 0, 1, 2, 0, $14B)
    %spritemapEntry(0, $11, $06, 0, 0, 2, 0, $DF)
    %spritemapEntry(0, $09, $05, 0, 0, 2, 0, $DE)
    %spritemapEntry(0, $01, $05, 0, 0, 2, 0, $DD)
    %spritemapEntry(0, $1F9, $07, 0, 0, 2, 0, $DC)
    %spritemapEntry(0, $1F1, $07, 0, 0, 2, 0, $DB)
    %spritemapEntry(1, $01, $F9, 0, 1, 2, 0, $12B)

UNUSED_Spritemap_CrocomireCorpse_A4EBF0:
    dw $0008
    %spritemapEntry(0, $0C, $06, 0, 0, 2, 0, $DF)
    %spritemapEntry(0, $04, $05, 0, 0, 2, 0, $DE)
    %spritemapEntry(0, $1FC, $05, 0, 0, 2, 0, $DD)
    %spritemapEntry(0, $1F4, $07, 0, 0, 2, 0, $DC)
    %spritemapEntry(0, $1EC, $07, 0, 0, 2, 0, $DB)
    %spritemapEntry(1, $1FC, $F5, 0, 0, 2, 0, $12D)
    %spritemapEntry(1, $1FC, $F5, 0, 0, 2, 0, $14B)
    %spritemapEntry(1, $00, $F9, 0, 0, 2, 0, $12B)

UNUSED_Spritemap_CrocomireCorpse_A4EC1A:
    dw $0008
    %spritemapEntry(0, $08, $06, 0, 0, 2, 0, $DF)
    %spritemapEntry(0, $00, $05, 0, 0, 2, 0, $DE)
    %spritemapEntry(0, $1F8, $05, 0, 0, 2, 0, $DD)
    %spritemapEntry(0, $1F0, $07, 0, 0, 2, 0, $DC)
    %spritemapEntry(0, $1E8, $07, 0, 0, 2, 0, $DB)
    %spritemapEntry(1, $1F8, $F5, 0, 0, 2, 0, $12D)
    %spritemapEntry(1, $1F9, $F5, 0, 0, 2, 0, $14B)
    %spritemapEntry(1, $00, $F9, 0, 0, 2, 0, $12B)

UNUSED_Spritemap_CrocomireCorpse_A4EC44:
    dw $0008
    %spritemapEntry(0, $05, $07, 0, 0, 2, 0, $DF)
    %spritemapEntry(0, $1FD, $06, 0, 0, 2, 0, $DE)
    %spritemapEntry(0, $1F5, $06, 0, 0, 2, 0, $DD)
    %spritemapEntry(0, $1ED, $08, 0, 0, 2, 0, $DC)
    %spritemapEntry(0, $1E5, $08, 0, 0, 2, 0, $DB)
    %spritemapEntry(1, $1F5, $F6, 0, 0, 2, 0, $12D)
    %spritemapEntry(1, $1F7, $F6, 0, 0, 2, 0, $14B)
    %spritemapEntry(1, $01, $F9, 0, 0, 2, 0, $12B)

UNUSED_Spritemap_CrocomireCorpse_A4EC6E:
    dw $0008
    %spritemapEntry(0, $02, $08, 0, 0, 2, 0, $DF)
    %spritemapEntry(0, $1FA, $07, 0, 0, 2, 0, $DE)
    %spritemapEntry(0, $1F2, $07, 0, 0, 2, 0, $DD)
    %spritemapEntry(0, $1EA, $08, 0, 0, 2, 0, $DC)
    %spritemapEntry(0, $1E2, $08, 0, 0, 2, 0, $DB)
    %spritemapEntry(1, $1F2, $F7, 0, 0, 2, 0, $12D)
    %spritemapEntry(1, $1F6, $F7, 0, 0, 2, 0, $14B)
    %spritemapEntry(1, $01, $F9, 0, 0, 2, 0, $12B)

UNUSED_Spritemap_CrocomireCorpse_A4EC98:
    dw $0008
    %spritemapEntry(0, $0C, $04, 0, 0, 2, 0, $DF)
    %spritemapEntry(0, $04, $05, 0, 0, 2, 0, $DE)
    %spritemapEntry(0, $1FC, $05, 0, 0, 2, 0, $DD)
    %spritemapEntry(0, $1F4, $05, 0, 0, 2, 0, $DC)
    %spritemapEntry(0, $1EC, $05, 0, 0, 2, 0, $DB)
    %spritemapEntry(1, $1FC, $F5, 0, 0, 2, 0, $12D)
    %spritemapEntry(1, $1FC, $F5, 0, 0, 2, 0, $14B)
    %spritemapEntry(1, $00, $F9, 0, 0, 2, 0, $12B)

UNUSED_Spritemap_CrocomireCorpse_A4ECC2:
    dw $0008
    %spritemapEntry(0, $0C, $04, 0, 0, 2, 0, $DF)
    %spritemapEntry(0, $04, $05, 0, 0, 2, 0, $DE)
    %spritemapEntry(0, $1FC, $05, 0, 0, 2, 0, $DD)
    %spritemapEntry(0, $1F4, $05, 0, 0, 2, 0, $DC)
    %spritemapEntry(0, $1EC, $05, 0, 0, 2, 0, $DB)
    %spritemapEntry(1, $1FC, $F5, 0, 0, 2, 0, $12D)
    %spritemapEntry(1, $1FC, $F3, 0, 0, 2, 0, $14B)
    %spritemapEntry(1, $00, $F5, 0, 0, 2, 0, $12B)

UNUSED_Spritemap_CrocomireCorpse_A4ECEC:
    dw $0008
    %spritemapEntry(0, $0C, $04, 0, 0, 2, 0, $DF)
    %spritemapEntry(0, $04, $05, 0, 0, 2, 0, $DE)
    %spritemapEntry(0, $1FC, $05, 0, 0, 2, 0, $DD)
    %spritemapEntry(0, $1F4, $05, 0, 0, 2, 0, $DC)
    %spritemapEntry(0, $1EC, $05, 0, 0, 2, 0, $DB)
    %spritemapEntry(1, $1FC, $F5, 0, 0, 2, 0, $12D)
    %spritemapEntry(1, $1FC, $F1, 0, 0, 2, 0, $14B)
    %spritemapEntry(1, $00, $F1, 0, 0, 2, 0, $12B)
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_CrocomireCorpse_10:
    dw $0009
    %spritemapEntry(1, $2D, $1A, 0, 1, 2, 1, $E4)
    %spritemapEntry(1, $3D, $1E, 0, 1, 2, 1, $100)
    %spritemapEntry(0, $1F8, $07, 0, 1, 2, 1, $108)
    %spritemapEntry(0, $08, $FF, 0, 1, 2, 1, $F6)
    %spritemapEntry(1, $00, $07, 0, 1, 2, 1, $106)
    %spritemapEntry(1, $1F8, $F7, 0, 1, 2, 1, $E7)
    %spritemapEntry(1, $04, $0B, 0, 1, 2, 1, $E0)
    %spritemapEntry(1, $12, $12, 0, 1, 2, 1, $E0)
    %spritemapEntry(1, $20, $19, 0, 1, 2, 1, $E0)

Spritemap_CrocomireCorpse_11:
    dw $0009
    %spritemapEntry(1, $3F, $13, 0, 1, 2, 1, $E4)
    %spritemapEntry(1, $4F, $13, 0, 1, 2, 1, $100)
    %spritemapEntry(0, $00, $09, 0, 1, 2, 1, $FF)
    %spritemapEntry(0, $08, $F9, 0, 1, 2, 1, $EF)
    %spritemapEntry(1, $08, $01, 0, 1, 2, 1, $ED)
    %spritemapEntry(1, $1F8, $F9, 0, 1, 2, 1, $10D)
    %spritemapEntry(1, $12, $05, 0, 1, 2, 1, $102)
    %spritemapEntry(1, $22, $0F, 0, 1, 2, 1, $104)
    %spritemapEntry(1, $30, $0F, 0, 1, 2, 1, $102)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_CrocomireCorpse_A4ED74:
    dw $0007
    %spritemapEntry(1, $24, $1C, 0, 1, 2, 1, $E4)
    %spritemapEntry(1, $34, $1E, 0, 1, 2, 1, $100)
    %spritemapEntry(1, $1F8, $08, 0, 1, 2, 1, $109)
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 1, $E9)
    %spritemapEntry(1, $1FA, $0D, 0, 1, 2, 1, $E0)
    %spritemapEntry(1, $08, $14, 0, 1, 2, 1, $E0)
    %spritemapEntry(1, $16, $1B, 0, 1, 2, 1, $E0)

UNUSED_Spritemap_CrocomireCorpse_A4ED99:
    dw $0009
    %spritemapEntry(0, $1F8, $08, 0, 0, 2, 1, $FF)
    %spritemapEntry(0, $1F0, $F8, 0, 0, 2, 1, $EF)
    %spritemapEntry(1, $1E8, $00, 0, 0, 2, 1, $ED)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 1, $10D)
    %spritemapEntry(1, $1B, $11, 0, 1, 2, 1, $E4)
    %spritemapEntry(1, $2B, $11, 0, 1, 2, 1, $100)
    %spritemapEntry(1, $1EE, $03, 0, 1, 2, 1, $102)
    %spritemapEntry(1, $1FE, $0D, 0, 1, 2, 1, $104)
    %spritemapEntry(1, $0C, $0D, 0, 1, 2, 1, $102)

UNUSED_Spritemap_CrocomireCorpse_A4EDC8:
    dw $0007
    %spritemapEntry(1, $1E6, $FA, 0, 0, 2, 0, $EB)
    %spritemapEntry(1, $1F6, $FA, 0, 0, 2, 0, $10B)
    %spritemapEntry(1, $1AD, $FA, 0, 0, 2, 0, $E4)
    %spritemapEntry(1, $19D, $FA, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $1DD, $FA, 0, 0, 2, 0, $E2)
    %spritemapEntry(1, $1CD, $FA, 0, 0, 2, 0, $E2)
    %spritemapEntry(1, $1BD, $FA, 0, 0, 2, 0, $E2)
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_CrocomireCorpse_12:
    dw $0009
    %spritemapEntry(0, $00, $F0, 1, 1, 2, 1, $FF)
    %spritemapEntry(0, $08, $00, 1, 1, 2, 1, $EF)
    %spritemapEntry(1, $08, $F0, 1, 1, 2, 1, $ED)
    %spritemapEntry(1, $1F8, $F8, 1, 1, 2, 1, $10D)
    %spritemapEntry(1, $3D, $DB, 0, 1, 2, 1, $E4)
    %spritemapEntry(1, $4D, $DB, 0, 1, 2, 1, $100)
    %spritemapEntry(1, $10, $EC, 1, 1, 2, 1, $102)
    %spritemapEntry(1, $20, $E2, 1, 1, 2, 1, $104)
    %spritemapEntry(1, $2E, $E2, 1, 1, 2, 1, $102)

Spritemap_CrocomireCorpse_13:
    dw $0007
    %spritemapEntry(1, $0A, $FA, 0, 1, 2, 1, $EB)
    %spritemapEntry(1, $1FA, $FA, 0, 1, 2, 1, $10B)
    %spritemapEntry(1, $43, $FA, 0, 1, 2, 1, $E4)
    %spritemapEntry(1, $53, $FA, 0, 1, 2, 1, $100)
    %spritemapEntry(1, $13, $FA, 0, 1, 2, 1, $E2)
    %spritemapEntry(1, $23, $FA, 0, 1, 2, 1, $E2)
    %spritemapEntry(1, $33, $FA, 0, 1, 2, 1, $E2)

Spritemap_CrocomireCorpse_14:
    dw $0009
    %spritemapEntry(0, $1F8, $08, 0, 0, 2, 1, $FF)
    %spritemapEntry(0, $1F0, $F8, 0, 0, 2, 1, $EF)
    %spritemapEntry(1, $1E8, $00, 0, 0, 2, 1, $ED)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 1, $10D)
    %spritemapEntry(1, $1B, $F6, 0, 1, 2, 1, $E4)
    %spritemapEntry(1, $2B, $F6, 0, 1, 2, 1, $100)
    %spritemapEntry(1, $1EE, $07, 1, 1, 2, 1, $102)
    %spritemapEntry(1, $1FE, $FD, 1, 1, 2, 1, $104)
    %spritemapEntry(1, $0C, $FD, 1, 1, 2, 1, $102)

Spritemap_CrocomireCorpse_15:
    dw $0007
    %spritemapEntry(1, $1F8, $08, 0, 1, 2, 1, $109)
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 1, $E9)
    %spritemapEntry(1, $2A, $FA, 0, 1, 2, 1, $E4)
    %spritemapEntry(1, $3A, $FA, 0, 1, 2, 1, $100)
    %spritemapEntry(1, $1FD, $0B, 1, 1, 2, 1, $102)
    %spritemapEntry(1, $0D, $01, 1, 1, 2, 1, $104)
    %spritemapEntry(1, $1B, $01, 1, 1, 2, 1, $102)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_CrocomireCorpse_A4EE95:
    dw $0009
    %spritemapEntry(0, $00, $08, 0, 1, 2, 0, $FF)
    %spritemapEntry(0, $08, $F8, 0, 1, 2, 0, $EF)
    %spritemapEntry(1, $08, $00, 0, 1, 2, 0, $ED)
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 0, $10D)
    %spritemapEntry(1, $1D5, $F6, 0, 0, 2, 0, $E4)
    %spritemapEntry(1, $1C5, $F6, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $02, $07, 1, 0, 2, 0, $102)
    %spritemapEntry(1, $1F2, $FD, 1, 0, 2, 0, $104)
    %spritemapEntry(1, $1E4, $FD, 1, 0, 2, 0, $102)

UNUSED_Spritemap_CrocomireCorpse_A4EEC4:
    dw $0009
    %spritemapEntry(0, $1F8, $F0, 1, 0, 2, 0, $FF)
    %spritemapEntry(0, $1F0, $00, 1, 0, 2, 0, $EF)
    %spritemapEntry(1, $1E8, $F0, 1, 0, 2, 0, $ED)
    %spritemapEntry(1, $1F8, $F8, 1, 0, 2, 0, $10D)
    %spritemapEntry(1, $1B3, $DB, 0, 0, 2, 0, $E4)
    %spritemapEntry(1, $1A3, $DB, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $1E0, $EC, 1, 0, 2, 0, $102)
    %spritemapEntry(1, $1D0, $E2, 1, 0, 2, 0, $104)
    %spritemapEntry(1, $1C2, $E2, 1, 0, 2, 0, $102)

UNUSED_Spritemap_CrocomireCorpse_A4EEF3:
    dw $0004
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 0, $D0)
    %spritemapEntry(0, $00, $00, 1, 1, 2, 0, $D0)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 0, $D0)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $D0)

UNUSED_Spritemap_CrocomireCorpse_A4EF09:
    dw $0004
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 0, $D1)
    %spritemapEntry(0, $00, $00, 1, 1, 2, 0, $D1)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 0, $D1)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $D1)

UNUSED_Spritemap_CrocomireCorpse_A4EF1F:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 2, 0, $D2)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 0, $D2)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 0, $D2)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $D2)

UNUSED_Spritemap_CrocomireCorpse_A4EF35:
    dw $0004
    %spritemapEntry(0, $00, $00, 1, 1, 2, 0, $D3)
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 0, $D3)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 0, $D3)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $D3)

UNUSED_Spritemap_CrocomireCorpse_A4EF4B:
    dw $0004
    %spritemapEntry(0, $08, $00, 0, 0, 2, 0, $D7)
    %spritemapEntry(0, $00, $00, 0, 0, 2, 0, $D6)
    %spritemapEntry(0, $1F8, $00, 0, 0, 2, 0, $D5)
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 0, $D4)

UNUSED_Spritemap_CrocomireCorpse_A4EF61:
    dw $0003
    %spritemapEntry(0, $08, $00, 0, 0, 2, 0, $DA)
    %spritemapEntry(0, $00, $00, 0, 0, 2, 0, $D9)
    %spritemapEntry(0, $1F8, $00, 0, 0, 2, 0, $D8)

UNUSED_Spritemap_CrocomireCorpse_A4EF72:
    dw $0004
    %spritemapEntry(0, $08, $F8, 1, 0, 2, 0, $D7)
    %spritemapEntry(0, $00, $F8, 1, 0, 2, 0, $D6)
    %spritemapEntry(0, $1F8, $F8, 1, 0, 2, 0, $D5)
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 0, $D4)

UNUSED_Spritemap_CrocomireCorpse_A4EF88:
    dw $0003
    %spritemapEntry(0, $08, $F8, 1, 0, 2, 0, $DA)
    %spritemapEntry(0, $00, $F8, 1, 0, 2, 0, $D9)
    %spritemapEntry(0, $1F8, $F8, 1, 0, 2, 0, $D8)

UNUSED_Spritemap_CrocomireCorpse_A4EF99:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $1CC)

UNUSED_Spritemap_CrocomireCorpse_A4EFA0:
    dw $0006
    %spritemapEntry(0, $1E0, $00, 0, 0, 2, 0, $1DE)
    %spritemapEntry(0, $1E0, $F8, 0, 0, 2, 0, $1CE)
    %spritemapEntry(0, $1E8, $00, 0, 0, 2, 0, $15D)
    %spritemapEntry(0, $1E8, $F8, 0, 0, 2, 0, $14D)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 2, 0, $1E6)
    %spritemapEntry(1, $00, $F0, 0, 0, 2, 0, $1E0)

UNUSED_Spritemap_CrocomireCorpse_A4EFC0:
    dw $0006
    %spritemapEntry(0, $1E0, $00, 0, 0, 2, 0, $1DF)
    %spritemapEntry(0, $1E0, $F8, 0, 0, 2, 0, $1CF)
    %spritemapEntry(0, $1E8, $00, 0, 0, 2, 0, $15D)
    %spritemapEntry(0, $1E8, $F8, 0, 0, 2, 0, $14D)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 2, 0, $1E6)
    %spritemapEntry(1, $00, $F0, 0, 0, 2, 0, $1E0)

UNUSED_Spritemap_CrocomireCorpse_A4EFE0:
    dw $0006
    %spritemapEntry(0, $1E8, $00, 0, 0, 2, 0, $15E)
    %spritemapEntry(0, $1E8, $F8, 0, 0, 2, 0, $14E)
    %spritemapEntry(0, $1E0, $00, 0, 0, 2, 0, $13F)
    %spritemapEntry(0, $1E0, $F8, 0, 0, 2, 0, $12F)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 2, 0, $1E6)
    %spritemapEntry(1, $00, $F0, 0, 0, 2, 0, $1E0)

UNUSED_Spritemap_CrocomireCorpse_A4F000:
    dw $0004
    %spritemapEntry(1, $00, $F0, 0, 0, 2, 0, $1E0)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 2, 0, $1E8)
    %spritemapEntry(0, $1E8, $00, 0, 0, 2, 0, $15F)
    %spritemapEntry(0, $1E8, $F8, 0, 0, 2, 0, $14F)

UNUSED_Spritemap_CrocomireCorpse_A4F016:
    dw $0002
    %spritemapEntry(1, $00, $F0, 0, 0, 2, 0, $1E2)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 2, 0, $1EA)

UNUSED_Spritemap_CrocomireCorpse_A4F022:
    dw $0001
    %spritemapEntry(1, $00, $F0, 0, 0, 2, 0, $1E4)

UNUSED_ExtendedTilemap_CrocomireCorpse_A4F029:
    dw $FFFE,$2000,$000C,$01FF,$01FF,$01FF,$01FF,$01FF
    dw $01FF,$01FF,$01FF,$01FF,$01FF,$01FF,$01FF,$2040
    dw $000C,$01FF,$01FF,$1CA2,$1CA3,$1CA4,$1CA5,$1CA6
    dw $1CA7,$1CA8,$1CA9,$1CAA,$01FF,$2080,$000C,$1CB0
    dw $1CB1,$1CB2,$1CB3,$1CB4,$1CB5,$1CB6,$1CB7,$1CB8
    dw $1CB9,$1CBA,$1CBB,$20C0,$000C,$1CAC,$1CAD,$1CAE
    dw $1CAF,$1CC0,$1CC1,$1CC2,$1CC3,$1CC4,$1CC5,$1CC6
    dw $1CC7,$2100,$000C,$1CBC,$1CBD,$1CBE,$1CBF,$1CD0
    dw $1CD1,$1CD2,$1CD3,$1CD4,$1CD5,$1CD6,$1CD7,$2140
    dw $000C,$01FF,$01FF,$01FF,$01FF,$1CCA,$1CCB,$1CCC
    dw $1CCD,$1CCE,$1CCF,$1C8B,$1C8C,$2180,$000C,$01FF
    dw $01FF,$1CD8,$1CD9,$1CDA,$1CDB,$1CDC,$1CDD,$1CDE
    dw $1CDF,$1C9B,$1C9C,$21C0,$000C,$01FF,$01FF,$1C43
    dw $1C44,$1C45,$1C46,$1C8D,$1C8E,$1C8F,$1C9D,$1C9E
    dw $1C9F,$FFFF

UNUSED_ExtendedTilemap_CrocomireCorpse_A4F10D:
    dw $FFFE,$2002,$0007,$1CE0,$1CE1,$1CE2,$1CE3,$1CE4
    dw $1CE5,$1CE6,$2042,$000A,$1CF0,$1CF1,$1CF2,$1CF3
    dw $1CF4,$1CF5,$1CF6,$1CF7,$1CF8,$01FF,$2080,$000C
    dw $01FF,$01FF,$1CE9,$1CEA,$1CEB,$1CEC,$1CED,$1CEE
    dw $1CEF,$1D00,$1D01,$01FF,$20C0,$000C,$01FF,$01FF
    dw $01FF,$1CFA,$1CFB,$1CFC,$1CFD,$1CFE,$1CFF,$1D10
    dw $1D11,$1D12,$2100,$000C,$01FF,$01FF,$01FF,$01FF
    dw $1D03,$1D04,$1D05,$1D06,$1D07,$1D08,$1D09,$1D0A
    dw $2148,$0008,$01FF,$1D14,$1D15,$1D16,$1D17,$1D18
    dw $1D19,$1D1A,$2184,$000A,$1D0C,$1D0D,$1D0E,$1D0F
    dw $1D20,$1D21,$1D22,$1D23,$1D24,$1D25,$21C4,$000A
    dw $1D1C,$1D1D,$1D1E,$1D1F,$1D30,$1D31,$1D32,$1D33
    dw $1D34,$1D35,$FFFF

UNUSED_ExtendedTilemap_CrocomireCorpse_A4F1D3:
    dw $FFFE,$2002,$0007,$01FF,$01FF,$01FF,$01FF,$01FF
    dw $01FF,$01FF,$2042,$000A,$01FF,$01FF,$01FF,$01FF
    dw $1C02,$1C03,$1C04,$1C05,$1C06,$1C07,$2084,$000A
    dw $01FF,$1C10,$1C11,$1C12,$1C13,$1C14,$1C15,$1C16
    dw $1C17,$1C18,$20C2,$000B,$1C0A,$1C0B,$1C0C,$1C0D
    dw $1C0E,$1C0F,$1C20,$1C21,$1C22,$1C23,$1C24,$2100
    dw $000C,$1C19,$1C1A,$1C1B,$1C1C,$1C1D,$1C1E,$1C1F
    dw $1C30,$1C31,$1C32,$1C33,$1C34,$2140,$000C,$1C25
    dw $1C26,$1C27,$1C28,$1C29,$1C2A,$1C2B,$1C2C,$1C2D
    dw $1C2E,$1C2F,$1C40,$2180,$000C,$1C35,$1C36,$1C37
    dw $1C38,$1C39,$1C3A,$1C3B,$1C3C,$1C3D,$1C3E,$1C3F
    dw $1C50,$21C0,$0001,$1C00,$21C4,$000A,$1C43,$1C44
    dw $1C45,$1C46,$1C47,$1C48,$1C49,$1C4A,$1C4B,$1C4C
    dw $FFFF

UNUSED_ExtendedTilemap_CrocomireCorpse_A4F2A5:
    dw $FFFE,$2246,$0004,$1C4F,$1C60,$1C61,$1C62,$2286
    dw $0004,$1C5F,$1C70,$1C71,$1C72,$22C6,$0004,$1C6A
    dw $1C6B,$1C6C,$1C6D,$2306,$0004,$1C7A,$1C7B,$1C7C
    dw $1C7D,$FFFF

UNUSED_ExtendedTilemap_CrocomireCorpse_A4F2D9:
    dw $FFFE,$2246,$0004,$1D46,$1D47,$1D48,$1D49,$2286
    dw $0004,$1D56,$1D57,$1D58,$1D59,$22C6,$0004,$1D4A
    dw $1D4B,$1D4C,$1D4D,$2306,$0004,$1D5A,$1D5B,$1D5C
    dw $1D5D,$FFFF

UNUSED_ExtendedTilemap_CrocomireCorpse_A4F30D:
    dw $FFFE,$2246,$0004,$1D4E,$1D4F,$1D02,$1D0B,$2286
    dw $0004,$1D13,$1D1B,$1C42,$1C51,$22C6,$0004,$1CA0
    dw $1CA1,$1CAB,$1CF9,$2306,$0004,$1C01,$1C08,$1C09
    dw $1C41,$FFFF

UNUSED_ExtendedTilemap_CrocomireCorpse_A4F341:
    dw $FFFE,$2354,$0006,$1D40,$1D41,$1D42,$1D43,$1D44
    dw $1D45,$2394,$0006,$1D50,$1D51,$1D52,$1D53,$1D54
    dw $1D55,$FFFF

UNUSED_ExtendedTilemap_CrocomireCorpse_A4F365:
    dw $FFFE,$2354,$0006,$1D26,$1D27,$1D28,$1D29,$1D2A
    dw $1D2B,$2394,$0006,$1D36,$1D37,$1D38,$1D39,$1D3A
    dw $1D3B,$FFFF

UNUSED_ExtendedTilemap_CrocomireCorpse_A4F389:
    dw $FFFE,$2354,$0006,$1D2C,$1D2D,$1D2E,$1D2F,$1CC8
    dw $1CC9,$2394,$0006,$1D3C,$1D3D,$1D3E,$1D3F,$1CE7
    dw $1CE8,$FFFF

UNUSED_ExtendedTilemap_CrocomireCorpse_A4F3AD:
    dw $FFFE,$2040,$000C,$01FF,$01FF,$01FF,$01FF,$01FF
    dw $1C02,$1C03,$1C04,$1C05,$1C06,$1C07,$01FF,$2080
    dw $000C,$01FF,$01FF,$01FF,$1C10,$1C11,$1C12,$1C13
    dw $1C14,$1C15,$1C16,$1C17,$1C18,$20C0,$000C,$01FF
    dw $1C0A,$1C0B,$1C0C,$1C0D,$1C0E,$1C0F,$1C20,$1C21
    dw $1C22,$1C23,$1C24,$2100,$000C,$1C19,$1C1A,$1C1B
    dw $1C1C,$1C1D,$1C1E,$1C1F,$1C30,$1C31,$1C32,$1C33
    dw $1C34,$2140,$000C,$1C25,$1C26,$1C27,$1C28,$1C29
    dw $1C2A,$1C2B,$1C2C,$1C2D,$1C2E,$1C2F,$1C40,$2180
    dw $000C,$1C35,$1C36,$1C37,$1C38,$1C39,$1C3A,$1C3B
    dw $1C3C,$1C3D,$1C3E,$1C3F,$1C50,$21C0,$000C,$1C00
    dw $01FF,$1C43,$1C44,$1C45,$1C46,$1C47,$1C48,$1C49
    dw $1C4A,$1C4B,$1C4C,$2200,$000C,$01FF,$01FF,$1C53
    dw $1C54,$1C55,$1C56,$1C57,$1C58,$1C59,$1C5A,$1C5B
    dw $1C5C,$2240,$000C,$01FF,$1C4D,$1C4E,$1C4F,$1C60
    dw $1C61,$1C62,$1C63,$1C64,$1C65,$1C66,$1C67,$2280
    dw $000C,$01FF,$1C5D,$1C5E,$1C5F,$1C70,$1C71,$1C72
    dw $1C73,$1C74,$1C75,$1C76,$1C77,$22C0,$000C,$01FF
    dw $1C68,$1C69,$1C6A,$1C6B,$1C6C,$1C6D,$1C6E,$1C6F
    dw $1C80,$1C81,$01FF,$2300,$000C,$01FF,$1C78,$1C79
    dw $1C7A,$1C7B,$1C7C,$1C7D,$1C7E,$1C7F,$1C90,$1C91
    dw $01FF,$2340,$000C,$01FF,$1C82,$1C83,$1C84,$1C85
    dw $1C86,$1C87,$1C88,$1C89,$1C8A,$0140,$0141,$2380
    dw $000C,$01FF,$01FF,$1C93,$1C94,$1C95,$1C96,$1C97
    dw $1C98,$1C99,$1C9A,$0150,$0151,$FFFF

UNUSED_ExtendedTilemap_CrocomireCorpse_A4F539:
    dw $FFFE,$2202,$000B,$01FF,$1C53,$1C54,$1C55,$1C56
    dw $1C57,$1C58,$1C59,$1C5A,$1C5B,$1C5C,$2242,$000B
    dw $1C4D,$1C4E,$1C4F,$1C60,$1C61,$1C62,$1C63,$1C64
    dw $1C65,$1C66,$1C67,$2282,$000B,$1C5D,$1C5E,$1C5F
    dw $1C70,$1C71,$1C72,$1C73,$1C74,$1C75,$1C76,$1C77
    dw $22C2,$000B,$1C68,$1C69,$1C6A,$1C6B,$1C6C,$1C6D
    dw $1C6E,$1C6F,$1C80,$1C81,$01FF,$2302,$000B,$1C78
    dw $1C79,$1C7A,$1C7B,$1C7C,$1C7D,$1C7E,$1C7F,$1C90
    dw $1C91,$01FF,$2342,$000B,$1C82,$1C83,$1C84,$1C85
    dw $1C86,$1C87,$1C88,$1C89,$1C8A,$0140,$0141,$2382
    dw $000B,$01FF,$1C93,$1C94,$1C95,$1C96,$1C97,$1C98
    dw $1C99,$1C9A,$0150,$0151,$FFFF
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_CrocomireCorpse_16:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 5, $25)

Spritemap_CrocomireCorpse_17:
    dw $0003
    %spritemapEntry(0, $00, $F8, 0, 0, 3, 5, $25)
    %spritemapEntry(0, $1FA, $F6, 0, 0, 3, 5, $25)
    %spritemapEntry(0, $1FC, $FB, 0, 0, 3, 5, $25)

Spritemap_CrocomireCorpse_18:
    dw $0003
    %spritemapEntry(0, $01, $F7, 0, 0, 3, 5, $25)
    %spritemapEntry(0, $1F9, $F4, 0, 0, 3, 5, $25)
    %spritemapEntry(0, $1FB, $FA, 0, 0, 3, 5, $25)

Spritemap_CrocomireCorpse_19:
    dw $0003
    %spritemapEntry(0, $01, $F5, 0, 0, 3, 5, $43)
    %spritemapEntry(0, $1FC, $F8, 0, 0, 3, 5, $43)
    %spritemapEntry(0, $1FA, $F1, 0, 0, 3, 5, $43)

Spritemap_CrocomireCorpse_1A:
    dw $0003
    %spritemapEntry(0, $01, $F3, 0, 0, 3, 5, $43)
    %spritemapEntry(0, $1FC, $F5, 0, 0, 3, 5, $43)
    %spritemapEntry(0, $1FA, $EE, 0, 0, 3, 5, $43)

Spritemap_CrocomireCorpse_1B:
    dw $0003
    %spritemapEntry(0, $00, $F0, 0, 0, 3, 5, $40)
    %spritemapEntry(0, $1FC, $F4, 0, 0, 3, 5, $40)
    %spritemapEntry(0, $1FA, $ED, 0, 0, 3, 5, $40)

Spritemap_CrocomireCorpse_1C:
    dw $0003
    %spritemapEntry(0, $00, $EE, 0, 0, 3, 5, $40)
    %spritemapEntry(0, $1FC, $F2, 0, 0, 3, 5, $40)
    %spritemapEntry(0, $1FA, $EC, 0, 0, 3, 5, $40)

Spritemap_CrocomireCorpse_1D:
    dw $0002
    %spritemapEntry(0, $00, $EC, 0, 0, 3, 5, $40)
    %spritemapEntry(0, $1FC, $F0, 0, 0, 3, 5, $40)

Spritemap_CrocomireCorpse_1E:
    dw $0001
    %spritemapEntry(0, $1FC, $EE, 0, 0, 3, 5, $40)

Spritemap_CrocomireCorpse_1F:
    dw $0001
    %spritemapEntry(0, $1FC, $EE, 0, 0, 0, 5, $40)


;;; $F67A: Initialisation AI - enemy $DDFF (Crocomire tongue) ;;;
InitAI_CrocomireTongue:
    LDX.W AreaIndex
    LDA.L SRAMMirror_Boss,X : BIT.W #$0002 : BNE .dead
    LDX.W EnemyIndex
    LDA.W #InstList_CrocomireTongue_Fight : STA.W Enemy.instList,X
    LDA.W Enemy.properties2,X : ORA.W #$0404 : STA.W Enemy.properties2,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDA.W #$0017 : STA.W CrocomireTongue.XOffsetFromCrocomire,X
    LDA.W #$0E00 : STA.W Enemy.palette,X
    RTL

  .dead:
    LDX.W EnemyIndex
    LDA.W Enemy.properties,X : ORA.W #$0300 : AND.W #$DFFF : STA.W Enemy.properties,X
    RTL


;;; $F6BB: RTL. Main AI - enemy $DDFF (Crocomire tongue) ;;;
MainAI_CrocomireTongue:
    LDX.W EnemyIndex
    RTL


;;; $F6BF: RTL ;;;
RTL_A4F6BF:
    RTL


Freespace_BankA4_F6C0:
; $940 bytes
