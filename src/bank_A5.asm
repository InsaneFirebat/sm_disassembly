
org $A58000


; Common to all enemy code banks

;;; $8000: Grapple AI - no interaction. Also unfreezes enemies(!) ;;;
CommonA5_GrappleAI_NoInteraction:
; Used by skultera, Draygon body, fire arc, Phantoon, etecoon, dachora and WS ghost
    JSL GrappleAI_SwitchEnemyAIToMainAI
    RTL


;;; $8005: Grapple AI - Samus latches on ;;;
CommonA5_GrappleAI_SamusLatchesOn:
; Used by gripper and Crocomire
    JSL GrappleAI_SamusLatchesOnWithGrapple
    RTL


;;; $800A: Grapple AI - kill enemy ;;;
CommonA5_GrappleAI_KillEnemy:
; Common
    JSL GrappleAI_EnemyGrappleDeath
    RTL


;;; $800F: Grapple AI - cancel grapple beam ;;;
CommonA5_GrappleAI_CancelGrappleBeam:
; Common
    JSL GrappleAI_SwitchToFrozenAI
    RTL


;;; $8014: Grapple AI - Samus latches on - no invincibility ;;;
CommonA5_GrappleAI_SamusLatchesOn_NoInvincibility:
; Used by powamp
    JSL GrappleAI_SamusLatchesOnWithGrapple_NoInvincibility
    RTL


;;; $8019: Unused. Grapple AI - Samus latches on - paralyse enemy ;;;
UNUSED_CommonA5_GrappleAI_SamusLatchesOn_ParalyzeEnemy_A58019:
    JSL GrappleAI_SamusLatchesOnWithGrapple_ParalyzeEnemy
    RTL


;;; $801E: Grapple AI - hurt Samus ;;;
CommonA5_GrappleAI_HurtSamus:
; Used by WS spark
; Hurt reaction happens in $9B:B932
    JSL GrappleAI_SwitchToFrozenAI_duplicate
    RTL


;;; $8023: Normal enemy touch AI ;;;
CommonA5_NormalEnemyTouchAI:
    JSL NormalEnemyTouchAI
    RTL


;;; $8028: Normal touch AI - no death check ;;;
CommonA5_NormalTouchAI_NoDeathCheck:
    JSL NormalEnemyTouchAI_NoDeathCheck_External
    RTL


;;; $802D: Normal enemy shot AI ;;;
CommonA5_NormalEnemyShotAI:
    JSL NormalEnemyShotAI
    RTL


;;; $8032: Normal enemy shot AI - no death check, no enemy shot graphic ;;;
CommonA5_NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic:
    JSL NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External
    RTL


;;; $8037: Normal enemy power bomb AI ;;;
CommonA5_NormalEnemyPowerBombAI:
    JSL NormalEnemyPowerBombAI
    RTL


;;; $803C: Normal enemy power bomb AI - no death check ;;;
CommonA5_NormalEnemyPowerBombAI_NoDeathCheck:
; Kraid's power bomb AI
    JSL NormalEnemyPowerBombAI_NoDeathCheck_External
    RTL


;;; $8041: Normal enemy frozen AI ;;;
CommonA5_NormalEnemyFrozenAI:
    JSL NormalEnemyFrozenAI
    RTL


;;; $8046: Creates a dud shot ;;;
CommonA5_CreateADudShot:
    JSL CreateADudShot
    RTL


;;; $804B: RTS ;;;
RTS_A5804B:
    RTS


;;; $804C: RTL ;;;
RTL_A5804C:
    RTL


;;; $804D: Spritemap - nothing ;;;
Spritemap_CommonA5_Nothing:
    dw $0000


;;; $804F: Extended spritemap - nothing ;;;
ExtendedSpritemap_CommonA5_Nothing:
    dw $0001
    dw $0000,$0000
    dw Spritemap_CommonA5_Nothing
    dw Hitbox_CommonA5_Nothing


;;; $8059: Hitbox - nothing ;;;
Hitbox_CommonA5_Nothing:
; [n entries] [[left offset] [top offset] [right offset] [bottom offset] [p touch] [p shot]]...
    dw $0001
    dw $0000,$0000,$0000,$0000
    dw CommonA5_NormalEnemyTouchAI
    dw CommonA5_NormalEnemyShotAI


;;; $8067: Instruction list - delete enemy ;;;
InstList_CommonA5_DeleteEnemy:
    dw Instruction_CommonA5_DeleteEnemy


;;; $8069: Two NOPs ;;;
NOPNOP_A58069:
; Used as palette by respawning enemy placeholder and Draygon's eye o_O
    NOP #2


;;; $806B: Instruction - Enemy.var5 = [[Y]] ;;;
Instruction_CommonA5_Enemy0FB2_InY:
; Used only by torizos (for enemy movement function) and escape etecoon (for enemy function)
    LDA.W $0000,Y : STA.W Enemy.var5,X
    INY #2
    RTL


;;; $8074: Instruction - Enemy.var5 = RTS ;;;
Instruction_CommonA5_SetEnemy0FB2ToRTS:
    LDA.W #RTS_A5807B : STA.W Enemy.var5,X
    RTL


RTS_A5807B:
    RTS


;;; $807C: Instruction - delete enemy ;;;
Instruction_CommonA5_DeleteEnemy:
    LDA.W Enemy.properties,X : ORA.W #$0200 : STA.W Enemy.properties,X
    PLA
    PEA.W ProcessEnemyInstructions_return-1
    RTL


;;; $808A: Instruction - call function [[Y]] ;;;
Instruction_CommonA5_CallFunctionInY:
    LDA.W $0000,Y : STA.B DP_Temp12
    PHY : PHX
    PEA .manualReturn-1
    JMP.W (DP_Temp12)

  .manualReturn:
    PLX : PLY
    INY #2
    RTL


;;; $809C: Instruction - call function [[Y]] with A = [[Y] + 2] ;;;
Instruction_CommonA5_CallFunctionInY_WithA:
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
UNUSED_Instruction_CommonA5_CallExternalFunctionInY_A580B5:
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
UNUSED_Inst_CommonA5_CallExternalFunctionInY_WithA_A580CE:
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
Instruction_CommonA5_GotoY:
    LDA.W $0000,Y : TAY
    RTL


;;; $80F2: Instruction - go to [[Y]] + ±[[Y]] ;;;
Instruction_CommonA5_GotoY_PlusY:
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
Instruction_CommonA5_DecrementTimer_GotoYIfNonZero:
    DEC.W Enemy.loopCounter,X : BNE Instruction_CommonA5_GotoY
    INY #2
    RTL


;;; $8110: Instruction - decrement timer and go to [[Y]] if non-zero ;;;
Instruction_CommonA5_DecrementTimer_GotoYIfNonZero_duplicate:
    DEC.W Enemy.loopCounter,X : BNE Instruction_CommonA5_GotoY
    INY #2
    RTL


;;; $8118: Instruction - decrement timer and go to [Y] + ±[[Y]] if non-zero ;;;
Instruction_CommonA5_DecrementTimer_GotoY_PlusY_IfNonZero:
    SEP #$20
    DEC.W Enemy.loopCounter,X
    REP #$20
    BNE Instruction_CommonA5_GotoY_PlusY
    INY
    RTL


;;; $8123: Instruction - timer = [[Y]] ;;;
Instruction_CommonA5_TimerInY:
    LDA.W $0000,Y : STA.W Enemy.loopCounter,X
    INY #2
    RTL


;;; $812C: Instruction - skip next instruction ;;;
Instruction_CommonA5_SkipNextInstruction:
    INY #2
    RTL


;;; $812F: Instruction - sleep ;;;
Instruction_CommonA5_Sleep:
    DEY #2
    TYA : STA.W Enemy.instList,X
    PLA
    PEA.W ProcessEnemyInstructions_return-1
    RTL


;;; $813A: Instruction - wait [[Y]] frames ;;;
Instruction_CommonA5_WaitYFrames:
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
Instruction_CommonA5_TransferYBytesInYToVRAM:
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
Instruction_CommonA5_EnableOffScreenProcessing:
    LDA.W Enemy.properties,X : ORA.W #$0800 : STA.W Enemy.properties,X
    RTL


;;; $817D: Instruction - disable off-screen processing ;;;
Instruction_CommonA5_DisableOffScreenProcessing:
    LDA.W Enemy.properties,X : AND.W #$F7FF : STA.W Enemy.properties,X
    RTL


;;; $8187: Common enemy speeds - linearly increasing ;;;
CommonA5EnemySpeeds_LinearlyIncreasing:
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
CommonA5EnemySpeeds_QuadraticallyIncreasing:
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


;;; $8687: Initialisation AI - enemy $DE3F (Draygon body) ;;;
InitAI_DraygonBody:
; Draygon's making the error of trying to set the instruction list pointer of enemies that haven't yet spawned
; When an enemy spawns, its RAM gets cleared or initialised from enemy header, so these stores have no effect
; The enemies set their own instruction list pointers in their init AI, which match up except for the arms, which use InstList_DraygonArms_FacingLeft_Idle_0 instead of InstList_DraygonArms_FacingLeft_NearSwoopApex
    LDX.W #$0030

  .loopTargetPalette:
    LDA.W Palette_Draygon_Sprite1,X : STA.L TargetPalettes_SpriteP1,X
    DEX #2 : BPL .loopTargetPalette
    LDX.W #Enemy[2].YPosition
    LDA.W #$0338

  .loopBG2Tilemap:
    STA.L EnemyBG2Tilemap,X
    DEX #2 : BPL .loopBG2Tilemap
    LDX.W EnemyIndex
    LDA.W #$0700 : ASL : STA.W Enemy.palette,X
    LDA.W #EnemyGraphicsDrawnHook_Draygon_SetBG2XYScroll>>16 : STA.W EnemyGraphicsDrawnHook+2
    LDA.W #EnemyGraphicsDrawnHook_Draygon_SetBG2XYScroll : STA.W EnemyGraphicsDrawnHook
    LDA.W #$FFFF : STA.W GlobalOffScreenEnemyProcessingFlag
    LDA.W #InstList_DraygonBody_FacingLeft_Idle : STA.W Enemy.instList
    LDA.W #InstList_DraygonEye_FacingLeft_Idle : STA.W Enemy[1].instList
    LDA.W #InstList_DraygonTail_FacingLeft_FakeTailWhip : STA.W Enemy[2].instList
    LDA.W #InstList_DraygonArms_FacingLeft_NearSwoopApex : STA.W Enemy[3].instList
    LDA.W #$0400 : STA.W EnemyBG2TilemapSize
    LDA.W #Function_DraygonBody_FightIntro_InitialDelay : STA.W DraygonBody.function,X
    JSL Spawn_DraygonMainScreenLayers_HDMAObject
    LDA.W #$000C : STA.B DP_RoomLoadIRQCmd
    JSL Spawn_BG3_Scroll_HDMA_Object
    LDA.W #$0001 : STA.L ExtraEnemy8800+$A
    JSL DisableMinimap_MarkBossRoomTilesExplored
    RTL


;;; $86FC: Main AI - enemy $DE3F (Draygon body) ;;;
MainAI_DraygonBody:
    LDX.W EnemyIndex
    JSR.W (DraygonBody.function,X)
    LDA.W Enemy.XPosition : STA.W Enemy[1].XPosition
    STA.W Enemy[2].XPosition : STA.W Enemy[3].XPosition
    LDA.W Enemy.YPosition : STA.W Enemy[1].YPosition
    STA.W Enemy[2].YPosition : STA.W Enemy[3].YPosition
    RTL


;;; $871B: Draygon body function - fight intro - initial delay ;;;
Function_DraygonBody_FightIntro_InitialDelay:
    JSR HandleFiringWallTurret
    LDX.W EnemyIndex ; >.<
    LDA.W DraygonBody.functionTimer : CMP.W #$0100 : BPL .done
    LDA.W DraygonBody.functionTimer : BNE .incFunctionTimer
    LDX.W VRAMWriteStack
    LDA.W #$0600 : STA.B VRAMWrite.size,X
    LDA.W #Tiles_Evir : STA.B VRAMWrite.src,X
    LDA.W #Tiles_Evir>>16 : STA.B VRAMWrite.src+2,X
    LDA.W #$6D00 : STA.B VRAMWrite.dest,X
    LDA.W VRAMWriteStack : CLC : ADC.W #$0007 : STA.W VRAMWriteStack
    JSR SpawnFightIntroEvirSpriteObjects

  .incFunctionTimer:
    INC.W DraygonBody.functionTimer
    RTS

  .done:
    LDA.W #Function_DraygonBody_FightIntro_Dance : STA.W DraygonBody.function
    STZ.W DraygonBody.functionTimer
    LDA.W Enemy.XPosition : STA.L DraygonBody.leftSideResetXPosition
    CLC : ADC.W #$02A0 : STA.L DraygonBody.rightSideResetXPosition
    LDA.W Enemy.YPosition : STA.L DraygonBody.resetYPosition
    LDA.L DraygonBody.leftSideResetXPosition : STA.W Enemy.XPosition ; >.<
    LDA.L DraygonBody.resetYPosition : STA.W Enemy.YPosition ; >.<
    LDA.W #$0018 : STA.L DraygonBody.swoopYAcceleration
    RTS


;;; $878B: Draygon body function - fight intro - dance ;;;
Function_DraygonBody_FightIntro_Dance:
    JSR HandleFiringWallTurret
    LDX.W EnemyIndex ; >.<
    LDA.W DraygonBody.functionTimer : CMP.W #$04D0 : BPL .startFight
    JSR HandleDraygonFightIntroDance
    INC.W DraygonBody.functionTimer
    RTS

  .startFight:
    LDA.W #Function_DraygonBody_SwoopRight_Setup : STA.W DraygonBody.function
    STZ.W DraygonBody.functionTimer
    RTS


;;; $87AA: Handle firing wall turret ;;;
HandleFiringWallTurret:
    LDA.W NMI_FrameCounter : AND.W #$003F : BNE .return
    JSL GenerateRandomNumber
    AND.W #$0003 : CLC : ADC.W #$0002 : ASL : TAX
    ASL : TAY
    LDA.L ExtraEnemy8800,X : BNE .return
    LDA.W .XPosition,Y : STA.B DP_Temp12
    LDA.W .YPosition,Y : STA.B DP_Temp14
    LDY.W #EnemyProjectile_DraygonWallTurret
    LDA.W #$0003
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics

  .return:
    RTS

; X/Y positions to spawn turret projectiles. First two entries are unused... and last entry is made unused by init AI
  .XPosition:
    dw $0040
  .YPosition:
    dw       $0060
    dw $0038,$00C0
    dw $0034,$012F ; Left turret
    dw $01CC,$0101 ; Top right turret
    dw $01CC,$015E ; Bottom right turret
    dw $01BC,$0188


;;; $87F4: Draygon body function - swoop right - setup ;;;
Function_DraygonBody_SwoopRight_Setup:
    JSR HandleFiringWallTurret
    LDX.W EnemyIndex ; >.<
    JSR CalculateDraygonSwoopYPositions
    LDA.W #Function_DraygonBody_SwoopRight_Descending : STA.W DraygonBody.function
    LDA.W #InstList_DraygonBody_FacingRight_Reset : STA.W Enemy.instList
    LDA.W #$0001 : STA.W Enemy.instTimer
    LDA.W #$0001 : STA.L DraygonBody.facingDirection
    RTS


;;; $8817: Calculate Draygon swoop Y positions ;;;
CalculateDraygonSwoopYPositions:
    LDA.W #$0180 : STA.W Temp_NeverRead0E28
    LDA.W Temp_NeverRead0E28 : STA.W Temp_SwoopYPosition ; >.<
    STZ.W Temp_SwoopYSpeed : STZ.W Temp_SwoopYPositionIndex

  .loop:
    LDX.W EnemyIndex ; >.<
    LDA.L DraygonBody.swoopYAcceleration : CLC : ADC.W Temp_SwoopYSpeed : STA.W Temp_SwoopYSpeed
    XBA : AND.W #$00FF : EOR.W #$FFFF : INC
    CLC : ADC.W Temp_SwoopYPosition : CMP.L DraygonBody.resetYPosition : BMI +
    STA.W Temp_SwoopYPosition
    LDX.W Temp_SwoopYPositionIndex
    STA.L DraygonSwoopYPositions,X
    INC.W Temp_SwoopYPositionIndex : INC.W Temp_SwoopYPositionIndex
    INC.W Temp_SwoopYPositionIndex : INC.W Temp_SwoopYPositionIndex
    LDA.W Temp_SwoopYPositionIndex : CMP.W #$0800 : BMI .loop

  .crash:
    BRA .crash

+   LDA.L DraygonBody.leftSideResetXPosition : BMI .leftSideReset
    SEC : SBC.W SamusXPosition
    JSL NegateA_A0B067
    BRA +

  .leftSideReset:
    JSL NegateA_A0B067
    CLC : ADC.W SamusXPosition
    JSL NegateA_A0B067

+   STA.B DP_Temp2C
    STZ.B DP_Temp2A
    LDA.W Temp_SwoopYPositionIndex : LSR #2 : STA.B DP_Temp2E
    STZ.B DP_Temp30
    JSL UnsignedDivision_32bit_A0B761
    LDA.B DP_Temp2C : STA.W DraygonBody.XSpeed
    LDA.B DP_Temp2A : STA.W DraygonBody.XSubSpeed
    LDA.W Enemy.YPosition
    LDX.W Temp_SwoopYPositionIndex
    STA.L DraygonSwoopYPositions,X
    STX.W DraygonBody.swoopYPositionIndex : STX.W DraygonBody.swoopDuration
    RTS


;;; $88B1: Draygon body function - swoop right - descending ;;;
Function_DraygonBody_SwoopRight_Descending:
    JSR HandleFiringWallTurret
    JSR HandleShortDraygonBreathBubbles
    LDY.W EnemyIndex
    LDX.W DraygonBody.swoopYPositionIndex : CPX.W #$0068 : BNE .notIndex68
    LDA.W #InstList_DraygonArms_FacingRight_NearSwoopApex : STA.W Enemy[3].instList
    LDA.W #$0001 : STA.W Enemy[3].instTimer

  .notIndex68:
    LDA.L DraygonSwoopYPositions,X : STA.W Enemy.YPosition,Y
    DEC.W DraygonBody.swoopYPositionIndex : DEC.W DraygonBody.swoopYPositionIndex
    DEC.W DraygonBody.swoopYPositionIndex : DEC.W DraygonBody.swoopYPositionIndex
    LDA.W DraygonBody.swoopYPositionIndex : BEQ .apex
    LDA.W Enemy.XSubPosition : CLC : ADC.W DraygonBody.XSubSpeed : STA.W Enemy.XSubPosition
    LDA.W Enemy.XPosition : ADC.W DraygonBody.XSpeed : STA.W Enemy.XPosition
    RTS

  .apex:
    LDA.W #Function_DraygonBody_SwoopRight_Apex : STA.W DraygonBody.function
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $8901: Unused.  ;;;
UNUSED_Draygon_FireGoop_A58901:
; Fire goop?
    LDA.W NMI_FrameCounter : AND.W #$000F : BNE .return
    LDA.W #InstList_DraygonBody_FacingLeft_FireGoop : STA.W Enemy.instList
    LDA.L DraygonBody.facingDirection : BEQ .keepLeft
    LDA.W #InstList_DraygonBody_FacingRight_FireGoop : STA.W Enemy.instList

  .keepLeft:
    LDA.W #$0001 : STA.W Enemy.instTimer

  .return:
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $8922: Draygon body function - swoop right - apex ;;;
Function_DraygonBody_SwoopRight_Apex:
    JSR HandleFiringWallTurret
    LDX.W EnemyIndex ; >.<
    LDA.W #$02A0 : SEC : SBC.W Enemy.XPosition : STA.B DP_Temp2C
    STZ.B DP_Temp2A
    LDA.W DraygonBody.swoopDuration : LSR #2 : STA.B DP_Temp2E
    STZ.B DP_Temp30
    JSL UnsignedDivision_32bit_A0B761
    LDA.B DP_Temp2C : STA.W DraygonBody.XSpeed
    LDA.B DP_Temp2A : STA.W DraygonBody.XSubSpeed
    LDA.W #Function_DraygonBody_SwoopRight_Ascending : STA.W DraygonBody.function
    RTS


;;; $8951: Draygon body function - swoop right - ascending ;;;
Function_DraygonBody_SwoopRight_Ascending:
; [random number] % 2: 0 = goop, 1 = swoop
    JSR HandleFiringWallTurret
    LDY.W EnemyIndex
    LDX.W DraygonBody.swoopYPositionIndex : CPX.W #$0068 : BNE .notIndex68
    LDA.W #InstList_DraygonArms_FacingRight_Idle_0 : STA.W Enemy[3].instList
    LDA.W #$0001 : STA.W Enemy[3].instTimer

  .notIndex68:
    LDA.L DraygonSwoopYPositions,X : STA.W Enemy.YPosition,Y
    INC.W DraygonBody.swoopYPositionIndex : INC.W DraygonBody.swoopYPositionIndex
    INC.W DraygonBody.swoopYPositionIndex : INC.W DraygonBody.swoopYPositionIndex
    LDA.W DraygonBody.swoopYPositionIndex : CMP.W DraygonBody.swoopDuration : BEQ +
    LDA.W Enemy.XSubPosition : CLC : ADC.W DraygonBody.XSubSpeed : STA.W Enemy.XSubPosition
    LDA.W Enemy.XPosition : ADC.W DraygonBody.XSpeed : STA.W Enemy.XPosition
    RTS

+   STZ.W DraygonBody.swoopYPositionIndex
    LDA.W RandomNumberSeed : AND.W #$0001 : BEQ .goopLeft
    LDA.W #Function_DraygonBody_SwoopLeft_Setup : STA.W DraygonBody.function
    RTS

  .goopLeft:
    LDA.W #Function_DraygonBody_GoopLeft_Setup : STA.W DraygonBody.function
    RTS


;;; $89B3: Draygon body function - swoop left - setup ;;;
Function_DraygonBody_SwoopLeft_Setup:
; Uses Temp_SwoopYPositionIndex(!) which was calculated as part of CalculateDraygonSwoopYPositions
; DraygonBody.swoopDuration contains the same value and is part of enemy RAM instead of a random temporary >_<;
    JSR HandleFiringWallTurret
    LDX.W EnemyIndex ; >.<
    LDA.L DraygonBody.rightSideResetXPosition : SEC : SBC.W SamusXPosition
    JSL NegateA_A0B067
    STA.B DP_Temp2C
    STZ.B DP_Temp2A
    LDA.W Temp_SwoopYPositionIndex : LSR #2 : STA.B DP_Temp2E
    STZ.B DP_Temp30
    JSL UnsignedDivision_32bit_A0B761
    LDA.B DP_Temp2C : STA.W DraygonBody.XSpeed
    LDA.B DP_Temp2A : STA.W DraygonBody.XSubSpeed
    LDA.W #Function_DraygonBody_SwoopLeft_Descending : STA.W DraygonBody.function
    LDA.W #InstList_DraygonBody_FacingLeft_Reset : STA.W Enemy.instList
    LDA.W #$0001 : STA.W Enemy.instTimer
    LDA.W #$0000 : STA.L DraygonBody.facingDirection
    LDA.W DraygonBody.swoopDuration : STA.W DraygonBody.swoopYPositionIndex
    RTS


;;; $8A00: Draygon body function - swoop left - descending ;;;
Function_DraygonBody_SwoopLeft_Descending:
    JSR HandleFiringWallTurret
    JSR HandleShortDraygonBreathBubbles
    LDY.W EnemyIndex
    LDX.W DraygonBody.swoopYPositionIndex : CPX.W #$0068 : BNE .notIndex68
    LDA.W #InstList_DraygonArms_FacingLeft_NearSwoopApex : STA.W Enemy[3].instList
    LDA.W #$0001 : STA.W Enemy[3].instTimer

  .notIndex68:
    LDA.L DraygonSwoopYPositions,X : STA.W Enemy.YPosition,Y
    DEC.W DraygonBody.swoopYPositionIndex : DEC.W DraygonBody.swoopYPositionIndex
    DEC.W DraygonBody.swoopYPositionIndex : DEC.W DraygonBody.swoopYPositionIndex
    LDA.W DraygonBody.swoopYPositionIndex : BEQ .apex
    LDA.W Enemy.XSubPosition : SEC : SBC.W DraygonBody.XSubSpeed : STA.W Enemy.XSubPosition
    LDA.W Enemy.XPosition : SBC.W DraygonBody.XSpeed : STA.W Enemy.XPosition
    RTS

  .apex:
    LDA.W #Function_DraygonBody_SwoopLeft_Apex : STA.W DraygonBody.function
    RTS


;;; $8A50: Draygon body function - swoop left - apex ;;;
Function_DraygonBody_SwoopLeft_Apex:
    JSR HandleFiringWallTurret
    LDX.W EnemyIndex ; >.<
    LDA.L DraygonBody.leftSideResetXPosition : BMI .leftSideReset
    LDA.W Enemy.XPosition : SEC : SBC.L DraygonBody.leftSideResetXPosition
    BRA +

  .leftSideReset:
    EOR.W #$FFFF : INC : CLC : ADC.W Enemy.XPosition

+   STA.B DP_Temp2C
    STZ.B DP_Temp2A
    LDA.W DraygonBody.swoopDuration : LSR #2 : STA.B DP_Temp2E
    STZ.B DP_Temp30
    JSL UnsignedDivision_32bit_A0B761
    LDA.B DP_Temp2C : STA.W DraygonBody.XSpeed
    LDA.B DP_Temp2A : STA.W DraygonBody.XSubSpeed
    LDA.W #Function_DraygonBody_SwoopLeft_Ascending : STA.W DraygonBody.function
    RTS


;;; $8A90: Draygon body function - swoop left - ascending ;;;
Function_DraygonBody_SwoopLeft_Ascending:
; [random number] % 2: 0 = goop, 1 = swoop
    JSR HandleFiringWallTurret
    JSR HandleShortDraygonBreathBubbles
    LDY.W EnemyIndex
    LDX.W DraygonBody.swoopYPositionIndex : CPX.W #$0068 : BNE +
    LDA.W #InstList_DraygonArms_FacingLeft_Idle_0 : STA.W Enemy[3].instList
    LDA.W #$0001 : STA.W Enemy[3].instTimer

+   LDA.L DraygonSwoopYPositions,X : STA.W Enemy.YPosition,Y
    INC.W DraygonBody.swoopYPositionIndex : INC.W DraygonBody.swoopYPositionIndex
    INC.W DraygonBody.swoopYPositionIndex : INC.W DraygonBody.swoopYPositionIndex
    LDA.W DraygonBody.swoopYPositionIndex : CMP.W DraygonBody.swoopDuration : BEQ .chooseAttack
    LDA.W Enemy.XSubPosition : SEC : SBC.W DraygonBody.XSubSpeed : STA.W Enemy.XSubPosition
    LDA.W Enemy.XPosition : SBC.W DraygonBody.XSpeed : STA.W Enemy.XPosition
    RTS

  .chooseAttack:
    LDA.W RandomNumberSeed : AND.W #$0001 : BEQ .goop
    LDA.W #Function_DraygonBody_SwoopRight_Setup : STA.W DraygonBody.function
    STZ.W DraygonBody.swoopYPositionIndex
    LDA.L DraygonBody.leftSideResetXPosition : STA.W Enemy.XPosition
    LDA.L DraygonBody.resetYPosition : STA.W Enemy.YPosition
    RTS

  .goop:
    LDA.W #Function_DraygonBody_GoopRight_Setup : STA.W DraygonBody.function
    LDA.L DraygonBody.leftSideResetXPosition : STA.W Enemy.XPosition
    RTS


;;; $8B0A: Draygon body function - goop right - setup ;;;
Function_DraygonBody_GoopRight_Setup:
    JSR HandleFiringWallTurret
    LDA.W #$FFB0 : STA.W Enemy.XPosition
    LDA.W #$0180 : STA.W Enemy.YPosition
    LDA.W #$0000 : STA.W DraygonBody.XSubSpeed
    LDA.W #$0001 : STA.W DraygonBody.XSpeed
    LDA.W #$0000 : STA.L DraygonBody.goopYOscillationAngle
    LDA.W #InstList_DraygonArms_FacingRight_NearSwoopApex : STA.W Enemy[3].instList
    LDA.W #$0001 : STA.W Enemy[3].instTimer
    LDA.W #Function_DraygonBody_GoopRight_MoveUntilSamusInRange : STA.W DraygonBody.function
    LDA.W #InstList_DraygonBody_FacingRight_Reset : STA.W Enemy.instList
    LDA.W #$0001 : STA.W Enemy.instTimer
    LDA.W #$0001 : STA.L DraygonBody.facingDirection
    RTS


;;; $8B52: Draygon body function - goop right - move until Samus in range ;;;
Function_DraygonBody_GoopRight_MoveUntilSamusInRange:
    JSR HandleFiringWallTurret
    JSR HandleShortDraygonBreathBubbles
    LDA.W Enemy.XPosition : SEC : SBC.W SamusXPosition
    JSL NegateA_A0B067
    CMP.W #$00D0 : BPL .tooFar
    LDA.W #Function_DraygonBody_GoopRight_FiringGoops : STA.W DraygonBody.function
    LDA.W #$0010 : STA.L DraygonBody.goopCounter
    RTS

  .tooFar:
    LDA.W #$0020 : STA.W Temp_TargetYPosition
    LDA.L DraygonBody.goopYOscillationAngle
    JSL EightBitCosineMultiplication_A0B0B2
    CLC : ADC.W #$0180 : STA.W Enemy.YPosition
    LDA.L DraygonBody.goopYOscillationAngle : CLC : ADC.W #$0001 : AND.W #$00FF : STA.L DraygonBody.goopYOscillationAngle
    LDA.W Enemy.XSubPosition : CLC : ADC.W DraygonBody.XSubSpeed : STA.W Enemy.XSubPosition
    LDA.W Enemy.XPosition : ADC.W DraygonBody.XSpeed : STA.W Enemy.XPosition
    RTS


;;; $8BAE: Draygon body function - goop right - firing goops ;;;
Function_DraygonBody_GoopRight_FiringGoops:
    JSR HandleFiringWallTurret
    LDA.W XSpeedDivisor : BNE .SamusGooped
    LDA.W RandomNumberSeed : AND.W #$000F : BNE .noGoop
    LDA.L DraygonBody.goopCounter : DEC : STA.L DraygonBody.goopCounter : BEQ .reloadSpeedDivisor
    LDY.W #InstList_DraygonBody_FacingRight_FireGoop : STY.W Enemy.instList
    LDA.W #$0001 : STA.W Enemy.instTimer

  .noGoop:
    LDA.W #$0020 : STA.W Temp_TargetYPosition
    LDA.L DraygonBody.goopYOscillationAngle
    JSL EightBitCosineMultiplication_A0B0B2
    CLC : ADC.W #$0180 : STA.W Enemy.YPosition
    LDA.L DraygonBody.goopYOscillationAngle : CLC : ADC.W #$0001 : AND.W #$00FF : STA.L DraygonBody.goopYOscillationAngle
    LDA.W Enemy.XSubPosition : CLC : ADC.W DraygonBody.XSubSpeed : STA.W Enemy.XSubPosition
    LDA.W Enemy.XPosition : ADC.W DraygonBody.XSpeed : STA.W Enemy.XPosition : BMI .return
    CMP.W #$02A0 : BPL .reloadSpeedDivisor

  .return:
    RTS

  .reloadSpeedDivisor:
    LDA.W XSpeedDivisor : BEQ .done

  .SamusGooped:
    LDA.W #Function_DraygonBody_ChaseSamus : STA.W DraygonBody.function
    RTS

  .done:
    LDA.W #InstList_DraygonArms_FacingRight_Idle_0 : STA.W Enemy[3].instList
    LDA.W #$0001 : STA.W Enemy[3].instTimer
    LDA.W #Function_DraygonBody_GoopRight_MoveUntilOffScreen : STA.W DraygonBody.function
    RTS


;;; $8C33: Draygon body function - goop right - move until off-screen ;;;
Function_DraygonBody_GoopRight_MoveUntilOffScreen:
    JSR HandleShortDraygonBreathBubbles
    LDA.W #$0020 : STA.W Temp_TargetYPosition
    LDA.L DraygonBody.goopYOscillationAngle
    JSL EightBitCosineMultiplication_A0B0B2
    CLC : ADC.W #$0180 : STA.W Enemy.YPosition
    LDA.L DraygonBody.goopYOscillationAngle : CLC : ADC.W #$0001 : AND.W #$00FF : STA.L DraygonBody.goopYOscillationAngle
    LDA.W Enemy.XSubPosition : CLC : ADC.W DraygonBody.XSubSpeed : STA.W Enemy.XSubPosition
    LDA.W Enemy.XPosition : ADC.W DraygonBody.XSpeed : STA.W Enemy.XPosition : BMI .return
    CMP.W #$02A0 : BPL .done

  .return:
    RTS

  .done:
    LDA.W #Function_DraygonBody_SwoopLeft_Setup : STA.W DraygonBody.function
    LDA.W #$0250 : STA.W Enemy.XPosition
    LDA.W #$FFB0 : STA.W Enemy.YPosition
    LDA.W DraygonBody.swoopDuration : STA.W DraygonBody.swoopYPositionIndex
    RTS


;;; $8C8E: Draygon body function - goop left - setup ;;;
Function_DraygonBody_GoopLeft_Setup:
    LDA.L DraygonBody.rightSideResetXPosition : STA.W Enemy.XPosition
    LDA.W #$0180 : STA.W Enemy.YPosition
    LDA.W #$0000 : STA.W DraygonBody.XSubSpeed
    LDA.W #$0001 : STA.W DraygonBody.XSpeed
    LDA.W #$0000 : STA.L DraygonBody.goopYOscillationAngle
    LDA.W #InstList_DraygonArms_FacingRight_NearSwoopApex : STA.W Enemy[3].instList
    LDA.W #$0001 : STA.W Enemy[3].instTimer
    LDA.W #Function_DraygonBody_GoopLeft_MoveUntilSamusInRange : STA.W DraygonBody.function
    LDA.W #InstList_DraygonBody_FacingLeft_Reset : STA.W Enemy.instList
    LDA.W #$0001 : STA.W Enemy.instTimer
    LDA.W #$0000 : STA.L DraygonBody.facingDirection
    RTS


;;; $8CD4: Draygon body function - goop left - move until Samus in range ;;;
Function_DraygonBody_GoopLeft_MoveUntilSamusInRange:
    JSR HandleFiringWallTurret
    JSR HandleShortDraygonBreathBubbles
    LDA.W Enemy.XPosition : SEC : SBC.W SamusXPosition
    JSL NegateA_A0B067
    CMP.W #$00D0 : BPL .tooFar
    LDA.W #Function_DraygonBody_GoopLeft_FiringGoops : STA.W DraygonBody.function
    LDA.W #$0010 : STA.L DraygonBody.goopCounter
    RTS

  .tooFar:
    LDA.W #$0020 : STA.W Temp_TargetYPosition
    LDA.L DraygonBody.goopYOscillationAngle
    JSL EightBitCosineMultiplication_A0B0B2
    CLC : ADC.W #$0180 : STA.W Enemy.YPosition
    LDA.L DraygonBody.goopYOscillationAngle : CLC : ADC.W #$0001 : AND.W #$00FF : STA.L DraygonBody.goopYOscillationAngle
    LDA.W Enemy.XSubPosition : SEC : SBC.W DraygonBody.XSubSpeed : STA.W Enemy.XSubPosition
    LDA.W Enemy.XPosition : SBC.W DraygonBody.XSpeed : STA.W Enemy.XPosition
    RTS


;;; $8D30: Draygon body function - goop left - firing goops ;;;
Function_DraygonBody_GoopLeft_FiringGoops:
    LDA.W XSpeedDivisor : BNE .SamusGooped
    LDA.W RandomNumberSeed : AND.W #$000F : BNE .noGoop
    LDA.L DraygonBody.goopCounter : DEC : STA.L DraygonBody.goopCounter : BEQ .reloadSpeedDivisor
    LDY.W #InstList_DraygonBody_FacingLeft_FireGoop : STY.W Enemy.instList
    LDA.W #$0001 : STA.W Enemy.instTimer

  .noGoop:
    LDA.W #$0020 : STA.W Temp_TargetYPosition
    LDA.L DraygonBody.goopYOscillationAngle
    JSL EightBitCosineMultiplication_A0B0B2
    CLC : ADC.W #$0180 : STA.W Enemy.YPosition
    LDA.L DraygonBody.goopYOscillationAngle : CLC : ADC.W #$0001 : AND.W #$00FF : STA.L DraygonBody.goopYOscillationAngle
    LDA.W Enemy.XSubPosition : SEC : SBC.W DraygonBody.XSubSpeed : STA.W Enemy.XSubPosition
    LDA.W Enemy.XPosition : SBC.W DraygonBody.XSpeed : STA.W Enemy.XPosition : BPL .return
    CMP.W #$FFB0 : BMI .reloadSpeedDivisor

  .return:
    RTS

  .reloadSpeedDivisor:
    LDA.W XSpeedDivisor : BEQ .done

  .SamusGooped:
    LDA.W #Function_DraygonBody_ChaseSamus : STA.W DraygonBody.function
    RTS

  .done:
    LDA.W #InstList_DraygonArms_FacingLeft_Idle_0 : STA.W Enemy[3].instList
    LDA.W #$0001 : STA.W Enemy[3].instTimer
    LDA.W #Function_DraygonBody_GoopLeft_MoveUntilOffScreen : STA.W DraygonBody.function
    RTS


;;; $8DB2: Draygon body function - goop left - move until off-screen ;;;
Function_DraygonBody_GoopLeft_MoveUntilOffScreen:
    JSR HandleShortDraygonBreathBubbles
    LDA.W XSpeedDivisor : BNE .SamusGooped
    LDA.W #$0020 : STA.W Temp_TargetYPosition
    LDA.L DraygonBody.goopYOscillationAngle
    JSL EightBitCosineMultiplication_A0B0B2
    CLC : ADC.W #$0180 : STA.W Enemy.YPosition
    LDA.L DraygonBody.goopYOscillationAngle : CLC : ADC.W #$0001 : AND.W #$00FF : STA.L DraygonBody.goopYOscillationAngle
    LDA.W Enemy.XSubPosition : SEC : SBC.W DraygonBody.XSubSpeed : STA.W Enemy.XSubPosition
    LDA.W Enemy.XPosition : SBC.W DraygonBody.XSpeed : STA.W Enemy.XPosition : BPL .return
    CMP.W #$FFB0 : BMI .done

  .return:
    RTS

  .SamusGooped:
    LDA.W #Function_DraygonBody_ChaseSamus : STA.W DraygonBody.function
    RTS

  .done:
    LDA.W #Function_DraygonBody_SwoopRight_Setup : STA.W DraygonBody.function
    LDA.W #$FFB0 : STA.W Enemy.XPosition
    LDA.W #$FFB0 : STA.W Enemy.YPosition
    LDA.W DraygonBody.swoopDuration : STA.W DraygonBody.swoopYPositionIndex
    RTS


;;; $8E19: Draygon body function - chase Samus ;;;
Function_DraygonBody_ChaseSamus:
    JSR HandleFiringWallTurret
    LDA.W XSpeedDivisor : BNE .SamusStillGooped
    LDA.W #Function_DraygonBody_GrabbedSamus_FlyStraightUp : STA.W DraygonBody.function
    RTS

  .SamusStillGooped:
    LDA.W Enemy.properties : ORA.W #$0400 : STA.W Enemy.properties
    LDY.W #$0008
    LDA.L DraygonBody.facingDirection : BNE .notLeft
    LDY.W #$FFF8

  .notLeft:
    TYA : CLC : ADC.W Enemy.XPosition
    SEC : SBC.W SamusXPosition
    JSL NegateA_A0B067
    CMP.W #$0008 : BPL .notGrabbed
    LDA.W Enemy.YPosition : SEC : SBC.W SamusYPosition
    JSL NegateA_A0B067
    CMP.W #$0008 : BPL .notGrabbed
    BRA .grab

  .notGrabbed:
    LDA.W SamusXPosition : SEC : SBC.W Enemy.XPosition : STA.B DP_Temp12
    LDA.W SamusYPosition : SEC : SBC.W Enemy.YPosition : STA.B DP_Temp14
    JSL CalculateAngleOf_12_14_Offset
    EOR.W #$00FF : INC
    CLC : ADC.W #$0040 : AND.W #$00FF : STA.W Temp_AngleToMove : STA.B DP_Temp12
    LDA.W #$0002 : STA.B DP_Temp14
    JSL Do_Some_Math_With_Sine_Cosine_Terrible_Label_Name ; ($16.$18, $1A.$1C) = ([$14] * |cos([$12] * pi / 80h)|, [$14] * |sin([$12] * pi / 80h)|)
    LDA.B DP_Temp16 : STA.W Temp_XSpeed
    LDA.B DP_Temp18 : STA.W Temp_XSubSpeed
    LDA.B DP_Temp1A : STA.W Temp_YSpeed
    LDA.B DP_Temp1C : STA.W Temp_YSubSpeed
    JSL MoveEnemyAccordingToAngleAndXYSpeeds
    RTS

  .grab:
    LDY.W #InstList_DraygonArms_FacingLeft_Grab
    LDA.L DraygonBody.facingDirection : BEQ .keepLeft
    LDY.W #InstList_DraygonArms_FacingRight_Grab

  .keepLeft:
    STY.W Enemy[3].instList
    LDA.W #$0001 : STA.W Enemy[3].instTimer
    LDA.W #$000D
    JSL Run_Samus_Command
    AND.W #$FFFF : BNE .retreat
    LDY.W #$0000
    LDA.L DraygonBody.facingDirection : BEQ .left
    LDY.W #$0001

  .left:
    TYA
    JSL SetSamusIntoTheGrabbedByDraygonPose
    LDA.W #$0100 : STA.L DraygonBody.spiralXPosition
    LDA.W #$0180 : STA.L DraygonBody.spiralYPosition
    LDA.W #$0000 : STA.L DraygonBody.spiralXRadius : STA.L DraygonBody.spiralXSubRadius
    LDA.W #$00C0 : STA.L DraygonBody.spiralAngle
    LDA.W #$0800 : STA.L DraygonBody.spiralAngleDelta
    LDA.W #Function_DraygonBody_GrabbedSamus_MovingToTargetPosition : STA.W DraygonBody.function
    RTS

  .retreat:
    LDA.W #Function_DraygonBody_RepelledByGrapple : STA.W DraygonBody.function
    RTS


;;; $8F10: Draygon body function - repelled by grapple ;;;
Function_DraygonBody_RepelledByGrapple:
    LDA.W #GrappleBeamFunction_Dropped : STA.W GrappleBeam_Function
    LDA.W #Function_DraygonBody_GrabbedSamus_FlailTail_FlyStraightUp : STA.W DraygonBody.function
    RTS


;;; $8F1D: Unused. RTS ;;;
RTS_A58F1D:
    RTS


;;; $8F1E: Draygon body function - grabbed Samus - moving to target position ;;;
Function_DraygonBody_GrabbedSamus_MovingToTargetPosition:
    LDA.W GrappleConnectedFlags : BIT.W #$0001 : BEQ .notGrappled
    PHX
    LDX.W Enemy.ID
    LDA.L EnemyHeaders_hurtAITime,X : AND.W #$00FF : CLC : ADC.W #$0008 : STA.W Enemy.flashTimer
    PLX
    LDA.W Enemy.AI : ORA.W #$0002 : STA.W Enemy.AI
    RTS

  .notGrappled:
    LDA.W Enemy.XPosition : SEC : SBC.W #$0100
    JSL NegateA_A0B067
    CMP.W #$0002 : BPL .notReachedTarget
    LDA.W Enemy.YPosition : SEC : SBC.W #$0180
    JSL NegateA_A0B067
    CMP.W #$0002 : BPL .notReachedTarget
    BRA .reachedTargetPosition

  .notReachedTarget:
    LDA.W #$0100 : SEC : SBC.W Enemy.XPosition : STA.B DP_Temp12
    LDA.W #$0180 : SEC : SBC.W Enemy.YPosition : STA.B DP_Temp14
    JSL CalculateAngleOf_12_14_Offset
    EOR.W #$00FF : INC : CLC : ADC.W #$0040
    AND.W #$00FF : STA.W Temp_AngleToMove : STA.B DP_Temp12
    LDA.W #$0002 : STA.B DP_Temp14
    JSL Do_Some_Math_With_Sine_Cosine_Terrible_Label_Name ; ($16.$18, $1A.$1C) = ([$14] * |cos([$12] * pi / 80h)|, [$14] * |sin([$12] * pi / 80h)|)
    LDA.B DP_Temp16 : STA.W Temp_XSpeed
    LDA.B DP_Temp18 : STA.W Temp_XSubSpeed
    LDA.B DP_Temp1A : STA.W Temp_YSpeed
    LDA.B DP_Temp1C : STA.W Temp_YSubSpeed
    JSL MoveEnemyAccordingToAngleAndXYSpeeds
    JSR MoveSamusWithDraygon
    RTS

  .reachedTargetPosition:
    LDA.W #Function_DraygonBody_GrabbedSamus_RisingSpiralMovement : STA.W DraygonBody.function
    LDY.W #InstList_DraygonBody_FacingLeft_Roar
    LDA.L DraygonBody.facingDirection : BEQ .keepLeft
    LDY.W #InstList_DraygonBody_FacingRight_Roar

  .keepLeft:
    TYA : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDA.W Enemy.properties : ORA.W #$0400 : STA.W Enemy.properties
    RTS


;;; $8FD6: Draygon body function - grabbed Samus - rising spiral movement ;;;
Function_DraygonBody_GrabbedSamus_RisingSpiralMovement:
    LDA.W GrappleConnectedFlags : BIT.W #$0001 : BEQ .notGrappled
    PHX
    LDX.W Enemy.ID
    LDA.L EnemyHeaders_hurtAITime,X : AND.W #$00FF : CLC : ADC.W #$0008 : STA.W Enemy.flashTimer
    PLX
    LDA.W Enemy.AI : ORA.W #$0002 : STA.W Enemy.AI
    RTS

  .notGrappled:
    LDA.W RandomNumberSeed : AND.W #$00FF : BNE .noSpank
    LDA.W #$0040 : STA.L DraygonBody.tailWhipTimer
    LDA.W #Function_DraygonBody_GrabbedSamus_TailWhip : STA.W DraygonBody.function
    RTS

  .noSpank:
    LDA.L DraygonBody.spiralXRadius : STA.W Temp_Unknown0E32
    LDA.L DraygonBody.spiralAngle
    JSL EightBitCosineMultiplication_A0B0B2
    CLC : ADC.L DraygonBody.spiralXPosition : STA.W Enemy.XPosition
    LDA.L DraygonBody.spiralXRadius : LSR #2 : STA.W Temp_Unknown0E32
    LDA.L DraygonBody.spiralAngle
    JSL EightBitNegativeSineMultiplication_A0B0C6
    CLC : ADC.L DraygonBody.spiralYPosition : STA.W Enemy.YPosition
    LDA.W Enemy.frameCounter,X : AND.W #$0007 : BNE .noFoam
    LDA.W Enemy.XPosition : SEC : SBC.W #$0020 : STA.B DP_Temp12
    LDA.L DraygonBody.facingDirection : BEQ .left
    LDA.W Enemy.XPosition : CLC : ADC.W #$0020 : STA.B DP_Temp12

  .left:
    LDA.W Enemy.YPosition : SEC : SBC.W #$0010 : STA.B DP_Temp14
    LDA.W #$003D : STA.B DP_Temp16
    STZ.B DP_Temp18
    JSL Create_Sprite_Object

  .noFoam:
    LDA.L DraygonBody.spiralXSubRadius : CLC : ADC.W #$2000 : STA.L DraygonBody.spiralXSubRadius
    LDA.L DraygonBody.spiralXRadius : ADC.W #$0000 : STA.L DraygonBody.spiralXRadius
    CMP.W #$00A0 : BPL .finalSpanking
    LDA.L DraygonBody.spiralAngleDelta : SEC : SBC.W #$0001 : STA.L DraygonBody.spiralAngleDelta
    AND.W #$FF00 : XBA : CLC : ADC.L DraygonBody.spiralAngle
    AND.W #$00FF : STA.L DraygonBody.spiralAngle
    LDA.L DraygonBody.spiralYSubPosition : SEC : SBC.W #$4000 : STA.L DraygonBody.spiralYSubPosition
    LDA.L DraygonBody.spiralYPosition : SBC.W #$0000 : STA.L DraygonBody.spiralYPosition
    CMP.W #$0040 : BMI .finalSpanking
    JSR MoveSamusWithDraygon
    RTS

  .finalSpanking:
    LDA.W #Function_DraygonBody_GrabbedSamus_FinalSpanking_Start : STA.W DraygonBody.function
    RTS


;;; $90D4: Draygon body function - grabbed Samus - tail whip ;;;
Function_DraygonBody_GrabbedSamus_TailWhip:
    JSR MoveSamusWithDraygon
    LDA.L DraygonBody.tailWhipTimer : DEC : STA.L DraygonBody.tailWhipTimer : BEQ .done
    CMP.W #$003F : BEQ .getDirection
    RTS

  .getDirection:
    LDY.W #InstList_DraygonTail_FacingLeft_TailWhip
    LDA.L DraygonBody.facingDirection : BEQ .keepLeft
    LDY.W #InstList_DraygonTail_FacingRight_TailWhip_0

  .keepLeft:
    STY.W Enemy[2].instList
    LDA.W #$0001 : STA.W Enemy[2].instTimer
    RTS

  .done:
    LDA.W #Function_DraygonBody_GrabbedSamus_RisingSpiralMovement : STA.W DraygonBody.function
    RTS


;;; $9105: Draygon body function - grabbed Samus - final tail whips - start ;;;
Function_DraygonBody_GrabbedSamus_FinalSpanking_Start:
    JSR MoveSamusWithDraygon
    LDY.W #InstList_DraygonTail_FacingLeft_FinalTailWhips_0
    LDA.L DraygonBody.facingDirection,X : BEQ .keepLeft
    LDY.W #InstList_DraygonTail_FacingRight_FinalTailWhips_0

  .keepLeft:
    STY.W Enemy[2].instList
    LDA.W #$0001 : STA.W Enemy[2].instTimer
    LDA.W #Function_DraygonBody_GrabbedSamus_FinalSpanking_Ongoing : STA.W DraygonBody.function
    RTS


;;; $9124: Draygon body function - grabbed Samus - final tail whips - ongoing ;;;
Function_DraygonBody_GrabbedSamus_FinalSpanking_Ongoing:
; Draygon tail instruction list eventually sets Draygon body function = Function_DraygonBody_GrabbedSamus_FlailTail_FlyStraightUp
    JSR MoveSamusWithDraygon
    RTS


;;; $9128: Draygon body function - flail tail and fly straight up ;;;
Function_DraygonBody_GrabbedSamus_FlailTail_FlyStraightUp:
    JSL ReleaseSamusFromDraygon_external
    STZ.W GrappleConnectedFlags
    LDA.W #Function_DraygonBody_GrabbedSamus_FlyStraightUp : STA.W DraygonBody.function
    LDA.W Enemy.properties : AND.W #$FBFF : STA.W Enemy.properties
    LDY.W #InstList_DraygonTail_FacingLeft_TailFlail
    LDA.L DraygonBody.facingDirection : BEQ .keepLeft
    LDY.W #InstList_DraygonTail_FacingRight_TailFlail_0

  .keepLeft:
    STY.W Enemy[2].instList
    LDA.W #$0001 : STA.W Enemy[2].instTimer
    RTS


;;; $9154: Draygon body function - fly straight up ;;;
Function_DraygonBody_GrabbedSamus_FlyStraightUp:
    JSR HandleFiringWallTurret
    LDA.W Enemy.YPosition : SEC : SBC.W #$0004 : STA.W Enemy.YPosition : BMI .offScreenTop
    RTS

  .offScreenTop:
    LDA.W Enemy.properties : AND.W #$FBFF : STA.W Enemy.properties
    LDA.W #Function_DraygonBody_SwoopRight_Setup : STA.W DraygonBody.function
    STZ.W DraygonBody.swoopYPositionIndex
    LDA.L DraygonBody.leftSideResetXPosition : STA.W Enemy.XPosition
    LDA.L DraygonBody.resetYPosition : STA.W Enemy.YPosition
    RTS


;;; $9185: Draygon body function - death sequence - drift to death spot ;;;
Function_DraygonBody_DeathSequence_DriftToDeathSpot:
    LDX.W EnemyIndex ; >.<
    LDA.W Enemy.frameCounter,X : AND.W #$000F : BNE .noFoam
    LDA.W Enemy.XPosition : SEC : SBC.W #$0020 : STA.B DP_Temp12
    LDA.L DraygonBody.facingDirection : BEQ .left
    LDA.W Enemy.XPosition : CLC : ADC.W #$0020 : STA.B DP_Temp12

  .left:
    LDA.W Enemy.YPosition : SEC : SBC.W #$0010 : STA.B DP_Temp14
    LDA.W #$003D : STA.B DP_Temp16
    STZ.B DP_Temp18
    JSL Create_Sprite_Object

  .noFoam:
    LDA.W Enemy.XPosition
    LSR #2
    STA.B DP_Temp12
    LDA.W #$0100 : LSR #2 : SEC : SBC.B DP_Temp12 : STA.B DP_Temp12 ; >.<
    LDA.W Enemy.YPosition : LSR #2 : STA.B DP_Temp14
    LDA.W #$01E0 : LSR #2 : SEC : SBC.B DP_Temp14 : STA.B DP_Temp14 ; >.<
    JSL CalculateAngleOf_12_14_Offset
    SEC : SBC.W #$0040 : EOR.W #$FFFF : INC
    AND.W #$00FF : STA.L ExtraEnemy8800+6
    LDA.W #$0001 : STA.B DP_Temp14
    LDA.L ExtraEnemy8800+6 : AND.W #$00FF : STA.B DP_Temp12
    JSL Do_Some_Math_With_Sine_Cosine_Terrible_Label_Name ; ($16.$18, $1A.$1C) = ([$14] * |cos([$12] * pi / 80h)|, [$14] * |sin([$12] * pi / 80h)|)
    LDA.B DP_Temp16 : STA.W Temp_XSpeed
    LDA.B DP_Temp18 : STA.W Temp_XSubSpeed
    LDA.B DP_Temp1A : STA.W Temp_YSpeed
    LDA.B DP_Temp1C : STA.W Temp_YSubSpeed
    LDA.L ExtraEnemy8800+6 : AND.W #$00FF : STA.W Temp_Unknown0E20
    JSL MoveEnemyAccordingToAngleAndXYSpeeds
    LDA.W Enemy.XPosition : SEC : SBC.W #$0100
    JSL NegateA_A0B067
    CMP.W #$0004 : BPL .gotoReturn
    LDA.W Enemy.YPosition : SEC : SBC.W #$01E0
    JSL NegateA_A0B067
    CMP.W #$0004 : BPL .gotoReturn
    BRA .done

  .gotoReturn:
    JMP .return ; >.<

  .done:
    JSR SpawnDeathSequenceEvirSpriteObjects
    LDA.W #Function_DraygonBody_DeathSequence_WaitForEvirs : STA.W DraygonBody.function
    LDA.W #$0003
    JSL QueueMusicDataOrTrack_8FrameDelay
    LDA.W #$01A0 : STA.W DraygonBody.functionTimer
    LDA.W #InstList_Draygon_Sleep : STA.W Enemy.instList
    LDA.W #$0001 : STA.W Enemy.instTimer
    LDA.W Enemy.properties : ORA.W #$0200 : STA.W Enemy[2].properties : STA.W Enemy[3].properties
    LDY.W #InstList_DraygonEye_FacingLeft_Dead
    LDA.L DraygonBody.facingDirection : BEQ .keepLeft
    LDY.W #InstList_DraygonEye_FacingRight_Dead

  .keepLeft:
    STY.W Enemy[1].instList
    LDA.W #$0001 : STA.W Enemy[1].instTimer
    LDA.W #RTS_A5804B : STA.W DraygonEye.function

  .return:
    RTS


;;; $9294: Draygon body function - death sequence - wait for evirs ;;;
Function_DraygonBody_DeathSequence_WaitForEvirs:
    JSR HandleDyingDraygonSmoke
    DEC.W DraygonBody.functionTimer
    LDA.W DraygonBody.functionTimer : BEQ .timerExpired
    JSR HandleDeathSequenceEvirMovement
    BRA .return

  .timerExpired:
    LDA.W #Function_DraygonBody_DeathSequence_BuriedByEvirs : STA.W DraygonBody.function

  .return:
    RTS


;;; $92AB: Draygon body function - death sequence - buried by evirs ;;;
Function_DraygonBody_DeathSequence_BuriedByEvirs:
    JSR HandleDyingDraygonSmoke
    JSR HandleDeathSequenceEvirMovement
    INC.W Enemy.YPosition
    LDA.W Enemy.YPosition : CMP.W #$0240 : BMI .return
    LDA.W #InstList_Draygon_Delete : STA.W Enemy.instList
    LDA.W #$0001 : STA.W Enemy.instTimer
    LDA.W Enemy.properties : ORA.W #$0200 : STA.W Enemy.properties : STA.W Enemy[1].properties
    LDX.W AreaIndex
    LDA.L SRAMMirror_Boss,X : ORA.W #$0001 : STA.L SRAMMirror_Boss,X
    JSL DraygonDeathItemDropRoutine
    JSR Draygon_ClearSpriteObjects

  .return:
    RTS


;;; $92EA: Handle dying Draygon smoke ;;;
HandleDyingDraygonSmoke:
    PHY : PHX
    LDA.W NMI_FrameCounter : AND.W #$0007 : BNE .return
    JSL GenerateRandomNumber
    AND.W #$007F : CLC : ADC.W #$00C0 : STA.B DP_Temp12
    LDA.W RandomNumberSeed : AND.W #$3F00
    XBA : CLC : ADC.W #$0190 : STA.B DP_Temp14
    LDA.W #$0015 : STA.B DP_Temp16
    STZ.B DP_Temp18
    JSL Create_Sprite_Object

  .return:
    PLX : PLY
    RTS


;;; $931C: Handle short Draygon breath bubbles ;;;
HandleShortDraygonBreathBubbles:
    LDA.W Enemy.frameCounter,X : AND.W #$007F : BNE .return
    LDA.W Enemy.XPosition : CLC : ADC.W #$FFF0 : STA.B DP_Temp12
    LDA.W Enemy.YPosition : CLC : ADC.W #$FFF0 : STA.B DP_Temp14
    LDA.W #$0018 : STA.B DP_Temp16
    STZ.B DP_Temp18
    JSL Create_Sprite_Object

  .return:
    RTS


;;; $9342: Enemy graphics drawn hook - Draygon - set BG2 X/Y scroll ;;;
EnemyGraphicsDrawnHook_Draygon_SetBG2XYScroll:
    LDA.W Layer1XPosition : SEC : SBC.W Enemy.XPosition : SEC : SBC.W #$01C2
    CLC : ADC.L DraygonBody.bodyGraphicsXDisplacement : STA.B DP_BG2XScroll
    LDA.W Layer1YPosition : SEC : SBC.W Enemy.YPosition : SEC : SBC.W #$00C0
    CLC : ADC.L DraygonBody.bodyGraphicsYDisplacement : STA.B DP_BG2YScroll
    RTL


;;; $9367: Unused. Debug. Draygon controller 2 input handling ;;;
Debug_DraygonController2InputHandling:
    LDX.W #$0000
    LDA.B DP_Controller2Input : BIT.W #$0040 : BEQ .notPressingX
    JSL Debug_MoveDraygonWithDpad_Fast
    BRA +

  .notPressingX:
    JSL Debug_MoveDraygonWithDpad_Slow

+   LDX.W #$0000
    LDA.B DP_Controller2New : BIT.W #$4000 : BEQ .fireGoopEnd
    LDY.W #InstList_DraygonBody_FacingLeft_FireGoop
    LDA.L DraygonBody.facingDirection,X : BEQ .keepLeft
    LDY.W #InstList_DraygonBody_FacingRight_FireGoop

  .keepLeft:
    STY.W Enemy.instList
    LDA.W #$0001 : STA.W Enemy.instTimer
    BRA .return

  .fireGoopEnd:
    BIT.W #$8000 : BEQ .tailWhipEnd
    LDY.W #InstList_DraygonTail_FacingLeft_FakeTailWhip
    LDA.L DraygonBody.facingDirection,X : BEQ ..keepLeft
    LDY.W #Debug_InstList_DraygonTail_FacingRight_FakeTailWhip

  ..keepLeft:
    STY.W Enemy[2].instList
    LDA.W #$0001 : STA.W Enemy[2].instTimer
    BRA .return

  .tailWhipEnd:
    BIT.W #$0080 : BEQ .grabEnd
    LDY.W #Debug_InstList_DraygonArms_FacingLeft_FakeGrab
    LDA.L DraygonBody.facingDirection,X : BEQ ..keepLeft
    LDY.W #Debug_InstList_DraygonArms_FacingRight_FakeGrab

  ..keepLeft:
    STY.W Enemy[3].instList
    LDA.W #$0001 : STA.W Enemy[3].instTimer
    BRA .return

  .grabEnd:
    BIT.W #$0040 : BEQ .return ; >.<

  .return:
    RTL


;;; $93DA: Debug. Move Draygon with d-pad - slow ;;;
Debug_MoveDraygonWithDpad_Slow:
    LDA.B DP_Controller2Input : BIT.W #$0200 : BEQ .notPressingLeft
    DEC.W Enemy.XPosition
    CMP.W DebugPreviousController2InputCrocomire : BEQ .notPressingLeft
    STA.W DebugPreviousController2InputCrocomire
    LDY.W #InstList_DraygonBody_FacingLeft_Reset
    LDA.W #$0000 : STA.L DraygonBody.facingDirection
    BRA +

  .notPressingLeft:
    BIT.W #$0100 : BEQ .noHorizontalMovement
    INC.W Enemy.XPosition
    CMP.W DebugPreviousController2InputCrocomire : BEQ .noHorizontalMovement
    STA.W DebugPreviousController2InputCrocomire
    LDY.W #InstList_DraygonBody_FacingRight_Reset
    LDA.W #$0001 : STA.L DraygonBody.facingDirection

+   STY.W Enemy.instList
    LDA.W #$0001 : STA.W Enemy.instTimer

  .noHorizontalMovement:
    LDA.B DP_Controller2Input : BIT.W #$0800 : BEQ .notPressingUp
    DEC.W Enemy.YPosition
    BRA .return

  .notPressingUp:
    BIT.W #$0400 : BEQ .return
    INC.W Enemy.YPosition

  .return:
    RTL


;;; $9430: Debug. Move Draygon with d-pad - fast ;;;
Debug_MoveDraygonWithDpad_Fast:
    LDA.B DP_Controller2Input : BIT.W #$0200 : BEQ .noPressingLeft
    LDA.W Enemy.XPosition : SEC : SBC.W #$0004 : STA.W Enemy.XPosition
    LDA.B DP_Controller2Input : CMP.W DebugPreviousController2InputCrocomire : BEQ .noPressingLeft
    STA.W DebugPreviousController2InputCrocomire
    LDY.W #InstList_DraygonBody_FacingLeft_Reset
    LDA.W #$0000 : STA.L DraygonBody.facingDirection
    BRA +

  .noPressingLeft:
    BIT.W #$0100 : BEQ .noHorizontalMovement
    LDA.W Enemy.XPosition : CLC : ADC.W #$0004 : STA.W Enemy.XPosition
    LDA.B DP_Controller2Input : CMP.W DebugPreviousController2InputCrocomire : BEQ .noHorizontalMovement
    STA.W DebugPreviousController2InputCrocomire
    LDY.W #InstList_DraygonBody_FacingRight_Reset
    LDA.W #$0001 : STA.L DraygonBody.facingDirection

+   STY.W Enemy.instList
    LDA.W #$0001 : STA.W Enemy.instTimer

  .noHorizontalMovement:
    LDA.B DP_Controller2Input : BIT.W #$0800 : BEQ .notPressingUp
    LDA.W Enemy.YPosition : SEC : SBC.W #$0004 : STA.W Enemy.YPosition
    BRA .return

  .notPressingUp:
    BIT.W #$0400 : BEQ .return
    INC.W Enemy.YPosition
    LDA.W Enemy.YPosition : CLC : ADC.W #$0004 : STA.W Enemy.YPosition

  .return:
    RTL


;;; $94A9: Move Samus with Draygon ;;;
MoveSamusWithDraygon:
    LDY.W #$0008
    LDA.L DraygonBody.facingDirection,X : BNE .keepLeft
    LDY.W #$FFF8

  .keepLeft:
    TYA : CLC : ADC.W Enemy.XPosition : STA.W SamusXPosition
    LDA.W Enemy.YPosition : CLC : ADC.W #$0028 : STA.W SamusYPosition
    JSL CapScrollingSpeed
    LDA.W GrappleConnectedFlags : BIT.W #$0002 : BEQ .return
    STZ.W GrappleConnectedFlags
    LDA.W #Function_DraygonBody_GrabbedSamus_FlyStraightUp : STA.W DraygonBody.function

  .return:
    RTS


;;; $94DD: Instruction - Draygon instructions lists = [[Y]], [[Y] + 2], [[Y] + 4], [[Y] + 6] ;;;
Instruction_Draygon_SetInstList_Body_Eye_Tail_Arms:
    PHY
    LDA.W $0000,Y : STA.W Enemy.instList
    LDA.W $0002,Y : STA.W Enemy[1].instList
    LDA.W $0004,Y : STA.W Enemy[2].instList
    LDA.W $0006,Y : STA.W Enemy[3].instList
    LDA.W #$0001 : STA.W Enemy.instTimer : STA.W Enemy[1].instTimer
    STA.W Enemy[2].instTimer : STA.W Enemy[3].instTimer
    PLY
    TYA : CLC : ADC.W #$0008 : TAY
    RTL


if !FEATURE_KEEP_UNREFERENCED
;;; $950D: Unused. Draygon instruction list pointers ;;;
Unused_DraygonInstListPointers_A5950D:
; Not an exhaustive list of pointers. Assuming they were used for some unknown debug purpose
    ; Draygon arms
    dw InstList_DraygonArms_FacingLeft_Idle_0
    dw InstList_DraygonArms_FacingLeft_NearSwoopApex
    dw UNUSED_InstList_DraygonArms_A59805
    dw InstList_DraygonArms_FacingRight_Idle_0
    dw InstList_DraygonArms_FacingRight_NearSwoopApex
    dw UNUSED_InstList_DraygonArms_A59BF8
    dw $0000
    ; Draygon body
    dw InstList_DraygonBody_FacingLeft_Idle
    dw InstList_DraygonArms_FacingLeft_Dying
    dw UNUSED_InstList_DraygonBody_A5987B
    dw InstList_DraygonBody_FacingLeft_FireGoop
    dw InstList_DraygonBody_FacingRight_Idle
    dw InstList_DraygonArms_FacingRight_Dying_0
    dw UNUSED_InstList_DraygonBody_A59C70
    dw InstList_DraygonBody_FacingRight_FireGoop
    dw $0000
    ; Draygon eye
    dw InstList_DraygonEye_FacingLeft_Idle
    dw InstList_DraygonEye_FacingLeft_LookingLeft
    dw InstList_DraygonEye_FacingLeft_LookingRight
    dw InstList_DraygonEye_FacingLeft_LookingUp
    dw InstList_DraygonEye_FacingLeft_LookingDown
    dw InstList_DraygonEye_FacingRight_Idle
    dw InstList_DraygonEye_FacingRight_LookingRight
    dw InstList_DraygonEye_FacingRight_LookingLeft
    dw InstList_DraygonEye_FacingRight_LookingUp
    dw InstList_DraygonEye_FacingRight_LookingDown
    dw $0000
    ; Draygon tail
    dw InstList_DraygonTail_FacingLeft_Idle_0
    dw InstList_DraygonTail_FacingLeft_FakeTailWhip
    dw InstList_DraygonTail_FacingRight_Idle_0
    dw Debug_InstList_DraygonTail_FacingRight_FakeTailWhip
    dw $0000
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $954D: Hurt AI - enemy $DE3F (Draygon) ;;;
HurtAI_Draygon:
    LDY.W #Palette_Draygon_BG12_5
    LDX.W EnemyIndex
    LDA.W Enemy.flashTimer,X : BIT.W #$0002 : BEQ .noFlash
    LDY.W #Palette_Draygon_WhiteFlash

  .noFlash:
    LDX.W #Palettes_BG12P5
    LDA.W #$0010 : STA.W LoopCounterEnemyDeath

  .loopBG12Palette5:
    LDA.W $0000,Y : STA.L Palettes_BG12P5&$FF0000,X
    INX #2
    INY #2
    DEC.W LoopCounterEnemyDeath : BNE .loopBG12Palette5
    LDX.W EnemyIndex
    LDA.W Enemy.flashTimer,X : BIT.W #$0002 : BNE .flashing
    LDA.L DraygonBody.healthBasedPaletteTableIndex : ASL #2 : TAY
    LDX.W #$0000

  .loopHealthBasedPalette:
    LDA.W DraygonHealthBasedPaletteTable,Y : STA.L Palettes_BG12P5+$12,X
    INY #2
    INX #2 : CPX.W #$0008 : BNE .loopHealthBasedPalette

  .flashing:
    LDY.W #Palette_Draygon_Sprite7
    LDX.W EnemyIndex
    LDA.W Enemy.flashTimer,X : BIT.W #$0002 : BEQ ..noFlash
    LDY.W #Palette_Draygon_WhiteFlash

  ..noFlash:
    LDX.W #Palettes_SpriteP7
    LDA.W #$0010 : STA.W LoopCounterEnemyDeath

  .loopSpritePalette7:
    LDA.W $0000,Y : STA.L Palettes_SpriteP7&$FF0000,X
    INX #2
    INY #2
    DEC.W LoopCounterEnemyDeath : BNE .loopSpritePalette7
    LDA.W GrappleConnectedFlags : BIT.W #$0001 : BEQ .return
    LDA.W Enemy.frameCounter : AND.W #$0007 : BNE .return
    LDA.W Enemy.health : SEC : SBC.W #$0100 : BPL .grappleDamage
    LDA.W #$0000

  .grappleDamage:
    STA.W Enemy.health
    JSL DraygonReaction_Common

  .return:
    RTL


;;; $95EA: Enemy touch - enemy $DE3F (Draygon) ;;;
EnemyTouch_Draygon:
    JSL NormalEnemyTouchAI_NoDeathCheck_External
    BRA DraygonReaction_Common


;;; $95F0: Enemy shot - enemy $DE7F (Draygon) ;;;
EnemyShot_Draygon:
    LDA.L DraygonBody.swoopYAcceleration : CLC : ADC.W #$0008 : CMP.W #$00A0 : BPL +
    STA.L DraygonBody.swoopYAcceleration

+   JSL NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External
    BRA DraygonReaction_Common


;;; $9607: Power bomb reaction - enemy $DE3F (Draygon) ;;;
PowerBombReaction_Draygon:
    JSL NormalEnemyPowerBombAI_NoDeathCheck_External
    BRA DraygonReaction_Common ; >.<


;;; $960D: Draygon reaction ;;;
DraygonReaction_Common:
; The calculations for the X/Y speed for drifting to the death point ($965B) are copy+pasted from Spore Spawn code,
; the results ($7E:8010..17) aren't actually used by Draygon, instead they're recalculated every frame by Function_DraygonBody_DeathSequence_DriftToDeathSpot >_<;
    LDX.W EnemyIndex
    LDA.W Enemy.health,X : BEQ .dead
    JMP .notDead

  .dead:
    LDA.W #GrappleBeamFunction_Dropped : STA.W GrappleBeam_Function
    LDY.W #InstList_DraygonArms_FacingLeft_Dying
    LDA.L DraygonBody.facingDirection : BEQ ..keepLeft
    LDY.W #InstList_DraygonArms_FacingRight_Dying_0

  ..keepLeft:
    STY.W Enemy.instList
    LDA.W #$0001 : STA.W Enemy.instTimer
    LDY.W #InstList_DraygonEye_FacingLeft_Dying_0
    LDA.L DraygonBody.facingDirection : BEQ +
    LDY.W #InstList_DraygonEye_FacingRight_Dying_0

+   STY.W Enemy[1].instList
    LDA.W #$0001 : STA.W Enemy[1].instTimer
    LDA.W #RTS_A5804B : STA.W DraygonEye.function
    LDA.W #Function_DraygonBody_DeathSequence_DriftToDeathSpot : STA.W DraygonBody.function
    JSL ReleaseSamusFromDraygon_external
    STZ.W GrappleConnectedFlags
    LDA.W #$0100 : SEC : SBC.W Enemy.XPosition : STA.B DP_Temp12
    LDA.W #$01E0 : SEC : SBC.W Enemy.YPosition : STA.B DP_Temp14
    JSL CalculateAngleOf_12_14_Offset
    SEC : SBC.W #$0040 : EOR.W #$FFFF : INC
    AND.W #$00FF : STA.L ExtraEnemy8800+6
    LDA.W #$0001 : STA.B DP_Temp14
    LDA.L ExtraEnemy8800+6 : AND.W #$00FF : STA.B DP_Temp12
    JSL Do_Some_Math_With_Sine_Cosine_Terrible_Label_Name ; ($16.$18, $1A.$1C) = ([$14] * |cos([$12] * pi / 80h)|, [$14] * |sin([$12] * pi / 80h)|)
    LDA.B DP_Temp16 : STA.L ExtraEnemy8000+$10
    LDA.B DP_Temp18 : STA.L ExtraEnemy8000+$12
    LDA.B DP_Temp1A : STA.L ExtraEnemy8000+$14
    LDA.B DP_Temp1C : STA.L ExtraEnemy8000+$16
    RTL

  .notDead:
    JSR DraygonHealthBasedPaletteHandling
    RTL


;;; $96AF: Draygon health-based palette table ;;;
DraygonHealthBasedPaletteTable:
; Colours 1..4
    dw $0319,$0254,$018F,$00CA ; Health >= 5250
    dw $02BA,$01F4,$014F,$00AA ; Health >= 4500
    dw $023B,$01B5,$012F,$0089 ; Health >= 3750
    dw $01DC,$0155,$00EF,$0069 ; Health >= 3000
    dw $015C,$0116,$00B0,$0069 ; Health >= 2250
    dw $00FD,$00B6,$0070,$0049 ; Health >= 1500
    dw $007E,$0077,$0050,$0028 ; Health >= 750
    dw $001F,$0017,$0010,$0008 ; Health < 750


;;; $96EF: Draygon health-based palette thresholds ;;;
DraygonHealthBasedPaletteThresholds:
    dw $1482 ; 5250
    dw $1194 ; 4500
    dw $0EA6 ; 3750
    dw $0BB8 ; 3000
    dw $08CA ; 2250
    dw $05DC ; 1500
    dw $02EE ; 750
    dw $0000 ; 0
    dw $FFFF ; Terminator


;;; $9701: Draygon health-based palette handling ;;;
DraygonHealthBasedPaletteHandling:
    LDX.W #$0000

  .loopFindThreshold:
    LDA.W Enemy.health : CMP.W DraygonHealthBasedPaletteThresholds,X : BPL .found
    INX #2
    BRA .loopFindThreshold

  .found:
    TXA : CMP.L DraygonBody.healthBasedPaletteTableIndex : BEQ .return
    STA.L DraygonBody.healthBasedPaletteTableIndex
    LDA.L DraygonBody.healthBasedPaletteTableIndex : ASL #2 : TAY ; >_<
    LDX.W #$0000

  .loopPalette:
    LDA.W DraygonHealthBasedPaletteTable,Y : STA.L Palettes_BG12P5+$12,X
    INY #2
    INX #2 : CPX.W #$0008 : BNE .loopPalette

  .return:
    RTS


;;; $9736: Instruction - enemy function = [[Y]] ;;;
Instruction_Draygon_FunctionInY:
    LDA.W $0000,Y : STA.W DraygonBody.function,X
    INY #2
    RTL


;;; $973F: Instruction - spawn dying Draygon sprite object - big dust cloud ;;;
Inst_Draygon_SpawnDyingDraygonSpriteObject_BigDustCloud:
    PHY : PHX
    JSR GenerateRandomDyingDraygonSpriteObjectPosition
    LDA.W #$0015 : STA.B DP_Temp16
    STZ.B DP_Temp18
    JSL Create_Sprite_Object
    PLX : PLY
    RTL


;;; $9752: Instruction - spawn dying Draygon sprite object - small explosion ;;;
Inst_Draygon_SpawnDyingDraygonSpriteObject_SmallExplosion:
    PHY : PHX
    JSR GenerateRandomDyingDraygonSpriteObjectPosition
    LDA.W #$0003 : STA.B DP_Temp16
    STZ.B DP_Temp18
    JSL Create_Sprite_Object
    PLX : PLY
    RTL


;;; $9765: Instruction - spawn dying Draygon sprite object - big explosion ;;;
Inst_Draygon_SpawnDyingDraygonSpriteObject_BigExplosion:
    PHY : PHX
    JSR GenerateRandomDyingDraygonSpriteObjectPosition
    LDA.W #$001D : STA.B DP_Temp16
    STZ.B DP_Temp18
    JSL Create_Sprite_Object
    PLX : PLY
    RTL


;;; $9778: Instruction - spawn dying Draygon sprite object - breath bubbles ;;;
Inst_Draygon_SpawnDyingDraygonSpriteObject_BreathBubbles:
    PHY : PHX
    JSR GenerateRandomDyingDraygonSpriteObjectPosition
    LDA.W #$0018 : STA.B DP_Temp16
    STZ.B DP_Temp18
    JSL Create_Sprite_Object
    PLX : PLY
    RTL


;;; $978B: Generate random dying Draygon sprite object position ;;;
GenerateRandomDyingDraygonSpriteObjectPosition:
    JSL GenerateRandomNumber
    LDA.W RandomNumberSeed : AND.W #$007F : SEC : SBC.W #$0040 : STA.B DP_Temp12
    LDA.W Enemy.XPosition : CLC : ADC.B DP_Temp12 : STA.B DP_Temp12
    LDA.W RandomNumberSeed : AND.W #$7F00 : XBA
    SEC : SBC.W #$0040 : STA.B DP_Temp14
    LDA.W Enemy.YPosition : CLC : ADC.B DP_Temp14 : STA.B DP_Temp14
    RTS


;;; $97B9: Instruction list - sleep ;;;
InstList_Draygon_Sleep:
    dw Instruction_Common_Sleep


;;; $97BB: Instruction list - Draygon body - facing left - reset ;;;
InstList_DraygonBody_FacingLeft_Reset:
    dw Instruction_Draygon_SetInstList_Body_Eye_Tail_Arms
    dw InstList_DraygonBody_FacingLeft_Idle
    dw InstList_DraygonEye_FacingLeft_Idle
    dw InstList_DraygonTail_FacingLeft_Idle_0
    dw InstList_DraygonArms_FacingLeft_Idle_0
    dw Instruction_Draygon_RoomLoadingInterruptCmd_BeginHUDDraw
    dw Instruction_Draygon_EyeFunctionInY
    dw Function_DraygonEye_FacingLeft
    dw $0001,ExtendedSpritemap_Draygon_1A
    dw Instruction_Common_Sleep


;;; $97D1: Instruction list - Draygon body - facing right - reset ;;;
InstList_DraygonBody_FacingRight_Reset:
    dw Instruction_Draygon_SetInstList_Body_Eye_Tail_Arms
    dw InstList_DraygonBody_FacingRight_Idle
    dw InstList_DraygonEye_FacingRight_Idle
    dw InstList_DraygonTail_FacingRight_Idle_0
    dw InstList_DraygonArms_FacingRight_Idle_0
    dw Instruction_Draygon_RoomLoadingInterruptCmd_BeginHUDDraw
    dw Instruction_Draygon_EyeFunctionInY
    dw Function_DraygonEye_FacingRight
    dw $0001,ExtendedSpritemap_Draygon_4A
    dw Instruction_Common_Sleep


;;; $97E7: Instruction list - Draygon arms - facing left - idle ;;;
InstList_DraygonArms_FacingLeft_Idle_0:
    dw $0005,ExtendedSpritemap_Draygon_4
    dw $0005,ExtendedSpritemap_Draygon_5
    dw $0005,ExtendedSpritemap_Draygon_6
    dw $0005,ExtendedSpritemap_Draygon_7
    dw $0005,ExtendedSpritemap_Draygon_8
    dw $0005,ExtendedSpritemap_Draygon_9
    dw Instruction_Common_GotoY
    dw InstList_DraygonArms_FacingLeft_Idle_0

InstList_DraygonArms_FacingLeft_Idle_1:
    dw Instruction_Common_Sleep


if !FEATURE_KEEP_UNREFERENCED
;;; $9805: Unused. Instruction list - Draygon arms ;;;
UNUSED_InstList_DraygonArms_A59805:
    dw $0001,ExtendedSpritemap_Draygon_1D
    dw $0001,ExtendedSpritemap_Draygon_1C
    dw $0040,ExtendedSpritemap_Draygon_1B
    dw Instruction_Common_Sleep
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $9813: Instruction list - Draygon arms - facing left - near swoop apex ;;;
InstList_DraygonArms_FacingLeft_NearSwoopApex:
    dw $0001,ExtendedSpritemap_Draygon_1B
    dw $0001,ExtendedSpritemap_Draygon_1C
    dw $0001,ExtendedSpritemap_Draygon_1D
    dw $0040,ExtendedSpritemap_Draygon_1E
    dw Instruction_Common_Sleep


;;; $9825: Instruction list - Draygon arms - facing left - fake grab ;;;
Debug_InstList_DraygonArms_FacingLeft_FakeGrab:
; Only set by debug routine
    dw $0001,ExtendedSpritemap_Draygon_1B
    dw $0001,ExtendedSpritemap_Draygon_1C
    dw $0001,ExtendedSpritemap_Draygon_1D
    dw $0040,ExtendedSpritemap_Draygon_1E
    dw $0001,ExtendedSpritemap_Draygon_1D
    dw $0001,ExtendedSpritemap_Draygon_1C
    dw $0040,ExtendedSpritemap_Draygon_1B
    dw Instruction_Common_GotoY
    dw InstList_DraygonArms_FacingLeft_Idle_0


;;; $9845: Instruction list - Draygon arms - facing left - grab ;;;
InstList_DraygonArms_FacingLeft_Grab:
    dw $0001,ExtendedSpritemap_Draygon_1B
    dw $0001,ExtendedSpritemap_Draygon_1C
    dw $0001,ExtendedSpritemap_Draygon_1D
    dw $0008,ExtendedSpritemap_Draygon_1E
    dw $0001,ExtendedSpritemap_Draygon_1D
    dw $0001,ExtendedSpritemap_Draygon_1C
    dw $0001,ExtendedSpritemap_Draygon_1B
    dw $0001,ExtendedSpritemap_Draygon_1C
    dw Instruction_Common_Sleep


;;; $9867: Instruction list - Draygon body - facing left - dying ;;;
InstList_DraygonArms_FacingLeft_Dying:
    dw $0005,ExtendedSpritemap_Draygon_A
    dw $0005,ExtendedSpritemap_Draygon_B
    dw $0005,ExtendedSpritemap_Draygon_C
    dw $0005,ExtendedSpritemap_Draygon_D
    dw Instruction_Common_GotoY
    dw InstList_DraygonBody_Dying_0


if !FEATURE_KEEP_UNREFERENCED
;;; $987B: Unused. Instruction list - Draygon body ;;;
UNUSED_InstList_DraygonBody_A5987B:
    dw $0005,ExtendedSpritemap_Draygon_C
    dw $0005,ExtendedSpritemap_Draygon_B
    dw $0005,ExtendedSpritemap_Draygon_A
    dw Instruction_Common_Sleep
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $9889: Instruction list - Draygon body - facing left - idle ;;;
InstList_DraygonBody_FacingLeft_Idle:
    dw Instruction_Draygon_RoomLoadingInterruptCmd_BeginHUDDraw
    dw Instruction_Draygon_EyeFunctionInY
    dw Function_DraygonEye_FacingLeft
    dw $0001,ExtendedSpritemap_Draygon_1A
    dw Instruction_Common_Sleep


;;; $9895: Instruction - room loading interrupt command = Draygon's room - begin HUD drawing ;;;
Instruction_Draygon_RoomLoadingInterruptCmd_BeginHUDDraw:
    LDA.W #$000C : STA.B DP_RoomLoadIRQCmd
    RTL


;;; $989B: Instruction list - Draygon body - dying ;;;
InstList_DraygonBody_Dying_0:
    dw Instruction_Draygon_QueueSFXInY_Lib3_Max6,$001B
    dw Instruction_DraygonBody_SetAsIntangible
    dw Instruction_Common_TimerInY,$0008

InstList_DraygonBody_Dying_1:
    dw Instruction_Common_WaitYFrames,$000C
    dw Inst_Draygon_SpawnDyingDraygonSpriteObject_BigExplosion
    dw Inst_Draygon_SpawnDyingDraygonSpriteObject_SmallExplosion
    dw Inst_Draygon_SpawnDyingDraygonSpriteObject_BigDustCloud
    dw Inst_Draygon_SpawnDyingDraygonSpriteObject_BreathBubbles
    dw Instruction_Draygon_QueueSFXInY_Lib2_Max6,$0025
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate
    dw InstList_DraygonBody_Dying_1
    dw Instruction_Common_WaitYFrames,$0001
    dw Instruction_Draygon_ParalyseDraygonTailAndArms

InstList_DraygonBody_Dying_2:
    dw Instruction_Common_WaitYFrames,$0010
    dw Inst_Draygon_SpawnDyingDraygonSpriteObject_BigExplosion
    dw Inst_Draygon_SpawnDyingDraygonSpriteObject_SmallExplosion
    dw Inst_Draygon_SpawnDyingDraygonSpriteObject_BigDustCloud
    dw Inst_Draygon_SpawnDyingDraygonSpriteObject_BreathBubbles
    dw Instruction_Draygon_QueueSFXInY_Lib2_Max6,$0025
    dw Instruction_Common_GotoY
    dw InstList_DraygonBody_Dying_2


;;; $98D3: Instruction - paralyse Draygon tail and arms ;;;
Instruction_Draygon_ParalyseDraygonTailAndArms:
    PHX : PHY
    LDA.W #$0001 : STA.W Enemy[2].instTimer : STA.W Enemy[3].instTimer
    LDA.W #InstList_Draygon_Sleep : STA.W Enemy[2].instList
    LDA.W #InstList_Draygon_Sleep : STA.W Enemy[3].instList
    PLY : PLX
    RTL


;;; $98ED: Instruction list - delete ;;;
InstList_Draygon_Delete:
    dw Instruction_Common_DeleteEnemy


;;; $98EF: Instruction - set Draygon body as intangible ;;;
Instruction_DraygonBody_SetAsIntangible:
    PHX
    LDX.W EnemyIndex ; >.<
    LDA.W Enemy.properties : ORA.W #$0400 : STA.W Enemy.properties
    PLX
    RTL


;;; $98FE: Instruction list - Draygon body - facing left - fire goop ;;;
InstList_DraygonBody_FacingLeft_FireGoop:
    dw $0001,ExtendedSpritemap_Draygon_E
    dw $0002,ExtendedSpritemap_Draygon_F
    dw $0003,ExtendedSpritemap_Draygon_10
    dw Instruction_Draygon_SpawnGoop_Leftwards
    dw Instruction_Draygon_QueueSFXInY_Lib2_Max6,$004C
    dw $0003,ExtendedSpritemap_Draygon_11
    dw $0002,ExtendedSpritemap_Draygon_10
    dw $0002,ExtendedSpritemap_Draygon_F
    dw $0001,ExtendedSpritemap_Draygon_E
    dw Instruction_Common_Sleep


;;; $9922: Instruction list - Draygon body - facing left - roar ;;;
InstList_DraygonBody_FacingLeft_Roar:
    dw Instruction_Draygon_QueueSFXInY_Lib2_Max6,$0073
    dw $0006,ExtendedSpritemap_Draygon_E
    dw $0006,ExtendedSpritemap_Draygon_F
    dw $0006,ExtendedSpritemap_Draygon_10
    dw $0006,ExtendedSpritemap_Draygon_11
    dw $0006,ExtendedSpritemap_Draygon_10
    dw $0006,ExtendedSpritemap_Draygon_F
    dw $0006,ExtendedSpritemap_Draygon_E
    dw Instruction_Common_Sleep


;;; $9944: Instruction list - Draygon eye - facing left - idle ;;;
InstList_DraygonEye_FacingLeft_Idle:
    dw $0015,ExtendedSpritemap_Draygon_12
    dw $0005,ExtendedSpritemap_Draygon_13
    dw $0005,ExtendedSpritemap_Draygon_14
    dw $000A,ExtendedSpritemap_Draygon_13
    dw $000A,ExtendedSpritemap_Draygon_16
    dw $000A,ExtendedSpritemap_Draygon_16
    dw $000A,ExtendedSpritemap_Draygon_18
    dw $000A,ExtendedSpritemap_Draygon_18
    dw $000A,ExtendedSpritemap_Draygon_19
    dw $0005,ExtendedSpritemap_Draygon_14
    dw $0005,ExtendedSpritemap_Draygon_13
    dw $0005,ExtendedSpritemap_Draygon_12
    dw Instruction_Draygon_FunctionInY
    dw Function_DraygonEye_FacingLeft
    dw Instruction_Common_Sleep


;;; $997A: Instruction list - Draygon eye - facing left - dying ;;;
InstList_DraygonEye_FacingLeft_Dying_0:
    dw Instruction_Common_TimerInY,$0004

InstList_DraygonEye_FacingLeft_Dying_1:
    dw $0004,ExtendedSpritemap_Draygon_16
    dw $0004,ExtendedSpritemap_Draygon_18
    dw $0004,ExtendedSpritemap_Draygon_17
    dw $0004,ExtendedSpritemap_Draygon_19
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate
    dw InstList_DraygonEye_FacingLeft_Dying_1
    dw $0020,ExtendedSpritemap_Draygon_15
    dw $0010,ExtendedSpritemap_Draygon_14
    dw Instruction_Common_Sleep


;;; $999C: Instruction list - Draygon eye - facing left - dead ;;;
InstList_DraygonEye_FacingLeft_Dead:
    dw $0020,ExtendedSpritemap_Draygon_15
    dw $0020,ExtendedSpritemap_Draygon_14
    dw $0020,ExtendedSpritemap_Draygon_13
    dw $0001,ExtendedSpritemap_Draygon_12
    dw Instruction_Common_Sleep


;;; $99AE: Instruction list - Draygon eye - facing left - looking left ;;;
InstList_DraygonEye_FacingLeft_LookingLeft:
    dw $0001,ExtendedSpritemap_Draygon_16
    dw Instruction_Common_Sleep


;;; $99B4: Instruction list - Draygon eye - facing left - looking right ;;;
InstList_DraygonEye_FacingLeft_LookingRight:
    dw $0001,ExtendedSpritemap_Draygon_17
    dw Instruction_Common_Sleep


;;; $99BA: Instruction list - Draygon eye - facing left - looking up ;;;
InstList_DraygonEye_FacingLeft_LookingUp:
    dw $0001,ExtendedSpritemap_Draygon_18
    dw Instruction_Common_Sleep


;;; $99C0: Instruction list - Draygon eye - facing left - looking down ;;;
InstList_DraygonEye_FacingLeft_LookingDown:
    dw $0001,ExtendedSpritemap_Draygon_19
    dw Instruction_Common_Sleep


;;; $99C6: Instruction list - Draygon tail - facing left - idle ;;;
InstList_DraygonTail_FacingLeft_Idle_0:
    dw $0008,ExtendedSpritemap_Draygon_22
    dw $0007,ExtendedSpritemap_Draygon_23
    dw $0006,ExtendedSpritemap_Draygon_24
    dw $0006,ExtendedSpritemap_Draygon_25
    dw $0006,ExtendedSpritemap_Draygon_26
    dw $0006,ExtendedSpritemap_Draygon_27
    dw $0006,ExtendedSpritemap_Draygon_28
    dw $0006,ExtendedSpritemap_Draygon_27
    dw $0006,ExtendedSpritemap_Draygon_26
    dw $0006,ExtendedSpritemap_Draygon_25
    dw $0006,ExtendedSpritemap_Draygon_24
    dw $0007,ExtendedSpritemap_Draygon_23
    dw Instruction_Common_GotoY
    dw InstList_DraygonTail_FacingLeft_Idle_0

InstList_DraygonTail_FacingLeft_Idle_1:
    dw Instruction_Common_Sleep


;;; $99FC: Instruction list - Draygon tail - facing left - fake tail whip ;;;
InstList_DraygonTail_FacingLeft_FakeTailWhip:
; Set as initial instruction list for some reason, otherwise only set by debug routine
    dw Instruction_DraygonBody_DisplaceGraphics,$FFFF,$FFFF
    dw $0010,ExtendedSpritemap_Draygon_24
    dw Instruction_DraygonBody_DisplaceGraphics,$FFFE,$FFFE
    dw $0006,ExtendedSpritemap_Draygon_29
    dw Instruction_DraygonBody_DisplaceGraphics,$FFFD,$FFFD
    dw $0005,ExtendedSpritemap_Draygon_2A
    dw Instruction_DraygonBody_DisplaceGraphics,$FFFC,$FFFC
    dw $0004,ExtendedSpritemap_Draygon_2B
    dw Instruction_DraygonBody_DisplaceGraphics,$FFFB,$FFFB
    dw $0003,ExtendedSpritemap_Draygon_2C
    dw Instruction_DraygonBody_DisplaceGraphics,$FFFA,$FFFA
    dw $0002,ExtendedSpritemap_Draygon_2D
    dw Instruction_DraygonBody_DisplaceGraphics,$FFF8,$FFF8
    dw $0001,ExtendedSpritemap_Draygon_2E
    dw Instruction_DraygonBody_DisplaceGraphics,$0000,$0000
    dw $0010,ExtendedSpritemap_Draygon_2F
    dw $0001,ExtendedSpritemap_Draygon_2E
    dw $0002,ExtendedSpritemap_Draygon_2D
    dw $0003,ExtendedSpritemap_Draygon_2C
    dw $0004,ExtendedSpritemap_Draygon_2B
    dw $0005,ExtendedSpritemap_Draygon_2A
    dw $0006,ExtendedSpritemap_Draygon_29
    dw Instruction_Common_GotoY
    dw InstList_DraygonTail_FacingLeft_Idle_0


;;; $9A68: Instruction list - Draygon tail - facing left - final tail whips ;;;
InstList_DraygonTail_FacingLeft_FinalTailWhips_0:
    dw Instruction_Common_TimerInY,$0004

InstList_DraygonTail_FacingLeft_FinalTailWhips_1:
    dw Instruction_DraygonBody_DisplaceGraphics,$FFFF,$FFFF
    dw $0002,ExtendedSpritemap_Draygon_24
    dw Instruction_DraygonBody_DisplaceGraphics,$FFFE,$FFFE
    dw $0006,ExtendedSpritemap_Draygon_29
    dw Instruction_DraygonBody_DisplaceGraphics,$FFFD,$FFFD
    dw $0005,ExtendedSpritemap_Draygon_2A
    dw Instruction_DraygonBody_DisplaceGraphics,$FFFC,$FFFC
    dw $0004,ExtendedSpritemap_Draygon_2B
    dw Instruction_DraygonBody_DisplaceGraphics,$FFFB,$FFFB
    dw $0003,ExtendedSpritemap_Draygon_2C
    dw Instruction_DraygonBody_DisplaceGraphics,$FFFA,$FFFA
    dw $0002,ExtendedSpritemap_Draygon_2D
    dw Instruction_DraygonBody_DisplaceGraphics,$FFF8,$FFF8
    dw $0001,ExtendedSpritemap_Draygon_2E
    dw Instruction_DraygonBody_DisplaceGraphics,$0000,$0000
    dw Instruction_DraygonTail_TailWhipHit
    dw Instruction_Draygon_QueueSFXInY_Lib2_Max6,$0025
    dw $0003,ExtendedSpritemap_Draygon_2F
    dw $0001,ExtendedSpritemap_Draygon_2E
    dw $0002,ExtendedSpritemap_Draygon_2D
    dw $0003,ExtendedSpritemap_Draygon_2C
    dw $0004,ExtendedSpritemap_Draygon_2B
    dw $0005,ExtendedSpritemap_Draygon_2A
    dw $0006,ExtendedSpritemap_Draygon_29
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate
    dw InstList_DraygonTail_FacingLeft_FinalTailWhips_1
    dw Instruction_Draygon_BodyFunctionInY
    dw Function_DraygonBody_GrabbedSamus_FlailTail_FlyStraightUp
    dw Instruction_Common_GotoY
    dw InstList_DraygonTail_FacingLeft_Idle_0

InstList_DraygonTail_FacingLeft_FinalTailWhips_2:
    dw Instruction_Common_Sleep


;;; $9AE8: Instruction list - Draygon tail - facing left - tail whip ;;;
InstList_DraygonTail_FacingLeft_TailWhip:
    dw Instruction_DraygonBody_DisplaceGraphics,$FFFF,$FFFF
    dw $0002,ExtendedSpritemap_Draygon_24
    dw Instruction_DraygonBody_DisplaceGraphics,$FFFE,$FFFE
    dw $0006,ExtendedSpritemap_Draygon_29
    dw Instruction_DraygonBody_DisplaceGraphics,$FFFD,$FFFD
    dw $0005,ExtendedSpritemap_Draygon_2A
    dw Instruction_DraygonBody_DisplaceGraphics,$FFFC,$FFFC
    dw $0004,ExtendedSpritemap_Draygon_2B
    dw Instruction_DraygonBody_DisplaceGraphics,$FFFB,$FFFB
    dw $0003,ExtendedSpritemap_Draygon_2C
    dw Instruction_DraygonBody_DisplaceGraphics,$FFFA,$FFFA
    dw $0002,ExtendedSpritemap_Draygon_2D
    dw Instruction_DraygonBody_DisplaceGraphics,$FFF8,$FFF8
    dw $0001,ExtendedSpritemap_Draygon_2E
    dw Instruction_DraygonBody_DisplaceGraphics,$0000,$0000
    dw Instruction_DraygonTail_TailWhipHit
    dw Instruction_Draygon_QueueSFXInY_Lib2_Max6,$0025
    dw $0003,ExtendedSpritemap_Draygon_2F
    dw $0001,ExtendedSpritemap_Draygon_2E
    dw $0002,ExtendedSpritemap_Draygon_2D
    dw $0003,ExtendedSpritemap_Draygon_2C
    dw $0004,ExtendedSpritemap_Draygon_2B
    dw $0005,ExtendedSpritemap_Draygon_2A
    dw $0006,ExtendedSpritemap_Draygon_29
    dw Instruction_Common_GotoY
    dw InstList_DraygonTail_FacingLeft_Idle_0


;;; $9B5A: Instruction list - Draygon tail - facing left - tail flail ;;;
InstList_DraygonTail_FacingLeft_TailFlail:
; A tail whip move that Draygon does when Samus isn't grabbed (so it doesn't move Draygon's back or do a Samus hit)
    dw $0002,ExtendedSpritemap_Draygon_24
    dw $0006,ExtendedSpritemap_Draygon_29
    dw $0005,ExtendedSpritemap_Draygon_2A
    dw $0004,ExtendedSpritemap_Draygon_2B
    dw $0003,ExtendedSpritemap_Draygon_2C
    dw $0002,ExtendedSpritemap_Draygon_2D
    dw $0001,ExtendedSpritemap_Draygon_2E
    dw Instruction_Draygon_QueueSFXInY_Lib2_Max6,$0025
    dw $0003,ExtendedSpritemap_Draygon_2F
    dw $0001,ExtendedSpritemap_Draygon_2E
    dw $0002,ExtendedSpritemap_Draygon_2D
    dw $0003,ExtendedSpritemap_Draygon_2C
    dw $0004,ExtendedSpritemap_Draygon_2B
    dw $0005,ExtendedSpritemap_Draygon_2A
    dw $0006,ExtendedSpritemap_Draygon_29
    dw Instruction_Common_GotoY
    dw InstList_DraygonTail_FacingLeft_Idle_0


;;; $9B9A: Instruction - Draygon tail whip hit ;;;
Instruction_DraygonTail_TailWhipHit:
; Uses the damage from the Draygon body enemy and not the Draygon tail enemy :(
    PHX : PHY
    LDA.W #$0018 : STA.L DraygonBody.swoopYAcceleration
    LDX.W Enemy.ID
    LDA.L EnemyHeaders_damage,X
    JSL Suit_Damage_Division
    JSL Deal_A_Damage_to_Samus
    LDA.W #$0020 : STA.W EarthquakeTimer
    LDA.W #$0007 : STA.W EarthquakeType
    LDA.W SamusXPosition : STA.B DP_Temp12
    LDA.W SamusYPosition : CLC : ADC.W #$0010 : STA.B DP_Temp14
    LDA.W #$0015 : STA.B DP_Temp16
    STZ.B DP_Temp18
    JSL Create_Sprite_Object
    PLY : PLX
    RTL


;;; $9BDA: Instruction list - Draygon arms - facing right - idle ;;;
InstList_DraygonArms_FacingRight_Idle_0:
    dw $0005,ExtendedSpritemap_Draygon_34
    dw $0005,ExtendedSpritemap_Draygon_35
    dw $0005,ExtendedSpritemap_Draygon_36
    dw $0005,ExtendedSpritemap_Draygon_37
    dw $0005,ExtendedSpritemap_Draygon_38
    dw $0005,ExtendedSpritemap_Draygon_39
    dw Instruction_Common_GotoY
    dw InstList_DraygonArms_FacingRight_Idle_0

InstList_DraygonArms_FacingRight_Idle_1:
    dw Instruction_Common_Sleep


if !FEATURE_KEEP_UNREFERENCED
;;; $9BF8: Unused. Instruction list - Draygon arms ;;;
UNUSED_InstList_DraygonArms_A59BF8:
    dw $0001,ExtendedSpritemap_Draygon_4D
    dw $0001,ExtendedSpritemap_Draygon_4C
    dw $0040,ExtendedSpritemap_Draygon_4B
    dw Instruction_Common_Sleep
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $9C06: Instruction list - Draygon arms - facing right - near swoop apex ;;;
InstList_DraygonArms_FacingRight_NearSwoopApex:
    dw $0001,ExtendedSpritemap_Draygon_4B
    dw $0001,ExtendedSpritemap_Draygon_4C
    dw $0001,ExtendedSpritemap_Draygon_4D
    dw $0040,ExtendedSpritemap_Draygon_4E
    dw Instruction_Common_Sleep


;;; $9C18: Instruction list - Draygon arms - facing right - fake grab ;;;
Debug_InstList_DraygonArms_FacingRight_FakeGrab:
; Only set by debug routine
    dw $0001,ExtendedSpritemap_Draygon_4B
    dw $0001,ExtendedSpritemap_Draygon_4C
    dw $0001,ExtendedSpritemap_Draygon_4D
    dw $0040,ExtendedSpritemap_Draygon_4E
    dw $0001,ExtendedSpritemap_Draygon_4D
    dw $0001,ExtendedSpritemap_Draygon_4C
    dw $0040,ExtendedSpritemap_Draygon_4B
    dw Instruction_Common_GotoY
    dw InstList_DraygonArms_FacingRight_Idle_0


;;; $9C38: Instruction list - Draygon arms - facing right - grab ;;;
InstList_DraygonArms_FacingRight_Grab:
    dw $0001,ExtendedSpritemap_Draygon_4B
    dw $0001,ExtendedSpritemap_Draygon_4C
    dw $0001,ExtendedSpritemap_Draygon_4D
    dw $0008,ExtendedSpritemap_Draygon_4E
    dw $0001,ExtendedSpritemap_Draygon_4D
    dw $0001,ExtendedSpritemap_Draygon_4C
    dw $0001,ExtendedSpritemap_Draygon_4B
    dw $0001,ExtendedSpritemap_Draygon_4C
    dw Instruction_Common_Sleep


;;; $9C5A: Instruction list - Draygon body - facing right - dying ;;;
InstList_DraygonArms_FacingRight_Dying_0:
    dw $0005,ExtendedSpritemap_Draygon_3A
    dw $0005,ExtendedSpritemap_Draygon_3B
    dw $0005,ExtendedSpritemap_Draygon_3C
    dw $0005,ExtendedSpritemap_Draygon_3D
    dw Instruction_Common_GotoY
    dw InstList_DraygonBody_Dying_0

InstList_DraygonBody_FacingRight_Dying_1:
    dw Instruction_Common_Sleep


if !FEATURE_KEEP_UNREFERENCED
;;; $9C70: Unused. Instruction list - Draygon body ;;;
UNUSED_InstList_DraygonBody_A59C70:
    dw $0005,ExtendedSpritemap_Draygon_3C
    dw $0005,ExtendedSpritemap_Draygon_3B
    dw $0005,ExtendedSpritemap_Draygon_3A
    dw Instruction_Common_Sleep
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $9C7E: Instruction list - Draygon body - facing right - idle ;;;
InstList_DraygonBody_FacingRight_Idle:
    dw Instruction_Draygon_RoomLoadingInterruptCmd_BeginHUDDraw_dup
    dw Instruction_Draygon_EyeFunctionInY
    dw Function_DraygonEye_FacingRight
    dw $0001,ExtendedSpritemap_Draygon_4A
    dw Instruction_Common_Sleep


;;; $9C8A: Instruction - room loading interrupt command = Draygon's room - begin HUD drawing ;;;
Instruction_Draygon_RoomLoadingInterruptCmd_BeginHUDDraw_dup:
    LDA.W #$000C : STA.B DP_RoomLoadIRQCmd
    RTL


;;; $9C90: Instruction list - Draygon body - facing right - fire goop ;;;
InstList_DraygonBody_FacingRight_FireGoop:
    dw $0001,ExtendedSpritemap_Draygon_3E
    dw $0002,ExtendedSpritemap_Draygon_3F
    dw $0003,ExtendedSpritemap_Draygon_40
    dw Instruction_Draygon_SpawnGoop_Rightwards
    dw Instruction_Draygon_QueueSFXInY_Lib2_Max6,$004C
    dw $0003,ExtendedSpritemap_Draygon_41
    dw $0002,ExtendedSpritemap_Draygon_40
    dw $0002,ExtendedSpritemap_Draygon_3F
    dw $0001,ExtendedSpritemap_Draygon_3E
    dw Instruction_Common_Sleep


;;; $9CB4: Instruction list - Draygon body - facing right - roar ;;;
InstList_DraygonBody_FacingRight_Roar:
    dw Instruction_Draygon_QueueSFXInY_Lib2_Max6,$0073
    dw $0006,ExtendedSpritemap_Draygon_3E
    dw $0006,ExtendedSpritemap_Draygon_3F
    dw $0006,ExtendedSpritemap_Draygon_40
    dw $0006,ExtendedSpritemap_Draygon_41
    dw $0006,ExtendedSpritemap_Draygon_40
    dw $0006,ExtendedSpritemap_Draygon_3F
    dw $0006,ExtendedSpritemap_Draygon_3E
    dw Instruction_Common_Sleep


;;; $9CD6: Instruction list - Draygon eye - facing right - idle ;;;
InstList_DraygonEye_FacingRight_Idle:
    dw $0015,ExtendedSpritemap_Draygon_42
    dw $0005,ExtendedSpritemap_Draygon_43
    dw $0005,ExtendedSpritemap_Draygon_44
    dw $000A,ExtendedSpritemap_Draygon_43
    dw $000A,ExtendedSpritemap_Draygon_46
    dw $000A,ExtendedSpritemap_Draygon_46
    dw $000A,ExtendedSpritemap_Draygon_48
    dw $000A,ExtendedSpritemap_Draygon_48
    dw $000A,ExtendedSpritemap_Draygon_49
    dw $0005,ExtendedSpritemap_Draygon_44
    dw $0005,ExtendedSpritemap_Draygon_43
    dw $0005,ExtendedSpritemap_Draygon_42
    dw Instruction_Draygon_FunctionInY
    dw Function_DraygonEye_FacingLeft
    dw Instruction_Common_Sleep


if !FEATURE_KEEP_UNREFERENCED
;;; $9D0C: Unused. Instruction list - Draygon eye ;;;
UNUSED_InstList_DraygonEye_A59D0C:
    dw $0015,ExtendedSpritemap_Draygon_42
    dw $0005,ExtendedSpritemap_Draygon_43
    dw $0005,ExtendedSpritemap_Draygon_44
    dw $000A,ExtendedSpritemap_Draygon_45
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $9D1C: Instruction list - Draygon eye - facing right - dying ;;;
InstList_DraygonEye_FacingRight_Dying_0:
    dw Instruction_Common_TimerInY,$0004

InstList_DraygonEye_FacingRight_Dying_1:
    dw $0004,ExtendedSpritemap_Draygon_46
    dw $0004,ExtendedSpritemap_Draygon_48
    dw $0004,ExtendedSpritemap_Draygon_47
    dw $0004,ExtendedSpritemap_Draygon_49
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate
    dw InstList_DraygonEye_FacingRight_Dying_1
    dw $0020,ExtendedSpritemap_Draygon_45
    dw $0010,ExtendedSpritemap_Draygon_44
    dw Instruction_Common_Sleep


;;; $9D3E: Instruction list - Draygon eye - facing right - dead ;;;
InstList_DraygonEye_FacingRight_Dead:
    dw $0020,ExtendedSpritemap_Draygon_45
    dw $0020,ExtendedSpritemap_Draygon_44
    dw $0020,ExtendedSpritemap_Draygon_43
    dw $0001,ExtendedSpritemap_Draygon_42
    dw Instruction_Common_Sleep


;;; $9D50: Instruction list - Draygon eye - facing right - looking right ;;;
InstList_DraygonEye_FacingRight_LookingRight:
    dw $0001,ExtendedSpritemap_Draygon_46
    dw Instruction_Common_Sleep


;;; $9D56: Instruction list - Draygon eye - facing right - looking left ;;;
InstList_DraygonEye_FacingRight_LookingLeft:
    dw $0001,ExtendedSpritemap_Draygon_47
    dw Instruction_Common_Sleep


;;; $9D5C: Instruction list - Draygon eye - facing right - looking up ;;;
InstList_DraygonEye_FacingRight_LookingUp:
    dw $0001,ExtendedSpritemap_Draygon_48
    dw Instruction_Common_Sleep


;;; $9D62: Instruction list - Draygon eye - facing right - looking down ;;;
InstList_DraygonEye_FacingRight_LookingDown:
    dw $0001,ExtendedSpritemap_Draygon_49
    dw Instruction_Common_Sleep


;;; $9D68: Instruction list - Draygon tail - facing right - idle ;;;
InstList_DraygonTail_FacingRight_Idle_0:
    dw $0008,ExtendedSpritemap_Draygon_59
    dw $0007,ExtendedSpritemap_Draygon_5A
    dw $0006,ExtendedSpritemap_Draygon_5B
    dw $0006,ExtendedSpritemap_Draygon_5C
    dw $0006,ExtendedSpritemap_Draygon_5D
    dw $0006,ExtendedSpritemap_Draygon_5E
    dw $0006,ExtendedSpritemap_Draygon_5F
    dw $0006,ExtendedSpritemap_Draygon_5E
    dw $0006,ExtendedSpritemap_Draygon_5D
    dw $0006,ExtendedSpritemap_Draygon_5C
    dw $0006,ExtendedSpritemap_Draygon_5B
    dw $0007,ExtendedSpritemap_Draygon_5A
    dw Instruction_Common_GotoY
    dw InstList_DraygonTail_FacingRight_Idle_0

InstList_DraygonTail_FacingRight_Idle_1:
    dw Instruction_Common_Sleep


;;; $9D9E: Instruction list - Draygon tail - facing right - fake tail whip ;;;
Debug_InstList_DraygonTail_FacingRight_FakeTailWhip:
; Only set by debug routine
    dw Instruction_DraygonBody_DisplaceGraphics,$0001,$FFFF
    dw $0010,ExtendedSpritemap_Draygon_5B
    dw Instruction_DraygonBody_DisplaceGraphics,$0002,$FFFE
    dw $0006,ExtendedSpritemap_Draygon_60
    dw Instruction_DraygonBody_DisplaceGraphics,$0003,$FFFD
    dw $0005,ExtendedSpritemap_Draygon_61
    dw Instruction_DraygonBody_DisplaceGraphics,$0004,$FFFC
    dw $0004,ExtendedSpritemap_Draygon_62
    dw Instruction_DraygonBody_DisplaceGraphics,$0005,$FFFB
    dw $0003,ExtendedSpritemap_Draygon_63
    dw Instruction_DraygonBody_DisplaceGraphics,$0006,$FFFA
    dw $0002,ExtendedSpritemap_Draygon_64
    dw Instruction_DraygonBody_DisplaceGraphics,$0008,$FFF9
    dw $0001,ExtendedSpritemap_Draygon_65
    dw Instruction_DraygonBody_DisplaceGraphics,$0000,$0000
    dw $0010,ExtendedSpritemap_Draygon_66
    dw $0001,ExtendedSpritemap_Draygon_65
    dw $0002,ExtendedSpritemap_Draygon_64
    dw $0003,ExtendedSpritemap_Draygon_63
    dw $0004,ExtendedSpritemap_Draygon_62
    dw $0005,ExtendedSpritemap_Draygon_61
    dw $0006,ExtendedSpritemap_Draygon_60
    dw Instruction_Common_GotoY
    dw InstList_DraygonTail_FacingRight_Idle_0


;;; $9E0A: Instruction - displace Draygon body graphics [[Y]] px left, [[Y] + 2] px down ;;;
Instruction_DraygonBody_DisplaceGraphics:
    PHX : PHY
    LDA.W $0000,Y : STA.L DraygonBody.bodyGraphicsXDisplacement
    LDA.W $0002,Y : STA.L DraygonBody.bodyGraphicsYDisplacement
    PLY : PLX
    INY #4
    RTL


;;; $9E21: Instruction list - Draygon tail - facing right - final tail whips ;;;
InstList_DraygonTail_FacingRight_FinalTailWhips_0:
    dw Instruction_Common_TimerInY,$0004

InstList_DraygonTail_FacingRight_FinalTailWhips_1:
    dw Instruction_DraygonBody_DisplaceGraphics,$0001,$FFFF
    dw $0002,ExtendedSpritemap_Draygon_5B
    dw Instruction_DraygonBody_DisplaceGraphics,$0002,$FFFE
    dw $0006,ExtendedSpritemap_Draygon_60
    dw Instruction_DraygonBody_DisplaceGraphics,$0003,$FFFD
    dw $0005,ExtendedSpritemap_Draygon_61
    dw Instruction_DraygonBody_DisplaceGraphics,$0004,$FFFC
    dw $0004,ExtendedSpritemap_Draygon_62
    dw Instruction_DraygonBody_DisplaceGraphics,$0005,$FFFB
    dw $0003,ExtendedSpritemap_Draygon_63
    dw Instruction_DraygonBody_DisplaceGraphics,$0006,$FFFA
    dw $0002,ExtendedSpritemap_Draygon_64
    dw Instruction_DraygonBody_DisplaceGraphics,$0008,$FFF8
    dw $0001,ExtendedSpritemap_Draygon_65
    dw Instruction_DraygonBody_DisplaceGraphics,$0000,$0000
    dw Instruction_DraygonTail_TailWhipHit
    dw Instruction_Draygon_QueueSFXInY_Lib2_Max6,$0025
    dw $0003,ExtendedSpritemap_Draygon_66
    dw $0001,ExtendedSpritemap_Draygon_65
    dw $0002,ExtendedSpritemap_Draygon_64
    dw $0003,ExtendedSpritemap_Draygon_63
    dw $0004,ExtendedSpritemap_Draygon_62
    dw $0005,ExtendedSpritemap_Draygon_61
    dw $0006,ExtendedSpritemap_Draygon_60
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate
    dw InstList_DraygonTail_FacingRight_FinalTailWhips_1
    dw Instruction_Draygon_BodyFunctionInY
    dw Function_DraygonBody_GrabbedSamus_FlailTail_FlyStraightUp
    dw Instruction_Common_GotoY
    dw InstList_DraygonTail_FacingRight_Idle_0

InstList_DraygonTail_FacingRight_FinalTailWhips_2:
    dw Instruction_Common_Sleep


;;; $9EA1: Instruction list - Draygon tail - facing right - tail whip ;;;
InstList_DraygonTail_FacingRight_TailWhip_0:
    dw Instruction_DraygonBody_DisplaceGraphics,$0001,$FFFF
    dw $0002,ExtendedSpritemap_Draygon_5B
    dw Instruction_DraygonBody_DisplaceGraphics,$0002,$FFFE
    dw $0006,ExtendedSpritemap_Draygon_60
    dw Instruction_DraygonBody_DisplaceGraphics,$0003,$FFFD
    dw $0005,ExtendedSpritemap_Draygon_61
    dw Instruction_DraygonBody_DisplaceGraphics,$0004,$FFFC
    dw $0004,ExtendedSpritemap_Draygon_62
    dw Instruction_DraygonBody_DisplaceGraphics,$0005,$FFFB
    dw $0003,ExtendedSpritemap_Draygon_63
    dw Instruction_DraygonBody_DisplaceGraphics,$0006,$FFFA
    dw $0002,ExtendedSpritemap_Draygon_64
    dw Instruction_DraygonBody_DisplaceGraphics,$0008,$FFF8
    dw $0001,ExtendedSpritemap_Draygon_65
    dw Instruction_DraygonBody_DisplaceGraphics,$0000,$0000
    dw Instruction_DraygonTail_TailWhipHit
    dw Instruction_Draygon_QueueSFXInY_Lib2_Max6,$0025
    dw $0003,ExtendedSpritemap_Draygon_66
    dw $0001,ExtendedSpritemap_Draygon_65
    dw $0002,ExtendedSpritemap_Draygon_64
    dw $0003,ExtendedSpritemap_Draygon_63
    dw $0004,ExtendedSpritemap_Draygon_62
    dw $0005,ExtendedSpritemap_Draygon_61
    dw $0006,ExtendedSpritemap_Draygon_60
    dw Instruction_Common_GotoY
    dw InstList_DraygonTail_FacingRight_Idle_0

InstList_DraygonTail_FacingRight_TailWhip_1:
    dw Instruction_Common_Sleep


;;; $9F15: Instruction list - Draygon tail - facing right - tail flail ;;;
InstList_DraygonTail_FacingRight_TailFlail_0:
; A tail whip move that Draygon does when Samus isn't grabbed (so it doesn't move Draygon's back or do a Samus hit)
    dw $0002,ExtendedSpritemap_Draygon_5B
    dw $0006,ExtendedSpritemap_Draygon_60
    dw $0005,ExtendedSpritemap_Draygon_61
    dw $0004,ExtendedSpritemap_Draygon_62
    dw $0003,ExtendedSpritemap_Draygon_63
    dw $0002,ExtendedSpritemap_Draygon_64
    dw $0001,ExtendedSpritemap_Draygon_65
    dw Instruction_Draygon_QueueSFXInY_Lib2_Max6,$0025
    dw $0003,ExtendedSpritemap_Draygon_66
    dw $0001,ExtendedSpritemap_Draygon_65
    dw $0002,ExtendedSpritemap_Draygon_64
    dw $0003,ExtendedSpritemap_Draygon_63
    dw $0004,ExtendedSpritemap_Draygon_62
    dw $0005,ExtendedSpritemap_Draygon_61
    dw $0006,ExtendedSpritemap_Draygon_60
    dw Instruction_Common_GotoY
    dw InstList_DraygonTail_FacingRight_Idle_0

InstList_DraygonTail_FacingRight_TailFlail_1:
    dw Instruction_Common_Sleep


;;; $9F57: Instruction - Draygon body function = [[Y]] ;;;
Instruction_Draygon_BodyFunctionInY:
    LDA.W $0000,Y : STA.W DraygonBody.function
    INY #2
    RTL


;;; $9F60: Instruction - queue sound [[Y]], sound library 2, max sounds allowed = 6 ;;;
Instruction_Draygon_QueueSFXInY_Lib2_Max6:
    PHX : PHY
    LDA.W $0000,Y
    JSL QueueSound_Lib2_Max6
    PLY : PLX
    INY #2
    RTL


;;; $9F6E: Instruction - queue sound [[Y]], sound library 3, max sounds allowed = 6 ;;;
Instruction_Draygon_QueueSFXInY_Lib3_Max6:
    PHX : PHY
    LDA.W $0000,Y
    JSL QueueSound_Lib3_Max6
    PLY : PLX
    INY #2
    RTL


;;; $9F7C: Instruction - spawn Draygon goop - leftwards ;;;
Instruction_Draygon_SpawnGoop_Leftwards:
; Doesn't set enemy projectile initialisation parameter 0 (speed) :/
    PHX : PHY
    LDX.W EnemyIndex ; >.<
    LDA.W Enemy.XPosition : CLC : ADC.W #$FFE4 : STA.B DP_Temp12
    LDA.W Enemy.YPosition : CLC : ADC.W #$FFF0 : STA.B DP_Temp14
    JSL GenerateRandomNumber
    AND.W #$003F : CLC : ADC.W #$0080 : STA.W EnemyProjectile_InitParam1
    LDY.W #EnemyProjectile_DraygonGoop
    LDA.W #$0002
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    PLY : PLX
    RTL


;;; $9FAE: Instruction - spawn Draygon goop - rightwards ;;;
Instruction_Draygon_SpawnGoop_Rightwards:
; Doesn't set enemy projectile initialisation parameter 0 (speed) :/
    PHX : PHY
    LDX.W EnemyIndex ; >.<
    LDA.W Enemy.XPosition : CLC : ADC.W #$0018 : STA.B DP_Temp12
    LDA.W Enemy.YPosition : CLC : ADC.W #$FFF0 : STA.B DP_Temp14
    JSL GenerateRandomNumber
    AND.W #$003F : CLC : ADC.W #$00C0 : STA.W EnemyProjectile_InitParam1
    LDY.W #EnemyProjectile_DraygonGoop
    LDA.W #$0002
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    PLY : PLX
    RTL


;;; $9FE0: Handle death sequence evir movement ;;;
HandleDeathSequenceEvirMovement:
; Where does $0E24 come from? Maybe CalculateDraygonSwoopYPositions? Only used when moving left. Supposed to be `SBC #$0000`?
    PHY
    LDX.W #$003E
    LDY.W #$0014

  .loop:
    LDA.W DraygonDeathSequenceEvirAngles,Y : CLC : ADC.W #$0040 : BIT.W #$0080 : BEQ +
    LDA.L SpriteObjects_XSubPositions,X : CLC : ADC.W DraygonDeathSequenceEvirSubSpeeds_X,Y : STA.L SpriteObjects_XSubPositions,X
    LDA.L SpriteObjects_XPositions,X : ADC.W #$0000 : STA.L SpriteObjects_XPositions,X
    BRA .YPosition

+   LDA.L SpriteObjects_XSubPositions,X : SEC : SBC.W DraygonDeathSequenceEvirSubSpeeds_X,Y : STA.L SpriteObjects_XSubPositions,X
    LDA.L SpriteObjects_XPositions,X : SBC.W Temp_XVelocity : STA.L SpriteObjects_XPositions,X

  .YPosition:
    LDA.W DraygonDeathSequenceEvirAngles,Y : CLC : ADC.W #$0080 : BIT.W #$0080 : BEQ +
    LDA.L SpriteObjects_YSubPositions,X : CLC : ADC.W DraygonDeathSequenceEvirSubSpeeds_Y,Y : STA.L SpriteObjects_YSubPositions,X
    LDA.L SpriteObjects_YPositions,X : ADC.W #$0000 : STA.L SpriteObjects_YPositions,X
    BRA .nextSpriteObject

+   LDA.L SpriteObjects_YSubPositions,X : SEC : SBC.W DraygonDeathSequenceEvirSubSpeeds_Y,Y : STA.L SpriteObjects_YSubPositions,X
    LDA.L SpriteObjects_YPositions,X : SBC.W #$0000 : STA.L SpriteObjects_YPositions,X

  .nextSpriteObject:
    DEX #2
    DEY #4 : BPL .gotoLoop
    PLY
    RTS

  .gotoLoop:
    JMP .loop


;;; $A06C: Spawn death sequence evir sprite objects ;;;
SpawnDeathSequenceEvirSpriteObjects:
    PHX : PHY
    LDX.W #$003E
    LDA.W #$0000

  .loopClearSpriteObjects:
    STA.L SpriteObjects_InstListPointers,X
    DEX #2 : BPL .loopClearSpriteObjects
    LDX.W #$0002
    LDY.W #$0014

  .loopLeft:
    LDA.W DraygonDeathSequenceEvirSpawnPositions_X,Y : STA.B DP_Temp12
    LDA.W DraygonDeathSequenceEvirSpawnPositions_Y,Y : STA.B DP_Temp14
    LDA.W #$003B : STA.B DP_Temp16
    LDA.W #$0E00 : STA.B DP_Temp18
    JSL Create_Sprite_Object
    DEY #4
    DEX : BPL .loopLeft
    LDX.W #$0002

  .loopRight:
    LDA.W DraygonDeathSequenceEvirSpawnPositions_X,Y : STA.B DP_Temp12
    LDA.W DraygonDeathSequenceEvirSpawnPositions_Y,Y : STA.B DP_Temp14
    LDA.W #$003C : STA.B DP_Temp16
    LDA.W #$0E00 : STA.B DP_Temp18
    JSL Create_Sprite_Object
    DEY #4
    DEX : BPL .loopRight
    PLY : PLX
    RTS


;;; $A0C6: Clear sprite objects ;;;
Draygon_ClearSpriteObjects:
    PHX : PHY
    LDX.W #$003E
    LDA.W #$0000

  .loop:
    STA.L SpriteObjects_InstListPointers,X
    DEX #2 : BPL .loop
    PLY : PLX
    RTS


;;; $A0D9: Spawn fight intro evir sprite objects ;;;
SpawnFightIntroEvirSpriteObjects:
    PHX : PHY
    LDA.W #$0010 : STA.B DP_Temp12
    LDA.W #$0180 : STA.B DP_Temp14
    LDA.W #$003B : STA.B DP_Temp16
    LDA.W #$0E00 : STA.B DP_Temp18
    JSL Create_Sprite_Object
    LDA.W #$0010 : STA.B DP_Temp12
    LDA.W #$0180 : STA.B DP_Temp14
    LDA.W #$003B : STA.B DP_Temp16
    LDA.W #$0E00 : STA.B DP_Temp18
    JSL Create_Sprite_Object
    LDA.W #$0010 : STA.B DP_Temp12
    LDA.W #$0180 : STA.B DP_Temp14
    LDA.W #$003B : STA.B DP_Temp16
    LDA.W #$0E00 : STA.B DP_Temp18
    JSL Create_Sprite_Object
    LDA.W #$0010 : STA.B DP_Temp12
    LDA.W #$0180 : STA.B DP_Temp14
    LDA.W #$003B : STA.B DP_Temp16
    LDA.W #$0E00 : STA.B DP_Temp18
    JSL Create_Sprite_Object
    PLY : PLX
    RTS


;;; $A13E: Handle Draygon fight intro dance ;;;
HandleDraygonFightIntroDance:
; There's 8 entries in the movement latency table MovementLatencyForEachEvirSpriteObject, but only 4 evir are processed
; I guess there was supposed to be 8 originally and then it was reduced to 4?
; In any case, it's the first four entries of the table that are used, where the last 4 would have made more sense
; The consequence of this is a 128 frames of this routine doing nothing
    PHY
    LDX.W #$003E

  .loop:
    TXA : SEC : SBC.W #$0038 : TAY
    LDA.W MovementLatencyForEachEvirSpriteObject,Y : CLC : ADC.L DraygonBody.fightIntroDanceIndex : BMI .next
    TAY
    LDA.W DraygonFightIntroDanceData_KeikoLove,Y : CMP.W #$8080 : BEQ .deleteSpriteObject
    LDA.W DraygonFightIntroDanceData_KeikoLove,Y : AND.W #$00FF
    JSL Sign_Extend_A
    CLC : ADC.L SpriteObjects_XPositions,X : STA.L SpriteObjects_XPositions,X
    LDA.W DraygonFightIntroDanceData_KeikoLove+1,Y : AND.W #$00FF
    JSL Sign_Extend_A
    CLC : ADC.L SpriteObjects_YPositions,X : STA.L SpriteObjects_YPositions,X

  .next:
    DEX #2 : CPX.W #$0038 : BPL .loop
    LDA.L DraygonBody.fightIntroDanceIndex : INC #4 : STA.L DraygonBody.fightIntroDanceIndex
    PLY
    RTS

  .deleteSpriteObject:
    LDA.W #$0000 : STA.L SpriteObjects_InstListPointers,X
    BRA .next


; Movement latency for each evir sprite object (each evir moves 80h bytes later in the movement table than the next)
MovementLatencyForEachEvirSpriteObject:
    dw $FC80,$FD00,$FD80,$FE00

if !FEATURE_KEEP_UNREFERENCED
UNUSED_MovementLatencyForEachEvirSpriteObject_A5A1A7:
    dw $FE80,$FF00,$FF80,$0000
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $A1AF: Death sequence evir subspeeds ;;;
DraygonDeathSequenceEvirSubSpeeds:
;        _________ X subspeed
;       |      ___ Y subspeed
;       |     |
  .X:
    dw $D4DA
  .Y:
    dw       $8E39 ; -0xFFFF * cos(68h * pi / 80h), 0xFFFF * sin(68h * pi / 80h)
    dw $8E39,$D4DA ; -0xFFFF * cos(58h * pi / 80h), 0xFFFF * sin(58h * pi / 80h)
    dw $31F1,$FB13 ; -0xFFFF * cos(48h * pi / 80h), 0xFFFF * sin(48h * pi / 80h)
    dw $31F1,$FB13 ;  0xFFFF * cos(38h * pi / 80h), 0xFFFF * sin(38h * pi / 80h)
    dw $8E39,$D4DA ;  0xFFFF * cos(28h * pi / 80h), 0xFFFF * sin(28h * pi / 80h)
    dw $D4DA,$8E39 ;  0xFFFF * cos(18h * pi / 80h), 0xFFFF * sin(18h * pi / 80h)


;;; $A1C7: Death sequence evir spawn positions ;;;
DraygonDeathSequenceEvirSpawnPositions:
;        _________ X position
;       |      ___ Y position
;       |     |
  .X:
    dw $FF59
  .Y:
    dw       $00E5
    dw $FFE5,$0059
    dw $009C,$000D
    dw $0163,$000D
    dw $021A,$0059
    dw $02A6,$00E5


;;; $A1DF: Death sequence evir angles ;;;
DraygonDeathSequenceEvirAngles:
; Used *only* to decide the sign of the X/Y subspeeds at DraygonDeathSequenceEvirSubSpeeds
; 0 = left(!), positive = clockwise
    dw $0068,$0000
    dw $0058,$0000
    dw $0048,$0000
    dw $0038,$0000
    dw $0028,$0000
    dw $0018,$0000


;;; $A1F7: Draygon palettes ;;;
Palette_Draygon_Sprite7:
; Sprite palette 7
    dw $3800,$3F57,$2E4D,$00E2,$0060,$3AB0,$220B,$1166
    dw $0924,$0319,$0254,$018F,$00CA,$581B,$1892,$0145

Palette_Draygon_Sprite1:
; Sprite palette 1
    dw $3800,$3F57,$2E4D,$00E2,$0060,$3AB0,$220B,$1166
    dw $0924,$0319,$0254,$018F,$00CA,$581B,$1892,$0145

Palette_Draygon_Sprite2:
; Sprite palette 2
    dw $3800,$6B5A,$5652,$28E7,$1863,$62B5,$4A10,$396B
    dw $3129,$43FF,$0113,$000F,$175C,$0299,$01D6,$03E0

Palette_Draygon_Sprite3:
; Sprite palette 3
    dw $3800,$4B9C,$3694,$0929,$0042,$42F7,$2A52,$19AD
    dw $116B,$1420,$1420,$1420,$1420,$1420,$1420,$1420

Palette_Draygon_BG12_5:
; BG1/2 palette 5
    dw $3800,$3F57,$2E4D,$00E2,$0060,$3AB0,$220B,$1166
    dw $0924,$0319,$0254,$018F,$00CA,$581B,$1892,$0145

Palette_Draygon_WhiteFlash:
; Flash
    dw $3800,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF
    dw $7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF,$7FFF


;;; $A2B7: Draygon extended spritemaps ;;;
ExtendedSpritemap_Draygon_0:
    dw $0001
    dw $0000,$0000
    dw Spritemap_Draygon_0
    dw Hitbox_Draygon_1B

ExtendedSpritemap_Draygon_1:
    dw $0001
    dw $0000,$0000
    dw Spritemap_Draygon_0
    dw Hitbox_Draygon_1B

ExtendedSpritemap_Draygon_2:
    dw $0001
    dw $0000,$0000
    dw Spritemap_Draygon_0
    dw Hitbox_Draygon_1B

ExtendedSpritemap_Draygon_3:
    dw $0001
    dw $0000,$0000
    dw Spritemap_Draygon_0
    dw Hitbox_Draygon_1B

ExtendedSpritemap_Draygon_4:
    dw $0001
    dw $0000,$0001
    dw Spritemap_Draygon_B
    dw Hitbox_Draygon_1B

ExtendedSpritemap_Draygon_5:
    dw $0001
    dw $0000,$0001
    dw Spritemap_Draygon_C
    dw Hitbox_Draygon_1B

ExtendedSpritemap_Draygon_6:
    dw $0001
    dw $0000,$0001
    dw Spritemap_Draygon_D
    dw Hitbox_Draygon_1B

ExtendedSpritemap_Draygon_7:
    dw $0001
    dw $0000,$0001
    dw Spritemap_Draygon_E
    dw Hitbox_Draygon_1B

ExtendedSpritemap_Draygon_8:
    dw $0001
    dw $0000,$0001
    dw Spritemap_Draygon_F
    dw Hitbox_Draygon_1B

ExtendedSpritemap_Draygon_9:
    dw $0001
    dw $0000,$0001
    dw Spritemap_Draygon_10
    dw Hitbox_Draygon_1B

ExtendedSpritemap_Draygon_A:
    dw $0001
    dw $0000,$0000
    dw ExtendedTilemap_Draygon_B
    dw Hitbox_Draygon_1A

ExtendedSpritemap_Draygon_B:
    dw $0001
    dw $0000,$0000
    dw ExtendedTilemap_Draygon_C
    dw Hitbox_Draygon_1A

ExtendedSpritemap_Draygon_C:
    dw $0001
    dw $0000,$0000
    dw ExtendedTilemap_Draygon_D
    dw Hitbox_Draygon_1A

ExtendedSpritemap_Draygon_D:
    dw $0001
    dw $0000,$0000
    dw ExtendedTilemap_Draygon_E
    dw Hitbox_Draygon_1A

ExtendedSpritemap_Draygon_E:
    dw $0001
    dw $0000,$0000
    dw ExtendedTilemap_Draygon_7
    dw Hitbox_Draygon_1A

ExtendedSpritemap_Draygon_F:
    dw $0001
    dw $0000,$0000
    dw ExtendedTilemap_Draygon_8
    dw Hitbox_Draygon_1A

ExtendedSpritemap_Draygon_10:
    dw $0001
    dw $0000,$0000
    dw ExtendedTilemap_Draygon_9
    dw Hitbox_Draygon_1A

ExtendedSpritemap_Draygon_11:
    dw $0001
    dw $0000,$0000
    dw ExtendedTilemap_Draygon_A
    dw Hitbox_Draygon_1A

ExtendedSpritemap_Draygon_12:
    dw $0001
    dw $0000,$0000
    dw ExtendedTilemap_Draygon_F
    dw Hitbox_Draygon_1B

ExtendedSpritemap_Draygon_13:
    dw $0001
    dw $0000,$0000
    dw ExtendedTilemap_Draygon_10
    dw Hitbox_Draygon_1B

ExtendedSpritemap_Draygon_14:
    dw $0001
    dw $0000,$0000
    dw ExtendedTilemap_Draygon_11
    dw Hitbox_Draygon_1B

ExtendedSpritemap_Draygon_15:
    dw $0001
    dw $0000,$0000
    dw ExtendedTilemap_Draygon_12
    dw Hitbox_Draygon_1B

ExtendedSpritemap_Draygon_16:
    dw $0001
    dw $0000,$0000
    dw ExtendedTilemap_Draygon_13
    dw Hitbox_Draygon_1B

ExtendedSpritemap_Draygon_17:
    dw $0001
    dw $0000,$0000
    dw ExtendedTilemap_Draygon_14
    dw Hitbox_Draygon_1B

ExtendedSpritemap_Draygon_18:
    dw $0001
    dw $0000,$0000
    dw ExtendedTilemap_Draygon_15
    dw Hitbox_Draygon_1B

ExtendedSpritemap_Draygon_19:
    dw $0001
    dw $0000,$0000
    dw ExtendedTilemap_Draygon_16
    dw Hitbox_Draygon_1B

ExtendedSpritemap_Draygon_1A:
    dw $0001
    dw $0000,$0000
    dw ExtendedTilemap_Draygon_17
    dw Hitbox_Draygon_1A

ExtendedSpritemap_Draygon_1B:
    dw $0001
    dw $0000,$0001
    dw Spritemap_Draygon_3
    dw Hitbox_Draygon_1B

ExtendedSpritemap_Draygon_1C:
    dw $0001
    dw $0000,$0001
    dw Spritemap_Draygon_4
    dw Hitbox_Draygon_1B

ExtendedSpritemap_Draygon_1D:
    dw $0001
    dw $0000,$0001
    dw Spritemap_Draygon_5
    dw Hitbox_Draygon_1B

ExtendedSpritemap_Draygon_1E:
    dw $0001
    dw $0000,$0001
    dw Spritemap_Draygon_6
    dw Hitbox_Draygon_1B

ExtendedSpritemap_Draygon_1F:
    dw $0001
    dw $0029,$0001
    dw Spritemap_Draygon_0
    dw Hitbox_Draygon_1B

ExtendedSpritemap_Draygon_20:
    dw $0001
    dw $0000,$0000
    dw ExtendedTilemap_Draygon_5
    dw Hitbox_Draygon_12

ExtendedSpritemap_Draygon_21:
    dw $0001
    dw $0000,$0000
    dw ExtendedTilemap_Draygon_6
    dw Hitbox_Draygon_12

ExtendedSpritemap_Draygon_22:
    dw $0002
    dw $001B,$003F
    dw Spritemap_Draygon_1A
    dw Hitbox_Draygon_1B
    dw $0037,$0021
    dw Spritemap_Draygon_7
    dw Hitbox_Draygon_1B

ExtendedSpritemap_Draygon_23:
    dw $0002
    dw $0017,$003D
    dw Spritemap_Draygon_19
    dw Hitbox_Draygon_1B
    dw $0037,$0021
    dw Spritemap_Draygon_7
    dw Hitbox_Draygon_1B

ExtendedSpritemap_Draygon_24:
    dw $0002
    dw $0013,$003A
    dw Spritemap_Draygon_18
    dw Hitbox_Draygon_1B
    dw $0037,$0021
    dw Spritemap_Draygon_8
    dw Hitbox_Draygon_1B

ExtendedSpritemap_Draygon_25:
    dw $0002
    dw $000E,$0035
    dw Spritemap_Draygon_17
    dw Hitbox_Draygon_1B
    dw $0037,$0021
    dw Spritemap_Draygon_8
    dw Hitbox_Draygon_1B

ExtendedSpritemap_Draygon_26:
    dw $0002
    dw $000C,$002E
    dw Spritemap_Draygon_16
    dw Hitbox_Draygon_1B
    dw $0037,$0021
    dw Spritemap_Draygon_9
    dw Hitbox_Draygon_1B

ExtendedSpritemap_Draygon_27:
    dw $0002
    dw $000E,$002D
    dw Spritemap_Draygon_15
    dw Hitbox_Draygon_1B
    dw $0037,$0021
    dw Spritemap_Draygon_9
    dw Hitbox_Draygon_1B

ExtendedSpritemap_Draygon_28:
    dw $0002
    dw $0011,$0028
    dw Spritemap_Draygon_14
    dw Hitbox_Draygon_1B
    dw $0037,$0021
    dw Spritemap_Draygon_A
    dw Hitbox_Draygon_1B

ExtendedSpritemap_Draygon_29:
    dw $0003
    dw $000B,$003C
    dw Spritemap_Draygon_18
    dw Hitbox_Draygon_1B
    dw $0019,$0032
    dw Spritemap_Draygon_24
    dw Hitbox_Draygon_1B
    dw $0037,$0021
    dw Spritemap_Draygon_7
    dw Hitbox_Draygon_1B

ExtendedSpritemap_Draygon_2A:
    dw $0004
    dw $0008,$0043
    dw Spritemap_Draygon_18
    dw Hitbox_Draygon_1B
    dw $0014,$0036
    dw Spritemap_Draygon_24
    dw Hitbox_Draygon_1B
    dw $0018,$0031
    dw Spritemap_Draygon_24
    dw Hitbox_Draygon_1B
    dw $0037,$0021
    dw Spritemap_Draygon_7
    dw Hitbox_Draygon_1B

ExtendedSpritemap_Draygon_2B:
    dw $0005
    dw $0009,$004D
    dw Spritemap_Draygon_19
    dw Hitbox_Draygon_1B
    dw $000F,$003D
    dw Spritemap_Draygon_24
    dw Hitbox_Draygon_1B
    dw $0013,$0036
    dw Spritemap_Draygon_24
    dw Hitbox_Draygon_1B
    dw $0019,$0031
    dw Spritemap_Draygon_23
    dw Hitbox_Draygon_1B
    dw $0037,$0021
    dw Spritemap_Draygon_8
    dw Hitbox_Draygon_1B

ExtendedSpritemap_Draygon_2C:
    dw $0006
    dw $FFF8,$004D
    dw Spritemap_Draygon_18
    dw Hitbox_Draygon_1B
    dw $0007,$0042
    dw Spritemap_Draygon_24
    dw Hitbox_Draygon_1B
    dw $000C,$003C
    dw Spritemap_Draygon_24
    dw Hitbox_Draygon_1B
    dw $0013,$0037
    dw Spritemap_Draygon_23
    dw Hitbox_Draygon_1B
    dw $001A,$0032
    dw Spritemap_Draygon_23
    dw Hitbox_Draygon_1B
    dw $0037,$0021
    dw Spritemap_Draygon_9
    dw Hitbox_Draygon_1B

ExtendedSpritemap_Draygon_2D:
    dw $0007
    dw $FFEC,$0037
    dw Spritemap_Draygon_15
    dw Hitbox_Draygon_1B
    dw $FFFC,$003D
    dw Spritemap_Draygon_24
    dw Hitbox_Draygon_1B
    dw $0005,$003F
    dw Spritemap_Draygon_24
    dw Hitbox_Draygon_1B
    dw $000D,$003E
    dw Spritemap_Draygon_23
    dw Hitbox_Draygon_1B
    dw $0015,$003A
    dw Spritemap_Draygon_23
    dw Hitbox_Draygon_1B
    dw $001B,$0034
    dw Spritemap_Draygon_22
    dw Hitbox_Draygon_1B
    dw $0037,$0021
    dw Spritemap_Draygon_A
    dw Hitbox_Draygon_1B

ExtendedSpritemap_Draygon_2E:
    dw $0008
    dw $FFED,$002E
    dw Spritemap_Draygon_14
    dw Hitbox_Draygon_1B
    dw $FFF9,$003A
    dw Spritemap_Draygon_24
    dw Hitbox_Draygon_1B
    dw $0000,$0040
    dw Spritemap_Draygon_24
    dw Hitbox_Draygon_1B
    dw $0008,$0041
    dw Spritemap_Draygon_23
    dw Hitbox_Draygon_1B
    dw $0011,$0043
    dw Spritemap_Draygon_23
    dw Hitbox_Draygon_1B
    dw $0019,$003F
    dw Spritemap_Draygon_22
    dw Hitbox_Draygon_1B
    dw $001D,$0035
    dw Spritemap_Draygon_22
    dw Hitbox_Draygon_1B
    dw $0037,$0021
    dw Spritemap_Draygon_A
    dw Hitbox_Draygon_1B

ExtendedSpritemap_Draygon_2F:
    dw $0008
    dw $FFF7,$0025
    dw Spritemap_Draygon_12
    dw Hitbox_Draygon_1B
    dw $FFF8,$0038
    dw Spritemap_Draygon_24
    dw Hitbox_Draygon_1B
    dw $FFFD,$0041
    dw Spritemap_Draygon_24
    dw Hitbox_Draygon_1B
    dw $0006,$0043
    dw Spritemap_Draygon_23
    dw Hitbox_Draygon_1B
    dw $0010,$0044
    dw Spritemap_Draygon_23
    dw Hitbox_Draygon_1B
    dw $0018,$0041
    dw Spritemap_Draygon_22
    dw Hitbox_Draygon_1B
    dw $001E,$0037
    dw Spritemap_Draygon_22
    dw Hitbox_Draygon_1B
    dw $0037,$0021
    dw Spritemap_Draygon_A
    dw Hitbox_Draygon_1B

ExtendedSpritemap_Draygon_30:
    dw $0001
    dw $0000,$0000
    dw Spritemap_Draygon_28
    dw Hitbox_Draygon_1B

ExtendedSpritemap_Draygon_31:
    dw $0001
    dw $0000,$0000
    dw Spritemap_Draygon_28
    dw Hitbox_Draygon_1B

ExtendedSpritemap_Draygon_32:
    dw $0001
    dw $0000,$0000
    dw Spritemap_Draygon_28
    dw Hitbox_Draygon_1B

ExtendedSpritemap_Draygon_33:
    dw $0001
    dw $0000,$0000
    dw Spritemap_Draygon_28
    dw Hitbox_Draygon_1B

ExtendedSpritemap_Draygon_34:
    dw $0001
    dw $0000,$0001
    dw Spritemap_Draygon_41
    dw Hitbox_Draygon_1B

ExtendedSpritemap_Draygon_35:
    dw $0001
    dw $0000,$0001
    dw Spritemap_Draygon_42
    dw Hitbox_Draygon_1B

ExtendedSpritemap_Draygon_36:
    dw $0001
    dw $0000,$0001
    dw Spritemap_Draygon_43
    dw Hitbox_Draygon_1B

ExtendedSpritemap_Draygon_37:
    dw $0001
    dw $0000,$0001
    dw Spritemap_Draygon_44
    dw Hitbox_Draygon_1B

ExtendedSpritemap_Draygon_38:
    dw $0001
    dw $0000,$0001
    dw Spritemap_Draygon_45
    dw Hitbox_Draygon_1B

ExtendedSpritemap_Draygon_39:
    dw $0001
    dw $0000,$0001
    dw Spritemap_Draygon_46
    dw Hitbox_Draygon_1B

ExtendedSpritemap_Draygon_3A:
    dw $0001
    dw $0000,$0000
    dw ExtendedTilemap_Draygon_23
    dw Hitbox_Draygon_2D

ExtendedSpritemap_Draygon_3B:
    dw $0001
    dw $0000,$0000
    dw ExtendedTilemap_Draygon_24
    dw Hitbox_Draygon_2D

ExtendedSpritemap_Draygon_3C:
    dw $0001
    dw $0000,$0000
    dw ExtendedTilemap_Draygon_25
    dw Hitbox_Draygon_2D

ExtendedSpritemap_Draygon_3D:
    dw $0001
    dw $0000,$0000
    dw ExtendedTilemap_Draygon_26
    dw Hitbox_Draygon_2D

ExtendedSpritemap_Draygon_3E:
    dw $0001
    dw $0000,$0000
    dw ExtendedTilemap_Draygon_1F
    dw Hitbox_Draygon_2D

ExtendedSpritemap_Draygon_3F:
    dw $0001
    dw $0000,$0000
    dw ExtendedTilemap_Draygon_20
    dw Hitbox_Draygon_2D

ExtendedSpritemap_Draygon_40:
    dw $0001
    dw $0000,$0000
    dw ExtendedTilemap_Draygon_21
    dw Hitbox_Draygon_2D

ExtendedSpritemap_Draygon_41:
    dw $0001
    dw $0000,$0000
    dw ExtendedTilemap_Draygon_22
    dw Hitbox_Draygon_2D

ExtendedSpritemap_Draygon_42:
    dw $0001
    dw $0000,$0000
    dw ExtendedTilemap_Draygon_27
    dw Hitbox_Draygon_1B

ExtendedSpritemap_Draygon_43:
    dw $0001
    dw $0000,$0000
    dw ExtendedTilemap_Draygon_28
    dw Hitbox_Draygon_1B

ExtendedSpritemap_Draygon_44:
    dw $0001
    dw $0000,$0000
    dw ExtendedTilemap_Draygon_29
    dw Hitbox_Draygon_1B

ExtendedSpritemap_Draygon_45:
    dw $0001
    dw $0000,$0000
    dw ExtendedTilemap_Draygon_2A
    dw Hitbox_Draygon_1B

ExtendedSpritemap_Draygon_46:
    dw $0001
    dw $0000,$0000
    dw ExtendedTilemap_Draygon_2B
    dw Hitbox_Draygon_1B

ExtendedSpritemap_Draygon_47:
    dw $0001
    dw $0000,$0000
    dw ExtendedTilemap_Draygon_2C
    dw Hitbox_Draygon_1B

ExtendedSpritemap_Draygon_48:
    dw $0001
    dw $0000,$0000
    dw ExtendedTilemap_Draygon_2D
    dw Hitbox_Draygon_1B

ExtendedSpritemap_Draygon_49:
    dw $0001
    dw $0000,$0000
    dw ExtendedTilemap_Draygon_2E
    dw Hitbox_Draygon_1B

ExtendedSpritemap_Draygon_4A:
    dw $0001
    dw $0000,$0000
    dw ExtendedTilemap_Draygon_2F
    dw Hitbox_Draygon_2D

ExtendedSpritemap_Draygon_4B:
    dw $0001
    dw $0000,$0001
    dw Spritemap_Draygon_2B
    dw Hitbox_Draygon_1B

ExtendedSpritemap_Draygon_4C:
    dw $0001
    dw $0000,$0001
    dw Spritemap_Draygon_2C
    dw Hitbox_Draygon_1B

ExtendedSpritemap_Draygon_4D:
    dw $0001
    dw $0000,$0001
    dw Spritemap_Draygon_2D
    dw Hitbox_Draygon_1B

ExtendedSpritemap_Draygon_4E:
    dw $0001
    dw $0000,$0001
    dw Spritemap_Draygon_2E
    dw Hitbox_Draygon_1B

ExtendedSpritemap_Draygon_4F:
    dw $0001
    dw $0000,$0000
    dw Spritemap_Draygon_28
    dw Hitbox_Draygon_1B

ExtendedSpritemap_Draygon_50:
    dw $0001
    dw $0000,$0000
    dw Spritemap_Draygon_28
    dw Hitbox_Draygon_1B

ExtendedSpritemap_Draygon_51:
    dw $0001
    dw $0000,$0000
    dw Spritemap_Draygon_28
    dw Hitbox_Draygon_1B

ExtendedSpritemap_Draygon_52:
    dw $0001
    dw $0000,$0000
    dw Spritemap_Draygon_28
    dw Hitbox_Draygon_1B

ExtendedSpritemap_Draygon_53:
    dw $0001
    dw $0000,$0000
    dw Spritemap_Draygon_28
    dw Hitbox_Draygon_1B

ExtendedSpritemap_Draygon_54:
    dw $0001
    dw $0000,$0000
    dw Spritemap_Draygon_28
    dw Hitbox_Draygon_1B

ExtendedSpritemap_Draygon_55:
    dw $0001
    dw $0000,$0000
    dw Spritemap_Draygon_28
    dw Hitbox_Draygon_1B

ExtendedSpritemap_Draygon_56:
    dw $0001
    dw $0000,$0000
    dw Spritemap_Draygon_28
    dw Hitbox_Draygon_1B

ExtendedSpritemap_Draygon_57:
    dw $0001
    dw $0000,$0000
    dw ExtendedTilemap_Draygon_1D
    dw Hitbox_Draygon_29

ExtendedSpritemap_Draygon_58:
    dw $0001
    dw $0000,$0000
    dw ExtendedTilemap_Draygon_1E
    dw Hitbox_Draygon_29

ExtendedSpritemap_Draygon_59:
    dw $0002
    dw $FFE5,$003F
    dw Spritemap_Draygon_50
    dw Hitbox_Draygon_1B
    dw $FFCE,$0021
    dw Spritemap_Draygon_34
    dw Hitbox_Draygon_1B

ExtendedSpritemap_Draygon_5A:
    dw $0002
    dw $FFE9,$003D
    dw Spritemap_Draygon_4F
    dw Hitbox_Draygon_1B
    dw $FFCE,$0021
    dw Spritemap_Draygon_34
    dw Hitbox_Draygon_1B

ExtendedSpritemap_Draygon_5B:
    dw $0002
    dw $FFED,$003A
    dw Spritemap_Draygon_4E
    dw Hitbox_Draygon_1B
    dw $FFCE,$0021
    dw Spritemap_Draygon_35
    dw Hitbox_Draygon_1B

ExtendedSpritemap_Draygon_5C:
    dw $0002
    dw $FFF2,$0035
    dw Spritemap_Draygon_4D
    dw Hitbox_Draygon_1B
    dw $FFCE,$0021
    dw Spritemap_Draygon_35
    dw Hitbox_Draygon_1B

ExtendedSpritemap_Draygon_5D:
    dw $0002
    dw $FFF4,$002E
    dw Spritemap_Draygon_4C
    dw Hitbox_Draygon_1B
    dw $FFCE,$0021
    dw Spritemap_Draygon_3F
    dw Hitbox_Draygon_1B

ExtendedSpritemap_Draygon_5E:
    dw $0002
    dw $FFF2,$002D
    dw Spritemap_Draygon_4B
    dw Hitbox_Draygon_1B
    dw $FFCE,$0021
    dw Spritemap_Draygon_3F
    dw Hitbox_Draygon_1B

ExtendedSpritemap_Draygon_5F:
    dw $0002
    dw $FFEF,$0028
    dw Spritemap_Draygon_4A
    dw Hitbox_Draygon_1B
    dw $FFCE,$0021
    dw Spritemap_Draygon_40
    dw Hitbox_Draygon_1B

ExtendedSpritemap_Draygon_60:
    dw $0003
    dw $FFF5,$003C
    dw Spritemap_Draygon_4E
    dw Hitbox_Draygon_2E
    dw $FFE7,$0032
    dw Spritemap_Draygon_5A
    dw Hitbox_Draygon_1B
    dw $FFCE,$0021
    dw Spritemap_Draygon_34
    dw Hitbox_Draygon_1B

ExtendedSpritemap_Draygon_61:
    dw $0004
    dw $FFF8,$0043
    dw Spritemap_Draygon_4E
    dw Hitbox_Draygon_2E
    dw $FFEC,$0036
    dw Spritemap_Draygon_5A
    dw Hitbox_Draygon_1B
    dw $FFE8,$0031
    dw Spritemap_Draygon_5A
    dw Hitbox_Draygon_1B
    dw $FFCE,$0021
    dw Spritemap_Draygon_34
    dw Hitbox_Draygon_1B

ExtendedSpritemap_Draygon_62:
    dw $0005
    dw $FFF7,$004D
    dw Spritemap_Draygon_4F
    dw Hitbox_Draygon_2E
    dw $FFF1,$003D
    dw Spritemap_Draygon_5A
    dw Hitbox_Draygon_1B
    dw $FFED,$0036
    dw Spritemap_Draygon_5A
    dw Hitbox_Draygon_1B
    dw $FFE7,$0031
    dw Spritemap_Draygon_59
    dw Hitbox_Draygon_1B
    dw $FFCE,$0021
    dw Spritemap_Draygon_35
    dw Hitbox_Draygon_1B

ExtendedSpritemap_Draygon_63:
    dw $0006
    dw $0008,$004D
    dw Spritemap_Draygon_4E
    dw Hitbox_Draygon_2E
    dw $FFF9,$0042
    dw Spritemap_Draygon_5A
    dw Hitbox_Draygon_1B
    dw $FFF4,$003C
    dw Spritemap_Draygon_5A
    dw Hitbox_Draygon_1B
    dw $FFED,$0037
    dw Spritemap_Draygon_59
    dw Hitbox_Draygon_1B
    dw $FFE6,$0032
    dw Spritemap_Draygon_59
    dw Hitbox_Draygon_1B
    dw $FFCE,$0021
    dw Spritemap_Draygon_35
    dw Hitbox_Draygon_1B

ExtendedSpritemap_Draygon_64:
    dw $0007
    dw $0014,$0037
    dw Spritemap_Draygon_4B
    dw Hitbox_Draygon_2E
    dw $0004,$003D
    dw Spritemap_Draygon_5A
    dw Hitbox_Draygon_1B
    dw $FFFB,$003F
    dw Spritemap_Draygon_5A
    dw Hitbox_Draygon_1B
    dw $FFF3,$003E
    dw Spritemap_Draygon_59
    dw Hitbox_Draygon_1B
    dw $FFEB,$003A
    dw Spritemap_Draygon_59
    dw Hitbox_Draygon_1B
    dw $FFE5,$0034
    dw Spritemap_Draygon_58
    dw Hitbox_Draygon_1B
    dw $FFCE,$0021
    dw Spritemap_Draygon_3F
    dw Hitbox_Draygon_1B

ExtendedSpritemap_Draygon_65:
    dw $0008
    dw $0013,$002E
    dw Spritemap_Draygon_4A
    dw Hitbox_Draygon_2E
    dw $0007,$003A
    dw Spritemap_Draygon_5A
    dw Hitbox_Draygon_1B
    dw $0000,$0040
    dw Spritemap_Draygon_5A
    dw Hitbox_Draygon_1B
    dw $FFF8,$0041
    dw Spritemap_Draygon_59
    dw Hitbox_Draygon_1B
    dw $FFEF,$0043
    dw Spritemap_Draygon_59
    dw Hitbox_Draygon_1B
    dw $FFE7,$003F
    dw Spritemap_Draygon_58
    dw Hitbox_Draygon_1B
    dw $FFE3,$0035
    dw Spritemap_Draygon_58
    dw Hitbox_Draygon_1B
    dw $FFCE,$0021
    dw Spritemap_Draygon_3F
    dw Hitbox_Draygon_1B

ExtendedSpritemap_Draygon_66:
    dw $0008
    dw $0009,$0025
    dw Spritemap_Draygon_48
    dw Hitbox_Draygon_2E
    dw $0008,$0038
    dw Spritemap_Draygon_5A
    dw Hitbox_Draygon_1B
    dw $0003,$0041
    dw Spritemap_Draygon_5A
    dw Hitbox_Draygon_1B
    dw $FFFA,$0043
    dw Spritemap_Draygon_59
    dw Hitbox_Draygon_1B
    dw $FFF0,$0044
    dw Spritemap_Draygon_59
    dw Hitbox_Draygon_1B
    dw $FFE8,$0041
    dw Spritemap_Draygon_58
    dw Hitbox_Draygon_1B
    dw $FFE2,$0037
    dw Spritemap_Draygon_58
    dw Hitbox_Draygon_1B
    dw $FFCE,$0021
    dw Spritemap_Draygon_40
    dw Hitbox_Draygon_1B


;;; $A94D: Draygon hitboxes ;;;
Hitbox_Draygon_0:
    dw $0001
    dw $0000,$0000,$0017,$001F
    dw EnemyTouch_Draygon
    dw Common_NormalEnemyShotAI

Hitbox_Draygon_1:
    dw $0001
    dw $0000,$0000,$0015,$001F
    dw EnemyTouch_Draygon
    dw Common_NormalEnemyShotAI

Hitbox_Draygon_2:
    dw $0001
    dw $0000,$0000,$000C,$0021
    dw EnemyTouch_Draygon
    dw Common_NormalEnemyShotAI

Hitbox_Draygon_3:
    dw $0001
    dw $FFF9,$FFF8,$0006,$0006
    dw EnemyTouch_Draygon
    dw Common_NormalEnemyShotAI

Hitbox_Draygon_4:
    dw $0001
    dw $FFF7,$FFF6,$0009,$0008
    dw EnemyTouch_Draygon
    dw Common_NormalEnemyShotAI

Hitbox_Draygon_5:
    dw $0001
    dw $FFF9,$FFF8,$0007,$0007
    dw EnemyTouch_Draygon
    dw Common_NormalEnemyShotAI

Hitbox_Draygon_6:
    dw $0001
    dw $FFF8,$FFF8,$0006,$0006
    dw EnemyTouch_Draygon
    dw Common_NormalEnemyShotAI

Hitbox_Draygon_7:
    dw $0001
    dw $FFF7,$FFF7,$0004,$0007
    dw RTL_A5804C
    dw RTL_A5804C

Hitbox_Draygon_8:
    dw $0000

Hitbox_Draygon_9:
    dw $0000

Hitbox_Draygon_A:
    dw $0001
    dw $FFFB,$FFFB,$0004,$0004
    dw EnemyTouch_Draygon
    dw Common_NormalEnemyShotAI

Hitbox_Draygon_B:
    dw $0001
    dw $FFFB,$FFFB,$0003,$0005
    dw EnemyTouch_Draygon
    dw Common_NormalEnemyShotAI

Hitbox_Draygon_C:
    dw $0001
    dw $FFFB,$FFFB,$0004,$0004
    dw EnemyTouch_Draygon
    dw Common_NormalEnemyShotAI

Hitbox_Draygon_D:
    dw $0001
    dw $FFF9,$FFF9,$0007,$0006
    dw EnemyTouch_Draygon
    dw Common_NormalEnemyShotAI

Hitbox_Draygon_E:
    dw $0001
    dw $FFFB,$FFFB,$0004,$0004
    dw EnemyTouch_Draygon
    dw Common_NormalEnemyShotAI

Hitbox_Draygon_F:
    dw $0001
    dw $FFFB,$FFFC,$0004,$0004
    dw EnemyTouch_Draygon
    dw Common_NormalEnemyShotAI

Hitbox_Draygon_10:
    dw $0001
    dw $FFFB,$FFFB,$0004,$0004
    dw EnemyTouch_Draygon
    dw Common_NormalEnemyShotAI

Hitbox_Draygon_11:
    dw $0000

Hitbox_Draygon_12:
    dw $0001
    dw $FFE2,$FFE6,$FFF2,$FFF5
    dw EnemyTouch_Draygon
    dw Common_NormalEnemyShotAI

Hitbox_Draygon_13:
    dw $0001
    dw $FFE1,$FFE6,$FFF2,$FFF6
    dw EnemyTouch_Draygon
    dw Common_NormalEnemyShotAI

Hitbox_Draygon_14:
    dw $0001
    dw $FFE1,$FFE6,$FFF2,$FFF6
    dw EnemyTouch_Draygon
    dw Common_NormalEnemyShotAI

Hitbox_Draygon_15:
    dw $0001
    dw $FFE1,$FFE6,$FFF2,$FFF7
    dw EnemyTouch_Draygon
    dw Common_NormalEnemyShotAI

Hitbox_Draygon_16:
    dw $0001
    dw $FFF3,$0000,$000A,$0017
    dw EnemyTouch_Draygon
    dw Common_NormalEnemyShotAI

Hitbox_Draygon_17:
    dw $0001
    dw $FFF3,$0000,$000A,$0017
    dw EnemyTouch_Draygon
    dw Common_NormalEnemyShotAI

Hitbox_Draygon_18:
    dw $0001
    dw $FFF3,$0000,$000A,$0017
    dw EnemyTouch_Draygon
    dw Common_NormalEnemyShotAI

Hitbox_Draygon_19:
    dw $0001
    dw $FFF3,$0000,$000A,$0017
    dw EnemyTouch_Draygon
    dw Common_NormalEnemyShotAI

Hitbox_Draygon_1A:
    dw $0004
    dw $FFEF,$FFF0,$0012,$001E
    dw RTL_A5804C
    dw EnemyShot_Draygon
    dw $FFC5,$FFBE,$0003,$FFE2
    dw EnemyTouch_Draygon
    dw Common_CreateADudShot
    dw $0010,$0001,$003C,$0035
    dw EnemyTouch_Draygon
    dw Common_CreateADudShot
    dw $FFE4,$FFDB,$003D,$FFF6
    dw EnemyTouch_Draygon
    dw Common_CreateADudShot

Hitbox_Draygon_1B:
    dw $0000

Hitbox_Draygon_1C:
    dw $0001
    dw $FFF9,$FFF8,$0006,$0006
    dw EnemyTouch_Draygon
    dw Common_NormalEnemyShotAI

Hitbox_Draygon_1D:
    dw $0001
    dw $FFF7,$FFF6,$0009,$0008
    dw EnemyTouch_Draygon
    dw Common_NormalEnemyShotAI

Hitbox_Draygon_1E:
    dw $0001
    dw $FFF9,$FFF8,$0007,$0007
    dw EnemyTouch_Draygon
    dw Common_NormalEnemyShotAI

Hitbox_Draygon_1F:
    dw $0001
    dw $FFF8,$FFF8,$0006,$0006
    dw EnemyTouch_Draygon
    dw Common_NormalEnemyShotAI

Hitbox_Draygon_20:
    dw $0001
    dw $FFFB,$FFF7,$0007,$0007
    dw RTL_A5804C
    dw RTL_A5804C

Hitbox_Draygon_21:
    dw $0001
    dw $FFFB,$FFFB,$0004,$0004
    dw EnemyTouch_Draygon
    dw Common_NormalEnemyShotAI

Hitbox_Draygon_22:
    dw $0001
    dw $FFFB,$FFFB,$0003,$0005
    dw EnemyTouch_Draygon
    dw Common_NormalEnemyShotAI

Hitbox_Draygon_23:
    dw $0001
    dw $FFFB,$FFFB,$0004,$0004
    dw EnemyTouch_Draygon
    dw Common_NormalEnemyShotAI

Hitbox_Draygon_24:
    dw $0001
    dw $FFF9,$FFF9,$0007,$0006
    dw EnemyTouch_Draygon
    dw Common_NormalEnemyShotAI

Hitbox_Draygon_25:
    dw $0001
    dw $FFFB,$FFFB,$0004,$0004
    dw EnemyTouch_Draygon
    dw Common_NormalEnemyShotAI

Hitbox_Draygon_26:
    dw $0001
    dw $FFFB,$FFFC,$0004,$0004
    dw EnemyTouch_Draygon
    dw Common_NormalEnemyShotAI

Hitbox_Draygon_27:
    dw $0001
    dw $FFFB,$FFFB,$0004,$0004
    dw EnemyTouch_Draygon
    dw Common_NormalEnemyShotAI

Hitbox_Draygon_28:
    dw $0000

Hitbox_Draygon_29:
    dw $0001
    dw $FFFA,$0000,$0010,$0017
    dw EnemyTouch_Draygon
    dw Common_NormalEnemyShotAI

Hitbox_Draygon_2A:
    dw $0001
    dw $FFFA,$0000,$0010,$0017
    dw EnemyTouch_Draygon
    dw Common_NormalEnemyShotAI

Hitbox_Draygon_2B:
    dw $0001
    dw $FFFA,$0000,$0010,$0017
    dw EnemyTouch_Draygon
    dw Common_NormalEnemyShotAI

Hitbox_Draygon_2C:
    dw $0001
    dw $FFFA,$0000,$0010,$0017
    dw EnemyTouch_Draygon
    dw Common_NormalEnemyShotAI

Hitbox_Draygon_2D:
    dw $0004
    dw $FFEE,$FFF9,$0012,$001E
    dw RTL_A5804C
    dw EnemyShot_Draygon
    dw $FFF6,$FFC1,$003E,$FFE6
    dw EnemyTouch_Draygon
    dw Common_CreateADudShot
    dw $FFC9,$0000,$FFEB,$0039
    dw EnemyTouch_Draygon
    dw Common_CreateADudShot
    dw $FFC2,$FFDF,$000F,$FFFB
    dw EnemyTouch_Draygon
    dw Common_CreateADudShot

Hitbox_Draygon_2E:
    dw $0000


;;; $ABDF: Draygon spritemaps / extended tilemaps ;;;
Spritemap_Draygon_0:
    dw $0004
    %spritemapEntry(1, $08, $10, 0, 0, 0, 3, $121)
    %spritemapEntry(1, $08, $00, 0, 0, 0, 3, $101)
    %spritemapEntry(1, $00, $10, 0, 0, 0, 3, $120)
    %spritemapEntry(1, $00, $00, 0, 0, 0, 3, $100)

Spritemap_Draygon_1:
    dw $0004
    %spritemapEntry(0, $00, $10, 0, 0, 2, 3, $123)
    %spritemapEntry(1, $00, $00, 0, 0, 2, 3, $103)
    %spritemapEntry(1, $08, $10, 0, 0, 2, 3, $124)
    %spritemapEntry(1, $08, $00, 0, 0, 2, 3, $104)

Spritemap_Draygon_2:
    dw $0002
    %spritemapEntry(1, $00, $10, 0, 0, 2, 3, $126)
    %spritemapEntry(1, $00, $00, 0, 0, 2, 3, $106)

Spritemap_Draygon_3:
    dw $0018
    %spritemapEntry(1, $1E5, $02, 0, 0, 2, 3, $11C)
    %spritemapEntry(1, $1DD, $0A, 0, 0, 2, 3, $12B)
    %spritemapEntry(1, $1ED, $FA, 0, 0, 2, 3, $10D)
    %spritemapEntry(0, $1F4, $EC, 0, 0, 2, 3, $150)
    %spritemapEntry(1, $1FC, $E4, 0, 0, 2, 3, $141)
    %spritemapEntry(1, $1F4, $F4, 0, 0, 2, 3, $160)
    %spritemapEntry(1, $1ED, $0A, 0, 0, 2, 3, $11C)
    %spritemapEntry(1, $1E5, $12, 0, 0, 2, 3, $12B)
    %spritemapEntry(1, $1F5, $02, 0, 0, 2, 3, $10D)
    %spritemapEntry(0, $1FC, $F4, 0, 0, 2, 3, $150)
    %spritemapEntry(1, $04, $EC, 0, 0, 2, 3, $141)
    %spritemapEntry(1, $1FC, $FC, 0, 0, 2, 3, $160)
    %spritemapEntry(1, $1F5, $12, 0, 0, 2, 3, $11C)
    %spritemapEntry(1, $1ED, $1A, 0, 0, 2, 3, $12B)
    %spritemapEntry(1, $1FD, $0A, 0, 0, 2, 3, $10D)
    %spritemapEntry(0, $04, $FC, 0, 0, 2, 3, $150)
    %spritemapEntry(1, $0C, $F4, 0, 0, 2, 3, $141)
    %spritemapEntry(1, $04, $04, 0, 0, 2, 3, $160)
    %spritemapEntry(1, $1FC, $1B, 0, 0, 2, 3, $11C)
    %spritemapEntry(1, $1F4, $23, 0, 0, 2, 3, $12B)
    %spritemapEntry(1, $04, $13, 0, 0, 2, 3, $10D)
    %spritemapEntry(0, $0B, $05, 0, 0, 2, 3, $150)
    %spritemapEntry(1, $13, $FD, 0, 0, 2, 3, $141)
    %spritemapEntry(1, $0B, $0D, 0, 0, 2, 3, $160)

Spritemap_Draygon_4:
    dw $0014
    %spritemapEntry(1, $1F8, $F9, 0, 0, 2, 3, $12E)
    %spritemapEntry(0, $1E8, $09, 0, 0, 2, 3, $14C)
    %spritemapEntry(1, $1F0, $01, 0, 0, 2, 3, $13D)
    %spritemapEntry(1, $1FC, $F4, 0, 0, 2, 3, $162)
    %spritemapEntry(1, $1FC, $E4, 0, 0, 2, 3, $143)
    %spritemapEntry(1, $00, $01, 0, 0, 2, 3, $12E)
    %spritemapEntry(0, $1F0, $11, 0, 0, 2, 3, $14C)
    %spritemapEntry(1, $1F8, $09, 0, 0, 2, 3, $13D)
    %spritemapEntry(1, $04, $FC, 0, 0, 2, 3, $162)
    %spritemapEntry(1, $04, $EC, 0, 0, 2, 3, $143)
    %spritemapEntry(1, $08, $09, 0, 0, 2, 3, $12E)
    %spritemapEntry(0, $1F8, $19, 0, 0, 2, 3, $14C)
    %spritemapEntry(1, $00, $11, 0, 0, 2, 3, $13D)
    %spritemapEntry(1, $0C, $04, 0, 0, 2, 3, $162)
    %spritemapEntry(1, $0C, $F4, 0, 0, 2, 3, $143)
    %spritemapEntry(1, $0F, $12, 0, 0, 2, 3, $12E)
    %spritemapEntry(0, $1FF, $22, 0, 0, 2, 3, $14C)
    %spritemapEntry(1, $07, $1A, 0, 0, 2, 3, $13D)
    %spritemapEntry(1, $13, $0D, 0, 0, 2, 3, $162)
    %spritemapEntry(1, $13, $FD, 0, 0, 2, 3, $143)

Spritemap_Draygon_5:
    dw $0010
    %spritemapEntry(1, $1F9, $F9, 0, 0, 2, 3, $138)
    %spritemapEntry(1, $01, $F1, 0, 0, 2, 3, $129)
    %spritemapEntry(1, $04, $EC, 0, 0, 2, 3, $156)
    %spritemapEntry(1, $1FC, $E4, 0, 0, 2, 3, $145)
    %spritemapEntry(1, $00, $00, 0, 0, 2, 3, $138)
    %spritemapEntry(1, $08, $F8, 0, 0, 2, 3, $129)
    %spritemapEntry(1, $0B, $F3, 0, 0, 2, 3, $156)
    %spritemapEntry(1, $03, $EB, 0, 0, 2, 3, $145)
    %spritemapEntry(1, $07, $07, 0, 0, 2, 3, $138)
    %spritemapEntry(1, $0F, $FF, 0, 0, 2, 3, $129)
    %spritemapEntry(1, $12, $FA, 0, 0, 2, 3, $156)
    %spritemapEntry(1, $0A, $F2, 0, 0, 2, 3, $145)
    %spritemapEntry(1, $0E, $0E, 0, 0, 2, 3, $138)
    %spritemapEntry(1, $16, $06, 0, 0, 2, 3, $129)
    %spritemapEntry(1, $19, $01, 0, 0, 2, 3, $156)
    %spritemapEntry(1, $11, $F9, 0, 0, 2, 3, $145)

Spritemap_Draygon_6:
    dw $0010
    %spritemapEntry(1, $00, $F4, 0, 0, 2, 3, $168)
    %spritemapEntry(1, $00, $EC, 0, 0, 2, 3, $158)
    %spritemapEntry(1, $04, $E4, 0, 0, 2, 3, $109)
    %spritemapEntry(1, $1FC, $E4, 0, 0, 2, 3, $108)
    %spritemapEntry(1, $07, $FC, 0, 0, 2, 3, $168)
    %spritemapEntry(1, $07, $F4, 0, 0, 2, 3, $158)
    %spritemapEntry(1, $0B, $EC, 0, 0, 2, 3, $109)
    %spritemapEntry(1, $03, $EC, 0, 0, 2, 3, $108)
    %spritemapEntry(1, $0E, $03, 0, 0, 2, 3, $168)
    %spritemapEntry(1, $0E, $FB, 0, 0, 2, 3, $158)
    %spritemapEntry(1, $12, $F3, 0, 0, 2, 3, $109)
    %spritemapEntry(1, $0A, $F3, 0, 0, 2, 3, $108)
    %spritemapEntry(1, $15, $0A, 0, 0, 2, 3, $168)
    %spritemapEntry(1, $15, $02, 0, 0, 2, 3, $158)
    %spritemapEntry(1, $19, $FA, 0, 0, 2, 3, $109)
    %spritemapEntry(1, $11, $FA, 0, 0, 2, 3, $108)

Spritemap_Draygon_7:
    dw $000A
    %spritemapEntry(1, $1FC, $F0, 0, 0, 0, 3, $121)
    %spritemapEntry(1, $1FC, $E0, 0, 0, 0, 3, $101)
    %spritemapEntry(1, $1F4, $F0, 0, 0, 0, 3, $120)
    %spritemapEntry(1, $1F4, $E0, 0, 0, 0, 3, $100)
    %spritemapEntry(0, $1F4, $04, 0, 0, 2, 3, $123)
    %spritemapEntry(1, $1F4, $F4, 0, 0, 2, 3, $103)
    %spritemapEntry(1, $1FC, $04, 0, 0, 2, 3, $124)
    %spritemapEntry(1, $1FC, $F4, 0, 0, 2, 3, $104)
    %spritemapEntry(1, $1F4, $14, 0, 0, 2, 3, $126)
    %spritemapEntry(1, $1F4, $04, 0, 0, 2, 3, $106)

Spritemap_Draygon_8:
    dw $000A
    %spritemapEntry(1, $1FB, $F0, 0, 0, 0, 3, $121)
    %spritemapEntry(1, $1FB, $E0, 0, 0, 0, 3, $101)
    %spritemapEntry(1, $1F3, $F0, 0, 0, 0, 3, $120)
    %spritemapEntry(1, $1F3, $E0, 0, 0, 0, 3, $100)
    %spritemapEntry(0, $1F3, $04, 0, 0, 2, 3, $123)
    %spritemapEntry(1, $1F3, $F4, 0, 0, 2, 3, $103)
    %spritemapEntry(1, $1FB, $04, 0, 0, 2, 3, $124)
    %spritemapEntry(1, $1FB, $F4, 0, 0, 2, 3, $104)
    %spritemapEntry(1, $1F3, $14, 0, 0, 2, 3, $126)
    %spritemapEntry(1, $1F3, $04, 0, 0, 2, 3, $106)

Spritemap_Draygon_9:
    dw $000A
    %spritemapEntry(1, $1FB, $F0, 0, 0, 0, 3, $121)
    %spritemapEntry(1, $1FB, $E0, 0, 0, 0, 3, $101)
    %spritemapEntry(1, $1F3, $F0, 0, 0, 0, 3, $120)
    %spritemapEntry(1, $1F3, $E0, 0, 0, 0, 3, $100)
    %spritemapEntry(0, $1F2, $04, 0, 0, 2, 3, $123)
    %spritemapEntry(1, $1F2, $F4, 0, 0, 2, 3, $103)
    %spritemapEntry(1, $1FA, $04, 0, 0, 2, 3, $124)
    %spritemapEntry(1, $1FA, $F4, 0, 0, 2, 3, $104)
    %spritemapEntry(1, $1F2, $14, 0, 0, 2, 3, $126)
    %spritemapEntry(1, $1F2, $04, 0, 0, 2, 3, $106)

Spritemap_Draygon_A:
    dw $000A
    %spritemapEntry(1, $1FB, $F0, 0, 0, 0, 3, $121)
    %spritemapEntry(1, $1FB, $E0, 0, 0, 0, 3, $101)
    %spritemapEntry(1, $1F3, $F0, 0, 0, 0, 3, $120)
    %spritemapEntry(1, $1F3, $E0, 0, 0, 0, 3, $100)
    %spritemapEntry(0, $1F2, $04, 0, 0, 2, 3, $123)
    %spritemapEntry(1, $1F2, $F4, 0, 0, 2, 3, $103)
    %spritemapEntry(1, $1FA, $04, 0, 0, 2, 3, $124)
    %spritemapEntry(1, $1FA, $F4, 0, 0, 2, 3, $104)
    %spritemapEntry(1, $1F1, $14, 0, 0, 2, 3, $126)
    %spritemapEntry(1, $1F1, $04, 0, 0, 2, 3, $106)

Spritemap_Draygon_B:
    dw $0013
    %spritemapEntry(1, $1E5, $02, 0, 0, 2, 3, $11C)
    %spritemapEntry(1, $1DD, $0A, 0, 0, 2, 3, $12B)
    %spritemapEntry(1, $1ED, $FA, 0, 0, 2, 3, $10D)
    %spritemapEntry(0, $1F4, $EC, 0, 0, 2, 3, $150)
    %spritemapEntry(1, $1FC, $E4, 0, 0, 2, 3, $141)
    %spritemapEntry(1, $1F4, $F4, 0, 0, 2, 3, $160)
    %spritemapEntry(1, $00, $01, 0, 0, 2, 3, $12E)
    %spritemapEntry(0, $1F0, $11, 0, 0, 2, 3, $14C)
    %spritemapEntry(1, $1F8, $09, 0, 0, 2, 3, $13D)
    %spritemapEntry(1, $04, $FC, 0, 0, 2, 3, $162)
    %spritemapEntry(1, $04, $EC, 0, 0, 2, 3, $143)
    %spritemapEntry(1, $09, $09, 0, 0, 2, 3, $138)
    %spritemapEntry(1, $11, $01, 0, 0, 2, 3, $129)
    %spritemapEntry(1, $14, $FC, 0, 0, 2, 3, $156)
    %spritemapEntry(1, $0C, $F4, 0, 0, 2, 3, $145)
    %spritemapEntry(1, $18, $0C, 0, 0, 2, 3, $168)
    %spritemapEntry(1, $18, $04, 0, 0, 2, 3, $158)
    %spritemapEntry(1, $1C, $FC, 0, 0, 2, 3, $109)
    %spritemapEntry(1, $14, $FC, 0, 0, 2, 3, $108)

Spritemap_Draygon_C:
    dw $0011
    %spritemapEntry(1, $1F8, $F9, 0, 0, 2, 3, $12E)
    %spritemapEntry(0, $1E8, $09, 0, 0, 2, 3, $14C)
    %spritemapEntry(1, $1F0, $01, 0, 0, 2, 3, $13D)
    %spritemapEntry(1, $1FC, $F4, 0, 0, 2, 3, $162)
    %spritemapEntry(1, $1FC, $E4, 0, 0, 2, 3, $143)
    %spritemapEntry(1, $01, $01, 0, 0, 2, 3, $138)
    %spritemapEntry(1, $09, $F9, 0, 0, 2, 3, $129)
    %spritemapEntry(1, $0C, $F4, 0, 0, 2, 3, $156)
    %spritemapEntry(1, $04, $EC, 0, 0, 2, 3, $145)
    %spritemapEntry(1, $10, $04, 0, 0, 2, 3, $168)
    %spritemapEntry(1, $10, $FC, 0, 0, 2, 3, $158)
    %spritemapEntry(1, $14, $F4, 0, 0, 2, 3, $109)
    %spritemapEntry(1, $0C, $F4, 0, 0, 2, 3, $108)
    %spritemapEntry(1, $11, $11, 0, 0, 2, 3, $138)
    %spritemapEntry(1, $19, $09, 0, 0, 2, 3, $129)
    %spritemapEntry(1, $1C, $04, 0, 0, 2, 3, $156)
    %spritemapEntry(1, $14, $FC, 0, 0, 2, 3, $145)

Spritemap_Draygon_D:
    dw $0011
    %spritemapEntry(1, $1F9, $F9, 0, 0, 2, 3, $138)
    %spritemapEntry(1, $01, $F1, 0, 0, 2, 3, $129)
    %spritemapEntry(1, $04, $EC, 0, 0, 2, 3, $156)
    %spritemapEntry(1, $1FC, $E4, 0, 0, 2, 3, $145)
    %spritemapEntry(1, $08, $FC, 0, 0, 2, 3, $168)
    %spritemapEntry(1, $08, $F4, 0, 0, 2, 3, $158)
    %spritemapEntry(1, $0C, $EC, 0, 0, 2, 3, $109)
    %spritemapEntry(1, $04, $EC, 0, 0, 2, 3, $108)
    %spritemapEntry(1, $09, $09, 0, 0, 2, 3, $138)
    %spritemapEntry(1, $11, $01, 0, 0, 2, 3, $129)
    %spritemapEntry(1, $14, $FC, 0, 0, 2, 3, $156)
    %spritemapEntry(1, $0C, $F4, 0, 0, 2, 3, $145)
    %spritemapEntry(1, $10, $11, 0, 0, 2, 3, $12E)
    %spritemapEntry(0, $00, $21, 0, 0, 2, 3, $14C)
    %spritemapEntry(1, $08, $19, 0, 0, 2, 3, $13D)
    %spritemapEntry(1, $14, $0C, 0, 0, 2, 3, $162)
    %spritemapEntry(1, $14, $FC, 0, 0, 2, 3, $143)

Spritemap_Draygon_E:
    dw $0013
    %spritemapEntry(1, $00, $F4, 0, 0, 2, 3, $168)
    %spritemapEntry(1, $00, $EC, 0, 0, 2, 3, $158)
    %spritemapEntry(1, $04, $E4, 0, 0, 2, 3, $109)
    %spritemapEntry(1, $1FC, $E4, 0, 0, 2, 3, $108)
    %spritemapEntry(1, $01, $01, 0, 0, 2, 3, $138)
    %spritemapEntry(1, $09, $F9, 0, 0, 2, 3, $129)
    %spritemapEntry(1, $0C, $F4, 0, 0, 2, 3, $156)
    %spritemapEntry(1, $04, $EC, 0, 0, 2, 3, $145)
    %spritemapEntry(1, $08, $09, 0, 0, 2, 3, $12E)
    %spritemapEntry(0, $1F8, $19, 0, 0, 2, 3, $14C)
    %spritemapEntry(1, $00, $11, 0, 0, 2, 3, $13D)
    %spritemapEntry(1, $0C, $04, 0, 0, 2, 3, $162)
    %spritemapEntry(1, $0C, $F4, 0, 0, 2, 3, $143)
    %spritemapEntry(1, $1FD, $1A, 0, 0, 2, 3, $11C)
    %spritemapEntry(1, $1F5, $22, 0, 0, 2, 3, $12B)
    %spritemapEntry(1, $05, $12, 0, 0, 2, 3, $10D)
    %spritemapEntry(0, $0C, $04, 0, 0, 2, 3, $150)
    %spritemapEntry(1, $14, $FC, 0, 0, 2, 3, $141)
    %spritemapEntry(1, $0C, $0C, 0, 0, 2, 3, $160)

Spritemap_Draygon_F:
    dw $0014
    %spritemapEntry(1, $1F9, $F9, 0, 0, 2, 3, $138)
    %spritemapEntry(1, $01, $F1, 0, 0, 2, 3, $129)
    %spritemapEntry(1, $04, $EC, 0, 0, 2, 3, $156)
    %spritemapEntry(1, $1FC, $E4, 0, 0, 2, 3, $145)
    %spritemapEntry(1, $00, $01, 0, 0, 2, 3, $12E)
    %spritemapEntry(0, $1F0, $11, 0, 0, 2, 3, $14C)
    %spritemapEntry(1, $1F8, $09, 0, 0, 2, 3, $13D)
    %spritemapEntry(1, $04, $FC, 0, 0, 2, 3, $162)
    %spritemapEntry(1, $04, $EC, 0, 0, 2, 3, $143)
    %spritemapEntry(1, $1F5, $12, 0, 0, 2, 3, $11C)
    %spritemapEntry(1, $1ED, $1A, 0, 0, 2, 3, $12B)
    %spritemapEntry(1, $1FD, $0A, 0, 0, 2, 3, $10D)
    %spritemapEntry(0, $04, $FC, 0, 0, 2, 3, $150)
    %spritemapEntry(1, $0C, $F4, 0, 0, 2, 3, $141)
    %spritemapEntry(1, $04, $04, 0, 0, 2, 3, $160)
    %spritemapEntry(1, $10, $11, 0, 0, 2, 3, $12E)
    %spritemapEntry(0, $00, $21, 0, 0, 2, 3, $14C)
    %spritemapEntry(1, $08, $19, 0, 0, 2, 3, $13D)
    %spritemapEntry(1, $14, $0C, 0, 0, 2, 3, $162)
    %spritemapEntry(1, $14, $FC, 0, 0, 2, 3, $143)

Spritemap_Draygon_10:
    dw $0014
    %spritemapEntry(1, $1F8, $F9, 0, 0, 2, 3, $12E)
    %spritemapEntry(0, $1E8, $09, 0, 0, 2, 3, $14C)
    %spritemapEntry(1, $1F0, $01, 0, 0, 2, 3, $13D)
    %spritemapEntry(1, $1FC, $F4, 0, 0, 2, 3, $162)
    %spritemapEntry(1, $1FC, $E4, 0, 0, 2, 3, $143)
    %spritemapEntry(1, $1ED, $0A, 0, 0, 2, 3, $11C)
    %spritemapEntry(1, $1E5, $12, 0, 0, 2, 3, $12B)
    %spritemapEntry(1, $1F5, $02, 0, 0, 2, 3, $10D)
    %spritemapEntry(0, $1FC, $F4, 0, 0, 2, 3, $150)
    %spritemapEntry(1, $04, $EC, 0, 0, 2, 3, $141)
    %spritemapEntry(1, $1FC, $FC, 0, 0, 2, 3, $160)
    %spritemapEntry(1, $08, $09, 0, 0, 2, 3, $12E)
    %spritemapEntry(0, $1F8, $19, 0, 0, 2, 3, $14C)
    %spritemapEntry(1, $00, $11, 0, 0, 2, 3, $13D)
    %spritemapEntry(1, $0C, $04, 0, 0, 2, 3, $162)
    %spritemapEntry(1, $0C, $F4, 0, 0, 2, 3, $143)
    %spritemapEntry(1, $11, $11, 0, 0, 2, 3, $138)
    %spritemapEntry(1, $19, $09, 0, 0, 2, 3, $129)
    %spritemapEntry(1, $1C, $04, 0, 0, 2, 3, $156)
    %spritemapEntry(1, $14, $FC, 0, 0, 2, 3, $145)

Spritemap_Draygon_11:
    dw $0013
    %spritemapEntry(1, $1BB, $E5, 0, 0, 2, 3, $11C)
    %spritemapEntry(1, $1B3, $ED, 0, 0, 2, 3, $12B)
    %spritemapEntry(1, $1C3, $DD, 0, 0, 2, 3, $10D)
    %spritemapEntry(0, $1CA, $CF, 0, 0, 2, 3, $150)
    %spritemapEntry(1, $1D2, $C7, 0, 0, 2, 3, $141)
    %spritemapEntry(1, $1CA, $D7, 0, 0, 2, 3, $160)
    %spritemapEntry(1, $0E, $05, 0, 0, 2, 3, $168)
    %spritemapEntry(1, $0E, $FD, 0, 0, 2, 3, $158)
    %spritemapEntry(1, $12, $F5, 0, 0, 2, 3, $109)
    %spritemapEntry(1, $0A, $F5, 0, 0, 2, 3, $108)
    %spritemapEntry(1, $1F7, $F0, 0, 0, 2, 3, $138)
    %spritemapEntry(1, $1FF, $E8, 0, 0, 2, 3, $129)
    %spritemapEntry(1, $02, $E3, 0, 0, 2, 3, $156)
    %spritemapEntry(1, $1FA, $DB, 0, 0, 2, 3, $145)
    %spritemapEntry(1, $1D8, $ED, 0, 0, 2, 3, $12E)
    %spritemapEntry(0, $1C8, $FD, 0, 0, 2, 3, $14C)
    %spritemapEntry(1, $1D0, $F5, 0, 0, 2, 3, $13D)
    %spritemapEntry(1, $1DC, $E8, 0, 0, 2, 3, $162)
    %spritemapEntry(1, $1DC, $D8, 0, 0, 2, 3, $143)


ExtendedTilemap_Draygon_0:
    dw $FFFE
    dw $2316,$0002, $159F,$15A0
    dw $2356,$0002, $15AC,$15AD
    dw $2394,$0003, $15B9,$15BA,$15BB
    dw $23D4,$0003, $15C8,$15C9,$15CA
    dw $2414,$0003, $15D7,$15D8,$15D9
    dw $2454,$0003, $15DF,$15E0,$1547
    dw $2496,$0002, $1547,$1547
    dw $FFFF

ExtendedTilemap_Draygon_1:
    dw $FFFE
    dw $2316,$0002, $1559,$155A
    dw $2356,$0002, $1569,$156A
    dw $2394,$0003, $1576,$1577,$1578
    dw $23D2,$0004, $1585,$1586,$1587,$1588
    dw $2412,$0004, $1592,$1593,$1594,$1595
    dw $2452,$0004, $15A1,$15A2,$15A3,$0147
    dw $2496,$0002, $0147,$0147
    dw $FFFF

ExtendedTilemap_Draygon_2:
    dw $FFFE
    dw $2316,$0002, $1596,$1597
    dw $2356,$0002, $15A4,$15A5
    dw $2390,$0005, $15AE,$15AF,$15B0,$15B1,$15B2
    dw $23CE,$0006, $15BC,$15BD,$15BE,$15BF,$15C0,$15C1
    dw $240E,$0006, $15CB,$15CC,$15CD,$15CE,$15CF,$15D0
    dw $2452,$0003, $0147,$0147,$0147
    dw $FFFF

ExtendedTilemap_Draygon_3:
    dw $FFFE
    dw $230A,$0003, $15DA,$15DB,$1547
    dw $2316,$0002, $15DC,$15DD
    dw $234C,$0003, $15E1,$15E2,$15E3
    dw $2354,$0003, $15AE,$15E4,$15E5
    dw $238C,$0007, $15E9,$15EA,$15EB,$15EC,$15ED,$15EE,$15EF
    dw $23CC,$0007, $15F3,$15F4,$15F5,$15F6,$15F7,$15F8,$15F9
    dw $240E,$0005, $1600,$1601,$1602,$1603,$1604
    dw $FFFF

ExtendedTilemap_Draygon_4:
    dw $FFFE
    dw $230A,$0003, $0147,$0147,$0147
    dw $2316,$0002, $1596,$1597
    dw $234C,$0003, $0147,$0147,$0147
    dw $2354,$0003, $0147,$15A4,$15A5
    dw $238C,$0007, $0147,$0147,$15AE,$15AF,$15B0,$15B1,$15B2
    dw $23CC,$0007, $0147,$15BC,$15BD,$15BE,$15BF,$15C0,$15C1
    dw $240E,$0005, $15CB,$15CC,$15CD,$15CE,$15CF
    dw $FFFF

ExtendedTilemap_Draygon_5:
    dw $FFFE
    dw $2316,$0002, $1559,$155A
    dw $2356,$0002, $1569,$156A
    dw $2390,$0005, $0147,$0147,$1576,$1577,$1578
    dw $23CE,$0006, $0147,$0147,$1585,$1586,$1587,$1588
    dw $240E,$0006, $0147,$0147,$1592,$1593,$1594,$1595
    dw $2452,$0003, $15A1,$15A2,$15A3
    dw $FFFF

ExtendedTilemap_Draygon_6:
    dw $FFFE
    dw $2316,$0002, $159F,$15A0
    dw $2356,$0002, $15AC,$15AD
    dw $2394,$0003, $15B9,$15BA,$15BB
    dw $23D2,$0004, $0147,$15C8,$15C9,$15CA
    dw $2412,$0004, $0147,$15D7,$15D8,$15D9
    dw $2452,$0004, $0147,$15DF,$15E0,$1547
    dw $2496,$0002, $1547,$1547
    dw $FFFF

ExtendedTilemap_Draygon_7:
    dw $FFFE
    dw $2148,$0002, $1554,$1555
    dw $2188,$0002, $1564,$1565
    dw $FFFF

ExtendedTilemap_Draygon_8:
    dw $FFFE
    dw $2148,$0002, $1580,$1581
    dw $2188,$0002, $1590,$1591
    dw $FFFF

ExtendedTilemap_Draygon_9:
    dw $FFFE
    dw $2148,$0002, $1582,$1583
    dw $2188,$0002, $1592,$1593
    dw $FFFF

ExtendedTilemap_Draygon_A:
    dw $FFFE
    dw $2148,$0002, $1562,$1563
    dw $2188,$0002, $1572,$1573
    dw $FFFF

ExtendedTilemap_Draygon_B:
    dw $FFFE
    dw $220C,$0003, $1586,$159E,$159F
    dw $224C,$0003, $1596,$1597,$1598
    dw $228C,$0003, $15A6,$15A7,$15A8
    dw $FFFF

ExtendedTilemap_Draygon_C:
    dw $FFFE
    dw $220C,$0001, $159D
    dw $224C,$0003, $15AD,$15AE,$15AF
    dw $228C,$0003, $15BD,$15BE,$15BF
    dw $FFFF

ExtendedTilemap_Draygon_D:
    dw $FFFE
    dw $220C,$0003, $15A0,$15A1,$15A2
    dw $224C,$0003, $15B0,$15B1,$15B2
    dw $228C,$0003, $15B4,$15B5,$15B6
    dw $FFFF

ExtendedTilemap_Draygon_E:
    dw $FFFE
    dw $220C,$0003, $15A3,$1584,$1585
    dw $224C,$0003, $15B3,$1594,$1595
    dw $228C,$0003, $1574,$15A4,$15A5
    dw $FFFF

ExtendedTilemap_Draygon_F:
    dw $FFFE
    dw $20C8,$0002, $1540,$1541
    dw $2108,$0002, $1550,$1551
    dw $FFFF

ExtendedTilemap_Draygon_10:
    dw $FFFE
    dw $20C8,$0002, $1560,$1561
    dw $2108,$0002, $1570,$1571
    dw $FFFF

ExtendedTilemap_Draygon_11:
    dw $FFFE
    dw $20C8,$0002, $150A,$150B
    dw $2108,$0002, $151A,$151B
    dw $FFFF

ExtendedTilemap_Draygon_12:
    dw $FFFE
    dw $20C8,$0002, $150C,$150D
    dw $2108,$0002, $151C,$151D
    dw $FFFF

ExtendedTilemap_Draygon_13:
    dw $FFFE
    dw $20C8,$0002, $1534,$1535
    dw $2108,$0002, $1544,$1545
    dw $FFFF

ExtendedTilemap_Draygon_14:
    dw $FFFE
    dw $20C8,$0002, $150E,$150F
    dw $2108,$0002, $151E,$151F
    dw $FFFF

ExtendedTilemap_Draygon_15:
    dw $FFFE
    dw $20C8,$0002, $152C,$152D
    dw $2108,$0002, $153C,$153D
    dw $FFFF

ExtendedTilemap_Draygon_16:
    dw $FFFE
    dw $20C8,$0002, $152E,$152F
    dw $2108,$0002, $153E,$153F
    dw $FFFF

ExtendedTilemap_Draygon_17:
    dw $FFFE
    dw $2000,$0010, $1500,$1501,$1502,$1503,$1504,$1505,$1506,$1507,$0338,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $2040,$0010, $1510,$1511,$1512,$1513,$1514,$1515,$1516,$1517,$1518,$0338,$0338,$0338,$0338,$0338,$0338,$0338
    dw $2080,$0010, $1520,$1521,$1522,$1523,$1524,$1525,$1526,$1527,$1528,$1529,$0338,$0338,$0338,$0338,$0338,$0338
    dw $20C0,$0010, $1530,$1531,$1532,$1533,$02FF,$02FF,$1536,$1537,$1538,$1539,$153A,$0338,$0338,$0338,$0338,$0338
    dw $2100,$0010, $0338,$0338,$1542,$1543,$02FF,$02FF,$1546,$1547,$1548,$1549,$154A,$154B,$154C,$154D,$154E,$1738
    dw $2140,$0010, $0338,$0338,$0338,$1553,$1554,$1555,$1556,$1557,$1558,$1559,$155A,$155B,$155C,$155D,$155E,$155F
    dw $2180,$0010, $0338,$0338,$0338,$0338,$1564,$1565,$1566,$1567,$1568,$1569,$156A,$156B,$156C,$156D,$156E,$156F
    dw $21C0,$0010, $0338,$0338,$0338,$0338,$0338,$1575,$1576,$1577,$1578,$1579,$157A,$157B,$157C,$157D,$157E,$157F
    dw $2200,$0010, $0338,$0338,$0338,$0338,$0338,$0338,$1586,$159E,$159F,$1589,$158A,$158B,$158C,$158D,$158E,$158F
    dw $2240,$0010, $0338,$0338,$0338,$0338,$0338,$0338,$1596,$1597,$1598,$1599,$159A,$159B,$159C,$0338,$0338,$0338
    dw $2280,$0010, $0338,$0338,$0338,$0338,$0338,$0338,$15A6,$15A7,$15A8,$15A9,$15AA,$15AB,$15AC,$0338,$0338,$0338
    dw $22C0,$0010, $0338,$0338,$0338,$0338,$0338,$0338,$0338,$15B7,$15B8,$15B9,$15BA,$15BB,$15BC,$0338,$0338,$0338
    dw $2300,$0010, $8338,$8338,$8338,$8338,$8338,$8338,$8338,$8338,$8338,$8338,$8338,$1508,$1509,$8338,$8338,$8338
    dw $2340,$0010, $8338,$8338,$8338,$8338,$8338,$8338,$8338,$8338,$8338,$8338,$8338,$153B,$1519,$8338,$8338,$8338
    dw $2380,$0010, $8338,$8338,$8338,$8338,$8338,$8338,$8338,$8338,$8338,$8338,$8338,$152A,$152B,$8338,$8338,$8338
    dw $FFFF

Spritemap_Draygon_12:
    dw $0003
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 3, $1BD)
    %spritemapEntry(0, $1F8, $F0, 0, 0, 2, 3, $1AD)
    %spritemapEntry(1, $1F8, $00, 0, 0, 2, 3, $1A9)

Spritemap_Draygon_13:
    dw $0003
    %spritemapEntry(0, $1F8, $F8, 0, 0, 2, 3, $1BC)
    %spritemapEntry(0, $1F8, $F0, 0, 0, 2, 3, $1AC)
    %spritemapEntry(1, $1F8, $00, 0, 0, 2, 3, $1A7)

Spritemap_Draygon_14:
    dw $0004
    %spritemapEntry(0, $1F4, $F4, 0, 0, 2, 3, $1BB)
    %spritemapEntry(0, $1F4, $EC, 0, 0, 2, 3, $1AB)
    %spritemapEntry(0, $1F4, $FC, 0, 0, 2, 3, $1A4)
    %spritemapEntry(1, $1FC, $FC, 0, 0, 2, 3, $1A5)

Spritemap_Draygon_15:
    dw $0002
    %spritemapEntry(1, $1F0, $F8, 0, 0, 2, 3, $1A0)
    %spritemapEntry(1, $00, $F8, 0, 0, 2, 3, $1A2)

Spritemap_Draygon_16:
    dw $0003
    %spritemapEntry(0, $1F8, $00, 0, 0, 2, 3, $197)
    %spritemapEntry(0, $1F0, $00, 0, 0, 2, 3, $196)
    %spritemapEntry(1, $00, $F8, 0, 0, 2, 3, $1AE)

Spritemap_Draygon_17:
    dw $0003
    %spritemapEntry(0, $1F8, $00, 0, 0, 2, 3, $1D1)
    %spritemapEntry(0, $1F0, $00, 0, 0, 2, 3, $1D0)
    %spritemapEntry(1, $00, $F8, 0, 0, 2, 3, $1C2)

Spritemap_Draygon_18:
    dw $0003
    %spritemapEntry(0, $1FC, $04, 0, 0, 2, 3, $187)
    %spritemapEntry(0, $1F4, $04, 0, 0, 2, 3, $186)
    %spritemapEntry(1, $1FC, $F4, 0, 0, 2, 3, $1C4)

Spritemap_Draygon_19:
    dw $0002
    %spritemapEntry(1, $1F8, $00, 0, 0, 2, 3, $188)
    %spritemapEntry(1, $1F8, $F0, 0, 0, 2, 3, $1C6)

Spritemap_Draygon_1A:
    dw $0003
    %spritemapEntry(0, $00, $00, 1, 1, 2, 0, $1BD)
    %spritemapEntry(0, $00, $08, 1, 1, 2, 0, $1AD)
    %spritemapEntry(1, $1F8, $F0, 0, 0, 2, 0, $1C8)

Spritemap_Draygon_1B:
    dw $0003
    %spritemapEntry(0, $00, $00, 1, 1, 2, 3, $1BC)
    %spritemapEntry(0, $00, $08, 1, 1, 2, 3, $1AC)
    %spritemapEntry(1, $1F8, $F0, 1, 1, 2, 3, $1A7)

Spritemap_Draygon_1C:
    dw $0004
    %spritemapEntry(0, $04, $04, 1, 1, 2, 3, $1BB)
    %spritemapEntry(0, $04, $0C, 1, 1, 2, 3, $1AB)
    %spritemapEntry(0, $04, $FC, 1, 1, 2, 3, $1A4)
    %spritemapEntry(1, $1F4, $F4, 1, 1, 2, 3, $1A5)

Spritemap_Draygon_1D:
    dw $0002
    %spritemapEntry(1, $00, $F8, 1, 1, 2, 3, $1A0)
    %spritemapEntry(1, $1F0, $F8, 1, 1, 2, 3, $1A2)

Spritemap_Draygon_1E:
    dw $0003
    %spritemapEntry(0, $00, $F8, 1, 1, 2, 3, $197)
    %spritemapEntry(0, $08, $F8, 1, 1, 2, 3, $196)
    %spritemapEntry(1, $1F0, $F8, 1, 1, 2, 3, $1AE)

Spritemap_Draygon_1F:
    dw $0003
    %spritemapEntry(0, $00, $F8, 1, 1, 2, 3, $1D1)
    %spritemapEntry(0, $08, $F8, 1, 1, 2, 3, $1D0)
    %spritemapEntry(1, $1F0, $F8, 1, 1, 2, 3, $1C2)

Spritemap_Draygon_20:
    dw $0003
    %spritemapEntry(0, $1FC, $F4, 1, 1, 2, 3, $187)
    %spritemapEntry(0, $04, $F4, 1, 1, 2, 3, $186)
    %spritemapEntry(1, $1F4, $FC, 1, 1, 2, 3, $1C4)

Spritemap_Draygon_21:
    dw $0002
    %spritemapEntry(1, $1F8, $F0, 1, 1, 2, 3, $188)
    %spritemapEntry(1, $1F8, $00, 1, 1, 2, 3, $1C6)

Spritemap_Draygon_22:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 3, $184)

Spritemap_Draygon_23:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 3, $182)

Spritemap_Draygon_24:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 3, $180)

Spritemap_Draygon_25:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 3, $184)

Spritemap_Draygon_26:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 3, $182)

Spritemap_Draygon_27:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 3, $180)

Spritemap_Draygon_28:
    dw $0004
    %spritemapEntry(1, $1E8, $10, 0, 1, 0, 3, $121)
    %spritemapEntry(1, $1E8, $00, 0, 1, 2, 3, $101)
    %spritemapEntry(1, $1F0, $10, 0, 1, 2, 3, $120)
    %spritemapEntry(1, $1F0, $00, 0, 1, 2, 3, $100)

Spritemap_Draygon_29:
    dw $0004
    %spritemapEntry(0, $1F8, $10, 0, 1, 2, 3, $123)
    %spritemapEntry(1, $1F0, $00, 0, 1, 2, 3, $103)
    %spritemapEntry(1, $1E8, $10, 0, 1, 2, 3, $124)
    %spritemapEntry(1, $1E8, $00, 0, 1, 2, 3, $104)

Spritemap_Draygon_2A:
    dw $0002
    %spritemapEntry(1, $1F0, $10, 0, 1, 2, 3, $126)
    %spritemapEntry(1, $1F0, $00, 0, 1, 2, 3, $106)

Spritemap_Draygon_2B:
    dw $0018
    %spritemapEntry(1, $0B, $02, 0, 1, 2, 3, $11C)
    %spritemapEntry(1, $13, $0A, 0, 1, 2, 3, $12B)
    %spritemapEntry(1, $03, $FA, 0, 1, 2, 3, $10D)
    %spritemapEntry(0, $04, $EC, 0, 1, 2, 3, $150)
    %spritemapEntry(1, $1F4, $E4, 0, 1, 2, 3, $141)
    %spritemapEntry(1, $1FC, $F4, 0, 1, 2, 3, $160)
    %spritemapEntry(1, $03, $0A, 0, 1, 2, 3, $11C)
    %spritemapEntry(1, $0B, $12, 0, 1, 2, 3, $12B)
    %spritemapEntry(1, $1FB, $02, 0, 1, 2, 3, $10D)
    %spritemapEntry(0, $1FC, $F4, 0, 1, 2, 3, $150)
    %spritemapEntry(1, $1EC, $EC, 0, 1, 2, 3, $141)
    %spritemapEntry(1, $1F4, $FC, 0, 1, 2, 3, $160)
    %spritemapEntry(1, $1FB, $12, 0, 1, 2, 3, $11C)
    %spritemapEntry(1, $03, $1A, 0, 1, 2, 3, $12B)
    %spritemapEntry(1, $1F3, $0A, 0, 1, 2, 3, $10D)
    %spritemapEntry(0, $1F4, $FC, 0, 1, 2, 3, $150)
    %spritemapEntry(1, $1E4, $F4, 0, 1, 2, 3, $141)
    %spritemapEntry(1, $1EC, $04, 0, 1, 2, 3, $160)
    %spritemapEntry(1, $1F4, $1B, 0, 1, 2, 3, $11C)
    %spritemapEntry(1, $1FC, $23, 0, 1, 2, 3, $12B)
    %spritemapEntry(1, $1EC, $13, 0, 1, 2, 3, $10D)
    %spritemapEntry(0, $1ED, $05, 0, 1, 2, 3, $150)
    %spritemapEntry(1, $1DD, $FD, 0, 1, 2, 3, $141)
    %spritemapEntry(1, $1E5, $0D, 0, 1, 2, 3, $160)

Spritemap_Draygon_2C:
    dw $0014
    %spritemapEntry(1, $1F8, $F9, 0, 1, 2, 3, $12E)
    %spritemapEntry(0, $10, $09, 0, 1, 2, 3, $14C)
    %spritemapEntry(1, $00, $01, 0, 1, 2, 3, $13D)
    %spritemapEntry(1, $1F4, $F4, 0, 1, 2, 3, $162)
    %spritemapEntry(1, $1F4, $E4, 0, 1, 2, 3, $143)
    %spritemapEntry(1, $1F0, $01, 0, 1, 2, 3, $12E)
    %spritemapEntry(0, $08, $11, 0, 1, 2, 3, $14C)
    %spritemapEntry(1, $1F8, $09, 0, 1, 2, 3, $13D)
    %spritemapEntry(1, $1EC, $FC, 0, 1, 2, 3, $162)
    %spritemapEntry(1, $1EC, $EC, 0, 1, 2, 3, $143)
    %spritemapEntry(1, $1E8, $09, 0, 1, 2, 3, $12E)
    %spritemapEntry(0, $00, $19, 0, 1, 2, 3, $14C)
    %spritemapEntry(1, $1F0, $11, 0, 1, 2, 3, $13D)
    %spritemapEntry(1, $1E4, $04, 0, 1, 2, 3, $162)
    %spritemapEntry(1, $1E4, $F4, 0, 1, 2, 3, $143)
    %spritemapEntry(1, $1E1, $12, 0, 1, 2, 3, $12E)
    %spritemapEntry(0, $1F9, $22, 0, 1, 2, 3, $14C)
    %spritemapEntry(1, $1E9, $1A, 0, 1, 2, 3, $13D)
    %spritemapEntry(1, $1DD, $0D, 0, 1, 2, 3, $162)
    %spritemapEntry(1, $1DD, $FD, 0, 1, 2, 3, $143)

Spritemap_Draygon_2D:
    dw $0010
    %spritemapEntry(1, $1F7, $F9, 0, 1, 2, 3, $138)
    %spritemapEntry(1, $1EF, $F1, 0, 1, 2, 3, $129)
    %spritemapEntry(1, $1EC, $EC, 0, 1, 2, 3, $156)
    %spritemapEntry(1, $1F4, $E4, 0, 1, 2, 3, $145)
    %spritemapEntry(1, $1F0, $00, 0, 1, 2, 3, $138)
    %spritemapEntry(1, $1E8, $F8, 0, 1, 2, 3, $129)
    %spritemapEntry(1, $1E5, $F3, 0, 1, 2, 3, $156)
    %spritemapEntry(1, $1ED, $EB, 0, 1, 2, 3, $145)
    %spritemapEntry(1, $1E9, $07, 0, 1, 2, 3, $138)
    %spritemapEntry(1, $1E1, $FF, 0, 1, 2, 3, $129)
    %spritemapEntry(1, $1DE, $FA, 0, 1, 2, 3, $156)
    %spritemapEntry(1, $1E6, $F2, 0, 1, 2, 3, $145)
    %spritemapEntry(1, $1E2, $0E, 0, 1, 2, 3, $138)
    %spritemapEntry(1, $1DA, $06, 0, 1, 2, 3, $129)
    %spritemapEntry(1, $1D7, $01, 0, 1, 2, 3, $156)
    %spritemapEntry(1, $1DF, $F9, 0, 1, 2, 3, $145)

Spritemap_Draygon_2E:
    dw $0010
    %spritemapEntry(1, $1F0, $F4, 0, 1, 2, 3, $168)
    %spritemapEntry(1, $1F0, $EC, 0, 1, 2, 3, $158)
    %spritemapEntry(1, $1EC, $E4, 0, 1, 2, 3, $109)
    %spritemapEntry(1, $1F4, $E4, 0, 1, 2, 3, $108)
    %spritemapEntry(1, $1E9, $FC, 0, 1, 2, 3, $168)
    %spritemapEntry(1, $1E9, $F4, 0, 1, 2, 3, $158)
    %spritemapEntry(1, $1E5, $EC, 0, 1, 2, 3, $109)
    %spritemapEntry(1, $1ED, $EC, 0, 1, 2, 3, $108)
    %spritemapEntry(1, $1E2, $03, 0, 1, 2, 3, $168)
    %spritemapEntry(1, $1E2, $FB, 0, 1, 2, 3, $158)
    %spritemapEntry(1, $1DE, $F3, 0, 1, 2, 3, $109)
    %spritemapEntry(1, $1E6, $F3, 0, 1, 2, 3, $108)
    %spritemapEntry(1, $1DB, $0A, 0, 1, 2, 3, $168)
    %spritemapEntry(1, $1DB, $02, 0, 1, 2, 3, $158)
    %spritemapEntry(1, $1D7, $FA, 0, 1, 2, 3, $109)
    %spritemapEntry(1, $1DF, $FA, 0, 1, 2, 3, $108)

Spritemap_Draygon_2F:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 3, $164)

Spritemap_Draygon_30:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 3, $16A)

Spritemap_Draygon_31:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 3, $15E)

Spritemap_Draygon_32:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 3, $15C)

Spritemap_Draygon_33:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 3, $14A)

Spritemap_Draygon_34:
    dw $000A
    %spritemapEntry(1, $1F4, $F0, 0, 1, 0, 3, $121)
    %spritemapEntry(1, $1F4, $E0, 0, 1, 0, 3, $101)
    %spritemapEntry(1, $1FC, $F0, 0, 1, 0, 3, $120)
    %spritemapEntry(1, $1FC, $E0, 0, 1, 0, 3, $100)
    %spritemapEntry(0, $04, $04, 0, 1, 2, 3, $123)
    %spritemapEntry(1, $1FC, $F4, 0, 1, 2, 3, $103)
    %spritemapEntry(1, $1F4, $04, 0, 1, 2, 3, $124)
    %spritemapEntry(1, $1F4, $F4, 0, 1, 2, 3, $104)
    %spritemapEntry(1, $1FC, $14, 0, 1, 2, 3, $126)
    %spritemapEntry(1, $1FC, $04, 0, 1, 2, 3, $106)

Spritemap_Draygon_35:
    dw $000A
    %spritemapEntry(1, $1F5, $F0, 0, 1, 0, 3, $121)
    %spritemapEntry(1, $1F5, $E0, 0, 1, 0, 3, $101)
    %spritemapEntry(1, $1FD, $F0, 0, 1, 0, 3, $120)
    %spritemapEntry(1, $1FD, $E0, 0, 1, 0, 3, $100)
    %spritemapEntry(0, $05, $04, 0, 1, 2, 3, $123)
    %spritemapEntry(1, $1FD, $F4, 0, 1, 2, 3, $103)
    %spritemapEntry(1, $1F5, $04, 0, 1, 2, 3, $124)
    %spritemapEntry(1, $1F5, $F4, 0, 1, 2, 3, $104)
    %spritemapEntry(1, $1FD, $14, 0, 1, 2, 3, $126)
    %spritemapEntry(1, $1FD, $04, 0, 1, 2, 3, $106)

Spritemap_Draygon_36:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 3, $17E)

Spritemap_Draygon_37:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 3, $17D)

Spritemap_Draygon_38:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 3, $17C)

Spritemap_Draygon_39:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 3, $18A)

Spritemap_Draygon_3A:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 3, $17F)

Spritemap_Draygon_3B:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 3, $177)

Spritemap_Draygon_3C:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 3, $176)

Spritemap_Draygon_3D:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 3, $18C)

Spritemap_Draygon_3E:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 3, $18E)

Spritemap_Draygon_3F:
    dw $000A
    %spritemapEntry(1, $1F5, $F0, 0, 1, 0, 3, $121)
    %spritemapEntry(1, $1F5, $E0, 0, 1, 0, 3, $101)
    %spritemapEntry(1, $1FD, $F0, 0, 1, 0, 3, $120)
    %spritemapEntry(1, $1FD, $E0, 0, 1, 0, 3, $100)
    %spritemapEntry(0, $06, $04, 0, 1, 2, 3, $123)
    %spritemapEntry(1, $1FE, $F4, 0, 1, 2, 3, $103)
    %spritemapEntry(1, $1F6, $04, 0, 1, 2, 3, $124)
    %spritemapEntry(1, $1F6, $F4, 0, 1, 2, 3, $104)
    %spritemapEntry(1, $1FE, $14, 0, 1, 2, 3, $126)
    %spritemapEntry(1, $1FE, $04, 0, 1, 2, 3, $106)

Spritemap_Draygon_40:
    dw $000A
    %spritemapEntry(1, $1F5, $F0, 0, 1, 0, 3, $121)
    %spritemapEntry(1, $1F5, $E0, 0, 1, 0, 3, $101)
    %spritemapEntry(1, $1FD, $F0, 0, 1, 0, 3, $120)
    %spritemapEntry(1, $1FD, $E0, 0, 1, 0, 3, $100)
    %spritemapEntry(0, $06, $04, 0, 1, 2, 3, $123)
    %spritemapEntry(1, $1FE, $F4, 0, 1, 2, 3, $103)
    %spritemapEntry(1, $1F6, $04, 0, 1, 2, 3, $124)
    %spritemapEntry(1, $1F6, $F4, 0, 1, 2, 3, $104)
    %spritemapEntry(1, $1FF, $14, 0, 1, 2, 3, $126)
    %spritemapEntry(1, $1FF, $04, 0, 1, 2, 3, $106)

Spritemap_Draygon_41:
    dw $0013
    %spritemapEntry(1, $0B, $02, 0, 1, 2, 3, $11C)
    %spritemapEntry(1, $13, $0A, 0, 1, 2, 3, $12B)
    %spritemapEntry(1, $03, $FA, 0, 1, 2, 3, $10D)
    %spritemapEntry(0, $04, $EC, 0, 1, 2, 3, $150)
    %spritemapEntry(1, $1F4, $E4, 0, 1, 2, 3, $141)
    %spritemapEntry(1, $1FC, $F4, 0, 1, 2, 3, $160)
    %spritemapEntry(1, $1F0, $01, 0, 1, 2, 3, $12E)
    %spritemapEntry(0, $08, $11, 0, 1, 2, 3, $14C)
    %spritemapEntry(1, $1F8, $09, 0, 1, 2, 3, $13D)
    %spritemapEntry(1, $1EC, $FC, 0, 1, 2, 3, $162)
    %spritemapEntry(1, $1EC, $EC, 0, 1, 2, 3, $143)
    %spritemapEntry(1, $1E7, $09, 0, 1, 2, 3, $138)
    %spritemapEntry(1, $1DF, $01, 0, 1, 2, 3, $129)
    %spritemapEntry(1, $1DC, $FC, 0, 1, 2, 3, $156)
    %spritemapEntry(1, $1E4, $F4, 0, 1, 2, 3, $145)
    %spritemapEntry(1, $1D8, $0C, 0, 1, 2, 3, $168)
    %spritemapEntry(1, $1D8, $04, 0, 1, 2, 3, $158)
    %spritemapEntry(1, $1D4, $FC, 0, 1, 2, 3, $109)
    %spritemapEntry(1, $1DC, $FC, 0, 1, 2, 3, $108)

Spritemap_Draygon_42:
    dw $0011
    %spritemapEntry(1, $1F8, $F9, 0, 1, 2, 3, $12E)
    %spritemapEntry(0, $10, $09, 0, 1, 2, 3, $14C)
    %spritemapEntry(1, $00, $01, 0, 1, 2, 3, $13D)
    %spritemapEntry(1, $1F4, $F4, 0, 1, 2, 3, $162)
    %spritemapEntry(1, $1F4, $E4, 0, 1, 2, 3, $143)
    %spritemapEntry(1, $1EF, $01, 0, 1, 2, 3, $138)
    %spritemapEntry(1, $1E7, $F9, 0, 1, 2, 3, $129)
    %spritemapEntry(1, $1E4, $F4, 0, 1, 2, 3, $156)
    %spritemapEntry(1, $1EC, $EC, 0, 1, 2, 3, $145)
    %spritemapEntry(1, $1E0, $04, 0, 1, 2, 3, $168)
    %spritemapEntry(1, $1E0, $FC, 0, 1, 2, 3, $158)
    %spritemapEntry(1, $1DC, $F4, 0, 1, 2, 3, $109)
    %spritemapEntry(1, $1E4, $F4, 0, 1, 2, 3, $108)
    %spritemapEntry(1, $1DF, $11, 0, 1, 2, 3, $138)
    %spritemapEntry(1, $1D7, $09, 0, 1, 2, 3, $129)
    %spritemapEntry(1, $1D4, $04, 0, 1, 2, 3, $156)
    %spritemapEntry(1, $1DC, $FC, 0, 1, 2, 3, $145)

Spritemap_Draygon_43:
    dw $0011
    %spritemapEntry(1, $1F7, $F9, 0, 1, 2, 3, $138)
    %spritemapEntry(1, $1EF, $F1, 0, 1, 2, 3, $129)
    %spritemapEntry(1, $1EC, $EC, 0, 1, 2, 3, $156)
    %spritemapEntry(1, $1F4, $E4, 0, 1, 2, 3, $145)
    %spritemapEntry(1, $1E8, $FC, 0, 1, 2, 3, $168)
    %spritemapEntry(1, $1E8, $F4, 0, 1, 2, 3, $158)
    %spritemapEntry(1, $1E4, $EC, 0, 1, 2, 3, $109)
    %spritemapEntry(1, $1EC, $EC, 0, 1, 2, 3, $108)
    %spritemapEntry(1, $1E7, $09, 0, 1, 2, 3, $138)
    %spritemapEntry(1, $1DF, $01, 0, 1, 2, 3, $129)
    %spritemapEntry(1, $1DC, $FC, 0, 1, 2, 3, $156)
    %spritemapEntry(1, $1E4, $F4, 0, 1, 2, 3, $145)
    %spritemapEntry(1, $1E0, $11, 0, 1, 2, 3, $12E)
    %spritemapEntry(0, $1F8, $21, 0, 1, 2, 3, $14C)
    %spritemapEntry(1, $1E8, $19, 0, 1, 2, 3, $13D)
    %spritemapEntry(1, $1DC, $0C, 0, 1, 2, 3, $162)
    %spritemapEntry(1, $1DC, $FC, 0, 1, 2, 3, $143)

Spritemap_Draygon_44:
    dw $0013
    %spritemapEntry(1, $1F0, $F4, 0, 1, 2, 3, $168)
    %spritemapEntry(1, $1F0, $EC, 0, 1, 2, 3, $158)
    %spritemapEntry(1, $1EC, $E4, 0, 1, 2, 3, $109)
    %spritemapEntry(1, $1F4, $E4, 0, 1, 2, 3, $108)
    %spritemapEntry(1, $1EF, $01, 0, 1, 2, 3, $138)
    %spritemapEntry(1, $1E7, $F9, 0, 1, 2, 3, $129)
    %spritemapEntry(1, $1E4, $F4, 0, 1, 2, 3, $156)
    %spritemapEntry(1, $1EC, $EC, 0, 1, 2, 3, $145)
    %spritemapEntry(1, $1E8, $09, 0, 1, 2, 3, $12E)
    %spritemapEntry(0, $00, $19, 0, 1, 2, 3, $14C)
    %spritemapEntry(1, $1F0, $11, 0, 1, 2, 3, $13D)
    %spritemapEntry(1, $1E4, $04, 0, 1, 2, 3, $162)
    %spritemapEntry(1, $1E4, $F4, 0, 1, 2, 3, $143)
    %spritemapEntry(1, $1F3, $1A, 0, 1, 2, 3, $11C)
    %spritemapEntry(1, $1FB, $22, 0, 1, 2, 3, $12B)
    %spritemapEntry(1, $1EB, $12, 0, 1, 2, 3, $10D)
    %spritemapEntry(0, $1EC, $04, 0, 1, 2, 3, $150)
    %spritemapEntry(1, $1DC, $FC, 0, 1, 2, 3, $141)
    %spritemapEntry(1, $1E4, $0C, 0, 1, 2, 3, $160)

Spritemap_Draygon_45:
    dw $0014
    %spritemapEntry(1, $1F7, $F9, 0, 1, 2, 3, $138)
    %spritemapEntry(1, $1EF, $F1, 0, 1, 2, 3, $129)
    %spritemapEntry(1, $1EC, $EC, 0, 1, 2, 3, $156)
    %spritemapEntry(1, $1F4, $E4, 0, 1, 2, 3, $145)
    %spritemapEntry(1, $1F0, $01, 0, 1, 2, 3, $12E)
    %spritemapEntry(0, $08, $11, 0, 1, 2, 3, $14C)
    %spritemapEntry(1, $1F8, $09, 0, 1, 2, 3, $13D)
    %spritemapEntry(1, $1EC, $FC, 0, 1, 2, 3, $162)
    %spritemapEntry(1, $1EC, $EC, 0, 1, 2, 3, $143)
    %spritemapEntry(1, $1FB, $12, 0, 1, 2, 3, $11C)
    %spritemapEntry(1, $03, $1A, 0, 1, 2, 3, $12B)
    %spritemapEntry(1, $1F3, $0A, 0, 1, 2, 3, $10D)
    %spritemapEntry(0, $1F4, $FC, 0, 1, 2, 3, $150)
    %spritemapEntry(1, $1E4, $F4, 0, 1, 2, 3, $141)
    %spritemapEntry(1, $1EC, $04, 0, 1, 2, 3, $160)
    %spritemapEntry(1, $1E0, $11, 0, 1, 2, 3, $12E)
    %spritemapEntry(0, $1F8, $21, 0, 1, 2, 3, $14C)
    %spritemapEntry(1, $1E8, $19, 0, 1, 2, 3, $13D)
    %spritemapEntry(1, $1DC, $0C, 0, 1, 2, 3, $162)
    %spritemapEntry(1, $1DC, $FC, 0, 1, 2, 3, $143)

Spritemap_Draygon_46:
    dw $0014
    %spritemapEntry(1, $1F8, $F9, 0, 1, 2, 3, $12E)
    %spritemapEntry(0, $10, $09, 0, 1, 2, 3, $14C)
    %spritemapEntry(1, $00, $01, 0, 1, 2, 3, $13D)
    %spritemapEntry(1, $1F4, $F4, 0, 1, 2, 3, $162)
    %spritemapEntry(1, $1F4, $E4, 0, 1, 2, 3, $143)
    %spritemapEntry(1, $03, $0A, 0, 1, 2, 3, $11C)
    %spritemapEntry(1, $0B, $12, 0, 1, 2, 3, $12B)
    %spritemapEntry(1, $1FB, $02, 0, 1, 2, 3, $10D)
    %spritemapEntry(0, $1FC, $F4, 0, 1, 2, 3, $150)
    %spritemapEntry(1, $1EC, $EC, 0, 1, 2, 3, $141)
    %spritemapEntry(1, $1F4, $FC, 0, 1, 2, 3, $160)
    %spritemapEntry(1, $1E8, $09, 0, 1, 2, 3, $12E)
    %spritemapEntry(0, $00, $19, 0, 1, 2, 3, $14C)
    %spritemapEntry(1, $1F0, $11, 0, 1, 2, 3, $13D)
    %spritemapEntry(1, $1E4, $04, 0, 1, 2, 3, $162)
    %spritemapEntry(1, $1E4, $F4, 0, 1, 2, 3, $143)
    %spritemapEntry(1, $1DF, $11, 0, 1, 2, 3, $138)
    %spritemapEntry(1, $1D7, $09, 0, 1, 2, 3, $129)
    %spritemapEntry(1, $1D4, $04, 0, 1, 2, 3, $156)
    %spritemapEntry(1, $1DC, $FC, 0, 1, 2, 3, $145)

Spritemap_Draygon_47:
    dw $0013
    %spritemapEntry(1, $35, $E5, 0, 1, 2, 3, $11C)
    %spritemapEntry(1, $3D, $ED, 0, 1, 2, 3, $12B)
    %spritemapEntry(1, $2D, $DD, 0, 1, 2, 3, $10D)
    %spritemapEntry(0, $2E, $CF, 0, 1, 2, 3, $150)
    %spritemapEntry(1, $1E, $C7, 0, 1, 2, 3, $141)
    %spritemapEntry(1, $26, $D7, 0, 1, 2, 3, $160)
    %spritemapEntry(1, $1E2, $05, 0, 1, 2, 3, $168)
    %spritemapEntry(1, $1E2, $FD, 0, 1, 2, 3, $158)
    %spritemapEntry(1, $1DE, $F5, 0, 1, 2, 3, $109)
    %spritemapEntry(1, $1E6, $F5, 0, 1, 2, 3, $108)
    %spritemapEntry(1, $1F9, $F0, 0, 1, 2, 3, $138)
    %spritemapEntry(1, $1F1, $E8, 0, 1, 2, 3, $129)
    %spritemapEntry(1, $1EE, $E3, 0, 1, 2, 3, $156)
    %spritemapEntry(1, $1F6, $DB, 0, 1, 2, 3, $145)
    %spritemapEntry(1, $18, $ED, 0, 1, 2, 3, $12E)
    %spritemapEntry(0, $30, $FD, 0, 1, 2, 3, $14C)
    %spritemapEntry(1, $20, $F5, 0, 1, 2, 3, $13D)
    %spritemapEntry(1, $14, $E8, 0, 1, 2, 3, $162)
    %spritemapEntry(1, $14, $D8, 0, 1, 2, 3, $143)


ExtendedTilemap_Draygon_18:
    dw $FFFE
    dw $2316,$0002, $159F,$15A0
    dw $2356,$0002, $15AC,$15AD
    dw $2394,$0003, $15B9,$15BA,$15BB
    dw $23D4,$0003, $15C8,$15C9,$15CA
    dw $2414,$0003, $15D7,$15D8,$15D9
    dw $2454,$0003, $15DF,$15E0,$1547
    dw $2496,$0002, $1547,$1547
    dw $FFFF

ExtendedTilemap_Draygon_19:
    dw $FFFE
    dw $2316,$0002, $1559,$155A
    dw $2356,$0002, $1569,$156A
    dw $2394,$0003, $1576,$1577,$1578
    dw $23D2,$0004, $1585,$1586,$1587,$1588
    dw $2412,$0004, $1592,$1593,$1594,$1595
    dw $2452,$0004, $15A1,$15A2,$15A3,$0147
    dw $2496,$0002, $0147,$0147
    dw $FFFF

ExtendedTilemap_Draygon_1A:
    dw $FFFE
    dw $2316,$0002, $1596,$1597
    dw $2356,$0002, $15A4,$15A5
    dw $2390,$0005, $15AE,$15AF,$15B0,$15B1,$15B2
    dw $23CE,$0006, $15BC,$15BD,$15BE,$15BF,$15C0,$15C1
    dw $240E,$0006, $15CB,$15CC,$15CD,$15CE,$15CF,$15D0
    dw $2452,$0003, $0147,$0147,$0147
    dw $FFFF

ExtendedTilemap_Draygon_1B:
    dw $FFFE
    dw $230A,$0003, $15DA,$15DB,$1547
    dw $2316,$0002, $15DC,$15DD
    dw $234C,$0003, $15E1,$15E2,$15E3
    dw $2354,$0003, $15AE,$15E4,$15E5
    dw $238C,$0007, $15E9,$15EA,$15EB,$15EC,$15ED,$15EE,$15EF
    dw $23CC,$0007, $15F3,$15F4,$15F5,$15F6,$15F7,$15F8,$15F9
    dw $240E,$0005, $1600,$1601,$1602,$1603,$1604
    dw $FFFF

ExtendedTilemap_Draygon_1C:
    dw $FFFE
    dw $230A,$0003, $0147,$0147,$0147
    dw $2316,$0002, $1596,$1597
    dw $234C,$0003, $0147,$0147,$0147
    dw $2354,$0003, $0147,$15A4,$15A5
    dw $238C,$0007, $0147,$0147,$15AE,$15AF,$15B0,$15B1,$15B2
    dw $23CC,$0007, $0147,$15BC,$15BD,$15BE,$15BF,$15C0,$15C1
    dw $240E,$0005, $15CB,$15CC,$15CD,$15CE,$15CF
    dw $FFFF

ExtendedTilemap_Draygon_1D:
    dw $FFFE
    dw $2316,$0002, $1559,$155A
    dw $2356,$0002, $1569,$156A
    dw $2390,$0005, $0147,$0147,$1576,$1577,$1578
    dw $23CE,$0006, $0147,$0147,$1585,$1586,$1587,$1588
    dw $240E,$0006, $0147,$0147,$1592,$1593,$1594,$1595
    dw $2452,$0003, $15A1,$15A2,$15A3
    dw $FFFF

ExtendedTilemap_Draygon_1E:
    dw $FFFE
    dw $2316,$0002, $159F,$15A0
    dw $2356,$0002, $15AC,$15AD
    dw $2394,$0003, $15B9,$15BA,$15BB
    dw $23D2,$0004, $0147,$15C8,$15C9,$15CA
    dw $2412,$0004, $0147,$15D7,$15D8,$15D9
    dw $2452,$0004, $0147,$15DF,$15E0,$1547
    dw $2496,$0002, $1547,$1547
    dw $FFFF

ExtendedTilemap_Draygon_1F:
    dw $FFFE
    dw $2154,$0002, $5555,$5554
    dw $2194,$0002, $5565,$5564
    dw $FFFF

ExtendedTilemap_Draygon_20:
    dw $FFFE
    dw $2154,$0002, $5581,$5580
    dw $2194,$0002, $5591,$5590
    dw $FFFF

ExtendedTilemap_Draygon_21:
    dw $FFFE
    dw $2154,$0002, $5583,$5582
    dw $2194,$0002, $5593,$5592
    dw $FFFF

ExtendedTilemap_Draygon_22:
    dw $FFFE
    dw $2154,$0002, $5563,$5562
    dw $2194,$0002, $5573,$5572
    dw $FFFF

ExtendedTilemap_Draygon_23:
    dw $FFFE
    dw $220E,$0003, $559F,$559E,$5586
    dw $224E,$0003, $5598,$5597,$5596
    dw $228E,$0003, $55A8,$55A7,$55A6
    dw $FFFF

ExtendedTilemap_Draygon_24:
    dw $FFFE
    dw $2212,$0001, $559D
    dw $224E,$0003, $55AF,$55AE,$55AD
    dw $228E,$0003, $55BF,$55BE,$55BD
    dw $FFFF

ExtendedTilemap_Draygon_25:
    dw $FFFE
    dw $220E,$0003, $55A2,$55A1,$55A0
    dw $224E,$0003, $55B2,$55B1,$55B0
    dw $228E,$0003, $55B6,$55B5,$55B4
    dw $FFFF

ExtendedTilemap_Draygon_26:
    dw $FFFE
    dw $220E,$0003, $5585,$5584,$55A3
    dw $224E,$0003, $5595,$5594,$55B3
    dw $228E,$0003, $55A5,$55A4,$5574
    dw $FFFF

ExtendedTilemap_Draygon_27:
    dw $FFFE
    dw $20D4,$0002, $5541,$5540
    dw $2114,$0002, $5551,$5550
    dw $FFFF

ExtendedTilemap_Draygon_28:
    dw $FFFE
    dw $20D4,$0002, $5561,$5560
    dw $2114,$0002, $5571,$5570
    dw $FFFF

ExtendedTilemap_Draygon_29:
    dw $FFFE
    dw $20D4,$0002, $550B,$550A
    dw $2114,$0002, $551B,$551A
    dw $FFFF

ExtendedTilemap_Draygon_2A:
    dw $FFFE
    dw $20D4,$0002, $550D,$550C
    dw $2114,$0002, $551D,$551C
    dw $FFFF

ExtendedTilemap_Draygon_2B:
    dw $FFFE
    dw $20D4,$0002, $5535,$5534
    dw $2114,$0002, $5545,$5544
    dw $FFFF

ExtendedTilemap_Draygon_2C:
    dw $FFFE
    dw $20D4,$0002, $550F,$550E
    dw $2114,$0002, $551F,$551E
    dw $FFFF

ExtendedTilemap_Draygon_2D:
    dw $FFFE
    dw $20D4,$0002, $552D,$552C
    dw $2114,$0002, $553D,$553C
    dw $FFFF

ExtendedTilemap_Draygon_2E:
    dw $FFFE
    dw $20D4,$0002, $552F,$552E
    dw $2114,$0002, $553F,$553E
    dw $FFFF

ExtendedTilemap_Draygon_2F:
    dw $FFFE
    dw $2000,$0010, $4338,$4338,$4338,$4338,$4338,$4338,$4338,$4338,$5507,$5506,$5505,$5504,$5503,$5502,$5501,$5500
    dw $2040,$0010, $4338,$4338,$4338,$4338,$4338,$4338,$4338,$5518,$5517,$5516,$5515,$5514,$5513,$5512,$5511,$5510
    dw $2080,$0010, $4338,$4338,$4338,$4338,$4338,$4338,$5529,$5528,$5527,$5526,$5525,$5524,$5523,$5522,$5521,$5520
    dw $20C0,$0010, $4338,$4338,$4338,$4338,$4338,$553A,$5539,$5538,$5537,$5536,$02FF,$02FF,$5533,$5532,$5531,$5530
    dw $2100,$0010, $5738,$554E,$554D,$554C,$554B,$554A,$5549,$5548,$5547,$5546,$02FF,$02FF,$5543,$5542,$4338,$4338
    dw $2140,$0010, $555F,$555E,$555D,$555C,$555B,$555A,$5559,$5558,$5557,$5556,$5555,$5554,$5553,$4338,$4338,$4338
    dw $2180,$0010, $556F,$556E,$556D,$556C,$556B,$556A,$5569,$5568,$5567,$5566,$5565,$5564,$4338,$4338,$4338,$4338
    dw $21C0,$0010, $557F,$557E,$557D,$557C,$557B,$557A,$5579,$5578,$5577,$5576,$5575,$4338,$4338,$4338,$4338,$4338
    dw $2200,$0010, $558F,$558E,$558D,$558C,$558B,$558A,$5589,$559F,$559E,$5586,$4338,$4338,$4338,$4338,$4338,$4338
    dw $2240,$0010, $4338,$4338,$4338,$559C,$559B,$559A,$5599,$5598,$5597,$5596,$4338,$4338,$4338,$4338,$4338,$4338
    dw $2280,$0010, $4338,$4338,$4338,$55AC,$55AB,$55AA,$55A9,$55A8,$55A7,$55A6,$4338,$4338,$4338,$4338,$4338,$4338
    dw $22C0,$0010, $4338,$4338,$4338,$55BC,$55BB,$55BA,$55B9,$55B8,$55B7,$4338,$4338,$4338,$4338,$4338,$4338,$4338
    dw $2300,$0010, $C338,$C338,$C338,$5509,$5508,$C338,$C338,$C338,$C338,$C338,$C338,$C338,$C338,$C338,$C338,$C338
    dw $2340,$0010, $C338,$C338,$C338,$5519,$553B,$C338,$C338,$C338,$C338,$C338,$C338,$C338,$C338,$C338,$C338,$C338
    dw $2380,$0010, $C338,$C338,$C338,$552B,$552A,$C338,$C338,$C338,$C338,$C338,$C338,$C338,$C338,$C338,$C338,$C338
    dw $FFFF

Spritemap_Draygon_48:
    dw $0003
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 3, $1BD)
    %spritemapEntry(0, $00, $F0, 0, 1, 2, 3, $1AD)
    %spritemapEntry(1, $1F8, $00, 0, 1, 2, 3, $1A9)

Spritemap_Draygon_49:
    dw $0003
    %spritemapEntry(0, $00, $F8, 0, 1, 2, 3, $1BC)
    %spritemapEntry(0, $00, $F0, 0, 1, 2, 3, $1AC)
    %spritemapEntry(1, $1F8, $00, 0, 1, 2, 3, $1A7)

Spritemap_Draygon_4A:
    dw $0004
    %spritemapEntry(0, $04, $F4, 0, 1, 2, 3, $1BB)
    %spritemapEntry(0, $04, $EC, 0, 1, 2, 3, $1AB)
    %spritemapEntry(0, $04, $FC, 0, 1, 2, 3, $1A4)
    %spritemapEntry(1, $1F4, $FC, 0, 1, 2, 3, $1A5)

Spritemap_Draygon_4B:
    dw $0002
    %spritemapEntry(1, $00, $F8, 0, 1, 2, 3, $1A0)
    %spritemapEntry(1, $1F0, $F8, 0, 1, 2, 3, $1A2)

Spritemap_Draygon_4C:
    dw $0003
    %spritemapEntry(0, $00, $00, 0, 1, 2, 3, $197)
    %spritemapEntry(0, $08, $00, 0, 1, 2, 3, $196)
    %spritemapEntry(1, $1F0, $F8, 0, 1, 2, 3, $1AE)

Spritemap_Draygon_4D:
    dw $0003
    %spritemapEntry(0, $00, $00, 0, 1, 2, 3, $1D1)
    %spritemapEntry(0, $08, $00, 0, 1, 2, 3, $1D0)
    %spritemapEntry(1, $1F0, $F8, 0, 1, 2, 3, $1C2)

Spritemap_Draygon_4E:
    dw $0003
    %spritemapEntry(0, $1FC, $04, 0, 1, 2, 3, $187)
    %spritemapEntry(0, $04, $04, 0, 1, 2, 3, $186)
    %spritemapEntry(1, $1F4, $F4, 0, 1, 2, 3, $1C4)

Spritemap_Draygon_4F:
    dw $0002
    %spritemapEntry(1, $1F8, $00, 0, 1, 2, 3, $188)
    %spritemapEntry(1, $1F8, $F0, 0, 1, 2, 3, $1C6)

Spritemap_Draygon_50:
    dw $0003
    %spritemapEntry(0, $00, $00, 1, 1, 2, 0, $1BD)
    %spritemapEntry(0, $00, $08, 1, 1, 2, 0, $1AD)
    %spritemapEntry(1, $1F8, $F0, 0, 0, 2, 0, $1C8)

Spritemap_Draygon_51:
    dw $0003
    %spritemapEntry(0, $1F8, $00, 1, 0, 2, 3, $1BC)
    %spritemapEntry(0, $1F8, $08, 1, 0, 2, 3, $1AC)
    %spritemapEntry(1, $1F8, $F0, 1, 0, 2, 3, $1A7)

Spritemap_Draygon_52:
    dw $0004
    %spritemapEntry(0, $1F4, $04, 1, 0, 2, 3, $1BB)
    %spritemapEntry(0, $1F4, $0C, 1, 0, 2, 3, $1AB)
    %spritemapEntry(0, $1F4, $FC, 1, 0, 2, 3, $1A4)
    %spritemapEntry(1, $1FC, $F4, 1, 0, 2, 3, $1A5)

Spritemap_Draygon_53:
    dw $0002
    %spritemapEntry(1, $1F0, $F8, 1, 0, 2, 3, $1A0)
    %spritemapEntry(1, $00, $F8, 1, 0, 2, 3, $1A2)

Spritemap_Draygon_54:
    dw $0003
    %spritemapEntry(0, $1F8, $F8, 1, 0, 2, 3, $197)
    %spritemapEntry(0, $1F0, $F8, 1, 0, 2, 3, $196)
    %spritemapEntry(1, $00, $F8, 1, 0, 2, 3, $1AE)

Spritemap_Draygon_55:
    dw $0003
    %spritemapEntry(0, $1F8, $F8, 1, 0, 2, 3, $1D1)
    %spritemapEntry(0, $1F0, $F8, 1, 0, 2, 3, $1D0)
    %spritemapEntry(1, $00, $F8, 1, 0, 2, 3, $1C2)

Spritemap_Draygon_56:
    dw $0003
    %spritemapEntry(0, $1FC, $F4, 1, 0, 2, 3, $187)
    %spritemapEntry(0, $1F4, $F4, 1, 0, 2, 3, $186)
    %spritemapEntry(1, $1FC, $FC, 1, 0, 2, 3, $1C4)

Spritemap_Draygon_57:
    dw $0002
    %spritemapEntry(1, $1F8, $F0, 1, 0, 2, 3, $188)
    %spritemapEntry(1, $1F8, $00, 1, 0, 2, 3, $1C6)

Spritemap_Draygon_58:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 3, $184)

Spritemap_Draygon_59:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 3, $182)

Spritemap_Draygon_5A:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 1, 2, 3, $180)

Spritemap_Draygon_5B:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 3, $184)

Spritemap_Draygon_5C:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 3, $182)

Spritemap_Draygon_5D:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 3, $180)


;;; $C46B: Initialisation AI - enemy $DE7F (Draygon eye) ;;;
InitAI_DraygonEye:
    LDX.W EnemyIndex
    LDA.W #InstList_DraygonEye_FacingLeft_Idle : STA.W Enemy.instList,X
    LDA.W #RTS_A5804B : STA.W DraygonBody.function,X
    RTL


;;; $C47B: Instruction - Draygon eye function = [[Y]] ;;;
Instruction_Draygon_EyeFunctionInY:
    PHY
    LDA.W $0000,Y : STA.W DraygonEye.function
    PLY : INY #2
    RTL


;;; $C486: Main AI - enemy $DE7F (Draygon eye) ;;;
MainAI_DraygonEye:
    LDX.W EnemyIndex
    JSR.W (DraygonBody.function,X)
    RTL


;;; $C48D: Draygon eye function - facing left ;;;
Function_DraygonEye_FacingLeft:
    LDA.W Enemy.frameCounter,X : AND.W #$007F : BNE .nonZeroCounter
    LDA.W Enemy[1].XPosition : SEC : SBC.W #$0018 : STA.B DP_Temp12
    LDA.W Enemy[1].YPosition : SEC : SBC.W #$0020 : STA.B DP_Temp14
    LDA.W #$0018
    LDY.W #EnemyProjectile_MiscDust
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics

  .nonZeroCounter:
    LDX.W EnemyIndex
    LDA.W Enemy.XPosition : SEC : SBC.W #$0018 : STA.B DP_Temp12
    LDA.W SamusXPosition : SEC : SBC.B DP_Temp12 : STA.B DP_Temp12
    LDA.W Enemy.YPosition : SEC : SBC.W #$0020 : STA.B DP_Temp14
    LDA.W SamusYPosition : SEC : SBC.B DP_Temp14 : STA.B DP_Temp14
    JSL CalculateAngleOf_12_14_Offset
    CMP.W Enemy.var5,X : BEQ .return
    LDY.W #InstList_DraygonEye_FacingLeft_LookingUp
    CMP.W #$0020 : BMI .directionChosen
    LDY.W #InstList_DraygonEye_FacingLeft_LookingRight
    CMP.W #$0060 : BMI .directionChosen
    LDY.W #InstList_DraygonEye_FacingLeft_LookingDown
    CMP.W #$00A0 : BMI .directionChosen
    LDY.W #InstList_DraygonEye_FacingLeft_LookingLeft
    CMP.W #$00E0 : BMI .directionChosen
    LDY.W #InstList_DraygonEye_FacingLeft_LookingUp

  .directionChosen:
    STA.W Enemy.var5,X
    TYA : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X

  .return:
    RTS


;;; $C513: Draygon eye function - facing right ;;;
Function_DraygonEye_FacingRight:
    LDA.W Enemy.frameCounter,X : AND.W #$007F : BNE .nonZeroCounter
    LDA.W Enemy.XPosition : CLC : ADC.W #$0018 : STA.B DP_Temp12
    LDA.W Enemy.YPosition : SEC : SBC.W #$0020 : STA.B DP_Temp14
    LDA.W #$0018
    LDY.W #EnemyProjectile_MiscDust
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics

  .nonZeroCounter:
    LDX.W EnemyIndex
    LDA.W Enemy.XPosition : CLC : ADC.W #$0018 : STA.B DP_Temp12
    LDA.W SamusXPosition : SEC : SBC.B DP_Temp12 : STA.B DP_Temp12
    LDA.W Enemy.YPosition : SEC : SBC.W #$0020 : STA.B DP_Temp14
    LDA.W SamusYPosition : SEC : SBC.B DP_Temp14 : STA.B DP_Temp14
    JSL CalculateAngleOf_12_14_Offset
    CMP.W Enemy.var5,X : BEQ .return
    LDY.W #InstList_DraygonEye_FacingRight_LookingUp
    CMP.W #$0020 : BMI .directionChosen
    LDY.W #InstList_DraygonEye_FacingRight_LookingRight
    CMP.W #$0060 : BMI .directionChosen
    LDY.W #InstList_DraygonEye_FacingRight_LookingDown
    CMP.W #$00A0 : BMI .directionChosen
    LDY.W #InstList_DraygonEye_FacingRight_LookingLeft
    CMP.W #$00E0 : BMI .directionChosen
    LDY.W #InstList_DraygonEye_FacingRight_LookingUp

  .directionChosen:
    STA.W Enemy.var5,X
    TYA : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X

  .return:
    RTS


;;; $C599: Initialisation AI - enemy $DEBF (Draygon tail) ;;;
InitAI_DraygonTail:
    LDX.W EnemyIndex
    LDA.W #InstList_DraygonTail_FacingLeft_FakeTailWhip : STA.W Enemy.instList,X
    LDA.W #$0700 : ASL : STA.W Enemy.palette,X
    RTL


;;; $C5AA: RTL. Main AI - enemy $DEBF (Draygon tail) ;;;
RTL_A5C5AA:
    RTL


;;; $C5AB: RTL ;;;
RTL_A5C5AB:
    RTL


;;; $C5AC: RTL ;;;
RTL_A5C5AC:
    RTL


;;; $C5AD: Initialisation AI - enemy $DEFF (Draygon arms) ;;;
InitAI_DraygonArms:
    LDX.W EnemyIndex
    LDA.W #InstList_DraygonArms_FacingLeft_Idle_0 : STA.W Enemy.instList,X
    LDA.W #$0700 : ASL : STA.W Enemy.palette,X
    LDA.W #$0002 : STA.W Enemy.layer,X
    RTL


;;; $C5C4: RTL. Main AI - enemy $DEFF (Draygon arms) ;;;
RTL_A5C5C4:
    RTL


;;; $C5C5: RTL ;;;
RTL_A5C5C5:
    RTL


;;; $C5C6: RTL ;;;
RTL_A5C5C6:
    RTL


if !FEATURE_KEEP_UNREFERENCED
;;; $C5C7: Unused Draygon fight intro dance data ;;;
UNUSED_DraygonFightIntroDanceData_KeikoLove_A5C5C7:
    db $01,$FF, $01,$00, $00,$FF, $01,$00, $01,$FF, $01,$00, $00,$FF, $01,$00
    db $01,$FF, $01,$00, $00,$FF, $01,$00, $01,$FF, $00,$FF, $01,$00, $01,$FF
    db $01,$FF, $01,$FF, $01,$FF, $00,$FF, $01,$00, $00,$FF, $01,$FF, $00,$FF
    db $01,$00, $00,$FF, $01,$FF, $00,$FF, $00,$FF, $01,$00, $00,$FF, $00,$FF
    db $00,$FF, $01,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FE
    db $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FE, $FF,$FF, $00,$FF, $00,$FF
    db $00,$FE, $FF,$FF, $00,$FF, $00,$FF, $FF,$FF, $00,$FF, $00,$FF, $FF,$FF
    db $00,$FF, $FF,$FF, $00,$FF, $00,$FF, $FF,$00, $00,$FF, $FF,$00, $00,$FF
    db $FF,$00, $FF,$00, $FF,$01, $00,$01, $FF,$00, $00,$01, $FF,$01, $00,$01
    db $00,$01, $00,$01, $FF,$01, $00,$01, $00,$01, $00,$01, $FF,$01, $00,$01
    db $00,$01, $00,$02, $00,$01, $00,$01, $FF,$01, $00,$01, $00,$01, $00,$01
    db $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $01,$01, $00,$01
    db $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01
    db $00,$01, $01,$00, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01
    db $00,$01, $00,$01, $00,$01, $00,$01, $01,$01, $00,$01, $00,$01, $00,$01
    db $00,$01, $00,$01, $00,$01, $00,$01, $00,$02, $00,$01, $00,$01, $00,$01
    db $00,$01, $00,$01, $00,$02, $00,$01, $00,$01, $00,$01, $00,$02, $00,$01
    db $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01
    db $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$FF, $01,$FF, $00,$FF
    db $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $01,$FF, $00,$FF, $00,$FF
    db $00,$FE, $00,$FF, $00,$FF, $01,$FF, $00,$FE, $00,$FF, $00,$FF, $00,$FF
    db $00,$FE, $01,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FE, $01,$FF, $00,$FF
    db $00,$FF, $00,$FF, $01,$FF, $00,$FF, $01,$FF, $00,$FF, $01,$FF, $01,$FF
    db $01,$00, $00,$FF, $01,$00, $01,$00, $01,$00, $01,$FF, $01,$00, $01,$00
    db $01,$01, $01,$00, $01,$01, $01,$00, $01,$01, $01,$01, $00,$01, $01,$01
    db $00,$01, $01,$00, $00,$01, $00,$01, $00,$01, $01,$02, $00,$01, $00,$01
    db $FF,$01, $00,$01, $00,$01, $00,$01, $FF,$01, $00,$01, $FF,$01, $00,$01
    db $FF,$01, $FF,$01, $FF,$01, $FF,$00, $FF,$01, $FF,$00, $FF,$00, $FF,$00
    db $FF,$00, $FF,$00, $FF,$FF, $FF,$00, $FF,$FF, $FF,$00, $FF,$FF, $00,$01
    db $01,$01, $01,$01, $01,$01, $00,$01, $01,$01, $01,$01, $01,$01, $01,$00
    db $01,$01, $01,$01, $01,$01, $02,$01, $01,$00, $00,$01, $01,$00, $01,$01
    db $01,$00, $01,$00, $01,$01, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00
    db $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $02,$00
    db $01,$00, $02,$FF, $01,$00, $02,$00, $01,$00, $02,$FF, $01,$00, $02,$00
    db $01,$FF, $02,$00, $01,$00, $01,$FF, $02,$00, $01,$FF, $01,$00, $01,$FF
    db $02,$FF, $01,$00, $01,$FF, $01,$FF, $01,$FF, $01,$00, $00,$FF, $01,$FF
    db $01,$FF, $01,$FE, $00,$FF, $01,$FF, $01,$FF, $00,$FF, $00,$FE, $01,$FF
    db $00,$FE, $00,$FF, $01,$FF, $00,$FE, $00,$FF, $00,$FE, $00,$FE, $00,$FF
    db $00,$FE, $00,$FF, $00,$FE, $FF,$FE, $00,$FF, $00,$FE, $FF,$FE, $00,$FF
    db $00,$FE, $FF,$FE, $FF,$FE, $00,$FF, $FF,$FE, $FF,$FE, $00,$FE, $FF,$FF
    db $FF,$FE, $FF,$FF, $FF,$FE, $FF,$FF, $00,$FF, $FF,$FE, $FF,$FF, $FF,$FF
    db $FF,$FF, $FF,$00, $FF,$FF, $FF,$00, $FF,$FF, $FF,$00, $FF,$00, $FF,$00
    db $FF,$01, $FF,$00, $FF,$01, $FF,$01, $FF,$01, $FF,$02, $FF,$01, $00,$01
    db $FF,$02, $FF,$01, $00,$02, $FF,$01, $FF,$02, $00,$02, $FF,$01, $00,$02
    db $00,$02, $FF,$02, $00,$01, $00,$02, $FF,$02, $00,$02, $00,$01, $00,$02
    db $00,$01, $00,$02, $00,$02, $00,$01, $00,$02, $00,$01, $01,$02, $00,$01
    db $00,$01, $01,$02, $00,$01, $01,$02, $00,$01, $01,$01, $00,$01, $01,$02
    db $01,$01, $00,$01, $01,$01, $01,$01, $01,$01, $01,$01, $01,$01, $01,$01
    db $01,$01, $01,$01, $02,$00, $01,$01, $01,$01, $01,$01, $02,$00, $01,$01
    db $01,$00, $02,$01, $01,$00, $01,$01, $02,$00, $01,$00, $02,$01, $01,$00
    db $02,$00, $01,$00, $01,$00, $02,$00, $01,$00, $02,$00, $01,$00, $02,$00
    db $01,$00, $01,$00, $02,$00, $01,$FF, $01,$00, $02,$00, $01,$00, $01,$FF
    db $01,$00, $01,$FF, $01,$00, $01,$FF, $01,$00, $01,$FF, $01,$FF, $01,$FF
    db $00,$FF, $01,$FF, $00,$FF, $00,$FF, $01,$FE, $00,$FF, $00,$FF, $00,$FF
    db $00,$FE, $00,$FF, $00,$FE, $00,$FF, $00,$FE, $00,$FF, $00,$FE, $00,$FF
    db $00,$FE, $00,$FE, $00,$FF, $00,$FE, $00,$FE, $00,$FE, $00,$FF, $00,$FE
    db $00,$FE, $00,$FF, $00,$FE, $00,$FE, $00,$FF, $00,$FE, $00,$FE, $00,$FF
    db $00,$FE, $00,$FF, $00,$FF, $00,$FE, $00,$FF, $00,$FF, $00,$FF, $01,$FF
    db $00,$FF, $00,$FF, $00,$FF, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01
    db $00,$01, $00,$01, $00,$01, $01,$02, $00,$01, $00,$02, $00,$01, $00,$02
    db $00,$01, $00,$02, $FF,$01, $00,$02, $00,$02, $00,$02, $00,$01, $00,$02
    db $00,$02, $00,$01, $00,$02, $00,$02, $00,$02, $00,$01, $00,$02, $00,$01
    db $00,$02, $FF,$01, $00,$02, $00,$01, $00,$02, $00,$01, $01,$01, $00,$01
    db $00,$02, $00,$01, $00,$01, $01,$01, $00,$01, $00,$01, $01,$01, $01,$01
    db $01,$01, $01,$01, $01,$00, $01,$01, $01,$00, $01,$01, $01,$00, $02,$00
    db $01,$01, $01,$00, $02,$00, $01,$01, $01,$FF, $01,$00, $00,$FF, $01,$00
    db $01,$FF, $01,$00, $00,$FF, $01,$00, $01,$FF, $01,$00, $00,$FF, $01,$00
    db $01,$FF, $00,$FF, $01,$00, $01,$FF, $01,$FF, $01,$FF, $01,$FF, $00,$FF
    db $01,$00, $00,$FF, $01,$FF, $00,$FF, $01,$00, $00,$FF, $01,$FF, $00,$FF
    db $00,$FF, $01,$00, $00,$FF, $00,$FF, $00,$FF, $01,$FF, $00,$FF, $00,$FF
    db $00,$FF, $00,$FF, $00,$FF, $00,$FE, $00,$FF, $00,$FF, $00,$FF, $00,$FF
    db $00,$FE, $FF,$FF, $00,$FF, $00,$FF, $00,$FE, $FF,$FF, $00,$FF, $00,$FF
    db $FF,$FF, $00,$FF, $00,$FF, $FF,$FF, $00,$FF, $FF,$FF, $00,$FF, $00,$FF
    db $FF,$00, $00,$FF, $FF,$00, $00,$FF, $FF,$00, $FF,$00, $FF,$01, $00,$01
    db $FF,$00, $00,$01, $FF,$01, $00,$01, $00,$01, $00,$01, $FF,$01, $00,$01
    db $00,$01, $00,$01, $FF,$01, $00,$01, $00,$01, $00,$02, $00,$01, $00,$01
    db $FF,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01
    db $00,$01, $00,$01, $01,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01
    db $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $01,$00, $00,$01, $00,$01
    db $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01
    db $01,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01
    db $00,$02, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$02, $00,$01
    db $00,$01, $00,$01, $00,$02, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01
    db $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01
    db $00,$01, $00,$FF, $01,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF
    db $00,$FF, $01,$FF, $00,$FF, $00,$FF, $00,$FE, $00,$FF, $00,$FF, $01,$FF
    db $00,$FE, $00,$FF, $00,$FF, $00,$FF, $00,$FE, $01,$FF, $00,$FF, $00,$FF
    db $00,$FF, $00,$FE, $01,$FF, $00,$FF, $00,$FF, $00,$FF, $01,$FF, $00,$FF
    db $01,$FF, $00,$FF, $01,$FF, $01,$FF, $01,$00, $00,$FF, $01,$00, $01,$00
    db $01,$00, $01,$FF, $01,$00, $01,$00, $01,$01, $01,$00, $01,$01, $01,$00
    db $01,$01, $01,$01, $00,$01, $01,$01, $00,$01, $01,$00, $00,$01, $00,$01
    db $00,$01, $01,$02, $00,$01, $00,$01, $FF,$01, $00,$01, $00,$01, $00,$01
    db $FF,$01, $00,$01, $FF,$01, $00,$01, $FF,$01, $FF,$01, $FF,$01, $FF,$00
    db $FF,$01, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$FF, $FF,$00
    db $FF,$FF, $FF,$00, $FF,$FF, $00,$01, $01,$01, $01,$01, $01,$01, $00,$01
    db $01,$01, $01,$01, $01,$01, $01,$00, $01,$01, $01,$01, $01,$01, $02,$01
    db $01,$00, $00,$01, $01,$00, $01,$01, $01,$00, $01,$00, $01,$01, $01,$00
    db $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00
    db $01,$00, $01,$00, $01,$00, $01,$FF, $01,$FF, $00,$FF, $01,$00, $01,$FF
    db $00,$FF, $01,$00, $01,$FF, $00,$FF, $01,$00, $00,$FF, $01,$FF, $01,$FF
    db $01,$FF, $01,$FF, $00,$FF, $01,$FF, $00,$FF, $01,$FF, $01,$FF, $00,$FF
    db $01,$FF, $01,$FF, $00,$FF, $01,$FF, $00,$FF, $01,$FF, $01,$FF, $00,$FF
    db $01,$FE, $01,$FF, $00,$FF, $01,$FE, $00,$FF, $01,$FF, $00,$FF, $01,$FE
    db $01,$FF, $00,$FF, $00,$FE, $01,$FF, $00,$FF, $01,$FF, $00,$FF, $00,$FE
    db $00,$FF, $01,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF
    db $00,$FF, $FF,$00, $00,$FF, $FF,$FF, $FF,$00, $FF,$00, $FF,$00, $FF,$00
    db $FF,$00, $00,$01, $FF,$00, $FF,$01, $FF,$00, $FF,$01, $FF,$00, $FF,$01
    db $FF,$01, $FF,$00, $FF,$01, $FF,$01, $FF,$01, $FF,$01, $FF,$01, $FF,$01
    db $FF,$01, $00,$01, $FF,$01, $00,$01, $FF,$01, $00,$01, $00,$01, $FF,$01
    db $00,$01, $00,$01, $00,$01, $00,$01, $FF,$01, $00,$01, $00,$01, $00,$01
    db $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01
    db $00,$01, $00,$01, $01,$01, $00,$01, $00,$01, $00,$01, $00,$01, $01,$01
    db $00,$01, $00,$01, $01,$01, $00,$01, $00,$01, $01,$01, $00,$01, $00,$01
    db $01,$01, $00,$01, $01,$01, $01,$01, $00,$01, $01,$01, $00,$01, $01,$01
    db $01,$01, $01,$01, $01,$00, $01,$01, $01,$00, $01,$00, $01,$00, $01,$FF
    db $01,$00, $01,$FF, $01,$00, $01,$FF, $00,$FF, $01,$00, $01,$FF, $01,$FF
    db $01,$FF, $00,$FF, $01,$FF, $01,$FF, $00,$FF, $01,$FF, $01,$FE, $00,$FF
    db $01,$FF, $00,$FF, $01,$FF, $00,$FF, $01,$FF, $01,$FF, $00,$FF, $00,$FF
    db $01,$FF, $00,$FF, $00,$FF, $00,$FF, $01,$FF, $00,$FF, $00,$FF, $00,$FF
    db $01,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $01,$FF, $00,$FF
    db $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF
    db $00,$FF, $00,$FE, $00,$FF, $00,$FF, $FF,$FF, $00,$FF, $00,$FF, $FF,$FF
    db $FF,$FF, $00,$FF, $FF,$FF, $FF,$FF, $FF,$FF, $00,$FF, $FF,$00, $FF,$FF
    db $FF,$00, $FF,$FF, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$01
    db $FF,$00, $FF,$01, $FF,$01, $FF,$01, $FF,$00, $FF,$01, $00,$01, $FF,$02
    db $00,$01, $00,$01, $00,$01, $00,$01, $01,$01, $01,$01, $01,$00, $01,$01
    db $01,$00, $01,$00, $02,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00
    db $01,$FF, $01,$00, $01,$00, $01,$FF, $01,$00, $01,$00, $01,$FF, $01,$00
    db $01,$FF, $01,$00, $01,$FF, $01,$FF, $01,$FF, $01,$00, $01,$FF, $01,$00
    db $01,$FF, $01,$FF, $01,$00, $01,$FF, $01,$00, $01,$FF, $01,$00, $01,$FF
    db $01,$00, $00,$FF, $01,$00, $01,$FF, $01,$00, $01,$FF, $01,$00, $01,$FF
    db $01,$00, $01,$FF, $01,$FF, $01,$00, $01,$FF, $01,$00, $01,$FF, $01,$00
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $CE07: Draygon fight intro dance data ;;;
DraygonFightIntroDanceData_KeikoLove:
; The Keiko love dance
; The table index is incremented by 4 per movement instead of 2, so only entries 2k for some k are used
    db $03,$00, $03,$00, $03,$00, $02,$FF, $03,$00, $03,$FF, $03,$00, $02,$FF
    db $03,$FF, $02,$FE, $02,$FF, $02,$FE, $02,$FE, $02,$FD, $02,$FE, $01,$FD
    db $02,$FD, $01,$FE, $01,$FD, $02,$FE, $01,$FE, $00,$FE, $01,$FE, $01,$FF
    db $01,$00, $00,$FF, $01,$00, $01,$01, $00,$01, $00,$01, $00,$02, $00,$02
    db $00,$02, $00,$02, $00,$02, $00,$03, $FF,$03, $00,$03, $00,$03, $FF,$04
    db $00,$03, $FF,$04, $00,$04, $FF,$04, $00,$04, $FF,$04, $FF,$04, $00,$05
    db $FF,$04, $FF,$04, $00,$05, $FF,$04, $FF,$04, $FF,$05, $FF,$04, $00,$04
    db $FF,$05, $FF,$04, $FF,$04, $FF,$04, $FF,$04, $00,$04, $FF,$03, $FF,$04
    db $FF,$03, $00,$03, $FF,$03, $FF,$03, $FF,$03, $00,$02, $FF,$02, $FF,$02
    db $00,$01, $FF,$02, $00,$01, $FF,$01, $FF,$00, $00,$FF, $00,$FF, $00,$FF
    db $00,$FF, $00,$FE, $00,$FF, $00,$FD, $00,$FE, $00,$FE, $00,$FD, $00,$FD
    db $01,$FD, $00,$FD, $00,$FD, $01,$FD, $00,$FC, $01,$FD, $01,$FC, $00,$FD
    db $01,$FC, $01,$FD, $00,$FC, $01,$FC, $01,$FD, $01,$FC, $01,$FD, $01,$FC
    db $01,$FD, $01,$FD, $02,$FD, $01,$FD, $01,$FD, $02,$FD, $01,$FD, $01,$FE
    db $02,$FE, $02,$FE, $01,$FD, $02,$FF, $02,$FE, $02,$FE, $01,$FE, $02,$FF
    db $02,$FE, $03,$FE, $02,$FF, $02,$FE, $03,$FE, $02,$FF, $03,$FE, $02,$FF
    db $03,$FE, $03,$FE, $03,$FE, $03,$FE, $03,$FE, $02,$FF, $03,$FE, $03,$FE
    db $03,$FF, $03,$FE, $02,$FF, $03,$FF, $02,$FF, $03,$FF, $02,$00, $01,$FF
    db $02,$00, $01,$01, $02,$00, $00,$01, $01,$01, $00,$02, $00,$02, $00,$02
    db $00,$02, $FF,$02, $00,$03, $FF,$02, $FF,$03, $FE,$03, $FF,$03, $FF,$03
    db $FE,$03, $FE,$03, $FE,$03, $FE,$04, $FE,$03, $FE,$03, $FE,$03, $FE,$02
    db $FE,$03, $FD,$03, $FE,$02, $FE,$03, $FD,$02, $FE,$02, $FE,$01, $FD,$02
    db $FE,$01, $FD,$02, $FE,$01, $FD,$01, $FD,$01, $FE,$00, $FD,$01, $FD,$00
    db $FE,$00, $FD,$00, $FD,$FF, $FD,$00, $FD,$FF, $FD,$FF, $FD,$FF, $FD,$FE
    db $FD,$FF, $FD,$FE, $FE,$FE, $FE,$FE, $FF,$FE, $00,$FF, $01,$FE, $01,$FE
    db $02,$FE, $02,$FF, $03,$FE, $03,$FF, $04,$FF, $03,$FF, $03,$00, $03,$00
    db $03,$00, $03,$01, $03,$00, $02,$01, $02,$02, $03,$01, $02,$02, $02,$02
    db $02,$02, $01,$02, $02,$02, $02,$03, $01,$03, $02,$02, $01,$03, $02,$03
    db $01,$03, $01,$03, $02,$03, $01,$03, $01,$02, $01,$03, $01,$03, $02,$03
    db $01,$03, $01,$02, $01,$03, $02,$03, $01,$02, $01,$03, $02,$02, $01,$02
    db $02,$02, $01,$02, $02,$02, $02,$02, $02,$02, $02,$02, $02,$01, $02,$02
    db $02,$01, $02,$01, $03,$01, $02,$01, $03,$01, $02,$01, $03,$00, $03,$01
    db $03,$01, $01,$FF, $02,$00, $01,$FF, $02,$00, $01,$FF, $02,$00, $01,$FF
    db $01,$00, $02,$FF, $01,$FF, $02,$00, $01,$FF, $02,$00, $01,$FF, $01,$FF
    db $02,$00, $01,$FF, $01,$FF, $02,$FF, $01,$FF, $01,$00, $02,$FF, $01,$FF
    db $01,$FF, $01,$FF, $02,$FF, $01,$FF, $01,$FF, $01,$FF, $01,$FF, $02,$FF
    db $01,$FF, $01,$FE, $01,$FF, $01,$FF, $01,$FF, $01,$FE, $01,$FF, $01,$FF
    db $01,$FE, $00,$FF, $01,$FE, $01,$FF, $01,$FE, $00,$FF, $01,$FE, $01,$FF
    db $00,$FE, $01,$FF, $00,$FE, $00,$FF, $01,$FE, $00,$FE, $00,$FF, $00,$FE
    db $00,$FF, $00,$FE, $00,$FE, $00,$FF, $00,$FE, $00,$FF, $FF,$FE, $00,$FE
    db $00,$FF, $FF,$FE, $FF,$FE, $00,$FF, $FF,$FE, $FF,$FF, $FF,$FE, $FF,$FF
    db $FF,$FF, $FF,$FF, $FF,$FF, $FF,$FF, $FE,$FF, $FF,$00, $FF,$00, $FE,$00
    db $FF,$00, $FF,$00, $FE,$01, $FF,$00, $FE,$01, $FF,$01, $FE,$01, $FF,$01
    db $FF,$01, $FE,$01, $FF,$01, $FF,$02, $FF,$01, $FF,$01, $FF,$02, $FF,$01
    db $FF,$01, $00,$02, $FF,$01, $FF,$02, $00,$01, $FF,$01, $00,$02, $00,$01
    db $FF,$02, $00,$01, $00,$02, $00,$01, $00,$02, $FF,$01, $00,$02, $00,$02
    db $00,$01, $00,$02, $00,$01, $00,$02, $00,$02, $00,$01, $00,$02, $00,$02
    db $00,$01, $00,$02, $00,$02, $00,$01, $00,$02, $00,$02, $01,$01, $00,$02
    db $00,$01, $01,$02, $00,$01, $01,$01, $00,$02, $01,$01, $01,$01, $00,$01
    db $01,$01, $01,$02, $02,$00, $01,$01, $01,$01, $01,$01, $02,$01, $01,$00
    db $02,$01, $01,$00, $02,$01, $01,$00, $02,$01, $01,$00, $02,$00, $02,$01
    db $01,$00, $02,$00, $01,$00, $02,$00, $02,$00, $01,$00, $02,$00, $01,$00
    db $02,$00, $01,$00, $02,$00, $01,$00, $02,$00, $01,$00, $01,$00, $02,$FF
    db $01,$00, $02,$00, $01,$FF, $01,$00, $02,$FF, $01,$00, $01,$00, $02,$FF
    db $01,$00, $01,$FF, $01,$FF, $01,$00, $02,$FF, $01,$00, $01,$FF, $01,$FF
    db $01,$FF, $01,$FF, $01,$FF, $01,$FF, $01,$FF, $00,$FF, $01,$FF, $01,$FF
    db $01,$FE, $00,$FF, $01,$FF, $00,$FF, $01,$FE, $01,$FF, $00,$FE, $01,$FF
    db $00,$FE, $01,$FF, $00,$FE, $01,$FE, $00,$FF, $01,$FE, $00,$FE, $01,$FE
    db $01,$FE, $00,$FE, $01,$FE, $00,$FF, $01,$FE, $00,$FE, $01,$FE, $00,$FE
    db $01,$FE, $00,$FE, $01,$FE, $00,$FE, $01,$FE, $00,$FE, $00,$FE, $01,$FF
    db $00,$FE, $01,$FE, $00,$FF, $01,$FE, $00,$FF, $00,$FE, $01,$FF, $00,$FF
    db $00,$FE, $01,$FF, $00,$FF, $00,$FF, $01,$FF, $00,$FF, $00,$FF, $01,$00
    db $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01
    db $00,$02, $00,$01, $00,$02, $FF,$01, $00,$02, $00,$02, $00,$01, $00,$02
    db $00,$02, $FF,$01, $00,$02, $00,$02, $00,$01, $FF,$02, $00,$02, $00,$01
    db $00,$02, $FF,$01, $00,$02, $00,$01, $00,$02, $FF,$01, $00,$01, $00,$02
    db $00,$01, $00,$01, $00,$02, $FF,$01, $00,$01, $00,$02, $00,$01, $00,$01
    db $00,$02, $00,$01, $00,$01, $00,$01, $00,$02, $00,$01, $00,$01, $01,$02
    db $00,$01, $00,$01, $01,$01, $00,$02, $00,$01, $01,$01, $00,$02, $01,$01
    db $00,$01, $01,$01, $01,$02, $01,$01, $00,$01, $01,$01, $01,$01, $01,$01
    db $01,$01, $01,$01, $01,$01, $01,$01, $01,$00, $02,$01, $01,$01, $01,$00
    db $01,$01, $02,$00, $01,$00, $01,$01, $02,$00, $01,$00, $02,$00, $01,$01
    db $01,$00, $01,$FF, $01,$FF, $01,$FF, $01,$FF, $01,$FF, $01,$FF, $02,$FF
    db $01,$FF, $01,$FF, $01,$FF, $01,$FF, $01,$FF, $01,$FF, $01,$FF, $01,$FF
    db $01,$FF, $01,$FF, $01,$FF, $01,$FF, $01,$FF, $01,$FF, $01,$FF, $01,$FF
    db $01,$FF, $01,$FF, $01,$FF, $00,$FF, $01,$FF, $01,$FE, $01,$FF, $01,$FF
    db $01,$FF, $00,$FF, $01,$FF, $01,$FF, $01,$FF, $00,$FF, $01,$FF, $01,$FF
    db $00,$FF, $01,$FF, $01,$FF, $00,$FE, $01,$FF, $01,$FF, $00,$FF, $01,$FF
    db $00,$FF, $01,$FE, $01,$FF, $00,$FF, $01,$FF, $00,$FE, $01,$FF, $00,$FF
    db $01,$FE, $00,$FF, $00,$FE, $01,$FF, $00,$FF, $01,$FE, $00,$FF, $00,$FE
    db $01,$FE, $00,$FF, $01,$FE, $00,$FF, $00,$FE, $00,$FE, $01,$FE, $00,$FF
    db $00,$FE, $01,$FE, $00,$FE, $00,$FE, $00,$FE, $01,$FE, $00,$FE, $00,$FE
    db $00,$FE, $00,$FE, $00,$FE, $01,$FE, $00,$FE, $00,$FE, $00,$FE, $00,$FE
    db $00,$FE, $00,$FE, $00,$FE, $00,$FF, $00,$FE, $00,$FE, $00,$FF, $00,$FE
    db $00,$FF, $00,$FE, $FF,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $FF,$FF
    db $00,$FF, $FF,$00, $FF,$00, $FF,$00, $00,$01, $FF,$00, $00,$01, $FF,$01
    db $FF,$01, $00,$01, $FF,$01, $FF,$01, $00,$02, $FF,$01, $FF,$02, $00,$01
    db $FF,$02, $00,$02, $FF,$01, $FF,$02, $00,$02, $FF,$02, $FF,$01, $00,$02
    db $FF,$02, $00,$02, $FF,$01, $00,$02, $00,$02, $FF,$01, $00,$02, $FF,$01
    db $00,$02, $00,$02, $00,$01, $FF,$02, $00,$01, $00,$02, $00,$01, $00,$02
    db $FF,$01, $00,$02, $00,$01, $00,$01, $00,$02, $00,$01, $00,$02, $00,$01
    db $00,$01, $00,$02, $00,$01, $00,$01, $00,$02, $00,$01, $00,$01, $00,$02
    db $00,$01, $00,$01, $01,$01, $00,$02, $00,$01, $00,$01, $00,$02, $00,$01
    db $00,$01, $00,$02, $00,$01, $00,$01, $00,$02, $01,$01, $00,$01, $00,$02
    db $00,$01, $00,$01, $00,$02, $00,$01, $00,$01, $00,$02, $00,$01, $00,$02
    db $00,$01, $00,$01, $00,$02, $00,$01, $00,$02, $00,$01, $00,$02, $00,$01
    db $00,$02, $00,$01, $00,$02, $FF,$02, $00,$01, $00,$02, $00,$02, $00,$01
    db $FF,$02, $00,$02, $00,$01, $00,$02, $FF,$01, $00,$01, $00,$01, $00,$01
    db $FF,$00, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FE, $00,$FF
    db $00,$FE, $00,$FF, $00,$FE, $01,$FE, $00,$FE, $00,$FE, $00,$FE, $00,$FE
    db $01,$FE, $00,$FE, $00,$FD, $01,$FE, $00,$FE, $01,$FE, $00,$FE, $01,$FE
    db $00,$FD, $01,$FE, $01,$FE, $00,$FE, $01,$FE, $01,$FE, $00,$FF, $01,$FE
    db $01,$FE, $01,$FF, $01,$FF, $01,$FE, $01,$FF, $01,$FF, $01,$FF, $01,$FF
    db $01,$FF, $01,$00, $01,$FF, $01,$00, $01,$00, $02,$00, $01,$00, $01,$00
    db $02,$01, $01,$00, $01,$01, $02,$01, $01,$01, $01,$01, $01,$01, $01,$01
    db $02,$01, $01,$01, $01,$01, $00,$02, $01,$01, $01,$01, $01,$02, $00,$01
    db $01,$02, $00,$01, $00,$02, $01,$01, $00,$02, $00,$01, $00,$02, $00,$01
    db $00,$02, $FF,$01, $00,$02, $00,$01, $FF,$02, $00,$01, $FF,$01, $FF,$02
    db $FF,$01, $FF,$01, $FF,$02, $FF,$01, $FF,$01, $FF,$01, $FF,$01, $FE,$01
    db $FF,$00, $FF,$00, $FE,$00, $FF,$00, $FE,$FF, $FF,$FF, $FE,$00, $FF,$FF
    db $FF,$FF, $FF,$FF, $FF,$00, $FF,$00, $00,$01, $00,$02, $01,$01, $00,$01
    db $01,$02, $01,$02, $01,$02, $01,$01, $01,$02, $02,$02, $01,$01, $01,$01
    db $02,$01, $01,$01, $01,$01, $02,$01, $01,$00, $02,$00, $01,$00, $01,$01
    db $02,$00, $01,$00, $02,$FF, $01,$00, $02,$00, $01,$00, $01,$00, $02,$FF
    db $01,$00, $02,$00, $01,$FF, $01,$00, $02,$00, $01,$FF, $02,$00, $02,$FF
    db $01,$FE, $02,$FF, $02,$FF, $02,$FF, $01,$FE, $02,$FF, $02,$FE, $01,$FE
    db $02,$FF, $02,$FE, $01,$FE, $02,$FE, $02,$FE, $01,$FD, $02,$FE, $01,$FD
    db $02,$FE, $01,$FD, $02,$FD, $01,$FE, $02,$FD, $01,$FD, $01,$FD, $02,$FD
    db $01,$FD, $01,$FD, $01,$FD, $01,$FD, $01,$FD, $01,$FD, $01,$FD, $01,$FE
    db $00,$FD, $01,$FE, $01,$FD, $00,$FE, $01,$FD, $00,$FE, $00,$FE, $01,$FF
    db $00,$FE, $00,$FF, $00,$FE, $FF,$FF, $00,$FF, $FF,$FF, $FF,$00, $FF,$00
    db $00,$01, $FF,$01, $FF,$01, $FE,$01, $FF,$01, $FF,$02, $FF,$02, $FF,$02
    db $FE,$02, $FF,$02, $FF,$02, $FF,$03, $FF,$03, $FE,$02, $FF,$03, $FF,$03
    db $00,$03, $FF,$03, $FF,$03, $00,$03, $FF,$03, $00,$03, $00,$03, $00,$03
    db $00,$03, $00,$03, $00,$03, $01,$03, $00,$03, $01,$03, $00,$03, $01,$02
    db $01,$03, $01,$02, $01,$02, $01,$03, $01,$02, $01,$01, $01,$02, $01,$02
    db $02,$01, $01,$01, $01,$01, $02,$01, $01,$01, $01,$00, $02,$00, $01,$00
    db $02,$00, $01,$FF, $02,$FF, $02,$FF, $01,$FF, $02,$FF, $01,$FE, $02,$FF
    db $01,$FE, $02,$FE, $01,$FE, $02,$FE, $01,$FD, $01,$FE, $02,$FD, $01,$FE
    db $01,$FD, $02,$FD, $01,$FD, $01,$FD, $01,$FD, $01,$FD, $01,$FD, $01,$FD
    db $01,$FD, $00,$FD, $01,$FD, $01,$FC, $00,$FD, $00,$FD, $01,$FE, $00,$FD
    db $00,$FD, $00,$FD, $FF,$FE, $00,$FD, $FF,$FE, $00,$FE, $FF,$FE, $FF,$FE
    db $FF,$FE, $FE,$FE, $FF,$FF, $FE,$FF, $FE,$FF, $FE,$00, $FE,$FF, $FD,$00
    db $FD,$00, $FE,$00, $FD,$01, $FD,$01, $FE,$01, $FE,$01, $FE,$01, $FF,$01
    db $FF,$02, $00,$01, $01,$02, $01,$02, $02,$01, $02,$02, $02,$01, $03,$02
    db $02,$01, $03,$01, $03,$00, $02,$01, $03,$00, $02,$00, $02,$00, $03,$00
    db $02,$00, $02,$FF, $02,$00, $02,$FF, $02,$00, $03,$FF, $01,$00, $01,$00
    db $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $02,$00, $01,$00
    db $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00
    db $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00
    db $01,$00, $01,$FF, $01,$00, $01,$00, $02,$00, $01,$00, $01,$00, $01,$00
    db $01,$00, $01,$00, $01,$00, $01,$00, $01,$FF, $01,$00, $01,$00, $01,$00
    db $01,$00, $01,$FF, $01,$00, $01,$00, $01,$00, $01,$00, $01,$FF, $01,$00
    db $01,$00, $01,$00, $01,$00, $01,$FF, $01,$00, $01,$00, $01,$FF, $01,$00
    db $01,$00, $01,$FF, $01,$00, $01,$00, $01,$FF, $01,$00, $01,$FF, $01,$00
    db $01,$00, $00,$FF, $01,$00, $01,$FF, $01,$00, $01,$FF, $01,$00, $01,$00
    db $01,$FF, $01,$FF, $01,$FF, $01,$00, $01,$FF, $01,$00, $01,$FF, $01,$FF
    db $01,$FF, $01,$00, $01,$FF, $01,$00, $01,$FF, $01,$FF, $01,$00, $01,$FF
    db $00,$FF, $01,$FF, $01,$00, $01,$FF, $01,$FF, $01,$FF, $01,$00, $01,$FF
    db $01,$FF, $01,$FF, $01,$FF, $00,$FF, $01,$00, $01,$FF, $01,$FF, $01,$FF
    db $01,$FF, $00,$FF, $01,$FF, $01,$FF, $00,$FF, $01,$FF, $01,$FF, $00,$FF
    db $01,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF
    db $00,$FF, $00,$FF, $00,$FF, $FF,$FF, $00,$FF, $FF,$FF, $FF,$FF, $00,$FF
    db $FF,$00, $FF,$FF, $FF,$FF, $FF,$00, $FF,$FF, $FF,$00, $FF,$00, $FF,$00
    db $FF,$01, $FF,$00, $00,$01, $FF,$00, $FF,$01, $00,$01, $FF,$01, $FF,$01
    db $00,$01, $FF,$01, $00,$01, $FF,$01, $00,$02, $00,$01, $FF,$01, $00,$01
    db $00,$01, $00,$01, $FF,$02, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01
    db $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $01,$01, $00,$01
    db $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01
    db $01,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01
    db $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$02, $00,$01
    db $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01
    db $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01
    db $FF,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01
    db $00,$02, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01
    db $00,$01, $00,$01, $00,$01, $00,$01, $FF,$01, $00,$01, $00,$01, $00,$01
    db $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01
    db $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01
    db $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01
    db $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01
    db $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$02, $00,$01
    db $00,$01, $00,$01, $00,$01, $FF,$01, $00,$02, $00,$01, $00,$01, $FF,$01
    db $00,$01, $00,$01, $FF,$01, $00,$01, $FF,$00, $00,$01, $FF,$01, $FF,$00
    db $FF,$01, $FF,$00, $FE,$01, $FF,$00, $FF,$00, $FF,$00, $FF,$FF, $FF,$00
    db $FF,$00, $FF,$FF, $FE,$00, $FF,$FF, $FF,$00, $FF,$FF, $FF,$FF, $FF,$FF
    db $00,$FF, $FF,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $01,$FF
    db $00,$FF, $01,$FF, $00,$FF, $01,$FF, $01,$FF, $01,$FF, $00,$FF, $01,$00
    db $01,$FF, $01,$FF, $01,$00, $01,$FF, $01,$FF, $01,$00, $01,$00, $01,$FF
    db $01,$00, $01,$00, $01,$00, $01,$FF, $02,$00, $01,$00, $01,$00, $01,$00
    db $01,$00, $01,$00, $01,$01, $01,$00, $01,$00, $01,$00, $01,$01, $01,$00
    db $01,$00, $01,$01, $01,$00, $01,$01, $01,$01, $01,$00, $01,$01, $01,$01
    db $01,$01, $01,$01, $01,$00, $00,$01, $01,$01, $01,$00, $01,$01, $00,$01
    db $01,$01, $01,$00, $01,$01, $01,$01, $01,$01, $01,$01, $01,$00, $01,$01
    db $00,$01, $01,$00, $01,$01, $01,$00, $01,$01, $01,$00, $01,$01, $01,$00
    db $01,$01, $01,$00, $00,$01, $01,$00, $01,$00, $01,$01, $01,$00, $01,$00
    db $01,$00, $01,$01, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00
    db $01,$01, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$FF, $01,$00
    db $02,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$FE, $00,$FF, $01,$FE
    db $00,$FF, $01,$FE, $01,$FF, $00,$FE, $01,$FF, $00,$FE, $01,$FF, $00,$FE
    db $01,$FF, $01,$FE, $00,$FF, $01,$FE, $00,$FF, $01,$FF, $00,$FE, $01,$FF
    db $00,$FE, $01,$FF, $00,$FF, $01,$FE, $00,$FF, $01,$FF, $00,$FF, $00,$FF
    db $01,$FE, $00,$FF, $01,$FF, $00,$FF, $00,$FF, $01,$FF, $00,$FF, $00,$FF
    db $01,$FF, $00,$FF, $00,$FF, $00,$FF, $01,$FF, $00,$FF, $00,$FF, $00,$FF
    db $00,$FF, $00,$FF, $FF,$00, $FF,$00, $FF,$01, $FF,$00, $00,$01, $FF,$00
    db $00,$01, $FF,$01, $FF,$01, $00,$01, $FF,$01, $00,$01, $FF,$00, $FF,$01
    db $00,$01, $FF,$01, $00,$01, $FF,$01, $00,$01, $FF,$02, $00,$01, $FF,$01
    db $00,$01, $FF,$01, $00,$01, $00,$02, $FF,$01, $00,$01, $00,$01, $00,$02
    db $00,$01, $FF,$01, $00,$02, $00,$01, $00,$01, $00,$01, $00,$02, $00,$01
    db $00,$01, $01,$01, $00,$02, $00,$01, $00,$01, $00,$01, $01,$01, $00,$01
    db $00,$02, $01,$01, $00,$01, $01,$01, $00,$01, $01,$01, $00,$01, $01,$01
    db $01,$01, $01,$01, $01,$01, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00
    db $00,$FF, $01,$00, $01,$FF, $01,$00, $00,$FF, $01,$FF, $01,$00, $00,$FF
    db $01,$FF, $00,$FF, $01,$FF, $00,$FF, $01,$FF, $01,$FF, $00,$FF, $01,$FF
    db $00,$FF, $01,$FF, $00,$FF, $01,$FE, $00,$FF, $00,$FF, $01,$FE, $00,$FF
    db $01,$FF, $00,$FE, $00,$FF, $01,$FE, $00,$FF, $00,$FF, $00,$FE, $00,$FF
    db $01,$FE, $00,$FF, $00,$FE, $00,$FF, $00,$FE, $00,$FF, $00,$FF, $00,$FE
    db $00,$FF, $FF,$FF, $00,$FE, $00,$FF, $00,$FF, $FF,$FF, $00,$FF, $00,$FF
    db $FF,$FF, $00,$FF, $FF,$FF, $FF,$FF, $FF,$00, $00,$FF, $FF,$00, $FF,$00
    db $FF,$00, $FF,$00, $FF,$00, $FF,$00, $FF,$01, $FF,$01, $FF,$00, $FF,$01
    db $FF,$01, $FF,$00, $FF,$01, $00,$01, $FF,$01, $00,$01, $00,$01, $01,$00
    db $00,$01, $01,$00, $01,$01, $01,$00, $01,$00, $01,$01, $01,$00, $01,$00
    db $01,$00, $02,$01, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00
    db $01,$00, $01,$00, $01,$00, $01,$00, $01,$FF, $01,$00, $01,$00, $01,$FF
    db $01,$FF, $01,$00, $01,$FF, $01,$FF, $01,$FF, $01,$FF, $01,$FF, $01,$FF
    db $01,$FF, $01,$FF, $00,$FF, $01,$00, $01,$FF, $01,$00, $01,$00, $01,$01
    db $00,$01, $01,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$02, $00,$01
    db $00,$01, $00,$02, $00,$01, $00,$02, $00,$01, $00,$02, $00,$02, $00,$01
    db $00,$02, $00,$01, $FF,$02, $00,$01, $00,$02, $00,$01, $00,$02, $FF,$01
    db $00,$01, $00,$02, $00,$01, $FF,$01, $00,$01, $00,$02, $00,$01, $00,$01
    db $FF,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $FF,$01
    db $00,$01, $00,$01, $01,$01, $00,$01, $00,$01, $01,$00, $01,$00, $01,$00
    db $01,$00, $01,$FF, $01,$00, $00,$FF, $01,$00, $01,$FF, $01,$00, $00,$FF
    db $01,$00, $01,$FF, $01,$FF, $01,$FF, $01,$FF, $01,$FF, $01,$FF, $01,$FF
    db $00,$FF, $01,$FF, $01,$FF, $01,$FF, $01,$FE, $00,$FF, $01,$FF, $01,$FF
    db $00,$FE, $01,$FF, $01,$FF, $00,$FE, $01,$FF, $00,$FF, $01,$FE, $00,$FF
    db $00,$FF, $01,$FE, $00,$FF, $01,$FE, $00,$FF, $00,$FF, $01,$FE, $00,$FF
    db $00,$FF, $00,$FF, $00,$FE, $01,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF
    db $00,$FF, $00,$FF, $01,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$01, $00,$01
    db $00,$01, $00,$01, $00,$01, $00,$01, $00,$01, $01,$01, $00,$01, $00,$01
    db $00,$01, $00,$01, $00,$01, $00,$02, $01,$01, $00,$01, $00,$01, $00,$02
    db $01,$01, $00,$01, $00,$01, $01,$02, $00,$01, $00,$01, $01,$01, $00,$01
    db $01,$01, $01,$01, $00,$01, $01,$01, $01,$01, $01,$01, $00,$01, $01,$00
    db $01,$01, $00,$01, $01,$00, $01,$01, $01,$01, $01,$01, $01,$01, $00,$01
    db $01,$00, $00,$01, $01,$01, $00,$01, $01,$01, $00,$01, $01,$01, $00,$01
    db $01,$01, $00,$01, $01,$01, $00,$01, $01,$00, $00,$01, $01,$01, $00,$01
    db $01,$00, $01,$01, $01,$01, $01,$00, $01,$00, $01,$00, $01,$00, $01,$00
    db $01,$00, $01,$FF, $01,$00, $01,$00, $01,$FF, $01,$00, $01,$FF, $01,$00
    db $01,$FF, $01,$00, $01,$FF, $01,$FF, $01,$FF, $01,$FF, $01,$FF, $01,$FF
    db $00,$FF, $01,$FF, $00,$FF, $01,$FF, $00,$FF, $00,$FF, $01,$FF, $00,$FF
    db $00,$FF, $00,$FE, $01,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FF, $00,$FE
    db $00,$FF, $00,$FF, $00,$FF, $00,$FE, $00,$FF, $00,$FF, $00,$FF, $00,$FE
    db $FF,$FF, $00,$FF, $00,$FE, $00,$FF, $00,$FF, $FF,$FF, $00,$FE, $00,$FF
    db $00,$FF, $FF,$FF, $00,$FF, $00,$FF, $FF,$FF, $00,$FF, $FF,$FF, $00,$FF
    db $00,$FF, $FF,$FF, $00,$FF, $FF,$FF, $FF,$FF, $00,$FF, $FF,$00, $00,$FF
    db $FF,$00, $00,$FF, $FF,$00, $FF,$00, $FF,$00, $FF,$00, $00,$01, $FF,$00
    db $FF,$01, $FF,$01, $00,$01, $FF,$00, $00,$01, $FF,$01, $00,$01, $00,$01
    db $FF,$01, $00,$01, $FF,$01, $00,$01, $FF,$01, $00,$01, $00,$01, $FF,$01
    db $00,$01, $00,$02, $FF,$01, $00,$01, $00,$01, $00,$02, $00,$01, $FF,$01
    db $00,$02, $00,$01, $00,$01, $00,$01, $00,$02, $00,$01, $00,$01, $00,$02
    db $00,$01, $00,$01, $00,$01, $01,$01, $00,$02, $00,$01, $00,$01, $01,$01
    db $00,$01, $01,$01, $00,$01, $00,$01, $01,$01, $00,$01, $01,$01, $00,$01
    db $01,$01, $01,$00, $00,$01, $01,$01, $80,$80, $80,$80, $80,$80, $80,$80


;;; $DDC7: Unused Draygon fight intro dance data ;;;
DraygonFightIntroDanceData_KeikoLove_EvirsAlreadyDeleted:
; This section is read even though the evirs are deleted at this point
; (deleted due to the 80,80 terminator, but the movement routine sets their position anyway)
    db $01,$FF, $02,$FE, $01,$FF, $02,$FE, $01,$FF, $01,$FE, $02,$FF, $01,$FE
    db $02,$FF, $01,$FE, $01,$FF, $02,$FE, $01,$FE, $01,$FF, $02,$FE, $01,$FE
    db $01,$FF, $02,$FE, $01,$FE, $01,$FE, $01,$FE, $02,$FF, $01,$FE, $01,$FE
    db $01,$FD, $02,$FE, $01,$FE, $01,$FE, $01,$FE, $01,$FD, $01,$FE, $01,$FE
    db $01,$FD, $01,$FD, $01,$FE, $01,$FD, $01,$FD, $01,$FE, $01,$FD, $01,$FD
    db $01,$FD, $00,$FE, $01,$FD, $01,$FE, $00,$FD, $00,$FE, $01,$FE, $00,$FE
    db $00,$FF, $00,$FE, $FF,$FF, $00,$FF, $FF,$FF, $FF,$00, $FF,$00, $FF,$01
    db $FF,$01, $FF,$01, $FF,$01, $FE,$01, $FF,$02, $FF,$01, $FE,$02, $FF,$02
    db $FE,$03, $FF,$02, $FE,$02, $FF,$03, $FE,$03, $FF,$03, $FE,$02, $FF,$03
    db $FF,$03, $FF,$03, $FF,$04, $FF,$03, $FF,$03, $FF,$03, $FF,$03, $00,$03
    db $00,$03, $FF,$03, $00,$03, $00,$03, $00,$03, $01,$03, $00,$03, $00,$02
    db $01,$03, $01,$03, $00,$02, $01,$02, $01,$03, $01,$02, $01,$02, $01,$02
    db $01,$02, $02,$01, $01,$02, $01,$01, $02,$01, $01,$01, $02,$01, $01,$01
    db $02,$01, $01,$00, $02,$00, $02,$00, $01,$00, $02,$00, $02,$FF, $02,$00
    db $01,$FF, $02,$FF, $02,$FF, $02,$FE, $01,$FF, $02,$FE, $02,$FF, $01,$FE
    db $02,$FE, $01,$FE, $02,$FE, $01,$FD, $02,$FE, $01,$FE, $01,$FD, $01,$FD
    db $01,$FE, $01,$FD, $01,$FD, $01,$FD, $01,$FD, $00,$FD, $01,$FD, $00,$FD
    db $00,$FC, $01,$FD, $00,$FD, $FF,$FD, $00,$FD, $00,$FC, $00,$FD, $FF,$FD
    db $00,$FD, $FF,$FD, $FF,$FD, $FF,$FD, $00,$FE, $FF,$FD, $FF,$FE, $FF,$FD
    db $FE,$FE, $FF,$FE, $FF,$FE, $FF,$FF, $FE,$FE, $FF,$FF, $FF,$FF, $FE,$00
    db $FF,$FF, $FE,$00, $FF,$00, $FE,$01, $FF,$01, $FF,$01, $FE,$01, $FF,$01
    db $FE,$02, $FF,$02, $FF,$02, $FE,$02, $FF,$03, $FF,$02, $00,$03, $FF,$02
    db $FF,$02, $00,$03, $00,$02, $00,$02, $00,$03, $00,$02, $01,$02, $01,$02
    db $01,$02, $00,$02, $02,$02, $01,$01, $01,$02, $01,$02, $02,$02, $02,$01

if !FEATURE_KEEP_UNREFERENCED
UNUSED_DraygonFightIntroDanceData_KeikoLove_A5DF47:
    db $01,$02, $02,$02, $02,$01, $01,$02, $02,$02, $02,$01, $02,$02, $02,$01
    db $02,$02, $02,$02, $02,$01, $02,$02, $01,$02, $02,$01, $02,$02, $02,$02
    db $01,$01, $02,$02, $01,$02, $02,$02, $01,$02, $02,$01, $01,$02, $02,$02
    db $01,$02, $02,$01, $01,$02, $02,$02, $01,$01, $02,$01, $02,$02, $02,$01
    db $01,$01, $02,$01, $02,$01, $02,$01, $03,$01, $02,$00, $02,$01, $00,$FF
    db $00,$FE, $00,$FF, $01,$FF, $00,$FF, $00,$FE, $00,$FF, $00,$FF, $01,$FE
    db $00,$FF, $00,$FF, $00,$FE, $00,$FF, $01,$FF, $00,$FE, $00,$FF, $00,$FF
    db $01,$FE, $00,$FF, $00,$FE, $01,$FF, $00,$FF, $00,$FE, $01,$FF, $00,$FE
    db $00,$FF, $01,$FE, $00,$FF, $01,$FE, $00,$FF, $01,$FE, $00,$FF, $01,$FE
    db $01,$FE, $00,$FF, $01,$FE, $00,$FF, $01,$FE, $01,$FE, $01,$FE, $01,$FF
    db $00,$FE, $01,$FE, $01,$FE, $01,$FF, $01,$FE, $01,$FE, $01,$FE, $01,$FE
    db $01,$FE, $01,$FE, $01,$FF, $02,$FE, $01,$FF, $01,$FF, $01,$FF, $01,$FF
    db $01,$00, $01,$00, $01,$01, $01,$01, $00,$01, $01,$02, $00,$01, $00,$02
    db $01,$02, $00,$02, $00,$02, $00,$02, $00,$02, $00,$01, $00,$02, $00,$02
    db $00,$01, $00,$02, $FF,$02, $00,$01, $00,$02, $00,$01, $FF,$02, $00,$01
    db $00,$02, $00,$01, $FF,$01, $00,$02, $00,$01, $FF,$02, $00,$01, $00,$01
    db $FF,$02, $00,$01, $00,$02, $00,$01, $00,$02, $00,$01, $00,$02, $00,$01
    db $00,$02, $00,$02, $00,$01, $00,$02, $00,$02, $01,$02, $00,$02, $01,$02
    db $00,$01, $01,$02, $00,$02, $01,$02, $01,$01, $00,$02, $01,$01, $01,$02
    db $01,$01, $00,$01, $01,$01, $01,$01, $01,$00, $01,$01, $01,$00, $01,$00
    db $01,$00, $01,$FF, $01,$FF, $01,$00, $01,$FF, $01,$FE, $00,$FF, $01,$FF
    db $01,$FE, $01,$FF, $01,$FE, $00,$FE, $01,$FE, $01,$FE, $01,$FE, $00,$FE
    db $01,$FD, $00,$FE, $01,$FE, $01,$FD, $00,$FE, $01,$FD, $00,$FE, $00,$FE
    db $01,$FD, $00,$FE, $01,$FD, $00,$FE, $00,$FD, $01,$FE, $00,$FE, $00,$FD
    db $00,$FE, $01,$FE, $00,$FE, $00,$FE, $00,$FE, $01,$FE, $00,$FE, $00,$FF
    db $00,$FE, $00,$FF, $01,$FF, $00,$FF, $00,$FF, $00,$FF, $01,$FF, $00,$FF
    db $01,$00, $00,$01, $01,$00, $00,$01, $00,$01, $01,$01, $00,$01, $01,$02
    db $00,$01, $01,$02, $00,$01, $00,$02, $01,$02, $00,$02, $00,$01, $01,$02
    db $00,$02, $00,$01, $01,$02, $00,$02, $00,$01, $00,$02, $00,$01, $00,$02
    db $01,$01, $00,$02, $00,$01, $00,$02, $00,$01, $00,$02, $00,$01, $01,$02
    db $00,$01, $00,$02, $00,$01, $00,$02, $01,$01, $00,$02, $00,$01, $01,$02
    db $00,$01, $00,$02, $01,$01, $00,$02, $01,$01, $00,$02, $01,$01, $01,$02
    db $00,$01, $01,$01, $01,$02, $01,$01, $01,$01, $01,$01, $01,$01, $01,$01
    db $02,$01, $01,$01, $01,$01, $01,$01, $02,$00, $01,$01, $02,$01, $01,$01
    db $02,$00, $02,$00, $02,$00, $01,$00, $02,$00, $02,$00, $01,$00, $02,$00
    db $02,$00, $02,$00, $01,$00, $02,$00, $01,$00, $02,$00, $02,$00, $01,$FF
    db $02,$00, $01,$00, $02,$FF, $01,$00, $02,$FF, $01,$00, $01,$FF, $02,$FF
    db $01,$FF, $01,$FF, $01,$FF, $01,$FF, $01,$FF, $02,$FF, $01,$FF, $01,$FF
    db $01,$FF, $01,$FE, $01,$FF, $01,$FF, $00,$FE, $01,$FF, $01,$FE, $01,$FF
    db $01,$FE, $01,$FF, $01,$FE, $01,$FF, $01,$FE, $00,$FF, $01,$FE, $01,$FF
    db $01,$FE, $01,$FF, $01,$FE, $01,$FF, $01,$FE, $00,$FF, $01,$FE, $01,$FF
    db $01,$FE, $01,$FF, $00,$FE, $01,$FF, $01,$FE, $00,$FF, $01,$FE, $00,$FF
    db $01,$FE, $00,$FF, $00,$FE, $01,$FF, $00,$FE, $00,$FE, $00,$FF, $00,$FE
    db $00,$FF, $00,$FE, $FF,$FE, $00,$FF, $00,$FE, $FF,$FE, $00,$FE, $FF,$FF
    db $FF,$FE, $FF,$FE, $FF,$FF, $FF,$FE, $FF,$FE, $FF,$FF, $FF,$FE, $FF,$FF
    db $FF,$FF, $FF,$FE, $FE,$FF, $FF,$FF, $FF,$FF, $FE,$FF, $FF,$00, $FF,$FF
    db $FE,$FF, $FF,$00, $FF,$00, $FE,$00, $FF,$00, $FF,$01, $FF,$00, $FE,$01
    db $FF,$00, $FF,$01, $FF,$01, $FF,$01, $FE,$01, $FF,$02, $FF,$01, $FF,$02
    db $FF,$01, $FF,$02, $FF,$01, $FF,$02, $00,$02, $FF,$01, $FF,$02, $FF,$02
    db $00,$02, $FF,$02, $FF,$02, $00,$01, $FF,$02, $00,$02, $00,$02, $FF,$01
    db $00,$02, $00,$02, $00,$01, $00,$02, $00,$02, $00,$01, $00,$02, $00,$01
    db $00,$02, $00,$02, $00,$01, $00,$02, $01,$01, $00,$02, $00,$01, $01,$02
    db $00,$02, $01,$01, $00,$02, $01,$01, $00,$02, $01,$01, $00,$02, $01,$01
    db $00,$02, $01,$01, $01,$02, $00,$02, $01,$01, $01,$02, $01,$01, $00,$02
    db $01,$01, $01,$02, $01,$01, $01,$02, $01,$01, $01,$01, $01,$02, $01,$01
    db $01,$01, $01,$01, $01,$01, $01,$01, $01,$01, $02,$01, $01,$01, $01,$01
    db $01,$01, $02,$00, $01,$01, $02,$01, $01,$00, $02,$01, $01,$00, $02,$00
    db $01,$01, $02,$00, $01,$00, $02,$00, $02,$00, $01,$00, $02,$00, $02,$00
    db $02,$00, $01,$00, $02,$00, $02,$00, $01,$00, $02,$00, $02,$00, $01,$FF
    db $02,$00, $02,$00, $02,$00, $01,$00, $02,$00, $02,$FF, $01,$00, $02,$00
    db $01,$00, $02,$00, $02,$FF, $01,$00, $02,$00, $02,$00, $01,$00, $02,$00
    db $01,$FF, $02,$00, $01,$00, $02,$00, $02,$00, $01,$00, $02,$00, $01,$FF
    db $02,$00, $02,$00, $01,$00, $02,$00, $01,$00, $02,$00, $02,$00, $01,$00
    db $02,$00, $01,$00, $02,$00, $02,$00, $01,$00, $02,$00, $01,$00, $02,$00
    db $02,$00, $01,$00, $02,$00, $02,$00, $01,$00, $02,$00, $01,$00, $02,$00
    db $02,$00
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $E359: Palette - enemy $DF3F/$DF7F (Spore Spawn) ;;;
Palette_SporeSpawn:
; Sprite palette 7. Spores
    dw $0000,$3F57,$2E4D,$00E2,$0060,$3AB0,$220B,$1166
    dw $0924,$57FF,$3AB5,$1DCE,$00E7,$03FF,$0216,$00B0


;;; $E379: Spore Spawn health-based palettes ;;;
; Sprite palette 1. Spore Spawn and spore spawner
Palette_SporeSpawn_HealthBased_0:
    dw $0000,$3F57,$2E4D,$00E2,$0060,$3AB0,$220B,$1166,$0924,$57FF,$3AB5,$1DCE,$00E7,$03FF,$0216,$00B0 ; Health >= 770
Palette_SporeSpawn_HealthBased_1:
    dw $3800,$2A92,$21CC,$00C4,$0062,$260E,$15AA,$0D27,$04E5,$475A,$2E52,$198C,$00C6,$033F,$01B6,$008F ; Health < 770
Palette_SporeSpawn_HealthBased_2:
    dw $3800,$15EF,$156B,$00A5,$0063,$15AC,$0D49,$0907,$04C6,$36D6,$21D0,$114B,$00A6,$025F,$0137,$008D ; Health < 410
Palette_SporeSpawn_HealthBased_3:
    dw $3800,$094A,$0908,$0463,$0000,$0929,$04C6,$04A5,$0484,$2631,$156D,$0D09,$0085,$019F,$00D7,$006C ; Health < 70


;;; $E3F9: Spore Spawn death sequence palettes ;;;
; Sprite palette 1. Spore Spawn and spore spawner
Palette_SporeSpawn_DeathSequence_0:
    dw $3800,$094A,$0908,$0463,$0000,$0929,$04C6,$04A5
    dw $0484,$2631,$156D,$0D09,$0085,$019F,$00D7,$006C

Palette_SporeSpawn_DeathSequence_1:
    dw $3800,$118C,$0D2A,$0464,$0000,$0D4B,$08E8,$04A6
    dw $0485,$2A53,$156E,$0D09,$0065,$09DF,$04F6,$006C

Palette_SporeSpawn_DeathSequence_2:
    dw $3800,$15AF,$114B,$0465,$0001,$156D,$0D09,$08C7
    dw $04A6,$2A74,$158E,$08EA,$0065,$11FE,$0916,$008C

Palette_SporeSpawn_DeathSequence_3:
    dw $3800,$1DF1,$156D,$0466,$0001,$198F,$112B,$08C8
    dw $04A7,$2E96,$158F,$08EA,$0045,$1A3E,$0D35,$008C

Palette_SporeSpawn_DeathSequence_4:
    dw $3800,$2213,$1D8F,$0086,$0001,$21D0,$114D,$08EA
    dw $04A8,$2E97,$1990,$04EA,$0044,$1E5D,$0D54,$00AB

Palette_SporeSpawn_DeathSequence_5:
    dw $3800,$2A55,$21B1,$0087,$0001,$25F2,$156F,$08EB
    dw $04A9,$32B9,$1991,$04EA,$0024,$269D,$1173,$00AB

Palette_SporeSpawn_DeathSequence_6:
    dw $3800,$2E78,$25D2,$0088,$0002,$2E14,$1990,$0D0C
    dw $04CA,$32DA,$19B1,$00CB,$0024,$2EBC,$1593,$00CB

Palette_SporeSpawn_DeathSequence_7:
    dw $3800,$36BA,$29F4,$0089,$0002,$3236,$1DB2,$0D0D
    dw $04CB,$36FC,$19B2,$00CB,$0004,$36FC,$19B2,$00CB

; BG1/2 palette 4. Level graphics (green)
Palette_SporeSpawn_DeathSequence_Level_0:
    dw $2003,$6318,$6318,$1CE1,$1DA9,$2923,$24A1,$1400
    dw $2269,$21C9,$1544,$0420,$268B,$04C5,$2731,$0000

Palette_SporeSpawn_DeathSequence_Level_1:
    dw $2003,$6318,$6318,$18C3,$1DAA,$2524,$1CA3,$1000
    dw $1E2A,$1D8A,$1145,$0000,$2A8D,$0CE7,$22F1,$0001

Palette_SporeSpawn_DeathSequence_Level_2:
    dw $0000,$6318,$6318,$14C4,$1DAC,$2126,$18A4,$0C00
    dw $19EA,$196A,$1147,$0001,$2A6F,$112A,$22B1,$0001

Palette_SporeSpawn_DeathSequence_Level_3:
    dw $0000,$6318,$6318,$0CA5,$19AD,$1908,$1085,$0400
    dw $118A,$114A,$0D29,$0001,$2E70,$194C,$1E72,$0002

Palette_SporeSpawn_DeathSequence_Level_4:
    dw $0000,$6318,$6318,$08A6,$19AF,$150A,$0C86,$0000
    dw $0D4A,$0D2A,$0D2B,$0002,$2E52,$1D8F,$1E32,$0002

Palette_SporeSpawn_DeathSequence_Level_5:
    dw $0000,$6318,$6318,$0488,$19B0,$110B,$0488,$0001
    dw $090B,$08EB,$092C,$0003,$3254,$25B1,$19F2,$0002

Palette_SporeSpawn_DeathSequence_Level_6:
    dw $0000,$6318,$6318,$0089,$19B2,$0D0D,$0089,$0002
    dw $04CB,$04CB,$092E,$0004,$3236,$29F4,$19B2,$0002

; BG1/2 palette 7. Background graphics (blue)
Palette_SporeSpawn_DeathSequence_Background_0:
    dw $3800,$5544,$3C84,$1441,$24E3,$18A2,$1081,$0C40
    dw $129C,$11B5,$14EE,$1066,$7FFF,$7FFF,$16BD,$0800

Palette_SporeSpawn_DeathSequence_Background_1:
    dw $3800,$4947,$3486,$1063,$2105,$18C4,$1083,$0C21
    dw $1239,$1194,$110E,$1065,$7FFF,$7FFF,$167B,$0401

Palette_SporeSpawn_DeathSequence_Background_2:
    dw $3800,$4169,$2CA7,$0C64,$2128,$14C6,$0C84,$0821
    dw $0DF6,$0D72,$110E,$0C45,$7FFF,$7FFF,$1659,$0401

Palette_SporeSpawn_DeathSequence_Background_3:
    dw $3800,$356B,$24C9,$0C65,$1D4A,$14E7,$0885,$0821
    dw $0DB4,$0D30,$0D0E,$0845,$7FFF,$7FFF,$1A38,$0401

Palette_SporeSpawn_DeathSequence_Background_4:
    dw $3800,$2D8D,$1CEA,$0866,$1D6D,$10E9,$0486,$0421
    dw $0971,$090E,$0D0E,$0425,$7FFF,$7FFF,$1A16,$0401

Palette_SporeSpawn_DeathSequence_Background_5:
    dw $3800,$2190,$14EC,$0488,$198F,$110B,$0488,$0402
    dw $090E,$08ED,$092E,$0424,$7FFF,$7FFF,$19D4,$0002

Palette_SporeSpawn_DeathSequence_Background_6:
    dw $3800,$19B2,$0D0D,$0089,$19B2,$0D0D,$0089,$0002
    dw $04CB,$04CB,$092E,$0004,$7FFF,$7FFF,$19B2,$0002


;;; $E6B9: Instruction list - initial - Spore Spawn is dead ;;;
InstList_SporeSpawn_Initial_Dead:
    dw Instruction_SporeSpawn_LoadDeathSequenceTargetPalette,$00C0
    dw Instruction_SporeSpawn_FunctionInY
    dw RTS_A5EB1A
    dw $0001,ExtendedSpritemap_SporeSpawn_Dead
    dw Instruction_Common_Sleep


;;; $E6C7: Instruction list - initial - Spore Spawn is alive ;;;
InstList_SporeSpawn_Initial_Alive:
    dw $0100,ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_0
    dw Instruction_SporeSpawn_FunctionInY
    dw Function_SporeSpawn_Descent
    dw $0001,ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_0
    dw Instruction_Common_Sleep


;;; $E6D5: Instruction list - fight has started ;;;
InstList_SporeSpawn_FightHasStarted:
    dw Instruction_SporeSpawn_SetMaxXRadiusAndAngleDelta,$0040,$0001
    dw Instruction_SporeSpawn_FunctionInY
    dw Function_SporeSpawn_Moving
    dw $0300,ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_0


;;; $E6E3: Instruction list - open and stop ;;;
InstList_SporeSpawn_OpenAndStop_0:
    dw Instruction_SporeSpawn_SporeGenerationFlagInY,$0001
    dw Instruction_SporeSpawn_QueueSFXInY_Lib2_Max6,$002C
    dw $0001,ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_0
    dw $0008,ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_1
    dw $0008,ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_2
    dw $0008,ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_3
    dw $0007,ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_4
    dw $0007,ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_5
    dw $0006,ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_6
    dw $0001,ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_7
    dw Instruction_SporeSpawn_ClearDamagedFlag
    dw Instruction_SporeSpawn_FunctionInY
    dw RTS_A5EB1A
    dw Instruction_Common_TimerInY,$0005

InstList_SporeSpawn_OpenAndStop_1:
    dw $0008,ExtendedSpritemap_SporeSpawn_FullyOpen_0
    dw $0008,ExtendedSpritemap_SporeSpawn_FullyOpen_1
    dw $0008,ExtendedSpritemap_SporeSpawn_FullyOpen_2
    dw $0008,ExtendedSpritemap_SporeSpawn_FullyOpen_1
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate
    dw InstList_SporeSpawn_OpenAndStop_1


;;; $E729: Instruction list - close and move ;;;
InstList_SporeSpawn_CloseAndMove:
    dw $0008,ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_6
    dw $0008,ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_5
    dw $0008,ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_4
    dw $0008,ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_3
    dw $0008,ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_2
    dw $0008,ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_1
    dw $0001,ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_0
    dw Instruction_SporeSpawn_FunctionInY
    dw Function_SporeSpawn_Moving
    dw Instruction_SporeSpawn_SporeGenerationFlagInY,$0000
    dw Instruction_SporeSpawn_IncreaseMaxXRadius
    dw $0200,ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_0
    dw Instruction_SporeSpawn_SporeGenerationFlagInY,$0001
    dw $00D0,ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_0
    dw Instruction_Common_GotoY
    dw InstList_SporeSpawn_OpenAndStop_0


;;; $E75F: Instruction - increase Spore Spawn max X radius ;;;
Instruction_SporeSpawn_IncreaseMaxXRadius:
; This function has no effect, Spore Spawn max X radius is always 30h or 40h
    LDA.L SporeSpawn.maxXRadius : CLC : ADC.W #$0008 : CMP.W #$0030 : BPL .return
    STA.L SporeSpawn.maxXRadius

  .return:
    RTL


;;; $E771: Instruction - clear Spore Spawn damaged flag ;;;
Instruction_SporeSpawn_ClearDamagedFlag:
    PHX : PHY
    LDA.W #$0000 : STA.L SporeSpawn.damagedFlag
    PLY : PLX
    RTL


;;; $E77D: Instruction list - death sequence ;;;
InstList_SporeSpawn_DeathSequence_0:
    dw Instruction_SporeSpawn_FunctionInY
    dw Function_SporeSpawn_SetupDeath
    dw $0001,ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_6
    dw Instruction_SporeSpawn_FunctionInY
    dw Function_SporeSpawn_Dying
    dw Instruction_Common_TimerInY,$000A

InstList_SporeSpawn_DeathSequence_1:
    dw $0001,ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_6
    dw Instruction_SporeSpawn_SpawnDyingExplosion
    dw Instruction_Common_WaitYFrames,$0008
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate
    dw InstList_SporeSpawn_DeathSequence_1
    dw $0008,ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_6
    dw $0008,ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_5
    dw $0008,ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_4
    dw $0008,ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_3
    dw $0008,ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_2
    dw $0008,ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_1
    dw $0001,ExtendedSpritemap_SporeSpawn_Dead
    dw Instruction_SporeSpawn_Harden
    dw Instruction_Common_TimerInY,$000A

InstList_SporeSpawn_DeathSequence_2:
    dw Instruction_SporeSpawn_SpawnHardeningDustCloud
    dw Instruction_Common_WaitYFrames,$0008
    dw Instruction_Common_DecrementTimer_GotoYIfNonZero_duplicate
    dw InstList_SporeSpawn_DeathSequence_2
    dw Instruction_SporeSpawn_LoadDeathSequencePalette,$0000
    dw Instruction_SporeSpawn_SpawnHardeningDustCloud
    dw $0010,ExtendedSpritemap_SporeSpawn_Dead
    dw Instruction_SporeSpawn_LoadDeathSequencePalette,$0020
    dw Instruction_SporeSpawn_SpawnHardeningDustCloud
    dw $0010,ExtendedSpritemap_SporeSpawn_Dead
    dw Instruction_SporeSpawn_LoadDeathSequencePalette,$0040
    dw Instruction_SporeSpawn_SpawnHardeningDustCloud
    dw $0010,ExtendedSpritemap_SporeSpawn_Dead
    dw Instruction_SporeSpawn_LoadDeathSequencePalette,$0060
    dw Instruction_SporeSpawn_SpawnHardeningDustCloud
    dw $0010,ExtendedSpritemap_SporeSpawn_Dead
    dw Instruction_SporeSpawn_LoadDeathSequencePalette,$0080
    dw Instruction_SporeSpawn_SpawnHardeningDustCloud
    dw $0010,ExtendedSpritemap_SporeSpawn_Dead
    dw Instruction_SporeSpawn_LoadDeathSequencePalette,$00A0
    dw Instruction_SporeSpawn_SpawnHardeningDustCloud
    dw $0010,ExtendedSpritemap_SporeSpawn_Dead
    dw Instruction_SporeSpawn_LoadDeathSequencePalette,$00C0
    dw Instruction_SporeSpawn_SpawnHardeningDustCloud
    dw $0010,ExtendedSpritemap_SporeSpawn_Dead
    dw Instruction_SporeSpawn_CallSporeSpawnDeathItemDropRoutine
    dw Instruction_Common_Sleep


if !FEATURE_KEEP_UNREFERENCED
;;; $E811: Unused. Instruction - Spore Spawn max X radius = [[Y]], angle delta = [[Y] + 2], angle = [[Y] + 4] ;;;
UNUSED_Instruction_SporeSpawn_SetMaxXRadiusAndAngles_A5E811:
    LDA.W $0000,Y : STA.L SporeSpawn.maxXRadius
    LDA.W $0002,Y : STA.L SporeSpawn.angleDelta
    LDA.W $0004,Y : STA.L SporeSpawn.angle
    TYA : CLC : ADC.W #$0006 : TAY
    RTL
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $E82D: Instruction - Spore Spawn max X radius = [[Y]], angle delta = [[Y] + 2] ;;;
Instruction_SporeSpawn_SetMaxXRadiusAndAngleDelta:
    LDA.W $0000,Y : STA.L SporeSpawn.maxXRadius
    LDA.W $0002,Y : STA.L SporeSpawn.angleDelta
    INY #4
    RTL


if !FEATURE_KEEP_UNREFERENCED
;;; $E840: Unused. Instruction - Spore Spawn max X radius = [[Y]] ;;;
UNUSED_Instruction_SporeSpawn_MaxXRadiusInY_A5E840:
    LDA.W $0000,Y : STA.L SporeSpawn.maxXRadius
    INY #2
    RTL


;;; $E84A: Unused. Instruction - Spore Spawn angle delta = [[Y]] ;;;
UNUSED_Instruction_SporeSpawn_AngleDeltaInY_A5E84A:
    LDA.W $0000,Y : STA.L SporeSpawn.angleDelta
    INY #2
    RTL


;;; $E854: Unused. Instruction - Spore Spawn max X radius += [[Y]] ;;;
UNUSED_Instruction_SporeSpawn_MaxXRadiusPlusY_A5E854:
    LDA.L SporeSpawn.maxXRadius : CLC : ADC.W $0000,Y : STA.L SporeSpawn.maxXRadius
    INY #2
    RTL


;;; $E863: Unused. Instruction - Spore Spawn angle delta += [[Y]] ;;;
UNUSED_Instruction_SporeSpawn_AngleDeltaPlusY_A5E863:
    LDA.L SporeSpawn.angleDelta : CLC : ADC.W $0000,Y : STA.L SporeSpawn.angleDelta
    INY #2
    RTL
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $E872: Instruction - spore generation flag = [[Y]] ;;;
Instruction_SporeSpawn_SporeGenerationFlagInY:
    LDA.W $0000,Y : STA.L SporeSpawn.sporeGenerationFlag
    INY #2
    RTL


;;; $E87C: Instruction - Spore Spawn harden ;;;
Instruction_SporeSpawn_Harden:
    LDA.W #$0080 : STA.W Enemy.XPosition
    LDA.W #$0270 : STA.W Enemy.YPosition
    LDA.W Enemy.properties : ORA.W #$A000 : AND.W #$FBFF : STA.W Enemy.properties
    RTL


;;; $E895: Instruction - queue sound [[Y]], sound library 2, max queued sounds allowed = 6 ;;;
Instruction_SporeSpawn_QueueSFXInY_Lib2_Max6:
    PHX : PHY
    LDA.W $0000,Y
    JSL QueueSound_Lib2_Max6
    PLY : PLX
    INY #2
    RTL


;;; $E8A3: Unused. Instruction - queue sound [[Y]], sound library 3, max queued sounds allowed = 6 ;;;
Instruction_SporeSpawn_QueueSFXInY_Lib3_Max6:
    PHX : PHY
    LDA.W $0000,Y
    JSL QueueSound_Lib3_Max6
    PLY : PLX
    INY #2
    RTL


;;; $E8B1: Instruction - call Spore Spawn death item drop routine ;;;
Instruction_SporeSpawn_CallSporeSpawnDeathItemDropRoutine:
    PHX : PHY
    JSL SporeSpawnDeathItemDropRoutine
    PLY : PLX
    RTL


;;; $E8BA: Instruction - enemy function = [[Y]] ;;;
Instruction_SporeSpawn_FunctionInY:
    PHY : PHX
    LDX.W EnemyIndex
    LDA.W $0000,Y : STA.W SporeSpawn.function,X
    PLX : PLY
    INY #2
    RTL


;;; $E8CA: Instruction - load Spore Spawn death sequence palette, palette data offset [[Y]] ;;;
Instruction_SporeSpawn_LoadDeathSequencePalette:
    PHY : PHX
    STY.B DP_Temp12
    LDA.W $0000,Y : TAY
    LDX.W #$0000

  .loopSpritePalette1:
    LDA.W Palette_SporeSpawn_DeathSequence_0,Y : STA.L Palettes_SpriteP1,X
    INY #2
    INX #2 : CPX.W #$0020 : BNE .loopSpritePalette1
    LDY.B DP_Temp12
    LDA.W $0000,Y : TAY
    LDX.W #$0000

  .loopBG12Palette4:
    LDA.W Palette_SporeSpawn_DeathSequence_Level_0,Y : STA.L Palettes_BG12P4,X
    INY #2
    INX #2 : CPX.W #$0020 : BNE .loopBG12Palette4
    LDY.B DP_Temp12
    LDA.W $0000,Y : TAY
    LDX.W #$0000

  .loopBG12Palette7:
    LDA.W Palette_SporeSpawn_DeathSequence_Background_0,Y : STA.L Palettes_BG12P7,X
    INY #2
    INX #2 : CPX.W #$0020 : BNE .loopBG12Palette7
    PLX : PLY
    INY #2
    RTL


;;; $E91C: Instruction - load Spore Spawn death sequence target palette, palette data offset [[Y]] ;;;
Instruction_SporeSpawn_LoadDeathSequenceTargetPalette:
; Similar to Instruction_SporeSpawn_LoadDeathSequencePalette, but writing to target palette colours instead (called before fade-in)
    PHY : PHX
    STY.B DP_Temp12
    LDA.W $0000,Y : TAY
    LDX.W #$0000

  .loopSpritePalette1:
    LDA.W Palette_SporeSpawn_DeathSequence_0,Y : STA.L TargetPalettes_SpriteP1,X
    INY #2
    INX #2 : CPX.W #$0020 : BNE .loopSpritePalette1
    LDY.B DP_Temp12
    LDA.W $0000,Y : TAY
    LDX.W #$0000

  .loopBG12Palette4:
    LDA.W Palette_SporeSpawn_DeathSequence_Level_0,Y : STA.L TargetPalettes_BGP4,X
    INY #2
    INX #2 : CPX.W #$0020 : BNE .loopBG12Palette4
    LDY.B DP_Temp12
    LDA.W $0000,Y : TAY
    LDX.W #$0000

  .loopBG12Palette7:
    LDA.W Palette_SporeSpawn_DeathSequence_Background_0,Y : STA.L TargetPalettes_BGP7,X
    INY #2
    INX #2 : CPX.W #$0020 : BNE .loopBG12Palette7
    PLX : PLY
    INY #2
    RTL


;;; $E96E: Instruction - spawn Spore Spawn hardening dust cloud ;;;
Instruction_SporeSpawn_SpawnHardeningDustCloud:
    PHY : PHX
    JSL GenerateRandomNumber
    LDA.W RandomNumberSeed : AND.W #$007F : SEC : SBC.W #$0040 : STA.B DP_Temp12
    LDA.W Enemy.XPosition : CLC
    ADC.B DP_Temp12 : STA.B DP_Temp12
    LDA.W RandomNumberSeed : AND.W #$7F00 : XBA : SEC : SBC.W #$0040 : STA.B DP_Temp14
    LDA.W Enemy.YPosition : CLC : ADC.B DP_Temp14 : STA.B DP_Temp14
    LDA.W #$0015
    LDY.W #EnemyProjectile_MiscDust
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    LDA.W #$0029
    JSL QueueSound_Lib2_Max6
    PLX : PLY
    RTL


;;; $E9B1: Instruction - spawn Spore Spawn dying explosion ;;;
Instruction_SporeSpawn_SpawnDyingExplosion:
    PHY : PHX
    JSL GenerateRandomNumber
    LDA.W RandomNumberSeed : AND.W #$007F : SEC : SBC.W #$0040 : STA.B DP_Temp12
    LDA.W Enemy.XPosition : CLC : ADC.B DP_Temp12 : STA.B DP_Temp12
    LDA.W RandomNumberSeed : AND.W #$3F00 : XBA : SEC : SBC.W #$0020 : STA.B DP_Temp14
    LDA.W Enemy.YPosition : CLC : ADC.B DP_Temp14 : STA.B DP_Temp14
    LDA.W #$0003 : STA.B DP_Temp16
    STZ.B DP_Temp18
    JSL Create_Sprite_Object
    LDA.W #$0025
    JSL QueueSound_Lib2_Max6
    PLX : PLY
    RTL


;;; $E9F5: Spawn Spore Spawn ceiling dust cloud ;;;
SpawnSporeSpawnCeilingDustCloud:
    PHY : PHX
    LDA.W NMI_FrameCounter : AND.W #$000F : BNE .return
    JSL GenerateRandomNumber
    LDA.W RandomNumberSeed : AND.W #$003F : CLC : ADC.W #$0060 : STA.B DP_Temp12
    LDA.W RandomNumberSeed : AND.W #$0F00 : XBA : CLC : ADC.W #$01E0 : STA.B DP_Temp14
    LDA.W #$0015 : STA.B DP_Temp16
    STZ.B DP_Temp18
    JSL Create_Sprite_Object

  .return:
    PLX : PLY
    RTL


;;; $EA2A: Initialisation AI - enemy $DF3F/$DF7F (Spore Spawn) ;;;
InitAI_SporeSpawn:
    LDY.W #$0000
    LDX.W #$0000

  .loopSpritePalette7:
    LDA.W Palette_SporeSpawn,Y : STA.L TargetPalettes_SpriteP7,X
    INY #2
    INX #2 : CPX.W #$0020 : BNE .loopSpritePalette7
    LDX.W EnemyIndex
    LDA.W #$0000
    LDY.W #EnemyProjectile_SporeSpawnStalk
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    LDA.W #$0001
    LDY.W #EnemyProjectile_SporeSpawnStalk
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    LDA.W #$0002
    LDY.W #EnemyProjectile_SporeSpawnStalk
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    LDA.W #$0003
    LDY.W #EnemyProjectile_SporeSpawnStalk
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    LDX.W EnemyIndex
    LDA.W Enemy.XPosition,X : STA.L SporeSpawn.stalkXOrigin,X
    LDA.W Enemy.YPosition,X : SEC : SBC.W #$0048 : STA.L SporeSpawn.stalkYOrigin,X
    LDA.W Enemy.XPosition,X : STA.W SporeSpawn.XOrigin,X
    LDA.W Enemy.YPosition,X : STA.W SporeSpawn.YOrigin,X
    STZ.W Enemy.var5,X
    LDX.W AreaIndex
    LDA.L SRAMMirror_Boss,X : AND.W #$0002 : BEQ .alive
    LDA.W #InstList_SporeSpawn_Initial_Dead : STA.W Enemy.instList
    LDA.W #RTS_A5EB1A : STA.W SporeSpawn.function
    LDA.W Enemy.properties : ORA.W #$8000 : STA.W Enemy.properties
    JSR UpdateSporeSpawnStalkSegmentPositions
    JSL Spawn_Hardcoded_PLM
    db $07,$1E
    dw PLMEntries_clearSporeSpawnCeiling
    STZ.W ScrollingSkyFinishedHook
    RTL

  .alive:
    LDX.W EnemyIndex
    LDA.W #InstList_SporeSpawn_Initial_Alive : STA.W Enemy.instList
    LDA.W #$FFFF : STA.W GlobalOffScreenEnemyProcessingFlag
    LDX.W EnemyIndex ; >.<
    LDA.W #RTS_A5EB1A : STA.W SporeSpawn.function,X
    LDA.W #ScrollingFinishedHook_SporeSpawnFight : STA.W ScrollingSkyFinishedHook
    LDA.W Enemy.YPosition,X : SEC : SBC.W #$0080 : STA.W Enemy.YPosition,X
    LDA.W #$0000
    LDY.W #EnemyProjectile_SporeSpawnSporeSpawner
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    LDA.W #$0001
    LDY.W #EnemyProjectile_SporeSpawnSporeSpawner
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    LDA.W #$0002
    LDY.W #EnemyProjectile_SporeSpawnSporeSpawner
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    LDA.W #$0003
    LDY.W #EnemyProjectile_SporeSpawnSporeSpawner
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    JSR UpdateSporeSpawnStalkSegmentPositions
    RTL


;;; $EB13: Main AI - enemy $DF3F/$DF7F (Spore Spawn) ;;;
MainAI_SporeSpawn:
    LDX.W EnemyIndex
    JSR.W (SporeSpawn.function,X)
    RTL


;;; $EB1A: RTS ;;;
RTS_A5EB1A:
    RTS


;;; $EB1B: Spore Spawn function - descent ;;;
Function_SporeSpawn_Descent:
    JSR UpdateSporeSpawnStalkSegmentPositions
    LDX.W EnemyIndex ; >.<
    LDA.W Enemy.YPosition,X : CLC : ADC.W #$0001 : STA.W Enemy.YPosition,X
    CMP.W #$0270 : BMI .descending
    LDA.W #InstList_SporeSpawn_FightHasStarted : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X

  .descending:
    LDA.W #$0030 : STA.L SporeSpawn.maxXRadius
    LDA.W #$0001 : STA.L SporeSpawn.angleDelta
    LDA.W #$00C0 : STA.L SporeSpawn.angle
    RTS


;;; $EB52: Spore Spawn function - moving ;;;
Function_SporeSpawn_Moving:
    JSR UpdateSporeSpawnStalkSegmentPositions
    LDA.L SporeSpawn.maxXRadius : STA.W Temp_XPosition
    LDA.L SporeSpawn.angle
    JSL EightBitCosineMultiplication_A0B0B2
    CLC : ADC.W SporeSpawn.XOrigin,X : STA.W Enemy.XPosition,X
    LDA.L SporeSpawn.maxXRadius : SEC : SBC.W #$0010 : STA.W Temp_XPosition
    LDA.L SporeSpawn.angle : SEC : SBC.W #$0040 : ASL
    JSL EightBitNegativeSineMultiplication_A0B0C6
    CLC : ADC.W SporeSpawn.YOrigin,X : STA.W Enemy.YPosition,X
    LDA.L SporeSpawn.angle : CLC : ADC.L SporeSpawn.angleDelta : AND.W #$00FF : STA.L SporeSpawn.angle
    RTS


;;; $EB9B: Spore Spawn function - set up death ;;;
Function_SporeSpawn_SetupDeath:
    LDX.W EnemyIndex ; >.<
    LDA.W #$0080 : SEC : SBC.W Enemy.XPosition : STA.B DP_Temp12
    LDA.W #$0270 : SEC : SBC.W Enemy.YPosition : STA.B DP_Temp14
    JSL CalculateAngleOf_12_14_Offset
    SEC : SBC.W #$0040 : EOR.W #$FFFF : INC
    AND.W #$00FF : STA.L SporeSpawn.deathDriftAngle
    LDA.W #$0001 : STA.B DP_Temp14
    LDA.L SporeSpawn.deathDriftAngle : AND.W #$00FF : STA.B DP_Temp12
    JSL Do_Some_Math_With_Sine_Cosine_Terrible_Label_Name ; ($16.$18, $1A.$1C) = ([$14] * |cos([$12] * pi / 80h)|, [$14] * |sin([$12] * pi / 80h)|)
    LDA.B DP_Temp16 : STA.L SporeSpawn.deathDriftXSpeed,X
    LDA.B DP_Temp18 : STA.L SporeSpawn.deathDriftXSubSpeed,X
    LDA.B DP_Temp1A : STA.L SporeSpawn.deathDriftYSpeed,X
    LDA.B DP_Temp1C : STA.L SporeSpawn.deathDriftYSubSpeed,X
    RTS


;;; $EBEE: Spore Spawn function - dying ;;;
Function_SporeSpawn_Dying:
    LDX.W EnemyIndex ; >.<
    LDA.L SporeSpawn.deathDriftXSpeed,X : STA.W Temp_XSpeed
    LDA.L SporeSpawn.deathDriftXSubSpeed,X : STA.W Temp_XSubSpeed
    LDA.L SporeSpawn.deathDriftYSpeed,X : STA.W Temp_YSpeed
    LDA.L SporeSpawn.deathDriftYSubSpeed,X : STA.W Temp_YSubSpeed
    LDA.L SporeSpawn.deathDriftAngle : AND.W #$00FF : STA.W Temp_AngleToMove
    JSL MoveEnemyAccordingToAngleAndXYSpeeds
    LDA.W Enemy.XPosition : SEC : SBC.W #$0080
    JSL NegateA_A0B067
    CMP.W #$0008 : BPL .notDone
    LDA.W Enemy.YPosition : SEC : SBC.W #$0270
    JSL NegateA_A0B067
    CMP.W #$0008 : BPL .notDone
    LDA.W #RTS_A5EB1A : STA.W SporeSpawn.function

  .notDone:
    JSR UpdateSporeSpawnStalkSegmentPositions
    JSL SpawnSporeSpawnCeilingDustCloud
    RTS


;;; $EC49: Update Spore Spawn stalk segment positions ;;;
UpdateSporeSpawnStalkSegmentPositions:
    LDA.W Enemy.XPosition : SEC : SBC.L SporeSpawn.stalkXOrigin : BPL .positiveX
    EOR.W #$FFFF : INC : LSR : STA.B DP_Temp12
    LSR : STA.B DP_Temp14
    CLC : ADC.B DP_Temp12 : STA.B DP_Temp16
    LDA.W #$0080 : STA.W EnemyProjectile_XPositions+$1C
    LDA.L SporeSpawn.stalkXOrigin : SEC : SBC.B DP_Temp14 : STA.W EnemyProjectile_XPositions+$1E : STA.L SporeSpawn.stalkSegment2XPosition
    LDA.L SporeSpawn.stalkXOrigin : SEC : SBC.B DP_Temp12 : STA.W EnemyProjectile_XPositions+$20 : STA.L SporeSpawn.stalkSegment1XPosition
    LDA.L SporeSpawn.stalkXOrigin : SEC : SBC.B DP_Temp16 : STA.W EnemyProjectile_XPositions+$22 : STA.L SporeSpawn.stalkSegment0XPosition
    BRA .checkY

  .positiveX:
    LSR : STA.B DP_Temp12
    LSR : STA.B DP_Temp14
    CLC : ADC.B DP_Temp12 : STA.B DP_Temp16
    LDA.W #$0080 : STA.W EnemyProjectile_XPositions+$1C
    LDA.B DP_Temp14 : CLC : ADC.L SporeSpawn.stalkXOrigin : STA.W EnemyProjectile_XPositions+$1E : STA.L SporeSpawn.stalkSegment2XPosition
    LDA.B DP_Temp12 : CLC : ADC.L SporeSpawn.stalkXOrigin : STA.W EnemyProjectile_XPositions+$20 : STA.L SporeSpawn.stalkSegment1XPosition
    LDA.B DP_Temp16 : CLC : ADC.L SporeSpawn.stalkXOrigin : STA.W EnemyProjectile_XPositions+$22 : STA.L SporeSpawn.stalkSegment0XPosition

  .checkY:
    LDA.W Enemy.YPosition : SEC : SBC.W #$0028
    SEC : SBC.L SporeSpawn.stalkYOrigin : BPL .positiveY
    EOR.W #$FFFF : INC
    LSR : STA.B DP_Temp12
    LSR : STA.B DP_Temp14
    CLC : ADC.B DP_Temp12 : STA.B DP_Temp16
    LDA.W #$0230 : STA.W EnemyProjectile_YPositions+$1C
    LDA.L SporeSpawn.stalkYOrigin : SEC : SBC.B DP_Temp14 : STA.W EnemyProjectile_YPositions+$1E : STA.L SporeSpawn.stalkSegment2YPosition
    LDA.L SporeSpawn.stalkYOrigin : SEC : SBC.B DP_Temp12 : STA.W EnemyProjectile_YPositions+$20 : STA.L SporeSpawn.stalkSegment1YPosition
    LDA.L SporeSpawn.stalkYOrigin : SEC : SBC.B DP_Temp16 : STA.W EnemyProjectile_YPositions+$22 : STA.L SporeSpawn.stalkSegment0YPosition
    BRA .return

  .positiveY:
    LSR : STA.B DP_Temp12
    LSR : STA.B DP_Temp14
    CLC : ADC.B DP_Temp12 : STA.B DP_Temp16
    LDA.W #$0230 : STA.W EnemyProjectile_YPositions+$1C
    LDA.B DP_Temp14 : CLC : ADC.L SporeSpawn.stalkYOrigin : STA.W EnemyProjectile_YPositions+$1E : STA.L SporeSpawn.stalkSegment2YPosition
    LDA.B DP_Temp12 : CLC : ADC.L SporeSpawn.stalkYOrigin : STA.W EnemyProjectile_YPositions+$20 : STA.L SporeSpawn.stalkSegment1YPosition
    LDA.B DP_Temp16 : CLC : ADC.L SporeSpawn.stalkYOrigin : STA.W EnemyProjectile_YPositions+$22 : STA.L SporeSpawn.stalkSegment0YPosition

  .return:
    RTS


;;; $ED5A: Enemy shot - Spore Spawn - vulnerable ;;;
EnemyShot_SporeSpawn_Vulnerable:
    LDA.W CollisionIndex : ASL : TAX
    LDA.W SamusProjectile_Types,X : BIT.W #$0700 : BNE .notBeam
    BIT.W #$0010 : BNE .notBeam
    RTL

  .notBeam:
    JSL NormalEnemyShotAI_NoDeathCheck
    LDA.W Enemy.flashTimer,X : BEQ EnemyShot_SporeSpawn
    LDA.W #Function_SporeSpawn_Moving : STA.W SporeSpawn.function,X
    LDY.W #$0002
    LDA.W Enemy.health,X : CMP.W #$0190 : BPL .noSpeedUp
    LDA.L SporeSpawn.angleDelta : BPL .negativeAngleDelta
    TYA : EOR.W #$FFFF : INC : TAY

  .negativeAngleDelta:
    TYA : STA.L SporeSpawn.angleDelta

  .noSpeedUp:
    LDA.L SporeSpawn.damagedFlag : BNE EnemyShot_SporeSpawn
    LDA.L SporeSpawn.angleDelta : EOR.W #$FFFF : INC : STA.L SporeSpawn.angleDelta
    LDA.W #$0001 : STA.L SporeSpawn.damagedFlag
    LDA.W #InstList_SporeSpawn_CloseAndMove : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    LDY.W #$0060
    LDA.W Enemy.health,X : CMP.W #$0046 : BMI .paletteChosen
    LDY.W #$0040
    CMP.W #$019A : BMI .paletteChosen
    LDY.W #$0020
    CMP.W #$0302 : BMI .paletteChosen
    LDY.W #$0000

  .paletteChosen:
    CMP.L SporeSpawn.previousHealth : BEQ EnemyShot_SporeSpawn
    STA.L SporeSpawn.previousHealth
    TYA
    JSL LoadSporeSpawnHealthBasedPalette
; fallthrough to EnemyShot_SporeSpawn


;;; $EDEA: Enemy shot - enemy $DF3F/$DF7F (Spore Spawn) ;;;
EnemyShot_SporeSpawn:
    BRA SporeSpawnReaction_Common


;;; $EDEC: Enemy touch - enemy $DF3F/$DF7F (Spore Spawn) ;;;
EnemyTouch_SporeSpawn:
    JSL NormalEnemyTouchAI_NoDeathCheck_External
    BRA SporeSpawnReaction_Common


;;; $EDF2: RTL. Power bomb reaction - enemy $DF3F (Spore Spawn) ;;;
PowerBombReaction_SporeSpawn:
    RTL


;;; $EDF3: Spore Spawn reaction ;;;
SporeSpawnReaction_Common:
    LDX.W EnemyIndex
    LDA.W Enemy.health,X : BNE .return
    LDX.W EnemyIndex ; >.<
    LDA.W #$0000 : STA.L ExtraEnemy7800+$1C
    STZ.W Enemy.invincibilityTimer,X : STZ.W Enemy.flashTimer,X : STZ.W Enemy.AI,X
    LDA.W Enemy.properties,X : ORA.W #$0400 : STA.W Enemy.properties,X
    LDY.W #$001A
    LDA.W #$0000

  .loopClearProjectiles:
    STA.W EnemyProjectile_ID,Y
    DEY #2 : BPL .loopClearProjectiles
    LDA.W #InstList_SporeSpawn_DeathSequence_0 : STA.W Enemy.instList
    LDA.W #$0001 : STA.W Enemy.instTimer
    LDX.W AreaIndex
    LDA.L SRAMMirror_Boss,X : ORA.W #$0002 : STA.L SRAMMirror_Boss,X
    STZ.W ScrollingSkyFinishedHook
    JSL Spawn_Hardcoded_PLM
    db $07,$1E
    dw PLMEntries_crumbleSporeSpawnCeiling

  .return:
    RTL


;;; $EE4A: Load Spore Spawn health-based palette ;;;
LoadSporeSpawnHealthBasedPalette:
;; Parameters:
;;     A: Palette data offset

; Rather unfortunate that this routine is only called from one place, and that place does a TYA to get the argument in A,
; only for this routine to put it *back* into Y anyway and needlessly preserve Y on the stack
    PHY : PHX
    STA.B DP_Temp12
    TAY
    LDX.W #$0000

  .loopSpritePalette1:
    LDA.W Palette_SporeSpawn_HealthBased_0,Y : STA.L Palettes_SpriteP1,X
    INY #2
    INX #2 : CPX.W #$0020 : BNE .loopSpritePalette1
    PLX : PLY
    RTL


;;; $EE65: Spore Spawn extended spritemaps ;;;
ExtendedSpritemap_SporeSpawn_Dead:
    dw $0001
    dw $0000,$0000
    dw Spritemap_SporeSpawn_0
    dw Hitbox_SporeSpawn_0

ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_0:
    dw $0001
    dw $0000,$0000
    dw Spritemap_SporeSpawn_0
    dw Hitbox_SporeSpawn_1

ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_1:
    dw $0002
    dw $0000,$0000
    dw Spritemap_SporeSpawn_1
    dw Hitbox_SporeSpawn_2
    dw $0000,$0000
    dw Spritemap_SporeSpawn_B
    dw Hitbox_SporeSpawn_B

ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_2:
    dw $0002
    dw $0000,$0000
    dw Spritemap_SporeSpawn_2
    dw Hitbox_SporeSpawn_3
    dw $0000,$0000
    dw Spritemap_SporeSpawn_C
    dw Hitbox_SporeSpawn_C

ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_3:
    dw $0002
    dw $0000,$0000
    dw Spritemap_SporeSpawn_3
    dw Hitbox_SporeSpawn_4
    dw $0000,$0000
    dw Spritemap_SporeSpawn_D
    dw Hitbox_SporeSpawn_D

ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_4:
    dw $0002
    dw $0000,$0000
    dw Spritemap_SporeSpawn_4
    dw Hitbox_SporeSpawn_5
    dw $0000,$0000
    dw Spritemap_SporeSpawn_C
    dw Hitbox_SporeSpawn_C

ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_5:
    dw $0002
    dw $0000,$0000
    dw Spritemap_SporeSpawn_5
    dw Hitbox_SporeSpawn_6
    dw $0000,$0000
    dw Spritemap_SporeSpawn_B
    dw Hitbox_SporeSpawn_B

ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_6:
    dw $0002
    dw $0000,$0000
    dw Spritemap_SporeSpawn_15
    dw Hitbox_SporeSpawn_13
    dw $0000,$0000
    dw Spritemap_SporeSpawn_C
    dw Hitbox_SporeSpawn_C

ExtendedSpritemap_SporeSpawn_Closed_Closing_Opening_7:
    dw $0002
    dw $0000,$0000
    dw Spritemap_SporeSpawn_16
    dw Hitbox_SporeSpawn_14
    dw $0000,$0000
    dw Spritemap_SporeSpawn_D
    dw Hitbox_SporeSpawn_D

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ExtendedSpritemap_SporeSpawn_A5EEF7:
    dw $0001
    dw $0000,$0000
    dw Spritemap_SporeSpawn_F
    dw Hitbox_SporeSpawn_F

UNUSED_ExtendedSpritemap_SporeSpawn_A5EF01:
    dw $0001
    dw $0000,$0000
    dw Spritemap_SporeSpawn_10
    dw Hitbox_SporeSpawn_10

UNUSED_ExtendedSpritemap_SporeSpawn_A5EF0B:
    dw $0001
    dw $0000,$0000
    dw Spritemap_SporeSpawn_11
    dw Hitbox_SporeSpawn_11

UNUSED_ExtendedSpritemap_SporeSpawn_A5EF15:
    dw $0001
    dw $0000,$0000
    dw Spritemap_SporeSpawn_12
    dw Hitbox_SporeSpawn_12

UNUSED_ExtendedSpritemap_SporeSpawn_A5EF1F:
    dw $0001
    dw $0000,$0000
    dw Spritemap_SporeSpawn_13
    dw Hitbox_SporeSpawn_13

UNUSED_ExtendedSpritemap_SporeSpawn_A5EF29:
    dw $0001
    dw $0000,$0000
    dw Spritemap_SporeSpawn_14
    dw Hitbox_SporeSpawn_13

UNUSED_ExtendedSpritemap_SporeSpawn_A5EF33:
    dw $0001
    dw $0000,$0000
    dw Spritemap_SporeSpawn_E
    dw Hitbox_SporeSpawn_E
endif ; !FEATURE_KEEP_UNREFERENCED

ExtendedSpritemap_SporeSpawn_FullyOpen_0:
    dw $0002
    dw $0000,$0000
    dw Spritemap_SporeSpawn_16
    dw Hitbox_SporeSpawn_14
    dw $0000,$0000
    dw Spritemap_SporeSpawn_B
    dw Hitbox_SporeSpawn_B

ExtendedSpritemap_SporeSpawn_FullyOpen_1:
    dw $0002
    dw $0000,$0000
    dw Spritemap_SporeSpawn_16
    dw Hitbox_SporeSpawn_14
    dw $0000,$0000
    dw Spritemap_SporeSpawn_C
    dw Hitbox_SporeSpawn_C

ExtendedSpritemap_SporeSpawn_FullyOpen_2:
    dw $0002
    dw $0000,$0000
    dw Spritemap_SporeSpawn_16
    dw Hitbox_SporeSpawn_14
    dw $0000,$0000
    dw Spritemap_SporeSpawn_D
    dw Hitbox_SporeSpawn_D


;;; $EF73: Spore Spawn hitboxes ;;;
Hitbox_SporeSpawn_0:
    dw $0002
    dw $FFD7,$FFE2,$0029,$001E
    dw RTL_A5804C
    dw Common_CreateADudShot
    dw $FFF0,$FFD3,$000F,$FFE2
    dw RTL_A5804C
    dw Common_CreateADudShot

Hitbox_SporeSpawn_1:
    dw $0002
    dw $FFD7,$FFE2,$0029,$001E
    dw EnemyTouch_SporeSpawn
    dw Common_CreateADudShot
    dw $FFF0,$FFD3,$000F,$FFE2
    dw EnemyTouch_SporeSpawn
    dw Common_CreateADudShot

Hitbox_SporeSpawn_2:
    dw $0002
    dw $FFD4,$FFDD,$002B,$0021
    dw EnemyTouch_SporeSpawn
    dw Common_CreateADudShot
    dw $FFF0,$FFCF,$000F,$FFDD
    dw EnemyTouch_SporeSpawn
    dw Common_CreateADudShot

Hitbox_SporeSpawn_3:
    dw $0004
    dw $FFD3,$FFDA,$002C,$FFF7
    dw EnemyTouch_SporeSpawn
    dw Common_CreateADudShot
    dw $FFD3,$0008,$002C,$0023
    dw EnemyTouch_SporeSpawn
    dw Common_CreateADudShot
    dw $FFF1,$FFE8,$000E,$0017
    dw EnemyTouch_SporeSpawn
    dw EnemyShot_SporeSpawn_Vulnerable
    dw $FFF0,$FFCA,$0010,$FFEA
    dw EnemyTouch_SporeSpawn
    dw Common_CreateADudShot

Hitbox_SporeSpawn_4:
    dw $0004
    dw $FFD5,$FFD4,$002A,$FFF3
    dw EnemyTouch_SporeSpawn
    dw Common_CreateADudShot
    dw $FFD4,$000C,$002A,$002A
    dw EnemyTouch_SporeSpawn
    dw Common_CreateADudShot
    dw $FFF1,$FFE8,$000E,$0017
    dw EnemyTouch_SporeSpawn
    dw EnemyShot_SporeSpawn_Vulnerable
    dw $FFF0,$FFC6,$0010,$FFD6
    dw EnemyTouch_SporeSpawn
    dw Common_CreateADudShot

Hitbox_SporeSpawn_5:
    dw $0004
    dw $FFD3,$FFD1,$002C,$FFEF
    dw EnemyTouch_SporeSpawn
    dw Common_CreateADudShot
    dw $FFD4,$0010,$002B,$002E
    dw EnemyTouch_SporeSpawn
    dw Common_CreateADudShot
    dw $FFF1,$FFE8,$000E,$0017
    dw EnemyTouch_SporeSpawn
    dw EnemyShot_SporeSpawn_Vulnerable
    dw $FFF0,$FFC2,$0010,$FFD3
    dw EnemyTouch_SporeSpawn
    dw Common_CreateADudShot

Hitbox_SporeSpawn_6:
    dw $0004
    dw $FFD4,$FFCE,$002D,$FFEB
    dw EnemyTouch_SporeSpawn
    dw Common_CreateADudShot
    dw $FFD5,$0014,$002B,$0032
    dw EnemyTouch_SporeSpawn
    dw Common_CreateADudShot
    dw $FFF1,$FFE8,$000E,$0017
    dw EnemyTouch_SporeSpawn
    dw EnemyShot_SporeSpawn_Vulnerable
    dw $FFF0,$FFC0,$0010,$FFD0
    dw EnemyTouch_SporeSpawn
    dw Common_CreateADudShot

Hitbox_SporeSpawn_7:
    dw $0002
    dw $FFD2,$FFDD,$002C,$0023
    dw EnemyTouch_SporeSpawn
    dw Common_CreateADudShot
    dw $FFF0,$FFD0,$0010,$FFE0
    dw EnemyTouch_SporeSpawn
    dw Common_CreateADudShot

Hitbox_SporeSpawn_8:
    dw $0004
    dw $FFD3,$FFD9,$002D,$FFF7
    dw EnemyTouch_SporeSpawn
    dw Common_CreateADudShot
    dw $FFD4,$0008,$002C,$0026
    dw EnemyTouch_SporeSpawn
    dw Common_CreateADudShot
    dw $FFF1,$FFE8,$000E,$0017
    dw EnemyTouch_SporeSpawn
    dw EnemyShot_SporeSpawn_Vulnerable
    dw $FFF0,$FFCA,$0010,$FFE0
    dw EnemyTouch_SporeSpawn
    dw Common_CreateADudShot

Hitbox_SporeSpawn_9:
    dw $0004
    dw $FFD3,$FFD4,$002D,$FFF3
    dw EnemyTouch_SporeSpawn
    dw Common_CreateADudShot
    dw $FFD6,$000C,$002A,$002B
    dw EnemyTouch_SporeSpawn
    dw Common_CreateADudShot
    dw $FFF1,$FFE8,$000E,$0017
    dw EnemyTouch_SporeSpawn
    dw EnemyShot_SporeSpawn_Vulnerable
    dw $FFF0,$FFC6,$0010,$FFE0
    dw EnemyTouch_SporeSpawn
    dw Common_CreateADudShot

Hitbox_SporeSpawn_A:
    dw $0004
    dw $FFD4,$FFD1,$0029,$FFEF
    dw EnemyTouch_SporeSpawn
    dw Common_CreateADudShot
    dw $FFD4,$0010,$002C,$002D
    dw EnemyTouch_SporeSpawn
    dw Common_CreateADudShot
    dw $FFF1,$FFE8,$000E,$0017
    dw EnemyTouch_SporeSpawn
    dw EnemyShot_SporeSpawn_Vulnerable
    dw $FFF0,$FFC3,$0010,$FFD2
    dw EnemyTouch_SporeSpawn
    dw Common_CreateADudShot

Hitbox_SporeSpawn_B:
    dw $0001
    dw $FFF1,$FFE8,$000E,$0017
    dw EnemyTouch_SporeSpawn
    dw EnemyShot_SporeSpawn_Vulnerable

Hitbox_SporeSpawn_C:
    dw $0001
    dw $FFF1,$FFE8,$000E,$0017
    dw EnemyTouch_SporeSpawn
    dw EnemyShot_SporeSpawn_Vulnerable

Hitbox_SporeSpawn_D:
    dw $0001
    dw $FFF1,$FFE8,$000E,$0017
    dw EnemyTouch_SporeSpawn
    dw Common_CreateADudShot

Hitbox_SporeSpawn_E:
    dw $0001
    dw $FFF8,$FFF8,$0007,$0007
    dw EnemyTouch_SporeSpawn
    dw Common_CreateADudShot

Hitbox_SporeSpawn_F:
    dw $0001
    dw $FFF8,$FFF8,$0007,$0006
    dw EnemyTouch_SporeSpawn
    dw Common_CreateADudShot

Hitbox_SporeSpawn_10:
    dw $0001
    dw $FFF8,$FFF8,$0007,$0006
    dw EnemyTouch_SporeSpawn
    dw Common_CreateADudShot

Hitbox_SporeSpawn_11:
    dw $0001
    dw $FFF8,$FFF8,$0007,$0006
    dw EnemyTouch_SporeSpawn
    dw EnemyShot_SporeSpawn_Vulnerable

Hitbox_SporeSpawn_12:
    dw $0001
    dw $FFFC,$FFFC,$0003,$0003
    dw EnemyTouch_SporeSpawn
    dw EnemyShot_SporeSpawn_Vulnerable

Hitbox_SporeSpawn_13:
    dw $0004
    dw $FFD4,$FFCB,$002C,$FFE9
    dw EnemyTouch_SporeSpawn
    dw Common_CreateADudShot
    dw $FFD4,$0016,$002B,$0034
    dw EnemyTouch_SporeSpawn
    dw Common_CreateADudShot
    dw $FFF1,$FFE8,$000E,$0017
    dw EnemyTouch_SporeSpawn
    dw EnemyShot_SporeSpawn_Vulnerable
    dw $FFF0,$FFBC,$0010,$FFD0
    dw EnemyTouch_SporeSpawn
    dw Common_CreateADudShot

Hitbox_SporeSpawn_14:
    dw $0004
    dw $FFD4,$FFC9,$002B,$FFE7
    dw EnemyTouch_SporeSpawn
    dw Common_CreateADudShot
    dw $FFD3,$0018,$002B,$0037
    dw EnemyTouch_SporeSpawn
    dw Common_CreateADudShot
    dw $FFF1,$FFE7,$000E,$0018
    dw EnemyTouch_SporeSpawn
    dw EnemyShot_SporeSpawn_Vulnerable
    dw $FFF0,$FFBB,$0010,$FFD0
    dw EnemyTouch_SporeSpawn
    dw Common_CreateADudShot


;;; $F20D: Spore Spawn spritemaps ;;;
Spritemap_SporeSpawn_0:
    dw $001A
    %spritemapEntry(1, $00, $F0, 0, 1, 2, 0, $124)
    %spritemapEntry(1, $10, $F0, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $20, $F0, 0, 1, 2, 0, $120)
    %spritemapEntry(1, $00, $E0, 0, 1, 2, 0, $104)
    %spritemapEntry(1, $10, $E0, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $20, $E0, 0, 1, 2, 0, $100)
    %spritemapEntry(1, $1F0, $F0, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $1E0, $F0, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $1D0, $F0, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $1F0, $E0, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $1E0, $E0, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1D0, $E0, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $00, $D2, 0, 1, 2, 0, $142)
    %spritemapEntry(1, $1F0, $D2, 0, 0, 2, 0, $142)
    %spritemapEntry(1, $00, $10, 0, 1, 2, 0, $14E)
    %spritemapEntry(1, $10, $10, 0, 1, 2, 0, $14C)
    %spritemapEntry(1, $20, $10, 0, 1, 2, 0, $14A)
    %spritemapEntry(1, $00, $00, 0, 1, 2, 0, $148)
    %spritemapEntry(1, $10, $00, 0, 1, 2, 0, $146)
    %spritemapEntry(1, $20, $00, 0, 1, 2, 0, $144)
    %spritemapEntry(1, $1F0, $10, 0, 0, 2, 0, $14E)
    %spritemapEntry(1, $1E0, $10, 0, 0, 2, 0, $14C)
    %spritemapEntry(1, $1D0, $10, 0, 0, 2, 0, $14A)
    %spritemapEntry(1, $1F0, $00, 0, 0, 2, 0, $148)
    %spritemapEntry(1, $1E0, $00, 0, 0, 2, 0, $146)
    %spritemapEntry(1, $1D0, $00, 0, 0, 2, 0, $144)

Spritemap_SporeSpawn_1:
    dw $001E
    %spritemapEntry(1, $00, $EC, 0, 1, 2, 0, $124)
    %spritemapEntry(1, $10, $EC, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $20, $EC, 0, 1, 2, 0, $120)
    %spritemapEntry(1, $00, $DC, 0, 1, 2, 0, $104)
    %spritemapEntry(1, $10, $DC, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $20, $DC, 0, 1, 2, 0, $100)
    %spritemapEntry(1, $1F0, $EC, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $1E0, $EC, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $1D0, $EC, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $1F0, $DC, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $1E0, $DC, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1D0, $DC, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $00, $CE, 0, 1, 2, 0, $142)
    %spritemapEntry(1, $1F0, $CE, 0, 0, 2, 0, $142)
    %spritemapEntry(1, $00, $14, 0, 1, 2, 0, $14E)
    %spritemapEntry(1, $10, $14, 0, 1, 2, 0, $14C)
    %spritemapEntry(1, $20, $14, 0, 1, 2, 0, $14A)
    %spritemapEntry(1, $00, $04, 0, 1, 2, 0, $148)
    %spritemapEntry(1, $10, $04, 0, 1, 2, 0, $146)
    %spritemapEntry(1, $20, $04, 0, 1, 2, 0, $144)
    %spritemapEntry(1, $1F0, $14, 0, 0, 2, 0, $14E)
    %spritemapEntry(1, $1E0, $14, 0, 0, 2, 0, $14C)
    %spritemapEntry(1, $1D0, $14, 0, 0, 2, 0, $14A)
    %spritemapEntry(1, $1F0, $04, 0, 0, 2, 0, $148)
    %spritemapEntry(1, $1E0, $04, 0, 0, 2, 0, $146)
    %spritemapEntry(1, $1D0, $04, 0, 0, 2, 0, $144)
    %spritemapEntry(0, $10, $FC, 0, 1, 2, 0, $13F)
    %spritemapEntry(0, $24, $FC, 0, 1, 2, 0, $13F)
    %spritemapEntry(0, $1D4, $FC, 0, 0, 2, 0, $13F)
    %spritemapEntry(0, $1E8, $FC, 0, 0, 2, 0, $13F)

Spritemap_SporeSpawn_2:
    dw $0022
    %spritemapEntry(1, $00, $E8, 0, 1, 2, 0, $124)
    %spritemapEntry(1, $10, $E8, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $20, $E8, 0, 1, 2, 0, $120)
    %spritemapEntry(1, $00, $D8, 0, 1, 2, 0, $104)
    %spritemapEntry(1, $10, $D8, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $20, $D8, 0, 1, 2, 0, $100)
    %spritemapEntry(1, $1F0, $E8, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $1E0, $E8, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $1D0, $E8, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $1F0, $D8, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $1E0, $D8, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1D0, $D8, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $00, $CA, 0, 1, 2, 0, $142)
    %spritemapEntry(1, $1F0, $CA, 0, 0, 2, 0, $142)
    %spritemapEntry(0, $24, $00, 0, 1, 2, 0, $161)
    %spritemapEntry(0, $0E, $00, 0, 1, 2, 0, $161)
    %spritemapEntry(0, $1EA, $00, 0, 0, 2, 0, $161)
    %spritemapEntry(0, $1D5, $00, 0, 0, 2, 0, $161)
    %spritemapEntry(0, $24, $F8, 0, 1, 2, 0, $160)
    %spritemapEntry(0, $0E, $F8, 0, 1, 2, 0, $160)
    %spritemapEntry(0, $1EA, $F8, 0, 0, 2, 0, $160)
    %spritemapEntry(0, $1D5, $F8, 0, 0, 2, 0, $160)
    %spritemapEntry(1, $00, $18, 0, 1, 2, 0, $14E)
    %spritemapEntry(1, $10, $18, 0, 1, 2, 0, $14C)
    %spritemapEntry(1, $20, $18, 0, 1, 2, 0, $14A)
    %spritemapEntry(1, $00, $08, 0, 1, 2, 0, $148)
    %spritemapEntry(1, $10, $08, 0, 1, 2, 0, $146)
    %spritemapEntry(1, $20, $08, 0, 1, 2, 0, $144)
    %spritemapEntry(1, $1F0, $18, 0, 0, 2, 0, $14E)
    %spritemapEntry(1, $1E0, $18, 0, 0, 2, 0, $14C)
    %spritemapEntry(1, $1D0, $18, 0, 0, 2, 0, $14A)
    %spritemapEntry(1, $1F0, $08, 0, 0, 2, 0, $148)
    %spritemapEntry(1, $1E0, $08, 0, 0, 2, 0, $146)
    %spritemapEntry(1, $1D0, $08, 0, 0, 2, 0, $144)

Spritemap_SporeSpawn_3:
    dw $0022
    %spritemapEntry(1, $00, $E4, 0, 1, 2, 0, $124)
    %spritemapEntry(1, $10, $E4, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $20, $E4, 0, 1, 2, 0, $120)
    %spritemapEntry(1, $00, $D4, 0, 1, 2, 0, $104)
    %spritemapEntry(1, $10, $D4, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $20, $D4, 0, 1, 2, 0, $100)
    %spritemapEntry(1, $1F0, $E4, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $1E0, $E4, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $1D0, $E4, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $1F0, $D4, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $1E0, $D4, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1D0, $D4, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $00, $C6, 0, 1, 2, 0, $142)
    %spritemapEntry(1, $1F0, $C6, 0, 0, 2, 0, $142)
    %spritemapEntry(0, $20, $04, 0, 1, 2, 0, $163)
    %spritemapEntry(0, $0C, $04, 0, 1, 2, 0, $163)
    %spritemapEntry(0, $1EC, $04, 0, 0, 2, 0, $163)
    %spritemapEntry(0, $1D8, $04, 0, 0, 2, 0, $163)
    %spritemapEntry(0, $20, $F4, 0, 1, 2, 0, $162)
    %spritemapEntry(0, $0C, $F4, 0, 1, 2, 0, $162)
    %spritemapEntry(0, $1EC, $F4, 0, 0, 2, 0, $162)
    %spritemapEntry(0, $1D8, $F4, 0, 0, 2, 0, $162)
    %spritemapEntry(1, $00, $1C, 0, 1, 2, 0, $14E)
    %spritemapEntry(1, $10, $1C, 0, 1, 2, 0, $14C)
    %spritemapEntry(1, $20, $1C, 0, 1, 2, 0, $14A)
    %spritemapEntry(1, $00, $0C, 0, 1, 2, 0, $148)
    %spritemapEntry(1, $10, $0C, 0, 1, 2, 0, $146)
    %spritemapEntry(1, $20, $0C, 0, 1, 2, 0, $144)
    %spritemapEntry(1, $1F0, $1C, 0, 0, 2, 0, $14E)
    %spritemapEntry(1, $1E0, $1C, 0, 0, 2, 0, $14C)
    %spritemapEntry(1, $1D0, $1C, 0, 0, 2, 0, $14A)
    %spritemapEntry(1, $1F0, $0C, 0, 0, 2, 0, $148)
    %spritemapEntry(1, $1E0, $0C, 0, 0, 2, 0, $146)
    %spritemapEntry(1, $1D0, $0C, 0, 0, 2, 0, $144)

Spritemap_SporeSpawn_4:
    dw $0022
    %spritemapEntry(1, $00, $D0, 0, 1, 2, 0, $104)
    %spritemapEntry(1, $10, $D0, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $20, $D0, 0, 1, 2, 0, $100)
    %spritemapEntry(1, $1F0, $D0, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $1E0, $D0, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1D0, $D0, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $00, $E0, 0, 1, 2, 0, $124)
    %spritemapEntry(1, $10, $E0, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $20, $E0, 0, 1, 2, 0, $120)
    %spritemapEntry(1, $1F0, $E0, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $1E0, $E0, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $1D0, $E0, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $00, $C2, 0, 1, 2, 0, $142)
    %spritemapEntry(1, $1F0, $C2, 0, 0, 2, 0, $142)
    %spritemapEntry(0, $1F, $08, 0, 1, 2, 0, $165)
    %spritemapEntry(0, $0B, $08, 0, 1, 2, 0, $165)
    %spritemapEntry(0, $1ED, $08, 0, 0, 2, 0, $165)
    %spritemapEntry(0, $1D9, $08, 0, 0, 2, 0, $165)
    %spritemapEntry(0, $1F, $F0, 0, 1, 2, 0, $164)
    %spritemapEntry(0, $0B, $F0, 0, 1, 2, 0, $164)
    %spritemapEntry(0, $1ED, $F0, 0, 0, 2, 0, $164)
    %spritemapEntry(0, $1D9, $F0, 0, 0, 2, 0, $164)
    %spritemapEntry(1, $00, $20, 0, 1, 2, 0, $14E)
    %spritemapEntry(1, $10, $20, 0, 1, 2, 0, $14C)
    %spritemapEntry(1, $20, $20, 0, 1, 2, 0, $14A)
    %spritemapEntry(1, $00, $10, 0, 1, 2, 0, $148)
    %spritemapEntry(1, $10, $10, 0, 1, 2, 0, $146)
    %spritemapEntry(1, $20, $10, 0, 1, 2, 0, $144)
    %spritemapEntry(1, $1F0, $20, 0, 0, 2, 0, $14E)
    %spritemapEntry(1, $1E0, $20, 0, 0, 2, 0, $14C)
    %spritemapEntry(1, $1D0, $20, 0, 0, 2, 0, $14A)
    %spritemapEntry(1, $1F0, $10, 0, 0, 2, 0, $148)
    %spritemapEntry(1, $1E0, $10, 0, 0, 2, 0, $146)
    %spritemapEntry(1, $1D0, $10, 0, 0, 2, 0, $144)

Spritemap_SporeSpawn_5:
    dw $001A
    %spritemapEntry(1, $00, $CC, 0, 1, 2, 0, $104)
    %spritemapEntry(1, $10, $CC, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $20, $CC, 0, 1, 2, 0, $100)
    %spritemapEntry(1, $1F0, $CC, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $1E0, $CC, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1D0, $CC, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $00, $BE, 0, 1, 2, 0, $142)
    %spritemapEntry(1, $1F0, $BE, 0, 0, 2, 0, $142)
    %spritemapEntry(1, $00, $24, 0, 1, 2, 0, $14E)
    %spritemapEntry(1, $10, $24, 0, 1, 2, 0, $14C)
    %spritemapEntry(1, $20, $24, 0, 1, 2, 0, $14A)
    %spritemapEntry(1, $00, $14, 0, 1, 2, 0, $148)
    %spritemapEntry(1, $10, $14, 0, 1, 2, 0, $146)
    %spritemapEntry(1, $20, $14, 0, 1, 2, 0, $144)
    %spritemapEntry(1, $1F0, $24, 0, 0, 2, 0, $14E)
    %spritemapEntry(1, $1E0, $24, 0, 0, 2, 0, $14C)
    %spritemapEntry(1, $1D0, $24, 0, 0, 2, 0, $14A)
    %spritemapEntry(1, $1F0, $14, 0, 0, 2, 0, $148)
    %spritemapEntry(1, $1E0, $14, 0, 0, 2, 0, $146)
    %spritemapEntry(1, $1D0, $14, 0, 0, 2, 0, $144)
    %spritemapEntry(1, $00, $DC, 0, 1, 2, 0, $124)
    %spritemapEntry(1, $10, $DC, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $20, $DC, 0, 1, 2, 0, $120)
    %spritemapEntry(1, $1F0, $DC, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $1E0, $DC, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $1D0, $DC, 0, 0, 2, 0, $120)

Spritemap_SporeSpawn_6:
    dw $001A
    %spritemapEntry(1, $00, $DC, 0, 1, 2, 0, $104)
    %spritemapEntry(1, $10, $DC, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $20, $DC, 0, 1, 2, 0, $100)
    %spritemapEntry(1, $1F0, $DC, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $1E0, $DC, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1D0, $DC, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $00, $CE, 0, 1, 2, 0, $142)
    %spritemapEntry(1, $1F0, $CE, 0, 0, 2, 0, $142)
    %spritemapEntry(1, $00, $14, 0, 1, 2, 0, $14E)
    %spritemapEntry(1, $10, $14, 0, 1, 2, 0, $14C)
    %spritemapEntry(1, $20, $14, 0, 1, 2, 0, $14A)
    %spritemapEntry(1, $00, $04, 0, 1, 2, 0, $148)
    %spritemapEntry(1, $10, $04, 0, 1, 2, 0, $146)
    %spritemapEntry(1, $20, $04, 0, 1, 2, 0, $144)
    %spritemapEntry(1, $1F0, $14, 0, 0, 2, 0, $14E)
    %spritemapEntry(1, $1E0, $14, 0, 0, 2, 0, $14C)
    %spritemapEntry(1, $1D0, $14, 0, 0, 2, 0, $14A)
    %spritemapEntry(1, $1F0, $04, 0, 0, 2, 0, $148)
    %spritemapEntry(1, $1E0, $04, 0, 0, 2, 0, $146)
    %spritemapEntry(1, $1D0, $04, 0, 0, 2, 0, $144)
    %spritemapEntry(1, $00, $EC, 0, 1, 2, 0, $124)
    %spritemapEntry(1, $10, $EC, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $20, $EC, 0, 1, 2, 0, $120)
    %spritemapEntry(1, $1F0, $EC, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $1E0, $EC, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $1D0, $EC, 0, 0, 2, 0, $120)

Spritemap_SporeSpawn_7:
    dw $001A
    %spritemapEntry(1, $00, $D8, 0, 1, 2, 0, $104)
    %spritemapEntry(1, $10, $D8, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $20, $D8, 0, 1, 2, 0, $100)
    %spritemapEntry(1, $1F0, $D8, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $1E0, $D8, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1D0, $D8, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $00, $CA, 0, 1, 2, 0, $142)
    %spritemapEntry(1, $1F0, $CA, 0, 0, 2, 0, $142)
    %spritemapEntry(1, $00, $18, 0, 1, 2, 0, $14E)
    %spritemapEntry(1, $10, $18, 0, 1, 2, 0, $14C)
    %spritemapEntry(1, $20, $18, 0, 1, 2, 0, $14A)
    %spritemapEntry(1, $00, $08, 0, 1, 2, 0, $148)
    %spritemapEntry(1, $10, $08, 0, 1, 2, 0, $146)
    %spritemapEntry(1, $20, $08, 0, 1, 2, 0, $144)
    %spritemapEntry(1, $1F0, $18, 0, 0, 2, 0, $14E)
    %spritemapEntry(1, $1E0, $18, 0, 0, 2, 0, $14C)
    %spritemapEntry(1, $1D0, $18, 0, 0, 2, 0, $14A)
    %spritemapEntry(1, $1F0, $08, 0, 0, 2, 0, $148)
    %spritemapEntry(1, $1E0, $08, 0, 0, 2, 0, $146)
    %spritemapEntry(1, $1D0, $08, 0, 0, 2, 0, $144)
    %spritemapEntry(1, $00, $E8, 0, 1, 2, 0, $124)
    %spritemapEntry(1, $10, $E8, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $20, $E8, 0, 1, 2, 0, $120)
    %spritemapEntry(1, $1F0, $E8, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $1E0, $E8, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $1D0, $E8, 0, 0, 2, 0, $120)

Spritemap_SporeSpawn_8:
    dw $001A
    %spritemapEntry(1, $00, $E4, 0, 1, 2, 0, $124)
    %spritemapEntry(1, $10, $E4, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $20, $E4, 0, 1, 2, 0, $120)
    %spritemapEntry(1, $00, $D4, 0, 1, 2, 0, $104)
    %spritemapEntry(1, $10, $D4, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $20, $D4, 0, 1, 2, 0, $100)
    %spritemapEntry(1, $1F0, $E4, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $1E0, $E4, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $1D0, $E4, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $1F0, $D4, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $1E0, $D4, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1D0, $D4, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $00, $C6, 0, 1, 2, 0, $142)
    %spritemapEntry(1, $1F0, $C6, 0, 0, 2, 0, $142)
    %spritemapEntry(1, $00, $1C, 0, 1, 2, 0, $14E)
    %spritemapEntry(1, $10, $1C, 0, 1, 2, 0, $14C)
    %spritemapEntry(1, $20, $1C, 0, 1, 2, 0, $14A)
    %spritemapEntry(1, $00, $0C, 0, 1, 2, 0, $148)
    %spritemapEntry(1, $10, $0C, 0, 1, 2, 0, $146)
    %spritemapEntry(1, $20, $0C, 0, 1, 2, 0, $144)
    %spritemapEntry(1, $1F0, $1C, 0, 0, 2, 0, $14E)
    %spritemapEntry(1, $1E0, $1C, 0, 0, 2, 0, $14C)
    %spritemapEntry(1, $1D0, $1C, 0, 0, 2, 0, $14A)
    %spritemapEntry(1, $1F0, $0C, 0, 0, 2, 0, $148)
    %spritemapEntry(1, $1E0, $0C, 0, 0, 2, 0, $146)
    %spritemapEntry(1, $1D0, $0C, 0, 0, 2, 0, $144)

Spritemap_SporeSpawn_A:
    dw $001A
    %spritemapEntry(1, $00, $E0, 0, 1, 2, 0, $124)
    %spritemapEntry(1, $10, $E0, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $20, $E0, 0, 1, 2, 0, $120)
    %spritemapEntry(1, $00, $D0, 0, 1, 2, 0, $104)
    %spritemapEntry(1, $10, $D0, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $20, $D0, 0, 1, 2, 0, $100)
    %spritemapEntry(1, $1F0, $E0, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $1E0, $E0, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $1D0, $E0, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $1F0, $D0, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $1E0, $D0, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1D0, $D0, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $00, $C2, 0, 1, 2, 0, $142)
    %spritemapEntry(1, $1F0, $C2, 0, 0, 2, 0, $142)
    %spritemapEntry(1, $00, $20, 0, 1, 2, 0, $14E)
    %spritemapEntry(1, $10, $20, 0, 1, 2, 0, $14C)
    %spritemapEntry(1, $20, $20, 0, 1, 2, 0, $14A)
    %spritemapEntry(1, $00, $10, 0, 1, 2, 0, $148)
    %spritemapEntry(1, $10, $10, 0, 1, 2, 0, $146)
    %spritemapEntry(1, $20, $10, 0, 1, 2, 0, $144)
    %spritemapEntry(1, $1F0, $20, 0, 0, 2, 0, $14E)
    %spritemapEntry(1, $1E0, $20, 0, 0, 2, 0, $14C)
    %spritemapEntry(1, $1D0, $20, 0, 0, 2, 0, $14A)
    %spritemapEntry(1, $1F0, $10, 0, 0, 2, 0, $148)
    %spritemapEntry(1, $1E0, $10, 0, 0, 2, 0, $146)
    %spritemapEntry(1, $1D0, $10, 0, 0, 2, 0, $144)

Spritemap_SporeSpawn_B:
    dw $0006
    %spritemapEntry(1, $00, $F8, 0, 1, 2, 0, $106)
    %spritemapEntry(1, $1F0, $F8, 0, 0, 2, 0, $106)
    %spritemapEntry(1, $00, $E8, 1, 1, 2, 0, $126)
    %spritemapEntry(1, $00, $08, 0, 1, 2, 0, $126)
    %spritemapEntry(1, $1F0, $E8, 1, 0, 2, 0, $126)
    %spritemapEntry(1, $1F0, $08, 0, 0, 2, 0, $126)

Spritemap_SporeSpawn_C:
    dw $0006
    %spritemapEntry(1, $00, $F8, 0, 1, 2, 0, $108)
    %spritemapEntry(1, $1F0, $F8, 0, 0, 2, 0, $108)
    %spritemapEntry(1, $00, $E8, 1, 1, 2, 0, $128)
    %spritemapEntry(1, $1F0, $E8, 1, 0, 2, 0, $128)
    %spritemapEntry(1, $00, $08, 0, 1, 2, 0, $128)
    %spritemapEntry(1, $1F0, $08, 0, 0, 2, 0, $128)

Spritemap_SporeSpawn_D:
    dw $0006
    %spritemapEntry(1, $00, $F8, 0, 1, 2, 0, $10A)
    %spritemapEntry(1, $1F0, $F8, 0, 0, 2, 0, $10A)
    %spritemapEntry(1, $00, $E8, 1, 1, 2, 0, $12A)
    %spritemapEntry(1, $1F0, $E8, 1, 0, 2, 0, $12A)
    %spritemapEntry(1, $00, $08, 0, 1, 2, 0, $12A)
    %spritemapEntry(1, $1F0, $08, 0, 0, 2, 0, $12A)

Spritemap_SporeSpawn_E:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $140)

Spritemap_SporeSpawn_F:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $10C)

Spritemap_SporeSpawn_10:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $10E)

Spritemap_SporeSpawn_11:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $12C)

Spritemap_SporeSpawn_12:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 0, $13E)

Spritemap_SporeSpawn_13:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 0, $12F)

Spritemap_SporeSpawn_14:
    dw $0001
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 0, $12E)

Spritemap_SporeSpawn_15:
    dw $001A
    %spritemapEntry(1, $00, $DA, 0, 1, 2, 0, $124)
    %spritemapEntry(1, $10, $DA, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $20, $DA, 0, 1, 2, 0, $120)
    %spritemapEntry(1, $00, $CA, 0, 1, 2, 0, $104)
    %spritemapEntry(1, $10, $CA, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $20, $CA, 0, 1, 2, 0, $100)
    %spritemapEntry(1, $1F0, $DA, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $1E0, $DA, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $1D0, $DA, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $1F0, $CA, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $1E0, $CA, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1D0, $CA, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $00, $BC, 0, 1, 2, 0, $142)
    %spritemapEntry(1, $1F0, $BC, 0, 0, 2, 0, $142)
    %spritemapEntry(1, $00, $26, 0, 1, 2, 0, $14E)
    %spritemapEntry(1, $10, $26, 0, 1, 2, 0, $14C)
    %spritemapEntry(1, $20, $26, 0, 1, 2, 0, $14A)
    %spritemapEntry(1, $00, $16, 0, 1, 2, 0, $148)
    %spritemapEntry(1, $10, $16, 0, 1, 2, 0, $146)
    %spritemapEntry(1, $20, $16, 0, 1, 2, 0, $144)
    %spritemapEntry(1, $1F0, $26, 0, 0, 2, 0, $14E)
    %spritemapEntry(1, $1E0, $26, 0, 0, 2, 0, $14C)
    %spritemapEntry(1, $1D0, $26, 0, 0, 2, 0, $14A)
    %spritemapEntry(1, $1F0, $16, 0, 0, 2, 0, $148)
    %spritemapEntry(1, $1E0, $16, 0, 0, 2, 0, $146)
    %spritemapEntry(1, $1D0, $16, 0, 0, 2, 0, $144)

Spritemap_SporeSpawn_16:
    dw $001A
    %spritemapEntry(1, $00, $C8, 0, 1, 2, 0, $104)
    %spritemapEntry(1, $10, $C8, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $1F0, $C8, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $1E0, $C8, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1D0, $C8, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $00, $BA, 0, 1, 2, 0, $142)
    %spritemapEntry(1, $1F0, $BA, 0, 0, 2, 0, $142)
    %spritemapEntry(1, $00, $28, 0, 1, 2, 0, $14E)
    %spritemapEntry(1, $10, $28, 0, 1, 2, 0, $14C)
    %spritemapEntry(1, $20, $28, 0, 1, 2, 0, $14A)
    %spritemapEntry(1, $00, $18, 0, 1, 2, 0, $148)
    %spritemapEntry(1, $10, $18, 0, 1, 2, 0, $146)
    %spritemapEntry(1, $20, $18, 0, 1, 2, 0, $144)
    %spritemapEntry(1, $1F0, $28, 0, 0, 2, 0, $14E)
    %spritemapEntry(1, $1E0, $28, 0, 0, 2, 0, $14C)
    %spritemapEntry(1, $1D0, $28, 0, 0, 2, 0, $14A)
    %spritemapEntry(1, $1F0, $18, 0, 0, 2, 0, $148)
    %spritemapEntry(1, $1E0, $18, 0, 0, 2, 0, $146)
    %spritemapEntry(1, $1D0, $18, 0, 0, 2, 0, $144)
    %spritemapEntry(1, $00, $D8, 0, 1, 2, 0, $124)
    %spritemapEntry(1, $10, $D8, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $20, $D8, 0, 1, 2, 0, $120)
    %spritemapEntry(1, $20, $C8, 0, 1, 2, 0, $100)
    %spritemapEntry(1, $1F0, $D8, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $1E0, $D8, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $1D0, $D8, 0, 0, 2, 0, $120)


Freespace_BankA5_F95A:
; $6A6 bytes
