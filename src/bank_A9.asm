
org $A98000


; Common to all enemy code banks

;;; $8000: Grapple AI - no interaction. Also unfreezes enemies(!) ;;;
CommonA9_GrappleAI_NoInteraction:
; Used by skultera, Draygon body, fire arc, Phantoon, etecoon, dachora and WS ghost
    JSL GrappleAI_SwitchEnemyAIToMainAI
    RTL


;;; $8005: Grapple AI - Samus latches on ;;;
CommonA9_GrappleAI_SamusLatchesOn:
; Used by gripper and Crocomire
    JSL GrappleAI_SamusLatchesOnWithGrapple
    RTL


;;; $800A: Grapple AI - kill enemy ;;;
CommonA9_GrappleAI_KillEnemy:
; Common
    JSL GrappleAI_EnemyGrappleDeath
    RTL


;;; $800F: Grapple AI - cancel grapple beam ;;;
CommonA9_GrappleAI_CancelGrappleBeam:
; Common
    JSL GrappleAI_SwitchToFrozenAI
    RTL


;;; $8014: Grapple AI - Samus latches on - no invincibility ;;;
CommonA9_GrappleAI_SamusLatchesOn_NoInvincibility:
; Used by powamp
    JSL GrappleAI_SamusLatchesOnWithGrapple_NoInvincibility
    RTL


;;; $8019: Unused. Grapple AI - Samus latches on - paralyse enemy ;;;
UNUSED_CommonA9_GrappleAI_SamusLatchesOn_ParalyzeEnemy_A98019:
    JSL GrappleAI_SamusLatchesOnWithGrapple_ParalyzeEnemy
    RTL


;;; $801E: Grapple AI - hurt Samus ;;;
CommonA9_GrappleAI_HurtSamus:
; Used by WS spark
; Hurt reaction happens in $9B:B932
    JSL GrappleAI_SwitchToFrozenAI_duplicate
    RTL


;;; $8023: Normal enemy touch AI ;;;
CommonA9_NormalEnemyTouchAI:
    JSL NormalEnemyTouchAI
    RTL


;;; $8028: Normal touch AI - no death check ;;;
CommonA9_NormalTouchAI_NoDeathCheck:
    JSL NormalEnemyTouchAI_NoDeathCheck_External
    RTL


;;; $802D: Normal enemy shot AI ;;;
CommonA9_NormalEnemyShotAI:
    JSL NormalEnemyShotAI
    RTL


;;; $8032: Normal enemy shot AI - no death check, no enemy shot graphic ;;;
CommonA9_NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic:
    JSL NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External
    RTL


;;; $8037: Normal enemy power bomb AI ;;;
CommonA9_NormalEnemyPowerBombAI:
    JSL NormalEnemyPowerBombAI
    RTL


;;; $803C: Normal enemy power bomb AI - no death check ;;;
CommonA9_NormalEnemyPowerBombAI_NoDeathCheck:
; Kraid's power bomb AI
    JSL NormalEnemyPowerBombAI_NoDeathCheck_External
    RTL


;;; $8041: Normal enemy frozen AI ;;;
CommonA9_NormalEnemyFrozenAI:
    JSL NormalEnemyFrozenAI
    RTL


;;; $8046: Creates a dud shot ;;;
CommonA9_CreateADudShot:
    JSL CreateADudShot
    RTL


;;; $804B: RTS ;;;
RTS_A9804B:
    RTS


;;; $804C: RTL ;;;
RTL_A9804C:
    RTL


;;; $804D: Spritemap - nothing ;;;
Spritemap_CommonA9_Nothing:
    dw $0000


;;; $804F: Extended spritemap - nothing ;;;
ExtendedSpritemap_CommonA9_Nothing:
    dw $0001
    dw $0000,$0000
    dw Spritemap_CommonA9_Nothing
    dw Hitbox_CommonA9_Nothing


;;; $8059: Hitbox - nothing ;;;
Hitbox_CommonA9_Nothing:
; [n entries] [[left offset] [top offset] [right offset] [bottom offset] [p touch] [p shot]]...
    dw $0001
    dw $0000,$0000,$0000,$0000
    dw CommonA9_NormalEnemyTouchAI
    dw CommonA9_NormalEnemyShotAI


;;; $8067: Instruction list - delete enemy ;;;
InstList_CommonA9_DeleteEnemy:
    dw Instruction_CommonA9_DeleteEnemy


;;; $8069: Two NOPs ;;;
NOPNOP_A98069:
; Used as palette by respawning enemy placeholder and Draygon's eye o_O
    NOP #2


;;; $806B: Instruction - Enemy.var5 = [[Y]] ;;;
Instruction_CommonA9_Enemy0FB2_InY:
; Used only by torizos (for enemy movement function) and escape etecoon (for enemy function)
    LDA.W $0000,Y : STA.W Enemy.var5,X
    INY #2
    RTL


;;; $8074: Instruction - Enemy.var5 = RTS ;;;
Instruction_CommonA9_SetEnemy0FB2ToRTS:
    LDA.W #RTS_A9807B : STA.W Enemy.var5,X
    RTL


RTS_A9807B:
    RTS


;;; $807C: Instruction - delete enemy ;;;
Instruction_CommonA9_DeleteEnemy:
    LDA.W Enemy.properties,X : ORA.W #$0200 : STA.W Enemy.properties,X
    PLA
    PEA.W ProcessEnemyInstructions_return-1
    RTL


;;; $808A: Instruction - call function [[Y]] ;;;
Instruction_CommonA9_CallFunctionInY:
    LDA.W $0000,Y : STA.B DP_Temp12
    PHY : PHX
    PEA .manualReturn-1
    JMP.W (DP_Temp12)

  .manualReturn:
    PLX : PLY
    INY #2
    RTL


;;; $809C: Instruction - call function [[Y]] with A = [[Y] + 2] ;;;
Instruction_CommonA9_CallFunctionInY_WithA:
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
UNUSED_Instruction_CommonA9_CallExternalFunctionInY_A980B5:
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
UNUSED_Inst_CommonA9_CallExternalFunctionInY_WithA_A980CE:
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
Instruction_CommonA9_GotoY:
    LDA.W $0000,Y : TAY
    RTL


;;; $80F2: Instruction - go to [[Y]] + ±[[Y]] ;;;
Instruction_CommonA9_GotoY_PlusY:
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
Instruction_CommonA9_DecrementTimer_GotoYIfNonZero:
    DEC.W Enemy.loopCounter,X : BNE Instruction_CommonA9_GotoY
    INY #2
    RTL


;;; $8110: Instruction - decrement timer and go to [[Y]] if non-zero ;;;
Instruction_CommonA9_DecrementTimer_GotoYIfNonZero_duplicate:
    DEC.W Enemy.loopCounter,X : BNE Instruction_CommonA9_GotoY
    INY #2
    RTL


;;; $8118: Instruction - decrement timer and go to [Y] + ±[[Y]] if non-zero ;;;
Instruction_CommonA9_DecrementTimer_GotoY_PlusY_IfNonZero:
    SEP #$20
    DEC.W Enemy.loopCounter,X
    REP #$20
    BNE Instruction_CommonA9_GotoY_PlusY
    INY
    RTL


;;; $8123: Instruction - timer = [[Y]] ;;;
Instruction_CommonA9_TimerInY:
    LDA.W $0000,Y : STA.W Enemy.loopCounter,X
    INY #2
    RTL


;;; $812C: Instruction - skip next instruction ;;;
Instruction_CommonA9_SkipNextInstruction:
    INY #2
    RTL


;;; $812F: Instruction - sleep ;;;
Instruction_CommonA9_Sleep:
    DEY #2
    TYA : STA.W Enemy.instList,X
    PLA
    PEA.W ProcessEnemyInstructions_return-1
    RTL


;;; $813A: Instruction - wait [[Y]] frames ;;;
Instruction_CommonA9_WaitYFrames:
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
Instruction_CommonA9_TransferYBytesInYToVRAM:
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
Instruction_CommonA9_EnableOffScreenProcessing:
    LDA.W Enemy.properties,X : ORA.W #$0800 : STA.W Enemy.properties,X
    RTL


;;; $817D: Instruction - disable off-screen processing ;;;
Instruction_CommonA9_DisableOffScreenProcessing:
    LDA.W Enemy.properties,X : AND.W #$F7FF : STA.W Enemy.properties,X
    RTL


;;; $8187: Common enemy speeds - linearly increasing ;;;
CommonA9EnemySpeeds_LinearlyIncreasing:
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
CommonA9EnemySpeeds_QuadraticallyIncreasing:
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


;;; $8687: Initialisation AI - enemy $EC7F (Mother Brain body) ;;;
InitAI_MotherBrainBody:
    PHB
    PEA $7E7E : PLB : PLB
    LDA.W #$0338
    LDX.W #$0FFE

  .loopTilemap:
    STA.W EnemyBG2Tilemap,X
    DEX #2 : BPL .loopTilemap
    PLB
    LDA.W #InstList_MotherBrainHead_InitialDummy
    JSR SetMotherBrainBodyInstList
    STZ.W Enemy.GFXOffset
    LDA.W Enemy.properties : ORA.W #$1500 : STA.W Enemy.properties
    LDA.W #$0000 : STA.W Enemy.palette
    LDY.W #Palette_MotherBrain_GlassShards+2
    LDX.W #$0162
    LDA.W #$000F
    JSL WriteAColorsFromYToTargetColorIndexX
    LDY.W #Palette_MotherBrain_TubeProjectiles+2
    LDX.W #$01E2
    LDA.W #$000F
    JSL WriteAColorsFromYToTargetColorIndexX
    LDA.W #$0000 : STA.L MotherBrainBody.form : STA.L MotherBrainBody.enableUnpauseHookFlag
    LDA.W #$0002 : STA.L MotherBrainBody.hitboxesEnabled
    LDA.W #Function_MotherBrain_SetupBrainToBeDrawn : STA.W MotherBrainBody.brainFunction
    LDA.W #Function_MotherBrain_FirstPhase : STA.W MotherBrainBody.function
    LDA.W #$0001
    JSL Load_FX_Entry
    LDA.W #$0000

  .loopProjectiles:
    PHA
    LDY.W #EnemyProjectile_MotherBrainTurret
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    PLA : INC : CMP.W #$000C : BCC .loopProjectiles
    RTL


;;; $8705: Initialisation AI - enemy $EC3F (Mother Brain brain) ;;;
InitAI_MotherBrainHead:
    LDX.W #$0040
    LDY.W #CorpseRottingDefinitions_MotherBrain
    JSR InitializeEnemyCorpseRotting
    LDA.W #$0BB8 : STA.W Enemy[1].health
    LDA.W #InstList_MotherBrainHead_InitialDummy
    JSR SetMotherBrainHeadUnusedInstList
    STZ.W Enemy[1].GFXOffset
    LDA.W Enemy[1].properties : ORA.W #$1100 : STA.W Enemy[1].properties
    LDA.W #$0200 : STA.W Enemy[1].palette
    STA.L MotherBrainBody.neckPalleteIndex : STA.L MotherBrainBody.brainPalleteIndex
    LDA.W #InstList_MotherBrainHead_Initial
    JSR SetMotherBrainHeadInstList
    JSR SetupMotherBrainHeadNormalPalette
    RTL


;;; $873E: Main AI / hurt AI - enemy $EC7F (Mother Brain body) ;;;
MainAI_HurtAI_MotherBrainBody:
    JSR MotherBrainPalette_HandleRoomPalette
    PEA .manualReturn-1
    JMP.W (MotherBrainBody.function)

  .manualReturn:
    JSR HandleMotherBrainsPalette
    JSR MotherBrain_vs_Samus_CollisionDetection
    JSR ProcessMotherBrainInvincibilityPalette
    LDA.L MotherBrainBody.enableUnpauseHookFlag : BEQ .return
    LDA.W #UnpauseHook_MotherBrainBody>>8&$FF00 : STA.W PauseHook_Unpause+1
    LDA.W #UnpauseHook_MotherBrainBody : STA.W PauseHook_Unpause

  .return:
    RTL


;;; $8763: Unpause hook - Mother Brain body ;;;
UnpauseHook_MotherBrainBody:
    LDA.L MotherBrainBody.rainbowBeamSFXIsPlayingFlag : BEQ .noRainbowSFX
    LDA.W #$0040
    JSL QueueSound_Lib1_Max6

  .noRainbowSFX:
    LDA.W Enemy.properties2 : AND.W #$0004 : BEQ .return
    LDA.W #$0800 : STA.W EnemyBG2TilemapSize
    LDA.W #$0001 : STA.W RequestEnemyBG2TilemapTransferFlag

  .return:
    RTL


;;; $8785: RTS ;;;
RTS_A98785:
    RTS


;;; $8786: RTL ;;;
RTL_A98786:
    RTL


;;; $8787: Power bomb reaction - enemy $EC3F/$EC7F (Mother Brain) ;;;
PowerBombReaction_MotherBrain:
    JSL NormalEnemyPowerBombAI_NoDeathCheck_External
; Fallthrough to MainAI_HurtAI_MotherBrainHead


;;; $878B: Main AI / hurt AI - enemy $EC3F (Mother Brain brain) ;;;
MainAI_HurtAI_MotherBrainHead:
; Power bomb reaction for enemy $EC7F falls through into here, possible bug?

; If set to invisible, then process a function that may set enemy graphics drawn hook to a function that draws Mother Brain.
; Why use the enemy graphics drawn hook instead of doing the work here?
    LDA.W #RTL_A98786>>8&$FF00 : STA.W EnemyGraphicsDrawnHook+1
    LDA.W #RTL_A98786 : STA.W EnemyGraphicsDrawnHook
    LDA.W Enemy[1].properties : AND.W #$0100 : BEQ RTL_A98786
    JMP.W (MotherBrainBody.brainFunction)


;;; $87A2: Mother Brain brain function - set up brain and neck to be drawn ;;;
Function_MotherBrain_SetupBrainAndNeckToBeDrawn:
    LDA.W TimeIsFrozenFlag : BNE .timeIsFrozen
    JSR HandleMotherBrainsNeck

  .timeIsFrozen:
    LDA.L MotherBrainBody.neckSegment4XPosition : STA.W Enemy[1].XPosition
    LDA.W #$FFEB : CLC : ADC.L MotherBrainBody.neckSegment4YPosition : STA.W Enemy[1].YPosition
    LDA.W #EnemyGraphicsDrawnHook_MotherBrain_DrawBrainAndNeck>>8&$FF00 : STA.W EnemyGraphicsDrawnHook+1
    LDA.W #EnemyGraphicsDrawnHook_MotherBrain_DrawBrainAndNeck : STA.W EnemyGraphicsDrawnHook
    RTL


;;; $87C9: Enemy graphics drawn hook - Mother Brain - draw brain and neck ;;;
EnemyGraphicsDrawnHook_MotherBrain_DrawBrainAndNeck:
    JSR DrawMotherBrainHead
    JSR DrawMotherBrainsNeck
    RTL


;;; $87D0: Mother Brain brain function - set up brain to be drawn ;;;
Function_MotherBrain_SetupBrainToBeDrawn:
    LDA.W #EnemyGraphicsDrawnHook_MotherBrain_DrawBrain>>8&$FF00 : STA.W EnemyGraphicsDrawnHook+1
    LDA.W #EnemyGraphicsDrawnHook_MotherBrain_DrawBrain : STA.W EnemyGraphicsDrawnHook
    RTL


;;; $87DD: Enemy graphics drawn hook - Mother Brain - draw brain ;;;
EnemyGraphicsDrawnHook_MotherBrain_DrawBrain:
    JSR DrawMotherBrainHead
    RTL


;;; $87E1: Mother Brain body function - first phase ;;;
Function_MotherBrain_FirstPhase:
    LDA.W #$0002
    JSL CheckIfEvent_inA_HasHappened
    BCC .runCollisionDetection
    LDA.W EarthquakeTimer : STA.L MotherBrainBody.brainMainShakeTimer
    LDA.W SamusXPosition : CMP.W #$00EC : BPL .runCollisionDetection
    LDA.W Enemy[1].health : BNE .runCollisionDetection
    LDA.W #$0001 : STA.L MotherBrainBody.deleteTurretsRinkasFlag : STA.L MotherBrainBody.form
    JSL DisableMinimap_MarkBossRoomTilesExplored
    LDA.W #$0006
    JSL QueueMusicDataOrTrack_8FrameDelay
    JSL SealMotherBrainsWallFunction_FakeDeath_Descent

  .runCollisionDetection:
    JSR MotherBrain_vs_Samus_CollisionDetection
    PLA
    RTL


;;; $881D: Mother Brain body function - fake death - descent - initial pause ;;;
Function_MotherBrainBody_FakeDeath_Descent_InitialPause:
    LDA.W #Function_MBBody_FakeDeath_Descent_LockSamus_SetScrollRegion : STA.W MotherBrainBody.function
    LDA.W #$0040 : STA.W MotherBrainBody.functionTimer
; fallthrough to Function_MBBody_FakeDeath_Descent_LockSamus_SetScrollRegion


;;; $8829: Mother Brain body function - fake death - descent - lock Samus and set scroll region ;;;
Function_MBBody_FakeDeath_Descent_LockSamus_SetScrollRegion:
    DEC.W MotherBrainBody.functionTimer : BMI .timerExpired
    RTS

  .timerExpired:
    LDA.W #$0000
    JSL Run_Samus_Command
    LDA.L Scrolls : AND.W #$00FF : STA.L Scrolls
    LDA.W #Function_MotherBrainBody_FakeDeath_Descent_QueueMusic : STA.W MotherBrainBody.function
    LDA.W #$0020 : STA.W MotherBrainBody.functionTimer
; fallthrough to Function_MotherBrainBody_FakeDeath_Descent_QueueMusic


;;; $884D: Mother Brain body function - fake death - descent - queue Mother Brain music ;;;
Function_MotherBrainBody_FakeDeath_Descent_QueueMusic:
    DEC.W MotherBrainBody.functionTimer : BPL Function_MBBody_FakeDeath_Descent_BeginScnFlashing_LowerAcid_return
    LDA.W #$0000
    JSL QueueMusicDataOrTrack_8FrameDelay
    LDA.W #$FF21
    JSL QueueMusicDataOrTrack_8FrameDelay
    LDA.W #Function_MotherBrainBody_FakeDeath_Descent_UnlockSamus : STA.W MotherBrainBody.function
    LDA.W #$000C : STA.W MotherBrainBody.functionTimer
; fallthrough to Function_MotherBrainBody_FakeDeath_Descent_UnlockSamus


;;; $886C: Mother Brain body function - fake death - descent - unlock Samus ;;;
Function_MotherBrainBody_FakeDeath_Descent_UnlockSamus:
    DEC.W MotherBrainBody.functionTimer : BPL Function_MBBody_FakeDeath_Descent_BeginScnFlashing_LowerAcid_return
    LDA.W #$0001
    JSL Run_Samus_Command
    LDA.W #Function_MBBody_FakeDeath_Descent_BeginScnFlashing_LowerAcid : STA.W MotherBrainBody.function
    LDA.W #$0008 : STA.W MotherBrainBody.functionTimer
; fallthrough to Function_MBBody_FakeDeath_Descent_BeginScnFlashing_LowerAcid


;;; $8884: Mother Brain body function - fake death - descent - begin screen flashing and lower acid ;;;
Function_MBBody_FakeDeath_Descent_BeginScnFlashing_LowerAcid:
    DEC.W MotherBrainBody.functionTimer : BPL .return
    JSR MotherBrainPalette_BeginScreenFlashing
    LDA.W #$0002
    JSL Load_FX_Entry
    LDA.W #Function_MotherBrainBody_SpawnTubesFallingWhenLessThan4Proj : STA.W MotherBrainBody.subFunction
    LDA.W #Function_MBBody_FakeDeath_Descent_TransitionMBPaletteToGrey : STA.W MotherBrainBody.function
    STZ.W MotherBrainBody.functionTimer
    LDA.W #$0000 : STA.L MotherBrainBody.greyTransitionCounter
    JSL Spawn_Hardcoded_PLM
    db $0E,$02
    dw PLMEntries_clearCeilingBlockInMotherBrainsRoom

  .return:
    RTS


Function_MBBody_FakeDeath_Descent_TransitionMBPaletteToGrey:
    DEC.W MotherBrainBody.functionTimer : BPL Function_MBBody_FakeDeath_Descent_CollapseTubes
    LDA.W #$0008 : STA.W MotherBrainBody.functionTimer
    LDA.L MotherBrainBody.greyTransitionCounter : INC : STA.L MotherBrainBody.greyTransitionCounter
    DEC
    JSL TransitionMotherBrainPaletteToGrey_FakeDeath
    BCC Function_MBBody_FakeDeath_Descent_CollapseTubes
    LDA.W #Function_MBBody_FakeDeath_Descent_CollapseTubes : STA.W MotherBrainBody.function
; fallthrough to Function_MBBody_FakeDeath_Descent_CollapseTubes


;;; $88D3: Mother Brain body function - fake death - descent - collapse tubes ;;;
Function_MBBody_FakeDeath_Descent_CollapseTubes:
    PEA .manualReturn-1
    JMP.W (MotherBrainBody.subFunction)

  .manualReturn:
    JSR HandleFakeDeathExplosions
    RTS


;;; $88DD: Handle fake death explosions ;;;
HandleFakeDeathExplosions:
    LDA.L MotherBrainBody.fakeDeathExplosionTimer : DEC : BMI .timerExpired
    STA.L MotherBrainBody.fakeDeathExplosionTimer
    RTS

  .timerExpired:
    LDA.W #$0008 : STA.L MotherBrainBody.fakeDeathExplosionTimer
    LDA.L MotherBrainBody.fakeDeathExplosionIndex : DEC : BPL +
    LDA.W #$0007

+   STA.L MotherBrainBody.fakeDeathExplosionIndex
    ASL #2 : TAX
    LDA.W .XPosition,X : STA.B DP_Temp12
    LDA.W .YPosition,X : STA.B DP_Temp14
    LDY.W #$0003
    LDA.W RandomNumberSeed : CMP.W #$4000 : BCS +
    LDY.W #$000C

+   TYA
    LDY.W #EnemyProjectile_MiscDust
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    LDA.W #$0024
    JSL QueueSound_Lib2_Max3
    RTS

  .XPosition:
    dw $0088
  .YPosition:
    dw       $0074
    dw $0078,$0084
    dw $007C,$005A
    dw $008A,$0092
    dw $0078,$0034
    dw $007C,$00AA
    dw $008A,$0048
    dw $0078,$00CE


;;; $8949: Mother brain body subfunction - wait until there are less than 4 enemy projectiles alive and spawn tubes falling enemy 0 ;;;
Function_MotherBrainBody_SpawnTubesFallingWhenLessThan4Proj:
    LDY.W #$0000 : TYX

  .loop:
    LDA.W EnemyProjectile_ID,Y : BNE .nextProj
    INX

  .nextProj:
    INY #2 : CPY.W #$0024 : BMI .loop
    CPX.W #$0004 : BPL .tooManyProjs
    RTS

  .tooManyProjs:
    LDX.W #EnemyPopulations_MotherBrainFallingTubes_BottomLeft
    JSL SpawnEnemy
    LDA.W #Function_MotherBrainBody_ClearBottomLeftTube : STA.W MotherBrainBody.subFunction
    RTS


;;; $896E: Mother brain body subfunction - clear bottom-left tube ;;;
Function_MotherBrainBody_ClearBottomLeftTube:
    JSL Spawn_Hardcoded_PLM
    db $05,$09
    dw PLMEntries_clearMotherBrainsBottomLeftTube
    LDA.W #Function_MotherBrainBody_SpawnTopRightTubeFallingProjectile : STA.W MotherBrainBody.subFunction
    LDA.W #$0020 : STA.W MotherBrainBody.bodySubFunctionTimer
    RTS


;;; $8983: Mother brain body subfunction - spawn top-right tube falling enemy projectile ;;;
Function_MotherBrainBody_SpawnTopRightTubeFallingProjectile:
    DEC.W MotherBrainBody.bodySubFunctionTimer : BPL .return
    LDA.W #$0098 : STA.B DP_Temp12
    LDA.W #$002F : STA.B DP_Temp14
    LDY.W #EnemyProjectile_MotherBrainTubeFalling_TopRight
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    LDA.W #Function_MotherBrainBody_ClearCeilingBlockColumn9 : STA.W MotherBrainBody.subFunction

  .return:
    RTS


;;; $89A0: Mother brain body subfunction - clear ceiling block column 9 ;;;
Function_MotherBrainBody_ClearCeilingBlockColumn9:
    JSL Spawn_Hardcoded_PLM
    db $09,$02
    dw PLMEntries_clearCeilingBlockInMotherBrainsRoom
    LDA.W #Function_MotherBrainBody_SpawnTopLeftTubeFallingProjectile : STA.W MotherBrainBody.subFunction
    LDA.W #$0020 : STA.W MotherBrainBody.bodySubFunctionTimer
    RTS


;;; $89B5: Mother brain body subfunction - spawn top-left tube falling enemy projectile ;;;
Function_MotherBrainBody_SpawnTopLeftTubeFallingProjectile:
    DEC.W MotherBrainBody.bodySubFunctionTimer : BPL .return
    LDA.W #$0068 : STA.B DP_Temp12
    LDA.W #$002F : STA.B DP_Temp14
    LDY.W #EnemyProjectile_MotherBrainTubeFalling_TopLeft
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    LDA.W #Function_MotherBrainBody_ClearCeilingBlockColumn6 : STA.W MotherBrainBody.subFunction

  .return:
    RTS


;;; $89D2: Mother brain body subfunction - clear ceiling block column 6 ;;;
Function_MotherBrainBody_ClearCeilingBlockColumn6:
    JSL Spawn_Hardcoded_PLM
    db $06,$02
    dw PLMEntries_clearCeilingBlockInMotherBrainsRoom
    LDA.W #Function_MotherBrainBody_SpawnTubesFalling1 : STA.W MotherBrainBody.subFunction
    LDA.W #$0020 : STA.W MotherBrainBody.bodySubFunctionTimer
    RTS


;;; $89E7: Mother brain body subfunction - spawn tubes falling enemy 1 ;;;
Function_MotherBrainBody_SpawnTubesFalling1:
    DEC.W MotherBrainBody.bodySubFunctionTimer : BPL .return
    LDX.W #EnemyPopulations_MotherBrainFallingTubes_BottomRight
    JSL SpawnEnemy
    LDA.W #Function_MotherBrainBody_ClearBottomRightTube : STA.W MotherBrainBody.subFunction

  .return:
    RTS


;;; $89FA: Mother brain body subfunction - clear bottom-right tube ;;;
Function_MotherBrainBody_ClearBottomRightTube:
    JSL Spawn_Hardcoded_PLM
    db $0A,$09
    dw PLMEntries_clearMotherBrainsBottomRightTube
    LDA.W #Function_MotherBrainBody_SpawnTubesFalling2 : STA.W MotherBrainBody.subFunction
    LDA.W #$0020 : STA.W MotherBrainBody.bodySubFunctionTimer
    RTS


;;; $8A0F: Mother brain body subfunction - spawn tubes falling enemy 2 ;;;
Function_MotherBrainBody_SpawnTubesFalling2:
    DEC.W MotherBrainBody.bodySubFunctionTimer : BPL .return
    LDX.W #EnemyPopulations_MotherBrainFallingTubes_BottomMiddleLeft
    JSL SpawnEnemy
    LDA.W #Function_MotherBrainBody_ClearBottomMiddleLeftTube : STA.W MotherBrainBody.subFunction

  .return:
    RTS


;;; $8A22: Mother brain body subfunction - clear bottom-middle-left tube ;;;
Function_MotherBrainBody_ClearBottomMiddleLeftTube:
    JSL Spawn_Hardcoded_PLM
    db $06,$0A
    dw PLMEntries_clearMotherBrainsBottomMiddleSideTube
    LDA.W #Function_MotherBrainBody_SpawnTopMiddleLeftTubeFallingProj : STA.W MotherBrainBody.subFunction
    LDA.W #$0020 : STA.W MotherBrainBody.bodySubFunctionTimer
    RTS


;;; $8A37: Mother brain body subfunction - spawn top-middle-left tube falling enemy projectile ;;;
Function_MotherBrainBody_SpawnTopMiddleLeftTubeFallingProj:
    DEC.W MotherBrainBody.bodySubFunctionTimer : BPL .return
    LDA.W #$0078 : STA.B DP_Temp12
    LDA.W #$003B : STA.B DP_Temp14
    LDY.W #EnemyProjectile_MotherBrainTubeFalling_TopMiddleLeft
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    LDA.W #Function_MotherBrainBody_ClearCeilingTubeColumn7 : STA.W MotherBrainBody.subFunction

  .return:
    RTS


;;; $8A54: Mother brain body subfunction - clear ceiling tube column 7 ;;;
Function_MotherBrainBody_ClearCeilingTubeColumn7:
    JSL Spawn_Hardcoded_PLM
    db $07,$02
    dw PLMEntries_clearCeilingTubeInMotherBrainsRoom
    LDA.W #Function_MotherBrainBody_SpawnTopMiddleRightTubeFallingProj : STA.W MotherBrainBody.subFunction
    LDA.W #$0020 : STA.W MotherBrainBody.bodySubFunctionTimer
    RTS


;;; $8A69: Mother brain body subfunction - spawn top-middle-right tube falling enemy projectile ;;;
Function_MotherBrainBody_SpawnTopMiddleRightTubeFallingProj:
    DEC.W MotherBrainBody.bodySubFunctionTimer : BPL .return
    LDA.W #$0088 : STA.B DP_Temp12
    LDA.W #$003B : STA.B DP_Temp14
    LDY.W #EnemyProjectile_MotherBrainTubeFalling_TopMiddleRight
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    LDA.W #Function_MotherBrainBody_ClearCeilingTubeColumn8 : STA.W MotherBrainBody.subFunction

  .return:
    RTS


;;; $8A86: Mother brain body subfunction - clear ceiling tube column 8 ;;;
Function_MotherBrainBody_ClearCeilingTubeColumn8:
    JSL Spawn_Hardcoded_PLM
    db $08,$02
    dw PLMEntries_clearCeilingTubeInMotherBrainsRoom
    LDA.W #Function_MotherBrainBody_SpawnTubesFalling3 : STA.W MotherBrainBody.subFunction
    LDA.W #$0020 : STA.W MotherBrainBody.bodySubFunctionTimer
    RTS


;;; $8A9B: Mother brain body subfunction - spawn tubes falling enemy 3 ;;;
Function_MotherBrainBody_SpawnTubesFalling3:
    DEC.W MotherBrainBody.bodySubFunctionTimer : BPL .return
    LDX.W #EnemyPopulations_MotherBrainFallingTubes_BottomMiddleRight
    JSL SpawnEnemy
    LDA.W #Function_MotherBrainBody_ClearBottomMiddleRightTube : STA.W MotherBrainBody.subFunction

  .return:
    RTS


;;; $8AAE: Mother brain body subfunction - clear bottom-middle-right tube ;;;
Function_MotherBrainBody_ClearBottomMiddleRightTube:
    JSL Spawn_Hardcoded_PLM
    db $09,$0A
    dw PLMEntries_clearMotherBrainsBottomMiddleSideTube
    LDA.W #Function_MotherBrainBody_SpawnTubesFalling4 : STA.W MotherBrainBody.subFunction
    LDA.W #$0002 : STA.W MotherBrainBody.bodySubFunctionTimer
    RTS


;;; $8AC3: Mother brain body subfunction - spawn tubes falling enemy 4 ;;;
Function_MotherBrainBody_SpawnTubesFalling4:
    DEC.W MotherBrainBody.bodySubFunctionTimer : BPL .return
    LDX.W #EnemyPopulations_MotherBrainFallingTubes_MainTube
    JSL SpawnEnemy
    LDA.W #Function_MotherBrainBody_ClearBottomMiddleTubes : STA.W MotherBrainBody.subFunction

  .return:
    RTS


;;; $8AD6: Mother brain body subfunction - clear bottom-middle tubes ;;;
Function_MotherBrainBody_ClearBottomMiddleTubes:
    JSL Spawn_Hardcoded_PLM
    db $07,$07
    dw PLMEntries_clearMotherBrainsBottomMiddleTubes
    LDA.W #.return : STA.W MotherBrainBody.subFunction

  .return:
    RTS


;;; $8AE5: Mother Brain tubes falling enemy population entries ;;;
; Enemy population format is:
; ____________________________________________ Enemy ID
;        _____________________________________ X position
;       |      _______________________________ Y position
;       |     |      _________________________ Initialisation parameter (orientation in SMILE)
;       |     |     |      ___________________ Properties (special in SMILE)
;       |     |     |     |      _____________ Extra properties (special graphics bitset in SMILE)
;       |     |     |     |     |      _______ Parameter 1 (speed in SMILE)
;       |     |     |     |     |     |      _ Parameter 2 (speed2 in SMILE)
;       |     |     |     |     |     |     |
;       xxxx  yyyy  oooo  pppp  gggg  aaaa  bbbb

;  ______ Terminator
; |     _ Number of enemy deaths needed to clear current room
; |    |
; FFFF nn
EnemyPopulations_MotherBrainFallingTubes_BottomLeft:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_MotherBrainTubes),
    %XPosition($0060),
    %YPosition($00B3),
    %initParam(InstList_MotherBrainTubes_0),
    %properties($A000),
    %extraProperties($0000),
    %speedParams(0, 0))

EnemyPopulations_MotherBrainFallingTubes_BottomRight:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_MotherBrainTubes),
    %XPosition($00A0),
    %YPosition($00B3),
    %initParam(InstList_MotherBrainTubes_1),
    %properties($A000),
    %extraProperties($0000),
    %speedParams(2, 0))

EnemyPopulations_MotherBrainFallingTubes_BottomMiddleLeft:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_MotherBrainTubes),
    %XPosition($0068),
    %YPosition($00BB),
    %initParam(InstList_MotherBrainTubes_2),
    %properties($A000),
    %extraProperties($0000),
    %speedParams(4, 0))

EnemyPopulations_MotherBrainFallingTubes_BottomMiddleRight:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_MotherBrainTubes),
    %XPosition($0098),
    %YPosition($00BB),
    %initParam(InstList_MotherBrainTubes_3),
    %properties($A000),
    %extraProperties($0000),
    %speedParams(6, 0))

EnemyPopulations_MotherBrainFallingTubes_MainTube:
    %EnemyPopulations(\
    %enemyID(EnemyHeaders_MotherBrainTubes),
    %XPosition($0080),
    %YPosition($00A7),
    %initParam(InstList_MotherBrainTubes_4),
    %properties($A800),
    %extraProperties($0000),
    %speedParams(8, $20))


;;; $8B35: Initialisation AI - enemy $ECFF (Mother Brain tubes falling) ;;;
InitAI_MotherBrainTubes:
    LDX.W EnemyIndex
    LDY.W MotherBrainTubes.tubeType,X
    LDA.W .XRadius,Y : STA.W Enemy.XHitboxRadius,X
    LDA.W .YRadius,Y : STA.W Enemy.YHitboxRadius,X
    LDA.W .YPositionThreshold,Y : STA.W MotherBrainTubes.YPositionThreshold,X
    STZ.W MotherBrainTubes.smokeTimer,X : STZ.W MotherBrainTubes.smokeCounter,X : STZ.W MotherBrainTubes.YVelocity,X
    LDA.W .functionPointer,Y : STA.W MotherBrainTubes.function,X
    RTL

  .XRadius:
    dw $0010,$0010,$0008,$0008,$0010

  .YRadius:
    dw $0020,$0020,$0018,$0018,$0020

  .YPositionThreshold:
    dw $00F8,$00F8,$00F0,$00F0,$00F6

  .functionPointer:
    dw Function_MotherBrainTubes_NonMainTube
    dw Function_MotherBrainTubes_NonMainTube
    dw Function_MotherBrainTubes_NonMainTube
    dw Function_MotherBrainTubes_NonMainTube
    dw Function_MotherBrainTubes_MainTube_WaitingToFall


;;; $8B85: Main AI - enemy $ECFF (Mother Brain tubes falling) ;;;
MainAI_MotherBrainTubes:
    JMP.W (MotherBrainTubes.function,X)


;;; $8B88: Mother Brain tubes falling function - non-main tube ;;;
Function_MotherBrainTubes_NonMainTube:
    LDA.W MotherBrainTubes.YVelocity,X : CLC : ADC.W #$0006 : STA.W MotherBrainTubes.YVelocity,X
    JSR AddADividedBy100ToEnemyYPosition
    LDA.W Enemy.YPosition,X : CMP.W MotherBrainTubes.YPositionThreshold,X : BPL ExplodeMotherBrainTubes
; fallthrough to HandleFallingTubeSmoke


;;; $8B9D: Handle falling tube smoke ;;;
HandleFallingTubeSmoke:
    DEC.W MotherBrainTubes.smokeTimer,X : BPL .return
    JSR SpawnFallingTubeSmoke

  .return:
    RTL


;;; $8BA6: Explode Mother Brain tube ;;;
ExplodeMotherBrainTubes:
    LDA.W Enemy.properties,X : ORA.W #$0200 : STA.W Enemy.properties,X
    LDA.W Enemy.XPosition,X : STA.B DP_Temp12
    LDA.W Enemy.YPosition,X : STA.B DP_Temp14
    LDA.W #$0003
    LDY.W #EnemyProjectile_MiscDust
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    LDA.W #$0024
    JSL QueueSound_Lib2_Max3
    RTL


;;; $8BCB: Mother Brain tubes falling function - main tube - waiting to fall ;;;
Function_MotherBrainTubes_MainTube_WaitingToFall:
    DEC.W MotherBrainTubes.fallDelayTimer,X : BPL HandleFallingTubeSmoke_return
    LDA.W #Function_MotherBrainTubes_MainTube_Falling : STA.W MotherBrainTubes.function,X
; fallthrough to Function_MotherBrainTubes_MainTube_Falling


;;; $8BD6: Mother Brain tubes falling function - main tube - falling ;;;
Function_MotherBrainTubes_MainTube_Falling:
    LDA.W MotherBrainTubes.YVelocity,X : CLC : ADC.W #$0006 : STA.W MotherBrainTubes.YVelocity,X
    JSR AddADividedBy100ToEnemyYPosition
    PHA
    CMP.W #$00F4 : BMI .lessThanF4
    LDA.W Enemy.properties,X : ORA.W #$0100 : STA.W Enemy.properties,X

  .lessThanF4:
    PLA : SEC : SBC.W #$0038 : CMP.W #$00C4 : STA.W Enemy[1].YPosition : BPL .greaterThanEqualToC4
    JMP HandleFallingTubeSmoke

  .greaterThanEqualToC4:
    JSR MotherBrainPalette_EndScreenFlashing
    LDA.W #$0019
    JSL EnableEarthquakeTypeInAFor20Frames
    STZ.W HDMAObject_ChannelBitflags : STZ.W HDMAObject_ChannelBitflags+2
    STZ.W MotherBrainBody.ZebetitesPaletteAnimationIndex,X
    LDA.W #$00C4 : STA.W Enemy[1].YPosition
    LDA.W #$003B : STA.W Enemy.XPosition
    LDA.W #$0117 : STA.W Enemy.YPosition
    JSR SetupMotherBrainsNeckForFakeDeathAscent
    LDA.W #Function_MotherBrainBody_FakeDeath_Ascent_DrawRoomBG_Rows2_3 : STA.W MotherBrainBody.function
    LDX.W EnemyIndex
    JMP ExplodeMotherBrainTubes


;;; $8C36: Spawn falling tube smoke ;;;
SpawnFallingTubeSmoke:
    LDA.W #$0008 : STA.W MotherBrainTubes.smokeTimer,X
    LDA.W MotherBrainTubes.smokeCounter,X : INC : AND.W #$0003 : STA.W MotherBrainTubes.smokeCounter,X
    ASL : TAY
    LDA.W .data,Y : CLC : ADC.W Enemy.XPosition,X : STA.B DP_Temp12
    LDA.W #$00D0 : STA.B DP_Temp14
    LDA.W #$0009
    LDY.W #EnemyProjectile_MiscDust
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    RTS

  .data:
    dw $FFF8,$0002,$FFFC,$0006


;;; $8C69: Instruction list - Mother Brain tubes falling 0 ;;;
InstList_MotherBrainTubes_0:
    dw $0001,Spritemaps_MotherBrainTubes_0
    dw Instruction_Common_Sleep


;;; $8C6F: Instruction list - Mother Brain tubes falling 1 ;;;
InstList_MotherBrainTubes_1:
    dw $0001,Spritemaps_MotherBrainTubes_1
    dw Instruction_Common_Sleep


;;; $8C75: Instruction list - Mother Brain tubes falling 2 ;;;
InstList_MotherBrainTubes_2:
    dw $0001,Spritemaps_MotherBrainTubes_2
    dw Instruction_Common_Sleep


;;; $8C7B: Instruction list - Mother Brain tubes falling 3 ;;;
InstList_MotherBrainTubes_3:
    dw $0001,Spritemaps_MotherBrainTubes_3
    dw Instruction_Common_Sleep


;;; $8C81: Instruction list - Mother Brain tubes falling 4 ;;;
InstList_MotherBrainTubes_4:
    dw $0001,Spritemaps_MotherBrainTubes_4
    dw Instruction_Common_Sleep


;;; $8C87: Mother Brain body function - fake death - ascent - draw room background on BG1 - rows 2/3 ;;;
Function_MotherBrainBody_FakeDeath_Ascent_DrawRoomBG_Rows2_3:
    JSL Spawn_Hardcoded_PLM
    db $02,$02
    dw PLMEntries_motherBrainsBackgroundRow2
    JSL Spawn_Hardcoded_PLM
    db $02,$03
    dw PLMEntries_motherBrainsBackgroundRow3
    LDA.W #Function_MotherBrainBody_FakeDeath_Ascent_DrawRoomBG_Rows4_5 : STA.W MotherBrainBody.function
    RTS


;;; $8C9E: Mother Brain body function - fake death - ascent - draw room background on BG1 - rows 4/5 ;;;
Function_MotherBrainBody_FakeDeath_Ascent_DrawRoomBG_Rows4_5:
    JSL Spawn_Hardcoded_PLM
    db $02,$04
    dw PLMEntries_motherBrainsBackgroundRow4
    JSL Spawn_Hardcoded_PLM
    db $02,$05
    dw PLMEntries_motherBrainsBackgroundRow5
    LDA.W #Function_MotherBrainBody_FakeDeath_Ascent_DrawRoomBG_Rows6_7 : STA.W MotherBrainBody.function
    RTS


;;; $8CB5: Mother Brain body function - fake death - ascent - draw room background on BG1 - rows 6/7 ;;;
Function_MotherBrainBody_FakeDeath_Ascent_DrawRoomBG_Rows6_7:
    JSL Spawn_Hardcoded_PLM
    db $02,$06
    dw PLMEntries_motherBrainsBackgroundRow6
    JSL Spawn_Hardcoded_PLM
    db $02,$07
    dw PLMEntries_motherBrainsBackgroundRow7
    LDA.W #Function_MotherBrainBody_FakeDeath_Ascent_DrawRoomBG_Rows8_9 : STA.W MotherBrainBody.function
    RTS


;;; $8CCC: Mother Brain body function - fake death - ascent - draw room background on BG1 - rows 8/9 ;;;
Function_MotherBrainBody_FakeDeath_Ascent_DrawRoomBG_Rows8_9:
    JSL Spawn_Hardcoded_PLM
    db $02,$08
    dw PLMEntries_motherBrainsBackgroundRow8
    JSL Spawn_Hardcoded_PLM
    db $02,$09
    dw PLMEntries_motherBrainsBackgroundRow9
    LDA.W #Function_MotherBrainBody_FakeDeath_Ascent_DrawRoomBG_RowsA_B : STA.W MotherBrainBody.function
    RTS


;;; $8CE3: Mother Brain body function - fake death - ascent - draw room background on BG1 - rows Ah/Bh ;;;
Function_MotherBrainBody_FakeDeath_Ascent_DrawRoomBG_RowsA_B:
    JSL Spawn_Hardcoded_PLM
    db $02,$0A
    dw PLMEntries_motherBrainsBackgroundRowA
    JSL Spawn_Hardcoded_PLM
    db $02,$0B
    dw PLMEntries_motherBrainsBackgroundRowB
    LDA.W #Function_MotherBrainBody_FakeDeath_Ascent_DrawRoomBG_RowsC_D : STA.W MotherBrainBody.function
    RTS


;;; $8CFA: Mother Brain body function - fake death - ascent - draw room background on BG1 - rows Ch/Dh ;;;
Function_MotherBrainBody_FakeDeath_Ascent_DrawRoomBG_RowsC_D:
    JSL Spawn_Hardcoded_PLM
    db $02,$0C
    dw PLMEntries_motherBrainsBackgroundRowC
    JSL Spawn_Hardcoded_PLM
    db $02,$0D
    dw PLMEntries_motherBrainsBackgroundRowD
    LDA.W #Function_MotherBrainBody_FakeDeath_Ascent_SetupMBPhase2GFX : STA.W MotherBrainBody.function
    RTS


;;; $8D11: Mother Brain body function - fake death - ascent - set up Mother Brain phase 2 graphics ;;;
Function_MotherBrainBody_FakeDeath_Ascent_SetupMBPhase2GFX:
    LDA.W #$0101 : STA.W Layer2ScrollX
    LDA.B DP_BG2TilemapAddrSize : AND.W #$FFFC : STA.B DP_BG2TilemapAddrSize
    LDY.W #Palette_MotherBrain_Attacks+2
    LDX.W #$0142
    LDA.W #$000F
    JSL WriteAColorsFromYtoColorIndexX
    LDY.W #Palette_MotherBrain_BackLeg+2
    LDX.W #$0162
    LDA.W #$000F
    JSL WriteAColorsFromYtoColorIndexX
    LDA.W #Function_MotherBrainBody_FakeDeath_Ascent_SetupMBPhase2Brain : STA.W MotherBrainBody.function
    LDA.W #$0001 : STA.W RequestEnemyBG2TilemapTransferFlag : STA.L MotherBrainBody.enableUnpauseHookFlag
    RTS


;;; $8D49: Mother Brain body function - fake death - ascent - set up Mother Brain phase 2 brain ;;;
Function_MotherBrainBody_FakeDeath_Ascent_SetupMBPhase2Brain:
    LDA.W #$0034 : STA.W LayerBlending_DefaultConfig
    LDA.W #Function_MotherBrain_SetupBrainAndNeckToBeDrawn : STA.W MotherBrainBody.brainFunction
    LDA.W Enemy.properties : AND.W #$FBFF : STA.W Enemy.properties
    LDA.W Enemy[1].properties : AND.W #$FBFF : STA.W Enemy[1].properties
    LDA.W #$4650 : STA.W Enemy[1].health
    LDA.W #Function_MotherBrainBody_FakeDeath_Ascent_PauseForSuspense : STA.W MotherBrainBody.function
    LDA.W #$0080 : STA.W MotherBrainBody.functionTimer
; fallthrough to Function_MotherBrainBody_FakeDeath_Ascent_PauseForSuspense


;;; $8D79: Mother Brain body function - fake death - ascent - pause for suspense ;;;
Function_MotherBrainBody_FakeDeath_Ascent_PauseForSuspense:
    DEC.W MotherBrainBody.functionTimer : BMI .timerExpired
    RTS

  .timerExpired:
    LDA.W #Function_MotherBrainBody_FakeDeath_Ascent_PrepareMBForRising : STA.W MotherBrainBody.function
    LDA.W #$0020 : STA.W MotherBrainBody.functionTimer
; fallthrough to Function_MotherBrainBody_FakeDeath_Ascent_PrepareMBForRising


;;; $8D8B: Mother Brain body function - fake death - ascent - prepare Mother Brain for rising ;;;
Function_MotherBrainBody_FakeDeath_Ascent_PrepareMBForRising:
    DEC.W MotherBrainBody.functionTimer : BMI .timerExpired
    RTS

  .timerExpired:
    JSL Spawn_MotherBrainRising_HDMAObject
    STA.L MotherBrainBody.HDMAObjectIndex
    LDA.W Enemy[1].properties : ORA.W #$0100 : STA.W Enemy[1].properties
    LDA.W #InstList_MotherBrainHead_Initial
    JSR SetMotherBrainHeadInstList
    LDA.W #Function_MotherBrainBody_FakeDeath_Ascent_LoadMBLegTiles : STA.W MotherBrainBody.function
    LDA.W #$0100 : STA.W MotherBrainBody.functionTimer
; fallthrough to Function_MotherBrainBody_FakeDeath_Ascent_LoadMBLegTiles


;;; $8DB4: Mother Brain body function - fake death - ascent - load Mother Brain's legs tiles ;;;
Function_MotherBrainBody_FakeDeath_Ascent_LoadMBLegTiles:
    LDX.W #MotherBrainFightSpriteTileTransferEntries_legs
    JSR ProcessSpriteTilesTransfers
    BCS .finishedLoading
    RTS

  .finishedLoading:
    LDA.W #Function_MotherBrainBody_FakeDeath_Ascent_ContinuePausing : STA.W MotherBrainBody.function
; fallthrough to Function_MotherBrainBody_FakeDeath_Ascent_ContinuePausing


;;; $8DC3: Mother Brain body function - fake death - ascent - continue pausing for suspense ;;;
Function_MotherBrainBody_FakeDeath_Ascent_ContinuePausing:
    DEC.W MotherBrainBody.functionTimer : BPL .return
    LDA.W #$003B : STA.W Enemy.XPosition
    LDA.W #$0117 : STA.W Enemy.YPosition
    LDA.W #$FFE5 : STA.B DP_BG2XScroll
    LDA.W #$FF27 : STA.B DP_BG2YScroll
    LDA.W #$0007 : STA.L MotherBrainBody.hitboxesEnabled
    LDA.W #Function_MotherBrainBody_FakeDeath_Ascent_StartMusic_Quake : STA.W MotherBrainBody.function

  .return:
    RTS


;;; $8DEC: Mother Brain body function - fake death - ascent - start music and earthquake ;;;
Function_MotherBrainBody_FakeDeath_Ascent_StartMusic_Quake:
    LDA.W #InstList_MotherBrainBody_Crouched
    JSR SetMotherBrainBodyInstList
    LDA.W #$0001 : STA.W Enemy[1].instTimer
    LDA.W Enemy.properties : AND.W #$FEFF : STA.W Enemy.properties
    LDA.W #$003B : STA.W Enemy.XPosition
    LDA.W #$0117 : STA.W Enemy.YPosition
    LDA.W #$FFE5 : STA.B DP_BG2XScroll
    LDA.W #$FF27 : STA.B DP_BG2YScroll
    LDA.W #$0005
    JSL QueueMusicDataOrTrack_8FrameDelay
    LDA.W #$0002 : STA.W EarthquakeType
    LDA.W #$0100 : STA.W EarthquakeTimer
    LDA.W #$0050 : STA.L MotherBrainBody.neckAngleDelta
    LDA.W #$0001 : STA.L MotherBrainBody.enableNeckMovementFlag
    LDA.W #$0008 : STA.L MotherBrainBody.lowerNeckMovementIndex
    LDA.W #$0006 : STA.L MotherBrainBody.upperNeckMovementIndex
    LDA.W #Function_MotherBrainBody_FakeDeath_Ascent_RaiseMotherBrain : STA.W MotherBrainBody.function
    RTS


;;; $8E4D: Mother Brain body function - fake death - ascent - raise Mother Brain ;;;
Function_MotherBrainBody_FakeDeath_Ascent_RaiseMotherBrain:
    LDA.W NMI_FrameCounter : AND.W #$0003 : BNE Function_MBBody_FakeDeath_Ascent_WaitForMBUncrouch_return
    JSR SpawnDustCloudsForMotherBrainsAscent
    LDA.W #$0002 : STA.B DP_Temp12
    LDA.B DP_BG2YScroll : CLC : ADC.B DP_Temp12 : STA.B DP_BG2YScroll
    LDA.W Enemy.YPosition : SEC : SBC.B DP_Temp12 : STA.W Enemy.YPosition
    CMP.W #$00BD : BCS Function_MBBody_FakeDeath_Ascent_WaitForMBUncrouch_return
    LDA.W #$0140 : STA.W EnemyBG2TilemapSize
    LDA.W #$00BC : STA.W Enemy.YPosition
    STZ.W EarthquakeTimer
    LDA.L MotherBrainBody.HDMAObjectIndex : TAX
    STZ.W HDMAObject_ChannelBitflags,X
    LDA.W #InstList_MotherBrainBody_StandingUpAfterCrouching_Slow
    JSR SetMotherBrainBodyInstList
    LDA.W #Function_MBBody_FakeDeath_Ascent_WaitForMBUncrouch : STA.W MotherBrainBody.function
; fallthrough to Function_MotherBrainBody_FakeDeath_Ascent_WaitForMBUncrouch


;;; $8E95: Mother Brain body function - fake death - ascent - wait until Mother Brain has finished uncrouching ;;;
Function_MBBody_FakeDeath_Ascent_WaitForMBUncrouch:
    LDA.L MotherBrainBody.pose : BEQ Function_MBBody_FakeDeath_Ascent_WaitForMBUncrouch_standing

  .return:
    RTS


;;; $8EAA: Mother Brain body function - fake death - ascent - transition Mother Brain from grey and lower her head ;;;
Function_MBBody_FakeDeath_Ascent_WaitForMBUncrouch_standing:
    STA.L MotherBrainBody.greyTransitionCounter
    LDA.W #Function_MBBody_FakeDeath_Ascent_TransitionFromGreyLowerHead : STA.W MotherBrainBody.function
    STZ.W MotherBrainBody.functionTimer
    RTS


;;; $8EAA: Mother Brain body function - fake death - ascent - transition Mother Brain from grey and lower her head ;;;
Function_MBBody_FakeDeath_Ascent_TransitionFromGreyLowerHead:
    DEC.W MotherBrainBody.functionTimer : BPL .return
    LDA.W #$0004 : STA.W MotherBrainBody.functionTimer
    LDA.L MotherBrainBody.greyTransitionCounter : INC : STA.L MotherBrainBody.greyTransitionCounter
    DEC
    JSL TransitionMotherBrainPaletteFromGrey_FakeDeath
    BCC .return
    LDA.W #$0001 : STA.L MotherBrainBody.enableBrainPaletteHandlingFlag
    INC : STA.L MotherBrainBody.form
    DEC : STA.L MotherBrainBody.enableDroolGenerationFlag ; >.<
    LDA.W #$0006 : STA.L MotherBrainBody.lowerNeckMovementIndex : STA.L MotherBrainBody.upperNeckMovementIndex
    LDA.W #$0500 : STA.L MotherBrainBody.neckAngleDelta
    LDA.W #Function_MotherBrainBody_Phase2_Stretching_ShakeHeadMenacing : STA.W MotherBrainBody.function
    LDA.W #$0017 : STA.W MotherBrainBody.functionTimer

  .return:
    RTS


;;; $8EF5: Mother Brain body function - second phase - stretching - shake head menacingly ;;;
Function_MotherBrainBody_Phase2_Stretching_ShakeHeadMenacing:
    DEC.W MotherBrainBody.functionTimer : BMI .timerExpired
    RTS

  .timerExpired:
    LDA.W #InstList_MotherBrainHead_Stretching_Phase2_0
    JSR SetMotherBrainHeadInstList
    LDA.W #Function_MotherBrainBody_Phase2_Stretching_BringHeadBackUp : STA.W MotherBrainBody.function
    LDA.W #$0040 : STA.L MotherBrainBody.neckAngleDelta
    LDA.W #$0100 : STA.W MotherBrainBody.functionTimer
; fallthrough to Function_MotherBrainBody_Phase2_Stretching_BringHeadBackUp


;;; $8F14: Mother Brain body function - second phase - stretching - bring head back up ;;;
Function_MotherBrainBody_Phase2_Stretching_BringHeadBackUp:
    DEC.W MotherBrainBody.functionTimer : BPL Function_MotherBrainBody_Phase2_Stretching_FinishStretching_return
    LDA.W #$0002 : STA.L MotherBrainBody.lowerNeckMovementIndex
    LDA.W #$0004 : STA.L MotherBrainBody.upperNeckMovementIndex
    LDA.W #Function_MotherBrainBody_Phase2_Stretching_FinishStretching : STA.W MotherBrainBody.function
    LDA.W #$0040 : STA.W MotherBrainBody.functionTimer
; fallthrough to Function_MotherBrainBody_Phase2_Stretching_FinishStretching


;;; $8F33: Mother Brain body function - second phase - stretching - finish stretching ;;;
Function_MotherBrainBody_Phase2_Stretching_FinishStretching:
    DEC.W MotherBrainBody.functionTimer : BPL .return
    LDA.W #$0001 : STA.L MotherBrainBody.smallPurpleBreathGenerationEnabledFlag
    LDA.W #Function_MotherBrainBody_Phase2_Thinking : STA.W MotherBrainBody.function

  .return:
    RTS


;;; $8F46: Spawn dust clouds for Mother Brain's ascent ;;;
SpawnDustCloudsForMotherBrainsAscent:
    DEC.W MotherBrainBody.bodySubFunctionTimer : BPL .timerNotExpired
    LDA.W #$0007 : STA.W MotherBrainBody.bodySubFunctionTimer

  .timerNotExpired:
    LDA.W MotherBrainBody.bodySubFunctionTimer : ASL : TAX
    LDA.W .XPositions,X : STA.B DP_Temp12
    LDA.W #$00D4 : STA.B DP_Temp14
    LDA.W RandomNumberSeed : AND.W #$0100 : XBA : TAX
    LDA.W .explosionType,X : AND.W #$00FF
    LDY.W #EnemyProjectile_MiscDust
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    LDA.W #$0029
    JSL QueueSound_Lib2_Max3
    RTS

  .explosionType:
; Explosion type. 9 = small dust cloud, Ch = smoke
    db $09,$12

  .XPositions:
; Explosion X positions
    dw $003D,$0054,$0020,$0035,$005A,$0043,$0067,$0029


;;; $8F8F: Mother Brain fight sprite tile transfer entries ;;;
MotherBrainFightSpriteTileTransferEntries:
; Size
; Source address
; VRAM address
; Zero terminator
  .legs:
; Mother Brain's legs
    dw $0200
    dl Tiles_MotherBrainLegs
    dw $7400

    dw $0200
    dl Tiles_MotherBrainLegs+$200
    dw $7500

    dw $0200
    dl Tiles_MotherBrainLegs+$400
    dw $7600

    dw $0200
    dl Tiles_MotherBrainLegs+$600
    dw $7700

    dw $0200
    dl Tiles_MotherBrainLegs+$800
    dw $7800

    dw $0200
    dl Tiles_MotherBrainLegs+$A00
    dw $7900

    dw $0200
    dl Tiles_MotherBrainLegs+$C00
    dw $7A00

    dw $0200
    dl Tiles_MotherBrainLegs+$E00
    dw $7B00

  .attacks:
; Bomb shells, death beam, unused graphics
    dw $0200
    dl Tiles_MotherBrain_BombShells_DeathBeam_UnusedGFX
    dw $7C00

    dw $0200
    dl Tiles_MotherBrain_BombShells_DeathBeam_UnusedGFX+$200
    dw $7D00

    dw $0200
    dl Tiles_MotherBrain_BombShells_DeathBeam_UnusedGFX+$400
    dw $7E00

    dw $0200
    dl Tiles_MotherBrain_BombShells_DeathBeam_UnusedGFX+$600
    dw $7F00

    dw $0000

  .babyMetroid:
; Baby Metroid
    dw $0200
    dl Tiles_BabyMetroid+$400
    dw $7C00

    dw $0200
    dl Tiles_BabyMetroid+$600
    dw $7D00

    dw $0200
    dl Tiles_BabyMetroid+$800
    dw $7E00

    dw $0200
    dl Tiles_BabyMetroid+$A00
    dw $7F00

    dw $0000

  .corpse:
; Mother Brain's corpse
    dw $01C0
    dl Tiles_CorpseMotherBrain
    dw $7A00

    dw $01C0
    dl Tiles_CorpseMotherBrain+$200
    dw $7B00

    dw $01C0
    dl Tiles_CorpseMotherBrain+$400
    dw $7C00

    dw $01C0
    dl Tiles_CorpseMotherBrain+$600
    dw $7D00

    dw $01C0
    dl Tiles_CorpseMotherBrain+$800
    dw $7E00

    dw $01C0
    dl Tiles_CorpseMotherBrain+$A00
    dw $7F00

    dw $0000

  .explodedDoor:
; Exploded escape door particles
    dw $0200
    dl Tiles_MotherBrainExplodedEscapeDoorParticles
    dw $7000

    dw $0200
    dl Tiles_MotherBrainExplodedEscapeDoorParticles+$200
    dw $7100

    dw $0000


;;; $903F: Set up Mother Brain's neck for fake death ascent ;;;
SetupMotherBrainsNeckForFakeDeathAscent:
    LDA.W #$0002 : STA.L MotherBrainBody.neckSegment0Distance
    LDA.W #$000A : STA.L MotherBrainBody.neckSegment1Distance : STA.L MotherBrainBody.neckSegment3Distance
    LDA.W #$0014 : STA.L MotherBrainBody.neckSegment2Distance : STA.L MotherBrainBody.neckSegment4Distance
    LDA.W #$4800 : STA.L MotherBrainBody.lowerNeckAngle
    LDA.W #$5000 : STA.L MotherBrainBody.upperNeckAngle
    LDA.W #$0100 : STA.L MotherBrainBody.neckAngleDelta
    RTS


;;; $9072: Handle Mother Brain's neck - lower ;;;
HandleMotherBrainsNeck_Lower:
    LDA.L MotherBrainBody.lowerNeckMovementIndex : TAX
    JMP.W (.pointers,X)

  .pointers:
    dw RTS_A99084
    dw HandleMotherBrainsNeck_Lower_2_BobDown
    dw HandleMotherBrainsNeck_Lower_4_BobUp
    dw HandleMotherBrainsNeck_Lower_6_Lower
    dw HandleMotherBrainsNeck_Lower_8_Raise


;;; $9084: RTS. Handle Mother Brain's neck - lower - movement index = 0: nothing ;;;
RTS_A99084:
    RTS


;;; $9085: Handle Mother Brain's neck - lower - movement index = 2: bob down ;;;
HandleMotherBrainsNeck_Lower_2_BobDown:
    LDA.L MotherBrainBody.lowerNeckAngle : SEC : SBC.L MotherBrainBody.neckAngleDelta : CMP.W #$2800 : BCS +
    LDA.W #$0004 : STA.L MotherBrainBody.lowerNeckMovementIndex
    LDA.W #$2800

+   STA.L MotherBrainBody.lowerNeckAngle
    RTS


;;; $90A2: Handle Mother Brain's neck - lower - movement index = 4: bob up ;;;
HandleMotherBrainsNeck_Lower_4_BobUp:
    LDA.W Enemy[1].YPosition : CMP.W #$003C : BMI .bobDown
    LDA.L MotherBrainBody.lowerNeckAngle : CLC : ADC.L MotherBrainBody.neckAngleDelta : CMP.W #$9000 : BCC +
    LDA.W #$0002 : STA.L MotherBrainBody.lowerNeckMovementIndex
    LDA.W #$9000

+   STA.L MotherBrainBody.lowerNeckAngle
    RTS

  .bobDown:
    LDA.W #$0002 : STA.L MotherBrainBody.lowerNeckMovementIndex
    RTS


;;; $90CF: Handle Mother Brain's neck - lower - movement index = 6: lower ;;;
HandleMotherBrainsNeck_Lower_6_Lower:
    LDA.L MotherBrainBody.lowerNeckAngle : SEC : SBC.L MotherBrainBody.neckAngleDelta : CMP.W #$3000 : BCS +
    LDA.W #$0000 : STA.L MotherBrainBody.lowerNeckMovementIndex
    LDA.W #$3000

+   STA.L MotherBrainBody.lowerNeckAngle
    RTS


;;; $90EC: Handle Mother Brain's neck - lower - movement index = 8: raise ;;;
HandleMotherBrainsNeck_Lower_8_Raise:
    LDA.L MotherBrainBody.lowerNeckAngle : CLC : ADC.L MotherBrainBody.neckAngleDelta : CMP.W #$9000 : BCC +
    LDA.W #$0000 : STA.L MotherBrainBody.lowerNeckMovementIndex
    LDA.W #$9000

+   STA.L MotherBrainBody.lowerNeckAngle
    RTS


;;; $9109: Handle Mother Brain's neck - upper ;;;
HandleMotherBrainsNeck_Upper:
    LDA.L MotherBrainBody.upperNeckMovementIndex : TAX
    JMP.W (.pointers,X)

  .pointers:
    dw RTS_A9911B
    dw HandleMotherBrainsNeck_Upper_3_BobDown
    dw HandleMotherBrainsNeck_Upper_4_BobUp
    dw HandleMotherBrainsNeck_Upper_6_Lower
    dw HandleMotherBrainsNeck_Upper_8_Raise


;;; $911B: RTS. Handle Mother Brain's neck - upper - movement index = 0: nothing ;;;
RTS_A9911B:
    RTS


;;; $911C: Handle Mother Brain's neck - upper - movement index = 2: bob down ;;;
HandleMotherBrainsNeck_Upper_3_BobDown:
    LDA.W Enemy[1].YPosition : CLC : ADC.W #$0004 : CMP.W SamusYPosition : BMI +
    LDA.W #$0004 : STA.L MotherBrainBody.lowerNeckMovementIndex : STA.L MotherBrainBody.upperNeckMovementIndex
    RTS

+   LDA.L MotherBrainBody.upperNeckAngle : SEC : SBC.L MotherBrainBody.neckAngleDelta : CMP.W #$2000 : BCS +
    LDA.W #$0004 : STA.L MotherBrainBody.upperNeckMovementIndex
    LDA.W #$2000

+   STA.L MotherBrainBody.upperNeckAngle
    RTS


;;; $9151: Handle Mother Brain's neck - upper - movement index = 4: bob up ;;;
HandleMotherBrainsNeck_Upper_4_BobUp:
    LDA.L MotherBrainBody.lowerNeckAngle : CLC : ADC.W #$0800 : STA.B DP_Temp12
    LDA.L MotherBrainBody.upperNeckAngle : CLC : ADC.L MotherBrainBody.neckAngleDelta : CMP.B DP_Temp12 : BCC +
    LDA.W #$0002 : STA.L MotherBrainBody.upperNeckMovementIndex
    LDA.B DP_Temp12

+   STA.L MotherBrainBody.upperNeckAngle
    RTS


;;; $9176: Handle Mother Brain's neck - upper - movement index = 6: lower ;;;
HandleMotherBrainsNeck_Upper_6_Lower:
    LDA.L MotherBrainBody.upperNeckAngle : SEC : SBC.L MotherBrainBody.neckAngleDelta : CMP.W #$2000 : BCS +
    LDA.W #$0000 : STA.L MotherBrainBody.upperNeckMovementIndex
    LDA.W #$2000

+   STA.L MotherBrainBody.upperNeckAngle
    RTS


;;; $9193: Handle Mother Brain's neck - upper - movement index = 8: raise ;;;
HandleMotherBrainsNeck_Upper_8_Raise:
    LDA.L MotherBrainBody.lowerNeckAngle : CLC : ADC.W #$0800 : STA.B DP_Temp12
    LDA.L MotherBrainBody.upperNeckAngle : CLC : ADC.L MotherBrainBody.neckAngleDelta : CMP.B DP_Temp12 : BCC +
    LDA.W #$0000 : STA.L MotherBrainBody.upperNeckMovementIndex
    LDA.B DP_Temp12

+   STA.L MotherBrainBody.upperNeckAngle
    RTS


;;; $91B8: Handle Mother Brain's neck ;;;
HandleMotherBrainsNeck:
; See https://patrickjohnston.org/ASM/ROM%20data/Super%20Metroid/MB%20reference%20point.png about $7E:7814/16
    LDA.W #$FFB0 : CLC : ADC.W Enemy.XPosition : STA.L MotherBrainBody.XPosition
    LDA.W #$002E : CLC : ADC.W Enemy.YPosition : STA.L MotherBrainBody.YPosition
    LDA.L MotherBrainBody.enableNeckMovementFlag : BEQ .neckMovementDisabled
    JSR HandleMotherBrainsNeck_Lower
    JSR HandleMotherBrainsNeck_Upper

  .neckMovementDisabled:
    LDA.L MotherBrainBody.lowerNeckAngle+1 : AND.W #$00FF : STA.B DP_Temp12
    LDA.L MotherBrainBody.neckSegment0Distance
    JSL GetSineMathInA_A9C460
    CLC : ADC.L MotherBrainBody.XPosition
    CLC : ADC.W #$0070 : STA.L MotherBrainBody.neckSegment0XPosition
    LDA.L MotherBrainBody.neckSegment0Distance
    JSL GetCosineMathInA_A9C465
    CLC : ADC.L MotherBrainBody.YPosition
    CLC : ADC.W #$FFA0 : STA.L MotherBrainBody.neckSegment0YPosition
    LDA.L MotherBrainBody.neckSegment1Distance
    JSL GetSineMathInA_A9C460
    CLC : ADC.L MotherBrainBody.XPosition
    CLC : ADC.W #$0070 : STA.L MotherBrainBody.neckSegment1XPosition
    LDA.L MotherBrainBody.neckSegment1Distance
    JSL GetCosineMathInA_A9C465
    CLC : ADC.L MotherBrainBody.YPosition
    CLC : ADC.W #$FFA0 : STA.L MotherBrainBody.neckSegment1YPosition
    LDA.L MotherBrainBody.neckSegment2Distance
    JSL GetSineMathInA_A9C460
    CLC : ADC.L MotherBrainBody.XPosition
    CLC : ADC.W #$0070 : STA.L MotherBrainBody.neckSegment2XPosition
    LDA.L MotherBrainBody.neckSegment2Distance
    JSL GetCosineMathInA_A9C465
    CLC : ADC.L MotherBrainBody.YPosition
    CLC : ADC.W #$FFA0 : STA.L MotherBrainBody.neckSegment2YPosition
    LDA.L MotherBrainBody.upperNeckAngle+1 : AND.W #$00FF : STA.B DP_Temp12
    LDA.L MotherBrainBody.neckSegment3Distance
    JSL GetSineMathInA_A9C460
    CLC : ADC.L MotherBrainBody.neckSegment2XPosition : STA.L MotherBrainBody.neckSegment3XPosition
    LDA.L MotherBrainBody.neckSegment3Distance
    JSL GetCosineMathInA_A9C465
    CLC : ADC.L MotherBrainBody.neckSegment2YPosition : STA.L MotherBrainBody.neckSegment3YPosition
    LDA.L MotherBrainBody.neckSegment4Distance
    JSL GetSineMathInA_A9C460
    CLC : ADC.L MotherBrainBody.neckSegment2XPosition : STA.L MotherBrainBody.neckSegment4XPosition
    LDA.L MotherBrainBody.neckSegment4Distance
    JSL GetCosineMathInA_A9C465
    CLC : ADC.L MotherBrainBody.neckSegment2YPosition : STA.L MotherBrainBody.neckSegment4YPosition
    RTS


;;; $92AF: Y = Mother Brain brain spritemap pointer ;;;
GetMotherBrainHeadSpritemapPointerInY:
    LDA.W TimeIsFrozenFlag : BNE .timeFrozen
    LDA.L MotherBrainBody.brainInstListPointer : BMI .processInstList

  .noDraw:
    PLA
    RTS

  .timeFrozen:
    LDA.L MotherBrainBody.brainInstListPointer : BPL .noDraw
    TAX
    LDY.W $0002,X
    RTS

  .processInstList:
    TAX
    LDA.W $0000,X : BMI .ASMInstruction
    CMP.L MotherBrainBody.brainInstructionTimer : BPL .tick
    INX #4

  .loop:
    LDA.W $0000,X : BPL .specialInstruction

  .ASMInstruction:
    STA.B DP_Temp00
    INX #2
    PEA .loop-1
    JMP.W (DP_Temp00)

  .specialInstruction:
    LDA.W #$0001 : STA.L MotherBrainBody.brainInstructionTimer
    TXA : STA.L MotherBrainBody.brainInstListPointer
    LDY.W $0002,X
    RTS

  .tick:
    LDA.L MotherBrainBody.brainInstructionTimer : INC : STA.L MotherBrainBody.brainInstructionTimer
    LDY.W $0002,X
    RTS


;;; $9303: Draw Mother Brain's neck ;;;
DrawMotherBrainsNeck:
    LDA.W Enemy.properties : AND.W #$0100 : BEQ .visible
    RTS

  .visible:
    LDA.L MotherBrainBody.neckSegment4XPosition : STA.B DP_Temp12
    LDA.L MotherBrainBody.neckSegment4YPosition : STA.B DP_Temp14
    JSR DrawMotherBrainNeckSegment
    LDA.L MotherBrainBody.neckSegment3XPosition : STA.B DP_Temp12
    LDA.L MotherBrainBody.neckSegment3YPosition : STA.B DP_Temp14
    JSR DrawMotherBrainNeckSegment
    LDA.L MotherBrainBody.neckSegment2XPosition : STA.B DP_Temp12
    LDA.L MotherBrainBody.neckSegment2YPosition : STA.B DP_Temp14
    JSR DrawMotherBrainNeckSegment
    LDA.L MotherBrainBody.neckSegment1XPosition : STA.B DP_Temp12
    LDA.L MotherBrainBody.neckSegment1YPosition : STA.B DP_Temp14
    JSR DrawMotherBrainNeckSegment
    LDA.L MotherBrainBody.neckSegment0XPosition : STA.B DP_Temp12
    LDA.L MotherBrainBody.neckSegment0YPosition : STA.B DP_Temp14
    JMP DrawMotherBrainNeckSegment


;;; $9357: Draw Mother Brain brain ;;;
DrawMotherBrainHead:
; Note that the call to GetMotherBrainHeadSpritemapPointerInY can return out of *this* routine if no spritemap is to be drawn,
; and is assuming that nothing gets pushed to the stack by this routine
; (and also assuming this routine returns by RTS)
    LDA.L MotherBrainBody.smallPurpleBreathGenerationEnabledFlag : BEQ .getSpritemap
    LDA.L MotherBrainBody.smallPurpleBreathActiveFlag : BNE .getSpritemap
    LDA.W RandomNumberSeed : BMI .getSpritemap
    LDY.W #EnemyProjectile_MotherBrainPurpleBreath_Small
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics

  .getSpritemap:
    JSR GetMotherBrainHeadSpritemapPointerInY
    LDA.L MotherBrainBody.brainPalleteIndex : TAX
    LDA.W Enemy[1].flashTimer : LSR : BCC .evenInvincibilityTimer
    LDX.W #$0000

  .evenInvincibilityTimer:
    STX.B DP_Temp16
    LDA.L MotherBrainBody.brainMainShakeTimer : BEQ .nonZeroShakeTimer
    DEC : STA.L MotherBrainBody.brainMainShakeTimer
    BRA +

  .nonZeroShakeTimer:
    LDA.W Enemy[1].flashTimer : BNE +
    LDA.W Enemy[1].shakeTimer

+   AND.W #$0006 : TAX
    LDA.W ShakingOffsets_X,X : CLC : ADC.W Enemy[1].XPosition : STA.B DP_Temp12
    CLC : ADC.W #$0020
    SEC : SBC.W Layer1XPosition : BMI .return
    LDA.W ShakingOffsets_Y,X : CLC : ADC.W Enemy[1].YPosition : STA.B DP_Temp14
    JMP AddSpritemapToOAM_RoomCoordinates

  .return:
    RTS


;;; $93BB: Shaking offsets ;;;
; Used for Mother Brain brain shaking and when Shitroid shakes
ShakingOffsets_X:
    dw $0000,$FFFF,$0000,$0001

ShakingOffsets_Y:
    dw $0000,$0001,$FFFF,$0001


;;; $93CB: Draw Mother Brain neck segment ;;;
DrawMotherBrainNeckSegment:
;; Parameters:
;;     $12: Neck segment X position
;;     $14: Neck segment Y position
    LDA.W Enemy[1].flashTimer : AND.W #$0006 : TAX
    LDA.W ShakingOffsets_X,X : CLC : ADC.B DP_Temp12 : STA.B DP_Temp12
    LDA.W ShakingOffsets_Y,X : CLC : ADC.B DP_Temp14 : STA.B DP_Temp14
    LDA.L MotherBrainBody.neckPalleteIndex : STA.B DP_Temp16
    LDY.W #Spritemaps_MotherBrain_5
    JMP AddSpritemapToOAM_RoomCoordinates ; >.<


;;; $93EE: Add spritemap to OAM ;;;
AddSpritemapToOAM_RoomCoordinates:
;; Parameters:
;;     DB:YYYY = address of spritemap
;;     $12     = X position of spritemap centre
;;     $14     = Y position of spritemap centre
;;     $16     = palette bits of sprite (palette * 200h)

; Compared to the usual 'add spritemap to OAM' routine,
; this one's X/Y position parameters ($12/14) are room co-ordinates rather than screen co-ordinates,
; and this one doesn't draw sprites that start above the screen (and otherwise has no off-screen handling)

; Spritemap format is roughly:
;     nnnn         ; Number of entries (2 bytes)
;     xxxx yy aatt ; Entry 0 (5 bytes)
;     ...          ; Entry 1...
; Where:
;     n = number of entries
;     x = X offset of sprite from centre
;     y = Y offset of sprite from centre
;     a = attributes
;     t = tile number

; More specifically, a spritemap entry is:
;     s000000xxxxxxxxx yyyyyyyy YXppPPPttttttttt
; Where:
;     s = size bit
;     x = X offset of sprite from centre
;     y = Y offset of sprite from centre
;     Y = Y flip
;     X = X flip
;     P = palette
;     p = priority (relative to background)
;     t = tile number
    LDA.W $0000,Y
    INY #2
    STA.B DP_Temp18
    LDX.W OAMStack
    CLC

  .loop:
    LDA.W $0001,Y : AND.W #$FF00 : BPL +
    ORA.W #$00FF

+   XBA : CLC : ADC.B DP_Temp14
    SEC : SBC.W Layer1YPosition : BMI .next
    STA.B DP_Temp1A
    LDA.W $0000,Y : ADC.B DP_Temp12
    SEC : SBC.W Layer1XPosition : STA.W OAMLow,X
    AND.W #$0100 : BEQ .checkSizeBit
    LDA.L MapOfOAMIndexToHighOAM_address,X : STA.B DP_Temp1C
    LDA.B (DP_Temp1C) : ORA.L MapOfOAMIndex_highXPosBit,X : STA.B (DP_Temp1C)

  .checkSizeBit:
    LDA.W $0000,Y : BPL +
    LDA.L MapOfOAMIndexToHighOAM_address,X : STA.B DP_Temp1C
    LDA.B (DP_Temp1C) : ORA.L MapOfOAMIndex_sizeBit,X : STA.B (DP_Temp1C)

+   LDA.B DP_Temp1A : STA.W OAMLow+1,X
    LDA.W $0003,Y : ORA.B DP_Temp16 : STA.W OAMLow+2,X
    TXA : CLC : ADC.W #$0004 : AND.W #$01FF : TAX

  .next:
    TYA : CLC : ADC.W #$0005 : TAY
    DEC.B DP_Temp18 : BNE .loop
    STX.W OAMStack
    RTS


;;; $9466: Calculate Mother Brain rainbow beam HDMA tables ;;;
Calculate_MotherBrain_RainbowBeam_HDMATables:
    PHB
    PEA.W CalculateMotherBrainRainbowBeamHDMATables>>8&$FF00 : PLB : PLB
    JSL CalculateMotherBrainRainbowBeamHDMATables
    PLB
    RTL


;;; $9472: Palette - enemy $EC3F/$EC7F/$ECFF (Mother Brain) ;;;
Palette_MotherBrain:
    dw $3800,$269F,$0159,$004C,$0004,$5739,$4273,$2DAD
    dw $14C6,$367F,$29F9,$2173,$150C,$0C86,$7FFF,$0000


;;; $9492: Mother Brain palettes ;;;
; Colour 0 is never read
Palette_MotherBrain_BackLeg:
; Sprite palette 3 - Mother Brain's back leg
    dw $3800,$0000,$0000,$0000,$0024,$29AD,$214A,$14E7
    dw $0C63,$0000,$0000,$0000,$0000,$0000,$29AD,$0000

Palette_MotherBrain_Attacks:
; Sprite palette 2 - Mother Brain's attacks
    dw $3800,$7FE0,$6B20,$5640,$03FF,$02BF,$015F,$001F
    dw $29F9,$2173,$150C,$6318,$4631,$294A,$7FFF,$0C63

Palette_MotherBrain_BabyMetroid:
; Sprite palette 7 - Baby Metroid
    dw $3800,$57B8,$0B11,$1646,$00E3,$72FF,$2CDF,$24B9
    dw $1CAF,$18A9,$4F9F,$3ED8,$2E12,$08CD,$7FFF,$0000

Palette_MotherBrain_TubeProjectiles:
; Sprite palette 7 - tube enemy projectiles
    dw $3800,$6318,$6318,$0802,$5294,$39CE,$2108,$1084
    dw $0019,$0012,$5C00,$4000,$1084,$197F,$7FFF,$0000

Palette_MotherBrain_GlassShards:
; Sprite palette 3 - glass shards
    dw $3800,$5294,$39CE,$2108,$7F8B,$6F0A,$5E88,$4E07
    dw $3986,$2905,$1883,$0802,$1084,$6318,$7FFF,$0000

Palette_MotherBrain_ExplodedDoor:
; Sprite palette 1 - exploded escape door particles
    dw $3800,$4D1F,$38B6,$246E,$1448,$47FF,$2EFA,$1616
    dw $0132,$5294,$4210,$318C,$2108,$1084,$7FFF,$0000


;;; $9552: Move Mother Brain body down by [A], scroll it left by [X] ;;;
MoveMotherBrainBodyDownByA_ScrollLeftByX:
; This function expects X to have been pushed
    PHA
    CLC : ADC.W Enemy.YPosition : STA.W Enemy.YPosition
    PLA : EOR.W #$FFFF : INC
    CLC : ADC.B DP_BG2YScroll : STA.B DP_BG2YScroll
    TXA : CLC : ADC.W #$0022 : STA.B DP_Temp14
    LDA.W Enemy.XPosition : EOR.W #$FFFF : INC
    CLC : ADC.B DP_Temp14 : STA.B DP_BG2XScroll
    PLX
    RTL


;;; $9579: Move Mother Brain body down by [A] ;;;
MoveMotherBrainBodyDownByA:
    PHA
    CLC : ADC.W Enemy.YPosition : STA.W Enemy.YPosition
    PLA : EOR.W #$FFFF : INC
    CLC : ADC.B DP_BG2YScroll : STA.B DP_BG2YScroll
    LDA.W #$0000 : SEC : SBC.W Enemy.XPosition
    CLC : ADC.W #$0022 : STA.B DP_BG2XScroll
    RTL


;;; $9599: Mother Brain footstep effect ;;;
MotherBrainFootstepEffect:
; Callers are setting A before calling this routine... Oh well
; The sound effect (that doesn't play) is a crunchy footstep that plays when Mother Brain is being attacked by Shitroid
    LDA.W #$0001 : STA.W EarthquakeType
    LDA.W #$0004 : STA.W EarthquakeTimer
    LDA.L MotherBrainBody.form : CMP.W #$0003 : BNE .return
    LDA.W #$0016 : STA.L QueueSound_Lib3_Max6 ; >_<

  .return:
    RTS


;;; $95B6: Instruction - move Mother Brain body up by 10px, scroll it left by 4px ;;;
Instruction_MotherBrainBody_MoveBodyUpBy10_ScrollLeftBy4:
    PHX
    LDX.W #$0004
    LDA.W #$FFF6
    JMP MoveMotherBrainBodyDownByA_ScrollLeftByX


;;; $95C0: Instruction - move Mother Brain body up by 16px, scroll it left by 4px ;;;
Instruction_MotherBrainBody_MoveBodyUpBy16_ScrollLeftBy4:
    PHX
    LDX.W #$0004
    LDA.W #$FFF0
    JMP MoveMotherBrainBodyDownByA_ScrollLeftByX


;;; $95CA: Instruction - move Mother Brain body up by 12px, scroll it right by 2px ;;;
Instruction_MotherBrainBody_MoveBodyUpBy12_ScrollRightBy2:
    PHX
    LDX.W #$FFFE
    LDA.W #$FFF4
    JMP MoveMotherBrainBodyDownByA_ScrollLeftByX


if !FEATURE_KEEP_UNREFERENCED
;;; $95D4: Unused. Instruction - scroll Mother Brain body right by 2px ;;;
UNUSED_Instruction_MotherBrainBody_MoveBodyRightBy2_A995D4:
    PHX
    LDX.W #$FFFE
    LDA.W #$0000
    JMP MoveMotherBrainBodyDownByA_ScrollLeftByX
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $95DE: Instruction - move Mother Brain body down by 12px, scroll it left by 4px ;;;
Instruction_MotherBrainBody_MoveBodyDownBy12_ScrollLeftBy4:
    PHX
    LDX.W #$0004
    LDA.W #$000C
    JMP MoveMotherBrainBodyDownByA_ScrollLeftByX


;;; $95E8: Instruction - move Mother Brain body down by 16px, scroll it right by 2px ;;;
Instruction_MotherBrainBody_MoveBodyDownBy16_ScrollRightBy2:
    PHX
    LDX.W #$FFFE
    LDA.W #$0010
    JMP MoveMotherBrainBodyDownByA_ScrollLeftByX


;;; $95F2: Instruction - move Mother Brain body down by 10px, scroll it right by 2px ;;;
Instruction_MotherBrainBody_MoveBodyDownBy10_ScrollRightBy2:
    PHX
    LDX.W #$FFFE
    LDA.W #$000A
    JMP MoveMotherBrainBodyDownByA_ScrollLeftByX


;;; $95FC: Instruction - move Mother Brain body up by 2px and right by 1px ;;;
Instruction_MotherBrainBody_MoveBodyUpBy2_ScrollRightBy1:
    LDA.W Enemy.XPosition : CLC : ADC.W #$0001 : STA.W Enemy.XPosition
    LDA.W #$FFFE
    JMP MoveMotherBrainBodyDownByA


;;; $960C: Instruction - move Mother Brain body right by 2px ;;;
Instruction_MotherBrainBody_MoveBodyRightBy2:
    LDA.W Enemy.XPosition : CLC : ADC.W #$0002 : STA.W Enemy.XPosition
    LDA.W #$0000
    JMP MoveMotherBrainBodyDownByA


;;; $961C: Instruction - move Mother Brain body up by 1px ;;;
Instruction_MotherBrainBody_MoveBodyUpBy1:
    LDA.W #$0001
    JMP MoveMotherBrainBodyDownByA


;;; $9622: Instruction - move Mother Brain body up by 1px and right by 3px, do footstep effect ;;;
Instruction_MotherBrainBody_MoveBodyUpBy1_RightBy3_Footstep:
    LDA.W #$0022
    JSR MotherBrainFootstepEffect
    LDA.W Enemy.XPosition : CLC : ADC.W #$0003 : STA.W Enemy.XPosition
    LDA.W #$0001
    JMP MoveMotherBrainBodyDownByA


;;; $9638: Instruction - move Mother Brain body down by 2px and right by 15px ;;;
Instruction_MotherBrainBody_MoveBodyDownBy2_RightBy15:
    LDA.W Enemy.XPosition : CLC : ADC.W #$000F : STA.W Enemy.XPosition
    LDA.W #$FFFE
    JMP MoveMotherBrainBodyDownByA


;;; $9648: Instruction - move Mother Brain body down by 4px and right by 6px ;;;
Instruction_MotherBrainBody_MoveBodyDownBy4_RightBy6:
    LDA.W Enemy.XPosition : CLC : ADC.W #$0006 : STA.W Enemy.XPosition
    LDA.W #$FFFC
    JMP MoveMotherBrainBodyDownByA


;;; $9658: Instruction - move Mother Brain body up by 4px and left by 2px ;;;
Instruction_MotherBrainBody_MoveBodyUpBy4_LeftBy2:
    LDA.W Enemy.XPosition : CLC : ADC.W #$FFFE : STA.W Enemy.XPosition
    LDA.W #$0004
    JMP MoveMotherBrainBodyDownByA


;;; $9668: Instruction - move Mother Brain body up by 2px and left by 1px, do footstep effect ;;;
Instruction_MotherBrainBody_MoveBodyUpBy2_LeftBy1_Footstep:
    LDA.W #$FFEF
    JSR MotherBrainFootstepEffect
    LDA.W Enemy.XPosition : CLC : ADC.W #$FFFF : STA.W Enemy.XPosition
    LDA.W #$0002
    JMP MoveMotherBrainBodyDownByA


;;; $967E: Instruction - move Mother Brain body up by 2px and left by 1px, do footstep effect ;;;
Instruction_MotherBrainBody_MoveBodyUpBy2_LeftBy1_Footstep_duplicate:
    LDA.W #$000B
    JSR MotherBrainFootstepEffect
    LDA.W Enemy.XPosition : SEC : SBC.W #$0001 : STA.W Enemy.XPosition
    LDA.W #$0002
    JMP MoveMotherBrainBodyDownByA


;;; $9694: Instruction - move Mother Brain body left by 2px ;;;
Instruction_MotherBrainBody_MoveBodyLeftBy2:
    LDA.W Enemy.XPosition : SEC : SBC.W #$0002 : STA.W Enemy.XPosition
    LDA.W #$0000
    JMP MoveMotherBrainBodyDownByA


;;; $96A4: Instruction - move Mother Brain body down by 1px ;;;
Instruction_MotherBrainBody_MoveBodyDownBy1:
    LDA.W #$FFFF
    JMP MoveMotherBrainBodyDownByA


;;; $96AA: Instruction - move Mother Brain body down by 1px and left by 3px ;;;
Instruction_MotherBrainBody_MoveBodyDownBy1_LeftBy3:
    LDA.W Enemy.XPosition : SEC : SBC.W #$0003 : STA.W Enemy.XPosition
    LDA.W #$FFFF
    JMP MoveMotherBrainBodyDownByA


;;; $96BA: Instruction - move Mother Brain body up by 2px and left by 15px, do footstep effect ;;;
Instruction_MotherBrainBody_MoveBodyUpBy2_LeftBy15_Footstep:
    LDA.W #$FFDB
    JSR MotherBrainFootstepEffect
    LDA.W Enemy.XPosition : SEC : SBC.W #$000F : STA.W Enemy.XPosition
    LDA.W #$0002
    JMP MoveMotherBrainBodyDownByA


;;; $96D0: Instruction - move Mother Brain body up by 4px and left by 6px ;;;
Instruction_MotherBrainBody_MoveBodyUpBy4_LeftBy6:
    LDA.W Enemy.XPosition : SEC : SBC.W #$0006 : STA.W Enemy.XPosition
    LDA.W #$0004
    JMP MoveMotherBrainBodyDownByA


;;; $96E0: Instruction - move Mother Brain body down by 4px and right by 2px ;;;
Instruction_MotherBrainBody_MoveBodyDownBy4_RightBy2:
    LDA.W Enemy.XPosition : SEC : SBC.W #$FFFE : STA.W Enemy.XPosition
    LDA.W #$FFFC
    JMP MoveMotherBrainBodyDownByA


;;; $96F0: Instruction - move Mother Brain body down by 2px and right by 1px ;;;
Instruction_MotherBrainBody_MoveBodyDownBy2_RightBy1:
    LDA.W Enemy.XPosition : SEC : SBC.W #$FFFF : STA.W Enemy.XPosition
    LDA.W #$FFFE
    JMP MoveMotherBrainBodyDownByA


;;; $9700: Instruction - Mother Brain's pose = standing ;;;
Instruction_MotherBrainBody_SetPoseToStanding:
    LDA.W #$0000 : STA.L MotherBrainBody.pose
    RTL


;;; $9708: Instruction - Mother Brain's pose = walking ;;;
Instruction_MotherBrainBody_SetPoseToWalking:
    LDA.W #$0001 : STA.L MotherBrainBody.pose
    RTL


;;; $9710: Instruction - Mother Brain's pose = crouched ;;;
Instruction_MotherBrainBody_SetPoseToCrouching:
    LDA.W #$0003 : STA.L MotherBrainBody.pose
    RTL


;;; $9718: Instruction - Mother Brain's pose = crouching transition ;;;
Instruction_MotherBrainBody_SetPoseToCrouchingTransition:
    LDA.W #$0002 : STA.L MotherBrainBody.pose
    RTL


;;; $9720: Instruction - Mother Brain's pose = death beam mode ;;;
Instruction_MotherBrainBody_SetPoseToDeathBeamMode:
    LDA.W #$0004 : STA.L MotherBrainBody.pose
    RTL


;;; $9728: Instruction - Mother Brain's pose = leaning down ;;;
Instruction_MotherBrainBody_SetPoseToLeaningDown:
    LDA.W #$0006 : STA.L MotherBrainBody.pose
    RTL


;;; $9730: Instruction list - Mother Brain body - walking forwards - really fast ;;;
InstList_MotherBrainBody_WalkingForwards_ReallyFast:
    dw Instruction_MotherBrainBody_SetPoseToWalking
    dw $0002,ExtendedSpritemap_MotherBrainBody_Standing
    dw Instruction_MotherBrainBody_MoveBodyUpBy2_ScrollRightBy1
    dw $0002,ExtendedSpritemap_MotherBrainBody_Walking_0
    dw Instruction_MotherBrainBody_MoveBodyRightBy2
    dw $0002,ExtendedSpritemap_MotherBrainBody_Walking_1
    dw Instruction_MotherBrainBody_MoveBodyUpBy1
    dw $0002,ExtendedSpritemap_MotherBrainBody_Walking_2
    dw Instruction_MotherBrainBody_MoveBodyUpBy1_RightBy3_Footstep
    dw $0002,ExtendedSpritemap_MotherBrainBody_Walking_3
    dw Instruction_MotherBrainBody_MoveBodyDownBy2_RightBy15
    dw $0002,ExtendedSpritemap_MotherBrainBody_Walking_4
    dw Instruction_MotherBrainBody_MoveBodyDownBy4_RightBy6
    dw $0002,ExtendedSpritemap_MotherBrainBody_Walking_5
    dw Instruction_MotherBrainBody_MoveBodyUpBy4_LeftBy2
    dw $0002,ExtendedSpritemap_MotherBrainBody_Walking_6
    dw Instruction_MotherBrainBody_MoveBodyUpBy2_LeftBy1_Footstep
    dw Instruction_MotherBrainBody_SetPoseToStanding
    dw $0002,ExtendedSpritemap_MotherBrainBody_Walking_7
    dw Instruction_Common_Sleep


;;; $976A: Instruction list - Mother Brain body - walking forwards - fast ;;;
InstList_MotherBrainBody_WalkingForwards_Fast:
    dw Instruction_MotherBrainBody_SetPoseToWalking
    dw $0004,ExtendedSpritemap_MotherBrainBody_Standing
    dw Instruction_MotherBrainBody_MoveBodyUpBy2_ScrollRightBy1
    dw $0004,ExtendedSpritemap_MotherBrainBody_Walking_0
    dw Instruction_MotherBrainBody_MoveBodyRightBy2
    dw $0004,ExtendedSpritemap_MotherBrainBody_Walking_1
    dw Instruction_MotherBrainBody_MoveBodyUpBy1
    dw $0004,ExtendedSpritemap_MotherBrainBody_Walking_2
    dw Instruction_MotherBrainBody_MoveBodyUpBy1_RightBy3_Footstep
    dw $0004,ExtendedSpritemap_MotherBrainBody_Walking_3
    dw Instruction_MotherBrainBody_MoveBodyDownBy2_RightBy15
    dw $0004,ExtendedSpritemap_MotherBrainBody_Walking_4
    dw Instruction_MotherBrainBody_MoveBodyDownBy4_RightBy6
    dw $0004,ExtendedSpritemap_MotherBrainBody_Walking_5
    dw Instruction_MotherBrainBody_MoveBodyUpBy4_LeftBy2
    dw $0004,ExtendedSpritemap_MotherBrainBody_Walking_6
    dw Instruction_MotherBrainBody_MoveBodyUpBy2_LeftBy1_Footstep
    dw Instruction_MotherBrainBody_SetPoseToStanding
    dw $0004,ExtendedSpritemap_MotherBrainBody_Walking_7
    dw Instruction_Common_Sleep


;;; $97A4: Instruction list - Mother Brain body - walking forwards - medium ;;;
InstList_MotherBrainBody_WalkingForwards_Medium:
    dw Instruction_MotherBrainBody_SetPoseToWalking
    dw $0006,ExtendedSpritemap_MotherBrainBody_Standing
    dw Instruction_MotherBrainBody_MoveBodyUpBy2_ScrollRightBy1
    dw $0006,ExtendedSpritemap_MotherBrainBody_Walking_0
    dw Instruction_MotherBrainBody_MoveBodyRightBy2
    dw $0006,ExtendedSpritemap_MotherBrainBody_Walking_1
    dw Instruction_MotherBrainBody_MoveBodyUpBy1
    dw $0006,ExtendedSpritemap_MotherBrainBody_Walking_2
    dw Instruction_MotherBrainBody_MoveBodyUpBy1_RightBy3_Footstep
    dw $0006,ExtendedSpritemap_MotherBrainBody_Walking_3
    dw Instruction_MotherBrainBody_MoveBodyDownBy2_RightBy15
    dw $0006,ExtendedSpritemap_MotherBrainBody_Walking_4
    dw Instruction_MotherBrainBody_MoveBodyDownBy4_RightBy6
    dw $0006,ExtendedSpritemap_MotherBrainBody_Walking_5
    dw Instruction_MotherBrainBody_MoveBodyUpBy4_LeftBy2
    dw $0006,ExtendedSpritemap_MotherBrainBody_Walking_6
    dw Instruction_MotherBrainBody_MoveBodyUpBy2_LeftBy1_Footstep
    dw Instruction_MotherBrainBody_SetPoseToStanding
    dw $0006,ExtendedSpritemap_MotherBrainBody_Walking_7
    dw Instruction_Common_Sleep


;;; $97DE: Instruction list - Mother Brain body - walking forwards - slow ;;;
InstList_MotherBrainBody_WalkingForwards_Slow:
    dw Instruction_MotherBrainBody_SetPoseToWalking
    dw $0008,ExtendedSpritemap_MotherBrainBody_Standing
    dw Instruction_MotherBrainBody_MoveBodyUpBy2_ScrollRightBy1
    dw $0008,ExtendedSpritemap_MotherBrainBody_Walking_0
    dw Instruction_MotherBrainBody_MoveBodyRightBy2
    dw $0008,ExtendedSpritemap_MotherBrainBody_Walking_1
    dw Instruction_MotherBrainBody_MoveBodyUpBy1
    dw $0008,ExtendedSpritemap_MotherBrainBody_Walking_2
    dw Instruction_MotherBrainBody_MoveBodyUpBy1_RightBy3_Footstep
    dw $0008,ExtendedSpritemap_MotherBrainBody_Walking_3
    dw Instruction_MotherBrainBody_MoveBodyDownBy2_RightBy15
    dw $0008,ExtendedSpritemap_MotherBrainBody_Walking_4
    dw Instruction_MotherBrainBody_MoveBodyDownBy4_RightBy6
    dw $0008,ExtendedSpritemap_MotherBrainBody_Walking_5
    dw Instruction_MotherBrainBody_MoveBodyUpBy4_LeftBy2
    dw $0008,ExtendedSpritemap_MotherBrainBody_Walking_6
    dw Instruction_MotherBrainBody_MoveBodyUpBy2_LeftBy1_Footstep
    dw Instruction_MotherBrainBody_SetPoseToStanding
    dw $0008,ExtendedSpritemap_MotherBrainBody_Walking_7
    dw Instruction_Common_Sleep


;;; $9818: Instruction list - Mother Brain body - walking forwards - really slow ;;;
InstList_MotherBrainBody_WalkingForwards_ReallySlow:
    dw Instruction_MotherBrainBody_SetPoseToWalking
    dw $000A,ExtendedSpritemap_MotherBrainBody_Standing
    dw Instruction_MotherBrainBody_MoveBodyUpBy2_ScrollRightBy1
    dw $000A,ExtendedSpritemap_MotherBrainBody_Walking_0
    dw Instruction_MotherBrainBody_MoveBodyRightBy2
    dw $000A,ExtendedSpritemap_MotherBrainBody_Walking_1
    dw Instruction_MotherBrainBody_MoveBodyUpBy1
    dw $000A,ExtendedSpritemap_MotherBrainBody_Walking_2
    dw Instruction_MotherBrainBody_MoveBodyUpBy1_RightBy3_Footstep
    dw $000A,ExtendedSpritemap_MotherBrainBody_Walking_3
    dw Instruction_MotherBrainBody_MoveBodyDownBy2_RightBy15
    dw $000A,ExtendedSpritemap_MotherBrainBody_Walking_4
    dw Instruction_MotherBrainBody_MoveBodyDownBy4_RightBy6
    dw $000A,ExtendedSpritemap_MotherBrainBody_Walking_5
    dw Instruction_MotherBrainBody_MoveBodyUpBy4_LeftBy2
    dw $000A,ExtendedSpritemap_MotherBrainBody_Walking_6
    dw Instruction_MotherBrainBody_MoveBodyUpBy2_LeftBy1_Footstep
    dw Instruction_MotherBrainBody_SetPoseToStanding
    dw $000A,ExtendedSpritemap_MotherBrainBody_Walking_7
    dw Instruction_Common_Sleep


;;; $9852: Instruction list - Mother Brain body - walking backwards - slow ;;;
InstList_MotherBrainBody_WalkingBackwards_Slow:
    dw Instruction_MotherBrainBody_SetPoseToWalking
    dw $0008,ExtendedSpritemap_MotherBrainBody_Walking_7
    dw Instruction_MotherBrainBody_MoveBodyDownBy2_RightBy1
    dw $0008,ExtendedSpritemap_MotherBrainBody_Walking_6
    dw Instruction_MotherBrainBody_MoveBodyDownBy4_RightBy2
    dw $0008,ExtendedSpritemap_MotherBrainBody_Walking_5
    dw Instruction_MotherBrainBody_MoveBodyUpBy4_LeftBy6
    dw $0008,ExtendedSpritemap_MotherBrainBody_Walking_4
    dw Instruction_MotherBrainBody_MoveBodyUpBy2_LeftBy15_Footstep
    dw $0008,ExtendedSpritemap_MotherBrainBody_Walking_3
    dw Instruction_MotherBrainBody_MoveBodyDownBy1_LeftBy3
    dw $0008,ExtendedSpritemap_MotherBrainBody_Walking_2
    dw Instruction_MotherBrainBody_MoveBodyDownBy1
    dw $0008,ExtendedSpritemap_MotherBrainBody_Walking_1
    dw Instruction_MotherBrainBody_MoveBodyLeftBy2
    dw $0008,ExtendedSpritemap_MotherBrainBody_Walking_0
    dw Instruction_MotherBrainBody_MoveBodyUpBy2_LeftBy1_Footstep_duplicate
    dw Instruction_MotherBrainBody_SetPoseToStanding
    dw $0008,ExtendedSpritemap_MotherBrainBody_Standing
    dw Instruction_Common_Sleep


;;; $988C: Instruction list - Mother Brain body - walking backwards - really fast ;;;
InstList_MotherBrainBody_WalkingBackwards_ReallyFast:
    dw Instruction_MotherBrainBody_SetPoseToWalking
    dw $0002,ExtendedSpritemap_MotherBrainBody_Walking_7
    dw Instruction_MotherBrainBody_MoveBodyDownBy2_RightBy1
    dw $0002,ExtendedSpritemap_MotherBrainBody_Walking_6
    dw Instruction_MotherBrainBody_MoveBodyDownBy4_RightBy2
    dw $0002,ExtendedSpritemap_MotherBrainBody_Walking_5
    dw Instruction_MotherBrainBody_MoveBodyUpBy4_LeftBy6
    dw $0002,ExtendedSpritemap_MotherBrainBody_Walking_4
    dw Instruction_MotherBrainBody_MoveBodyUpBy2_LeftBy15_Footstep
    dw $0002,ExtendedSpritemap_MotherBrainBody_Walking_3
    dw Instruction_MotherBrainBody_MoveBodyDownBy1_LeftBy3
    dw $0002,ExtendedSpritemap_MotherBrainBody_Walking_2
    dw Instruction_MotherBrainBody_MoveBodyDownBy1
    dw $0002,ExtendedSpritemap_MotherBrainBody_Walking_1
    dw Instruction_MotherBrainBody_MoveBodyLeftBy2
    dw $0002,ExtendedSpritemap_MotherBrainBody_Walking_0
    dw Instruction_MotherBrainBody_MoveBodyUpBy2_LeftBy1_Footstep_duplicate
    dw Instruction_MotherBrainBody_SetPoseToStanding
    dw $0002,ExtendedSpritemap_MotherBrainBody_Standing
    dw Instruction_Common_Sleep


;;; $98C6: Instruction list - Mother Brain body - walking backwards - fast ;;;
InstList_MotherBrainBody_WalkingBackwards_Fast:
    dw Instruction_MotherBrainBody_SetPoseToWalking
    dw $0004,ExtendedSpritemap_MotherBrainBody_Walking_7
    dw Instruction_MotherBrainBody_MoveBodyDownBy2_RightBy1
    dw $0004,ExtendedSpritemap_MotherBrainBody_Walking_6
    dw Instruction_MotherBrainBody_MoveBodyDownBy4_RightBy2
    dw $0004,ExtendedSpritemap_MotherBrainBody_Walking_5
    dw Instruction_MotherBrainBody_MoveBodyUpBy4_LeftBy6
    dw $0004,ExtendedSpritemap_MotherBrainBody_Walking_4
    dw Instruction_MotherBrainBody_MoveBodyUpBy2_LeftBy15_Footstep
    dw $0004,ExtendedSpritemap_MotherBrainBody_Walking_3
    dw Instruction_MotherBrainBody_MoveBodyDownBy1_LeftBy3
    dw $0004,ExtendedSpritemap_MotherBrainBody_Walking_2
    dw Instruction_MotherBrainBody_MoveBodyDownBy1
    dw $0004,ExtendedSpritemap_MotherBrainBody_Walking_1
    dw Instruction_MotherBrainBody_MoveBodyLeftBy2
    dw $0004,ExtendedSpritemap_MotherBrainBody_Walking_0
    dw Instruction_MotherBrainBody_MoveBodyUpBy2_LeftBy1_Footstep_duplicate
    dw Instruction_MotherBrainBody_SetPoseToStanding
    dw $0004,ExtendedSpritemap_MotherBrainBody_Standing
    dw Instruction_Common_Sleep


;;; $9900: Instruction list - Mother Brain body - walking backwards - medium ;;;
InstList_MotherBrainBody_WalkingBackwards_Medium:
    dw Instruction_MotherBrainBody_SetPoseToWalking
    dw $0006,ExtendedSpritemap_MotherBrainBody_Walking_7
    dw Instruction_MotherBrainBody_MoveBodyDownBy2_RightBy1
    dw $0006,ExtendedSpritemap_MotherBrainBody_Walking_6
    dw Instruction_MotherBrainBody_MoveBodyDownBy4_RightBy2
    dw $0006,ExtendedSpritemap_MotherBrainBody_Walking_5
    dw Instruction_MotherBrainBody_MoveBodyUpBy4_LeftBy6
    dw $0006,ExtendedSpritemap_MotherBrainBody_Walking_4
    dw Instruction_MotherBrainBody_MoveBodyUpBy2_LeftBy15_Footstep
    dw $0006,ExtendedSpritemap_MotherBrainBody_Walking_3
    dw Instruction_MotherBrainBody_MoveBodyDownBy1_LeftBy3
    dw $0006,ExtendedSpritemap_MotherBrainBody_Walking_2
    dw Instruction_MotherBrainBody_MoveBodyDownBy1
    dw $0006,ExtendedSpritemap_MotherBrainBody_Walking_1
    dw Instruction_MotherBrainBody_MoveBodyLeftBy2
    dw $0006,ExtendedSpritemap_MotherBrainBody_Walking_0
    dw Instruction_MotherBrainBody_MoveBodyUpBy2_LeftBy1_Footstep_duplicate
    dw Instruction_MotherBrainBody_SetPoseToStanding
    dw $0006,ExtendedSpritemap_MotherBrainBody_Standing
    dw Instruction_Common_Sleep


;;; $993A: Instruction list - Mother Brain body - walking backwards - really slow ;;;
InstList_MotherBrainBody_WalkingBackwards_ReallySlow:
    dw Instruction_MotherBrainBody_SetPoseToWalking
    dw $000A,ExtendedSpritemap_MotherBrainBody_Walking_7
    dw Instruction_MotherBrainBody_MoveBodyDownBy2_RightBy1
    dw $000A,ExtendedSpritemap_MotherBrainBody_Walking_6
    dw Instruction_MotherBrainBody_MoveBodyDownBy4_RightBy2
    dw $000A,ExtendedSpritemap_MotherBrainBody_Walking_5
    dw Instruction_MotherBrainBody_MoveBodyUpBy4_LeftBy6
    dw $000A,ExtendedSpritemap_MotherBrainBody_Walking_4
    dw Instruction_MotherBrainBody_MoveBodyUpBy2_LeftBy15_Footstep
    dw $000A,ExtendedSpritemap_MotherBrainBody_Walking_3
    dw Instruction_MotherBrainBody_MoveBodyDownBy1_LeftBy3
    dw $000A,ExtendedSpritemap_MotherBrainBody_Walking_2
    dw Instruction_MotherBrainBody_MoveBodyDownBy1
    dw $000A,ExtendedSpritemap_MotherBrainBody_Walking_1
    dw Instruction_MotherBrainBody_MoveBodyLeftBy2
    dw $000A,ExtendedSpritemap_MotherBrainBody_Walking_0
    dw Instruction_MotherBrainBody_MoveBodyUpBy2_LeftBy1_Footstep_duplicate
    dw Instruction_MotherBrainBody_SetPoseToStanding
    dw $000A,ExtendedSpritemap_MotherBrainBody_Standing
    dw Instruction_Common_Sleep


;;; $9974: Instruction list - Mother Brain body - crouch and then stand up ;;;
InstList_MotherBrainBody_CrouchAndThenStandUp:
    dw Instruction_MotherBrainBody_SetPoseToCrouchingTransition
    dw $0008,ExtendedSpritemap_MotherBrainBody_Standing
    dw Instruction_MotherBrainBody_MoveBodyDownBy12_ScrollLeftBy4
    dw $0008,ExtendedSpritemap_MotherBrainBody_LeaningDown
    dw Instruction_MotherBrainBody_MoveBodyDownBy16_ScrollRightBy2
    dw $0008,ExtendedSpritemap_MotherBrainBody_Uncrouching
    dw Instruction_MotherBrainBody_MoveBodyDownBy10_ScrollRightBy2
    dw Instruction_MotherBrainBody_SetPoseToCrouching
    dw $0008,ExtendedSpritemap_MotherBrainBody_Crouched
    dw $0008,ExtendedSpritemap_MotherBrainBody_Crouched
    dw Instruction_MotherBrainBody_MoveBodyUpBy10_ScrollLeftBy4
    dw Instruction_MotherBrainBody_SetPoseToCrouchingTransition
    dw $0008,ExtendedSpritemap_MotherBrainBody_Uncrouching
    dw Instruction_MotherBrainBody_MoveBodyUpBy16_ScrollLeftBy4
    dw $0008,ExtendedSpritemap_MotherBrainBody_LeaningDown
    dw Instruction_MotherBrainBody_MoveBodyUpBy12_ScrollRightBy2
    dw $0008,ExtendedSpritemap_MotherBrainBody_Standing
    dw Instruction_MotherBrainBody_SetPoseToStanding
    dw Instruction_Common_Sleep


;;; $99AA: Instruction list - Mother Brain body - standing up after crouching - slow ;;;
InstList_MotherBrainBody_StandingUpAfterCrouching_Slow:
    dw Instruction_MotherBrainBody_SetPoseToCrouchingTransition
    dw $0010,ExtendedSpritemap_MotherBrainBody_Crouched
    dw Instruction_MotherBrainBody_MoveBodyUpBy10_ScrollLeftBy4
    dw $0010,ExtendedSpritemap_MotherBrainBody_Uncrouching
    dw Instruction_MotherBrainBody_MoveBodyUpBy16_ScrollLeftBy4
    dw $0010,ExtendedSpritemap_MotherBrainBody_LeaningDown
    dw Instruction_MotherBrainBody_MoveBodyUpBy12_ScrollRightBy2
    dw $0010,ExtendedSpritemap_MotherBrainBody_Standing
    dw Instruction_MotherBrainBody_SetPoseToStanding
    dw Instruction_Common_Sleep


;;; $99C6: Instruction list - Mother Brain body - standing up after crouching - fast ;;;
InstList_MotherBrainBody_StandingUpAfterCrouching_Fast:
    dw Instruction_MotherBrainBody_SetPoseToCrouchingTransition
    dw $0008,ExtendedSpritemap_MotherBrainBody_Crouched
    dw Instruction_MotherBrainBody_MoveBodyUpBy10_ScrollLeftBy4
    dw $0008,ExtendedSpritemap_MotherBrainBody_Uncrouching
    dw Instruction_MotherBrainBody_MoveBodyUpBy16_ScrollLeftBy4
    dw $0008,ExtendedSpritemap_MotherBrainBody_LeaningDown
    dw Instruction_MotherBrainBody_MoveBodyUpBy12_ScrollRightBy2
    dw $0008,ExtendedSpritemap_MotherBrainBody_Standing
    dw Instruction_MotherBrainBody_SetPoseToStanding
    dw Instruction_Common_Sleep


;;; $99E2: Instruction list - Mother Brain body - standing up after leaning down ;;;
InstList_MotherBrainBody_StandingUpAfterLeaningDown:
    dw Instruction_MotherBrainBody_SetPoseToCrouchingTransition
    dw $0008,ExtendedSpritemap_MotherBrainBody_LeaningDown
    dw Instruction_MotherBrainBody_MoveBodyUpBy12_ScrollRightBy2
    dw $0008,ExtendedSpritemap_MotherBrainBody_Standing
    dw Instruction_MotherBrainBody_SetPoseToStanding
    dw Instruction_Common_Sleep


;;; $99F2: Instruction list - Mother Brain body - leaning down ;;;
InstList_MotherBrainBody_LeaningDown:
    dw Instruction_MotherBrainBody_SetPoseToCrouchingTransition
    dw $0008,ExtendedSpritemap_MotherBrainBody_Standing
    dw Instruction_MotherBrainBody_MoveBodyDownBy12_ScrollLeftBy4
    dw Instruction_MotherBrainBody_SetPoseToLeaningDown
    dw $0008,ExtendedSpritemap_MotherBrainBody_LeaningDown
    dw Instruction_Common_Sleep


;;; $9A02: Instruction list - Mother Brain body - crouched ;;;
InstList_MotherBrainBody_Crouched:
    dw Instruction_MotherBrainBody_SetPoseToCrouching
    dw $0008,ExtendedSpritemap_MotherBrainBody_Crouched
    dw Instruction_Common_Sleep


;;; $9A0A: Instruction list - Mother Brain body - crouch - slow ;;;
InstList_MotherBrainBody_Crouch_Slow:
    dw Instruction_MotherBrainBody_SetPoseToCrouchingTransition
    dw $0008,ExtendedSpritemap_MotherBrainBody_Standing
    dw Instruction_MotherBrainBody_MoveBodyDownBy12_ScrollLeftBy4
    dw $0008,ExtendedSpritemap_MotherBrainBody_LeaningDown
    dw Instruction_MotherBrainBody_MoveBodyDownBy16_ScrollRightBy2
    dw $0008,ExtendedSpritemap_MotherBrainBody_Uncrouching
    dw Instruction_MotherBrainBody_MoveBodyDownBy10_ScrollRightBy2
    dw Instruction_MotherBrainBody_SetPoseToCrouching
    dw $0008,ExtendedSpritemap_MotherBrainBody_Crouched
    dw Instruction_Common_Sleep


;;; $9A26: Instruction list - Mother Brain body - crouch - fast ;;;
InstList_MotherBrainBody_Crouch_Fast:
    dw Instruction_MotherBrainBody_SetPoseToCrouchingTransition
    dw $0008,ExtendedSpritemap_MotherBrainBody_Standing
    dw Instruction_MotherBrainBody_MoveBodyDownBy12_ScrollLeftBy4
    dw $0002,ExtendedSpritemap_MotherBrainBody_LeaningDown
    dw Instruction_MotherBrainBody_MoveBodyDownBy16_ScrollRightBy2
    dw $0002,ExtendedSpritemap_MotherBrainBody_Uncrouching
    dw Instruction_MotherBrainBody_MoveBodyDownBy10_ScrollRightBy2
    dw Instruction_MotherBrainBody_SetPoseToCrouching
    dw $0008,ExtendedSpritemap_MotherBrainBody_Crouched
    dw Instruction_Common_Sleep


;;; $9A42: Instruction list - Mother Brain body - death beam mode ;;;
InstList_MotherBrainBody_DeathBeamMode:
    dw Instruction_MotherBrainBody_SetPoseToDeathBeamMode
    dw $0001,ExtendedSpritemap_MotherBrainBody_Standing
    dw $0001,ExtendedSpritemap_MotherBrainBrain_DeathBeamMode_0
    dw $0001,ExtendedSpritemap_MotherBrainBrain_DeathBeamMode_1
    dw Instruction_MotherBrainBody_SpawnDustCloudExplosionProj
    dw $0024,$FFD8,$0001
    dw $0001,ExtendedSpritemap_MotherBrainBrain_DeathBeamMode_1
    dw Instruction_MotherBrainBody_SpawnDustCloudExplosionProj
    dw $0022,$FFD6,$0002
    dw $0001,ExtendedSpritemap_MotherBrainBrain_DeathBeamMode_1
    dw Instruction_MotherBrainBody_SpawnDustCloudExplosionProj
    dw $0024,$FFD8,$0001
    dw $0001,ExtendedSpritemap_MotherBrainBrain_DeathBeamMode_1
    dw Instruction_MotherBrainBody_SpawnDustCloudExplosionProj
    dw $0022,$FFD6,$0002
    dw $0001,ExtendedSpritemap_MotherBrainBrain_DeathBeamMode_1
    dw Instruction_MotherBrainBody_SpawnDustCloudExplosionProj
    dw $0024,$FFD8,$0001
    dw $0001,ExtendedSpritemap_MotherBrainBrain_DeathBeamMode_1
    dw Instruction_MotherBrainBody_SpawnDustCloudExplosionProj
    dw $0022,$FFD6,$0002
    dw $0001,ExtendedSpritemap_MotherBrainBrain_DeathBeamMode_1
    dw Instruction_MotherBrainBody_SpawnDustCloudExplosionProj
    dw $0024,$FFD8,$0001
    dw $0001,ExtendedSpritemap_MotherBrainBrain_DeathBeamMode_1
    dw Instruction_MotherBrainBody_SpawnDustCloudExplosionProj
    dw $0022,$FFD6,$0002
    dw $0001,ExtendedSpritemap_MotherBrainBrain_DeathBeamMode_1
    dw $0001,ExtendedSpritemap_MotherBrainBrain_DeathBeamMode_1
    dw Instruction_MotherBrainBody_SpawnDeathBeamProjectile
    dw $0001,ExtendedSpritemap_MotherBrainBrain_DeathBeamMode_2
    dw $0001,ExtendedSpritemap_MotherBrainBrain_DeathBeamMode_3
    dw $00F0,ExtendedSpritemap_MotherBrainBody_Standing
    dw Instruction_MotherBrainBody_IncrementDeathBeamAttackPhase
    dw Instruction_MotherBrainBody_SetPoseToStanding
    dw Instruction_Common_Sleep


;;; $9AC8: Instruction - spawn enemy projectile $E509 to offset ([[Y]], [[Y] + 2]) with parameter [[Y] + 4] ;;;
Instruction_MotherBrainBody_SpawnDustCloudExplosionProj:
; Offset is relative to Mother Brain body position
    PHY : PHX
    LDA.W $0000,Y : CLC : ADC.W Enemy.XPosition : STA.B DP_Temp12
    LDA.W $0002,Y : CLC : ADC.W Enemy.YPosition : STA.B DP_Temp14
    LDA.W $0004,Y
    LDY.W #EnemyProjectile_MiscDust
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    PLX : PLY
    INY #6
    RTL


;;; $9AEF: Instruction - spawn death beam enemy projectile ;;;
Instruction_MotherBrainBody_SpawnDeathBeamProjectile:
    PHX : PHY
    LDA.W #$0063
    JSL QueueSound_Lib2_Max6
    LDX.W #$0040
    LDY.W #EnemyProjectile_MotherBrainRedBeam_Charging
    JSL SpawnEnemyProjectileY_ParameterA_XGraphics
    PLY : PLX
    RTL


;;; $9B05: Instruction - increment Mother Brain death beam attack phase ;;;
Instruction_MotherBrainBody_IncrementDeathBeamAttackPhase:
    LDA.L MotherBrainBody.deathBeamAttackPhase : INC : STA.L MotherBrainBody.deathBeamAttackPhase
    RTL


;;; $9B0F: Instruction - go to [[X]] ;;;
Instruction_MotherBrain_GotoX:
    LDA.W $0000,X : TAX
    RTS


;;; $9B14: Instruction - enable Mother Brain neck movement and go to [[X]] ;;;
Instruction_MotherBrainHead_EnableNeckMovement_GotoX:
    LDA.W #$0001 : STA.L MotherBrainBody.enableNeckMovementFlag
    LDA.W $0000,X : TAX
    RTS


;;; $9B20: Instruction - disable Mother Brain neck movement ;;;
Instruction_MotherBrainHead_DisableNeckMovement:
    LDA.W #$0000 : STA.L MotherBrainBody.enableNeckMovementFlag
    RTS


;;; $9B28: Instruction - queue sound [[X]], sound library 2, max queued sounds allowed = 6 ;;;
Instruction_MotherBrainHead_QueueSoundX_Lib2_Max6:
    LDA.W $0000,X
    JSL QueueSound_Lib2_Max6
    INX #2
    RTS


;;; $9B32: Instruction - queue sound [[X]], sound library 3, max queued sounds allowed = 6 ;;;
Instruction_MotherBrainHead_QueueSoundX_Lib3_Max6:
    LDA.W $0000,X
    JSL QueueSound_Lib3_Max6
    INX #2
    RTS


;;; $9B3C: Instruction - spawn Mother Brain's drool enemy projectile ;;;
Instruction_MotherBrainHead_SpawnDroolProjectile:
    LDA.L MotherBrainBody.enableDroolGenerationFlag : BEQ .return
    PHY
    LDA.L MotherBrainBody.droolProjectileParam : INC : CMP.W #$0006 : BMI +
    LDA.W #$0000

+   STA.L MotherBrainBody.droolProjectileParam
    LDY.W #EnemyProjectile_MotherBrainDrool
    LDA.L MotherBrainBody.neckAngleDelta : CMP.W #$0080 : BMI .lessThan80
    LDY.W #EnemyProjectile_MotherBrainDyingDrool

  .lessThan80:
    LDA.L MotherBrainBody.droolProjectileParam
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    PLY

  .return:
    RTS


;;; $9B6D: Instruction - spawn Mother Brain's purple breath - big enemy projectile ;;;
Instruction_MotherBrainHead_SpawnPurpleBreathBigProjectile:
    PHY
    LDY.W #EnemyProjectile_MotherBrainPurpleBreath_Big
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    PLY
    RTS


;;; $9B77: Instruction - Mother Brain brain main shake timer = 50 ;;;
Instruction_MotherBrainHead_SetMainShakeTimerTo50:
    LDA.W #$0032 : STA.L MotherBrainBody.brainMainShakeTimer
    RTS


;;; $9B7F: Instruction list - Mother Brain brain - stretching - phase 2 ;;;
InstList_MotherBrainHead_Stretching_Phase2_0:
    dw Instruction_MotherBrainHead_SetMainShakeTimerTo50
    dw $0002,Spritemaps_MotherBrain_2
    dw $0002,Spritemaps_MotherBrain_3
    dw Instruction_MotherBrainHead_SpawnDroolProjectile
    dw $0002,Spritemaps_MotherBrain_3
    dw Instruction_MotherBrainHead_SpawnPurpleBreathBigProjectile
    dw Instruction_MotherBrainHead_QueueSoundX_Lib2_Max6,$007E
    dw Instruction_MotherBrainHead_SpawnDroolProjectile
    dw $0010,Spritemaps_MotherBrain_4
    dw Instruction_MotherBrainHead_SpawnDroolProjectile
    dw $0010,Spritemaps_MotherBrain_4
    dw Instruction_MotherBrainHead_SpawnDroolProjectile
    dw $0020,Spritemaps_MotherBrain_4
    dw $0004,Spritemaps_MotherBrain_3

InstList_MotherBrainHead_Stretching_Phase2_1:
    dw $0001,Spritemaps_MotherBrain_2
    dw Instruction_MotherBrain_GotoX
    dw InstList_MotherBrainHead_Stretching_Phase2_1


;;; $9BB3: Instruction list - Mother Brain brain - stretching - phase 3 ;;;
InstList_MotherBrainHead_Stretching_Phase3_0:
    dw Instruction_MotherBrainHead_SetMainShakeTimerTo50
    dw $0002,Spritemaps_MotherBrain_8
    dw $0002,Spritemaps_MotherBrain_9
    dw Instruction_MotherBrainHead_SpawnDroolProjectile
    dw $0002,Spritemaps_MotherBrain_9
    dw Instruction_MotherBrainHead_SpawnPurpleBreathBigProjectile
    dw Instruction_MotherBrainHead_QueueSoundX_Lib2_Max6,$007E
    dw Instruction_MotherBrainHead_SpawnDroolProjectile
    dw $0010,Spritemaps_MotherBrain_A
    dw Instruction_MotherBrainHead_SpawnDroolProjectile
    dw $0010,Spritemaps_MotherBrain_A
    dw Instruction_MotherBrainHead_SpawnDroolProjectile
    dw $0020,Spritemaps_MotherBrain_A
    dw $0004,Spritemaps_MotherBrain_9

InstList_MotherBrainHead_Stretching_Phase3_1:
    dw $0001,Spritemaps_MotherBrain_8
    dw Instruction_MotherBrain_GotoX
    dw InstList_MotherBrainHead_Stretching_Phase3_1


;;; $9BE7: Instruction list - Mother Brain brain - hyper beam recoil ;;;
InstList_MotherBrainHead_HyperBeamRecoil_0:
    dw Instruction_MotherBrainHead_SetMainShakeTimerTo50
    dw $0002,Spritemaps_MotherBrain_8
    dw $0002,Spritemaps_MotherBrain_9
    dw $0002,Spritemaps_MotherBrain_9
    dw Instruction_MotherBrainHead_SpawnPurpleBreathBigProjectile
    dw Instruction_MotherBrainHead_QueueSoundX_Lib2_Max6,$007E
    dw $0010,Spritemaps_MotherBrain_A
    dw $0010,Spritemaps_MotherBrain_A
    dw $0020,Spritemaps_MotherBrain_A
    dw $0004,Spritemaps_MotherBrain_9

InstList_MotherBrainHead_HyperBeamRecoil_1:
    dw $0001,Spritemaps_MotherBrain_8
    dw Instruction_MotherBrain_GotoX
    dw InstList_MotherBrainHead_HyperBeamRecoil_1


;;; $9C13: Instruction list - Mother Brain body - initial (dummy) ;;;
InstList_MotherBrainHead_InitialDummy:
    dw $0000,UNUSED_ExtendedSpritemap_MotherBrainBrain_A9A320
    dw Instruction_Common_Sleep


if !FEATURE_KEEP_UNREFERENCED
;;; $9C19: Unused. Instruction list - Mother Brain brain ;;;
UNUSED_InstList_MotherBrainHead_A99C19:
    dw $0008,Spritemaps_MotherBrain_2
    dw $0004,Spritemaps_MotherBrain_1
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $9C21: Instruction list - Mother Brain brain - initial ;;;
InstList_MotherBrainHead_Initial:
    dw $0004,Spritemaps_MotherBrain_0
    dw Instruction_MotherBrain_GotoX
    dw InstList_MotherBrainHead_Initial


;;; $9C29: Instruction list - Mother Brain brain - decapitated ;;;
InstList_MotherBrainHead_Decapitated_0:
    dw $0008,Spritemaps_MotherBrain_8
    dw $0004,Spritemaps_MotherBrain_7

InstList_MotherBrainHead_Decapitated_1:
    dw $0004,Spritemaps_MotherBrain_6
    dw Instruction_MotherBrain_GotoX
    dw InstList_MotherBrainHead_Decapitated_1


;;; $9C39: Instruction list - Mother Brain brain - dying drool ;;;
InstList_MotherBrainHead_DyingDrool_0:
    dw Instruction_MotherBrainHead_SetMainShakeTimerTo50
    dw $0004,Spritemaps_MotherBrain_8
    dw $0004,Spritemaps_MotherBrain_9
    dw Instruction_MotherBrainHead_QueueSoundX_Lib2_Max6,$007E

InstList_MotherBrainHead_DyingDrool_1:
    dw $0002,Spritemaps_MotherBrain_A
    dw Instruction_MotherBrainHead_SpawnDroolProjectile
    dw $0002,Spritemaps_MotherBrain_A
    dw Instruction_MotherBrainHead_SpawnDroolProjectile
    dw $0002,Spritemaps_MotherBrain_A
    dw Instruction_MotherBrainHead_SpawnDroolProjectile
    dw $0002,Spritemaps_MotherBrain_A
    dw Instruction_MotherBrainHead_SpawnDroolProjectile

InstList_MotherBrainHead_DyingDrool_2:
    dw $0002,Spritemaps_MotherBrain_A
    dw Instruction_MotherBrainHead_GotoDyingDroolInstList


;;; $9C65: Instruction - go to $9C5F or occasionally $9C47 ;;;
Instruction_MotherBrainHead_GotoDyingDroolInstList:
    LDX.W #InstList_MotherBrainHead_DyingDrool_2
    LDA.W RandomNumberSeed : AND.W #$0FFF : CMP.W #$0FE0 : BCC .return
    LDX.W #InstList_MotherBrainHead_DyingDrool_1

  .return:
    RTS


;;; $9C77: Instruction list - Mother Brain brain - firing rainbow beam ;;;
InstList_MotherBrainHead_FiringRainbowBeam:
    dw $0001,Spritemaps_MotherBrain_2
    dw Instruction_MotherBrain_GotoX
    dw InstList_MotherBrainHead_FiringRainbowBeam


if !FEATURE_KEEP_UNREFERENCED
;;; $9C7F: Unused. Instruction list - Mother Brain brain ;;;
UNUSED_InstList_MotherBrainHead_A99C7F:
    dw $0001,Spritemaps_MotherBrain_8
    dw Instruction_MotherBrain_GotoX
    dw UNUSED_InstList_MotherBrainHead_A99C7F
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $9C87: Instruction list - Mother Brain brain - neutral - phase 2 ;;;
; Includes firing death beam (which is done by body)
InstList_MotherBrainHead_Neutral_Phase2_0:
    dw $0004,Spritemaps_MotherBrain_0
    dw $0004,Spritemaps_MotherBrain_1
    dw $0008,Spritemaps_MotherBrain_2
    dw $0004,Spritemaps_MotherBrain_1
    dw $0004,Spritemaps_MotherBrain_0
    dw $0004,Spritemaps_MotherBrain_1

InstList_MotherBrainHead_Neutral_Phase2_1:
    dw $0008,Spritemaps_MotherBrain_2
    dw Instruction_MotherBrainHead_MaybeGotoNeutralPhase2
    dw $0004,Spritemaps_MotherBrain_1
    dw Instruction_MotherBrain_GotoX
    dw InstList_MotherBrainHead_Neutral_Phase2_0


;;; $9CAD: Instruction - likely go to $9C9F ;;;
Instruction_MotherBrainHead_MaybeGotoNeutralPhase2:
    LDA.W RandomNumberSeed : CMP.W #$F000 : BCS .return
    LDX.W #InstList_MotherBrainHead_Neutral_Phase2_1

  .return:
    RTS


;;; $9CB9: Instruction list - Mother Brain brain - neutral - phase 3 ;;;
; When Shitroid is making its final stand
InstList_MotherBrainHead_Neutral_Phase3_0:
    dw $0004,Spritemaps_MotherBrain_6
    dw $0004,Spritemaps_MotherBrain_7
    dw $0008,Spritemaps_MotherBrain_8
    dw $0004,Spritemaps_MotherBrain_7
    dw $0004,Spritemaps_MotherBrain_6
    dw $0004,Spritemaps_MotherBrain_7

InstList_MotherBrainHead_Neutral_Phase3_1:
    dw $0008,Spritemaps_MotherBrain_8
    dw $0008,Spritemaps_MotherBrain_7
    dw Instruction_MotherBrainHead_MaybeGotoNeutralPhase3
    dw $0004,Spritemaps_MotherBrain_6
    dw Instruction_MotherBrain_GotoX
    dw InstList_MotherBrainHead_Neutral_Phase3_0

if !FEATURE_KEEP_UNREFERENCED
UNUSED_InstList_MotherBrainHead_Neutral_Phase3_A99CE3:
; Unused branch
    dw $0004,Spritemaps_MotherBrain_8
    dw $0004,Spritemaps_MotherBrain_9
    dw $0002,Spritemaps_MotherBrain_A
    dw Instruction_MotherBrainHead_QueueSoundX_Lib2_Max6,$006F
    dw $0002,Spritemaps_MotherBrain_A
    dw $0002,Spritemaps_MotherBrain_A
    dw $0002,Spritemaps_MotherBrain_A
    dw $0002,Spritemaps_MotherBrain_A
    dw $0004,Spritemaps_MotherBrain_9
    dw $0004,Spritemaps_MotherBrain_8
    dw Instruction_MotherBrainHead_GotoNeutralPhase3
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $9D0D: Instruction - likely go to $9CD1 ;;;
Instruction_MotherBrainHead_MaybeGotoNeutralPhase3:
; If [random number] & FFFh < EC0h:
;     X = $9CD1

; If $9D16 were a BCC, Mother Brain would do a cry sound effect occasionally whilst Shitroid makes its final stand
    LDA.W RandomNumberSeed : AND.W #$0FFF : CMP.W #$0F40
    BRA +

if !FEATURE_KEEP_UNREFERENCED
    LDX.W #UNUSED_InstList_MotherBrainHead_Neutral_Phase3_A99CE3
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED

+   CMP.W #$0EC0 : BCS Instruction_MotherBrainHead_GotoNeutralPhase3_return
; fallthrough to Instruction_MotherBrainHead_GotoNeutralPhase3


;;; $9D21: Instruction - go to $9CD1 ;;;
Instruction_MotherBrainHead_GotoNeutralPhase3:
    LDX.W #InstList_MotherBrainHead_Neutral_Phase3_1

  .return:
    RTS


;;; $9D25: Instruction list - Mother Brain brain - corpse ;;;
InstList_MotherBrainHead_Corpse_0:
    dw $0002,Spritemaps_MotherBrain_6
    dw $0002,Spritemaps_MotherBrain_7
    dw $0040,Spritemaps_MotherBrain_8
    dw $0040,Spritemaps_MotherBrain_18

InstList_MotherBrainHead_Corpse_1:
    dw $0002,Spritemaps_MotherBrain_19
    dw Instruction_MotherBrain_GotoX
    dw InstList_MotherBrainHead_Corpse_1


;;; $9D3D: Instruction list - Mother Brain brain - attacking - four blue rings - phase 2 ;;;
InstList_MotherBrainHead_Attacking_4OnionRings_Phase2:
    dw Instruction_MotherBrainHead_DisableNeckMovement
    dw $0004,Spritemaps_MotherBrain_2
    dw $0004,Spritemaps_MotherBrain_3
    dw Instruction_MotherBrainHead_QueueSoundX_Lib2_Max6,$006F
    dw $0008,Spritemaps_MotherBrain_4
    dw Instruction_MotherBrainHead_AimOnionRingsAtSamus
    dw Instruction_MotherBrainHead_SpawnOnionRingsProjectile
    dw Instruction_MotherBrainHead_QueueSoundX_Lib3_Max6,$0017
    dw $0003,Spritemaps_MotherBrain_4
    dw Instruction_MotherBrainHead_AimOnionRingsAtSamus
    dw Instruction_MotherBrainHead_SpawnOnionRingsProjectile
    dw $0003,Spritemaps_MotherBrain_4
    dw Instruction_MotherBrainHead_AimOnionRingsAtSamus
    dw Instruction_MotherBrainHead_SpawnOnionRingsProjectile
    dw $0003,Spritemaps_MotherBrain_4
    dw Instruction_MotherBrainHead_AimOnionRingsAtSamus
    dw Instruction_MotherBrainHead_SpawnOnionRingsProjectile
    dw $0010,Spritemaps_MotherBrain_4
    dw $0004,Spritemaps_MotherBrain_3
    dw $0010,Spritemaps_MotherBrain_2
    dw Instruction_MotherBrainHead_EnableNeckMovement_GotoX
    dw InstList_MotherBrainHead_Neutral_Phase2_0


;;; $9D7F: Instruction list - Mother Brain brain - attacking - two blue rings - phase 2 ;;;
InstList_MotherBrainHead_Attacking_2OnionRings_Phase2:
    dw Instruction_MotherBrainHead_DisableNeckMovement
    dw $0004,Spritemaps_MotherBrain_2
    dw $0004,Spritemaps_MotherBrain_3
    dw Instruction_MotherBrainHead_QueueSoundX_Lib2_Max6,$006F
    dw $0008,Spritemaps_MotherBrain_4
    dw Instruction_MotherBrainHead_AimOnionRingsAtSamus
    dw Instruction_MotherBrainHead_SpawnOnionRingsProjectile
    dw Instruction_MotherBrainHead_QueueSoundX_Lib3_Max6,$0017
    dw $0003,Spritemaps_MotherBrain_4
    dw Instruction_MotherBrainHead_AimOnionRingsAtSamus
    dw Instruction_MotherBrainHead_SpawnOnionRingsProjectile
    dw $0010,Spritemaps_MotherBrain_4
    dw $0004,Spritemaps_MotherBrain_3
    dw $0010,Spritemaps_MotherBrain_2
    dw Instruction_MotherBrainHead_EnableNeckMovement_GotoX
    dw InstList_MotherBrainHead_Neutral_Phase2_0


;;; $9DB1: Instruction list - Mother Brain brain - attacking Shitroid ;;;
InstList_MotherBrainHead_Attacking_BabyMetroid:
    dw Instruction_MotherBrainHead_IncBabyMetroidAttackCounter
    dw Instruction_MotherBrainHead_DisableNeckMovement
    dw Instruction_MotherBrainHead_AimOnionRingsAtBabyMetroid
    dw Instruction_MotherBrain_GotoX
    dw InstList_MotherBrainHead_Attacking_4OnionRings_Phase3


;;; $9DBB: Instruction list - Mother Brain brain - attacking Samus - four blue rings - phase 3 ;;;
InstList_MotherBrainHead_AttackingSamus_4OnionRings_Phase3:
    dw Instruction_MotherBrainHead_ResetBabyMetroidAttackCounter
    dw Instruction_MotherBrainHead_DisableNeckMovement
    dw Instruction_MotherBrainHead_AimOnionRingsAtSamus


;;; $9DC1: Instruction list - Mother Brain brain - attacking - four blue rings - phase 3 ;;;
InstList_MotherBrainHead_Attacking_4OnionRings_Phase3:
    dw $0004,Spritemaps_MotherBrain_8
    dw $0004,Spritemaps_MotherBrain_9
    dw Instruction_MotherBrainHead_QueueBabyMetroidAttackSFX
    dw $0008,Spritemaps_MotherBrain_A
    dw Instruction_MotherBrainHead_SpawnOnionRingsProjectile
    dw Instruction_MotherBrainHead_QueueSoundX_Lib3_Max6,$0017
    dw $0003,Spritemaps_MotherBrain_A
    dw Instruction_MotherBrainHead_SpawnOnionRingsProjectile
    dw $0003,Spritemaps_MotherBrain_A
    dw Instruction_MotherBrainHead_SpawnOnionRingsProjectile
    dw $0003,Spritemaps_MotherBrain_A
    dw Instruction_MotherBrainHead_SpawnOnionRingsProjectile
    dw $0010,Spritemaps_MotherBrain_A
    dw $0004,Spritemaps_MotherBrain_9
    dw $0010,Spritemaps_MotherBrain_8
    dw Instruction_MotherBrainHead_EnableNeckMovement_GotoX
    dw InstList_MotherBrainHead_Neutral_Phase3_0


;;; $9DF7: Instruction - queue Shitroid attack sound effect ;;;
Instruction_MotherBrainHead_QueueBabyMetroidAttackSFX:
    PHY
    LDA.L MotherBrainBody.BabyMetroidAttackCounter : CMP.W #$000B : BEQ .return
    LDA.W #$0000 : ASL : TAY
    LDA.W .sfx,Y
    JSL QueueSound_Lib2_Max6

  .return:
    PLY
    RTS

  .sfx:
; (Should be) indexed by [Mother Brain Baby Metroid attack counter]
; 6Fh: Mother Brain's cry - low pitch
; 7Eh: Mother Brain's cry - high pitch
    dw $006F,$006F,$006F,$007E,$006F,$006F,$007E,$006F
    dw $006F,$007E,$007E,$006F,$006F


;;; $9E29: Instruction - spawn Mother Brain blue ring enemy projectile ;;;
Instruction_MotherBrainHead_SpawnOnionRingsProjectile:
    PHY
    LDY.W #EnemyProjectile_MotherBrainOnionRings
    LDA.L MotherBrainBody.onionRingsTargetAngle
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    PLY
    RTS


;;; $9E37: Instruction - aim Mother Brain blue rings at Shitroid ;;;
Instruction_MotherBrainHead_AimOnionRingsAtBabyMetroid:
    PHX : PHY
    LDA.L MotherBrainBody.BabyMetroidEnemyIndex : TAX
    LDA.W Enemy.XPosition,X : SEC : SBC.W Enemy[1].XPosition
    SEC : SBC.W #$000A : STA.B DP_Temp12
    LDA.W Enemy.YPosition,X : SEC : SBC.W Enemy[1].YPosition
    SEC : SBC.W #$0010 : STA.B DP_Temp14
    JMP AimMotherBrainOnionRings


;;; $9E5B: Instruction - aim Mother Brain blue rings at Samus ;;;
Instruction_MotherBrainHead_AimOnionRingsAtSamus:
    PHX : PHY
    LDA.W SamusXPosition : SEC : SBC.W Enemy[1].XPosition
    SEC : SBC.W #$000A : STA.B DP_Temp12
    LDA.W SamusYPosition : SEC : SBC.W Enemy[1].YPosition
    SEC : SBC.W #$0010 : STA.B DP_Temp14
; fallthrough to AimMotherBrainOnionRings


;;; $9E77: Aim Mother Brain blue rings ;;;
AimMotherBrainOnionRings:
; $7E:7834 = clamp(80h - (angle of ([$12], [$14]) offset), 10h, 40h)
    JSL CalculateAngleOf_12_14_Offset
    SEC : SBC.W #$0080 : EOR.W #$FFFF : INC : AND.W #$00FF
    SEP #$20
    CMP.B #$10 : BPL +
    CMP.B #$C0 : BMI .upperHalf
    LDA.B #$10
    BRA .merge

; 10h <= [A] < 90h (-10h < angle <= 70h)
+   CMP.B #$48 : BCC .merge

  .upperHalf:
    LDA.B #$48

  .merge:
    REP #$20
    STA.L MotherBrainBody.onionRingsTargetAngle
    PLY : PLX
    RTS


;;; $9EA3: Instruction - increment Mother Brain Shitroid attack counter ;;;
Instruction_MotherBrainHead_IncBabyMetroidAttackCounter:
; 12 is the max due to the Instruction_MotherBrainHead_QueueBabyMetroidAttackSFX_sfx table
    LDA.L MotherBrainBody.BabyMetroidAttackCounter : INC : CMP.W #$000C : BCC .notMax12
    LDA.W #$000C

  .notMax12:
    STA.L MotherBrainBody.BabyMetroidAttackCounter
    RTS


;;; $9EB5: Instruction - Mother Brain Shitroid attack counter = 0 ;;;
Instruction_MotherBrainHead_ResetBabyMetroidAttackCounter:
    LDA.W #$0000 : STA.L MotherBrainBody.BabyMetroidAttackCounter
    RTS


;;; $9EBD: Instruction - spawn Mother Brain bomb enemy projectile with parameter [[X]] ;;;
Instruction_MotherBrainHead_SpawnBombProjectileWithParamX:
    PHY
    LDA.W $0000,X
    LDY.W #EnemyProjectile_MotherBrainBomb
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    PLY
    INX #2
    RTS


;;; $9ECC: Instruction list - Mother Brain brain - attacking - bomb - phase 2 ;;;
InstList_MotherBrainHead_Attacking_Bomb_Phase2:
    dw $0004,Spritemaps_MotherBrain_0
    dw $0004,Spritemaps_MotherBrain_1
    dw $0008,Spritemaps_MotherBrain_2
    dw Instruction_MotherBrainHead_DisableNeckMovement
    dw $0004,Spritemaps_MotherBrain_2
    dw $0004,Spritemaps_MotherBrain_3
    dw Instruction_MotherBrainHead_QueueSoundX_Lib2_Max6,$006F
    dw $0008,Spritemaps_MotherBrain_4
    dw Instruction_MotherBrainHead_SpawnBombProjectileWithParamX,$0007
    dw Instruction_MotherBrainHead_SpawnPurpleBreathBigProjectile
    dw $0020,Spritemaps_MotherBrain_4
    dw $0004,Spritemaps_MotherBrain_3
    dw $0010,Spritemaps_MotherBrain_2
    dw Instruction_MotherBrainHead_EnableNeckMovement_GotoX
    dw InstList_MotherBrainHead_Neutral_Phase2_0


;;; $9F00: Instruction list - Mother Brain brain - attacking - bomb - phase 3 ;;;
InstList_MotherBrainHead_Attacking_Bomb_Phase3:
    dw $0004,Spritemaps_MotherBrain_6
    dw $0004,Spritemaps_MotherBrain_7
    dw $0008,Spritemaps_MotherBrain_8
    dw Instruction_MotherBrainHead_DisableNeckMovement
    dw $0004,Spritemaps_MotherBrain_8
    dw $0004,Spritemaps_MotherBrain_9
    dw Instruction_MotherBrainHead_QueueSoundX_Lib2_Max6,$006F
    dw $0008,Spritemaps_MotherBrain_A
    dw Instruction_MotherBrainHead_SpawnBombProjectileWithParamX,$0001
    dw Instruction_MotherBrainHead_SpawnPurpleBreathBigProjectile
    dw $0020,Spritemaps_MotherBrain_A
    dw $0004,Spritemaps_MotherBrain_9
    dw $0010,Spritemaps_MotherBrain_8
    dw Instruction_MotherBrainHead_EnableNeckMovement_GotoX
    dw InstList_MotherBrainHead_Neutral_Phase3_0


;;; $9F34: Instruction list - Mother Brain brain - attacking - laser ;;;
InstList_MotherBrainHead_Attacking_Laser:
    dw $0010,Spritemaps_MotherBrain_1
    dw $0004,Spritemaps_MotherBrain_2
    dw InstList_MotherBrainHead_SpawnLaserProjectile
    dw $0020,Spritemaps_MotherBrain_2
    dw Instruction_MotherBrainHead_EnableNeckMovement_GotoX
    dw InstList_MotherBrainHead_Neutral_Phase2_0


;;; $9F46: Instruction - spawn Mother Brain laser enemy projectile ;;;
InstList_MotherBrainHead_SpawnLaserProjectile:
    LDA.W #$0000 : STA.L MotherBrainBody.enableNeckMovementFlag
    PHY
    LDA.W Enemy[1].XPosition : CLC : ADC.W #$0010 : STA.B DP_Temp12
    LDA.W Enemy[1].YPosition : CLC : ADC.W #$0004 : STA.B DP_Temp14
    LDA.W #$0001
    LDY.W #EnemyProjectile_PirateMotherBrainLaser
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    PLY
    RTS


;;; $9F6C: Instruction list - Mother Brain brain - charging rainbow beam ;;;
InstList_MotherBrainHead_ChargingRainbowBeam_0:
    dw Instruction_MotherBrainHead_SetupEffectsForRainbowBeamCharge
    dw $0004,Spritemaps_MotherBrain_2
    dw $0004,Spritemaps_MotherBrain_1
    dw $0002,Spritemaps_MotherBrain_0

InstList_MotherBrainHead_ChargingRainbowBeam_1:
    dw Instruction_MotherBrainHead_SpawnRainbowBeamChargingProj
    dw $001E,Spritemaps_MotherBrain_0
    dw Instruction_MotherBrain_GotoX
    dw InstList_MotherBrainHead_ChargingRainbowBeam_1


;;; $9F84: Instruction - spawn Mother Brain's rainbow beam charging enemy projectile ;;;
Instruction_MotherBrainHead_SpawnRainbowBeamChargingProj:
    PHY
    LDY.W #EnemyProjectile_MotherBrainRainbowBeam_Charging
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    PLY
    RTS


;;; $9F8E: Instruction - set up effects for Mother Brain charging rainbow beam ;;;
Instruction_MotherBrainHead_SetupEffectsForRainbowBeamCharge:
    LDA.W #$0000 : STA.L MotherBrainBody.smallPurpleBreathGenerationEnabledFlag
    JSR SetupMotherBrainHeadPaletteForChargingHerLaser
    LDA.W #$007F
    JSL QueueSound_Lib2_Max6
    RTS


;;; $9FA0: Extended spritemap entries - Mother Brain body ;;;
ExtendedSpritemap_MotherBrainBody_Standing:
    dw $0009
    dw $0012,$003A
    dw Spritemaps_MotherBrain_13
    dw Hitbox_MotherBrainBody_3
    dw $001E,$001D
    dw Spritemaps_MotherBrain_F
    dw Hitbox_MotherBrainBody_2
    dw $0019,$001E
    dw Spritemaps_MotherBrain_11
    dw Hitbox_MotherBrainBody_2
    dw $0000,$FFFC
    dw Spritemaps_MotherBrain_B
    dw Hitbox_MotherBrainBody_2
    dw $0000,$0000
    dw ExtendedTilemaps_MotherBrain_0
    dw Hitbox_MotherBrainBody_6
    dw $0000,$0000
    dw ExtendedTilemaps_MotherBrain_1
    dw Hitbox_MotherBrainBody_8
    dw $FFF6,$0038
    dw Spritemaps_MotherBrain_17
    dw Hitbox_MotherBrainBody_5
    dw $0007,$001C
    dw Spritemaps_MotherBrain_15
    dw Hitbox_MotherBrainBody_4
    dw $0002,$001D
    dw Spritemaps_MotherBrain_16
    dw Hitbox_MotherBrainBody_4

ExtendedSpritemap_MotherBrainBody_Walking_0:
    dw $000A
    dw $001C,$002F
    dw Spritemaps_MotherBrain_13
    dw Hitbox_MotherBrainBody_3
    dw $0026,$0013
    dw Spritemaps_MotherBrain_F
    dw Hitbox_MotherBrainBody_2
    dw $0021,$0013
    dw Spritemaps_MotherBrain_11
    dw Hitbox_MotherBrainBody_2
    dw $0000,$FFFD
    dw Spritemaps_MotherBrain_C
    dw Hitbox_MotherBrainBody_2
    dw $0000,$0002
    dw ExtendedTilemaps_MotherBrain_0
    dw Hitbox_MotherBrainBody_6
    dw $0000,$0000
    dw ExtendedTilemaps_MotherBrain_1
    dw Hitbox_MotherBrainBody_8
    dw $FFF5,$003A
    dw Spritemaps_MotherBrain_17
    dw Hitbox_MotherBrainBody_5
    dw $0006,$001F
    dw Spritemaps_MotherBrain_15
    dw Hitbox_MotherBrainBody_4
    dw $0001,$0021
    dw Spritemaps_MotherBrain_16
    dw Hitbox_MotherBrainBody_4
    dw $FFE7,$FFFD
    dw Spritemaps_MotherBrain_14
    dw Hitbox_MotherBrainBody_4

ExtendedSpritemap_MotherBrainBody_Walking_1:
    dw $000A
    dw $0028,$0030
    dw Spritemaps_MotherBrain_13
    dw Hitbox_MotherBrainBody_3
    dw $0026,$0013
    dw Spritemaps_MotherBrain_F
    dw Hitbox_MotherBrainBody_2
    dw $0023,$0013
    dw Spritemaps_MotherBrain_10
    dw Hitbox_MotherBrainBody_2
    dw $0000,$FFFD
    dw Spritemaps_MotherBrain_C
    dw Hitbox_MotherBrainBody_2
    dw $0000,$0002
    dw ExtendedTilemaps_MotherBrain_0
    dw Hitbox_MotherBrainBody_6
    dw $0000,$0000
    dw ExtendedTilemaps_MotherBrain_1
    dw Hitbox_MotherBrainBody_8
    dw $FFF3,$003A
    dw Spritemaps_MotherBrain_17
    dw Hitbox_MotherBrainBody_5
    dw $0005,$001F
    dw Spritemaps_MotherBrain_15
    dw Hitbox_MotherBrainBody_4
    dw $FFFF,$0021
    dw Spritemaps_MotherBrain_16
    dw Hitbox_MotherBrainBody_4
    dw $FFE6,$FFFD
    dw Spritemaps_MotherBrain_14
    dw Hitbox_MotherBrainBody_4

ExtendedSpritemap_MotherBrainBody_Walking_2:
    dw $000A
    dw $0028,$0033
    dw Spritemaps_MotherBrain_13
    dw Hitbox_MotherBrainBody_3
    dw $0026,$0015
    dw Spritemaps_MotherBrain_F
    dw Hitbox_MotherBrainBody_2
    dw $0023,$0016
    dw Spritemaps_MotherBrain_10
    dw Hitbox_MotherBrainBody_2
    dw $FFFF,$FFFE
    dw Spritemaps_MotherBrain_C
    dw Hitbox_MotherBrainBody_2
    dw $0000,$0001
    dw ExtendedTilemaps_MotherBrain_0
    dw Hitbox_MotherBrainBody_6
    dw $0000,$0000
    dw ExtendedTilemaps_MotherBrain_1
    dw Hitbox_MotherBrainBody_8
    dw $FFF3,$0039
    dw Spritemaps_MotherBrain_17
    dw Hitbox_MotherBrainBody_5
    dw $0005,$001E
    dw Spritemaps_MotherBrain_15
    dw Hitbox_MotherBrainBody_4
    dw $FFFF,$0020
    dw Spritemaps_MotherBrain_16
    dw Hitbox_MotherBrainBody_4
    dw $FFE6,$FFFC
    dw Spritemaps_MotherBrain_14
    dw Hitbox_MotherBrainBody_4

ExtendedSpritemap_MotherBrainBody_Walking_3:
    dw $0009
    dw $0024,$003A
    dw Spritemaps_MotherBrain_13
    dw Hitbox_MotherBrainBody_3
    dw $0021,$001D
    dw Spritemaps_MotherBrain_F
    dw Hitbox_MotherBrainBody_2
    dw $001F,$001E
    dw Spritemaps_MotherBrain_10
    dw Hitbox_MotherBrainBody_2
    dw $0001,$FFFC
    dw Spritemaps_MotherBrain_B
    dw Hitbox_MotherBrainBody_2
    dw $0000,$0000
    dw ExtendedTilemaps_MotherBrain_0
    dw Hitbox_MotherBrainBody_6
    dw $0000,$0000
    dw ExtendedTilemaps_MotherBrain_1
    dw Hitbox_MotherBrainBody_8
    dw $FFF0,$0038
    dw Spritemaps_MotherBrain_17
    dw Hitbox_MotherBrainBody_5
    dw $0003,$001C
    dw Spritemaps_MotherBrain_15
    dw Hitbox_MotherBrainBody_4
    dw $FFFC,$001E
    dw Spritemaps_MotherBrain_16
    dw Hitbox_MotherBrainBody_4

ExtendedSpritemap_MotherBrainBody_Walking_4:
    dw $0009
    dw $0015,$003C
    dw Spritemaps_MotherBrain_13
    dw Hitbox_MotherBrainBody_3
    dw $001D,$001F
    dw Spritemaps_MotherBrain_F
    dw Hitbox_MotherBrainBody_2
    dw $001B,$0020
    dw Spritemaps_MotherBrain_11
    dw Hitbox_MotherBrainBody_2
    dw $FFFE,$FFFE
    dw Spritemaps_MotherBrain_B
    dw Hitbox_MotherBrainBody_2
    dw $0000,$0002
    dw ExtendedTilemaps_MotherBrain_0
    dw Hitbox_MotherBrainBody_6
    dw $0000,$0000
    dw ExtendedTilemaps_MotherBrain_1
    dw Hitbox_MotherBrainBody_8
    dw $FFF0,$0034
    dw Spritemaps_MotherBrain_17
    dw Hitbox_MotherBrainBody_5
    dw $0000,$001A
    dw Spritemaps_MotherBrain_15
    dw Hitbox_MotherBrainBody_4
    dw $FFFB,$001C
    dw Spritemaps_MotherBrain_16
    dw Hitbox_MotherBrainBody_4

ExtendedSpritemap_MotherBrainBody_Walking_5:
    dw $0009
    dw $000F,$0040
    dw Spritemaps_MotherBrain_13
    dw Hitbox_MotherBrainBody_3
    dw $001E,$0023
    dw Spritemaps_MotherBrain_F
    dw Hitbox_MotherBrainBody_2
    dw $001A,$0025
    dw Spritemaps_MotherBrain_12
    dw Hitbox_MotherBrainBody_2
    dw $FFFE,$FFFF
    dw Spritemaps_MotherBrain_B
    dw Hitbox_MotherBrainBody_2
    dw $0000,$0006
    dw ExtendedTilemaps_MotherBrain_0
    dw Hitbox_MotherBrainBody_6
    dw $0000,$0000
    dw ExtendedTilemaps_MotherBrain_1
    dw Hitbox_MotherBrainBody_8
    dw $FFF6,$002F
    dw Spritemaps_MotherBrain_17
    dw Hitbox_MotherBrainBody_5
    dw $0004,$0016
    dw Spritemaps_MotherBrain_15
    dw Hitbox_MotherBrainBody_4
    dw $FFFF,$0018
    dw Spritemaps_MotherBrain_16
    dw Hitbox_MotherBrainBody_4

ExtendedSpritemap_MotherBrainBody_Walking_6:
    dw $0009
    dw $0011,$003C
    dw Spritemaps_MotherBrain_13
    dw Hitbox_MotherBrainBody_3
    dw $001E,$0020
    dw Spritemaps_MotherBrain_F
    dw Hitbox_MotherBrainBody_2
    dw $0018,$0020
    dw Spritemaps_MotherBrain_11
    dw Hitbox_MotherBrainBody_2
    dw $FFFF,$FFFE
    dw Spritemaps_MotherBrain_B
    dw Hitbox_MotherBrainBody_2
    dw $0000,$0002
    dw ExtendedTilemaps_MotherBrain_0
    dw Hitbox_MotherBrainBody_6
    dw $0000,$0000
    dw ExtendedTilemaps_MotherBrain_1
    dw Hitbox_MotherBrainBody_8
    dw $FFF8,$002F
    dw Spritemaps_MotherBrain_17
    dw Hitbox_MotherBrainBody_5
    dw $0007,$0015
    dw Spritemaps_MotherBrain_15
    dw Hitbox_MotherBrainBody_4
    dw $0003,$0017
    dw Spritemaps_MotherBrain_16
    dw Hitbox_MotherBrainBody_4

ExtendedSpritemap_MotherBrainBody_Walking_7:
    dw $0009
    dw $0012,$003A
    dw Spritemaps_MotherBrain_13
    dw Hitbox_MotherBrainBody_3
    dw $001F,$001E
    dw Spritemaps_MotherBrain_F
    dw Hitbox_MotherBrainBody_2
    dw $0019,$001E
    dw Spritemaps_MotherBrain_11
    dw Hitbox_MotherBrainBody_2
    dw $FFFF,$FFFD
    dw Spritemaps_MotherBrain_B
    dw Hitbox_MotherBrainBody_2
    dw $0000,$0000
    dw ExtendedTilemaps_MotherBrain_0
    dw Hitbox_MotherBrainBody_6
    dw $0000,$0000
    dw ExtendedTilemaps_MotherBrain_1
    dw Hitbox_MotherBrainBody_8
    dw $FFF6,$0038
    dw Spritemaps_MotherBrain_17
    dw Hitbox_MotherBrainBody_5
    dw $0007,$001C
    dw Spritemaps_MotherBrain_15
    dw Hitbox_MotherBrainBody_4
    dw $0002,$001F
    dw Spritemaps_MotherBrain_16
    dw Hitbox_MotherBrainBody_4

ExtendedSpritemap_MotherBrainBody_Crouched:
    dw $0007
    dw $0012,$0014
    dw Spritemaps_MotherBrain_13
    dw Hitbox_MotherBrainBody_3
    dw $0022,$FFF7
    dw Spritemaps_MotherBrain_F
    dw Hitbox_MotherBrainBody_2
    dw $001F,$FFFA
    dw Spritemaps_MotherBrain_12
    dw Hitbox_MotherBrainBody_2
    dw $FFFB,$0003
    dw Spritemaps_MotherBrain_E
    dw Hitbox_MotherBrainBody_2
    dw $0000,$FFDA
    dw ExtendedTilemaps_MotherBrain_0
    dw Hitbox_MotherBrainBody_6
    dw $0004,$0000
    dw ExtendedTilemaps_MotherBrain_1
    dw Hitbox_MotherBrainBody_8
    dw $FFF6,$0012
    dw Spritemaps_MotherBrain_17
    dw Hitbox_MotherBrainBody_5

ExtendedSpritemap_MotherBrainBody_Uncrouching:
    dw $0009
    dw $0012,$001E
    dw Spritemaps_MotherBrain_13
    dw Hitbox_MotherBrainBody_3
    dw $0024,$0002
    dw Spritemaps_MotherBrain_F
    dw Hitbox_MotherBrainBody_2
    dw $001F,$0004
    dw Spritemaps_MotherBrain_12
    dw Hitbox_MotherBrainBody_2
    dw $FFFB,$FFFE
    dw Spritemaps_MotherBrain_D
    dw Hitbox_MotherBrainBody_2
    dw $0000,$FFE4
    dw ExtendedTilemaps_MotherBrain_0
    dw Hitbox_MotherBrainBody_6
    dw $FFFE,$0000
    dw ExtendedTilemaps_MotherBrain_1
    dw Hitbox_MotherBrainBody_8
    dw $FFF6,$001C
    dw Spritemaps_MotherBrain_17
    dw Hitbox_MotherBrainBody_5
    dw $0007,$0000
    dw Spritemaps_MotherBrain_15
    dw Hitbox_MotherBrainBody_4
    dw $0002,$0001
    dw Spritemaps_MotherBrain_16
    dw Hitbox_MotherBrainBody_4

ExtendedSpritemap_MotherBrainBody_LeaningDown:
    dw $0009
    dw $0012,$002E
    dw Spritemaps_MotherBrain_13
    dw Hitbox_MotherBrainBody_3
    dw $001F,$0011
    dw Spritemaps_MotherBrain_F
    dw Hitbox_MotherBrainBody_2
    dw $001A,$0012
    dw Spritemaps_MotherBrain_11
    dw Hitbox_MotherBrainBody_2
    dw $FFFB,$FFFC
    dw Spritemaps_MotherBrain_C
    dw Hitbox_MotherBrainBody_2
    dw $0000,$FFF4
    dw ExtendedTilemaps_MotherBrain_0
    dw Hitbox_MotherBrainBody_6
    dw $FFFE,$0000
    dw ExtendedTilemaps_MotherBrain_1
    dw Hitbox_MotherBrainBody_8
    dw $FFF6,$002C
    dw Spritemaps_MotherBrain_17
    dw Hitbox_MotherBrainBody_5
    dw $0007,$0010
    dw Spritemaps_MotherBrain_15
    dw Hitbox_MotherBrainBody_4
    dw $0002,$0011
    dw Spritemaps_MotherBrain_16
    dw Hitbox_MotherBrainBody_4

UNUSED_ExtendedSpritemap_MotherBrainBrain_A9A320:
    dw $0001
    dw $0000,$0000
    dw Spritemaps_MotherBrain_0
    dw Hitbox_MotherBrainBody_0

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ExtendedSpritemap_MotherBrainBrain_A9A32A:
    dw $0001
    dw $0000,$0000
    dw Spritemaps_MotherBrain_1
    dw Hitbox_MotherBrainBody_0

UNUSED_ExtendedSpritemap_MotherBrainBrain_A9A334:
    dw $0001
    dw $0000,$0000
    dw Spritemaps_MotherBrain_2
    dw Hitbox_MotherBrainBody_0

UNUSED_ExtendedSpritemap_MotherBrainBrain_A9A33E:
    dw $0001
    dw $0000,$0000
    dw Spritemaps_MotherBrain_3
    dw Hitbox_MotherBrainBody_0

UNUSED_ExtendedSpritemap_MotherBrainBrain_A9A348:
    dw $0001
    dw $0000,$0000
    dw Spritemaps_MotherBrain_4
    dw Hitbox_MotherBrainBody_0

UNUSED_ExtendedSpritemap_MotherBrainBrain_A9A352:
    dw $0001
    dw $0000,$0000
    dw Spritemaps_MotherBrain_6
    dw Hitbox_MotherBrainBody_1

UNUSED_ExtendedSpritemap_MotherBrainBrain_A9A35C:
    dw $0001
    dw $0000,$0000
    dw Spritemaps_MotherBrain_7
    dw Hitbox_MotherBrainBody_1

UNUSED_ExtendedSpritemap_MotherBrainBrain_A9A366:
    dw $0001
    dw $0000,$0000
    dw Spritemaps_MotherBrain_8
    dw Hitbox_MotherBrainBody_1

UNUSED_ExtendedSpritemap_MotherBrainBrain_A9A370:
    dw $0001
    dw $0000,$0000
    dw Spritemaps_MotherBrain_9
    dw Hitbox_MotherBrainBody_1

UNUSED_ExtendedSpritemap_MotherBrainBrain_A9A37A:
    dw $0001
    dw $0000,$0000
    dw Spritemaps_MotherBrain_A
    dw Hitbox_MotherBrainBody_1
endif ; !FEATURE_KEEP_UNREFERENCED

ExtendedSpritemap_MotherBrainBrain_DeathBeamMode_0:
    dw $0009
    dw $0012,$003A
    dw Spritemaps_MotherBrain_13
    dw Hitbox_MotherBrainBody_3
    dw $001E,$001D
    dw Spritemaps_MotherBrain_F
    dw Hitbox_MotherBrainBody_2
    dw $0019,$001E
    dw Spritemaps_MotherBrain_11
    dw Hitbox_MotherBrainBody_2
    dw $0000,$FFFC
    dw Spritemaps_MotherBrain_B
    dw Hitbox_MotherBrainBody_2
    dw $0000,$0000
    dw ExtendedTilemaps_MotherBrain_0
    dw Hitbox_MotherBrainBody_6
    dw $0000,$0000
    dw ExtendedTilemaps_MotherBrain_2
    dw Hitbox_MotherBrainBody_9
    dw $FFF6,$0038
    dw Spritemaps_MotherBrain_17
    dw Hitbox_MotherBrainBody_5
    dw $0007,$001C
    dw Spritemaps_MotherBrain_15
    dw Hitbox_MotherBrainBody_4
    dw $0002,$001D
    dw Spritemaps_MotherBrain_16
    dw Hitbox_MotherBrainBody_4

ExtendedSpritemap_MotherBrainBrain_DeathBeamMode_1:
    dw $0009
    dw $0012,$003A
    dw Spritemaps_MotherBrain_13
    dw Hitbox_MotherBrainBody_3
    dw $001E,$001D
    dw Spritemaps_MotherBrain_F
    dw Hitbox_MotherBrainBody_2
    dw $0019,$001E
    dw Spritemaps_MotherBrain_11
    dw Hitbox_MotherBrainBody_2
    dw $0000,$FFFC
    dw Spritemaps_MotherBrain_B
    dw Hitbox_MotherBrainBody_2
    dw $0000,$0000
    dw ExtendedTilemaps_MotherBrain_0
    dw Hitbox_MotherBrainBody_6
    dw $0000,$0000
    dw ExtendedTilemaps_MotherBrain_3
    dw Hitbox_MotherBrainBody_A
    dw $FFF6,$0038
    dw Spritemaps_MotherBrain_17
    dw Hitbox_MotherBrainBody_5
    dw $0007,$001C
    dw Spritemaps_MotherBrain_15
    dw Hitbox_MotherBrainBody_4
    dw $0002,$001D
    dw Spritemaps_MotherBrain_16
    dw Hitbox_MotherBrainBody_4

ExtendedSpritemap_MotherBrainBrain_DeathBeamMode_2:
    dw $0009
    dw $0012,$003A
    dw Spritemaps_MotherBrain_13
    dw Hitbox_MotherBrainBody_3
    dw $001E,$001D
    dw Spritemaps_MotherBrain_F
    dw Hitbox_MotherBrainBody_2
    dw $0019,$001E
    dw Spritemaps_MotherBrain_11
    dw Hitbox_MotherBrainBody_2
    dw $0000,$FFFC
    dw Spritemaps_MotherBrain_B
    dw Hitbox_MotherBrainBody_2
    dw $0000,$0000
    dw ExtendedTilemaps_MotherBrain_0
    dw Hitbox_MotherBrainBody_6
    dw $0000,$0000
    dw ExtendedTilemaps_MotherBrain_4
    dw Hitbox_MotherBrainBody_B
    dw $FFF6,$0038
    dw Spritemaps_MotherBrain_17
    dw Hitbox_MotherBrainBody_5
    dw $0007,$001C
    dw Spritemaps_MotherBrain_15
    dw Hitbox_MotherBrainBody_4
    dw $0002,$001D
    dw Spritemaps_MotherBrain_16
    dw Hitbox_MotherBrainBody_4

ExtendedSpritemap_MotherBrainBrain_DeathBeamMode_3:
    dw $0009
    dw $0012,$003A
    dw Spritemaps_MotherBrain_13
    dw Hitbox_MotherBrainBody_3
    dw $001E,$001D
    dw Spritemaps_MotherBrain_F
    dw Hitbox_MotherBrainBody_2
    dw $0019,$001E
    dw Spritemaps_MotherBrain_11
    dw Hitbox_MotherBrainBody_2
    dw $0000,$FFFC
    dw Spritemaps_MotherBrain_B
    dw Hitbox_MotherBrainBody_2
    dw $0000,$0000
    dw ExtendedTilemaps_MotherBrain_0
    dw Hitbox_MotherBrainBody_6
    dw $0000,$0000
    dw ExtendedTilemaps_MotherBrain_5
    dw Hitbox_MotherBrainBody_C
    dw $FFF6,$0038
    dw Spritemaps_MotherBrain_17
    dw Hitbox_MotherBrainBody_5
    dw $0007,$001C
    dw Spritemaps_MotherBrain_15
    dw Hitbox_MotherBrainBody_4
    dw $0002,$001D
    dw Spritemaps_MotherBrain_16
    dw Hitbox_MotherBrainBody_4


;;; $A4AC: Hitboxes - Mother Brain body ;;;
Hitbox_MotherBrainBody_0:
    dw $0001
    dw $FFEC,$FFEB,$0010,$0017
    dw EnemyTouch_MotherBrainHead
    dw EnemyShot_MotherBrainHead

Hitbox_MotherBrainBody_1:
    dw $0001
    dw $FFEC,$FFEB,$0013,$0017
    dw EnemyTouch_MotherBrainHead
    dw EnemyShot_MotherBrainHead

Hitbox_MotherBrainBody_2:
    dw $0000

Hitbox_MotherBrainBody_3:
    dw $0001
    dw $FFE9,$FFFF,$0017,$0007
    dw RTL_A9B5C5
    dw EnemyShot_MotherBrainBody

Hitbox_MotherBrainBody_4:
    dw $0000

Hitbox_MotherBrainBody_5:
    dw $0001
    dw $FFE9,$FFFE,$0017,$0007
    dw RTL_A9B5C5
    dw EnemyShot_MotherBrainBody

Hitbox_MotherBrainBody_6:
    dw $0002
    dw $FFE0,$FFE8,$0014,$0034
    dw RTL_A9B5C5
    dw EnemyShot_MotherBrainBody
    dw $FFE8,$FFD6,$000D,$FFE7
    dw RTL_A9B5C5
    dw EnemyShot_MotherBrainBody

Hitbox_MotherBrainBody_7:
    dw $0000

Hitbox_MotherBrainBody_8:
    dw $0002
    dw $0004,$FFC5,$001C,$FFE8
    dw RTL_A9B5C5
    dw EnemyShot_MotherBrainBody
    dw $001C,$FFD7,$0039,$FFE2
    dw RTL_A9B5C5
    dw EnemyShot_MotherBrainBody

Hitbox_MotherBrainBody_9:
    dw $0002
    dw $0004,$FFC5,$001C,$FFE8
    dw RTL_A9B5C5
    dw EnemyShot_MotherBrainBody
    dw $001C,$FFD7,$0036,$FFE2
    dw RTL_A9B5C5
    dw EnemyShot_MotherBrainBody

Hitbox_MotherBrainBody_A:
    dw $0002
    dw $0004,$FFC5,$001C,$FFE8
    dw RTL_A9B5C5
    dw EnemyShot_MotherBrainBody
    dw $001D,$FFD5,$002D,$FFE8
    dw RTL_A9B5C5
    dw EnemyShot_MotherBrainBody

Hitbox_MotherBrainBody_B:
    dw $0002
    dw $0004,$FFC5,$001C,$FFE8
    dw RTL_A9B5C5
    dw EnemyShot_MotherBrainBody
    dw $001D,$FFD0,$0044,$FFD8
    dw RTL_A9B5C5
    dw EnemyShot_MotherBrainBody

Hitbox_MotherBrainBody_C:
    dw $0002
    dw $0004,$FFC5,$001C,$FFE8
    dw RTL_A9B5C5
    dw EnemyShot_MotherBrainBody
    dw $001C,$FFD7,$003A,$FFE1
    dw RTL_A9B5C5
    dw EnemyShot_MotherBrainBody


;;; $A586: Mother Brain spritemaps ;;;
Spritemaps_MotherBrain_0:
    dw $000B
    %spritemapEntry(0, $0C, $01, 0, 0, 2, 0, $133)
    %spritemapEntry(1, $02, $09, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $1E8, $04, 0, 0, 2, 0, $108)
    %spritemapEntry(1, $1F8, $04, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F8, $F4, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $08, $00, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $08, $F0, 0, 0, 2, 0, $11E)
    %spritemapEntry(1, $08, $E8, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $1F8, $E4, 0, 0, 2, 0, $10A)
    %spritemapEntry(0, $1F0, $EC, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $1E8, $F4, 0, 0, 2, 0, $106)

Spritemaps_MotherBrain_1:
    dw $000B
    %spritemapEntry(0, $0C, $01, 0, 0, 2, 0, $132)
    %spritemapEntry(1, $02, $09, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $1E8, $04, 0, 0, 2, 0, $108)
    %spritemapEntry(1, $1F8, $04, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F8, $F4, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $08, $00, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $08, $F0, 0, 0, 2, 0, $11E)
    %spritemapEntry(1, $08, $E8, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $1F8, $E4, 0, 0, 2, 0, $10A)
    %spritemapEntry(0, $1F0, $EC, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $1E8, $F4, 0, 0, 2, 0, $106)

Spritemaps_MotherBrain_2:
    dw $000A
    %spritemapEntry(1, $02, $09, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $1E8, $04, 0, 0, 2, 0, $108)
    %spritemapEntry(1, $1F8, $04, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F8, $F4, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $08, $00, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $08, $F0, 0, 0, 2, 0, $11E)
    %spritemapEntry(1, $08, $E8, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $1F8, $E4, 0, 0, 2, 0, $10A)
    %spritemapEntry(0, $1F0, $EC, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $1E8, $F4, 0, 0, 2, 0, $106)

Spritemaps_MotherBrain_3:
    dw $000A
    %spritemapEntry(1, $1FF, $0E, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $1E8, $04, 0, 0, 2, 0, $108)
    %spritemapEntry(1, $1F8, $04, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F8, $F4, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $08, $00, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $08, $F0, 0, 0, 2, 0, $11E)
    %spritemapEntry(1, $08, $E8, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $1F8, $E4, 0, 0, 2, 0, $10A)
    %spritemapEntry(0, $1F0, $EC, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $1E8, $F4, 0, 0, 2, 0, $106)

Spritemaps_MotherBrain_4:
    dw $000A
    %spritemapEntry(1, $1FC, $10, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $1E8, $04, 0, 0, 2, 0, $108)
    %spritemapEntry(1, $1F8, $04, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $1F8, $F4, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $08, $00, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $08, $F0, 0, 0, 2, 0, $11E)
    %spritemapEntry(1, $08, $E8, 0, 0, 2, 0, $10E)
    %spritemapEntry(1, $1F8, $E4, 0, 0, 2, 0, $10A)
    %spritemapEntry(0, $1F0, $EC, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $1E8, $F4, 0, 0, 2, 0, $106)

Spritemaps_MotherBrain_5:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $12A)

Spritemaps_MotherBrain_6:
    dw $000C
    %spritemapEntry(0, $0C, $01, 0, 0, 2, 0, $133)
    %spritemapEntry(1, $02, $09, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $08, $00, 0, 0, 2, 0, $104)
    %spritemapEntry(0, $08, $E8, 0, 0, 2, 0, $123)
    %spritemapEntry(1, $08, $F0, 0, 0, 2, 0, $13E)
    %spritemapEntry(1, $1F8, $E4, 0, 0, 2, 0, $13C)
    %spritemapEntry(1, $1F8, $F4, 0, 0, 2, 0, $128)
    %spritemapEntry(1, $1F8, $04, 0, 0, 2, 0, $102)
    %spritemapEntry(0, $1F0, $0C, 0, 0, 2, 0, $14B)
    %spritemapEntry(0, $1F0, $EC, 0, 0, 2, 0, $14A)
    %spritemapEntry(1, $1E8, $F4, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1E8, $FC, 0, 0, 2, 0, $11C)

Spritemaps_MotherBrain_7:
    dw $000C
    %spritemapEntry(0, $0C, $01, 0, 0, 2, 0, $132)
    %spritemapEntry(1, $02, $09, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $08, $00, 0, 0, 2, 0, $104)
    %spritemapEntry(0, $08, $E8, 0, 0, 2, 0, $123)
    %spritemapEntry(1, $08, $F0, 0, 0, 2, 0, $13E)
    %spritemapEntry(1, $1F8, $E4, 0, 0, 2, 0, $13C)
    %spritemapEntry(1, $1F8, $F4, 0, 0, 2, 0, $128)
    %spritemapEntry(1, $1F8, $04, 0, 0, 2, 0, $102)
    %spritemapEntry(0, $1F0, $0C, 0, 0, 2, 0, $14B)
    %spritemapEntry(0, $1F0, $EC, 0, 0, 2, 0, $14A)
    %spritemapEntry(1, $1E8, $F4, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1E8, $FC, 0, 0, 2, 0, $11C)

Spritemaps_MotherBrain_8:
    dw $000B
    %spritemapEntry(1, $02, $09, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $08, $00, 0, 0, 2, 0, $104)
    %spritemapEntry(0, $08, $E8, 0, 0, 2, 0, $123)
    %spritemapEntry(1, $08, $F0, 0, 0, 2, 0, $13E)
    %spritemapEntry(1, $1F8, $E4, 0, 0, 2, 0, $13C)
    %spritemapEntry(1, $1F8, $F4, 0, 0, 2, 0, $128)
    %spritemapEntry(1, $1F8, $04, 0, 0, 2, 0, $102)
    %spritemapEntry(0, $1F0, $0C, 0, 0, 2, 0, $14B)
    %spritemapEntry(0, $1F0, $EC, 0, 0, 2, 0, $14A)
    %spritemapEntry(1, $1E8, $F4, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1E8, $FC, 0, 0, 2, 0, $11C)

Spritemaps_MotherBrain_9:
    dw $000B
    %spritemapEntry(1, $1FF, $0E, 0, 0, 2, 0, $124)
    %spritemapEntry(1, $08, $00, 0, 0, 2, 0, $104)
    %spritemapEntry(0, $08, $E8, 0, 0, 2, 0, $123)
    %spritemapEntry(1, $08, $F0, 0, 0, 2, 0, $13E)
    %spritemapEntry(1, $1F8, $E4, 0, 0, 2, 0, $13C)
    %spritemapEntry(1, $1F8, $F4, 0, 0, 2, 0, $128)
    %spritemapEntry(1, $1F8, $04, 0, 0, 2, 0, $102)
    %spritemapEntry(0, $1F0, $0C, 0, 0, 2, 0, $14B)
    %spritemapEntry(0, $1F0, $EC, 0, 0, 2, 0, $14A)
    %spritemapEntry(1, $1E8, $F4, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1E8, $FC, 0, 0, 2, 0, $11C)

Spritemaps_MotherBrain_A:
    dw $000B
    %spritemapEntry(1, $1FC, $10, 0, 0, 2, 0, $126)
    %spritemapEntry(1, $08, $00, 0, 0, 2, 0, $104)
    %spritemapEntry(0, $08, $E8, 0, 0, 2, 0, $123)
    %spritemapEntry(1, $08, $F0, 0, 0, 2, 0, $13E)
    %spritemapEntry(1, $1F8, $E4, 0, 0, 2, 0, $13C)
    %spritemapEntry(1, $1F8, $F4, 0, 0, 2, 0, $128)
    %spritemapEntry(1, $1F8, $04, 0, 0, 2, 0, $102)
    %spritemapEntry(0, $1F0, $0C, 0, 0, 2, 0, $14B)
    %spritemapEntry(0, $1F0, $EC, 0, 0, 2, 0, $14A)
    %spritemapEntry(1, $1E8, $F4, 0, 0, 2, 0, $10C)
    %spritemapEntry(1, $1E8, $FC, 0, 0, 2, 0, $11C)

Spritemaps_MotherBrain_B:
    dw $0009
    %spritemapEntry(0, $1C, $1C, 0, 0, 3, 1, $17B)
    %spritemapEntry(1, $14, $0C, 0, 0, 3, 1, $15A)
    %spritemapEntry(1, $0C, $14, 0, 0, 3, 1, $169)
    %spritemapEntry(0, $0C, $0C, 0, 0, 3, 1, $166)
    %spritemapEntry(0, $14, $04, 1, 1, 3, 1, $178)
    %spritemapEntry(0, $04, $14, 0, 0, 3, 1, $178)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 3, 1, $147)
    %spritemapEntry(1, $1FC, $04, 0, 0, 3, 1, $157)
    %spritemapEntry(1, $04, $FC, 0, 0, 3, 1, $148)

Spritemaps_MotherBrain_C:
    dw $0006
    %spritemapEntry(1, $1D, $03, 0, 0, 3, 1, $15E)
    %spritemapEntry(1, $1D, $0B, 0, 0, 3, 1, $16E)
    %spritemapEntry(1, $0D, $0B, 0, 0, 3, 1, $162)
    %spritemapEntry(1, $0D, $FB, 0, 0, 3, 1, $160)
    %spritemapEntry(1, $1FD, $03, 0, 0, 3, 1, $16C)
    %spritemapEntry(1, $1FD, $FB, 0, 0, 3, 1, $15C)

Spritemaps_MotherBrain_D:
    dw $0008
    %spritemapEntry(0, $28, $00, 1, 0, 3, 1, $177)
    %spritemapEntry(0, $28, $F8, 0, 0, 3, 1, $177)
    %spritemapEntry(1, $18, $00, 1, 0, 3, 1, $143)
    %spritemapEntry(1, $18, $F0, 0, 0, 3, 1, $143)
    %spritemapEntry(1, $10, $00, 1, 0, 3, 1, $142)
    %spritemapEntry(1, $00, $00, 1, 0, 3, 1, $140)
    %spritemapEntry(1, $10, $F0, 0, 0, 3, 1, $142)
    %spritemapEntry(1, $00, $F0, 0, 0, 3, 1, $140)

Spritemaps_MotherBrain_E:
    dw $0006
    %spritemapEntry(1, $1D, $ED, 1, 0, 3, 1, $15E)
    %spritemapEntry(1, $1D, $E5, 1, 0, 3, 1, $16E)
    %spritemapEntry(1, $0D, $E5, 1, 0, 3, 1, $162)
    %spritemapEntry(1, $0D, $F5, 1, 0, 3, 1, $160)
    %spritemapEntry(1, $1FD, $ED, 1, 0, 3, 1, $16C)
    %spritemapEntry(1, $1FD, $F5, 1, 0, 3, 1, $15C)

Spritemaps_MotherBrain_F:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 1, $164)

Spritemaps_MotherBrain_10:
    dw $0002
    %spritemapEntry(1, $1F8, $10, 0, 0, 3, 1, $188)
    %spritemapEntry(1, $1F8, $00, 0, 0, 3, 1, $145)

Spritemaps_MotherBrain_11:
    dw $0002
    %spritemapEntry(1, $1F3, $10, 0, 0, 3, 1, $18A)
    %spritemapEntry(1, $1F7, $00, 0, 0, 3, 1, $181)

Spritemaps_MotherBrain_12:
    dw $0004
    %spritemapEntry(0, $1FB, $0E, 0, 0, 3, 1, $176)
    %spritemapEntry(1, $1EB, $0E, 0, 0, 3, 1, $186)
    %spritemapEntry(1, $1FB, $FE, 0, 0, 3, 1, $184)
    %spritemapEntry(1, $1F3, $FE, 0, 0, 3, 1, $183)

Spritemaps_MotherBrain_13:
    dw $0004
    %spritemapEntry(0, $10, $00, 0, 0, 3, 1, $190)
    %spritemapEntry(0, $08, $00, 0, 0, 3, 1, $180)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 3, 1, $18E)
    %spritemapEntry(1, $1E8, $F8, 0, 0, 3, 1, $18C)

Spritemaps_MotherBrain_14:
    dw $0009
    %spritemapEntry(0, $1C, $1C, 0, 0, 2, 3, $17B)
    %spritemapEntry(1, $14, $0C, 0, 0, 2, 3, $15A)
    %spritemapEntry(1, $0C, $14, 0, 0, 2, 3, $169)
    %spritemapEntry(0, $0C, $0C, 0, 0, 2, 3, $166)
    %spritemapEntry(0, $14, $04, 1, 1, 2, 3, $178)
    %spritemapEntry(0, $04, $14, 0, 0, 2, 3, $178)
    %spritemapEntry(0, $1FC, $FC, 0, 0, 2, 3, $147)
    %spritemapEntry(1, $1FC, $04, 0, 0, 2, 3, $157)
    %spritemapEntry(1, $04, $FC, 0, 0, 2, 3, $148)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemaps_MotherBrain_A9A8D5:
    dw $0006
    %spritemapEntry(1, $1D, $03, 0, 0, 2, 3, $15E)
    %spritemapEntry(1, $1D, $0B, 0, 0, 2, 3, $16E)
    %spritemapEntry(1, $0D, $0B, 0, 0, 2, 3, $162)
    %spritemapEntry(1, $0D, $FB, 0, 0, 2, 3, $160)
    %spritemapEntry(1, $1FD, $03, 0, 0, 2, 3, $16C)
    %spritemapEntry(1, $1FD, $FB, 0, 0, 2, 3, $15C)

UNUSED_Spritemaps_MotherBrain_A9A8F5:
    dw $0008
    %spritemapEntry(0, $28, $00, 1, 0, 2, 3, $177)
    %spritemapEntry(0, $28, $F8, 0, 0, 2, 3, $177)
    %spritemapEntry(1, $18, $00, 1, 0, 2, 3, $143)
    %spritemapEntry(1, $18, $F0, 0, 0, 2, 3, $143)
    %spritemapEntry(1, $10, $00, 1, 0, 2, 3, $142)
    %spritemapEntry(1, $00, $00, 1, 0, 2, 3, $140)
    %spritemapEntry(1, $10, $F0, 0, 0, 2, 3, $142)
    %spritemapEntry(1, $00, $F0, 0, 0, 2, 3, $140)

UNUSED_Spritemaps_MotherBrain_A9A91F:
    dw $0006
    %spritemapEntry(1, $1D, $ED, 1, 0, 2, 3, $15E)
    %spritemapEntry(1, $1D, $E5, 1, 0, 2, 3, $16E)
    %spritemapEntry(1, $0D, $E5, 1, 0, 2, 3, $162)
    %spritemapEntry(1, $0D, $F5, 1, 0, 2, 3, $160)
    %spritemapEntry(1, $1FD, $ED, 1, 0, 2, 3, $16C)
    %spritemapEntry(1, $1FD, $F5, 1, 0, 2, 3, $15C)
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemaps_MotherBrain_15:
    dw $0001
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 3, $164)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemaps_MotherBrain_A9A946:
    dw $0002
    %spritemapEntry(1, $1F8, $10, 0, 0, 2, 3, $188)
    %spritemapEntry(1, $1F8, $00, 0, 0, 2, 3, $145)

UNUSED_Spritemaps_MotherBrain_A9A952:
    dw $0002
    %spritemapEntry(1, $1F3, $10, 0, 0, 2, 3, $18A)
    %spritemapEntry(1, $1F7, $00, 0, 0, 2, 3, $181)
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemaps_MotherBrain_16:
    dw $0004
    %spritemapEntry(0, $1FB, $0E, 0, 0, 2, 3, $176)
    %spritemapEntry(1, $1EB, $0E, 0, 0, 2, 3, $186)
    %spritemapEntry(1, $1FB, $FE, 0, 0, 2, 3, $184)
    %spritemapEntry(1, $1F3, $FE, 0, 0, 2, 3, $183)

Spritemaps_MotherBrain_17:
    dw $0004
    %spritemapEntry(0, $10, $00, 0, 0, 2, 3, $190)
    %spritemapEntry(0, $08, $00, 0, 0, 2, 3, $180)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 3, $18E)
    %spritemapEntry(1, $1E8, $F8, 0, 0, 2, 3, $18C)


ExtendedTilemaps_MotherBrain_0:
    dw $FFFE
    dw $2080,$0004, $2338,$2338,$31B7,$31B8
    dw $20C0,$0004, $2338,$31B9,$31BA,$31BB
    dw $2100,$0004, $2338,$31BC,$31BD,$31BE
    dw $2140,$000A, $31BF,$31C0,$31C1,$31C2,$31C3,$31C4,$31C5,$31C6,$31C7,$31C8
    dw $2180,$000A, $31CA,$31CB,$31CC,$31CD,$31CE,$31CF,$31D0,$2338,$2338,$2338
    dw $21C0,$000A, $31D1,$31D2,$31D3,$31D4,$31D5,$31D6,$31D7,$31D8,$2338,$2338
    dw $2200,$000A, $31D9,$31DA,$31DB,$31DC,$31DD,$31DE,$31DF,$31E0,$2338,$2338
    dw $2240,$000A, $31E1,$31E2,$31E3,$31E4,$31E5,$31E6,$31E7,$2338,$2338,$2338
    dw $2280,$000A, $2338,$31E8,$31E9,$31EA,$31EB,$31EC,$31ED,$2338,$2338,$2338
    dw $22C0,$0004, $2338,$2338,$31EE,$31EF
    dw $FFFF

if !FEATURE_KEEP_UNREFERENCED
UNUSED_ExtendedTilemaps_MotherBrain_A9AA4E:
    dw $FFFE
    dw $2084,$0002, $2338,$2338
    dw $20C2,$0003, $2338,$2338,$2338
    dw $2102,$0003, $2338,$2338,$2338
    dw $2140,$000A, $2338,$2338,$2338,$2338,$2338,$2338,$2338,$2338,$2338,$2338
    dw $2180,$0007, $2338,$2338,$2338,$2338,$2338,$2338,$2338
    dw $21C0,$0008, $2338,$2338,$2338,$2338,$2338,$2338,$2338,$2338
    dw $2200,$0008, $2338,$2338,$2338,$2338,$2338,$2338,$2338,$2338
    dw $2240,$0007, $2338,$2338,$2338,$2338,$2338,$2338,$2338
    dw $2282,$0006, $2338,$2338,$2338,$2338,$2338,$2338
    dw $22C4,$0002, $2338,$2338
    dw $FFFF
endif ; !FEATURE_KEEP_UNREFERENCED

ExtendedTilemaps_MotherBrain_1:
    dw $FFFE
    dw $2006,$000B, $2338,$2338,$3167,$3168,$3169,$2338,$2338,$2338,$2338,$2338,$2338
    dw $2046,$000B, $2338,$316A,$316B,$316C,$316D,$316E,$2338,$2338,$2338,$2338,$2338
    dw $2086,$000B, $31B8,$316F,$3170,$3171,$3172,$3173,$3174,$3186,$3187,$2338,$2338
    dw $20C6,$000B, $31BB,$3177,$3178,$3179,$317A,$317B,$317C,$3188,$3189,$2338,$2338
    dw $2106,$000B, $31BE,$317F,$3180,$3181,$3182,$3183,$3184,$3185,$2338,$2338,$2338
    dw $FFFF

ExtendedTilemaps_MotherBrain_2:
    dw $FFFE
    dw $2006,$000B, $2338,$2338,$3167,$3168,$3169,$2338,$2338,$2338,$2338,$2338,$2338
    dw $2046,$000B, $2338,$316A,$316B,$316C,$316D,$316E,$2338,$2338,$2338,$2338,$2338
    dw $2086,$000B, $31B8,$316F,$3170,$3171,$3172,$3173,$3174,$3175,$3176,$2338,$2338
    dw $20C6,$000B, $31BB,$3177,$3178,$3179,$317A,$317B,$317C,$317D,$317E,$2338,$2338
    dw $2106,$000B, $31BE,$317F,$3180,$3181,$3182,$3183,$3184,$3185,$2338,$2338,$2338
    dw $FFFF

ExtendedTilemaps_MotherBrain_3:
    dw $FFFE
    dw $2006,$0001, $2338
    dw $200A,$0002, $318A,$318B
    dw $2018,$0002, $2338,$2338
    dw $2046,$0001, $2338
    dw $204A,$0003, $318C,$318D,$318E
    dw $2058,$0002, $2338,$2338
    dw $2086,$000B, $31B8,$318F,$3190,$3191,$3192,$3193,$3194,$2338,$2338,$2338,$2338
    dw $20C6,$000B, $31BB,$3195,$3196,$3197,$3198,$3199,$319A,$319B,$2338,$2338,$2338
    dw $2106,$0001, $31BE
    dw $210C,$0004, $319C,$319D,$319E,$319F
    dw $2118,$0002, $2338,$2338
    dw $FFFF

ExtendedTilemaps_MotherBrain_4:
    dw $FFFE
    dw $200A,$0003, $3167,$31A0,$31A1
    dw $2046,$0001, $31B6
    dw $204A,$0004, $31A2,$31A3,$31A4,$31A5
    dw $2056,$0003, $31A6,$31A7,$31A8
    dw $2088,$000A, $316F,$31A9,$31AA,$31AB,$31AC,$31AD,$31AE,$31AF,$31B0,$31B1
    dw $20C8,$0007, $3177,$3178,$3178,$31B2,$31B3,$31B4,$31B5
    dw $2106,$0001, $31BE
    dw $210C,$0004, $319C,$319D,$319E,$319F
    dw $2118,$0002, $2338,$2338
    dw $FFFF

ExtendedTilemaps_MotherBrain_5:
    dw $FFFE
    dw $200C,$0002, $3168,$3169
    dw $2046,$0001, $2338
    dw $204A,$0004, $316B,$316C,$316D,$316E
    dw $2056,$0003, $2338,$2338,$2338
    dw $208A,$0009, $3170,$3171,$3172,$3173,$3174,$3186,$3187,$2338,$2338
    dw $20CC,$0006, $3179,$317A,$317B,$317C,$3188,$3189
    dw $210C,$0004, $3181,$3182,$3183,$3184
    dw $FFFF

Spritemaps_MotherBrain_18:
    dw $0009
    %spritemapEntry(1, $08, $08, 0, 0, 2, 0, $1E4)
    %spritemapEntry(1, $1F8, $08, 0, 0, 2, 0, $1E2)
    %spritemapEntry(1, $1E8, $08, 0, 0, 2, 0, $1E0)
    %spritemapEntry(1, $08, $F8, 0, 0, 2, 0, $1C4)
    %spritemapEntry(1, $1F8, $F8, 0, 0, 2, 0, $1C2)
    %spritemapEntry(1, $1E8, $F8, 0, 0, 2, 0, $1C0)
    %spritemapEntry(1, $08, $E8, 0, 0, 2, 0, $1A4)
    %spritemapEntry(1, $1F8, $E8, 0, 0, 2, 0, $1A2)
    %spritemapEntry(1, $1E8, $E8, 0, 0, 2, 0, $1A0)

Spritemaps_MotherBrain_19:
    dw $000A
    %spritemapEntry(1, $14, $08, 0, 0, 2, 0, $1EC)
    %spritemapEntry(1, $04, $08, 0, 0, 2, 0, $1EA)
    %spritemapEntry(1, $1F4, $08, 0, 0, 2, 0, $1E8)
    %spritemapEntry(1, $1E4, $08, 0, 0, 2, 0, $1E6)
    %spritemapEntry(1, $04, $F8, 0, 0, 2, 0, $1CA)
    %spritemapEntry(1, $1F4, $F8, 0, 0, 2, 0, $1C8)
    %spritemapEntry(1, $1E4, $F8, 0, 0, 2, 0, $1C6)
    %spritemapEntry(1, $04, $E8, 0, 0, 2, 0, $1AA)
    %spritemapEntry(1, $1F4, $E8, 0, 0, 2, 0, $1A8)
    %spritemapEntry(1, $1E4, $E8, 0, 0, 2, 0, $1A6)

Spritemaps_MotherBrainTubes_0:
    dw $000A
    %spritemapEntry(0, $08, $E4, 0, 0, 2, 7, $15D)
    %spritemapEntry(0, $08, $DC, 0, 0, 2, 7, $14D)
    %spritemapEntry(0, $00, $E4, 0, 0, 2, 7, $15D)
    %spritemapEntry(0, $00, $DC, 0, 0, 2, 7, $14D)
    %spritemapEntry(1, $43F0, $DC, 0, 0, 2, 7, $142)
    %spritemapEntry(0, $1F8, $1C, 0, 0, 2, 7, $151)
    %spritemapEntry(0, $1F0, $1C, 0, 0, 2, 7, $150)
    %spritemapEntry(1, $43F0, $FC, 0, 0, 2, 7, $147)
    %spritemapEntry(1, $43F0, $EC, 1, 0, 2, 7, $140)
    %spritemapEntry(1, $43F0, $0C, 0, 0, 2, 7, $140)

Spritemaps_MotherBrainTubes_1:
    dw $000A
    %spritemapEntry(0, $1F0, $E4, 0, 1, 2, 7, $15D)
    %spritemapEntry(0, $1F0, $DC, 0, 1, 2, 7, $14D)
    %spritemapEntry(0, $1F8, $E4, 0, 1, 2, 7, $15D)
    %spritemapEntry(0, $1F8, $DC, 0, 1, 2, 7, $14D)
    %spritemapEntry(1, $4200, $DC, 0, 1, 2, 7, $142)
    %spritemapEntry(0, $00, $1C, 0, 1, 2, 7, $151)
    %spritemapEntry(0, $08, $1C, 0, 1, 2, 7, $150)
    %spritemapEntry(1, $4200, $FC, 0, 1, 2, 7, $147)
    %spritemapEntry(1, $4200, $EC, 1, 1, 2, 7, $140)
    %spritemapEntry(1, $4200, $0C, 0, 1, 2, 7, $140)

Spritemaps_MotherBrainTubes_2:
    dw $0008
    %spritemapEntry(1, $43F8, $E4, 0, 0, 2, 7, $144)
    %spritemapEntry(0, $00, $14, 0, 0, 2, 7, $151)
    %spritemapEntry(0, $1F8, $14, 0, 0, 2, 7, $150)
    %spritemapEntry(1, $43F8, $04, 0, 0, 2, 7, $14B)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 7, $151)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 7, $150)
    %spritemapEntry(0, $00, $F4, 0, 0, 2, 7, $151)
    %spritemapEntry(0, $1F8, $F4, 0, 0, 2, 7, $150)

Spritemaps_MotherBrainTubes_3:
    dw $0008
    %spritemapEntry(1, $43F8, $E4, 0, 1, 2, 7, $144)
    %spritemapEntry(0, $1F8, $14, 0, 1, 2, 7, $151)
    %spritemapEntry(0, $00, $14, 0, 1, 2, 7, $150)
    %spritemapEntry(1, $43F8, $04, 0, 0, 2, 7, $14B)
    %spritemapEntry(0, $1F8, $FC, 0, 1, 2, 7, $151)
    %spritemapEntry(0, $00, $FC, 0, 1, 2, 7, $150)
    %spritemapEntry(0, $1F8, $F4, 0, 1, 2, 7, $151)
    %spritemapEntry(0, $00, $F4, 0, 1, 2, 7, $150)

Spritemaps_MotherBrainTubes_4:
    dw $001A
    %spritemapEntry(0, $00, $E0, 0, 1, 2, 7, $170)
    %spritemapEntry(0, $1F8, $E0, 0, 0, 2, 7, $170)
    %spritemapEntry(0, $00, $D8, 0, 1, 2, 7, $160)
    %spritemapEntry(0, $1F8, $D8, 0, 0, 2, 7, $160)
    %spritemapEntry(0, $08, $28, 0, 0, 2, 7, $16D)
    %spritemapEntry(0, $00, $28, 0, 0, 2, 7, $16D)
    %spritemapEntry(0, $1F8, $28, 0, 0, 2, 7, $16D)
    %spritemapEntry(0, $1F0, $28, 0, 0, 2, 7, $16D)
    %spritemapEntry(0, $08, $20, 0, 0, 2, 7, $16D)
    %spritemapEntry(0, $00, $20, 0, 0, 2, 7, $16D)
    %spritemapEntry(0, $1F8, $20, 0, 0, 2, 7, $16D)
    %spritemapEntry(0, $1F0, $20, 0, 0, 2, 7, $16D)
    %spritemapEntry(0, $08, $18, 0, 0, 2, 7, $16C)
    %spritemapEntry(0, $00, $18, 0, 0, 2, 7, $16C)
    %spritemapEntry(0, $1F8, $18, 0, 0, 2, 7, $16C)
    %spritemapEntry(0, $1F0, $18, 0, 0, 2, 7, $16C)
    %spritemapEntry(1, $4200, $F8, 0, 1, 2, 7, $149)
    %spritemapEntry(1, $43F0, $F8, 0, 0, 2, 7, $149)
    %spritemapEntry(1, $4200, $08, 0, 1, 2, 7, $146)
    %spritemapEntry(1, $43F0, $08, 0, 0, 2, 7, $146)
    %spritemapEntry(1, $4200, $E8, 0, 0, 2, 7, $140)
    %spritemapEntry(1, $43F0, $E8, 0, 0, 2, 7, $140)
    %spritemapEntry(1, $4200, $D8, 1, 1, 2, 7, $14E)
    %spritemapEntry(1, $43F0, $D8, 1, 0, 2, 7, $14E)
    %spritemapEntry(1, $4200, $D0, 1, 1, 2, 7, $15E)
    %spritemapEntry(1, $43F0, $D0, 1, 0, 2, 7, $15E)


;;; $AEE1: Mother Brain body function - third phase - death sequence - move to back of room ;;;
Function_MBBody_Phase3_DeathSequence_MoveToBackOfRoom:
    LDA.W Enemy.properties : ORA.W #$0400 : STA.W Enemy.properties
    LDA.W Enemy[1].properties : ORA.W #$0400 : STA.W Enemy[1].properties
    LDA.W #$0000 : STA.L MotherBrainBody.hitboxesEnabled
    LDY.W #$0006
    LDA.W #$0028
    JSR MakeMotherBrainWalkBackwards
    BCS .arrivedAtBack
    RTS

  .arrivedAtBack:
    LDA.W #Function_MBBody_Phase3_DeathSequence_IdleWhilstExploding : STA.W MotherBrainBody.function
    LDA.W #$0080 : STA.W MotherBrainBody.functionTimer
; fallthrough to Function_MBBody_Phase3_DeathSequence_IdleWhilstExploding


;;; $AF12: Mother Brain body function - third phase - death sequence - idle whilst exploding ;;;
Function_MBBody_Phase3_DeathSequence_IdleWhilstExploding:
    JSR GenerateSmokyExplosionsAroundMotherBrainBody
    DEC.W MotherBrainBody.functionTimer : BPL .return
    LDA.W #Function_MBBody_Phase3_DeathSequence_StumbleToMiddleOfRoom : STA.W MotherBrainBody.function

  .return:
    RTS


;;; $AF21: Mother Brain body function - third phase - death sequence - stumble to middle of room and drool ;;;
Function_MBBody_Phase3_DeathSequence_StumbleToMiddleOfRoom:
    JSR GenerateSmokyExplosionsAroundMotherBrainBody
    LDY.W #$0002
    LDA.W #$0060
    JSR MakeMotherBrainWalkForwards
    BCC Function_MBBody_Phase3_DeathSequence_IdleWhilstExploding_return
    LDA.W #InstList_MotherBrainHead_DyingDrool_0
    JSR SetMotherBrainHeadInstList
    LDA.W #$0006 : STA.L MotherBrainBody.lowerNeckMovementIndex : STA.L MotherBrainBody.upperNeckMovementIndex
    LDA.W #$0500 : STA.L MotherBrainBody.neckAngleDelta
    LDA.W #Function_MBBody_Phase3_DeathSequence_DisableBrainEffects : STA.W MotherBrainBody.function
    LDA.W #$0020 : STA.W MotherBrainBody.functionTimer
    RTS


;;; $AF54: Mother Brain body function - third phase - death sequence - disable brain effects ;;;
Function_MBBody_Phase3_DeathSequence_DisableBrainEffects:
    JSR GenerateSmokyExplosionsAroundMotherBrainBody
    DEC.W MotherBrainBody.functionTimer : BPL Function_MBBody_Phase3_DeathSequence_IdleWhilstExploding_return
    LDA.W #$0000 : STA.L MotherBrainBody.lowerNeckMovementIndex : STA.L MotherBrainBody.upperNeckMovementIndex
    STA.L MotherBrainBody.enableDroolGenerationFlag : STA.L MotherBrainBody.smallPurpleBreathGenerationEnabledFlag
    STA.L MotherBrainBody.enableBrainPaletteHandlingFlag : STA.L MotherBrainBody.enableHealthBasedPaletteHandlingFlag
    LDX.W #$001C

  .loopPalette:
    LDA.L Palettes_SpriteP1+2,X : STA.L Palettes_SpriteP7+2,X
    DEX #2 : BPL .loopPalette
    JSL MotherBrainHealthBasedPaletteHandling
    LDA.W #$0E00 : STA.L MotherBrainBody.brainPalleteIndex
    STZ.W MotherBrainBody.subFunction : STZ.W MotherBrainBody.bodySubFunctionTimer
    LDA.W #Function_MBBody_Phase3_DeathSequence_SetupBodyFadeOut : STA.W MotherBrainBody.function
; fallthrough to Function_MBBody_Phase3_DeathSequence_SetupBodyFadeOut


;;; $AF9D: Mother Brain body function - third phase - death sequence - set up body fade out ;;;
Function_MBBody_Phase3_DeathSequence_SetupBodyFadeOut:
; Function timer is already negative coming into this function...
    JSR GenerateMixedExplosionsAroundMotherBrainBody
    DEC.W MotherBrainBody.functionTimer : BMI .timerExpired
    RTS

  .timerExpired:
    LDA.W #$0000 : STA.L MotherBrainBody.greyTransitionCounter
    LDA.W #Function_MBBody_Phase3_DeathSequence_FadeOutBody : STA.W MotherBrainBody.function
    STZ.W MotherBrainBody.functionTimer
; fallthrough to Function_MBBody_Phase3_DeathSequence_FadeOutBody


;;; $AFB6: Mother Brain body function - third phase - death sequence - fade out body ;;;
Function_MBBody_Phase3_DeathSequence_FadeOutBody:
    JSL HandleMotherBrainBodyFlickering
    JSR GenerateMixedExplosionsAroundMotherBrainBody
    DEC.W MotherBrainBody.functionTimer : BPL .returnUpper
    LDA.W #$0010 : STA.W MotherBrainBody.functionTimer
    LDA.L MotherBrainBody.greyTransitionCounter : INC : STA.L MotherBrainBody.greyTransitionCounter
    DEC
    JSL FadeMotherBrainPaletteToBlack
    BCS .fadedToBlack

  .returnUpper:
    RTS

  .fadedToBlack:
    LDA.W #$02C6 : STA.W EnemyBG2TilemapSize
    TAX
    PHB
    PEA $7E7E : PLB : PLB
    LDA.W #$0338 ; >.< off by one, causing a few black pixels to remain

  .loopTilemap:
    STA.W EnemyBG2Tilemap,X
    DEX #2 : BPL .loopTilemap
    PLB
    LDA.W #$0001 : STA.W RequestEnemyBG2TilemapTransferFlag
    LDA.W Enemy.properties : ORA.W #$0100 : AND.W #$DFFF : STA.W Enemy.properties
    STZ.W Enemy.properties2
    LDA.W #Function_MBBody_Phase3_DeathSequence_FinalFewExplosions : STA.W MotherBrainBody.function
    LDA.W #$0010 : STA.W MotherBrainBody.functionTimer

  .returnLower:
    RTS


;;; $B013: Mother Brain body function - third phase - death sequence - final few explosions ;;;
Function_MBBody_Phase3_DeathSequence_FinalFewExplosions:
    JSR GenerateMixedExplosionsAroundMotherBrainBody
    DEC.W MotherBrainBody.functionTimer : BPL Function_MBBody_Phase3_DeathSequence_FadeOutBody_returnLower
    LDA.W #Function_MBBody_Phase3_DeathSequence_RealizeDecapitation : STA.W MotherBrainBody.function
    RTS


;;; $B022: Generate smoky explosions around Mother Brain body ;;;
GenerateSmokyExplosionsAroundMotherBrainBody:
    LDA.W #MotherBrainExplosionParameters_1 : STA.B DP_Temp16
    LDA.W #$0002 : STA.B DP_Temp18
    LDA.W #$0010
    BRA GenerateExplosionsAroundMotherBrainBody


;;; $B031: Generate mixed explosions around Mother Brain body ;;;
GenerateMixedExplosionsAroundMotherBrainBody:
    LDA.W #MotherBrainExplosionParameters_0 : STA.B DP_Temp16
    LDA.W #$0004 : STA.B DP_Temp18
    LDA.W #$0008
; fallthrough to GenerateExplosionsAroundMotherBrainBody


;;; $B03E: Generate explosions around Mother Brain body ;;;
GenerateExplosionsAroundMotherBrainBody:
;; Parameters:
;;     A: Mother Brain death explosion interval length
;;     $16: Explosion type set pointer
;;     $18: Number of simultaneous explosions
    DEC.W MotherBrainBody.deathExplosionIntervalTimer : BPL Function_MBBody_Phase3_DeathSequence_FadeOutBody_returnLower
    STA.W MotherBrainBody.deathExplosionIntervalTimer
    DEC.W MotherBrainBody.deathExplosionIndex : BPL .getIndex
    LDA.W #$0006 : STA.W MotherBrainBody.deathExplosionIndex

  .getIndex:
    LDA.W MotherBrainBody.deathExplosionIndex : ASL #4 : TAX
    LDA.B DP_Temp18

  .loop:
    PHA : PHX
    LDA.W .XOffset,X : STA.B DP_Temp12
    LDA.W .YOffset,X : STA.B DP_Temp14
    LDX.B DP_Temp16
    LDY.W $0000,X
    JSL GenerateRandomNumber
    CMP.W #$4000 : BCC .random
    LDY.W $0002,X
    CMP.W #$E000 : BCC .random
    LDY.W $0004,X

  .random:
    TYA
    LDY.W #EnemyProjectile_MotherBrainDeathExplosion
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    PLX : PLA
    INX #4
    DEC : BNE .loop
    LDA.W #$0013
    JSL QueueSound_Lib3_Max3
    RTS

  .XOffset:
    dw $0024
  .YOffset:
    dw       $FFDB
    dw              $FFED,$FFF1, $FFFC,$000D, $001D,$0019
    dw $0011,$FFC9, $001E,$FFEA, $FFFD,$FFFB, $0000,$0028
    dw $0034,$FFDE, $FFFD,$FFF1, $000C,$0013, $0019,$002C
    dw $0004,$FFD5, $FFF4,$FFEA, $000D,$FFFE, $FFF8,$0034
    dw $FFFE,$FFDF, $000A,$FFF6, $FFF2,$0010, $0006,$003B
    dw $0014,$FFD7, $0004,$FFEA, $FFEC,$0003, $FFE5,$0039
    dw $000A,$FFE1, $FFEC,$FFF8, $0000,$0017, $001E,$003D


MotherBrainExplosionParameters:
; Enemy projectile parameters
;     0: small explosion
;     1: smoke
;     2: big explosion
;        _______________ 25% chance
;       |      _________ 62.5% chance
;       |     |      ___ 12.5% chance
;       |     |     |
  .0:
    dw $0000,$0001,$0002
  .1:
    dw $0001,$0001,$0001


;;; $B115: Mother Brain body function - third phase - death sequence - realise decapitation ;;;
Function_MBBody_Phase3_DeathSequence_RealizeDecapitation:
    LDA.W #InstList_MotherBrainHead_Decapitated_0
    JSR SetMotherBrainHeadInstList
    LDA.W #Function_MotherBrain_SetupBrainToBeDrawn : STA.W MotherBrainBody.brainFunction
    LDA.W #$0000 : STA.W MotherBrainBody.functionTimer
    LDA.W #Function_MBBody_Phase3_DeathSequence_BrainFallsToGround : STA.W MotherBrainBody.function
; fallthrough to Function_MBBody_Phase3_DeathSequence_BrainFallsToGround


;;; $B12D: Mother Brain body function - third phase - death sequence - brain falls to ground ;;;
Function_MBBody_Phase3_DeathSequence_BrainFallsToGround:
    LDA.W MotherBrainBody.functionTimer : CLC : ADC.W #$0020 : STA.W MotherBrainBody.functionTimer
    XBA : AND.W #$00FF : CLC : ADC.W Enemy[1].YPosition : CMP.W #$00C4 : BCC .hitGround
    LDA.W #$0002
    JSL EnableEarthquakeTypeInAFor20Frames
    LDA.W #Function_MBBody_Phase3_DeathSequence_LoadCorpseTiles : STA.W MotherBrainBody.function
    LDA.W #$0100 : STA.W MotherBrainBody.functionTimer
    LDA.W #$00C4

  .hitGround:
    STA.W Enemy[1].YPosition
    RTS


;;; $B15E: Mother Brain body function - third phase - death sequence - load corpse tiles ;;;
Function_MBBody_Phase3_DeathSequence_LoadCorpseTiles:
    LDX.W #MotherBrainFightSpriteTileTransferEntries_corpse
    JSR ProcessSpriteTilesTransfers
    BCC .return
    LDA.W #Function_MBBody_Phase3_DeathSequence_SetupFadeToGrey : STA.W MotherBrainBody.function
    LDA.W #$0020 : STA.W MotherBrainBody.functionTimer

  .return:
    RTS


;;; $B173: Mother Brain body function - third phase - death sequence - set up fade to grey ;;;
Function_MBBody_Phase3_DeathSequence_SetupFadeToGrey:
    DEC.W MotherBrainBody.functionTimer : BPL Function_MBBody_Phase3_DeathSequence_LoadCorpseTiles_return
    LDA.W #$0000 : STA.L MotherBrainBody.greyTransitionCounter
    LDA.W #Function_MBBody_Phase3_DeathSequence_FadeToGrey : STA.W MotherBrainBody.function
    STZ.W MotherBrainBody.functionTimer
    RTS


;;; $B189: Mother Brain body function - third phase - death sequence - fade to grey ;;;
Function_MBBody_Phase3_DeathSequence_FadeToGrey:
    DEC.W MotherBrainBody.functionTimer : BPL .return
    LDA.L MotherBrainBody.greyTransitionCounter : INC : STA.L MotherBrainBody.greyTransitionCounter
    DEC
    JSL TransitionMotherBrainPaletteToGrey_RealDeath
    BCS .finishedTransition
    LDA.W #$0010 : STA.W MotherBrainBody.functionTimer

  .return:
    RTS

  .finishedTransition:
    LDA.W #InstList_MotherBrainHead_Corpse_0
    JSR SetMotherBrainHeadInstList
    LDA.W #Function_MBBody_Phase3_DeathSequence_CorpseTipsOver : STA.W MotherBrainBody.function
    LDA.W #$0100 : STA.W MotherBrainBody.functionTimer
    RTS


;;; $B1B8: Mother Brain body function - third phase - death sequence - corpse tips over ;;;
Function_MBBody_Phase3_DeathSequence_CorpseTipsOver:
    DEC.W MotherBrainBody.functionTimer : BMI .timerExpired
    RTS

  .timerExpired:
    LDA.W #Function_MBBody_Phase3_DeathSequence_CorpseRotsAway : STA.W MotherBrainBody.function
    LDA.W Enemy[1].properties : ORA.W #$0400 : STA.W Enemy[1].properties
    LDA.W #$0000 : STA.L MotherBrainBody.hitboxesEnabled
    RTS


;;; $B1D5: Mother Brain body function - third phase - death sequence - corpse rots away ;;;
Function_MBBody_Phase3_DeathSequence_CorpseRotsAway:
    LDX.W #$0040
    JSR ProcessCorpseRotting
    BCC .finishedRotting
    LDX.W #$0040 ; >.<
    LDA.L MotherBrainBody.corpseRottingVRAMTransfersPointer,X : TAX
    JMP ProcessCorpseRottingVRAMTransfers

  .finishedRotting:
    LDA.W Enemy[1].properties : ORA.W #$0100 : AND.W #$DFFF : STA.W Enemy[1].properties
    STZ.W Enemy[1].properties2
    LDA.W #$0000
    JSL QueueMusicDataOrTrack_8FrameDelay
    LDA.W #$FF24
    JSL QueueMusicDataOrTrack_8FrameDelay
    LDA.W #Function_MBBody_Phase3_DeathSequence_20FrameDelay : STA.W MotherBrainBody.function
    LDA.W #$0014 : STA.W MotherBrainBody.functionTimer
; fallthrough to Function_MBBody_Phase3_DeathSequence_20FrameDelay


;;; $B211: Mother Brain body function - third phase - death sequence - 20 frame delay ;;;
Function_MBBody_Phase3_DeathSequence_20FrameDelay:
    DEC.W MotherBrainBody.functionTimer : BPL .return
    STZ.W Enemy[1].XPosition : STZ.W Enemy[1].YPosition
    LDA.W #Function_MBBody_Phase3_DeathSequence_LoadEscapeTimerTiles : STA.W MotherBrainBody.function

  .return:
    RTS


;;; $B223: Corpse rotting rot entry finished hook - Mother Brain ;;;
CorpseRottingRotEntryFinishedHook_MotherBrain:
    PHX
    LDA.W RandomNumberSeed : AND.W #$001F : CLC : ADC.W Enemy[1].XPosition
    CLC : ADC.W #$FFF0 : STA.B DP_Temp12
    LDA.W Enemy[1].YPosition : CLC : ADC.W #$0010 : STA.B DP_Temp14
    LDA.W #$000A
    LDY.W #EnemyProjectile_MiscDust
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    LDA.W NumberOfTimesMainEnemyRoutineExecuted : AND.W #$0007 : BNE .return
    LDA.W #$0010
    JSL QueueSound_Lib2_Max3

  .return:
    PLX
    RTS


;;; $B258: Mother Brain body function - third phase - death sequence - load escape timer tiles ;;;
Function_MBBody_Phase3_DeathSequence_LoadEscapeTimerTiles:
    PHB
    PEA.W ZebesEscapeTimerSpriteTileTransferEntries>>8&$FF00 : PLB : PLB
    LDX.W #ZebesEscapeTimerSpriteTileTransferEntries_size
    JSR ProcessSpriteTilesTransfers
    PLB
    BCC Function_MBBody_Phase3_DeathSequence_StartEscape_return
    LDA.W #Function_MBBody_Phase3_DeathSequence_StartEscape : STA.W MotherBrainBody.function
; fallthrough to Function_MBBody_Phase3_DeathSequence_StartEscapeSequence


;;; $B26D: Mother Brain body function - third phase - death sequence - start escape sequence ;;;
Function_MBBody_Phase3_DeathSequence_StartEscape:
    LDX.W #MotherBrainFightSpriteTileTransferEntries_explodedDoor
    JSR ProcessSpriteTilesTransfers
    BCC .return
    LDY.W #Palette_MotherBrain_ExplodedDoor+2
    LDX.W #$0122
    LDA.W #$000E
    JSL WriteAColorsFromYtoColorIndexX
    LDA.W #$0007
    JSL QueueMusicDataOrTrack_8FrameDelay
    LDA.W #$0005 : STA.W EarthquakeType
    LDA.W #$FFFF : STA.W EarthquakeTimer
    LDY.W #PaletteFXObjects_Tourian8_ShutterRedFlashing
    JSL Spawn_PaletteFXObject
    LDY.W #PaletteFXObjects_Tourian10_BackgroundRedFlashing
    JSL Spawn_PaletteFXObject
    LDY.W #PaletteFXObjects_Tourian20_GeneralLevelRedFlashing
    JSL Spawn_PaletteFXObject
    LDY.W #PaletteFXObjects_Tourian40_RedFlashingArkanoidBlocksRedOrbs
    JSL Spawn_PaletteFXObject
    LDA.W #$0000 : STA.L MotherBrainBody.enableUnpauseHookFlag
    JSL SetupZebesEscapeTypewriter
    LDA.W #$0020 : STA.W MotherBrainBody.functionTimer
    LDY.W #Function_MBBody_Phase3_DeathSequence_SpawnTimeBombSetJapanText
    LDA.W JapanText : BNE .keepJapanText
    LDY.W #Function_MBBody_Phase3_DeathSequence_TypeOutZebesEscapeText

  .keepJapanText:
    STY.W MotherBrainBody.function

  .return:
    RTS


;;; $B2D1: Mother Brain body function - third phase - death sequence - spawn time bomb set Japanese text ;;;
Function_MBBody_Phase3_DeathSequence_SpawnTimeBombSetJapanText:
    DEC.W MotherBrainBody.functionTimer : BPL Function_MBBody_Phase3_DeathSequence_TypeOutZebesEscapeText
    LDA.W #Function_MBBody_Phase3_DeathSequence_TypeOutZebesEscapeText : STA.W MotherBrainBody.function
    LDY.W #EnemyProjectile_TimeBombSetJapanText
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
; fallthrough to Function_MBBody_Phase3_DeathSequence_TypeOutZebesEscapeText


;;; $B2E3: Mother Brain body function - third phase - death sequence - type out Zebes escape text ;;;
Function_MBBody_Phase3_DeathSequence_TypeOutZebesEscapeText:
    LDA.W #$2610
    JSL HandleTypewriterText_External
    BCC .return
    LDA.W #Function_MBBody_Phase3_DeathSequence_DoorExploding_StartTimer : STA.W MotherBrainBody.function
    LDA.W #$0020 : STA.W MotherBrainBody.functionTimer

  .return:
    RTS


;;; $B2F9: Mother Brain body function - third phase - death sequence - escape door is exploding, start escape timer ;;;
Function_MBBody_Phase3_DeathSequence_DoorExploding_StartTimer:
    JSL GenerateEscapeDoorExplosion
    DEC.W MotherBrainBody.functionTimer : BPL .return
    LDA.W #$000F
    JSL Run_Samus_Command
    LDA.W #$0002 : STA.W TimerStatus
    JSL SetBossBitsInAForCurrentArea
    LDA.W #$000E
    JSL MarkEvent_inA
    LDA.W #Function_MBBody_Phase3_DeathSequence_BlowUpEscapeDoor : STA.W MotherBrainBody.function
    LDA.W #$0000 : STA.W MotherBrainBody.deathExplosionIntervalTimer : STA.W MotherBrainBody.escapeDoorIndex

  .return:
    RTS


;;; $B32A: Mother Brain body function - third phase - death sequence - blow up escape door ;;;
Function_MBBody_Phase3_DeathSequence_BlowUpEscapeDoor:
    JSR ExplodeMotherBrainEscapeDoor
    LDA.W #Function_MBBody_Phase3_DeathSequence_KeepEarthquakeGoing : STA.W MotherBrainBody.function
    JSL Spawn_Hardcoded_PLM
    db $00,$06
    dw PLMEntries_motherBrainsRoomEscapeDoor
    RTS


;;; $B33C: Mother Brain body function - third phase - death sequence - keep earthquake going ;;;
Function_MBBody_Phase3_DeathSequence_KeepEarthquakeGoing:
; Final MB body function
    LDA.W EarthquakeTimer : BNE .return
    DEC : STA.W EarthquakeTimer

  .return:
    RTS


;;; $B346: Generate escape door explosion ;;;
GenerateEscapeDoorExplosion:
    LDA.W MotherBrainBody.deathExplosionIntervalTimer : DEC : STA.W MotherBrainBody.deathExplosionIntervalTimer : BPL .return
    LDA.W #$0004 : STA.W MotherBrainBody.deathExplosionIntervalTimer
    LDA.W MotherBrainBody.escapeDoorIndex : DEC : STA.W MotherBrainBody.escapeDoorIndex : BPL .max3
    LDA.W #$0003 : STA.W MotherBrainBody.escapeDoorIndex

  .max3:
    LDA.W MotherBrainBody.escapeDoorIndex : ASL #2 : TAY
    LDA.W .data0,Y : STA.B DP_Temp12
    LDA.W .data1,Y : STA.B DP_Temp14
    LDY.W #$0003
    JSL GenerateRandomNumber
    CMP.W #$4000 : BCS .keepExplosion
    LDY.W #$000C

  .keepExplosion:
    TYA
    LDY.W #EnemyProjectile_MiscDust
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    LDA.W #$0024
    JSL QueueSound_Lib2_Max3

  .return:
    RTL

  .data0:
    dw $0008
  .data1:
    dw       $006C
    dw $0018,$0080, $0009,$0090, $0018,$0074


;;; $B3A3: Explode Mother Brain escape door ;;;
ExplodeMotherBrainEscapeDoor:
    LDA.W #$0000

  .loop:
    PHA
    LDY.W #EnemyProjectile_MotherBrainExplodedEscapeDoorParticles
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    PLA : INC : CMP.W #$0008 : BCC .loop
    RTS


;;; $B3B6: Mother Brain / Samus collision detection ;;;
MotherBrain_vs_Samus_CollisionDetection:
    LDA.L MotherBrainBody.hitboxesEnabled : STA.B DP_Temp1A
    LSR.B DP_Temp1A : BCC .checkBrain
    LDA.W Enemy.XPosition : STA.B DP_Temp12
    LDA.W Enemy.YPosition : STA.B DP_Temp14
    LDX.W #HitboxDefinitions_MotherBrainBody
    JSR MotherBrainPart_vs_Samus_CollisionDetection
    BCS .return

  .checkBrain:
    LSR.B DP_Temp1A : BCC .checkNeck
    LDA.W Enemy[1].XPosition : STA.B DP_Temp12
    LDA.W Enemy[1].YPosition : STA.B DP_Temp14
    LDX.W #HitboxDefinitions_MotherBrainHead
    JSR MotherBrainPart_vs_Samus_CollisionDetection
    BCS .return

  .checkNeck:
    LSR.B DP_Temp1A : BCC .return
    LDA.L MotherBrainBody.neckSegment1XPosition : STA.B DP_Temp12
    LDA.L MotherBrainBody.neckSegment1YPosition : STA.B DP_Temp14
    LDX.W #HitboxDefinitions_MotherBrainNeck
    JSR MotherBrainPart_vs_Samus_CollisionDetection
    BCS .return
    LDA.L MotherBrainBody.neckSegment2XPosition : STA.B DP_Temp12
    LDA.L MotherBrainBody.neckSegment2YPosition : STA.B DP_Temp14
    LDX.W #HitboxDefinitions_MotherBrainNeck
    JSR MotherBrainPart_vs_Samus_CollisionDetection
    BCS .return
    LDA.L MotherBrainBody.neckSegment3XPosition : STA.B DP_Temp12
    LDA.L MotherBrainBody.neckSegment3YPosition : STA.B DP_Temp14
    LDX.W #HitboxDefinitions_MotherBrainNeck
    JSR MotherBrainPart_vs_Samus_CollisionDetection

  .return:
    RTS


;;; $B427: Mother Brain hitbox definitions ;;;
; Used to detect collision with Samus

; Hitbox format is:
;      ________________________ Number of entries
;     |      __________________ Left offset
;     |     |     _____________ Top offset
;     |     |    |     ________ Right offset
;     |     |    |    |     ___ Bottom offset
;     |     |    |    |    |
;     nnnn, llll,tttt,rrrr,bbbb, ...
HitboxDefinitions_MotherBrainBody:
    dw $0002
    dw $FFE0,$FFE8,$002A,$0038
    dw $FFE8,$FFD6,$001C,$FFE7

HitboxDefinitions_MotherBrainHead:
    dw $0002
    dw $FFE8,$FFEA,$0016,$0000
    dw $FFEA,$0001,$0010,$0014

HitboxDefinitions_MotherBrainNeck:
    dw $0001
    dw $FFF8,$FFF8,$0008,$0008


;;; $B455: Mother Brain part / Samus collision detection ;;;
MotherBrainPart_vs_Samus_CollisionDetection:
;; Parameters:
;;     X: Hitbox definition
;;     $12: Hitbox X position
;;     $14: Hitbox Y position
;; Returns:
;;     Carry: Set if collision
    LDA.W $0000,X : BEQ .returnNoCollision
    STA.B DP_Temp16
    INX #2

  .loop:
    LDA.W SamusYPosition : SEC : SBC.B DP_Temp14 : BPL .SamusBelowHitbox
    EOR.W #$FFFF : INC : STA.B DP_Temp18
    LDA.W $0002,X
    BRA +

  .SamusBelowHitbox:
    STA.B DP_Temp18
    LDA.W $0006,X

+   BPL +
    EOR.W #$FFFF : INC

+   CLC : ADC.W SamusYRadius
    SEC : SBC.B DP_Temp18 : BMI .next
    LDA.W SamusXPosition : SEC : SBC.B DP_Temp12 : BPL .SamusRightOfHitbox
    EOR.W #$FFFF : INC : STA.B DP_Temp18
    LDA.W $0000,X
    BRA +

  .SamusRightOfHitbox:
    STA.B DP_Temp18
    LDA.W $0004,X

+   BPL +
    EOR.W #$FFFF : INC

+   CLC : ADC.W SamusXRadius
    SEC : SBC.B DP_Temp18 : BPL .hit

  .next:
    DEC.B DP_Temp16 : BEQ .returnNoCollision
    TXA : CLC : ADC.W #$0008 : TAX
    JMP .loop

  .returnNoCollision:
    CLC
    RTS

  .hit:
    CMP.W #$0004 : BPL .min4
    LDA.W #$0004

  .min4:
    STA.W ExtraSamusXDisplacement
    LDA.W #$0004 : STA.W ExtraSamusYDisplacement
    STZ.W ExtraSamusXSubDisplacement : STZ.W ExtraSamusYSubDisplacement
    LDA.W #$0060 : STA.W SamusInvincibilityTimer
    LDA.W #$0005 : STA.W SamusKnockbackTimer
    LDA.W #$0001 : STA.W KnockbackXDirection
    LDA.W SamusYPosition : CMP.W #$00C0 : BPL .SamusInAir
    LDA.W #$0002 : STA.W SamusYDirection

  .SamusInAir:
    LDA.W Enemy.XPosition : CLC : ADC.W #$0018 : CMP.W SamusXPosition : BPL .returnCollision
    JSR HurtSamus_A9B5E1

  .returnCollision:
    SEC
    RTS


;;; $B503: Enemy shot - enemy $EC7F (Mother Brain body) ;;;
EnemyShot_MotherBrainBody:
    JML CreateADudShot
; fallthrough to EnemyShot_MotherBrainHead


;;; $B507: Enemy shot - enemy $EC3F (Mother Brain brain) ;;;
EnemyShot_MotherBrainHead:
; This code assumes that Mother Brain's glass is the first spawned PLM (index 4Eh)
    LDA.L MotherBrainBody.form : BNE .notFirstPhase
    LDA.W CollisionIndex : ASL : TAY
    LDA.W SamusProjectile_Types+1,Y : AND.W #$0007 : TAY
    LDA.W .projectileType,Y : AND.W #$00FF : BEQ .return
    LDX.W #$004E
    CLC : ADC.W PLM_RoomArgs,X : STA.W PLM_RoomArgs,X
    LDA.W #$006E
    JSL QueueSound_Lib2_Max6
    LDY.W #$000D
    LDA.W Enemy[1].flashTimer : BEQ +
    LSR : BCC +
    INY

+   STY.W Enemy[1].flashTimer
    JSL NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External

  .return:
    RTL

  .projectileType:
    db $00 ; Beam
    db $01 ; Missile
    db $01 ; Super missile
    db $00 ; Power bomb
    db $00 ; Unused
    db $00 ; Bomb
    db $00 ; Unused
    db $00 ; Beam explosion

  .notFirstPhase:
    JSR MotherBrainShotReaction_Phase2_3
    LDA.L MotherBrainBody.form : CMP.W #$0001 : BNE .gotoNormalShotAI
    JML CreateADudShot

  .gotoNormalShotAI:
    JML NormalEnemyShotAI_NoDeathCheck_NoEnemyShotGraphic_External


;;; $B562: Mother Brain second/third phase shot reaction ;;;
MotherBrainShotReaction_Phase2_3:
    LDA.L MotherBrainBody.form : CMP.W #$0004 : BNE .notBeam
    JSR DetermineMotherBrainShotReactionType
    CMP.W #$0002 : BNE .notBeam
    JMP MotherBrainBeamShotReaction_Phase3

  .notBeam:
    JSR DetermineMotherBrainShotReactionType
    DEC : BEQ .superMissile
    LDA.L MotherBrainBody.walkCounter : SEC : SBC.W #$0100 : BPL .done

  .superMissile:
    LDA.W #$0000

  .done:
    STA.L MotherBrainBody.walkCounter
    RTS


;;; $B58E: Determine Mother Brain shot reaction type ;;;
DetermineMotherBrainShotReactionType:
; Return [$B5A1 + (collided projectile type)]
    LDA.W CollisionIndex : ASL : TAY
    LDA.W SamusProjectile_Types+1,Y : AND.W #$0007 : TAY
    LDA.W .projectileTypes,Y : AND.W #$00FF
    RTS

  .projectileTypes:
    db $02 ; Beam
    db $01 ; Missile
    db $01 ; Super missile
    db $00 ; Power bomb
    db $00 ; Unused
    db $00 ; Bomb
    db $00 ; Unused
    db $00 ; Beam explosion


;;; $B5A9: Mother Brain third phase beam shot reaction ;;;
MotherBrainBeamShotReaction_Phase3:
    LDA.L MotherBrainBody.walkCounter : SEC : SBC.W #$010A : BPL .maxCounter
    LDA.W #Function_MotherBrainNeck_SetupHyperBeamRecoil : STA.L MotherBrainBody.neckFunction
    LDA.W #$0000 : STA.W MotherBrainBody.functionTimer

  .maxCounter:
    STA.L MotherBrainBody.walkCounter
    RTS


;;; $B5C5: RTL. Enemy touch - enemy $EC7F (Mother Brain body) ;;;
RTL_A9B5C5:
    RTL


;;; $B5C6: Enemy touch - enemy $EC3F (Mother Brain brain) ;;;
EnemyTouch_MotherBrainHead:
; I'm pretty sure it's impossible to touch Mother Brain brain due to the custom hitboxes
; Editor's note: it is possible to trigger this routine by damage boosting into MB's head
    LDA.W MovementType : AND.W #$00FF : CMP.W #$0003 : BNE .return
    LDY.W #$000D
    LDA.W Enemy[1].flashTimer : BEQ +
    LSR : BCC +
    INY

+   STY.W Enemy[1].flashTimer

  .return:
    RTL


;;; $B5E1: Hurt Samus ;;;
HurtSamus_A9B5E1:
    JSL DealSuitAdjustedEnemyDamageToSamus
    LDA.W #$0060 : STA.W SamusInvincibilityTimer
    LDA.W #$0005 : STA.W SamusKnockbackTimer
    LDY.W #$0000
    LDX.W EnemyIndex
    LDA.W SamusXPosition : SEC : SBC.W Enemy.XPosition,X : BMI .left
    INY

  .left:
    STY.W KnockbackXDirection
    RTS


;;; $B605: Mother Brain body function - second phase - thinking ;;;
Function_MotherBrainBody_Phase2_Thinking:
; 4500 is a quarter of full health
    LDA.W Enemy[1].health : BNE .notDead
    LDA.W #Function_MotherBrainBody_Phase2_FiringRainbowBeam_ExtendNeck : STA.W MotherBrainBody.function
    JMP Function_MotherBrainBody_Phase2_FiringRainbowBeam_ExtendNeck

  .notDead:
    LDA.L MotherBrainBody.pose : BEQ .standing
    RTS

  .standing:
    LDA.W Enemy[1].health : CMP.W #$1194 : BMI .lowHealth
    LDA.W RandomNumberSeed : CMP.W #$1000 : BCC .tryAttack
    JMP HandleMotherBrainWalking

  .tryAttack:
    LDA.W #Function_MotherBrainBody_Phase2_TryAttack : STA.W MotherBrainBody.function
    RTS

  .lowHealth:
    LDA.W RandomNumberSeed : CMP.W #$2000 : BCS +
    JMP HandleMotherBrainWalking

+   CMP.W #$A000 : BCS .tryAttack
    LDA.W #Function_MotherBrainBody_Phase2_FiringDeathBeam : STA.W MotherBrainBody.function
    RTS


;;; $B64B: Mother Brain body function - second phase - try attack ;;;
Function_MotherBrainBody_Phase2_TryAttack:
    LDA.L MotherBrainBody.attackPhase : ASL : TAX
    JMP.W (.pointers,X)

  .pointers:
    dw TryMotherBrainAttack_Phase2_TryAttack
    dw TryMotherBrainPhase2Attack_Cooldown
    dw TryMotherBrainPhase2Attack_EndAttack


;;; $B65A: Try Mother Brain phase 2 attack - try attack ;;;
TryMotherBrainAttack_Phase2_TryAttack:
; [Mother Brain attack phase] = 0
; Call to DecideMotherBrainPhase2AttackStrategy returns from *this* routine if it decided a particular attack,
; must have nothing pushed to the stack
; The call to DecideMotherBrainPhase2AttackStrategy always returns from this routine if Samus is in (almost) any in-air movement type,
; hence the Y proximity condition to use RNG thresholds pointer .SamusClose is (almost) never true
    LDA.W #$0040 : STA.W MotherBrainBody.attackCooldown
    LDA.L MotherBrainBody.attackPhase : INC : STA.L MotherBrainBody.attackPhase
    JSR DecideMotherBrainPhase2AttackStrategy
    LDX.W #.default
    LDA.W Enemy[1].YPosition : CLC : ADC.W #$0004
    SEC : SBC.W SamusYPosition : BPL +
    EOR.W #$FFFF : INC

+   CMP.W #$0020 : BCS .SamusFar
    LDX.W #.SamusClose

  .SamusFar:
    SEP #$20
    LDY.W #$0000
    LDA.W RandomNumberSeed : CMP.W $0000,X : BCC +
    INY #2
    CMP.W $0001,X : BCC +
    INY #2
    CMP.W $0002,X : BCC +
    INY #2

+   TYX
    REP #$20
    LDA.W .instListPointers,X : CMP.W #InstList_MotherBrainHead_Attacking_Bomb_Phase2 : BEQ .bomb
    CMP.W #InstList_MotherBrainHead_Attacking_Laser : BEQ .laser
    JSR SetMotherBrainHeadInstList

  .return:
    RTS

  .bomb:
    LDA.L MotherBrainBody.bombCounter : CMP.W #$0001 : BPL .return
    LDA.W #Function_MotherBrainBody_FiringBomb_DecideOnWalking : STA.W MotherBrainBody.function
    JMP Function_MotherBrainBody_FiringBomb_DecideOnWalking

  .laser:
    LDA.W #Function_MBBody_Phase2_FiringLaser_PositionHeadQuickly : STA.W MotherBrainBody.function
    JMP Function_MBBody_Phase2_FiringLaser_PositionHeadQuickly

  .instListPointers:
; Mother Brain brain instruction list pointers
    dw InstList_MotherBrainHead_Neutral_Phase2_0
    dw InstList_MotherBrainHead_Attacking_4OnionRings_Phase2
    dw InstList_MotherBrainHead_Attacking_Laser
    dw InstList_MotherBrainHead_Attacking_Bomb_Phase2

; RNG thresholds
  .default:
; Default
    db $40,$80,$C0
  .SamusClose:
; Samus Y position is within 2 rows of Mother Brain's Y position + 4
    db $10,$20,$D0


;;; $B6E2: Decide Mother Brain phase 2 attack strategy ;;;
DecideMotherBrainPhase2AttackStrategy:
; If Samus is in the air, 50/50 for blue rings or laser
; Else, 50% chance to do bomb
    LDA.W MovementType : AND.W #$00FF : ASL : TAX
    LDA.W .poses,X : BNE .aimAtGround
    LDA.W RandomNumberSeed : AND.W #$00FF : CMP.W #$0080 : BMI .callersReturn
    LDA.W #InstList_MotherBrainHead_Attacking_4OnionRings_Phase2
    JSR SetMotherBrainHeadInstList
    PLA
    RTS

  .callersReturn:
    PLA
    LDA.W #Function_MBBody_Phase2_FiringLaser_PositionHeadQuickly : STA.W MotherBrainBody.function
    JMP Function_MBBody_Phase2_FiringLaser_PositionHeadQuickly

  .aimAtGround:
    LDA.W RandomNumberSeed : AND.W #$00FF : CMP.W #$0080 : BPL +
    RTS

+   LDA.L MotherBrainBody.bombCounter : CMP.W #$0001 : BPL .return
    LDA.W #Function_MotherBrainBody_FiringBomb_DecideOnWalking : STA.W MotherBrainBody.function
    PLA
    JMP Function_MotherBrainBody_FiringBomb_DecideOnWalking

  .return:
    RTS

  .poses:
    dw $FFFF ; 0: Standing
    dw $FFEF ; 1: Running
    dw $0000 ; 2: Normal jumping
    dw $0000 ; 3: Spin jumping
    dw $FFFF ; 4: Morph ball - on ground
    dw $FFFF ; 5: Crouching
    dw $0000 ; 6: Falling
    dw $FFFF ; 7: Unused
    dw $0000 ; 8: Morph ball - falling
    dw $0000 ; 9: Unused
    dw $FFFF ; Ah: Knockback / crystal flash ending
    dw $0000 ; Bh: Unused
    dw $0000 ; Ch: Unused
    dw $0000 ; Dh: Unused
    dw $FFEF ; Eh: Turning around - on ground
    dw $FFFF ; Fh: Crouching/standing/morphing/unmorphing transition
    dw $FFFF ; 10h: Moonwalking
    dw $FFFF ; 11h: Spring ball - on ground
    dw $0000 ; 12h: Spring ball - in air
    dw $0000 ; 13h: Spring ball - falling
    dw $0000 ; 14h: Wall jumping
    dw $FFEF ; 15h: Ran into a wall
    dw $FFFF ; 16h: Grappling
    dw $FFFF ; 17h: Turning around - jumping
    dw $FFFF ; 18h: Turning around - falling
    dw $FFFF ; 19h: Damage boost
    dw $FFFF ; 1Ah: Grabbed by Draygon
    dw $FFFF ; 1Bh: Shinespark / crystal flash / drained by metroid / damaged by MB's attacks


;;; $B764: Try Mother Brain phase 2 attack - cooldown ;;;
TryMotherBrainPhase2Attack_Cooldown:
; [Mother Brain attack phase] = 1
    DEC.W MotherBrainBody.attackCooldown : BNE .return
    LDA.L MotherBrainBody.attackPhase : INC : STA.L MotherBrainBody.attackPhase

  .return:
    RTS


;;; $B773: Try Mother Brain phase 2 attack - end attack ;;;
TryMotherBrainPhase2Attack_EndAttack:
; [Mother Brain attack phase] = 2
    LDA.W #$0000 : STA.L MotherBrainBody.attackPhase
    LDA.W #Function_MotherBrainBody_Phase2_Thinking : STA.W MotherBrainBody.function
    RTS


;;; $B781: Mother Brain body function - firing bomb - decide on walking ;;;
Function_MotherBrainBody_FiringBomb_DecideOnWalking:
    LDA.W RandomNumberSeed : CMP.W #$FF80 : BCS MotherBrainFiringBomb_DecideOnCrouching
    LDX.W #$0040
    CMP.W #$6000 : BCS +
    LDX.W #$0060

+   TXA : CMP.W Enemy.XPosition : BPL MotherBrainFiringBomb_DecideOnCrouching
    STA.W MotherBrainBody.bodyTargetXPosition
    LDY.W #$0006
    JSR MakeMotherBrainWalkBackwards
    BCS MotherBrainFiringBomb_DecideOnCrouching
    LDA.W #Function_MotherBrainBody_FiringBomb_WalkingBackwards : STA.W MotherBrainBody.function

  .return:
    RTS


;;; $B7AC: Mother Brain body function - firing bomb - walking backwards ;;;
Function_MotherBrainBody_FiringBomb_WalkingBackwards:
    LDY.W #$0006
    LDA.W MotherBrainBody.bodyTargetXPosition
    JSR MakeMotherBrainWalkBackwards
    BCC Function_MotherBrainBody_FiringBomb_DecideOnWalking_return
; fallthrough to MotherBrainFiringBomb_DecideOnCrouching


;;; $B7B7: Mother Brain firing bomb - decide on crouching ;;;
MotherBrainFiringBomb_DecideOnCrouching:
    JSL GenerateRandomNumber
    CMP.W #$8000 : BCC MotherBrainFiringBomb_FireBomb
    LDA.W #Function_MotherBrainBody_FiringBomb_Crouch : STA.W MotherBrainBody.function
; fallthrough to Function_MotherBrainBody_FiringBomb_Crouch


;;; $B7C6: Mother Brain body function - firing bomb - crouch ;;;
Function_MotherBrainBody_FiringBomb_Crouch:
    JSR MakeMotherBrainCrouch
    BCC Function_MotherBrainBody_FiringBomb_DecideOnWalking_return
; fallthrough to MotherBrainFiringBomb_FireBomb


;;; $B7CB: Mother Brain firing bomb - fire bomb ;;;
MotherBrainFiringBomb_FireBomb:
    LDY.W #InstList_MotherBrainHead_Attacking_Bomb_Phase2
    LDA.L MotherBrainBody.phase2CorpseState : BEQ .notCorpse
    LDY.W #InstList_MotherBrainHead_Attacking_Bomb_Phase3

  .notCorpse:
    TYA
    JSR SetMotherBrainHeadInstList
    LDA.W #Function_MotherBrainBody_FiringBomb_FiredBomb : STA.W MotherBrainBody.function
    LDA.W #$002C : STA.W MotherBrainBody.functionTimer
    RTS


;;; $B7E8: Mother Brain body function - firing bomb - fired bomb ;;;
Function_MotherBrainBody_FiringBomb_FiredBomb:
    DEC.W MotherBrainBody.functionTimer : BPL MotherBrainFiringBomb_FinishFiringBomb_return
    JSR MakeMotherBrainStandUp
    BCS MotherBrainFiringBomb_FinishFiringBomb
    LDA.W #Function_MotherBrainBody_FiringBomb_StandUp : STA.W MotherBrainBody.function
; fallthrough to Function_MotherBrainBody_FiringBomb_StandUp


;;; $B7F8: Mother Brain body function - firing bomb - stand up ;;;
Function_MotherBrainBody_FiringBomb_StandUp:
    JSR MakeMotherBrainStandUp
    BCC MotherBrainFiringBomb_FinishFiringBomb_return
; fallthrough to MotherBrainFiringBomb_FinishFiringBomb


;;; $B7FD: Mother Brain firing bomb - finish firing bomb ;;;
MotherBrainFiringBomb_FinishFiringBomb:
    LDY.W #Function_MotherBrainBody_Phase2_Thinking
    LDA.L MotherBrainBody.phase2CorpseState : BEQ .notCorpse
    LDY.W #Function_MotherBrainBody_Phase2_KillBabyMetroid_Attack

  .notCorpse:
    TYA : STA.W MotherBrainBody.function

  .return:
    RTS


;;; $B80E: Mother Brain body function - second phase - firing laser - position head quickly ;;;
Function_MBBody_Phase2_FiringLaser_PositionHeadQuickly:
    LDX.W #$0008
    LDA.W Enemy[1].YPosition : CMP.W SamusYPosition : BPL +
    LDX.W #$0006

+   TXA : STA.L MotherBrainBody.lowerNeckMovementIndex : STA.L MotherBrainBody.upperNeckMovementIndex
    LDA.W #$0200 : STA.L MotherBrainBody.neckAngleDelta
    LDA.W #Function_MBBody_Phase2_FiringLaser_PositionHeadSlowlyAndFire : STA.W MotherBrainBody.function
    LDA.W #$0004 : STA.W MotherBrainBody.functionTimer
    RTS


;;; $B839: Mother Brain body function - second phase - firing laser - position head slowly and fire ;;;
Function_MBBody_Phase2_FiringLaser_PositionHeadSlowlyAndFire:
    DEC.W MotherBrainBody.functionTimer : BMI .timerExpired
    RTS

  .timerExpired:
    LDY.W #$0100
    LDA.L MotherBrainBody.neckAngleDelta : BPL +
    LDY.W #$FF00

+   TYA : STA.L MotherBrainBody.neckAngleDelta
    LDA.W #InstList_MotherBrainHead_Attacking_Laser
    JSR SetMotherBrainHeadInstList
    LDA.W #Function_MotherBrainBody_Phase2_FiringLaser_FinishAttack : STA.W MotherBrainBody.function
    LDA.W #$0010 : STA.W MotherBrainBody.functionTimer
    RTS


;;; $B863: Mother Brain body function - second phase - firing laser - finish attack ;;;
Function_MotherBrainBody_Phase2_FiringLaser_FinishAttack:
    DEC.W MotherBrainBody.functionTimer : BMI .timerExpired
    RTS

  .timerExpired:
    LDA.W #$0004 : STA.L MotherBrainBody.lowerNeckMovementIndex : STA.L MotherBrainBody.upperNeckMovementIndex
    LDA.W #Function_MotherBrainBody_Phase2_Thinking : STA.W MotherBrainBody.function
    JMP Function_MotherBrainBody_Phase2_Thinking


;;; $B87D: Mother Brain body function - second phase - firing death beam ;;;
Function_MotherBrainBody_Phase2_FiringDeathBeam:
    LDA.L MotherBrainBody.deathBeamAttackPhase : ASL : TAX
    JSR.W (.pointers,X)
    RTS

  .pointers:
    dw MotherBrainPhase2_FiringDeathBeam_BackUp
    dw MotherBrainPhase2_FiringDeathBeam_WaitForAnyActiveBombs
    dw RTS_A9B8C8
    dw MotherBrainPhase2_FiringDeathBeam_Finish


;;; $B88F: Mother Brain second phase - firing death beam - back up ;;;
MotherBrainPhase2_FiringDeathBeam_BackUp:
; [Mother Brain death beam attack phase] = 0
    LDY.W #$0008
    LDA.W #$0028
    JSR MakeMotherBrainWalkBackwards
    BCC .return
    LDA.W #$0008 : STA.L MotherBrainBody.lowerNeckMovementIndex
    LDA.W #$0006 : STA.L MotherBrainBody.upperNeckMovementIndex
    LDA.L MotherBrainBody.deathBeamAttackPhase : INC : STA.L MotherBrainBody.deathBeamAttackPhase

  .return:
    RTS


;;; $B8B2: Mother Brain second phase - firing death beam - wait for any active bombs ;;;
MotherBrainPhase2_FiringDeathBeam_WaitForAnyActiveBombs:
; [Mother Brain death beam attack phase] = 1
    LDA.L MotherBrainBody.bombCounter : BNE .return
    LDA.W #InstList_MotherBrainBody_DeathBeamMode
    JSR SetMotherBrainBodyInstList
    LDA.L MotherBrainBody.deathBeamAttackPhase : INC : STA.L MotherBrainBody.deathBeamAttackPhase

  .return:
    RTS


;;; $B8C8: RTS ;;;
RTS_A9B8C8:
; [Mother Brain death beam attack phase] = 2
    RTS


;;; $B8C9: Mother Brain second phase - firing death beam - finish ;;;
MotherBrainPhase2_FiringDeathBeam_Finish:
; [Mother Brain death beam attack phase] = 4
    LDA.W #InstList_MotherBrainHead_Neutral_Phase2_0
    JSR SetMotherBrainHeadInstList
    LDA.W #$0002 : STA.L MotherBrainBody.lowerNeckMovementIndex
    LDA.W #$0004 : STA.L MotherBrainBody.upperNeckMovementIndex
    LDA.W #$0000 : STA.L MotherBrainBody.deathBeamAttackPhase
    LDA.W #Function_MotherBrainBody_Phase2_Thinking : STA.W MotherBrainBody.function
    RTS


;;; $B8EB: Mother Brain body function - second phase - firing rainbow beam - extend neck ;;;
Function_MotherBrainBody_Phase2_FiringRainbowBeam_ExtendNeck:
    LDA.W #InstList_MotherBrainHead_Neutral_Phase2_0
    JSR SetMotherBrainHeadInstList
    LDA.W #$0040 : STA.L MotherBrainBody.neckAngleDelta
    LDA.W #$0001 : STA.L MotherBrainBody.enableNeckMovementFlag
    LDA.W #$0002 : STA.L MotherBrainBody.lowerNeckMovementIndex
    LDA.W #$0004 : STA.L MotherBrainBody.upperNeckMovementIndex
    LDA.W #Function_MBBody_Phase2_FiringRainbowBeam_StartCharging : STA.W MotherBrainBody.function
    LDA.W #$0100 : STA.W MotherBrainBody.functionTimer

  .return:
    RTS


;;; $B91A: Mother Brain body function - second phase - firing rainbow beam - start charging rainbow beam ;;;
Function_MBBody_Phase2_FiringRainbowBeam_StartCharging:
    DEC.W MotherBrainBody.functionTimer : BPL Function_MotherBrainBody_Phase2_FiringRainbowBeam_ExtendNeck_return
    LDA.W #InstList_MotherBrainHead_ChargingRainbowBeam_0
    JSR SetMotherBrainHeadInstList
    LDA.W #Function_MotherBrainBody_Phase2_FiringRainbowBeam_RetractNeck : STA.W MotherBrainBody.function
; fallthrough to Function_MotherBrainBody_Phase2_FiringRainbowBeam_RetractNeck


;;; $B92B: Mother Brain body function - second phase - firing rainbow beam - retract neck ;;;
Function_MotherBrainBody_Phase2_FiringRainbowBeam_RetractNeck:
    LDA.W #$0028
    JSR MakeMBWalkBackwardsReallySlowTowardsXPositionInA_RetractHead
    BCC Function_MotherBrainBody_Phase2_FiringRainbowBeam_ExtendNeck_return
    LDA.W #Function_MBBody_Phase2_FiringRainbowBeam_WaitForBeamToCharge : STA.W MotherBrainBody.function
    LDA.W #$0100 : STA.W MotherBrainBody.functionTimer
; fallthrough to Function_MBBody_Phase2_FiringRainbowBeam_WaitForBeamToCharge


;;; $B93F: Mother Brain body function - second phase - firing rainbow beam - wait for beam to charge ;;;
Function_MBBody_Phase2_FiringRainbowBeam_WaitForBeamToCharge:
    DEC.W MotherBrainBody.functionTimer : BPL Function_MotherBrainBody_Phase2_FiringRainbowBeam_ExtendNeck_return
    LDA.W #$0071
    JSL QueueSound_Lib2_Max6
    LDA.W #Function_MBBody_Phase2_FiringRainbowBeam_ExtendNeckDown : STA.W MotherBrainBody.function
; fallthrough to Function_MBBody_Phase2_FiringRainbowBeam_ExtendNeckDown


;;; $B951: Mother Brain body function - second phase - firing rainbow beam - extend neck down ;;;
Function_MBBody_Phase2_FiringRainbowBeam_ExtendNeckDown:
    LDA.W #$0008 : STA.W SamusProjectile_CooldownTimer
    LDA.W #$0006 : STA.L MotherBrainBody.lowerNeckMovementIndex : STA.L MotherBrainBody.upperNeckMovementIndex
    LDA.W #$0500 : STA.L MotherBrainBody.neckAngleDelta
    LDA.W #Function_MBBody_Phase2_FiringRainbowBeam_StartFiringRainbowBeam : STA.W MotherBrainBody.function
    LDA.W #$0010 : STA.W MotherBrainBody.functionTimer
; fallthough to Function_MBBody_Phase2_FiringRainbowBeam_StartFiringRainbowBeam


;;; $B975: Mother Brain body function - second phase - firing rainbow beam - start firing rainbow beam ;;;
Function_MBBody_Phase2_FiringRainbowBeam_StartFiringRainbowBeam:
    JSR AimMotherBrainRainbowBeam_IncreaseWidth
    LDA.W SamusProjectile_PowerBombFlag : BNE .return
    DEC.W MotherBrainBody.functionTimer : BMI .timerExpired

  .return:
    RTS

  .timerExpired:
    LDA.W SamusProjectile_PowerBombFlag : BNE .return ; >_<
    STZ.W SamusProjectile_CooldownTimer
    JSR ResetMotherBrainBodyRainbowBeamPaletteAnimationIndex
    LDA.W #InstList_MotherBrainHead_FiringRainbowBeam
    JSR SetMotherBrainHeadInstList
    LDA.W #$0200 : STA.L MotherBrainBody.rainbowBeamAngularWidth
    JSL Spawn_MotherBrainRainbowBeam_HDMAObject
    STA.L MotherBrainBody.HDMAObjectIndex
    LDA.W #$0040 : STA.L MotherBrainBody.neckAngleDelta
    LDA.W #$0001 : STA.L MotherBrainBody.enableNeckMovementFlag
    LDA.W #$0002 : STA.L MotherBrainBody.lowerNeckMovementIndex
    LDA.W #$0004 : STA.L MotherBrainBody.upperNeckMovementIndex
    STZ.W MotherBrainBody.rainbowBeamExplosionIndex : STZ.W MotherBrainBody.rainbowBeamExplosionTimer
    LDA.W #$0005
    LDY.W Energy : CPY.W #$02BC : BPL .greaterThan2BC
    LDA.W #$0018

  .greaterThan2BC:
    JSL Run_Samus_Command
    LDA.W #$0006 : STA.L MotherBrainBody.numberOfTimesToQueueRainbowBeamSFX
    LDA.W #Function_MBBody_Phase2_FiringRainbowBeam_MoveSamusTowardWall : STA.W MotherBrainBody.function
    RTS


;;; $B9E5: Mother Brain body function - second phase - firing rainbow beam - move Samus towards wall ;;;
Function_MBBody_Phase2_FiringRainbowBeam_MoveSamusTowardWall:
    JSR PlayMotherBrainRainbowBeamSFX
    JSR HandleMotherBrainBodyRainbowBeamPalette
    JSR AimMotherBrainRainbowBeam_IncreaseWidth
    JSR HandleMotherBrainRainbowBeamExplosions
    JSR MoveSamusTowardsWallDueToRainbowBeam
    BCC .return
    LDA.W #Function_MBBody_Phase2_FiringRainbowBeam_1FrameDelay : STA.W MotherBrainBody.function
    STZ.W MotherBrainBody.functionTimer

  .return:
    RTS


;;; $BA00: Mother Brain body function - second phase - firing rainbow beam - 1 frame delay ;;;
Function_MBBody_Phase2_FiringRainbowBeam_1FrameDelay:
    JSR PlayMotherBrainRainbowBeamSFX
    JSR HandleMotherBrainBodyRainbowBeamPalette
    JSR AimMotherBrainRainbowBeam_IncreaseWidth
    JSR HandleMotherBrainRainbowBeamExplosions
    JSR MoveSamusTowardsWallDueToRainbowBeam
    DEC.W MotherBrainBody.functionTimer : BPL .return
    LDA.W #$0008 : STA.W EarthquakeType
    LDA.W #$0008 : STA.W EarthquakeTimer
    LDA.W #Function_MBBody_Phase2_FiringRainbowBeam_StartDrainingSamus : STA.W MotherBrainBody.function

  .return:
    RTS


;;; $BA27: Mother Brain body function - second phase - firing rainbow beam - start draining Samus ;;;
Function_MBBody_Phase2_FiringRainbowBeam_StartDrainingSamus:
    LDA.W #Function_MBBody_Phase2_FiringRainbowBeam_DrainingSamus : STA.W MotherBrainBody.function
    LDA.W #$012B : STA.W MotherBrainBody.functionTimer : STA.W EarthquakeTimer
    LDA.W #$0008 : STA.W EarthquakeType
; fallthough to Function_MBBody_Phase2_FiringRainbowBeam_DrainingSamus


;;; $BA3C: Mother Brain body function - second phase - firing rainbow beam - draining Samus ;;;
Function_MBBody_Phase2_FiringRainbowBeam_DrainingSamus:
    JSR PlayMotherBrainRainbowBeamSFX
    JSR HandleMotherBrainBodyRainbowBeamPalette
    JSR AimMotherBrainRainbowBeam_IncreaseWidth
    JSR HandleMotherBrainRainbowBeamExplosions
    JSL DamageSamusDueToRainbowBeam
    JSR DecrementAmmoDueToRainbowBeam
    JSR MoveSamusTowardsMiddleOfWall
    DEC.W MotherBrainBody.functionTimer : BPL Function_MBBody_Phase2_FiringRainbowBeam_FinishFiring_return
    LDA.W #Function_MBBody_Phase2_FiringRainbowBeam_FinishFiring : STA.W MotherBrainBody.function
    RTS


;;; $BA5E: Mother Brain body function - second phase - firing rainbow beam - finish firing rainbow beam ;;;
Function_MBBody_Phase2_FiringRainbowBeam_FinishFiring:
    JSR PlayMotherBrainRainbowBeamSFX
    JSR HandleMotherBrainBodyRainbowBeamPalette
    JSR AimMotherBrainRainbowBeam
    JSR HandleMotherBrainRainbowBeamExplosions
    LDA.L MotherBrainBody.rainbowBeamAngularWidth : SEC : SBC.W #$0180 : STA.L MotherBrainBody.rainbowBeamAngularWidth
    CMP.W #$0200 : BPL .return
    LDA.W #$0200 : STA.L MotherBrainBody.rainbowBeamAngularWidth
    LDA.W #$FF00 : STA.W MotherBrainBody.customSamusXVelocity
    STZ.W MotherBrainBody.customSamusYVelocity
    LDA.L MotherBrainBody.HDMAObjectIndex : TAX
    STZ.W HDMAObject_ChannelBitflags,X : STZ.W EarthquakeTimer
    LDA.W #InstList_MotherBrainHead_Neutral_Phase2_0
    JSR SetMotherBrainHeadInstList
    JSR SetupMotherBrainHeadNormalPalette
    JSR WriteMotherBrainDefaultPalette
    LDA.W #$0002
    JSL QueueSound_Lib1_Max6
    LDA.W #$0000 : STA.L MotherBrainBody.rainbowBeamSFXIsPlayingFlag
    LDA.W #$0001
    JSL Run_Samus_Command
    LDA.W #$0008 : STA.W SamusProjectile_CooldownTimer
    LDA.W #Function_MBBody_Phase2_FiringRainbowBeam_LetSamusFall : STA.W MotherBrainBody.function

  .return:
    RTS


;;; $BAC4: Mother Brain body function - second phase - firing rainbow beam - let Samus fall ;;;
Function_MBBody_Phase2_FiringRainbowBeam_LetSamusFall:
    LDA.W #$0000
    JSL DrainedSamusController
    LDA.W #Function_MBBody_Phase2_FiringRainbowBeam_WaitForSamusToLand : STA.W MotherBrainBody.function
; fallthrough to Function_MBBody_Phase2_FiringRainbowBeam_WaitForSamusToLand


;;; $BAD1: Mother Brain body function - second phase - firing rainbow beam - wait for Samus to hit ground ;;;
Function_MBBody_Phase2_FiringRainbowBeam_WaitForSamusToLand:
    JSR MoveSamusForFallingAfterRainbowBeam
    BCC .return
    LDA.W #Function_MBBody_Phase2_FiringRainbowBeam_LowerHead : STA.W MotherBrainBody.function

  .return:
    RTS


;;; $BADD: Mother Brain body function - second phase - firing rainbow beam - lower head ;;;
Function_MBBody_Phase2_FiringRainbowBeam_LowerHead:
    LDA.W #$0040 : STA.L MotherBrainBody.neckAngleDelta
    LDA.W #$0001 : STA.L MotherBrainBody.enableNeckMovementFlag
    LDA.W #$0002 : STA.L MotherBrainBody.lowerNeckMovementIndex
    LDA.W #$0004 : STA.L MotherBrainBody.upperNeckMovementIndex
    LDA.W #Function_MBBody_Phase2_FiringRainbowBeam_DecideNextAction : STA.W MotherBrainBody.function
    LDA.W #$0080 : STA.W MotherBrainBody.functionTimer

  .return:
    RTS


;;; $BB06: Mother Brain body function - second phase - firing rainbow beam - decide next action ;;;
Function_MBBody_Phase2_FiringRainbowBeam_DecideNextAction:
    DEC.W MotherBrainBody.functionTimer : BPL Function_MBBody_Phase2_FiringRainbowBeam_LowerHead_return
    LDA.W Energy : CMP.W #$0190 : BMI .lessThan190
    LDA.W #Function_MotherBrainBody_Phase2_FiringRainbowBeam_ExtendNeck : STA.W MotherBrainBody.function
    RTS

  .lessThan190:
    LDY.W #$000A
    LDA.W Enemy.XPosition : CLC : ADC.W #$0010
    JSR MakeMotherBrainWalkForwards
    LDA.W #Function_MBBody_Phase2_FinishSamusOff_GetSamusToLowEnergy : STA.W MotherBrainBody.function
    RTS


;;; $BB2E: Play Mother Brain rainbow beam sound effect ;;;
PlayMotherBrainRainbowBeamSFX:
    LDA.L MotherBrainBody.numberOfTimesToQueueRainbowBeamSFX : BMI .return
    DEC : STA.L MotherBrainBody.numberOfTimesToQueueRainbowBeamSFX
    LDA.W #$0040
    JSL QueueSound_Lib1_Max6
    LDA.W #$0001 : STA.L MotherBrainBody.rainbowBeamSFXIsPlayingFlag

  .return:
    RTS


;;; $BB48: Make Mother Brain walk backwards really slow towards X position [A] and retract head ;;;
MakeMBWalkBackwardsReallySlowTowardsXPositionInA_RetractHead:
    LDY.W #$000A
    JSR MakeMotherBrainWalkBackwards
    BCS RetractMotherBrainsHead
    RTS


;;; $BB51: Retract Mother Brain's head ;;;
RetractMotherBrainsHead:
    LDA.W #$0050 : STA.L MotherBrainBody.neckAngleDelta
    LDA.W #$0001 : STA.L MotherBrainBody.enableNeckMovementFlag
    LDA.W #$0008 : STA.L MotherBrainBody.lowerNeckMovementIndex
    LDA.W #$0006 : STA.L MotherBrainBody.upperNeckMovementIndex
    RTS


;;; $BB6E: Aim Mother Brain rainbow beam and increase width ;;;
AimMotherBrainRainbowBeam_IncreaseWidth:
    LDA.L MotherBrainBody.rainbowBeamAngularWidth : CLC : ADC.W #$0180 : CMP.W #$0C00 : BMI +
    LDA.W #$0C00

+   STA.L MotherBrainBody.rainbowBeamAngularWidth
; fallthrough to AimMotherBrainRainbowBeam


;;; $BB82: Aim Mother Brain rainbow beam ;;;
AimMotherBrainRainbowBeam:
    LDA.W SamusXPosition : SEC : SBC.W Enemy[1].XPosition
    SEC : SBC.W #$0010 : STA.B DP_Temp12
    LDA.W SamusYPosition : SEC : SBC.W Enemy[1].YPosition
    SEC : SBC.W #$0004 : STA.B DP_Temp14
    JSL CalculateAngleOf_12_14_Offset
    SEC : SBC.W #$0080 : EOR.W #$FFFF : INC : AND.W #$00FF : STA.L MotherBrainBody.rainbowBeamAngle
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $BBB0: Calculate Mother Brain rainbow beam HDMA tables ;;;
UNUSED_CalculateMotherBrainRainbowBeamHDMATables_long_A9BBB0:
    JSL Calculate_MotherBrain_RainbowBeam_HDMATables
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $BBB5: Move Samus towards wall due to rainbow beam ;;;
MoveSamusTowardsWallDueToRainbowBeam:
;; Returns:
;;     Carry: Set if reached wall (X position EBh), clear otherwise
    LDA.W #$1000
    JSR MoveSamusHorizontallyTowardsWall
    BCS .return
    LDA.L MotherBrainBody.rainbowBeamAngle : STA.B DP_Temp12
    LDA.W #$1000
    JSL CalculateYVelocityFromSpeedAndAngle
    JSR MoveSamusVerticallyTowardsCeilingFloor
    CLC

  .return:
    RTS


;;; $BBCF: Move Samus towards middle of wall ;;;
MoveSamusTowardsMiddleOfWall:
    LDA.W #$0040
    LDY.W #$007C : CPY.W SamusYPosition : BPL .lessThanEqualTo7C
    EOR.W #$FFFF : INC

  .lessThanEqualTo7C:
    JMP MoveSamusVerticallyTowardsCeilingFloor


;;; $BBE1: Move Samus for falling after rainbow beam ;;;
MoveSamusForFallingAfterRainbowBeam:
;; Returns:
;;     Carry: Set if reached floor (not in Y position range 30h..BFh), clear otherwise
    LDA.W MotherBrainBody.customSamusXVelocity : CLC : ADC.W #$0002 : BMI +
    LDA.W #$0000

+   STA.W MotherBrainBody.customSamusXVelocity
    JSR MoveSamusHorizontallyTowardsWall
    LDA.W MotherBrainBody.customSamusYVelocity : CLC : ADC.W #$0018 : STA.W MotherBrainBody.customSamusYVelocity
; fallthrough to MoveSamusVerticallyTowardsCeilingFloor


;;; $BBFD: Move Samus vertically towards ceiling/floor ;;;
MoveSamusVerticallyTowardsCeilingFloor:
;; Parameters:
;;     A: Y velocity. Units of 1/100h px
;; Returns:
;;     Carry: Set if reached ceiling/floor (not in Y position range 30h..BFh), clear otherwise
    SEP #$20
    CLC : ADC.W SamusYSubPosition+1 : STA.W SamusYSubPosition+1 : STA.W SamusPreviousYSubPosition+1
    REP #$20
    AND.W #$FF00 : XBA : BPL +
    ORA.W #$FF00

+   ADC.W SamusYPosition : CMP.W #$0030 : BMI .load30
    CMP.W #$00C0 : BPL .loadC0
    STA.W SamusYPosition : STA.W SamusPreviousYPosition
    CLC
    RTS

  .load30:
    LDA.W #$0030
    BRA +

  .loadC0:
    LDA.W #$00C0

+   STA.W SamusYPosition : STA.W SamusPreviousYPosition
    STZ.W SamusYSubPosition : STZ.W SamusPreviousYSubPosition
    SEC
    RTS


;;; $BC3F: Move Samus horizontally towards wall ;;;
MoveSamusHorizontallyTowardsWall:
;; Parameters:
;;     A: X velocity. Units of 1/100h px
;; Returns:
;;     Carry: Set if reached wall (X position EBh), clear otherwise
    SEP #$20
    CLC : ADC.W SamusXSubPosition+1 : STA.W SamusXSubPosition+1 : STA.W SamusPreviousXSubPosition+1
    REP #$20
    AND.W #$FF00 : XBA : BPL +
    ORA.W #$FF00

+   ADC.W SamusXPosition : CMP.W #$00EB : BPL .greaterThanEqualToEB
    STA.W SamusXPosition : STA.W SamusPreviousXPosition
    RTS

  .greaterThanEqualToEB:
    LDA.W #$00EB : STA.W SamusXPosition : STA.W SamusPreviousXPosition
    STZ.W SamusXSubPosition : STZ.W SamusPreviousXSubPosition
    SEC
    RTS


;;; $BC76: Handle Mother Brain rainbow beam explosions ;;;
HandleMotherBrainRainbowBeamExplosions:
    DEC.W MotherBrainBody.rainbowBeamExplosionTimer : BMI .timerExpired
    RTS

  .timerExpired:
    LDA.W #$0008 : STA.W MotherBrainBody.rainbowBeamExplosionTimer
    INC.W MotherBrainBody.rainbowBeamExplosionIndex
    LDA.W MotherBrainBody.rainbowBeamExplosionIndex : AND.W #$0007 : ASL : TAX
    LDA.W .data0,X : STA.B DP_Temp12
    LDA.W .data1,X : STA.B DP_Temp14
    LDY.W #EnemyProjectile_MotherBrainRainbowBeam_Explosion
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    LDA.W #$0024
    JSL QueueSound_Lib2_Max6
    RTS

  .data0:
    dw $FFF8,$0006,$FFFC,$0002,$0003,$FFFA,$0008,$0000

  .data1:
    dw $FFF9,$0002,$0005,$FFFC,$0006,$FFFE,$FFFA,$0007


;;; $BCC6: Mother Brain body rainbow beam palette animation index = 0 ;;;
ResetMotherBrainBodyRainbowBeamPaletteAnimationIndex:
    LDA.W #$0000 : STA.L MotherBrainBody.rainbowBeamPaletteAnimationIndex
    RTS


;;; $BCCE: Write Mother Brain default palette ;;;
WriteMotherBrainDefaultPalette:
; DB should be set to $A9
    LDY.W #Palette_MotherBrain+2
    LDX.W #$0082
    LDA.W #$000F
    JSL WriteAColorsFromYtoColorIndexX
    LDY.W #Palette_MotherBrain+2
    LDX.W #$0122
    LDA.W #$000F
    JSL WriteAColorsFromYtoColorIndexX
    LDY.W #Palette_MotherBrain_BackLeg+2
    LDX.W #$0162
    LDA.W #$000F
    JSL WriteAColorsFromYtoColorIndexX
    RTS


;;; $BCF6: Write Mother Brain second phase death palette ;;;
WriteMotherBrainPhase2DeathPalette:
    LDA.L MotherBrainPhase2DeathBeforeGreyPalette_Pointers : TAY
    BRA WriteMotherBrainPalette


;;; $BCFD: Handle Mother Brain body rainbow beam palette ;;;
HandleMotherBrainBodyRainbowBeamPalette:
    LDA.W Enemy.frameCounter : AND.W #$0002 : BNE .loadIndex
    RTS

  .loadIndex:
    LDA.L MotherBrainBody.rainbowBeamPaletteAnimationIndex

  .restart:
    TAX
    LDA.L MotherBrainBodyRainbowBeamPalette_Pointers,X : BEQ .restart
    INX #2
    TXA : STA.L MotherBrainBody.rainbowBeamPaletteAnimationIndex
    LDA.L MotherBrainBodyRainbowBeamPalette_Pointers-2,X : TAY
; fallthrough to WriteMotherBrainPalette


;;; $BD1D: Write Mother Brain palette ;;;
WriteMotherBrainPalette:
    PHB
    PEA.W MotherBrainHealthBasedPalettes_BrainBody>>8&$FF00 : PLB : PLB
    PHY
    LDX.W #$0082
    LDA.W #$000F
    JSL WriteAColorsFromYtoColorIndexX
    PLY
    LDX.W #$0122
    LDA.W #$000F
    JSL WriteAColorsFromYtoColorIndexX
    LDX.W #$0162
    LDA.W #$000F
    JSL WriteAColorsFromYtoColorIndexX
    PLB
    RTS


;;; $BD45: Mother Brain body function - second phase - finish Samus off - get Samus to low health ;;;
Function_MBBody_Phase2_FinishSamusOff_GetSamusToLowEnergy:
; NOPing the branch at $A9:BD5F counter-intuitively causes MB to never effectively launch an attack,
; I guess she never gets the chance to spawn a projectile when she's constantly switching attacks
    LDA.W #$0050
    JSL Suit_Damage_Division
    ASL #2 : ADC.W #$0014 : CMP.W Energy : BPL .done
    LDA.W RandomNumberSeed : AND.W #$0FFF : CMP.W #$0FA0 : BCC .noAttack
    LDA.W #$00A0
    JSL Suit_Damage_Division
    CLC : ADC.W #$0014 : CMP.W Energy : BPL .onionRings
    LDY.W #InstList_MotherBrainHead_Attacking_Bomb_Phase2
    LDA.W RandomNumberSeed : AND.W #$0FFF : CMP.W #$0FF0 : BCS .doAttack

  .onionRings:
    LDY.W #InstList_MotherBrainHead_Attacking_2OnionRings_Phase2

  .doAttack:
    TYA
    JMP SetMotherBrainHeadInstList

  .noAttack:
    LDA.W Enemy.frameCounter : AND.W #$001F : BNE .return
    JMP MaybeMakeMotherBrainStandUpOrLeanDown

  .done:
    LDA.W #Function_MotherBrainBody_Phase2_FinishSamusOff_StandUp : STA.W MotherBrainBody.function

  .return:
    RTS


;;; $BD98: Mother Brain body function - second phase - finish Samus off - stand up ;;;
Function_MotherBrainBody_Phase2_FinishSamusOff_StandUp:
    JSR MakeMotherBrainStandUp
    BCC Function_MBBody_Phase2_FinishSamusOff_LoadBabyMetroid_return
    LDA.W #Function_MBBody_Phase2_FinishSamusOff_AdmireJobWellDone : STA.W MotherBrainBody.function
    LDA.W #$0010 : STA.W MotherBrainBody.functionTimer
; fallthrough to Function_MBBody_Phase2_FinishSamusOff_AdmireJobWellDone


;;; $BDA9: Mother Brain body function - second phase - finish Samus off - admire job well done ;;;
Function_MBBody_Phase2_FinishSamusOff_AdmireJobWellDone:
    DEC.W MotherBrainBody.functionTimer : BPL Function_MBBody_Phase2_FinishSamusOff_LoadBabyMetroid_return
    LDA.W #InstList_MotherBrainHead_Stretching_Phase2_0
    JSR SetMotherBrainHeadInstList
    LDA.W #Function_MBBody_Phase2_FinishSamusOff_ChargeFinalRainbowBeam : STA.W MotherBrainBody.function
    LDA.W #$0100 : STA.W MotherBrainBody.functionTimer
    RTS


;;; $BDC1: Mother Brain body function - second phase - finish Samus off - charge final rainbow beam ;;;
Function_MBBody_Phase2_FinishSamusOff_ChargeFinalRainbowBeam:
    DEC.W MotherBrainBody.functionTimer : BPL Function_MBBody_Phase2_FinishSamusOff_LoadBabyMetroid_return
    LDA.W #InstList_MotherBrainHead_ChargingRainbowBeam_0
    JSR SetMotherBrainHeadInstList
    LDA.W #Function_MBBody_Phase2_FinishSamusOff_LoadBabyMetroid : STA.W MotherBrainBody.function
; fallthough to Function_MBBody_Phase2_FinishSamusOff_LoadBabyMetroid


;;; $BDD2: Mother Brain body function - second phase - finish Samus off - charge final rainbow beam / load Shitroid ;;;
Function_MBBody_Phase2_FinishSamusOff_LoadBabyMetroid:
    LDX.W #MotherBrainFightSpriteTileTransferEntries_babyMetroid
    JSR ProcessSpriteTilesTransfers
    BCC .return
    JSR RetractMotherBrainsHead
    JSR SpawnBabyMetroidCutscene
    LDA.W #Function_MBBody_Phase2_FinishSamusOff_FireFinalRainbowBeam : STA.W MotherBrainBody.function
    LDA.W #$0100 : STA.W MotherBrainBody.functionTimer

  .return:
    RTS


;;; $BDED: Mother Brain body function - second phase - finish Samus off - fire final rainbow beam ;;;
Function_MBBody_Phase2_FinishSamusOff_FireFinalRainbowBeam:
    DEC.W MotherBrainBody.functionTimer : BPL Function_MBBody_Phase2_FinishSamusOff_LoadBabyMetroid_return
    JSR ResetMotherBrainBodyRainbowBeamPaletteAnimationIndex
    LDA.W #InstList_MotherBrainHead_FiringRainbowBeam
    JSR SetMotherBrainHeadInstList
    LDA.W #$0006 : STA.L MotherBrainBody.lowerNeckMovementIndex : STA.L MotherBrainBody.upperNeckMovementIndex
    LDA.W #$0500 : STA.L MotherBrainBody.neckAngleDelta
    LDA.W #$0071
    JSL QueueSound_Lib2_Max6
    LDA.W #.return : STA.W MotherBrainBody.function

  .return:
    RTS


;;; $BE1B: Spawn Shitroid in cutscene ;;;
SpawnBabyMetroidCutscene:
    LDX.W #PopulationData_BabyMetroidCutscene
    JSL SpawnEnemy
    TXA : STA.L MotherBrainBody.BabyMetroidEnemyIndex
    RTS


PopulationData_BabyMetroidCutscene:
; Enemy population format is:
; ____________________________________________ Enemy ID
;        _____________________________________ X position
;       |      _______________________________ Y position
;       |     |      _________________________ Initialisation parameter (orientation in SMILE)
;       |     |     |      ___________________ Properties (special in SMILE)
;       |     |     |     |      _____________ Extra properties (special graphics bitset in SMILE)
;       |     |     |     |     |      _______ Parameter 1 (speed in SMILE)
;       |     |     |     |     |     |      _ Parameter 2 (speed2 in SMILE)
;       |     |     |     |     |     |     |
;       xxxx  yyyy  oooo  pppp  gggg  aaaa  bbbb

;  ______ Terminator
; |     _ Number of enemy deaths needed to clear current room
; |    |
; FFFF nn
    dw EnemyHeaders_BabyMetroidCutscene
    dw $0180,$0040
    dw InstList_BabyMetroid_Initial
    dw $2800,$0000,$0000,$0000


;;; $BE38: Mother Brain body function - drained by Shitroid - taken aback by Shitroid ;;;
Function_MotherBrainBody_DrainedByBabyMetroid_TakenAback:
    LDA.W #$0003 : STA.L MotherBrainBody.form
    LDA.W #$0008 : STA.L MotherBrainBody.lowerNeckMovementIndex : STA.L MotherBrainBody.upperNeckMovementIndex
    LDA.W #$0700 : STA.L MotherBrainBody.neckAngleDelta
    LDA.W #Function_MotherBrainBody_DrainedByBabyMetroid_RegainBalance : STA.W MotherBrainBody.function
    LDA.W #$0030 : STA.W MotherBrainBody.functionTimer
; fallthrough to Function_MotherBrainBody_DrainedByBabyMetroid_RegainBalance


;;; $BE5D: Mother Brain body function - drained by Shitroid - regain balance ;;;
Function_MotherBrainBody_DrainedByBabyMetroid_RegainBalance:
    JSR HandleMotherBrainBodyRainbowBeamPalette
    DEC.W MotherBrainBody.functionTimer : BPL .return
    LDA.W #Function_MBBody_DrainedByBabyMetroid_FiringRainbowBeam : STA.W MotherBrainBody.function
    LDA.W #Function_MotherBrainBody_PainfulWalking_WalkForwards : STA.L MotherBrainBody.painfulWalkingFunction
    LDA.W #$0000 : STA.L MotherBrainBody.painfulWalkingStage
    LDA.W #$0002 : STA.L MotherBrainBody.painfulWalkingAnimationDelay
    LDA.W #$0001 : LDA.L MotherBrainBody.enableNeckMovementFlag
    LDA.W #$0002 : STA.L MotherBrainBody.lowerNeckMovementIndex ; >.<
    LDA.W #$0004 : STA.L MotherBrainBody.upperNeckMovementIndex

  .return:
    RTS


;;; $BE96: Mother Brain body function - drained by Shitroid - firing rainbow beam ;;;
Function_MBBody_DrainedByBabyMetroid_FiringRainbowBeam:
    LDA.L MotherBrainBody.brainMainShakeTimer : BNE +
    LDA.W #$0032 : STA.L MotherBrainBody.brainMainShakeTimer

+   JSR HandleMotherBrainBodyRainbowBeamPalette
    LDA.L MotherBrainBody.painfulWalkingFunction : STA.B DP_Temp12
    PEA .manualReturn-1
    JMP.W (DP_Temp12)

  .manualReturn:
    LDA.L MotherBrainBody.painfulWalkingStage : ASL : TAY
    LDA.W .walkingAnimationDelays,Y : AND.W #$00FF : STA.L MotherBrainBody.painfulWalkingAnimationDelay
    LDA.W .neckAngleDeltas,Y : STA.L MotherBrainBody.neckAngleDelta
    LDA.L MotherBrainBody.painfulWalkingStage : CMP.W #$0006 : BNE .return
    LDA.W #$0000 : STA.L MotherBrainBody.rainbowBeamSFXIsPlayingFlag : STA.L MotherBrainBody.enableBrainPaletteHandlingFlag
    JSR WriteMotherBrainPhase2DeathPalette
    LDA.W #$0002
    JSL QueueSound_Lib1_Max6
    LDA.W #Function_MBBody_DrainedByBabyMetroid_RainbowBeamHasRunOut : STA.W MotherBrainBody.function

  .return:
    RTS

  .walkingAnimationDelays:
    dw $0002,$0002,$0006,$0006,$0008,$0008,$000A,$000A

  .neckAngleDeltas:
    dw $0500,$0500,$0200,$0200,$00C0,$00C0,$0040,$0040


;;; $BF0E: Mother Brain body function - drained by Shitroid - rainbow beam has run out ;;;
Function_MBBody_DrainedByBabyMetroid_RainbowBeamHasRunOut:
    LDA.L MotherBrainBody.painfulWalkingFunction : STA.B DP_Temp12
    PEA .manualReturn-1
    JMP.W (DP_Temp12)

  .manualReturn:
    LDA.L MotherBrainBody.painfulWalkingStage : CMP.W #$0008 : BMI Function_MBBody_DrainedByBabyMetroid_GoIntoLowPowerMode_return
    LDA.W #$0040 : STA.L MotherBrainBody.neckAngleDelta
    LDA.W #$0008 : STA.L MotherBrainBody.lowerNeckMovementIndex : STA.L MotherBrainBody.upperNeckMovementIndex
    LDA.W #InstList_MotherBrainHead_DyingDrool_0
    JSR SetMotherBrainHeadInstList
    LDA.W #Function_MBBody_DrainedByBabyMetroid_MoveToBackOfRoom : STA.W MotherBrainBody.function
; fallthrough to Function_MBBody_DrainedByBabyMetroid_MoveToBackOfRoom


;;; $BF41: Mother Brain body function - drained by Shitroid - move to back of room ;;;
Function_MBBody_DrainedByBabyMetroid_MoveToBackOfRoom:
    LDA.W #$0028
    JSR MakeMotherBrainWalkBackwards
    BCC Function_MBBody_DrainedByBabyMetroid_GoIntoLowPowerMode_return
    LDA.W #Function_MBBody_DrainedByBabyMetroid_GoIntoLowPowerMode : STA.W MotherBrainBody.function
    LDA.W #$0000 : STA.L MotherBrainBody.upperNeckMovementIndex
; fallthrough to Function_MBBody_DrainedByBabyMetroid_GoIntoLowPowerMode


;;; $BF56: Mother Brain body function - drained by Shitroid - go into low power mode ;;;
Function_MBBody_DrainedByBabyMetroid_GoIntoLowPowerMode:
    LDA.L MotherBrainBody.lowerNeckMovementIndex : ORA.L MotherBrainBody.upperNeckMovementIndex : BNE .return
    STA.L MotherBrainBody.enableDroolGenerationFlag
    LDA.L MotherBrainBody.pose : BNE .return
    LDA.W #InstList_MotherBrainBody_Crouch_Fast
    JSR SetMotherBrainBodyInstList
    LDA.W #Function_MBBody_DrainedByBabyMetroid_PrepareTransitionToGrey : STA.W MotherBrainBody.function
    LDA.W #$0040 : STA.W MotherBrainBody.functionTimer

  .return:
    RTS


;;; $BF7D: Mother Brain body function - drained by Shitroid - prepare transition to grey ;;;
Function_MBBody_DrainedByBabyMetroid_PrepareTransitionToGrey:
    DEC.W MotherBrainBody.functionTimer : BPL Function_MBBody_DrainedByBabyMetroid_GoIntoLowPowerMode_return
    LDA.W #$0000 : STA.L MotherBrainBody.greyTransitionCounter
    LDA.W #Function_MBBody_DrainedByBabyMetroid_TransitionToGrey : STA.W MotherBrainBody.function
    LDA.W #$0010 : STA.W MotherBrainBody.functionTimer
; fallthrough to Function_MBBody_DrainedByBabyMetroid_TransitionToGrey


;;; $BF95: Mother Brain body function - drained by Shitroid - transition to grey ;;;
Function_MBBody_DrainedByBabyMetroid_TransitionToGrey:
    DEC.W MotherBrainBody.functionTimer : BPL Function_MBBody_DrainedByBabyMetroid_GoIntoLowPowerMode_return
    LDA.W #$0010 : STA.W MotherBrainBody.functionTimer
    LDA.L MotherBrainBody.greyTransitionCounter : INC : STA.L MotherBrainBody.greyTransitionCounter
    DEC
    JSL TransitionMotherBrainPaletteToGrey_DrainedByBabyMetroid
    BCC Function_MBBody_DrainedByBabyMetroid_GoIntoLowPowerMode_return
    LDA.W #$8CA0 : STA.W Enemy[1].health
    LDA.W #$0001 : STA.L MotherBrainBody.phase2CorpseState
    DEC : STA.L MotherBrainBody.smallPurpleBreathGenerationEnabledFlag
    LDA.W #$0002 : STA.L MotherBrainBody.form
    LDA.W #Function_MotherBrainBody_Phase2_ReviveSelf_InanimateGrey : STA.W MotherBrainBody.function
    RTS


;;; $BFD0: Mother Brain painful walking function - walk forwards  ;;;
Function_MotherBrainBody_PainfulWalking_WalkForwards:
    LDA.L MotherBrainBody.painfulWalkingAnimationDelay : TAY
    LDA.W #$0048
    JSR MakeMotherBrainWalkForwards
    BCC .return
    LDA.W #Function_MotherBrainBody_PainfulWalking_WalkingForwards : STA.L MotherBrainBody.painfulWalkingFunction
    JSR SetMotherBrainPainfulWalkingFunctionTimer

  .return:
    RTS


;;; $BFE8: Mother Brain painful walking function - walking forwards ;;;
Function_MotherBrainBody_PainfulWalking_WalkingForwards:
    LDA.L MotherBrainBody.painfulWalkingFunctionTimer : DEC : STA.L MotherBrainBody.painfulWalkingFunctionTimer : BNE .return
    LDA.L MotherBrainBody.painfulWalkingStage : INC : STA.L MotherBrainBody.painfulWalkingStage
    LDA.W #Function_MotherBrainBody_PainfulWalking_WalkBackwards : STA.L MotherBrainBody.painfulWalkingFunction

  .return:
    RTS


;;; $C004: Mother Brain painful walking function - walk backwards ;;;
Function_MotherBrainBody_PainfulWalking_WalkBackwards:
    LDA.L MotherBrainBody.painfulWalkingAnimationDelay : TAY
    LDA.W #$0028
    JSR MakeMotherBrainWalkBackwards
    BCC .return
    LDA.W #Function_MotherBrainBody_PainfulWalking_WalkingBackwards : STA.L MotherBrainBody.painfulWalkingFunction
    JSR SetMotherBrainPainfulWalkingFunctionTimer

  .return:
    RTS


;;; $C01C: Mother Brain painful walking function - walking backwards ;;;
Function_MotherBrainBody_PainfulWalking_WalkingBackwards:
    LDA.L MotherBrainBody.painfulWalkingFunctionTimer : DEC : STA.L MotherBrainBody.painfulWalkingFunctionTimer : BNE .return
    LDA.L MotherBrainBody.painfulWalkingStage : INC : STA.L MotherBrainBody.painfulWalkingStage
    LDA.W #Function_MotherBrainBody_PainfulWalking_WalkForwards : STA.L MotherBrainBody.painfulWalkingFunction

  .return:
    RTS


;;; $C038: Set Mother Brain painful walking function timer ;;;
SetMotherBrainPainfulWalkingFunctionTimer:
    LDA.L MotherBrainBody.painfulWalkingStage : ASL : TAY
    LDA.W .timers,Y : AND.W #$00FF : STA.L MotherBrainBody.painfulWalkingFunctionTimer
    RTS

  .timers:
    dw $0010,$0010,$0020,$0020,$0030,$0030,$0040,$0040


;;; $C059: Mother Brain body function - second phase - revive self - inanimate grey ;;;
Function_MotherBrainBody_Phase2_ReviveSelf_InanimateGrey:
    LDA.W #Function_MotherBrainBody_Phase2_ReviveSelf_ShowSignsOfLife : STA.W MotherBrainBody.function
    LDA.W #$0300 : STA.W MotherBrainBody.functionTimer

  .return:
    RTS


;;; $C066: Mother Brain body function - second phase - revive self - show signs of life ;;;
Function_MotherBrainBody_Phase2_ReviveSelf_ShowSignsOfLife:
    DEC.W MotherBrainBody.functionTimer : BPL Function_MotherBrainBody_Phase2_ReviveSelf_InanimateGrey_return
    LDA.W #$0001 : STA.L MotherBrainBody.smallPurpleBreathGenerationEnabledFlag : STA.L MotherBrainBody.enableDroolGenerationFlag
    LDA.W #Function_MBBody_Phase2_ReviveSelf_PrepareTransitionToGrey : STA.W MotherBrainBody.function
    LDA.W #$00E0 : STA.W MotherBrainBody.functionTimer
; fallthrough to Function_MBBody_Phase2_ReviveSelf_PrepareTransitionToGrey


;;; $C082: Mother Brain body function - second phase - revive self - prepare transition from grey ;;;
Function_MBBody_Phase2_ReviveSelf_PrepareTransitionToGrey:
    LDA.W #Function_MBBody_Phase2_ReviveSelf_TransitionFromGrey : STA.W MotherBrainBody.function
    LDA.W #$0000 : STA.L MotherBrainBody.greyTransitionCounter
; fallthrough to Function_MBBody_Phase2_ReviveSelf_TransitionFromGrey


;;; $C08F: Mother Brain body function - second phase - revive self - transition from grey ;;;
Function_MBBody_Phase2_ReviveSelf_TransitionFromGrey:
    DEC.W MotherBrainBody.functionTimer : BPL Function_MotherBrainBody_Phase2_ReviveSelf_InanimateGrey_return
    LDA.W #$0010 : STA.W MotherBrainBody.functionTimer
    LDA.L MotherBrainBody.greyTransitionCounter : INC : STA.L MotherBrainBody.greyTransitionCounter
    DEC
    JSL TransitionMotherBrainPaletteFromGrey_DrainedByBabyMetroid
    BCC Function_MotherBrainBody_Phase2_ReviveSelf_InanimateGrey_return
    LDA.W #Function_MotherBrainBody_Phase2_ReviveSelf_WakeUp : STA.W MotherBrainBody.function
    LDA.W #$0001 : STA.L MotherBrainBody.enableBrainPaletteHandlingFlag
    JSR SetupMotherBrainHeadNormalPalette
; fallthrough to Function_MotherBrainBody_Phase2_ReviveSelf_WakeUp


;;; $C0BA: Mother Brain body function - second phase - revive self - wake up ;;;
Function_MotherBrainBody_Phase2_ReviveSelf_WakeUp:
    JSR MakeMotherBrainStandUp
    BCC Function_MotherBrainBody_Phase2_ReviveSelf_InanimateGrey_return
    LDA.W #$0006 : STA.L MotherBrainBody.lowerNeckMovementIndex : STA.L MotherBrainBody.upperNeckMovementIndex
    LDA.W #$0500 : STA.L MotherBrainBody.neckAngleDelta
    LDA.W #$0001 : STA.L MotherBrainBody.enableNeckMovementFlag
    LDA.W #Function_MotherBrainBody_Phase2_ReviveSelf_WakeUpStretch : STA.W MotherBrainBody.function
    LDA.W #$0010 : STA.W MotherBrainBody.functionTimer
; fallthrough to Function_MotherBrainBody_Phase2_ReviveSelf_WakeUpStretch


;;; $C0E4: Mother Brain body function - second phase - revive self - wake-up stretch ;;;
Function_MotherBrainBody_Phase2_ReviveSelf_WakeUpStretch:
    DEC.W MotherBrainBody.functionTimer : BPL Function_MBBody_Phase2_ReviveSelf_WalkUpToBabyMetroid_return
    LDA.W #InstList_MotherBrainHead_Stretching_Phase3_0
    JSR SetMotherBrainHeadInstList
    LDA.W #Function_MBBody_Phase2_ReviveSelf_WalkUpToBabyMetroid : STA.W MotherBrainBody.function
    LDA.W #$0080 : STA.W MotherBrainBody.functionTimer
; fallthrough to Function_MBBody_Phase2_ReviveSelf_WalkUpToBabyMetroid


;;; $C0FB: Mother Brain body function - second phase - revive self - walk up to Shitroid ;;;
Function_MBBody_Phase2_ReviveSelf_WalkUpToBabyMetroid:
    DEC.W MotherBrainBody.functionTimer : BPL .return
    LDY.W #$0004
    LDA.W #$0050
    JSR MakeMotherBrainWalkForwards
    BCC .return
    LDA.W #Func_MBBody_Phase2_ReviveSelf_PrepareNeckForBabyMetroidDeath : STA.W MotherBrainBody.function
    LDA.W #$0002 : STA.L MotherBrainBody.phase2CorpseState
    DEC : STA.L MotherBrainBody.enableHealthBasedPaletteHandlingFlag

  .return:
    RTS


;;; $C11E: Mother Brain body function - second phase - revive self - prepare neck for Shitroid murder ;;;
Func_MBBody_Phase2_ReviveSelf_PrepareNeckForBabyMetroidDeath:
    LDA.W #$0000 : STA.L MotherBrainBody.BabyMetroidAttackCounter
    LDA.W #$0001 : STA.L MotherBrainBody.enableNeckMovementFlag
    LDA.W #$0002 : STA.L MotherBrainBody.lowerNeckMovementIndex
    LDA.W #$0004 : STA.L MotherBrainBody.upperNeckMovementIndex
    LDA.W #$0040 : STA.L MotherBrainBody.neckAngleDelta
    LDA.W #Func_MBBody_Phase2_ReviveSelf_FinishPrepForBabyMetroidDeath : STA.W MotherBrainBody.function
; fallthrough to Func_MBBody_Phase2_ReviveSelf_FinishPrepForBabyMetroidDeath


;;; $C147: Mother Brain body function - second phase - revive self - finish preparing for Shitroid murder ;;;
Func_MBBody_Phase2_ReviveSelf_FinishPrepForBabyMetroidDeath:
    JSR MakeMotherBrainStandUp
    BCS .standing
    RTS

  .standing:
    LDA.W #Function_MotherBrainBody_Phase2_KillBabyMetroid_Attack : STA.W MotherBrainBody.function
    LDY.W #$000A
    LDA.W #$0050
    JSR MakeMotherBrainWalkForwards
; fallthrough to Function_MotherBrainBody_Phase2_KillBabyMetroid_Attack


;;; $C15C: Mother Brain body function - second phase - murder Shitroid - attack Shitroid ;;;
Function_MotherBrainBody_Phase2_KillBabyMetroid_Attack:
    JSR MaybeMakeMotherBrainStandUpOrLeanDown
    LDA.W RandomNumberSeed : BMI +
    RTS

+   LDY.W #InstList_MotherBrainHead_AttackingSamus_4OnionRings_Phase3
    LDA.L MotherBrainBody.BabyMetroidEnemyIndex : BEQ .zeroIndex
    LDY.W #InstList_MotherBrainHead_Attacking_BabyMetroid

  .zeroIndex:
    TYA
    JSR SetMotherBrainHeadInstList
    LDA.W #Function_MBBody_Phase2_KillBabyMetroid_AttackCooldown : STA.W MotherBrainBody.function
    LDA.W #$0040 : STA.W MotherBrainBody.functionTimer

  .return:
    RTS


;;; $C182: Mother Brain body function - second phase - murder Shitroid - Shitroid attack cooldown ;;;
Function_MBBody_Phase2_KillBabyMetroid_AttackCooldown:
    DEC.W MotherBrainBody.functionTimer : BPL Function_MotherBrainBody_Phase2_KillBabyMetroid_Attack_return
    LDA.W #Function_MotherBrainBody_Phase2_KillBabyMetroid_Attack : STA.W MotherBrainBody.function
; fallthrough to RTS_A9C18D


RTS_A9C18D:
    RTS


;;; $C18E: Mother Brain body function - second phase - prepare for final Shitroid attack ;;;
Function_MBBody_Phase2_PrepareForFinalBabyMetroidAttack:
; This isn't waiting for Mother Brain to finish standing up (bug?)
    JSR MakeMotherBrainStandUp
    LDY.W #$0004
    LDA.W #$0040
    JMP MakeMotherBrainWalkBackwards


;;; $C19A: Mother Brain body function - second phase - execute final Shitroid attack ;;;
Function_MBBody_Phase2_ExecuteFinalBabyMetroidAttack:
    LDA.W #InstList_MotherBrainHead_Attacking_BabyMetroid
    JSR SetMotherBrainHeadInstList
    LDA.W #.return : STA.W MotherBrainBody.function

  .return:
    RTS


;;; $C1A7: Maybe make Mother Brain stand up or lean down ;;;
MaybeMakeMotherBrainStandUpOrLeanDown:
    LDA.L MotherBrainBody.pose : BEQ .standing
    CMP.W #$0006 : BNE .return
    LDA.W RandomNumberSeed : AND.W #$00FF : CMP.W #$00C0 : BCC .return
    JMP MakeMotherBrainStandUp

  .standing:
    LDA.W RandomNumberSeed : AND.W #$00FF : CMP.W #$00C0 : BCC .return
    JMP MakeMotherBrainLeanDown

  .return:
    RTS


;;; $C1CF: Mother Brain body function - third phase - recover from cutscene - make some distance ;;;
Function_MBBody_Phase3_RecoverFromCutscene_MakeSomeDistance:
    LDA.W #$0004 : STA.L MotherBrainBody.form
    LDA.W #Function_MBBody_Phase3_RecoverFromCutscene_SetupForFighting : STA.W MotherBrainBody.function
    LDA.W #$0020 : STA.W MotherBrainBody.functionTimer
    LDA.W Enemy.XPosition : SEC : SBC.W #$000E
    LDY.W #$0002
    JSR MakeMotherBrainWalkBackwards

  .return:
    RTS


;;; $C1F0: Mother Brain body function - third phase - recover from cutscene - set up for fighting ;;;
Function_MBBody_Phase3_RecoverFromCutscene_SetupForFighting:
    DEC.W MotherBrainBody.functionTimer : BPL Function_MBBody_Phase3_RecoverFromCutscene_MakeSomeDistance_return
    LDA.W #Function_MBBody_Phase3_Fighting_Main : STA.W MotherBrainBody.function
    LDA.W #Function_MotherBrainNeck_Normal : STA.L MotherBrainBody.neckFunction
    LDA.W #Function_MotherBrainBody_Walking_TryToInchForward : STA.L MotherBrainBody.walkingFunction
; fallthrough to Function_MBBody_Phase3_Fighting_Main


;;; $C209: Mother Brain body function - third phase - fighting - main ;;;
Function_MBBody_Phase3_Fighting_Main:
    LDA.W Enemy[1].health : BNE .notDead
    LDA.W #Function_MBBody_Phase3_DeathSequence_MoveToBackOfRoom : STA.W MotherBrainBody.function

  .return:
    RTS

  .notDead:
    JSR MotherBrainPhase3NeckHandler
    JSR MotherBrainPhase3WalkingHandler
    LDA.L MotherBrainBody.pose : BNE Function_MBBody_Phase3_Fighting_Main_return
    LDA.L MotherBrainBody.disableAttacks : BNE Function_MBBody_Phase3_Fighting_Main_return
    LDA.W RandomNumberSeed : BPL Function_MBBody_Phase3_Fighting_Main_return
    LDY.W #InstList_MotherBrainHead_Attacking_Bomb_Phase3
    LDA.W RandomNumberSeed : AND.W #$00FF : CMP.W #$0080 : BCC .lessThan80
    LDY.W #InstList_MotherBrainHead_AttackingSamus_4OnionRings_Phase3

  .lessThan80:
    TYA
    JSR SetMotherBrainHeadInstList
    LDA.W #Function_MBBody_Phase3_Fighting_AttackCooldown : STA.W MotherBrainBody.function
    LDA.W #$0040 : STA.W MotherBrainBody.functionTimer
    RTS


;;; $C24E: Mother Brain body function - third phase - fighting - attack cooldown ;;;
Function_MBBody_Phase3_Fighting_AttackCooldown:
    DEC.W MotherBrainBody.functionTimer : BPL Function_MBBody_Phase3_Fighting_Main_return
    LDA.W #Function_MBBody_Phase3_Fighting_Main : STA.W MotherBrainBody.function
    RTS


;;; $C25A: Mother Brain third phase walking handler ;;;
MotherBrainPhase3WalkingHandler:
    LDA.L MotherBrainBody.pose : BEQ .standing
    RTS

  .standing:
    LDA.L MotherBrainBody.walkingFunction : STA.B DP_Temp12
    JMP.W (DP_Temp12)


;;; $C26A: Mother Brain walking function - try to inch forward ;;;
Function_MotherBrainBody_Walking_TryToInchForward:
    LDA.L MotherBrainBody.walkCounter : BEQ .walkLeft
    CLC : ADC.W #$0020 : STA.L MotherBrainBody.walkCounter
    CMP.W #$0100 : BCC .return
    LDA.W Enemy.XPosition : INC : STA.L MotherBrainBody.targetXPosition
    LDA.W RandomNumberSeed : AND.W #$0002 : CLC : ADC.W #$0004 : TAY
    LDA.L MotherBrainBody.targetXPosition
    JSR MakeMotherBrainWalkForwards
    BCC .return
    LDA.W #$0080 : STA.L MotherBrainBody.walkCounter

  .return:
    RTS

  .walkLeft:
    LDA.W Enemy.XPosition : SEC : SBC.W #$000E : STA.L MotherBrainBody.targetXPosition
    LDA.W #Function_MotherBrainBody_Walking_RetreatQuickly : STA.L MotherBrainBody.walkingFunction
; fallthrough to Function_MotherBrainBody_Walking_RetreatQuickly


;;; $C2B3: Mother Brain walking function - retreat quickly ;;;
Function_MotherBrainBody_Walking_RetreatQuickly:
    LDA.L MotherBrainBody.targetXPosition
    LDY.W #$0002
    JSR MakeMotherBrainWalkBackwards
    BCC .return
    LDA.W Enemy.XPosition : SEC : SBC.W #$000E : STA.L MotherBrainBody.targetXPosition
    LDA.W #Function_MotherBrainBody_Walking_RetreatSlowly : STA.L MotherBrainBody.walkingFunction

  .return:
    RTS


;;; $C2D2: Mother Brain walking function - retreat slowly ;;;
Function_MotherBrainBody_Walking_RetreatSlowly:
    LDA.L MotherBrainBody.targetXPosition
    LDY.W #$0004
    JSR MakeMotherBrainWalkBackwards
    BCS .reachedTargetX
    RTS

  .reachedTargetX:
    LDA.W #$0040
    JMP SetMotherBrainWalkingFunctionToTryToInchForward


if !FEATURE_KEEP_UNREFERENCED
;;; $C2E5: Unused. Mother Brain walking function - crouch ;;;
UNUSED_Function_MotherBrainBody_Walking_Crouch_A9C2E5:
    JSR MakeMotherBrainCrouch
    BCC .return
    LDA.W #UNUSED_Function_MotherBrainBody_Walking_Crouching_A9C2F9 : STA.L MotherBrainBody.walkingFunction
    LDA.W #$0040 : STA.L MotherBrainBody.crouchTimer

  .return:
    RTS


;;; $C2F9: Unused. Mother Brain walking function - crouching ;;;
UNUSED_Function_MotherBrainBody_Walking_Crouching_A9C2F9:
    LDA.L MotherBrainBody.crouchTimer : DEC : STA.L MotherBrainBody.crouchTimer : BPL UNUSED_Function_MotherBrainBody_Walking_Crouch_A9C2E5_return
    LDA.W #UNUSED_Function_MotherBrainBody_Walking_StandUp_A9C30B : STA.L MotherBrainBody.walkingFunction
; fallthrough to UNUSED_Function_MotherBrainBody_Walking_StandUp_A9C30B


;;; $C30B: Unused. Mother Brain walking function - stand up ;;;
UNUSED_Function_MotherBrainBody_Walking_StandUp_A9C30B:
    JSR MakeMotherBrainStandUp
    BCC UNUSED_Function_MotherBrainBody_Walking_Crouch_A9C2E5_return
    LDA.W #$00C0
; fallthrough to SetMotherBrainWalkingFunctionToTryToInchForward
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $C313: Set Mother Brain walking function to try to inch forward ;;;
SetMotherBrainWalkingFunctionToTryToInchForward:
    STA.L MotherBrainBody.walkCounter
    LDA.W #Function_MotherBrainBody_Walking_TryToInchForward : STA.L MotherBrainBody.walkingFunction
    LDA.W Enemy.XPosition : INC : STA.L MotherBrainBody.targetXPosition
    RTS


;;; $C327: Mother Brain third phase neck handler ;;;
MotherBrainPhase3NeckHandler:
    LDA.L MotherBrainBody.neckFunction : STA.B DP_Temp12
    JMP.W (DP_Temp12)


;;; $C330: Mother Brain neck function - normal ;;;
Function_MotherBrainNeck_Normal:
    LDA.W #$0001 : STA.L MotherBrainBody.lowerNeckMovementIndex ; >_<
    LDA.W #$0080 : STA.L MotherBrainBody.neckAngleDelta
    LDA.W #$0002 : STA.L MotherBrainBody.lowerNeckMovementIndex
    LDA.W #$0004 : STA.L MotherBrainBody.upperNeckMovementIndex
    LDA.W #.return : STA.L MotherBrainBody.neckFunction

  .return:
    RTS


;;; $C354: Mother Brain neck function - set up recoil recovery ;;;
Function_MotherBrainNeck_SetupRecoilRecovery:
    LDA.W #$0001 : STA.L MotherBrainBody.enableNeckMovementFlag
    LDA.W #$0500 : STA.L MotherBrainBody.neckAngleDelta
    LDA.W #$0006 : STA.L MotherBrainBody.lowerNeckMovementIndex : STA.L MotherBrainBody.upperNeckMovementIndex
    LDA.W #Function_MotherBrainNeck_RecoilRecovery : STA.L MotherBrainBody.neckFunction
    LDA.W #$0010 : STA.L MotherBrainBody.neckFunctionTimer
; fallthrough to Function_MotherBrainNeck_RecoilRecovery


;;; $C37B: Mother Brain neck function - recoil recovery ;;;
Function_MotherBrainNeck_RecoilRecovery:
    LDA.L MotherBrainBody.neckFunctionTimer : DEC : BMI .timerExpired
    STA.L MotherBrainBody.neckFunctionTimer
    RTS

  .timerExpired:
    LDA.W #InstList_MotherBrainHead_AttackingSamus_4OnionRings_Phase3
    JSR SetMotherBrainHeadInstList
    LDA.W #Function_MotherBrainNeck_Normal : STA.L MotherBrainBody.neckFunction
    RTS


;;; $C395: Mother Brain neck function - set up hyper beam recoil ;;;
Function_MotherBrainNeck_SetupHyperBeamRecoil:
; Set by shot reaction if far enough left
    LDA.W #$0001 : STA.L MotherBrainBody.enableNeckMovementFlag : STA.L MotherBrainBody.disableAttacks
    LDA.W #InstList_MotherBrainHead_HyperBeamRecoil_0
    JSR SetMotherBrainHeadInstList
    LDA.W #$0032 : STA.L MotherBrainBody.brainMainShakeTimer
    LDA.W #$0900 : STA.L MotherBrainBody.neckAngleDelta
    LDA.W #$0008 : STA.L MotherBrainBody.lowerNeckMovementIndex : STA.L MotherBrainBody.upperNeckMovementIndex
    LDA.W #Function_MotherBrainNeck_HyperBeamRecoil : STA.L MotherBrainBody.neckFunction
    LDA.W #$000B : STA.L MotherBrainBody.neckFunctionTimer
; fallthrough to Function_MotherBrainNeck_HyperBeamRecoil


;;; $C3CD: Mother Brain neck function - hyper beam recoil ;;;
Function_MotherBrainNeck_HyperBeamRecoil:
    LDA.L MotherBrainBody.neckFunctionTimer : DEC : BMI .timerExpired
    STA.L MotherBrainBody.neckFunctionTimer
    RTS

  .timerExpired:
    LDA.W #$0080 : STA.L MotherBrainBody.neckAngleDelta
    LDA.W #$0000 : STA.L MotherBrainBody.disableAttacks
    LDA.W #Function_MotherBrainNeck_SetupRecoilRecovery : STA.L MotherBrainBody.neckFunction
    RTS


;;; $C3EF: Move enemy according to enemy velocity ;;;
MoveEnemyAccordingToVelocity:
    LDX.W EnemyIndex
    LDA.W BabyMetroid.XVelocity,X
    SEP #$20
    CLC : ADC.W Enemy.XSubPosition+1,X : STA.W Enemy.XSubPosition+1,X
    REP #$20
    AND.W #$FF00 : XBA : BPL +
    ORA.W #$FF00

+   ADC.W Enemy.XPosition,X : STA.W Enemy.XPosition,X
    LDA.W BabyMetroid.YVelocity,X
    SEP #$20
    CLC : ADC.W Enemy.YSubPosition+1,X : STA.W Enemy.YSubPosition+1,X
    REP #$20
    AND.W #$FF00 : XBA : BPL +
    ORA.W #$FF00

+   ADC.W Enemy.YPosition,X : STA.W Enemy.YPosition,X
    RTL


;;; $C42D: Set Mother Brain body instruction list ;;;
SetMotherBrainBodyInstList:
    STA.W Enemy.instList
    LDA.W #$0001 : STA.W Enemy.instTimer
    STZ.W Enemy.loopCounter
    RTS


;;; $C43A: Set Mother Brain brain unused instruction list ;;;
SetMotherBrainHeadUnusedInstList:
    STA.W Enemy[1].instList
    LDA.W #$0001 : STA.W Enemy[1].instTimer
    STZ.W Enemy[1].loopCounter
    RTS


;;; $C447: Set Mother Brain brain instruction list ;;;
SetMotherBrainHeadInstList:
    STA.L MotherBrainBody.brainInstListPointer
    LDA.W #$0001 : STA.L MotherBrainBody.brainInstructionTimer
    RTS


;;; $C453: Set enemy instruction list ;;;
SetEnemyInstList:
    STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    RTL


;;; $C460: A = sin([$12] * pi / 80h) * ±[A] ;;;
GetSineMathInA_A9C460:
    TAY
    LDA.B DP_Temp12
    BRA GetSineMathInA_A9C46C


;;; $C465: A = cos([$12] * pi / 80h) * ±[A] ;;;
GetCosineMathInA_A9C465:
    TAY
    LDA.B DP_Temp12 : CLC : ADC.W #$0040
; fallthrough to GetSineMathInA_A9C46C


;;; $C46C: A = sin([A] * pi / 80h) * ±[Y] ;;;
GetSineMathInA_A9C46C:
; Uses the fast (signed) multiplication registers(!)
    PHX
    ASL : AND.W #$01FE : TAX
    LDA.L SineCosineTables_8bitSine_SignExtended,X
    SEP #$20
    STA.L $00211B
    XBA : STA.L $00211B
    TYA : STA.L $00211C
    REP #$20
    LDA.L $002135
    PLX
    RTL


if !FEATURE_KEEP_UNREFERENCED
;;; $C48E: Unused. Enemy X position += [A] / 100h ;;;
UNUSED_AddADividedBy100ToEnemyXPosition_A9C48E:
    SEP #$20
    CLC : ADC.W Enemy.XSubPosition+1,X : STA.W Enemy.XSubPosition+1,X
    REP #$20
    AND.W #$FF00 : XBA : BPL +
    ORA.W #$FF00

+   ADC.W Enemy.XPosition,X : STA.W Enemy.XPosition,X
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $C4A9: Enemy Y position += [A] / 100h ;;;
AddADividedBy100ToEnemyYPosition:
    SEP #$20
    CLC : ADC.W Enemy.YSubPosition+1,X : STA.W Enemy.YSubPosition+1,X
    REP #$20
    AND.W #$FF00 : XBA : BPL +
    ORA.W #$FF00

+   ADC.W Enemy.YPosition,X : STA.W Enemy.YPosition,X
    RTS


;;; $C4C4: Decrement ammo due to rainbow beam ;;;
DecrementAmmoDueToRainbowBeam:
    LDA.W NumberOfTimesMainEnemyRoutineExecuted : AND.W #$0003 : BNE .superMissiles
    LDA.W Missiles : BEQ .superMissiles
    SEC : SBC.W .decrementValue : CMP.W #$0001 : BPL .writeMissiles
    LDA.W SelectedHUDItem : CMP.W #$0001 : BNE .resetAutoCancel
    LDA.W #$0000 : STA.W SelectedHUDItem

  .resetAutoCancel:
    LDA.W #$0000 : STA.W AutoCancelHUDItemIndex

  .writeMissiles:
    STA.W Missiles

  .superMissiles:
    LDA.W NumberOfTimesMainEnemyRoutineExecuted : AND.W #$0003 : BNE .powerBombs
    LDA.W SuperMissiles : BEQ .powerBombs
    SEC : SBC.W .decrementValue : CMP.W #$0001 : BPL .writeSuperMissiles
    LDA.W SelectedHUDItem : CMP.W #$0002 : BNE ..resetAutoCancel
    LDA.W #$0000 : STA.W SelectedHUDItem

  ..resetAutoCancel:
    LDA.W #$0000 : STA.W AutoCancelHUDItemIndex

  .writeSuperMissiles:
    STA.W SuperMissiles

  .powerBombs:
    LDA.W PowerBombs : BEQ .return
    SEC : SBC.W .decrementValue : CMP.W #$0001 : BPL .writePowerBombs
    LDA.W SelectedHUDItem : CMP.W #$0003 : BNE ..resetAutoCancel
    LDA.W #$0000 : STA.W SelectedHUDItem

  ..resetAutoCancel:
    LDA.W #$0000 : STA.W AutoCancelHUDItemIndex

  .writePowerBombs:
    STA.W PowerBombs

  .return:
    RTS

  .decrementValue:
; Amount of ammo to decrement
    dw $0001


;;; $C546: Handle playing gaining/losing incremental health sound effect ;;;
HandlePlayingGainingLosingIncrementalEnergySFX:
    PHA
    LDA.W Energy : CMP.W #$0051 : BMI .return
    LDA.W NumberOfTimesMainEnemyRoutineExecuted : AND.W #$0007 : BNE .return
    LDA.W #$002D
    JSL QueueSound_Lib3_Max3

  .return:
    PLA
    RTS


;;; $C560: Damage Samus due to Shitroid ;;;
DamageSamusDueToBabyMetroid:
    LDY.W #$FFFC
    LDA.W EquippedItems : LSR : BCC .varia
    LDY.W #$FFFD

  .varia:
    TYA : ADC.W Energy : CMP.W #$0002 : BPL .done
    CLC
    LDA.W #$0001

  .done:
    STA.W Energy
    RTL


;;; $C57D: Damage Samus due to rainbow beam ;;;
DamageSamusDueToRainbowBeam:
;; Returns:
;;     Carry: Set if Samus' health has reached zero, clear otherwise
    LDY.W #$FFFE
    LDA.W EquippedItems : LSR : BCC .varia
    LDY.W #$FFFE

  .varia:
    TYA : ADC.W Energy : CMP.W #$0001 : BPL .done
    CLC
    LDA.W #$0000

  .done:
    STA.W Energy
    PHP
    JSR HandlePlayingGainingLosingIncrementalEnergySFX
    PLP
    RTL


;;; $C59F: Heal Samus due to Shitroid ;;;
HealSamusDueToBabyMetroid:
;; Returns:
;;     Carry: Clear if Samus' health has reached max, set otherwise
    LDA.W #$0001 : CLC : ADC.W Energy : CMP.W MaxEnergy : BMI .notMaxed
    LDA.W MaxEnergy : STA.W Energy
    JSR HandlePlayingGainingLosingIncrementalEnergySFX
    CLC
    RTL

  .notMaxed:
    STA.W Energy
    JSR HandlePlayingGainingLosingIncrementalEnergySFX
    SEC
    RTL


;;; $C5BE: Process sprite tiles transfers ;;;
ProcessSpriteTilesTransfers:
;; Parameters:
;;     X: Pointer to start of a list of sprite tiles transfers, one entry processed per call
;; Returns:
;;     Carry: Set if finished list

; When not currently processing a list, $7E:8004 is 0;
; otherwise, $7E:8004 is the pointer to the next entry to process from the list initially passed in X
; (X is only used by the call initiating the list processing)

; This routine is being used to spread large VRAM transfers over multiple frames (as 1C0h or 200h byte chunks),
; but it could just as easily be called for doing small animations
    LDA.L MotherBrainBody.spriteTilesTransferEntryPointer : BNE +
    TXA

+   TAX
    LDY.W VRAMWriteStack
    LDA.W $0000,X : BEQ +
    STA.W VRAMWrite.size,Y ; >.<
    LDA.W $0003,X : STA.W VRAMWrite.src+1,Y ; >.<
    LDA.W $0002,X : STA.W VRAMWrite.src,Y ; >.<
    LDA.W $0005,X : STA.W VRAMWrite.dest,Y ; >.<
    TYA : CLC : ADC.W #$0007 : STA.W VRAMWriteStack
    TXA : ADC.W #$0007 : STA.L MotherBrainBody.spriteTilesTransferEntryPointer
    TAX
    LDA.W $0000,X : BEQ +
    CLC
    RTS

+   STA.L MotherBrainBody.spriteTilesTransferEntryPointer
    SEC
    RTS


;;; $C601: Make Mother Brain walk forwards ;;;
MakeMotherBrainWalkForwards:
;; Parameters:
;;     A: Target X position. Maximum of 7Fh
;;     Y: Animation delay
;; Returns:
;;     Carry: Set if reached target, clear otherwise
    CMP.W Enemy.XPosition : BMI .returnReachedTarget
    LDA.L MotherBrainBody.pose : BNE .returnNotReached
    LDA.W Enemy.XPosition : CMP.W #$0080 : BPL .returnReachedTarget
    LDA.W .pointers,Y
    JSR SetMotherBrainBodyInstList

  .returnNotReached:
    CLC
    RTS

  .returnReachedTarget:
    SEC
    RTS

  .pointers:
    dw .pointers
    dw InstList_MotherBrainBody_WalkingForwards_ReallyFast
    dw InstList_MotherBrainBody_WalkingForwards_Fast
    dw InstList_MotherBrainBody_WalkingForwards_Medium
    dw InstList_MotherBrainBody_WalkingForwards_Slow
    dw InstList_MotherBrainBody_WalkingForwards_ReallySlow


if !FEATURE_KEEP_UNREFERENCED
;;; $C62A: Unused. Make Mother Brain walk backwards ;;;
UNUSED_MakeMotherBrainWalkBackwards_A9C62A:
; Allows her to go back further than MakeMotherBrainWalkBackwards does
    CMP.W Enemy.XPosition : BPL .returnCarrySet
    LDA.L MotherBrainBody.pose : BNE .returnCarryClear
    LDA.W Enemy.XPosition : CMP.W #$0010 : BMI .returnCarrySet
    LDA.W MakeMotherBrainWalkBackwards_pointers,Y
    JSR SetMotherBrainBodyInstList

  .returnCarryClear:
    CLC
    RTS

  .returnCarrySet:
    SEC
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $C647: Make Mother Brain walk backwards ;;;
MakeMotherBrainWalkBackwards:
;; Parameters:
;;     A: Target X position. Minimum of 2Fh
;;     Y: Speed (actually animation delay)
;; Returns:
;;     Carry: Set if reached target, clear otherwise
    CMP.W Enemy.XPosition : BPL .returnTargetReached
    LDA.L MotherBrainBody.pose : BNE .returnNotReached
    LDA.W Enemy.XPosition : CMP.W #$0030 : BMI .returnTargetReached
    LDA.W MakeMotherBrainWalkBackwards_pointers,Y
    JSR SetMotherBrainBodyInstList

  .returnNotReached:
    CLC
    RTS

  .returnTargetReached:
    SEC
    RTS

  .pointers:
    dw .pointers
    dw InstList_MotherBrainBody_WalkingBackwards_ReallyFast
    dw InstList_MotherBrainBody_WalkingBackwards_Fast
    dw InstList_MotherBrainBody_WalkingBackwards_Medium
    dw InstList_MotherBrainBody_WalkingBackwards_Slow
    dw InstList_MotherBrainBody_WalkingBackwards_ReallySlow


;;; $C670: Make Mother Brain stand up ;;;
MakeMotherBrainStandUp:
;; Returns:
;;     Carry: Set if standing, clear otherwise
    LDA.L MotherBrainBody.pose : BEQ .returnStanding
    LDY.W #InstList_MotherBrainBody_StandingUpAfterCrouching_Fast
    CMP.W #$0003 : BEQ .standFast
    CMP.W #$0006 : BNE .returnNotStanding
    LDY.W #InstList_MotherBrainBody_StandingUpAfterLeaningDown

  .standFast:
    TYA
    JSR SetMotherBrainBodyInstList

  .returnNotStanding:
    CLC
    RTS

  .returnStanding:
    SEC
    RTS


;;; $C68E: Make Mother Brain crouch ;;;
MakeMotherBrainCrouch:
;; Returns:
;;     Carry: Set if crouched, clear otherwise
    LDA.L MotherBrainBody.pose : BEQ .crouchSlow
    CMP.W #$0003 : BNE .notCrouched
    SEC
    RTS

  .crouchSlow:
    LDA.W #InstList_MotherBrainBody_Crouch_Slow

  .setToCrouch:
    JSR SetMotherBrainBodyInstList

  .notCrouched:
    CLC
    RTS


;;; $C6A3: Make Mother Brain lean down ;;;
MakeMotherBrainLeanDown:
;; Returns:
;;     Carry: Set if leaning down, clear otherwise
    LDA.L MotherBrainBody.pose : BEQ .leanDown
    CMP.W #$0006 : BNE .notLeaningDown
    SEC
    RTS

  .leanDown:
    LDA.W #InstList_MotherBrainBody_LeaningDown
    JSR SetMotherBrainBodyInstList

  .notLeaningDown:
    CLC
    RTS


;;; $C6B8: Handle Mother Brain walking ;;;
HandleMotherBrainWalking:
    LDA.L MotherBrainBody.pose : BEQ .standing
    RTS

  .standing:
    LDA.L MotherBrainBody.walkCounter : BEQ .walkBackwards
    CLC : ADC.W #$0006 : STA.L MotherBrainBody.walkCounter
    CMP.W #$0100 : BCC .maybeWalkForwardsIfFarLeft

  .walkForwards:
    LDA.W #$0080 : STA.L MotherBrainBody.walkCounter
    LDA.W Enemy.XPosition : CMP.W #$0080 : BPL .return
    LDA.W #InstList_MotherBrainBody_WalkingForwards_Medium
    JMP SetMotherBrainBodyInstList

  .walkBackwards:
    LDA.W #$0001 : STA.L MotherBrainBody.walkCounter
    LDA.W Enemy.XPosition : CMP.W #$0030 : BMI .maybeWalkForwards
    LDA.W #InstList_MotherBrainBody_WalkingBackwards_Fast
    JMP SetMotherBrainBodyInstList

  .maybeWalkForwardsIfFarLeft:
    LDA.W Enemy.XPosition : CMP.W #$0030 : BPL .return

  .maybeWalkForwards:
    LDA.W RandomNumberSeed : AND.W #$0FFF : CMP.W #$0FC0 : BPL .walkForwards

  .return:
    RTS


;;; $C710: Initialisation AI - enemy $ECBF (Shitroid in cutscene) ;;;
InitAI_BabyMetroidCutscene:
    LDX.W EnemyIndex
    LDA.W Enemy.properties,X : ORA.W #$3000 : STA.W Enemy.properties,X
    LDA.W #$0E00 : STA.W Enemy.palette,X
    LDA.W #InstList_BabyMetroid_Initial : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X : STA.L BabyMetroidCutscene.crySFXFlag,X
    STZ.W Enemy.loopCounter,X
    LDA.W #$000A : STA.W BabyMetroidCutscene.paletteHandlerDelay,X
    LDA.W #$00A0 : STA.W Enemy.GFXOffset,X
    LDA.W #$0140 : STA.W Enemy.XPosition,X
    LDA.W #$0060 : STA.W Enemy.YPosition,X
    STZ.W BabyMetroidCutscene.XVelocity,X : STZ.W BabyMetroidCutscene.YVelocity,X
    LDA.W #$0000 : STA.L BabyMetroidCutscene.healthBasedPaletteFlag,X
    LDA.W #Function_BabyMetroidCutscene_DashOntoScreen : STA.W BabyMetroidCutscene.function,X
    LDA.W #$00F8 : STA.W BabyMetroidCutscene.functionTimer,X
    LDA.W #HandleBabyMetroidCutscenePalette_Normal : STA.L BabyMetroidCutscene.paletteFunction,X
    LDY.W #Palette_MotherBrain_BabyMetroid+2
    LDX.W #$01E2
    LDA.W #$000F
    JMP WriteAColorsFromYtoColorIndexX


;;; $C779: Main AI - enemy $ECBF (Shitroid in cutscene) ;;;
MainAI_BabyMetroidCutscene:
    LDX.W EnemyIndex
    STZ.W Enemy.shakeTimer,X
    JSR.W (BabyMetroidCutscene.function,X)
    JSL MoveEnemyAccordingToVelocity
    JSR HandleBabyMetroidFlashing
    JSR HandleBabyMetroidHealthBasedPalette
    LDX.W EnemyIndex
    LDA.L BabyMetroidCutscene.paletteFunction,X : STA.B DP_Temp12
    PEA .manualReturn-1
    JMP.W (DP_Temp12)

  .manualReturn:
    RTL


;;; $C79C: Handle Shitroid flashing ;;;
HandleBabyMetroidFlashing:
    LDY.W #$0E00
    LDA.L BabyMetroidCutscene.flashTimer,X : BEQ .return
    DEC : STA.L BabyMetroidCutscene.flashTimer,X
    AND.W #$0002 : BEQ .return
    LDY.W #$0000

  .return:
    TYA : STA.W Enemy.palette,X
    RTS


;;; $C7B7: Handle playing Shitroid cry ;;;
HandlePlayingBabyMetroidCutsceneCrySFX:
    LDA.L MotherBrainBody.playBabyMetroidCryFlag : BEQ .return
    LDA.W #$0000 : STA.L MotherBrainBody.playBabyMetroidCryFlag
    LDA.W #$0072
    JSL QueueSound_Lib2_Max6

  .return:
    RTS


;;; $C7CC: Shitroid function - dash onto screen ;;;
Function_BabyMetroidCutscene_DashOntoScreen:
    DEC.W BabyMetroidCutscene.functionTimer,X : BMI .timerExpired
    RTS

  .timerExpired:
    LDA.W #$D800 : STA.L BabyMetroidCutscene.angle,X
    LDA.W #$0A00 : STA.L BabyMetroidCutscene.speed,X
    LDA.W #Function_BabyMetroidCutscene_CurveTowardMotherBrainHead : STA.W BabyMetroidCutscene.function,X
    LDA.W #$000A : STA.W BabyMetroidCutscene.functionTimer,X
; fallthrough to Function_BabyMetroidCutscene_CurveTowardMotherBrainHead


;;; $C7EC: Shitroid function - curve towards Mother Brain brain ;;;
Function_BabyMetroidCutscene_CurveTowardMotherBrainHead:
    LDA.W #$FE80 : STA.B DP_Temp12
    LDA.W #$B000 : STA.B DP_Temp14
    LDA.W #$0A00 : STA.B DP_Temp16
    JSR UpdateBabyMetroidCutsceneSpeedAndAngle
    DEC.W BabyMetroidCutscene.functionTimer,X : BMI .timerExpired
    RTS

  .timerExpired:
    LDA.W #Function_BabyMetroidCutscene_GetRightUpInMotherBrainsFace : STA.W BabyMetroidCutscene.function,X
    LDA.W #$0009 : STA.W BabyMetroidCutscene.functionTimer,X
    RTS


;;; $C811: Shitroid function - get right up in Mother Brain's face ;;;
Function_BabyMetroidCutscene_GetRightUpInMotherBrainsFace:
    LDA.W #$FA00 : STA.B DP_Temp12
    LDA.W #$8200 : STA.B DP_Temp14
    LDA.W #$0E00 : STA.B DP_Temp16
    JSR UpdateBabyMetroidCutsceneSpeedAndAngle
    LDA.W Enemy[1].XPosition : STA.B DP_Temp12
    LDA.W Enemy[1].YPosition : STA.B DP_Temp14
    LDA.W #$0004 : STA.B DP_Temp16 : STA.B DP_Temp18
    JSL CheckForEnemyCollisionWithRectangle
    BCC .timerExpired
    DEC.W BabyMetroidCutscene.functionTimer,X : BMI .timerExpired
    RTS

  .timerExpired:
    STA.W BabyMetroidCutscene.function,X ; >.<
    LDA.W #Function_BabyMetroidCutscene_LatchOntoMotherBrain : STA.W BabyMetroidCutscene.function,X
    LDA.W #$0001
    JSL DrainedSamusController
    RTS


;;; $C851: Shitroid function - latch onto Mother Brain ;;;
Function_BabyMetroidCutscene_LatchOntoMotherBrain:
    LDA.W Enemy[1].XPosition : STA.B DP_Temp12
    LDA.W Enemy[1].YPosition : CLC : ADC.W #$FFE8 : STA.B DP_Temp14
    LDY.W #$0000
    JSR GradduallyAccelerateTowardsPoint_1A_400
    LDA.W #$0008 : STA.B DP_Temp16 : STA.B DP_Temp18
    JSL CheckForEnemyCollisionWithRectangle
    BCS .return
    LDA.W #Function_BabyMetroidCutscene_SetMotherBrainToStumbleBack : STA.W BabyMetroidCutscene.function,X

  .return:
    RTS


;;; $C879: Shitroid function - set Mother Brain to stumble back ;;;
Function_BabyMetroidCutscene_SetMotherBrainToStumbleBack:
    LDY.W #$0002
    LDA.W Enemy.XPosition : DEC
    JSR MakeMotherBrainWalkBackwards
    LDA.W #Function_BabyMetroidCutscene_ActivateRainbowBeamAndMBBody : STA.W BabyMetroidCutscene.function,X
; fallthrough to Function_BabyMetroidCutscene_ActivateRainbowBeamAndMBBody


;;; $C889: Shitroid function - activate rainbow beam and Mother Brain body ;;;
Function_BabyMetroidCutscene_ActivateRainbowBeamAndMBBody:
    LDA.W Enemy[1].XPosition : CLC : ADC.W #$0000 : STA.B DP_Temp12
    LDA.W Enemy[1].YPosition : CLC : ADC.W #$FFE8 : STA.B DP_Temp14
    LDA.W #$0200
    JSR AccelerateBabyMetroidTowardsPoint
    BCS .reachedTarget
    RTS

  .reachedTarget:
    STZ.W BabyMetroidCutscene.XVelocity,X : STZ.W BabyMetroidCutscene.YVelocity,X
    LDA.W Enemy[1].XPosition : STA.W Enemy.XPosition,X
    LDA.W Enemy[1].YPosition : CLC : ADC.W #$FFE8 : STA.W Enemy.YPosition,X
    LDA.W #InstList_BabyMetroid_DrainingMotherBrain
    JSL SetEnemyInstList
    LDA.W #Function_BabyMetroidCutscene_WaitForMBToTurnToCorpse : STA.W BabyMetroidCutscene.function,X
    LDA.W #$0001 : STA.W BabyMetroidCutscene.paletteHandlerDelay,X
    LDA.W #Function_MotherBrainBody_DrainedByBabyMetroid_TakenAback : STA.W MotherBrainBody.function
    LDA.W #$0040
    JSL QueueSound_Lib1_Max6
    LDA.W #$0001 : STA.L MotherBrainBody.rainbowBeamSFXIsPlayingFlag
    RTS


;;; $C8E2: Shitroid function - wait for Mother Brain to turn to corpse ;;;
Function_BabyMetroidCutscene_WaitForMBToTurnToCorpse:
    LDA.W Enemy.frameCounter,X : AND.W #$0006 : TAY
    LDA.W ShakingOffsets_X,Y : CLC : ADC.W Enemy[1].XPosition : STA.W Enemy.XPosition,X
    LDA.W ShakingOffsets_Y,Y : CLC : ADC.W Enemy[1].YPosition
    CLC : ADC.W #$FFE8 : STA.W Enemy.YPosition,X
    LDA.L MotherBrainBody.phase2CorpseState : BNE .turnedToCorpse
    RTS

  .turnedToCorpse:
    LDA.W #Function_BabyMetroidCutscene_StopDraining : STA.W BabyMetroidCutscene.function,X
    LDA.W #$0040 : STA.W BabyMetroidCutscene.functionTimer,X
    RTS


;;; $C915: Shitroid function - stop draining ;;;
Function_BabyMetroidCutscene_StopDraining:
    LDA.W Enemy[1].XPosition : STA.W Enemy.XPosition,X
    LDA.W Enemy[1].YPosition : CLC : ADC.W #$FFE8 : STA.W Enemy.YPosition,X
    DEC.W BabyMetroidCutscene.functionTimer,X : BMI .timerExpired
    RTS

  .timerExpired:
    LDA.W #InstList_BabyMetroid_Initial
    JSL SetEnemyInstList
    LDA.W #$000A : STA.W BabyMetroidCutscene.paletteHandlerDelay,X
    LDA.W #Function_BabyMetroidCutscene_LetGo_SpawnDustClouds : STA.W BabyMetroidCutscene.function,X
    LDA.W #$0020 : STA.W BabyMetroidCutscene.functionTimer,X
    STZ.W BabyMetroidCutscene.XVelocity,X : STZ.W BabyMetroidCutscene.YVelocity,X
    RTS


;;; $C94B: Shitroid function - let go and spawn dust clouds ;;;
Function_BabyMetroidCutscene_LetGo_SpawnDustClouds:
    DEC.W BabyMetroidCutscene.functionTimer,X : BPL Function_BabyMetroidCutscene_MoveToTheCeiling
    JSR SpawnThreeDustCloudsOnMotherBrainHead
    LDA.W #Function_BabyMetroidCutscene_MoveToTheCeiling : STA.W BabyMetroidCutscene.function,X
; fallthrough to Function_BabyMetroidCutscene_MoveToTheCeiling


;;; $C959: Shitroid function - move up to ceiling ;;;
Function_BabyMetroidCutscene_MoveToTheCeiling:
    LDA.W Enemy[1].XPosition : STA.B DP_Temp12
    LDA.W #$0000 : STA.B DP_Temp14
    LDY.W #$0000
    JSR GradduallyAccelerateTowardsPoint_1A_400
    LDA.W #$0004 : STA.B DP_Temp16 : STA.B DP_Temp18
    JSL CheckForEnemyCollisionWithRectangle
    BCC .collision
    RTS

  .collision:
    LDA.W #$0004
    JSL DrainedSamusController
    LDA.W #Function_BabyMetroidCutscene_MoveToSamus : STA.W BabyMetroidCutscene.function,X
    LDA.W #BabyMetroidCutscene_MovementTable_CeilingToSamus : STA.L BabyMetroidCutscene.movementTablePointer,X
    RTS


;;; $C98C: Spawn three dust clouds on Mother Brain brain ;;;
SpawnThreeDustCloudsOnMotherBrainHead:
    LDA.W #$FFF8 : STA.B DP_Temp14
    LDA.W #$FFF0
    JSR SpawnDustCloudAtMotherBrainHeadPosition_OffsetByA_14
    LDA.W #$FFF0 : STA.B DP_Temp14
    LDA.W #$0000
    JSR SpawnDustCloudAtMotherBrainHeadPosition_OffsetByA_14
    LDA.W #$FFF8 : STA.B DP_Temp14
    LDA.W #$0010
; fallthrough to SpawnDustCloudAtMotherBrainHeadPosition_OffsetByA_14


;;; $C9AA: Spawn dust cloud at Mother Brain brain position offset by ([A], [$14]) ;;;
SpawnDustCloudAtMotherBrainHeadPosition_OffsetByA_14:
    CLC : ADC.W Enemy[1].XPosition : STA.B DP_Temp12
    LDA.B DP_Temp14 : CLC : ADC.W Enemy[1].YPosition : STA.B DP_Temp14
    LDA.W #$0009
    LDY.W #EnemyProjectile_MiscDust
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    RTS


;;; $C9C3: Shitroid function - move to Samus ;;;
Function_BabyMetroidCutscene_MoveToSamus:
; Is this used for the sidehopper attack too?! Note the enemy index being 80h instead of C0h
    LDA.W #$0000 : STA.L BabyMetroidCutscene.crySFXFlag,X
    INC : STA.L BabyMetroidCutscene.healthBasedPaletteFlag,X
    LDA.W RandomNumberSeed : AND.W #$0FFF : CMP.W #$0FA0 : BCC .skipSFX
    LDA.W #$0052
    JSL QueueSound_Lib2_Max6

  .skipSFX:
    LDA.L BabyMetroidCutscene.movementTablePointer,X : TAY
    LDA.W $0000,Y : STA.B DP_Temp12
    LDA.W $0002,Y : STA.B DP_Temp14
    LDA.W $0006,Y : STA.B DP_Temp16
    LDA.W $0004,Y
    PHY
    TAY
    PEA .manualReturn-1
    JMP.W (DP_Temp16)

  .manualReturn:
    PLY
    LDA.W #$0004 : STA.B DP_Temp16 : STA.B DP_Temp18
    JSL CheckForEnemyCollisionWithRectangle
    BCS .return
    LDA.W $0008,Y : BMI .function
    LDA.L BabyMetroidCutscene.movementTablePointer,X : CLC : ADC.W #$0008 : STA.L BabyMetroidCutscene.movementTablePointer,X

  .return:
    RTS

  .function:
    STA.W BabyMetroidCutscene.function,X
    RTS


;;; $CA24: Shitroid movement table - ceiling -> Samus ;;;
BabyMetroidCutscene_MovementTable_CeilingToSamus:
; GradduallyAccelerateTowardsPoint_1A_8 - $1A = 8
; GradduallyAccelerateTowardsPoint_1A_10 - $1A = 10h (faster off-screen movement)
;        ____________________ Target X position (or next enemy function if $8000+)
;       |      ______________ Target Y position
;       |     |      ________ Acceleration divisor table index (0 is slowest acceleration)
;       |     |     |
    dw $00A0,$0078,$0000
    dw GradduallyAccelerateTowardsPoint_1A_10
    dw $0130,$007A,$0000
    dw GradduallyAccelerateTowardsPoint_1A_10
    dw $00C0,$0040,$0000
    dw GradduallyAccelerateTowardsPoint_1A_10
    dw $00C0,$0070,$0000
    dw GradduallyAccelerateTowardsPoint_1A_10
    dw $00E0,$0080,$0000
    dw GradduallyAccelerateTowardsPoint_1A_10
    dw $00CD,$0090,$0000
    dw GradduallyAccelerateTowardsPoint_1A_8
    dw $00CC,$00A0,$0000
    dw GradduallyAccelerateTowardsPoint_1A_8
    dw $00CB,$00B0,$0000
    dw GradduallyAccelerateTowardsPoint_1A_8
    dw Function_BabyMetroidCutscene_LatchOntoSamus


;;; $CA66: Shitroid function - latch onto Samus ;;;
Function_BabyMetroidCutscene_LatchOntoSamus:
    LDA.W SamusXPosition : STA.B DP_Temp12
    LDA.W SamusYPosition : SEC : SBC.W #$0014 : STA.B DP_Temp14
    LDY.W #$0000
    JMP GradduallyAccelerateTowardsPoint_1A_400


;;; $CA7A: Shitroid function - heal Samus up to full health ;;;
Function_BabyMetroidCutscene_HealSamusUpToFullEnergy:
    LDA.W #$0000 : STA.L BabyMetroidCutscene.crySFXFlag,X
    JSR HandlePlayingBabyMetroidCutsceneCrySFX
    LDA.W Enemy.frameCounter,X : AND.W #$0006 : TAY
    LDA.W ShakingOffsets_X,Y : CLC : ADC.W SamusXPosition : STA.W Enemy.XPosition,X
    LDA.W ShakingOffsets_Y,Y : CLC : ADC.W SamusYPosition
    SEC : SBC.W #$0014 : STA.W Enemy.YPosition,X
    JSL HealSamusDueToBabyMetroid
    BCS .return
    LDA.W MaxReserveEnergy : STA.W ReserveEnergy
    LDA.W #Function_BabyMetroidCutscene_IdleUntilRunOutOfHealth : STA.W BabyMetroidCutscene.function,X
    LDA.W #.return : STA.L BabyMetroidCutscene.paletteFunction,X

  .return:
    RTS


;;; $CABD: Shitroid function - idle until run out of health ;;;
Function_BabyMetroidCutscene_IdleUntilRunOutOfHealth:
    JSR HandlePlayingBabyMetroidCutsceneCrySFX
    LDA.L BabyMetroidCutscene.flashTimer,X : BEQ .checkHealth
    AND.W #$0006 : TAY
    LDA.W ShakingOffsets_X,Y : ASL : CLC : ADC.W SamusXPosition : STA.W Enemy.XPosition,X
    LDA.W ShakingOffsets_Y,Y : ASL : CLC : ADC.W SamusYPosition
    SEC : SBC.W #$0014 : STA.W Enemy.YPosition,X

  .checkHealth:
    LDA.W Enemy.health,X : BEQ .zeroHealth
    RTS

  .zeroHealth:
    LDA.W #$0140 : STA.W Enemy.health,X
    LDA.W #Function_BabyMetroidCutscene_ReleaseSamus : STA.W BabyMetroidCutscene.function,X
    LDA.W #$000A : STA.W BabyMetroidCutscene.paletteHandlerDelay,X
    STZ.W BabyMetroidCutscene.paletteFrameTimer,X
    LDA.W #HandleBabyMetroidCutscenePalette_LowHealth : STA.L BabyMetroidCutscene.paletteFunction,X
    LDA.W #$0001 : STA.L BabyMetroidCutscene.crySFXFlag,X
    DEC : STA.L BabyMetroidCutscene.healthBasedPaletteFlag,X
    RTS


;;; $CB13: Shitroid function - release Samus ;;;
Function_BabyMetroidCutscene_ReleaseSamus:
    LDA.W #$0072
    JSL QueueSound_Lib2_Max6
    LDA.W #$0001 : STA.L BabyMetroidCutscene.speed+$40
    LDA.W #Function_BabyMetroidCutscene_StaredownMotherBrain : STA.W BabyMetroidCutscene.function,X
    LDA.W #Function_MBBody_Phase2_PrepareForFinalBabyMetroidAttack : STA.W MotherBrainBody.function
; fallthrough to Function_BabyMetroidCutscene_StaredownMotherBrain


;;; $CB2D: Shitroid function - stare down Mother Brain ;;;
Function_BabyMetroidCutscene_StaredownMotherBrain:
    LDA.W SamusXPosition : SEC : SBC.W #$0004 : STA.B DP_Temp12
    LDA.W #$0060 : STA.B DP_Temp14
    LDY.W #$0000
    JSR GradduallyAccelerateTowardsPoint_1A_10
    LDA.W #$0004 : STA.B DP_Temp16 : STA.B DP_Temp18
    JSL CheckForEnemyCollisionWithRectangle
    BCC .collision
    RTS

  .collision:
    LDA.W #Function_BabyMetroidCutscene_FlyOffScreen : STA.W BabyMetroidCutscene.function,X
    RTS


;;; $CB56: Shitroid function - fly off-screen ;;;
Function_BabyMetroidCutscene_FlyOffScreen:
    LDA.W #$0110 : STA.B DP_Temp12
    LDA.W #$0040 : STA.B DP_Temp14
    LDY.W #$0000
    JSR GradduallyAccelerateTowardsPoint_1A_10
    LDA.W #$0004 : STA.B DP_Temp16 : STA.B DP_Temp18
    JSL CheckForEnemyCollisionWithRectangle
    BCC .collision
    RTS

  .collision:
    LDA.W #Function_BabyMetroidCutscene_MoveToFinalChargeStartPosition : STA.W BabyMetroidCutscene.function,X
    RTS


;;; $CB7B: Shitroid function - move to final charge start position ;;;
Function_BabyMetroidCutscene_MoveToFinalChargeStartPosition:
    LDA.W #$0131 : STA.B DP_Temp12
    LDA.W #$00A0 : STA.B DP_Temp14
    LDY.W #$0000
    JSR GradduallyAccelerateTowardsPoint_1A_10
    LDA.W #$0004 : STA.B DP_Temp16 : STA.B DP_Temp18
    JSL CheckForEnemyCollisionWithRectangle
    BCC .collision
    RTS

  .collision:
    LDA.W #$004F : STA.W Enemy.health,X
    LDA.W #$0000 : STA.L BabyMetroidCutscene.speed+$40
    LDA.W #Function_MBBody_Phase2_ExecuteFinalBabyMetroidAttack : STA.W MotherBrainBody.function
    LDA.W #Function_BabyMetroidCutscene_InitiateFinalCharge : STA.W BabyMetroidCutscene.function,X
    RTS


;;; $CBB3: Shitroid function - initiate final charge ;;;
Function_BabyMetroidCutscene_InitiateFinalCharge:
    LDA.W #$0122 : STA.B DP_Temp12
    LDA.W #$0080 : STA.B DP_Temp14
    LDY.W #$000A
    JSR GradduallyAccelerateTowardsPoint_1A_400
    LDA.W #$0004 : STA.B DP_Temp16 : STA.B DP_Temp18
    JSL CheckForEnemyCollisionWithRectangle
    BCC .collision
    RTS

  .collision:
    LDA.W #Function_BabyMetroidCutscene_FinalCharge : STA.W BabyMetroidCutscene.function,X
    RTS


;;; $CBD8: Shitroid function - final charge ;;;
Function_BabyMetroidCutscene_FinalCharge:
    LDA.W Enemy[1].XPosition : STA.B DP_Temp12
    LDA.W #$FFE0 : CLC : ADC.W Enemy[1].YPosition : STA.B DP_Temp14
    LDY.W #$000C
    JSR GradduallyAccelerateTowardsPoint_1A_400
    LDA.W Enemy.health,X : BEQ .zeroHealth
    RTS

  .zeroHealth:
    LDA.W #Function_BabyMetroidCutscene_PrepareForHyperBeam_return : STA.L BabyMetroidCutscene.paletteFunction,X
    LDA.W #$10A0 : STA.W Enemy.GFXOffset,X
    LDA.W #$0019
    JSL QueueSound_Lib3_Max6
    JSL FadeOutBackgroundForBabyMetroidDeathSequence
    LDA.W #InstList_BabyMetroid_TookFatalBlow
    JSL SetEnemyInstList
    STZ.W BabyMetroidCutscene.XVelocity,X : STZ.W BabyMetroidCutscene.YVelocity,X
    LDA.W #RTS_A9C18D : STA.W MotherBrainBody.function
    LDA.W #$0000
    JSL QueueMusicDataOrTrack_8FrameDelay
    LDA.W #Function_BabyMetroidCutscene_TakeFinalBlow : STA.W BabyMetroidCutscene.function,X
    LDA.W #$0010 : STA.W BabyMetroidCutscene.functionTimer,X
    LDA.W Enemy.XPosition,X : STA.L BabyMetroidCutscene.shakingOriginXPosition,X
    LDA.W Enemy.YPosition,X : STA.L BabyMetroidCutscene.shakingOriginYPosition,X
; fallthrough to Function_BabyMetroidCutscene_TakeFinalBlow


;;; $CC3E: Shitroid function - Shitroid takes fatal blow ;;;
Function_BabyMetroidCutscene_TakeFinalBlow:
    JSR ShakeBabyMetroidCutscene
    DEC.W BabyMetroidCutscene.functionTimer,X : BPL Function_BabyMetroidCutscene_PrepareForHyperBeam_return
    LDA.L BabyMetroidCutscene.shakingOriginXPosition,X : STA.W Enemy.XPosition,X
    LDA.L BabyMetroidCutscene.shakingOriginYPosition,X : STA.W Enemy.YPosition,X
    LDA.W #Function_BabyMetroidCutscene_PlaySamusTheme : STA.W BabyMetroidCutscene.function,X
    LDA.W #$0038 : STA.W BabyMetroidCutscene.functionTimer,X
; fallthrough to Function_BabyMetroidCutscene_PlaySamusTheme


;;; $CC60: Shitroid function - play Samus theme ;;;
Function_BabyMetroidCutscene_PlaySamusTheme:
    DEC.W BabyMetroidCutscene.functionTimer,X : BPL Function_BabyMetroidCutscene_PrepareForHyperBeam_return
    LDA.W #$FF48
    JSL QueueMusicDataOrTrack_8FrameDelay
    LDA.W #$0005
    JSL QueueMusicDataOrTrack_8FrameDelay
    LDA.W #Function_BabyMetroidCutscene_PrepareForHyperBeam : STA.W BabyMetroidCutscene.function,X
    LDA.W #$000C : STA.W BabyMetroidCutscene.functionTimer,X
; fallthrough to Function_BabyMetroidCutscene_PrepareForHyperBeam


;;; $CC7F: Shitroid function - prepare Samus for hyper beam acquisition ;;;
Function_BabyMetroidCutscene_PrepareForHyperBeam:
    DEC.W BabyMetroidCutscene.functionTimer,X : BPL .return
    LDA.W #$0019
    JSL Run_Samus_Command
    LDA.W #SamusRainbowPaletteFunction_ActivateRainbowWhenEnemyIsLow : STA.L MotherBrainBody.SamusRainbowPaletteFunction
    LDA.W #Function_BabyMetroidCutscene_DeathSequence : STA.W BabyMetroidCutscene.function,X

  .return:
    RTS


;;; $CC99: Shitroid function - death sequence ;;;
Function_BabyMetroidCutscene_DeathSequence:
    JSR HandleSamusRainbowPaletteAnimation
    JSR AccelerateBabyMetroidDownwards
    JSR FadeBabyMetroidCutsceneToBlack
    BCS .fadedToBlack
    JSR HandleBabyMetroidCutsceneDeathExplosions
    JMP HandleEnemyBlinking

  .fadedToBlack:
    LDA.W Enemy.properties,X : ORA.W #$0100 : STA.W Enemy.properties,X
    LDA.W #Function_BabyMetroidCutscene_UnloadTiles : STA.W BabyMetroidCutscene.function,X
    LDA.W #$0080 : STA.W BabyMetroidCutscene.functionTimer,X

  .return:
    RTS


;;; $CCC0: Shitroid function - unload Shitroid tiles ;;;
Function_BabyMetroidCutscene_UnloadTiles:
    JSR HandleSamusRainbowPaletteAnimation
    DEC.W BabyMetroidCutscene.functionTimer,X : BPL Function_BabyMetroidCutscene_DeathSequence_return
    PHX
    LDX.W #MotherBrainFightSpriteTileTransferEntries_attacks
    JSR ProcessSpriteTilesTransfers
    PLX
    BCC Function_BabyMetroidCutscene_DeathSequence_return
    LDA.W #Function_BabyMetroidCutscene_LetSamusRainbowSomeMore : STA.W BabyMetroidCutscene.function,X
    LDA.W #$00B0 : STA.W BabyMetroidCutscene.functionTimer,X
; fallthrough to Function_BabyMetroidCutscene_LetSamusRainbowSomeMore


;;; $CCDE: Shitroid function - let Samus rainbow some more ;;;
Function_BabyMetroidCutscene_LetSamusRainbowSomeMore:
    DEC.W BabyMetroidCutscene.functionTimer,X : BPL Function_BabyMetroidCutscene_DeathSequence_return
    LDA.W #Function_BabyMetroidCutscene_FinalCutscene : STA.W BabyMetroidCutscene.function,X
    LDA.W #$0000 : STA.L MotherBrainBody.roomLightsTransitionCounter
; fallthrough to Function_BabyMetroidCutscene_FinalCutscene


;;; $CCF0: Shitroid function - finish cutscene ;;;
Function_BabyMetroidCutscene_FinalCutscene:
    LDA.L MotherBrainBody.roomLightsTransitionCounter : INC : STA.L MotherBrainBody.roomLightsTransitionCounter
    DEC
    PHX
    JSL FadeInBackgroundForMotherBrainPhase3
    PLX
    BCC Function_BabyMetroidCutscene_DeathSequence_return
    LDA.W #Function_MBBody_Phase3_RecoverFromCutscene_MakeSomeDistance : STA.W MotherBrainBody.function
    LDA.W #$0017
    JSL Run_Samus_Command
    LDA.W #$0003
    JSL DrainedSamusController
    LDA.W Enemy.properties,X : ORA.W #$0200 : STA.W Enemy.properties,X
    LDA.W #$0000 : STA.L MotherBrainBody.BabyMetroidEnemyIndex
    RTS


;;; $CD27: Handle Samus rainbow palette animation ;;;
HandleSamusRainbowPaletteAnimation:
    LDA.L MotherBrainBody.SamusRainbowPaletteFunction : STA.B DP_Temp12
    JMP.W (DP_Temp12)


;;; $CD30: Samus rainbow palette function - activate rainbow when enemy is low enough ;;;
SamusRainbowPaletteFunction_ActivateRainbowWhenEnemyIsLow:
    LDA.W Enemy.YPosition,X : CLC : ADC.W #$0010 : CMP.W SamusYPosition : BMI .return
    LDA.W #$0016
    JSL Run_Samus_Command
    LDA.W #SamusRainbowPaletteFunction_GraduallySlowAnimationDown : STA.L MotherBrainBody.SamusRainbowPaletteFunction

  .return:
    RTS


;;; $CD4B: Samus rainbow palette function - gradually slow animation down ;;;
SamusRainbowPaletteFunction_GraduallySlowAnimationDown:
; This Samus rainbow palette animation counter thing is dumb
    LDA.L MotherBrainBody.SamusRainbowPaletteAnimationCounter : CLC : ADC.W #$0300 : STA.L MotherBrainBody.SamusRainbowPaletteAnimationCounter : BCC .return
    LDA.W SpecialSamusPaletteFrame : INC : CMP.W #$000A : BMI .stillSlowing
    LDA.W #$000A

  .stillSlowing:
    STA.W SpecialSamusPaletteFrame

  .return:
    RTS


;;; $CD69: Fade Shitroid to black ;;;
FadeBabyMetroidCutsceneToBlack:
;; Returns:
;;     Carry: Set if faded to black, clear otherwise
    LDA.W Enemy.YPosition,X : CMP.W #$0080 : BMI .returnNotFaded
    PHB
    PEA.W BabyMetroidFadingToBlackPalettes>>8&$FF00 : PLB : PLB
    LDA.L BabyMetroidCutscene.fadeToBlackPaletteTimer,X : DEC : BMI .advancePalette
    STA.L BabyMetroidCutscene.fadeToBlackPaletteTimer,X
    PLB

  .returnNotFaded:
    CLC
    RTS

  .advancePalette:
    LDA.W #$0008 : STA.L BabyMetroidCutscene.fadeToBlackPaletteTimer,X
    LDA.L BabyMetroidCutscene.fadeToBlackPaletteIndex,X : INC : CMP.W #$0007 : BMI .fadeToBlack
    PLB
    SEC
    RTS

  .fadeToBlack:
    PHX
    STA.L BabyMetroidCutscene.fadeToBlackPaletteIndex,X
    ASL : TAX
    LDY.W BabyMetroidFadingToBlackPalettes,X
    LDX.W #$01E2
    LDA.W #$000E
    JSL WriteAColorsFromYtoColorIndexX
    PLX : PLB
    CLC
    RTS


;;; $CDB1: Handle Shitroid death explosions ;;;
HandleBabyMetroidCutsceneDeathExplosions:
    LDA.L BabyMetroidCutscene.deathExplosionTimer,X : DEC : BMI .timerExpired
    STA.L BabyMetroidCutscene.deathExplosionTimer,X
    RTS

  .timerExpired:
    LDA.W #$0004 : STA.L BabyMetroidCutscene.deathExplosionTimer,X
    LDA.L MotherBrainBody.walkCounter,X : INC : CMP.W #$000A : BMI +
    LDA.W #$0000

+   STA.L MotherBrainBody.walkCounter,X
    ASL #2 : TAY
    LDA.W .XOffsets,Y : CLC : ADC.W Enemy.XPosition,X : STA.B DP_Temp12
    LDA.W .YOffsets,Y : CLC : ADC.W Enemy.YPosition,X : STA.B DP_Temp14
    LDA.W #$0003
    LDY.W #EnemyProjectile_MiscDust
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    LDA.W #$0013
    JSL QueueSound_Lib3_Max3
    RTS

; Explosion offset table
;        __________ X offset
;       |      ____ Y offset
;       |     |
  .XOffsets:
    dw $FFE8
  .YOffsets:
    dw       $FFE8
    dw $FFEC,$0014
    dw $0010,$FFE2
    dw $001E,$FFFD
    dw $000E,$FFF3
    dw $FFFE,$0012
    dw $FFFE,$FFE0
    dw $FFE1,$0008
    dw $FFFC,$FFF6
    dw $0013,$0013


;;; $CE24: Handle enemy blinking ;;;
HandleEnemyBlinking:
    LDA.W Enemy.frameCounter,X : AND.W #$0001 : BEQ .invisible
    LDA.W Enemy.properties,X : AND.W #$FEFF : STA.W Enemy.properties,X
    RTS

  .invisible:
    LDA.W Enemy.properties,X : ORA.W #$0100 : STA.W Enemy.properties,X
    RTS


;;; $CE40: Accelerate Shitroid downwards ;;;
AccelerateBabyMetroidDownwards:
    LDA.W BabyMetroid.XVelocity,X : BPL +
    EOR.W #$FFFF : INC

+   SEC : SBC.W #$0020 : BPL +
    LDA.W #$0000

+   BIT.W BabyMetroid.XVelocity,X : BPL +
    EOR.W #$FFFF : INC

+   STA.W BabyMetroid.XVelocity,X
    LDA.W BabyMetroid.YVelocity,X : CLC : ADC.W #$0002 : STA.W BabyMetroid.YVelocity,X
    RTS


;;; $CE69: Handle Shitroid health-based palette ;;;
HandleBabyMetroidHealthBasedPalette:
    LDA.L BabyMetroidCutscene.healthBasedPaletteFlag,X : BEQ .return
    LDA.W Enemy.health,X : CMP.W #$0A00 : BMI .health80

  .return:
    RTS

  .health80:
    LDY.W #$0002
    CMP.W #$08C0 : BPL .setPalette
    LDY.W #$0004
    CMP.W #$0780 : BPL .setPalette
    LDY.W #$0006
    CMP.W #$0640 : BPL .setPalette
    LDY.W #$0008
    CMP.W #$0500 : BPL .setPalette
    LDY.W #$000A
    CMP.W #$03C0 : BPL .setPalette
    LDY.W #$000C
    CMP.W #$0280 : BPL .setPalette
    LDY.W #$000E

  .setPalette:
    PHB
    PEA.W BabyMetroidHealthBasedPalette_Shell>>8&$FF00 : PLB : PLB
    PHY
    LDA.W BabyMetroidHealthBasedPalette_Shell,Y : TAY
    LDX.W #$01E2
    LDA.W #$0004
    JSL WriteAColorsFromYtoColorIndexX
    LDX.W #$01F4
    LDA.W #$0005
    JSL WriteAColorsFromYtoColorIndexX
    PLY
    LDA.W BabyMetroidHealthBasedPalette_Innards,Y : TAY
    LDX.W #$01EA
    LDA.W #$0005
    JSL WriteAColorsFromYtoColorIndexX
    PLB
    RTS


;;; $CEDB: Shake Shitroid ;;;
ShakeBabyMetroidCutscene:
; Decrementing velocity might be setting up initial velocity for the later calls to AccelerateBabyMetroidDownwards, pretty weird stuff...
    LDA.W BabyMetroidCutscene.YVelocity,X : CLC : ADC.W #$FFFF : STA.W BabyMetroidCutscene.YVelocity,X
    LDA.W Enemy.frameCounter,X : AND.W #$0006 : TAY
    LDA.W ShakingOffsets_X,Y : CLC : ADC.L BabyMetroidCutscene.shakingOriginXPosition,X : STA.W Enemy.XPosition,X
    LDA.W ShakingOffsets_Y,Y : CLC : ADC.L BabyMetroidCutscene.shakingOriginYPosition,X : STA.W Enemy.YPosition,X
    RTS


;;; $CF03: Enemy touch - enemy $ECBF (Shitroid in cutscene) ;;;
EnemyTouch_BabyMetroidCutscene:
    LDX.W EnemyIndex
    LDA.W BabyMetroidCutscene.function,X : CMP.W #Function_BabyMetroidCutscene_LatchOntoSamus : BNE .return
    LDA.W SamusXPosition : STA.B DP_Temp12
    LDA.W SamusYPosition : SEC : SBC.W #$0014 : STA.B DP_Temp14
    LDA.W #$0010
    JSR AccelerateBabyMetroidTowardsPoint
    BCC .return
    STZ.W BabyMetroidCutscene.XVelocity,X : STZ.W BabyMetroidCutscene.YVelocity,X
    LDA.W #Function_BabyMetroidCutscene_HealSamusUpToFullEnergy : STA.W BabyMetroidCutscene.function,X

  .return:
    RTL


;;; $CF31: Update Shitroid speed and angle ;;;
UpdateBabyMetroidCutsceneSpeedAndAngle:
;; Parameters:
;;     $12: Angle delta
;;     $14: Target angle
;;     $16: Target speed
    LDA.B DP_Temp16 : CMP.L BabyMetroidCutscene.speed,X : BEQ .speedCalculated
    BPL .notReachedTargedSpeed
    LDA.L BabyMetroidCutscene.speed,X : SEC : SBC.W #$0020 : CMP.B DP_Temp16 : BPL .setSpeed
    LDA.B DP_Temp16

  .setSpeed:
    STA.L BabyMetroidCutscene.speed,X
    BRA .speedCalculated

  .notReachedTargedSpeed:
    LDA.L BabyMetroidCutscene.speed,X : CLC : ADC.W #$0020 : CMP.B DP_Temp16 : BMI ..setSpeed
    LDA.B DP_Temp16

  ..setSpeed:
    STA.L BabyMetroidCutscene.speed,X

  .speedCalculated:
    LDA.B DP_Temp12 : BMI .negativeAngleDelta
    CLC : ADC.L BabyMetroidCutscene.angle,X : CMP.B DP_Temp14 : BMI .setAngle
    BRA .maxAngle

  .negativeAngleDelta:
    CLC : ADC.L BabyMetroidCutscene.angle,X : CMP.B DP_Temp14 : BPL .setAngle

  .maxAngle:
    LDA.B DP_Temp14

  .setAngle:
    STA.L BabyMetroidCutscene.angle,X
    XBA : AND.W #$00FF : STA.B DP_Temp12
    LDA.L BabyMetroidCutscene.speed,X
    JSL CalculateXVelocityFromSpeedAndAngle
    LDX.W EnemyIndex
    STA.W BabyMetroidCutscene.XVelocity,X
    LDA.L BabyMetroidCutscene.speed,X
    JSL CalculateYVelocityFromSpeedAndAngle
    LDX.W EnemyIndex
    STA.W BabyMetroidCutscene.YVelocity,X
    RTS


;;; $CFA2: Instruction list - Shitroid - initial ;;;
InstList_BabyMetroid_Initial:
    dw $0010,Spritemap_BabyMetroid_0
    dw $0010,Spritemap_BabyMetroid_1
    dw $0010,Spritemap_BabyMetroid_2
    dw $0010,Spritemap_BabyMetroid_1
    dw Instruction_BabyMetroid_GotoInitial


;;; $CFB4: Instruction - go to InstList_BabyMetroid_Initial ;;;
Instruction_BabyMetroid_GotoInitial:
    LDY.W #InstList_BabyMetroid_Initial
    RTL


;;; $CFB8: Instruction list - Shitroid - draining Mother Brain ;;;
InstList_BabyMetroid_DrainingMotherBrain:
    dw $0008,Spritemap_BabyMetroid_0
    dw $0008,Spritemap_BabyMetroid_1
    dw $0005,Spritemap_BabyMetroid_2
    dw $0002,Spritemap_BabyMetroid_1
    dw Instruction_BabyMetroid_GotoDrainingMotherBrain


;;; $CFCA: Instruction - go to InstList_BabyMetroid_DrainingMotherBrain ;;;
Instruction_BabyMetroid_GotoDrainingMotherBrain:
    LDY.W #InstList_BabyMetroid_DrainingMotherBrain
    RTL


;;; $CFCE: Instruction list - Shitroid - took fatal blow ;;;
InstList_BabyMetroid_TookFatalBlow:
    dw $0080,Spritemap_BabyMetroid_2
    dw Instruction_Common_Sleep


;;; $CFD4: Process Mother Brain invincibility palette ;;;
ProcessMotherBrainInvincibilityPalette:
    LDA.L MotherBrainBody.form : CMP.W #$0004 : BNE .return
    LDA.W Enemy[1].flashTimer : LSR : BEQ .return
    BCS .return
    LDX.W #$001C

  .loop:
    LDA.L Palettes_SpriteP0+2,X : STA.L Palettes_SpriteP1+2,X
    STA.L Palettes_SpriteP3+2,X : STA.L Palettes_BG12P4+2,X
    DEX #2 : BPL .loop

  .return:
    RTS


;;; $CFFD: Begin screen flashing ;;;
MotherBrainPalette_BeginScreenFlashing:
; Called on end of MB first phase
    LDA.W #InstList_RoomPalette_FirstPhaseEnded : STA.L MotherBrainBody.roomPaletteInstListPointer
    LDA.W #$0001 : STA.L MotherBrainBody.roomPaletteInstructionTimer
    RTS


;;; $D00C: End screen flashing ;;;
MotherBrainPalette_EndScreenFlashing:
    LDA.W #$0000 : STA.L MotherBrainBody.roomPaletteInstListPointer : STA.L MotherBrainBody.roomPaletteInstructionTimer
    LDY.W #RoomPalettes_Phase1Ended_0
    BRA MotherBrainPalette_WriteRoomPalette


;;; $D01C: Handle room palette ;;;
MotherBrainPalette_HandleRoomPalette:
    LDA.W #MotherBrainBody.roomPaletteInstListPointer
    JSR HandleRoomPaletteInstList
    BCS MotherBrainPalette_WriteRoomPalette
    RTS


;;; $D025: Write room palette ;;;
MotherBrainPalette_WriteRoomPalette:
; BG palette 3: Room background
; BG palette 5: Room level graphics
; BG palette 7: ???
    LDX.W #$0068
    LDA.W #$000C
    JSL WriteAColorsFromYtoColorIndexX
    PHY
    LDX.W #$00A6
    LDA.W #$000C
    JSL WriteAColorsFromYtoColorIndexX
    PLY
    LDX.W #$00E6
    LDA.W #$000C
    JSL WriteAColorsFromYtoColorIndexX
    RTS


;;; $D046: Room palette instruction list - first phase ended ;;;
InstList_RoomPalette_FirstPhaseEnded:
    dw $0002,RoomPalettes_Phase1Ended_0
    dw $0002,RoomPalettes_Phase1Ended_1
    dw $0002,RoomPalettes_Phase1Ended_2
    dw $0002,RoomPalettes_Phase1Ended_3
    dw $0002,RoomPalettes_Phase1Ended_0
    dw $0002,RoomPalettes_Phase1Ended_1
    dw $0002,RoomPalettes_Phase1Ended_0
    dw $0002,RoomPalettes_Phase1Ended_3
    dw $0002,RoomPalettes_Phase1Ended_1
    dw $0002,RoomPalettes_Phase1Ended_0
    dw $0002,RoomPalettes_Phase1Ended_3
    dw $0002,RoomPalettes_Phase1Ended_2
    dw $0002,RoomPalettes_Phase1Ended_0
    dw $0002,RoomPalettes_Phase1Ended_2
    dw Instruction_MotherBrain_GotoX
    dw InstList_RoomPalette_FirstPhaseEnded


;;; $D082: Room palettes - first phase ended ;;;
; Line 0: Room background (BG1/2 palette 3 colours 4..Fh)
; Line 1: Room level graphics (BG1/2 palette 5/7 colours 3..Eh)
RoomPalettes_Phase1Ended_0:
    dw $4A16,$3991,$2D2C,$1CA7,$20E5,$18A4,$1083,$0841,$0000,$0000,$02DF,$0000
    dw $0802,$5294,$39CE,$2108,$1084,$0019,$0012,$5C00,$4000,$1084,$197F,$7FFF

RoomPalettes_Phase1Ended_1:
    dw $4EB9,$4656,$3E12,$31CF,$35EE,$2DCD,$29AC,$258B,$1D4A,$1D4A,$1F3F,$1D4A
    dw $254C,$3DEF,$2D6B,$18C6,$0C63,$0013,$000E,$4400,$3000,$0C63,$1517,$5EF7

RoomPalettes_Phase1Ended_2:
    dw $575C,$4F3A,$4B19,$46D7,$46F6,$46D6,$42D6,$3EB5,$3EB5,$3EB5,$3F9F,$3EB5
    dw $3EB5,$294A,$1CE7,$1084,$0842,$000D,$0009,$3000,$2000,$0842,$0CD0,$4210

RoomPalettes_Phase1Ended_3:
    dw $5BFF,$5BFF,$5BFF,$5BFF,$5BFF,$5BFF,$5BFF,$5BFF,$5BFF,$5BFF,$5BFF,$5BFF
    dw $5BFF,$14A5,$1084,$0842,$0421,$0006,$0005,$1800,$1000,$0421,$0868,$2108


;;; $D142: Unused. Set invalid room palette instruction list ;;;
UNSUED_SetInvalidRoomPaletteInstructionList_A9D142:
    LDA.W #MotherBrainPalettes_TransitionToGrey : STA.L MotherBrainBody.roomPaletteInstListPointer
    LDA.W #$0001 : STA.L MotherBrainBody.roomPaletteInstructionTimer
    RTS


;;; $D151: Unused. Set invalid room palette instruction list ;;;
UNSUED_SetInvalidRoomPaletteInstructionList_A9D151:
    LDA.W #MotherBrainPalettes_TransitionFromGrey : STA.L MotherBrainBody.roomPaletteInstListPointer
    LDA.W #$0001 : STA.L MotherBrainBody.roomPaletteInstructionTimer
    RTS


if !FEATURE_KEEP_UNREFERENCED
;;; $D160: Unused. Handle Mother Brain's palette ;;;
UNUSED_HandleMotherBrainsPalette_A9D160:
    LDA.W #MotherBrainBody.roomPaletteInstListPointer
    JSR HandleRoomPaletteInstList
    BCC .return
    PHY
    LDX.W #$0082
    LDA.W #$000D
    JSL WriteAColorsFromYtoColorIndexX
    PLY
    LDX.W #$0122
    LDA.W #$000D
    JSL WriteAColorsFromYtoColorIndexX
    LDX.W #$0168
    LDA.W #$0005
    JSL WriteAColorsFromYtoColorIndexX
    LDX.W #$017C
    LDA.W $0000,Y : STA.W $0000,X

  .return:
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $D192: Handle room palette instruction list ;;;
HandleRoomPaletteInstList:
;; Parameter:
;;     A: MotherBrainBody.roomPaletteInstListPointer. Mother Brain's room palette instruction list pointer
;; Returns:
;;     Carry: Set if palette data should be updated
;;     Y: If carry set. Pointer to room palette data. 18h bytes for background, 18h bytes for level graphics
    STA.B DP_Temp00
    INC #2 : STA.B DP_Temp03
    SEP #$20
    LDA.B #$7E : STA.B DP_Temp02 : STA.B DP_Temp05
    REP #$20
    LDA.B [DP_Temp00] : BMI .pointer
    CLC
    RTS

  .pointer:
    TAX
    LDA.W $0000,X : BMI .instruction
    CMP.B [DP_Temp03] : BNE .tick
    INX #4

  .loop:
    LDA.W $0000,X : BEQ .terminator
    BPL .specialInstruction

  .instruction:
    STA.B DP_Temp06
    INX #2
    PEA .loop-1
    JMP.W (DP_Temp06)

  .specialInstruction:
    LDA.W #$0001 : STA.B [DP_Temp03]
    TXA : STA.B [DP_Temp00]
    LDY.W $0002,X
    SEC
    RTS

  .tick:
    LDA.B [DP_Temp03] : INC : STA.B [DP_Temp03]
    LDY.W $0002,X
    SEC
    RTS

  .terminator:
    STA.B [DP_Temp00] : STA.B [DP_Temp03]
    CLC
    RTS


;;; $D1E4: Handle Mother Brain's palette ;;;
HandleMotherBrainsPalette:
    LDA.L MotherBrainBody.enableBrainPaletteHandlingFlag : BEQ .disabled
    JSR HandleMotherBrainHeadPalette

  .disabled:
    LDA.L MotherBrainBody.enableHealthBasedPaletteHandlingFlag : BEQ .return
    JSL MotherBrainHealthBasedPaletteHandling

  .return:
    RTS


;;; $D1F8: Set up Mother Brain brain normal palette ;;;
SetupMotherBrainHeadNormalPalette:
; Mother Brain brain palette timer reset value = Ah
; Mother Brain brain palette set = 0
    LDA.W #$000A : STA.W MotherBrainBody.brainPaletteTimerResetValue
    RTS


;;; $D1FF: Set up Mother Brain brain palette for charging her laser ;;;
SetupMotherBrainHeadPaletteForChargingHerLaser:
; Mother Brain brain palette timer reset value = 2
; Mother Brain brain palette set = 2
    LDA.W #$0202 : STA.W MotherBrainBody.brainPaletteTimerResetValue
    RTS


;;; $D206: Handle Mother Brain brain palette ;;;
HandleMotherBrainHeadPalette:
    LDA.L MotherBrainBody.form : DEC : BEQ .return
    SEP #$20
    LDA.W MotherBrainBody.brainPaletteTimer : BEQ .zero
    DEC : STA.W MotherBrainBody.brainPaletteTimer

  .return:
    REP #$20
    RTS

  .zero:
    XBA ; >.<
    LDA.W MotherBrainBody.brainPaletteSet : TAX
    LDY.W .pointers,X : STY.B DP_Temp12
    LDA.W MotherBrainBody.brainPaletteTimerResetValue : STA.W MotherBrainBody.brainPaletteTimer
    LDA.W MotherBrainBody.brainPaletteCounter : BNE .zeroCounter
    LDY.W MotherBrainBody.brainFunction : CPY.W #Function_MotherBrain_SetupBrainAndNeckToBeDrawn : BNE .return

  .zeroCounter:
    INC : AND.B #$07 : STA.W MotherBrainBody.brainPaletteCounter
    REP #$20
    AND.W #$00FF : ASL #3 : ADC.B DP_Temp12 : TAY
    LDX.W #$0122
    LDA.L MotherBrainBody.brainPalleteIndex : CMP.W #$0200 : BEQ +
    LDX.W #$01E2

+   LDA.W #$0003
    JSL WriteAColorsFromYtoColorIndexX
    RTS

  .pointers:
    dw .normalPaletteSet
    dw .chargingLaserPaletteSet

  .normalPaletteSet:
; Normal palette set
    dw $2EDF,$019B,$008E, $0006
    dw $269F,$0159,$004C, $0004
    dw $1E5D,$0117,$000A, $0002
    dw $161B,$00D5,$0008, $0000
    dw $161B,$00D5,$0008, $0000
    dw $1E5D,$0117,$000A, $0002
    dw $269F,$0159,$004C, $0004
    dw $2EDF,$019B,$008E, $0006

  .chargingLaserPaletteSet:
; Charging her laser palette set
    dw $269F,$0159,$004C, $0004
    dw $229F,$0179,$008E, $0067
    dw $1A9F,$01BA,$00F1, $00CB
    dw $16BF,$01FB,$0153, $012E
    dw $16BF,$01FB,$0153, $012E
    dw $1A9F,$01BA,$00F1, $00CB
    dw $229F,$0179,$008E, $0067
    dw $269F,$0159,$004C, $0004


;;; $D2E4: Write [A] colours from [DB]:[Y] to colour index [X] ;;;
WriteAColorsFromYtoColorIndexX:
    STA.B DP_Temp12

  .loop:
    LDA.W $0000,Y : STA.L Palettes,X
    INX #2
    INY #2
    DEC.B DP_Temp12 : BNE .loop
    RTL


;;; $D2F6: Write [A] colours from [DB]:[Y] to target colour index [X] ;;;
WriteAColorsFromYToTargetColorIndexX:
    STA.B DP_Temp12

  .loop:
    LDA.W $0000,Y : STA.L TargetPalettes_BGP0,X
    INX #2
    INY #2
    DEC.B DP_Temp12 : BNE .loop
    RTL


;;; $D308: Initialisation AI - enemy $ED3F (torizo corpse) ;;;
InitAI_CorpseTorizo:
    PHB
    PEA $7E7E : PLB : PLB
    LDA.W #$0000
    LDX.W #$0FFE

  .loop:
    STA.W EnemyBG2Tilemap,X
    DEX #2 : BPL .loop
    PLB
    LDA.W #Function_CorpseTorizo_WaitForSamusCollision : STA.W CorpseTorizo.function
    LDA.W Enemy.properties : ORA.W #$A000 : STA.W Enemy.properties
    LDA.W #InstList_CorpseTorizo : STA.W Enemy.instList
    LDA.W #$0001 : STA.W Enemy.instTimer
    STZ.W Enemy.loopCounter
    LDA.W #$0200 : STA.W Enemy.palette
    STZ.W CorpseTorizo.XVelocity
    LDA.W #$0008 : STA.W CorpseTorizo.YVelocity
    LDA.W #$0000 : STA.L CorpseTorizo.preRotDelayTimer
    LDA.W #$000F : STA.L CorpseTorizo.sandHeapYPixelRowToCopy
    LDA.W #$0000 : STA.L CorpseTorizo.sandHeapFormationTimer
    LDX.W #$0000
    LDY.W #CorpseRottingDefinitions_Torizo
    JSR InitializeEnemyCorpseRotting
    RTL


;;; $D368: Main AI - enemy $ED3F (torizo corpse) ;;;
MainAI_CorpseTorizo:
    LDA.W Enemy.properties : AND.W #$0400 : BNE .noCollision
    JSR CorpseTorizo_vs_Samus_CollisionDetection
    BCC .noCollision
    LDA.W Enemy.properties : ORA.W #$0400 : STA.W Enemy.properties
    LDA.W #Function_CorpseTorizo_Rotting : STA.W CorpseTorizo.function

  .noCollision:
    LDA.W #EnemyGraphicsDrawnHook_CorpseTorizo>>8&$FF00 : STA.W EnemyGraphicsDrawnHook+1
    LDA.W #EnemyGraphicsDrawnHook_CorpseTorizo : STA.W EnemyGraphicsDrawnHook
    LDX.W #$0000
    JSR.W (CorpseTorizo.function,X)
    JSR ProcessCorpseTorizoRottingVRAMTransfers
    RTL


;;; $D39A: Enemy graphics drawn hook - torizo corpse ;;;
EnemyGraphicsDrawnHook_CorpseTorizo:
    STZ.B DP_Temp16
    LDA.W #$0128 : STA.B DP_Temp12
    LDA.W #$00BB : STA.B DP_Temp14
    LDY.W #Spritemaps_CorpseTorizo_SandHeap
    JSR AddSpritemapToOAM_RoomCoordinates
    RTL


;;; $D3AD: Torizo corpse function - wait for Samus collision ;;;
Function_CorpseTorizo_WaitForSamusCollision:
    CPX.W EnemyIndexSamusCollidesLeft : BEQ .collision
    CPX.W EnemyIndexSamusCollidesRight : BEQ .collision
    CPX.W EnemyIndexSamusCollidesUp : BEQ .collision
    CPX.W EnemyIndexSamusCollidesDown : BNE .return

  .collision:
    LDA.W #Function_CorpseTorizo_PreRotDelay : STA.W CorpseTorizo.function

  .return:
    RTS


;;; $D3C8: Torizo corpse function - pre-rot delay ;;;
Function_CorpseTorizo_PreRotDelay:
    LDA.L CorpseTorizo.preRotDelayTimer : INC : STA.L CorpseTorizo.preRotDelayTimer
    CMP.W #$0010 : BCS .done
    RTS

  .done:
    LDA.W Enemy.properties : ORA.W #$0400 : STA.W Enemy.properties
    LDA.W #Function_CorpseTorizo_Rotting : STA.W CorpseTorizo.function
; fallthrough to Function_CorpseTorizo_Rotting


;;; $D3E6: Torizo corpse function - rotting ;;;
Function_CorpseTorizo_Rotting:
    LDA.L CorpseTorizo.sandHeapFormationTimer : INC : STA.L CorpseTorizo.sandHeapFormationTimer
    CMP.W #$000F : BCC .sandHeapFormed
    LDA.W #$0000 : STA.L CorpseTorizo.sandHeapFormationTimer
    LDA.L CorpseTorizo.sandHeapYPixelRowToCopy : BEQ .sandHeapFormed
    JSR CopyLineOfSandHeapTileData
    LDA.L CorpseTorizo.sandHeapYPixelRowToCopy : DEC : STA.L CorpseTorizo.sandHeapYPixelRowToCopy

  .sandHeapFormed:
    LDA.W CorpseTorizo.YVelocity : CLC : ADC.W #$0001 : STA.W CorpseTorizo.YVelocity
    LDX.W #$0000
    JSL MoveEnemyAccordingToVelocity
    JSR ProcessCorpseRotting
    BCS .return
    LDA.W #Function_CorpseTorizo_WaitForSamusCollision_return : STA.W CorpseTorizo.function

  .return:
    RTS


;;; $D42A: Power bomb reaction - enemy $ED3F (torizo corpse) ;;;
PowerBombReaction_CorpseTorizo:
    LDA.W Enemy.properties : AND.W #$0400 : BEQ EnemyTouch_EnemyShot_CorpseTorizo
    RTL


;;; $D433: Enemy touch / enemy shot - enemy $ED3F (torizo corpse) ;;;
EnemyTouch_EnemyShot_CorpseTorizo:
    LDA.W Enemy.properties : ORA.W #$0400 : STA.W Enemy.properties
    LDA.W #Function_CorpseTorizo_Rotting : STA.W CorpseTorizo.function
    RTL


;;; $D443: Torizo corpse / Samus collision detection ;;;
CorpseTorizo_vs_Samus_CollisionDetection:
;; Returns:
;;     Carry: Set if collision, otherwise clear
    LDA.W Enemy.XPosition : STA.B DP_Temp12
    LDA.W Enemy.YPosition : STA.B DP_Temp14
    LDX.W #HitboxDefinition_CorpseTorizo
    LDA.W $0000,X : BEQ .returnNoCollision
    STA.B DP_Temp16
    INX #2

  .loop:
    LDA.W SamusYPosition : SEC : SBC.B DP_Temp14 : BPL .SamusBelow
    EOR.W #$FFFF : INC : STA.B DP_Temp18
    LDA.W $0002,X
    BRA .checkY

  .SamusBelow:
    STA.B DP_Temp18
    LDA.W $0006,X

  .checkY:
    BPL +
    EOR.W #$FFFF : INC

+   CLC : ADC.W SamusYRadius
    SEC : SBC.B DP_Temp18 : BMI .next
    LDA.W SamusXPosition : SEC : SBC.B DP_Temp12 : BPL .SamusToTheRight
    EOR.W #$FFFF : INC
    STA.B DP_Temp18
    LDA.W $0000,X
    BRA .checkX

  .SamusToTheRight:
    STA.B DP_Temp18
    LDA.W $0004,X

  .checkX:
    BPL +
    EOR.W #$FFFF : INC

+   CLC : ADC.W SamusXRadius
    SEC : SBC.B DP_Temp18 : BPL .collision

  .next:
    DEC.B DP_Temp16 : BEQ .returnNoCollision
    TXA : CLC : ADC.W #$0008 : TAX
    JMP .loop

  .returnNoCollision:
    CLC
    RTS

  .collision:
    CMP.W #$0004 : BPL .min4
    LDA.W #$0004

  .min4:
    STA.W ExtraSamusXDisplacement
    LDA.W #$0004 : STA.W ExtraSamusYDisplacement
    STZ.W ExtraSamusXSubDisplacement : STZ.W ExtraSamusYSubDisplacement
    SEC
    RTS


;;; $D4CF: Process torizo corpse corpse rotting VRAM transfers ;;;
ProcessCorpseTorizoRottingVRAMTransfers:
    LDA.L MotherBrainBody.form : INC : STA.L MotherBrainBody.form
    LSR : BCS .odd
    LDX.W #$0000
    LDY.W VRAMWriteStack
    LDA.W .size0,X

  .loopEven:
    STA.W VRAMWrite.size,Y ; >.<
    LDA.W .bank0,X : STA.W VRAMWrite.src+1,Y ; >.<
    LDA.W .src0,X : STA.W VRAMWrite.src,Y ; >.<
    LDA.W .dest0,X : STA.W VRAMWrite.dest,Y ; >.<
    TYA : CLC : ADC.W #$0007 : TAY
    TXA : ADC.W #$0008 : TAX
    LDA.W .size0,X : BNE .loopEven
    STA.L MotherBrainBody.spriteTilesTransferEntryPointer
    TYA : STA.W VRAMWriteStack
    RTS

  .odd:
    LDX.W #$0000
    LDY.W VRAMWriteStack
    LDA.W .size1,X

  .loopOdd:
    STA.W VRAMWrite.size,Y ; >.<
    LDA.W .bank1,X : STA.W VRAMWrite.src+1,Y ; >.<
    LDA.W .src1,X : STA.W VRAMWrite.src,Y ; >.<
    LDA.W .dest1,X : STA.W VRAMWrite.dest,Y ; >.<
    TYA : CLC : ADC.W #$0007 : TAY
    TXA : ADC.W #$0008 : TAX
    LDA.W .size1,X : BNE .loopOdd
    STA.L MotherBrainBody.spriteTilesTransferEntryPointer
    TYA : STA.W VRAMWriteStack
    RTS

; Corpse rotting VRAM transfers
;                        __________________ Size
;                       |     _____________ Source bank * 100h
;                       |    |     ________ Source address
;                       |    |    |     ___ VRAM address
;                       |    |    |    |
  .size0:
    dw $00C0
  .bank0:
    dw       $7E00
  .src0:
    dw             $2060
  .dest0:
    dw                   $7090
    dw $00C0,$7E00,$21A0,$7190
    dw $0100,$7E00,$22C0,$7280
    dw $0100,$7E00,$2400,$7380
    dw $0100,$7E00,$2540,$7480
    dw $0100,$7E00,$2680,$7580
    dw $0120,$7E00,$9620,$7100
    dw $0000

  .size1:
    dw $0100
  .bank1:
    dw       $7E00
  .src1:
    dw             $27C0
  .dest1:
    dw                   $7680
    dw $0100,$7E00,$2900,$7780
    dw $0100,$7E00,$2A40,$7880
    dw $0120,$7E00,$2B60,$7970
    dw $0140,$7E00,$2C80,$7A60
    dw $0140,$7E00,$2DC0,$7B60
    dw $0100,$7E00,$9500,$7000
    dw $0000


;;; $D5BD: Corpse rotting rot entry finished hook - torizo corpse ;;;
CorpseRottingRotEntryFinishedHook_CorpseTorizo:
    PHX
    LDA.W RandomNumberSeed : AND.W #$001F : CLC : ADC.W #$0110 : STA.B DP_Temp12
    LDA.W #$00BC : STA.B DP_Temp14
    LDA.W #$000A
    LDY.W #EnemyProjectile_MiscDust
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    LDA.W NumberOfTimesMainEnemyRoutineExecuted : AND.W #$0007 : BNE .return
    LDA.W #$0010
    JSL QueueSound_Lib2_Max6

  .return:
    PLX
    RTS


;;; $D5EA: Copy line of sand heap tile data ;;;
CopyLineOfSandHeapTileData:
;; Parameters:
;;     A: Y pixel row to copy

; Tile data calculations:
;     Tiles are 20h bytes
;     Each sand heap graphics row is 9 tiles = 120h bytes
;
;     Pixel (x, y) of tile at pointer p is:
;           ([p + y * 2]       >> 7 - x & 1)
;         | ([p + y * 2 + 1]   >> 7 - x & 1) << 1
;         | ([p + y * 2 + 10h] >> 7 - x & 1) << 2
;         | ([p + y * 2 + 11h] >> 7 - x & 1) << 3
;
;     Hence, pixel row y of tile at pointer p is the bytes
;         [p + y * 2], [p + y * 2 + 1], [p + y * 2 + 10h], [p + y * 2 + 11h]
    ASL : PHA
    TAX
    LDA.W .destOffsets,X : TAY
    PLX
    LDA.W .srcOffsets,X : TAX
    PHB
    PEA $7E7E : PLB : PLB
    LDA.L Tiles_CorpseTorizo,X : STA.W TorizoCorpseRottingGFX,Y
    LDA.L Tiles_CorpseTorizo+$10,X : STA.W TorizoCorpseRottingGFX+$10,Y
    LDA.L Tiles_CorpseTorizo+$20,X : STA.W TorizoCorpseRottingGFX+$20,Y
    LDA.L Tiles_CorpseTorizo+$30,X : STA.W TorizoCorpseRottingGFX+$30,Y
    LDA.L Tiles_CorpseTorizo+$40,X : STA.W TorizoCorpseRottingGFX+$40,Y
    LDA.L Tiles_CorpseTorizo+$50,X : STA.W TorizoCorpseRottingGFX+$50,Y
    LDA.L Tiles_CorpseTorizo+$60,X : STA.W TorizoCorpseRottingGFX+$60,Y
    LDA.L Tiles_CorpseTorizo+$70,X : STA.W TorizoCorpseRottingGFX+$70,Y
    LDA.L Tiles_CorpseTorizo+$80,X : STA.W TorizoCorpseRottingGFX+$80,Y
    LDA.L Tiles_CorpseTorizo+$90,X : STA.W TorizoCorpseRottingGFX+$90,Y
    LDA.L Tiles_CorpseTorizo+$A0,X : STA.W TorizoCorpseRottingGFX+$A0,Y
    LDA.L Tiles_CorpseTorizo+$B0,X : STA.W TorizoCorpseRottingGFX+$B0,Y
    LDA.L Tiles_CorpseTorizo+$C0,X : STA.W TorizoCorpseRottingGFX+$C0,Y
    LDA.L Tiles_CorpseTorizo+$D0,X : STA.W TorizoCorpseRottingGFX+$D0,Y
    LDA.L Tiles_CorpseTorizo+$E0,X : STA.W TorizoCorpseRottingGFX+$E0,Y
    LDA.L Tiles_CorpseTorizo+$F0,X : STA.W TorizoCorpseRottingGFX+$F0,Y
    LDA.L Tiles_CorpseTorizo+$100,X : STA.W TorizoCorpseRottingGFX+$100,Y
    LDA.L Tiles_CorpseTorizo+$110,X : STA.W TorizoCorpseRottingGFX+$110,Y
    PLB
    RTS

  .destOffsets:
    dw $0000,$0002,$0004,$0006,$0008,$000A,$000C,$000E
    dw $0120,$0122,$0124,$0126,$0128,$012A,$012C,$012E

  .srcOffsets:
    dw $0000,$0002,$0004,$0006,$0008,$000A,$000C,$000E
    dw $0200,$0202,$0204,$0206,$0208,$020A,$020C,$020E


;;; $D6BC: Palette - enemy $ED3F (torizo corpse) ;;;
Palette_CorpseTorizo:
    dw $3800,$4F38,$3A52,$0CA5,$0042,$42D5,$2DEF,$218B
    dw $1528,$4F38,$42B4,$3631,$29CD,$1949,$0CC6,$0042


;;; $D6DC: Instruction list - torizo corpse ;;;
InstList_CorpseTorizo:
    dw $0001,Spritemaps_CorpseTorizo
    dw Instruction_Common_Sleep


;;; $D6E2: Torizo corpse spritemaps ;;;
Spritemaps_CorpseTorizo:
    dw $0019
    %spritemapEntry(0, $1E8, $14, 0, 0, 2, 1, $197)
    %spritemapEntry(1, $4218, $CC, 0, 0, 2, 1, $10D)
    %spritemapEntry(1, $4208, $CC, 0, 0, 2, 1, $10B)
    %spritemapEntry(1, $43F8, $CC, 0, 0, 2, 1, $109)
    %spritemapEntry(1, $4220, $DC, 0, 0, 2, 1, $12E)
    %spritemapEntry(1, $4210, $DC, 0, 0, 2, 1, $12C)
    %spritemapEntry(1, $4200, $DC, 0, 0, 2, 1, $12A)
    %spritemapEntry(1, $43F0, $DC, 0, 0, 2, 1, $128)
    %spritemapEntry(1, $4220, $EC, 0, 0, 2, 1, $14E)
    %spritemapEntry(1, $4210, $EC, 0, 0, 2, 1, $14C)
    %spritemapEntry(1, $4200, $EC, 0, 0, 2, 1, $14A)
    %spritemapEntry(1, $43F0, $EC, 0, 0, 2, 1, $148)
    %spritemapEntry(1, $4220, $FC, 0, 0, 2, 1, $16E)
    %spritemapEntry(1, $4210, $FC, 0, 0, 2, 1, $16C)
    %spritemapEntry(1, $4200, $FC, 0, 0, 2, 1, $16A)
    %spritemapEntry(1, $43F0, $FC, 0, 0, 2, 1, $168)
    %spritemapEntry(1, $4220, $0C, 0, 0, 2, 1, $18E)
    %spritemapEntry(1, $4210, $0C, 0, 0, 2, 1, $18C)
    %spritemapEntry(1, $4200, $0C, 0, 0, 2, 1, $18A)
    %spritemapEntry(1, $43F0, $0C, 0, 0, 2, 1, $188)
    %spritemapEntry(1, $4220, $1C, 0, 0, 2, 1, $1AE)
    %spritemapEntry(1, $4210, $1C, 0, 0, 2, 1, $1AC)
    %spritemapEntry(1, $4200, $1C, 0, 0, 2, 1, $1AA)
    %spritemapEntry(1, $43F0, $1C, 0, 0, 2, 1, $1A8)
    %spritemapEntry(1, $43E0, $1C, 0, 0, 2, 1, $1A6)

Spritemaps_CorpseTorizo_SandHeap:
    dw $0005
    %spritemapEntry(0, $18, $FE, 0, 0, 2, 1, $118)
    %spritemapEntry(1, $4208, $F6, 0, 0, 2, 1, $106)
    %spritemapEntry(1, $43F8, $F6, 0, 0, 2, 1, $104)
    %spritemapEntry(1, $43E8, $F6, 0, 0, 2, 1, $102)
    %spritemapEntry(1, $43D8, $F6, 0, 0, 2, 1, $100)


;;; $D77C: Torizo corpse hitbox definition ;;;
HitboxDefinition_CorpseTorizo:
; [word] Number of entries
; [entries]
;
; Entry format:
;     [word] Left offset
;     [word] Top offset
;     [word] Right offset
;     [word] Bottom offset
    dw $0007
    dw $FFE1,$0025,$FFF5,$002B
    dw $0010,$0025,$0026,$002B
    dw $FFE8,$0012,$FFF3,$0024
    dw $000B,$001A,$0019,$0024
    dw $FFF6,$FFE2,$0010,$0018
    dw $FFF9,$FFD4,$0022,$FFE1
    dw $0011,$FFE1,$0028,$FFF9


;;; $D7B6: Initialisation AI - enemy $ED7F/$EDBF (sidehopper corpse) ;;;
InitAI_CorpseSidehopper:
    LDX.W EnemyIndex
    LDA.W Enemy.init0,X : TAX
    JMP.W (.pointers,X)

  .pointers:
    dw CorpseSidehopperInit_Param1_0_InitiallyAlive
    dw CorpseSidehopperInit_Param1_2_InitiallyDead


;;; $D7C4: Sidehopper corpse initialisation - enemy parameter 1 = 0 (initially alive) ;;;
CorpseSidehopperInit_Param1_0_InitiallyAlive:
; Palette 1 is loaded by Shitroid from Palette_CorpseSidehopper
    LDX.W EnemyIndex
    LDA.W Enemy.properties,X : AND.W #$7FFF : ORA.W #$0800 : STA.W Enemy.properties,X
    LDA.W Enemy.properties : AND.W #$0100 : BEQ .visible
    LDA.W Enemy.properties,X : ORA.W #$0200 : STA.W Enemy.properties,X

  .visible:
    LDA.W #$0000 : STA.L CorpseSidehopper.drainedPaletteIndex,X
    LDA.W #$0060 : STA.L CorpseSidehopper.XVelocity,X
    LDA.W #$0100 : STA.L CorpseSidehopper.YVelocity,X
    LDA.W #$01E8 : STA.W Enemy.XPosition,X
    LDA.W #$00B8 : STA.W Enemy.YPosition,X
    LDA.W #Function_CorpseSidehopper_Alive_WaitingForActivation : STA.W CorpseSidehopper.function,X
    LDA.W #$0200 : STA.W Enemy.palette,X
    LDA.W #$0015 : STA.W Enemy.YHitboxRadius,X
    LDA.W #InstList_CorpseSidehopper_Alive_Idle
    JSL SetEnemyInstList
    LDY.W #CorpseRottingDefinitions_Sidehopper_Param1_0
    JSR InitializeEnemyCorpseRotting
    RTL


;;; $D825: Sidehopper corpse initialisation - enemy parameter 1 = 2 (initially dead) ;;;
CorpseSidehopperInit_Param1_2_InitiallyDead:
; Palette 7 is loaded by Shitroid from Palette_CorpseCommon
    LDX.W EnemyIndex
    LDA.W #$FFFF : STA.L CorpseSidehopper.drainedPaletteIndex,X
    LDA.W #Function_CorpseSidehopper_Dead_WaitForSamusCollision : STA.W CorpseSidehopper.function,X
    LDA.W #$0E00 : STA.W Enemy.palette,X
    LDA.W #InstList_CorpseSidehopper_Alive_Dead
    JSL SetEnemyInstList
    LDY.W #CorpseRottingDefinitions_Sidehopper_Param1_2
    JSR InitializeEnemyCorpseRotting
    RTL


;;; $D849: Initialisation AI - enemy $EDFF (zoomer corpse) ;;;
InitAI_CorpseZoomer:
    LDX.W EnemyIndex
    LDA.W #$0E00 : STA.W Enemy.palette,X
    LDA.W #Function_CorpseZoomer_WaitForSamusCollision : STA.W Corpse.function,X
    LDY.W Enemy.init0,X
    LDA.W .instListPointers,Y
    JSL SetEnemyInstList
    LDA.W .corpseRottingDefinitionPointers,Y : TAY
    JSR InitializeEnemyCorpseRotting
    RTL

  .instListPointers:
; Enemy instruction list pointers
    dw InstList_CorpseZoomer_Param1_0
    dw InstList_CorpseZoomer_Param1_2
    dw InstList_CorpseZoomer_Param1_4

  .corpseRottingDefinitionPointers:
; Corpse rotting definition pointers
    dw CorpseRottingDefinitions_Zoomer_Param1_0
    dw CorpseRottingDefinitions_Zoomer_Param1_2
    dw CorpseRottingDefinitions_Zoomer_Param1_4


;;; $D876: Initialisation AI - enemy $EE3F (ripper corpse) ;;;
InitAI_CorpseRipper:
    LDX.W EnemyIndex
    LDA.W #$0E00 : STA.W Enemy.palette,X
    LDA.W #Function_CorpseRipper_WaitForSamusCollision : STA.W Corpse.function,X
    LDY.W Enemy.init0,X
    LDA.W .instListPointers,Y
    JSL SetEnemyInstList
    LDA.W .corpseRottingDefinitionPointers,Y : TAY
    JSR InitializeEnemyCorpseRotting
    RTL

  .instListPointers:
; Enemy instruction list pointers
    dw InstList_CorpseRipper_Param1_0
    dw InstList_CorpseRipper_Param1_2

  .corpseRottingDefinitionPointers:
; Corpse rotting definition pointers
    dw CorpseRottingDefinitions_Ripper_Param1_0
    dw CorpseRottingDefinitions_Ripper_Param1_2


;;; $D89F: Initialisation AI - enemy $EE7F (skree corpse) ;;;
InitAI_CorpseSkree:
    LDX.W EnemyIndex
    LDA.W #$0E00 : STA.W Enemy.palette,X
    LDA.W #Function_CorpseSkree_WaitForSamusCollision : STA.W Corpse.function,X
    LDY.W Enemy.init0,X
    LDA.W .instListPointers,Y
    JSL SetEnemyInstList
    LDA.W .corpseRottingDefinitionPointers,Y : TAY
    JSR InitializeEnemyCorpseRotting
    RTL

  .instListPointers:
; Enemy instruction list pointers
    dw InstList_CorpseSkree_Param1_0
    dw InstList_CorpseSkree_Param1_2
    dw InstList_CorpseSkree_Param1_4

  .corpseRottingDefinitionPointers:
; Corpse rotting definition pointers
    dw CorpseRottingDefinitions_Skree_Param1_0
    dw CorpseRottingDefinitions_Skree_Param1_2
    dw CorpseRottingDefinitions_Skree_Param1_4


;;; $D8CC: Power bomb reaction - enemy $ED7F (sidehopper corpse) ;;;
PowerBombReaction_CorpseSidehopper:
    LDX.W EnemyIndex
    LDA.L CorpseSidehopper.drainedPaletteIndex,X : CMP.W #$0008 : BCC MainAI_HurtAI_CorpseEnemies
    JMP EnemyShot_CorpseSidehopper


;;; $D8DB: Main AI / hurt AI - enemy $ED7F/$EDBF/$EDFF/$EE3F/$EE7F (dead monsters) ;;;
MainAI_HurtAI_CorpseEnemies:
    LDX.W EnemyIndex
    JSR.W (Corpse.function,X)
    RTL


;;; $D8E2: Sidehopper corpse function - alive - waiting for activation ;;;
Function_CorpseSidehopper_Alive_WaitingForActivation:
    LDA.W Layer1XPosition : CMP.W #$0201 : BMI .activate
    RTS

  .activate:
    LDA.W #Function_CorpseSidehopper_Hopping : STA.W CorpseSidehopper.function,X
; fallthrough to Function_CorpseSidehopper_Hopping


;;; $D8F1: Sidehopper corpse function - hopping ;;;
Function_CorpseSidehopper_Hopping:
    JSR CorpseSidehopperMovement
    BCC .return
    LDA.L CorpseSidehopper.hopIndex,X : INC : AND.W #$0003 : STA.L CorpseSidehopper.hopIndex,X
    LDA.W #InstList_CorpseSidehopper_Alive_Hopping
    JSL SetEnemyInstList
    LDA.W #.return : STA.W CorpseSidehopper.function,X

  .return:
    RTS


;;; $D910: Sidehopper corpse function - start idling ;;;
Function_CorpseSidehopper_StartIdling:
    LDA.W #Function_CorpseSidehopper_Idling : STA.W CorpseSidehopper.function,X
    LDA.W #$0040 : STA.W CorpseSidehopper.functionTimer,X
    RTS


;;; $D91D: Sidehopper corpse function - idling ;;;
Function_CorpseSidehopper_Idling:
    DEC.W CorpseSidehopper.functionTimer,X : BPL .return
    LDA.L CorpseSidehopper.drainedPaletteIndex,X : BEQ .notDone
    LDA.W #Function_CorpseSidehopper_BeingDrained : STA.W CorpseSidehopper.function,X
    RTS

  .notDone:
    LDA.W #Function_CorpseSidehopper_Hopping : STA.W CorpseSidehopper.function,X
    LDA.W #InstList_CorpseSidehopper_Alive_Idle
    JSL SetEnemyInstList
    LDA.L CorpseSidehopper.hopIndex,X : ASL : TAY
    LDA.W .YVelocity,Y : STA.L CorpseSidehopper.YVelocity,X
    LDA.W .XVelocity,Y : STA.L CorpseSidehopper.XVelocity,X

  .return:
    RTS

; Hop initial velocities
  .YVelocity:
    dw $FE00,$FE00,$FE00,$FC00
  .XVelocity:
    dw $01C0,$0120,$0120,$0300


;;; $D961: Sidehopper corpse movement ;;;
CorpseSidehopperMovement:
;; Returns:
;;     Carry: Set if collision, clear otherwise
    LDA.L CorpseSidehopper.XVelocity,X
    JSR CorpseSidehopperMovement_Horizontal
    LDY.W #$0020
    LDA.L CorpseSidehopper.YVelocity,X : BMI .rising
    LDY.W #$0080

  .rising:
    TYA : CLC : ADC.L CorpseSidehopper.YVelocity,X : STA.L CorpseSidehopper.YVelocity,X : STA.B DP_Temp12
    LDA.W Enemy.XPosition,X : CMP.W #$0220 : BMI .lessThan220
    LDA.B DP_Temp12
    SEP #$20
    STA.B DP_Temp13
    STZ.B DP_Temp12
    REP #$20
    AND.W #$FF00 : BPL +
    ORA.W #$00FF

+   XBA : STA.B DP_Temp14
    JSL MoveEnemyDownBy_14_12
    RTS

  .lessThan220:
    LDA.B DP_Temp12
    SEP #$20
    CLC : ADC.W Enemy.YSubPosition+1,X : STA.W Enemy.YSubPosition+1,X
    REP #$20
    AND.W #$FF00 : XBA : BPL +
    ORA.W #$FF00

+   ADC.W Enemy.YPosition,X : STA.W Enemy.YPosition,X
    CMP.W #$00B8 : BMI .lessThanB8
    SEC
    RTS

  .lessThanB8:
    CLC
    RTS


;;; $D9C7: Sidehopper corpse horizontal movement ;;;
CorpseSidehopperMovement_Horizontal:
;; Parameters:
;;     A: Distance to move (signed)
    STA.B DP_Temp12
    LDA.W Enemy.XPosition,X : CMP.W #$0220 : BMI .lessThan220
    LDA.B DP_Temp12
    SEP #$20
    STA.B DP_Temp13
    STZ.B DP_Temp12
    REP #$20
    AND.W #$FF00 : BPL +
    ORA.W #$00FF

+   XBA : STA.B DP_Temp14
    JSL MoveEnemyRightBy_14_12_IgnoreSlopes
    RTS

  .lessThan220:
    LDA.B DP_Temp12
    SEP #$20
    CLC : ADC.W Enemy.XSubPosition+1,X : STA.W Enemy.XSubPosition+1,X
    REP #$20
    AND.W #$FF00 : XBA : BPL +
    ORA.W #$FF00

+   ADC.W Enemy.XPosition,X : STA.W Enemy.XPosition,X
    RTS


;;; $DA08: Sidehopper corpse function - being drained ;;;
Function_CorpseSidehopper_BeingDrained:
    LDA.L CorpseSidehopper.drainedPaletteTimer,X : INC : STA.L CorpseSidehopper.drainedPaletteTimer,X
    CMP.W #$0008 : BCC .return
    LDA.W #$0000 : STA.L CorpseSidehopper.drainedPaletteTimer,X
    LDA.L CorpseSidehopper.drainedPaletteIndex,X : DEC : ASL #5
    ADC.W #Palette_SidehopperCorpseBeingDrained_0 : TAY
    LDX.W #$0122
    LDA.W #$000F
    JSL WriteAColorsFromYtoColorIndexX
    LDX.W EnemyIndex
    LDA.L CorpseSidehopper.drainedPaletteIndex,X : INC : STA.L CorpseSidehopper.drainedPaletteIndex,X
    CMP.W #$0008 : BCC .return
    LDA.W #InstList_CorpseSidehopper_Alive_Corpse
    JSL SetEnemyInstList
    LDA.W #Function_CorpseSidehopper_Dead_WaitForSamusCollision : STA.W CorpseSidehopper.function,X
    LDA.W Enemy.properties,X : ORA.W #$8000 : STA.W Enemy.properties,X
    LDA.W #$000C : STA.W Enemy.YHitboxRadius,X

  .return:
    RTS


;;; $DA63: RTS ;;;
RTS_A9DA63:
    RTS


;;; $DA64: Sidehopper corpse function - dead - wait for Samus collision ;;;
Function_CorpseSidehopper_Dead_WaitForSamusCollision:
    LDY.W #Function_CorpseSidehopper_PreRotDelay
    BRA CorpseCommonAI_WaitForSamusCollision


;;; $DA69: Zoomer corpse function - wait for Samus collision ;;;
Function_CorpseZoomer_WaitForSamusCollision:
    LDY.W #Function_CorpseZoomer_PreRotDelay
    BRA CorpseCommonAI_WaitForSamusCollision


;;; $DA6E: Skree corpse function - wait for Samus collision ;;;
Function_CorpseSkree_WaitForSamusCollision:
    LDY.W #Function_CorpseSkree_PreRotDelay
    BRA CorpseCommonAI_WaitForSamusCollision


;;; $DA73: Ripper corpse function - wait for Samus collision ;;;
Function_CorpseRipper_WaitForSamusCollision:
    LDY.W #Function_CorpseRipper_PreRotDelay
; fallthrough to CorpseCommonAI_WaitForSamusCollision


;;; $DA76: Dead monsters shared AI - wait for Samus collision ;;;
CorpseCommonAI_WaitForSamusCollision:
;; Parameters:
;;     Y: New enemy function if collision occurred
    CPX.W EnemyIndexSamusCollidesLeft : BEQ .collision
    CPX.W EnemyIndexSamusCollidesRight : BEQ .collision
    CPX.W EnemyIndexSamusCollidesUp : BEQ .collision
    CPX.W EnemyIndexSamusCollidesDown : BNE .return

  .collision:
    TYA : STA.W Corpse.function,X

  .return:
    RTS


;;; $DA8F: Sidehopper corpse function - pre-rot delay ;;;
Function_CorpseSidehopper_PreRotDelay:
    LDY.W #Function_CorpseSidehopper_Rotting
    BRA CorpseCommonAI_PreRotDelay


;;; $DA94: Zoomer corpse function - pre-rot delay ;;;
Function_CorpseZoomer_PreRotDelay:
    LDY.W #Function_CorpseZoomer_Rotting
    BRA CorpseCommonAI_PreRotDelay


;;; $DA99: Ripper corpse function - pre-rot delay ;;;
Function_CorpseRipper_PreRotDelay:
    LDY.W #Function_CorpseRipper_Rotting
    BRA CorpseCommonAI_PreRotDelay


;;; $DA9E: Skree corpse function - pre-rot delay ;;;
Function_CorpseSkree_PreRotDelay:
    LDY.W #Function_CorpseSkree_Rotting
; fallthrough to CorpseCommonAI_PreRotDelay


;;; $DAA1: Dead monsters shared AI - pre-rot delay ;;;
CorpseCommonAI_PreRotDelay:
;; Parameters:
;;     Y: Rotting enemy function
    INC.W Corpse.preRotDelayTimer,X
    LDA.W Corpse.preRotDelayTimer,X : CMP.W #$0010 : BCC .return
    TYA : STA.W Corpse.function,X
    LDA.W Enemy.properties,X : ORA.W #$0400 : STA.W Enemy.properties,X

  .return:
    RTS


;;; $DABA: Sidehopper corpse function - rotting ;;;
Function_CorpseSidehopper_Rotting:
; The LDA at $DAC2 looks like it was supposed to be for RTS_A9DA63, but since the sidehopper is intangible at this point, it doesn't really matter
    JSR ProcessCorpseRotting
    LDX.W EnemyIndex
    BCS .process
    LDA.W #Function_CorpseSidehopper_Dead_WaitForSamusCollision : STA.W CorpseSidehopper.function,X

  .process:
    LDA.L Corpse.VRAMTransfersPointer,X : TAX
    JMP ProcessCorpseRottingVRAMTransfers


;;; $DAD0: Zoomer corpse function - rotting ;;;
Function_CorpseZoomer_Rotting:
    JSR ProcessCorpseRotting
    LDX.W EnemyIndex
    BCS .process
    LDA.W #RTS_A9DA63 : STA.W Corpse.function,X

  .process:
    LDA.L Corpse.VRAMTransfersPointer,X : TAX
    JMP ProcessCorpseRottingVRAMTransfers


;;; $DAE6: Ripper corpse function - rotting ;;;
Function_CorpseRipper_Rotting:
    JSR ProcessCorpseRotting
    LDX.W EnemyIndex
    BCS .process
    LDA.W #RTS_A9DA63 : STA.W Corpse.function,X

  .process:
    LDA.L Corpse.VRAMTransfersPointer,X : TAX
    JMP ProcessCorpseRottingVRAMTransfers


;;; $DAFC: Skree corpse function - rotting ;;;
Function_CorpseSkree_Rotting:
    JSR ProcessCorpseRotting
    LDX.W EnemyIndex
    BCS .process
    LDA.W #RTS_A9DA63 : STA.W Corpse.function,X

  .process:
    LDA.L Corpse.VRAMTransfersPointer,X : TAX
    JMP ProcessCorpseRottingVRAMTransfers


;;; $DB12: Process corpse rotting ;;;
ProcessCorpseRotting:
; n_entries = Corpse.backupSpriteHeight
; for (i_entry = 0; i_entry < n_entries; ++i_entry):
; {
;     p_entries = Corpse.rotTablePointer
;     y = [[p_entries]]
;     t = [[p_entries] + 2]
;
;     If y < 0:
;         next
;
;     If t != 0:
;     {
;         Decrement t
;         If t >= 4:
;             next
;     }
;
;     Corpse.rotEntryYOffset = y
;     y_tile = y / 8
;     y_pixel = y % 8
;
;     X = [$A9:0000 + Corpse.backupTileDataRowOffsetsPointer + y_tile * 2] + y_pixel * 2 (tile data offset of pixel row y)
;     If y_pixel < 6:
;         Y = [X]
;     Else:
;         Y = [X] + (tile row size - Ch) (tile data offset of pixel row y - 6 of next tile row)
;
;     If t != 0:
;     {
;         If i_entry < (height - 2):
;             Execute Corpse.backupRotEntryCopyFunction (copy pixel row down)
;         Else:
;             Execute Corpse.backupRotEntryMoveFunction (move pixel row down)
;     }
;     Else:
;     {
;         Execute Corpse.backupRotEntryMoveFunction (move pixel row down)
;         If y + 2 < (height - 1):
;             y += 2
;         Else:
;         {
;             Execute Corpse.backupRotEntryFinishedHook (rot entry finished hook)
;             If i_entry >= (height - 1):
;                 Return carry clear (finished rotting)
;
;             y = -1
;         }
;     }
; }
;
; Return carry set
    PHB
    PEA $7E7E : PLB : PLB
    LDA.W Corpse.spriteHeight,X : STA.W Corpse.backupSpriteHeight
    LDA.W Corpse.spriteHeightMinus1,X : STA.W Corpse.backupSpriteHeightMinus1
    LDA.W Corpse.spriteHeightMinus2,X : STA.W Corpse.backupSpriteHeightMinus2
    LDA.W Corpse.interTileDataOffset,X : STA.W Corpse.backupInterTileDataOffset
    LDA.W Corpse.rotEntryFinishedHook,X : STA.W Corpse.backupRotEntryFinishedHook
    LDA.W Corpse.tileDataRowOffsetsPointer,X : STA.W Corpse.backupTileDataRowOffsetsPointer
    LDA.W Corpse.rotEntryCopyFunction,X : STA.W Corpse.backupRotEntryCopyFunction
    LDA.W Corpse.rotEntryMoveFunction,X : STA.W Corpse.backupRotEntryMoveFunction
    LDA.W Corpse.rotTablePointer,X : TAX
    LDA.W #$0000

  .loop:
    PHA
    LDA.W $0000,X : BMI .next
    LDA.W $0002,X : BEQ .timerExpired
    DEC : STA.W $0002,X
    CMP.W #$0004 : BCS .next
    LDA.W Corpse.backupRotEntryCopyFunction : STA.B DP_Temp12
    LDA.B $01,S : CMP.W Corpse.backupSpriteHeightMinus2 : BCC +
    LDA.W Corpse.backupRotEntryMoveFunction : STA.B DP_Temp12

+   LDA.W Corpse.backupTileDataRowOffsetsPointer : STA.B DP_Temp14
    LDA.W #$00A9 : STA.B DP_Temp16
    PHX
    LDA.W $0000,X
    JSR CopyMoveCorpseRottingRotEntry
    PLX
    BRA .next

  .timerExpired:
    PHX
    LDA.W Corpse.backupRotEntryMoveFunction : STA.B DP_Temp12
    LDA.W Corpse.backupTileDataRowOffsetsPointer : STA.B DP_Temp14
    LDA.W #$00A9 : STA.B DP_Temp16
    LDA.W $0000,X
    JSR CopyMoveCorpseRottingRotEntry
    PLX
    LDA.W $0000,X : CLC : ADC.W #$0002 : CMP.W Corpse.backupSpriteHeightMinus1 : BCC .store
    LDA.W Corpse.backupRotEntryFinishedHook : STA.B DP_Temp12
    PHK : PLB
    PEA .manualReturn-1
    JMP.W (DP_Temp12)

  .manualReturn:
    PEA $7E7E : PLB : PLB
    LDA.B $01,S : CMP.W Corpse.backupSpriteHeightMinus1 : BCS .returnFinishedRotting
    LDA.W #$FFFF

  .store:
    STA.W $0000,X

  .next:
    TXA : CLC : ADC.W #$0004 : TAX
    PLA : INC : CMP.W Corpse.backupSpriteHeight : BPL .returnNotFinished
    JMP .loop

  .returnNotFinished:
    PLB
    RTS

  .returnFinishedRotting:
    PLA : PLB
    CLC
    RTS


;;; $DBE0: Copy/move corpse rotting rot entry ;;;
CopyMoveCorpseRottingRotEntry:
;; Parameters:
;;     A: Corpse rotting rot entry Y offset
;;     $12: Corpse rotting rot entry copy/move function
;;     $14: Corpse rotting tile data row offsets pointer

; DB must be $7E
    STA.W Corpse.rotEntryYOffset
    TAY
    AND.W #$FFF8 : LSR #2 : TAX
    TYA : AND.W #$0007 : CMP.W #$0006 : BCS .greaterThan5
    TXY
    ASL : ADC.B [DP_Temp14],Y : TAX
    TAY
    JMP.W (DP_Temp12)

  .greaterThan5:
    TXY
    ASL : ADC.B [DP_Temp14],Y : TAX
    ADC.W Corpse.backupInterTileDataOffset : TAY
    JMP.W (DP_Temp12)


;;; $DC08: Corpse rotting rot entry finished hook - normal ;;;
CorpseRotEntryFinishedHook_Normal:
    PHX
    LDA.W RandomNumberSeed : AND.W #$001A
    LDX.W EnemyIndex
    CLC : ADC.W Enemy.XPosition,X
    CLC : ADC.W #$FFF2 : STA.B DP_Temp12
    LDA.W Enemy.YPosition,X : CLC : ADC.W #$0010 : STA.B DP_Temp14
    LDA.W #$000A
    LDY.W #EnemyProjectile_MiscDust
    JSL SpawnEnemyProjectileY_ParameterA_RoomGraphics
    LDA.W NumberOfTimesMainEnemyRoutineExecuted : AND.W #$0007 : BNE .return
    LDA.W #$0010
    JSL QueueSound_Lib2_Max3

  .return:
    PLX
    RTS


;;; $DC40: Initialise corpse rotting data table ;;;
InitializeCorpseRottingDataTable:
;; Parameters:
;;     A: Height
;;     X: Corpse rotting data table pointer

; Make table of decreasing Y offsets with increasing timers
    DEC
    STZ.B DP_Temp12

  .loop:
    PHA
    STA.L MotherBrainCorpseRottingGFX&$FF0000,X
    LDA.B DP_Temp12
    INX #2
    STA.L MotherBrainCorpseRottingGFX&$FF0000,X
    INX #2
    LDA.B DP_Temp12 : CLC : ADC.W #$0002 : STA.B DP_Temp12
    PLA : DEC : BPL .loop
    RTS


;;; $DC5F: Initialise enemy corpse rotting ;;;
InitializeEnemyCorpseRotting:
;; Parameters:
;;     X: Enemy index
;;     Y: Corpse rotting definition pointer
    LDA.W $0000,Y : STA.L MotherBrainBody.corpseRottingRotTablePointer,X
    LDA.W $0002,Y : STA.L MotherBrainBody.corpseRottingVRAMTransfersPointer,X
    LDA.W $0004,Y : STA.L MotherBrainBody.corpseRottingRotEntryCopyFunction,X
    LDA.W $0006,Y : STA.L MotherBrainBody.corpseRottingRotEntryMoveFunction,X
    LDA.W $000E,Y : STA.L MotherBrainBody.corpseRottingRotEntryFinishedHook,X
    LDA.W $000C,Y : STA.L MotherBrainBody.corpseRottingTileDataRowOffsetsPointer,X
    PHY
    TAY
    LDA.W $0002,Y : SEC : SBC.W #$000C : STA.L MotherBrainBody.corpseRottingInterTileDataOffset,X
    PLY
    LDA.W $0008,Y : STA.L MotherBrainBody.corpseRottingSpriteHeight,X
    DEC : STA.L MotherBrainBody.corpseRottingSpriteHeightMinus1,X
    DEC : STA.L MotherBrainBody.corpseRottingSpriteHeightMinus2,X
    LDX.W $0000,Y
    LDA.W $0008,Y
    JSR InitializeCorpseRottingDataTable
    LDA.W $000A,Y : STA.B DP_Temp12
    JMP.W (DP_Temp12)


;;; $DCB9: Process corpse rotting VRAM transfers ;;;
ProcessCorpseRottingVRAMTransfers:
;; Parameters:
;;     X: Corpse rotting VRAM transfers pointer. Format: size, source bank, source address, VRAM address (all 16 bit)
    LDY.W VRAMWriteStack
    LDA.W $0000,X

  .loop:
    STA.W VRAMWrite.size,Y ; >.<
    LDA.W $0002,X : STA.W VRAMWrite.src+1,Y ; >.<
    LDA.W $0004,X : STA.W VRAMWrite.src,Y ; >.<
    LDA.W $0006,X : STA.W VRAMWrite.dest,Y ; >.<
    TYA : CLC : ADC.W #$0007 : TAY
    TXA : ADC.W #$0008 : TAX
    LDA.W $0000,X : BNE .loop
    STA.L MotherBrainBody.spriteTilesTransferEntryPointer
    TYA : STA.W VRAMWriteStack
    RTS


;;; $DCED: Power bomb reaction - enemy $EDFF (zoomer corpse) ;;;
PowerBombReaction_CorpseZoomer:
    LDX.W EnemyIndex
    LDA.W Enemy.properties,X : AND.W #$0400 : BNE CorpseCommonContactReaction_return
; fallthrough to EnemyTouch_EnemyShot_CorpseZoomer


;;; $DCF8: Enemy touch / enemy shot - enemy $EDFF (zoomer corpse) ;;;
EnemyTouch_EnemyShot_CorpseZoomer:
    LDA.W #Function_CorpseZoomer_Rotting
    BRA CorpseCommonContactReaction


;;; $DCFD: Power bomb reaction - enemy $EE3F (ripper corpse) ;;;
PowerBombReaction_CorpseRipper:
    LDX.W EnemyIndex
    LDA.W Enemy.properties,X : AND.W #$0400 : BNE CorpseCommonContactReaction_return
; fallthrough to EnemyTouch_EnemyShot_CorpseRipper


;;; $DD08: Enemy touch / enemy shot - enemy $EE3F (ripper corpse) ;;;
EnemyTouch_EnemyShot_CorpseRipper:
    LDA.W #Function_CorpseRipper_Rotting
    BRA CorpseCommonContactReaction


;;; $DD0D: Power bomb reaction - enemy $EE7F (skree corpse) ;;;
PowerBombReaction_CorpseSkree:
    LDX.W EnemyIndex
    LDA.W Enemy.properties,X : AND.W #$0400
    BNE CorpseCommonContactReaction_return
; fallthrough to EnemyTouch_EnemyShot_CorpseSkree


;;; $DD18: Enemy touch / enemy shot - enemy $EE7F (skree corpse) ;;;
EnemyTouch_EnemyShot_CorpseSkree:
    LDA.W #Function_CorpseSkree_Rotting
    BRA CorpseCommonContactReaction


;;; $DD1D: Enemy shot - enemy $ED7F (sidehopper corpse) ;;;
EnemyShot_CorpseSidehopper:
; Also power bomb reaction / enemy touch / enemy shot - enemy $EDBF (sidehopper corpse, part 2)
    LDX.W EnemyIndex
    LDA.W Enemy.properties,X : AND.W #$0400 : BNE CorpseCommonContactReaction_return
    LDA.L CorpseSidehopper.drainedPaletteIndex,X : CMP.W #$0008 : BCC CorpseCommonContactReaction_return
; fallthrough to CorpseSidehopperContactReaction_Rottable


;;; $DD31: Sidehopper corpse contact reaction - rottable ;;;
CorpseSidehopperContactReaction_Rottable:
    LDA.W #Function_CorpseSidehopper_Rotting
; fallthrough to CorpseCommonContactReaction


;;; $DD34: Dead enemies shared contact reaction ;;;
CorpseCommonContactReaction:
;; Parameters:
;;     A: Rotting enemy function
    LDX.W EnemyIndex
    STA.W Corpse.function,X
    LDA.W Enemy.properties,X : ORA.W #$0C00 : STA.W Enemy.properties,X

  .return:
    RTL


;;; $DD44: Enemy touch - enemy $ED7F (sidehopper corpse) ;;;
EnemyTouch_CorpseSidehopper:
    LDX.W EnemyIndex
    LDA.L CorpseSidehopper.drainedPaletteIndex,X : CMP.W #$0008 : BCS CorpseSidehopperContactReaction_Rottable
    LDX.W EnemyIndex
    JSL NormalEnemyTouchAI_NoDeathCheck_External
    RTL


;;; $DD58: Corpse rotting definitions ;;;
CorpseRottingDefinitions_Torizo:
;                        ______________________________________ 0: Corpse rotting rot table pointer (bank $7E)
;                       |     _________________________________ 2: Corpse rotting VRAM transfers pointer
;                       |    |     ____________________________ 4: Corpse rotting rot entry copy function
;                       |    |    |     _______________________ 6: Corpse rotting rot entry move function
;                       |    |    |    |     __________________ 8: Height
;                       |    |    |    |    |     _____________ Ah: Initialisation function pointer
;                       |    |    |    |    |    |     ________ Ch: Tile data row offsets pointer
;                       |    |    |    |    |    |    |     ___ Eh: Corpse rotting rot entry finished hook
;                       |    |    |    |    |    |    |    |
  .rotTablePointer:
    dw CorpseRottingTable
  .VRAMTransferPointer:
    dw $0000
  .rotEntryCopyFunction:
    dw CorpseRottingRotEntry_Copy_Torizo
  .rotEntryMoveFunction:
    dw CorpseRottingRotEntry_Move_Torizo
  .height:
    dw $0060
  .initFunctionPointer:
    dw CorpseRottingInit_Torizo
  .tileDataRowOffsetsPointer:
    dw CorpseRottingTileRowOffsets_Torizo
  .rotEntryFinishedHook:
    dw CorpseRottingRotEntryFinishedHook_CorpseTorizo

CorpseRottingDefinitions_Sidehopper_Param1_0:
    dw CorpseRottingTable                                                ; 0: Corpse rotting rot table pointer (bank $7E)
    dw CorpseRottingVRAMTransferDefinitions_Sidehopper_Param1_0          ; 2: Corpse rotting VRAM transfers pointer
    dw CorpseRottingRotEntry_Copy_Sidehopper_Param1_0                    ; 4: Corpse rotting rot entry copy function
    dw CorpseRottingRotEntry_Move_Sidehopper_Param1_0                    ; 6: Corpse rotting rot entry move function
    dw $0028                                                             ; 8: Height
    dw CorpseRottingInit_Sidehopper_Param1_0                             ; Ah: Initialisation function pointer
    dw CorpseRottingTileRowOffsets_Sidehopper                            ; Ch: Tile data row offsets pointer
    dw CorpseRotEntryFinishedHook_Normal                                 ; Eh: Corpse rotting rot entry finished hook

CorpseRottingDefinitions_Sidehopper_Param1_2:
    dw CorpseRottingTable+$A0                                            ; 0: Corpse rotting rot table pointer (bank $7E)
    dw CorpseRottingVRAMTransferDefinitions_Sidehopper_Param1_2          ; 2: Corpse rotting VRAM transfers pointer
    dw CorpseRottingRotEntry_Copy_Sidehopper_Param1_2                    ; 4: Corpse rotting rot entry copy function
    dw CorpseRottingRotEntry_Move_Sidehopper_Param1_2                    ; 6: Corpse rotting rot entry move function
    dw $0028                                                             ; 8: Height
    dw CorpseRottingInit_Sidehopper_Param1_2                             ; Ah: Initialisation function pointer
    dw CorpseRottingTileRowOffsets_Sidehopper                            ; Ch: Tile data row offsets pointer
    dw CorpseRotEntryFinishedHook_Normal                                 ; Eh: Corpse rotting rot entry finished hook

CorpseRottingDefinitions_Zoomer_Param1_0:
    dw CorpseRottingTable+$2C0                                           ; 0: Corpse rotting rot table pointer (bank $7E)
    dw CorpseRottingVRAMTransferDefinitions_Zoomer_Param1_0              ; 2: Corpse rotting VRAM transfers pointer
    dw CorpseRottingRotEntry_Copy_Zoomer_Param1_0                        ; 4: Corpse rotting rot entry copy function
    dw CorpseRottingRotEntry_Move_Zoomer_Param1_0                        ; 6: Corpse rotting rot entry move function
    dw $0010                                                             ; 8: Height
    dw CorpseRottingInit_Zoomer_Param1_0                                 ; Ah: Initialisation function pointer
    dw CorpseRottingTileRowOffsets_Zoomer                                ; Ch: Tile data row offsets pointer
    dw CorpseRotEntryFinishedHook_Normal                                 ; Eh: Corpse rotting rot entry finished hook

CorpseRottingDefinitions_Zoomer_Param1_2:
    dw CorpseRottingTable+$300                                           ; 0: Corpse rotting rot table pointer (bank $7E)
    dw CorpseRottingVRAMTransferDefinitions_Zoomer_Param1_2              ; 2: Corpse rotting VRAM transfers pointer
    dw CorpseRottingRotEntry_Copy_Zoomer_Param1_2                        ; 4: Corpse rotting rot entry copy function
    dw CorpseRottingRotEntry_Move_Zoomer_Param1_2                        ; 6: Corpse rotting rot entry move function
    dw $0010                                                             ; 8: Height
    dw CorpseRottingInit_Zoomer_Param1_2                                 ; Ah: Initialisation function pointer
    dw CorpseRottingTileRowOffsets_Zoomer                                ; Ch: Tile data row offsets pointer
    dw CorpseRotEntryFinishedHook_Normal                                 ; Eh: Corpse rotting rot entry finished hook

CorpseRottingDefinitions_Zoomer_Param1_4:
    dw CorpseRottingTable+$340                                           ; 0: Corpse rotting rot table pointer (bank $7E)
    dw CorpseRottingVRAMTransferDefinitions_Zoomer_Param1_4              ; 2: Corpse rotting VRAM transfers pointer
    dw CorpseRottingRotEntry_Copy_Zoomer_Param1_4                        ; 4: Corpse rotting rot entry copy function
    dw CorpseRottingRotEntry_Move_Zoomer_Param1_4                        ; 6: Corpse rotting rot entry move function
    dw $0010                                                             ; 8: Height
    dw CorpseRottingInit_Zoomer_Param1_4                                 ; Ah: Initialisation function pointer
    dw CorpseRottingTileRowOffsets_Zoomer                                ; Ch: Tile data row offsets pointer
    dw CorpseRotEntryFinishedHook_Normal                                 ; Eh: Corpse rotting rot entry finished hook

CorpseRottingDefinitions_Ripper_Param1_0:
    dw CorpseRottingTable+$380                                           ; 0: Corpse rotting rot table pointer (bank $7E)
    dw CorpseRottingVRAMTransferDefinitions_Ripper_Param1_0              ; 2: Corpse rotting VRAM transfers pointer
    dw CorpseRottingRotEntry_Copy_Ripper_Param1_0                        ; 4: Corpse rotting rot entry copy function
    dw CorpseRottingRotEntry_Move_Ripper_Param1_0                        ; 6: Corpse rotting rot entry move function
    dw $0010                                                             ; 8: Height
    dw CorpseRottingInit_Ripper_Param1_0                                 ; Ah: Initialisation function pointer
    dw CorpseRottingTileRowOffsets_Ripper                                ; Ch: Tile data row offsets pointer
    dw CorpseRotEntryFinishedHook_Normal                                 ; Eh: Corpse rotting rot entry finished hook

CorpseRottingDefinitions_Ripper_Param1_2:
    dw CorpseRottingTable+$3C0                                           ; 0: Corpse rotting rot table pointer (bank $7E)
    dw CorpseRottingVRAMTransferDefinitions_Ripper_Param1_2              ; 2: Corpse rotting VRAM transfers pointer
    dw CorpseRottingRotEntry_Copy_Ripper_Param1_2                        ; 4: Corpse rotting rot entry copy function
    dw CorpseRottingRotEntry_Move_Ripper_Param1_2                        ; 6: Corpse rotting rot entry move function
    dw $0010                                                             ; 8: Height
    dw CorpseRottingInit_Ripper_Param1_2                                 ; Ah: Initialisation function pointer
    dw CorpseRottingTileRowOffsets_Ripper                                ; Ch: Tile data row offsets pointer
    dw CorpseRotEntryFinishedHook_Normal                                 ; Eh: Corpse rotting rot entry finished hook

CorpseRottingDefinitions_Skree_Param1_0:
    dw CorpseRottingTable+$140                                           ; 0: Corpse rotting rot table pointer (bank $7E)
    dw CorpseRottingVRAMTransferDefinitions_Skree_Param1_0               ; 2: Corpse rotting VRAM transfers pointer
    dw CorpseRottingRotEntry_Copy_Skree_Param1_0                         ; 4: Corpse rotting rot entry copy function
    dw CorpseRottingRotEntry_Move_Skree_Param1_0                         ; 6: Corpse rotting rot entry move function
    dw $0020                                                             ; 8: Height
    dw CorpseRottingInit_Skree_Param1_0                                  ; Ah: Initialisation function pointer
    dw CorpseRottingTileRowOffsets_Skree                                 ; Ch: Tile data row offsets pointer
    dw CorpseRotEntryFinishedHook_Normal                                 ; Eh: Corpse rotting rot entry finished hook

CorpseRottingDefinitions_Skree_Param1_2:
    dw CorpseRottingTable+$1C0                                           ; 0: Corpse rotting rot table pointer (bank $7E)
    dw CorpseRottingVRAMTransferDefinitions_Skree_Param1_2               ; 2: Corpse rotting VRAM transfers pointer
    dw CorpseRottingRotEntry_Copy_Skree_Param1_2                         ; 4: Corpse rotting rot entry copy function
    dw CorpseRottingRotEntry_Move_Skree_Param1_2                         ; 6: Corpse rotting rot entry move function
    dw $0020                                                             ; 8: Height
    dw CorpseRottingInit_Skree_Param1_2                                  ; Ah: Initialisation function pointer
    dw CorpseRottingTileRowOffsets_Skree                                 ; Ch: Tile data row offsets pointer
    dw CorpseRotEntryFinishedHook_Normal                                 ; Eh: Corpse rotting rot entry finished hook

CorpseRottingDefinitions_Skree_Param1_4:
    dw CorpseRottingTable+$240                                           ; 0: Corpse rotting rot table pointer (bank $7E)
    dw CorpseRottingVRAMTransferDefinitions_Skree_Param1_4               ; 2: Corpse rotting VRAM transfers pointer
    dw CorpseRottingRotEntry_Copy_Skree_Param1_4                         ; 4: Corpse rotting rot entry copy function
    dw CorpseRottingRotEntry_Move_Skree_Param1_4                         ; 6: Corpse rotting rot entry move function
    dw $0020                                                             ; 8: Height
    dw CorpseRottingInit_Skree_Param1_4                                  ; Ah: Initialisation function pointer
    dw CorpseRottingTileRowOffsets_Skree                                 ; Ch: Tile data row offsets pointer
    dw CorpseRotEntryFinishedHook_Normal                                 ; Eh: Corpse rotting rot entry finished hook

CorpseRottingDefinitions_MotherBrain:
    dw CorpseRottingTable+$700                                           ; 0: Corpse rotting rot table pointer (bank $7E)
    dw CorpseRottingVRAMTransferDefinitions_MotherBrain                  ; 2: Corpse rotting VRAM transfers pointer
    dw CorpseRottingRotEntry_Copy_MotherBrain                            ; 4: Corpse rotting rot entry copy function
    dw CorpseRottingRotEntry_Move_MotherBrain                            ; 6: Corpse rotting rot entry move function
    dw $0030                                                             ; 8: Height
    dw CorpseRottingInit_MotherBrain                                     ; Ah: Initialisation function pointer
    dw CorpseRottingTileRowOffsets_MotherBrain                           ; Ch: Tile data row offsets pointer
    dw CorpseRottingRotEntryFinishedHook_MotherBrain                     ; Eh: Corpse rotting rot entry finished hook


;;; $DE18: Corpse rotting initialisation function - torizo ;;;
CorpseRottingInit_Torizo:
; $7E:2000..213F: Row 0
; $7E:2140..227F: Row 1
; $7E:2280..23BF: Row 2
; $7E:23C0..24FF: Row 3
; $7E:2500..263F: Row 4
; $7E:2640..277F: Row 5
; $7E:2780..28BF: Row 6
; $7E:28C0..29FF: Row 7
; $7E:2A00..2B3F: Row 8
; $7E:2B40..2C7F: Row 9
; $7E:2C80..2DBF: Row Ah
; $7E:2DC0..2EFF: Row Bh
    PHB
    LDX.W #Tiles_CorpseTorizo+$120
    LDY.W #CorpseRottingGFX_Torizo+$60
    LDA.W #$00BF
    MVN $7E,Tiles_CorpseTorizo>>16
    PLB
    PHB
    LDX.W #Tiles_CorpseTorizo+$320
    LDY.W #CorpseRottingGFX_Torizo+$1A0
    LDA.W #$00BF
    MVN $7E,Tiles_CorpseTorizo>>16
    PLB
    PHB
    LDX.W #Tiles_CorpseTorizo+$500
    LDY.W #CorpseRottingGFX_Torizo+$2C0
    LDA.W #$00FF
    MVN $7E,Tiles_CorpseTorizo>>16
    PLB
    PHB
    LDX.W #Tiles_CorpseTorizo+$700
    LDY.W #CorpseRottingGFX_Torizo+$400
    LDA.W #$00FF
    MVN $7E,Tiles_CorpseTorizo>>16
    PLB
    PHB
    LDX.W #Tiles_CorpseTorizo+$900
    LDY.W #CorpseRottingGFX_Torizo+$540
    LDA.W #$00FF
    MVN $7E,Tiles_CorpseTorizo>>16
    PLB
    PHB
    LDX.W #Tiles_CorpseTorizo+$B00
    LDY.W #CorpseRottingGFX_Torizo+$680
    LDA.W #$00FF
    MVN $7E,Tiles_CorpseTorizo>>16
    PLB
    PHB
    LDX.W #Tiles_CorpseTorizo+$D00
    LDY.W #CorpseRottingGFX_Torizo+$7C0
    LDA.W #$00FF
    MVN $7E,Tiles_CorpseTorizo>>16
    PLB
    PHB
    LDX.W #Tiles_CorpseTorizo+$F00
    LDY.W #CorpseRottingGFX_Torizo+$900
    LDA.W #$00FF
    MVN $7E,Tiles_CorpseTorizo>>16
    PLB
    PHB
    LDX.W #Tiles_CorpseTorizo+$1100
    LDY.W #CorpseRottingGFX_Torizo+$A40
    LDA.W #$00FF
    MVN $7E,Tiles_CorpseTorizo>>16
    PLB
    PHB
    LDX.W #Tiles_CorpseTorizo+$12E0
    LDY.W #CorpseRottingGFX_Torizo+$B60
    LDA.W #$011F
    MVN $7E,Tiles_CorpseTorizo>>16
    PLB
    PHB
    LDX.W #Tiles_CorpseTorizo+$14C0
    LDY.W #CorpseRottingGFX_Torizo+$C80
    LDA.W #$013F
    MVN $7E,Tiles_CorpseTorizo>>16
    PLB
    PHB
    LDX.W #Tiles_CorpseTorizo+$16C0
    LDY.W #CorpseRottingGFX_Torizo+$DC0
    LDA.W #$013F
    MVN $7E,Tiles_CorpseTorizo>>16
    PLB
    RTS


;;; $DEC1: Corpse rotting initialisation function - sidehopper - enemy parameter 1 = 0 ;;;
CorpseRottingInit_Sidehopper_Param1_0:
; $7E:2000..209F: Row 0
; $7E:20A0..213F: Row 1
; $7E:2140..21DF: Row 2
; $7E:21E0..227F: Row 3
; $7E:2280..231F: Row 4
    PHB
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$40
    LDY.W #CorpseRottingGFX_Sidehopper0+$40
    LDA.W #$005F
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16
    PLB
    PHB
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$200
    LDY.W #CorpseRottingGFX_Sidehopper0+$A0
    LDA.W #$009F
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16
    PLB
    PHB
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$400
    LDY.W #CorpseRottingGFX_Sidehopper0+$140
    LDA.W #$009F
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16
    PLB
    PHB
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$600
    LDY.W #CorpseRottingGFX_Sidehopper0+$1E0
    LDA.W #$009F
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16
    PLB
    PHB
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$800
    LDY.W #CorpseRottingGFX_Sidehopper0+$280
    LDA.W #$009F
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16
    PLB
    RTS


;;; $DF08: Corpse rotting initialisation function - sidehopper - enemy parameter 1 = 2 ;;;
CorpseRottingInit_Sidehopper_Param1_2:
; $7E:2320..23BF: Row 0
; $7E:23C0..245F: Row 1
; $7E:2460..24FF: Row 2
; $7E:2500..259F: Row 3
; $7E:25A0..263F: Row 4
    PHB
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$120
    LDY.W #CorpseRottingGFX_Sidehopper2
    LDA.W #$003F
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16
    PLB
    PHB
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$320
    LDY.W #CorpseRottingGFX_Sidehopper2+$A0
    LDA.W #$009F
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16
    PLB
    PHB
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$520
    LDY.W #CorpseRottingGFX_Sidehopper2+$140
    LDA.W #$009F
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16
    PLB
    PHB
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$720
    LDY.W #CorpseRottingGFX_Sidehopper2+$1E0
    LDA.W #$009F
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16
    PLB
    PHB
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$920
    LDY.W #CorpseRottingGFX_Sidehopper2+$280
    LDA.W #$009F
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16
    PLB
    RTS


;;; $DF4F: Corpse rotting initialisation function - zoomer - enemy parameter 1 = 0 ;;;
CorpseRottingInit_Zoomer_Param1_0:
; $7E:2940..99
; $7E:29A0..FF
    PHB
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$A60
    LDY.W #CorpseRottingGFX_Zoomer0
    LDA.W #$005F
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16
    PLB
    PHB
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$C60
    LDY.W #CorpseRottingGFX_Zoomer0+$60
    LDA.W #$005F
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16
    PLB
    RTS


;;; $DF6C: Corpse rotting initialisation function - zoomer - enemy parameter 1 = 2 ;;;
CorpseRottingInit_Zoomer_Param1_2:
; $7E:2A00..5F: Row 0
; $7E:2A60..BF: Row 1
    PHB
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$AC0
    LDY.W #CorpseRottingGFX_Zoomer2
    LDA.W #$005F
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16
    PLB
    PHB
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$CC0
    LDY.W #CorpseRottingGFX_Zoomer2+$60
    LDA.W #$005F
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16
    PLB
    RTS


;;; $DF89: Corpse rotting initialisation function - zoomer - enemy parameter 1 = 4 ;;;
CorpseRottingInit_Zoomer_Param1_4:
; $7E:2AC0..2B1F: Row 0
; $7E:2B20..2B7F: Row 1
    PHB
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$B20
    LDY.W #CorpseRottingGFX_Zoomer4
    LDA.W #$005F
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16
    PLB
    PHB
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$D20
    LDY.W #CorpseRottingGFX_Zoomer4+$60
    LDA.W #$005F
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16
    PLB
    RTS


;;; $DFA6: Corpse rotting initialisation function - ripper - enemy parameter 1 = 0 ;;;
CorpseRottingInit_Ripper_Param1_0:
; $7E:2B80..2BDF: Row 0
; $7E:2BE0..2C3F: Row 1
    PHB
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$A00
    LDY.W #CorpseRottingGFX_Ripper0
    LDA.W #$005F
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16
    PLB
    PHB
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$C00
    LDY.W #CorpseRottingGFX_Ripper0+$60
    LDA.W #$005F
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16
    PLB
    RTS


;;; $DFC3: Corpse rotting initialisation function - ripper - enemy parameter 1 = 2 ;;;
CorpseRottingInit_Ripper_Param1_2:
; $7E:2C40..2C9F: Row 0
; $7E:2CA0..2CFF: Row 1
    PHB
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$B80
    LDY.W #CorpseRottingGFX_Ripper2
    LDA.W #$005F
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16
    PLB
    PHB
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$D80
    LDY.W #CorpseRottingGFX_Ripper2+$60
    LDA.W #$005F
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16
    PLB
    RTS


;;; $DFE0: Corpse rotting initialisation function - skree - enemy parameter 1 = 0 ;;;
CorpseRottingInit_Skree_Param1_0:
; $7E:2640..267F: Row 0
; $7E:2680..26BF: Row 1
; $7E:26C0..26FF: Row 2
; $7E:2700..273F: Row 3
    PHB
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$2A0
    LDY.W #CorpseRottingGFX_Skree0
    LDA.W #$003F
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16
    PLB
    PHB
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$4A0
    LDY.W #CorpseRottingGFX_Skree0+$40
    LDA.W #$003F
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16
    PLB
    PHB
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$6A0
    LDY.W #CorpseRottingGFX_Skree0+$80
    LDA.W #$003F
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16
    PLB
    PHB
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$8A0
    LDY.W #CorpseRottingGFX_Skree0+$C0
    LDA.W #$003F
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16
    PLB
    RTS


;;; $E019: Corpse rotting initialisation function - skree - enemy parameter 1 = 2 ;;;
CorpseRottingInit_Skree_Param1_2:
; $7E:2740..277F: Row 0
; $7E:2780..27BF: Row 1
; $7E:27C0..27FF: Row 2
; $7E:2800..283F: Row 3
    PHB
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$E0
    LDY.W #CorpseRottingGFX_Skree2
    LDA.W #$003F
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16
    PLB
    PHB
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$2E0
    LDY.W #CorpseRottingGFX_Skree2+$40
    LDA.W #$003F
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16
    PLB
    PHB
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$4E0
    LDY.W #CorpseRottingGFX_Skree2+$80
    LDA.W #$003F
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16
    PLB
    PHB
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$6E0
    LDY.W #CorpseRottingGFX_Skree2+$C0
    LDA.W #$003F
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16
    PLB
    RTS


;;; $E052: Corpse rotting initialisation function - skree - enemy parameter 1 = 4 ;;;
CorpseRottingInit_Skree_Param1_4:
; $7E:2840..287F: Row 0
; $7E:2880..28BF: Row 1
; $7E:28C0..28FF: Row 2
; $7E:2900..293F: Row 3
    PHB
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$1C0
    LDY.W #CorpseRottingGFX_Skree4
    LDA.W #$003F
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16
    PLB
    PHB
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$3C0
    LDY.W #CorpseRottingGFX_Skree4+$40
    LDA.W #$003F
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16
    PLB
    PHB
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$5C0
    LDY.W #CorpseRottingGFX_Skree4+$80
    LDA.W #$003F
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16
    PLB
    PHB
    LDX.W #Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree+$7C0
    LDY.W #CorpseRottingGFX_Skree4+$C0
    LDA.W #$003F
    MVN $7E,Tiles_Corpse_Sidehopper_Zoomer_Ripper_Skree>>16
    PLB
    RTS


;;; $E08B: Corpse rotting initialisation function - Mother Brain ;;;
CorpseRottingInit_MotherBrain:
; $7E:9000..90DF: Row 0
; $7E:90E0..91BF: Row 1
; $7E:91C0..929F: Row 2
; $7E:92A0..937F: Row 3
; $7E:9380..945F: Row 4
; $7E:9460..953F: Row 5

; $B7:CE00 is the two frames of Mother Brain's corpse side-by-side, this function extracts only the right-side frame (the gaps are blank tiles)
    PHB
    LDX.W #Tiles_CorpseMotherBrain+$C0
    LDY.W #MotherBrainCorpseRottingGFX
    LDA.W #$00BF
    MVN $7E,Tiles_CorpseMotherBrain>>16
    PLB
    PHB
    LDX.W #Tiles_CorpseMotherBrain+$2C0
    LDY.W #MotherBrainCorpseRottingGFX+$E0
    LDA.W #$00BF
    MVN $7E,Tiles_CorpseMotherBrain>>16
    PLB
    PHB
    LDX.W #Tiles_CorpseMotherBrain+$4C0
    LDY.W #MotherBrainCorpseRottingGFX+$1C0
    LDA.W #$00BF
    MVN $7E,Tiles_CorpseMotherBrain>>16
    PLB
    PHB
    LDX.W #Tiles_CorpseMotherBrain+$6C0
    LDY.W #MotherBrainCorpseRottingGFX+$2A0
    LDA.W #$00BF
    MVN $7E,Tiles_CorpseMotherBrain>>16
    PLB
    PHB
    LDX.W #Tiles_CorpseMotherBrain+$8C0
    LDY.W #MotherBrainCorpseRottingGFX+$380
    LDA.W #$00DF
    MVN $7E,Tiles_CorpseMotherBrain>>16
    PLB
    PHB
    LDX.W #Tiles_CorpseMotherBrain+$AC0
    LDY.W #MotherBrainCorpseRottingGFX+$460
    LDA.W #$00DF
    MVN $7E,Tiles_CorpseMotherBrain>>16
    PLB
    RTS


;;; $E0E0: Corpse rotting VRAM transfer definitions ;;;
; Size, source bank, source address, VRAM address
CorpseRottingVRAMTransferDefinitions_Sidehopper_Param1_0:
; Sidehopper - enemy parameter 1 = 0
    dw $0060,$7E00,$2040,$7020
    dw $00A0,$7E00,$20A0,$7100
    dw $00A0,$7E00,$2140,$7200
    dw $00A0,$7E00,$21E0,$7300
    dw $00A0,$7E00,$2280,$7400
    dw $0000

CorpseRottingVRAMTransferDefinitions_Sidehopper_Param1_2:
; Sidehopper - enemy parameter 1 = 2
    dw $0040,$7E00,$2320,$7090
    dw $00A0,$7E00,$23C0,$7190
    dw $00A0,$7E00,$2460,$7290
    dw $00A0,$7E00,$2500,$7390
    dw $00A0,$7E00,$25A0,$7490
    dw $0000

CorpseRottingVRAMTransferDefinitions_Zoomer_Param1_0:
; Zoomer - enemy parameter 1 = 0
    dw $0060,$7E00,$2940,$7530
    dw $0060,$7E00,$29A0,$7630
    dw $0000

CorpseRottingVRAMTransferDefinitions_Zoomer_Param1_2:
; Zoomer - enemy parameter 1 = 2
    dw $0060,$7E00,$2A00,$7560
    dw $0060,$7E00,$2A60,$7660
    dw $0000

CorpseRottingVRAMTransferDefinitions_Zoomer_Param1_4:
; Zoomer - enemy parameter 1 = 4
    dw $0060,$7E00,$2AC0,$7590
    dw $0060,$7E00,$2B20,$7690
    dw $0000

CorpseRottingVRAMTransferDefinitions_Ripper_Param1_0:
; Ripper - enemy parameter 1 = 0
    dw $0060,$7E00,$2B80,$7500
    dw $0060,$7E00,$2BE0,$7600
    dw $0000

CorpseRottingVRAMTransferDefinitions_Ripper_Param1_2:
; Ripper - enemy parameter 1 = 2
    dw $0060,$7E00,$2C40,$75C0
    dw $0060,$7E00,$2CA0,$76C0
    dw $0000

CorpseRottingVRAMTransferDefinitions_Skree_Param1_0:
; Skree - enemy parameter 1 = 0
    dw $0040,$7E00,$2640,$7150
    dw $0040,$7E00,$2680,$7250
    dw $0040,$7E00,$26C0,$7350
    dw $0040,$7E00,$2700,$7450
    dw $0000

CorpseRottingVRAMTransferDefinitions_Skree_Param1_2:
; Skree - enemy parameter 1 = 2
    dw $0040,$7E00,$2740,$7070
    dw $0040,$7E00,$2780,$7170
    dw $0040,$7E00,$27C0,$7270
    dw $0040,$7E00,$2800,$7370
    dw $0000

CorpseRottingVRAMTransferDefinitions_Skree_Param1_4:
; Skree - enemy parameter 1 = 4
    dw $0040,$7E00,$2840,$70E0
    dw $0040,$7E00,$2880,$71E0
    dw $0040,$7E00,$28C0,$72E0
    dw $0040,$7E00,$2900,$73E0
    dw $0000

CorpseRottingVRAMTransferDefinitions_MotherBrain:
; Mother Brain
    dw $0060,$7E00,$9040,$7A80
    dw $00A0,$7E00,$9100,$7B70
    dw $00C0,$7E00,$91C0,$7C60
    dw $00C0,$7E00,$92A0,$7D60
    dw $00E0,$7E00,$9380,$7E60
    dw $00E0,$7E00,$9460,$7F60
    dw $0000


;;; $E226: Corpse rotting tile row offsets ;;;
CorpseRottingTileRowOffsets:
  .Torizo:
    dw $0000,$0140,$0280,$03C0,$0500,$0640,$0780,$08C0
    dw $0A00,$0B40,$0C80,$0DC0,$0F00

  .Sidehopper:
    dw $0000,$00A0,$0140,$01E0,$0280,$0320

  .Zoomer:
    dw $0000,$0060,$00C0

  .Ripper:
    dw $0000,$0060,$00C0

  .Skree:
    dw $0000,$0040,$0080,$00C0,$0100

  .MotherBrain:
    dw $0000,$00E0,$01C0,$02A0,$0380,$0460,$0540,$0620


;;; $E272: Corpse rotting rot entry move function - torizo ;;;
CorpseRottingRotEntry_Move_Torizo:
;; Parameters:
;;     X: Source pixel row tile data offset
;;     Y: Destination pixel row tile data offset

; DB must be $7E
; Clears pixel row in dest and copies a pixel row from source to one pixel down in dest

; Tile data calculations:
;     Tiles are 20h bytes
;
;     Pixel (x, y) of tile at pointer p is:
;           ([p + y * 2]       >> 7 - x & 1)
;         | ([p + y * 2 + 1]   >> 7 - x & 1) << 1
;         | ([p + y * 2 + 10h] >> 7 - x & 1) << 2
;         | ([p + y * 2 + 11h] >> 7 - x & 1) << 3
;
;     Hence, pixel row y of tile at pointer p is the bytes
;         [p + y * 2], [p + y * 2 + 1], [p + y * 2 + 10h], [p + y * 2 + 11h]

; Column 0 is only used by rows Ah..Bh
; Column 1 is only used by rows 9..Bh
; Column 2 is only used by rows 2..Bh
; Column 9 is only used by rows 2..Bh
; (See $B7:A800)
    LDA.W Corpse.rotEntryYOffset : CMP.W #$0050 : BCC .column1
    CMP.W #$005E : BPL .offsetGreaterThan5D
    LDA.W CorpseRottingGFX_Torizo,X : STA.W CorpseRottingGFX_Torizo+2,Y
    LDA.W CorpseRottingGFX_Torizo+$10,X : STA.W CorpseRottingGFX_Torizo+$12,Y

  .offsetGreaterThan5D:
    STZ.W CorpseRottingGFX_Torizo,X : STZ.W CorpseRottingGFX_Torizo+$10,X

  .column1:
    LDA.W Corpse.rotEntryYOffset : CMP.W #$0048 : BCC .column2
    CMP.W #$005E : BPL ..offsetGreaterThan5E
    LDA.W CorpseRottingGFX_Torizo+$20,X : STA.W CorpseRottingGFX_Torizo+$22,Y
    LDA.W CorpseRottingGFX_Torizo+$30,X : STA.W CorpseRottingGFX_Torizo+$32,Y

  ..offsetGreaterThan5E:
    STZ.W CorpseRottingGFX_Torizo+$20,X : STZ.W CorpseRottingGFX_Torizo+$30,X

  .column2:
    LDA.W Corpse.rotEntryYOffset : CMP.W #$0010 : BCC .column3
    CMP.W #$005E : BPL ..offsetGreaterThan5E
    LDA.W CorpseRottingGFX_Torizo+$40,X : STA.W CorpseRottingGFX_Torizo+$42,Y
    LDA.W CorpseRottingGFX_Torizo+$50,X : STA.W CorpseRottingGFX_Torizo+$52,Y

  ..offsetGreaterThan5E:
    STZ.W CorpseRottingGFX_Torizo+$40,X : STZ.W CorpseRottingGFX_Torizo+$50,X

  .column3:
    LDA.W Corpse.rotEntryYOffset : CMP.W #$005E : BPL ..offsetGreaterThan5E
    LDA.W CorpseRottingGFX_Torizo+$60,X : STA.W CorpseRottingGFX_Torizo+$62,Y
    LDA.W CorpseRottingGFX_Torizo+$70,X : STA.W CorpseRottingGFX_Torizo+$72,Y

  ..offsetGreaterThan5E:
    STZ.W CorpseRottingGFX_Torizo+$60,X : STZ.W CorpseRottingGFX_Torizo+$70,X
    LDA.W Corpse.rotEntryYOffset : CMP.W #$005E : BPL +
    LDA.W CorpseRottingGFX_Torizo+$80,X : STA.W CorpseRottingGFX_Torizo+$82,Y
    LDA.W CorpseRottingGFX_Torizo+$90,X : STA.W CorpseRottingGFX_Torizo+$92,Y

+   STZ.W CorpseRottingGFX_Torizo+$80,X : STZ.W CorpseRottingGFX_Torizo+$90,X
    LDA.W Corpse.rotEntryYOffset : CMP.W #$005E : BPL +
    LDA.W CorpseRottingGFX_Torizo+$A0,X : STA.W CorpseRottingGFX_Torizo+$A2,Y
    LDA.W CorpseRottingGFX_Torizo+$B0,X : STA.W CorpseRottingGFX_Torizo+$B2,Y

+   STZ.W CorpseRottingGFX_Torizo+$A0,X : STZ.W CorpseRottingGFX_Torizo+$B0,X
    LDA.W Corpse.rotEntryYOffset : CMP.W #$005E : BPL +
    LDA.W CorpseRottingGFX_Torizo+$C0,X : STA.W CorpseRottingGFX_Torizo+$C2,Y
    LDA.W CorpseRottingGFX_Torizo+$D0,X : STA.W CorpseRottingGFX_Torizo+$D2,Y

+   STZ.W CorpseRottingGFX_Torizo+$C0,X : STZ.W CorpseRottingGFX_Torizo+$D0,X
    LDA.W Corpse.rotEntryYOffset : CMP.W #$005E : BPL +
    LDA.W CorpseRottingGFX_Torizo+$E0,X : STA.W CorpseRottingGFX_Torizo+$E2,Y
    LDA.W CorpseRottingGFX_Torizo+$F0,X : STA.W CorpseRottingGFX_Torizo+$F2,Y

+   STZ.W CorpseRottingGFX_Torizo+$E0,X : STZ.W CorpseRottingGFX_Torizo+$F0,X
    LDA.W Corpse.rotEntryYOffset : CMP.W #$005E : BPL +
    LDA.W CorpseRottingGFX_Torizo+$100,X : STA.W CorpseRottingGFX_Torizo+$102,Y
    LDA.W CorpseRottingGFX_Torizo+$110,X : STA.W CorpseRottingGFX_Torizo+$112,Y

+   STZ.W CorpseRottingGFX_Torizo+$100,X : STZ.W CorpseRottingGFX_Torizo+$110,X
    LDA.W Corpse.rotEntryYOffset : CMP.W #$0010 : BCC .return
    CMP.W #$005E : BPL +
    LDA.W CorpseRottingGFX_Torizo+$120,X : STA.W CorpseRottingGFX_Torizo+$122,Y
    LDA.W CorpseRottingGFX_Torizo+$130,X : STA.W CorpseRottingGFX_Torizo+$132,Y

+   STZ.W CorpseRottingGFX_Torizo+$120,X : STZ.W CorpseRottingGFX_Torizo+$130,X

  .return:
    RTS


;;; $E38B: Corpse rotting rot entry copy function - torizo ;;;
CorpseRottingRotEntry_Copy_Torizo:
;; Parameters:
;;     X: Source pixel row tile data offset
;;     Y: Destination pixel row tile data offset

; DB must be $7E
; Copies a pixel row from source to one pixel down in dest

; Tile data calculations:
;     Tiles are 20h bytes
;
;     Pixel (x, y) of tile at pointer p is:
;           ([p + y * 2]       >> 7 - x & 1)
;         | ([p + y * 2 + 1]   >> 7 - x & 1) << 1
;         | ([p + y * 2 + 10h] >> 7 - x & 1) << 2
;         | ([p + y * 2 + 11h] >> 7 - x & 1) << 3
;
;     Hence, pixel row y of tile at pointer p is the bytes
;         [p + y * 2], [p + y * 2 + 1], [p + y * 2 + 10h], [p + y * 2 + 11h]

; Column 0 is only used by rows Ah..Bh
; Column 1 is only used by rows 9..Bh
; Column 2 is only used by rows 2..Bh
; Column 9 is only used by rows 2..Bh
; (See $B7:A800)
    LDA.W Corpse.rotEntryYOffset : CMP.W #$0050 : BCC +
    CMP.W #$005E : BPL +
    LDA.W CorpseRottingGFX_Torizo,X : STA.W CorpseRottingGFX_Torizo+2,Y
    LDA.W CorpseRottingGFX_Torizo+$10,X : STA.W CorpseRottingGFX_Torizo+$12,Y

+   LDA.W Corpse.rotEntryYOffset : CMP.W #$0048 : BCC +
    CMP.W #$005E : BPL +
    LDA.W CorpseRottingGFX_Torizo+$20,X : STA.W CorpseRottingGFX_Torizo+$22,Y
    LDA.W CorpseRottingGFX_Torizo+$30,X : STA.W CorpseRottingGFX_Torizo+$32,Y

+   LDA.W Corpse.rotEntryYOffset : CMP.W #$0010 : BCC +
    CMP.W #$005E : BPL +
    LDA.W CorpseRottingGFX_Torizo+$40,X : STA.W CorpseRottingGFX_Torizo+$42,Y
    LDA.W CorpseRottingGFX_Torizo+$50,X : STA.W CorpseRottingGFX_Torizo+$52,Y

+   LDA.W Corpse.rotEntryYOffset : CMP.W #$005E : BPL +
    LDA.W CorpseRottingGFX_Torizo+$60,X : STA.W CorpseRottingGFX_Torizo+$62,Y
    LDA.W CorpseRottingGFX_Torizo+$70,X : STA.W CorpseRottingGFX_Torizo+$72,Y

+   LDA.W Corpse.rotEntryYOffset : CMP.W #$005E : BPL +
    LDA.W CorpseRottingGFX_Torizo+$80,X : STA.W CorpseRottingGFX_Torizo+$82,Y
    LDA.W CorpseRottingGFX_Torizo+$90,X : STA.W CorpseRottingGFX_Torizo+$92,Y

+   LDA.W Corpse.rotEntryYOffset : CMP.W #$005E : BPL +
    LDA.W CorpseRottingGFX_Torizo+$A0,X : STA.W CorpseRottingGFX_Torizo+$A2,Y
    LDA.W CorpseRottingGFX_Torizo+$B0,X : STA.W CorpseRottingGFX_Torizo+$B2,Y

+   LDA.W Corpse.rotEntryYOffset : CMP.W #$005E : BPL +
    LDA.W CorpseRottingGFX_Torizo+$C0,X : STA.W CorpseRottingGFX_Torizo+$C2,Y
    LDA.W CorpseRottingGFX_Torizo+$D0,X : STA.W CorpseRottingGFX_Torizo+$D2,Y

+   LDA.W Corpse.rotEntryYOffset : CMP.W #$005E : BPL +
    LDA.W CorpseRottingGFX_Torizo+$E0,X : STA.W CorpseRottingGFX_Torizo+$E2,Y
    LDA.W CorpseRottingGFX_Torizo+$F0,X : STA.W CorpseRottingGFX_Torizo+$F2,Y

+   LDA.W Corpse.rotEntryYOffset : CMP.W #$005E : BPL +
    LDA.W CorpseRottingGFX_Torizo+$100,X : STA.W CorpseRottingGFX_Torizo+$102,Y
    LDA.W CorpseRottingGFX_Torizo+$110,X : STA.W CorpseRottingGFX_Torizo+$112,Y

+   LDA.W Corpse.rotEntryYOffset : CMP.W #$0010 : BCC .return
    CMP.W #$005E : BPL .return
    LDA.W CorpseRottingGFX_Torizo+$120,X : STA.W CorpseRottingGFX_Torizo+$122,Y
    LDA.W CorpseRottingGFX_Torizo+$130,X : STA.W CorpseRottingGFX_Torizo+$132,Y

  .return:
    RTS


;;; $E468: Corpse rotting rot entry move function - sidehopper - enemy parameter 1 = 0 ;;;
CorpseRottingRotEntry_Move_Sidehopper_Param1_0:
;; Parameters:
;;     X: Source pixel row tile data offset
;;     Y: Destination pixel row tile data offset

; DB must be $7E
; Clears pixel row in dest and copies a pixel row from source to one pixel down in dest

; Tile data calculations:
;     Tiles are 20h bytes
;
;     Pixel (x, y) of tile at pointer p is:
;           ([p + y * 2]       >> 7 - x & 1)
;         | ([p + y * 2 + 1]   >> 7 - x & 1) << 1
;         | ([p + y * 2 + 10h] >> 7 - x & 1) << 2
;         | ([p + y * 2 + 11h] >> 7 - x & 1) << 3
;
;     Hence, pixel row y of tile at pointer p is the bytes
;         [p + y * 2], [p + y * 2 + 1], [p + y * 2 + 10h], [p + y * 2 + 11h]
    LDA.W Corpse.rotEntryYOffset : CMP.W #$0008 : BCC .column1
    CMP.W #$0026 : BPL .offsetGreaterThan25
    LDA.W CorpseRottingGFX_Torizo,X : STA.W CorpseRottingGFX_Torizo+2,Y
    LDA.W CorpseRottingGFX_Torizo+$10,X : STA.W CorpseRottingGFX_Torizo+$12,Y

  .offsetGreaterThan25:
    STZ.W CorpseRottingGFX_Torizo,X : STZ.W CorpseRottingGFX_Torizo+$10,X

  .column1:
    LDA.W Corpse.rotEntryYOffset : CMP.W #$0008 : BCC .column2
    CMP.W #$0026 : BPL ..offsetGreaterThan25
    LDA.W CorpseRottingGFX_Torizo+$20,X : STA.W CorpseRottingGFX_Torizo+$22,Y
    LDA.W CorpseRottingGFX_Torizo+$30,X : STA.W CorpseRottingGFX_Torizo+$32,Y

  ..offsetGreaterThan25:
    STZ.W CorpseRottingGFX_Torizo+$20,X : STZ.W CorpseRottingGFX_Torizo+$30,X

  .column2:
    LDA.W Corpse.rotEntryYOffset : CMP.W #$0026 : BPL +
    LDA.W CorpseRottingGFX_Torizo+$40,X : STA.W CorpseRottingGFX_Torizo+$42,Y
    LDA.W CorpseRottingGFX_Torizo+$50,X : STA.W CorpseRottingGFX_Torizo+$52,Y

+   STZ.W CorpseRottingGFX_Torizo+$40,X : STZ.W CorpseRottingGFX_Torizo+$50,X
    LDA.W Corpse.rotEntryYOffset : CMP.W #$0026 : BPL +
    LDA.W CorpseRottingGFX_Torizo+$60,X : STA.W CorpseRottingGFX_Torizo+$62,Y
    LDA.W CorpseRottingGFX_Torizo+$70,X : STA.W CorpseRottingGFX_Torizo+$72,Y

+   STZ.W CorpseRottingGFX_Torizo+$60,X : STZ.W CorpseRottingGFX_Torizo+$70,X
    LDA.W Corpse.rotEntryYOffset : CMP.W #$0026 : BPL +
    LDA.W CorpseRottingGFX_Torizo+$80,X : STA.W CorpseRottingGFX_Torizo+$82,Y
    LDA.W CorpseRottingGFX_Torizo+$90,X : STA.W CorpseRottingGFX_Torizo+$92,Y

+   STZ.W CorpseRottingGFX_Torizo+$80,X : STZ.W CorpseRottingGFX_Torizo+$90,X
    RTS


;;; $E4F5: Corpse rotting rot entry copy function - sidehopper - enemy parameter 1 = 0 ;;;
CorpseRottingRotEntry_Copy_Sidehopper_Param1_0:
;; Parameters:
;;     X: Source pixel row tile data offset
;;     Y: Destination pixel row tile data offset

; DB must be $7E
; Copies a pixel row from source to one pixel down in dest

; Tile data calculations:
;     Tiles are 20h bytes
;
;     Pixel (x, y) of tile at pointer p is:
;           ([p + y * 2]       >> 7 - x & 1)
;         | ([p + y * 2 + 1]   >> 7 - x & 1) << 1
;         | ([p + y * 2 + 10h] >> 7 - x & 1) << 2
;         | ([p + y * 2 + 11h] >> 7 - x & 1) << 3
;
;     Hence, pixel row y of tile at pointer p is the bytes
;         [p + y * 2], [p + y * 2 + 1], [p + y * 2 + 10h], [p + y * 2 + 11h]
    LDA.W Corpse.rotEntryYOffset : CMP.W #$0008 : BCC +
    CMP.W #$0026 : BPL +
    LDA.W CorpseRottingGFX_Sidehopper0,X : STA.W CorpseRottingGFX_Sidehopper0+2,Y
    LDA.W CorpseRottingGFX_Sidehopper0+$10,X : STA.W CorpseRottingGFX_Sidehopper0+$12,Y

+   LDA.W Corpse.rotEntryYOffset : CMP.W #$0008 : BCC +
    CMP.W #$0026 : BPL +
    LDA.W CorpseRottingGFX_Sidehopper0+$20,X : STA.W CorpseRottingGFX_Sidehopper0+$22,Y
    LDA.W CorpseRottingGFX_Sidehopper0+$30,X : STA.W CorpseRottingGFX_Sidehopper0+$32,Y

+   LDA.W Corpse.rotEntryYOffset : CMP.W #$0026 : BPL +
    LDA.W CorpseRottingGFX_Sidehopper0+$40,X : STA.W CorpseRottingGFX_Sidehopper0+$42,Y
    LDA.W CorpseRottingGFX_Sidehopper0+$50,X : STA.W CorpseRottingGFX_Sidehopper0+$52,Y

+   LDA.W Corpse.rotEntryYOffset : CMP.W #$0026 : BPL +
    LDA.W CorpseRottingGFX_Sidehopper0+$60,X : STA.W CorpseRottingGFX_Sidehopper0+$62,Y
    LDA.W CorpseRottingGFX_Sidehopper0+$70,X : STA.W CorpseRottingGFX_Sidehopper0+$72,Y

+   LDA.W Corpse.rotEntryYOffset : CMP.W #$0026 : BPL .return
    LDA.W CorpseRottingGFX_Sidehopper0+$80,X : STA.W CorpseRottingGFX_Sidehopper0+$82,Y
    LDA.W CorpseRottingGFX_Sidehopper0+$90,X : STA.W CorpseRottingGFX_Sidehopper0+$92,Y

  .return:
    RTS


;;; $E564: Corpse rotting rot entry move function - sidehopper - enemy parameter 1 = 2 ;;;
CorpseRottingRotEntry_Move_Sidehopper_Param1_2:
;; Parameters:
;;     X: Source pixel row tile data offset
;;     Y: Destination pixel row tile data offset

; DB must be $7E
; Clears pixel row in dest and copies a pixel row from source to one pixel down in dest

; Tile data calculations:
;     Tiles are 20h bytes
;
;     Pixel (x, y) of tile at pointer p is:
;           ([p + y * 2]       >> 7 - x & 1)
;         | ([p + y * 2 + 1]   >> 7 - x & 1) << 1
;         | ([p + y * 2 + 10h] >> 7 - x & 1) << 2
;         | ([p + y * 2 + 11h] >> 7 - x & 1) << 3
;
;     Hence, pixel row y of tile at pointer p is the bytes
;         [p + y * 2], [p + y * 2 + 1], [p + y * 2 + 10h], [p + y * 2 + 11h]
    LDA.W Corpse.rotEntryYOffset : CMP.W #$0026 : BPL +
    LDA.W CorpseRottingGFX_Sidehopper2,X : STA.W CorpseRottingGFX_Sidehopper2+2,Y
    LDA.W CorpseRottingGFX_Sidehopper2+$10,X : STA.W CorpseRottingGFX_Sidehopper2+$12,Y

+   STZ.W CorpseRottingGFX_Sidehopper2,X : STZ.W CorpseRottingGFX_Sidehopper2+$10,X
    LDA.W Corpse.rotEntryYOffset : CMP.W #$0026 : BPL +
    LDA.W CorpseRottingGFX_Sidehopper2+$20,X : STA.W CorpseRottingGFX_Sidehopper2+$22,Y
    LDA.W CorpseRottingGFX_Sidehopper2+$30,X : STA.W CorpseRottingGFX_Sidehopper2+$32,Y

+   STZ.W CorpseRottingGFX_Sidehopper2+$20,X : STZ.W CorpseRottingGFX_Sidehopper2+$30,X
    LDA.W Corpse.rotEntryYOffset : CMP.W #$0008 : BCC .column3
    CMP.W #$0026 : BPL +
    LDA.W CorpseRottingGFX_Sidehopper2+$40,X : STA.W CorpseRottingGFX_Sidehopper2+$42,Y
    LDA.W CorpseRottingGFX_Sidehopper2+$50,X
    STA.W CorpseRottingGFX_Sidehopper2+$52,Y

+   STZ.W CorpseRottingGFX_Sidehopper2+$40,X : STZ.W CorpseRottingGFX_Sidehopper2+$50,X

  .column3:
    LDA.W Corpse.rotEntryYOffset : CMP.W #$0008 : BCC .column4
    CMP.W #$0026 : BPL +
    LDA.W CorpseRottingGFX_Sidehopper2+$60,X : STA.W CorpseRottingGFX_Sidehopper2+$62,Y
    LDA.W CorpseRottingGFX_Sidehopper2+$70,X : STA.W CorpseRottingGFX_Sidehopper2+$72,Y

+   STZ.W CorpseRottingGFX_Sidehopper2+$60,X : STZ.W CorpseRottingGFX_Sidehopper2+$70,X

  .column4:
    LDA.W Corpse.rotEntryYOffset : CMP.W #$0008 : BCC .return
    CMP.W #$0026 : BPL +
    LDA.W CorpseRottingGFX_Sidehopper2+$80,X : STA.W CorpseRottingGFX_Sidehopper2+$82,Y
    LDA.W CorpseRottingGFX_Sidehopper2+$90,X : STA.W CorpseRottingGFX_Sidehopper2+$92,Y

+   STZ.W CorpseRottingGFX_Sidehopper2+$80,X : STZ.W CorpseRottingGFX_Sidehopper2+$90,X

  .return:
    RTS


;;; $E5F6: Corpse rotting rot entry copy function - sidehopper - enemy parameter 1 = 2 ;;;
CorpseRottingRotEntry_Copy_Sidehopper_Param1_2:
;; Parameters:
;;     X: Source pixel row tile data offset
;;     Y: Destination pixel row tile data offset

; DB must be $7E
; Copies a pixel row from source to one pixel down in dest

; Tile data calculations:
;     Tiles are 20h bytes
;
;     Pixel (x, y) of tile at pointer p is:
;           ([p + y * 2]       >> 7 - x & 1)
;         | ([p + y * 2 + 1]   >> 7 - x & 1) << 1
;         | ([p + y * 2 + 10h] >> 7 - x & 1) << 2
;         | ([p + y * 2 + 11h] >> 7 - x & 1) << 3
;
;     Hence, pixel row y of tile at pointer p is the bytes
;         [p + y * 2], [p + y * 2 + 1], [p + y * 2 + 10h], [p + y * 2 + 11h]
    LDA.W Corpse.rotEntryYOffset : CMP.W #$0026 : BPL +
    LDA.W CorpseRottingGFX_Sidehopper2,X : STA.W CorpseRottingGFX_Sidehopper2+2,Y
    LDA.W CorpseRottingGFX_Sidehopper2+$10,X : STA.W CorpseRottingGFX_Sidehopper2+$12,Y

+   LDA.W Corpse.rotEntryYOffset : CMP.W #$0026 : BPL +
    LDA.W CorpseRottingGFX_Sidehopper2+$20,X : STA.W CorpseRottingGFX_Sidehopper2+$22,Y
    LDA.W CorpseRottingGFX_Sidehopper2+$30,X : STA.W CorpseRottingGFX_Sidehopper2+$32,Y

+   LDA.W Corpse.rotEntryYOffset : CMP.W #$0008 : BCC +
    CMP.W #$0026 : BPL +
    LDA.W CorpseRottingGFX_Sidehopper2+$40,X : STA.W CorpseRottingGFX_Sidehopper2+$42,Y
    LDA.W CorpseRottingGFX_Sidehopper2+$50,X : STA.W CorpseRottingGFX_Sidehopper2+$52,Y

+   LDA.W Corpse.rotEntryYOffset : CMP.W #$0008 : BCC +
    CMP.W #$0026 : BPL +
    LDA.W CorpseRottingGFX_Sidehopper2+$60,X : STA.W CorpseRottingGFX_Sidehopper2+$62,Y
    LDA.W CorpseRottingGFX_Sidehopper2+$70,X : STA.W CorpseRottingGFX_Sidehopper2+$72,Y

+   LDA.W Corpse.rotEntryYOffset : CMP.W #$0008 : BCC .return
    CMP.W #$0026 : BPL .return
    LDA.W CorpseRottingGFX_Sidehopper2+$80,X : STA.W CorpseRottingGFX_Sidehopper2+$82,Y
    LDA.W CorpseRottingGFX_Sidehopper2+$90,X : STA.W CorpseRottingGFX_Sidehopper2+$92,Y

  .return:
    RTS


;;; $E66A: Corpse rotting rot entry move function - zoomer - enemy parameter 1 = 0 ;;;
CorpseRottingRotEntry_Move_Zoomer_Param1_0:
;; Parameters:
;;     X: Source pixel row tile data offset
;;     Y: Destination pixel row tile data offset

; DB must be $7E
; Clears pixel row in dest and copies a pixel row from source to one pixel down in dest

; Tile data calculations:
;     Tiles are 20h bytes
;
;     Pixel (x, y) of tile at pointer p is:
;           ([p + y * 2]       >> 7 - x & 1)
;         | ([p + y * 2 + 1]   >> 7 - x & 1) << 1
;         | ([p + y * 2 + 10h] >> 7 - x & 1) << 2
;         | ([p + y * 2 + 11h] >> 7 - x & 1) << 3
;
;     Hence, pixel row y of tile at pointer p is the bytes
;         [p + y * 2], [p + y * 2 + 1], [p + y * 2 + 10h], [p + y * 2 + 11h]
    LDA.W Corpse.rotEntryYOffset : CMP.W #$000E : BPL +
    LDA.W CorpseRottingGFX_Zoomer0,X : STA.W CorpseRottingGFX_Zoomer0+2,Y
    LDA.W CorpseRottingGFX_Zoomer0+$10,X : STA.W CorpseRottingGFX_Zoomer0+$12,Y

+   STZ.W CorpseRottingGFX_Zoomer0,X : STZ.W CorpseRottingGFX_Zoomer0+$10,X
    LDA.W Corpse.rotEntryYOffset : CMP.W #$000E : BPL +
    LDA.W CorpseRottingGFX_Zoomer0+$20,X : STA.W CorpseRottingGFX_Zoomer0+$22,Y
    LDA.W CorpseRottingGFX_Zoomer0+$30,X : STA.W CorpseRottingGFX_Zoomer0+$32,Y

+   STZ.W CorpseRottingGFX_Zoomer0+$20,X : STZ.W CorpseRottingGFX_Zoomer0+$30,X
    LDA.W Corpse.rotEntryYOffset : CMP.W #$000E : BPL +
    LDA.W CorpseRottingGFX_Zoomer0+$40,X : STA.W CorpseRottingGFX_Zoomer0+$42,Y
    LDA.W CorpseRottingGFX_Zoomer0+$50,X : STA.W CorpseRottingGFX_Zoomer0+$52,Y

+   STZ.W CorpseRottingGFX_Zoomer0+$40,X : STZ.W CorpseRottingGFX_Zoomer0+$50,X
    RTS


;;; $E6B9: Corpse rotting rot entry copy function - zoomer - enemy parameter 1 = 0 ;;;
CorpseRottingRotEntry_Copy_Zoomer_Param1_0:
;; Parameters:
;;     X: Source pixel row tile data offset
;;     Y: Destination pixel row tile data offset

; DB must be $7E
; Copies a pixel row from source to one pixel down in dest

; Tile data calculations:
;     Tiles are 20h bytes
;
;     Pixel (x, y) of tile at pointer p is:
;           ([p + y * 2]       >> 7 - x & 1)
;         | ([p + y * 2 + 1]   >> 7 - x & 1) << 1
;         | ([p + y * 2 + 10h] >> 7 - x & 1) << 2
;         | ([p + y * 2 + 11h] >> 7 - x & 1) << 3
;
;     Hence, pixel row y of tile at pointer p is the bytes
;         [p + y * 2], [p + y * 2 + 1], [p + y * 2 + 10h], [p + y * 2 + 11h]
    LDA.W Corpse.rotEntryYOffset : CMP.W #$000E : BPL +
    LDA.W CorpseRottingGFX_Zoomer0,X : STA.W CorpseRottingGFX_Zoomer0+2,Y
    LDA.W CorpseRottingGFX_Zoomer0+$10,X : STA.W CorpseRottingGFX_Zoomer0+$12,Y

+   LDA.W Corpse.rotEntryYOffset : CMP.W #$000E : BPL +
    LDA.W CorpseRottingGFX_Zoomer0+$20,X : STA.W CorpseRottingGFX_Zoomer0+$22,Y
    LDA.W CorpseRottingGFX_Zoomer0+$30,X : STA.W CorpseRottingGFX_Zoomer0+$32,Y

+   LDA.W Corpse.rotEntryYOffset : CMP.W #$000E : BPL .return
    LDA.W CorpseRottingGFX_Zoomer0+$40,X : STA.W CorpseRottingGFX_Zoomer0+$42,Y
    LDA.W CorpseRottingGFX_Zoomer0+$50,X : STA.W CorpseRottingGFX_Zoomer0+$52,Y

  .return:
    RTS


;;; $E6F6: Corpse rotting rot entry move function - zoomer - enemy parameter 1 = 2 ;;;
CorpseRottingRotEntry_Move_Zoomer_Param1_2:
;; Parameters:
;;     X: Source pixel row tile data offset
;;     Y: Destination pixel row tile data offset

; DB must be $7E
; Clears pixel row in dest and copies a pixel row from source to one pixel down in dest

; Tile data calculations:
;     Tiles are 20h bytes
;
;     Pixel (x, y) of tile at pointer p is:
;           ([p + y * 2]       >> 7 - x & 1)
;         | ([p + y * 2 + 1]   >> 7 - x & 1) << 1
;         | ([p + y * 2 + 10h] >> 7 - x & 1) << 2
;         | ([p + y * 2 + 11h] >> 7 - x & 1) << 3
;
;     Hence, pixel row y of tile at pointer p is the bytes
;         [p + y * 2], [p + y * 2 + 1], [p + y * 2 + 10h], [p + y * 2 + 11h]
    LDA.W Corpse.rotEntryYOffset : CMP.W #$000E : BPL +
    LDA.W CorpseRottingGFX_Zoomer2,X : STA.W CorpseRottingGFX_Zoomer2+2,Y
    LDA.W CorpseRottingGFX_Zoomer2+$10,X : STA.W CorpseRottingGFX_Zoomer2+$12,Y

+   STZ.W CorpseRottingGFX_Zoomer2,X : STZ.W CorpseRottingGFX_Zoomer2+$10,X
    LDA.W Corpse.rotEntryYOffset : CMP.W #$000E : BPL +
    LDA.W CorpseRottingGFX_Zoomer2+$20,X : STA.W CorpseRottingGFX_Zoomer2+$22,Y
    LDA.W CorpseRottingGFX_Zoomer2+$30,X : STA.W CorpseRottingGFX_Zoomer2+$32,Y

+   STZ.W CorpseRottingGFX_Zoomer2+$20,X : STZ.W CorpseRottingGFX_Zoomer2+$30,X
    LDA.W Corpse.rotEntryYOffset : CMP.W #$000E : BPL +
    LDA.W CorpseRottingGFX_Zoomer2+$40,X : STA.W CorpseRottingGFX_Zoomer2+$42,Y
    LDA.W CorpseRottingGFX_Zoomer2+$50,X : STA.W CorpseRottingGFX_Zoomer2+$52,Y

+   STZ.W CorpseRottingGFX_Zoomer2+$40,X : STZ.W CorpseRottingGFX_Zoomer2+$50,X
    RTS


;;; $E745: Corpse rotting rot entry copy function - zoomer - enemy parameter 1 = 2 ;;;
CorpseRottingRotEntry_Copy_Zoomer_Param1_2:
;; Parameters:
;;     X: Source pixel row tile data offset
;;     Y: Destination pixel row tile data offset

; DB must be $7E
; Copies a pixel row from source to one pixel down in dest

; Tile data calculations:
;     Tiles are 20h bytes
;
;     Pixel (x, y) of tile at pointer p is:
;           ([p + y * 2]       >> 7 - x & 1)
;         | ([p + y * 2 + 1]   >> 7 - x & 1) << 1
;         | ([p + y * 2 + 10h] >> 7 - x & 1) << 2
;         | ([p + y * 2 + 11h] >> 7 - x & 1) << 3
;
;     Hence, pixel row y of tile at pointer p is the bytes
;         [p + y * 2], [p + y * 2 + 1], [p + y * 2 + 10h], [p + y * 2 + 11h]
    LDA.W Corpse.rotEntryYOffset : CMP.W #$000E : BPL +
    LDA.W CorpseRottingGFX_Zoomer2,X : STA.W CorpseRottingGFX_Zoomer2+2,Y
    LDA.W CorpseRottingGFX_Zoomer2+$10,X : STA.W CorpseRottingGFX_Zoomer2+$12,Y

+   LDA.W Corpse.rotEntryYOffset : CMP.W #$000E : BPL +
    LDA.W CorpseRottingGFX_Zoomer2+$20,X : STA.W CorpseRottingGFX_Zoomer2+$22,Y
    LDA.W CorpseRottingGFX_Zoomer2+$30,X : STA.W CorpseRottingGFX_Zoomer2+$32,Y

+   LDA.W Corpse.rotEntryYOffset : CMP.W #$000E : BPL .return
    LDA.W CorpseRottingGFX_Zoomer2+$40,X : STA.W CorpseRottingGFX_Zoomer2+$42,Y
    LDA.W CorpseRottingGFX_Zoomer2+$50,X : STA.W CorpseRottingGFX_Zoomer2+$52,Y

  .return:
    RTS


;;; $E782: Corpse rotting rot entry move function - zoomer - enemy parameter 1 = 4 ;;;
CorpseRottingRotEntry_Move_Zoomer_Param1_4:
;; Parameters:
;;     X: Source pixel row tile data offset
;;     Y: Destination pixel row tile data offset

; DB must be $7E
; Clears pixel row in dest and copies a pixel row from source to one pixel down in dest

; Tile data calculations:
;     Tiles are 20h bytes
;
;     Pixel (x, y) of tile at pointer p is:
;           ([p + y * 2]       >> 7 - x & 1)
;         | ([p + y * 2 + 1]   >> 7 - x & 1) << 1
;         | ([p + y * 2 + 10h] >> 7 - x & 1) << 2
;         | ([p + y * 2 + 11h] >> 7 - x & 1) << 3
;
;     Hence, pixel row y of tile at pointer p is the bytes
;         [p + y * 2], [p + y * 2 + 1], [p + y * 2 + 10h], [p + y * 2 + 11h]
    LDA.W Corpse.rotEntryYOffset : CMP.W #$000E : BPL +
    LDA.W CorpseRottingGFX_Zoomer4,X : STA.W CorpseRottingGFX_Zoomer4+2,Y
    LDA.W CorpseRottingGFX_Zoomer4+$10,X : STA.W CorpseRottingGFX_Zoomer4+$12,Y

+   STZ.W CorpseRottingGFX_Zoomer4,X : STZ.W CorpseRottingGFX_Zoomer4+$10,X
    LDA.W Corpse.rotEntryYOffset : CMP.W #$000E : BPL +
    LDA.W CorpseRottingGFX_Zoomer4+$20,X : STA.W CorpseRottingGFX_Zoomer4+$22,Y
    LDA.W CorpseRottingGFX_Zoomer4+$30,X : STA.W CorpseRottingGFX_Zoomer4+$32,Y

+   STZ.W CorpseRottingGFX_Zoomer4+$20,X : STZ.W CorpseRottingGFX_Zoomer4+$30,X
    LDA.W Corpse.rotEntryYOffset : CMP.W #$000E : BPL +
    LDA.W CorpseRottingGFX_Zoomer4+$40,X : STA.W CorpseRottingGFX_Zoomer4+$42,Y
    LDA.W CorpseRottingGFX_Zoomer4+$50,X : STA.W CorpseRottingGFX_Zoomer4+$52,Y

+   STZ.W CorpseRottingGFX_Zoomer4+$40,X : STZ.W CorpseRottingGFX_Zoomer4+$50,X
    RTS


;;; $E7D1: Corpse rotting rot entry copy function - zoomer - enemy parameter 1 = 4 ;;;
CorpseRottingRotEntry_Copy_Zoomer_Param1_4:
;; Parameters:
;;     X: Source pixel row tile data offset
;;     Y: Destination pixel row tile data offset

; DB must be $7E
; Copies a pixel row from source to one pixel down in dest

; Tile data calculations:
;     Tiles are 20h bytes
;
;     Pixel (x, y) of tile at pointer p is:
;           ([p + y * 2]       >> 7 - x & 1)
;         | ([p + y * 2 + 1]   >> 7 - x & 1) << 1
;         | ([p + y * 2 + 10h] >> 7 - x & 1) << 2
;         | ([p + y * 2 + 11h] >> 7 - x & 1) << 3
;
;     Hence, pixel row y of tile at pointer p is the bytes
;         [p + y * 2], [p + y * 2 + 1], [p + y * 2 + 10h], [p + y * 2 + 11h]
    LDA.W Corpse.rotEntryYOffset : CMP.W #$000E : BPL +
    LDA.W CorpseRottingGFX_Zoomer4,X : STA.W CorpseRottingGFX_Zoomer4+2,Y
    LDA.W CorpseRottingGFX_Zoomer4+$10,X : STA.W CorpseRottingGFX_Zoomer4+$12,Y

+   LDA.W Corpse.rotEntryYOffset : CMP.W #$000E : BPL +
    LDA.W CorpseRottingGFX_Zoomer4+$20,X : STA.W CorpseRottingGFX_Zoomer4+$22,Y
    LDA.W CorpseRottingGFX_Zoomer4+$30,X : STA.W CorpseRottingGFX_Zoomer4+$32,Y

+   LDA.W Corpse.rotEntryYOffset : CMP.W #$000E : BPL .return
    LDA.W CorpseRottingGFX_Zoomer4+$40,X : STA.W CorpseRottingGFX_Zoomer4+$42,Y
    LDA.W CorpseRottingGFX_Zoomer4+$50,X : STA.W CorpseRottingGFX_Zoomer4+$52,Y

  .return:
    RTS


;;; $E80E: Corpse rotting rot entry move function - ripper - enemy parameter 1 = 0 ;;;
CorpseRottingRotEntry_Move_Ripper_Param1_0:
;; Parameters:
;;     X: Source pixel row tile data offset
;;     Y: Destination pixel row tile data offset

; DB must be $7E
; Clears pixel row in dest and copies a pixel row from source to one pixel down in dest

; Tile data calculations:
;     Tiles are 20h bytes
;
;     Pixel (x, y) of tile at pointer p is:
;           ([p + y * 2]       >> 7 - x & 1)
;         | ([p + y * 2 + 1]   >> 7 - x & 1) << 1
;         | ([p + y * 2 + 10h] >> 7 - x & 1) << 2
;         | ([p + y * 2 + 11h] >> 7 - x & 1) << 3
;
;     Hence, pixel row y of tile at pointer p is the bytes
;         [p + y * 2], [p + y * 2 + 1], [p + y * 2 + 10h], [p + y * 2 + 11h]
    LDA.W Corpse.rotEntryYOffset : CMP.W #$000E : BPL +
    LDA.W CorpseRottingGFX_Ripper0,X : STA.W CorpseRottingGFX_Ripper0+2,Y
    LDA.W CorpseRottingGFX_Ripper0+$10,X : STA.W CorpseRottingGFX_Ripper0+$12,Y

+   STZ.W CorpseRottingGFX_Ripper0,X : STZ.W CorpseRottingGFX_Ripper0+$10,X
    LDA.W Corpse.rotEntryYOffset : CMP.W #$000E : BPL +
    LDA.W CorpseRottingGFX_Ripper0+$20,X : STA.W CorpseRottingGFX_Ripper0+$22,Y
    LDA.W CorpseRottingGFX_Ripper0+$30,X : STA.W CorpseRottingGFX_Ripper0+$32,Y

+   STZ.W CorpseRottingGFX_Ripper0+$20,X : STZ.W CorpseRottingGFX_Ripper0+$30,X
    LDA.W Corpse.rotEntryYOffset : CMP.W #$000E : BPL +
    LDA.W CorpseRottingGFX_Ripper0+$40,X : STA.W CorpseRottingGFX_Ripper0+$42,Y
    LDA.W CorpseRottingGFX_Ripper0+$50,X : STA.W CorpseRottingGFX_Ripper0+$52,Y

+   STZ.W CorpseRottingGFX_Ripper0+$40,X : STZ.W CorpseRottingGFX_Ripper0+$50,X
    RTS


;;; $E85D: Corpse rotting rot entry copy function - ripper - enemy parameter 1 = 0 ;;;
CorpseRottingRotEntry_Copy_Ripper_Param1_0:
;; Parameters:
;;     X: Source pixel row tile data offset
;;     Y: Destination pixel row tile data offset

; DB must be $7E
; Copies a pixel row from source to one pixel down in dest

; Tile data calculations:
;     Tiles are 20h bytes
;
;     Pixel (x, y) of tile at pointer p is:
;           ([p + y * 2]       >> 7 - x & 1)
;         | ([p + y * 2 + 1]   >> 7 - x & 1) << 1
;         | ([p + y * 2 + 10h] >> 7 - x & 1) << 2
;         | ([p + y * 2 + 11h] >> 7 - x & 1) << 3
;
;     Hence, pixel row y of tile at pointer p is the bytes
;         [p + y * 2], [p + y * 2 + 1], [p + y * 2 + 10h], [p + y * 2 + 11h]
    LDA.W Corpse.rotEntryYOffset : CMP.W #$000E : BPL +
    LDA.W CorpseRottingGFX_Ripper0,X : STA.W CorpseRottingGFX_Ripper0+2,Y
    LDA.W CorpseRottingGFX_Ripper0+$10,X : STA.W CorpseRottingGFX_Ripper0+$12,Y

+   LDA.W Corpse.rotEntryYOffset : CMP.W #$000E : BPL +
    LDA.W CorpseRottingGFX_Ripper0+$20,X : STA.W CorpseRottingGFX_Ripper0+$22,Y
    LDA.W CorpseRottingGFX_Ripper0+$30,X : STA.W CorpseRottingGFX_Ripper0+$32,Y

+   LDA.W Corpse.rotEntryYOffset : CMP.W #$000E : BPL .return
    LDA.W CorpseRottingGFX_Ripper0+$40,X : STA.W CorpseRottingGFX_Ripper0+$42,Y
    LDA.W CorpseRottingGFX_Ripper0+$50,X : STA.W CorpseRottingGFX_Ripper0+$52,Y

  .return:
    RTS


;;; $E89A: Corpse rotting rot entry move function - ripper - enemy parameter 1 = 2 ;;;
CorpseRottingRotEntry_Move_Ripper_Param1_2:
;; Parameters:
;;     X: Source pixel row tile data offset
;;     Y: Destination pixel row tile data offset

; DB must be $7E
; Clears pixel row in dest and copies a pixel row from source to one pixel down in dest

; Tile data calculations:
;     Tiles are 20h bytes
;
;     Pixel (x, y) of tile at pointer p is:
;           ([p + y * 2]       >> 7 - x & 1)
;         | ([p + y * 2 + 1]   >> 7 - x & 1) << 1
;         | ([p + y * 2 + 10h] >> 7 - x & 1) << 2
;         | ([p + y * 2 + 11h] >> 7 - x & 1) << 3
;
;     Hence, pixel row y of tile at pointer p is the bytes
;         [p + y * 2], [p + y * 2 + 1], [p + y * 2 + 10h], [p + y * 2 + 11h]
    LDA.W Corpse.rotEntryYOffset : CMP.W #$000E : BPL +
    LDA.W CorpseRottingGFX_Ripper2,X : STA.W CorpseRottingGFX_Ripper2+2,Y
    LDA.W CorpseRottingGFX_Ripper2+$10,X : STA.W CorpseRottingGFX_Ripper2+$12,Y

+   STZ.W CorpseRottingGFX_Ripper2,X : STZ.W CorpseRottingGFX_Ripper2+$10,X
    LDA.W Corpse.rotEntryYOffset : CMP.W #$000E : BPL +
    LDA.W CorpseRottingGFX_Ripper2+$20,X : STA.W CorpseRottingGFX_Ripper2+$22,Y
    LDA.W CorpseRottingGFX_Ripper2+$30,X : STA.W CorpseRottingGFX_Ripper2+$32,Y

+   STZ.W CorpseRottingGFX_Ripper2+$20,X : STZ.W CorpseRottingGFX_Ripper2+$30,X
    LDA.W Corpse.rotEntryYOffset : CMP.W #$000E : BPL +
    LDA.W CorpseRottingGFX_Ripper2+$40,X : STA.W CorpseRottingGFX_Ripper2+$42,Y
    LDA.W CorpseRottingGFX_Ripper2+$50,X : STA.W CorpseRottingGFX_Ripper2+$52,Y

+   STZ.W CorpseRottingGFX_Ripper2+$40,X : STZ.W CorpseRottingGFX_Ripper2+$50,X
    RTS


;;; $E8E9: Corpse rotting rot entry copy function - ripper - enemy parameter 1 = 2 ;;;
CorpseRottingRotEntry_Copy_Ripper_Param1_2:
;; Parameters:
;;     X: Source pixel row tile data offset
;;     Y: Destination pixel row tile data offset

; DB must be $7E
; Copies a pixel row from source to one pixel down in dest

; Tile data calculations:
;     Tiles are 20h bytes
;
;     Pixel (x, y) of tile at pointer p is:
;           ([p + y * 2]       >> 7 - x & 1)
;         | ([p + y * 2 + 1]   >> 7 - x & 1) << 1
;         | ([p + y * 2 + 10h] >> 7 - x & 1) << 2
;         | ([p + y * 2 + 11h] >> 7 - x & 1) << 3
;
;     Hence, pixel row y of tile at pointer p is the bytes
;         [p + y * 2], [p + y * 2 + 1], [p + y * 2 + 10h], [p + y * 2 + 11h]
    LDA.W Corpse.rotEntryYOffset : CMP.W #$000E : BPL +
    LDA.W CorpseRottingGFX_Ripper2,X : STA.W CorpseRottingGFX_Ripper2+2,Y
    LDA.W CorpseRottingGFX_Ripper2+$10,X : STA.W CorpseRottingGFX_Ripper2+$12,Y

+   LDA.W Corpse.rotEntryYOffset : CMP.W #$000E : BPL +
    LDA.W CorpseRottingGFX_Ripper2+$20,X : STA.W CorpseRottingGFX_Ripper2+$22,Y
    LDA.W CorpseRottingGFX_Ripper2+$30,X : STA.W CorpseRottingGFX_Ripper2+$32,Y

+   LDA.W Corpse.rotEntryYOffset : CMP.W #$000E : BPL .return
    LDA.W CorpseRottingGFX_Ripper2+$40,X : STA.W CorpseRottingGFX_Ripper2+$42,Y
    LDA.W CorpseRottingGFX_Ripper2+$50,X : STA.W CorpseRottingGFX_Ripper2+$52,Y

  .return:
    RTS


;;; $E926: Corpse rotting rot entry move function - skree - enemy parameter 1 = 0 ;;;
CorpseRottingRotEntry_Move_Skree_Param1_0:
;; Parameters:
;;     X: Source pixel row tile data offset
;;     Y: Destination pixel row tile data offset

; DB must be $7E
; Clears pixel row in dest and copies a pixel row from source to one pixel down in dest

; Tile data calculations:
;     Tiles are 20h bytes
;
;     Pixel (x, y) of tile at pointer p is:
;           ([p + y * 2]       >> 7 - x & 1)
;         | ([p + y * 2 + 1]   >> 7 - x & 1) << 1
;         | ([p + y * 2 + 10h] >> 7 - x & 1) << 2
;         | ([p + y * 2 + 11h] >> 7 - x & 1) << 3
;
;     Hence, pixel row y of tile at pointer p is the bytes
;         [p + y * 2], [p + y * 2 + 1], [p + y * 2 + 10h], [p + y * 2 + 11h]
    LDA.W Corpse.rotEntryYOffset : CMP.W #$001E : BPL +
    LDA.W CorpseRottingGFX_Skree0,X : STA.W CorpseRottingGFX_Skree0+2,Y
    LDA.W CorpseRottingGFX_Skree0+$10,X : STA.W CorpseRottingGFX_Skree0+$12,Y

+   STZ.W CorpseRottingGFX_Skree0,X : STZ.W CorpseRottingGFX_Skree0+$10,X
    LDA.W Corpse.rotEntryYOffset : CMP.W #$001E : BPL +
    LDA.W CorpseRottingGFX_Skree0+$20,X : STA.W CorpseRottingGFX_Skree0+$22,Y
    LDA.W CorpseRottingGFX_Skree0+$30,X : STA.W CorpseRottingGFX_Skree0+$32,Y

+   STZ.W CorpseRottingGFX_Skree0+$20,X : STZ.W CorpseRottingGFX_Skree0+$30,X
    RTS


;;; $E95B: Corpse rotting rot entry copy function - skree - enemy parameter 1 = 0 ;;;
CorpseRottingRotEntry_Copy_Skree_Param1_0:
;; Parameters:
;;     X: Source pixel row tile data offset
;;     Y: Destination pixel row tile data offset

; DB must be $7E
; Copies a pixel row from source to one pixel down in dest

; Tile data calculations:
;     Tiles are 20h bytes
;
;     Pixel (x, y) of tile at pointer p is:
;           ([p + y * 2]       >> 7 - x & 1)
;         | ([p + y * 2 + 1]   >> 7 - x & 1) << 1
;         | ([p + y * 2 + 10h] >> 7 - x & 1) << 2
;         | ([p + y * 2 + 11h] >> 7 - x & 1) << 3
;
;     Hence, pixel row y of tile at pointer p is the bytes
;         [p + y * 2], [p + y * 2 + 1], [p + y * 2 + 10h], [p + y * 2 + 11h]
    LDA.W Corpse.rotEntryYOffset : CMP.W #$001E : BPL +
    LDA.W CorpseRottingGFX_Skree0,X : STA.W CorpseRottingGFX_Skree0+2,Y
    LDA.W CorpseRottingGFX_Skree0+$10,X : STA.W CorpseRottingGFX_Skree0+$12,Y

+   LDA.W Corpse.rotEntryYOffset : CMP.W #$001E : BPL .return
    LDA.W CorpseRottingGFX_Skree0+$20,X : STA.W CorpseRottingGFX_Skree0+$22,Y
    LDA.W CorpseRottingGFX_Skree0+$30,X : STA.W CorpseRottingGFX_Skree0+$32,Y

  .return:
    RTS


;;; $E984: Corpse rotting rot entry move function - skree - enemy parameter 1 = 2 ;;;
CorpseRottingRotEntry_Move_Skree_Param1_2:
;; Parameters:
;;     X: Source pixel row tile data offset
;;     Y: Destination pixel row tile data offset

; DB must be $7E
; Clears pixel row in dest and copies a pixel row from source to one pixel down in dest

; Tile data calculations:
;     Tiles are 20h bytes
;
;     Pixel (x, y) of tile at pointer p is:
;           ([p + y * 2]       >> 7 - x & 1)
;         | ([p + y * 2 + 1]   >> 7 - x & 1) << 1
;         | ([p + y * 2 + 10h] >> 7 - x & 1) << 2
;         | ([p + y * 2 + 11h] >> 7 - x & 1) << 3
;
;     Hence, pixel row y of tile at pointer p is the bytes
;         [p + y * 2], [p + y * 2 + 1], [p + y * 2 + 10h], [p + y * 2 + 11h]
    LDA.W Corpse.rotEntryYOffset : CMP.W #$001E : BPL +
    LDA.W CorpseRottingGFX_Skree2,X : STA.W CorpseRottingGFX_Skree2+2,Y
    LDA.W CorpseRottingGFX_Skree2+$10,X : STA.W CorpseRottingGFX_Skree2+$12,Y

+   STZ.W CorpseRottingGFX_Skree2,X : STZ.W CorpseRottingGFX_Skree2+$10,X
    LDA.W Corpse.rotEntryYOffset : CMP.W #$001E : BPL +
    LDA.W CorpseRottingGFX_Skree2+$20,X : STA.W CorpseRottingGFX_Skree2+$22,Y
    LDA.W CorpseRottingGFX_Skree2+$30,X : STA.W CorpseRottingGFX_Skree2+$32,Y

+   STZ.W CorpseRottingGFX_Skree2+$20,X : STZ.W CorpseRottingGFX_Skree2+$30,X
    RTS


;;; $E9B9: Corpse rotting rot entry copy function - skree - enemy parameter 1 = 2 ;;;
CorpseRottingRotEntry_Copy_Skree_Param1_2:
;; Parameters:
;;     X: Source pixel row tile data offset
;;     Y: Destination pixel row tile data offset

; DB must be $7E
; Copies a pixel row from source to one pixel down in dest

; Tile data calculations:
;     Tiles are 20h bytes
;
;     Pixel (x, y) of tile at pointer p is:
;           ([p + y * 2]       >> 7 - x & 1)
;         | ([p + y * 2 + 1]   >> 7 - x & 1) << 1
;         | ([p + y * 2 + 10h] >> 7 - x & 1) << 2
;         | ([p + y * 2 + 11h] >> 7 - x & 1) << 3
;
;     Hence, pixel row y of tile at pointer p is the bytes
;         [p + y * 2], [p + y * 2 + 1], [p + y * 2 + 10h], [p + y * 2 + 11h]
    LDA.W Corpse.rotEntryYOffset : CMP.W #$001E : BPL +
    LDA.W CorpseRottingGFX_Skree2,X : STA.W CorpseRottingGFX_Skree2+2,Y
    LDA.W CorpseRottingGFX_Skree2+$10,X : STA.W CorpseRottingGFX_Skree2+$12,Y

+   LDA.W Corpse.rotEntryYOffset : CMP.W #$001E : BPL .return
    LDA.W CorpseRottingGFX_Skree2+$20,X : STA.W CorpseRottingGFX_Skree2+$22,Y
    LDA.W CorpseRottingGFX_Skree2+$30,X : STA.W CorpseRottingGFX_Skree2+$32,Y

  .return:
    RTS


;;; $E9E2: Corpse rotting rot entry move function - skree - enemy parameter 1 = 4 ;;;
CorpseRottingRotEntry_Move_Skree_Param1_4:
;; Parameters:
;;     X: Source pixel row tile data offset
;;     Y: Destination pixel row tile data offset

; DB must be $7E
; Clears pixel row in dest and copies a pixel row from source to one pixel down in dest

; Tile data calculations:
;     Tiles are 20h bytes
;
;     Pixel (x, y) of tile at pointer p is:
;           ([p + y * 2]       >> 7 - x & 1)
;         | ([p + y * 2 + 1]   >> 7 - x & 1) << 1
;         | ([p + y * 2 + 10h] >> 7 - x & 1) << 2
;         | ([p + y * 2 + 11h] >> 7 - x & 1) << 3
;
;     Hence, pixel row y of tile at pointer p is the bytes
;         [p + y * 2], [p + y * 2 + 1], [p + y * 2 + 10h], [p + y * 2 + 11h]
    LDA.W Corpse.rotEntryYOffset : CMP.W #$001E : BPL +
    LDA.W CorpseRottingGFX_Skree4,X : STA.W CorpseRottingGFX_Skree4+2,Y
    LDA.W CorpseRottingGFX_Skree4+$10,X : STA.W CorpseRottingGFX_Skree4+$12,Y

+   STZ.W CorpseRottingGFX_Skree4,X : STZ.W CorpseRottingGFX_Skree4+$10,X
    LDA.W Corpse.rotEntryYOffset : CMP.W #$001E : BPL +
    LDA.W CorpseRottingGFX_Skree4+$20,X : STA.W CorpseRottingGFX_Skree4+$22,Y
    LDA.W CorpseRottingGFX_Skree4+$30,X : STA.W CorpseRottingGFX_Skree4+$32,Y

+   STZ.W CorpseRottingGFX_Skree4+$20,X : STZ.W CorpseRottingGFX_Skree4+$30,X
    RTS


;;; $EA17: Corpse rotting rot entry copy function - skree - enemy parameter 1 = 4 ;;;
CorpseRottingRotEntry_Copy_Skree_Param1_4:
;; Parameters:
;;     X: Source pixel row tile data offset
;;     Y: Destination pixel row tile data offset

; DB must be $7E
; Copies a pixel row from source to one pixel down in dest

; Tile data calculations:
;     Tiles are 20h bytes
;
;     Pixel (x, y) of tile at pointer p is:
;           ([p + y * 2]       >> 7 - x & 1)
;         | ([p + y * 2 + 1]   >> 7 - x & 1) << 1
;         | ([p + y * 2 + 10h] >> 7 - x & 1) << 2
;         | ([p + y * 2 + 11h] >> 7 - x & 1) << 3
;
;     Hence, pixel row y of tile at pointer p is the bytes
;         [p + y * 2], [p + y * 2 + 1], [p + y * 2 + 10h], [p + y * 2 + 11h]
    LDA.W Corpse.rotEntryYOffset : CMP.W #$001E : BPL +
    LDA.W CorpseRottingGFX_Skree4,X : STA.W CorpseRottingGFX_Skree4+2,Y
    LDA.W CorpseRottingGFX_Skree4+$10,X : STA.W CorpseRottingGFX_Skree4+$12,Y

+   LDA.W Corpse.rotEntryYOffset : CMP.W #$001E : BPL .return
    LDA.W CorpseRottingGFX_Skree4+$20,X : STA.W CorpseRottingGFX_Skree4+$22,Y
    LDA.W CorpseRottingGFX_Skree4+$30,X : STA.W CorpseRottingGFX_Skree4+$32,Y

  .return:
    RTS


;;; $EA40: Corpse rotting rot entry move function - Mother Brain ;;;
CorpseRottingRotEntry_Move_MotherBrain:
;; Parameters:
;;     X: Source pixel row tile data offset
;;     Y: Destination pixel row tile data offset

; DB must be $7E
; Clears pixel row in dest and copies a pixel row from source to one pixel down in dest

; Tile data calculations:
;     Tiles are 20h bytes
;
;     Pixel (x, y) of tile at pointer p is:
;           ([p + y * 2]       >> 7 - x & 1)
;         | ([p + y * 2 + 1]   >> 7 - x & 1) << 1
;         | ([p + y * 2 + 10h] >> 7 - x & 1) << 2
;         | ([p + y * 2 + 11h] >> 7 - x & 1) << 3
;
;     Hence, pixel row y of tile at pointer p is the bytes
;         [p + y * 2], [p + y * 2 + 1], [p + y * 2 + 10h], [p + y * 2 + 11h]

; Column 0 is only used by rows 2..5
; Column 1 is only used by rows 1..5
; Column 5 is only used by rows 1..5
; Column 6 is only used by rows 4..5
; (See $B7:CE00 right side)
    LDA.W Corpse.rotEntryYOffset : CMP.W #$0010 : BCC .column1
    CMP.W #$002E : BPL +
    LDA.W MotherBrainCorpseRottingGFX,X : STA.W MotherBrainCorpseRottingGFX+2,Y
    LDA.W MotherBrainCorpseRottingGFX+$10,X : STA.W MotherBrainCorpseRottingGFX+$12,Y

+   STZ.W MotherBrainCorpseRottingGFX,X : STZ.W MotherBrainCorpseRottingGFX+$10,X

  .column1:
    LDA.W Corpse.rotEntryYOffset : CMP.W #$0008 : BCC .column2
    CMP.W #$002E : BPL +
    LDA.W MotherBrainCorpseRottingGFX+$20,X : STA.W MotherBrainCorpseRottingGFX+$22,Y
    LDA.W MotherBrainCorpseRottingGFX+$30,X : STA.W MotherBrainCorpseRottingGFX+$32,Y

+   STZ.W MotherBrainCorpseRottingGFX+$20,X : STZ.W MotherBrainCorpseRottingGFX+$30,X

  .column2:
    LDA.W Corpse.rotEntryYOffset : CMP.W #$002E : BPL +
    LDA.W MotherBrainCorpseRottingGFX+$40,X : STA.W MotherBrainCorpseRottingGFX+$42,Y
    LDA.W MotherBrainCorpseRottingGFX+$50,X : STA.W MotherBrainCorpseRottingGFX+$52,Y

+   STZ.W MotherBrainCorpseRottingGFX+$40,X : STZ.W MotherBrainCorpseRottingGFX+$50,X
    LDA.W Corpse.rotEntryYOffset : CMP.W #$002E : BPL +
    LDA.W MotherBrainCorpseRottingGFX+$60,X : STA.W MotherBrainCorpseRottingGFX+$62,Y
    LDA.W MotherBrainCorpseRottingGFX+$70,X : STA.W MotherBrainCorpseRottingGFX+$72,Y

+   STZ.W MotherBrainCorpseRottingGFX+$60,X : STZ.W MotherBrainCorpseRottingGFX+$70,X
    LDA.W Corpse.rotEntryYOffset : CMP.W #$002E : BPL +
    LDA.W MotherBrainCorpseRottingGFX+$80,X : STA.W MotherBrainCorpseRottingGFX+$82,Y
    LDA.W MotherBrainCorpseRottingGFX+$90,X : STA.W MotherBrainCorpseRottingGFX+$92,Y

+   STZ.W MotherBrainCorpseRottingGFX+$80,X : STZ.W MotherBrainCorpseRottingGFX+$90,X
    LDA.W Corpse.rotEntryYOffset : CMP.W #$0008 : BCC .column6
    CMP.W #$002E : BPL +
    LDA.W MotherBrainCorpseRottingGFX+$A0,X : STA.W MotherBrainCorpseRottingGFX+$A2,Y
    LDA.W MotherBrainCorpseRottingGFX+$B0,X : STA.W MotherBrainCorpseRottingGFX+$B2,Y

+   STZ.W MotherBrainCorpseRottingGFX+$A0,X : STZ.W MotherBrainCorpseRottingGFX+$B0,X

  .column6:
    LDA.W Corpse.rotEntryYOffset : CMP.W #$0020 : BCC .return
    CMP.W #$002E : BPL +
    LDA.W MotherBrainCorpseRottingGFX+$C0,X : STA.W MotherBrainCorpseRottingGFX+$C2,Y
    LDA.W MotherBrainCorpseRottingGFX+$D0,X : STA.W MotherBrainCorpseRottingGFX+$D2,Y

+   STZ.W MotherBrainCorpseRottingGFX+$C0,X : STZ.W MotherBrainCorpseRottingGFX+$D0,X

  .return:
    RTS


;;; $EB0B: Corpse rotting rot entry copy function - Mother Brain ;;;
CorpseRottingRotEntry_Copy_MotherBrain:
;; Parameters:
;;     X: Source pixel row tile data offset
;;     Y: Destination pixel row tile data offset

; DB must be $7E
; Copies a pixel row from source to one pixel down in dest

; Tile data calculations:
;     Tiles are 20h bytes
;
;     Pixel (x, y) of tile at pointer p is:
;           ([p + y * 2]       >> 7 - x & 1)
;         | ([p + y * 2 + 1]   >> 7 - x & 1) << 1
;         | ([p + y * 2 + 10h] >> 7 - x & 1) << 2
;         | ([p + y * 2 + 11h] >> 7 - x & 1) << 3
;
;     Hence, pixel row y of tile at pointer p is the bytes
;         [p + y * 2], [p + y * 2 + 1], [p + y * 2 + 10h], [p + y * 2 + 11h]

; Column 0 is only used by rows 2..5
; Column 1 is only used by rows 1..5
; Column 5 is only used by rows 1..5
; Column 6 is only used by rows 4..5
; (See $B7:CE00 right side)
    LDA.W Corpse.rotEntryYOffset : CMP.W #$0010 : BCC +
    CMP.W #$002E : BPL +
    LDA.W MotherBrainCorpseRottingGFX,X : STA.W MotherBrainCorpseRottingGFX+2,Y
    LDA.W MotherBrainCorpseRottingGFX+$10,X : STA.W MotherBrainCorpseRottingGFX+$12,Y

+   LDA.W Corpse.rotEntryYOffset : CMP.W #$0008 : BCC +
    CMP.W #$002E : BPL +
    LDA.W MotherBrainCorpseRottingGFX+$20,X : STA.W MotherBrainCorpseRottingGFX+$22,Y
    LDA.W MotherBrainCorpseRottingGFX+$30,X : STA.W MotherBrainCorpseRottingGFX+$32,Y

+   LDA.W Corpse.rotEntryYOffset : CMP.W #$002E : BPL +
    LDA.W MotherBrainCorpseRottingGFX+$40,X : STA.W MotherBrainCorpseRottingGFX+$42,Y
    LDA.W MotherBrainCorpseRottingGFX+$50,X : STA.W MotherBrainCorpseRottingGFX+$52,Y

+   LDA.W Corpse.rotEntryYOffset : CMP.W #$002E : BPL +
    LDA.W MotherBrainCorpseRottingGFX+$60,X : STA.W MotherBrainCorpseRottingGFX+$62,Y
    LDA.W MotherBrainCorpseRottingGFX+$70,X : STA.W MotherBrainCorpseRottingGFX+$72,Y

+   LDA.W Corpse.rotEntryYOffset : CMP.W #$002E : BPL +
    LDA.W MotherBrainCorpseRottingGFX+$80,X : STA.W MotherBrainCorpseRottingGFX+$82,Y
    LDA.W MotherBrainCorpseRottingGFX+$90,X : STA.W MotherBrainCorpseRottingGFX+$92,Y

+   LDA.W Corpse.rotEntryYOffset : CMP.W #$0008 : BCC +
    CMP.W #$002E : BPL +
    LDA.W MotherBrainCorpseRottingGFX+$A0,X : STA.W MotherBrainCorpseRottingGFX+$A2,Y
    LDA.W MotherBrainCorpseRottingGFX+$B0,X : STA.W MotherBrainCorpseRottingGFX+$B2,Y

+   LDA.W Corpse.rotEntryYOffset : CMP.W #$0020 : BCC .return
    CMP.W #$002E : BPL .return
    LDA.W MotherBrainCorpseRottingGFX+$C0,X : STA.W MotherBrainCorpseRottingGFX+$C2,Y
    LDA.W MotherBrainCorpseRottingGFX+$D0,X : STA.W MotherBrainCorpseRottingGFX+$D2,Y

  .return:
    RTS


;;; $EBAC: Palette - enemy $EDBF (sidehopper, part 2) ;;;
Palette_CorpseSidehopper2:
; This palette is loaded by the enemy set of the Baby Metroid room, but that palette is overwritten by Baby Metroid init AI, making this effectively unused
    dw $3800,$4EDA,$3A35,$2990,$14EB,$77E9,$5706,$3A44
    dw $1D62,$2FBA,$22F6,$1A33,$1170,$08CD,$639F,$0446


;;; $EBCC: Palettes - sidehopper corpse being drained ;;;
Palette_SidehopperCorpseBeingDrained_0:
    dw $3800,$7FFF,$56E0,$3180,$18C0,$6BC0,$5EC0,$4A20
    dw $35A0,$7FFF,$039C,$0237,$00D1,$03FF,$0237,$00D1

Palette_SidehopperCorpseBeingDrained_1:
    dw $3800,$77DF,$52C5,$2962,$14A1,$67A5,$56A4,$4203
    dw $3182,$77FF,$0F7B,$01F4,$00CF,$037B,$01F3,$00AF

Palette_SidehopperCorpseBeingDrained_2:
    dw $3800,$6FBF,$4ECA,$2544,$10A2,$5F8B,$4E88,$3DE6
    dw $2D85,$6FFF,$1B5A,$05D1,$00CC,$06D6,$0190,$00AC

Palette_SidehopperCorpseBeingDrained_3:
    dw $3800,$6BBF,$4AAE,$1D05,$0C83,$5B50,$466C,$35EA
    dw $2567,$67FF,$2B39,$058F,$00AA,$0652,$014C,$048A

Palette_SidehopperCorpseBeingDrained_4:
    dw $3800,$639F,$46B3,$18E7,$0884,$5336,$3E50,$31CD
    dw $216A,$5FFF,$3718,$096C,$00A7,$09AD,$00E9,$0487

Palette_SidehopperCorpseBeingDrained_5:
    dw $3800,$5B7F,$4298,$10C9,$0465,$4F1B,$3634,$29B0
    dw $1D4C,$57FF,$42F7,$0929,$00A5,$0929,$00A5,$0465

Palette_SidehopperCorpseBeingDrained_6:
    dw $3800,$57FF,$42F7,$0929,$00A5,$7FFF,$4231,$0043
    dw $4B3F,$42DB,$3678,$2E14,$2190,$192C,$0CC9,$0465


;;; $ECAC: Instruction list - sidehopper corpse - alive - hopping ;;;
InstList_CorpseSidehopper_Alive_Hopping:
    dw $0002,Spritemap_CorpseSidehopper_Alive_0
    dw $0004,Spritemap_CorpseSidehopper_Alive_1
    dw $0005,Spritemap_CorpseSidehopper_Alive_0
    dw $0030,Spritemap_CorpseSidehopper_Alive_1
    dw $0005,Spritemap_CorpseSidehopper_Alive_0
    dw $0004,Spritemap_CorpseSidehopper_Alive_1
    dw $0005,Spritemap_CorpseSidehopper_Alive_0
    dw $0004,Spritemap_CorpseSidehopper_Alive_1
    dw Instruction_SidehopperCorpse_EndHop
    dw Instruction_Common_Sleep


;;; $ECD0: Instruction - end hop ;;;
Instruction_SidehopperCorpse_EndHop:
    PHY
    LDY.W #Function_CorpseSidehopper_StartIdling
    LDA.L CorpseSidehopper.drainedPaletteIndex,X : BEQ .setFunctionPointerInY
    LDY.W #Function_CorpseSidehopper_BeingDrained

  .setFunctionPointerInY:
    TYA : STA.W CorpseSidehopper.function,X
    PLY
    RTL


;;; $ECE3: Instruction list - sidehopper corpse - alive - idle ;;;
InstList_CorpseSidehopper_Alive_Idle:
    dw $0001,Spritemap_CorpseSidehopper_Alive_2
    dw Instruction_Common_Sleep


;;; $ECE9: Instruction list - sidehopper corpse - alive - corpse ;;;
InstList_CorpseSidehopper_Alive_Corpse:
    dw $0001,Spritemap_CorpseSidehopper_Dead_0
    dw Instruction_Common_Sleep


;;; $ECEF: Instruction list - sidehopper corpse - dead ;;;
InstList_CorpseSidehopper_Alive_Dead:
    dw $0001,Spritemap_CorpseSidehopper_Dead_1
    dw Instruction_Common_Sleep


;;; $ECF5: Instruction list - zoomer corpse - enemy parameter 1 = 0 ;;;
InstList_CorpseZoomer_Param1_0:
    dw $0001,Spritemap_CorpseZoomer_0
    dw Instruction_Common_Sleep


;;; $ECFB: Instruction list - zoomer corpse - enemy parameter 1 = 2 ;;;
InstList_CorpseZoomer_Param1_2:
    dw $0001,Spritemap_CorpseZoomer_1
    dw Instruction_Common_Sleep


;;; $ED01: Instruction list - zoomer corpse - enemy parameter 1 = 4 ;;;
InstList_CorpseZoomer_Param1_4:
    dw $0001,Spritemap_CorpseZoomer_2
    dw Instruction_Common_Sleep


;;; $ED07: Instruction list - ripper corpse - enemy parameter 1 = 0 ;;;
InstList_CorpseRipper_Param1_0:
    dw $0001,Spritemap_CorpseRipper_0
    dw Instruction_Common_Sleep


;;; $ED0D: Instruction list - ripper corpse - enemy parameter 1 = 2 ;;;
InstList_CorpseRipper_Param1_2:
    dw $0001,Spritemap_CorpseRipper_1
    dw Instruction_Common_Sleep


;;; $ED13: Instruction list - skree corpse - enemy parameter 1 = 0 ;;;
InstList_CorpseSkree_Param1_0:
    dw $0001,Spritemap_CorpseSkree_0
    dw Instruction_Common_Sleep


;;; $ED19: Instruction list - skree corpse - enemy parameter 1 = 2 ;;;
InstList_CorpseSkree_Param1_2:
    dw $0001,Spritemap_CorpseSkree_1
    dw Instruction_Common_Sleep


;;; $ED1F: Instruction list - skree corpse - enemy parameter 1 = 4 ;;;
InstList_CorpseSkree_Param1_4:
    dw $0001,Spritemap_CorpseSkree_2
    dw Instruction_Common_Sleep


;;; $ED25: Dead monster spritemaps ;;;
Spritemap_CorpseSidehopper_Dead_0:
    dw $0008
    %spritemapEntry(1, $420C, $02, 0, 1, 2, 0, $130)
    %spritemapEntry(1, $420C, $F2, 0, 1, 2, 0, $110)
    %spritemapEntry(1, $43FC, $FA, 0, 0, 2, 0, $123)
    %spritemapEntry(1, $43FC, $EA, 0, 0, 2, 0, $103)
    %spritemapEntry(1, $43F4, $FA, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $43F4, $EA, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $43E4, $02, 0, 0, 2, 0, $130)
    %spritemapEntry(1, $43E4, $F2, 0, 0, 2, 0, $110)

Spritemap_CorpseSidehopper_Dead_1:
    dw $0008
    %spritemapEntry(1, $420C, $FE, 0, 1, 2, 0, $129)
    %spritemapEntry(1, $420C, $EE, 0, 1, 2, 0, $109)
    %spritemapEntry(1, $43F4, $06, 0, 0, 2, 0, $13B)
    %spritemapEntry(1, $43F4, $F6, 0, 0, 2, 0, $11B)
    %spritemapEntry(1, $43FC, $06, 0, 0, 2, 0, $13C)
    %spritemapEntry(1, $43FC, $F6, 0, 0, 2, 0, $11C)
    %spritemapEntry(1, $43E4, $FE, 0, 0, 2, 0, $129)
    %spritemapEntry(1, $43E4, $EE, 0, 0, 2, 0, $109)

Spritemap_CorpseZoomer_0:
    dw $0002
    %spritemapEntry(1, $43FC, $F8, 0, 0, 2, 0, $154)
    %spritemapEntry(1, $43F4, $F8, 0, 0, 2, 0, $153)

Spritemap_CorpseZoomer_1:
    dw $0002
    %spritemapEntry(1, $43FC, $F8, 0, 0, 2, 0, $157)
    %spritemapEntry(1, $43F4, $F8, 0, 0, 2, 0, $156)

Spritemap_CorpseZoomer_2:
    dw $0002
    %spritemapEntry(1, $43FC, $F8, 0, 0, 2, 0, $15A)
    %spritemapEntry(1, $43F4, $F8, 0, 0, 2, 0, $159)

Spritemap_CorpseRipper_0:
    dw $0002
    %spritemapEntry(1, $43FC, $F8, 0, 0, 2, 0, $151)
    %spritemapEntry(1, $43F4, $F8, 0, 0, 2, 0, $150)

Spritemap_CorpseRipper_1:
    dw $0002
    %spritemapEntry(1, $43FC, $F8, 0, 0, 2, 0, $15D)
    %spritemapEntry(1, $43F4, $F8, 0, 0, 2, 0, $15C)

Spritemap_CorpseSkree_0:
    dw $0004
    %spritemapEntry(1, $43FC, $04, 0, 1, 3, 0, $135)
    %spritemapEntry(1, $43FC, $F4, 0, 1, 3, 0, $115)
    %spritemapEntry(1, $43F4, $04, 0, 0, 3, 0, $135)
    %spritemapEntry(1, $43F4, $F4, 0, 0, 3, 0, $115)

Spritemap_CorpseSkree_1:
    dw $0004
    %spritemapEntry(1, $43FC, $04, 0, 1, 3, 0, $127)
    %spritemapEntry(1, $43FC, $F4, 0, 1, 3, 0, $107)
    %spritemapEntry(1, $43F4, $04, 0, 0, 3, 0, $127)
    %spritemapEntry(1, $43F4, $F4, 0, 0, 3, 0, $107)

Spritemap_CorpseSkree_2:
    dw $0004
    %spritemapEntry(1, $43FC, $04, 0, 1, 3, 0, $12E)
    %spritemapEntry(1, $43FC, $F4, 0, 1, 3, 0, $10E)
    %spritemapEntry(1, $43F4, $04, 0, 0, 3, 0, $12E)
    %spritemapEntry(1, $43F4, $F4, 0, 0, 3, 0, $10E)

if !FEATURE_KEEP_UNREFERENCED
UNUSED_Spritemap_Corpse_A9EDF7:
    dw $000A
    %spritemapEntry(0, $0C, $FC, 0, 0, 2, 7, $10C)
    %spritemapEntry(0, $14, $FC, 0, 0, 2, 7, $10D)
    %spritemapEntry(0, $04, $FC, 0, 0, 2, 7, $10B)
    %spritemapEntry(0, $1F4, $FC, 0, 0, 2, 7, $10D)
    %spritemapEntry(0, $1EC, $FC, 0, 0, 2, 7, $10C)
    %spritemapEntry(0, $1E4, $FC, 0, 0, 2, 7, $10B)
    %spritemapEntry(0, $08, $FC, 0, 0, 2, 7, $106)
    %spritemapEntry(0, $00, $FC, 0, 0, 2, 7, $105)
    %spritemapEntry(0, $1F8, $FC, 0, 0, 2, 7, $101)
    %spritemapEntry(0, $1F0, $FC, 0, 0, 2, 7, $100)

UNUSED_Spritemap_Corpse_A9EE2B:
    dw $0003
    %spritemapEntry(0, $04, $FA, 0, 0, 2, 7, $10D)
    %spritemapEntry(0, $1FC, $FA, 0, 0, 2, 7, $10C)
    %spritemapEntry(0, $1F4, $FA, 0, 0, 2, 7, $10B)
endif ; !FEATURE_KEEP_UNREFERENCED

Spritemap_CorpseSidehopper_Alive_0:
    dw $0007
    %spritemapEntry(0, $00, $EC, 0, 0, 2, 0, $171)
    %spritemapEntry(0, $1F8, $EC, 0, 0, 2, 0, $170)
    %spritemapEntry(1, $420C, $04, 0, 1, 2, 0, $176)
    %spritemapEntry(1, $43E4, $04, 0, 0, 2, 0, $176)
    %spritemapEntry(1, $4208, $F4, 0, 1, 2, 0, $174)
    %spritemapEntry(1, $43E8, $F4, 0, 0, 2, 0, $174)
    %spritemapEntry(1, $43F8, $F4, 0, 0, 2, 0, $180)

Spritemap_CorpseSidehopper_Alive_1:
    dw $0007
    %spritemapEntry(1, $43F8, $F6, 0, 0, 2, 0, $182)
    %spritemapEntry(1, $420D, $04, 0, 1, 2, 0, $17A)
    %spritemapEntry(1, $43E3, $04, 0, 0, 2, 0, $17A)
    %spritemapEntry(1, $4208, $F4, 0, 1, 2, 0, $178)
    %spritemapEntry(1, $43E8, $F4, 0, 0, 2, 0, $178)
    %spritemapEntry(0, $00, $EE, 0, 0, 2, 0, $171)
    %spritemapEntry(0, $1F8, $EE, 0, 0, 2, 0, $170)

Spritemap_CorpseSidehopper_Alive_2:
    dw $000B
    %spritemapEntry(0, $10, $0C, 0, 1, 2, 0, $172)
    %spritemapEntry(0, $08, $0C, 0, 1, 2, 0, $173)
    %spritemapEntry(0, $1F0, $0C, 0, 0, 2, 0, $173)
    %spritemapEntry(0, $1E8, $0C, 0, 0, 2, 0, $172)
    %spritemapEntry(1, $4208, $FC, 0, 1, 2, 0, $17E)
    %spritemapEntry(1, $43E8, $FC, 0, 0, 2, 0, $17E)
    %spritemapEntry(1, $4208, $EC, 0, 1, 2, 0, $17C)
    %spritemapEntry(1, $43E8, $EC, 0, 0, 2, 0, $17C)
    %spritemapEntry(0, $00, $E3, 0, 0, 2, 0, $171)
    %spritemapEntry(0, $1F8, $E3, 0, 0, 2, 0, $170)
    %spritemapEntry(1, $43F8, $EB, 0, 0, 2, 0, $180)


if !FEATURE_KEEP_UNREFERENCED
;;; $EEBF: Unused. A = [Y] / [A] ;;;
UNUSED_GetYDividedByA_A9EEBF:
    STY.W $4204
    SEP #$20
    STA.W $4206
    REP #$20
    XBA : XBA
    NOP #2
    LDA.W $4214
    RTS
endif ; !FEATURE_KEEP_UNREFERENCED


;;; $EED1: Check for enemy collision with enemy ;;;
CheckForEnemyCollisionWithEnemy:
;; Parameters:
;;     X: Enemy index
;;     Y: Other enemy index
;; Returns:
;;     Carry: Clear if collision, set otherwise
    LDA.W Enemy.XHitboxRadius,Y : CLC : ADC.W Enemy.XHitboxRadius,X
    INC : STA.B DP_Temp12
    LDA.W Enemy.XPosition,Y : SEC : SBC.W Enemy.XPosition,X : BPL +
    EOR.W #$FFFF : INC

+   CMP.B DP_Temp12 : BCS .return
    LDA.W Enemy.YHitboxRadius,Y : CLC : ADC.W Enemy.YHitboxRadius,X
    INC : STA.B DP_Temp12
    LDA.W Enemy.YPosition,Y : SEC : SBC.W Enemy.YPosition,X : BPL +
    EOR.W #$FFFF : INC

+   CMP.B DP_Temp12

  .return:
    RTL


;;; $EF06: Check for enemy collision with rectangle ;;;
CheckForEnemyCollisionWithRectangle:
;; Parameters:
;;     $12: Rectangle centre X position
;;     $14: Rectangle centre Y position
;;     $16: Rectangle X radius
;;     $18: Rectangle Y radius
;; Returns:
;;     Carry: Clear if collision, set otherwise
    LDA.B DP_Temp16 : CLC : ADC.W Enemy.XHitboxRadius,X
    INC : STA.B DP_Temp1A
    LDA.B DP_Temp12 : SEC : SBC.W Enemy.XPosition,X : BPL +
    EOR.W #$FFFF : INC

+   CMP.B DP_Temp1A : BCS .return
    LDA.B DP_Temp18 : CLC : ADC.W Enemy.YHitboxRadius,X
    INC : STA.B DP_Temp1A
    LDA.B DP_Temp14 : SEC : SBC.W Enemy.YPosition,X : BPL +
    EOR.W #$FFFF : INC

+   CMP.B DP_Temp1A

  .return:
    RTL


;;; $EF37: Initialisation AI - enemy $EEBF (Shitroid) ;;;
InitAI_BabyMetroid:
    PHB
    PEA $7E7E : PLB : PLB
    LDA.W #$0000
    LDX.W #$0FFE

  .loop:
    STA.W CorpseRottingGFX_Torizo,X
    DEX #2 : BPL .loop
    PLB
    LDX.W EnemyIndex
    LDA.W Enemy.properties,X : ORA.W #$3000 : STA.W Enemy.properties,X
    LDA.W #$0400 : STA.W Enemy.palette,X
    LDA.W #InstList_BabyMetroid_Normal : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    LDA.W #Function_BabyMetroid_WaitForCamera : BIT.W Layer1XPosition : BPL .notLeftDoor
    LDA.W Enemy.properties,X : ORA.W #$0500 : STA.W Enemy.properties,X
    LDA.W #Function_BabyMetroid_Disappeared

  .notLeftDoor:
    STA.W BabyMetroid.function,X
    STZ.W BabyMetroid.XVelocity,X : STZ.W BabyMetroid.YVelocity,X
    LDA.W #$000A : STA.W BabyMetroid.paletteHandlerDelay,X
    STZ.W BabyMetroid.contactReactionFlag,X
    LDY.W #Palette_CorpseSidehopper
    LDX.W #$0120
    LDA.W #$0010
    JSL WriteAColorsFromYToTargetColorIndexX
    LDY.W #Palette_BabyMetroid
    LDX.W #$0140
    LDA.W #$0010
    JSL WriteAColorsFromYToTargetColorIndexX
    LDY.W #Palette_CorpseCommon
    LDX.W #$01E0
    LDA.W #$0010
    JSL WriteAColorsFromYToTargetColorIndexX
    RTL


;;; $EFBA: Power bomb reaction - enemy $EEBF (Shitroid) ;;;
PowerBombReaction_BabyMetroid:
    LDX.W EnemyIndex
    LDA.W BabyMetroid.contactReactionFlag,X : BEQ MainAI_BabyMetroid
    JSR SignalBabyMetroidToLeave
; fallthrough to MainAI_BabyMetroid


;;; $EFC5: Main AI - enemy $EEBF (Shitroid) ;;;
MainAI_BabyMetroid:
    LDX.W EnemyIndex
    LDA.W #$7FFF : STA.W Enemy.health,X
    JSR.W (BabyMetroid.function,X)
    JSL MoveEnemyAccordingToVelocity
    LDA.L PaletteChangeNumerator : BNE .return
    JSR HandleNormalBabyMetroidPalette

  .return:
    RTL


;;; $EFDF: Shitroid function - disappeared ;;;
Function_BabyMetroid_Disappeared:
    STZ.W BabyMetroid.XVelocity,X : STZ.W BabyMetroid.YVelocity,X
    RTS


;;; $EFE6: Shitroid function - wait for camera ;;;
Function_BabyMetroid_WaitForCamera:
    LDA.W Layer1XPosition : CMP.W #$0201 : BPL .return
    LDA.W #$0200 : STA.W Layer1XPosition
    LDA.L Scrolls : AND.W #$00FF : STA.L Scrolls
    LDA.L Scrolls+2 : AND.W #$00FF : STA.L Scrolls+2
    JSL Spawn_Hardcoded_PLM
    db $30,$03
    dw PLMEntries_createBabyMetroidInvisibleWall
    JSL Spawn_Hardcoded_PLM
    db $1F,$03
    dw PLMEntries_createBabyMetroidInvisibleWall
    LDX.W EnemyIndex
    LDA.W #Function_BabyMetroid_LetSidehopperLiveForABit : STA.W BabyMetroid.function,X
    LDA.W #$0001 : STA.L BabyMetroid.crySFXFlag,X

  .return:
    RTS


;;; $F02B: Shitroid function - let sidehopper live for a bit ;;;
Function_BabyMetroid_LetSidehopperLiveForABit:
    LDA.W #Function_BabyMetroid_QueueBattleMusic : STA.W BabyMetroid.function,X
    LDA.W #$01D0 : STA.W BabyMetroid.functionTimer,X
; fallthrough to Function_BabyMetroid_QueueBattleMusic


;;; $F037: Shitroid function - queue battle music ;;;
Function_BabyMetroid_QueueBattleMusic:
    DEC.W BabyMetroid.functionTimer,X : BPL Function_BabyMetroid_RushToMiddleOfRoom_return
    LDA.W #$0005
    JSL QueueMusicDataOrTrack_8FrameDelay
    LDA.W #Function_BabyMetroid_RushToMiddleOfRoom : STA.W BabyMetroid.function,X
; fallthrough to Function_BabyMetroid_RushToMiddleOfRoom


;;; $F049: Shitroid function - rush to middle of room ;;;
Function_BabyMetroid_RushToMiddleOfRoom:
    LDA.W #$0248 : STA.B DP_Temp12
    LDA.W #$004A : STA.B DP_Temp14
    LDY.W #$000F
    JSR GradduallyAccelerateTowardsPoint_1A_400
    LDA.W #$0001 : STA.B DP_Temp16 : STA.B DP_Temp18
    JSL CheckForEnemyCollisionWithRectangle
    BCS .return
    LDA.W #Function_BabyMetroid_RushToSidehopper : STA.W BabyMetroid.function,X

  .return:
    RTS


;;; $F06D: Shitroid function - rush to sidehopper ;;;
Function_BabyMetroid_RushToSidehopper:
    LDA.W Enemy[1].XPosition,X : STA.B DP_Temp12
    LDA.W Enemy[1].YPosition,X : CLC : ADC.W #$FFE0 : STA.B DP_Temp14
    LDY.W #$000F
    JSR GradduallyAccelerateTowardsPoint_1A_400
    TXA : CLC : ADC.W #$0040 : TAY
    JSL CheckForEnemyCollisionWithEnemy
    BCS .return
    LDA.W #Function_BabyMetroid_LatchOntoSidehopper : STA.W BabyMetroid.function,X

  .return:
    RTS


;;; $F094: Shitroid function - latch onto sidehopper ;;;
Function_BabyMetroid_LatchOntoSidehopper:
    LDA.W Enemy[1].XPosition,X : STA.B DP_Temp12
    LDA.W Enemy[1].YPosition,X : CLC : ADC.W #$FFE0 : STA.B DP_Temp14
    LDA.W #$0200
    JSR AccelerateBabyMetroidTowardsPoint
    BCS .reachedTarget
    RTS

  .reachedTarget:
    STZ.W BabyMetroid.XVelocity,X : STZ.W BabyMetroid.YVelocity,X
    LDA.W Enemy[1].XPosition,X : STA.W Enemy.XPosition,X
    LDA.W Enemy[1].YPosition,X : CLC : ADC.W #$FFE0 : STA.W Enemy.YPosition,X
    LDA.W #InstList_BabyMetroid_LatchedOn : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    LDA.W #Function_BabyMetroid_DrainingSidehopper : STA.W BabyMetroid.function,X
    LDA.W #$0001 : STA.W BabyMetroid.paletteHandlerDelay,X
    STZ.W BabyMetroid.contactReactionFlag,X
    LDA.W #$0140 : STA.W BabyMetroid.functionTimer,X
    RTS


;;; $F0E6: Shitroid function - draining sidehopper ;;;
Function_BabyMetroid_DrainingSidehopper:
    LDA.W Enemy.frameCounter,X : AND.W #$0006 : TAY
    LDA.W ShakingOffsets_X,Y : ADC.W Enemy[1].XPosition,X : STA.W Enemy.XPosition,X
    LDA.W ShakingOffsets_Y,Y : CLC : ADC.W Enemy[1].YPosition,X
    CLC : ADC.W #$FFE0 : STA.W Enemy.YPosition,X
    DEC.W BabyMetroid.functionTimer,X : BNE .return
    LDA.W #Function_BabyMetroid_MakeSidehopperRottable : STA.W BabyMetroid.function,X
    LDA.W #InstList_BabyMetroid_FinishDraining : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    LDA.W #$000A : STA.W BabyMetroid.paletteHandlerDelay,X

  .return:
    RTS


;;; $F125: Shitroid function - make sidehopper rottable ;;;
Function_BabyMetroid_MakeSidehopperRottable:
    LDA.W #$0001 : STA.L MotherBrainBody.painfulWalkingFunction
    LDA.W #Function_BabyMetroid_MoveUp_UnlockCamera : STA.W BabyMetroid.function,X
    LDA.W #$00C0 : STA.W BabyMetroid.functionTimer,X
; fallthrough to Function_BabyMetroid_MoveUp_UnlockCamera


;;; $F138: Shitroid function - move up and unlock camera ;;;
Function_BabyMetroid_MoveUp_UnlockCamera:
    LDA.W Enemy.XPosition,X : STA.B DP_Temp12
    LDA.W #$0068 : STA.B DP_Temp14
    LDY.W #$0000
    JSR GradduallyAccelerateTowardsPoint_1A_400
    DEC.W BabyMetroid.functionTimer,X : BPL .return
    LDA.W #Function_BabyMetroid_StareDownSamus : STA.W BabyMetroid.function,X
    LDA.W #$0001 : STA.W BabyMetroid.contactReactionFlag,X
    LDA.L Scrolls : ORA.W #$0100 : STA.L Scrolls
    LDA.L Scrolls+2 : ORA.W #$0100 : STA.L Scrolls+2
    JSL Spawn_Hardcoded_PLM
    db $30,$03
    dw PLMEntries_clearBabyMetroidInvisibleWall
    JSL Spawn_Hardcoded_PLM
    db $1F,$03
    dw PLMEntries_clearBabyMetroidInvisibleWall

  .return:
    RTS


;;; $F180: Shitroid function - stare down Samus ;;;
Function_BabyMetroid_StareDownSamus:
; Shitroid moves towards Samus' X position and usually Y position 50h
; With a 0.78125% chance, Shitroid will move towards Samus' Y position instead for 20h frames
; 0.78125% chance per frame ~= 37.5% chance per second
; Shitroid will latch onto Samus when one of:
;     their X positions have been close for a while
;     they touch and Samus wasn't spin jumping (see enemy touch)
;     Samus X position < 200h
    LDA.W Enemy.XPosition,X : SEC : SBC.W SamusXPosition : BPL +
    EOR.W #$FFFF : INC

+   CMP.W #$0008 : BCS .notClose
    LDA.L BabyMetroid.stareDownContactTimer,X : ADC.W #$0002
    BRA +

  .notClose:
    LDA.L BabyMetroid.stareDownContactTimer,X : BEQ +
    SEC : SBC.W #$0001 : BPL +
    LDA.W #$0000

+   STA.L BabyMetroid.stareDownContactTimer,X
    CMP.W #$0100 : BCS .done
    LDA.W SamusXPosition : CMP.W #$0200 : BMI .done
    LDA.L BabyMetroid.aggroTimer,X : BEQ .zeroAggroTimer
    DEC : STA.L BabyMetroid.aggroTimer,X
    LDY.W SamusYPosition
    BRA .notRareChance

  .zeroAggroTimer:
    LDY.W #$0050
    LDA.W RandomNumberSeed : AND.W #$0FFF : CMP.W #$0FE0 : BCC .notRareChance
    LDA.W #$0020 : STA.L BabyMetroid.aggroTimer,X

  .notRareChance:
    STY.B DP_Temp14
    LDA.W SamusXPosition : STA.B DP_Temp12
    LDX.W EnemyIndex
    LDY.W #$000A
    JMP GradduallyAccelerateTowardsPoint_1A_400

  .done:
    LDX.W EnemyIndex
    LDA.W #Function_BabyMetroid_LatchOntoSamus : STA.W BabyMetroid.function,X
    RTS


;;; $F1FA: Shitroid function - latch onto Samus ;;;
Function_BabyMetroid_LatchOntoSamus:
; See enemy touch
    LDA.W SamusXPosition : STA.B DP_Temp12
    LDA.W SamusYPosition : SEC : SBC.W #$0020 : STA.B DP_Temp14
    LDY.W #$000F
    JMP GradduallyAccelerateTowardsPoint_1A_400


;;; $F20E: Shitroid function - start draining Samus ;;;
Function_BabyMetroid_StartDrainingSamus:
    LDA.W #$0012
    JSL Run_Samus_Command
    LDA.W #Function_BabyMetroid_DrainingSamus : STA.W BabyMetroid.function
; fallthrough to Function_BabyMetroid_DrainingSamus


;;; $F21B: Shitroid function - draining Samus ;;;
Function_BabyMetroid_DrainingSamus:
    LDA.W Energy : CMP.W #$0002 : BCC .done
    LDA.W #$0008 : STA.W SamusProjectile_CooldownTimer
    LDA.W #$0005 : STA.W SamusProjectile_BombCounter
    LDA.W #$0002 : STA.W XSpeedDivisor
    LDA.W SamusYSpeed : CMP.W #$0004 : BMI .lessThan4
    LDA.W #$0002 : STA.W SamusYSpeed

  .lessThan4:
    LDA.W Enemy.frameCounter,X : AND.W #$0006 : TAY
    LDA.W ShakingOffsets_X,Y : ADC.W SamusXPosition : STA.W Enemy.XPosition,X
    LDA.W ShakingOffsets_Y,Y : CLC : ADC.W #$FFEC
    CLC : ADC.W SamusYPosition : STA.W Enemy.YPosition,X
    JSL DamageSamusDueToBabyMetroid
    RTS

  .done:
    STZ.W XSpeedDivisor : STZ.W SamusProjectile_BombCounter
    LDA.W #Function_BabyMetroid_StartHeelRealization : STA.W BabyMetroid.function,X
    STZ.W BabyMetroid.XVelocity,X : STZ.W BabyMetroid.YVelocity,X
    LDA.W #InstList_BabyMetroid_FinishDraining
    JSL SetEnemyInstList
    LDA.W #$000A : STA.W BabyMetroid.paletteHandlerDelay,X
    LDA.W #$0013
    JSL Run_Samus_Command
    LDA.W #$0000
    JSL DrainedSamusController
    LDA.W #$0000 : STA.L BabyMetroid.crySFXFlag,X
    LDA.W #$0007
    JSL QueueMusicDataOrTrack_8FrameDelay
    RTS


;;; $F2A2: Shitroid function - start heel realisation ;;;
Function_BabyMetroid_StartHeelRealization:
    LDA.W #Function_BabyMetroid_HeelRealization : STA.W BabyMetroid.function,X
    LDA.W #$0078 : STA.W BabyMetroid.functionTimer,X
; fallthrough to Function_BabyMetroid_HeelRealization


;;; $F2AE: Shitroid function - heel realisation ;;;
Function_BabyMetroid_HeelRealization:
    DEC.W BabyMetroid.functionTimer,X : BMI .timerExpired
    RTS

  .timerExpired:
    LDA.W #Function_BabyMetroid_BackOffGuiltily : STA.W BabyMetroid.function,X
    LDA.W #$00C0 : STA.W BabyMetroid.functionTimer,X
; fallthrough to Function_BabyMetroid_BackOffGuiltily


;;; $F2C0: Shitroid function - back off guiltily ;;;
Function_BabyMetroid_BackOffGuiltily:
    LDA.W SamusXPosition : STA.B DP_Temp12
    LDA.W #$0068 : STA.B DP_Temp14
    LDX.W EnemyIndex
    LDY.W #$0000
    JSR GradduallyAccelerateTowardsPoint_1A_400
    DEC.W BabyMetroid.functionTimer,X : BMI .timerExpired
    RTS

  .timerExpired:
    LDA.W #$007D
    JSL QueueSound_Lib2_Max6
    LDA.W #Function_BabyMetroid_GoLeftGuiltily : STA.W BabyMetroid.function,X
    LDA.W #$0058 : STA.W BabyMetroid.functionTimer,X
    LDA.W #InstList_BabyMetroid_LatchedOn : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
; fallthrough to Function_BabyMetroid_GoLeftGuiltily


;;; $F2FB: Shitroid function - go left guiltily ;;;
Function_BabyMetroid_GoLeftGuiltily:
    LDA.W SamusXPosition : CLC : ADC.W #$FFC0 : STA.B DP_Temp12
    LDA.W #$0064 : STA.B DP_Temp14
    LDX.W EnemyIndex
    LDY.W #$0000
    JSR GradduallyAccelerateTowardsPoint_1A_400
    DEC.W BabyMetroid.functionTimer,X : BMI .timerExpired
    RTS

  .timerExpired:
    LDA.W #Function_BabyMetroid_GoRightGuiltily : STA.W BabyMetroid.function,X
    LDA.W #$0058 : STA.W BabyMetroid.functionTimer,X
; fallthrough to Function_BabyMetroid_GoRightGuiltily


;;; $F324: Shitroid function - go right guiltily ;;;
Function_BabyMetroid_GoRightGuiltily:
    LDA.W SamusXPosition : CLC : ADC.W #$0060 : STA.B DP_Temp12
    LDA.W #$0068 : STA.B DP_Temp14
    LDX.W EnemyIndex
    LDY.W #$0000
    JSR GradduallyAccelerateTowardsPoint_1A_400
    DEC.W BabyMetroid.functionTimer,X : BMI .timerExpired
    RTS

  .timerExpired:
    LDX.W EnemyIndex
    LDA.W #Function_BabyMetroid_SamusRecovering : STA.W BabyMetroid.function,X
    LDA.W #$0100 : STA.W BabyMetroid.functionTimer,X
    LDA.W #InstList_BabyMetroid_Remorse : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    RTS


;;; $F360: Shitroid function - flee remorsefully ;;;
Function_BabyMetroid_FleeRemorsefully:
    LDA.W #$0052
    JSL QueueSound_Lib2_Max6
    LDA.W #Function_BabyMetroid_Fleeing : STA.W BabyMetroid.function,X
; fallthrough to Function_BabyMetroid_Fleeing


;;; $F36D: Shitroid function - fleeing ;;;
Function_BabyMetroid_Fleeing:
    LDA.W #$FF80 : STA.B DP_Temp12
    LDA.W #$0040 : STA.B DP_Temp14
    LDX.W EnemyIndex
    LDY.W #$0000
    JSR GradduallyAccelerateTowardsPoint_1A_400
    LDA.W #$0008 : STA.B DP_Temp16 : STA.B DP_Temp18
    JSL CheckForEnemyCollisionWithRectangle
    BCS .return
    STZ.W BabyMetroid.XVelocity,X : STZ.W BabyMetroid.YVelocity,X
    LDA.W Enemy.properties,X : AND.W #$DEFF : STA.W Enemy.properties,X
    LDA.W #Function_BabyMetroid_Disappeared : STA.W BabyMetroid.function,X

  .return:
    RTS


;;; $F3A3: Shitroid function - Samus recovering ;;;
Function_BabyMetroid_SamusRecovering:
    DEC.W BabyMetroid.functionTimer,X : BMI .timerExpired
    JMP GraduallyAccelerateTowardSamus

  .timerExpired:
    LDA.W #$0002
    JSL DrainedSamusController
    LDA.W #$0001 : STA.W BabyMetroid.contactReactionFlag,X
    LDA.W #Function_BabyMetroid_Remorse : STA.W BabyMetroid.function,X
; fallthrough to Function_BabyMetroid_Remorse


;;; $F3BE: Shitroid function - remorse ;;;
Function_BabyMetroid_Remorse:
    JSR GraduallyAccelerateTowardSamus
    BCS MakeBabyMetroidFlee
    RTS


;;; $F3C4: Make Shitroid flee ;;;
MakeBabyMetroidFlee:
    LDA.W #Function_BabyMetroid_FleeRemorsefully : STA.W BabyMetroid.function,X
    RTS


;;; $F3CB: Signal Shitroid to leave ;;;
SignalBabyMetroidToLeave:
    LDA.W BabyMetroid.function,X : CMP.W #Function_BabyMetroid_Remorse : BEQ MakeBabyMetroidFlee
    RTS


;;; $F3D4: Gradually accelerate towards Samus ;;;
GraduallyAccelerateTowardSamus:
;; Returns:
;;     Carry: Set if ready to flee, clear otherwise

; Similar to Function_BabyMetroid_StareDownSamus
    LDA.W Enemy.XPosition,X : SEC : SBC.W SamusXPosition : BPL +
    EOR.W #$FFFF : INC

+   CMP.W #$0002 : BCS .notClose
    LDA.L BabyMetroid.stareDownContactTimer,X : ADC.W #$0002
    BRA +

  .notClose:
    LDA.L BabyMetroid.stareDownContactTimer,X : BEQ +
    SEC : SBC.W #$0001 : BPL +
    LDA.W #$0000

+   STA.L BabyMetroid.stareDownContactTimer,X
    LDA.L BabyMetroid.aggroTimer,X : BEQ .zeroAggroTimer
    DEC : STA.L BabyMetroid.aggroTimer,X
    LDA.W SamusYPosition : CLC : ADC.W #$FFEE : TAY
    BRA +

  .zeroAggroTimer:
    LDY.W #$0050
    LDA.W RandomNumberSeed : AND.W #$0FFF : CMP.W #$0FE0 : BCC +
    LDA.W #$0020 : STA.L BabyMetroid.aggroTimer,X

+   STY.B DP_Temp14
    LDA.W SamusXPosition : STA.B DP_Temp12
    LDX.W EnemyIndex
    LDY.W #$0008
    JSR GradduallyAccelerateTowardsPoint_1A_400
    LDA.L BabyMetroid.stareDownContactTimer,X : CMP.W #$0400 : BCS .returnReadyToFlee
    LDA.W SamusXPosition : CMP.W #$0080 : BMI .returnReadyToFlee
    CLC
    RTS

  .returnReadyToFlee:
    SEC
    RTS


;;; $F451: Gradually accelerate towards point - $1A = 400h ;;;
GradduallyAccelerateTowardsPoint_1A_400:
    LDA.W #$0400 : STA.B DP_Temp1A
    BRA GradduallyAccelerateTowardsPoint


;;; $F458: Gradually accelerate towards point - $1A = 4 ;;;
GradduallyAccelerateTowardsPoint_1A_4:
    LDA.W #$0004 : STA.B DP_Temp1A
    BRA GradduallyAccelerateTowardsPoint


;;; $F45F: Gradually accelerate towards point - $1A = 8 ;;;
GradduallyAccelerateTowardsPoint_1A_8:
    LDA.W #$0008 : STA.B DP_Temp1A
    BRA GradduallyAccelerateTowardsPoint


;;; $F466: Gradually accelerate towards point - $1A = 10h ;;;
GradduallyAccelerateTowardsPoint_1A_10:
    LDA.W #$0010 : STA.B DP_Temp1A
; fallthrough to GradduallyAccelerateTowardsPoint


;;; $F46B: Gradually accelerate towards point ;;;
GradduallyAccelerateTowardsPoint:
;; Parameters:
;;     Y: Acceleration divisor table index. Range 0..Fh, lower = slower
;;     $12: Target X position
;;     $14: Target Y position
;;     $1A: Extra X speed if enemy is moving the wrong way and is horizontally off-screen. Unit is 1/100h px/frame
    LDA.W GradualAccelerationDivisorTable,Y : AND.W #$00FF : STA.B DP_Temp18
    JSR GraduallyAccelerateHorizontally
    LDA.W Enemy.YPosition,X : SEC : SBC.B DP_Temp14 : BEQ .return
    BPL .up
    EOR.W #$FFFF : INC
    STA.W $4204
    SEP #$20
    LDA.B DP_Temp18 : STA.W $4206
    REP #$20
    XBA : XBA
    NOP #2
    LDA.W $4214 : BNE +
    INC

+   STA.B DP_Temp16
    LDA.W BabyMetroid.YVelocity,X : BPL .movingDown
    CLC : ADC.W #$0008 : ADC.B DP_Temp16

  .movingDown:
    ADC.B DP_Temp16 : CMP.W #$0500 : BMI .storeDownwardVelocity
    LDA.W #$0500

  .storeDownwardVelocity:
    STA.W BabyMetroid.YVelocity,X

  .return:
    RTS

  .up:
    STA.W $4204
    SEP #$20
    LDA.B DP_Temp18 : STA.W $4206
    REP #$20
    XBA : XBA
    NOP #2
    LDA.W $4214 : BNE +
    INC

+   STA.B DP_Temp16
    LDA.W BabyMetroid.YVelocity,X : BMI .movingUp
    SEC : SBC.W #$0008 : SBC.B DP_Temp16

  .movingUp:
    SBC.B DP_Temp16 : CMP.W #$FB00 : BPL .storeUpwardVelocity
    LDA.W #$FB00

  .storeUpwardVelocity:
    STA.W BabyMetroid.YVelocity,X
    RTS


;;; $F4E6: Gradually accelerate horizontally ;;;
GraduallyAccelerateHorizontally:
;; Parameters:
;;     $12: Target X position
;;     $18: Acceleration divisor
;;     $1A: Extra speed if enemy is moving the wrong way and is off-screen. Unit is 1/100h px/frame

; Given initial X position x_0 and assuming initial X velocity 0, solving
;     x''(t) = (8 + ([$12] - x(t)) / [$18]) / 100h
; gives
;     x(t) = [$12] + 8 * [$18] - ([$12] + 8 * [$18] - x_0) cos(t / (10h * sqrt([$18])))

; Which takes 10h * sqrt([$18]) arccos(8 * [$18] / ([$12] + 8 * [$18] - x_0)) frames to reach the target position,
;     with [$18] = 10h, that's 40h arccos(80h / ([$12] + 80h - x_0)) frames (range 0..78)
;     with [$18] = 1, that's 10h arccos(8 / ([$12] + 8 - x_0)) frames (range 0..24)
    LDA.W Enemy.XPosition,X : SEC : SBC.B DP_Temp12 : BEQ .return
    BPL .left
    EOR.W #$FFFF : INC
    STA.W $4204
    SEP #$20
    LDA.B DP_Temp18 : STA.W $4206
    REP #$20
    XBA : XBA
    NOP #2
    LDA.W $4214 : BNE +
    INC

+   STA.B DP_Temp16
    LDA.W BabyMetroid.XVelocity,X : BPL .movingRight
    PHA
    JSL CheckIfEnemyIsVagulyOnScreen
    PLA
    BCC .onScreenRight
    ADC.B DP_Temp1A

  .onScreenRight:
    CLC : ADC.W #$0008 : ADC.B DP_Temp16

  .movingRight:
    ADC.B DP_Temp16 : CMP.W #$0800 : BMI .storeRightwardVelocity
    LDA.W #$0800

  .storeRightwardVelocity:
    STA.W BabyMetroid.XVelocity,X

  .return:
    RTS

  .left:
    STA.W $4204
    SEP #$20
    LDA.B DP_Temp18 : STA.W $4206
    REP #$20
    XBA : XBA
    NOP #2
    LDA.W $4214 : BNE +
    INC

+   STA.B DP_Temp16
    LDA.W BabyMetroid.XVelocity,X : BMI .movingLeft
    PHA
    JSL CheckIfEnemyIsVagulyOnScreen
    PLA
    BCC ..onScreen
    SBC.B DP_Temp1A

  ..onScreen:
    SEC : SBC.W #$0008 : SBC.B DP_Temp16

  .movingLeft:
    SBC.B DP_Temp16 : CMP.W #$F800 : BPL .storeLeftwardVelocity
    LDA.W #$F800

  .storeLeftwardVelocity:
    STA.W BabyMetroid.XVelocity,X
    RTS


;;; $F56A: Gradual acceleration divisor table ;;;
GradualAccelerationDivisorTable:
    db $10,$0F,$0E,$0D,$0C,$0B,$0A,$09,$08,$07,$06,$05,$04,$03,$02,$01


;;; $F57A: Check if enemy is vaguely on screen ;;;
CheckIfEnemyIsVagulyOnScreen:
;; Returns:
;;     Carry: Set if off-screen, otherwise clear
    LDA.W Enemy.YPosition,X : BMI .returnOffScreen
    CLC : ADC.W #$0060
    SEC : SBC.W Layer1YPosition : BMI .returnOffScreen
    CMP.W #$01A0 : BPL .returnOffScreen
    LDA.W Enemy.XPosition,X : BMI .returnOffScreen
    CLC : ADC.W #$0010
    SEC : SBC.W Layer1XPosition : BMI .returnOffScreen
    CMP.W #$0120 : BPL .returnOffScreen
    CLC
    RTL

  .returnOffScreen:
    SEC
    RTL


;;; $F5A6: Accelerate Shitroid towards point ;;;
AccelerateBabyMetroidTowardsPoint:
;; Parameters:
;;     A: Acceleration. Unit is 1/100h px/frame^2
;;     $12: Target X position
;;     $14: Target Y position
;; Returns:
;;     Carry: Set if reached target position
    STA.B DP_Temp16
    STZ.B DP_Temp1C
    JSR AccelerateBabyMetroidTowardsXPosition
    JSR AccelerateBabyMetroidTowardsYPosition
    LSR.B DP_Temp1C : LSR.B DP_Temp1C
    RTS


;;; $F5B5: Accelerate Shitroid towards Y position ;;;
AccelerateBabyMetroidTowardsYPosition:
;; Parameters:
;;     $14: Target Y position
;;     $16: Acceleration. Unit is 1/100h px/frame^2

; Increments $1C if reached target position
    LDA.W Enemy.YPosition,X : SEC : SBC.B DP_Temp14 : BEQ .reachedTarget
    BPL .up
    LDA.W BabyMetroid.YVelocity,X : CLC : ADC.B DP_Temp16 : CMP.W #$0500 : BMI +
    LDA.W #$0500

+   STA.W BabyMetroid.YVelocity,X
    AND.W #$FF00 : XBA : BPL +
    ORA.W #$FF00

+   CLC : ADC.W Enemy.YPosition,X : CMP.B DP_Temp14 : BMI .returnUpper
    STZ.W BabyMetroid.YVelocity,X
    LDA.B DP_Temp14

  .reachedTarget:
    INC.B DP_Temp1C

  .returnUpper:
    RTS

  .up:
    LDA.W BabyMetroid.YVelocity,X : SEC : SBC.B DP_Temp16 : CMP.W #$FB00 : BPL +
    LDA.W #$FB00

+   STA.W BabyMetroid.YVelocity,X
    AND.W #$FF00 : XBA : BPL +
    ORA.W #$FF00

+   CLC : ADC.W Enemy.YPosition,X : CMP.B DP_Temp14 : BEQ .resetVelocity
    BPL .returnLower

  .resetVelocity:
    STZ.W BabyMetroid.YVelocity,X
    LDA.B DP_Temp14
    INC.B DP_Temp1C

  .returnLower:
    RTS


;;; $F615: Accelerate Shitroid towards X position ;;;
AccelerateBabyMetroidTowardsXPosition:
;; Parameters:
;;     $12: Target X position
;;     $16: Acceleration. Unit is 1/100h px/frame^2

; Increments $1C if reached target position
    LDA.W Enemy.XPosition,X : SEC : SBC.B DP_Temp12 : BPL .left
    EOR.W #$FFFF : INC ; >.<
    LDA.W BabyMetroid.XVelocity,X : CLC : ADC.B DP_Temp16 : CMP.W #$0500 : BMI +
    LDA.W #$0500

+   STA.W BabyMetroid.XVelocity,X
    AND.W #$FF00 : XBA : BPL +
    ORA.W #$FF00

+   CLC : ADC.W Enemy.XPosition,X : CMP.B DP_Temp12 : BMI .returnUpper
    STZ.W BabyMetroid.XVelocity,X
    LDA.B DP_Temp12
    INC.B DP_Temp1C

  .returnUpper:
    RTS

  .left:
    LDA.W BabyMetroid.XVelocity,X : SEC : SBC.B DP_Temp16 : CMP.W #$FB00 : BPL +
    LDA.W #$FB00

+   STA.W BabyMetroid.XVelocity,X
    AND.W #$FF00 : XBA : BPL +
    ORA.W #$FF00

+   CLC : ADC.W Enemy.XPosition,X : CMP.B DP_Temp12 : BEQ .resetVelocity
    BPL .returnLower

  .resetVelocity:
    STZ.W BabyMetroid.XVelocity,X
    LDA.B DP_Temp12
    INC.B DP_Temp1C

  .returnLower:
    RTS


;;; $F677: Handle normal Shitroid palette ;;;
HandleNormalBabyMetroidPalette:
    LDA.W #$014A : STA.B DP_Temp12
    LDA.W #BabyMetroidColors_Normal : STA.B DP_Temp16
    BRA HandleBabyMetroidPalette


;;; $F683: Handle Shitroid in cutscene palette - normal ;;;
HandleBabyMetroidCutscenePalette_Normal:
    LDA.W #$01EA : STA.B DP_Temp12
    LDA.W #BabyMetroidColors_Normal : STA.B DP_Temp16
    BRA HandleBabyMetroidPalette


;;; $F68F: Handle Shitroid in cutscene palette - low health ;;;
HandleBabyMetroidCutscenePalette_LowHealth:
    LDA.W #$01EA : STA.B DP_Temp12
    LDA.W #BabyMetroidColors_LowHealth : STA.B DP_Temp16
; fallthrough to HandleBabyMetroidPalette


;;; $F699: Handle Shitroid palette ;;;
HandleBabyMetroidPalette:
;; Parameters:
;;     $12: Colour index
;;     $16: Colour table pointer

; Also handles Shitroid cry sound effect
    LDX.W EnemyIndex
    SEP #$20
    LDA.W BabyMetroid.paletteHandlerTimer,X : BEQ .timerExpired
    DEC : STA.W BabyMetroid.paletteHandlerTimer,X
    REP #$20
    RTS

  .timerExpired:
    LDA.W BabyMetroid.paletteHandlerDelay,X : STA.W BabyMetroid.paletteHandlerTimer,X
    LDA.W BabyMetroid.paletteFrameTimer,X : INC : AND.B #$07 : STA.W BabyMetroid.paletteFrameTimer,X
    REP #$20
    AND.W #$00FF
    JSR HandleBabyMetroidCrySFX
    ASL #3 : ADC.B DP_Temp16 : TAY
    LDX.B DP_Temp12
    LDA.W #$0004
    JSL WriteAColorsFromYtoColorIndexX
    RTS


;;; $F6D1: Shitroid colours - normal ;;;
BabyMetroidColors_Normal:
    dw $72FF,$2CDF,$24B9,$1CAF
    dw $5E5F,$183F,$1014,$080A
    dw $49BA,$041A,$000F,$0005
    dw $3515,$0015,$000A,$0005
    dw $3515,$0015,$000A,$0005
    dw $49BA,$041A,$000F,$0005
    dw $5E5F,$183F,$1014,$080A
    dw $72FF,$2CDF,$24B9,$1CAF


;;; $F711: Shitroid colours - low health ;;;
BabyMetroidColors_LowHealth:
    dw $5990,$3870,$346D,$3068
    dw $494D,$306D,$284A,$2446
    dw $3D0B,$244B,$2048,$1844
    dw $2CC8,$1C48,$1425,$0C22
    dw $2CC8,$1C48,$1425,$0C22
    dw $3D0B,$244B,$2048,$1844
    dw $494D,$306D,$284A,$2446
    dw $5990,$3870,$346D,$3068


;;; $F751: Handle Shitroid cry sound effect ;;;
HandleBabyMetroidCrySFX:
;; Parameters:
;;     A: Enemy palette frame timer
    CMP.W #$0005 : BEQ .timerExpired
    RTS

  .timerExpired:
    PHA : PHY
    LDA.L BabyMetroid.crySFXFlag,X : BEQ .return
    LDA.L BabyMetroid.crySFXTimer,X : INC : STA.L BabyMetroid.crySFXTimer,X
    CMP.W #$0004 : BCC .return
    LDA.W #$0000 : STA.L BabyMetroid.crySFXTimer,X
    LDA.W #$0072
    LDY.W BabyMetroid.paletteHandlerDelay,X : CPY.W #$000A : BCS .queueSFX
    LDA.W #$0078

  .queueSFX:
    JSL QueueSound_Lib2_Max6

  .return:
    PLY : PLA
    RTS


;;; $F789: Enemy touch - enemy $EEBF (Shitroid) ;;;
EnemyTouch_BabyMetroid:
    LDX.W EnemyIndex
    LDA.W BabyMetroid.contactReactionFlag,X : BEQ .return
    JSR SignalBabyMetroidToLeave
    LDA.W MovementType : AND.W #$00FF : CMP.W #$0003 : BNE .notSpinJumping
    LDA.W SamusXPosition : CMP.W #$0200 : BPL .repelled

  .notSpinJumping:
    LDA.W BabyMetroid.function,X : CMP.W #Function_BabyMetroid_LatchOntoSamus : BEQ .latchedOntoSamus
    CMP.W #Function_BabyMetroid_StareDownSamus : BNE .return
    LDA.W #Function_BabyMetroid_LatchOntoSamus : STA.W BabyMetroid.function,X

  .return:
    RTL

  .latchedOntoSamus:
    LDA.W SamusXPosition : STA.B DP_Temp12
    LDA.W SamusYPosition : SEC : SBC.W #$0020 : STA.B DP_Temp14
    LDA.W #$0200
    JSR AccelerateBabyMetroidTowardsPoint
    BCC .return
    LDX.W EnemyIndex
    LDA.W #InstList_BabyMetroid_LatchedOn : STA.W Enemy.instList,X
    LDA.W #$0001 : STA.W Enemy.instTimer,X
    STZ.W Enemy.loopCounter,X
    LDA.W #$0001 : STA.W BabyMetroid.paletteHandlerDelay,X
    STZ.W BabyMetroid.contactReactionFlag,X
    STZ.W BabyMetroid.XVelocity,X : STZ.W BabyMetroid.YVelocity,X
    LDA.W #Function_BabyMetroid_StartDrainingSamus : STA.W BabyMetroid.function,X
    RTL

  .repelled:
    LDA.W SamusXPosition : SEC : SBC.W Enemy.XPosition,X : STA.B DP_Temp12
    LDA.W SamusYPosition : SEC : SBC.W Enemy.YPosition,X : STA.B DP_Temp14
    JSL CalculateAngleOf_12_14_Offset
    SEC : SBC.W #$0080 : EOR.W #$FFFF : INC
    CLC : ADC.W #$0080 : AND.W #$00FF : STA.B DP_Temp12
    LDA.W #$0040 : PHA
    JSL CalculateXVelocityFromSpeedAndAngle
    LDX.W EnemyIndex
    CLC : ADC.W BabyMetroid.XVelocity,X : STA.W BabyMetroid.XVelocity,X
    PLA
    JSL CalculateYVelocityFromSpeedAndAngle
    LDX.W EnemyIndex
    CLC : ADC.W BabyMetroid.YVelocity,X : STA.W BabyMetroid.YVelocity,X
    RTL


;;; $F842: Enemy shot - enemy $EEBF (Shitroid) ;;;
EnemyShot_BabyMetroid:
    LDX.W EnemyIndex
    LDA.W BabyMetroid.contactReactionFlag,X : BEQ .return
    JSR SignalBabyMetroidToLeave
    LDA.W SamusProjectile_XPositions : SEC : SBC.W Enemy.XPosition,X : STA.B DP_Temp12
    LDA.W SamusProjectile_YPositions : SEC : SBC.W Enemy.YPosition,X : STA.B DP_Temp14
    JSL CalculateAngleOf_12_14_Offset
    SEC : SBC.W #$0080 : EOR.W #$FFFF : INC
    CLC : ADC.W #$0080 : AND.W #$00FF : STA.B DP_Temp12
    LDA.W CollisionIndex : ASL : TAX
    LDA.W SamusProjectile_Damages,X : ASL #3 : CMP.W #$00F0 : BCC +
    LDA.W #$00F0

+   PHA
    JSL CalculateXVelocityFromSpeedAndAngle
    LDX.W EnemyIndex
    CLC : ADC.W BabyMetroid.XVelocity,X : STA.W BabyMetroid.XVelocity,X
    PLA
    JSL CalculateYVelocityFromSpeedAndAngle
    LDX.W EnemyIndex
    CLC : ADC.W BabyMetroid.YVelocity,X : STA.W BabyMetroid.YVelocity,X

  .return:
    RTL


;;; $F8A6: Palette - enemy $ED7F/$EDFF/$EE3F/$EE7F (dead monsters) ;;;
Palette_CorpseCommon:
    dw $3800,$57FF,$42F7,$0929,$00A5,$7FFF,$4231,$0043
    dw $4B3F,$42DB,$3678,$2E14,$2190,$192C,$0CC9,$0465


;;; $F8C6: Palette - Shitroid's sidehopper ;;;
Palette_CorpseSidehopper:
    dw $3800,$7FFF,$56E0,$3180,$18C0,$6BC0,$5EC0,$4A20
    dw $35A0,$7FFF,$039C,$0237,$00D1,$03FF,$0237,$00D1


;;; $F8E6: Palette - enemy $ECBF/$EEBF (Shitroid) ;;;
Palette_BabyMetroid:
    dw $3800,$57B8,$0B11,$1646,$00E3,$72FF,$2CDF,$24B9
    dw $1CAF,$18A9,$4F9F,$3ED8,$2E12,$08CD,$7FFF,$0000


;;; $F906: Instruction list - finish draining ;;;
InstList_BabyMetroid_FinishDraining:
    dw $0080,Spritemap_BabyMetroid_2
    dw $0010,Spritemap_BabyMetroid_1


;;; $F90E: Instruction list - normal ;;;
InstList_BabyMetroid_Normal:
    dw $0010,Spritemap_BabyMetroid_0
    dw $0010,Spritemap_BabyMetroid_1
    dw $0010,Spritemap_BabyMetroid_2
    dw $0010,Spritemap_BabyMetroid_1
    dw Instruction_BabyMetroid_GotoNormal


;;; $F920: Instruction - go to InstList_BabyMetroid_Normal ;;;
Instruction_BabyMetroid_GotoNormal:
    LDY.W #InstList_BabyMetroid_Normal
    RTL


;;; $F924: Instruction list - latched on ;;;
InstList_BabyMetroid_LatchedOn:
    dw $0008,Spritemap_BabyMetroid_0
    dw $0008,Spritemap_BabyMetroid_1
    dw $0005,Spritemap_BabyMetroid_2
    dw $0002,Spritemap_BabyMetroid_1
    dw Instruction_GotoLatchedOn


;;; $F936: Instruction - go to InstList_BabyMetroid_LatchedOn ;;;
Instruction_GotoLatchedOn:
    LDY.W #InstList_BabyMetroid_LatchedOn
    RTL


;;; $F93A: Instruction list - remorse ;;;
InstList_BabyMetroid_Remorse:
    dw $000A,Spritemap_BabyMetroid_0
    dw $000A,Spritemap_BabyMetroid_1
    dw $000A,Spritemap_BabyMetroid_2
    dw $000A,Spritemap_BabyMetroid_1
    dw $000A,Spritemap_BabyMetroid_0
    dw $000A,Spritemap_BabyMetroid_1
    dw $000A,Spritemap_BabyMetroid_2
    dw $000A,Spritemap_BabyMetroid_1
    dw Instruction_BabyMetroid_GotoY_OrPlayRemorseSFX
    dw InstList_BabyMetroid_Remorse
    dw $0006,Spritemap_BabyMetroid_0
    dw $0005,Spritemap_BabyMetroid_1
    dw $0004,Spritemap_BabyMetroid_2
    dw $0003,Spritemap_BabyMetroid_1
    dw $0002,Spritemap_BabyMetroid_0
    dw $0003,Spritemap_BabyMetroid_1
    dw $0004,Spritemap_BabyMetroid_2
    dw $0005,Spritemap_BabyMetroid_1
    dw $0006,Spritemap_BabyMetroid_0
    dw $0007,Spritemap_BabyMetroid_1
    dw $0008,Spritemap_BabyMetroid_2
    dw $0009,Spritemap_BabyMetroid_1
    dw Instruction_BabyMetroid_GotoRemorse


;;; $F990: Instruction - go to InstList_BabyMetroid_Remorse ;;;
Instruction_BabyMetroid_GotoRemorse:
    LDY.W #InstList_BabyMetroid_Remorse
    RTL


;;; $F994: Instruction - go to [[Y]] or queue Shitroid feels remorse sound effect ;;;
Instruction_BabyMetroid_GotoY_OrPlayRemorseSFX:
    LDA.W RandomNumberSeed : BPL .gotoY
    LDA.W #$0052
    JSL QueueSound_Lib2_Max6
    INY #2
    RTL

  .gotoY:
    LDA.W $0000,Y : TAY
    RTL


;;; $F9A8: Shitroid spritemaps ;;;
Spritemap_BabyMetroid_0:
    dw $001E
    %spritemapEntry(0, $00, $18, 0, 1, 2, 0, $120)
    %spritemapEntry(0, $1F8, $18, 0, 0, 2, 0, $120)
    %spritemapEntry(1, $4208, $18, 0, 1, 2, 0, $105)
    %spritemapEntry(1, $43E8, $18, 0, 0, 2, 0, $105)
    %spritemapEntry(1, $4210, $18, 0, 1, 2, 0, $104)
    %spritemapEntry(1, $43E0, $18, 0, 0, 2, 0, $104)
    %spritemapEntry(1, $4200, $08, 0, 1, 2, 0, $148)
    %spritemapEntry(1, $43F0, $08, 0, 0, 2, 0, $148)
    %spritemapEntry(1, $4208, $08, 0, 1, 2, 0, $147)
    %spritemapEntry(1, $4218, $08, 0, 1, 2, 0, $145)
    %spritemapEntry(1, $43E8, $08, 0, 0, 2, 0, $147)
    %spritemapEntry(1, $43D8, $08, 0, 0, 2, 0, $145)
    %spritemapEntry(1, $4218, $F8, 0, 1, 2, 0, $125)
    %spritemapEntry(1, $4208, $F8, 0, 1, 2, 0, $127)
    %spritemapEntry(1, $4200, $F8, 0, 1, 2, 0, $128)
    %spritemapEntry(1, $43F0, $F8, 0, 0, 2, 0, $128)
    %spritemapEntry(1, $43E8, $F8, 0, 0, 2, 0, $127)
    %spritemapEntry(1, $43D8, $F8, 0, 0, 2, 0, $125)
    %spritemapEntry(0, $18, $E0, 0, 1, 2, 0, $131)
    %spritemapEntry(1, $4218, $E8, 0, 1, 2, 0, $140)
    %spritemapEntry(1, $4208, $E8, 0, 1, 2, 0, $142)
    %spritemapEntry(1, $4208, $D8, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $4200, $D8, 0, 1, 2, 0, $123)
    %spritemapEntry(1, $4200, $E8, 0, 1, 2, 0, $143)
    %spritemapEntry(1, $43F0, $E8, 0, 0, 2, 0, $143)
    %spritemapEntry(1, $43F0, $D8, 0, 0, 2, 0, $123)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 2, 0, $131)
    %spritemapEntry(1, $43D8, $E8, 0, 0, 2, 0, $140)
    %spritemapEntry(1, $43E8, $E8, 0, 0, 2, 0, $142)
    %spritemapEntry(1, $43E8, $D8, 0, 0, 2, 0, $122)

Spritemap_BabyMetroid_1:
    dw $001E
    %spritemapEntry(1, $4200, $08, 0, 1, 2, 0, $14E)
    %spritemapEntry(1, $43F0, $08, 0, 0, 2, 0, $14E)
    %spritemapEntry(1, $4218, $08, 0, 1, 2, 0, $145)
    %spritemapEntry(1, $4210, $08, 0, 1, 2, 0, $12E)
    %spritemapEntry(1, $43E0, $08, 0, 0, 2, 0, $12E)
    %spritemapEntry(1, $43D8, $08, 0, 0, 2, 0, $145)
    %spritemapEntry(0, $0D, $28, 0, 1, 2, 0, $130)
    %spritemapEntry(0, $1EB, $28, 0, 0, 2, 0, $130)
    %spritemapEntry(1, $4200, $18, 0, 1, 2, 0, $102)
    %spritemapEntry(1, $4210, $18, 0, 1, 2, 0, $100)
    %spritemapEntry(1, $43F0, $18, 0, 0, 2, 0, $102)
    %spritemapEntry(1, $43E0, $18, 0, 0, 2, 0, $100)
    %spritemapEntry(1, $4200, $F8, 0, 1, 2, 0, $128)
    %spritemapEntry(1, $43F0, $F8, 0, 0, 2, 0, $128)
    %spritemapEntry(1, $4208, $F8, 0, 1, 2, 0, $127)
    %spritemapEntry(1, $4218, $F8, 0, 1, 2, 0, $125)
    %spritemapEntry(1, $43E8, $F8, 0, 0, 2, 0, $127)
    %spritemapEntry(1, $43D8, $F8, 0, 0, 2, 0, $125)
    %spritemapEntry(1, $4200, $E8, 0, 1, 2, 0, $143)
    %spritemapEntry(1, $4200, $D8, 0, 1, 2, 0, $123)
    %spritemapEntry(1, $43F0, $E8, 0, 0, 2, 0, $143)
    %spritemapEntry(1, $43F0, $D8, 0, 0, 2, 0, $123)
    %spritemapEntry(1, $4218, $E8, 0, 1, 2, 0, $140)
    %spritemapEntry(1, $4208, $E8, 0, 1, 2, 0, $142)
    %spritemapEntry(1, $4208, $D8, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $43E8, $E8, 0, 0, 2, 0, $142)
    %spritemapEntry(1, $43E8, $D8, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $43D8, $E8, 0, 0, 2, 0, $140)
    %spritemapEntry(0, $18, $E0, 0, 1, 2, 0, $131)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 2, 0, $131)

Spritemap_BabyMetroid_2:
    dw $001E
    %spritemapEntry(1, $4208, $F8, 0, 1, 2, 0, $127)
    %spritemapEntry(1, $43E8, $F8, 0, 0, 2, 0, $127)
    %spritemapEntry(0, $15, $28, 0, 1, 2, 0, $121)
    %spritemapEntry(0, $1E3, $28, 0, 0, 2, 0, $121)
    %spritemapEntry(1, $4200, $18, 0, 1, 2, 0, $14C)
    %spritemapEntry(1, $4210, $18, 0, 1, 2, 0, $14A)
    %spritemapEntry(1, $4200, $08, 0, 1, 2, 0, $12C)
    %spritemapEntry(1, $4210, $08, 0, 1, 2, 0, $12A)
    %spritemapEntry(1, $43F0, $18, 0, 0, 2, 0, $14C)
    %spritemapEntry(1, $43E0, $18, 0, 0, 2, 0, $14A)
    %spritemapEntry(1, $43F0, $08, 0, 0, 2, 0, $12C)
    %spritemapEntry(1, $43E0, $08, 0, 0, 2, 0, $12A)
    %spritemapEntry(1, $4218, $08, 0, 1, 2, 0, $145)
    %spritemapEntry(1, $43D8, $08, 0, 0, 2, 0, $145)
    %spritemapEntry(1, $4200, $F8, 0, 1, 2, 0, $128)
    %spritemapEntry(1, $43F0, $F8, 0, 0, 2, 0, $128)
    %spritemapEntry(1, $4218, $F8, 0, 1, 2, 0, $125)
    %spritemapEntry(1, $43D8, $F8, 0, 0, 2, 0, $125)
    %spritemapEntry(0, $18, $E0, 0, 1, 2, 0, $131)
    %spritemapEntry(0, $1E0, $E0, 0, 0, 2, 0, $131)
    %spritemapEntry(1, $4200, $E8, 0, 1, 2, 0, $143)
    %spritemapEntry(1, $4200, $D8, 0, 1, 2, 0, $123)
    %spritemapEntry(1, $43F0, $E8, 0, 0, 2, 0, $143)
    %spritemapEntry(1, $43F0, $D8, 0, 0, 2, 0, $123)
    %spritemapEntry(1, $4208, $E8, 0, 1, 2, 0, $142)
    %spritemapEntry(1, $4208, $D8, 0, 1, 2, 0, $122)
    %spritemapEntry(1, $43E8, $E8, 0, 0, 2, 0, $142)
    %spritemapEntry(1, $43E8, $D8, 0, 0, 2, 0, $122)
    %spritemapEntry(1, $4218, $E8, 0, 1, 2, 0, $140)
    %spritemapEntry(1, $43D8, $E8, 0, 0, 2, 0, $140)


Freespace_BankA9_FB70:
; $490 bytes
